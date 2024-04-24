; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23298 () Bool)

(assert start!23298)

(declare-fun b!244984 () Bool)

(declare-fun b_free!6547 () Bool)

(declare-fun b_next!6547 () Bool)

(assert (=> b!244984 (= b_free!6547 (not b_next!6547))))

(declare-fun tp!22870 () Bool)

(declare-fun b_and!13547 () Bool)

(assert (=> b!244984 (= tp!22870 b_and!13547)))

(declare-fun b!244962 () Bool)

(declare-fun e!158928 () Bool)

(declare-fun call!22833 () Bool)

(assert (=> b!244962 (= e!158928 (not call!22833))))

(declare-fun b!244963 () Bool)

(declare-fun e!158918 () Bool)

(declare-fun e!158922 () Bool)

(declare-fun mapRes!10870 () Bool)

(assert (=> b!244963 (= e!158918 (and e!158922 mapRes!10870))))

(declare-fun condMapEmpty!10870 () Bool)

(declare-datatypes ((V!8193 0))(
  ( (V!8194 (val!3249 Int)) )
))
(declare-datatypes ((ValueCell!2861 0))(
  ( (ValueCellFull!2861 (v!5301 V!8193)) (EmptyCell!2861) )
))
(declare-datatypes ((array!12111 0))(
  ( (array!12112 (arr!5749 (Array (_ BitVec 32) ValueCell!2861)) (size!6091 (_ BitVec 32))) )
))
(declare-datatypes ((array!12113 0))(
  ( (array!12114 (arr!5750 (Array (_ BitVec 32) (_ BitVec 64))) (size!6092 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3622 0))(
  ( (LongMapFixedSize!3623 (defaultEntry!4532 Int) (mask!10637 (_ BitVec 32)) (extraKeys!4269 (_ BitVec 32)) (zeroValue!4373 V!8193) (minValue!4373 V!8193) (_size!1860 (_ BitVec 32)) (_keys!6645 array!12113) (_values!4515 array!12111) (_vacant!1860 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3622)

(declare-fun mapDefault!10870 () ValueCell!2861)

(assert (=> b!244963 (= condMapEmpty!10870 (= (arr!5749 (_values!4515 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2861)) mapDefault!10870)))))

(declare-fun b!244964 () Bool)

(declare-fun e!158925 () Bool)

(assert (=> b!244964 (= e!158925 (bvslt (size!6092 (_keys!6645 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun res!120173 () Bool)

(declare-fun e!158926 () Bool)

(assert (=> start!23298 (=> (not res!120173) (not e!158926))))

(declare-fun valid!1431 (LongMapFixedSize!3622) Bool)

(assert (=> start!23298 (= res!120173 (valid!1431 thiss!1504))))

(assert (=> start!23298 e!158926))

(declare-fun e!158919 () Bool)

(assert (=> start!23298 e!158919))

(assert (=> start!23298 true))

(declare-fun b!244965 () Bool)

(declare-fun e!158932 () Bool)

(declare-fun e!158927 () Bool)

(assert (=> b!244965 (= e!158932 e!158927)))

(declare-fun res!120183 () Bool)

(assert (=> b!244965 (=> (not res!120183) (not e!158927))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244965 (= res!120183 (inRange!0 index!297 (mask!10637 thiss!1504)))))

(declare-datatypes ((Unit!7545 0))(
  ( (Unit!7546) )
))
(declare-fun lt!122722 () Unit!7545)

(declare-fun e!158929 () Unit!7545)

(assert (=> b!244965 (= lt!122722 e!158929)))

(declare-fun c!40888 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4714 0))(
  ( (tuple2!4715 (_1!2368 (_ BitVec 64)) (_2!2368 V!8193)) )
))
(declare-datatypes ((List!3589 0))(
  ( (Nil!3586) (Cons!3585 (h!4242 tuple2!4714) (t!8592 List!3589)) )
))
(declare-datatypes ((ListLongMap!3629 0))(
  ( (ListLongMap!3630 (toList!1830 List!3589)) )
))
(declare-fun contains!1753 (ListLongMap!3629 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1362 (array!12113 array!12111 (_ BitVec 32) (_ BitVec 32) V!8193 V!8193 (_ BitVec 32) Int) ListLongMap!3629)

(assert (=> b!244965 (= c!40888 (contains!1753 (getCurrentListMap!1362 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)) key!932))))

(declare-fun b!244966 () Bool)

(declare-fun e!158923 () Bool)

(declare-fun tp_is_empty!6409 () Bool)

(assert (=> b!244966 (= e!158923 tp_is_empty!6409)))

(declare-fun b!244967 () Bool)

(assert (=> b!244967 (= e!158922 tp_is_empty!6409)))

(declare-fun b!244968 () Bool)

(declare-fun e!158920 () Bool)

(declare-datatypes ((SeekEntryResult!1052 0))(
  ( (MissingZero!1052 (index!6378 (_ BitVec 32))) (Found!1052 (index!6379 (_ BitVec 32))) (Intermediate!1052 (undefined!1864 Bool) (index!6380 (_ BitVec 32)) (x!24364 (_ BitVec 32))) (Undefined!1052) (MissingVacant!1052 (index!6381 (_ BitVec 32))) )
))
(declare-fun lt!122727 () SeekEntryResult!1052)

(get-info :version)

(assert (=> b!244968 (= e!158920 ((_ is Undefined!1052) lt!122727))))

(declare-fun b!244969 () Bool)

(declare-fun res!120176 () Bool)

(assert (=> b!244969 (=> (not res!120176) (not e!158925))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!244969 (= res!120176 (validKeyInArray!0 key!932))))

(declare-fun bm!22829 () Bool)

(declare-fun arrayContainsKey!0 (array!12113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22829 (= call!22833 (arrayContainsKey!0 (_keys!6645 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244970 () Bool)

(declare-fun e!158931 () Unit!7545)

(declare-fun Unit!7547 () Unit!7545)

(assert (=> b!244970 (= e!158931 Unit!7547)))

(declare-fun lt!122726 () Unit!7545)

(declare-fun lemmaArrayContainsKeyThenInListMap!186 (array!12113 array!12111 (_ BitVec 32) (_ BitVec 32) V!8193 V!8193 (_ BitVec 64) (_ BitVec 32) Int) Unit!7545)

(assert (=> b!244970 (= lt!122726 (lemmaArrayContainsKeyThenInListMap!186 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)))))

(assert (=> b!244970 false))

(declare-fun b!244971 () Bool)

(declare-fun res!120179 () Bool)

(assert (=> b!244971 (=> (not res!120179) (not e!158928))))

(declare-fun call!22832 () Bool)

(assert (=> b!244971 (= res!120179 call!22832)))

(declare-fun e!158930 () Bool)

(assert (=> b!244971 (= e!158930 e!158928)))

(declare-fun b!244972 () Bool)

(declare-fun Unit!7548 () Unit!7545)

(assert (=> b!244972 (= e!158929 Unit!7548)))

(declare-fun lt!122728 () Unit!7545)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!368 (array!12113 array!12111 (_ BitVec 32) (_ BitVec 32) V!8193 V!8193 (_ BitVec 64) Int) Unit!7545)

(assert (=> b!244972 (= lt!122728 (lemmaInListMapThenSeekEntryOrOpenFindsIt!368 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) key!932 (defaultEntry!4532 thiss!1504)))))

(assert (=> b!244972 false))

(declare-fun b!244973 () Bool)

(declare-fun res!120182 () Bool)

(assert (=> b!244973 (=> (not res!120182) (not e!158928))))

(assert (=> b!244973 (= res!120182 (= (select (arr!5750 (_keys!6645 thiss!1504)) (index!6378 lt!122727)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!10870 () Bool)

(declare-fun tp!22869 () Bool)

(assert (=> mapNonEmpty!10870 (= mapRes!10870 (and tp!22869 e!158923))))

(declare-fun mapKey!10870 () (_ BitVec 32))

(declare-fun mapValue!10870 () ValueCell!2861)

(declare-fun mapRest!10870 () (Array (_ BitVec 32) ValueCell!2861))

(assert (=> mapNonEmpty!10870 (= (arr!5749 (_values!4515 thiss!1504)) (store mapRest!10870 mapKey!10870 mapValue!10870))))

(declare-fun b!244974 () Bool)

(assert (=> b!244974 (= e!158926 e!158932)))

(declare-fun res!120181 () Bool)

(assert (=> b!244974 (=> (not res!120181) (not e!158932))))

(assert (=> b!244974 (= res!120181 (or (= lt!122727 (MissingZero!1052 index!297)) (= lt!122727 (MissingVacant!1052 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12113 (_ BitVec 32)) SeekEntryResult!1052)

(assert (=> b!244974 (= lt!122727 (seekEntryOrOpen!0 key!932 (_keys!6645 thiss!1504) (mask!10637 thiss!1504)))))

(declare-fun bm!22830 () Bool)

(declare-fun c!40886 () Bool)

(assert (=> bm!22830 (= call!22832 (inRange!0 (ite c!40886 (index!6378 lt!122727) (index!6381 lt!122727)) (mask!10637 thiss!1504)))))

(declare-fun b!244975 () Bool)

(declare-fun res!120180 () Bool)

(assert (=> b!244975 (=> (not res!120180) (not e!158925))))

(assert (=> b!244975 (= res!120180 (not (validKeyInArray!0 (select (arr!5750 (_keys!6645 thiss!1504)) index!297))))))

(declare-fun b!244976 () Bool)

(declare-fun res!120178 () Bool)

(assert (=> b!244976 (=> (not res!120178) (not e!158926))))

(assert (=> b!244976 (= res!120178 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!244977 () Bool)

(declare-fun Unit!7549 () Unit!7545)

(assert (=> b!244977 (= e!158931 Unit!7549)))

(declare-fun b!244978 () Bool)

(declare-fun res!120177 () Bool)

(assert (=> b!244978 (= res!120177 (= (select (arr!5750 (_keys!6645 thiss!1504)) (index!6381 lt!122727)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158921 () Bool)

(assert (=> b!244978 (=> (not res!120177) (not e!158921))))

(declare-fun mapIsEmpty!10870 () Bool)

(assert (=> mapIsEmpty!10870 mapRes!10870))

(declare-fun b!244979 () Bool)

(declare-fun lt!122724 () Unit!7545)

(assert (=> b!244979 (= e!158929 lt!122724)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!361 (array!12113 array!12111 (_ BitVec 32) (_ BitVec 32) V!8193 V!8193 (_ BitVec 64) Int) Unit!7545)

(assert (=> b!244979 (= lt!122724 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!361 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) key!932 (defaultEntry!4532 thiss!1504)))))

(assert (=> b!244979 (= c!40886 ((_ is MissingZero!1052) lt!122727))))

(assert (=> b!244979 e!158930))

(declare-fun b!244980 () Bool)

(declare-fun c!40887 () Bool)

(assert (=> b!244980 (= c!40887 ((_ is MissingVacant!1052) lt!122727))))

(assert (=> b!244980 (= e!158930 e!158920)))

(declare-fun b!244981 () Bool)

(assert (=> b!244981 (= e!158921 (not call!22833))))

(declare-fun b!244982 () Bool)

(assert (=> b!244982 (= e!158920 e!158921)))

(declare-fun res!120174 () Bool)

(assert (=> b!244982 (= res!120174 call!22832)))

(assert (=> b!244982 (=> (not res!120174) (not e!158921))))

(declare-fun b!244983 () Bool)

(assert (=> b!244983 (= e!158927 (not e!158925))))

(declare-fun res!120175 () Bool)

(assert (=> b!244983 (=> (not res!120175) (not e!158925))))

(assert (=> b!244983 (= res!120175 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6092 (_keys!6645 thiss!1504)))))))

(declare-datatypes ((List!3590 0))(
  ( (Nil!3587) (Cons!3586 (h!4243 (_ BitVec 64)) (t!8593 List!3590)) )
))
(declare-fun arrayNoDuplicates!0 (array!12113 (_ BitVec 32) List!3590) Bool)

(assert (=> b!244983 (arrayNoDuplicates!0 (array!12114 (store (arr!5750 (_keys!6645 thiss!1504)) index!297 key!932) (size!6092 (_keys!6645 thiss!1504))) #b00000000000000000000000000000000 Nil!3587)))

(declare-fun lt!122725 () Unit!7545)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12113 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3590) Unit!7545)

(assert (=> b!244983 (= lt!122725 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6645 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3587))))

(declare-fun lt!122723 () Unit!7545)

(assert (=> b!244983 (= lt!122723 e!158931)))

(declare-fun c!40885 () Bool)

(assert (=> b!244983 (= c!40885 (arrayContainsKey!0 (_keys!6645 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun array_inv!3783 (array!12113) Bool)

(declare-fun array_inv!3784 (array!12111) Bool)

(assert (=> b!244984 (= e!158919 (and tp!22870 tp_is_empty!6409 (array_inv!3783 (_keys!6645 thiss!1504)) (array_inv!3784 (_values!4515 thiss!1504)) e!158918))))

(assert (= (and start!23298 res!120173) b!244976))

(assert (= (and b!244976 res!120178) b!244974))

(assert (= (and b!244974 res!120181) b!244965))

(assert (= (and b!244965 c!40888) b!244972))

(assert (= (and b!244965 (not c!40888)) b!244979))

(assert (= (and b!244979 c!40886) b!244971))

(assert (= (and b!244979 (not c!40886)) b!244980))

(assert (= (and b!244971 res!120179) b!244973))

(assert (= (and b!244973 res!120182) b!244962))

(assert (= (and b!244980 c!40887) b!244982))

(assert (= (and b!244980 (not c!40887)) b!244968))

(assert (= (and b!244982 res!120174) b!244978))

(assert (= (and b!244978 res!120177) b!244981))

(assert (= (or b!244971 b!244982) bm!22830))

(assert (= (or b!244962 b!244981) bm!22829))

(assert (= (and b!244965 res!120183) b!244983))

(assert (= (and b!244983 c!40885) b!244970))

(assert (= (and b!244983 (not c!40885)) b!244977))

(assert (= (and b!244983 res!120175) b!244975))

(assert (= (and b!244975 res!120180) b!244969))

(assert (= (and b!244969 res!120176) b!244964))

(assert (= (and b!244963 condMapEmpty!10870) mapIsEmpty!10870))

(assert (= (and b!244963 (not condMapEmpty!10870)) mapNonEmpty!10870))

(assert (= (and mapNonEmpty!10870 ((_ is ValueCellFull!2861) mapValue!10870)) b!244966))

(assert (= (and b!244963 ((_ is ValueCellFull!2861) mapDefault!10870)) b!244967))

(assert (= b!244984 b!244963))

(assert (= start!23298 b!244984))

(declare-fun m!262845 () Bool)

(assert (=> b!244978 m!262845))

(declare-fun m!262847 () Bool)

(assert (=> start!23298 m!262847))

(declare-fun m!262849 () Bool)

(assert (=> mapNonEmpty!10870 m!262849))

(declare-fun m!262851 () Bool)

(assert (=> bm!22829 m!262851))

(declare-fun m!262853 () Bool)

(assert (=> bm!22830 m!262853))

(declare-fun m!262855 () Bool)

(assert (=> b!244969 m!262855))

(declare-fun m!262857 () Bool)

(assert (=> b!244973 m!262857))

(declare-fun m!262859 () Bool)

(assert (=> b!244983 m!262859))

(declare-fun m!262861 () Bool)

(assert (=> b!244983 m!262861))

(declare-fun m!262863 () Bool)

(assert (=> b!244983 m!262863))

(assert (=> b!244983 m!262851))

(declare-fun m!262865 () Bool)

(assert (=> b!244975 m!262865))

(assert (=> b!244975 m!262865))

(declare-fun m!262867 () Bool)

(assert (=> b!244975 m!262867))

(declare-fun m!262869 () Bool)

(assert (=> b!244984 m!262869))

(declare-fun m!262871 () Bool)

(assert (=> b!244984 m!262871))

(declare-fun m!262873 () Bool)

(assert (=> b!244972 m!262873))

(declare-fun m!262875 () Bool)

(assert (=> b!244974 m!262875))

(declare-fun m!262877 () Bool)

(assert (=> b!244979 m!262877))

(declare-fun m!262879 () Bool)

(assert (=> b!244965 m!262879))

(declare-fun m!262881 () Bool)

(assert (=> b!244965 m!262881))

(assert (=> b!244965 m!262881))

(declare-fun m!262883 () Bool)

(assert (=> b!244965 m!262883))

(declare-fun m!262885 () Bool)

(assert (=> b!244970 m!262885))

(check-sat b_and!13547 tp_is_empty!6409 (not bm!22829) (not b!244984) (not b!244979) (not b!244969) (not b!244974) (not start!23298) (not mapNonEmpty!10870) (not b!244983) (not b!244972) (not b_next!6547) (not b!244965) (not bm!22830) (not b!244975) (not b!244970))
(check-sat b_and!13547 (not b_next!6547))
(get-model)

(declare-fun bm!22847 () Bool)

(declare-fun lt!122776 () SeekEntryResult!1052)

(declare-fun call!22851 () Bool)

(declare-fun c!40918 () Bool)

(assert (=> bm!22847 (= call!22851 (inRange!0 (ite c!40918 (index!6378 lt!122776) (index!6381 lt!122776)) (mask!10637 thiss!1504)))))

(declare-fun b!245139 () Bool)

(declare-fun e!159033 () Bool)

(declare-fun e!159034 () Bool)

(assert (=> b!245139 (= e!159033 e!159034)))

(declare-fun c!40917 () Bool)

(assert (=> b!245139 (= c!40917 ((_ is MissingVacant!1052) lt!122776))))

(declare-fun b!245140 () Bool)

(declare-fun e!159031 () Bool)

(declare-fun call!22850 () Bool)

(assert (=> b!245140 (= e!159031 (not call!22850))))

(declare-fun d!60221 () Bool)

(assert (=> d!60221 e!159033))

(assert (=> d!60221 (= c!40918 ((_ is MissingZero!1052) lt!122776))))

(assert (=> d!60221 (= lt!122776 (seekEntryOrOpen!0 key!932 (_keys!6645 thiss!1504) (mask!10637 thiss!1504)))))

(declare-fun lt!122775 () Unit!7545)

(declare-fun choose!1150 (array!12113 array!12111 (_ BitVec 32) (_ BitVec 32) V!8193 V!8193 (_ BitVec 64) Int) Unit!7545)

(assert (=> d!60221 (= lt!122775 (choose!1150 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) key!932 (defaultEntry!4532 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!60221 (validMask!0 (mask!10637 thiss!1504))))

(assert (=> d!60221 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!361 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) key!932 (defaultEntry!4532 thiss!1504)) lt!122775)))

(declare-fun b!245141 () Bool)

(assert (=> b!245141 (= e!159034 ((_ is Undefined!1052) lt!122776))))

(declare-fun b!245142 () Bool)

(declare-fun e!159032 () Bool)

(assert (=> b!245142 (= e!159033 e!159032)))

(declare-fun res!120260 () Bool)

(assert (=> b!245142 (= res!120260 call!22851)))

(assert (=> b!245142 (=> (not res!120260) (not e!159032))))

(declare-fun b!245143 () Bool)

(declare-fun res!120258 () Bool)

(assert (=> b!245143 (=> (not res!120258) (not e!159031))))

(assert (=> b!245143 (= res!120258 call!22851)))

(assert (=> b!245143 (= e!159034 e!159031)))

(declare-fun b!245144 () Bool)

(assert (=> b!245144 (and (bvsge (index!6378 lt!122776) #b00000000000000000000000000000000) (bvslt (index!6378 lt!122776) (size!6092 (_keys!6645 thiss!1504))))))

(declare-fun res!120261 () Bool)

(assert (=> b!245144 (= res!120261 (= (select (arr!5750 (_keys!6645 thiss!1504)) (index!6378 lt!122776)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245144 (=> (not res!120261) (not e!159032))))

(declare-fun b!245145 () Bool)

(assert (=> b!245145 (= e!159032 (not call!22850))))

(declare-fun bm!22848 () Bool)

(assert (=> bm!22848 (= call!22850 (arrayContainsKey!0 (_keys!6645 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!245146 () Bool)

(declare-fun res!120259 () Bool)

(assert (=> b!245146 (=> (not res!120259) (not e!159031))))

(assert (=> b!245146 (= res!120259 (= (select (arr!5750 (_keys!6645 thiss!1504)) (index!6381 lt!122776)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245146 (and (bvsge (index!6381 lt!122776) #b00000000000000000000000000000000) (bvslt (index!6381 lt!122776) (size!6092 (_keys!6645 thiss!1504))))))

(assert (= (and d!60221 c!40918) b!245142))

(assert (= (and d!60221 (not c!40918)) b!245139))

(assert (= (and b!245142 res!120260) b!245144))

(assert (= (and b!245144 res!120261) b!245145))

(assert (= (and b!245139 c!40917) b!245143))

(assert (= (and b!245139 (not c!40917)) b!245141))

(assert (= (and b!245143 res!120258) b!245146))

(assert (= (and b!245146 res!120259) b!245140))

(assert (= (or b!245142 b!245143) bm!22847))

(assert (= (or b!245145 b!245140) bm!22848))

(assert (=> bm!22848 m!262851))

(declare-fun m!262971 () Bool)

(assert (=> b!245146 m!262971))

(assert (=> d!60221 m!262875))

(declare-fun m!262973 () Bool)

(assert (=> d!60221 m!262973))

(declare-fun m!262975 () Bool)

(assert (=> d!60221 m!262975))

(declare-fun m!262977 () Bool)

(assert (=> bm!22847 m!262977))

(declare-fun m!262979 () Bool)

(assert (=> b!245144 m!262979))

(assert (=> b!244979 d!60221))

(declare-fun d!60223 () Bool)

(declare-fun e!159037 () Bool)

(assert (=> d!60223 e!159037))

(declare-fun res!120266 () Bool)

(assert (=> d!60223 (=> (not res!120266) (not e!159037))))

(declare-fun lt!122782 () SeekEntryResult!1052)

(assert (=> d!60223 (= res!120266 ((_ is Found!1052) lt!122782))))

(assert (=> d!60223 (= lt!122782 (seekEntryOrOpen!0 key!932 (_keys!6645 thiss!1504) (mask!10637 thiss!1504)))))

(declare-fun lt!122781 () Unit!7545)

(declare-fun choose!1151 (array!12113 array!12111 (_ BitVec 32) (_ BitVec 32) V!8193 V!8193 (_ BitVec 64) Int) Unit!7545)

(assert (=> d!60223 (= lt!122781 (choose!1151 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) key!932 (defaultEntry!4532 thiss!1504)))))

(assert (=> d!60223 (validMask!0 (mask!10637 thiss!1504))))

(assert (=> d!60223 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!368 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) key!932 (defaultEntry!4532 thiss!1504)) lt!122781)))

(declare-fun b!245151 () Bool)

(declare-fun res!120267 () Bool)

(assert (=> b!245151 (=> (not res!120267) (not e!159037))))

(assert (=> b!245151 (= res!120267 (inRange!0 (index!6379 lt!122782) (mask!10637 thiss!1504)))))

(declare-fun b!245152 () Bool)

(assert (=> b!245152 (= e!159037 (= (select (arr!5750 (_keys!6645 thiss!1504)) (index!6379 lt!122782)) key!932))))

(assert (=> b!245152 (and (bvsge (index!6379 lt!122782) #b00000000000000000000000000000000) (bvslt (index!6379 lt!122782) (size!6092 (_keys!6645 thiss!1504))))))

(assert (= (and d!60223 res!120266) b!245151))

(assert (= (and b!245151 res!120267) b!245152))

(assert (=> d!60223 m!262875))

(declare-fun m!262981 () Bool)

(assert (=> d!60223 m!262981))

(assert (=> d!60223 m!262975))

(declare-fun m!262983 () Bool)

(assert (=> b!245151 m!262983))

(declare-fun m!262985 () Bool)

(assert (=> b!245152 m!262985))

(assert (=> b!244972 d!60223))

(declare-fun b!245163 () Bool)

(declare-fun e!159049 () Bool)

(declare-fun e!159046 () Bool)

(assert (=> b!245163 (= e!159049 e!159046)))

(declare-fun res!120276 () Bool)

(assert (=> b!245163 (=> (not res!120276) (not e!159046))))

(declare-fun e!159047 () Bool)

(assert (=> b!245163 (= res!120276 (not e!159047))))

(declare-fun res!120275 () Bool)

(assert (=> b!245163 (=> (not res!120275) (not e!159047))))

(assert (=> b!245163 (= res!120275 (validKeyInArray!0 (select (arr!5750 (array!12114 (store (arr!5750 (_keys!6645 thiss!1504)) index!297 key!932) (size!6092 (_keys!6645 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!245165 () Bool)

(declare-fun e!159048 () Bool)

(declare-fun call!22854 () Bool)

(assert (=> b!245165 (= e!159048 call!22854)))

(declare-fun b!245166 () Bool)

(assert (=> b!245166 (= e!159048 call!22854)))

(declare-fun b!245167 () Bool)

(declare-fun contains!1755 (List!3590 (_ BitVec 64)) Bool)

(assert (=> b!245167 (= e!159047 (contains!1755 Nil!3587 (select (arr!5750 (array!12114 (store (arr!5750 (_keys!6645 thiss!1504)) index!297 key!932) (size!6092 (_keys!6645 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun bm!22851 () Bool)

(declare-fun c!40921 () Bool)

(assert (=> bm!22851 (= call!22854 (arrayNoDuplicates!0 (array!12114 (store (arr!5750 (_keys!6645 thiss!1504)) index!297 key!932) (size!6092 (_keys!6645 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!40921 (Cons!3586 (select (arr!5750 (array!12114 (store (arr!5750 (_keys!6645 thiss!1504)) index!297 key!932) (size!6092 (_keys!6645 thiss!1504)))) #b00000000000000000000000000000000) Nil!3587) Nil!3587)))))

(declare-fun d!60225 () Bool)

(declare-fun res!120274 () Bool)

(assert (=> d!60225 (=> res!120274 e!159049)))

(assert (=> d!60225 (= res!120274 (bvsge #b00000000000000000000000000000000 (size!6092 (array!12114 (store (arr!5750 (_keys!6645 thiss!1504)) index!297 key!932) (size!6092 (_keys!6645 thiss!1504))))))))

(assert (=> d!60225 (= (arrayNoDuplicates!0 (array!12114 (store (arr!5750 (_keys!6645 thiss!1504)) index!297 key!932) (size!6092 (_keys!6645 thiss!1504))) #b00000000000000000000000000000000 Nil!3587) e!159049)))

(declare-fun b!245164 () Bool)

(assert (=> b!245164 (= e!159046 e!159048)))

(assert (=> b!245164 (= c!40921 (validKeyInArray!0 (select (arr!5750 (array!12114 (store (arr!5750 (_keys!6645 thiss!1504)) index!297 key!932) (size!6092 (_keys!6645 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!60225 (not res!120274)) b!245163))

(assert (= (and b!245163 res!120275) b!245167))

(assert (= (and b!245163 res!120276) b!245164))

(assert (= (and b!245164 c!40921) b!245165))

(assert (= (and b!245164 (not c!40921)) b!245166))

(assert (= (or b!245165 b!245166) bm!22851))

(declare-fun m!262987 () Bool)

(assert (=> b!245163 m!262987))

(assert (=> b!245163 m!262987))

(declare-fun m!262989 () Bool)

(assert (=> b!245163 m!262989))

(assert (=> b!245167 m!262987))

(assert (=> b!245167 m!262987))

(declare-fun m!262991 () Bool)

(assert (=> b!245167 m!262991))

(assert (=> bm!22851 m!262987))

(declare-fun m!262993 () Bool)

(assert (=> bm!22851 m!262993))

(assert (=> b!245164 m!262987))

(assert (=> b!245164 m!262987))

(assert (=> b!245164 m!262989))

(assert (=> b!244983 d!60225))

(declare-fun d!60227 () Bool)

(declare-fun e!159052 () Bool)

(assert (=> d!60227 e!159052))

(declare-fun res!120279 () Bool)

(assert (=> d!60227 (=> (not res!120279) (not e!159052))))

(assert (=> d!60227 (= res!120279 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6092 (_keys!6645 thiss!1504)))))))

(declare-fun lt!122785 () Unit!7545)

(declare-fun choose!41 (array!12113 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3590) Unit!7545)

(assert (=> d!60227 (= lt!122785 (choose!41 (_keys!6645 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3587))))

(assert (=> d!60227 (bvslt (size!6092 (_keys!6645 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60227 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6645 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3587) lt!122785)))

(declare-fun b!245170 () Bool)

(assert (=> b!245170 (= e!159052 (arrayNoDuplicates!0 (array!12114 (store (arr!5750 (_keys!6645 thiss!1504)) index!297 key!932) (size!6092 (_keys!6645 thiss!1504))) #b00000000000000000000000000000000 Nil!3587))))

(assert (= (and d!60227 res!120279) b!245170))

(declare-fun m!262995 () Bool)

(assert (=> d!60227 m!262995))

(assert (=> b!245170 m!262859))

(assert (=> b!245170 m!262861))

(assert (=> b!244983 d!60227))

(declare-fun d!60229 () Bool)

(declare-fun res!120284 () Bool)

(declare-fun e!159057 () Bool)

(assert (=> d!60229 (=> res!120284 e!159057)))

(assert (=> d!60229 (= res!120284 (= (select (arr!5750 (_keys!6645 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60229 (= (arrayContainsKey!0 (_keys!6645 thiss!1504) key!932 #b00000000000000000000000000000000) e!159057)))

(declare-fun b!245175 () Bool)

(declare-fun e!159058 () Bool)

(assert (=> b!245175 (= e!159057 e!159058)))

(declare-fun res!120285 () Bool)

(assert (=> b!245175 (=> (not res!120285) (not e!159058))))

(assert (=> b!245175 (= res!120285 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6092 (_keys!6645 thiss!1504))))))

(declare-fun b!245176 () Bool)

(assert (=> b!245176 (= e!159058 (arrayContainsKey!0 (_keys!6645 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60229 (not res!120284)) b!245175))

(assert (= (and b!245175 res!120285) b!245176))

(declare-fun m!262997 () Bool)

(assert (=> d!60229 m!262997))

(declare-fun m!262999 () Bool)

(assert (=> b!245176 m!262999))

(assert (=> b!244983 d!60229))

(declare-fun b!245189 () Bool)

(declare-fun c!40928 () Bool)

(declare-fun lt!122792 () (_ BitVec 64))

(assert (=> b!245189 (= c!40928 (= lt!122792 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!159066 () SeekEntryResult!1052)

(declare-fun e!159067 () SeekEntryResult!1052)

(assert (=> b!245189 (= e!159066 e!159067)))

(declare-fun b!245190 () Bool)

(declare-fun e!159065 () SeekEntryResult!1052)

(assert (=> b!245190 (= e!159065 e!159066)))

(declare-fun lt!122794 () SeekEntryResult!1052)

(assert (=> b!245190 (= lt!122792 (select (arr!5750 (_keys!6645 thiss!1504)) (index!6380 lt!122794)))))

(declare-fun c!40929 () Bool)

(assert (=> b!245190 (= c!40929 (= lt!122792 key!932))))

(declare-fun b!245191 () Bool)

(assert (=> b!245191 (= e!159067 (MissingZero!1052 (index!6380 lt!122794)))))

(declare-fun d!60231 () Bool)

(declare-fun lt!122793 () SeekEntryResult!1052)

(assert (=> d!60231 (and (or ((_ is Undefined!1052) lt!122793) (not ((_ is Found!1052) lt!122793)) (and (bvsge (index!6379 lt!122793) #b00000000000000000000000000000000) (bvslt (index!6379 lt!122793) (size!6092 (_keys!6645 thiss!1504))))) (or ((_ is Undefined!1052) lt!122793) ((_ is Found!1052) lt!122793) (not ((_ is MissingZero!1052) lt!122793)) (and (bvsge (index!6378 lt!122793) #b00000000000000000000000000000000) (bvslt (index!6378 lt!122793) (size!6092 (_keys!6645 thiss!1504))))) (or ((_ is Undefined!1052) lt!122793) ((_ is Found!1052) lt!122793) ((_ is MissingZero!1052) lt!122793) (not ((_ is MissingVacant!1052) lt!122793)) (and (bvsge (index!6381 lt!122793) #b00000000000000000000000000000000) (bvslt (index!6381 lt!122793) (size!6092 (_keys!6645 thiss!1504))))) (or ((_ is Undefined!1052) lt!122793) (ite ((_ is Found!1052) lt!122793) (= (select (arr!5750 (_keys!6645 thiss!1504)) (index!6379 lt!122793)) key!932) (ite ((_ is MissingZero!1052) lt!122793) (= (select (arr!5750 (_keys!6645 thiss!1504)) (index!6378 lt!122793)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1052) lt!122793) (= (select (arr!5750 (_keys!6645 thiss!1504)) (index!6381 lt!122793)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60231 (= lt!122793 e!159065)))

(declare-fun c!40930 () Bool)

(assert (=> d!60231 (= c!40930 (and ((_ is Intermediate!1052) lt!122794) (undefined!1864 lt!122794)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12113 (_ BitVec 32)) SeekEntryResult!1052)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60231 (= lt!122794 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10637 thiss!1504)) key!932 (_keys!6645 thiss!1504) (mask!10637 thiss!1504)))))

(assert (=> d!60231 (validMask!0 (mask!10637 thiss!1504))))

(assert (=> d!60231 (= (seekEntryOrOpen!0 key!932 (_keys!6645 thiss!1504) (mask!10637 thiss!1504)) lt!122793)))

(declare-fun b!245192 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12113 (_ BitVec 32)) SeekEntryResult!1052)

(assert (=> b!245192 (= e!159067 (seekKeyOrZeroReturnVacant!0 (x!24364 lt!122794) (index!6380 lt!122794) (index!6380 lt!122794) key!932 (_keys!6645 thiss!1504) (mask!10637 thiss!1504)))))

(declare-fun b!245193 () Bool)

(assert (=> b!245193 (= e!159065 Undefined!1052)))

(declare-fun b!245194 () Bool)

(assert (=> b!245194 (= e!159066 (Found!1052 (index!6380 lt!122794)))))

(assert (= (and d!60231 c!40930) b!245193))

(assert (= (and d!60231 (not c!40930)) b!245190))

(assert (= (and b!245190 c!40929) b!245194))

(assert (= (and b!245190 (not c!40929)) b!245189))

(assert (= (and b!245189 c!40928) b!245191))

(assert (= (and b!245189 (not c!40928)) b!245192))

(declare-fun m!263001 () Bool)

(assert (=> b!245190 m!263001))

(declare-fun m!263003 () Bool)

(assert (=> d!60231 m!263003))

(declare-fun m!263005 () Bool)

(assert (=> d!60231 m!263005))

(assert (=> d!60231 m!262975))

(assert (=> d!60231 m!263003))

(declare-fun m!263007 () Bool)

(assert (=> d!60231 m!263007))

(declare-fun m!263009 () Bool)

(assert (=> d!60231 m!263009))

(declare-fun m!263011 () Bool)

(assert (=> d!60231 m!263011))

(declare-fun m!263013 () Bool)

(assert (=> b!245192 m!263013))

(assert (=> b!244974 d!60231))

(declare-fun d!60233 () Bool)

(assert (=> d!60233 (= (inRange!0 index!297 (mask!10637 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10637 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!244965 d!60233))

(declare-fun d!60235 () Bool)

(declare-fun e!159072 () Bool)

(assert (=> d!60235 e!159072))

(declare-fun res!120288 () Bool)

(assert (=> d!60235 (=> res!120288 e!159072)))

(declare-fun lt!122804 () Bool)

(assert (=> d!60235 (= res!120288 (not lt!122804))))

(declare-fun lt!122805 () Bool)

(assert (=> d!60235 (= lt!122804 lt!122805)))

(declare-fun lt!122806 () Unit!7545)

(declare-fun e!159073 () Unit!7545)

(assert (=> d!60235 (= lt!122806 e!159073)))

(declare-fun c!40933 () Bool)

(assert (=> d!60235 (= c!40933 lt!122805)))

(declare-fun containsKey!279 (List!3589 (_ BitVec 64)) Bool)

(assert (=> d!60235 (= lt!122805 (containsKey!279 (toList!1830 (getCurrentListMap!1362 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504))) key!932))))

(assert (=> d!60235 (= (contains!1753 (getCurrentListMap!1362 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)) key!932) lt!122804)))

(declare-fun b!245201 () Bool)

(declare-fun lt!122803 () Unit!7545)

(assert (=> b!245201 (= e!159073 lt!122803)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!227 (List!3589 (_ BitVec 64)) Unit!7545)

(assert (=> b!245201 (= lt!122803 (lemmaContainsKeyImpliesGetValueByKeyDefined!227 (toList!1830 (getCurrentListMap!1362 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504))) key!932))))

(declare-datatypes ((Option!294 0))(
  ( (Some!293 (v!5304 V!8193)) (None!292) )
))
(declare-fun isDefined!228 (Option!294) Bool)

(declare-fun getValueByKey!288 (List!3589 (_ BitVec 64)) Option!294)

(assert (=> b!245201 (isDefined!228 (getValueByKey!288 (toList!1830 (getCurrentListMap!1362 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504))) key!932))))

(declare-fun b!245202 () Bool)

(declare-fun Unit!7559 () Unit!7545)

(assert (=> b!245202 (= e!159073 Unit!7559)))

(declare-fun b!245203 () Bool)

(assert (=> b!245203 (= e!159072 (isDefined!228 (getValueByKey!288 (toList!1830 (getCurrentListMap!1362 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504))) key!932)))))

(assert (= (and d!60235 c!40933) b!245201))

(assert (= (and d!60235 (not c!40933)) b!245202))

(assert (= (and d!60235 (not res!120288)) b!245203))

(declare-fun m!263015 () Bool)

(assert (=> d!60235 m!263015))

(declare-fun m!263017 () Bool)

(assert (=> b!245201 m!263017))

(declare-fun m!263019 () Bool)

(assert (=> b!245201 m!263019))

(assert (=> b!245201 m!263019))

(declare-fun m!263021 () Bool)

(assert (=> b!245201 m!263021))

(assert (=> b!245203 m!263019))

(assert (=> b!245203 m!263019))

(assert (=> b!245203 m!263021))

(assert (=> b!244965 d!60235))

(declare-fun bm!22866 () Bool)

(declare-fun call!22875 () ListLongMap!3629)

(declare-fun call!22871 () ListLongMap!3629)

(assert (=> bm!22866 (= call!22875 call!22871)))

(declare-fun bm!22867 () Bool)

(declare-fun call!22870 () ListLongMap!3629)

(declare-fun call!22874 () ListLongMap!3629)

(assert (=> bm!22867 (= call!22870 call!22874)))

(declare-fun b!245246 () Bool)

(declare-fun c!40950 () Bool)

(assert (=> b!245246 (= c!40950 (and (not (= (bvand (extraKeys!4269 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4269 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!159104 () ListLongMap!3629)

(declare-fun e!159106 () ListLongMap!3629)

(assert (=> b!245246 (= e!159104 e!159106)))

(declare-fun b!245247 () Bool)

(declare-fun e!159111 () Bool)

(declare-fun lt!122865 () ListLongMap!3629)

(declare-fun apply!229 (ListLongMap!3629 (_ BitVec 64)) V!8193)

(assert (=> b!245247 (= e!159111 (= (apply!229 lt!122865 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4373 thiss!1504)))))

(declare-fun b!245248 () Bool)

(declare-fun e!159103 () Bool)

(declare-fun call!22873 () Bool)

(assert (=> b!245248 (= e!159103 (not call!22873))))

(declare-fun b!245249 () Bool)

(declare-fun res!120311 () Bool)

(declare-fun e!159109 () Bool)

(assert (=> b!245249 (=> (not res!120311) (not e!159109))))

(declare-fun e!159105 () Bool)

(assert (=> b!245249 (= res!120311 e!159105)))

(declare-fun res!120314 () Bool)

(assert (=> b!245249 (=> res!120314 e!159105)))

(declare-fun e!159101 () Bool)

(assert (=> b!245249 (= res!120314 (not e!159101))))

(declare-fun res!120307 () Bool)

(assert (=> b!245249 (=> (not res!120307) (not e!159101))))

(assert (=> b!245249 (= res!120307 (bvslt #b00000000000000000000000000000000 (size!6092 (_keys!6645 thiss!1504))))))

(declare-fun b!245250 () Bool)

(declare-fun e!159112 () Bool)

(assert (=> b!245250 (= e!159112 (validKeyInArray!0 (select (arr!5750 (_keys!6645 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!245251 () Bool)

(declare-fun e!159110 () ListLongMap!3629)

(assert (=> b!245251 (= e!159110 e!159104)))

(declare-fun c!40948 () Bool)

(assert (=> b!245251 (= c!40948 (and (not (= (bvand (extraKeys!4269 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4269 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22868 () Bool)

(declare-fun call!22869 () ListLongMap!3629)

(assert (=> bm!22868 (= call!22871 call!22869)))

(declare-fun b!245252 () Bool)

(declare-fun e!159102 () Bool)

(assert (=> b!245252 (= e!159109 e!159102)))

(declare-fun c!40951 () Bool)

(assert (=> b!245252 (= c!40951 (not (= (bvand (extraKeys!4269 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!245253 () Bool)

(declare-fun res!120310 () Bool)

(assert (=> b!245253 (=> (not res!120310) (not e!159109))))

(assert (=> b!245253 (= res!120310 e!159103)))

(declare-fun c!40946 () Bool)

(assert (=> b!245253 (= c!40946 (not (= (bvand (extraKeys!4269 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!245254 () Bool)

(declare-fun e!159108 () Bool)

(assert (=> b!245254 (= e!159105 e!159108)))

(declare-fun res!120313 () Bool)

(assert (=> b!245254 (=> (not res!120313) (not e!159108))))

(assert (=> b!245254 (= res!120313 (contains!1753 lt!122865 (select (arr!5750 (_keys!6645 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!245254 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6092 (_keys!6645 thiss!1504))))))

(declare-fun b!245255 () Bool)

(assert (=> b!245255 (= e!159104 call!22870)))

(declare-fun b!245256 () Bool)

(assert (=> b!245256 (= e!159101 (validKeyInArray!0 (select (arr!5750 (_keys!6645 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!60237 () Bool)

(assert (=> d!60237 e!159109))

(declare-fun res!120309 () Bool)

(assert (=> d!60237 (=> (not res!120309) (not e!159109))))

(assert (=> d!60237 (= res!120309 (or (bvsge #b00000000000000000000000000000000 (size!6092 (_keys!6645 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6092 (_keys!6645 thiss!1504))))))))

(declare-fun lt!122858 () ListLongMap!3629)

(assert (=> d!60237 (= lt!122865 lt!122858)))

(declare-fun lt!122859 () Unit!7545)

(declare-fun e!159107 () Unit!7545)

(assert (=> d!60237 (= lt!122859 e!159107)))

(declare-fun c!40947 () Bool)

(assert (=> d!60237 (= c!40947 e!159112)))

(declare-fun res!120308 () Bool)

(assert (=> d!60237 (=> (not res!120308) (not e!159112))))

(assert (=> d!60237 (= res!120308 (bvslt #b00000000000000000000000000000000 (size!6092 (_keys!6645 thiss!1504))))))

(assert (=> d!60237 (= lt!122858 e!159110)))

(declare-fun c!40949 () Bool)

(assert (=> d!60237 (= c!40949 (and (not (= (bvand (extraKeys!4269 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4269 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60237 (validMask!0 (mask!10637 thiss!1504))))

(assert (=> d!60237 (= (getCurrentListMap!1362 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)) lt!122865)))

(declare-fun bm!22869 () Bool)

(declare-fun +!656 (ListLongMap!3629 tuple2!4714) ListLongMap!3629)

(assert (=> bm!22869 (= call!22874 (+!656 (ite c!40949 call!22869 (ite c!40948 call!22871 call!22875)) (ite (or c!40949 c!40948) (tuple2!4715 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4373 thiss!1504)) (tuple2!4715 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4373 thiss!1504)))))))

(declare-fun b!245257 () Bool)

(declare-fun lt!122855 () Unit!7545)

(assert (=> b!245257 (= e!159107 lt!122855)))

(declare-fun lt!122871 () ListLongMap!3629)

(declare-fun getCurrentListMapNoExtraKeys!545 (array!12113 array!12111 (_ BitVec 32) (_ BitVec 32) V!8193 V!8193 (_ BitVec 32) Int) ListLongMap!3629)

(assert (=> b!245257 (= lt!122871 (getCurrentListMapNoExtraKeys!545 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)))))

(declare-fun lt!122872 () (_ BitVec 64))

(assert (=> b!245257 (= lt!122872 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122851 () (_ BitVec 64))

(assert (=> b!245257 (= lt!122851 (select (arr!5750 (_keys!6645 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122854 () Unit!7545)

(declare-fun addStillContains!205 (ListLongMap!3629 (_ BitVec 64) V!8193 (_ BitVec 64)) Unit!7545)

(assert (=> b!245257 (= lt!122854 (addStillContains!205 lt!122871 lt!122872 (zeroValue!4373 thiss!1504) lt!122851))))

(assert (=> b!245257 (contains!1753 (+!656 lt!122871 (tuple2!4715 lt!122872 (zeroValue!4373 thiss!1504))) lt!122851)))

(declare-fun lt!122868 () Unit!7545)

(assert (=> b!245257 (= lt!122868 lt!122854)))

(declare-fun lt!122864 () ListLongMap!3629)

(assert (=> b!245257 (= lt!122864 (getCurrentListMapNoExtraKeys!545 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)))))

(declare-fun lt!122857 () (_ BitVec 64))

(assert (=> b!245257 (= lt!122857 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122852 () (_ BitVec 64))

(assert (=> b!245257 (= lt!122852 (select (arr!5750 (_keys!6645 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122862 () Unit!7545)

(declare-fun addApplyDifferent!205 (ListLongMap!3629 (_ BitVec 64) V!8193 (_ BitVec 64)) Unit!7545)

(assert (=> b!245257 (= lt!122862 (addApplyDifferent!205 lt!122864 lt!122857 (minValue!4373 thiss!1504) lt!122852))))

(assert (=> b!245257 (= (apply!229 (+!656 lt!122864 (tuple2!4715 lt!122857 (minValue!4373 thiss!1504))) lt!122852) (apply!229 lt!122864 lt!122852))))

(declare-fun lt!122861 () Unit!7545)

(assert (=> b!245257 (= lt!122861 lt!122862)))

(declare-fun lt!122866 () ListLongMap!3629)

(assert (=> b!245257 (= lt!122866 (getCurrentListMapNoExtraKeys!545 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)))))

(declare-fun lt!122853 () (_ BitVec 64))

(assert (=> b!245257 (= lt!122853 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122869 () (_ BitVec 64))

(assert (=> b!245257 (= lt!122869 (select (arr!5750 (_keys!6645 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122856 () Unit!7545)

(assert (=> b!245257 (= lt!122856 (addApplyDifferent!205 lt!122866 lt!122853 (zeroValue!4373 thiss!1504) lt!122869))))

(assert (=> b!245257 (= (apply!229 (+!656 lt!122866 (tuple2!4715 lt!122853 (zeroValue!4373 thiss!1504))) lt!122869) (apply!229 lt!122866 lt!122869))))

(declare-fun lt!122863 () Unit!7545)

(assert (=> b!245257 (= lt!122863 lt!122856)))

(declare-fun lt!122870 () ListLongMap!3629)

(assert (=> b!245257 (= lt!122870 (getCurrentListMapNoExtraKeys!545 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)))))

(declare-fun lt!122867 () (_ BitVec 64))

(assert (=> b!245257 (= lt!122867 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122860 () (_ BitVec 64))

(assert (=> b!245257 (= lt!122860 (select (arr!5750 (_keys!6645 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!245257 (= lt!122855 (addApplyDifferent!205 lt!122870 lt!122867 (minValue!4373 thiss!1504) lt!122860))))

(assert (=> b!245257 (= (apply!229 (+!656 lt!122870 (tuple2!4715 lt!122867 (minValue!4373 thiss!1504))) lt!122860) (apply!229 lt!122870 lt!122860))))

(declare-fun b!245258 () Bool)

(assert (=> b!245258 (= e!159106 call!22875)))

(declare-fun b!245259 () Bool)

(declare-fun e!159100 () Bool)

(assert (=> b!245259 (= e!159103 e!159100)))

(declare-fun res!120315 () Bool)

(assert (=> b!245259 (= res!120315 call!22873)))

(assert (=> b!245259 (=> (not res!120315) (not e!159100))))

(declare-fun b!245260 () Bool)

(assert (=> b!245260 (= e!159106 call!22870)))

(declare-fun b!245261 () Bool)

(declare-fun call!22872 () Bool)

(assert (=> b!245261 (= e!159102 (not call!22872))))

(declare-fun bm!22870 () Bool)

(assert (=> bm!22870 (= call!22872 (contains!1753 lt!122865 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22871 () Bool)

(assert (=> bm!22871 (= call!22869 (getCurrentListMapNoExtraKeys!545 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)))))

(declare-fun b!245262 () Bool)

(declare-fun Unit!7560 () Unit!7545)

(assert (=> b!245262 (= e!159107 Unit!7560)))

(declare-fun b!245263 () Bool)

(assert (=> b!245263 (= e!159110 (+!656 call!22874 (tuple2!4715 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4373 thiss!1504))))))

(declare-fun bm!22872 () Bool)

(assert (=> bm!22872 (= call!22873 (contains!1753 lt!122865 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!245264 () Bool)

(assert (=> b!245264 (= e!159102 e!159111)))

(declare-fun res!120312 () Bool)

(assert (=> b!245264 (= res!120312 call!22872)))

(assert (=> b!245264 (=> (not res!120312) (not e!159111))))

(declare-fun b!245265 () Bool)

(declare-fun get!2957 (ValueCell!2861 V!8193) V!8193)

(declare-fun dynLambda!572 (Int (_ BitVec 64)) V!8193)

(assert (=> b!245265 (= e!159108 (= (apply!229 lt!122865 (select (arr!5750 (_keys!6645 thiss!1504)) #b00000000000000000000000000000000)) (get!2957 (select (arr!5749 (_values!4515 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!572 (defaultEntry!4532 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!245265 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6091 (_values!4515 thiss!1504))))))

(assert (=> b!245265 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6092 (_keys!6645 thiss!1504))))))

(declare-fun b!245266 () Bool)

(assert (=> b!245266 (= e!159100 (= (apply!229 lt!122865 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4373 thiss!1504)))))

(assert (= (and d!60237 c!40949) b!245263))

(assert (= (and d!60237 (not c!40949)) b!245251))

(assert (= (and b!245251 c!40948) b!245255))

(assert (= (and b!245251 (not c!40948)) b!245246))

(assert (= (and b!245246 c!40950) b!245260))

(assert (= (and b!245246 (not c!40950)) b!245258))

(assert (= (or b!245260 b!245258) bm!22866))

(assert (= (or b!245255 bm!22866) bm!22868))

(assert (= (or b!245255 b!245260) bm!22867))

(assert (= (or b!245263 bm!22868) bm!22871))

(assert (= (or b!245263 bm!22867) bm!22869))

(assert (= (and d!60237 res!120308) b!245250))

(assert (= (and d!60237 c!40947) b!245257))

(assert (= (and d!60237 (not c!40947)) b!245262))

(assert (= (and d!60237 res!120309) b!245249))

(assert (= (and b!245249 res!120307) b!245256))

(assert (= (and b!245249 (not res!120314)) b!245254))

(assert (= (and b!245254 res!120313) b!245265))

(assert (= (and b!245249 res!120311) b!245253))

(assert (= (and b!245253 c!40946) b!245259))

(assert (= (and b!245253 (not c!40946)) b!245248))

(assert (= (and b!245259 res!120315) b!245266))

(assert (= (or b!245259 b!245248) bm!22872))

(assert (= (and b!245253 res!120310) b!245252))

(assert (= (and b!245252 c!40951) b!245264))

(assert (= (and b!245252 (not c!40951)) b!245261))

(assert (= (and b!245264 res!120312) b!245247))

(assert (= (or b!245264 b!245261) bm!22870))

(declare-fun b_lambda!8041 () Bool)

(assert (=> (not b_lambda!8041) (not b!245265)))

(declare-fun t!8598 () Bool)

(declare-fun tb!2963 () Bool)

(assert (=> (and b!244984 (= (defaultEntry!4532 thiss!1504) (defaultEntry!4532 thiss!1504)) t!8598) tb!2963))

(declare-fun result!5227 () Bool)

(assert (=> tb!2963 (= result!5227 tp_is_empty!6409)))

(assert (=> b!245265 t!8598))

(declare-fun b_and!13553 () Bool)

(assert (= b_and!13547 (and (=> t!8598 result!5227) b_and!13553)))

(declare-fun m!263023 () Bool)

(assert (=> bm!22869 m!263023))

(declare-fun m!263025 () Bool)

(assert (=> bm!22871 m!263025))

(declare-fun m!263027 () Bool)

(assert (=> bm!22870 m!263027))

(assert (=> b!245256 m!262997))

(assert (=> b!245256 m!262997))

(declare-fun m!263029 () Bool)

(assert (=> b!245256 m!263029))

(assert (=> d!60237 m!262975))

(declare-fun m!263031 () Bool)

(assert (=> b!245265 m!263031))

(assert (=> b!245265 m!262997))

(declare-fun m!263033 () Bool)

(assert (=> b!245265 m!263033))

(assert (=> b!245265 m!262997))

(declare-fun m!263035 () Bool)

(assert (=> b!245265 m!263035))

(assert (=> b!245265 m!263033))

(assert (=> b!245265 m!263031))

(declare-fun m!263037 () Bool)

(assert (=> b!245265 m!263037))

(declare-fun m!263039 () Bool)

(assert (=> b!245257 m!263039))

(declare-fun m!263041 () Bool)

(assert (=> b!245257 m!263041))

(declare-fun m!263043 () Bool)

(assert (=> b!245257 m!263043))

(declare-fun m!263045 () Bool)

(assert (=> b!245257 m!263045))

(assert (=> b!245257 m!263025))

(assert (=> b!245257 m!263045))

(declare-fun m!263047 () Bool)

(assert (=> b!245257 m!263047))

(declare-fun m!263049 () Bool)

(assert (=> b!245257 m!263049))

(declare-fun m!263051 () Bool)

(assert (=> b!245257 m!263051))

(declare-fun m!263053 () Bool)

(assert (=> b!245257 m!263053))

(declare-fun m!263055 () Bool)

(assert (=> b!245257 m!263055))

(declare-fun m!263057 () Bool)

(assert (=> b!245257 m!263057))

(assert (=> b!245257 m!263049))

(declare-fun m!263059 () Bool)

(assert (=> b!245257 m!263059))

(declare-fun m!263061 () Bool)

(assert (=> b!245257 m!263061))

(assert (=> b!245257 m!263059))

(assert (=> b!245257 m!263041))

(declare-fun m!263063 () Bool)

(assert (=> b!245257 m!263063))

(declare-fun m!263065 () Bool)

(assert (=> b!245257 m!263065))

(assert (=> b!245257 m!262997))

(declare-fun m!263067 () Bool)

(assert (=> b!245257 m!263067))

(declare-fun m!263069 () Bool)

(assert (=> b!245263 m!263069))

(declare-fun m!263071 () Bool)

(assert (=> b!245266 m!263071))

(assert (=> b!245254 m!262997))

(assert (=> b!245254 m!262997))

(declare-fun m!263073 () Bool)

(assert (=> b!245254 m!263073))

(declare-fun m!263075 () Bool)

(assert (=> b!245247 m!263075))

(assert (=> b!245250 m!262997))

(assert (=> b!245250 m!262997))

(assert (=> b!245250 m!263029))

(declare-fun m!263077 () Bool)

(assert (=> bm!22872 m!263077))

(assert (=> b!244965 d!60237))

(declare-fun d!60239 () Bool)

(assert (=> d!60239 (= (array_inv!3783 (_keys!6645 thiss!1504)) (bvsge (size!6092 (_keys!6645 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!244984 d!60239))

(declare-fun d!60241 () Bool)

(assert (=> d!60241 (= (array_inv!3784 (_values!4515 thiss!1504)) (bvsge (size!6091 (_values!4515 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!244984 d!60241))

(declare-fun d!60243 () Bool)

(declare-fun res!120322 () Bool)

(declare-fun e!159115 () Bool)

(assert (=> d!60243 (=> (not res!120322) (not e!159115))))

(declare-fun simpleValid!252 (LongMapFixedSize!3622) Bool)

(assert (=> d!60243 (= res!120322 (simpleValid!252 thiss!1504))))

(assert (=> d!60243 (= (valid!1431 thiss!1504) e!159115)))

(declare-fun b!245275 () Bool)

(declare-fun res!120323 () Bool)

(assert (=> b!245275 (=> (not res!120323) (not e!159115))))

(declare-fun arrayCountValidKeys!0 (array!12113 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!245275 (= res!120323 (= (arrayCountValidKeys!0 (_keys!6645 thiss!1504) #b00000000000000000000000000000000 (size!6092 (_keys!6645 thiss!1504))) (_size!1860 thiss!1504)))))

(declare-fun b!245276 () Bool)

(declare-fun res!120324 () Bool)

(assert (=> b!245276 (=> (not res!120324) (not e!159115))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12113 (_ BitVec 32)) Bool)

(assert (=> b!245276 (= res!120324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6645 thiss!1504) (mask!10637 thiss!1504)))))

(declare-fun b!245277 () Bool)

(assert (=> b!245277 (= e!159115 (arrayNoDuplicates!0 (_keys!6645 thiss!1504) #b00000000000000000000000000000000 Nil!3587))))

(assert (= (and d!60243 res!120322) b!245275))

(assert (= (and b!245275 res!120323) b!245276))

(assert (= (and b!245276 res!120324) b!245277))

(declare-fun m!263079 () Bool)

(assert (=> d!60243 m!263079))

(declare-fun m!263081 () Bool)

(assert (=> b!245275 m!263081))

(declare-fun m!263083 () Bool)

(assert (=> b!245276 m!263083))

(declare-fun m!263085 () Bool)

(assert (=> b!245277 m!263085))

(assert (=> start!23298 d!60243))

(declare-fun d!60245 () Bool)

(assert (=> d!60245 (= (inRange!0 (ite c!40886 (index!6378 lt!122727) (index!6381 lt!122727)) (mask!10637 thiss!1504)) (and (bvsge (ite c!40886 (index!6378 lt!122727) (index!6381 lt!122727)) #b00000000000000000000000000000000) (bvslt (ite c!40886 (index!6378 lt!122727) (index!6381 lt!122727)) (bvadd (mask!10637 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22830 d!60245))

(declare-fun d!60247 () Bool)

(assert (=> d!60247 (= (validKeyInArray!0 (select (arr!5750 (_keys!6645 thiss!1504)) index!297)) (and (not (= (select (arr!5750 (_keys!6645 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5750 (_keys!6645 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!244975 d!60247))

(declare-fun d!60249 () Bool)

(assert (=> d!60249 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!244969 d!60249))

(declare-fun d!60251 () Bool)

(assert (=> d!60251 (contains!1753 (getCurrentListMap!1362 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)) key!932)))

(declare-fun lt!122875 () Unit!7545)

(declare-fun choose!1152 (array!12113 array!12111 (_ BitVec 32) (_ BitVec 32) V!8193 V!8193 (_ BitVec 64) (_ BitVec 32) Int) Unit!7545)

(assert (=> d!60251 (= lt!122875 (choose!1152 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)))))

(assert (=> d!60251 (validMask!0 (mask!10637 thiss!1504))))

(assert (=> d!60251 (= (lemmaArrayContainsKeyThenInListMap!186 (_keys!6645 thiss!1504) (_values!4515 thiss!1504) (mask!10637 thiss!1504) (extraKeys!4269 thiss!1504) (zeroValue!4373 thiss!1504) (minValue!4373 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4532 thiss!1504)) lt!122875)))

(declare-fun bs!8906 () Bool)

(assert (= bs!8906 d!60251))

(assert (=> bs!8906 m!262881))

(assert (=> bs!8906 m!262881))

(assert (=> bs!8906 m!262883))

(declare-fun m!263087 () Bool)

(assert (=> bs!8906 m!263087))

(assert (=> bs!8906 m!262975))

(assert (=> b!244970 d!60251))

(assert (=> bm!22829 d!60229))

(declare-fun mapNonEmpty!10879 () Bool)

(declare-fun mapRes!10879 () Bool)

(declare-fun tp!22885 () Bool)

(declare-fun e!159120 () Bool)

(assert (=> mapNonEmpty!10879 (= mapRes!10879 (and tp!22885 e!159120))))

(declare-fun mapKey!10879 () (_ BitVec 32))

(declare-fun mapValue!10879 () ValueCell!2861)

(declare-fun mapRest!10879 () (Array (_ BitVec 32) ValueCell!2861))

(assert (=> mapNonEmpty!10879 (= mapRest!10870 (store mapRest!10879 mapKey!10879 mapValue!10879))))

(declare-fun condMapEmpty!10879 () Bool)

(declare-fun mapDefault!10879 () ValueCell!2861)

(assert (=> mapNonEmpty!10870 (= condMapEmpty!10879 (= mapRest!10870 ((as const (Array (_ BitVec 32) ValueCell!2861)) mapDefault!10879)))))

(declare-fun e!159121 () Bool)

(assert (=> mapNonEmpty!10870 (= tp!22869 (and e!159121 mapRes!10879))))

(declare-fun mapIsEmpty!10879 () Bool)

(assert (=> mapIsEmpty!10879 mapRes!10879))

(declare-fun b!245284 () Bool)

(assert (=> b!245284 (= e!159120 tp_is_empty!6409)))

(declare-fun b!245285 () Bool)

(assert (=> b!245285 (= e!159121 tp_is_empty!6409)))

(assert (= (and mapNonEmpty!10870 condMapEmpty!10879) mapIsEmpty!10879))

(assert (= (and mapNonEmpty!10870 (not condMapEmpty!10879)) mapNonEmpty!10879))

(assert (= (and mapNonEmpty!10879 ((_ is ValueCellFull!2861) mapValue!10879)) b!245284))

(assert (= (and mapNonEmpty!10870 ((_ is ValueCellFull!2861) mapDefault!10879)) b!245285))

(declare-fun m!263089 () Bool)

(assert (=> mapNonEmpty!10879 m!263089))

(declare-fun b_lambda!8043 () Bool)

(assert (= b_lambda!8041 (or (and b!244984 b_free!6547) b_lambda!8043)))

(check-sat (not d!60243) (not b_lambda!8043) (not bm!22869) (not b!245276) (not b!245170) (not b!245167) (not d!60237) (not bm!22848) (not b!245277) (not b!245250) (not b!245203) (not bm!22871) (not d!60235) (not bm!22847) (not b!245256) b_and!13553 tp_is_empty!6409 (not b!245257) (not b_next!6547) (not b!245163) (not mapNonEmpty!10879) (not b!245201) (not d!60223) (not b!245254) (not bm!22872) (not bm!22870) (not b!245151) (not b!245275) (not b!245266) (not b!245247) (not b!245263) (not b!245265) (not bm!22851) (not b!245176) (not b!245164) (not b!245192) (not d!60221) (not d!60227) (not d!60231) (not d!60251))
(check-sat b_and!13553 (not b_next!6547))
