; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24338 () Bool)

(assert start!24338)

(declare-fun b!255035 () Bool)

(declare-fun b_free!6697 () Bool)

(declare-fun b_next!6697 () Bool)

(assert (=> b!255035 (= b_free!6697 (not b_next!6697))))

(declare-fun tp!23382 () Bool)

(declare-fun b_and!13757 () Bool)

(assert (=> b!255035 (= tp!23382 b_and!13757)))

(declare-fun b!255027 () Bool)

(declare-fun e!165312 () Bool)

(declare-fun e!165303 () Bool)

(assert (=> b!255027 (= e!165312 e!165303)))

(declare-fun res!124823 () Bool)

(assert (=> b!255027 (=> (not res!124823) (not e!165303))))

(declare-datatypes ((SeekEntryResult!1120 0))(
  ( (MissingZero!1120 (index!6650 (_ BitVec 32))) (Found!1120 (index!6651 (_ BitVec 32))) (Intermediate!1120 (undefined!1932 Bool) (index!6652 (_ BitVec 32)) (x!24862 (_ BitVec 32))) (Undefined!1120) (MissingVacant!1120 (index!6653 (_ BitVec 32))) )
))
(declare-fun lt!127890 () SeekEntryResult!1120)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!255027 (= res!124823 (or (= lt!127890 (MissingZero!1120 index!297)) (= lt!127890 (MissingVacant!1120 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!8393 0))(
  ( (V!8394 (val!3324 Int)) )
))
(declare-datatypes ((ValueCell!2936 0))(
  ( (ValueCellFull!2936 (v!5402 V!8393)) (EmptyCell!2936) )
))
(declare-datatypes ((array!12449 0))(
  ( (array!12450 (arr!5899 (Array (_ BitVec 32) ValueCell!2936)) (size!6246 (_ BitVec 32))) )
))
(declare-datatypes ((array!12451 0))(
  ( (array!12452 (arr!5900 (Array (_ BitVec 32) (_ BitVec 64))) (size!6247 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3772 0))(
  ( (LongMapFixedSize!3773 (defaultEntry!4704 Int) (mask!10958 (_ BitVec 32)) (extraKeys!4441 (_ BitVec 32)) (zeroValue!4545 V!8393) (minValue!4545 V!8393) (_size!1935 (_ BitVec 32)) (_keys!6860 array!12451) (_values!4687 array!12449) (_vacant!1935 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3772)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12451 (_ BitVec 32)) SeekEntryResult!1120)

(assert (=> b!255027 (= lt!127890 (seekEntryOrOpen!0 key!932 (_keys!6860 thiss!1504) (mask!10958 thiss!1504)))))

(declare-fun b!255028 () Bool)

(declare-fun res!124828 () Bool)

(declare-fun e!165300 () Bool)

(assert (=> b!255028 (=> (not res!124828) (not e!165300))))

(assert (=> b!255028 (= res!124828 (= (select (arr!5900 (_keys!6860 thiss!1504)) (index!6650 lt!127890)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255029 () Bool)

(declare-fun res!124830 () Bool)

(assert (=> b!255029 (=> (not res!124830) (not e!165300))))

(declare-fun call!24069 () Bool)

(assert (=> b!255029 (= res!124830 call!24069)))

(declare-fun e!165311 () Bool)

(assert (=> b!255029 (= e!165311 e!165300)))

(declare-fun b!255030 () Bool)

(declare-fun res!124827 () Bool)

(assert (=> b!255030 (=> (not res!124827) (not e!165312))))

(assert (=> b!255030 (= res!124827 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!255031 () Bool)

(declare-datatypes ((Unit!7880 0))(
  ( (Unit!7881) )
))
(declare-fun e!165310 () Unit!7880)

(declare-fun Unit!7882 () Unit!7880)

(assert (=> b!255031 (= e!165310 Unit!7882)))

(declare-fun lt!127893 () Unit!7880)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!416 (array!12451 array!12449 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 64) Int) Unit!7880)

(assert (=> b!255031 (= lt!127893 (lemmaInListMapThenSeekEntryOrOpenFindsIt!416 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) key!932 (defaultEntry!4704 thiss!1504)))))

(assert (=> b!255031 false))

(declare-fun bm!24065 () Bool)

(declare-fun call!24068 () Bool)

(declare-fun arrayContainsKey!0 (array!12451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24065 (= call!24068 (arrayContainsKey!0 (_keys!6860 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!255033 () Bool)

(declare-fun e!165304 () Bool)

(assert (=> b!255033 (= e!165303 e!165304)))

(declare-fun res!124825 () Bool)

(assert (=> b!255033 (=> (not res!124825) (not e!165304))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255033 (= res!124825 (inRange!0 index!297 (mask!10958 thiss!1504)))))

(declare-fun lt!127888 () Unit!7880)

(assert (=> b!255033 (= lt!127888 e!165310)))

(declare-fun c!43043 () Bool)

(declare-datatypes ((tuple2!4808 0))(
  ( (tuple2!4809 (_1!2415 (_ BitVec 64)) (_2!2415 V!8393)) )
))
(declare-datatypes ((List!3688 0))(
  ( (Nil!3685) (Cons!3684 (h!4346 tuple2!4808) (t!8729 List!3688)) )
))
(declare-datatypes ((ListLongMap!3723 0))(
  ( (ListLongMap!3724 (toList!1877 List!3688)) )
))
(declare-fun lt!127896 () ListLongMap!3723)

(declare-fun contains!1824 (ListLongMap!3723 (_ BitVec 64)) Bool)

(assert (=> b!255033 (= c!43043 (contains!1824 lt!127896 key!932))))

(declare-fun getCurrentListMap!1409 (array!12451 array!12449 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 32) Int) ListLongMap!3723)

(assert (=> b!255033 (= lt!127896 (getCurrentListMap!1409 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun b!255034 () Bool)

(declare-fun res!124829 () Bool)

(assert (=> b!255034 (= res!124829 (= (select (arr!5900 (_keys!6860 thiss!1504)) (index!6653 lt!127890)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!165302 () Bool)

(assert (=> b!255034 (=> (not res!124829) (not e!165302))))

(declare-fun tp_is_empty!6559 () Bool)

(declare-fun e!165308 () Bool)

(declare-fun e!165307 () Bool)

(declare-fun array_inv!3881 (array!12451) Bool)

(declare-fun array_inv!3882 (array!12449) Bool)

(assert (=> b!255035 (= e!165308 (and tp!23382 tp_is_empty!6559 (array_inv!3881 (_keys!6860 thiss!1504)) (array_inv!3882 (_values!4687 thiss!1504)) e!165307))))

(declare-fun b!255036 () Bool)

(declare-fun lt!127886 () Unit!7880)

(assert (=> b!255036 (= e!165310 lt!127886)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!410 (array!12451 array!12449 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 64) Int) Unit!7880)

(assert (=> b!255036 (= lt!127886 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!410 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) key!932 (defaultEntry!4704 thiss!1504)))))

(declare-fun c!43041 () Bool)

(get-info :version)

(assert (=> b!255036 (= c!43041 ((_ is MissingZero!1120) lt!127890))))

(assert (=> b!255036 e!165311))

(declare-fun b!255037 () Bool)

(declare-fun e!165305 () Bool)

(assert (=> b!255037 (= e!165305 ((_ is Undefined!1120) lt!127890))))

(declare-fun b!255038 () Bool)

(declare-fun e!165313 () Unit!7880)

(declare-fun Unit!7883 () Unit!7880)

(assert (=> b!255038 (= e!165313 Unit!7883)))

(declare-fun lt!127889 () Unit!7880)

(declare-fun lemmaArrayContainsKeyThenInListMap!233 (array!12451 array!12449 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 64) (_ BitVec 32) Int) Unit!7880)

(assert (=> b!255038 (= lt!127889 (lemmaArrayContainsKeyThenInListMap!233 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(assert (=> b!255038 false))

(declare-fun b!255039 () Bool)

(declare-fun e!165301 () Bool)

(assert (=> b!255039 (= e!165301 tp_is_empty!6559)))

(declare-fun b!255040 () Bool)

(declare-fun e!165309 () Bool)

(declare-fun mapRes!11157 () Bool)

(assert (=> b!255040 (= e!165307 (and e!165309 mapRes!11157))))

(declare-fun condMapEmpty!11157 () Bool)

(declare-fun mapDefault!11157 () ValueCell!2936)

(assert (=> b!255040 (= condMapEmpty!11157 (= (arr!5899 (_values!4687 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2936)) mapDefault!11157)))))

(declare-fun b!255041 () Bool)

(assert (=> b!255041 (= e!165305 e!165302)))

(declare-fun res!124826 () Bool)

(assert (=> b!255041 (= res!124826 call!24069)))

(assert (=> b!255041 (=> (not res!124826) (not e!165302))))

(declare-fun b!255042 () Bool)

(declare-fun Unit!7884 () Unit!7880)

(assert (=> b!255042 (= e!165313 Unit!7884)))

(declare-fun b!255043 () Bool)

(assert (=> b!255043 (= e!165309 tp_is_empty!6559)))

(declare-fun mapNonEmpty!11157 () Bool)

(declare-fun tp!23381 () Bool)

(assert (=> mapNonEmpty!11157 (= mapRes!11157 (and tp!23381 e!165301))))

(declare-fun mapKey!11157 () (_ BitVec 32))

(declare-fun mapRest!11157 () (Array (_ BitVec 32) ValueCell!2936))

(declare-fun mapValue!11157 () ValueCell!2936)

(assert (=> mapNonEmpty!11157 (= (arr!5899 (_values!4687 thiss!1504)) (store mapRest!11157 mapKey!11157 mapValue!11157))))

(declare-fun b!255044 () Bool)

(declare-fun c!43040 () Bool)

(assert (=> b!255044 (= c!43040 ((_ is MissingVacant!1120) lt!127890))))

(assert (=> b!255044 (= e!165311 e!165305)))

(declare-fun res!124824 () Bool)

(assert (=> start!24338 (=> (not res!124824) (not e!165312))))

(declare-fun valid!1480 (LongMapFixedSize!3772) Bool)

(assert (=> start!24338 (= res!124824 (valid!1480 thiss!1504))))

(assert (=> start!24338 e!165312))

(assert (=> start!24338 e!165308))

(assert (=> start!24338 true))

(assert (=> start!24338 tp_is_empty!6559))

(declare-fun b!255032 () Bool)

(assert (=> b!255032 (= e!165304 (not (bvsge index!297 #b00000000000000000000000000000000)))))

(declare-fun lt!127892 () array!12451)

(declare-fun v!346 () V!8393)

(declare-fun +!676 (ListLongMap!3723 tuple2!4808) ListLongMap!3723)

(assert (=> b!255032 (= (+!676 lt!127896 (tuple2!4809 key!932 v!346)) (getCurrentListMap!1409 lt!127892 (array!12450 (store (arr!5899 (_values!4687 thiss!1504)) index!297 (ValueCellFull!2936 v!346)) (size!6246 (_values!4687 thiss!1504))) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun lt!127891 () Unit!7880)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!91 (array!12451 array!12449 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 32) (_ BitVec 64) V!8393 Int) Unit!7880)

(assert (=> b!255032 (= lt!127891 (lemmaAddValidKeyToArrayThenAddPairToListMap!91 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) index!297 key!932 v!346 (defaultEntry!4704 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12451 (_ BitVec 32)) Bool)

(assert (=> b!255032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127892 (mask!10958 thiss!1504))))

(declare-fun lt!127885 () Unit!7880)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12451 (_ BitVec 32) (_ BitVec 32)) Unit!7880)

(assert (=> b!255032 (= lt!127885 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6860 thiss!1504) index!297 (mask!10958 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12451 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!255032 (= (arrayCountValidKeys!0 lt!127892 #b00000000000000000000000000000000 (size!6247 (_keys!6860 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6860 thiss!1504) #b00000000000000000000000000000000 (size!6247 (_keys!6860 thiss!1504)))))))

(declare-fun lt!127894 () Unit!7880)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12451 (_ BitVec 32) (_ BitVec 64)) Unit!7880)

(assert (=> b!255032 (= lt!127894 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6860 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3689 0))(
  ( (Nil!3686) (Cons!3685 (h!4347 (_ BitVec 64)) (t!8730 List!3689)) )
))
(declare-fun arrayNoDuplicates!0 (array!12451 (_ BitVec 32) List!3689) Bool)

(assert (=> b!255032 (arrayNoDuplicates!0 lt!127892 #b00000000000000000000000000000000 Nil!3686)))

(assert (=> b!255032 (= lt!127892 (array!12452 (store (arr!5900 (_keys!6860 thiss!1504)) index!297 key!932) (size!6247 (_keys!6860 thiss!1504))))))

(declare-fun lt!127895 () Unit!7880)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12451 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3689) Unit!7880)

(assert (=> b!255032 (= lt!127895 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6860 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3686))))

(declare-fun lt!127887 () Unit!7880)

(assert (=> b!255032 (= lt!127887 e!165313)))

(declare-fun c!43042 () Bool)

(assert (=> b!255032 (= c!43042 (arrayContainsKey!0 (_keys!6860 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!255045 () Bool)

(assert (=> b!255045 (= e!165302 (not call!24068))))

(declare-fun bm!24066 () Bool)

(assert (=> bm!24066 (= call!24069 (inRange!0 (ite c!43041 (index!6650 lt!127890) (index!6653 lt!127890)) (mask!10958 thiss!1504)))))

(declare-fun mapIsEmpty!11157 () Bool)

(assert (=> mapIsEmpty!11157 mapRes!11157))

(declare-fun b!255046 () Bool)

(assert (=> b!255046 (= e!165300 (not call!24068))))

(assert (= (and start!24338 res!124824) b!255030))

(assert (= (and b!255030 res!124827) b!255027))

(assert (= (and b!255027 res!124823) b!255033))

(assert (= (and b!255033 c!43043) b!255031))

(assert (= (and b!255033 (not c!43043)) b!255036))

(assert (= (and b!255036 c!43041) b!255029))

(assert (= (and b!255036 (not c!43041)) b!255044))

(assert (= (and b!255029 res!124830) b!255028))

(assert (= (and b!255028 res!124828) b!255046))

(assert (= (and b!255044 c!43040) b!255041))

(assert (= (and b!255044 (not c!43040)) b!255037))

(assert (= (and b!255041 res!124826) b!255034))

(assert (= (and b!255034 res!124829) b!255045))

(assert (= (or b!255029 b!255041) bm!24066))

(assert (= (or b!255046 b!255045) bm!24065))

(assert (= (and b!255033 res!124825) b!255032))

(assert (= (and b!255032 c!43042) b!255038))

(assert (= (and b!255032 (not c!43042)) b!255042))

(assert (= (and b!255040 condMapEmpty!11157) mapIsEmpty!11157))

(assert (= (and b!255040 (not condMapEmpty!11157)) mapNonEmpty!11157))

(assert (= (and mapNonEmpty!11157 ((_ is ValueCellFull!2936) mapValue!11157)) b!255039))

(assert (= (and b!255040 ((_ is ValueCellFull!2936) mapDefault!11157)) b!255043))

(assert (= b!255035 b!255040))

(assert (= start!24338 b!255035))

(declare-fun m!270667 () Bool)

(assert (=> b!255036 m!270667))

(declare-fun m!270669 () Bool)

(assert (=> start!24338 m!270669))

(declare-fun m!270671 () Bool)

(assert (=> b!255038 m!270671))

(declare-fun m!270673 () Bool)

(assert (=> b!255031 m!270673))

(declare-fun m!270675 () Bool)

(assert (=> b!255033 m!270675))

(declare-fun m!270677 () Bool)

(assert (=> b!255033 m!270677))

(declare-fun m!270679 () Bool)

(assert (=> b!255033 m!270679))

(declare-fun m!270681 () Bool)

(assert (=> bm!24066 m!270681))

(declare-fun m!270683 () Bool)

(assert (=> b!255027 m!270683))

(declare-fun m!270685 () Bool)

(assert (=> b!255034 m!270685))

(declare-fun m!270687 () Bool)

(assert (=> b!255035 m!270687))

(declare-fun m!270689 () Bool)

(assert (=> b!255035 m!270689))

(declare-fun m!270691 () Bool)

(assert (=> b!255032 m!270691))

(declare-fun m!270693 () Bool)

(assert (=> b!255032 m!270693))

(declare-fun m!270695 () Bool)

(assert (=> b!255032 m!270695))

(declare-fun m!270697 () Bool)

(assert (=> b!255032 m!270697))

(declare-fun m!270699 () Bool)

(assert (=> b!255032 m!270699))

(declare-fun m!270701 () Bool)

(assert (=> b!255032 m!270701))

(declare-fun m!270703 () Bool)

(assert (=> b!255032 m!270703))

(declare-fun m!270705 () Bool)

(assert (=> b!255032 m!270705))

(declare-fun m!270707 () Bool)

(assert (=> b!255032 m!270707))

(declare-fun m!270709 () Bool)

(assert (=> b!255032 m!270709))

(declare-fun m!270711 () Bool)

(assert (=> b!255032 m!270711))

(declare-fun m!270713 () Bool)

(assert (=> b!255032 m!270713))

(declare-fun m!270715 () Bool)

(assert (=> b!255032 m!270715))

(assert (=> bm!24065 m!270691))

(declare-fun m!270717 () Bool)

(assert (=> b!255028 m!270717))

(declare-fun m!270719 () Bool)

(assert (=> mapNonEmpty!11157 m!270719))

(check-sat (not b!255033) (not b!255036) (not b_next!6697) (not bm!24066) (not start!24338) (not b!255027) tp_is_empty!6559 (not b!255032) (not b!255031) b_and!13757 (not b!255035) (not mapNonEmpty!11157) (not bm!24065) (not b!255038))
(check-sat b_and!13757 (not b_next!6697))
(get-model)

(declare-fun b!255183 () Bool)

(declare-fun e!165406 () Bool)

(declare-fun lt!127974 () SeekEntryResult!1120)

(assert (=> b!255183 (= e!165406 ((_ is Undefined!1120) lt!127974))))

(declare-fun b!255184 () Bool)

(declare-fun e!165409 () Bool)

(assert (=> b!255184 (= e!165409 e!165406)))

(declare-fun c!43073 () Bool)

(assert (=> b!255184 (= c!43073 ((_ is MissingVacant!1120) lt!127974))))

(declare-fun b!255185 () Bool)

(declare-fun e!165408 () Bool)

(declare-fun call!24087 () Bool)

(assert (=> b!255185 (= e!165408 (not call!24087))))

(declare-fun b!255186 () Bool)

(assert (=> b!255186 (= e!165409 e!165408)))

(declare-fun res!124888 () Bool)

(declare-fun call!24086 () Bool)

(assert (=> b!255186 (= res!124888 call!24086)))

(assert (=> b!255186 (=> (not res!124888) (not e!165408))))

(declare-fun d!61605 () Bool)

(assert (=> d!61605 e!165409))

(declare-fun c!43072 () Bool)

(assert (=> d!61605 (= c!43072 ((_ is MissingZero!1120) lt!127974))))

(assert (=> d!61605 (= lt!127974 (seekEntryOrOpen!0 key!932 (_keys!6860 thiss!1504) (mask!10958 thiss!1504)))))

(declare-fun lt!127973 () Unit!7880)

(declare-fun choose!1223 (array!12451 array!12449 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 64) Int) Unit!7880)

(assert (=> d!61605 (= lt!127973 (choose!1223 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) key!932 (defaultEntry!4704 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!61605 (validMask!0 (mask!10958 thiss!1504))))

(assert (=> d!61605 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!410 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) key!932 (defaultEntry!4704 thiss!1504)) lt!127973)))

(declare-fun b!255187 () Bool)

(declare-fun res!124890 () Bool)

(declare-fun e!165407 () Bool)

(assert (=> b!255187 (=> (not res!124890) (not e!165407))))

(assert (=> b!255187 (= res!124890 (= (select (arr!5900 (_keys!6860 thiss!1504)) (index!6653 lt!127974)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!255187 (and (bvsge (index!6653 lt!127974) #b00000000000000000000000000000000) (bvslt (index!6653 lt!127974) (size!6247 (_keys!6860 thiss!1504))))))

(declare-fun bm!24083 () Bool)

(assert (=> bm!24083 (= call!24086 (inRange!0 (ite c!43072 (index!6650 lt!127974) (index!6653 lt!127974)) (mask!10958 thiss!1504)))))

(declare-fun bm!24084 () Bool)

(assert (=> bm!24084 (= call!24087 (arrayContainsKey!0 (_keys!6860 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!255188 () Bool)

(assert (=> b!255188 (= e!165407 (not call!24087))))

(declare-fun b!255189 () Bool)

(declare-fun res!124887 () Bool)

(assert (=> b!255189 (=> (not res!124887) (not e!165407))))

(assert (=> b!255189 (= res!124887 call!24086)))

(assert (=> b!255189 (= e!165406 e!165407)))

(declare-fun b!255190 () Bool)

(assert (=> b!255190 (and (bvsge (index!6650 lt!127974) #b00000000000000000000000000000000) (bvslt (index!6650 lt!127974) (size!6247 (_keys!6860 thiss!1504))))))

(declare-fun res!124889 () Bool)

(assert (=> b!255190 (= res!124889 (= (select (arr!5900 (_keys!6860 thiss!1504)) (index!6650 lt!127974)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!255190 (=> (not res!124889) (not e!165408))))

(assert (= (and d!61605 c!43072) b!255186))

(assert (= (and d!61605 (not c!43072)) b!255184))

(assert (= (and b!255186 res!124888) b!255190))

(assert (= (and b!255190 res!124889) b!255185))

(assert (= (and b!255184 c!43073) b!255189))

(assert (= (and b!255184 (not c!43073)) b!255183))

(assert (= (and b!255189 res!124887) b!255187))

(assert (= (and b!255187 res!124890) b!255188))

(assert (= (or b!255186 b!255189) bm!24083))

(assert (= (or b!255185 b!255188) bm!24084))

(declare-fun m!270829 () Bool)

(assert (=> bm!24083 m!270829))

(declare-fun m!270831 () Bool)

(assert (=> b!255190 m!270831))

(assert (=> d!61605 m!270683))

(declare-fun m!270833 () Bool)

(assert (=> d!61605 m!270833))

(declare-fun m!270835 () Bool)

(assert (=> d!61605 m!270835))

(assert (=> bm!24084 m!270691))

(declare-fun m!270837 () Bool)

(assert (=> b!255187 m!270837))

(assert (=> b!255036 d!61605))

(declare-fun d!61607 () Bool)

(declare-fun e!165412 () Bool)

(assert (=> d!61607 e!165412))

(declare-fun res!124895 () Bool)

(assert (=> d!61607 (=> (not res!124895) (not e!165412))))

(declare-fun lt!127979 () SeekEntryResult!1120)

(assert (=> d!61607 (= res!124895 ((_ is Found!1120) lt!127979))))

(assert (=> d!61607 (= lt!127979 (seekEntryOrOpen!0 key!932 (_keys!6860 thiss!1504) (mask!10958 thiss!1504)))))

(declare-fun lt!127980 () Unit!7880)

(declare-fun choose!1224 (array!12451 array!12449 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 64) Int) Unit!7880)

(assert (=> d!61607 (= lt!127980 (choose!1224 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) key!932 (defaultEntry!4704 thiss!1504)))))

(assert (=> d!61607 (validMask!0 (mask!10958 thiss!1504))))

(assert (=> d!61607 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!416 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) key!932 (defaultEntry!4704 thiss!1504)) lt!127980)))

(declare-fun b!255195 () Bool)

(declare-fun res!124896 () Bool)

(assert (=> b!255195 (=> (not res!124896) (not e!165412))))

(assert (=> b!255195 (= res!124896 (inRange!0 (index!6651 lt!127979) (mask!10958 thiss!1504)))))

(declare-fun b!255196 () Bool)

(assert (=> b!255196 (= e!165412 (= (select (arr!5900 (_keys!6860 thiss!1504)) (index!6651 lt!127979)) key!932))))

(assert (=> b!255196 (and (bvsge (index!6651 lt!127979) #b00000000000000000000000000000000) (bvslt (index!6651 lt!127979) (size!6247 (_keys!6860 thiss!1504))))))

(assert (= (and d!61607 res!124895) b!255195))

(assert (= (and b!255195 res!124896) b!255196))

(assert (=> d!61607 m!270683))

(declare-fun m!270839 () Bool)

(assert (=> d!61607 m!270839))

(assert (=> d!61607 m!270835))

(declare-fun m!270841 () Bool)

(assert (=> b!255195 m!270841))

(declare-fun m!270843 () Bool)

(assert (=> b!255196 m!270843))

(assert (=> b!255031 d!61607))

(declare-fun d!61609 () Bool)

(assert (=> d!61609 (= (array_inv!3881 (_keys!6860 thiss!1504)) (bvsge (size!6247 (_keys!6860 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255035 d!61609))

(declare-fun d!61611 () Bool)

(assert (=> d!61611 (= (array_inv!3882 (_values!4687 thiss!1504)) (bvsge (size!6246 (_values!4687 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255035 d!61611))

(declare-fun d!61613 () Bool)

(declare-fun res!124903 () Bool)

(declare-fun e!165415 () Bool)

(assert (=> d!61613 (=> (not res!124903) (not e!165415))))

(declare-fun simpleValid!271 (LongMapFixedSize!3772) Bool)

(assert (=> d!61613 (= res!124903 (simpleValid!271 thiss!1504))))

(assert (=> d!61613 (= (valid!1480 thiss!1504) e!165415)))

(declare-fun b!255203 () Bool)

(declare-fun res!124904 () Bool)

(assert (=> b!255203 (=> (not res!124904) (not e!165415))))

(assert (=> b!255203 (= res!124904 (= (arrayCountValidKeys!0 (_keys!6860 thiss!1504) #b00000000000000000000000000000000 (size!6247 (_keys!6860 thiss!1504))) (_size!1935 thiss!1504)))))

(declare-fun b!255204 () Bool)

(declare-fun res!124905 () Bool)

(assert (=> b!255204 (=> (not res!124905) (not e!165415))))

(assert (=> b!255204 (= res!124905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6860 thiss!1504) (mask!10958 thiss!1504)))))

(declare-fun b!255205 () Bool)

(assert (=> b!255205 (= e!165415 (arrayNoDuplicates!0 (_keys!6860 thiss!1504) #b00000000000000000000000000000000 Nil!3686))))

(assert (= (and d!61613 res!124903) b!255203))

(assert (= (and b!255203 res!124904) b!255204))

(assert (= (and b!255204 res!124905) b!255205))

(declare-fun m!270845 () Bool)

(assert (=> d!61613 m!270845))

(assert (=> b!255203 m!270707))

(declare-fun m!270847 () Bool)

(assert (=> b!255204 m!270847))

(declare-fun m!270849 () Bool)

(assert (=> b!255205 m!270849))

(assert (=> start!24338 d!61613))

(declare-fun d!61615 () Bool)

(assert (=> d!61615 (= (inRange!0 index!297 (mask!10958 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10958 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!255033 d!61615))

(declare-fun d!61617 () Bool)

(declare-fun e!165421 () Bool)

(assert (=> d!61617 e!165421))

(declare-fun res!124908 () Bool)

(assert (=> d!61617 (=> res!124908 e!165421)))

(declare-fun lt!127992 () Bool)

(assert (=> d!61617 (= res!124908 (not lt!127992))))

(declare-fun lt!127991 () Bool)

(assert (=> d!61617 (= lt!127992 lt!127991)))

(declare-fun lt!127989 () Unit!7880)

(declare-fun e!165420 () Unit!7880)

(assert (=> d!61617 (= lt!127989 e!165420)))

(declare-fun c!43076 () Bool)

(assert (=> d!61617 (= c!43076 lt!127991)))

(declare-fun containsKey!298 (List!3688 (_ BitVec 64)) Bool)

(assert (=> d!61617 (= lt!127991 (containsKey!298 (toList!1877 lt!127896) key!932))))

(assert (=> d!61617 (= (contains!1824 lt!127896 key!932) lt!127992)))

(declare-fun b!255212 () Bool)

(declare-fun lt!127990 () Unit!7880)

(assert (=> b!255212 (= e!165420 lt!127990)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!246 (List!3688 (_ BitVec 64)) Unit!7880)

(assert (=> b!255212 (= lt!127990 (lemmaContainsKeyImpliesGetValueByKeyDefined!246 (toList!1877 lt!127896) key!932))))

(declare-datatypes ((Option!313 0))(
  ( (Some!312 (v!5407 V!8393)) (None!311) )
))
(declare-fun isDefined!247 (Option!313) Bool)

(declare-fun getValueByKey!307 (List!3688 (_ BitVec 64)) Option!313)

(assert (=> b!255212 (isDefined!247 (getValueByKey!307 (toList!1877 lt!127896) key!932))))

(declare-fun b!255213 () Bool)

(declare-fun Unit!7893 () Unit!7880)

(assert (=> b!255213 (= e!165420 Unit!7893)))

(declare-fun b!255214 () Bool)

(assert (=> b!255214 (= e!165421 (isDefined!247 (getValueByKey!307 (toList!1877 lt!127896) key!932)))))

(assert (= (and d!61617 c!43076) b!255212))

(assert (= (and d!61617 (not c!43076)) b!255213))

(assert (= (and d!61617 (not res!124908)) b!255214))

(declare-fun m!270851 () Bool)

(assert (=> d!61617 m!270851))

(declare-fun m!270853 () Bool)

(assert (=> b!255212 m!270853))

(declare-fun m!270855 () Bool)

(assert (=> b!255212 m!270855))

(assert (=> b!255212 m!270855))

(declare-fun m!270857 () Bool)

(assert (=> b!255212 m!270857))

(assert (=> b!255214 m!270855))

(assert (=> b!255214 m!270855))

(assert (=> b!255214 m!270857))

(assert (=> b!255033 d!61617))

(declare-fun bm!24099 () Bool)

(declare-fun call!24103 () Bool)

(declare-fun lt!128055 () ListLongMap!3723)

(assert (=> bm!24099 (= call!24103 (contains!1824 lt!128055 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255257 () Bool)

(declare-fun e!165458 () ListLongMap!3723)

(declare-fun call!24107 () ListLongMap!3723)

(assert (=> b!255257 (= e!165458 call!24107)))

(declare-fun b!255258 () Bool)

(declare-fun e!165453 () Bool)

(declare-fun call!24105 () Bool)

(assert (=> b!255258 (= e!165453 (not call!24105))))

(declare-fun b!255259 () Bool)

(declare-fun e!165457 () ListLongMap!3723)

(assert (=> b!255259 (= e!165457 call!24107)))

(declare-fun bm!24100 () Bool)

(assert (=> bm!24100 (= call!24105 (contains!1824 lt!128055 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24101 () Bool)

(declare-fun call!24102 () ListLongMap!3723)

(declare-fun getCurrentListMapNoExtraKeys!564 (array!12451 array!12449 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 32) Int) ListLongMap!3723)

(assert (=> bm!24101 (= call!24102 (getCurrentListMapNoExtraKeys!564 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun b!255261 () Bool)

(declare-fun e!165456 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!255261 (= e!165456 (validKeyInArray!0 (select (arr!5900 (_keys!6860 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!255262 () Bool)

(declare-fun e!165450 () Bool)

(assert (=> b!255262 (= e!165450 e!165453)))

(declare-fun c!43089 () Bool)

(assert (=> b!255262 (= c!43089 (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!255263 () Bool)

(declare-fun e!165452 () ListLongMap!3723)

(assert (=> b!255263 (= e!165452 e!165458)))

(declare-fun c!43094 () Bool)

(assert (=> b!255263 (= c!43094 (and (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24102 () Bool)

(declare-fun call!24108 () ListLongMap!3723)

(assert (=> bm!24102 (= call!24108 call!24102)))

(declare-fun b!255264 () Bool)

(declare-fun res!124928 () Bool)

(assert (=> b!255264 (=> (not res!124928) (not e!165450))))

(declare-fun e!165448 () Bool)

(assert (=> b!255264 (= res!124928 e!165448)))

(declare-fun res!124929 () Bool)

(assert (=> b!255264 (=> res!124929 e!165448)))

(declare-fun e!165449 () Bool)

(assert (=> b!255264 (= res!124929 (not e!165449))))

(declare-fun res!124927 () Bool)

(assert (=> b!255264 (=> (not res!124927) (not e!165449))))

(assert (=> b!255264 (= res!124927 (bvslt #b00000000000000000000000000000000 (size!6247 (_keys!6860 thiss!1504))))))

(declare-fun b!255265 () Bool)

(declare-fun e!165454 () Bool)

(declare-fun apply!248 (ListLongMap!3723 (_ BitVec 64)) V!8393)

(declare-fun get!3041 (ValueCell!2936 V!8393) V!8393)

(declare-fun dynLambda!591 (Int (_ BitVec 64)) V!8393)

(assert (=> b!255265 (= e!165454 (= (apply!248 lt!128055 (select (arr!5900 (_keys!6860 thiss!1504)) #b00000000000000000000000000000000)) (get!3041 (select (arr!5899 (_values!4687 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!591 (defaultEntry!4704 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!255265 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6246 (_values!4687 thiss!1504))))))

(assert (=> b!255265 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6247 (_keys!6860 thiss!1504))))))

(declare-fun b!255266 () Bool)

(declare-fun e!165460 () Unit!7880)

(declare-fun Unit!7894 () Unit!7880)

(assert (=> b!255266 (= e!165460 Unit!7894)))

(declare-fun c!43092 () Bool)

(declare-fun bm!24103 () Bool)

(declare-fun call!24104 () ListLongMap!3723)

(declare-fun call!24106 () ListLongMap!3723)

(assert (=> bm!24103 (= call!24106 (+!676 (ite c!43092 call!24102 (ite c!43094 call!24108 call!24104)) (ite (or c!43092 c!43094) (tuple2!4809 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4545 thiss!1504)) (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4545 thiss!1504)))))))

(declare-fun b!255267 () Bool)

(declare-fun e!165455 () Bool)

(assert (=> b!255267 (= e!165455 (= (apply!248 lt!128055 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4545 thiss!1504)))))

(declare-fun b!255268 () Bool)

(declare-fun e!165451 () Bool)

(assert (=> b!255268 (= e!165451 (not call!24103))))

(declare-fun bm!24104 () Bool)

(assert (=> bm!24104 (= call!24107 call!24106)))

(declare-fun b!255269 () Bool)

(assert (=> b!255269 (= e!165449 (validKeyInArray!0 (select (arr!5900 (_keys!6860 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!255270 () Bool)

(declare-fun res!124933 () Bool)

(assert (=> b!255270 (=> (not res!124933) (not e!165450))))

(assert (=> b!255270 (= res!124933 e!165451)))

(declare-fun c!43091 () Bool)

(assert (=> b!255270 (= c!43091 (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!255271 () Bool)

(declare-fun e!165459 () Bool)

(assert (=> b!255271 (= e!165451 e!165459)))

(declare-fun res!124934 () Bool)

(assert (=> b!255271 (= res!124934 call!24103)))

(assert (=> b!255271 (=> (not res!124934) (not e!165459))))

(declare-fun b!255272 () Bool)

(assert (=> b!255272 (= e!165459 (= (apply!248 lt!128055 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4545 thiss!1504)))))

(declare-fun b!255273 () Bool)

(assert (=> b!255273 (= e!165453 e!165455)))

(declare-fun res!124935 () Bool)

(assert (=> b!255273 (= res!124935 call!24105)))

(assert (=> b!255273 (=> (not res!124935) (not e!165455))))

(declare-fun d!61619 () Bool)

(assert (=> d!61619 e!165450))

(declare-fun res!124931 () Bool)

(assert (=> d!61619 (=> (not res!124931) (not e!165450))))

(assert (=> d!61619 (= res!124931 (or (bvsge #b00000000000000000000000000000000 (size!6247 (_keys!6860 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6247 (_keys!6860 thiss!1504))))))))

(declare-fun lt!128038 () ListLongMap!3723)

(assert (=> d!61619 (= lt!128055 lt!128038)))

(declare-fun lt!128042 () Unit!7880)

(assert (=> d!61619 (= lt!128042 e!165460)))

(declare-fun c!43093 () Bool)

(assert (=> d!61619 (= c!43093 e!165456)))

(declare-fun res!124932 () Bool)

(assert (=> d!61619 (=> (not res!124932) (not e!165456))))

(assert (=> d!61619 (= res!124932 (bvslt #b00000000000000000000000000000000 (size!6247 (_keys!6860 thiss!1504))))))

(assert (=> d!61619 (= lt!128038 e!165452)))

(assert (=> d!61619 (= c!43092 (and (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61619 (validMask!0 (mask!10958 thiss!1504))))

(assert (=> d!61619 (= (getCurrentListMap!1409 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)) lt!128055)))

(declare-fun b!255260 () Bool)

(assert (=> b!255260 (= e!165457 call!24104)))

(declare-fun b!255274 () Bool)

(assert (=> b!255274 (= e!165448 e!165454)))

(declare-fun res!124930 () Bool)

(assert (=> b!255274 (=> (not res!124930) (not e!165454))))

(assert (=> b!255274 (= res!124930 (contains!1824 lt!128055 (select (arr!5900 (_keys!6860 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!255274 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6247 (_keys!6860 thiss!1504))))))

(declare-fun bm!24105 () Bool)

(assert (=> bm!24105 (= call!24104 call!24108)))

(declare-fun b!255275 () Bool)

(assert (=> b!255275 (= e!165452 (+!676 call!24106 (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4545 thiss!1504))))))

(declare-fun b!255276 () Bool)

(declare-fun c!43090 () Bool)

(assert (=> b!255276 (= c!43090 (and (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!255276 (= e!165458 e!165457)))

(declare-fun b!255277 () Bool)

(declare-fun lt!128051 () Unit!7880)

(assert (=> b!255277 (= e!165460 lt!128051)))

(declare-fun lt!128057 () ListLongMap!3723)

(assert (=> b!255277 (= lt!128057 (getCurrentListMapNoExtraKeys!564 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun lt!128049 () (_ BitVec 64))

(assert (=> b!255277 (= lt!128049 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128048 () (_ BitVec 64))

(assert (=> b!255277 (= lt!128048 (select (arr!5900 (_keys!6860 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128047 () Unit!7880)

(declare-fun addStillContains!224 (ListLongMap!3723 (_ BitVec 64) V!8393 (_ BitVec 64)) Unit!7880)

(assert (=> b!255277 (= lt!128047 (addStillContains!224 lt!128057 lt!128049 (zeroValue!4545 thiss!1504) lt!128048))))

(assert (=> b!255277 (contains!1824 (+!676 lt!128057 (tuple2!4809 lt!128049 (zeroValue!4545 thiss!1504))) lt!128048)))

(declare-fun lt!128058 () Unit!7880)

(assert (=> b!255277 (= lt!128058 lt!128047)))

(declare-fun lt!128052 () ListLongMap!3723)

(assert (=> b!255277 (= lt!128052 (getCurrentListMapNoExtraKeys!564 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun lt!128040 () (_ BitVec 64))

(assert (=> b!255277 (= lt!128040 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128054 () (_ BitVec 64))

(assert (=> b!255277 (= lt!128054 (select (arr!5900 (_keys!6860 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128037 () Unit!7880)

(declare-fun addApplyDifferent!224 (ListLongMap!3723 (_ BitVec 64) V!8393 (_ BitVec 64)) Unit!7880)

(assert (=> b!255277 (= lt!128037 (addApplyDifferent!224 lt!128052 lt!128040 (minValue!4545 thiss!1504) lt!128054))))

(assert (=> b!255277 (= (apply!248 (+!676 lt!128052 (tuple2!4809 lt!128040 (minValue!4545 thiss!1504))) lt!128054) (apply!248 lt!128052 lt!128054))))

(declare-fun lt!128044 () Unit!7880)

(assert (=> b!255277 (= lt!128044 lt!128037)))

(declare-fun lt!128046 () ListLongMap!3723)

(assert (=> b!255277 (= lt!128046 (getCurrentListMapNoExtraKeys!564 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun lt!128050 () (_ BitVec 64))

(assert (=> b!255277 (= lt!128050 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128045 () (_ BitVec 64))

(assert (=> b!255277 (= lt!128045 (select (arr!5900 (_keys!6860 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128039 () Unit!7880)

(assert (=> b!255277 (= lt!128039 (addApplyDifferent!224 lt!128046 lt!128050 (zeroValue!4545 thiss!1504) lt!128045))))

(assert (=> b!255277 (= (apply!248 (+!676 lt!128046 (tuple2!4809 lt!128050 (zeroValue!4545 thiss!1504))) lt!128045) (apply!248 lt!128046 lt!128045))))

(declare-fun lt!128056 () Unit!7880)

(assert (=> b!255277 (= lt!128056 lt!128039)))

(declare-fun lt!128041 () ListLongMap!3723)

(assert (=> b!255277 (= lt!128041 (getCurrentListMapNoExtraKeys!564 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun lt!128043 () (_ BitVec 64))

(assert (=> b!255277 (= lt!128043 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128053 () (_ BitVec 64))

(assert (=> b!255277 (= lt!128053 (select (arr!5900 (_keys!6860 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255277 (= lt!128051 (addApplyDifferent!224 lt!128041 lt!128043 (minValue!4545 thiss!1504) lt!128053))))

(assert (=> b!255277 (= (apply!248 (+!676 lt!128041 (tuple2!4809 lt!128043 (minValue!4545 thiss!1504))) lt!128053) (apply!248 lt!128041 lt!128053))))

(assert (= (and d!61619 c!43092) b!255275))

(assert (= (and d!61619 (not c!43092)) b!255263))

(assert (= (and b!255263 c!43094) b!255257))

(assert (= (and b!255263 (not c!43094)) b!255276))

(assert (= (and b!255276 c!43090) b!255259))

(assert (= (and b!255276 (not c!43090)) b!255260))

(assert (= (or b!255259 b!255260) bm!24105))

(assert (= (or b!255257 bm!24105) bm!24102))

(assert (= (or b!255257 b!255259) bm!24104))

(assert (= (or b!255275 bm!24102) bm!24101))

(assert (= (or b!255275 bm!24104) bm!24103))

(assert (= (and d!61619 res!124932) b!255261))

(assert (= (and d!61619 c!43093) b!255277))

(assert (= (and d!61619 (not c!43093)) b!255266))

(assert (= (and d!61619 res!124931) b!255264))

(assert (= (and b!255264 res!124927) b!255269))

(assert (= (and b!255264 (not res!124929)) b!255274))

(assert (= (and b!255274 res!124930) b!255265))

(assert (= (and b!255264 res!124928) b!255270))

(assert (= (and b!255270 c!43091) b!255271))

(assert (= (and b!255270 (not c!43091)) b!255268))

(assert (= (and b!255271 res!124934) b!255272))

(assert (= (or b!255271 b!255268) bm!24099))

(assert (= (and b!255270 res!124933) b!255262))

(assert (= (and b!255262 c!43089) b!255273))

(assert (= (and b!255262 (not c!43089)) b!255258))

(assert (= (and b!255273 res!124935) b!255267))

(assert (= (or b!255273 b!255258) bm!24100))

(declare-fun b_lambda!8161 () Bool)

(assert (=> (not b_lambda!8161) (not b!255265)))

(declare-fun t!8735 () Bool)

(declare-fun tb!3001 () Bool)

(assert (=> (and b!255035 (= (defaultEntry!4704 thiss!1504) (defaultEntry!4704 thiss!1504)) t!8735) tb!3001))

(declare-fun result!5341 () Bool)

(assert (=> tb!3001 (= result!5341 tp_is_empty!6559)))

(assert (=> b!255265 t!8735))

(declare-fun b_and!13763 () Bool)

(assert (= b_and!13757 (and (=> t!8735 result!5341) b_and!13763)))

(declare-fun m!270859 () Bool)

(assert (=> b!255265 m!270859))

(declare-fun m!270861 () Bool)

(assert (=> b!255265 m!270861))

(declare-fun m!270863 () Bool)

(assert (=> b!255265 m!270863))

(declare-fun m!270865 () Bool)

(assert (=> b!255265 m!270865))

(assert (=> b!255265 m!270859))

(assert (=> b!255265 m!270863))

(assert (=> b!255265 m!270865))

(declare-fun m!270867 () Bool)

(assert (=> b!255265 m!270867))

(declare-fun m!270869 () Bool)

(assert (=> bm!24103 m!270869))

(declare-fun m!270871 () Bool)

(assert (=> bm!24101 m!270871))

(declare-fun m!270873 () Bool)

(assert (=> b!255272 m!270873))

(assert (=> b!255274 m!270859))

(assert (=> b!255274 m!270859))

(declare-fun m!270875 () Bool)

(assert (=> b!255274 m!270875))

(declare-fun m!270877 () Bool)

(assert (=> bm!24100 m!270877))

(declare-fun m!270879 () Bool)

(assert (=> b!255267 m!270879))

(declare-fun m!270881 () Bool)

(assert (=> bm!24099 m!270881))

(assert (=> b!255261 m!270859))

(assert (=> b!255261 m!270859))

(declare-fun m!270883 () Bool)

(assert (=> b!255261 m!270883))

(assert (=> b!255269 m!270859))

(assert (=> b!255269 m!270859))

(assert (=> b!255269 m!270883))

(declare-fun m!270885 () Bool)

(assert (=> b!255275 m!270885))

(declare-fun m!270887 () Bool)

(assert (=> b!255277 m!270887))

(declare-fun m!270889 () Bool)

(assert (=> b!255277 m!270889))

(assert (=> b!255277 m!270871))

(declare-fun m!270891 () Bool)

(assert (=> b!255277 m!270891))

(declare-fun m!270893 () Bool)

(assert (=> b!255277 m!270893))

(declare-fun m!270895 () Bool)

(assert (=> b!255277 m!270895))

(declare-fun m!270897 () Bool)

(assert (=> b!255277 m!270897))

(assert (=> b!255277 m!270859))

(declare-fun m!270899 () Bool)

(assert (=> b!255277 m!270899))

(declare-fun m!270901 () Bool)

(assert (=> b!255277 m!270901))

(declare-fun m!270903 () Bool)

(assert (=> b!255277 m!270903))

(assert (=> b!255277 m!270887))

(declare-fun m!270905 () Bool)

(assert (=> b!255277 m!270905))

(declare-fun m!270907 () Bool)

(assert (=> b!255277 m!270907))

(declare-fun m!270909 () Bool)

(assert (=> b!255277 m!270909))

(assert (=> b!255277 m!270893))

(declare-fun m!270911 () Bool)

(assert (=> b!255277 m!270911))

(assert (=> b!255277 m!270891))

(declare-fun m!270913 () Bool)

(assert (=> b!255277 m!270913))

(assert (=> b!255277 m!270899))

(declare-fun m!270915 () Bool)

(assert (=> b!255277 m!270915))

(assert (=> d!61619 m!270835))

(assert (=> b!255033 d!61619))

(declare-fun d!61621 () Bool)

(assert (=> d!61621 (contains!1824 (getCurrentListMap!1409 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)) key!932)))

(declare-fun lt!128061 () Unit!7880)

(declare-fun choose!1225 (array!12451 array!12449 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 64) (_ BitVec 32) Int) Unit!7880)

(assert (=> d!61621 (= lt!128061 (choose!1225 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(assert (=> d!61621 (validMask!0 (mask!10958 thiss!1504))))

(assert (=> d!61621 (= (lemmaArrayContainsKeyThenInListMap!233 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)) lt!128061)))

(declare-fun bs!9078 () Bool)

(assert (= bs!9078 d!61621))

(assert (=> bs!9078 m!270679))

(assert (=> bs!9078 m!270679))

(declare-fun m!270917 () Bool)

(assert (=> bs!9078 m!270917))

(declare-fun m!270919 () Bool)

(assert (=> bs!9078 m!270919))

(assert (=> bs!9078 m!270835))

(assert (=> b!255038 d!61621))

(declare-fun b!255290 () Bool)

(declare-fun e!165465 () Bool)

(assert (=> b!255290 (= e!165465 (bvslt (size!6247 (_keys!6860 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!255288 () Bool)

(declare-fun res!124947 () Bool)

(assert (=> b!255288 (=> (not res!124947) (not e!165465))))

(assert (=> b!255288 (= res!124947 (not (validKeyInArray!0 (select (arr!5900 (_keys!6860 thiss!1504)) index!297))))))

(declare-fun d!61623 () Bool)

(declare-fun e!165466 () Bool)

(assert (=> d!61623 e!165466))

(declare-fun res!124946 () Bool)

(assert (=> d!61623 (=> (not res!124946) (not e!165466))))

(assert (=> d!61623 (= res!124946 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6247 (_keys!6860 thiss!1504)))))))

(declare-fun lt!128064 () Unit!7880)

(declare-fun choose!1 (array!12451 (_ BitVec 32) (_ BitVec 64)) Unit!7880)

(assert (=> d!61623 (= lt!128064 (choose!1 (_keys!6860 thiss!1504) index!297 key!932))))

(assert (=> d!61623 e!165465))

(declare-fun res!124945 () Bool)

(assert (=> d!61623 (=> (not res!124945) (not e!165465))))

(assert (=> d!61623 (= res!124945 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6247 (_keys!6860 thiss!1504)))))))

(assert (=> d!61623 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6860 thiss!1504) index!297 key!932) lt!128064)))

(declare-fun b!255291 () Bool)

(assert (=> b!255291 (= e!165466 (= (arrayCountValidKeys!0 (array!12452 (store (arr!5900 (_keys!6860 thiss!1504)) index!297 key!932) (size!6247 (_keys!6860 thiss!1504))) #b00000000000000000000000000000000 (size!6247 (_keys!6860 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6860 thiss!1504) #b00000000000000000000000000000000 (size!6247 (_keys!6860 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!255289 () Bool)

(declare-fun res!124944 () Bool)

(assert (=> b!255289 (=> (not res!124944) (not e!165465))))

(assert (=> b!255289 (= res!124944 (validKeyInArray!0 key!932))))

(assert (= (and d!61623 res!124945) b!255288))

(assert (= (and b!255288 res!124947) b!255289))

(assert (= (and b!255289 res!124944) b!255290))

(assert (= (and d!61623 res!124946) b!255291))

(declare-fun m!270921 () Bool)

(assert (=> b!255288 m!270921))

(assert (=> b!255288 m!270921))

(declare-fun m!270923 () Bool)

(assert (=> b!255288 m!270923))

(declare-fun m!270925 () Bool)

(assert (=> d!61623 m!270925))

(assert (=> b!255291 m!270705))

(declare-fun m!270927 () Bool)

(assert (=> b!255291 m!270927))

(assert (=> b!255291 m!270707))

(declare-fun m!270929 () Bool)

(assert (=> b!255289 m!270929))

(assert (=> b!255032 d!61623))

(declare-fun d!61625 () Bool)

(declare-fun lt!128067 () (_ BitVec 32))

(assert (=> d!61625 (and (bvsge lt!128067 #b00000000000000000000000000000000) (bvsle lt!128067 (bvsub (size!6247 lt!127892) #b00000000000000000000000000000000)))))

(declare-fun e!165472 () (_ BitVec 32))

(assert (=> d!61625 (= lt!128067 e!165472)))

(declare-fun c!43099 () Bool)

(assert (=> d!61625 (= c!43099 (bvsge #b00000000000000000000000000000000 (size!6247 (_keys!6860 thiss!1504))))))

(assert (=> d!61625 (and (bvsle #b00000000000000000000000000000000 (size!6247 (_keys!6860 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6247 (_keys!6860 thiss!1504)) (size!6247 lt!127892)))))

(assert (=> d!61625 (= (arrayCountValidKeys!0 lt!127892 #b00000000000000000000000000000000 (size!6247 (_keys!6860 thiss!1504))) lt!128067)))

(declare-fun bm!24108 () Bool)

(declare-fun call!24111 () (_ BitVec 32))

(assert (=> bm!24108 (= call!24111 (arrayCountValidKeys!0 lt!127892 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6247 (_keys!6860 thiss!1504))))))

(declare-fun b!255300 () Bool)

(declare-fun e!165471 () (_ BitVec 32))

(assert (=> b!255300 (= e!165471 (bvadd #b00000000000000000000000000000001 call!24111))))

(declare-fun b!255301 () Bool)

(assert (=> b!255301 (= e!165471 call!24111)))

(declare-fun b!255302 () Bool)

(assert (=> b!255302 (= e!165472 #b00000000000000000000000000000000)))

(declare-fun b!255303 () Bool)

(assert (=> b!255303 (= e!165472 e!165471)))

(declare-fun c!43100 () Bool)

(assert (=> b!255303 (= c!43100 (validKeyInArray!0 (select (arr!5900 lt!127892) #b00000000000000000000000000000000)))))

(assert (= (and d!61625 c!43099) b!255302))

(assert (= (and d!61625 (not c!43099)) b!255303))

(assert (= (and b!255303 c!43100) b!255300))

(assert (= (and b!255303 (not c!43100)) b!255301))

(assert (= (or b!255300 b!255301) bm!24108))

(declare-fun m!270931 () Bool)

(assert (=> bm!24108 m!270931))

(declare-fun m!270933 () Bool)

(assert (=> b!255303 m!270933))

(assert (=> b!255303 m!270933))

(declare-fun m!270935 () Bool)

(assert (=> b!255303 m!270935))

(assert (=> b!255032 d!61625))

(declare-fun d!61627 () Bool)

(declare-fun lt!128068 () (_ BitVec 32))

(assert (=> d!61627 (and (bvsge lt!128068 #b00000000000000000000000000000000) (bvsle lt!128068 (bvsub (size!6247 (_keys!6860 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!165474 () (_ BitVec 32))

(assert (=> d!61627 (= lt!128068 e!165474)))

(declare-fun c!43101 () Bool)

(assert (=> d!61627 (= c!43101 (bvsge #b00000000000000000000000000000000 (size!6247 (_keys!6860 thiss!1504))))))

(assert (=> d!61627 (and (bvsle #b00000000000000000000000000000000 (size!6247 (_keys!6860 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6247 (_keys!6860 thiss!1504)) (size!6247 (_keys!6860 thiss!1504))))))

(assert (=> d!61627 (= (arrayCountValidKeys!0 (_keys!6860 thiss!1504) #b00000000000000000000000000000000 (size!6247 (_keys!6860 thiss!1504))) lt!128068)))

(declare-fun bm!24109 () Bool)

(declare-fun call!24112 () (_ BitVec 32))

(assert (=> bm!24109 (= call!24112 (arrayCountValidKeys!0 (_keys!6860 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6247 (_keys!6860 thiss!1504))))))

(declare-fun b!255304 () Bool)

(declare-fun e!165473 () (_ BitVec 32))

(assert (=> b!255304 (= e!165473 (bvadd #b00000000000000000000000000000001 call!24112))))

(declare-fun b!255305 () Bool)

(assert (=> b!255305 (= e!165473 call!24112)))

(declare-fun b!255306 () Bool)

(assert (=> b!255306 (= e!165474 #b00000000000000000000000000000000)))

(declare-fun b!255307 () Bool)

(assert (=> b!255307 (= e!165474 e!165473)))

(declare-fun c!43102 () Bool)

(assert (=> b!255307 (= c!43102 (validKeyInArray!0 (select (arr!5900 (_keys!6860 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61627 c!43101) b!255306))

(assert (= (and d!61627 (not c!43101)) b!255307))

(assert (= (and b!255307 c!43102) b!255304))

(assert (= (and b!255307 (not c!43102)) b!255305))

(assert (= (or b!255304 b!255305) bm!24109))

(declare-fun m!270937 () Bool)

(assert (=> bm!24109 m!270937))

(assert (=> b!255307 m!270859))

(assert (=> b!255307 m!270859))

(assert (=> b!255307 m!270883))

(assert (=> b!255032 d!61627))

(declare-fun d!61629 () Bool)

(declare-fun e!165477 () Bool)

(assert (=> d!61629 e!165477))

(declare-fun res!124950 () Bool)

(assert (=> d!61629 (=> (not res!124950) (not e!165477))))

(assert (=> d!61629 (= res!124950 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6247 (_keys!6860 thiss!1504))) (bvslt index!297 (size!6246 (_values!4687 thiss!1504)))))))

(declare-fun lt!128071 () Unit!7880)

(declare-fun choose!1226 (array!12451 array!12449 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 32) (_ BitVec 64) V!8393 Int) Unit!7880)

(assert (=> d!61629 (= lt!128071 (choose!1226 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) index!297 key!932 v!346 (defaultEntry!4704 thiss!1504)))))

(assert (=> d!61629 (validMask!0 (mask!10958 thiss!1504))))

(assert (=> d!61629 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!91 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) index!297 key!932 v!346 (defaultEntry!4704 thiss!1504)) lt!128071)))

(declare-fun b!255310 () Bool)

(assert (=> b!255310 (= e!165477 (= (+!676 (getCurrentListMap!1409 (_keys!6860 thiss!1504) (_values!4687 thiss!1504) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)) (tuple2!4809 key!932 v!346)) (getCurrentListMap!1409 (array!12452 (store (arr!5900 (_keys!6860 thiss!1504)) index!297 key!932) (size!6247 (_keys!6860 thiss!1504))) (array!12450 (store (arr!5899 (_values!4687 thiss!1504)) index!297 (ValueCellFull!2936 v!346)) (size!6246 (_values!4687 thiss!1504))) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504))))))

(assert (= (and d!61629 res!124950) b!255310))

(declare-fun m!270939 () Bool)

(assert (=> d!61629 m!270939))

(assert (=> d!61629 m!270835))

(assert (=> b!255310 m!270695))

(assert (=> b!255310 m!270679))

(assert (=> b!255310 m!270705))

(declare-fun m!270941 () Bool)

(assert (=> b!255310 m!270941))

(assert (=> b!255310 m!270679))

(declare-fun m!270943 () Bool)

(assert (=> b!255310 m!270943))

(assert (=> b!255032 d!61629))

(declare-fun d!61631 () Bool)

(declare-fun e!165480 () Bool)

(assert (=> d!61631 e!165480))

(declare-fun res!124955 () Bool)

(assert (=> d!61631 (=> (not res!124955) (not e!165480))))

(declare-fun lt!128083 () ListLongMap!3723)

(assert (=> d!61631 (= res!124955 (contains!1824 lt!128083 (_1!2415 (tuple2!4809 key!932 v!346))))))

(declare-fun lt!128082 () List!3688)

(assert (=> d!61631 (= lt!128083 (ListLongMap!3724 lt!128082))))

(declare-fun lt!128081 () Unit!7880)

(declare-fun lt!128080 () Unit!7880)

(assert (=> d!61631 (= lt!128081 lt!128080)))

(assert (=> d!61631 (= (getValueByKey!307 lt!128082 (_1!2415 (tuple2!4809 key!932 v!346))) (Some!312 (_2!2415 (tuple2!4809 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!163 (List!3688 (_ BitVec 64) V!8393) Unit!7880)

(assert (=> d!61631 (= lt!128080 (lemmaContainsTupThenGetReturnValue!163 lt!128082 (_1!2415 (tuple2!4809 key!932 v!346)) (_2!2415 (tuple2!4809 key!932 v!346))))))

(declare-fun insertStrictlySorted!166 (List!3688 (_ BitVec 64) V!8393) List!3688)

(assert (=> d!61631 (= lt!128082 (insertStrictlySorted!166 (toList!1877 lt!127896) (_1!2415 (tuple2!4809 key!932 v!346)) (_2!2415 (tuple2!4809 key!932 v!346))))))

(assert (=> d!61631 (= (+!676 lt!127896 (tuple2!4809 key!932 v!346)) lt!128083)))

(declare-fun b!255315 () Bool)

(declare-fun res!124956 () Bool)

(assert (=> b!255315 (=> (not res!124956) (not e!165480))))

(assert (=> b!255315 (= res!124956 (= (getValueByKey!307 (toList!1877 lt!128083) (_1!2415 (tuple2!4809 key!932 v!346))) (Some!312 (_2!2415 (tuple2!4809 key!932 v!346)))))))

(declare-fun b!255316 () Bool)

(declare-fun contains!1827 (List!3688 tuple2!4808) Bool)

(assert (=> b!255316 (= e!165480 (contains!1827 (toList!1877 lt!128083) (tuple2!4809 key!932 v!346)))))

(assert (= (and d!61631 res!124955) b!255315))

(assert (= (and b!255315 res!124956) b!255316))

(declare-fun m!270945 () Bool)

(assert (=> d!61631 m!270945))

(declare-fun m!270947 () Bool)

(assert (=> d!61631 m!270947))

(declare-fun m!270949 () Bool)

(assert (=> d!61631 m!270949))

(declare-fun m!270951 () Bool)

(assert (=> d!61631 m!270951))

(declare-fun m!270953 () Bool)

(assert (=> b!255315 m!270953))

(declare-fun m!270955 () Bool)

(assert (=> b!255316 m!270955))

(assert (=> b!255032 d!61631))

(declare-fun b!255327 () Bool)

(declare-fun e!165489 () Bool)

(declare-fun call!24115 () Bool)

(assert (=> b!255327 (= e!165489 call!24115)))

(declare-fun b!255328 () Bool)

(declare-fun e!165492 () Bool)

(declare-fun e!165490 () Bool)

(assert (=> b!255328 (= e!165492 e!165490)))

(declare-fun res!124964 () Bool)

(assert (=> b!255328 (=> (not res!124964) (not e!165490))))

(declare-fun e!165491 () Bool)

(assert (=> b!255328 (= res!124964 (not e!165491))))

(declare-fun res!124963 () Bool)

(assert (=> b!255328 (=> (not res!124963) (not e!165491))))

(assert (=> b!255328 (= res!124963 (validKeyInArray!0 (select (arr!5900 lt!127892) #b00000000000000000000000000000000)))))

(declare-fun d!61633 () Bool)

(declare-fun res!124965 () Bool)

(assert (=> d!61633 (=> res!124965 e!165492)))

(assert (=> d!61633 (= res!124965 (bvsge #b00000000000000000000000000000000 (size!6247 lt!127892)))))

(assert (=> d!61633 (= (arrayNoDuplicates!0 lt!127892 #b00000000000000000000000000000000 Nil!3686) e!165492)))

(declare-fun b!255329 () Bool)

(assert (=> b!255329 (= e!165489 call!24115)))

(declare-fun bm!24112 () Bool)

(declare-fun c!43105 () Bool)

(assert (=> bm!24112 (= call!24115 (arrayNoDuplicates!0 lt!127892 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43105 (Cons!3685 (select (arr!5900 lt!127892) #b00000000000000000000000000000000) Nil!3686) Nil!3686)))))

(declare-fun b!255330 () Bool)

(assert (=> b!255330 (= e!165490 e!165489)))

(assert (=> b!255330 (= c!43105 (validKeyInArray!0 (select (arr!5900 lt!127892) #b00000000000000000000000000000000)))))

(declare-fun b!255331 () Bool)

(declare-fun contains!1828 (List!3689 (_ BitVec 64)) Bool)

(assert (=> b!255331 (= e!165491 (contains!1828 Nil!3686 (select (arr!5900 lt!127892) #b00000000000000000000000000000000)))))

(assert (= (and d!61633 (not res!124965)) b!255328))

(assert (= (and b!255328 res!124963) b!255331))

(assert (= (and b!255328 res!124964) b!255330))

(assert (= (and b!255330 c!43105) b!255327))

(assert (= (and b!255330 (not c!43105)) b!255329))

(assert (= (or b!255327 b!255329) bm!24112))

(assert (=> b!255328 m!270933))

(assert (=> b!255328 m!270933))

(assert (=> b!255328 m!270935))

(assert (=> bm!24112 m!270933))

(declare-fun m!270957 () Bool)

(assert (=> bm!24112 m!270957))

(assert (=> b!255330 m!270933))

(assert (=> b!255330 m!270933))

(assert (=> b!255330 m!270935))

(assert (=> b!255331 m!270933))

(assert (=> b!255331 m!270933))

(declare-fun m!270959 () Bool)

(assert (=> b!255331 m!270959))

(assert (=> b!255032 d!61633))

(declare-fun d!61635 () Bool)

(declare-fun e!165495 () Bool)

(assert (=> d!61635 e!165495))

(declare-fun res!124968 () Bool)

(assert (=> d!61635 (=> (not res!124968) (not e!165495))))

(assert (=> d!61635 (= res!124968 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6247 (_keys!6860 thiss!1504)))))))

(declare-fun lt!128086 () Unit!7880)

(declare-fun choose!41 (array!12451 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3689) Unit!7880)

(assert (=> d!61635 (= lt!128086 (choose!41 (_keys!6860 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3686))))

(assert (=> d!61635 (bvslt (size!6247 (_keys!6860 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61635 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6860 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3686) lt!128086)))

(declare-fun b!255334 () Bool)

(assert (=> b!255334 (= e!165495 (arrayNoDuplicates!0 (array!12452 (store (arr!5900 (_keys!6860 thiss!1504)) index!297 key!932) (size!6247 (_keys!6860 thiss!1504))) #b00000000000000000000000000000000 Nil!3686))))

(assert (= (and d!61635 res!124968) b!255334))

(declare-fun m!270961 () Bool)

(assert (=> d!61635 m!270961))

(assert (=> b!255334 m!270705))

(declare-fun m!270963 () Bool)

(assert (=> b!255334 m!270963))

(assert (=> b!255032 d!61635))

(declare-fun bm!24113 () Bool)

(declare-fun call!24117 () Bool)

(declare-fun lt!128105 () ListLongMap!3723)

(assert (=> bm!24113 (= call!24117 (contains!1824 lt!128105 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255335 () Bool)

(declare-fun e!165506 () ListLongMap!3723)

(declare-fun call!24121 () ListLongMap!3723)

(assert (=> b!255335 (= e!165506 call!24121)))

(declare-fun b!255336 () Bool)

(declare-fun e!165501 () Bool)

(declare-fun call!24119 () Bool)

(assert (=> b!255336 (= e!165501 (not call!24119))))

(declare-fun b!255337 () Bool)

(declare-fun e!165505 () ListLongMap!3723)

(assert (=> b!255337 (= e!165505 call!24121)))

(declare-fun bm!24114 () Bool)

(assert (=> bm!24114 (= call!24119 (contains!1824 lt!128105 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!24116 () ListLongMap!3723)

(declare-fun bm!24115 () Bool)

(assert (=> bm!24115 (= call!24116 (getCurrentListMapNoExtraKeys!564 lt!127892 (array!12450 (store (arr!5899 (_values!4687 thiss!1504)) index!297 (ValueCellFull!2936 v!346)) (size!6246 (_values!4687 thiss!1504))) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun b!255339 () Bool)

(declare-fun e!165504 () Bool)

(assert (=> b!255339 (= e!165504 (validKeyInArray!0 (select (arr!5900 lt!127892) #b00000000000000000000000000000000)))))

(declare-fun b!255340 () Bool)

(declare-fun e!165498 () Bool)

(assert (=> b!255340 (= e!165498 e!165501)))

(declare-fun c!43106 () Bool)

(assert (=> b!255340 (= c!43106 (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!255341 () Bool)

(declare-fun e!165500 () ListLongMap!3723)

(assert (=> b!255341 (= e!165500 e!165506)))

(declare-fun c!43111 () Bool)

(assert (=> b!255341 (= c!43111 (and (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24116 () Bool)

(declare-fun call!24122 () ListLongMap!3723)

(assert (=> bm!24116 (= call!24122 call!24116)))

(declare-fun b!255342 () Bool)

(declare-fun res!124970 () Bool)

(assert (=> b!255342 (=> (not res!124970) (not e!165498))))

(declare-fun e!165496 () Bool)

(assert (=> b!255342 (= res!124970 e!165496)))

(declare-fun res!124971 () Bool)

(assert (=> b!255342 (=> res!124971 e!165496)))

(declare-fun e!165497 () Bool)

(assert (=> b!255342 (= res!124971 (not e!165497))))

(declare-fun res!124969 () Bool)

(assert (=> b!255342 (=> (not res!124969) (not e!165497))))

(assert (=> b!255342 (= res!124969 (bvslt #b00000000000000000000000000000000 (size!6247 lt!127892)))))

(declare-fun e!165502 () Bool)

(declare-fun b!255343 () Bool)

(assert (=> b!255343 (= e!165502 (= (apply!248 lt!128105 (select (arr!5900 lt!127892) #b00000000000000000000000000000000)) (get!3041 (select (arr!5899 (array!12450 (store (arr!5899 (_values!4687 thiss!1504)) index!297 (ValueCellFull!2936 v!346)) (size!6246 (_values!4687 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!591 (defaultEntry!4704 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!255343 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6246 (array!12450 (store (arr!5899 (_values!4687 thiss!1504)) index!297 (ValueCellFull!2936 v!346)) (size!6246 (_values!4687 thiss!1504))))))))

(assert (=> b!255343 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6247 lt!127892)))))

(declare-fun b!255344 () Bool)

(declare-fun e!165508 () Unit!7880)

(declare-fun Unit!7895 () Unit!7880)

(assert (=> b!255344 (= e!165508 Unit!7895)))

(declare-fun c!43109 () Bool)

(declare-fun bm!24117 () Bool)

(declare-fun call!24118 () ListLongMap!3723)

(declare-fun call!24120 () ListLongMap!3723)

(assert (=> bm!24117 (= call!24120 (+!676 (ite c!43109 call!24116 (ite c!43111 call!24122 call!24118)) (ite (or c!43109 c!43111) (tuple2!4809 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4545 thiss!1504)) (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4545 thiss!1504)))))))

(declare-fun b!255345 () Bool)

(declare-fun e!165503 () Bool)

(assert (=> b!255345 (= e!165503 (= (apply!248 lt!128105 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4545 thiss!1504)))))

(declare-fun b!255346 () Bool)

(declare-fun e!165499 () Bool)

(assert (=> b!255346 (= e!165499 (not call!24117))))

(declare-fun bm!24118 () Bool)

(assert (=> bm!24118 (= call!24121 call!24120)))

(declare-fun b!255347 () Bool)

(assert (=> b!255347 (= e!165497 (validKeyInArray!0 (select (arr!5900 lt!127892) #b00000000000000000000000000000000)))))

(declare-fun b!255348 () Bool)

(declare-fun res!124975 () Bool)

(assert (=> b!255348 (=> (not res!124975) (not e!165498))))

(assert (=> b!255348 (= res!124975 e!165499)))

(declare-fun c!43108 () Bool)

(assert (=> b!255348 (= c!43108 (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!255349 () Bool)

(declare-fun e!165507 () Bool)

(assert (=> b!255349 (= e!165499 e!165507)))

(declare-fun res!124976 () Bool)

(assert (=> b!255349 (= res!124976 call!24117)))

(assert (=> b!255349 (=> (not res!124976) (not e!165507))))

(declare-fun b!255350 () Bool)

(assert (=> b!255350 (= e!165507 (= (apply!248 lt!128105 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4545 thiss!1504)))))

(declare-fun b!255351 () Bool)

(assert (=> b!255351 (= e!165501 e!165503)))

(declare-fun res!124977 () Bool)

(assert (=> b!255351 (= res!124977 call!24119)))

(assert (=> b!255351 (=> (not res!124977) (not e!165503))))

(declare-fun d!61637 () Bool)

(assert (=> d!61637 e!165498))

(declare-fun res!124973 () Bool)

(assert (=> d!61637 (=> (not res!124973) (not e!165498))))

(assert (=> d!61637 (= res!124973 (or (bvsge #b00000000000000000000000000000000 (size!6247 lt!127892)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6247 lt!127892)))))))

(declare-fun lt!128088 () ListLongMap!3723)

(assert (=> d!61637 (= lt!128105 lt!128088)))

(declare-fun lt!128092 () Unit!7880)

(assert (=> d!61637 (= lt!128092 e!165508)))

(declare-fun c!43110 () Bool)

(assert (=> d!61637 (= c!43110 e!165504)))

(declare-fun res!124974 () Bool)

(assert (=> d!61637 (=> (not res!124974) (not e!165504))))

(assert (=> d!61637 (= res!124974 (bvslt #b00000000000000000000000000000000 (size!6247 lt!127892)))))

(assert (=> d!61637 (= lt!128088 e!165500)))

(assert (=> d!61637 (= c!43109 (and (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61637 (validMask!0 (mask!10958 thiss!1504))))

(assert (=> d!61637 (= (getCurrentListMap!1409 lt!127892 (array!12450 (store (arr!5899 (_values!4687 thiss!1504)) index!297 (ValueCellFull!2936 v!346)) (size!6246 (_values!4687 thiss!1504))) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)) lt!128105)))

(declare-fun b!255338 () Bool)

(assert (=> b!255338 (= e!165505 call!24118)))

(declare-fun b!255352 () Bool)

(assert (=> b!255352 (= e!165496 e!165502)))

(declare-fun res!124972 () Bool)

(assert (=> b!255352 (=> (not res!124972) (not e!165502))))

(assert (=> b!255352 (= res!124972 (contains!1824 lt!128105 (select (arr!5900 lt!127892) #b00000000000000000000000000000000)))))

(assert (=> b!255352 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6247 lt!127892)))))

(declare-fun bm!24119 () Bool)

(assert (=> bm!24119 (= call!24118 call!24122)))

(declare-fun b!255353 () Bool)

(assert (=> b!255353 (= e!165500 (+!676 call!24120 (tuple2!4809 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4545 thiss!1504))))))

(declare-fun b!255354 () Bool)

(declare-fun c!43107 () Bool)

(assert (=> b!255354 (= c!43107 (and (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!255354 (= e!165506 e!165505)))

(declare-fun b!255355 () Bool)

(declare-fun lt!128101 () Unit!7880)

(assert (=> b!255355 (= e!165508 lt!128101)))

(declare-fun lt!128107 () ListLongMap!3723)

(assert (=> b!255355 (= lt!128107 (getCurrentListMapNoExtraKeys!564 lt!127892 (array!12450 (store (arr!5899 (_values!4687 thiss!1504)) index!297 (ValueCellFull!2936 v!346)) (size!6246 (_values!4687 thiss!1504))) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun lt!128099 () (_ BitVec 64))

(assert (=> b!255355 (= lt!128099 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128098 () (_ BitVec 64))

(assert (=> b!255355 (= lt!128098 (select (arr!5900 lt!127892) #b00000000000000000000000000000000))))

(declare-fun lt!128097 () Unit!7880)

(assert (=> b!255355 (= lt!128097 (addStillContains!224 lt!128107 lt!128099 (zeroValue!4545 thiss!1504) lt!128098))))

(assert (=> b!255355 (contains!1824 (+!676 lt!128107 (tuple2!4809 lt!128099 (zeroValue!4545 thiss!1504))) lt!128098)))

(declare-fun lt!128108 () Unit!7880)

(assert (=> b!255355 (= lt!128108 lt!128097)))

(declare-fun lt!128102 () ListLongMap!3723)

(assert (=> b!255355 (= lt!128102 (getCurrentListMapNoExtraKeys!564 lt!127892 (array!12450 (store (arr!5899 (_values!4687 thiss!1504)) index!297 (ValueCellFull!2936 v!346)) (size!6246 (_values!4687 thiss!1504))) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun lt!128090 () (_ BitVec 64))

(assert (=> b!255355 (= lt!128090 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128104 () (_ BitVec 64))

(assert (=> b!255355 (= lt!128104 (select (arr!5900 lt!127892) #b00000000000000000000000000000000))))

(declare-fun lt!128087 () Unit!7880)

(assert (=> b!255355 (= lt!128087 (addApplyDifferent!224 lt!128102 lt!128090 (minValue!4545 thiss!1504) lt!128104))))

(assert (=> b!255355 (= (apply!248 (+!676 lt!128102 (tuple2!4809 lt!128090 (minValue!4545 thiss!1504))) lt!128104) (apply!248 lt!128102 lt!128104))))

(declare-fun lt!128094 () Unit!7880)

(assert (=> b!255355 (= lt!128094 lt!128087)))

(declare-fun lt!128096 () ListLongMap!3723)

(assert (=> b!255355 (= lt!128096 (getCurrentListMapNoExtraKeys!564 lt!127892 (array!12450 (store (arr!5899 (_values!4687 thiss!1504)) index!297 (ValueCellFull!2936 v!346)) (size!6246 (_values!4687 thiss!1504))) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun lt!128100 () (_ BitVec 64))

(assert (=> b!255355 (= lt!128100 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128095 () (_ BitVec 64))

(assert (=> b!255355 (= lt!128095 (select (arr!5900 lt!127892) #b00000000000000000000000000000000))))

(declare-fun lt!128089 () Unit!7880)

(assert (=> b!255355 (= lt!128089 (addApplyDifferent!224 lt!128096 lt!128100 (zeroValue!4545 thiss!1504) lt!128095))))

(assert (=> b!255355 (= (apply!248 (+!676 lt!128096 (tuple2!4809 lt!128100 (zeroValue!4545 thiss!1504))) lt!128095) (apply!248 lt!128096 lt!128095))))

(declare-fun lt!128106 () Unit!7880)

(assert (=> b!255355 (= lt!128106 lt!128089)))

(declare-fun lt!128091 () ListLongMap!3723)

(assert (=> b!255355 (= lt!128091 (getCurrentListMapNoExtraKeys!564 lt!127892 (array!12450 (store (arr!5899 (_values!4687 thiss!1504)) index!297 (ValueCellFull!2936 v!346)) (size!6246 (_values!4687 thiss!1504))) (mask!10958 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun lt!128093 () (_ BitVec 64))

(assert (=> b!255355 (= lt!128093 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128103 () (_ BitVec 64))

(assert (=> b!255355 (= lt!128103 (select (arr!5900 lt!127892) #b00000000000000000000000000000000))))

(assert (=> b!255355 (= lt!128101 (addApplyDifferent!224 lt!128091 lt!128093 (minValue!4545 thiss!1504) lt!128103))))

(assert (=> b!255355 (= (apply!248 (+!676 lt!128091 (tuple2!4809 lt!128093 (minValue!4545 thiss!1504))) lt!128103) (apply!248 lt!128091 lt!128103))))

(assert (= (and d!61637 c!43109) b!255353))

(assert (= (and d!61637 (not c!43109)) b!255341))

(assert (= (and b!255341 c!43111) b!255335))

(assert (= (and b!255341 (not c!43111)) b!255354))

(assert (= (and b!255354 c!43107) b!255337))

(assert (= (and b!255354 (not c!43107)) b!255338))

(assert (= (or b!255337 b!255338) bm!24119))

(assert (= (or b!255335 bm!24119) bm!24116))

(assert (= (or b!255335 b!255337) bm!24118))

(assert (= (or b!255353 bm!24116) bm!24115))

(assert (= (or b!255353 bm!24118) bm!24117))

(assert (= (and d!61637 res!124974) b!255339))

(assert (= (and d!61637 c!43110) b!255355))

(assert (= (and d!61637 (not c!43110)) b!255344))

(assert (= (and d!61637 res!124973) b!255342))

(assert (= (and b!255342 res!124969) b!255347))

(assert (= (and b!255342 (not res!124971)) b!255352))

(assert (= (and b!255352 res!124972) b!255343))

(assert (= (and b!255342 res!124970) b!255348))

(assert (= (and b!255348 c!43108) b!255349))

(assert (= (and b!255348 (not c!43108)) b!255346))

(assert (= (and b!255349 res!124976) b!255350))

(assert (= (or b!255349 b!255346) bm!24113))

(assert (= (and b!255348 res!124975) b!255340))

(assert (= (and b!255340 c!43106) b!255351))

(assert (= (and b!255340 (not c!43106)) b!255336))

(assert (= (and b!255351 res!124977) b!255345))

(assert (= (or b!255351 b!255336) bm!24114))

(declare-fun b_lambda!8163 () Bool)

(assert (=> (not b_lambda!8163) (not b!255343)))

(assert (=> b!255343 t!8735))

(declare-fun b_and!13765 () Bool)

(assert (= b_and!13763 (and (=> t!8735 result!5341) b_and!13765)))

(assert (=> b!255343 m!270933))

(declare-fun m!270965 () Bool)

(assert (=> b!255343 m!270965))

(declare-fun m!270967 () Bool)

(assert (=> b!255343 m!270967))

(assert (=> b!255343 m!270865))

(assert (=> b!255343 m!270933))

(assert (=> b!255343 m!270967))

(assert (=> b!255343 m!270865))

(declare-fun m!270969 () Bool)

(assert (=> b!255343 m!270969))

(declare-fun m!270971 () Bool)

(assert (=> bm!24117 m!270971))

(declare-fun m!270973 () Bool)

(assert (=> bm!24115 m!270973))

(declare-fun m!270975 () Bool)

(assert (=> b!255350 m!270975))

(assert (=> b!255352 m!270933))

(assert (=> b!255352 m!270933))

(declare-fun m!270977 () Bool)

(assert (=> b!255352 m!270977))

(declare-fun m!270979 () Bool)

(assert (=> bm!24114 m!270979))

(declare-fun m!270981 () Bool)

(assert (=> b!255345 m!270981))

(declare-fun m!270983 () Bool)

(assert (=> bm!24113 m!270983))

(assert (=> b!255339 m!270933))

(assert (=> b!255339 m!270933))

(assert (=> b!255339 m!270935))

(assert (=> b!255347 m!270933))

(assert (=> b!255347 m!270933))

(assert (=> b!255347 m!270935))

(declare-fun m!270985 () Bool)

(assert (=> b!255353 m!270985))

(declare-fun m!270987 () Bool)

(assert (=> b!255355 m!270987))

(declare-fun m!270989 () Bool)

(assert (=> b!255355 m!270989))

(assert (=> b!255355 m!270973))

(declare-fun m!270991 () Bool)

(assert (=> b!255355 m!270991))

(declare-fun m!270993 () Bool)

(assert (=> b!255355 m!270993))

(declare-fun m!270995 () Bool)

(assert (=> b!255355 m!270995))

(declare-fun m!270997 () Bool)

(assert (=> b!255355 m!270997))

(assert (=> b!255355 m!270933))

(declare-fun m!270999 () Bool)

(assert (=> b!255355 m!270999))

(declare-fun m!271001 () Bool)

(assert (=> b!255355 m!271001))

(declare-fun m!271003 () Bool)

(assert (=> b!255355 m!271003))

(assert (=> b!255355 m!270987))

(declare-fun m!271005 () Bool)

(assert (=> b!255355 m!271005))

(declare-fun m!271007 () Bool)

(assert (=> b!255355 m!271007))

(declare-fun m!271009 () Bool)

(assert (=> b!255355 m!271009))

(assert (=> b!255355 m!270993))

(declare-fun m!271011 () Bool)

(assert (=> b!255355 m!271011))

(assert (=> b!255355 m!270991))

(declare-fun m!271013 () Bool)

(assert (=> b!255355 m!271013))

(assert (=> b!255355 m!270999))

(declare-fun m!271015 () Bool)

(assert (=> b!255355 m!271015))

(assert (=> d!61637 m!270835))

(assert (=> b!255032 d!61637))

(declare-fun b!255364 () Bool)

(declare-fun e!165515 () Bool)

(declare-fun call!24125 () Bool)

(assert (=> b!255364 (= e!165515 call!24125)))

(declare-fun b!255365 () Bool)

(declare-fun e!165517 () Bool)

(assert (=> b!255365 (= e!165515 e!165517)))

(declare-fun lt!128117 () (_ BitVec 64))

(assert (=> b!255365 (= lt!128117 (select (arr!5900 lt!127892) #b00000000000000000000000000000000))))

(declare-fun lt!128116 () Unit!7880)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12451 (_ BitVec 64) (_ BitVec 32)) Unit!7880)

(assert (=> b!255365 (= lt!128116 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!127892 lt!128117 #b00000000000000000000000000000000))))

(assert (=> b!255365 (arrayContainsKey!0 lt!127892 lt!128117 #b00000000000000000000000000000000)))

(declare-fun lt!128115 () Unit!7880)

(assert (=> b!255365 (= lt!128115 lt!128116)))

(declare-fun res!124982 () Bool)

(assert (=> b!255365 (= res!124982 (= (seekEntryOrOpen!0 (select (arr!5900 lt!127892) #b00000000000000000000000000000000) lt!127892 (mask!10958 thiss!1504)) (Found!1120 #b00000000000000000000000000000000)))))

(assert (=> b!255365 (=> (not res!124982) (not e!165517))))

(declare-fun d!61639 () Bool)

(declare-fun res!124983 () Bool)

(declare-fun e!165516 () Bool)

(assert (=> d!61639 (=> res!124983 e!165516)))

(assert (=> d!61639 (= res!124983 (bvsge #b00000000000000000000000000000000 (size!6247 lt!127892)))))

(assert (=> d!61639 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127892 (mask!10958 thiss!1504)) e!165516)))

(declare-fun b!255366 () Bool)

(assert (=> b!255366 (= e!165516 e!165515)))

(declare-fun c!43114 () Bool)

(assert (=> b!255366 (= c!43114 (validKeyInArray!0 (select (arr!5900 lt!127892) #b00000000000000000000000000000000)))))

(declare-fun bm!24122 () Bool)

(assert (=> bm!24122 (= call!24125 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!127892 (mask!10958 thiss!1504)))))

(declare-fun b!255367 () Bool)

(assert (=> b!255367 (= e!165517 call!24125)))

(assert (= (and d!61639 (not res!124983)) b!255366))

(assert (= (and b!255366 c!43114) b!255365))

(assert (= (and b!255366 (not c!43114)) b!255364))

(assert (= (and b!255365 res!124982) b!255367))

(assert (= (or b!255367 b!255364) bm!24122))

(assert (=> b!255365 m!270933))

(declare-fun m!271017 () Bool)

(assert (=> b!255365 m!271017))

(declare-fun m!271019 () Bool)

(assert (=> b!255365 m!271019))

(assert (=> b!255365 m!270933))

(declare-fun m!271021 () Bool)

(assert (=> b!255365 m!271021))

(assert (=> b!255366 m!270933))

(assert (=> b!255366 m!270933))

(assert (=> b!255366 m!270935))

(declare-fun m!271023 () Bool)

(assert (=> bm!24122 m!271023))

(assert (=> b!255032 d!61639))

(declare-fun d!61641 () Bool)

(declare-fun res!124988 () Bool)

(declare-fun e!165522 () Bool)

(assert (=> d!61641 (=> res!124988 e!165522)))

(assert (=> d!61641 (= res!124988 (= (select (arr!5900 (_keys!6860 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61641 (= (arrayContainsKey!0 (_keys!6860 thiss!1504) key!932 #b00000000000000000000000000000000) e!165522)))

(declare-fun b!255372 () Bool)

(declare-fun e!165523 () Bool)

(assert (=> b!255372 (= e!165522 e!165523)))

(declare-fun res!124989 () Bool)

(assert (=> b!255372 (=> (not res!124989) (not e!165523))))

(assert (=> b!255372 (= res!124989 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6247 (_keys!6860 thiss!1504))))))

(declare-fun b!255373 () Bool)

(assert (=> b!255373 (= e!165523 (arrayContainsKey!0 (_keys!6860 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61641 (not res!124988)) b!255372))

(assert (= (and b!255372 res!124989) b!255373))

(assert (=> d!61641 m!270859))

(declare-fun m!271025 () Bool)

(assert (=> b!255373 m!271025))

(assert (=> b!255032 d!61641))

(declare-fun d!61643 () Bool)

(declare-fun e!165526 () Bool)

(assert (=> d!61643 e!165526))

(declare-fun res!124992 () Bool)

(assert (=> d!61643 (=> (not res!124992) (not e!165526))))

(assert (=> d!61643 (= res!124992 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6247 (_keys!6860 thiss!1504)))))))

(declare-fun lt!128120 () Unit!7880)

(declare-fun choose!102 ((_ BitVec 64) array!12451 (_ BitVec 32) (_ BitVec 32)) Unit!7880)

(assert (=> d!61643 (= lt!128120 (choose!102 key!932 (_keys!6860 thiss!1504) index!297 (mask!10958 thiss!1504)))))

(assert (=> d!61643 (validMask!0 (mask!10958 thiss!1504))))

(assert (=> d!61643 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6860 thiss!1504) index!297 (mask!10958 thiss!1504)) lt!128120)))

(declare-fun b!255376 () Bool)

(assert (=> b!255376 (= e!165526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12452 (store (arr!5900 (_keys!6860 thiss!1504)) index!297 key!932) (size!6247 (_keys!6860 thiss!1504))) (mask!10958 thiss!1504)))))

(assert (= (and d!61643 res!124992) b!255376))

(declare-fun m!271027 () Bool)

(assert (=> d!61643 m!271027))

(assert (=> d!61643 m!270835))

(assert (=> b!255376 m!270705))

(declare-fun m!271029 () Bool)

(assert (=> b!255376 m!271029))

(assert (=> b!255032 d!61643))

(declare-fun b!255389 () Bool)

(declare-fun e!165533 () SeekEntryResult!1120)

(assert (=> b!255389 (= e!165533 Undefined!1120)))

(declare-fun b!255390 () Bool)

(declare-fun lt!128128 () SeekEntryResult!1120)

(declare-fun e!165535 () SeekEntryResult!1120)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12451 (_ BitVec 32)) SeekEntryResult!1120)

(assert (=> b!255390 (= e!165535 (seekKeyOrZeroReturnVacant!0 (x!24862 lt!128128) (index!6652 lt!128128) (index!6652 lt!128128) key!932 (_keys!6860 thiss!1504) (mask!10958 thiss!1504)))))

(declare-fun b!255391 () Bool)

(declare-fun c!43123 () Bool)

(declare-fun lt!128129 () (_ BitVec 64))

(assert (=> b!255391 (= c!43123 (= lt!128129 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!165534 () SeekEntryResult!1120)

(assert (=> b!255391 (= e!165534 e!165535)))

(declare-fun b!255392 () Bool)

(assert (=> b!255392 (= e!165534 (Found!1120 (index!6652 lt!128128)))))

(declare-fun d!61645 () Bool)

(declare-fun lt!128127 () SeekEntryResult!1120)

(assert (=> d!61645 (and (or ((_ is Undefined!1120) lt!128127) (not ((_ is Found!1120) lt!128127)) (and (bvsge (index!6651 lt!128127) #b00000000000000000000000000000000) (bvslt (index!6651 lt!128127) (size!6247 (_keys!6860 thiss!1504))))) (or ((_ is Undefined!1120) lt!128127) ((_ is Found!1120) lt!128127) (not ((_ is MissingZero!1120) lt!128127)) (and (bvsge (index!6650 lt!128127) #b00000000000000000000000000000000) (bvslt (index!6650 lt!128127) (size!6247 (_keys!6860 thiss!1504))))) (or ((_ is Undefined!1120) lt!128127) ((_ is Found!1120) lt!128127) ((_ is MissingZero!1120) lt!128127) (not ((_ is MissingVacant!1120) lt!128127)) (and (bvsge (index!6653 lt!128127) #b00000000000000000000000000000000) (bvslt (index!6653 lt!128127) (size!6247 (_keys!6860 thiss!1504))))) (or ((_ is Undefined!1120) lt!128127) (ite ((_ is Found!1120) lt!128127) (= (select (arr!5900 (_keys!6860 thiss!1504)) (index!6651 lt!128127)) key!932) (ite ((_ is MissingZero!1120) lt!128127) (= (select (arr!5900 (_keys!6860 thiss!1504)) (index!6650 lt!128127)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1120) lt!128127) (= (select (arr!5900 (_keys!6860 thiss!1504)) (index!6653 lt!128127)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61645 (= lt!128127 e!165533)))

(declare-fun c!43122 () Bool)

(assert (=> d!61645 (= c!43122 (and ((_ is Intermediate!1120) lt!128128) (undefined!1932 lt!128128)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12451 (_ BitVec 32)) SeekEntryResult!1120)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61645 (= lt!128128 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10958 thiss!1504)) key!932 (_keys!6860 thiss!1504) (mask!10958 thiss!1504)))))

(assert (=> d!61645 (validMask!0 (mask!10958 thiss!1504))))

(assert (=> d!61645 (= (seekEntryOrOpen!0 key!932 (_keys!6860 thiss!1504) (mask!10958 thiss!1504)) lt!128127)))

(declare-fun b!255393 () Bool)

(assert (=> b!255393 (= e!165533 e!165534)))

(assert (=> b!255393 (= lt!128129 (select (arr!5900 (_keys!6860 thiss!1504)) (index!6652 lt!128128)))))

(declare-fun c!43121 () Bool)

(assert (=> b!255393 (= c!43121 (= lt!128129 key!932))))

(declare-fun b!255394 () Bool)

(assert (=> b!255394 (= e!165535 (MissingZero!1120 (index!6652 lt!128128)))))

(assert (= (and d!61645 c!43122) b!255389))

(assert (= (and d!61645 (not c!43122)) b!255393))

(assert (= (and b!255393 c!43121) b!255392))

(assert (= (and b!255393 (not c!43121)) b!255391))

(assert (= (and b!255391 c!43123) b!255394))

(assert (= (and b!255391 (not c!43123)) b!255390))

(declare-fun m!271031 () Bool)

(assert (=> b!255390 m!271031))

(declare-fun m!271033 () Bool)

(assert (=> d!61645 m!271033))

(assert (=> d!61645 m!271033))

(declare-fun m!271035 () Bool)

(assert (=> d!61645 m!271035))

(assert (=> d!61645 m!270835))

(declare-fun m!271037 () Bool)

(assert (=> d!61645 m!271037))

(declare-fun m!271039 () Bool)

(assert (=> d!61645 m!271039))

(declare-fun m!271041 () Bool)

(assert (=> d!61645 m!271041))

(declare-fun m!271043 () Bool)

(assert (=> b!255393 m!271043))

(assert (=> b!255027 d!61645))

(declare-fun d!61647 () Bool)

(assert (=> d!61647 (= (inRange!0 (ite c!43041 (index!6650 lt!127890) (index!6653 lt!127890)) (mask!10958 thiss!1504)) (and (bvsge (ite c!43041 (index!6650 lt!127890) (index!6653 lt!127890)) #b00000000000000000000000000000000) (bvslt (ite c!43041 (index!6650 lt!127890) (index!6653 lt!127890)) (bvadd (mask!10958 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24066 d!61647))

(assert (=> bm!24065 d!61641))

(declare-fun mapNonEmpty!11166 () Bool)

(declare-fun mapRes!11166 () Bool)

(declare-fun tp!23397 () Bool)

(declare-fun e!165540 () Bool)

(assert (=> mapNonEmpty!11166 (= mapRes!11166 (and tp!23397 e!165540))))

(declare-fun mapRest!11166 () (Array (_ BitVec 32) ValueCell!2936))

(declare-fun mapKey!11166 () (_ BitVec 32))

(declare-fun mapValue!11166 () ValueCell!2936)

(assert (=> mapNonEmpty!11166 (= mapRest!11157 (store mapRest!11166 mapKey!11166 mapValue!11166))))

(declare-fun b!255401 () Bool)

(assert (=> b!255401 (= e!165540 tp_is_empty!6559)))

(declare-fun condMapEmpty!11166 () Bool)

(declare-fun mapDefault!11166 () ValueCell!2936)

(assert (=> mapNonEmpty!11157 (= condMapEmpty!11166 (= mapRest!11157 ((as const (Array (_ BitVec 32) ValueCell!2936)) mapDefault!11166)))))

(declare-fun e!165541 () Bool)

(assert (=> mapNonEmpty!11157 (= tp!23381 (and e!165541 mapRes!11166))))

(declare-fun mapIsEmpty!11166 () Bool)

(assert (=> mapIsEmpty!11166 mapRes!11166))

(declare-fun b!255402 () Bool)

(assert (=> b!255402 (= e!165541 tp_is_empty!6559)))

(assert (= (and mapNonEmpty!11157 condMapEmpty!11166) mapIsEmpty!11166))

(assert (= (and mapNonEmpty!11157 (not condMapEmpty!11166)) mapNonEmpty!11166))

(assert (= (and mapNonEmpty!11166 ((_ is ValueCellFull!2936) mapValue!11166)) b!255401))

(assert (= (and mapNonEmpty!11157 ((_ is ValueCellFull!2936) mapDefault!11166)) b!255402))

(declare-fun m!271045 () Bool)

(assert (=> mapNonEmpty!11166 m!271045))

(declare-fun b_lambda!8165 () Bool)

(assert (= b_lambda!8161 (or (and b!255035 b_free!6697) b_lambda!8165)))

(declare-fun b_lambda!8167 () Bool)

(assert (= b_lambda!8163 (or (and b!255035 b_free!6697) b_lambda!8167)))

(check-sat (not b!255376) (not bm!24099) (not d!61617) (not b!255345) (not b_next!6697) (not d!61623) (not b!255195) (not b!255355) (not b!255288) (not bm!24109) (not b!255272) (not d!61619) (not b!255352) (not d!61645) (not b!255315) (not b!255350) (not bm!24084) (not d!61635) (not b!255310) (not b!255265) (not b!255339) (not b!255212) (not bm!24103) (not d!61629) (not b!255307) (not bm!24108) (not b!255274) (not b!255331) (not b!255353) (not b!255289) (not b_lambda!8167) (not b!255291) (not b!255277) (not bm!24114) (not bm!24083) (not d!61607) (not b!255334) (not d!61637) (not d!61605) (not b!255205) (not b!255261) b_and!13765 (not bm!24117) (not bm!24115) (not d!61621) (not b!255347) (not b_lambda!8165) (not bm!24112) tp_is_empty!6559 (not b!255303) (not b!255316) (not b!255214) (not b!255269) (not d!61631) (not mapNonEmpty!11166) (not b!255373) (not b!255204) (not b!255275) (not bm!24113) (not d!61613) (not b!255330) (not b!255203) (not bm!24122) (not b!255343) (not b!255390) (not bm!24101) (not b!255365) (not b!255267) (not b!255328) (not d!61643) (not b!255366) (not bm!24100))
(check-sat b_and!13765 (not b_next!6697))
