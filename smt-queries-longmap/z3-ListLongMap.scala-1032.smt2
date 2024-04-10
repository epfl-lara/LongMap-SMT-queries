; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21876 () Bool)

(assert start!21876)

(declare-fun b!221131 () Bool)

(declare-fun b_free!5943 () Bool)

(declare-fun b_next!5943 () Bool)

(assert (=> b!221131 (= b_free!5943 (not b_next!5943))))

(declare-fun tp!20970 () Bool)

(declare-fun b_and!12841 () Bool)

(assert (=> b!221131 (= tp!20970 b_and!12841)))

(declare-fun b!221116 () Bool)

(declare-fun res!108469 () Bool)

(declare-fun e!143736 () Bool)

(assert (=> b!221116 (=> (not res!108469) (not e!143736))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!221116 (= res!108469 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!20660 () Bool)

(declare-fun call!20664 () Bool)

(declare-datatypes ((V!7387 0))(
  ( (V!7388 (val!2947 Int)) )
))
(declare-datatypes ((ValueCell!2559 0))(
  ( (ValueCellFull!2559 (v!4967 V!7387)) (EmptyCell!2559) )
))
(declare-datatypes ((array!10853 0))(
  ( (array!10854 (arr!5146 (Array (_ BitVec 32) ValueCell!2559)) (size!5479 (_ BitVec 32))) )
))
(declare-datatypes ((array!10855 0))(
  ( (array!10856 (arr!5147 (Array (_ BitVec 32) (_ BitVec 64))) (size!5480 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3018 0))(
  ( (LongMapFixedSize!3019 (defaultEntry!4168 Int) (mask!9976 (_ BitVec 32)) (extraKeys!3905 (_ BitVec 32)) (zeroValue!4009 V!7387) (minValue!4009 V!7387) (_size!1558 (_ BitVec 32)) (_keys!6222 array!10855) (_values!4151 array!10853) (_vacant!1558 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3018)

(declare-fun arrayContainsKey!0 (array!10855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20660 (= call!20664 (arrayContainsKey!0 (_keys!6222 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221117 () Bool)

(declare-fun e!143734 () Bool)

(declare-datatypes ((SeekEntryResult!820 0))(
  ( (MissingZero!820 (index!5450 (_ BitVec 32))) (Found!820 (index!5451 (_ BitVec 32))) (Intermediate!820 (undefined!1632 Bool) (index!5452 (_ BitVec 32)) (x!22992 (_ BitVec 32))) (Undefined!820) (MissingVacant!820 (index!5453 (_ BitVec 32))) )
))
(declare-fun lt!112336 () SeekEntryResult!820)

(get-info :version)

(assert (=> b!221117 (= e!143734 ((_ is Undefined!820) lt!112336))))

(declare-fun b!221118 () Bool)

(declare-fun res!108467 () Bool)

(declare-fun e!143738 () Bool)

(assert (=> b!221118 (=> (not res!108467) (not e!143738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10855 (_ BitVec 32)) Bool)

(assert (=> b!221118 (= res!108467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6222 thiss!1504) (mask!9976 thiss!1504)))))

(declare-fun b!221119 () Bool)

(declare-fun res!108466 () Bool)

(assert (=> b!221119 (=> (not res!108466) (not e!143738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!221119 (= res!108466 (validMask!0 (mask!9976 thiss!1504)))))

(declare-fun b!221120 () Bool)

(declare-fun e!143737 () Bool)

(declare-fun tp_is_empty!5805 () Bool)

(assert (=> b!221120 (= e!143737 tp_is_empty!5805)))

(declare-fun b!221121 () Bool)

(declare-fun res!108464 () Bool)

(declare-fun e!143728 () Bool)

(assert (=> b!221121 (=> (not res!108464) (not e!143728))))

(declare-fun call!20663 () Bool)

(assert (=> b!221121 (= res!108464 call!20663)))

(declare-fun e!143732 () Bool)

(assert (=> b!221121 (= e!143732 e!143728)))

(declare-fun b!221122 () Bool)

(declare-fun res!108465 () Bool)

(assert (=> b!221122 (=> (not res!108465) (not e!143728))))

(assert (=> b!221122 (= res!108465 (= (select (arr!5147 (_keys!6222 thiss!1504)) (index!5450 lt!112336)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!9877 () Bool)

(declare-fun mapRes!9877 () Bool)

(declare-fun tp!20971 () Bool)

(assert (=> mapNonEmpty!9877 (= mapRes!9877 (and tp!20971 e!143737))))

(declare-fun mapValue!9877 () ValueCell!2559)

(declare-fun mapKey!9877 () (_ BitVec 32))

(declare-fun mapRest!9877 () (Array (_ BitVec 32) ValueCell!2559))

(assert (=> mapNonEmpty!9877 (= (arr!5146 (_values!4151 thiss!1504)) (store mapRest!9877 mapKey!9877 mapValue!9877))))

(declare-fun res!108461 () Bool)

(assert (=> start!21876 (=> (not res!108461) (not e!143736))))

(declare-fun valid!1218 (LongMapFixedSize!3018) Bool)

(assert (=> start!21876 (= res!108461 (valid!1218 thiss!1504))))

(assert (=> start!21876 e!143736))

(declare-fun e!143733 () Bool)

(assert (=> start!21876 e!143733))

(assert (=> start!21876 true))

(declare-fun b!221123 () Bool)

(declare-fun e!143727 () Bool)

(assert (=> b!221123 (= e!143727 (not call!20664))))

(declare-fun b!221124 () Bool)

(declare-fun e!143726 () Bool)

(assert (=> b!221124 (= e!143726 tp_is_empty!5805)))

(declare-fun b!221125 () Bool)

(declare-fun c!36776 () Bool)

(assert (=> b!221125 (= c!36776 ((_ is MissingVacant!820) lt!112336))))

(assert (=> b!221125 (= e!143732 e!143734)))

(declare-fun b!221126 () Bool)

(declare-fun e!143731 () Bool)

(assert (=> b!221126 (= e!143731 (and e!143726 mapRes!9877))))

(declare-fun condMapEmpty!9877 () Bool)

(declare-fun mapDefault!9877 () ValueCell!2559)

(assert (=> b!221126 (= condMapEmpty!9877 (= (arr!5146 (_values!4151 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2559)) mapDefault!9877)))))

(declare-fun b!221127 () Bool)

(assert (=> b!221127 (= e!143734 e!143727)))

(declare-fun res!108458 () Bool)

(assert (=> b!221127 (= res!108458 call!20663)))

(assert (=> b!221127 (=> (not res!108458) (not e!143727))))

(declare-fun b!221128 () Bool)

(declare-datatypes ((Unit!6602 0))(
  ( (Unit!6603) )
))
(declare-fun e!143729 () Unit!6602)

(declare-fun Unit!6604 () Unit!6602)

(assert (=> b!221128 (= e!143729 Unit!6604)))

(declare-fun lt!112333 () Unit!6602)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!211 (array!10855 array!10853 (_ BitVec 32) (_ BitVec 32) V!7387 V!7387 (_ BitVec 64) Int) Unit!6602)

(assert (=> b!221128 (= lt!112333 (lemmaInListMapThenSeekEntryOrOpenFindsIt!211 (_keys!6222 thiss!1504) (_values!4151 thiss!1504) (mask!9976 thiss!1504) (extraKeys!3905 thiss!1504) (zeroValue!4009 thiss!1504) (minValue!4009 thiss!1504) key!932 (defaultEntry!4168 thiss!1504)))))

(assert (=> b!221128 false))

(declare-fun b!221129 () Bool)

(assert (=> b!221129 (= e!143728 (not call!20664))))

(declare-fun b!221130 () Bool)

(declare-fun res!108463 () Bool)

(assert (=> b!221130 (=> (not res!108463) (not e!143738))))

(assert (=> b!221130 (= res!108463 (arrayContainsKey!0 (_keys!6222 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun array_inv!3405 (array!10855) Bool)

(declare-fun array_inv!3406 (array!10853) Bool)

(assert (=> b!221131 (= e!143733 (and tp!20970 tp_is_empty!5805 (array_inv!3405 (_keys!6222 thiss!1504)) (array_inv!3406 (_values!4151 thiss!1504)) e!143731))))

(declare-fun bm!20661 () Bool)

(declare-fun c!36777 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20661 (= call!20663 (inRange!0 (ite c!36777 (index!5450 lt!112336) (index!5453 lt!112336)) (mask!9976 thiss!1504)))))

(declare-fun b!221132 () Bool)

(declare-fun res!108462 () Bool)

(assert (=> b!221132 (=> (not res!108462) (not e!143738))))

(assert (=> b!221132 (= res!108462 (and (= (size!5479 (_values!4151 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9976 thiss!1504))) (= (size!5480 (_keys!6222 thiss!1504)) (size!5479 (_values!4151 thiss!1504))) (bvsge (mask!9976 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3905 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3905 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!221133 () Bool)

(declare-fun e!143735 () Bool)

(assert (=> b!221133 (= e!143736 e!143735)))

(declare-fun res!108459 () Bool)

(assert (=> b!221133 (=> (not res!108459) (not e!143735))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!221133 (= res!108459 (or (= lt!112336 (MissingZero!820 index!297)) (= lt!112336 (MissingVacant!820 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10855 (_ BitVec 32)) SeekEntryResult!820)

(assert (=> b!221133 (= lt!112336 (seekEntryOrOpen!0 key!932 (_keys!6222 thiss!1504) (mask!9976 thiss!1504)))))

(declare-fun b!221134 () Bool)

(declare-fun res!108460 () Bool)

(assert (=> b!221134 (= res!108460 (= (select (arr!5147 (_keys!6222 thiss!1504)) (index!5453 lt!112336)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!221134 (=> (not res!108460) (not e!143727))))

(declare-fun mapIsEmpty!9877 () Bool)

(assert (=> mapIsEmpty!9877 mapRes!9877))

(declare-fun b!221135 () Bool)

(assert (=> b!221135 (= e!143738 false)))

(declare-fun lt!112335 () Bool)

(declare-datatypes ((List!3275 0))(
  ( (Nil!3272) (Cons!3271 (h!3919 (_ BitVec 64)) (t!8234 List!3275)) )
))
(declare-fun arrayNoDuplicates!0 (array!10855 (_ BitVec 32) List!3275) Bool)

(assert (=> b!221135 (= lt!112335 (arrayNoDuplicates!0 (_keys!6222 thiss!1504) #b00000000000000000000000000000000 Nil!3272))))

(declare-fun b!221136 () Bool)

(assert (=> b!221136 (= e!143735 e!143738)))

(declare-fun res!108468 () Bool)

(assert (=> b!221136 (=> (not res!108468) (not e!143738))))

(assert (=> b!221136 (= res!108468 (inRange!0 index!297 (mask!9976 thiss!1504)))))

(declare-fun lt!112334 () Unit!6602)

(assert (=> b!221136 (= lt!112334 e!143729)))

(declare-fun c!36775 () Bool)

(declare-datatypes ((tuple2!4372 0))(
  ( (tuple2!4373 (_1!2197 (_ BitVec 64)) (_2!2197 V!7387)) )
))
(declare-datatypes ((List!3276 0))(
  ( (Nil!3273) (Cons!3272 (h!3920 tuple2!4372) (t!8235 List!3276)) )
))
(declare-datatypes ((ListLongMap!3285 0))(
  ( (ListLongMap!3286 (toList!1658 List!3276)) )
))
(declare-fun contains!1501 (ListLongMap!3285 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1186 (array!10855 array!10853 (_ BitVec 32) (_ BitVec 32) V!7387 V!7387 (_ BitVec 32) Int) ListLongMap!3285)

(assert (=> b!221136 (= c!36775 (contains!1501 (getCurrentListMap!1186 (_keys!6222 thiss!1504) (_values!4151 thiss!1504) (mask!9976 thiss!1504) (extraKeys!3905 thiss!1504) (zeroValue!4009 thiss!1504) (minValue!4009 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4168 thiss!1504)) key!932))))

(declare-fun b!221137 () Bool)

(declare-fun lt!112337 () Unit!6602)

(assert (=> b!221137 (= e!143729 lt!112337)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!222 (array!10855 array!10853 (_ BitVec 32) (_ BitVec 32) V!7387 V!7387 (_ BitVec 64) Int) Unit!6602)

(assert (=> b!221137 (= lt!112337 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!222 (_keys!6222 thiss!1504) (_values!4151 thiss!1504) (mask!9976 thiss!1504) (extraKeys!3905 thiss!1504) (zeroValue!4009 thiss!1504) (minValue!4009 thiss!1504) key!932 (defaultEntry!4168 thiss!1504)))))

(assert (=> b!221137 (= c!36777 ((_ is MissingZero!820) lt!112336))))

(assert (=> b!221137 e!143732))

(assert (= (and start!21876 res!108461) b!221116))

(assert (= (and b!221116 res!108469) b!221133))

(assert (= (and b!221133 res!108459) b!221136))

(assert (= (and b!221136 c!36775) b!221128))

(assert (= (and b!221136 (not c!36775)) b!221137))

(assert (= (and b!221137 c!36777) b!221121))

(assert (= (and b!221137 (not c!36777)) b!221125))

(assert (= (and b!221121 res!108464) b!221122))

(assert (= (and b!221122 res!108465) b!221129))

(assert (= (and b!221125 c!36776) b!221127))

(assert (= (and b!221125 (not c!36776)) b!221117))

(assert (= (and b!221127 res!108458) b!221134))

(assert (= (and b!221134 res!108460) b!221123))

(assert (= (or b!221121 b!221127) bm!20661))

(assert (= (or b!221129 b!221123) bm!20660))

(assert (= (and b!221136 res!108468) b!221130))

(assert (= (and b!221130 res!108463) b!221119))

(assert (= (and b!221119 res!108466) b!221132))

(assert (= (and b!221132 res!108462) b!221118))

(assert (= (and b!221118 res!108467) b!221135))

(assert (= (and b!221126 condMapEmpty!9877) mapIsEmpty!9877))

(assert (= (and b!221126 (not condMapEmpty!9877)) mapNonEmpty!9877))

(assert (= (and mapNonEmpty!9877 ((_ is ValueCellFull!2559) mapValue!9877)) b!221120))

(assert (= (and b!221126 ((_ is ValueCellFull!2559) mapDefault!9877)) b!221124))

(assert (= b!221131 b!221126))

(assert (= start!21876 b!221131))

(declare-fun m!245913 () Bool)

(assert (=> b!221119 m!245913))

(declare-fun m!245915 () Bool)

(assert (=> b!221131 m!245915))

(declare-fun m!245917 () Bool)

(assert (=> b!221131 m!245917))

(declare-fun m!245919 () Bool)

(assert (=> mapNonEmpty!9877 m!245919))

(declare-fun m!245921 () Bool)

(assert (=> bm!20661 m!245921))

(declare-fun m!245923 () Bool)

(assert (=> b!221130 m!245923))

(declare-fun m!245925 () Bool)

(assert (=> start!21876 m!245925))

(declare-fun m!245927 () Bool)

(assert (=> b!221134 m!245927))

(declare-fun m!245929 () Bool)

(assert (=> b!221137 m!245929))

(declare-fun m!245931 () Bool)

(assert (=> b!221128 m!245931))

(declare-fun m!245933 () Bool)

(assert (=> b!221122 m!245933))

(declare-fun m!245935 () Bool)

(assert (=> b!221133 m!245935))

(declare-fun m!245937 () Bool)

(assert (=> b!221136 m!245937))

(declare-fun m!245939 () Bool)

(assert (=> b!221136 m!245939))

(assert (=> b!221136 m!245939))

(declare-fun m!245941 () Bool)

(assert (=> b!221136 m!245941))

(assert (=> bm!20660 m!245923))

(declare-fun m!245943 () Bool)

(assert (=> b!221118 m!245943))

(declare-fun m!245945 () Bool)

(assert (=> b!221135 m!245945))

(check-sat (not b!221133) (not b!221136) (not b!221131) (not mapNonEmpty!9877) (not b!221119) (not b!221137) tp_is_empty!5805 (not b!221128) (not b!221118) (not start!21876) b_and!12841 (not b!221130) (not b!221135) (not b_next!5943) (not bm!20661) (not bm!20660))
(check-sat b_and!12841 (not b_next!5943))
