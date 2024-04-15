; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3032 () Bool)

(assert start!3032)

(declare-fun b!18125 () Bool)

(declare-fun b_free!649 () Bool)

(declare-fun b_next!649 () Bool)

(assert (=> b!18125 (= b_free!649 (not b_next!649))))

(declare-fun tp!3137 () Bool)

(declare-fun b_and!1291 () Bool)

(assert (=> b!18125 (= tp!3137 b_and!1291)))

(declare-fun b!18116 () Bool)

(declare-fun e!11617 () Bool)

(declare-fun e!11613 () Bool)

(assert (=> b!18116 (= e!11617 e!11613)))

(declare-fun res!12715 () Bool)

(assert (=> b!18116 (=> res!12715 e!11613)))

(declare-datatypes ((V!1043 0))(
  ( (V!1044 (val!483 Int)) )
))
(declare-datatypes ((ValueCell!257 0))(
  ( (ValueCellFull!257 (v!1469 V!1043)) (EmptyCell!257) )
))
(declare-datatypes ((array!1013 0))(
  ( (array!1014 (arr!488 (Array (_ BitVec 32) ValueCell!257)) (size!578 (_ BitVec 32))) )
))
(declare-datatypes ((array!1015 0))(
  ( (array!1016 (arr!489 (Array (_ BitVec 32) (_ BitVec 64))) (size!579 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!100 0))(
  ( (LongMapFixedSize!101 (defaultEntry!1661 Int) (mask!4594 (_ BitVec 32)) (extraKeys!1574 (_ BitVec 32)) (zeroValue!1597 V!1043) (minValue!1597 V!1043) (_size!82 (_ BitVec 32)) (_keys!3086 array!1015) (_values!1658 array!1013) (_vacant!82 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!100 0))(
  ( (Cell!101 (v!1470 LongMapFixedSize!100)) )
))
(declare-datatypes ((LongMap!100 0))(
  ( (LongMap!101 (underlying!61 Cell!100)) )
))
(declare-fun lt!4691 () LongMap!100)

(declare-fun valid!56 (LongMap!100) Bool)

(assert (=> b!18116 (= res!12715 (not (valid!56 lt!4691)))))

(declare-datatypes ((tuple2!790 0))(
  ( (tuple2!791 (_1!396 Bool) (_2!396 LongMapFixedSize!100)) )
))
(declare-fun lt!4690 () tuple2!790)

(assert (=> b!18116 (= lt!4691 (LongMap!101 (Cell!101 (_2!396 lt!4690))))))

(declare-fun key!682 () (_ BitVec 64))

(declare-datatypes ((tuple2!792 0))(
  ( (tuple2!793 (_1!397 Bool) (_2!397 LongMap!100)) )
))
(declare-fun lt!4692 () tuple2!792)

(declare-fun v!259 () V!1043)

(declare-fun update!13 (LongMapFixedSize!100 (_ BitVec 64) V!1043) tuple2!790)

(assert (=> b!18116 (= lt!4690 (update!13 (v!1470 (underlying!61 (_2!397 lt!4692))) key!682 v!259))))

(declare-fun b!18117 () Bool)

(declare-fun e!11609 () Bool)

(declare-fun tp_is_empty!913 () Bool)

(assert (=> b!18117 (= e!11609 tp_is_empty!913)))

(declare-fun mapNonEmpty!804 () Bool)

(declare-fun mapRes!804 () Bool)

(declare-fun tp!3138 () Bool)

(declare-fun e!11610 () Bool)

(assert (=> mapNonEmpty!804 (= mapRes!804 (and tp!3138 e!11610))))

(declare-fun mapRest!804 () (Array (_ BitVec 32) ValueCell!257))

(declare-fun mapValue!804 () ValueCell!257)

(declare-fun thiss!848 () LongMap!100)

(declare-fun mapKey!804 () (_ BitVec 32))

(assert (=> mapNonEmpty!804 (= (arr!488 (_values!1658 (v!1470 (underlying!61 thiss!848)))) (store mapRest!804 mapKey!804 mapValue!804))))

(declare-datatypes ((tuple2!794 0))(
  ( (tuple2!795 (_1!398 (_ BitVec 64)) (_2!398 V!1043)) )
))
(declare-datatypes ((List!535 0))(
  ( (Nil!532) (Cons!531 (h!1097 tuple2!794) (t!3167 List!535)) )
))
(declare-datatypes ((ListLongMap!533 0))(
  ( (ListLongMap!534 (toList!282 List!535)) )
))
(declare-fun lt!4689 () ListLongMap!533)

(declare-fun call!619 () ListLongMap!533)

(declare-fun e!11619 () Bool)

(declare-fun b!18118 () Bool)

(declare-fun +!35 (ListLongMap!533 tuple2!794) ListLongMap!533)

(assert (=> b!18118 (= e!11619 (not (= lt!4689 (+!35 call!619 (tuple2!795 key!682 v!259)))))))

(declare-fun b!18119 () Bool)

(declare-fun e!11611 () Bool)

(declare-fun e!11615 () Bool)

(assert (=> b!18119 (= e!11611 e!11615)))

(declare-fun b!18120 () Bool)

(declare-fun e!11614 () tuple2!792)

(declare-fun repack!28 (LongMap!100) tuple2!792)

(assert (=> b!18120 (= e!11614 (repack!28 thiss!848))))

(declare-fun b!18121 () Bool)

(declare-fun e!11608 () Bool)

(assert (=> b!18121 (= e!11615 e!11608)))

(declare-fun mapIsEmpty!804 () Bool)

(assert (=> mapIsEmpty!804 mapRes!804))

(declare-fun b!18122 () Bool)

(assert (=> b!18122 (= e!11614 (tuple2!793 true thiss!848))))

(declare-fun bm!616 () Bool)

(declare-fun call!620 () ListLongMap!533)

(declare-fun map!355 (LongMap!100) ListLongMap!533)

(assert (=> bm!616 (= call!620 (map!355 lt!4691))))

(declare-fun b!18123 () Bool)

(declare-fun e!11616 () Bool)

(assert (=> b!18123 (= e!11616 (and e!11609 mapRes!804))))

(declare-fun condMapEmpty!804 () Bool)

(declare-fun mapDefault!804 () ValueCell!257)

(assert (=> b!18123 (= condMapEmpty!804 (= (arr!488 (_values!1658 (v!1470 (underlying!61 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!257)) mapDefault!804)))))

(declare-fun b!18124 () Bool)

(declare-fun e!11612 () Bool)

(assert (=> b!18124 (= e!11613 e!11612)))

(declare-fun c!1811 () Bool)

(assert (=> b!18124 (= c!1811 (_1!396 lt!4690))))

(declare-fun array_inv!347 (array!1015) Bool)

(declare-fun array_inv!348 (array!1013) Bool)

(assert (=> b!18125 (= e!11608 (and tp!3137 tp_is_empty!913 (array_inv!347 (_keys!3086 (v!1470 (underlying!61 thiss!848)))) (array_inv!348 (_values!1658 (v!1470 (underlying!61 thiss!848)))) e!11616))))

(declare-fun b!18126 () Bool)

(assert (=> b!18126 (= e!11612 (not (= call!620 call!619)))))

(declare-fun res!12713 () Bool)

(declare-fun e!11607 () Bool)

(assert (=> start!3032 (=> (not res!12713) (not e!11607))))

(assert (=> start!3032 (= res!12713 (valid!56 thiss!848))))

(assert (=> start!3032 e!11607))

(assert (=> start!3032 e!11611))

(assert (=> start!3032 true))

(assert (=> start!3032 tp_is_empty!913))

(declare-fun b!18127 () Bool)

(assert (=> b!18127 (= e!11607 e!11617)))

(declare-fun res!12716 () Bool)

(assert (=> b!18127 (=> (not res!12716) (not e!11617))))

(assert (=> b!18127 (= res!12716 (_1!397 lt!4692))))

(assert (=> b!18127 (= lt!4692 e!11614)))

(declare-fun c!1810 () Bool)

(declare-fun imbalanced!27 (LongMap!100) Bool)

(assert (=> b!18127 (= c!1810 (imbalanced!27 thiss!848))))

(declare-fun b!18128 () Bool)

(assert (=> b!18128 (= e!11612 e!11619)))

(assert (=> b!18128 (= lt!4689 call!620)))

(declare-fun res!12714 () Bool)

(declare-fun contains!214 (ListLongMap!533 (_ BitVec 64)) Bool)

(assert (=> b!18128 (= res!12714 (not (contains!214 lt!4689 key!682)))))

(assert (=> b!18128 (=> res!12714 e!11619)))

(declare-fun bm!617 () Bool)

(assert (=> bm!617 (= call!619 (map!355 thiss!848))))

(declare-fun b!18129 () Bool)

(assert (=> b!18129 (= e!11610 tp_is_empty!913)))

(assert (= (and start!3032 res!12713) b!18127))

(assert (= (and b!18127 c!1810) b!18120))

(assert (= (and b!18127 (not c!1810)) b!18122))

(assert (= (and b!18127 res!12716) b!18116))

(assert (= (and b!18116 (not res!12715)) b!18124))

(assert (= (and b!18124 c!1811) b!18128))

(assert (= (and b!18124 (not c!1811)) b!18126))

(assert (= (and b!18128 (not res!12714)) b!18118))

(assert (= (or b!18118 b!18126) bm!617))

(assert (= (or b!18128 b!18126) bm!616))

(assert (= (and b!18123 condMapEmpty!804) mapIsEmpty!804))

(assert (= (and b!18123 (not condMapEmpty!804)) mapNonEmpty!804))

(get-info :version)

(assert (= (and mapNonEmpty!804 ((_ is ValueCellFull!257) mapValue!804)) b!18129))

(assert (= (and b!18123 ((_ is ValueCellFull!257) mapDefault!804)) b!18117))

(assert (= b!18125 b!18123))

(assert (= b!18121 b!18125))

(assert (= b!18119 b!18121))

(assert (= start!3032 b!18119))

(declare-fun m!12577 () Bool)

(assert (=> b!18118 m!12577))

(declare-fun m!12579 () Bool)

(assert (=> b!18116 m!12579))

(declare-fun m!12581 () Bool)

(assert (=> b!18116 m!12581))

(declare-fun m!12583 () Bool)

(assert (=> b!18127 m!12583))

(declare-fun m!12585 () Bool)

(assert (=> b!18120 m!12585))

(declare-fun m!12587 () Bool)

(assert (=> mapNonEmpty!804 m!12587))

(declare-fun m!12589 () Bool)

(assert (=> bm!617 m!12589))

(declare-fun m!12591 () Bool)

(assert (=> start!3032 m!12591))

(declare-fun m!12593 () Bool)

(assert (=> b!18125 m!12593))

(declare-fun m!12595 () Bool)

(assert (=> b!18125 m!12595))

(declare-fun m!12597 () Bool)

(assert (=> bm!616 m!12597))

(declare-fun m!12599 () Bool)

(assert (=> b!18128 m!12599))

(check-sat (not b_next!649) b_and!1291 (not b!18127) (not bm!616) (not mapNonEmpty!804) (not b!18128) (not b!18118) (not b!18120) tp_is_empty!913 (not b!18116) (not bm!617) (not b!18125) (not start!3032))
(check-sat b_and!1291 (not b_next!649))
(get-model)

(declare-fun d!3383 () Bool)

(declare-fun e!11700 () Bool)

(assert (=> d!3383 e!11700))

(declare-fun res!12745 () Bool)

(assert (=> d!3383 (=> (not res!12745) (not e!11700))))

(declare-fun lt!4725 () ListLongMap!533)

(assert (=> d!3383 (= res!12745 (contains!214 lt!4725 (_1!398 (tuple2!795 key!682 v!259))))))

(declare-fun lt!4728 () List!535)

(assert (=> d!3383 (= lt!4725 (ListLongMap!534 lt!4728))))

(declare-datatypes ((Unit!359 0))(
  ( (Unit!360) )
))
(declare-fun lt!4726 () Unit!359)

(declare-fun lt!4727 () Unit!359)

(assert (=> d!3383 (= lt!4726 lt!4727)))

(declare-datatypes ((Option!64 0))(
  ( (Some!63 (v!1479 V!1043)) (None!62) )
))
(declare-fun getValueByKey!58 (List!535 (_ BitVec 64)) Option!64)

(assert (=> d!3383 (= (getValueByKey!58 lt!4728 (_1!398 (tuple2!795 key!682 v!259))) (Some!63 (_2!398 (tuple2!795 key!682 v!259))))))

(declare-fun lemmaContainsTupThenGetReturnValue!16 (List!535 (_ BitVec 64) V!1043) Unit!359)

(assert (=> d!3383 (= lt!4727 (lemmaContainsTupThenGetReturnValue!16 lt!4728 (_1!398 (tuple2!795 key!682 v!259)) (_2!398 (tuple2!795 key!682 v!259))))))

(declare-fun insertStrictlySorted!16 (List!535 (_ BitVec 64) V!1043) List!535)

(assert (=> d!3383 (= lt!4728 (insertStrictlySorted!16 (toList!282 call!619) (_1!398 (tuple2!795 key!682 v!259)) (_2!398 (tuple2!795 key!682 v!259))))))

(assert (=> d!3383 (= (+!35 call!619 (tuple2!795 key!682 v!259)) lt!4725)))

(declare-fun b!18218 () Bool)

(declare-fun res!12746 () Bool)

(assert (=> b!18218 (=> (not res!12746) (not e!11700))))

(assert (=> b!18218 (= res!12746 (= (getValueByKey!58 (toList!282 lt!4725) (_1!398 (tuple2!795 key!682 v!259))) (Some!63 (_2!398 (tuple2!795 key!682 v!259)))))))

(declare-fun b!18219 () Bool)

(declare-fun contains!217 (List!535 tuple2!794) Bool)

(assert (=> b!18219 (= e!11700 (contains!217 (toList!282 lt!4725) (tuple2!795 key!682 v!259)))))

(assert (= (and d!3383 res!12745) b!18218))

(assert (= (and b!18218 res!12746) b!18219))

(declare-fun m!12649 () Bool)

(assert (=> d!3383 m!12649))

(declare-fun m!12651 () Bool)

(assert (=> d!3383 m!12651))

(declare-fun m!12653 () Bool)

(assert (=> d!3383 m!12653))

(declare-fun m!12655 () Bool)

(assert (=> d!3383 m!12655))

(declare-fun m!12657 () Bool)

(assert (=> b!18218 m!12657))

(declare-fun m!12659 () Bool)

(assert (=> b!18219 m!12659))

(assert (=> b!18118 d!3383))

(declare-fun d!3385 () Bool)

(declare-fun map!357 (LongMapFixedSize!100) ListLongMap!533)

(assert (=> d!3385 (= (map!355 lt!4691) (map!357 (v!1470 (underlying!61 lt!4691))))))

(declare-fun bs!838 () Bool)

(assert (= bs!838 d!3385))

(declare-fun m!12661 () Bool)

(assert (=> bs!838 m!12661))

(assert (=> bm!616 d!3385))

(declare-fun d!3387 () Bool)

(assert (=> d!3387 (= (imbalanced!27 thiss!848) (or (bvsgt (bvmul #b00000000000000000000000000000010 (bvadd (_size!82 (v!1470 (underlying!61 thiss!848))) (_vacant!82 (v!1470 (underlying!61 thiss!848))))) (mask!4594 (v!1470 (underlying!61 thiss!848)))) (bvsgt (_vacant!82 (v!1470 (underlying!61 thiss!848))) (_size!82 (v!1470 (underlying!61 thiss!848))))))))

(assert (=> b!18127 d!3387))

(declare-fun d!3389 () Bool)

(declare-fun e!11706 () Bool)

(assert (=> d!3389 e!11706))

(declare-fun res!12749 () Bool)

(assert (=> d!3389 (=> res!12749 e!11706)))

(declare-fun lt!4740 () Bool)

(assert (=> d!3389 (= res!12749 (not lt!4740))))

(declare-fun lt!4737 () Bool)

(assert (=> d!3389 (= lt!4740 lt!4737)))

(declare-fun lt!4739 () Unit!359)

(declare-fun e!11705 () Unit!359)

(assert (=> d!3389 (= lt!4739 e!11705)))

(declare-fun c!1826 () Bool)

(assert (=> d!3389 (= c!1826 lt!4737)))

(declare-fun containsKey!22 (List!535 (_ BitVec 64)) Bool)

(assert (=> d!3389 (= lt!4737 (containsKey!22 (toList!282 lt!4689) key!682))))

(assert (=> d!3389 (= (contains!214 lt!4689 key!682) lt!4740)))

(declare-fun b!18226 () Bool)

(declare-fun lt!4738 () Unit!359)

(assert (=> b!18226 (= e!11705 lt!4738)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!19 (List!535 (_ BitVec 64)) Unit!359)

(assert (=> b!18226 (= lt!4738 (lemmaContainsKeyImpliesGetValueByKeyDefined!19 (toList!282 lt!4689) key!682))))

(declare-fun isDefined!20 (Option!64) Bool)

(assert (=> b!18226 (isDefined!20 (getValueByKey!58 (toList!282 lt!4689) key!682))))

(declare-fun b!18227 () Bool)

(declare-fun Unit!361 () Unit!359)

(assert (=> b!18227 (= e!11705 Unit!361)))

(declare-fun b!18228 () Bool)

(assert (=> b!18228 (= e!11706 (isDefined!20 (getValueByKey!58 (toList!282 lt!4689) key!682)))))

(assert (= (and d!3389 c!1826) b!18226))

(assert (= (and d!3389 (not c!1826)) b!18227))

(assert (= (and d!3389 (not res!12749)) b!18228))

(declare-fun m!12663 () Bool)

(assert (=> d!3389 m!12663))

(declare-fun m!12665 () Bool)

(assert (=> b!18226 m!12665))

(declare-fun m!12667 () Bool)

(assert (=> b!18226 m!12667))

(assert (=> b!18226 m!12667))

(declare-fun m!12669 () Bool)

(assert (=> b!18226 m!12669))

(assert (=> b!18228 m!12667))

(assert (=> b!18228 m!12667))

(assert (=> b!18228 m!12669))

(assert (=> b!18128 d!3389))

(declare-fun c!1835 () Bool)

(declare-fun c!1837 () Bool)

(declare-fun call!644 () tuple2!790)

(declare-fun lt!4762 () tuple2!790)

(declare-fun call!641 () LongMapFixedSize!100)

(declare-fun bm!638 () Bool)

(assert (=> bm!638 (= call!644 (update!13 (ite c!1835 (_2!396 lt!4762) call!641) (ite c!1835 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1837 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1835 (minValue!1597 (v!1470 (underlying!61 thiss!848))) (ite c!1837 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 (v!1470 (underlying!61 thiss!848)))))))))

(declare-fun bm!639 () Bool)

(declare-fun call!643 () tuple2!790)

(assert (=> bm!639 (= call!643 call!644)))

(declare-fun d!3391 () Bool)

(declare-fun e!11718 () Bool)

(assert (=> d!3391 e!11718))

(declare-fun res!12752 () Bool)

(assert (=> d!3391 (=> res!12752 e!11718)))

(declare-fun lt!4769 () tuple2!792)

(assert (=> d!3391 (= res!12752 (= (_1!397 lt!4769) false))))

(declare-datatypes ((tuple3!2 0))(
  ( (tuple3!3 (_1!405 Bool) (_2!405 Cell!100) (_3!1 LongMap!100)) )
))
(declare-fun lt!4770 () tuple3!2)

(assert (=> d!3391 (= lt!4769 (tuple2!793 (_1!405 lt!4770) (_3!1 lt!4770)))))

(declare-fun e!11717 () tuple3!2)

(assert (=> d!3391 (= lt!4770 e!11717)))

(declare-fun c!1838 () Bool)

(declare-datatypes ((tuple2!808 0))(
  ( (tuple2!809 (_1!406 Bool) (_2!406 Cell!100)) )
))
(declare-fun lt!4765 () tuple2!808)

(assert (=> d!3391 (= c!1838 (not (_1!406 lt!4765)))))

(declare-fun e!11721 () tuple2!808)

(assert (=> d!3391 (= lt!4765 e!11721)))

(assert (=> d!3391 (= c!1835 (and (not (= (bvand (extraKeys!1574 (v!1470 (underlying!61 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1574 (v!1470 (underlying!61 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!4763 () Cell!100)

(declare-fun lt!4761 () (_ BitVec 32))

(declare-fun getNewLongMapFixedSize!8 ((_ BitVec 32) Int) LongMapFixedSize!100)

(assert (=> d!3391 (= lt!4763 (Cell!101 (getNewLongMapFixedSize!8 lt!4761 (defaultEntry!1661 (v!1470 (underlying!61 thiss!848))))))))

(declare-fun computeNewMask!2 (LongMap!100 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3391 (= lt!4761 (computeNewMask!2 thiss!848 (mask!4594 (v!1470 (underlying!61 thiss!848))) (_vacant!82 (v!1470 (underlying!61 thiss!848))) (_size!82 (v!1470 (underlying!61 thiss!848)))))))

(assert (=> d!3391 (valid!56 thiss!848)))

(assert (=> d!3391 (= (repack!28 thiss!848) lt!4769)))

(declare-fun b!18247 () Bool)

(declare-fun e!11720 () tuple2!808)

(declare-fun lt!4766 () tuple2!790)

(assert (=> b!18247 (= e!11720 (tuple2!809 (_1!396 lt!4766) (Cell!101 (_2!396 lt!4766))))))

(assert (=> b!18247 (= lt!4766 call!643)))

(declare-fun b!18248 () Bool)

(declare-fun lt!4764 () tuple2!790)

(assert (=> b!18248 (= e!11717 (ite (_1!396 lt!4764) (tuple3!3 true (underlying!61 thiss!848) (LongMap!101 (Cell!101 (_2!396 lt!4764)))) (tuple3!3 false (Cell!101 (_2!396 lt!4764)) thiss!848)))))

(declare-fun repackFrom!2 (LongMap!100 LongMapFixedSize!100 (_ BitVec 32)) tuple2!790)

(assert (=> b!18248 (= lt!4764 (repackFrom!2 thiss!848 (v!1470 (_2!406 lt!4765)) (bvsub (size!579 (_keys!3086 (v!1470 (underlying!61 thiss!848)))) #b00000000000000000000000000000001)))))

(declare-fun b!18249 () Bool)

(assert (=> b!18249 (= e!11717 (tuple3!3 false (_2!406 lt!4765) thiss!848))))

(declare-fun b!18250 () Bool)

(declare-fun lt!4768 () tuple2!790)

(assert (=> b!18250 (= e!11721 (tuple2!809 (and (_1!396 lt!4762) (_1!396 lt!4768)) (Cell!101 (_2!396 lt!4768))))))

(declare-fun call!642 () LongMapFixedSize!100)

(assert (=> b!18250 (= lt!4762 (update!13 call!642 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1470 (underlying!61 thiss!848)))))))

(assert (=> b!18250 (= lt!4768 call!644)))

(declare-fun b!18251 () Bool)

(declare-fun e!11719 () tuple2!808)

(assert (=> b!18251 (= e!11721 e!11719)))

(assert (=> b!18251 (= c!1837 (and (not (= (bvand (extraKeys!1574 (v!1470 (underlying!61 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1574 (v!1470 (underlying!61 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!640 () Bool)

(assert (=> bm!640 (= call!641 call!642)))

(declare-fun b!18252 () Bool)

(assert (=> b!18252 (= e!11720 (tuple2!809 true lt!4763))))

(declare-fun b!18253 () Bool)

(declare-fun c!1836 () Bool)

(assert (=> b!18253 (= c!1836 (and (not (= (bvand (extraKeys!1574 (v!1470 (underlying!61 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1574 (v!1470 (underlying!61 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!18253 (= e!11719 e!11720)))

(declare-fun bm!641 () Bool)

(assert (=> bm!641 (= call!642 (getNewLongMapFixedSize!8 lt!4761 (defaultEntry!1661 (v!1470 (underlying!61 thiss!848)))))))

(declare-fun b!18254 () Bool)

(assert (=> b!18254 (= e!11718 (= (map!355 (_2!397 lt!4769)) (map!355 thiss!848)))))

(declare-fun b!18255 () Bool)

(declare-fun lt!4767 () tuple2!790)

(assert (=> b!18255 (= lt!4767 call!643)))

(assert (=> b!18255 (= e!11719 (tuple2!809 (_1!396 lt!4767) (Cell!101 (_2!396 lt!4767))))))

(assert (= (and d!3391 c!1835) b!18250))

(assert (= (and d!3391 (not c!1835)) b!18251))

(assert (= (and b!18251 c!1837) b!18255))

(assert (= (and b!18251 (not c!1837)) b!18253))

(assert (= (and b!18253 c!1836) b!18247))

(assert (= (and b!18253 (not c!1836)) b!18252))

(assert (= (or b!18255 b!18247) bm!640))

(assert (= (or b!18255 b!18247) bm!639))

(assert (= (or b!18250 bm!639) bm!638))

(assert (= (or b!18250 bm!640) bm!641))

(assert (= (and d!3391 c!1838) b!18249))

(assert (= (and d!3391 (not c!1838)) b!18248))

(assert (= (and d!3391 (not res!12752)) b!18254))

(declare-fun m!12671 () Bool)

(assert (=> b!18250 m!12671))

(declare-fun m!12673 () Bool)

(assert (=> b!18254 m!12673))

(assert (=> b!18254 m!12589))

(declare-fun m!12675 () Bool)

(assert (=> d!3391 m!12675))

(declare-fun m!12677 () Bool)

(assert (=> d!3391 m!12677))

(assert (=> d!3391 m!12591))

(declare-fun m!12679 () Bool)

(assert (=> bm!638 m!12679))

(declare-fun m!12681 () Bool)

(assert (=> b!18248 m!12681))

(assert (=> bm!641 m!12675))

(assert (=> b!18120 d!3391))

(declare-fun d!3393 () Bool)

(assert (=> d!3393 (= (map!355 thiss!848) (map!357 (v!1470 (underlying!61 thiss!848))))))

(declare-fun bs!839 () Bool)

(assert (= bs!839 d!3393))

(declare-fun m!12683 () Bool)

(assert (=> bs!839 m!12683))

(assert (=> bm!617 d!3393))

(declare-fun d!3395 () Bool)

(declare-fun valid!59 (LongMapFixedSize!100) Bool)

(assert (=> d!3395 (= (valid!56 lt!4691) (valid!59 (v!1470 (underlying!61 lt!4691))))))

(declare-fun bs!840 () Bool)

(assert (= bs!840 d!3395))

(declare-fun m!12685 () Bool)

(assert (=> bs!840 m!12685))

(assert (=> b!18116 d!3395))

(declare-fun b!18332 () Bool)

(declare-fun e!11765 () tuple2!790)

(declare-fun e!11773 () tuple2!790)

(assert (=> b!18332 (= e!11765 e!11773)))

(declare-fun c!1867 () Bool)

(assert (=> b!18332 (= c!1867 (= key!682 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18333 () Bool)

(declare-fun c!1865 () Bool)

(declare-datatypes ((SeekEntryResult!44 0))(
  ( (MissingZero!44 (index!2295 (_ BitVec 32))) (Found!44 (index!2296 (_ BitVec 32))) (Intermediate!44 (undefined!856 Bool) (index!2297 (_ BitVec 32)) (x!4489 (_ BitVec 32))) (Undefined!44) (MissingVacant!44 (index!2298 (_ BitVec 32))) )
))
(declare-fun lt!4836 () SeekEntryResult!44)

(assert (=> b!18333 (= c!1865 ((_ is MissingVacant!44) lt!4836))))

(declare-fun e!11764 () Bool)

(declare-fun e!11768 () Bool)

(assert (=> b!18333 (= e!11764 e!11768)))

(declare-fun b!18334 () Bool)

(declare-fun lt!4850 () Unit!359)

(declare-fun lt!4848 () Unit!359)

(assert (=> b!18334 (= lt!4850 lt!4848)))

(declare-fun call!714 () ListLongMap!533)

(declare-fun call!701 () ListLongMap!533)

(assert (=> b!18334 (= call!714 call!701)))

(declare-fun lt!4826 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!2 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 V!1043 Int) Unit!359)

(assert (=> b!18334 (= lt!4848 (lemmaChangeZeroKeyThenAddPairToListMap!2 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4826 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(assert (=> b!18334 (= lt!4826 (bvor (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000001))))

(assert (=> b!18334 (= e!11773 (tuple2!791 true (LongMapFixedSize!101 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (bvor (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000001) v!259 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_size!82 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_vacant!82 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun b!18335 () Bool)

(declare-fun e!11762 () Unit!359)

(declare-fun Unit!362 () Unit!359)

(assert (=> b!18335 (= e!11762 Unit!362)))

(declare-fun lt!4839 () Unit!359)

(declare-fun call!706 () Unit!359)

(assert (=> b!18335 (= lt!4839 call!706)))

(declare-fun call!715 () SeekEntryResult!44)

(assert (=> b!18335 (= lt!4836 call!715)))

(declare-fun c!1874 () Bool)

(assert (=> b!18335 (= c!1874 ((_ is MissingZero!44) lt!4836))))

(assert (=> b!18335 e!11764))

(declare-fun lt!4830 () Unit!359)

(assert (=> b!18335 (= lt!4830 lt!4839)))

(assert (=> b!18335 false))

(declare-fun b!18336 () Bool)

(declare-fun e!11770 () Unit!359)

(declare-fun Unit!363 () Unit!359)

(assert (=> b!18336 (= e!11770 Unit!363)))

(declare-fun lt!4831 () Unit!359)

(declare-fun call!694 () Unit!359)

(assert (=> b!18336 (= lt!4831 call!694)))

(declare-fun lt!4847 () SeekEntryResult!44)

(declare-fun call!693 () SeekEntryResult!44)

(assert (=> b!18336 (= lt!4847 call!693)))

(declare-fun res!12793 () Bool)

(assert (=> b!18336 (= res!12793 ((_ is Found!44) lt!4847))))

(declare-fun e!11766 () Bool)

(assert (=> b!18336 (=> (not res!12793) (not e!11766))))

(assert (=> b!18336 e!11766))

(declare-fun lt!4843 () Unit!359)

(assert (=> b!18336 (= lt!4843 lt!4831)))

(assert (=> b!18336 false))

(declare-fun b!18337 () Bool)

(declare-fun res!12785 () Bool)

(declare-fun lt!4835 () SeekEntryResult!44)

(assert (=> b!18337 (= res!12785 (= (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2298 lt!4835)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!11775 () Bool)

(assert (=> b!18337 (=> (not res!12785) (not e!11775))))

(declare-fun b!18338 () Bool)

(declare-fun res!12783 () Bool)

(declare-fun e!11774 () Bool)

(assert (=> b!18338 (=> (not res!12783) (not e!11774))))

(declare-fun call!697 () Bool)

(assert (=> b!18338 (= res!12783 call!697)))

(assert (=> b!18338 (= e!11764 e!11774)))

(declare-fun b!18339 () Bool)

(declare-fun res!12781 () Bool)

(assert (=> b!18339 (=> (not res!12781) (not e!11774))))

(assert (=> b!18339 (= res!12781 (= (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2295 lt!4836)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!11777 () Bool)

(declare-fun call!699 () ListLongMap!533)

(declare-fun call!700 () ListLongMap!533)

(declare-fun b!18340 () Bool)

(assert (=> b!18340 (= e!11777 (= call!700 (+!35 call!699 (tuple2!795 key!682 v!259))))))

(declare-fun b!18341 () Bool)

(declare-fun lt!4844 () Unit!359)

(declare-fun lt!4829 () Unit!359)

(assert (=> b!18341 (= lt!4844 lt!4829)))

(declare-fun call!711 () ListLongMap!533)

(assert (=> b!18341 (= call!714 call!711)))

(declare-fun lt!4846 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!2 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 V!1043 Int) Unit!359)

(assert (=> b!18341 (= lt!4829 (lemmaChangeLongMinValueKeyThenAddPairToListMap!2 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4846 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(assert (=> b!18341 (= lt!4846 (bvor (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000010))))

(assert (=> b!18341 (= e!11773 (tuple2!791 true (LongMapFixedSize!101 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (bvor (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000010) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259 (_size!82 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_vacant!82 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun b!18342 () Bool)

(declare-fun call!698 () Bool)

(assert (=> b!18342 (= e!11775 (not call!698))))

(declare-fun bm!690 () Bool)

(declare-fun call!709 () Bool)

(declare-fun call!712 () ListLongMap!533)

(assert (=> bm!690 (= call!709 (contains!214 call!712 key!682))))

(declare-fun b!18343 () Bool)

(declare-fun res!12794 () Bool)

(declare-fun call!704 () Bool)

(assert (=> b!18343 (= res!12794 call!704)))

(declare-fun e!11781 () Bool)

(assert (=> b!18343 (=> (not res!12794) (not e!11781))))

(declare-fun b!18344 () Bool)

(declare-fun lt!4832 () Unit!359)

(declare-fun lt!4825 () Unit!359)

(assert (=> b!18344 (= lt!4832 lt!4825)))

(declare-fun call!695 () ListLongMap!533)

(declare-fun lt!4838 () SeekEntryResult!44)

(assert (=> b!18344 (contains!214 call!695 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4838)))))

(declare-fun lt!4845 () array!1013)

(declare-fun lemmaValidKeyInArrayIsInListMap!2 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 32) Int) Unit!359)

(assert (=> b!18344 (= lt!4825 (lemmaValidKeyInArrayIsInListMap!2 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4845 (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (index!2296 lt!4838) (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(assert (=> b!18344 (= lt!4845 (array!1014 (store (arr!488 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4838) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun lt!4834 () Unit!359)

(declare-fun lt!4851 () Unit!359)

(assert (=> b!18344 (= lt!4834 lt!4851)))

(declare-fun call!708 () ListLongMap!533)

(declare-fun call!696 () ListLongMap!533)

(assert (=> b!18344 (= call!708 call!696)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!2 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 32) (_ BitVec 64) V!1043 Int) Unit!359)

(assert (=> b!18344 (= lt!4851 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!2 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (index!2296 lt!4838) key!682 v!259 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun lt!4849 () Unit!359)

(assert (=> b!18344 (= lt!4849 e!11762)))

(declare-fun c!1871 () Bool)

(assert (=> b!18344 (= c!1871 call!709)))

(declare-fun e!11769 () tuple2!790)

(assert (=> b!18344 (= e!11769 (tuple2!791 true (LongMapFixedSize!101 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_size!82 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (array!1014 (store (arr!488 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4838) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))))) (_vacant!82 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun bm!691 () Bool)

(declare-fun getCurrentListMap!119 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 32) Int) ListLongMap!533)

(assert (=> bm!691 (= call!712 (getCurrentListMap!119 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun b!18345 () Bool)

(declare-fun res!12788 () Bool)

(assert (=> b!18345 (= res!12788 (= (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2298 lt!4836)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!11778 () Bool)

(assert (=> b!18345 (=> (not res!12788) (not e!11778))))

(declare-fun b!18346 () Bool)

(declare-fun e!11772 () Bool)

(assert (=> b!18346 (= e!11772 ((_ is Undefined!44) lt!4835))))

(declare-fun bm!692 () Bool)

(declare-fun call!710 () SeekEntryResult!44)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1015 (_ BitVec 32)) SeekEntryResult!44)

(assert (=> bm!692 (= call!710 (seekEntryOrOpen!0 key!682 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun b!18347 () Bool)

(assert (=> b!18347 (= e!11772 e!11775)))

(declare-fun res!12789 () Bool)

(declare-fun call!716 () Bool)

(assert (=> b!18347 (= res!12789 call!716)))

(assert (=> b!18347 (=> (not res!12789) (not e!11775))))

(declare-fun b!18348 () Bool)

(declare-fun lt!4837 () Unit!359)

(assert (=> b!18348 (= e!11770 lt!4837)))

(assert (=> b!18348 (= lt!4837 call!706)))

(assert (=> b!18348 (= lt!4835 call!693)))

(declare-fun c!1873 () Bool)

(assert (=> b!18348 (= c!1873 ((_ is MissingZero!44) lt!4835))))

(declare-fun e!11771 () Bool)

(assert (=> b!18348 e!11771))

(declare-fun b!18349 () Bool)

(declare-fun e!11767 () tuple2!790)

(declare-fun lt!4840 () tuple2!790)

(assert (=> b!18349 (= e!11767 (tuple2!791 (_1!396 lt!4840) (_2!396 lt!4840)))))

(declare-fun call!705 () tuple2!790)

(assert (=> b!18349 (= lt!4840 call!705)))

(declare-fun bm!693 () Bool)

(declare-fun call!703 () Bool)

(declare-fun call!713 () Bool)

(assert (=> bm!693 (= call!703 call!713)))

(declare-fun b!18350 () Bool)

(assert (=> b!18350 (= e!11768 ((_ is Undefined!44) lt!4836))))

(declare-fun b!18351 () Bool)

(declare-fun c!1864 () Bool)

(assert (=> b!18351 (= c!1864 ((_ is MissingVacant!44) lt!4838))))

(declare-fun e!11776 () tuple2!790)

(assert (=> b!18351 (= e!11776 e!11767)))

(declare-fun bm!694 () Bool)

(declare-fun call!707 () Bool)

(declare-fun arrayContainsKey!0 (array!1015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!694 (= call!707 (arrayContainsKey!0 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) key!682 #b00000000000000000000000000000000))))

(declare-fun c!1869 () Bool)

(declare-fun bm!695 () Bool)

(declare-fun c!1870 () Bool)

(declare-fun lt!4828 () SeekEntryResult!44)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!695 (= call!713 (inRange!0 (ite c!1870 (ite c!1869 (index!2296 lt!4847) (ite c!1873 (index!2295 lt!4835) (index!2298 lt!4835))) (ite c!1871 (index!2296 lt!4828) (ite c!1874 (index!2295 lt!4836) (index!2298 lt!4836)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun bm!696 () Bool)

(declare-fun updateHelperNewKey!2 (LongMapFixedSize!100 (_ BitVec 64) V!1043 (_ BitVec 32)) tuple2!790)

(assert (=> bm!696 (= call!705 (updateHelperNewKey!2 (v!1470 (underlying!61 (_2!397 lt!4692))) key!682 v!259 (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838))))))

(declare-fun b!18352 () Bool)

(declare-fun res!12792 () Bool)

(declare-fun e!11780 () Bool)

(assert (=> b!18352 (=> (not res!12792) (not e!11780))))

(assert (=> b!18352 (= res!12792 call!716)))

(assert (=> b!18352 (= e!11771 e!11780)))

(declare-fun bm!697 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!2 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 64) Int) Unit!359)

(assert (=> bm!697 (= call!694 (lemmaInListMapThenSeekEntryOrOpenFindsIt!2 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) key!682 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun bm!698 () Bool)

(assert (=> bm!698 (= call!715 call!710)))

(declare-fun b!18353 () Bool)

(declare-fun lt!4833 () tuple2!790)

(assert (=> b!18353 (= lt!4833 call!705)))

(assert (=> b!18353 (= e!11769 (tuple2!791 (_1!396 lt!4833) (_2!396 lt!4833)))))

(declare-fun b!18354 () Bool)

(declare-fun c!1872 () Bool)

(assert (=> b!18354 (= c!1872 ((_ is MissingVacant!44) lt!4835))))

(assert (=> b!18354 (= e!11771 e!11772)))

(declare-fun bm!699 () Bool)

(assert (=> bm!699 (= call!701 call!695)))

(declare-fun bm!700 () Bool)

(assert (=> bm!700 (= call!699 (map!357 (v!1470 (underlying!61 (_2!397 lt!4692)))))))

(declare-fun bm!701 () Bool)

(assert (=> bm!701 (= call!704 call!713)))

(declare-fun b!18355 () Bool)

(assert (=> b!18355 (= e!11767 e!11769)))

(declare-fun c!1863 () Bool)

(assert (=> b!18355 (= c!1863 ((_ is MissingZero!44) lt!4838))))

(declare-fun bm!702 () Bool)

(declare-fun c!1868 () Bool)

(assert (=> bm!702 (= call!695 (getCurrentListMap!119 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4845) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite (and c!1868 c!1867) lt!4826 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) (ite (and c!1868 c!1867) v!259 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun b!18356 () Bool)

(declare-fun e!11763 () Bool)

(declare-fun e!11779 () Bool)

(assert (=> b!18356 (= e!11763 e!11779)))

(declare-fun c!1866 () Bool)

(declare-fun lt!4827 () tuple2!790)

(assert (=> b!18356 (= c!1866 (_1!396 lt!4827))))

(declare-fun bm!703 () Bool)

(assert (=> bm!703 (= call!716 call!703)))

(declare-fun b!18357 () Bool)

(assert (=> b!18357 (= e!11780 (not call!698))))

(declare-fun b!18358 () Bool)

(assert (=> b!18358 (= e!11781 (= (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4828)) key!682))))

(declare-fun b!18359 () Bool)

(declare-fun call!702 () Bool)

(assert (=> b!18359 (= e!11774 (not call!702))))

(declare-fun b!18360 () Bool)

(declare-fun res!12784 () Bool)

(assert (=> b!18360 (= res!12784 call!703)))

(assert (=> b!18360 (=> (not res!12784) (not e!11766))))

(declare-fun b!18361 () Bool)

(declare-fun res!12791 () Bool)

(assert (=> b!18361 (=> (not res!12791) (not e!11780))))

(assert (=> b!18361 (= res!12791 (= (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2295 lt!4835)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!704 () Bool)

(assert (=> bm!704 (= call!714 call!708)))

(declare-fun b!18362 () Bool)

(assert (=> b!18362 (= e!11779 e!11777)))

(declare-fun res!12790 () Bool)

(assert (=> b!18362 (= res!12790 (contains!214 call!700 key!682))))

(assert (=> b!18362 (=> (not res!12790) (not e!11777))))

(declare-fun bm!705 () Bool)

(assert (=> bm!705 (= call!693 call!710)))

(declare-fun b!18363 () Bool)

(declare-fun lt!4841 () Unit!359)

(assert (=> b!18363 (= e!11762 lt!4841)))

(assert (=> b!18363 (= lt!4841 call!694)))

(assert (=> b!18363 (= lt!4828 call!715)))

(declare-fun res!12787 () Bool)

(assert (=> b!18363 (= res!12787 ((_ is Found!44) lt!4828))))

(assert (=> b!18363 (=> (not res!12787) (not e!11781))))

(assert (=> b!18363 e!11781))

(declare-fun bm!706 () Bool)

(assert (=> bm!706 (= call!711 call!696)))

(declare-fun bm!707 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!2 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 64) Int) Unit!359)

(assert (=> bm!707 (= call!706 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!2 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) key!682 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun bm!708 () Bool)

(assert (=> bm!708 (= call!702 call!707)))

(declare-fun d!3397 () Bool)

(assert (=> d!3397 e!11763))

(declare-fun res!12782 () Bool)

(assert (=> d!3397 (=> (not res!12782) (not e!11763))))

(assert (=> d!3397 (= res!12782 (valid!59 (_2!396 lt!4827)))))

(assert (=> d!3397 (= lt!4827 e!11765)))

(assert (=> d!3397 (= c!1868 (= key!682 (bvneg key!682)))))

(assert (=> d!3397 (valid!59 (v!1470 (underlying!61 (_2!397 lt!4692))))))

(assert (=> d!3397 (= (update!13 (v!1470 (underlying!61 (_2!397 lt!4692))) key!682 v!259) lt!4827)))

(declare-fun b!18364 () Bool)

(assert (=> b!18364 (= e!11779 (= call!700 call!699))))

(declare-fun b!18365 () Bool)

(assert (=> b!18365 (= e!11766 (= (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4847)) key!682))))

(declare-fun bm!709 () Bool)

(assert (=> bm!709 (= call!697 call!704)))

(declare-fun bm!710 () Bool)

(assert (=> bm!710 (= call!696 (getCurrentListMap!119 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (array!1014 (store (arr!488 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4838) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (ite c!1867 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4846) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (ite c!1867 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun b!18366 () Bool)

(assert (=> b!18366 (= e!11778 (not call!702))))

(declare-fun b!18367 () Bool)

(assert (=> b!18367 (= e!11768 e!11778)))

(declare-fun res!12786 () Bool)

(assert (=> b!18367 (= res!12786 call!697)))

(assert (=> b!18367 (=> (not res!12786) (not e!11778))))

(declare-fun b!18368 () Bool)

(declare-fun lt!4842 () Unit!359)

(assert (=> b!18368 (= lt!4842 e!11770)))

(assert (=> b!18368 (= c!1869 call!709)))

(assert (=> b!18368 (= e!11776 (tuple2!791 false (v!1470 (underlying!61 (_2!397 lt!4692)))))))

(declare-fun bm!711 () Bool)

(assert (=> bm!711 (= call!698 call!707)))

(declare-fun bm!712 () Bool)

(assert (=> bm!712 (= call!708 (+!35 (ite c!1868 (ite c!1867 call!711 call!701) call!712) (ite c!1868 (ite c!1867 (tuple2!795 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!795 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!795 key!682 v!259))))))

(declare-fun bm!713 () Bool)

(assert (=> bm!713 (= call!700 (map!357 (_2!396 lt!4827)))))

(declare-fun b!18369 () Bool)

(assert (=> b!18369 (= e!11765 e!11776)))

(assert (=> b!18369 (= lt!4838 (seekEntryOrOpen!0 key!682 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(assert (=> b!18369 (= c!1870 ((_ is Undefined!44) lt!4838))))

(assert (= (and d!3397 c!1868) b!18332))

(assert (= (and d!3397 (not c!1868)) b!18369))

(assert (= (and b!18332 c!1867) b!18334))

(assert (= (and b!18332 (not c!1867)) b!18341))

(assert (= (or b!18334 b!18341) bm!706))

(assert (= (or b!18334 b!18341) bm!699))

(assert (= (or b!18334 b!18341) bm!704))

(assert (= (and b!18369 c!1870) b!18368))

(assert (= (and b!18369 (not c!1870)) b!18351))

(assert (= (and b!18368 c!1869) b!18336))

(assert (= (and b!18368 (not c!1869)) b!18348))

(assert (= (and b!18336 res!12793) b!18360))

(assert (= (and b!18360 res!12784) b!18365))

(assert (= (and b!18348 c!1873) b!18352))

(assert (= (and b!18348 (not c!1873)) b!18354))

(assert (= (and b!18352 res!12792) b!18361))

(assert (= (and b!18361 res!12791) b!18357))

(assert (= (and b!18354 c!1872) b!18347))

(assert (= (and b!18354 (not c!1872)) b!18346))

(assert (= (and b!18347 res!12789) b!18337))

(assert (= (and b!18337 res!12785) b!18342))

(assert (= (or b!18352 b!18347) bm!703))

(assert (= (or b!18357 b!18342) bm!711))

(assert (= (or b!18360 bm!703) bm!693))

(assert (= (or b!18336 b!18348) bm!705))

(assert (= (and b!18351 c!1864) b!18349))

(assert (= (and b!18351 (not c!1864)) b!18355))

(assert (= (and b!18355 c!1863) b!18353))

(assert (= (and b!18355 (not c!1863)) b!18344))

(assert (= (and b!18344 c!1871) b!18363))

(assert (= (and b!18344 (not c!1871)) b!18335))

(assert (= (and b!18363 res!12787) b!18343))

(assert (= (and b!18343 res!12794) b!18358))

(assert (= (and b!18335 c!1874) b!18338))

(assert (= (and b!18335 (not c!1874)) b!18333))

(assert (= (and b!18338 res!12783) b!18339))

(assert (= (and b!18339 res!12781) b!18359))

(assert (= (and b!18333 c!1865) b!18367))

(assert (= (and b!18333 (not c!1865)) b!18350))

(assert (= (and b!18367 res!12786) b!18345))

(assert (= (and b!18345 res!12788) b!18366))

(assert (= (or b!18338 b!18367) bm!709))

(assert (= (or b!18359 b!18366) bm!708))

(assert (= (or b!18343 bm!709) bm!701))

(assert (= (or b!18363 b!18335) bm!698))

(assert (= (or b!18349 b!18353) bm!696))

(assert (= (or b!18336 b!18363) bm!697))

(assert (= (or b!18368 b!18344) bm!691))

(assert (= (or bm!711 bm!708) bm!694))

(assert (= (or bm!705 bm!698) bm!692))

(assert (= (or bm!693 bm!701) bm!695))

(assert (= (or b!18348 b!18335) bm!707))

(assert (= (or b!18368 b!18344) bm!690))

(assert (= (or bm!704 b!18344) bm!712))

(assert (= (or bm!706 b!18344) bm!710))

(assert (= (or bm!699 b!18344) bm!702))

(assert (= (and d!3397 res!12782) b!18356))

(assert (= (and b!18356 c!1866) b!18362))

(assert (= (and b!18356 (not c!1866)) b!18364))

(assert (= (and b!18362 res!12790) b!18340))

(assert (= (or b!18340 b!18364) bm!700))

(assert (= (or b!18362 b!18340 b!18364) bm!713))

(declare-fun m!12687 () Bool)

(assert (=> b!18334 m!12687))

(declare-fun m!12689 () Bool)

(assert (=> b!18362 m!12689))

(declare-fun m!12691 () Bool)

(assert (=> bm!707 m!12691))

(declare-fun m!12693 () Bool)

(assert (=> b!18337 m!12693))

(declare-fun m!12695 () Bool)

(assert (=> bm!694 m!12695))

(declare-fun m!12697 () Bool)

(assert (=> bm!713 m!12697))

(declare-fun m!12699 () Bool)

(assert (=> bm!696 m!12699))

(declare-fun m!12701 () Bool)

(assert (=> bm!692 m!12701))

(declare-fun m!12703 () Bool)

(assert (=> b!18345 m!12703))

(declare-fun m!12705 () Bool)

(assert (=> b!18341 m!12705))

(declare-fun m!12707 () Bool)

(assert (=> bm!702 m!12707))

(declare-fun m!12709 () Bool)

(assert (=> bm!690 m!12709))

(declare-fun m!12711 () Bool)

(assert (=> bm!712 m!12711))

(declare-fun m!12713 () Bool)

(assert (=> bm!700 m!12713))

(assert (=> b!18369 m!12701))

(declare-fun m!12715 () Bool)

(assert (=> b!18361 m!12715))

(declare-fun m!12717 () Bool)

(assert (=> bm!695 m!12717))

(declare-fun m!12719 () Bool)

(assert (=> b!18365 m!12719))

(declare-fun m!12721 () Bool)

(assert (=> b!18340 m!12721))

(declare-fun m!12723 () Bool)

(assert (=> b!18344 m!12723))

(declare-fun m!12725 () Bool)

(assert (=> b!18344 m!12725))

(assert (=> b!18344 m!12723))

(declare-fun m!12727 () Bool)

(assert (=> b!18344 m!12727))

(declare-fun m!12729 () Bool)

(assert (=> b!18344 m!12729))

(declare-fun m!12731 () Bool)

(assert (=> b!18344 m!12731))

(declare-fun m!12733 () Bool)

(assert (=> b!18358 m!12733))

(declare-fun m!12735 () Bool)

(assert (=> b!18339 m!12735))

(declare-fun m!12737 () Bool)

(assert (=> bm!697 m!12737))

(declare-fun m!12739 () Bool)

(assert (=> d!3397 m!12739))

(declare-fun m!12741 () Bool)

(assert (=> d!3397 m!12741))

(declare-fun m!12743 () Bool)

(assert (=> bm!691 m!12743))

(assert (=> bm!710 m!12729))

(declare-fun m!12745 () Bool)

(assert (=> bm!710 m!12745))

(assert (=> b!18116 d!3397))

(declare-fun d!3399 () Bool)

(assert (=> d!3399 (= (valid!56 thiss!848) (valid!59 (v!1470 (underlying!61 thiss!848))))))

(declare-fun bs!841 () Bool)

(assert (= bs!841 d!3399))

(declare-fun m!12747 () Bool)

(assert (=> bs!841 m!12747))

(assert (=> start!3032 d!3399))

(declare-fun d!3401 () Bool)

(assert (=> d!3401 (= (array_inv!347 (_keys!3086 (v!1470 (underlying!61 thiss!848)))) (bvsge (size!579 (_keys!3086 (v!1470 (underlying!61 thiss!848)))) #b00000000000000000000000000000000))))

(assert (=> b!18125 d!3401))

(declare-fun d!3403 () Bool)

(assert (=> d!3403 (= (array_inv!348 (_values!1658 (v!1470 (underlying!61 thiss!848)))) (bvsge (size!578 (_values!1658 (v!1470 (underlying!61 thiss!848)))) #b00000000000000000000000000000000))))

(assert (=> b!18125 d!3403))

(declare-fun condMapEmpty!813 () Bool)

(declare-fun mapDefault!813 () ValueCell!257)

(assert (=> mapNonEmpty!804 (= condMapEmpty!813 (= mapRest!804 ((as const (Array (_ BitVec 32) ValueCell!257)) mapDefault!813)))))

(declare-fun e!11787 () Bool)

(declare-fun mapRes!813 () Bool)

(assert (=> mapNonEmpty!804 (= tp!3138 (and e!11787 mapRes!813))))

(declare-fun b!18376 () Bool)

(declare-fun e!11786 () Bool)

(assert (=> b!18376 (= e!11786 tp_is_empty!913)))

(declare-fun b!18377 () Bool)

(assert (=> b!18377 (= e!11787 tp_is_empty!913)))

(declare-fun mapIsEmpty!813 () Bool)

(assert (=> mapIsEmpty!813 mapRes!813))

(declare-fun mapNonEmpty!813 () Bool)

(declare-fun tp!3153 () Bool)

(assert (=> mapNonEmpty!813 (= mapRes!813 (and tp!3153 e!11786))))

(declare-fun mapKey!813 () (_ BitVec 32))

(declare-fun mapRest!813 () (Array (_ BitVec 32) ValueCell!257))

(declare-fun mapValue!813 () ValueCell!257)

(assert (=> mapNonEmpty!813 (= mapRest!804 (store mapRest!813 mapKey!813 mapValue!813))))

(assert (= (and mapNonEmpty!804 condMapEmpty!813) mapIsEmpty!813))

(assert (= (and mapNonEmpty!804 (not condMapEmpty!813)) mapNonEmpty!813))

(assert (= (and mapNonEmpty!813 ((_ is ValueCellFull!257) mapValue!813)) b!18376))

(assert (= (and mapNonEmpty!804 ((_ is ValueCellFull!257) mapDefault!813)) b!18377))

(declare-fun m!12749 () Bool)

(assert (=> mapNonEmpty!813 m!12749))

(check-sat (not bm!713) (not bm!707) (not b!18248) (not d!3393) (not bm!696) (not bm!691) (not b!18226) (not b!18254) (not b!18362) (not d!3397) (not bm!641) tp_is_empty!913 (not b!18340) (not b_next!649) (not bm!710) (not bm!695) b_and!1291 (not bm!702) (not b!18228) (not bm!700) (not b!18250) (not d!3385) (not bm!694) (not d!3389) (not b!18344) (not b!18218) (not b!18341) (not bm!697) (not mapNonEmpty!813) (not bm!712) (not b!18369) (not d!3383) (not d!3399) (not b!18334) (not bm!690) (not d!3395) (not b!18219) (not bm!692) (not bm!638) (not d!3391))
(check-sat b_and!1291 (not b_next!649))
(get-model)

(declare-fun d!3405 () Bool)

(declare-fun e!11788 () Bool)

(assert (=> d!3405 e!11788))

(declare-fun res!12795 () Bool)

(assert (=> d!3405 (=> (not res!12795) (not e!11788))))

(declare-fun lt!4852 () ListLongMap!533)

(assert (=> d!3405 (= res!12795 (contains!214 lt!4852 (_1!398 (ite c!1868 (ite c!1867 (tuple2!795 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!795 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!795 key!682 v!259)))))))

(declare-fun lt!4855 () List!535)

(assert (=> d!3405 (= lt!4852 (ListLongMap!534 lt!4855))))

(declare-fun lt!4853 () Unit!359)

(declare-fun lt!4854 () Unit!359)

(assert (=> d!3405 (= lt!4853 lt!4854)))

(assert (=> d!3405 (= (getValueByKey!58 lt!4855 (_1!398 (ite c!1868 (ite c!1867 (tuple2!795 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!795 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!795 key!682 v!259)))) (Some!63 (_2!398 (ite c!1868 (ite c!1867 (tuple2!795 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!795 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!795 key!682 v!259)))))))

(assert (=> d!3405 (= lt!4854 (lemmaContainsTupThenGetReturnValue!16 lt!4855 (_1!398 (ite c!1868 (ite c!1867 (tuple2!795 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!795 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!795 key!682 v!259))) (_2!398 (ite c!1868 (ite c!1867 (tuple2!795 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!795 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!795 key!682 v!259)))))))

(assert (=> d!3405 (= lt!4855 (insertStrictlySorted!16 (toList!282 (ite c!1868 (ite c!1867 call!711 call!701) call!712)) (_1!398 (ite c!1868 (ite c!1867 (tuple2!795 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!795 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!795 key!682 v!259))) (_2!398 (ite c!1868 (ite c!1867 (tuple2!795 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!795 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!795 key!682 v!259)))))))

(assert (=> d!3405 (= (+!35 (ite c!1868 (ite c!1867 call!711 call!701) call!712) (ite c!1868 (ite c!1867 (tuple2!795 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!795 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!795 key!682 v!259))) lt!4852)))

(declare-fun b!18378 () Bool)

(declare-fun res!12796 () Bool)

(assert (=> b!18378 (=> (not res!12796) (not e!11788))))

(assert (=> b!18378 (= res!12796 (= (getValueByKey!58 (toList!282 lt!4852) (_1!398 (ite c!1868 (ite c!1867 (tuple2!795 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!795 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!795 key!682 v!259)))) (Some!63 (_2!398 (ite c!1868 (ite c!1867 (tuple2!795 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!795 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!795 key!682 v!259))))))))

(declare-fun b!18379 () Bool)

(assert (=> b!18379 (= e!11788 (contains!217 (toList!282 lt!4852) (ite c!1868 (ite c!1867 (tuple2!795 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!795 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!795 key!682 v!259))))))

(assert (= (and d!3405 res!12795) b!18378))

(assert (= (and b!18378 res!12796) b!18379))

(declare-fun m!12751 () Bool)

(assert (=> d!3405 m!12751))

(declare-fun m!12753 () Bool)

(assert (=> d!3405 m!12753))

(declare-fun m!12755 () Bool)

(assert (=> d!3405 m!12755))

(declare-fun m!12757 () Bool)

(assert (=> d!3405 m!12757))

(declare-fun m!12759 () Bool)

(assert (=> b!18378 m!12759))

(declare-fun m!12761 () Bool)

(assert (=> b!18379 m!12761))

(assert (=> bm!712 d!3405))

(declare-fun d!3407 () Bool)

(declare-fun res!12803 () Bool)

(declare-fun e!11791 () Bool)

(assert (=> d!3407 (=> (not res!12803) (not e!11791))))

(declare-fun simpleValid!9 (LongMapFixedSize!100) Bool)

(assert (=> d!3407 (= res!12803 (simpleValid!9 (v!1470 (underlying!61 thiss!848))))))

(assert (=> d!3407 (= (valid!59 (v!1470 (underlying!61 thiss!848))) e!11791)))

(declare-fun b!18386 () Bool)

(declare-fun res!12804 () Bool)

(assert (=> b!18386 (=> (not res!12804) (not e!11791))))

(declare-fun arrayCountValidKeys!0 (array!1015 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!18386 (= res!12804 (= (arrayCountValidKeys!0 (_keys!3086 (v!1470 (underlying!61 thiss!848))) #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 thiss!848))))) (_size!82 (v!1470 (underlying!61 thiss!848)))))))

(declare-fun b!18387 () Bool)

(declare-fun res!12805 () Bool)

(assert (=> b!18387 (=> (not res!12805) (not e!11791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1015 (_ BitVec 32)) Bool)

(assert (=> b!18387 (= res!12805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3086 (v!1470 (underlying!61 thiss!848))) (mask!4594 (v!1470 (underlying!61 thiss!848)))))))

(declare-fun b!18388 () Bool)

(declare-datatypes ((List!538 0))(
  ( (Nil!535) (Cons!534 (h!1100 (_ BitVec 64)) (t!3174 List!538)) )
))
(declare-fun arrayNoDuplicates!0 (array!1015 (_ BitVec 32) List!538) Bool)

(assert (=> b!18388 (= e!11791 (arrayNoDuplicates!0 (_keys!3086 (v!1470 (underlying!61 thiss!848))) #b00000000000000000000000000000000 Nil!535))))

(assert (= (and d!3407 res!12803) b!18386))

(assert (= (and b!18386 res!12804) b!18387))

(assert (= (and b!18387 res!12805) b!18388))

(declare-fun m!12763 () Bool)

(assert (=> d!3407 m!12763))

(declare-fun m!12765 () Bool)

(assert (=> b!18386 m!12765))

(declare-fun m!12767 () Bool)

(assert (=> b!18387 m!12767))

(declare-fun m!12769 () Bool)

(assert (=> b!18388 m!12769))

(assert (=> d!3399 d!3407))

(declare-fun lt!4863 () SeekEntryResult!44)

(declare-fun b!18401 () Bool)

(declare-fun e!11800 () SeekEntryResult!44)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!1015 (_ BitVec 32)) SeekEntryResult!44)

(assert (=> b!18401 (= e!11800 (seekKeyOrZeroReturnVacant!0 (x!4489 lt!4863) (index!2297 lt!4863) (index!2297 lt!4863) key!682 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun b!18402 () Bool)

(declare-fun e!11799 () SeekEntryResult!44)

(assert (=> b!18402 (= e!11799 Undefined!44)))

(declare-fun b!18403 () Bool)

(declare-fun e!11798 () SeekEntryResult!44)

(assert (=> b!18403 (= e!11798 (Found!44 (index!2297 lt!4863)))))

(declare-fun d!3409 () Bool)

(declare-fun lt!4864 () SeekEntryResult!44)

(assert (=> d!3409 (and (or ((_ is Undefined!44) lt!4864) (not ((_ is Found!44) lt!4864)) (and (bvsge (index!2296 lt!4864) #b00000000000000000000000000000000) (bvslt (index!2296 lt!4864) (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))) (or ((_ is Undefined!44) lt!4864) ((_ is Found!44) lt!4864) (not ((_ is MissingZero!44) lt!4864)) (and (bvsge (index!2295 lt!4864) #b00000000000000000000000000000000) (bvslt (index!2295 lt!4864) (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))) (or ((_ is Undefined!44) lt!4864) ((_ is Found!44) lt!4864) ((_ is MissingZero!44) lt!4864) (not ((_ is MissingVacant!44) lt!4864)) (and (bvsge (index!2298 lt!4864) #b00000000000000000000000000000000) (bvslt (index!2298 lt!4864) (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))) (or ((_ is Undefined!44) lt!4864) (ite ((_ is Found!44) lt!4864) (= (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4864)) key!682) (ite ((_ is MissingZero!44) lt!4864) (= (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2295 lt!4864)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!44) lt!4864) (= (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2298 lt!4864)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!3409 (= lt!4864 e!11799)))

(declare-fun c!1881 () Bool)

(assert (=> d!3409 (= c!1881 (and ((_ is Intermediate!44) lt!4863) (undefined!856 lt!4863)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!1015 (_ BitVec 32)) SeekEntryResult!44)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3409 (= lt!4863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!682 (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692))))) key!682 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!3409 (validMask!0 (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))))))

(assert (=> d!3409 (= (seekEntryOrOpen!0 key!682 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692))))) lt!4864)))

(declare-fun b!18404 () Bool)

(declare-fun c!1882 () Bool)

(declare-fun lt!4862 () (_ BitVec 64))

(assert (=> b!18404 (= c!1882 (= lt!4862 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!18404 (= e!11798 e!11800)))

(declare-fun b!18405 () Bool)

(assert (=> b!18405 (= e!11800 (MissingZero!44 (index!2297 lt!4863)))))

(declare-fun b!18406 () Bool)

(assert (=> b!18406 (= e!11799 e!11798)))

(assert (=> b!18406 (= lt!4862 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2297 lt!4863)))))

(declare-fun c!1883 () Bool)

(assert (=> b!18406 (= c!1883 (= lt!4862 key!682))))

(assert (= (and d!3409 c!1881) b!18402))

(assert (= (and d!3409 (not c!1881)) b!18406))

(assert (= (and b!18406 c!1883) b!18403))

(assert (= (and b!18406 (not c!1883)) b!18404))

(assert (= (and b!18404 c!1882) b!18405))

(assert (= (and b!18404 (not c!1882)) b!18401))

(declare-fun m!12771 () Bool)

(assert (=> b!18401 m!12771))

(declare-fun m!12773 () Bool)

(assert (=> d!3409 m!12773))

(declare-fun m!12775 () Bool)

(assert (=> d!3409 m!12775))

(assert (=> d!3409 m!12773))

(declare-fun m!12777 () Bool)

(assert (=> d!3409 m!12777))

(declare-fun m!12779 () Bool)

(assert (=> d!3409 m!12779))

(declare-fun m!12781 () Bool)

(assert (=> d!3409 m!12781))

(declare-fun m!12783 () Bool)

(assert (=> d!3409 m!12783))

(declare-fun m!12785 () Bool)

(assert (=> b!18406 m!12785))

(assert (=> bm!692 d!3409))

(declare-fun d!3411 () Bool)

(assert (=> d!3411 (= (map!357 (_2!396 lt!4827)) (getCurrentListMap!119 (_keys!3086 (_2!396 lt!4827)) (_values!1658 (_2!396 lt!4827)) (mask!4594 (_2!396 lt!4827)) (extraKeys!1574 (_2!396 lt!4827)) (zeroValue!1597 (_2!396 lt!4827)) (minValue!1597 (_2!396 lt!4827)) #b00000000000000000000000000000000 (defaultEntry!1661 (_2!396 lt!4827))))))

(declare-fun bs!842 () Bool)

(assert (= bs!842 d!3411))

(declare-fun m!12787 () Bool)

(assert (=> bs!842 m!12787))

(assert (=> bm!713 d!3411))

(assert (=> b!18369 d!3409))

(declare-fun b!18449 () Bool)

(declare-fun e!11828 () ListLongMap!533)

(declare-fun call!733 () ListLongMap!533)

(assert (=> b!18449 (= e!11828 (+!35 call!733 (tuple2!795 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun b!18450 () Bool)

(declare-fun e!11827 () Bool)

(declare-fun e!11830 () Bool)

(assert (=> b!18450 (= e!11827 e!11830)))

(declare-fun res!12830 () Bool)

(declare-fun call!734 () Bool)

(assert (=> b!18450 (= res!12830 call!734)))

(assert (=> b!18450 (=> (not res!12830) (not e!11830))))

(declare-fun b!18451 () Bool)

(declare-fun e!11835 () Bool)

(declare-fun e!11834 () Bool)

(assert (=> b!18451 (= e!11835 e!11834)))

(declare-fun c!1896 () Bool)

(assert (=> b!18451 (= c!1896 (not (= (bvand (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!18452 () Bool)

(declare-fun lt!4918 () ListLongMap!533)

(declare-fun apply!27 (ListLongMap!533 (_ BitVec 64)) V!1043)

(assert (=> b!18452 (= e!11830 (= (apply!27 lt!4918 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun b!18453 () Bool)

(declare-fun e!11829 () Bool)

(assert (=> b!18453 (= e!11834 e!11829)))

(declare-fun res!12827 () Bool)

(declare-fun call!732 () Bool)

(assert (=> b!18453 (= res!12827 call!732)))

(assert (=> b!18453 (=> (not res!12827) (not e!11829))))

(declare-fun b!18454 () Bool)

(declare-fun e!11839 () ListLongMap!533)

(declare-fun call!737 () ListLongMap!533)

(assert (=> b!18454 (= e!11839 call!737)))

(declare-fun bm!728 () Bool)

(assert (=> bm!728 (= call!734 (contains!214 lt!4918 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18455 () Bool)

(assert (=> b!18455 (= e!11827 (not call!734))))

(declare-fun b!18456 () Bool)

(declare-fun e!11836 () ListLongMap!533)

(assert (=> b!18456 (= e!11836 call!737)))

(declare-fun b!18457 () Bool)

(declare-fun e!11838 () Unit!359)

(declare-fun Unit!364 () Unit!359)

(assert (=> b!18457 (= e!11838 Unit!364)))

(declare-fun b!18458 () Bool)

(declare-fun res!12826 () Bool)

(assert (=> b!18458 (=> (not res!12826) (not e!11835))))

(declare-fun e!11831 () Bool)

(assert (=> b!18458 (= res!12826 e!11831)))

(declare-fun res!12824 () Bool)

(assert (=> b!18458 (=> res!12824 e!11831)))

(declare-fun e!11833 () Bool)

(assert (=> b!18458 (= res!12824 (not e!11833))))

(declare-fun res!12831 () Bool)

(assert (=> b!18458 (=> (not res!12831) (not e!11833))))

(assert (=> b!18458 (= res!12831 (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun b!18459 () Bool)

(declare-fun lt!4927 () Unit!359)

(assert (=> b!18459 (= e!11838 lt!4927)))

(declare-fun lt!4929 () ListLongMap!533)

(declare-fun getCurrentListMapNoExtraKeys!12 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 32) Int) ListLongMap!533)

(assert (=> b!18459 (= lt!4929 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun lt!4925 () (_ BitVec 64))

(assert (=> b!18459 (= lt!4925 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4921 () (_ BitVec 64))

(assert (=> b!18459 (= lt!4921 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000))))

(declare-fun lt!4919 () Unit!359)

(declare-fun addStillContains!12 (ListLongMap!533 (_ BitVec 64) V!1043 (_ BitVec 64)) Unit!359)

(assert (=> b!18459 (= lt!4919 (addStillContains!12 lt!4929 lt!4925 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4921))))

(assert (=> b!18459 (contains!214 (+!35 lt!4929 (tuple2!795 lt!4925 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))))) lt!4921)))

(declare-fun lt!4911 () Unit!359)

(assert (=> b!18459 (= lt!4911 lt!4919)))

(declare-fun lt!4922 () ListLongMap!533)

(assert (=> b!18459 (= lt!4922 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun lt!4917 () (_ BitVec 64))

(assert (=> b!18459 (= lt!4917 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4915 () (_ BitVec 64))

(assert (=> b!18459 (= lt!4915 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000))))

(declare-fun lt!4909 () Unit!359)

(declare-fun addApplyDifferent!12 (ListLongMap!533 (_ BitVec 64) V!1043 (_ BitVec 64)) Unit!359)

(assert (=> b!18459 (= lt!4909 (addApplyDifferent!12 lt!4922 lt!4917 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4915))))

(assert (=> b!18459 (= (apply!27 (+!35 lt!4922 (tuple2!795 lt!4917 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))))) lt!4915) (apply!27 lt!4922 lt!4915))))

(declare-fun lt!4924 () Unit!359)

(assert (=> b!18459 (= lt!4924 lt!4909)))

(declare-fun lt!4928 () ListLongMap!533)

(assert (=> b!18459 (= lt!4928 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun lt!4923 () (_ BitVec 64))

(assert (=> b!18459 (= lt!4923 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4912 () (_ BitVec 64))

(assert (=> b!18459 (= lt!4912 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000))))

(declare-fun lt!4914 () Unit!359)

(assert (=> b!18459 (= lt!4914 (addApplyDifferent!12 lt!4928 lt!4923 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4912))))

(assert (=> b!18459 (= (apply!27 (+!35 lt!4928 (tuple2!795 lt!4923 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))))) lt!4912) (apply!27 lt!4928 lt!4912))))

(declare-fun lt!4913 () Unit!359)

(assert (=> b!18459 (= lt!4913 lt!4914)))

(declare-fun lt!4910 () ListLongMap!533)

(assert (=> b!18459 (= lt!4910 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun lt!4926 () (_ BitVec 64))

(assert (=> b!18459 (= lt!4926 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4916 () (_ BitVec 64))

(assert (=> b!18459 (= lt!4916 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000))))

(assert (=> b!18459 (= lt!4927 (addApplyDifferent!12 lt!4910 lt!4926 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4916))))

(assert (=> b!18459 (= (apply!27 (+!35 lt!4910 (tuple2!795 lt!4926 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))))) lt!4916) (apply!27 lt!4910 lt!4916))))

(declare-fun b!18460 () Bool)

(assert (=> b!18460 (= e!11834 (not call!732))))

(declare-fun b!18461 () Bool)

(declare-fun call!735 () ListLongMap!533)

(assert (=> b!18461 (= e!11836 call!735)))

(declare-fun b!18462 () Bool)

(declare-fun res!12829 () Bool)

(assert (=> b!18462 (=> (not res!12829) (not e!11835))))

(assert (=> b!18462 (= res!12829 e!11827)))

(declare-fun c!1897 () Bool)

(assert (=> b!18462 (= c!1897 (not (= (bvand (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!18463 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!18463 (= e!11833 (validKeyInArray!0 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000)))))

(declare-fun bm!729 () Bool)

(declare-fun call!736 () ListLongMap!533)

(assert (=> bm!729 (= call!735 call!736)))

(declare-fun bm!730 () Bool)

(assert (=> bm!730 (= call!732 (contains!214 lt!4918 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!731 () Bool)

(declare-fun call!731 () ListLongMap!533)

(assert (=> bm!731 (= call!731 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun b!18464 () Bool)

(declare-fun e!11832 () Bool)

(assert (=> b!18464 (= e!11831 e!11832)))

(declare-fun res!12828 () Bool)

(assert (=> b!18464 (=> (not res!12828) (not e!11832))))

(assert (=> b!18464 (= res!12828 (contains!214 lt!4918 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000)))))

(assert (=> b!18464 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun b!18465 () Bool)

(assert (=> b!18465 (= e!11829 (= (apply!27 lt!4918 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun bm!732 () Bool)

(assert (=> bm!732 (= call!737 call!733)))

(declare-fun d!3413 () Bool)

(assert (=> d!3413 e!11835))

(declare-fun res!12825 () Bool)

(assert (=> d!3413 (=> (not res!12825) (not e!11835))))

(assert (=> d!3413 (= res!12825 (or (bvsge #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))))

(declare-fun lt!4920 () ListLongMap!533)

(assert (=> d!3413 (= lt!4918 lt!4920)))

(declare-fun lt!4930 () Unit!359)

(assert (=> d!3413 (= lt!4930 e!11838)))

(declare-fun c!1901 () Bool)

(declare-fun e!11837 () Bool)

(assert (=> d!3413 (= c!1901 e!11837)))

(declare-fun res!12832 () Bool)

(assert (=> d!3413 (=> (not res!12832) (not e!11837))))

(assert (=> d!3413 (= res!12832 (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(assert (=> d!3413 (= lt!4920 e!11828)))

(declare-fun c!1899 () Bool)

(assert (=> d!3413 (= c!1899 (and (not (= (bvand (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3413 (validMask!0 (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))))))

(assert (=> d!3413 (= (getCurrentListMap!119 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))) lt!4918)))

(declare-fun b!18466 () Bool)

(declare-fun get!348 (ValueCell!257 V!1043) V!1043)

(declare-fun dynLambda!132 (Int (_ BitVec 64)) V!1043)

(assert (=> b!18466 (= e!11832 (= (apply!27 lt!4918 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000)) (get!348 (select (arr!488 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000) (dynLambda!132 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!18466 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!578 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(assert (=> b!18466 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun b!18467 () Bool)

(declare-fun c!1898 () Bool)

(assert (=> b!18467 (= c!1898 (and (not (= (bvand (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!18467 (= e!11839 e!11836)))

(declare-fun b!18468 () Bool)

(assert (=> b!18468 (= e!11828 e!11839)))

(declare-fun c!1900 () Bool)

(assert (=> b!18468 (= c!1900 (and (not (= (bvand (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!733 () Bool)

(assert (=> bm!733 (= call!736 call!731)))

(declare-fun bm!734 () Bool)

(assert (=> bm!734 (= call!733 (+!35 (ite c!1899 call!731 (ite c!1900 call!736 call!735)) (ite (or c!1899 c!1900) (tuple2!795 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))) (tuple2!795 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))))))))

(declare-fun b!18469 () Bool)

(assert (=> b!18469 (= e!11837 (validKeyInArray!0 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000)))))

(assert (= (and d!3413 c!1899) b!18449))

(assert (= (and d!3413 (not c!1899)) b!18468))

(assert (= (and b!18468 c!1900) b!18454))

(assert (= (and b!18468 (not c!1900)) b!18467))

(assert (= (and b!18467 c!1898) b!18456))

(assert (= (and b!18467 (not c!1898)) b!18461))

(assert (= (or b!18456 b!18461) bm!729))

(assert (= (or b!18454 bm!729) bm!733))

(assert (= (or b!18454 b!18456) bm!732))

(assert (= (or b!18449 bm!733) bm!731))

(assert (= (or b!18449 bm!732) bm!734))

(assert (= (and d!3413 res!12832) b!18469))

(assert (= (and d!3413 c!1901) b!18459))

(assert (= (and d!3413 (not c!1901)) b!18457))

(assert (= (and d!3413 res!12825) b!18458))

(assert (= (and b!18458 res!12831) b!18463))

(assert (= (and b!18458 (not res!12824)) b!18464))

(assert (= (and b!18464 res!12828) b!18466))

(assert (= (and b!18458 res!12826) b!18462))

(assert (= (and b!18462 c!1897) b!18450))

(assert (= (and b!18462 (not c!1897)) b!18455))

(assert (= (and b!18450 res!12830) b!18452))

(assert (= (or b!18450 b!18455) bm!728))

(assert (= (and b!18462 res!12829) b!18451))

(assert (= (and b!18451 c!1896) b!18453))

(assert (= (and b!18451 (not c!1896)) b!18460))

(assert (= (and b!18453 res!12827) b!18465))

(assert (= (or b!18453 b!18460) bm!730))

(declare-fun b_lambda!1435 () Bool)

(assert (=> (not b_lambda!1435) (not b!18466)))

(declare-fun tb!621 () Bool)

(declare-fun t!3171 () Bool)

(assert (=> (and b!18125 (= (defaultEntry!1661 (v!1470 (underlying!61 thiss!848))) (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))) t!3171) tb!621))

(declare-fun result!1005 () Bool)

(assert (=> tb!621 (= result!1005 tp_is_empty!913)))

(assert (=> b!18466 t!3171))

(declare-fun b_and!1297 () Bool)

(assert (= b_and!1291 (and (=> t!3171 result!1005) b_and!1297)))

(declare-fun m!12789 () Bool)

(assert (=> b!18459 m!12789))

(declare-fun m!12791 () Bool)

(assert (=> b!18459 m!12791))

(declare-fun m!12793 () Bool)

(assert (=> b!18459 m!12793))

(declare-fun m!12795 () Bool)

(assert (=> b!18459 m!12795))

(declare-fun m!12797 () Bool)

(assert (=> b!18459 m!12797))

(declare-fun m!12799 () Bool)

(assert (=> b!18459 m!12799))

(declare-fun m!12801 () Bool)

(assert (=> b!18459 m!12801))

(declare-fun m!12803 () Bool)

(assert (=> b!18459 m!12803))

(declare-fun m!12805 () Bool)

(assert (=> b!18459 m!12805))

(declare-fun m!12807 () Bool)

(assert (=> b!18459 m!12807))

(declare-fun m!12809 () Bool)

(assert (=> b!18459 m!12809))

(assert (=> b!18459 m!12801))

(declare-fun m!12811 () Bool)

(assert (=> b!18459 m!12811))

(declare-fun m!12813 () Bool)

(assert (=> b!18459 m!12813))

(assert (=> b!18459 m!12807))

(declare-fun m!12815 () Bool)

(assert (=> b!18459 m!12815))

(declare-fun m!12817 () Bool)

(assert (=> b!18459 m!12817))

(assert (=> b!18459 m!12795))

(declare-fun m!12819 () Bool)

(assert (=> b!18459 m!12819))

(assert (=> b!18459 m!12803))

(declare-fun m!12821 () Bool)

(assert (=> b!18459 m!12821))

(declare-fun m!12823 () Bool)

(assert (=> bm!734 m!12823))

(declare-fun m!12825 () Bool)

(assert (=> b!18465 m!12825))

(assert (=> b!18463 m!12797))

(assert (=> b!18463 m!12797))

(declare-fun m!12827 () Bool)

(assert (=> b!18463 m!12827))

(assert (=> b!18469 m!12797))

(assert (=> b!18469 m!12797))

(assert (=> b!18469 m!12827))

(declare-fun m!12829 () Bool)

(assert (=> b!18452 m!12829))

(declare-fun m!12831 () Bool)

(assert (=> b!18466 m!12831))

(assert (=> b!18466 m!12797))

(declare-fun m!12833 () Bool)

(assert (=> b!18466 m!12833))

(assert (=> b!18466 m!12797))

(declare-fun m!12835 () Bool)

(assert (=> b!18466 m!12835))

(assert (=> b!18466 m!12831))

(assert (=> b!18466 m!12833))

(declare-fun m!12837 () Bool)

(assert (=> b!18466 m!12837))

(declare-fun m!12839 () Bool)

(assert (=> bm!730 m!12839))

(assert (=> b!18464 m!12797))

(assert (=> b!18464 m!12797))

(declare-fun m!12841 () Bool)

(assert (=> b!18464 m!12841))

(assert (=> d!3413 m!12777))

(declare-fun m!12843 () Bool)

(assert (=> b!18449 m!12843))

(declare-fun m!12845 () Bool)

(assert (=> bm!728 m!12845))

(assert (=> bm!731 m!12817))

(assert (=> bm!691 d!3413))

(declare-fun d!3415 () Bool)

(assert (=> d!3415 (= (map!357 (v!1470 (underlying!61 thiss!848))) (getCurrentListMap!119 (_keys!3086 (v!1470 (underlying!61 thiss!848))) (_values!1658 (v!1470 (underlying!61 thiss!848))) (mask!4594 (v!1470 (underlying!61 thiss!848))) (extraKeys!1574 (v!1470 (underlying!61 thiss!848))) (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 (v!1470 (underlying!61 thiss!848))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 thiss!848)))))))

(declare-fun bs!843 () Bool)

(assert (= bs!843 d!3415))

(declare-fun m!12847 () Bool)

(assert (=> bs!843 m!12847))

(assert (=> d!3393 d!3415))

(declare-fun b!18472 () Bool)

(declare-fun e!11843 () tuple2!790)

(declare-fun e!11851 () tuple2!790)

(assert (=> b!18472 (= e!11843 e!11851)))

(declare-fun c!1906 () Bool)

(assert (=> b!18472 (= c!1906 (= #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18473 () Bool)

(declare-fun c!1904 () Bool)

(declare-fun lt!4942 () SeekEntryResult!44)

(assert (=> b!18473 (= c!1904 ((_ is MissingVacant!44) lt!4942))))

(declare-fun e!11842 () Bool)

(declare-fun e!11846 () Bool)

(assert (=> b!18473 (= e!11842 e!11846)))

(declare-fun b!18474 () Bool)

(declare-fun lt!4956 () Unit!359)

(declare-fun lt!4954 () Unit!359)

(assert (=> b!18474 (= lt!4956 lt!4954)))

(declare-fun call!759 () ListLongMap!533)

(declare-fun call!746 () ListLongMap!533)

(assert (=> b!18474 (= call!759 call!746)))

(declare-fun lt!4932 () (_ BitVec 32))

(assert (=> b!18474 (= lt!4954 (lemmaChangeZeroKeyThenAddPairToListMap!2 (_keys!3086 call!642) (_values!1658 call!642) (mask!4594 call!642) (extraKeys!1574 call!642) lt!4932 (zeroValue!1597 call!642) (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 call!642) (defaultEntry!1661 call!642)))))

(assert (=> b!18474 (= lt!4932 (bvor (extraKeys!1574 call!642) #b00000000000000000000000000000001))))

(assert (=> b!18474 (= e!11851 (tuple2!791 true (LongMapFixedSize!101 (defaultEntry!1661 call!642) (mask!4594 call!642) (bvor (extraKeys!1574 call!642) #b00000000000000000000000000000001) (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 call!642) (_size!82 call!642) (_keys!3086 call!642) (_values!1658 call!642) (_vacant!82 call!642))))))

(declare-fun b!18475 () Bool)

(declare-fun e!11840 () Unit!359)

(declare-fun Unit!365 () Unit!359)

(assert (=> b!18475 (= e!11840 Unit!365)))

(declare-fun lt!4945 () Unit!359)

(declare-fun call!751 () Unit!359)

(assert (=> b!18475 (= lt!4945 call!751)))

(declare-fun call!760 () SeekEntryResult!44)

(assert (=> b!18475 (= lt!4942 call!760)))

(declare-fun c!1913 () Bool)

(assert (=> b!18475 (= c!1913 ((_ is MissingZero!44) lt!4942))))

(assert (=> b!18475 e!11842))

(declare-fun lt!4936 () Unit!359)

(assert (=> b!18475 (= lt!4936 lt!4945)))

(assert (=> b!18475 false))

(declare-fun b!18476 () Bool)

(declare-fun e!11848 () Unit!359)

(declare-fun Unit!366 () Unit!359)

(assert (=> b!18476 (= e!11848 Unit!366)))

(declare-fun lt!4937 () Unit!359)

(declare-fun call!739 () Unit!359)

(assert (=> b!18476 (= lt!4937 call!739)))

(declare-fun lt!4953 () SeekEntryResult!44)

(declare-fun call!738 () SeekEntryResult!44)

(assert (=> b!18476 (= lt!4953 call!738)))

(declare-fun res!12845 () Bool)

(assert (=> b!18476 (= res!12845 ((_ is Found!44) lt!4953))))

(declare-fun e!11844 () Bool)

(assert (=> b!18476 (=> (not res!12845) (not e!11844))))

(assert (=> b!18476 e!11844))

(declare-fun lt!4949 () Unit!359)

(assert (=> b!18476 (= lt!4949 lt!4937)))

(assert (=> b!18476 false))

(declare-fun b!18477 () Bool)

(declare-fun res!12837 () Bool)

(declare-fun lt!4941 () SeekEntryResult!44)

(assert (=> b!18477 (= res!12837 (= (select (arr!489 (_keys!3086 call!642)) (index!2298 lt!4941)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!11853 () Bool)

(assert (=> b!18477 (=> (not res!12837) (not e!11853))))

(declare-fun b!18478 () Bool)

(declare-fun res!12835 () Bool)

(declare-fun e!11852 () Bool)

(assert (=> b!18478 (=> (not res!12835) (not e!11852))))

(declare-fun call!742 () Bool)

(assert (=> b!18478 (= res!12835 call!742)))

(assert (=> b!18478 (= e!11842 e!11852)))

(declare-fun b!18479 () Bool)

(declare-fun res!12833 () Bool)

(assert (=> b!18479 (=> (not res!12833) (not e!11852))))

(assert (=> b!18479 (= res!12833 (= (select (arr!489 (_keys!3086 call!642)) (index!2295 lt!4942)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!745 () ListLongMap!533)

(declare-fun call!744 () ListLongMap!533)

(declare-fun b!18480 () Bool)

(declare-fun e!11855 () Bool)

(assert (=> b!18480 (= e!11855 (= call!745 (+!35 call!744 (tuple2!795 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1470 (underlying!61 thiss!848)))))))))

(declare-fun b!18481 () Bool)

(declare-fun lt!4950 () Unit!359)

(declare-fun lt!4935 () Unit!359)

(assert (=> b!18481 (= lt!4950 lt!4935)))

(declare-fun call!756 () ListLongMap!533)

(assert (=> b!18481 (= call!759 call!756)))

(declare-fun lt!4952 () (_ BitVec 32))

(assert (=> b!18481 (= lt!4935 (lemmaChangeLongMinValueKeyThenAddPairToListMap!2 (_keys!3086 call!642) (_values!1658 call!642) (mask!4594 call!642) (extraKeys!1574 call!642) lt!4952 (zeroValue!1597 call!642) (minValue!1597 call!642) (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (defaultEntry!1661 call!642)))))

(assert (=> b!18481 (= lt!4952 (bvor (extraKeys!1574 call!642) #b00000000000000000000000000000010))))

(assert (=> b!18481 (= e!11851 (tuple2!791 true (LongMapFixedSize!101 (defaultEntry!1661 call!642) (mask!4594 call!642) (bvor (extraKeys!1574 call!642) #b00000000000000000000000000000010) (zeroValue!1597 call!642) (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (_size!82 call!642) (_keys!3086 call!642) (_values!1658 call!642) (_vacant!82 call!642))))))

(declare-fun b!18482 () Bool)

(declare-fun call!743 () Bool)

(assert (=> b!18482 (= e!11853 (not call!743))))

(declare-fun bm!735 () Bool)

(declare-fun call!754 () Bool)

(declare-fun call!757 () ListLongMap!533)

(assert (=> bm!735 (= call!754 (contains!214 call!757 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18483 () Bool)

(declare-fun res!12846 () Bool)

(declare-fun call!749 () Bool)

(assert (=> b!18483 (= res!12846 call!749)))

(declare-fun e!11859 () Bool)

(assert (=> b!18483 (=> (not res!12846) (not e!11859))))

(declare-fun b!18484 () Bool)

(declare-fun lt!4938 () Unit!359)

(declare-fun lt!4931 () Unit!359)

(assert (=> b!18484 (= lt!4938 lt!4931)))

(declare-fun call!740 () ListLongMap!533)

(declare-fun lt!4944 () SeekEntryResult!44)

(assert (=> b!18484 (contains!214 call!740 (select (arr!489 (_keys!3086 call!642)) (index!2296 lt!4944)))))

(declare-fun lt!4951 () array!1013)

(assert (=> b!18484 (= lt!4931 (lemmaValidKeyInArrayIsInListMap!2 (_keys!3086 call!642) lt!4951 (mask!4594 call!642) (extraKeys!1574 call!642) (zeroValue!1597 call!642) (minValue!1597 call!642) (index!2296 lt!4944) (defaultEntry!1661 call!642)))))

(assert (=> b!18484 (= lt!4951 (array!1014 (store (arr!488 (_values!1658 call!642)) (index!2296 lt!4944) (ValueCellFull!257 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))))) (size!578 (_values!1658 call!642))))))

(declare-fun lt!4940 () Unit!359)

(declare-fun lt!4957 () Unit!359)

(assert (=> b!18484 (= lt!4940 lt!4957)))

(declare-fun call!753 () ListLongMap!533)

(declare-fun call!741 () ListLongMap!533)

(assert (=> b!18484 (= call!753 call!741)))

(assert (=> b!18484 (= lt!4957 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!2 (_keys!3086 call!642) (_values!1658 call!642) (mask!4594 call!642) (extraKeys!1574 call!642) (zeroValue!1597 call!642) (minValue!1597 call!642) (index!2296 lt!4944) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (defaultEntry!1661 call!642)))))

(declare-fun lt!4955 () Unit!359)

(assert (=> b!18484 (= lt!4955 e!11840)))

(declare-fun c!1910 () Bool)

(assert (=> b!18484 (= c!1910 call!754)))

(declare-fun e!11847 () tuple2!790)

(assert (=> b!18484 (= e!11847 (tuple2!791 true (LongMapFixedSize!101 (defaultEntry!1661 call!642) (mask!4594 call!642) (extraKeys!1574 call!642) (zeroValue!1597 call!642) (minValue!1597 call!642) (_size!82 call!642) (_keys!3086 call!642) (array!1014 (store (arr!488 (_values!1658 call!642)) (index!2296 lt!4944) (ValueCellFull!257 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))))) (size!578 (_values!1658 call!642))) (_vacant!82 call!642))))))

(declare-fun bm!736 () Bool)

(assert (=> bm!736 (= call!757 (getCurrentListMap!119 (_keys!3086 call!642) (_values!1658 call!642) (mask!4594 call!642) (extraKeys!1574 call!642) (zeroValue!1597 call!642) (minValue!1597 call!642) #b00000000000000000000000000000000 (defaultEntry!1661 call!642)))))

(declare-fun b!18485 () Bool)

(declare-fun res!12840 () Bool)

(assert (=> b!18485 (= res!12840 (= (select (arr!489 (_keys!3086 call!642)) (index!2298 lt!4942)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!11856 () Bool)

(assert (=> b!18485 (=> (not res!12840) (not e!11856))))

(declare-fun b!18486 () Bool)

(declare-fun e!11850 () Bool)

(assert (=> b!18486 (= e!11850 ((_ is Undefined!44) lt!4941))))

(declare-fun bm!737 () Bool)

(declare-fun call!755 () SeekEntryResult!44)

(assert (=> bm!737 (= call!755 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3086 call!642) (mask!4594 call!642)))))

(declare-fun b!18487 () Bool)

(assert (=> b!18487 (= e!11850 e!11853)))

(declare-fun res!12841 () Bool)

(declare-fun call!761 () Bool)

(assert (=> b!18487 (= res!12841 call!761)))

(assert (=> b!18487 (=> (not res!12841) (not e!11853))))

(declare-fun b!18488 () Bool)

(declare-fun lt!4943 () Unit!359)

(assert (=> b!18488 (= e!11848 lt!4943)))

(assert (=> b!18488 (= lt!4943 call!751)))

(assert (=> b!18488 (= lt!4941 call!738)))

(declare-fun c!1912 () Bool)

(assert (=> b!18488 (= c!1912 ((_ is MissingZero!44) lt!4941))))

(declare-fun e!11849 () Bool)

(assert (=> b!18488 e!11849))

(declare-fun b!18489 () Bool)

(declare-fun e!11845 () tuple2!790)

(declare-fun lt!4946 () tuple2!790)

(assert (=> b!18489 (= e!11845 (tuple2!791 (_1!396 lt!4946) (_2!396 lt!4946)))))

(declare-fun call!750 () tuple2!790)

(assert (=> b!18489 (= lt!4946 call!750)))

(declare-fun bm!738 () Bool)

(declare-fun call!748 () Bool)

(declare-fun call!758 () Bool)

(assert (=> bm!738 (= call!748 call!758)))

(declare-fun b!18490 () Bool)

(assert (=> b!18490 (= e!11846 ((_ is Undefined!44) lt!4942))))

(declare-fun b!18491 () Bool)

(declare-fun c!1903 () Bool)

(assert (=> b!18491 (= c!1903 ((_ is MissingVacant!44) lt!4944))))

(declare-fun e!11854 () tuple2!790)

(assert (=> b!18491 (= e!11854 e!11845)))

(declare-fun bm!739 () Bool)

(declare-fun call!752 () Bool)

(assert (=> bm!739 (= call!752 (arrayContainsKey!0 (_keys!3086 call!642) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun c!1909 () Bool)

(declare-fun c!1908 () Bool)

(declare-fun lt!4934 () SeekEntryResult!44)

(declare-fun bm!740 () Bool)

(assert (=> bm!740 (= call!758 (inRange!0 (ite c!1909 (ite c!1908 (index!2296 lt!4953) (ite c!1912 (index!2295 lt!4941) (index!2298 lt!4941))) (ite c!1910 (index!2296 lt!4934) (ite c!1913 (index!2295 lt!4942) (index!2298 lt!4942)))) (mask!4594 call!642)))))

(declare-fun bm!741 () Bool)

(assert (=> bm!741 (= call!750 (updateHelperNewKey!2 call!642 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (ite c!1903 (index!2298 lt!4944) (index!2295 lt!4944))))))

(declare-fun b!18492 () Bool)

(declare-fun res!12844 () Bool)

(declare-fun e!11858 () Bool)

(assert (=> b!18492 (=> (not res!12844) (not e!11858))))

(assert (=> b!18492 (= res!12844 call!761)))

(assert (=> b!18492 (= e!11849 e!11858)))

(declare-fun bm!742 () Bool)

(assert (=> bm!742 (= call!739 (lemmaInListMapThenSeekEntryOrOpenFindsIt!2 (_keys!3086 call!642) (_values!1658 call!642) (mask!4594 call!642) (extraKeys!1574 call!642) (zeroValue!1597 call!642) (minValue!1597 call!642) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1661 call!642)))))

(declare-fun bm!743 () Bool)

(assert (=> bm!743 (= call!760 call!755)))

(declare-fun b!18493 () Bool)

(declare-fun lt!4939 () tuple2!790)

(assert (=> b!18493 (= lt!4939 call!750)))

(assert (=> b!18493 (= e!11847 (tuple2!791 (_1!396 lt!4939) (_2!396 lt!4939)))))

(declare-fun b!18494 () Bool)

(declare-fun c!1911 () Bool)

(assert (=> b!18494 (= c!1911 ((_ is MissingVacant!44) lt!4941))))

(assert (=> b!18494 (= e!11849 e!11850)))

(declare-fun bm!744 () Bool)

(assert (=> bm!744 (= call!746 call!740)))

(declare-fun bm!745 () Bool)

(assert (=> bm!745 (= call!744 (map!357 call!642))))

(declare-fun bm!746 () Bool)

(assert (=> bm!746 (= call!749 call!758)))

(declare-fun b!18495 () Bool)

(assert (=> b!18495 (= e!11845 e!11847)))

(declare-fun c!1902 () Bool)

(assert (=> b!18495 (= c!1902 ((_ is MissingZero!44) lt!4944))))

(declare-fun bm!747 () Bool)

(declare-fun c!1907 () Bool)

(assert (=> bm!747 (= call!740 (getCurrentListMap!119 (_keys!3086 call!642) (ite c!1907 (_values!1658 call!642) lt!4951) (mask!4594 call!642) (ite (and c!1907 c!1906) lt!4932 (extraKeys!1574 call!642)) (ite (and c!1907 c!1906) (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (zeroValue!1597 call!642)) (minValue!1597 call!642) #b00000000000000000000000000000000 (defaultEntry!1661 call!642)))))

(declare-fun b!18496 () Bool)

(declare-fun e!11841 () Bool)

(declare-fun e!11857 () Bool)

(assert (=> b!18496 (= e!11841 e!11857)))

(declare-fun c!1905 () Bool)

(declare-fun lt!4933 () tuple2!790)

(assert (=> b!18496 (= c!1905 (_1!396 lt!4933))))

(declare-fun bm!748 () Bool)

(assert (=> bm!748 (= call!761 call!748)))

(declare-fun b!18497 () Bool)

(assert (=> b!18497 (= e!11858 (not call!743))))

(declare-fun b!18498 () Bool)

(assert (=> b!18498 (= e!11859 (= (select (arr!489 (_keys!3086 call!642)) (index!2296 lt!4934)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18499 () Bool)

(declare-fun call!747 () Bool)

(assert (=> b!18499 (= e!11852 (not call!747))))

(declare-fun b!18500 () Bool)

(declare-fun res!12836 () Bool)

(assert (=> b!18500 (= res!12836 call!748)))

(assert (=> b!18500 (=> (not res!12836) (not e!11844))))

(declare-fun b!18501 () Bool)

(declare-fun res!12843 () Bool)

(assert (=> b!18501 (=> (not res!12843) (not e!11858))))

(assert (=> b!18501 (= res!12843 (= (select (arr!489 (_keys!3086 call!642)) (index!2295 lt!4941)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!749 () Bool)

(assert (=> bm!749 (= call!759 call!753)))

(declare-fun b!18502 () Bool)

(assert (=> b!18502 (= e!11857 e!11855)))

(declare-fun res!12842 () Bool)

(assert (=> b!18502 (= res!12842 (contains!214 call!745 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!18502 (=> (not res!12842) (not e!11855))))

(declare-fun bm!750 () Bool)

(assert (=> bm!750 (= call!738 call!755)))

(declare-fun b!18503 () Bool)

(declare-fun lt!4947 () Unit!359)

(assert (=> b!18503 (= e!11840 lt!4947)))

(assert (=> b!18503 (= lt!4947 call!739)))

(assert (=> b!18503 (= lt!4934 call!760)))

(declare-fun res!12839 () Bool)

(assert (=> b!18503 (= res!12839 ((_ is Found!44) lt!4934))))

(assert (=> b!18503 (=> (not res!12839) (not e!11859))))

(assert (=> b!18503 e!11859))

(declare-fun bm!751 () Bool)

(assert (=> bm!751 (= call!756 call!741)))

(declare-fun bm!752 () Bool)

(assert (=> bm!752 (= call!751 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!2 (_keys!3086 call!642) (_values!1658 call!642) (mask!4594 call!642) (extraKeys!1574 call!642) (zeroValue!1597 call!642) (minValue!1597 call!642) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1661 call!642)))))

(declare-fun bm!753 () Bool)

(assert (=> bm!753 (= call!747 call!752)))

(declare-fun d!3417 () Bool)

(assert (=> d!3417 e!11841))

(declare-fun res!12834 () Bool)

(assert (=> d!3417 (=> (not res!12834) (not e!11841))))

(assert (=> d!3417 (= res!12834 (valid!59 (_2!396 lt!4933)))))

(assert (=> d!3417 (= lt!4933 e!11843)))

(assert (=> d!3417 (= c!1907 (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvneg #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3417 (valid!59 call!642)))

(assert (=> d!3417 (= (update!13 call!642 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1470 (underlying!61 thiss!848)))) lt!4933)))

(declare-fun b!18504 () Bool)

(assert (=> b!18504 (= e!11857 (= call!745 call!744))))

(declare-fun b!18505 () Bool)

(assert (=> b!18505 (= e!11844 (= (select (arr!489 (_keys!3086 call!642)) (index!2296 lt!4953)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!754 () Bool)

(assert (=> bm!754 (= call!742 call!749)))

(declare-fun bm!755 () Bool)

(assert (=> bm!755 (= call!741 (getCurrentListMap!119 (_keys!3086 call!642) (ite c!1907 (_values!1658 call!642) (array!1014 (store (arr!488 (_values!1658 call!642)) (index!2296 lt!4944) (ValueCellFull!257 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))))) (size!578 (_values!1658 call!642)))) (mask!4594 call!642) (ite c!1907 (ite c!1906 (extraKeys!1574 call!642) lt!4952) (extraKeys!1574 call!642)) (zeroValue!1597 call!642) (ite c!1907 (ite c!1906 (minValue!1597 call!642) (zeroValue!1597 (v!1470 (underlying!61 thiss!848)))) (minValue!1597 call!642)) #b00000000000000000000000000000000 (defaultEntry!1661 call!642)))))

(declare-fun b!18506 () Bool)

(assert (=> b!18506 (= e!11856 (not call!747))))

(declare-fun b!18507 () Bool)

(assert (=> b!18507 (= e!11846 e!11856)))

(declare-fun res!12838 () Bool)

(assert (=> b!18507 (= res!12838 call!742)))

(assert (=> b!18507 (=> (not res!12838) (not e!11856))))

(declare-fun b!18508 () Bool)

(declare-fun lt!4948 () Unit!359)

(assert (=> b!18508 (= lt!4948 e!11848)))

(assert (=> b!18508 (= c!1908 call!754)))

(assert (=> b!18508 (= e!11854 (tuple2!791 false call!642))))

(declare-fun bm!756 () Bool)

(assert (=> bm!756 (= call!743 call!752)))

(declare-fun bm!757 () Bool)

(assert (=> bm!757 (= call!753 (+!35 (ite c!1907 (ite c!1906 call!756 call!746) call!757) (ite c!1907 (ite c!1906 (tuple2!795 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1470 (underlying!61 thiss!848)))) (tuple2!795 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))))) (tuple2!795 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1470 (underlying!61 thiss!848)))))))))

(declare-fun bm!758 () Bool)

(assert (=> bm!758 (= call!745 (map!357 (_2!396 lt!4933)))))

(declare-fun b!18509 () Bool)

(assert (=> b!18509 (= e!11843 e!11854)))

(assert (=> b!18509 (= lt!4944 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3086 call!642) (mask!4594 call!642)))))

(assert (=> b!18509 (= c!1909 ((_ is Undefined!44) lt!4944))))

(assert (= (and d!3417 c!1907) b!18472))

(assert (= (and d!3417 (not c!1907)) b!18509))

(assert (= (and b!18472 c!1906) b!18474))

(assert (= (and b!18472 (not c!1906)) b!18481))

(assert (= (or b!18474 b!18481) bm!751))

(assert (= (or b!18474 b!18481) bm!744))

(assert (= (or b!18474 b!18481) bm!749))

(assert (= (and b!18509 c!1909) b!18508))

(assert (= (and b!18509 (not c!1909)) b!18491))

(assert (= (and b!18508 c!1908) b!18476))

(assert (= (and b!18508 (not c!1908)) b!18488))

(assert (= (and b!18476 res!12845) b!18500))

(assert (= (and b!18500 res!12836) b!18505))

(assert (= (and b!18488 c!1912) b!18492))

(assert (= (and b!18488 (not c!1912)) b!18494))

(assert (= (and b!18492 res!12844) b!18501))

(assert (= (and b!18501 res!12843) b!18497))

(assert (= (and b!18494 c!1911) b!18487))

(assert (= (and b!18494 (not c!1911)) b!18486))

(assert (= (and b!18487 res!12841) b!18477))

(assert (= (and b!18477 res!12837) b!18482))

(assert (= (or b!18492 b!18487) bm!748))

(assert (= (or b!18497 b!18482) bm!756))

(assert (= (or b!18500 bm!748) bm!738))

(assert (= (or b!18476 b!18488) bm!750))

(assert (= (and b!18491 c!1903) b!18489))

(assert (= (and b!18491 (not c!1903)) b!18495))

(assert (= (and b!18495 c!1902) b!18493))

(assert (= (and b!18495 (not c!1902)) b!18484))

(assert (= (and b!18484 c!1910) b!18503))

(assert (= (and b!18484 (not c!1910)) b!18475))

(assert (= (and b!18503 res!12839) b!18483))

(assert (= (and b!18483 res!12846) b!18498))

(assert (= (and b!18475 c!1913) b!18478))

(assert (= (and b!18475 (not c!1913)) b!18473))

(assert (= (and b!18478 res!12835) b!18479))

(assert (= (and b!18479 res!12833) b!18499))

(assert (= (and b!18473 c!1904) b!18507))

(assert (= (and b!18473 (not c!1904)) b!18490))

(assert (= (and b!18507 res!12838) b!18485))

(assert (= (and b!18485 res!12840) b!18506))

(assert (= (or b!18478 b!18507) bm!754))

(assert (= (or b!18499 b!18506) bm!753))

(assert (= (or b!18483 bm!754) bm!746))

(assert (= (or b!18503 b!18475) bm!743))

(assert (= (or b!18489 b!18493) bm!741))

(assert (= (or b!18476 b!18503) bm!742))

(assert (= (or b!18508 b!18484) bm!736))

(assert (= (or bm!756 bm!753) bm!739))

(assert (= (or bm!750 bm!743) bm!737))

(assert (= (or bm!738 bm!746) bm!740))

(assert (= (or b!18488 b!18475) bm!752))

(assert (= (or b!18508 b!18484) bm!735))

(assert (= (or bm!749 b!18484) bm!757))

(assert (= (or bm!751 b!18484) bm!755))

(assert (= (or bm!744 b!18484) bm!747))

(assert (= (and d!3417 res!12834) b!18496))

(assert (= (and b!18496 c!1905) b!18502))

(assert (= (and b!18496 (not c!1905)) b!18504))

(assert (= (and b!18502 res!12842) b!18480))

(assert (= (or b!18480 b!18504) bm!745))

(assert (= (or b!18502 b!18480 b!18504) bm!758))

(declare-fun m!12849 () Bool)

(assert (=> b!18474 m!12849))

(declare-fun m!12851 () Bool)

(assert (=> b!18502 m!12851))

(declare-fun m!12853 () Bool)

(assert (=> bm!752 m!12853))

(declare-fun m!12855 () Bool)

(assert (=> b!18477 m!12855))

(declare-fun m!12857 () Bool)

(assert (=> bm!739 m!12857))

(declare-fun m!12859 () Bool)

(assert (=> bm!758 m!12859))

(declare-fun m!12861 () Bool)

(assert (=> bm!741 m!12861))

(declare-fun m!12863 () Bool)

(assert (=> bm!737 m!12863))

(declare-fun m!12865 () Bool)

(assert (=> b!18485 m!12865))

(declare-fun m!12867 () Bool)

(assert (=> b!18481 m!12867))

(declare-fun m!12869 () Bool)

(assert (=> bm!747 m!12869))

(declare-fun m!12871 () Bool)

(assert (=> bm!735 m!12871))

(declare-fun m!12873 () Bool)

(assert (=> bm!757 m!12873))

(declare-fun m!12875 () Bool)

(assert (=> bm!745 m!12875))

(assert (=> b!18509 m!12863))

(declare-fun m!12877 () Bool)

(assert (=> b!18501 m!12877))

(declare-fun m!12879 () Bool)

(assert (=> bm!740 m!12879))

(declare-fun m!12881 () Bool)

(assert (=> b!18505 m!12881))

(declare-fun m!12883 () Bool)

(assert (=> b!18480 m!12883))

(declare-fun m!12885 () Bool)

(assert (=> b!18484 m!12885))

(declare-fun m!12887 () Bool)

(assert (=> b!18484 m!12887))

(assert (=> b!18484 m!12885))

(declare-fun m!12889 () Bool)

(assert (=> b!18484 m!12889))

(declare-fun m!12891 () Bool)

(assert (=> b!18484 m!12891))

(declare-fun m!12893 () Bool)

(assert (=> b!18484 m!12893))

(declare-fun m!12895 () Bool)

(assert (=> b!18498 m!12895))

(declare-fun m!12897 () Bool)

(assert (=> b!18479 m!12897))

(declare-fun m!12899 () Bool)

(assert (=> bm!742 m!12899))

(declare-fun m!12901 () Bool)

(assert (=> d!3417 m!12901))

(declare-fun m!12903 () Bool)

(assert (=> d!3417 m!12903))

(declare-fun m!12905 () Bool)

(assert (=> bm!736 m!12905))

(assert (=> bm!755 m!12891))

(declare-fun m!12907 () Bool)

(assert (=> bm!755 m!12907))

(assert (=> b!18250 d!3417))

(declare-fun b!18510 () Bool)

(declare-fun e!11861 () ListLongMap!533)

(declare-fun call!764 () ListLongMap!533)

(assert (=> b!18510 (= e!11861 (+!35 call!764 (tuple2!795 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun b!18511 () Bool)

(declare-fun e!11860 () Bool)

(declare-fun e!11863 () Bool)

(assert (=> b!18511 (= e!11860 e!11863)))

(declare-fun res!12853 () Bool)

(declare-fun call!765 () Bool)

(assert (=> b!18511 (= res!12853 call!765)))

(assert (=> b!18511 (=> (not res!12853) (not e!11863))))

(declare-fun b!18512 () Bool)

(declare-fun e!11868 () Bool)

(declare-fun e!11867 () Bool)

(assert (=> b!18512 (= e!11868 e!11867)))

(declare-fun c!1914 () Bool)

(assert (=> b!18512 (= c!1914 (not (= (bvand (ite (and c!1868 c!1867) lt!4826 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!18513 () Bool)

(declare-fun lt!4967 () ListLongMap!533)

(assert (=> b!18513 (= e!11863 (= (apply!27 lt!4967 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!1868 c!1867) v!259 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun b!18514 () Bool)

(declare-fun e!11862 () Bool)

(assert (=> b!18514 (= e!11867 e!11862)))

(declare-fun res!12850 () Bool)

(declare-fun call!763 () Bool)

(assert (=> b!18514 (= res!12850 call!763)))

(assert (=> b!18514 (=> (not res!12850) (not e!11862))))

(declare-fun b!18515 () Bool)

(declare-fun e!11872 () ListLongMap!533)

(declare-fun call!768 () ListLongMap!533)

(assert (=> b!18515 (= e!11872 call!768)))

(declare-fun bm!759 () Bool)

(assert (=> bm!759 (= call!765 (contains!214 lt!4967 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18516 () Bool)

(assert (=> b!18516 (= e!11860 (not call!765))))

(declare-fun b!18517 () Bool)

(declare-fun e!11869 () ListLongMap!533)

(assert (=> b!18517 (= e!11869 call!768)))

(declare-fun b!18518 () Bool)

(declare-fun e!11871 () Unit!359)

(declare-fun Unit!367 () Unit!359)

(assert (=> b!18518 (= e!11871 Unit!367)))

(declare-fun b!18519 () Bool)

(declare-fun res!12849 () Bool)

(assert (=> b!18519 (=> (not res!12849) (not e!11868))))

(declare-fun e!11864 () Bool)

(assert (=> b!18519 (= res!12849 e!11864)))

(declare-fun res!12847 () Bool)

(assert (=> b!18519 (=> res!12847 e!11864)))

(declare-fun e!11866 () Bool)

(assert (=> b!18519 (= res!12847 (not e!11866))))

(declare-fun res!12854 () Bool)

(assert (=> b!18519 (=> (not res!12854) (not e!11866))))

(assert (=> b!18519 (= res!12854 (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun b!18520 () Bool)

(declare-fun lt!4976 () Unit!359)

(assert (=> b!18520 (= e!11871 lt!4976)))

(declare-fun lt!4978 () ListLongMap!533)

(assert (=> b!18520 (= lt!4978 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4845) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite (and c!1868 c!1867) lt!4826 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) (ite (and c!1868 c!1867) v!259 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun lt!4974 () (_ BitVec 64))

(assert (=> b!18520 (= lt!4974 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4970 () (_ BitVec 64))

(assert (=> b!18520 (= lt!4970 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000))))

(declare-fun lt!4968 () Unit!359)

(assert (=> b!18520 (= lt!4968 (addStillContains!12 lt!4978 lt!4974 (ite (and c!1868 c!1867) v!259 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))) lt!4970))))

(assert (=> b!18520 (contains!214 (+!35 lt!4978 (tuple2!795 lt!4974 (ite (and c!1868 c!1867) v!259 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))))) lt!4970)))

(declare-fun lt!4960 () Unit!359)

(assert (=> b!18520 (= lt!4960 lt!4968)))

(declare-fun lt!4971 () ListLongMap!533)

(assert (=> b!18520 (= lt!4971 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4845) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite (and c!1868 c!1867) lt!4826 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) (ite (and c!1868 c!1867) v!259 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun lt!4966 () (_ BitVec 64))

(assert (=> b!18520 (= lt!4966 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4964 () (_ BitVec 64))

(assert (=> b!18520 (= lt!4964 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000))))

(declare-fun lt!4958 () Unit!359)

(assert (=> b!18520 (= lt!4958 (addApplyDifferent!12 lt!4971 lt!4966 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4964))))

(assert (=> b!18520 (= (apply!27 (+!35 lt!4971 (tuple2!795 lt!4966 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))))) lt!4964) (apply!27 lt!4971 lt!4964))))

(declare-fun lt!4973 () Unit!359)

(assert (=> b!18520 (= lt!4973 lt!4958)))

(declare-fun lt!4977 () ListLongMap!533)

(assert (=> b!18520 (= lt!4977 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4845) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite (and c!1868 c!1867) lt!4826 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) (ite (and c!1868 c!1867) v!259 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun lt!4972 () (_ BitVec 64))

(assert (=> b!18520 (= lt!4972 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4961 () (_ BitVec 64))

(assert (=> b!18520 (= lt!4961 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000))))

(declare-fun lt!4963 () Unit!359)

(assert (=> b!18520 (= lt!4963 (addApplyDifferent!12 lt!4977 lt!4972 (ite (and c!1868 c!1867) v!259 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))) lt!4961))))

(assert (=> b!18520 (= (apply!27 (+!35 lt!4977 (tuple2!795 lt!4972 (ite (and c!1868 c!1867) v!259 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))))) lt!4961) (apply!27 lt!4977 lt!4961))))

(declare-fun lt!4962 () Unit!359)

(assert (=> b!18520 (= lt!4962 lt!4963)))

(declare-fun lt!4959 () ListLongMap!533)

(assert (=> b!18520 (= lt!4959 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4845) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite (and c!1868 c!1867) lt!4826 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) (ite (and c!1868 c!1867) v!259 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun lt!4975 () (_ BitVec 64))

(assert (=> b!18520 (= lt!4975 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4965 () (_ BitVec 64))

(assert (=> b!18520 (= lt!4965 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000))))

(assert (=> b!18520 (= lt!4976 (addApplyDifferent!12 lt!4959 lt!4975 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4965))))

(assert (=> b!18520 (= (apply!27 (+!35 lt!4959 (tuple2!795 lt!4975 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))))) lt!4965) (apply!27 lt!4959 lt!4965))))

(declare-fun b!18521 () Bool)

(assert (=> b!18521 (= e!11867 (not call!763))))

(declare-fun b!18522 () Bool)

(declare-fun call!766 () ListLongMap!533)

(assert (=> b!18522 (= e!11869 call!766)))

(declare-fun b!18523 () Bool)

(declare-fun res!12852 () Bool)

(assert (=> b!18523 (=> (not res!12852) (not e!11868))))

(assert (=> b!18523 (= res!12852 e!11860)))

(declare-fun c!1915 () Bool)

(assert (=> b!18523 (= c!1915 (not (= (bvand (ite (and c!1868 c!1867) lt!4826 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!18524 () Bool)

(assert (=> b!18524 (= e!11866 (validKeyInArray!0 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000)))))

(declare-fun bm!760 () Bool)

(declare-fun call!767 () ListLongMap!533)

(assert (=> bm!760 (= call!766 call!767)))

(declare-fun bm!761 () Bool)

(assert (=> bm!761 (= call!763 (contains!214 lt!4967 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!762 () ListLongMap!533)

(declare-fun bm!762 () Bool)

(assert (=> bm!762 (= call!762 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4845) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite (and c!1868 c!1867) lt!4826 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) (ite (and c!1868 c!1867) v!259 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun b!18525 () Bool)

(declare-fun e!11865 () Bool)

(assert (=> b!18525 (= e!11864 e!11865)))

(declare-fun res!12851 () Bool)

(assert (=> b!18525 (=> (not res!12851) (not e!11865))))

(assert (=> b!18525 (= res!12851 (contains!214 lt!4967 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000)))))

(assert (=> b!18525 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun b!18526 () Bool)

(assert (=> b!18526 (= e!11862 (= (apply!27 lt!4967 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun bm!763 () Bool)

(assert (=> bm!763 (= call!768 call!764)))

(declare-fun d!3419 () Bool)

(assert (=> d!3419 e!11868))

(declare-fun res!12848 () Bool)

(assert (=> d!3419 (=> (not res!12848) (not e!11868))))

(assert (=> d!3419 (= res!12848 (or (bvsge #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))))

(declare-fun lt!4969 () ListLongMap!533)

(assert (=> d!3419 (= lt!4967 lt!4969)))

(declare-fun lt!4979 () Unit!359)

(assert (=> d!3419 (= lt!4979 e!11871)))

(declare-fun c!1919 () Bool)

(declare-fun e!11870 () Bool)

(assert (=> d!3419 (= c!1919 e!11870)))

(declare-fun res!12855 () Bool)

(assert (=> d!3419 (=> (not res!12855) (not e!11870))))

(assert (=> d!3419 (= res!12855 (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(assert (=> d!3419 (= lt!4969 e!11861)))

(declare-fun c!1917 () Bool)

(assert (=> d!3419 (= c!1917 (and (not (= (bvand (ite (and c!1868 c!1867) lt!4826 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!1868 c!1867) lt!4826 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3419 (validMask!0 (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))))))

(assert (=> d!3419 (= (getCurrentListMap!119 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4845) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite (and c!1868 c!1867) lt!4826 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) (ite (and c!1868 c!1867) v!259 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))) lt!4967)))

(declare-fun b!18527 () Bool)

(assert (=> b!18527 (= e!11865 (= (apply!27 lt!4967 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000)) (get!348 (select (arr!488 (ite c!1868 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4845)) #b00000000000000000000000000000000) (dynLambda!132 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!18527 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!578 (ite c!1868 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4845))))))

(assert (=> b!18527 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun c!1916 () Bool)

(declare-fun b!18528 () Bool)

(assert (=> b!18528 (= c!1916 (and (not (= (bvand (ite (and c!1868 c!1867) lt!4826 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!1868 c!1867) lt!4826 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!18528 (= e!11872 e!11869)))

(declare-fun b!18529 () Bool)

(assert (=> b!18529 (= e!11861 e!11872)))

(declare-fun c!1918 () Bool)

(assert (=> b!18529 (= c!1918 (and (not (= (bvand (ite (and c!1868 c!1867) lt!4826 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!1868 c!1867) lt!4826 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!764 () Bool)

(assert (=> bm!764 (= call!767 call!762)))

(declare-fun bm!765 () Bool)

(assert (=> bm!765 (= call!764 (+!35 (ite c!1917 call!762 (ite c!1918 call!767 call!766)) (ite (or c!1917 c!1918) (tuple2!795 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!1868 c!1867) v!259 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))))) (tuple2!795 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))))))))

(declare-fun b!18530 () Bool)

(assert (=> b!18530 (= e!11870 (validKeyInArray!0 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000)))))

(assert (= (and d!3419 c!1917) b!18510))

(assert (= (and d!3419 (not c!1917)) b!18529))

(assert (= (and b!18529 c!1918) b!18515))

(assert (= (and b!18529 (not c!1918)) b!18528))

(assert (= (and b!18528 c!1916) b!18517))

(assert (= (and b!18528 (not c!1916)) b!18522))

(assert (= (or b!18517 b!18522) bm!760))

(assert (= (or b!18515 bm!760) bm!764))

(assert (= (or b!18515 b!18517) bm!763))

(assert (= (or b!18510 bm!764) bm!762))

(assert (= (or b!18510 bm!763) bm!765))

(assert (= (and d!3419 res!12855) b!18530))

(assert (= (and d!3419 c!1919) b!18520))

(assert (= (and d!3419 (not c!1919)) b!18518))

(assert (= (and d!3419 res!12848) b!18519))

(assert (= (and b!18519 res!12854) b!18524))

(assert (= (and b!18519 (not res!12847)) b!18525))

(assert (= (and b!18525 res!12851) b!18527))

(assert (= (and b!18519 res!12849) b!18523))

(assert (= (and b!18523 c!1915) b!18511))

(assert (= (and b!18523 (not c!1915)) b!18516))

(assert (= (and b!18511 res!12853) b!18513))

(assert (= (or b!18511 b!18516) bm!759))

(assert (= (and b!18523 res!12852) b!18512))

(assert (= (and b!18512 c!1914) b!18514))

(assert (= (and b!18512 (not c!1914)) b!18521))

(assert (= (and b!18514 res!12850) b!18526))

(assert (= (or b!18514 b!18521) bm!761))

(declare-fun b_lambda!1437 () Bool)

(assert (=> (not b_lambda!1437) (not b!18527)))

(assert (=> b!18527 t!3171))

(declare-fun b_and!1299 () Bool)

(assert (= b_and!1297 (and (=> t!3171 result!1005) b_and!1299)))

(declare-fun m!12909 () Bool)

(assert (=> b!18520 m!12909))

(declare-fun m!12911 () Bool)

(assert (=> b!18520 m!12911))

(declare-fun m!12913 () Bool)

(assert (=> b!18520 m!12913))

(declare-fun m!12915 () Bool)

(assert (=> b!18520 m!12915))

(assert (=> b!18520 m!12797))

(declare-fun m!12917 () Bool)

(assert (=> b!18520 m!12917))

(declare-fun m!12919 () Bool)

(assert (=> b!18520 m!12919))

(declare-fun m!12921 () Bool)

(assert (=> b!18520 m!12921))

(declare-fun m!12923 () Bool)

(assert (=> b!18520 m!12923))

(declare-fun m!12925 () Bool)

(assert (=> b!18520 m!12925))

(declare-fun m!12927 () Bool)

(assert (=> b!18520 m!12927))

(assert (=> b!18520 m!12919))

(declare-fun m!12929 () Bool)

(assert (=> b!18520 m!12929))

(declare-fun m!12931 () Bool)

(assert (=> b!18520 m!12931))

(assert (=> b!18520 m!12925))

(declare-fun m!12933 () Bool)

(assert (=> b!18520 m!12933))

(declare-fun m!12935 () Bool)

(assert (=> b!18520 m!12935))

(assert (=> b!18520 m!12915))

(declare-fun m!12937 () Bool)

(assert (=> b!18520 m!12937))

(assert (=> b!18520 m!12921))

(declare-fun m!12939 () Bool)

(assert (=> b!18520 m!12939))

(declare-fun m!12941 () Bool)

(assert (=> bm!765 m!12941))

(declare-fun m!12943 () Bool)

(assert (=> b!18526 m!12943))

(assert (=> b!18524 m!12797))

(assert (=> b!18524 m!12797))

(assert (=> b!18524 m!12827))

(assert (=> b!18530 m!12797))

(assert (=> b!18530 m!12797))

(assert (=> b!18530 m!12827))

(declare-fun m!12945 () Bool)

(assert (=> b!18513 m!12945))

(declare-fun m!12947 () Bool)

(assert (=> b!18527 m!12947))

(assert (=> b!18527 m!12797))

(assert (=> b!18527 m!12833))

(assert (=> b!18527 m!12797))

(declare-fun m!12949 () Bool)

(assert (=> b!18527 m!12949))

(assert (=> b!18527 m!12947))

(assert (=> b!18527 m!12833))

(declare-fun m!12951 () Bool)

(assert (=> b!18527 m!12951))

(declare-fun m!12953 () Bool)

(assert (=> bm!761 m!12953))

(assert (=> b!18525 m!12797))

(assert (=> b!18525 m!12797))

(declare-fun m!12955 () Bool)

(assert (=> b!18525 m!12955))

(assert (=> d!3419 m!12777))

(declare-fun m!12957 () Bool)

(assert (=> b!18510 m!12957))

(declare-fun m!12959 () Bool)

(assert (=> bm!759 m!12959))

(assert (=> bm!762 m!12935))

(assert (=> bm!702 d!3419))

(declare-fun d!3421 () Bool)

(assert (=> d!3421 (= (map!357 (v!1470 (underlying!61 lt!4691))) (getCurrentListMap!119 (_keys!3086 (v!1470 (underlying!61 lt!4691))) (_values!1658 (v!1470 (underlying!61 lt!4691))) (mask!4594 (v!1470 (underlying!61 lt!4691))) (extraKeys!1574 (v!1470 (underlying!61 lt!4691))) (zeroValue!1597 (v!1470 (underlying!61 lt!4691))) (minValue!1597 (v!1470 (underlying!61 lt!4691))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 lt!4691)))))))

(declare-fun bs!844 () Bool)

(assert (= bs!844 d!3421))

(declare-fun m!12961 () Bool)

(assert (=> bs!844 m!12961))

(assert (=> d!3385 d!3421))

(declare-fun d!3423 () Bool)

(declare-fun isEmpty!170 (Option!64) Bool)

(assert (=> d!3423 (= (isDefined!20 (getValueByKey!58 (toList!282 lt!4689) key!682)) (not (isEmpty!170 (getValueByKey!58 (toList!282 lt!4689) key!682))))))

(declare-fun bs!845 () Bool)

(assert (= bs!845 d!3423))

(assert (=> bs!845 m!12667))

(declare-fun m!12963 () Bool)

(assert (=> bs!845 m!12963))

(assert (=> b!18228 d!3423))

(declare-fun b!18542 () Bool)

(declare-fun e!11878 () Option!64)

(assert (=> b!18542 (= e!11878 None!62)))

(declare-fun b!18540 () Bool)

(declare-fun e!11877 () Option!64)

(assert (=> b!18540 (= e!11877 e!11878)))

(declare-fun c!1925 () Bool)

(assert (=> b!18540 (= c!1925 (and ((_ is Cons!531) (toList!282 lt!4689)) (not (= (_1!398 (h!1097 (toList!282 lt!4689))) key!682))))))

(declare-fun b!18539 () Bool)

(assert (=> b!18539 (= e!11877 (Some!63 (_2!398 (h!1097 (toList!282 lt!4689)))))))

(declare-fun d!3425 () Bool)

(declare-fun c!1924 () Bool)

(assert (=> d!3425 (= c!1924 (and ((_ is Cons!531) (toList!282 lt!4689)) (= (_1!398 (h!1097 (toList!282 lt!4689))) key!682)))))

(assert (=> d!3425 (= (getValueByKey!58 (toList!282 lt!4689) key!682) e!11877)))

(declare-fun b!18541 () Bool)

(assert (=> b!18541 (= e!11878 (getValueByKey!58 (t!3167 (toList!282 lt!4689)) key!682))))

(assert (= (and d!3425 c!1924) b!18539))

(assert (= (and d!3425 (not c!1924)) b!18540))

(assert (= (and b!18540 c!1925) b!18541))

(assert (= (and b!18540 (not c!1925)) b!18542))

(declare-fun m!12965 () Bool)

(assert (=> b!18541 m!12965))

(assert (=> b!18228 d!3425))

(declare-fun d!3427 () Bool)

(declare-fun lt!4982 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!14 (List!535) (InoxSet tuple2!794))

(assert (=> d!3427 (= lt!4982 (select (content!14 (toList!282 lt!4725)) (tuple2!795 key!682 v!259)))))

(declare-fun e!11884 () Bool)

(assert (=> d!3427 (= lt!4982 e!11884)))

(declare-fun res!12861 () Bool)

(assert (=> d!3427 (=> (not res!12861) (not e!11884))))

(assert (=> d!3427 (= res!12861 ((_ is Cons!531) (toList!282 lt!4725)))))

(assert (=> d!3427 (= (contains!217 (toList!282 lt!4725) (tuple2!795 key!682 v!259)) lt!4982)))

(declare-fun b!18547 () Bool)

(declare-fun e!11883 () Bool)

(assert (=> b!18547 (= e!11884 e!11883)))

(declare-fun res!12860 () Bool)

(assert (=> b!18547 (=> res!12860 e!11883)))

(assert (=> b!18547 (= res!12860 (= (h!1097 (toList!282 lt!4725)) (tuple2!795 key!682 v!259)))))

(declare-fun b!18548 () Bool)

(assert (=> b!18548 (= e!11883 (contains!217 (t!3167 (toList!282 lt!4725)) (tuple2!795 key!682 v!259)))))

(assert (= (and d!3427 res!12861) b!18547))

(assert (= (and b!18547 (not res!12860)) b!18548))

(declare-fun m!12967 () Bool)

(assert (=> d!3427 m!12967))

(declare-fun m!12969 () Bool)

(assert (=> d!3427 m!12969))

(declare-fun m!12971 () Bool)

(assert (=> b!18548 m!12971))

(assert (=> b!18219 d!3427))

(declare-fun d!3429 () Bool)

(assert (=> d!3429 (= (+!35 (getCurrentListMap!119 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))) (tuple2!795 #b0000000000000000000000000000000000000000000000000000000000000000 v!259)) (getCurrentListMap!119 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4826 v!259 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun lt!4985 () Unit!359)

(declare-fun choose!186 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 V!1043 Int) Unit!359)

(assert (=> d!3429 (= lt!4985 (choose!186 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4826 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(assert (=> d!3429 (validMask!0 (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))))))

(assert (=> d!3429 (= (lemmaChangeZeroKeyThenAddPairToListMap!2 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4826 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))) lt!4985)))

(declare-fun bs!846 () Bool)

(assert (= bs!846 d!3429))

(assert (=> bs!846 m!12743))

(assert (=> bs!846 m!12777))

(declare-fun m!12973 () Bool)

(assert (=> bs!846 m!12973))

(assert (=> bs!846 m!12743))

(declare-fun m!12975 () Bool)

(assert (=> bs!846 m!12975))

(declare-fun m!12977 () Bool)

(assert (=> bs!846 m!12977))

(assert (=> b!18334 d!3429))

(declare-fun d!3431 () Bool)

(declare-fun e!11886 () Bool)

(assert (=> d!3431 e!11886))

(declare-fun res!12862 () Bool)

(assert (=> d!3431 (=> res!12862 e!11886)))

(declare-fun lt!4989 () Bool)

(assert (=> d!3431 (= res!12862 (not lt!4989))))

(declare-fun lt!4986 () Bool)

(assert (=> d!3431 (= lt!4989 lt!4986)))

(declare-fun lt!4988 () Unit!359)

(declare-fun e!11885 () Unit!359)

(assert (=> d!3431 (= lt!4988 e!11885)))

(declare-fun c!1926 () Bool)

(assert (=> d!3431 (= c!1926 lt!4986)))

(assert (=> d!3431 (= lt!4986 (containsKey!22 (toList!282 call!700) key!682))))

(assert (=> d!3431 (= (contains!214 call!700 key!682) lt!4989)))

(declare-fun b!18549 () Bool)

(declare-fun lt!4987 () Unit!359)

(assert (=> b!18549 (= e!11885 lt!4987)))

(assert (=> b!18549 (= lt!4987 (lemmaContainsKeyImpliesGetValueByKeyDefined!19 (toList!282 call!700) key!682))))

(assert (=> b!18549 (isDefined!20 (getValueByKey!58 (toList!282 call!700) key!682))))

(declare-fun b!18550 () Bool)

(declare-fun Unit!368 () Unit!359)

(assert (=> b!18550 (= e!11885 Unit!368)))

(declare-fun b!18551 () Bool)

(assert (=> b!18551 (= e!11886 (isDefined!20 (getValueByKey!58 (toList!282 call!700) key!682)))))

(assert (= (and d!3431 c!1926) b!18549))

(assert (= (and d!3431 (not c!1926)) b!18550))

(assert (= (and d!3431 (not res!12862)) b!18551))

(declare-fun m!12979 () Bool)

(assert (=> d!3431 m!12979))

(declare-fun m!12981 () Bool)

(assert (=> b!18549 m!12981))

(declare-fun m!12983 () Bool)

(assert (=> b!18549 m!12983))

(assert (=> b!18549 m!12983))

(declare-fun m!12985 () Bool)

(assert (=> b!18549 m!12985))

(assert (=> b!18551 m!12983))

(assert (=> b!18551 m!12983))

(assert (=> b!18551 m!12985))

(assert (=> b!18362 d!3431))

(declare-fun d!3433 () Bool)

(declare-fun res!12867 () Bool)

(declare-fun e!11891 () Bool)

(assert (=> d!3433 (=> res!12867 e!11891)))

(assert (=> d!3433 (= res!12867 (= (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000) key!682))))

(assert (=> d!3433 (= (arrayContainsKey!0 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) key!682 #b00000000000000000000000000000000) e!11891)))

(declare-fun b!18556 () Bool)

(declare-fun e!11892 () Bool)

(assert (=> b!18556 (= e!11891 e!11892)))

(declare-fun res!12868 () Bool)

(assert (=> b!18556 (=> (not res!12868) (not e!11892))))

(assert (=> b!18556 (= res!12868 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun b!18557 () Bool)

(assert (=> b!18557 (= e!11892 (arrayContainsKey!0 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) key!682 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!3433 (not res!12867)) b!18556))

(assert (= (and b!18556 res!12868) b!18557))

(assert (=> d!3433 m!12797))

(declare-fun m!12987 () Bool)

(assert (=> b!18557 m!12987))

(assert (=> bm!694 d!3433))

(declare-fun d!3435 () Bool)

(declare-fun res!12869 () Bool)

(declare-fun e!11893 () Bool)

(assert (=> d!3435 (=> (not res!12869) (not e!11893))))

(assert (=> d!3435 (= res!12869 (simpleValid!9 (v!1470 (underlying!61 lt!4691))))))

(assert (=> d!3435 (= (valid!59 (v!1470 (underlying!61 lt!4691))) e!11893)))

(declare-fun b!18558 () Bool)

(declare-fun res!12870 () Bool)

(assert (=> b!18558 (=> (not res!12870) (not e!11893))))

(assert (=> b!18558 (= res!12870 (= (arrayCountValidKeys!0 (_keys!3086 (v!1470 (underlying!61 lt!4691))) #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 lt!4691))))) (_size!82 (v!1470 (underlying!61 lt!4691)))))))

(declare-fun b!18559 () Bool)

(declare-fun res!12871 () Bool)

(assert (=> b!18559 (=> (not res!12871) (not e!11893))))

(assert (=> b!18559 (= res!12871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3086 (v!1470 (underlying!61 lt!4691))) (mask!4594 (v!1470 (underlying!61 lt!4691)))))))

(declare-fun b!18560 () Bool)

(assert (=> b!18560 (= e!11893 (arrayNoDuplicates!0 (_keys!3086 (v!1470 (underlying!61 lt!4691))) #b00000000000000000000000000000000 Nil!535))))

(assert (= (and d!3435 res!12869) b!18558))

(assert (= (and b!18558 res!12870) b!18559))

(assert (= (and b!18559 res!12871) b!18560))

(declare-fun m!12989 () Bool)

(assert (=> d!3435 m!12989))

(declare-fun m!12991 () Bool)

(assert (=> b!18558 m!12991))

(declare-fun m!12993 () Bool)

(assert (=> b!18559 m!12993))

(declare-fun m!12995 () Bool)

(assert (=> b!18560 m!12995))

(assert (=> d!3395 d!3435))

(declare-fun b!18573 () Bool)

(declare-fun e!11900 () Bool)

(declare-fun lt!5050 () array!1015)

(declare-fun lt!5037 () tuple2!794)

(assert (=> b!18573 (= e!11900 (arrayContainsKey!0 lt!5050 (_1!398 lt!5037) #b00000000000000000000000000000000))))

(declare-fun b!18574 () Bool)

(declare-fun lt!5055 () (_ BitVec 32))

(assert (=> b!18574 (= e!11900 (ite (= (_1!398 lt!5037) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!5055 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!5055 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun d!3437 () Bool)

(declare-fun e!11901 () Bool)

(assert (=> d!3437 e!11901))

(declare-fun res!12876 () Bool)

(assert (=> d!3437 (=> (not res!12876) (not e!11901))))

(declare-fun lt!5052 () LongMapFixedSize!100)

(assert (=> d!3437 (= res!12876 (valid!59 lt!5052))))

(declare-fun lt!5045 () LongMapFixedSize!100)

(assert (=> d!3437 (= lt!5052 lt!5045)))

(declare-fun lt!5047 () Unit!359)

(declare-fun e!11902 () Unit!359)

(assert (=> d!3437 (= lt!5047 e!11902)))

(declare-fun c!1932 () Bool)

(assert (=> d!3437 (= c!1932 (not (= (map!357 lt!5045) (ListLongMap!534 Nil!532))))))

(declare-fun lt!5042 () Unit!359)

(declare-fun lt!5040 () Unit!359)

(assert (=> d!3437 (= lt!5042 lt!5040)))

(declare-fun lt!5048 () array!1015)

(declare-fun lt!5039 () (_ BitVec 32))

(declare-fun lt!5058 () List!538)

(assert (=> d!3437 (arrayNoDuplicates!0 lt!5048 lt!5039 lt!5058)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1015 (_ BitVec 32) (_ BitVec 32) List!538) Unit!359)

(assert (=> d!3437 (= lt!5040 (lemmaArrayNoDuplicatesInAll0Array!0 lt!5048 lt!5039 (bvadd lt!4761 #b00000000000000000000000000000001) lt!5058))))

(assert (=> d!3437 (= lt!5058 Nil!535)))

(assert (=> d!3437 (= lt!5039 #b00000000000000000000000000000000)))

(assert (=> d!3437 (= lt!5048 (array!1016 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4761 #b00000000000000000000000000000001)))))

(declare-fun lt!5043 () Unit!359)

(declare-fun lt!5049 () Unit!359)

(assert (=> d!3437 (= lt!5043 lt!5049)))

(declare-fun lt!5053 () (_ BitVec 32))

(declare-fun lt!5054 () array!1015)

(assert (=> d!3437 (arrayForallSeekEntryOrOpenFound!0 lt!5053 lt!5054 lt!4761)))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1015 (_ BitVec 32) (_ BitVec 32)) Unit!359)

(assert (=> d!3437 (= lt!5049 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!5054 lt!4761 lt!5053))))

(assert (=> d!3437 (= lt!5053 #b00000000000000000000000000000000)))

(assert (=> d!3437 (= lt!5054 (array!1016 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4761 #b00000000000000000000000000000001)))))

(declare-fun lt!5046 () Unit!359)

(declare-fun lt!5038 () Unit!359)

(assert (=> d!3437 (= lt!5046 lt!5038)))

(declare-fun lt!5057 () array!1015)

(declare-fun lt!5056 () (_ BitVec 32))

(declare-fun lt!5036 () (_ BitVec 32))

(assert (=> d!3437 (= (arrayCountValidKeys!0 lt!5057 lt!5056 lt!5036) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1015 (_ BitVec 32) (_ BitVec 32)) Unit!359)

(assert (=> d!3437 (= lt!5038 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!5057 lt!5056 lt!5036))))

(assert (=> d!3437 (= lt!5036 (bvadd lt!4761 #b00000000000000000000000000000001))))

(assert (=> d!3437 (= lt!5056 #b00000000000000000000000000000000)))

(assert (=> d!3437 (= lt!5057 (array!1016 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4761 #b00000000000000000000000000000001)))))

(assert (=> d!3437 (= lt!5045 (LongMapFixedSize!101 (defaultEntry!1661 (v!1470 (underlying!61 thiss!848))) lt!4761 #b00000000000000000000000000000000 (dynLambda!132 (defaultEntry!1661 (v!1470 (underlying!61 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!132 (defaultEntry!1661 (v!1470 (underlying!61 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1016 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4761 #b00000000000000000000000000000001)) (array!1014 ((as const (Array (_ BitVec 32) ValueCell!257)) EmptyCell!257) (bvadd lt!4761 #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!3437 (validMask!0 lt!4761)))

(assert (=> d!3437 (= (getNewLongMapFixedSize!8 lt!4761 (defaultEntry!1661 (v!1470 (underlying!61 thiss!848)))) lt!5052)))

(declare-fun b!18575 () Bool)

(declare-fun res!12877 () Bool)

(assert (=> b!18575 (=> (not res!12877) (not e!11901))))

(assert (=> b!18575 (= res!12877 (= (mask!4594 lt!5052) lt!4761))))

(declare-fun b!18576 () Bool)

(declare-fun Unit!369 () Unit!359)

(assert (=> b!18576 (= e!11902 Unit!369)))

(declare-fun head!819 (List!535) tuple2!794)

(assert (=> b!18576 (= lt!5037 (head!819 (toList!282 (map!357 lt!5045))))))

(assert (=> b!18576 (= lt!5050 (array!1016 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4761 #b00000000000000000000000000000001)))))

(assert (=> b!18576 (= lt!5055 #b00000000000000000000000000000000)))

(declare-fun lt!5051 () Unit!359)

(declare-fun lemmaKeyInListMapIsInArray!86 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 64) Int) Unit!359)

(assert (=> b!18576 (= lt!5051 (lemmaKeyInListMapIsInArray!86 lt!5050 (array!1014 ((as const (Array (_ BitVec 32) ValueCell!257)) EmptyCell!257) (bvadd lt!4761 #b00000000000000000000000000000001)) lt!4761 lt!5055 (dynLambda!132 (defaultEntry!1661 (v!1470 (underlying!61 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!132 (defaultEntry!1661 (v!1470 (underlying!61 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!398 lt!5037) (defaultEntry!1661 (v!1470 (underlying!61 thiss!848)))))))

(declare-fun c!1931 () Bool)

(assert (=> b!18576 (= c!1931 (and (not (= (_1!398 lt!5037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!398 lt!5037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!18576 e!11900))

(declare-fun lt!5044 () Unit!359)

(assert (=> b!18576 (= lt!5044 lt!5051)))

(declare-fun lt!5041 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1015 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!18576 (= lt!5041 (arrayScanForKey!0 (array!1016 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4761 #b00000000000000000000000000000001)) (_1!398 lt!5037) #b00000000000000000000000000000000))))

(assert (=> b!18576 false))

(declare-fun b!18577 () Bool)

(assert (=> b!18577 (= e!11901 (= (map!357 lt!5052) (ListLongMap!534 Nil!532)))))

(declare-fun b!18578 () Bool)

(declare-fun Unit!370 () Unit!359)

(assert (=> b!18578 (= e!11902 Unit!370)))

(assert (= (and d!3437 c!1932) b!18576))

(assert (= (and d!3437 (not c!1932)) b!18578))

(assert (= (and b!18576 c!1931) b!18573))

(assert (= (and b!18576 (not c!1931)) b!18574))

(assert (= (and d!3437 res!12876) b!18575))

(assert (= (and b!18575 res!12877) b!18577))

(declare-fun b_lambda!1439 () Bool)

(assert (=> (not b_lambda!1439) (not d!3437)))

(declare-fun t!3173 () Bool)

(declare-fun tb!623 () Bool)

(assert (=> (and b!18125 (= (defaultEntry!1661 (v!1470 (underlying!61 thiss!848))) (defaultEntry!1661 (v!1470 (underlying!61 thiss!848)))) t!3173) tb!623))

(declare-fun result!1009 () Bool)

(assert (=> tb!623 (= result!1009 tp_is_empty!913)))

(assert (=> d!3437 t!3173))

(declare-fun b_and!1301 () Bool)

(assert (= b_and!1299 (and (=> t!3173 result!1009) b_and!1301)))

(declare-fun b_lambda!1441 () Bool)

(assert (=> (not b_lambda!1441) (not b!18576)))

(assert (=> b!18576 t!3173))

(declare-fun b_and!1303 () Bool)

(assert (= b_and!1301 (and (=> t!3173 result!1009) b_and!1303)))

(declare-fun m!12997 () Bool)

(assert (=> b!18573 m!12997))

(declare-fun m!12999 () Bool)

(assert (=> d!3437 m!12999))

(declare-fun m!13001 () Bool)

(assert (=> d!3437 m!13001))

(declare-fun m!13003 () Bool)

(assert (=> d!3437 m!13003))

(declare-fun m!13005 () Bool)

(assert (=> d!3437 m!13005))

(declare-fun m!13007 () Bool)

(assert (=> d!3437 m!13007))

(declare-fun m!13009 () Bool)

(assert (=> d!3437 m!13009))

(declare-fun m!13011 () Bool)

(assert (=> d!3437 m!13011))

(declare-fun m!13013 () Bool)

(assert (=> d!3437 m!13013))

(declare-fun m!13015 () Bool)

(assert (=> d!3437 m!13015))

(declare-fun m!13017 () Bool)

(assert (=> d!3437 m!13017))

(assert (=> b!18576 m!13009))

(declare-fun m!13019 () Bool)

(assert (=> b!18576 m!13019))

(assert (=> b!18576 m!13013))

(assert (=> b!18576 m!13013))

(declare-fun m!13021 () Bool)

(assert (=> b!18576 m!13021))

(declare-fun m!13023 () Bool)

(assert (=> b!18576 m!13023))

(assert (=> b!18576 m!13013))

(declare-fun m!13025 () Bool)

(assert (=> b!18577 m!13025))

(assert (=> bm!641 d!3437))

(declare-fun d!3439 () Bool)

(assert (=> d!3439 (= (map!355 (_2!397 lt!4769)) (map!357 (v!1470 (underlying!61 (_2!397 lt!4769)))))))

(declare-fun bs!847 () Bool)

(assert (= bs!847 d!3439))

(declare-fun m!13027 () Bool)

(assert (=> bs!847 m!13027))

(assert (=> b!18254 d!3439))

(assert (=> b!18254 d!3393))

(declare-fun d!3441 () Bool)

(assert (=> d!3441 (isDefined!20 (getValueByKey!58 (toList!282 lt!4689) key!682))))

(declare-fun lt!5061 () Unit!359)

(declare-fun choose!187 (List!535 (_ BitVec 64)) Unit!359)

(assert (=> d!3441 (= lt!5061 (choose!187 (toList!282 lt!4689) key!682))))

(declare-fun e!11905 () Bool)

(assert (=> d!3441 e!11905))

(declare-fun res!12880 () Bool)

(assert (=> d!3441 (=> (not res!12880) (not e!11905))))

(declare-fun isStrictlySorted!164 (List!535) Bool)

(assert (=> d!3441 (= res!12880 (isStrictlySorted!164 (toList!282 lt!4689)))))

(assert (=> d!3441 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!19 (toList!282 lt!4689) key!682) lt!5061)))

(declare-fun b!18581 () Bool)

(assert (=> b!18581 (= e!11905 (containsKey!22 (toList!282 lt!4689) key!682))))

(assert (= (and d!3441 res!12880) b!18581))

(assert (=> d!3441 m!12667))

(assert (=> d!3441 m!12667))

(assert (=> d!3441 m!12669))

(declare-fun m!13029 () Bool)

(assert (=> d!3441 m!13029))

(declare-fun m!13031 () Bool)

(assert (=> d!3441 m!13031))

(assert (=> b!18581 m!12663))

(assert (=> b!18226 d!3441))

(assert (=> b!18226 d!3423))

(assert (=> b!18226 d!3425))

(declare-fun b!18585 () Bool)

(declare-fun e!11907 () Option!64)

(assert (=> b!18585 (= e!11907 None!62)))

(declare-fun b!18583 () Bool)

(declare-fun e!11906 () Option!64)

(assert (=> b!18583 (= e!11906 e!11907)))

(declare-fun c!1934 () Bool)

(assert (=> b!18583 (= c!1934 (and ((_ is Cons!531) (toList!282 lt!4725)) (not (= (_1!398 (h!1097 (toList!282 lt!4725))) (_1!398 (tuple2!795 key!682 v!259))))))))

(declare-fun b!18582 () Bool)

(assert (=> b!18582 (= e!11906 (Some!63 (_2!398 (h!1097 (toList!282 lt!4725)))))))

(declare-fun c!1933 () Bool)

(declare-fun d!3443 () Bool)

(assert (=> d!3443 (= c!1933 (and ((_ is Cons!531) (toList!282 lt!4725)) (= (_1!398 (h!1097 (toList!282 lt!4725))) (_1!398 (tuple2!795 key!682 v!259)))))))

(assert (=> d!3443 (= (getValueByKey!58 (toList!282 lt!4725) (_1!398 (tuple2!795 key!682 v!259))) e!11906)))

(declare-fun b!18584 () Bool)

(assert (=> b!18584 (= e!11907 (getValueByKey!58 (t!3167 (toList!282 lt!4725)) (_1!398 (tuple2!795 key!682 v!259))))))

(assert (= (and d!3443 c!1933) b!18582))

(assert (= (and d!3443 (not c!1933)) b!18583))

(assert (= (and b!18583 c!1934) b!18584))

(assert (= (and b!18583 (not c!1934)) b!18585))

(declare-fun m!13033 () Bool)

(assert (=> b!18584 m!13033))

(assert (=> b!18218 d!3443))

(declare-fun d!3445 () Bool)

(declare-fun res!12881 () Bool)

(declare-fun e!11908 () Bool)

(assert (=> d!3445 (=> (not res!12881) (not e!11908))))

(assert (=> d!3445 (= res!12881 (simpleValid!9 (_2!396 lt!4827)))))

(assert (=> d!3445 (= (valid!59 (_2!396 lt!4827)) e!11908)))

(declare-fun b!18586 () Bool)

(declare-fun res!12882 () Bool)

(assert (=> b!18586 (=> (not res!12882) (not e!11908))))

(assert (=> b!18586 (= res!12882 (= (arrayCountValidKeys!0 (_keys!3086 (_2!396 lt!4827)) #b00000000000000000000000000000000 (size!579 (_keys!3086 (_2!396 lt!4827)))) (_size!82 (_2!396 lt!4827))))))

(declare-fun b!18587 () Bool)

(declare-fun res!12883 () Bool)

(assert (=> b!18587 (=> (not res!12883) (not e!11908))))

(assert (=> b!18587 (= res!12883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3086 (_2!396 lt!4827)) (mask!4594 (_2!396 lt!4827))))))

(declare-fun b!18588 () Bool)

(assert (=> b!18588 (= e!11908 (arrayNoDuplicates!0 (_keys!3086 (_2!396 lt!4827)) #b00000000000000000000000000000000 Nil!535))))

(assert (= (and d!3445 res!12881) b!18586))

(assert (= (and b!18586 res!12882) b!18587))

(assert (= (and b!18587 res!12883) b!18588))

(declare-fun m!13035 () Bool)

(assert (=> d!3445 m!13035))

(declare-fun m!13037 () Bool)

(assert (=> b!18586 m!13037))

(declare-fun m!13039 () Bool)

(assert (=> b!18587 m!13039))

(declare-fun m!13041 () Bool)

(assert (=> b!18588 m!13041))

(assert (=> d!3397 d!3445))

(declare-fun d!3447 () Bool)

(declare-fun res!12884 () Bool)

(declare-fun e!11909 () Bool)

(assert (=> d!3447 (=> (not res!12884) (not e!11909))))

(assert (=> d!3447 (= res!12884 (simpleValid!9 (v!1470 (underlying!61 (_2!397 lt!4692)))))))

(assert (=> d!3447 (= (valid!59 (v!1470 (underlying!61 (_2!397 lt!4692)))) e!11909)))

(declare-fun b!18589 () Bool)

(declare-fun res!12885 () Bool)

(assert (=> b!18589 (=> (not res!12885) (not e!11909))))

(assert (=> b!18589 (= res!12885 (= (arrayCountValidKeys!0 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))) (_size!82 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun b!18590 () Bool)

(declare-fun res!12886 () Bool)

(assert (=> b!18590 (=> (not res!12886) (not e!11909))))

(assert (=> b!18590 (= res!12886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun b!18591 () Bool)

(assert (=> b!18591 (= e!11909 (arrayNoDuplicates!0 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 Nil!535))))

(assert (= (and d!3447 res!12884) b!18589))

(assert (= (and b!18589 res!12885) b!18590))

(assert (= (and b!18590 res!12886) b!18591))

(declare-fun m!13043 () Bool)

(assert (=> d!3447 m!13043))

(declare-fun m!13045 () Bool)

(assert (=> b!18589 m!13045))

(declare-fun m!13047 () Bool)

(assert (=> b!18590 m!13047))

(declare-fun m!13049 () Bool)

(assert (=> b!18591 m!13049))

(assert (=> d!3397 d!3447))

(declare-fun b!18609 () Bool)

(declare-fun res!12895 () Bool)

(declare-fun e!11921 () Bool)

(assert (=> b!18609 (=> (not res!12895) (not e!11921))))

(declare-fun lt!5067 () SeekEntryResult!44)

(assert (=> b!18609 (= res!12895 (= (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2298 lt!5067)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!18609 (and (bvsge (index!2298 lt!5067) #b00000000000000000000000000000000) (bvslt (index!2298 lt!5067) (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun b!18610 () Bool)

(declare-fun e!11918 () Bool)

(declare-fun e!11920 () Bool)

(assert (=> b!18610 (= e!11918 e!11920)))

(declare-fun c!1940 () Bool)

(assert (=> b!18610 (= c!1940 ((_ is MissingVacant!44) lt!5067))))

(declare-fun bm!770 () Bool)

(declare-fun call!773 () Bool)

(assert (=> bm!770 (= call!773 (arrayContainsKey!0 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) key!682 #b00000000000000000000000000000000))))

(declare-fun b!18611 () Bool)

(assert (=> b!18611 (= e!11921 (not call!773))))

(declare-fun b!18612 () Bool)

(assert (=> b!18612 (= e!11920 ((_ is Undefined!44) lt!5067))))

(declare-fun b!18608 () Bool)

(declare-fun e!11919 () Bool)

(assert (=> b!18608 (= e!11918 e!11919)))

(declare-fun res!12898 () Bool)

(declare-fun call!774 () Bool)

(assert (=> b!18608 (= res!12898 call!774)))

(assert (=> b!18608 (=> (not res!12898) (not e!11919))))

(declare-fun d!3449 () Bool)

(assert (=> d!3449 e!11918))

(declare-fun c!1939 () Bool)

(assert (=> d!3449 (= c!1939 ((_ is MissingZero!44) lt!5067))))

(assert (=> d!3449 (= lt!5067 (seekEntryOrOpen!0 key!682 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun lt!5066 () Unit!359)

(declare-fun choose!188 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 64) Int) Unit!359)

(assert (=> d!3449 (= lt!5066 (choose!188 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) key!682 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(assert (=> d!3449 (validMask!0 (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))))))

(assert (=> d!3449 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!2 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) key!682 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))) lt!5066)))

(declare-fun b!18613 () Bool)

(assert (=> b!18613 (= e!11919 (not call!773))))

(declare-fun b!18614 () Bool)

(declare-fun res!12896 () Bool)

(assert (=> b!18614 (=> (not res!12896) (not e!11921))))

(assert (=> b!18614 (= res!12896 call!774)))

(assert (=> b!18614 (= e!11920 e!11921)))

(declare-fun bm!771 () Bool)

(assert (=> bm!771 (= call!774 (inRange!0 (ite c!1939 (index!2295 lt!5067) (index!2298 lt!5067)) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun b!18615 () Bool)

(assert (=> b!18615 (and (bvsge (index!2295 lt!5067) #b00000000000000000000000000000000) (bvslt (index!2295 lt!5067) (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun res!12897 () Bool)

(assert (=> b!18615 (= res!12897 (= (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2295 lt!5067)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!18615 (=> (not res!12897) (not e!11919))))

(assert (= (and d!3449 c!1939) b!18608))

(assert (= (and d!3449 (not c!1939)) b!18610))

(assert (= (and b!18608 res!12898) b!18615))

(assert (= (and b!18615 res!12897) b!18613))

(assert (= (and b!18610 c!1940) b!18614))

(assert (= (and b!18610 (not c!1940)) b!18612))

(assert (= (and b!18614 res!12896) b!18609))

(assert (= (and b!18609 res!12895) b!18611))

(assert (= (or b!18608 b!18614) bm!771))

(assert (= (or b!18613 b!18611) bm!770))

(declare-fun m!13051 () Bool)

(assert (=> b!18609 m!13051))

(declare-fun m!13053 () Bool)

(assert (=> b!18615 m!13053))

(declare-fun m!13055 () Bool)

(assert (=> bm!771 m!13055))

(assert (=> bm!770 m!12695))

(assert (=> d!3449 m!12701))

(declare-fun m!13057 () Bool)

(assert (=> d!3449 m!13057))

(assert (=> d!3449 m!12777))

(assert (=> bm!707 d!3449))

(declare-fun d!3451 () Bool)

(declare-fun e!11924 () Bool)

(assert (=> d!3451 e!11924))

(declare-fun res!12904 () Bool)

(assert (=> d!3451 (=> (not res!12904) (not e!11924))))

(declare-fun lt!5073 () SeekEntryResult!44)

(assert (=> d!3451 (= res!12904 ((_ is Found!44) lt!5073))))

(assert (=> d!3451 (= lt!5073 (seekEntryOrOpen!0 key!682 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun lt!5072 () Unit!359)

(declare-fun choose!189 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 64) Int) Unit!359)

(assert (=> d!3451 (= lt!5072 (choose!189 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) key!682 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(assert (=> d!3451 (validMask!0 (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))))))

(assert (=> d!3451 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!2 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) key!682 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))) lt!5072)))

(declare-fun b!18620 () Bool)

(declare-fun res!12903 () Bool)

(assert (=> b!18620 (=> (not res!12903) (not e!11924))))

(assert (=> b!18620 (= res!12903 (inRange!0 (index!2296 lt!5073) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun b!18621 () Bool)

(assert (=> b!18621 (= e!11924 (= (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!5073)) key!682))))

(assert (=> b!18621 (and (bvsge (index!2296 lt!5073) #b00000000000000000000000000000000) (bvslt (index!2296 lt!5073) (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(assert (= (and d!3451 res!12904) b!18620))

(assert (= (and b!18620 res!12903) b!18621))

(assert (=> d!3451 m!12701))

(declare-fun m!13059 () Bool)

(assert (=> d!3451 m!13059))

(assert (=> d!3451 m!12777))

(declare-fun m!13061 () Bool)

(assert (=> b!18620 m!13061))

(declare-fun m!13063 () Bool)

(assert (=> b!18621 m!13063))

(assert (=> bm!697 d!3451))

(declare-fun d!3453 () Bool)

(declare-fun res!12909 () Bool)

(declare-fun e!11929 () Bool)

(assert (=> d!3453 (=> res!12909 e!11929)))

(assert (=> d!3453 (= res!12909 (and ((_ is Cons!531) (toList!282 lt!4689)) (= (_1!398 (h!1097 (toList!282 lt!4689))) key!682)))))

(assert (=> d!3453 (= (containsKey!22 (toList!282 lt!4689) key!682) e!11929)))

(declare-fun b!18626 () Bool)

(declare-fun e!11930 () Bool)

(assert (=> b!18626 (= e!11929 e!11930)))

(declare-fun res!12910 () Bool)

(assert (=> b!18626 (=> (not res!12910) (not e!11930))))

(assert (=> b!18626 (= res!12910 (and (or (not ((_ is Cons!531) (toList!282 lt!4689))) (bvsle (_1!398 (h!1097 (toList!282 lt!4689))) key!682)) ((_ is Cons!531) (toList!282 lt!4689)) (bvslt (_1!398 (h!1097 (toList!282 lt!4689))) key!682)))))

(declare-fun b!18627 () Bool)

(assert (=> b!18627 (= e!11930 (containsKey!22 (t!3167 (toList!282 lt!4689)) key!682))))

(assert (= (and d!3453 (not res!12909)) b!18626))

(assert (= (and b!18626 res!12910) b!18627))

(declare-fun m!13065 () Bool)

(assert (=> b!18627 m!13065))

(assert (=> d!3389 d!3453))

(declare-fun d!3455 () Bool)

(declare-fun e!11931 () Bool)

(assert (=> d!3455 e!11931))

(declare-fun res!12911 () Bool)

(assert (=> d!3455 (=> (not res!12911) (not e!11931))))

(declare-fun lt!5074 () ListLongMap!533)

(assert (=> d!3455 (= res!12911 (contains!214 lt!5074 (_1!398 (tuple2!795 key!682 v!259))))))

(declare-fun lt!5077 () List!535)

(assert (=> d!3455 (= lt!5074 (ListLongMap!534 lt!5077))))

(declare-fun lt!5075 () Unit!359)

(declare-fun lt!5076 () Unit!359)

(assert (=> d!3455 (= lt!5075 lt!5076)))

(assert (=> d!3455 (= (getValueByKey!58 lt!5077 (_1!398 (tuple2!795 key!682 v!259))) (Some!63 (_2!398 (tuple2!795 key!682 v!259))))))

(assert (=> d!3455 (= lt!5076 (lemmaContainsTupThenGetReturnValue!16 lt!5077 (_1!398 (tuple2!795 key!682 v!259)) (_2!398 (tuple2!795 key!682 v!259))))))

(assert (=> d!3455 (= lt!5077 (insertStrictlySorted!16 (toList!282 call!699) (_1!398 (tuple2!795 key!682 v!259)) (_2!398 (tuple2!795 key!682 v!259))))))

(assert (=> d!3455 (= (+!35 call!699 (tuple2!795 key!682 v!259)) lt!5074)))

(declare-fun b!18628 () Bool)

(declare-fun res!12912 () Bool)

(assert (=> b!18628 (=> (not res!12912) (not e!11931))))

(assert (=> b!18628 (= res!12912 (= (getValueByKey!58 (toList!282 lt!5074) (_1!398 (tuple2!795 key!682 v!259))) (Some!63 (_2!398 (tuple2!795 key!682 v!259)))))))

(declare-fun b!18629 () Bool)

(assert (=> b!18629 (= e!11931 (contains!217 (toList!282 lt!5074) (tuple2!795 key!682 v!259)))))

(assert (= (and d!3455 res!12911) b!18628))

(assert (= (and b!18628 res!12912) b!18629))

(declare-fun m!13067 () Bool)

(assert (=> d!3455 m!13067))

(declare-fun m!13069 () Bool)

(assert (=> d!3455 m!13069))

(declare-fun m!13071 () Bool)

(assert (=> d!3455 m!13071))

(declare-fun m!13073 () Bool)

(assert (=> d!3455 m!13073))

(declare-fun m!13075 () Bool)

(assert (=> b!18628 m!13075))

(declare-fun m!13077 () Bool)

(assert (=> b!18629 m!13077))

(assert (=> b!18340 d!3455))

(declare-fun d!3457 () Bool)

(assert (=> d!3457 (= (inRange!0 (ite c!1870 (ite c!1869 (index!2296 lt!4847) (ite c!1873 (index!2295 lt!4835) (index!2298 lt!4835))) (ite c!1871 (index!2296 lt!4828) (ite c!1874 (index!2295 lt!4836) (index!2298 lt!4836)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692))))) (and (bvsge (ite c!1870 (ite c!1869 (index!2296 lt!4847) (ite c!1873 (index!2295 lt!4835) (index!2298 lt!4835))) (ite c!1871 (index!2296 lt!4828) (ite c!1874 (index!2295 lt!4836) (index!2298 lt!4836)))) #b00000000000000000000000000000000) (bvslt (ite c!1870 (ite c!1869 (index!2296 lt!4847) (ite c!1873 (index!2295 lt!4835) (index!2298 lt!4835))) (ite c!1871 (index!2296 lt!4828) (ite c!1874 (index!2295 lt!4836) (index!2298 lt!4836)))) (bvadd (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000001))))))

(assert (=> bm!695 d!3457))

(declare-fun d!3459 () Bool)

(declare-fun e!11949 () Bool)

(assert (=> d!3459 e!11949))

(declare-fun res!12932 () Bool)

(assert (=> d!3459 (=> (not res!12932) (not e!11949))))

(declare-fun lt!5140 () tuple2!790)

(assert (=> d!3459 (= res!12932 (_1!396 lt!5140))))

(assert (=> d!3459 (= lt!5140 (tuple2!791 true (LongMapFixedSize!101 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (bvadd (_size!82 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000001) (array!1016 (store (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838)) key!682) (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))) (array!1014 (store (arr!488 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))) (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838)) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))))) (_vacant!82 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun lt!5157 () Unit!359)

(declare-fun lt!5165 () Unit!359)

(assert (=> d!3459 (= lt!5157 lt!5165)))

(declare-fun lt!5143 () array!1013)

(declare-fun lt!5139 () array!1015)

(assert (=> d!3459 (contains!214 (getCurrentListMap!119 lt!5139 lt!5143 (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))) (select (store (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838)) key!682) (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838))))))

(assert (=> d!3459 (= lt!5165 (lemmaValidKeyInArrayIsInListMap!2 lt!5139 lt!5143 (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838)) (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(assert (=> d!3459 (= lt!5143 (array!1014 (store (arr!488 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))) (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838)) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(assert (=> d!3459 (= lt!5139 (array!1016 (store (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838)) key!682) (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun lt!5153 () Unit!359)

(declare-fun lt!5164 () Unit!359)

(assert (=> d!3459 (= lt!5153 lt!5164)))

(declare-fun lt!5161 () array!1015)

(assert (=> d!3459 (= (arrayCountValidKeys!0 lt!5161 (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838)) (bvadd (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!1015 (_ BitVec 32)) Unit!359)

(assert (=> d!3459 (= lt!5164 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!5161 (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838))))))

(assert (=> d!3459 (= lt!5161 (array!1016 (store (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838)) key!682) (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun lt!5160 () Unit!359)

(declare-fun lt!5147 () Unit!359)

(assert (=> d!3459 (= lt!5160 lt!5147)))

(declare-fun lt!5145 () array!1015)

(assert (=> d!3459 (arrayContainsKey!0 lt!5145 key!682 #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1015 (_ BitVec 64) (_ BitVec 32)) Unit!359)

(assert (=> d!3459 (= lt!5147 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!5145 key!682 (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838))))))

(assert (=> d!3459 (= lt!5145 (array!1016 (store (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838)) key!682) (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun lt!5142 () Unit!359)

(declare-fun lt!5163 () Unit!359)

(assert (=> d!3459 (= lt!5142 lt!5163)))

(assert (=> d!3459 (= (+!35 (getCurrentListMap!119 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))) (tuple2!795 key!682 v!259)) (getCurrentListMap!119 (array!1016 (store (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838)) key!682) (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))) (array!1014 (store (arr!488 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))) (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838)) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!1 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 32) (_ BitVec 64) V!1043 Int) Unit!359)

(assert (=> d!3459 (= lt!5163 (lemmaAddValidKeyToArrayThenAddPairToListMap!1 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838)) key!682 v!259 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun lt!5159 () Unit!359)

(declare-fun lt!5144 () Unit!359)

(assert (=> d!3459 (= lt!5159 lt!5144)))

(assert (=> d!3459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!1016 (store (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838)) key!682) (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!1015 (_ BitVec 32) (_ BitVec 32)) Unit!359)

(assert (=> d!3459 (= lt!5144 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!682 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838)) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun lt!5156 () Unit!359)

(declare-fun lt!5141 () Unit!359)

(assert (=> d!3459 (= lt!5156 lt!5141)))

(assert (=> d!3459 (= (arrayCountValidKeys!0 (array!1016 (store (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838)) key!682) (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))) #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))) (bvadd (arrayCountValidKeys!0 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!1015 (_ BitVec 32) (_ BitVec 64)) Unit!359)

(assert (=> d!3459 (= lt!5141 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838)) key!682))))

(declare-fun lt!5151 () Unit!359)

(declare-fun lt!5148 () Unit!359)

(assert (=> d!3459 (= lt!5151 lt!5148)))

(declare-fun lt!5154 () List!538)

(declare-fun lt!5152 () (_ BitVec 32))

(assert (=> d!3459 (arrayNoDuplicates!0 (array!1016 (store (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838)) key!682) (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))) lt!5152 lt!5154)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!1015 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!538) Unit!359)

(assert (=> d!3459 (= lt!5148 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) key!682 (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838)) lt!5152 lt!5154))))

(assert (=> d!3459 (= lt!5154 Nil!535)))

(assert (=> d!3459 (= lt!5152 #b00000000000000000000000000000000)))

(declare-fun lt!5162 () Unit!359)

(declare-fun e!11955 () Unit!359)

(assert (=> d!3459 (= lt!5162 e!11955)))

(declare-fun c!1949 () Bool)

(assert (=> d!3459 (= c!1949 (arrayContainsKey!0 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) key!682 #b00000000000000000000000000000000))))

(declare-fun lt!5155 () Unit!359)

(declare-fun e!11951 () Unit!359)

(assert (=> d!3459 (= lt!5155 e!11951)))

(declare-fun c!1951 () Bool)

(assert (=> d!3459 (= c!1951 (contains!214 (getCurrentListMap!119 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))) key!682))))

(assert (=> d!3459 (valid!59 (v!1470 (underlying!61 (_2!397 lt!4692))))))

(assert (=> d!3459 (= (updateHelperNewKey!2 (v!1470 (underlying!61 (_2!397 lt!4692))) key!682 v!259 (ite c!1864 (index!2298 lt!4838) (index!2295 lt!4838))) lt!5140)))

(declare-fun b!18664 () Bool)

(declare-fun res!12938 () Bool)

(declare-fun e!11952 () Bool)

(assert (=> b!18664 (=> (not res!12938) (not e!11952))))

(declare-fun lt!5167 () SeekEntryResult!44)

(assert (=> b!18664 (= res!12938 (= (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2295 lt!5167)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18665 () Bool)

(assert (=> b!18665 (= e!11949 (= (map!357 (_2!396 lt!5140)) (+!35 (map!357 (v!1470 (underlying!61 (_2!397 lt!4692)))) (tuple2!795 key!682 v!259))))))

(declare-fun c!1950 () Bool)

(declare-fun bm!780 () Bool)

(declare-fun call!785 () Bool)

(declare-fun lt!5149 () SeekEntryResult!44)

(assert (=> bm!780 (= call!785 (inRange!0 (ite c!1951 (index!2296 lt!5149) (ite c!1950 (index!2295 lt!5167) (index!2298 lt!5167))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun b!18666 () Bool)

(declare-fun Unit!371 () Unit!359)

(assert (=> b!18666 (= e!11955 Unit!371)))

(declare-fun b!18667 () Bool)

(declare-fun c!1952 () Bool)

(assert (=> b!18667 (= c!1952 ((_ is MissingVacant!44) lt!5167))))

(declare-fun e!11953 () Bool)

(declare-fun e!11954 () Bool)

(assert (=> b!18667 (= e!11953 e!11954)))

(declare-fun b!18668 () Bool)

(declare-fun Unit!372 () Unit!359)

(assert (=> b!18668 (= e!11955 Unit!372)))

(declare-fun lt!5150 () Unit!359)

(declare-fun lemmaArrayContainsKeyThenInListMap!1 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 64) (_ BitVec 32) Int) Unit!359)

(assert (=> b!18668 (= lt!5150 (lemmaArrayContainsKeyThenInListMap!1 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) key!682 #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(assert (=> b!18668 (contains!214 (getCurrentListMap!119 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))) key!682)))

(declare-fun lt!5158 () Unit!359)

(assert (=> b!18668 (= lt!5158 lt!5150)))

(assert (=> b!18668 false))

(declare-fun b!18669 () Bool)

(declare-fun res!12934 () Bool)

(assert (=> b!18669 (=> (not res!12934) (not e!11949))))

(assert (=> b!18669 (= res!12934 (contains!214 (map!357 (_2!396 lt!5140)) key!682))))

(declare-fun b!18670 () Bool)

(declare-fun res!12936 () Bool)

(assert (=> b!18670 (= res!12936 (= (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2298 lt!5167)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!11950 () Bool)

(assert (=> b!18670 (=> (not res!12936) (not e!11950))))

(declare-fun b!18671 () Bool)

(declare-fun res!12935 () Bool)

(assert (=> b!18671 (=> (not res!12935) (not e!11949))))

(assert (=> b!18671 (= res!12935 (valid!59 (_2!396 lt!5140)))))

(declare-fun b!18672 () Bool)

(declare-fun res!12939 () Bool)

(assert (=> b!18672 (=> (not res!12939) (not e!11952))))

(declare-fun call!784 () Bool)

(assert (=> b!18672 (= res!12939 call!784)))

(assert (=> b!18672 (= e!11953 e!11952)))

(declare-fun b!18673 () Bool)

(declare-fun call!783 () Bool)

(assert (=> b!18673 (= e!11950 (not call!783))))

(declare-fun bm!781 () Bool)

(declare-fun call!786 () SeekEntryResult!44)

(assert (=> bm!781 (= call!786 (seekEntryOrOpen!0 key!682 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun b!18674 () Bool)

(assert (=> b!18674 (= e!11954 e!11950)))

(declare-fun res!12933 () Bool)

(assert (=> b!18674 (= res!12933 call!784)))

(assert (=> b!18674 (=> (not res!12933) (not e!11950))))

(declare-fun b!18675 () Bool)

(declare-fun res!12937 () Bool)

(assert (=> b!18675 (= res!12937 call!785)))

(declare-fun e!11948 () Bool)

(assert (=> b!18675 (=> (not res!12937) (not e!11948))))

(declare-fun b!18676 () Bool)

(assert (=> b!18676 (= e!11952 (not call!783))))

(declare-fun bm!782 () Bool)

(assert (=> bm!782 (= call!783 (arrayContainsKey!0 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) key!682 #b00000000000000000000000000000000))))

(declare-fun b!18677 () Bool)

(assert (=> b!18677 (= e!11954 ((_ is Undefined!44) lt!5167))))

(declare-fun b!18678 () Bool)

(declare-fun Unit!373 () Unit!359)

(assert (=> b!18678 (= e!11951 Unit!373)))

(declare-fun lt!5146 () Unit!359)

(assert (=> b!18678 (= lt!5146 (lemmaInListMapThenSeekEntryOrOpenFindsIt!2 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) key!682 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(assert (=> b!18678 (= lt!5149 call!786)))

(declare-fun res!12931 () Bool)

(assert (=> b!18678 (= res!12931 ((_ is Found!44) lt!5149))))

(assert (=> b!18678 (=> (not res!12931) (not e!11948))))

(assert (=> b!18678 e!11948))

(declare-fun lt!5138 () Unit!359)

(assert (=> b!18678 (= lt!5138 lt!5146)))

(assert (=> b!18678 false))

(declare-fun bm!783 () Bool)

(assert (=> bm!783 (= call!784 call!785)))

(declare-fun b!18679 () Bool)

(declare-fun lt!5166 () Unit!359)

(assert (=> b!18679 (= e!11951 lt!5166)))

(assert (=> b!18679 (= lt!5166 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!2 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) key!682 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(assert (=> b!18679 (= lt!5167 call!786)))

(assert (=> b!18679 (= c!1950 ((_ is MissingZero!44) lt!5167))))

(assert (=> b!18679 e!11953))

(declare-fun b!18680 () Bool)

(assert (=> b!18680 (= e!11948 (= (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!5149)) key!682))))

(assert (= (and d!3459 c!1951) b!18678))

(assert (= (and d!3459 (not c!1951)) b!18679))

(assert (= (and b!18678 res!12931) b!18675))

(assert (= (and b!18675 res!12937) b!18680))

(assert (= (and b!18679 c!1950) b!18672))

(assert (= (and b!18679 (not c!1950)) b!18667))

(assert (= (and b!18672 res!12939) b!18664))

(assert (= (and b!18664 res!12938) b!18676))

(assert (= (and b!18667 c!1952) b!18674))

(assert (= (and b!18667 (not c!1952)) b!18677))

(assert (= (and b!18674 res!12933) b!18670))

(assert (= (and b!18670 res!12936) b!18673))

(assert (= (or b!18672 b!18674) bm!783))

(assert (= (or b!18676 b!18673) bm!782))

(assert (= (or b!18675 bm!783) bm!780))

(assert (= (or b!18678 b!18679) bm!781))

(assert (= (and d!3459 c!1949) b!18668))

(assert (= (and d!3459 (not c!1949)) b!18666))

(assert (= (and d!3459 res!12932) b!18671))

(assert (= (and b!18671 res!12935) b!18669))

(assert (= (and b!18669 res!12934) b!18665))

(declare-fun m!13079 () Bool)

(assert (=> d!3459 m!13079))

(declare-fun m!13081 () Bool)

(assert (=> d!3459 m!13081))

(declare-fun m!13083 () Bool)

(assert (=> d!3459 m!13083))

(declare-fun m!13085 () Bool)

(assert (=> d!3459 m!13085))

(assert (=> d!3459 m!12741))

(assert (=> d!3459 m!12695))

(assert (=> d!3459 m!12743))

(declare-fun m!13087 () Bool)

(assert (=> d!3459 m!13087))

(declare-fun m!13089 () Bool)

(assert (=> d!3459 m!13089))

(assert (=> d!3459 m!12743))

(declare-fun m!13091 () Bool)

(assert (=> d!3459 m!13091))

(declare-fun m!13093 () Bool)

(assert (=> d!3459 m!13093))

(declare-fun m!13095 () Bool)

(assert (=> d!3459 m!13095))

(assert (=> d!3459 m!13083))

(declare-fun m!13097 () Bool)

(assert (=> d!3459 m!13097))

(declare-fun m!13099 () Bool)

(assert (=> d!3459 m!13099))

(assert (=> d!3459 m!13095))

(declare-fun m!13101 () Bool)

(assert (=> d!3459 m!13101))

(declare-fun m!13103 () Bool)

(assert (=> d!3459 m!13103))

(assert (=> d!3459 m!13045))

(declare-fun m!13105 () Bool)

(assert (=> d!3459 m!13105))

(assert (=> d!3459 m!12743))

(declare-fun m!13107 () Bool)

(assert (=> d!3459 m!13107))

(declare-fun m!13109 () Bool)

(assert (=> d!3459 m!13109))

(declare-fun m!13111 () Bool)

(assert (=> d!3459 m!13111))

(declare-fun m!13113 () Bool)

(assert (=> d!3459 m!13113))

(declare-fun m!13115 () Bool)

(assert (=> d!3459 m!13115))

(declare-fun m!13117 () Bool)

(assert (=> d!3459 m!13117))

(assert (=> bm!782 m!12695))

(declare-fun m!13119 () Bool)

(assert (=> b!18671 m!13119))

(declare-fun m!13121 () Bool)

(assert (=> b!18664 m!13121))

(declare-fun m!13123 () Bool)

(assert (=> b!18670 m!13123))

(declare-fun m!13125 () Bool)

(assert (=> b!18680 m!13125))

(declare-fun m!13127 () Bool)

(assert (=> b!18669 m!13127))

(assert (=> b!18669 m!13127))

(declare-fun m!13129 () Bool)

(assert (=> b!18669 m!13129))

(assert (=> b!18679 m!12691))

(assert (=> b!18665 m!13127))

(assert (=> b!18665 m!12713))

(assert (=> b!18665 m!12713))

(declare-fun m!13131 () Bool)

(assert (=> b!18665 m!13131))

(declare-fun m!13133 () Bool)

(assert (=> b!18668 m!13133))

(assert (=> b!18668 m!12743))

(assert (=> b!18668 m!12743))

(assert (=> b!18668 m!13107))

(assert (=> bm!781 m!12701))

(assert (=> b!18678 m!12737))

(declare-fun m!13135 () Bool)

(assert (=> bm!780 m!13135))

(assert (=> bm!696 d!3459))

(declare-fun d!3461 () Bool)

(declare-fun e!11957 () Bool)

(assert (=> d!3461 e!11957))

(declare-fun res!12940 () Bool)

(assert (=> d!3461 (=> res!12940 e!11957)))

(declare-fun lt!5171 () Bool)

(assert (=> d!3461 (= res!12940 (not lt!5171))))

(declare-fun lt!5168 () Bool)

(assert (=> d!3461 (= lt!5171 lt!5168)))

(declare-fun lt!5170 () Unit!359)

(declare-fun e!11956 () Unit!359)

(assert (=> d!3461 (= lt!5170 e!11956)))

(declare-fun c!1953 () Bool)

(assert (=> d!3461 (= c!1953 lt!5168)))

(assert (=> d!3461 (= lt!5168 (containsKey!22 (toList!282 call!712) key!682))))

(assert (=> d!3461 (= (contains!214 call!712 key!682) lt!5171)))

(declare-fun b!18681 () Bool)

(declare-fun lt!5169 () Unit!359)

(assert (=> b!18681 (= e!11956 lt!5169)))

(assert (=> b!18681 (= lt!5169 (lemmaContainsKeyImpliesGetValueByKeyDefined!19 (toList!282 call!712) key!682))))

(assert (=> b!18681 (isDefined!20 (getValueByKey!58 (toList!282 call!712) key!682))))

(declare-fun b!18682 () Bool)

(declare-fun Unit!374 () Unit!359)

(assert (=> b!18682 (= e!11956 Unit!374)))

(declare-fun b!18683 () Bool)

(assert (=> b!18683 (= e!11957 (isDefined!20 (getValueByKey!58 (toList!282 call!712) key!682)))))

(assert (= (and d!3461 c!1953) b!18681))

(assert (= (and d!3461 (not c!1953)) b!18682))

(assert (= (and d!3461 (not res!12940)) b!18683))

(declare-fun m!13137 () Bool)

(assert (=> d!3461 m!13137))

(declare-fun m!13139 () Bool)

(assert (=> b!18681 m!13139))

(declare-fun m!13141 () Bool)

(assert (=> b!18681 m!13141))

(assert (=> b!18681 m!13141))

(declare-fun m!13143 () Bool)

(assert (=> b!18681 m!13143))

(assert (=> b!18683 m!13141))

(assert (=> b!18683 m!13141))

(assert (=> b!18683 m!13143))

(assert (=> bm!690 d!3461))

(assert (=> d!3391 d!3437))

(declare-fun d!3463 () Bool)

(declare-fun e!11962 () Bool)

(assert (=> d!3463 e!11962))

(declare-fun res!12943 () Bool)

(assert (=> d!3463 (=> (not res!12943) (not e!11962))))

(declare-fun lt!5176 () (_ BitVec 32))

(assert (=> d!3463 (= res!12943 (validMask!0 lt!5176))))

(declare-datatypes ((tuple2!810 0))(
  ( (tuple2!811 (_1!407 Unit!359) (_2!407 (_ BitVec 32))) )
))
(declare-fun e!11963 () tuple2!810)

(assert (=> d!3463 (= lt!5176 (_2!407 e!11963))))

(declare-fun c!1956 () Bool)

(declare-fun lt!5177 () tuple2!810)

(assert (=> d!3463 (= c!1956 (and (bvsgt (_2!407 lt!5177) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!82 (v!1470 (underlying!61 thiss!848)))) (_2!407 lt!5177)) (bvsge (bvadd (bvand (bvashr (_2!407 lt!5177) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!82 (v!1470 (underlying!61 thiss!848))))))))

(declare-fun Unit!375 () Unit!359)

(declare-fun Unit!376 () Unit!359)

(assert (=> d!3463 (= lt!5177 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!82 (v!1470 (underlying!61 thiss!848))) (_vacant!82 (v!1470 (underlying!61 thiss!848))))) (mask!4594 (v!1470 (underlying!61 thiss!848)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!82 (v!1470 (underlying!61 thiss!848)))) (mask!4594 (v!1470 (underlying!61 thiss!848))))) (tuple2!811 Unit!375 (bvand (bvadd (bvshl (mask!4594 (v!1470 (underlying!61 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!811 Unit!376 (mask!4594 (v!1470 (underlying!61 thiss!848))))))))

(assert (=> d!3463 (validMask!0 (mask!4594 (v!1470 (underlying!61 thiss!848))))))

(assert (=> d!3463 (= (computeNewMask!2 thiss!848 (mask!4594 (v!1470 (underlying!61 thiss!848))) (_vacant!82 (v!1470 (underlying!61 thiss!848))) (_size!82 (v!1470 (underlying!61 thiss!848)))) lt!5176)))

(declare-fun b!18690 () Bool)

(declare-fun computeNewMaskWhile!2 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!810)

(assert (=> b!18690 (= e!11963 (computeNewMaskWhile!2 (_size!82 (v!1470 (underlying!61 thiss!848))) (_vacant!82 (v!1470 (underlying!61 thiss!848))) (mask!4594 (v!1470 (underlying!61 thiss!848))) (_2!407 lt!5177)))))

(declare-fun b!18691 () Bool)

(declare-fun Unit!377 () Unit!359)

(assert (=> b!18691 (= e!11963 (tuple2!811 Unit!377 (_2!407 lt!5177)))))

(declare-fun b!18692 () Bool)

(assert (=> b!18692 (= e!11962 (bvsle (_size!82 (v!1470 (underlying!61 thiss!848))) (bvadd lt!5176 #b00000000000000000000000000000001)))))

(assert (= (and d!3463 c!1956) b!18690))

(assert (= (and d!3463 (not c!1956)) b!18691))

(assert (= (and d!3463 res!12943) b!18692))

(declare-fun m!13145 () Bool)

(assert (=> d!3463 m!13145))

(declare-fun m!13147 () Bool)

(assert (=> d!3463 m!13147))

(declare-fun m!13149 () Bool)

(assert (=> b!18690 m!13149))

(assert (=> d!3391 d!3463))

(assert (=> d!3391 d!3399))

(declare-fun e!11965 () ListLongMap!533)

(declare-fun b!18693 () Bool)

(declare-fun call!789 () ListLongMap!533)

(assert (=> b!18693 (= e!11965 (+!35 call!789 (tuple2!795 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1868 (ite c!1867 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))))))))

(declare-fun b!18694 () Bool)

(declare-fun e!11964 () Bool)

(declare-fun e!11967 () Bool)

(assert (=> b!18694 (= e!11964 e!11967)))

(declare-fun res!12950 () Bool)

(declare-fun call!790 () Bool)

(assert (=> b!18694 (= res!12950 call!790)))

(assert (=> b!18694 (=> (not res!12950) (not e!11967))))

(declare-fun b!18695 () Bool)

(declare-fun e!11972 () Bool)

(declare-fun e!11971 () Bool)

(assert (=> b!18695 (= e!11972 e!11971)))

(declare-fun c!1957 () Bool)

(assert (=> b!18695 (= c!1957 (not (= (bvand (ite c!1868 (ite c!1867 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4846) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!18696 () Bool)

(declare-fun lt!5187 () ListLongMap!533)

(assert (=> b!18696 (= e!11967 (= (apply!27 lt!5187 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun b!18697 () Bool)

(declare-fun e!11966 () Bool)

(assert (=> b!18697 (= e!11971 e!11966)))

(declare-fun res!12947 () Bool)

(declare-fun call!788 () Bool)

(assert (=> b!18697 (= res!12947 call!788)))

(assert (=> b!18697 (=> (not res!12947) (not e!11966))))

(declare-fun b!18698 () Bool)

(declare-fun e!11976 () ListLongMap!533)

(declare-fun call!793 () ListLongMap!533)

(assert (=> b!18698 (= e!11976 call!793)))

(declare-fun bm!784 () Bool)

(assert (=> bm!784 (= call!790 (contains!214 lt!5187 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18699 () Bool)

(assert (=> b!18699 (= e!11964 (not call!790))))

(declare-fun b!18700 () Bool)

(declare-fun e!11973 () ListLongMap!533)

(assert (=> b!18700 (= e!11973 call!793)))

(declare-fun b!18701 () Bool)

(declare-fun e!11975 () Unit!359)

(declare-fun Unit!378 () Unit!359)

(assert (=> b!18701 (= e!11975 Unit!378)))

(declare-fun b!18702 () Bool)

(declare-fun res!12946 () Bool)

(assert (=> b!18702 (=> (not res!12946) (not e!11972))))

(declare-fun e!11968 () Bool)

(assert (=> b!18702 (= res!12946 e!11968)))

(declare-fun res!12944 () Bool)

(assert (=> b!18702 (=> res!12944 e!11968)))

(declare-fun e!11970 () Bool)

(assert (=> b!18702 (= res!12944 (not e!11970))))

(declare-fun res!12951 () Bool)

(assert (=> b!18702 (=> (not res!12951) (not e!11970))))

(assert (=> b!18702 (= res!12951 (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun b!18703 () Bool)

(declare-fun lt!5196 () Unit!359)

(assert (=> b!18703 (= e!11975 lt!5196)))

(declare-fun lt!5198 () ListLongMap!533)

(assert (=> b!18703 (= lt!5198 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (array!1014 (store (arr!488 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4838) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (ite c!1867 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4846) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (ite c!1867 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun lt!5194 () (_ BitVec 64))

(assert (=> b!18703 (= lt!5194 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5190 () (_ BitVec 64))

(assert (=> b!18703 (= lt!5190 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000))))

(declare-fun lt!5188 () Unit!359)

(assert (=> b!18703 (= lt!5188 (addStillContains!12 lt!5198 lt!5194 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!5190))))

(assert (=> b!18703 (contains!214 (+!35 lt!5198 (tuple2!795 lt!5194 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))))) lt!5190)))

(declare-fun lt!5180 () Unit!359)

(assert (=> b!18703 (= lt!5180 lt!5188)))

(declare-fun lt!5191 () ListLongMap!533)

(assert (=> b!18703 (= lt!5191 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (array!1014 (store (arr!488 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4838) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (ite c!1867 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4846) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (ite c!1867 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun lt!5186 () (_ BitVec 64))

(assert (=> b!18703 (= lt!5186 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5184 () (_ BitVec 64))

(assert (=> b!18703 (= lt!5184 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000))))

(declare-fun lt!5178 () Unit!359)

(assert (=> b!18703 (= lt!5178 (addApplyDifferent!12 lt!5191 lt!5186 (ite c!1868 (ite c!1867 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))) lt!5184))))

(assert (=> b!18703 (= (apply!27 (+!35 lt!5191 (tuple2!795 lt!5186 (ite c!1868 (ite c!1867 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))))) lt!5184) (apply!27 lt!5191 lt!5184))))

(declare-fun lt!5193 () Unit!359)

(assert (=> b!18703 (= lt!5193 lt!5178)))

(declare-fun lt!5197 () ListLongMap!533)

(assert (=> b!18703 (= lt!5197 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (array!1014 (store (arr!488 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4838) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (ite c!1867 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4846) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (ite c!1867 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun lt!5192 () (_ BitVec 64))

(assert (=> b!18703 (= lt!5192 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5181 () (_ BitVec 64))

(assert (=> b!18703 (= lt!5181 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000))))

(declare-fun lt!5183 () Unit!359)

(assert (=> b!18703 (= lt!5183 (addApplyDifferent!12 lt!5197 lt!5192 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!5181))))

(assert (=> b!18703 (= (apply!27 (+!35 lt!5197 (tuple2!795 lt!5192 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))))) lt!5181) (apply!27 lt!5197 lt!5181))))

(declare-fun lt!5182 () Unit!359)

(assert (=> b!18703 (= lt!5182 lt!5183)))

(declare-fun lt!5179 () ListLongMap!533)

(assert (=> b!18703 (= lt!5179 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (array!1014 (store (arr!488 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4838) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (ite c!1867 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4846) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (ite c!1867 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun lt!5195 () (_ BitVec 64))

(assert (=> b!18703 (= lt!5195 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5185 () (_ BitVec 64))

(assert (=> b!18703 (= lt!5185 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000))))

(assert (=> b!18703 (= lt!5196 (addApplyDifferent!12 lt!5179 lt!5195 (ite c!1868 (ite c!1867 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))) lt!5185))))

(assert (=> b!18703 (= (apply!27 (+!35 lt!5179 (tuple2!795 lt!5195 (ite c!1868 (ite c!1867 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))))) lt!5185) (apply!27 lt!5179 lt!5185))))

(declare-fun b!18704 () Bool)

(assert (=> b!18704 (= e!11971 (not call!788))))

(declare-fun b!18705 () Bool)

(declare-fun call!791 () ListLongMap!533)

(assert (=> b!18705 (= e!11973 call!791)))

(declare-fun b!18706 () Bool)

(declare-fun res!12949 () Bool)

(assert (=> b!18706 (=> (not res!12949) (not e!11972))))

(assert (=> b!18706 (= res!12949 e!11964)))

(declare-fun c!1958 () Bool)

(assert (=> b!18706 (= c!1958 (not (= (bvand (ite c!1868 (ite c!1867 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4846) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!18707 () Bool)

(assert (=> b!18707 (= e!11970 (validKeyInArray!0 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000)))))

(declare-fun bm!785 () Bool)

(declare-fun call!792 () ListLongMap!533)

(assert (=> bm!785 (= call!791 call!792)))

(declare-fun bm!786 () Bool)

(assert (=> bm!786 (= call!788 (contains!214 lt!5187 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!787 () ListLongMap!533)

(declare-fun bm!787 () Bool)

(assert (=> bm!787 (= call!787 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (array!1014 (store (arr!488 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4838) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (ite c!1867 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4846) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (ite c!1867 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun b!18708 () Bool)

(declare-fun e!11969 () Bool)

(assert (=> b!18708 (= e!11968 e!11969)))

(declare-fun res!12948 () Bool)

(assert (=> b!18708 (=> (not res!12948) (not e!11969))))

(assert (=> b!18708 (= res!12948 (contains!214 lt!5187 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000)))))

(assert (=> b!18708 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun b!18709 () Bool)

(assert (=> b!18709 (= e!11966 (= (apply!27 lt!5187 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!1868 (ite c!1867 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun bm!788 () Bool)

(assert (=> bm!788 (= call!793 call!789)))

(declare-fun d!3465 () Bool)

(assert (=> d!3465 e!11972))

(declare-fun res!12945 () Bool)

(assert (=> d!3465 (=> (not res!12945) (not e!11972))))

(assert (=> d!3465 (= res!12945 (or (bvsge #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))))

(declare-fun lt!5189 () ListLongMap!533)

(assert (=> d!3465 (= lt!5187 lt!5189)))

(declare-fun lt!5199 () Unit!359)

(assert (=> d!3465 (= lt!5199 e!11975)))

(declare-fun c!1962 () Bool)

(declare-fun e!11974 () Bool)

(assert (=> d!3465 (= c!1962 e!11974)))

(declare-fun res!12952 () Bool)

(assert (=> d!3465 (=> (not res!12952) (not e!11974))))

(assert (=> d!3465 (= res!12952 (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(assert (=> d!3465 (= lt!5189 e!11965)))

(declare-fun c!1960 () Bool)

(assert (=> d!3465 (= c!1960 (and (not (= (bvand (ite c!1868 (ite c!1867 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4846) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!1868 (ite c!1867 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4846) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3465 (validMask!0 (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))))))

(assert (=> d!3465 (= (getCurrentListMap!119 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (array!1014 (store (arr!488 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4838) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (ite c!1867 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4846) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (ite c!1868 (ite c!1867 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))) lt!5187)))

(declare-fun b!18710 () Bool)

(assert (=> b!18710 (= e!11969 (= (apply!27 lt!5187 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000)) (get!348 (select (arr!488 (ite c!1868 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (array!1014 (store (arr!488 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4838) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))))))) #b00000000000000000000000000000000) (dynLambda!132 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!18710 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!578 (ite c!1868 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (array!1014 (store (arr!488 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4838) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))))))))))

(assert (=> b!18710 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(declare-fun b!18711 () Bool)

(declare-fun c!1959 () Bool)

(assert (=> b!18711 (= c!1959 (and (not (= (bvand (ite c!1868 (ite c!1867 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4846) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!1868 (ite c!1867 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4846) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!18711 (= e!11976 e!11973)))

(declare-fun b!18712 () Bool)

(assert (=> b!18712 (= e!11965 e!11976)))

(declare-fun c!1961 () Bool)

(assert (=> b!18712 (= c!1961 (and (not (= (bvand (ite c!1868 (ite c!1867 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4846) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!1868 (ite c!1867 (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4846) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!789 () Bool)

(assert (=> bm!789 (= call!792 call!787)))

(declare-fun bm!790 () Bool)

(assert (=> bm!790 (= call!789 (+!35 (ite c!1960 call!787 (ite c!1961 call!792 call!791)) (ite (or c!1960 c!1961) (tuple2!795 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692))))) (tuple2!795 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1868 (ite c!1867 (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))))

(declare-fun b!18713 () Bool)

(assert (=> b!18713 (= e!11974 (validKeyInArray!0 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) #b00000000000000000000000000000000)))))

(assert (= (and d!3465 c!1960) b!18693))

(assert (= (and d!3465 (not c!1960)) b!18712))

(assert (= (and b!18712 c!1961) b!18698))

(assert (= (and b!18712 (not c!1961)) b!18711))

(assert (= (and b!18711 c!1959) b!18700))

(assert (= (and b!18711 (not c!1959)) b!18705))

(assert (= (or b!18700 b!18705) bm!785))

(assert (= (or b!18698 bm!785) bm!789))

(assert (= (or b!18698 b!18700) bm!788))

(assert (= (or b!18693 bm!789) bm!787))

(assert (= (or b!18693 bm!788) bm!790))

(assert (= (and d!3465 res!12952) b!18713))

(assert (= (and d!3465 c!1962) b!18703))

(assert (= (and d!3465 (not c!1962)) b!18701))

(assert (= (and d!3465 res!12945) b!18702))

(assert (= (and b!18702 res!12951) b!18707))

(assert (= (and b!18702 (not res!12944)) b!18708))

(assert (= (and b!18708 res!12948) b!18710))

(assert (= (and b!18702 res!12946) b!18706))

(assert (= (and b!18706 c!1958) b!18694))

(assert (= (and b!18706 (not c!1958)) b!18699))

(assert (= (and b!18694 res!12950) b!18696))

(assert (= (or b!18694 b!18699) bm!784))

(assert (= (and b!18706 res!12949) b!18695))

(assert (= (and b!18695 c!1957) b!18697))

(assert (= (and b!18695 (not c!1957)) b!18704))

(assert (= (and b!18697 res!12947) b!18709))

(assert (= (or b!18697 b!18704) bm!786))

(declare-fun b_lambda!1443 () Bool)

(assert (=> (not b_lambda!1443) (not b!18710)))

(assert (=> b!18710 t!3171))

(declare-fun b_and!1305 () Bool)

(assert (= b_and!1303 (and (=> t!3171 result!1005) b_and!1305)))

(declare-fun m!13151 () Bool)

(assert (=> b!18703 m!13151))

(declare-fun m!13153 () Bool)

(assert (=> b!18703 m!13153))

(declare-fun m!13155 () Bool)

(assert (=> b!18703 m!13155))

(declare-fun m!13157 () Bool)

(assert (=> b!18703 m!13157))

(assert (=> b!18703 m!12797))

(declare-fun m!13159 () Bool)

(assert (=> b!18703 m!13159))

(declare-fun m!13161 () Bool)

(assert (=> b!18703 m!13161))

(declare-fun m!13163 () Bool)

(assert (=> b!18703 m!13163))

(declare-fun m!13165 () Bool)

(assert (=> b!18703 m!13165))

(declare-fun m!13167 () Bool)

(assert (=> b!18703 m!13167))

(declare-fun m!13169 () Bool)

(assert (=> b!18703 m!13169))

(assert (=> b!18703 m!13161))

(declare-fun m!13171 () Bool)

(assert (=> b!18703 m!13171))

(declare-fun m!13173 () Bool)

(assert (=> b!18703 m!13173))

(assert (=> b!18703 m!13167))

(declare-fun m!13175 () Bool)

(assert (=> b!18703 m!13175))

(declare-fun m!13177 () Bool)

(assert (=> b!18703 m!13177))

(assert (=> b!18703 m!13157))

(declare-fun m!13179 () Bool)

(assert (=> b!18703 m!13179))

(assert (=> b!18703 m!13163))

(declare-fun m!13181 () Bool)

(assert (=> b!18703 m!13181))

(declare-fun m!13183 () Bool)

(assert (=> bm!790 m!13183))

(declare-fun m!13185 () Bool)

(assert (=> b!18709 m!13185))

(assert (=> b!18707 m!12797))

(assert (=> b!18707 m!12797))

(assert (=> b!18707 m!12827))

(assert (=> b!18713 m!12797))

(assert (=> b!18713 m!12797))

(assert (=> b!18713 m!12827))

(declare-fun m!13187 () Bool)

(assert (=> b!18696 m!13187))

(declare-fun m!13189 () Bool)

(assert (=> b!18710 m!13189))

(assert (=> b!18710 m!12797))

(assert (=> b!18710 m!12833))

(assert (=> b!18710 m!12797))

(declare-fun m!13191 () Bool)

(assert (=> b!18710 m!13191))

(assert (=> b!18710 m!13189))

(assert (=> b!18710 m!12833))

(declare-fun m!13193 () Bool)

(assert (=> b!18710 m!13193))

(declare-fun m!13195 () Bool)

(assert (=> bm!786 m!13195))

(assert (=> b!18708 m!12797))

(assert (=> b!18708 m!12797))

(declare-fun m!13197 () Bool)

(assert (=> b!18708 m!13197))

(assert (=> d!3465 m!12777))

(declare-fun m!13199 () Bool)

(assert (=> b!18693 m!13199))

(declare-fun m!13201 () Bool)

(assert (=> bm!784 m!13201))

(assert (=> bm!787 m!13177))

(assert (=> bm!710 d!3465))

(declare-fun d!3467 () Bool)

(assert (=> d!3467 (= (map!357 (v!1470 (underlying!61 (_2!397 lt!4692)))) (getCurrentListMap!119 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun bs!848 () Bool)

(assert (= bs!848 d!3467))

(assert (=> bs!848 m!12743))

(assert (=> bm!700 d!3467))

(declare-fun bm!817 () Bool)

(declare-fun lt!5265 () (_ BitVec 64))

(declare-fun lt!5272 () (_ BitVec 64))

(declare-fun lt!5290 () V!1043)

(declare-fun lt!5269 () ListLongMap!533)

(declare-fun lt!5283 () ListLongMap!533)

(declare-fun c!1979 () Bool)

(declare-fun lt!5264 () (_ BitVec 64))

(declare-fun call!829 () Unit!359)

(declare-fun addCommutativeForDiffKeys!2 (ListLongMap!533 (_ BitVec 64) V!1043 (_ BitVec 64) V!1043) Unit!359)

(assert (=> bm!817 (= call!829 (addCommutativeForDiffKeys!2 (ite c!1979 lt!5269 lt!5283) lt!5264 lt!5290 (ite c!1979 lt!5265 lt!5272) (ite c!1979 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 (v!1470 (underlying!61 thiss!848))))))))

(declare-fun bm!818 () Bool)

(declare-fun call!827 () ListLongMap!533)

(declare-fun call!822 () ListLongMap!533)

(assert (=> bm!818 (= call!827 (+!35 call!822 (tuple2!795 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))))))))

(declare-fun b!18742 () Bool)

(declare-fun e!12000 () tuple2!790)

(declare-fun lt!5286 () tuple2!790)

(assert (=> b!18742 (= e!12000 (tuple2!791 (_1!396 lt!5286) (_2!396 lt!5286)))))

(assert (=> b!18742 (= lt!5269 call!822)))

(assert (=> b!18742 (= lt!5265 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5268 () Unit!359)

(assert (=> b!18742 (= lt!5268 call!829)))

(declare-fun call!832 () ListLongMap!533)

(declare-fun call!831 () ListLongMap!533)

(assert (=> b!18742 (= call!832 call!831)))

(declare-fun lt!5294 () Unit!359)

(assert (=> b!18742 (= lt!5294 lt!5268)))

(declare-fun lt!5270 () ListLongMap!533)

(assert (=> b!18742 (= lt!5270 call!827)))

(declare-fun lt!5274 () (_ BitVec 64))

(assert (=> b!18742 (= lt!5274 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5280 () Unit!359)

(declare-fun call!823 () Unit!359)

(assert (=> b!18742 (= lt!5280 call!823)))

(declare-fun call!825 () ListLongMap!533)

(declare-fun call!820 () ListLongMap!533)

(assert (=> b!18742 (= call!825 call!820)))

(declare-fun lt!5292 () Unit!359)

(assert (=> b!18742 (= lt!5292 lt!5280)))

(declare-fun call!830 () tuple2!790)

(assert (=> b!18742 (= lt!5286 call!830)))

(declare-fun bm!819 () Bool)

(declare-fun lt!5289 () (_ BitVec 64))

(declare-fun call!824 () ListLongMap!533)

(declare-fun call!821 () ListLongMap!533)

(assert (=> bm!819 (= call!825 (+!35 (ite c!1979 call!824 call!821) (ite c!1979 (tuple2!795 lt!5274 (minValue!1597 (v!1470 (underlying!61 thiss!848)))) (tuple2!795 lt!5289 (zeroValue!1597 (v!1470 (underlying!61 thiss!848)))))))))

(declare-fun bm!820 () Bool)

(assert (=> bm!820 (= call!822 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1470 (underlying!61 thiss!848))) (_values!1658 (v!1470 (underlying!61 thiss!848))) (mask!4594 (v!1470 (underlying!61 thiss!848))) (extraKeys!1574 (v!1470 (underlying!61 thiss!848))) (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 (v!1470 (underlying!61 thiss!848))) (bvadd (bvsub (size!579 (_keys!3086 (v!1470 (underlying!61 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!1661 (v!1470 (underlying!61 thiss!848)))))))

(declare-fun b!18743 () Bool)

(declare-fun lt!5273 () tuple2!790)

(assert (=> b!18743 (= e!12000 (tuple2!791 true (_2!396 lt!5273)))))

(declare-fun lt!5295 () ListLongMap!533)

(assert (=> b!18743 (= lt!5295 call!822)))

(assert (=> b!18743 (= lt!5289 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5266 () Unit!359)

(assert (=> b!18743 (= lt!5266 call!823)))

(assert (=> b!18743 (= call!825 call!820)))

(declare-fun lt!5279 () Unit!359)

(assert (=> b!18743 (= lt!5279 lt!5266)))

(assert (=> b!18743 (= lt!5283 call!827)))

(assert (=> b!18743 (= lt!5272 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5288 () Unit!359)

(assert (=> b!18743 (= lt!5288 call!829)))

(assert (=> b!18743 (= call!832 call!831)))

(declare-fun lt!5281 () Unit!359)

(assert (=> b!18743 (= lt!5281 lt!5288)))

(declare-fun b!18745 () Bool)

(declare-fun e!11994 () Bool)

(assert (=> b!18745 (= e!11994 (ite (= lt!5264 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1574 (v!1470 (underlying!61 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1574 (v!1470 (underlying!61 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!821 () Bool)

(declare-fun call!828 () ListLongMap!533)

(assert (=> bm!821 (= call!831 (+!35 call!828 (tuple2!795 lt!5264 lt!5290)))))

(declare-fun bm!822 () Bool)

(declare-fun c!1978 () Bool)

(assert (=> bm!822 (= call!830 (repackFrom!2 thiss!848 (ite c!1978 (_2!396 lt!5273) (v!1470 (_2!406 lt!4765))) (bvsub (bvsub (size!579 (_keys!3086 (v!1470 (underlying!61 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun bm!823 () Bool)

(assert (=> bm!823 (= call!824 (+!35 (ite c!1979 lt!5270 lt!5283) (tuple2!795 lt!5264 lt!5290)))))

(declare-fun bm!824 () Bool)

(declare-fun call!826 () ListLongMap!533)

(assert (=> bm!824 (= call!820 (+!35 call!826 (tuple2!795 lt!5264 lt!5290)))))

(declare-fun bm!825 () Bool)

(assert (=> bm!825 (= call!821 (+!35 (ite c!1979 lt!5269 lt!5295) (tuple2!795 lt!5264 lt!5290)))))

(declare-fun b!18746 () Bool)

(declare-fun e!11993 () Bool)

(declare-fun e!11998 () Bool)

(assert (=> b!18746 (= e!11993 e!11998)))

(declare-fun res!12957 () Bool)

(assert (=> b!18746 (=> (not res!12957) (not e!11998))))

(declare-fun lt!5291 () tuple2!790)

(assert (=> b!18746 (= res!12957 (valid!59 (_2!396 lt!5291)))))

(declare-fun b!18747 () Bool)

(declare-fun e!11995 () tuple2!790)

(assert (=> b!18747 (= e!11995 (tuple2!791 true (v!1470 (_2!406 lt!4765))))))

(declare-fun bm!826 () Bool)

(assert (=> bm!826 (= call!832 (+!35 (ite c!1979 call!821 call!824) (ite c!1979 (tuple2!795 lt!5265 (zeroValue!1597 (v!1470 (underlying!61 thiss!848)))) (tuple2!795 lt!5272 (minValue!1597 (v!1470 (underlying!61 thiss!848)))))))))

(declare-fun b!18748 () Bool)

(declare-fun e!11997 () tuple2!790)

(declare-fun e!11996 () tuple2!790)

(assert (=> b!18748 (= e!11997 e!11996)))

(assert (=> b!18748 (= lt!5273 (update!13 (v!1470 (_2!406 lt!4765)) lt!5264 lt!5290))))

(declare-fun c!1976 () Bool)

(declare-fun lt!5282 () ListLongMap!533)

(assert (=> b!18748 (= c!1976 (contains!214 lt!5282 lt!5264))))

(declare-fun lt!5284 () Unit!359)

(declare-fun e!11999 () Unit!359)

(assert (=> b!18748 (= lt!5284 e!11999)))

(declare-fun c!1977 () Bool)

(assert (=> b!18748 (= c!1977 (_1!396 lt!5273))))

(declare-fun bm!827 () Bool)

(assert (=> bm!827 (= call!828 (+!35 (ite c!1979 lt!5269 lt!5283) (ite c!1979 (tuple2!795 lt!5265 (zeroValue!1597 (v!1470 (underlying!61 thiss!848)))) (tuple2!795 lt!5272 (minValue!1597 (v!1470 (underlying!61 thiss!848)))))))))

(declare-fun b!18749 () Bool)

(declare-fun lt!5278 () tuple2!790)

(assert (=> b!18749 (= lt!5278 call!830)))

(assert (=> b!18749 (= e!11995 (tuple2!791 (_1!396 lt!5278) (_2!396 lt!5278)))))

(declare-fun lt!5277 () (_ BitVec 32))

(declare-fun b!18750 () Bool)

(assert (=> b!18750 (= e!11994 (arrayContainsKey!0 (_keys!3086 (v!1470 (underlying!61 thiss!848))) lt!5264 lt!5277))))

(declare-fun b!18751 () Bool)

(assert (=> b!18751 (= c!1979 (bvsgt (bvsub (size!579 (_keys!3086 (v!1470 (underlying!61 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!18751 (= e!11996 e!12000)))

(declare-fun b!18752 () Bool)

(assert (=> b!18752 (= e!11998 (= (map!357 (_2!396 lt!5291)) (map!357 (v!1470 (underlying!61 thiss!848)))))))

(declare-fun b!18753 () Bool)

(assert (=> b!18753 (= e!11996 (tuple2!791 false (_2!396 lt!5273)))))

(declare-fun bm!828 () Bool)

(assert (=> bm!828 (= call!826 (+!35 (ite c!1979 lt!5270 lt!5295) (ite c!1979 (tuple2!795 lt!5274 (minValue!1597 (v!1470 (underlying!61 thiss!848)))) (tuple2!795 lt!5289 (zeroValue!1597 (v!1470 (underlying!61 thiss!848)))))))))

(declare-fun bm!829 () Bool)

(assert (=> bm!829 (= call!823 (addCommutativeForDiffKeys!2 (ite c!1979 lt!5270 lt!5295) lt!5264 lt!5290 (ite c!1979 lt!5274 lt!5289) (ite c!1979 (minValue!1597 (v!1470 (underlying!61 thiss!848))) (zeroValue!1597 (v!1470 (underlying!61 thiss!848))))))))

(declare-fun b!18754 () Bool)

(assert (=> b!18754 false))

(declare-fun lt!5276 () Unit!359)

(declare-fun lt!5287 () Unit!359)

(assert (=> b!18754 (= lt!5276 lt!5287)))

(declare-fun lt!5275 () (_ BitVec 32))

(assert (=> b!18754 (not (arrayContainsKey!0 (_keys!3086 (v!1470 (underlying!61 thiss!848))) lt!5264 lt!5275))))

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!1015 (_ BitVec 32) (_ BitVec 64) List!538) Unit!359)

(assert (=> b!18754 (= lt!5287 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3086 (v!1470 (underlying!61 thiss!848))) lt!5275 lt!5264 (Cons!534 lt!5264 Nil!535)))))

(assert (=> b!18754 (= lt!5275 (bvadd (bvsub (size!579 (_keys!3086 (v!1470 (underlying!61 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!5267 () Unit!359)

(declare-fun lt!5293 () Unit!359)

(assert (=> b!18754 (= lt!5267 lt!5293)))

(assert (=> b!18754 (arrayNoDuplicates!0 (_keys!3086 (v!1470 (underlying!61 thiss!848))) (bvsub (size!579 (_keys!3086 (v!1470 (underlying!61 thiss!848)))) #b00000000000000000000000000000001) Nil!535)))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!1015 (_ BitVec 32) (_ BitVec 32)) Unit!359)

(assert (=> b!18754 (= lt!5293 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3086 (v!1470 (underlying!61 thiss!848))) #b00000000000000000000000000000000 (bvsub (size!579 (_keys!3086 (v!1470 (underlying!61 thiss!848)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5271 () Unit!359)

(declare-fun lt!5285 () Unit!359)

(assert (=> b!18754 (= lt!5271 lt!5285)))

(assert (=> b!18754 e!11994))

(declare-fun c!1980 () Bool)

(assert (=> b!18754 (= c!1980 (and (not (= lt!5264 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!5264 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!2 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 64) (_ BitVec 32) Int) Unit!359)

(assert (=> b!18754 (= lt!5285 (lemmaListMapContainsThenArrayContainsFrom!2 (_keys!3086 (v!1470 (underlying!61 thiss!848))) (_values!1658 (v!1470 (underlying!61 thiss!848))) (mask!4594 (v!1470 (underlying!61 thiss!848))) (extraKeys!1574 (v!1470 (underlying!61 thiss!848))) (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 (v!1470 (underlying!61 thiss!848))) lt!5264 lt!5277 (defaultEntry!1661 (v!1470 (underlying!61 thiss!848)))))))

(assert (=> b!18754 (= lt!5277 (bvadd (bvsub (size!579 (_keys!3086 (v!1470 (underlying!61 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun Unit!379 () Unit!359)

(assert (=> b!18754 (= e!11999 Unit!379)))

(declare-fun b!18755 () Bool)

(assert (=> b!18755 (= e!11997 e!11995)))

(declare-fun c!1975 () Bool)

(assert (=> b!18755 (= c!1975 (bvsgt (bvsub (size!579 (_keys!3086 (v!1470 (underlying!61 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun d!3469 () Bool)

(assert (=> d!3469 e!11993))

(declare-fun res!12958 () Bool)

(assert (=> d!3469 (=> res!12958 e!11993)))

(assert (=> d!3469 (= res!12958 (not (_1!396 lt!5291)))))

(assert (=> d!3469 (= lt!5291 e!11997)))

(assert (=> d!3469 (= c!1978 (and (not (= lt!5264 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!5264 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3469 (= lt!5282 (map!357 (v!1470 (_2!406 lt!4765))))))

(assert (=> d!3469 (= lt!5290 (get!348 (select (arr!488 (_values!1658 (v!1470 (underlying!61 thiss!848)))) (bvsub (size!579 (_keys!3086 (v!1470 (underlying!61 thiss!848)))) #b00000000000000000000000000000001)) (dynLambda!132 (defaultEntry!1661 (v!1470 (underlying!61 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3469 (= lt!5264 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 thiss!848)))) (bvsub (size!579 (_keys!3086 (v!1470 (underlying!61 thiss!848)))) #b00000000000000000000000000000001)))))

(assert (=> d!3469 (valid!56 thiss!848)))

(assert (=> d!3469 (= (repackFrom!2 thiss!848 (v!1470 (_2!406 lt!4765)) (bvsub (size!579 (_keys!3086 (v!1470 (underlying!61 thiss!848)))) #b00000000000000000000000000000001)) lt!5291)))

(declare-fun b!18744 () Bool)

(declare-fun Unit!380 () Unit!359)

(assert (=> b!18744 (= e!11999 Unit!380)))

(assert (= (and d!3469 c!1978) b!18748))

(assert (= (and d!3469 (not c!1978)) b!18755))

(assert (= (and b!18748 c!1976) b!18754))

(assert (= (and b!18748 (not c!1976)) b!18744))

(assert (= (and b!18754 c!1980) b!18750))

(assert (= (and b!18754 (not c!1980)) b!18745))

(assert (= (and b!18748 c!1977) b!18751))

(assert (= (and b!18748 (not c!1977)) b!18753))

(assert (= (and b!18751 c!1979) b!18742))

(assert (= (and b!18751 (not c!1979)) b!18743))

(assert (= (or b!18742 b!18743) bm!829))

(assert (= (or b!18742 b!18743) bm!825))

(assert (= (or b!18742 b!18743) bm!823))

(assert (= (or b!18742 b!18743) bm!820))

(assert (= (or b!18742 b!18743) bm!828))

(assert (= (or b!18742 b!18743) bm!817))

(assert (= (or b!18742 b!18743) bm!827))

(assert (= (or b!18742 b!18743) bm!819))

(assert (= (or b!18742 b!18743) bm!824))

(assert (= (or b!18742 b!18743) bm!821))

(assert (= (or b!18742 b!18743) bm!818))

(assert (= (or b!18742 b!18743) bm!826))

(assert (= (and b!18755 c!1975) b!18749))

(assert (= (and b!18755 (not c!1975)) b!18747))

(assert (= (or b!18742 b!18749) bm!822))

(assert (= (and d!3469 (not res!12958)) b!18746))

(assert (= (and b!18746 res!12957) b!18752))

(declare-fun b_lambda!1445 () Bool)

(assert (=> (not b_lambda!1445) (not d!3469)))

(assert (=> d!3469 t!3173))

(declare-fun b_and!1307 () Bool)

(assert (= b_and!1305 (and (=> t!3173 result!1009) b_and!1307)))

(declare-fun m!13203 () Bool)

(assert (=> b!18748 m!13203))

(declare-fun m!13205 () Bool)

(assert (=> b!18748 m!13205))

(declare-fun m!13207 () Bool)

(assert (=> bm!823 m!13207))

(declare-fun m!13209 () Bool)

(assert (=> bm!824 m!13209))

(declare-fun m!13211 () Bool)

(assert (=> bm!825 m!13211))

(declare-fun m!13213 () Bool)

(assert (=> bm!827 m!13213))

(declare-fun m!13215 () Bool)

(assert (=> b!18750 m!13215))

(declare-fun m!13217 () Bool)

(assert (=> bm!821 m!13217))

(declare-fun m!13219 () Bool)

(assert (=> bm!826 m!13219))

(declare-fun m!13221 () Bool)

(assert (=> bm!818 m!13221))

(declare-fun m!13223 () Bool)

(assert (=> bm!820 m!13223))

(declare-fun m!13225 () Bool)

(assert (=> d!3469 m!13225))

(assert (=> d!3469 m!13013))

(declare-fun m!13227 () Bool)

(assert (=> d!3469 m!13227))

(declare-fun m!13229 () Bool)

(assert (=> d!3469 m!13229))

(assert (=> d!3469 m!13225))

(assert (=> d!3469 m!13013))

(assert (=> d!3469 m!12591))

(declare-fun m!13231 () Bool)

(assert (=> d!3469 m!13231))

(declare-fun m!13233 () Bool)

(assert (=> b!18754 m!13233))

(declare-fun m!13235 () Bool)

(assert (=> b!18754 m!13235))

(declare-fun m!13237 () Bool)

(assert (=> b!18754 m!13237))

(declare-fun m!13239 () Bool)

(assert (=> b!18754 m!13239))

(declare-fun m!13241 () Bool)

(assert (=> b!18754 m!13241))

(declare-fun m!13243 () Bool)

(assert (=> bm!822 m!13243))

(declare-fun m!13245 () Bool)

(assert (=> bm!829 m!13245))

(declare-fun m!13247 () Bool)

(assert (=> bm!828 m!13247))

(declare-fun m!13249 () Bool)

(assert (=> b!18746 m!13249))

(declare-fun m!13251 () Bool)

(assert (=> bm!817 m!13251))

(declare-fun m!13253 () Bool)

(assert (=> b!18752 m!13253))

(assert (=> b!18752 m!12683))

(declare-fun m!13255 () Bool)

(assert (=> bm!819 m!13255))

(assert (=> b!18248 d!3469))

(declare-fun d!3471 () Bool)

(declare-fun e!12002 () Bool)

(assert (=> d!3471 e!12002))

(declare-fun res!12959 () Bool)

(assert (=> d!3471 (=> res!12959 e!12002)))

(declare-fun lt!5299 () Bool)

(assert (=> d!3471 (= res!12959 (not lt!5299))))

(declare-fun lt!5296 () Bool)

(assert (=> d!3471 (= lt!5299 lt!5296)))

(declare-fun lt!5298 () Unit!359)

(declare-fun e!12001 () Unit!359)

(assert (=> d!3471 (= lt!5298 e!12001)))

(declare-fun c!1981 () Bool)

(assert (=> d!3471 (= c!1981 lt!5296)))

(assert (=> d!3471 (= lt!5296 (containsKey!22 (toList!282 lt!4725) (_1!398 (tuple2!795 key!682 v!259))))))

(assert (=> d!3471 (= (contains!214 lt!4725 (_1!398 (tuple2!795 key!682 v!259))) lt!5299)))

(declare-fun b!18756 () Bool)

(declare-fun lt!5297 () Unit!359)

(assert (=> b!18756 (= e!12001 lt!5297)))

(assert (=> b!18756 (= lt!5297 (lemmaContainsKeyImpliesGetValueByKeyDefined!19 (toList!282 lt!4725) (_1!398 (tuple2!795 key!682 v!259))))))

(assert (=> b!18756 (isDefined!20 (getValueByKey!58 (toList!282 lt!4725) (_1!398 (tuple2!795 key!682 v!259))))))

(declare-fun b!18757 () Bool)

(declare-fun Unit!381 () Unit!359)

(assert (=> b!18757 (= e!12001 Unit!381)))

(declare-fun b!18758 () Bool)

(assert (=> b!18758 (= e!12002 (isDefined!20 (getValueByKey!58 (toList!282 lt!4725) (_1!398 (tuple2!795 key!682 v!259)))))))

(assert (= (and d!3471 c!1981) b!18756))

(assert (= (and d!3471 (not c!1981)) b!18757))

(assert (= (and d!3471 (not res!12959)) b!18758))

(declare-fun m!13257 () Bool)

(assert (=> d!3471 m!13257))

(declare-fun m!13259 () Bool)

(assert (=> b!18756 m!13259))

(assert (=> b!18756 m!12657))

(assert (=> b!18756 m!12657))

(declare-fun m!13261 () Bool)

(assert (=> b!18756 m!13261))

(assert (=> b!18758 m!12657))

(assert (=> b!18758 m!12657))

(assert (=> b!18758 m!13261))

(assert (=> d!3383 d!3471))

(declare-fun b!18762 () Bool)

(declare-fun e!12004 () Option!64)

(assert (=> b!18762 (= e!12004 None!62)))

(declare-fun b!18760 () Bool)

(declare-fun e!12003 () Option!64)

(assert (=> b!18760 (= e!12003 e!12004)))

(declare-fun c!1983 () Bool)

(assert (=> b!18760 (= c!1983 (and ((_ is Cons!531) lt!4728) (not (= (_1!398 (h!1097 lt!4728)) (_1!398 (tuple2!795 key!682 v!259))))))))

(declare-fun b!18759 () Bool)

(assert (=> b!18759 (= e!12003 (Some!63 (_2!398 (h!1097 lt!4728))))))

(declare-fun d!3473 () Bool)

(declare-fun c!1982 () Bool)

(assert (=> d!3473 (= c!1982 (and ((_ is Cons!531) lt!4728) (= (_1!398 (h!1097 lt!4728)) (_1!398 (tuple2!795 key!682 v!259)))))))

(assert (=> d!3473 (= (getValueByKey!58 lt!4728 (_1!398 (tuple2!795 key!682 v!259))) e!12003)))

(declare-fun b!18761 () Bool)

(assert (=> b!18761 (= e!12004 (getValueByKey!58 (t!3167 lt!4728) (_1!398 (tuple2!795 key!682 v!259))))))

(assert (= (and d!3473 c!1982) b!18759))

(assert (= (and d!3473 (not c!1982)) b!18760))

(assert (= (and b!18760 c!1983) b!18761))

(assert (= (and b!18760 (not c!1983)) b!18762))

(declare-fun m!13263 () Bool)

(assert (=> b!18761 m!13263))

(assert (=> d!3383 d!3473))

(declare-fun d!3475 () Bool)

(assert (=> d!3475 (= (getValueByKey!58 lt!4728 (_1!398 (tuple2!795 key!682 v!259))) (Some!63 (_2!398 (tuple2!795 key!682 v!259))))))

(declare-fun lt!5302 () Unit!359)

(declare-fun choose!190 (List!535 (_ BitVec 64) V!1043) Unit!359)

(assert (=> d!3475 (= lt!5302 (choose!190 lt!4728 (_1!398 (tuple2!795 key!682 v!259)) (_2!398 (tuple2!795 key!682 v!259))))))

(declare-fun e!12007 () Bool)

(assert (=> d!3475 e!12007))

(declare-fun res!12964 () Bool)

(assert (=> d!3475 (=> (not res!12964) (not e!12007))))

(assert (=> d!3475 (= res!12964 (isStrictlySorted!164 lt!4728))))

(assert (=> d!3475 (= (lemmaContainsTupThenGetReturnValue!16 lt!4728 (_1!398 (tuple2!795 key!682 v!259)) (_2!398 (tuple2!795 key!682 v!259))) lt!5302)))

(declare-fun b!18767 () Bool)

(declare-fun res!12965 () Bool)

(assert (=> b!18767 (=> (not res!12965) (not e!12007))))

(assert (=> b!18767 (= res!12965 (containsKey!22 lt!4728 (_1!398 (tuple2!795 key!682 v!259))))))

(declare-fun b!18768 () Bool)

(assert (=> b!18768 (= e!12007 (contains!217 lt!4728 (tuple2!795 (_1!398 (tuple2!795 key!682 v!259)) (_2!398 (tuple2!795 key!682 v!259)))))))

(assert (= (and d!3475 res!12964) b!18767))

(assert (= (and b!18767 res!12965) b!18768))

(assert (=> d!3475 m!12651))

(declare-fun m!13265 () Bool)

(assert (=> d!3475 m!13265))

(declare-fun m!13267 () Bool)

(assert (=> d!3475 m!13267))

(declare-fun m!13269 () Bool)

(assert (=> b!18767 m!13269))

(declare-fun m!13271 () Bool)

(assert (=> b!18768 m!13271))

(assert (=> d!3383 d!3475))

(declare-fun c!1992 () Bool)

(declare-fun b!18789 () Bool)

(assert (=> b!18789 (= c!1992 (and ((_ is Cons!531) (toList!282 call!619)) (bvsgt (_1!398 (h!1097 (toList!282 call!619))) (_1!398 (tuple2!795 key!682 v!259)))))))

(declare-fun e!12018 () List!535)

(declare-fun e!12019 () List!535)

(assert (=> b!18789 (= e!12018 e!12019)))

(declare-fun bm!836 () Bool)

(declare-fun call!839 () List!535)

(declare-fun call!841 () List!535)

(assert (=> bm!836 (= call!839 call!841)))

(declare-fun b!18790 () Bool)

(declare-fun e!12021 () List!535)

(assert (=> b!18790 (= e!12021 e!12018)))

(declare-fun c!1995 () Bool)

(assert (=> b!18790 (= c!1995 (and ((_ is Cons!531) (toList!282 call!619)) (= (_1!398 (h!1097 (toList!282 call!619))) (_1!398 (tuple2!795 key!682 v!259)))))))

(declare-fun b!18791 () Bool)

(declare-fun e!12020 () Bool)

(declare-fun lt!5305 () List!535)

(assert (=> b!18791 (= e!12020 (contains!217 lt!5305 (tuple2!795 (_1!398 (tuple2!795 key!682 v!259)) (_2!398 (tuple2!795 key!682 v!259)))))))

(declare-fun c!1993 () Bool)

(declare-fun e!12022 () List!535)

(declare-fun bm!837 () Bool)

(declare-fun $colon$colon!29 (List!535 tuple2!794) List!535)

(assert (=> bm!837 (= call!841 ($colon$colon!29 e!12022 (ite c!1993 (h!1097 (toList!282 call!619)) (tuple2!795 (_1!398 (tuple2!795 key!682 v!259)) (_2!398 (tuple2!795 key!682 v!259))))))))

(declare-fun c!1994 () Bool)

(assert (=> bm!837 (= c!1994 c!1993)))

(declare-fun b!18793 () Bool)

(assert (=> b!18793 (= e!12018 call!839)))

(declare-fun b!18794 () Bool)

(assert (=> b!18794 (= e!12022 (insertStrictlySorted!16 (t!3167 (toList!282 call!619)) (_1!398 (tuple2!795 key!682 v!259)) (_2!398 (tuple2!795 key!682 v!259))))))

(declare-fun b!18795 () Bool)

(assert (=> b!18795 (= e!12022 (ite c!1995 (t!3167 (toList!282 call!619)) (ite c!1992 (Cons!531 (h!1097 (toList!282 call!619)) (t!3167 (toList!282 call!619))) Nil!532)))))

(declare-fun b!18796 () Bool)

(assert (=> b!18796 (= e!12021 call!841)))

(declare-fun b!18797 () Bool)

(declare-fun res!12970 () Bool)

(assert (=> b!18797 (=> (not res!12970) (not e!12020))))

(assert (=> b!18797 (= res!12970 (containsKey!22 lt!5305 (_1!398 (tuple2!795 key!682 v!259))))))

(declare-fun b!18792 () Bool)

(declare-fun call!840 () List!535)

(assert (=> b!18792 (= e!12019 call!840)))

(declare-fun d!3477 () Bool)

(assert (=> d!3477 e!12020))

(declare-fun res!12971 () Bool)

(assert (=> d!3477 (=> (not res!12971) (not e!12020))))

(assert (=> d!3477 (= res!12971 (isStrictlySorted!164 lt!5305))))

(assert (=> d!3477 (= lt!5305 e!12021)))

(assert (=> d!3477 (= c!1993 (and ((_ is Cons!531) (toList!282 call!619)) (bvslt (_1!398 (h!1097 (toList!282 call!619))) (_1!398 (tuple2!795 key!682 v!259)))))))

(assert (=> d!3477 (isStrictlySorted!164 (toList!282 call!619))))

(assert (=> d!3477 (= (insertStrictlySorted!16 (toList!282 call!619) (_1!398 (tuple2!795 key!682 v!259)) (_2!398 (tuple2!795 key!682 v!259))) lt!5305)))

(declare-fun b!18798 () Bool)

(assert (=> b!18798 (= e!12019 call!840)))

(declare-fun bm!838 () Bool)

(assert (=> bm!838 (= call!840 call!839)))

(assert (= (and d!3477 c!1993) b!18796))

(assert (= (and d!3477 (not c!1993)) b!18790))

(assert (= (and b!18790 c!1995) b!18793))

(assert (= (and b!18790 (not c!1995)) b!18789))

(assert (= (and b!18789 c!1992) b!18792))

(assert (= (and b!18789 (not c!1992)) b!18798))

(assert (= (or b!18792 b!18798) bm!838))

(assert (= (or b!18793 bm!838) bm!836))

(assert (= (or b!18796 bm!836) bm!837))

(assert (= (and bm!837 c!1994) b!18794))

(assert (= (and bm!837 (not c!1994)) b!18795))

(assert (= (and d!3477 res!12971) b!18797))

(assert (= (and b!18797 res!12970) b!18791))

(declare-fun m!13273 () Bool)

(assert (=> d!3477 m!13273))

(declare-fun m!13275 () Bool)

(assert (=> d!3477 m!13275))

(declare-fun m!13277 () Bool)

(assert (=> b!18797 m!13277))

(declare-fun m!13279 () Bool)

(assert (=> b!18791 m!13279))

(declare-fun m!13281 () Bool)

(assert (=> b!18794 m!13281))

(declare-fun m!13283 () Bool)

(assert (=> bm!837 m!13283))

(assert (=> d!3383 d!3477))

(declare-fun d!3479 () Bool)

(declare-fun e!12024 () Bool)

(assert (=> d!3479 e!12024))

(declare-fun res!12972 () Bool)

(assert (=> d!3479 (=> res!12972 e!12024)))

(declare-fun lt!5309 () Bool)

(assert (=> d!3479 (= res!12972 (not lt!5309))))

(declare-fun lt!5306 () Bool)

(assert (=> d!3479 (= lt!5309 lt!5306)))

(declare-fun lt!5308 () Unit!359)

(declare-fun e!12023 () Unit!359)

(assert (=> d!3479 (= lt!5308 e!12023)))

(declare-fun c!1996 () Bool)

(assert (=> d!3479 (= c!1996 lt!5306)))

(assert (=> d!3479 (= lt!5306 (containsKey!22 (toList!282 call!695) (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4838))))))

(assert (=> d!3479 (= (contains!214 call!695 (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4838))) lt!5309)))

(declare-fun b!18799 () Bool)

(declare-fun lt!5307 () Unit!359)

(assert (=> b!18799 (= e!12023 lt!5307)))

(assert (=> b!18799 (= lt!5307 (lemmaContainsKeyImpliesGetValueByKeyDefined!19 (toList!282 call!695) (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4838))))))

(assert (=> b!18799 (isDefined!20 (getValueByKey!58 (toList!282 call!695) (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4838))))))

(declare-fun b!18800 () Bool)

(declare-fun Unit!382 () Unit!359)

(assert (=> b!18800 (= e!12023 Unit!382)))

(declare-fun b!18801 () Bool)

(assert (=> b!18801 (= e!12024 (isDefined!20 (getValueByKey!58 (toList!282 call!695) (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4838)))))))

(assert (= (and d!3479 c!1996) b!18799))

(assert (= (and d!3479 (not c!1996)) b!18800))

(assert (= (and d!3479 (not res!12972)) b!18801))

(assert (=> d!3479 m!12723))

(declare-fun m!13285 () Bool)

(assert (=> d!3479 m!13285))

(assert (=> b!18799 m!12723))

(declare-fun m!13287 () Bool)

(assert (=> b!18799 m!13287))

(assert (=> b!18799 m!12723))

(declare-fun m!13289 () Bool)

(assert (=> b!18799 m!13289))

(assert (=> b!18799 m!13289))

(declare-fun m!13291 () Bool)

(assert (=> b!18799 m!13291))

(assert (=> b!18801 m!12723))

(assert (=> b!18801 m!13289))

(assert (=> b!18801 m!13289))

(assert (=> b!18801 m!13291))

(assert (=> b!18344 d!3479))

(declare-fun d!3481 () Bool)

(declare-fun e!12027 () Bool)

(assert (=> d!3481 e!12027))

(declare-fun res!12975 () Bool)

(assert (=> d!3481 (=> (not res!12975) (not e!12027))))

(assert (=> d!3481 (= res!12975 (and (bvsge (index!2296 lt!4838) #b00000000000000000000000000000000) (bvslt (index!2296 lt!4838) (size!579 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))))))))

(declare-fun lt!5312 () Unit!359)

(declare-fun choose!191 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 32) Int) Unit!359)

(assert (=> d!3481 (= lt!5312 (choose!191 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4845 (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (index!2296 lt!4838) (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(assert (=> d!3481 (validMask!0 (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))))))

(assert (=> d!3481 (= (lemmaValidKeyInArrayIsInListMap!2 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4845 (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (index!2296 lt!4838) (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))) lt!5312)))

(declare-fun b!18804 () Bool)

(assert (=> b!18804 (= e!12027 (contains!214 (getCurrentListMap!119 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4845 (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))) (select (arr!489 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4838))))))

(assert (= (and d!3481 res!12975) b!18804))

(declare-fun m!13293 () Bool)

(assert (=> d!3481 m!13293))

(assert (=> d!3481 m!12777))

(declare-fun m!13295 () Bool)

(assert (=> b!18804 m!13295))

(assert (=> b!18804 m!12723))

(assert (=> b!18804 m!13295))

(assert (=> b!18804 m!12723))

(declare-fun m!13297 () Bool)

(assert (=> b!18804 m!13297))

(assert (=> b!18344 d!3481))

(declare-fun d!3483 () Bool)

(declare-fun e!12030 () Bool)

(assert (=> d!3483 e!12030))

(declare-fun res!12978 () Bool)

(assert (=> d!3483 (=> (not res!12978) (not e!12030))))

(assert (=> d!3483 (= res!12978 (and (bvsge (index!2296 lt!4838) #b00000000000000000000000000000000) (bvslt (index!2296 lt!4838) (size!578 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))))))))

(declare-fun lt!5315 () Unit!359)

(declare-fun choose!192 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 32) (_ BitVec 64) V!1043 Int) Unit!359)

(assert (=> d!3483 (= lt!5315 (choose!192 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (index!2296 lt!4838) key!682 v!259 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(assert (=> d!3483 (validMask!0 (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))))))

(assert (=> d!3483 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!2 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (index!2296 lt!4838) key!682 v!259 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))) lt!5315)))

(declare-fun b!18807 () Bool)

(assert (=> b!18807 (= e!12030 (= (+!35 (getCurrentListMap!119 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))) (tuple2!795 key!682 v!259)) (getCurrentListMap!119 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (array!1014 (store (arr!488 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692))))) (index!2296 lt!4838) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692)))))))))

(assert (= (and d!3483 res!12978) b!18807))

(declare-fun m!13299 () Bool)

(assert (=> d!3483 m!13299))

(assert (=> d!3483 m!12777))

(assert (=> b!18807 m!12743))

(assert (=> b!18807 m!12743))

(assert (=> b!18807 m!13091))

(assert (=> b!18807 m!12729))

(declare-fun m!13301 () Bool)

(assert (=> b!18807 m!13301))

(assert (=> b!18344 d!3483))

(declare-fun d!3485 () Bool)

(assert (=> d!3485 (= (+!35 (getCurrentListMap!119 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))) (tuple2!795 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (getCurrentListMap!119 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4846 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259 #b00000000000000000000000000000000 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(declare-fun lt!5318 () Unit!359)

(declare-fun choose!193 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 V!1043 Int) Unit!359)

(assert (=> d!3485 (= lt!5318 (choose!193 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4846 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))))))

(assert (=> d!3485 (validMask!0 (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))))))

(assert (=> d!3485 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!2 (_keys!3086 (v!1470 (underlying!61 (_2!397 lt!4692)))) (_values!1658 (v!1470 (underlying!61 (_2!397 lt!4692)))) (mask!4594 (v!1470 (underlying!61 (_2!397 lt!4692)))) (extraKeys!1574 (v!1470 (underlying!61 (_2!397 lt!4692)))) lt!4846 (zeroValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) (minValue!1597 (v!1470 (underlying!61 (_2!397 lt!4692)))) v!259 (defaultEntry!1661 (v!1470 (underlying!61 (_2!397 lt!4692))))) lt!5318)))

(declare-fun bs!849 () Bool)

(assert (= bs!849 d!3485))

(assert (=> bs!849 m!12743))

(declare-fun m!13303 () Bool)

(assert (=> bs!849 m!13303))

(declare-fun m!13305 () Bool)

(assert (=> bs!849 m!13305))

(assert (=> bs!849 m!12743))

(declare-fun m!13307 () Bool)

(assert (=> bs!849 m!13307))

(assert (=> bs!849 m!12777))

(assert (=> b!18341 d!3485))

(declare-fun b!18808 () Bool)

(declare-fun e!12034 () tuple2!790)

(declare-fun e!12042 () tuple2!790)

(assert (=> b!18808 (= e!12034 e!12042)))

(declare-fun c!2001 () Bool)

(assert (=> b!18808 (= c!2001 (= (ite c!1835 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1837 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18809 () Bool)

(declare-fun c!1999 () Bool)

(declare-fun lt!5330 () SeekEntryResult!44)

(assert (=> b!18809 (= c!1999 ((_ is MissingVacant!44) lt!5330))))

(declare-fun e!12033 () Bool)

(declare-fun e!12037 () Bool)

(assert (=> b!18809 (= e!12033 e!12037)))

(declare-fun b!18810 () Bool)

(declare-fun lt!5344 () Unit!359)

(declare-fun lt!5342 () Unit!359)

(assert (=> b!18810 (= lt!5344 lt!5342)))

(declare-fun call!863 () ListLongMap!533)

(declare-fun call!850 () ListLongMap!533)

(assert (=> b!18810 (= call!863 call!850)))

(declare-fun lt!5320 () (_ BitVec 32))

(assert (=> b!18810 (= lt!5342 (lemmaChangeZeroKeyThenAddPairToListMap!2 (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641)) (_values!1658 (ite c!1835 (_2!396 lt!4762) call!641)) (mask!4594 (ite c!1835 (_2!396 lt!4762) call!641)) (extraKeys!1574 (ite c!1835 (_2!396 lt!4762) call!641)) lt!5320 (zeroValue!1597 (ite c!1835 (_2!396 lt!4762) call!641)) (ite c!1835 (minValue!1597 (v!1470 (underlying!61 thiss!848))) (ite c!1837 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 (v!1470 (underlying!61 thiss!848))))) (minValue!1597 (ite c!1835 (_2!396 lt!4762) call!641)) (defaultEntry!1661 (ite c!1835 (_2!396 lt!4762) call!641))))))

(assert (=> b!18810 (= lt!5320 (bvor (extraKeys!1574 (ite c!1835 (_2!396 lt!4762) call!641)) #b00000000000000000000000000000001))))

(assert (=> b!18810 (= e!12042 (tuple2!791 true (LongMapFixedSize!101 (defaultEntry!1661 (ite c!1835 (_2!396 lt!4762) call!641)) (mask!4594 (ite c!1835 (_2!396 lt!4762) call!641)) (bvor (extraKeys!1574 (ite c!1835 (_2!396 lt!4762) call!641)) #b00000000000000000000000000000001) (ite c!1835 (minValue!1597 (v!1470 (underlying!61 thiss!848))) (ite c!1837 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 (v!1470 (underlying!61 thiss!848))))) (minValue!1597 (ite c!1835 (_2!396 lt!4762) call!641)) (_size!82 (ite c!1835 (_2!396 lt!4762) call!641)) (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641)) (_values!1658 (ite c!1835 (_2!396 lt!4762) call!641)) (_vacant!82 (ite c!1835 (_2!396 lt!4762) call!641)))))))

(declare-fun b!18811 () Bool)

(declare-fun e!12031 () Unit!359)

(declare-fun Unit!383 () Unit!359)

(assert (=> b!18811 (= e!12031 Unit!383)))

(declare-fun lt!5333 () Unit!359)

(declare-fun call!855 () Unit!359)

(assert (=> b!18811 (= lt!5333 call!855)))

(declare-fun call!864 () SeekEntryResult!44)

(assert (=> b!18811 (= lt!5330 call!864)))

(declare-fun c!2008 () Bool)

(assert (=> b!18811 (= c!2008 ((_ is MissingZero!44) lt!5330))))

(assert (=> b!18811 e!12033))

(declare-fun lt!5324 () Unit!359)

(assert (=> b!18811 (= lt!5324 lt!5333)))

(assert (=> b!18811 false))

(declare-fun b!18812 () Bool)

(declare-fun e!12039 () Unit!359)

(declare-fun Unit!384 () Unit!359)

(assert (=> b!18812 (= e!12039 Unit!384)))

(declare-fun lt!5325 () Unit!359)

(declare-fun call!843 () Unit!359)

(assert (=> b!18812 (= lt!5325 call!843)))

(declare-fun lt!5341 () SeekEntryResult!44)

(declare-fun call!842 () SeekEntryResult!44)

(assert (=> b!18812 (= lt!5341 call!842)))

(declare-fun res!12991 () Bool)

(assert (=> b!18812 (= res!12991 ((_ is Found!44) lt!5341))))

(declare-fun e!12035 () Bool)

(assert (=> b!18812 (=> (not res!12991) (not e!12035))))

(assert (=> b!18812 e!12035))

(declare-fun lt!5337 () Unit!359)

(assert (=> b!18812 (= lt!5337 lt!5325)))

(assert (=> b!18812 false))

(declare-fun lt!5329 () SeekEntryResult!44)

(declare-fun b!18813 () Bool)

(declare-fun res!12983 () Bool)

(assert (=> b!18813 (= res!12983 (= (select (arr!489 (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641))) (index!2298 lt!5329)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!12044 () Bool)

(assert (=> b!18813 (=> (not res!12983) (not e!12044))))

(declare-fun b!18814 () Bool)

(declare-fun res!12981 () Bool)

(declare-fun e!12043 () Bool)

(assert (=> b!18814 (=> (not res!12981) (not e!12043))))

(declare-fun call!846 () Bool)

(assert (=> b!18814 (= res!12981 call!846)))

(assert (=> b!18814 (= e!12033 e!12043)))

(declare-fun b!18815 () Bool)

(declare-fun res!12979 () Bool)

(assert (=> b!18815 (=> (not res!12979) (not e!12043))))

(assert (=> b!18815 (= res!12979 (= (select (arr!489 (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641))) (index!2295 lt!5330)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18816 () Bool)

(declare-fun call!849 () ListLongMap!533)

(declare-fun e!12046 () Bool)

(declare-fun call!848 () ListLongMap!533)

(assert (=> b!18816 (= e!12046 (= call!849 (+!35 call!848 (tuple2!795 (ite c!1835 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1837 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1835 (minValue!1597 (v!1470 (underlying!61 thiss!848))) (ite c!1837 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 (v!1470 (underlying!61 thiss!848)))))))))))

(declare-fun b!18817 () Bool)

(declare-fun lt!5338 () Unit!359)

(declare-fun lt!5323 () Unit!359)

(assert (=> b!18817 (= lt!5338 lt!5323)))

(declare-fun call!860 () ListLongMap!533)

(assert (=> b!18817 (= call!863 call!860)))

(declare-fun lt!5340 () (_ BitVec 32))

(assert (=> b!18817 (= lt!5323 (lemmaChangeLongMinValueKeyThenAddPairToListMap!2 (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641)) (_values!1658 (ite c!1835 (_2!396 lt!4762) call!641)) (mask!4594 (ite c!1835 (_2!396 lt!4762) call!641)) (extraKeys!1574 (ite c!1835 (_2!396 lt!4762) call!641)) lt!5340 (zeroValue!1597 (ite c!1835 (_2!396 lt!4762) call!641)) (minValue!1597 (ite c!1835 (_2!396 lt!4762) call!641)) (ite c!1835 (minValue!1597 (v!1470 (underlying!61 thiss!848))) (ite c!1837 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 (v!1470 (underlying!61 thiss!848))))) (defaultEntry!1661 (ite c!1835 (_2!396 lt!4762) call!641))))))

(assert (=> b!18817 (= lt!5340 (bvor (extraKeys!1574 (ite c!1835 (_2!396 lt!4762) call!641)) #b00000000000000000000000000000010))))

(assert (=> b!18817 (= e!12042 (tuple2!791 true (LongMapFixedSize!101 (defaultEntry!1661 (ite c!1835 (_2!396 lt!4762) call!641)) (mask!4594 (ite c!1835 (_2!396 lt!4762) call!641)) (bvor (extraKeys!1574 (ite c!1835 (_2!396 lt!4762) call!641)) #b00000000000000000000000000000010) (zeroValue!1597 (ite c!1835 (_2!396 lt!4762) call!641)) (ite c!1835 (minValue!1597 (v!1470 (underlying!61 thiss!848))) (ite c!1837 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 (v!1470 (underlying!61 thiss!848))))) (_size!82 (ite c!1835 (_2!396 lt!4762) call!641)) (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641)) (_values!1658 (ite c!1835 (_2!396 lt!4762) call!641)) (_vacant!82 (ite c!1835 (_2!396 lt!4762) call!641)))))))

(declare-fun b!18818 () Bool)

(declare-fun call!847 () Bool)

(assert (=> b!18818 (= e!12044 (not call!847))))

(declare-fun call!858 () Bool)

(declare-fun bm!839 () Bool)

(declare-fun call!861 () ListLongMap!533)

(assert (=> bm!839 (= call!858 (contains!214 call!861 (ite c!1835 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1837 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!18819 () Bool)

(declare-fun res!12992 () Bool)

(declare-fun call!853 () Bool)

(assert (=> b!18819 (= res!12992 call!853)))

(declare-fun e!12050 () Bool)

(assert (=> b!18819 (=> (not res!12992) (not e!12050))))

(declare-fun b!18820 () Bool)

(declare-fun lt!5326 () Unit!359)

(declare-fun lt!5319 () Unit!359)

(assert (=> b!18820 (= lt!5326 lt!5319)))

(declare-fun lt!5332 () SeekEntryResult!44)

(declare-fun call!844 () ListLongMap!533)

(assert (=> b!18820 (contains!214 call!844 (select (arr!489 (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641))) (index!2296 lt!5332)))))

(declare-fun lt!5339 () array!1013)

(assert (=> b!18820 (= lt!5319 (lemmaValidKeyInArrayIsInListMap!2 (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641)) lt!5339 (mask!4594 (ite c!1835 (_2!396 lt!4762) call!641)) (extraKeys!1574 (ite c!1835 (_2!396 lt!4762) call!641)) (zeroValue!1597 (ite c!1835 (_2!396 lt!4762) call!641)) (minValue!1597 (ite c!1835 (_2!396 lt!4762) call!641)) (index!2296 lt!5332) (defaultEntry!1661 (ite c!1835 (_2!396 lt!4762) call!641))))))

(assert (=> b!18820 (= lt!5339 (array!1014 (store (arr!488 (_values!1658 (ite c!1835 (_2!396 lt!4762) call!641))) (index!2296 lt!5332) (ValueCellFull!257 (ite c!1835 (minValue!1597 (v!1470 (underlying!61 thiss!848))) (ite c!1837 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 (v!1470 (underlying!61 thiss!848))))))) (size!578 (_values!1658 (ite c!1835 (_2!396 lt!4762) call!641)))))))

(declare-fun lt!5328 () Unit!359)

(declare-fun lt!5345 () Unit!359)

(assert (=> b!18820 (= lt!5328 lt!5345)))

(declare-fun call!857 () ListLongMap!533)

(declare-fun call!845 () ListLongMap!533)

(assert (=> b!18820 (= call!857 call!845)))

(assert (=> b!18820 (= lt!5345 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!2 (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641)) (_values!1658 (ite c!1835 (_2!396 lt!4762) call!641)) (mask!4594 (ite c!1835 (_2!396 lt!4762) call!641)) (extraKeys!1574 (ite c!1835 (_2!396 lt!4762) call!641)) (zeroValue!1597 (ite c!1835 (_2!396 lt!4762) call!641)) (minValue!1597 (ite c!1835 (_2!396 lt!4762) call!641)) (index!2296 lt!5332) (ite c!1835 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1837 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1835 (minValue!1597 (v!1470 (underlying!61 thiss!848))) (ite c!1837 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 (v!1470 (underlying!61 thiss!848))))) (defaultEntry!1661 (ite c!1835 (_2!396 lt!4762) call!641))))))

(declare-fun lt!5343 () Unit!359)

(assert (=> b!18820 (= lt!5343 e!12031)))

(declare-fun c!2005 () Bool)

(assert (=> b!18820 (= c!2005 call!858)))

(declare-fun e!12038 () tuple2!790)

(assert (=> b!18820 (= e!12038 (tuple2!791 true (LongMapFixedSize!101 (defaultEntry!1661 (ite c!1835 (_2!396 lt!4762) call!641)) (mask!4594 (ite c!1835 (_2!396 lt!4762) call!641)) (extraKeys!1574 (ite c!1835 (_2!396 lt!4762) call!641)) (zeroValue!1597 (ite c!1835 (_2!396 lt!4762) call!641)) (minValue!1597 (ite c!1835 (_2!396 lt!4762) call!641)) (_size!82 (ite c!1835 (_2!396 lt!4762) call!641)) (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641)) (array!1014 (store (arr!488 (_values!1658 (ite c!1835 (_2!396 lt!4762) call!641))) (index!2296 lt!5332) (ValueCellFull!257 (ite c!1835 (minValue!1597 (v!1470 (underlying!61 thiss!848))) (ite c!1837 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 (v!1470 (underlying!61 thiss!848))))))) (size!578 (_values!1658 (ite c!1835 (_2!396 lt!4762) call!641)))) (_vacant!82 (ite c!1835 (_2!396 lt!4762) call!641)))))))

(declare-fun bm!840 () Bool)

(assert (=> bm!840 (= call!861 (getCurrentListMap!119 (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641)) (_values!1658 (ite c!1835 (_2!396 lt!4762) call!641)) (mask!4594 (ite c!1835 (_2!396 lt!4762) call!641)) (extraKeys!1574 (ite c!1835 (_2!396 lt!4762) call!641)) (zeroValue!1597 (ite c!1835 (_2!396 lt!4762) call!641)) (minValue!1597 (ite c!1835 (_2!396 lt!4762) call!641)) #b00000000000000000000000000000000 (defaultEntry!1661 (ite c!1835 (_2!396 lt!4762) call!641))))))

(declare-fun b!18821 () Bool)

(declare-fun res!12986 () Bool)

(assert (=> b!18821 (= res!12986 (= (select (arr!489 (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641))) (index!2298 lt!5330)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!12047 () Bool)

(assert (=> b!18821 (=> (not res!12986) (not e!12047))))

(declare-fun b!18822 () Bool)

(declare-fun e!12041 () Bool)

(assert (=> b!18822 (= e!12041 ((_ is Undefined!44) lt!5329))))

(declare-fun bm!841 () Bool)

(declare-fun call!859 () SeekEntryResult!44)

(assert (=> bm!841 (= call!859 (seekEntryOrOpen!0 (ite c!1835 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1837 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641)) (mask!4594 (ite c!1835 (_2!396 lt!4762) call!641))))))

(declare-fun b!18823 () Bool)

(assert (=> b!18823 (= e!12041 e!12044)))

(declare-fun res!12987 () Bool)

(declare-fun call!865 () Bool)

(assert (=> b!18823 (= res!12987 call!865)))

(assert (=> b!18823 (=> (not res!12987) (not e!12044))))

(declare-fun b!18824 () Bool)

(declare-fun lt!5331 () Unit!359)

(assert (=> b!18824 (= e!12039 lt!5331)))

(assert (=> b!18824 (= lt!5331 call!855)))

(assert (=> b!18824 (= lt!5329 call!842)))

(declare-fun c!2007 () Bool)

(assert (=> b!18824 (= c!2007 ((_ is MissingZero!44) lt!5329))))

(declare-fun e!12040 () Bool)

(assert (=> b!18824 e!12040))

(declare-fun b!18825 () Bool)

(declare-fun e!12036 () tuple2!790)

(declare-fun lt!5334 () tuple2!790)

(assert (=> b!18825 (= e!12036 (tuple2!791 (_1!396 lt!5334) (_2!396 lt!5334)))))

(declare-fun call!854 () tuple2!790)

(assert (=> b!18825 (= lt!5334 call!854)))

(declare-fun bm!842 () Bool)

(declare-fun call!852 () Bool)

(declare-fun call!862 () Bool)

(assert (=> bm!842 (= call!852 call!862)))

(declare-fun b!18826 () Bool)

(assert (=> b!18826 (= e!12037 ((_ is Undefined!44) lt!5330))))

(declare-fun b!18827 () Bool)

(declare-fun c!1998 () Bool)

(assert (=> b!18827 (= c!1998 ((_ is MissingVacant!44) lt!5332))))

(declare-fun e!12045 () tuple2!790)

(assert (=> b!18827 (= e!12045 e!12036)))

(declare-fun bm!843 () Bool)

(declare-fun call!856 () Bool)

(assert (=> bm!843 (= call!856 (arrayContainsKey!0 (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641)) (ite c!1835 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1837 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(declare-fun c!2003 () Bool)

(declare-fun lt!5322 () SeekEntryResult!44)

(declare-fun c!2004 () Bool)

(declare-fun bm!844 () Bool)

(assert (=> bm!844 (= call!862 (inRange!0 (ite c!2004 (ite c!2003 (index!2296 lt!5341) (ite c!2007 (index!2295 lt!5329) (index!2298 lt!5329))) (ite c!2005 (index!2296 lt!5322) (ite c!2008 (index!2295 lt!5330) (index!2298 lt!5330)))) (mask!4594 (ite c!1835 (_2!396 lt!4762) call!641))))))

(declare-fun bm!845 () Bool)

(assert (=> bm!845 (= call!854 (updateHelperNewKey!2 (ite c!1835 (_2!396 lt!4762) call!641) (ite c!1835 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1837 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1835 (minValue!1597 (v!1470 (underlying!61 thiss!848))) (ite c!1837 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 (v!1470 (underlying!61 thiss!848))))) (ite c!1998 (index!2298 lt!5332) (index!2295 lt!5332))))))

(declare-fun b!18828 () Bool)

(declare-fun res!12990 () Bool)

(declare-fun e!12049 () Bool)

(assert (=> b!18828 (=> (not res!12990) (not e!12049))))

(assert (=> b!18828 (= res!12990 call!865)))

(assert (=> b!18828 (= e!12040 e!12049)))

(declare-fun bm!846 () Bool)

(assert (=> bm!846 (= call!843 (lemmaInListMapThenSeekEntryOrOpenFindsIt!2 (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641)) (_values!1658 (ite c!1835 (_2!396 lt!4762) call!641)) (mask!4594 (ite c!1835 (_2!396 lt!4762) call!641)) (extraKeys!1574 (ite c!1835 (_2!396 lt!4762) call!641)) (zeroValue!1597 (ite c!1835 (_2!396 lt!4762) call!641)) (minValue!1597 (ite c!1835 (_2!396 lt!4762) call!641)) (ite c!1835 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1837 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1661 (ite c!1835 (_2!396 lt!4762) call!641))))))

(declare-fun bm!847 () Bool)

(assert (=> bm!847 (= call!864 call!859)))

(declare-fun b!18829 () Bool)

(declare-fun lt!5327 () tuple2!790)

(assert (=> b!18829 (= lt!5327 call!854)))

(assert (=> b!18829 (= e!12038 (tuple2!791 (_1!396 lt!5327) (_2!396 lt!5327)))))

(declare-fun b!18830 () Bool)

(declare-fun c!2006 () Bool)

(assert (=> b!18830 (= c!2006 ((_ is MissingVacant!44) lt!5329))))

(assert (=> b!18830 (= e!12040 e!12041)))

(declare-fun bm!848 () Bool)

(assert (=> bm!848 (= call!850 call!844)))

(declare-fun bm!849 () Bool)

(assert (=> bm!849 (= call!848 (map!357 (ite c!1835 (_2!396 lt!4762) call!641)))))

(declare-fun bm!850 () Bool)

(assert (=> bm!850 (= call!853 call!862)))

(declare-fun b!18831 () Bool)

(assert (=> b!18831 (= e!12036 e!12038)))

(declare-fun c!1997 () Bool)

(assert (=> b!18831 (= c!1997 ((_ is MissingZero!44) lt!5332))))

(declare-fun bm!851 () Bool)

(declare-fun c!2002 () Bool)

(assert (=> bm!851 (= call!844 (getCurrentListMap!119 (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641)) (ite c!2002 (_values!1658 (ite c!1835 (_2!396 lt!4762) call!641)) lt!5339) (mask!4594 (ite c!1835 (_2!396 lt!4762) call!641)) (ite (and c!2002 c!2001) lt!5320 (extraKeys!1574 (ite c!1835 (_2!396 lt!4762) call!641))) (ite (and c!2002 c!2001) (ite c!1835 (minValue!1597 (v!1470 (underlying!61 thiss!848))) (ite c!1837 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 (v!1470 (underlying!61 thiss!848))))) (zeroValue!1597 (ite c!1835 (_2!396 lt!4762) call!641))) (minValue!1597 (ite c!1835 (_2!396 lt!4762) call!641)) #b00000000000000000000000000000000 (defaultEntry!1661 (ite c!1835 (_2!396 lt!4762) call!641))))))

(declare-fun b!18832 () Bool)

(declare-fun e!12032 () Bool)

(declare-fun e!12048 () Bool)

(assert (=> b!18832 (= e!12032 e!12048)))

(declare-fun c!2000 () Bool)

(declare-fun lt!5321 () tuple2!790)

(assert (=> b!18832 (= c!2000 (_1!396 lt!5321))))

(declare-fun bm!852 () Bool)

(assert (=> bm!852 (= call!865 call!852)))

(declare-fun b!18833 () Bool)

(assert (=> b!18833 (= e!12049 (not call!847))))

(declare-fun b!18834 () Bool)

(assert (=> b!18834 (= e!12050 (= (select (arr!489 (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641))) (index!2296 lt!5322)) (ite c!1835 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1837 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!18835 () Bool)

(declare-fun call!851 () Bool)

(assert (=> b!18835 (= e!12043 (not call!851))))

(declare-fun b!18836 () Bool)

(declare-fun res!12982 () Bool)

(assert (=> b!18836 (= res!12982 call!852)))

(assert (=> b!18836 (=> (not res!12982) (not e!12035))))

(declare-fun b!18837 () Bool)

(declare-fun res!12989 () Bool)

(assert (=> b!18837 (=> (not res!12989) (not e!12049))))

(assert (=> b!18837 (= res!12989 (= (select (arr!489 (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641))) (index!2295 lt!5329)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!853 () Bool)

(assert (=> bm!853 (= call!863 call!857)))

(declare-fun b!18838 () Bool)

(assert (=> b!18838 (= e!12048 e!12046)))

(declare-fun res!12988 () Bool)

(assert (=> b!18838 (= res!12988 (contains!214 call!849 (ite c!1835 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1837 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!18838 (=> (not res!12988) (not e!12046))))

(declare-fun bm!854 () Bool)

(assert (=> bm!854 (= call!842 call!859)))

(declare-fun b!18839 () Bool)

(declare-fun lt!5335 () Unit!359)

(assert (=> b!18839 (= e!12031 lt!5335)))

(assert (=> b!18839 (= lt!5335 call!843)))

(assert (=> b!18839 (= lt!5322 call!864)))

(declare-fun res!12985 () Bool)

(assert (=> b!18839 (= res!12985 ((_ is Found!44) lt!5322))))

(assert (=> b!18839 (=> (not res!12985) (not e!12050))))

(assert (=> b!18839 e!12050))

(declare-fun bm!855 () Bool)

(assert (=> bm!855 (= call!860 call!845)))

(declare-fun bm!856 () Bool)

(assert (=> bm!856 (= call!855 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!2 (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641)) (_values!1658 (ite c!1835 (_2!396 lt!4762) call!641)) (mask!4594 (ite c!1835 (_2!396 lt!4762) call!641)) (extraKeys!1574 (ite c!1835 (_2!396 lt!4762) call!641)) (zeroValue!1597 (ite c!1835 (_2!396 lt!4762) call!641)) (minValue!1597 (ite c!1835 (_2!396 lt!4762) call!641)) (ite c!1835 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1837 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1661 (ite c!1835 (_2!396 lt!4762) call!641))))))

(declare-fun bm!857 () Bool)

(assert (=> bm!857 (= call!851 call!856)))

(declare-fun d!3487 () Bool)

(assert (=> d!3487 e!12032))

(declare-fun res!12980 () Bool)

(assert (=> d!3487 (=> (not res!12980) (not e!12032))))

(assert (=> d!3487 (= res!12980 (valid!59 (_2!396 lt!5321)))))

(assert (=> d!3487 (= lt!5321 e!12034)))

(assert (=> d!3487 (= c!2002 (= (ite c!1835 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1837 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvneg (ite c!1835 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1837 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!3487 (valid!59 (ite c!1835 (_2!396 lt!4762) call!641))))

(assert (=> d!3487 (= (update!13 (ite c!1835 (_2!396 lt!4762) call!641) (ite c!1835 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1837 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1835 (minValue!1597 (v!1470 (underlying!61 thiss!848))) (ite c!1837 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 (v!1470 (underlying!61 thiss!848)))))) lt!5321)))

(declare-fun b!18840 () Bool)

(assert (=> b!18840 (= e!12048 (= call!849 call!848))))

(declare-fun b!18841 () Bool)

(assert (=> b!18841 (= e!12035 (= (select (arr!489 (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641))) (index!2296 lt!5341)) (ite c!1835 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1837 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!858 () Bool)

(assert (=> bm!858 (= call!846 call!853)))

(declare-fun bm!859 () Bool)

(assert (=> bm!859 (= call!845 (getCurrentListMap!119 (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641)) (ite c!2002 (_values!1658 (ite c!1835 (_2!396 lt!4762) call!641)) (array!1014 (store (arr!488 (_values!1658 (ite c!1835 (_2!396 lt!4762) call!641))) (index!2296 lt!5332) (ValueCellFull!257 (ite c!1835 (minValue!1597 (v!1470 (underlying!61 thiss!848))) (ite c!1837 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 (v!1470 (underlying!61 thiss!848))))))) (size!578 (_values!1658 (ite c!1835 (_2!396 lt!4762) call!641))))) (mask!4594 (ite c!1835 (_2!396 lt!4762) call!641)) (ite c!2002 (ite c!2001 (extraKeys!1574 (ite c!1835 (_2!396 lt!4762) call!641)) lt!5340) (extraKeys!1574 (ite c!1835 (_2!396 lt!4762) call!641))) (zeroValue!1597 (ite c!1835 (_2!396 lt!4762) call!641)) (ite c!2002 (ite c!2001 (minValue!1597 (ite c!1835 (_2!396 lt!4762) call!641)) (ite c!1835 (minValue!1597 (v!1470 (underlying!61 thiss!848))) (ite c!1837 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 (v!1470 (underlying!61 thiss!848)))))) (minValue!1597 (ite c!1835 (_2!396 lt!4762) call!641))) #b00000000000000000000000000000000 (defaultEntry!1661 (ite c!1835 (_2!396 lt!4762) call!641))))))

(declare-fun b!18842 () Bool)

(assert (=> b!18842 (= e!12047 (not call!851))))

(declare-fun b!18843 () Bool)

(assert (=> b!18843 (= e!12037 e!12047)))

(declare-fun res!12984 () Bool)

(assert (=> b!18843 (= res!12984 call!846)))

(assert (=> b!18843 (=> (not res!12984) (not e!12047))))

(declare-fun b!18844 () Bool)

(declare-fun lt!5336 () Unit!359)

(assert (=> b!18844 (= lt!5336 e!12039)))

(assert (=> b!18844 (= c!2003 call!858)))

(assert (=> b!18844 (= e!12045 (tuple2!791 false (ite c!1835 (_2!396 lt!4762) call!641)))))

(declare-fun bm!860 () Bool)

(assert (=> bm!860 (= call!847 call!856)))

(declare-fun bm!861 () Bool)

(assert (=> bm!861 (= call!857 (+!35 (ite c!2002 (ite c!2001 call!860 call!850) call!861) (ite c!2002 (ite c!2001 (tuple2!795 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!1835 (minValue!1597 (v!1470 (underlying!61 thiss!848))) (ite c!1837 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 (v!1470 (underlying!61 thiss!848)))))) (tuple2!795 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1835 (minValue!1597 (v!1470 (underlying!61 thiss!848))) (ite c!1837 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 (v!1470 (underlying!61 thiss!848))))))) (tuple2!795 (ite c!1835 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1837 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1835 (minValue!1597 (v!1470 (underlying!61 thiss!848))) (ite c!1837 (zeroValue!1597 (v!1470 (underlying!61 thiss!848))) (minValue!1597 (v!1470 (underlying!61 thiss!848)))))))))))

(declare-fun bm!862 () Bool)

(assert (=> bm!862 (= call!849 (map!357 (_2!396 lt!5321)))))

(declare-fun b!18845 () Bool)

(assert (=> b!18845 (= e!12034 e!12045)))

(assert (=> b!18845 (= lt!5332 (seekEntryOrOpen!0 (ite c!1835 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1837 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3086 (ite c!1835 (_2!396 lt!4762) call!641)) (mask!4594 (ite c!1835 (_2!396 lt!4762) call!641))))))

(assert (=> b!18845 (= c!2004 ((_ is Undefined!44) lt!5332))))

(assert (= (and d!3487 c!2002) b!18808))

(assert (= (and d!3487 (not c!2002)) b!18845))

(assert (= (and b!18808 c!2001) b!18810))

(assert (= (and b!18808 (not c!2001)) b!18817))

(assert (= (or b!18810 b!18817) bm!855))

(assert (= (or b!18810 b!18817) bm!848))

(assert (= (or b!18810 b!18817) bm!853))

(assert (= (and b!18845 c!2004) b!18844))

(assert (= (and b!18845 (not c!2004)) b!18827))

(assert (= (and b!18844 c!2003) b!18812))

(assert (= (and b!18844 (not c!2003)) b!18824))

(assert (= (and b!18812 res!12991) b!18836))

(assert (= (and b!18836 res!12982) b!18841))

(assert (= (and b!18824 c!2007) b!18828))

(assert (= (and b!18824 (not c!2007)) b!18830))

(assert (= (and b!18828 res!12990) b!18837))

(assert (= (and b!18837 res!12989) b!18833))

(assert (= (and b!18830 c!2006) b!18823))

(assert (= (and b!18830 (not c!2006)) b!18822))

(assert (= (and b!18823 res!12987) b!18813))

(assert (= (and b!18813 res!12983) b!18818))

(assert (= (or b!18828 b!18823) bm!852))

(assert (= (or b!18833 b!18818) bm!860))

(assert (= (or b!18836 bm!852) bm!842))

(assert (= (or b!18812 b!18824) bm!854))

(assert (= (and b!18827 c!1998) b!18825))

(assert (= (and b!18827 (not c!1998)) b!18831))

(assert (= (and b!18831 c!1997) b!18829))

(assert (= (and b!18831 (not c!1997)) b!18820))

(assert (= (and b!18820 c!2005) b!18839))

(assert (= (and b!18820 (not c!2005)) b!18811))

(assert (= (and b!18839 res!12985) b!18819))

(assert (= (and b!18819 res!12992) b!18834))

(assert (= (and b!18811 c!2008) b!18814))

(assert (= (and b!18811 (not c!2008)) b!18809))

(assert (= (and b!18814 res!12981) b!18815))

(assert (= (and b!18815 res!12979) b!18835))

(assert (= (and b!18809 c!1999) b!18843))

(assert (= (and b!18809 (not c!1999)) b!18826))

(assert (= (and b!18843 res!12984) b!18821))

(assert (= (and b!18821 res!12986) b!18842))

(assert (= (or b!18814 b!18843) bm!858))

(assert (= (or b!18835 b!18842) bm!857))

(assert (= (or b!18819 bm!858) bm!850))

(assert (= (or b!18839 b!18811) bm!847))

(assert (= (or b!18825 b!18829) bm!845))

(assert (= (or b!18812 b!18839) bm!846))

(assert (= (or b!18844 b!18820) bm!840))

(assert (= (or bm!860 bm!857) bm!843))

(assert (= (or bm!854 bm!847) bm!841))

(assert (= (or bm!842 bm!850) bm!844))

(assert (= (or b!18824 b!18811) bm!856))

(assert (= (or b!18844 b!18820) bm!839))

(assert (= (or bm!853 b!18820) bm!861))

(assert (= (or bm!855 b!18820) bm!859))

(assert (= (or bm!848 b!18820) bm!851))

(assert (= (and d!3487 res!12980) b!18832))

(assert (= (and b!18832 c!2000) b!18838))

(assert (= (and b!18832 (not c!2000)) b!18840))

(assert (= (and b!18838 res!12988) b!18816))

(assert (= (or b!18816 b!18840) bm!849))

(assert (= (or b!18838 b!18816 b!18840) bm!862))

(declare-fun m!13309 () Bool)

(assert (=> b!18810 m!13309))

(declare-fun m!13311 () Bool)

(assert (=> b!18838 m!13311))

(declare-fun m!13313 () Bool)

(assert (=> bm!856 m!13313))

(declare-fun m!13315 () Bool)

(assert (=> b!18813 m!13315))

(declare-fun m!13317 () Bool)

(assert (=> bm!843 m!13317))

(declare-fun m!13319 () Bool)

(assert (=> bm!862 m!13319))

(declare-fun m!13321 () Bool)

(assert (=> bm!845 m!13321))

(declare-fun m!13323 () Bool)

(assert (=> bm!841 m!13323))

(declare-fun m!13325 () Bool)

(assert (=> b!18821 m!13325))

(declare-fun m!13327 () Bool)

(assert (=> b!18817 m!13327))

(declare-fun m!13329 () Bool)

(assert (=> bm!851 m!13329))

(declare-fun m!13331 () Bool)

(assert (=> bm!839 m!13331))

(declare-fun m!13333 () Bool)

(assert (=> bm!861 m!13333))

(declare-fun m!13335 () Bool)

(assert (=> bm!849 m!13335))

(assert (=> b!18845 m!13323))

(declare-fun m!13337 () Bool)

(assert (=> b!18837 m!13337))

(declare-fun m!13339 () Bool)

(assert (=> bm!844 m!13339))

(declare-fun m!13341 () Bool)

(assert (=> b!18841 m!13341))

(declare-fun m!13343 () Bool)

(assert (=> b!18816 m!13343))

(declare-fun m!13345 () Bool)

(assert (=> b!18820 m!13345))

(declare-fun m!13347 () Bool)

(assert (=> b!18820 m!13347))

(assert (=> b!18820 m!13345))

(declare-fun m!13349 () Bool)

(assert (=> b!18820 m!13349))

(declare-fun m!13351 () Bool)

(assert (=> b!18820 m!13351))

(declare-fun m!13353 () Bool)

(assert (=> b!18820 m!13353))

(declare-fun m!13355 () Bool)

(assert (=> b!18834 m!13355))

(declare-fun m!13357 () Bool)

(assert (=> b!18815 m!13357))

(declare-fun m!13359 () Bool)

(assert (=> bm!846 m!13359))

(declare-fun m!13361 () Bool)

(assert (=> d!3487 m!13361))

(declare-fun m!13363 () Bool)

(assert (=> d!3487 m!13363))

(declare-fun m!13365 () Bool)

(assert (=> bm!840 m!13365))

(assert (=> bm!859 m!13351))

(declare-fun m!13367 () Bool)

(assert (=> bm!859 m!13367))

(assert (=> bm!638 d!3487))

(declare-fun condMapEmpty!814 () Bool)

(declare-fun mapDefault!814 () ValueCell!257)

(assert (=> mapNonEmpty!813 (= condMapEmpty!814 (= mapRest!813 ((as const (Array (_ BitVec 32) ValueCell!257)) mapDefault!814)))))

(declare-fun e!12052 () Bool)

(declare-fun mapRes!814 () Bool)

(assert (=> mapNonEmpty!813 (= tp!3153 (and e!12052 mapRes!814))))

(declare-fun b!18846 () Bool)

(declare-fun e!12051 () Bool)

(assert (=> b!18846 (= e!12051 tp_is_empty!913)))

(declare-fun b!18847 () Bool)

(assert (=> b!18847 (= e!12052 tp_is_empty!913)))

(declare-fun mapIsEmpty!814 () Bool)

(assert (=> mapIsEmpty!814 mapRes!814))

(declare-fun mapNonEmpty!814 () Bool)

(declare-fun tp!3154 () Bool)

(assert (=> mapNonEmpty!814 (= mapRes!814 (and tp!3154 e!12051))))

(declare-fun mapRest!814 () (Array (_ BitVec 32) ValueCell!257))

(declare-fun mapKey!814 () (_ BitVec 32))

(declare-fun mapValue!814 () ValueCell!257)

(assert (=> mapNonEmpty!814 (= mapRest!813 (store mapRest!814 mapKey!814 mapValue!814))))

(assert (= (and mapNonEmpty!813 condMapEmpty!814) mapIsEmpty!814))

(assert (= (and mapNonEmpty!813 (not condMapEmpty!814)) mapNonEmpty!814))

(assert (= (and mapNonEmpty!814 ((_ is ValueCellFull!257) mapValue!814)) b!18846))

(assert (= (and mapNonEmpty!813 ((_ is ValueCellFull!257) mapDefault!814)) b!18847))

(declare-fun m!13369 () Bool)

(assert (=> mapNonEmpty!814 m!13369))

(declare-fun b_lambda!1447 () Bool)

(assert (= b_lambda!1441 (or (and b!18125 b_free!649) b_lambda!1447)))

(declare-fun b_lambda!1449 () Bool)

(assert (= b_lambda!1445 (or (and b!18125 b_free!649) b_lambda!1449)))

(declare-fun b_lambda!1451 () Bool)

(assert (= b_lambda!1439 (or (and b!18125 b_free!649) b_lambda!1451)))

(check-sat (not d!3423) b_and!1307 (not d!3449) (not bm!826) (not b!18484) (not b!18678) (not d!3477) (not d!3447) (not b!18696) (not bm!822) (not b!18469) (not bm!839) (not b_lambda!1451) (not b_next!649) (not b!18707) (not b!18810) (not bm!829) (not b!18573) (not d!3415) (not b_lambda!1447) (not d!3445) (not bm!823) (not bm!786) (not d!3459) (not d!3431) (not d!3441) (not d!3427) (not b!18378) (not bm!735) (not b!18708) (not d!3411) (not d!3471) (not bm!843) (not b_lambda!1443) (not b!18669) (not b!18817) (not b!18752) (not d!3435) (not b!18693) (not bm!790) (not b!18379) (not d!3405) (not bm!741) (not bm!728) (not b!18750) (not b!18527) (not d!3467) (not d!3439) (not d!3413) (not bm!821) (not b!18551) (not bm!787) (not b!18620) (not d!3419) (not bm!862) (not bm!825) (not bm!818) (not d!3487) (not bm!784) (not b!18816) (not b!18794) (not bm!856) (not b!18560) (not bm!859) (not bm!849) (not d!3409) (not bm!780) (not b!18628) (not bm!841) (not d!3465) (not bm!837) (not mapNonEmpty!814) (not d!3485) (not bm!846) (not b!18509) (not b!18524) (not b!18386) (not b_lambda!1435) (not b!18679) (not b!18466) (not bm!747) (not b!18754) (not b!18797) (not d!3469) (not b!18703) (not bm!745) (not bm!851) (not bm!739) (not b!18584) (not b!18513) (not b!18683) (not b!18761) (not b!18758) (not b!18581) (not d!3483) (not bm!771) (not b_lambda!1437) (not b!18401) (not b!18799) (not b!18801) (not bm!840) (not b!18588) (not bm!740) (not bm!731) (not d!3461) (not b!18557) (not b!18589) (not bm!757) (not b!18463) (not b!18452) (not b!18746) (not b!18768) (not bm!752) (not b!18525) (not b!18387) (not d!3437) (not b!18520) (not d!3451) (not bm!844) (not b!18480) (not d!3429) (not b!18558) (not b!18681) (not b!18459) (not bm!782) (not b!18549) (not b!18756) (not bm!759) (not b!18713) (not b!18709) (not d!3475) (not b!18629) (not b!18820) (not d!3479) (not b!18541) (not bm!761) (not b!18388) (not d!3481) (not b!18671) (not bm!828) (not bm!734) (not b!18627) (not b!18559) (not bm!762) (not bm!824) (not b!18586) (not b!18530) (not d!3463) (not bm!817) (not d!3407) (not b_lambda!1449) (not b!18591) (not b!18502) (not bm!755) (not b!18665) (not b!18465) (not b!18690) (not b!18587) (not b!18845) (not bm!765) (not bm!736) (not bm!845) (not b!18510) (not b!18464) (not b!18577) (not bm!827) (not b!18526) (not b!18668) (not bm!781) (not b!18474) (not b!18449) (not b!18838) (not bm!819) (not b!18748) (not b!18590) (not bm!861) (not d!3455) (not b!18767) (not b!18481) (not bm!742) (not b!18804) (not d!3421) (not bm!737) (not bm!820) (not b!18791) (not bm!730) (not bm!758) (not b!18807) tp_is_empty!913 (not b!18548) (not b!18576) (not b!18710) (not d!3417) (not bm!770))
(check-sat b_and!1307 (not b_next!649))
