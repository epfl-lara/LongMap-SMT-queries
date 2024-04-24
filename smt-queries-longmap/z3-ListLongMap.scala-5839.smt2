; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75576 () Bool)

(assert start!75576)

(declare-fun b!888740 () Bool)

(declare-fun b_free!15535 () Bool)

(declare-fun b_next!15535 () Bool)

(assert (=> b!888740 (= b_free!15535 (not b_next!15535))))

(declare-fun tp!54550 () Bool)

(declare-fun b_and!25781 () Bool)

(assert (=> b!888740 (= tp!54550 b_and!25781)))

(declare-fun b!888735 () Bool)

(declare-fun e!495131 () Bool)

(declare-fun e!495134 () Bool)

(assert (=> b!888735 (= e!495131 e!495134)))

(declare-fun b!888736 () Bool)

(declare-fun e!495130 () Bool)

(assert (=> b!888736 (= e!495130 e!495131)))

(declare-fun b!888737 () Bool)

(declare-fun e!495132 () Bool)

(declare-fun e!495133 () Bool)

(declare-fun mapRes!28324 () Bool)

(assert (=> b!888737 (= e!495132 (and e!495133 mapRes!28324))))

(declare-fun condMapEmpty!28324 () Bool)

(declare-datatypes ((V!28783 0))(
  ( (V!28784 (val!8982 Int)) )
))
(declare-datatypes ((array!51731 0))(
  ( (array!51732 (arr!24874 (Array (_ BitVec 32) (_ BitVec 64))) (size!25315 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8450 0))(
  ( (ValueCellFull!8450 (v!11447 V!28783)) (EmptyCell!8450) )
))
(declare-datatypes ((array!51733 0))(
  ( (array!51734 (arr!24875 (Array (_ BitVec 32) ValueCell!8450)) (size!25316 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3916 0))(
  ( (LongMapFixedSize!3917 (defaultEntry!5149 Int) (mask!25598 (_ BitVec 32)) (extraKeys!4843 (_ BitVec 32)) (zeroValue!4947 V!28783) (minValue!4947 V!28783) (_size!2013 (_ BitVec 32)) (_keys!9854 array!51731) (_values!5134 array!51733) (_vacant!2013 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1076 0))(
  ( (Cell!1077 (v!11448 LongMapFixedSize!3916)) )
))
(declare-datatypes ((LongMap!1076 0))(
  ( (LongMap!1077 (underlying!549 Cell!1076)) )
))
(declare-fun thiss!821 () LongMap!1076)

(declare-fun mapDefault!28324 () ValueCell!8450)

(assert (=> b!888737 (= condMapEmpty!28324 (= (arr!24875 (_values!5134 (v!11448 (underlying!549 thiss!821)))) ((as const (Array (_ BitVec 32) ValueCell!8450)) mapDefault!28324)))))

(declare-fun b!888738 () Bool)

(declare-fun e!495135 () Bool)

(declare-fun tp_is_empty!17863 () Bool)

(assert (=> b!888738 (= e!495135 tp_is_empty!17863)))

(declare-fun mapIsEmpty!28324 () Bool)

(assert (=> mapIsEmpty!28324 mapRes!28324))

(declare-fun b!888739 () Bool)

(declare-fun e!495137 () Bool)

(declare-fun key!666 () (_ BitVec 64))

(declare-fun contains!4291 (LongMapFixedSize!3916 (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!11852 0))(
  ( (tuple2!11853 (_1!5937 (_ BitVec 64)) (_2!5937 V!28783)) )
))
(declare-datatypes ((List!17638 0))(
  ( (Nil!17635) (Cons!17634 (h!18771 tuple2!11852) (t!24925 List!17638)) )
))
(declare-datatypes ((ListLongMap!10551 0))(
  ( (ListLongMap!10552 (toList!5291 List!17638)) )
))
(declare-fun contains!4292 (ListLongMap!10551 (_ BitVec 64)) Bool)

(declare-fun map!12084 (LongMap!1076) ListLongMap!10551)

(assert (=> b!888739 (= e!495137 (not (= (contains!4291 (v!11448 (underlying!549 thiss!821)) key!666) (contains!4292 (map!12084 thiss!821) key!666))))))

(declare-fun array_inv!19616 (array!51731) Bool)

(declare-fun array_inv!19617 (array!51733) Bool)

(assert (=> b!888740 (= e!495134 (and tp!54550 tp_is_empty!17863 (array_inv!19616 (_keys!9854 (v!11448 (underlying!549 thiss!821)))) (array_inv!19617 (_values!5134 (v!11448 (underlying!549 thiss!821)))) e!495132))))

(declare-fun b!888741 () Bool)

(assert (=> b!888741 (= e!495133 tp_is_empty!17863)))

(declare-fun res!602557 () Bool)

(assert (=> start!75576 (=> (not res!602557) (not e!495137))))

(declare-fun valid!1536 (LongMap!1076) Bool)

(assert (=> start!75576 (= res!602557 (valid!1536 thiss!821))))

(assert (=> start!75576 e!495137))

(assert (=> start!75576 e!495130))

(assert (=> start!75576 true))

(declare-fun mapNonEmpty!28324 () Bool)

(declare-fun tp!54549 () Bool)

(assert (=> mapNonEmpty!28324 (= mapRes!28324 (and tp!54549 e!495135))))

(declare-fun mapRest!28324 () (Array (_ BitVec 32) ValueCell!8450))

(declare-fun mapKey!28324 () (_ BitVec 32))

(declare-fun mapValue!28324 () ValueCell!8450)

(assert (=> mapNonEmpty!28324 (= (arr!24875 (_values!5134 (v!11448 (underlying!549 thiss!821)))) (store mapRest!28324 mapKey!28324 mapValue!28324))))

(assert (= (and start!75576 res!602557) b!888739))

(assert (= (and b!888737 condMapEmpty!28324) mapIsEmpty!28324))

(assert (= (and b!888737 (not condMapEmpty!28324)) mapNonEmpty!28324))

(get-info :version)

(assert (= (and mapNonEmpty!28324 ((_ is ValueCellFull!8450) mapValue!28324)) b!888738))

(assert (= (and b!888737 ((_ is ValueCellFull!8450) mapDefault!28324)) b!888741))

(assert (= b!888740 b!888737))

(assert (= b!888735 b!888740))

(assert (= b!888736 b!888735))

(assert (= start!75576 b!888736))

(declare-fun m!828613 () Bool)

(assert (=> b!888739 m!828613))

(declare-fun m!828615 () Bool)

(assert (=> b!888739 m!828615))

(assert (=> b!888739 m!828615))

(declare-fun m!828617 () Bool)

(assert (=> b!888739 m!828617))

(declare-fun m!828619 () Bool)

(assert (=> b!888740 m!828619))

(declare-fun m!828621 () Bool)

(assert (=> b!888740 m!828621))

(declare-fun m!828623 () Bool)

(assert (=> start!75576 m!828623))

(declare-fun m!828625 () Bool)

(assert (=> mapNonEmpty!28324 m!828625))

(check-sat (not start!75576) b_and!25781 (not mapNonEmpty!28324) (not b!888740) tp_is_empty!17863 (not b!888739) (not b_next!15535))
(check-sat b_and!25781 (not b_next!15535))
(get-model)

(declare-fun d!110295 () Bool)

(declare-fun valid!1538 (LongMapFixedSize!3916) Bool)

(assert (=> d!110295 (= (valid!1536 thiss!821) (valid!1538 (v!11448 (underlying!549 thiss!821))))))

(declare-fun bs!24907 () Bool)

(assert (= bs!24907 d!110295))

(declare-fun m!828655 () Bool)

(assert (=> bs!24907 m!828655))

(assert (=> start!75576 d!110295))

(declare-fun c!94030 () Bool)

(declare-datatypes ((SeekEntryResult!8716 0))(
  ( (MissingZero!8716 (index!37235 (_ BitVec 32))) (Found!8716 (index!37236 (_ BitVec 32))) (Intermediate!8716 (undefined!9528 Bool) (index!37237 (_ BitVec 32)) (x!75278 (_ BitVec 32))) (Undefined!8716) (MissingVacant!8716 (index!37238 (_ BitVec 32))) )
))
(declare-fun lt!401859 () SeekEntryResult!8716)

(declare-fun bm!39443 () Bool)

(declare-fun call!39447 () ListLongMap!10551)

(declare-fun call!39446 () Bool)

(assert (=> bm!39443 (= call!39446 (contains!4292 call!39447 (ite c!94030 (select (arr!24874 (_keys!9854 (v!11448 (underlying!549 thiss!821)))) (index!37236 lt!401859)) key!666)))))

(declare-fun b!888804 () Bool)

(declare-fun e!495196 () Bool)

(assert (=> b!888804 (= e!495196 (not (= (bvand (extraKeys!4843 (v!11448 (underlying!549 thiss!821))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!39444 () Bool)

(declare-fun call!39448 () Bool)

(declare-fun arrayContainsKey!0 (array!51731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39444 (= call!39448 (arrayContainsKey!0 (_keys!9854 (v!11448 (underlying!549 thiss!821))) key!666 #b00000000000000000000000000000000))))

(declare-fun b!888806 () Bool)

(declare-fun e!495198 () Bool)

(assert (=> b!888806 (= e!495198 false)))

(declare-fun c!94029 () Bool)

(assert (=> b!888806 (= c!94029 call!39446)))

(declare-datatypes ((Unit!30235 0))(
  ( (Unit!30236) )
))
(declare-fun lt!401865 () Unit!30235)

(declare-fun e!495199 () Unit!30235)

(assert (=> b!888806 (= lt!401865 e!495199)))

(declare-fun b!888807 () Bool)

(declare-fun e!495197 () Bool)

(assert (=> b!888807 (= e!495197 (not (= (bvand (extraKeys!4843 (v!11448 (underlying!549 thiss!821))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!888808 () Bool)

(declare-fun e!495200 () Bool)

(assert (=> b!888808 (= e!495200 call!39448)))

(declare-fun b!888809 () Bool)

(assert (=> b!888809 (= c!94030 ((_ is Found!8716) lt!401859))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51731 (_ BitVec 32)) SeekEntryResult!8716)

(assert (=> b!888809 (= lt!401859 (seekEntry!0 key!666 (_keys!9854 (v!11448 (underlying!549 thiss!821))) (mask!25598 (v!11448 (underlying!549 thiss!821)))))))

(assert (=> b!888809 (= e!495197 e!495198)))

(declare-fun b!888810 () Bool)

(assert (=> b!888810 (= e!495196 e!495197)))

(declare-fun c!94032 () Bool)

(assert (=> b!888810 (= c!94032 (= key!666 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!888805 () Bool)

(assert (=> b!888805 (= e!495198 true)))

(declare-fun lt!401868 () Unit!30235)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51731 (_ BitVec 64) (_ BitVec 32)) Unit!30235)

(assert (=> b!888805 (= lt!401868 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9854 (v!11448 (underlying!549 thiss!821))) key!666 (index!37236 lt!401859)))))

(assert (=> b!888805 call!39448))

(declare-fun lt!401864 () Unit!30235)

(assert (=> b!888805 (= lt!401864 lt!401868)))

(declare-fun lt!401866 () Unit!30235)

(declare-fun lemmaValidKeyInArrayIsInListMap!202 (array!51731 array!51733 (_ BitVec 32) (_ BitVec 32) V!28783 V!28783 (_ BitVec 32) Int) Unit!30235)

(assert (=> b!888805 (= lt!401866 (lemmaValidKeyInArrayIsInListMap!202 (_keys!9854 (v!11448 (underlying!549 thiss!821))) (_values!5134 (v!11448 (underlying!549 thiss!821))) (mask!25598 (v!11448 (underlying!549 thiss!821))) (extraKeys!4843 (v!11448 (underlying!549 thiss!821))) (zeroValue!4947 (v!11448 (underlying!549 thiss!821))) (minValue!4947 (v!11448 (underlying!549 thiss!821))) (index!37236 lt!401859) (defaultEntry!5149 (v!11448 (underlying!549 thiss!821)))))))

(assert (=> b!888805 call!39446))

(declare-fun lt!401863 () Unit!30235)

(assert (=> b!888805 (= lt!401863 lt!401866)))

(declare-fun d!110297 () Bool)

(declare-fun lt!401857 () Bool)

(declare-fun map!12085 (LongMapFixedSize!3916) ListLongMap!10551)

(assert (=> d!110297 (= lt!401857 (contains!4292 (map!12085 (v!11448 (underlying!549 thiss!821))) key!666))))

(assert (=> d!110297 (= lt!401857 e!495196)))

(declare-fun c!94031 () Bool)

(assert (=> d!110297 (= c!94031 (= key!666 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110297 (valid!1538 (v!11448 (underlying!549 thiss!821)))))

(assert (=> d!110297 (= (contains!4291 (v!11448 (underlying!549 thiss!821)) key!666) lt!401857)))

(declare-fun b!888811 () Bool)

(declare-fun Unit!30237 () Unit!30235)

(assert (=> b!888811 (= e!495199 Unit!30237)))

(declare-fun b!888812 () Bool)

(assert (=> b!888812 false))

(declare-fun lt!401861 () Unit!30235)

(declare-fun lt!401867 () Unit!30235)

(assert (=> b!888812 (= lt!401861 lt!401867)))

(declare-fun lt!401862 () SeekEntryResult!8716)

(declare-fun lt!401856 () (_ BitVec 32))

(assert (=> b!888812 (and ((_ is Found!8716) lt!401862) (= (index!37236 lt!401862) lt!401856))))

(assert (=> b!888812 (= lt!401862 (seekEntry!0 key!666 (_keys!9854 (v!11448 (underlying!549 thiss!821))) (mask!25598 (v!11448 (underlying!549 thiss!821)))))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!51731 (_ BitVec 32)) Unit!30235)

(assert (=> b!888812 (= lt!401867 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!666 lt!401856 (_keys!9854 (v!11448 (underlying!549 thiss!821))) (mask!25598 (v!11448 (underlying!549 thiss!821)))))))

(declare-fun lt!401858 () Unit!30235)

(declare-fun lt!401860 () Unit!30235)

(assert (=> b!888812 (= lt!401858 lt!401860)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51731 (_ BitVec 32)) Bool)

(assert (=> b!888812 (arrayForallSeekEntryOrOpenFound!0 lt!401856 (_keys!9854 (v!11448 (underlying!549 thiss!821))) (mask!25598 (v!11448 (underlying!549 thiss!821))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!51731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30235)

(assert (=> b!888812 (= lt!401860 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9854 (v!11448 (underlying!549 thiss!821))) (mask!25598 (v!11448 (underlying!549 thiss!821))) #b00000000000000000000000000000000 lt!401856))))

(declare-fun arrayScanForKey!0 (array!51731 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!888812 (= lt!401856 (arrayScanForKey!0 (_keys!9854 (v!11448 (underlying!549 thiss!821))) key!666 #b00000000000000000000000000000000))))

(declare-fun lt!401854 () Unit!30235)

(declare-fun lt!401855 () Unit!30235)

(assert (=> b!888812 (= lt!401854 lt!401855)))

(assert (=> b!888812 e!495200))

(declare-fun c!94033 () Bool)

(assert (=> b!888812 (= c!94033 (and (not (= key!666 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!666 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!159 (array!51731 array!51733 (_ BitVec 32) (_ BitVec 32) V!28783 V!28783 (_ BitVec 64) Int) Unit!30235)

(assert (=> b!888812 (= lt!401855 (lemmaKeyInListMapIsInArray!159 (_keys!9854 (v!11448 (underlying!549 thiss!821))) (_values!5134 (v!11448 (underlying!549 thiss!821))) (mask!25598 (v!11448 (underlying!549 thiss!821))) (extraKeys!4843 (v!11448 (underlying!549 thiss!821))) (zeroValue!4947 (v!11448 (underlying!549 thiss!821))) (minValue!4947 (v!11448 (underlying!549 thiss!821))) key!666 (defaultEntry!5149 (v!11448 (underlying!549 thiss!821)))))))

(declare-fun Unit!30238 () Unit!30235)

(assert (=> b!888812 (= e!495199 Unit!30238)))

(declare-fun b!888813 () Bool)

(assert (=> b!888813 (= e!495200 (ite (= key!666 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4843 (v!11448 (underlying!549 thiss!821))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4843 (v!11448 (underlying!549 thiss!821))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!39445 () Bool)

(declare-fun getCurrentListMap!2572 (array!51731 array!51733 (_ BitVec 32) (_ BitVec 32) V!28783 V!28783 (_ BitVec 32) Int) ListLongMap!10551)

(assert (=> bm!39445 (= call!39447 (getCurrentListMap!2572 (_keys!9854 (v!11448 (underlying!549 thiss!821))) (_values!5134 (v!11448 (underlying!549 thiss!821))) (mask!25598 (v!11448 (underlying!549 thiss!821))) (extraKeys!4843 (v!11448 (underlying!549 thiss!821))) (zeroValue!4947 (v!11448 (underlying!549 thiss!821))) (minValue!4947 (v!11448 (underlying!549 thiss!821))) #b00000000000000000000000000000000 (defaultEntry!5149 (v!11448 (underlying!549 thiss!821)))))))

(assert (= (and d!110297 c!94031) b!888804))

(assert (= (and d!110297 (not c!94031)) b!888810))

(assert (= (and b!888810 c!94032) b!888807))

(assert (= (and b!888810 (not c!94032)) b!888809))

(assert (= (and b!888809 c!94030) b!888805))

(assert (= (and b!888809 (not c!94030)) b!888806))

(assert (= (and b!888806 c!94029) b!888812))

(assert (= (and b!888806 (not c!94029)) b!888811))

(assert (= (and b!888812 c!94033) b!888808))

(assert (= (and b!888812 (not c!94033)) b!888813))

(assert (= (or b!888805 b!888806) bm!39445))

(assert (= (or b!888805 b!888808) bm!39444))

(assert (= (or b!888805 b!888806) bm!39443))

(declare-fun m!828657 () Bool)

(assert (=> bm!39445 m!828657))

(declare-fun m!828659 () Bool)

(assert (=> d!110297 m!828659))

(assert (=> d!110297 m!828659))

(declare-fun m!828661 () Bool)

(assert (=> d!110297 m!828661))

(assert (=> d!110297 m!828655))

(declare-fun m!828663 () Bool)

(assert (=> b!888805 m!828663))

(declare-fun m!828665 () Bool)

(assert (=> b!888805 m!828665))

(declare-fun m!828667 () Bool)

(assert (=> b!888812 m!828667))

(declare-fun m!828669 () Bool)

(assert (=> b!888812 m!828669))

(declare-fun m!828671 () Bool)

(assert (=> b!888812 m!828671))

(declare-fun m!828673 () Bool)

(assert (=> b!888812 m!828673))

(declare-fun m!828675 () Bool)

(assert (=> b!888812 m!828675))

(declare-fun m!828677 () Bool)

(assert (=> b!888812 m!828677))

(declare-fun m!828679 () Bool)

(assert (=> bm!39443 m!828679))

(declare-fun m!828681 () Bool)

(assert (=> bm!39443 m!828681))

(assert (=> b!888809 m!828675))

(declare-fun m!828683 () Bool)

(assert (=> bm!39444 m!828683))

(assert (=> b!888739 d!110297))

(declare-fun d!110299 () Bool)

(declare-fun e!495206 () Bool)

(assert (=> d!110299 e!495206))

(declare-fun res!602566 () Bool)

(assert (=> d!110299 (=> res!602566 e!495206)))

(declare-fun lt!401879 () Bool)

(assert (=> d!110299 (= res!602566 (not lt!401879))))

(declare-fun lt!401878 () Bool)

(assert (=> d!110299 (= lt!401879 lt!401878)))

(declare-fun lt!401877 () Unit!30235)

(declare-fun e!495205 () Unit!30235)

(assert (=> d!110299 (= lt!401877 e!495205)))

(declare-fun c!94036 () Bool)

(assert (=> d!110299 (= c!94036 lt!401878)))

(declare-fun containsKey!420 (List!17638 (_ BitVec 64)) Bool)

(assert (=> d!110299 (= lt!401878 (containsKey!420 (toList!5291 (map!12084 thiss!821)) key!666))))

(assert (=> d!110299 (= (contains!4292 (map!12084 thiss!821) key!666) lt!401879)))

(declare-fun b!888820 () Bool)

(declare-fun lt!401880 () Unit!30235)

(assert (=> b!888820 (= e!495205 lt!401880)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!314 (List!17638 (_ BitVec 64)) Unit!30235)

(assert (=> b!888820 (= lt!401880 (lemmaContainsKeyImpliesGetValueByKeyDefined!314 (toList!5291 (map!12084 thiss!821)) key!666))))

(declare-datatypes ((Option!442 0))(
  ( (Some!441 (v!11453 V!28783)) (None!440) )
))
(declare-fun isDefined!316 (Option!442) Bool)

(declare-fun getValueByKey!436 (List!17638 (_ BitVec 64)) Option!442)

(assert (=> b!888820 (isDefined!316 (getValueByKey!436 (toList!5291 (map!12084 thiss!821)) key!666))))

(declare-fun b!888821 () Bool)

(declare-fun Unit!30239 () Unit!30235)

(assert (=> b!888821 (= e!495205 Unit!30239)))

(declare-fun b!888822 () Bool)

(assert (=> b!888822 (= e!495206 (isDefined!316 (getValueByKey!436 (toList!5291 (map!12084 thiss!821)) key!666)))))

(assert (= (and d!110299 c!94036) b!888820))

(assert (= (and d!110299 (not c!94036)) b!888821))

(assert (= (and d!110299 (not res!602566)) b!888822))

(declare-fun m!828685 () Bool)

(assert (=> d!110299 m!828685))

(declare-fun m!828687 () Bool)

(assert (=> b!888820 m!828687))

(declare-fun m!828689 () Bool)

(assert (=> b!888820 m!828689))

(assert (=> b!888820 m!828689))

(declare-fun m!828691 () Bool)

(assert (=> b!888820 m!828691))

(assert (=> b!888822 m!828689))

(assert (=> b!888822 m!828689))

(assert (=> b!888822 m!828691))

(assert (=> b!888739 d!110299))

(declare-fun d!110301 () Bool)

(assert (=> d!110301 (= (map!12084 thiss!821) (map!12085 (v!11448 (underlying!549 thiss!821))))))

(declare-fun bs!24908 () Bool)

(assert (= bs!24908 d!110301))

(assert (=> bs!24908 m!828659))

(assert (=> b!888739 d!110301))

(declare-fun d!110303 () Bool)

(assert (=> d!110303 (= (array_inv!19616 (_keys!9854 (v!11448 (underlying!549 thiss!821)))) (bvsge (size!25315 (_keys!9854 (v!11448 (underlying!549 thiss!821)))) #b00000000000000000000000000000000))))

(assert (=> b!888740 d!110303))

(declare-fun d!110305 () Bool)

(assert (=> d!110305 (= (array_inv!19617 (_values!5134 (v!11448 (underlying!549 thiss!821)))) (bvsge (size!25316 (_values!5134 (v!11448 (underlying!549 thiss!821)))) #b00000000000000000000000000000000))))

(assert (=> b!888740 d!110305))

(declare-fun b!888829 () Bool)

(declare-fun e!495211 () Bool)

(assert (=> b!888829 (= e!495211 tp_is_empty!17863)))

(declare-fun mapNonEmpty!28333 () Bool)

(declare-fun mapRes!28333 () Bool)

(declare-fun tp!54565 () Bool)

(assert (=> mapNonEmpty!28333 (= mapRes!28333 (and tp!54565 e!495211))))

(declare-fun mapRest!28333 () (Array (_ BitVec 32) ValueCell!8450))

(declare-fun mapKey!28333 () (_ BitVec 32))

(declare-fun mapValue!28333 () ValueCell!8450)

(assert (=> mapNonEmpty!28333 (= mapRest!28324 (store mapRest!28333 mapKey!28333 mapValue!28333))))

(declare-fun mapIsEmpty!28333 () Bool)

(assert (=> mapIsEmpty!28333 mapRes!28333))

(declare-fun b!888830 () Bool)

(declare-fun e!495212 () Bool)

(assert (=> b!888830 (= e!495212 tp_is_empty!17863)))

(declare-fun condMapEmpty!28333 () Bool)

(declare-fun mapDefault!28333 () ValueCell!8450)

(assert (=> mapNonEmpty!28324 (= condMapEmpty!28333 (= mapRest!28324 ((as const (Array (_ BitVec 32) ValueCell!8450)) mapDefault!28333)))))

(assert (=> mapNonEmpty!28324 (= tp!54549 (and e!495212 mapRes!28333))))

(assert (= (and mapNonEmpty!28324 condMapEmpty!28333) mapIsEmpty!28333))

(assert (= (and mapNonEmpty!28324 (not condMapEmpty!28333)) mapNonEmpty!28333))

(assert (= (and mapNonEmpty!28333 ((_ is ValueCellFull!8450) mapValue!28333)) b!888829))

(assert (= (and mapNonEmpty!28324 ((_ is ValueCellFull!8450) mapDefault!28333)) b!888830))

(declare-fun m!828693 () Bool)

(assert (=> mapNonEmpty!28333 m!828693))

(check-sat (not mapNonEmpty!28333) (not bm!39444) (not b!888812) (not b_next!15535) (not d!110297) (not b!888820) (not d!110301) (not d!110295) (not b!888822) (not bm!39445) b_and!25781 (not d!110299) (not bm!39443) (not b!888809) (not b!888805) tp_is_empty!17863)
(check-sat b_and!25781 (not b_next!15535))
