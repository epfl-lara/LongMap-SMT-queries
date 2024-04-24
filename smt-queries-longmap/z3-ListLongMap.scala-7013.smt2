; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89304 () Bool)

(assert start!89304)

(declare-fun b!1022563 () Bool)

(declare-fun b_free!20131 () Bool)

(declare-fun b_next!20131 () Bool)

(assert (=> b!1022563 (= b_free!20131 (not b_next!20131))))

(declare-fun tp!71421 () Bool)

(declare-fun b_and!32329 () Bool)

(assert (=> b!1022563 (= tp!71421 b_and!32329)))

(declare-fun e!575977 () Bool)

(declare-datatypes ((V!36675 0))(
  ( (V!36676 (val!11976 Int)) )
))
(declare-datatypes ((tuple2!15488 0))(
  ( (tuple2!15489 (_1!7755 (_ BitVec 64)) (_2!7755 V!36675)) )
))
(declare-datatypes ((List!21639 0))(
  ( (Nil!21636) (Cons!21635 (h!22842 tuple2!15488) (t!30641 List!21639)) )
))
(declare-datatypes ((ListLongMap!13637 0))(
  ( (ListLongMap!13638 (toList!6834 List!21639)) )
))
(declare-fun call!43255 () ListLongMap!13637)

(declare-fun call!43254 () ListLongMap!13637)

(declare-fun b!1022561 () Bool)

(declare-fun key!697 () (_ BitVec 64))

(declare-fun -!458 (ListLongMap!13637 (_ BitVec 64)) ListLongMap!13637)

(assert (=> b!1022561 (= e!575977 (not (= call!43255 (-!458 call!43254 key!697))))))

(declare-fun mapIsEmpty!37188 () Bool)

(declare-fun mapRes!37188 () Bool)

(assert (=> mapIsEmpty!37188 mapRes!37188))

(declare-fun b!1022562 () Bool)

(declare-fun e!575971 () Bool)

(declare-fun e!575978 () Bool)

(assert (=> b!1022562 (= e!575971 (and e!575978 mapRes!37188))))

(declare-fun condMapEmpty!37188 () Bool)

