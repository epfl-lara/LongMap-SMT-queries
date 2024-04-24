; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91462 () Bool)

(assert start!91462)

(declare-fun b!1042160 () Bool)

(declare-fun b_free!21025 () Bool)

(declare-fun b_next!21025 () Bool)

(assert (=> b!1042160 (= b_free!21025 (not b_next!21025))))

(declare-fun tp!74279 () Bool)

(declare-fun b_and!33567 () Bool)

(assert (=> b!1042160 (= tp!74279 b_and!33567)))

(declare-fun b!1042157 () Bool)

(declare-fun e!590196 () Bool)

(declare-datatypes ((V!37867 0))(
  ( (V!37868 (val!12423 Int)) )
))
(declare-datatypes ((ValueCell!11669 0))(
  ( (ValueCellFull!11669 (v!15006 V!37867)) (EmptyCell!11669) )
))
(declare-datatypes ((array!65681 0))(
  ( (array!65682 (arr!31597 (Array (_ BitVec 32) (_ BitVec 64))) (size!32129 (_ BitVec 32))) )
))
(declare-datatypes ((array!65683 0))(
  ( (array!65684 (arr!31598 (Array (_ BitVec 32) ValueCell!11669)) (size!32130 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5932 0))(
  ( (LongMapFixedSize!5933 (defaultEntry!6348 Int) (mask!30415 (_ BitVec 32)) (extraKeys!6076 (_ BitVec 32)) (zeroValue!6182 V!37867) (minValue!6182 V!37867) (_size!3021 (_ BitVec 32)) (_keys!11612 array!65681) (_values!6371 array!65683) (_vacant!3021 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5932)

(assert (=> b!1042157 (= e!590196 (= (size!32130 (_values!6371 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30415 thiss!1427))))))

(declare-fun b!1042158 () Bool)

(declare-fun e!590193 () Bool)

(declare-fun tp_is_empty!24745 () Bool)

(assert (=> b!1042158 (= e!590193 tp_is_empty!24745)))

(declare-fun mapNonEmpty!38704 () Bool)

(declare-fun mapRes!38704 () Bool)

(declare-fun tp!74278 () Bool)

(declare-fun e!590192 () Bool)

(assert (=> mapNonEmpty!38704 (= mapRes!38704 (and tp!74278 e!590192))))

(declare-fun mapValue!38704 () ValueCell!11669)

(declare-fun mapKey!38704 () (_ BitVec 32))

(declare-fun mapRest!38704 () (Array (_ BitVec 32) ValueCell!11669))

(assert (=> mapNonEmpty!38704 (= (arr!31598 (_values!6371 thiss!1427)) (store mapRest!38704 mapKey!38704 mapValue!38704))))

(declare-fun res!694367 () Bool)

(declare-fun e!590190 () Bool)

(assert (=> start!91462 (=> (not res!694367) (not e!590190))))

(declare-fun valid!2236 (LongMapFixedSize!5932) Bool)

(assert (=> start!91462 (= res!694367 (valid!2236 thiss!1427))))

(assert (=> start!91462 e!590190))

(declare-fun e!590195 () Bool)

(assert (=> start!91462 e!590195))

(assert (=> start!91462 true))

(declare-fun b!1042159 () Bool)

(declare-fun res!694368 () Bool)

(assert (=> b!1042159 (=> (not res!694368) (not e!590190))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1042159 (= res!694368 (not (= key!909 (bvneg key!909))))))

(declare-fun e!590197 () Bool)

(declare-fun array_inv!24429 (array!65681) Bool)

(declare-fun array_inv!24430 (array!65683) Bool)

(assert (=> b!1042160 (= e!590195 (and tp!74279 tp_is_empty!24745 (array_inv!24429 (_keys!11612 thiss!1427)) (array_inv!24430 (_values!6371 thiss!1427)) e!590197))))

(declare-fun b!1042161 () Bool)

(assert (=> b!1042161 (= e!590192 tp_is_empty!24745)))

(declare-fun b!1042162 () Bool)

(assert (=> b!1042162 (= e!590197 (and e!590193 mapRes!38704))))

(declare-fun condMapEmpty!38704 () Bool)

(declare-fun mapDefault!38704 () ValueCell!11669)

(assert (=> b!1042162 (= condMapEmpty!38704 (= (arr!31598 (_values!6371 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11669)) mapDefault!38704)))))

(declare-fun b!1042163 () Bool)

(declare-fun e!590194 () Bool)

(assert (=> b!1042163 (= e!590194 (not e!590196))))

(declare-fun res!694369 () Bool)

(assert (=> b!1042163 (=> res!694369 e!590196)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1042163 (= res!694369 (not (validMask!0 (mask!30415 thiss!1427))))))

(declare-fun lt!459253 () array!65681)

(declare-fun arrayContainsKey!0 (array!65681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1042163 (not (arrayContainsKey!0 lt!459253 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34031 0))(
  ( (Unit!34032) )
))
(declare-fun lt!459255 () Unit!34031)

(declare-datatypes ((SeekEntryResult!9757 0))(
  ( (MissingZero!9757 (index!41399 (_ BitVec 32))) (Found!9757 (index!41400 (_ BitVec 32))) (Intermediate!9757 (undefined!10569 Bool) (index!41401 (_ BitVec 32)) (x!92899 (_ BitVec 32))) (Undefined!9757) (MissingVacant!9757 (index!41402 (_ BitVec 32))) )
))
(declare-fun lt!459252 () SeekEntryResult!9757)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65681 (_ BitVec 32) (_ BitVec 64)) Unit!34031)

(assert (=> b!1042163 (= lt!459255 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11612 thiss!1427) (index!41400 lt!459252) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65681 (_ BitVec 32)) Bool)

(assert (=> b!1042163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459253 (mask!30415 thiss!1427))))

(declare-fun lt!459256 () Unit!34031)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65681 (_ BitVec 32) (_ BitVec 32)) Unit!34031)

(assert (=> b!1042163 (= lt!459256 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11612 thiss!1427) (index!41400 lt!459252) (mask!30415 thiss!1427)))))

(declare-datatypes ((List!21953 0))(
  ( (Nil!21950) (Cons!21949 (h!23162 (_ BitVec 64)) (t!31159 List!21953)) )
))
(declare-fun arrayNoDuplicates!0 (array!65681 (_ BitVec 32) List!21953) Bool)

