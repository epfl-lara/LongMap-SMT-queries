; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81490 () Bool)

(assert start!81490)

(declare-fun b!952207 () Bool)

(declare-fun b_free!18289 () Bool)

(declare-fun b_next!18289 () Bool)

(assert (=> b!952207 (= b_free!18289 (not b_next!18289))))

(declare-fun tp!63489 () Bool)

(declare-fun b_and!29743 () Bool)

(assert (=> b!952207 (= tp!63489 b_and!29743)))

(declare-fun res!637955 () Bool)

(declare-fun e!536248 () Bool)

(assert (=> start!81490 (=> (not res!637955) (not e!536248))))

(declare-datatypes ((V!32695 0))(
  ( (V!32696 (val!10449 Int)) )
))
(declare-datatypes ((ValueCell!9917 0))(
  ( (ValueCellFull!9917 (v!12999 V!32695)) (EmptyCell!9917) )
))
(declare-datatypes ((array!57593 0))(
  ( (array!57594 (arr!27689 (Array (_ BitVec 32) ValueCell!9917)) (size!28170 (_ BitVec 32))) )
))
(declare-datatypes ((array!57595 0))(
  ( (array!57596 (arr!27690 (Array (_ BitVec 32) (_ BitVec 64))) (size!28171 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4984 0))(
  ( (LongMapFixedSize!4985 (defaultEntry!5823 Int) (mask!27664 (_ BitVec 32)) (extraKeys!5555 (_ BitVec 32)) (zeroValue!5659 V!32695) (minValue!5659 V!32695) (_size!2547 (_ BitVec 32)) (_keys!10772 array!57595) (_values!5846 array!57593) (_vacant!2547 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4984)

(declare-fun valid!1901 (LongMapFixedSize!4984) Bool)

(assert (=> start!81490 (= res!637955 (valid!1901 thiss!1141))))

(assert (=> start!81490 e!536248))

(declare-fun e!536247 () Bool)

(assert (=> start!81490 e!536247))

(assert (=> start!81490 true))

(declare-fun b!952198 () Bool)

(declare-fun res!637953 () Bool)

(assert (=> b!952198 (=> (not res!637953) (not e!536248))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!952198 (= res!637953 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!952199 () Bool)

(declare-fun e!536243 () Bool)

(assert (=> b!952199 (= e!536248 (not e!536243))))

(declare-fun res!637954 () Bool)

(assert (=> b!952199 (=> res!637954 e!536243)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!952199 (= res!637954 (not (validMask!0 (mask!27664 thiss!1141))))))

(declare-fun lt!428929 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57595 (_ BitVec 32)) Bool)

(assert (=> b!952199 (arrayForallSeekEntryOrOpenFound!0 lt!428929 (_keys!10772 thiss!1141) (mask!27664 thiss!1141))))

(declare-datatypes ((Unit!31915 0))(
  ( (Unit!31916) )
))
(declare-fun lt!428927 () Unit!31915)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57595 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31915)

(assert (=> b!952199 (= lt!428927 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10772 thiss!1141) (mask!27664 thiss!1141) #b00000000000000000000000000000000 lt!428929))))

(declare-fun arrayScanForKey!0 (array!57595 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952199 (= lt!428929 (arrayScanForKey!0 (_keys!10772 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!952199 (arrayContainsKey!0 (_keys!10772 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!428928 () Unit!31915)

(declare-fun lemmaKeyInListMapIsInArray!316 (array!57595 array!57593 (_ BitVec 32) (_ BitVec 32) V!32695 V!32695 (_ BitVec 64) Int) Unit!31915)

(assert (=> b!952199 (= lt!428928 (lemmaKeyInListMapIsInArray!316 (_keys!10772 thiss!1141) (_values!5846 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) key!756 (defaultEntry!5823 thiss!1141)))))

(declare-fun b!952200 () Bool)

(declare-fun e!536246 () Bool)

(declare-fun tp_is_empty!20797 () Bool)

(assert (=> b!952200 (= e!536246 tp_is_empty!20797)))

(declare-fun b!952201 () Bool)

(declare-fun res!637956 () Bool)

(assert (=> b!952201 (=> (not res!637956) (not e!536248))))

(declare-datatypes ((tuple2!13626 0))(
  ( (tuple2!13627 (_1!6824 (_ BitVec 64)) (_2!6824 V!32695)) )
))
(declare-datatypes ((List!19366 0))(
  ( (Nil!19363) (Cons!19362 (h!20524 tuple2!13626) (t!27712 List!19366)) )
))
(declare-datatypes ((ListLongMap!12313 0))(
  ( (ListLongMap!12314 (toList!6172 List!19366)) )
))
(declare-fun contains!5210 (ListLongMap!12313 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3334 (array!57595 array!57593 (_ BitVec 32) (_ BitVec 32) V!32695 V!32695 (_ BitVec 32) Int) ListLongMap!12313)

(assert (=> b!952201 (= res!637956 (contains!5210 (getCurrentListMap!3334 (_keys!10772 thiss!1141) (_values!5846 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141)) key!756))))

(declare-fun b!952202 () Bool)

(declare-fun res!637958 () Bool)

(assert (=> b!952202 (=> (not res!637958) (not e!536248))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9155 0))(
  ( (MissingZero!9155 (index!38991 (_ BitVec 32))) (Found!9155 (index!38992 (_ BitVec 32))) (Intermediate!9155 (undefined!9967 Bool) (index!38993 (_ BitVec 32)) (x!81928 (_ BitVec 32))) (Undefined!9155) (MissingVacant!9155 (index!38994 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57595 (_ BitVec 32)) SeekEntryResult!9155)

(assert (=> b!952202 (= res!637958 (not ((_ is Found!9155) (seekEntry!0 key!756 (_keys!10772 thiss!1141) (mask!27664 thiss!1141)))))))

(declare-fun b!952203 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!952203 (= e!536243 (validKeyInArray!0 key!756))))

(declare-fun b!952204 () Bool)

(declare-fun res!637959 () Bool)

(assert (=> b!952204 (=> res!637959 e!536243)))

(assert (=> b!952204 (= res!637959 (not (= (size!28171 (_keys!10772 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27664 thiss!1141)))))))

(declare-fun b!952205 () Bool)

(declare-fun res!637957 () Bool)

(assert (=> b!952205 (=> res!637957 e!536243)))

(assert (=> b!952205 (= res!637957 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10772 thiss!1141) (mask!27664 thiss!1141))))))

(declare-fun mapNonEmpty!33133 () Bool)

(declare-fun mapRes!33133 () Bool)

(declare-fun tp!63490 () Bool)

(assert (=> mapNonEmpty!33133 (= mapRes!33133 (and tp!63490 e!536246))))

(declare-fun mapKey!33133 () (_ BitVec 32))

(declare-fun mapValue!33133 () ValueCell!9917)

(declare-fun mapRest!33133 () (Array (_ BitVec 32) ValueCell!9917))

(assert (=> mapNonEmpty!33133 (= (arr!27689 (_values!5846 thiss!1141)) (store mapRest!33133 mapKey!33133 mapValue!33133))))

(declare-fun b!952206 () Bool)

(declare-fun e!536244 () Bool)

(assert (=> b!952206 (= e!536244 tp_is_empty!20797)))

(declare-fun mapIsEmpty!33133 () Bool)

(assert (=> mapIsEmpty!33133 mapRes!33133))

(declare-fun e!536249 () Bool)

(declare-fun array_inv!21550 (array!57595) Bool)

(declare-fun array_inv!21551 (array!57593) Bool)

(assert (=> b!952207 (= e!536247 (and tp!63489 tp_is_empty!20797 (array_inv!21550 (_keys!10772 thiss!1141)) (array_inv!21551 (_values!5846 thiss!1141)) e!536249))))

(declare-fun b!952208 () Bool)

(assert (=> b!952208 (= e!536249 (and e!536244 mapRes!33133))))

(declare-fun condMapEmpty!33133 () Bool)

(declare-fun mapDefault!33133 () ValueCell!9917)

(assert (=> b!952208 (= condMapEmpty!33133 (= (arr!27689 (_values!5846 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9917)) mapDefault!33133)))))

(assert (= (and start!81490 res!637955) b!952198))

(assert (= (and b!952198 res!637953) b!952202))

(assert (= (and b!952202 res!637958) b!952201))

(assert (= (and b!952201 res!637956) b!952199))

(assert (= (and b!952199 (not res!637954)) b!952204))

(assert (= (and b!952204 (not res!637959)) b!952205))

(assert (= (and b!952205 (not res!637957)) b!952203))

(assert (= (and b!952208 condMapEmpty!33133) mapIsEmpty!33133))

(assert (= (and b!952208 (not condMapEmpty!33133)) mapNonEmpty!33133))

(assert (= (and mapNonEmpty!33133 ((_ is ValueCellFull!9917) mapValue!33133)) b!952200))

(assert (= (and b!952208 ((_ is ValueCellFull!9917) mapDefault!33133)) b!952206))

(assert (= b!952207 b!952208))

(assert (= start!81490 b!952207))

(declare-fun m!883837 () Bool)

(assert (=> b!952205 m!883837))

(declare-fun m!883839 () Bool)

(assert (=> b!952201 m!883839))

(assert (=> b!952201 m!883839))

(declare-fun m!883841 () Bool)

(assert (=> b!952201 m!883841))

(declare-fun m!883843 () Bool)

(assert (=> b!952203 m!883843))

(declare-fun m!883845 () Bool)

(assert (=> mapNonEmpty!33133 m!883845))

(declare-fun m!883847 () Bool)

(assert (=> b!952207 m!883847))

(declare-fun m!883849 () Bool)

(assert (=> b!952207 m!883849))

(declare-fun m!883851 () Bool)

(assert (=> b!952202 m!883851))

(declare-fun m!883853 () Bool)

(assert (=> b!952199 m!883853))

(declare-fun m!883855 () Bool)

(assert (=> b!952199 m!883855))

(declare-fun m!883857 () Bool)

(assert (=> b!952199 m!883857))

(declare-fun m!883859 () Bool)

(assert (=> b!952199 m!883859))

(declare-fun m!883861 () Bool)

(assert (=> b!952199 m!883861))

(declare-fun m!883863 () Bool)

(assert (=> b!952199 m!883863))

(declare-fun m!883865 () Bool)

(assert (=> start!81490 m!883865))

(check-sat (not b!952199) (not mapNonEmpty!33133) (not b!952201) (not start!81490) (not b_next!18289) tp_is_empty!20797 (not b!952202) (not b!952203) (not b!952205) (not b!952207) b_and!29743)
(check-sat b_and!29743 (not b_next!18289))
(get-model)

(declare-fun b!952287 () Bool)

(declare-fun c!99588 () Bool)

(declare-fun lt!428956 () (_ BitVec 64))

(assert (=> b!952287 (= c!99588 (= lt!428956 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!536299 () SeekEntryResult!9155)

(declare-fun e!536300 () SeekEntryResult!9155)

(assert (=> b!952287 (= e!536299 e!536300)))

(declare-fun b!952288 () Bool)

(declare-fun lt!428959 () SeekEntryResult!9155)

(assert (=> b!952288 (= e!536300 (ite ((_ is MissingVacant!9155) lt!428959) (MissingZero!9155 (index!38994 lt!428959)) lt!428959))))

(declare-fun lt!428957 () SeekEntryResult!9155)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57595 (_ BitVec 32)) SeekEntryResult!9155)

(assert (=> b!952288 (= lt!428959 (seekKeyOrZeroReturnVacant!0 (x!81928 lt!428957) (index!38993 lt!428957) (index!38993 lt!428957) key!756 (_keys!10772 thiss!1141) (mask!27664 thiss!1141)))))

(declare-fun b!952289 () Bool)

(assert (=> b!952289 (= e!536300 (MissingZero!9155 (index!38993 lt!428957)))))

(declare-fun d!115333 () Bool)

(declare-fun lt!428958 () SeekEntryResult!9155)

(assert (=> d!115333 (and (or ((_ is MissingVacant!9155) lt!428958) (not ((_ is Found!9155) lt!428958)) (and (bvsge (index!38992 lt!428958) #b00000000000000000000000000000000) (bvslt (index!38992 lt!428958) (size!28171 (_keys!10772 thiss!1141))))) (not ((_ is MissingVacant!9155) lt!428958)) (or (not ((_ is Found!9155) lt!428958)) (= (select (arr!27690 (_keys!10772 thiss!1141)) (index!38992 lt!428958)) key!756)))))

(declare-fun e!536298 () SeekEntryResult!9155)

(assert (=> d!115333 (= lt!428958 e!536298)))

(declare-fun c!99587 () Bool)

(assert (=> d!115333 (= c!99587 (and ((_ is Intermediate!9155) lt!428957) (undefined!9967 lt!428957)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57595 (_ BitVec 32)) SeekEntryResult!9155)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115333 (= lt!428957 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27664 thiss!1141)) key!756 (_keys!10772 thiss!1141) (mask!27664 thiss!1141)))))

(assert (=> d!115333 (validMask!0 (mask!27664 thiss!1141))))

(assert (=> d!115333 (= (seekEntry!0 key!756 (_keys!10772 thiss!1141) (mask!27664 thiss!1141)) lt!428958)))

(declare-fun b!952290 () Bool)

(assert (=> b!952290 (= e!536298 Undefined!9155)))

(declare-fun b!952291 () Bool)

(assert (=> b!952291 (= e!536298 e!536299)))

(assert (=> b!952291 (= lt!428956 (select (arr!27690 (_keys!10772 thiss!1141)) (index!38993 lt!428957)))))

(declare-fun c!99586 () Bool)

(assert (=> b!952291 (= c!99586 (= lt!428956 key!756))))

(declare-fun b!952292 () Bool)

(assert (=> b!952292 (= e!536299 (Found!9155 (index!38993 lt!428957)))))

(assert (= (and d!115333 c!99587) b!952290))

(assert (= (and d!115333 (not c!99587)) b!952291))

(assert (= (and b!952291 c!99586) b!952292))

(assert (= (and b!952291 (not c!99586)) b!952287))

(assert (= (and b!952287 c!99588) b!952289))

(assert (= (and b!952287 (not c!99588)) b!952288))

(declare-fun m!883927 () Bool)

(assert (=> b!952288 m!883927))

(declare-fun m!883929 () Bool)

(assert (=> d!115333 m!883929))

(declare-fun m!883931 () Bool)

(assert (=> d!115333 m!883931))

(assert (=> d!115333 m!883931))

(declare-fun m!883933 () Bool)

(assert (=> d!115333 m!883933))

(assert (=> d!115333 m!883859))

(declare-fun m!883935 () Bool)

(assert (=> b!952291 m!883935))

(assert (=> b!952202 d!115333))

(declare-fun d!115335 () Bool)

(assert (=> d!115335 (= (validKeyInArray!0 key!756) (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!952203 d!115335))

(declare-fun d!115337 () Bool)

(assert (=> d!115337 (= (array_inv!21550 (_keys!10772 thiss!1141)) (bvsge (size!28171 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952207 d!115337))

(declare-fun d!115339 () Bool)

(assert (=> d!115339 (= (array_inv!21551 (_values!5846 thiss!1141)) (bvsge (size!28170 (_values!5846 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952207 d!115339))

(declare-fun d!115341 () Bool)

(declare-fun res!638006 () Bool)

(declare-fun e!536305 () Bool)

(assert (=> d!115341 (=> res!638006 e!536305)))

(assert (=> d!115341 (= res!638006 (= (select (arr!27690 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115341 (= (arrayContainsKey!0 (_keys!10772 thiss!1141) key!756 #b00000000000000000000000000000000) e!536305)))

(declare-fun b!952297 () Bool)

(declare-fun e!536306 () Bool)

(assert (=> b!952297 (= e!536305 e!536306)))

(declare-fun res!638007 () Bool)

(assert (=> b!952297 (=> (not res!638007) (not e!536306))))

(assert (=> b!952297 (= res!638007 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28171 (_keys!10772 thiss!1141))))))

(declare-fun b!952298 () Bool)

(assert (=> b!952298 (= e!536306 (arrayContainsKey!0 (_keys!10772 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115341 (not res!638006)) b!952297))

(assert (= (and b!952297 res!638007) b!952298))

(declare-fun m!883937 () Bool)

(assert (=> d!115341 m!883937))

(declare-fun m!883939 () Bool)

(assert (=> b!952298 m!883939))

(assert (=> b!952199 d!115341))

(declare-fun d!115343 () Bool)

(declare-fun res!638013 () Bool)

(declare-fun e!536313 () Bool)

(assert (=> d!115343 (=> res!638013 e!536313)))

(assert (=> d!115343 (= res!638013 (bvsge lt!428929 (size!28171 (_keys!10772 thiss!1141))))))

(assert (=> d!115343 (= (arrayForallSeekEntryOrOpenFound!0 lt!428929 (_keys!10772 thiss!1141) (mask!27664 thiss!1141)) e!536313)))

(declare-fun b!952307 () Bool)

(declare-fun e!536314 () Bool)

(declare-fun call!41551 () Bool)

(assert (=> b!952307 (= e!536314 call!41551)))

(declare-fun b!952308 () Bool)

(declare-fun e!536315 () Bool)

(assert (=> b!952308 (= e!536315 call!41551)))

(declare-fun bm!41548 () Bool)

(assert (=> bm!41548 (= call!41551 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!428929 #b00000000000000000000000000000001) (_keys!10772 thiss!1141) (mask!27664 thiss!1141)))))

(declare-fun b!952309 () Bool)

(assert (=> b!952309 (= e!536315 e!536314)))

(declare-fun lt!428967 () (_ BitVec 64))

(assert (=> b!952309 (= lt!428967 (select (arr!27690 (_keys!10772 thiss!1141)) lt!428929))))

(declare-fun lt!428966 () Unit!31915)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57595 (_ BitVec 64) (_ BitVec 32)) Unit!31915)

(assert (=> b!952309 (= lt!428966 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10772 thiss!1141) lt!428967 lt!428929))))

(assert (=> b!952309 (arrayContainsKey!0 (_keys!10772 thiss!1141) lt!428967 #b00000000000000000000000000000000)))

(declare-fun lt!428968 () Unit!31915)

(assert (=> b!952309 (= lt!428968 lt!428966)))

(declare-fun res!638012 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57595 (_ BitVec 32)) SeekEntryResult!9155)

(assert (=> b!952309 (= res!638012 (= (seekEntryOrOpen!0 (select (arr!27690 (_keys!10772 thiss!1141)) lt!428929) (_keys!10772 thiss!1141) (mask!27664 thiss!1141)) (Found!9155 lt!428929)))))

(assert (=> b!952309 (=> (not res!638012) (not e!536314))))

(declare-fun b!952310 () Bool)

(assert (=> b!952310 (= e!536313 e!536315)))

(declare-fun c!99591 () Bool)

(assert (=> b!952310 (= c!99591 (validKeyInArray!0 (select (arr!27690 (_keys!10772 thiss!1141)) lt!428929)))))

(assert (= (and d!115343 (not res!638013)) b!952310))

(assert (= (and b!952310 c!99591) b!952309))

(assert (= (and b!952310 (not c!99591)) b!952308))

(assert (= (and b!952309 res!638012) b!952307))

(assert (= (or b!952307 b!952308) bm!41548))

(declare-fun m!883941 () Bool)

(assert (=> bm!41548 m!883941))

(declare-fun m!883943 () Bool)

(assert (=> b!952309 m!883943))

(declare-fun m!883945 () Bool)

(assert (=> b!952309 m!883945))

(declare-fun m!883947 () Bool)

(assert (=> b!952309 m!883947))

(assert (=> b!952309 m!883943))

(declare-fun m!883949 () Bool)

(assert (=> b!952309 m!883949))

(assert (=> b!952310 m!883943))

(assert (=> b!952310 m!883943))

(declare-fun m!883951 () Bool)

(assert (=> b!952310 m!883951))

(assert (=> b!952199 d!115343))

(declare-fun d!115345 () Bool)

(declare-fun e!536318 () Bool)

(assert (=> d!115345 e!536318))

(declare-fun c!99594 () Bool)

(assert (=> d!115345 (= c!99594 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!428971 () Unit!31915)

(declare-fun choose!1607 (array!57595 array!57593 (_ BitVec 32) (_ BitVec 32) V!32695 V!32695 (_ BitVec 64) Int) Unit!31915)

(assert (=> d!115345 (= lt!428971 (choose!1607 (_keys!10772 thiss!1141) (_values!5846 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) key!756 (defaultEntry!5823 thiss!1141)))))

(assert (=> d!115345 (validMask!0 (mask!27664 thiss!1141))))

(assert (=> d!115345 (= (lemmaKeyInListMapIsInArray!316 (_keys!10772 thiss!1141) (_values!5846 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) key!756 (defaultEntry!5823 thiss!1141)) lt!428971)))

(declare-fun b!952315 () Bool)

(assert (=> b!952315 (= e!536318 (arrayContainsKey!0 (_keys!10772 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!952316 () Bool)

(assert (=> b!952316 (= e!536318 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5555 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5555 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115345 c!99594) b!952315))

(assert (= (and d!115345 (not c!99594)) b!952316))

(declare-fun m!883953 () Bool)

(assert (=> d!115345 m!883953))

(assert (=> d!115345 m!883859))

(assert (=> b!952315 m!883863))

(assert (=> b!952199 d!115345))

(declare-fun d!115347 () Bool)

(assert (=> d!115347 (arrayForallSeekEntryOrOpenFound!0 lt!428929 (_keys!10772 thiss!1141) (mask!27664 thiss!1141))))

(declare-fun lt!428974 () Unit!31915)

(declare-fun choose!38 (array!57595 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31915)

(assert (=> d!115347 (= lt!428974 (choose!38 (_keys!10772 thiss!1141) (mask!27664 thiss!1141) #b00000000000000000000000000000000 lt!428929))))

(assert (=> d!115347 (validMask!0 (mask!27664 thiss!1141))))

(assert (=> d!115347 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10772 thiss!1141) (mask!27664 thiss!1141) #b00000000000000000000000000000000 lt!428929) lt!428974)))

(declare-fun bs!26730 () Bool)

(assert (= bs!26730 d!115347))

(assert (=> bs!26730 m!883853))

(declare-fun m!883955 () Bool)

(assert (=> bs!26730 m!883955))

(assert (=> bs!26730 m!883859))

(assert (=> b!952199 d!115347))

(declare-fun d!115349 () Bool)

(declare-fun lt!428977 () (_ BitVec 32))

(assert (=> d!115349 (and (or (bvslt lt!428977 #b00000000000000000000000000000000) (bvsge lt!428977 (size!28171 (_keys!10772 thiss!1141))) (and (bvsge lt!428977 #b00000000000000000000000000000000) (bvslt lt!428977 (size!28171 (_keys!10772 thiss!1141))))) (bvsge lt!428977 #b00000000000000000000000000000000) (bvslt lt!428977 (size!28171 (_keys!10772 thiss!1141))) (= (select (arr!27690 (_keys!10772 thiss!1141)) lt!428977) key!756))))

(declare-fun e!536321 () (_ BitVec 32))

(assert (=> d!115349 (= lt!428977 e!536321)))

(declare-fun c!99597 () Bool)

(assert (=> d!115349 (= c!99597 (= (select (arr!27690 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115349 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28171 (_keys!10772 thiss!1141))) (bvslt (size!28171 (_keys!10772 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115349 (= (arrayScanForKey!0 (_keys!10772 thiss!1141) key!756 #b00000000000000000000000000000000) lt!428977)))

(declare-fun b!952321 () Bool)

(assert (=> b!952321 (= e!536321 #b00000000000000000000000000000000)))

(declare-fun b!952322 () Bool)

(assert (=> b!952322 (= e!536321 (arrayScanForKey!0 (_keys!10772 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115349 c!99597) b!952321))

(assert (= (and d!115349 (not c!99597)) b!952322))

(declare-fun m!883957 () Bool)

(assert (=> d!115349 m!883957))

(assert (=> d!115349 m!883937))

(declare-fun m!883959 () Bool)

(assert (=> b!952322 m!883959))

(assert (=> b!952199 d!115349))

(declare-fun d!115351 () Bool)

(assert (=> d!115351 (= (validMask!0 (mask!27664 thiss!1141)) (and (or (= (mask!27664 thiss!1141) #b00000000000000000000000000000111) (= (mask!27664 thiss!1141) #b00000000000000000000000000001111) (= (mask!27664 thiss!1141) #b00000000000000000000000000011111) (= (mask!27664 thiss!1141) #b00000000000000000000000000111111) (= (mask!27664 thiss!1141) #b00000000000000000000000001111111) (= (mask!27664 thiss!1141) #b00000000000000000000000011111111) (= (mask!27664 thiss!1141) #b00000000000000000000000111111111) (= (mask!27664 thiss!1141) #b00000000000000000000001111111111) (= (mask!27664 thiss!1141) #b00000000000000000000011111111111) (= (mask!27664 thiss!1141) #b00000000000000000000111111111111) (= (mask!27664 thiss!1141) #b00000000000000000001111111111111) (= (mask!27664 thiss!1141) #b00000000000000000011111111111111) (= (mask!27664 thiss!1141) #b00000000000000000111111111111111) (= (mask!27664 thiss!1141) #b00000000000000001111111111111111) (= (mask!27664 thiss!1141) #b00000000000000011111111111111111) (= (mask!27664 thiss!1141) #b00000000000000111111111111111111) (= (mask!27664 thiss!1141) #b00000000000001111111111111111111) (= (mask!27664 thiss!1141) #b00000000000011111111111111111111) (= (mask!27664 thiss!1141) #b00000000000111111111111111111111) (= (mask!27664 thiss!1141) #b00000000001111111111111111111111) (= (mask!27664 thiss!1141) #b00000000011111111111111111111111) (= (mask!27664 thiss!1141) #b00000000111111111111111111111111) (= (mask!27664 thiss!1141) #b00000001111111111111111111111111) (= (mask!27664 thiss!1141) #b00000011111111111111111111111111) (= (mask!27664 thiss!1141) #b00000111111111111111111111111111) (= (mask!27664 thiss!1141) #b00001111111111111111111111111111) (= (mask!27664 thiss!1141) #b00011111111111111111111111111111) (= (mask!27664 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27664 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!952199 d!115351))

(declare-fun d!115353 () Bool)

(declare-fun res!638015 () Bool)

(declare-fun e!536322 () Bool)

(assert (=> d!115353 (=> res!638015 e!536322)))

(assert (=> d!115353 (= res!638015 (bvsge #b00000000000000000000000000000000 (size!28171 (_keys!10772 thiss!1141))))))

(assert (=> d!115353 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10772 thiss!1141) (mask!27664 thiss!1141)) e!536322)))

(declare-fun b!952323 () Bool)

(declare-fun e!536323 () Bool)

(declare-fun call!41552 () Bool)

(assert (=> b!952323 (= e!536323 call!41552)))

(declare-fun b!952324 () Bool)

(declare-fun e!536324 () Bool)

(assert (=> b!952324 (= e!536324 call!41552)))

(declare-fun bm!41549 () Bool)

(assert (=> bm!41549 (= call!41552 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10772 thiss!1141) (mask!27664 thiss!1141)))))

(declare-fun b!952325 () Bool)

(assert (=> b!952325 (= e!536324 e!536323)))

(declare-fun lt!428979 () (_ BitVec 64))

(assert (=> b!952325 (= lt!428979 (select (arr!27690 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428978 () Unit!31915)

(assert (=> b!952325 (= lt!428978 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10772 thiss!1141) lt!428979 #b00000000000000000000000000000000))))

(assert (=> b!952325 (arrayContainsKey!0 (_keys!10772 thiss!1141) lt!428979 #b00000000000000000000000000000000)))

(declare-fun lt!428980 () Unit!31915)

(assert (=> b!952325 (= lt!428980 lt!428978)))

(declare-fun res!638014 () Bool)

(assert (=> b!952325 (= res!638014 (= (seekEntryOrOpen!0 (select (arr!27690 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000) (_keys!10772 thiss!1141) (mask!27664 thiss!1141)) (Found!9155 #b00000000000000000000000000000000)))))

(assert (=> b!952325 (=> (not res!638014) (not e!536323))))

(declare-fun b!952326 () Bool)

(assert (=> b!952326 (= e!536322 e!536324)))

(declare-fun c!99598 () Bool)

(assert (=> b!952326 (= c!99598 (validKeyInArray!0 (select (arr!27690 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!115353 (not res!638015)) b!952326))

(assert (= (and b!952326 c!99598) b!952325))

(assert (= (and b!952326 (not c!99598)) b!952324))

(assert (= (and b!952325 res!638014) b!952323))

(assert (= (or b!952323 b!952324) bm!41549))

(declare-fun m!883961 () Bool)

(assert (=> bm!41549 m!883961))

(assert (=> b!952325 m!883937))

(declare-fun m!883963 () Bool)

(assert (=> b!952325 m!883963))

(declare-fun m!883965 () Bool)

(assert (=> b!952325 m!883965))

(assert (=> b!952325 m!883937))

(declare-fun m!883967 () Bool)

(assert (=> b!952325 m!883967))

(assert (=> b!952326 m!883937))

(assert (=> b!952326 m!883937))

(declare-fun m!883969 () Bool)

(assert (=> b!952326 m!883969))

(assert (=> b!952205 d!115353))

(declare-fun d!115355 () Bool)

(declare-fun res!638022 () Bool)

(declare-fun e!536327 () Bool)

(assert (=> d!115355 (=> (not res!638022) (not e!536327))))

(declare-fun simpleValid!382 (LongMapFixedSize!4984) Bool)

(assert (=> d!115355 (= res!638022 (simpleValid!382 thiss!1141))))

(assert (=> d!115355 (= (valid!1901 thiss!1141) e!536327)))

(declare-fun b!952333 () Bool)

(declare-fun res!638023 () Bool)

(assert (=> b!952333 (=> (not res!638023) (not e!536327))))

(declare-fun arrayCountValidKeys!0 (array!57595 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952333 (= res!638023 (= (arrayCountValidKeys!0 (_keys!10772 thiss!1141) #b00000000000000000000000000000000 (size!28171 (_keys!10772 thiss!1141))) (_size!2547 thiss!1141)))))

(declare-fun b!952334 () Bool)

(declare-fun res!638024 () Bool)

(assert (=> b!952334 (=> (not res!638024) (not e!536327))))

(assert (=> b!952334 (= res!638024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10772 thiss!1141) (mask!27664 thiss!1141)))))

(declare-fun b!952335 () Bool)

(declare-datatypes ((List!19368 0))(
  ( (Nil!19365) (Cons!19364 (h!20526 (_ BitVec 64)) (t!27716 List!19368)) )
))
(declare-fun arrayNoDuplicates!0 (array!57595 (_ BitVec 32) List!19368) Bool)

(assert (=> b!952335 (= e!536327 (arrayNoDuplicates!0 (_keys!10772 thiss!1141) #b00000000000000000000000000000000 Nil!19365))))

(assert (= (and d!115355 res!638022) b!952333))

(assert (= (and b!952333 res!638023) b!952334))

(assert (= (and b!952334 res!638024) b!952335))

(declare-fun m!883971 () Bool)

(assert (=> d!115355 m!883971))

(declare-fun m!883973 () Bool)

(assert (=> b!952333 m!883973))

(assert (=> b!952334 m!883837))

(declare-fun m!883975 () Bool)

(assert (=> b!952335 m!883975))

(assert (=> start!81490 d!115355))

(declare-fun d!115357 () Bool)

(declare-fun e!536332 () Bool)

(assert (=> d!115357 e!536332))

(declare-fun res!638027 () Bool)

(assert (=> d!115357 (=> res!638027 e!536332)))

(declare-fun lt!428992 () Bool)

(assert (=> d!115357 (= res!638027 (not lt!428992))))

(declare-fun lt!428989 () Bool)

(assert (=> d!115357 (= lt!428992 lt!428989)))

(declare-fun lt!428990 () Unit!31915)

(declare-fun e!536333 () Unit!31915)

(assert (=> d!115357 (= lt!428990 e!536333)))

(declare-fun c!99601 () Bool)

(assert (=> d!115357 (= c!99601 lt!428989)))

(declare-fun containsKey!472 (List!19366 (_ BitVec 64)) Bool)

(assert (=> d!115357 (= lt!428989 (containsKey!472 (toList!6172 (getCurrentListMap!3334 (_keys!10772 thiss!1141) (_values!5846 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141))) key!756))))

(assert (=> d!115357 (= (contains!5210 (getCurrentListMap!3334 (_keys!10772 thiss!1141) (_values!5846 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141)) key!756) lt!428992)))

(declare-fun b!952342 () Bool)

(declare-fun lt!428991 () Unit!31915)

(assert (=> b!952342 (= e!536333 lt!428991)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!367 (List!19366 (_ BitVec 64)) Unit!31915)

(assert (=> b!952342 (= lt!428991 (lemmaContainsKeyImpliesGetValueByKeyDefined!367 (toList!6172 (getCurrentListMap!3334 (_keys!10772 thiss!1141) (_values!5846 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141))) key!756))))

(declare-datatypes ((Option!514 0))(
  ( (Some!513 (v!13002 V!32695)) (None!512) )
))
(declare-fun isDefined!380 (Option!514) Bool)

(declare-fun getValueByKey!508 (List!19366 (_ BitVec 64)) Option!514)

(assert (=> b!952342 (isDefined!380 (getValueByKey!508 (toList!6172 (getCurrentListMap!3334 (_keys!10772 thiss!1141) (_values!5846 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141))) key!756))))

(declare-fun b!952343 () Bool)

(declare-fun Unit!31919 () Unit!31915)

(assert (=> b!952343 (= e!536333 Unit!31919)))

(declare-fun b!952344 () Bool)

(assert (=> b!952344 (= e!536332 (isDefined!380 (getValueByKey!508 (toList!6172 (getCurrentListMap!3334 (_keys!10772 thiss!1141) (_values!5846 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141))) key!756)))))

(assert (= (and d!115357 c!99601) b!952342))

(assert (= (and d!115357 (not c!99601)) b!952343))

(assert (= (and d!115357 (not res!638027)) b!952344))

(declare-fun m!883977 () Bool)

(assert (=> d!115357 m!883977))

(declare-fun m!883979 () Bool)

(assert (=> b!952342 m!883979))

(declare-fun m!883981 () Bool)

(assert (=> b!952342 m!883981))

(assert (=> b!952342 m!883981))

(declare-fun m!883983 () Bool)

(assert (=> b!952342 m!883983))

(assert (=> b!952344 m!883981))

(assert (=> b!952344 m!883981))

(assert (=> b!952344 m!883983))

(assert (=> b!952201 d!115357))

(declare-fun b!952387 () Bool)

(declare-fun e!536363 () Bool)

(assert (=> b!952387 (= e!536363 (validKeyInArray!0 (select (arr!27690 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952388 () Bool)

(declare-fun e!536370 () ListLongMap!12313)

(declare-fun call!41570 () ListLongMap!12313)

(assert (=> b!952388 (= e!536370 call!41570)))

(declare-fun d!115359 () Bool)

(declare-fun e!536366 () Bool)

(assert (=> d!115359 e!536366))

(declare-fun res!638048 () Bool)

(assert (=> d!115359 (=> (not res!638048) (not e!536366))))

(assert (=> d!115359 (= res!638048 (or (bvsge #b00000000000000000000000000000000 (size!28171 (_keys!10772 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28171 (_keys!10772 thiss!1141))))))))

(declare-fun lt!429056 () ListLongMap!12313)

(declare-fun lt!429057 () ListLongMap!12313)

(assert (=> d!115359 (= lt!429056 lt!429057)))

(declare-fun lt!429045 () Unit!31915)

(declare-fun e!536360 () Unit!31915)

(assert (=> d!115359 (= lt!429045 e!536360)))

(declare-fun c!99617 () Bool)

(declare-fun e!536371 () Bool)

(assert (=> d!115359 (= c!99617 e!536371)))

(declare-fun res!638054 () Bool)

(assert (=> d!115359 (=> (not res!638054) (not e!536371))))

(assert (=> d!115359 (= res!638054 (bvslt #b00000000000000000000000000000000 (size!28171 (_keys!10772 thiss!1141))))))

(declare-fun e!536362 () ListLongMap!12313)

(assert (=> d!115359 (= lt!429057 e!536362)))

(declare-fun c!99614 () Bool)

(assert (=> d!115359 (= c!99614 (and (not (= (bvand (extraKeys!5555 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5555 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115359 (validMask!0 (mask!27664 thiss!1141))))

(assert (=> d!115359 (= (getCurrentListMap!3334 (_keys!10772 thiss!1141) (_values!5846 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141)) lt!429056)))

(declare-fun b!952389 () Bool)

(declare-fun e!536364 () Bool)

(declare-fun call!41573 () Bool)

(assert (=> b!952389 (= e!536364 (not call!41573))))

(declare-fun b!952390 () Bool)

(declare-fun e!536365 () Bool)

(declare-fun e!536367 () Bool)

(assert (=> b!952390 (= e!536365 e!536367)))

(declare-fun res!638053 () Bool)

(declare-fun call!41567 () Bool)

(assert (=> b!952390 (= res!638053 call!41567)))

(assert (=> b!952390 (=> (not res!638053) (not e!536367))))

(declare-fun bm!41564 () Bool)

(declare-fun call!41572 () ListLongMap!12313)

(declare-fun call!41569 () ListLongMap!12313)

(assert (=> bm!41564 (= call!41572 call!41569)))

(declare-fun b!952391 () Bool)

(declare-fun e!536368 () Bool)

(declare-fun apply!879 (ListLongMap!12313 (_ BitVec 64)) V!32695)

(assert (=> b!952391 (= e!536368 (= (apply!879 lt!429056 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5659 thiss!1141)))))

(declare-fun call!41568 () ListLongMap!12313)

(declare-fun bm!41565 () Bool)

(declare-fun c!99618 () Bool)

(declare-fun +!2889 (ListLongMap!12313 tuple2!13626) ListLongMap!12313)

(assert (=> bm!41565 (= call!41568 (+!2889 (ite c!99614 call!41569 (ite c!99618 call!41572 call!41570)) (ite (or c!99614 c!99618) (tuple2!13627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5659 thiss!1141)) (tuple2!13627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5659 thiss!1141)))))))

(declare-fun b!952392 () Bool)

(declare-fun res!638050 () Bool)

(assert (=> b!952392 (=> (not res!638050) (not e!536366))))

(assert (=> b!952392 (= res!638050 e!536364)))

(declare-fun c!99619 () Bool)

(assert (=> b!952392 (= c!99619 (not (= (bvand (extraKeys!5555 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!952393 () Bool)

(assert (=> b!952393 (= e!536364 e!536368)))

(declare-fun res!638047 () Bool)

(assert (=> b!952393 (= res!638047 call!41573)))

(assert (=> b!952393 (=> (not res!638047) (not e!536368))))

(declare-fun b!952394 () Bool)

(declare-fun e!536361 () ListLongMap!12313)

(assert (=> b!952394 (= e!536362 e!536361)))

(assert (=> b!952394 (= c!99618 (and (not (= (bvand (extraKeys!5555 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5555 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41566 () Bool)

(assert (=> bm!41566 (= call!41567 (contains!5210 lt!429056 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!952395 () Bool)

(declare-fun e!536369 () Bool)

(declare-fun e!536372 () Bool)

(assert (=> b!952395 (= e!536369 e!536372)))

(declare-fun res!638052 () Bool)

(assert (=> b!952395 (=> (not res!638052) (not e!536372))))

(assert (=> b!952395 (= res!638052 (contains!5210 lt!429056 (select (arr!27690 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!952395 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28171 (_keys!10772 thiss!1141))))))

(declare-fun b!952396 () Bool)

(declare-fun get!14556 (ValueCell!9917 V!32695) V!32695)

(declare-fun dynLambda!1645 (Int (_ BitVec 64)) V!32695)

(assert (=> b!952396 (= e!536372 (= (apply!879 lt!429056 (select (arr!27690 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000)) (get!14556 (select (arr!27689 (_values!5846 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1645 (defaultEntry!5823 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!952396 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28170 (_values!5846 thiss!1141))))))

(assert (=> b!952396 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28171 (_keys!10772 thiss!1141))))))

(declare-fun b!952397 () Bool)

(declare-fun call!41571 () ListLongMap!12313)

(assert (=> b!952397 (= e!536361 call!41571)))

(declare-fun b!952398 () Bool)

(assert (=> b!952398 (= e!536367 (= (apply!879 lt!429056 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5659 thiss!1141)))))

(declare-fun bm!41567 () Bool)

(assert (=> bm!41567 (= call!41570 call!41572)))

(declare-fun b!952399 () Bool)

(declare-fun lt!429058 () Unit!31915)

(assert (=> b!952399 (= e!536360 lt!429058)))

(declare-fun lt!429038 () ListLongMap!12313)

(declare-fun getCurrentListMapNoExtraKeys!3361 (array!57595 array!57593 (_ BitVec 32) (_ BitVec 32) V!32695 V!32695 (_ BitVec 32) Int) ListLongMap!12313)

(assert (=> b!952399 (= lt!429038 (getCurrentListMapNoExtraKeys!3361 (_keys!10772 thiss!1141) (_values!5846 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141)))))

(declare-fun lt!429046 () (_ BitVec 64))

(assert (=> b!952399 (= lt!429046 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429050 () (_ BitVec 64))

(assert (=> b!952399 (= lt!429050 (select (arr!27690 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429051 () Unit!31915)

(declare-fun addStillContains!578 (ListLongMap!12313 (_ BitVec 64) V!32695 (_ BitVec 64)) Unit!31915)

(assert (=> b!952399 (= lt!429051 (addStillContains!578 lt!429038 lt!429046 (zeroValue!5659 thiss!1141) lt!429050))))

(assert (=> b!952399 (contains!5210 (+!2889 lt!429038 (tuple2!13627 lt!429046 (zeroValue!5659 thiss!1141))) lt!429050)))

(declare-fun lt!429047 () Unit!31915)

(assert (=> b!952399 (= lt!429047 lt!429051)))

(declare-fun lt!429052 () ListLongMap!12313)

(assert (=> b!952399 (= lt!429052 (getCurrentListMapNoExtraKeys!3361 (_keys!10772 thiss!1141) (_values!5846 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141)))))

(declare-fun lt!429037 () (_ BitVec 64))

(assert (=> b!952399 (= lt!429037 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429049 () (_ BitVec 64))

(assert (=> b!952399 (= lt!429049 (select (arr!27690 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429053 () Unit!31915)

(declare-fun addApplyDifferent!458 (ListLongMap!12313 (_ BitVec 64) V!32695 (_ BitVec 64)) Unit!31915)

(assert (=> b!952399 (= lt!429053 (addApplyDifferent!458 lt!429052 lt!429037 (minValue!5659 thiss!1141) lt!429049))))

(assert (=> b!952399 (= (apply!879 (+!2889 lt!429052 (tuple2!13627 lt!429037 (minValue!5659 thiss!1141))) lt!429049) (apply!879 lt!429052 lt!429049))))

(declare-fun lt!429054 () Unit!31915)

(assert (=> b!952399 (= lt!429054 lt!429053)))

(declare-fun lt!429041 () ListLongMap!12313)

(assert (=> b!952399 (= lt!429041 (getCurrentListMapNoExtraKeys!3361 (_keys!10772 thiss!1141) (_values!5846 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141)))))

(declare-fun lt!429048 () (_ BitVec 64))

(assert (=> b!952399 (= lt!429048 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429055 () (_ BitVec 64))

(assert (=> b!952399 (= lt!429055 (select (arr!27690 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429042 () Unit!31915)

(assert (=> b!952399 (= lt!429042 (addApplyDifferent!458 lt!429041 lt!429048 (zeroValue!5659 thiss!1141) lt!429055))))

(assert (=> b!952399 (= (apply!879 (+!2889 lt!429041 (tuple2!13627 lt!429048 (zeroValue!5659 thiss!1141))) lt!429055) (apply!879 lt!429041 lt!429055))))

(declare-fun lt!429044 () Unit!31915)

(assert (=> b!952399 (= lt!429044 lt!429042)))

(declare-fun lt!429043 () ListLongMap!12313)

(assert (=> b!952399 (= lt!429043 (getCurrentListMapNoExtraKeys!3361 (_keys!10772 thiss!1141) (_values!5846 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141)))))

(declare-fun lt!429039 () (_ BitVec 64))

(assert (=> b!952399 (= lt!429039 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429040 () (_ BitVec 64))

(assert (=> b!952399 (= lt!429040 (select (arr!27690 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952399 (= lt!429058 (addApplyDifferent!458 lt!429043 lt!429039 (minValue!5659 thiss!1141) lt!429040))))

(assert (=> b!952399 (= (apply!879 (+!2889 lt!429043 (tuple2!13627 lt!429039 (minValue!5659 thiss!1141))) lt!429040) (apply!879 lt!429043 lt!429040))))

(declare-fun bm!41568 () Bool)

(assert (=> bm!41568 (= call!41571 call!41568)))

(declare-fun b!952400 () Bool)

(assert (=> b!952400 (= e!536371 (validKeyInArray!0 (select (arr!27690 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952401 () Bool)

(assert (=> b!952401 (= e!536362 (+!2889 call!41568 (tuple2!13627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5659 thiss!1141))))))

(declare-fun b!952402 () Bool)

(declare-fun Unit!31920 () Unit!31915)

(assert (=> b!952402 (= e!536360 Unit!31920)))

(declare-fun bm!41569 () Bool)

(assert (=> bm!41569 (= call!41573 (contains!5210 lt!429056 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!952403 () Bool)

(assert (=> b!952403 (= e!536370 call!41571)))

(declare-fun b!952404 () Bool)

(assert (=> b!952404 (= e!536365 (not call!41567))))

(declare-fun bm!41570 () Bool)

(assert (=> bm!41570 (= call!41569 (getCurrentListMapNoExtraKeys!3361 (_keys!10772 thiss!1141) (_values!5846 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141)))))

(declare-fun b!952405 () Bool)

(declare-fun res!638046 () Bool)

(assert (=> b!952405 (=> (not res!638046) (not e!536366))))

(assert (=> b!952405 (= res!638046 e!536369)))

(declare-fun res!638051 () Bool)

(assert (=> b!952405 (=> res!638051 e!536369)))

(assert (=> b!952405 (= res!638051 (not e!536363))))

(declare-fun res!638049 () Bool)

(assert (=> b!952405 (=> (not res!638049) (not e!536363))))

(assert (=> b!952405 (= res!638049 (bvslt #b00000000000000000000000000000000 (size!28171 (_keys!10772 thiss!1141))))))

(declare-fun b!952406 () Bool)

(assert (=> b!952406 (= e!536366 e!536365)))

(declare-fun c!99615 () Bool)

(assert (=> b!952406 (= c!99615 (not (= (bvand (extraKeys!5555 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!952407 () Bool)

(declare-fun c!99616 () Bool)

(assert (=> b!952407 (= c!99616 (and (not (= (bvand (extraKeys!5555 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5555 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!952407 (= e!536361 e!536370)))

(assert (= (and d!115359 c!99614) b!952401))

(assert (= (and d!115359 (not c!99614)) b!952394))

(assert (= (and b!952394 c!99618) b!952397))

(assert (= (and b!952394 (not c!99618)) b!952407))

(assert (= (and b!952407 c!99616) b!952403))

(assert (= (and b!952407 (not c!99616)) b!952388))

(assert (= (or b!952403 b!952388) bm!41567))

(assert (= (or b!952397 bm!41567) bm!41564))

(assert (= (or b!952397 b!952403) bm!41568))

(assert (= (or b!952401 bm!41564) bm!41570))

(assert (= (or b!952401 bm!41568) bm!41565))

(assert (= (and d!115359 res!638054) b!952400))

(assert (= (and d!115359 c!99617) b!952399))

(assert (= (and d!115359 (not c!99617)) b!952402))

(assert (= (and d!115359 res!638048) b!952405))

(assert (= (and b!952405 res!638049) b!952387))

(assert (= (and b!952405 (not res!638051)) b!952395))

(assert (= (and b!952395 res!638052) b!952396))

(assert (= (and b!952405 res!638046) b!952392))

(assert (= (and b!952392 c!99619) b!952393))

(assert (= (and b!952392 (not c!99619)) b!952389))

(assert (= (and b!952393 res!638047) b!952391))

(assert (= (or b!952393 b!952389) bm!41569))

(assert (= (and b!952392 res!638050) b!952406))

(assert (= (and b!952406 c!99615) b!952390))

(assert (= (and b!952406 (not c!99615)) b!952404))

(assert (= (and b!952390 res!638053) b!952398))

(assert (= (or b!952390 b!952404) bm!41566))

(declare-fun b_lambda!14397 () Bool)

(assert (=> (not b_lambda!14397) (not b!952396)))

(declare-fun t!27715 () Bool)

(declare-fun tb!6199 () Bool)

(assert (=> (and b!952207 (= (defaultEntry!5823 thiss!1141) (defaultEntry!5823 thiss!1141)) t!27715) tb!6199))

(declare-fun result!12335 () Bool)

(assert (=> tb!6199 (= result!12335 tp_is_empty!20797)))

(assert (=> b!952396 t!27715))

(declare-fun b_and!29749 () Bool)

(assert (= b_and!29743 (and (=> t!27715 result!12335) b_and!29749)))

(declare-fun m!883985 () Bool)

(assert (=> bm!41570 m!883985))

(declare-fun m!883987 () Bool)

(assert (=> bm!41566 m!883987))

(assert (=> b!952395 m!883937))

(assert (=> b!952395 m!883937))

(declare-fun m!883989 () Bool)

(assert (=> b!952395 m!883989))

(assert (=> d!115359 m!883859))

(declare-fun m!883991 () Bool)

(assert (=> b!952401 m!883991))

(declare-fun m!883993 () Bool)

(assert (=> b!952399 m!883993))

(declare-fun m!883995 () Bool)

(assert (=> b!952399 m!883995))

(declare-fun m!883997 () Bool)

(assert (=> b!952399 m!883997))

(declare-fun m!883999 () Bool)

(assert (=> b!952399 m!883999))

(declare-fun m!884001 () Bool)

(assert (=> b!952399 m!884001))

(assert (=> b!952399 m!883937))

(assert (=> b!952399 m!883985))

(assert (=> b!952399 m!883995))

(declare-fun m!884003 () Bool)

(assert (=> b!952399 m!884003))

(declare-fun m!884005 () Bool)

(assert (=> b!952399 m!884005))

(declare-fun m!884007 () Bool)

(assert (=> b!952399 m!884007))

(assert (=> b!952399 m!884003))

(declare-fun m!884009 () Bool)

(assert (=> b!952399 m!884009))

(declare-fun m!884011 () Bool)

(assert (=> b!952399 m!884011))

(assert (=> b!952399 m!884001))

(declare-fun m!884013 () Bool)

(assert (=> b!952399 m!884013))

(declare-fun m!884015 () Bool)

(assert (=> b!952399 m!884015))

(assert (=> b!952399 m!884007))

(declare-fun m!884017 () Bool)

(assert (=> b!952399 m!884017))

(declare-fun m!884019 () Bool)

(assert (=> b!952399 m!884019))

(declare-fun m!884021 () Bool)

(assert (=> b!952399 m!884021))

(declare-fun m!884023 () Bool)

(assert (=> b!952398 m!884023))

(assert (=> b!952396 m!883937))

(declare-fun m!884025 () Bool)

(assert (=> b!952396 m!884025))

(declare-fun m!884027 () Bool)

(assert (=> b!952396 m!884027))

(assert (=> b!952396 m!883937))

(assert (=> b!952396 m!884027))

(declare-fun m!884029 () Bool)

(assert (=> b!952396 m!884029))

(declare-fun m!884031 () Bool)

(assert (=> b!952396 m!884031))

(assert (=> b!952396 m!884029))

(assert (=> b!952400 m!883937))

(assert (=> b!952400 m!883937))

(assert (=> b!952400 m!883969))

(declare-fun m!884033 () Bool)

(assert (=> bm!41565 m!884033))

(declare-fun m!884035 () Bool)

(assert (=> bm!41569 m!884035))

(assert (=> b!952387 m!883937))

(assert (=> b!952387 m!883937))

(assert (=> b!952387 m!883969))

(declare-fun m!884037 () Bool)

(assert (=> b!952391 m!884037))

(assert (=> b!952201 d!115359))

(declare-fun mapNonEmpty!33142 () Bool)

(declare-fun mapRes!33142 () Bool)

(declare-fun tp!63505 () Bool)

(declare-fun e!536377 () Bool)

(assert (=> mapNonEmpty!33142 (= mapRes!33142 (and tp!63505 e!536377))))

(declare-fun mapKey!33142 () (_ BitVec 32))

(declare-fun mapValue!33142 () ValueCell!9917)

(declare-fun mapRest!33142 () (Array (_ BitVec 32) ValueCell!9917))

(assert (=> mapNonEmpty!33142 (= mapRest!33133 (store mapRest!33142 mapKey!33142 mapValue!33142))))

(declare-fun mapIsEmpty!33142 () Bool)

(assert (=> mapIsEmpty!33142 mapRes!33142))

(declare-fun b!952416 () Bool)

(assert (=> b!952416 (= e!536377 tp_is_empty!20797)))

(declare-fun condMapEmpty!33142 () Bool)

(declare-fun mapDefault!33142 () ValueCell!9917)

(assert (=> mapNonEmpty!33133 (= condMapEmpty!33142 (= mapRest!33133 ((as const (Array (_ BitVec 32) ValueCell!9917)) mapDefault!33142)))))

(declare-fun e!536378 () Bool)

(assert (=> mapNonEmpty!33133 (= tp!63490 (and e!536378 mapRes!33142))))

(declare-fun b!952417 () Bool)

(assert (=> b!952417 (= e!536378 tp_is_empty!20797)))

(assert (= (and mapNonEmpty!33133 condMapEmpty!33142) mapIsEmpty!33142))

(assert (= (and mapNonEmpty!33133 (not condMapEmpty!33142)) mapNonEmpty!33142))

(assert (= (and mapNonEmpty!33142 ((_ is ValueCellFull!9917) mapValue!33142)) b!952416))

(assert (= (and mapNonEmpty!33133 ((_ is ValueCellFull!9917) mapDefault!33142)) b!952417))

(declare-fun m!884039 () Bool)

(assert (=> mapNonEmpty!33142 m!884039))

(declare-fun b_lambda!14399 () Bool)

(assert (= b_lambda!14397 (or (and b!952207 b_free!18289) b_lambda!14399)))

(check-sat (not d!115355) (not bm!41549) b_and!29749 (not b!952322) tp_is_empty!20797 (not b!952334) (not b!952344) (not b!952401) (not b!952396) (not d!115345) (not mapNonEmpty!33142) (not b!952391) (not b!952395) (not b!952387) (not b!952342) (not d!115333) (not b_next!18289) (not bm!41566) (not b!952400) (not d!115359) (not b!952309) (not d!115357) (not b!952399) (not b!952315) (not b!952310) (not b!952335) (not b!952325) (not bm!41569) (not b!952326) (not bm!41570) (not b!952298) (not d!115347) (not b_lambda!14399) (not b!952288) (not b!952333) (not bm!41565) (not bm!41548) (not b!952398))
(check-sat b_and!29749 (not b_next!18289))
