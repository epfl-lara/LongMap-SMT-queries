; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3038 () Bool)

(assert start!3038)

(declare-fun b!18136 () Bool)

(declare-fun b_free!649 () Bool)

(declare-fun b_next!649 () Bool)

(assert (=> b!18136 (= b_free!649 (not b_next!649))))

(declare-fun tp!3137 () Bool)

(declare-fun b_and!1291 () Bool)

(assert (=> b!18136 (= tp!3137 b_and!1291)))

(declare-fun b!18134 () Bool)

(declare-datatypes ((V!1043 0))(
  ( (V!1044 (val!483 Int)) )
))
(declare-datatypes ((ValueCell!257 0))(
  ( (ValueCellFull!257 (v!1470 V!1043)) (EmptyCell!257) )
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
  ( (Cell!101 (v!1471 LongMapFixedSize!100)) )
))
(declare-datatypes ((LongMap!100 0))(
  ( (LongMap!101 (underlying!61 Cell!100)) )
))
(declare-datatypes ((tuple2!790 0))(
  ( (tuple2!791 (_1!396 Bool) (_2!396 LongMap!100)) )
))
(declare-fun e!11621 () tuple2!790)

(declare-fun thiss!848 () LongMap!100)

(declare-fun repack!25 (LongMap!100) tuple2!790)

(assert (=> b!18134 (= e!11621 (repack!25 thiss!848))))

(declare-fun b!18135 () Bool)

(declare-fun e!11623 () Bool)

(declare-fun e!11629 () Bool)

(assert (=> b!18135 (= e!11623 e!11629)))

(declare-fun e!11630 () Bool)

(declare-fun tp_is_empty!913 () Bool)

(declare-fun array_inv!355 (array!1015) Bool)

(declare-fun array_inv!356 (array!1013) Bool)

(assert (=> b!18136 (= e!11629 (and tp!3137 tp_is_empty!913 (array_inv!355 (_keys!3086 (v!1471 (underlying!61 thiss!848)))) (array_inv!356 (_values!1658 (v!1471 (underlying!61 thiss!848)))) e!11630))))

(declare-fun b!18137 () Bool)

(declare-fun e!11628 () Bool)

(declare-fun mapRes!804 () Bool)

(assert (=> b!18137 (= e!11630 (and e!11628 mapRes!804))))

(declare-fun condMapEmpty!804 () Bool)

(declare-fun mapDefault!804 () ValueCell!257)