(declare-datatypes ((array!63791 0))(
  ( (array!63792 (arr!30703 (Array (_ BitVec 32) (_ BitVec 64))) (size!31215 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11222 0))(
  ( (ValueCellFull!11222 (v!14535 V!36675)) (EmptyCell!11222) )
))
(declare-datatypes ((array!63793 0))(
  ( (array!63794 (arr!30704 (Array (_ BitVec 32) ValueCell!11222)) (size!31216 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5038 0))(
  ( (LongMapFixedSize!5039 (defaultEntry!5871 Int) (mask!29498 (_ BitVec 32)) (extraKeys!5603 (_ BitVec 32)) (zeroValue!5707 V!36675) (minValue!5707 V!36675) (_size!2574 (_ BitVec 32)) (_keys!11054 array!63791) (_values!5894 array!63793) (_vacant!2574 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1112 0))(
  ( (Cell!1113 (v!14536 LongMapFixedSize!5038)) )
))
(declare-datatypes ((LongMap!1112 0))(
  ( (LongMap!1113 (underlying!567 Cell!1112)) )
))
(declare-fun thiss!908 () LongMap!1112)

(declare-fun mapDefault!37188 () ValueCell!11222)

(assert (=> b!1022562 (= condMapEmpty!37188 (= (arr!30704 (_values!5894 (v!14536 (underlying!567 thiss!908)))) ((as const (Array (_ BitVec 32) ValueCell!11222)) mapDefault!37188)))))

(declare-fun b!1022564 () Bool)

(assert (=> b!1022564 (= e!575977 (not (= call!43254 call!43255)))))

(declare-fun b!1022565 () Bool)

(declare-fun tp_is_empty!23851 () Bool)

(assert (=> b!1022565 (= e!575978 tp_is_empty!23851)))

(declare-fun b!1022566 () Bool)

(declare-fun e!575975 () Bool)

(declare-fun e!575972 () Bool)

(assert (=> b!1022566 (= e!575975 e!575972)))

(declare-fun res!684863 () Bool)

(assert (=> b!1022566 (=> res!684863 e!575972)))

(declare-fun lt!450517 () LongMap!1112)

(declare-fun valid!1925 (LongMap!1112) Bool)

(assert (=> b!1022566 (= res!684863 (not (valid!1925 lt!450517)))))

(declare-datatypes ((tuple2!15490 0))(
  ( (tuple2!15491 (_1!7756 Bool) (_2!7756 LongMapFixedSize!5038)) )
))
(declare-fun lt!450518 () tuple2!15490)

(assert (=> b!1022566 (= lt!450517 (LongMap!1113 (Cell!1113 (_2!7756 lt!450518))))))

(declare-fun remove!10 (LongMapFixedSize!5038 (_ BitVec 64)) tuple2!15490)

(assert (=> b!1022566 (= lt!450518 (remove!10 (v!14536 (underlying!567 thiss!908)) key!697))))

(declare-fun bm!43251 () Bool)

(declare-fun c!103929 () Bool)

(declare-fun map!14460 (LongMap!1112) ListLongMap!13637)

(assert (=> bm!43251 (= call!43254 (map!14460 (ite c!103929 thiss!908 lt!450517)))))

(declare-fun b!1022567 () Bool)

(declare-fun e!575976 () Bool)

(assert (=> b!1022567 (= e!575976 tp_is_empty!23851)))

(declare-fun b!1022568 () Bool)

(declare-fun e!575979 () Bool)

(declare-fun e!575973 () Bool)

(assert (=> b!1022568 (= e!575979 e!575973)))

(declare-fun b!1022569 () Bool)

(declare-fun e!575974 () Bool)

(assert (=> b!1022569 (= e!575974 e!575979)))

(declare-fun b!1022570 () Bool)

(assert (=> b!1022570 (= e!575972 e!575977)))

(assert (=> b!1022570 (= c!103929 (_1!7756 lt!450518))))

(declare-fun array_inv!23829 (array!63791) Bool)

(declare-fun array_inv!23830 (array!63793) Bool)

(assert (=> b!1022563 (= e!575973 (and tp!71421 tp_is_empty!23851 (array_inv!23829 (_keys!11054 (v!14536 (underlying!567 thiss!908)))) (array_inv!23830 (_values!5894 (v!14536 (underlying!567 thiss!908)))) e!575971))))

(declare-fun res!684862 () Bool)

(assert (=> start!89304 (=> (not res!684862) (not e!575975))))

(assert (=> start!89304 (= res!684862 (valid!1925 thiss!908))))

(assert (=> start!89304 e!575975))

(assert (=> start!89304 e!575974))

(assert (=> start!89304 true))

(declare-fun bm!43252 () Bool)

(assert (=> bm!43252 (= call!43255 (map!14460 (ite c!103929 lt!450517 thiss!908)))))

(declare-fun mapNonEmpty!37188 () Bool)

(declare-fun tp!71422 () Bool)

(assert (=> mapNonEmpty!37188 (= mapRes!37188 (and tp!71422 e!575976))))

(declare-fun mapKey!37188 () (_ BitVec 32))

(declare-fun mapRest!37188 () (Array (_ BitVec 32) ValueCell!11222))

(declare-fun mapValue!37188 () ValueCell!11222)

(assert (=> mapNonEmpty!37188 (= (arr!30704 (_values!5894 (v!14536 (underlying!567 thiss!908)))) (store mapRest!37188 mapKey!37188 mapValue!37188))))

(assert (= (and start!89304 res!684862) b!1022566))

(assert (= (and b!1022566 (not res!684863)) b!1022570))

(assert (= (and b!1022570 c!103929) b!1022561))

(assert (= (and b!1022570 (not c!103929)) b!1022564))

(assert (= (or b!1022561 b!1022564) bm!43252))

(assert (= (or b!1022561 b!1022564) bm!43251))

(assert (= (and b!1022562 condMapEmpty!37188) mapIsEmpty!37188))

(assert (= (and b!1022562 (not condMapEmpty!37188)) mapNonEmpty!37188))

(get-info :version)

(assert (= (and mapNonEmpty!37188 ((_ is ValueCellFull!11222) mapValue!37188)) b!1022567))

(assert (= (and b!1022562 ((_ is ValueCellFull!11222) mapDefault!37188)) b!1022565))

(assert (= b!1022563 b!1022562))

(assert (= b!1022568 b!1022563))

(assert (= b!1022569 b!1022568))

(assert (= start!89304 b!1022569))

(declare-fun m!942481 () Bool)

(assert (=> mapNonEmpty!37188 m!942481))

(declare-fun m!942483 () Bool)

(assert (=> b!1022566 m!942483))

(declare-fun m!942485 () Bool)

(assert (=> b!1022566 m!942485))

(declare-fun m!942487 () Bool)

(assert (=> start!89304 m!942487))

(declare-fun m!942489 () Bool)

(assert (=> b!1022561 m!942489))

(declare-fun m!942491 () Bool)

(assert (=> bm!43251 m!942491))

(declare-fun m!942493 () Bool)

(assert (=> b!1022563 m!942493))

(declare-fun m!942495 () Bool)

(assert (=> b!1022563 m!942495))

(declare-fun m!942497 () Bool)

(assert (=> bm!43252 m!942497))

(check-sat (not bm!43252) (not b_next!20131) b_and!32329 (not b!1022563) (not b!1022566) (not bm!43251) (not start!89304) (not mapNonEmpty!37188) tp_is_empty!23851 (not b!1022561))
(check-sat b_and!32329 (not b_next!20131))
(get-model)

(declare-fun d!122957 () Bool)

(declare-fun lt!450533 () ListLongMap!13637)

(declare-fun contains!5963 (ListLongMap!13637 (_ BitVec 64)) Bool)

(assert (=> d!122957 (not (contains!5963 lt!450533 key!697))))

(declare-fun removeStrictlySorted!47 (List!21639 (_ BitVec 64)) List!21639)

(assert (=> d!122957 (= lt!450533 (ListLongMap!13638 (removeStrictlySorted!47 (toList!6834 call!43254) key!697)))))

(assert (=> d!122957 (= (-!458 call!43254 key!697) lt!450533)))

(declare-fun bs!29785 () Bool)

(assert (= bs!29785 d!122957))

(declare-fun m!942535 () Bool)

(assert (=> bs!29785 m!942535))

(declare-fun m!942537 () Bool)

(assert (=> bs!29785 m!942537))

(assert (=> b!1022561 d!122957))

(declare-fun d!122959 () Bool)

(declare-fun valid!1926 (LongMapFixedSize!5038) Bool)

(assert (=> d!122959 (= (valid!1925 lt!450517) (valid!1926 (v!14536 (underlying!567 lt!450517))))))

(declare-fun bs!29786 () Bool)

(assert (= bs!29786 d!122959))

(declare-fun m!942539 () Bool)

(assert (=> bs!29786 m!942539))

(assert (=> b!1022566 d!122959))

(declare-fun bm!43281 () Bool)

(declare-fun call!43285 () ListLongMap!13637)

(declare-fun map!14462 (LongMapFixedSize!5038) ListLongMap!13637)

(assert (=> bm!43281 (= call!43285 (map!14462 (v!14536 (underlying!567 thiss!908))))))

(declare-fun b!1022661 () Bool)

(declare-fun e!576061 () Bool)

(declare-datatypes ((Unit!33306 0))(
  ( (Unit!33307) )
))
(declare-datatypes ((tuple2!15494 0))(
  ( (tuple2!15495 (_1!7758 Unit!33306) (_2!7758 LongMapFixedSize!5038)) )
))
(declare-fun lt!450613 () tuple2!15494)

(declare-fun arrayContainsKey!0 (array!63791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1022661 (= e!576061 (arrayContainsKey!0 (_keys!11054 (_2!7758 lt!450613)) key!697 #b00000000000000000000000000000000))))

(declare-fun e!576056 () Bool)

(declare-fun call!43288 () ListLongMap!13637)

(declare-fun b!1022662 () Bool)

(assert (=> b!1022662 (= e!576056 (= call!43288 (-!458 call!43285 key!697)))))

(declare-fun b!1022663 () Bool)

(assert (=> b!1022663 (= e!576056 (= call!43288 call!43285))))

(declare-fun b!1022664 () Bool)

(declare-fun e!576062 () tuple2!15490)

(declare-fun e!576063 () tuple2!15490)

(assert (=> b!1022664 (= e!576062 e!576063)))

(declare-datatypes ((SeekEntryResult!9541 0))(
  ( (MissingZero!9541 (index!40535 (_ BitVec 32))) (Found!9541 (index!40536 (_ BitVec 32))) (Intermediate!9541 (undefined!10353 Bool) (index!40537 (_ BitVec 32)) (x!90645 (_ BitVec 32))) (Undefined!9541) (MissingVacant!9541 (index!40538 (_ BitVec 32))) )
))
(declare-fun lt!450618 () SeekEntryResult!9541)

(declare-fun seekEntry!0 ((_ BitVec 64) array!63791 (_ BitVec 32)) SeekEntryResult!9541)

(assert (=> b!1022664 (= lt!450618 (seekEntry!0 key!697 (_keys!11054 (v!14536 (underlying!567 thiss!908))) (mask!29498 (v!14536 (underlying!567 thiss!908)))))))

(declare-fun c!103951 () Bool)

(assert (=> b!1022664 (= c!103951 ((_ is Found!9541) lt!450618))))

(declare-fun d!122961 () Bool)

(declare-fun e!576057 () Bool)

(assert (=> d!122961 e!576057))

(declare-fun res!684878 () Bool)

(assert (=> d!122961 (=> (not res!684878) (not e!576057))))

(declare-fun lt!450597 () tuple2!15490)

(assert (=> d!122961 (= res!684878 (valid!1926 (_2!7756 lt!450597)))))

(assert (=> d!122961 (= lt!450597 e!576062)))

(declare-fun c!103956 () Bool)

(assert (=> d!122961 (= c!103956 (= key!697 (bvneg key!697)))))

(assert (=> d!122961 (valid!1926 (v!14536 (underlying!567 thiss!908)))))

(assert (=> d!122961 (= (remove!10 (v!14536 (underlying!567 thiss!908)) key!697) lt!450597)))

(declare-fun b!1022665 () Bool)

(declare-fun lt!450605 () Unit!33306)

(declare-fun lt!450608 () Unit!33306)

(assert (=> b!1022665 (= lt!450605 lt!450608)))

(declare-fun call!43286 () ListLongMap!13637)

(declare-fun call!43291 () ListLongMap!13637)

(assert (=> b!1022665 (= call!43286 call!43291)))

(declare-fun lt!450595 () V!36675)

(declare-fun lt!450599 () (_ BitVec 32))

(declare-fun lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!1 (array!63791 array!63793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36675 V!36675 V!36675 Int) Unit!33306)

(assert (=> b!1022665 (= lt!450608 (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!1 (_keys!11054 (v!14536 (underlying!567 thiss!908))) (_values!5894 (v!14536 (underlying!567 thiss!908))) (mask!29498 (v!14536 (underlying!567 thiss!908))) (extraKeys!5603 (v!14536 (underlying!567 thiss!908))) lt!450599 (zeroValue!5707 (v!14536 (underlying!567 thiss!908))) (minValue!5707 (v!14536 (underlying!567 thiss!908))) lt!450595 (defaultEntry!5871 (v!14536 (underlying!567 thiss!908)))))))

(declare-fun dynLambda!1952 (Int (_ BitVec 64)) V!36675)

(assert (=> b!1022665 (= lt!450595 (dynLambda!1952 (defaultEntry!5871 (v!14536 (underlying!567 thiss!908))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1022665 (= lt!450599 (bvand (extraKeys!5603 (v!14536 (underlying!567 thiss!908))) #b00000000000000000000000000000001))))

(declare-fun e!576059 () tuple2!15490)

(assert (=> b!1022665 (= e!576059 (tuple2!15491 true (LongMapFixedSize!5039 (defaultEntry!5871 (v!14536 (underlying!567 thiss!908))) (mask!29498 (v!14536 (underlying!567 thiss!908))) (bvand (extraKeys!5603 (v!14536 (underlying!567 thiss!908))) #b00000000000000000000000000000001) (zeroValue!5707 (v!14536 (underlying!567 thiss!908))) (dynLambda!1952 (defaultEntry!5871 (v!14536 (underlying!567 thiss!908))) #b1000000000000000000000000000000000000000000000000000000000000000) (_size!2574 (v!14536 (underlying!567 thiss!908))) (_keys!11054 (v!14536 (underlying!567 thiss!908))) (_values!5894 (v!14536 (underlying!567 thiss!908))) (_vacant!2574 (v!14536 (underlying!567 thiss!908))))))))

(declare-fun c!103953 () Bool)

(declare-fun bm!43282 () Bool)

(declare-fun call!43287 () ListLongMap!13637)

(declare-fun getCurrentListMap!3881 (array!63791 array!63793 (_ BitVec 32) (_ BitVec 32) V!36675 V!36675 (_ BitVec 32) Int) ListLongMap!13637)

(assert (=> bm!43282 (= call!43287 (getCurrentListMap!3881 (_keys!11054 (v!14536 (underlying!567 thiss!908))) (_values!5894 (v!14536 (underlying!567 thiss!908))) (mask!29498 (v!14536 (underlying!567 thiss!908))) (ite c!103956 (ite c!103953 (extraKeys!5603 (v!14536 (underlying!567 thiss!908))) lt!450599) (extraKeys!5603 (v!14536 (underlying!567 thiss!908)))) (zeroValue!5707 (v!14536 (underlying!567 thiss!908))) (ite c!103956 (ite c!103953 (minValue!5707 (v!14536 (underlying!567 thiss!908))) lt!450595) (minValue!5707 (v!14536 (underlying!567 thiss!908)))) #b00000000000000000000000000000000 (defaultEntry!5871 (v!14536 (underlying!567 thiss!908)))))))

(declare-fun lt!450602 () (_ BitVec 32))

(declare-fun bm!43283 () Bool)

(declare-fun call!43289 () ListLongMap!13637)

(declare-fun lt!450606 () V!36675)

(assert (=> bm!43283 (= call!43289 (getCurrentListMap!3881 (ite c!103956 (_keys!11054 (v!14536 (underlying!567 thiss!908))) (_keys!11054 (_2!7758 lt!450613))) (ite c!103956 (_values!5894 (v!14536 (underlying!567 thiss!908))) (_values!5894 (_2!7758 lt!450613))) (ite c!103956 (mask!29498 (v!14536 (underlying!567 thiss!908))) (mask!29498 (_2!7758 lt!450613))) (ite c!103956 (ite c!103953 lt!450602 (extraKeys!5603 (v!14536 (underlying!567 thiss!908)))) (extraKeys!5603 (_2!7758 lt!450613))) (ite c!103956 (ite c!103953 lt!450606 (zeroValue!5707 (v!14536 (underlying!567 thiss!908)))) (zeroValue!5707 (_2!7758 lt!450613))) (ite c!103956 (minValue!5707 (v!14536 (underlying!567 thiss!908))) (minValue!5707 (_2!7758 lt!450613))) #b00000000000000000000000000000000 (ite c!103956 (defaultEntry!5871 (v!14536 (underlying!567 thiss!908))) (defaultEntry!5871 (_2!7758 lt!450613)))))))

(declare-fun bm!43284 () Bool)

(declare-fun call!43290 () ListLongMap!13637)

(assert (=> bm!43284 (= call!43286 call!43290)))

(declare-fun b!1022666 () Bool)

(assert (=> b!1022666 (= e!576062 e!576059)))

(assert (=> b!1022666 (= c!103953 (= key!697 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43285 () Bool)

(assert (=> bm!43285 (= call!43291 call!43287)))

(declare-fun b!1022667 () Bool)

(declare-fun e!576058 () tuple2!15494)

(declare-fun Unit!33308 () Unit!33306)

(assert (=> b!1022667 (= e!576058 (tuple2!15495 Unit!33308 (LongMapFixedSize!5039 (defaultEntry!5871 (v!14536 (underlying!567 thiss!908))) (mask!29498 (v!14536 (underlying!567 thiss!908))) (extraKeys!5603 (v!14536 (underlying!567 thiss!908))) (zeroValue!5707 (v!14536 (underlying!567 thiss!908))) (minValue!5707 (v!14536 (underlying!567 thiss!908))) (bvsub (_size!2574 (v!14536 (underlying!567 thiss!908))) #b00000000000000000000000000000001) (array!63792 (store (arr!30703 (_keys!11054 (v!14536 (underlying!567 thiss!908)))) (index!40536 lt!450618) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31215 (_keys!11054 (v!14536 (underlying!567 thiss!908))))) (array!63794 (store (arr!30704 (_values!5894 (v!14536 (underlying!567 thiss!908)))) (index!40536 lt!450618) (ValueCellFull!11222 (dynLambda!1952 (defaultEntry!5871 (v!14536 (underlying!567 thiss!908))) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31216 (_values!5894 (v!14536 (underlying!567 thiss!908))))) (_vacant!2574 (v!14536 (underlying!567 thiss!908))))))))

(declare-fun b!1022668 () Bool)

(assert (=> b!1022668 (= e!576063 (tuple2!15491 false (v!14536 (underlying!567 thiss!908))))))

(declare-fun b!1022669 () Bool)

(assert (=> b!1022669 (= e!576061 (ite (= key!697 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5603 (_2!7758 lt!450613)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5603 (_2!7758 lt!450613)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!43286 () Bool)

(declare-fun call!43284 () ListLongMap!13637)

(assert (=> bm!43286 (= call!43290 (-!458 (ite c!103956 (ite c!103953 call!43291 call!43284) call!43287) (ite c!103956 (ite c!103953 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) key!697)))))

(declare-fun bm!43287 () Bool)

(assert (=> bm!43287 (= call!43284 call!43289)))

(declare-fun b!1022670 () Bool)

(declare-fun lt!450592 () Unit!33306)

(declare-fun e!576060 () Unit!33306)

(assert (=> b!1022670 (= lt!450592 e!576060)))

(declare-fun c!103950 () Bool)

(assert (=> b!1022670 (= c!103950 (contains!5963 call!43289 key!697))))

(assert (=> b!1022670 (= lt!450613 e!576058)))

(declare-fun c!103952 () Bool)

(declare-fun lt!450617 () (_ BitVec 32))

(assert (=> b!1022670 (= c!103952 (bvsgt lt!450617 #b00000000000000000000000000000000))))

(assert (=> b!1022670 (= lt!450617 (bvadd (_vacant!2574 (v!14536 (underlying!567 thiss!908))) #b00000000000000000000000000000001))))

(declare-fun lt!450616 () Unit!33306)

(declare-fun lt!450598 () Unit!33306)

(assert (=> b!1022670 (= lt!450616 lt!450598)))

(assert (=> b!1022670 (= call!43290 (getCurrentListMap!3881 (array!63792 (store (arr!30703 (_keys!11054 (v!14536 (underlying!567 thiss!908)))) (index!40536 lt!450618) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31215 (_keys!11054 (v!14536 (underlying!567 thiss!908))))) (array!63794 (store (arr!30704 (_values!5894 (v!14536 (underlying!567 thiss!908)))) (index!40536 lt!450618) (ValueCellFull!11222 (dynLambda!1952 (defaultEntry!5871 (v!14536 (underlying!567 thiss!908))) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31216 (_values!5894 (v!14536 (underlying!567 thiss!908))))) (mask!29498 (v!14536 (underlying!567 thiss!908))) (extraKeys!5603 (v!14536 (underlying!567 thiss!908))) (zeroValue!5707 (v!14536 (underlying!567 thiss!908))) (minValue!5707 (v!14536 (underlying!567 thiss!908))) #b00000000000000000000000000000000 (defaultEntry!5871 (v!14536 (underlying!567 thiss!908)))))))

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!1 (array!63791 array!63793 (_ BitVec 32) (_ BitVec 32) V!36675 V!36675 (_ BitVec 32) (_ BitVec 64) Int) Unit!33306)

(assert (=> b!1022670 (= lt!450598 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!1 (_keys!11054 (v!14536 (underlying!567 thiss!908))) (_values!5894 (v!14536 (underlying!567 thiss!908))) (mask!29498 (v!14536 (underlying!567 thiss!908))) (extraKeys!5603 (v!14536 (underlying!567 thiss!908))) (zeroValue!5707 (v!14536 (underlying!567 thiss!908))) (minValue!5707 (v!14536 (underlying!567 thiss!908))) (index!40536 lt!450618) key!697 (defaultEntry!5871 (v!14536 (underlying!567 thiss!908)))))))

(declare-fun lt!450601 () Unit!33306)

(declare-fun lt!450612 () Unit!33306)

(assert (=> b!1022670 (= lt!450601 lt!450612)))

(assert (=> b!1022670 (not (arrayContainsKey!0 (array!63792 (store (arr!30703 (_keys!11054 (v!14536 (underlying!567 thiss!908)))) (index!40536 lt!450618) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31215 (_keys!11054 (v!14536 (underlying!567 thiss!908))))) key!697 #b00000000000000000000000000000000))))

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!63791 (_ BitVec 32) (_ BitVec 64)) Unit!33306)

(assert (=> b!1022670 (= lt!450612 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11054 (v!14536 (underlying!567 thiss!908))) (index!40536 lt!450618) key!697))))

(declare-fun lt!450594 () Unit!33306)

(declare-fun lt!450607 () Unit!33306)

(assert (=> b!1022670 (= lt!450594 lt!450607)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63791 (_ BitVec 32)) Bool)

(assert (=> b!1022670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!63792 (store (arr!30703 (_keys!11054 (v!14536 (underlying!567 thiss!908)))) (index!40536 lt!450618) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31215 (_keys!11054 (v!14536 (underlying!567 thiss!908))))) (mask!29498 (v!14536 (underlying!567 thiss!908))))))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!63791 (_ BitVec 32) (_ BitVec 32)) Unit!33306)

(assert (=> b!1022670 (= lt!450607 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11054 (v!14536 (underlying!567 thiss!908))) (index!40536 lt!450618) (mask!29498 (v!14536 (underlying!567 thiss!908)))))))

(declare-fun lt!450596 () Unit!33306)

(declare-fun lt!450614 () Unit!33306)

(assert (=> b!1022670 (= lt!450596 lt!450614)))

(declare-fun lt!450619 () (_ BitVec 32))

(declare-fun lt!450604 () (_ BitVec 64))

(declare-datatypes ((List!21641 0))(
  ( (Nil!21638) (Cons!21637 (h!22844 (_ BitVec 64)) (t!30647 List!21641)) )
))
(declare-fun lt!450615 () List!21641)

(declare-fun arrayNoDuplicates!0 (array!63791 (_ BitVec 32) List!21641) Bool)

(assert (=> b!1022670 (arrayNoDuplicates!0 (array!63792 (store (arr!30703 (_keys!11054 (v!14536 (underlying!567 thiss!908)))) (index!40536 lt!450618) lt!450604) (size!31215 (_keys!11054 (v!14536 (underlying!567 thiss!908))))) lt!450619 lt!450615)))

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!63791 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21641) Unit!33306)

(assert (=> b!1022670 (= lt!450614 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11054 (v!14536 (underlying!567 thiss!908))) lt!450604 (index!40536 lt!450618) lt!450619 lt!450615))))

(assert (=> b!1022670 (= lt!450615 Nil!21638)))

(assert (=> b!1022670 (= lt!450619 #b00000000000000000000000000000000)))

(assert (=> b!1022670 (= lt!450604 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!450603 () Unit!33306)

(declare-fun lt!450610 () Unit!33306)

(assert (=> b!1022670 (= lt!450603 lt!450610)))

(declare-fun lt!450611 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!63791 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1022670 (= (arrayCountValidKeys!0 (array!63792 (store (arr!30703 (_keys!11054 (v!14536 (underlying!567 thiss!908)))) (index!40536 lt!450618) lt!450611) (size!31215 (_keys!11054 (v!14536 (underlying!567 thiss!908))))) #b00000000000000000000000000000000 (size!31215 (_keys!11054 (v!14536 (underlying!567 thiss!908))))) (bvsub (arrayCountValidKeys!0 (_keys!11054 (v!14536 (underlying!567 thiss!908))) #b00000000000000000000000000000000 (size!31215 (_keys!11054 (v!14536 (underlying!567 thiss!908))))) #b00000000000000000000000000000001))))

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!63791 (_ BitVec 32) (_ BitVec 64)) Unit!33306)

(assert (=> b!1022670 (= lt!450610 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11054 (v!14536 (underlying!567 thiss!908))) (index!40536 lt!450618) lt!450611))))

(assert (=> b!1022670 (= lt!450611 #b1000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1022670 (= e!576063 (tuple2!15491 true (_2!7758 lt!450613)))))

(declare-fun b!1022671 () Bool)

(declare-fun lt!450600 () Unit!33306)

(declare-fun lt!450620 () Unit!33306)

(assert (=> b!1022671 (= lt!450600 lt!450620)))

(assert (=> b!1022671 (= call!43286 call!43284)))

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!1 (array!63791 array!63793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36675 V!36675 V!36675 Int) Unit!33306)

(assert (=> b!1022671 (= lt!450620 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!1 (_keys!11054 (v!14536 (underlying!567 thiss!908))) (_values!5894 (v!14536 (underlying!567 thiss!908))) (mask!29498 (v!14536 (underlying!567 thiss!908))) (extraKeys!5603 (v!14536 (underlying!567 thiss!908))) lt!450602 (zeroValue!5707 (v!14536 (underlying!567 thiss!908))) lt!450606 (minValue!5707 (v!14536 (underlying!567 thiss!908))) (defaultEntry!5871 (v!14536 (underlying!567 thiss!908)))))))

(assert (=> b!1022671 (= lt!450606 (dynLambda!1952 (defaultEntry!5871 (v!14536 (underlying!567 thiss!908))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1022671 (= lt!450602 (bvand (extraKeys!5603 (v!14536 (underlying!567 thiss!908))) #b00000000000000000000000000000010))))

(assert (=> b!1022671 (= e!576059 (tuple2!15491 true (LongMapFixedSize!5039 (defaultEntry!5871 (v!14536 (underlying!567 thiss!908))) (mask!29498 (v!14536 (underlying!567 thiss!908))) (bvand (extraKeys!5603 (v!14536 (underlying!567 thiss!908))) #b00000000000000000000000000000010) (dynLambda!1952 (defaultEntry!5871 (v!14536 (underlying!567 thiss!908))) #b0000000000000000000000000000000000000000000000000000000000000000) (minValue!5707 (v!14536 (underlying!567 thiss!908))) (_size!2574 (v!14536 (underlying!567 thiss!908))) (_keys!11054 (v!14536 (underlying!567 thiss!908))) (_values!5894 (v!14536 (underlying!567 thiss!908))) (_vacant!2574 (v!14536 (underlying!567 thiss!908))))))))

(declare-fun b!1022672 () Bool)

(declare-fun Unit!33309 () Unit!33306)

(assert (=> b!1022672 (= e!576060 Unit!33309)))

(declare-fun lt!450609 () Unit!33306)

(declare-fun lemmaKeyInListMapIsInArray!340 (array!63791 array!63793 (_ BitVec 32) (_ BitVec 32) V!36675 V!36675 (_ BitVec 64) Int) Unit!33306)

(assert (=> b!1022672 (= lt!450609 (lemmaKeyInListMapIsInArray!340 (_keys!11054 (_2!7758 lt!450613)) (_values!5894 (_2!7758 lt!450613)) (mask!29498 (_2!7758 lt!450613)) (extraKeys!5603 (_2!7758 lt!450613)) (zeroValue!5707 (_2!7758 lt!450613)) (minValue!5707 (_2!7758 lt!450613)) key!697 (defaultEntry!5871 (_2!7758 lt!450613))))))

(declare-fun c!103955 () Bool)

(assert (=> b!1022672 (= c!103955 (and (not (= key!697 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!697 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1022672 e!576061))

(declare-fun lt!450593 () Unit!33306)

(assert (=> b!1022672 (= lt!450593 lt!450609)))

(assert (=> b!1022672 false))

(declare-fun bm!43288 () Bool)

(assert (=> bm!43288 (= call!43288 (map!14462 (_2!7756 lt!450597)))))

(declare-fun b!1022673 () Bool)

(assert (=> b!1022673 (= e!576057 e!576056)))

(declare-fun c!103954 () Bool)

(assert (=> b!1022673 (= c!103954 (_1!7756 lt!450597))))

(declare-fun b!1022674 () Bool)

(declare-fun Unit!33310 () Unit!33306)

(assert (=> b!1022674 (= e!576058 (tuple2!15495 Unit!33310 (LongMapFixedSize!5039 (defaultEntry!5871 (v!14536 (underlying!567 thiss!908))) (mask!29498 (v!14536 (underlying!567 thiss!908))) (extraKeys!5603 (v!14536 (underlying!567 thiss!908))) (zeroValue!5707 (v!14536 (underlying!567 thiss!908))) (minValue!5707 (v!14536 (underlying!567 thiss!908))) (bvsub (_size!2574 (v!14536 (underlying!567 thiss!908))) #b00000000000000000000000000000001) (array!63792 (store (arr!30703 (_keys!11054 (v!14536 (underlying!567 thiss!908)))) (index!40536 lt!450618) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31215 (_keys!11054 (v!14536 (underlying!567 thiss!908))))) (array!63794 (store (arr!30704 (_values!5894 (v!14536 (underlying!567 thiss!908)))) (index!40536 lt!450618) (ValueCellFull!11222 (dynLambda!1952 (defaultEntry!5871 (v!14536 (underlying!567 thiss!908))) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31216 (_values!5894 (v!14536 (underlying!567 thiss!908))))) lt!450617)))))

(declare-fun b!1022675 () Bool)

(declare-fun Unit!33311 () Unit!33306)

(assert (=> b!1022675 (= e!576060 Unit!33311)))

(assert (= (and d!122961 c!103956) b!1022666))

(assert (= (and d!122961 (not c!103956)) b!1022664))

(assert (= (and b!1022666 c!103953) b!1022671))

(assert (= (and b!1022666 (not c!103953)) b!1022665))

(assert (= (or b!1022671 b!1022665) bm!43287))

(assert (= (or b!1022671 b!1022665) bm!43285))

(assert (= (or b!1022671 b!1022665) bm!43284))

(assert (= (and b!1022664 c!103951) b!1022670))

(assert (= (and b!1022664 (not c!103951)) b!1022668))

(assert (= (and b!1022670 c!103952) b!1022674))

(assert (= (and b!1022670 (not c!103952)) b!1022667))

(assert (= (and b!1022670 c!103950) b!1022672))

(assert (= (and b!1022670 (not c!103950)) b!1022675))

(assert (= (and b!1022672 c!103955) b!1022661))

(assert (= (and b!1022672 (not c!103955)) b!1022669))

(assert (= (or bm!43287 b!1022670) bm!43283))

(assert (= (or bm!43285 b!1022670) bm!43282))

(assert (= (or bm!43284 b!1022670) bm!43286))

(assert (= (and d!122961 res!684878) b!1022673))

(assert (= (and b!1022673 c!103954) b!1022662))

(assert (= (and b!1022673 (not c!103954)) b!1022663))

(assert (= (or b!1022662 b!1022663) bm!43288))

(assert (= (or b!1022662 b!1022663) bm!43281))

(declare-fun b_lambda!15661 () Bool)

(assert (=> (not b_lambda!15661) (not b!1022674)))

(declare-fun t!30644 () Bool)

(declare-fun tb!6827 () Bool)

(assert (=> (and b!1022563 (= (defaultEntry!5871 (v!14536 (underlying!567 thiss!908))) (defaultEntry!5871 (v!14536 (underlying!567 thiss!908)))) t!30644) tb!6827))

(declare-fun result!13969 () Bool)

(assert (=> tb!6827 (= result!13969 tp_is_empty!23851)))

(assert (=> b!1022674 t!30644))

(declare-fun b_and!32335 () Bool)

(assert (= b_and!32329 (and (=> t!30644 result!13969) b_and!32335)))

(declare-fun b_lambda!15663 () Bool)

(assert (=> (not b_lambda!15663) (not b!1022671)))

(assert (=> b!1022671 t!30644))

(declare-fun b_and!32337 () Bool)

(assert (= b_and!32335 (and (=> t!30644 result!13969) b_and!32337)))

(declare-fun b_lambda!15665 () Bool)

(assert (=> (not b_lambda!15665) (not b!1022665)))

(declare-fun t!30646 () Bool)

(declare-fun tb!6829 () Bool)

(assert (=> (and b!1022563 (= (defaultEntry!5871 (v!14536 (underlying!567 thiss!908))) (defaultEntry!5871 (v!14536 (underlying!567 thiss!908)))) t!30646) tb!6829))

(declare-fun result!13973 () Bool)

(assert (=> tb!6829 (= result!13973 tp_is_empty!23851)))

(assert (=> b!1022665 t!30646))

(declare-fun b_and!32339 () Bool)

(assert (= b_and!32337 (and (=> t!30646 result!13973) b_and!32339)))

(declare-fun b_lambda!15667 () Bool)

(assert (=> (not b_lambda!15667) (not b!1022667)))

(assert (=> b!1022667 t!30644))

(declare-fun b_and!32341 () Bool)

(assert (= b_and!32339 (and (=> t!30644 result!13969) b_and!32341)))

(declare-fun b_lambda!15669 () Bool)

(assert (=> (not b_lambda!15669) (not b!1022670)))

(assert (=> b!1022670 t!30644))

(declare-fun b_and!32343 () Bool)

(assert (= b_and!32341 (and (=> t!30644 result!13969) b_and!32343)))

(declare-fun m!942541 () Bool)

(assert (=> bm!43282 m!942541))

(declare-fun m!942543 () Bool)

(assert (=> bm!43283 m!942543))

(declare-fun m!942545 () Bool)

(assert (=> b!1022662 m!942545))

(declare-fun m!942547 () Bool)

(assert (=> bm!43281 m!942547))

(declare-fun m!942549 () Bool)

(assert (=> bm!43288 m!942549))

(declare-fun m!942551 () Bool)

(assert (=> b!1022665 m!942551))

(declare-fun m!942553 () Bool)

(assert (=> b!1022665 m!942553))

(declare-fun m!942555 () Bool)

(assert (=> b!1022674 m!942555))

(declare-fun m!942557 () Bool)

(assert (=> b!1022674 m!942557))

(declare-fun m!942559 () Bool)

(assert (=> b!1022674 m!942559))

(declare-fun m!942561 () Bool)

(assert (=> d!122961 m!942561))

(declare-fun m!942563 () Bool)

(assert (=> d!122961 m!942563))

(declare-fun m!942565 () Bool)

(assert (=> b!1022672 m!942565))

(declare-fun m!942567 () Bool)

(assert (=> b!1022661 m!942567))

(declare-fun m!942569 () Bool)

(assert (=> b!1022664 m!942569))

(declare-fun m!942571 () Bool)

(assert (=> b!1022671 m!942571))

(assert (=> b!1022671 m!942557))

(declare-fun m!942573 () Bool)

(assert (=> bm!43286 m!942573))

(declare-fun m!942575 () Bool)

(assert (=> b!1022670 m!942575))

(declare-fun m!942577 () Bool)

(assert (=> b!1022670 m!942577))

(declare-fun m!942579 () Bool)

(assert (=> b!1022670 m!942579))

(declare-fun m!942581 () Bool)

(assert (=> b!1022670 m!942581))

(declare-fun m!942583 () Bool)

(assert (=> b!1022670 m!942583))

(declare-fun m!942585 () Bool)

(assert (=> b!1022670 m!942585))

(declare-fun m!942587 () Bool)

(assert (=> b!1022670 m!942587))

(assert (=> b!1022670 m!942555))

(declare-fun m!942589 () Bool)

(assert (=> b!1022670 m!942589))

(assert (=> b!1022670 m!942557))

(declare-fun m!942591 () Bool)

(assert (=> b!1022670 m!942591))

(declare-fun m!942593 () Bool)

(assert (=> b!1022670 m!942593))

(assert (=> b!1022670 m!942559))

(declare-fun m!942595 () Bool)

(assert (=> b!1022670 m!942595))

(declare-fun m!942597 () Bool)

(assert (=> b!1022670 m!942597))

(declare-fun m!942599 () Bool)

(assert (=> b!1022670 m!942599))

(declare-fun m!942601 () Bool)

(assert (=> b!1022670 m!942601))

(assert (=> b!1022667 m!942555))

(assert (=> b!1022667 m!942557))

(assert (=> b!1022667 m!942559))

(assert (=> b!1022566 d!122961))

(declare-fun d!122963 () Bool)

(assert (=> d!122963 (= (valid!1925 thiss!908) (valid!1926 (v!14536 (underlying!567 thiss!908))))))

(declare-fun bs!29787 () Bool)

(assert (= bs!29787 d!122963))

(assert (=> bs!29787 m!942563))

(assert (=> start!89304 d!122963))

(declare-fun d!122965 () Bool)

(assert (=> d!122965 (= (map!14460 (ite c!103929 lt!450517 thiss!908)) (map!14462 (v!14536 (underlying!567 (ite c!103929 lt!450517 thiss!908)))))))

(declare-fun bs!29788 () Bool)

(assert (= bs!29788 d!122965))

(declare-fun m!942603 () Bool)

(assert (=> bs!29788 m!942603))

(assert (=> bm!43252 d!122965))

(declare-fun d!122967 () Bool)

(assert (=> d!122967 (= (map!14460 (ite c!103929 thiss!908 lt!450517)) (map!14462 (v!14536 (underlying!567 (ite c!103929 thiss!908 lt!450517)))))))

(declare-fun bs!29789 () Bool)

(assert (= bs!29789 d!122967))

(declare-fun m!942605 () Bool)

(assert (=> bs!29789 m!942605))

(assert (=> bm!43251 d!122967))

(declare-fun d!122969 () Bool)

(assert (=> d!122969 (= (array_inv!23829 (_keys!11054 (v!14536 (underlying!567 thiss!908)))) (bvsge (size!31215 (_keys!11054 (v!14536 (underlying!567 thiss!908)))) #b00000000000000000000000000000000))))

(assert (=> b!1022563 d!122969))

(declare-fun d!122971 () Bool)

(assert (=> d!122971 (= (array_inv!23830 (_values!5894 (v!14536 (underlying!567 thiss!908)))) (bvsge (size!31216 (_values!5894 (v!14536 (underlying!567 thiss!908)))) #b00000000000000000000000000000000))))

(assert (=> b!1022563 d!122971))

(declare-fun b!1022685 () Bool)

(declare-fun e!576068 () Bool)

(assert (=> b!1022685 (= e!576068 tp_is_empty!23851)))

(declare-fun mapIsEmpty!37197 () Bool)

(declare-fun mapRes!37197 () Bool)

(assert (=> mapIsEmpty!37197 mapRes!37197))

(declare-fun condMapEmpty!37197 () Bool)

(declare-fun mapDefault!37197 () ValueCell!11222)

(assert (=> mapNonEmpty!37188 (= condMapEmpty!37197 (= mapRest!37188 ((as const (Array (_ BitVec 32) ValueCell!11222)) mapDefault!37197)))))

(assert (=> mapNonEmpty!37188 (= tp!71422 (and e!576068 mapRes!37197))))

(declare-fun b!1022684 () Bool)

(declare-fun e!576069 () Bool)

(assert (=> b!1022684 (= e!576069 tp_is_empty!23851)))

(declare-fun mapNonEmpty!37197 () Bool)

(declare-fun tp!71437 () Bool)

(assert (=> mapNonEmpty!37197 (= mapRes!37197 (and tp!71437 e!576069))))

(declare-fun mapKey!37197 () (_ BitVec 32))

(declare-fun mapRest!37197 () (Array (_ BitVec 32) ValueCell!11222))

(declare-fun mapValue!37197 () ValueCell!11222)

(assert (=> mapNonEmpty!37197 (= mapRest!37188 (store mapRest!37197 mapKey!37197 mapValue!37197))))

(assert (= (and mapNonEmpty!37188 condMapEmpty!37197) mapIsEmpty!37197))

(assert (= (and mapNonEmpty!37188 (not condMapEmpty!37197)) mapNonEmpty!37197))

(assert (= (and mapNonEmpty!37197 ((_ is ValueCellFull!11222) mapValue!37197)) b!1022684))

(assert (= (and mapNonEmpty!37188 ((_ is ValueCellFull!11222) mapDefault!37197)) b!1022685))

(declare-fun m!942607 () Bool)

(assert (=> mapNonEmpty!37197 m!942607))

(declare-fun b_lambda!15671 () Bool)

(assert (= b_lambda!15663 (or (and b!1022563 b_free!20131) b_lambda!15671)))

(declare-fun b_lambda!15673 () Bool)

(assert (= b_lambda!15661 (or (and b!1022563 b_free!20131) b_lambda!15673)))

(declare-fun b_lambda!15675 () Bool)

(assert (= b_lambda!15667 (or (and b!1022563 b_free!20131) b_lambda!15675)))

(declare-fun b_lambda!15677 () Bool)

(assert (= b_lambda!15665 (or (and b!1022563 b_free!20131) b_lambda!15677)))

(declare-fun b_lambda!15679 () Bool)

(assert (= b_lambda!15669 (or (and b!1022563 b_free!20131) b_lambda!15679)))

(check-sat (not d!122963) (not b_lambda!15677) (not b_lambda!15671) (not b!1022661) (not b_next!20131) (not b!1022665) (not b!1022664) (not d!122967) (not b!1022670) (not b!1022671) (not d!122957) (not b!1022662) (not bm!43281) tp_is_empty!23851 (not bm!43288) (not d!122965) (not b_lambda!15673) (not b_lambda!15675) (not bm!43282) (not mapNonEmpty!37197) (not d!122959) (not b!1022672) (not d!122961) (not bm!43283) b_and!32343 (not b_lambda!15679) (not bm!43286))
(check-sat b_and!32343 (not b_next!20131))
