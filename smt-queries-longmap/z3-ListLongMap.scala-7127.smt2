; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90438 () Bool)

(assert start!90438)

(declare-fun b!1034948 () Bool)

(declare-fun b_free!20817 () Bool)

(declare-fun b_next!20817 () Bool)

(assert (=> b!1034948 (= b_free!20817 (not b_next!20817))))

(declare-fun tp!73564 () Bool)

(declare-fun b_and!33317 () Bool)

(assert (=> b!1034948 (= tp!73564 b_and!33317)))

(declare-fun b!1034942 () Bool)

(declare-fun e!585111 () Bool)

(declare-datatypes ((V!37589 0))(
  ( (V!37590 (val!12319 Int)) )
))
(declare-datatypes ((ValueCell!11565 0))(
  ( (ValueCellFull!11565 (v!14899 V!37589)) (EmptyCell!11565) )
))
(declare-datatypes ((array!65160 0))(
  ( (array!65161 (arr!31371 (Array (_ BitVec 32) (_ BitVec 64))) (size!31896 (_ BitVec 32))) )
))
(declare-datatypes ((array!65162 0))(
  ( (array!65163 (arr!31372 (Array (_ BitVec 32) ValueCell!11565)) (size!31897 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5724 0))(
  ( (LongMapFixedSize!5725 (defaultEntry!6240 Int) (mask!30110 (_ BitVec 32)) (extraKeys!5970 (_ BitVec 32)) (zeroValue!6074 V!37589) (minValue!6076 V!37589) (_size!2917 (_ BitVec 32)) (_keys!11424 array!65160) (_values!6263 array!65162) (_vacant!2917 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5724)

(assert (=> b!1034942 (= e!585111 (and (= (size!31897 (_values!6263 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30110 thiss!1427))) (not (= (size!31896 (_keys!11424 thiss!1427)) (size!31897 (_values!6263 thiss!1427))))))))

(declare-fun b!1034943 () Bool)

(declare-fun e!585115 () Bool)

(declare-fun tp_is_empty!24537 () Bool)

(assert (=> b!1034943 (= e!585115 tp_is_empty!24537)))

(declare-fun b!1034944 () Bool)

(declare-fun e!585112 () Bool)

(assert (=> b!1034944 (= e!585112 tp_is_empty!24537)))

(declare-fun b!1034945 () Bool)

(declare-fun res!691125 () Bool)

(assert (=> b!1034945 (=> (not res!691125) (not e!585111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034945 (= res!691125 (validMask!0 (mask!30110 thiss!1427)))))

(declare-fun b!1034946 () Bool)

(declare-fun res!691126 () Bool)

(assert (=> b!1034946 (=> (not res!691126) (not e!585111))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1034946 (= res!691126 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1034947 () Bool)

(declare-fun e!585113 () Bool)

(declare-fun mapRes!38301 () Bool)

(assert (=> b!1034947 (= e!585113 (and e!585115 mapRes!38301))))

(declare-fun condMapEmpty!38301 () Bool)

(declare-fun mapDefault!38301 () ValueCell!11565)

(assert (=> b!1034947 (= condMapEmpty!38301 (= (arr!31372 (_values!6263 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11565)) mapDefault!38301)))))

(declare-fun mapNonEmpty!38301 () Bool)

(declare-fun tp!73563 () Bool)

(assert (=> mapNonEmpty!38301 (= mapRes!38301 (and tp!73563 e!585112))))

(declare-fun mapRest!38301 () (Array (_ BitVec 32) ValueCell!11565))

(declare-fun mapKey!38301 () (_ BitVec 32))

(declare-fun mapValue!38301 () ValueCell!11565)

(assert (=> mapNonEmpty!38301 (= (arr!31372 (_values!6263 thiss!1427)) (store mapRest!38301 mapKey!38301 mapValue!38301))))

(declare-fun e!585114 () Bool)

(declare-fun array_inv!24267 (array!65160) Bool)

(declare-fun array_inv!24268 (array!65162) Bool)

(assert (=> b!1034948 (= e!585114 (and tp!73564 tp_is_empty!24537 (array_inv!24267 (_keys!11424 thiss!1427)) (array_inv!24268 (_values!6263 thiss!1427)) e!585113))))

(declare-fun res!691127 () Bool)

(assert (=> start!90438 (=> (not res!691127) (not e!585111))))

(declare-fun valid!2162 (LongMapFixedSize!5724) Bool)

(assert (=> start!90438 (= res!691127 (valid!2162 thiss!1427))))

(assert (=> start!90438 e!585111))

(assert (=> start!90438 e!585114))

(assert (=> start!90438 true))

(declare-fun mapIsEmpty!38301 () Bool)

(assert (=> mapIsEmpty!38301 mapRes!38301))

(assert (= (and start!90438 res!691127) b!1034946))

(assert (= (and b!1034946 res!691126) b!1034945))

(assert (= (and b!1034945 res!691125) b!1034942))

(assert (= (and b!1034947 condMapEmpty!38301) mapIsEmpty!38301))

(assert (= (and b!1034947 (not condMapEmpty!38301)) mapNonEmpty!38301))

(get-info :version)

(assert (= (and mapNonEmpty!38301 ((_ is ValueCellFull!11565) mapValue!38301)) b!1034944))

(assert (= (and b!1034947 ((_ is ValueCellFull!11565) mapDefault!38301)) b!1034943))

(assert (= b!1034948 b!1034947))

(assert (= start!90438 b!1034948))

(declare-fun m!955147 () Bool)

(assert (=> b!1034945 m!955147))

(declare-fun m!955149 () Bool)

(assert (=> mapNonEmpty!38301 m!955149))

(declare-fun m!955151 () Bool)

(assert (=> b!1034948 m!955151))

(declare-fun m!955153 () Bool)

(assert (=> b!1034948 m!955153))

(declare-fun m!955155 () Bool)

(assert (=> start!90438 m!955155))

(check-sat (not b!1034948) (not b_next!20817) (not b!1034945) b_and!33317 tp_is_empty!24537 (not mapNonEmpty!38301) (not start!90438))
(check-sat b_and!33317 (not b_next!20817))
(get-model)

(declare-fun d!124461 () Bool)

(assert (=> d!124461 (= (validMask!0 (mask!30110 thiss!1427)) (and (or (= (mask!30110 thiss!1427) #b00000000000000000000000000000111) (= (mask!30110 thiss!1427) #b00000000000000000000000000001111) (= (mask!30110 thiss!1427) #b00000000000000000000000000011111) (= (mask!30110 thiss!1427) #b00000000000000000000000000111111) (= (mask!30110 thiss!1427) #b00000000000000000000000001111111) (= (mask!30110 thiss!1427) #b00000000000000000000000011111111) (= (mask!30110 thiss!1427) #b00000000000000000000000111111111) (= (mask!30110 thiss!1427) #b00000000000000000000001111111111) (= (mask!30110 thiss!1427) #b00000000000000000000011111111111) (= (mask!30110 thiss!1427) #b00000000000000000000111111111111) (= (mask!30110 thiss!1427) #b00000000000000000001111111111111) (= (mask!30110 thiss!1427) #b00000000000000000011111111111111) (= (mask!30110 thiss!1427) #b00000000000000000111111111111111) (= (mask!30110 thiss!1427) #b00000000000000001111111111111111) (= (mask!30110 thiss!1427) #b00000000000000011111111111111111) (= (mask!30110 thiss!1427) #b00000000000000111111111111111111) (= (mask!30110 thiss!1427) #b00000000000001111111111111111111) (= (mask!30110 thiss!1427) #b00000000000011111111111111111111) (= (mask!30110 thiss!1427) #b00000000000111111111111111111111) (= (mask!30110 thiss!1427) #b00000000001111111111111111111111) (= (mask!30110 thiss!1427) #b00000000011111111111111111111111) (= (mask!30110 thiss!1427) #b00000000111111111111111111111111) (= (mask!30110 thiss!1427) #b00000001111111111111111111111111) (= (mask!30110 thiss!1427) #b00000011111111111111111111111111) (= (mask!30110 thiss!1427) #b00000111111111111111111111111111) (= (mask!30110 thiss!1427) #b00001111111111111111111111111111) (= (mask!30110 thiss!1427) #b00011111111111111111111111111111) (= (mask!30110 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30110 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1034945 d!124461))

(declare-fun d!124463 () Bool)

(declare-fun res!691143 () Bool)

(declare-fun e!585136 () Bool)

(assert (=> d!124463 (=> (not res!691143) (not e!585136))))

(declare-fun simpleValid!408 (LongMapFixedSize!5724) Bool)

(assert (=> d!124463 (= res!691143 (simpleValid!408 thiss!1427))))

(assert (=> d!124463 (= (valid!2162 thiss!1427) e!585136)))

(declare-fun b!1034976 () Bool)

(declare-fun res!691144 () Bool)

(assert (=> b!1034976 (=> (not res!691144) (not e!585136))))

(declare-fun arrayCountValidKeys!0 (array!65160 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1034976 (= res!691144 (= (arrayCountValidKeys!0 (_keys!11424 thiss!1427) #b00000000000000000000000000000000 (size!31896 (_keys!11424 thiss!1427))) (_size!2917 thiss!1427)))))

(declare-fun b!1034977 () Bool)

(declare-fun res!691145 () Bool)

(assert (=> b!1034977 (=> (not res!691145) (not e!585136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65160 (_ BitVec 32)) Bool)

(assert (=> b!1034977 (= res!691145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11424 thiss!1427) (mask!30110 thiss!1427)))))

(declare-fun b!1034978 () Bool)

(declare-datatypes ((List!21910 0))(
  ( (Nil!21907) (Cons!21906 (h!23108 (_ BitVec 64)) (t!31113 List!21910)) )
))
(declare-fun arrayNoDuplicates!0 (array!65160 (_ BitVec 32) List!21910) Bool)

(assert (=> b!1034978 (= e!585136 (arrayNoDuplicates!0 (_keys!11424 thiss!1427) #b00000000000000000000000000000000 Nil!21907))))

(assert (= (and d!124463 res!691143) b!1034976))

(assert (= (and b!1034976 res!691144) b!1034977))

(assert (= (and b!1034977 res!691145) b!1034978))

(declare-fun m!955167 () Bool)

(assert (=> d!124463 m!955167))

(declare-fun m!955169 () Bool)

(assert (=> b!1034976 m!955169))

(declare-fun m!955171 () Bool)

(assert (=> b!1034977 m!955171))

(declare-fun m!955173 () Bool)

(assert (=> b!1034978 m!955173))

(assert (=> start!90438 d!124463))

(declare-fun d!124465 () Bool)

(assert (=> d!124465 (= (array_inv!24267 (_keys!11424 thiss!1427)) (bvsge (size!31896 (_keys!11424 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034948 d!124465))

(declare-fun d!124467 () Bool)

(assert (=> d!124467 (= (array_inv!24268 (_values!6263 thiss!1427)) (bvsge (size!31897 (_values!6263 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034948 d!124467))

(declare-fun b!1034985 () Bool)

(declare-fun e!585141 () Bool)

(assert (=> b!1034985 (= e!585141 tp_is_empty!24537)))

(declare-fun mapNonEmpty!38307 () Bool)

(declare-fun mapRes!38307 () Bool)

(declare-fun tp!73573 () Bool)

(assert (=> mapNonEmpty!38307 (= mapRes!38307 (and tp!73573 e!585141))))

(declare-fun mapValue!38307 () ValueCell!11565)

(declare-fun mapRest!38307 () (Array (_ BitVec 32) ValueCell!11565))

(declare-fun mapKey!38307 () (_ BitVec 32))

(assert (=> mapNonEmpty!38307 (= mapRest!38301 (store mapRest!38307 mapKey!38307 mapValue!38307))))

(declare-fun condMapEmpty!38307 () Bool)

(declare-fun mapDefault!38307 () ValueCell!11565)

(assert (=> mapNonEmpty!38301 (= condMapEmpty!38307 (= mapRest!38301 ((as const (Array (_ BitVec 32) ValueCell!11565)) mapDefault!38307)))))

(declare-fun e!585142 () Bool)

(assert (=> mapNonEmpty!38301 (= tp!73563 (and e!585142 mapRes!38307))))

(declare-fun b!1034986 () Bool)

(assert (=> b!1034986 (= e!585142 tp_is_empty!24537)))

(declare-fun mapIsEmpty!38307 () Bool)

(assert (=> mapIsEmpty!38307 mapRes!38307))

(assert (= (and mapNonEmpty!38301 condMapEmpty!38307) mapIsEmpty!38307))

(assert (= (and mapNonEmpty!38301 (not condMapEmpty!38307)) mapNonEmpty!38307))

(assert (= (and mapNonEmpty!38307 ((_ is ValueCellFull!11565) mapValue!38307)) b!1034985))

(assert (= (and mapNonEmpty!38301 ((_ is ValueCellFull!11565) mapDefault!38307)) b!1034986))

(declare-fun m!955175 () Bool)

(assert (=> mapNonEmpty!38307 m!955175))

(check-sat (not b!1034976) (not d!124463) (not b_next!20817) (not b!1034977) b_and!33317 tp_is_empty!24537 (not mapNonEmpty!38307) (not b!1034978))
(check-sat b_and!33317 (not b_next!20817))
(get-model)

(declare-fun b!1034995 () Bool)

(declare-fun e!585150 () Bool)

(declare-fun e!585149 () Bool)

(assert (=> b!1034995 (= e!585150 e!585149)))

(declare-fun c!104703 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1034995 (= c!104703 (validKeyInArray!0 (select (arr!31371 (_keys!11424 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034996 () Bool)

(declare-fun e!585151 () Bool)

(declare-fun call!43767 () Bool)

(assert (=> b!1034996 (= e!585151 call!43767)))

(declare-fun d!124469 () Bool)

(declare-fun res!691150 () Bool)

(assert (=> d!124469 (=> res!691150 e!585150)))

(assert (=> d!124469 (= res!691150 (bvsge #b00000000000000000000000000000000 (size!31896 (_keys!11424 thiss!1427))))))

(assert (=> d!124469 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11424 thiss!1427) (mask!30110 thiss!1427)) e!585150)))

(declare-fun b!1034997 () Bool)

(assert (=> b!1034997 (= e!585149 call!43767)))

(declare-fun bm!43764 () Bool)

(assert (=> bm!43764 (= call!43767 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11424 thiss!1427) (mask!30110 thiss!1427)))))

(declare-fun b!1034998 () Bool)

(assert (=> b!1034998 (= e!585149 e!585151)))

(declare-fun lt!456728 () (_ BitVec 64))

(assert (=> b!1034998 (= lt!456728 (select (arr!31371 (_keys!11424 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33884 0))(
  ( (Unit!33885) )
))
(declare-fun lt!456727 () Unit!33884)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65160 (_ BitVec 64) (_ BitVec 32)) Unit!33884)

(assert (=> b!1034998 (= lt!456727 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11424 thiss!1427) lt!456728 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1034998 (arrayContainsKey!0 (_keys!11424 thiss!1427) lt!456728 #b00000000000000000000000000000000)))

(declare-fun lt!456729 () Unit!33884)

(assert (=> b!1034998 (= lt!456729 lt!456727)))

(declare-fun res!691151 () Bool)

(declare-datatypes ((SeekEntryResult!9741 0))(
  ( (MissingZero!9741 (index!41335 (_ BitVec 32))) (Found!9741 (index!41336 (_ BitVec 32))) (Intermediate!9741 (undefined!10553 Bool) (index!41337 (_ BitVec 32)) (x!92302 (_ BitVec 32))) (Undefined!9741) (MissingVacant!9741 (index!41338 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65160 (_ BitVec 32)) SeekEntryResult!9741)

(assert (=> b!1034998 (= res!691151 (= (seekEntryOrOpen!0 (select (arr!31371 (_keys!11424 thiss!1427)) #b00000000000000000000000000000000) (_keys!11424 thiss!1427) (mask!30110 thiss!1427)) (Found!9741 #b00000000000000000000000000000000)))))

(assert (=> b!1034998 (=> (not res!691151) (not e!585151))))

(assert (= (and d!124469 (not res!691150)) b!1034995))

(assert (= (and b!1034995 c!104703) b!1034998))

(assert (= (and b!1034995 (not c!104703)) b!1034997))

(assert (= (and b!1034998 res!691151) b!1034996))

(assert (= (or b!1034996 b!1034997) bm!43764))

(declare-fun m!955177 () Bool)

(assert (=> b!1034995 m!955177))

(assert (=> b!1034995 m!955177))

(declare-fun m!955179 () Bool)

(assert (=> b!1034995 m!955179))

(declare-fun m!955181 () Bool)

(assert (=> bm!43764 m!955181))

(assert (=> b!1034998 m!955177))

(declare-fun m!955183 () Bool)

(assert (=> b!1034998 m!955183))

(declare-fun m!955185 () Bool)

(assert (=> b!1034998 m!955185))

(assert (=> b!1034998 m!955177))

(declare-fun m!955187 () Bool)

(assert (=> b!1034998 m!955187))

(assert (=> b!1034977 d!124469))

(declare-fun b!1035009 () Bool)

(declare-fun e!585160 () Bool)

(declare-fun contains!6017 (List!21910 (_ BitVec 64)) Bool)

(assert (=> b!1035009 (= e!585160 (contains!6017 Nil!21907 (select (arr!31371 (_keys!11424 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035010 () Bool)

(declare-fun e!585163 () Bool)

(declare-fun call!43770 () Bool)

(assert (=> b!1035010 (= e!585163 call!43770)))

(declare-fun b!1035011 () Bool)

(declare-fun e!585161 () Bool)

(assert (=> b!1035011 (= e!585161 e!585163)))

(declare-fun c!104706 () Bool)

(assert (=> b!1035011 (= c!104706 (validKeyInArray!0 (select (arr!31371 (_keys!11424 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035012 () Bool)

(assert (=> b!1035012 (= e!585163 call!43770)))

(declare-fun b!1035013 () Bool)

(declare-fun e!585162 () Bool)

(assert (=> b!1035013 (= e!585162 e!585161)))

(declare-fun res!691159 () Bool)

(assert (=> b!1035013 (=> (not res!691159) (not e!585161))))

(assert (=> b!1035013 (= res!691159 (not e!585160))))

(declare-fun res!691160 () Bool)

(assert (=> b!1035013 (=> (not res!691160) (not e!585160))))

(assert (=> b!1035013 (= res!691160 (validKeyInArray!0 (select (arr!31371 (_keys!11424 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124471 () Bool)

(declare-fun res!691158 () Bool)

(assert (=> d!124471 (=> res!691158 e!585162)))

(assert (=> d!124471 (= res!691158 (bvsge #b00000000000000000000000000000000 (size!31896 (_keys!11424 thiss!1427))))))

(assert (=> d!124471 (= (arrayNoDuplicates!0 (_keys!11424 thiss!1427) #b00000000000000000000000000000000 Nil!21907) e!585162)))

(declare-fun bm!43767 () Bool)

(assert (=> bm!43767 (= call!43770 (arrayNoDuplicates!0 (_keys!11424 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104706 (Cons!21906 (select (arr!31371 (_keys!11424 thiss!1427)) #b00000000000000000000000000000000) Nil!21907) Nil!21907)))))

(assert (= (and d!124471 (not res!691158)) b!1035013))

(assert (= (and b!1035013 res!691160) b!1035009))

(assert (= (and b!1035013 res!691159) b!1035011))

(assert (= (and b!1035011 c!104706) b!1035012))

(assert (= (and b!1035011 (not c!104706)) b!1035010))

(assert (= (or b!1035012 b!1035010) bm!43767))

(assert (=> b!1035009 m!955177))

(assert (=> b!1035009 m!955177))

(declare-fun m!955189 () Bool)

(assert (=> b!1035009 m!955189))

(assert (=> b!1035011 m!955177))

(assert (=> b!1035011 m!955177))

(assert (=> b!1035011 m!955179))

(assert (=> b!1035013 m!955177))

(assert (=> b!1035013 m!955177))

(assert (=> b!1035013 m!955179))

(assert (=> bm!43767 m!955177))

(declare-fun m!955191 () Bool)

(assert (=> bm!43767 m!955191))

(assert (=> b!1034978 d!124471))

(declare-fun b!1035022 () Bool)

(declare-fun e!585169 () (_ BitVec 32))

(declare-fun e!585168 () (_ BitVec 32))

(assert (=> b!1035022 (= e!585169 e!585168)))

(declare-fun c!104712 () Bool)

(assert (=> b!1035022 (= c!104712 (validKeyInArray!0 (select (arr!31371 (_keys!11424 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035023 () Bool)

(declare-fun call!43773 () (_ BitVec 32))

(assert (=> b!1035023 (= e!585168 call!43773)))

(declare-fun b!1035024 () Bool)

(assert (=> b!1035024 (= e!585168 (bvadd #b00000000000000000000000000000001 call!43773))))

(declare-fun b!1035025 () Bool)

(assert (=> b!1035025 (= e!585169 #b00000000000000000000000000000000)))

(declare-fun bm!43770 () Bool)

(assert (=> bm!43770 (= call!43773 (arrayCountValidKeys!0 (_keys!11424 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31896 (_keys!11424 thiss!1427))))))

(declare-fun d!124473 () Bool)

(declare-fun lt!456732 () (_ BitVec 32))

(assert (=> d!124473 (and (bvsge lt!456732 #b00000000000000000000000000000000) (bvsle lt!456732 (bvsub (size!31896 (_keys!11424 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124473 (= lt!456732 e!585169)))

(declare-fun c!104711 () Bool)

(assert (=> d!124473 (= c!104711 (bvsge #b00000000000000000000000000000000 (size!31896 (_keys!11424 thiss!1427))))))

(assert (=> d!124473 (and (bvsle #b00000000000000000000000000000000 (size!31896 (_keys!11424 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31896 (_keys!11424 thiss!1427)) (size!31896 (_keys!11424 thiss!1427))))))

(assert (=> d!124473 (= (arrayCountValidKeys!0 (_keys!11424 thiss!1427) #b00000000000000000000000000000000 (size!31896 (_keys!11424 thiss!1427))) lt!456732)))

(assert (= (and d!124473 c!104711) b!1035025))

(assert (= (and d!124473 (not c!104711)) b!1035022))

(assert (= (and b!1035022 c!104712) b!1035024))

(assert (= (and b!1035022 (not c!104712)) b!1035023))

(assert (= (or b!1035024 b!1035023) bm!43770))

(assert (=> b!1035022 m!955177))

(assert (=> b!1035022 m!955177))

(assert (=> b!1035022 m!955179))

(declare-fun m!955193 () Bool)

(assert (=> bm!43770 m!955193))

(assert (=> b!1034976 d!124473))

(declare-fun b!1035036 () Bool)

(declare-fun res!691171 () Bool)

(declare-fun e!585172 () Bool)

(assert (=> b!1035036 (=> (not res!691171) (not e!585172))))

(declare-fun size!31900 (LongMapFixedSize!5724) (_ BitVec 32))

(assert (=> b!1035036 (= res!691171 (= (size!31900 thiss!1427) (bvadd (_size!2917 thiss!1427) (bvsdiv (bvadd (extraKeys!5970 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1035034 () Bool)

(declare-fun res!691172 () Bool)

(assert (=> b!1035034 (=> (not res!691172) (not e!585172))))

(assert (=> b!1035034 (= res!691172 (and (= (size!31897 (_values!6263 thiss!1427)) (bvadd (mask!30110 thiss!1427) #b00000000000000000000000000000001)) (= (size!31896 (_keys!11424 thiss!1427)) (size!31897 (_values!6263 thiss!1427))) (bvsge (_size!2917 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2917 thiss!1427) (bvadd (mask!30110 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1035037 () Bool)

(assert (=> b!1035037 (= e!585172 (and (bvsge (extraKeys!5970 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5970 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2917 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1035035 () Bool)

(declare-fun res!691170 () Bool)

(assert (=> b!1035035 (=> (not res!691170) (not e!585172))))

(assert (=> b!1035035 (= res!691170 (bvsge (size!31900 thiss!1427) (_size!2917 thiss!1427)))))

(declare-fun d!124475 () Bool)

(declare-fun res!691169 () Bool)

(assert (=> d!124475 (=> (not res!691169) (not e!585172))))

(assert (=> d!124475 (= res!691169 (validMask!0 (mask!30110 thiss!1427)))))

(assert (=> d!124475 (= (simpleValid!408 thiss!1427) e!585172)))

(assert (= (and d!124475 res!691169) b!1035034))

(assert (= (and b!1035034 res!691172) b!1035035))

(assert (= (and b!1035035 res!691170) b!1035036))

(assert (= (and b!1035036 res!691171) b!1035037))

(declare-fun m!955195 () Bool)

(assert (=> b!1035036 m!955195))

(assert (=> b!1035035 m!955195))

(assert (=> d!124475 m!955147))

(assert (=> d!124463 d!124475))

(declare-fun b!1035038 () Bool)

(declare-fun e!585173 () Bool)

(assert (=> b!1035038 (= e!585173 tp_is_empty!24537)))

(declare-fun mapNonEmpty!38308 () Bool)

(declare-fun mapRes!38308 () Bool)

(declare-fun tp!73574 () Bool)

(assert (=> mapNonEmpty!38308 (= mapRes!38308 (and tp!73574 e!585173))))

(declare-fun mapKey!38308 () (_ BitVec 32))

(declare-fun mapRest!38308 () (Array (_ BitVec 32) ValueCell!11565))

(declare-fun mapValue!38308 () ValueCell!11565)

(assert (=> mapNonEmpty!38308 (= mapRest!38307 (store mapRest!38308 mapKey!38308 mapValue!38308))))

(declare-fun condMapEmpty!38308 () Bool)

(declare-fun mapDefault!38308 () ValueCell!11565)

(assert (=> mapNonEmpty!38307 (= condMapEmpty!38308 (= mapRest!38307 ((as const (Array (_ BitVec 32) ValueCell!11565)) mapDefault!38308)))))

(declare-fun e!585174 () Bool)

(assert (=> mapNonEmpty!38307 (= tp!73573 (and e!585174 mapRes!38308))))

(declare-fun b!1035039 () Bool)

(assert (=> b!1035039 (= e!585174 tp_is_empty!24537)))

(declare-fun mapIsEmpty!38308 () Bool)

(assert (=> mapIsEmpty!38308 mapRes!38308))

(assert (= (and mapNonEmpty!38307 condMapEmpty!38308) mapIsEmpty!38308))

(assert (= (and mapNonEmpty!38307 (not condMapEmpty!38308)) mapNonEmpty!38308))

(assert (= (and mapNonEmpty!38308 ((_ is ValueCellFull!11565) mapValue!38308)) b!1035038))

(assert (= (and mapNonEmpty!38307 ((_ is ValueCellFull!11565) mapDefault!38308)) b!1035039))

(declare-fun m!955197 () Bool)

(assert (=> mapNonEmpty!38308 m!955197))

(check-sat (not b!1034998) (not b!1035035) (not bm!43764) (not b_next!20817) (not d!124475) b_and!33317 (not b!1035022) (not b!1035036) tp_is_empty!24537 (not b!1035011) (not bm!43770) (not bm!43767) (not b!1035009) (not b!1035013) (not b!1034995) (not mapNonEmpty!38308))
(check-sat b_and!33317 (not b_next!20817))