(assert (=> b!18137 (= condMapEmpty!804 (= (arr!488 (_values!1658 (v!1471 (underlying!61 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!257)) mapDefault!804)))))

(declare-fun res!12723 () Bool)

(declare-fun e!11633 () Bool)

(assert (=> start!3038 (=> (not res!12723) (not e!11633))))

(declare-fun valid!55 (LongMap!100) Bool)

(assert (=> start!3038 (= res!12723 (valid!55 thiss!848))))

(assert (=> start!3038 e!11633))

(declare-fun e!11625 () Bool)

(assert (=> start!3038 e!11625))

(assert (=> start!3038 true))

(assert (=> start!3038 tp_is_empty!913))

(declare-fun b!18138 () Bool)

(declare-fun e!11627 () Bool)

(assert (=> b!18138 (= e!11627 tp_is_empty!913)))

(declare-fun mapIsEmpty!804 () Bool)

(assert (=> mapIsEmpty!804 mapRes!804))

(declare-fun bm!616 () Bool)

(declare-datatypes ((tuple2!792 0))(
  ( (tuple2!793 (_1!397 (_ BitVec 64)) (_2!397 V!1043)) )
))
(declare-datatypes ((List!535 0))(
  ( (Nil!532) (Cons!531 (h!1097 tuple2!792) (t!3168 List!535)) )
))
(declare-datatypes ((ListLongMap!533 0))(
  ( (ListLongMap!534 (toList!282 List!535)) )
))
(declare-fun call!620 () ListLongMap!533)

(declare-fun lt!4696 () LongMap!100)

(declare-fun map!355 (LongMap!100) ListLongMap!533)

(assert (=> bm!616 (= call!620 (map!355 lt!4696))))

(declare-fun key!682 () (_ BitVec 64))

(declare-fun e!11622 () Bool)

(declare-fun call!619 () ListLongMap!533)

(declare-fun lt!4693 () ListLongMap!533)

(declare-fun b!18139 () Bool)

(declare-fun v!259 () V!1043)

(declare-fun +!34 (ListLongMap!533 tuple2!792) ListLongMap!533)

(assert (=> b!18139 (= e!11622 (not (= lt!4693 (+!34 call!619 (tuple2!793 key!682 v!259)))))))

(declare-fun b!18140 () Bool)

(assert (=> b!18140 (= e!11628 tp_is_empty!913)))

(declare-fun b!18141 () Bool)

(declare-fun e!11631 () Bool)

(assert (=> b!18141 (= e!11633 e!11631)))

(declare-fun res!12726 () Bool)

(assert (=> b!18141 (=> (not res!12726) (not e!11631))))

(declare-fun lt!4694 () tuple2!790)

(assert (=> b!18141 (= res!12726 (_1!396 lt!4694))))

(assert (=> b!18141 (= lt!4694 e!11621)))

(declare-fun c!1814 () Bool)

(declare-fun imbalanced!29 (LongMap!100) Bool)

(assert (=> b!18141 (= c!1814 (imbalanced!29 thiss!848))))

(declare-fun b!18142 () Bool)

(declare-fun e!11632 () Bool)

(declare-fun e!11624 () Bool)

(assert (=> b!18142 (= e!11632 e!11624)))

(declare-fun c!1815 () Bool)

(declare-datatypes ((tuple2!794 0))(
  ( (tuple2!795 (_1!398 Bool) (_2!398 LongMapFixedSize!100)) )
))
(declare-fun lt!4695 () tuple2!794)

(assert (=> b!18142 (= c!1815 (_1!398 lt!4695))))

(declare-fun bm!617 () Bool)

(assert (=> bm!617 (= call!619 (map!355 thiss!848))))

(declare-fun b!18143 () Bool)

(assert (=> b!18143 (= e!11631 e!11632)))

(declare-fun res!12724 () Bool)

(assert (=> b!18143 (=> res!12724 e!11632)))

(assert (=> b!18143 (= res!12724 (not (valid!55 lt!4696)))))

(assert (=> b!18143 (= lt!4696 (LongMap!101 (Cell!101 (_2!398 lt!4695))))))

(declare-fun update!12 (LongMapFixedSize!100 (_ BitVec 64) V!1043) tuple2!794)

(assert (=> b!18143 (= lt!4695 (update!12 (v!1471 (underlying!61 (_2!396 lt!4694))) key!682 v!259))))

(declare-fun b!18144 () Bool)

(assert (=> b!18144 (= e!11625 e!11623)))

(declare-fun mapNonEmpty!804 () Bool)

(declare-fun tp!3138 () Bool)

(assert (=> mapNonEmpty!804 (= mapRes!804 (and tp!3138 e!11627))))

(declare-fun mapRest!804 () (Array (_ BitVec 32) ValueCell!257))

(declare-fun mapValue!804 () ValueCell!257)

(declare-fun mapKey!804 () (_ BitVec 32))

(assert (=> mapNonEmpty!804 (= (arr!488 (_values!1658 (v!1471 (underlying!61 thiss!848)))) (store mapRest!804 mapKey!804 mapValue!804))))

(declare-fun b!18145 () Bool)

(assert (=> b!18145 (= e!11624 e!11622)))

(assert (=> b!18145 (= lt!4693 call!620)))

(declare-fun res!12725 () Bool)

(declare-fun contains!213 (ListLongMap!533 (_ BitVec 64)) Bool)

(assert (=> b!18145 (= res!12725 (not (contains!213 lt!4693 key!682)))))

(assert (=> b!18145 (=> res!12725 e!11622)))

(declare-fun b!18146 () Bool)

(assert (=> b!18146 (= e!11621 (tuple2!791 true thiss!848))))

(declare-fun b!18147 () Bool)

(assert (=> b!18147 (= e!11624 (not (= call!620 call!619)))))

(assert (= (and start!3038 res!12723) b!18141))

(assert (= (and b!18141 c!1814) b!18134))

(assert (= (and b!18141 (not c!1814)) b!18146))

(assert (= (and b!18141 res!12726) b!18143))

(assert (= (and b!18143 (not res!12724)) b!18142))

(assert (= (and b!18142 c!1815) b!18145))

(assert (= (and b!18142 (not c!1815)) b!18147))

(assert (= (and b!18145 (not res!12725)) b!18139))

(assert (= (or b!18139 b!18147) bm!617))

(assert (= (or b!18145 b!18147) bm!616))

(assert (= (and b!18137 condMapEmpty!804) mapIsEmpty!804))

(assert (= (and b!18137 (not condMapEmpty!804)) mapNonEmpty!804))

(get-info :version)

(assert (= (and mapNonEmpty!804 ((_ is ValueCellFull!257) mapValue!804)) b!18138))

(assert (= (and b!18137 ((_ is ValueCellFull!257) mapDefault!804)) b!18140))

(assert (= b!18136 b!18137))

(assert (= b!18135 b!18136))

(assert (= b!18144 b!18135))

(assert (= start!3038 b!18144))

(declare-fun m!12591 () Bool)

(assert (=> start!3038 m!12591))

(declare-fun m!12593 () Bool)

(assert (=> bm!617 m!12593))

(declare-fun m!12595 () Bool)

(assert (=> b!18145 m!12595))

(declare-fun m!12597 () Bool)

(assert (=> b!18134 m!12597))

(declare-fun m!12599 () Bool)

(assert (=> b!18139 m!12599))

(declare-fun m!12601 () Bool)

(assert (=> b!18143 m!12601))

(declare-fun m!12603 () Bool)

(assert (=> b!18143 m!12603))

(declare-fun m!12605 () Bool)

(assert (=> b!18141 m!12605))

(declare-fun m!12607 () Bool)

(assert (=> mapNonEmpty!804 m!12607))

(declare-fun m!12609 () Bool)

(assert (=> b!18136 m!12609))

(declare-fun m!12611 () Bool)

(assert (=> b!18136 m!12611))

(declare-fun m!12613 () Bool)

(assert (=> bm!616 m!12613))

(check-sat (not b!18141) (not b_next!649) (not mapNonEmpty!804) tp_is_empty!913 (not start!3038) (not b!18139) b_and!1291 (not b!18145) (not b!18134) (not bm!616) (not b!18136) (not b!18143) (not bm!617))
(check-sat b_and!1291 (not b_next!649))
(get-model)

(declare-fun d!3389 () Bool)

(declare-fun map!358 (LongMapFixedSize!100) ListLongMap!533)

(assert (=> d!3389 (= (map!355 lt!4696) (map!358 (v!1471 (underlying!61 lt!4696))))))

(declare-fun bs!838 () Bool)

(assert (= bs!838 d!3389))

(declare-fun m!12663 () Bool)

(assert (=> bs!838 m!12663))

(assert (=> bm!616 d!3389))

(declare-fun d!3391 () Bool)

(declare-fun valid!58 (LongMapFixedSize!100) Bool)

(assert (=> d!3391 (= (valid!55 thiss!848) (valid!58 (v!1471 (underlying!61 thiss!848))))))

(declare-fun bs!839 () Bool)

(assert (= bs!839 d!3391))

(declare-fun m!12665 () Bool)

(assert (=> bs!839 m!12665))

(assert (=> start!3038 d!3391))

(declare-fun d!3393 () Bool)

(assert (=> d!3393 (= (map!355 thiss!848) (map!358 (v!1471 (underlying!61 thiss!848))))))

(declare-fun bs!840 () Bool)

(assert (= bs!840 d!3393))

(declare-fun m!12667 () Bool)

(assert (=> bs!840 m!12667))

(assert (=> bm!617 d!3393))

(declare-fun d!3395 () Bool)

(assert (=> d!3395 (= (valid!55 lt!4696) (valid!58 (v!1471 (underlying!61 lt!4696))))))

(declare-fun bs!841 () Bool)

(assert (= bs!841 d!3395))

(declare-fun m!12669 () Bool)

(assert (=> bs!841 m!12669))

(assert (=> b!18143 d!3395))

(declare-fun e!11768 () Bool)

(declare-fun call!685 () ListLongMap!533)

(declare-fun b!18308 () Bool)

(declare-fun call!697 () ListLongMap!533)

(assert (=> b!18308 (= e!11768 (= call!685 (+!34 call!697 (tuple2!793 key!682 v!259))))))

(declare-fun bm!678 () Bool)

(declare-datatypes ((SeekEntryResult!43 0))(
  ( (MissingZero!43 (index!2291 (_ BitVec 32))) (Found!43 (index!2292 (_ BitVec 32))) (Intermediate!43 (undefined!855 Bool) (index!2293 (_ BitVec 32)) (x!4488 (_ BitVec 32))) (Undefined!43) (MissingVacant!43 (index!2294 (_ BitVec 32))) )
))
(declare-fun call!704 () SeekEntryResult!43)

(declare-fun call!687 () SeekEntryResult!43)

(assert (=> bm!678 (= call!704 call!687)))

(declare-fun b!18309 () Bool)

(declare-fun e!11763 () tuple2!794)

(declare-fun e!11757 () tuple2!794)

(assert (=> b!18309 (= e!11763 e!11757)))

(declare-fun c!1856 () Bool)

(declare-fun lt!4782 () SeekEntryResult!43)

(assert (=> b!18309 (= c!1856 ((_ is MissingZero!43) lt!4782))))

(declare-fun b!18310 () Bool)

(declare-fun e!11761 () Bool)

(declare-fun call!690 () Bool)

(assert (=> b!18310 (= e!11761 (not call!690))))

(declare-fun b!18311 () Bool)

(declare-fun e!11752 () Bool)

(declare-fun lt!4776 () SeekEntryResult!43)

(assert (=> b!18311 (= e!11752 ((_ is Undefined!43) lt!4776))))

(declare-fun b!18312 () Bool)

(declare-fun e!11770 () Bool)

(declare-fun call!681 () Bool)

(assert (=> b!18312 (= e!11770 (not call!681))))

(declare-fun bm!679 () Bool)

(declare-fun call!694 () ListLongMap!533)

(declare-fun call!702 () ListLongMap!533)

(assert (=> bm!679 (= call!694 call!702)))

(declare-fun bm!680 () Bool)

(declare-fun call!691 () Bool)

(declare-fun call!686 () Bool)

(assert (=> bm!680 (= call!691 call!686)))

(declare-fun b!18313 () Bool)

(declare-fun c!1860 () Bool)

(assert (=> b!18313 (= c!1860 ((_ is MissingVacant!43) lt!4782))))

(declare-fun e!11754 () tuple2!794)

(assert (=> b!18313 (= e!11754 e!11763)))

(declare-fun b!18314 () Bool)

(declare-fun res!12784 () Bool)

(assert (=> b!18314 (=> (not res!12784) (not e!11761))))

(assert (=> b!18314 (= res!12784 (= (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2291 lt!4776)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!4793 () SeekEntryResult!43)

(declare-fun e!11762 () Bool)

(declare-fun b!18315 () Bool)

(assert (=> b!18315 (= e!11762 (= (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!4793)) key!682))))

(declare-fun b!18316 () Bool)

(declare-fun res!12781 () Bool)

(assert (=> b!18316 (=> (not res!12781) (not e!11770))))

(declare-fun lt!4796 () SeekEntryResult!43)

(assert (=> b!18316 (= res!12781 (= (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2291 lt!4796)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!681 () Bool)

(declare-fun call!682 () Bool)

(declare-fun call!698 () Bool)

(assert (=> bm!681 (= call!682 call!698)))

(declare-fun bm!682 () Bool)

(declare-fun call!703 () Bool)

(declare-fun arrayContainsKey!0 (array!1015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!682 (= call!703 (arrayContainsKey!0 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) key!682 #b00000000000000000000000000000000))))

(declare-fun bm!683 () Bool)

(declare-fun call!689 () Bool)

(assert (=> bm!683 (= call!698 call!689)))

(declare-fun bm!684 () Bool)

(declare-fun call!695 () ListLongMap!533)

(declare-fun call!696 () ListLongMap!533)

(assert (=> bm!684 (= call!695 call!696)))

(declare-fun b!18317 () Bool)

(declare-fun res!12792 () Bool)

(assert (=> b!18317 (= res!12792 call!686)))

(declare-fun e!11767 () Bool)

(assert (=> b!18317 (=> (not res!12792) (not e!11767))))

(declare-fun b!18318 () Bool)

(declare-fun lt!4799 () tuple2!794)

(declare-fun call!693 () tuple2!794)

(assert (=> b!18318 (= lt!4799 call!693)))

(assert (=> b!18318 (= e!11757 (tuple2!795 (_1!398 lt!4799) (_2!398 lt!4799)))))

(declare-fun b!18319 () Bool)

(declare-fun lt!4795 () tuple2!794)

(assert (=> b!18319 (= e!11763 (tuple2!795 (_1!398 lt!4795) (_2!398 lt!4795)))))

(assert (=> b!18319 (= lt!4795 call!693)))

(declare-fun bm!685 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1015 (_ BitVec 32)) SeekEntryResult!43)

(assert (=> bm!685 (= call!687 (seekEntryOrOpen!0 key!682 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun b!18320 () Bool)

(declare-fun e!11759 () Bool)

(declare-fun e!11756 () Bool)

(assert (=> b!18320 (= e!11759 e!11756)))

(declare-fun c!1863 () Bool)

(declare-fun lt!4785 () tuple2!794)

(assert (=> b!18320 (= c!1863 (_1!398 lt!4785))))

(declare-fun bm!686 () Bool)

(assert (=> bm!686 (= call!686 call!689)))

(declare-fun b!18321 () Bool)

(assert (=> b!18321 (= e!11756 e!11768)))

(declare-fun res!12786 () Bool)

(assert (=> b!18321 (= res!12786 (contains!213 call!685 key!682))))

(assert (=> b!18321 (=> (not res!12786) (not e!11768))))

(declare-fun b!18322 () Bool)

(assert (=> b!18322 (= e!11756 (= call!685 call!697))))

(declare-fun b!18323 () Bool)

(declare-datatypes ((Unit!362 0))(
  ( (Unit!363) )
))
(declare-fun e!11765 () Unit!362)

(declare-fun Unit!364 () Unit!362)

(assert (=> b!18323 (= e!11765 Unit!364)))

(declare-fun lt!4800 () Unit!362)

(declare-fun call!688 () Unit!362)

(assert (=> b!18323 (= lt!4800 call!688)))

(declare-fun lt!4781 () SeekEntryResult!43)

(assert (=> b!18323 (= lt!4781 call!704)))

(declare-fun res!12783 () Bool)

(assert (=> b!18323 (= res!12783 ((_ is Found!43) lt!4781))))

(assert (=> b!18323 (=> (not res!12783) (not e!11767))))

(assert (=> b!18323 e!11767))

(declare-fun lt!4786 () Unit!362)

(assert (=> b!18323 (= lt!4786 lt!4800)))

(assert (=> b!18323 false))

(declare-fun bm!687 () Bool)

(declare-fun call!699 () SeekEntryResult!43)

(assert (=> bm!687 (= call!699 call!687)))

(declare-fun c!1858 () Bool)

(declare-fun c!1853 () Bool)

(declare-fun bm!688 () Bool)

(declare-fun c!1854 () Bool)

(declare-fun c!1855 () Bool)

(declare-fun c!1862 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!688 (= call!689 (inRange!0 (ite c!1854 (ite c!1858 (index!2292 lt!4781) (ite c!1853 (index!2291 lt!4796) (index!2294 lt!4796))) (ite c!1862 (index!2292 lt!4793) (ite c!1855 (index!2291 lt!4776) (index!2294 lt!4776)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun b!18324 () Bool)

(declare-fun e!11764 () Bool)

(assert (=> b!18324 (= e!11764 (not call!690))))

(declare-fun b!18325 () Bool)

(declare-fun lt!4777 () Unit!362)

(assert (=> b!18325 (= lt!4777 e!11765)))

(declare-fun call!683 () Bool)

(assert (=> b!18325 (= c!1858 call!683)))

(assert (=> b!18325 (= e!11754 (tuple2!795 false (v!1471 (underlying!61 (_2!396 lt!4694)))))))

(declare-fun c!1861 () Bool)

(declare-fun call!700 () ListLongMap!533)

(declare-fun c!1852 () Bool)

(declare-fun call!701 () ListLongMap!533)

(declare-fun bm!689 () Bool)

(assert (=> bm!689 (= call!696 (+!34 (ite c!1852 call!701 call!700) (ite c!1852 (ite c!1861 (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!793 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!793 key!682 v!259))))))

(declare-fun b!18326 () Bool)

(declare-fun res!12791 () Bool)

(assert (=> b!18326 (= res!12791 (= (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2294 lt!4796)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!11771 () Bool)

(assert (=> b!18326 (=> (not res!12791) (not e!11771))))

(declare-fun bm!690 () Bool)

(assert (=> bm!690 (= call!690 call!703)))

(declare-fun b!18327 () Bool)

(declare-fun e!11769 () Unit!362)

(declare-fun Unit!365 () Unit!362)

(assert (=> b!18327 (= e!11769 Unit!365)))

(declare-fun lt!4794 () Unit!362)

(declare-fun call!692 () Unit!362)

(assert (=> b!18327 (= lt!4794 call!692)))

(assert (=> b!18327 (= lt!4776 call!699)))

(assert (=> b!18327 (= c!1855 ((_ is MissingZero!43) lt!4776))))

(declare-fun e!11760 () Bool)

(assert (=> b!18327 e!11760))

(declare-fun lt!4787 () Unit!362)

(assert (=> b!18327 (= lt!4787 lt!4794)))

(assert (=> b!18327 false))

(declare-fun b!18328 () Bool)

(declare-fun res!12788 () Bool)

(assert (=> b!18328 (= res!12788 (= (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2294 lt!4776)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!18328 (=> (not res!12788) (not e!11764))))

(declare-fun bm!691 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!2 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 64) Int) Unit!362)

(assert (=> bm!691 (= call!692 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!2 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) key!682 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun bm!692 () Bool)

(declare-fun updateHelperNewKey!2 (LongMapFixedSize!100 (_ BitVec 64) V!1043 (_ BitVec 32)) tuple2!794)

(assert (=> bm!692 (= call!693 (updateHelperNewKey!2 (v!1471 (underlying!61 (_2!396 lt!4694))) key!682 v!259 (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782))))))

(declare-fun call!684 () ListLongMap!533)

(declare-fun bm!693 () Bool)

(assert (=> bm!693 (= call!683 (contains!213 call!684 (ite c!1854 key!682 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!4782)))))))

(declare-fun b!18329 () Bool)

(declare-fun res!12779 () Bool)

(assert (=> b!18329 (=> (not res!12779) (not e!11761))))

(assert (=> b!18329 (= res!12779 call!682)))

(assert (=> b!18329 (= e!11760 e!11761)))

(declare-fun b!18330 () Bool)

(declare-fun e!11755 () Bool)

(assert (=> b!18330 (= e!11755 ((_ is Undefined!43) lt!4796))))

(declare-fun bm!694 () Bool)

(declare-fun getCurrentListMap!119 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 32) Int) ListLongMap!533)

(assert (=> bm!694 (= call!700 (getCurrentListMap!119 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun bm!695 () Bool)

(assert (=> bm!695 (= call!685 (map!358 (_2!398 lt!4785)))))

(declare-fun bm!696 () Bool)

(assert (=> bm!696 (= call!681 call!703)))

(declare-fun bm!697 () Bool)

(assert (=> bm!697 (= call!697 (map!358 (v!1471 (underlying!61 (_2!396 lt!4694)))))))

(declare-fun b!18331 () Bool)

(declare-fun lt!4798 () Unit!362)

(declare-fun lt!4779 () Unit!362)

(assert (=> b!18331 (= lt!4798 lt!4779)))

(assert (=> b!18331 (= call!695 call!694)))

(declare-fun lt!4788 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!2 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 V!1043 Int) Unit!362)

(assert (=> b!18331 (= lt!4779 (lemmaChangeZeroKeyThenAddPairToListMap!2 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4788 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(assert (=> b!18331 (= lt!4788 (bvor (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000001))))

(declare-fun e!11753 () tuple2!794)

(assert (=> b!18331 (= e!11753 (tuple2!795 true (LongMapFixedSize!101 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (bvor (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000001) v!259 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_size!82 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_vacant!82 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun bm!698 () Bool)

(declare-fun lt!4797 () (_ BitVec 32))

(assert (=> bm!698 (= call!702 (getCurrentListMap!119 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1852 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (array!1014 (store (arr!488 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!4782) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1852 (ite c!1861 lt!4788 lt!4797) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite (and c!1852 c!1861) v!259 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite c!1852 (ite c!1861 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun b!18332 () Bool)

(declare-fun lt!4778 () Unit!362)

(assert (=> b!18332 (= e!11765 lt!4778)))

(assert (=> b!18332 (= lt!4778 call!692)))

(assert (=> b!18332 (= lt!4796 call!704)))

(assert (=> b!18332 (= c!1853 ((_ is MissingZero!43) lt!4796))))

(declare-fun e!11758 () Bool)

(assert (=> b!18332 e!11758))

(declare-fun b!18333 () Bool)

(declare-fun c!1857 () Bool)

(assert (=> b!18333 (= c!1857 ((_ is MissingVacant!43) lt!4776))))

(assert (=> b!18333 (= e!11760 e!11752)))

(declare-fun b!18334 () Bool)

(declare-fun lt!4790 () Unit!362)

(declare-fun lt!4784 () Unit!362)

(assert (=> b!18334 (= lt!4790 lt!4784)))

(assert (=> b!18334 (= call!695 call!694)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!2 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 V!1043 Int) Unit!362)

(assert (=> b!18334 (= lt!4784 (lemmaChangeLongMinValueKeyThenAddPairToListMap!2 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4797 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(assert (=> b!18334 (= lt!4797 (bvor (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000010))))

(assert (=> b!18334 (= e!11753 (tuple2!795 true (LongMapFixedSize!101 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (bvor (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000010) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259 (_size!82 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_vacant!82 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun b!18335 () Bool)

(assert (=> b!18335 (= e!11752 e!11764)))

(declare-fun res!12780 () Bool)

(assert (=> b!18335 (= res!12780 call!682)))

(assert (=> b!18335 (=> (not res!12780) (not e!11764))))

(declare-fun bm!699 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!2 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 64) Int) Unit!362)

(assert (=> bm!699 (= call!688 (lemmaInListMapThenSeekEntryOrOpenFindsIt!2 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) key!682 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun d!3397 () Bool)

(assert (=> d!3397 e!11759))

(declare-fun res!12785 () Bool)

(assert (=> d!3397 (=> (not res!12785) (not e!11759))))

(assert (=> d!3397 (= res!12785 (valid!58 (_2!398 lt!4785)))))

(declare-fun e!11766 () tuple2!794)

(assert (=> d!3397 (= lt!4785 e!11766)))

(assert (=> d!3397 (= c!1852 (= key!682 (bvneg key!682)))))

(assert (=> d!3397 (valid!58 (v!1471 (underlying!61 (_2!396 lt!4694))))))

(assert (=> d!3397 (= (update!12 (v!1471 (underlying!61 (_2!396 lt!4694))) key!682 v!259) lt!4785)))

(declare-fun b!18336 () Bool)

(declare-fun res!12790 () Bool)

(assert (=> b!18336 (= res!12790 call!698)))

(assert (=> b!18336 (=> (not res!12790) (not e!11762))))

(declare-fun b!18337 () Bool)

(assert (=> b!18337 (= e!11767 (= (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!4781)) key!682))))

(declare-fun bm!700 () Bool)

(assert (=> bm!700 (= call!701 call!700)))

(declare-fun b!18338 () Bool)

(assert (=> b!18338 (= e!11766 e!11754)))

(assert (=> b!18338 (= lt!4782 (seekEntryOrOpen!0 key!682 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(assert (=> b!18338 (= c!1854 ((_ is Undefined!43) lt!4782))))

(declare-fun b!18339 () Bool)

(declare-fun res!12789 () Bool)

(assert (=> b!18339 (=> (not res!12789) (not e!11770))))

(assert (=> b!18339 (= res!12789 call!691)))

(assert (=> b!18339 (= e!11758 e!11770)))

(declare-fun b!18340 () Bool)

(assert (=> b!18340 (= e!11755 e!11771)))

(declare-fun res!12787 () Bool)

(assert (=> b!18340 (= res!12787 call!691)))

(assert (=> b!18340 (=> (not res!12787) (not e!11771))))

(declare-fun b!18341 () Bool)

(declare-fun lt!4789 () Unit!362)

(declare-fun lt!4791 () Unit!362)

(assert (=> b!18341 (= lt!4789 lt!4791)))

(assert (=> b!18341 call!683))

(declare-fun lt!4775 () array!1013)

(declare-fun lemmaValidKeyInArrayIsInListMap!2 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 32) Int) Unit!362)

(assert (=> b!18341 (= lt!4791 (lemmaValidKeyInArrayIsInListMap!2 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4775 (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (index!2292 lt!4782) (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(assert (=> b!18341 (= lt!4775 (array!1014 (store (arr!488 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!4782) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun lt!4792 () Unit!362)

(declare-fun lt!4780 () Unit!362)

(assert (=> b!18341 (= lt!4792 lt!4780)))

(assert (=> b!18341 (= call!696 call!702)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!2 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 32) (_ BitVec 64) V!1043 Int) Unit!362)

(assert (=> b!18341 (= lt!4780 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!2 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (index!2292 lt!4782) key!682 v!259 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun lt!4783 () Unit!362)

(assert (=> b!18341 (= lt!4783 e!11769)))

(assert (=> b!18341 (= c!1862 (contains!213 call!700 key!682))))

(assert (=> b!18341 (= e!11757 (tuple2!795 true (LongMapFixedSize!101 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_size!82 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (array!1014 (store (arr!488 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!4782) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))))) (_vacant!82 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun b!18342 () Bool)

(declare-fun lt!4801 () Unit!362)

(assert (=> b!18342 (= e!11769 lt!4801)))

(assert (=> b!18342 (= lt!4801 call!688)))

(assert (=> b!18342 (= lt!4793 call!699)))

(declare-fun res!12782 () Bool)

(assert (=> b!18342 (= res!12782 ((_ is Found!43) lt!4793))))

(assert (=> b!18342 (=> (not res!12782) (not e!11762))))

(assert (=> b!18342 e!11762))

(declare-fun b!18343 () Bool)

(assert (=> b!18343 (= e!11771 (not call!681))))

(declare-fun bm!701 () Bool)

(assert (=> bm!701 (= call!684 (getCurrentListMap!119 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1854 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4775) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun b!18344 () Bool)

(declare-fun c!1859 () Bool)

(assert (=> b!18344 (= c!1859 ((_ is MissingVacant!43) lt!4796))))

(assert (=> b!18344 (= e!11758 e!11755)))

(declare-fun b!18345 () Bool)

(assert (=> b!18345 (= e!11766 e!11753)))

(assert (=> b!18345 (= c!1861 (= key!682 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!3397 c!1852) b!18345))

(assert (= (and d!3397 (not c!1852)) b!18338))

(assert (= (and b!18345 c!1861) b!18331))

(assert (= (and b!18345 (not c!1861)) b!18334))

(assert (= (or b!18331 b!18334) bm!700))

(assert (= (or b!18331 b!18334) bm!679))

(assert (= (or b!18331 b!18334) bm!684))

(assert (= (and b!18338 c!1854) b!18325))

(assert (= (and b!18338 (not c!1854)) b!18313))

(assert (= (and b!18325 c!1858) b!18323))

(assert (= (and b!18325 (not c!1858)) b!18332))

(assert (= (and b!18323 res!12783) b!18317))

(assert (= (and b!18317 res!12792) b!18337))

(assert (= (and b!18332 c!1853) b!18339))

(assert (= (and b!18332 (not c!1853)) b!18344))

(assert (= (and b!18339 res!12789) b!18316))

(assert (= (and b!18316 res!12781) b!18312))

(assert (= (and b!18344 c!1859) b!18340))

(assert (= (and b!18344 (not c!1859)) b!18330))

(assert (= (and b!18340 res!12787) b!18326))

(assert (= (and b!18326 res!12791) b!18343))

(assert (= (or b!18339 b!18340) bm!680))

(assert (= (or b!18312 b!18343) bm!696))

(assert (= (or b!18317 bm!680) bm!686))

(assert (= (or b!18323 b!18332) bm!678))

(assert (= (and b!18313 c!1860) b!18319))

(assert (= (and b!18313 (not c!1860)) b!18309))

(assert (= (and b!18309 c!1856) b!18318))

(assert (= (and b!18309 (not c!1856)) b!18341))

(assert (= (and b!18341 c!1862) b!18342))

(assert (= (and b!18341 (not c!1862)) b!18327))

(assert (= (and b!18342 res!12782) b!18336))

(assert (= (and b!18336 res!12790) b!18315))

(assert (= (and b!18327 c!1855) b!18329))

(assert (= (and b!18327 (not c!1855)) b!18333))

(assert (= (and b!18329 res!12779) b!18314))

(assert (= (and b!18314 res!12784) b!18310))

(assert (= (and b!18333 c!1857) b!18335))

(assert (= (and b!18333 (not c!1857)) b!18311))

(assert (= (and b!18335 res!12780) b!18328))

(assert (= (and b!18328 res!12788) b!18324))

(assert (= (or b!18329 b!18335) bm!681))

(assert (= (or b!18310 b!18324) bm!690))

(assert (= (or b!18336 bm!681) bm!683))

(assert (= (or b!18342 b!18327) bm!687))

(assert (= (or b!18319 b!18318) bm!692))

(assert (= (or bm!686 bm!683) bm!688))

(assert (= (or b!18323 b!18342) bm!699))

(assert (= (or bm!678 bm!687) bm!685))

(assert (= (or b!18325 b!18341) bm!701))

(assert (= (or bm!696 bm!690) bm!682))

(assert (= (or b!18332 b!18327) bm!691))

(assert (= (or b!18325 b!18341) bm!693))

(assert (= (or bm!700 b!18341) bm!694))

(assert (= (or bm!679 b!18341) bm!698))

(assert (= (or bm!684 b!18341) bm!689))

(assert (= (and d!3397 res!12785) b!18320))

(assert (= (and b!18320 c!1863) b!18321))

(assert (= (and b!18320 (not c!1863)) b!18322))

(assert (= (and b!18321 res!12786) b!18308))

(assert (= (or b!18308 b!18322) bm!697))

(assert (= (or b!18321 b!18308 b!18322) bm!695))

(declare-fun m!12671 () Bool)

(assert (=> b!18341 m!12671))

(declare-fun m!12673 () Bool)

(assert (=> b!18341 m!12673))

(declare-fun m!12675 () Bool)

(assert (=> b!18341 m!12675))

(declare-fun m!12677 () Bool)

(assert (=> b!18341 m!12677))

(declare-fun m!12679 () Bool)

(assert (=> bm!697 m!12679))

(declare-fun m!12681 () Bool)

(assert (=> bm!691 m!12681))

(declare-fun m!12683 () Bool)

(assert (=> b!18338 m!12683))

(declare-fun m!12685 () Bool)

(assert (=> d!3397 m!12685))

(declare-fun m!12687 () Bool)

(assert (=> d!3397 m!12687))

(declare-fun m!12689 () Bool)

(assert (=> b!18334 m!12689))

(declare-fun m!12691 () Bool)

(assert (=> bm!692 m!12691))

(declare-fun m!12693 () Bool)

(assert (=> bm!682 m!12693))

(declare-fun m!12695 () Bool)

(assert (=> bm!688 m!12695))

(declare-fun m!12697 () Bool)

(assert (=> b!18321 m!12697))

(declare-fun m!12699 () Bool)

(assert (=> bm!701 m!12699))

(declare-fun m!12701 () Bool)

(assert (=> bm!699 m!12701))

(declare-fun m!12703 () Bool)

(assert (=> bm!694 m!12703))

(declare-fun m!12705 () Bool)

(assert (=> b!18316 m!12705))

(declare-fun m!12707 () Bool)

(assert (=> b!18315 m!12707))

(declare-fun m!12709 () Bool)

(assert (=> b!18308 m!12709))

(declare-fun m!12711 () Bool)

(assert (=> bm!693 m!12711))

(declare-fun m!12713 () Bool)

(assert (=> bm!693 m!12713))

(declare-fun m!12715 () Bool)

(assert (=> bm!689 m!12715))

(assert (=> bm!698 m!12673))

(declare-fun m!12717 () Bool)

(assert (=> bm!698 m!12717))

(declare-fun m!12719 () Bool)

(assert (=> b!18326 m!12719))

(declare-fun m!12721 () Bool)

(assert (=> bm!695 m!12721))

(declare-fun m!12723 () Bool)

(assert (=> b!18337 m!12723))

(assert (=> bm!685 m!12683))

(declare-fun m!12725 () Bool)

(assert (=> b!18314 m!12725))

(declare-fun m!12727 () Bool)

(assert (=> b!18331 m!12727))

(declare-fun m!12729 () Bool)

(assert (=> b!18328 m!12729))

(assert (=> b!18143 d!3397))

(declare-fun d!3399 () Bool)

(assert (=> d!3399 (= (array_inv!355 (_keys!3086 (v!1471 (underlying!61 thiss!848)))) (bvsge (size!579 (_keys!3086 (v!1471 (underlying!61 thiss!848)))) #b00000000000000000000000000000000))))

(assert (=> b!18136 d!3399))

(declare-fun d!3401 () Bool)

(assert (=> d!3401 (= (array_inv!356 (_values!1658 (v!1471 (underlying!61 thiss!848)))) (bvsge (size!578 (_values!1658 (v!1471 (underlying!61 thiss!848)))) #b00000000000000000000000000000000))))

(assert (=> b!18136 d!3401))

(declare-fun d!3403 () Bool)

(declare-fun e!11774 () Bool)

(assert (=> d!3403 e!11774))

(declare-fun res!12797 () Bool)

(assert (=> d!3403 (=> (not res!12797) (not e!11774))))

(declare-fun lt!4811 () ListLongMap!533)

(assert (=> d!3403 (= res!12797 (contains!213 lt!4811 (_1!397 (tuple2!793 key!682 v!259))))))

(declare-fun lt!4813 () List!535)

(assert (=> d!3403 (= lt!4811 (ListLongMap!534 lt!4813))))

(declare-fun lt!4810 () Unit!362)

(declare-fun lt!4812 () Unit!362)

(assert (=> d!3403 (= lt!4810 lt!4812)))

(declare-datatypes ((Option!65 0))(
  ( (Some!64 (v!1480 V!1043)) (None!63) )
))
(declare-fun getValueByKey!59 (List!535 (_ BitVec 64)) Option!65)

(assert (=> d!3403 (= (getValueByKey!59 lt!4813 (_1!397 (tuple2!793 key!682 v!259))) (Some!64 (_2!397 (tuple2!793 key!682 v!259))))))

(declare-fun lemmaContainsTupThenGetReturnValue!16 (List!535 (_ BitVec 64) V!1043) Unit!362)

(assert (=> d!3403 (= lt!4812 (lemmaContainsTupThenGetReturnValue!16 lt!4813 (_1!397 (tuple2!793 key!682 v!259)) (_2!397 (tuple2!793 key!682 v!259))))))

(declare-fun insertStrictlySorted!16 (List!535 (_ BitVec 64) V!1043) List!535)

(assert (=> d!3403 (= lt!4813 (insertStrictlySorted!16 (toList!282 call!619) (_1!397 (tuple2!793 key!682 v!259)) (_2!397 (tuple2!793 key!682 v!259))))))

(assert (=> d!3403 (= (+!34 call!619 (tuple2!793 key!682 v!259)) lt!4811)))

(declare-fun b!18350 () Bool)

(declare-fun res!12798 () Bool)

(assert (=> b!18350 (=> (not res!12798) (not e!11774))))

(assert (=> b!18350 (= res!12798 (= (getValueByKey!59 (toList!282 lt!4811) (_1!397 (tuple2!793 key!682 v!259))) (Some!64 (_2!397 (tuple2!793 key!682 v!259)))))))

(declare-fun b!18351 () Bool)

(declare-fun contains!216 (List!535 tuple2!792) Bool)

(assert (=> b!18351 (= e!11774 (contains!216 (toList!282 lt!4811) (tuple2!793 key!682 v!259)))))

(assert (= (and d!3403 res!12797) b!18350))

(assert (= (and b!18350 res!12798) b!18351))

(declare-fun m!12731 () Bool)

(assert (=> d!3403 m!12731))

(declare-fun m!12733 () Bool)

(assert (=> d!3403 m!12733))

(declare-fun m!12735 () Bool)

(assert (=> d!3403 m!12735))

(declare-fun m!12737 () Bool)

(assert (=> d!3403 m!12737))

(declare-fun m!12739 () Bool)

(assert (=> b!18350 m!12739))

(declare-fun m!12741 () Bool)

(assert (=> b!18351 m!12741))

(assert (=> b!18139 d!3403))

(declare-fun d!3405 () Bool)

(assert (=> d!3405 (= (imbalanced!29 thiss!848) (or (bvsgt (bvmul #b00000000000000000000000000000010 (bvadd (_size!82 (v!1471 (underlying!61 thiss!848))) (_vacant!82 (v!1471 (underlying!61 thiss!848))))) (mask!4594 (v!1471 (underlying!61 thiss!848)))) (bvsgt (_vacant!82 (v!1471 (underlying!61 thiss!848))) (_size!82 (v!1471 (underlying!61 thiss!848))))))))

(assert (=> b!18141 d!3405))

(declare-fun d!3407 () Bool)

(declare-fun e!11780 () Bool)

(assert (=> d!3407 e!11780))

(declare-fun res!12801 () Bool)

(assert (=> d!3407 (=> res!12801 e!11780)))

(declare-fun lt!4824 () Bool)

(assert (=> d!3407 (= res!12801 (not lt!4824))))

(declare-fun lt!4822 () Bool)

(assert (=> d!3407 (= lt!4824 lt!4822)))

(declare-fun lt!4825 () Unit!362)

(declare-fun e!11779 () Unit!362)

(assert (=> d!3407 (= lt!4825 e!11779)))

(declare-fun c!1866 () Bool)

(assert (=> d!3407 (= c!1866 lt!4822)))

(declare-fun containsKey!23 (List!535 (_ BitVec 64)) Bool)

(assert (=> d!3407 (= lt!4822 (containsKey!23 (toList!282 lt!4693) key!682))))

(assert (=> d!3407 (= (contains!213 lt!4693 key!682) lt!4824)))

(declare-fun b!18358 () Bool)

(declare-fun lt!4823 () Unit!362)

(assert (=> b!18358 (= e!11779 lt!4823)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!20 (List!535 (_ BitVec 64)) Unit!362)

(assert (=> b!18358 (= lt!4823 (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!282 lt!4693) key!682))))

(declare-fun isDefined!21 (Option!65) Bool)

(assert (=> b!18358 (isDefined!21 (getValueByKey!59 (toList!282 lt!4693) key!682))))

(declare-fun b!18359 () Bool)

(declare-fun Unit!366 () Unit!362)

(assert (=> b!18359 (= e!11779 Unit!366)))

(declare-fun b!18360 () Bool)

(assert (=> b!18360 (= e!11780 (isDefined!21 (getValueByKey!59 (toList!282 lt!4693) key!682)))))

(assert (= (and d!3407 c!1866) b!18358))

(assert (= (and d!3407 (not c!1866)) b!18359))

(assert (= (and d!3407 (not res!12801)) b!18360))

(declare-fun m!12743 () Bool)

(assert (=> d!3407 m!12743))

(declare-fun m!12745 () Bool)

(assert (=> b!18358 m!12745))

(declare-fun m!12747 () Bool)

(assert (=> b!18358 m!12747))

(assert (=> b!18358 m!12747))

(declare-fun m!12749 () Bool)

(assert (=> b!18358 m!12749))

(assert (=> b!18360 m!12747))

(assert (=> b!18360 m!12747))

(assert (=> b!18360 m!12749))

(assert (=> b!18145 d!3407))

(declare-fun b!18379 () Bool)

(declare-datatypes ((tuple2!808 0))(
  ( (tuple2!809 (_1!405 Bool) (_2!405 Cell!100)) )
))
(declare-fun e!11794 () tuple2!808)

(declare-fun lt!4855 () tuple2!794)

(assert (=> b!18379 (= e!11794 (tuple2!809 (_1!398 lt!4855) (Cell!101 (_2!398 lt!4855))))))

(declare-fun call!715 () tuple2!794)

(assert (=> b!18379 (= lt!4855 call!715)))

(declare-fun d!3409 () Bool)

(declare-fun e!11795 () Bool)

(assert (=> d!3409 e!11795))

(declare-fun res!12804 () Bool)

(assert (=> d!3409 (=> res!12804 e!11795)))

(declare-fun lt!4854 () tuple2!790)

(assert (=> d!3409 (= res!12804 (= (_1!396 lt!4854) false))))

(declare-datatypes ((tuple3!2 0))(
  ( (tuple3!3 (_1!406 Bool) (_2!406 Cell!100) (_3!1 LongMap!100)) )
))
(declare-fun lt!4848 () tuple3!2)

(assert (=> d!3409 (= lt!4854 (tuple2!791 (_1!406 lt!4848) (_3!1 lt!4848)))))

(declare-fun e!11793 () tuple3!2)

(assert (=> d!3409 (= lt!4848 e!11793)))

(declare-fun c!1876 () Bool)

(declare-fun lt!4851 () tuple2!808)

(assert (=> d!3409 (= c!1876 (not (_1!405 lt!4851)))))

(declare-fun e!11792 () tuple2!808)

(assert (=> d!3409 (= lt!4851 e!11792)))

(declare-fun c!1875 () Bool)

(assert (=> d!3409 (= c!1875 (and (not (= (bvand (extraKeys!1574 (v!1471 (underlying!61 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1574 (v!1471 (underlying!61 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!4847 () Cell!100)

(declare-fun lt!4849 () (_ BitVec 32))

(declare-fun getNewLongMapFixedSize!8 ((_ BitVec 32) Int) LongMapFixedSize!100)

(assert (=> d!3409 (= lt!4847 (Cell!101 (getNewLongMapFixedSize!8 lt!4849 (defaultEntry!1661 (v!1471 (underlying!61 thiss!848))))))))

(declare-fun computeNewMask!2 (LongMap!100 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3409 (= lt!4849 (computeNewMask!2 thiss!848 (mask!4594 (v!1471 (underlying!61 thiss!848))) (_vacant!82 (v!1471 (underlying!61 thiss!848))) (_size!82 (v!1471 (underlying!61 thiss!848)))))))

(assert (=> d!3409 (valid!55 thiss!848)))

(assert (=> d!3409 (= (repack!25 thiss!848) lt!4854)))

(declare-fun bm!710 () Bool)

(declare-fun call!714 () tuple2!794)

(assert (=> bm!710 (= call!715 call!714)))

(declare-fun b!18380 () Bool)

(declare-fun e!11791 () tuple2!808)

(assert (=> b!18380 (= e!11792 e!11791)))

(declare-fun c!1877 () Bool)

(assert (=> b!18380 (= c!1877 (and (not (= (bvand (extraKeys!1574 (v!1471 (underlying!61 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1574 (v!1471 (underlying!61 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!18381 () Bool)

(assert (=> b!18381 (= e!11793 (tuple3!3 false (_2!405 lt!4851) thiss!848))))

(declare-fun b!18382 () Bool)

(assert (=> b!18382 (= e!11795 (= (map!355 (_2!396 lt!4854)) (map!355 thiss!848)))))

(declare-fun b!18383 () Bool)

(declare-fun lt!4852 () tuple2!794)

(declare-fun lt!4853 () tuple2!794)

(assert (=> b!18383 (= e!11792 (tuple2!809 (and (_1!398 lt!4852) (_1!398 lt!4853)) (Cell!101 (_2!398 lt!4853))))))

(declare-fun call!713 () LongMapFixedSize!100)

(assert (=> b!18383 (= lt!4852 (update!12 call!713 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1471 (underlying!61 thiss!848)))))))

(assert (=> b!18383 (= lt!4853 call!714)))

(declare-fun b!18384 () Bool)

(declare-fun lt!4850 () tuple2!794)

(assert (=> b!18384 (= e!11793 (ite (_1!398 lt!4850) (tuple3!3 true (underlying!61 thiss!848) (LongMap!101 (Cell!101 (_2!398 lt!4850)))) (tuple3!3 false (Cell!101 (_2!398 lt!4850)) thiss!848)))))

(declare-fun repackFrom!2 (LongMap!100 LongMapFixedSize!100 (_ BitVec 32)) tuple2!794)

(assert (=> b!18384 (= lt!4850 (repackFrom!2 thiss!848 (v!1471 (_2!405 lt!4851)) (bvsub (size!579 (_keys!3086 (v!1471 (underlying!61 thiss!848)))) #b00000000000000000000000000000001)))))

(declare-fun b!18385 () Bool)

(declare-fun c!1878 () Bool)

(assert (=> b!18385 (= c!1878 (and (not (= (bvand (extraKeys!1574 (v!1471 (underlying!61 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1574 (v!1471 (underlying!61 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!18385 (= e!11791 e!11794)))

(declare-fun b!18386 () Bool)

(assert (=> b!18386 (= e!11794 (tuple2!809 true lt!4847))))

(declare-fun b!18387 () Bool)

(declare-fun lt!4846 () tuple2!794)

(assert (=> b!18387 (= lt!4846 call!715)))

(assert (=> b!18387 (= e!11791 (tuple2!809 (_1!398 lt!4846) (Cell!101 (_2!398 lt!4846))))))

(declare-fun bm!711 () Bool)

(assert (=> bm!711 (= call!713 (getNewLongMapFixedSize!8 lt!4849 (defaultEntry!1661 (v!1471 (underlying!61 thiss!848)))))))

(declare-fun call!716 () LongMapFixedSize!100)

(declare-fun bm!712 () Bool)

(assert (=> bm!712 (= call!714 (update!12 (ite c!1875 (_2!398 lt!4852) call!716) (ite c!1875 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1877 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1875 (minValue!1597 (v!1471 (underlying!61 thiss!848))) (ite c!1877 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 (v!1471 (underlying!61 thiss!848)))))))))

(declare-fun bm!713 () Bool)

(assert (=> bm!713 (= call!716 call!713)))

(assert (= (and d!3409 c!1875) b!18383))

(assert (= (and d!3409 (not c!1875)) b!18380))

(assert (= (and b!18380 c!1877) b!18387))

(assert (= (and b!18380 (not c!1877)) b!18385))

(assert (= (and b!18385 c!1878) b!18379))

(assert (= (and b!18385 (not c!1878)) b!18386))

(assert (= (or b!18387 b!18379) bm!713))

(assert (= (or b!18387 b!18379) bm!710))

(assert (= (or b!18383 bm!710) bm!712))

(assert (= (or b!18383 bm!713) bm!711))

(assert (= (and d!3409 c!1876) b!18381))

(assert (= (and d!3409 (not c!1876)) b!18384))

(assert (= (and d!3409 (not res!12804)) b!18382))

(declare-fun m!12751 () Bool)

(assert (=> b!18383 m!12751))

(declare-fun m!12753 () Bool)

(assert (=> bm!711 m!12753))

(declare-fun m!12755 () Bool)

(assert (=> b!18382 m!12755))

(assert (=> b!18382 m!12593))

(assert (=> d!3409 m!12753))

(declare-fun m!12757 () Bool)

(assert (=> d!3409 m!12757))

(assert (=> d!3409 m!12591))

(declare-fun m!12759 () Bool)

(assert (=> bm!712 m!12759))

(declare-fun m!12761 () Bool)

(assert (=> b!18384 m!12761))

(assert (=> b!18134 d!3409))

(declare-fun b!18394 () Bool)

(declare-fun e!11800 () Bool)

(assert (=> b!18394 (= e!11800 tp_is_empty!913)))

(declare-fun mapNonEmpty!813 () Bool)

(declare-fun mapRes!813 () Bool)

(declare-fun tp!3153 () Bool)

(assert (=> mapNonEmpty!813 (= mapRes!813 (and tp!3153 e!11800))))

(declare-fun mapRest!813 () (Array (_ BitVec 32) ValueCell!257))

(declare-fun mapKey!813 () (_ BitVec 32))

(declare-fun mapValue!813 () ValueCell!257)

(assert (=> mapNonEmpty!813 (= mapRest!804 (store mapRest!813 mapKey!813 mapValue!813))))

(declare-fun b!18395 () Bool)

(declare-fun e!11801 () Bool)

(assert (=> b!18395 (= e!11801 tp_is_empty!913)))

(declare-fun mapIsEmpty!813 () Bool)

(assert (=> mapIsEmpty!813 mapRes!813))

(declare-fun condMapEmpty!813 () Bool)

(declare-fun mapDefault!813 () ValueCell!257)

(assert (=> mapNonEmpty!804 (= condMapEmpty!813 (= mapRest!804 ((as const (Array (_ BitVec 32) ValueCell!257)) mapDefault!813)))))

(assert (=> mapNonEmpty!804 (= tp!3138 (and e!11801 mapRes!813))))

(assert (= (and mapNonEmpty!804 condMapEmpty!813) mapIsEmpty!813))

(assert (= (and mapNonEmpty!804 (not condMapEmpty!813)) mapNonEmpty!813))

(assert (= (and mapNonEmpty!813 ((_ is ValueCellFull!257) mapValue!813)) b!18394))

(assert (= (and mapNonEmpty!804 ((_ is ValueCellFull!257) mapDefault!813)) b!18395))

(declare-fun m!12763 () Bool)

(assert (=> mapNonEmpty!813 m!12763))

(check-sat (not bm!697) (not mapNonEmpty!813) (not bm!692) (not bm!682) (not b!18338) tp_is_empty!913 (not b!18350) (not bm!689) (not bm!698) (not d!3391) (not b!18383) (not d!3407) (not d!3395) (not bm!695) (not d!3393) (not bm!701) (not bm!685) (not bm!691) (not d!3397) (not b!18334) (not b!18341) (not d!3389) (not d!3403) (not bm!688) (not bm!712) (not b!18321) (not bm!693) (not b_next!649) (not b!18384) (not b!18358) (not b!18382) (not d!3409) (not bm!699) (not b!18351) b_and!1291 (not b!18360) (not bm!711) (not bm!694) (not b!18308) (not b!18331))
(check-sat b_and!1291 (not b_next!649))
(get-model)

(declare-fun d!3411 () Bool)

(assert (=> d!3411 (= (map!358 (v!1471 (underlying!61 (_2!396 lt!4694)))) (getCurrentListMap!119 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun bs!842 () Bool)

(assert (= bs!842 d!3411))

(assert (=> bs!842 m!12703))

(assert (=> bm!697 d!3411))

(declare-fun d!3413 () Bool)

(assert (=> d!3413 (= (map!355 (_2!396 lt!4854)) (map!358 (v!1471 (underlying!61 (_2!396 lt!4854)))))))

(declare-fun bs!843 () Bool)

(assert (= bs!843 d!3413))

(declare-fun m!12765 () Bool)

(assert (=> bs!843 m!12765))

(assert (=> b!18382 d!3413))

(assert (=> b!18382 d!3393))

(declare-fun d!3415 () Bool)

(declare-fun e!11802 () Bool)

(assert (=> d!3415 e!11802))

(declare-fun res!12805 () Bool)

(assert (=> d!3415 (=> (not res!12805) (not e!11802))))

(declare-fun lt!4857 () ListLongMap!533)

(assert (=> d!3415 (= res!12805 (contains!213 lt!4857 (_1!397 (tuple2!793 key!682 v!259))))))

(declare-fun lt!4859 () List!535)

(assert (=> d!3415 (= lt!4857 (ListLongMap!534 lt!4859))))

(declare-fun lt!4856 () Unit!362)

(declare-fun lt!4858 () Unit!362)

(assert (=> d!3415 (= lt!4856 lt!4858)))

(assert (=> d!3415 (= (getValueByKey!59 lt!4859 (_1!397 (tuple2!793 key!682 v!259))) (Some!64 (_2!397 (tuple2!793 key!682 v!259))))))

(assert (=> d!3415 (= lt!4858 (lemmaContainsTupThenGetReturnValue!16 lt!4859 (_1!397 (tuple2!793 key!682 v!259)) (_2!397 (tuple2!793 key!682 v!259))))))

(assert (=> d!3415 (= lt!4859 (insertStrictlySorted!16 (toList!282 call!697) (_1!397 (tuple2!793 key!682 v!259)) (_2!397 (tuple2!793 key!682 v!259))))))

(assert (=> d!3415 (= (+!34 call!697 (tuple2!793 key!682 v!259)) lt!4857)))

(declare-fun b!18396 () Bool)

(declare-fun res!12806 () Bool)

(assert (=> b!18396 (=> (not res!12806) (not e!11802))))

(assert (=> b!18396 (= res!12806 (= (getValueByKey!59 (toList!282 lt!4857) (_1!397 (tuple2!793 key!682 v!259))) (Some!64 (_2!397 (tuple2!793 key!682 v!259)))))))

(declare-fun b!18397 () Bool)

(assert (=> b!18397 (= e!11802 (contains!216 (toList!282 lt!4857) (tuple2!793 key!682 v!259)))))

(assert (= (and d!3415 res!12805) b!18396))

(assert (= (and b!18396 res!12806) b!18397))

(declare-fun m!12767 () Bool)

(assert (=> d!3415 m!12767))

(declare-fun m!12769 () Bool)

(assert (=> d!3415 m!12769))

(declare-fun m!12771 () Bool)

(assert (=> d!3415 m!12771))

(declare-fun m!12773 () Bool)

(assert (=> d!3415 m!12773))

(declare-fun m!12775 () Bool)

(assert (=> b!18396 m!12775))

(declare-fun m!12777 () Bool)

(assert (=> b!18397 m!12777))

(assert (=> b!18308 d!3415))

(declare-fun d!3417 () Bool)

(assert (=> d!3417 (= (+!34 (getCurrentListMap!119 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))) (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 v!259)) (getCurrentListMap!119 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4788 v!259 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun lt!4862 () Unit!362)

(declare-fun choose!187 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 V!1043 Int) Unit!362)

(assert (=> d!3417 (= lt!4862 (choose!187 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4788 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!3417 (validMask!0 (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))))))

(assert (=> d!3417 (= (lemmaChangeZeroKeyThenAddPairToListMap!2 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4788 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))) lt!4862)))

(declare-fun bs!844 () Bool)

(assert (= bs!844 d!3417))

(assert (=> bs!844 m!12703))

(declare-fun m!12779 () Bool)

(assert (=> bs!844 m!12779))

(declare-fun m!12781 () Bool)

(assert (=> bs!844 m!12781))

(declare-fun m!12783 () Bool)

(assert (=> bs!844 m!12783))

(assert (=> bs!844 m!12703))

(declare-fun m!12785 () Bool)

(assert (=> bs!844 m!12785))

(assert (=> b!18331 d!3417))

(declare-fun d!3419 () Bool)

(declare-fun e!11804 () Bool)

(assert (=> d!3419 e!11804))

(declare-fun res!12807 () Bool)

(assert (=> d!3419 (=> res!12807 e!11804)))

(declare-fun lt!4865 () Bool)

(assert (=> d!3419 (= res!12807 (not lt!4865))))

(declare-fun lt!4863 () Bool)

(assert (=> d!3419 (= lt!4865 lt!4863)))

(declare-fun lt!4866 () Unit!362)

(declare-fun e!11803 () Unit!362)

(assert (=> d!3419 (= lt!4866 e!11803)))

(declare-fun c!1879 () Bool)

(assert (=> d!3419 (= c!1879 lt!4863)))

(assert (=> d!3419 (= lt!4863 (containsKey!23 (toList!282 call!685) key!682))))

(assert (=> d!3419 (= (contains!213 call!685 key!682) lt!4865)))

(declare-fun b!18398 () Bool)

(declare-fun lt!4864 () Unit!362)

(assert (=> b!18398 (= e!11803 lt!4864)))

(assert (=> b!18398 (= lt!4864 (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!282 call!685) key!682))))

(assert (=> b!18398 (isDefined!21 (getValueByKey!59 (toList!282 call!685) key!682))))

(declare-fun b!18399 () Bool)

(declare-fun Unit!367 () Unit!362)

(assert (=> b!18399 (= e!11803 Unit!367)))

(declare-fun b!18400 () Bool)

(assert (=> b!18400 (= e!11804 (isDefined!21 (getValueByKey!59 (toList!282 call!685) key!682)))))

(assert (= (and d!3419 c!1879) b!18398))

(assert (= (and d!3419 (not c!1879)) b!18399))

(assert (= (and d!3419 (not res!12807)) b!18400))

(declare-fun m!12787 () Bool)

(assert (=> d!3419 m!12787))

(declare-fun m!12789 () Bool)

(assert (=> b!18398 m!12789))

(declare-fun m!12791 () Bool)

(assert (=> b!18398 m!12791))

(assert (=> b!18398 m!12791))

(declare-fun m!12793 () Bool)

(assert (=> b!18398 m!12793))

(assert (=> b!18400 m!12791))

(assert (=> b!18400 m!12791))

(assert (=> b!18400 m!12793))

(assert (=> b!18321 d!3419))

(declare-fun d!3421 () Bool)

(declare-fun res!12814 () Bool)

(declare-fun e!11807 () Bool)

(assert (=> d!3421 (=> (not res!12814) (not e!11807))))

(declare-fun simpleValid!9 (LongMapFixedSize!100) Bool)

(assert (=> d!3421 (= res!12814 (simpleValid!9 (v!1471 (underlying!61 lt!4696))))))

(assert (=> d!3421 (= (valid!58 (v!1471 (underlying!61 lt!4696))) e!11807)))

(declare-fun b!18407 () Bool)

(declare-fun res!12815 () Bool)

(assert (=> b!18407 (=> (not res!12815) (not e!11807))))

(declare-fun arrayCountValidKeys!0 (array!1015 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!18407 (= res!12815 (= (arrayCountValidKeys!0 (_keys!3086 (v!1471 (underlying!61 lt!4696))) #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 lt!4696))))) (_size!82 (v!1471 (underlying!61 lt!4696)))))))

(declare-fun b!18408 () Bool)

(declare-fun res!12816 () Bool)

(assert (=> b!18408 (=> (not res!12816) (not e!11807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1015 (_ BitVec 32)) Bool)

(assert (=> b!18408 (= res!12816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3086 (v!1471 (underlying!61 lt!4696))) (mask!4594 (v!1471 (underlying!61 lt!4696)))))))

(declare-fun b!18409 () Bool)

(declare-datatypes ((List!538 0))(
  ( (Nil!535) (Cons!534 (h!1100 (_ BitVec 64)) (t!3175 List!538)) )
))
(declare-fun arrayNoDuplicates!0 (array!1015 (_ BitVec 32) List!538) Bool)

(assert (=> b!18409 (= e!11807 (arrayNoDuplicates!0 (_keys!3086 (v!1471 (underlying!61 lt!4696))) #b00000000000000000000000000000000 Nil!535))))

(assert (= (and d!3421 res!12814) b!18407))

(assert (= (and b!18407 res!12815) b!18408))

(assert (= (and b!18408 res!12816) b!18409))

(declare-fun m!12795 () Bool)

(assert (=> d!3421 m!12795))

(declare-fun m!12797 () Bool)

(assert (=> b!18407 m!12797))

(declare-fun m!12799 () Bool)

(assert (=> b!18408 m!12799))

(declare-fun m!12801 () Bool)

(assert (=> b!18409 m!12801))

(assert (=> d!3395 d!3421))

(declare-fun d!3423 () Bool)

(assert (=> d!3423 (= (map!358 (v!1471 (underlying!61 lt!4696))) (getCurrentListMap!119 (_keys!3086 (v!1471 (underlying!61 lt!4696))) (_values!1658 (v!1471 (underlying!61 lt!4696))) (mask!4594 (v!1471 (underlying!61 lt!4696))) (extraKeys!1574 (v!1471 (underlying!61 lt!4696))) (zeroValue!1597 (v!1471 (underlying!61 lt!4696))) (minValue!1597 (v!1471 (underlying!61 lt!4696))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 lt!4696)))))))

(declare-fun bs!845 () Bool)

(assert (= bs!845 d!3423))

(declare-fun m!12803 () Bool)

(assert (=> bs!845 m!12803))

(assert (=> d!3389 d!3423))

(declare-fun b!18452 () Bool)

(declare-fun e!11838 () Unit!362)

(declare-fun lt!4913 () Unit!362)

(assert (=> b!18452 (= e!11838 lt!4913)))

(declare-fun lt!4914 () ListLongMap!533)

(declare-fun getCurrentListMapNoExtraKeys!12 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 32) Int) ListLongMap!533)

(assert (=> b!18452 (= lt!4914 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun lt!4912 () (_ BitVec 64))

(assert (=> b!18452 (= lt!4912 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4923 () (_ BitVec 64))

(assert (=> b!18452 (= lt!4923 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000))))

(declare-fun lt!4930 () Unit!362)

(declare-fun addStillContains!12 (ListLongMap!533 (_ BitVec 64) V!1043 (_ BitVec 64)) Unit!362)

(assert (=> b!18452 (= lt!4930 (addStillContains!12 lt!4914 lt!4912 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4923))))

(assert (=> b!18452 (contains!213 (+!34 lt!4914 (tuple2!793 lt!4912 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))))) lt!4923)))

(declare-fun lt!4928 () Unit!362)

(assert (=> b!18452 (= lt!4928 lt!4930)))

(declare-fun lt!4929 () ListLongMap!533)

(assert (=> b!18452 (= lt!4929 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun lt!4911 () (_ BitVec 64))

(assert (=> b!18452 (= lt!4911 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4920 () (_ BitVec 64))

(assert (=> b!18452 (= lt!4920 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000))))

(declare-fun lt!4919 () Unit!362)

(declare-fun addApplyDifferent!12 (ListLongMap!533 (_ BitVec 64) V!1043 (_ BitVec 64)) Unit!362)

(assert (=> b!18452 (= lt!4919 (addApplyDifferent!12 lt!4929 lt!4911 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4920))))

(declare-fun apply!27 (ListLongMap!533 (_ BitVec 64)) V!1043)

(assert (=> b!18452 (= (apply!27 (+!34 lt!4929 (tuple2!793 lt!4911 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))))) lt!4920) (apply!27 lt!4929 lt!4920))))

(declare-fun lt!4917 () Unit!362)

(assert (=> b!18452 (= lt!4917 lt!4919)))

(declare-fun lt!4916 () ListLongMap!533)

(assert (=> b!18452 (= lt!4916 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun lt!4932 () (_ BitVec 64))

(assert (=> b!18452 (= lt!4932 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4918 () (_ BitVec 64))

(assert (=> b!18452 (= lt!4918 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000))))

(declare-fun lt!4927 () Unit!362)

(assert (=> b!18452 (= lt!4927 (addApplyDifferent!12 lt!4916 lt!4932 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4918))))

(assert (=> b!18452 (= (apply!27 (+!34 lt!4916 (tuple2!793 lt!4932 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))))) lt!4918) (apply!27 lt!4916 lt!4918))))

(declare-fun lt!4922 () Unit!362)

(assert (=> b!18452 (= lt!4922 lt!4927)))

(declare-fun lt!4925 () ListLongMap!533)

(assert (=> b!18452 (= lt!4925 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun lt!4926 () (_ BitVec 64))

(assert (=> b!18452 (= lt!4926 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4921 () (_ BitVec 64))

(assert (=> b!18452 (= lt!4921 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000))))

(assert (=> b!18452 (= lt!4913 (addApplyDifferent!12 lt!4925 lt!4926 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4921))))

(assert (=> b!18452 (= (apply!27 (+!34 lt!4925 (tuple2!793 lt!4926 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))))) lt!4921) (apply!27 lt!4925 lt!4921))))

(declare-fun b!18453 () Bool)

(declare-fun Unit!368 () Unit!362)

(assert (=> b!18453 (= e!11838 Unit!368)))

(declare-fun bm!728 () Bool)

(declare-fun call!737 () ListLongMap!533)

(declare-fun call!732 () ListLongMap!533)

(assert (=> bm!728 (= call!737 call!732)))

(declare-fun bm!729 () Bool)

(declare-fun call!733 () Bool)

(declare-fun lt!4931 () ListLongMap!533)

(assert (=> bm!729 (= call!733 (contains!213 lt!4931 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!730 () Bool)

(declare-fun call!734 () ListLongMap!533)

(declare-fun c!1896 () Bool)

(declare-fun c!1894 () Bool)

(declare-fun call!731 () ListLongMap!533)

(assert (=> bm!730 (= call!731 (+!34 (ite c!1896 call!732 (ite c!1894 call!737 call!734)) (ite (or c!1896 c!1894) (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))) (tuple2!793 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))))))))

(declare-fun b!18454 () Bool)

(declare-fun e!11846 () ListLongMap!533)

(assert (=> b!18454 (= e!11846 call!734)))

(declare-fun b!18455 () Bool)

(declare-fun e!11843 () Bool)

(assert (=> b!18455 (= e!11843 (not call!733))))

(declare-fun b!18456 () Bool)

(declare-fun e!11841 () Bool)

(assert (=> b!18456 (= e!11841 (= (apply!27 lt!4931 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun b!18457 () Bool)

(declare-fun res!12839 () Bool)

(declare-fun e!11845 () Bool)

(assert (=> b!18457 (=> (not res!12839) (not e!11845))))

(assert (=> b!18457 (= res!12839 e!11843)))

(declare-fun c!1897 () Bool)

(assert (=> b!18457 (= c!1897 (not (= (bvand (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!18458 () Bool)

(declare-fun call!735 () ListLongMap!533)

(assert (=> b!18458 (= e!11846 call!735)))

(declare-fun b!18459 () Bool)

(declare-fun e!11840 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!18459 (= e!11840 (validKeyInArray!0 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000)))))

(declare-fun b!18460 () Bool)

(declare-fun e!11842 () Bool)

(declare-fun call!736 () Bool)

(assert (=> b!18460 (= e!11842 (not call!736))))

(declare-fun b!18461 () Bool)

(declare-fun c!1895 () Bool)

(assert (=> b!18461 (= c!1895 (and (not (= (bvand (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!11834 () ListLongMap!533)

(assert (=> b!18461 (= e!11834 e!11846)))

(declare-fun b!18462 () Bool)

(declare-fun e!11835 () Bool)

(assert (=> b!18462 (= e!11835 (validKeyInArray!0 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000)))))

(declare-fun b!18463 () Bool)

(declare-fun e!11844 () Bool)

(assert (=> b!18463 (= e!11844 (= (apply!27 lt!4931 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun b!18464 () Bool)

(assert (=> b!18464 (= e!11843 e!11841)))

(declare-fun res!12840 () Bool)

(assert (=> b!18464 (= res!12840 call!733)))

(assert (=> b!18464 (=> (not res!12840) (not e!11841))))

(declare-fun b!18465 () Bool)

(declare-fun e!11836 () ListLongMap!533)

(assert (=> b!18465 (= e!11836 e!11834)))

(assert (=> b!18465 (= c!1894 (and (not (= (bvand (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!18466 () Bool)

(declare-fun e!11837 () Bool)

(declare-fun get!348 (ValueCell!257 V!1043) V!1043)

(declare-fun dynLambda!129 (Int (_ BitVec 64)) V!1043)

(assert (=> b!18466 (= e!11837 (= (apply!27 lt!4931 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000)) (get!348 (select (arr!488 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000) (dynLambda!129 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!18466 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!578 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(assert (=> b!18466 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun bm!732 () Bool)

(assert (=> bm!732 (= call!734 call!737)))

(declare-fun bm!733 () Bool)

(assert (=> bm!733 (= call!736 (contains!213 lt!4931 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!734 () Bool)

(assert (=> bm!734 (= call!735 call!731)))

(declare-fun b!18467 () Bool)

(declare-fun res!12837 () Bool)

(assert (=> b!18467 (=> (not res!12837) (not e!11845))))

(declare-fun e!11839 () Bool)

(assert (=> b!18467 (= res!12837 e!11839)))

(declare-fun res!12838 () Bool)

(assert (=> b!18467 (=> res!12838 e!11839)))

(assert (=> b!18467 (= res!12838 (not e!11835))))

(declare-fun res!12841 () Bool)

(assert (=> b!18467 (=> (not res!12841) (not e!11835))))

(assert (=> b!18467 (= res!12841 (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun b!18468 () Bool)

(assert (=> b!18468 (= e!11845 e!11842)))

(declare-fun c!1892 () Bool)

(assert (=> b!18468 (= c!1892 (not (= (bvand (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!3425 () Bool)

(assert (=> d!3425 e!11845))

(declare-fun res!12842 () Bool)

(assert (=> d!3425 (=> (not res!12842) (not e!11845))))

(assert (=> d!3425 (= res!12842 (or (bvsge #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))))

(declare-fun lt!4924 () ListLongMap!533)

(assert (=> d!3425 (= lt!4931 lt!4924)))

(declare-fun lt!4915 () Unit!362)

(assert (=> d!3425 (= lt!4915 e!11838)))

(declare-fun c!1893 () Bool)

(assert (=> d!3425 (= c!1893 e!11840)))

(declare-fun res!12835 () Bool)

(assert (=> d!3425 (=> (not res!12835) (not e!11840))))

(assert (=> d!3425 (= res!12835 (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(assert (=> d!3425 (= lt!4924 e!11836)))

(assert (=> d!3425 (= c!1896 (and (not (= (bvand (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3425 (validMask!0 (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))))))

(assert (=> d!3425 (= (getCurrentListMap!119 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))) lt!4931)))

(declare-fun bm!731 () Bool)

(assert (=> bm!731 (= call!732 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun b!18469 () Bool)

(assert (=> b!18469 (= e!11842 e!11844)))

(declare-fun res!12843 () Bool)

(assert (=> b!18469 (= res!12843 call!736)))

(assert (=> b!18469 (=> (not res!12843) (not e!11844))))

(declare-fun b!18470 () Bool)

(assert (=> b!18470 (= e!11839 e!11837)))

(declare-fun res!12836 () Bool)

(assert (=> b!18470 (=> (not res!12836) (not e!11837))))

(assert (=> b!18470 (= res!12836 (contains!213 lt!4931 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000)))))

(assert (=> b!18470 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun b!18471 () Bool)

(assert (=> b!18471 (= e!11834 call!735)))

(declare-fun b!18472 () Bool)

(assert (=> b!18472 (= e!11836 (+!34 call!731 (tuple2!793 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(assert (= (and d!3425 c!1896) b!18472))

(assert (= (and d!3425 (not c!1896)) b!18465))

(assert (= (and b!18465 c!1894) b!18471))

(assert (= (and b!18465 (not c!1894)) b!18461))

(assert (= (and b!18461 c!1895) b!18458))

(assert (= (and b!18461 (not c!1895)) b!18454))

(assert (= (or b!18458 b!18454) bm!732))

(assert (= (or b!18471 bm!732) bm!728))

(assert (= (or b!18471 b!18458) bm!734))

(assert (= (or b!18472 bm!728) bm!731))

(assert (= (or b!18472 bm!734) bm!730))

(assert (= (and d!3425 res!12835) b!18459))

(assert (= (and d!3425 c!1893) b!18452))

(assert (= (and d!3425 (not c!1893)) b!18453))

(assert (= (and d!3425 res!12842) b!18467))

(assert (= (and b!18467 res!12841) b!18462))

(assert (= (and b!18467 (not res!12838)) b!18470))

(assert (= (and b!18470 res!12836) b!18466))

(assert (= (and b!18467 res!12837) b!18457))

(assert (= (and b!18457 c!1897) b!18464))

(assert (= (and b!18457 (not c!1897)) b!18455))

(assert (= (and b!18464 res!12840) b!18456))

(assert (= (or b!18464 b!18455) bm!729))

(assert (= (and b!18457 res!12839) b!18468))

(assert (= (and b!18468 c!1892) b!18469))

(assert (= (and b!18468 (not c!1892)) b!18460))

(assert (= (and b!18469 res!12843) b!18463))

(assert (= (or b!18469 b!18460) bm!733))

(declare-fun b_lambda!1435 () Bool)

(assert (=> (not b_lambda!1435) (not b!18466)))

(declare-fun t!3172 () Bool)

(declare-fun tb!621 () Bool)

(assert (=> (and b!18136 (= (defaultEntry!1661 (v!1471 (underlying!61 thiss!848))) (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))) t!3172) tb!621))

(declare-fun result!1005 () Bool)

(assert (=> tb!621 (= result!1005 tp_is_empty!913)))

(assert (=> b!18466 t!3172))

(declare-fun b_and!1297 () Bool)

(assert (= b_and!1291 (and (=> t!3172 result!1005) b_and!1297)))

(declare-fun m!12805 () Bool)

(assert (=> bm!730 m!12805))

(declare-fun m!12807 () Bool)

(assert (=> b!18463 m!12807))

(declare-fun m!12809 () Bool)

(assert (=> b!18470 m!12809))

(assert (=> b!18470 m!12809))

(declare-fun m!12811 () Bool)

(assert (=> b!18470 m!12811))

(declare-fun m!12813 () Bool)

(assert (=> b!18466 m!12813))

(declare-fun m!12815 () Bool)

(assert (=> b!18466 m!12815))

(assert (=> b!18466 m!12809))

(assert (=> b!18466 m!12813))

(assert (=> b!18466 m!12815))

(declare-fun m!12817 () Bool)

(assert (=> b!18466 m!12817))

(assert (=> b!18466 m!12809))

(declare-fun m!12819 () Bool)

(assert (=> b!18466 m!12819))

(declare-fun m!12821 () Bool)

(assert (=> b!18472 m!12821))

(assert (=> d!3425 m!12779))

(declare-fun m!12823 () Bool)

(assert (=> b!18456 m!12823))

(assert (=> b!18459 m!12809))

(assert (=> b!18459 m!12809))

(declare-fun m!12825 () Bool)

(assert (=> b!18459 m!12825))

(declare-fun m!12827 () Bool)

(assert (=> bm!733 m!12827))

(declare-fun m!12829 () Bool)

(assert (=> bm!731 m!12829))

(declare-fun m!12831 () Bool)

(assert (=> bm!729 m!12831))

(declare-fun m!12833 () Bool)

(assert (=> b!18452 m!12833))

(declare-fun m!12835 () Bool)

(assert (=> b!18452 m!12835))

(declare-fun m!12837 () Bool)

(assert (=> b!18452 m!12837))

(declare-fun m!12839 () Bool)

(assert (=> b!18452 m!12839))

(declare-fun m!12841 () Bool)

(assert (=> b!18452 m!12841))

(assert (=> b!18452 m!12809))

(declare-fun m!12843 () Bool)

(assert (=> b!18452 m!12843))

(assert (=> b!18452 m!12837))

(declare-fun m!12845 () Bool)

(assert (=> b!18452 m!12845))

(declare-fun m!12847 () Bool)

(assert (=> b!18452 m!12847))

(assert (=> b!18452 m!12829))

(declare-fun m!12849 () Bool)

(assert (=> b!18452 m!12849))

(declare-fun m!12851 () Bool)

(assert (=> b!18452 m!12851))

(declare-fun m!12853 () Bool)

(assert (=> b!18452 m!12853))

(declare-fun m!12855 () Bool)

(assert (=> b!18452 m!12855))

(declare-fun m!12857 () Bool)

(assert (=> b!18452 m!12857))

(assert (=> b!18452 m!12845))

(assert (=> b!18452 m!12835))

(declare-fun m!12859 () Bool)

(assert (=> b!18452 m!12859))

(declare-fun m!12861 () Bool)

(assert (=> b!18452 m!12861))

(assert (=> b!18452 m!12849))

(assert (=> b!18462 m!12809))

(assert (=> b!18462 m!12809))

(assert (=> b!18462 m!12825))

(assert (=> bm!694 d!3425))

(declare-fun d!3427 () Bool)

(assert (=> d!3427 (= (map!358 (_2!398 lt!4785)) (getCurrentListMap!119 (_keys!3086 (_2!398 lt!4785)) (_values!1658 (_2!398 lt!4785)) (mask!4594 (_2!398 lt!4785)) (extraKeys!1574 (_2!398 lt!4785)) (zeroValue!1597 (_2!398 lt!4785)) (minValue!1597 (_2!398 lt!4785)) #b00000000000000000000000000000000 (defaultEntry!1661 (_2!398 lt!4785))))))

(declare-fun bs!846 () Bool)

(assert (= bs!846 d!3427))

(declare-fun m!12863 () Bool)

(assert (=> bs!846 m!12863))

(assert (=> bm!695 d!3427))

(declare-fun b!18503 () Bool)

(declare-fun e!11864 () tuple2!794)

(declare-fun lt!5024 () tuple2!794)

(assert (=> b!18503 (= e!11864 (tuple2!795 false (_2!398 lt!5024)))))

(declare-fun call!764 () ListLongMap!533)

(declare-fun lt!4997 () (_ BitVec 64))

(declare-fun bm!761 () Bool)

(declare-fun lt!5011 () (_ BitVec 64))

(declare-fun call!774 () ListLongMap!533)

(declare-fun c!1911 () Bool)

(declare-fun lt!5010 () V!1043)

(declare-fun call!776 () ListLongMap!533)

(assert (=> bm!761 (= call!764 (+!34 (ite c!1911 call!776 call!774) (ite c!1911 (tuple2!793 lt!5011 (zeroValue!1597 (v!1471 (underlying!61 thiss!848)))) (tuple2!793 lt!4997 lt!5010))))))

(declare-fun bm!762 () Bool)

(declare-fun lt!5025 () (_ BitVec 64))

(declare-fun call!770 () ListLongMap!533)

(assert (=> bm!762 (= call!770 (+!34 (ite c!1911 call!774 call!776) (ite c!1911 (tuple2!793 lt!4997 lt!5010) (tuple2!793 lt!5025 (zeroValue!1597 (v!1471 (underlying!61 thiss!848)))))))))

(declare-fun b!18504 () Bool)

(declare-fun e!11868 () Bool)

(declare-fun e!11870 () Bool)

(assert (=> b!18504 (= e!11868 e!11870)))

(declare-fun res!12848 () Bool)

(assert (=> b!18504 (=> (not res!12848) (not e!11870))))

(declare-fun lt!5009 () tuple2!794)

(assert (=> b!18504 (= res!12848 (valid!58 (_2!398 lt!5009)))))

(declare-fun b!18505 () Bool)

(declare-fun e!11865 () Unit!362)

(declare-fun Unit!369 () Unit!362)

(assert (=> b!18505 (= e!11865 Unit!369)))

(declare-fun b!18506 () Bool)

(declare-fun e!11869 () tuple2!794)

(assert (=> b!18506 (= e!11869 e!11864)))

(assert (=> b!18506 (= lt!5024 (update!12 (v!1471 (_2!405 lt!4851)) lt!4997 lt!5010))))

(declare-fun c!1915 () Bool)

(declare-fun lt!5016 () ListLongMap!533)

(assert (=> b!18506 (= c!1915 (contains!213 lt!5016 lt!4997))))

(declare-fun lt!5005 () Unit!362)

(assert (=> b!18506 (= lt!5005 e!11865)))

(declare-fun c!1910 () Bool)

(assert (=> b!18506 (= c!1910 (_1!398 lt!5024))))

(declare-fun b!18507 () Bool)

(assert (=> b!18507 false))

(declare-fun lt!5014 () Unit!362)

(declare-fun lt!5002 () Unit!362)

(assert (=> b!18507 (= lt!5014 lt!5002)))

(declare-fun lt!5023 () (_ BitVec 32))

(assert (=> b!18507 (not (arrayContainsKey!0 (_keys!3086 (v!1471 (underlying!61 thiss!848))) lt!4997 lt!5023))))

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!1015 (_ BitVec 32) (_ BitVec 64) List!538) Unit!362)

(assert (=> b!18507 (= lt!5002 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3086 (v!1471 (underlying!61 thiss!848))) lt!5023 lt!4997 (Cons!534 lt!4997 Nil!535)))))

(assert (=> b!18507 (= lt!5023 (bvadd (bvsub (size!579 (_keys!3086 (v!1471 (underlying!61 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!5019 () Unit!362)

(declare-fun lt!5008 () Unit!362)

(assert (=> b!18507 (= lt!5019 lt!5008)))

(assert (=> b!18507 (arrayNoDuplicates!0 (_keys!3086 (v!1471 (underlying!61 thiss!848))) (bvsub (size!579 (_keys!3086 (v!1471 (underlying!61 thiss!848)))) #b00000000000000000000000000000001) Nil!535)))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!1015 (_ BitVec 32) (_ BitVec 32)) Unit!362)

(assert (=> b!18507 (= lt!5008 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3086 (v!1471 (underlying!61 thiss!848))) #b00000000000000000000000000000000 (bvsub (size!579 (_keys!3086 (v!1471 (underlying!61 thiss!848)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5012 () Unit!362)

(declare-fun lt!5017 () Unit!362)

(assert (=> b!18507 (= lt!5012 lt!5017)))

(declare-fun e!11867 () Bool)

(assert (=> b!18507 e!11867))

(declare-fun c!1914 () Bool)

(assert (=> b!18507 (= c!1914 (and (not (= lt!4997 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!4997 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!5022 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!2 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 64) (_ BitVec 32) Int) Unit!362)

(assert (=> b!18507 (= lt!5017 (lemmaListMapContainsThenArrayContainsFrom!2 (_keys!3086 (v!1471 (underlying!61 thiss!848))) (_values!1658 (v!1471 (underlying!61 thiss!848))) (mask!4594 (v!1471 (underlying!61 thiss!848))) (extraKeys!1574 (v!1471 (underlying!61 thiss!848))) (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 (v!1471 (underlying!61 thiss!848))) lt!4997 lt!5022 (defaultEntry!1661 (v!1471 (underlying!61 thiss!848)))))))

(assert (=> b!18507 (= lt!5022 (bvadd (bvsub (size!579 (_keys!3086 (v!1471 (underlying!61 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun Unit!370 () Unit!362)

(assert (=> b!18507 (= e!11865 Unit!370)))

(declare-fun b!18508 () Bool)

(declare-fun e!11866 () tuple2!794)

(assert (=> b!18508 (= e!11866 (tuple2!795 true (v!1471 (_2!405 lt!4851))))))

(declare-fun lt!4998 () ListLongMap!533)

(declare-fun bm!764 () Bool)

(declare-fun lt!5020 () ListLongMap!533)

(assert (=> bm!764 (= call!776 (+!34 (ite c!1911 lt!5020 lt!4998) (tuple2!793 lt!4997 lt!5010)))))

(declare-fun b!18509 () Bool)

(assert (=> b!18509 (= c!1911 (bvsgt (bvsub (size!579 (_keys!3086 (v!1471 (underlying!61 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun e!11863 () tuple2!794)

(assert (=> b!18509 (= e!11864 e!11863)))

(declare-fun lt!5027 () (_ BitVec 64))

(declare-fun lt!5007 () ListLongMap!533)

(declare-fun call!772 () ListLongMap!533)

(declare-fun bm!765 () Bool)

(declare-fun lt!5026 () ListLongMap!533)

(declare-fun lt!4999 () (_ BitVec 64))

(assert (=> bm!765 (= call!772 (+!34 (ite c!1911 lt!5026 lt!5007) (ite c!1911 (tuple2!793 lt!4999 (minValue!1597 (v!1471 (underlying!61 thiss!848)))) (tuple2!793 lt!5027 (minValue!1597 (v!1471 (underlying!61 thiss!848)))))))))

(declare-fun call!775 () ListLongMap!533)

(declare-fun bm!766 () Bool)

(assert (=> bm!766 (= call!775 (+!34 call!772 (tuple2!793 lt!4997 lt!5010)))))

(declare-fun bm!767 () Bool)

(declare-fun call!769 () ListLongMap!533)

(declare-fun call!773 () ListLongMap!533)

(declare-fun call!768 () ListLongMap!533)

(assert (=> bm!767 (= call!769 (+!34 (ite c!1911 call!768 call!773) (ite c!1911 (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1471 (underlying!61 thiss!848)))) (tuple2!793 lt!5027 (minValue!1597 (v!1471 (underlying!61 thiss!848)))))))))

(declare-fun bm!768 () Bool)

(declare-fun call!766 () Unit!362)

(declare-fun addCommutativeForDiffKeys!2 (ListLongMap!533 (_ BitVec 64) V!1043 (_ BitVec 64) V!1043) Unit!362)

(assert (=> bm!768 (= call!766 (addCommutativeForDiffKeys!2 (ite c!1911 lt!5026 lt!4998) lt!4997 lt!5010 (ite c!1911 lt!4999 lt!5025) (ite c!1911 (minValue!1597 (v!1471 (underlying!61 thiss!848))) (zeroValue!1597 (v!1471 (underlying!61 thiss!848))))))))

(declare-fun b!18510 () Bool)

(assert (=> b!18510 (= e!11867 (ite (= lt!4997 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1574 (v!1471 (underlying!61 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1574 (v!1471 (underlying!61 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!18511 () Bool)

(assert (=> b!18511 (= e!11870 (= (map!358 (_2!398 lt!5009)) (map!358 (v!1471 (underlying!61 thiss!848)))))))

(declare-fun b!18512 () Bool)

(assert (=> b!18512 (= e!11863 (tuple2!795 true (_2!398 lt!5024)))))

(assert (=> b!18512 (= lt!4998 call!768)))

(assert (=> b!18512 (= lt!5025 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5006 () Unit!362)

(assert (=> b!18512 (= lt!5006 call!766)))

(assert (=> b!18512 (= call!770 call!764)))

(declare-fun lt!5000 () Unit!362)

(assert (=> b!18512 (= lt!5000 lt!5006)))

(declare-fun call!771 () ListLongMap!533)

(assert (=> b!18512 (= lt!5007 call!771)))

(assert (=> b!18512 (= lt!5027 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5018 () Unit!362)

(declare-fun call!767 () Unit!362)

(assert (=> b!18512 (= lt!5018 call!767)))

(assert (=> b!18512 (= call!769 call!775)))

(declare-fun lt!5003 () Unit!362)

(assert (=> b!18512 (= lt!5003 lt!5018)))

(declare-fun bm!769 () Bool)

(declare-fun c!1913 () Bool)

(declare-fun call!765 () tuple2!794)

(assert (=> bm!769 (= call!765 (repackFrom!2 thiss!848 (ite c!1913 (_2!398 lt!5024) (v!1471 (_2!405 lt!4851))) (bvsub (bvsub (size!579 (_keys!3086 (v!1471 (underlying!61 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun bm!770 () Bool)

(assert (=> bm!770 (= call!767 (addCommutativeForDiffKeys!2 (ite c!1911 lt!5020 lt!5007) lt!4997 lt!5010 (ite c!1911 lt!5011 lt!5027) (ite c!1911 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 (v!1471 (underlying!61 thiss!848))))))))

(declare-fun bm!771 () Bool)

(assert (=> bm!771 (= call!768 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1471 (underlying!61 thiss!848))) (_values!1658 (v!1471 (underlying!61 thiss!848))) (mask!4594 (v!1471 (underlying!61 thiss!848))) (extraKeys!1574 (v!1471 (underlying!61 thiss!848))) (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 (v!1471 (underlying!61 thiss!848))) (bvadd (bvsub (size!579 (_keys!3086 (v!1471 (underlying!61 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!1661 (v!1471 (underlying!61 thiss!848)))))))

(declare-fun b!18513 () Bool)

(declare-fun lt!5004 () tuple2!794)

(assert (=> b!18513 (= e!11863 (tuple2!795 (_1!398 lt!5004) (_2!398 lt!5004)))))

(assert (=> b!18513 (= lt!5020 call!768)))

(assert (=> b!18513 (= lt!5011 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5028 () Unit!362)

(assert (=> b!18513 (= lt!5028 call!767)))

(assert (=> b!18513 (= call!764 call!770)))

(declare-fun lt!5013 () Unit!362)

(assert (=> b!18513 (= lt!5013 lt!5028)))

(assert (=> b!18513 (= lt!5026 call!769)))

(assert (=> b!18513 (= lt!4999 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5015 () Unit!362)

(assert (=> b!18513 (= lt!5015 call!766)))

(assert (=> b!18513 (= call!771 call!775)))

(declare-fun lt!5001 () Unit!362)

(assert (=> b!18513 (= lt!5001 lt!5015)))

(assert (=> b!18513 (= lt!5004 call!765)))

(declare-fun b!18514 () Bool)

(assert (=> b!18514 (= e!11869 e!11866)))

(declare-fun c!1912 () Bool)

(assert (=> b!18514 (= c!1912 (bvsgt (bvsub (size!579 (_keys!3086 (v!1471 (underlying!61 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!772 () Bool)

(assert (=> bm!772 (= call!773 (+!34 (ite c!1911 lt!5026 lt!5007) (tuple2!793 lt!4997 lt!5010)))))

(declare-fun bm!773 () Bool)

(assert (=> bm!773 (= call!774 (+!34 (ite c!1911 lt!5020 lt!4998) (ite c!1911 (tuple2!793 lt!5011 (zeroValue!1597 (v!1471 (underlying!61 thiss!848)))) (tuple2!793 lt!5025 (zeroValue!1597 (v!1471 (underlying!61 thiss!848)))))))))

(declare-fun d!3429 () Bool)

(assert (=> d!3429 e!11868))

(declare-fun res!12849 () Bool)

(assert (=> d!3429 (=> res!12849 e!11868)))

(assert (=> d!3429 (= res!12849 (not (_1!398 lt!5009)))))

(assert (=> d!3429 (= lt!5009 e!11869)))

(assert (=> d!3429 (= c!1913 (and (not (= lt!4997 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!4997 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3429 (= lt!5016 (map!358 (v!1471 (_2!405 lt!4851))))))

(assert (=> d!3429 (= lt!5010 (get!348 (select (arr!488 (_values!1658 (v!1471 (underlying!61 thiss!848)))) (bvsub (size!579 (_keys!3086 (v!1471 (underlying!61 thiss!848)))) #b00000000000000000000000000000001)) (dynLambda!129 (defaultEntry!1661 (v!1471 (underlying!61 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3429 (= lt!4997 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 thiss!848)))) (bvsub (size!579 (_keys!3086 (v!1471 (underlying!61 thiss!848)))) #b00000000000000000000000000000001)))))

(assert (=> d!3429 (valid!55 thiss!848)))

(assert (=> d!3429 (= (repackFrom!2 thiss!848 (v!1471 (_2!405 lt!4851)) (bvsub (size!579 (_keys!3086 (v!1471 (underlying!61 thiss!848)))) #b00000000000000000000000000000001)) lt!5009)))

(declare-fun bm!763 () Bool)

(assert (=> bm!763 (= call!771 (+!34 (ite c!1911 call!773 call!768) (ite c!1911 (tuple2!793 lt!4999 (minValue!1597 (v!1471 (underlying!61 thiss!848)))) (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1471 (underlying!61 thiss!848)))))))))

(declare-fun b!18515 () Bool)

(declare-fun lt!5021 () tuple2!794)

(assert (=> b!18515 (= lt!5021 call!765)))

(assert (=> b!18515 (= e!11866 (tuple2!795 (_1!398 lt!5021) (_2!398 lt!5021)))))

(declare-fun b!18516 () Bool)

(assert (=> b!18516 (= e!11867 (arrayContainsKey!0 (_keys!3086 (v!1471 (underlying!61 thiss!848))) lt!4997 lt!5022))))

(assert (= (and d!3429 c!1913) b!18506))

(assert (= (and d!3429 (not c!1913)) b!18514))

(assert (= (and b!18506 c!1915) b!18507))

(assert (= (and b!18506 (not c!1915)) b!18505))

(assert (= (and b!18507 c!1914) b!18516))

(assert (= (and b!18507 (not c!1914)) b!18510))

(assert (= (and b!18506 c!1910) b!18509))

(assert (= (and b!18506 (not c!1910)) b!18503))

(assert (= (and b!18509 c!1911) b!18513))

(assert (= (and b!18509 (not c!1911)) b!18512))

(assert (= (or b!18513 b!18512) bm!768))

(assert (= (or b!18513 b!18512) bm!770))

(assert (= (or b!18513 b!18512) bm!765))

(assert (= (or b!18513 b!18512) bm!773))

(assert (= (or b!18513 b!18512) bm!764))

(assert (= (or b!18513 b!18512) bm!772))

(assert (= (or b!18513 b!18512) bm!771))

(assert (= (or b!18513 b!18512) bm!763))

(assert (= (or b!18513 b!18512) bm!767))

(assert (= (or b!18513 b!18512) bm!761))

(assert (= (or b!18513 b!18512) bm!762))

(assert (= (or b!18513 b!18512) bm!766))

(assert (= (and b!18514 c!1912) b!18515))

(assert (= (and b!18514 (not c!1912)) b!18508))

(assert (= (or b!18513 b!18515) bm!769))

(assert (= (and d!3429 (not res!12849)) b!18504))

(assert (= (and b!18504 res!12848) b!18511))

(declare-fun b_lambda!1437 () Bool)

(assert (=> (not b_lambda!1437) (not d!3429)))

(declare-fun t!3174 () Bool)

(declare-fun tb!623 () Bool)

(assert (=> (and b!18136 (= (defaultEntry!1661 (v!1471 (underlying!61 thiss!848))) (defaultEntry!1661 (v!1471 (underlying!61 thiss!848)))) t!3174) tb!623))

(declare-fun result!1009 () Bool)

(assert (=> tb!623 (= result!1009 tp_is_empty!913)))

(assert (=> d!3429 t!3174))

(declare-fun b_and!1299 () Bool)

(assert (= b_and!1297 (and (=> t!3174 result!1009) b_and!1299)))

(declare-fun m!12865 () Bool)

(assert (=> b!18507 m!12865))

(declare-fun m!12867 () Bool)

(assert (=> b!18507 m!12867))

(declare-fun m!12869 () Bool)

(assert (=> b!18507 m!12869))

(declare-fun m!12871 () Bool)

(assert (=> b!18507 m!12871))

(declare-fun m!12873 () Bool)

(assert (=> b!18507 m!12873))

(declare-fun m!12875 () Bool)

(assert (=> bm!768 m!12875))

(declare-fun m!12877 () Bool)

(assert (=> bm!761 m!12877))

(declare-fun m!12879 () Bool)

(assert (=> b!18511 m!12879))

(assert (=> b!18511 m!12667))

(declare-fun m!12881 () Bool)

(assert (=> bm!772 m!12881))

(declare-fun m!12883 () Bool)

(assert (=> b!18504 m!12883))

(declare-fun m!12885 () Bool)

(assert (=> b!18516 m!12885))

(declare-fun m!12887 () Bool)

(assert (=> bm!773 m!12887))

(declare-fun m!12889 () Bool)

(assert (=> bm!763 m!12889))

(declare-fun m!12891 () Bool)

(assert (=> bm!769 m!12891))

(declare-fun m!12893 () Bool)

(assert (=> d!3429 m!12893))

(declare-fun m!12895 () Bool)

(assert (=> d!3429 m!12895))

(declare-fun m!12897 () Bool)

(assert (=> d!3429 m!12897))

(declare-fun m!12899 () Bool)

(assert (=> d!3429 m!12899))

(assert (=> d!3429 m!12895))

(declare-fun m!12901 () Bool)

(assert (=> d!3429 m!12901))

(assert (=> d!3429 m!12591))

(assert (=> d!3429 m!12893))

(declare-fun m!12903 () Bool)

(assert (=> b!18506 m!12903))

(declare-fun m!12905 () Bool)

(assert (=> b!18506 m!12905))

(declare-fun m!12907 () Bool)

(assert (=> bm!771 m!12907))

(declare-fun m!12909 () Bool)

(assert (=> bm!770 m!12909))

(declare-fun m!12911 () Bool)

(assert (=> bm!764 m!12911))

(declare-fun m!12913 () Bool)

(assert (=> bm!762 m!12913))

(declare-fun m!12915 () Bool)

(assert (=> bm!767 m!12915))

(declare-fun m!12917 () Bool)

(assert (=> bm!765 m!12917))

(declare-fun m!12919 () Bool)

(assert (=> bm!766 m!12919))

(assert (=> b!18384 d!3429))

(declare-fun d!3431 () Bool)

(declare-fun lt!5036 () SeekEntryResult!43)

(assert (=> d!3431 (and (or ((_ is Undefined!43) lt!5036) (not ((_ is Found!43) lt!5036)) (and (bvsge (index!2292 lt!5036) #b00000000000000000000000000000000) (bvslt (index!2292 lt!5036) (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))) (or ((_ is Undefined!43) lt!5036) ((_ is Found!43) lt!5036) (not ((_ is MissingZero!43) lt!5036)) (and (bvsge (index!2291 lt!5036) #b00000000000000000000000000000000) (bvslt (index!2291 lt!5036) (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))) (or ((_ is Undefined!43) lt!5036) ((_ is Found!43) lt!5036) ((_ is MissingZero!43) lt!5036) (not ((_ is MissingVacant!43) lt!5036)) (and (bvsge (index!2294 lt!5036) #b00000000000000000000000000000000) (bvslt (index!2294 lt!5036) (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))) (or ((_ is Undefined!43) lt!5036) (ite ((_ is Found!43) lt!5036) (= (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!5036)) key!682) (ite ((_ is MissingZero!43) lt!5036) (= (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2291 lt!5036)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!43) lt!5036) (= (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2294 lt!5036)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!11877 () SeekEntryResult!43)

(assert (=> d!3431 (= lt!5036 e!11877)))

(declare-fun c!1922 () Bool)

(declare-fun lt!5037 () SeekEntryResult!43)

(assert (=> d!3431 (= c!1922 (and ((_ is Intermediate!43) lt!5037) (undefined!855 lt!5037)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!1015 (_ BitVec 32)) SeekEntryResult!43)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3431 (= lt!5037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!682 (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694))))) key!682 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(assert (=> d!3431 (validMask!0 (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))))))

(assert (=> d!3431 (= (seekEntryOrOpen!0 key!682 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694))))) lt!5036)))

(declare-fun b!18529 () Bool)

(declare-fun e!11879 () SeekEntryResult!43)

(assert (=> b!18529 (= e!11879 (Found!43 (index!2293 lt!5037)))))

(declare-fun b!18530 () Bool)

(declare-fun e!11878 () SeekEntryResult!43)

(assert (=> b!18530 (= e!11878 (MissingZero!43 (index!2293 lt!5037)))))

(declare-fun b!18531 () Bool)

(declare-fun c!1924 () Bool)

(declare-fun lt!5035 () (_ BitVec 64))

(assert (=> b!18531 (= c!1924 (= lt!5035 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!18531 (= e!11879 e!11878)))

(declare-fun b!18532 () Bool)

(assert (=> b!18532 (= e!11877 e!11879)))

(assert (=> b!18532 (= lt!5035 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2293 lt!5037)))))

(declare-fun c!1923 () Bool)

(assert (=> b!18532 (= c!1923 (= lt!5035 key!682))))

(declare-fun b!18533 () Bool)

(assert (=> b!18533 (= e!11877 Undefined!43)))

(declare-fun b!18534 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!1015 (_ BitVec 32)) SeekEntryResult!43)

(assert (=> b!18534 (= e!11878 (seekKeyOrZeroReturnVacant!0 (x!4488 lt!5037) (index!2293 lt!5037) (index!2293 lt!5037) key!682 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(assert (= (and d!3431 c!1922) b!18533))

(assert (= (and d!3431 (not c!1922)) b!18532))

(assert (= (and b!18532 c!1923) b!18529))

(assert (= (and b!18532 (not c!1923)) b!18531))

(assert (= (and b!18531 c!1924) b!18530))

(assert (= (and b!18531 (not c!1924)) b!18534))

(declare-fun m!12921 () Bool)

(assert (=> d!3431 m!12921))

(declare-fun m!12923 () Bool)

(assert (=> d!3431 m!12923))

(assert (=> d!3431 m!12779))

(declare-fun m!12925 () Bool)

(assert (=> d!3431 m!12925))

(declare-fun m!12927 () Bool)

(assert (=> d!3431 m!12927))

(declare-fun m!12929 () Bool)

(assert (=> d!3431 m!12929))

(assert (=> d!3431 m!12921))

(declare-fun m!12931 () Bool)

(assert (=> b!18532 m!12931))

(declare-fun m!12933 () Bool)

(assert (=> b!18534 m!12933))

(assert (=> bm!685 d!3431))

(declare-fun e!11896 () Bool)

(declare-fun call!781 () ListLongMap!533)

(declare-fun call!793 () ListLongMap!533)

(declare-fun b!18535 () Bool)

(assert (=> b!18535 (= e!11896 (= call!781 (+!34 call!793 (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1471 (underlying!61 thiss!848)))))))))

(declare-fun bm!774 () Bool)

(declare-fun call!800 () SeekEntryResult!43)

(declare-fun call!783 () SeekEntryResult!43)

(assert (=> bm!774 (= call!800 call!783)))

(declare-fun b!18536 () Bool)

(declare-fun e!11891 () tuple2!794)

(declare-fun e!11885 () tuple2!794)

(assert (=> b!18536 (= e!11891 e!11885)))

(declare-fun c!1929 () Bool)

(declare-fun lt!5045 () SeekEntryResult!43)

(assert (=> b!18536 (= c!1929 ((_ is MissingZero!43) lt!5045))))

(declare-fun b!18537 () Bool)

(declare-fun e!11889 () Bool)

(declare-fun call!786 () Bool)

(assert (=> b!18537 (= e!11889 (not call!786))))

(declare-fun b!18538 () Bool)

(declare-fun e!11880 () Bool)

(declare-fun lt!5039 () SeekEntryResult!43)

(assert (=> b!18538 (= e!11880 ((_ is Undefined!43) lt!5039))))

(declare-fun b!18539 () Bool)

(declare-fun e!11898 () Bool)

(declare-fun call!777 () Bool)

(assert (=> b!18539 (= e!11898 (not call!777))))

(declare-fun bm!775 () Bool)

(declare-fun call!790 () ListLongMap!533)

(declare-fun call!798 () ListLongMap!533)

(assert (=> bm!775 (= call!790 call!798)))

(declare-fun bm!776 () Bool)

(declare-fun call!787 () Bool)

(declare-fun call!782 () Bool)

(assert (=> bm!776 (= call!787 call!782)))

(declare-fun b!18540 () Bool)

(declare-fun c!1933 () Bool)

(assert (=> b!18540 (= c!1933 ((_ is MissingVacant!43) lt!5045))))

(declare-fun e!11882 () tuple2!794)

(assert (=> b!18540 (= e!11882 e!11891)))

(declare-fun b!18541 () Bool)

(declare-fun res!12855 () Bool)

(assert (=> b!18541 (=> (not res!12855) (not e!11889))))

(assert (=> b!18541 (= res!12855 (= (select (arr!489 (_keys!3086 call!713)) (index!2291 lt!5039)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18542 () Bool)

(declare-fun e!11890 () Bool)

(declare-fun lt!5056 () SeekEntryResult!43)

(assert (=> b!18542 (= e!11890 (= (select (arr!489 (_keys!3086 call!713)) (index!2292 lt!5056)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18543 () Bool)

(declare-fun res!12852 () Bool)

(assert (=> b!18543 (=> (not res!12852) (not e!11898))))

(declare-fun lt!5059 () SeekEntryResult!43)

(assert (=> b!18543 (= res!12852 (= (select (arr!489 (_keys!3086 call!713)) (index!2291 lt!5059)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!777 () Bool)

(declare-fun call!778 () Bool)

(declare-fun call!794 () Bool)

(assert (=> bm!777 (= call!778 call!794)))

(declare-fun bm!778 () Bool)

(declare-fun call!799 () Bool)

(assert (=> bm!778 (= call!799 (arrayContainsKey!0 (_keys!3086 call!713) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun bm!779 () Bool)

(declare-fun call!785 () Bool)

(assert (=> bm!779 (= call!794 call!785)))

(declare-fun bm!780 () Bool)

(declare-fun call!791 () ListLongMap!533)

(declare-fun call!792 () ListLongMap!533)

(assert (=> bm!780 (= call!791 call!792)))

(declare-fun b!18544 () Bool)

(declare-fun res!12863 () Bool)

(assert (=> b!18544 (= res!12863 call!782)))

(declare-fun e!11895 () Bool)

(assert (=> b!18544 (=> (not res!12863) (not e!11895))))

(declare-fun b!18545 () Bool)

(declare-fun lt!5062 () tuple2!794)

(declare-fun call!789 () tuple2!794)

(assert (=> b!18545 (= lt!5062 call!789)))

(assert (=> b!18545 (= e!11885 (tuple2!795 (_1!398 lt!5062) (_2!398 lt!5062)))))

(declare-fun b!18546 () Bool)

(declare-fun lt!5058 () tuple2!794)

(assert (=> b!18546 (= e!11891 (tuple2!795 (_1!398 lt!5058) (_2!398 lt!5058)))))

(assert (=> b!18546 (= lt!5058 call!789)))

(declare-fun bm!781 () Bool)

(assert (=> bm!781 (= call!783 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3086 call!713) (mask!4594 call!713)))))

(declare-fun b!18547 () Bool)

(declare-fun e!11887 () Bool)

(declare-fun e!11884 () Bool)

(assert (=> b!18547 (= e!11887 e!11884)))

(declare-fun c!1936 () Bool)

(declare-fun lt!5048 () tuple2!794)

(assert (=> b!18547 (= c!1936 (_1!398 lt!5048))))

(declare-fun bm!782 () Bool)

(assert (=> bm!782 (= call!782 call!785)))

(declare-fun b!18548 () Bool)

(assert (=> b!18548 (= e!11884 e!11896)))

(declare-fun res!12857 () Bool)

(assert (=> b!18548 (= res!12857 (contains!213 call!781 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!18548 (=> (not res!12857) (not e!11896))))

(declare-fun b!18549 () Bool)

(assert (=> b!18549 (= e!11884 (= call!781 call!793))))

(declare-fun b!18550 () Bool)

(declare-fun e!11893 () Unit!362)

(declare-fun Unit!371 () Unit!362)

(assert (=> b!18550 (= e!11893 Unit!371)))

(declare-fun lt!5063 () Unit!362)

(declare-fun call!784 () Unit!362)

(assert (=> b!18550 (= lt!5063 call!784)))

(declare-fun lt!5044 () SeekEntryResult!43)

(assert (=> b!18550 (= lt!5044 call!800)))

(declare-fun res!12854 () Bool)

(assert (=> b!18550 (= res!12854 ((_ is Found!43) lt!5044))))

(assert (=> b!18550 (=> (not res!12854) (not e!11895))))

(assert (=> b!18550 e!11895))

(declare-fun lt!5049 () Unit!362)

(assert (=> b!18550 (= lt!5049 lt!5063)))

(assert (=> b!18550 false))

(declare-fun bm!783 () Bool)

(declare-fun call!795 () SeekEntryResult!43)

(assert (=> bm!783 (= call!795 call!783)))

(declare-fun bm!784 () Bool)

(declare-fun c!1927 () Bool)

(declare-fun c!1931 () Bool)

(declare-fun c!1926 () Bool)

(declare-fun c!1935 () Bool)

(declare-fun c!1928 () Bool)

(assert (=> bm!784 (= call!785 (inRange!0 (ite c!1927 (ite c!1931 (index!2292 lt!5044) (ite c!1926 (index!2291 lt!5059) (index!2294 lt!5059))) (ite c!1935 (index!2292 lt!5056) (ite c!1928 (index!2291 lt!5039) (index!2294 lt!5039)))) (mask!4594 call!713)))))

(declare-fun b!18551 () Bool)

(declare-fun e!11892 () Bool)

(assert (=> b!18551 (= e!11892 (not call!786))))

(declare-fun b!18552 () Bool)

(declare-fun lt!5040 () Unit!362)

(assert (=> b!18552 (= lt!5040 e!11893)))

(declare-fun call!779 () Bool)

(assert (=> b!18552 (= c!1931 call!779)))

(assert (=> b!18552 (= e!11882 (tuple2!795 false call!713))))

(declare-fun c!1934 () Bool)

(declare-fun call!796 () ListLongMap!533)

(declare-fun bm!785 () Bool)

(declare-fun call!797 () ListLongMap!533)

(declare-fun c!1925 () Bool)

(assert (=> bm!785 (= call!792 (+!34 (ite c!1925 call!797 call!796) (ite c!1925 (ite c!1934 (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1471 (underlying!61 thiss!848)))) (tuple2!793 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))))) (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1471 (underlying!61 thiss!848)))))))))

(declare-fun b!18553 () Bool)

(declare-fun res!12862 () Bool)

(assert (=> b!18553 (= res!12862 (= (select (arr!489 (_keys!3086 call!713)) (index!2294 lt!5059)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!11899 () Bool)

(assert (=> b!18553 (=> (not res!12862) (not e!11899))))

(declare-fun bm!786 () Bool)

(assert (=> bm!786 (= call!786 call!799)))

(declare-fun b!18554 () Bool)

(declare-fun e!11897 () Unit!362)

(declare-fun Unit!372 () Unit!362)

(assert (=> b!18554 (= e!11897 Unit!372)))

(declare-fun lt!5057 () Unit!362)

(declare-fun call!788 () Unit!362)

(assert (=> b!18554 (= lt!5057 call!788)))

(assert (=> b!18554 (= lt!5039 call!795)))

(assert (=> b!18554 (= c!1928 ((_ is MissingZero!43) lt!5039))))

(declare-fun e!11888 () Bool)

(assert (=> b!18554 e!11888))

(declare-fun lt!5050 () Unit!362)

(assert (=> b!18554 (= lt!5050 lt!5057)))

(assert (=> b!18554 false))

(declare-fun b!18555 () Bool)

(declare-fun res!12859 () Bool)

(assert (=> b!18555 (= res!12859 (= (select (arr!489 (_keys!3086 call!713)) (index!2294 lt!5039)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!18555 (=> (not res!12859) (not e!11892))))

(declare-fun bm!787 () Bool)

(assert (=> bm!787 (= call!788 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!2 (_keys!3086 call!713) (_values!1658 call!713) (mask!4594 call!713) (extraKeys!1574 call!713) (zeroValue!1597 call!713) (minValue!1597 call!713) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1661 call!713)))))

(declare-fun bm!788 () Bool)

(assert (=> bm!788 (= call!789 (updateHelperNewKey!2 call!713 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (ite c!1933 (index!2294 lt!5045) (index!2291 lt!5045))))))

(declare-fun call!780 () ListLongMap!533)

(declare-fun bm!789 () Bool)

(assert (=> bm!789 (= call!779 (contains!213 call!780 (ite c!1927 #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!489 (_keys!3086 call!713)) (index!2292 lt!5045)))))))

(declare-fun b!18556 () Bool)

(declare-fun res!12850 () Bool)

(assert (=> b!18556 (=> (not res!12850) (not e!11889))))

(assert (=> b!18556 (= res!12850 call!778)))

(assert (=> b!18556 (= e!11888 e!11889)))

(declare-fun b!18557 () Bool)

(declare-fun e!11883 () Bool)

(assert (=> b!18557 (= e!11883 ((_ is Undefined!43) lt!5059))))

(declare-fun bm!790 () Bool)

(assert (=> bm!790 (= call!796 (getCurrentListMap!119 (_keys!3086 call!713) (_values!1658 call!713) (mask!4594 call!713) (extraKeys!1574 call!713) (zeroValue!1597 call!713) (minValue!1597 call!713) #b00000000000000000000000000000000 (defaultEntry!1661 call!713)))))

(declare-fun bm!791 () Bool)

(assert (=> bm!791 (= call!781 (map!358 (_2!398 lt!5048)))))

(declare-fun bm!792 () Bool)

(assert (=> bm!792 (= call!777 call!799)))

(declare-fun bm!793 () Bool)

(assert (=> bm!793 (= call!793 (map!358 call!713))))

(declare-fun b!18558 () Bool)

(declare-fun lt!5061 () Unit!362)

(declare-fun lt!5042 () Unit!362)

(assert (=> b!18558 (= lt!5061 lt!5042)))

(assert (=> b!18558 (= call!791 call!790)))

(declare-fun lt!5051 () (_ BitVec 32))

(assert (=> b!18558 (= lt!5042 (lemmaChangeZeroKeyThenAddPairToListMap!2 (_keys!3086 call!713) (_values!1658 call!713) (mask!4594 call!713) (extraKeys!1574 call!713) lt!5051 (zeroValue!1597 call!713) (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 call!713) (defaultEntry!1661 call!713)))))

(assert (=> b!18558 (= lt!5051 (bvor (extraKeys!1574 call!713) #b00000000000000000000000000000001))))

(declare-fun e!11881 () tuple2!794)

(assert (=> b!18558 (= e!11881 (tuple2!795 true (LongMapFixedSize!101 (defaultEntry!1661 call!713) (mask!4594 call!713) (bvor (extraKeys!1574 call!713) #b00000000000000000000000000000001) (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 call!713) (_size!82 call!713) (_keys!3086 call!713) (_values!1658 call!713) (_vacant!82 call!713))))))

(declare-fun lt!5060 () (_ BitVec 32))

(declare-fun bm!794 () Bool)

(assert (=> bm!794 (= call!798 (getCurrentListMap!119 (_keys!3086 call!713) (ite c!1925 (_values!1658 call!713) (array!1014 (store (arr!488 (_values!1658 call!713)) (index!2292 lt!5045) (ValueCellFull!257 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))))) (size!578 (_values!1658 call!713)))) (mask!4594 call!713) (ite c!1925 (ite c!1934 lt!5051 lt!5060) (extraKeys!1574 call!713)) (ite (and c!1925 c!1934) (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (zeroValue!1597 call!713)) (ite c!1925 (ite c!1934 (minValue!1597 call!713) (zeroValue!1597 (v!1471 (underlying!61 thiss!848)))) (minValue!1597 call!713)) #b00000000000000000000000000000000 (defaultEntry!1661 call!713)))))

(declare-fun b!18559 () Bool)

(declare-fun lt!5041 () Unit!362)

(assert (=> b!18559 (= e!11893 lt!5041)))

(assert (=> b!18559 (= lt!5041 call!788)))

(assert (=> b!18559 (= lt!5059 call!800)))

(assert (=> b!18559 (= c!1926 ((_ is MissingZero!43) lt!5059))))

(declare-fun e!11886 () Bool)

(assert (=> b!18559 e!11886))

(declare-fun b!18560 () Bool)

(declare-fun c!1930 () Bool)

(assert (=> b!18560 (= c!1930 ((_ is MissingVacant!43) lt!5039))))

(assert (=> b!18560 (= e!11888 e!11880)))

(declare-fun b!18561 () Bool)

(declare-fun lt!5053 () Unit!362)

(declare-fun lt!5047 () Unit!362)

(assert (=> b!18561 (= lt!5053 lt!5047)))

(assert (=> b!18561 (= call!791 call!790)))

(assert (=> b!18561 (= lt!5047 (lemmaChangeLongMinValueKeyThenAddPairToListMap!2 (_keys!3086 call!713) (_values!1658 call!713) (mask!4594 call!713) (extraKeys!1574 call!713) lt!5060 (zeroValue!1597 call!713) (minValue!1597 call!713) (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (defaultEntry!1661 call!713)))))

(assert (=> b!18561 (= lt!5060 (bvor (extraKeys!1574 call!713) #b00000000000000000000000000000010))))

(assert (=> b!18561 (= e!11881 (tuple2!795 true (LongMapFixedSize!101 (defaultEntry!1661 call!713) (mask!4594 call!713) (bvor (extraKeys!1574 call!713) #b00000000000000000000000000000010) (zeroValue!1597 call!713) (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (_size!82 call!713) (_keys!3086 call!713) (_values!1658 call!713) (_vacant!82 call!713))))))

(declare-fun b!18562 () Bool)

(assert (=> b!18562 (= e!11880 e!11892)))

(declare-fun res!12851 () Bool)

(assert (=> b!18562 (= res!12851 call!778)))

(assert (=> b!18562 (=> (not res!12851) (not e!11892))))

(declare-fun bm!795 () Bool)

(assert (=> bm!795 (= call!784 (lemmaInListMapThenSeekEntryOrOpenFindsIt!2 (_keys!3086 call!713) (_values!1658 call!713) (mask!4594 call!713) (extraKeys!1574 call!713) (zeroValue!1597 call!713) (minValue!1597 call!713) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1661 call!713)))))

(declare-fun d!3433 () Bool)

(assert (=> d!3433 e!11887))

(declare-fun res!12856 () Bool)

(assert (=> d!3433 (=> (not res!12856) (not e!11887))))

(assert (=> d!3433 (= res!12856 (valid!58 (_2!398 lt!5048)))))

(declare-fun e!11894 () tuple2!794)

(assert (=> d!3433 (= lt!5048 e!11894)))

(assert (=> d!3433 (= c!1925 (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvneg #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3433 (valid!58 call!713)))

(assert (=> d!3433 (= (update!12 call!713 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1471 (underlying!61 thiss!848)))) lt!5048)))

(declare-fun b!18563 () Bool)

(declare-fun res!12861 () Bool)

(assert (=> b!18563 (= res!12861 call!794)))

(assert (=> b!18563 (=> (not res!12861) (not e!11890))))

(declare-fun b!18564 () Bool)

(assert (=> b!18564 (= e!11895 (= (select (arr!489 (_keys!3086 call!713)) (index!2292 lt!5044)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!796 () Bool)

(assert (=> bm!796 (= call!797 call!796)))

(declare-fun b!18565 () Bool)

(assert (=> b!18565 (= e!11894 e!11882)))

(assert (=> b!18565 (= lt!5045 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3086 call!713) (mask!4594 call!713)))))

(assert (=> b!18565 (= c!1927 ((_ is Undefined!43) lt!5045))))

(declare-fun b!18566 () Bool)

(declare-fun res!12860 () Bool)

(assert (=> b!18566 (=> (not res!12860) (not e!11898))))

(assert (=> b!18566 (= res!12860 call!787)))

(assert (=> b!18566 (= e!11886 e!11898)))

(declare-fun b!18567 () Bool)

(assert (=> b!18567 (= e!11883 e!11899)))

(declare-fun res!12858 () Bool)

(assert (=> b!18567 (= res!12858 call!787)))

(assert (=> b!18567 (=> (not res!12858) (not e!11899))))

(declare-fun b!18568 () Bool)

(declare-fun lt!5052 () Unit!362)

(declare-fun lt!5054 () Unit!362)

(assert (=> b!18568 (= lt!5052 lt!5054)))

(assert (=> b!18568 call!779))

(declare-fun lt!5038 () array!1013)

(assert (=> b!18568 (= lt!5054 (lemmaValidKeyInArrayIsInListMap!2 (_keys!3086 call!713) lt!5038 (mask!4594 call!713) (extraKeys!1574 call!713) (zeroValue!1597 call!713) (minValue!1597 call!713) (index!2292 lt!5045) (defaultEntry!1661 call!713)))))

(assert (=> b!18568 (= lt!5038 (array!1014 (store (arr!488 (_values!1658 call!713)) (index!2292 lt!5045) (ValueCellFull!257 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))))) (size!578 (_values!1658 call!713))))))

(declare-fun lt!5055 () Unit!362)

(declare-fun lt!5043 () Unit!362)

(assert (=> b!18568 (= lt!5055 lt!5043)))

(assert (=> b!18568 (= call!792 call!798)))

(assert (=> b!18568 (= lt!5043 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!2 (_keys!3086 call!713) (_values!1658 call!713) (mask!4594 call!713) (extraKeys!1574 call!713) (zeroValue!1597 call!713) (minValue!1597 call!713) (index!2292 lt!5045) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (defaultEntry!1661 call!713)))))

(declare-fun lt!5046 () Unit!362)

(assert (=> b!18568 (= lt!5046 e!11897)))

(assert (=> b!18568 (= c!1935 (contains!213 call!796 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!18568 (= e!11885 (tuple2!795 true (LongMapFixedSize!101 (defaultEntry!1661 call!713) (mask!4594 call!713) (extraKeys!1574 call!713) (zeroValue!1597 call!713) (minValue!1597 call!713) (_size!82 call!713) (_keys!3086 call!713) (array!1014 (store (arr!488 (_values!1658 call!713)) (index!2292 lt!5045) (ValueCellFull!257 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))))) (size!578 (_values!1658 call!713))) (_vacant!82 call!713))))))

(declare-fun b!18569 () Bool)

(declare-fun lt!5064 () Unit!362)

(assert (=> b!18569 (= e!11897 lt!5064)))

(assert (=> b!18569 (= lt!5064 call!784)))

(assert (=> b!18569 (= lt!5056 call!795)))

(declare-fun res!12853 () Bool)

(assert (=> b!18569 (= res!12853 ((_ is Found!43) lt!5056))))

(assert (=> b!18569 (=> (not res!12853) (not e!11890))))

(assert (=> b!18569 e!11890))

(declare-fun b!18570 () Bool)

(assert (=> b!18570 (= e!11899 (not call!777))))

(declare-fun bm!797 () Bool)

(assert (=> bm!797 (= call!780 (getCurrentListMap!119 (_keys!3086 call!713) (ite c!1927 (_values!1658 call!713) lt!5038) (mask!4594 call!713) (extraKeys!1574 call!713) (zeroValue!1597 call!713) (minValue!1597 call!713) #b00000000000000000000000000000000 (defaultEntry!1661 call!713)))))

(declare-fun b!18571 () Bool)

(declare-fun c!1932 () Bool)

(assert (=> b!18571 (= c!1932 ((_ is MissingVacant!43) lt!5059))))

(assert (=> b!18571 (= e!11886 e!11883)))

(declare-fun b!18572 () Bool)

(assert (=> b!18572 (= e!11894 e!11881)))

(assert (=> b!18572 (= c!1934 (= #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!3433 c!1925) b!18572))

(assert (= (and d!3433 (not c!1925)) b!18565))

(assert (= (and b!18572 c!1934) b!18558))

(assert (= (and b!18572 (not c!1934)) b!18561))

(assert (= (or b!18558 b!18561) bm!796))

(assert (= (or b!18558 b!18561) bm!775))

(assert (= (or b!18558 b!18561) bm!780))

(assert (= (and b!18565 c!1927) b!18552))

(assert (= (and b!18565 (not c!1927)) b!18540))

(assert (= (and b!18552 c!1931) b!18550))

(assert (= (and b!18552 (not c!1931)) b!18559))

(assert (= (and b!18550 res!12854) b!18544))

(assert (= (and b!18544 res!12863) b!18564))

(assert (= (and b!18559 c!1926) b!18566))

(assert (= (and b!18559 (not c!1926)) b!18571))

(assert (= (and b!18566 res!12860) b!18543))

(assert (= (and b!18543 res!12852) b!18539))

(assert (= (and b!18571 c!1932) b!18567))

(assert (= (and b!18571 (not c!1932)) b!18557))

(assert (= (and b!18567 res!12858) b!18553))

(assert (= (and b!18553 res!12862) b!18570))

(assert (= (or b!18566 b!18567) bm!776))

(assert (= (or b!18539 b!18570) bm!792))

(assert (= (or b!18544 bm!776) bm!782))

(assert (= (or b!18550 b!18559) bm!774))

(assert (= (and b!18540 c!1933) b!18546))

(assert (= (and b!18540 (not c!1933)) b!18536))

(assert (= (and b!18536 c!1929) b!18545))

(assert (= (and b!18536 (not c!1929)) b!18568))

(assert (= (and b!18568 c!1935) b!18569))

(assert (= (and b!18568 (not c!1935)) b!18554))

(assert (= (and b!18569 res!12853) b!18563))

(assert (= (and b!18563 res!12861) b!18542))

(assert (= (and b!18554 c!1928) b!18556))

(assert (= (and b!18554 (not c!1928)) b!18560))

(assert (= (and b!18556 res!12850) b!18541))

(assert (= (and b!18541 res!12855) b!18537))

(assert (= (and b!18560 c!1930) b!18562))

(assert (= (and b!18560 (not c!1930)) b!18538))

(assert (= (and b!18562 res!12851) b!18555))

(assert (= (and b!18555 res!12859) b!18551))

(assert (= (or b!18556 b!18562) bm!777))

(assert (= (or b!18537 b!18551) bm!786))

(assert (= (or b!18563 bm!777) bm!779))

(assert (= (or b!18569 b!18554) bm!783))

(assert (= (or b!18546 b!18545) bm!788))

(assert (= (or bm!782 bm!779) bm!784))

(assert (= (or b!18550 b!18569) bm!795))

(assert (= (or bm!774 bm!783) bm!781))

(assert (= (or b!18552 b!18568) bm!797))

(assert (= (or bm!792 bm!786) bm!778))

(assert (= (or b!18559 b!18554) bm!787))

(assert (= (or b!18552 b!18568) bm!789))

(assert (= (or bm!796 b!18568) bm!790))

(assert (= (or bm!775 b!18568) bm!794))

(assert (= (or bm!780 b!18568) bm!785))

(assert (= (and d!3433 res!12856) b!18547))

(assert (= (and b!18547 c!1936) b!18548))

(assert (= (and b!18547 (not c!1936)) b!18549))

(assert (= (and b!18548 res!12857) b!18535))

(assert (= (or b!18535 b!18549) bm!793))

(assert (= (or b!18548 b!18535 b!18549) bm!791))

(declare-fun m!12935 () Bool)

(assert (=> b!18568 m!12935))

(declare-fun m!12937 () Bool)

(assert (=> b!18568 m!12937))

(declare-fun m!12939 () Bool)

(assert (=> b!18568 m!12939))

(declare-fun m!12941 () Bool)

(assert (=> b!18568 m!12941))

(declare-fun m!12943 () Bool)

(assert (=> bm!793 m!12943))

(declare-fun m!12945 () Bool)

(assert (=> bm!787 m!12945))

(declare-fun m!12947 () Bool)

(assert (=> b!18565 m!12947))

(declare-fun m!12949 () Bool)

(assert (=> d!3433 m!12949))

(declare-fun m!12951 () Bool)

(assert (=> d!3433 m!12951))

(declare-fun m!12953 () Bool)

(assert (=> b!18561 m!12953))

(declare-fun m!12955 () Bool)

(assert (=> bm!788 m!12955))

(declare-fun m!12957 () Bool)

(assert (=> bm!778 m!12957))

(declare-fun m!12959 () Bool)

(assert (=> bm!784 m!12959))

(declare-fun m!12961 () Bool)

(assert (=> b!18548 m!12961))

(declare-fun m!12963 () Bool)

(assert (=> bm!797 m!12963))

(declare-fun m!12965 () Bool)

(assert (=> bm!795 m!12965))

(declare-fun m!12967 () Bool)

(assert (=> bm!790 m!12967))

(declare-fun m!12969 () Bool)

(assert (=> b!18543 m!12969))

(declare-fun m!12971 () Bool)

(assert (=> b!18542 m!12971))

(declare-fun m!12973 () Bool)

(assert (=> b!18535 m!12973))

(declare-fun m!12975 () Bool)

(assert (=> bm!789 m!12975))

(declare-fun m!12977 () Bool)

(assert (=> bm!789 m!12977))

(declare-fun m!12979 () Bool)

(assert (=> bm!785 m!12979))

(assert (=> bm!794 m!12937))

(declare-fun m!12981 () Bool)

(assert (=> bm!794 m!12981))

(declare-fun m!12983 () Bool)

(assert (=> b!18553 m!12983))

(declare-fun m!12985 () Bool)

(assert (=> bm!791 m!12985))

(declare-fun m!12987 () Bool)

(assert (=> b!18564 m!12987))

(assert (=> bm!781 m!12947))

(declare-fun m!12989 () Bool)

(assert (=> b!18541 m!12989))

(declare-fun m!12991 () Bool)

(assert (=> b!18558 m!12991))

(declare-fun m!12993 () Bool)

(assert (=> b!18555 m!12993))

(assert (=> b!18383 d!3433))

(declare-fun d!3435 () Bool)

(declare-fun e!11906 () Bool)

(assert (=> d!3435 e!11906))

(declare-fun res!12868 () Bool)

(assert (=> d!3435 (=> (not res!12868) (not e!11906))))

(declare-fun lt!5112 () LongMapFixedSize!100)

(assert (=> d!3435 (= res!12868 (valid!58 lt!5112))))

(declare-fun lt!5119 () LongMapFixedSize!100)

(assert (=> d!3435 (= lt!5112 lt!5119)))

(declare-fun lt!5122 () Unit!362)

(declare-fun e!11908 () Unit!362)

(assert (=> d!3435 (= lt!5122 e!11908)))

(declare-fun c!1942 () Bool)

(assert (=> d!3435 (= c!1942 (not (= (map!358 lt!5119) (ListLongMap!534 Nil!532))))))

(declare-fun lt!5129 () Unit!362)

(declare-fun lt!5133 () Unit!362)

(assert (=> d!3435 (= lt!5129 lt!5133)))

(declare-fun lt!5131 () array!1015)

(declare-fun lt!5127 () (_ BitVec 32))

(declare-fun lt!5118 () List!538)

(assert (=> d!3435 (arrayNoDuplicates!0 lt!5131 lt!5127 lt!5118)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1015 (_ BitVec 32) (_ BitVec 32) List!538) Unit!362)

(assert (=> d!3435 (= lt!5133 (lemmaArrayNoDuplicatesInAll0Array!0 lt!5131 lt!5127 (bvadd lt!4849 #b00000000000000000000000000000001) lt!5118))))

(assert (=> d!3435 (= lt!5118 Nil!535)))

(assert (=> d!3435 (= lt!5127 #b00000000000000000000000000000000)))

(assert (=> d!3435 (= lt!5131 (array!1016 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4849 #b00000000000000000000000000000001)))))

(declare-fun lt!5120 () Unit!362)

(declare-fun lt!5114 () Unit!362)

(assert (=> d!3435 (= lt!5120 lt!5114)))

(declare-fun lt!5124 () (_ BitVec 32))

(declare-fun lt!5125 () array!1015)

(assert (=> d!3435 (arrayForallSeekEntryOrOpenFound!0 lt!5124 lt!5125 lt!4849)))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1015 (_ BitVec 32) (_ BitVec 32)) Unit!362)

(assert (=> d!3435 (= lt!5114 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!5125 lt!4849 lt!5124))))

(assert (=> d!3435 (= lt!5124 #b00000000000000000000000000000000)))

(assert (=> d!3435 (= lt!5125 (array!1016 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4849 #b00000000000000000000000000000001)))))

(declare-fun lt!5128 () Unit!362)

(declare-fun lt!5121 () Unit!362)

(assert (=> d!3435 (= lt!5128 lt!5121)))

(declare-fun lt!5115 () array!1015)

(declare-fun lt!5130 () (_ BitVec 32))

(declare-fun lt!5117 () (_ BitVec 32))

(assert (=> d!3435 (= (arrayCountValidKeys!0 lt!5115 lt!5130 lt!5117) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1015 (_ BitVec 32) (_ BitVec 32)) Unit!362)

(assert (=> d!3435 (= lt!5121 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!5115 lt!5130 lt!5117))))

(assert (=> d!3435 (= lt!5117 (bvadd lt!4849 #b00000000000000000000000000000001))))

(assert (=> d!3435 (= lt!5130 #b00000000000000000000000000000000)))

(assert (=> d!3435 (= lt!5115 (array!1016 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4849 #b00000000000000000000000000000001)))))

(assert (=> d!3435 (= lt!5119 (LongMapFixedSize!101 (defaultEntry!1661 (v!1471 (underlying!61 thiss!848))) lt!4849 #b00000000000000000000000000000000 (dynLambda!129 (defaultEntry!1661 (v!1471 (underlying!61 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!129 (defaultEntry!1661 (v!1471 (underlying!61 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1016 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4849 #b00000000000000000000000000000001)) (array!1014 ((as const (Array (_ BitVec 32) ValueCell!257)) EmptyCell!257) (bvadd lt!4849 #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!3435 (validMask!0 lt!4849)))

(assert (=> d!3435 (= (getNewLongMapFixedSize!8 lt!4849 (defaultEntry!1661 (v!1471 (underlying!61 thiss!848)))) lt!5112)))

(declare-fun b!18585 () Bool)

(declare-fun e!11907 () Bool)

(declare-fun lt!5113 () array!1015)

(declare-fun lt!5132 () tuple2!792)

(assert (=> b!18585 (= e!11907 (arrayContainsKey!0 lt!5113 (_1!397 lt!5132) #b00000000000000000000000000000000))))

(declare-fun b!18586 () Bool)

(declare-fun res!12869 () Bool)

(assert (=> b!18586 (=> (not res!12869) (not e!11906))))

(assert (=> b!18586 (= res!12869 (= (mask!4594 lt!5112) lt!4849))))

(declare-fun b!18587 () Bool)

(declare-fun Unit!373 () Unit!362)

(assert (=> b!18587 (= e!11908 Unit!373)))

(declare-fun head!817 (List!535) tuple2!792)

(assert (=> b!18587 (= lt!5132 (head!817 (toList!282 (map!358 lt!5119))))))

(assert (=> b!18587 (= lt!5113 (array!1016 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4849 #b00000000000000000000000000000001)))))

(declare-fun lt!5116 () (_ BitVec 32))

(assert (=> b!18587 (= lt!5116 #b00000000000000000000000000000000)))

(declare-fun lt!5126 () Unit!362)

(declare-fun lemmaKeyInListMapIsInArray!86 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 64) Int) Unit!362)

(assert (=> b!18587 (= lt!5126 (lemmaKeyInListMapIsInArray!86 lt!5113 (array!1014 ((as const (Array (_ BitVec 32) ValueCell!257)) EmptyCell!257) (bvadd lt!4849 #b00000000000000000000000000000001)) lt!4849 lt!5116 (dynLambda!129 (defaultEntry!1661 (v!1471 (underlying!61 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!129 (defaultEntry!1661 (v!1471 (underlying!61 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!397 lt!5132) (defaultEntry!1661 (v!1471 (underlying!61 thiss!848)))))))

(declare-fun c!1941 () Bool)

(assert (=> b!18587 (= c!1941 (and (not (= (_1!397 lt!5132) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!397 lt!5132) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!18587 e!11907))

(declare-fun lt!5111 () Unit!362)

(assert (=> b!18587 (= lt!5111 lt!5126)))

(declare-fun lt!5123 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1015 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!18587 (= lt!5123 (arrayScanForKey!0 (array!1016 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4849 #b00000000000000000000000000000001)) (_1!397 lt!5132) #b00000000000000000000000000000000))))

(assert (=> b!18587 false))

(declare-fun b!18588 () Bool)

(assert (=> b!18588 (= e!11907 (ite (= (_1!397 lt!5132) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!5116 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!5116 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!18589 () Bool)

(declare-fun Unit!374 () Unit!362)

(assert (=> b!18589 (= e!11908 Unit!374)))

(declare-fun b!18590 () Bool)

(assert (=> b!18590 (= e!11906 (= (map!358 lt!5112) (ListLongMap!534 Nil!532)))))

(assert (= (and d!3435 c!1942) b!18587))

(assert (= (and d!3435 (not c!1942)) b!18589))

(assert (= (and b!18587 c!1941) b!18585))

(assert (= (and b!18587 (not c!1941)) b!18588))

(assert (= (and d!3435 res!12868) b!18586))

(assert (= (and b!18586 res!12869) b!18590))

(declare-fun b_lambda!1439 () Bool)

(assert (=> (not b_lambda!1439) (not d!3435)))

(assert (=> d!3435 t!3174))

(declare-fun b_and!1301 () Bool)

(assert (= b_and!1299 (and (=> t!3174 result!1009) b_and!1301)))

(declare-fun b_lambda!1441 () Bool)

(assert (=> (not b_lambda!1441) (not b!18587)))

(assert (=> b!18587 t!3174))

(declare-fun b_and!1303 () Bool)

(assert (= b_and!1301 (and (=> t!3174 result!1009) b_and!1303)))

(assert (=> d!3435 m!12895))

(declare-fun m!12995 () Bool)

(assert (=> d!3435 m!12995))

(declare-fun m!12997 () Bool)

(assert (=> d!3435 m!12997))

(declare-fun m!12999 () Bool)

(assert (=> d!3435 m!12999))

(declare-fun m!13001 () Bool)

(assert (=> d!3435 m!13001))

(declare-fun m!13003 () Bool)

(assert (=> d!3435 m!13003))

(declare-fun m!13005 () Bool)

(assert (=> d!3435 m!13005))

(declare-fun m!13007 () Bool)

(assert (=> d!3435 m!13007))

(declare-fun m!13009 () Bool)

(assert (=> d!3435 m!13009))

(declare-fun m!13011 () Bool)

(assert (=> d!3435 m!13011))

(declare-fun m!13013 () Bool)

(assert (=> b!18585 m!13013))

(assert (=> b!18587 m!12895))

(assert (=> b!18587 m!12895))

(assert (=> b!18587 m!12895))

(declare-fun m!13015 () Bool)

(assert (=> b!18587 m!13015))

(assert (=> b!18587 m!13009))

(declare-fun m!13017 () Bool)

(assert (=> b!18587 m!13017))

(declare-fun m!13019 () Bool)

(assert (=> b!18587 m!13019))

(declare-fun m!13021 () Bool)

(assert (=> b!18590 m!13021))

(assert (=> bm!711 d!3435))

(declare-fun d!3437 () Bool)

(assert (=> d!3437 (= (+!34 (getCurrentListMap!119 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))) (tuple2!793 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (getCurrentListMap!119 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4797 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259 #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun lt!5136 () Unit!362)

(declare-fun choose!188 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 V!1043 Int) Unit!362)

(assert (=> d!3437 (= lt!5136 (choose!188 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4797 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(assert (=> d!3437 (validMask!0 (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))))))

(assert (=> d!3437 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!2 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4797 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))) lt!5136)))

(declare-fun bs!847 () Bool)

(assert (= bs!847 d!3437))

(assert (=> bs!847 m!12703))

(declare-fun m!13023 () Bool)

(assert (=> bs!847 m!13023))

(declare-fun m!13025 () Bool)

(assert (=> bs!847 m!13025))

(declare-fun m!13027 () Bool)

(assert (=> bs!847 m!13027))

(assert (=> bs!847 m!12779))

(assert (=> bs!847 m!12703))

(assert (=> b!18334 d!3437))

(declare-fun d!3439 () Bool)

(assert (=> d!3439 (isDefined!21 (getValueByKey!59 (toList!282 lt!4693) key!682))))

(declare-fun lt!5139 () Unit!362)

(declare-fun choose!189 (List!535 (_ BitVec 64)) Unit!362)

(assert (=> d!3439 (= lt!5139 (choose!189 (toList!282 lt!4693) key!682))))

(declare-fun e!11911 () Bool)

(assert (=> d!3439 e!11911))

(declare-fun res!12872 () Bool)

(assert (=> d!3439 (=> (not res!12872) (not e!11911))))

(declare-fun isStrictlySorted!157 (List!535) Bool)

(assert (=> d!3439 (= res!12872 (isStrictlySorted!157 (toList!282 lt!4693)))))

(assert (=> d!3439 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!282 lt!4693) key!682) lt!5139)))

(declare-fun b!18593 () Bool)

(assert (=> b!18593 (= e!11911 (containsKey!23 (toList!282 lt!4693) key!682))))

(assert (= (and d!3439 res!12872) b!18593))

(assert (=> d!3439 m!12747))

(assert (=> d!3439 m!12747))

(assert (=> d!3439 m!12749))

(declare-fun m!13029 () Bool)

(assert (=> d!3439 m!13029))

(declare-fun m!13031 () Bool)

(assert (=> d!3439 m!13031))

(assert (=> b!18593 m!12743))

(assert (=> b!18358 d!3439))

(declare-fun d!3441 () Bool)

(declare-fun isEmpty!170 (Option!65) Bool)

(assert (=> d!3441 (= (isDefined!21 (getValueByKey!59 (toList!282 lt!4693) key!682)) (not (isEmpty!170 (getValueByKey!59 (toList!282 lt!4693) key!682))))))

(declare-fun bs!848 () Bool)

(assert (= bs!848 d!3441))

(assert (=> bs!848 m!12747))

(declare-fun m!13033 () Bool)

(assert (=> bs!848 m!13033))

(assert (=> b!18358 d!3441))

(declare-fun d!3443 () Bool)

(declare-fun c!1947 () Bool)

(assert (=> d!3443 (= c!1947 (and ((_ is Cons!531) (toList!282 lt!4693)) (= (_1!397 (h!1097 (toList!282 lt!4693))) key!682)))))

(declare-fun e!11916 () Option!65)

(assert (=> d!3443 (= (getValueByKey!59 (toList!282 lt!4693) key!682) e!11916)))

(declare-fun b!18604 () Bool)

(declare-fun e!11917 () Option!65)

(assert (=> b!18604 (= e!11917 (getValueByKey!59 (t!3168 (toList!282 lt!4693)) key!682))))

(declare-fun b!18602 () Bool)

(assert (=> b!18602 (= e!11916 (Some!64 (_2!397 (h!1097 (toList!282 lt!4693)))))))

(declare-fun b!18603 () Bool)

(assert (=> b!18603 (= e!11916 e!11917)))

(declare-fun c!1948 () Bool)

(assert (=> b!18603 (= c!1948 (and ((_ is Cons!531) (toList!282 lt!4693)) (not (= (_1!397 (h!1097 (toList!282 lt!4693))) key!682))))))

(declare-fun b!18605 () Bool)

(assert (=> b!18605 (= e!11917 None!63)))

(assert (= (and d!3443 c!1947) b!18602))

(assert (= (and d!3443 (not c!1947)) b!18603))

(assert (= (and b!18603 c!1948) b!18604))

(assert (= (and b!18603 (not c!1948)) b!18605))

(declare-fun m!13035 () Bool)

(assert (=> b!18604 m!13035))

(assert (=> b!18358 d!3443))

(declare-fun d!3445 () Bool)

(assert (=> d!3445 (= (inRange!0 (ite c!1854 (ite c!1858 (index!2292 lt!4781) (ite c!1853 (index!2291 lt!4796) (index!2294 lt!4796))) (ite c!1862 (index!2292 lt!4793) (ite c!1855 (index!2291 lt!4776) (index!2294 lt!4776)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694))))) (and (bvsge (ite c!1854 (ite c!1858 (index!2292 lt!4781) (ite c!1853 (index!2291 lt!4796) (index!2294 lt!4796))) (ite c!1862 (index!2292 lt!4793) (ite c!1855 (index!2291 lt!4776) (index!2294 lt!4776)))) #b00000000000000000000000000000000) (bvslt (ite c!1854 (ite c!1858 (index!2292 lt!4781) (ite c!1853 (index!2291 lt!4796) (index!2294 lt!4796))) (ite c!1862 (index!2292 lt!4793) (ite c!1855 (index!2291 lt!4776) (index!2294 lt!4776)))) (bvadd (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000001))))))

(assert (=> bm!688 d!3445))

(declare-fun d!3447 () Bool)

(declare-fun e!11919 () Bool)

(assert (=> d!3447 e!11919))

(declare-fun res!12873 () Bool)

(assert (=> d!3447 (=> res!12873 e!11919)))

(declare-fun lt!5142 () Bool)

(assert (=> d!3447 (= res!12873 (not lt!5142))))

(declare-fun lt!5140 () Bool)

(assert (=> d!3447 (= lt!5142 lt!5140)))

(declare-fun lt!5143 () Unit!362)

(declare-fun e!11918 () Unit!362)

(assert (=> d!3447 (= lt!5143 e!11918)))

(declare-fun c!1949 () Bool)

(assert (=> d!3447 (= c!1949 lt!5140)))

(assert (=> d!3447 (= lt!5140 (containsKey!23 (toList!282 lt!4811) (_1!397 (tuple2!793 key!682 v!259))))))

(assert (=> d!3447 (= (contains!213 lt!4811 (_1!397 (tuple2!793 key!682 v!259))) lt!5142)))

(declare-fun b!18606 () Bool)

(declare-fun lt!5141 () Unit!362)

(assert (=> b!18606 (= e!11918 lt!5141)))

(assert (=> b!18606 (= lt!5141 (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!282 lt!4811) (_1!397 (tuple2!793 key!682 v!259))))))

(assert (=> b!18606 (isDefined!21 (getValueByKey!59 (toList!282 lt!4811) (_1!397 (tuple2!793 key!682 v!259))))))

(declare-fun b!18607 () Bool)

(declare-fun Unit!375 () Unit!362)

(assert (=> b!18607 (= e!11918 Unit!375)))

(declare-fun b!18608 () Bool)

(assert (=> b!18608 (= e!11919 (isDefined!21 (getValueByKey!59 (toList!282 lt!4811) (_1!397 (tuple2!793 key!682 v!259)))))))

(assert (= (and d!3447 c!1949) b!18606))

(assert (= (and d!3447 (not c!1949)) b!18607))

(assert (= (and d!3447 (not res!12873)) b!18608))

(declare-fun m!13037 () Bool)

(assert (=> d!3447 m!13037))

(declare-fun m!13039 () Bool)

(assert (=> b!18606 m!13039))

(assert (=> b!18606 m!12739))

(assert (=> b!18606 m!12739))

(declare-fun m!13041 () Bool)

(assert (=> b!18606 m!13041))

(assert (=> b!18608 m!12739))

(assert (=> b!18608 m!12739))

(assert (=> b!18608 m!13041))

(assert (=> d!3403 d!3447))

(declare-fun c!1950 () Bool)

(declare-fun d!3449 () Bool)

(assert (=> d!3449 (= c!1950 (and ((_ is Cons!531) lt!4813) (= (_1!397 (h!1097 lt!4813)) (_1!397 (tuple2!793 key!682 v!259)))))))

(declare-fun e!11920 () Option!65)

(assert (=> d!3449 (= (getValueByKey!59 lt!4813 (_1!397 (tuple2!793 key!682 v!259))) e!11920)))

(declare-fun e!11921 () Option!65)

(declare-fun b!18611 () Bool)

(assert (=> b!18611 (= e!11921 (getValueByKey!59 (t!3168 lt!4813) (_1!397 (tuple2!793 key!682 v!259))))))

(declare-fun b!18609 () Bool)

(assert (=> b!18609 (= e!11920 (Some!64 (_2!397 (h!1097 lt!4813))))))

(declare-fun b!18610 () Bool)

(assert (=> b!18610 (= e!11920 e!11921)))

(declare-fun c!1951 () Bool)

(assert (=> b!18610 (= c!1951 (and ((_ is Cons!531) lt!4813) (not (= (_1!397 (h!1097 lt!4813)) (_1!397 (tuple2!793 key!682 v!259))))))))

(declare-fun b!18612 () Bool)

(assert (=> b!18612 (= e!11921 None!63)))

(assert (= (and d!3449 c!1950) b!18609))

(assert (= (and d!3449 (not c!1950)) b!18610))

(assert (= (and b!18610 c!1951) b!18611))

(assert (= (and b!18610 (not c!1951)) b!18612))

(declare-fun m!13043 () Bool)

(assert (=> b!18611 m!13043))

(assert (=> d!3403 d!3449))

(declare-fun d!3451 () Bool)

(assert (=> d!3451 (= (getValueByKey!59 lt!4813 (_1!397 (tuple2!793 key!682 v!259))) (Some!64 (_2!397 (tuple2!793 key!682 v!259))))))

(declare-fun lt!5146 () Unit!362)

(declare-fun choose!190 (List!535 (_ BitVec 64) V!1043) Unit!362)

(assert (=> d!3451 (= lt!5146 (choose!190 lt!4813 (_1!397 (tuple2!793 key!682 v!259)) (_2!397 (tuple2!793 key!682 v!259))))))

(declare-fun e!11924 () Bool)

(assert (=> d!3451 e!11924))

(declare-fun res!12878 () Bool)

(assert (=> d!3451 (=> (not res!12878) (not e!11924))))

(assert (=> d!3451 (= res!12878 (isStrictlySorted!157 lt!4813))))

(assert (=> d!3451 (= (lemmaContainsTupThenGetReturnValue!16 lt!4813 (_1!397 (tuple2!793 key!682 v!259)) (_2!397 (tuple2!793 key!682 v!259))) lt!5146)))

(declare-fun b!18617 () Bool)

(declare-fun res!12879 () Bool)

(assert (=> b!18617 (=> (not res!12879) (not e!11924))))

(assert (=> b!18617 (= res!12879 (containsKey!23 lt!4813 (_1!397 (tuple2!793 key!682 v!259))))))

(declare-fun b!18618 () Bool)

(assert (=> b!18618 (= e!11924 (contains!216 lt!4813 (tuple2!793 (_1!397 (tuple2!793 key!682 v!259)) (_2!397 (tuple2!793 key!682 v!259)))))))

(assert (= (and d!3451 res!12878) b!18617))

(assert (= (and b!18617 res!12879) b!18618))

(assert (=> d!3451 m!12733))

(declare-fun m!13045 () Bool)

(assert (=> d!3451 m!13045))

(declare-fun m!13047 () Bool)

(assert (=> d!3451 m!13047))

(declare-fun m!13049 () Bool)

(assert (=> b!18617 m!13049))

(declare-fun m!13051 () Bool)

(assert (=> b!18618 m!13051))

(assert (=> d!3403 d!3451))

(declare-fun b!18639 () Bool)

(declare-fun e!11936 () List!535)

(declare-fun c!1960 () Bool)

(declare-fun c!1962 () Bool)

(assert (=> b!18639 (= e!11936 (ite c!1962 (t!3168 (toList!282 call!619)) (ite c!1960 (Cons!531 (h!1097 (toList!282 call!619)) (t!3168 (toList!282 call!619))) Nil!532)))))

(declare-fun b!18640 () Bool)

(declare-fun e!11938 () List!535)

(declare-fun call!808 () List!535)

(assert (=> b!18640 (= e!11938 call!808)))

(declare-fun bm!804 () Bool)

(declare-fun call!807 () List!535)

(declare-fun call!809 () List!535)

(assert (=> bm!804 (= call!807 call!809)))

(declare-fun b!18641 () Bool)

(assert (=> b!18641 (= c!1960 (and ((_ is Cons!531) (toList!282 call!619)) (bvsgt (_1!397 (h!1097 (toList!282 call!619))) (_1!397 (tuple2!793 key!682 v!259)))))))

(declare-fun e!11939 () List!535)

(assert (=> b!18641 (= e!11939 e!11938)))

(declare-fun b!18642 () Bool)

(declare-fun res!12884 () Bool)

(declare-fun e!11935 () Bool)

(assert (=> b!18642 (=> (not res!12884) (not e!11935))))

(declare-fun lt!5149 () List!535)

(assert (=> b!18642 (= res!12884 (containsKey!23 lt!5149 (_1!397 (tuple2!793 key!682 v!259))))))

(declare-fun b!18643 () Bool)

(assert (=> b!18643 (= e!11938 call!808)))

(declare-fun d!3453 () Bool)

(assert (=> d!3453 e!11935))

(declare-fun res!12885 () Bool)

(assert (=> d!3453 (=> (not res!12885) (not e!11935))))

(assert (=> d!3453 (= res!12885 (isStrictlySorted!157 lt!5149))))

(declare-fun e!11937 () List!535)

(assert (=> d!3453 (= lt!5149 e!11937)))

(declare-fun c!1961 () Bool)

(assert (=> d!3453 (= c!1961 (and ((_ is Cons!531) (toList!282 call!619)) (bvslt (_1!397 (h!1097 (toList!282 call!619))) (_1!397 (tuple2!793 key!682 v!259)))))))

(assert (=> d!3453 (isStrictlySorted!157 (toList!282 call!619))))

(assert (=> d!3453 (= (insertStrictlySorted!16 (toList!282 call!619) (_1!397 (tuple2!793 key!682 v!259)) (_2!397 (tuple2!793 key!682 v!259))) lt!5149)))

(declare-fun b!18644 () Bool)

(assert (=> b!18644 (= e!11936 (insertStrictlySorted!16 (t!3168 (toList!282 call!619)) (_1!397 (tuple2!793 key!682 v!259)) (_2!397 (tuple2!793 key!682 v!259))))))

(declare-fun bm!805 () Bool)

(declare-fun $colon$colon!29 (List!535 tuple2!792) List!535)

(assert (=> bm!805 (= call!809 ($colon$colon!29 e!11936 (ite c!1961 (h!1097 (toList!282 call!619)) (tuple2!793 (_1!397 (tuple2!793 key!682 v!259)) (_2!397 (tuple2!793 key!682 v!259))))))))

(declare-fun c!1963 () Bool)

(assert (=> bm!805 (= c!1963 c!1961)))

(declare-fun b!18645 () Bool)

(assert (=> b!18645 (= e!11937 e!11939)))

(assert (=> b!18645 (= c!1962 (and ((_ is Cons!531) (toList!282 call!619)) (= (_1!397 (h!1097 (toList!282 call!619))) (_1!397 (tuple2!793 key!682 v!259)))))))

(declare-fun b!18646 () Bool)

(assert (=> b!18646 (= e!11939 call!807)))

(declare-fun b!18647 () Bool)

(assert (=> b!18647 (= e!11935 (contains!216 lt!5149 (tuple2!793 (_1!397 (tuple2!793 key!682 v!259)) (_2!397 (tuple2!793 key!682 v!259)))))))

(declare-fun bm!806 () Bool)

(assert (=> bm!806 (= call!808 call!807)))

(declare-fun b!18648 () Bool)

(assert (=> b!18648 (= e!11937 call!809)))

(assert (= (and d!3453 c!1961) b!18648))

(assert (= (and d!3453 (not c!1961)) b!18645))

(assert (= (and b!18645 c!1962) b!18646))

(assert (= (and b!18645 (not c!1962)) b!18641))

(assert (= (and b!18641 c!1960) b!18640))

(assert (= (and b!18641 (not c!1960)) b!18643))

(assert (= (or b!18640 b!18643) bm!806))

(assert (= (or b!18646 bm!806) bm!804))

(assert (= (or b!18648 bm!804) bm!805))

(assert (= (and bm!805 c!1963) b!18644))

(assert (= (and bm!805 (not c!1963)) b!18639))

(assert (= (and d!3453 res!12885) b!18642))

(assert (= (and b!18642 res!12884) b!18647))

(declare-fun m!13053 () Bool)

(assert (=> b!18642 m!13053))

(declare-fun m!13055 () Bool)

(assert (=> d!3453 m!13055))

(declare-fun m!13057 () Bool)

(assert (=> d!3453 m!13057))

(declare-fun m!13059 () Bool)

(assert (=> bm!805 m!13059))

(declare-fun m!13061 () Bool)

(assert (=> b!18644 m!13061))

(declare-fun m!13063 () Bool)

(assert (=> b!18647 m!13063))

(assert (=> d!3403 d!3453))

(declare-fun d!3455 () Bool)

(declare-fun res!12886 () Bool)

(declare-fun e!11940 () Bool)

(assert (=> d!3455 (=> (not res!12886) (not e!11940))))

(assert (=> d!3455 (= res!12886 (simpleValid!9 (_2!398 lt!4785)))))

(assert (=> d!3455 (= (valid!58 (_2!398 lt!4785)) e!11940)))

(declare-fun b!18649 () Bool)

(declare-fun res!12887 () Bool)

(assert (=> b!18649 (=> (not res!12887) (not e!11940))))

(assert (=> b!18649 (= res!12887 (= (arrayCountValidKeys!0 (_keys!3086 (_2!398 lt!4785)) #b00000000000000000000000000000000 (size!579 (_keys!3086 (_2!398 lt!4785)))) (_size!82 (_2!398 lt!4785))))))

(declare-fun b!18650 () Bool)

(declare-fun res!12888 () Bool)

(assert (=> b!18650 (=> (not res!12888) (not e!11940))))

(assert (=> b!18650 (= res!12888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3086 (_2!398 lt!4785)) (mask!4594 (_2!398 lt!4785))))))

(declare-fun b!18651 () Bool)

(assert (=> b!18651 (= e!11940 (arrayNoDuplicates!0 (_keys!3086 (_2!398 lt!4785)) #b00000000000000000000000000000000 Nil!535))))

(assert (= (and d!3455 res!12886) b!18649))

(assert (= (and b!18649 res!12887) b!18650))

(assert (= (and b!18650 res!12888) b!18651))

(declare-fun m!13065 () Bool)

(assert (=> d!3455 m!13065))

(declare-fun m!13067 () Bool)

(assert (=> b!18649 m!13067))

(declare-fun m!13069 () Bool)

(assert (=> b!18650 m!13069))

(declare-fun m!13071 () Bool)

(assert (=> b!18651 m!13071))

(assert (=> d!3397 d!3455))

(declare-fun d!3457 () Bool)

(declare-fun res!12889 () Bool)

(declare-fun e!11941 () Bool)

(assert (=> d!3457 (=> (not res!12889) (not e!11941))))

(assert (=> d!3457 (= res!12889 (simpleValid!9 (v!1471 (underlying!61 (_2!396 lt!4694)))))))

(assert (=> d!3457 (= (valid!58 (v!1471 (underlying!61 (_2!396 lt!4694)))) e!11941)))

(declare-fun b!18652 () Bool)

(declare-fun res!12890 () Bool)

(assert (=> b!18652 (=> (not res!12890) (not e!11941))))

(assert (=> b!18652 (= res!12890 (= (arrayCountValidKeys!0 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))) (_size!82 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun b!18653 () Bool)

(declare-fun res!12891 () Bool)

(assert (=> b!18653 (=> (not res!12891) (not e!11941))))

(assert (=> b!18653 (= res!12891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun b!18654 () Bool)

(assert (=> b!18654 (= e!11941 (arrayNoDuplicates!0 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 Nil!535))))

(assert (= (and d!3457 res!12889) b!18652))

(assert (= (and b!18652 res!12890) b!18653))

(assert (= (and b!18653 res!12891) b!18654))

(declare-fun m!13073 () Bool)

(assert (=> d!3457 m!13073))

(declare-fun m!13075 () Bool)

(assert (=> b!18652 m!13075))

(declare-fun m!13077 () Bool)

(assert (=> b!18653 m!13077))

(declare-fun m!13079 () Bool)

(assert (=> b!18654 m!13079))

(assert (=> d!3397 d!3457))

(declare-fun d!3459 () Bool)

(declare-fun e!11944 () Bool)

(assert (=> d!3459 e!11944))

(declare-fun res!12896 () Bool)

(assert (=> d!3459 (=> (not res!12896) (not e!11944))))

(declare-fun lt!5154 () SeekEntryResult!43)

(assert (=> d!3459 (= res!12896 ((_ is Found!43) lt!5154))))

(assert (=> d!3459 (= lt!5154 (seekEntryOrOpen!0 key!682 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun lt!5155 () Unit!362)

(declare-fun choose!191 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 64) Int) Unit!362)

(assert (=> d!3459 (= lt!5155 (choose!191 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) key!682 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(assert (=> d!3459 (validMask!0 (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))))))

(assert (=> d!3459 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!2 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) key!682 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))) lt!5155)))

(declare-fun b!18659 () Bool)

(declare-fun res!12897 () Bool)

(assert (=> b!18659 (=> (not res!12897) (not e!11944))))

(assert (=> b!18659 (= res!12897 (inRange!0 (index!2292 lt!5154) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun b!18660 () Bool)

(assert (=> b!18660 (= e!11944 (= (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!5154)) key!682))))

(assert (=> b!18660 (and (bvsge (index!2292 lt!5154) #b00000000000000000000000000000000) (bvslt (index!2292 lt!5154) (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(assert (= (and d!3459 res!12896) b!18659))

(assert (= (and b!18659 res!12897) b!18660))

(assert (=> d!3459 m!12683))

(declare-fun m!13081 () Bool)

(assert (=> d!3459 m!13081))

(assert (=> d!3459 m!12779))

(declare-fun m!13083 () Bool)

(assert (=> b!18659 m!13083))

(declare-fun m!13085 () Bool)

(assert (=> b!18660 m!13085))

(assert (=> bm!699 d!3459))

(declare-fun b!18661 () Bool)

(declare-fun e!11949 () Unit!362)

(declare-fun lt!5158 () Unit!362)

(assert (=> b!18661 (= e!11949 lt!5158)))

(declare-fun lt!5159 () ListLongMap!533)

(assert (=> b!18661 (= lt!5159 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1852 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (array!1014 (store (arr!488 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!4782) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1852 (ite c!1861 lt!4788 lt!4797) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite (and c!1852 c!1861) v!259 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite c!1852 (ite c!1861 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun lt!5157 () (_ BitVec 64))

(assert (=> b!18661 (= lt!5157 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5168 () (_ BitVec 64))

(assert (=> b!18661 (= lt!5168 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000))))

(declare-fun lt!5175 () Unit!362)

(assert (=> b!18661 (= lt!5175 (addStillContains!12 lt!5159 lt!5157 (ite (and c!1852 c!1861) v!259 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))) lt!5168))))

(assert (=> b!18661 (contains!213 (+!34 lt!5159 (tuple2!793 lt!5157 (ite (and c!1852 c!1861) v!259 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))))) lt!5168)))

(declare-fun lt!5173 () Unit!362)

(assert (=> b!18661 (= lt!5173 lt!5175)))

(declare-fun lt!5174 () ListLongMap!533)

(assert (=> b!18661 (= lt!5174 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1852 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (array!1014 (store (arr!488 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!4782) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1852 (ite c!1861 lt!4788 lt!4797) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite (and c!1852 c!1861) v!259 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite c!1852 (ite c!1861 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun lt!5156 () (_ BitVec 64))

(assert (=> b!18661 (= lt!5156 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5165 () (_ BitVec 64))

(assert (=> b!18661 (= lt!5165 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000))))

(declare-fun lt!5164 () Unit!362)

(assert (=> b!18661 (= lt!5164 (addApplyDifferent!12 lt!5174 lt!5156 (ite c!1852 (ite c!1861 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))) lt!5165))))

(assert (=> b!18661 (= (apply!27 (+!34 lt!5174 (tuple2!793 lt!5156 (ite c!1852 (ite c!1861 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))))) lt!5165) (apply!27 lt!5174 lt!5165))))

(declare-fun lt!5162 () Unit!362)

(assert (=> b!18661 (= lt!5162 lt!5164)))

(declare-fun lt!5161 () ListLongMap!533)

(assert (=> b!18661 (= lt!5161 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1852 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (array!1014 (store (arr!488 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!4782) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1852 (ite c!1861 lt!4788 lt!4797) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite (and c!1852 c!1861) v!259 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite c!1852 (ite c!1861 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun lt!5177 () (_ BitVec 64))

(assert (=> b!18661 (= lt!5177 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5163 () (_ BitVec 64))

(assert (=> b!18661 (= lt!5163 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000))))

(declare-fun lt!5172 () Unit!362)

(assert (=> b!18661 (= lt!5172 (addApplyDifferent!12 lt!5161 lt!5177 (ite (and c!1852 c!1861) v!259 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))) lt!5163))))

(assert (=> b!18661 (= (apply!27 (+!34 lt!5161 (tuple2!793 lt!5177 (ite (and c!1852 c!1861) v!259 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))))) lt!5163) (apply!27 lt!5161 lt!5163))))

(declare-fun lt!5167 () Unit!362)

(assert (=> b!18661 (= lt!5167 lt!5172)))

(declare-fun lt!5170 () ListLongMap!533)

(assert (=> b!18661 (= lt!5170 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1852 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (array!1014 (store (arr!488 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!4782) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1852 (ite c!1861 lt!4788 lt!4797) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite (and c!1852 c!1861) v!259 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite c!1852 (ite c!1861 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun lt!5171 () (_ BitVec 64))

(assert (=> b!18661 (= lt!5171 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5166 () (_ BitVec 64))

(assert (=> b!18661 (= lt!5166 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000))))

(assert (=> b!18661 (= lt!5158 (addApplyDifferent!12 lt!5170 lt!5171 (ite c!1852 (ite c!1861 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))) lt!5166))))

(assert (=> b!18661 (= (apply!27 (+!34 lt!5170 (tuple2!793 lt!5171 (ite c!1852 (ite c!1861 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))))) lt!5166) (apply!27 lt!5170 lt!5166))))

(declare-fun b!18662 () Bool)

(declare-fun Unit!376 () Unit!362)

(assert (=> b!18662 (= e!11949 Unit!376)))

(declare-fun bm!807 () Bool)

(declare-fun call!816 () ListLongMap!533)

(declare-fun call!811 () ListLongMap!533)

(assert (=> bm!807 (= call!816 call!811)))

(declare-fun bm!808 () Bool)

(declare-fun call!812 () Bool)

(declare-fun lt!5176 () ListLongMap!533)

(assert (=> bm!808 (= call!812 (contains!213 lt!5176 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!1968 () Bool)

(declare-fun c!1966 () Bool)

(declare-fun call!813 () ListLongMap!533)

(declare-fun call!810 () ListLongMap!533)

(declare-fun bm!809 () Bool)

(assert (=> bm!809 (= call!810 (+!34 (ite c!1968 call!811 (ite c!1966 call!816 call!813)) (ite (or c!1968 c!1966) (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!1852 c!1861) v!259 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))))) (tuple2!793 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1852 (ite c!1861 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))))

(declare-fun b!18663 () Bool)

(declare-fun e!11957 () ListLongMap!533)

(assert (=> b!18663 (= e!11957 call!813)))

(declare-fun b!18664 () Bool)

(declare-fun e!11954 () Bool)

(assert (=> b!18664 (= e!11954 (not call!812))))

(declare-fun b!18665 () Bool)

(declare-fun e!11952 () Bool)

(assert (=> b!18665 (= e!11952 (= (apply!27 lt!5176 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!1852 c!1861) v!259 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun b!18666 () Bool)

(declare-fun res!12902 () Bool)

(declare-fun e!11956 () Bool)

(assert (=> b!18666 (=> (not res!12902) (not e!11956))))

(assert (=> b!18666 (= res!12902 e!11954)))

(declare-fun c!1969 () Bool)

(assert (=> b!18666 (= c!1969 (not (= (bvand (ite c!1852 (ite c!1861 lt!4788 lt!4797) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!18667 () Bool)

(declare-fun call!814 () ListLongMap!533)

(assert (=> b!18667 (= e!11957 call!814)))

(declare-fun b!18668 () Bool)

(declare-fun e!11951 () Bool)

(assert (=> b!18668 (= e!11951 (validKeyInArray!0 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000)))))

(declare-fun b!18669 () Bool)

(declare-fun e!11953 () Bool)

(declare-fun call!815 () Bool)

(assert (=> b!18669 (= e!11953 (not call!815))))

(declare-fun b!18670 () Bool)

(declare-fun c!1967 () Bool)

(assert (=> b!18670 (= c!1967 (and (not (= (bvand (ite c!1852 (ite c!1861 lt!4788 lt!4797) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!1852 (ite c!1861 lt!4788 lt!4797) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!11945 () ListLongMap!533)

(assert (=> b!18670 (= e!11945 e!11957)))

(declare-fun b!18671 () Bool)

(declare-fun e!11946 () Bool)

(assert (=> b!18671 (= e!11946 (validKeyInArray!0 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000)))))

(declare-fun b!18672 () Bool)

(declare-fun e!11955 () Bool)

(assert (=> b!18672 (= e!11955 (= (apply!27 lt!5176 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!1852 (ite c!1861 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun b!18673 () Bool)

(assert (=> b!18673 (= e!11954 e!11952)))

(declare-fun res!12903 () Bool)

(assert (=> b!18673 (= res!12903 call!812)))

(assert (=> b!18673 (=> (not res!12903) (not e!11952))))

(declare-fun b!18674 () Bool)

(declare-fun e!11947 () ListLongMap!533)

(assert (=> b!18674 (= e!11947 e!11945)))

(assert (=> b!18674 (= c!1966 (and (not (= (bvand (ite c!1852 (ite c!1861 lt!4788 lt!4797) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!1852 (ite c!1861 lt!4788 lt!4797) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!18675 () Bool)

(declare-fun e!11948 () Bool)

(assert (=> b!18675 (= e!11948 (= (apply!27 lt!5176 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000)) (get!348 (select (arr!488 (ite c!1852 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (array!1014 (store (arr!488 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!4782) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))))))) #b00000000000000000000000000000000) (dynLambda!129 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!18675 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!578 (ite c!1852 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (array!1014 (store (arr!488 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!4782) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))))))))))

(assert (=> b!18675 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun bm!811 () Bool)

(assert (=> bm!811 (= call!813 call!816)))

(declare-fun bm!812 () Bool)

(assert (=> bm!812 (= call!815 (contains!213 lt!5176 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!813 () Bool)

(assert (=> bm!813 (= call!814 call!810)))

(declare-fun b!18676 () Bool)

(declare-fun res!12900 () Bool)

(assert (=> b!18676 (=> (not res!12900) (not e!11956))))

(declare-fun e!11950 () Bool)

(assert (=> b!18676 (= res!12900 e!11950)))

(declare-fun res!12901 () Bool)

(assert (=> b!18676 (=> res!12901 e!11950)))

(assert (=> b!18676 (= res!12901 (not e!11946))))

(declare-fun res!12904 () Bool)

(assert (=> b!18676 (=> (not res!12904) (not e!11946))))

(assert (=> b!18676 (= res!12904 (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun b!18677 () Bool)

(assert (=> b!18677 (= e!11956 e!11953)))

(declare-fun c!1964 () Bool)

(assert (=> b!18677 (= c!1964 (not (= (bvand (ite c!1852 (ite c!1861 lt!4788 lt!4797) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!3461 () Bool)

(assert (=> d!3461 e!11956))

(declare-fun res!12905 () Bool)

(assert (=> d!3461 (=> (not res!12905) (not e!11956))))

(assert (=> d!3461 (= res!12905 (or (bvsge #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))))

(declare-fun lt!5169 () ListLongMap!533)

(assert (=> d!3461 (= lt!5176 lt!5169)))

(declare-fun lt!5160 () Unit!362)

(assert (=> d!3461 (= lt!5160 e!11949)))

(declare-fun c!1965 () Bool)

(assert (=> d!3461 (= c!1965 e!11951)))

(declare-fun res!12898 () Bool)

(assert (=> d!3461 (=> (not res!12898) (not e!11951))))

(assert (=> d!3461 (= res!12898 (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(assert (=> d!3461 (= lt!5169 e!11947)))

(assert (=> d!3461 (= c!1968 (and (not (= (bvand (ite c!1852 (ite c!1861 lt!4788 lt!4797) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!1852 (ite c!1861 lt!4788 lt!4797) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3461 (validMask!0 (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))))))

(assert (=> d!3461 (= (getCurrentListMap!119 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1852 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (array!1014 (store (arr!488 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!4782) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1852 (ite c!1861 lt!4788 lt!4797) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite (and c!1852 c!1861) v!259 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite c!1852 (ite c!1861 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))) lt!5176)))

(declare-fun bm!810 () Bool)

(assert (=> bm!810 (= call!811 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1852 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (array!1014 (store (arr!488 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!4782) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1852 (ite c!1861 lt!4788 lt!4797) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite (and c!1852 c!1861) v!259 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite c!1852 (ite c!1861 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun b!18678 () Bool)

(assert (=> b!18678 (= e!11953 e!11955)))

(declare-fun res!12906 () Bool)

(assert (=> b!18678 (= res!12906 call!815)))

(assert (=> b!18678 (=> (not res!12906) (not e!11955))))

(declare-fun b!18679 () Bool)

(assert (=> b!18679 (= e!11950 e!11948)))

(declare-fun res!12899 () Bool)

(assert (=> b!18679 (=> (not res!12899) (not e!11948))))

(assert (=> b!18679 (= res!12899 (contains!213 lt!5176 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000)))))

(assert (=> b!18679 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun b!18680 () Bool)

(assert (=> b!18680 (= e!11945 call!814)))

(declare-fun b!18681 () Bool)

(assert (=> b!18681 (= e!11947 (+!34 call!810 (tuple2!793 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1852 (ite c!1861 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) v!259) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))))))))

(assert (= (and d!3461 c!1968) b!18681))

(assert (= (and d!3461 (not c!1968)) b!18674))

(assert (= (and b!18674 c!1966) b!18680))

(assert (= (and b!18674 (not c!1966)) b!18670))

(assert (= (and b!18670 c!1967) b!18667))

(assert (= (and b!18670 (not c!1967)) b!18663))

(assert (= (or b!18667 b!18663) bm!811))

(assert (= (or b!18680 bm!811) bm!807))

(assert (= (or b!18680 b!18667) bm!813))

(assert (= (or b!18681 bm!807) bm!810))

(assert (= (or b!18681 bm!813) bm!809))

(assert (= (and d!3461 res!12898) b!18668))

(assert (= (and d!3461 c!1965) b!18661))

(assert (= (and d!3461 (not c!1965)) b!18662))

(assert (= (and d!3461 res!12905) b!18676))

(assert (= (and b!18676 res!12904) b!18671))

(assert (= (and b!18676 (not res!12901)) b!18679))

(assert (= (and b!18679 res!12899) b!18675))

(assert (= (and b!18676 res!12900) b!18666))

(assert (= (and b!18666 c!1969) b!18673))

(assert (= (and b!18666 (not c!1969)) b!18664))

(assert (= (and b!18673 res!12903) b!18665))

(assert (= (or b!18673 b!18664) bm!808))

(assert (= (and b!18666 res!12902) b!18677))

(assert (= (and b!18677 c!1964) b!18678))

(assert (= (and b!18677 (not c!1964)) b!18669))

(assert (= (and b!18678 res!12906) b!18672))

(assert (= (or b!18678 b!18669) bm!812))

(declare-fun b_lambda!1443 () Bool)

(assert (=> (not b_lambda!1443) (not b!18675)))

(assert (=> b!18675 t!3172))

(declare-fun b_and!1305 () Bool)

(assert (= b_and!1303 (and (=> t!3172 result!1005) b_and!1305)))

(declare-fun m!13087 () Bool)

(assert (=> bm!809 m!13087))

(declare-fun m!13089 () Bool)

(assert (=> b!18672 m!13089))

(assert (=> b!18679 m!12809))

(assert (=> b!18679 m!12809))

(declare-fun m!13091 () Bool)

(assert (=> b!18679 m!13091))

(declare-fun m!13093 () Bool)

(assert (=> b!18675 m!13093))

(assert (=> b!18675 m!12815))

(assert (=> b!18675 m!12809))

(assert (=> b!18675 m!13093))

(assert (=> b!18675 m!12815))

(declare-fun m!13095 () Bool)

(assert (=> b!18675 m!13095))

(assert (=> b!18675 m!12809))

(declare-fun m!13097 () Bool)

(assert (=> b!18675 m!13097))

(declare-fun m!13099 () Bool)

(assert (=> b!18681 m!13099))

(assert (=> d!3461 m!12779))

(declare-fun m!13101 () Bool)

(assert (=> b!18665 m!13101))

(assert (=> b!18668 m!12809))

(assert (=> b!18668 m!12809))

(assert (=> b!18668 m!12825))

(declare-fun m!13103 () Bool)

(assert (=> bm!812 m!13103))

(declare-fun m!13105 () Bool)

(assert (=> bm!810 m!13105))

(declare-fun m!13107 () Bool)

(assert (=> bm!808 m!13107))

(declare-fun m!13109 () Bool)

(assert (=> b!18661 m!13109))

(declare-fun m!13111 () Bool)

(assert (=> b!18661 m!13111))

(declare-fun m!13113 () Bool)

(assert (=> b!18661 m!13113))

(declare-fun m!13115 () Bool)

(assert (=> b!18661 m!13115))

(declare-fun m!13117 () Bool)

(assert (=> b!18661 m!13117))

(assert (=> b!18661 m!12809))

(declare-fun m!13119 () Bool)

(assert (=> b!18661 m!13119))

(assert (=> b!18661 m!13113))

(declare-fun m!13121 () Bool)

(assert (=> b!18661 m!13121))

(declare-fun m!13123 () Bool)

(assert (=> b!18661 m!13123))

(assert (=> b!18661 m!13105))

(declare-fun m!13125 () Bool)

(assert (=> b!18661 m!13125))

(declare-fun m!13127 () Bool)

(assert (=> b!18661 m!13127))

(declare-fun m!13129 () Bool)

(assert (=> b!18661 m!13129))

(declare-fun m!13131 () Bool)

(assert (=> b!18661 m!13131))

(declare-fun m!13133 () Bool)

(assert (=> b!18661 m!13133))

(assert (=> b!18661 m!13121))

(assert (=> b!18661 m!13111))

(declare-fun m!13135 () Bool)

(assert (=> b!18661 m!13135))

(declare-fun m!13137 () Bool)

(assert (=> b!18661 m!13137))

(assert (=> b!18661 m!13125))

(assert (=> b!18671 m!12809))

(assert (=> b!18671 m!12809))

(assert (=> b!18671 m!12825))

(assert (=> bm!698 d!3461))

(declare-fun call!833 () ListLongMap!533)

(declare-fun call!821 () ListLongMap!533)

(declare-fun e!11974 () Bool)

(declare-fun b!18682 () Bool)

(assert (=> b!18682 (= e!11974 (= call!821 (+!34 call!833 (tuple2!793 (ite c!1875 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1877 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1875 (minValue!1597 (v!1471 (underlying!61 thiss!848))) (ite c!1877 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 (v!1471 (underlying!61 thiss!848)))))))))))

(declare-fun bm!814 () Bool)

(declare-fun call!840 () SeekEntryResult!43)

(declare-fun call!823 () SeekEntryResult!43)

(assert (=> bm!814 (= call!840 call!823)))

(declare-fun b!18683 () Bool)

(declare-fun e!11969 () tuple2!794)

(declare-fun e!11963 () tuple2!794)

(assert (=> b!18683 (= e!11969 e!11963)))

(declare-fun c!1974 () Bool)

(declare-fun lt!5185 () SeekEntryResult!43)

(assert (=> b!18683 (= c!1974 ((_ is MissingZero!43) lt!5185))))

(declare-fun b!18684 () Bool)

(declare-fun e!11967 () Bool)

(declare-fun call!826 () Bool)

(assert (=> b!18684 (= e!11967 (not call!826))))

(declare-fun b!18685 () Bool)

(declare-fun e!11958 () Bool)

(declare-fun lt!5179 () SeekEntryResult!43)

(assert (=> b!18685 (= e!11958 ((_ is Undefined!43) lt!5179))))

(declare-fun b!18686 () Bool)

(declare-fun e!11976 () Bool)

(declare-fun call!817 () Bool)

(assert (=> b!18686 (= e!11976 (not call!817))))

(declare-fun bm!815 () Bool)

(declare-fun call!830 () ListLongMap!533)

(declare-fun call!838 () ListLongMap!533)

(assert (=> bm!815 (= call!830 call!838)))

(declare-fun bm!816 () Bool)

(declare-fun call!827 () Bool)

(declare-fun call!822 () Bool)

(assert (=> bm!816 (= call!827 call!822)))

(declare-fun b!18687 () Bool)

(declare-fun c!1978 () Bool)

(assert (=> b!18687 (= c!1978 ((_ is MissingVacant!43) lt!5185))))

(declare-fun e!11960 () tuple2!794)

(assert (=> b!18687 (= e!11960 e!11969)))

(declare-fun b!18688 () Bool)

(declare-fun res!12912 () Bool)

(assert (=> b!18688 (=> (not res!12912) (not e!11967))))

(assert (=> b!18688 (= res!12912 (= (select (arr!489 (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716))) (index!2291 lt!5179)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18689 () Bool)

(declare-fun e!11968 () Bool)

(declare-fun lt!5196 () SeekEntryResult!43)

(assert (=> b!18689 (= e!11968 (= (select (arr!489 (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716))) (index!2292 lt!5196)) (ite c!1875 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1877 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!18690 () Bool)

(declare-fun res!12909 () Bool)

(assert (=> b!18690 (=> (not res!12909) (not e!11976))))

(declare-fun lt!5199 () SeekEntryResult!43)

(assert (=> b!18690 (= res!12909 (= (select (arr!489 (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716))) (index!2291 lt!5199)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!817 () Bool)

(declare-fun call!818 () Bool)

(declare-fun call!834 () Bool)

(assert (=> bm!817 (= call!818 call!834)))

(declare-fun bm!818 () Bool)

(declare-fun call!839 () Bool)

(assert (=> bm!818 (= call!839 (arrayContainsKey!0 (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716)) (ite c!1875 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1877 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(declare-fun bm!819 () Bool)

(declare-fun call!825 () Bool)

(assert (=> bm!819 (= call!834 call!825)))

(declare-fun bm!820 () Bool)

(declare-fun call!831 () ListLongMap!533)

(declare-fun call!832 () ListLongMap!533)

(assert (=> bm!820 (= call!831 call!832)))

(declare-fun b!18691 () Bool)

(declare-fun res!12920 () Bool)

(assert (=> b!18691 (= res!12920 call!822)))

(declare-fun e!11973 () Bool)

(assert (=> b!18691 (=> (not res!12920) (not e!11973))))

(declare-fun b!18692 () Bool)

(declare-fun lt!5202 () tuple2!794)

(declare-fun call!829 () tuple2!794)

(assert (=> b!18692 (= lt!5202 call!829)))

(assert (=> b!18692 (= e!11963 (tuple2!795 (_1!398 lt!5202) (_2!398 lt!5202)))))

(declare-fun b!18693 () Bool)

(declare-fun lt!5198 () tuple2!794)

(assert (=> b!18693 (= e!11969 (tuple2!795 (_1!398 lt!5198) (_2!398 lt!5198)))))

(assert (=> b!18693 (= lt!5198 call!829)))

(declare-fun bm!821 () Bool)

(assert (=> bm!821 (= call!823 (seekEntryOrOpen!0 (ite c!1875 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1877 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716)) (mask!4594 (ite c!1875 (_2!398 lt!4852) call!716))))))

(declare-fun b!18694 () Bool)

(declare-fun e!11965 () Bool)

(declare-fun e!11962 () Bool)

(assert (=> b!18694 (= e!11965 e!11962)))

(declare-fun c!1981 () Bool)

(declare-fun lt!5188 () tuple2!794)

(assert (=> b!18694 (= c!1981 (_1!398 lt!5188))))

(declare-fun bm!822 () Bool)

(assert (=> bm!822 (= call!822 call!825)))

(declare-fun b!18695 () Bool)

(assert (=> b!18695 (= e!11962 e!11974)))

(declare-fun res!12914 () Bool)

(assert (=> b!18695 (= res!12914 (contains!213 call!821 (ite c!1875 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1877 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!18695 (=> (not res!12914) (not e!11974))))

(declare-fun b!18696 () Bool)

(assert (=> b!18696 (= e!11962 (= call!821 call!833))))

(declare-fun b!18697 () Bool)

(declare-fun e!11971 () Unit!362)

(declare-fun Unit!377 () Unit!362)

(assert (=> b!18697 (= e!11971 Unit!377)))

(declare-fun lt!5203 () Unit!362)

(declare-fun call!824 () Unit!362)

(assert (=> b!18697 (= lt!5203 call!824)))

(declare-fun lt!5184 () SeekEntryResult!43)

(assert (=> b!18697 (= lt!5184 call!840)))

(declare-fun res!12911 () Bool)

(assert (=> b!18697 (= res!12911 ((_ is Found!43) lt!5184))))

(assert (=> b!18697 (=> (not res!12911) (not e!11973))))

(assert (=> b!18697 e!11973))

(declare-fun lt!5189 () Unit!362)

(assert (=> b!18697 (= lt!5189 lt!5203)))

(assert (=> b!18697 false))

(declare-fun bm!823 () Bool)

(declare-fun call!835 () SeekEntryResult!43)

(assert (=> bm!823 (= call!835 call!823)))

(declare-fun c!1980 () Bool)

(declare-fun c!1972 () Bool)

(declare-fun c!1976 () Bool)

(declare-fun c!1971 () Bool)

(declare-fun bm!824 () Bool)

(declare-fun c!1973 () Bool)

(assert (=> bm!824 (= call!825 (inRange!0 (ite c!1972 (ite c!1976 (index!2292 lt!5184) (ite c!1971 (index!2291 lt!5199) (index!2294 lt!5199))) (ite c!1980 (index!2292 lt!5196) (ite c!1973 (index!2291 lt!5179) (index!2294 lt!5179)))) (mask!4594 (ite c!1875 (_2!398 lt!4852) call!716))))))

(declare-fun b!18698 () Bool)

(declare-fun e!11970 () Bool)

(assert (=> b!18698 (= e!11970 (not call!826))))

(declare-fun b!18699 () Bool)

(declare-fun lt!5180 () Unit!362)

(assert (=> b!18699 (= lt!5180 e!11971)))

(declare-fun call!819 () Bool)

(assert (=> b!18699 (= c!1976 call!819)))

(assert (=> b!18699 (= e!11960 (tuple2!795 false (ite c!1875 (_2!398 lt!4852) call!716)))))

(declare-fun call!836 () ListLongMap!533)

(declare-fun c!1979 () Bool)

(declare-fun bm!825 () Bool)

(declare-fun call!837 () ListLongMap!533)

(declare-fun c!1970 () Bool)

(assert (=> bm!825 (= call!832 (+!34 (ite c!1970 call!837 call!836) (ite c!1970 (ite c!1979 (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!1875 (minValue!1597 (v!1471 (underlying!61 thiss!848))) (ite c!1877 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 (v!1471 (underlying!61 thiss!848)))))) (tuple2!793 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1875 (minValue!1597 (v!1471 (underlying!61 thiss!848))) (ite c!1877 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 (v!1471 (underlying!61 thiss!848))))))) (tuple2!793 (ite c!1875 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1877 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1875 (minValue!1597 (v!1471 (underlying!61 thiss!848))) (ite c!1877 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 (v!1471 (underlying!61 thiss!848)))))))))))

(declare-fun b!18700 () Bool)

(declare-fun res!12919 () Bool)

(assert (=> b!18700 (= res!12919 (= (select (arr!489 (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716))) (index!2294 lt!5199)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!11977 () Bool)

(assert (=> b!18700 (=> (not res!12919) (not e!11977))))

(declare-fun bm!826 () Bool)

(assert (=> bm!826 (= call!826 call!839)))

(declare-fun b!18701 () Bool)

(declare-fun e!11975 () Unit!362)

(declare-fun Unit!378 () Unit!362)

(assert (=> b!18701 (= e!11975 Unit!378)))

(declare-fun lt!5197 () Unit!362)

(declare-fun call!828 () Unit!362)

(assert (=> b!18701 (= lt!5197 call!828)))

(assert (=> b!18701 (= lt!5179 call!835)))

(assert (=> b!18701 (= c!1973 ((_ is MissingZero!43) lt!5179))))

(declare-fun e!11966 () Bool)

(assert (=> b!18701 e!11966))

(declare-fun lt!5190 () Unit!362)

(assert (=> b!18701 (= lt!5190 lt!5197)))

(assert (=> b!18701 false))

(declare-fun res!12916 () Bool)

(declare-fun b!18702 () Bool)

(assert (=> b!18702 (= res!12916 (= (select (arr!489 (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716))) (index!2294 lt!5179)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!18702 (=> (not res!12916) (not e!11970))))

(declare-fun bm!827 () Bool)

(assert (=> bm!827 (= call!828 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!2 (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716)) (_values!1658 (ite c!1875 (_2!398 lt!4852) call!716)) (mask!4594 (ite c!1875 (_2!398 lt!4852) call!716)) (extraKeys!1574 (ite c!1875 (_2!398 lt!4852) call!716)) (zeroValue!1597 (ite c!1875 (_2!398 lt!4852) call!716)) (minValue!1597 (ite c!1875 (_2!398 lt!4852) call!716)) (ite c!1875 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1877 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1661 (ite c!1875 (_2!398 lt!4852) call!716))))))

(declare-fun bm!828 () Bool)

(assert (=> bm!828 (= call!829 (updateHelperNewKey!2 (ite c!1875 (_2!398 lt!4852) call!716) (ite c!1875 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1877 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1875 (minValue!1597 (v!1471 (underlying!61 thiss!848))) (ite c!1877 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 (v!1471 (underlying!61 thiss!848))))) (ite c!1978 (index!2294 lt!5185) (index!2291 lt!5185))))))

(declare-fun call!820 () ListLongMap!533)

(declare-fun bm!829 () Bool)

(assert (=> bm!829 (= call!819 (contains!213 call!820 (ite c!1972 (ite c!1875 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1877 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (select (arr!489 (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716))) (index!2292 lt!5185)))))))

(declare-fun b!18703 () Bool)

(declare-fun res!12907 () Bool)

(assert (=> b!18703 (=> (not res!12907) (not e!11967))))

(assert (=> b!18703 (= res!12907 call!818)))

(assert (=> b!18703 (= e!11966 e!11967)))

(declare-fun b!18704 () Bool)

(declare-fun e!11961 () Bool)

(assert (=> b!18704 (= e!11961 ((_ is Undefined!43) lt!5199))))

(declare-fun bm!830 () Bool)

(assert (=> bm!830 (= call!836 (getCurrentListMap!119 (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716)) (_values!1658 (ite c!1875 (_2!398 lt!4852) call!716)) (mask!4594 (ite c!1875 (_2!398 lt!4852) call!716)) (extraKeys!1574 (ite c!1875 (_2!398 lt!4852) call!716)) (zeroValue!1597 (ite c!1875 (_2!398 lt!4852) call!716)) (minValue!1597 (ite c!1875 (_2!398 lt!4852) call!716)) #b00000000000000000000000000000000 (defaultEntry!1661 (ite c!1875 (_2!398 lt!4852) call!716))))))

(declare-fun bm!831 () Bool)

(assert (=> bm!831 (= call!821 (map!358 (_2!398 lt!5188)))))

(declare-fun bm!832 () Bool)

(assert (=> bm!832 (= call!817 call!839)))

(declare-fun bm!833 () Bool)

(assert (=> bm!833 (= call!833 (map!358 (ite c!1875 (_2!398 lt!4852) call!716)))))

(declare-fun b!18705 () Bool)

(declare-fun lt!5201 () Unit!362)

(declare-fun lt!5182 () Unit!362)

(assert (=> b!18705 (= lt!5201 lt!5182)))

(assert (=> b!18705 (= call!831 call!830)))

(declare-fun lt!5191 () (_ BitVec 32))

(assert (=> b!18705 (= lt!5182 (lemmaChangeZeroKeyThenAddPairToListMap!2 (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716)) (_values!1658 (ite c!1875 (_2!398 lt!4852) call!716)) (mask!4594 (ite c!1875 (_2!398 lt!4852) call!716)) (extraKeys!1574 (ite c!1875 (_2!398 lt!4852) call!716)) lt!5191 (zeroValue!1597 (ite c!1875 (_2!398 lt!4852) call!716)) (ite c!1875 (minValue!1597 (v!1471 (underlying!61 thiss!848))) (ite c!1877 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 (v!1471 (underlying!61 thiss!848))))) (minValue!1597 (ite c!1875 (_2!398 lt!4852) call!716)) (defaultEntry!1661 (ite c!1875 (_2!398 lt!4852) call!716))))))

(assert (=> b!18705 (= lt!5191 (bvor (extraKeys!1574 (ite c!1875 (_2!398 lt!4852) call!716)) #b00000000000000000000000000000001))))

(declare-fun e!11959 () tuple2!794)

(assert (=> b!18705 (= e!11959 (tuple2!795 true (LongMapFixedSize!101 (defaultEntry!1661 (ite c!1875 (_2!398 lt!4852) call!716)) (mask!4594 (ite c!1875 (_2!398 lt!4852) call!716)) (bvor (extraKeys!1574 (ite c!1875 (_2!398 lt!4852) call!716)) #b00000000000000000000000000000001) (ite c!1875 (minValue!1597 (v!1471 (underlying!61 thiss!848))) (ite c!1877 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 (v!1471 (underlying!61 thiss!848))))) (minValue!1597 (ite c!1875 (_2!398 lt!4852) call!716)) (_size!82 (ite c!1875 (_2!398 lt!4852) call!716)) (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716)) (_values!1658 (ite c!1875 (_2!398 lt!4852) call!716)) (_vacant!82 (ite c!1875 (_2!398 lt!4852) call!716)))))))

(declare-fun bm!834 () Bool)

(declare-fun lt!5200 () (_ BitVec 32))

(assert (=> bm!834 (= call!838 (getCurrentListMap!119 (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716)) (ite c!1970 (_values!1658 (ite c!1875 (_2!398 lt!4852) call!716)) (array!1014 (store (arr!488 (_values!1658 (ite c!1875 (_2!398 lt!4852) call!716))) (index!2292 lt!5185) (ValueCellFull!257 (ite c!1875 (minValue!1597 (v!1471 (underlying!61 thiss!848))) (ite c!1877 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 (v!1471 (underlying!61 thiss!848))))))) (size!578 (_values!1658 (ite c!1875 (_2!398 lt!4852) call!716))))) (mask!4594 (ite c!1875 (_2!398 lt!4852) call!716)) (ite c!1970 (ite c!1979 lt!5191 lt!5200) (extraKeys!1574 (ite c!1875 (_2!398 lt!4852) call!716))) (ite (and c!1970 c!1979) (ite c!1875 (minValue!1597 (v!1471 (underlying!61 thiss!848))) (ite c!1877 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 (v!1471 (underlying!61 thiss!848))))) (zeroValue!1597 (ite c!1875 (_2!398 lt!4852) call!716))) (ite c!1970 (ite c!1979 (minValue!1597 (ite c!1875 (_2!398 lt!4852) call!716)) (ite c!1875 (minValue!1597 (v!1471 (underlying!61 thiss!848))) (ite c!1877 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 (v!1471 (underlying!61 thiss!848)))))) (minValue!1597 (ite c!1875 (_2!398 lt!4852) call!716))) #b00000000000000000000000000000000 (defaultEntry!1661 (ite c!1875 (_2!398 lt!4852) call!716))))))

(declare-fun b!18706 () Bool)

(declare-fun lt!5181 () Unit!362)

(assert (=> b!18706 (= e!11971 lt!5181)))

(assert (=> b!18706 (= lt!5181 call!828)))

(assert (=> b!18706 (= lt!5199 call!840)))

(assert (=> b!18706 (= c!1971 ((_ is MissingZero!43) lt!5199))))

(declare-fun e!11964 () Bool)

(assert (=> b!18706 e!11964))

(declare-fun b!18707 () Bool)

(declare-fun c!1975 () Bool)

(assert (=> b!18707 (= c!1975 ((_ is MissingVacant!43) lt!5179))))

(assert (=> b!18707 (= e!11966 e!11958)))

(declare-fun b!18708 () Bool)

(declare-fun lt!5193 () Unit!362)

(declare-fun lt!5187 () Unit!362)

(assert (=> b!18708 (= lt!5193 lt!5187)))

(assert (=> b!18708 (= call!831 call!830)))

(assert (=> b!18708 (= lt!5187 (lemmaChangeLongMinValueKeyThenAddPairToListMap!2 (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716)) (_values!1658 (ite c!1875 (_2!398 lt!4852) call!716)) (mask!4594 (ite c!1875 (_2!398 lt!4852) call!716)) (extraKeys!1574 (ite c!1875 (_2!398 lt!4852) call!716)) lt!5200 (zeroValue!1597 (ite c!1875 (_2!398 lt!4852) call!716)) (minValue!1597 (ite c!1875 (_2!398 lt!4852) call!716)) (ite c!1875 (minValue!1597 (v!1471 (underlying!61 thiss!848))) (ite c!1877 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 (v!1471 (underlying!61 thiss!848))))) (defaultEntry!1661 (ite c!1875 (_2!398 lt!4852) call!716))))))

(assert (=> b!18708 (= lt!5200 (bvor (extraKeys!1574 (ite c!1875 (_2!398 lt!4852) call!716)) #b00000000000000000000000000000010))))

(assert (=> b!18708 (= e!11959 (tuple2!795 true (LongMapFixedSize!101 (defaultEntry!1661 (ite c!1875 (_2!398 lt!4852) call!716)) (mask!4594 (ite c!1875 (_2!398 lt!4852) call!716)) (bvor (extraKeys!1574 (ite c!1875 (_2!398 lt!4852) call!716)) #b00000000000000000000000000000010) (zeroValue!1597 (ite c!1875 (_2!398 lt!4852) call!716)) (ite c!1875 (minValue!1597 (v!1471 (underlying!61 thiss!848))) (ite c!1877 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 (v!1471 (underlying!61 thiss!848))))) (_size!82 (ite c!1875 (_2!398 lt!4852) call!716)) (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716)) (_values!1658 (ite c!1875 (_2!398 lt!4852) call!716)) (_vacant!82 (ite c!1875 (_2!398 lt!4852) call!716)))))))

(declare-fun b!18709 () Bool)

(assert (=> b!18709 (= e!11958 e!11970)))

(declare-fun res!12908 () Bool)

(assert (=> b!18709 (= res!12908 call!818)))

(assert (=> b!18709 (=> (not res!12908) (not e!11970))))

(declare-fun bm!835 () Bool)

(assert (=> bm!835 (= call!824 (lemmaInListMapThenSeekEntryOrOpenFindsIt!2 (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716)) (_values!1658 (ite c!1875 (_2!398 lt!4852) call!716)) (mask!4594 (ite c!1875 (_2!398 lt!4852) call!716)) (extraKeys!1574 (ite c!1875 (_2!398 lt!4852) call!716)) (zeroValue!1597 (ite c!1875 (_2!398 lt!4852) call!716)) (minValue!1597 (ite c!1875 (_2!398 lt!4852) call!716)) (ite c!1875 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1877 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1661 (ite c!1875 (_2!398 lt!4852) call!716))))))

(declare-fun d!3463 () Bool)

(assert (=> d!3463 e!11965))

(declare-fun res!12913 () Bool)

(assert (=> d!3463 (=> (not res!12913) (not e!11965))))

(assert (=> d!3463 (= res!12913 (valid!58 (_2!398 lt!5188)))))

(declare-fun e!11972 () tuple2!794)

(assert (=> d!3463 (= lt!5188 e!11972)))

(assert (=> d!3463 (= c!1970 (= (ite c!1875 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1877 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvneg (ite c!1875 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1877 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!3463 (valid!58 (ite c!1875 (_2!398 lt!4852) call!716))))

(assert (=> d!3463 (= (update!12 (ite c!1875 (_2!398 lt!4852) call!716) (ite c!1875 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1877 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1875 (minValue!1597 (v!1471 (underlying!61 thiss!848))) (ite c!1877 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 (v!1471 (underlying!61 thiss!848)))))) lt!5188)))

(declare-fun b!18710 () Bool)

(declare-fun res!12918 () Bool)

(assert (=> b!18710 (= res!12918 call!834)))

(assert (=> b!18710 (=> (not res!12918) (not e!11968))))

(declare-fun b!18711 () Bool)

(assert (=> b!18711 (= e!11973 (= (select (arr!489 (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716))) (index!2292 lt!5184)) (ite c!1875 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1877 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!836 () Bool)

(assert (=> bm!836 (= call!837 call!836)))

(declare-fun b!18712 () Bool)

(assert (=> b!18712 (= e!11972 e!11960)))

(assert (=> b!18712 (= lt!5185 (seekEntryOrOpen!0 (ite c!1875 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1877 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716)) (mask!4594 (ite c!1875 (_2!398 lt!4852) call!716))))))

(assert (=> b!18712 (= c!1972 ((_ is Undefined!43) lt!5185))))

(declare-fun b!18713 () Bool)

(declare-fun res!12917 () Bool)

(assert (=> b!18713 (=> (not res!12917) (not e!11976))))

(assert (=> b!18713 (= res!12917 call!827)))

(assert (=> b!18713 (= e!11964 e!11976)))

(declare-fun b!18714 () Bool)

(assert (=> b!18714 (= e!11961 e!11977)))

(declare-fun res!12915 () Bool)

(assert (=> b!18714 (= res!12915 call!827)))

(assert (=> b!18714 (=> (not res!12915) (not e!11977))))

(declare-fun b!18715 () Bool)

(declare-fun lt!5192 () Unit!362)

(declare-fun lt!5194 () Unit!362)

(assert (=> b!18715 (= lt!5192 lt!5194)))

(assert (=> b!18715 call!819))

(declare-fun lt!5178 () array!1013)

(assert (=> b!18715 (= lt!5194 (lemmaValidKeyInArrayIsInListMap!2 (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716)) lt!5178 (mask!4594 (ite c!1875 (_2!398 lt!4852) call!716)) (extraKeys!1574 (ite c!1875 (_2!398 lt!4852) call!716)) (zeroValue!1597 (ite c!1875 (_2!398 lt!4852) call!716)) (minValue!1597 (ite c!1875 (_2!398 lt!4852) call!716)) (index!2292 lt!5185) (defaultEntry!1661 (ite c!1875 (_2!398 lt!4852) call!716))))))

(assert (=> b!18715 (= lt!5178 (array!1014 (store (arr!488 (_values!1658 (ite c!1875 (_2!398 lt!4852) call!716))) (index!2292 lt!5185) (ValueCellFull!257 (ite c!1875 (minValue!1597 (v!1471 (underlying!61 thiss!848))) (ite c!1877 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 (v!1471 (underlying!61 thiss!848))))))) (size!578 (_values!1658 (ite c!1875 (_2!398 lt!4852) call!716)))))))

(declare-fun lt!5195 () Unit!362)

(declare-fun lt!5183 () Unit!362)

(assert (=> b!18715 (= lt!5195 lt!5183)))

(assert (=> b!18715 (= call!832 call!838)))

(assert (=> b!18715 (= lt!5183 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!2 (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716)) (_values!1658 (ite c!1875 (_2!398 lt!4852) call!716)) (mask!4594 (ite c!1875 (_2!398 lt!4852) call!716)) (extraKeys!1574 (ite c!1875 (_2!398 lt!4852) call!716)) (zeroValue!1597 (ite c!1875 (_2!398 lt!4852) call!716)) (minValue!1597 (ite c!1875 (_2!398 lt!4852) call!716)) (index!2292 lt!5185) (ite c!1875 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1877 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1875 (minValue!1597 (v!1471 (underlying!61 thiss!848))) (ite c!1877 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 (v!1471 (underlying!61 thiss!848))))) (defaultEntry!1661 (ite c!1875 (_2!398 lt!4852) call!716))))))

(declare-fun lt!5186 () Unit!362)

(assert (=> b!18715 (= lt!5186 e!11975)))

(assert (=> b!18715 (= c!1980 (contains!213 call!836 (ite c!1875 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1877 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!18715 (= e!11963 (tuple2!795 true (LongMapFixedSize!101 (defaultEntry!1661 (ite c!1875 (_2!398 lt!4852) call!716)) (mask!4594 (ite c!1875 (_2!398 lt!4852) call!716)) (extraKeys!1574 (ite c!1875 (_2!398 lt!4852) call!716)) (zeroValue!1597 (ite c!1875 (_2!398 lt!4852) call!716)) (minValue!1597 (ite c!1875 (_2!398 lt!4852) call!716)) (_size!82 (ite c!1875 (_2!398 lt!4852) call!716)) (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716)) (array!1014 (store (arr!488 (_values!1658 (ite c!1875 (_2!398 lt!4852) call!716))) (index!2292 lt!5185) (ValueCellFull!257 (ite c!1875 (minValue!1597 (v!1471 (underlying!61 thiss!848))) (ite c!1877 (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 (v!1471 (underlying!61 thiss!848))))))) (size!578 (_values!1658 (ite c!1875 (_2!398 lt!4852) call!716)))) (_vacant!82 (ite c!1875 (_2!398 lt!4852) call!716)))))))

(declare-fun b!18716 () Bool)

(declare-fun lt!5204 () Unit!362)

(assert (=> b!18716 (= e!11975 lt!5204)))

(assert (=> b!18716 (= lt!5204 call!824)))

(assert (=> b!18716 (= lt!5196 call!835)))

(declare-fun res!12910 () Bool)

(assert (=> b!18716 (= res!12910 ((_ is Found!43) lt!5196))))

(assert (=> b!18716 (=> (not res!12910) (not e!11968))))

(assert (=> b!18716 e!11968))

(declare-fun b!18717 () Bool)

(assert (=> b!18717 (= e!11977 (not call!817))))

(declare-fun bm!837 () Bool)

(assert (=> bm!837 (= call!820 (getCurrentListMap!119 (_keys!3086 (ite c!1875 (_2!398 lt!4852) call!716)) (ite c!1972 (_values!1658 (ite c!1875 (_2!398 lt!4852) call!716)) lt!5178) (mask!4594 (ite c!1875 (_2!398 lt!4852) call!716)) (extraKeys!1574 (ite c!1875 (_2!398 lt!4852) call!716)) (zeroValue!1597 (ite c!1875 (_2!398 lt!4852) call!716)) (minValue!1597 (ite c!1875 (_2!398 lt!4852) call!716)) #b00000000000000000000000000000000 (defaultEntry!1661 (ite c!1875 (_2!398 lt!4852) call!716))))))

(declare-fun b!18718 () Bool)

(declare-fun c!1977 () Bool)

(assert (=> b!18718 (= c!1977 ((_ is MissingVacant!43) lt!5199))))

(assert (=> b!18718 (= e!11964 e!11961)))

(declare-fun b!18719 () Bool)

(assert (=> b!18719 (= e!11972 e!11959)))

(assert (=> b!18719 (= c!1979 (= (ite c!1875 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1877 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!3463 c!1970) b!18719))

(assert (= (and d!3463 (not c!1970)) b!18712))

(assert (= (and b!18719 c!1979) b!18705))

(assert (= (and b!18719 (not c!1979)) b!18708))

(assert (= (or b!18705 b!18708) bm!836))

(assert (= (or b!18705 b!18708) bm!815))

(assert (= (or b!18705 b!18708) bm!820))

(assert (= (and b!18712 c!1972) b!18699))

(assert (= (and b!18712 (not c!1972)) b!18687))

(assert (= (and b!18699 c!1976) b!18697))

(assert (= (and b!18699 (not c!1976)) b!18706))

(assert (= (and b!18697 res!12911) b!18691))

(assert (= (and b!18691 res!12920) b!18711))

(assert (= (and b!18706 c!1971) b!18713))

(assert (= (and b!18706 (not c!1971)) b!18718))

(assert (= (and b!18713 res!12917) b!18690))

(assert (= (and b!18690 res!12909) b!18686))

(assert (= (and b!18718 c!1977) b!18714))

(assert (= (and b!18718 (not c!1977)) b!18704))

(assert (= (and b!18714 res!12915) b!18700))

(assert (= (and b!18700 res!12919) b!18717))

(assert (= (or b!18713 b!18714) bm!816))

(assert (= (or b!18686 b!18717) bm!832))

(assert (= (or b!18691 bm!816) bm!822))

(assert (= (or b!18697 b!18706) bm!814))

(assert (= (and b!18687 c!1978) b!18693))

(assert (= (and b!18687 (not c!1978)) b!18683))

(assert (= (and b!18683 c!1974) b!18692))

(assert (= (and b!18683 (not c!1974)) b!18715))

(assert (= (and b!18715 c!1980) b!18716))

(assert (= (and b!18715 (not c!1980)) b!18701))

(assert (= (and b!18716 res!12910) b!18710))

(assert (= (and b!18710 res!12918) b!18689))

(assert (= (and b!18701 c!1973) b!18703))

(assert (= (and b!18701 (not c!1973)) b!18707))

(assert (= (and b!18703 res!12907) b!18688))

(assert (= (and b!18688 res!12912) b!18684))

(assert (= (and b!18707 c!1975) b!18709))

(assert (= (and b!18707 (not c!1975)) b!18685))

(assert (= (and b!18709 res!12908) b!18702))

(assert (= (and b!18702 res!12916) b!18698))

(assert (= (or b!18703 b!18709) bm!817))

(assert (= (or b!18684 b!18698) bm!826))

(assert (= (or b!18710 bm!817) bm!819))

(assert (= (or b!18716 b!18701) bm!823))

(assert (= (or b!18693 b!18692) bm!828))

(assert (= (or bm!822 bm!819) bm!824))

(assert (= (or b!18697 b!18716) bm!835))

(assert (= (or bm!814 bm!823) bm!821))

(assert (= (or b!18699 b!18715) bm!837))

(assert (= (or bm!832 bm!826) bm!818))

(assert (= (or b!18706 b!18701) bm!827))

(assert (= (or b!18699 b!18715) bm!829))

(assert (= (or bm!836 b!18715) bm!830))

(assert (= (or bm!815 b!18715) bm!834))

(assert (= (or bm!820 b!18715) bm!825))

(assert (= (and d!3463 res!12913) b!18694))

(assert (= (and b!18694 c!1981) b!18695))

(assert (= (and b!18694 (not c!1981)) b!18696))

(assert (= (and b!18695 res!12914) b!18682))

(assert (= (or b!18682 b!18696) bm!833))

(assert (= (or b!18695 b!18682 b!18696) bm!831))

(declare-fun m!13139 () Bool)

(assert (=> b!18715 m!13139))

(declare-fun m!13141 () Bool)

(assert (=> b!18715 m!13141))

(declare-fun m!13143 () Bool)

(assert (=> b!18715 m!13143))

(declare-fun m!13145 () Bool)

(assert (=> b!18715 m!13145))

(declare-fun m!13147 () Bool)

(assert (=> bm!833 m!13147))

(declare-fun m!13149 () Bool)

(assert (=> bm!827 m!13149))

(declare-fun m!13151 () Bool)

(assert (=> b!18712 m!13151))

(declare-fun m!13153 () Bool)

(assert (=> d!3463 m!13153))

(declare-fun m!13155 () Bool)

(assert (=> d!3463 m!13155))

(declare-fun m!13157 () Bool)

(assert (=> b!18708 m!13157))

(declare-fun m!13159 () Bool)

(assert (=> bm!828 m!13159))

(declare-fun m!13161 () Bool)

(assert (=> bm!818 m!13161))

(declare-fun m!13163 () Bool)

(assert (=> bm!824 m!13163))

(declare-fun m!13165 () Bool)

(assert (=> b!18695 m!13165))

(declare-fun m!13167 () Bool)

(assert (=> bm!837 m!13167))

(declare-fun m!13169 () Bool)

(assert (=> bm!835 m!13169))

(declare-fun m!13171 () Bool)

(assert (=> bm!830 m!13171))

(declare-fun m!13173 () Bool)

(assert (=> b!18690 m!13173))

(declare-fun m!13175 () Bool)

(assert (=> b!18689 m!13175))

(declare-fun m!13177 () Bool)

(assert (=> b!18682 m!13177))

(declare-fun m!13179 () Bool)

(assert (=> bm!829 m!13179))

(declare-fun m!13181 () Bool)

(assert (=> bm!829 m!13181))

(declare-fun m!13183 () Bool)

(assert (=> bm!825 m!13183))

(assert (=> bm!834 m!13141))

(declare-fun m!13185 () Bool)

(assert (=> bm!834 m!13185))

(declare-fun m!13187 () Bool)

(assert (=> b!18700 m!13187))

(declare-fun m!13189 () Bool)

(assert (=> bm!831 m!13189))

(declare-fun m!13191 () Bool)

(assert (=> b!18711 m!13191))

(assert (=> bm!821 m!13151))

(declare-fun m!13193 () Bool)

(assert (=> b!18688 m!13193))

(declare-fun m!13195 () Bool)

(assert (=> b!18705 m!13195))

(declare-fun m!13197 () Bool)

(assert (=> b!18702 m!13197))

(assert (=> bm!712 d!3463))

(assert (=> b!18338 d!3431))

(assert (=> b!18360 d!3441))

(assert (=> b!18360 d!3443))

(declare-fun d!3465 () Bool)

(declare-fun e!11978 () Bool)

(assert (=> d!3465 e!11978))

(declare-fun res!12921 () Bool)

(assert (=> d!3465 (=> (not res!12921) (not e!11978))))

(declare-fun lt!5206 () ListLongMap!533)

(assert (=> d!3465 (= res!12921 (contains!213 lt!5206 (_1!397 (ite c!1852 (ite c!1861 (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!793 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!793 key!682 v!259)))))))

(declare-fun lt!5208 () List!535)

(assert (=> d!3465 (= lt!5206 (ListLongMap!534 lt!5208))))

(declare-fun lt!5205 () Unit!362)

(declare-fun lt!5207 () Unit!362)

(assert (=> d!3465 (= lt!5205 lt!5207)))

(assert (=> d!3465 (= (getValueByKey!59 lt!5208 (_1!397 (ite c!1852 (ite c!1861 (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!793 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!793 key!682 v!259)))) (Some!64 (_2!397 (ite c!1852 (ite c!1861 (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!793 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!793 key!682 v!259)))))))

(assert (=> d!3465 (= lt!5207 (lemmaContainsTupThenGetReturnValue!16 lt!5208 (_1!397 (ite c!1852 (ite c!1861 (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!793 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!793 key!682 v!259))) (_2!397 (ite c!1852 (ite c!1861 (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!793 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!793 key!682 v!259)))))))

(assert (=> d!3465 (= lt!5208 (insertStrictlySorted!16 (toList!282 (ite c!1852 call!701 call!700)) (_1!397 (ite c!1852 (ite c!1861 (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!793 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!793 key!682 v!259))) (_2!397 (ite c!1852 (ite c!1861 (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!793 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!793 key!682 v!259)))))))

(assert (=> d!3465 (= (+!34 (ite c!1852 call!701 call!700) (ite c!1852 (ite c!1861 (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!793 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!793 key!682 v!259))) lt!5206)))

(declare-fun b!18720 () Bool)

(declare-fun res!12922 () Bool)

(assert (=> b!18720 (=> (not res!12922) (not e!11978))))

(assert (=> b!18720 (= res!12922 (= (getValueByKey!59 (toList!282 lt!5206) (_1!397 (ite c!1852 (ite c!1861 (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!793 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!793 key!682 v!259)))) (Some!64 (_2!397 (ite c!1852 (ite c!1861 (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!793 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!793 key!682 v!259))))))))

(declare-fun b!18721 () Bool)

(assert (=> b!18721 (= e!11978 (contains!216 (toList!282 lt!5206) (ite c!1852 (ite c!1861 (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!793 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!793 key!682 v!259))))))

(assert (= (and d!3465 res!12921) b!18720))

(assert (= (and b!18720 res!12922) b!18721))

(declare-fun m!13199 () Bool)

(assert (=> d!3465 m!13199))

(declare-fun m!13201 () Bool)

(assert (=> d!3465 m!13201))

(declare-fun m!13203 () Bool)

(assert (=> d!3465 m!13203))

(declare-fun m!13205 () Bool)

(assert (=> d!3465 m!13205))

(declare-fun m!13207 () Bool)

(assert (=> b!18720 m!13207))

(declare-fun m!13209 () Bool)

(assert (=> b!18721 m!13209))

(assert (=> bm!689 d!3465))

(declare-fun d!3467 () Bool)

(declare-fun res!12923 () Bool)

(declare-fun e!11979 () Bool)

(assert (=> d!3467 (=> (not res!12923) (not e!11979))))

(assert (=> d!3467 (= res!12923 (simpleValid!9 (v!1471 (underlying!61 thiss!848))))))

(assert (=> d!3467 (= (valid!58 (v!1471 (underlying!61 thiss!848))) e!11979)))

(declare-fun b!18722 () Bool)

(declare-fun res!12924 () Bool)

(assert (=> b!18722 (=> (not res!12924) (not e!11979))))

(assert (=> b!18722 (= res!12924 (= (arrayCountValidKeys!0 (_keys!3086 (v!1471 (underlying!61 thiss!848))) #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 thiss!848))))) (_size!82 (v!1471 (underlying!61 thiss!848)))))))

(declare-fun b!18723 () Bool)

(declare-fun res!12925 () Bool)

(assert (=> b!18723 (=> (not res!12925) (not e!11979))))

(assert (=> b!18723 (= res!12925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3086 (v!1471 (underlying!61 thiss!848))) (mask!4594 (v!1471 (underlying!61 thiss!848)))))))

(declare-fun b!18724 () Bool)

(assert (=> b!18724 (= e!11979 (arrayNoDuplicates!0 (_keys!3086 (v!1471 (underlying!61 thiss!848))) #b00000000000000000000000000000000 Nil!535))))

(assert (= (and d!3467 res!12923) b!18722))

(assert (= (and b!18722 res!12924) b!18723))

(assert (= (and b!18723 res!12925) b!18724))

(declare-fun m!13211 () Bool)

(assert (=> d!3467 m!13211))

(declare-fun m!13213 () Bool)

(assert (=> b!18722 m!13213))

(declare-fun m!13215 () Bool)

(assert (=> b!18723 m!13215))

(declare-fun m!13217 () Bool)

(assert (=> b!18724 m!13217))

(assert (=> d!3391 d!3467))

(declare-fun d!3469 () Bool)

(declare-fun lt!5211 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!14 (List!535) (InoxSet tuple2!792))

(assert (=> d!3469 (= lt!5211 (select (content!14 (toList!282 lt!4811)) (tuple2!793 key!682 v!259)))))

(declare-fun e!11985 () Bool)

(assert (=> d!3469 (= lt!5211 e!11985)))

(declare-fun res!12930 () Bool)

(assert (=> d!3469 (=> (not res!12930) (not e!11985))))

(assert (=> d!3469 (= res!12930 ((_ is Cons!531) (toList!282 lt!4811)))))

(assert (=> d!3469 (= (contains!216 (toList!282 lt!4811) (tuple2!793 key!682 v!259)) lt!5211)))

(declare-fun b!18729 () Bool)

(declare-fun e!11984 () Bool)

(assert (=> b!18729 (= e!11985 e!11984)))

(declare-fun res!12931 () Bool)

(assert (=> b!18729 (=> res!12931 e!11984)))

(assert (=> b!18729 (= res!12931 (= (h!1097 (toList!282 lt!4811)) (tuple2!793 key!682 v!259)))))

(declare-fun b!18730 () Bool)

(assert (=> b!18730 (= e!11984 (contains!216 (t!3168 (toList!282 lt!4811)) (tuple2!793 key!682 v!259)))))

(assert (= (and d!3469 res!12930) b!18729))

(assert (= (and b!18729 (not res!12931)) b!18730))

(declare-fun m!13219 () Bool)

(assert (=> d!3469 m!13219))

(declare-fun m!13221 () Bool)

(assert (=> d!3469 m!13221))

(declare-fun m!13223 () Bool)

(assert (=> b!18730 m!13223))

(assert (=> b!18351 d!3469))

(declare-fun d!3471 () Bool)

(declare-fun e!11987 () Bool)

(assert (=> d!3471 e!11987))

(declare-fun res!12932 () Bool)

(assert (=> d!3471 (=> res!12932 e!11987)))

(declare-fun lt!5214 () Bool)

(assert (=> d!3471 (= res!12932 (not lt!5214))))

(declare-fun lt!5212 () Bool)

(assert (=> d!3471 (= lt!5214 lt!5212)))

(declare-fun lt!5215 () Unit!362)

(declare-fun e!11986 () Unit!362)

(assert (=> d!3471 (= lt!5215 e!11986)))

(declare-fun c!1982 () Bool)

(assert (=> d!3471 (= c!1982 lt!5212)))

(assert (=> d!3471 (= lt!5212 (containsKey!23 (toList!282 call!684) (ite c!1854 key!682 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!4782)))))))

(assert (=> d!3471 (= (contains!213 call!684 (ite c!1854 key!682 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!4782)))) lt!5214)))

(declare-fun b!18731 () Bool)

(declare-fun lt!5213 () Unit!362)

(assert (=> b!18731 (= e!11986 lt!5213)))

(assert (=> b!18731 (= lt!5213 (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!282 call!684) (ite c!1854 key!682 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!4782)))))))

(assert (=> b!18731 (isDefined!21 (getValueByKey!59 (toList!282 call!684) (ite c!1854 key!682 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!4782)))))))

(declare-fun b!18732 () Bool)

(declare-fun Unit!379 () Unit!362)

(assert (=> b!18732 (= e!11986 Unit!379)))

(declare-fun b!18733 () Bool)

(assert (=> b!18733 (= e!11987 (isDefined!21 (getValueByKey!59 (toList!282 call!684) (ite c!1854 key!682 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!4782))))))))

(assert (= (and d!3471 c!1982) b!18731))

(assert (= (and d!3471 (not c!1982)) b!18732))

(assert (= (and d!3471 (not res!12932)) b!18733))

(declare-fun m!13225 () Bool)

(assert (=> d!3471 m!13225))

(declare-fun m!13227 () Bool)

(assert (=> b!18731 m!13227))

(declare-fun m!13229 () Bool)

(assert (=> b!18731 m!13229))

(assert (=> b!18731 m!13229))

(declare-fun m!13231 () Bool)

(assert (=> b!18731 m!13231))

(assert (=> b!18733 m!13229))

(assert (=> b!18733 m!13229))

(assert (=> b!18733 m!13231))

(assert (=> bm!693 d!3471))

(declare-fun b!18734 () Bool)

(declare-fun e!11992 () Unit!362)

(declare-fun lt!5218 () Unit!362)

(assert (=> b!18734 (= e!11992 lt!5218)))

(declare-fun lt!5219 () ListLongMap!533)

(assert (=> b!18734 (= lt!5219 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1854 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4775) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun lt!5217 () (_ BitVec 64))

(assert (=> b!18734 (= lt!5217 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5228 () (_ BitVec 64))

(assert (=> b!18734 (= lt!5228 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000))))

(declare-fun lt!5235 () Unit!362)

(assert (=> b!18734 (= lt!5235 (addStillContains!12 lt!5219 lt!5217 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!5228))))

(assert (=> b!18734 (contains!213 (+!34 lt!5219 (tuple2!793 lt!5217 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))))) lt!5228)))

(declare-fun lt!5233 () Unit!362)

(assert (=> b!18734 (= lt!5233 lt!5235)))

(declare-fun lt!5234 () ListLongMap!533)

(assert (=> b!18734 (= lt!5234 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1854 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4775) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun lt!5216 () (_ BitVec 64))

(assert (=> b!18734 (= lt!5216 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5225 () (_ BitVec 64))

(assert (=> b!18734 (= lt!5225 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000))))

(declare-fun lt!5224 () Unit!362)

(assert (=> b!18734 (= lt!5224 (addApplyDifferent!12 lt!5234 lt!5216 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!5225))))

(assert (=> b!18734 (= (apply!27 (+!34 lt!5234 (tuple2!793 lt!5216 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))))) lt!5225) (apply!27 lt!5234 lt!5225))))

(declare-fun lt!5222 () Unit!362)

(assert (=> b!18734 (= lt!5222 lt!5224)))

(declare-fun lt!5221 () ListLongMap!533)

(assert (=> b!18734 (= lt!5221 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1854 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4775) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun lt!5237 () (_ BitVec 64))

(assert (=> b!18734 (= lt!5237 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5223 () (_ BitVec 64))

(assert (=> b!18734 (= lt!5223 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000))))

(declare-fun lt!5232 () Unit!362)

(assert (=> b!18734 (= lt!5232 (addApplyDifferent!12 lt!5221 lt!5237 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!5223))))

(assert (=> b!18734 (= (apply!27 (+!34 lt!5221 (tuple2!793 lt!5237 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))))) lt!5223) (apply!27 lt!5221 lt!5223))))

(declare-fun lt!5227 () Unit!362)

(assert (=> b!18734 (= lt!5227 lt!5232)))

(declare-fun lt!5230 () ListLongMap!533)

(assert (=> b!18734 (= lt!5230 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1854 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4775) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun lt!5231 () (_ BitVec 64))

(assert (=> b!18734 (= lt!5231 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5226 () (_ BitVec 64))

(assert (=> b!18734 (= lt!5226 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000))))

(assert (=> b!18734 (= lt!5218 (addApplyDifferent!12 lt!5230 lt!5231 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!5226))))

(assert (=> b!18734 (= (apply!27 (+!34 lt!5230 (tuple2!793 lt!5231 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))))) lt!5226) (apply!27 lt!5230 lt!5226))))

(declare-fun b!18735 () Bool)

(declare-fun Unit!380 () Unit!362)

(assert (=> b!18735 (= e!11992 Unit!380)))

(declare-fun bm!838 () Bool)

(declare-fun call!847 () ListLongMap!533)

(declare-fun call!842 () ListLongMap!533)

(assert (=> bm!838 (= call!847 call!842)))

(declare-fun bm!839 () Bool)

(declare-fun call!843 () Bool)

(declare-fun lt!5236 () ListLongMap!533)

(assert (=> bm!839 (= call!843 (contains!213 lt!5236 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!840 () Bool)

(declare-fun c!1987 () Bool)

(declare-fun call!844 () ListLongMap!533)

(declare-fun c!1985 () Bool)

(declare-fun call!841 () ListLongMap!533)

(assert (=> bm!840 (= call!841 (+!34 (ite c!1987 call!842 (ite c!1985 call!847 call!844)) (ite (or c!1987 c!1985) (tuple2!793 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))) (tuple2!793 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))))))))

(declare-fun b!18736 () Bool)

(declare-fun e!12000 () ListLongMap!533)

(assert (=> b!18736 (= e!12000 call!844)))

(declare-fun b!18737 () Bool)

(declare-fun e!11997 () Bool)

(assert (=> b!18737 (= e!11997 (not call!843))))

(declare-fun b!18738 () Bool)

(declare-fun e!11995 () Bool)

(assert (=> b!18738 (= e!11995 (= (apply!27 lt!5236 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun b!18739 () Bool)

(declare-fun res!12937 () Bool)

(declare-fun e!11999 () Bool)

(assert (=> b!18739 (=> (not res!12937) (not e!11999))))

(assert (=> b!18739 (= res!12937 e!11997)))

(declare-fun c!1988 () Bool)

(assert (=> b!18739 (= c!1988 (not (= (bvand (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!18740 () Bool)

(declare-fun call!845 () ListLongMap!533)

(assert (=> b!18740 (= e!12000 call!845)))

(declare-fun b!18741 () Bool)

(declare-fun e!11994 () Bool)

(assert (=> b!18741 (= e!11994 (validKeyInArray!0 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000)))))

(declare-fun b!18742 () Bool)

(declare-fun e!11996 () Bool)

(declare-fun call!846 () Bool)

(assert (=> b!18742 (= e!11996 (not call!846))))

(declare-fun b!18743 () Bool)

(declare-fun c!1986 () Bool)

(assert (=> b!18743 (= c!1986 (and (not (= (bvand (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!11988 () ListLongMap!533)

(assert (=> b!18743 (= e!11988 e!12000)))

(declare-fun b!18744 () Bool)

(declare-fun e!11989 () Bool)

(assert (=> b!18744 (= e!11989 (validKeyInArray!0 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000)))))

(declare-fun b!18745 () Bool)

(declare-fun e!11998 () Bool)

(assert (=> b!18745 (= e!11998 (= (apply!27 lt!5236 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun b!18746 () Bool)

(assert (=> b!18746 (= e!11997 e!11995)))

(declare-fun res!12938 () Bool)

(assert (=> b!18746 (= res!12938 call!843)))

(assert (=> b!18746 (=> (not res!12938) (not e!11995))))

(declare-fun b!18747 () Bool)

(declare-fun e!11990 () ListLongMap!533)

(assert (=> b!18747 (= e!11990 e!11988)))

(assert (=> b!18747 (= c!1985 (and (not (= (bvand (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!11991 () Bool)

(declare-fun b!18748 () Bool)

(assert (=> b!18748 (= e!11991 (= (apply!27 lt!5236 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000)) (get!348 (select (arr!488 (ite c!1854 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4775)) #b00000000000000000000000000000000) (dynLambda!129 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!18748 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!578 (ite c!1854 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4775))))))

(assert (=> b!18748 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun bm!842 () Bool)

(assert (=> bm!842 (= call!844 call!847)))

(declare-fun bm!843 () Bool)

(assert (=> bm!843 (= call!846 (contains!213 lt!5236 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!844 () Bool)

(assert (=> bm!844 (= call!845 call!841)))

(declare-fun b!18749 () Bool)

(declare-fun res!12935 () Bool)

(assert (=> b!18749 (=> (not res!12935) (not e!11999))))

(declare-fun e!11993 () Bool)

(assert (=> b!18749 (= res!12935 e!11993)))

(declare-fun res!12936 () Bool)

(assert (=> b!18749 (=> res!12936 e!11993)))

(assert (=> b!18749 (= res!12936 (not e!11989))))

(declare-fun res!12939 () Bool)

(assert (=> b!18749 (=> (not res!12939) (not e!11989))))

(assert (=> b!18749 (= res!12939 (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun b!18750 () Bool)

(assert (=> b!18750 (= e!11999 e!11996)))

(declare-fun c!1983 () Bool)

(assert (=> b!18750 (= c!1983 (not (= (bvand (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!3473 () Bool)

(assert (=> d!3473 e!11999))

(declare-fun res!12940 () Bool)

(assert (=> d!3473 (=> (not res!12940) (not e!11999))))

(assert (=> d!3473 (= res!12940 (or (bvsge #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))))

(declare-fun lt!5229 () ListLongMap!533)

(assert (=> d!3473 (= lt!5236 lt!5229)))

(declare-fun lt!5220 () Unit!362)

(assert (=> d!3473 (= lt!5220 e!11992)))

(declare-fun c!1984 () Bool)

(assert (=> d!3473 (= c!1984 e!11994)))

(declare-fun res!12933 () Bool)

(assert (=> d!3473 (=> (not res!12933) (not e!11994))))

(assert (=> d!3473 (= res!12933 (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(assert (=> d!3473 (= lt!5229 e!11990)))

(assert (=> d!3473 (= c!1987 (and (not (= (bvand (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3473 (validMask!0 (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))))))

(assert (=> d!3473 (= (getCurrentListMap!119 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1854 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4775) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))) lt!5236)))

(declare-fun bm!841 () Bool)

(assert (=> bm!841 (= call!842 (getCurrentListMapNoExtraKeys!12 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1854 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4775) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun b!18751 () Bool)

(assert (=> b!18751 (= e!11996 e!11998)))

(declare-fun res!12941 () Bool)

(assert (=> b!18751 (= res!12941 call!846)))

(assert (=> b!18751 (=> (not res!12941) (not e!11998))))

(declare-fun b!18752 () Bool)

(assert (=> b!18752 (= e!11993 e!11991)))

(declare-fun res!12934 () Bool)

(assert (=> b!18752 (=> (not res!12934) (not e!11991))))

(assert (=> b!18752 (= res!12934 (contains!213 lt!5236 (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000)))))

(assert (=> b!18752 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun b!18753 () Bool)

(assert (=> b!18753 (= e!11988 call!845)))

(declare-fun b!18754 () Bool)

(assert (=> b!18754 (= e!11990 (+!34 call!841 (tuple2!793 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(assert (= (and d!3473 c!1987) b!18754))

(assert (= (and d!3473 (not c!1987)) b!18747))

(assert (= (and b!18747 c!1985) b!18753))

(assert (= (and b!18747 (not c!1985)) b!18743))

(assert (= (and b!18743 c!1986) b!18740))

(assert (= (and b!18743 (not c!1986)) b!18736))

(assert (= (or b!18740 b!18736) bm!842))

(assert (= (or b!18753 bm!842) bm!838))

(assert (= (or b!18753 b!18740) bm!844))

(assert (= (or b!18754 bm!838) bm!841))

(assert (= (or b!18754 bm!844) bm!840))

(assert (= (and d!3473 res!12933) b!18741))

(assert (= (and d!3473 c!1984) b!18734))

(assert (= (and d!3473 (not c!1984)) b!18735))

(assert (= (and d!3473 res!12940) b!18749))

(assert (= (and b!18749 res!12939) b!18744))

(assert (= (and b!18749 (not res!12936)) b!18752))

(assert (= (and b!18752 res!12934) b!18748))

(assert (= (and b!18749 res!12935) b!18739))

(assert (= (and b!18739 c!1988) b!18746))

(assert (= (and b!18739 (not c!1988)) b!18737))

(assert (= (and b!18746 res!12938) b!18738))

(assert (= (or b!18746 b!18737) bm!839))

(assert (= (and b!18739 res!12937) b!18750))

(assert (= (and b!18750 c!1983) b!18751))

(assert (= (and b!18750 (not c!1983)) b!18742))

(assert (= (and b!18751 res!12941) b!18745))

(assert (= (or b!18751 b!18742) bm!843))

(declare-fun b_lambda!1445 () Bool)

(assert (=> (not b_lambda!1445) (not b!18748)))

(assert (=> b!18748 t!3172))

(declare-fun b_and!1307 () Bool)

(assert (= b_and!1305 (and (=> t!3172 result!1005) b_and!1307)))

(declare-fun m!13233 () Bool)

(assert (=> bm!840 m!13233))

(declare-fun m!13235 () Bool)

(assert (=> b!18745 m!13235))

(assert (=> b!18752 m!12809))

(assert (=> b!18752 m!12809))

(declare-fun m!13237 () Bool)

(assert (=> b!18752 m!13237))

(declare-fun m!13239 () Bool)

(assert (=> b!18748 m!13239))

(assert (=> b!18748 m!12815))

(assert (=> b!18748 m!12809))

(assert (=> b!18748 m!13239))

(assert (=> b!18748 m!12815))

(declare-fun m!13241 () Bool)

(assert (=> b!18748 m!13241))

(assert (=> b!18748 m!12809))

(declare-fun m!13243 () Bool)

(assert (=> b!18748 m!13243))

(declare-fun m!13245 () Bool)

(assert (=> b!18754 m!13245))

(assert (=> d!3473 m!12779))

(declare-fun m!13247 () Bool)

(assert (=> b!18738 m!13247))

(assert (=> b!18741 m!12809))

(assert (=> b!18741 m!12809))

(assert (=> b!18741 m!12825))

(declare-fun m!13249 () Bool)

(assert (=> bm!843 m!13249))

(declare-fun m!13251 () Bool)

(assert (=> bm!841 m!13251))

(declare-fun m!13253 () Bool)

(assert (=> bm!839 m!13253))

(declare-fun m!13255 () Bool)

(assert (=> b!18734 m!13255))

(declare-fun m!13257 () Bool)

(assert (=> b!18734 m!13257))

(declare-fun m!13259 () Bool)

(assert (=> b!18734 m!13259))

(declare-fun m!13261 () Bool)

(assert (=> b!18734 m!13261))

(declare-fun m!13263 () Bool)

(assert (=> b!18734 m!13263))

(assert (=> b!18734 m!12809))

(declare-fun m!13265 () Bool)

(assert (=> b!18734 m!13265))

(assert (=> b!18734 m!13259))

(declare-fun m!13267 () Bool)

(assert (=> b!18734 m!13267))

(declare-fun m!13269 () Bool)

(assert (=> b!18734 m!13269))

(assert (=> b!18734 m!13251))

(declare-fun m!13271 () Bool)

(assert (=> b!18734 m!13271))

(declare-fun m!13273 () Bool)

(assert (=> b!18734 m!13273))

(declare-fun m!13275 () Bool)

(assert (=> b!18734 m!13275))

(declare-fun m!13277 () Bool)

(assert (=> b!18734 m!13277))

(declare-fun m!13279 () Bool)

(assert (=> b!18734 m!13279))

(assert (=> b!18734 m!13267))

(assert (=> b!18734 m!13257))

(declare-fun m!13281 () Bool)

(assert (=> b!18734 m!13281))

(declare-fun m!13283 () Bool)

(assert (=> b!18734 m!13283))

(assert (=> b!18734 m!13271))

(assert (=> b!18744 m!12809))

(assert (=> b!18744 m!12809))

(assert (=> b!18744 m!12825))

(assert (=> bm!701 d!3473))

(assert (=> d!3409 d!3435))

(declare-fun d!3475 () Bool)

(declare-fun e!12006 () Bool)

(assert (=> d!3475 e!12006))

(declare-fun res!12944 () Bool)

(assert (=> d!3475 (=> (not res!12944) (not e!12006))))

(declare-fun lt!5243 () (_ BitVec 32))

(assert (=> d!3475 (= res!12944 (validMask!0 lt!5243))))

(declare-datatypes ((tuple2!810 0))(
  ( (tuple2!811 (_1!407 Unit!362) (_2!407 (_ BitVec 32))) )
))
(declare-fun e!12005 () tuple2!810)

(assert (=> d!3475 (= lt!5243 (_2!407 e!12005))))

(declare-fun c!1991 () Bool)

(declare-fun lt!5242 () tuple2!810)

(assert (=> d!3475 (= c!1991 (and (bvsgt (_2!407 lt!5242) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!82 (v!1471 (underlying!61 thiss!848)))) (_2!407 lt!5242)) (bvsge (bvadd (bvand (bvashr (_2!407 lt!5242) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!82 (v!1471 (underlying!61 thiss!848))))))))

(declare-fun Unit!381 () Unit!362)

(declare-fun Unit!382 () Unit!362)

(assert (=> d!3475 (= lt!5242 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!82 (v!1471 (underlying!61 thiss!848))) (_vacant!82 (v!1471 (underlying!61 thiss!848))))) (mask!4594 (v!1471 (underlying!61 thiss!848)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!82 (v!1471 (underlying!61 thiss!848)))) (mask!4594 (v!1471 (underlying!61 thiss!848))))) (tuple2!811 Unit!381 (bvand (bvadd (bvshl (mask!4594 (v!1471 (underlying!61 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!811 Unit!382 (mask!4594 (v!1471 (underlying!61 thiss!848))))))))

(assert (=> d!3475 (validMask!0 (mask!4594 (v!1471 (underlying!61 thiss!848))))))

(assert (=> d!3475 (= (computeNewMask!2 thiss!848 (mask!4594 (v!1471 (underlying!61 thiss!848))) (_vacant!82 (v!1471 (underlying!61 thiss!848))) (_size!82 (v!1471 (underlying!61 thiss!848)))) lt!5243)))

(declare-fun b!18761 () Bool)

(declare-fun computeNewMaskWhile!2 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!810)

(assert (=> b!18761 (= e!12005 (computeNewMaskWhile!2 (_size!82 (v!1471 (underlying!61 thiss!848))) (_vacant!82 (v!1471 (underlying!61 thiss!848))) (mask!4594 (v!1471 (underlying!61 thiss!848))) (_2!407 lt!5242)))))

(declare-fun b!18762 () Bool)

(declare-fun Unit!383 () Unit!362)

(assert (=> b!18762 (= e!12005 (tuple2!811 Unit!383 (_2!407 lt!5242)))))

(declare-fun b!18763 () Bool)

(assert (=> b!18763 (= e!12006 (bvsle (_size!82 (v!1471 (underlying!61 thiss!848))) (bvadd lt!5243 #b00000000000000000000000000000001)))))

(assert (= (and d!3475 c!1991) b!18761))

(assert (= (and d!3475 (not c!1991)) b!18762))

(assert (= (and d!3475 res!12944) b!18763))

(declare-fun m!13285 () Bool)

(assert (=> d!3475 m!13285))

(declare-fun m!13287 () Bool)

(assert (=> d!3475 m!13287))

(declare-fun m!13289 () Bool)

(assert (=> b!18761 m!13289))

(assert (=> d!3409 d!3475))

(assert (=> d!3409 d!3391))

(declare-fun d!3477 () Bool)

(assert (=> d!3477 (= (map!358 (v!1471 (underlying!61 thiss!848))) (getCurrentListMap!119 (_keys!3086 (v!1471 (underlying!61 thiss!848))) (_values!1658 (v!1471 (underlying!61 thiss!848))) (mask!4594 (v!1471 (underlying!61 thiss!848))) (extraKeys!1574 (v!1471 (underlying!61 thiss!848))) (zeroValue!1597 (v!1471 (underlying!61 thiss!848))) (minValue!1597 (v!1471 (underlying!61 thiss!848))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 thiss!848)))))))

(declare-fun bs!849 () Bool)

(assert (= bs!849 d!3477))

(declare-fun m!13291 () Bool)

(assert (=> bs!849 m!13291))

(assert (=> d!3393 d!3477))

(declare-fun d!3479 () Bool)

(declare-fun res!12949 () Bool)

(declare-fun e!12011 () Bool)

(assert (=> d!3479 (=> res!12949 e!12011)))

(assert (=> d!3479 (= res!12949 (and ((_ is Cons!531) (toList!282 lt!4693)) (= (_1!397 (h!1097 (toList!282 lt!4693))) key!682)))))

(assert (=> d!3479 (= (containsKey!23 (toList!282 lt!4693) key!682) e!12011)))

(declare-fun b!18768 () Bool)

(declare-fun e!12012 () Bool)

(assert (=> b!18768 (= e!12011 e!12012)))

(declare-fun res!12950 () Bool)

(assert (=> b!18768 (=> (not res!12950) (not e!12012))))

(assert (=> b!18768 (= res!12950 (and (or (not ((_ is Cons!531) (toList!282 lt!4693))) (bvsle (_1!397 (h!1097 (toList!282 lt!4693))) key!682)) ((_ is Cons!531) (toList!282 lt!4693)) (bvslt (_1!397 (h!1097 (toList!282 lt!4693))) key!682)))))

(declare-fun b!18769 () Bool)

(assert (=> b!18769 (= e!12012 (containsKey!23 (t!3168 (toList!282 lt!4693)) key!682))))

(assert (= (and d!3479 (not res!12949)) b!18768))

(assert (= (and b!18768 res!12950) b!18769))

(declare-fun m!13293 () Bool)

(assert (=> b!18769 m!13293))

(assert (=> d!3407 d!3479))

(declare-fun b!18786 () Bool)

(declare-fun e!12021 () Bool)

(declare-fun call!852 () Bool)

(assert (=> b!18786 (= e!12021 (not call!852))))

(declare-fun b!18787 () Bool)

(declare-fun res!12959 () Bool)

(declare-fun e!12024 () Bool)

(assert (=> b!18787 (=> (not res!12959) (not e!12024))))

(declare-fun call!853 () Bool)

(assert (=> b!18787 (= res!12959 call!853)))

(declare-fun e!12022 () Bool)

(assert (=> b!18787 (= e!12022 e!12024)))

(declare-fun b!18788 () Bool)

(declare-fun lt!5248 () SeekEntryResult!43)

(assert (=> b!18788 (= e!12022 ((_ is Undefined!43) lt!5248))))

(declare-fun b!18789 () Bool)

(declare-fun res!12962 () Bool)

(assert (=> b!18789 (=> (not res!12962) (not e!12024))))

(assert (=> b!18789 (= res!12962 (= (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2294 lt!5248)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!18789 (and (bvsge (index!2294 lt!5248) #b00000000000000000000000000000000) (bvslt (index!2294 lt!5248) (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun b!18790 () Bool)

(assert (=> b!18790 (and (bvsge (index!2291 lt!5248) #b00000000000000000000000000000000) (bvslt (index!2291 lt!5248) (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun res!12960 () Bool)

(assert (=> b!18790 (= res!12960 (= (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2291 lt!5248)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!18790 (=> (not res!12960) (not e!12021))))

(declare-fun b!18792 () Bool)

(declare-fun e!12023 () Bool)

(assert (=> b!18792 (= e!12023 e!12022)))

(declare-fun c!1997 () Bool)

(assert (=> b!18792 (= c!1997 ((_ is MissingVacant!43) lt!5248))))

(declare-fun bm!849 () Bool)

(declare-fun c!1996 () Bool)

(assert (=> bm!849 (= call!853 (inRange!0 (ite c!1996 (index!2291 lt!5248) (index!2294 lt!5248)) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun bm!850 () Bool)

(assert (=> bm!850 (= call!852 (arrayContainsKey!0 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) key!682 #b00000000000000000000000000000000))))

(declare-fun b!18793 () Bool)

(assert (=> b!18793 (= e!12024 (not call!852))))

(declare-fun b!18791 () Bool)

(assert (=> b!18791 (= e!12023 e!12021)))

(declare-fun res!12961 () Bool)

(assert (=> b!18791 (= res!12961 call!853)))

(assert (=> b!18791 (=> (not res!12961) (not e!12021))))

(declare-fun d!3481 () Bool)

(assert (=> d!3481 e!12023))

(assert (=> d!3481 (= c!1996 ((_ is MissingZero!43) lt!5248))))

(assert (=> d!3481 (= lt!5248 (seekEntryOrOpen!0 key!682 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun lt!5249 () Unit!362)

(declare-fun choose!192 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 64) Int) Unit!362)

(assert (=> d!3481 (= lt!5249 (choose!192 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) key!682 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(assert (=> d!3481 (validMask!0 (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))))))

(assert (=> d!3481 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!2 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) key!682 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))) lt!5249)))

(assert (= (and d!3481 c!1996) b!18791))

(assert (= (and d!3481 (not c!1996)) b!18792))

(assert (= (and b!18791 res!12961) b!18790))

(assert (= (and b!18790 res!12960) b!18786))

(assert (= (and b!18792 c!1997) b!18787))

(assert (= (and b!18792 (not c!1997)) b!18788))

(assert (= (and b!18787 res!12959) b!18789))

(assert (= (and b!18789 res!12962) b!18793))

(assert (= (or b!18791 b!18787) bm!849))

(assert (= (or b!18786 b!18793) bm!850))

(declare-fun m!13295 () Bool)

(assert (=> bm!849 m!13295))

(declare-fun m!13297 () Bool)

(assert (=> b!18789 m!13297))

(assert (=> d!3481 m!12683))

(declare-fun m!13299 () Bool)

(assert (=> d!3481 m!13299))

(assert (=> d!3481 m!12779))

(declare-fun m!13301 () Bool)

(assert (=> b!18790 m!13301))

(assert (=> bm!850 m!12693))

(assert (=> bm!691 d!3481))

(declare-fun d!3483 () Bool)

(declare-fun res!12967 () Bool)

(declare-fun e!12029 () Bool)

(assert (=> d!3483 (=> res!12967 e!12029)))

(assert (=> d!3483 (= res!12967 (= (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) #b00000000000000000000000000000000) key!682))))

(assert (=> d!3483 (= (arrayContainsKey!0 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) key!682 #b00000000000000000000000000000000) e!12029)))

(declare-fun b!18798 () Bool)

(declare-fun e!12030 () Bool)

(assert (=> b!18798 (= e!12029 e!12030)))

(declare-fun res!12968 () Bool)

(assert (=> b!18798 (=> (not res!12968) (not e!12030))))

(assert (=> b!18798 (= res!12968 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun b!18799 () Bool)

(assert (=> b!18799 (= e!12030 (arrayContainsKey!0 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) key!682 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!3483 (not res!12967)) b!18798))

(assert (= (and b!18798 res!12968) b!18799))

(assert (=> d!3483 m!12809))

(declare-fun m!13303 () Bool)

(assert (=> b!18799 m!13303))

(assert (=> bm!682 d!3483))

(declare-fun d!3485 () Bool)

(declare-fun e!12033 () Bool)

(assert (=> d!3485 e!12033))

(declare-fun res!12971 () Bool)

(assert (=> d!3485 (=> (not res!12971) (not e!12033))))

(assert (=> d!3485 (= res!12971 (and (bvsge (index!2292 lt!4782) #b00000000000000000000000000000000) (bvslt (index!2292 lt!4782) (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))))))))

(declare-fun lt!5252 () Unit!362)

(declare-fun choose!193 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 32) Int) Unit!362)

(assert (=> d!3485 (= lt!5252 (choose!193 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4775 (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (index!2292 lt!4782) (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(assert (=> d!3485 (validMask!0 (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))))))

(assert (=> d!3485 (= (lemmaValidKeyInArrayIsInListMap!2 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4775 (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (index!2292 lt!4782) (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))) lt!5252)))

(declare-fun b!18802 () Bool)

(assert (=> b!18802 (= e!12033 (contains!213 (getCurrentListMap!119 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) lt!4775 (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))) (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!4782))))))

(assert (= (and d!3485 res!12971) b!18802))

(declare-fun m!13305 () Bool)

(assert (=> d!3485 m!13305))

(assert (=> d!3485 m!12779))

(declare-fun m!13307 () Bool)

(assert (=> b!18802 m!13307))

(assert (=> b!18802 m!12711))

(assert (=> b!18802 m!13307))

(assert (=> b!18802 m!12711))

(declare-fun m!13309 () Bool)

(assert (=> b!18802 m!13309))

(assert (=> b!18341 d!3485))

(declare-fun d!3487 () Bool)

(declare-fun e!12036 () Bool)

(assert (=> d!3487 e!12036))

(declare-fun res!12974 () Bool)

(assert (=> d!3487 (=> (not res!12974) (not e!12036))))

(assert (=> d!3487 (= res!12974 (and (bvsge (index!2292 lt!4782) #b00000000000000000000000000000000) (bvslt (index!2292 lt!4782) (size!578 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))))))))

(declare-fun lt!5255 () Unit!362)

(declare-fun choose!194 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 32) (_ BitVec 64) V!1043 Int) Unit!362)

(assert (=> d!3487 (= lt!5255 (choose!194 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (index!2292 lt!4782) key!682 v!259 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(assert (=> d!3487 (validMask!0 (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))))))

(assert (=> d!3487 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!2 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (index!2292 lt!4782) key!682 v!259 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))) lt!5255)))

(declare-fun b!18805 () Bool)

(assert (=> b!18805 (= e!12036 (= (+!34 (getCurrentListMap!119 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))) (tuple2!793 key!682 v!259)) (getCurrentListMap!119 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (array!1014 (store (arr!488 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!4782) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(assert (= (and d!3487 res!12974) b!18805))

(declare-fun m!13311 () Bool)

(assert (=> d!3487 m!13311))

(assert (=> d!3487 m!12779))

(assert (=> b!18805 m!12703))

(assert (=> b!18805 m!12703))

(declare-fun m!13313 () Bool)

(assert (=> b!18805 m!13313))

(assert (=> b!18805 m!12673))

(declare-fun m!13315 () Bool)

(assert (=> b!18805 m!13315))

(assert (=> b!18341 d!3487))

(declare-fun d!3489 () Bool)

(declare-fun e!12038 () Bool)

(assert (=> d!3489 e!12038))

(declare-fun res!12975 () Bool)

(assert (=> d!3489 (=> res!12975 e!12038)))

(declare-fun lt!5258 () Bool)

(assert (=> d!3489 (= res!12975 (not lt!5258))))

(declare-fun lt!5256 () Bool)

(assert (=> d!3489 (= lt!5258 lt!5256)))

(declare-fun lt!5259 () Unit!362)

(declare-fun e!12037 () Unit!362)

(assert (=> d!3489 (= lt!5259 e!12037)))

(declare-fun c!1998 () Bool)

(assert (=> d!3489 (= c!1998 lt!5256)))

(assert (=> d!3489 (= lt!5256 (containsKey!23 (toList!282 call!700) key!682))))

(assert (=> d!3489 (= (contains!213 call!700 key!682) lt!5258)))

(declare-fun b!18806 () Bool)

(declare-fun lt!5257 () Unit!362)

(assert (=> b!18806 (= e!12037 lt!5257)))

(assert (=> b!18806 (= lt!5257 (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!282 call!700) key!682))))

(assert (=> b!18806 (isDefined!21 (getValueByKey!59 (toList!282 call!700) key!682))))

(declare-fun b!18807 () Bool)

(declare-fun Unit!384 () Unit!362)

(assert (=> b!18807 (= e!12037 Unit!384)))

(declare-fun b!18808 () Bool)

(assert (=> b!18808 (= e!12038 (isDefined!21 (getValueByKey!59 (toList!282 call!700) key!682)))))

(assert (= (and d!3489 c!1998) b!18806))

(assert (= (and d!3489 (not c!1998)) b!18807))

(assert (= (and d!3489 (not res!12975)) b!18808))

(declare-fun m!13317 () Bool)

(assert (=> d!3489 m!13317))

(declare-fun m!13319 () Bool)

(assert (=> b!18806 m!13319))

(declare-fun m!13321 () Bool)

(assert (=> b!18806 m!13321))

(assert (=> b!18806 m!13321))

(declare-fun m!13323 () Bool)

(assert (=> b!18806 m!13323))

(assert (=> b!18808 m!13321))

(assert (=> b!18808 m!13321))

(assert (=> b!18808 m!13323))

(assert (=> b!18341 d!3489))

(declare-fun c!1999 () Bool)

(declare-fun d!3491 () Bool)

(assert (=> d!3491 (= c!1999 (and ((_ is Cons!531) (toList!282 lt!4811)) (= (_1!397 (h!1097 (toList!282 lt!4811))) (_1!397 (tuple2!793 key!682 v!259)))))))

(declare-fun e!12039 () Option!65)

(assert (=> d!3491 (= (getValueByKey!59 (toList!282 lt!4811) (_1!397 (tuple2!793 key!682 v!259))) e!12039)))

(declare-fun b!18811 () Bool)

(declare-fun e!12040 () Option!65)

(assert (=> b!18811 (= e!12040 (getValueByKey!59 (t!3168 (toList!282 lt!4811)) (_1!397 (tuple2!793 key!682 v!259))))))

(declare-fun b!18809 () Bool)

(assert (=> b!18809 (= e!12039 (Some!64 (_2!397 (h!1097 (toList!282 lt!4811)))))))

(declare-fun b!18810 () Bool)

(assert (=> b!18810 (= e!12039 e!12040)))

(declare-fun c!2000 () Bool)

(assert (=> b!18810 (= c!2000 (and ((_ is Cons!531) (toList!282 lt!4811)) (not (= (_1!397 (h!1097 (toList!282 lt!4811))) (_1!397 (tuple2!793 key!682 v!259))))))))

(declare-fun b!18812 () Bool)

(assert (=> b!18812 (= e!12040 None!63)))

(assert (= (and d!3491 c!1999) b!18809))

(assert (= (and d!3491 (not c!1999)) b!18810))

(assert (= (and b!18810 c!2000) b!18811))

(assert (= (and b!18810 (not c!2000)) b!18812))

(declare-fun m!13325 () Bool)

(assert (=> b!18811 m!13325))

(assert (=> b!18350 d!3491))

(declare-fun b!18848 () Bool)

(declare-fun e!12058 () Unit!362)

(declare-fun Unit!385 () Unit!362)

(assert (=> b!18848 (= e!12058 Unit!385)))

(declare-fun lt!5323 () Unit!362)

(declare-fun lemmaArrayContainsKeyThenInListMap!1 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 64) (_ BitVec 32) Int) Unit!362)

(assert (=> b!18848 (= lt!5323 (lemmaArrayContainsKeyThenInListMap!1 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) key!682 #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(assert (=> b!18848 (contains!213 (getCurrentListMap!119 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))) key!682)))

(declare-fun lt!5322 () Unit!362)

(assert (=> b!18848 (= lt!5322 lt!5323)))

(assert (=> b!18848 false))

(declare-fun b!18849 () Bool)

(declare-fun res!13000 () Bool)

(declare-fun lt!5347 () SeekEntryResult!43)

(assert (=> b!18849 (= res!13000 (= (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2294 lt!5347)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!12060 () Bool)

(assert (=> b!18849 (=> (not res!13000) (not e!12060))))

(declare-fun b!18850 () Bool)

(declare-fun Unit!386 () Unit!362)

(assert (=> b!18850 (= e!12058 Unit!386)))

(declare-fun b!18851 () Bool)

(declare-fun c!2012 () Bool)

(assert (=> b!18851 (= c!2012 ((_ is MissingVacant!43) lt!5347))))

(declare-fun e!12059 () Bool)

(declare-fun e!12062 () Bool)

(assert (=> b!18851 (= e!12059 e!12062)))

(declare-fun bm!859 () Bool)

(declare-fun call!865 () Bool)

(declare-fun call!862 () Bool)

(assert (=> bm!859 (= call!865 call!862)))

(declare-fun lt!5341 () SeekEntryResult!43)

(declare-fun c!2010 () Bool)

(declare-fun bm!860 () Bool)

(declare-fun c!2009 () Bool)

(assert (=> bm!860 (= call!862 (inRange!0 (ite c!2009 (index!2292 lt!5341) (ite c!2010 (index!2291 lt!5347) (index!2294 lt!5347))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun b!18852 () Bool)

(declare-fun res!13001 () Bool)

(declare-fun e!12063 () Bool)

(assert (=> b!18852 (=> (not res!13001) (not e!12063))))

(assert (=> b!18852 (= res!13001 call!865)))

(assert (=> b!18852 (= e!12059 e!12063)))

(declare-fun b!18853 () Bool)

(declare-fun call!863 () Bool)

(assert (=> b!18853 (= e!12060 (not call!863))))

(declare-fun b!18854 () Bool)

(assert (=> b!18854 (= e!12062 ((_ is Undefined!43) lt!5347))))

(declare-fun d!3493 () Bool)

(declare-fun e!12064 () Bool)

(assert (=> d!3493 e!12064))

(declare-fun res!12997 () Bool)

(assert (=> d!3493 (=> (not res!12997) (not e!12064))))

(declare-fun lt!5331 () tuple2!794)

(assert (=> d!3493 (= res!12997 (_1!398 lt!5331))))

(assert (=> d!3493 (= lt!5331 (tuple2!795 true (LongMapFixedSize!101 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (bvadd (_size!82 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000001) (array!1016 (store (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782)) key!682) (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))) (array!1014 (store (arr!488 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782)) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))))) (_vacant!82 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun lt!5332 () Unit!362)

(declare-fun lt!5325 () Unit!362)

(assert (=> d!3493 (= lt!5332 lt!5325)))

(declare-fun lt!5336 () array!1015)

(declare-fun lt!5343 () array!1013)

(assert (=> d!3493 (contains!213 (getCurrentListMap!119 lt!5336 lt!5343 (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))) (select (store (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782)) key!682) (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782))))))

(assert (=> d!3493 (= lt!5325 (lemmaValidKeyInArrayIsInListMap!2 lt!5336 lt!5343 (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782)) (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(assert (=> d!3493 (= lt!5343 (array!1014 (store (arr!488 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782)) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(assert (=> d!3493 (= lt!5336 (array!1016 (store (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782)) key!682) (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun lt!5342 () Unit!362)

(declare-fun lt!5339 () Unit!362)

(assert (=> d!3493 (= lt!5342 lt!5339)))

(declare-fun lt!5338 () array!1015)

(assert (=> d!3493 (= (arrayCountValidKeys!0 lt!5338 (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782)) (bvadd (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!1015 (_ BitVec 32)) Unit!362)

(assert (=> d!3493 (= lt!5339 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!5338 (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782))))))

(assert (=> d!3493 (= lt!5338 (array!1016 (store (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782)) key!682) (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun lt!5321 () Unit!362)

(declare-fun lt!5334 () Unit!362)

(assert (=> d!3493 (= lt!5321 lt!5334)))

(declare-fun lt!5330 () array!1015)

(assert (=> d!3493 (arrayContainsKey!0 lt!5330 key!682 #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1015 (_ BitVec 64) (_ BitVec 32)) Unit!362)

(assert (=> d!3493 (= lt!5334 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!5330 key!682 (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782))))))

(assert (=> d!3493 (= lt!5330 (array!1016 (store (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782)) key!682) (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))))))

(declare-fun lt!5337 () Unit!362)

(declare-fun lt!5328 () Unit!362)

(assert (=> d!3493 (= lt!5337 lt!5328)))

(assert (=> d!3493 (= (+!34 (getCurrentListMap!119 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))) (tuple2!793 key!682 v!259)) (getCurrentListMap!119 (array!1016 (store (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782)) key!682) (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))) (array!1014 (store (arr!488 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782)) (ValueCellFull!257 v!259)) (size!578 (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!1 (array!1015 array!1013 (_ BitVec 32) (_ BitVec 32) V!1043 V!1043 (_ BitVec 32) (_ BitVec 64) V!1043 Int) Unit!362)

(assert (=> d!3493 (= lt!5328 (lemmaAddValidKeyToArrayThenAddPairToListMap!1 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782)) key!682 v!259 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun lt!5349 () Unit!362)

(declare-fun lt!5348 () Unit!362)

(assert (=> d!3493 (= lt!5349 lt!5348)))

(assert (=> d!3493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!1016 (store (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782)) key!682) (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!1015 (_ BitVec 32) (_ BitVec 32)) Unit!362)

(assert (=> d!3493 (= lt!5348 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!682 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782)) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun lt!5335 () Unit!362)

(declare-fun lt!5329 () Unit!362)

(assert (=> d!3493 (= lt!5335 lt!5329)))

(assert (=> d!3493 (= (arrayCountValidKeys!0 (array!1016 (store (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782)) key!682) (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))) #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))) (bvadd (arrayCountValidKeys!0 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!1015 (_ BitVec 32) (_ BitVec 64)) Unit!362)

(assert (=> d!3493 (= lt!5329 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782)) key!682))))

(declare-fun lt!5324 () Unit!362)

(declare-fun lt!5345 () Unit!362)

(assert (=> d!3493 (= lt!5324 lt!5345)))

(declare-fun lt!5344 () List!538)

(declare-fun lt!5346 () (_ BitVec 32))

(assert (=> d!3493 (arrayNoDuplicates!0 (array!1016 (store (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782)) key!682) (size!579 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))))) lt!5346 lt!5344)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!1015 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!538) Unit!362)

(assert (=> d!3493 (= lt!5345 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) key!682 (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782)) lt!5346 lt!5344))))

(assert (=> d!3493 (= lt!5344 Nil!535)))

(assert (=> d!3493 (= lt!5346 #b00000000000000000000000000000000)))

(declare-fun lt!5326 () Unit!362)

(assert (=> d!3493 (= lt!5326 e!12058)))

(declare-fun c!2011 () Bool)

(assert (=> d!3493 (= c!2011 (arrayContainsKey!0 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) key!682 #b00000000000000000000000000000000))))

(declare-fun lt!5340 () Unit!362)

(declare-fun e!12061 () Unit!362)

(assert (=> d!3493 (= lt!5340 e!12061)))

(assert (=> d!3493 (= c!2009 (contains!213 (getCurrentListMap!119 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) #b00000000000000000000000000000000 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))) key!682))))

(assert (=> d!3493 (valid!58 (v!1471 (underlying!61 (_2!396 lt!4694))))))

(assert (=> d!3493 (= (updateHelperNewKey!2 (v!1471 (underlying!61 (_2!396 lt!4694))) key!682 v!259 (ite c!1860 (index!2294 lt!4782) (index!2291 lt!4782))) lt!5331)))

(declare-fun b!18847 () Bool)

(assert (=> b!18847 (= e!12064 (= (map!358 (_2!398 lt!5331)) (+!34 (map!358 (v!1471 (underlying!61 (_2!396 lt!4694)))) (tuple2!793 key!682 v!259))))))

(declare-fun b!18855 () Bool)

(assert (=> b!18855 (= e!12063 (not call!863))))

(declare-fun e!12057 () Bool)

(declare-fun b!18856 () Bool)

(assert (=> b!18856 (= e!12057 (= (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2292 lt!5341)) key!682))))

(declare-fun b!18857 () Bool)

(declare-fun res!13002 () Bool)

(assert (=> b!18857 (=> (not res!13002) (not e!12064))))

(assert (=> b!18857 (= res!13002 (valid!58 (_2!398 lt!5331)))))

(declare-fun b!18858 () Bool)

(declare-fun res!12996 () Bool)

(assert (=> b!18858 (=> (not res!12996) (not e!12063))))

(assert (=> b!18858 (= res!12996 (= (select (arr!489 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694))))) (index!2291 lt!5347)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18859 () Bool)

(declare-fun Unit!387 () Unit!362)

(assert (=> b!18859 (= e!12061 Unit!387)))

(declare-fun lt!5333 () Unit!362)

(assert (=> b!18859 (= lt!5333 (lemmaInListMapThenSeekEntryOrOpenFindsIt!2 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) key!682 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun call!864 () SeekEntryResult!43)

(assert (=> b!18859 (= lt!5341 call!864)))

(declare-fun res!12998 () Bool)

(assert (=> b!18859 (= res!12998 ((_ is Found!43) lt!5341))))

(assert (=> b!18859 (=> (not res!12998) (not e!12057))))

(assert (=> b!18859 e!12057))

(declare-fun lt!5320 () Unit!362)

(assert (=> b!18859 (= lt!5320 lt!5333)))

(assert (=> b!18859 false))

(declare-fun b!18860 () Bool)

(declare-fun lt!5327 () Unit!362)

(assert (=> b!18860 (= e!12061 lt!5327)))

(assert (=> b!18860 (= lt!5327 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!2 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (_values!1658 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694)))) (extraKeys!1574 (v!1471 (underlying!61 (_2!396 lt!4694)))) (zeroValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) (minValue!1597 (v!1471 (underlying!61 (_2!396 lt!4694)))) key!682 (defaultEntry!1661 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(assert (=> b!18860 (= lt!5347 call!864)))

(assert (=> b!18860 (= c!2010 ((_ is MissingZero!43) lt!5347))))

(assert (=> b!18860 e!12059))

(declare-fun b!18861 () Bool)

(declare-fun res!12999 () Bool)

(assert (=> b!18861 (= res!12999 call!862)))

(assert (=> b!18861 (=> (not res!12999) (not e!12057))))

(declare-fun b!18862 () Bool)

(declare-fun res!12995 () Bool)

(assert (=> b!18862 (=> (not res!12995) (not e!12064))))

(assert (=> b!18862 (= res!12995 (contains!213 (map!358 (_2!398 lt!5331)) key!682))))

(declare-fun bm!861 () Bool)

(assert (=> bm!861 (= call!863 (arrayContainsKey!0 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) key!682 #b00000000000000000000000000000000))))

(declare-fun bm!862 () Bool)

(assert (=> bm!862 (= call!864 (seekEntryOrOpen!0 key!682 (_keys!3086 (v!1471 (underlying!61 (_2!396 lt!4694)))) (mask!4594 (v!1471 (underlying!61 (_2!396 lt!4694))))))))

(declare-fun b!18863 () Bool)

(assert (=> b!18863 (= e!12062 e!12060)))

(declare-fun res!12994 () Bool)

(assert (=> b!18863 (= res!12994 call!865)))

(assert (=> b!18863 (=> (not res!12994) (not e!12060))))

(assert (= (and d!3493 c!2009) b!18859))

(assert (= (and d!3493 (not c!2009)) b!18860))

(assert (= (and b!18859 res!12998) b!18861))

(assert (= (and b!18861 res!12999) b!18856))

(assert (= (and b!18860 c!2010) b!18852))

(assert (= (and b!18860 (not c!2010)) b!18851))

(assert (= (and b!18852 res!13001) b!18858))

(assert (= (and b!18858 res!12996) b!18855))

(assert (= (and b!18851 c!2012) b!18863))

(assert (= (and b!18851 (not c!2012)) b!18854))

(assert (= (and b!18863 res!12994) b!18849))

(assert (= (and b!18849 res!13000) b!18853))

(assert (= (or b!18852 b!18863) bm!859))

(assert (= (or b!18855 b!18853) bm!861))

(assert (= (or b!18861 bm!859) bm!860))

(assert (= (or b!18859 b!18860) bm!862))

(assert (= (and d!3493 c!2011) b!18848))

(assert (= (and d!3493 (not c!2011)) b!18850))

(assert (= (and d!3493 res!12997) b!18857))

(assert (= (and b!18857 res!13002) b!18862))

(assert (= (and b!18862 res!12995) b!18847))

(declare-fun m!13327 () Bool)

(assert (=> b!18856 m!13327))

(declare-fun m!13329 () Bool)

(assert (=> bm!860 m!13329))

(declare-fun m!13331 () Bool)

(assert (=> b!18857 m!13331))

(assert (=> bm!862 m!12683))

(declare-fun m!13333 () Bool)

(assert (=> b!18848 m!13333))

(assert (=> b!18848 m!12703))

(assert (=> b!18848 m!12703))

(declare-fun m!13335 () Bool)

(assert (=> b!18848 m!13335))

(declare-fun m!13337 () Bool)

(assert (=> b!18847 m!13337))

(assert (=> b!18847 m!12679))

(assert (=> b!18847 m!12679))

(declare-fun m!13339 () Bool)

(assert (=> b!18847 m!13339))

(assert (=> b!18860 m!12681))

(assert (=> b!18859 m!12701))

(assert (=> b!18862 m!13337))

(assert (=> b!18862 m!13337))

(declare-fun m!13341 () Bool)

(assert (=> b!18862 m!13341))

(declare-fun m!13343 () Bool)

(assert (=> b!18858 m!13343))

(declare-fun m!13345 () Bool)

(assert (=> b!18849 m!13345))

(assert (=> bm!861 m!12693))

(declare-fun m!13347 () Bool)

(assert (=> d!3493 m!13347))

(declare-fun m!13349 () Bool)

(assert (=> d!3493 m!13349))

(declare-fun m!13351 () Bool)

(assert (=> d!3493 m!13351))

(assert (=> d!3493 m!12703))

(declare-fun m!13353 () Bool)

(assert (=> d!3493 m!13353))

(declare-fun m!13355 () Bool)

(assert (=> d!3493 m!13355))

(assert (=> d!3493 m!12703))

(assert (=> d!3493 m!13335))

(assert (=> d!3493 m!13075))

(declare-fun m!13357 () Bool)

(assert (=> d!3493 m!13357))

(assert (=> d!3493 m!12703))

(assert (=> d!3493 m!13313))

(declare-fun m!13359 () Bool)

(assert (=> d!3493 m!13359))

(assert (=> d!3493 m!13349))

(declare-fun m!13361 () Bool)

(assert (=> d!3493 m!13361))

(assert (=> d!3493 m!12693))

(declare-fun m!13363 () Bool)

(assert (=> d!3493 m!13363))

(declare-fun m!13365 () Bool)

(assert (=> d!3493 m!13365))

(assert (=> d!3493 m!13347))

(assert (=> d!3493 m!12687))

(declare-fun m!13367 () Bool)

(assert (=> d!3493 m!13367))

(declare-fun m!13369 () Bool)

(assert (=> d!3493 m!13369))

(declare-fun m!13371 () Bool)

(assert (=> d!3493 m!13371))

(declare-fun m!13373 () Bool)

(assert (=> d!3493 m!13373))

(declare-fun m!13375 () Bool)

(assert (=> d!3493 m!13375))

(declare-fun m!13377 () Bool)

(assert (=> d!3493 m!13377))

(declare-fun m!13379 () Bool)

(assert (=> d!3493 m!13379))

(declare-fun m!13381 () Bool)

(assert (=> d!3493 m!13381))

(assert (=> bm!692 d!3493))

(declare-fun b!18864 () Bool)

(declare-fun e!12065 () Bool)

(assert (=> b!18864 (= e!12065 tp_is_empty!913)))

(declare-fun mapNonEmpty!814 () Bool)

(declare-fun mapRes!814 () Bool)

(declare-fun tp!3154 () Bool)

(assert (=> mapNonEmpty!814 (= mapRes!814 (and tp!3154 e!12065))))

(declare-fun mapValue!814 () ValueCell!257)

(declare-fun mapKey!814 () (_ BitVec 32))

(declare-fun mapRest!814 () (Array (_ BitVec 32) ValueCell!257))

(assert (=> mapNonEmpty!814 (= mapRest!813 (store mapRest!814 mapKey!814 mapValue!814))))

(declare-fun b!18865 () Bool)

(declare-fun e!12066 () Bool)

(assert (=> b!18865 (= e!12066 tp_is_empty!913)))

(declare-fun mapIsEmpty!814 () Bool)

(assert (=> mapIsEmpty!814 mapRes!814))

(declare-fun condMapEmpty!814 () Bool)

(declare-fun mapDefault!814 () ValueCell!257)

(assert (=> mapNonEmpty!813 (= condMapEmpty!814 (= mapRest!813 ((as const (Array (_ BitVec 32) ValueCell!257)) mapDefault!814)))))

(assert (=> mapNonEmpty!813 (= tp!3153 (and e!12066 mapRes!814))))

(assert (= (and mapNonEmpty!813 condMapEmpty!814) mapIsEmpty!814))

(assert (= (and mapNonEmpty!813 (not condMapEmpty!814)) mapNonEmpty!814))

(assert (= (and mapNonEmpty!814 ((_ is ValueCellFull!257) mapValue!814)) b!18864))

(assert (= (and mapNonEmpty!813 ((_ is ValueCellFull!257) mapDefault!814)) b!18865))

(declare-fun m!13383 () Bool)

(assert (=> mapNonEmpty!814 m!13383))

(declare-fun b_lambda!1447 () Bool)

(assert (= b_lambda!1439 (or (and b!18136 b_free!649) b_lambda!1447)))

(declare-fun b_lambda!1449 () Bool)

(assert (= b_lambda!1437 (or (and b!18136 b_free!649) b_lambda!1449)))

(declare-fun b_lambda!1451 () Bool)

(assert (= b_lambda!1441 (or (and b!18136 b_free!649) b_lambda!1451)))

(check-sat (not b_lambda!1451) (not d!3429) (not d!3459) (not d!3467) (not b!18470) (not b!18808) (not b!18671) (not b!18459) (not b!18568) (not bm!772) (not b_lambda!1447) (not b!18748) (not bm!810) (not b!18462) (not d!3411) (not bm!840) (not b!18452) (not bm!770) (not b!18507) (not b_lambda!1443) (not bm!790) (not b!18741) (not b!18744) (not b!18862) (not d!3481) (not b!18695) (not bm!731) (not d!3419) (not b!18675) (not d!3433) (not b!18548) (not d!3437) (not b!18730) (not bm!764) (not b!18409) (not bm!850) (not d!3435) (not bm!860) (not bm!729) (not d!3461) (not bm!818) (not mapNonEmpty!814) (not bm!835) (not bm!829) (not b!18733) (not b!18724) (not b!18745) (not d!3489) (not bm!787) (not b!18642) (not bm!766) (not d!3465) (not bm!762) (not b!18558) (not bm!793) (not b!18618) (not b!18668) (not bm!763) (not bm!812) (not b!18647) (not b!18516) (not bm!825) (not bm!827) (not d!3471) (not b!18811) (not bm!765) (not bm!841) (not b!18682) (not d!3427) (not b!18585) (not bm!828) (not b_lambda!1435) (not bm!824) (not bm!834) (not b!18761) (not b!18720) (not bm!769) (not b!18665) (not bm!861) (not b!18611) (not b!18659) (not b!18608) (not bm!761) (not b!18754) (not d!3475) (not b!18857) (not bm!784) (not b_next!649) (not bm!831) (not b!18407) (not b!18651) (not bm!837) (not b!18397) (not b!18681) (not b!18848) (not b!18506) (not b!18860) (not d!3441) (not d!3493) (not b!18734) tp_is_empty!913 (not bm!830) (not bm!778) (not d!3413) (not b!18535) (not b!18463) (not b!18587) (not b!18723) (not bm!791) (not b!18806) (not b!18799) (not d!3463) (not b!18396) (not bm!788) (not b!18679) (not d!3425) (not b!18593) (not b!18672) (not bm!833) (not d!3487) (not bm!805) (not b!18472) (not b!18456) (not b!18712) (not b!18590) (not b!18802) (not d!3451) (not d!3477) (not bm!821) (not d!3447) (not b!18769) (not bm!797) (not d!3469) (not d!3453) (not b!18731) (not d!3457) (not bm!808) (not b!18466) (not bm!789) (not b!18661) (not d!3455) (not b!18653) (not bm!843) (not b!18534) (not b_lambda!1449) (not bm!862) (not b!18847) (not bm!781) (not d!3417) (not b!18644) (not d!3431) (not b!18565) (not bm!795) (not b!18606) (not d!3485) (not b!18722) (not bm!794) (not bm!773) (not bm!785) (not b!18859) (not b!18708) (not b!18715) (not b!18504) (not d!3421) (not bm!771) (not b!18805) (not b!18738) (not b!18652) (not b!18604) (not bm!767) (not bm!839) (not bm!733) (not d!3415) (not b!18752) (not b!18705) (not bm!809) (not d!3423) (not b!18511) (not d!3473) (not bm!730) (not bm!849) (not b!18400) (not b!18561) (not bm!768) (not b!18617) (not b!18654) (not b!18721) (not b!18649) b_and!1307 (not d!3439) (not b!18398) (not b_lambda!1445) (not b!18650) (not b!18408))
(check-sat b_and!1307 (not b_next!649))
