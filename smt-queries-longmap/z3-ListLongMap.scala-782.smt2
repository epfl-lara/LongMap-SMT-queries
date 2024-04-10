; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18540 () Bool)

(assert start!18540)

(declare-fun b!183730 () Bool)

(declare-fun b_free!4533 () Bool)

(declare-fun b_next!4533 () Bool)

(assert (=> b!183730 (= b_free!4533 (not b_next!4533))))

(declare-fun tp!16373 () Bool)

(declare-fun b_and!11109 () Bool)

(assert (=> b!183730 (= tp!16373 b_and!11109)))

(declare-fun b!183723 () Bool)

(declare-fun res!86954 () Bool)

(declare-fun e!120954 () Bool)

(assert (=> b!183723 (=> (not res!86954) (not e!120954))))

(declare-datatypes ((V!5387 0))(
  ( (V!5388 (val!2197 Int)) )
))
(declare-datatypes ((ValueCell!1809 0))(
  ( (ValueCellFull!1809 (v!4101 V!5387)) (EmptyCell!1809) )
))
(declare-datatypes ((array!7805 0))(
  ( (array!7806 (arr!3689 (Array (_ BitVec 32) (_ BitVec 64))) (size!4002 (_ BitVec 32))) )
))
(declare-datatypes ((array!7807 0))(
  ( (array!7808 (arr!3690 (Array (_ BitVec 32) ValueCell!1809)) (size!4003 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2526 0))(
  ( (LongMapFixedSize!2527 (defaultEntry!3755 Int) (mask!8825 (_ BitVec 32)) (extraKeys!3492 (_ BitVec 32)) (zeroValue!3596 V!5387) (minValue!3596 V!5387) (_size!1312 (_ BitVec 32)) (_keys!5677 array!7805) (_values!3738 array!7807) (_vacant!1312 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2526)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!183723 (= res!86954 (validMask!0 (mask!8825 thiss!1248)))))

(declare-fun b!183724 () Bool)

(declare-fun e!120952 () Bool)

(declare-fun e!120951 () Bool)

(declare-fun mapRes!7395 () Bool)

(assert (=> b!183724 (= e!120952 (and e!120951 mapRes!7395))))

(declare-fun condMapEmpty!7395 () Bool)

(declare-fun mapDefault!7395 () ValueCell!1809)

(assert (=> b!183724 (= condMapEmpty!7395 (= (arr!3690 (_values!3738 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1809)) mapDefault!7395)))))

(declare-fun b!183726 () Bool)

(declare-fun tp_is_empty!4305 () Bool)

(assert (=> b!183726 (= e!120951 tp_is_empty!4305)))

(declare-fun b!183727 () Bool)

(declare-fun res!86951 () Bool)

(declare-fun e!120953 () Bool)

(assert (=> b!183727 (=> (not res!86951) (not e!120953))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!183727 (= res!86951 (not (= key!828 (bvneg key!828))))))

(declare-fun b!183728 () Bool)

(declare-fun e!120950 () Bool)

(assert (=> b!183728 (= e!120950 tp_is_empty!4305)))

(declare-fun b!183729 () Bool)

(assert (=> b!183729 (= e!120953 e!120954)))

(declare-fun res!86950 () Bool)

(assert (=> b!183729 (=> (not res!86950) (not e!120954))))

(declare-datatypes ((SeekEntryResult!622 0))(
  ( (MissingZero!622 (index!4658 (_ BitVec 32))) (Found!622 (index!4659 (_ BitVec 32))) (Intermediate!622 (undefined!1434 Bool) (index!4660 (_ BitVec 32)) (x!20002 (_ BitVec 32))) (Undefined!622) (MissingVacant!622 (index!4661 (_ BitVec 32))) )
))
(declare-fun lt!90828 () SeekEntryResult!622)

(get-info :version)

(assert (=> b!183729 (= res!86950 (and (not ((_ is Undefined!622) lt!90828)) (not ((_ is MissingVacant!622) lt!90828)) (not ((_ is MissingZero!622) lt!90828)) ((_ is Found!622) lt!90828)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7805 (_ BitVec 32)) SeekEntryResult!622)

(assert (=> b!183729 (= lt!90828 (seekEntryOrOpen!0 key!828 (_keys!5677 thiss!1248) (mask!8825 thiss!1248)))))

(declare-fun e!120949 () Bool)

(declare-fun array_inv!2387 (array!7805) Bool)

(declare-fun array_inv!2388 (array!7807) Bool)

(assert (=> b!183730 (= e!120949 (and tp!16373 tp_is_empty!4305 (array_inv!2387 (_keys!5677 thiss!1248)) (array_inv!2388 (_values!3738 thiss!1248)) e!120952))))

(declare-fun b!183731 () Bool)

(assert (=> b!183731 (= e!120954 (and (= (size!4003 (_values!3738 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8825 thiss!1248))) (not (= (size!4002 (_keys!5677 thiss!1248)) (size!4003 (_values!3738 thiss!1248))))))))

(declare-fun mapNonEmpty!7395 () Bool)

(declare-fun tp!16374 () Bool)

(assert (=> mapNonEmpty!7395 (= mapRes!7395 (and tp!16374 e!120950))))

(declare-fun mapValue!7395 () ValueCell!1809)

(declare-fun mapKey!7395 () (_ BitVec 32))

(declare-fun mapRest!7395 () (Array (_ BitVec 32) ValueCell!1809))

(assert (=> mapNonEmpty!7395 (= (arr!3690 (_values!3738 thiss!1248)) (store mapRest!7395 mapKey!7395 mapValue!7395))))

(declare-fun mapIsEmpty!7395 () Bool)

(assert (=> mapIsEmpty!7395 mapRes!7395))

(declare-fun res!86953 () Bool)

(assert (=> start!18540 (=> (not res!86953) (not e!120953))))

(declare-fun valid!1045 (LongMapFixedSize!2526) Bool)

(assert (=> start!18540 (= res!86953 (valid!1045 thiss!1248))))

(assert (=> start!18540 e!120953))

(assert (=> start!18540 e!120949))

(assert (=> start!18540 true))

(declare-fun b!183725 () Bool)

(declare-fun res!86952 () Bool)

(assert (=> b!183725 (=> (not res!86952) (not e!120954))))

(declare-datatypes ((tuple2!3424 0))(
  ( (tuple2!3425 (_1!1723 (_ BitVec 64)) (_2!1723 V!5387)) )
))
(declare-datatypes ((List!2340 0))(
  ( (Nil!2337) (Cons!2336 (h!2966 tuple2!3424) (t!7210 List!2340)) )
))
(declare-datatypes ((ListLongMap!2341 0))(
  ( (ListLongMap!2342 (toList!1186 List!2340)) )
))
(declare-fun contains!1274 (ListLongMap!2341 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!834 (array!7805 array!7807 (_ BitVec 32) (_ BitVec 32) V!5387 V!5387 (_ BitVec 32) Int) ListLongMap!2341)

(assert (=> b!183725 (= res!86952 (not (contains!1274 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248)) key!828)))))

(assert (= (and start!18540 res!86953) b!183727))

(assert (= (and b!183727 res!86951) b!183729))

(assert (= (and b!183729 res!86950) b!183725))

(assert (= (and b!183725 res!86952) b!183723))

(assert (= (and b!183723 res!86954) b!183731))

(assert (= (and b!183724 condMapEmpty!7395) mapIsEmpty!7395))

(assert (= (and b!183724 (not condMapEmpty!7395)) mapNonEmpty!7395))

(assert (= (and mapNonEmpty!7395 ((_ is ValueCellFull!1809) mapValue!7395)) b!183728))

(assert (= (and b!183724 ((_ is ValueCellFull!1809) mapDefault!7395)) b!183726))

(assert (= b!183730 b!183724))

(assert (= start!18540 b!183730))

(declare-fun m!211203 () Bool)

(assert (=> b!183725 m!211203))

(assert (=> b!183725 m!211203))

(declare-fun m!211205 () Bool)

(assert (=> b!183725 m!211205))

(declare-fun m!211207 () Bool)

(assert (=> b!183723 m!211207))

(declare-fun m!211209 () Bool)

(assert (=> mapNonEmpty!7395 m!211209))

(declare-fun m!211211 () Bool)

(assert (=> b!183730 m!211211))

(declare-fun m!211213 () Bool)

(assert (=> b!183730 m!211213))

(declare-fun m!211215 () Bool)

(assert (=> start!18540 m!211215))

(declare-fun m!211217 () Bool)

(assert (=> b!183729 m!211217))

(check-sat (not b!183730) (not mapNonEmpty!7395) tp_is_empty!4305 (not b_next!4533) (not b!183723) (not b!183725) b_and!11109 (not b!183729) (not start!18540))
(check-sat b_and!11109 (not b_next!4533))
(get-model)

(declare-fun d!54793 () Bool)

(declare-fun res!86976 () Bool)

(declare-fun e!120979 () Bool)

(assert (=> d!54793 (=> (not res!86976) (not e!120979))))

(declare-fun simpleValid!176 (LongMapFixedSize!2526) Bool)

(assert (=> d!54793 (= res!86976 (simpleValid!176 thiss!1248))))

(assert (=> d!54793 (= (valid!1045 thiss!1248) e!120979)))

(declare-fun b!183765 () Bool)

(declare-fun res!86977 () Bool)

(assert (=> b!183765 (=> (not res!86977) (not e!120979))))

(declare-fun arrayCountValidKeys!0 (array!7805 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!183765 (= res!86977 (= (arrayCountValidKeys!0 (_keys!5677 thiss!1248) #b00000000000000000000000000000000 (size!4002 (_keys!5677 thiss!1248))) (_size!1312 thiss!1248)))))

(declare-fun b!183766 () Bool)

(declare-fun res!86978 () Bool)

(assert (=> b!183766 (=> (not res!86978) (not e!120979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7805 (_ BitVec 32)) Bool)

(assert (=> b!183766 (= res!86978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5677 thiss!1248) (mask!8825 thiss!1248)))))

(declare-fun b!183767 () Bool)

(declare-datatypes ((List!2341 0))(
  ( (Nil!2338) (Cons!2337 (h!2967 (_ BitVec 64)) (t!7213 List!2341)) )
))
(declare-fun arrayNoDuplicates!0 (array!7805 (_ BitVec 32) List!2341) Bool)

(assert (=> b!183767 (= e!120979 (arrayNoDuplicates!0 (_keys!5677 thiss!1248) #b00000000000000000000000000000000 Nil!2338))))

(assert (= (and d!54793 res!86976) b!183765))

(assert (= (and b!183765 res!86977) b!183766))

(assert (= (and b!183766 res!86978) b!183767))

(declare-fun m!211235 () Bool)

(assert (=> d!54793 m!211235))

(declare-fun m!211237 () Bool)

(assert (=> b!183765 m!211237))

(declare-fun m!211239 () Bool)

(assert (=> b!183766 m!211239))

(declare-fun m!211241 () Bool)

(assert (=> b!183767 m!211241))

(assert (=> start!18540 d!54793))

(declare-fun d!54795 () Bool)

(assert (=> d!54795 (= (array_inv!2387 (_keys!5677 thiss!1248)) (bvsge (size!4002 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183730 d!54795))

(declare-fun d!54797 () Bool)

(assert (=> d!54797 (= (array_inv!2388 (_values!3738 thiss!1248)) (bvsge (size!4003 (_values!3738 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183730 d!54797))

(declare-fun d!54799 () Bool)

(declare-fun e!120985 () Bool)

(assert (=> d!54799 e!120985))

(declare-fun res!86981 () Bool)

(assert (=> d!54799 (=> res!86981 e!120985)))

(declare-fun lt!90842 () Bool)

(assert (=> d!54799 (= res!86981 (not lt!90842))))

(declare-fun lt!90840 () Bool)

(assert (=> d!54799 (= lt!90842 lt!90840)))

(declare-datatypes ((Unit!5556 0))(
  ( (Unit!5557) )
))
(declare-fun lt!90843 () Unit!5556)

(declare-fun e!120984 () Unit!5556)

(assert (=> d!54799 (= lt!90843 e!120984)))

(declare-fun c!32935 () Bool)

(assert (=> d!54799 (= c!32935 lt!90840)))

(declare-fun containsKey!221 (List!2340 (_ BitVec 64)) Bool)

(assert (=> d!54799 (= lt!90840 (containsKey!221 (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248))) key!828))))

(assert (=> d!54799 (= (contains!1274 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248)) key!828) lt!90842)))

(declare-fun b!183774 () Bool)

(declare-fun lt!90841 () Unit!5556)

(assert (=> b!183774 (= e!120984 lt!90841)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!169 (List!2340 (_ BitVec 64)) Unit!5556)

(assert (=> b!183774 (= lt!90841 (lemmaContainsKeyImpliesGetValueByKeyDefined!169 (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248))) key!828))))

(declare-datatypes ((Option!223 0))(
  ( (Some!222 (v!4103 V!5387)) (None!221) )
))
(declare-fun isDefined!170 (Option!223) Bool)

(declare-fun getValueByKey!217 (List!2340 (_ BitVec 64)) Option!223)

(assert (=> b!183774 (isDefined!170 (getValueByKey!217 (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248))) key!828))))

(declare-fun b!183775 () Bool)

(declare-fun Unit!5558 () Unit!5556)

(assert (=> b!183775 (= e!120984 Unit!5558)))

(declare-fun b!183776 () Bool)

(assert (=> b!183776 (= e!120985 (isDefined!170 (getValueByKey!217 (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248))) key!828)))))

(assert (= (and d!54799 c!32935) b!183774))

(assert (= (and d!54799 (not c!32935)) b!183775))

(assert (= (and d!54799 (not res!86981)) b!183776))

(declare-fun m!211243 () Bool)

(assert (=> d!54799 m!211243))

(declare-fun m!211245 () Bool)

(assert (=> b!183774 m!211245))

(declare-fun m!211247 () Bool)

(assert (=> b!183774 m!211247))

(assert (=> b!183774 m!211247))

(declare-fun m!211249 () Bool)

(assert (=> b!183774 m!211249))

(assert (=> b!183776 m!211247))

(assert (=> b!183776 m!211247))

(assert (=> b!183776 m!211249))

(assert (=> b!183725 d!54799))

(declare-fun bm!18553 () Bool)

(declare-fun call!18556 () ListLongMap!2341)

(declare-fun call!18559 () ListLongMap!2341)

(assert (=> bm!18553 (= call!18556 call!18559)))

(declare-fun b!183819 () Bool)

(declare-fun e!121023 () Bool)

(declare-fun lt!90905 () ListLongMap!2341)

(declare-fun apply!160 (ListLongMap!2341 (_ BitVec 64)) V!5387)

(declare-fun get!2114 (ValueCell!1809 V!5387) V!5387)

(declare-fun dynLambda!503 (Int (_ BitVec 64)) V!5387)

(assert (=> b!183819 (= e!121023 (= (apply!160 lt!90905 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000)) (get!2114 (select (arr!3690 (_values!3738 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!503 (defaultEntry!3755 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!183819 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4003 (_values!3738 thiss!1248))))))

(assert (=> b!183819 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4002 (_keys!5677 thiss!1248))))))

(declare-fun bm!18554 () Bool)

(declare-fun call!18560 () Bool)

(assert (=> bm!18554 (= call!18560 (contains!1274 lt!90905 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183820 () Bool)

(declare-fun e!121019 () Unit!5556)

(declare-fun lt!90898 () Unit!5556)

(assert (=> b!183820 (= e!121019 lt!90898)))

(declare-fun lt!90900 () ListLongMap!2341)

(declare-fun getCurrentListMapNoExtraKeys!193 (array!7805 array!7807 (_ BitVec 32) (_ BitVec 32) V!5387 V!5387 (_ BitVec 32) Int) ListLongMap!2341)

(assert (=> b!183820 (= lt!90900 (getCurrentListMapNoExtraKeys!193 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248)))))

(declare-fun lt!90889 () (_ BitVec 64))

(assert (=> b!183820 (= lt!90889 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90908 () (_ BitVec 64))

(assert (=> b!183820 (= lt!90908 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90903 () Unit!5556)

(declare-fun addStillContains!136 (ListLongMap!2341 (_ BitVec 64) V!5387 (_ BitVec 64)) Unit!5556)

(assert (=> b!183820 (= lt!90903 (addStillContains!136 lt!90900 lt!90889 (zeroValue!3596 thiss!1248) lt!90908))))

(declare-fun +!280 (ListLongMap!2341 tuple2!3424) ListLongMap!2341)

(assert (=> b!183820 (contains!1274 (+!280 lt!90900 (tuple2!3425 lt!90889 (zeroValue!3596 thiss!1248))) lt!90908)))

(declare-fun lt!90901 () Unit!5556)

(assert (=> b!183820 (= lt!90901 lt!90903)))

(declare-fun lt!90891 () ListLongMap!2341)

(assert (=> b!183820 (= lt!90891 (getCurrentListMapNoExtraKeys!193 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248)))))

(declare-fun lt!90896 () (_ BitVec 64))

(assert (=> b!183820 (= lt!90896 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90904 () (_ BitVec 64))

(assert (=> b!183820 (= lt!90904 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90897 () Unit!5556)

(declare-fun addApplyDifferent!136 (ListLongMap!2341 (_ BitVec 64) V!5387 (_ BitVec 64)) Unit!5556)

(assert (=> b!183820 (= lt!90897 (addApplyDifferent!136 lt!90891 lt!90896 (minValue!3596 thiss!1248) lt!90904))))

(assert (=> b!183820 (= (apply!160 (+!280 lt!90891 (tuple2!3425 lt!90896 (minValue!3596 thiss!1248))) lt!90904) (apply!160 lt!90891 lt!90904))))

(declare-fun lt!90907 () Unit!5556)

(assert (=> b!183820 (= lt!90907 lt!90897)))

(declare-fun lt!90894 () ListLongMap!2341)

(assert (=> b!183820 (= lt!90894 (getCurrentListMapNoExtraKeys!193 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248)))))

(declare-fun lt!90888 () (_ BitVec 64))

(assert (=> b!183820 (= lt!90888 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90899 () (_ BitVec 64))

(assert (=> b!183820 (= lt!90899 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90890 () Unit!5556)

(assert (=> b!183820 (= lt!90890 (addApplyDifferent!136 lt!90894 lt!90888 (zeroValue!3596 thiss!1248) lt!90899))))

(assert (=> b!183820 (= (apply!160 (+!280 lt!90894 (tuple2!3425 lt!90888 (zeroValue!3596 thiss!1248))) lt!90899) (apply!160 lt!90894 lt!90899))))

(declare-fun lt!90892 () Unit!5556)

(assert (=> b!183820 (= lt!90892 lt!90890)))

(declare-fun lt!90893 () ListLongMap!2341)

(assert (=> b!183820 (= lt!90893 (getCurrentListMapNoExtraKeys!193 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248)))))

(declare-fun lt!90909 () (_ BitVec 64))

(assert (=> b!183820 (= lt!90909 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90895 () (_ BitVec 64))

(assert (=> b!183820 (= lt!90895 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183820 (= lt!90898 (addApplyDifferent!136 lt!90893 lt!90909 (minValue!3596 thiss!1248) lt!90895))))

(assert (=> b!183820 (= (apply!160 (+!280 lt!90893 (tuple2!3425 lt!90909 (minValue!3596 thiss!1248))) lt!90895) (apply!160 lt!90893 lt!90895))))

(declare-fun b!183821 () Bool)

(declare-fun Unit!5559 () Unit!5556)

(assert (=> b!183821 (= e!121019 Unit!5559)))

(declare-fun b!183822 () Bool)

(declare-fun e!121014 () ListLongMap!2341)

(declare-fun call!18558 () ListLongMap!2341)

(assert (=> b!183822 (= e!121014 call!18558)))

(declare-fun b!183823 () Bool)

(declare-fun e!121017 () ListLongMap!2341)

(assert (=> b!183823 (= e!121017 (+!280 call!18559 (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248))))))

(declare-fun b!183824 () Bool)

(declare-fun e!121012 () Bool)

(declare-fun e!121020 () Bool)

(assert (=> b!183824 (= e!121012 e!121020)))

(declare-fun c!32948 () Bool)

(assert (=> b!183824 (= c!32948 (not (= (bvand (extraKeys!3492 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18555 () Bool)

(declare-fun call!18557 () ListLongMap!2341)

(assert (=> bm!18555 (= call!18558 call!18557)))

(declare-fun b!183826 () Bool)

(declare-fun res!87001 () Bool)

(assert (=> b!183826 (=> (not res!87001) (not e!121012))))

(declare-fun e!121013 () Bool)

(assert (=> b!183826 (= res!87001 e!121013)))

(declare-fun c!32953 () Bool)

(assert (=> b!183826 (= c!32953 (not (= (bvand (extraKeys!3492 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!183827 () Bool)

(declare-fun e!121021 () Bool)

(assert (=> b!183827 (= e!121021 (= (apply!160 lt!90905 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3596 thiss!1248)))))

(declare-fun bm!18556 () Bool)

(declare-fun call!18561 () ListLongMap!2341)

(assert (=> bm!18556 (= call!18561 (getCurrentListMapNoExtraKeys!193 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248)))))

(declare-fun b!183828 () Bool)

(declare-fun e!121015 () Bool)

(assert (=> b!183828 (= e!121020 e!121015)))

(declare-fun res!87003 () Bool)

(assert (=> b!183828 (= res!87003 call!18560)))

(assert (=> b!183828 (=> (not res!87003) (not e!121015))))

(declare-fun b!183829 () Bool)

(assert (=> b!183829 (= e!121020 (not call!18560))))

(declare-fun bm!18557 () Bool)

(declare-fun call!18562 () Bool)

(assert (=> bm!18557 (= call!18562 (contains!1274 lt!90905 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183830 () Bool)

(declare-fun res!87007 () Bool)

(assert (=> b!183830 (=> (not res!87007) (not e!121012))))

(declare-fun e!121024 () Bool)

(assert (=> b!183830 (= res!87007 e!121024)))

(declare-fun res!87004 () Bool)

(assert (=> b!183830 (=> res!87004 e!121024)))

(declare-fun e!121022 () Bool)

(assert (=> b!183830 (= res!87004 (not e!121022))))

(declare-fun res!87000 () Bool)

(assert (=> b!183830 (=> (not res!87000) (not e!121022))))

(assert (=> b!183830 (= res!87000 (bvslt #b00000000000000000000000000000000 (size!4002 (_keys!5677 thiss!1248))))))

(declare-fun b!183831 () Bool)

(assert (=> b!183831 (= e!121015 (= (apply!160 lt!90905 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3596 thiss!1248)))))

(declare-fun b!183832 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!183832 (= e!121022 (validKeyInArray!0 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183833 () Bool)

(declare-fun c!32949 () Bool)

(assert (=> b!183833 (= c!32949 (and (not (= (bvand (extraKeys!3492 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3492 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!121018 () ListLongMap!2341)

(assert (=> b!183833 (= e!121018 e!121014)))

(declare-fun b!183834 () Bool)

(assert (=> b!183834 (= e!121018 call!18556)))

(declare-fun b!183835 () Bool)

(assert (=> b!183835 (= e!121024 e!121023)))

(declare-fun res!87005 () Bool)

(assert (=> b!183835 (=> (not res!87005) (not e!121023))))

(assert (=> b!183835 (= res!87005 (contains!1274 lt!90905 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183835 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4002 (_keys!5677 thiss!1248))))))

(declare-fun bm!18558 () Bool)

(assert (=> bm!18558 (= call!18557 call!18561)))

(declare-fun b!183836 () Bool)

(declare-fun e!121016 () Bool)

(assert (=> b!183836 (= e!121016 (validKeyInArray!0 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183837 () Bool)

(assert (=> b!183837 (= e!121017 e!121018)))

(declare-fun c!32950 () Bool)

(assert (=> b!183837 (= c!32950 (and (not (= (bvand (extraKeys!3492 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3492 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18559 () Bool)

(declare-fun c!32952 () Bool)

(assert (=> bm!18559 (= call!18559 (+!280 (ite c!32952 call!18561 (ite c!32950 call!18557 call!18558)) (ite (or c!32952 c!32950) (tuple2!3425 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3596 thiss!1248)) (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248)))))))

(declare-fun b!183838 () Bool)

(assert (=> b!183838 (= e!121013 (not call!18562))))

(declare-fun b!183839 () Bool)

(assert (=> b!183839 (= e!121013 e!121021)))

(declare-fun res!87008 () Bool)

(assert (=> b!183839 (= res!87008 call!18562)))

(assert (=> b!183839 (=> (not res!87008) (not e!121021))))

(declare-fun b!183825 () Bool)

(assert (=> b!183825 (= e!121014 call!18556)))

(declare-fun d!54801 () Bool)

(assert (=> d!54801 e!121012))

(declare-fun res!87002 () Bool)

(assert (=> d!54801 (=> (not res!87002) (not e!121012))))

(assert (=> d!54801 (= res!87002 (or (bvsge #b00000000000000000000000000000000 (size!4002 (_keys!5677 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4002 (_keys!5677 thiss!1248))))))))

(declare-fun lt!90902 () ListLongMap!2341)

(assert (=> d!54801 (= lt!90905 lt!90902)))

(declare-fun lt!90906 () Unit!5556)

(assert (=> d!54801 (= lt!90906 e!121019)))

(declare-fun c!32951 () Bool)

(assert (=> d!54801 (= c!32951 e!121016)))

(declare-fun res!87006 () Bool)

(assert (=> d!54801 (=> (not res!87006) (not e!121016))))

(assert (=> d!54801 (= res!87006 (bvslt #b00000000000000000000000000000000 (size!4002 (_keys!5677 thiss!1248))))))

(assert (=> d!54801 (= lt!90902 e!121017)))

(assert (=> d!54801 (= c!32952 (and (not (= (bvand (extraKeys!3492 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3492 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54801 (validMask!0 (mask!8825 thiss!1248))))

(assert (=> d!54801 (= (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248)) lt!90905)))

(assert (= (and d!54801 c!32952) b!183823))

(assert (= (and d!54801 (not c!32952)) b!183837))

(assert (= (and b!183837 c!32950) b!183834))

(assert (= (and b!183837 (not c!32950)) b!183833))

(assert (= (and b!183833 c!32949) b!183825))

(assert (= (and b!183833 (not c!32949)) b!183822))

(assert (= (or b!183825 b!183822) bm!18555))

(assert (= (or b!183834 bm!18555) bm!18558))

(assert (= (or b!183834 b!183825) bm!18553))

(assert (= (or b!183823 bm!18558) bm!18556))

(assert (= (or b!183823 bm!18553) bm!18559))

(assert (= (and d!54801 res!87006) b!183836))

(assert (= (and d!54801 c!32951) b!183820))

(assert (= (and d!54801 (not c!32951)) b!183821))

(assert (= (and d!54801 res!87002) b!183830))

(assert (= (and b!183830 res!87000) b!183832))

(assert (= (and b!183830 (not res!87004)) b!183835))

(assert (= (and b!183835 res!87005) b!183819))

(assert (= (and b!183830 res!87007) b!183826))

(assert (= (and b!183826 c!32953) b!183839))

(assert (= (and b!183826 (not c!32953)) b!183838))

(assert (= (and b!183839 res!87008) b!183827))

(assert (= (or b!183839 b!183838) bm!18557))

(assert (= (and b!183826 res!87001) b!183824))

(assert (= (and b!183824 c!32948) b!183828))

(assert (= (and b!183824 (not c!32948)) b!183829))

(assert (= (and b!183828 res!87003) b!183831))

(assert (= (or b!183828 b!183829) bm!18554))

(declare-fun b_lambda!7203 () Bool)

(assert (=> (not b_lambda!7203) (not b!183819)))

(declare-fun t!7212 () Bool)

(declare-fun tb!2831 () Bool)

(assert (=> (and b!183730 (= (defaultEntry!3755 thiss!1248) (defaultEntry!3755 thiss!1248)) t!7212) tb!2831))

(declare-fun result!4771 () Bool)

(assert (=> tb!2831 (= result!4771 tp_is_empty!4305)))

(assert (=> b!183819 t!7212))

(declare-fun b_and!11113 () Bool)

(assert (= b_and!11109 (and (=> t!7212 result!4771) b_and!11113)))

(declare-fun m!211251 () Bool)

(assert (=> b!183823 m!211251))

(declare-fun m!211253 () Bool)

(assert (=> bm!18554 m!211253))

(declare-fun m!211255 () Bool)

(assert (=> b!183820 m!211255))

(declare-fun m!211257 () Bool)

(assert (=> b!183820 m!211257))

(declare-fun m!211259 () Bool)

(assert (=> b!183820 m!211259))

(declare-fun m!211261 () Bool)

(assert (=> b!183820 m!211261))

(declare-fun m!211263 () Bool)

(assert (=> b!183820 m!211263))

(assert (=> b!183820 m!211261))

(assert (=> b!183820 m!211259))

(declare-fun m!211265 () Bool)

(assert (=> b!183820 m!211265))

(declare-fun m!211267 () Bool)

(assert (=> b!183820 m!211267))

(declare-fun m!211269 () Bool)

(assert (=> b!183820 m!211269))

(declare-fun m!211271 () Bool)

(assert (=> b!183820 m!211271))

(declare-fun m!211273 () Bool)

(assert (=> b!183820 m!211273))

(declare-fun m!211275 () Bool)

(assert (=> b!183820 m!211275))

(assert (=> b!183820 m!211269))

(declare-fun m!211277 () Bool)

(assert (=> b!183820 m!211277))

(declare-fun m!211279 () Bool)

(assert (=> b!183820 m!211279))

(declare-fun m!211281 () Bool)

(assert (=> b!183820 m!211281))

(declare-fun m!211283 () Bool)

(assert (=> b!183820 m!211283))

(assert (=> b!183820 m!211271))

(declare-fun m!211285 () Bool)

(assert (=> b!183820 m!211285))

(declare-fun m!211287 () Bool)

(assert (=> b!183820 m!211287))

(assert (=> b!183835 m!211257))

(assert (=> b!183835 m!211257))

(declare-fun m!211289 () Bool)

(assert (=> b!183835 m!211289))

(assert (=> b!183836 m!211257))

(assert (=> b!183836 m!211257))

(declare-fun m!211291 () Bool)

(assert (=> b!183836 m!211291))

(assert (=> b!183832 m!211257))

(assert (=> b!183832 m!211257))

(assert (=> b!183832 m!211291))

(assert (=> bm!18556 m!211255))

(declare-fun m!211293 () Bool)

(assert (=> bm!18559 m!211293))

(assert (=> d!54801 m!211207))

(declare-fun m!211295 () Bool)

(assert (=> bm!18557 m!211295))

(declare-fun m!211297 () Bool)

(assert (=> b!183831 m!211297))

(declare-fun m!211299 () Bool)

(assert (=> b!183819 m!211299))

(declare-fun m!211301 () Bool)

(assert (=> b!183819 m!211301))

(declare-fun m!211303 () Bool)

(assert (=> b!183819 m!211303))

(assert (=> b!183819 m!211257))

(declare-fun m!211305 () Bool)

(assert (=> b!183819 m!211305))

(assert (=> b!183819 m!211299))

(assert (=> b!183819 m!211257))

(assert (=> b!183819 m!211301))

(declare-fun m!211307 () Bool)

(assert (=> b!183827 m!211307))

(assert (=> b!183725 d!54801))

(declare-fun b!183854 () Bool)

(declare-fun e!121031 () SeekEntryResult!622)

(declare-fun lt!90918 () SeekEntryResult!622)

(assert (=> b!183854 (= e!121031 (Found!622 (index!4660 lt!90918)))))

(declare-fun e!121032 () SeekEntryResult!622)

(declare-fun b!183855 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7805 (_ BitVec 32)) SeekEntryResult!622)

(assert (=> b!183855 (= e!121032 (seekKeyOrZeroReturnVacant!0 (x!20002 lt!90918) (index!4660 lt!90918) (index!4660 lt!90918) key!828 (_keys!5677 thiss!1248) (mask!8825 thiss!1248)))))

(declare-fun b!183856 () Bool)

(declare-fun e!121033 () SeekEntryResult!622)

(assert (=> b!183856 (= e!121033 e!121031)))

(declare-fun lt!90917 () (_ BitVec 64))

(assert (=> b!183856 (= lt!90917 (select (arr!3689 (_keys!5677 thiss!1248)) (index!4660 lt!90918)))))

(declare-fun c!32960 () Bool)

(assert (=> b!183856 (= c!32960 (= lt!90917 key!828))))

(declare-fun d!54803 () Bool)

(declare-fun lt!90916 () SeekEntryResult!622)

(assert (=> d!54803 (and (or ((_ is Undefined!622) lt!90916) (not ((_ is Found!622) lt!90916)) (and (bvsge (index!4659 lt!90916) #b00000000000000000000000000000000) (bvslt (index!4659 lt!90916) (size!4002 (_keys!5677 thiss!1248))))) (or ((_ is Undefined!622) lt!90916) ((_ is Found!622) lt!90916) (not ((_ is MissingZero!622) lt!90916)) (and (bvsge (index!4658 lt!90916) #b00000000000000000000000000000000) (bvslt (index!4658 lt!90916) (size!4002 (_keys!5677 thiss!1248))))) (or ((_ is Undefined!622) lt!90916) ((_ is Found!622) lt!90916) ((_ is MissingZero!622) lt!90916) (not ((_ is MissingVacant!622) lt!90916)) (and (bvsge (index!4661 lt!90916) #b00000000000000000000000000000000) (bvslt (index!4661 lt!90916) (size!4002 (_keys!5677 thiss!1248))))) (or ((_ is Undefined!622) lt!90916) (ite ((_ is Found!622) lt!90916) (= (select (arr!3689 (_keys!5677 thiss!1248)) (index!4659 lt!90916)) key!828) (ite ((_ is MissingZero!622) lt!90916) (= (select (arr!3689 (_keys!5677 thiss!1248)) (index!4658 lt!90916)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!622) lt!90916) (= (select (arr!3689 (_keys!5677 thiss!1248)) (index!4661 lt!90916)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54803 (= lt!90916 e!121033)))

(declare-fun c!32962 () Bool)

(assert (=> d!54803 (= c!32962 (and ((_ is Intermediate!622) lt!90918) (undefined!1434 lt!90918)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7805 (_ BitVec 32)) SeekEntryResult!622)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54803 (= lt!90918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8825 thiss!1248)) key!828 (_keys!5677 thiss!1248) (mask!8825 thiss!1248)))))

(assert (=> d!54803 (validMask!0 (mask!8825 thiss!1248))))

(assert (=> d!54803 (= (seekEntryOrOpen!0 key!828 (_keys!5677 thiss!1248) (mask!8825 thiss!1248)) lt!90916)))

(declare-fun b!183857 () Bool)

(assert (=> b!183857 (= e!121033 Undefined!622)))

(declare-fun b!183858 () Bool)

(assert (=> b!183858 (= e!121032 (MissingZero!622 (index!4660 lt!90918)))))

(declare-fun b!183859 () Bool)

(declare-fun c!32961 () Bool)

(assert (=> b!183859 (= c!32961 (= lt!90917 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183859 (= e!121031 e!121032)))

(assert (= (and d!54803 c!32962) b!183857))

(assert (= (and d!54803 (not c!32962)) b!183856))

(assert (= (and b!183856 c!32960) b!183854))

(assert (= (and b!183856 (not c!32960)) b!183859))

(assert (= (and b!183859 c!32961) b!183858))

(assert (= (and b!183859 (not c!32961)) b!183855))

(declare-fun m!211309 () Bool)

(assert (=> b!183855 m!211309))

(declare-fun m!211311 () Bool)

(assert (=> b!183856 m!211311))

(declare-fun m!211313 () Bool)

(assert (=> d!54803 m!211313))

(assert (=> d!54803 m!211207))

(declare-fun m!211315 () Bool)

(assert (=> d!54803 m!211315))

(declare-fun m!211317 () Bool)

(assert (=> d!54803 m!211317))

(assert (=> d!54803 m!211313))

(declare-fun m!211319 () Bool)

(assert (=> d!54803 m!211319))

(declare-fun m!211321 () Bool)

(assert (=> d!54803 m!211321))

(assert (=> b!183729 d!54803))

(declare-fun d!54805 () Bool)

(assert (=> d!54805 (= (validMask!0 (mask!8825 thiss!1248)) (and (or (= (mask!8825 thiss!1248) #b00000000000000000000000000000111) (= (mask!8825 thiss!1248) #b00000000000000000000000000001111) (= (mask!8825 thiss!1248) #b00000000000000000000000000011111) (= (mask!8825 thiss!1248) #b00000000000000000000000000111111) (= (mask!8825 thiss!1248) #b00000000000000000000000001111111) (= (mask!8825 thiss!1248) #b00000000000000000000000011111111) (= (mask!8825 thiss!1248) #b00000000000000000000000111111111) (= (mask!8825 thiss!1248) #b00000000000000000000001111111111) (= (mask!8825 thiss!1248) #b00000000000000000000011111111111) (= (mask!8825 thiss!1248) #b00000000000000000000111111111111) (= (mask!8825 thiss!1248) #b00000000000000000001111111111111) (= (mask!8825 thiss!1248) #b00000000000000000011111111111111) (= (mask!8825 thiss!1248) #b00000000000000000111111111111111) (= (mask!8825 thiss!1248) #b00000000000000001111111111111111) (= (mask!8825 thiss!1248) #b00000000000000011111111111111111) (= (mask!8825 thiss!1248) #b00000000000000111111111111111111) (= (mask!8825 thiss!1248) #b00000000000001111111111111111111) (= (mask!8825 thiss!1248) #b00000000000011111111111111111111) (= (mask!8825 thiss!1248) #b00000000000111111111111111111111) (= (mask!8825 thiss!1248) #b00000000001111111111111111111111) (= (mask!8825 thiss!1248) #b00000000011111111111111111111111) (= (mask!8825 thiss!1248) #b00000000111111111111111111111111) (= (mask!8825 thiss!1248) #b00000001111111111111111111111111) (= (mask!8825 thiss!1248) #b00000011111111111111111111111111) (= (mask!8825 thiss!1248) #b00000111111111111111111111111111) (= (mask!8825 thiss!1248) #b00001111111111111111111111111111) (= (mask!8825 thiss!1248) #b00011111111111111111111111111111) (= (mask!8825 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8825 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!183723 d!54805))

(declare-fun b!183866 () Bool)

(declare-fun e!121039 () Bool)

(assert (=> b!183866 (= e!121039 tp_is_empty!4305)))

(declare-fun b!183867 () Bool)

(declare-fun e!121038 () Bool)

(assert (=> b!183867 (= e!121038 tp_is_empty!4305)))

(declare-fun mapNonEmpty!7401 () Bool)

(declare-fun mapRes!7401 () Bool)

(declare-fun tp!16383 () Bool)

(assert (=> mapNonEmpty!7401 (= mapRes!7401 (and tp!16383 e!121039))))

(declare-fun mapRest!7401 () (Array (_ BitVec 32) ValueCell!1809))

(declare-fun mapKey!7401 () (_ BitVec 32))

(declare-fun mapValue!7401 () ValueCell!1809)

(assert (=> mapNonEmpty!7401 (= mapRest!7395 (store mapRest!7401 mapKey!7401 mapValue!7401))))

(declare-fun mapIsEmpty!7401 () Bool)

(assert (=> mapIsEmpty!7401 mapRes!7401))

(declare-fun condMapEmpty!7401 () Bool)

(declare-fun mapDefault!7401 () ValueCell!1809)

(assert (=> mapNonEmpty!7395 (= condMapEmpty!7401 (= mapRest!7395 ((as const (Array (_ BitVec 32) ValueCell!1809)) mapDefault!7401)))))

(assert (=> mapNonEmpty!7395 (= tp!16374 (and e!121038 mapRes!7401))))

(assert (= (and mapNonEmpty!7395 condMapEmpty!7401) mapIsEmpty!7401))

(assert (= (and mapNonEmpty!7395 (not condMapEmpty!7401)) mapNonEmpty!7401))

(assert (= (and mapNonEmpty!7401 ((_ is ValueCellFull!1809) mapValue!7401)) b!183866))

(assert (= (and mapNonEmpty!7395 ((_ is ValueCellFull!1809) mapDefault!7401)) b!183867))

(declare-fun m!211323 () Bool)

(assert (=> mapNonEmpty!7401 m!211323))

(declare-fun b_lambda!7205 () Bool)

(assert (= b_lambda!7203 (or (and b!183730 b_free!4533) b_lambda!7205)))

(check-sat (not b!183767) (not b_lambda!7205) (not bm!18559) (not bm!18554) (not d!54801) (not b!183827) (not b_next!4533) (not d!54803) (not bm!18557) (not b!183765) (not d!54799) (not b!183823) (not b!183819) (not b!183820) (not b!183835) (not b!183855) (not mapNonEmpty!7401) (not b!183831) (not d!54793) tp_is_empty!4305 (not b!183766) (not b!183776) (not bm!18556) (not b!183774) (not b!183836) b_and!11113 (not b!183832))
(check-sat b_and!11113 (not b_next!4533))
(get-model)

(declare-fun d!54807 () Bool)

(declare-fun e!121042 () Bool)

(assert (=> d!54807 e!121042))

(declare-fun res!87013 () Bool)

(assert (=> d!54807 (=> (not res!87013) (not e!121042))))

(declare-fun lt!90927 () ListLongMap!2341)

(assert (=> d!54807 (= res!87013 (contains!1274 lt!90927 (_1!1723 (ite (or c!32952 c!32950) (tuple2!3425 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3596 thiss!1248)) (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248))))))))

(declare-fun lt!90928 () List!2340)

(assert (=> d!54807 (= lt!90927 (ListLongMap!2342 lt!90928))))

(declare-fun lt!90929 () Unit!5556)

(declare-fun lt!90930 () Unit!5556)

(assert (=> d!54807 (= lt!90929 lt!90930)))

(assert (=> d!54807 (= (getValueByKey!217 lt!90928 (_1!1723 (ite (or c!32952 c!32950) (tuple2!3425 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3596 thiss!1248)) (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248))))) (Some!222 (_2!1723 (ite (or c!32952 c!32950) (tuple2!3425 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3596 thiss!1248)) (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!114 (List!2340 (_ BitVec 64) V!5387) Unit!5556)

(assert (=> d!54807 (= lt!90930 (lemmaContainsTupThenGetReturnValue!114 lt!90928 (_1!1723 (ite (or c!32952 c!32950) (tuple2!3425 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3596 thiss!1248)) (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248)))) (_2!1723 (ite (or c!32952 c!32950) (tuple2!3425 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3596 thiss!1248)) (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248))))))))

(declare-fun insertStrictlySorted!117 (List!2340 (_ BitVec 64) V!5387) List!2340)

(assert (=> d!54807 (= lt!90928 (insertStrictlySorted!117 (toList!1186 (ite c!32952 call!18561 (ite c!32950 call!18557 call!18558))) (_1!1723 (ite (or c!32952 c!32950) (tuple2!3425 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3596 thiss!1248)) (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248)))) (_2!1723 (ite (or c!32952 c!32950) (tuple2!3425 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3596 thiss!1248)) (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248))))))))

(assert (=> d!54807 (= (+!280 (ite c!32952 call!18561 (ite c!32950 call!18557 call!18558)) (ite (or c!32952 c!32950) (tuple2!3425 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3596 thiss!1248)) (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248)))) lt!90927)))

(declare-fun b!183872 () Bool)

(declare-fun res!87014 () Bool)

(assert (=> b!183872 (=> (not res!87014) (not e!121042))))

(assert (=> b!183872 (= res!87014 (= (getValueByKey!217 (toList!1186 lt!90927) (_1!1723 (ite (or c!32952 c!32950) (tuple2!3425 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3596 thiss!1248)) (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248))))) (Some!222 (_2!1723 (ite (or c!32952 c!32950) (tuple2!3425 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3596 thiss!1248)) (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248)))))))))

(declare-fun b!183873 () Bool)

(declare-fun contains!1275 (List!2340 tuple2!3424) Bool)

(assert (=> b!183873 (= e!121042 (contains!1275 (toList!1186 lt!90927) (ite (or c!32952 c!32950) (tuple2!3425 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3596 thiss!1248)) (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248)))))))

(assert (= (and d!54807 res!87013) b!183872))

(assert (= (and b!183872 res!87014) b!183873))

(declare-fun m!211325 () Bool)

(assert (=> d!54807 m!211325))

(declare-fun m!211327 () Bool)

(assert (=> d!54807 m!211327))

(declare-fun m!211329 () Bool)

(assert (=> d!54807 m!211329))

(declare-fun m!211331 () Bool)

(assert (=> d!54807 m!211331))

(declare-fun m!211333 () Bool)

(assert (=> b!183872 m!211333))

(declare-fun m!211335 () Bool)

(assert (=> b!183873 m!211335))

(assert (=> bm!18559 d!54807))

(declare-fun b!183882 () Bool)

(declare-fun e!121049 () Bool)

(declare-fun e!121051 () Bool)

(assert (=> b!183882 (= e!121049 e!121051)))

(declare-fun lt!90938 () (_ BitVec 64))

(assert (=> b!183882 (= lt!90938 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90939 () Unit!5556)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7805 (_ BitVec 64) (_ BitVec 32)) Unit!5556)

(assert (=> b!183882 (= lt!90939 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5677 thiss!1248) lt!90938 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!183882 (arrayContainsKey!0 (_keys!5677 thiss!1248) lt!90938 #b00000000000000000000000000000000)))

(declare-fun lt!90937 () Unit!5556)

(assert (=> b!183882 (= lt!90937 lt!90939)))

(declare-fun res!87020 () Bool)

(assert (=> b!183882 (= res!87020 (= (seekEntryOrOpen!0 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000) (_keys!5677 thiss!1248) (mask!8825 thiss!1248)) (Found!622 #b00000000000000000000000000000000)))))

(assert (=> b!183882 (=> (not res!87020) (not e!121051))))

(declare-fun bm!18562 () Bool)

(declare-fun call!18565 () Bool)

(assert (=> bm!18562 (= call!18565 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5677 thiss!1248) (mask!8825 thiss!1248)))))

(declare-fun b!183883 () Bool)

(assert (=> b!183883 (= e!121051 call!18565)))

(declare-fun d!54809 () Bool)

(declare-fun res!87019 () Bool)

(declare-fun e!121050 () Bool)

(assert (=> d!54809 (=> res!87019 e!121050)))

(assert (=> d!54809 (= res!87019 (bvsge #b00000000000000000000000000000000 (size!4002 (_keys!5677 thiss!1248))))))

(assert (=> d!54809 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5677 thiss!1248) (mask!8825 thiss!1248)) e!121050)))

(declare-fun b!183884 () Bool)

(assert (=> b!183884 (= e!121050 e!121049)))

(declare-fun c!32965 () Bool)

(assert (=> b!183884 (= c!32965 (validKeyInArray!0 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183885 () Bool)

(assert (=> b!183885 (= e!121049 call!18565)))

(assert (= (and d!54809 (not res!87019)) b!183884))

(assert (= (and b!183884 c!32965) b!183882))

(assert (= (and b!183884 (not c!32965)) b!183885))

(assert (= (and b!183882 res!87020) b!183883))

(assert (= (or b!183883 b!183885) bm!18562))

(assert (=> b!183882 m!211257))

(declare-fun m!211337 () Bool)

(assert (=> b!183882 m!211337))

(declare-fun m!211339 () Bool)

(assert (=> b!183882 m!211339))

(assert (=> b!183882 m!211257))

(declare-fun m!211341 () Bool)

(assert (=> b!183882 m!211341))

(declare-fun m!211343 () Bool)

(assert (=> bm!18562 m!211343))

(assert (=> b!183884 m!211257))

(assert (=> b!183884 m!211257))

(assert (=> b!183884 m!211291))

(assert (=> b!183766 d!54809))

(declare-fun d!54811 () Bool)

(declare-fun e!121053 () Bool)

(assert (=> d!54811 e!121053))

(declare-fun res!87021 () Bool)

(assert (=> d!54811 (=> res!87021 e!121053)))

(declare-fun lt!90942 () Bool)

(assert (=> d!54811 (= res!87021 (not lt!90942))))

(declare-fun lt!90940 () Bool)

(assert (=> d!54811 (= lt!90942 lt!90940)))

(declare-fun lt!90943 () Unit!5556)

(declare-fun e!121052 () Unit!5556)

(assert (=> d!54811 (= lt!90943 e!121052)))

(declare-fun c!32966 () Bool)

(assert (=> d!54811 (= c!32966 lt!90940)))

(assert (=> d!54811 (= lt!90940 (containsKey!221 (toList!1186 lt!90905) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54811 (= (contains!1274 lt!90905 #b0000000000000000000000000000000000000000000000000000000000000000) lt!90942)))

(declare-fun b!183886 () Bool)

(declare-fun lt!90941 () Unit!5556)

(assert (=> b!183886 (= e!121052 lt!90941)))

(assert (=> b!183886 (= lt!90941 (lemmaContainsKeyImpliesGetValueByKeyDefined!169 (toList!1186 lt!90905) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183886 (isDefined!170 (getValueByKey!217 (toList!1186 lt!90905) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183887 () Bool)

(declare-fun Unit!5560 () Unit!5556)

(assert (=> b!183887 (= e!121052 Unit!5560)))

(declare-fun b!183888 () Bool)

(assert (=> b!183888 (= e!121053 (isDefined!170 (getValueByKey!217 (toList!1186 lt!90905) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54811 c!32966) b!183886))

(assert (= (and d!54811 (not c!32966)) b!183887))

(assert (= (and d!54811 (not res!87021)) b!183888))

(declare-fun m!211345 () Bool)

(assert (=> d!54811 m!211345))

(declare-fun m!211347 () Bool)

(assert (=> b!183886 m!211347))

(declare-fun m!211349 () Bool)

(assert (=> b!183886 m!211349))

(assert (=> b!183886 m!211349))

(declare-fun m!211351 () Bool)

(assert (=> b!183886 m!211351))

(assert (=> b!183888 m!211349))

(assert (=> b!183888 m!211349))

(assert (=> b!183888 m!211351))

(assert (=> bm!18557 d!54811))

(declare-fun b!183899 () Bool)

(declare-fun e!121064 () Bool)

(declare-fun call!18568 () Bool)

(assert (=> b!183899 (= e!121064 call!18568)))

(declare-fun b!183900 () Bool)

(declare-fun e!121062 () Bool)

(assert (=> b!183900 (= e!121062 e!121064)))

(declare-fun c!32969 () Bool)

(assert (=> b!183900 (= c!32969 (validKeyInArray!0 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183901 () Bool)

(declare-fun e!121065 () Bool)

(declare-fun contains!1276 (List!2341 (_ BitVec 64)) Bool)

(assert (=> b!183901 (= e!121065 (contains!1276 Nil!2338 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183902 () Bool)

(declare-fun e!121063 () Bool)

(assert (=> b!183902 (= e!121063 e!121062)))

(declare-fun res!87030 () Bool)

(assert (=> b!183902 (=> (not res!87030) (not e!121062))))

(assert (=> b!183902 (= res!87030 (not e!121065))))

(declare-fun res!87029 () Bool)

(assert (=> b!183902 (=> (not res!87029) (not e!121065))))

(assert (=> b!183902 (= res!87029 (validKeyInArray!0 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18565 () Bool)

(assert (=> bm!18565 (= call!18568 (arrayNoDuplicates!0 (_keys!5677 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32969 (Cons!2337 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000) Nil!2338) Nil!2338)))))

(declare-fun b!183903 () Bool)

(assert (=> b!183903 (= e!121064 call!18568)))

(declare-fun d!54813 () Bool)

(declare-fun res!87028 () Bool)

(assert (=> d!54813 (=> res!87028 e!121063)))

(assert (=> d!54813 (= res!87028 (bvsge #b00000000000000000000000000000000 (size!4002 (_keys!5677 thiss!1248))))))

(assert (=> d!54813 (= (arrayNoDuplicates!0 (_keys!5677 thiss!1248) #b00000000000000000000000000000000 Nil!2338) e!121063)))

(assert (= (and d!54813 (not res!87028)) b!183902))

(assert (= (and b!183902 res!87029) b!183901))

(assert (= (and b!183902 res!87030) b!183900))

(assert (= (and b!183900 c!32969) b!183903))

(assert (= (and b!183900 (not c!32969)) b!183899))

(assert (= (or b!183903 b!183899) bm!18565))

(assert (=> b!183900 m!211257))

(assert (=> b!183900 m!211257))

(assert (=> b!183900 m!211291))

(assert (=> b!183901 m!211257))

(assert (=> b!183901 m!211257))

(declare-fun m!211353 () Bool)

(assert (=> b!183901 m!211353))

(assert (=> b!183902 m!211257))

(assert (=> b!183902 m!211257))

(assert (=> b!183902 m!211291))

(assert (=> bm!18565 m!211257))

(declare-fun m!211355 () Bool)

(assert (=> bm!18565 m!211355))

(assert (=> b!183767 d!54813))

(declare-fun b!183912 () Bool)

(declare-fun e!121071 () (_ BitVec 32))

(declare-fun call!18571 () (_ BitVec 32))

(assert (=> b!183912 (= e!121071 (bvadd #b00000000000000000000000000000001 call!18571))))

(declare-fun d!54815 () Bool)

(declare-fun lt!90946 () (_ BitVec 32))

(assert (=> d!54815 (and (bvsge lt!90946 #b00000000000000000000000000000000) (bvsle lt!90946 (bvsub (size!4002 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!121070 () (_ BitVec 32))

(assert (=> d!54815 (= lt!90946 e!121070)))

(declare-fun c!32974 () Bool)

(assert (=> d!54815 (= c!32974 (bvsge #b00000000000000000000000000000000 (size!4002 (_keys!5677 thiss!1248))))))

(assert (=> d!54815 (and (bvsle #b00000000000000000000000000000000 (size!4002 (_keys!5677 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4002 (_keys!5677 thiss!1248)) (size!4002 (_keys!5677 thiss!1248))))))

(assert (=> d!54815 (= (arrayCountValidKeys!0 (_keys!5677 thiss!1248) #b00000000000000000000000000000000 (size!4002 (_keys!5677 thiss!1248))) lt!90946)))

(declare-fun bm!18568 () Bool)

(assert (=> bm!18568 (= call!18571 (arrayCountValidKeys!0 (_keys!5677 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4002 (_keys!5677 thiss!1248))))))

(declare-fun b!183913 () Bool)

(assert (=> b!183913 (= e!121070 e!121071)))

(declare-fun c!32975 () Bool)

(assert (=> b!183913 (= c!32975 (validKeyInArray!0 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183914 () Bool)

(assert (=> b!183914 (= e!121070 #b00000000000000000000000000000000)))

(declare-fun b!183915 () Bool)

(assert (=> b!183915 (= e!121071 call!18571)))

(assert (= (and d!54815 c!32974) b!183914))

(assert (= (and d!54815 (not c!32974)) b!183913))

(assert (= (and b!183913 c!32975) b!183912))

(assert (= (and b!183913 (not c!32975)) b!183915))

(assert (= (or b!183912 b!183915) bm!18568))

(declare-fun m!211357 () Bool)

(assert (=> bm!18568 m!211357))

(assert (=> b!183913 m!211257))

(assert (=> b!183913 m!211257))

(assert (=> b!183913 m!211291))

(assert (=> b!183765 d!54815))

(declare-fun d!54817 () Bool)

(declare-fun e!121073 () Bool)

(assert (=> d!54817 e!121073))

(declare-fun res!87031 () Bool)

(assert (=> d!54817 (=> res!87031 e!121073)))

(declare-fun lt!90949 () Bool)

(assert (=> d!54817 (= res!87031 (not lt!90949))))

(declare-fun lt!90947 () Bool)

(assert (=> d!54817 (= lt!90949 lt!90947)))

(declare-fun lt!90950 () Unit!5556)

(declare-fun e!121072 () Unit!5556)

(assert (=> d!54817 (= lt!90950 e!121072)))

(declare-fun c!32976 () Bool)

(assert (=> d!54817 (= c!32976 lt!90947)))

(assert (=> d!54817 (= lt!90947 (containsKey!221 (toList!1186 lt!90905) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54817 (= (contains!1274 lt!90905 #b1000000000000000000000000000000000000000000000000000000000000000) lt!90949)))

(declare-fun b!183916 () Bool)

(declare-fun lt!90948 () Unit!5556)

(assert (=> b!183916 (= e!121072 lt!90948)))

(assert (=> b!183916 (= lt!90948 (lemmaContainsKeyImpliesGetValueByKeyDefined!169 (toList!1186 lt!90905) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183916 (isDefined!170 (getValueByKey!217 (toList!1186 lt!90905) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183917 () Bool)

(declare-fun Unit!5561 () Unit!5556)

(assert (=> b!183917 (= e!121072 Unit!5561)))

(declare-fun b!183918 () Bool)

(assert (=> b!183918 (= e!121073 (isDefined!170 (getValueByKey!217 (toList!1186 lt!90905) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54817 c!32976) b!183916))

(assert (= (and d!54817 (not c!32976)) b!183917))

(assert (= (and d!54817 (not res!87031)) b!183918))

(declare-fun m!211359 () Bool)

(assert (=> d!54817 m!211359))

(declare-fun m!211361 () Bool)

(assert (=> b!183916 m!211361))

(declare-fun m!211363 () Bool)

(assert (=> b!183916 m!211363))

(assert (=> b!183916 m!211363))

(declare-fun m!211365 () Bool)

(assert (=> b!183916 m!211365))

(assert (=> b!183918 m!211363))

(assert (=> b!183918 m!211363))

(assert (=> b!183918 m!211365))

(assert (=> bm!18554 d!54817))

(declare-fun b!183943 () Bool)

(declare-fun e!121088 () ListLongMap!2341)

(declare-fun e!121093 () ListLongMap!2341)

(assert (=> b!183943 (= e!121088 e!121093)))

(declare-fun c!32986 () Bool)

(assert (=> b!183943 (= c!32986 (validKeyInArray!0 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183944 () Bool)

(declare-fun e!121090 () Bool)

(declare-fun e!121094 () Bool)

(assert (=> b!183944 (= e!121090 e!121094)))

(declare-fun c!32987 () Bool)

(assert (=> b!183944 (= c!32987 (bvslt #b00000000000000000000000000000000 (size!4002 (_keys!5677 thiss!1248))))))

(declare-fun b!183945 () Bool)

(declare-fun e!121091 () Bool)

(assert (=> b!183945 (= e!121090 e!121091)))

(assert (=> b!183945 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4002 (_keys!5677 thiss!1248))))))

(declare-fun res!87042 () Bool)

(declare-fun lt!90969 () ListLongMap!2341)

(assert (=> b!183945 (= res!87042 (contains!1274 lt!90969 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183945 (=> (not res!87042) (not e!121091))))

(declare-fun b!183947 () Bool)

(assert (=> b!183947 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4002 (_keys!5677 thiss!1248))))))

(assert (=> b!183947 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4003 (_values!3738 thiss!1248))))))

(assert (=> b!183947 (= e!121091 (= (apply!160 lt!90969 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000)) (get!2114 (select (arr!3690 (_values!3738 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!503 (defaultEntry!3755 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!183948 () Bool)

(declare-fun call!18574 () ListLongMap!2341)

(assert (=> b!183948 (= e!121093 call!18574)))

(declare-fun b!183949 () Bool)

(declare-fun res!87041 () Bool)

(declare-fun e!121092 () Bool)

(assert (=> b!183949 (=> (not res!87041) (not e!121092))))

(assert (=> b!183949 (= res!87041 (not (contains!1274 lt!90969 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183950 () Bool)

(assert (=> b!183950 (= e!121088 (ListLongMap!2342 Nil!2337))))

(declare-fun b!183951 () Bool)

(declare-fun isEmpty!465 (ListLongMap!2341) Bool)

(assert (=> b!183951 (= e!121094 (isEmpty!465 lt!90969))))

(declare-fun b!183946 () Bool)

(declare-fun e!121089 () Bool)

(assert (=> b!183946 (= e!121089 (validKeyInArray!0 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183946 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!54819 () Bool)

(assert (=> d!54819 e!121092))

(declare-fun res!87043 () Bool)

(assert (=> d!54819 (=> (not res!87043) (not e!121092))))

(assert (=> d!54819 (= res!87043 (not (contains!1274 lt!90969 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54819 (= lt!90969 e!121088)))

(declare-fun c!32985 () Bool)

(assert (=> d!54819 (= c!32985 (bvsge #b00000000000000000000000000000000 (size!4002 (_keys!5677 thiss!1248))))))

(assert (=> d!54819 (validMask!0 (mask!8825 thiss!1248))))

(assert (=> d!54819 (= (getCurrentListMapNoExtraKeys!193 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248)) lt!90969)))

(declare-fun b!183952 () Bool)

(declare-fun lt!90971 () Unit!5556)

(declare-fun lt!90970 () Unit!5556)

(assert (=> b!183952 (= lt!90971 lt!90970)))

(declare-fun lt!90966 () V!5387)

(declare-fun lt!90967 () (_ BitVec 64))

(declare-fun lt!90968 () (_ BitVec 64))

(declare-fun lt!90965 () ListLongMap!2341)

(assert (=> b!183952 (not (contains!1274 (+!280 lt!90965 (tuple2!3425 lt!90968 lt!90966)) lt!90967))))

(declare-fun addStillNotContains!86 (ListLongMap!2341 (_ BitVec 64) V!5387 (_ BitVec 64)) Unit!5556)

(assert (=> b!183952 (= lt!90970 (addStillNotContains!86 lt!90965 lt!90968 lt!90966 lt!90967))))

(assert (=> b!183952 (= lt!90967 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!183952 (= lt!90966 (get!2114 (select (arr!3690 (_values!3738 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!503 (defaultEntry!3755 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183952 (= lt!90968 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183952 (= lt!90965 call!18574)))

(assert (=> b!183952 (= e!121093 (+!280 call!18574 (tuple2!3425 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000) (get!2114 (select (arr!3690 (_values!3738 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!503 (defaultEntry!3755 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!18571 () Bool)

(assert (=> bm!18571 (= call!18574 (getCurrentListMapNoExtraKeys!193 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3755 thiss!1248)))))

(declare-fun b!183953 () Bool)

(assert (=> b!183953 (= e!121094 (= lt!90969 (getCurrentListMapNoExtraKeys!193 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3755 thiss!1248))))))

(declare-fun b!183954 () Bool)

(assert (=> b!183954 (= e!121092 e!121090)))

(declare-fun c!32988 () Bool)

(assert (=> b!183954 (= c!32988 e!121089)))

(declare-fun res!87040 () Bool)

(assert (=> b!183954 (=> (not res!87040) (not e!121089))))

(assert (=> b!183954 (= res!87040 (bvslt #b00000000000000000000000000000000 (size!4002 (_keys!5677 thiss!1248))))))

(assert (= (and d!54819 c!32985) b!183950))

(assert (= (and d!54819 (not c!32985)) b!183943))

(assert (= (and b!183943 c!32986) b!183952))

(assert (= (and b!183943 (not c!32986)) b!183948))

(assert (= (or b!183952 b!183948) bm!18571))

(assert (= (and d!54819 res!87043) b!183949))

(assert (= (and b!183949 res!87041) b!183954))

(assert (= (and b!183954 res!87040) b!183946))

(assert (= (and b!183954 c!32988) b!183945))

(assert (= (and b!183954 (not c!32988)) b!183944))

(assert (= (and b!183945 res!87042) b!183947))

(assert (= (and b!183944 c!32987) b!183953))

(assert (= (and b!183944 (not c!32987)) b!183951))

(declare-fun b_lambda!7207 () Bool)

(assert (=> (not b_lambda!7207) (not b!183947)))

(assert (=> b!183947 t!7212))

(declare-fun b_and!11115 () Bool)

(assert (= b_and!11113 (and (=> t!7212 result!4771) b_and!11115)))

(declare-fun b_lambda!7209 () Bool)

(assert (=> (not b_lambda!7209) (not b!183952)))

(assert (=> b!183952 t!7212))

(declare-fun b_and!11117 () Bool)

(assert (= b_and!11115 (and (=> t!7212 result!4771) b_and!11117)))

(declare-fun m!211367 () Bool)

(assert (=> bm!18571 m!211367))

(assert (=> b!183945 m!211257))

(assert (=> b!183945 m!211257))

(declare-fun m!211369 () Bool)

(assert (=> b!183945 m!211369))

(assert (=> b!183947 m!211257))

(declare-fun m!211371 () Bool)

(assert (=> b!183947 m!211371))

(assert (=> b!183947 m!211299))

(assert (=> b!183947 m!211257))

(assert (=> b!183947 m!211301))

(assert (=> b!183947 m!211299))

(assert (=> b!183947 m!211301))

(assert (=> b!183947 m!211303))

(assert (=> b!183946 m!211257))

(assert (=> b!183946 m!211257))

(assert (=> b!183946 m!211291))

(declare-fun m!211373 () Bool)

(assert (=> b!183952 m!211373))

(declare-fun m!211375 () Bool)

(assert (=> b!183952 m!211375))

(declare-fun m!211377 () Bool)

(assert (=> b!183952 m!211377))

(assert (=> b!183952 m!211299))

(assert (=> b!183952 m!211373))

(declare-fun m!211379 () Bool)

(assert (=> b!183952 m!211379))

(assert (=> b!183952 m!211257))

(assert (=> b!183952 m!211301))

(assert (=> b!183952 m!211299))

(assert (=> b!183952 m!211301))

(assert (=> b!183952 m!211303))

(assert (=> b!183953 m!211367))

(assert (=> b!183943 m!211257))

(assert (=> b!183943 m!211257))

(assert (=> b!183943 m!211291))

(declare-fun m!211381 () Bool)

(assert (=> b!183951 m!211381))

(declare-fun m!211383 () Bool)

(assert (=> d!54819 m!211383))

(assert (=> d!54819 m!211207))

(declare-fun m!211385 () Bool)

(assert (=> b!183949 m!211385))

(assert (=> b!183820 d!54819))

(declare-fun d!54821 () Bool)

(declare-fun e!121095 () Bool)

(assert (=> d!54821 e!121095))

(declare-fun res!87044 () Bool)

(assert (=> d!54821 (=> (not res!87044) (not e!121095))))

(declare-fun lt!90972 () ListLongMap!2341)

(assert (=> d!54821 (= res!87044 (contains!1274 lt!90972 (_1!1723 (tuple2!3425 lt!90896 (minValue!3596 thiss!1248)))))))

(declare-fun lt!90973 () List!2340)

(assert (=> d!54821 (= lt!90972 (ListLongMap!2342 lt!90973))))

(declare-fun lt!90974 () Unit!5556)

(declare-fun lt!90975 () Unit!5556)

(assert (=> d!54821 (= lt!90974 lt!90975)))

(assert (=> d!54821 (= (getValueByKey!217 lt!90973 (_1!1723 (tuple2!3425 lt!90896 (minValue!3596 thiss!1248)))) (Some!222 (_2!1723 (tuple2!3425 lt!90896 (minValue!3596 thiss!1248)))))))

(assert (=> d!54821 (= lt!90975 (lemmaContainsTupThenGetReturnValue!114 lt!90973 (_1!1723 (tuple2!3425 lt!90896 (minValue!3596 thiss!1248))) (_2!1723 (tuple2!3425 lt!90896 (minValue!3596 thiss!1248)))))))

(assert (=> d!54821 (= lt!90973 (insertStrictlySorted!117 (toList!1186 lt!90891) (_1!1723 (tuple2!3425 lt!90896 (minValue!3596 thiss!1248))) (_2!1723 (tuple2!3425 lt!90896 (minValue!3596 thiss!1248)))))))

(assert (=> d!54821 (= (+!280 lt!90891 (tuple2!3425 lt!90896 (minValue!3596 thiss!1248))) lt!90972)))

(declare-fun b!183955 () Bool)

(declare-fun res!87045 () Bool)

(assert (=> b!183955 (=> (not res!87045) (not e!121095))))

(assert (=> b!183955 (= res!87045 (= (getValueByKey!217 (toList!1186 lt!90972) (_1!1723 (tuple2!3425 lt!90896 (minValue!3596 thiss!1248)))) (Some!222 (_2!1723 (tuple2!3425 lt!90896 (minValue!3596 thiss!1248))))))))

(declare-fun b!183956 () Bool)

(assert (=> b!183956 (= e!121095 (contains!1275 (toList!1186 lt!90972) (tuple2!3425 lt!90896 (minValue!3596 thiss!1248))))))

(assert (= (and d!54821 res!87044) b!183955))

(assert (= (and b!183955 res!87045) b!183956))

(declare-fun m!211387 () Bool)

(assert (=> d!54821 m!211387))

(declare-fun m!211389 () Bool)

(assert (=> d!54821 m!211389))

(declare-fun m!211391 () Bool)

(assert (=> d!54821 m!211391))

(declare-fun m!211393 () Bool)

(assert (=> d!54821 m!211393))

(declare-fun m!211395 () Bool)

(assert (=> b!183955 m!211395))

(declare-fun m!211397 () Bool)

(assert (=> b!183956 m!211397))

(assert (=> b!183820 d!54821))

(declare-fun d!54823 () Bool)

(declare-fun e!121096 () Bool)

(assert (=> d!54823 e!121096))

(declare-fun res!87046 () Bool)

(assert (=> d!54823 (=> (not res!87046) (not e!121096))))

(declare-fun lt!90976 () ListLongMap!2341)

(assert (=> d!54823 (= res!87046 (contains!1274 lt!90976 (_1!1723 (tuple2!3425 lt!90909 (minValue!3596 thiss!1248)))))))

(declare-fun lt!90977 () List!2340)

(assert (=> d!54823 (= lt!90976 (ListLongMap!2342 lt!90977))))

(declare-fun lt!90978 () Unit!5556)

(declare-fun lt!90979 () Unit!5556)

(assert (=> d!54823 (= lt!90978 lt!90979)))

(assert (=> d!54823 (= (getValueByKey!217 lt!90977 (_1!1723 (tuple2!3425 lt!90909 (minValue!3596 thiss!1248)))) (Some!222 (_2!1723 (tuple2!3425 lt!90909 (minValue!3596 thiss!1248)))))))

(assert (=> d!54823 (= lt!90979 (lemmaContainsTupThenGetReturnValue!114 lt!90977 (_1!1723 (tuple2!3425 lt!90909 (minValue!3596 thiss!1248))) (_2!1723 (tuple2!3425 lt!90909 (minValue!3596 thiss!1248)))))))

(assert (=> d!54823 (= lt!90977 (insertStrictlySorted!117 (toList!1186 lt!90893) (_1!1723 (tuple2!3425 lt!90909 (minValue!3596 thiss!1248))) (_2!1723 (tuple2!3425 lt!90909 (minValue!3596 thiss!1248)))))))

(assert (=> d!54823 (= (+!280 lt!90893 (tuple2!3425 lt!90909 (minValue!3596 thiss!1248))) lt!90976)))

(declare-fun b!183957 () Bool)

(declare-fun res!87047 () Bool)

(assert (=> b!183957 (=> (not res!87047) (not e!121096))))

(assert (=> b!183957 (= res!87047 (= (getValueByKey!217 (toList!1186 lt!90976) (_1!1723 (tuple2!3425 lt!90909 (minValue!3596 thiss!1248)))) (Some!222 (_2!1723 (tuple2!3425 lt!90909 (minValue!3596 thiss!1248))))))))

(declare-fun b!183958 () Bool)

(assert (=> b!183958 (= e!121096 (contains!1275 (toList!1186 lt!90976) (tuple2!3425 lt!90909 (minValue!3596 thiss!1248))))))

(assert (= (and d!54823 res!87046) b!183957))

(assert (= (and b!183957 res!87047) b!183958))

(declare-fun m!211399 () Bool)

(assert (=> d!54823 m!211399))

(declare-fun m!211401 () Bool)

(assert (=> d!54823 m!211401))

(declare-fun m!211403 () Bool)

(assert (=> d!54823 m!211403))

(declare-fun m!211405 () Bool)

(assert (=> d!54823 m!211405))

(declare-fun m!211407 () Bool)

(assert (=> b!183957 m!211407))

(declare-fun m!211409 () Bool)

(assert (=> b!183958 m!211409))

(assert (=> b!183820 d!54823))

(declare-fun d!54825 () Bool)

(declare-fun e!121098 () Bool)

(assert (=> d!54825 e!121098))

(declare-fun res!87048 () Bool)

(assert (=> d!54825 (=> res!87048 e!121098)))

(declare-fun lt!90982 () Bool)

(assert (=> d!54825 (= res!87048 (not lt!90982))))

(declare-fun lt!90980 () Bool)

(assert (=> d!54825 (= lt!90982 lt!90980)))

(declare-fun lt!90983 () Unit!5556)

(declare-fun e!121097 () Unit!5556)

(assert (=> d!54825 (= lt!90983 e!121097)))

(declare-fun c!32989 () Bool)

(assert (=> d!54825 (= c!32989 lt!90980)))

(assert (=> d!54825 (= lt!90980 (containsKey!221 (toList!1186 (+!280 lt!90900 (tuple2!3425 lt!90889 (zeroValue!3596 thiss!1248)))) lt!90908))))

(assert (=> d!54825 (= (contains!1274 (+!280 lt!90900 (tuple2!3425 lt!90889 (zeroValue!3596 thiss!1248))) lt!90908) lt!90982)))

(declare-fun b!183959 () Bool)

(declare-fun lt!90981 () Unit!5556)

(assert (=> b!183959 (= e!121097 lt!90981)))

(assert (=> b!183959 (= lt!90981 (lemmaContainsKeyImpliesGetValueByKeyDefined!169 (toList!1186 (+!280 lt!90900 (tuple2!3425 lt!90889 (zeroValue!3596 thiss!1248)))) lt!90908))))

(assert (=> b!183959 (isDefined!170 (getValueByKey!217 (toList!1186 (+!280 lt!90900 (tuple2!3425 lt!90889 (zeroValue!3596 thiss!1248)))) lt!90908))))

(declare-fun b!183960 () Bool)

(declare-fun Unit!5562 () Unit!5556)

(assert (=> b!183960 (= e!121097 Unit!5562)))

(declare-fun b!183961 () Bool)

(assert (=> b!183961 (= e!121098 (isDefined!170 (getValueByKey!217 (toList!1186 (+!280 lt!90900 (tuple2!3425 lt!90889 (zeroValue!3596 thiss!1248)))) lt!90908)))))

(assert (= (and d!54825 c!32989) b!183959))

(assert (= (and d!54825 (not c!32989)) b!183960))

(assert (= (and d!54825 (not res!87048)) b!183961))

(declare-fun m!211411 () Bool)

(assert (=> d!54825 m!211411))

(declare-fun m!211413 () Bool)

(assert (=> b!183959 m!211413))

(declare-fun m!211415 () Bool)

(assert (=> b!183959 m!211415))

(assert (=> b!183959 m!211415))

(declare-fun m!211417 () Bool)

(assert (=> b!183959 m!211417))

(assert (=> b!183961 m!211415))

(assert (=> b!183961 m!211415))

(assert (=> b!183961 m!211417))

(assert (=> b!183820 d!54825))

(declare-fun d!54827 () Bool)

(declare-fun get!2115 (Option!223) V!5387)

(assert (=> d!54827 (= (apply!160 lt!90894 lt!90899) (get!2115 (getValueByKey!217 (toList!1186 lt!90894) lt!90899)))))

(declare-fun bs!7468 () Bool)

(assert (= bs!7468 d!54827))

(declare-fun m!211419 () Bool)

(assert (=> bs!7468 m!211419))

(assert (=> bs!7468 m!211419))

(declare-fun m!211421 () Bool)

(assert (=> bs!7468 m!211421))

(assert (=> b!183820 d!54827))

(declare-fun d!54829 () Bool)

(assert (=> d!54829 (= (apply!160 (+!280 lt!90894 (tuple2!3425 lt!90888 (zeroValue!3596 thiss!1248))) lt!90899) (get!2115 (getValueByKey!217 (toList!1186 (+!280 lt!90894 (tuple2!3425 lt!90888 (zeroValue!3596 thiss!1248)))) lt!90899)))))

(declare-fun bs!7469 () Bool)

(assert (= bs!7469 d!54829))

(declare-fun m!211423 () Bool)

(assert (=> bs!7469 m!211423))

(assert (=> bs!7469 m!211423))

(declare-fun m!211425 () Bool)

(assert (=> bs!7469 m!211425))

(assert (=> b!183820 d!54829))

(declare-fun d!54831 () Bool)

(assert (=> d!54831 (= (apply!160 (+!280 lt!90891 (tuple2!3425 lt!90896 (minValue!3596 thiss!1248))) lt!90904) (apply!160 lt!90891 lt!90904))))

(declare-fun lt!90986 () Unit!5556)

(declare-fun choose!973 (ListLongMap!2341 (_ BitVec 64) V!5387 (_ BitVec 64)) Unit!5556)

(assert (=> d!54831 (= lt!90986 (choose!973 lt!90891 lt!90896 (minValue!3596 thiss!1248) lt!90904))))

(declare-fun e!121101 () Bool)

(assert (=> d!54831 e!121101))

(declare-fun res!87051 () Bool)

(assert (=> d!54831 (=> (not res!87051) (not e!121101))))

(assert (=> d!54831 (= res!87051 (contains!1274 lt!90891 lt!90904))))

(assert (=> d!54831 (= (addApplyDifferent!136 lt!90891 lt!90896 (minValue!3596 thiss!1248) lt!90904) lt!90986)))

(declare-fun b!183965 () Bool)

(assert (=> b!183965 (= e!121101 (not (= lt!90904 lt!90896)))))

(assert (= (and d!54831 res!87051) b!183965))

(assert (=> d!54831 m!211261))

(assert (=> d!54831 m!211263))

(assert (=> d!54831 m!211275))

(assert (=> d!54831 m!211261))

(declare-fun m!211427 () Bool)

(assert (=> d!54831 m!211427))

(declare-fun m!211429 () Bool)

(assert (=> d!54831 m!211429))

(assert (=> b!183820 d!54831))

(declare-fun d!54833 () Bool)

(assert (=> d!54833 (= (apply!160 lt!90893 lt!90895) (get!2115 (getValueByKey!217 (toList!1186 lt!90893) lt!90895)))))

(declare-fun bs!7470 () Bool)

(assert (= bs!7470 d!54833))

(declare-fun m!211431 () Bool)

(assert (=> bs!7470 m!211431))

(assert (=> bs!7470 m!211431))

(declare-fun m!211433 () Bool)

(assert (=> bs!7470 m!211433))

(assert (=> b!183820 d!54833))

(declare-fun d!54835 () Bool)

(assert (=> d!54835 (contains!1274 (+!280 lt!90900 (tuple2!3425 lt!90889 (zeroValue!3596 thiss!1248))) lt!90908)))

(declare-fun lt!90989 () Unit!5556)

(declare-fun choose!974 (ListLongMap!2341 (_ BitVec 64) V!5387 (_ BitVec 64)) Unit!5556)

(assert (=> d!54835 (= lt!90989 (choose!974 lt!90900 lt!90889 (zeroValue!3596 thiss!1248) lt!90908))))

(assert (=> d!54835 (contains!1274 lt!90900 lt!90908)))

(assert (=> d!54835 (= (addStillContains!136 lt!90900 lt!90889 (zeroValue!3596 thiss!1248) lt!90908) lt!90989)))

(declare-fun bs!7471 () Bool)

(assert (= bs!7471 d!54835))

(assert (=> bs!7471 m!211259))

(assert (=> bs!7471 m!211259))

(assert (=> bs!7471 m!211265))

(declare-fun m!211435 () Bool)

(assert (=> bs!7471 m!211435))

(declare-fun m!211437 () Bool)

(assert (=> bs!7471 m!211437))

(assert (=> b!183820 d!54835))

(declare-fun d!54837 () Bool)

(assert (=> d!54837 (= (apply!160 (+!280 lt!90893 (tuple2!3425 lt!90909 (minValue!3596 thiss!1248))) lt!90895) (apply!160 lt!90893 lt!90895))))

(declare-fun lt!90990 () Unit!5556)

(assert (=> d!54837 (= lt!90990 (choose!973 lt!90893 lt!90909 (minValue!3596 thiss!1248) lt!90895))))

(declare-fun e!121102 () Bool)

(assert (=> d!54837 e!121102))

(declare-fun res!87052 () Bool)

(assert (=> d!54837 (=> (not res!87052) (not e!121102))))

(assert (=> d!54837 (= res!87052 (contains!1274 lt!90893 lt!90895))))

(assert (=> d!54837 (= (addApplyDifferent!136 lt!90893 lt!90909 (minValue!3596 thiss!1248) lt!90895) lt!90990)))

(declare-fun b!183967 () Bool)

(assert (=> b!183967 (= e!121102 (not (= lt!90895 lt!90909)))))

(assert (= (and d!54837 res!87052) b!183967))

(assert (=> d!54837 m!211269))

(assert (=> d!54837 m!211277))

(assert (=> d!54837 m!211279))

(assert (=> d!54837 m!211269))

(declare-fun m!211439 () Bool)

(assert (=> d!54837 m!211439))

(declare-fun m!211441 () Bool)

(assert (=> d!54837 m!211441))

(assert (=> b!183820 d!54837))

(declare-fun d!54839 () Bool)

(assert (=> d!54839 (= (apply!160 lt!90891 lt!90904) (get!2115 (getValueByKey!217 (toList!1186 lt!90891) lt!90904)))))

(declare-fun bs!7472 () Bool)

(assert (= bs!7472 d!54839))

(declare-fun m!211443 () Bool)

(assert (=> bs!7472 m!211443))

(assert (=> bs!7472 m!211443))

(declare-fun m!211445 () Bool)

(assert (=> bs!7472 m!211445))

(assert (=> b!183820 d!54839))

(declare-fun d!54841 () Bool)

(assert (=> d!54841 (= (apply!160 (+!280 lt!90891 (tuple2!3425 lt!90896 (minValue!3596 thiss!1248))) lt!90904) (get!2115 (getValueByKey!217 (toList!1186 (+!280 lt!90891 (tuple2!3425 lt!90896 (minValue!3596 thiss!1248)))) lt!90904)))))

(declare-fun bs!7473 () Bool)

(assert (= bs!7473 d!54841))

(declare-fun m!211447 () Bool)

(assert (=> bs!7473 m!211447))

(assert (=> bs!7473 m!211447))

(declare-fun m!211449 () Bool)

(assert (=> bs!7473 m!211449))

(assert (=> b!183820 d!54841))

(declare-fun d!54843 () Bool)

(declare-fun e!121103 () Bool)

(assert (=> d!54843 e!121103))

(declare-fun res!87053 () Bool)

(assert (=> d!54843 (=> (not res!87053) (not e!121103))))

(declare-fun lt!90991 () ListLongMap!2341)

(assert (=> d!54843 (= res!87053 (contains!1274 lt!90991 (_1!1723 (tuple2!3425 lt!90888 (zeroValue!3596 thiss!1248)))))))

(declare-fun lt!90992 () List!2340)

(assert (=> d!54843 (= lt!90991 (ListLongMap!2342 lt!90992))))

(declare-fun lt!90993 () Unit!5556)

(declare-fun lt!90994 () Unit!5556)

(assert (=> d!54843 (= lt!90993 lt!90994)))

(assert (=> d!54843 (= (getValueByKey!217 lt!90992 (_1!1723 (tuple2!3425 lt!90888 (zeroValue!3596 thiss!1248)))) (Some!222 (_2!1723 (tuple2!3425 lt!90888 (zeroValue!3596 thiss!1248)))))))

(assert (=> d!54843 (= lt!90994 (lemmaContainsTupThenGetReturnValue!114 lt!90992 (_1!1723 (tuple2!3425 lt!90888 (zeroValue!3596 thiss!1248))) (_2!1723 (tuple2!3425 lt!90888 (zeroValue!3596 thiss!1248)))))))

(assert (=> d!54843 (= lt!90992 (insertStrictlySorted!117 (toList!1186 lt!90894) (_1!1723 (tuple2!3425 lt!90888 (zeroValue!3596 thiss!1248))) (_2!1723 (tuple2!3425 lt!90888 (zeroValue!3596 thiss!1248)))))))

(assert (=> d!54843 (= (+!280 lt!90894 (tuple2!3425 lt!90888 (zeroValue!3596 thiss!1248))) lt!90991)))

(declare-fun b!183968 () Bool)

(declare-fun res!87054 () Bool)

(assert (=> b!183968 (=> (not res!87054) (not e!121103))))

(assert (=> b!183968 (= res!87054 (= (getValueByKey!217 (toList!1186 lt!90991) (_1!1723 (tuple2!3425 lt!90888 (zeroValue!3596 thiss!1248)))) (Some!222 (_2!1723 (tuple2!3425 lt!90888 (zeroValue!3596 thiss!1248))))))))

(declare-fun b!183969 () Bool)

(assert (=> b!183969 (= e!121103 (contains!1275 (toList!1186 lt!90991) (tuple2!3425 lt!90888 (zeroValue!3596 thiss!1248))))))

(assert (= (and d!54843 res!87053) b!183968))

(assert (= (and b!183968 res!87054) b!183969))

(declare-fun m!211451 () Bool)

(assert (=> d!54843 m!211451))

(declare-fun m!211453 () Bool)

(assert (=> d!54843 m!211453))

(declare-fun m!211455 () Bool)

(assert (=> d!54843 m!211455))

(declare-fun m!211457 () Bool)

(assert (=> d!54843 m!211457))

(declare-fun m!211459 () Bool)

(assert (=> b!183968 m!211459))

(declare-fun m!211461 () Bool)

(assert (=> b!183969 m!211461))

(assert (=> b!183820 d!54843))

(declare-fun d!54845 () Bool)

(assert (=> d!54845 (= (apply!160 (+!280 lt!90893 (tuple2!3425 lt!90909 (minValue!3596 thiss!1248))) lt!90895) (get!2115 (getValueByKey!217 (toList!1186 (+!280 lt!90893 (tuple2!3425 lt!90909 (minValue!3596 thiss!1248)))) lt!90895)))))

(declare-fun bs!7474 () Bool)

(assert (= bs!7474 d!54845))

(declare-fun m!211463 () Bool)

(assert (=> bs!7474 m!211463))

(assert (=> bs!7474 m!211463))

(declare-fun m!211465 () Bool)

(assert (=> bs!7474 m!211465))

(assert (=> b!183820 d!54845))

(declare-fun d!54847 () Bool)

(declare-fun e!121104 () Bool)

(assert (=> d!54847 e!121104))

(declare-fun res!87055 () Bool)

(assert (=> d!54847 (=> (not res!87055) (not e!121104))))

(declare-fun lt!90995 () ListLongMap!2341)

(assert (=> d!54847 (= res!87055 (contains!1274 lt!90995 (_1!1723 (tuple2!3425 lt!90889 (zeroValue!3596 thiss!1248)))))))

(declare-fun lt!90996 () List!2340)

(assert (=> d!54847 (= lt!90995 (ListLongMap!2342 lt!90996))))

(declare-fun lt!90997 () Unit!5556)

(declare-fun lt!90998 () Unit!5556)

(assert (=> d!54847 (= lt!90997 lt!90998)))

(assert (=> d!54847 (= (getValueByKey!217 lt!90996 (_1!1723 (tuple2!3425 lt!90889 (zeroValue!3596 thiss!1248)))) (Some!222 (_2!1723 (tuple2!3425 lt!90889 (zeroValue!3596 thiss!1248)))))))

(assert (=> d!54847 (= lt!90998 (lemmaContainsTupThenGetReturnValue!114 lt!90996 (_1!1723 (tuple2!3425 lt!90889 (zeroValue!3596 thiss!1248))) (_2!1723 (tuple2!3425 lt!90889 (zeroValue!3596 thiss!1248)))))))

(assert (=> d!54847 (= lt!90996 (insertStrictlySorted!117 (toList!1186 lt!90900) (_1!1723 (tuple2!3425 lt!90889 (zeroValue!3596 thiss!1248))) (_2!1723 (tuple2!3425 lt!90889 (zeroValue!3596 thiss!1248)))))))

(assert (=> d!54847 (= (+!280 lt!90900 (tuple2!3425 lt!90889 (zeroValue!3596 thiss!1248))) lt!90995)))

(declare-fun b!183970 () Bool)

(declare-fun res!87056 () Bool)

(assert (=> b!183970 (=> (not res!87056) (not e!121104))))

(assert (=> b!183970 (= res!87056 (= (getValueByKey!217 (toList!1186 lt!90995) (_1!1723 (tuple2!3425 lt!90889 (zeroValue!3596 thiss!1248)))) (Some!222 (_2!1723 (tuple2!3425 lt!90889 (zeroValue!3596 thiss!1248))))))))

(declare-fun b!183971 () Bool)

(assert (=> b!183971 (= e!121104 (contains!1275 (toList!1186 lt!90995) (tuple2!3425 lt!90889 (zeroValue!3596 thiss!1248))))))

(assert (= (and d!54847 res!87055) b!183970))

(assert (= (and b!183970 res!87056) b!183971))

(declare-fun m!211467 () Bool)

(assert (=> d!54847 m!211467))

(declare-fun m!211469 () Bool)

(assert (=> d!54847 m!211469))

(declare-fun m!211471 () Bool)

(assert (=> d!54847 m!211471))

(declare-fun m!211473 () Bool)

(assert (=> d!54847 m!211473))

(declare-fun m!211475 () Bool)

(assert (=> b!183970 m!211475))

(declare-fun m!211477 () Bool)

(assert (=> b!183971 m!211477))

(assert (=> b!183820 d!54847))

(declare-fun d!54849 () Bool)

(assert (=> d!54849 (= (apply!160 (+!280 lt!90894 (tuple2!3425 lt!90888 (zeroValue!3596 thiss!1248))) lt!90899) (apply!160 lt!90894 lt!90899))))

(declare-fun lt!90999 () Unit!5556)

(assert (=> d!54849 (= lt!90999 (choose!973 lt!90894 lt!90888 (zeroValue!3596 thiss!1248) lt!90899))))

(declare-fun e!121105 () Bool)

(assert (=> d!54849 e!121105))

(declare-fun res!87057 () Bool)

(assert (=> d!54849 (=> (not res!87057) (not e!121105))))

(assert (=> d!54849 (= res!87057 (contains!1274 lt!90894 lt!90899))))

(assert (=> d!54849 (= (addApplyDifferent!136 lt!90894 lt!90888 (zeroValue!3596 thiss!1248) lt!90899) lt!90999)))

(declare-fun b!183972 () Bool)

(assert (=> b!183972 (= e!121105 (not (= lt!90899 lt!90888)))))

(assert (= (and d!54849 res!87057) b!183972))

(assert (=> d!54849 m!211271))

(assert (=> d!54849 m!211285))

(assert (=> d!54849 m!211273))

(assert (=> d!54849 m!211271))

(declare-fun m!211479 () Bool)

(assert (=> d!54849 m!211479))

(declare-fun m!211481 () Bool)

(assert (=> d!54849 m!211481))

(assert (=> b!183820 d!54849))

(declare-fun d!54851 () Bool)

(declare-fun res!87062 () Bool)

(declare-fun e!121110 () Bool)

(assert (=> d!54851 (=> res!87062 e!121110)))

(assert (=> d!54851 (= res!87062 (and ((_ is Cons!2336) (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248)))) (= (_1!1723 (h!2966 (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248))))) key!828)))))

(assert (=> d!54851 (= (containsKey!221 (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248))) key!828) e!121110)))

(declare-fun b!183977 () Bool)

(declare-fun e!121111 () Bool)

(assert (=> b!183977 (= e!121110 e!121111)))

(declare-fun res!87063 () Bool)

(assert (=> b!183977 (=> (not res!87063) (not e!121111))))

(assert (=> b!183977 (= res!87063 (and (or (not ((_ is Cons!2336) (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248))))) (bvsle (_1!1723 (h!2966 (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248))))) key!828)) ((_ is Cons!2336) (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248)))) (bvslt (_1!1723 (h!2966 (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248))))) key!828)))))

(declare-fun b!183978 () Bool)

(assert (=> b!183978 (= e!121111 (containsKey!221 (t!7210 (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248)))) key!828))))

(assert (= (and d!54851 (not res!87062)) b!183977))

(assert (= (and b!183977 res!87063) b!183978))

(declare-fun m!211483 () Bool)

(assert (=> b!183978 m!211483))

(assert (=> d!54799 d!54851))

(declare-fun b!183991 () Bool)

(declare-fun e!121119 () SeekEntryResult!622)

(assert (=> b!183991 (= e!121119 Undefined!622)))

(declare-fun b!183992 () Bool)

(declare-fun e!121118 () SeekEntryResult!622)

(assert (=> b!183992 (= e!121118 (Found!622 (index!4660 lt!90918)))))

(declare-fun b!183993 () Bool)

(declare-fun c!32998 () Bool)

(declare-fun lt!91005 () (_ BitVec 64))

(assert (=> b!183993 (= c!32998 (= lt!91005 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!121120 () SeekEntryResult!622)

(assert (=> b!183993 (= e!121118 e!121120)))

(declare-fun lt!91004 () SeekEntryResult!622)

(declare-fun d!54853 () Bool)

(assert (=> d!54853 (and (or ((_ is Undefined!622) lt!91004) (not ((_ is Found!622) lt!91004)) (and (bvsge (index!4659 lt!91004) #b00000000000000000000000000000000) (bvslt (index!4659 lt!91004) (size!4002 (_keys!5677 thiss!1248))))) (or ((_ is Undefined!622) lt!91004) ((_ is Found!622) lt!91004) (not ((_ is MissingVacant!622) lt!91004)) (not (= (index!4661 lt!91004) (index!4660 lt!90918))) (and (bvsge (index!4661 lt!91004) #b00000000000000000000000000000000) (bvslt (index!4661 lt!91004) (size!4002 (_keys!5677 thiss!1248))))) (or ((_ is Undefined!622) lt!91004) (ite ((_ is Found!622) lt!91004) (= (select (arr!3689 (_keys!5677 thiss!1248)) (index!4659 lt!91004)) key!828) (and ((_ is MissingVacant!622) lt!91004) (= (index!4661 lt!91004) (index!4660 lt!90918)) (= (select (arr!3689 (_keys!5677 thiss!1248)) (index!4661 lt!91004)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!54853 (= lt!91004 e!121119)))

(declare-fun c!32996 () Bool)

(assert (=> d!54853 (= c!32996 (bvsge (x!20002 lt!90918) #b01111111111111111111111111111110))))

(assert (=> d!54853 (= lt!91005 (select (arr!3689 (_keys!5677 thiss!1248)) (index!4660 lt!90918)))))

(assert (=> d!54853 (validMask!0 (mask!8825 thiss!1248))))

(assert (=> d!54853 (= (seekKeyOrZeroReturnVacant!0 (x!20002 lt!90918) (index!4660 lt!90918) (index!4660 lt!90918) key!828 (_keys!5677 thiss!1248) (mask!8825 thiss!1248)) lt!91004)))

(declare-fun b!183994 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!183994 (= e!121120 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20002 lt!90918) #b00000000000000000000000000000001) (nextIndex!0 (index!4660 lt!90918) (x!20002 lt!90918) (mask!8825 thiss!1248)) (index!4660 lt!90918) key!828 (_keys!5677 thiss!1248) (mask!8825 thiss!1248)))))

(declare-fun b!183995 () Bool)

(assert (=> b!183995 (= e!121120 (MissingVacant!622 (index!4660 lt!90918)))))

(declare-fun b!183996 () Bool)

(assert (=> b!183996 (= e!121119 e!121118)))

(declare-fun c!32997 () Bool)

(assert (=> b!183996 (= c!32997 (= lt!91005 key!828))))

(assert (= (and d!54853 c!32996) b!183991))

(assert (= (and d!54853 (not c!32996)) b!183996))

(assert (= (and b!183996 c!32997) b!183992))

(assert (= (and b!183996 (not c!32997)) b!183993))

(assert (= (and b!183993 c!32998) b!183995))

(assert (= (and b!183993 (not c!32998)) b!183994))

(declare-fun m!211485 () Bool)

(assert (=> d!54853 m!211485))

(declare-fun m!211487 () Bool)

(assert (=> d!54853 m!211487))

(assert (=> d!54853 m!211311))

(assert (=> d!54853 m!211207))

(declare-fun m!211489 () Bool)

(assert (=> b!183994 m!211489))

(assert (=> b!183994 m!211489))

(declare-fun m!211491 () Bool)

(assert (=> b!183994 m!211491))

(assert (=> b!183855 d!54853))

(declare-fun d!54855 () Bool)

(assert (=> d!54855 (= (apply!160 lt!90905 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000)) (get!2115 (getValueByKey!217 (toList!1186 lt!90905) (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7475 () Bool)

(assert (= bs!7475 d!54855))

(assert (=> bs!7475 m!211257))

(declare-fun m!211493 () Bool)

(assert (=> bs!7475 m!211493))

(assert (=> bs!7475 m!211493))

(declare-fun m!211495 () Bool)

(assert (=> bs!7475 m!211495))

(assert (=> b!183819 d!54855))

(declare-fun d!54857 () Bool)

(declare-fun c!33001 () Bool)

(assert (=> d!54857 (= c!33001 ((_ is ValueCellFull!1809) (select (arr!3690 (_values!3738 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!121123 () V!5387)

(assert (=> d!54857 (= (get!2114 (select (arr!3690 (_values!3738 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!503 (defaultEntry!3755 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!121123)))

(declare-fun b!184001 () Bool)

(declare-fun get!2116 (ValueCell!1809 V!5387) V!5387)

(assert (=> b!184001 (= e!121123 (get!2116 (select (arr!3690 (_values!3738 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!503 (defaultEntry!3755 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!184002 () Bool)

(declare-fun get!2117 (ValueCell!1809 V!5387) V!5387)

(assert (=> b!184002 (= e!121123 (get!2117 (select (arr!3690 (_values!3738 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!503 (defaultEntry!3755 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54857 c!33001) b!184001))

(assert (= (and d!54857 (not c!33001)) b!184002))

(assert (=> b!184001 m!211299))

(assert (=> b!184001 m!211301))

(declare-fun m!211497 () Bool)

(assert (=> b!184001 m!211497))

(assert (=> b!184002 m!211299))

(assert (=> b!184002 m!211301))

(declare-fun m!211499 () Bool)

(assert (=> b!184002 m!211499))

(assert (=> b!183819 d!54857))

(declare-fun d!54859 () Bool)

(assert (=> d!54859 (= (validKeyInArray!0 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!183836 d!54859))

(declare-fun d!54861 () Bool)

(declare-fun res!87073 () Bool)

(declare-fun e!121126 () Bool)

(assert (=> d!54861 (=> (not res!87073) (not e!121126))))

(assert (=> d!54861 (= res!87073 (validMask!0 (mask!8825 thiss!1248)))))

(assert (=> d!54861 (= (simpleValid!176 thiss!1248) e!121126)))

(declare-fun b!184012 () Bool)

(declare-fun res!87074 () Bool)

(assert (=> b!184012 (=> (not res!87074) (not e!121126))))

(declare-fun size!4006 (LongMapFixedSize!2526) (_ BitVec 32))

(assert (=> b!184012 (= res!87074 (bvsge (size!4006 thiss!1248) (_size!1312 thiss!1248)))))

(declare-fun b!184014 () Bool)

(assert (=> b!184014 (= e!121126 (and (bvsge (extraKeys!3492 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3492 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1312 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!184011 () Bool)

(declare-fun res!87075 () Bool)

(assert (=> b!184011 (=> (not res!87075) (not e!121126))))

(assert (=> b!184011 (= res!87075 (and (= (size!4003 (_values!3738 thiss!1248)) (bvadd (mask!8825 thiss!1248) #b00000000000000000000000000000001)) (= (size!4002 (_keys!5677 thiss!1248)) (size!4003 (_values!3738 thiss!1248))) (bvsge (_size!1312 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1312 thiss!1248) (bvadd (mask!8825 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!184013 () Bool)

(declare-fun res!87072 () Bool)

(assert (=> b!184013 (=> (not res!87072) (not e!121126))))

(assert (=> b!184013 (= res!87072 (= (size!4006 thiss!1248) (bvadd (_size!1312 thiss!1248) (bvsdiv (bvadd (extraKeys!3492 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!54861 res!87073) b!184011))

(assert (= (and b!184011 res!87075) b!184012))

(assert (= (and b!184012 res!87074) b!184013))

(assert (= (and b!184013 res!87072) b!184014))

(assert (=> d!54861 m!211207))

(declare-fun m!211501 () Bool)

(assert (=> b!184012 m!211501))

(assert (=> b!184013 m!211501))

(assert (=> d!54793 d!54861))

(assert (=> bm!18556 d!54819))

(declare-fun d!54863 () Bool)

(declare-fun e!121128 () Bool)

(assert (=> d!54863 e!121128))

(declare-fun res!87076 () Bool)

(assert (=> d!54863 (=> res!87076 e!121128)))

(declare-fun lt!91008 () Bool)

(assert (=> d!54863 (= res!87076 (not lt!91008))))

(declare-fun lt!91006 () Bool)

(assert (=> d!54863 (= lt!91008 lt!91006)))

(declare-fun lt!91009 () Unit!5556)

(declare-fun e!121127 () Unit!5556)

(assert (=> d!54863 (= lt!91009 e!121127)))

(declare-fun c!33002 () Bool)

(assert (=> d!54863 (= c!33002 lt!91006)))

(assert (=> d!54863 (= lt!91006 (containsKey!221 (toList!1186 lt!90905) (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54863 (= (contains!1274 lt!90905 (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000)) lt!91008)))

(declare-fun b!184015 () Bool)

(declare-fun lt!91007 () Unit!5556)

(assert (=> b!184015 (= e!121127 lt!91007)))

(assert (=> b!184015 (= lt!91007 (lemmaContainsKeyImpliesGetValueByKeyDefined!169 (toList!1186 lt!90905) (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184015 (isDefined!170 (getValueByKey!217 (toList!1186 lt!90905) (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184016 () Bool)

(declare-fun Unit!5563 () Unit!5556)

(assert (=> b!184016 (= e!121127 Unit!5563)))

(declare-fun b!184017 () Bool)

(assert (=> b!184017 (= e!121128 (isDefined!170 (getValueByKey!217 (toList!1186 lt!90905) (select (arr!3689 (_keys!5677 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54863 c!33002) b!184015))

(assert (= (and d!54863 (not c!33002)) b!184016))

(assert (= (and d!54863 (not res!87076)) b!184017))

(assert (=> d!54863 m!211257))

(declare-fun m!211503 () Bool)

(assert (=> d!54863 m!211503))

(assert (=> b!184015 m!211257))

(declare-fun m!211505 () Bool)

(assert (=> b!184015 m!211505))

(assert (=> b!184015 m!211257))

(assert (=> b!184015 m!211493))

(assert (=> b!184015 m!211493))

(declare-fun m!211507 () Bool)

(assert (=> b!184015 m!211507))

(assert (=> b!184017 m!211257))

(assert (=> b!184017 m!211493))

(assert (=> b!184017 m!211493))

(assert (=> b!184017 m!211507))

(assert (=> b!183835 d!54863))

(declare-fun d!54865 () Bool)

(assert (=> d!54865 (= (apply!160 lt!90905 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2115 (getValueByKey!217 (toList!1186 lt!90905) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7476 () Bool)

(assert (= bs!7476 d!54865))

(assert (=> bs!7476 m!211349))

(assert (=> bs!7476 m!211349))

(declare-fun m!211509 () Bool)

(assert (=> bs!7476 m!211509))

(assert (=> b!183827 d!54865))

(assert (=> b!183832 d!54859))

(assert (=> d!54801 d!54805))

(declare-fun d!54867 () Bool)

(declare-fun isEmpty!466 (Option!223) Bool)

(assert (=> d!54867 (= (isDefined!170 (getValueByKey!217 (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248))) key!828)) (not (isEmpty!466 (getValueByKey!217 (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248))) key!828))))))

(declare-fun bs!7477 () Bool)

(assert (= bs!7477 d!54867))

(assert (=> bs!7477 m!211247))

(declare-fun m!211511 () Bool)

(assert (=> bs!7477 m!211511))

(assert (=> b!183776 d!54867))

(declare-fun d!54869 () Bool)

(declare-fun c!33007 () Bool)

(assert (=> d!54869 (= c!33007 (and ((_ is Cons!2336) (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248)))) (= (_1!1723 (h!2966 (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248))))) key!828)))))

(declare-fun e!121133 () Option!223)

(assert (=> d!54869 (= (getValueByKey!217 (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248))) key!828) e!121133)))

(declare-fun b!184027 () Bool)

(declare-fun e!121134 () Option!223)

(assert (=> b!184027 (= e!121133 e!121134)))

(declare-fun c!33008 () Bool)

(assert (=> b!184027 (= c!33008 (and ((_ is Cons!2336) (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248)))) (not (= (_1!1723 (h!2966 (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248))))) key!828))))))

(declare-fun b!184028 () Bool)

(assert (=> b!184028 (= e!121134 (getValueByKey!217 (t!7210 (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248)))) key!828))))

(declare-fun b!184029 () Bool)

(assert (=> b!184029 (= e!121134 None!221)))

(declare-fun b!184026 () Bool)

(assert (=> b!184026 (= e!121133 (Some!222 (_2!1723 (h!2966 (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248)))))))))

(assert (= (and d!54869 c!33007) b!184026))

(assert (= (and d!54869 (not c!33007)) b!184027))

(assert (= (and b!184027 c!33008) b!184028))

(assert (= (and b!184027 (not c!33008)) b!184029))

(declare-fun m!211513 () Bool)

(assert (=> b!184028 m!211513))

(assert (=> b!183776 d!54869))

(declare-fun d!54871 () Bool)

(assert (=> d!54871 (= (apply!160 lt!90905 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2115 (getValueByKey!217 (toList!1186 lt!90905) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7478 () Bool)

(assert (= bs!7478 d!54871))

(assert (=> bs!7478 m!211363))

(assert (=> bs!7478 m!211363))

(declare-fun m!211515 () Bool)

(assert (=> bs!7478 m!211515))

(assert (=> b!183831 d!54871))

(declare-fun d!54873 () Bool)

(declare-fun e!121135 () Bool)

(assert (=> d!54873 e!121135))

(declare-fun res!87077 () Bool)

(assert (=> d!54873 (=> (not res!87077) (not e!121135))))

(declare-fun lt!91010 () ListLongMap!2341)

(assert (=> d!54873 (= res!87077 (contains!1274 lt!91010 (_1!1723 (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248)))))))

(declare-fun lt!91011 () List!2340)

(assert (=> d!54873 (= lt!91010 (ListLongMap!2342 lt!91011))))

(declare-fun lt!91012 () Unit!5556)

(declare-fun lt!91013 () Unit!5556)

(assert (=> d!54873 (= lt!91012 lt!91013)))

(assert (=> d!54873 (= (getValueByKey!217 lt!91011 (_1!1723 (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248)))) (Some!222 (_2!1723 (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248)))))))

(assert (=> d!54873 (= lt!91013 (lemmaContainsTupThenGetReturnValue!114 lt!91011 (_1!1723 (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248))) (_2!1723 (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248)))))))

(assert (=> d!54873 (= lt!91011 (insertStrictlySorted!117 (toList!1186 call!18559) (_1!1723 (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248))) (_2!1723 (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248)))))))

(assert (=> d!54873 (= (+!280 call!18559 (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248))) lt!91010)))

(declare-fun b!184030 () Bool)

(declare-fun res!87078 () Bool)

(assert (=> b!184030 (=> (not res!87078) (not e!121135))))

(assert (=> b!184030 (= res!87078 (= (getValueByKey!217 (toList!1186 lt!91010) (_1!1723 (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248)))) (Some!222 (_2!1723 (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248))))))))

(declare-fun b!184031 () Bool)

(assert (=> b!184031 (= e!121135 (contains!1275 (toList!1186 lt!91010) (tuple2!3425 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3596 thiss!1248))))))

(assert (= (and d!54873 res!87077) b!184030))

(assert (= (and b!184030 res!87078) b!184031))

(declare-fun m!211517 () Bool)

(assert (=> d!54873 m!211517))

(declare-fun m!211519 () Bool)

(assert (=> d!54873 m!211519))

(declare-fun m!211521 () Bool)

(assert (=> d!54873 m!211521))

(declare-fun m!211523 () Bool)

(assert (=> d!54873 m!211523))

(declare-fun m!211525 () Bool)

(assert (=> b!184030 m!211525))

(declare-fun m!211527 () Bool)

(assert (=> b!184031 m!211527))

(assert (=> b!183823 d!54873))

(declare-fun d!54875 () Bool)

(assert (=> d!54875 (isDefined!170 (getValueByKey!217 (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248))) key!828))))

(declare-fun lt!91016 () Unit!5556)

(declare-fun choose!975 (List!2340 (_ BitVec 64)) Unit!5556)

(assert (=> d!54875 (= lt!91016 (choose!975 (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248))) key!828))))

(declare-fun e!121138 () Bool)

(assert (=> d!54875 e!121138))

(declare-fun res!87081 () Bool)

(assert (=> d!54875 (=> (not res!87081) (not e!121138))))

(declare-fun isStrictlySorted!346 (List!2340) Bool)

(assert (=> d!54875 (= res!87081 (isStrictlySorted!346 (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248)))))))

(assert (=> d!54875 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!169 (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248))) key!828) lt!91016)))

(declare-fun b!184034 () Bool)

(assert (=> b!184034 (= e!121138 (containsKey!221 (toList!1186 (getCurrentListMap!834 (_keys!5677 thiss!1248) (_values!3738 thiss!1248) (mask!8825 thiss!1248) (extraKeys!3492 thiss!1248) (zeroValue!3596 thiss!1248) (minValue!3596 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3755 thiss!1248))) key!828))))

(assert (= (and d!54875 res!87081) b!184034))

(assert (=> d!54875 m!211247))

(assert (=> d!54875 m!211247))

(assert (=> d!54875 m!211249))

(declare-fun m!211529 () Bool)

(assert (=> d!54875 m!211529))

(declare-fun m!211531 () Bool)

(assert (=> d!54875 m!211531))

(assert (=> b!184034 m!211243))

(assert (=> b!183774 d!54875))

(assert (=> b!183774 d!54867))

(assert (=> b!183774 d!54869))

(declare-fun b!184053 () Bool)

(declare-fun e!121152 () SeekEntryResult!622)

(assert (=> b!184053 (= e!121152 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8825 thiss!1248)) #b00000000000000000000000000000000 (mask!8825 thiss!1248)) key!828 (_keys!5677 thiss!1248) (mask!8825 thiss!1248)))))

(declare-fun b!184054 () Bool)

(assert (=> b!184054 (= e!121152 (Intermediate!622 false (toIndex!0 key!828 (mask!8825 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!184055 () Bool)

(declare-fun e!121149 () SeekEntryResult!622)

(assert (=> b!184055 (= e!121149 (Intermediate!622 true (toIndex!0 key!828 (mask!8825 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!184056 () Bool)

(declare-fun lt!91022 () SeekEntryResult!622)

(assert (=> b!184056 (and (bvsge (index!4660 lt!91022) #b00000000000000000000000000000000) (bvslt (index!4660 lt!91022) (size!4002 (_keys!5677 thiss!1248))))))

(declare-fun res!87088 () Bool)

(assert (=> b!184056 (= res!87088 (= (select (arr!3689 (_keys!5677 thiss!1248)) (index!4660 lt!91022)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!121151 () Bool)

(assert (=> b!184056 (=> res!87088 e!121151)))

(declare-fun d!54877 () Bool)

(declare-fun e!121150 () Bool)

(assert (=> d!54877 e!121150))

(declare-fun c!33016 () Bool)

(assert (=> d!54877 (= c!33016 (and ((_ is Intermediate!622) lt!91022) (undefined!1434 lt!91022)))))

(assert (=> d!54877 (= lt!91022 e!121149)))

(declare-fun c!33017 () Bool)

(assert (=> d!54877 (= c!33017 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!91021 () (_ BitVec 64))

(assert (=> d!54877 (= lt!91021 (select (arr!3689 (_keys!5677 thiss!1248)) (toIndex!0 key!828 (mask!8825 thiss!1248))))))

(assert (=> d!54877 (validMask!0 (mask!8825 thiss!1248))))

(assert (=> d!54877 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8825 thiss!1248)) key!828 (_keys!5677 thiss!1248) (mask!8825 thiss!1248)) lt!91022)))

(declare-fun b!184057 () Bool)

(declare-fun e!121153 () Bool)

(assert (=> b!184057 (= e!121150 e!121153)))

(declare-fun res!87089 () Bool)

(assert (=> b!184057 (= res!87089 (and ((_ is Intermediate!622) lt!91022) (not (undefined!1434 lt!91022)) (bvslt (x!20002 lt!91022) #b01111111111111111111111111111110) (bvsge (x!20002 lt!91022) #b00000000000000000000000000000000) (bvsge (x!20002 lt!91022) #b00000000000000000000000000000000)))))

(assert (=> b!184057 (=> (not res!87089) (not e!121153))))

(declare-fun b!184058 () Bool)

(assert (=> b!184058 (= e!121149 e!121152)))

(declare-fun c!33015 () Bool)

(assert (=> b!184058 (= c!33015 (or (= lt!91021 key!828) (= (bvadd lt!91021 lt!91021) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!184059 () Bool)

(assert (=> b!184059 (= e!121150 (bvsge (x!20002 lt!91022) #b01111111111111111111111111111110))))

(declare-fun b!184060 () Bool)

(assert (=> b!184060 (and (bvsge (index!4660 lt!91022) #b00000000000000000000000000000000) (bvslt (index!4660 lt!91022) (size!4002 (_keys!5677 thiss!1248))))))

(assert (=> b!184060 (= e!121151 (= (select (arr!3689 (_keys!5677 thiss!1248)) (index!4660 lt!91022)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184061 () Bool)

(assert (=> b!184061 (and (bvsge (index!4660 lt!91022) #b00000000000000000000000000000000) (bvslt (index!4660 lt!91022) (size!4002 (_keys!5677 thiss!1248))))))

(declare-fun res!87090 () Bool)

(assert (=> b!184061 (= res!87090 (= (select (arr!3689 (_keys!5677 thiss!1248)) (index!4660 lt!91022)) key!828))))

(assert (=> b!184061 (=> res!87090 e!121151)))

(assert (=> b!184061 (= e!121153 e!121151)))

(assert (= (and d!54877 c!33017) b!184055))

(assert (= (and d!54877 (not c!33017)) b!184058))

(assert (= (and b!184058 c!33015) b!184054))

(assert (= (and b!184058 (not c!33015)) b!184053))

(assert (= (and d!54877 c!33016) b!184059))

(assert (= (and d!54877 (not c!33016)) b!184057))

(assert (= (and b!184057 res!87089) b!184061))

(assert (= (and b!184061 (not res!87090)) b!184056))

(assert (= (and b!184056 (not res!87088)) b!184060))

(assert (=> d!54877 m!211313))

(declare-fun m!211533 () Bool)

(assert (=> d!54877 m!211533))

(assert (=> d!54877 m!211207))

(declare-fun m!211535 () Bool)

(assert (=> b!184056 m!211535))

(assert (=> b!184053 m!211313))

(declare-fun m!211537 () Bool)

(assert (=> b!184053 m!211537))

(assert (=> b!184053 m!211537))

(declare-fun m!211539 () Bool)

(assert (=> b!184053 m!211539))

(assert (=> b!184060 m!211535))

(assert (=> b!184061 m!211535))

(assert (=> d!54803 d!54877))

(declare-fun d!54879 () Bool)

(declare-fun lt!91028 () (_ BitVec 32))

(declare-fun lt!91027 () (_ BitVec 32))

(assert (=> d!54879 (= lt!91028 (bvmul (bvxor lt!91027 (bvlshr lt!91027 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54879 (= lt!91027 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54879 (and (bvsge (mask!8825 thiss!1248) #b00000000000000000000000000000000) (let ((res!87091 (let ((h!2968 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20021 (bvmul (bvxor h!2968 (bvlshr h!2968 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20021 (bvlshr x!20021 #b00000000000000000000000000001101)) (mask!8825 thiss!1248)))))) (and (bvslt res!87091 (bvadd (mask!8825 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!87091 #b00000000000000000000000000000000))))))

(assert (=> d!54879 (= (toIndex!0 key!828 (mask!8825 thiss!1248)) (bvand (bvxor lt!91028 (bvlshr lt!91028 #b00000000000000000000000000001101)) (mask!8825 thiss!1248)))))

(assert (=> d!54803 d!54879))

(assert (=> d!54803 d!54805))

(declare-fun b!184062 () Bool)

(declare-fun e!121155 () Bool)

(assert (=> b!184062 (= e!121155 tp_is_empty!4305)))

(declare-fun b!184063 () Bool)

(declare-fun e!121154 () Bool)

(assert (=> b!184063 (= e!121154 tp_is_empty!4305)))

(declare-fun mapNonEmpty!7402 () Bool)

(declare-fun mapRes!7402 () Bool)

(declare-fun tp!16384 () Bool)

(assert (=> mapNonEmpty!7402 (= mapRes!7402 (and tp!16384 e!121155))))

(declare-fun mapRest!7402 () (Array (_ BitVec 32) ValueCell!1809))

(declare-fun mapKey!7402 () (_ BitVec 32))

(declare-fun mapValue!7402 () ValueCell!1809)

(assert (=> mapNonEmpty!7402 (= mapRest!7401 (store mapRest!7402 mapKey!7402 mapValue!7402))))

(declare-fun mapIsEmpty!7402 () Bool)

(assert (=> mapIsEmpty!7402 mapRes!7402))

(declare-fun condMapEmpty!7402 () Bool)

(declare-fun mapDefault!7402 () ValueCell!1809)

(assert (=> mapNonEmpty!7401 (= condMapEmpty!7402 (= mapRest!7401 ((as const (Array (_ BitVec 32) ValueCell!1809)) mapDefault!7402)))))

(assert (=> mapNonEmpty!7401 (= tp!16383 (and e!121154 mapRes!7402))))

(assert (= (and mapNonEmpty!7401 condMapEmpty!7402) mapIsEmpty!7402))

(assert (= (and mapNonEmpty!7401 (not condMapEmpty!7402)) mapNonEmpty!7402))

(assert (= (and mapNonEmpty!7402 ((_ is ValueCellFull!1809) mapValue!7402)) b!184062))

(assert (= (and mapNonEmpty!7401 ((_ is ValueCellFull!1809) mapDefault!7402)) b!184063))

(declare-fun m!211541 () Bool)

(assert (=> mapNonEmpty!7402 m!211541))

(declare-fun b_lambda!7211 () Bool)

(assert (= b_lambda!7209 (or (and b!183730 b_free!4533) b_lambda!7211)))

(declare-fun b_lambda!7213 () Bool)

(assert (= b_lambda!7207 (or (and b!183730 b_free!4533) b_lambda!7213)))

(check-sat (not d!54853) (not b!183968) (not b!184001) (not b!183994) (not b_lambda!7205) (not d!54823) (not b_lambda!7211) (not b!183947) (not b_lambda!7213) (not bm!18571) (not b!184012) (not b!183900) (not b!184053) (not b!183901) (not b!183943) (not b!183959) (not b!183946) (not d!54863) (not d!54837) (not d!54817) (not d!54843) (not d!54833) (not bm!18562) (not b!184017) (not d!54873) (not b!183913) (not d!54831) (not d!54867) (not b!184031) (not b!184030) (not d!54871) (not d!54827) (not b!183956) (not b!183873) (not b!183971) (not b!183978) (not d!54821) (not d!54807) (not d!54841) (not b!184028) (not b!183969) (not b!184015) (not b!183916) (not b!183872) (not d!54865) (not b!183884) (not d!54829) (not d!54855) (not b!183888) (not b!184013) (not b!183902) (not b!183952) (not d!54877) (not d!54811) (not b!183958) (not mapNonEmpty!7402) (not b!183918) tp_is_empty!4305 (not b!183886) (not d!54835) (not b!183970) (not d!54825) (not b!183945) (not d!54847) (not bm!18565) (not b_next!4533) (not d!54839) (not b!183949) (not b!184034) (not d!54845) (not d!54861) (not d!54849) (not d!54875) b_and!11117 (not b!183957) (not b!183951) (not d!54819) (not b!183882) (not b!183961) (not b!183953) (not b!183955) (not b!184002) (not bm!18568))
(check-sat b_and!11117 (not b_next!4533))
