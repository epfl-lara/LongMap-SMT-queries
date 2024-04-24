; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90316 () Bool)

(assert start!90316)

(declare-fun b!1033245 () Bool)

(declare-fun b_free!20689 () Bool)

(declare-fun b_next!20689 () Bool)

(assert (=> b!1033245 (= b_free!20689 (not b_next!20689))))

(declare-fun tp!73138 () Bool)

(declare-fun b_and!33155 () Bool)

(assert (=> b!1033245 (= tp!73138 b_and!33155)))

(declare-fun b!1033237 () Bool)

(declare-fun e!583770 () Bool)

(assert (=> b!1033237 (= e!583770 (not true))))

(declare-fun lt!456318 () Bool)

(declare-datatypes ((V!37419 0))(
  ( (V!37420 (val!12255 Int)) )
))
(declare-datatypes ((ValueCell!11501 0))(
  ( (ValueCellFull!11501 (v!14828 V!37419)) (EmptyCell!11501) )
))
(declare-datatypes ((Unit!33795 0))(
  ( (Unit!33796) )
))
(declare-datatypes ((array!64931 0))(
  ( (array!64932 (arr!31261 (Array (_ BitVec 32) (_ BitVec 64))) (size!31779 (_ BitVec 32))) )
))
(declare-datatypes ((array!64933 0))(
  ( (array!64934 (arr!31262 (Array (_ BitVec 32) ValueCell!11501)) (size!31780 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5596 0))(
  ( (LongMapFixedSize!5597 (defaultEntry!6172 Int) (mask!30038 (_ BitVec 32)) (extraKeys!5904 (_ BitVec 32)) (zeroValue!6008 V!37419) (minValue!6008 V!37419) (_size!2853 (_ BitVec 32)) (_keys!11383 array!64931) (_values!6195 array!64933) (_vacant!2853 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15708 0))(
  ( (tuple2!15709 (_1!7865 Unit!33795) (_2!7865 LongMapFixedSize!5596)) )
))
(declare-fun lt!456326 () tuple2!15708)

(declare-fun valid!2122 (LongMapFixedSize!5596) Bool)

(assert (=> b!1033237 (= lt!456318 (valid!2122 (_2!7865 lt!456326)))))

(declare-fun lt!456320 () Unit!33795)

(declare-fun e!583762 () Unit!33795)

(assert (=> b!1033237 (= lt!456320 e!583762)))

(declare-fun c!104681 () Bool)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15710 0))(
  ( (tuple2!15711 (_1!7866 (_ BitVec 64)) (_2!7866 V!37419)) )
))
(declare-datatypes ((List!21876 0))(
  ( (Nil!21873) (Cons!21872 (h!23083 tuple2!15710) (t!31052 List!21876)) )
))
(declare-datatypes ((ListLongMap!13755 0))(
  ( (ListLongMap!13756 (toList!6893 List!21876)) )
))
(declare-fun contains!6028 (ListLongMap!13755 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3939 (array!64931 array!64933 (_ BitVec 32) (_ BitVec 32) V!37419 V!37419 (_ BitVec 32) Int) ListLongMap!13755)

(assert (=> b!1033237 (= c!104681 (contains!6028 (getCurrentListMap!3939 (_keys!11383 (_2!7865 lt!456326)) (_values!6195 (_2!7865 lt!456326)) (mask!30038 (_2!7865 lt!456326)) (extraKeys!5904 (_2!7865 lt!456326)) (zeroValue!6008 (_2!7865 lt!456326)) (minValue!6008 (_2!7865 lt!456326)) #b00000000000000000000000000000000 (defaultEntry!6172 (_2!7865 lt!456326))) key!909))))

(declare-fun thiss!1427 () LongMapFixedSize!5596)

(declare-fun lt!456328 () array!64931)

(declare-fun lt!456323 () array!64933)

(declare-fun Unit!33797 () Unit!33795)

(declare-fun Unit!33798 () Unit!33795)

(assert (=> b!1033237 (= lt!456326 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2853 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15709 Unit!33797 (LongMapFixedSize!5597 (defaultEntry!6172 thiss!1427) (mask!30038 thiss!1427) (extraKeys!5904 thiss!1427) (zeroValue!6008 thiss!1427) (minValue!6008 thiss!1427) (bvsub (_size!2853 thiss!1427) #b00000000000000000000000000000001) lt!456328 lt!456323 (bvadd #b00000000000000000000000000000001 (_vacant!2853 thiss!1427)))) (tuple2!15709 Unit!33798 (LongMapFixedSize!5597 (defaultEntry!6172 thiss!1427) (mask!30038 thiss!1427) (extraKeys!5904 thiss!1427) (zeroValue!6008 thiss!1427) (minValue!6008 thiss!1427) (bvsub (_size!2853 thiss!1427) #b00000000000000000000000000000001) lt!456328 lt!456323 (_vacant!2853 thiss!1427)))))))

(declare-fun -!516 (ListLongMap!13755 (_ BitVec 64)) ListLongMap!13755)

(assert (=> b!1033237 (= (-!516 (getCurrentListMap!3939 (_keys!11383 thiss!1427) (_values!6195 thiss!1427) (mask!30038 thiss!1427) (extraKeys!5904 thiss!1427) (zeroValue!6008 thiss!1427) (minValue!6008 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6172 thiss!1427)) key!909) (getCurrentListMap!3939 lt!456328 lt!456323 (mask!30038 thiss!1427) (extraKeys!5904 thiss!1427) (zeroValue!6008 thiss!1427) (minValue!6008 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6172 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9673 0))(
  ( (MissingZero!9673 (index!41063 (_ BitVec 32))) (Found!9673 (index!41064 (_ BitVec 32))) (Intermediate!9673 (undefined!10485 Bool) (index!41065 (_ BitVec 32)) (x!91901 (_ BitVec 32))) (Undefined!9673) (MissingVacant!9673 (index!41066 (_ BitVec 32))) )
))
(declare-fun lt!456322 () SeekEntryResult!9673)

(declare-fun dynLambda!2010 (Int (_ BitVec 64)) V!37419)

(assert (=> b!1033237 (= lt!456323 (array!64934 (store (arr!31262 (_values!6195 thiss!1427)) (index!41064 lt!456322) (ValueCellFull!11501 (dynLambda!2010 (defaultEntry!6172 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31780 (_values!6195 thiss!1427))))))

(declare-fun lt!456325 () Unit!33795)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!42 (array!64931 array!64933 (_ BitVec 32) (_ BitVec 32) V!37419 V!37419 (_ BitVec 32) (_ BitVec 64) Int) Unit!33795)

(assert (=> b!1033237 (= lt!456325 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!42 (_keys!11383 thiss!1427) (_values!6195 thiss!1427) (mask!30038 thiss!1427) (extraKeys!5904 thiss!1427) (zeroValue!6008 thiss!1427) (minValue!6008 thiss!1427) (index!41064 lt!456322) key!909 (defaultEntry!6172 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1033237 (not (arrayContainsKey!0 lt!456328 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!456317 () Unit!33795)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64931 (_ BitVec 32) (_ BitVec 64)) Unit!33795)

(assert (=> b!1033237 (= lt!456317 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11383 thiss!1427) (index!41064 lt!456322) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64931 (_ BitVec 32)) Bool)

(assert (=> b!1033237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!456328 (mask!30038 thiss!1427))))

(declare-fun lt!456324 () Unit!33795)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64931 (_ BitVec 32) (_ BitVec 32)) Unit!33795)

(assert (=> b!1033237 (= lt!456324 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11383 thiss!1427) (index!41064 lt!456322) (mask!30038 thiss!1427)))))

(declare-datatypes ((List!21877 0))(
  ( (Nil!21874) (Cons!21873 (h!23084 (_ BitVec 64)) (t!31053 List!21877)) )
))
(declare-fun arrayNoDuplicates!0 (array!64931 (_ BitVec 32) List!21877) Bool)

(assert (=> b!1033237 (arrayNoDuplicates!0 lt!456328 #b00000000000000000000000000000000 Nil!21874)))

(declare-fun lt!456327 () Unit!33795)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64931 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21877) Unit!33795)

(assert (=> b!1033237 (= lt!456327 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11383 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41064 lt!456322) #b00000000000000000000000000000000 Nil!21874))))

(declare-fun arrayCountValidKeys!0 (array!64931 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1033237 (= (arrayCountValidKeys!0 lt!456328 #b00000000000000000000000000000000 (size!31779 (_keys!11383 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11383 thiss!1427) #b00000000000000000000000000000000 (size!31779 (_keys!11383 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1033237 (= lt!456328 (array!64932 (store (arr!31261 (_keys!11383 thiss!1427)) (index!41064 lt!456322) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31779 (_keys!11383 thiss!1427))))))

(declare-fun lt!456319 () Unit!33795)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64931 (_ BitVec 32) (_ BitVec 64)) Unit!33795)

(assert (=> b!1033237 (= lt!456319 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11383 thiss!1427) (index!41064 lt!456322) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033238 () Bool)

(declare-fun e!583767 () Bool)

(assert (=> b!1033238 (= e!583767 false)))

(declare-fun b!1033239 () Bool)

(declare-fun res!690376 () Bool)

(declare-fun e!583761 () Bool)

(assert (=> b!1033239 (=> (not res!690376) (not e!583761))))

(assert (=> b!1033239 (= res!690376 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!38067 () Bool)

(declare-fun mapRes!38067 () Bool)

(assert (=> mapIsEmpty!38067 mapRes!38067))

(declare-fun b!1033240 () Bool)

(declare-fun e!583769 () Bool)

(declare-fun tp_is_empty!24409 () Bool)

(assert (=> b!1033240 (= e!583769 tp_is_empty!24409)))

(declare-fun b!1033241 () Bool)

(declare-fun e!583766 () Bool)

(assert (=> b!1033241 (= e!583766 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5904 (_2!7865 lt!456326)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5904 (_2!7865 lt!456326)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1033242 () Bool)

(assert (=> b!1033242 (= e!583766 (arrayContainsKey!0 (_keys!11383 (_2!7865 lt!456326)) key!909 #b00000000000000000000000000000000))))

(declare-fun res!690375 () Bool)

(assert (=> start!90316 (=> (not res!690375) (not e!583761))))

(assert (=> start!90316 (= res!690375 (valid!2122 thiss!1427))))

(assert (=> start!90316 e!583761))

(declare-fun e!583764 () Bool)

(assert (=> start!90316 e!583764))

(assert (=> start!90316 true))

(declare-fun b!1033243 () Bool)

(declare-fun e!583768 () Bool)

(assert (=> b!1033243 (= e!583768 (and e!583769 mapRes!38067))))

(declare-fun condMapEmpty!38067 () Bool)

(declare-fun mapDefault!38067 () ValueCell!11501)

(assert (=> b!1033243 (= condMapEmpty!38067 (= (arr!31262 (_values!6195 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11501)) mapDefault!38067)))))

(declare-fun b!1033244 () Bool)

(declare-fun Unit!33799 () Unit!33795)

(assert (=> b!1033244 (= e!583762 Unit!33799)))

(declare-fun array_inv!24205 (array!64931) Bool)

(declare-fun array_inv!24206 (array!64933) Bool)

(assert (=> b!1033245 (= e!583764 (and tp!73138 tp_is_empty!24409 (array_inv!24205 (_keys!11383 thiss!1427)) (array_inv!24206 (_values!6195 thiss!1427)) e!583768))))

(declare-fun b!1033246 () Bool)

(assert (=> b!1033246 (= e!583761 e!583770)))

(declare-fun res!690374 () Bool)

(assert (=> b!1033246 (=> (not res!690374) (not e!583770))))

(get-info :version)

(assert (=> b!1033246 (= res!690374 ((_ is Found!9673) lt!456322))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64931 (_ BitVec 32)) SeekEntryResult!9673)

(assert (=> b!1033246 (= lt!456322 (seekEntry!0 key!909 (_keys!11383 thiss!1427) (mask!30038 thiss!1427)))))

(declare-fun mapNonEmpty!38067 () Bool)

(declare-fun tp!73137 () Bool)

(declare-fun e!583763 () Bool)

(assert (=> mapNonEmpty!38067 (= mapRes!38067 (and tp!73137 e!583763))))

(declare-fun mapRest!38067 () (Array (_ BitVec 32) ValueCell!11501))

(declare-fun mapKey!38067 () (_ BitVec 32))

(declare-fun mapValue!38067 () ValueCell!11501)

(assert (=> mapNonEmpty!38067 (= (arr!31262 (_values!6195 thiss!1427)) (store mapRest!38067 mapKey!38067 mapValue!38067))))

(declare-fun b!1033247 () Bool)

(assert (=> b!1033247 (= e!583763 tp_is_empty!24409)))

(declare-fun b!1033248 () Bool)

(declare-fun Unit!33800 () Unit!33795)

(assert (=> b!1033248 (= e!583762 Unit!33800)))

(declare-fun lt!456321 () Unit!33795)

(declare-fun lemmaKeyInListMapIsInArray!346 (array!64931 array!64933 (_ BitVec 32) (_ BitVec 32) V!37419 V!37419 (_ BitVec 64) Int) Unit!33795)

(assert (=> b!1033248 (= lt!456321 (lemmaKeyInListMapIsInArray!346 (_keys!11383 (_2!7865 lt!456326)) (_values!6195 (_2!7865 lt!456326)) (mask!30038 (_2!7865 lt!456326)) (extraKeys!5904 (_2!7865 lt!456326)) (zeroValue!6008 (_2!7865 lt!456326)) (minValue!6008 (_2!7865 lt!456326)) key!909 (defaultEntry!6172 (_2!7865 lt!456326))))))

(declare-fun c!104680 () Bool)

(assert (=> b!1033248 (= c!104680 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!690377 () Bool)

(assert (=> b!1033248 (= res!690377 e!583766)))

(assert (=> b!1033248 (=> (not res!690377) (not e!583767))))

(assert (=> b!1033248 e!583767))

(assert (= (and start!90316 res!690375) b!1033239))

(assert (= (and b!1033239 res!690376) b!1033246))

(assert (= (and b!1033246 res!690374) b!1033237))

(assert (= (and b!1033237 c!104681) b!1033248))

(assert (= (and b!1033237 (not c!104681)) b!1033244))

(assert (= (and b!1033248 c!104680) b!1033242))

(assert (= (and b!1033248 (not c!104680)) b!1033241))

(assert (= (and b!1033248 res!690377) b!1033238))

(assert (= (and b!1033243 condMapEmpty!38067) mapIsEmpty!38067))

(assert (= (and b!1033243 (not condMapEmpty!38067)) mapNonEmpty!38067))

(assert (= (and mapNonEmpty!38067 ((_ is ValueCellFull!11501) mapValue!38067)) b!1033247))

(assert (= (and b!1033243 ((_ is ValueCellFull!11501) mapDefault!38067)) b!1033240))

(assert (= b!1033245 b!1033243))

(assert (= start!90316 b!1033245))

(declare-fun b_lambda!16043 () Bool)

(assert (=> (not b_lambda!16043) (not b!1033237)))

(declare-fun t!31051 () Bool)

(declare-fun tb!6999 () Bool)

(assert (=> (and b!1033245 (= (defaultEntry!6172 thiss!1427) (defaultEntry!6172 thiss!1427)) t!31051) tb!6999))

(declare-fun result!14335 () Bool)

(assert (=> tb!6999 (= result!14335 tp_is_empty!24409)))

(assert (=> b!1033237 t!31051))

(declare-fun b_and!33157 () Bool)

(assert (= b_and!33155 (and (=> t!31051 result!14335) b_and!33157)))

(declare-fun m!953909 () Bool)

(assert (=> start!90316 m!953909))

(declare-fun m!953911 () Bool)

(assert (=> b!1033246 m!953911))

(declare-fun m!953913 () Bool)

(assert (=> b!1033242 m!953913))

(declare-fun m!953915 () Bool)

(assert (=> mapNonEmpty!38067 m!953915))

(declare-fun m!953917 () Bool)

(assert (=> b!1033245 m!953917))

(declare-fun m!953919 () Bool)

(assert (=> b!1033245 m!953919))

(declare-fun m!953921 () Bool)

(assert (=> b!1033248 m!953921))

(declare-fun m!953923 () Bool)

(assert (=> b!1033237 m!953923))

(declare-fun m!953925 () Bool)

(assert (=> b!1033237 m!953925))

(declare-fun m!953927 () Bool)

(assert (=> b!1033237 m!953927))

(declare-fun m!953929 () Bool)

(assert (=> b!1033237 m!953929))

(declare-fun m!953931 () Bool)

(assert (=> b!1033237 m!953931))

(declare-fun m!953933 () Bool)

(assert (=> b!1033237 m!953933))

(declare-fun m!953935 () Bool)

(assert (=> b!1033237 m!953935))

(declare-fun m!953937 () Bool)

(assert (=> b!1033237 m!953937))

(declare-fun m!953939 () Bool)

(assert (=> b!1033237 m!953939))

(declare-fun m!953941 () Bool)

(assert (=> b!1033237 m!953941))

(declare-fun m!953943 () Bool)

(assert (=> b!1033237 m!953943))

(assert (=> b!1033237 m!953939))

(declare-fun m!953945 () Bool)

(assert (=> b!1033237 m!953945))

(declare-fun m!953947 () Bool)

(assert (=> b!1033237 m!953947))

(assert (=> b!1033237 m!953933))

(declare-fun m!953949 () Bool)

(assert (=> b!1033237 m!953949))

(declare-fun m!953951 () Bool)

(assert (=> b!1033237 m!953951))

(declare-fun m!953953 () Bool)

(assert (=> b!1033237 m!953953))

(declare-fun m!953955 () Bool)

(assert (=> b!1033237 m!953955))

(declare-fun m!953957 () Bool)

(assert (=> b!1033237 m!953957))

(declare-fun m!953959 () Bool)

(assert (=> b!1033237 m!953959))

(check-sat (not b!1033237) tp_is_empty!24409 b_and!33157 (not b_lambda!16043) (not b_next!20689) (not b!1033248) (not b!1033245) (not b!1033242) (not start!90316) (not mapNonEmpty!38067) (not b!1033246))
(check-sat b_and!33157 (not b_next!20689))
