; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90758 () Bool)

(assert start!90758)

(declare-fun b!1037505 () Bool)

(declare-fun b_free!20911 () Bool)

(declare-fun b_next!20911 () Bool)

(assert (=> b!1037505 (= b_free!20911 (not b_next!20911))))

(declare-fun tp!73884 () Bool)

(declare-fun b_and!33417 () Bool)

(assert (=> b!1037505 (= tp!73884 b_and!33417)))

(declare-fun res!692208 () Bool)

(declare-fun e!586923 () Bool)

(assert (=> start!90758 (=> (not res!692208) (not e!586923))))

(declare-datatypes ((V!37715 0))(
  ( (V!37716 (val!12366 Int)) )
))
(declare-datatypes ((ValueCell!11612 0))(
  ( (ValueCellFull!11612 (v!14948 V!37715)) (EmptyCell!11612) )
))
(declare-datatypes ((array!65309 0))(
  ( (array!65310 (arr!31434 (Array (_ BitVec 32) (_ BitVec 64))) (size!31966 (_ BitVec 32))) )
))
(declare-datatypes ((array!65311 0))(
  ( (array!65312 (arr!31435 (Array (_ BitVec 32) ValueCell!11612)) (size!31967 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5818 0))(
  ( (LongMapFixedSize!5819 (defaultEntry!6291 Int) (mask!30211 (_ BitVec 32)) (extraKeys!6019 (_ BitVec 32)) (zeroValue!6125 V!37715) (minValue!6125 V!37715) (_size!2964 (_ BitVec 32)) (_keys!11485 array!65309) (_values!6314 array!65311) (_vacant!2964 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5818)

(declare-fun valid!2185 (LongMapFixedSize!5818) Bool)

(assert (=> start!90758 (= res!692208 (valid!2185 thiss!1427))))

(assert (=> start!90758 e!586923))

(declare-fun e!586928 () Bool)

(assert (=> start!90758 e!586928))

(assert (=> start!90758 true))

(declare-fun mapNonEmpty!38481 () Bool)

(declare-fun mapRes!38481 () Bool)

(declare-fun tp!73885 () Bool)

(declare-fun e!586930 () Bool)

(assert (=> mapNonEmpty!38481 (= mapRes!38481 (and tp!73885 e!586930))))

(declare-fun mapValue!38481 () ValueCell!11612)

(declare-fun mapKey!38481 () (_ BitVec 32))

(declare-fun mapRest!38481 () (Array (_ BitVec 32) ValueCell!11612))

(assert (=> mapNonEmpty!38481 (= (arr!31435 (_values!6314 thiss!1427)) (store mapRest!38481 mapKey!38481 mapValue!38481))))

(declare-fun b!1037497 () Bool)

(declare-fun e!586922 () Bool)

(assert (=> b!1037497 (= e!586923 e!586922)))

(declare-fun res!692210 () Bool)

(assert (=> b!1037497 (=> (not res!692210) (not e!586922))))

(declare-datatypes ((SeekEntryResult!9751 0))(
  ( (MissingZero!9751 (index!41375 (_ BitVec 32))) (Found!9751 (index!41376 (_ BitVec 32))) (Intermediate!9751 (undefined!10563 Bool) (index!41377 (_ BitVec 32)) (x!92571 (_ BitVec 32))) (Undefined!9751) (MissingVacant!9751 (index!41378 (_ BitVec 32))) )
))
(declare-fun lt!457348 () SeekEntryResult!9751)

(get-info :version)

(assert (=> b!1037497 (= res!692210 ((_ is Found!9751) lt!457348))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65309 (_ BitVec 32)) SeekEntryResult!9751)

(assert (=> b!1037497 (= lt!457348 (seekEntry!0 key!909 (_keys!11485 thiss!1427) (mask!30211 thiss!1427)))))

(declare-fun b!1037498 () Bool)

(declare-fun e!586929 () Bool)

(declare-fun e!586925 () Bool)

(assert (=> b!1037498 (= e!586929 e!586925)))

(declare-fun res!692209 () Bool)

(assert (=> b!1037498 (=> (not res!692209) (not e!586925))))

(declare-datatypes ((List!21959 0))(
  ( (Nil!21956) (Cons!21955 (h!23158 (_ BitVec 64)) (t!31164 List!21959)) )
))
(declare-fun contains!6006 (List!21959 (_ BitVec 64)) Bool)

(assert (=> b!1037498 (= res!692209 (not (contains!6006 Nil!21956 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1037499 () Bool)

(declare-fun e!586927 () Bool)

(declare-fun e!586926 () Bool)

(assert (=> b!1037499 (= e!586927 (and e!586926 mapRes!38481))))

(declare-fun condMapEmpty!38481 () Bool)

(declare-fun mapDefault!38481 () ValueCell!11612)

(assert (=> b!1037499 (= condMapEmpty!38481 (= (arr!31435 (_values!6314 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11612)) mapDefault!38481)))))

(declare-fun b!1037500 () Bool)

(assert (=> b!1037500 (= e!586922 (not e!586929))))

(declare-fun res!692213 () Bool)

(assert (=> b!1037500 (=> res!692213 e!586929)))

(assert (=> b!1037500 (= res!692213 (or (bvsge (size!31966 (_keys!11485 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31966 (_keys!11485 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!65309 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037500 (= (arrayCountValidKeys!0 (array!65310 (store (arr!31434 (_keys!11485 thiss!1427)) (index!41376 lt!457348) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31966 (_keys!11485 thiss!1427))) #b00000000000000000000000000000000 (size!31966 (_keys!11485 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11485 thiss!1427) #b00000000000000000000000000000000 (size!31966 (_keys!11485 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33839 0))(
  ( (Unit!33840) )
))
(declare-fun lt!457349 () Unit!33839)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65309 (_ BitVec 32) (_ BitVec 64)) Unit!33839)

(assert (=> b!1037500 (= lt!457349 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11485 thiss!1427) (index!41376 lt!457348) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037501 () Bool)

(assert (=> b!1037501 (= e!586925 (not (contains!6006 Nil!21956 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1037502 () Bool)

(declare-fun tp_is_empty!24631 () Bool)

(assert (=> b!1037502 (= e!586930 tp_is_empty!24631)))

(declare-fun b!1037503 () Bool)

(declare-fun res!692211 () Bool)

(assert (=> b!1037503 (=> (not res!692211) (not e!586923))))

(assert (=> b!1037503 (= res!692211 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1037504 () Bool)

(assert (=> b!1037504 (= e!586926 tp_is_empty!24631)))

(declare-fun array_inv!24309 (array!65309) Bool)

(declare-fun array_inv!24310 (array!65311) Bool)

(assert (=> b!1037505 (= e!586928 (and tp!73884 tp_is_empty!24631 (array_inv!24309 (_keys!11485 thiss!1427)) (array_inv!24310 (_values!6314 thiss!1427)) e!586927))))

(declare-fun b!1037506 () Bool)

(declare-fun res!692212 () Bool)

(assert (=> b!1037506 (=> res!692212 e!586929)))

(declare-fun noDuplicate!1488 (List!21959) Bool)

(assert (=> b!1037506 (= res!692212 (not (noDuplicate!1488 Nil!21956)))))

(declare-fun mapIsEmpty!38481 () Bool)

(assert (=> mapIsEmpty!38481 mapRes!38481))

(assert (= (and start!90758 res!692208) b!1037503))

(assert (= (and b!1037503 res!692211) b!1037497))

(assert (= (and b!1037497 res!692210) b!1037500))

(assert (= (and b!1037500 (not res!692213)) b!1037506))

(assert (= (and b!1037506 (not res!692212)) b!1037498))

(assert (= (and b!1037498 res!692209) b!1037501))

(assert (= (and b!1037499 condMapEmpty!38481) mapIsEmpty!38481))

(assert (= (and b!1037499 (not condMapEmpty!38481)) mapNonEmpty!38481))

(assert (= (and mapNonEmpty!38481 ((_ is ValueCellFull!11612) mapValue!38481)) b!1037502))

(assert (= (and b!1037499 ((_ is ValueCellFull!11612) mapDefault!38481)) b!1037504))

(assert (= b!1037505 b!1037499))

(assert (= start!90758 b!1037505))

(declare-fun m!957179 () Bool)

(assert (=> b!1037497 m!957179))

(declare-fun m!957181 () Bool)

(assert (=> b!1037505 m!957181))

(declare-fun m!957183 () Bool)

(assert (=> b!1037505 m!957183))

(declare-fun m!957185 () Bool)

(assert (=> b!1037501 m!957185))

(declare-fun m!957187 () Bool)

(assert (=> start!90758 m!957187))

(declare-fun m!957189 () Bool)

(assert (=> b!1037500 m!957189))

(declare-fun m!957191 () Bool)

(assert (=> b!1037500 m!957191))

(declare-fun m!957193 () Bool)

(assert (=> b!1037500 m!957193))

(declare-fun m!957195 () Bool)

(assert (=> b!1037500 m!957195))

(declare-fun m!957197 () Bool)

(assert (=> mapNonEmpty!38481 m!957197))

(declare-fun m!957199 () Bool)

(assert (=> b!1037498 m!957199))

(declare-fun m!957201 () Bool)

(assert (=> b!1037506 m!957201))

(check-sat (not b!1037497) (not b!1037500) (not b!1037505) (not b!1037501) (not b_next!20911) (not mapNonEmpty!38481) (not b!1037506) (not start!90758) (not b!1037498) b_and!33417 tp_is_empty!24631)
(check-sat b_and!33417 (not b_next!20911))
(get-model)

(declare-fun d!125109 () Bool)

(assert (=> d!125109 (= (array_inv!24309 (_keys!11485 thiss!1427)) (bvsge (size!31966 (_keys!11485 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037505 d!125109))

(declare-fun d!125111 () Bool)

(assert (=> d!125111 (= (array_inv!24310 (_values!6314 thiss!1427)) (bvsge (size!31967 (_values!6314 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037505 d!125111))

(declare-fun d!125113 () Bool)

(declare-fun lt!457364 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!516 (List!21959) (InoxSet (_ BitVec 64)))

(assert (=> d!125113 (= lt!457364 (select (content!516 Nil!21956) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586990 () Bool)

(assert (=> d!125113 (= lt!457364 e!586990)))

(declare-fun res!692254 () Bool)

(assert (=> d!125113 (=> (not res!692254) (not e!586990))))

(assert (=> d!125113 (= res!692254 ((_ is Cons!21955) Nil!21956))))

(assert (=> d!125113 (= (contains!6006 Nil!21956 #b0000000000000000000000000000000000000000000000000000000000000000) lt!457364)))

(declare-fun b!1037571 () Bool)

(declare-fun e!586989 () Bool)

(assert (=> b!1037571 (= e!586990 e!586989)))

(declare-fun res!692255 () Bool)

(assert (=> b!1037571 (=> res!692255 e!586989)))

(assert (=> b!1037571 (= res!692255 (= (h!23158 Nil!21956) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037572 () Bool)

(assert (=> b!1037572 (= e!586989 (contains!6006 (t!31164 Nil!21956) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125113 res!692254) b!1037571))

(assert (= (and b!1037571 (not res!692255)) b!1037572))

(declare-fun m!957251 () Bool)

(assert (=> d!125113 m!957251))

(declare-fun m!957253 () Bool)

(assert (=> d!125113 m!957253))

(declare-fun m!957255 () Bool)

(assert (=> b!1037572 m!957255))

(assert (=> b!1037498 d!125113))

(declare-fun b!1037585 () Bool)

(declare-fun e!586997 () SeekEntryResult!9751)

(declare-fun e!586999 () SeekEntryResult!9751)

(assert (=> b!1037585 (= e!586997 e!586999)))

(declare-fun lt!457375 () (_ BitVec 64))

(declare-fun lt!457376 () SeekEntryResult!9751)

(assert (=> b!1037585 (= lt!457375 (select (arr!31434 (_keys!11485 thiss!1427)) (index!41377 lt!457376)))))

(declare-fun c!105111 () Bool)

(assert (=> b!1037585 (= c!105111 (= lt!457375 key!909))))

(declare-fun b!1037586 () Bool)

(assert (=> b!1037586 (= e!586999 (Found!9751 (index!41377 lt!457376)))))

(declare-fun b!1037587 () Bool)

(declare-fun e!586998 () SeekEntryResult!9751)

(assert (=> b!1037587 (= e!586998 (MissingZero!9751 (index!41377 lt!457376)))))

(declare-fun d!125115 () Bool)

(declare-fun lt!457373 () SeekEntryResult!9751)

(assert (=> d!125115 (and (or ((_ is MissingVacant!9751) lt!457373) (not ((_ is Found!9751) lt!457373)) (and (bvsge (index!41376 lt!457373) #b00000000000000000000000000000000) (bvslt (index!41376 lt!457373) (size!31966 (_keys!11485 thiss!1427))))) (not ((_ is MissingVacant!9751) lt!457373)) (or (not ((_ is Found!9751) lt!457373)) (= (select (arr!31434 (_keys!11485 thiss!1427)) (index!41376 lt!457373)) key!909)))))

(assert (=> d!125115 (= lt!457373 e!586997)))

(declare-fun c!105109 () Bool)

(assert (=> d!125115 (= c!105109 (and ((_ is Intermediate!9751) lt!457376) (undefined!10563 lt!457376)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65309 (_ BitVec 32)) SeekEntryResult!9751)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125115 (= lt!457376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30211 thiss!1427)) key!909 (_keys!11485 thiss!1427) (mask!30211 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125115 (validMask!0 (mask!30211 thiss!1427))))

(assert (=> d!125115 (= (seekEntry!0 key!909 (_keys!11485 thiss!1427) (mask!30211 thiss!1427)) lt!457373)))

(declare-fun b!1037588 () Bool)

(declare-fun lt!457374 () SeekEntryResult!9751)

(assert (=> b!1037588 (= e!586998 (ite ((_ is MissingVacant!9751) lt!457374) (MissingZero!9751 (index!41378 lt!457374)) lt!457374))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65309 (_ BitVec 32)) SeekEntryResult!9751)

(assert (=> b!1037588 (= lt!457374 (seekKeyOrZeroReturnVacant!0 (x!92571 lt!457376) (index!41377 lt!457376) (index!41377 lt!457376) key!909 (_keys!11485 thiss!1427) (mask!30211 thiss!1427)))))

(declare-fun b!1037589 () Bool)

(declare-fun c!105110 () Bool)

(assert (=> b!1037589 (= c!105110 (= lt!457375 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1037589 (= e!586999 e!586998)))

(declare-fun b!1037590 () Bool)

(assert (=> b!1037590 (= e!586997 Undefined!9751)))

(assert (= (and d!125115 c!105109) b!1037590))

(assert (= (and d!125115 (not c!105109)) b!1037585))

(assert (= (and b!1037585 c!105111) b!1037586))

(assert (= (and b!1037585 (not c!105111)) b!1037589))

(assert (= (and b!1037589 c!105110) b!1037587))

(assert (= (and b!1037589 (not c!105110)) b!1037588))

(declare-fun m!957257 () Bool)

(assert (=> b!1037585 m!957257))

(declare-fun m!957259 () Bool)

(assert (=> d!125115 m!957259))

(declare-fun m!957261 () Bool)

(assert (=> d!125115 m!957261))

(assert (=> d!125115 m!957261))

(declare-fun m!957263 () Bool)

(assert (=> d!125115 m!957263))

(declare-fun m!957265 () Bool)

(assert (=> d!125115 m!957265))

(declare-fun m!957267 () Bool)

(assert (=> b!1037588 m!957267))

(assert (=> b!1037497 d!125115))

(declare-fun d!125117 () Bool)

(declare-fun res!692260 () Bool)

(declare-fun e!587004 () Bool)

(assert (=> d!125117 (=> res!692260 e!587004)))

(assert (=> d!125117 (= res!692260 ((_ is Nil!21956) Nil!21956))))

(assert (=> d!125117 (= (noDuplicate!1488 Nil!21956) e!587004)))

(declare-fun b!1037595 () Bool)

(declare-fun e!587005 () Bool)

(assert (=> b!1037595 (= e!587004 e!587005)))

(declare-fun res!692261 () Bool)

(assert (=> b!1037595 (=> (not res!692261) (not e!587005))))

(assert (=> b!1037595 (= res!692261 (not (contains!6006 (t!31164 Nil!21956) (h!23158 Nil!21956))))))

(declare-fun b!1037596 () Bool)

(assert (=> b!1037596 (= e!587005 (noDuplicate!1488 (t!31164 Nil!21956)))))

(assert (= (and d!125117 (not res!692260)) b!1037595))

(assert (= (and b!1037595 res!692261) b!1037596))

(declare-fun m!957269 () Bool)

(assert (=> b!1037595 m!957269))

(declare-fun m!957271 () Bool)

(assert (=> b!1037596 m!957271))

(assert (=> b!1037506 d!125117))

(declare-fun d!125119 () Bool)

(declare-fun res!692268 () Bool)

(declare-fun e!587008 () Bool)

(assert (=> d!125119 (=> (not res!692268) (not e!587008))))

(declare-fun simpleValid!419 (LongMapFixedSize!5818) Bool)

(assert (=> d!125119 (= res!692268 (simpleValid!419 thiss!1427))))

(assert (=> d!125119 (= (valid!2185 thiss!1427) e!587008)))

(declare-fun b!1037603 () Bool)

(declare-fun res!692269 () Bool)

(assert (=> b!1037603 (=> (not res!692269) (not e!587008))))

(assert (=> b!1037603 (= res!692269 (= (arrayCountValidKeys!0 (_keys!11485 thiss!1427) #b00000000000000000000000000000000 (size!31966 (_keys!11485 thiss!1427))) (_size!2964 thiss!1427)))))

(declare-fun b!1037604 () Bool)

(declare-fun res!692270 () Bool)

(assert (=> b!1037604 (=> (not res!692270) (not e!587008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65309 (_ BitVec 32)) Bool)

(assert (=> b!1037604 (= res!692270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11485 thiss!1427) (mask!30211 thiss!1427)))))

(declare-fun b!1037605 () Bool)

(declare-fun arrayNoDuplicates!0 (array!65309 (_ BitVec 32) List!21959) Bool)

(assert (=> b!1037605 (= e!587008 (arrayNoDuplicates!0 (_keys!11485 thiss!1427) #b00000000000000000000000000000000 Nil!21956))))

(assert (= (and d!125119 res!692268) b!1037603))

(assert (= (and b!1037603 res!692269) b!1037604))

(assert (= (and b!1037604 res!692270) b!1037605))

(declare-fun m!957273 () Bool)

(assert (=> d!125119 m!957273))

(assert (=> b!1037603 m!957193))

(declare-fun m!957275 () Bool)

(assert (=> b!1037604 m!957275))

(declare-fun m!957277 () Bool)

(assert (=> b!1037605 m!957277))

(assert (=> start!90758 d!125119))

(declare-fun d!125121 () Bool)

(declare-fun lt!457377 () Bool)

(assert (=> d!125121 (= lt!457377 (select (content!516 Nil!21956) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587010 () Bool)

(assert (=> d!125121 (= lt!457377 e!587010)))

(declare-fun res!692271 () Bool)

(assert (=> d!125121 (=> (not res!692271) (not e!587010))))

(assert (=> d!125121 (= res!692271 ((_ is Cons!21955) Nil!21956))))

(assert (=> d!125121 (= (contains!6006 Nil!21956 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457377)))

(declare-fun b!1037606 () Bool)

(declare-fun e!587009 () Bool)

(assert (=> b!1037606 (= e!587010 e!587009)))

(declare-fun res!692272 () Bool)

(assert (=> b!1037606 (=> res!692272 e!587009)))

(assert (=> b!1037606 (= res!692272 (= (h!23158 Nil!21956) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037607 () Bool)

(assert (=> b!1037607 (= e!587009 (contains!6006 (t!31164 Nil!21956) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125121 res!692271) b!1037606))

(assert (= (and b!1037606 (not res!692272)) b!1037607))

(assert (=> d!125121 m!957251))

(declare-fun m!957279 () Bool)

(assert (=> d!125121 m!957279))

(declare-fun m!957281 () Bool)

(assert (=> b!1037607 m!957281))

(assert (=> b!1037501 d!125121))

(declare-fun b!1037616 () Bool)

(declare-fun e!587016 () (_ BitVec 32))

(declare-fun call!43903 () (_ BitVec 32))

(assert (=> b!1037616 (= e!587016 call!43903)))

(declare-fun b!1037617 () Bool)

(assert (=> b!1037617 (= e!587016 (bvadd #b00000000000000000000000000000001 call!43903))))

(declare-fun b!1037618 () Bool)

(declare-fun e!587015 () (_ BitVec 32))

(assert (=> b!1037618 (= e!587015 e!587016)))

(declare-fun c!105116 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1037618 (= c!105116 (validKeyInArray!0 (select (arr!31434 (array!65310 (store (arr!31434 (_keys!11485 thiss!1427)) (index!41376 lt!457348) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31966 (_keys!11485 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!125123 () Bool)

(declare-fun lt!457380 () (_ BitVec 32))

(assert (=> d!125123 (and (bvsge lt!457380 #b00000000000000000000000000000000) (bvsle lt!457380 (bvsub (size!31966 (array!65310 (store (arr!31434 (_keys!11485 thiss!1427)) (index!41376 lt!457348) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31966 (_keys!11485 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!125123 (= lt!457380 e!587015)))

(declare-fun c!105117 () Bool)

(assert (=> d!125123 (= c!105117 (bvsge #b00000000000000000000000000000000 (size!31966 (_keys!11485 thiss!1427))))))

(assert (=> d!125123 (and (bvsle #b00000000000000000000000000000000 (size!31966 (_keys!11485 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31966 (_keys!11485 thiss!1427)) (size!31966 (array!65310 (store (arr!31434 (_keys!11485 thiss!1427)) (index!41376 lt!457348) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31966 (_keys!11485 thiss!1427))))))))

(assert (=> d!125123 (= (arrayCountValidKeys!0 (array!65310 (store (arr!31434 (_keys!11485 thiss!1427)) (index!41376 lt!457348) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31966 (_keys!11485 thiss!1427))) #b00000000000000000000000000000000 (size!31966 (_keys!11485 thiss!1427))) lt!457380)))

(declare-fun bm!43900 () Bool)

(assert (=> bm!43900 (= call!43903 (arrayCountValidKeys!0 (array!65310 (store (arr!31434 (_keys!11485 thiss!1427)) (index!41376 lt!457348) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31966 (_keys!11485 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31966 (_keys!11485 thiss!1427))))))

(declare-fun b!1037619 () Bool)

(assert (=> b!1037619 (= e!587015 #b00000000000000000000000000000000)))

(assert (= (and d!125123 c!105117) b!1037619))

(assert (= (and d!125123 (not c!105117)) b!1037618))

(assert (= (and b!1037618 c!105116) b!1037617))

(assert (= (and b!1037618 (not c!105116)) b!1037616))

(assert (= (or b!1037617 b!1037616) bm!43900))

(declare-fun m!957283 () Bool)

(assert (=> b!1037618 m!957283))

(assert (=> b!1037618 m!957283))

(declare-fun m!957285 () Bool)

(assert (=> b!1037618 m!957285))

(declare-fun m!957287 () Bool)

(assert (=> bm!43900 m!957287))

(assert (=> b!1037500 d!125123))

(declare-fun b!1037620 () Bool)

(declare-fun e!587018 () (_ BitVec 32))

(declare-fun call!43904 () (_ BitVec 32))

(assert (=> b!1037620 (= e!587018 call!43904)))

(declare-fun b!1037621 () Bool)

(assert (=> b!1037621 (= e!587018 (bvadd #b00000000000000000000000000000001 call!43904))))

(declare-fun b!1037622 () Bool)

(declare-fun e!587017 () (_ BitVec 32))

(assert (=> b!1037622 (= e!587017 e!587018)))

(declare-fun c!105118 () Bool)

(assert (=> b!1037622 (= c!105118 (validKeyInArray!0 (select (arr!31434 (_keys!11485 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125125 () Bool)

(declare-fun lt!457381 () (_ BitVec 32))

(assert (=> d!125125 (and (bvsge lt!457381 #b00000000000000000000000000000000) (bvsle lt!457381 (bvsub (size!31966 (_keys!11485 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125125 (= lt!457381 e!587017)))

(declare-fun c!105119 () Bool)

(assert (=> d!125125 (= c!105119 (bvsge #b00000000000000000000000000000000 (size!31966 (_keys!11485 thiss!1427))))))

(assert (=> d!125125 (and (bvsle #b00000000000000000000000000000000 (size!31966 (_keys!11485 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31966 (_keys!11485 thiss!1427)) (size!31966 (_keys!11485 thiss!1427))))))

(assert (=> d!125125 (= (arrayCountValidKeys!0 (_keys!11485 thiss!1427) #b00000000000000000000000000000000 (size!31966 (_keys!11485 thiss!1427))) lt!457381)))

(declare-fun bm!43901 () Bool)

(assert (=> bm!43901 (= call!43904 (arrayCountValidKeys!0 (_keys!11485 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31966 (_keys!11485 thiss!1427))))))

(declare-fun b!1037623 () Bool)

(assert (=> b!1037623 (= e!587017 #b00000000000000000000000000000000)))

(assert (= (and d!125125 c!105119) b!1037623))

(assert (= (and d!125125 (not c!105119)) b!1037622))

(assert (= (and b!1037622 c!105118) b!1037621))

(assert (= (and b!1037622 (not c!105118)) b!1037620))

(assert (= (or b!1037621 b!1037620) bm!43901))

(declare-fun m!957289 () Bool)

(assert (=> b!1037622 m!957289))

(assert (=> b!1037622 m!957289))

(declare-fun m!957291 () Bool)

(assert (=> b!1037622 m!957291))

(declare-fun m!957293 () Bool)

(assert (=> bm!43901 m!957293))

(assert (=> b!1037500 d!125125))

(declare-fun b!1037633 () Bool)

(declare-fun res!692284 () Bool)

(declare-fun e!587023 () Bool)

(assert (=> b!1037633 (=> (not res!692284) (not e!587023))))

(assert (=> b!1037633 (= res!692284 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1037635 () Bool)

(declare-fun e!587024 () Bool)

(assert (=> b!1037635 (= e!587024 (= (arrayCountValidKeys!0 (array!65310 (store (arr!31434 (_keys!11485 thiss!1427)) (index!41376 lt!457348) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31966 (_keys!11485 thiss!1427))) #b00000000000000000000000000000000 (size!31966 (_keys!11485 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11485 thiss!1427) #b00000000000000000000000000000000 (size!31966 (_keys!11485 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!125127 () Bool)

(assert (=> d!125127 e!587024))

(declare-fun res!692283 () Bool)

(assert (=> d!125127 (=> (not res!692283) (not e!587024))))

(assert (=> d!125127 (= res!692283 (and (bvsge (index!41376 lt!457348) #b00000000000000000000000000000000) (bvslt (index!41376 lt!457348) (size!31966 (_keys!11485 thiss!1427)))))))

(declare-fun lt!457384 () Unit!33839)

(declare-fun choose!82 (array!65309 (_ BitVec 32) (_ BitVec 64)) Unit!33839)

(assert (=> d!125127 (= lt!457384 (choose!82 (_keys!11485 thiss!1427) (index!41376 lt!457348) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125127 e!587023))

(declare-fun res!692281 () Bool)

(assert (=> d!125127 (=> (not res!692281) (not e!587023))))

(assert (=> d!125127 (= res!692281 (and (bvsge (index!41376 lt!457348) #b00000000000000000000000000000000) (bvslt (index!41376 lt!457348) (size!31966 (_keys!11485 thiss!1427)))))))

(assert (=> d!125127 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11485 thiss!1427) (index!41376 lt!457348) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457384)))

(declare-fun b!1037632 () Bool)

(declare-fun res!692282 () Bool)

(assert (=> b!1037632 (=> (not res!692282) (not e!587023))))

(assert (=> b!1037632 (= res!692282 (validKeyInArray!0 (select (arr!31434 (_keys!11485 thiss!1427)) (index!41376 lt!457348))))))

(declare-fun b!1037634 () Bool)

(assert (=> b!1037634 (= e!587023 (bvslt (size!31966 (_keys!11485 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!125127 res!692281) b!1037632))

(assert (= (and b!1037632 res!692282) b!1037633))

(assert (= (and b!1037633 res!692284) b!1037634))

(assert (= (and d!125127 res!692283) b!1037635))

(declare-fun m!957295 () Bool)

(assert (=> b!1037633 m!957295))

(assert (=> b!1037635 m!957189))

(assert (=> b!1037635 m!957191))

(assert (=> b!1037635 m!957193))

(declare-fun m!957297 () Bool)

(assert (=> d!125127 m!957297))

(declare-fun m!957299 () Bool)

(assert (=> b!1037632 m!957299))

(assert (=> b!1037632 m!957299))

(declare-fun m!957301 () Bool)

(assert (=> b!1037632 m!957301))

(assert (=> b!1037500 d!125127))

(declare-fun mapNonEmpty!38490 () Bool)

(declare-fun mapRes!38490 () Bool)

(declare-fun tp!73900 () Bool)

(declare-fun e!587030 () Bool)

(assert (=> mapNonEmpty!38490 (= mapRes!38490 (and tp!73900 e!587030))))

(declare-fun mapKey!38490 () (_ BitVec 32))

(declare-fun mapRest!38490 () (Array (_ BitVec 32) ValueCell!11612))

(declare-fun mapValue!38490 () ValueCell!11612)

(assert (=> mapNonEmpty!38490 (= mapRest!38481 (store mapRest!38490 mapKey!38490 mapValue!38490))))

(declare-fun b!1037642 () Bool)

(assert (=> b!1037642 (= e!587030 tp_is_empty!24631)))

(declare-fun mapIsEmpty!38490 () Bool)

(assert (=> mapIsEmpty!38490 mapRes!38490))

(declare-fun condMapEmpty!38490 () Bool)

(declare-fun mapDefault!38490 () ValueCell!11612)

(assert (=> mapNonEmpty!38481 (= condMapEmpty!38490 (= mapRest!38481 ((as const (Array (_ BitVec 32) ValueCell!11612)) mapDefault!38490)))))

(declare-fun e!587029 () Bool)

(assert (=> mapNonEmpty!38481 (= tp!73885 (and e!587029 mapRes!38490))))

(declare-fun b!1037643 () Bool)

(assert (=> b!1037643 (= e!587029 tp_is_empty!24631)))

(assert (= (and mapNonEmpty!38481 condMapEmpty!38490) mapIsEmpty!38490))

(assert (= (and mapNonEmpty!38481 (not condMapEmpty!38490)) mapNonEmpty!38490))

(assert (= (and mapNonEmpty!38490 ((_ is ValueCellFull!11612) mapValue!38490)) b!1037642))

(assert (= (and mapNonEmpty!38481 ((_ is ValueCellFull!11612) mapDefault!38490)) b!1037643))

(declare-fun m!957303 () Bool)

(assert (=> mapNonEmpty!38490 m!957303))

(check-sat (not bm!43900) (not b!1037596) (not d!125119) (not bm!43901) (not b!1037572) (not b!1037632) (not d!125115) (not b!1037635) (not d!125121) b_and!33417 (not b!1037604) (not b!1037622) (not d!125113) (not b!1037607) (not b!1037603) (not b_next!20911) (not b!1037595) (not b!1037605) (not b!1037633) (not d!125127) (not b!1037588) tp_is_empty!24631 (not mapNonEmpty!38490) (not b!1037618))
(check-sat b_and!33417 (not b_next!20911))
