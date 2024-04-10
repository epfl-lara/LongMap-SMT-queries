; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38084 () Bool)

(assert start!38084)

(declare-fun b_free!9009 () Bool)

(declare-fun b_next!9009 () Bool)

(assert (=> start!38084 (= b_free!9009 (not b_next!9009))))

(declare-fun tp!31802 () Bool)

(declare-fun b_and!16347 () Bool)

(assert (=> start!38084 (= tp!31802 b_and!16347)))

(declare-fun b!392295 () Bool)

(declare-fun e!237559 () Bool)

(declare-fun e!237563 () Bool)

(declare-fun mapRes!16110 () Bool)

(assert (=> b!392295 (= e!237559 (and e!237563 mapRes!16110))))

(declare-fun condMapEmpty!16110 () Bool)

(declare-datatypes ((V!14013 0))(
  ( (V!14014 (val!4885 Int)) )
))
(declare-datatypes ((ValueCell!4497 0))(
  ( (ValueCellFull!4497 (v!7114 V!14013)) (EmptyCell!4497) )
))
(declare-datatypes ((array!23267 0))(
  ( (array!23268 (arr!11094 (Array (_ BitVec 32) ValueCell!4497)) (size!11446 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23267)

(declare-fun mapDefault!16110 () ValueCell!4497)

(assert (=> b!392295 (= condMapEmpty!16110 (= (arr!11094 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4497)) mapDefault!16110)))))

(declare-fun b!392297 () Bool)

(declare-fun e!237560 () Bool)

(declare-fun e!237565 () Bool)

(assert (=> b!392297 (= e!237560 (not e!237565))))

(declare-fun res!224660 () Bool)

(assert (=> b!392297 (=> res!224660 e!237565)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!392297 (= res!224660 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6588 0))(
  ( (tuple2!6589 (_1!3305 (_ BitVec 64)) (_2!3305 V!14013)) )
))
(declare-datatypes ((List!6441 0))(
  ( (Nil!6438) (Cons!6437 (h!7293 tuple2!6588) (t!11607 List!6441)) )
))
(declare-datatypes ((ListLongMap!5501 0))(
  ( (ListLongMap!5502 (toList!2766 List!6441)) )
))
(declare-fun lt!185340 () ListLongMap!5501)

(declare-fun zeroValue!472 () V!14013)

(declare-datatypes ((array!23269 0))(
  ( (array!23270 (arr!11095 (Array (_ BitVec 32) (_ BitVec 64))) (size!11447 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23269)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!14013)

(declare-fun getCurrentListMap!2108 (array!23269 array!23267 (_ BitVec 32) (_ BitVec 32) V!14013 V!14013 (_ BitVec 32) Int) ListLongMap!5501)

(assert (=> b!392297 (= lt!185340 (getCurrentListMap!2108 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185342 () ListLongMap!5501)

(declare-fun lt!185345 () array!23267)

(declare-fun lt!185346 () array!23269)

(assert (=> b!392297 (= lt!185342 (getCurrentListMap!2108 lt!185346 lt!185345 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185338 () ListLongMap!5501)

(declare-fun lt!185343 () ListLongMap!5501)

(assert (=> b!392297 (and (= lt!185338 lt!185343) (= lt!185343 lt!185338))))

(declare-fun v!373 () V!14013)

(declare-fun lt!185344 () ListLongMap!5501)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!1061 (ListLongMap!5501 tuple2!6588) ListLongMap!5501)

(assert (=> b!392297 (= lt!185343 (+!1061 lt!185344 (tuple2!6589 k0!778 v!373)))))

(declare-datatypes ((Unit!12006 0))(
  ( (Unit!12007) )
))
(declare-fun lt!185339 () Unit!12006)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!272 (array!23269 array!23267 (_ BitVec 32) (_ BitVec 32) V!14013 V!14013 (_ BitVec 32) (_ BitVec 64) V!14013 (_ BitVec 32) Int) Unit!12006)

(assert (=> b!392297 (= lt!185339 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!272 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!988 (array!23269 array!23267 (_ BitVec 32) (_ BitVec 32) V!14013 V!14013 (_ BitVec 32) Int) ListLongMap!5501)

(assert (=> b!392297 (= lt!185338 (getCurrentListMapNoExtraKeys!988 lt!185346 lt!185345 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392297 (= lt!185345 (array!23268 (store (arr!11094 _values!506) i!548 (ValueCellFull!4497 v!373)) (size!11446 _values!506)))))

(assert (=> b!392297 (= lt!185344 (getCurrentListMapNoExtraKeys!988 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392298 () Bool)

(declare-fun tp_is_empty!9681 () Bool)

(assert (=> b!392298 (= e!237563 tp_is_empty!9681)))

(declare-fun lt!185341 () tuple2!6588)

(declare-fun e!237561 () Bool)

(declare-fun b!392299 () Bool)

(assert (=> b!392299 (= e!237561 (= lt!185342 (+!1061 lt!185343 lt!185341)))))

(declare-fun b!392300 () Bool)

(declare-fun res!224662 () Bool)

(declare-fun e!237564 () Bool)

(assert (=> b!392300 (=> (not res!224662) (not e!237564))))

(declare-fun arrayContainsKey!0 (array!23269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!392300 (= res!224662 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!392301 () Bool)

(assert (=> b!392301 (= e!237564 e!237560)))

(declare-fun res!224659 () Bool)

(assert (=> b!392301 (=> (not res!224659) (not e!237560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23269 (_ BitVec 32)) Bool)

(assert (=> b!392301 (= res!224659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185346 mask!970))))

(assert (=> b!392301 (= lt!185346 (array!23270 (store (arr!11095 _keys!658) i!548 k0!778) (size!11447 _keys!658)))))

(declare-fun b!392302 () Bool)

(declare-fun res!224667 () Bool)

(assert (=> b!392302 (=> (not res!224667) (not e!237564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!392302 (= res!224667 (validKeyInArray!0 k0!778))))

(declare-fun b!392303 () Bool)

(declare-fun res!224665 () Bool)

(assert (=> b!392303 (=> (not res!224665) (not e!237564))))

(assert (=> b!392303 (= res!224665 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11447 _keys!658))))))

(declare-fun b!392304 () Bool)

(declare-fun res!224658 () Bool)

(assert (=> b!392304 (=> (not res!224658) (not e!237564))))

(assert (=> b!392304 (= res!224658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!392305 () Bool)

(declare-fun res!224666 () Bool)

(assert (=> b!392305 (=> (not res!224666) (not e!237564))))

(assert (=> b!392305 (= res!224666 (or (= (select (arr!11095 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11095 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!224664 () Bool)

(assert (=> start!38084 (=> (not res!224664) (not e!237564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38084 (= res!224664 (validMask!0 mask!970))))

(assert (=> start!38084 e!237564))

(declare-fun array_inv!8148 (array!23267) Bool)

(assert (=> start!38084 (and (array_inv!8148 _values!506) e!237559)))

(assert (=> start!38084 tp!31802))

(assert (=> start!38084 true))

(assert (=> start!38084 tp_is_empty!9681))

(declare-fun array_inv!8149 (array!23269) Bool)

(assert (=> start!38084 (array_inv!8149 _keys!658)))

(declare-fun b!392296 () Bool)

(assert (=> b!392296 (= e!237565 (= lt!185340 (+!1061 lt!185344 lt!185341)))))

(assert (=> b!392296 e!237561))

(declare-fun res!224657 () Bool)

(assert (=> b!392296 (=> (not res!224657) (not e!237561))))

(assert (=> b!392296 (= res!224657 (= lt!185342 (+!1061 lt!185338 lt!185341)))))

(assert (=> b!392296 (= lt!185341 (tuple2!6589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!392306 () Bool)

(declare-fun res!224663 () Bool)

(assert (=> b!392306 (=> (not res!224663) (not e!237564))))

(declare-datatypes ((List!6442 0))(
  ( (Nil!6439) (Cons!6438 (h!7294 (_ BitVec 64)) (t!11608 List!6442)) )
))
(declare-fun arrayNoDuplicates!0 (array!23269 (_ BitVec 32) List!6442) Bool)

(assert (=> b!392306 (= res!224663 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6439))))

(declare-fun b!392307 () Bool)

(declare-fun e!237558 () Bool)

(assert (=> b!392307 (= e!237558 tp_is_empty!9681)))

(declare-fun mapNonEmpty!16110 () Bool)

(declare-fun tp!31803 () Bool)

(assert (=> mapNonEmpty!16110 (= mapRes!16110 (and tp!31803 e!237558))))

(declare-fun mapValue!16110 () ValueCell!4497)

(declare-fun mapRest!16110 () (Array (_ BitVec 32) ValueCell!4497))

(declare-fun mapKey!16110 () (_ BitVec 32))

(assert (=> mapNonEmpty!16110 (= (arr!11094 _values!506) (store mapRest!16110 mapKey!16110 mapValue!16110))))

(declare-fun b!392308 () Bool)

(declare-fun res!224656 () Bool)

(assert (=> b!392308 (=> (not res!224656) (not e!237560))))

(assert (=> b!392308 (= res!224656 (arrayNoDuplicates!0 lt!185346 #b00000000000000000000000000000000 Nil!6439))))

(declare-fun mapIsEmpty!16110 () Bool)

(assert (=> mapIsEmpty!16110 mapRes!16110))

(declare-fun b!392309 () Bool)

(declare-fun res!224661 () Bool)

(assert (=> b!392309 (=> (not res!224661) (not e!237564))))

(assert (=> b!392309 (= res!224661 (and (= (size!11446 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11447 _keys!658) (size!11446 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!38084 res!224664) b!392309))

(assert (= (and b!392309 res!224661) b!392304))

(assert (= (and b!392304 res!224658) b!392306))

(assert (= (and b!392306 res!224663) b!392303))

(assert (= (and b!392303 res!224665) b!392302))

(assert (= (and b!392302 res!224667) b!392305))

(assert (= (and b!392305 res!224666) b!392300))

(assert (= (and b!392300 res!224662) b!392301))

(assert (= (and b!392301 res!224659) b!392308))

(assert (= (and b!392308 res!224656) b!392297))

(assert (= (and b!392297 (not res!224660)) b!392296))

(assert (= (and b!392296 res!224657) b!392299))

(assert (= (and b!392295 condMapEmpty!16110) mapIsEmpty!16110))

(assert (= (and b!392295 (not condMapEmpty!16110)) mapNonEmpty!16110))

(get-info :version)

(assert (= (and mapNonEmpty!16110 ((_ is ValueCellFull!4497) mapValue!16110)) b!392307))

(assert (= (and b!392295 ((_ is ValueCellFull!4497) mapDefault!16110)) b!392298))

(assert (= start!38084 b!392295))

(declare-fun m!388691 () Bool)

(assert (=> b!392308 m!388691))

(declare-fun m!388693 () Bool)

(assert (=> b!392304 m!388693))

(declare-fun m!388695 () Bool)

(assert (=> b!392297 m!388695))

(declare-fun m!388697 () Bool)

(assert (=> b!392297 m!388697))

(declare-fun m!388699 () Bool)

(assert (=> b!392297 m!388699))

(declare-fun m!388701 () Bool)

(assert (=> b!392297 m!388701))

(declare-fun m!388703 () Bool)

(assert (=> b!392297 m!388703))

(declare-fun m!388705 () Bool)

(assert (=> b!392297 m!388705))

(declare-fun m!388707 () Bool)

(assert (=> b!392297 m!388707))

(declare-fun m!388709 () Bool)

(assert (=> b!392301 m!388709))

(declare-fun m!388711 () Bool)

(assert (=> b!392301 m!388711))

(declare-fun m!388713 () Bool)

(assert (=> start!38084 m!388713))

(declare-fun m!388715 () Bool)

(assert (=> start!38084 m!388715))

(declare-fun m!388717 () Bool)

(assert (=> start!38084 m!388717))

(declare-fun m!388719 () Bool)

(assert (=> b!392306 m!388719))

(declare-fun m!388721 () Bool)

(assert (=> b!392300 m!388721))

(declare-fun m!388723 () Bool)

(assert (=> b!392302 m!388723))

(declare-fun m!388725 () Bool)

(assert (=> b!392296 m!388725))

(declare-fun m!388727 () Bool)

(assert (=> b!392296 m!388727))

(declare-fun m!388729 () Bool)

(assert (=> mapNonEmpty!16110 m!388729))

(declare-fun m!388731 () Bool)

(assert (=> b!392299 m!388731))

(declare-fun m!388733 () Bool)

(assert (=> b!392305 m!388733))

(check-sat tp_is_empty!9681 (not b!392306) b_and!16347 (not b!392304) (not mapNonEmpty!16110) (not b!392302) (not b!392297) (not b!392308) (not start!38084) (not b!392296) (not b!392300) (not b!392299) (not b_next!9009) (not b!392301))
(check-sat b_and!16347 (not b_next!9009))
(get-model)

(declare-fun b!392365 () Bool)

(declare-fun e!237599 () Bool)

(declare-fun call!27679 () Bool)

(assert (=> b!392365 (= e!237599 call!27679)))

(declare-fun d!73127 () Bool)

(declare-fun res!224710 () Bool)

(declare-fun e!237601 () Bool)

(assert (=> d!73127 (=> res!224710 e!237601)))

(assert (=> d!73127 (= res!224710 (bvsge #b00000000000000000000000000000000 (size!11447 lt!185346)))))

(assert (=> d!73127 (= (arrayNoDuplicates!0 lt!185346 #b00000000000000000000000000000000 Nil!6439) e!237601)))

(declare-fun b!392366 () Bool)

(declare-fun e!237598 () Bool)

(declare-fun contains!2464 (List!6442 (_ BitVec 64)) Bool)

(assert (=> b!392366 (= e!237598 (contains!2464 Nil!6439 (select (arr!11095 lt!185346) #b00000000000000000000000000000000)))))

(declare-fun b!392367 () Bool)

(declare-fun e!237600 () Bool)

(assert (=> b!392367 (= e!237601 e!237600)))

(declare-fun res!224712 () Bool)

(assert (=> b!392367 (=> (not res!224712) (not e!237600))))

(assert (=> b!392367 (= res!224712 (not e!237598))))

(declare-fun res!224711 () Bool)

(assert (=> b!392367 (=> (not res!224711) (not e!237598))))

(assert (=> b!392367 (= res!224711 (validKeyInArray!0 (select (arr!11095 lt!185346) #b00000000000000000000000000000000)))))

(declare-fun b!392368 () Bool)

(assert (=> b!392368 (= e!237600 e!237599)))

(declare-fun c!54335 () Bool)

(assert (=> b!392368 (= c!54335 (validKeyInArray!0 (select (arr!11095 lt!185346) #b00000000000000000000000000000000)))))

(declare-fun bm!27676 () Bool)

(assert (=> bm!27676 (= call!27679 (arrayNoDuplicates!0 lt!185346 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54335 (Cons!6438 (select (arr!11095 lt!185346) #b00000000000000000000000000000000) Nil!6439) Nil!6439)))))

(declare-fun b!392369 () Bool)

(assert (=> b!392369 (= e!237599 call!27679)))

(assert (= (and d!73127 (not res!224710)) b!392367))

(assert (= (and b!392367 res!224711) b!392366))

(assert (= (and b!392367 res!224712) b!392368))

(assert (= (and b!392368 c!54335) b!392369))

(assert (= (and b!392368 (not c!54335)) b!392365))

(assert (= (or b!392369 b!392365) bm!27676))

(declare-fun m!388779 () Bool)

(assert (=> b!392366 m!388779))

(assert (=> b!392366 m!388779))

(declare-fun m!388781 () Bool)

(assert (=> b!392366 m!388781))

(assert (=> b!392367 m!388779))

(assert (=> b!392367 m!388779))

(declare-fun m!388783 () Bool)

(assert (=> b!392367 m!388783))

(assert (=> b!392368 m!388779))

(assert (=> b!392368 m!388779))

(assert (=> b!392368 m!388783))

(assert (=> bm!27676 m!388779))

(declare-fun m!388785 () Bool)

(assert (=> bm!27676 m!388785))

(assert (=> b!392308 d!73127))

(declare-fun b!392394 () Bool)

(assert (=> b!392394 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11447 _keys!658)))))

(assert (=> b!392394 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11446 _values!506)))))

(declare-fun lt!185389 () ListLongMap!5501)

(declare-fun e!237619 () Bool)

(declare-fun apply!305 (ListLongMap!5501 (_ BitVec 64)) V!14013)

(declare-fun get!5605 (ValueCell!4497 V!14013) V!14013)

(declare-fun dynLambda!648 (Int (_ BitVec 64)) V!14013)

(assert (=> b!392394 (= e!237619 (= (apply!305 lt!185389 (select (arr!11095 _keys!658) #b00000000000000000000000000000000)) (get!5605 (select (arr!11094 _values!506) #b00000000000000000000000000000000) (dynLambda!648 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!392395 () Bool)

(declare-fun lt!185390 () Unit!12006)

(declare-fun lt!185391 () Unit!12006)

(assert (=> b!392395 (= lt!185390 lt!185391)))

(declare-fun lt!185392 () V!14013)

(declare-fun lt!185394 () ListLongMap!5501)

(declare-fun lt!185393 () (_ BitVec 64))

(declare-fun lt!185388 () (_ BitVec 64))

(declare-fun contains!2465 (ListLongMap!5501 (_ BitVec 64)) Bool)

(assert (=> b!392395 (not (contains!2465 (+!1061 lt!185394 (tuple2!6589 lt!185393 lt!185392)) lt!185388))))

(declare-fun addStillNotContains!138 (ListLongMap!5501 (_ BitVec 64) V!14013 (_ BitVec 64)) Unit!12006)

(assert (=> b!392395 (= lt!185391 (addStillNotContains!138 lt!185394 lt!185393 lt!185392 lt!185388))))

(assert (=> b!392395 (= lt!185388 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!392395 (= lt!185392 (get!5605 (select (arr!11094 _values!506) #b00000000000000000000000000000000) (dynLambda!648 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!392395 (= lt!185393 (select (arr!11095 _keys!658) #b00000000000000000000000000000000))))

(declare-fun call!27682 () ListLongMap!5501)

(assert (=> b!392395 (= lt!185394 call!27682)))

(declare-fun e!237616 () ListLongMap!5501)

(assert (=> b!392395 (= e!237616 (+!1061 call!27682 (tuple2!6589 (select (arr!11095 _keys!658) #b00000000000000000000000000000000) (get!5605 (select (arr!11094 _values!506) #b00000000000000000000000000000000) (dynLambda!648 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!392396 () Bool)

(declare-fun res!224722 () Bool)

(declare-fun e!237622 () Bool)

(assert (=> b!392396 (=> (not res!224722) (not e!237622))))

(assert (=> b!392396 (= res!224722 (not (contains!2465 lt!185389 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!392397 () Bool)

(declare-fun e!237617 () Bool)

(assert (=> b!392397 (= e!237622 e!237617)))

(declare-fun c!54344 () Bool)

(declare-fun e!237618 () Bool)

(assert (=> b!392397 (= c!54344 e!237618)))

(declare-fun res!224723 () Bool)

(assert (=> b!392397 (=> (not res!224723) (not e!237618))))

(assert (=> b!392397 (= res!224723 (bvslt #b00000000000000000000000000000000 (size!11447 _keys!658)))))

(declare-fun e!237621 () Bool)

(declare-fun b!392398 () Bool)

(assert (=> b!392398 (= e!237621 (= lt!185389 (getCurrentListMapNoExtraKeys!988 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!392399 () Bool)

(declare-fun isEmpty!551 (ListLongMap!5501) Bool)

(assert (=> b!392399 (= e!237621 (isEmpty!551 lt!185389))))

(declare-fun b!392400 () Bool)

(assert (=> b!392400 (= e!237617 e!237619)))

(assert (=> b!392400 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11447 _keys!658)))))

(declare-fun res!224721 () Bool)

(assert (=> b!392400 (= res!224721 (contains!2465 lt!185389 (select (arr!11095 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!392400 (=> (not res!224721) (not e!237619))))

(declare-fun b!392401 () Bool)

(assert (=> b!392401 (= e!237616 call!27682)))

(declare-fun b!392402 () Bool)

(declare-fun e!237620 () ListLongMap!5501)

(assert (=> b!392402 (= e!237620 e!237616)))

(declare-fun c!54346 () Bool)

(assert (=> b!392402 (= c!54346 (validKeyInArray!0 (select (arr!11095 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392403 () Bool)

(assert (=> b!392403 (= e!237620 (ListLongMap!5502 Nil!6438))))

(declare-fun b!392404 () Bool)

(assert (=> b!392404 (= e!237617 e!237621)))

(declare-fun c!54345 () Bool)

(assert (=> b!392404 (= c!54345 (bvslt #b00000000000000000000000000000000 (size!11447 _keys!658)))))

(declare-fun b!392405 () Bool)

(assert (=> b!392405 (= e!237618 (validKeyInArray!0 (select (arr!11095 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!392405 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!27679 () Bool)

(assert (=> bm!27679 (= call!27682 (getCurrentListMapNoExtraKeys!988 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun d!73129 () Bool)

(assert (=> d!73129 e!237622))

(declare-fun res!224724 () Bool)

(assert (=> d!73129 (=> (not res!224724) (not e!237622))))

(assert (=> d!73129 (= res!224724 (not (contains!2465 lt!185389 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73129 (= lt!185389 e!237620)))

(declare-fun c!54347 () Bool)

(assert (=> d!73129 (= c!54347 (bvsge #b00000000000000000000000000000000 (size!11447 _keys!658)))))

(assert (=> d!73129 (validMask!0 mask!970)))

(assert (=> d!73129 (= (getCurrentListMapNoExtraKeys!988 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185389)))

(assert (= (and d!73129 c!54347) b!392403))

(assert (= (and d!73129 (not c!54347)) b!392402))

(assert (= (and b!392402 c!54346) b!392395))

(assert (= (and b!392402 (not c!54346)) b!392401))

(assert (= (or b!392395 b!392401) bm!27679))

(assert (= (and d!73129 res!224724) b!392396))

(assert (= (and b!392396 res!224722) b!392397))

(assert (= (and b!392397 res!224723) b!392405))

(assert (= (and b!392397 c!54344) b!392400))

(assert (= (and b!392397 (not c!54344)) b!392404))

(assert (= (and b!392400 res!224721) b!392394))

(assert (= (and b!392404 c!54345) b!392398))

(assert (= (and b!392404 (not c!54345)) b!392399))

(declare-fun b_lambda!8719 () Bool)

(assert (=> (not b_lambda!8719) (not b!392394)))

(declare-fun t!11612 () Bool)

(declare-fun tb!3125 () Bool)

(assert (=> (and start!38084 (= defaultEntry!514 defaultEntry!514) t!11612) tb!3125))

(declare-fun result!5755 () Bool)

(assert (=> tb!3125 (= result!5755 tp_is_empty!9681)))

(assert (=> b!392394 t!11612))

(declare-fun b_and!16351 () Bool)

(assert (= b_and!16347 (and (=> t!11612 result!5755) b_and!16351)))

(declare-fun b_lambda!8721 () Bool)

(assert (=> (not b_lambda!8721) (not b!392395)))

(assert (=> b!392395 t!11612))

(declare-fun b_and!16353 () Bool)

(assert (= b_and!16351 (and (=> t!11612 result!5755) b_and!16353)))

(declare-fun m!388787 () Bool)

(assert (=> b!392395 m!388787))

(declare-fun m!388789 () Bool)

(assert (=> b!392395 m!388789))

(declare-fun m!388791 () Bool)

(assert (=> b!392395 m!388791))

(declare-fun m!388793 () Bool)

(assert (=> b!392395 m!388793))

(declare-fun m!388795 () Bool)

(assert (=> b!392395 m!388795))

(declare-fun m!388797 () Bool)

(assert (=> b!392395 m!388797))

(assert (=> b!392395 m!388797))

(declare-fun m!388799 () Bool)

(assert (=> b!392395 m!388799))

(declare-fun m!388801 () Bool)

(assert (=> b!392395 m!388801))

(assert (=> b!392395 m!388791))

(assert (=> b!392395 m!388789))

(declare-fun m!388803 () Bool)

(assert (=> b!392396 m!388803))

(declare-fun m!388805 () Bool)

(assert (=> b!392399 m!388805))

(assert (=> b!392402 m!388801))

(assert (=> b!392402 m!388801))

(declare-fun m!388807 () Bool)

(assert (=> b!392402 m!388807))

(declare-fun m!388809 () Bool)

(assert (=> b!392398 m!388809))

(assert (=> bm!27679 m!388809))

(declare-fun m!388811 () Bool)

(assert (=> d!73129 m!388811))

(assert (=> d!73129 m!388713))

(assert (=> b!392394 m!388789))

(assert (=> b!392394 m!388791))

(assert (=> b!392394 m!388793))

(assert (=> b!392394 m!388801))

(assert (=> b!392394 m!388801))

(declare-fun m!388813 () Bool)

(assert (=> b!392394 m!388813))

(assert (=> b!392394 m!388791))

(assert (=> b!392394 m!388789))

(assert (=> b!392400 m!388801))

(assert (=> b!392400 m!388801))

(declare-fun m!388815 () Bool)

(assert (=> b!392400 m!388815))

(assert (=> b!392405 m!388801))

(assert (=> b!392405 m!388801))

(assert (=> b!392405 m!388807))

(assert (=> b!392297 d!73129))

(declare-fun bm!27694 () Bool)

(declare-fun call!27698 () Bool)

(declare-fun lt!185450 () ListLongMap!5501)

(assert (=> bm!27694 (= call!27698 (contains!2465 lt!185450 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!54361 () Bool)

(declare-fun call!27700 () ListLongMap!5501)

(declare-fun c!54363 () Bool)

(declare-fun call!27702 () ListLongMap!5501)

(declare-fun bm!27695 () Bool)

(declare-fun call!27703 () ListLongMap!5501)

(declare-fun call!27701 () ListLongMap!5501)

(assert (=> bm!27695 (= call!27701 (+!1061 (ite c!54361 call!27700 (ite c!54363 call!27702 call!27703)) (ite (or c!54361 c!54363) (tuple2!6589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!392450 () Bool)

(declare-fun e!237661 () Bool)

(declare-fun e!237656 () Bool)

(assert (=> b!392450 (= e!237661 e!237656)))

(declare-fun res!224749 () Bool)

(assert (=> b!392450 (=> (not res!224749) (not e!237656))))

(assert (=> b!392450 (= res!224749 (contains!2465 lt!185450 (select (arr!11095 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!392450 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11447 _keys!658)))))

(declare-fun b!392451 () Bool)

(declare-fun e!237653 () Bool)

(assert (=> b!392451 (= e!237653 (validKeyInArray!0 (select (arr!11095 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392452 () Bool)

(declare-fun e!237658 () Bool)

(assert (=> b!392452 (= e!237658 (= (apply!305 lt!185450 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!392453 () Bool)

(declare-fun e!237652 () ListLongMap!5501)

(declare-fun call!27699 () ListLongMap!5501)

(assert (=> b!392453 (= e!237652 call!27699)))

(declare-fun b!392454 () Bool)

(assert (=> b!392454 (= e!237652 call!27703)))

(declare-fun bm!27696 () Bool)

(declare-fun call!27697 () Bool)

(assert (=> bm!27696 (= call!27697 (contains!2465 lt!185450 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!73131 () Bool)

(declare-fun e!237659 () Bool)

(assert (=> d!73131 e!237659))

(declare-fun res!224748 () Bool)

(assert (=> d!73131 (=> (not res!224748) (not e!237659))))

(assert (=> d!73131 (= res!224748 (or (bvsge #b00000000000000000000000000000000 (size!11447 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11447 _keys!658)))))))

(declare-fun lt!185458 () ListLongMap!5501)

(assert (=> d!73131 (= lt!185450 lt!185458)))

(declare-fun lt!185452 () Unit!12006)

(declare-fun e!237651 () Unit!12006)

(assert (=> d!73131 (= lt!185452 e!237651)))

(declare-fun c!54360 () Bool)

(assert (=> d!73131 (= c!54360 e!237653)))

(declare-fun res!224745 () Bool)

(assert (=> d!73131 (=> (not res!224745) (not e!237653))))

(assert (=> d!73131 (= res!224745 (bvslt #b00000000000000000000000000000000 (size!11447 _keys!658)))))

(declare-fun e!237654 () ListLongMap!5501)

(assert (=> d!73131 (= lt!185458 e!237654)))

(assert (=> d!73131 (= c!54361 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73131 (validMask!0 mask!970)))

(assert (=> d!73131 (= (getCurrentListMap!2108 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185450)))

(declare-fun b!392455 () Bool)

(declare-fun c!54365 () Bool)

(assert (=> b!392455 (= c!54365 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!237655 () ListLongMap!5501)

(assert (=> b!392455 (= e!237655 e!237652)))

(declare-fun b!392456 () Bool)

(assert (=> b!392456 (= e!237655 call!27699)))

(declare-fun b!392457 () Bool)

(declare-fun res!224743 () Bool)

(assert (=> b!392457 (=> (not res!224743) (not e!237659))))

(declare-fun e!237650 () Bool)

(assert (=> b!392457 (= res!224743 e!237650)))

(declare-fun c!54364 () Bool)

(assert (=> b!392457 (= c!54364 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!392458 () Bool)

(assert (=> b!392458 (= e!237654 e!237655)))

(assert (=> b!392458 (= c!54363 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392459 () Bool)

(declare-fun lt!185440 () Unit!12006)

(assert (=> b!392459 (= e!237651 lt!185440)))

(declare-fun lt!185447 () ListLongMap!5501)

(assert (=> b!392459 (= lt!185447 (getCurrentListMapNoExtraKeys!988 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185444 () (_ BitVec 64))

(assert (=> b!392459 (= lt!185444 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185439 () (_ BitVec 64))

(assert (=> b!392459 (= lt!185439 (select (arr!11095 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185449 () Unit!12006)

(declare-fun addStillContains!281 (ListLongMap!5501 (_ BitVec 64) V!14013 (_ BitVec 64)) Unit!12006)

(assert (=> b!392459 (= lt!185449 (addStillContains!281 lt!185447 lt!185444 zeroValue!472 lt!185439))))

(assert (=> b!392459 (contains!2465 (+!1061 lt!185447 (tuple2!6589 lt!185444 zeroValue!472)) lt!185439)))

(declare-fun lt!185446 () Unit!12006)

(assert (=> b!392459 (= lt!185446 lt!185449)))

(declare-fun lt!185442 () ListLongMap!5501)

(assert (=> b!392459 (= lt!185442 (getCurrentListMapNoExtraKeys!988 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185441 () (_ BitVec 64))

(assert (=> b!392459 (= lt!185441 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185457 () (_ BitVec 64))

(assert (=> b!392459 (= lt!185457 (select (arr!11095 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185445 () Unit!12006)

(declare-fun addApplyDifferent!281 (ListLongMap!5501 (_ BitVec 64) V!14013 (_ BitVec 64)) Unit!12006)

(assert (=> b!392459 (= lt!185445 (addApplyDifferent!281 lt!185442 lt!185441 minValue!472 lt!185457))))

(assert (=> b!392459 (= (apply!305 (+!1061 lt!185442 (tuple2!6589 lt!185441 minValue!472)) lt!185457) (apply!305 lt!185442 lt!185457))))

(declare-fun lt!185460 () Unit!12006)

(assert (=> b!392459 (= lt!185460 lt!185445)))

(declare-fun lt!185454 () ListLongMap!5501)

(assert (=> b!392459 (= lt!185454 (getCurrentListMapNoExtraKeys!988 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185451 () (_ BitVec 64))

(assert (=> b!392459 (= lt!185451 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185453 () (_ BitVec 64))

(assert (=> b!392459 (= lt!185453 (select (arr!11095 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185455 () Unit!12006)

(assert (=> b!392459 (= lt!185455 (addApplyDifferent!281 lt!185454 lt!185451 zeroValue!472 lt!185453))))

(assert (=> b!392459 (= (apply!305 (+!1061 lt!185454 (tuple2!6589 lt!185451 zeroValue!472)) lt!185453) (apply!305 lt!185454 lt!185453))))

(declare-fun lt!185459 () Unit!12006)

(assert (=> b!392459 (= lt!185459 lt!185455)))

(declare-fun lt!185448 () ListLongMap!5501)

(assert (=> b!392459 (= lt!185448 (getCurrentListMapNoExtraKeys!988 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185443 () (_ BitVec 64))

(assert (=> b!392459 (= lt!185443 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185456 () (_ BitVec 64))

(assert (=> b!392459 (= lt!185456 (select (arr!11095 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!392459 (= lt!185440 (addApplyDifferent!281 lt!185448 lt!185443 minValue!472 lt!185456))))

(assert (=> b!392459 (= (apply!305 (+!1061 lt!185448 (tuple2!6589 lt!185443 minValue!472)) lt!185456) (apply!305 lt!185448 lt!185456))))

(declare-fun b!392460 () Bool)

(assert (=> b!392460 (= e!237650 (not call!27697))))

(declare-fun bm!27697 () Bool)

(assert (=> bm!27697 (= call!27702 call!27700)))

(declare-fun b!392461 () Bool)

(declare-fun e!237649 () Bool)

(assert (=> b!392461 (= e!237649 e!237658)))

(declare-fun res!224750 () Bool)

(assert (=> b!392461 (= res!224750 call!27698)))

(assert (=> b!392461 (=> (not res!224750) (not e!237658))))

(declare-fun b!392462 () Bool)

(declare-fun Unit!12010 () Unit!12006)

(assert (=> b!392462 (= e!237651 Unit!12010)))

(declare-fun b!392463 () Bool)

(assert (=> b!392463 (= e!237656 (= (apply!305 lt!185450 (select (arr!11095 _keys!658) #b00000000000000000000000000000000)) (get!5605 (select (arr!11094 _values!506) #b00000000000000000000000000000000) (dynLambda!648 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!392463 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11446 _values!506)))))

(assert (=> b!392463 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11447 _keys!658)))))

(declare-fun b!392464 () Bool)

(assert (=> b!392464 (= e!237649 (not call!27698))))

(declare-fun b!392465 () Bool)

(declare-fun res!224746 () Bool)

(assert (=> b!392465 (=> (not res!224746) (not e!237659))))

(assert (=> b!392465 (= res!224746 e!237661)))

(declare-fun res!224744 () Bool)

(assert (=> b!392465 (=> res!224744 e!237661)))

(declare-fun e!237657 () Bool)

(assert (=> b!392465 (= res!224744 (not e!237657))))

(declare-fun res!224751 () Bool)

(assert (=> b!392465 (=> (not res!224751) (not e!237657))))

(assert (=> b!392465 (= res!224751 (bvslt #b00000000000000000000000000000000 (size!11447 _keys!658)))))

(declare-fun bm!27698 () Bool)

(assert (=> bm!27698 (= call!27699 call!27701)))

(declare-fun b!392466 () Bool)

(assert (=> b!392466 (= e!237654 (+!1061 call!27701 (tuple2!6589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!392467 () Bool)

(declare-fun e!237660 () Bool)

(assert (=> b!392467 (= e!237650 e!237660)))

(declare-fun res!224747 () Bool)

(assert (=> b!392467 (= res!224747 call!27697)))

(assert (=> b!392467 (=> (not res!224747) (not e!237660))))

(declare-fun b!392468 () Bool)

(assert (=> b!392468 (= e!237657 (validKeyInArray!0 (select (arr!11095 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392469 () Bool)

(assert (=> b!392469 (= e!237659 e!237649)))

(declare-fun c!54362 () Bool)

(assert (=> b!392469 (= c!54362 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392470 () Bool)

(assert (=> b!392470 (= e!237660 (= (apply!305 lt!185450 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27699 () Bool)

(assert (=> bm!27699 (= call!27700 (getCurrentListMapNoExtraKeys!988 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun bm!27700 () Bool)

(assert (=> bm!27700 (= call!27703 call!27702)))

(assert (= (and d!73131 c!54361) b!392466))

(assert (= (and d!73131 (not c!54361)) b!392458))

(assert (= (and b!392458 c!54363) b!392456))

(assert (= (and b!392458 (not c!54363)) b!392455))

(assert (= (and b!392455 c!54365) b!392453))

(assert (= (and b!392455 (not c!54365)) b!392454))

(assert (= (or b!392453 b!392454) bm!27700))

(assert (= (or b!392456 bm!27700) bm!27697))

(assert (= (or b!392456 b!392453) bm!27698))

(assert (= (or b!392466 bm!27697) bm!27699))

(assert (= (or b!392466 bm!27698) bm!27695))

(assert (= (and d!73131 res!224745) b!392451))

(assert (= (and d!73131 c!54360) b!392459))

(assert (= (and d!73131 (not c!54360)) b!392462))

(assert (= (and d!73131 res!224748) b!392465))

(assert (= (and b!392465 res!224751) b!392468))

(assert (= (and b!392465 (not res!224744)) b!392450))

(assert (= (and b!392450 res!224749) b!392463))

(assert (= (and b!392465 res!224746) b!392457))

(assert (= (and b!392457 c!54364) b!392467))

(assert (= (and b!392457 (not c!54364)) b!392460))

(assert (= (and b!392467 res!224747) b!392470))

(assert (= (or b!392467 b!392460) bm!27696))

(assert (= (and b!392457 res!224743) b!392469))

(assert (= (and b!392469 c!54362) b!392461))

(assert (= (and b!392469 (not c!54362)) b!392464))

(assert (= (and b!392461 res!224750) b!392452))

(assert (= (or b!392461 b!392464) bm!27694))

(declare-fun b_lambda!8723 () Bool)

(assert (=> (not b_lambda!8723) (not b!392463)))

(assert (=> b!392463 t!11612))

(declare-fun b_and!16355 () Bool)

(assert (= b_and!16353 (and (=> t!11612 result!5755) b_and!16355)))

(declare-fun m!388817 () Bool)

(assert (=> b!392470 m!388817))

(assert (=> b!392463 m!388801))

(assert (=> b!392463 m!388789))

(assert (=> b!392463 m!388789))

(assert (=> b!392463 m!388791))

(assert (=> b!392463 m!388793))

(assert (=> b!392463 m!388791))

(assert (=> b!392463 m!388801))

(declare-fun m!388819 () Bool)

(assert (=> b!392463 m!388819))

(assert (=> b!392451 m!388801))

(assert (=> b!392451 m!388801))

(assert (=> b!392451 m!388807))

(assert (=> b!392459 m!388801))

(declare-fun m!388821 () Bool)

(assert (=> b!392459 m!388821))

(declare-fun m!388823 () Bool)

(assert (=> b!392459 m!388823))

(declare-fun m!388825 () Bool)

(assert (=> b!392459 m!388825))

(declare-fun m!388827 () Bool)

(assert (=> b!392459 m!388827))

(declare-fun m!388829 () Bool)

(assert (=> b!392459 m!388829))

(declare-fun m!388831 () Bool)

(assert (=> b!392459 m!388831))

(declare-fun m!388833 () Bool)

(assert (=> b!392459 m!388833))

(declare-fun m!388835 () Bool)

(assert (=> b!392459 m!388835))

(declare-fun m!388837 () Bool)

(assert (=> b!392459 m!388837))

(declare-fun m!388839 () Bool)

(assert (=> b!392459 m!388839))

(assert (=> b!392459 m!388829))

(declare-fun m!388841 () Bool)

(assert (=> b!392459 m!388841))

(assert (=> b!392459 m!388827))

(declare-fun m!388843 () Bool)

(assert (=> b!392459 m!388843))

(declare-fun m!388845 () Bool)

(assert (=> b!392459 m!388845))

(assert (=> b!392459 m!388697))

(assert (=> b!392459 m!388825))

(declare-fun m!388847 () Bool)

(assert (=> b!392459 m!388847))

(declare-fun m!388849 () Bool)

(assert (=> b!392459 m!388849))

(assert (=> b!392459 m!388821))

(declare-fun m!388851 () Bool)

(assert (=> b!392466 m!388851))

(assert (=> d!73131 m!388713))

(assert (=> b!392468 m!388801))

(assert (=> b!392468 m!388801))

(assert (=> b!392468 m!388807))

(declare-fun m!388853 () Bool)

(assert (=> bm!27696 m!388853))

(declare-fun m!388855 () Bool)

(assert (=> b!392452 m!388855))

(declare-fun m!388857 () Bool)

(assert (=> bm!27694 m!388857))

(assert (=> b!392450 m!388801))

(assert (=> b!392450 m!388801))

(declare-fun m!388859 () Bool)

(assert (=> b!392450 m!388859))

(assert (=> bm!27699 m!388697))

(declare-fun m!388861 () Bool)

(assert (=> bm!27695 m!388861))

(assert (=> b!392297 d!73131))

(declare-fun b!392471 () Bool)

(assert (=> b!392471 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11447 lt!185346)))))

(assert (=> b!392471 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11446 lt!185345)))))

(declare-fun e!237665 () Bool)

(declare-fun lt!185462 () ListLongMap!5501)

(assert (=> b!392471 (= e!237665 (= (apply!305 lt!185462 (select (arr!11095 lt!185346) #b00000000000000000000000000000000)) (get!5605 (select (arr!11094 lt!185345) #b00000000000000000000000000000000) (dynLambda!648 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!392472 () Bool)

(declare-fun lt!185463 () Unit!12006)

(declare-fun lt!185464 () Unit!12006)

(assert (=> b!392472 (= lt!185463 lt!185464)))

(declare-fun lt!185465 () V!14013)

(declare-fun lt!185466 () (_ BitVec 64))

(declare-fun lt!185467 () ListLongMap!5501)

(declare-fun lt!185461 () (_ BitVec 64))

(assert (=> b!392472 (not (contains!2465 (+!1061 lt!185467 (tuple2!6589 lt!185466 lt!185465)) lt!185461))))

(assert (=> b!392472 (= lt!185464 (addStillNotContains!138 lt!185467 lt!185466 lt!185465 lt!185461))))

(assert (=> b!392472 (= lt!185461 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!392472 (= lt!185465 (get!5605 (select (arr!11094 lt!185345) #b00000000000000000000000000000000) (dynLambda!648 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!392472 (= lt!185466 (select (arr!11095 lt!185346) #b00000000000000000000000000000000))))

(declare-fun call!27704 () ListLongMap!5501)

(assert (=> b!392472 (= lt!185467 call!27704)))

(declare-fun e!237662 () ListLongMap!5501)

(assert (=> b!392472 (= e!237662 (+!1061 call!27704 (tuple2!6589 (select (arr!11095 lt!185346) #b00000000000000000000000000000000) (get!5605 (select (arr!11094 lt!185345) #b00000000000000000000000000000000) (dynLambda!648 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!392473 () Bool)

(declare-fun res!224753 () Bool)

(declare-fun e!237668 () Bool)

(assert (=> b!392473 (=> (not res!224753) (not e!237668))))

(assert (=> b!392473 (= res!224753 (not (contains!2465 lt!185462 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!392474 () Bool)

(declare-fun e!237663 () Bool)

(assert (=> b!392474 (= e!237668 e!237663)))

(declare-fun c!54366 () Bool)

(declare-fun e!237664 () Bool)

(assert (=> b!392474 (= c!54366 e!237664)))

(declare-fun res!224754 () Bool)

(assert (=> b!392474 (=> (not res!224754) (not e!237664))))

(assert (=> b!392474 (= res!224754 (bvslt #b00000000000000000000000000000000 (size!11447 lt!185346)))))

(declare-fun b!392475 () Bool)

(declare-fun e!237667 () Bool)

(assert (=> b!392475 (= e!237667 (= lt!185462 (getCurrentListMapNoExtraKeys!988 lt!185346 lt!185345 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!392476 () Bool)

(assert (=> b!392476 (= e!237667 (isEmpty!551 lt!185462))))

(declare-fun b!392477 () Bool)

(assert (=> b!392477 (= e!237663 e!237665)))

(assert (=> b!392477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11447 lt!185346)))))

(declare-fun res!224752 () Bool)

(assert (=> b!392477 (= res!224752 (contains!2465 lt!185462 (select (arr!11095 lt!185346) #b00000000000000000000000000000000)))))

(assert (=> b!392477 (=> (not res!224752) (not e!237665))))

(declare-fun b!392478 () Bool)

(assert (=> b!392478 (= e!237662 call!27704)))

(declare-fun b!392479 () Bool)

(declare-fun e!237666 () ListLongMap!5501)

(assert (=> b!392479 (= e!237666 e!237662)))

(declare-fun c!54368 () Bool)

(assert (=> b!392479 (= c!54368 (validKeyInArray!0 (select (arr!11095 lt!185346) #b00000000000000000000000000000000)))))

(declare-fun b!392480 () Bool)

(assert (=> b!392480 (= e!237666 (ListLongMap!5502 Nil!6438))))

(declare-fun b!392481 () Bool)

(assert (=> b!392481 (= e!237663 e!237667)))

(declare-fun c!54367 () Bool)

(assert (=> b!392481 (= c!54367 (bvslt #b00000000000000000000000000000000 (size!11447 lt!185346)))))

(declare-fun b!392482 () Bool)

(assert (=> b!392482 (= e!237664 (validKeyInArray!0 (select (arr!11095 lt!185346) #b00000000000000000000000000000000)))))

(assert (=> b!392482 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!27701 () Bool)

(assert (=> bm!27701 (= call!27704 (getCurrentListMapNoExtraKeys!988 lt!185346 lt!185345 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun d!73133 () Bool)

(assert (=> d!73133 e!237668))

(declare-fun res!224755 () Bool)

(assert (=> d!73133 (=> (not res!224755) (not e!237668))))

(assert (=> d!73133 (= res!224755 (not (contains!2465 lt!185462 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73133 (= lt!185462 e!237666)))

(declare-fun c!54369 () Bool)

(assert (=> d!73133 (= c!54369 (bvsge #b00000000000000000000000000000000 (size!11447 lt!185346)))))

(assert (=> d!73133 (validMask!0 mask!970)))

(assert (=> d!73133 (= (getCurrentListMapNoExtraKeys!988 lt!185346 lt!185345 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185462)))

(assert (= (and d!73133 c!54369) b!392480))

(assert (= (and d!73133 (not c!54369)) b!392479))

(assert (= (and b!392479 c!54368) b!392472))

(assert (= (and b!392479 (not c!54368)) b!392478))

(assert (= (or b!392472 b!392478) bm!27701))

(assert (= (and d!73133 res!224755) b!392473))

(assert (= (and b!392473 res!224753) b!392474))

(assert (= (and b!392474 res!224754) b!392482))

(assert (= (and b!392474 c!54366) b!392477))

(assert (= (and b!392474 (not c!54366)) b!392481))

(assert (= (and b!392477 res!224752) b!392471))

(assert (= (and b!392481 c!54367) b!392475))

(assert (= (and b!392481 (not c!54367)) b!392476))

(declare-fun b_lambda!8725 () Bool)

(assert (=> (not b_lambda!8725) (not b!392471)))

(assert (=> b!392471 t!11612))

(declare-fun b_and!16357 () Bool)

(assert (= b_and!16355 (and (=> t!11612 result!5755) b_and!16357)))

(declare-fun b_lambda!8727 () Bool)

(assert (=> (not b_lambda!8727) (not b!392472)))

(assert (=> b!392472 t!11612))

(declare-fun b_and!16359 () Bool)

(assert (= b_and!16357 (and (=> t!11612 result!5755) b_and!16359)))

(declare-fun m!388863 () Bool)

(assert (=> b!392472 m!388863))

(declare-fun m!388865 () Bool)

(assert (=> b!392472 m!388865))

(assert (=> b!392472 m!388791))

(declare-fun m!388867 () Bool)

(assert (=> b!392472 m!388867))

(declare-fun m!388869 () Bool)

(assert (=> b!392472 m!388869))

(declare-fun m!388871 () Bool)

(assert (=> b!392472 m!388871))

(assert (=> b!392472 m!388871))

(declare-fun m!388873 () Bool)

(assert (=> b!392472 m!388873))

(assert (=> b!392472 m!388779))

(assert (=> b!392472 m!388791))

(assert (=> b!392472 m!388865))

(declare-fun m!388875 () Bool)

(assert (=> b!392473 m!388875))

(declare-fun m!388877 () Bool)

(assert (=> b!392476 m!388877))

(assert (=> b!392479 m!388779))

(assert (=> b!392479 m!388779))

(assert (=> b!392479 m!388783))

(declare-fun m!388879 () Bool)

(assert (=> b!392475 m!388879))

(assert (=> bm!27701 m!388879))

(declare-fun m!388881 () Bool)

(assert (=> d!73133 m!388881))

(assert (=> d!73133 m!388713))

(assert (=> b!392471 m!388865))

(assert (=> b!392471 m!388791))

(assert (=> b!392471 m!388867))

(assert (=> b!392471 m!388779))

(assert (=> b!392471 m!388779))

(declare-fun m!388883 () Bool)

(assert (=> b!392471 m!388883))

(assert (=> b!392471 m!388791))

(assert (=> b!392471 m!388865))

(assert (=> b!392477 m!388779))

(assert (=> b!392477 m!388779))

(declare-fun m!388885 () Bool)

(assert (=> b!392477 m!388885))

(assert (=> b!392482 m!388779))

(assert (=> b!392482 m!388779))

(assert (=> b!392482 m!388783))

(assert (=> b!392297 d!73133))

(declare-fun bm!27702 () Bool)

(declare-fun call!27706 () Bool)

(declare-fun lt!185479 () ListLongMap!5501)

(assert (=> bm!27702 (= call!27706 (contains!2465 lt!185479 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!54371 () Bool)

(declare-fun call!27708 () ListLongMap!5501)

(declare-fun bm!27703 () Bool)

(declare-fun call!27710 () ListLongMap!5501)

(declare-fun c!54373 () Bool)

(declare-fun call!27709 () ListLongMap!5501)

(declare-fun call!27711 () ListLongMap!5501)

(assert (=> bm!27703 (= call!27709 (+!1061 (ite c!54371 call!27708 (ite c!54373 call!27710 call!27711)) (ite (or c!54371 c!54373) (tuple2!6589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!392483 () Bool)

(declare-fun e!237681 () Bool)

(declare-fun e!237676 () Bool)

(assert (=> b!392483 (= e!237681 e!237676)))

(declare-fun res!224762 () Bool)

(assert (=> b!392483 (=> (not res!224762) (not e!237676))))

(assert (=> b!392483 (= res!224762 (contains!2465 lt!185479 (select (arr!11095 lt!185346) #b00000000000000000000000000000000)))))

(assert (=> b!392483 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11447 lt!185346)))))

(declare-fun b!392484 () Bool)

(declare-fun e!237673 () Bool)

(assert (=> b!392484 (= e!237673 (validKeyInArray!0 (select (arr!11095 lt!185346) #b00000000000000000000000000000000)))))

(declare-fun b!392485 () Bool)

(declare-fun e!237678 () Bool)

(assert (=> b!392485 (= e!237678 (= (apply!305 lt!185479 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!392486 () Bool)

(declare-fun e!237672 () ListLongMap!5501)

(declare-fun call!27707 () ListLongMap!5501)

(assert (=> b!392486 (= e!237672 call!27707)))

(declare-fun b!392487 () Bool)

(assert (=> b!392487 (= e!237672 call!27711)))

(declare-fun bm!27704 () Bool)

(declare-fun call!27705 () Bool)

(assert (=> bm!27704 (= call!27705 (contains!2465 lt!185479 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!73135 () Bool)

(declare-fun e!237679 () Bool)

(assert (=> d!73135 e!237679))

(declare-fun res!224761 () Bool)

(assert (=> d!73135 (=> (not res!224761) (not e!237679))))

(assert (=> d!73135 (= res!224761 (or (bvsge #b00000000000000000000000000000000 (size!11447 lt!185346)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11447 lt!185346)))))))

(declare-fun lt!185487 () ListLongMap!5501)

(assert (=> d!73135 (= lt!185479 lt!185487)))

(declare-fun lt!185481 () Unit!12006)

(declare-fun e!237671 () Unit!12006)

(assert (=> d!73135 (= lt!185481 e!237671)))

(declare-fun c!54370 () Bool)

(assert (=> d!73135 (= c!54370 e!237673)))

(declare-fun res!224758 () Bool)

(assert (=> d!73135 (=> (not res!224758) (not e!237673))))

(assert (=> d!73135 (= res!224758 (bvslt #b00000000000000000000000000000000 (size!11447 lt!185346)))))

(declare-fun e!237674 () ListLongMap!5501)

(assert (=> d!73135 (= lt!185487 e!237674)))

(assert (=> d!73135 (= c!54371 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73135 (validMask!0 mask!970)))

(assert (=> d!73135 (= (getCurrentListMap!2108 lt!185346 lt!185345 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185479)))

(declare-fun b!392488 () Bool)

(declare-fun c!54375 () Bool)

(assert (=> b!392488 (= c!54375 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!237675 () ListLongMap!5501)

(assert (=> b!392488 (= e!237675 e!237672)))

(declare-fun b!392489 () Bool)

(assert (=> b!392489 (= e!237675 call!27707)))

(declare-fun b!392490 () Bool)

(declare-fun res!224756 () Bool)

(assert (=> b!392490 (=> (not res!224756) (not e!237679))))

(declare-fun e!237670 () Bool)

(assert (=> b!392490 (= res!224756 e!237670)))

(declare-fun c!54374 () Bool)

(assert (=> b!392490 (= c!54374 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!392491 () Bool)

(assert (=> b!392491 (= e!237674 e!237675)))

(assert (=> b!392491 (= c!54373 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392492 () Bool)

(declare-fun lt!185469 () Unit!12006)

(assert (=> b!392492 (= e!237671 lt!185469)))

(declare-fun lt!185476 () ListLongMap!5501)

(assert (=> b!392492 (= lt!185476 (getCurrentListMapNoExtraKeys!988 lt!185346 lt!185345 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185473 () (_ BitVec 64))

(assert (=> b!392492 (= lt!185473 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185468 () (_ BitVec 64))

(assert (=> b!392492 (= lt!185468 (select (arr!11095 lt!185346) #b00000000000000000000000000000000))))

(declare-fun lt!185478 () Unit!12006)

(assert (=> b!392492 (= lt!185478 (addStillContains!281 lt!185476 lt!185473 zeroValue!472 lt!185468))))

(assert (=> b!392492 (contains!2465 (+!1061 lt!185476 (tuple2!6589 lt!185473 zeroValue!472)) lt!185468)))

(declare-fun lt!185475 () Unit!12006)

(assert (=> b!392492 (= lt!185475 lt!185478)))

(declare-fun lt!185471 () ListLongMap!5501)

(assert (=> b!392492 (= lt!185471 (getCurrentListMapNoExtraKeys!988 lt!185346 lt!185345 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185470 () (_ BitVec 64))

(assert (=> b!392492 (= lt!185470 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185486 () (_ BitVec 64))

(assert (=> b!392492 (= lt!185486 (select (arr!11095 lt!185346) #b00000000000000000000000000000000))))

(declare-fun lt!185474 () Unit!12006)

(assert (=> b!392492 (= lt!185474 (addApplyDifferent!281 lt!185471 lt!185470 minValue!472 lt!185486))))

(assert (=> b!392492 (= (apply!305 (+!1061 lt!185471 (tuple2!6589 lt!185470 minValue!472)) lt!185486) (apply!305 lt!185471 lt!185486))))

(declare-fun lt!185489 () Unit!12006)

(assert (=> b!392492 (= lt!185489 lt!185474)))

(declare-fun lt!185483 () ListLongMap!5501)

(assert (=> b!392492 (= lt!185483 (getCurrentListMapNoExtraKeys!988 lt!185346 lt!185345 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185480 () (_ BitVec 64))

(assert (=> b!392492 (= lt!185480 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185482 () (_ BitVec 64))

(assert (=> b!392492 (= lt!185482 (select (arr!11095 lt!185346) #b00000000000000000000000000000000))))

(declare-fun lt!185484 () Unit!12006)

(assert (=> b!392492 (= lt!185484 (addApplyDifferent!281 lt!185483 lt!185480 zeroValue!472 lt!185482))))

(assert (=> b!392492 (= (apply!305 (+!1061 lt!185483 (tuple2!6589 lt!185480 zeroValue!472)) lt!185482) (apply!305 lt!185483 lt!185482))))

(declare-fun lt!185488 () Unit!12006)

(assert (=> b!392492 (= lt!185488 lt!185484)))

(declare-fun lt!185477 () ListLongMap!5501)

(assert (=> b!392492 (= lt!185477 (getCurrentListMapNoExtraKeys!988 lt!185346 lt!185345 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185472 () (_ BitVec 64))

(assert (=> b!392492 (= lt!185472 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185485 () (_ BitVec 64))

(assert (=> b!392492 (= lt!185485 (select (arr!11095 lt!185346) #b00000000000000000000000000000000))))

(assert (=> b!392492 (= lt!185469 (addApplyDifferent!281 lt!185477 lt!185472 minValue!472 lt!185485))))

(assert (=> b!392492 (= (apply!305 (+!1061 lt!185477 (tuple2!6589 lt!185472 minValue!472)) lt!185485) (apply!305 lt!185477 lt!185485))))

(declare-fun b!392493 () Bool)

(assert (=> b!392493 (= e!237670 (not call!27705))))

(declare-fun bm!27705 () Bool)

(assert (=> bm!27705 (= call!27710 call!27708)))

(declare-fun b!392494 () Bool)

(declare-fun e!237669 () Bool)

(assert (=> b!392494 (= e!237669 e!237678)))

(declare-fun res!224763 () Bool)

(assert (=> b!392494 (= res!224763 call!27706)))

(assert (=> b!392494 (=> (not res!224763) (not e!237678))))

(declare-fun b!392495 () Bool)

(declare-fun Unit!12011 () Unit!12006)

(assert (=> b!392495 (= e!237671 Unit!12011)))

(declare-fun b!392496 () Bool)

(assert (=> b!392496 (= e!237676 (= (apply!305 lt!185479 (select (arr!11095 lt!185346) #b00000000000000000000000000000000)) (get!5605 (select (arr!11094 lt!185345) #b00000000000000000000000000000000) (dynLambda!648 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!392496 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11446 lt!185345)))))

(assert (=> b!392496 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11447 lt!185346)))))

(declare-fun b!392497 () Bool)

(assert (=> b!392497 (= e!237669 (not call!27706))))

(declare-fun b!392498 () Bool)

(declare-fun res!224759 () Bool)

(assert (=> b!392498 (=> (not res!224759) (not e!237679))))

(assert (=> b!392498 (= res!224759 e!237681)))

(declare-fun res!224757 () Bool)

(assert (=> b!392498 (=> res!224757 e!237681)))

(declare-fun e!237677 () Bool)

(assert (=> b!392498 (= res!224757 (not e!237677))))

(declare-fun res!224764 () Bool)

(assert (=> b!392498 (=> (not res!224764) (not e!237677))))

(assert (=> b!392498 (= res!224764 (bvslt #b00000000000000000000000000000000 (size!11447 lt!185346)))))

(declare-fun bm!27706 () Bool)

(assert (=> bm!27706 (= call!27707 call!27709)))

(declare-fun b!392499 () Bool)

(assert (=> b!392499 (= e!237674 (+!1061 call!27709 (tuple2!6589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!392500 () Bool)

(declare-fun e!237680 () Bool)

(assert (=> b!392500 (= e!237670 e!237680)))

(declare-fun res!224760 () Bool)

(assert (=> b!392500 (= res!224760 call!27705)))

(assert (=> b!392500 (=> (not res!224760) (not e!237680))))

(declare-fun b!392501 () Bool)

(assert (=> b!392501 (= e!237677 (validKeyInArray!0 (select (arr!11095 lt!185346) #b00000000000000000000000000000000)))))

(declare-fun b!392502 () Bool)

(assert (=> b!392502 (= e!237679 e!237669)))

(declare-fun c!54372 () Bool)

(assert (=> b!392502 (= c!54372 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392503 () Bool)

(assert (=> b!392503 (= e!237680 (= (apply!305 lt!185479 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27707 () Bool)

(assert (=> bm!27707 (= call!27708 (getCurrentListMapNoExtraKeys!988 lt!185346 lt!185345 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun bm!27708 () Bool)

(assert (=> bm!27708 (= call!27711 call!27710)))

(assert (= (and d!73135 c!54371) b!392499))

(assert (= (and d!73135 (not c!54371)) b!392491))

(assert (= (and b!392491 c!54373) b!392489))

(assert (= (and b!392491 (not c!54373)) b!392488))

(assert (= (and b!392488 c!54375) b!392486))

(assert (= (and b!392488 (not c!54375)) b!392487))

(assert (= (or b!392486 b!392487) bm!27708))

(assert (= (or b!392489 bm!27708) bm!27705))

(assert (= (or b!392489 b!392486) bm!27706))

(assert (= (or b!392499 bm!27705) bm!27707))

(assert (= (or b!392499 bm!27706) bm!27703))

(assert (= (and d!73135 res!224758) b!392484))

(assert (= (and d!73135 c!54370) b!392492))

(assert (= (and d!73135 (not c!54370)) b!392495))

(assert (= (and d!73135 res!224761) b!392498))

(assert (= (and b!392498 res!224764) b!392501))

(assert (= (and b!392498 (not res!224757)) b!392483))

(assert (= (and b!392483 res!224762) b!392496))

(assert (= (and b!392498 res!224759) b!392490))

(assert (= (and b!392490 c!54374) b!392500))

(assert (= (and b!392490 (not c!54374)) b!392493))

(assert (= (and b!392500 res!224760) b!392503))

(assert (= (or b!392500 b!392493) bm!27704))

(assert (= (and b!392490 res!224756) b!392502))

(assert (= (and b!392502 c!54372) b!392494))

(assert (= (and b!392502 (not c!54372)) b!392497))

(assert (= (and b!392494 res!224763) b!392485))

(assert (= (or b!392494 b!392497) bm!27702))

(declare-fun b_lambda!8729 () Bool)

(assert (=> (not b_lambda!8729) (not b!392496)))

(assert (=> b!392496 t!11612))

(declare-fun b_and!16361 () Bool)

(assert (= b_and!16359 (and (=> t!11612 result!5755) b_and!16361)))

(declare-fun m!388887 () Bool)

(assert (=> b!392503 m!388887))

(assert (=> b!392496 m!388779))

(assert (=> b!392496 m!388865))

(assert (=> b!392496 m!388865))

(assert (=> b!392496 m!388791))

(assert (=> b!392496 m!388867))

(assert (=> b!392496 m!388791))

(assert (=> b!392496 m!388779))

(declare-fun m!388889 () Bool)

(assert (=> b!392496 m!388889))

(assert (=> b!392484 m!388779))

(assert (=> b!392484 m!388779))

(assert (=> b!392484 m!388783))

(assert (=> b!392492 m!388779))

(declare-fun m!388891 () Bool)

(assert (=> b!392492 m!388891))

(declare-fun m!388893 () Bool)

(assert (=> b!392492 m!388893))

(declare-fun m!388895 () Bool)

(assert (=> b!392492 m!388895))

(declare-fun m!388897 () Bool)

(assert (=> b!392492 m!388897))

(declare-fun m!388899 () Bool)

(assert (=> b!392492 m!388899))

(declare-fun m!388901 () Bool)

(assert (=> b!392492 m!388901))

(declare-fun m!388903 () Bool)

(assert (=> b!392492 m!388903))

(declare-fun m!388905 () Bool)

(assert (=> b!392492 m!388905))

(declare-fun m!388907 () Bool)

(assert (=> b!392492 m!388907))

(declare-fun m!388909 () Bool)

(assert (=> b!392492 m!388909))

(assert (=> b!392492 m!388899))

(declare-fun m!388911 () Bool)

(assert (=> b!392492 m!388911))

(assert (=> b!392492 m!388897))

(declare-fun m!388913 () Bool)

(assert (=> b!392492 m!388913))

(declare-fun m!388915 () Bool)

(assert (=> b!392492 m!388915))

(assert (=> b!392492 m!388701))

(assert (=> b!392492 m!388895))

(declare-fun m!388917 () Bool)

(assert (=> b!392492 m!388917))

(declare-fun m!388919 () Bool)

(assert (=> b!392492 m!388919))

(assert (=> b!392492 m!388891))

(declare-fun m!388921 () Bool)

(assert (=> b!392499 m!388921))

(assert (=> d!73135 m!388713))

(assert (=> b!392501 m!388779))

(assert (=> b!392501 m!388779))

(assert (=> b!392501 m!388783))

(declare-fun m!388923 () Bool)

(assert (=> bm!27704 m!388923))

(declare-fun m!388925 () Bool)

(assert (=> b!392485 m!388925))

(declare-fun m!388927 () Bool)

(assert (=> bm!27702 m!388927))

(assert (=> b!392483 m!388779))

(assert (=> b!392483 m!388779))

(declare-fun m!388929 () Bool)

(assert (=> b!392483 m!388929))

(assert (=> bm!27707 m!388701))

(declare-fun m!388931 () Bool)

(assert (=> bm!27703 m!388931))

(assert (=> b!392297 d!73135))

(declare-fun bm!27713 () Bool)

(declare-fun call!27716 () ListLongMap!5501)

(assert (=> bm!27713 (= call!27716 (getCurrentListMapNoExtraKeys!988 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392510 () Bool)

(declare-fun e!237687 () Bool)

(declare-fun call!27717 () ListLongMap!5501)

(assert (=> b!392510 (= e!237687 (= call!27717 call!27716))))

(declare-fun b!392511 () Bool)

(declare-fun e!237686 () Bool)

(assert (=> b!392511 (= e!237686 e!237687)))

(declare-fun c!54378 () Bool)

(assert (=> b!392511 (= c!54378 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun b!392512 () Bool)

(assert (=> b!392512 (= e!237687 (= call!27717 (+!1061 call!27716 (tuple2!6589 k0!778 v!373))))))

(declare-fun d!73137 () Bool)

(assert (=> d!73137 e!237686))

(declare-fun res!224767 () Bool)

(assert (=> d!73137 (=> (not res!224767) (not e!237686))))

(assert (=> d!73137 (= res!224767 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11447 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11446 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11447 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11446 _values!506))))))))

(declare-fun lt!185492 () Unit!12006)

(declare-fun choose!1320 (array!23269 array!23267 (_ BitVec 32) (_ BitVec 32) V!14013 V!14013 (_ BitVec 32) (_ BitVec 64) V!14013 (_ BitVec 32) Int) Unit!12006)

(assert (=> d!73137 (= lt!185492 (choose!1320 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!73137 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11447 _keys!658)))))

(assert (=> d!73137 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!272 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!185492)))

(declare-fun bm!27714 () Bool)

(assert (=> bm!27714 (= call!27717 (getCurrentListMapNoExtraKeys!988 (array!23270 (store (arr!11095 _keys!658) i!548 k0!778) (size!11447 _keys!658)) (array!23268 (store (arr!11094 _values!506) i!548 (ValueCellFull!4497 v!373)) (size!11446 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and d!73137 res!224767) b!392511))

(assert (= (and b!392511 c!54378) b!392512))

(assert (= (and b!392511 (not c!54378)) b!392510))

(assert (= (or b!392512 b!392510) bm!27713))

(assert (= (or b!392512 b!392510) bm!27714))

(assert (=> bm!27713 m!388697))

(declare-fun m!388933 () Bool)

(assert (=> b!392512 m!388933))

(declare-fun m!388935 () Bool)

(assert (=> d!73137 m!388935))

(assert (=> bm!27714 m!388711))

(assert (=> bm!27714 m!388707))

(declare-fun m!388937 () Bool)

(assert (=> bm!27714 m!388937))

(assert (=> b!392297 d!73137))

(declare-fun d!73139 () Bool)

(declare-fun e!237690 () Bool)

(assert (=> d!73139 e!237690))

(declare-fun res!224772 () Bool)

(assert (=> d!73139 (=> (not res!224772) (not e!237690))))

(declare-fun lt!185501 () ListLongMap!5501)

(assert (=> d!73139 (= res!224772 (contains!2465 lt!185501 (_1!3305 (tuple2!6589 k0!778 v!373))))))

(declare-fun lt!185503 () List!6441)

(assert (=> d!73139 (= lt!185501 (ListLongMap!5502 lt!185503))))

(declare-fun lt!185504 () Unit!12006)

(declare-fun lt!185502 () Unit!12006)

(assert (=> d!73139 (= lt!185504 lt!185502)))

(declare-datatypes ((Option!369 0))(
  ( (Some!368 (v!7119 V!14013)) (None!367) )
))
(declare-fun getValueByKey!363 (List!6441 (_ BitVec 64)) Option!369)

(assert (=> d!73139 (= (getValueByKey!363 lt!185503 (_1!3305 (tuple2!6589 k0!778 v!373))) (Some!368 (_2!3305 (tuple2!6589 k0!778 v!373))))))

(declare-fun lemmaContainsTupThenGetReturnValue!185 (List!6441 (_ BitVec 64) V!14013) Unit!12006)

(assert (=> d!73139 (= lt!185502 (lemmaContainsTupThenGetReturnValue!185 lt!185503 (_1!3305 (tuple2!6589 k0!778 v!373)) (_2!3305 (tuple2!6589 k0!778 v!373))))))

(declare-fun insertStrictlySorted!188 (List!6441 (_ BitVec 64) V!14013) List!6441)

(assert (=> d!73139 (= lt!185503 (insertStrictlySorted!188 (toList!2766 lt!185344) (_1!3305 (tuple2!6589 k0!778 v!373)) (_2!3305 (tuple2!6589 k0!778 v!373))))))

(assert (=> d!73139 (= (+!1061 lt!185344 (tuple2!6589 k0!778 v!373)) lt!185501)))

(declare-fun b!392517 () Bool)

(declare-fun res!224773 () Bool)

(assert (=> b!392517 (=> (not res!224773) (not e!237690))))

(assert (=> b!392517 (= res!224773 (= (getValueByKey!363 (toList!2766 lt!185501) (_1!3305 (tuple2!6589 k0!778 v!373))) (Some!368 (_2!3305 (tuple2!6589 k0!778 v!373)))))))

(declare-fun b!392518 () Bool)

(declare-fun contains!2466 (List!6441 tuple2!6588) Bool)

(assert (=> b!392518 (= e!237690 (contains!2466 (toList!2766 lt!185501) (tuple2!6589 k0!778 v!373)))))

(assert (= (and d!73139 res!224772) b!392517))

(assert (= (and b!392517 res!224773) b!392518))

(declare-fun m!388939 () Bool)

(assert (=> d!73139 m!388939))

(declare-fun m!388941 () Bool)

(assert (=> d!73139 m!388941))

(declare-fun m!388943 () Bool)

(assert (=> d!73139 m!388943))

(declare-fun m!388945 () Bool)

(assert (=> d!73139 m!388945))

(declare-fun m!388947 () Bool)

(assert (=> b!392517 m!388947))

(declare-fun m!388949 () Bool)

(assert (=> b!392518 m!388949))

(assert (=> b!392297 d!73139))

(declare-fun d!73141 () Bool)

(assert (=> d!73141 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!392302 d!73141))

(declare-fun d!73143 () Bool)

(assert (=> d!73143 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!38084 d!73143))

(declare-fun d!73145 () Bool)

(assert (=> d!73145 (= (array_inv!8148 _values!506) (bvsge (size!11446 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!38084 d!73145))

(declare-fun d!73147 () Bool)

(assert (=> d!73147 (= (array_inv!8149 _keys!658) (bvsge (size!11447 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!38084 d!73147))

(declare-fun d!73149 () Bool)

(declare-fun e!237691 () Bool)

(assert (=> d!73149 e!237691))

(declare-fun res!224774 () Bool)

(assert (=> d!73149 (=> (not res!224774) (not e!237691))))

(declare-fun lt!185505 () ListLongMap!5501)

(assert (=> d!73149 (= res!224774 (contains!2465 lt!185505 (_1!3305 lt!185341)))))

(declare-fun lt!185507 () List!6441)

(assert (=> d!73149 (= lt!185505 (ListLongMap!5502 lt!185507))))

(declare-fun lt!185508 () Unit!12006)

(declare-fun lt!185506 () Unit!12006)

(assert (=> d!73149 (= lt!185508 lt!185506)))

(assert (=> d!73149 (= (getValueByKey!363 lt!185507 (_1!3305 lt!185341)) (Some!368 (_2!3305 lt!185341)))))

(assert (=> d!73149 (= lt!185506 (lemmaContainsTupThenGetReturnValue!185 lt!185507 (_1!3305 lt!185341) (_2!3305 lt!185341)))))

(assert (=> d!73149 (= lt!185507 (insertStrictlySorted!188 (toList!2766 lt!185344) (_1!3305 lt!185341) (_2!3305 lt!185341)))))

(assert (=> d!73149 (= (+!1061 lt!185344 lt!185341) lt!185505)))

(declare-fun b!392519 () Bool)

(declare-fun res!224775 () Bool)

(assert (=> b!392519 (=> (not res!224775) (not e!237691))))

(assert (=> b!392519 (= res!224775 (= (getValueByKey!363 (toList!2766 lt!185505) (_1!3305 lt!185341)) (Some!368 (_2!3305 lt!185341))))))

(declare-fun b!392520 () Bool)

(assert (=> b!392520 (= e!237691 (contains!2466 (toList!2766 lt!185505) lt!185341))))

(assert (= (and d!73149 res!224774) b!392519))

(assert (= (and b!392519 res!224775) b!392520))

(declare-fun m!388951 () Bool)

(assert (=> d!73149 m!388951))

(declare-fun m!388953 () Bool)

(assert (=> d!73149 m!388953))

(declare-fun m!388955 () Bool)

(assert (=> d!73149 m!388955))

(declare-fun m!388957 () Bool)

(assert (=> d!73149 m!388957))

(declare-fun m!388959 () Bool)

(assert (=> b!392519 m!388959))

(declare-fun m!388961 () Bool)

(assert (=> b!392520 m!388961))

(assert (=> b!392296 d!73149))

(declare-fun d!73151 () Bool)

(declare-fun e!237692 () Bool)

(assert (=> d!73151 e!237692))

(declare-fun res!224776 () Bool)

(assert (=> d!73151 (=> (not res!224776) (not e!237692))))

(declare-fun lt!185509 () ListLongMap!5501)

(assert (=> d!73151 (= res!224776 (contains!2465 lt!185509 (_1!3305 lt!185341)))))

(declare-fun lt!185511 () List!6441)

(assert (=> d!73151 (= lt!185509 (ListLongMap!5502 lt!185511))))

(declare-fun lt!185512 () Unit!12006)

(declare-fun lt!185510 () Unit!12006)

(assert (=> d!73151 (= lt!185512 lt!185510)))

(assert (=> d!73151 (= (getValueByKey!363 lt!185511 (_1!3305 lt!185341)) (Some!368 (_2!3305 lt!185341)))))

(assert (=> d!73151 (= lt!185510 (lemmaContainsTupThenGetReturnValue!185 lt!185511 (_1!3305 lt!185341) (_2!3305 lt!185341)))))

(assert (=> d!73151 (= lt!185511 (insertStrictlySorted!188 (toList!2766 lt!185338) (_1!3305 lt!185341) (_2!3305 lt!185341)))))

(assert (=> d!73151 (= (+!1061 lt!185338 lt!185341) lt!185509)))

(declare-fun b!392521 () Bool)

(declare-fun res!224777 () Bool)

(assert (=> b!392521 (=> (not res!224777) (not e!237692))))

(assert (=> b!392521 (= res!224777 (= (getValueByKey!363 (toList!2766 lt!185509) (_1!3305 lt!185341)) (Some!368 (_2!3305 lt!185341))))))

(declare-fun b!392522 () Bool)

(assert (=> b!392522 (= e!237692 (contains!2466 (toList!2766 lt!185509) lt!185341))))

(assert (= (and d!73151 res!224776) b!392521))

(assert (= (and b!392521 res!224777) b!392522))

(declare-fun m!388963 () Bool)

(assert (=> d!73151 m!388963))

(declare-fun m!388965 () Bool)

(assert (=> d!73151 m!388965))

(declare-fun m!388967 () Bool)

(assert (=> d!73151 m!388967))

(declare-fun m!388969 () Bool)

(assert (=> d!73151 m!388969))

(declare-fun m!388971 () Bool)

(assert (=> b!392521 m!388971))

(declare-fun m!388973 () Bool)

(assert (=> b!392522 m!388973))

(assert (=> b!392296 d!73151))

(declare-fun bm!27717 () Bool)

(declare-fun call!27720 () Bool)

(assert (=> bm!27717 (= call!27720 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!185346 mask!970))))

(declare-fun d!73153 () Bool)

(declare-fun res!224783 () Bool)

(declare-fun e!237700 () Bool)

(assert (=> d!73153 (=> res!224783 e!237700)))

(assert (=> d!73153 (= res!224783 (bvsge #b00000000000000000000000000000000 (size!11447 lt!185346)))))

(assert (=> d!73153 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185346 mask!970) e!237700)))

(declare-fun b!392531 () Bool)

(declare-fun e!237701 () Bool)

(assert (=> b!392531 (= e!237701 call!27720)))

(declare-fun b!392532 () Bool)

(declare-fun e!237699 () Bool)

(assert (=> b!392532 (= e!237699 call!27720)))

(declare-fun b!392533 () Bool)

(assert (=> b!392533 (= e!237699 e!237701)))

(declare-fun lt!185519 () (_ BitVec 64))

(assert (=> b!392533 (= lt!185519 (select (arr!11095 lt!185346) #b00000000000000000000000000000000))))

(declare-fun lt!185520 () Unit!12006)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23269 (_ BitVec 64) (_ BitVec 32)) Unit!12006)

(assert (=> b!392533 (= lt!185520 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!185346 lt!185519 #b00000000000000000000000000000000))))

(assert (=> b!392533 (arrayContainsKey!0 lt!185346 lt!185519 #b00000000000000000000000000000000)))

(declare-fun lt!185521 () Unit!12006)

(assert (=> b!392533 (= lt!185521 lt!185520)))

(declare-fun res!224782 () Bool)

(declare-datatypes ((SeekEntryResult!3516 0))(
  ( (MissingZero!3516 (index!16243 (_ BitVec 32))) (Found!3516 (index!16244 (_ BitVec 32))) (Intermediate!3516 (undefined!4328 Bool) (index!16245 (_ BitVec 32)) (x!38413 (_ BitVec 32))) (Undefined!3516) (MissingVacant!3516 (index!16246 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23269 (_ BitVec 32)) SeekEntryResult!3516)

(assert (=> b!392533 (= res!224782 (= (seekEntryOrOpen!0 (select (arr!11095 lt!185346) #b00000000000000000000000000000000) lt!185346 mask!970) (Found!3516 #b00000000000000000000000000000000)))))

(assert (=> b!392533 (=> (not res!224782) (not e!237701))))

(declare-fun b!392534 () Bool)

(assert (=> b!392534 (= e!237700 e!237699)))

(declare-fun c!54381 () Bool)

(assert (=> b!392534 (= c!54381 (validKeyInArray!0 (select (arr!11095 lt!185346) #b00000000000000000000000000000000)))))

(assert (= (and d!73153 (not res!224783)) b!392534))

(assert (= (and b!392534 c!54381) b!392533))

(assert (= (and b!392534 (not c!54381)) b!392532))

(assert (= (and b!392533 res!224782) b!392531))

(assert (= (or b!392531 b!392532) bm!27717))

(declare-fun m!388975 () Bool)

(assert (=> bm!27717 m!388975))

(assert (=> b!392533 m!388779))

(declare-fun m!388977 () Bool)

(assert (=> b!392533 m!388977))

(declare-fun m!388979 () Bool)

(assert (=> b!392533 m!388979))

(assert (=> b!392533 m!388779))

(declare-fun m!388981 () Bool)

(assert (=> b!392533 m!388981))

(assert (=> b!392534 m!388779))

(assert (=> b!392534 m!388779))

(assert (=> b!392534 m!388783))

(assert (=> b!392301 d!73153))

(declare-fun b!392535 () Bool)

(declare-fun e!237703 () Bool)

(declare-fun call!27721 () Bool)

(assert (=> b!392535 (= e!237703 call!27721)))

(declare-fun d!73155 () Bool)

(declare-fun res!224784 () Bool)

(declare-fun e!237705 () Bool)

(assert (=> d!73155 (=> res!224784 e!237705)))

(assert (=> d!73155 (= res!224784 (bvsge #b00000000000000000000000000000000 (size!11447 _keys!658)))))

(assert (=> d!73155 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6439) e!237705)))

(declare-fun b!392536 () Bool)

(declare-fun e!237702 () Bool)

(assert (=> b!392536 (= e!237702 (contains!2464 Nil!6439 (select (arr!11095 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392537 () Bool)

(declare-fun e!237704 () Bool)

(assert (=> b!392537 (= e!237705 e!237704)))

(declare-fun res!224786 () Bool)

(assert (=> b!392537 (=> (not res!224786) (not e!237704))))

(assert (=> b!392537 (= res!224786 (not e!237702))))

(declare-fun res!224785 () Bool)

(assert (=> b!392537 (=> (not res!224785) (not e!237702))))

(assert (=> b!392537 (= res!224785 (validKeyInArray!0 (select (arr!11095 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392538 () Bool)

(assert (=> b!392538 (= e!237704 e!237703)))

(declare-fun c!54382 () Bool)

(assert (=> b!392538 (= c!54382 (validKeyInArray!0 (select (arr!11095 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27718 () Bool)

(assert (=> bm!27718 (= call!27721 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54382 (Cons!6438 (select (arr!11095 _keys!658) #b00000000000000000000000000000000) Nil!6439) Nil!6439)))))

(declare-fun b!392539 () Bool)

(assert (=> b!392539 (= e!237703 call!27721)))

(assert (= (and d!73155 (not res!224784)) b!392537))

(assert (= (and b!392537 res!224785) b!392536))

(assert (= (and b!392537 res!224786) b!392538))

(assert (= (and b!392538 c!54382) b!392539))

(assert (= (and b!392538 (not c!54382)) b!392535))

(assert (= (or b!392539 b!392535) bm!27718))

(assert (=> b!392536 m!388801))

(assert (=> b!392536 m!388801))

(declare-fun m!388983 () Bool)

(assert (=> b!392536 m!388983))

(assert (=> b!392537 m!388801))

(assert (=> b!392537 m!388801))

(assert (=> b!392537 m!388807))

(assert (=> b!392538 m!388801))

(assert (=> b!392538 m!388801))

(assert (=> b!392538 m!388807))

(assert (=> bm!27718 m!388801))

(declare-fun m!388985 () Bool)

(assert (=> bm!27718 m!388985))

(assert (=> b!392306 d!73155))

(declare-fun d!73157 () Bool)

(declare-fun res!224791 () Bool)

(declare-fun e!237710 () Bool)

(assert (=> d!73157 (=> res!224791 e!237710)))

(assert (=> d!73157 (= res!224791 (= (select (arr!11095 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!73157 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!237710)))

(declare-fun b!392544 () Bool)

(declare-fun e!237711 () Bool)

(assert (=> b!392544 (= e!237710 e!237711)))

(declare-fun res!224792 () Bool)

(assert (=> b!392544 (=> (not res!224792) (not e!237711))))

(assert (=> b!392544 (= res!224792 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11447 _keys!658)))))

(declare-fun b!392545 () Bool)

(assert (=> b!392545 (= e!237711 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73157 (not res!224791)) b!392544))

(assert (= (and b!392544 res!224792) b!392545))

(assert (=> d!73157 m!388801))

(declare-fun m!388987 () Bool)

(assert (=> b!392545 m!388987))

(assert (=> b!392300 d!73157))

(declare-fun d!73159 () Bool)

(declare-fun e!237712 () Bool)

(assert (=> d!73159 e!237712))

(declare-fun res!224793 () Bool)

(assert (=> d!73159 (=> (not res!224793) (not e!237712))))

(declare-fun lt!185522 () ListLongMap!5501)

(assert (=> d!73159 (= res!224793 (contains!2465 lt!185522 (_1!3305 lt!185341)))))

(declare-fun lt!185524 () List!6441)

(assert (=> d!73159 (= lt!185522 (ListLongMap!5502 lt!185524))))

(declare-fun lt!185525 () Unit!12006)

(declare-fun lt!185523 () Unit!12006)

(assert (=> d!73159 (= lt!185525 lt!185523)))

(assert (=> d!73159 (= (getValueByKey!363 lt!185524 (_1!3305 lt!185341)) (Some!368 (_2!3305 lt!185341)))))

(assert (=> d!73159 (= lt!185523 (lemmaContainsTupThenGetReturnValue!185 lt!185524 (_1!3305 lt!185341) (_2!3305 lt!185341)))))

(assert (=> d!73159 (= lt!185524 (insertStrictlySorted!188 (toList!2766 lt!185343) (_1!3305 lt!185341) (_2!3305 lt!185341)))))

(assert (=> d!73159 (= (+!1061 lt!185343 lt!185341) lt!185522)))

(declare-fun b!392546 () Bool)

(declare-fun res!224794 () Bool)

(assert (=> b!392546 (=> (not res!224794) (not e!237712))))

(assert (=> b!392546 (= res!224794 (= (getValueByKey!363 (toList!2766 lt!185522) (_1!3305 lt!185341)) (Some!368 (_2!3305 lt!185341))))))

(declare-fun b!392547 () Bool)

(assert (=> b!392547 (= e!237712 (contains!2466 (toList!2766 lt!185522) lt!185341))))

(assert (= (and d!73159 res!224793) b!392546))

(assert (= (and b!392546 res!224794) b!392547))

(declare-fun m!388989 () Bool)

(assert (=> d!73159 m!388989))

(declare-fun m!388991 () Bool)

(assert (=> d!73159 m!388991))

(declare-fun m!388993 () Bool)

(assert (=> d!73159 m!388993))

(declare-fun m!388995 () Bool)

(assert (=> d!73159 m!388995))

(declare-fun m!388997 () Bool)

(assert (=> b!392546 m!388997))

(declare-fun m!388999 () Bool)

(assert (=> b!392547 m!388999))

(assert (=> b!392299 d!73159))

(declare-fun bm!27719 () Bool)

(declare-fun call!27722 () Bool)

(assert (=> bm!27719 (= call!27722 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun d!73161 () Bool)

(declare-fun res!224796 () Bool)

(declare-fun e!237714 () Bool)

(assert (=> d!73161 (=> res!224796 e!237714)))

(assert (=> d!73161 (= res!224796 (bvsge #b00000000000000000000000000000000 (size!11447 _keys!658)))))

(assert (=> d!73161 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!237714)))

(declare-fun b!392548 () Bool)

(declare-fun e!237715 () Bool)

(assert (=> b!392548 (= e!237715 call!27722)))

(declare-fun b!392549 () Bool)

(declare-fun e!237713 () Bool)

(assert (=> b!392549 (= e!237713 call!27722)))

(declare-fun b!392550 () Bool)

(assert (=> b!392550 (= e!237713 e!237715)))

(declare-fun lt!185526 () (_ BitVec 64))

(assert (=> b!392550 (= lt!185526 (select (arr!11095 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185527 () Unit!12006)

(assert (=> b!392550 (= lt!185527 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!185526 #b00000000000000000000000000000000))))

(assert (=> b!392550 (arrayContainsKey!0 _keys!658 lt!185526 #b00000000000000000000000000000000)))

(declare-fun lt!185528 () Unit!12006)

(assert (=> b!392550 (= lt!185528 lt!185527)))

(declare-fun res!224795 () Bool)

(assert (=> b!392550 (= res!224795 (= (seekEntryOrOpen!0 (select (arr!11095 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3516 #b00000000000000000000000000000000)))))

(assert (=> b!392550 (=> (not res!224795) (not e!237715))))

(declare-fun b!392551 () Bool)

(assert (=> b!392551 (= e!237714 e!237713)))

(declare-fun c!54383 () Bool)

(assert (=> b!392551 (= c!54383 (validKeyInArray!0 (select (arr!11095 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!73161 (not res!224796)) b!392551))

(assert (= (and b!392551 c!54383) b!392550))

(assert (= (and b!392551 (not c!54383)) b!392549))

(assert (= (and b!392550 res!224795) b!392548))

(assert (= (or b!392548 b!392549) bm!27719))

(declare-fun m!389001 () Bool)

(assert (=> bm!27719 m!389001))

(assert (=> b!392550 m!388801))

(declare-fun m!389003 () Bool)

(assert (=> b!392550 m!389003))

(declare-fun m!389005 () Bool)

(assert (=> b!392550 m!389005))

(assert (=> b!392550 m!388801))

(declare-fun m!389007 () Bool)

(assert (=> b!392550 m!389007))

(assert (=> b!392551 m!388801))

(assert (=> b!392551 m!388801))

(assert (=> b!392551 m!388807))

(assert (=> b!392304 d!73161))

(declare-fun mapIsEmpty!16116 () Bool)

(declare-fun mapRes!16116 () Bool)

(assert (=> mapIsEmpty!16116 mapRes!16116))

(declare-fun b!392558 () Bool)

(declare-fun e!237720 () Bool)

(assert (=> b!392558 (= e!237720 tp_is_empty!9681)))

(declare-fun condMapEmpty!16116 () Bool)

(declare-fun mapDefault!16116 () ValueCell!4497)

(assert (=> mapNonEmpty!16110 (= condMapEmpty!16116 (= mapRest!16110 ((as const (Array (_ BitVec 32) ValueCell!4497)) mapDefault!16116)))))

(declare-fun e!237721 () Bool)

(assert (=> mapNonEmpty!16110 (= tp!31803 (and e!237721 mapRes!16116))))

(declare-fun b!392559 () Bool)

(assert (=> b!392559 (= e!237721 tp_is_empty!9681)))

(declare-fun mapNonEmpty!16116 () Bool)

(declare-fun tp!31812 () Bool)

(assert (=> mapNonEmpty!16116 (= mapRes!16116 (and tp!31812 e!237720))))

(declare-fun mapValue!16116 () ValueCell!4497)

(declare-fun mapRest!16116 () (Array (_ BitVec 32) ValueCell!4497))

(declare-fun mapKey!16116 () (_ BitVec 32))

(assert (=> mapNonEmpty!16116 (= mapRest!16110 (store mapRest!16116 mapKey!16116 mapValue!16116))))

(assert (= (and mapNonEmpty!16110 condMapEmpty!16116) mapIsEmpty!16116))

(assert (= (and mapNonEmpty!16110 (not condMapEmpty!16116)) mapNonEmpty!16116))

(assert (= (and mapNonEmpty!16116 ((_ is ValueCellFull!4497) mapValue!16116)) b!392558))

(assert (= (and mapNonEmpty!16110 ((_ is ValueCellFull!4497) mapDefault!16116)) b!392559))

(declare-fun m!389009 () Bool)

(assert (=> mapNonEmpty!16116 m!389009))

(declare-fun b_lambda!8731 () Bool)

(assert (= b_lambda!8719 (or (and start!38084 b_free!9009) b_lambda!8731)))

(declare-fun b_lambda!8733 () Bool)

(assert (= b_lambda!8729 (or (and start!38084 b_free!9009) b_lambda!8733)))

(declare-fun b_lambda!8735 () Bool)

(assert (= b_lambda!8725 (or (and start!38084 b_free!9009) b_lambda!8735)))

(declare-fun b_lambda!8737 () Bool)

(assert (= b_lambda!8727 (or (and start!38084 b_free!9009) b_lambda!8737)))

(declare-fun b_lambda!8739 () Bool)

(assert (= b_lambda!8721 (or (and start!38084 b_free!9009) b_lambda!8739)))

(declare-fun b_lambda!8741 () Bool)

(assert (= b_lambda!8723 (or (and start!38084 b_free!9009) b_lambda!8741)))

(check-sat (not b!392483) (not bm!27707) (not b!392394) (not bm!27713) (not b!392521) (not b!392470) (not b!392484) (not d!73135) (not b!392475) (not d!73129) (not b!392466) (not b!392518) (not b!392534) tp_is_empty!9681 (not b!392503) (not d!73149) (not b!392479) (not d!73131) (not b!392520) (not bm!27703) (not b!392538) (not b!392545) (not b!392485) (not b_lambda!8735) (not b!392396) (not bm!27702) (not b!392551) (not b_lambda!8737) (not b!392477) (not b!392452) (not b!392476) (not b!392471) (not b_lambda!8733) (not b!392522) (not bm!27694) (not b!392395) (not bm!27704) (not b!392451) (not bm!27717) (not d!73151) (not bm!27699) b_and!16361 (not d!73137) (not b!392519) (not bm!27696) (not b!392468) (not bm!27676) (not bm!27719) (not b!392400) (not b_lambda!8739) (not b!392499) (not b!392496) (not b!392517) (not b!392482) (not b!392368) (not d!73139) (not b!392537) (not b!392366) (not b_next!9009) (not b_lambda!8741) (not b!392533) (not mapNonEmpty!16116) (not d!73133) (not b!392463) (not bm!27695) (not b!392398) (not b!392367) (not b!392492) (not b!392546) (not b_lambda!8731) (not b!392501) (not b!392473) (not b!392550) (not b!392405) (not b!392536) (not b!392512) (not b!392459) (not b!392547) (not bm!27714) (not bm!27718) (not bm!27679) (not b!392402) (not bm!27701) (not d!73159) (not b!392399) (not b!392450) (not b!392472))
(check-sat b_and!16361 (not b_next!9009))
