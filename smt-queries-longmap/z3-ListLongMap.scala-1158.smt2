; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24338 () Bool)

(assert start!24338)

(declare-fun b!254842 () Bool)

(declare-fun b_free!6697 () Bool)

(declare-fun b_next!6697 () Bool)

(assert (=> b!254842 (= b_free!6697 (not b_next!6697))))

(declare-fun tp!23382 () Bool)

(declare-fun b_and!13717 () Bool)

(assert (=> b!254842 (= tp!23382 b_and!13717)))

(declare-fun mapNonEmpty!11157 () Bool)

(declare-fun mapRes!11157 () Bool)

(declare-fun tp!23381 () Bool)

(declare-fun e!165178 () Bool)

(assert (=> mapNonEmpty!11157 (= mapRes!11157 (and tp!23381 e!165178))))

(declare-datatypes ((V!8393 0))(
  ( (V!8394 (val!3324 Int)) )
))
(declare-datatypes ((ValueCell!2936 0))(
  ( (ValueCellFull!2936 (v!5395 V!8393)) (EmptyCell!2936) )
))
(declare-datatypes ((array!12443 0))(
  ( (array!12444 (arr!5895 (Array (_ BitVec 32) ValueCell!2936)) (size!6243 (_ BitVec 32))) )
))
(declare-datatypes ((array!12445 0))(
  ( (array!12446 (arr!5896 (Array (_ BitVec 32) (_ BitVec 64))) (size!6244 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3772 0))(
  ( (LongMapFixedSize!3773 (defaultEntry!4704 Int) (mask!10957 (_ BitVec 32)) (extraKeys!4441 (_ BitVec 32)) (zeroValue!4545 V!8393) (minValue!4545 V!8393) (_size!1935 (_ BitVec 32)) (_keys!6859 array!12445) (_values!4687 array!12443) (_vacant!1935 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3772)

(declare-fun mapValue!11157 () ValueCell!2936)

(declare-fun mapKey!11157 () (_ BitVec 32))

(declare-fun mapRest!11157 () (Array (_ BitVec 32) ValueCell!2936))

(assert (=> mapNonEmpty!11157 (= (arr!5895 (_values!4687 thiss!1504)) (store mapRest!11157 mapKey!11157 mapValue!11157))))

(declare-fun b!254833 () Bool)

(declare-fun e!165186 () Bool)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!254833 (= e!165186 (not (bvsge index!297 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4842 0))(
  ( (tuple2!4843 (_1!2432 (_ BitVec 64)) (_2!2432 V!8393)) )
))
(declare-datatypes ((List!3746 0))(
  ( (Nil!3743) (Cons!3742 (h!4404 tuple2!4842) (t!8786 List!3746)) )
))
(declare-datatypes ((ListLongMap!3745 0))(
  ( (ListLongMap!3746 (toList!1888 List!3746)) )
))
(declare-fun lt!127654 () ListLongMap!3745)

(declare-fun lt!127653 () array!12445)

(declare-fun v!346 () V!8393)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun +!681 (ListLongMap!3745 tuple2!4842) ListLongMap!3745)

(declare-fun getCurrentListMap!1397 (array!12445 array!12443 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 32) Int) ListLongMap!3745)

(assert (=> b!254833 (= (+!681 lt!127654 (tuple2!4843 key!932 v!346)) (getCurrentListMap!1397 lt!127653 (array!12444 (store (arr!5895 (_values!4687 thiss!1504)) index!297 (ValueCellFull!2936 v!346)) (size!6243 (_values!4687 thiss!1504))) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-datatypes ((Unit!7867 0))(
  ( (Unit!7868) )
))
(declare-fun lt!127648 () Unit!7867)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!92 (array!12445 array!12443 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 32) (_ BitVec 64) V!8393 Int) Unit!7867)

(assert (=> b!254833 (= lt!127648 (lemmaAddValidKeyToArrayThenAddPairToListMap!92 (_keys!6859 thiss!1504) (_values!4687 thiss!1504) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) index!297 key!932 v!346 (defaultEntry!4704 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12445 (_ BitVec 32)) Bool)

(assert (=> b!254833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127653 (mask!10957 thiss!1504))))

(declare-fun lt!127649 () Unit!7867)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12445 (_ BitVec 32) (_ BitVec 32)) Unit!7867)

(assert (=> b!254833 (= lt!127649 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6859 thiss!1504) index!297 (mask!10957 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12445 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!254833 (= (arrayCountValidKeys!0 lt!127653 #b00000000000000000000000000000000 (size!6244 (_keys!6859 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6859 thiss!1504) #b00000000000000000000000000000000 (size!6244 (_keys!6859 thiss!1504)))))))

(declare-fun lt!127650 () Unit!7867)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12445 (_ BitVec 32) (_ BitVec 64)) Unit!7867)

(assert (=> b!254833 (= lt!127650 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6859 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3747 0))(
  ( (Nil!3744) (Cons!3743 (h!4405 (_ BitVec 64)) (t!8787 List!3747)) )
))
(declare-fun arrayNoDuplicates!0 (array!12445 (_ BitVec 32) List!3747) Bool)

(assert (=> b!254833 (arrayNoDuplicates!0 lt!127653 #b00000000000000000000000000000000 Nil!3744)))

(assert (=> b!254833 (= lt!127653 (array!12446 (store (arr!5896 (_keys!6859 thiss!1504)) index!297 key!932) (size!6244 (_keys!6859 thiss!1504))))))

(declare-fun lt!127647 () Unit!7867)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12445 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3747) Unit!7867)

(assert (=> b!254833 (= lt!127647 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6859 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3744))))

(declare-fun lt!127652 () Unit!7867)

(declare-fun e!165185 () Unit!7867)

(assert (=> b!254833 (= lt!127652 e!165185)))

(declare-fun c!43002 () Bool)

(declare-fun arrayContainsKey!0 (array!12445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!254833 (= c!43002 (arrayContainsKey!0 (_keys!6859 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254834 () Bool)

(declare-fun e!165184 () Bool)

(declare-fun e!165177 () Bool)

(assert (=> b!254834 (= e!165184 (and e!165177 mapRes!11157))))

(declare-fun condMapEmpty!11157 () Bool)

(declare-fun mapDefault!11157 () ValueCell!2936)

(assert (=> b!254834 (= condMapEmpty!11157 (= (arr!5895 (_values!4687 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2936)) mapDefault!11157)))))

(declare-fun c!43001 () Bool)

(declare-datatypes ((SeekEntryResult!1151 0))(
  ( (MissingZero!1151 (index!6774 (_ BitVec 32))) (Found!1151 (index!6775 (_ BitVec 32))) (Intermediate!1151 (undefined!1963 Bool) (index!6776 (_ BitVec 32)) (x!24892 (_ BitVec 32))) (Undefined!1151) (MissingVacant!1151 (index!6777 (_ BitVec 32))) )
))
(declare-fun lt!127655 () SeekEntryResult!1151)

(declare-fun bm!24053 () Bool)

(declare-fun call!24057 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24053 (= call!24057 (inRange!0 (ite c!43001 (index!6774 lt!127655) (index!6777 lt!127655)) (mask!10957 thiss!1504)))))

(declare-fun b!254835 () Bool)

(declare-fun c!43003 () Bool)

(get-info :version)

(assert (=> b!254835 (= c!43003 ((_ is MissingVacant!1151) lt!127655))))

(declare-fun e!165187 () Bool)

(declare-fun e!165181 () Bool)

(assert (=> b!254835 (= e!165187 e!165181)))

(declare-fun b!254836 () Bool)

(declare-fun res!124714 () Bool)

(declare-fun e!165176 () Bool)

(assert (=> b!254836 (=> (not res!124714) (not e!165176))))

(assert (=> b!254836 (= res!124714 (= (select (arr!5896 (_keys!6859 thiss!1504)) (index!6774 lt!127655)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254837 () Bool)

(declare-fun tp_is_empty!6559 () Bool)

(assert (=> b!254837 (= e!165177 tp_is_empty!6559)))

(declare-fun b!254838 () Bool)

(declare-fun res!124712 () Bool)

(assert (=> b!254838 (=> (not res!124712) (not e!165176))))

(assert (=> b!254838 (= res!124712 call!24057)))

(assert (=> b!254838 (= e!165187 e!165176)))

(declare-fun b!254839 () Bool)

(declare-fun res!124710 () Bool)

(declare-fun e!165183 () Bool)

(assert (=> b!254839 (=> (not res!124710) (not e!165183))))

(assert (=> b!254839 (= res!124710 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!24054 () Bool)

(declare-fun call!24056 () Bool)

(assert (=> bm!24054 (= call!24056 (arrayContainsKey!0 (_keys!6859 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!124707 () Bool)

(assert (=> start!24338 (=> (not res!124707) (not e!165183))))

(declare-fun valid!1477 (LongMapFixedSize!3772) Bool)

(assert (=> start!24338 (= res!124707 (valid!1477 thiss!1504))))

(assert (=> start!24338 e!165183))

(declare-fun e!165188 () Bool)

(assert (=> start!24338 e!165188))

(assert (=> start!24338 true))

(assert (=> start!24338 tp_is_empty!6559))

(declare-fun b!254840 () Bool)

(declare-fun e!165179 () Bool)

(assert (=> b!254840 (= e!165179 e!165186)))

(declare-fun res!124708 () Bool)

(assert (=> b!254840 (=> (not res!124708) (not e!165186))))

(assert (=> b!254840 (= res!124708 (inRange!0 index!297 (mask!10957 thiss!1504)))))

(declare-fun lt!127651 () Unit!7867)

(declare-fun e!165182 () Unit!7867)

(assert (=> b!254840 (= lt!127651 e!165182)))

(declare-fun c!43004 () Bool)

(declare-fun contains!1825 (ListLongMap!3745 (_ BitVec 64)) Bool)

(assert (=> b!254840 (= c!43004 (contains!1825 lt!127654 key!932))))

(assert (=> b!254840 (= lt!127654 (getCurrentListMap!1397 (_keys!6859 thiss!1504) (_values!4687 thiss!1504) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun b!254841 () Bool)

(assert (=> b!254841 (= e!165181 ((_ is Undefined!1151) lt!127655))))

(declare-fun array_inv!3891 (array!12445) Bool)

(declare-fun array_inv!3892 (array!12443) Bool)

(assert (=> b!254842 (= e!165188 (and tp!23382 tp_is_empty!6559 (array_inv!3891 (_keys!6859 thiss!1504)) (array_inv!3892 (_values!4687 thiss!1504)) e!165184))))

(declare-fun b!254843 () Bool)

(declare-fun Unit!7869 () Unit!7867)

(assert (=> b!254843 (= e!165185 Unit!7869)))

(declare-fun lt!127645 () Unit!7867)

(declare-fun lemmaArrayContainsKeyThenInListMap!228 (array!12445 array!12443 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 64) (_ BitVec 32) Int) Unit!7867)

(assert (=> b!254843 (= lt!127645 (lemmaArrayContainsKeyThenInListMap!228 (_keys!6859 thiss!1504) (_values!4687 thiss!1504) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(assert (=> b!254843 false))

(declare-fun b!254844 () Bool)

(declare-fun Unit!7870 () Unit!7867)

(assert (=> b!254844 (= e!165182 Unit!7870)))

(declare-fun lt!127646 () Unit!7867)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!418 (array!12445 array!12443 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 64) Int) Unit!7867)

(assert (=> b!254844 (= lt!127646 (lemmaInListMapThenSeekEntryOrOpenFindsIt!418 (_keys!6859 thiss!1504) (_values!4687 thiss!1504) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) key!932 (defaultEntry!4704 thiss!1504)))))

(assert (=> b!254844 false))

(declare-fun b!254845 () Bool)

(assert (=> b!254845 (= e!165183 e!165179)))

(declare-fun res!124713 () Bool)

(assert (=> b!254845 (=> (not res!124713) (not e!165179))))

(assert (=> b!254845 (= res!124713 (or (= lt!127655 (MissingZero!1151 index!297)) (= lt!127655 (MissingVacant!1151 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12445 (_ BitVec 32)) SeekEntryResult!1151)

(assert (=> b!254845 (= lt!127655 (seekEntryOrOpen!0 key!932 (_keys!6859 thiss!1504) (mask!10957 thiss!1504)))))

(declare-fun b!254846 () Bool)

(declare-fun e!165180 () Bool)

(assert (=> b!254846 (= e!165180 (not call!24056))))

(declare-fun mapIsEmpty!11157 () Bool)

(assert (=> mapIsEmpty!11157 mapRes!11157))

(declare-fun b!254847 () Bool)

(declare-fun Unit!7871 () Unit!7867)

(assert (=> b!254847 (= e!165185 Unit!7871)))

(declare-fun b!254848 () Bool)

(declare-fun lt!127656 () Unit!7867)

(assert (=> b!254848 (= e!165182 lt!127656)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!417 (array!12445 array!12443 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 64) Int) Unit!7867)

(assert (=> b!254848 (= lt!127656 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!417 (_keys!6859 thiss!1504) (_values!4687 thiss!1504) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) key!932 (defaultEntry!4704 thiss!1504)))))

(assert (=> b!254848 (= c!43001 ((_ is MissingZero!1151) lt!127655))))

(assert (=> b!254848 e!165187))

(declare-fun b!254849 () Bool)

(assert (=> b!254849 (= e!165178 tp_is_empty!6559)))

(declare-fun b!254850 () Bool)

(declare-fun res!124711 () Bool)

(assert (=> b!254850 (= res!124711 (= (select (arr!5896 (_keys!6859 thiss!1504)) (index!6777 lt!127655)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!254850 (=> (not res!124711) (not e!165180))))

(declare-fun b!254851 () Bool)

(assert (=> b!254851 (= e!165181 e!165180)))

(declare-fun res!124709 () Bool)

(assert (=> b!254851 (= res!124709 call!24057)))

(assert (=> b!254851 (=> (not res!124709) (not e!165180))))

(declare-fun b!254852 () Bool)

(assert (=> b!254852 (= e!165176 (not call!24056))))

(assert (= (and start!24338 res!124707) b!254839))

(assert (= (and b!254839 res!124710) b!254845))

(assert (= (and b!254845 res!124713) b!254840))

(assert (= (and b!254840 c!43004) b!254844))

(assert (= (and b!254840 (not c!43004)) b!254848))

(assert (= (and b!254848 c!43001) b!254838))

(assert (= (and b!254848 (not c!43001)) b!254835))

(assert (= (and b!254838 res!124712) b!254836))

(assert (= (and b!254836 res!124714) b!254852))

(assert (= (and b!254835 c!43003) b!254851))

(assert (= (and b!254835 (not c!43003)) b!254841))

(assert (= (and b!254851 res!124709) b!254850))

(assert (= (and b!254850 res!124711) b!254846))

(assert (= (or b!254838 b!254851) bm!24053))

(assert (= (or b!254852 b!254846) bm!24054))

(assert (= (and b!254840 res!124708) b!254833))

(assert (= (and b!254833 c!43002) b!254843))

(assert (= (and b!254833 (not c!43002)) b!254847))

(assert (= (and b!254834 condMapEmpty!11157) mapIsEmpty!11157))

(assert (= (and b!254834 (not condMapEmpty!11157)) mapNonEmpty!11157))

(assert (= (and mapNonEmpty!11157 ((_ is ValueCellFull!2936) mapValue!11157)) b!254849))

(assert (= (and b!254834 ((_ is ValueCellFull!2936) mapDefault!11157)) b!254837))

(assert (= b!254842 b!254834))

(assert (= start!24338 b!254842))

(declare-fun m!269869 () Bool)

(assert (=> b!254833 m!269869))

(declare-fun m!269871 () Bool)

(assert (=> b!254833 m!269871))

(declare-fun m!269873 () Bool)

(assert (=> b!254833 m!269873))

(declare-fun m!269875 () Bool)

(assert (=> b!254833 m!269875))

(declare-fun m!269877 () Bool)

(assert (=> b!254833 m!269877))

(declare-fun m!269879 () Bool)

(assert (=> b!254833 m!269879))

(declare-fun m!269881 () Bool)

(assert (=> b!254833 m!269881))

(declare-fun m!269883 () Bool)

(assert (=> b!254833 m!269883))

(declare-fun m!269885 () Bool)

(assert (=> b!254833 m!269885))

(declare-fun m!269887 () Bool)

(assert (=> b!254833 m!269887))

(declare-fun m!269889 () Bool)

(assert (=> b!254833 m!269889))

(declare-fun m!269891 () Bool)

(assert (=> b!254833 m!269891))

(declare-fun m!269893 () Bool)

(assert (=> b!254833 m!269893))

(declare-fun m!269895 () Bool)

(assert (=> b!254850 m!269895))

(declare-fun m!269897 () Bool)

(assert (=> mapNonEmpty!11157 m!269897))

(declare-fun m!269899 () Bool)

(assert (=> b!254836 m!269899))

(declare-fun m!269901 () Bool)

(assert (=> b!254848 m!269901))

(declare-fun m!269903 () Bool)

(assert (=> b!254843 m!269903))

(declare-fun m!269905 () Bool)

(assert (=> start!24338 m!269905))

(declare-fun m!269907 () Bool)

(assert (=> b!254842 m!269907))

(declare-fun m!269909 () Bool)

(assert (=> b!254842 m!269909))

(declare-fun m!269911 () Bool)

(assert (=> bm!24053 m!269911))

(declare-fun m!269913 () Bool)

(assert (=> b!254840 m!269913))

(declare-fun m!269915 () Bool)

(assert (=> b!254840 m!269915))

(declare-fun m!269917 () Bool)

(assert (=> b!254840 m!269917))

(declare-fun m!269919 () Bool)

(assert (=> b!254844 m!269919))

(assert (=> bm!24054 m!269869))

(declare-fun m!269921 () Bool)

(assert (=> b!254845 m!269921))

(check-sat (not b!254848) (not b_next!6697) (not mapNonEmpty!11157) tp_is_empty!6559 (not b!254844) (not b!254843) (not b!254842) (not start!24338) (not b!254845) (not b!254833) b_and!13717 (not b!254840) (not bm!24053) (not bm!24054))
(check-sat b_and!13717 (not b_next!6697))
(get-model)

(declare-fun d!61383 () Bool)

(assert (=> d!61383 (contains!1825 (getCurrentListMap!1397 (_keys!6859 thiss!1504) (_values!4687 thiss!1504) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)) key!932)))

(declare-fun lt!127731 () Unit!7867)

(declare-fun choose!1223 (array!12445 array!12443 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 64) (_ BitVec 32) Int) Unit!7867)

(assert (=> d!61383 (= lt!127731 (choose!1223 (_keys!6859 thiss!1504) (_values!4687 thiss!1504) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!61383 (validMask!0 (mask!10957 thiss!1504))))

(assert (=> d!61383 (= (lemmaArrayContainsKeyThenInListMap!228 (_keys!6859 thiss!1504) (_values!4687 thiss!1504) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)) lt!127731)))

(declare-fun bs!9034 () Bool)

(assert (= bs!9034 d!61383))

(assert (=> bs!9034 m!269917))

(assert (=> bs!9034 m!269917))

(declare-fun m!270031 () Bool)

(assert (=> bs!9034 m!270031))

(declare-fun m!270033 () Bool)

(assert (=> bs!9034 m!270033))

(declare-fun m!270035 () Bool)

(assert (=> bs!9034 m!270035))

(assert (=> b!254843 d!61383))

(declare-fun d!61385 () Bool)

(declare-fun res!124769 () Bool)

(declare-fun e!165275 () Bool)

(assert (=> d!61385 (=> (not res!124769) (not e!165275))))

(declare-fun simpleValid!271 (LongMapFixedSize!3772) Bool)

(assert (=> d!61385 (= res!124769 (simpleValid!271 thiss!1504))))

(assert (=> d!61385 (= (valid!1477 thiss!1504) e!165275)))

(declare-fun b!254979 () Bool)

(declare-fun res!124770 () Bool)

(assert (=> b!254979 (=> (not res!124770) (not e!165275))))

(assert (=> b!254979 (= res!124770 (= (arrayCountValidKeys!0 (_keys!6859 thiss!1504) #b00000000000000000000000000000000 (size!6244 (_keys!6859 thiss!1504))) (_size!1935 thiss!1504)))))

(declare-fun b!254980 () Bool)

(declare-fun res!124771 () Bool)

(assert (=> b!254980 (=> (not res!124771) (not e!165275))))

(assert (=> b!254980 (= res!124771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6859 thiss!1504) (mask!10957 thiss!1504)))))

(declare-fun b!254981 () Bool)

(assert (=> b!254981 (= e!165275 (arrayNoDuplicates!0 (_keys!6859 thiss!1504) #b00000000000000000000000000000000 Nil!3744))))

(assert (= (and d!61385 res!124769) b!254979))

(assert (= (and b!254979 res!124770) b!254980))

(assert (= (and b!254980 res!124771) b!254981))

(declare-fun m!270037 () Bool)

(assert (=> d!61385 m!270037))

(assert (=> b!254979 m!269891))

(declare-fun m!270039 () Bool)

(assert (=> b!254980 m!270039))

(declare-fun m!270041 () Bool)

(assert (=> b!254981 m!270041))

(assert (=> start!24338 d!61385))

(declare-fun bm!24071 () Bool)

(declare-fun lt!127736 () SeekEntryResult!1151)

(declare-fun c!43033 () Bool)

(declare-fun call!24074 () Bool)

(assert (=> bm!24071 (= call!24074 (inRange!0 (ite c!43033 (index!6774 lt!127736) (index!6777 lt!127736)) (mask!10957 thiss!1504)))))

(declare-fun b!254998 () Bool)

(declare-fun e!165287 () Bool)

(declare-fun call!24075 () Bool)

(assert (=> b!254998 (= e!165287 (not call!24075))))

(declare-fun b!254999 () Bool)

(declare-fun e!165284 () Bool)

(assert (=> b!254999 (= e!165284 (not call!24075))))

(declare-fun b!255000 () Bool)

(declare-fun e!165286 () Bool)

(assert (=> b!255000 (= e!165286 ((_ is Undefined!1151) lt!127736))))

(declare-fun d!61387 () Bool)

(declare-fun e!165285 () Bool)

(assert (=> d!61387 e!165285))

(assert (=> d!61387 (= c!43033 ((_ is MissingZero!1151) lt!127736))))

(assert (=> d!61387 (= lt!127736 (seekEntryOrOpen!0 key!932 (_keys!6859 thiss!1504) (mask!10957 thiss!1504)))))

(declare-fun lt!127737 () Unit!7867)

(declare-fun choose!1224 (array!12445 array!12443 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 64) Int) Unit!7867)

(assert (=> d!61387 (= lt!127737 (choose!1224 (_keys!6859 thiss!1504) (_values!4687 thiss!1504) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) key!932 (defaultEntry!4704 thiss!1504)))))

(assert (=> d!61387 (validMask!0 (mask!10957 thiss!1504))))

(assert (=> d!61387 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!417 (_keys!6859 thiss!1504) (_values!4687 thiss!1504) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) key!932 (defaultEntry!4704 thiss!1504)) lt!127737)))

(declare-fun b!255001 () Bool)

(assert (=> b!255001 (= e!165285 e!165287)))

(declare-fun res!124780 () Bool)

(assert (=> b!255001 (= res!124780 call!24074)))

(assert (=> b!255001 (=> (not res!124780) (not e!165287))))

(declare-fun b!255002 () Bool)

(declare-fun res!124782 () Bool)

(assert (=> b!255002 (=> (not res!124782) (not e!165284))))

(assert (=> b!255002 (= res!124782 call!24074)))

(assert (=> b!255002 (= e!165286 e!165284)))

(declare-fun b!255003 () Bool)

(assert (=> b!255003 (and (bvsge (index!6774 lt!127736) #b00000000000000000000000000000000) (bvslt (index!6774 lt!127736) (size!6244 (_keys!6859 thiss!1504))))))

(declare-fun res!124783 () Bool)

(assert (=> b!255003 (= res!124783 (= (select (arr!5896 (_keys!6859 thiss!1504)) (index!6774 lt!127736)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!255003 (=> (not res!124783) (not e!165287))))

(declare-fun bm!24072 () Bool)

(assert (=> bm!24072 (= call!24075 (arrayContainsKey!0 (_keys!6859 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!255004 () Bool)

(assert (=> b!255004 (= e!165285 e!165286)))

(declare-fun c!43034 () Bool)

(assert (=> b!255004 (= c!43034 ((_ is MissingVacant!1151) lt!127736))))

(declare-fun b!255005 () Bool)

(declare-fun res!124781 () Bool)

(assert (=> b!255005 (=> (not res!124781) (not e!165284))))

(assert (=> b!255005 (= res!124781 (= (select (arr!5896 (_keys!6859 thiss!1504)) (index!6777 lt!127736)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!255005 (and (bvsge (index!6777 lt!127736) #b00000000000000000000000000000000) (bvslt (index!6777 lt!127736) (size!6244 (_keys!6859 thiss!1504))))))

(assert (= (and d!61387 c!43033) b!255001))

(assert (= (and d!61387 (not c!43033)) b!255004))

(assert (= (and b!255001 res!124780) b!255003))

(assert (= (and b!255003 res!124783) b!254998))

(assert (= (and b!255004 c!43034) b!255002))

(assert (= (and b!255004 (not c!43034)) b!255000))

(assert (= (and b!255002 res!124782) b!255005))

(assert (= (and b!255005 res!124781) b!254999))

(assert (= (or b!255001 b!255002) bm!24071))

(assert (= (or b!254998 b!254999) bm!24072))

(assert (=> bm!24072 m!269869))

(declare-fun m!270043 () Bool)

(assert (=> b!255005 m!270043))

(declare-fun m!270045 () Bool)

(assert (=> bm!24071 m!270045))

(declare-fun m!270047 () Bool)

(assert (=> b!255003 m!270047))

(assert (=> d!61387 m!269921))

(declare-fun m!270049 () Bool)

(assert (=> d!61387 m!270049))

(assert (=> d!61387 m!270035))

(assert (=> b!254848 d!61387))

(declare-fun d!61389 () Bool)

(assert (=> d!61389 (= (inRange!0 (ite c!43001 (index!6774 lt!127655) (index!6777 lt!127655)) (mask!10957 thiss!1504)) (and (bvsge (ite c!43001 (index!6774 lt!127655) (index!6777 lt!127655)) #b00000000000000000000000000000000) (bvslt (ite c!43001 (index!6774 lt!127655) (index!6777 lt!127655)) (bvadd (mask!10957 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24053 d!61389))

(declare-fun d!61391 () Bool)

(declare-fun e!165290 () Bool)

(assert (=> d!61391 e!165290))

(declare-fun res!124789 () Bool)

(assert (=> d!61391 (=> (not res!124789) (not e!165290))))

(declare-fun lt!127742 () SeekEntryResult!1151)

(assert (=> d!61391 (= res!124789 ((_ is Found!1151) lt!127742))))

(assert (=> d!61391 (= lt!127742 (seekEntryOrOpen!0 key!932 (_keys!6859 thiss!1504) (mask!10957 thiss!1504)))))

(declare-fun lt!127743 () Unit!7867)

(declare-fun choose!1225 (array!12445 array!12443 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 64) Int) Unit!7867)

(assert (=> d!61391 (= lt!127743 (choose!1225 (_keys!6859 thiss!1504) (_values!4687 thiss!1504) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) key!932 (defaultEntry!4704 thiss!1504)))))

(assert (=> d!61391 (validMask!0 (mask!10957 thiss!1504))))

(assert (=> d!61391 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!418 (_keys!6859 thiss!1504) (_values!4687 thiss!1504) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) key!932 (defaultEntry!4704 thiss!1504)) lt!127743)))

(declare-fun b!255010 () Bool)

(declare-fun res!124788 () Bool)

(assert (=> b!255010 (=> (not res!124788) (not e!165290))))

(assert (=> b!255010 (= res!124788 (inRange!0 (index!6775 lt!127742) (mask!10957 thiss!1504)))))

(declare-fun b!255011 () Bool)

(assert (=> b!255011 (= e!165290 (= (select (arr!5896 (_keys!6859 thiss!1504)) (index!6775 lt!127742)) key!932))))

(assert (=> b!255011 (and (bvsge (index!6775 lt!127742) #b00000000000000000000000000000000) (bvslt (index!6775 lt!127742) (size!6244 (_keys!6859 thiss!1504))))))

(assert (= (and d!61391 res!124789) b!255010))

(assert (= (and b!255010 res!124788) b!255011))

(assert (=> d!61391 m!269921))

(declare-fun m!270051 () Bool)

(assert (=> d!61391 m!270051))

(assert (=> d!61391 m!270035))

(declare-fun m!270053 () Bool)

(assert (=> b!255010 m!270053))

(declare-fun m!270055 () Bool)

(assert (=> b!255011 m!270055))

(assert (=> b!254844 d!61391))

(declare-fun d!61393 () Bool)

(declare-fun res!124794 () Bool)

(declare-fun e!165295 () Bool)

(assert (=> d!61393 (=> res!124794 e!165295)))

(assert (=> d!61393 (= res!124794 (= (select (arr!5896 (_keys!6859 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61393 (= (arrayContainsKey!0 (_keys!6859 thiss!1504) key!932 #b00000000000000000000000000000000) e!165295)))

(declare-fun b!255016 () Bool)

(declare-fun e!165296 () Bool)

(assert (=> b!255016 (= e!165295 e!165296)))

(declare-fun res!124795 () Bool)

(assert (=> b!255016 (=> (not res!124795) (not e!165296))))

(assert (=> b!255016 (= res!124795 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6244 (_keys!6859 thiss!1504))))))

(declare-fun b!255017 () Bool)

(assert (=> b!255017 (= e!165296 (arrayContainsKey!0 (_keys!6859 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61393 (not res!124794)) b!255016))

(assert (= (and b!255016 res!124795) b!255017))

(declare-fun m!270057 () Bool)

(assert (=> d!61393 m!270057))

(declare-fun m!270059 () Bool)

(assert (=> b!255017 m!270059))

(assert (=> bm!24054 d!61393))

(declare-fun d!61395 () Bool)

(declare-fun lt!127750 () SeekEntryResult!1151)

(assert (=> d!61395 (and (or ((_ is Undefined!1151) lt!127750) (not ((_ is Found!1151) lt!127750)) (and (bvsge (index!6775 lt!127750) #b00000000000000000000000000000000) (bvslt (index!6775 lt!127750) (size!6244 (_keys!6859 thiss!1504))))) (or ((_ is Undefined!1151) lt!127750) ((_ is Found!1151) lt!127750) (not ((_ is MissingZero!1151) lt!127750)) (and (bvsge (index!6774 lt!127750) #b00000000000000000000000000000000) (bvslt (index!6774 lt!127750) (size!6244 (_keys!6859 thiss!1504))))) (or ((_ is Undefined!1151) lt!127750) ((_ is Found!1151) lt!127750) ((_ is MissingZero!1151) lt!127750) (not ((_ is MissingVacant!1151) lt!127750)) (and (bvsge (index!6777 lt!127750) #b00000000000000000000000000000000) (bvslt (index!6777 lt!127750) (size!6244 (_keys!6859 thiss!1504))))) (or ((_ is Undefined!1151) lt!127750) (ite ((_ is Found!1151) lt!127750) (= (select (arr!5896 (_keys!6859 thiss!1504)) (index!6775 lt!127750)) key!932) (ite ((_ is MissingZero!1151) lt!127750) (= (select (arr!5896 (_keys!6859 thiss!1504)) (index!6774 lt!127750)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1151) lt!127750) (= (select (arr!5896 (_keys!6859 thiss!1504)) (index!6777 lt!127750)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!165304 () SeekEntryResult!1151)

(assert (=> d!61395 (= lt!127750 e!165304)))

(declare-fun c!43042 () Bool)

(declare-fun lt!127752 () SeekEntryResult!1151)

(assert (=> d!61395 (= c!43042 (and ((_ is Intermediate!1151) lt!127752) (undefined!1963 lt!127752)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12445 (_ BitVec 32)) SeekEntryResult!1151)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61395 (= lt!127752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10957 thiss!1504)) key!932 (_keys!6859 thiss!1504) (mask!10957 thiss!1504)))))

(assert (=> d!61395 (validMask!0 (mask!10957 thiss!1504))))

(assert (=> d!61395 (= (seekEntryOrOpen!0 key!932 (_keys!6859 thiss!1504) (mask!10957 thiss!1504)) lt!127750)))

(declare-fun b!255030 () Bool)

(assert (=> b!255030 (= e!165304 Undefined!1151)))

(declare-fun b!255031 () Bool)

(declare-fun c!43041 () Bool)

(declare-fun lt!127751 () (_ BitVec 64))

(assert (=> b!255031 (= c!43041 (= lt!127751 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!165305 () SeekEntryResult!1151)

(declare-fun e!165303 () SeekEntryResult!1151)

(assert (=> b!255031 (= e!165305 e!165303)))

(declare-fun b!255032 () Bool)

(assert (=> b!255032 (= e!165304 e!165305)))

(assert (=> b!255032 (= lt!127751 (select (arr!5896 (_keys!6859 thiss!1504)) (index!6776 lt!127752)))))

(declare-fun c!43043 () Bool)

(assert (=> b!255032 (= c!43043 (= lt!127751 key!932))))

(declare-fun b!255033 () Bool)

(assert (=> b!255033 (= e!165305 (Found!1151 (index!6776 lt!127752)))))

(declare-fun b!255034 () Bool)

(assert (=> b!255034 (= e!165303 (MissingZero!1151 (index!6776 lt!127752)))))

(declare-fun b!255035 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12445 (_ BitVec 32)) SeekEntryResult!1151)

(assert (=> b!255035 (= e!165303 (seekKeyOrZeroReturnVacant!0 (x!24892 lt!127752) (index!6776 lt!127752) (index!6776 lt!127752) key!932 (_keys!6859 thiss!1504) (mask!10957 thiss!1504)))))

(assert (= (and d!61395 c!43042) b!255030))

(assert (= (and d!61395 (not c!43042)) b!255032))

(assert (= (and b!255032 c!43043) b!255033))

(assert (= (and b!255032 (not c!43043)) b!255031))

(assert (= (and b!255031 c!43041) b!255034))

(assert (= (and b!255031 (not c!43041)) b!255035))

(declare-fun m!270061 () Bool)

(assert (=> d!61395 m!270061))

(declare-fun m!270063 () Bool)

(assert (=> d!61395 m!270063))

(declare-fun m!270065 () Bool)

(assert (=> d!61395 m!270065))

(assert (=> d!61395 m!270063))

(declare-fun m!270067 () Bool)

(assert (=> d!61395 m!270067))

(assert (=> d!61395 m!270035))

(declare-fun m!270069 () Bool)

(assert (=> d!61395 m!270069))

(declare-fun m!270071 () Bool)

(assert (=> b!255032 m!270071))

(declare-fun m!270073 () Bool)

(assert (=> b!255035 m!270073))

(assert (=> b!254845 d!61395))

(declare-fun d!61397 () Bool)

(assert (=> d!61397 (= (inRange!0 index!297 (mask!10957 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10957 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!254840 d!61397))

(declare-fun d!61399 () Bool)

(declare-fun e!165311 () Bool)

(assert (=> d!61399 e!165311))

(declare-fun res!124798 () Bool)

(assert (=> d!61399 (=> res!124798 e!165311)))

(declare-fun lt!127762 () Bool)

(assert (=> d!61399 (= res!124798 (not lt!127762))))

(declare-fun lt!127761 () Bool)

(assert (=> d!61399 (= lt!127762 lt!127761)))

(declare-fun lt!127764 () Unit!7867)

(declare-fun e!165310 () Unit!7867)

(assert (=> d!61399 (= lt!127764 e!165310)))

(declare-fun c!43046 () Bool)

(assert (=> d!61399 (= c!43046 lt!127761)))

(declare-fun containsKey!296 (List!3746 (_ BitVec 64)) Bool)

(assert (=> d!61399 (= lt!127761 (containsKey!296 (toList!1888 lt!127654) key!932))))

(assert (=> d!61399 (= (contains!1825 lt!127654 key!932) lt!127762)))

(declare-fun b!255042 () Bool)

(declare-fun lt!127763 () Unit!7867)

(assert (=> b!255042 (= e!165310 lt!127763)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!245 (List!3746 (_ BitVec 64)) Unit!7867)

(assert (=> b!255042 (= lt!127763 (lemmaContainsKeyImpliesGetValueByKeyDefined!245 (toList!1888 lt!127654) key!932))))

(declare-datatypes ((Option!310 0))(
  ( (Some!309 (v!5400 V!8393)) (None!308) )
))
(declare-fun isDefined!246 (Option!310) Bool)

(declare-fun getValueByKey!304 (List!3746 (_ BitVec 64)) Option!310)

(assert (=> b!255042 (isDefined!246 (getValueByKey!304 (toList!1888 lt!127654) key!932))))

(declare-fun b!255043 () Bool)

(declare-fun Unit!7881 () Unit!7867)

(assert (=> b!255043 (= e!165310 Unit!7881)))

(declare-fun b!255044 () Bool)

(assert (=> b!255044 (= e!165311 (isDefined!246 (getValueByKey!304 (toList!1888 lt!127654) key!932)))))

(assert (= (and d!61399 c!43046) b!255042))

(assert (= (and d!61399 (not c!43046)) b!255043))

(assert (= (and d!61399 (not res!124798)) b!255044))

(declare-fun m!270075 () Bool)

(assert (=> d!61399 m!270075))

(declare-fun m!270077 () Bool)

(assert (=> b!255042 m!270077))

(declare-fun m!270079 () Bool)

(assert (=> b!255042 m!270079))

(assert (=> b!255042 m!270079))

(declare-fun m!270081 () Bool)

(assert (=> b!255042 m!270081))

(assert (=> b!255044 m!270079))

(assert (=> b!255044 m!270079))

(assert (=> b!255044 m!270081))

(assert (=> b!254840 d!61399))

(declare-fun b!255087 () Bool)

(declare-fun e!165345 () ListLongMap!3745)

(declare-fun call!24094 () ListLongMap!3745)

(assert (=> b!255087 (= e!165345 (+!681 call!24094 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4545 thiss!1504))))))

(declare-fun c!43063 () Bool)

(declare-fun call!24093 () ListLongMap!3745)

(declare-fun c!43060 () Bool)

(declare-fun bm!24087 () Bool)

(declare-fun call!24090 () ListLongMap!3745)

(declare-fun call!24092 () ListLongMap!3745)

(assert (=> bm!24087 (= call!24094 (+!681 (ite c!43060 call!24092 (ite c!43063 call!24093 call!24090)) (ite (or c!43060 c!43063) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4545 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4545 thiss!1504)))))))

(declare-fun b!255088 () Bool)

(declare-fun e!165348 () ListLongMap!3745)

(assert (=> b!255088 (= e!165348 call!24090)))

(declare-fun b!255089 () Bool)

(declare-fun res!124818 () Bool)

(declare-fun e!165350 () Bool)

(assert (=> b!255089 (=> (not res!124818) (not e!165350))))

(declare-fun e!165339 () Bool)

(assert (=> b!255089 (= res!124818 e!165339)))

(declare-fun res!124823 () Bool)

(assert (=> b!255089 (=> res!124823 e!165339)))

(declare-fun e!165347 () Bool)

(assert (=> b!255089 (= res!124823 (not e!165347))))

(declare-fun res!124820 () Bool)

(assert (=> b!255089 (=> (not res!124820) (not e!165347))))

(assert (=> b!255089 (= res!124820 (bvslt #b00000000000000000000000000000000 (size!6244 (_keys!6859 thiss!1504))))))

(declare-fun b!255090 () Bool)

(declare-fun call!24095 () ListLongMap!3745)

(assert (=> b!255090 (= e!165348 call!24095)))

(declare-fun bm!24088 () Bool)

(assert (=> bm!24088 (= call!24093 call!24092)))

(declare-fun b!255091 () Bool)

(declare-fun e!165342 () ListLongMap!3745)

(assert (=> b!255091 (= e!165345 e!165342)))

(assert (=> b!255091 (= c!43063 (and (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!255092 () Bool)

(declare-fun e!165341 () Bool)

(assert (=> b!255092 (= e!165350 e!165341)))

(declare-fun c!43059 () Bool)

(assert (=> b!255092 (= c!43059 (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!255093 () Bool)

(declare-fun e!165343 () Bool)

(assert (=> b!255093 (= e!165339 e!165343)))

(declare-fun res!124825 () Bool)

(assert (=> b!255093 (=> (not res!124825) (not e!165343))))

(declare-fun lt!127814 () ListLongMap!3745)

(assert (=> b!255093 (= res!124825 (contains!1825 lt!127814 (select (arr!5896 (_keys!6859 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!255093 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6244 (_keys!6859 thiss!1504))))))

(declare-fun b!255094 () Bool)

(declare-fun e!165338 () Bool)

(declare-fun apply!248 (ListLongMap!3745 (_ BitVec 64)) V!8393)

(assert (=> b!255094 (= e!165338 (= (apply!248 lt!127814 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4545 thiss!1504)))))

(declare-fun b!255095 () Bool)

(declare-fun call!24096 () Bool)

(assert (=> b!255095 (= e!165341 (not call!24096))))

(declare-fun bm!24089 () Bool)

(assert (=> bm!24089 (= call!24095 call!24094)))

(declare-fun b!255096 () Bool)

(declare-fun e!165346 () Bool)

(assert (=> b!255096 (= e!165341 e!165346)))

(declare-fun res!124819 () Bool)

(assert (=> b!255096 (= res!124819 call!24096)))

(assert (=> b!255096 (=> (not res!124819) (not e!165346))))

(declare-fun b!255097 () Bool)

(assert (=> b!255097 (= e!165346 (= (apply!248 lt!127814 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4545 thiss!1504)))))

(declare-fun b!255098 () Bool)

(assert (=> b!255098 (= e!165342 call!24095)))

(declare-fun b!255099 () Bool)

(declare-fun e!165340 () Bool)

(assert (=> b!255099 (= e!165340 e!165338)))

(declare-fun res!124821 () Bool)

(declare-fun call!24091 () Bool)

(assert (=> b!255099 (= res!124821 call!24091)))

(assert (=> b!255099 (=> (not res!124821) (not e!165338))))

(declare-fun bm!24090 () Bool)

(assert (=> bm!24090 (= call!24096 (contains!1825 lt!127814 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24091 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!564 (array!12445 array!12443 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 32) Int) ListLongMap!3745)

(assert (=> bm!24091 (= call!24092 (getCurrentListMapNoExtraKeys!564 (_keys!6859 thiss!1504) (_values!4687 thiss!1504) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun d!61401 () Bool)

(assert (=> d!61401 e!165350))

(declare-fun res!124817 () Bool)

(assert (=> d!61401 (=> (not res!124817) (not e!165350))))

(assert (=> d!61401 (= res!124817 (or (bvsge #b00000000000000000000000000000000 (size!6244 (_keys!6859 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6244 (_keys!6859 thiss!1504))))))))

(declare-fun lt!127820 () ListLongMap!3745)

(assert (=> d!61401 (= lt!127814 lt!127820)))

(declare-fun lt!127829 () Unit!7867)

(declare-fun e!165344 () Unit!7867)

(assert (=> d!61401 (= lt!127829 e!165344)))

(declare-fun c!43062 () Bool)

(declare-fun e!165349 () Bool)

(assert (=> d!61401 (= c!43062 e!165349)))

(declare-fun res!124824 () Bool)

(assert (=> d!61401 (=> (not res!124824) (not e!165349))))

(assert (=> d!61401 (= res!124824 (bvslt #b00000000000000000000000000000000 (size!6244 (_keys!6859 thiss!1504))))))

(assert (=> d!61401 (= lt!127820 e!165345)))

(assert (=> d!61401 (= c!43060 (and (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61401 (validMask!0 (mask!10957 thiss!1504))))

(assert (=> d!61401 (= (getCurrentListMap!1397 (_keys!6859 thiss!1504) (_values!4687 thiss!1504) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)) lt!127814)))

(declare-fun b!255100 () Bool)

(declare-fun Unit!7882 () Unit!7867)

(assert (=> b!255100 (= e!165344 Unit!7882)))

(declare-fun bm!24092 () Bool)

(assert (=> bm!24092 (= call!24090 call!24093)))

(declare-fun b!255101 () Bool)

(declare-fun res!124822 () Bool)

(assert (=> b!255101 (=> (not res!124822) (not e!165350))))

(assert (=> b!255101 (= res!124822 e!165340)))

(declare-fun c!43064 () Bool)

(assert (=> b!255101 (= c!43064 (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!255102 () Bool)

(assert (=> b!255102 (= e!165340 (not call!24091))))

(declare-fun bm!24093 () Bool)

(assert (=> bm!24093 (= call!24091 (contains!1825 lt!127814 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255103 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!255103 (= e!165347 (validKeyInArray!0 (select (arr!5896 (_keys!6859 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!255104 () Bool)

(declare-fun lt!127819 () Unit!7867)

(assert (=> b!255104 (= e!165344 lt!127819)))

(declare-fun lt!127810 () ListLongMap!3745)

(assert (=> b!255104 (= lt!127810 (getCurrentListMapNoExtraKeys!564 (_keys!6859 thiss!1504) (_values!4687 thiss!1504) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun lt!127825 () (_ BitVec 64))

(assert (=> b!255104 (= lt!127825 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127823 () (_ BitVec 64))

(assert (=> b!255104 (= lt!127823 (select (arr!5896 (_keys!6859 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127818 () Unit!7867)

(declare-fun addStillContains!224 (ListLongMap!3745 (_ BitVec 64) V!8393 (_ BitVec 64)) Unit!7867)

(assert (=> b!255104 (= lt!127818 (addStillContains!224 lt!127810 lt!127825 (zeroValue!4545 thiss!1504) lt!127823))))

(assert (=> b!255104 (contains!1825 (+!681 lt!127810 (tuple2!4843 lt!127825 (zeroValue!4545 thiss!1504))) lt!127823)))

(declare-fun lt!127817 () Unit!7867)

(assert (=> b!255104 (= lt!127817 lt!127818)))

(declare-fun lt!127827 () ListLongMap!3745)

(assert (=> b!255104 (= lt!127827 (getCurrentListMapNoExtraKeys!564 (_keys!6859 thiss!1504) (_values!4687 thiss!1504) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun lt!127826 () (_ BitVec 64))

(assert (=> b!255104 (= lt!127826 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127812 () (_ BitVec 64))

(assert (=> b!255104 (= lt!127812 (select (arr!5896 (_keys!6859 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127821 () Unit!7867)

(declare-fun addApplyDifferent!224 (ListLongMap!3745 (_ BitVec 64) V!8393 (_ BitVec 64)) Unit!7867)

(assert (=> b!255104 (= lt!127821 (addApplyDifferent!224 lt!127827 lt!127826 (minValue!4545 thiss!1504) lt!127812))))

(assert (=> b!255104 (= (apply!248 (+!681 lt!127827 (tuple2!4843 lt!127826 (minValue!4545 thiss!1504))) lt!127812) (apply!248 lt!127827 lt!127812))))

(declare-fun lt!127824 () Unit!7867)

(assert (=> b!255104 (= lt!127824 lt!127821)))

(declare-fun lt!127815 () ListLongMap!3745)

(assert (=> b!255104 (= lt!127815 (getCurrentListMapNoExtraKeys!564 (_keys!6859 thiss!1504) (_values!4687 thiss!1504) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun lt!127816 () (_ BitVec 64))

(assert (=> b!255104 (= lt!127816 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127809 () (_ BitVec 64))

(assert (=> b!255104 (= lt!127809 (select (arr!5896 (_keys!6859 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127811 () Unit!7867)

(assert (=> b!255104 (= lt!127811 (addApplyDifferent!224 lt!127815 lt!127816 (zeroValue!4545 thiss!1504) lt!127809))))

(assert (=> b!255104 (= (apply!248 (+!681 lt!127815 (tuple2!4843 lt!127816 (zeroValue!4545 thiss!1504))) lt!127809) (apply!248 lt!127815 lt!127809))))

(declare-fun lt!127822 () Unit!7867)

(assert (=> b!255104 (= lt!127822 lt!127811)))

(declare-fun lt!127830 () ListLongMap!3745)

(assert (=> b!255104 (= lt!127830 (getCurrentListMapNoExtraKeys!564 (_keys!6859 thiss!1504) (_values!4687 thiss!1504) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun lt!127828 () (_ BitVec 64))

(assert (=> b!255104 (= lt!127828 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127813 () (_ BitVec 64))

(assert (=> b!255104 (= lt!127813 (select (arr!5896 (_keys!6859 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255104 (= lt!127819 (addApplyDifferent!224 lt!127830 lt!127828 (minValue!4545 thiss!1504) lt!127813))))

(assert (=> b!255104 (= (apply!248 (+!681 lt!127830 (tuple2!4843 lt!127828 (minValue!4545 thiss!1504))) lt!127813) (apply!248 lt!127830 lt!127813))))

(declare-fun b!255105 () Bool)

(declare-fun get!3029 (ValueCell!2936 V!8393) V!8393)

(declare-fun dynLambda!582 (Int (_ BitVec 64)) V!8393)

(assert (=> b!255105 (= e!165343 (= (apply!248 lt!127814 (select (arr!5896 (_keys!6859 thiss!1504)) #b00000000000000000000000000000000)) (get!3029 (select (arr!5895 (_values!4687 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!582 (defaultEntry!4704 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!255105 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6243 (_values!4687 thiss!1504))))))

(assert (=> b!255105 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6244 (_keys!6859 thiss!1504))))))

(declare-fun b!255106 () Bool)

(assert (=> b!255106 (= e!165349 (validKeyInArray!0 (select (arr!5896 (_keys!6859 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!255107 () Bool)

(declare-fun c!43061 () Bool)

(assert (=> b!255107 (= c!43061 (and (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!255107 (= e!165342 e!165348)))

(assert (= (and d!61401 c!43060) b!255087))

(assert (= (and d!61401 (not c!43060)) b!255091))

(assert (= (and b!255091 c!43063) b!255098))

(assert (= (and b!255091 (not c!43063)) b!255107))

(assert (= (and b!255107 c!43061) b!255090))

(assert (= (and b!255107 (not c!43061)) b!255088))

(assert (= (or b!255090 b!255088) bm!24092))

(assert (= (or b!255098 bm!24092) bm!24088))

(assert (= (or b!255098 b!255090) bm!24089))

(assert (= (or b!255087 bm!24088) bm!24091))

(assert (= (or b!255087 bm!24089) bm!24087))

(assert (= (and d!61401 res!124824) b!255106))

(assert (= (and d!61401 c!43062) b!255104))

(assert (= (and d!61401 (not c!43062)) b!255100))

(assert (= (and d!61401 res!124817) b!255089))

(assert (= (and b!255089 res!124820) b!255103))

(assert (= (and b!255089 (not res!124823)) b!255093))

(assert (= (and b!255093 res!124825) b!255105))

(assert (= (and b!255089 res!124818) b!255101))

(assert (= (and b!255101 c!43064) b!255099))

(assert (= (and b!255101 (not c!43064)) b!255102))

(assert (= (and b!255099 res!124821) b!255094))

(assert (= (or b!255099 b!255102) bm!24093))

(assert (= (and b!255101 res!124822) b!255092))

(assert (= (and b!255092 c!43059) b!255096))

(assert (= (and b!255092 (not c!43059)) b!255095))

(assert (= (and b!255096 res!124819) b!255097))

(assert (= (or b!255096 b!255095) bm!24090))

(declare-fun b_lambda!8121 () Bool)

(assert (=> (not b_lambda!8121) (not b!255105)))

(declare-fun t!8792 () Bool)

(declare-fun tb!3001 () Bool)

(assert (=> (and b!254842 (= (defaultEntry!4704 thiss!1504) (defaultEntry!4704 thiss!1504)) t!8792) tb!3001))

(declare-fun result!5341 () Bool)

(assert (=> tb!3001 (= result!5341 tp_is_empty!6559)))

(assert (=> b!255105 t!8792))

(declare-fun b_and!13723 () Bool)

(assert (= b_and!13717 (and (=> t!8792 result!5341) b_and!13723)))

(declare-fun m!270083 () Bool)

(assert (=> bm!24090 m!270083))

(declare-fun m!270085 () Bool)

(assert (=> b!255094 m!270085))

(declare-fun m!270087 () Bool)

(assert (=> b!255104 m!270087))

(declare-fun m!270089 () Bool)

(assert (=> b!255104 m!270089))

(declare-fun m!270091 () Bool)

(assert (=> b!255104 m!270091))

(declare-fun m!270093 () Bool)

(assert (=> b!255104 m!270093))

(declare-fun m!270095 () Bool)

(assert (=> b!255104 m!270095))

(declare-fun m!270097 () Bool)

(assert (=> b!255104 m!270097))

(declare-fun m!270099 () Bool)

(assert (=> b!255104 m!270099))

(declare-fun m!270101 () Bool)

(assert (=> b!255104 m!270101))

(assert (=> b!255104 m!270089))

(declare-fun m!270103 () Bool)

(assert (=> b!255104 m!270103))

(assert (=> b!255104 m!270097))

(declare-fun m!270105 () Bool)

(assert (=> b!255104 m!270105))

(assert (=> b!255104 m!270057))

(declare-fun m!270107 () Bool)

(assert (=> b!255104 m!270107))

(declare-fun m!270109 () Bool)

(assert (=> b!255104 m!270109))

(declare-fun m!270111 () Bool)

(assert (=> b!255104 m!270111))

(declare-fun m!270113 () Bool)

(assert (=> b!255104 m!270113))

(assert (=> b!255104 m!270111))

(declare-fun m!270115 () Bool)

(assert (=> b!255104 m!270115))

(assert (=> b!255104 m!270101))

(declare-fun m!270117 () Bool)

(assert (=> b!255104 m!270117))

(assert (=> b!255106 m!270057))

(assert (=> b!255106 m!270057))

(declare-fun m!270119 () Bool)

(assert (=> b!255106 m!270119))

(assert (=> bm!24091 m!270093))

(declare-fun m!270121 () Bool)

(assert (=> bm!24087 m!270121))

(declare-fun m!270123 () Bool)

(assert (=> b!255087 m!270123))

(assert (=> b!255103 m!270057))

(assert (=> b!255103 m!270057))

(assert (=> b!255103 m!270119))

(declare-fun m!270125 () Bool)

(assert (=> b!255097 m!270125))

(assert (=> b!255093 m!270057))

(assert (=> b!255093 m!270057))

(declare-fun m!270127 () Bool)

(assert (=> b!255093 m!270127))

(declare-fun m!270129 () Bool)

(assert (=> bm!24093 m!270129))

(assert (=> b!255105 m!270057))

(declare-fun m!270131 () Bool)

(assert (=> b!255105 m!270131))

(assert (=> b!255105 m!270057))

(declare-fun m!270133 () Bool)

(assert (=> b!255105 m!270133))

(declare-fun m!270135 () Bool)

(assert (=> b!255105 m!270135))

(assert (=> b!255105 m!270131))

(assert (=> b!255105 m!270135))

(declare-fun m!270137 () Bool)

(assert (=> b!255105 m!270137))

(assert (=> d!61401 m!270035))

(assert (=> b!254840 d!61401))

(declare-fun b!255121 () Bool)

(declare-fun e!165355 () Bool)

(assert (=> b!255121 (= e!165355 (= (arrayCountValidKeys!0 (array!12446 (store (arr!5896 (_keys!6859 thiss!1504)) index!297 key!932) (size!6244 (_keys!6859 thiss!1504))) #b00000000000000000000000000000000 (size!6244 (_keys!6859 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6859 thiss!1504) #b00000000000000000000000000000000 (size!6244 (_keys!6859 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!255119 () Bool)

(declare-fun res!124835 () Bool)

(declare-fun e!165356 () Bool)

(assert (=> b!255119 (=> (not res!124835) (not e!165356))))

(assert (=> b!255119 (= res!124835 (validKeyInArray!0 key!932))))

(declare-fun b!255118 () Bool)

(declare-fun res!124837 () Bool)

(assert (=> b!255118 (=> (not res!124837) (not e!165356))))

(assert (=> b!255118 (= res!124837 (not (validKeyInArray!0 (select (arr!5896 (_keys!6859 thiss!1504)) index!297))))))

(declare-fun d!61403 () Bool)

(assert (=> d!61403 e!165355))

(declare-fun res!124834 () Bool)

(assert (=> d!61403 (=> (not res!124834) (not e!165355))))

(assert (=> d!61403 (= res!124834 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6244 (_keys!6859 thiss!1504)))))))

(declare-fun lt!127833 () Unit!7867)

(declare-fun choose!1 (array!12445 (_ BitVec 32) (_ BitVec 64)) Unit!7867)

(assert (=> d!61403 (= lt!127833 (choose!1 (_keys!6859 thiss!1504) index!297 key!932))))

(assert (=> d!61403 e!165356))

(declare-fun res!124836 () Bool)

(assert (=> d!61403 (=> (not res!124836) (not e!165356))))

(assert (=> d!61403 (= res!124836 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6244 (_keys!6859 thiss!1504)))))))

(assert (=> d!61403 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6859 thiss!1504) index!297 key!932) lt!127833)))

(declare-fun b!255120 () Bool)

(assert (=> b!255120 (= e!165356 (bvslt (size!6244 (_keys!6859 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!61403 res!124836) b!255118))

(assert (= (and b!255118 res!124837) b!255119))

(assert (= (and b!255119 res!124835) b!255120))

(assert (= (and d!61403 res!124834) b!255121))

(assert (=> b!255121 m!269889))

(declare-fun m!270139 () Bool)

(assert (=> b!255121 m!270139))

(assert (=> b!255121 m!269891))

(declare-fun m!270141 () Bool)

(assert (=> b!255119 m!270141))

(declare-fun m!270143 () Bool)

(assert (=> b!255118 m!270143))

(assert (=> b!255118 m!270143))

(declare-fun m!270145 () Bool)

(assert (=> b!255118 m!270145))

(declare-fun m!270147 () Bool)

(assert (=> d!61403 m!270147))

(assert (=> b!254833 d!61403))

(declare-fun b!255122 () Bool)

(declare-fun e!165364 () ListLongMap!3745)

(declare-fun call!24101 () ListLongMap!3745)

(assert (=> b!255122 (= e!165364 (+!681 call!24101 (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4545 thiss!1504))))))

(declare-fun call!24097 () ListLongMap!3745)

(declare-fun bm!24094 () Bool)

(declare-fun c!43066 () Bool)

(declare-fun call!24100 () ListLongMap!3745)

(declare-fun call!24099 () ListLongMap!3745)

(declare-fun c!43069 () Bool)

(assert (=> bm!24094 (= call!24101 (+!681 (ite c!43066 call!24099 (ite c!43069 call!24100 call!24097)) (ite (or c!43066 c!43069) (tuple2!4843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4545 thiss!1504)) (tuple2!4843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4545 thiss!1504)))))))

(declare-fun b!255123 () Bool)

(declare-fun e!165367 () ListLongMap!3745)

(assert (=> b!255123 (= e!165367 call!24097)))

(declare-fun b!255124 () Bool)

(declare-fun res!124839 () Bool)

(declare-fun e!165369 () Bool)

(assert (=> b!255124 (=> (not res!124839) (not e!165369))))

(declare-fun e!165358 () Bool)

(assert (=> b!255124 (= res!124839 e!165358)))

(declare-fun res!124844 () Bool)

(assert (=> b!255124 (=> res!124844 e!165358)))

(declare-fun e!165366 () Bool)

(assert (=> b!255124 (= res!124844 (not e!165366))))

(declare-fun res!124841 () Bool)

(assert (=> b!255124 (=> (not res!124841) (not e!165366))))

(assert (=> b!255124 (= res!124841 (bvslt #b00000000000000000000000000000000 (size!6244 lt!127653)))))

(declare-fun b!255125 () Bool)

(declare-fun call!24102 () ListLongMap!3745)

(assert (=> b!255125 (= e!165367 call!24102)))

(declare-fun bm!24095 () Bool)

(assert (=> bm!24095 (= call!24100 call!24099)))

(declare-fun b!255126 () Bool)

(declare-fun e!165361 () ListLongMap!3745)

(assert (=> b!255126 (= e!165364 e!165361)))

(assert (=> b!255126 (= c!43069 (and (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!255127 () Bool)

(declare-fun e!165360 () Bool)

(assert (=> b!255127 (= e!165369 e!165360)))

(declare-fun c!43065 () Bool)

(assert (=> b!255127 (= c!43065 (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!255128 () Bool)

(declare-fun e!165362 () Bool)

(assert (=> b!255128 (= e!165358 e!165362)))

(declare-fun res!124846 () Bool)

(assert (=> b!255128 (=> (not res!124846) (not e!165362))))

(declare-fun lt!127839 () ListLongMap!3745)

(assert (=> b!255128 (= res!124846 (contains!1825 lt!127839 (select (arr!5896 lt!127653) #b00000000000000000000000000000000)))))

(assert (=> b!255128 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6244 lt!127653)))))

(declare-fun b!255129 () Bool)

(declare-fun e!165357 () Bool)

(assert (=> b!255129 (= e!165357 (= (apply!248 lt!127839 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4545 thiss!1504)))))

(declare-fun b!255130 () Bool)

(declare-fun call!24103 () Bool)

(assert (=> b!255130 (= e!165360 (not call!24103))))

(declare-fun bm!24096 () Bool)

(assert (=> bm!24096 (= call!24102 call!24101)))

(declare-fun b!255131 () Bool)

(declare-fun e!165365 () Bool)

(assert (=> b!255131 (= e!165360 e!165365)))

(declare-fun res!124840 () Bool)

(assert (=> b!255131 (= res!124840 call!24103)))

(assert (=> b!255131 (=> (not res!124840) (not e!165365))))

(declare-fun b!255132 () Bool)

(assert (=> b!255132 (= e!165365 (= (apply!248 lt!127839 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4545 thiss!1504)))))

(declare-fun b!255133 () Bool)

(assert (=> b!255133 (= e!165361 call!24102)))

(declare-fun b!255134 () Bool)

(declare-fun e!165359 () Bool)

(assert (=> b!255134 (= e!165359 e!165357)))

(declare-fun res!124842 () Bool)

(declare-fun call!24098 () Bool)

(assert (=> b!255134 (= res!124842 call!24098)))

(assert (=> b!255134 (=> (not res!124842) (not e!165357))))

(declare-fun bm!24097 () Bool)

(assert (=> bm!24097 (= call!24103 (contains!1825 lt!127839 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24098 () Bool)

(assert (=> bm!24098 (= call!24099 (getCurrentListMapNoExtraKeys!564 lt!127653 (array!12444 (store (arr!5895 (_values!4687 thiss!1504)) index!297 (ValueCellFull!2936 v!346)) (size!6243 (_values!4687 thiss!1504))) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun d!61405 () Bool)

(assert (=> d!61405 e!165369))

(declare-fun res!124838 () Bool)

(assert (=> d!61405 (=> (not res!124838) (not e!165369))))

(assert (=> d!61405 (= res!124838 (or (bvsge #b00000000000000000000000000000000 (size!6244 lt!127653)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6244 lt!127653)))))))

(declare-fun lt!127845 () ListLongMap!3745)

(assert (=> d!61405 (= lt!127839 lt!127845)))

(declare-fun lt!127854 () Unit!7867)

(declare-fun e!165363 () Unit!7867)

(assert (=> d!61405 (= lt!127854 e!165363)))

(declare-fun c!43068 () Bool)

(declare-fun e!165368 () Bool)

(assert (=> d!61405 (= c!43068 e!165368)))

(declare-fun res!124845 () Bool)

(assert (=> d!61405 (=> (not res!124845) (not e!165368))))

(assert (=> d!61405 (= res!124845 (bvslt #b00000000000000000000000000000000 (size!6244 lt!127653)))))

(assert (=> d!61405 (= lt!127845 e!165364)))

(assert (=> d!61405 (= c!43066 (and (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61405 (validMask!0 (mask!10957 thiss!1504))))

(assert (=> d!61405 (= (getCurrentListMap!1397 lt!127653 (array!12444 (store (arr!5895 (_values!4687 thiss!1504)) index!297 (ValueCellFull!2936 v!346)) (size!6243 (_values!4687 thiss!1504))) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)) lt!127839)))

(declare-fun b!255135 () Bool)

(declare-fun Unit!7883 () Unit!7867)

(assert (=> b!255135 (= e!165363 Unit!7883)))

(declare-fun bm!24099 () Bool)

(assert (=> bm!24099 (= call!24097 call!24100)))

(declare-fun b!255136 () Bool)

(declare-fun res!124843 () Bool)

(assert (=> b!255136 (=> (not res!124843) (not e!165369))))

(assert (=> b!255136 (= res!124843 e!165359)))

(declare-fun c!43070 () Bool)

(assert (=> b!255136 (= c!43070 (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!255137 () Bool)

(assert (=> b!255137 (= e!165359 (not call!24098))))

(declare-fun bm!24100 () Bool)

(assert (=> bm!24100 (= call!24098 (contains!1825 lt!127839 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255138 () Bool)

(assert (=> b!255138 (= e!165366 (validKeyInArray!0 (select (arr!5896 lt!127653) #b00000000000000000000000000000000)))))

(declare-fun b!255139 () Bool)

(declare-fun lt!127844 () Unit!7867)

(assert (=> b!255139 (= e!165363 lt!127844)))

(declare-fun lt!127835 () ListLongMap!3745)

(assert (=> b!255139 (= lt!127835 (getCurrentListMapNoExtraKeys!564 lt!127653 (array!12444 (store (arr!5895 (_values!4687 thiss!1504)) index!297 (ValueCellFull!2936 v!346)) (size!6243 (_values!4687 thiss!1504))) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun lt!127850 () (_ BitVec 64))

(assert (=> b!255139 (= lt!127850 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127848 () (_ BitVec 64))

(assert (=> b!255139 (= lt!127848 (select (arr!5896 lt!127653) #b00000000000000000000000000000000))))

(declare-fun lt!127843 () Unit!7867)

(assert (=> b!255139 (= lt!127843 (addStillContains!224 lt!127835 lt!127850 (zeroValue!4545 thiss!1504) lt!127848))))

(assert (=> b!255139 (contains!1825 (+!681 lt!127835 (tuple2!4843 lt!127850 (zeroValue!4545 thiss!1504))) lt!127848)))

(declare-fun lt!127842 () Unit!7867)

(assert (=> b!255139 (= lt!127842 lt!127843)))

(declare-fun lt!127852 () ListLongMap!3745)

(assert (=> b!255139 (= lt!127852 (getCurrentListMapNoExtraKeys!564 lt!127653 (array!12444 (store (arr!5895 (_values!4687 thiss!1504)) index!297 (ValueCellFull!2936 v!346)) (size!6243 (_values!4687 thiss!1504))) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun lt!127851 () (_ BitVec 64))

(assert (=> b!255139 (= lt!127851 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127837 () (_ BitVec 64))

(assert (=> b!255139 (= lt!127837 (select (arr!5896 lt!127653) #b00000000000000000000000000000000))))

(declare-fun lt!127846 () Unit!7867)

(assert (=> b!255139 (= lt!127846 (addApplyDifferent!224 lt!127852 lt!127851 (minValue!4545 thiss!1504) lt!127837))))

(assert (=> b!255139 (= (apply!248 (+!681 lt!127852 (tuple2!4843 lt!127851 (minValue!4545 thiss!1504))) lt!127837) (apply!248 lt!127852 lt!127837))))

(declare-fun lt!127849 () Unit!7867)

(assert (=> b!255139 (= lt!127849 lt!127846)))

(declare-fun lt!127840 () ListLongMap!3745)

(assert (=> b!255139 (= lt!127840 (getCurrentListMapNoExtraKeys!564 lt!127653 (array!12444 (store (arr!5895 (_values!4687 thiss!1504)) index!297 (ValueCellFull!2936 v!346)) (size!6243 (_values!4687 thiss!1504))) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun lt!127841 () (_ BitVec 64))

(assert (=> b!255139 (= lt!127841 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127834 () (_ BitVec 64))

(assert (=> b!255139 (= lt!127834 (select (arr!5896 lt!127653) #b00000000000000000000000000000000))))

(declare-fun lt!127836 () Unit!7867)

(assert (=> b!255139 (= lt!127836 (addApplyDifferent!224 lt!127840 lt!127841 (zeroValue!4545 thiss!1504) lt!127834))))

(assert (=> b!255139 (= (apply!248 (+!681 lt!127840 (tuple2!4843 lt!127841 (zeroValue!4545 thiss!1504))) lt!127834) (apply!248 lt!127840 lt!127834))))

(declare-fun lt!127847 () Unit!7867)

(assert (=> b!255139 (= lt!127847 lt!127836)))

(declare-fun lt!127855 () ListLongMap!3745)

(assert (=> b!255139 (= lt!127855 (getCurrentListMapNoExtraKeys!564 lt!127653 (array!12444 (store (arr!5895 (_values!4687 thiss!1504)) index!297 (ValueCellFull!2936 v!346)) (size!6243 (_values!4687 thiss!1504))) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)))))

(declare-fun lt!127853 () (_ BitVec 64))

(assert (=> b!255139 (= lt!127853 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127838 () (_ BitVec 64))

(assert (=> b!255139 (= lt!127838 (select (arr!5896 lt!127653) #b00000000000000000000000000000000))))

(assert (=> b!255139 (= lt!127844 (addApplyDifferent!224 lt!127855 lt!127853 (minValue!4545 thiss!1504) lt!127838))))

(assert (=> b!255139 (= (apply!248 (+!681 lt!127855 (tuple2!4843 lt!127853 (minValue!4545 thiss!1504))) lt!127838) (apply!248 lt!127855 lt!127838))))

(declare-fun b!255140 () Bool)

(assert (=> b!255140 (= e!165362 (= (apply!248 lt!127839 (select (arr!5896 lt!127653) #b00000000000000000000000000000000)) (get!3029 (select (arr!5895 (array!12444 (store (arr!5895 (_values!4687 thiss!1504)) index!297 (ValueCellFull!2936 v!346)) (size!6243 (_values!4687 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!582 (defaultEntry!4704 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!255140 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6243 (array!12444 (store (arr!5895 (_values!4687 thiss!1504)) index!297 (ValueCellFull!2936 v!346)) (size!6243 (_values!4687 thiss!1504))))))))

(assert (=> b!255140 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6244 lt!127653)))))

(declare-fun b!255141 () Bool)

(assert (=> b!255141 (= e!165368 (validKeyInArray!0 (select (arr!5896 lt!127653) #b00000000000000000000000000000000)))))

(declare-fun b!255142 () Bool)

(declare-fun c!43067 () Bool)

(assert (=> b!255142 (= c!43067 (and (not (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4441 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!255142 (= e!165361 e!165367)))

(assert (= (and d!61405 c!43066) b!255122))

(assert (= (and d!61405 (not c!43066)) b!255126))

(assert (= (and b!255126 c!43069) b!255133))

(assert (= (and b!255126 (not c!43069)) b!255142))

(assert (= (and b!255142 c!43067) b!255125))

(assert (= (and b!255142 (not c!43067)) b!255123))

(assert (= (or b!255125 b!255123) bm!24099))

(assert (= (or b!255133 bm!24099) bm!24095))

(assert (= (or b!255133 b!255125) bm!24096))

(assert (= (or b!255122 bm!24095) bm!24098))

(assert (= (or b!255122 bm!24096) bm!24094))

(assert (= (and d!61405 res!124845) b!255141))

(assert (= (and d!61405 c!43068) b!255139))

(assert (= (and d!61405 (not c!43068)) b!255135))

(assert (= (and d!61405 res!124838) b!255124))

(assert (= (and b!255124 res!124841) b!255138))

(assert (= (and b!255124 (not res!124844)) b!255128))

(assert (= (and b!255128 res!124846) b!255140))

(assert (= (and b!255124 res!124839) b!255136))

(assert (= (and b!255136 c!43070) b!255134))

(assert (= (and b!255136 (not c!43070)) b!255137))

(assert (= (and b!255134 res!124842) b!255129))

(assert (= (or b!255134 b!255137) bm!24100))

(assert (= (and b!255136 res!124843) b!255127))

(assert (= (and b!255127 c!43065) b!255131))

(assert (= (and b!255127 (not c!43065)) b!255130))

(assert (= (and b!255131 res!124840) b!255132))

(assert (= (or b!255131 b!255130) bm!24097))

(declare-fun b_lambda!8123 () Bool)

(assert (=> (not b_lambda!8123) (not b!255140)))

(assert (=> b!255140 t!8792))

(declare-fun b_and!13725 () Bool)

(assert (= b_and!13723 (and (=> t!8792 result!5341) b_and!13725)))

(declare-fun m!270149 () Bool)

(assert (=> bm!24097 m!270149))

(declare-fun m!270151 () Bool)

(assert (=> b!255129 m!270151))

(declare-fun m!270153 () Bool)

(assert (=> b!255139 m!270153))

(declare-fun m!270155 () Bool)

(assert (=> b!255139 m!270155))

(declare-fun m!270157 () Bool)

(assert (=> b!255139 m!270157))

(declare-fun m!270159 () Bool)

(assert (=> b!255139 m!270159))

(declare-fun m!270161 () Bool)

(assert (=> b!255139 m!270161))

(declare-fun m!270163 () Bool)

(assert (=> b!255139 m!270163))

(declare-fun m!270165 () Bool)

(assert (=> b!255139 m!270165))

(declare-fun m!270167 () Bool)

(assert (=> b!255139 m!270167))

(assert (=> b!255139 m!270155))

(declare-fun m!270169 () Bool)

(assert (=> b!255139 m!270169))

(assert (=> b!255139 m!270163))

(declare-fun m!270171 () Bool)

(assert (=> b!255139 m!270171))

(declare-fun m!270173 () Bool)

(assert (=> b!255139 m!270173))

(declare-fun m!270175 () Bool)

(assert (=> b!255139 m!270175))

(declare-fun m!270177 () Bool)

(assert (=> b!255139 m!270177))

(declare-fun m!270179 () Bool)

(assert (=> b!255139 m!270179))

(declare-fun m!270181 () Bool)

(assert (=> b!255139 m!270181))

(assert (=> b!255139 m!270179))

(declare-fun m!270183 () Bool)

(assert (=> b!255139 m!270183))

(assert (=> b!255139 m!270167))

(declare-fun m!270185 () Bool)

(assert (=> b!255139 m!270185))

(assert (=> b!255141 m!270173))

(assert (=> b!255141 m!270173))

(declare-fun m!270187 () Bool)

(assert (=> b!255141 m!270187))

(assert (=> bm!24098 m!270159))

(declare-fun m!270189 () Bool)

(assert (=> bm!24094 m!270189))

(declare-fun m!270191 () Bool)

(assert (=> b!255122 m!270191))

(assert (=> b!255138 m!270173))

(assert (=> b!255138 m!270173))

(assert (=> b!255138 m!270187))

(declare-fun m!270193 () Bool)

(assert (=> b!255132 m!270193))

(assert (=> b!255128 m!270173))

(assert (=> b!255128 m!270173))

(declare-fun m!270195 () Bool)

(assert (=> b!255128 m!270195))

(declare-fun m!270197 () Bool)

(assert (=> bm!24100 m!270197))

(assert (=> b!255140 m!270173))

(declare-fun m!270199 () Bool)

(assert (=> b!255140 m!270199))

(assert (=> b!255140 m!270173))

(declare-fun m!270201 () Bool)

(assert (=> b!255140 m!270201))

(assert (=> b!255140 m!270135))

(assert (=> b!255140 m!270199))

(assert (=> b!255140 m!270135))

(declare-fun m!270203 () Bool)

(assert (=> b!255140 m!270203))

(assert (=> d!61405 m!270035))

(assert (=> b!254833 d!61405))

(declare-fun bm!24103 () Bool)

(declare-fun call!24106 () (_ BitVec 32))

(assert (=> bm!24103 (= call!24106 (arrayCountValidKeys!0 (_keys!6859 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6244 (_keys!6859 thiss!1504))))))

(declare-fun b!255152 () Bool)

(declare-fun e!165374 () (_ BitVec 32))

(assert (=> b!255152 (= e!165374 (bvadd #b00000000000000000000000000000001 call!24106))))

(declare-fun b!255153 () Bool)

(declare-fun e!165375 () (_ BitVec 32))

(assert (=> b!255153 (= e!165375 e!165374)))

(declare-fun c!43075 () Bool)

(assert (=> b!255153 (= c!43075 (validKeyInArray!0 (select (arr!5896 (_keys!6859 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!255154 () Bool)

(assert (=> b!255154 (= e!165375 #b00000000000000000000000000000000)))

(declare-fun b!255151 () Bool)

(assert (=> b!255151 (= e!165374 call!24106)))

(declare-fun d!61407 () Bool)

(declare-fun lt!127858 () (_ BitVec 32))

(assert (=> d!61407 (and (bvsge lt!127858 #b00000000000000000000000000000000) (bvsle lt!127858 (bvsub (size!6244 (_keys!6859 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61407 (= lt!127858 e!165375)))

(declare-fun c!43076 () Bool)

(assert (=> d!61407 (= c!43076 (bvsge #b00000000000000000000000000000000 (size!6244 (_keys!6859 thiss!1504))))))

(assert (=> d!61407 (and (bvsle #b00000000000000000000000000000000 (size!6244 (_keys!6859 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6244 (_keys!6859 thiss!1504)) (size!6244 (_keys!6859 thiss!1504))))))

(assert (=> d!61407 (= (arrayCountValidKeys!0 (_keys!6859 thiss!1504) #b00000000000000000000000000000000 (size!6244 (_keys!6859 thiss!1504))) lt!127858)))

(assert (= (and d!61407 c!43076) b!255154))

(assert (= (and d!61407 (not c!43076)) b!255153))

(assert (= (and b!255153 c!43075) b!255152))

(assert (= (and b!255153 (not c!43075)) b!255151))

(assert (= (or b!255152 b!255151) bm!24103))

(declare-fun m!270205 () Bool)

(assert (=> bm!24103 m!270205))

(assert (=> b!255153 m!270057))

(assert (=> b!255153 m!270057))

(assert (=> b!255153 m!270119))

(assert (=> b!254833 d!61407))

(declare-fun d!61409 () Bool)

(declare-fun e!165378 () Bool)

(assert (=> d!61409 e!165378))

(declare-fun res!124849 () Bool)

(assert (=> d!61409 (=> (not res!124849) (not e!165378))))

(assert (=> d!61409 (= res!124849 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6244 (_keys!6859 thiss!1504))) (bvslt index!297 (size!6243 (_values!4687 thiss!1504)))))))

(declare-fun lt!127861 () Unit!7867)

(declare-fun choose!1226 (array!12445 array!12443 (_ BitVec 32) (_ BitVec 32) V!8393 V!8393 (_ BitVec 32) (_ BitVec 64) V!8393 Int) Unit!7867)

(assert (=> d!61409 (= lt!127861 (choose!1226 (_keys!6859 thiss!1504) (_values!4687 thiss!1504) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) index!297 key!932 v!346 (defaultEntry!4704 thiss!1504)))))

(assert (=> d!61409 (validMask!0 (mask!10957 thiss!1504))))

(assert (=> d!61409 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!92 (_keys!6859 thiss!1504) (_values!4687 thiss!1504) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) index!297 key!932 v!346 (defaultEntry!4704 thiss!1504)) lt!127861)))

(declare-fun b!255157 () Bool)

(assert (=> b!255157 (= e!165378 (= (+!681 (getCurrentListMap!1397 (_keys!6859 thiss!1504) (_values!4687 thiss!1504) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504)) (tuple2!4843 key!932 v!346)) (getCurrentListMap!1397 (array!12446 (store (arr!5896 (_keys!6859 thiss!1504)) index!297 key!932) (size!6244 (_keys!6859 thiss!1504))) (array!12444 (store (arr!5895 (_values!4687 thiss!1504)) index!297 (ValueCellFull!2936 v!346)) (size!6243 (_values!4687 thiss!1504))) (mask!10957 thiss!1504) (extraKeys!4441 thiss!1504) (zeroValue!4545 thiss!1504) (minValue!4545 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4704 thiss!1504))))))

(assert (= (and d!61409 res!124849) b!255157))

(declare-fun m!270207 () Bool)

(assert (=> d!61409 m!270207))

(assert (=> d!61409 m!270035))

(assert (=> b!255157 m!269917))

(assert (=> b!255157 m!269875))

(declare-fun m!270209 () Bool)

(assert (=> b!255157 m!270209))

(assert (=> b!255157 m!269889))

(assert (=> b!255157 m!269917))

(declare-fun m!270211 () Bool)

(assert (=> b!255157 m!270211))

(assert (=> b!254833 d!61409))

(declare-fun d!61411 () Bool)

(declare-fun res!124854 () Bool)

(declare-fun e!165385 () Bool)

(assert (=> d!61411 (=> res!124854 e!165385)))

(assert (=> d!61411 (= res!124854 (bvsge #b00000000000000000000000000000000 (size!6244 lt!127653)))))

(assert (=> d!61411 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127653 (mask!10957 thiss!1504)) e!165385)))

(declare-fun b!255166 () Bool)

(declare-fun e!165387 () Bool)

(declare-fun e!165386 () Bool)

(assert (=> b!255166 (= e!165387 e!165386)))

(declare-fun lt!127869 () (_ BitVec 64))

(assert (=> b!255166 (= lt!127869 (select (arr!5896 lt!127653) #b00000000000000000000000000000000))))

(declare-fun lt!127870 () Unit!7867)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12445 (_ BitVec 64) (_ BitVec 32)) Unit!7867)

(assert (=> b!255166 (= lt!127870 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!127653 lt!127869 #b00000000000000000000000000000000))))

(assert (=> b!255166 (arrayContainsKey!0 lt!127653 lt!127869 #b00000000000000000000000000000000)))

(declare-fun lt!127868 () Unit!7867)

(assert (=> b!255166 (= lt!127868 lt!127870)))

(declare-fun res!124855 () Bool)

(assert (=> b!255166 (= res!124855 (= (seekEntryOrOpen!0 (select (arr!5896 lt!127653) #b00000000000000000000000000000000) lt!127653 (mask!10957 thiss!1504)) (Found!1151 #b00000000000000000000000000000000)))))

(assert (=> b!255166 (=> (not res!124855) (not e!165386))))

(declare-fun b!255167 () Bool)

(assert (=> b!255167 (= e!165385 e!165387)))

(declare-fun c!43079 () Bool)

(assert (=> b!255167 (= c!43079 (validKeyInArray!0 (select (arr!5896 lt!127653) #b00000000000000000000000000000000)))))

(declare-fun b!255168 () Bool)

(declare-fun call!24109 () Bool)

(assert (=> b!255168 (= e!165387 call!24109)))

(declare-fun b!255169 () Bool)

(assert (=> b!255169 (= e!165386 call!24109)))

(declare-fun bm!24106 () Bool)

(assert (=> bm!24106 (= call!24109 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!127653 (mask!10957 thiss!1504)))))

(assert (= (and d!61411 (not res!124854)) b!255167))

(assert (= (and b!255167 c!43079) b!255166))

(assert (= (and b!255167 (not c!43079)) b!255168))

(assert (= (and b!255166 res!124855) b!255169))

(assert (= (or b!255169 b!255168) bm!24106))

(assert (=> b!255166 m!270173))

(declare-fun m!270213 () Bool)

(assert (=> b!255166 m!270213))

(declare-fun m!270215 () Bool)

(assert (=> b!255166 m!270215))

(assert (=> b!255166 m!270173))

(declare-fun m!270217 () Bool)

(assert (=> b!255166 m!270217))

(assert (=> b!255167 m!270173))

(assert (=> b!255167 m!270173))

(assert (=> b!255167 m!270187))

(declare-fun m!270219 () Bool)

(assert (=> bm!24106 m!270219))

(assert (=> b!254833 d!61411))

(declare-fun bm!24107 () Bool)

(declare-fun call!24110 () (_ BitVec 32))

(assert (=> bm!24107 (= call!24110 (arrayCountValidKeys!0 lt!127653 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6244 (_keys!6859 thiss!1504))))))

(declare-fun b!255171 () Bool)

(declare-fun e!165388 () (_ BitVec 32))

(assert (=> b!255171 (= e!165388 (bvadd #b00000000000000000000000000000001 call!24110))))

(declare-fun b!255172 () Bool)

(declare-fun e!165389 () (_ BitVec 32))

(assert (=> b!255172 (= e!165389 e!165388)))

(declare-fun c!43080 () Bool)

(assert (=> b!255172 (= c!43080 (validKeyInArray!0 (select (arr!5896 lt!127653) #b00000000000000000000000000000000)))))

(declare-fun b!255173 () Bool)

(assert (=> b!255173 (= e!165389 #b00000000000000000000000000000000)))

(declare-fun b!255170 () Bool)

(assert (=> b!255170 (= e!165388 call!24110)))

(declare-fun d!61413 () Bool)

(declare-fun lt!127871 () (_ BitVec 32))

(assert (=> d!61413 (and (bvsge lt!127871 #b00000000000000000000000000000000) (bvsle lt!127871 (bvsub (size!6244 lt!127653) #b00000000000000000000000000000000)))))

(assert (=> d!61413 (= lt!127871 e!165389)))

(declare-fun c!43081 () Bool)

(assert (=> d!61413 (= c!43081 (bvsge #b00000000000000000000000000000000 (size!6244 (_keys!6859 thiss!1504))))))

(assert (=> d!61413 (and (bvsle #b00000000000000000000000000000000 (size!6244 (_keys!6859 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6244 (_keys!6859 thiss!1504)) (size!6244 lt!127653)))))

(assert (=> d!61413 (= (arrayCountValidKeys!0 lt!127653 #b00000000000000000000000000000000 (size!6244 (_keys!6859 thiss!1504))) lt!127871)))

(assert (= (and d!61413 c!43081) b!255173))

(assert (= (and d!61413 (not c!43081)) b!255172))

(assert (= (and b!255172 c!43080) b!255171))

(assert (= (and b!255172 (not c!43080)) b!255170))

(assert (= (or b!255171 b!255170) bm!24107))

(declare-fun m!270221 () Bool)

(assert (=> bm!24107 m!270221))

(assert (=> b!255172 m!270173))

(assert (=> b!255172 m!270173))

(assert (=> b!255172 m!270187))

(assert (=> b!254833 d!61413))

(declare-fun d!61415 () Bool)

(declare-fun e!165392 () Bool)

(assert (=> d!61415 e!165392))

(declare-fun res!124858 () Bool)

(assert (=> d!61415 (=> (not res!124858) (not e!165392))))

(assert (=> d!61415 (= res!124858 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6244 (_keys!6859 thiss!1504)))))))

(declare-fun lt!127874 () Unit!7867)

(declare-fun choose!41 (array!12445 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3747) Unit!7867)

(assert (=> d!61415 (= lt!127874 (choose!41 (_keys!6859 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3744))))

(assert (=> d!61415 (bvslt (size!6244 (_keys!6859 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61415 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6859 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3744) lt!127874)))

(declare-fun b!255176 () Bool)

(assert (=> b!255176 (= e!165392 (arrayNoDuplicates!0 (array!12446 (store (arr!5896 (_keys!6859 thiss!1504)) index!297 key!932) (size!6244 (_keys!6859 thiss!1504))) #b00000000000000000000000000000000 Nil!3744))))

(assert (= (and d!61415 res!124858) b!255176))

(declare-fun m!270223 () Bool)

(assert (=> d!61415 m!270223))

(assert (=> b!255176 m!269889))

(declare-fun m!270225 () Bool)

(assert (=> b!255176 m!270225))

(assert (=> b!254833 d!61415))

(assert (=> b!254833 d!61393))

(declare-fun d!61417 () Bool)

(declare-fun e!165395 () Bool)

(assert (=> d!61417 e!165395))

(declare-fun res!124861 () Bool)

(assert (=> d!61417 (=> (not res!124861) (not e!165395))))

(assert (=> d!61417 (= res!124861 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6244 (_keys!6859 thiss!1504)))))))

(declare-fun lt!127877 () Unit!7867)

(declare-fun choose!102 ((_ BitVec 64) array!12445 (_ BitVec 32) (_ BitVec 32)) Unit!7867)

(assert (=> d!61417 (= lt!127877 (choose!102 key!932 (_keys!6859 thiss!1504) index!297 (mask!10957 thiss!1504)))))

(assert (=> d!61417 (validMask!0 (mask!10957 thiss!1504))))

(assert (=> d!61417 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6859 thiss!1504) index!297 (mask!10957 thiss!1504)) lt!127877)))

(declare-fun b!255179 () Bool)

(assert (=> b!255179 (= e!165395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12446 (store (arr!5896 (_keys!6859 thiss!1504)) index!297 key!932) (size!6244 (_keys!6859 thiss!1504))) (mask!10957 thiss!1504)))))

(assert (= (and d!61417 res!124861) b!255179))

(declare-fun m!270227 () Bool)

(assert (=> d!61417 m!270227))

(assert (=> d!61417 m!270035))

(assert (=> b!255179 m!269889))

(declare-fun m!270229 () Bool)

(assert (=> b!255179 m!270229))

(assert (=> b!254833 d!61417))

(declare-fun d!61419 () Bool)

(declare-fun e!165398 () Bool)

(assert (=> d!61419 e!165398))

(declare-fun res!124867 () Bool)

(assert (=> d!61419 (=> (not res!124867) (not e!165398))))

(declare-fun lt!127888 () ListLongMap!3745)

(assert (=> d!61419 (= res!124867 (contains!1825 lt!127888 (_1!2432 (tuple2!4843 key!932 v!346))))))

(declare-fun lt!127886 () List!3746)

(assert (=> d!61419 (= lt!127888 (ListLongMap!3746 lt!127886))))

(declare-fun lt!127887 () Unit!7867)

(declare-fun lt!127889 () Unit!7867)

(assert (=> d!61419 (= lt!127887 lt!127889)))

(assert (=> d!61419 (= (getValueByKey!304 lt!127886 (_1!2432 (tuple2!4843 key!932 v!346))) (Some!309 (_2!2432 (tuple2!4843 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!163 (List!3746 (_ BitVec 64) V!8393) Unit!7867)

(assert (=> d!61419 (= lt!127889 (lemmaContainsTupThenGetReturnValue!163 lt!127886 (_1!2432 (tuple2!4843 key!932 v!346)) (_2!2432 (tuple2!4843 key!932 v!346))))))

(declare-fun insertStrictlySorted!166 (List!3746 (_ BitVec 64) V!8393) List!3746)

(assert (=> d!61419 (= lt!127886 (insertStrictlySorted!166 (toList!1888 lt!127654) (_1!2432 (tuple2!4843 key!932 v!346)) (_2!2432 (tuple2!4843 key!932 v!346))))))

(assert (=> d!61419 (= (+!681 lt!127654 (tuple2!4843 key!932 v!346)) lt!127888)))

(declare-fun b!255184 () Bool)

(declare-fun res!124866 () Bool)

(assert (=> b!255184 (=> (not res!124866) (not e!165398))))

(assert (=> b!255184 (= res!124866 (= (getValueByKey!304 (toList!1888 lt!127888) (_1!2432 (tuple2!4843 key!932 v!346))) (Some!309 (_2!2432 (tuple2!4843 key!932 v!346)))))))

(declare-fun b!255185 () Bool)

(declare-fun contains!1828 (List!3746 tuple2!4842) Bool)

(assert (=> b!255185 (= e!165398 (contains!1828 (toList!1888 lt!127888) (tuple2!4843 key!932 v!346)))))

(assert (= (and d!61419 res!124867) b!255184))

(assert (= (and b!255184 res!124866) b!255185))

(declare-fun m!270231 () Bool)

(assert (=> d!61419 m!270231))

(declare-fun m!270233 () Bool)

(assert (=> d!61419 m!270233))

(declare-fun m!270235 () Bool)

(assert (=> d!61419 m!270235))

(declare-fun m!270237 () Bool)

(assert (=> d!61419 m!270237))

(declare-fun m!270239 () Bool)

(assert (=> b!255184 m!270239))

(declare-fun m!270241 () Bool)

(assert (=> b!255185 m!270241))

(assert (=> b!254833 d!61419))

(declare-fun b!255196 () Bool)

(declare-fun e!165410 () Bool)

(declare-fun e!165407 () Bool)

(assert (=> b!255196 (= e!165410 e!165407)))

(declare-fun c!43084 () Bool)

(assert (=> b!255196 (= c!43084 (validKeyInArray!0 (select (arr!5896 lt!127653) #b00000000000000000000000000000000)))))

(declare-fun bm!24110 () Bool)

(declare-fun call!24113 () Bool)

(assert (=> bm!24110 (= call!24113 (arrayNoDuplicates!0 lt!127653 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43084 (Cons!3743 (select (arr!5896 lt!127653) #b00000000000000000000000000000000) Nil!3744) Nil!3744)))))

(declare-fun b!255197 () Bool)

(declare-fun e!165408 () Bool)

(declare-fun contains!1829 (List!3747 (_ BitVec 64)) Bool)

(assert (=> b!255197 (= e!165408 (contains!1829 Nil!3744 (select (arr!5896 lt!127653) #b00000000000000000000000000000000)))))

(declare-fun d!61421 () Bool)

(declare-fun res!124876 () Bool)

(declare-fun e!165409 () Bool)

(assert (=> d!61421 (=> res!124876 e!165409)))

(assert (=> d!61421 (= res!124876 (bvsge #b00000000000000000000000000000000 (size!6244 lt!127653)))))

(assert (=> d!61421 (= (arrayNoDuplicates!0 lt!127653 #b00000000000000000000000000000000 Nil!3744) e!165409)))

(declare-fun b!255198 () Bool)

(assert (=> b!255198 (= e!165409 e!165410)))

(declare-fun res!124875 () Bool)

(assert (=> b!255198 (=> (not res!124875) (not e!165410))))

(assert (=> b!255198 (= res!124875 (not e!165408))))

(declare-fun res!124874 () Bool)

(assert (=> b!255198 (=> (not res!124874) (not e!165408))))

(assert (=> b!255198 (= res!124874 (validKeyInArray!0 (select (arr!5896 lt!127653) #b00000000000000000000000000000000)))))

(declare-fun b!255199 () Bool)

(assert (=> b!255199 (= e!165407 call!24113)))

(declare-fun b!255200 () Bool)

(assert (=> b!255200 (= e!165407 call!24113)))

(assert (= (and d!61421 (not res!124876)) b!255198))

(assert (= (and b!255198 res!124874) b!255197))

(assert (= (and b!255198 res!124875) b!255196))

(assert (= (and b!255196 c!43084) b!255199))

(assert (= (and b!255196 (not c!43084)) b!255200))

(assert (= (or b!255199 b!255200) bm!24110))

(assert (=> b!255196 m!270173))

(assert (=> b!255196 m!270173))

(assert (=> b!255196 m!270187))

(assert (=> bm!24110 m!270173))

(declare-fun m!270243 () Bool)

(assert (=> bm!24110 m!270243))

(assert (=> b!255197 m!270173))

(assert (=> b!255197 m!270173))

(declare-fun m!270245 () Bool)

(assert (=> b!255197 m!270245))

(assert (=> b!255198 m!270173))

(assert (=> b!255198 m!270173))

(assert (=> b!255198 m!270187))

(assert (=> b!254833 d!61421))

(declare-fun d!61423 () Bool)

(assert (=> d!61423 (= (array_inv!3891 (_keys!6859 thiss!1504)) (bvsge (size!6244 (_keys!6859 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!254842 d!61423))

(declare-fun d!61425 () Bool)

(assert (=> d!61425 (= (array_inv!3892 (_values!4687 thiss!1504)) (bvsge (size!6243 (_values!4687 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!254842 d!61425))

(declare-fun b!255207 () Bool)

(declare-fun e!165415 () Bool)

(assert (=> b!255207 (= e!165415 tp_is_empty!6559)))

(declare-fun condMapEmpty!11166 () Bool)

(declare-fun mapDefault!11166 () ValueCell!2936)

(assert (=> mapNonEmpty!11157 (= condMapEmpty!11166 (= mapRest!11157 ((as const (Array (_ BitVec 32) ValueCell!2936)) mapDefault!11166)))))

(declare-fun e!165416 () Bool)

(declare-fun mapRes!11166 () Bool)

(assert (=> mapNonEmpty!11157 (= tp!23381 (and e!165416 mapRes!11166))))

(declare-fun b!255208 () Bool)

(assert (=> b!255208 (= e!165416 tp_is_empty!6559)))

(declare-fun mapIsEmpty!11166 () Bool)

(assert (=> mapIsEmpty!11166 mapRes!11166))

(declare-fun mapNonEmpty!11166 () Bool)

(declare-fun tp!23397 () Bool)

(assert (=> mapNonEmpty!11166 (= mapRes!11166 (and tp!23397 e!165415))))

(declare-fun mapValue!11166 () ValueCell!2936)

(declare-fun mapKey!11166 () (_ BitVec 32))

(declare-fun mapRest!11166 () (Array (_ BitVec 32) ValueCell!2936))

(assert (=> mapNonEmpty!11166 (= mapRest!11157 (store mapRest!11166 mapKey!11166 mapValue!11166))))

(assert (= (and mapNonEmpty!11157 condMapEmpty!11166) mapIsEmpty!11166))

(assert (= (and mapNonEmpty!11157 (not condMapEmpty!11166)) mapNonEmpty!11166))

(assert (= (and mapNonEmpty!11166 ((_ is ValueCellFull!2936) mapValue!11166)) b!255207))

(assert (= (and mapNonEmpty!11157 ((_ is ValueCellFull!2936) mapDefault!11166)) b!255208))

(declare-fun m!270247 () Bool)

(assert (=> mapNonEmpty!11166 m!270247))

(declare-fun b_lambda!8125 () Bool)

(assert (= b_lambda!8121 (or (and b!254842 b_free!6697) b_lambda!8125)))

(declare-fun b_lambda!8127 () Bool)

(assert (= b_lambda!8123 (or (and b!254842 b_free!6697) b_lambda!8127)))

(check-sat (not b!255176) (not mapNonEmpty!11166) (not b!255103) (not b!255167) (not b!255166) (not b!255153) (not b_lambda!8127) (not b!255017) (not bm!24071) (not b!254981) (not d!61401) (not b!255042) (not b!255128) (not b!255044) (not b!255106) (not d!61415) (not b!255093) (not d!61399) (not b!255094) (not bm!24072) (not b_next!6697) (not b!255179) (not d!61405) (not b!255139) (not bm!24087) (not b!255119) (not b!255141) (not b!255198) b_and!13725 (not d!61417) (not bm!24106) (not b!255172) (not d!61387) (not bm!24091) (not bm!24103) (not d!61391) (not bm!24097) (not bm!24094) (not b!255132) (not b!255097) (not d!61395) (not b_lambda!8125) (not b!255157) (not b!255035) (not b!255197) (not b!255138) (not d!61403) (not b!255185) (not bm!24110) (not b!255140) (not d!61409) tp_is_empty!6559 (not b!255105) (not b!254980) (not b!255118) (not bm!24100) (not b!255122) (not b!255010) (not d!61419) (not b!255184) (not b!255121) (not b!255087) (not b!255104) (not bm!24098) (not d!61383) (not d!61385) (not bm!24107) (not b!255129) (not bm!24090) (not bm!24093) (not b!255196) (not b!254979))
(check-sat b_and!13725 (not b_next!6697))