(assert (=> b!1042163 (arrayNoDuplicates!0 lt!459253 #b00000000000000000000000000000000 Nil!21950)))

(declare-fun lt!459254 () Unit!34031)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65681 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21953) Unit!34031)

(assert (=> b!1042163 (= lt!459254 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11612 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41400 lt!459252) #b00000000000000000000000000000000 Nil!21950))))

(declare-fun arrayCountValidKeys!0 (array!65681 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1042163 (= (arrayCountValidKeys!0 lt!459253 #b00000000000000000000000000000000 (size!32129 (_keys!11612 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11612 thiss!1427) #b00000000000000000000000000000000 (size!32129 (_keys!11612 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1042163 (= lt!459253 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))))))

(declare-fun lt!459257 () Unit!34031)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65681 (_ BitVec 32) (_ BitVec 64)) Unit!34031)

(assert (=> b!1042163 (= lt!459257 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11612 thiss!1427) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38704 () Bool)

(assert (=> mapIsEmpty!38704 mapRes!38704))

(declare-fun b!1042164 () Bool)

(assert (=> b!1042164 (= e!590190 e!590194)))

(declare-fun res!694366 () Bool)

(assert (=> b!1042164 (=> (not res!694366) (not e!590194))))

(get-info :version)

(assert (=> b!1042164 (= res!694366 ((_ is Found!9757) lt!459252))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65681 (_ BitVec 32)) SeekEntryResult!9757)

(assert (=> b!1042164 (= lt!459252 (seekEntry!0 key!909 (_keys!11612 thiss!1427) (mask!30415 thiss!1427)))))

(assert (= (and start!91462 res!694367) b!1042159))

(assert (= (and b!1042159 res!694368) b!1042164))

(assert (= (and b!1042164 res!694366) b!1042163))

(assert (= (and b!1042163 (not res!694369)) b!1042157))

(assert (= (and b!1042162 condMapEmpty!38704) mapIsEmpty!38704))

(assert (= (and b!1042162 (not condMapEmpty!38704)) mapNonEmpty!38704))

(assert (= (and mapNonEmpty!38704 ((_ is ValueCellFull!11669) mapValue!38704)) b!1042161))

(assert (= (and b!1042162 ((_ is ValueCellFull!11669) mapDefault!38704)) b!1042158))

(assert (= b!1042160 b!1042162))

(assert (= start!91462 b!1042160))

(declare-fun m!962011 () Bool)

(assert (=> b!1042164 m!962011))

(declare-fun m!962013 () Bool)

(assert (=> b!1042163 m!962013))

(declare-fun m!962015 () Bool)

(assert (=> b!1042163 m!962015))

(declare-fun m!962017 () Bool)

(assert (=> b!1042163 m!962017))

(declare-fun m!962019 () Bool)

(assert (=> b!1042163 m!962019))

(declare-fun m!962021 () Bool)

(assert (=> b!1042163 m!962021))

(declare-fun m!962023 () Bool)

(assert (=> b!1042163 m!962023))

(declare-fun m!962025 () Bool)

(assert (=> b!1042163 m!962025))

(declare-fun m!962027 () Bool)

(assert (=> b!1042163 m!962027))

(declare-fun m!962029 () Bool)

(assert (=> b!1042163 m!962029))

(declare-fun m!962031 () Bool)

(assert (=> b!1042163 m!962031))

(declare-fun m!962033 () Bool)

(assert (=> b!1042163 m!962033))

(declare-fun m!962035 () Bool)

(assert (=> mapNonEmpty!38704 m!962035))

(declare-fun m!962037 () Bool)

(assert (=> b!1042160 m!962037))

(declare-fun m!962039 () Bool)

(assert (=> b!1042160 m!962039))

(declare-fun m!962041 () Bool)

(assert (=> start!91462 m!962041))

(check-sat (not b!1042163) tp_is_empty!24745 b_and!33567 (not b!1042164) (not b_next!21025) (not b!1042160) (not mapNonEmpty!38704) (not start!91462))
(check-sat b_and!33567 (not b_next!21025))
(get-model)

(declare-fun d!126181 () Bool)

(assert (=> d!126181 (= (validMask!0 (mask!30415 thiss!1427)) (and (or (= (mask!30415 thiss!1427) #b00000000000000000000000000000111) (= (mask!30415 thiss!1427) #b00000000000000000000000000001111) (= (mask!30415 thiss!1427) #b00000000000000000000000000011111) (= (mask!30415 thiss!1427) #b00000000000000000000000000111111) (= (mask!30415 thiss!1427) #b00000000000000000000000001111111) (= (mask!30415 thiss!1427) #b00000000000000000000000011111111) (= (mask!30415 thiss!1427) #b00000000000000000000000111111111) (= (mask!30415 thiss!1427) #b00000000000000000000001111111111) (= (mask!30415 thiss!1427) #b00000000000000000000011111111111) (= (mask!30415 thiss!1427) #b00000000000000000000111111111111) (= (mask!30415 thiss!1427) #b00000000000000000001111111111111) (= (mask!30415 thiss!1427) #b00000000000000000011111111111111) (= (mask!30415 thiss!1427) #b00000000000000000111111111111111) (= (mask!30415 thiss!1427) #b00000000000000001111111111111111) (= (mask!30415 thiss!1427) #b00000000000000011111111111111111) (= (mask!30415 thiss!1427) #b00000000000000111111111111111111) (= (mask!30415 thiss!1427) #b00000000000001111111111111111111) (= (mask!30415 thiss!1427) #b00000000000011111111111111111111) (= (mask!30415 thiss!1427) #b00000000000111111111111111111111) (= (mask!30415 thiss!1427) #b00000000001111111111111111111111) (= (mask!30415 thiss!1427) #b00000000011111111111111111111111) (= (mask!30415 thiss!1427) #b00000000111111111111111111111111) (= (mask!30415 thiss!1427) #b00000001111111111111111111111111) (= (mask!30415 thiss!1427) #b00000011111111111111111111111111) (= (mask!30415 thiss!1427) #b00000111111111111111111111111111) (= (mask!30415 thiss!1427) #b00001111111111111111111111111111) (= (mask!30415 thiss!1427) #b00011111111111111111111111111111) (= (mask!30415 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30415 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1042163 d!126181))

(declare-fun d!126183 () Bool)

(declare-fun e!590248 () Bool)

(assert (=> d!126183 e!590248))

(declare-fun res!694396 () Bool)

(assert (=> d!126183 (=> (not res!694396) (not e!590248))))

(assert (=> d!126183 (= res!694396 (and (bvsge (index!41400 lt!459252) #b00000000000000000000000000000000) (bvslt (index!41400 lt!459252) (size!32129 (_keys!11612 thiss!1427)))))))

(declare-fun lt!459296 () Unit!34031)

(declare-fun choose!53 (array!65681 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21953) Unit!34031)

(assert (=> d!126183 (= lt!459296 (choose!53 (_keys!11612 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41400 lt!459252) #b00000000000000000000000000000000 Nil!21950))))

(assert (=> d!126183 (bvslt (size!32129 (_keys!11612 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126183 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11612 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41400 lt!459252) #b00000000000000000000000000000000 Nil!21950) lt!459296)))

(declare-fun b!1042215 () Bool)

(assert (=> b!1042215 (= e!590248 (arrayNoDuplicates!0 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))) #b00000000000000000000000000000000 Nil!21950))))

(assert (= (and d!126183 res!694396) b!1042215))

(declare-fun m!962107 () Bool)

(assert (=> d!126183 m!962107))

(assert (=> b!1042215 m!962013))

(declare-fun m!962109 () Bool)

(assert (=> b!1042215 m!962109))

(assert (=> b!1042163 d!126183))

(declare-fun b!1042224 () Bool)

(declare-fun e!590253 () (_ BitVec 32))

(declare-fun e!590254 () (_ BitVec 32))

(assert (=> b!1042224 (= e!590253 e!590254)))

(declare-fun c!105952 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1042224 (= c!105952 (validKeyInArray!0 (select (arr!31597 lt!459253) #b00000000000000000000000000000000)))))

(declare-fun d!126185 () Bool)

(declare-fun lt!459299 () (_ BitVec 32))

(assert (=> d!126185 (and (bvsge lt!459299 #b00000000000000000000000000000000) (bvsle lt!459299 (bvsub (size!32129 lt!459253) #b00000000000000000000000000000000)))))

(assert (=> d!126185 (= lt!459299 e!590253)))

(declare-fun c!105953 () Bool)

(assert (=> d!126185 (= c!105953 (bvsge #b00000000000000000000000000000000 (size!32129 (_keys!11612 thiss!1427))))))

(assert (=> d!126185 (and (bvsle #b00000000000000000000000000000000 (size!32129 (_keys!11612 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32129 (_keys!11612 thiss!1427)) (size!32129 lt!459253)))))

(assert (=> d!126185 (= (arrayCountValidKeys!0 lt!459253 #b00000000000000000000000000000000 (size!32129 (_keys!11612 thiss!1427))) lt!459299)))

(declare-fun b!1042225 () Bool)

(declare-fun call!44147 () (_ BitVec 32))

(assert (=> b!1042225 (= e!590254 (bvadd #b00000000000000000000000000000001 call!44147))))

(declare-fun b!1042226 () Bool)

(assert (=> b!1042226 (= e!590253 #b00000000000000000000000000000000)))

(declare-fun b!1042227 () Bool)

(assert (=> b!1042227 (= e!590254 call!44147)))

(declare-fun bm!44144 () Bool)

(assert (=> bm!44144 (= call!44147 (arrayCountValidKeys!0 lt!459253 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32129 (_keys!11612 thiss!1427))))))

(assert (= (and d!126185 c!105953) b!1042226))

(assert (= (and d!126185 (not c!105953)) b!1042224))

(assert (= (and b!1042224 c!105952) b!1042225))

(assert (= (and b!1042224 (not c!105952)) b!1042227))

(assert (= (or b!1042225 b!1042227) bm!44144))

(declare-fun m!962111 () Bool)

(assert (=> b!1042224 m!962111))

(assert (=> b!1042224 m!962111))

(declare-fun m!962113 () Bool)

(assert (=> b!1042224 m!962113))

(declare-fun m!962115 () Bool)

(assert (=> bm!44144 m!962115))

(assert (=> b!1042163 d!126185))

(declare-fun d!126187 () Bool)

(declare-fun res!694401 () Bool)

(declare-fun e!590259 () Bool)

(assert (=> d!126187 (=> res!694401 e!590259)))

(assert (=> d!126187 (= res!694401 (= (select (arr!31597 lt!459253) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126187 (= (arrayContainsKey!0 lt!459253 key!909 #b00000000000000000000000000000000) e!590259)))

(declare-fun b!1042232 () Bool)

(declare-fun e!590260 () Bool)

(assert (=> b!1042232 (= e!590259 e!590260)))

(declare-fun res!694402 () Bool)

(assert (=> b!1042232 (=> (not res!694402) (not e!590260))))

(assert (=> b!1042232 (= res!694402 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32129 lt!459253)))))

(declare-fun b!1042233 () Bool)

(assert (=> b!1042233 (= e!590260 (arrayContainsKey!0 lt!459253 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126187 (not res!694401)) b!1042232))

(assert (= (and b!1042232 res!694402) b!1042233))

(assert (=> d!126187 m!962111))

(declare-fun m!962117 () Bool)

(assert (=> b!1042233 m!962117))

(assert (=> b!1042163 d!126187))

(declare-fun b!1042242 () Bool)

(declare-fun e!590267 () Bool)

(declare-fun e!590269 () Bool)

(assert (=> b!1042242 (= e!590267 e!590269)))

(declare-fun lt!459308 () (_ BitVec 64))

(assert (=> b!1042242 (= lt!459308 (select (arr!31597 lt!459253) #b00000000000000000000000000000000))))

(declare-fun lt!459306 () Unit!34031)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65681 (_ BitVec 64) (_ BitVec 32)) Unit!34031)

(assert (=> b!1042242 (= lt!459306 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459253 lt!459308 #b00000000000000000000000000000000))))

(assert (=> b!1042242 (arrayContainsKey!0 lt!459253 lt!459308 #b00000000000000000000000000000000)))

(declare-fun lt!459307 () Unit!34031)

(assert (=> b!1042242 (= lt!459307 lt!459306)))

(declare-fun res!694407 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65681 (_ BitVec 32)) SeekEntryResult!9757)

(assert (=> b!1042242 (= res!694407 (= (seekEntryOrOpen!0 (select (arr!31597 lt!459253) #b00000000000000000000000000000000) lt!459253 (mask!30415 thiss!1427)) (Found!9757 #b00000000000000000000000000000000)))))

(assert (=> b!1042242 (=> (not res!694407) (not e!590269))))

(declare-fun b!1042243 () Bool)

(declare-fun e!590268 () Bool)

(assert (=> b!1042243 (= e!590268 e!590267)))

(declare-fun c!105956 () Bool)

(assert (=> b!1042243 (= c!105956 (validKeyInArray!0 (select (arr!31597 lt!459253) #b00000000000000000000000000000000)))))

(declare-fun bm!44147 () Bool)

(declare-fun call!44150 () Bool)

(assert (=> bm!44147 (= call!44150 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459253 (mask!30415 thiss!1427)))))

(declare-fun d!126189 () Bool)

(declare-fun res!694408 () Bool)

(assert (=> d!126189 (=> res!694408 e!590268)))

(assert (=> d!126189 (= res!694408 (bvsge #b00000000000000000000000000000000 (size!32129 lt!459253)))))

(assert (=> d!126189 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459253 (mask!30415 thiss!1427)) e!590268)))

(declare-fun b!1042244 () Bool)

(assert (=> b!1042244 (= e!590269 call!44150)))

(declare-fun b!1042245 () Bool)

(assert (=> b!1042245 (= e!590267 call!44150)))

(assert (= (and d!126189 (not res!694408)) b!1042243))

(assert (= (and b!1042243 c!105956) b!1042242))

(assert (= (and b!1042243 (not c!105956)) b!1042245))

(assert (= (and b!1042242 res!694407) b!1042244))

(assert (= (or b!1042244 b!1042245) bm!44147))

(assert (=> b!1042242 m!962111))

(declare-fun m!962119 () Bool)

(assert (=> b!1042242 m!962119))

(declare-fun m!962121 () Bool)

(assert (=> b!1042242 m!962121))

(assert (=> b!1042242 m!962111))

(declare-fun m!962123 () Bool)

(assert (=> b!1042242 m!962123))

(assert (=> b!1042243 m!962111))

(assert (=> b!1042243 m!962111))

(assert (=> b!1042243 m!962113))

(declare-fun m!962125 () Bool)

(assert (=> bm!44147 m!962125))

(assert (=> b!1042163 d!126189))

(declare-fun d!126191 () Bool)

(declare-fun e!590272 () Bool)

(assert (=> d!126191 e!590272))

(declare-fun res!694411 () Bool)

(assert (=> d!126191 (=> (not res!694411) (not e!590272))))

(assert (=> d!126191 (= res!694411 (bvslt (index!41400 lt!459252) (size!32129 (_keys!11612 thiss!1427))))))

(declare-fun lt!459311 () Unit!34031)

(declare-fun choose!121 (array!65681 (_ BitVec 32) (_ BitVec 64)) Unit!34031)

(assert (=> d!126191 (= lt!459311 (choose!121 (_keys!11612 thiss!1427) (index!41400 lt!459252) key!909))))

(assert (=> d!126191 (bvsge (index!41400 lt!459252) #b00000000000000000000000000000000)))

(assert (=> d!126191 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11612 thiss!1427) (index!41400 lt!459252) key!909) lt!459311)))

(declare-fun b!1042248 () Bool)

(assert (=> b!1042248 (= e!590272 (not (arrayContainsKey!0 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126191 res!694411) b!1042248))

(declare-fun m!962127 () Bool)

(assert (=> d!126191 m!962127))

(assert (=> b!1042248 m!962013))

(declare-fun m!962129 () Bool)

(assert (=> b!1042248 m!962129))

(assert (=> b!1042163 d!126191))

(declare-fun d!126193 () Bool)

(declare-fun e!590275 () Bool)

(assert (=> d!126193 e!590275))

(declare-fun res!694414 () Bool)

(assert (=> d!126193 (=> (not res!694414) (not e!590275))))

(assert (=> d!126193 (= res!694414 (and (bvsge (index!41400 lt!459252) #b00000000000000000000000000000000) (bvslt (index!41400 lt!459252) (size!32129 (_keys!11612 thiss!1427)))))))

(declare-fun lt!459314 () Unit!34031)

(declare-fun choose!25 (array!65681 (_ BitVec 32) (_ BitVec 32)) Unit!34031)

(assert (=> d!126193 (= lt!459314 (choose!25 (_keys!11612 thiss!1427) (index!41400 lt!459252) (mask!30415 thiss!1427)))))

(assert (=> d!126193 (validMask!0 (mask!30415 thiss!1427))))

(assert (=> d!126193 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11612 thiss!1427) (index!41400 lt!459252) (mask!30415 thiss!1427)) lt!459314)))

(declare-fun b!1042251 () Bool)

(assert (=> b!1042251 (= e!590275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))) (mask!30415 thiss!1427)))))

(assert (= (and d!126193 res!694414) b!1042251))

(declare-fun m!962131 () Bool)

(assert (=> d!126193 m!962131))

(assert (=> d!126193 m!962017))

(assert (=> b!1042251 m!962013))

(declare-fun m!962133 () Bool)

(assert (=> b!1042251 m!962133))

(assert (=> b!1042163 d!126193))

(declare-fun b!1042262 () Bool)

(declare-fun e!590287 () Bool)

(declare-fun call!44153 () Bool)

(assert (=> b!1042262 (= e!590287 call!44153)))

(declare-fun b!1042263 () Bool)

(declare-fun e!590286 () Bool)

(declare-fun e!590284 () Bool)

(assert (=> b!1042263 (= e!590286 e!590284)))

(declare-fun res!694421 () Bool)

(assert (=> b!1042263 (=> (not res!694421) (not e!590284))))

(declare-fun e!590285 () Bool)

(assert (=> b!1042263 (= res!694421 (not e!590285))))

(declare-fun res!694422 () Bool)

(assert (=> b!1042263 (=> (not res!694422) (not e!590285))))

(assert (=> b!1042263 (= res!694422 (validKeyInArray!0 (select (arr!31597 lt!459253) #b00000000000000000000000000000000)))))

(declare-fun bm!44150 () Bool)

(declare-fun c!105959 () Bool)

(assert (=> bm!44150 (= call!44153 (arrayNoDuplicates!0 lt!459253 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105959 (Cons!21949 (select (arr!31597 lt!459253) #b00000000000000000000000000000000) Nil!21950) Nil!21950)))))

(declare-fun b!1042264 () Bool)

(assert (=> b!1042264 (= e!590287 call!44153)))

(declare-fun d!126195 () Bool)

(declare-fun res!694423 () Bool)

(assert (=> d!126195 (=> res!694423 e!590286)))

(assert (=> d!126195 (= res!694423 (bvsge #b00000000000000000000000000000000 (size!32129 lt!459253)))))

(assert (=> d!126195 (= (arrayNoDuplicates!0 lt!459253 #b00000000000000000000000000000000 Nil!21950) e!590286)))

(declare-fun b!1042265 () Bool)

(assert (=> b!1042265 (= e!590284 e!590287)))

(assert (=> b!1042265 (= c!105959 (validKeyInArray!0 (select (arr!31597 lt!459253) #b00000000000000000000000000000000)))))

(declare-fun b!1042266 () Bool)

(declare-fun contains!6078 (List!21953 (_ BitVec 64)) Bool)

(assert (=> b!1042266 (= e!590285 (contains!6078 Nil!21950 (select (arr!31597 lt!459253) #b00000000000000000000000000000000)))))

(assert (= (and d!126195 (not res!694423)) b!1042263))

(assert (= (and b!1042263 res!694422) b!1042266))

(assert (= (and b!1042263 res!694421) b!1042265))

(assert (= (and b!1042265 c!105959) b!1042262))

(assert (= (and b!1042265 (not c!105959)) b!1042264))

(assert (= (or b!1042262 b!1042264) bm!44150))

(assert (=> b!1042263 m!962111))

(assert (=> b!1042263 m!962111))

(assert (=> b!1042263 m!962113))

(assert (=> bm!44150 m!962111))

(declare-fun m!962135 () Bool)

(assert (=> bm!44150 m!962135))

(assert (=> b!1042265 m!962111))

(assert (=> b!1042265 m!962111))

(assert (=> b!1042265 m!962113))

(assert (=> b!1042266 m!962111))

(assert (=> b!1042266 m!962111))

(declare-fun m!962137 () Bool)

(assert (=> b!1042266 m!962137))

(assert (=> b!1042163 d!126195))

(declare-fun b!1042267 () Bool)

(declare-fun e!590288 () (_ BitVec 32))

(declare-fun e!590289 () (_ BitVec 32))

(assert (=> b!1042267 (= e!590288 e!590289)))

(declare-fun c!105960 () Bool)

(assert (=> b!1042267 (= c!105960 (validKeyInArray!0 (select (arr!31597 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!126197 () Bool)

(declare-fun lt!459315 () (_ BitVec 32))

(assert (=> d!126197 (and (bvsge lt!459315 #b00000000000000000000000000000000) (bvsle lt!459315 (bvsub (size!32129 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126197 (= lt!459315 e!590288)))

(declare-fun c!105961 () Bool)

(assert (=> d!126197 (= c!105961 (bvsge #b00000000000000000000000000000000 (size!32129 (_keys!11612 thiss!1427))))))

(assert (=> d!126197 (and (bvsle #b00000000000000000000000000000000 (size!32129 (_keys!11612 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32129 (_keys!11612 thiss!1427)) (size!32129 (_keys!11612 thiss!1427))))))

(assert (=> d!126197 (= (arrayCountValidKeys!0 (_keys!11612 thiss!1427) #b00000000000000000000000000000000 (size!32129 (_keys!11612 thiss!1427))) lt!459315)))

(declare-fun b!1042268 () Bool)

(declare-fun call!44154 () (_ BitVec 32))

(assert (=> b!1042268 (= e!590289 (bvadd #b00000000000000000000000000000001 call!44154))))

(declare-fun b!1042269 () Bool)

(assert (=> b!1042269 (= e!590288 #b00000000000000000000000000000000)))

(declare-fun b!1042270 () Bool)

(assert (=> b!1042270 (= e!590289 call!44154)))

(declare-fun bm!44151 () Bool)

(assert (=> bm!44151 (= call!44154 (arrayCountValidKeys!0 (_keys!11612 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32129 (_keys!11612 thiss!1427))))))

(assert (= (and d!126197 c!105961) b!1042269))

(assert (= (and d!126197 (not c!105961)) b!1042267))

(assert (= (and b!1042267 c!105960) b!1042268))

(assert (= (and b!1042267 (not c!105960)) b!1042270))

(assert (= (or b!1042268 b!1042270) bm!44151))

(declare-fun m!962139 () Bool)

(assert (=> b!1042267 m!962139))

(assert (=> b!1042267 m!962139))

(declare-fun m!962141 () Bool)

(assert (=> b!1042267 m!962141))

(declare-fun m!962143 () Bool)

(assert (=> bm!44151 m!962143))

(assert (=> b!1042163 d!126197))

(declare-fun b!1042279 () Bool)

(declare-fun res!694434 () Bool)

(declare-fun e!590295 () Bool)

(assert (=> b!1042279 (=> (not res!694434) (not e!590295))))

(assert (=> b!1042279 (= res!694434 (validKeyInArray!0 (select (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252))))))

(declare-fun b!1042280 () Bool)

(declare-fun res!694432 () Bool)

(assert (=> b!1042280 (=> (not res!694432) (not e!590295))))

(assert (=> b!1042280 (= res!694432 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1042281 () Bool)

(assert (=> b!1042281 (= e!590295 (bvslt (size!32129 (_keys!11612 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1042282 () Bool)

(declare-fun e!590294 () Bool)

(assert (=> b!1042282 (= e!590294 (= (arrayCountValidKeys!0 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))) #b00000000000000000000000000000000 (size!32129 (_keys!11612 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11612 thiss!1427) #b00000000000000000000000000000000 (size!32129 (_keys!11612 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!126199 () Bool)

(assert (=> d!126199 e!590294))

(declare-fun res!694435 () Bool)

(assert (=> d!126199 (=> (not res!694435) (not e!590294))))

(assert (=> d!126199 (= res!694435 (and (bvsge (index!41400 lt!459252) #b00000000000000000000000000000000) (bvslt (index!41400 lt!459252) (size!32129 (_keys!11612 thiss!1427)))))))

(declare-fun lt!459318 () Unit!34031)

(declare-fun choose!82 (array!65681 (_ BitVec 32) (_ BitVec 64)) Unit!34031)

(assert (=> d!126199 (= lt!459318 (choose!82 (_keys!11612 thiss!1427) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126199 e!590295))

(declare-fun res!694433 () Bool)

(assert (=> d!126199 (=> (not res!694433) (not e!590295))))

(assert (=> d!126199 (= res!694433 (and (bvsge (index!41400 lt!459252) #b00000000000000000000000000000000) (bvslt (index!41400 lt!459252) (size!32129 (_keys!11612 thiss!1427)))))))

(assert (=> d!126199 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11612 thiss!1427) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459318)))

(assert (= (and d!126199 res!694433) b!1042279))

(assert (= (and b!1042279 res!694434) b!1042280))

(assert (= (and b!1042280 res!694432) b!1042281))

(assert (= (and d!126199 res!694435) b!1042282))

(declare-fun m!962145 () Bool)

(assert (=> b!1042279 m!962145))

(assert (=> b!1042279 m!962145))

(declare-fun m!962147 () Bool)

(assert (=> b!1042279 m!962147))

(declare-fun m!962149 () Bool)

(assert (=> b!1042280 m!962149))

(assert (=> b!1042282 m!962013))

(declare-fun m!962151 () Bool)

(assert (=> b!1042282 m!962151))

(assert (=> b!1042282 m!962023))

(declare-fun m!962153 () Bool)

(assert (=> d!126199 m!962153))

(assert (=> b!1042163 d!126199))

(declare-fun d!126201 () Bool)

(assert (=> d!126201 (= (array_inv!24429 (_keys!11612 thiss!1427)) (bvsge (size!32129 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042160 d!126201))

(declare-fun d!126203 () Bool)

(assert (=> d!126203 (= (array_inv!24430 (_values!6371 thiss!1427)) (bvsge (size!32130 (_values!6371 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042160 d!126203))

(declare-fun b!1042295 () Bool)

(declare-fun e!590303 () SeekEntryResult!9757)

(assert (=> b!1042295 (= e!590303 Undefined!9757)))

(declare-fun d!126205 () Bool)

(declare-fun lt!459328 () SeekEntryResult!9757)

(assert (=> d!126205 (and (or ((_ is MissingVacant!9757) lt!459328) (not ((_ is Found!9757) lt!459328)) (and (bvsge (index!41400 lt!459328) #b00000000000000000000000000000000) (bvslt (index!41400 lt!459328) (size!32129 (_keys!11612 thiss!1427))))) (not ((_ is MissingVacant!9757) lt!459328)) (or (not ((_ is Found!9757) lt!459328)) (= (select (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459328)) key!909)))))

(assert (=> d!126205 (= lt!459328 e!590303)))

(declare-fun c!105970 () Bool)

(declare-fun lt!459327 () SeekEntryResult!9757)

(assert (=> d!126205 (= c!105970 (and ((_ is Intermediate!9757) lt!459327) (undefined!10569 lt!459327)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65681 (_ BitVec 32)) SeekEntryResult!9757)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126205 (= lt!459327 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30415 thiss!1427)) key!909 (_keys!11612 thiss!1427) (mask!30415 thiss!1427)))))

(assert (=> d!126205 (validMask!0 (mask!30415 thiss!1427))))

(assert (=> d!126205 (= (seekEntry!0 key!909 (_keys!11612 thiss!1427) (mask!30415 thiss!1427)) lt!459328)))

(declare-fun b!1042296 () Bool)

(declare-fun c!105968 () Bool)

(declare-fun lt!459330 () (_ BitVec 64))

(assert (=> b!1042296 (= c!105968 (= lt!459330 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!590302 () SeekEntryResult!9757)

(declare-fun e!590304 () SeekEntryResult!9757)

(assert (=> b!1042296 (= e!590302 e!590304)))

(declare-fun b!1042297 () Bool)

(assert (=> b!1042297 (= e!590303 e!590302)))

(assert (=> b!1042297 (= lt!459330 (select (arr!31597 (_keys!11612 thiss!1427)) (index!41401 lt!459327)))))

(declare-fun c!105969 () Bool)

(assert (=> b!1042297 (= c!105969 (= lt!459330 key!909))))

(declare-fun b!1042298 () Bool)

(declare-fun lt!459329 () SeekEntryResult!9757)

(assert (=> b!1042298 (= e!590304 (ite ((_ is MissingVacant!9757) lt!459329) (MissingZero!9757 (index!41402 lt!459329)) lt!459329))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65681 (_ BitVec 32)) SeekEntryResult!9757)

(assert (=> b!1042298 (= lt!459329 (seekKeyOrZeroReturnVacant!0 (x!92899 lt!459327) (index!41401 lt!459327) (index!41401 lt!459327) key!909 (_keys!11612 thiss!1427) (mask!30415 thiss!1427)))))

(declare-fun b!1042299 () Bool)

(assert (=> b!1042299 (= e!590304 (MissingZero!9757 (index!41401 lt!459327)))))

(declare-fun b!1042300 () Bool)

(assert (=> b!1042300 (= e!590302 (Found!9757 (index!41401 lt!459327)))))

(assert (= (and d!126205 c!105970) b!1042295))

(assert (= (and d!126205 (not c!105970)) b!1042297))

(assert (= (and b!1042297 c!105969) b!1042300))

(assert (= (and b!1042297 (not c!105969)) b!1042296))

(assert (= (and b!1042296 c!105968) b!1042299))

(assert (= (and b!1042296 (not c!105968)) b!1042298))

(declare-fun m!962155 () Bool)

(assert (=> d!126205 m!962155))

(declare-fun m!962157 () Bool)

(assert (=> d!126205 m!962157))

(assert (=> d!126205 m!962157))

(declare-fun m!962159 () Bool)

(assert (=> d!126205 m!962159))

(assert (=> d!126205 m!962017))

(declare-fun m!962161 () Bool)

(assert (=> b!1042297 m!962161))

(declare-fun m!962163 () Bool)

(assert (=> b!1042298 m!962163))

(assert (=> b!1042164 d!126205))

(declare-fun d!126207 () Bool)

(declare-fun res!694442 () Bool)

(declare-fun e!590307 () Bool)

(assert (=> d!126207 (=> (not res!694442) (not e!590307))))

(declare-fun simpleValid!436 (LongMapFixedSize!5932) Bool)

(assert (=> d!126207 (= res!694442 (simpleValid!436 thiss!1427))))

(assert (=> d!126207 (= (valid!2236 thiss!1427) e!590307)))

(declare-fun b!1042307 () Bool)

(declare-fun res!694443 () Bool)

(assert (=> b!1042307 (=> (not res!694443) (not e!590307))))

(assert (=> b!1042307 (= res!694443 (= (arrayCountValidKeys!0 (_keys!11612 thiss!1427) #b00000000000000000000000000000000 (size!32129 (_keys!11612 thiss!1427))) (_size!3021 thiss!1427)))))

(declare-fun b!1042308 () Bool)

(declare-fun res!694444 () Bool)

(assert (=> b!1042308 (=> (not res!694444) (not e!590307))))

(assert (=> b!1042308 (= res!694444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11612 thiss!1427) (mask!30415 thiss!1427)))))

(declare-fun b!1042309 () Bool)

(assert (=> b!1042309 (= e!590307 (arrayNoDuplicates!0 (_keys!11612 thiss!1427) #b00000000000000000000000000000000 Nil!21950))))

(assert (= (and d!126207 res!694442) b!1042307))

(assert (= (and b!1042307 res!694443) b!1042308))

(assert (= (and b!1042308 res!694444) b!1042309))

(declare-fun m!962165 () Bool)

(assert (=> d!126207 m!962165))

(assert (=> b!1042307 m!962023))

(declare-fun m!962167 () Bool)

(assert (=> b!1042308 m!962167))

(declare-fun m!962169 () Bool)

(assert (=> b!1042309 m!962169))

(assert (=> start!91462 d!126207))

(declare-fun b!1042316 () Bool)

(declare-fun e!590312 () Bool)

(assert (=> b!1042316 (= e!590312 tp_is_empty!24745)))

(declare-fun b!1042317 () Bool)

(declare-fun e!590313 () Bool)

(assert (=> b!1042317 (= e!590313 tp_is_empty!24745)))

(declare-fun mapIsEmpty!38713 () Bool)

(declare-fun mapRes!38713 () Bool)

(assert (=> mapIsEmpty!38713 mapRes!38713))

(declare-fun mapNonEmpty!38713 () Bool)

(declare-fun tp!74294 () Bool)

(assert (=> mapNonEmpty!38713 (= mapRes!38713 (and tp!74294 e!590312))))

(declare-fun mapRest!38713 () (Array (_ BitVec 32) ValueCell!11669))

(declare-fun mapKey!38713 () (_ BitVec 32))

(declare-fun mapValue!38713 () ValueCell!11669)

(assert (=> mapNonEmpty!38713 (= mapRest!38704 (store mapRest!38713 mapKey!38713 mapValue!38713))))

(declare-fun condMapEmpty!38713 () Bool)

(declare-fun mapDefault!38713 () ValueCell!11669)

(assert (=> mapNonEmpty!38704 (= condMapEmpty!38713 (= mapRest!38704 ((as const (Array (_ BitVec 32) ValueCell!11669)) mapDefault!38713)))))

(assert (=> mapNonEmpty!38704 (= tp!74278 (and e!590313 mapRes!38713))))

(assert (= (and mapNonEmpty!38704 condMapEmpty!38713) mapIsEmpty!38713))

(assert (= (and mapNonEmpty!38704 (not condMapEmpty!38713)) mapNonEmpty!38713))

(assert (= (and mapNonEmpty!38713 ((_ is ValueCellFull!11669) mapValue!38713)) b!1042316))

(assert (= (and mapNonEmpty!38704 ((_ is ValueCellFull!11669) mapDefault!38713)) b!1042317))

(declare-fun m!962171 () Bool)

(assert (=> mapNonEmpty!38713 m!962171))

(check-sat (not b!1042215) tp_is_empty!24745 (not b!1042309) (not b!1042243) (not d!126183) (not bm!44150) (not b!1042308) (not b!1042263) (not b!1042248) (not b!1042266) (not bm!44147) (not b!1042224) (not bm!44151) (not d!126205) b_and!33567 (not b!1042265) (not b_next!21025) (not b!1042298) (not b!1042267) (not mapNonEmpty!38713) (not d!126191) (not b!1042242) (not d!126193) (not bm!44144) (not b!1042307) (not b!1042282) (not d!126199) (not b!1042233) (not b!1042251) (not b!1042279) (not b!1042280) (not d!126207))
(check-sat b_and!33567 (not b_next!21025))
(get-model)

(declare-fun d!126209 () Bool)

(assert (=> d!126209 (= (validKeyInArray!0 (select (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252))) (and (not (= (select (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1042279 d!126209))

(declare-fun d!126211 () Bool)

(assert (=> d!126211 (= (validKeyInArray!0 (select (arr!31597 lt!459253) #b00000000000000000000000000000000)) (and (not (= (select (arr!31597 lt!459253) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31597 lt!459253) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1042263 d!126211))

(declare-fun b!1042318 () Bool)

(declare-fun e!590314 () (_ BitVec 32))

(declare-fun e!590315 () (_ BitVec 32))

(assert (=> b!1042318 (= e!590314 e!590315)))

(declare-fun c!105971 () Bool)

(assert (=> b!1042318 (= c!105971 (validKeyInArray!0 (select (arr!31597 (_keys!11612 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!126213 () Bool)

(declare-fun lt!459331 () (_ BitVec 32))

(assert (=> d!126213 (and (bvsge lt!459331 #b00000000000000000000000000000000) (bvsle lt!459331 (bvsub (size!32129 (_keys!11612 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!126213 (= lt!459331 e!590314)))

(declare-fun c!105972 () Bool)

(assert (=> d!126213 (= c!105972 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32129 (_keys!11612 thiss!1427))))))

(assert (=> d!126213 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32129 (_keys!11612 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32129 (_keys!11612 thiss!1427)) (size!32129 (_keys!11612 thiss!1427))))))

(assert (=> d!126213 (= (arrayCountValidKeys!0 (_keys!11612 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32129 (_keys!11612 thiss!1427))) lt!459331)))

(declare-fun b!1042319 () Bool)

(declare-fun call!44155 () (_ BitVec 32))

(assert (=> b!1042319 (= e!590315 (bvadd #b00000000000000000000000000000001 call!44155))))

(declare-fun b!1042320 () Bool)

(assert (=> b!1042320 (= e!590314 #b00000000000000000000000000000000)))

(declare-fun b!1042321 () Bool)

(assert (=> b!1042321 (= e!590315 call!44155)))

(declare-fun bm!44152 () Bool)

(assert (=> bm!44152 (= call!44155 (arrayCountValidKeys!0 (_keys!11612 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32129 (_keys!11612 thiss!1427))))))

(assert (= (and d!126213 c!105972) b!1042320))

(assert (= (and d!126213 (not c!105972)) b!1042318))

(assert (= (and b!1042318 c!105971) b!1042319))

(assert (= (and b!1042318 (not c!105971)) b!1042321))

(assert (= (or b!1042319 b!1042321) bm!44152))

(declare-fun m!962173 () Bool)

(assert (=> b!1042318 m!962173))

(assert (=> b!1042318 m!962173))

(declare-fun m!962175 () Bool)

(assert (=> b!1042318 m!962175))

(declare-fun m!962177 () Bool)

(assert (=> bm!44152 m!962177))

(assert (=> bm!44151 d!126213))

(assert (=> b!1042243 d!126211))

(declare-fun b!1042322 () Bool)

(declare-fun e!590319 () Bool)

(declare-fun call!44156 () Bool)

(assert (=> b!1042322 (= e!590319 call!44156)))

(declare-fun b!1042323 () Bool)

(declare-fun e!590318 () Bool)

(declare-fun e!590316 () Bool)

(assert (=> b!1042323 (= e!590318 e!590316)))

(declare-fun res!694445 () Bool)

(assert (=> b!1042323 (=> (not res!694445) (not e!590316))))

(declare-fun e!590317 () Bool)

(assert (=> b!1042323 (= res!694445 (not e!590317))))

(declare-fun res!694446 () Bool)

(assert (=> b!1042323 (=> (not res!694446) (not e!590317))))

(assert (=> b!1042323 (= res!694446 (validKeyInArray!0 (select (arr!31597 lt!459253) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!44153 () Bool)

(declare-fun c!105973 () Bool)

(assert (=> bm!44153 (= call!44156 (arrayNoDuplicates!0 lt!459253 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!105973 (Cons!21949 (select (arr!31597 lt!459253) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!105959 (Cons!21949 (select (arr!31597 lt!459253) #b00000000000000000000000000000000) Nil!21950) Nil!21950)) (ite c!105959 (Cons!21949 (select (arr!31597 lt!459253) #b00000000000000000000000000000000) Nil!21950) Nil!21950))))))

(declare-fun b!1042324 () Bool)

(assert (=> b!1042324 (= e!590319 call!44156)))

(declare-fun d!126215 () Bool)

(declare-fun res!694447 () Bool)

(assert (=> d!126215 (=> res!694447 e!590318)))

(assert (=> d!126215 (= res!694447 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32129 lt!459253)))))

(assert (=> d!126215 (= (arrayNoDuplicates!0 lt!459253 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105959 (Cons!21949 (select (arr!31597 lt!459253) #b00000000000000000000000000000000) Nil!21950) Nil!21950)) e!590318)))

(declare-fun b!1042325 () Bool)

(assert (=> b!1042325 (= e!590316 e!590319)))

(assert (=> b!1042325 (= c!105973 (validKeyInArray!0 (select (arr!31597 lt!459253) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1042326 () Bool)

(assert (=> b!1042326 (= e!590317 (contains!6078 (ite c!105959 (Cons!21949 (select (arr!31597 lt!459253) #b00000000000000000000000000000000) Nil!21950) Nil!21950) (select (arr!31597 lt!459253) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!126215 (not res!694447)) b!1042323))

(assert (= (and b!1042323 res!694446) b!1042326))

(assert (= (and b!1042323 res!694445) b!1042325))

(assert (= (and b!1042325 c!105973) b!1042322))

(assert (= (and b!1042325 (not c!105973)) b!1042324))

(assert (= (or b!1042322 b!1042324) bm!44153))

(declare-fun m!962179 () Bool)

(assert (=> b!1042323 m!962179))

(assert (=> b!1042323 m!962179))

(declare-fun m!962181 () Bool)

(assert (=> b!1042323 m!962181))

(assert (=> bm!44153 m!962179))

(declare-fun m!962183 () Bool)

(assert (=> bm!44153 m!962183))

(assert (=> b!1042325 m!962179))

(assert (=> b!1042325 m!962179))

(assert (=> b!1042325 m!962181))

(assert (=> b!1042326 m!962179))

(assert (=> b!1042326 m!962179))

(declare-fun m!962185 () Bool)

(assert (=> b!1042326 m!962185))

(assert (=> bm!44150 d!126215))

(assert (=> b!1042224 d!126211))

(declare-fun d!126217 () Bool)

(assert (=> d!126217 (arrayContainsKey!0 lt!459253 lt!459308 #b00000000000000000000000000000000)))

(declare-fun lt!459334 () Unit!34031)

(declare-fun choose!13 (array!65681 (_ BitVec 64) (_ BitVec 32)) Unit!34031)

(assert (=> d!126217 (= lt!459334 (choose!13 lt!459253 lt!459308 #b00000000000000000000000000000000))))

(assert (=> d!126217 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!126217 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459253 lt!459308 #b00000000000000000000000000000000) lt!459334)))

(declare-fun bs!30467 () Bool)

(assert (= bs!30467 d!126217))

(assert (=> bs!30467 m!962121))

(declare-fun m!962187 () Bool)

(assert (=> bs!30467 m!962187))

(assert (=> b!1042242 d!126217))

(declare-fun d!126219 () Bool)

(declare-fun res!694448 () Bool)

(declare-fun e!590320 () Bool)

(assert (=> d!126219 (=> res!694448 e!590320)))

(assert (=> d!126219 (= res!694448 (= (select (arr!31597 lt!459253) #b00000000000000000000000000000000) lt!459308))))

(assert (=> d!126219 (= (arrayContainsKey!0 lt!459253 lt!459308 #b00000000000000000000000000000000) e!590320)))

(declare-fun b!1042327 () Bool)

(declare-fun e!590321 () Bool)

(assert (=> b!1042327 (= e!590320 e!590321)))

(declare-fun res!694449 () Bool)

(assert (=> b!1042327 (=> (not res!694449) (not e!590321))))

(assert (=> b!1042327 (= res!694449 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32129 lt!459253)))))

(declare-fun b!1042328 () Bool)

(assert (=> b!1042328 (= e!590321 (arrayContainsKey!0 lt!459253 lt!459308 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126219 (not res!694448)) b!1042327))

(assert (= (and b!1042327 res!694449) b!1042328))

(assert (=> d!126219 m!962111))

(declare-fun m!962189 () Bool)

(assert (=> b!1042328 m!962189))

(assert (=> b!1042242 d!126219))

(declare-fun b!1042341 () Bool)

(declare-fun e!590330 () SeekEntryResult!9757)

(declare-fun e!590329 () SeekEntryResult!9757)

(assert (=> b!1042341 (= e!590330 e!590329)))

(declare-fun lt!459342 () (_ BitVec 64))

(declare-fun lt!459343 () SeekEntryResult!9757)

(assert (=> b!1042341 (= lt!459342 (select (arr!31597 lt!459253) (index!41401 lt!459343)))))

(declare-fun c!105982 () Bool)

(assert (=> b!1042341 (= c!105982 (= lt!459342 (select (arr!31597 lt!459253) #b00000000000000000000000000000000)))))

(declare-fun b!1042342 () Bool)

(declare-fun e!590328 () SeekEntryResult!9757)

(assert (=> b!1042342 (= e!590328 (MissingZero!9757 (index!41401 lt!459343)))))

(declare-fun d!126221 () Bool)

(declare-fun lt!459341 () SeekEntryResult!9757)

(assert (=> d!126221 (and (or ((_ is Undefined!9757) lt!459341) (not ((_ is Found!9757) lt!459341)) (and (bvsge (index!41400 lt!459341) #b00000000000000000000000000000000) (bvslt (index!41400 lt!459341) (size!32129 lt!459253)))) (or ((_ is Undefined!9757) lt!459341) ((_ is Found!9757) lt!459341) (not ((_ is MissingZero!9757) lt!459341)) (and (bvsge (index!41399 lt!459341) #b00000000000000000000000000000000) (bvslt (index!41399 lt!459341) (size!32129 lt!459253)))) (or ((_ is Undefined!9757) lt!459341) ((_ is Found!9757) lt!459341) ((_ is MissingZero!9757) lt!459341) (not ((_ is MissingVacant!9757) lt!459341)) (and (bvsge (index!41402 lt!459341) #b00000000000000000000000000000000) (bvslt (index!41402 lt!459341) (size!32129 lt!459253)))) (or ((_ is Undefined!9757) lt!459341) (ite ((_ is Found!9757) lt!459341) (= (select (arr!31597 lt!459253) (index!41400 lt!459341)) (select (arr!31597 lt!459253) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9757) lt!459341) (= (select (arr!31597 lt!459253) (index!41399 lt!459341)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9757) lt!459341) (= (select (arr!31597 lt!459253) (index!41402 lt!459341)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!126221 (= lt!459341 e!590330)))

(declare-fun c!105981 () Bool)

(assert (=> d!126221 (= c!105981 (and ((_ is Intermediate!9757) lt!459343) (undefined!10569 lt!459343)))))

(assert (=> d!126221 (= lt!459343 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31597 lt!459253) #b00000000000000000000000000000000) (mask!30415 thiss!1427)) (select (arr!31597 lt!459253) #b00000000000000000000000000000000) lt!459253 (mask!30415 thiss!1427)))))

(assert (=> d!126221 (validMask!0 (mask!30415 thiss!1427))))

(assert (=> d!126221 (= (seekEntryOrOpen!0 (select (arr!31597 lt!459253) #b00000000000000000000000000000000) lt!459253 (mask!30415 thiss!1427)) lt!459341)))

(declare-fun b!1042343 () Bool)

(declare-fun c!105980 () Bool)

(assert (=> b!1042343 (= c!105980 (= lt!459342 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1042343 (= e!590329 e!590328)))

(declare-fun b!1042344 () Bool)

(assert (=> b!1042344 (= e!590329 (Found!9757 (index!41401 lt!459343)))))

(declare-fun b!1042345 () Bool)

(assert (=> b!1042345 (= e!590328 (seekKeyOrZeroReturnVacant!0 (x!92899 lt!459343) (index!41401 lt!459343) (index!41401 lt!459343) (select (arr!31597 lt!459253) #b00000000000000000000000000000000) lt!459253 (mask!30415 thiss!1427)))))

(declare-fun b!1042346 () Bool)

(assert (=> b!1042346 (= e!590330 Undefined!9757)))

(assert (= (and d!126221 c!105981) b!1042346))

(assert (= (and d!126221 (not c!105981)) b!1042341))

(assert (= (and b!1042341 c!105982) b!1042344))

(assert (= (and b!1042341 (not c!105982)) b!1042343))

(assert (= (and b!1042343 c!105980) b!1042342))

(assert (= (and b!1042343 (not c!105980)) b!1042345))

(declare-fun m!962191 () Bool)

(assert (=> b!1042341 m!962191))

(declare-fun m!962193 () Bool)

(assert (=> d!126221 m!962193))

(assert (=> d!126221 m!962111))

(declare-fun m!962195 () Bool)

(assert (=> d!126221 m!962195))

(declare-fun m!962197 () Bool)

(assert (=> d!126221 m!962197))

(declare-fun m!962199 () Bool)

(assert (=> d!126221 m!962199))

(assert (=> d!126221 m!962195))

(assert (=> d!126221 m!962111))

(declare-fun m!962201 () Bool)

(assert (=> d!126221 m!962201))

(assert (=> d!126221 m!962017))

(assert (=> b!1042345 m!962111))

(declare-fun m!962203 () Bool)

(assert (=> b!1042345 m!962203))

(assert (=> b!1042242 d!126221))

(declare-fun d!126223 () Bool)

(assert (=> d!126223 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1042280 d!126223))

(declare-fun b!1042358 () Bool)

(declare-fun e!590333 () Bool)

(assert (=> b!1042358 (= e!590333 (and (bvsge (extraKeys!6076 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6076 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!3021 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1042356 () Bool)

(declare-fun res!694459 () Bool)

(assert (=> b!1042356 (=> (not res!694459) (not e!590333))))

(declare-fun size!32135 (LongMapFixedSize!5932) (_ BitVec 32))

(assert (=> b!1042356 (= res!694459 (bvsge (size!32135 thiss!1427) (_size!3021 thiss!1427)))))

(declare-fun b!1042357 () Bool)

(declare-fun res!694458 () Bool)

(assert (=> b!1042357 (=> (not res!694458) (not e!590333))))

(assert (=> b!1042357 (= res!694458 (= (size!32135 thiss!1427) (bvadd (_size!3021 thiss!1427) (bvsdiv (bvadd (extraKeys!6076 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!126225 () Bool)

(declare-fun res!694460 () Bool)

(assert (=> d!126225 (=> (not res!694460) (not e!590333))))

(assert (=> d!126225 (= res!694460 (validMask!0 (mask!30415 thiss!1427)))))

(assert (=> d!126225 (= (simpleValid!436 thiss!1427) e!590333)))

(declare-fun b!1042355 () Bool)

(declare-fun res!694461 () Bool)

(assert (=> b!1042355 (=> (not res!694461) (not e!590333))))

(assert (=> b!1042355 (= res!694461 (and (= (size!32130 (_values!6371 thiss!1427)) (bvadd (mask!30415 thiss!1427) #b00000000000000000000000000000001)) (= (size!32129 (_keys!11612 thiss!1427)) (size!32130 (_values!6371 thiss!1427))) (bvsge (_size!3021 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!3021 thiss!1427) (bvadd (mask!30415 thiss!1427) #b00000000000000000000000000000001))))))

(assert (= (and d!126225 res!694460) b!1042355))

(assert (= (and b!1042355 res!694461) b!1042356))

(assert (= (and b!1042356 res!694459) b!1042357))

(assert (= (and b!1042357 res!694458) b!1042358))

(declare-fun m!962205 () Bool)

(assert (=> b!1042356 m!962205))

(assert (=> b!1042357 m!962205))

(assert (=> d!126225 m!962017))

(assert (=> d!126207 d!126225))

(declare-fun b!1042359 () Bool)

(declare-fun e!590334 () (_ BitVec 32))

(declare-fun e!590335 () (_ BitVec 32))

(assert (=> b!1042359 (= e!590334 e!590335)))

(declare-fun c!105983 () Bool)

(assert (=> b!1042359 (= c!105983 (validKeyInArray!0 (select (arr!31597 lt!459253) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!126227 () Bool)

(declare-fun lt!459344 () (_ BitVec 32))

(assert (=> d!126227 (and (bvsge lt!459344 #b00000000000000000000000000000000) (bvsle lt!459344 (bvsub (size!32129 lt!459253) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!126227 (= lt!459344 e!590334)))

(declare-fun c!105984 () Bool)

(assert (=> d!126227 (= c!105984 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32129 (_keys!11612 thiss!1427))))))

(assert (=> d!126227 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32129 (_keys!11612 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32129 (_keys!11612 thiss!1427)) (size!32129 lt!459253)))))

(assert (=> d!126227 (= (arrayCountValidKeys!0 lt!459253 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32129 (_keys!11612 thiss!1427))) lt!459344)))

(declare-fun b!1042360 () Bool)

(declare-fun call!44157 () (_ BitVec 32))

(assert (=> b!1042360 (= e!590335 (bvadd #b00000000000000000000000000000001 call!44157))))

(declare-fun b!1042361 () Bool)

(assert (=> b!1042361 (= e!590334 #b00000000000000000000000000000000)))

(declare-fun b!1042362 () Bool)

(assert (=> b!1042362 (= e!590335 call!44157)))

(declare-fun bm!44154 () Bool)

(assert (=> bm!44154 (= call!44157 (arrayCountValidKeys!0 lt!459253 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32129 (_keys!11612 thiss!1427))))))

(assert (= (and d!126227 c!105984) b!1042361))

(assert (= (and d!126227 (not c!105984)) b!1042359))

(assert (= (and b!1042359 c!105983) b!1042360))

(assert (= (and b!1042359 (not c!105983)) b!1042362))

(assert (= (or b!1042360 b!1042362) bm!44154))

(assert (=> b!1042359 m!962179))

(assert (=> b!1042359 m!962179))

(assert (=> b!1042359 m!962181))

(declare-fun m!962207 () Bool)

(assert (=> bm!44154 m!962207))

(assert (=> bm!44144 d!126227))

(declare-fun d!126229 () Bool)

(assert (=> d!126229 (arrayNoDuplicates!0 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))) #b00000000000000000000000000000000 Nil!21950)))

(assert (=> d!126229 true))

(declare-fun _$66!47 () Unit!34031)

(assert (=> d!126229 (= (choose!53 (_keys!11612 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41400 lt!459252) #b00000000000000000000000000000000 Nil!21950) _$66!47)))

(declare-fun bs!30468 () Bool)

(assert (= bs!30468 d!126229))

(assert (=> bs!30468 m!962013))

(assert (=> bs!30468 m!962109))

(assert (=> d!126183 d!126229))

(assert (=> b!1042307 d!126197))

(assert (=> b!1042265 d!126211))

(declare-fun b!1042363 () Bool)

(declare-fun e!590336 () Bool)

(declare-fun e!590338 () Bool)

(assert (=> b!1042363 (= e!590336 e!590338)))

(declare-fun lt!459347 () (_ BitVec 64))

(assert (=> b!1042363 (= lt!459347 (select (arr!31597 lt!459253) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!459345 () Unit!34031)

(assert (=> b!1042363 (= lt!459345 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459253 lt!459347 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1042363 (arrayContainsKey!0 lt!459253 lt!459347 #b00000000000000000000000000000000)))

(declare-fun lt!459346 () Unit!34031)

(assert (=> b!1042363 (= lt!459346 lt!459345)))

(declare-fun res!694462 () Bool)

(assert (=> b!1042363 (= res!694462 (= (seekEntryOrOpen!0 (select (arr!31597 lt!459253) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!459253 (mask!30415 thiss!1427)) (Found!9757 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1042363 (=> (not res!694462) (not e!590338))))

(declare-fun b!1042364 () Bool)

(declare-fun e!590337 () Bool)

(assert (=> b!1042364 (= e!590337 e!590336)))

(declare-fun c!105985 () Bool)

(assert (=> b!1042364 (= c!105985 (validKeyInArray!0 (select (arr!31597 lt!459253) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!44155 () Bool)

(declare-fun call!44158 () Bool)

(assert (=> bm!44155 (= call!44158 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!459253 (mask!30415 thiss!1427)))))

(declare-fun d!126231 () Bool)

(declare-fun res!694463 () Bool)

(assert (=> d!126231 (=> res!694463 e!590337)))

(assert (=> d!126231 (= res!694463 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32129 lt!459253)))))

(assert (=> d!126231 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459253 (mask!30415 thiss!1427)) e!590337)))

(declare-fun b!1042365 () Bool)

(assert (=> b!1042365 (= e!590338 call!44158)))

(declare-fun b!1042366 () Bool)

(assert (=> b!1042366 (= e!590336 call!44158)))

(assert (= (and d!126231 (not res!694463)) b!1042364))

(assert (= (and b!1042364 c!105985) b!1042363))

(assert (= (and b!1042364 (not c!105985)) b!1042366))

(assert (= (and b!1042363 res!694462) b!1042365))

(assert (= (or b!1042365 b!1042366) bm!44155))

(assert (=> b!1042363 m!962179))

(declare-fun m!962209 () Bool)

(assert (=> b!1042363 m!962209))

(declare-fun m!962211 () Bool)

(assert (=> b!1042363 m!962211))

(assert (=> b!1042363 m!962179))

(declare-fun m!962213 () Bool)

(assert (=> b!1042363 m!962213))

(assert (=> b!1042364 m!962179))

(assert (=> b!1042364 m!962179))

(assert (=> b!1042364 m!962181))

(declare-fun m!962215 () Bool)

(assert (=> bm!44155 m!962215))

(assert (=> bm!44147 d!126231))

(declare-fun b!1042367 () Bool)

(declare-fun e!590339 () (_ BitVec 32))

(declare-fun e!590340 () (_ BitVec 32))

(assert (=> b!1042367 (= e!590339 e!590340)))

(declare-fun c!105986 () Bool)

(assert (=> b!1042367 (= c!105986 (validKeyInArray!0 (select (arr!31597 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!126233 () Bool)

(declare-fun lt!459348 () (_ BitVec 32))

(assert (=> d!126233 (and (bvsge lt!459348 #b00000000000000000000000000000000) (bvsle lt!459348 (bvsub (size!32129 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!126233 (= lt!459348 e!590339)))

(declare-fun c!105987 () Bool)

(assert (=> d!126233 (= c!105987 (bvsge #b00000000000000000000000000000000 (size!32129 (_keys!11612 thiss!1427))))))

(assert (=> d!126233 (and (bvsle #b00000000000000000000000000000000 (size!32129 (_keys!11612 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32129 (_keys!11612 thiss!1427)) (size!32129 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))))))))

(assert (=> d!126233 (= (arrayCountValidKeys!0 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))) #b00000000000000000000000000000000 (size!32129 (_keys!11612 thiss!1427))) lt!459348)))

(declare-fun b!1042368 () Bool)

(declare-fun call!44159 () (_ BitVec 32))

(assert (=> b!1042368 (= e!590340 (bvadd #b00000000000000000000000000000001 call!44159))))

(declare-fun b!1042369 () Bool)

(assert (=> b!1042369 (= e!590339 #b00000000000000000000000000000000)))

(declare-fun b!1042370 () Bool)

(assert (=> b!1042370 (= e!590340 call!44159)))

(declare-fun bm!44156 () Bool)

(assert (=> bm!44156 (= call!44159 (arrayCountValidKeys!0 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32129 (_keys!11612 thiss!1427))))))

(assert (= (and d!126233 c!105987) b!1042369))

(assert (= (and d!126233 (not c!105987)) b!1042367))

(assert (= (and b!1042367 c!105986) b!1042368))

(assert (= (and b!1042367 (not c!105986)) b!1042370))

(assert (= (or b!1042368 b!1042370) bm!44156))

(declare-fun m!962217 () Bool)

(assert (=> b!1042367 m!962217))

(assert (=> b!1042367 m!962217))

(declare-fun m!962219 () Bool)

(assert (=> b!1042367 m!962219))

(declare-fun m!962221 () Bool)

(assert (=> bm!44156 m!962221))

(assert (=> b!1042282 d!126233))

(assert (=> b!1042282 d!126197))

(declare-fun d!126235 () Bool)

(declare-fun lt!459351 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!523 (List!21953) (InoxSet (_ BitVec 64)))

(assert (=> d!126235 (= lt!459351 (select (content!523 Nil!21950) (select (arr!31597 lt!459253) #b00000000000000000000000000000000)))))

(declare-fun e!590345 () Bool)

(assert (=> d!126235 (= lt!459351 e!590345)))

(declare-fun res!694468 () Bool)

(assert (=> d!126235 (=> (not res!694468) (not e!590345))))

(assert (=> d!126235 (= res!694468 ((_ is Cons!21949) Nil!21950))))

(assert (=> d!126235 (= (contains!6078 Nil!21950 (select (arr!31597 lt!459253) #b00000000000000000000000000000000)) lt!459351)))

(declare-fun b!1042375 () Bool)

(declare-fun e!590346 () Bool)

(assert (=> b!1042375 (= e!590345 e!590346)))

(declare-fun res!694469 () Bool)

(assert (=> b!1042375 (=> res!694469 e!590346)))

(assert (=> b!1042375 (= res!694469 (= (h!23162 Nil!21950) (select (arr!31597 lt!459253) #b00000000000000000000000000000000)))))

(declare-fun b!1042376 () Bool)

(assert (=> b!1042376 (= e!590346 (contains!6078 (t!31159 Nil!21950) (select (arr!31597 lt!459253) #b00000000000000000000000000000000)))))

(assert (= (and d!126235 res!694468) b!1042375))

(assert (= (and b!1042375 (not res!694469)) b!1042376))

(declare-fun m!962223 () Bool)

(assert (=> d!126235 m!962223))

(assert (=> d!126235 m!962111))

(declare-fun m!962225 () Bool)

(assert (=> d!126235 m!962225))

(assert (=> b!1042376 m!962111))

(declare-fun m!962227 () Bool)

(assert (=> b!1042376 m!962227))

(assert (=> b!1042266 d!126235))

(declare-fun b!1042377 () Bool)

(declare-fun e!590350 () Bool)

(declare-fun call!44160 () Bool)

(assert (=> b!1042377 (= e!590350 call!44160)))

(declare-fun b!1042378 () Bool)

(declare-fun e!590349 () Bool)

(declare-fun e!590347 () Bool)

(assert (=> b!1042378 (= e!590349 e!590347)))

(declare-fun res!694470 () Bool)

(assert (=> b!1042378 (=> (not res!694470) (not e!590347))))

(declare-fun e!590348 () Bool)

(assert (=> b!1042378 (= res!694470 (not e!590348))))

(declare-fun res!694471 () Bool)

(assert (=> b!1042378 (=> (not res!694471) (not e!590348))))

(assert (=> b!1042378 (= res!694471 (validKeyInArray!0 (select (arr!31597 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!44157 () Bool)

(declare-fun c!105988 () Bool)

(assert (=> bm!44157 (= call!44160 (arrayNoDuplicates!0 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105988 (Cons!21949 (select (arr!31597 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427)))) #b00000000000000000000000000000000) Nil!21950) Nil!21950)))))

(declare-fun b!1042379 () Bool)

(assert (=> b!1042379 (= e!590350 call!44160)))

(declare-fun d!126237 () Bool)

(declare-fun res!694472 () Bool)

(assert (=> d!126237 (=> res!694472 e!590349)))

(assert (=> d!126237 (= res!694472 (bvsge #b00000000000000000000000000000000 (size!32129 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))))))))

(assert (=> d!126237 (= (arrayNoDuplicates!0 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))) #b00000000000000000000000000000000 Nil!21950) e!590349)))

(declare-fun b!1042380 () Bool)

(assert (=> b!1042380 (= e!590347 e!590350)))

(assert (=> b!1042380 (= c!105988 (validKeyInArray!0 (select (arr!31597 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1042381 () Bool)

(assert (=> b!1042381 (= e!590348 (contains!6078 Nil!21950 (select (arr!31597 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (= (and d!126237 (not res!694472)) b!1042378))

(assert (= (and b!1042378 res!694471) b!1042381))

(assert (= (and b!1042378 res!694470) b!1042380))

(assert (= (and b!1042380 c!105988) b!1042377))

(assert (= (and b!1042380 (not c!105988)) b!1042379))

(assert (= (or b!1042377 b!1042379) bm!44157))

(assert (=> b!1042378 m!962217))

(assert (=> b!1042378 m!962217))

(assert (=> b!1042378 m!962219))

(assert (=> bm!44157 m!962217))

(declare-fun m!962229 () Bool)

(assert (=> bm!44157 m!962229))

(assert (=> b!1042380 m!962217))

(assert (=> b!1042380 m!962217))

(assert (=> b!1042380 m!962219))

(assert (=> b!1042381 m!962217))

(assert (=> b!1042381 m!962217))

(declare-fun m!962231 () Bool)

(assert (=> b!1042381 m!962231))

(assert (=> b!1042215 d!126237))

(declare-fun b!1042401 () Bool)

(declare-fun e!590362 () SeekEntryResult!9757)

(declare-fun e!590365 () SeekEntryResult!9757)

(assert (=> b!1042401 (= e!590362 e!590365)))

(declare-fun c!105996 () Bool)

(declare-fun lt!459356 () (_ BitVec 64))

(assert (=> b!1042401 (= c!105996 (or (= lt!459356 key!909) (= (bvadd lt!459356 lt!459356) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1042402 () Bool)

(assert (=> b!1042402 (= e!590362 (Intermediate!9757 true (toIndex!0 key!909 (mask!30415 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1042403 () Bool)

(declare-fun lt!459357 () SeekEntryResult!9757)

(assert (=> b!1042403 (and (bvsge (index!41401 lt!459357) #b00000000000000000000000000000000) (bvslt (index!41401 lt!459357) (size!32129 (_keys!11612 thiss!1427))))))

(declare-fun e!590363 () Bool)

(assert (=> b!1042403 (= e!590363 (= (select (arr!31597 (_keys!11612 thiss!1427)) (index!41401 lt!459357)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1042404 () Bool)

(declare-fun e!590364 () Bool)

(assert (=> b!1042404 (= e!590364 (bvsge (x!92899 lt!459357) #b01111111111111111111111111111110))))

(declare-fun b!1042405 () Bool)

(assert (=> b!1042405 (and (bvsge (index!41401 lt!459357) #b00000000000000000000000000000000) (bvslt (index!41401 lt!459357) (size!32129 (_keys!11612 thiss!1427))))))

(declare-fun res!694479 () Bool)

(assert (=> b!1042405 (= res!694479 (= (select (arr!31597 (_keys!11612 thiss!1427)) (index!41401 lt!459357)) key!909))))

(assert (=> b!1042405 (=> res!694479 e!590363)))

(declare-fun e!590361 () Bool)

(assert (=> b!1042405 (= e!590361 e!590363)))

(declare-fun b!1042406 () Bool)

(assert (=> b!1042406 (and (bvsge (index!41401 lt!459357) #b00000000000000000000000000000000) (bvslt (index!41401 lt!459357) (size!32129 (_keys!11612 thiss!1427))))))

(declare-fun res!694481 () Bool)

(assert (=> b!1042406 (= res!694481 (= (select (arr!31597 (_keys!11612 thiss!1427)) (index!41401 lt!459357)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1042406 (=> res!694481 e!590363)))

(declare-fun b!1042400 () Bool)

(assert (=> b!1042400 (= e!590365 (Intermediate!9757 false (toIndex!0 key!909 (mask!30415 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun d!126239 () Bool)

(assert (=> d!126239 e!590364))

(declare-fun c!105997 () Bool)

(assert (=> d!126239 (= c!105997 (and ((_ is Intermediate!9757) lt!459357) (undefined!10569 lt!459357)))))

(assert (=> d!126239 (= lt!459357 e!590362)))

(declare-fun c!105995 () Bool)

(assert (=> d!126239 (= c!105995 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!126239 (= lt!459356 (select (arr!31597 (_keys!11612 thiss!1427)) (toIndex!0 key!909 (mask!30415 thiss!1427))))))

(assert (=> d!126239 (validMask!0 (mask!30415 thiss!1427))))

(assert (=> d!126239 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30415 thiss!1427)) key!909 (_keys!11612 thiss!1427) (mask!30415 thiss!1427)) lt!459357)))

(declare-fun b!1042407 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1042407 (= e!590365 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!30415 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!30415 thiss!1427)) key!909 (_keys!11612 thiss!1427) (mask!30415 thiss!1427)))))

(declare-fun b!1042408 () Bool)

(assert (=> b!1042408 (= e!590364 e!590361)))

(declare-fun res!694480 () Bool)

(assert (=> b!1042408 (= res!694480 (and ((_ is Intermediate!9757) lt!459357) (not (undefined!10569 lt!459357)) (bvslt (x!92899 lt!459357) #b01111111111111111111111111111110) (bvsge (x!92899 lt!459357) #b00000000000000000000000000000000) (bvsge (x!92899 lt!459357) #b00000000000000000000000000000000)))))

(assert (=> b!1042408 (=> (not res!694480) (not e!590361))))

(assert (= (and d!126239 c!105995) b!1042402))

(assert (= (and d!126239 (not c!105995)) b!1042401))

(assert (= (and b!1042401 c!105996) b!1042400))

(assert (= (and b!1042401 (not c!105996)) b!1042407))

(assert (= (and d!126239 c!105997) b!1042404))

(assert (= (and d!126239 (not c!105997)) b!1042408))

(assert (= (and b!1042408 res!694480) b!1042405))

(assert (= (and b!1042405 (not res!694479)) b!1042406))

(assert (= (and b!1042406 (not res!694481)) b!1042403))

(declare-fun m!962233 () Bool)

(assert (=> b!1042405 m!962233))

(assert (=> b!1042407 m!962157))

(declare-fun m!962235 () Bool)

(assert (=> b!1042407 m!962235))

(assert (=> b!1042407 m!962235))

(declare-fun m!962237 () Bool)

(assert (=> b!1042407 m!962237))

(assert (=> b!1042403 m!962233))

(assert (=> d!126239 m!962157))

(declare-fun m!962239 () Bool)

(assert (=> d!126239 m!962239))

(assert (=> d!126239 m!962017))

(assert (=> b!1042406 m!962233))

(assert (=> d!126205 d!126239))

(declare-fun d!126241 () Bool)

(declare-fun lt!459363 () (_ BitVec 32))

(declare-fun lt!459362 () (_ BitVec 32))

(assert (=> d!126241 (= lt!459363 (bvmul (bvxor lt!459362 (bvlshr lt!459362 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!126241 (= lt!459362 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!126241 (and (bvsge (mask!30415 thiss!1427) #b00000000000000000000000000000000) (let ((res!694482 (let ((h!23164 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!92917 (bvmul (bvxor h!23164 (bvlshr h!23164 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!92917 (bvlshr x!92917 #b00000000000000000000000000001101)) (mask!30415 thiss!1427)))))) (and (bvslt res!694482 (bvadd (mask!30415 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!694482 #b00000000000000000000000000000000))))))

(assert (=> d!126241 (= (toIndex!0 key!909 (mask!30415 thiss!1427)) (bvand (bvxor lt!459363 (bvlshr lt!459363 #b00000000000000000000000000001101)) (mask!30415 thiss!1427)))))

(assert (=> d!126205 d!126241))

(assert (=> d!126205 d!126181))

(declare-fun d!126243 () Bool)

(declare-fun res!694483 () Bool)

(declare-fun e!590366 () Bool)

(assert (=> d!126243 (=> res!694483 e!590366)))

(assert (=> d!126243 (= res!694483 (= (select (arr!31597 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126243 (= (arrayContainsKey!0 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))) key!909 #b00000000000000000000000000000000) e!590366)))

(declare-fun b!1042409 () Bool)

(declare-fun e!590367 () Bool)

(assert (=> b!1042409 (= e!590366 e!590367)))

(declare-fun res!694484 () Bool)

(assert (=> b!1042409 (=> (not res!694484) (not e!590367))))

(assert (=> b!1042409 (= res!694484 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32129 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))))))))

(declare-fun b!1042410 () Bool)

(assert (=> b!1042410 (= e!590367 (arrayContainsKey!0 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126243 (not res!694483)) b!1042409))

(assert (= (and b!1042409 res!694484) b!1042410))

(assert (=> d!126243 m!962217))

(declare-fun m!962241 () Bool)

(assert (=> b!1042410 m!962241))

(assert (=> b!1042248 d!126243))

(declare-fun b!1042411 () Bool)

(declare-fun e!590368 () Bool)

(declare-fun e!590370 () Bool)

(assert (=> b!1042411 (= e!590368 e!590370)))

(declare-fun lt!459366 () (_ BitVec 64))

(assert (=> b!1042411 (= lt!459366 (select (arr!31597 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!459364 () Unit!34031)

(assert (=> b!1042411 (= lt!459364 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))) lt!459366 #b00000000000000000000000000000000))))

(assert (=> b!1042411 (arrayContainsKey!0 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))) lt!459366 #b00000000000000000000000000000000)))

(declare-fun lt!459365 () Unit!34031)

(assert (=> b!1042411 (= lt!459365 lt!459364)))

(declare-fun res!694485 () Bool)

(assert (=> b!1042411 (= res!694485 (= (seekEntryOrOpen!0 (select (arr!31597 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427)))) #b00000000000000000000000000000000) (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))) (mask!30415 thiss!1427)) (Found!9757 #b00000000000000000000000000000000)))))

(assert (=> b!1042411 (=> (not res!694485) (not e!590370))))

(declare-fun b!1042412 () Bool)

(declare-fun e!590369 () Bool)

(assert (=> b!1042412 (= e!590369 e!590368)))

(declare-fun c!105998 () Bool)

(assert (=> b!1042412 (= c!105998 (validKeyInArray!0 (select (arr!31597 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!44158 () Bool)

(declare-fun call!44161 () Bool)

(assert (=> bm!44158 (= call!44161 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))) (mask!30415 thiss!1427)))))

(declare-fun d!126245 () Bool)

(declare-fun res!694486 () Bool)

(assert (=> d!126245 (=> res!694486 e!590369)))

(assert (=> d!126245 (= res!694486 (bvsge #b00000000000000000000000000000000 (size!32129 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))))))))

(assert (=> d!126245 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))) (mask!30415 thiss!1427)) e!590369)))

(declare-fun b!1042413 () Bool)

(assert (=> b!1042413 (= e!590370 call!44161)))

(declare-fun b!1042414 () Bool)

(assert (=> b!1042414 (= e!590368 call!44161)))

(assert (= (and d!126245 (not res!694486)) b!1042412))

(assert (= (and b!1042412 c!105998) b!1042411))

(assert (= (and b!1042412 (not c!105998)) b!1042414))

(assert (= (and b!1042411 res!694485) b!1042413))

(assert (= (or b!1042413 b!1042414) bm!44158))

(assert (=> b!1042411 m!962217))

(declare-fun m!962243 () Bool)

(assert (=> b!1042411 m!962243))

(declare-fun m!962245 () Bool)

(assert (=> b!1042411 m!962245))

(assert (=> b!1042411 m!962217))

(declare-fun m!962247 () Bool)

(assert (=> b!1042411 m!962247))

(assert (=> b!1042412 m!962217))

(assert (=> b!1042412 m!962217))

(assert (=> b!1042412 m!962219))

(declare-fun m!962249 () Bool)

(assert (=> bm!44158 m!962249))

(assert (=> b!1042251 d!126245))

(declare-fun b!1042415 () Bool)

(declare-fun e!590374 () Bool)

(declare-fun call!44162 () Bool)

(assert (=> b!1042415 (= e!590374 call!44162)))

(declare-fun b!1042416 () Bool)

(declare-fun e!590373 () Bool)

(declare-fun e!590371 () Bool)

(assert (=> b!1042416 (= e!590373 e!590371)))

(declare-fun res!694487 () Bool)

(assert (=> b!1042416 (=> (not res!694487) (not e!590371))))

(declare-fun e!590372 () Bool)

(assert (=> b!1042416 (= res!694487 (not e!590372))))

(declare-fun res!694488 () Bool)

(assert (=> b!1042416 (=> (not res!694488) (not e!590372))))

(assert (=> b!1042416 (= res!694488 (validKeyInArray!0 (select (arr!31597 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44159 () Bool)

(declare-fun c!105999 () Bool)

(assert (=> bm!44159 (= call!44162 (arrayNoDuplicates!0 (_keys!11612 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105999 (Cons!21949 (select (arr!31597 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000) Nil!21950) Nil!21950)))))

(declare-fun b!1042417 () Bool)

(assert (=> b!1042417 (= e!590374 call!44162)))

(declare-fun d!126247 () Bool)

(declare-fun res!694489 () Bool)

(assert (=> d!126247 (=> res!694489 e!590373)))

(assert (=> d!126247 (= res!694489 (bvsge #b00000000000000000000000000000000 (size!32129 (_keys!11612 thiss!1427))))))

(assert (=> d!126247 (= (arrayNoDuplicates!0 (_keys!11612 thiss!1427) #b00000000000000000000000000000000 Nil!21950) e!590373)))

(declare-fun b!1042418 () Bool)

(assert (=> b!1042418 (= e!590371 e!590374)))

(assert (=> b!1042418 (= c!105999 (validKeyInArray!0 (select (arr!31597 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042419 () Bool)

(assert (=> b!1042419 (= e!590372 (contains!6078 Nil!21950 (select (arr!31597 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126247 (not res!694489)) b!1042416))

(assert (= (and b!1042416 res!694488) b!1042419))

(assert (= (and b!1042416 res!694487) b!1042418))

(assert (= (and b!1042418 c!105999) b!1042415))

(assert (= (and b!1042418 (not c!105999)) b!1042417))

(assert (= (or b!1042415 b!1042417) bm!44159))

(assert (=> b!1042416 m!962139))

(assert (=> b!1042416 m!962139))

(assert (=> b!1042416 m!962141))

(assert (=> bm!44159 m!962139))

(declare-fun m!962251 () Bool)

(assert (=> bm!44159 m!962251))

(assert (=> b!1042418 m!962139))

(assert (=> b!1042418 m!962139))

(assert (=> b!1042418 m!962141))

(assert (=> b!1042419 m!962139))

(assert (=> b!1042419 m!962139))

(declare-fun m!962253 () Bool)

(assert (=> b!1042419 m!962253))

(assert (=> b!1042309 d!126247))

(declare-fun b!1042420 () Bool)

(declare-fun e!590375 () Bool)

(declare-fun e!590377 () Bool)

(assert (=> b!1042420 (= e!590375 e!590377)))

(declare-fun lt!459369 () (_ BitVec 64))

(assert (=> b!1042420 (= lt!459369 (select (arr!31597 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459367 () Unit!34031)

(assert (=> b!1042420 (= lt!459367 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11612 thiss!1427) lt!459369 #b00000000000000000000000000000000))))

(assert (=> b!1042420 (arrayContainsKey!0 (_keys!11612 thiss!1427) lt!459369 #b00000000000000000000000000000000)))

(declare-fun lt!459368 () Unit!34031)

(assert (=> b!1042420 (= lt!459368 lt!459367)))

(declare-fun res!694490 () Bool)

(assert (=> b!1042420 (= res!694490 (= (seekEntryOrOpen!0 (select (arr!31597 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000) (_keys!11612 thiss!1427) (mask!30415 thiss!1427)) (Found!9757 #b00000000000000000000000000000000)))))

(assert (=> b!1042420 (=> (not res!694490) (not e!590377))))

(declare-fun b!1042421 () Bool)

(declare-fun e!590376 () Bool)

(assert (=> b!1042421 (= e!590376 e!590375)))

(declare-fun c!106000 () Bool)

(assert (=> b!1042421 (= c!106000 (validKeyInArray!0 (select (arr!31597 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44160 () Bool)

(declare-fun call!44163 () Bool)

(assert (=> bm!44160 (= call!44163 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11612 thiss!1427) (mask!30415 thiss!1427)))))

(declare-fun d!126249 () Bool)

(declare-fun res!694491 () Bool)

(assert (=> d!126249 (=> res!694491 e!590376)))

(assert (=> d!126249 (= res!694491 (bvsge #b00000000000000000000000000000000 (size!32129 (_keys!11612 thiss!1427))))))

(assert (=> d!126249 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11612 thiss!1427) (mask!30415 thiss!1427)) e!590376)))

(declare-fun b!1042422 () Bool)

(assert (=> b!1042422 (= e!590377 call!44163)))

(declare-fun b!1042423 () Bool)

(assert (=> b!1042423 (= e!590375 call!44163)))

(assert (= (and d!126249 (not res!694491)) b!1042421))

(assert (= (and b!1042421 c!106000) b!1042420))

(assert (= (and b!1042421 (not c!106000)) b!1042423))

(assert (= (and b!1042420 res!694490) b!1042422))

(assert (= (or b!1042422 b!1042423) bm!44160))

(assert (=> b!1042420 m!962139))

(declare-fun m!962255 () Bool)

(assert (=> b!1042420 m!962255))

(declare-fun m!962257 () Bool)

(assert (=> b!1042420 m!962257))

(assert (=> b!1042420 m!962139))

(declare-fun m!962259 () Bool)

(assert (=> b!1042420 m!962259))

(assert (=> b!1042421 m!962139))

(assert (=> b!1042421 m!962139))

(assert (=> b!1042421 m!962141))

(declare-fun m!962261 () Bool)

(assert (=> bm!44160 m!962261))

(assert (=> b!1042308 d!126249))

(declare-fun d!126251 () Bool)

(assert (=> d!126251 (= (arrayCountValidKeys!0 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))) #b00000000000000000000000000000000 (size!32129 (_keys!11612 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11612 thiss!1427) #b00000000000000000000000000000000 (size!32129 (_keys!11612 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!126251 true))

(declare-fun _$79!23 () Unit!34031)

(assert (=> d!126251 (= (choose!82 (_keys!11612 thiss!1427) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!23)))

(declare-fun bs!30469 () Bool)

(assert (= bs!30469 d!126251))

(assert (=> bs!30469 m!962013))

(assert (=> bs!30469 m!962151))

(assert (=> bs!30469 m!962023))

(assert (=> d!126199 d!126251))

(declare-fun d!126253 () Bool)

(assert (=> d!126253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))) (mask!30415 thiss!1427))))

(assert (=> d!126253 true))

(declare-fun _$44!21 () Unit!34031)

(assert (=> d!126253 (= (choose!25 (_keys!11612 thiss!1427) (index!41400 lt!459252) (mask!30415 thiss!1427)) _$44!21)))

(declare-fun bs!30470 () Bool)

(assert (= bs!30470 d!126253))

(assert (=> bs!30470 m!962013))

(assert (=> bs!30470 m!962133))

(assert (=> d!126193 d!126253))

(assert (=> d!126193 d!126181))

(declare-fun d!126255 () Bool)

(assert (=> d!126255 (= (validKeyInArray!0 (select (arr!31597 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31597 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31597 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1042267 d!126255))

(declare-fun b!1042436 () Bool)

(declare-fun c!106007 () Bool)

(declare-fun lt!459374 () (_ BitVec 64))

(assert (=> b!1042436 (= c!106007 (= lt!459374 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!590384 () SeekEntryResult!9757)

(declare-fun e!590386 () SeekEntryResult!9757)

(assert (=> b!1042436 (= e!590384 e!590386)))

(declare-fun lt!459375 () SeekEntryResult!9757)

(declare-fun d!126257 () Bool)

(assert (=> d!126257 (and (or ((_ is Undefined!9757) lt!459375) (not ((_ is Found!9757) lt!459375)) (and (bvsge (index!41400 lt!459375) #b00000000000000000000000000000000) (bvslt (index!41400 lt!459375) (size!32129 (_keys!11612 thiss!1427))))) (or ((_ is Undefined!9757) lt!459375) ((_ is Found!9757) lt!459375) (not ((_ is MissingVacant!9757) lt!459375)) (not (= (index!41402 lt!459375) (index!41401 lt!459327))) (and (bvsge (index!41402 lt!459375) #b00000000000000000000000000000000) (bvslt (index!41402 lt!459375) (size!32129 (_keys!11612 thiss!1427))))) (or ((_ is Undefined!9757) lt!459375) (ite ((_ is Found!9757) lt!459375) (= (select (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459375)) key!909) (and ((_ is MissingVacant!9757) lt!459375) (= (index!41402 lt!459375) (index!41401 lt!459327)) (= (select (arr!31597 (_keys!11612 thiss!1427)) (index!41402 lt!459375)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!590385 () SeekEntryResult!9757)

(assert (=> d!126257 (= lt!459375 e!590385)))

(declare-fun c!106008 () Bool)

(assert (=> d!126257 (= c!106008 (bvsge (x!92899 lt!459327) #b01111111111111111111111111111110))))

(assert (=> d!126257 (= lt!459374 (select (arr!31597 (_keys!11612 thiss!1427)) (index!41401 lt!459327)))))

(assert (=> d!126257 (validMask!0 (mask!30415 thiss!1427))))

(assert (=> d!126257 (= (seekKeyOrZeroReturnVacant!0 (x!92899 lt!459327) (index!41401 lt!459327) (index!41401 lt!459327) key!909 (_keys!11612 thiss!1427) (mask!30415 thiss!1427)) lt!459375)))

(declare-fun b!1042437 () Bool)

(assert (=> b!1042437 (= e!590385 Undefined!9757)))

(declare-fun b!1042438 () Bool)

(assert (=> b!1042438 (= e!590384 (Found!9757 (index!41401 lt!459327)))))

(declare-fun b!1042439 () Bool)

(assert (=> b!1042439 (= e!590386 (MissingVacant!9757 (index!41401 lt!459327)))))

(declare-fun b!1042440 () Bool)

(assert (=> b!1042440 (= e!590386 (seekKeyOrZeroReturnVacant!0 (bvadd (x!92899 lt!459327) #b00000000000000000000000000000001) (nextIndex!0 (index!41401 lt!459327) (bvadd (x!92899 lt!459327) #b00000000000000000000000000000001) (mask!30415 thiss!1427)) (index!41401 lt!459327) key!909 (_keys!11612 thiss!1427) (mask!30415 thiss!1427)))))

(declare-fun b!1042441 () Bool)

(assert (=> b!1042441 (= e!590385 e!590384)))

(declare-fun c!106009 () Bool)

(assert (=> b!1042441 (= c!106009 (= lt!459374 key!909))))

(assert (= (and d!126257 c!106008) b!1042437))

(assert (= (and d!126257 (not c!106008)) b!1042441))

(assert (= (and b!1042441 c!106009) b!1042438))

(assert (= (and b!1042441 (not c!106009)) b!1042436))

(assert (= (and b!1042436 c!106007) b!1042439))

(assert (= (and b!1042436 (not c!106007)) b!1042440))

(declare-fun m!962263 () Bool)

(assert (=> d!126257 m!962263))

(declare-fun m!962265 () Bool)

(assert (=> d!126257 m!962265))

(assert (=> d!126257 m!962161))

(assert (=> d!126257 m!962017))

(declare-fun m!962267 () Bool)

(assert (=> b!1042440 m!962267))

(assert (=> b!1042440 m!962267))

(declare-fun m!962269 () Bool)

(assert (=> b!1042440 m!962269))

(assert (=> b!1042298 d!126257))

(declare-fun d!126259 () Bool)

(assert (=> d!126259 (not (arrayContainsKey!0 (array!65682 (store (arr!31597 (_keys!11612 thiss!1427)) (index!41400 lt!459252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32129 (_keys!11612 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!126259 true))

(declare-fun _$59!23 () Unit!34031)

(assert (=> d!126259 (= (choose!121 (_keys!11612 thiss!1427) (index!41400 lt!459252) key!909) _$59!23)))

(declare-fun bs!30471 () Bool)

(assert (= bs!30471 d!126259))

(assert (=> bs!30471 m!962013))

(assert (=> bs!30471 m!962129))

(assert (=> d!126191 d!126259))

(declare-fun d!126261 () Bool)

(declare-fun res!694492 () Bool)

(declare-fun e!590387 () Bool)

(assert (=> d!126261 (=> res!694492 e!590387)))

(assert (=> d!126261 (= res!694492 (= (select (arr!31597 lt!459253) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!126261 (= (arrayContainsKey!0 lt!459253 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!590387)))

(declare-fun b!1042442 () Bool)

(declare-fun e!590388 () Bool)

(assert (=> b!1042442 (= e!590387 e!590388)))

(declare-fun res!694493 () Bool)

(assert (=> b!1042442 (=> (not res!694493) (not e!590388))))

(assert (=> b!1042442 (= res!694493 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32129 lt!459253)))))

(declare-fun b!1042443 () Bool)

(assert (=> b!1042443 (= e!590388 (arrayContainsKey!0 lt!459253 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!126261 (not res!694492)) b!1042442))

(assert (= (and b!1042442 res!694493) b!1042443))

(assert (=> d!126261 m!962179))

(declare-fun m!962271 () Bool)

(assert (=> b!1042443 m!962271))

(assert (=> b!1042233 d!126261))

(declare-fun b!1042444 () Bool)

(declare-fun e!590389 () Bool)

(assert (=> b!1042444 (= e!590389 tp_is_empty!24745)))

(declare-fun b!1042445 () Bool)

(declare-fun e!590390 () Bool)

(assert (=> b!1042445 (= e!590390 tp_is_empty!24745)))

(declare-fun mapIsEmpty!38714 () Bool)

(declare-fun mapRes!38714 () Bool)

(assert (=> mapIsEmpty!38714 mapRes!38714))

(declare-fun mapNonEmpty!38714 () Bool)

(declare-fun tp!74295 () Bool)

(assert (=> mapNonEmpty!38714 (= mapRes!38714 (and tp!74295 e!590389))))

(declare-fun mapKey!38714 () (_ BitVec 32))

(declare-fun mapValue!38714 () ValueCell!11669)

(declare-fun mapRest!38714 () (Array (_ BitVec 32) ValueCell!11669))

(assert (=> mapNonEmpty!38714 (= mapRest!38713 (store mapRest!38714 mapKey!38714 mapValue!38714))))

(declare-fun condMapEmpty!38714 () Bool)

(declare-fun mapDefault!38714 () ValueCell!11669)

(assert (=> mapNonEmpty!38713 (= condMapEmpty!38714 (= mapRest!38713 ((as const (Array (_ BitVec 32) ValueCell!11669)) mapDefault!38714)))))

(assert (=> mapNonEmpty!38713 (= tp!74294 (and e!590390 mapRes!38714))))

(assert (= (and mapNonEmpty!38713 condMapEmpty!38714) mapIsEmpty!38714))

(assert (= (and mapNonEmpty!38713 (not condMapEmpty!38714)) mapNonEmpty!38714))

(assert (= (and mapNonEmpty!38714 ((_ is ValueCellFull!11669) mapValue!38714)) b!1042444))

(assert (= (and mapNonEmpty!38713 ((_ is ValueCellFull!11669) mapDefault!38714)) b!1042445))

(declare-fun m!962273 () Bool)

(assert (=> mapNonEmpty!38714 m!962273))

(check-sat (not b!1042380) (not b!1042407) (not bm!44158) (not b!1042364) (not b!1042325) (not b!1042356) (not b!1042367) (not bm!44155) (not bm!44156) (not b!1042420) (not bm!44153) (not d!126257) (not bm!44160) (not d!126217) tp_is_empty!24745 (not b!1042410) (not b!1042412) (not b!1042411) (not b!1042363) (not b!1042443) (not b!1042323) (not b!1042418) (not b!1042328) (not bm!44157) (not b!1042359) (not b!1042345) (not d!126221) b_and!33567 (not b!1042326) (not d!126235) (not b!1042318) (not b!1042421) (not b!1042419) (not b_next!21025) (not bm!44152) (not mapNonEmpty!38714) (not d!126259) (not bm!44154) (not bm!44159) (not b!1042440) (not b!1042376) (not d!126229) (not b!1042378) (not d!126251) (not d!126253) (not b!1042357) (not d!126225) (not b!1042381) (not b!1042416) (not d!126239))
(check-sat b_and!33567 (not b_next!21025))
