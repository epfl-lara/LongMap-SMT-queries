; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3436 () Bool)

(assert start!3436)

(declare-fun b!22229 () Bool)

(declare-fun b_free!739 () Bool)

(declare-fun b_next!739 () Bool)

(assert (=> b!22229 (= b_free!739 (not b_next!739))))

(declare-fun tp!3458 () Bool)

(declare-fun b_and!1445 () Bool)

(assert (=> b!22229 (= tp!3458 b_and!1445)))

(declare-fun b!22222 () Bool)

(declare-fun e!14424 () Bool)

(declare-fun e!14413 () Bool)

(assert (=> b!22222 (= e!14424 e!14413)))

(declare-fun bm!1561 () Bool)

(declare-datatypes ((V!1163 0))(
  ( (V!1164 (val!528 Int)) )
))
(declare-datatypes ((ValueCell!302 0))(
  ( (ValueCellFull!302 (v!1580 V!1163)) (EmptyCell!302) )
))
(declare-datatypes ((array!1221 0))(
  ( (array!1222 (arr!578 (Array (_ BitVec 32) ValueCell!302)) (size!674 (_ BitVec 32))) )
))
(declare-datatypes ((array!1223 0))(
  ( (array!1224 (arr!579 (Array (_ BitVec 32) (_ BitVec 64))) (size!675 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!190 0))(
  ( (LongMapFixedSize!191 (defaultEntry!1731 Int) (mask!4711 (_ BitVec 32)) (extraKeys!1631 (_ BitVec 32)) (zeroValue!1656 V!1163) (minValue!1656 V!1163) (_size!138 (_ BitVec 32)) (_keys!3154 array!1223) (_values!1719 array!1221) (_vacant!138 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!918 0))(
  ( (tuple2!919 (_1!462 Bool) (_2!462 LongMapFixedSize!190)) )
))
(declare-fun call!1564 () tuple2!918)

(declare-fun call!1565 () tuple2!918)

(assert (=> bm!1561 (= call!1564 call!1565)))

(declare-fun b!22223 () Bool)

(declare-fun e!14418 () Bool)

(declare-fun e!14415 () Bool)

(declare-fun mapRes!989 () Bool)

(assert (=> b!22223 (= e!14418 (and e!14415 mapRes!989))))

(declare-fun condMapEmpty!989 () Bool)

(declare-datatypes ((Cell!190 0))(
  ( (Cell!191 (v!1581 LongMapFixedSize!190)) )
))
(declare-datatypes ((LongMap!190 0))(
  ( (LongMap!191 (underlying!106 Cell!190)) )
))
(declare-fun thiss!938 () LongMap!190)

(declare-fun mapDefault!989 () ValueCell!302)

(assert (=> b!22223 (= condMapEmpty!989 (= (arr!578 (_values!1719 (v!1581 (underlying!106 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!302)) mapDefault!989)))))

(declare-fun b!22224 () Bool)

(declare-fun e!14417 () Bool)

(assert (=> b!22224 (= e!14417 e!14424)))

(declare-fun c!2689 () Bool)

(declare-fun lt!7448 () LongMapFixedSize!190)

(declare-fun bm!1562 () Bool)

(declare-fun c!2690 () Bool)

(declare-fun update!31 (LongMapFixedSize!190 (_ BitVec 64) V!1163) tuple2!918)

(assert (=> bm!1562 (= call!1565 (update!31 lt!7448 (ite (or c!2689 c!2690) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2689 c!2690) (zeroValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (v!1581 (underlying!106 thiss!938))))))))

(declare-fun b!22225 () Bool)

(declare-datatypes ((tuple2!920 0))(
  ( (tuple2!921 (_1!463 Bool) (_2!463 Cell!190)) )
))
(declare-fun e!14423 () tuple2!920)

(declare-fun lt!7454 () tuple2!918)

(assert (=> b!22225 (= e!14423 (tuple2!921 (_1!462 lt!7454) (Cell!191 (_2!462 lt!7454))))))

(assert (=> b!22225 (= lt!7454 call!1564)))

(declare-fun b!22226 () Bool)

(declare-fun lt!7449 () tuple2!918)

(assert (=> b!22226 (= lt!7449 call!1564)))

(declare-fun e!14414 () tuple2!920)

(assert (=> b!22226 (= e!14414 (tuple2!921 (_1!462 lt!7449) (Cell!191 (_2!462 lt!7449))))))

(declare-fun b!22227 () Bool)

(declare-fun e!14421 () Bool)

(declare-fun tp_is_empty!1003 () Bool)

(assert (=> b!22227 (= e!14421 tp_is_empty!1003)))

(declare-fun lt!7452 () Cell!190)

(declare-fun lt!7455 () tuple2!918)

(declare-fun b!22228 () Bool)

(declare-datatypes ((tuple3!6 0))(
  ( (tuple3!7 (_1!464 Bool) (_2!464 Cell!190) (_3!3 LongMap!190)) )
))
(declare-fun e!14412 () tuple3!6)

(assert (=> b!22228 (= e!14412 (ite (_1!462 lt!7455) (tuple3!7 true (underlying!106 thiss!938) (LongMap!191 lt!7452)) (tuple3!7 false lt!7452 thiss!938)))))

(declare-fun lt!7457 () tuple2!920)

(declare-fun repackFrom!4 (LongMap!190 LongMapFixedSize!190 (_ BitVec 32)) tuple2!918)

(assert (=> b!22228 (= lt!7455 (repackFrom!4 thiss!938 (v!1581 (_2!463 lt!7457)) (bvsub (size!675 (_keys!3154 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!22228 (= lt!7452 (Cell!191 (_2!462 lt!7455)))))

(declare-fun array_inv!409 (array!1223) Bool)

(declare-fun array_inv!410 (array!1221) Bool)

(assert (=> b!22229 (= e!14413 (and tp!3458 tp_is_empty!1003 (array_inv!409 (_keys!3154 (v!1581 (underlying!106 thiss!938)))) (array_inv!410 (_values!1719 (v!1581 (underlying!106 thiss!938)))) e!14418))))

(declare-fun res!14108 () Bool)

(declare-fun e!14416 () Bool)

(assert (=> start!3436 (=> (not res!14108) (not e!14416))))

(declare-fun valid!106 (LongMap!190) Bool)

(assert (=> start!3436 (= res!14108 (valid!106 thiss!938))))

(assert (=> start!3436 e!14416))

(assert (=> start!3436 e!14417))

(declare-fun mapNonEmpty!989 () Bool)

(declare-fun tp!3457 () Bool)

(assert (=> mapNonEmpty!989 (= mapRes!989 (and tp!3457 e!14421))))

(declare-fun mapRest!989 () (Array (_ BitVec 32) ValueCell!302))

(declare-fun mapValue!989 () ValueCell!302)

(declare-fun mapKey!989 () (_ BitVec 32))

(assert (=> mapNonEmpty!989 (= (arr!578 (_values!1719 (v!1581 (underlying!106 thiss!938)))) (store mapRest!989 mapKey!989 mapValue!989))))

(declare-fun b!22230 () Bool)

(assert (=> b!22230 (= e!14412 (tuple3!7 false (_2!463 lt!7457) thiss!938))))

(declare-fun b!22231 () Bool)

(assert (=> b!22231 (= e!14415 tp_is_empty!1003)))

(declare-fun b!22232 () Bool)

(declare-fun e!14420 () Bool)

(assert (=> b!22232 (= e!14416 e!14420)))

(declare-fun res!14107 () Bool)

(assert (=> b!22232 (=> (not res!14107) (not e!14420))))

(declare-fun lt!7453 () tuple3!6)

(assert (=> b!22232 (= res!14107 (_1!464 lt!7453))))

(assert (=> b!22232 (= lt!7453 e!14412)))

(declare-fun c!2687 () Bool)

(assert (=> b!22232 (= c!2687 (not (_1!463 lt!7457)))))

(declare-fun e!14419 () tuple2!920)

(assert (=> b!22232 (= lt!7457 e!14419)))

(declare-fun lt!7450 () Bool)

(assert (=> b!22232 (= c!2689 (and (not lt!7450) (not (= (bvand (extraKeys!1631 (v!1581 (underlying!106 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!22232 (= lt!7450 (= (bvand (extraKeys!1631 (v!1581 (underlying!106 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!28 ((_ BitVec 32) Int) LongMapFixedSize!190)

(declare-fun computeNewMask!25 (LongMap!190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!22232 (= lt!7448 (getNewLongMapFixedSize!28 (computeNewMask!25 thiss!938 (mask!4711 (v!1581 (underlying!106 thiss!938))) (_vacant!138 (v!1581 (underlying!106 thiss!938))) (_size!138 (v!1581 (underlying!106 thiss!938)))) (defaultEntry!1731 (v!1581 (underlying!106 thiss!938)))))))

(declare-fun b!22233 () Bool)

(assert (=> b!22233 (= e!14423 (tuple2!921 true (Cell!191 lt!7448)))))

(declare-fun b!22234 () Bool)

(assert (=> b!22234 (= e!14420 (not (valid!106 (_3!3 lt!7453))))))

(declare-fun mapIsEmpty!989 () Bool)

(assert (=> mapIsEmpty!989 mapRes!989))

(declare-fun b!22235 () Bool)

(declare-fun c!2688 () Bool)

(assert (=> b!22235 (= c!2688 (and (not (= (bvand (extraKeys!1631 (v!1581 (underlying!106 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!7450))))

(assert (=> b!22235 (= e!14414 e!14423)))

(declare-fun b!22236 () Bool)

(declare-fun lt!7451 () tuple2!918)

(declare-fun lt!7456 () tuple2!918)

(assert (=> b!22236 (= e!14419 (tuple2!921 (and (_1!462 lt!7451) (_1!462 lt!7456)) (Cell!191 (_2!462 lt!7456))))))

(assert (=> b!22236 (= lt!7451 call!1565)))

(assert (=> b!22236 (= lt!7456 (update!31 (_2!462 lt!7451) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1656 (v!1581 (underlying!106 thiss!938)))))))

(declare-fun b!22237 () Bool)

(assert (=> b!22237 (= e!14419 e!14414)))

(assert (=> b!22237 (= c!2690 (and (not lt!7450) (= (bvand (extraKeys!1631 (v!1581 (underlying!106 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!3436 res!14108) b!22232))

(assert (= (and b!22232 c!2689) b!22236))

(assert (= (and b!22232 (not c!2689)) b!22237))

(assert (= (and b!22237 c!2690) b!22226))

(assert (= (and b!22237 (not c!2690)) b!22235))

(assert (= (and b!22235 c!2688) b!22225))

(assert (= (and b!22235 (not c!2688)) b!22233))

(assert (= (or b!22226 b!22225) bm!1561))

(assert (= (or b!22236 bm!1561) bm!1562))

(assert (= (and b!22232 c!2687) b!22230))

(assert (= (and b!22232 (not c!2687)) b!22228))

(assert (= (and b!22232 res!14107) b!22234))

(assert (= (and b!22223 condMapEmpty!989) mapIsEmpty!989))

(assert (= (and b!22223 (not condMapEmpty!989)) mapNonEmpty!989))

(get-info :version)

(assert (= (and mapNonEmpty!989 ((_ is ValueCellFull!302) mapValue!989)) b!22227))

(assert (= (and b!22223 ((_ is ValueCellFull!302) mapDefault!989)) b!22231))

(assert (= b!22229 b!22223))

(assert (= b!22222 b!22229))

(assert (= b!22224 b!22222))

(assert (= start!3436 b!22224))

(declare-fun m!16118 () Bool)

(assert (=> b!22234 m!16118))

(declare-fun m!16120 () Bool)

(assert (=> bm!1562 m!16120))

(declare-fun m!16122 () Bool)

(assert (=> b!22228 m!16122))

(declare-fun m!16124 () Bool)

(assert (=> mapNonEmpty!989 m!16124))

(declare-fun m!16126 () Bool)

(assert (=> b!22229 m!16126))

(declare-fun m!16128 () Bool)

(assert (=> b!22229 m!16128))

(declare-fun m!16130 () Bool)

(assert (=> b!22236 m!16130))

(declare-fun m!16132 () Bool)

(assert (=> start!3436 m!16132))

(declare-fun m!16134 () Bool)

(assert (=> b!22232 m!16134))

(assert (=> b!22232 m!16134))

(declare-fun m!16136 () Bool)

(assert (=> b!22232 m!16136))

(check-sat tp_is_empty!1003 (not bm!1562) (not start!3436) (not mapNonEmpty!989) (not b!22228) b_and!1445 (not b!22234) (not b!22236) (not b_next!739) (not b!22229) (not b!22232))
(check-sat b_and!1445 (not b_next!739))
(get-model)

(declare-fun d!3907 () Bool)

(declare-fun valid!109 (LongMapFixedSize!190) Bool)

(assert (=> d!3907 (= (valid!106 thiss!938) (valid!109 (v!1581 (underlying!106 thiss!938))))))

(declare-fun bs!935 () Bool)

(assert (= bs!935 d!3907))

(declare-fun m!16178 () Bool)

(assert (=> bs!935 m!16178))

(assert (=> start!3436 d!3907))

(declare-fun b!22414 () Bool)

(declare-datatypes ((Unit!495 0))(
  ( (Unit!496) )
))
(declare-fun e!14546 () Unit!495)

(declare-fun lt!7577 () Unit!495)

(assert (=> b!22414 (= e!14546 lt!7577)))

(declare-fun call!1636 () Unit!495)

(assert (=> b!22414 (= lt!7577 call!1636)))

(declare-datatypes ((SeekEntryResult!53 0))(
  ( (MissingZero!53 (index!2333 (_ BitVec 32))) (Found!53 (index!2334 (_ BitVec 32))) (Intermediate!53 (undefined!865 Bool) (index!2335 (_ BitVec 32)) (x!5423 (_ BitVec 32))) (Undefined!53) (MissingVacant!53 (index!2336 (_ BitVec 32))) )
))
(declare-fun lt!7587 () SeekEntryResult!53)

(declare-fun call!1632 () SeekEntryResult!53)

(assert (=> b!22414 (= lt!7587 call!1632)))

(declare-fun c!2741 () Bool)

(assert (=> b!22414 (= c!2741 ((_ is MissingZero!53) lt!7587))))

(declare-fun e!14565 () Bool)

(assert (=> b!22414 e!14565))

(declare-fun b!22415 () Bool)

(declare-fun e!14554 () Bool)

(declare-fun e!14564 () Bool)

(assert (=> b!22415 (= e!14554 e!14564)))

(declare-fun res!14162 () Bool)

(declare-fun call!1627 () Bool)

(assert (=> b!22415 (= res!14162 call!1627)))

(assert (=> b!22415 (=> (not res!14162) (not e!14564))))

(declare-fun b!22416 () Bool)

(declare-fun res!14151 () Bool)

(declare-fun call!1647 () Bool)

(assert (=> b!22416 (= res!14151 call!1647)))

(declare-fun e!14560 () Bool)

(assert (=> b!22416 (=> (not res!14151) (not e!14560))))

(declare-fun b!22417 () Bool)

(declare-fun e!14549 () tuple2!918)

(declare-fun e!14547 () tuple2!918)

(assert (=> b!22417 (= e!14549 e!14547)))

(declare-fun c!2746 () Bool)

(assert (=> b!22417 (= c!2746 (= #b1000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22418 () Bool)

(declare-fun c!2747 () Bool)

(declare-fun lt!7575 () SeekEntryResult!53)

(assert (=> b!22418 (= c!2747 ((_ is MissingVacant!53) lt!7575))))

(declare-fun e!14548 () tuple2!918)

(declare-fun e!14556 () tuple2!918)

(assert (=> b!22418 (= e!14548 e!14556)))

(declare-fun bm!1623 () Bool)

(declare-fun c!2742 () Bool)

(declare-datatypes ((tuple2!930 0))(
  ( (tuple2!931 (_1!471 (_ BitVec 64)) (_2!471 V!1163)) )
))
(declare-datatypes ((List!561 0))(
  ( (Nil!558) (Cons!557 (h!1123 tuple2!930) (t!3221 List!561)) )
))
(declare-datatypes ((ListLongMap!561 0))(
  ( (ListLongMap!562 (toList!296 List!561)) )
))
(declare-fun call!1633 () ListLongMap!561)

(declare-fun call!1630 () ListLongMap!561)

(declare-fun call!1638 () ListLongMap!561)

(declare-fun +!43 (ListLongMap!561 tuple2!930) ListLongMap!561)

(assert (=> bm!1623 (= call!1638 (+!43 (ite c!2742 call!1633 call!1630) (ite c!2742 (ite c!2746 (tuple2!931 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1656 (v!1581 (underlying!106 thiss!938)))) (tuple2!931 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1656 (v!1581 (underlying!106 thiss!938))))) (tuple2!931 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1656 (v!1581 (underlying!106 thiss!938)))))))))

(declare-fun bm!1624 () Bool)

(declare-fun call!1649 () SeekEntryResult!53)

(assert (=> bm!1624 (= call!1632 call!1649)))

(declare-fun call!1629 () ListLongMap!561)

(declare-fun e!14557 () Bool)

(declare-fun call!1641 () ListLongMap!561)

(declare-fun b!22419 () Bool)

(assert (=> b!22419 (= e!14557 (= call!1641 (+!43 call!1629 (tuple2!931 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1656 (v!1581 (underlying!106 thiss!938)))))))))

(declare-fun bm!1625 () Bool)

(declare-fun call!1648 () ListLongMap!561)

(declare-fun lt!7583 () (_ BitVec 32))

(declare-fun lt!7585 () (_ BitVec 32))

(declare-fun getCurrentListMap!127 (array!1223 array!1221 (_ BitVec 32) (_ BitVec 32) V!1163 V!1163 (_ BitVec 32) Int) ListLongMap!561)

(assert (=> bm!1625 (= call!1648 (getCurrentListMap!127 (_keys!3154 (_2!462 lt!7451)) (ite c!2742 (_values!1719 (_2!462 lt!7451)) (array!1222 (store (arr!578 (_values!1719 (_2!462 lt!7451))) (index!2334 lt!7575) (ValueCellFull!302 (minValue!1656 (v!1581 (underlying!106 thiss!938))))) (size!674 (_values!1719 (_2!462 lt!7451))))) (mask!4711 (_2!462 lt!7451)) (ite c!2742 (ite c!2746 lt!7583 lt!7585) (extraKeys!1631 (_2!462 lt!7451))) (ite (and c!2742 c!2746) (minValue!1656 (v!1581 (underlying!106 thiss!938))) (zeroValue!1656 (_2!462 lt!7451))) (ite c!2742 (ite c!2746 (minValue!1656 (_2!462 lt!7451)) (minValue!1656 (v!1581 (underlying!106 thiss!938)))) (minValue!1656 (_2!462 lt!7451))) #b00000000000000000000000000000000 (defaultEntry!1731 (_2!462 lt!7451))))))

(declare-fun b!22420 () Bool)

(declare-fun lt!7584 () Unit!495)

(declare-fun lt!7588 () Unit!495)

(assert (=> b!22420 (= lt!7584 lt!7588)))

(declare-fun call!1645 () ListLongMap!561)

(declare-fun call!1644 () ListLongMap!561)

(assert (=> b!22420 (= call!1645 call!1644)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!8 (array!1223 array!1221 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1163 V!1163 V!1163 Int) Unit!495)

(assert (=> b!22420 (= lt!7588 (lemmaChangeLongMinValueKeyThenAddPairToListMap!8 (_keys!3154 (_2!462 lt!7451)) (_values!1719 (_2!462 lt!7451)) (mask!4711 (_2!462 lt!7451)) (extraKeys!1631 (_2!462 lt!7451)) lt!7585 (zeroValue!1656 (_2!462 lt!7451)) (minValue!1656 (_2!462 lt!7451)) (minValue!1656 (v!1581 (underlying!106 thiss!938))) (defaultEntry!1731 (_2!462 lt!7451))))))

(assert (=> b!22420 (= lt!7585 (bvor (extraKeys!1631 (_2!462 lt!7451)) #b00000000000000000000000000000010))))

(assert (=> b!22420 (= e!14547 (tuple2!919 true (LongMapFixedSize!191 (defaultEntry!1731 (_2!462 lt!7451)) (mask!4711 (_2!462 lt!7451)) (bvor (extraKeys!1631 (_2!462 lt!7451)) #b00000000000000000000000000000010) (zeroValue!1656 (_2!462 lt!7451)) (minValue!1656 (v!1581 (underlying!106 thiss!938))) (_size!138 (_2!462 lt!7451)) (_keys!3154 (_2!462 lt!7451)) (_values!1719 (_2!462 lt!7451)) (_vacant!138 (_2!462 lt!7451)))))))

(declare-fun bm!1626 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!8 (array!1223 array!1221 (_ BitVec 32) (_ BitVec 32) V!1163 V!1163 (_ BitVec 64) Int) Unit!495)

(assert (=> bm!1626 (= call!1636 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!8 (_keys!3154 (_2!462 lt!7451)) (_values!1719 (_2!462 lt!7451)) (mask!4711 (_2!462 lt!7451)) (extraKeys!1631 (_2!462 lt!7451)) (zeroValue!1656 (_2!462 lt!7451)) (minValue!1656 (_2!462 lt!7451)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1731 (_2!462 lt!7451))))))

(declare-fun b!22421 () Bool)

(declare-fun res!14149 () Bool)

(declare-fun e!14555 () Bool)

(assert (=> b!22421 (=> (not res!14149) (not e!14555))))

(assert (=> b!22421 (= res!14149 call!1627)))

(declare-fun e!14562 () Bool)

(assert (=> b!22421 (= e!14562 e!14555)))

(declare-fun bm!1627 () Bool)

(declare-fun call!1634 () Bool)

(declare-fun call!1628 () Bool)

(assert (=> bm!1627 (= call!1634 call!1628)))

(declare-fun bm!1628 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1223 (_ BitVec 32)) SeekEntryResult!53)

(assert (=> bm!1628 (= call!1649 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3154 (_2!462 lt!7451)) (mask!4711 (_2!462 lt!7451))))))

(declare-fun b!22422 () Bool)

(declare-fun lt!7576 () Unit!495)

(declare-fun lt!7591 () Unit!495)

(assert (=> b!22422 (= lt!7576 lt!7591)))

(assert (=> b!22422 (= call!1645 call!1644)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!8 (array!1223 array!1221 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1163 V!1163 V!1163 Int) Unit!495)

(assert (=> b!22422 (= lt!7591 (lemmaChangeZeroKeyThenAddPairToListMap!8 (_keys!3154 (_2!462 lt!7451)) (_values!1719 (_2!462 lt!7451)) (mask!4711 (_2!462 lt!7451)) (extraKeys!1631 (_2!462 lt!7451)) lt!7583 (zeroValue!1656 (_2!462 lt!7451)) (minValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (_2!462 lt!7451)) (defaultEntry!1731 (_2!462 lt!7451))))))

(assert (=> b!22422 (= lt!7583 (bvor (extraKeys!1631 (_2!462 lt!7451)) #b00000000000000000000000000000001))))

(assert (=> b!22422 (= e!14547 (tuple2!919 true (LongMapFixedSize!191 (defaultEntry!1731 (_2!462 lt!7451)) (mask!4711 (_2!462 lt!7451)) (bvor (extraKeys!1631 (_2!462 lt!7451)) #b00000000000000000000000000000001) (minValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (_2!462 lt!7451)) (_size!138 (_2!462 lt!7451)) (_keys!3154 (_2!462 lt!7451)) (_values!1719 (_2!462 lt!7451)) (_vacant!138 (_2!462 lt!7451)))))))

(declare-fun b!22423 () Bool)

(declare-fun lt!7592 () SeekEntryResult!53)

(assert (=> b!22423 (= e!14554 ((_ is Undefined!53) lt!7592))))

(declare-fun b!22424 () Bool)

(declare-fun e!14550 () Bool)

(declare-fun lt!7581 () SeekEntryResult!53)

(assert (=> b!22424 (= e!14550 (= (select (arr!579 (_keys!3154 (_2!462 lt!7451))) (index!2334 lt!7581)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22425 () Bool)

(declare-fun e!14552 () Bool)

(declare-fun e!14551 () Bool)

(assert (=> b!22425 (= e!14552 e!14551)))

(declare-fun res!14159 () Bool)

(assert (=> b!22425 (= res!14159 call!1634)))

(assert (=> b!22425 (=> (not res!14159) (not e!14551))))

(declare-fun b!22426 () Bool)

(declare-fun res!14153 () Bool)

(assert (=> b!22426 (= res!14153 (= (select (arr!579 (_keys!3154 (_2!462 lt!7451))) (index!2336 lt!7587)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22426 (=> (not res!14153) (not e!14551))))

(declare-fun b!22427 () Bool)

(declare-fun e!14558 () Bool)

(assert (=> b!22427 (= e!14558 e!14557)))

(declare-fun res!14161 () Bool)

(declare-fun contains!228 (ListLongMap!561 (_ BitVec 64)) Bool)

(assert (=> b!22427 (= res!14161 (contains!228 call!1641 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22427 (=> (not res!14161) (not e!14557))))

(declare-fun b!22428 () Bool)

(declare-fun c!2749 () Bool)

(assert (=> b!22428 (= c!2749 ((_ is MissingVacant!53) lt!7587))))

(assert (=> b!22428 (= e!14565 e!14552)))

(declare-fun bm!1629 () Bool)

(declare-fun c!2751 () Bool)

(declare-fun lt!7595 () array!1221)

(declare-fun call!1640 () ListLongMap!561)

(assert (=> bm!1629 (= call!1640 (getCurrentListMap!127 (_keys!3154 (_2!462 lt!7451)) (ite c!2751 (_values!1719 (_2!462 lt!7451)) lt!7595) (mask!4711 (_2!462 lt!7451)) (extraKeys!1631 (_2!462 lt!7451)) (zeroValue!1656 (_2!462 lt!7451)) (minValue!1656 (_2!462 lt!7451)) #b00000000000000000000000000000000 (defaultEntry!1731 (_2!462 lt!7451))))))

(declare-fun bm!1630 () Bool)

(declare-fun lt!7580 () SeekEntryResult!53)

(declare-fun c!2745 () Bool)

(declare-fun call!1631 () Bool)

(declare-fun c!2748 () Bool)

(declare-fun c!2752 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1630 (= call!1631 (inRange!0 (ite c!2751 (ite c!2748 (index!2334 lt!7581) (ite c!2741 (index!2333 lt!7587) (index!2336 lt!7587))) (ite c!2752 (index!2334 lt!7580) (ite c!2745 (index!2333 lt!7592) (index!2336 lt!7592)))) (mask!4711 (_2!462 lt!7451))))))

(declare-fun b!22429 () Bool)

(declare-fun e!14545 () Unit!495)

(declare-fun Unit!497 () Unit!495)

(assert (=> b!22429 (= e!14545 Unit!497)))

(declare-fun lt!7596 () Unit!495)

(assert (=> b!22429 (= lt!7596 call!1636)))

(declare-fun call!1639 () SeekEntryResult!53)

(assert (=> b!22429 (= lt!7592 call!1639)))

(assert (=> b!22429 (= c!2745 ((_ is MissingZero!53) lt!7592))))

(assert (=> b!22429 e!14562))

(declare-fun lt!7594 () Unit!495)

(assert (=> b!22429 (= lt!7594 lt!7596)))

(assert (=> b!22429 false))

(declare-fun bm!1631 () Bool)

(declare-fun call!1646 () Unit!495)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!8 (array!1223 array!1221 (_ BitVec 32) (_ BitVec 32) V!1163 V!1163 (_ BitVec 64) Int) Unit!495)

(assert (=> bm!1631 (= call!1646 (lemmaInListMapThenSeekEntryOrOpenFindsIt!8 (_keys!3154 (_2!462 lt!7451)) (_values!1719 (_2!462 lt!7451)) (mask!4711 (_2!462 lt!7451)) (extraKeys!1631 (_2!462 lt!7451)) (zeroValue!1656 (_2!462 lt!7451)) (minValue!1656 (_2!462 lt!7451)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1731 (_2!462 lt!7451))))))

(declare-fun b!22430 () Bool)

(declare-fun Unit!498 () Unit!495)

(assert (=> b!22430 (= e!14546 Unit!498)))

(declare-fun lt!7579 () Unit!495)

(assert (=> b!22430 (= lt!7579 call!1646)))

(assert (=> b!22430 (= lt!7581 call!1632)))

(declare-fun res!14157 () Bool)

(assert (=> b!22430 (= res!14157 ((_ is Found!53) lt!7581))))

(assert (=> b!22430 (=> (not res!14157) (not e!14550))))

(assert (=> b!22430 e!14550))

(declare-fun lt!7589 () Unit!495)

(assert (=> b!22430 (= lt!7589 lt!7579)))

(assert (=> b!22430 false))

(declare-fun bm!1632 () Bool)

(assert (=> bm!1632 (= call!1633 call!1630)))

(declare-fun bm!1633 () Bool)

(assert (=> bm!1633 (= call!1647 call!1631)))

(declare-fun b!22431 () Bool)

(assert (=> b!22431 (= e!14560 (= (select (arr!579 (_keys!3154 (_2!462 lt!7451))) (index!2334 lt!7580)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22432 () Bool)

(declare-fun e!14553 () Bool)

(declare-fun call!1635 () Bool)

(assert (=> b!22432 (= e!14553 (not call!1635))))

(declare-fun b!22433 () Bool)

(assert (=> b!22433 (= e!14558 (= call!1641 call!1629))))

(declare-fun b!22434 () Bool)

(declare-fun call!1626 () Bool)

(assert (=> b!22434 (= e!14555 (not call!1626))))

(declare-fun b!22435 () Bool)

(declare-fun res!14150 () Bool)

(assert (=> b!22435 (=> (not res!14150) (not e!14553))))

(assert (=> b!22435 (= res!14150 call!1634)))

(assert (=> b!22435 (= e!14565 e!14553)))

(declare-fun bm!1634 () Bool)

(declare-fun map!400 (LongMapFixedSize!190) ListLongMap!561)

(assert (=> bm!1634 (= call!1629 (map!400 (_2!462 lt!7451)))))

(declare-fun b!22436 () Bool)

(assert (=> b!22436 (= e!14564 (not call!1626))))

(declare-fun b!22437 () Bool)

(declare-fun lt!7578 () tuple2!918)

(declare-fun call!1643 () tuple2!918)

(assert (=> b!22437 (= lt!7578 call!1643)))

(declare-fun e!14563 () tuple2!918)

(assert (=> b!22437 (= e!14563 (tuple2!919 (_1!462 lt!7578) (_2!462 lt!7578)))))

(declare-fun bm!1635 () Bool)

(declare-fun updateHelperNewKey!8 (LongMapFixedSize!190 (_ BitVec 64) V!1163 (_ BitVec 32)) tuple2!918)

(assert (=> bm!1635 (= call!1643 (updateHelperNewKey!8 (_2!462 lt!7451) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1656 (v!1581 (underlying!106 thiss!938))) (ite c!2747 (index!2336 lt!7575) (index!2333 lt!7575))))))

(declare-fun bm!1636 () Bool)

(declare-fun c!2743 () Bool)

(assert (=> bm!1636 (= c!2743 c!2751)))

(declare-fun call!1637 () Bool)

(declare-fun e!14561 () ListLongMap!561)

(assert (=> bm!1636 (= call!1637 (contains!228 e!14561 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22438 () Bool)

(declare-fun c!2750 () Bool)

(assert (=> b!22438 (= c!2750 ((_ is MissingVacant!53) lt!7592))))

(assert (=> b!22438 (= e!14562 e!14554)))

(declare-fun b!22439 () Bool)

(assert (=> b!22439 (= e!14561 call!1630)))

(declare-fun bm!1637 () Bool)

(declare-fun call!1642 () Bool)

(declare-fun arrayContainsKey!0 (array!1223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!1637 (= call!1642 (arrayContainsKey!0 (_keys!3154 (_2!462 lt!7451)) #b1000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun bm!1638 () Bool)

(assert (=> bm!1638 (= call!1626 call!1642)))

(declare-fun b!22440 () Bool)

(assert (=> b!22440 (= e!14551 (not call!1635))))

(declare-fun b!22441 () Bool)

(declare-fun lt!7573 () tuple2!918)

(assert (=> b!22441 (= e!14556 (tuple2!919 (_1!462 lt!7573) (_2!462 lt!7573)))))

(assert (=> b!22441 (= lt!7573 call!1643)))

(declare-fun b!22442 () Bool)

(assert (=> b!22442 (= e!14556 e!14563)))

(declare-fun c!2744 () Bool)

(assert (=> b!22442 (= c!2744 ((_ is MissingZero!53) lt!7575))))

(declare-fun b!22443 () Bool)

(declare-fun e!14559 () Bool)

(assert (=> b!22443 (= e!14559 e!14558)))

(declare-fun c!2753 () Bool)

(declare-fun lt!7582 () tuple2!918)

(assert (=> b!22443 (= c!2753 (_1!462 lt!7582))))

(declare-fun b!22444 () Bool)

(declare-fun res!14160 () Bool)

(assert (=> b!22444 (= res!14160 call!1628)))

(assert (=> b!22444 (=> (not res!14160) (not e!14550))))

(declare-fun bm!1639 () Bool)

(assert (=> bm!1639 (= call!1644 call!1648)))

(declare-fun bm!1640 () Bool)

(assert (=> bm!1640 (= call!1645 call!1638)))

(declare-fun b!22445 () Bool)

(assert (=> b!22445 (= e!14561 call!1640)))

(declare-fun bm!1641 () Bool)

(assert (=> bm!1641 (= call!1628 call!1631)))

(declare-fun bm!1642 () Bool)

(assert (=> bm!1642 (= call!1641 (map!400 (_2!462 lt!7582)))))

(declare-fun b!22446 () Bool)

(declare-fun res!14152 () Bool)

(assert (=> b!22446 (=> (not res!14152) (not e!14555))))

(assert (=> b!22446 (= res!14152 (= (select (arr!579 (_keys!3154 (_2!462 lt!7451))) (index!2333 lt!7592)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1643 () Bool)

(assert (=> bm!1643 (= call!1639 call!1649)))

(declare-fun bm!1644 () Bool)

(assert (=> bm!1644 (= call!1630 (getCurrentListMap!127 (_keys!3154 (_2!462 lt!7451)) (_values!1719 (_2!462 lt!7451)) (mask!4711 (_2!462 lt!7451)) (extraKeys!1631 (_2!462 lt!7451)) (zeroValue!1656 (_2!462 lt!7451)) (minValue!1656 (_2!462 lt!7451)) #b00000000000000000000000000000000 (defaultEntry!1731 (_2!462 lt!7451))))))

(declare-fun b!22447 () Bool)

(declare-fun lt!7597 () Unit!495)

(assert (=> b!22447 (= lt!7597 e!14546)))

(assert (=> b!22447 (= c!2748 call!1637)))

(assert (=> b!22447 (= e!14548 (tuple2!919 false (_2!462 lt!7451)))))

(declare-fun b!22448 () Bool)

(assert (=> b!22448 (= e!14549 e!14548)))

(assert (=> b!22448 (= lt!7575 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3154 (_2!462 lt!7451)) (mask!4711 (_2!462 lt!7451))))))

(assert (=> b!22448 (= c!2751 ((_ is Undefined!53) lt!7575))))

(declare-fun bm!1645 () Bool)

(assert (=> bm!1645 (= call!1627 call!1647)))

(declare-fun b!22449 () Bool)

(declare-fun lt!7572 () Unit!495)

(declare-fun lt!7574 () Unit!495)

(assert (=> b!22449 (= lt!7572 lt!7574)))

(assert (=> b!22449 (contains!228 call!1640 (select (arr!579 (_keys!3154 (_2!462 lt!7451))) (index!2334 lt!7575)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!8 (array!1223 array!1221 (_ BitVec 32) (_ BitVec 32) V!1163 V!1163 (_ BitVec 32) Int) Unit!495)

(assert (=> b!22449 (= lt!7574 (lemmaValidKeyInArrayIsInListMap!8 (_keys!3154 (_2!462 lt!7451)) lt!7595 (mask!4711 (_2!462 lt!7451)) (extraKeys!1631 (_2!462 lt!7451)) (zeroValue!1656 (_2!462 lt!7451)) (minValue!1656 (_2!462 lt!7451)) (index!2334 lt!7575) (defaultEntry!1731 (_2!462 lt!7451))))))

(assert (=> b!22449 (= lt!7595 (array!1222 (store (arr!578 (_values!1719 (_2!462 lt!7451))) (index!2334 lt!7575) (ValueCellFull!302 (minValue!1656 (v!1581 (underlying!106 thiss!938))))) (size!674 (_values!1719 (_2!462 lt!7451)))))))

(declare-fun lt!7598 () Unit!495)

(declare-fun lt!7586 () Unit!495)

(assert (=> b!22449 (= lt!7598 lt!7586)))

(assert (=> b!22449 (= call!1638 call!1648)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!8 (array!1223 array!1221 (_ BitVec 32) (_ BitVec 32) V!1163 V!1163 (_ BitVec 32) (_ BitVec 64) V!1163 Int) Unit!495)

(assert (=> b!22449 (= lt!7586 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!8 (_keys!3154 (_2!462 lt!7451)) (_values!1719 (_2!462 lt!7451)) (mask!4711 (_2!462 lt!7451)) (extraKeys!1631 (_2!462 lt!7451)) (zeroValue!1656 (_2!462 lt!7451)) (minValue!1656 (_2!462 lt!7451)) (index!2334 lt!7575) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1656 (v!1581 (underlying!106 thiss!938))) (defaultEntry!1731 (_2!462 lt!7451))))))

(declare-fun lt!7590 () Unit!495)

(assert (=> b!22449 (= lt!7590 e!14545)))

(assert (=> b!22449 (= c!2752 call!1637)))

(assert (=> b!22449 (= e!14563 (tuple2!919 true (LongMapFixedSize!191 (defaultEntry!1731 (_2!462 lt!7451)) (mask!4711 (_2!462 lt!7451)) (extraKeys!1631 (_2!462 lt!7451)) (zeroValue!1656 (_2!462 lt!7451)) (minValue!1656 (_2!462 lt!7451)) (_size!138 (_2!462 lt!7451)) (_keys!3154 (_2!462 lt!7451)) (array!1222 (store (arr!578 (_values!1719 (_2!462 lt!7451))) (index!2334 lt!7575) (ValueCellFull!302 (minValue!1656 (v!1581 (underlying!106 thiss!938))))) (size!674 (_values!1719 (_2!462 lt!7451)))) (_vacant!138 (_2!462 lt!7451)))))))

(declare-fun b!22450 () Bool)

(declare-fun res!14154 () Bool)

(assert (=> b!22450 (=> (not res!14154) (not e!14553))))

(assert (=> b!22450 (= res!14154 (= (select (arr!579 (_keys!3154 (_2!462 lt!7451))) (index!2333 lt!7587)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22451 () Bool)

(declare-fun lt!7593 () Unit!495)

(assert (=> b!22451 (= e!14545 lt!7593)))

(assert (=> b!22451 (= lt!7593 call!1646)))

(assert (=> b!22451 (= lt!7580 call!1639)))

(declare-fun res!14156 () Bool)

(assert (=> b!22451 (= res!14156 ((_ is Found!53) lt!7580))))

(assert (=> b!22451 (=> (not res!14156) (not e!14560))))

(assert (=> b!22451 e!14560))

(declare-fun d!3909 () Bool)

(assert (=> d!3909 e!14559))

(declare-fun res!14158 () Bool)

(assert (=> d!3909 (=> (not res!14158) (not e!14559))))

(assert (=> d!3909 (= res!14158 (valid!109 (_2!462 lt!7582)))))

(assert (=> d!3909 (= lt!7582 e!14549)))

(assert (=> d!3909 (= c!2742 (= #b1000000000000000000000000000000000000000000000000000000000000000 (bvneg #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3909 (valid!109 (_2!462 lt!7451))))

(assert (=> d!3909 (= (update!31 (_2!462 lt!7451) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1656 (v!1581 (underlying!106 thiss!938)))) lt!7582)))

(declare-fun b!22452 () Bool)

(assert (=> b!22452 (= e!14552 ((_ is Undefined!53) lt!7587))))

(declare-fun b!22453 () Bool)

(declare-fun res!14155 () Bool)

(assert (=> b!22453 (= res!14155 (= (select (arr!579 (_keys!3154 (_2!462 lt!7451))) (index!2336 lt!7592)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22453 (=> (not res!14155) (not e!14564))))

(declare-fun bm!1646 () Bool)

(assert (=> bm!1646 (= call!1635 call!1642)))

(assert (= (and d!3909 c!2742) b!22417))

(assert (= (and d!3909 (not c!2742)) b!22448))

(assert (= (and b!22417 c!2746) b!22422))

(assert (= (and b!22417 (not c!2746)) b!22420))

(assert (= (or b!22422 b!22420) bm!1639))

(assert (= (or b!22422 b!22420) bm!1632))

(assert (= (or b!22422 b!22420) bm!1640))

(assert (= (and b!22448 c!2751) b!22447))

(assert (= (and b!22448 (not c!2751)) b!22418))

(assert (= (and b!22447 c!2748) b!22430))

(assert (= (and b!22447 (not c!2748)) b!22414))

(assert (= (and b!22430 res!14157) b!22444))

(assert (= (and b!22444 res!14160) b!22424))

(assert (= (and b!22414 c!2741) b!22435))

(assert (= (and b!22414 (not c!2741)) b!22428))

(assert (= (and b!22435 res!14150) b!22450))

(assert (= (and b!22450 res!14154) b!22432))

(assert (= (and b!22428 c!2749) b!22425))

(assert (= (and b!22428 (not c!2749)) b!22452))

(assert (= (and b!22425 res!14159) b!22426))

(assert (= (and b!22426 res!14153) b!22440))

(assert (= (or b!22435 b!22425) bm!1627))

(assert (= (or b!22432 b!22440) bm!1646))

(assert (= (or b!22444 bm!1627) bm!1641))

(assert (= (or b!22430 b!22414) bm!1624))

(assert (= (and b!22418 c!2747) b!22441))

(assert (= (and b!22418 (not c!2747)) b!22442))

(assert (= (and b!22442 c!2744) b!22437))

(assert (= (and b!22442 (not c!2744)) b!22449))

(assert (= (and b!22449 c!2752) b!22451))

(assert (= (and b!22449 (not c!2752)) b!22429))

(assert (= (and b!22451 res!14156) b!22416))

(assert (= (and b!22416 res!14151) b!22431))

(assert (= (and b!22429 c!2745) b!22421))

(assert (= (and b!22429 (not c!2745)) b!22438))

(assert (= (and b!22421 res!14149) b!22446))

(assert (= (and b!22446 res!14152) b!22434))

(assert (= (and b!22438 c!2750) b!22415))

(assert (= (and b!22438 (not c!2750)) b!22423))

(assert (= (and b!22415 res!14162) b!22453))

(assert (= (and b!22453 res!14155) b!22436))

(assert (= (or b!22421 b!22415) bm!1645))

(assert (= (or b!22434 b!22436) bm!1638))

(assert (= (or b!22416 bm!1645) bm!1633))

(assert (= (or b!22451 b!22429) bm!1643))

(assert (= (or b!22441 b!22437) bm!1635))

(assert (= (or b!22430 b!22451) bm!1631))

(assert (= (or b!22414 b!22429) bm!1626))

(assert (= (or bm!1646 bm!1638) bm!1637))

(assert (= (or bm!1641 bm!1633) bm!1630))

(assert (= (or b!22447 b!22449) bm!1629))

(assert (= (or bm!1624 bm!1643) bm!1628))

(assert (= (or b!22447 b!22449) bm!1636))

(assert (= (and bm!1636 c!2743) b!22445))

(assert (= (and bm!1636 (not c!2743)) b!22439))

(assert (= (or bm!1639 b!22449) bm!1625))

(assert (= (or bm!1632 b!22439 b!22449) bm!1644))

(assert (= (or bm!1640 b!22449) bm!1623))

(assert (= (and d!3909 res!14158) b!22443))

(assert (= (and b!22443 c!2753) b!22427))

(assert (= (and b!22443 (not c!2753)) b!22433))

(assert (= (and b!22427 res!14161) b!22419))

(assert (= (or b!22419 b!22433) bm!1634))

(assert (= (or b!22427 b!22419 b!22433) bm!1642))

(declare-fun m!16180 () Bool)

(assert (=> b!22427 m!16180))

(declare-fun m!16182 () Bool)

(assert (=> b!22424 m!16182))

(declare-fun m!16184 () Bool)

(assert (=> b!22453 m!16184))

(declare-fun m!16186 () Bool)

(assert (=> b!22446 m!16186))

(declare-fun m!16188 () Bool)

(assert (=> bm!1629 m!16188))

(declare-fun m!16190 () Bool)

(assert (=> d!3909 m!16190))

(declare-fun m!16192 () Bool)

(assert (=> d!3909 m!16192))

(declare-fun m!16194 () Bool)

(assert (=> bm!1623 m!16194))

(declare-fun m!16196 () Bool)

(assert (=> bm!1625 m!16196))

(declare-fun m!16198 () Bool)

(assert (=> bm!1625 m!16198))

(assert (=> b!22449 m!16196))

(declare-fun m!16200 () Bool)

(assert (=> b!22449 m!16200))

(declare-fun m!16202 () Bool)

(assert (=> b!22449 m!16202))

(declare-fun m!16204 () Bool)

(assert (=> b!22449 m!16204))

(assert (=> b!22449 m!16202))

(declare-fun m!16206 () Bool)

(assert (=> b!22449 m!16206))

(declare-fun m!16208 () Bool)

(assert (=> b!22450 m!16208))

(declare-fun m!16210 () Bool)

(assert (=> b!22426 m!16210))

(declare-fun m!16212 () Bool)

(assert (=> b!22448 m!16212))

(declare-fun m!16214 () Bool)

(assert (=> bm!1637 m!16214))

(declare-fun m!16216 () Bool)

(assert (=> b!22419 m!16216))

(declare-fun m!16218 () Bool)

(assert (=> bm!1626 m!16218))

(declare-fun m!16220 () Bool)

(assert (=> bm!1630 m!16220))

(declare-fun m!16222 () Bool)

(assert (=> b!22420 m!16222))

(declare-fun m!16224 () Bool)

(assert (=> b!22422 m!16224))

(declare-fun m!16226 () Bool)

(assert (=> b!22431 m!16226))

(declare-fun m!16228 () Bool)

(assert (=> bm!1634 m!16228))

(declare-fun m!16230 () Bool)

(assert (=> bm!1635 m!16230))

(declare-fun m!16232 () Bool)

(assert (=> bm!1636 m!16232))

(declare-fun m!16234 () Bool)

(assert (=> bm!1642 m!16234))

(declare-fun m!16236 () Bool)

(assert (=> bm!1631 m!16236))

(assert (=> bm!1628 m!16212))

(declare-fun m!16238 () Bool)

(assert (=> bm!1644 m!16238))

(assert (=> b!22236 d!3909))

(declare-fun b!22466 () Bool)

(declare-fun res!14167 () Bool)

(declare-fun e!14572 () Bool)

(assert (=> b!22466 (=> (not res!14167) (not e!14572))))

(declare-fun lt!7651 () LongMapFixedSize!190)

(assert (=> b!22466 (= res!14167 (= (mask!4711 lt!7651) (computeNewMask!25 thiss!938 (mask!4711 (v!1581 (underlying!106 thiss!938))) (_vacant!138 (v!1581 (underlying!106 thiss!938))) (_size!138 (v!1581 (underlying!106 thiss!938))))))))

(declare-fun b!22467 () Bool)

(declare-fun e!14573 () Bool)

(declare-fun lt!7663 () tuple2!930)

(declare-fun lt!7660 () (_ BitVec 32))

(assert (=> b!22467 (= e!14573 (ite (= (_1!471 lt!7663) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!7660 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!7660 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!22468 () Bool)

(declare-fun lt!7647 () array!1223)

(assert (=> b!22468 (= e!14573 (arrayContainsKey!0 lt!7647 (_1!471 lt!7663) #b00000000000000000000000000000000))))

(declare-fun b!22469 () Bool)

(declare-fun e!14574 () Unit!495)

(declare-fun Unit!499 () Unit!495)

(assert (=> b!22469 (= e!14574 Unit!499)))

(declare-fun lt!7649 () LongMapFixedSize!190)

(declare-fun head!828 (List!561) tuple2!930)

(assert (=> b!22469 (= lt!7663 (head!828 (toList!296 (map!400 lt!7649))))))

(assert (=> b!22469 (= lt!7647 (array!1224 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!25 thiss!938 (mask!4711 (v!1581 (underlying!106 thiss!938))) (_vacant!138 (v!1581 (underlying!106 thiss!938))) (_size!138 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!22469 (= lt!7660 #b00000000000000000000000000000000)))

(declare-fun lt!7655 () Unit!495)

(declare-fun lemmaKeyInListMapIsInArray!95 (array!1223 array!1221 (_ BitVec 32) (_ BitVec 32) V!1163 V!1163 (_ BitVec 64) Int) Unit!495)

(declare-fun dynLambda!141 (Int (_ BitVec 64)) V!1163)

(assert (=> b!22469 (= lt!7655 (lemmaKeyInListMapIsInArray!95 lt!7647 (array!1222 ((as const (Array (_ BitVec 32) ValueCell!302)) EmptyCell!302) (bvadd (computeNewMask!25 thiss!938 (mask!4711 (v!1581 (underlying!106 thiss!938))) (_vacant!138 (v!1581 (underlying!106 thiss!938))) (_size!138 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!25 thiss!938 (mask!4711 (v!1581 (underlying!106 thiss!938))) (_vacant!138 (v!1581 (underlying!106 thiss!938))) (_size!138 (v!1581 (underlying!106 thiss!938)))) lt!7660 (dynLambda!141 (defaultEntry!1731 (v!1581 (underlying!106 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!141 (defaultEntry!1731 (v!1581 (underlying!106 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!471 lt!7663) (defaultEntry!1731 (v!1581 (underlying!106 thiss!938)))))))

(declare-fun c!2758 () Bool)

(assert (=> b!22469 (= c!2758 (and (not (= (_1!471 lt!7663) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!471 lt!7663) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!22469 e!14573))

(declare-fun lt!7656 () Unit!495)

(assert (=> b!22469 (= lt!7656 lt!7655)))

(declare-fun lt!7665 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1223 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!22469 (= lt!7665 (arrayScanForKey!0 (array!1224 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!25 thiss!938 (mask!4711 (v!1581 (underlying!106 thiss!938))) (_vacant!138 (v!1581 (underlying!106 thiss!938))) (_size!138 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)) (_1!471 lt!7663) #b00000000000000000000000000000000))))

(assert (=> b!22469 false))

(declare-fun d!3911 () Bool)

(assert (=> d!3911 e!14572))

(declare-fun res!14168 () Bool)

(assert (=> d!3911 (=> (not res!14168) (not e!14572))))

(assert (=> d!3911 (= res!14168 (valid!109 lt!7651))))

(assert (=> d!3911 (= lt!7651 lt!7649)))

(declare-fun lt!7653 () Unit!495)

(assert (=> d!3911 (= lt!7653 e!14574)))

(declare-fun c!2759 () Bool)

(assert (=> d!3911 (= c!2759 (not (= (map!400 lt!7649) (ListLongMap!562 Nil!558))))))

(declare-fun lt!7662 () Unit!495)

(declare-fun lt!7661 () Unit!495)

(assert (=> d!3911 (= lt!7662 lt!7661)))

(declare-fun lt!7664 () array!1223)

(declare-fun lt!7667 () (_ BitVec 32))

(declare-datatypes ((List!562 0))(
  ( (Nil!559) (Cons!558 (h!1124 (_ BitVec 64)) (t!3222 List!562)) )
))
(declare-fun lt!7650 () List!562)

(declare-fun arrayNoDuplicates!0 (array!1223 (_ BitVec 32) List!562) Bool)

(assert (=> d!3911 (arrayNoDuplicates!0 lt!7664 lt!7667 lt!7650)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1223 (_ BitVec 32) (_ BitVec 32) List!562) Unit!495)

(assert (=> d!3911 (= lt!7661 (lemmaArrayNoDuplicatesInAll0Array!0 lt!7664 lt!7667 (bvadd (computeNewMask!25 thiss!938 (mask!4711 (v!1581 (underlying!106 thiss!938))) (_vacant!138 (v!1581 (underlying!106 thiss!938))) (_size!138 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001) lt!7650))))

(assert (=> d!3911 (= lt!7650 Nil!559)))

(assert (=> d!3911 (= lt!7667 #b00000000000000000000000000000000)))

(assert (=> d!3911 (= lt!7664 (array!1224 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!25 thiss!938 (mask!4711 (v!1581 (underlying!106 thiss!938))) (_vacant!138 (v!1581 (underlying!106 thiss!938))) (_size!138 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!7657 () Unit!495)

(declare-fun lt!7666 () Unit!495)

(assert (=> d!3911 (= lt!7657 lt!7666)))

(declare-fun lt!7645 () (_ BitVec 32))

(declare-fun lt!7652 () array!1223)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1223 (_ BitVec 32)) Bool)

(assert (=> d!3911 (arrayForallSeekEntryOrOpenFound!0 lt!7645 lt!7652 (computeNewMask!25 thiss!938 (mask!4711 (v!1581 (underlying!106 thiss!938))) (_vacant!138 (v!1581 (underlying!106 thiss!938))) (_size!138 (v!1581 (underlying!106 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1223 (_ BitVec 32) (_ BitVec 32)) Unit!495)

(assert (=> d!3911 (= lt!7666 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!7652 (computeNewMask!25 thiss!938 (mask!4711 (v!1581 (underlying!106 thiss!938))) (_vacant!138 (v!1581 (underlying!106 thiss!938))) (_size!138 (v!1581 (underlying!106 thiss!938)))) lt!7645))))

(assert (=> d!3911 (= lt!7645 #b00000000000000000000000000000000)))

(assert (=> d!3911 (= lt!7652 (array!1224 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!25 thiss!938 (mask!4711 (v!1581 (underlying!106 thiss!938))) (_vacant!138 (v!1581 (underlying!106 thiss!938))) (_size!138 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!7659 () Unit!495)

(declare-fun lt!7648 () Unit!495)

(assert (=> d!3911 (= lt!7659 lt!7648)))

(declare-fun lt!7646 () array!1223)

(declare-fun lt!7658 () (_ BitVec 32))

(declare-fun lt!7654 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1223 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3911 (= (arrayCountValidKeys!0 lt!7646 lt!7658 lt!7654) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1223 (_ BitVec 32) (_ BitVec 32)) Unit!495)

(assert (=> d!3911 (= lt!7648 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!7646 lt!7658 lt!7654))))

(assert (=> d!3911 (= lt!7654 (bvadd (computeNewMask!25 thiss!938 (mask!4711 (v!1581 (underlying!106 thiss!938))) (_vacant!138 (v!1581 (underlying!106 thiss!938))) (_size!138 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3911 (= lt!7658 #b00000000000000000000000000000000)))

(assert (=> d!3911 (= lt!7646 (array!1224 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!25 thiss!938 (mask!4711 (v!1581 (underlying!106 thiss!938))) (_vacant!138 (v!1581 (underlying!106 thiss!938))) (_size!138 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!3911 (= lt!7649 (LongMapFixedSize!191 (defaultEntry!1731 (v!1581 (underlying!106 thiss!938))) (computeNewMask!25 thiss!938 (mask!4711 (v!1581 (underlying!106 thiss!938))) (_vacant!138 (v!1581 (underlying!106 thiss!938))) (_size!138 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!141 (defaultEntry!1731 (v!1581 (underlying!106 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!141 (defaultEntry!1731 (v!1581 (underlying!106 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1224 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!25 thiss!938 (mask!4711 (v!1581 (underlying!106 thiss!938))) (_vacant!138 (v!1581 (underlying!106 thiss!938))) (_size!138 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)) (array!1222 ((as const (Array (_ BitVec 32) ValueCell!302)) EmptyCell!302) (bvadd (computeNewMask!25 thiss!938 (mask!4711 (v!1581 (underlying!106 thiss!938))) (_vacant!138 (v!1581 (underlying!106 thiss!938))) (_size!138 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!3911 (validMask!0 (computeNewMask!25 thiss!938 (mask!4711 (v!1581 (underlying!106 thiss!938))) (_vacant!138 (v!1581 (underlying!106 thiss!938))) (_size!138 (v!1581 (underlying!106 thiss!938)))))))

(assert (=> d!3911 (= (getNewLongMapFixedSize!28 (computeNewMask!25 thiss!938 (mask!4711 (v!1581 (underlying!106 thiss!938))) (_vacant!138 (v!1581 (underlying!106 thiss!938))) (_size!138 (v!1581 (underlying!106 thiss!938)))) (defaultEntry!1731 (v!1581 (underlying!106 thiss!938)))) lt!7651)))

(declare-fun b!22470 () Bool)

(assert (=> b!22470 (= e!14572 (= (map!400 lt!7651) (ListLongMap!562 Nil!558)))))

(declare-fun b!22471 () Bool)

(declare-fun Unit!500 () Unit!495)

(assert (=> b!22471 (= e!14574 Unit!500)))

(assert (= (and d!3911 c!2759) b!22469))

(assert (= (and d!3911 (not c!2759)) b!22471))

(assert (= (and b!22469 c!2758) b!22468))

(assert (= (and b!22469 (not c!2758)) b!22467))

(assert (= (and d!3911 res!14168) b!22466))

(assert (= (and b!22466 res!14167) b!22470))

(declare-fun b_lambda!1543 () Bool)

(assert (=> (not b_lambda!1543) (not b!22469)))

(declare-fun t!3220 () Bool)

(declare-fun tb!647 () Bool)

(assert (=> (and b!22229 (= (defaultEntry!1731 (v!1581 (underlying!106 thiss!938))) (defaultEntry!1731 (v!1581 (underlying!106 thiss!938)))) t!3220) tb!647))

(declare-fun result!1075 () Bool)

(assert (=> tb!647 (= result!1075 tp_is_empty!1003)))

(assert (=> b!22469 t!3220))

(declare-fun b_and!1451 () Bool)

(assert (= b_and!1445 (and (=> t!3220 result!1075) b_and!1451)))

(declare-fun b_lambda!1545 () Bool)

(assert (=> (not b_lambda!1545) (not d!3911)))

(assert (=> d!3911 t!3220))

(declare-fun b_and!1453 () Bool)

(assert (= b_and!1451 (and (=> t!3220 result!1075) b_and!1453)))

(declare-fun m!16240 () Bool)

(assert (=> b!22468 m!16240))

(declare-fun m!16242 () Bool)

(assert (=> b!22469 m!16242))

(declare-fun m!16244 () Bool)

(assert (=> b!22469 m!16244))

(declare-fun m!16246 () Bool)

(assert (=> b!22469 m!16246))

(assert (=> b!22469 m!16134))

(declare-fun m!16248 () Bool)

(assert (=> b!22469 m!16248))

(assert (=> b!22469 m!16248))

(declare-fun m!16250 () Bool)

(assert (=> b!22469 m!16250))

(assert (=> b!22469 m!16248))

(declare-fun m!16252 () Bool)

(assert (=> d!3911 m!16252))

(declare-fun m!16254 () Bool)

(assert (=> d!3911 m!16254))

(assert (=> d!3911 m!16134))

(declare-fun m!16256 () Bool)

(assert (=> d!3911 m!16256))

(assert (=> d!3911 m!16248))

(declare-fun m!16258 () Bool)

(assert (=> d!3911 m!16258))

(declare-fun m!16260 () Bool)

(assert (=> d!3911 m!16260))

(declare-fun m!16262 () Bool)

(assert (=> d!3911 m!16262))

(assert (=> d!3911 m!16246))

(assert (=> d!3911 m!16134))

(declare-fun m!16264 () Bool)

(assert (=> d!3911 m!16264))

(assert (=> d!3911 m!16134))

(declare-fun m!16266 () Bool)

(assert (=> d!3911 m!16266))

(declare-fun m!16268 () Bool)

(assert (=> b!22470 m!16268))

(assert (=> b!22232 d!3911))

(declare-fun d!3913 () Bool)

(declare-fun e!14579 () Bool)

(assert (=> d!3913 e!14579))

(declare-fun res!14171 () Bool)

(assert (=> d!3913 (=> (not res!14171) (not e!14579))))

(declare-fun lt!7672 () (_ BitVec 32))

(assert (=> d!3913 (= res!14171 (validMask!0 lt!7672))))

(declare-datatypes ((tuple2!932 0))(
  ( (tuple2!933 (_1!472 Unit!495) (_2!472 (_ BitVec 32))) )
))
(declare-fun e!14580 () tuple2!932)

(assert (=> d!3913 (= lt!7672 (_2!472 e!14580))))

(declare-fun c!2762 () Bool)

(declare-fun lt!7673 () tuple2!932)

(assert (=> d!3913 (= c!2762 (and (bvsgt (_2!472 lt!7673) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!138 (v!1581 (underlying!106 thiss!938)))) (_2!472 lt!7673)) (bvsge (bvadd (bvand (bvashr (_2!472 lt!7673) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!138 (v!1581 (underlying!106 thiss!938))))))))

(declare-fun Unit!501 () Unit!495)

(declare-fun Unit!502 () Unit!495)

(assert (=> d!3913 (= lt!7673 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!138 (v!1581 (underlying!106 thiss!938))) (_vacant!138 (v!1581 (underlying!106 thiss!938))))) (mask!4711 (v!1581 (underlying!106 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!138 (v!1581 (underlying!106 thiss!938)))) (mask!4711 (v!1581 (underlying!106 thiss!938))))) (tuple2!933 Unit!501 (bvand (bvadd (bvshl (mask!4711 (v!1581 (underlying!106 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!933 Unit!502 (mask!4711 (v!1581 (underlying!106 thiss!938))))))))

(assert (=> d!3913 (validMask!0 (mask!4711 (v!1581 (underlying!106 thiss!938))))))

(assert (=> d!3913 (= (computeNewMask!25 thiss!938 (mask!4711 (v!1581 (underlying!106 thiss!938))) (_vacant!138 (v!1581 (underlying!106 thiss!938))) (_size!138 (v!1581 (underlying!106 thiss!938)))) lt!7672)))

(declare-fun b!22480 () Bool)

(declare-fun computeNewMaskWhile!12 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!932)

(assert (=> b!22480 (= e!14580 (computeNewMaskWhile!12 (_size!138 (v!1581 (underlying!106 thiss!938))) (_vacant!138 (v!1581 (underlying!106 thiss!938))) (mask!4711 (v!1581 (underlying!106 thiss!938))) (_2!472 lt!7673)))))

(declare-fun b!22481 () Bool)

(declare-fun Unit!503 () Unit!495)

(assert (=> b!22481 (= e!14580 (tuple2!933 Unit!503 (_2!472 lt!7673)))))

(declare-fun b!22482 () Bool)

(assert (=> b!22482 (= e!14579 (bvsle (_size!138 (v!1581 (underlying!106 thiss!938))) (bvadd lt!7672 #b00000000000000000000000000000001)))))

(assert (= (and d!3913 c!2762) b!22480))

(assert (= (and d!3913 (not c!2762)) b!22481))

(assert (= (and d!3913 res!14171) b!22482))

(declare-fun m!16270 () Bool)

(assert (=> d!3913 m!16270))

(declare-fun m!16272 () Bool)

(assert (=> d!3913 m!16272))

(declare-fun m!16274 () Bool)

(assert (=> b!22480 m!16274))

(assert (=> b!22232 d!3913))

(declare-fun b!22511 () Bool)

(declare-fun e!14603 () tuple2!918)

(declare-fun e!14601 () tuple2!918)

(assert (=> b!22511 (= e!14603 e!14601)))

(declare-fun lt!7744 () V!1163)

(declare-fun lt!7765 () (_ BitVec 64))

(declare-fun lt!7759 () tuple2!918)

(assert (=> b!22511 (= lt!7759 (update!31 (v!1581 (_2!463 lt!7457)) lt!7765 lt!7744))))

(declare-fun c!2775 () Bool)

(declare-fun lt!7763 () ListLongMap!561)

(assert (=> b!22511 (= c!2775 (contains!228 lt!7763 lt!7765))))

(declare-fun lt!7758 () Unit!495)

(declare-fun e!14604 () Unit!495)

(assert (=> b!22511 (= lt!7758 e!14604)))

(declare-fun c!2780 () Bool)

(assert (=> b!22511 (= c!2780 (_1!462 lt!7759))))

(declare-fun bm!1673 () Bool)

(declare-fun call!1685 () tuple2!918)

(declare-fun c!2776 () Bool)

(assert (=> bm!1673 (= call!1685 (repackFrom!4 thiss!938 (ite c!2776 (_2!462 lt!7759) (v!1581 (_2!463 lt!7457))) (bvsub (bvsub (size!675 (_keys!3154 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun b!22512 () Bool)

(declare-fun e!14597 () Bool)

(declare-fun e!14602 () Bool)

(assert (=> b!22512 (= e!14597 e!14602)))

(declare-fun res!14177 () Bool)

(assert (=> b!22512 (=> (not res!14177) (not e!14602))))

(declare-fun lt!7748 () tuple2!918)

(assert (=> b!22512 (= res!14177 (valid!109 (_2!462 lt!7748)))))

(declare-fun lt!7747 () ListLongMap!561)

(declare-fun c!2779 () Bool)

(declare-fun call!1678 () ListLongMap!561)

(declare-fun lt!7754 () (_ BitVec 64))

(declare-fun lt!7761 () ListLongMap!561)

(declare-fun bm!1674 () Bool)

(assert (=> bm!1674 (= call!1678 (+!43 (ite c!2779 lt!7761 lt!7747) (ite c!2779 (tuple2!931 lt!7754 (zeroValue!1656 (v!1581 (underlying!106 thiss!938)))) (tuple2!931 lt!7765 lt!7744))))))

(declare-fun b!22513 () Bool)

(declare-fun e!14598 () tuple2!918)

(assert (=> b!22513 (= e!14598 (tuple2!919 true (v!1581 (_2!463 lt!7457))))))

(declare-fun bm!1675 () Bool)

(declare-fun call!1684 () ListLongMap!561)

(declare-fun lt!7764 () (_ BitVec 64))

(assert (=> bm!1675 (= call!1684 (+!43 call!1678 (ite c!2779 (tuple2!931 lt!7765 lt!7744) (tuple2!931 lt!7764 (minValue!1656 (v!1581 (underlying!106 thiss!938)))))))))

(declare-fun bm!1676 () Bool)

(declare-fun call!1681 () ListLongMap!561)

(declare-fun getCurrentListMapNoExtraKeys!14 (array!1223 array!1221 (_ BitVec 32) (_ BitVec 32) V!1163 V!1163 (_ BitVec 32) Int) ListLongMap!561)

(assert (=> bm!1676 (= call!1681 (getCurrentListMapNoExtraKeys!14 (_keys!3154 (v!1581 (underlying!106 thiss!938))) (_values!1719 (v!1581 (underlying!106 thiss!938))) (mask!4711 (v!1581 (underlying!106 thiss!938))) (extraKeys!1631 (v!1581 (underlying!106 thiss!938))) (zeroValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (v!1581 (underlying!106 thiss!938))) (bvadd (bvsub (size!675 (_keys!3154 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!1731 (v!1581 (underlying!106 thiss!938)))))))

(declare-fun bm!1678 () Bool)

(declare-fun call!1679 () ListLongMap!561)

(declare-fun lt!7756 () (_ BitVec 64))

(declare-fun call!1687 () ListLongMap!561)

(assert (=> bm!1678 (= call!1679 (+!43 call!1687 (ite c!2779 (tuple2!931 lt!7765 lt!7744) (tuple2!931 lt!7756 (zeroValue!1656 (v!1581 (underlying!106 thiss!938)))))))))

(declare-fun b!22514 () Bool)

(declare-fun lt!7739 () (_ BitVec 32))

(declare-fun e!14600 () Bool)

(assert (=> b!22514 (= e!14600 (arrayContainsKey!0 (_keys!3154 (v!1581 (underlying!106 thiss!938))) lt!7765 lt!7739))))

(declare-fun b!22515 () Bool)

(declare-fun e!14599 () tuple2!918)

(declare-fun lt!7768 () tuple2!918)

(assert (=> b!22515 (= e!14599 (tuple2!919 (_1!462 lt!7768) (_2!462 lt!7768)))))

(assert (=> b!22515 (= lt!7761 call!1681)))

(assert (=> b!22515 (= lt!7754 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7740 () Unit!495)

(declare-fun call!1683 () Unit!495)

(assert (=> b!22515 (= lt!7740 call!1683)))

(declare-fun call!1677 () ListLongMap!561)

(assert (=> b!22515 (= call!1677 call!1684)))

(declare-fun lt!7749 () Unit!495)

(assert (=> b!22515 (= lt!7749 lt!7740)))

(declare-fun lt!7743 () ListLongMap!561)

(declare-fun call!1680 () ListLongMap!561)

(assert (=> b!22515 (= lt!7743 call!1680)))

(declare-fun lt!7760 () (_ BitVec 64))

(assert (=> b!22515 (= lt!7760 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7750 () Unit!495)

(declare-fun call!1682 () Unit!495)

(assert (=> b!22515 (= lt!7750 call!1682)))

(declare-fun call!1676 () ListLongMap!561)

(assert (=> b!22515 (= call!1676 call!1679)))

(declare-fun lt!7746 () Unit!495)

(assert (=> b!22515 (= lt!7746 lt!7750)))

(assert (=> b!22515 (= lt!7768 call!1685)))

(declare-fun b!22516 () Bool)

(assert (=> b!22516 (= e!14600 (ite (= lt!7765 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1631 (v!1581 (underlying!106 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1631 (v!1581 (underlying!106 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!22517 () Bool)

(assert (=> b!22517 false))

(declare-fun lt!7767 () Unit!495)

(declare-fun lt!7745 () Unit!495)

(assert (=> b!22517 (= lt!7767 lt!7745)))

(declare-fun lt!7741 () (_ BitVec 32))

(assert (=> b!22517 (not (arrayContainsKey!0 (_keys!3154 (v!1581 (underlying!106 thiss!938))) lt!7765 lt!7741))))

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!1223 (_ BitVec 32) (_ BitVec 64) List!562) Unit!495)

(assert (=> b!22517 (= lt!7745 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3154 (v!1581 (underlying!106 thiss!938))) lt!7741 lt!7765 (Cons!558 lt!7765 Nil!559)))))

(assert (=> b!22517 (= lt!7741 (bvadd (bvsub (size!675 (_keys!3154 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!7755 () Unit!495)

(declare-fun lt!7753 () Unit!495)

(assert (=> b!22517 (= lt!7755 lt!7753)))

(assert (=> b!22517 (arrayNoDuplicates!0 (_keys!3154 (v!1581 (underlying!106 thiss!938))) (bvsub (size!675 (_keys!3154 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001) Nil!559)))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!1223 (_ BitVec 32) (_ BitVec 32)) Unit!495)

(assert (=> b!22517 (= lt!7753 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3154 (v!1581 (underlying!106 thiss!938))) #b00000000000000000000000000000000 (bvsub (size!675 (_keys!3154 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!7769 () Unit!495)

(declare-fun lt!7742 () Unit!495)

(assert (=> b!22517 (= lt!7769 lt!7742)))

(assert (=> b!22517 e!14600))

(declare-fun c!2778 () Bool)

(assert (=> b!22517 (= c!2778 (and (not (= lt!7765 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!7765 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!3 (array!1223 array!1221 (_ BitVec 32) (_ BitVec 32) V!1163 V!1163 (_ BitVec 64) (_ BitVec 32) Int) Unit!495)

(assert (=> b!22517 (= lt!7742 (lemmaListMapContainsThenArrayContainsFrom!3 (_keys!3154 (v!1581 (underlying!106 thiss!938))) (_values!1719 (v!1581 (underlying!106 thiss!938))) (mask!4711 (v!1581 (underlying!106 thiss!938))) (extraKeys!1631 (v!1581 (underlying!106 thiss!938))) (zeroValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (v!1581 (underlying!106 thiss!938))) lt!7765 lt!7739 (defaultEntry!1731 (v!1581 (underlying!106 thiss!938)))))))

(assert (=> b!22517 (= lt!7739 (bvadd (bvsub (size!675 (_keys!3154 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun Unit!504 () Unit!495)

(assert (=> b!22517 (= e!14604 Unit!504)))

(declare-fun bm!1679 () Bool)

(declare-fun addCommutativeForDiffKeys!3 (ListLongMap!561 (_ BitVec 64) V!1163 (_ BitVec 64) V!1163) Unit!495)

(assert (=> bm!1679 (= call!1683 (addCommutativeForDiffKeys!3 (ite c!2779 lt!7761 lt!7747) lt!7765 lt!7744 (ite c!2779 lt!7754 lt!7764) (ite c!2779 (zeroValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (v!1581 (underlying!106 thiss!938))))))))

(declare-fun b!22518 () Bool)

(assert (=> b!22518 (= c!2779 (bvsgt (bvsub (size!675 (_keys!3154 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!22518 (= e!14601 e!14599)))

(declare-fun b!22519 () Bool)

(assert (=> b!22519 (= e!14603 e!14598)))

(declare-fun c!2777 () Bool)

(assert (=> b!22519 (= c!2777 (bvsgt (bvsub (size!675 (_keys!3154 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!22520 () Bool)

(assert (=> b!22520 (= e!14599 (tuple2!919 true (_2!462 lt!7759)))))

(declare-fun lt!7766 () ListLongMap!561)

(assert (=> b!22520 (= lt!7766 call!1681)))

(assert (=> b!22520 (= lt!7756 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7752 () Unit!495)

(assert (=> b!22520 (= lt!7752 call!1682)))

(assert (=> b!22520 (= call!1679 call!1676)))

(declare-fun lt!7751 () Unit!495)

(assert (=> b!22520 (= lt!7751 lt!7752)))

(assert (=> b!22520 (= lt!7747 call!1680)))

(assert (=> b!22520 (= lt!7764 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7757 () Unit!495)

(assert (=> b!22520 (= lt!7757 call!1683)))

(assert (=> b!22520 (= call!1684 call!1677)))

(declare-fun lt!7738 () Unit!495)

(assert (=> b!22520 (= lt!7738 lt!7757)))

(declare-fun call!1688 () ListLongMap!561)

(declare-fun bm!1680 () Bool)

(assert (=> bm!1680 (= call!1676 (+!43 call!1688 (ite c!2779 (tuple2!931 lt!7760 (minValue!1656 (v!1581 (underlying!106 thiss!938)))) (tuple2!931 lt!7765 lt!7744))))))

(declare-fun b!22521 () Bool)

(assert (=> b!22521 (= e!14601 (tuple2!919 false (_2!462 lt!7759)))))

(declare-fun bm!1681 () Bool)

(assert (=> bm!1681 (= call!1682 (addCommutativeForDiffKeys!3 (ite c!2779 lt!7743 lt!7766) lt!7765 lt!7744 (ite c!2779 lt!7760 lt!7756) (ite c!2779 (minValue!1656 (v!1581 (underlying!106 thiss!938))) (zeroValue!1656 (v!1581 (underlying!106 thiss!938))))))))

(declare-fun b!22522 () Bool)

(declare-fun lt!7762 () tuple2!918)

(assert (=> b!22522 (= lt!7762 call!1685)))

(assert (=> b!22522 (= e!14598 (tuple2!919 (_1!462 lt!7762) (_2!462 lt!7762)))))

(declare-fun b!22523 () Bool)

(declare-fun Unit!505 () Unit!495)

(assert (=> b!22523 (= e!14604 Unit!505)))

(declare-fun bm!1682 () Bool)

(assert (=> bm!1682 (= call!1680 (+!43 call!1681 (tuple2!931 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1656 (v!1581 (underlying!106 thiss!938))))))))

(declare-fun b!22524 () Bool)

(assert (=> b!22524 (= e!14602 (= (map!400 (_2!462 lt!7748)) (map!400 (v!1581 (underlying!106 thiss!938)))))))

(declare-fun bm!1683 () Bool)

(declare-fun call!1686 () ListLongMap!561)

(assert (=> bm!1683 (= call!1677 (+!43 call!1686 (ite c!2779 (tuple2!931 lt!7754 (zeroValue!1656 (v!1581 (underlying!106 thiss!938)))) (tuple2!931 lt!7765 lt!7744))))))

(declare-fun d!3915 () Bool)

(assert (=> d!3915 e!14597))

(declare-fun res!14176 () Bool)

(assert (=> d!3915 (=> res!14176 e!14597)))

(assert (=> d!3915 (= res!14176 (not (_1!462 lt!7748)))))

(assert (=> d!3915 (= lt!7748 e!14603)))

(assert (=> d!3915 (= c!2776 (and (not (= lt!7765 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!7765 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3915 (= lt!7763 (map!400 (v!1581 (_2!463 lt!7457))))))

(declare-fun get!383 (ValueCell!302 V!1163) V!1163)

(assert (=> d!3915 (= lt!7744 (get!383 (select (arr!578 (_values!1719 (v!1581 (underlying!106 thiss!938)))) (bvsub (size!675 (_keys!3154 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)) (dynLambda!141 (defaultEntry!1731 (v!1581 (underlying!106 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3915 (= lt!7765 (select (arr!579 (_keys!3154 (v!1581 (underlying!106 thiss!938)))) (bvsub (size!675 (_keys!3154 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!3915 (valid!106 thiss!938)))

(assert (=> d!3915 (= (repackFrom!4 thiss!938 (v!1581 (_2!463 lt!7457)) (bvsub (size!675 (_keys!3154 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)) lt!7748)))

(declare-fun bm!1677 () Bool)

(assert (=> bm!1677 (= call!1686 (+!43 (ite c!2779 lt!7761 lt!7747) (ite c!2779 (tuple2!931 lt!7765 lt!7744) (tuple2!931 lt!7764 (minValue!1656 (v!1581 (underlying!106 thiss!938)))))))))

(declare-fun bm!1684 () Bool)

(assert (=> bm!1684 (= call!1688 (+!43 (ite c!2779 lt!7743 lt!7766) (ite c!2779 (tuple2!931 lt!7765 lt!7744) (tuple2!931 lt!7756 (zeroValue!1656 (v!1581 (underlying!106 thiss!938)))))))))

(declare-fun bm!1685 () Bool)

(assert (=> bm!1685 (= call!1687 (+!43 (ite c!2779 lt!7743 lt!7766) (ite c!2779 (tuple2!931 lt!7760 (minValue!1656 (v!1581 (underlying!106 thiss!938)))) (tuple2!931 lt!7765 lt!7744))))))

(assert (= (and d!3915 c!2776) b!22511))

(assert (= (and d!3915 (not c!2776)) b!22519))

(assert (= (and b!22511 c!2775) b!22517))

(assert (= (and b!22511 (not c!2775)) b!22523))

(assert (= (and b!22517 c!2778) b!22514))

(assert (= (and b!22517 (not c!2778)) b!22516))

(assert (= (and b!22511 c!2780) b!22518))

(assert (= (and b!22511 (not c!2780)) b!22521))

(assert (= (and b!22518 c!2779) b!22515))

(assert (= (and b!22518 (not c!2779)) b!22520))

(assert (= (or b!22515 b!22520) bm!1684))

(assert (= (or b!22515 b!22520) bm!1681))

(assert (= (or b!22515 b!22520) bm!1674))

(assert (= (or b!22515 b!22520) bm!1677))

(assert (= (or b!22515 b!22520) bm!1676))

(assert (= (or b!22515 b!22520) bm!1679))

(assert (= (or b!22515 b!22520) bm!1685))

(assert (= (or b!22515 b!22520) bm!1675))

(assert (= (or b!22515 b!22520) bm!1683))

(assert (= (or b!22515 b!22520) bm!1680))

(assert (= (or b!22515 b!22520) bm!1678))

(assert (= (or b!22515 b!22520) bm!1682))

(assert (= (and b!22519 c!2777) b!22522))

(assert (= (and b!22519 (not c!2777)) b!22513))

(assert (= (or b!22515 b!22522) bm!1673))

(assert (= (and d!3915 (not res!14176)) b!22512))

(assert (= (and b!22512 res!14177) b!22524))

(declare-fun b_lambda!1547 () Bool)

(assert (=> (not b_lambda!1547) (not d!3915)))

(assert (=> d!3915 t!3220))

(declare-fun b_and!1455 () Bool)

(assert (= b_and!1453 (and (=> t!3220 result!1075) b_and!1455)))

(declare-fun m!16276 () Bool)

(assert (=> bm!1675 m!16276))

(declare-fun m!16278 () Bool)

(assert (=> bm!1676 m!16278))

(declare-fun m!16280 () Bool)

(assert (=> bm!1678 m!16280))

(declare-fun m!16282 () Bool)

(assert (=> b!22512 m!16282))

(declare-fun m!16284 () Bool)

(assert (=> bm!1674 m!16284))

(declare-fun m!16286 () Bool)

(assert (=> b!22514 m!16286))

(assert (=> d!3915 m!16132))

(declare-fun m!16288 () Bool)

(assert (=> d!3915 m!16288))

(assert (=> d!3915 m!16248))

(declare-fun m!16290 () Bool)

(assert (=> d!3915 m!16290))

(assert (=> d!3915 m!16288))

(assert (=> d!3915 m!16248))

(declare-fun m!16292 () Bool)

(assert (=> d!3915 m!16292))

(declare-fun m!16294 () Bool)

(assert (=> d!3915 m!16294))

(declare-fun m!16296 () Bool)

(assert (=> bm!1677 m!16296))

(declare-fun m!16298 () Bool)

(assert (=> bm!1685 m!16298))

(declare-fun m!16300 () Bool)

(assert (=> bm!1681 m!16300))

(declare-fun m!16302 () Bool)

(assert (=> bm!1680 m!16302))

(declare-fun m!16304 () Bool)

(assert (=> b!22517 m!16304))

(declare-fun m!16306 () Bool)

(assert (=> b!22517 m!16306))

(declare-fun m!16308 () Bool)

(assert (=> b!22517 m!16308))

(declare-fun m!16310 () Bool)

(assert (=> b!22517 m!16310))

(declare-fun m!16312 () Bool)

(assert (=> b!22517 m!16312))

(declare-fun m!16314 () Bool)

(assert (=> bm!1684 m!16314))

(declare-fun m!16316 () Bool)

(assert (=> bm!1673 m!16316))

(declare-fun m!16318 () Bool)

(assert (=> bm!1683 m!16318))

(declare-fun m!16320 () Bool)

(assert (=> b!22524 m!16320))

(declare-fun m!16322 () Bool)

(assert (=> b!22524 m!16322))

(declare-fun m!16324 () Bool)

(assert (=> b!22511 m!16324))

(declare-fun m!16326 () Bool)

(assert (=> b!22511 m!16326))

(declare-fun m!16328 () Bool)

(assert (=> bm!1679 m!16328))

(declare-fun m!16330 () Bool)

(assert (=> bm!1682 m!16330))

(assert (=> b!22228 d!3915))

(declare-fun b!22525 () Bool)

(declare-fun e!14606 () Unit!495)

(declare-fun lt!7775 () Unit!495)

(assert (=> b!22525 (= e!14606 lt!7775)))

(declare-fun call!1699 () Unit!495)

(assert (=> b!22525 (= lt!7775 call!1699)))

(declare-fun lt!7785 () SeekEntryResult!53)

(declare-fun call!1695 () SeekEntryResult!53)

(assert (=> b!22525 (= lt!7785 call!1695)))

(declare-fun c!2781 () Bool)

(assert (=> b!22525 (= c!2781 ((_ is MissingZero!53) lt!7785))))

(declare-fun e!14625 () Bool)

(assert (=> b!22525 e!14625))

(declare-fun b!22526 () Bool)

(declare-fun e!14614 () Bool)

(declare-fun e!14624 () Bool)

(assert (=> b!22526 (= e!14614 e!14624)))

(declare-fun res!14191 () Bool)

(declare-fun call!1690 () Bool)

(assert (=> b!22526 (= res!14191 call!1690)))

(assert (=> b!22526 (=> (not res!14191) (not e!14624))))

(declare-fun b!22527 () Bool)

(declare-fun res!14180 () Bool)

(declare-fun call!1710 () Bool)

(assert (=> b!22527 (= res!14180 call!1710)))

(declare-fun e!14620 () Bool)

(assert (=> b!22527 (=> (not res!14180) (not e!14620))))

(declare-fun b!22528 () Bool)

(declare-fun e!14609 () tuple2!918)

(declare-fun e!14607 () tuple2!918)

(assert (=> b!22528 (= e!14609 e!14607)))

(declare-fun c!2786 () Bool)

(assert (=> b!22528 (= c!2786 (= (ite (or c!2689 c!2690) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22529 () Bool)

(declare-fun c!2787 () Bool)

(declare-fun lt!7773 () SeekEntryResult!53)

(assert (=> b!22529 (= c!2787 ((_ is MissingVacant!53) lt!7773))))

(declare-fun e!14608 () tuple2!918)

(declare-fun e!14616 () tuple2!918)

(assert (=> b!22529 (= e!14608 e!14616)))

(declare-fun call!1701 () ListLongMap!561)

(declare-fun bm!1686 () Bool)

(declare-fun c!2782 () Bool)

(declare-fun call!1696 () ListLongMap!561)

(declare-fun call!1693 () ListLongMap!561)

(assert (=> bm!1686 (= call!1701 (+!43 (ite c!2782 call!1696 call!1693) (ite c!2782 (ite c!2786 (tuple2!931 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2689 c!2690) (zeroValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (v!1581 (underlying!106 thiss!938))))) (tuple2!931 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2689 c!2690) (zeroValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (v!1581 (underlying!106 thiss!938)))))) (tuple2!931 (ite (or c!2689 c!2690) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2689 c!2690) (zeroValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (v!1581 (underlying!106 thiss!938))))))))))

(declare-fun bm!1687 () Bool)

(declare-fun call!1712 () SeekEntryResult!53)

(assert (=> bm!1687 (= call!1695 call!1712)))

(declare-fun call!1704 () ListLongMap!561)

(declare-fun e!14617 () Bool)

(declare-fun call!1692 () ListLongMap!561)

(declare-fun b!22530 () Bool)

(assert (=> b!22530 (= e!14617 (= call!1704 (+!43 call!1692 (tuple2!931 (ite (or c!2689 c!2690) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2689 c!2690) (zeroValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (v!1581 (underlying!106 thiss!938))))))))))

(declare-fun lt!7781 () (_ BitVec 32))

(declare-fun call!1711 () ListLongMap!561)

(declare-fun bm!1688 () Bool)

(declare-fun lt!7783 () (_ BitVec 32))

(assert (=> bm!1688 (= call!1711 (getCurrentListMap!127 (_keys!3154 lt!7448) (ite c!2782 (_values!1719 lt!7448) (array!1222 (store (arr!578 (_values!1719 lt!7448)) (index!2334 lt!7773) (ValueCellFull!302 (ite (or c!2689 c!2690) (zeroValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (v!1581 (underlying!106 thiss!938)))))) (size!674 (_values!1719 lt!7448)))) (mask!4711 lt!7448) (ite c!2782 (ite c!2786 lt!7781 lt!7783) (extraKeys!1631 lt!7448)) (ite (and c!2782 c!2786) (ite (or c!2689 c!2690) (zeroValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (v!1581 (underlying!106 thiss!938)))) (zeroValue!1656 lt!7448)) (ite c!2782 (ite c!2786 (minValue!1656 lt!7448) (ite (or c!2689 c!2690) (zeroValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (v!1581 (underlying!106 thiss!938))))) (minValue!1656 lt!7448)) #b00000000000000000000000000000000 (defaultEntry!1731 lt!7448)))))

(declare-fun b!22531 () Bool)

(declare-fun lt!7782 () Unit!495)

(declare-fun lt!7786 () Unit!495)

(assert (=> b!22531 (= lt!7782 lt!7786)))

(declare-fun call!1708 () ListLongMap!561)

(declare-fun call!1707 () ListLongMap!561)

(assert (=> b!22531 (= call!1708 call!1707)))

(assert (=> b!22531 (= lt!7786 (lemmaChangeLongMinValueKeyThenAddPairToListMap!8 (_keys!3154 lt!7448) (_values!1719 lt!7448) (mask!4711 lt!7448) (extraKeys!1631 lt!7448) lt!7783 (zeroValue!1656 lt!7448) (minValue!1656 lt!7448) (ite (or c!2689 c!2690) (zeroValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (v!1581 (underlying!106 thiss!938)))) (defaultEntry!1731 lt!7448)))))

(assert (=> b!22531 (= lt!7783 (bvor (extraKeys!1631 lt!7448) #b00000000000000000000000000000010))))

(assert (=> b!22531 (= e!14607 (tuple2!919 true (LongMapFixedSize!191 (defaultEntry!1731 lt!7448) (mask!4711 lt!7448) (bvor (extraKeys!1631 lt!7448) #b00000000000000000000000000000010) (zeroValue!1656 lt!7448) (ite (or c!2689 c!2690) (zeroValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (v!1581 (underlying!106 thiss!938)))) (_size!138 lt!7448) (_keys!3154 lt!7448) (_values!1719 lt!7448) (_vacant!138 lt!7448))))))

(declare-fun bm!1689 () Bool)

(assert (=> bm!1689 (= call!1699 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!8 (_keys!3154 lt!7448) (_values!1719 lt!7448) (mask!4711 lt!7448) (extraKeys!1631 lt!7448) (zeroValue!1656 lt!7448) (minValue!1656 lt!7448) (ite (or c!2689 c!2690) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1731 lt!7448)))))

(declare-fun b!22532 () Bool)

(declare-fun res!14178 () Bool)

(declare-fun e!14615 () Bool)

(assert (=> b!22532 (=> (not res!14178) (not e!14615))))

(assert (=> b!22532 (= res!14178 call!1690)))

(declare-fun e!14622 () Bool)

(assert (=> b!22532 (= e!14622 e!14615)))

(declare-fun bm!1690 () Bool)

(declare-fun call!1697 () Bool)

(declare-fun call!1691 () Bool)

(assert (=> bm!1690 (= call!1697 call!1691)))

(declare-fun bm!1691 () Bool)

(assert (=> bm!1691 (= call!1712 (seekEntryOrOpen!0 (ite (or c!2689 c!2690) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3154 lt!7448) (mask!4711 lt!7448)))))

(declare-fun b!22533 () Bool)

(declare-fun lt!7774 () Unit!495)

(declare-fun lt!7789 () Unit!495)

(assert (=> b!22533 (= lt!7774 lt!7789)))

(assert (=> b!22533 (= call!1708 call!1707)))

(assert (=> b!22533 (= lt!7789 (lemmaChangeZeroKeyThenAddPairToListMap!8 (_keys!3154 lt!7448) (_values!1719 lt!7448) (mask!4711 lt!7448) (extraKeys!1631 lt!7448) lt!7781 (zeroValue!1656 lt!7448) (ite (or c!2689 c!2690) (zeroValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (v!1581 (underlying!106 thiss!938)))) (minValue!1656 lt!7448) (defaultEntry!1731 lt!7448)))))

(assert (=> b!22533 (= lt!7781 (bvor (extraKeys!1631 lt!7448) #b00000000000000000000000000000001))))

(assert (=> b!22533 (= e!14607 (tuple2!919 true (LongMapFixedSize!191 (defaultEntry!1731 lt!7448) (mask!4711 lt!7448) (bvor (extraKeys!1631 lt!7448) #b00000000000000000000000000000001) (ite (or c!2689 c!2690) (zeroValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (v!1581 (underlying!106 thiss!938)))) (minValue!1656 lt!7448) (_size!138 lt!7448) (_keys!3154 lt!7448) (_values!1719 lt!7448) (_vacant!138 lt!7448))))))

(declare-fun b!22534 () Bool)

(declare-fun lt!7790 () SeekEntryResult!53)

(assert (=> b!22534 (= e!14614 ((_ is Undefined!53) lt!7790))))

(declare-fun b!22535 () Bool)

(declare-fun e!14610 () Bool)

(declare-fun lt!7779 () SeekEntryResult!53)

(assert (=> b!22535 (= e!14610 (= (select (arr!579 (_keys!3154 lt!7448)) (index!2334 lt!7779)) (ite (or c!2689 c!2690) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!22536 () Bool)

(declare-fun e!14612 () Bool)

(declare-fun e!14611 () Bool)

(assert (=> b!22536 (= e!14612 e!14611)))

(declare-fun res!14188 () Bool)

(assert (=> b!22536 (= res!14188 call!1697)))

(assert (=> b!22536 (=> (not res!14188) (not e!14611))))

(declare-fun b!22537 () Bool)

(declare-fun res!14182 () Bool)

(assert (=> b!22537 (= res!14182 (= (select (arr!579 (_keys!3154 lt!7448)) (index!2336 lt!7785)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22537 (=> (not res!14182) (not e!14611))))

(declare-fun b!22538 () Bool)

(declare-fun e!14618 () Bool)

(assert (=> b!22538 (= e!14618 e!14617)))

(declare-fun res!14190 () Bool)

(assert (=> b!22538 (= res!14190 (contains!228 call!1704 (ite (or c!2689 c!2690) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22538 (=> (not res!14190) (not e!14617))))

(declare-fun b!22539 () Bool)

(declare-fun c!2789 () Bool)

(assert (=> b!22539 (= c!2789 ((_ is MissingVacant!53) lt!7785))))

(assert (=> b!22539 (= e!14625 e!14612)))

(declare-fun bm!1692 () Bool)

(declare-fun lt!7793 () array!1221)

(declare-fun c!2791 () Bool)

(declare-fun call!1703 () ListLongMap!561)

(assert (=> bm!1692 (= call!1703 (getCurrentListMap!127 (_keys!3154 lt!7448) (ite c!2791 (_values!1719 lt!7448) lt!7793) (mask!4711 lt!7448) (extraKeys!1631 lt!7448) (zeroValue!1656 lt!7448) (minValue!1656 lt!7448) #b00000000000000000000000000000000 (defaultEntry!1731 lt!7448)))))

(declare-fun c!2785 () Bool)

(declare-fun c!2788 () Bool)

(declare-fun c!2792 () Bool)

(declare-fun bm!1693 () Bool)

(declare-fun call!1694 () Bool)

(declare-fun lt!7778 () SeekEntryResult!53)

(assert (=> bm!1693 (= call!1694 (inRange!0 (ite c!2791 (ite c!2788 (index!2334 lt!7779) (ite c!2781 (index!2333 lt!7785) (index!2336 lt!7785))) (ite c!2792 (index!2334 lt!7778) (ite c!2785 (index!2333 lt!7790) (index!2336 lt!7790)))) (mask!4711 lt!7448)))))

(declare-fun b!22540 () Bool)

(declare-fun e!14605 () Unit!495)

(declare-fun Unit!506 () Unit!495)

(assert (=> b!22540 (= e!14605 Unit!506)))

(declare-fun lt!7794 () Unit!495)

(assert (=> b!22540 (= lt!7794 call!1699)))

(declare-fun call!1702 () SeekEntryResult!53)

(assert (=> b!22540 (= lt!7790 call!1702)))

(assert (=> b!22540 (= c!2785 ((_ is MissingZero!53) lt!7790))))

(assert (=> b!22540 e!14622))

(declare-fun lt!7792 () Unit!495)

(assert (=> b!22540 (= lt!7792 lt!7794)))

(assert (=> b!22540 false))

(declare-fun bm!1694 () Bool)

(declare-fun call!1709 () Unit!495)

(assert (=> bm!1694 (= call!1709 (lemmaInListMapThenSeekEntryOrOpenFindsIt!8 (_keys!3154 lt!7448) (_values!1719 lt!7448) (mask!4711 lt!7448) (extraKeys!1631 lt!7448) (zeroValue!1656 lt!7448) (minValue!1656 lt!7448) (ite (or c!2689 c!2690) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1731 lt!7448)))))

(declare-fun b!22541 () Bool)

(declare-fun Unit!507 () Unit!495)

(assert (=> b!22541 (= e!14606 Unit!507)))

(declare-fun lt!7777 () Unit!495)

(assert (=> b!22541 (= lt!7777 call!1709)))

(assert (=> b!22541 (= lt!7779 call!1695)))

(declare-fun res!14186 () Bool)

(assert (=> b!22541 (= res!14186 ((_ is Found!53) lt!7779))))

(assert (=> b!22541 (=> (not res!14186) (not e!14610))))

(assert (=> b!22541 e!14610))

(declare-fun lt!7787 () Unit!495)

(assert (=> b!22541 (= lt!7787 lt!7777)))

(assert (=> b!22541 false))

(declare-fun bm!1695 () Bool)

(assert (=> bm!1695 (= call!1696 call!1693)))

(declare-fun bm!1696 () Bool)

(assert (=> bm!1696 (= call!1710 call!1694)))

(declare-fun b!22542 () Bool)

(assert (=> b!22542 (= e!14620 (= (select (arr!579 (_keys!3154 lt!7448)) (index!2334 lt!7778)) (ite (or c!2689 c!2690) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!22543 () Bool)

(declare-fun e!14613 () Bool)

(declare-fun call!1698 () Bool)

(assert (=> b!22543 (= e!14613 (not call!1698))))

(declare-fun b!22544 () Bool)

(assert (=> b!22544 (= e!14618 (= call!1704 call!1692))))

(declare-fun b!22545 () Bool)

(declare-fun call!1689 () Bool)

(assert (=> b!22545 (= e!14615 (not call!1689))))

(declare-fun b!22546 () Bool)

(declare-fun res!14179 () Bool)

(assert (=> b!22546 (=> (not res!14179) (not e!14613))))

(assert (=> b!22546 (= res!14179 call!1697)))

(assert (=> b!22546 (= e!14625 e!14613)))

(declare-fun bm!1697 () Bool)

(assert (=> bm!1697 (= call!1692 (map!400 lt!7448))))

(declare-fun b!22547 () Bool)

(assert (=> b!22547 (= e!14624 (not call!1689))))

(declare-fun b!22548 () Bool)

(declare-fun lt!7776 () tuple2!918)

(declare-fun call!1706 () tuple2!918)

(assert (=> b!22548 (= lt!7776 call!1706)))

(declare-fun e!14623 () tuple2!918)

(assert (=> b!22548 (= e!14623 (tuple2!919 (_1!462 lt!7776) (_2!462 lt!7776)))))

(declare-fun bm!1698 () Bool)

(assert (=> bm!1698 (= call!1706 (updateHelperNewKey!8 lt!7448 (ite (or c!2689 c!2690) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2689 c!2690) (zeroValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (v!1581 (underlying!106 thiss!938)))) (ite c!2787 (index!2336 lt!7773) (index!2333 lt!7773))))))

(declare-fun bm!1699 () Bool)

(declare-fun c!2783 () Bool)

(assert (=> bm!1699 (= c!2783 c!2791)))

(declare-fun call!1700 () Bool)

(declare-fun e!14621 () ListLongMap!561)

(assert (=> bm!1699 (= call!1700 (contains!228 e!14621 (ite (or c!2689 c!2690) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!22549 () Bool)

(declare-fun c!2790 () Bool)

(assert (=> b!22549 (= c!2790 ((_ is MissingVacant!53) lt!7790))))

(assert (=> b!22549 (= e!14622 e!14614)))

(declare-fun b!22550 () Bool)

(assert (=> b!22550 (= e!14621 call!1693)))

(declare-fun bm!1700 () Bool)

(declare-fun call!1705 () Bool)

(assert (=> bm!1700 (= call!1705 (arrayContainsKey!0 (_keys!3154 lt!7448) (ite (or c!2689 c!2690) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000))))

(declare-fun bm!1701 () Bool)

(assert (=> bm!1701 (= call!1689 call!1705)))

(declare-fun b!22551 () Bool)

(assert (=> b!22551 (= e!14611 (not call!1698))))

(declare-fun b!22552 () Bool)

(declare-fun lt!7771 () tuple2!918)

(assert (=> b!22552 (= e!14616 (tuple2!919 (_1!462 lt!7771) (_2!462 lt!7771)))))

(assert (=> b!22552 (= lt!7771 call!1706)))

(declare-fun b!22553 () Bool)

(assert (=> b!22553 (= e!14616 e!14623)))

(declare-fun c!2784 () Bool)

(assert (=> b!22553 (= c!2784 ((_ is MissingZero!53) lt!7773))))

(declare-fun b!22554 () Bool)

(declare-fun e!14619 () Bool)

(assert (=> b!22554 (= e!14619 e!14618)))

(declare-fun c!2793 () Bool)

(declare-fun lt!7780 () tuple2!918)

(assert (=> b!22554 (= c!2793 (_1!462 lt!7780))))

(declare-fun b!22555 () Bool)

(declare-fun res!14189 () Bool)

(assert (=> b!22555 (= res!14189 call!1691)))

(assert (=> b!22555 (=> (not res!14189) (not e!14610))))

(declare-fun bm!1702 () Bool)

(assert (=> bm!1702 (= call!1707 call!1711)))

(declare-fun bm!1703 () Bool)

(assert (=> bm!1703 (= call!1708 call!1701)))

(declare-fun b!22556 () Bool)

(assert (=> b!22556 (= e!14621 call!1703)))

(declare-fun bm!1704 () Bool)

(assert (=> bm!1704 (= call!1691 call!1694)))

(declare-fun bm!1705 () Bool)

(assert (=> bm!1705 (= call!1704 (map!400 (_2!462 lt!7780)))))

(declare-fun b!22557 () Bool)

(declare-fun res!14181 () Bool)

(assert (=> b!22557 (=> (not res!14181) (not e!14615))))

(assert (=> b!22557 (= res!14181 (= (select (arr!579 (_keys!3154 lt!7448)) (index!2333 lt!7790)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1706 () Bool)

(assert (=> bm!1706 (= call!1702 call!1712)))

(declare-fun bm!1707 () Bool)

(assert (=> bm!1707 (= call!1693 (getCurrentListMap!127 (_keys!3154 lt!7448) (_values!1719 lt!7448) (mask!4711 lt!7448) (extraKeys!1631 lt!7448) (zeroValue!1656 lt!7448) (minValue!1656 lt!7448) #b00000000000000000000000000000000 (defaultEntry!1731 lt!7448)))))

(declare-fun b!22558 () Bool)

(declare-fun lt!7795 () Unit!495)

(assert (=> b!22558 (= lt!7795 e!14606)))

(assert (=> b!22558 (= c!2788 call!1700)))

(assert (=> b!22558 (= e!14608 (tuple2!919 false lt!7448))))

(declare-fun b!22559 () Bool)

(assert (=> b!22559 (= e!14609 e!14608)))

(assert (=> b!22559 (= lt!7773 (seekEntryOrOpen!0 (ite (or c!2689 c!2690) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3154 lt!7448) (mask!4711 lt!7448)))))

(assert (=> b!22559 (= c!2791 ((_ is Undefined!53) lt!7773))))

(declare-fun bm!1708 () Bool)

(assert (=> bm!1708 (= call!1690 call!1710)))

(declare-fun b!22560 () Bool)

(declare-fun lt!7770 () Unit!495)

(declare-fun lt!7772 () Unit!495)

(assert (=> b!22560 (= lt!7770 lt!7772)))

(assert (=> b!22560 (contains!228 call!1703 (select (arr!579 (_keys!3154 lt!7448)) (index!2334 lt!7773)))))

(assert (=> b!22560 (= lt!7772 (lemmaValidKeyInArrayIsInListMap!8 (_keys!3154 lt!7448) lt!7793 (mask!4711 lt!7448) (extraKeys!1631 lt!7448) (zeroValue!1656 lt!7448) (minValue!1656 lt!7448) (index!2334 lt!7773) (defaultEntry!1731 lt!7448)))))

(assert (=> b!22560 (= lt!7793 (array!1222 (store (arr!578 (_values!1719 lt!7448)) (index!2334 lt!7773) (ValueCellFull!302 (ite (or c!2689 c!2690) (zeroValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (v!1581 (underlying!106 thiss!938)))))) (size!674 (_values!1719 lt!7448))))))

(declare-fun lt!7796 () Unit!495)

(declare-fun lt!7784 () Unit!495)

(assert (=> b!22560 (= lt!7796 lt!7784)))

(assert (=> b!22560 (= call!1701 call!1711)))

(assert (=> b!22560 (= lt!7784 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!8 (_keys!3154 lt!7448) (_values!1719 lt!7448) (mask!4711 lt!7448) (extraKeys!1631 lt!7448) (zeroValue!1656 lt!7448) (minValue!1656 lt!7448) (index!2334 lt!7773) (ite (or c!2689 c!2690) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2689 c!2690) (zeroValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (v!1581 (underlying!106 thiss!938)))) (defaultEntry!1731 lt!7448)))))

(declare-fun lt!7788 () Unit!495)

(assert (=> b!22560 (= lt!7788 e!14605)))

(assert (=> b!22560 (= c!2792 call!1700)))

(assert (=> b!22560 (= e!14623 (tuple2!919 true (LongMapFixedSize!191 (defaultEntry!1731 lt!7448) (mask!4711 lt!7448) (extraKeys!1631 lt!7448) (zeroValue!1656 lt!7448) (minValue!1656 lt!7448) (_size!138 lt!7448) (_keys!3154 lt!7448) (array!1222 (store (arr!578 (_values!1719 lt!7448)) (index!2334 lt!7773) (ValueCellFull!302 (ite (or c!2689 c!2690) (zeroValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (v!1581 (underlying!106 thiss!938)))))) (size!674 (_values!1719 lt!7448))) (_vacant!138 lt!7448))))))

(declare-fun b!22561 () Bool)

(declare-fun res!14183 () Bool)

(assert (=> b!22561 (=> (not res!14183) (not e!14613))))

(assert (=> b!22561 (= res!14183 (= (select (arr!579 (_keys!3154 lt!7448)) (index!2333 lt!7785)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22562 () Bool)

(declare-fun lt!7791 () Unit!495)

(assert (=> b!22562 (= e!14605 lt!7791)))

(assert (=> b!22562 (= lt!7791 call!1709)))

(assert (=> b!22562 (= lt!7778 call!1702)))

(declare-fun res!14185 () Bool)

(assert (=> b!22562 (= res!14185 ((_ is Found!53) lt!7778))))

(assert (=> b!22562 (=> (not res!14185) (not e!14620))))

(assert (=> b!22562 e!14620))

(declare-fun d!3917 () Bool)

(assert (=> d!3917 e!14619))

(declare-fun res!14187 () Bool)

(assert (=> d!3917 (=> (not res!14187) (not e!14619))))

(assert (=> d!3917 (= res!14187 (valid!109 (_2!462 lt!7780)))))

(assert (=> d!3917 (= lt!7780 e!14609)))

(assert (=> d!3917 (= c!2782 (= (ite (or c!2689 c!2690) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvneg (ite (or c!2689 c!2690) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3917 (valid!109 lt!7448)))

(assert (=> d!3917 (= (update!31 lt!7448 (ite (or c!2689 c!2690) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2689 c!2690) (zeroValue!1656 (v!1581 (underlying!106 thiss!938))) (minValue!1656 (v!1581 (underlying!106 thiss!938))))) lt!7780)))

(declare-fun b!22563 () Bool)

(assert (=> b!22563 (= e!14612 ((_ is Undefined!53) lt!7785))))

(declare-fun b!22564 () Bool)

(declare-fun res!14184 () Bool)

(assert (=> b!22564 (= res!14184 (= (select (arr!579 (_keys!3154 lt!7448)) (index!2336 lt!7790)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22564 (=> (not res!14184) (not e!14624))))

(declare-fun bm!1709 () Bool)

(assert (=> bm!1709 (= call!1698 call!1705)))

(assert (= (and d!3917 c!2782) b!22528))

(assert (= (and d!3917 (not c!2782)) b!22559))

(assert (= (and b!22528 c!2786) b!22533))

(assert (= (and b!22528 (not c!2786)) b!22531))

(assert (= (or b!22533 b!22531) bm!1702))

(assert (= (or b!22533 b!22531) bm!1695))

(assert (= (or b!22533 b!22531) bm!1703))

(assert (= (and b!22559 c!2791) b!22558))

(assert (= (and b!22559 (not c!2791)) b!22529))

(assert (= (and b!22558 c!2788) b!22541))

(assert (= (and b!22558 (not c!2788)) b!22525))

(assert (= (and b!22541 res!14186) b!22555))

(assert (= (and b!22555 res!14189) b!22535))

(assert (= (and b!22525 c!2781) b!22546))

(assert (= (and b!22525 (not c!2781)) b!22539))

(assert (= (and b!22546 res!14179) b!22561))

(assert (= (and b!22561 res!14183) b!22543))

(assert (= (and b!22539 c!2789) b!22536))

(assert (= (and b!22539 (not c!2789)) b!22563))

(assert (= (and b!22536 res!14188) b!22537))

(assert (= (and b!22537 res!14182) b!22551))

(assert (= (or b!22546 b!22536) bm!1690))

(assert (= (or b!22543 b!22551) bm!1709))

(assert (= (or b!22555 bm!1690) bm!1704))

(assert (= (or b!22541 b!22525) bm!1687))

(assert (= (and b!22529 c!2787) b!22552))

(assert (= (and b!22529 (not c!2787)) b!22553))

(assert (= (and b!22553 c!2784) b!22548))

(assert (= (and b!22553 (not c!2784)) b!22560))

(assert (= (and b!22560 c!2792) b!22562))

(assert (= (and b!22560 (not c!2792)) b!22540))

(assert (= (and b!22562 res!14185) b!22527))

(assert (= (and b!22527 res!14180) b!22542))

(assert (= (and b!22540 c!2785) b!22532))

(assert (= (and b!22540 (not c!2785)) b!22549))

(assert (= (and b!22532 res!14178) b!22557))

(assert (= (and b!22557 res!14181) b!22545))

(assert (= (and b!22549 c!2790) b!22526))

(assert (= (and b!22549 (not c!2790)) b!22534))

(assert (= (and b!22526 res!14191) b!22564))

(assert (= (and b!22564 res!14184) b!22547))

(assert (= (or b!22532 b!22526) bm!1708))

(assert (= (or b!22545 b!22547) bm!1701))

(assert (= (or b!22527 bm!1708) bm!1696))

(assert (= (or b!22562 b!22540) bm!1706))

(assert (= (or b!22552 b!22548) bm!1698))

(assert (= (or b!22541 b!22562) bm!1694))

(assert (= (or b!22525 b!22540) bm!1689))

(assert (= (or bm!1709 bm!1701) bm!1700))

(assert (= (or bm!1704 bm!1696) bm!1693))

(assert (= (or b!22558 b!22560) bm!1692))

(assert (= (or bm!1687 bm!1706) bm!1691))

(assert (= (or b!22558 b!22560) bm!1699))

(assert (= (and bm!1699 c!2783) b!22556))

(assert (= (and bm!1699 (not c!2783)) b!22550))

(assert (= (or bm!1702 b!22560) bm!1688))

(assert (= (or bm!1695 b!22550 b!22560) bm!1707))

(assert (= (or bm!1703 b!22560) bm!1686))

(assert (= (and d!3917 res!14187) b!22554))

(assert (= (and b!22554 c!2793) b!22538))

(assert (= (and b!22554 (not c!2793)) b!22544))

(assert (= (and b!22538 res!14190) b!22530))

(assert (= (or b!22530 b!22544) bm!1697))

(assert (= (or b!22538 b!22530 b!22544) bm!1705))

(declare-fun m!16332 () Bool)

(assert (=> b!22538 m!16332))

(declare-fun m!16334 () Bool)

(assert (=> b!22535 m!16334))

(declare-fun m!16336 () Bool)

(assert (=> b!22564 m!16336))

(declare-fun m!16338 () Bool)

(assert (=> b!22557 m!16338))

(declare-fun m!16340 () Bool)

(assert (=> bm!1692 m!16340))

(declare-fun m!16342 () Bool)

(assert (=> d!3917 m!16342))

(declare-fun m!16344 () Bool)

(assert (=> d!3917 m!16344))

(declare-fun m!16346 () Bool)

(assert (=> bm!1686 m!16346))

(declare-fun m!16348 () Bool)

(assert (=> bm!1688 m!16348))

(declare-fun m!16350 () Bool)

(assert (=> bm!1688 m!16350))

(assert (=> b!22560 m!16348))

(declare-fun m!16352 () Bool)

(assert (=> b!22560 m!16352))

(declare-fun m!16354 () Bool)

(assert (=> b!22560 m!16354))

(declare-fun m!16356 () Bool)

(assert (=> b!22560 m!16356))

(assert (=> b!22560 m!16354))

(declare-fun m!16358 () Bool)

(assert (=> b!22560 m!16358))

(declare-fun m!16360 () Bool)

(assert (=> b!22561 m!16360))

(declare-fun m!16362 () Bool)

(assert (=> b!22537 m!16362))

(declare-fun m!16364 () Bool)

(assert (=> b!22559 m!16364))

(declare-fun m!16366 () Bool)

(assert (=> bm!1700 m!16366))

(declare-fun m!16368 () Bool)

(assert (=> b!22530 m!16368))

(declare-fun m!16370 () Bool)

(assert (=> bm!1689 m!16370))

(declare-fun m!16372 () Bool)

(assert (=> bm!1693 m!16372))

(declare-fun m!16374 () Bool)

(assert (=> b!22531 m!16374))

(declare-fun m!16376 () Bool)

(assert (=> b!22533 m!16376))

(declare-fun m!16378 () Bool)

(assert (=> b!22542 m!16378))

(declare-fun m!16380 () Bool)

(assert (=> bm!1697 m!16380))

(declare-fun m!16382 () Bool)

(assert (=> bm!1698 m!16382))

(declare-fun m!16384 () Bool)

(assert (=> bm!1699 m!16384))

(declare-fun m!16386 () Bool)

(assert (=> bm!1705 m!16386))

(declare-fun m!16388 () Bool)

(assert (=> bm!1694 m!16388))

(assert (=> bm!1691 m!16364))

(declare-fun m!16390 () Bool)

(assert (=> bm!1707 m!16390))

(assert (=> bm!1562 d!3917))

(declare-fun d!3919 () Bool)

(assert (=> d!3919 (= (valid!106 (_3!3 lt!7453)) (valid!109 (v!1581 (underlying!106 (_3!3 lt!7453)))))))

(declare-fun bs!936 () Bool)

(assert (= bs!936 d!3919))

(declare-fun m!16392 () Bool)

(assert (=> bs!936 m!16392))

(assert (=> b!22234 d!3919))

(declare-fun d!3921 () Bool)

(assert (=> d!3921 (= (array_inv!409 (_keys!3154 (v!1581 (underlying!106 thiss!938)))) (bvsge (size!675 (_keys!3154 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!22229 d!3921))

(declare-fun d!3923 () Bool)

(assert (=> d!3923 (= (array_inv!410 (_values!1719 (v!1581 (underlying!106 thiss!938)))) (bvsge (size!674 (_values!1719 (v!1581 (underlying!106 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!22229 d!3923))

(declare-fun b!22572 () Bool)

(declare-fun e!14631 () Bool)

(assert (=> b!22572 (= e!14631 tp_is_empty!1003)))

(declare-fun mapIsEmpty!998 () Bool)

(declare-fun mapRes!998 () Bool)

(assert (=> mapIsEmpty!998 mapRes!998))

(declare-fun condMapEmpty!998 () Bool)

(declare-fun mapDefault!998 () ValueCell!302)

(assert (=> mapNonEmpty!989 (= condMapEmpty!998 (= mapRest!989 ((as const (Array (_ BitVec 32) ValueCell!302)) mapDefault!998)))))

(assert (=> mapNonEmpty!989 (= tp!3457 (and e!14631 mapRes!998))))

(declare-fun mapNonEmpty!998 () Bool)

(declare-fun tp!3473 () Bool)

(declare-fun e!14630 () Bool)

(assert (=> mapNonEmpty!998 (= mapRes!998 (and tp!3473 e!14630))))

(declare-fun mapKey!998 () (_ BitVec 32))

(declare-fun mapRest!998 () (Array (_ BitVec 32) ValueCell!302))

(declare-fun mapValue!998 () ValueCell!302)

(assert (=> mapNonEmpty!998 (= mapRest!989 (store mapRest!998 mapKey!998 mapValue!998))))

(declare-fun b!22571 () Bool)

(assert (=> b!22571 (= e!14630 tp_is_empty!1003)))

(assert (= (and mapNonEmpty!989 condMapEmpty!998) mapIsEmpty!998))

(assert (= (and mapNonEmpty!989 (not condMapEmpty!998)) mapNonEmpty!998))

(assert (= (and mapNonEmpty!998 ((_ is ValueCellFull!302) mapValue!998)) b!22571))

(assert (= (and mapNonEmpty!989 ((_ is ValueCellFull!302) mapDefault!998)) b!22572))

(declare-fun m!16394 () Bool)

(assert (=> mapNonEmpty!998 m!16394))

(declare-fun b_lambda!1549 () Bool)

(assert (= b_lambda!1545 (or (and b!22229 b_free!739) b_lambda!1549)))

(declare-fun b_lambda!1551 () Bool)

(assert (= b_lambda!1543 (or (and b!22229 b_free!739) b_lambda!1551)))

(declare-fun b_lambda!1553 () Bool)

(assert (= b_lambda!1547 (or (and b!22229 b_free!739) b_lambda!1553)))

(check-sat (not b!22480) (not b!22517) b_and!1455 (not bm!1698) (not bm!1685) (not d!3911) (not bm!1625) (not mapNonEmpty!998) (not b!22419) (not bm!1682) (not b!22531) (not d!3907) (not b!22470) (not b!22511) (not d!3909) tp_is_empty!1003 (not bm!1680) (not b!22427) (not b_lambda!1551) (not bm!1626) (not bm!1629) (not bm!1683) (not b!22538) (not b!22512) (not d!3915) (not b!22448) (not bm!1675) (not bm!1674) (not bm!1630) (not bm!1700) (not bm!1631) (not d!3913) (not bm!1705) (not bm!1637) (not b!22469) (not bm!1707) (not bm!1692) (not bm!1636) (not b!22420) (not bm!1679) (not b!22449) (not bm!1697) (not bm!1691) (not bm!1688) (not bm!1634) (not bm!1673) (not d!3917) (not bm!1678) (not bm!1699) (not bm!1644) (not b!22514) (not bm!1635) (not b!22524) (not bm!1694) (not bm!1686) (not bm!1642) (not b!22559) (not d!3919) (not b!22533) (not b!22468) (not b!22530) (not bm!1693) (not bm!1681) (not bm!1677) (not b_lambda!1553) (not bm!1623) (not bm!1676) (not b!22422) (not bm!1684) (not bm!1689) (not bm!1628) (not b_lambda!1549) (not b!22560) (not b_next!739))
(check-sat b_and!1455 (not b_next!739))
