; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91100 () Bool)

(assert start!91100)

(declare-fun b!1039875 () Bool)

(declare-fun b_free!20947 () Bool)

(declare-fun b_next!20947 () Bool)

(assert (=> b!1039875 (= b_free!20947 (not b_next!20947))))

(declare-fun tp!74005 () Bool)

(declare-fun b_and!33489 () Bool)

(assert (=> b!1039875 (= tp!74005 b_and!33489)))

(declare-fun res!693291 () Bool)

(declare-fun e!588500 () Bool)

(assert (=> start!91100 (=> (not res!693291) (not e!588500))))

(declare-datatypes ((V!37763 0))(
  ( (V!37764 (val!12384 Int)) )
))
(declare-datatypes ((ValueCell!11630 0))(
  ( (ValueCellFull!11630 (v!14966 V!37763)) (EmptyCell!11630) )
))
(declare-datatypes ((array!65499 0))(
  ( (array!65500 (arr!31519 (Array (_ BitVec 32) (_ BitVec 64))) (size!32050 (_ BitVec 32))) )
))
(declare-datatypes ((array!65501 0))(
  ( (array!65502 (arr!31520 (Array (_ BitVec 32) ValueCell!11630)) (size!32051 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5854 0))(
  ( (LongMapFixedSize!5855 (defaultEntry!6309 Int) (mask!30311 (_ BitVec 32)) (extraKeys!6037 (_ BitVec 32)) (zeroValue!6143 V!37763) (minValue!6143 V!37763) (_size!2982 (_ BitVec 32)) (_keys!11549 array!65499) (_values!6332 array!65501) (_vacant!2982 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5854)

(declare-fun valid!2210 (LongMapFixedSize!5854) Bool)

(assert (=> start!91100 (= res!693291 (valid!2210 thiss!1427))))

(assert (=> start!91100 e!588500))

(declare-fun e!588497 () Bool)

(assert (=> start!91100 e!588497))

(assert (=> start!91100 true))

(declare-fun mapIsEmpty!38547 () Bool)

(declare-fun mapRes!38547 () Bool)

(assert (=> mapIsEmpty!38547 mapRes!38547))

(declare-fun b!1039868 () Bool)

(declare-fun res!693288 () Bool)

(assert (=> b!1039868 (=> (not res!693288) (not e!588500))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1039868 (= res!693288 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1039869 () Bool)

(declare-fun e!588499 () Bool)

(assert (=> b!1039869 (= e!588499 (= (size!32050 (_keys!11549 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30311 thiss!1427))))))

(declare-fun b!1039870 () Bool)

(declare-fun e!588496 () Bool)

(declare-fun tp_is_empty!24667 () Bool)

(assert (=> b!1039870 (= e!588496 tp_is_empty!24667)))

(declare-fun b!1039871 () Bool)

(declare-fun e!588501 () Bool)

(assert (=> b!1039871 (= e!588501 (not e!588499))))

(declare-fun res!693289 () Bool)

(assert (=> b!1039871 (=> res!693289 e!588499)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1039871 (= res!693289 (not (validMask!0 (mask!30311 thiss!1427))))))

(declare-fun lt!458294 () array!65499)

(declare-datatypes ((List!21926 0))(
  ( (Nil!21923) (Cons!21922 (h!23134 (_ BitVec 64)) (t!31132 List!21926)) )
))
(declare-fun arrayNoDuplicates!0 (array!65499 (_ BitVec 32) List!21926) Bool)

(assert (=> b!1039871 (arrayNoDuplicates!0 lt!458294 #b00000000000000000000000000000000 Nil!21923)))

(declare-datatypes ((Unit!33979 0))(
  ( (Unit!33980) )
))
(declare-fun lt!458295 () Unit!33979)

(declare-datatypes ((SeekEntryResult!9727 0))(
  ( (MissingZero!9727 (index!41279 (_ BitVec 32))) (Found!9727 (index!41280 (_ BitVec 32))) (Intermediate!9727 (undefined!10539 Bool) (index!41281 (_ BitVec 32)) (x!92652 (_ BitVec 32))) (Undefined!9727) (MissingVacant!9727 (index!41282 (_ BitVec 32))) )
))
(declare-fun lt!458293 () SeekEntryResult!9727)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65499 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21926) Unit!33979)

(assert (=> b!1039871 (= lt!458295 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11549 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41280 lt!458293) #b00000000000000000000000000000000 Nil!21923))))

(declare-fun arrayCountValidKeys!0 (array!65499 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039871 (= (arrayCountValidKeys!0 lt!458294 #b00000000000000000000000000000000 (size!32050 (_keys!11549 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11549 thiss!1427) #b00000000000000000000000000000000 (size!32050 (_keys!11549 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1039871 (= lt!458294 (array!65500 (store (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458293) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32050 (_keys!11549 thiss!1427))))))

(declare-fun lt!458296 () Unit!33979)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65499 (_ BitVec 32) (_ BitVec 64)) Unit!33979)

(assert (=> b!1039871 (= lt!458296 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11549 thiss!1427) (index!41280 lt!458293) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!38547 () Bool)

(declare-fun tp!74004 () Bool)

(assert (=> mapNonEmpty!38547 (= mapRes!38547 (and tp!74004 e!588496))))

(declare-fun mapValue!38547 () ValueCell!11630)

(declare-fun mapRest!38547 () (Array (_ BitVec 32) ValueCell!11630))

(declare-fun mapKey!38547 () (_ BitVec 32))

(assert (=> mapNonEmpty!38547 (= (arr!31520 (_values!6332 thiss!1427)) (store mapRest!38547 mapKey!38547 mapValue!38547))))

(declare-fun b!1039872 () Bool)

(declare-fun e!588495 () Bool)

(declare-fun e!588498 () Bool)

(assert (=> b!1039872 (= e!588495 (and e!588498 mapRes!38547))))

(declare-fun condMapEmpty!38547 () Bool)

(declare-fun mapDefault!38547 () ValueCell!11630)

(assert (=> b!1039872 (= condMapEmpty!38547 (= (arr!31520 (_values!6332 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11630)) mapDefault!38547)))))

(declare-fun b!1039873 () Bool)

(assert (=> b!1039873 (= e!588500 e!588501)))

(declare-fun res!693290 () Bool)

(assert (=> b!1039873 (=> (not res!693290) (not e!588501))))

(get-info :version)

(assert (=> b!1039873 (= res!693290 ((_ is Found!9727) lt!458293))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65499 (_ BitVec 32)) SeekEntryResult!9727)

(assert (=> b!1039873 (= lt!458293 (seekEntry!0 key!909 (_keys!11549 thiss!1427) (mask!30311 thiss!1427)))))

(declare-fun b!1039874 () Bool)

(assert (=> b!1039874 (= e!588498 tp_is_empty!24667)))

(declare-fun array_inv!24381 (array!65499) Bool)

(declare-fun array_inv!24382 (array!65501) Bool)

(assert (=> b!1039875 (= e!588497 (and tp!74005 tp_is_empty!24667 (array_inv!24381 (_keys!11549 thiss!1427)) (array_inv!24382 (_values!6332 thiss!1427)) e!588495))))

(assert (= (and start!91100 res!693291) b!1039868))

(assert (= (and b!1039868 res!693288) b!1039873))

(assert (= (and b!1039873 res!693290) b!1039871))

(assert (= (and b!1039871 (not res!693289)) b!1039869))

(assert (= (and b!1039872 condMapEmpty!38547) mapIsEmpty!38547))

(assert (= (and b!1039872 (not condMapEmpty!38547)) mapNonEmpty!38547))

(assert (= (and mapNonEmpty!38547 ((_ is ValueCellFull!11630) mapValue!38547)) b!1039870))

(assert (= (and b!1039872 ((_ is ValueCellFull!11630) mapDefault!38547)) b!1039874))

(assert (= b!1039875 b!1039872))

(assert (= start!91100 b!1039875))

(declare-fun m!960133 () Bool)

(assert (=> b!1039871 m!960133))

(declare-fun m!960135 () Bool)

(assert (=> b!1039871 m!960135))

(declare-fun m!960137 () Bool)

(assert (=> b!1039871 m!960137))

(declare-fun m!960139 () Bool)

(assert (=> b!1039871 m!960139))

(declare-fun m!960141 () Bool)

(assert (=> b!1039871 m!960141))

(declare-fun m!960143 () Bool)

(assert (=> b!1039871 m!960143))

(declare-fun m!960145 () Bool)

(assert (=> b!1039871 m!960145))

(declare-fun m!960147 () Bool)

(assert (=> mapNonEmpty!38547 m!960147))

(declare-fun m!960149 () Bool)

(assert (=> start!91100 m!960149))

(declare-fun m!960151 () Bool)

(assert (=> b!1039875 m!960151))

(declare-fun m!960153 () Bool)

(assert (=> b!1039875 m!960153))

(declare-fun m!960155 () Bool)

(assert (=> b!1039873 m!960155))

(check-sat (not mapNonEmpty!38547) (not start!91100) (not b_next!20947) (not b!1039871) tp_is_empty!24667 b_and!33489 (not b!1039875) (not b!1039873))
(check-sat b_and!33489 (not b_next!20947))
(get-model)

(declare-fun d!125817 () Bool)

(assert (=> d!125817 (= (array_inv!24381 (_keys!11549 thiss!1427)) (bvsge (size!32050 (_keys!11549 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039875 d!125817))

(declare-fun d!125819 () Bool)

(assert (=> d!125819 (= (array_inv!24382 (_values!6332 thiss!1427)) (bvsge (size!32051 (_values!6332 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039875 d!125819))

(declare-fun b!1039934 () Bool)

(declare-fun e!588559 () Bool)

(declare-fun e!588562 () Bool)

(assert (=> b!1039934 (= e!588559 e!588562)))

(declare-fun res!693323 () Bool)

(assert (=> b!1039934 (=> (not res!693323) (not e!588562))))

(declare-fun e!588560 () Bool)

(assert (=> b!1039934 (= res!693323 (not e!588560))))

(declare-fun res!693322 () Bool)

(assert (=> b!1039934 (=> (not res!693322) (not e!588560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1039934 (= res!693322 (validKeyInArray!0 (select (arr!31519 lt!458294) #b00000000000000000000000000000000)))))

(declare-fun b!1039935 () Bool)

(declare-fun contains!6065 (List!21926 (_ BitVec 64)) Bool)

(assert (=> b!1039935 (= e!588560 (contains!6065 Nil!21923 (select (arr!31519 lt!458294) #b00000000000000000000000000000000)))))

(declare-fun b!1039936 () Bool)

(declare-fun e!588561 () Bool)

(declare-fun call!44018 () Bool)

(assert (=> b!1039936 (= e!588561 call!44018)))

(declare-fun bm!44015 () Bool)

(declare-fun c!105631 () Bool)

(assert (=> bm!44015 (= call!44018 (arrayNoDuplicates!0 lt!458294 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105631 (Cons!21922 (select (arr!31519 lt!458294) #b00000000000000000000000000000000) Nil!21923) Nil!21923)))))

(declare-fun d!125821 () Bool)

(declare-fun res!693324 () Bool)

(assert (=> d!125821 (=> res!693324 e!588559)))

(assert (=> d!125821 (= res!693324 (bvsge #b00000000000000000000000000000000 (size!32050 lt!458294)))))

(assert (=> d!125821 (= (arrayNoDuplicates!0 lt!458294 #b00000000000000000000000000000000 Nil!21923) e!588559)))

(declare-fun b!1039937 () Bool)

(assert (=> b!1039937 (= e!588561 call!44018)))

(declare-fun b!1039938 () Bool)

(assert (=> b!1039938 (= e!588562 e!588561)))

(assert (=> b!1039938 (= c!105631 (validKeyInArray!0 (select (arr!31519 lt!458294) #b00000000000000000000000000000000)))))

(assert (= (and d!125821 (not res!693324)) b!1039934))

(assert (= (and b!1039934 res!693322) b!1039935))

(assert (= (and b!1039934 res!693323) b!1039938))

(assert (= (and b!1039938 c!105631) b!1039937))

(assert (= (and b!1039938 (not c!105631)) b!1039936))

(assert (= (or b!1039937 b!1039936) bm!44015))

(declare-fun m!960205 () Bool)

(assert (=> b!1039934 m!960205))

(assert (=> b!1039934 m!960205))

(declare-fun m!960207 () Bool)

(assert (=> b!1039934 m!960207))

(assert (=> b!1039935 m!960205))

(assert (=> b!1039935 m!960205))

(declare-fun m!960209 () Bool)

(assert (=> b!1039935 m!960209))

(assert (=> bm!44015 m!960205))

(declare-fun m!960211 () Bool)

(assert (=> bm!44015 m!960211))

(assert (=> b!1039938 m!960205))

(assert (=> b!1039938 m!960205))

(assert (=> b!1039938 m!960207))

(assert (=> b!1039871 d!125821))

(declare-fun b!1039947 () Bool)

(declare-fun e!588568 () (_ BitVec 32))

(declare-fun call!44021 () (_ BitVec 32))

(assert (=> b!1039947 (= e!588568 call!44021)))

(declare-fun d!125823 () Bool)

(declare-fun lt!458323 () (_ BitVec 32))

(assert (=> d!125823 (and (bvsge lt!458323 #b00000000000000000000000000000000) (bvsle lt!458323 (bvsub (size!32050 lt!458294) #b00000000000000000000000000000000)))))

(declare-fun e!588567 () (_ BitVec 32))

(assert (=> d!125823 (= lt!458323 e!588567)))

(declare-fun c!105637 () Bool)

(assert (=> d!125823 (= c!105637 (bvsge #b00000000000000000000000000000000 (size!32050 (_keys!11549 thiss!1427))))))

(assert (=> d!125823 (and (bvsle #b00000000000000000000000000000000 (size!32050 (_keys!11549 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32050 (_keys!11549 thiss!1427)) (size!32050 lt!458294)))))

(assert (=> d!125823 (= (arrayCountValidKeys!0 lt!458294 #b00000000000000000000000000000000 (size!32050 (_keys!11549 thiss!1427))) lt!458323)))

(declare-fun bm!44018 () Bool)

(assert (=> bm!44018 (= call!44021 (arrayCountValidKeys!0 lt!458294 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32050 (_keys!11549 thiss!1427))))))

(declare-fun b!1039948 () Bool)

(assert (=> b!1039948 (= e!588567 #b00000000000000000000000000000000)))

(declare-fun b!1039949 () Bool)

(assert (=> b!1039949 (= e!588568 (bvadd #b00000000000000000000000000000001 call!44021))))

(declare-fun b!1039950 () Bool)

(assert (=> b!1039950 (= e!588567 e!588568)))

(declare-fun c!105636 () Bool)

(assert (=> b!1039950 (= c!105636 (validKeyInArray!0 (select (arr!31519 lt!458294) #b00000000000000000000000000000000)))))

(assert (= (and d!125823 c!105637) b!1039948))

(assert (= (and d!125823 (not c!105637)) b!1039950))

(assert (= (and b!1039950 c!105636) b!1039949))

(assert (= (and b!1039950 (not c!105636)) b!1039947))

(assert (= (or b!1039949 b!1039947) bm!44018))

(declare-fun m!960213 () Bool)

(assert (=> bm!44018 m!960213))

(assert (=> b!1039950 m!960205))

(assert (=> b!1039950 m!960205))

(assert (=> b!1039950 m!960207))

(assert (=> b!1039871 d!125823))

(declare-fun d!125825 () Bool)

(assert (=> d!125825 (= (validMask!0 (mask!30311 thiss!1427)) (and (or (= (mask!30311 thiss!1427) #b00000000000000000000000000000111) (= (mask!30311 thiss!1427) #b00000000000000000000000000001111) (= (mask!30311 thiss!1427) #b00000000000000000000000000011111) (= (mask!30311 thiss!1427) #b00000000000000000000000000111111) (= (mask!30311 thiss!1427) #b00000000000000000000000001111111) (= (mask!30311 thiss!1427) #b00000000000000000000000011111111) (= (mask!30311 thiss!1427) #b00000000000000000000000111111111) (= (mask!30311 thiss!1427) #b00000000000000000000001111111111) (= (mask!30311 thiss!1427) #b00000000000000000000011111111111) (= (mask!30311 thiss!1427) #b00000000000000000000111111111111) (= (mask!30311 thiss!1427) #b00000000000000000001111111111111) (= (mask!30311 thiss!1427) #b00000000000000000011111111111111) (= (mask!30311 thiss!1427) #b00000000000000000111111111111111) (= (mask!30311 thiss!1427) #b00000000000000001111111111111111) (= (mask!30311 thiss!1427) #b00000000000000011111111111111111) (= (mask!30311 thiss!1427) #b00000000000000111111111111111111) (= (mask!30311 thiss!1427) #b00000000000001111111111111111111) (= (mask!30311 thiss!1427) #b00000000000011111111111111111111) (= (mask!30311 thiss!1427) #b00000000000111111111111111111111) (= (mask!30311 thiss!1427) #b00000000001111111111111111111111) (= (mask!30311 thiss!1427) #b00000000011111111111111111111111) (= (mask!30311 thiss!1427) #b00000000111111111111111111111111) (= (mask!30311 thiss!1427) #b00000001111111111111111111111111) (= (mask!30311 thiss!1427) #b00000011111111111111111111111111) (= (mask!30311 thiss!1427) #b00000111111111111111111111111111) (= (mask!30311 thiss!1427) #b00001111111111111111111111111111) (= (mask!30311 thiss!1427) #b00011111111111111111111111111111) (= (mask!30311 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30311 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1039871 d!125825))

(declare-fun b!1039961 () Bool)

(declare-fun e!588574 () Bool)

(assert (=> b!1039961 (= e!588574 (bvslt (size!32050 (_keys!11549 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1039959 () Bool)

(declare-fun res!693335 () Bool)

(assert (=> b!1039959 (=> (not res!693335) (not e!588574))))

(assert (=> b!1039959 (= res!693335 (validKeyInArray!0 (select (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458293))))))

(declare-fun d!125827 () Bool)

(declare-fun e!588573 () Bool)

(assert (=> d!125827 e!588573))

(declare-fun res!693334 () Bool)

(assert (=> d!125827 (=> (not res!693334) (not e!588573))))

(assert (=> d!125827 (= res!693334 (and (bvsge (index!41280 lt!458293) #b00000000000000000000000000000000) (bvslt (index!41280 lt!458293) (size!32050 (_keys!11549 thiss!1427)))))))

(declare-fun lt!458326 () Unit!33979)

(declare-fun choose!82 (array!65499 (_ BitVec 32) (_ BitVec 64)) Unit!33979)

(assert (=> d!125827 (= lt!458326 (choose!82 (_keys!11549 thiss!1427) (index!41280 lt!458293) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125827 e!588574))

(declare-fun res!693333 () Bool)

(assert (=> d!125827 (=> (not res!693333) (not e!588574))))

(assert (=> d!125827 (= res!693333 (and (bvsge (index!41280 lt!458293) #b00000000000000000000000000000000) (bvslt (index!41280 lt!458293) (size!32050 (_keys!11549 thiss!1427)))))))

(assert (=> d!125827 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11549 thiss!1427) (index!41280 lt!458293) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458326)))

(declare-fun b!1039960 () Bool)

(declare-fun res!693336 () Bool)

(assert (=> b!1039960 (=> (not res!693336) (not e!588574))))

(assert (=> b!1039960 (= res!693336 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1039962 () Bool)

(assert (=> b!1039962 (= e!588573 (= (arrayCountValidKeys!0 (array!65500 (store (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458293) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32050 (_keys!11549 thiss!1427))) #b00000000000000000000000000000000 (size!32050 (_keys!11549 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11549 thiss!1427) #b00000000000000000000000000000000 (size!32050 (_keys!11549 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!125827 res!693333) b!1039959))

(assert (= (and b!1039959 res!693335) b!1039960))

(assert (= (and b!1039960 res!693336) b!1039961))

(assert (= (and d!125827 res!693334) b!1039962))

(declare-fun m!960215 () Bool)

(assert (=> b!1039959 m!960215))

(assert (=> b!1039959 m!960215))

(declare-fun m!960217 () Bool)

(assert (=> b!1039959 m!960217))

(declare-fun m!960219 () Bool)

(assert (=> d!125827 m!960219))

(declare-fun m!960221 () Bool)

(assert (=> b!1039960 m!960221))

(assert (=> b!1039962 m!960141))

(declare-fun m!960223 () Bool)

(assert (=> b!1039962 m!960223))

(assert (=> b!1039962 m!960139))

(assert (=> b!1039871 d!125827))

(declare-fun d!125829 () Bool)

(declare-fun e!588577 () Bool)

(assert (=> d!125829 e!588577))

(declare-fun res!693339 () Bool)

(assert (=> d!125829 (=> (not res!693339) (not e!588577))))

(assert (=> d!125829 (= res!693339 (and (bvsge (index!41280 lt!458293) #b00000000000000000000000000000000) (bvslt (index!41280 lt!458293) (size!32050 (_keys!11549 thiss!1427)))))))

(declare-fun lt!458329 () Unit!33979)

(declare-fun choose!53 (array!65499 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21926) Unit!33979)

(assert (=> d!125829 (= lt!458329 (choose!53 (_keys!11549 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41280 lt!458293) #b00000000000000000000000000000000 Nil!21923))))

(assert (=> d!125829 (bvslt (size!32050 (_keys!11549 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125829 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11549 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41280 lt!458293) #b00000000000000000000000000000000 Nil!21923) lt!458329)))

(declare-fun b!1039965 () Bool)

(assert (=> b!1039965 (= e!588577 (arrayNoDuplicates!0 (array!65500 (store (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458293) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32050 (_keys!11549 thiss!1427))) #b00000000000000000000000000000000 Nil!21923))))

(assert (= (and d!125829 res!693339) b!1039965))

(declare-fun m!960225 () Bool)

(assert (=> d!125829 m!960225))

(assert (=> b!1039965 m!960141))

(declare-fun m!960227 () Bool)

(assert (=> b!1039965 m!960227))

(assert (=> b!1039871 d!125829))

(declare-fun b!1039966 () Bool)

(declare-fun e!588579 () (_ BitVec 32))

(declare-fun call!44022 () (_ BitVec 32))

(assert (=> b!1039966 (= e!588579 call!44022)))

(declare-fun d!125831 () Bool)

(declare-fun lt!458330 () (_ BitVec 32))

(assert (=> d!125831 (and (bvsge lt!458330 #b00000000000000000000000000000000) (bvsle lt!458330 (bvsub (size!32050 (_keys!11549 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!588578 () (_ BitVec 32))

(assert (=> d!125831 (= lt!458330 e!588578)))

(declare-fun c!105639 () Bool)

(assert (=> d!125831 (= c!105639 (bvsge #b00000000000000000000000000000000 (size!32050 (_keys!11549 thiss!1427))))))

(assert (=> d!125831 (and (bvsle #b00000000000000000000000000000000 (size!32050 (_keys!11549 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32050 (_keys!11549 thiss!1427)) (size!32050 (_keys!11549 thiss!1427))))))

(assert (=> d!125831 (= (arrayCountValidKeys!0 (_keys!11549 thiss!1427) #b00000000000000000000000000000000 (size!32050 (_keys!11549 thiss!1427))) lt!458330)))

(declare-fun bm!44019 () Bool)

(assert (=> bm!44019 (= call!44022 (arrayCountValidKeys!0 (_keys!11549 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32050 (_keys!11549 thiss!1427))))))

(declare-fun b!1039967 () Bool)

(assert (=> b!1039967 (= e!588578 #b00000000000000000000000000000000)))

(declare-fun b!1039968 () Bool)

(assert (=> b!1039968 (= e!588579 (bvadd #b00000000000000000000000000000001 call!44022))))

(declare-fun b!1039969 () Bool)

(assert (=> b!1039969 (= e!588578 e!588579)))

(declare-fun c!105638 () Bool)

(assert (=> b!1039969 (= c!105638 (validKeyInArray!0 (select (arr!31519 (_keys!11549 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125831 c!105639) b!1039967))

(assert (= (and d!125831 (not c!105639)) b!1039969))

(assert (= (and b!1039969 c!105638) b!1039968))

(assert (= (and b!1039969 (not c!105638)) b!1039966))

(assert (= (or b!1039968 b!1039966) bm!44019))

(declare-fun m!960229 () Bool)

(assert (=> bm!44019 m!960229))

(declare-fun m!960231 () Bool)

(assert (=> b!1039969 m!960231))

(assert (=> b!1039969 m!960231))

(declare-fun m!960233 () Bool)

(assert (=> b!1039969 m!960233))

(assert (=> b!1039871 d!125831))

(declare-fun d!125833 () Bool)

(declare-fun res!693346 () Bool)

(declare-fun e!588582 () Bool)

(assert (=> d!125833 (=> (not res!693346) (not e!588582))))

(declare-fun simpleValid!423 (LongMapFixedSize!5854) Bool)

(assert (=> d!125833 (= res!693346 (simpleValid!423 thiss!1427))))

(assert (=> d!125833 (= (valid!2210 thiss!1427) e!588582)))

(declare-fun b!1039976 () Bool)

(declare-fun res!693347 () Bool)

(assert (=> b!1039976 (=> (not res!693347) (not e!588582))))

(assert (=> b!1039976 (= res!693347 (= (arrayCountValidKeys!0 (_keys!11549 thiss!1427) #b00000000000000000000000000000000 (size!32050 (_keys!11549 thiss!1427))) (_size!2982 thiss!1427)))))

(declare-fun b!1039977 () Bool)

(declare-fun res!693348 () Bool)

(assert (=> b!1039977 (=> (not res!693348) (not e!588582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65499 (_ BitVec 32)) Bool)

(assert (=> b!1039977 (= res!693348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11549 thiss!1427) (mask!30311 thiss!1427)))))

(declare-fun b!1039978 () Bool)

(assert (=> b!1039978 (= e!588582 (arrayNoDuplicates!0 (_keys!11549 thiss!1427) #b00000000000000000000000000000000 Nil!21923))))

(assert (= (and d!125833 res!693346) b!1039976))

(assert (= (and b!1039976 res!693347) b!1039977))

(assert (= (and b!1039977 res!693348) b!1039978))

(declare-fun m!960235 () Bool)

(assert (=> d!125833 m!960235))

(assert (=> b!1039976 m!960139))

(declare-fun m!960237 () Bool)

(assert (=> b!1039977 m!960237))

(declare-fun m!960239 () Bool)

(assert (=> b!1039978 m!960239))

(assert (=> start!91100 d!125833))

(declare-fun b!1039991 () Bool)

(declare-fun e!588590 () SeekEntryResult!9727)

(declare-fun lt!458340 () SeekEntryResult!9727)

(assert (=> b!1039991 (= e!588590 (ite ((_ is MissingVacant!9727) lt!458340) (MissingZero!9727 (index!41282 lt!458340)) lt!458340))))

(declare-fun lt!458342 () SeekEntryResult!9727)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65499 (_ BitVec 32)) SeekEntryResult!9727)

(assert (=> b!1039991 (= lt!458340 (seekKeyOrZeroReturnVacant!0 (x!92652 lt!458342) (index!41281 lt!458342) (index!41281 lt!458342) key!909 (_keys!11549 thiss!1427) (mask!30311 thiss!1427)))))

(declare-fun b!1039992 () Bool)

(declare-fun e!588591 () SeekEntryResult!9727)

(declare-fun e!588589 () SeekEntryResult!9727)

(assert (=> b!1039992 (= e!588591 e!588589)))

(declare-fun lt!458341 () (_ BitVec 64))

(assert (=> b!1039992 (= lt!458341 (select (arr!31519 (_keys!11549 thiss!1427)) (index!41281 lt!458342)))))

(declare-fun c!105648 () Bool)

(assert (=> b!1039992 (= c!105648 (= lt!458341 key!909))))

(declare-fun b!1039993 () Bool)

(declare-fun c!105647 () Bool)

(assert (=> b!1039993 (= c!105647 (= lt!458341 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1039993 (= e!588589 e!588590)))

(declare-fun b!1039994 () Bool)

(assert (=> b!1039994 (= e!588589 (Found!9727 (index!41281 lt!458342)))))

(declare-fun d!125835 () Bool)

(declare-fun lt!458339 () SeekEntryResult!9727)

(assert (=> d!125835 (and (or ((_ is MissingVacant!9727) lt!458339) (not ((_ is Found!9727) lt!458339)) (and (bvsge (index!41280 lt!458339) #b00000000000000000000000000000000) (bvslt (index!41280 lt!458339) (size!32050 (_keys!11549 thiss!1427))))) (not ((_ is MissingVacant!9727) lt!458339)) (or (not ((_ is Found!9727) lt!458339)) (= (select (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458339)) key!909)))))

(assert (=> d!125835 (= lt!458339 e!588591)))

(declare-fun c!105646 () Bool)

(assert (=> d!125835 (= c!105646 (and ((_ is Intermediate!9727) lt!458342) (undefined!10539 lt!458342)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65499 (_ BitVec 32)) SeekEntryResult!9727)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125835 (= lt!458342 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30311 thiss!1427)) key!909 (_keys!11549 thiss!1427) (mask!30311 thiss!1427)))))

(assert (=> d!125835 (validMask!0 (mask!30311 thiss!1427))))

(assert (=> d!125835 (= (seekEntry!0 key!909 (_keys!11549 thiss!1427) (mask!30311 thiss!1427)) lt!458339)))

(declare-fun b!1039995 () Bool)

(assert (=> b!1039995 (= e!588591 Undefined!9727)))

(declare-fun b!1039996 () Bool)

(assert (=> b!1039996 (= e!588590 (MissingZero!9727 (index!41281 lt!458342)))))

(assert (= (and d!125835 c!105646) b!1039995))

(assert (= (and d!125835 (not c!105646)) b!1039992))

(assert (= (and b!1039992 c!105648) b!1039994))

(assert (= (and b!1039992 (not c!105648)) b!1039993))

(assert (= (and b!1039993 c!105647) b!1039996))

(assert (= (and b!1039993 (not c!105647)) b!1039991))

(declare-fun m!960241 () Bool)

(assert (=> b!1039991 m!960241))

(declare-fun m!960243 () Bool)

(assert (=> b!1039992 m!960243))

(declare-fun m!960245 () Bool)

(assert (=> d!125835 m!960245))

(declare-fun m!960247 () Bool)

(assert (=> d!125835 m!960247))

(assert (=> d!125835 m!960247))

(declare-fun m!960249 () Bool)

(assert (=> d!125835 m!960249))

(assert (=> d!125835 m!960137))

(assert (=> b!1039873 d!125835))

(declare-fun b!1040004 () Bool)

(declare-fun e!588596 () Bool)

(assert (=> b!1040004 (= e!588596 tp_is_empty!24667)))

(declare-fun condMapEmpty!38556 () Bool)

(declare-fun mapDefault!38556 () ValueCell!11630)

(assert (=> mapNonEmpty!38547 (= condMapEmpty!38556 (= mapRest!38547 ((as const (Array (_ BitVec 32) ValueCell!11630)) mapDefault!38556)))))

(declare-fun mapRes!38556 () Bool)

(assert (=> mapNonEmpty!38547 (= tp!74004 (and e!588596 mapRes!38556))))

(declare-fun b!1040003 () Bool)

(declare-fun e!588597 () Bool)

(assert (=> b!1040003 (= e!588597 tp_is_empty!24667)))

(declare-fun mapIsEmpty!38556 () Bool)

(assert (=> mapIsEmpty!38556 mapRes!38556))

(declare-fun mapNonEmpty!38556 () Bool)

(declare-fun tp!74020 () Bool)

(assert (=> mapNonEmpty!38556 (= mapRes!38556 (and tp!74020 e!588597))))

(declare-fun mapRest!38556 () (Array (_ BitVec 32) ValueCell!11630))

(declare-fun mapValue!38556 () ValueCell!11630)

(declare-fun mapKey!38556 () (_ BitVec 32))

(assert (=> mapNonEmpty!38556 (= mapRest!38547 (store mapRest!38556 mapKey!38556 mapValue!38556))))

(assert (= (and mapNonEmpty!38547 condMapEmpty!38556) mapIsEmpty!38556))

(assert (= (and mapNonEmpty!38547 (not condMapEmpty!38556)) mapNonEmpty!38556))

(assert (= (and mapNonEmpty!38556 ((_ is ValueCellFull!11630) mapValue!38556)) b!1040003))

(assert (= (and mapNonEmpty!38547 ((_ is ValueCellFull!11630) mapDefault!38556)) b!1040004))

(declare-fun m!960251 () Bool)

(assert (=> mapNonEmpty!38556 m!960251))

(check-sat (not b!1039965) (not b!1039950) (not b!1039969) b_and!33489 (not b!1039959) (not d!125827) (not b!1039934) (not d!125835) (not b!1039977) (not b!1039976) (not b!1039935) (not mapNonEmpty!38556) (not bm!44015) (not b!1039938) (not bm!44019) (not b!1039991) (not b!1039978) (not b_next!20947) (not b!1039962) (not d!125833) (not d!125829) (not b!1039960) tp_is_empty!24667 (not bm!44018))
(check-sat b_and!33489 (not b_next!20947))
(get-model)

(declare-fun b!1040005 () Bool)

(declare-fun e!588599 () (_ BitVec 32))

(declare-fun call!44023 () (_ BitVec 32))

(assert (=> b!1040005 (= e!588599 call!44023)))

(declare-fun d!125837 () Bool)

(declare-fun lt!458343 () (_ BitVec 32))

(assert (=> d!125837 (and (bvsge lt!458343 #b00000000000000000000000000000000) (bvsle lt!458343 (bvsub (size!32050 (_keys!11549 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!588598 () (_ BitVec 32))

(assert (=> d!125837 (= lt!458343 e!588598)))

(declare-fun c!105650 () Bool)

(assert (=> d!125837 (= c!105650 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32050 (_keys!11549 thiss!1427))))))

(assert (=> d!125837 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32050 (_keys!11549 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32050 (_keys!11549 thiss!1427)) (size!32050 (_keys!11549 thiss!1427))))))

(assert (=> d!125837 (= (arrayCountValidKeys!0 (_keys!11549 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32050 (_keys!11549 thiss!1427))) lt!458343)))

(declare-fun bm!44020 () Bool)

(assert (=> bm!44020 (= call!44023 (arrayCountValidKeys!0 (_keys!11549 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32050 (_keys!11549 thiss!1427))))))

(declare-fun b!1040006 () Bool)

(assert (=> b!1040006 (= e!588598 #b00000000000000000000000000000000)))

(declare-fun b!1040007 () Bool)

(assert (=> b!1040007 (= e!588599 (bvadd #b00000000000000000000000000000001 call!44023))))

(declare-fun b!1040008 () Bool)

(assert (=> b!1040008 (= e!588598 e!588599)))

(declare-fun c!105649 () Bool)

(assert (=> b!1040008 (= c!105649 (validKeyInArray!0 (select (arr!31519 (_keys!11549 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!125837 c!105650) b!1040006))

(assert (= (and d!125837 (not c!105650)) b!1040008))

(assert (= (and b!1040008 c!105649) b!1040007))

(assert (= (and b!1040008 (not c!105649)) b!1040005))

(assert (= (or b!1040007 b!1040005) bm!44020))

(declare-fun m!960253 () Bool)

(assert (=> bm!44020 m!960253))

(declare-fun m!960255 () Bool)

(assert (=> b!1040008 m!960255))

(assert (=> b!1040008 m!960255))

(declare-fun m!960257 () Bool)

(assert (=> b!1040008 m!960257))

(assert (=> bm!44019 d!125837))

(declare-fun d!125839 () Bool)

(declare-fun e!588611 () Bool)

(assert (=> d!125839 e!588611))

(declare-fun c!105657 () Bool)

(declare-fun lt!458349 () SeekEntryResult!9727)

(assert (=> d!125839 (= c!105657 (and ((_ is Intermediate!9727) lt!458349) (undefined!10539 lt!458349)))))

(declare-fun e!588610 () SeekEntryResult!9727)

(assert (=> d!125839 (= lt!458349 e!588610)))

(declare-fun c!105659 () Bool)

(assert (=> d!125839 (= c!105659 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!458348 () (_ BitVec 64))

(assert (=> d!125839 (= lt!458348 (select (arr!31519 (_keys!11549 thiss!1427)) (toIndex!0 key!909 (mask!30311 thiss!1427))))))

(assert (=> d!125839 (validMask!0 (mask!30311 thiss!1427))))

(assert (=> d!125839 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30311 thiss!1427)) key!909 (_keys!11549 thiss!1427) (mask!30311 thiss!1427)) lt!458349)))

(declare-fun b!1040027 () Bool)

(declare-fun e!588613 () SeekEntryResult!9727)

(assert (=> b!1040027 (= e!588613 (Intermediate!9727 false (toIndex!0 key!909 (mask!30311 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1040028 () Bool)

(assert (=> b!1040028 (and (bvsge (index!41281 lt!458349) #b00000000000000000000000000000000) (bvslt (index!41281 lt!458349) (size!32050 (_keys!11549 thiss!1427))))))

(declare-fun res!693357 () Bool)

(assert (=> b!1040028 (= res!693357 (= (select (arr!31519 (_keys!11549 thiss!1427)) (index!41281 lt!458349)) key!909))))

(declare-fun e!588612 () Bool)

(assert (=> b!1040028 (=> res!693357 e!588612)))

(declare-fun e!588614 () Bool)

(assert (=> b!1040028 (= e!588614 e!588612)))

(declare-fun b!1040029 () Bool)

(assert (=> b!1040029 (= e!588611 e!588614)))

(declare-fun res!693356 () Bool)

(assert (=> b!1040029 (= res!693356 (and ((_ is Intermediate!9727) lt!458349) (not (undefined!10539 lt!458349)) (bvslt (x!92652 lt!458349) #b01111111111111111111111111111110) (bvsge (x!92652 lt!458349) #b00000000000000000000000000000000) (bvsge (x!92652 lt!458349) #b00000000000000000000000000000000)))))

(assert (=> b!1040029 (=> (not res!693356) (not e!588614))))

(declare-fun b!1040030 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040030 (= e!588613 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!30311 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!30311 thiss!1427)) key!909 (_keys!11549 thiss!1427) (mask!30311 thiss!1427)))))

(declare-fun b!1040031 () Bool)

(assert (=> b!1040031 (= e!588610 e!588613)))

(declare-fun c!105658 () Bool)

(assert (=> b!1040031 (= c!105658 (or (= lt!458348 key!909) (= (bvadd lt!458348 lt!458348) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1040032 () Bool)

(assert (=> b!1040032 (and (bvsge (index!41281 lt!458349) #b00000000000000000000000000000000) (bvslt (index!41281 lt!458349) (size!32050 (_keys!11549 thiss!1427))))))

(declare-fun res!693355 () Bool)

(assert (=> b!1040032 (= res!693355 (= (select (arr!31519 (_keys!11549 thiss!1427)) (index!41281 lt!458349)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1040032 (=> res!693355 e!588612)))

(declare-fun b!1040033 () Bool)

(assert (=> b!1040033 (= e!588610 (Intermediate!9727 true (toIndex!0 key!909 (mask!30311 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1040034 () Bool)

(assert (=> b!1040034 (and (bvsge (index!41281 lt!458349) #b00000000000000000000000000000000) (bvslt (index!41281 lt!458349) (size!32050 (_keys!11549 thiss!1427))))))

(assert (=> b!1040034 (= e!588612 (= (select (arr!31519 (_keys!11549 thiss!1427)) (index!41281 lt!458349)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1040035 () Bool)

(assert (=> b!1040035 (= e!588611 (bvsge (x!92652 lt!458349) #b01111111111111111111111111111110))))

(assert (= (and d!125839 c!105659) b!1040033))

(assert (= (and d!125839 (not c!105659)) b!1040031))

(assert (= (and b!1040031 c!105658) b!1040027))

(assert (= (and b!1040031 (not c!105658)) b!1040030))

(assert (= (and d!125839 c!105657) b!1040035))

(assert (= (and d!125839 (not c!105657)) b!1040029))

(assert (= (and b!1040029 res!693356) b!1040028))

(assert (= (and b!1040028 (not res!693357)) b!1040032))

(assert (= (and b!1040032 (not res!693355)) b!1040034))

(declare-fun m!960259 () Bool)

(assert (=> b!1040034 m!960259))

(assert (=> d!125839 m!960247))

(declare-fun m!960261 () Bool)

(assert (=> d!125839 m!960261))

(assert (=> d!125839 m!960137))

(assert (=> b!1040030 m!960247))

(declare-fun m!960263 () Bool)

(assert (=> b!1040030 m!960263))

(assert (=> b!1040030 m!960263))

(declare-fun m!960265 () Bool)

(assert (=> b!1040030 m!960265))

(assert (=> b!1040028 m!960259))

(assert (=> b!1040032 m!960259))

(assert (=> d!125835 d!125839))

(declare-fun d!125841 () Bool)

(declare-fun lt!458355 () (_ BitVec 32))

(declare-fun lt!458354 () (_ BitVec 32))

(assert (=> d!125841 (= lt!458355 (bvmul (bvxor lt!458354 (bvlshr lt!458354 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!125841 (= lt!458354 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!125841 (and (bvsge (mask!30311 thiss!1427) #b00000000000000000000000000000000) (let ((res!693358 (let ((h!23137 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!92670 (bvmul (bvxor h!23137 (bvlshr h!23137 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!92670 (bvlshr x!92670 #b00000000000000000000000000001101)) (mask!30311 thiss!1427)))))) (and (bvslt res!693358 (bvadd (mask!30311 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!693358 #b00000000000000000000000000000000))))))

(assert (=> d!125841 (= (toIndex!0 key!909 (mask!30311 thiss!1427)) (bvand (bvxor lt!458355 (bvlshr lt!458355 #b00000000000000000000000000001101)) (mask!30311 thiss!1427)))))

(assert (=> d!125835 d!125841))

(assert (=> d!125835 d!125825))

(declare-fun b!1040045 () Bool)

(declare-fun res!693370 () Bool)

(declare-fun e!588617 () Bool)

(assert (=> b!1040045 (=> (not res!693370) (not e!588617))))

(declare-fun size!32056 (LongMapFixedSize!5854) (_ BitVec 32))

(assert (=> b!1040045 (= res!693370 (bvsge (size!32056 thiss!1427) (_size!2982 thiss!1427)))))

(declare-fun b!1040047 () Bool)

(assert (=> b!1040047 (= e!588617 (and (bvsge (extraKeys!6037 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6037 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2982 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1040046 () Bool)

(declare-fun res!693367 () Bool)

(assert (=> b!1040046 (=> (not res!693367) (not e!588617))))

(assert (=> b!1040046 (= res!693367 (= (size!32056 thiss!1427) (bvadd (_size!2982 thiss!1427) (bvsdiv (bvadd (extraKeys!6037 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1040044 () Bool)

(declare-fun res!693368 () Bool)

(assert (=> b!1040044 (=> (not res!693368) (not e!588617))))

(assert (=> b!1040044 (= res!693368 (and (= (size!32051 (_values!6332 thiss!1427)) (bvadd (mask!30311 thiss!1427) #b00000000000000000000000000000001)) (= (size!32050 (_keys!11549 thiss!1427)) (size!32051 (_values!6332 thiss!1427))) (bvsge (_size!2982 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2982 thiss!1427) (bvadd (mask!30311 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun d!125843 () Bool)

(declare-fun res!693369 () Bool)

(assert (=> d!125843 (=> (not res!693369) (not e!588617))))

(assert (=> d!125843 (= res!693369 (validMask!0 (mask!30311 thiss!1427)))))

(assert (=> d!125843 (= (simpleValid!423 thiss!1427) e!588617)))

(assert (= (and d!125843 res!693369) b!1040044))

(assert (= (and b!1040044 res!693368) b!1040045))

(assert (= (and b!1040045 res!693370) b!1040046))

(assert (= (and b!1040046 res!693367) b!1040047))

(declare-fun m!960267 () Bool)

(assert (=> b!1040045 m!960267))

(assert (=> b!1040046 m!960267))

(assert (=> d!125843 m!960137))

(assert (=> d!125833 d!125843))

(assert (=> b!1039976 d!125831))

(declare-fun b!1040048 () Bool)

(declare-fun e!588619 () (_ BitVec 32))

(declare-fun call!44024 () (_ BitVec 32))

(assert (=> b!1040048 (= e!588619 call!44024)))

(declare-fun d!125845 () Bool)

(declare-fun lt!458356 () (_ BitVec 32))

(assert (=> d!125845 (and (bvsge lt!458356 #b00000000000000000000000000000000) (bvsle lt!458356 (bvsub (size!32050 lt!458294) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!588618 () (_ BitVec 32))

(assert (=> d!125845 (= lt!458356 e!588618)))

(declare-fun c!105661 () Bool)

(assert (=> d!125845 (= c!105661 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32050 (_keys!11549 thiss!1427))))))

(assert (=> d!125845 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32050 (_keys!11549 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32050 (_keys!11549 thiss!1427)) (size!32050 lt!458294)))))

(assert (=> d!125845 (= (arrayCountValidKeys!0 lt!458294 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32050 (_keys!11549 thiss!1427))) lt!458356)))

(declare-fun bm!44021 () Bool)

(assert (=> bm!44021 (= call!44024 (arrayCountValidKeys!0 lt!458294 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32050 (_keys!11549 thiss!1427))))))

(declare-fun b!1040049 () Bool)

(assert (=> b!1040049 (= e!588618 #b00000000000000000000000000000000)))

(declare-fun b!1040050 () Bool)

(assert (=> b!1040050 (= e!588619 (bvadd #b00000000000000000000000000000001 call!44024))))

(declare-fun b!1040051 () Bool)

(assert (=> b!1040051 (= e!588618 e!588619)))

(declare-fun c!105660 () Bool)

(assert (=> b!1040051 (= c!105660 (validKeyInArray!0 (select (arr!31519 lt!458294) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!125845 c!105661) b!1040049))

(assert (= (and d!125845 (not c!105661)) b!1040051))

(assert (= (and b!1040051 c!105660) b!1040050))

(assert (= (and b!1040051 (not c!105660)) b!1040048))

(assert (= (or b!1040050 b!1040048) bm!44021))

(declare-fun m!960269 () Bool)

(assert (=> bm!44021 m!960269))

(declare-fun m!960271 () Bool)

(assert (=> b!1040051 m!960271))

(assert (=> b!1040051 m!960271))

(declare-fun m!960273 () Bool)

(assert (=> b!1040051 m!960273))

(assert (=> bm!44018 d!125845))

(declare-fun b!1040060 () Bool)

(declare-fun e!588626 () Bool)

(declare-fun e!588628 () Bool)

(assert (=> b!1040060 (= e!588626 e!588628)))

(declare-fun lt!458365 () (_ BitVec 64))

(assert (=> b!1040060 (= lt!458365 (select (arr!31519 (_keys!11549 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!458364 () Unit!33979)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65499 (_ BitVec 64) (_ BitVec 32)) Unit!33979)

(assert (=> b!1040060 (= lt!458364 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11549 thiss!1427) lt!458365 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1040060 (arrayContainsKey!0 (_keys!11549 thiss!1427) lt!458365 #b00000000000000000000000000000000)))

(declare-fun lt!458363 () Unit!33979)

(assert (=> b!1040060 (= lt!458363 lt!458364)))

(declare-fun res!693375 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65499 (_ BitVec 32)) SeekEntryResult!9727)

(assert (=> b!1040060 (= res!693375 (= (seekEntryOrOpen!0 (select (arr!31519 (_keys!11549 thiss!1427)) #b00000000000000000000000000000000) (_keys!11549 thiss!1427) (mask!30311 thiss!1427)) (Found!9727 #b00000000000000000000000000000000)))))

(assert (=> b!1040060 (=> (not res!693375) (not e!588628))))

(declare-fun bm!44024 () Bool)

(declare-fun call!44027 () Bool)

(assert (=> bm!44024 (= call!44027 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11549 thiss!1427) (mask!30311 thiss!1427)))))

(declare-fun b!1040062 () Bool)

(declare-fun e!588627 () Bool)

(assert (=> b!1040062 (= e!588627 e!588626)))

(declare-fun c!105664 () Bool)

(assert (=> b!1040062 (= c!105664 (validKeyInArray!0 (select (arr!31519 (_keys!11549 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040063 () Bool)

(assert (=> b!1040063 (= e!588628 call!44027)))

(declare-fun b!1040061 () Bool)

(assert (=> b!1040061 (= e!588626 call!44027)))

(declare-fun d!125847 () Bool)

(declare-fun res!693376 () Bool)

(assert (=> d!125847 (=> res!693376 e!588627)))

(assert (=> d!125847 (= res!693376 (bvsge #b00000000000000000000000000000000 (size!32050 (_keys!11549 thiss!1427))))))

(assert (=> d!125847 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11549 thiss!1427) (mask!30311 thiss!1427)) e!588627)))

(assert (= (and d!125847 (not res!693376)) b!1040062))

(assert (= (and b!1040062 c!105664) b!1040060))

(assert (= (and b!1040062 (not c!105664)) b!1040061))

(assert (= (and b!1040060 res!693375) b!1040063))

(assert (= (or b!1040063 b!1040061) bm!44024))

(assert (=> b!1040060 m!960231))

(declare-fun m!960275 () Bool)

(assert (=> b!1040060 m!960275))

(declare-fun m!960277 () Bool)

(assert (=> b!1040060 m!960277))

(assert (=> b!1040060 m!960231))

(declare-fun m!960279 () Bool)

(assert (=> b!1040060 m!960279))

(declare-fun m!960281 () Bool)

(assert (=> bm!44024 m!960281))

(assert (=> b!1040062 m!960231))

(assert (=> b!1040062 m!960231))

(assert (=> b!1040062 m!960233))

(assert (=> b!1039977 d!125847))

(declare-fun b!1040064 () Bool)

(declare-fun e!588630 () (_ BitVec 32))

(declare-fun call!44028 () (_ BitVec 32))

(assert (=> b!1040064 (= e!588630 call!44028)))

(declare-fun d!125849 () Bool)

(declare-fun lt!458366 () (_ BitVec 32))

(assert (=> d!125849 (and (bvsge lt!458366 #b00000000000000000000000000000000) (bvsle lt!458366 (bvsub (size!32050 (array!65500 (store (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458293) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32050 (_keys!11549 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun e!588629 () (_ BitVec 32))

(assert (=> d!125849 (= lt!458366 e!588629)))

(declare-fun c!105666 () Bool)

(assert (=> d!125849 (= c!105666 (bvsge #b00000000000000000000000000000000 (size!32050 (_keys!11549 thiss!1427))))))

(assert (=> d!125849 (and (bvsle #b00000000000000000000000000000000 (size!32050 (_keys!11549 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32050 (_keys!11549 thiss!1427)) (size!32050 (array!65500 (store (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458293) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32050 (_keys!11549 thiss!1427))))))))

(assert (=> d!125849 (= (arrayCountValidKeys!0 (array!65500 (store (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458293) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32050 (_keys!11549 thiss!1427))) #b00000000000000000000000000000000 (size!32050 (_keys!11549 thiss!1427))) lt!458366)))

(declare-fun bm!44025 () Bool)

(assert (=> bm!44025 (= call!44028 (arrayCountValidKeys!0 (array!65500 (store (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458293) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32050 (_keys!11549 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32050 (_keys!11549 thiss!1427))))))

(declare-fun b!1040065 () Bool)

(assert (=> b!1040065 (= e!588629 #b00000000000000000000000000000000)))

(declare-fun b!1040066 () Bool)

(assert (=> b!1040066 (= e!588630 (bvadd #b00000000000000000000000000000001 call!44028))))

(declare-fun b!1040067 () Bool)

(assert (=> b!1040067 (= e!588629 e!588630)))

(declare-fun c!105665 () Bool)

(assert (=> b!1040067 (= c!105665 (validKeyInArray!0 (select (arr!31519 (array!65500 (store (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458293) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32050 (_keys!11549 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (= (and d!125849 c!105666) b!1040065))

(assert (= (and d!125849 (not c!105666)) b!1040067))

(assert (= (and b!1040067 c!105665) b!1040066))

(assert (= (and b!1040067 (not c!105665)) b!1040064))

(assert (= (or b!1040066 b!1040064) bm!44025))

(declare-fun m!960283 () Bool)

(assert (=> bm!44025 m!960283))

(declare-fun m!960285 () Bool)

(assert (=> b!1040067 m!960285))

(assert (=> b!1040067 m!960285))

(declare-fun m!960287 () Bool)

(assert (=> b!1040067 m!960287))

(assert (=> b!1039962 d!125849))

(assert (=> b!1039962 d!125831))

(declare-fun d!125851 () Bool)

(assert (=> d!125851 (= (validKeyInArray!0 (select (arr!31519 lt!458294) #b00000000000000000000000000000000)) (and (not (= (select (arr!31519 lt!458294) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31519 lt!458294) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1039938 d!125851))

(declare-fun d!125853 () Bool)

(assert (=> d!125853 (arrayNoDuplicates!0 (array!65500 (store (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458293) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32050 (_keys!11549 thiss!1427))) #b00000000000000000000000000000000 Nil!21923)))

(assert (=> d!125853 true))

(declare-fun _$66!44 () Unit!33979)

(assert (=> d!125853 (= (choose!53 (_keys!11549 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41280 lt!458293) #b00000000000000000000000000000000 Nil!21923) _$66!44)))

(declare-fun bs!30426 () Bool)

(assert (= bs!30426 d!125853))

(assert (=> bs!30426 m!960141))

(assert (=> bs!30426 m!960227))

(assert (=> d!125829 d!125853))

(declare-fun d!125855 () Bool)

(assert (=> d!125855 (= (validKeyInArray!0 (select (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458293))) (and (not (= (select (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458293)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458293)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1039959 d!125855))

(declare-fun d!125857 () Bool)

(declare-fun lt!458369 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!522 (List!21926) (InoxSet (_ BitVec 64)))

(assert (=> d!125857 (= lt!458369 (select (content!522 Nil!21923) (select (arr!31519 lt!458294) #b00000000000000000000000000000000)))))

(declare-fun e!588636 () Bool)

(assert (=> d!125857 (= lt!458369 e!588636)))

(declare-fun res!693381 () Bool)

(assert (=> d!125857 (=> (not res!693381) (not e!588636))))

(assert (=> d!125857 (= res!693381 ((_ is Cons!21922) Nil!21923))))

(assert (=> d!125857 (= (contains!6065 Nil!21923 (select (arr!31519 lt!458294) #b00000000000000000000000000000000)) lt!458369)))

(declare-fun b!1040072 () Bool)

(declare-fun e!588635 () Bool)

(assert (=> b!1040072 (= e!588636 e!588635)))

(declare-fun res!693382 () Bool)

(assert (=> b!1040072 (=> res!693382 e!588635)))

(assert (=> b!1040072 (= res!693382 (= (h!23134 Nil!21923) (select (arr!31519 lt!458294) #b00000000000000000000000000000000)))))

(declare-fun b!1040073 () Bool)

(assert (=> b!1040073 (= e!588635 (contains!6065 (t!31132 Nil!21923) (select (arr!31519 lt!458294) #b00000000000000000000000000000000)))))

(assert (= (and d!125857 res!693381) b!1040072))

(assert (= (and b!1040072 (not res!693382)) b!1040073))

(declare-fun m!960289 () Bool)

(assert (=> d!125857 m!960289))

(assert (=> d!125857 m!960205))

(declare-fun m!960291 () Bool)

(assert (=> d!125857 m!960291))

(assert (=> b!1040073 m!960205))

(declare-fun m!960293 () Bool)

(assert (=> b!1040073 m!960293))

(assert (=> b!1039935 d!125857))

(declare-fun b!1040086 () Bool)

(declare-fun e!588643 () SeekEntryResult!9727)

(declare-fun e!588644 () SeekEntryResult!9727)

(assert (=> b!1040086 (= e!588643 e!588644)))

(declare-fun c!105673 () Bool)

(declare-fun lt!458375 () (_ BitVec 64))

(assert (=> b!1040086 (= c!105673 (= lt!458375 key!909))))

(declare-fun b!1040087 () Bool)

(assert (=> b!1040087 (= e!588644 (Found!9727 (index!41281 lt!458342)))))

(declare-fun b!1040088 () Bool)

(assert (=> b!1040088 (= e!588643 Undefined!9727)))

(declare-fun e!588645 () SeekEntryResult!9727)

(declare-fun b!1040089 () Bool)

(assert (=> b!1040089 (= e!588645 (seekKeyOrZeroReturnVacant!0 (bvadd (x!92652 lt!458342) #b00000000000000000000000000000001) (nextIndex!0 (index!41281 lt!458342) (bvadd (x!92652 lt!458342) #b00000000000000000000000000000001) (mask!30311 thiss!1427)) (index!41281 lt!458342) key!909 (_keys!11549 thiss!1427) (mask!30311 thiss!1427)))))

(declare-fun b!1040090 () Bool)

(declare-fun c!105674 () Bool)

(assert (=> b!1040090 (= c!105674 (= lt!458375 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1040090 (= e!588644 e!588645)))

(declare-fun d!125859 () Bool)

(declare-fun lt!458374 () SeekEntryResult!9727)

(assert (=> d!125859 (and (or ((_ is Undefined!9727) lt!458374) (not ((_ is Found!9727) lt!458374)) (and (bvsge (index!41280 lt!458374) #b00000000000000000000000000000000) (bvslt (index!41280 lt!458374) (size!32050 (_keys!11549 thiss!1427))))) (or ((_ is Undefined!9727) lt!458374) ((_ is Found!9727) lt!458374) (not ((_ is MissingVacant!9727) lt!458374)) (not (= (index!41282 lt!458374) (index!41281 lt!458342))) (and (bvsge (index!41282 lt!458374) #b00000000000000000000000000000000) (bvslt (index!41282 lt!458374) (size!32050 (_keys!11549 thiss!1427))))) (or ((_ is Undefined!9727) lt!458374) (ite ((_ is Found!9727) lt!458374) (= (select (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458374)) key!909) (and ((_ is MissingVacant!9727) lt!458374) (= (index!41282 lt!458374) (index!41281 lt!458342)) (= (select (arr!31519 (_keys!11549 thiss!1427)) (index!41282 lt!458374)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!125859 (= lt!458374 e!588643)))

(declare-fun c!105675 () Bool)

(assert (=> d!125859 (= c!105675 (bvsge (x!92652 lt!458342) #b01111111111111111111111111111110))))

(assert (=> d!125859 (= lt!458375 (select (arr!31519 (_keys!11549 thiss!1427)) (index!41281 lt!458342)))))

(assert (=> d!125859 (validMask!0 (mask!30311 thiss!1427))))

(assert (=> d!125859 (= (seekKeyOrZeroReturnVacant!0 (x!92652 lt!458342) (index!41281 lt!458342) (index!41281 lt!458342) key!909 (_keys!11549 thiss!1427) (mask!30311 thiss!1427)) lt!458374)))

(declare-fun b!1040091 () Bool)

(assert (=> b!1040091 (= e!588645 (MissingVacant!9727 (index!41281 lt!458342)))))

(assert (= (and d!125859 c!105675) b!1040088))

(assert (= (and d!125859 (not c!105675)) b!1040086))

(assert (= (and b!1040086 c!105673) b!1040087))

(assert (= (and b!1040086 (not c!105673)) b!1040090))

(assert (= (and b!1040090 c!105674) b!1040091))

(assert (= (and b!1040090 (not c!105674)) b!1040089))

(declare-fun m!960295 () Bool)

(assert (=> b!1040089 m!960295))

(assert (=> b!1040089 m!960295))

(declare-fun m!960297 () Bool)

(assert (=> b!1040089 m!960297))

(declare-fun m!960299 () Bool)

(assert (=> d!125859 m!960299))

(declare-fun m!960301 () Bool)

(assert (=> d!125859 m!960301))

(assert (=> d!125859 m!960243))

(assert (=> d!125859 m!960137))

(assert (=> b!1039991 d!125859))

(declare-fun d!125861 () Bool)

(assert (=> d!125861 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1039960 d!125861))

(declare-fun b!1040092 () Bool)

(declare-fun e!588646 () Bool)

(declare-fun e!588649 () Bool)

(assert (=> b!1040092 (= e!588646 e!588649)))

(declare-fun res!693384 () Bool)

(assert (=> b!1040092 (=> (not res!693384) (not e!588649))))

(declare-fun e!588647 () Bool)

(assert (=> b!1040092 (= res!693384 (not e!588647))))

(declare-fun res!693383 () Bool)

(assert (=> b!1040092 (=> (not res!693383) (not e!588647))))

(assert (=> b!1040092 (= res!693383 (validKeyInArray!0 (select (arr!31519 (array!65500 (store (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458293) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32050 (_keys!11549 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1040093 () Bool)

(assert (=> b!1040093 (= e!588647 (contains!6065 Nil!21923 (select (arr!31519 (array!65500 (store (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458293) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32050 (_keys!11549 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1040094 () Bool)

(declare-fun e!588648 () Bool)

(declare-fun call!44029 () Bool)

(assert (=> b!1040094 (= e!588648 call!44029)))

(declare-fun c!105676 () Bool)

(declare-fun bm!44026 () Bool)

(assert (=> bm!44026 (= call!44029 (arrayNoDuplicates!0 (array!65500 (store (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458293) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32050 (_keys!11549 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105676 (Cons!21922 (select (arr!31519 (array!65500 (store (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458293) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32050 (_keys!11549 thiss!1427)))) #b00000000000000000000000000000000) Nil!21923) Nil!21923)))))

(declare-fun d!125863 () Bool)

(declare-fun res!693385 () Bool)

(assert (=> d!125863 (=> res!693385 e!588646)))

(assert (=> d!125863 (= res!693385 (bvsge #b00000000000000000000000000000000 (size!32050 (array!65500 (store (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458293) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32050 (_keys!11549 thiss!1427))))))))

(assert (=> d!125863 (= (arrayNoDuplicates!0 (array!65500 (store (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458293) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32050 (_keys!11549 thiss!1427))) #b00000000000000000000000000000000 Nil!21923) e!588646)))

(declare-fun b!1040095 () Bool)

(assert (=> b!1040095 (= e!588648 call!44029)))

(declare-fun b!1040096 () Bool)

(assert (=> b!1040096 (= e!588649 e!588648)))

(assert (=> b!1040096 (= c!105676 (validKeyInArray!0 (select (arr!31519 (array!65500 (store (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458293) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32050 (_keys!11549 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (= (and d!125863 (not res!693385)) b!1040092))

(assert (= (and b!1040092 res!693383) b!1040093))

(assert (= (and b!1040092 res!693384) b!1040096))

(assert (= (and b!1040096 c!105676) b!1040095))

(assert (= (and b!1040096 (not c!105676)) b!1040094))

(assert (= (or b!1040095 b!1040094) bm!44026))

(assert (=> b!1040092 m!960285))

(assert (=> b!1040092 m!960285))

(assert (=> b!1040092 m!960287))

(assert (=> b!1040093 m!960285))

(assert (=> b!1040093 m!960285))

(declare-fun m!960303 () Bool)

(assert (=> b!1040093 m!960303))

(assert (=> bm!44026 m!960285))

(declare-fun m!960305 () Bool)

(assert (=> bm!44026 m!960305))

(assert (=> b!1040096 m!960285))

(assert (=> b!1040096 m!960285))

(assert (=> b!1040096 m!960287))

(assert (=> b!1039965 d!125863))

(declare-fun b!1040097 () Bool)

(declare-fun e!588650 () Bool)

(declare-fun e!588653 () Bool)

(assert (=> b!1040097 (= e!588650 e!588653)))

(declare-fun res!693387 () Bool)

(assert (=> b!1040097 (=> (not res!693387) (not e!588653))))

(declare-fun e!588651 () Bool)

(assert (=> b!1040097 (= res!693387 (not e!588651))))

(declare-fun res!693386 () Bool)

(assert (=> b!1040097 (=> (not res!693386) (not e!588651))))

(assert (=> b!1040097 (= res!693386 (validKeyInArray!0 (select (arr!31519 lt!458294) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1040098 () Bool)

(assert (=> b!1040098 (= e!588651 (contains!6065 (ite c!105631 (Cons!21922 (select (arr!31519 lt!458294) #b00000000000000000000000000000000) Nil!21923) Nil!21923) (select (arr!31519 lt!458294) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1040099 () Bool)

(declare-fun e!588652 () Bool)

(declare-fun call!44030 () Bool)

(assert (=> b!1040099 (= e!588652 call!44030)))

(declare-fun bm!44027 () Bool)

(declare-fun c!105677 () Bool)

(assert (=> bm!44027 (= call!44030 (arrayNoDuplicates!0 lt!458294 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!105677 (Cons!21922 (select (arr!31519 lt!458294) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!105631 (Cons!21922 (select (arr!31519 lt!458294) #b00000000000000000000000000000000) Nil!21923) Nil!21923)) (ite c!105631 (Cons!21922 (select (arr!31519 lt!458294) #b00000000000000000000000000000000) Nil!21923) Nil!21923))))))

(declare-fun d!125865 () Bool)

(declare-fun res!693388 () Bool)

(assert (=> d!125865 (=> res!693388 e!588650)))

(assert (=> d!125865 (= res!693388 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32050 lt!458294)))))

(assert (=> d!125865 (= (arrayNoDuplicates!0 lt!458294 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105631 (Cons!21922 (select (arr!31519 lt!458294) #b00000000000000000000000000000000) Nil!21923) Nil!21923)) e!588650)))

(declare-fun b!1040100 () Bool)

(assert (=> b!1040100 (= e!588652 call!44030)))

(declare-fun b!1040101 () Bool)

(assert (=> b!1040101 (= e!588653 e!588652)))

(assert (=> b!1040101 (= c!105677 (validKeyInArray!0 (select (arr!31519 lt!458294) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!125865 (not res!693388)) b!1040097))

(assert (= (and b!1040097 res!693386) b!1040098))

(assert (= (and b!1040097 res!693387) b!1040101))

(assert (= (and b!1040101 c!105677) b!1040100))

(assert (= (and b!1040101 (not c!105677)) b!1040099))

(assert (= (or b!1040100 b!1040099) bm!44027))

(assert (=> b!1040097 m!960271))

(assert (=> b!1040097 m!960271))

(assert (=> b!1040097 m!960273))

(assert (=> b!1040098 m!960271))

(assert (=> b!1040098 m!960271))

(declare-fun m!960307 () Bool)

(assert (=> b!1040098 m!960307))

(assert (=> bm!44027 m!960271))

(declare-fun m!960309 () Bool)

(assert (=> bm!44027 m!960309))

(assert (=> b!1040101 m!960271))

(assert (=> b!1040101 m!960271))

(assert (=> b!1040101 m!960273))

(assert (=> bm!44015 d!125865))

(declare-fun d!125867 () Bool)

(assert (=> d!125867 (= (arrayCountValidKeys!0 (array!65500 (store (arr!31519 (_keys!11549 thiss!1427)) (index!41280 lt!458293) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32050 (_keys!11549 thiss!1427))) #b00000000000000000000000000000000 (size!32050 (_keys!11549 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11549 thiss!1427) #b00000000000000000000000000000000 (size!32050 (_keys!11549 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!125867 true))

(declare-fun _$79!20 () Unit!33979)

(assert (=> d!125867 (= (choose!82 (_keys!11549 thiss!1427) (index!41280 lt!458293) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!20)))

(declare-fun bs!30427 () Bool)

(assert (= bs!30427 d!125867))

(assert (=> bs!30427 m!960141))

(assert (=> bs!30427 m!960223))

(assert (=> bs!30427 m!960139))

(assert (=> d!125827 d!125867))

(declare-fun b!1040102 () Bool)

(declare-fun e!588654 () Bool)

(declare-fun e!588657 () Bool)

(assert (=> b!1040102 (= e!588654 e!588657)))

(declare-fun res!693390 () Bool)

(assert (=> b!1040102 (=> (not res!693390) (not e!588657))))

(declare-fun e!588655 () Bool)

(assert (=> b!1040102 (= res!693390 (not e!588655))))

(declare-fun res!693389 () Bool)

(assert (=> b!1040102 (=> (not res!693389) (not e!588655))))

(assert (=> b!1040102 (= res!693389 (validKeyInArray!0 (select (arr!31519 (_keys!11549 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040103 () Bool)

(assert (=> b!1040103 (= e!588655 (contains!6065 Nil!21923 (select (arr!31519 (_keys!11549 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040104 () Bool)

(declare-fun e!588656 () Bool)

(declare-fun call!44031 () Bool)

(assert (=> b!1040104 (= e!588656 call!44031)))

(declare-fun bm!44028 () Bool)

(declare-fun c!105678 () Bool)

(assert (=> bm!44028 (= call!44031 (arrayNoDuplicates!0 (_keys!11549 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105678 (Cons!21922 (select (arr!31519 (_keys!11549 thiss!1427)) #b00000000000000000000000000000000) Nil!21923) Nil!21923)))))

(declare-fun d!125869 () Bool)

(declare-fun res!693391 () Bool)

(assert (=> d!125869 (=> res!693391 e!588654)))

(assert (=> d!125869 (= res!693391 (bvsge #b00000000000000000000000000000000 (size!32050 (_keys!11549 thiss!1427))))))

(assert (=> d!125869 (= (arrayNoDuplicates!0 (_keys!11549 thiss!1427) #b00000000000000000000000000000000 Nil!21923) e!588654)))

(declare-fun b!1040105 () Bool)

(assert (=> b!1040105 (= e!588656 call!44031)))

(declare-fun b!1040106 () Bool)

(assert (=> b!1040106 (= e!588657 e!588656)))

(assert (=> b!1040106 (= c!105678 (validKeyInArray!0 (select (arr!31519 (_keys!11549 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125869 (not res!693391)) b!1040102))

(assert (= (and b!1040102 res!693389) b!1040103))

(assert (= (and b!1040102 res!693390) b!1040106))

(assert (= (and b!1040106 c!105678) b!1040105))

(assert (= (and b!1040106 (not c!105678)) b!1040104))

(assert (= (or b!1040105 b!1040104) bm!44028))

(assert (=> b!1040102 m!960231))

(assert (=> b!1040102 m!960231))

(assert (=> b!1040102 m!960233))

(assert (=> b!1040103 m!960231))

(assert (=> b!1040103 m!960231))

(declare-fun m!960311 () Bool)

(assert (=> b!1040103 m!960311))

(assert (=> bm!44028 m!960231))

(declare-fun m!960313 () Bool)

(assert (=> bm!44028 m!960313))

(assert (=> b!1040106 m!960231))

(assert (=> b!1040106 m!960231))

(assert (=> b!1040106 m!960233))

(assert (=> b!1039978 d!125869))

(declare-fun d!125871 () Bool)

(assert (=> d!125871 (= (validKeyInArray!0 (select (arr!31519 (_keys!11549 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31519 (_keys!11549 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31519 (_keys!11549 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1039969 d!125871))

(assert (=> b!1039950 d!125851))

(assert (=> b!1039934 d!125851))

(declare-fun b!1040108 () Bool)

(declare-fun e!588658 () Bool)

(assert (=> b!1040108 (= e!588658 tp_is_empty!24667)))

(declare-fun condMapEmpty!38557 () Bool)

(declare-fun mapDefault!38557 () ValueCell!11630)

(assert (=> mapNonEmpty!38556 (= condMapEmpty!38557 (= mapRest!38556 ((as const (Array (_ BitVec 32) ValueCell!11630)) mapDefault!38557)))))

(declare-fun mapRes!38557 () Bool)

(assert (=> mapNonEmpty!38556 (= tp!74020 (and e!588658 mapRes!38557))))

(declare-fun b!1040107 () Bool)

(declare-fun e!588659 () Bool)

(assert (=> b!1040107 (= e!588659 tp_is_empty!24667)))

(declare-fun mapIsEmpty!38557 () Bool)

(assert (=> mapIsEmpty!38557 mapRes!38557))

(declare-fun mapNonEmpty!38557 () Bool)

(declare-fun tp!74021 () Bool)

(assert (=> mapNonEmpty!38557 (= mapRes!38557 (and tp!74021 e!588659))))

(declare-fun mapValue!38557 () ValueCell!11630)

(declare-fun mapKey!38557 () (_ BitVec 32))

(declare-fun mapRest!38557 () (Array (_ BitVec 32) ValueCell!11630))

(assert (=> mapNonEmpty!38557 (= mapRest!38556 (store mapRest!38557 mapKey!38557 mapValue!38557))))

(assert (= (and mapNonEmpty!38556 condMapEmpty!38557) mapIsEmpty!38557))

(assert (= (and mapNonEmpty!38556 (not condMapEmpty!38557)) mapNonEmpty!38557))

(assert (= (and mapNonEmpty!38557 ((_ is ValueCellFull!11630) mapValue!38557)) b!1040107))

(assert (= (and mapNonEmpty!38556 ((_ is ValueCellFull!11630) mapDefault!38557)) b!1040108))

(declare-fun m!960315 () Bool)

(assert (=> mapNonEmpty!38557 m!960315))

(check-sat (not d!125867) (not d!125843) (not b!1040046) (not bm!44025) (not b!1040051) (not b_next!20947) (not b!1040097) (not b!1040008) (not b!1040106) (not b!1040101) (not d!125857) (not b!1040098) (not bm!44026) (not d!125859) (not bm!44024) (not d!125853) (not b!1040067) (not bm!44020) (not b!1040073) (not mapNonEmpty!38557) (not b!1040096) (not b!1040093) (not b!1040102) (not d!125839) (not b!1040092) tp_is_empty!24667 (not b!1040103) b_and!33489 (not b!1040089) (not b!1040060) (not bm!44028) (not b!1040062) (not b!1040030) (not bm!44027) (not bm!44021) (not b!1040045))
(check-sat b_and!33489 (not b_next!20947))
