; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111390 () Bool)

(assert start!111390)

(declare-fun b_free!30001 () Bool)

(declare-fun b_next!30001 () Bool)

(assert (=> start!111390 (= b_free!30001 (not b_next!30001))))

(declare-fun tp!105324 () Bool)

(declare-fun b_and!48211 () Bool)

(assert (=> start!111390 (= tp!105324 b_and!48211)))

(declare-fun mapNonEmpty!55225 () Bool)

(declare-fun mapRes!55225 () Bool)

(declare-fun tp!105325 () Bool)

(declare-fun e!751713 () Bool)

(assert (=> mapNonEmpty!55225 (= mapRes!55225 (and tp!105325 e!751713))))

(declare-datatypes ((V!52745 0))(
  ( (V!52746 (val!17940 Int)) )
))
(declare-datatypes ((ValueCell!16967 0))(
  ( (ValueCellFull!16967 (v!20562 V!52745)) (EmptyCell!16967) )
))
(declare-fun mapValue!55225 () ValueCell!16967)

(declare-fun mapRest!55225 () (Array (_ BitVec 32) ValueCell!16967))

(declare-datatypes ((array!88477 0))(
  ( (array!88478 (arr!42714 (Array (_ BitVec 32) ValueCell!16967)) (size!43265 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88477)

(declare-fun mapKey!55225 () (_ BitVec 32))

(assert (=> mapNonEmpty!55225 (= (arr!42714 _values!1354) (store mapRest!55225 mapKey!55225 mapValue!55225))))

(declare-fun b!1317563 () Bool)

(declare-fun tp_is_empty!35731 () Bool)

(assert (=> b!1317563 (= e!751713 tp_is_empty!35731)))

(declare-fun b!1317564 () Bool)

(declare-fun res!874321 () Bool)

(declare-fun e!751714 () Bool)

(assert (=> b!1317564 (=> (not res!874321) (not e!751714))))

(declare-datatypes ((array!88479 0))(
  ( (array!88480 (arr!42715 (Array (_ BitVec 32) (_ BitVec 64))) (size!43266 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88479)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1317564 (= res!874321 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43266 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1317565 () Bool)

(declare-fun res!874327 () Bool)

(assert (=> b!1317565 (=> (not res!874327) (not e!751714))))

(assert (=> b!1317565 (= res!874327 (not (= (select (arr!42715 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1317566 () Bool)

(declare-fun e!751715 () Bool)

(declare-fun e!751711 () Bool)

(assert (=> b!1317566 (= e!751715 (and e!751711 mapRes!55225))))

(declare-fun condMapEmpty!55225 () Bool)

(declare-fun mapDefault!55225 () ValueCell!16967)

(assert (=> b!1317566 (= condMapEmpty!55225 (= (arr!42714 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16967)) mapDefault!55225)))))

(declare-fun b!1317567 () Bool)

(declare-fun res!874322 () Bool)

(assert (=> b!1317567 (=> (not res!874322) (not e!751714))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52745)

(declare-fun zeroValue!1296 () V!52745)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23174 0))(
  ( (tuple2!23175 (_1!11598 (_ BitVec 64)) (_2!11598 V!52745)) )
))
(declare-datatypes ((List!30317 0))(
  ( (Nil!30314) (Cons!30313 (h!31531 tuple2!23174) (t!43915 List!30317)) )
))
(declare-datatypes ((ListLongMap!20839 0))(
  ( (ListLongMap!20840 (toList!10435 List!30317)) )
))
(declare-fun contains!8597 (ListLongMap!20839 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5439 (array!88479 array!88477 (_ BitVec 32) (_ BitVec 32) V!52745 V!52745 (_ BitVec 32) Int) ListLongMap!20839)

(assert (=> b!1317567 (= res!874322 (contains!8597 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1317569 () Bool)

(declare-fun res!874326 () Bool)

(assert (=> b!1317569 (=> (not res!874326) (not e!751714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88479 (_ BitVec 32)) Bool)

(assert (=> b!1317569 (= res!874326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!55225 () Bool)

(assert (=> mapIsEmpty!55225 mapRes!55225))

(declare-fun b!1317570 () Bool)

(declare-fun res!874323 () Bool)

(assert (=> b!1317570 (=> (not res!874323) (not e!751714))))

(declare-datatypes ((List!30318 0))(
  ( (Nil!30315) (Cons!30314 (h!31532 (_ BitVec 64)) (t!43916 List!30318)) )
))
(declare-fun arrayNoDuplicates!0 (array!88479 (_ BitVec 32) List!30318) Bool)

(assert (=> b!1317570 (= res!874323 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30315))))

(declare-fun b!1317571 () Bool)

(declare-fun res!874328 () Bool)

(assert (=> b!1317571 (=> (not res!874328) (not e!751714))))

(assert (=> b!1317571 (= res!874328 (and (= (size!43265 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43266 _keys!1628) (size!43265 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1317568 () Bool)

(assert (=> b!1317568 (= e!751714 (not (contains!8597 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))))

(declare-fun res!874325 () Bool)

(assert (=> start!111390 (=> (not res!874325) (not e!751714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111390 (= res!874325 (validMask!0 mask!2040))))

(assert (=> start!111390 e!751714))

(assert (=> start!111390 tp!105324))

(declare-fun array_inv!32527 (array!88479) Bool)

(assert (=> start!111390 (array_inv!32527 _keys!1628)))

(assert (=> start!111390 true))

(assert (=> start!111390 tp_is_empty!35731))

(declare-fun array_inv!32528 (array!88477) Bool)

(assert (=> start!111390 (and (array_inv!32528 _values!1354) e!751715)))

(declare-fun b!1317572 () Bool)

(declare-fun res!874324 () Bool)

(assert (=> b!1317572 (=> (not res!874324) (not e!751714))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1317572 (= res!874324 (not (validKeyInArray!0 (select (arr!42715 _keys!1628) from!2020))))))

(declare-fun b!1317573 () Bool)

(assert (=> b!1317573 (= e!751711 tp_is_empty!35731)))

(assert (= (and start!111390 res!874325) b!1317571))

(assert (= (and b!1317571 res!874328) b!1317569))

(assert (= (and b!1317569 res!874326) b!1317570))

(assert (= (and b!1317570 res!874323) b!1317564))

(assert (= (and b!1317564 res!874321) b!1317567))

(assert (= (and b!1317567 res!874322) b!1317565))

(assert (= (and b!1317565 res!874327) b!1317572))

(assert (= (and b!1317572 res!874324) b!1317568))

(assert (= (and b!1317566 condMapEmpty!55225) mapIsEmpty!55225))

(assert (= (and b!1317566 (not condMapEmpty!55225)) mapNonEmpty!55225))

(get-info :version)

(assert (= (and mapNonEmpty!55225 ((_ is ValueCellFull!16967) mapValue!55225)) b!1317563))

(assert (= (and b!1317566 ((_ is ValueCellFull!16967) mapDefault!55225)) b!1317573))

(assert (= start!111390 b!1317566))

(declare-fun m!1205783 () Bool)

(assert (=> start!111390 m!1205783))

(declare-fun m!1205785 () Bool)

(assert (=> start!111390 m!1205785))

(declare-fun m!1205787 () Bool)

(assert (=> start!111390 m!1205787))

(declare-fun m!1205789 () Bool)

(assert (=> b!1317572 m!1205789))

(assert (=> b!1317572 m!1205789))

(declare-fun m!1205791 () Bool)

(assert (=> b!1317572 m!1205791))

(declare-fun m!1205793 () Bool)

(assert (=> mapNonEmpty!55225 m!1205793))

(declare-fun m!1205795 () Bool)

(assert (=> b!1317568 m!1205795))

(assert (=> b!1317568 m!1205795))

(declare-fun m!1205797 () Bool)

(assert (=> b!1317568 m!1205797))

(declare-fun m!1205799 () Bool)

(assert (=> b!1317570 m!1205799))

(assert (=> b!1317565 m!1205789))

(declare-fun m!1205801 () Bool)

(assert (=> b!1317567 m!1205801))

(assert (=> b!1317567 m!1205801))

(declare-fun m!1205803 () Bool)

(assert (=> b!1317567 m!1205803))

(declare-fun m!1205805 () Bool)

(assert (=> b!1317569 m!1205805))

(check-sat tp_is_empty!35731 (not b!1317567) (not b!1317572) (not b!1317569) (not b_next!30001) b_and!48211 (not b!1317570) (not start!111390) (not mapNonEmpty!55225) (not b!1317568))
(check-sat b_and!48211 (not b_next!30001))
(get-model)

(declare-fun d!142959 () Bool)

(declare-fun e!751750 () Bool)

(assert (=> d!142959 e!751750))

(declare-fun res!874379 () Bool)

(assert (=> d!142959 (=> res!874379 e!751750)))

(declare-fun lt!586493 () Bool)

(assert (=> d!142959 (= res!874379 (not lt!586493))))

(declare-fun lt!586496 () Bool)

(assert (=> d!142959 (= lt!586493 lt!586496)))

(declare-datatypes ((Unit!43363 0))(
  ( (Unit!43364) )
))
(declare-fun lt!586495 () Unit!43363)

(declare-fun e!751751 () Unit!43363)

(assert (=> d!142959 (= lt!586495 e!751751)))

(declare-fun c!125948 () Bool)

(assert (=> d!142959 (= c!125948 lt!586496)))

(declare-fun containsKey!733 (List!30317 (_ BitVec 64)) Bool)

(assert (=> d!142959 (= lt!586496 (containsKey!733 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175))))

(assert (=> d!142959 (= (contains!8597 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175) lt!586493)))

(declare-fun b!1317646 () Bool)

(declare-fun lt!586494 () Unit!43363)

(assert (=> b!1317646 (= e!751751 lt!586494)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!479 (List!30317 (_ BitVec 64)) Unit!43363)

(assert (=> b!1317646 (= lt!586494 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175))))

(declare-datatypes ((Option!758 0))(
  ( (Some!757 (v!20565 V!52745)) (None!756) )
))
(declare-fun isDefined!516 (Option!758) Bool)

(declare-fun getValueByKey!707 (List!30317 (_ BitVec 64)) Option!758)

(assert (=> b!1317646 (isDefined!516 (getValueByKey!707 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175))))

(declare-fun b!1317647 () Bool)

(declare-fun Unit!43365 () Unit!43363)

(assert (=> b!1317647 (= e!751751 Unit!43365)))

(declare-fun b!1317648 () Bool)

(assert (=> b!1317648 (= e!751750 (isDefined!516 (getValueByKey!707 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175)))))

(assert (= (and d!142959 c!125948) b!1317646))

(assert (= (and d!142959 (not c!125948)) b!1317647))

(assert (= (and d!142959 (not res!874379)) b!1317648))

(declare-fun m!1205855 () Bool)

(assert (=> d!142959 m!1205855))

(declare-fun m!1205857 () Bool)

(assert (=> b!1317646 m!1205857))

(declare-fun m!1205859 () Bool)

(assert (=> b!1317646 m!1205859))

(assert (=> b!1317646 m!1205859))

(declare-fun m!1205861 () Bool)

(assert (=> b!1317646 m!1205861))

(assert (=> b!1317648 m!1205859))

(assert (=> b!1317648 m!1205859))

(assert (=> b!1317648 m!1205861))

(assert (=> b!1317567 d!142959))

(declare-fun b!1317691 () Bool)

(declare-fun e!751781 () Bool)

(declare-fun e!751790 () Bool)

(assert (=> b!1317691 (= e!751781 e!751790)))

(declare-fun res!874404 () Bool)

(declare-fun call!64716 () Bool)

(assert (=> b!1317691 (= res!874404 call!64716)))

(assert (=> b!1317691 (=> (not res!874404) (not e!751790))))

(declare-fun b!1317692 () Bool)

(declare-fun e!751789 () ListLongMap!20839)

(declare-fun call!64712 () ListLongMap!20839)

(assert (=> b!1317692 (= e!751789 call!64712)))

(declare-fun bm!64709 () Bool)

(declare-fun call!64717 () ListLongMap!20839)

(declare-fun call!64715 () ListLongMap!20839)

(assert (=> bm!64709 (= call!64717 call!64715)))

(declare-fun b!1317693 () Bool)

(declare-fun e!751785 () Bool)

(assert (=> b!1317693 (= e!751785 e!751781)))

(declare-fun c!125963 () Bool)

(assert (=> b!1317693 (= c!125963 (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1317694 () Bool)

(declare-fun e!751787 () Bool)

(declare-fun e!751788 () Bool)

(assert (=> b!1317694 (= e!751787 e!751788)))

(declare-fun res!874405 () Bool)

(declare-fun call!64713 () Bool)

(assert (=> b!1317694 (= res!874405 call!64713)))

(assert (=> b!1317694 (=> (not res!874405) (not e!751788))))

(declare-fun b!1317695 () Bool)

(declare-fun c!125966 () Bool)

(assert (=> b!1317695 (= c!125966 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!751783 () ListLongMap!20839)

(assert (=> b!1317695 (= e!751783 e!751789)))

(declare-fun b!1317696 () Bool)

(declare-fun lt!586562 () ListLongMap!20839)

(declare-fun apply!1037 (ListLongMap!20839 (_ BitVec 64)) V!52745)

(assert (=> b!1317696 (= e!751788 (= (apply!1037 lt!586562 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1296))))

(declare-fun b!1317697 () Bool)

(declare-fun e!751779 () Unit!43363)

(declare-fun Unit!43366 () Unit!43363)

(assert (=> b!1317697 (= e!751779 Unit!43366)))

(declare-fun bm!64711 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6183 (array!88479 array!88477 (_ BitVec 32) (_ BitVec 32) V!52745 V!52745 (_ BitVec 32) Int) ListLongMap!20839)

(assert (=> bm!64711 (= call!64715 (getCurrentListMapNoExtraKeys!6183 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))))

(declare-fun bm!64712 () Bool)

(assert (=> bm!64712 (= call!64712 call!64717)))

(declare-fun b!1317698 () Bool)

(declare-fun lt!586543 () Unit!43363)

(assert (=> b!1317698 (= e!751779 lt!586543)))

(declare-fun lt!586545 () ListLongMap!20839)

(assert (=> b!1317698 (= lt!586545 (getCurrentListMapNoExtraKeys!6183 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))))

(declare-fun lt!586561 () (_ BitVec 64))

(assert (=> b!1317698 (= lt!586561 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!586550 () (_ BitVec 64))

(assert (=> b!1317698 (= lt!586550 (select (arr!42715 _keys!1628) from!2020))))

(declare-fun lt!586559 () Unit!43363)

(declare-fun addStillContains!1124 (ListLongMap!20839 (_ BitVec 64) V!52745 (_ BitVec 64)) Unit!43363)

(assert (=> b!1317698 (= lt!586559 (addStillContains!1124 lt!586545 lt!586561 zeroValue!1296 lt!586550))))

(declare-fun +!4544 (ListLongMap!20839 tuple2!23174) ListLongMap!20839)

(assert (=> b!1317698 (contains!8597 (+!4544 lt!586545 (tuple2!23175 lt!586561 zeroValue!1296)) lt!586550)))

(declare-fun lt!586548 () Unit!43363)

(assert (=> b!1317698 (= lt!586548 lt!586559)))

(declare-fun lt!586557 () ListLongMap!20839)

(assert (=> b!1317698 (= lt!586557 (getCurrentListMapNoExtraKeys!6183 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))))

(declare-fun lt!586560 () (_ BitVec 64))

(assert (=> b!1317698 (= lt!586560 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!586547 () (_ BitVec 64))

(assert (=> b!1317698 (= lt!586547 (select (arr!42715 _keys!1628) from!2020))))

(declare-fun lt!586544 () Unit!43363)

(declare-fun addApplyDifferent!566 (ListLongMap!20839 (_ BitVec 64) V!52745 (_ BitVec 64)) Unit!43363)

(assert (=> b!1317698 (= lt!586544 (addApplyDifferent!566 lt!586557 lt!586560 minValue!1296 lt!586547))))

(assert (=> b!1317698 (= (apply!1037 (+!4544 lt!586557 (tuple2!23175 lt!586560 minValue!1296)) lt!586547) (apply!1037 lt!586557 lt!586547))))

(declare-fun lt!586553 () Unit!43363)

(assert (=> b!1317698 (= lt!586553 lt!586544)))

(declare-fun lt!586541 () ListLongMap!20839)

(assert (=> b!1317698 (= lt!586541 (getCurrentListMapNoExtraKeys!6183 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))))

(declare-fun lt!586555 () (_ BitVec 64))

(assert (=> b!1317698 (= lt!586555 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!586556 () (_ BitVec 64))

(assert (=> b!1317698 (= lt!586556 (select (arr!42715 _keys!1628) from!2020))))

(declare-fun lt!586558 () Unit!43363)

(assert (=> b!1317698 (= lt!586558 (addApplyDifferent!566 lt!586541 lt!586555 zeroValue!1296 lt!586556))))

(assert (=> b!1317698 (= (apply!1037 (+!4544 lt!586541 (tuple2!23175 lt!586555 zeroValue!1296)) lt!586556) (apply!1037 lt!586541 lt!586556))))

(declare-fun lt!586554 () Unit!43363)

(assert (=> b!1317698 (= lt!586554 lt!586558)))

(declare-fun lt!586549 () ListLongMap!20839)

(assert (=> b!1317698 (= lt!586549 (getCurrentListMapNoExtraKeys!6183 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))))

(declare-fun lt!586542 () (_ BitVec 64))

(assert (=> b!1317698 (= lt!586542 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!586546 () (_ BitVec 64))

(assert (=> b!1317698 (= lt!586546 (select (arr!42715 _keys!1628) from!2020))))

(assert (=> b!1317698 (= lt!586543 (addApplyDifferent!566 lt!586549 lt!586542 minValue!1296 lt!586546))))

(assert (=> b!1317698 (= (apply!1037 (+!4544 lt!586549 (tuple2!23175 lt!586542 minValue!1296)) lt!586546) (apply!1037 lt!586549 lt!586546))))

(declare-fun b!1317699 () Bool)

(assert (=> b!1317699 (= e!751781 (not call!64716))))

(declare-fun b!1317700 () Bool)

(declare-fun call!64714 () ListLongMap!20839)

(assert (=> b!1317700 (= e!751789 call!64714)))

(declare-fun b!1317701 () Bool)

(assert (=> b!1317701 (= e!751787 (not call!64713))))

(declare-fun b!1317702 () Bool)

(assert (=> b!1317702 (= e!751783 call!64714)))

(declare-fun b!1317703 () Bool)

(declare-fun e!751780 () Bool)

(declare-fun e!751782 () Bool)

(assert (=> b!1317703 (= e!751780 e!751782)))

(declare-fun res!874400 () Bool)

(assert (=> b!1317703 (=> (not res!874400) (not e!751782))))

(assert (=> b!1317703 (= res!874400 (contains!8597 lt!586562 (select (arr!42715 _keys!1628) from!2020)))))

(assert (=> b!1317703 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43266 _keys!1628)))))

(declare-fun bm!64710 () Bool)

(declare-fun call!64718 () ListLongMap!20839)

(assert (=> bm!64710 (= call!64714 call!64718)))

(declare-fun d!142961 () Bool)

(assert (=> d!142961 e!751785))

(declare-fun res!874399 () Bool)

(assert (=> d!142961 (=> (not res!874399) (not e!751785))))

(assert (=> d!142961 (= res!874399 (or (bvsge from!2020 (size!43266 _keys!1628)) (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43266 _keys!1628)))))))

(declare-fun lt!586552 () ListLongMap!20839)

(assert (=> d!142961 (= lt!586562 lt!586552)))

(declare-fun lt!586551 () Unit!43363)

(assert (=> d!142961 (= lt!586551 e!751779)))

(declare-fun c!125962 () Bool)

(declare-fun e!751778 () Bool)

(assert (=> d!142961 (= c!125962 e!751778)))

(declare-fun res!874403 () Bool)

(assert (=> d!142961 (=> (not res!874403) (not e!751778))))

(assert (=> d!142961 (= res!874403 (bvslt from!2020 (size!43266 _keys!1628)))))

(declare-fun e!751784 () ListLongMap!20839)

(assert (=> d!142961 (= lt!586552 e!751784)))

(declare-fun c!125961 () Bool)

(assert (=> d!142961 (= c!125961 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!142961 (validMask!0 mask!2040)))

(assert (=> d!142961 (= (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) lt!586562)))

(declare-fun b!1317704 () Bool)

(declare-fun res!874402 () Bool)

(assert (=> b!1317704 (=> (not res!874402) (not e!751785))))

(assert (=> b!1317704 (= res!874402 e!751780)))

(declare-fun res!874398 () Bool)

(assert (=> b!1317704 (=> res!874398 e!751780)))

(declare-fun e!751786 () Bool)

(assert (=> b!1317704 (= res!874398 (not e!751786))))

(declare-fun res!874401 () Bool)

(assert (=> b!1317704 (=> (not res!874401) (not e!751786))))

(assert (=> b!1317704 (= res!874401 (bvslt from!2020 (size!43266 _keys!1628)))))

(declare-fun c!125964 () Bool)

(declare-fun bm!64713 () Bool)

(assert (=> bm!64713 (= call!64718 (+!4544 (ite c!125961 call!64715 (ite c!125964 call!64717 call!64712)) (ite (or c!125961 c!125964) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(declare-fun b!1317705 () Bool)

(declare-fun get!21506 (ValueCell!16967 V!52745) V!52745)

(declare-fun dynLambda!3498 (Int (_ BitVec 64)) V!52745)

(assert (=> b!1317705 (= e!751782 (= (apply!1037 lt!586562 (select (arr!42715 _keys!1628) from!2020)) (get!21506 (select (arr!42714 _values!1354) from!2020) (dynLambda!3498 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1317705 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43265 _values!1354)))))

(assert (=> b!1317705 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43266 _keys!1628)))))

(declare-fun bm!64714 () Bool)

(assert (=> bm!64714 (= call!64716 (contains!8597 lt!586562 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1317706 () Bool)

(assert (=> b!1317706 (= e!751784 (+!4544 call!64718 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))

(declare-fun bm!64715 () Bool)

(assert (=> bm!64715 (= call!64713 (contains!8597 lt!586562 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1317707 () Bool)

(assert (=> b!1317707 (= e!751784 e!751783)))

(assert (=> b!1317707 (= c!125964 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1317708 () Bool)

(declare-fun res!874406 () Bool)

(assert (=> b!1317708 (=> (not res!874406) (not e!751785))))

(assert (=> b!1317708 (= res!874406 e!751787)))

(declare-fun c!125965 () Bool)

(assert (=> b!1317708 (= c!125965 (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1317709 () Bool)

(assert (=> b!1317709 (= e!751786 (validKeyInArray!0 (select (arr!42715 _keys!1628) from!2020)))))

(declare-fun b!1317710 () Bool)

(assert (=> b!1317710 (= e!751778 (validKeyInArray!0 (select (arr!42715 _keys!1628) from!2020)))))

(declare-fun b!1317711 () Bool)

(assert (=> b!1317711 (= e!751790 (= (apply!1037 lt!586562 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1296))))

(assert (= (and d!142961 c!125961) b!1317706))

(assert (= (and d!142961 (not c!125961)) b!1317707))

(assert (= (and b!1317707 c!125964) b!1317702))

(assert (= (and b!1317707 (not c!125964)) b!1317695))

(assert (= (and b!1317695 c!125966) b!1317700))

(assert (= (and b!1317695 (not c!125966)) b!1317692))

(assert (= (or b!1317700 b!1317692) bm!64712))

(assert (= (or b!1317702 bm!64712) bm!64709))

(assert (= (or b!1317702 b!1317700) bm!64710))

(assert (= (or b!1317706 bm!64709) bm!64711))

(assert (= (or b!1317706 bm!64710) bm!64713))

(assert (= (and d!142961 res!874403) b!1317710))

(assert (= (and d!142961 c!125962) b!1317698))

(assert (= (and d!142961 (not c!125962)) b!1317697))

(assert (= (and d!142961 res!874399) b!1317704))

(assert (= (and b!1317704 res!874401) b!1317709))

(assert (= (and b!1317704 (not res!874398)) b!1317703))

(assert (= (and b!1317703 res!874400) b!1317705))

(assert (= (and b!1317704 res!874402) b!1317708))

(assert (= (and b!1317708 c!125965) b!1317694))

(assert (= (and b!1317708 (not c!125965)) b!1317701))

(assert (= (and b!1317694 res!874405) b!1317696))

(assert (= (or b!1317694 b!1317701) bm!64715))

(assert (= (and b!1317708 res!874406) b!1317693))

(assert (= (and b!1317693 c!125963) b!1317691))

(assert (= (and b!1317693 (not c!125963)) b!1317699))

(assert (= (and b!1317691 res!874404) b!1317711))

(assert (= (or b!1317691 b!1317699) bm!64714))

(declare-fun b_lambda!23357 () Bool)

(assert (=> (not b_lambda!23357) (not b!1317705)))

(declare-fun t!43921 () Bool)

(declare-fun tb!11403 () Bool)

(assert (=> (and start!111390 (= defaultEntry!1357 defaultEntry!1357) t!43921) tb!11403))

(declare-fun result!23857 () Bool)

(assert (=> tb!11403 (= result!23857 tp_is_empty!35731)))

(assert (=> b!1317705 t!43921))

(declare-fun b_and!48217 () Bool)

(assert (= b_and!48211 (and (=> t!43921 result!23857) b_and!48217)))

(assert (=> b!1317710 m!1205789))

(assert (=> b!1317710 m!1205789))

(assert (=> b!1317710 m!1205791))

(declare-fun m!1205863 () Bool)

(assert (=> b!1317711 m!1205863))

(declare-fun m!1205865 () Bool)

(assert (=> bm!64714 m!1205865))

(declare-fun m!1205867 () Bool)

(assert (=> bm!64715 m!1205867))

(declare-fun m!1205869 () Bool)

(assert (=> b!1317698 m!1205869))

(declare-fun m!1205871 () Bool)

(assert (=> b!1317698 m!1205871))

(declare-fun m!1205873 () Bool)

(assert (=> b!1317698 m!1205873))

(declare-fun m!1205875 () Bool)

(assert (=> b!1317698 m!1205875))

(declare-fun m!1205877 () Bool)

(assert (=> b!1317698 m!1205877))

(declare-fun m!1205879 () Bool)

(assert (=> b!1317698 m!1205879))

(declare-fun m!1205881 () Bool)

(assert (=> b!1317698 m!1205881))

(declare-fun m!1205883 () Bool)

(assert (=> b!1317698 m!1205883))

(assert (=> b!1317698 m!1205881))

(declare-fun m!1205885 () Bool)

(assert (=> b!1317698 m!1205885))

(declare-fun m!1205887 () Bool)

(assert (=> b!1317698 m!1205887))

(assert (=> b!1317698 m!1205869))

(assert (=> b!1317698 m!1205879))

(declare-fun m!1205889 () Bool)

(assert (=> b!1317698 m!1205889))

(declare-fun m!1205891 () Bool)

(assert (=> b!1317698 m!1205891))

(declare-fun m!1205893 () Bool)

(assert (=> b!1317698 m!1205893))

(declare-fun m!1205895 () Bool)

(assert (=> b!1317698 m!1205895))

(declare-fun m!1205897 () Bool)

(assert (=> b!1317698 m!1205897))

(assert (=> b!1317698 m!1205789))

(assert (=> b!1317698 m!1205883))

(declare-fun m!1205899 () Bool)

(assert (=> b!1317698 m!1205899))

(assert (=> d!142961 m!1205783))

(assert (=> b!1317703 m!1205789))

(assert (=> b!1317703 m!1205789))

(declare-fun m!1205901 () Bool)

(assert (=> b!1317703 m!1205901))

(declare-fun m!1205903 () Bool)

(assert (=> b!1317696 m!1205903))

(declare-fun m!1205905 () Bool)

(assert (=> b!1317706 m!1205905))

(assert (=> b!1317709 m!1205789))

(assert (=> b!1317709 m!1205789))

(assert (=> b!1317709 m!1205791))

(declare-fun m!1205907 () Bool)

(assert (=> b!1317705 m!1205907))

(declare-fun m!1205909 () Bool)

(assert (=> b!1317705 m!1205909))

(declare-fun m!1205911 () Bool)

(assert (=> b!1317705 m!1205911))

(assert (=> b!1317705 m!1205789))

(declare-fun m!1205913 () Bool)

(assert (=> b!1317705 m!1205913))

(assert (=> b!1317705 m!1205909))

(assert (=> b!1317705 m!1205789))

(assert (=> b!1317705 m!1205907))

(assert (=> bm!64711 m!1205875))

(declare-fun m!1205915 () Bool)

(assert (=> bm!64713 m!1205915))

(assert (=> b!1317567 d!142961))

(declare-fun d!142963 () Bool)

(assert (=> d!142963 (= (validKeyInArray!0 (select (arr!42715 _keys!1628) from!2020)) (and (not (= (select (arr!42715 _keys!1628) from!2020) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!42715 _keys!1628) from!2020) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1317572 d!142963))

(declare-fun b!1317724 () Bool)

(declare-fun e!751800 () Bool)

(declare-fun e!751799 () Bool)

(assert (=> b!1317724 (= e!751800 e!751799)))

(declare-fun res!874413 () Bool)

(assert (=> b!1317724 (=> (not res!874413) (not e!751799))))

(declare-fun e!751801 () Bool)

(assert (=> b!1317724 (= res!874413 (not e!751801))))

(declare-fun res!874414 () Bool)

(assert (=> b!1317724 (=> (not res!874414) (not e!751801))))

(assert (=> b!1317724 (= res!874414 (validKeyInArray!0 (select (arr!42715 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun bm!64718 () Bool)

(declare-fun call!64721 () Bool)

(declare-fun c!125969 () Bool)

(assert (=> bm!64718 (= call!64721 (arrayNoDuplicates!0 _keys!1628 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125969 (Cons!30314 (select (arr!42715 _keys!1628) #b00000000000000000000000000000000) Nil!30315) Nil!30315)))))

(declare-fun d!142965 () Bool)

(declare-fun res!874415 () Bool)

(assert (=> d!142965 (=> res!874415 e!751800)))

(assert (=> d!142965 (= res!874415 (bvsge #b00000000000000000000000000000000 (size!43266 _keys!1628)))))

(assert (=> d!142965 (= (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30315) e!751800)))

(declare-fun b!1317725 () Bool)

(declare-fun e!751802 () Bool)

(assert (=> b!1317725 (= e!751799 e!751802)))

(assert (=> b!1317725 (= c!125969 (validKeyInArray!0 (select (arr!42715 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun b!1317726 () Bool)

(assert (=> b!1317726 (= e!751802 call!64721)))

(declare-fun b!1317727 () Bool)

(assert (=> b!1317727 (= e!751802 call!64721)))

(declare-fun b!1317728 () Bool)

(declare-fun contains!8599 (List!30318 (_ BitVec 64)) Bool)

(assert (=> b!1317728 (= e!751801 (contains!8599 Nil!30315 (select (arr!42715 _keys!1628) #b00000000000000000000000000000000)))))

(assert (= (and d!142965 (not res!874415)) b!1317724))

(assert (= (and b!1317724 res!874414) b!1317728))

(assert (= (and b!1317724 res!874413) b!1317725))

(assert (= (and b!1317725 c!125969) b!1317726))

(assert (= (and b!1317725 (not c!125969)) b!1317727))

(assert (= (or b!1317726 b!1317727) bm!64718))

(declare-fun m!1205917 () Bool)

(assert (=> b!1317724 m!1205917))

(assert (=> b!1317724 m!1205917))

(declare-fun m!1205919 () Bool)

(assert (=> b!1317724 m!1205919))

(assert (=> bm!64718 m!1205917))

(declare-fun m!1205921 () Bool)

(assert (=> bm!64718 m!1205921))

(assert (=> b!1317725 m!1205917))

(assert (=> b!1317725 m!1205917))

(assert (=> b!1317725 m!1205919))

(assert (=> b!1317728 m!1205917))

(assert (=> b!1317728 m!1205917))

(declare-fun m!1205923 () Bool)

(assert (=> b!1317728 m!1205923))

(assert (=> b!1317570 d!142965))

(declare-fun d!142967 () Bool)

(assert (=> d!142967 (= (validMask!0 mask!2040) (and (or (= mask!2040 #b00000000000000000000000000000111) (= mask!2040 #b00000000000000000000000000001111) (= mask!2040 #b00000000000000000000000000011111) (= mask!2040 #b00000000000000000000000000111111) (= mask!2040 #b00000000000000000000000001111111) (= mask!2040 #b00000000000000000000000011111111) (= mask!2040 #b00000000000000000000000111111111) (= mask!2040 #b00000000000000000000001111111111) (= mask!2040 #b00000000000000000000011111111111) (= mask!2040 #b00000000000000000000111111111111) (= mask!2040 #b00000000000000000001111111111111) (= mask!2040 #b00000000000000000011111111111111) (= mask!2040 #b00000000000000000111111111111111) (= mask!2040 #b00000000000000001111111111111111) (= mask!2040 #b00000000000000011111111111111111) (= mask!2040 #b00000000000000111111111111111111) (= mask!2040 #b00000000000001111111111111111111) (= mask!2040 #b00000000000011111111111111111111) (= mask!2040 #b00000000000111111111111111111111) (= mask!2040 #b00000000001111111111111111111111) (= mask!2040 #b00000000011111111111111111111111) (= mask!2040 #b00000000111111111111111111111111) (= mask!2040 #b00000001111111111111111111111111) (= mask!2040 #b00000011111111111111111111111111) (= mask!2040 #b00000111111111111111111111111111) (= mask!2040 #b00001111111111111111111111111111) (= mask!2040 #b00011111111111111111111111111111) (= mask!2040 #b00111111111111111111111111111111)) (bvsle mask!2040 #b00111111111111111111111111111111)))))

(assert (=> start!111390 d!142967))

(declare-fun d!142969 () Bool)

(assert (=> d!142969 (= (array_inv!32527 _keys!1628) (bvsge (size!43266 _keys!1628) #b00000000000000000000000000000000))))

(assert (=> start!111390 d!142969))

(declare-fun d!142971 () Bool)

(assert (=> d!142971 (= (array_inv!32528 _values!1354) (bvsge (size!43265 _values!1354) #b00000000000000000000000000000000))))

(assert (=> start!111390 d!142971))

(declare-fun d!142973 () Bool)

(declare-fun e!751803 () Bool)

(assert (=> d!142973 e!751803))

(declare-fun res!874416 () Bool)

(assert (=> d!142973 (=> res!874416 e!751803)))

(declare-fun lt!586563 () Bool)

(assert (=> d!142973 (= res!874416 (not lt!586563))))

(declare-fun lt!586566 () Bool)

(assert (=> d!142973 (= lt!586563 lt!586566)))

(declare-fun lt!586565 () Unit!43363)

(declare-fun e!751804 () Unit!43363)

(assert (=> d!142973 (= lt!586565 e!751804)))

(declare-fun c!125970 () Bool)

(assert (=> d!142973 (= c!125970 lt!586566)))

(assert (=> d!142973 (= lt!586566 (containsKey!733 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175))))

(assert (=> d!142973 (= (contains!8597 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175) lt!586563)))

(declare-fun b!1317729 () Bool)

(declare-fun lt!586564 () Unit!43363)

(assert (=> b!1317729 (= e!751804 lt!586564)))

(assert (=> b!1317729 (= lt!586564 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175))))

(assert (=> b!1317729 (isDefined!516 (getValueByKey!707 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175))))

(declare-fun b!1317730 () Bool)

(declare-fun Unit!43367 () Unit!43363)

(assert (=> b!1317730 (= e!751804 Unit!43367)))

(declare-fun b!1317731 () Bool)

(assert (=> b!1317731 (= e!751803 (isDefined!516 (getValueByKey!707 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175)))))

(assert (= (and d!142973 c!125970) b!1317729))

(assert (= (and d!142973 (not c!125970)) b!1317730))

(assert (= (and d!142973 (not res!874416)) b!1317731))

(declare-fun m!1205925 () Bool)

(assert (=> d!142973 m!1205925))

(declare-fun m!1205927 () Bool)

(assert (=> b!1317729 m!1205927))

(declare-fun m!1205929 () Bool)

(assert (=> b!1317729 m!1205929))

(assert (=> b!1317729 m!1205929))

(declare-fun m!1205931 () Bool)

(assert (=> b!1317729 m!1205931))

(assert (=> b!1317731 m!1205929))

(assert (=> b!1317731 m!1205929))

(assert (=> b!1317731 m!1205931))

(assert (=> b!1317568 d!142973))

(declare-fun b!1317732 () Bool)

(declare-fun e!751808 () Bool)

(declare-fun e!751817 () Bool)

(assert (=> b!1317732 (= e!751808 e!751817)))

(declare-fun res!874423 () Bool)

(declare-fun call!64726 () Bool)

(assert (=> b!1317732 (= res!874423 call!64726)))

(assert (=> b!1317732 (=> (not res!874423) (not e!751817))))

(declare-fun b!1317733 () Bool)

(declare-fun e!751816 () ListLongMap!20839)

(declare-fun call!64722 () ListLongMap!20839)

(assert (=> b!1317733 (= e!751816 call!64722)))

(declare-fun bm!64719 () Bool)

(declare-fun call!64727 () ListLongMap!20839)

(declare-fun call!64725 () ListLongMap!20839)

(assert (=> bm!64719 (= call!64727 call!64725)))

(declare-fun b!1317734 () Bool)

(declare-fun e!751812 () Bool)

(assert (=> b!1317734 (= e!751812 e!751808)))

(declare-fun c!125973 () Bool)

(assert (=> b!1317734 (= c!125973 (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1317735 () Bool)

(declare-fun e!751814 () Bool)

(declare-fun e!751815 () Bool)

(assert (=> b!1317735 (= e!751814 e!751815)))

(declare-fun res!874424 () Bool)

(declare-fun call!64723 () Bool)

(assert (=> b!1317735 (= res!874424 call!64723)))

(assert (=> b!1317735 (=> (not res!874424) (not e!751815))))

(declare-fun b!1317736 () Bool)

(declare-fun c!125976 () Bool)

(assert (=> b!1317736 (= c!125976 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!751810 () ListLongMap!20839)

(assert (=> b!1317736 (= e!751810 e!751816)))

(declare-fun b!1317737 () Bool)

(declare-fun lt!586588 () ListLongMap!20839)

(assert (=> b!1317737 (= e!751815 (= (apply!1037 lt!586588 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1296))))

(declare-fun b!1317738 () Bool)

(declare-fun e!751806 () Unit!43363)

(declare-fun Unit!43368 () Unit!43363)

(assert (=> b!1317738 (= e!751806 Unit!43368)))

(declare-fun bm!64721 () Bool)

(assert (=> bm!64721 (= call!64725 (getCurrentListMapNoExtraKeys!6183 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))))

(declare-fun bm!64722 () Bool)

(assert (=> bm!64722 (= call!64722 call!64727)))

(declare-fun b!1317739 () Bool)

(declare-fun lt!586569 () Unit!43363)

(assert (=> b!1317739 (= e!751806 lt!586569)))

(declare-fun lt!586571 () ListLongMap!20839)

(assert (=> b!1317739 (= lt!586571 (getCurrentListMapNoExtraKeys!6183 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))))

(declare-fun lt!586587 () (_ BitVec 64))

(assert (=> b!1317739 (= lt!586587 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!586576 () (_ BitVec 64))

(assert (=> b!1317739 (= lt!586576 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)))))

(declare-fun lt!586585 () Unit!43363)

(assert (=> b!1317739 (= lt!586585 (addStillContains!1124 lt!586571 lt!586587 zeroValue!1296 lt!586576))))

(assert (=> b!1317739 (contains!8597 (+!4544 lt!586571 (tuple2!23175 lt!586587 zeroValue!1296)) lt!586576)))

(declare-fun lt!586574 () Unit!43363)

(assert (=> b!1317739 (= lt!586574 lt!586585)))

(declare-fun lt!586583 () ListLongMap!20839)

(assert (=> b!1317739 (= lt!586583 (getCurrentListMapNoExtraKeys!6183 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))))

(declare-fun lt!586586 () (_ BitVec 64))

(assert (=> b!1317739 (= lt!586586 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!586573 () (_ BitVec 64))

(assert (=> b!1317739 (= lt!586573 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)))))

(declare-fun lt!586570 () Unit!43363)

(assert (=> b!1317739 (= lt!586570 (addApplyDifferent!566 lt!586583 lt!586586 minValue!1296 lt!586573))))

(assert (=> b!1317739 (= (apply!1037 (+!4544 lt!586583 (tuple2!23175 lt!586586 minValue!1296)) lt!586573) (apply!1037 lt!586583 lt!586573))))

(declare-fun lt!586579 () Unit!43363)

(assert (=> b!1317739 (= lt!586579 lt!586570)))

(declare-fun lt!586567 () ListLongMap!20839)

(assert (=> b!1317739 (= lt!586567 (getCurrentListMapNoExtraKeys!6183 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))))

(declare-fun lt!586581 () (_ BitVec 64))

(assert (=> b!1317739 (= lt!586581 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!586582 () (_ BitVec 64))

(assert (=> b!1317739 (= lt!586582 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)))))

(declare-fun lt!586584 () Unit!43363)

(assert (=> b!1317739 (= lt!586584 (addApplyDifferent!566 lt!586567 lt!586581 zeroValue!1296 lt!586582))))

(assert (=> b!1317739 (= (apply!1037 (+!4544 lt!586567 (tuple2!23175 lt!586581 zeroValue!1296)) lt!586582) (apply!1037 lt!586567 lt!586582))))

(declare-fun lt!586580 () Unit!43363)

(assert (=> b!1317739 (= lt!586580 lt!586584)))

(declare-fun lt!586575 () ListLongMap!20839)

(assert (=> b!1317739 (= lt!586575 (getCurrentListMapNoExtraKeys!6183 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))))

(declare-fun lt!586568 () (_ BitVec 64))

(assert (=> b!1317739 (= lt!586568 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!586572 () (_ BitVec 64))

(assert (=> b!1317739 (= lt!586572 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)))))

(assert (=> b!1317739 (= lt!586569 (addApplyDifferent!566 lt!586575 lt!586568 minValue!1296 lt!586572))))

(assert (=> b!1317739 (= (apply!1037 (+!4544 lt!586575 (tuple2!23175 lt!586568 minValue!1296)) lt!586572) (apply!1037 lt!586575 lt!586572))))

(declare-fun b!1317740 () Bool)

(assert (=> b!1317740 (= e!751808 (not call!64726))))

(declare-fun b!1317741 () Bool)

(declare-fun call!64724 () ListLongMap!20839)

(assert (=> b!1317741 (= e!751816 call!64724)))

(declare-fun b!1317742 () Bool)

(assert (=> b!1317742 (= e!751814 (not call!64723))))

(declare-fun b!1317743 () Bool)

(assert (=> b!1317743 (= e!751810 call!64724)))

(declare-fun b!1317744 () Bool)

(declare-fun e!751807 () Bool)

(declare-fun e!751809 () Bool)

(assert (=> b!1317744 (= e!751807 e!751809)))

(declare-fun res!874419 () Bool)

(assert (=> b!1317744 (=> (not res!874419) (not e!751809))))

(assert (=> b!1317744 (= res!874419 (contains!8597 lt!586588 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(assert (=> b!1317744 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43266 _keys!1628)))))

(declare-fun bm!64720 () Bool)

(declare-fun call!64728 () ListLongMap!20839)

(assert (=> bm!64720 (= call!64724 call!64728)))

(declare-fun d!142975 () Bool)

(assert (=> d!142975 e!751812))

(declare-fun res!874418 () Bool)

(assert (=> d!142975 (=> (not res!874418) (not e!751812))))

(assert (=> d!142975 (= res!874418 (or (bvsge (bvadd #b00000000000000000000000000000001 from!2020) (size!43266 _keys!1628)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43266 _keys!1628)))))))

(declare-fun lt!586578 () ListLongMap!20839)

(assert (=> d!142975 (= lt!586588 lt!586578)))

(declare-fun lt!586577 () Unit!43363)

(assert (=> d!142975 (= lt!586577 e!751806)))

(declare-fun c!125972 () Bool)

(declare-fun e!751805 () Bool)

(assert (=> d!142975 (= c!125972 e!751805)))

(declare-fun res!874422 () Bool)

(assert (=> d!142975 (=> (not res!874422) (not e!751805))))

(assert (=> d!142975 (= res!874422 (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43266 _keys!1628)))))

(declare-fun e!751811 () ListLongMap!20839)

(assert (=> d!142975 (= lt!586578 e!751811)))

(declare-fun c!125971 () Bool)

(assert (=> d!142975 (= c!125971 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!142975 (validMask!0 mask!2040)))

(assert (=> d!142975 (= (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) lt!586588)))

(declare-fun b!1317745 () Bool)

(declare-fun res!874421 () Bool)

(assert (=> b!1317745 (=> (not res!874421) (not e!751812))))

(assert (=> b!1317745 (= res!874421 e!751807)))

(declare-fun res!874417 () Bool)

(assert (=> b!1317745 (=> res!874417 e!751807)))

(declare-fun e!751813 () Bool)

(assert (=> b!1317745 (= res!874417 (not e!751813))))

(declare-fun res!874420 () Bool)

(assert (=> b!1317745 (=> (not res!874420) (not e!751813))))

(assert (=> b!1317745 (= res!874420 (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43266 _keys!1628)))))

(declare-fun bm!64723 () Bool)

(declare-fun c!125974 () Bool)

(assert (=> bm!64723 (= call!64728 (+!4544 (ite c!125971 call!64725 (ite c!125974 call!64727 call!64722)) (ite (or c!125971 c!125974) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(declare-fun b!1317746 () Bool)

(assert (=> b!1317746 (= e!751809 (= (apply!1037 lt!586588 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))) (get!21506 (select (arr!42714 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020)) (dynLambda!3498 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1317746 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43265 _values!1354)))))

(assert (=> b!1317746 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43266 _keys!1628)))))

(declare-fun bm!64724 () Bool)

(assert (=> bm!64724 (= call!64726 (contains!8597 lt!586588 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1317747 () Bool)

(assert (=> b!1317747 (= e!751811 (+!4544 call!64728 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))

(declare-fun bm!64725 () Bool)

(assert (=> bm!64725 (= call!64723 (contains!8597 lt!586588 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1317748 () Bool)

(assert (=> b!1317748 (= e!751811 e!751810)))

(assert (=> b!1317748 (= c!125974 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1317749 () Bool)

(declare-fun res!874425 () Bool)

(assert (=> b!1317749 (=> (not res!874425) (not e!751812))))

(assert (=> b!1317749 (= res!874425 e!751814)))

(declare-fun c!125975 () Bool)

(assert (=> b!1317749 (= c!125975 (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1317750 () Bool)

(assert (=> b!1317750 (= e!751813 (validKeyInArray!0 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(declare-fun b!1317751 () Bool)

(assert (=> b!1317751 (= e!751805 (validKeyInArray!0 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(declare-fun b!1317752 () Bool)

(assert (=> b!1317752 (= e!751817 (= (apply!1037 lt!586588 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1296))))

(assert (= (and d!142975 c!125971) b!1317747))

(assert (= (and d!142975 (not c!125971)) b!1317748))

(assert (= (and b!1317748 c!125974) b!1317743))

(assert (= (and b!1317748 (not c!125974)) b!1317736))

(assert (= (and b!1317736 c!125976) b!1317741))

(assert (= (and b!1317736 (not c!125976)) b!1317733))

(assert (= (or b!1317741 b!1317733) bm!64722))

(assert (= (or b!1317743 bm!64722) bm!64719))

(assert (= (or b!1317743 b!1317741) bm!64720))

(assert (= (or b!1317747 bm!64719) bm!64721))

(assert (= (or b!1317747 bm!64720) bm!64723))

(assert (= (and d!142975 res!874422) b!1317751))

(assert (= (and d!142975 c!125972) b!1317739))

(assert (= (and d!142975 (not c!125972)) b!1317738))

(assert (= (and d!142975 res!874418) b!1317745))

(assert (= (and b!1317745 res!874420) b!1317750))

(assert (= (and b!1317745 (not res!874417)) b!1317744))

(assert (= (and b!1317744 res!874419) b!1317746))

(assert (= (and b!1317745 res!874421) b!1317749))

(assert (= (and b!1317749 c!125975) b!1317735))

(assert (= (and b!1317749 (not c!125975)) b!1317742))

(assert (= (and b!1317735 res!874424) b!1317737))

(assert (= (or b!1317735 b!1317742) bm!64725))

(assert (= (and b!1317749 res!874425) b!1317734))

(assert (= (and b!1317734 c!125973) b!1317732))

(assert (= (and b!1317734 (not c!125973)) b!1317740))

(assert (= (and b!1317732 res!874423) b!1317752))

(assert (= (or b!1317732 b!1317740) bm!64724))

(declare-fun b_lambda!23359 () Bool)

(assert (=> (not b_lambda!23359) (not b!1317746)))

(assert (=> b!1317746 t!43921))

(declare-fun b_and!48219 () Bool)

(assert (= b_and!48217 (and (=> t!43921 result!23857) b_and!48219)))

(declare-fun m!1205933 () Bool)

(assert (=> b!1317751 m!1205933))

(assert (=> b!1317751 m!1205933))

(declare-fun m!1205935 () Bool)

(assert (=> b!1317751 m!1205935))

(declare-fun m!1205937 () Bool)

(assert (=> b!1317752 m!1205937))

(declare-fun m!1205939 () Bool)

(assert (=> bm!64724 m!1205939))

(declare-fun m!1205941 () Bool)

(assert (=> bm!64725 m!1205941))

(declare-fun m!1205943 () Bool)

(assert (=> b!1317739 m!1205943))

(declare-fun m!1205945 () Bool)

(assert (=> b!1317739 m!1205945))

(declare-fun m!1205947 () Bool)

(assert (=> b!1317739 m!1205947))

(declare-fun m!1205949 () Bool)

(assert (=> b!1317739 m!1205949))

(declare-fun m!1205951 () Bool)

(assert (=> b!1317739 m!1205951))

(declare-fun m!1205953 () Bool)

(assert (=> b!1317739 m!1205953))

(declare-fun m!1205955 () Bool)

(assert (=> b!1317739 m!1205955))

(declare-fun m!1205957 () Bool)

(assert (=> b!1317739 m!1205957))

(assert (=> b!1317739 m!1205955))

(declare-fun m!1205959 () Bool)

(assert (=> b!1317739 m!1205959))

(declare-fun m!1205961 () Bool)

(assert (=> b!1317739 m!1205961))

(assert (=> b!1317739 m!1205943))

(assert (=> b!1317739 m!1205953))

(declare-fun m!1205963 () Bool)

(assert (=> b!1317739 m!1205963))

(declare-fun m!1205965 () Bool)

(assert (=> b!1317739 m!1205965))

(declare-fun m!1205967 () Bool)

(assert (=> b!1317739 m!1205967))

(declare-fun m!1205969 () Bool)

(assert (=> b!1317739 m!1205969))

(declare-fun m!1205971 () Bool)

(assert (=> b!1317739 m!1205971))

(assert (=> b!1317739 m!1205933))

(assert (=> b!1317739 m!1205957))

(declare-fun m!1205973 () Bool)

(assert (=> b!1317739 m!1205973))

(assert (=> d!142975 m!1205783))

(assert (=> b!1317744 m!1205933))

(assert (=> b!1317744 m!1205933))

(declare-fun m!1205975 () Bool)

(assert (=> b!1317744 m!1205975))

(declare-fun m!1205977 () Bool)

(assert (=> b!1317737 m!1205977))

(declare-fun m!1205979 () Bool)

(assert (=> b!1317747 m!1205979))

(assert (=> b!1317750 m!1205933))

(assert (=> b!1317750 m!1205933))

(assert (=> b!1317750 m!1205935))

(declare-fun m!1205981 () Bool)

(assert (=> b!1317746 m!1205981))

(assert (=> b!1317746 m!1205909))

(declare-fun m!1205983 () Bool)

(assert (=> b!1317746 m!1205983))

(assert (=> b!1317746 m!1205933))

(declare-fun m!1205985 () Bool)

(assert (=> b!1317746 m!1205985))

(assert (=> b!1317746 m!1205909))

(assert (=> b!1317746 m!1205933))

(assert (=> b!1317746 m!1205981))

(assert (=> bm!64721 m!1205949))

(declare-fun m!1205987 () Bool)

(assert (=> bm!64723 m!1205987))

(assert (=> b!1317568 d!142975))

(declare-fun b!1317761 () Bool)

(declare-fun e!751824 () Bool)

(declare-fun call!64731 () Bool)

(assert (=> b!1317761 (= e!751824 call!64731)))

(declare-fun b!1317762 () Bool)

(declare-fun e!751826 () Bool)

(assert (=> b!1317762 (= e!751826 call!64731)))

(declare-fun b!1317763 () Bool)

(assert (=> b!1317763 (= e!751824 e!751826)))

(declare-fun lt!586597 () (_ BitVec 64))

(assert (=> b!1317763 (= lt!586597 (select (arr!42715 _keys!1628) #b00000000000000000000000000000000))))

(declare-fun lt!586596 () Unit!43363)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!88479 (_ BitVec 64) (_ BitVec 32)) Unit!43363)

(assert (=> b!1317763 (= lt!586596 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1628 lt!586597 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!88479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1317763 (arrayContainsKey!0 _keys!1628 lt!586597 #b00000000000000000000000000000000)))

(declare-fun lt!586595 () Unit!43363)

(assert (=> b!1317763 (= lt!586595 lt!586596)))

(declare-fun res!874430 () Bool)

(declare-datatypes ((SeekEntryResult!9991 0))(
  ( (MissingZero!9991 (index!42335 (_ BitVec 32))) (Found!9991 (index!42336 (_ BitVec 32))) (Intermediate!9991 (undefined!10803 Bool) (index!42337 (_ BitVec 32)) (x!117003 (_ BitVec 32))) (Undefined!9991) (MissingVacant!9991 (index!42338 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!88479 (_ BitVec 32)) SeekEntryResult!9991)

(assert (=> b!1317763 (= res!874430 (= (seekEntryOrOpen!0 (select (arr!42715 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040) (Found!9991 #b00000000000000000000000000000000)))))

(assert (=> b!1317763 (=> (not res!874430) (not e!751826))))

(declare-fun b!1317764 () Bool)

(declare-fun e!751825 () Bool)

(assert (=> b!1317764 (= e!751825 e!751824)))

(declare-fun c!125979 () Bool)

(assert (=> b!1317764 (= c!125979 (validKeyInArray!0 (select (arr!42715 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun bm!64728 () Bool)

(assert (=> bm!64728 (= call!64731 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1628 mask!2040))))

(declare-fun d!142977 () Bool)

(declare-fun res!874431 () Bool)

(assert (=> d!142977 (=> res!874431 e!751825)))

(assert (=> d!142977 (= res!874431 (bvsge #b00000000000000000000000000000000 (size!43266 _keys!1628)))))

(assert (=> d!142977 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040) e!751825)))

(assert (= (and d!142977 (not res!874431)) b!1317764))

(assert (= (and b!1317764 c!125979) b!1317763))

(assert (= (and b!1317764 (not c!125979)) b!1317761))

(assert (= (and b!1317763 res!874430) b!1317762))

(assert (= (or b!1317762 b!1317761) bm!64728))

(assert (=> b!1317763 m!1205917))

(declare-fun m!1205989 () Bool)

(assert (=> b!1317763 m!1205989))

(declare-fun m!1205991 () Bool)

(assert (=> b!1317763 m!1205991))

(assert (=> b!1317763 m!1205917))

(declare-fun m!1205993 () Bool)

(assert (=> b!1317763 m!1205993))

(assert (=> b!1317764 m!1205917))

(assert (=> b!1317764 m!1205917))

(assert (=> b!1317764 m!1205919))

(declare-fun m!1205995 () Bool)

(assert (=> bm!64728 m!1205995))

(assert (=> b!1317569 d!142977))

(declare-fun condMapEmpty!55234 () Bool)

(declare-fun mapDefault!55234 () ValueCell!16967)

(assert (=> mapNonEmpty!55225 (= condMapEmpty!55234 (= mapRest!55225 ((as const (Array (_ BitVec 32) ValueCell!16967)) mapDefault!55234)))))

(declare-fun e!751832 () Bool)

(declare-fun mapRes!55234 () Bool)

(assert (=> mapNonEmpty!55225 (= tp!105325 (and e!751832 mapRes!55234))))

(declare-fun b!1317772 () Bool)

(assert (=> b!1317772 (= e!751832 tp_is_empty!35731)))

(declare-fun mapNonEmpty!55234 () Bool)

(declare-fun tp!105340 () Bool)

(declare-fun e!751831 () Bool)

(assert (=> mapNonEmpty!55234 (= mapRes!55234 (and tp!105340 e!751831))))

(declare-fun mapKey!55234 () (_ BitVec 32))

(declare-fun mapValue!55234 () ValueCell!16967)

(declare-fun mapRest!55234 () (Array (_ BitVec 32) ValueCell!16967))

(assert (=> mapNonEmpty!55234 (= mapRest!55225 (store mapRest!55234 mapKey!55234 mapValue!55234))))

(declare-fun b!1317771 () Bool)

(assert (=> b!1317771 (= e!751831 tp_is_empty!35731)))

(declare-fun mapIsEmpty!55234 () Bool)

(assert (=> mapIsEmpty!55234 mapRes!55234))

(assert (= (and mapNonEmpty!55225 condMapEmpty!55234) mapIsEmpty!55234))

(assert (= (and mapNonEmpty!55225 (not condMapEmpty!55234)) mapNonEmpty!55234))

(assert (= (and mapNonEmpty!55234 ((_ is ValueCellFull!16967) mapValue!55234)) b!1317771))

(assert (= (and mapNonEmpty!55225 ((_ is ValueCellFull!16967) mapDefault!55234)) b!1317772))

(declare-fun m!1205997 () Bool)

(assert (=> mapNonEmpty!55234 m!1205997))

(declare-fun b_lambda!23361 () Bool)

(assert (= b_lambda!23357 (or (and start!111390 b_free!30001) b_lambda!23361)))

(declare-fun b_lambda!23363 () Bool)

(assert (= b_lambda!23359 (or (and start!111390 b_free!30001) b_lambda!23363)))

(check-sat (not b!1317731) (not b!1317705) (not b!1317752) (not b!1317746) (not b!1317646) (not bm!64723) (not b!1317710) (not bm!64714) b_and!48219 (not b!1317764) (not b!1317725) (not b!1317698) (not b_lambda!23361) (not bm!64718) (not b!1317744) (not b!1317728) (not d!142973) (not b!1317709) tp_is_empty!35731 (not b!1317750) (not mapNonEmpty!55234) (not b!1317729) (not bm!64711) (not b!1317763) (not b!1317739) (not b!1317751) (not b!1317648) (not bm!64721) (not bm!64728) (not bm!64713) (not b!1317747) (not d!142959) (not bm!64724) (not d!142975) (not b_lambda!23363) (not b!1317706) (not b_next!30001) (not d!142961) (not b!1317737) (not b!1317703) (not b!1317711) (not bm!64725) (not b!1317724) (not bm!64715) (not b!1317696))
(check-sat b_and!48219 (not b_next!30001))
(get-model)

(declare-fun d!142979 () Bool)

(declare-fun e!751835 () Bool)

(assert (=> d!142979 e!751835))

(declare-fun res!874436 () Bool)

(assert (=> d!142979 (=> (not res!874436) (not e!751835))))

(declare-fun lt!586609 () ListLongMap!20839)

(assert (=> d!142979 (= res!874436 (contains!8597 lt!586609 (_1!11598 (tuple2!23175 lt!586568 minValue!1296))))))

(declare-fun lt!586607 () List!30317)

(assert (=> d!142979 (= lt!586609 (ListLongMap!20840 lt!586607))))

(declare-fun lt!586606 () Unit!43363)

(declare-fun lt!586608 () Unit!43363)

(assert (=> d!142979 (= lt!586606 lt!586608)))

(assert (=> d!142979 (= (getValueByKey!707 lt!586607 (_1!11598 (tuple2!23175 lt!586568 minValue!1296))) (Some!757 (_2!11598 (tuple2!23175 lt!586568 minValue!1296))))))

(declare-fun lemmaContainsTupThenGetReturnValue!357 (List!30317 (_ BitVec 64) V!52745) Unit!43363)

(assert (=> d!142979 (= lt!586608 (lemmaContainsTupThenGetReturnValue!357 lt!586607 (_1!11598 (tuple2!23175 lt!586568 minValue!1296)) (_2!11598 (tuple2!23175 lt!586568 minValue!1296))))))

(declare-fun insertStrictlySorted!486 (List!30317 (_ BitVec 64) V!52745) List!30317)

(assert (=> d!142979 (= lt!586607 (insertStrictlySorted!486 (toList!10435 lt!586575) (_1!11598 (tuple2!23175 lt!586568 minValue!1296)) (_2!11598 (tuple2!23175 lt!586568 minValue!1296))))))

(assert (=> d!142979 (= (+!4544 lt!586575 (tuple2!23175 lt!586568 minValue!1296)) lt!586609)))

(declare-fun b!1317777 () Bool)

(declare-fun res!874437 () Bool)

(assert (=> b!1317777 (=> (not res!874437) (not e!751835))))

(assert (=> b!1317777 (= res!874437 (= (getValueByKey!707 (toList!10435 lt!586609) (_1!11598 (tuple2!23175 lt!586568 minValue!1296))) (Some!757 (_2!11598 (tuple2!23175 lt!586568 minValue!1296)))))))

(declare-fun b!1317778 () Bool)

(declare-fun contains!8600 (List!30317 tuple2!23174) Bool)

(assert (=> b!1317778 (= e!751835 (contains!8600 (toList!10435 lt!586609) (tuple2!23175 lt!586568 minValue!1296)))))

(assert (= (and d!142979 res!874436) b!1317777))

(assert (= (and b!1317777 res!874437) b!1317778))

(declare-fun m!1205999 () Bool)

(assert (=> d!142979 m!1205999))

(declare-fun m!1206001 () Bool)

(assert (=> d!142979 m!1206001))

(declare-fun m!1206003 () Bool)

(assert (=> d!142979 m!1206003))

(declare-fun m!1206005 () Bool)

(assert (=> d!142979 m!1206005))

(declare-fun m!1206007 () Bool)

(assert (=> b!1317777 m!1206007))

(declare-fun m!1206009 () Bool)

(assert (=> b!1317778 m!1206009))

(assert (=> b!1317739 d!142979))

(declare-fun d!142981 () Bool)

(declare-fun e!751836 () Bool)

(assert (=> d!142981 e!751836))

(declare-fun res!874438 () Bool)

(assert (=> d!142981 (=> (not res!874438) (not e!751836))))

(declare-fun lt!586613 () ListLongMap!20839)

(assert (=> d!142981 (= res!874438 (contains!8597 lt!586613 (_1!11598 (tuple2!23175 lt!586581 zeroValue!1296))))))

(declare-fun lt!586611 () List!30317)

(assert (=> d!142981 (= lt!586613 (ListLongMap!20840 lt!586611))))

(declare-fun lt!586610 () Unit!43363)

(declare-fun lt!586612 () Unit!43363)

(assert (=> d!142981 (= lt!586610 lt!586612)))

(assert (=> d!142981 (= (getValueByKey!707 lt!586611 (_1!11598 (tuple2!23175 lt!586581 zeroValue!1296))) (Some!757 (_2!11598 (tuple2!23175 lt!586581 zeroValue!1296))))))

(assert (=> d!142981 (= lt!586612 (lemmaContainsTupThenGetReturnValue!357 lt!586611 (_1!11598 (tuple2!23175 lt!586581 zeroValue!1296)) (_2!11598 (tuple2!23175 lt!586581 zeroValue!1296))))))

(assert (=> d!142981 (= lt!586611 (insertStrictlySorted!486 (toList!10435 lt!586567) (_1!11598 (tuple2!23175 lt!586581 zeroValue!1296)) (_2!11598 (tuple2!23175 lt!586581 zeroValue!1296))))))

(assert (=> d!142981 (= (+!4544 lt!586567 (tuple2!23175 lt!586581 zeroValue!1296)) lt!586613)))

(declare-fun b!1317779 () Bool)

(declare-fun res!874439 () Bool)

(assert (=> b!1317779 (=> (not res!874439) (not e!751836))))

(assert (=> b!1317779 (= res!874439 (= (getValueByKey!707 (toList!10435 lt!586613) (_1!11598 (tuple2!23175 lt!586581 zeroValue!1296))) (Some!757 (_2!11598 (tuple2!23175 lt!586581 zeroValue!1296)))))))

(declare-fun b!1317780 () Bool)

(assert (=> b!1317780 (= e!751836 (contains!8600 (toList!10435 lt!586613) (tuple2!23175 lt!586581 zeroValue!1296)))))

(assert (= (and d!142981 res!874438) b!1317779))

(assert (= (and b!1317779 res!874439) b!1317780))

(declare-fun m!1206011 () Bool)

(assert (=> d!142981 m!1206011))

(declare-fun m!1206013 () Bool)

(assert (=> d!142981 m!1206013))

(declare-fun m!1206015 () Bool)

(assert (=> d!142981 m!1206015))

(declare-fun m!1206017 () Bool)

(assert (=> d!142981 m!1206017))

(declare-fun m!1206019 () Bool)

(assert (=> b!1317779 m!1206019))

(declare-fun m!1206021 () Bool)

(assert (=> b!1317780 m!1206021))

(assert (=> b!1317739 d!142981))

(declare-fun b!1317805 () Bool)

(assert (=> b!1317805 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43266 _keys!1628)))))

(assert (=> b!1317805 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43265 _values!1354)))))

(declare-fun e!751852 () Bool)

(declare-fun lt!586633 () ListLongMap!20839)

(assert (=> b!1317805 (= e!751852 (= (apply!1037 lt!586633 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))) (get!21506 (select (arr!42714 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020)) (dynLambda!3498 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1317806 () Bool)

(declare-fun e!751853 () Bool)

(declare-fun e!751857 () Bool)

(assert (=> b!1317806 (= e!751853 e!751857)))

(declare-fun c!125989 () Bool)

(assert (=> b!1317806 (= c!125989 (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43266 _keys!1628)))))

(declare-fun b!1317807 () Bool)

(declare-fun isEmpty!1077 (ListLongMap!20839) Bool)

(assert (=> b!1317807 (= e!751857 (isEmpty!1077 lt!586633))))

(declare-fun d!142983 () Bool)

(declare-fun e!751851 () Bool)

(assert (=> d!142983 e!751851))

(declare-fun res!874448 () Bool)

(assert (=> d!142983 (=> (not res!874448) (not e!751851))))

(assert (=> d!142983 (= res!874448 (not (contains!8597 lt!586633 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!751856 () ListLongMap!20839)

(assert (=> d!142983 (= lt!586633 e!751856)))

(declare-fun c!125990 () Bool)

(assert (=> d!142983 (= c!125990 (bvsge (bvadd #b00000000000000000000000000000001 from!2020) (size!43266 _keys!1628)))))

(assert (=> d!142983 (validMask!0 mask!2040)))

(assert (=> d!142983 (= (getCurrentListMapNoExtraKeys!6183 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) lt!586633)))

(declare-fun b!1317808 () Bool)

(declare-fun e!751854 () Bool)

(assert (=> b!1317808 (= e!751854 (validKeyInArray!0 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(assert (=> b!1317808 (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000)))

(declare-fun b!1317809 () Bool)

(declare-fun e!751855 () ListLongMap!20839)

(assert (=> b!1317809 (= e!751856 e!751855)))

(declare-fun c!125991 () Bool)

(assert (=> b!1317809 (= c!125991 (validKeyInArray!0 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(declare-fun bm!64731 () Bool)

(declare-fun call!64734 () ListLongMap!20839)

(assert (=> bm!64731 (= call!64734 (getCurrentListMapNoExtraKeys!6183 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020 #b00000000000000000000000000000001) defaultEntry!1357))))

(declare-fun b!1317810 () Bool)

(assert (=> b!1317810 (= e!751855 call!64734)))

(declare-fun b!1317811 () Bool)

(declare-fun res!874450 () Bool)

(assert (=> b!1317811 (=> (not res!874450) (not e!751851))))

(assert (=> b!1317811 (= res!874450 (not (contains!8597 lt!586633 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1317812 () Bool)

(assert (=> b!1317812 (= e!751857 (= lt!586633 (getCurrentListMapNoExtraKeys!6183 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020 #b00000000000000000000000000000001) defaultEntry!1357)))))

(declare-fun b!1317813 () Bool)

(assert (=> b!1317813 (= e!751851 e!751853)))

(declare-fun c!125988 () Bool)

(assert (=> b!1317813 (= c!125988 e!751854)))

(declare-fun res!874451 () Bool)

(assert (=> b!1317813 (=> (not res!874451) (not e!751854))))

(assert (=> b!1317813 (= res!874451 (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43266 _keys!1628)))))

(declare-fun b!1317814 () Bool)

(assert (=> b!1317814 (= e!751853 e!751852)))

(assert (=> b!1317814 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43266 _keys!1628)))))

(declare-fun res!874449 () Bool)

(assert (=> b!1317814 (= res!874449 (contains!8597 lt!586633 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(assert (=> b!1317814 (=> (not res!874449) (not e!751852))))

(declare-fun b!1317815 () Bool)

(assert (=> b!1317815 (= e!751856 (ListLongMap!20840 Nil!30314))))

(declare-fun b!1317816 () Bool)

(declare-fun lt!586630 () Unit!43363)

(declare-fun lt!586631 () Unit!43363)

(assert (=> b!1317816 (= lt!586630 lt!586631)))

(declare-fun lt!586632 () ListLongMap!20839)

(declare-fun lt!586629 () (_ BitVec 64))

(declare-fun lt!586628 () V!52745)

(declare-fun lt!586634 () (_ BitVec 64))

(assert (=> b!1317816 (not (contains!8597 (+!4544 lt!586632 (tuple2!23175 lt!586634 lt!586628)) lt!586629))))

(declare-fun addStillNotContains!493 (ListLongMap!20839 (_ BitVec 64) V!52745 (_ BitVec 64)) Unit!43363)

(assert (=> b!1317816 (= lt!586631 (addStillNotContains!493 lt!586632 lt!586634 lt!586628 lt!586629))))

(assert (=> b!1317816 (= lt!586629 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1317816 (= lt!586628 (get!21506 (select (arr!42714 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020)) (dynLambda!3498 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1317816 (= lt!586634 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)))))

(assert (=> b!1317816 (= lt!586632 call!64734)))

(assert (=> b!1317816 (= e!751855 (+!4544 call!64734 (tuple2!23175 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)) (get!21506 (select (arr!42714 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020)) (dynLambda!3498 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!142983 c!125990) b!1317815))

(assert (= (and d!142983 (not c!125990)) b!1317809))

(assert (= (and b!1317809 c!125991) b!1317816))

(assert (= (and b!1317809 (not c!125991)) b!1317810))

(assert (= (or b!1317816 b!1317810) bm!64731))

(assert (= (and d!142983 res!874448) b!1317811))

(assert (= (and b!1317811 res!874450) b!1317813))

(assert (= (and b!1317813 res!874451) b!1317808))

(assert (= (and b!1317813 c!125988) b!1317814))

(assert (= (and b!1317813 (not c!125988)) b!1317806))

(assert (= (and b!1317814 res!874449) b!1317805))

(assert (= (and b!1317806 c!125989) b!1317812))

(assert (= (and b!1317806 (not c!125989)) b!1317807))

(declare-fun b_lambda!23365 () Bool)

(assert (=> (not b_lambda!23365) (not b!1317805)))

(assert (=> b!1317805 t!43921))

(declare-fun b_and!48221 () Bool)

(assert (= b_and!48219 (and (=> t!43921 result!23857) b_and!48221)))

(declare-fun b_lambda!23367 () Bool)

(assert (=> (not b_lambda!23367) (not b!1317816)))

(assert (=> b!1317816 t!43921))

(declare-fun b_and!48223 () Bool)

(assert (= b_and!48221 (and (=> t!43921 result!23857) b_and!48223)))

(assert (=> b!1317809 m!1205933))

(assert (=> b!1317809 m!1205933))

(assert (=> b!1317809 m!1205935))

(assert (=> b!1317814 m!1205933))

(assert (=> b!1317814 m!1205933))

(declare-fun m!1206023 () Bool)

(assert (=> b!1317814 m!1206023))

(declare-fun m!1206025 () Bool)

(assert (=> bm!64731 m!1206025))

(assert (=> b!1317808 m!1205933))

(assert (=> b!1317808 m!1205933))

(assert (=> b!1317808 m!1205935))

(assert (=> b!1317812 m!1206025))

(declare-fun m!1206027 () Bool)

(assert (=> b!1317811 m!1206027))

(assert (=> b!1317805 m!1205933))

(assert (=> b!1317805 m!1205981))

(assert (=> b!1317805 m!1205933))

(declare-fun m!1206029 () Bool)

(assert (=> b!1317805 m!1206029))

(assert (=> b!1317805 m!1205981))

(assert (=> b!1317805 m!1205909))

(assert (=> b!1317805 m!1205983))

(assert (=> b!1317805 m!1205909))

(declare-fun m!1206031 () Bool)

(assert (=> b!1317807 m!1206031))

(declare-fun m!1206033 () Bool)

(assert (=> d!142983 m!1206033))

(assert (=> d!142983 m!1205783))

(assert (=> b!1317816 m!1205981))

(declare-fun m!1206035 () Bool)

(assert (=> b!1317816 m!1206035))

(declare-fun m!1206037 () Bool)

(assert (=> b!1317816 m!1206037))

(declare-fun m!1206039 () Bool)

(assert (=> b!1317816 m!1206039))

(assert (=> b!1317816 m!1205981))

(assert (=> b!1317816 m!1205909))

(assert (=> b!1317816 m!1205983))

(assert (=> b!1317816 m!1205909))

(assert (=> b!1317816 m!1206035))

(assert (=> b!1317816 m!1205933))

(declare-fun m!1206041 () Bool)

(assert (=> b!1317816 m!1206041))

(assert (=> b!1317739 d!142983))

(declare-fun d!142985 () Bool)

(declare-fun get!21507 (Option!758) V!52745)

(assert (=> d!142985 (= (apply!1037 (+!4544 lt!586567 (tuple2!23175 lt!586581 zeroValue!1296)) lt!586582) (get!21507 (getValueByKey!707 (toList!10435 (+!4544 lt!586567 (tuple2!23175 lt!586581 zeroValue!1296))) lt!586582)))))

(declare-fun bs!37615 () Bool)

(assert (= bs!37615 d!142985))

(declare-fun m!1206043 () Bool)

(assert (=> bs!37615 m!1206043))

(assert (=> bs!37615 m!1206043))

(declare-fun m!1206045 () Bool)

(assert (=> bs!37615 m!1206045))

(assert (=> b!1317739 d!142985))

(declare-fun d!142987 () Bool)

(assert (=> d!142987 (= (apply!1037 (+!4544 lt!586583 (tuple2!23175 lt!586586 minValue!1296)) lt!586573) (get!21507 (getValueByKey!707 (toList!10435 (+!4544 lt!586583 (tuple2!23175 lt!586586 minValue!1296))) lt!586573)))))

(declare-fun bs!37616 () Bool)

(assert (= bs!37616 d!142987))

(declare-fun m!1206047 () Bool)

(assert (=> bs!37616 m!1206047))

(assert (=> bs!37616 m!1206047))

(declare-fun m!1206049 () Bool)

(assert (=> bs!37616 m!1206049))

(assert (=> b!1317739 d!142987))

(declare-fun d!142989 () Bool)

(assert (=> d!142989 (= (apply!1037 lt!586567 lt!586582) (get!21507 (getValueByKey!707 (toList!10435 lt!586567) lt!586582)))))

(declare-fun bs!37617 () Bool)

(assert (= bs!37617 d!142989))

(declare-fun m!1206051 () Bool)

(assert (=> bs!37617 m!1206051))

(assert (=> bs!37617 m!1206051))

(declare-fun m!1206053 () Bool)

(assert (=> bs!37617 m!1206053))

(assert (=> b!1317739 d!142989))

(declare-fun d!142991 () Bool)

(assert (=> d!142991 (= (apply!1037 (+!4544 lt!586583 (tuple2!23175 lt!586586 minValue!1296)) lt!586573) (apply!1037 lt!586583 lt!586573))))

(declare-fun lt!586637 () Unit!43363)

(declare-fun choose!1945 (ListLongMap!20839 (_ BitVec 64) V!52745 (_ BitVec 64)) Unit!43363)

(assert (=> d!142991 (= lt!586637 (choose!1945 lt!586583 lt!586586 minValue!1296 lt!586573))))

(declare-fun e!751860 () Bool)

(assert (=> d!142991 e!751860))

(declare-fun res!874454 () Bool)

(assert (=> d!142991 (=> (not res!874454) (not e!751860))))

(assert (=> d!142991 (= res!874454 (contains!8597 lt!586583 lt!586573))))

(assert (=> d!142991 (= (addApplyDifferent!566 lt!586583 lt!586586 minValue!1296 lt!586573) lt!586637)))

(declare-fun b!1317820 () Bool)

(assert (=> b!1317820 (= e!751860 (not (= lt!586573 lt!586586)))))

(assert (= (and d!142991 res!874454) b!1317820))

(declare-fun m!1206055 () Bool)

(assert (=> d!142991 m!1206055))

(assert (=> d!142991 m!1205943))

(assert (=> d!142991 m!1205947))

(declare-fun m!1206057 () Bool)

(assert (=> d!142991 m!1206057))

(assert (=> d!142991 m!1205943))

(assert (=> d!142991 m!1205945))

(assert (=> b!1317739 d!142991))

(declare-fun d!142993 () Bool)

(assert (=> d!142993 (= (apply!1037 (+!4544 lt!586567 (tuple2!23175 lt!586581 zeroValue!1296)) lt!586582) (apply!1037 lt!586567 lt!586582))))

(declare-fun lt!586638 () Unit!43363)

(assert (=> d!142993 (= lt!586638 (choose!1945 lt!586567 lt!586581 zeroValue!1296 lt!586582))))

(declare-fun e!751861 () Bool)

(assert (=> d!142993 e!751861))

(declare-fun res!874455 () Bool)

(assert (=> d!142993 (=> (not res!874455) (not e!751861))))

(assert (=> d!142993 (= res!874455 (contains!8597 lt!586567 lt!586582))))

(assert (=> d!142993 (= (addApplyDifferent!566 lt!586567 lt!586581 zeroValue!1296 lt!586582) lt!586638)))

(declare-fun b!1317821 () Bool)

(assert (=> b!1317821 (= e!751861 (not (= lt!586582 lt!586581)))))

(assert (= (and d!142993 res!874455) b!1317821))

(declare-fun m!1206059 () Bool)

(assert (=> d!142993 m!1206059))

(assert (=> d!142993 m!1205957))

(assert (=> d!142993 m!1205951))

(declare-fun m!1206061 () Bool)

(assert (=> d!142993 m!1206061))

(assert (=> d!142993 m!1205957))

(assert (=> d!142993 m!1205973))

(assert (=> b!1317739 d!142993))

(declare-fun d!142995 () Bool)

(assert (=> d!142995 (= (apply!1037 lt!586583 lt!586573) (get!21507 (getValueByKey!707 (toList!10435 lt!586583) lt!586573)))))

(declare-fun bs!37618 () Bool)

(assert (= bs!37618 d!142995))

(declare-fun m!1206063 () Bool)

(assert (=> bs!37618 m!1206063))

(assert (=> bs!37618 m!1206063))

(declare-fun m!1206065 () Bool)

(assert (=> bs!37618 m!1206065))

(assert (=> b!1317739 d!142995))

(declare-fun d!142997 () Bool)

(declare-fun e!751862 () Bool)

(assert (=> d!142997 e!751862))

(declare-fun res!874456 () Bool)

(assert (=> d!142997 (=> (not res!874456) (not e!751862))))

(declare-fun lt!586642 () ListLongMap!20839)

(assert (=> d!142997 (= res!874456 (contains!8597 lt!586642 (_1!11598 (tuple2!23175 lt!586586 minValue!1296))))))

(declare-fun lt!586640 () List!30317)

(assert (=> d!142997 (= lt!586642 (ListLongMap!20840 lt!586640))))

(declare-fun lt!586639 () Unit!43363)

(declare-fun lt!586641 () Unit!43363)

(assert (=> d!142997 (= lt!586639 lt!586641)))

(assert (=> d!142997 (= (getValueByKey!707 lt!586640 (_1!11598 (tuple2!23175 lt!586586 minValue!1296))) (Some!757 (_2!11598 (tuple2!23175 lt!586586 minValue!1296))))))

(assert (=> d!142997 (= lt!586641 (lemmaContainsTupThenGetReturnValue!357 lt!586640 (_1!11598 (tuple2!23175 lt!586586 minValue!1296)) (_2!11598 (tuple2!23175 lt!586586 minValue!1296))))))

(assert (=> d!142997 (= lt!586640 (insertStrictlySorted!486 (toList!10435 lt!586583) (_1!11598 (tuple2!23175 lt!586586 minValue!1296)) (_2!11598 (tuple2!23175 lt!586586 minValue!1296))))))

(assert (=> d!142997 (= (+!4544 lt!586583 (tuple2!23175 lt!586586 minValue!1296)) lt!586642)))

(declare-fun b!1317822 () Bool)

(declare-fun res!874457 () Bool)

(assert (=> b!1317822 (=> (not res!874457) (not e!751862))))

(assert (=> b!1317822 (= res!874457 (= (getValueByKey!707 (toList!10435 lt!586642) (_1!11598 (tuple2!23175 lt!586586 minValue!1296))) (Some!757 (_2!11598 (tuple2!23175 lt!586586 minValue!1296)))))))

(declare-fun b!1317823 () Bool)

(assert (=> b!1317823 (= e!751862 (contains!8600 (toList!10435 lt!586642) (tuple2!23175 lt!586586 minValue!1296)))))

(assert (= (and d!142997 res!874456) b!1317822))

(assert (= (and b!1317822 res!874457) b!1317823))

(declare-fun m!1206067 () Bool)

(assert (=> d!142997 m!1206067))

(declare-fun m!1206069 () Bool)

(assert (=> d!142997 m!1206069))

(declare-fun m!1206071 () Bool)

(assert (=> d!142997 m!1206071))

(declare-fun m!1206073 () Bool)

(assert (=> d!142997 m!1206073))

(declare-fun m!1206075 () Bool)

(assert (=> b!1317822 m!1206075))

(declare-fun m!1206077 () Bool)

(assert (=> b!1317823 m!1206077))

(assert (=> b!1317739 d!142997))

(declare-fun d!142999 () Bool)

(assert (=> d!142999 (= (apply!1037 lt!586575 lt!586572) (get!21507 (getValueByKey!707 (toList!10435 lt!586575) lt!586572)))))

(declare-fun bs!37619 () Bool)

(assert (= bs!37619 d!142999))

(declare-fun m!1206079 () Bool)

(assert (=> bs!37619 m!1206079))

(assert (=> bs!37619 m!1206079))

(declare-fun m!1206081 () Bool)

(assert (=> bs!37619 m!1206081))

(assert (=> b!1317739 d!142999))

(declare-fun d!143001 () Bool)

(declare-fun e!751863 () Bool)

(assert (=> d!143001 e!751863))

(declare-fun res!874458 () Bool)

(assert (=> d!143001 (=> (not res!874458) (not e!751863))))

(declare-fun lt!586646 () ListLongMap!20839)

(assert (=> d!143001 (= res!874458 (contains!8597 lt!586646 (_1!11598 (tuple2!23175 lt!586587 zeroValue!1296))))))

(declare-fun lt!586644 () List!30317)

(assert (=> d!143001 (= lt!586646 (ListLongMap!20840 lt!586644))))

(declare-fun lt!586643 () Unit!43363)

(declare-fun lt!586645 () Unit!43363)

(assert (=> d!143001 (= lt!586643 lt!586645)))

(assert (=> d!143001 (= (getValueByKey!707 lt!586644 (_1!11598 (tuple2!23175 lt!586587 zeroValue!1296))) (Some!757 (_2!11598 (tuple2!23175 lt!586587 zeroValue!1296))))))

(assert (=> d!143001 (= lt!586645 (lemmaContainsTupThenGetReturnValue!357 lt!586644 (_1!11598 (tuple2!23175 lt!586587 zeroValue!1296)) (_2!11598 (tuple2!23175 lt!586587 zeroValue!1296))))))

(assert (=> d!143001 (= lt!586644 (insertStrictlySorted!486 (toList!10435 lt!586571) (_1!11598 (tuple2!23175 lt!586587 zeroValue!1296)) (_2!11598 (tuple2!23175 lt!586587 zeroValue!1296))))))

(assert (=> d!143001 (= (+!4544 lt!586571 (tuple2!23175 lt!586587 zeroValue!1296)) lt!586646)))

(declare-fun b!1317824 () Bool)

(declare-fun res!874459 () Bool)

(assert (=> b!1317824 (=> (not res!874459) (not e!751863))))

(assert (=> b!1317824 (= res!874459 (= (getValueByKey!707 (toList!10435 lt!586646) (_1!11598 (tuple2!23175 lt!586587 zeroValue!1296))) (Some!757 (_2!11598 (tuple2!23175 lt!586587 zeroValue!1296)))))))

(declare-fun b!1317825 () Bool)

(assert (=> b!1317825 (= e!751863 (contains!8600 (toList!10435 lt!586646) (tuple2!23175 lt!586587 zeroValue!1296)))))

(assert (= (and d!143001 res!874458) b!1317824))

(assert (= (and b!1317824 res!874459) b!1317825))

(declare-fun m!1206083 () Bool)

(assert (=> d!143001 m!1206083))

(declare-fun m!1206085 () Bool)

(assert (=> d!143001 m!1206085))

(declare-fun m!1206087 () Bool)

(assert (=> d!143001 m!1206087))

(declare-fun m!1206089 () Bool)

(assert (=> d!143001 m!1206089))

(declare-fun m!1206091 () Bool)

(assert (=> b!1317824 m!1206091))

(declare-fun m!1206093 () Bool)

(assert (=> b!1317825 m!1206093))

(assert (=> b!1317739 d!143001))

(declare-fun d!143003 () Bool)

(assert (=> d!143003 (= (apply!1037 (+!4544 lt!586575 (tuple2!23175 lt!586568 minValue!1296)) lt!586572) (apply!1037 lt!586575 lt!586572))))

(declare-fun lt!586647 () Unit!43363)

(assert (=> d!143003 (= lt!586647 (choose!1945 lt!586575 lt!586568 minValue!1296 lt!586572))))

(declare-fun e!751864 () Bool)

(assert (=> d!143003 e!751864))

(declare-fun res!874460 () Bool)

(assert (=> d!143003 (=> (not res!874460) (not e!751864))))

(assert (=> d!143003 (= res!874460 (contains!8597 lt!586575 lt!586572))))

(assert (=> d!143003 (= (addApplyDifferent!566 lt!586575 lt!586568 minValue!1296 lt!586572) lt!586647)))

(declare-fun b!1317826 () Bool)

(assert (=> b!1317826 (= e!751864 (not (= lt!586572 lt!586568)))))

(assert (= (and d!143003 res!874460) b!1317826))

(declare-fun m!1206095 () Bool)

(assert (=> d!143003 m!1206095))

(assert (=> d!143003 m!1205955))

(assert (=> d!143003 m!1205967))

(declare-fun m!1206097 () Bool)

(assert (=> d!143003 m!1206097))

(assert (=> d!143003 m!1205955))

(assert (=> d!143003 m!1205959))

(assert (=> b!1317739 d!143003))

(declare-fun d!143005 () Bool)

(assert (=> d!143005 (= (apply!1037 (+!4544 lt!586575 (tuple2!23175 lt!586568 minValue!1296)) lt!586572) (get!21507 (getValueByKey!707 (toList!10435 (+!4544 lt!586575 (tuple2!23175 lt!586568 minValue!1296))) lt!586572)))))

(declare-fun bs!37620 () Bool)

(assert (= bs!37620 d!143005))

(declare-fun m!1206099 () Bool)

(assert (=> bs!37620 m!1206099))

(assert (=> bs!37620 m!1206099))

(declare-fun m!1206101 () Bool)

(assert (=> bs!37620 m!1206101))

(assert (=> b!1317739 d!143005))

(declare-fun d!143007 () Bool)

(declare-fun e!751865 () Bool)

(assert (=> d!143007 e!751865))

(declare-fun res!874461 () Bool)

(assert (=> d!143007 (=> res!874461 e!751865)))

(declare-fun lt!586648 () Bool)

(assert (=> d!143007 (= res!874461 (not lt!586648))))

(declare-fun lt!586651 () Bool)

(assert (=> d!143007 (= lt!586648 lt!586651)))

(declare-fun lt!586650 () Unit!43363)

(declare-fun e!751866 () Unit!43363)

(assert (=> d!143007 (= lt!586650 e!751866)))

(declare-fun c!125992 () Bool)

(assert (=> d!143007 (= c!125992 lt!586651)))

(assert (=> d!143007 (= lt!586651 (containsKey!733 (toList!10435 (+!4544 lt!586571 (tuple2!23175 lt!586587 zeroValue!1296))) lt!586576))))

(assert (=> d!143007 (= (contains!8597 (+!4544 lt!586571 (tuple2!23175 lt!586587 zeroValue!1296)) lt!586576) lt!586648)))

(declare-fun b!1317827 () Bool)

(declare-fun lt!586649 () Unit!43363)

(assert (=> b!1317827 (= e!751866 lt!586649)))

(assert (=> b!1317827 (= lt!586649 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10435 (+!4544 lt!586571 (tuple2!23175 lt!586587 zeroValue!1296))) lt!586576))))

(assert (=> b!1317827 (isDefined!516 (getValueByKey!707 (toList!10435 (+!4544 lt!586571 (tuple2!23175 lt!586587 zeroValue!1296))) lt!586576))))

(declare-fun b!1317828 () Bool)

(declare-fun Unit!43369 () Unit!43363)

(assert (=> b!1317828 (= e!751866 Unit!43369)))

(declare-fun b!1317829 () Bool)

(assert (=> b!1317829 (= e!751865 (isDefined!516 (getValueByKey!707 (toList!10435 (+!4544 lt!586571 (tuple2!23175 lt!586587 zeroValue!1296))) lt!586576)))))

(assert (= (and d!143007 c!125992) b!1317827))

(assert (= (and d!143007 (not c!125992)) b!1317828))

(assert (= (and d!143007 (not res!874461)) b!1317829))

(declare-fun m!1206103 () Bool)

(assert (=> d!143007 m!1206103))

(declare-fun m!1206105 () Bool)

(assert (=> b!1317827 m!1206105))

(declare-fun m!1206107 () Bool)

(assert (=> b!1317827 m!1206107))

(assert (=> b!1317827 m!1206107))

(declare-fun m!1206109 () Bool)

(assert (=> b!1317827 m!1206109))

(assert (=> b!1317829 m!1206107))

(assert (=> b!1317829 m!1206107))

(assert (=> b!1317829 m!1206109))

(assert (=> b!1317739 d!143007))

(declare-fun d!143009 () Bool)

(assert (=> d!143009 (contains!8597 (+!4544 lt!586571 (tuple2!23175 lt!586587 zeroValue!1296)) lt!586576)))

(declare-fun lt!586654 () Unit!43363)

(declare-fun choose!1946 (ListLongMap!20839 (_ BitVec 64) V!52745 (_ BitVec 64)) Unit!43363)

(assert (=> d!143009 (= lt!586654 (choose!1946 lt!586571 lt!586587 zeroValue!1296 lt!586576))))

(assert (=> d!143009 (contains!8597 lt!586571 lt!586576)))

(assert (=> d!143009 (= (addStillContains!1124 lt!586571 lt!586587 zeroValue!1296 lt!586576) lt!586654)))

(declare-fun bs!37621 () Bool)

(assert (= bs!37621 d!143009))

(assert (=> bs!37621 m!1205953))

(assert (=> bs!37621 m!1205953))

(assert (=> bs!37621 m!1205963))

(declare-fun m!1206111 () Bool)

(assert (=> bs!37621 m!1206111))

(declare-fun m!1206113 () Bool)

(assert (=> bs!37621 m!1206113))

(assert (=> b!1317739 d!143009))

(declare-fun d!143011 () Bool)

(declare-fun res!874466 () Bool)

(declare-fun e!751871 () Bool)

(assert (=> d!143011 (=> res!874466 e!751871)))

(assert (=> d!143011 (= res!874466 (and ((_ is Cons!30313) (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))) (= (_1!11598 (h!31531 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)))) k0!1175)))))

(assert (=> d!143011 (= (containsKey!733 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175) e!751871)))

(declare-fun b!1317835 () Bool)

(declare-fun e!751872 () Bool)

(assert (=> b!1317835 (= e!751871 e!751872)))

(declare-fun res!874467 () Bool)

(assert (=> b!1317835 (=> (not res!874467) (not e!751872))))

(assert (=> b!1317835 (= res!874467 (and (or (not ((_ is Cons!30313) (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)))) (bvsle (_1!11598 (h!31531 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)))) k0!1175)) ((_ is Cons!30313) (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))) (bvslt (_1!11598 (h!31531 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)))) k0!1175)))))

(declare-fun b!1317836 () Bool)

(assert (=> b!1317836 (= e!751872 (containsKey!733 (t!43915 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))) k0!1175))))

(assert (= (and d!143011 (not res!874466)) b!1317835))

(assert (= (and b!1317835 res!874467) b!1317836))

(declare-fun m!1206115 () Bool)

(assert (=> b!1317836 m!1206115))

(assert (=> d!142959 d!143011))

(declare-fun d!143013 () Bool)

(assert (=> d!143013 (arrayContainsKey!0 _keys!1628 lt!586597 #b00000000000000000000000000000000)))

(declare-fun lt!586657 () Unit!43363)

(declare-fun choose!13 (array!88479 (_ BitVec 64) (_ BitVec 32)) Unit!43363)

(assert (=> d!143013 (= lt!586657 (choose!13 _keys!1628 lt!586597 #b00000000000000000000000000000000))))

(assert (=> d!143013 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!143013 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1628 lt!586597 #b00000000000000000000000000000000) lt!586657)))

(declare-fun bs!37622 () Bool)

(assert (= bs!37622 d!143013))

(assert (=> bs!37622 m!1205991))

(declare-fun m!1206117 () Bool)

(assert (=> bs!37622 m!1206117))

(assert (=> b!1317763 d!143013))

(declare-fun d!143015 () Bool)

(declare-fun res!874472 () Bool)

(declare-fun e!751877 () Bool)

(assert (=> d!143015 (=> res!874472 e!751877)))

(assert (=> d!143015 (= res!874472 (= (select (arr!42715 _keys!1628) #b00000000000000000000000000000000) lt!586597))))

(assert (=> d!143015 (= (arrayContainsKey!0 _keys!1628 lt!586597 #b00000000000000000000000000000000) e!751877)))

(declare-fun b!1317841 () Bool)

(declare-fun e!751878 () Bool)

(assert (=> b!1317841 (= e!751877 e!751878)))

(declare-fun res!874473 () Bool)

(assert (=> b!1317841 (=> (not res!874473) (not e!751878))))

(assert (=> b!1317841 (= res!874473 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43266 _keys!1628)))))

(declare-fun b!1317842 () Bool)

(assert (=> b!1317842 (= e!751878 (arrayContainsKey!0 _keys!1628 lt!586597 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!143015 (not res!874472)) b!1317841))

(assert (= (and b!1317841 res!874473) b!1317842))

(assert (=> d!143015 m!1205917))

(declare-fun m!1206119 () Bool)

(assert (=> b!1317842 m!1206119))

(assert (=> b!1317763 d!143015))

(declare-fun lt!586665 () SeekEntryResult!9991)

(declare-fun b!1317855 () Bool)

(declare-fun e!751885 () SeekEntryResult!9991)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!88479 (_ BitVec 32)) SeekEntryResult!9991)

(assert (=> b!1317855 (= e!751885 (seekKeyOrZeroReturnVacant!0 (x!117003 lt!586665) (index!42337 lt!586665) (index!42337 lt!586665) (select (arr!42715 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040))))

(declare-fun b!1317856 () Bool)

(declare-fun e!751886 () SeekEntryResult!9991)

(declare-fun e!751887 () SeekEntryResult!9991)

(assert (=> b!1317856 (= e!751886 e!751887)))

(declare-fun lt!586664 () (_ BitVec 64))

(assert (=> b!1317856 (= lt!586664 (select (arr!42715 _keys!1628) (index!42337 lt!586665)))))

(declare-fun c!126001 () Bool)

(assert (=> b!1317856 (= c!126001 (= lt!586664 (select (arr!42715 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun b!1317857 () Bool)

(assert (=> b!1317857 (= e!751885 (MissingZero!9991 (index!42337 lt!586665)))))

(declare-fun b!1317858 () Bool)

(assert (=> b!1317858 (= e!751887 (Found!9991 (index!42337 lt!586665)))))

(declare-fun d!143017 () Bool)

(declare-fun lt!586666 () SeekEntryResult!9991)

(assert (=> d!143017 (and (or ((_ is Undefined!9991) lt!586666) (not ((_ is Found!9991) lt!586666)) (and (bvsge (index!42336 lt!586666) #b00000000000000000000000000000000) (bvslt (index!42336 lt!586666) (size!43266 _keys!1628)))) (or ((_ is Undefined!9991) lt!586666) ((_ is Found!9991) lt!586666) (not ((_ is MissingZero!9991) lt!586666)) (and (bvsge (index!42335 lt!586666) #b00000000000000000000000000000000) (bvslt (index!42335 lt!586666) (size!43266 _keys!1628)))) (or ((_ is Undefined!9991) lt!586666) ((_ is Found!9991) lt!586666) ((_ is MissingZero!9991) lt!586666) (not ((_ is MissingVacant!9991) lt!586666)) (and (bvsge (index!42338 lt!586666) #b00000000000000000000000000000000) (bvslt (index!42338 lt!586666) (size!43266 _keys!1628)))) (or ((_ is Undefined!9991) lt!586666) (ite ((_ is Found!9991) lt!586666) (= (select (arr!42715 _keys!1628) (index!42336 lt!586666)) (select (arr!42715 _keys!1628) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9991) lt!586666) (= (select (arr!42715 _keys!1628) (index!42335 lt!586666)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9991) lt!586666) (= (select (arr!42715 _keys!1628) (index!42338 lt!586666)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143017 (= lt!586666 e!751886)))

(declare-fun c!125999 () Bool)

(assert (=> d!143017 (= c!125999 (and ((_ is Intermediate!9991) lt!586665) (undefined!10803 lt!586665)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!88479 (_ BitVec 32)) SeekEntryResult!9991)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!143017 (= lt!586665 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!42715 _keys!1628) #b00000000000000000000000000000000) mask!2040) (select (arr!42715 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040))))

(assert (=> d!143017 (validMask!0 mask!2040)))

(assert (=> d!143017 (= (seekEntryOrOpen!0 (select (arr!42715 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040) lt!586666)))

(declare-fun b!1317859 () Bool)

(assert (=> b!1317859 (= e!751886 Undefined!9991)))

(declare-fun b!1317860 () Bool)

(declare-fun c!126000 () Bool)

(assert (=> b!1317860 (= c!126000 (= lt!586664 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1317860 (= e!751887 e!751885)))

(assert (= (and d!143017 c!125999) b!1317859))

(assert (= (and d!143017 (not c!125999)) b!1317856))

(assert (= (and b!1317856 c!126001) b!1317858))

(assert (= (and b!1317856 (not c!126001)) b!1317860))

(assert (= (and b!1317860 c!126000) b!1317857))

(assert (= (and b!1317860 (not c!126000)) b!1317855))

(assert (=> b!1317855 m!1205917))

(declare-fun m!1206121 () Bool)

(assert (=> b!1317855 m!1206121))

(declare-fun m!1206123 () Bool)

(assert (=> b!1317856 m!1206123))

(declare-fun m!1206125 () Bool)

(assert (=> d!143017 m!1206125))

(assert (=> d!143017 m!1205917))

(declare-fun m!1206127 () Bool)

(assert (=> d!143017 m!1206127))

(declare-fun m!1206129 () Bool)

(assert (=> d!143017 m!1206129))

(assert (=> d!143017 m!1205917))

(assert (=> d!143017 m!1206125))

(declare-fun m!1206131 () Bool)

(assert (=> d!143017 m!1206131))

(declare-fun m!1206133 () Bool)

(assert (=> d!143017 m!1206133))

(assert (=> d!143017 m!1205783))

(assert (=> b!1317763 d!143017))

(declare-fun d!143019 () Bool)

(assert (=> d!143019 (= (validKeyInArray!0 (select (arr!42715 _keys!1628) #b00000000000000000000000000000000)) (and (not (= (select (arr!42715 _keys!1628) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!42715 _keys!1628) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1317764 d!143019))

(declare-fun d!143021 () Bool)

(declare-fun e!751888 () Bool)

(assert (=> d!143021 e!751888))

(declare-fun res!874474 () Bool)

(assert (=> d!143021 (=> res!874474 e!751888)))

(declare-fun lt!586667 () Bool)

(assert (=> d!143021 (= res!874474 (not lt!586667))))

(declare-fun lt!586670 () Bool)

(assert (=> d!143021 (= lt!586667 lt!586670)))

(declare-fun lt!586669 () Unit!43363)

(declare-fun e!751889 () Unit!43363)

(assert (=> d!143021 (= lt!586669 e!751889)))

(declare-fun c!126002 () Bool)

(assert (=> d!143021 (= c!126002 lt!586670)))

(assert (=> d!143021 (= lt!586670 (containsKey!733 (toList!10435 lt!586562) (select (arr!42715 _keys!1628) from!2020)))))

(assert (=> d!143021 (= (contains!8597 lt!586562 (select (arr!42715 _keys!1628) from!2020)) lt!586667)))

(declare-fun b!1317861 () Bool)

(declare-fun lt!586668 () Unit!43363)

(assert (=> b!1317861 (= e!751889 lt!586668)))

(assert (=> b!1317861 (= lt!586668 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10435 lt!586562) (select (arr!42715 _keys!1628) from!2020)))))

(assert (=> b!1317861 (isDefined!516 (getValueByKey!707 (toList!10435 lt!586562) (select (arr!42715 _keys!1628) from!2020)))))

(declare-fun b!1317862 () Bool)

(declare-fun Unit!43370 () Unit!43363)

(assert (=> b!1317862 (= e!751889 Unit!43370)))

(declare-fun b!1317863 () Bool)

(assert (=> b!1317863 (= e!751888 (isDefined!516 (getValueByKey!707 (toList!10435 lt!586562) (select (arr!42715 _keys!1628) from!2020))))))

(assert (= (and d!143021 c!126002) b!1317861))

(assert (= (and d!143021 (not c!126002)) b!1317862))

(assert (= (and d!143021 (not res!874474)) b!1317863))

(assert (=> d!143021 m!1205789))

(declare-fun m!1206135 () Bool)

(assert (=> d!143021 m!1206135))

(assert (=> b!1317861 m!1205789))

(declare-fun m!1206137 () Bool)

(assert (=> b!1317861 m!1206137))

(assert (=> b!1317861 m!1205789))

(declare-fun m!1206139 () Bool)

(assert (=> b!1317861 m!1206139))

(assert (=> b!1317861 m!1206139))

(declare-fun m!1206141 () Bool)

(assert (=> b!1317861 m!1206141))

(assert (=> b!1317863 m!1205789))

(assert (=> b!1317863 m!1206139))

(assert (=> b!1317863 m!1206139))

(assert (=> b!1317863 m!1206141))

(assert (=> b!1317703 d!143021))

(declare-fun d!143023 () Bool)

(assert (=> d!143023 (= (apply!1037 lt!586562 (select (arr!42715 _keys!1628) from!2020)) (get!21507 (getValueByKey!707 (toList!10435 lt!586562) (select (arr!42715 _keys!1628) from!2020))))))

(declare-fun bs!37623 () Bool)

(assert (= bs!37623 d!143023))

(assert (=> bs!37623 m!1205789))

(assert (=> bs!37623 m!1206139))

(assert (=> bs!37623 m!1206139))

(declare-fun m!1206143 () Bool)

(assert (=> bs!37623 m!1206143))

(assert (=> b!1317705 d!143023))

(declare-fun d!143025 () Bool)

(declare-fun c!126005 () Bool)

(assert (=> d!143025 (= c!126005 ((_ is ValueCellFull!16967) (select (arr!42714 _values!1354) from!2020)))))

(declare-fun e!751892 () V!52745)

(assert (=> d!143025 (= (get!21506 (select (arr!42714 _values!1354) from!2020) (dynLambda!3498 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)) e!751892)))

(declare-fun b!1317868 () Bool)

(declare-fun get!21508 (ValueCell!16967 V!52745) V!52745)

(assert (=> b!1317868 (= e!751892 (get!21508 (select (arr!42714 _values!1354) from!2020) (dynLambda!3498 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1317869 () Bool)

(declare-fun get!21509 (ValueCell!16967 V!52745) V!52745)

(assert (=> b!1317869 (= e!751892 (get!21509 (select (arr!42714 _values!1354) from!2020) (dynLambda!3498 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143025 c!126005) b!1317868))

(assert (= (and d!143025 (not c!126005)) b!1317869))

(assert (=> b!1317868 m!1205907))

(assert (=> b!1317868 m!1205909))

(declare-fun m!1206145 () Bool)

(assert (=> b!1317868 m!1206145))

(assert (=> b!1317869 m!1205907))

(assert (=> b!1317869 m!1205909))

(declare-fun m!1206147 () Bool)

(assert (=> b!1317869 m!1206147))

(assert (=> b!1317705 d!143025))

(declare-fun d!143027 () Bool)

(declare-fun isEmpty!1078 (Option!758) Bool)

(assert (=> d!143027 (= (isDefined!516 (getValueByKey!707 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175)) (not (isEmpty!1078 (getValueByKey!707 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175))))))

(declare-fun bs!37624 () Bool)

(assert (= bs!37624 d!143027))

(assert (=> bs!37624 m!1205929))

(declare-fun m!1206149 () Bool)

(assert (=> bs!37624 m!1206149))

(assert (=> b!1317731 d!143027))

(declare-fun b!1317878 () Bool)

(declare-fun e!751897 () Option!758)

(assert (=> b!1317878 (= e!751897 (Some!757 (_2!11598 (h!31531 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))))))))

(declare-fun b!1317881 () Bool)

(declare-fun e!751898 () Option!758)

(assert (=> b!1317881 (= e!751898 None!756)))

(declare-fun b!1317880 () Bool)

(assert (=> b!1317880 (= e!751898 (getValueByKey!707 (t!43915 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))) k0!1175))))

(declare-fun d!143029 () Bool)

(declare-fun c!126010 () Bool)

(assert (=> d!143029 (= c!126010 (and ((_ is Cons!30313) (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))) (= (_1!11598 (h!31531 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)))) k0!1175)))))

(assert (=> d!143029 (= (getValueByKey!707 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175) e!751897)))

(declare-fun b!1317879 () Bool)

(assert (=> b!1317879 (= e!751897 e!751898)))

(declare-fun c!126011 () Bool)

(assert (=> b!1317879 (= c!126011 (and ((_ is Cons!30313) (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))) (not (= (_1!11598 (h!31531 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)))) k0!1175))))))

(assert (= (and d!143029 c!126010) b!1317878))

(assert (= (and d!143029 (not c!126010)) b!1317879))

(assert (= (and b!1317879 c!126011) b!1317880))

(assert (= (and b!1317879 (not c!126011)) b!1317881))

(declare-fun m!1206151 () Bool)

(assert (=> b!1317880 m!1206151))

(assert (=> b!1317731 d!143029))

(declare-fun d!143031 () Bool)

(assert (=> d!143031 (isDefined!516 (getValueByKey!707 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175))))

(declare-fun lt!586673 () Unit!43363)

(declare-fun choose!1947 (List!30317 (_ BitVec 64)) Unit!43363)

(assert (=> d!143031 (= lt!586673 (choose!1947 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175))))

(declare-fun e!751901 () Bool)

(assert (=> d!143031 e!751901))

(declare-fun res!874477 () Bool)

(assert (=> d!143031 (=> (not res!874477) (not e!751901))))

(declare-fun isStrictlySorted!864 (List!30317) Bool)

(assert (=> d!143031 (= res!874477 (isStrictlySorted!864 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))))))

(assert (=> d!143031 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175) lt!586673)))

(declare-fun b!1317884 () Bool)

(assert (=> b!1317884 (= e!751901 (containsKey!733 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175))))

(assert (= (and d!143031 res!874477) b!1317884))

(assert (=> d!143031 m!1205929))

(assert (=> d!143031 m!1205929))

(assert (=> d!143031 m!1205931))

(declare-fun m!1206153 () Bool)

(assert (=> d!143031 m!1206153))

(declare-fun m!1206155 () Bool)

(assert (=> d!143031 m!1206155))

(assert (=> b!1317884 m!1205925))

(assert (=> b!1317729 d!143031))

(assert (=> b!1317729 d!143027))

(assert (=> b!1317729 d!143029))

(assert (=> d!142961 d!142967))

(declare-fun d!143033 () Bool)

(declare-fun e!751902 () Bool)

(assert (=> d!143033 e!751902))

(declare-fun res!874478 () Bool)

(assert (=> d!143033 (=> (not res!874478) (not e!751902))))

(declare-fun lt!586677 () ListLongMap!20839)

(assert (=> d!143033 (= res!874478 (contains!8597 lt!586677 (_1!11598 (ite (or c!125961 c!125964) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(declare-fun lt!586675 () List!30317)

(assert (=> d!143033 (= lt!586677 (ListLongMap!20840 lt!586675))))

(declare-fun lt!586674 () Unit!43363)

(declare-fun lt!586676 () Unit!43363)

(assert (=> d!143033 (= lt!586674 lt!586676)))

(assert (=> d!143033 (= (getValueByKey!707 lt!586675 (_1!11598 (ite (or c!125961 c!125964) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))) (Some!757 (_2!11598 (ite (or c!125961 c!125964) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(assert (=> d!143033 (= lt!586676 (lemmaContainsTupThenGetReturnValue!357 lt!586675 (_1!11598 (ite (or c!125961 c!125964) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (_2!11598 (ite (or c!125961 c!125964) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(assert (=> d!143033 (= lt!586675 (insertStrictlySorted!486 (toList!10435 (ite c!125961 call!64715 (ite c!125964 call!64717 call!64712))) (_1!11598 (ite (or c!125961 c!125964) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (_2!11598 (ite (or c!125961 c!125964) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(assert (=> d!143033 (= (+!4544 (ite c!125961 call!64715 (ite c!125964 call!64717 call!64712)) (ite (or c!125961 c!125964) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) lt!586677)))

(declare-fun b!1317885 () Bool)

(declare-fun res!874479 () Bool)

(assert (=> b!1317885 (=> (not res!874479) (not e!751902))))

(assert (=> b!1317885 (= res!874479 (= (getValueByKey!707 (toList!10435 lt!586677) (_1!11598 (ite (or c!125961 c!125964) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))) (Some!757 (_2!11598 (ite (or c!125961 c!125964) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))))

(declare-fun b!1317886 () Bool)

(assert (=> b!1317886 (= e!751902 (contains!8600 (toList!10435 lt!586677) (ite (or c!125961 c!125964) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (= (and d!143033 res!874478) b!1317885))

(assert (= (and b!1317885 res!874479) b!1317886))

(declare-fun m!1206157 () Bool)

(assert (=> d!143033 m!1206157))

(declare-fun m!1206159 () Bool)

(assert (=> d!143033 m!1206159))

(declare-fun m!1206161 () Bool)

(assert (=> d!143033 m!1206161))

(declare-fun m!1206163 () Bool)

(assert (=> d!143033 m!1206163))

(declare-fun m!1206165 () Bool)

(assert (=> b!1317885 m!1206165))

(declare-fun m!1206167 () Bool)

(assert (=> b!1317886 m!1206167))

(assert (=> bm!64713 d!143033))

(declare-fun d!143035 () Bool)

(declare-fun e!751903 () Bool)

(assert (=> d!143035 e!751903))

(declare-fun res!874480 () Bool)

(assert (=> d!143035 (=> res!874480 e!751903)))

(declare-fun lt!586678 () Bool)

(assert (=> d!143035 (= res!874480 (not lt!586678))))

(declare-fun lt!586681 () Bool)

(assert (=> d!143035 (= lt!586678 lt!586681)))

(declare-fun lt!586680 () Unit!43363)

(declare-fun e!751904 () Unit!43363)

(assert (=> d!143035 (= lt!586680 e!751904)))

(declare-fun c!126012 () Bool)

(assert (=> d!143035 (= c!126012 lt!586681)))

(assert (=> d!143035 (= lt!586681 (containsKey!733 (toList!10435 lt!586588) (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(assert (=> d!143035 (= (contains!8597 lt!586588 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))) lt!586678)))

(declare-fun b!1317887 () Bool)

(declare-fun lt!586679 () Unit!43363)

(assert (=> b!1317887 (= e!751904 lt!586679)))

(assert (=> b!1317887 (= lt!586679 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10435 lt!586588) (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(assert (=> b!1317887 (isDefined!516 (getValueByKey!707 (toList!10435 lt!586588) (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(declare-fun b!1317888 () Bool)

(declare-fun Unit!43371 () Unit!43363)

(assert (=> b!1317888 (= e!751904 Unit!43371)))

(declare-fun b!1317889 () Bool)

(assert (=> b!1317889 (= e!751903 (isDefined!516 (getValueByKey!707 (toList!10435 lt!586588) (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)))))))

(assert (= (and d!143035 c!126012) b!1317887))

(assert (= (and d!143035 (not c!126012)) b!1317888))

(assert (= (and d!143035 (not res!874480)) b!1317889))

(assert (=> d!143035 m!1205933))

(declare-fun m!1206169 () Bool)

(assert (=> d!143035 m!1206169))

(assert (=> b!1317887 m!1205933))

(declare-fun m!1206171 () Bool)

(assert (=> b!1317887 m!1206171))

(assert (=> b!1317887 m!1205933))

(declare-fun m!1206173 () Bool)

(assert (=> b!1317887 m!1206173))

(assert (=> b!1317887 m!1206173))

(declare-fun m!1206175 () Bool)

(assert (=> b!1317887 m!1206175))

(assert (=> b!1317889 m!1205933))

(assert (=> b!1317889 m!1206173))

(assert (=> b!1317889 m!1206173))

(assert (=> b!1317889 m!1206175))

(assert (=> b!1317744 d!143035))

(declare-fun d!143037 () Bool)

(declare-fun e!751905 () Bool)

(assert (=> d!143037 e!751905))

(declare-fun res!874481 () Bool)

(assert (=> d!143037 (=> (not res!874481) (not e!751905))))

(declare-fun lt!586685 () ListLongMap!20839)

(assert (=> d!143037 (= res!874481 (contains!8597 lt!586685 (_1!11598 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(declare-fun lt!586683 () List!30317)

(assert (=> d!143037 (= lt!586685 (ListLongMap!20840 lt!586683))))

(declare-fun lt!586682 () Unit!43363)

(declare-fun lt!586684 () Unit!43363)

(assert (=> d!143037 (= lt!586682 lt!586684)))

(assert (=> d!143037 (= (getValueByKey!707 lt!586683 (_1!11598 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (Some!757 (_2!11598 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (=> d!143037 (= lt!586684 (lemmaContainsTupThenGetReturnValue!357 lt!586683 (_1!11598 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)) (_2!11598 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (=> d!143037 (= lt!586683 (insertStrictlySorted!486 (toList!10435 call!64718) (_1!11598 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)) (_2!11598 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (=> d!143037 (= (+!4544 call!64718 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)) lt!586685)))

(declare-fun b!1317890 () Bool)

(declare-fun res!874482 () Bool)

(assert (=> b!1317890 (=> (not res!874482) (not e!751905))))

(assert (=> b!1317890 (= res!874482 (= (getValueByKey!707 (toList!10435 lt!586685) (_1!11598 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (Some!757 (_2!11598 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(declare-fun b!1317891 () Bool)

(assert (=> b!1317891 (= e!751905 (contains!8600 (toList!10435 lt!586685) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))

(assert (= (and d!143037 res!874481) b!1317890))

(assert (= (and b!1317890 res!874482) b!1317891))

(declare-fun m!1206177 () Bool)

(assert (=> d!143037 m!1206177))

(declare-fun m!1206179 () Bool)

(assert (=> d!143037 m!1206179))

(declare-fun m!1206181 () Bool)

(assert (=> d!143037 m!1206181))

(declare-fun m!1206183 () Bool)

(assert (=> d!143037 m!1206183))

(declare-fun m!1206185 () Bool)

(assert (=> b!1317890 m!1206185))

(declare-fun m!1206187 () Bool)

(assert (=> b!1317891 m!1206187))

(assert (=> b!1317706 d!143037))

(assert (=> b!1317724 d!143019))

(declare-fun d!143039 () Bool)

(assert (=> d!143039 (= (apply!1037 lt!586588 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))) (get!21507 (getValueByKey!707 (toList!10435 lt!586588) (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)))))))

(declare-fun bs!37625 () Bool)

(assert (= bs!37625 d!143039))

(assert (=> bs!37625 m!1205933))

(assert (=> bs!37625 m!1206173))

(assert (=> bs!37625 m!1206173))

(declare-fun m!1206189 () Bool)

(assert (=> bs!37625 m!1206189))

(assert (=> b!1317746 d!143039))

(declare-fun d!143041 () Bool)

(declare-fun c!126013 () Bool)

(assert (=> d!143041 (= c!126013 ((_ is ValueCellFull!16967) (select (arr!42714 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020))))))

(declare-fun e!751906 () V!52745)

(assert (=> d!143041 (= (get!21506 (select (arr!42714 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020)) (dynLambda!3498 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)) e!751906)))

(declare-fun b!1317892 () Bool)

(assert (=> b!1317892 (= e!751906 (get!21508 (select (arr!42714 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020)) (dynLambda!3498 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1317893 () Bool)

(assert (=> b!1317893 (= e!751906 (get!21509 (select (arr!42714 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020)) (dynLambda!3498 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143041 c!126013) b!1317892))

(assert (= (and d!143041 (not c!126013)) b!1317893))

(assert (=> b!1317892 m!1205981))

(assert (=> b!1317892 m!1205909))

(declare-fun m!1206191 () Bool)

(assert (=> b!1317892 m!1206191))

(assert (=> b!1317893 m!1205981))

(assert (=> b!1317893 m!1205909))

(declare-fun m!1206193 () Bool)

(assert (=> b!1317893 m!1206193))

(assert (=> b!1317746 d!143041))

(declare-fun d!143043 () Bool)

(declare-fun e!751907 () Bool)

(assert (=> d!143043 e!751907))

(declare-fun res!874483 () Bool)

(assert (=> d!143043 (=> res!874483 e!751907)))

(declare-fun lt!586686 () Bool)

(assert (=> d!143043 (= res!874483 (not lt!586686))))

(declare-fun lt!586689 () Bool)

(assert (=> d!143043 (= lt!586686 lt!586689)))

(declare-fun lt!586688 () Unit!43363)

(declare-fun e!751908 () Unit!43363)

(assert (=> d!143043 (= lt!586688 e!751908)))

(declare-fun c!126014 () Bool)

(assert (=> d!143043 (= c!126014 lt!586689)))

(assert (=> d!143043 (= lt!586689 (containsKey!733 (toList!10435 lt!586562) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143043 (= (contains!8597 lt!586562 #b0000000000000000000000000000000000000000000000000000000000000000) lt!586686)))

(declare-fun b!1317894 () Bool)

(declare-fun lt!586687 () Unit!43363)

(assert (=> b!1317894 (= e!751908 lt!586687)))

(assert (=> b!1317894 (= lt!586687 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10435 lt!586562) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1317894 (isDefined!516 (getValueByKey!707 (toList!10435 lt!586562) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1317895 () Bool)

(declare-fun Unit!43372 () Unit!43363)

(assert (=> b!1317895 (= e!751908 Unit!43372)))

(declare-fun b!1317896 () Bool)

(assert (=> b!1317896 (= e!751907 (isDefined!516 (getValueByKey!707 (toList!10435 lt!586562) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143043 c!126014) b!1317894))

(assert (= (and d!143043 (not c!126014)) b!1317895))

(assert (= (and d!143043 (not res!874483)) b!1317896))

(declare-fun m!1206195 () Bool)

(assert (=> d!143043 m!1206195))

(declare-fun m!1206197 () Bool)

(assert (=> b!1317894 m!1206197))

(declare-fun m!1206199 () Bool)

(assert (=> b!1317894 m!1206199))

(assert (=> b!1317894 m!1206199))

(declare-fun m!1206201 () Bool)

(assert (=> b!1317894 m!1206201))

(assert (=> b!1317896 m!1206199))

(assert (=> b!1317896 m!1206199))

(assert (=> b!1317896 m!1206201))

(assert (=> bm!64715 d!143043))

(declare-fun b!1317897 () Bool)

(declare-fun e!751910 () Bool)

(declare-fun e!751909 () Bool)

(assert (=> b!1317897 (= e!751910 e!751909)))

(declare-fun res!874484 () Bool)

(assert (=> b!1317897 (=> (not res!874484) (not e!751909))))

(declare-fun e!751911 () Bool)

(assert (=> b!1317897 (= res!874484 (not e!751911))))

(declare-fun res!874485 () Bool)

(assert (=> b!1317897 (=> (not res!874485) (not e!751911))))

(assert (=> b!1317897 (= res!874485 (validKeyInArray!0 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!64732 () Bool)

(declare-fun c!126015 () Bool)

(declare-fun call!64735 () Bool)

(assert (=> bm!64732 (= call!64735 (arrayNoDuplicates!0 _keys!1628 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!126015 (Cons!30314 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!125969 (Cons!30314 (select (arr!42715 _keys!1628) #b00000000000000000000000000000000) Nil!30315) Nil!30315)) (ite c!125969 (Cons!30314 (select (arr!42715 _keys!1628) #b00000000000000000000000000000000) Nil!30315) Nil!30315))))))

(declare-fun d!143045 () Bool)

(declare-fun res!874486 () Bool)

(assert (=> d!143045 (=> res!874486 e!751910)))

(assert (=> d!143045 (= res!874486 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43266 _keys!1628)))))

(assert (=> d!143045 (= (arrayNoDuplicates!0 _keys!1628 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125969 (Cons!30314 (select (arr!42715 _keys!1628) #b00000000000000000000000000000000) Nil!30315) Nil!30315)) e!751910)))

(declare-fun b!1317898 () Bool)

(declare-fun e!751912 () Bool)

(assert (=> b!1317898 (= e!751909 e!751912)))

(assert (=> b!1317898 (= c!126015 (validKeyInArray!0 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1317899 () Bool)

(assert (=> b!1317899 (= e!751912 call!64735)))

(declare-fun b!1317900 () Bool)

(assert (=> b!1317900 (= e!751912 call!64735)))

(declare-fun b!1317901 () Bool)

(assert (=> b!1317901 (= e!751911 (contains!8599 (ite c!125969 (Cons!30314 (select (arr!42715 _keys!1628) #b00000000000000000000000000000000) Nil!30315) Nil!30315) (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!143045 (not res!874486)) b!1317897))

(assert (= (and b!1317897 res!874485) b!1317901))

(assert (= (and b!1317897 res!874484) b!1317898))

(assert (= (and b!1317898 c!126015) b!1317899))

(assert (= (and b!1317898 (not c!126015)) b!1317900))

(assert (= (or b!1317899 b!1317900) bm!64732))

(declare-fun m!1206203 () Bool)

(assert (=> b!1317897 m!1206203))

(assert (=> b!1317897 m!1206203))

(declare-fun m!1206205 () Bool)

(assert (=> b!1317897 m!1206205))

(assert (=> bm!64732 m!1206203))

(declare-fun m!1206207 () Bool)

(assert (=> bm!64732 m!1206207))

(assert (=> b!1317898 m!1206203))

(assert (=> b!1317898 m!1206203))

(assert (=> b!1317898 m!1206205))

(assert (=> b!1317901 m!1206203))

(assert (=> b!1317901 m!1206203))

(declare-fun m!1206209 () Bool)

(assert (=> b!1317901 m!1206209))

(assert (=> bm!64718 d!143045))

(declare-fun d!143047 () Bool)

(declare-fun e!751913 () Bool)

(assert (=> d!143047 e!751913))

(declare-fun res!874487 () Bool)

(assert (=> d!143047 (=> res!874487 e!751913)))

(declare-fun lt!586690 () Bool)

(assert (=> d!143047 (= res!874487 (not lt!586690))))

(declare-fun lt!586693 () Bool)

(assert (=> d!143047 (= lt!586690 lt!586693)))

(declare-fun lt!586692 () Unit!43363)

(declare-fun e!751914 () Unit!43363)

(assert (=> d!143047 (= lt!586692 e!751914)))

(declare-fun c!126016 () Bool)

(assert (=> d!143047 (= c!126016 lt!586693)))

(assert (=> d!143047 (= lt!586693 (containsKey!733 (toList!10435 lt!586588) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143047 (= (contains!8597 lt!586588 #b1000000000000000000000000000000000000000000000000000000000000000) lt!586690)))

(declare-fun b!1317902 () Bool)

(declare-fun lt!586691 () Unit!43363)

(assert (=> b!1317902 (= e!751914 lt!586691)))

(assert (=> b!1317902 (= lt!586691 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10435 lt!586588) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1317902 (isDefined!516 (getValueByKey!707 (toList!10435 lt!586588) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1317903 () Bool)

(declare-fun Unit!43373 () Unit!43363)

(assert (=> b!1317903 (= e!751914 Unit!43373)))

(declare-fun b!1317904 () Bool)

(assert (=> b!1317904 (= e!751913 (isDefined!516 (getValueByKey!707 (toList!10435 lt!586588) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143047 c!126016) b!1317902))

(assert (= (and d!143047 (not c!126016)) b!1317903))

(assert (= (and d!143047 (not res!874487)) b!1317904))

(declare-fun m!1206211 () Bool)

(assert (=> d!143047 m!1206211))

(declare-fun m!1206213 () Bool)

(assert (=> b!1317902 m!1206213))

(declare-fun m!1206215 () Bool)

(assert (=> b!1317902 m!1206215))

(assert (=> b!1317902 m!1206215))

(declare-fun m!1206217 () Bool)

(assert (=> b!1317902 m!1206217))

(assert (=> b!1317904 m!1206215))

(assert (=> b!1317904 m!1206215))

(assert (=> b!1317904 m!1206217))

(assert (=> bm!64724 d!143047))

(declare-fun d!143049 () Bool)

(declare-fun e!751915 () Bool)

(assert (=> d!143049 e!751915))

(declare-fun res!874488 () Bool)

(assert (=> d!143049 (=> res!874488 e!751915)))

(declare-fun lt!586694 () Bool)

(assert (=> d!143049 (= res!874488 (not lt!586694))))

(declare-fun lt!586697 () Bool)

(assert (=> d!143049 (= lt!586694 lt!586697)))

(declare-fun lt!586696 () Unit!43363)

(declare-fun e!751916 () Unit!43363)

(assert (=> d!143049 (= lt!586696 e!751916)))

(declare-fun c!126017 () Bool)

(assert (=> d!143049 (= c!126017 lt!586697)))

(assert (=> d!143049 (= lt!586697 (containsKey!733 (toList!10435 lt!586562) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143049 (= (contains!8597 lt!586562 #b1000000000000000000000000000000000000000000000000000000000000000) lt!586694)))

(declare-fun b!1317905 () Bool)

(declare-fun lt!586695 () Unit!43363)

(assert (=> b!1317905 (= e!751916 lt!586695)))

(assert (=> b!1317905 (= lt!586695 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10435 lt!586562) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1317905 (isDefined!516 (getValueByKey!707 (toList!10435 lt!586562) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1317906 () Bool)

(declare-fun Unit!43374 () Unit!43363)

(assert (=> b!1317906 (= e!751916 Unit!43374)))

(declare-fun b!1317907 () Bool)

(assert (=> b!1317907 (= e!751915 (isDefined!516 (getValueByKey!707 (toList!10435 lt!586562) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143049 c!126017) b!1317905))

(assert (= (and d!143049 (not c!126017)) b!1317906))

(assert (= (and d!143049 (not res!874488)) b!1317907))

(declare-fun m!1206219 () Bool)

(assert (=> d!143049 m!1206219))

(declare-fun m!1206221 () Bool)

(assert (=> b!1317905 m!1206221))

(declare-fun m!1206223 () Bool)

(assert (=> b!1317905 m!1206223))

(assert (=> b!1317905 m!1206223))

(declare-fun m!1206225 () Bool)

(assert (=> b!1317905 m!1206225))

(assert (=> b!1317907 m!1206223))

(assert (=> b!1317907 m!1206223))

(assert (=> b!1317907 m!1206225))

(assert (=> bm!64714 d!143049))

(declare-fun d!143051 () Bool)

(declare-fun e!751917 () Bool)

(assert (=> d!143051 e!751917))

(declare-fun res!874489 () Bool)

(assert (=> d!143051 (=> (not res!874489) (not e!751917))))

(declare-fun lt!586701 () ListLongMap!20839)

(assert (=> d!143051 (= res!874489 (contains!8597 lt!586701 (_1!11598 (ite (or c!125971 c!125974) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(declare-fun lt!586699 () List!30317)

(assert (=> d!143051 (= lt!586701 (ListLongMap!20840 lt!586699))))

(declare-fun lt!586698 () Unit!43363)

(declare-fun lt!586700 () Unit!43363)

(assert (=> d!143051 (= lt!586698 lt!586700)))

(assert (=> d!143051 (= (getValueByKey!707 lt!586699 (_1!11598 (ite (or c!125971 c!125974) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))) (Some!757 (_2!11598 (ite (or c!125971 c!125974) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(assert (=> d!143051 (= lt!586700 (lemmaContainsTupThenGetReturnValue!357 lt!586699 (_1!11598 (ite (or c!125971 c!125974) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (_2!11598 (ite (or c!125971 c!125974) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(assert (=> d!143051 (= lt!586699 (insertStrictlySorted!486 (toList!10435 (ite c!125971 call!64725 (ite c!125974 call!64727 call!64722))) (_1!11598 (ite (or c!125971 c!125974) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (_2!11598 (ite (or c!125971 c!125974) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(assert (=> d!143051 (= (+!4544 (ite c!125971 call!64725 (ite c!125974 call!64727 call!64722)) (ite (or c!125971 c!125974) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) lt!586701)))

(declare-fun b!1317908 () Bool)

(declare-fun res!874490 () Bool)

(assert (=> b!1317908 (=> (not res!874490) (not e!751917))))

(assert (=> b!1317908 (= res!874490 (= (getValueByKey!707 (toList!10435 lt!586701) (_1!11598 (ite (or c!125971 c!125974) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))) (Some!757 (_2!11598 (ite (or c!125971 c!125974) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))))

(declare-fun b!1317909 () Bool)

(assert (=> b!1317909 (= e!751917 (contains!8600 (toList!10435 lt!586701) (ite (or c!125971 c!125974) (tuple2!23175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (= (and d!143051 res!874489) b!1317908))

(assert (= (and b!1317908 res!874490) b!1317909))

(declare-fun m!1206227 () Bool)

(assert (=> d!143051 m!1206227))

(declare-fun m!1206229 () Bool)

(assert (=> d!143051 m!1206229))

(declare-fun m!1206231 () Bool)

(assert (=> d!143051 m!1206231))

(declare-fun m!1206233 () Bool)

(assert (=> d!143051 m!1206233))

(declare-fun m!1206235 () Bool)

(assert (=> b!1317908 m!1206235))

(declare-fun m!1206237 () Bool)

(assert (=> b!1317909 m!1206237))

(assert (=> bm!64723 d!143051))

(declare-fun d!143053 () Bool)

(declare-fun e!751918 () Bool)

(assert (=> d!143053 e!751918))

(declare-fun res!874491 () Bool)

(assert (=> d!143053 (=> res!874491 e!751918)))

(declare-fun lt!586702 () Bool)

(assert (=> d!143053 (= res!874491 (not lt!586702))))

(declare-fun lt!586705 () Bool)

(assert (=> d!143053 (= lt!586702 lt!586705)))

(declare-fun lt!586704 () Unit!43363)

(declare-fun e!751919 () Unit!43363)

(assert (=> d!143053 (= lt!586704 e!751919)))

(declare-fun c!126018 () Bool)

(assert (=> d!143053 (= c!126018 lt!586705)))

(assert (=> d!143053 (= lt!586705 (containsKey!733 (toList!10435 lt!586588) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143053 (= (contains!8597 lt!586588 #b0000000000000000000000000000000000000000000000000000000000000000) lt!586702)))

(declare-fun b!1317910 () Bool)

(declare-fun lt!586703 () Unit!43363)

(assert (=> b!1317910 (= e!751919 lt!586703)))

(assert (=> b!1317910 (= lt!586703 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10435 lt!586588) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1317910 (isDefined!516 (getValueByKey!707 (toList!10435 lt!586588) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1317911 () Bool)

(declare-fun Unit!43375 () Unit!43363)

(assert (=> b!1317911 (= e!751919 Unit!43375)))

(declare-fun b!1317912 () Bool)

(assert (=> b!1317912 (= e!751918 (isDefined!516 (getValueByKey!707 (toList!10435 lt!586588) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143053 c!126018) b!1317910))

(assert (= (and d!143053 (not c!126018)) b!1317911))

(assert (= (and d!143053 (not res!874491)) b!1317912))

(declare-fun m!1206239 () Bool)

(assert (=> d!143053 m!1206239))

(declare-fun m!1206241 () Bool)

(assert (=> b!1317910 m!1206241))

(declare-fun m!1206243 () Bool)

(assert (=> b!1317910 m!1206243))

(assert (=> b!1317910 m!1206243))

(declare-fun m!1206245 () Bool)

(assert (=> b!1317910 m!1206245))

(assert (=> b!1317912 m!1206243))

(assert (=> b!1317912 m!1206243))

(assert (=> b!1317912 m!1206245))

(assert (=> bm!64725 d!143053))

(assert (=> b!1317725 d!143019))

(declare-fun d!143055 () Bool)

(declare-fun e!751920 () Bool)

(assert (=> d!143055 e!751920))

(declare-fun res!874492 () Bool)

(assert (=> d!143055 (=> (not res!874492) (not e!751920))))

(declare-fun lt!586709 () ListLongMap!20839)

(assert (=> d!143055 (= res!874492 (contains!8597 lt!586709 (_1!11598 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(declare-fun lt!586707 () List!30317)

(assert (=> d!143055 (= lt!586709 (ListLongMap!20840 lt!586707))))

(declare-fun lt!586706 () Unit!43363)

(declare-fun lt!586708 () Unit!43363)

(assert (=> d!143055 (= lt!586706 lt!586708)))

(assert (=> d!143055 (= (getValueByKey!707 lt!586707 (_1!11598 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (Some!757 (_2!11598 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (=> d!143055 (= lt!586708 (lemmaContainsTupThenGetReturnValue!357 lt!586707 (_1!11598 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)) (_2!11598 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (=> d!143055 (= lt!586707 (insertStrictlySorted!486 (toList!10435 call!64728) (_1!11598 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)) (_2!11598 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (=> d!143055 (= (+!4544 call!64728 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)) lt!586709)))

(declare-fun b!1317913 () Bool)

(declare-fun res!874493 () Bool)

(assert (=> b!1317913 (=> (not res!874493) (not e!751920))))

(assert (=> b!1317913 (= res!874493 (= (getValueByKey!707 (toList!10435 lt!586709) (_1!11598 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (Some!757 (_2!11598 (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(declare-fun b!1317914 () Bool)

(assert (=> b!1317914 (= e!751920 (contains!8600 (toList!10435 lt!586709) (tuple2!23175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))

(assert (= (and d!143055 res!874492) b!1317913))

(assert (= (and b!1317913 res!874493) b!1317914))

(declare-fun m!1206247 () Bool)

(assert (=> d!143055 m!1206247))

(declare-fun m!1206249 () Bool)

(assert (=> d!143055 m!1206249))

(declare-fun m!1206251 () Bool)

(assert (=> d!143055 m!1206251))

(declare-fun m!1206253 () Bool)

(assert (=> d!143055 m!1206253))

(declare-fun m!1206255 () Bool)

(assert (=> b!1317913 m!1206255))

(declare-fun m!1206257 () Bool)

(assert (=> b!1317914 m!1206257))

(assert (=> b!1317747 d!143055))

(declare-fun d!143057 () Bool)

(assert (=> d!143057 (= (apply!1037 lt!586562 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21507 (getValueByKey!707 (toList!10435 lt!586562) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37626 () Bool)

(assert (= bs!37626 d!143057))

(assert (=> bs!37626 m!1206223))

(assert (=> bs!37626 m!1206223))

(declare-fun m!1206259 () Bool)

(assert (=> bs!37626 m!1206259))

(assert (=> b!1317711 d!143057))

(declare-fun d!143059 () Bool)

(assert (=> d!143059 (= (validKeyInArray!0 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))) (and (not (= (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1317750 d!143059))

(declare-fun d!143061 () Bool)

(assert (=> d!143061 (isDefined!516 (getValueByKey!707 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175))))

(declare-fun lt!586710 () Unit!43363)

(assert (=> d!143061 (= lt!586710 (choose!1947 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175))))

(declare-fun e!751921 () Bool)

(assert (=> d!143061 e!751921))

(declare-fun res!874494 () Bool)

(assert (=> d!143061 (=> (not res!874494) (not e!751921))))

(assert (=> d!143061 (= res!874494 (isStrictlySorted!864 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))))))

(assert (=> d!143061 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175) lt!586710)))

(declare-fun b!1317915 () Bool)

(assert (=> b!1317915 (= e!751921 (containsKey!733 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175))))

(assert (= (and d!143061 res!874494) b!1317915))

(assert (=> d!143061 m!1205859))

(assert (=> d!143061 m!1205859))

(assert (=> d!143061 m!1205861))

(declare-fun m!1206261 () Bool)

(assert (=> d!143061 m!1206261))

(declare-fun m!1206263 () Bool)

(assert (=> d!143061 m!1206263))

(assert (=> b!1317915 m!1205855))

(assert (=> b!1317646 d!143061))

(declare-fun d!143063 () Bool)

(assert (=> d!143063 (= (isDefined!516 (getValueByKey!707 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175)) (not (isEmpty!1078 (getValueByKey!707 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175))))))

(declare-fun bs!37627 () Bool)

(assert (= bs!37627 d!143063))

(assert (=> bs!37627 m!1205859))

(declare-fun m!1206265 () Bool)

(assert (=> bs!37627 m!1206265))

(assert (=> b!1317646 d!143063))

(declare-fun e!751922 () Option!758)

(declare-fun b!1317916 () Bool)

(assert (=> b!1317916 (= e!751922 (Some!757 (_2!11598 (h!31531 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))))))))

(declare-fun b!1317919 () Bool)

(declare-fun e!751923 () Option!758)

(assert (=> b!1317919 (= e!751923 None!756)))

(declare-fun b!1317918 () Bool)

(assert (=> b!1317918 (= e!751923 (getValueByKey!707 (t!43915 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))) k0!1175))))

(declare-fun c!126019 () Bool)

(declare-fun d!143065 () Bool)

(assert (=> d!143065 (= c!126019 (and ((_ is Cons!30313) (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))) (= (_1!11598 (h!31531 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)))) k0!1175)))))

(assert (=> d!143065 (= (getValueByKey!707 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175) e!751922)))

(declare-fun b!1317917 () Bool)

(assert (=> b!1317917 (= e!751922 e!751923)))

(declare-fun c!126020 () Bool)

(assert (=> b!1317917 (= c!126020 (and ((_ is Cons!30313) (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))) (not (= (_1!11598 (h!31531 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)))) k0!1175))))))

(assert (= (and d!143065 c!126019) b!1317916))

(assert (= (and d!143065 (not c!126019)) b!1317917))

(assert (= (and b!1317917 c!126020) b!1317918))

(assert (= (and b!1317917 (not c!126020)) b!1317919))

(declare-fun m!1206267 () Bool)

(assert (=> b!1317918 m!1206267))

(assert (=> b!1317646 d!143065))

(assert (=> b!1317709 d!142963))

(assert (=> b!1317710 d!142963))

(declare-fun d!143067 () Bool)

(declare-fun lt!586713 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!650 (List!30318) (InoxSet (_ BitVec 64)))

(assert (=> d!143067 (= lt!586713 (select (content!650 Nil!30315) (select (arr!42715 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun e!751928 () Bool)

(assert (=> d!143067 (= lt!586713 e!751928)))

(declare-fun res!874499 () Bool)

(assert (=> d!143067 (=> (not res!874499) (not e!751928))))

(assert (=> d!143067 (= res!874499 ((_ is Cons!30314) Nil!30315))))

(assert (=> d!143067 (= (contains!8599 Nil!30315 (select (arr!42715 _keys!1628) #b00000000000000000000000000000000)) lt!586713)))

(declare-fun b!1317924 () Bool)

(declare-fun e!751929 () Bool)

(assert (=> b!1317924 (= e!751928 e!751929)))

(declare-fun res!874500 () Bool)

(assert (=> b!1317924 (=> res!874500 e!751929)))

(assert (=> b!1317924 (= res!874500 (= (h!31532 Nil!30315) (select (arr!42715 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun b!1317925 () Bool)

(assert (=> b!1317925 (= e!751929 (contains!8599 (t!43916 Nil!30315) (select (arr!42715 _keys!1628) #b00000000000000000000000000000000)))))

(assert (= (and d!143067 res!874499) b!1317924))

(assert (= (and b!1317924 (not res!874500)) b!1317925))

(declare-fun m!1206269 () Bool)

(assert (=> d!143067 m!1206269))

(assert (=> d!143067 m!1205917))

(declare-fun m!1206271 () Bool)

(assert (=> d!143067 m!1206271))

(assert (=> b!1317925 m!1205917))

(declare-fun m!1206273 () Bool)

(assert (=> b!1317925 m!1206273))

(assert (=> b!1317728 d!143067))

(declare-fun d!143069 () Bool)

(assert (=> d!143069 (= (apply!1037 lt!586588 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21507 (getValueByKey!707 (toList!10435 lt!586588) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37628 () Bool)

(assert (= bs!37628 d!143069))

(assert (=> bs!37628 m!1206215))

(assert (=> bs!37628 m!1206215))

(declare-fun m!1206275 () Bool)

(assert (=> bs!37628 m!1206275))

(assert (=> b!1317752 d!143069))

(assert (=> b!1317648 d!143063))

(assert (=> b!1317648 d!143065))

(assert (=> d!142975 d!142967))

(declare-fun d!143071 () Bool)

(declare-fun res!874501 () Bool)

(declare-fun e!751930 () Bool)

(assert (=> d!143071 (=> res!874501 e!751930)))

(assert (=> d!143071 (= res!874501 (and ((_ is Cons!30313) (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))) (= (_1!11598 (h!31531 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)))) k0!1175)))))

(assert (=> d!143071 (= (containsKey!733 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175) e!751930)))

(declare-fun b!1317926 () Bool)

(declare-fun e!751931 () Bool)

(assert (=> b!1317926 (= e!751930 e!751931)))

(declare-fun res!874502 () Bool)

(assert (=> b!1317926 (=> (not res!874502) (not e!751931))))

(assert (=> b!1317926 (= res!874502 (and (or (not ((_ is Cons!30313) (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)))) (bvsle (_1!11598 (h!31531 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)))) k0!1175)) ((_ is Cons!30313) (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))) (bvslt (_1!11598 (h!31531 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)))) k0!1175)))))

(declare-fun b!1317927 () Bool)

(assert (=> b!1317927 (= e!751931 (containsKey!733 (t!43915 (toList!10435 (getCurrentListMap!5439 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))) k0!1175))))

(assert (= (and d!143071 (not res!874501)) b!1317926))

(assert (= (and b!1317926 res!874502) b!1317927))

(declare-fun m!1206277 () Bool)

(assert (=> b!1317927 m!1206277))

(assert (=> d!142973 d!143071))

(assert (=> b!1317751 d!143059))

(declare-fun d!143073 () Bool)

(assert (=> d!143073 (= (apply!1037 lt!586562 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21507 (getValueByKey!707 (toList!10435 lt!586562) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37629 () Bool)

(assert (= bs!37629 d!143073))

(assert (=> bs!37629 m!1206199))

(assert (=> bs!37629 m!1206199))

(declare-fun m!1206279 () Bool)

(assert (=> bs!37629 m!1206279))

(assert (=> b!1317696 d!143073))

(declare-fun b!1317928 () Bool)

(declare-fun e!751932 () Bool)

(declare-fun call!64736 () Bool)

(assert (=> b!1317928 (= e!751932 call!64736)))

(declare-fun b!1317929 () Bool)

(declare-fun e!751934 () Bool)

(assert (=> b!1317929 (= e!751934 call!64736)))

(declare-fun b!1317930 () Bool)

(assert (=> b!1317930 (= e!751932 e!751934)))

(declare-fun lt!586716 () (_ BitVec 64))

(assert (=> b!1317930 (= lt!586716 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!586715 () Unit!43363)

(assert (=> b!1317930 (= lt!586715 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1628 lt!586716 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1317930 (arrayContainsKey!0 _keys!1628 lt!586716 #b00000000000000000000000000000000)))

(declare-fun lt!586714 () Unit!43363)

(assert (=> b!1317930 (= lt!586714 lt!586715)))

(declare-fun res!874503 () Bool)

(assert (=> b!1317930 (= res!874503 (= (seekEntryOrOpen!0 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1628 mask!2040) (Found!9991 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1317930 (=> (not res!874503) (not e!751934))))

(declare-fun b!1317931 () Bool)

(declare-fun e!751933 () Bool)

(assert (=> b!1317931 (= e!751933 e!751932)))

(declare-fun c!126021 () Bool)

(assert (=> b!1317931 (= c!126021 (validKeyInArray!0 (select (arr!42715 _keys!1628) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!64733 () Bool)

(assert (=> bm!64733 (= call!64736 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1628 mask!2040))))

(declare-fun d!143075 () Bool)

(declare-fun res!874504 () Bool)

(assert (=> d!143075 (=> res!874504 e!751933)))

(assert (=> d!143075 (= res!874504 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43266 _keys!1628)))))

(assert (=> d!143075 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1628 mask!2040) e!751933)))

(assert (= (and d!143075 (not res!874504)) b!1317931))

(assert (= (and b!1317931 c!126021) b!1317930))

(assert (= (and b!1317931 (not c!126021)) b!1317928))

(assert (= (and b!1317930 res!874503) b!1317929))

(assert (= (or b!1317929 b!1317928) bm!64733))

(assert (=> b!1317930 m!1206203))

(declare-fun m!1206281 () Bool)

(assert (=> b!1317930 m!1206281))

(declare-fun m!1206283 () Bool)

(assert (=> b!1317930 m!1206283))

(assert (=> b!1317930 m!1206203))

(declare-fun m!1206285 () Bool)

(assert (=> b!1317930 m!1206285))

(assert (=> b!1317931 m!1206203))

(assert (=> b!1317931 m!1206203))

(assert (=> b!1317931 m!1206205))

(declare-fun m!1206287 () Bool)

(assert (=> bm!64733 m!1206287))

(assert (=> bm!64728 d!143075))

(declare-fun d!143077 () Bool)

(declare-fun e!751935 () Bool)

(assert (=> d!143077 e!751935))

(declare-fun res!874505 () Bool)

(assert (=> d!143077 (=> (not res!874505) (not e!751935))))

(declare-fun lt!586720 () ListLongMap!20839)

(assert (=> d!143077 (= res!874505 (contains!8597 lt!586720 (_1!11598 (tuple2!23175 lt!586555 zeroValue!1296))))))

(declare-fun lt!586718 () List!30317)

(assert (=> d!143077 (= lt!586720 (ListLongMap!20840 lt!586718))))

(declare-fun lt!586717 () Unit!43363)

(declare-fun lt!586719 () Unit!43363)

(assert (=> d!143077 (= lt!586717 lt!586719)))

(assert (=> d!143077 (= (getValueByKey!707 lt!586718 (_1!11598 (tuple2!23175 lt!586555 zeroValue!1296))) (Some!757 (_2!11598 (tuple2!23175 lt!586555 zeroValue!1296))))))

(assert (=> d!143077 (= lt!586719 (lemmaContainsTupThenGetReturnValue!357 lt!586718 (_1!11598 (tuple2!23175 lt!586555 zeroValue!1296)) (_2!11598 (tuple2!23175 lt!586555 zeroValue!1296))))))

(assert (=> d!143077 (= lt!586718 (insertStrictlySorted!486 (toList!10435 lt!586541) (_1!11598 (tuple2!23175 lt!586555 zeroValue!1296)) (_2!11598 (tuple2!23175 lt!586555 zeroValue!1296))))))

(assert (=> d!143077 (= (+!4544 lt!586541 (tuple2!23175 lt!586555 zeroValue!1296)) lt!586720)))

(declare-fun b!1317932 () Bool)

(declare-fun res!874506 () Bool)

(assert (=> b!1317932 (=> (not res!874506) (not e!751935))))

(assert (=> b!1317932 (= res!874506 (= (getValueByKey!707 (toList!10435 lt!586720) (_1!11598 (tuple2!23175 lt!586555 zeroValue!1296))) (Some!757 (_2!11598 (tuple2!23175 lt!586555 zeroValue!1296)))))))

(declare-fun b!1317933 () Bool)

(assert (=> b!1317933 (= e!751935 (contains!8600 (toList!10435 lt!586720) (tuple2!23175 lt!586555 zeroValue!1296)))))

(assert (= (and d!143077 res!874505) b!1317932))

(assert (= (and b!1317932 res!874506) b!1317933))

(declare-fun m!1206289 () Bool)

(assert (=> d!143077 m!1206289))

(declare-fun m!1206291 () Bool)

(assert (=> d!143077 m!1206291))

(declare-fun m!1206293 () Bool)

(assert (=> d!143077 m!1206293))

(declare-fun m!1206295 () Bool)

(assert (=> d!143077 m!1206295))

(declare-fun m!1206297 () Bool)

(assert (=> b!1317932 m!1206297))

(declare-fun m!1206299 () Bool)

(assert (=> b!1317933 m!1206299))

(assert (=> b!1317698 d!143077))

(declare-fun d!143079 () Bool)

(assert (=> d!143079 (= (apply!1037 (+!4544 lt!586541 (tuple2!23175 lt!586555 zeroValue!1296)) lt!586556) (get!21507 (getValueByKey!707 (toList!10435 (+!4544 lt!586541 (tuple2!23175 lt!586555 zeroValue!1296))) lt!586556)))))

(declare-fun bs!37630 () Bool)

(assert (= bs!37630 d!143079))

(declare-fun m!1206301 () Bool)

(assert (=> bs!37630 m!1206301))

(assert (=> bs!37630 m!1206301))

(declare-fun m!1206303 () Bool)

(assert (=> bs!37630 m!1206303))

(assert (=> b!1317698 d!143079))

(declare-fun d!143081 () Bool)

(assert (=> d!143081 (= (apply!1037 (+!4544 lt!586557 (tuple2!23175 lt!586560 minValue!1296)) lt!586547) (apply!1037 lt!586557 lt!586547))))

(declare-fun lt!586721 () Unit!43363)

(assert (=> d!143081 (= lt!586721 (choose!1945 lt!586557 lt!586560 minValue!1296 lt!586547))))

(declare-fun e!751936 () Bool)

(assert (=> d!143081 e!751936))

(declare-fun res!874507 () Bool)

(assert (=> d!143081 (=> (not res!874507) (not e!751936))))

(assert (=> d!143081 (= res!874507 (contains!8597 lt!586557 lt!586547))))

(assert (=> d!143081 (= (addApplyDifferent!566 lt!586557 lt!586560 minValue!1296 lt!586547) lt!586721)))

(declare-fun b!1317934 () Bool)

(assert (=> b!1317934 (= e!751936 (not (= lt!586547 lt!586560)))))

(assert (= (and d!143081 res!874507) b!1317934))

(declare-fun m!1206305 () Bool)

(assert (=> d!143081 m!1206305))

(assert (=> d!143081 m!1205869))

(assert (=> d!143081 m!1205873))

(declare-fun m!1206307 () Bool)

(assert (=> d!143081 m!1206307))

(assert (=> d!143081 m!1205869))

(assert (=> d!143081 m!1205871))

(assert (=> b!1317698 d!143081))

(declare-fun d!143083 () Bool)

(assert (=> d!143083 (= (apply!1037 (+!4544 lt!586549 (tuple2!23175 lt!586542 minValue!1296)) lt!586546) (get!21507 (getValueByKey!707 (toList!10435 (+!4544 lt!586549 (tuple2!23175 lt!586542 minValue!1296))) lt!586546)))))

(declare-fun bs!37631 () Bool)

(assert (= bs!37631 d!143083))

(declare-fun m!1206309 () Bool)

(assert (=> bs!37631 m!1206309))

(assert (=> bs!37631 m!1206309))

(declare-fun m!1206311 () Bool)

(assert (=> bs!37631 m!1206311))

(assert (=> b!1317698 d!143083))

(declare-fun d!143085 () Bool)

(assert (=> d!143085 (= (apply!1037 lt!586541 lt!586556) (get!21507 (getValueByKey!707 (toList!10435 lt!586541) lt!586556)))))

(declare-fun bs!37632 () Bool)

(assert (= bs!37632 d!143085))

(declare-fun m!1206313 () Bool)

(assert (=> bs!37632 m!1206313))

(assert (=> bs!37632 m!1206313))

(declare-fun m!1206315 () Bool)

(assert (=> bs!37632 m!1206315))

(assert (=> b!1317698 d!143085))

(declare-fun d!143087 () Bool)

(assert (=> d!143087 (= (apply!1037 lt!586549 lt!586546) (get!21507 (getValueByKey!707 (toList!10435 lt!586549) lt!586546)))))

(declare-fun bs!37633 () Bool)

(assert (= bs!37633 d!143087))

(declare-fun m!1206317 () Bool)

(assert (=> bs!37633 m!1206317))

(assert (=> bs!37633 m!1206317))

(declare-fun m!1206319 () Bool)

(assert (=> bs!37633 m!1206319))

(assert (=> b!1317698 d!143087))

(declare-fun d!143089 () Bool)

(assert (=> d!143089 (= (apply!1037 (+!4544 lt!586549 (tuple2!23175 lt!586542 minValue!1296)) lt!586546) (apply!1037 lt!586549 lt!586546))))

(declare-fun lt!586722 () Unit!43363)

(assert (=> d!143089 (= lt!586722 (choose!1945 lt!586549 lt!586542 minValue!1296 lt!586546))))

(declare-fun e!751937 () Bool)

(assert (=> d!143089 e!751937))

(declare-fun res!874508 () Bool)

(assert (=> d!143089 (=> (not res!874508) (not e!751937))))

(assert (=> d!143089 (= res!874508 (contains!8597 lt!586549 lt!586546))))

(assert (=> d!143089 (= (addApplyDifferent!566 lt!586549 lt!586542 minValue!1296 lt!586546) lt!586722)))

(declare-fun b!1317935 () Bool)

(assert (=> b!1317935 (= e!751937 (not (= lt!586546 lt!586542)))))

(assert (= (and d!143089 res!874508) b!1317935))

(declare-fun m!1206321 () Bool)

(assert (=> d!143089 m!1206321))

(assert (=> d!143089 m!1205881))

(assert (=> d!143089 m!1205893))

(declare-fun m!1206323 () Bool)

(assert (=> d!143089 m!1206323))

(assert (=> d!143089 m!1205881))

(assert (=> d!143089 m!1205885))

(assert (=> b!1317698 d!143089))

(declare-fun d!143091 () Bool)

(assert (=> d!143091 (contains!8597 (+!4544 lt!586545 (tuple2!23175 lt!586561 zeroValue!1296)) lt!586550)))

(declare-fun lt!586723 () Unit!43363)

(assert (=> d!143091 (= lt!586723 (choose!1946 lt!586545 lt!586561 zeroValue!1296 lt!586550))))

(assert (=> d!143091 (contains!8597 lt!586545 lt!586550)))

(assert (=> d!143091 (= (addStillContains!1124 lt!586545 lt!586561 zeroValue!1296 lt!586550) lt!586723)))

(declare-fun bs!37634 () Bool)

(assert (= bs!37634 d!143091))

(assert (=> bs!37634 m!1205879))

(assert (=> bs!37634 m!1205879))

(assert (=> bs!37634 m!1205889))

(declare-fun m!1206325 () Bool)

(assert (=> bs!37634 m!1206325))

(declare-fun m!1206327 () Bool)

(assert (=> bs!37634 m!1206327))

(assert (=> b!1317698 d!143091))

(declare-fun d!143093 () Bool)

(declare-fun e!751938 () Bool)

(assert (=> d!143093 e!751938))

(declare-fun res!874509 () Bool)

(assert (=> d!143093 (=> (not res!874509) (not e!751938))))

(declare-fun lt!586727 () ListLongMap!20839)

(assert (=> d!143093 (= res!874509 (contains!8597 lt!586727 (_1!11598 (tuple2!23175 lt!586560 minValue!1296))))))

(declare-fun lt!586725 () List!30317)

(assert (=> d!143093 (= lt!586727 (ListLongMap!20840 lt!586725))))

(declare-fun lt!586724 () Unit!43363)

(declare-fun lt!586726 () Unit!43363)

(assert (=> d!143093 (= lt!586724 lt!586726)))

(assert (=> d!143093 (= (getValueByKey!707 lt!586725 (_1!11598 (tuple2!23175 lt!586560 minValue!1296))) (Some!757 (_2!11598 (tuple2!23175 lt!586560 minValue!1296))))))

(assert (=> d!143093 (= lt!586726 (lemmaContainsTupThenGetReturnValue!357 lt!586725 (_1!11598 (tuple2!23175 lt!586560 minValue!1296)) (_2!11598 (tuple2!23175 lt!586560 minValue!1296))))))

(assert (=> d!143093 (= lt!586725 (insertStrictlySorted!486 (toList!10435 lt!586557) (_1!11598 (tuple2!23175 lt!586560 minValue!1296)) (_2!11598 (tuple2!23175 lt!586560 minValue!1296))))))

(assert (=> d!143093 (= (+!4544 lt!586557 (tuple2!23175 lt!586560 minValue!1296)) lt!586727)))

(declare-fun b!1317936 () Bool)

(declare-fun res!874510 () Bool)

(assert (=> b!1317936 (=> (not res!874510) (not e!751938))))

(assert (=> b!1317936 (= res!874510 (= (getValueByKey!707 (toList!10435 lt!586727) (_1!11598 (tuple2!23175 lt!586560 minValue!1296))) (Some!757 (_2!11598 (tuple2!23175 lt!586560 minValue!1296)))))))

(declare-fun b!1317937 () Bool)

(assert (=> b!1317937 (= e!751938 (contains!8600 (toList!10435 lt!586727) (tuple2!23175 lt!586560 minValue!1296)))))

(assert (= (and d!143093 res!874509) b!1317936))

(assert (= (and b!1317936 res!874510) b!1317937))

(declare-fun m!1206329 () Bool)

(assert (=> d!143093 m!1206329))

(declare-fun m!1206331 () Bool)

(assert (=> d!143093 m!1206331))

(declare-fun m!1206333 () Bool)

(assert (=> d!143093 m!1206333))

(declare-fun m!1206335 () Bool)

(assert (=> d!143093 m!1206335))

(declare-fun m!1206337 () Bool)

(assert (=> b!1317936 m!1206337))

(declare-fun m!1206339 () Bool)

(assert (=> b!1317937 m!1206339))

(assert (=> b!1317698 d!143093))

(declare-fun d!143095 () Bool)

(declare-fun e!751939 () Bool)

(assert (=> d!143095 e!751939))

(declare-fun res!874511 () Bool)

(assert (=> d!143095 (=> res!874511 e!751939)))

(declare-fun lt!586728 () Bool)

(assert (=> d!143095 (= res!874511 (not lt!586728))))

(declare-fun lt!586731 () Bool)

(assert (=> d!143095 (= lt!586728 lt!586731)))

(declare-fun lt!586730 () Unit!43363)

(declare-fun e!751940 () Unit!43363)

(assert (=> d!143095 (= lt!586730 e!751940)))

(declare-fun c!126022 () Bool)

(assert (=> d!143095 (= c!126022 lt!586731)))

(assert (=> d!143095 (= lt!586731 (containsKey!733 (toList!10435 (+!4544 lt!586545 (tuple2!23175 lt!586561 zeroValue!1296))) lt!586550))))

(assert (=> d!143095 (= (contains!8597 (+!4544 lt!586545 (tuple2!23175 lt!586561 zeroValue!1296)) lt!586550) lt!586728)))

(declare-fun b!1317938 () Bool)

(declare-fun lt!586729 () Unit!43363)

(assert (=> b!1317938 (= e!751940 lt!586729)))

(assert (=> b!1317938 (= lt!586729 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10435 (+!4544 lt!586545 (tuple2!23175 lt!586561 zeroValue!1296))) lt!586550))))

(assert (=> b!1317938 (isDefined!516 (getValueByKey!707 (toList!10435 (+!4544 lt!586545 (tuple2!23175 lt!586561 zeroValue!1296))) lt!586550))))

(declare-fun b!1317939 () Bool)

(declare-fun Unit!43376 () Unit!43363)

(assert (=> b!1317939 (= e!751940 Unit!43376)))

(declare-fun b!1317940 () Bool)

(assert (=> b!1317940 (= e!751939 (isDefined!516 (getValueByKey!707 (toList!10435 (+!4544 lt!586545 (tuple2!23175 lt!586561 zeroValue!1296))) lt!586550)))))

(assert (= (and d!143095 c!126022) b!1317938))

(assert (= (and d!143095 (not c!126022)) b!1317939))

(assert (= (and d!143095 (not res!874511)) b!1317940))

(declare-fun m!1206341 () Bool)

(assert (=> d!143095 m!1206341))

(declare-fun m!1206343 () Bool)

(assert (=> b!1317938 m!1206343))

(declare-fun m!1206345 () Bool)

(assert (=> b!1317938 m!1206345))

(assert (=> b!1317938 m!1206345))

(declare-fun m!1206347 () Bool)

(assert (=> b!1317938 m!1206347))

(assert (=> b!1317940 m!1206345))

(assert (=> b!1317940 m!1206345))

(assert (=> b!1317940 m!1206347))

(assert (=> b!1317698 d!143095))

(declare-fun b!1317941 () Bool)

(assert (=> b!1317941 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43266 _keys!1628)))))

(assert (=> b!1317941 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43265 _values!1354)))))

(declare-fun lt!586737 () ListLongMap!20839)

(declare-fun e!751942 () Bool)

(assert (=> b!1317941 (= e!751942 (= (apply!1037 lt!586737 (select (arr!42715 _keys!1628) from!2020)) (get!21506 (select (arr!42714 _values!1354) from!2020) (dynLambda!3498 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1317942 () Bool)

(declare-fun e!751943 () Bool)

(declare-fun e!751947 () Bool)

(assert (=> b!1317942 (= e!751943 e!751947)))

(declare-fun c!126024 () Bool)

(assert (=> b!1317942 (= c!126024 (bvslt from!2020 (size!43266 _keys!1628)))))

(declare-fun b!1317943 () Bool)

(assert (=> b!1317943 (= e!751947 (isEmpty!1077 lt!586737))))

(declare-fun d!143097 () Bool)

(declare-fun e!751941 () Bool)

(assert (=> d!143097 e!751941))

(declare-fun res!874512 () Bool)

(assert (=> d!143097 (=> (not res!874512) (not e!751941))))

(assert (=> d!143097 (= res!874512 (not (contains!8597 lt!586737 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!751946 () ListLongMap!20839)

(assert (=> d!143097 (= lt!586737 e!751946)))

(declare-fun c!126025 () Bool)

(assert (=> d!143097 (= c!126025 (bvsge from!2020 (size!43266 _keys!1628)))))

(assert (=> d!143097 (validMask!0 mask!2040)))

(assert (=> d!143097 (= (getCurrentListMapNoExtraKeys!6183 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) lt!586737)))

(declare-fun b!1317944 () Bool)

(declare-fun e!751944 () Bool)

(assert (=> b!1317944 (= e!751944 (validKeyInArray!0 (select (arr!42715 _keys!1628) from!2020)))))

(assert (=> b!1317944 (bvsge from!2020 #b00000000000000000000000000000000)))

(declare-fun b!1317945 () Bool)

(declare-fun e!751945 () ListLongMap!20839)

(assert (=> b!1317945 (= e!751946 e!751945)))

(declare-fun c!126026 () Bool)

(assert (=> b!1317945 (= c!126026 (validKeyInArray!0 (select (arr!42715 _keys!1628) from!2020)))))

(declare-fun bm!64734 () Bool)

(declare-fun call!64737 () ListLongMap!20839)

(assert (=> bm!64734 (= call!64737 (getCurrentListMapNoExtraKeys!6183 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd from!2020 #b00000000000000000000000000000001) defaultEntry!1357))))

(declare-fun b!1317946 () Bool)

(assert (=> b!1317946 (= e!751945 call!64737)))

(declare-fun b!1317947 () Bool)

(declare-fun res!874514 () Bool)

(assert (=> b!1317947 (=> (not res!874514) (not e!751941))))

(assert (=> b!1317947 (= res!874514 (not (contains!8597 lt!586737 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1317948 () Bool)

(assert (=> b!1317948 (= e!751947 (= lt!586737 (getCurrentListMapNoExtraKeys!6183 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd from!2020 #b00000000000000000000000000000001) defaultEntry!1357)))))

(declare-fun b!1317949 () Bool)

(assert (=> b!1317949 (= e!751941 e!751943)))

(declare-fun c!126023 () Bool)

(assert (=> b!1317949 (= c!126023 e!751944)))

(declare-fun res!874515 () Bool)

(assert (=> b!1317949 (=> (not res!874515) (not e!751944))))

(assert (=> b!1317949 (= res!874515 (bvslt from!2020 (size!43266 _keys!1628)))))

(declare-fun b!1317950 () Bool)

(assert (=> b!1317950 (= e!751943 e!751942)))

(assert (=> b!1317950 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43266 _keys!1628)))))

(declare-fun res!874513 () Bool)

(assert (=> b!1317950 (= res!874513 (contains!8597 lt!586737 (select (arr!42715 _keys!1628) from!2020)))))

(assert (=> b!1317950 (=> (not res!874513) (not e!751942))))

(declare-fun b!1317951 () Bool)

(assert (=> b!1317951 (= e!751946 (ListLongMap!20840 Nil!30314))))

(declare-fun b!1317952 () Bool)

(declare-fun lt!586734 () Unit!43363)

(declare-fun lt!586735 () Unit!43363)

(assert (=> b!1317952 (= lt!586734 lt!586735)))

(declare-fun lt!586732 () V!52745)

(declare-fun lt!586733 () (_ BitVec 64))

(declare-fun lt!586736 () ListLongMap!20839)

(declare-fun lt!586738 () (_ BitVec 64))

(assert (=> b!1317952 (not (contains!8597 (+!4544 lt!586736 (tuple2!23175 lt!586738 lt!586732)) lt!586733))))

(assert (=> b!1317952 (= lt!586735 (addStillNotContains!493 lt!586736 lt!586738 lt!586732 lt!586733))))

(assert (=> b!1317952 (= lt!586733 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1317952 (= lt!586732 (get!21506 (select (arr!42714 _values!1354) from!2020) (dynLambda!3498 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1317952 (= lt!586738 (select (arr!42715 _keys!1628) from!2020))))

(assert (=> b!1317952 (= lt!586736 call!64737)))

(assert (=> b!1317952 (= e!751945 (+!4544 call!64737 (tuple2!23175 (select (arr!42715 _keys!1628) from!2020) (get!21506 (select (arr!42714 _values!1354) from!2020) (dynLambda!3498 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!143097 c!126025) b!1317951))

(assert (= (and d!143097 (not c!126025)) b!1317945))

(assert (= (and b!1317945 c!126026) b!1317952))

(assert (= (and b!1317945 (not c!126026)) b!1317946))

(assert (= (or b!1317952 b!1317946) bm!64734))

(assert (= (and d!143097 res!874512) b!1317947))

(assert (= (and b!1317947 res!874514) b!1317949))

(assert (= (and b!1317949 res!874515) b!1317944))

(assert (= (and b!1317949 c!126023) b!1317950))

(assert (= (and b!1317949 (not c!126023)) b!1317942))

(assert (= (and b!1317950 res!874513) b!1317941))

(assert (= (and b!1317942 c!126024) b!1317948))

(assert (= (and b!1317942 (not c!126024)) b!1317943))

(declare-fun b_lambda!23369 () Bool)

(assert (=> (not b_lambda!23369) (not b!1317941)))

(assert (=> b!1317941 t!43921))

(declare-fun b_and!48225 () Bool)

(assert (= b_and!48223 (and (=> t!43921 result!23857) b_and!48225)))

(declare-fun b_lambda!23371 () Bool)

(assert (=> (not b_lambda!23371) (not b!1317952)))

(assert (=> b!1317952 t!43921))

(declare-fun b_and!48227 () Bool)

(assert (= b_and!48225 (and (=> t!43921 result!23857) b_and!48227)))

(assert (=> b!1317945 m!1205789))

(assert (=> b!1317945 m!1205789))

(assert (=> b!1317945 m!1205791))

(assert (=> b!1317950 m!1205789))

(assert (=> b!1317950 m!1205789))

(declare-fun m!1206349 () Bool)

(assert (=> b!1317950 m!1206349))

(declare-fun m!1206351 () Bool)

(assert (=> bm!64734 m!1206351))

(assert (=> b!1317944 m!1205789))

(assert (=> b!1317944 m!1205789))

(assert (=> b!1317944 m!1205791))

(assert (=> b!1317948 m!1206351))

(declare-fun m!1206353 () Bool)

(assert (=> b!1317947 m!1206353))

(assert (=> b!1317941 m!1205789))

(assert (=> b!1317941 m!1205907))

(assert (=> b!1317941 m!1205789))

(declare-fun m!1206355 () Bool)

(assert (=> b!1317941 m!1206355))

(assert (=> b!1317941 m!1205907))

(assert (=> b!1317941 m!1205909))

(assert (=> b!1317941 m!1205911))

(assert (=> b!1317941 m!1205909))

(declare-fun m!1206357 () Bool)

(assert (=> b!1317943 m!1206357))

(declare-fun m!1206359 () Bool)

(assert (=> d!143097 m!1206359))

(assert (=> d!143097 m!1205783))

(assert (=> b!1317952 m!1205907))

(declare-fun m!1206361 () Bool)

(assert (=> b!1317952 m!1206361))

(declare-fun m!1206363 () Bool)

(assert (=> b!1317952 m!1206363))

(declare-fun m!1206365 () Bool)

(assert (=> b!1317952 m!1206365))

(assert (=> b!1317952 m!1205907))

(assert (=> b!1317952 m!1205909))

(assert (=> b!1317952 m!1205911))

(assert (=> b!1317952 m!1205909))

(assert (=> b!1317952 m!1206361))

(assert (=> b!1317952 m!1205789))

(declare-fun m!1206367 () Bool)

(assert (=> b!1317952 m!1206367))

(assert (=> b!1317698 d!143097))

(declare-fun d!143099 () Bool)

(assert (=> d!143099 (= (apply!1037 (+!4544 lt!586541 (tuple2!23175 lt!586555 zeroValue!1296)) lt!586556) (apply!1037 lt!586541 lt!586556))))

(declare-fun lt!586739 () Unit!43363)

(assert (=> d!143099 (= lt!586739 (choose!1945 lt!586541 lt!586555 zeroValue!1296 lt!586556))))

(declare-fun e!751948 () Bool)

(assert (=> d!143099 e!751948))

(declare-fun res!874516 () Bool)

(assert (=> d!143099 (=> (not res!874516) (not e!751948))))

(assert (=> d!143099 (= res!874516 (contains!8597 lt!586541 lt!586556))))

(assert (=> d!143099 (= (addApplyDifferent!566 lt!586541 lt!586555 zeroValue!1296 lt!586556) lt!586739)))

(declare-fun b!1317953 () Bool)

(assert (=> b!1317953 (= e!751948 (not (= lt!586556 lt!586555)))))

(assert (= (and d!143099 res!874516) b!1317953))

(declare-fun m!1206369 () Bool)

(assert (=> d!143099 m!1206369))

(assert (=> d!143099 m!1205883))

(assert (=> d!143099 m!1205877))

(declare-fun m!1206371 () Bool)

(assert (=> d!143099 m!1206371))

(assert (=> d!143099 m!1205883))

(assert (=> d!143099 m!1205899))

(assert (=> b!1317698 d!143099))

(declare-fun d!143101 () Bool)

(declare-fun e!751949 () Bool)

(assert (=> d!143101 e!751949))

(declare-fun res!874517 () Bool)

(assert (=> d!143101 (=> (not res!874517) (not e!751949))))

(declare-fun lt!586743 () ListLongMap!20839)

(assert (=> d!143101 (= res!874517 (contains!8597 lt!586743 (_1!11598 (tuple2!23175 lt!586561 zeroValue!1296))))))

(declare-fun lt!586741 () List!30317)

(assert (=> d!143101 (= lt!586743 (ListLongMap!20840 lt!586741))))

(declare-fun lt!586740 () Unit!43363)

(declare-fun lt!586742 () Unit!43363)

(assert (=> d!143101 (= lt!586740 lt!586742)))

(assert (=> d!143101 (= (getValueByKey!707 lt!586741 (_1!11598 (tuple2!23175 lt!586561 zeroValue!1296))) (Some!757 (_2!11598 (tuple2!23175 lt!586561 zeroValue!1296))))))

(assert (=> d!143101 (= lt!586742 (lemmaContainsTupThenGetReturnValue!357 lt!586741 (_1!11598 (tuple2!23175 lt!586561 zeroValue!1296)) (_2!11598 (tuple2!23175 lt!586561 zeroValue!1296))))))

(assert (=> d!143101 (= lt!586741 (insertStrictlySorted!486 (toList!10435 lt!586545) (_1!11598 (tuple2!23175 lt!586561 zeroValue!1296)) (_2!11598 (tuple2!23175 lt!586561 zeroValue!1296))))))

(assert (=> d!143101 (= (+!4544 lt!586545 (tuple2!23175 lt!586561 zeroValue!1296)) lt!586743)))

(declare-fun b!1317954 () Bool)

(declare-fun res!874518 () Bool)

(assert (=> b!1317954 (=> (not res!874518) (not e!751949))))

(assert (=> b!1317954 (= res!874518 (= (getValueByKey!707 (toList!10435 lt!586743) (_1!11598 (tuple2!23175 lt!586561 zeroValue!1296))) (Some!757 (_2!11598 (tuple2!23175 lt!586561 zeroValue!1296)))))))

(declare-fun b!1317955 () Bool)

(assert (=> b!1317955 (= e!751949 (contains!8600 (toList!10435 lt!586743) (tuple2!23175 lt!586561 zeroValue!1296)))))

(assert (= (and d!143101 res!874517) b!1317954))

(assert (= (and b!1317954 res!874518) b!1317955))

(declare-fun m!1206373 () Bool)

(assert (=> d!143101 m!1206373))

(declare-fun m!1206375 () Bool)

(assert (=> d!143101 m!1206375))

(declare-fun m!1206377 () Bool)

(assert (=> d!143101 m!1206377))

(declare-fun m!1206379 () Bool)

(assert (=> d!143101 m!1206379))

(declare-fun m!1206381 () Bool)

(assert (=> b!1317954 m!1206381))

(declare-fun m!1206383 () Bool)

(assert (=> b!1317955 m!1206383))

(assert (=> b!1317698 d!143101))

(declare-fun d!143103 () Bool)

(declare-fun e!751950 () Bool)

(assert (=> d!143103 e!751950))

(declare-fun res!874519 () Bool)

(assert (=> d!143103 (=> (not res!874519) (not e!751950))))

(declare-fun lt!586747 () ListLongMap!20839)

(assert (=> d!143103 (= res!874519 (contains!8597 lt!586747 (_1!11598 (tuple2!23175 lt!586542 minValue!1296))))))

(declare-fun lt!586745 () List!30317)

(assert (=> d!143103 (= lt!586747 (ListLongMap!20840 lt!586745))))

(declare-fun lt!586744 () Unit!43363)

(declare-fun lt!586746 () Unit!43363)

(assert (=> d!143103 (= lt!586744 lt!586746)))

(assert (=> d!143103 (= (getValueByKey!707 lt!586745 (_1!11598 (tuple2!23175 lt!586542 minValue!1296))) (Some!757 (_2!11598 (tuple2!23175 lt!586542 minValue!1296))))))

(assert (=> d!143103 (= lt!586746 (lemmaContainsTupThenGetReturnValue!357 lt!586745 (_1!11598 (tuple2!23175 lt!586542 minValue!1296)) (_2!11598 (tuple2!23175 lt!586542 minValue!1296))))))

(assert (=> d!143103 (= lt!586745 (insertStrictlySorted!486 (toList!10435 lt!586549) (_1!11598 (tuple2!23175 lt!586542 minValue!1296)) (_2!11598 (tuple2!23175 lt!586542 minValue!1296))))))

(assert (=> d!143103 (= (+!4544 lt!586549 (tuple2!23175 lt!586542 minValue!1296)) lt!586747)))

(declare-fun b!1317956 () Bool)

(declare-fun res!874520 () Bool)

(assert (=> b!1317956 (=> (not res!874520) (not e!751950))))

(assert (=> b!1317956 (= res!874520 (= (getValueByKey!707 (toList!10435 lt!586747) (_1!11598 (tuple2!23175 lt!586542 minValue!1296))) (Some!757 (_2!11598 (tuple2!23175 lt!586542 minValue!1296)))))))

(declare-fun b!1317957 () Bool)

(assert (=> b!1317957 (= e!751950 (contains!8600 (toList!10435 lt!586747) (tuple2!23175 lt!586542 minValue!1296)))))

(assert (= (and d!143103 res!874519) b!1317956))

(assert (= (and b!1317956 res!874520) b!1317957))

(declare-fun m!1206385 () Bool)

(assert (=> d!143103 m!1206385))

(declare-fun m!1206387 () Bool)

(assert (=> d!143103 m!1206387))

(declare-fun m!1206389 () Bool)

(assert (=> d!143103 m!1206389))

(declare-fun m!1206391 () Bool)

(assert (=> d!143103 m!1206391))

(declare-fun m!1206393 () Bool)

(assert (=> b!1317956 m!1206393))

(declare-fun m!1206395 () Bool)

(assert (=> b!1317957 m!1206395))

(assert (=> b!1317698 d!143103))

(declare-fun d!143105 () Bool)

(assert (=> d!143105 (= (apply!1037 lt!586557 lt!586547) (get!21507 (getValueByKey!707 (toList!10435 lt!586557) lt!586547)))))

(declare-fun bs!37635 () Bool)

(assert (= bs!37635 d!143105))

(declare-fun m!1206397 () Bool)

(assert (=> bs!37635 m!1206397))

(assert (=> bs!37635 m!1206397))

(declare-fun m!1206399 () Bool)

(assert (=> bs!37635 m!1206399))

(assert (=> b!1317698 d!143105))

(declare-fun d!143107 () Bool)

(assert (=> d!143107 (= (apply!1037 (+!4544 lt!586557 (tuple2!23175 lt!586560 minValue!1296)) lt!586547) (get!21507 (getValueByKey!707 (toList!10435 (+!4544 lt!586557 (tuple2!23175 lt!586560 minValue!1296))) lt!586547)))))

(declare-fun bs!37636 () Bool)

(assert (= bs!37636 d!143107))

(declare-fun m!1206401 () Bool)

(assert (=> bs!37636 m!1206401))

(assert (=> bs!37636 m!1206401))

(declare-fun m!1206403 () Bool)

(assert (=> bs!37636 m!1206403))

(assert (=> b!1317698 d!143107))

(assert (=> bm!64721 d!142983))

(assert (=> bm!64711 d!143097))

(declare-fun d!143109 () Bool)

(assert (=> d!143109 (= (apply!1037 lt!586588 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21507 (getValueByKey!707 (toList!10435 lt!586588) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37637 () Bool)

(assert (= bs!37637 d!143109))

(assert (=> bs!37637 m!1206243))

(assert (=> bs!37637 m!1206243))

(declare-fun m!1206405 () Bool)

(assert (=> bs!37637 m!1206405))

(assert (=> b!1317737 d!143109))

(declare-fun condMapEmpty!55235 () Bool)

(declare-fun mapDefault!55235 () ValueCell!16967)

(assert (=> mapNonEmpty!55234 (= condMapEmpty!55235 (= mapRest!55234 ((as const (Array (_ BitVec 32) ValueCell!16967)) mapDefault!55235)))))

(declare-fun e!751952 () Bool)

(declare-fun mapRes!55235 () Bool)

(assert (=> mapNonEmpty!55234 (= tp!105340 (and e!751952 mapRes!55235))))

(declare-fun b!1317959 () Bool)

(assert (=> b!1317959 (= e!751952 tp_is_empty!35731)))

(declare-fun mapNonEmpty!55235 () Bool)

(declare-fun tp!105341 () Bool)

(declare-fun e!751951 () Bool)

(assert (=> mapNonEmpty!55235 (= mapRes!55235 (and tp!105341 e!751951))))

(declare-fun mapValue!55235 () ValueCell!16967)

(declare-fun mapKey!55235 () (_ BitVec 32))

(declare-fun mapRest!55235 () (Array (_ BitVec 32) ValueCell!16967))

(assert (=> mapNonEmpty!55235 (= mapRest!55234 (store mapRest!55235 mapKey!55235 mapValue!55235))))

(declare-fun b!1317958 () Bool)

(assert (=> b!1317958 (= e!751951 tp_is_empty!35731)))

(declare-fun mapIsEmpty!55235 () Bool)

(assert (=> mapIsEmpty!55235 mapRes!55235))

(assert (= (and mapNonEmpty!55234 condMapEmpty!55235) mapIsEmpty!55235))

(assert (= (and mapNonEmpty!55234 (not condMapEmpty!55235)) mapNonEmpty!55235))

(assert (= (and mapNonEmpty!55235 ((_ is ValueCellFull!16967) mapValue!55235)) b!1317958))

(assert (= (and mapNonEmpty!55234 ((_ is ValueCellFull!16967) mapDefault!55235)) b!1317959))

(declare-fun m!1206407 () Bool)

(assert (=> mapNonEmpty!55235 m!1206407))

(declare-fun b_lambda!23373 () Bool)

(assert (= b_lambda!23365 (or (and start!111390 b_free!30001) b_lambda!23373)))

(declare-fun b_lambda!23375 () Bool)

(assert (= b_lambda!23369 (or (and start!111390 b_free!30001) b_lambda!23375)))

(declare-fun b_lambda!23377 () Bool)

(assert (= b_lambda!23367 (or (and start!111390 b_free!30001) b_lambda!23377)))

(declare-fun b_lambda!23379 () Bool)

(assert (= b_lambda!23371 (or (and start!111390 b_free!30001) b_lambda!23379)))

(check-sat (not d!142997) (not b!1317930) (not bm!64731) (not b!1317829) (not b!1317936) (not b!1317880) (not d!142993) (not b!1317811) (not b!1317907) (not b!1317937) (not b!1317893) (not d!143107) (not d!143069) (not b!1317889) (not b!1317885) (not d!143053) (not bm!64733) (not b_lambda!23373) (not b!1317932) (not b!1317918) (not d!143089) (not b_lambda!23361) (not b_lambda!23375) (not b!1317884) (not d!143043) (not d!143023) (not d!143039) (not bm!64732) (not d!143103) (not d!143013) (not b!1317902) (not b_lambda!23379) (not d!142991) (not bm!64734) tp_is_empty!35731 (not b!1317912) (not b!1317814) (not d!143003) (not b!1317780) (not d!143099) (not d!143095) (not b!1317927) (not d!143063) (not b!1317869) (not b!1317950) (not d!143001) (not d!143097) (not b!1317913) (not b!1317892) (not b!1317894) (not b!1317925) (not d!142987) (not b!1317933) (not b!1317909) (not d!143033) (not d!143055) (not b!1317931) (not mapNonEmpty!55235) (not b!1317809) (not b!1317777) (not d!142979) (not b!1317886) (not b!1317940) (not b!1317896) (not d!143021) (not d!143079) (not b!1317807) (not b!1317954) (not d!142995) (not b!1317824) (not b!1317825) (not b!1317947) (not b!1317941) (not b!1317901) (not b!1317898) (not d!142983) (not b!1317823) (not b!1317938) (not d!143091) (not d!143037) (not b!1317778) (not b!1317822) (not b!1317890) (not d!143081) (not d!143067) (not d!143007) (not b!1317955) (not b!1317827) (not d!143061) (not d!143087) (not b!1317842) (not b!1317945) (not b!1317805) (not b!1317948) (not d!143073) (not d!143035) (not d!143093) (not b!1317891) (not b!1317812) (not b!1317836) (not b!1317910) (not b!1317957) (not d!142989) (not b!1317944) (not d!143057) (not b!1317855) (not b_next!30001) (not b!1317779) (not b_lambda!23363) (not d!143009) (not b!1317816) (not b!1317914) (not b!1317861) (not b!1317908) (not b!1317956) (not b!1317904) b_and!48227 (not b!1317943) (not d!143005) (not d!143105) (not d!143085) (not b!1317887) (not b!1317863) (not d!142985) (not b!1317868) (not b!1317808) (not d!143051) (not d!143109) (not d!143017) (not b!1317905) (not d!143027) (not d!142999) (not b_lambda!23377) (not d!143101) (not d!143049) (not b!1317952) (not d!143077) (not b!1317897) (not d!143031) (not d!143083) (not d!143047) (not b!1317915) (not d!142981))
(check-sat b_and!48227 (not b_next!30001))
