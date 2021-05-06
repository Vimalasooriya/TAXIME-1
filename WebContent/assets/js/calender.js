document.addEventListener( 'DOMContentLoaded', function() {

    'use strict';
  
    //==========================================================================================
    //
    // Reference:
    // https://codepen.io/flashadicts/pen/tuCef
    //
    //==========================================================================================
  
    //--------------------------------------------------
    // Define global variables
    // グローバル変数を定義
    //--------------------------------------------------
    var months    = [ 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' ];
    var noOfDays  = [ '31', '29', '31', '30', '31', '30', '31', '31', '30', '31', '30', '31' ];
    var dayOfWeek = [ 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'  ];
  
    //--------------------------------------------------------------------------------
    // Add method to Date objects for setting to the previous month
    // Dateオブジェクトに一月前の１日をセットするメソッドを追加
    //--------------------------------------------------------------------------------
    Date.prototype.setPrevMonth = function() {
      this.setDate( 1 );
      this.setMonth( this.getMonth() - 1 );
    }
  
    //--------------------------------------------------------------------------------
    // Add method to Date objects for setting to this month
    // Dateオブジェクトにその月の１日をセットするメソッドを追加
    //--------------------------------------------------------------------------------
    Date.prototype.setThisMonth = function() {
      this.setDate( 1 );
      this.setMonth( this.getMonth() );
    }
  
    //--------------------------------------------------------------------------------
    // Add method to Date objects for setting to the next month
    // Dateオブジェクトに一月先の１日をセットするメソッドを追加
    //--------------------------------------------------------------------------------
    Date.prototype.setNextMonth = function() {
      this.setDate( 1 );
      this.setMonth( this.getMonth() + 1 );
    }
  
    //--------------------------------------------------------------------------------
    // Add method to Date objects for getting the first day of the month
    // Dateオブジェクトに月の最初の曜日を取得するメソッドを追加
    //--------------------------------------------------------------------------------
    Date.prototype.getStartDay = function() {
      return ( new Date( this.getFullYear(), this.getMonth(), 1 ) ).getDay();
    }
  
    //--------------------------------------------------------------------------------
    // Add method to Date objects for getting the number of days in any month
    // Dateオブジェクトに月の日数を取得するメソッドを追加
    //
    // Reference:
    // http://stackoverflow.com/questions/1810984/number-of-days-in-any-month
    //--------------------------------------------------------------------------------
    Date.prototype.getDaysInMonth = function() {
      var month = this.getMonth() + 1;
      var year  = this.getFullYear();
      return month === 2 ? ( year % 4 || ! (year % 100 ) && ( year % 400 ) ) ? 28 : 29 : 30 + ( month + ( month >> 3 ) & 1 );
    }
  
    //--------------------------------------------------------------------------------
    // 先月・今月・来月のカレンダー用li要素を追加する
    //--------------------------------------------------------------------------------
    function addListElementForMonth( element, childElementClassName, dateObj ) {
  
      var date = new Date( dateObj.getFullYear(), dateObj.getMonth(), 1 );
  
      var day = date.getDay();
  
      var childElement = element.getElementsByClassName( childElementClassName )[0];
  
      // 子要素を空にする
      var insertedHTML = '';
  
      // 同時に表示させる先月分のデータを取得してli要素を追加
      for ( var i = 0, days = date.getStartDay(); i < days; i++ ) {
        insertedHTML += '<li></li>';
      }
  
      // 今月分のli要素を追加
      for ( var i = 1, days = date.getDaysInMonth(); i <= days; i++ ) {
        var addClassName = 'month-date ' + i + ' ' + dayOfWeek[ ( i - 1 + day ) % 7 ];
        insertedHTML += '<li class="' + addClassName + '">' + i + '</li>';
      }
  
      // dateオブジェクトを来月にセット
      date.setMonth( date.getMonth() + 1 );
  
      // 同時に表示させる来来月分のデータを取得してli要素を追加
      for ( var i = date.getStartDay(); i < 7; i++ ) {
        insertedHTML += '<li></li>';
      }
  
      childElement.innerHTML = insertedHTML;
  
    }
  
    //--------------------------------------------------------------------------------
    // 先月の月名と年をテキストノードに挿入する
    //--------------------------------------------------------------------------------
    function setMonthAndYear( element, childElementClassName, dateObj ) {
      element.getElementsByClassName( childElementClassName )[0].innerText = months[ dateObj.getMonth() ] + ' ' + dateObj.getFullYear();
    }
  
  
    //--------------------------------------------------------------------------------
    // カレンダーを生成する
    //--------------------------------------------------------------------------------
    function makeMonthCalender( element, monthAndYearClassName, dateClassName, dateObj ) {
      // 月名と年を表示
      setMonthAndYear( element, monthAndYearClassName, dateObj );
      // カレンダー用li要素を追加
      addListElementForMonth( element, dateClassName, dateObj );
    }
  
    //--------------------------------------------------------------------------------
    // イベントに曜日と日を表示させる
    //--------------------------------------------------------------------------------
    function setEventDayAndDate( element, dayElementClassName, dateElementClassName, dateObj ) {
      var date = dateObj.getDate();
      var dow  = dayOfWeek[ dateObj.getDay() ];
      element.getElementsByClassName(  dayElementClassName )[0].innerText = dow;
      element.getElementsByClassName( dateElementClassName )[0].innerText = date;
      element.classList.remove( 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday' );
      element.classList.add( dow );
    }
  
    //--------------------------------------------------------------------------------
    // イベントに表示中の日をカレンダーの中で強調表示する
    //--------------------------------------------------------------------------------
    function addCurrentClass( element, className, dateObj ) {
      if ( element.getElementsByClassName( className )[0] ) {
        element.getElementsByClassName( className )[0].classList.remove( className );
      }
      element.getElementsByClassName( dateObj.getDate() )[0].classList.add( className );    
    }
  
    //--------------------------------------------------------------------------------
    // Main Part
    //--------------------------------------------------------------------------------
  
    // 今日のDateオブジェクトを生成
    var today = new Date();
  
    // 現在表示中のDateオブジェクトを生成
    var currentDate = new Date();
  
    // 遡ってデータを取得できる限界日のDateオブジェクトを生成
    // この日以降のカレンダーを生成し、デフォルトでは今月のカレンダーを表示させる
    var startDate = new Date( 2015, 4,  1 );
  
    // 進めてデータを取得できる限界日のDateオブジェクトを生成
    // この日までのカレンダーを生成し、デフォルトでは今月のカレンダーを表示させる
    var endDate   = new Date( 2016, 3, 31 );
  
  
    // イベント用各要素を取得
    var prevDateElement = document.getElementById( 'event_card_prev_day' );
    var thisDateElement = document.getElementById( 'event_card_this_day' );
    var nextDateElement = document.getElementById( 'event_card_next_day' );
  
    // カレンダー用各要素を取得
    var prevMonthElement = document.getElementById( 'prev_month' );
    var thisMonthElement = document.getElementById( 'this_month' );
    var nextMonthElement = document.getElementById( 'next_month' );
  
    // 先月分のカレンダーを生成
    currentDate.setPrevMonth();
    makeMonthCalender( prevMonthElement, 'month-and-year', 'all-date', currentDate );
  
    // 今月分のカレンダーを生成
    currentDate.setNextMonth();
    makeMonthCalender( thisMonthElement, 'month-and-year', 'all-date', currentDate );
  
    // 来月分のカレンダーを生成
    currentDate.setNextMonth();
    makeMonthCalender( nextMonthElement, 'month-and-year', 'all-date', currentDate );
  
    /// 一月進んだ分を戻す
    currentDate.setPrevMonth();
  
    // eventページに昨日の曜日と日を表示
    currentDate.setDate( today.getDate() - 1 );
    setEventDayAndDate( prevDateElement, 'event-day', 'event-date', currentDate );
  
    // eventページに明日の曜日と日を表示
    currentDate.setDate( today.getDate() + 1 );
    setEventDayAndDate( nextDateElement, 'event-day', 'event-date', currentDate );
  
    // eventページに今日の曜日と日を表示
    currentDate.setDate( today.getDate() );
    setEventDayAndDate( thisDateElement, 'event-day', 'event-date', currentDate );
  
    // イベントに表示中の日をカレンダーの中で強調表示する
    addCurrentClass( thisMonthElement, 'current', currentDate );
  
  
  
  
  /*
  var dayCount = 0;
  
  for ( var i = 0; i < 42; i++ ) {
    // 今月の最初の日以降については
    if ( i >= today.startDay ) {
      dayCount++;
      if ( dayCount > totalDays ){
        dayCount = 1;
        flag = false;
      }
      if ( flag == true ) {
        jQuery( '.all-date' ).append( '<li class="month-date">' + dayCount + '</li>' );
      } else {
        jQuery( '.all-date' ).append( '<li style="opacity:.8"></li>' );
      }
    } else {
      jQuery( '.all-date' ).append( '<li style="opacity:.8"></li>' );
      precounter++;
    }
    
    if(i==rightbox){
      jQuery(jQuery('.all-date li')[rightbox]).addClass("b-right");
      rightbox = rightbox+7;
    }
    
  
    if(i>34){
      jQuery(jQuery('.all-date li')[i]).addClass("b-bottom");
    }
  
    
    if((jQuery(jQuery('.all-date li')[i]).text()==curDate) && (jQuery(jQuery('.all-date li')[i]).css('opacity') == 1)){
      jQuery(jQuery('.all-date li')[i]).addClass( 'current' );
    }
  }
  */
  
  
  
  
  
  
    //==========================================================================================
    //
    // ホイールイベントの取得
    //
    // eventページでホイールイベントを感知したら、次の日のカードを表示させる
    // calenderページでホイールイベントを感知したら、次の月のカレンダーを表示させる
    //
    //
    // Reference:
    // https://w3g.jp/blog/wheelevent_crossbrowser
    //
    //
    //  var mousewheelevent = 'onwheel' in document ? 'wheel' : 'onmousewheel' in document ? 'mousewheel' : 'DOMMouseScroll';
    //  try {
    //  	document.addEventListener( mousewheelevent, onWheel, false );
    //  } catch ( ev ) {
    //  	//for legacy IE
    //  	document.attachEvent( 'onmousewheel', onWheel) ;
    //  }
    //  function onWheel( ev ) {
    //  	if ( ! ev ) ev = window.event; //for legacy IE
    //  	var delta = ev.deltaY ? - ( ev.deltaY ) : ev.wheelDelta ? ev.wheelDelta: - ( ev.detail );
    //  	//下にスクロールした場合の処理
    //  	if ( delta < 0 ) {
    //  		ev.preventDefault();
    //  		console.log( 'scroll down: ' + delta );
    //  	//上にスクロールした場合の処理
    //  	} else if ( delta > 0 ) {
    //  		ev.preventDefault();
    //  		console.log( 'scroll up: ' + delta );
    //  	}
    //  }
    //
    //
    //==========================================================================================
    var mousewheelevent = 'onwheel' in document ? 'wheel' : 'onmousewheel' in document ? 'mousewheel' : 'DOMMouseScroll';
  
      document.getElementById(    'event_container' ).addEventListener( mousewheelevent, onWheelEvent,    false );
      document.getElementById( 'calender_container' ).addEventListener( mousewheelevent, onWheelCalender, false );
  
  
    var translationY = 0;
    var wheelWeightFactor = 10;
  
    var displayPrev = today.date - 1;
    var displayDate = today.date;
    var displayNext = today.date + 1;
  
    var dayShift = 0;
  
    function onWheelEvent( ev ) {
  
      ev.preventDefault();
  
        var delta = ev.deltaY ? - ( ev.deltaY ) : ev.wheelDelta ? ev.wheelDelta: - ( ev.detail );
  
      // ホイール量のthresholdを設定する（ホイール量が微少量の場合は何もしない）
      if ( Math.abs( delta ) < 3 ) return true;
  
      translationY += delta / wheelWeightFactor;
  
      prevMonthElement.style.webkitTransform = 'translateY( -100% )';
      thisMonthElement.style.webkitTransform = 'translateY( -100% )';
      nextMonthElement.style.webkitTransform = 'translateY( -100% )';
  
      // 下にスワイプしたときの処理（前の日に戻る）
      if ( translationY <= -100 ) {
  
        translationY = 0;
  
        prevDateElement.style.height = '0';
        thisDateElement.style.height = '100%';
        nextDateElement.style.height = '100%';
  
        // イベントで現在表示中の日のカレンダーを生成
        setEventDayAndDate( nextDateElement, 'event-day', 'event-date', currentDate );
        // イベントで現在表示中の日から一つ前の日のカレンダーを生成
        currentDate.setDate( currentDate.getDate() - 1 );
        setEventDayAndDate( thisDateElement, 'event-day', 'event-date', currentDate );
        // イベントで現在表示中の日から二つ前の日のカレンダーを生成
        currentDate.setDate( currentDate.getDate() - 1 );
        setEventDayAndDate( prevDateElement, 'event-day', 'event-date', currentDate );
        // currentDateオブジェクトを前の日に設定
        currentDate.setDate( currentDate.getDate() + 1 );
  
        if ( currentDate.getDate() === currentDate.getDaysInMonth() ) {
  
          // 現在表示中の月のカレンダーを生成
          currentDate.setNextMonth();
          makeMonthCalender( nextMonthElement, 'month-and-year', 'all-date', currentDate );
          // 現在表示中の月から一つ前の月のカレンダーを生成
          currentDate.setPrevMonth();
          makeMonthCalender( thisMonthElement, 'month-and-year', 'all-date', currentDate );
          // 現在表示中の月から二つ前の月のカレンダーを生成
          currentDate.setPrevMonth();
          makeMonthCalender( prevMonthElement, 'month-and-year', 'all-date', currentDate );
          // currentDateオブジェクトを前の月に設定
          currentDate.setNextMonth();
          currentDate.setDate( currentDate.getDaysInMonth() );
        }
  
        // イベントに表示中の日をカレンダーの中で強調表示する
        addCurrentClass( thisMonthElement, 'current', currentDate );
  
      } else if ( -100 < translationY && translationY <= 0 ) {
  
        prevDateElement.style.height = - translationY + '%';
        thisDateElement.style.height = '100%';
  
      } else if ( 0 < translationY && translationY <= 100 ) {
  
        prevDateElement.style.height = '0';
        thisDateElement.style.height = ( 100 - translationY ) + '%';
  
      // 上にスワイプしたときの処理（次の日に進む）
        } else if ( 100 < translationY ) {
  
        translationY = 0;
  
        prevDateElement.style.height = '0';
        thisDateElement.style.height = '100%';
        nextDateElement.style.height = '100%';
  
        // eventページに現在表示中の日の曜日と日付を表示
        setEventDayAndDate( prevDateElement, 'event-day', 'event-date', currentDate );
        // eventページに現在表示中の日の一つ次の日の曜日と日付を表示
        currentDate.setDate( currentDate.getDate() + 1 );
        setEventDayAndDate( thisDateElement, 'event-day', 'event-date', currentDate );
        // eventページに現在表示中の日の二つ次の日の曜日と日付を表示
        currentDate.setDate( currentDate.getDate() + 1 );
        setEventDayAndDate( nextDateElement, 'event-day', 'event-date', currentDate );
        // currentDateオブジェクトを次の日に設定（二つ次の日に設定したので一日分戻している）
        currentDate.setDate( currentDate.getDate() - 1 );
  
        if ( currentDate.getDate() === 1 ) {
  
          // 現在表示中の月のカレンダーを生成
          currentDate.setPrevMonth();
          makeMonthCalender( prevMonthElement, 'month-and-year', 'all-date', currentDate );
          // 現在表示中の月から一つ次の月のカレンダーを生成
          currentDate.setNextMonth();
          makeMonthCalender( thisMonthElement, 'month-and-year', 'all-date', currentDate );
          // 現在表示中の月から二つ次の月のカレンダーを生成
          currentDate.setNextMonth();
          makeMonthCalender( nextMonthElement, 'month-and-year', 'all-date', currentDate );
          // currentDateオブジェクトを次の月に設定（二つ次の月に設定したので一月分戻している）
          currentDate.setPrevMonth();
          currentDate.setDate( 1 );
        }
  
        // イベントに表示中の日をカレンダーの中で強調表示する
        addCurrentClass( thisMonthElement, 'current', currentDate );
  
        }
  
    }
  
  
  
    function onWheelCalender( ev ) {
  
      ev.preventDefault();
  
        var delta = ev.deltaY ? - ( ev.deltaY ) : ev.wheelDelta ? ev.wheelDelta: - ( ev.detail );
  
      // ホイール量のthresholdを設定する（ホイール量が微少量の場合は何もしない）
      if ( Math.abs( delta ) < 2 ) return true;
  
      translationY += delta / wheelWeightFactor;
  
      // 下にスワイプしたときの処理（前の月に戻る）
      if ( translationY <= -100 ) {
  
        // 一旦スワイプを停止する役割をもつ
        translationY = 0;
  
        prevMonthElement.style.webkitTransform = 'translateY( -100% )';
        thisMonthElement.style.webkitTransform = 'translateY( -100% )';
        nextMonthElement.style.webkitTransform = 'translateY( -100% )';
  
        // 現在表示中の月のカレンダーを生成
        makeMonthCalender( nextMonthElement, 'month-and-year', 'all-date', currentDate );
        // 現在表示中の月から一つ前の月のカレンダーを生成
        currentDate.setPrevMonth();
        makeMonthCalender( thisMonthElement, 'month-and-year', 'all-date', currentDate );
        // 現在表示中の月から二つ前の月のカレンダーを生成
        currentDate.setPrevMonth();
        makeMonthCalender( prevMonthElement, 'month-and-year', 'all-date', currentDate );
        // currentDateオブジェクトを前の月に設定
        currentDate.setNextMonth();
  
        prevDateElement.style.height = '0';
        thisDateElement.style.height = '100%';
        nextDateElement.style.height = '100%';
  
        // eventページに前の月の最後の日の曜日と日付を表示
        currentDate.setDate( currentDate.getDate() - 1 );
        setEventDayAndDate( prevDateElement, 'event-day', 'event-date', currentDate );
        // eventページにその月の１日の曜日と日付を表示
        currentDate.setDate( currentDate.getDate() + 1 );
        setEventDayAndDate( thisDateElement, 'event-day', 'event-date', currentDate );
        // eventページにその月の２日の曜日と日付を表示
        currentDate.setDate( currentDate.getDate() + 1 );
        setEventDayAndDate( nextDateElement, 'event-day', 'event-date', currentDate );
        // currentDateオブジェクトを１日に設定
        currentDate.setDate( currentDate.getDate() - 1 );
  
        // イベントに表示中の日をカレンダーの中で強調表示する
        addCurrentClass( thisMonthElement, 'current', currentDate );
  
  
      } else if ( -100 < translationY && translationY <= 100 ) {
  
        prevMonthElement.style.webkitTransform = 'translateY(' + ( - 100 - translationY ) + '% )';
        thisMonthElement.style.webkitTransform = 'translateY(' + ( - 100 - translationY ) + '% )';
        nextMonthElement.style.webkitTransform = 'translateY(' + ( - 100 - translationY ) + '% )';
  
      // 上にスワイプしたときの処理（次の月に進む）
        } else if ( 100 < translationY ) {
  
        // 一旦スワイプを停止する役割をもつ
        translationY = 0;
  
        prevMonthElement.style.webkitTransform = 'translateY( -100% )';
        thisMonthElement.style.webkitTransform = 'translateY( -100% )';
        nextMonthElement.style.webkitTransform = 'translateY( -100% )';
  
        // 現在表示中の月のカレンダーを生成
        makeMonthCalender( prevMonthElement, 'month-and-year', 'all-date', currentDate );
        // 現在表示中の月から一つ次の月のカレンダーを生成
        currentDate.setNextMonth();
        makeMonthCalender( thisMonthElement, 'month-and-year', 'all-date', currentDate );
        // 現在表示中の月から二つ次の月のカレンダーを生成
        currentDate.setNextMonth();
        makeMonthCalender( nextMonthElement, 'month-and-year', 'all-date', currentDate );
        // currentDateオブジェクトを次の月に設定（二つ次の月に設定したので一月分戻している）
        currentDate.setPrevMonth();
  
        prevDateElement.style.height = '0';
        thisDateElement.style.height = '100%';
        nextDateElement.style.height = '100%';
  
        // eventページに前の月の最後の日の曜日と日付を表示
        currentDate.setDate( currentDate.getDate() - 1 );
        setEventDayAndDate( prevDateElement, 'event-day', 'event-date', currentDate );
        // eventページにその月の１日の曜日と日付を表示
        currentDate.setDate( currentDate.getDate() + 1 );
        setEventDayAndDate( thisDateElement, 'event-day', 'event-date', currentDate );
        // eventページにその月の２日の曜日と日付を表示
        currentDate.setDate( currentDate.getDate() + 1 );
        setEventDayAndDate( nextDateElement, 'event-day', 'event-date', currentDate );
        // currentDateオブジェクトを１日に設定
        currentDate.setDate( currentDate.getDate() - 1 );
  
        // イベントに表示中の日をカレンダーの中で強調表示する
        addCurrentClass( thisMonthElement, 'current', currentDate );
  
        }
  
    }
  
  });
  