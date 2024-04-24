; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92086 () Bool)

(assert start!92086)

(declare-fun b!1046241 () Bool)

(declare-fun b_free!21127 () Bool)

(declare-fun b_next!21127 () Bool)

(assert (=> b!1046241 (= b_free!21127 (not b_next!21127))))

(declare-fun tp!74634 () Bool)

(declare-fun b_and!33735 () Bool)

(assert (=> b!1046241 (= tp!74634 b_and!33735)))

(declare-fun b!1046236 () Bool)

(declare-fun e!593094 () Bool)

(declare-fun tp_is_empty!24847 () Bool)

(assert (=> b!1046236 (= e!593094 tp_is_empty!24847)))

(declare-fun b!1046237 () Bool)

(declare-fun res!696365 () Bool)

(declare-fun e!593092 () Bool)

(assert (=> b!1046237 (=> res!696365 e!593092)))

(declare-datatypes ((V!38003 0))(
  ( (V!38004 (val!12474 Int)) )
))
(declare-datatypes ((ValueCell!11720 0))(
  ( (ValueCellFull!11720 (v!15064 V!38003)) (EmptyCell!11720) )
))
(declare-datatypes ((Unit!34139 0))(
  ( (Unit!34140) )
))
(declare-datatypes ((array!65915 0))(
  ( (array!65916 (arr!31699 (Array (_ BitVec 32) (_ BitVec 64))) (size!32235 (_ BitVec 32))) )
))
(declare-datatypes ((array!65917 0))(
  ( (array!65918 (arr!31700 (Array (_ BitVec 32) ValueCell!11720)) (size!32236 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6034 0))(
  ( (LongMapFixedSize!6035 (defaultEntry!6409 Int) (mask!30588 (_ BitVec 32)) (extraKeys!6137 (_ BitVec 32)) (zeroValue!6243 V!38003) (minValue!6243 V!38003) (_size!3072 (_ BitVec 32)) (_keys!11715 array!65915) (_values!6432 array!65917) (_vacant!3072 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15772 0))(
  ( (tuple2!15773 (_1!7897 Unit!34139) (_2!7897 LongMapFixedSize!6034)) )
))
(declare-fun lt!461618 () tuple2!15772)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1046237 (= res!696365 (not (validMask!0 (mask!30588 (_2!7897 lt!461618)))))))

(declare-fun b!1046238 () Bool)

(declare-fun e!593091 () Bool)

(declare-fun e!593090 () Bool)

(declare-fun mapRes!38906 () Bool)

(assert (=> b!1046238 (= e!593091 (and e!593090 mapRes!38906))))

(declare-fun condMapEmpty!38906 () Bool)

(declare-fun thiss!1427 () LongMapFixedSize!6034)

(declare-fun mapDefault!38906 () ValueCell!11720)

(assert (=> b!1046238 (= condMapEmpty!38906 (= (arr!31700 (_values!6432 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11720)) mapDefault!38906)))))

(declare-fun res!696367 () Bool)

(declare-fun e!593088 () Bool)

(assert (=> start!92086 (=> (not res!696367) (not e!593088))))

(declare-fun valid!2270 (LongMapFixedSize!6034) Bool)

(assert (=> start!92086 (= res!696367 (valid!2270 thiss!1427))))

(assert (=> start!92086 e!593088))

(declare-fun e!593087 () Bool)

(assert (=> start!92086 e!593087))

(assert (=> start!92086 true))

(declare-fun b!1046239 () Bool)

(assert (=> b!1046239 (= e!593092 (or (not (= (size!32236 (_values!6432 (_2!7897 lt!461618))) (bvadd #b00000000000000000000000000000001 (mask!30588 (_2!7897 lt!461618))))) (not (= (size!32235 (_keys!11715 (_2!7897 lt!461618))) (size!32236 (_values!6432 (_2!7897 lt!461618))))) (bvsge (mask!30588 (_2!7897 lt!461618)) #b00000000000000000000000000000000)))))

(declare-fun b!1046240 () Bool)

(declare-fun e!593089 () Bool)

(assert (=> b!1046240 (= e!593088 e!593089)))

(declare-fun res!696366 () Bool)

(assert (=> b!1046240 (=> (not res!696366) (not e!593089))))

(declare-datatypes ((SeekEntryResult!9800 0))(
  ( (MissingZero!9800 (index!41571 (_ BitVec 32))) (Found!9800 (index!41572 (_ BitVec 32))) (Intermediate!9800 (undefined!10612 Bool) (index!41573 (_ BitVec 32)) (x!93300 (_ BitVec 32))) (Undefined!9800) (MissingVacant!9800 (index!41574 (_ BitVec 32))) )
))
(declare-fun lt!461619 () SeekEntryResult!9800)

(get-info :version)

(assert (=> b!1046240 (= res!696366 ((_ is Found!9800) lt!461619))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65915 (_ BitVec 32)) SeekEntryResult!9800)

(assert (=> b!1046240 (= lt!461619 (seekEntry!0 key!909 (_keys!11715 thiss!1427) (mask!30588 thiss!1427)))))

(declare-fun array_inv!24495 (array!65915) Bool)

(declare-fun array_inv!24496 (array!65917) Bool)

(assert (=> b!1046241 (= e!593087 (and tp!74634 tp_is_empty!24847 (array_inv!24495 (_keys!11715 thiss!1427)) (array_inv!24496 (_values!6432 thiss!1427)) e!593091))))

(declare-fun mapNonEmpty!38906 () Bool)

(declare-fun tp!74633 () Bool)

(assert (=> mapNonEmpty!38906 (= mapRes!38906 (and tp!74633 e!593094))))

(declare-fun mapValue!38906 () ValueCell!11720)

(declare-fun mapKey!38906 () (_ BitVec 32))

(declare-fun mapRest!38906 () (Array (_ BitVec 32) ValueCell!11720))

(assert (=> mapNonEmpty!38906 (= (arr!31700 (_values!6432 thiss!1427)) (store mapRest!38906 mapKey!38906 mapValue!38906))))

(declare-fun mapIsEmpty!38906 () Bool)

(assert (=> mapIsEmpty!38906 mapRes!38906))

(declare-fun b!1046242 () Bool)

(assert (=> b!1046242 (= e!593090 tp_is_empty!24847)))

(declare-fun b!1046243 () Bool)

(declare-fun res!696369 () Bool)

(assert (=> b!1046243 (=> (not res!696369) (not e!593088))))

(assert (=> b!1046243 (= res!696369 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1046244 () Bool)

(assert (=> b!1046244 (= e!593089 (not e!593092))))

(declare-fun res!696368 () Bool)

(assert (=> b!1046244 (=> res!696368 e!593092)))

(declare-datatypes ((tuple2!15774 0))(
  ( (tuple2!15775 (_1!7898 (_ BitVec 64)) (_2!7898 V!38003)) )
))
(declare-datatypes ((List!22003 0))(
  ( (Nil!22000) (Cons!21999 (h!23216 tuple2!15774) (t!31247 List!22003)) )
))
(declare-datatypes ((ListLongMap!13791 0))(
  ( (ListLongMap!13792 (toList!6911 List!22003)) )
))
(declare-fun contains!6103 (ListLongMap!13791 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3955 (array!65915 array!65917 (_ BitVec 32) (_ BitVec 32) V!38003 V!38003 (_ BitVec 32) Int) ListLongMap!13791)

(assert (=> b!1046244 (= res!696368 (not (contains!6103 (getCurrentListMap!3955 (_keys!11715 (_2!7897 lt!461618)) (_values!6432 (_2!7897 lt!461618)) (mask!30588 (_2!7897 lt!461618)) (extraKeys!6137 (_2!7897 lt!461618)) (zeroValue!6243 (_2!7897 lt!461618)) (minValue!6243 (_2!7897 lt!461618)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7897 lt!461618))) key!909)))))

(declare-fun lt!461623 () array!65915)

(declare-fun lt!461617 () array!65917)

(declare-fun Unit!34141 () Unit!34139)

(declare-fun Unit!34142 () Unit!34139)

(assert (=> b!1046244 (= lt!461618 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3072 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15773 Unit!34141 (LongMapFixedSize!6035 (defaultEntry!6409 thiss!1427) (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) (bvsub (_size!3072 thiss!1427) #b00000000000000000000000000000001) lt!461623 lt!461617 (bvadd #b00000000000000000000000000000001 (_vacant!3072 thiss!1427)))) (tuple2!15773 Unit!34142 (LongMapFixedSize!6035 (defaultEntry!6409 thiss!1427) (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) (bvsub (_size!3072 thiss!1427) #b00000000000000000000000000000001) lt!461623 lt!461617 (_vacant!3072 thiss!1427)))))))

(declare-fun -!534 (ListLongMap!13791 (_ BitVec 64)) ListLongMap!13791)

(assert (=> b!1046244 (= (-!534 (getCurrentListMap!3955 (_keys!11715 thiss!1427) (_values!6432 thiss!1427) (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)) key!909) (getCurrentListMap!3955 lt!461623 lt!461617 (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-fun dynLambda!2026 (Int (_ BitVec 64)) V!38003)

(assert (=> b!1046244 (= lt!461617 (array!65918 (store (arr!31700 (_values!6432 thiss!1427)) (index!41572 lt!461619) (ValueCellFull!11720 (dynLambda!2026 (defaultEntry!6409 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32236 (_values!6432 thiss!1427))))))

(declare-fun lt!461620 () Unit!34139)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!56 (array!65915 array!65917 (_ BitVec 32) (_ BitVec 32) V!38003 V!38003 (_ BitVec 32) (_ BitVec 64) Int) Unit!34139)

(assert (=> b!1046244 (= lt!461620 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!56 (_keys!11715 thiss!1427) (_values!6432 thiss!1427) (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) (index!41572 lt!461619) key!909 (defaultEntry!6409 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1046244 (not (arrayContainsKey!0 lt!461623 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!461621 () Unit!34139)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65915 (_ BitVec 32) (_ BitVec 64)) Unit!34139)

(assert (=> b!1046244 (= lt!461621 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11715 thiss!1427) (index!41572 lt!461619) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65915 (_ BitVec 32)) Bool)

(assert (=> b!1046244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461623 (mask!30588 thiss!1427))))

(declare-fun lt!461616 () Unit!34139)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65915 (_ BitVec 32) (_ BitVec 32)) Unit!34139)

(assert (=> b!1046244 (= lt!461616 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11715 thiss!1427) (index!41572 lt!461619) (mask!30588 thiss!1427)))))

(declare-datatypes ((List!22004 0))(
  ( (Nil!22001) (Cons!22000 (h!23217 (_ BitVec 64)) (t!31248 List!22004)) )
))
(declare-fun arrayNoDuplicates!0 (array!65915 (_ BitVec 32) List!22004) Bool)

(assert (=> b!1046244 (arrayNoDuplicates!0 lt!461623 #b00000000000000000000000000000000 Nil!22001)))

(declare-fun lt!461622 () Unit!34139)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65915 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22004) Unit!34139)

(assert (=> b!1046244 (= lt!461622 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11715 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41572 lt!461619) #b00000000000000000000000000000000 Nil!22001))))

(declare-fun arrayCountValidKeys!0 (array!65915 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1046244 (= (arrayCountValidKeys!0 lt!461623 #b00000000000000000000000000000000 (size!32235 (_keys!11715 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11715 thiss!1427) #b00000000000000000000000000000000 (size!32235 (_keys!11715 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1046244 (= lt!461623 (array!65916 (store (arr!31699 (_keys!11715 thiss!1427)) (index!41572 lt!461619) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32235 (_keys!11715 thiss!1427))))))

(declare-fun lt!461615 () Unit!34139)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65915 (_ BitVec 32) (_ BitVec 64)) Unit!34139)

(assert (=> b!1046244 (= lt!461615 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11715 thiss!1427) (index!41572 lt!461619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!92086 res!696367) b!1046243))

(assert (= (and b!1046243 res!696369) b!1046240))

(assert (= (and b!1046240 res!696366) b!1046244))

(assert (= (and b!1046244 (not res!696368)) b!1046237))

(assert (= (and b!1046237 (not res!696365)) b!1046239))

(assert (= (and b!1046238 condMapEmpty!38906) mapIsEmpty!38906))

(assert (= (and b!1046238 (not condMapEmpty!38906)) mapNonEmpty!38906))

(assert (= (and mapNonEmpty!38906 ((_ is ValueCellFull!11720) mapValue!38906)) b!1046236))

(assert (= (and b!1046238 ((_ is ValueCellFull!11720) mapDefault!38906)) b!1046242))

(assert (= b!1046241 b!1046238))

(assert (= start!92086 b!1046241))

(declare-fun b_lambda!16273 () Bool)

(assert (=> (not b_lambda!16273) (not b!1046244)))

(declare-fun t!31246 () Bool)

(declare-fun tb!7065 () Bool)

(assert (=> (and b!1046241 (= (defaultEntry!6409 thiss!1427) (defaultEntry!6409 thiss!1427)) t!31246) tb!7065))

(declare-fun result!14563 () Bool)

(assert (=> tb!7065 (= result!14563 tp_is_empty!24847)))

(assert (=> b!1046244 t!31246))

(declare-fun b_and!33737 () Bool)

(assert (= b_and!33735 (and (=> t!31246 result!14563) b_and!33737)))

(declare-fun m!966145 () Bool)

(assert (=> b!1046237 m!966145))

(declare-fun m!966147 () Bool)

(assert (=> b!1046244 m!966147))

(declare-fun m!966149 () Bool)

(assert (=> b!1046244 m!966149))

(declare-fun m!966151 () Bool)

(assert (=> b!1046244 m!966151))

(declare-fun m!966153 () Bool)

(assert (=> b!1046244 m!966153))

(declare-fun m!966155 () Bool)

(assert (=> b!1046244 m!966155))

(declare-fun m!966157 () Bool)

(assert (=> b!1046244 m!966157))

(declare-fun m!966159 () Bool)

(assert (=> b!1046244 m!966159))

(declare-fun m!966161 () Bool)

(assert (=> b!1046244 m!966161))

(declare-fun m!966163 () Bool)

(assert (=> b!1046244 m!966163))

(declare-fun m!966165 () Bool)

(assert (=> b!1046244 m!966165))

(assert (=> b!1046244 m!966161))

(declare-fun m!966167 () Bool)

(assert (=> b!1046244 m!966167))

(declare-fun m!966169 () Bool)

(assert (=> b!1046244 m!966169))

(assert (=> b!1046244 m!966147))

(declare-fun m!966171 () Bool)

(assert (=> b!1046244 m!966171))

(declare-fun m!966173 () Bool)

(assert (=> b!1046244 m!966173))

(declare-fun m!966175 () Bool)

(assert (=> b!1046244 m!966175))

(declare-fun m!966177 () Bool)

(assert (=> b!1046244 m!966177))

(declare-fun m!966179 () Bool)

(assert (=> b!1046244 m!966179))

(declare-fun m!966181 () Bool)

(assert (=> b!1046244 m!966181))

(declare-fun m!966183 () Bool)

(assert (=> mapNonEmpty!38906 m!966183))

(declare-fun m!966185 () Bool)

(assert (=> b!1046241 m!966185))

(declare-fun m!966187 () Bool)

(assert (=> b!1046241 m!966187))

(declare-fun m!966189 () Bool)

(assert (=> start!92086 m!966189))

(declare-fun m!966191 () Bool)

(assert (=> b!1046240 m!966191))

(check-sat (not b!1046244) (not b_next!21127) tp_is_empty!24847 (not b!1046240) (not start!92086) (not b!1046241) b_and!33737 (not b!1046237) (not mapNonEmpty!38906) (not b_lambda!16273))
(check-sat b_and!33737 (not b_next!21127))
(get-model)

(declare-fun b_lambda!16279 () Bool)

(assert (= b_lambda!16273 (or (and b!1046241 b_free!21127) b_lambda!16279)))

(check-sat (not b!1046244) (not b_next!21127) tp_is_empty!24847 (not b!1046240) (not mapNonEmpty!38906) (not start!92086) (not b_lambda!16279) (not b!1046241) b_and!33737 (not b!1046237))
(check-sat b_and!33737 (not b_next!21127))
(get-model)

(declare-fun d!126921 () Bool)

(declare-fun res!696406 () Bool)

(declare-fun e!593145 () Bool)

(assert (=> d!126921 (=> (not res!696406) (not e!593145))))

(declare-fun simpleValid!451 (LongMapFixedSize!6034) Bool)

(assert (=> d!126921 (= res!696406 (simpleValid!451 thiss!1427))))

(assert (=> d!126921 (= (valid!2270 thiss!1427) e!593145)))

(declare-fun b!1046311 () Bool)

(declare-fun res!696407 () Bool)

(assert (=> b!1046311 (=> (not res!696407) (not e!593145))))

(assert (=> b!1046311 (= res!696407 (= (arrayCountValidKeys!0 (_keys!11715 thiss!1427) #b00000000000000000000000000000000 (size!32235 (_keys!11715 thiss!1427))) (_size!3072 thiss!1427)))))

(declare-fun b!1046312 () Bool)

(declare-fun res!696408 () Bool)

(assert (=> b!1046312 (=> (not res!696408) (not e!593145))))

(assert (=> b!1046312 (= res!696408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11715 thiss!1427) (mask!30588 thiss!1427)))))

(declare-fun b!1046313 () Bool)

(assert (=> b!1046313 (= e!593145 (arrayNoDuplicates!0 (_keys!11715 thiss!1427) #b00000000000000000000000000000000 Nil!22001))))

(assert (= (and d!126921 res!696406) b!1046311))

(assert (= (and b!1046311 res!696407) b!1046312))

(assert (= (and b!1046312 res!696408) b!1046313))

(declare-fun m!966289 () Bool)

(assert (=> d!126921 m!966289))

(assert (=> b!1046311 m!966175))

(declare-fun m!966291 () Bool)

(assert (=> b!1046312 m!966291))

(declare-fun m!966293 () Bool)

(assert (=> b!1046313 m!966293))

(assert (=> start!92086 d!126921))

(declare-fun b!1046356 () Bool)

(declare-fun e!593179 () ListLongMap!13791)

(declare-fun call!44519 () ListLongMap!13791)

(assert (=> b!1046356 (= e!593179 call!44519)))

(declare-fun b!1046357 () Bool)

(declare-fun e!593183 () Bool)

(declare-fun call!44518 () Bool)

(assert (=> b!1046357 (= e!593183 (not call!44518))))

(declare-fun b!1046358 () Bool)

(declare-fun e!593182 () Bool)

(declare-fun e!593177 () Bool)

(assert (=> b!1046358 (= e!593182 e!593177)))

(declare-fun res!696434 () Bool)

(assert (=> b!1046358 (=> (not res!696434) (not e!593177))))

(declare-fun lt!461735 () ListLongMap!13791)

(assert (=> b!1046358 (= res!696434 (contains!6103 lt!461735 (select (arr!31699 (_keys!11715 (_2!7897 lt!461618))) #b00000000000000000000000000000000)))))

(assert (=> b!1046358 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32235 (_keys!11715 (_2!7897 lt!461618)))))))

(declare-fun b!1046359 () Bool)

(declare-fun e!593180 () Bool)

(declare-fun e!593175 () Bool)

(assert (=> b!1046359 (= e!593180 e!593175)))

(declare-fun c!106621 () Bool)

(assert (=> b!1046359 (= c!106621 (not (= (bvand (extraKeys!6137 (_2!7897 lt!461618)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1046360 () Bool)

(declare-fun res!696432 () Bool)

(assert (=> b!1046360 (=> (not res!696432) (not e!593180))))

(assert (=> b!1046360 (= res!696432 e!593182)))

(declare-fun res!696433 () Bool)

(assert (=> b!1046360 (=> res!696433 e!593182)))

(declare-fun e!593178 () Bool)

(assert (=> b!1046360 (= res!696433 (not e!593178))))

(declare-fun res!696431 () Bool)

(assert (=> b!1046360 (=> (not res!696431) (not e!593178))))

(assert (=> b!1046360 (= res!696431 (bvslt #b00000000000000000000000000000000 (size!32235 (_keys!11715 (_2!7897 lt!461618)))))))

(declare-fun d!126923 () Bool)

(assert (=> d!126923 e!593180))

(declare-fun res!696429 () Bool)

(assert (=> d!126923 (=> (not res!696429) (not e!593180))))

(assert (=> d!126923 (= res!696429 (or (bvsge #b00000000000000000000000000000000 (size!32235 (_keys!11715 (_2!7897 lt!461618)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32235 (_keys!11715 (_2!7897 lt!461618)))))))))

(declare-fun lt!461728 () ListLongMap!13791)

(assert (=> d!126923 (= lt!461735 lt!461728)))

(declare-fun lt!461742 () Unit!34139)

(declare-fun e!593172 () Unit!34139)

(assert (=> d!126923 (= lt!461742 e!593172)))

(declare-fun c!106618 () Bool)

(declare-fun e!593176 () Bool)

(assert (=> d!126923 (= c!106618 e!593176)))

(declare-fun res!696435 () Bool)

(assert (=> d!126923 (=> (not res!696435) (not e!593176))))

(assert (=> d!126923 (= res!696435 (bvslt #b00000000000000000000000000000000 (size!32235 (_keys!11715 (_2!7897 lt!461618)))))))

(declare-fun e!593184 () ListLongMap!13791)

(assert (=> d!126923 (= lt!461728 e!593184)))

(declare-fun c!106619 () Bool)

(assert (=> d!126923 (= c!106619 (and (not (= (bvand (extraKeys!6137 (_2!7897 lt!461618)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6137 (_2!7897 lt!461618)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126923 (validMask!0 (mask!30588 (_2!7897 lt!461618)))))

(assert (=> d!126923 (= (getCurrentListMap!3955 (_keys!11715 (_2!7897 lt!461618)) (_values!6432 (_2!7897 lt!461618)) (mask!30588 (_2!7897 lt!461618)) (extraKeys!6137 (_2!7897 lt!461618)) (zeroValue!6243 (_2!7897 lt!461618)) (minValue!6243 (_2!7897 lt!461618)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7897 lt!461618))) lt!461735)))

(declare-fun call!44521 () ListLongMap!13791)

(declare-fun call!44515 () ListLongMap!13791)

(declare-fun c!106622 () Bool)

(declare-fun bm!44512 () Bool)

(declare-fun call!44516 () ListLongMap!13791)

(declare-fun call!44517 () ListLongMap!13791)

(declare-fun +!3133 (ListLongMap!13791 tuple2!15774) ListLongMap!13791)

(assert (=> bm!44512 (= call!44516 (+!3133 (ite c!106619 call!44521 (ite c!106622 call!44517 call!44515)) (ite (or c!106619 c!106622) (tuple2!15775 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6243 (_2!7897 lt!461618))) (tuple2!15775 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6243 (_2!7897 lt!461618))))))))

(declare-fun b!1046361 () Bool)

(declare-fun e!593174 () Bool)

(declare-fun apply!922 (ListLongMap!13791 (_ BitVec 64)) V!38003)

(assert (=> b!1046361 (= e!593174 (= (apply!922 lt!461735 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6243 (_2!7897 lt!461618))))))

(declare-fun b!1046362 () Bool)

(assert (=> b!1046362 (= e!593184 (+!3133 call!44516 (tuple2!15775 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6243 (_2!7897 lt!461618)))))))

(declare-fun bm!44513 () Bool)

(assert (=> bm!44513 (= call!44515 call!44517)))

(declare-fun b!1046363 () Bool)

(declare-fun res!696427 () Bool)

(assert (=> b!1046363 (=> (not res!696427) (not e!593180))))

(assert (=> b!1046363 (= res!696427 e!593183)))

(declare-fun c!106617 () Bool)

(assert (=> b!1046363 (= c!106617 (not (= (bvand (extraKeys!6137 (_2!7897 lt!461618)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1046364 () Bool)

(declare-fun e!593181 () ListLongMap!13791)

(assert (=> b!1046364 (= e!593181 call!44519)))

(declare-fun b!1046365 () Bool)

(declare-fun call!44520 () Bool)

(assert (=> b!1046365 (= e!593175 (not call!44520))))

(declare-fun b!1046366 () Bool)

(declare-fun c!106620 () Bool)

(assert (=> b!1046366 (= c!106620 (and (not (= (bvand (extraKeys!6137 (_2!7897 lt!461618)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6137 (_2!7897 lt!461618)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1046366 (= e!593181 e!593179)))

(declare-fun b!1046367 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1046367 (= e!593178 (validKeyInArray!0 (select (arr!31699 (_keys!11715 (_2!7897 lt!461618))) #b00000000000000000000000000000000)))))

(declare-fun b!1046368 () Bool)

(assert (=> b!1046368 (= e!593184 e!593181)))

(assert (=> b!1046368 (= c!106622 (and (not (= (bvand (extraKeys!6137 (_2!7897 lt!461618)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6137 (_2!7897 lt!461618)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1046369 () Bool)

(declare-fun get!16585 (ValueCell!11720 V!38003) V!38003)

(assert (=> b!1046369 (= e!593177 (= (apply!922 lt!461735 (select (arr!31699 (_keys!11715 (_2!7897 lt!461618))) #b00000000000000000000000000000000)) (get!16585 (select (arr!31700 (_values!6432 (_2!7897 lt!461618))) #b00000000000000000000000000000000) (dynLambda!2026 (defaultEntry!6409 (_2!7897 lt!461618)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1046369 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32236 (_values!6432 (_2!7897 lt!461618)))))))

(assert (=> b!1046369 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32235 (_keys!11715 (_2!7897 lt!461618)))))))

(declare-fun bm!44514 () Bool)

(assert (=> bm!44514 (= call!44518 (contains!6103 lt!461735 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1046370 () Bool)

(declare-fun Unit!34151 () Unit!34139)

(assert (=> b!1046370 (= e!593172 Unit!34151)))

(declare-fun bm!44515 () Bool)

(assert (=> bm!44515 (= call!44517 call!44521)))

(declare-fun b!1046371 () Bool)

(assert (=> b!1046371 (= e!593176 (validKeyInArray!0 (select (arr!31699 (_keys!11715 (_2!7897 lt!461618))) #b00000000000000000000000000000000)))))

(declare-fun b!1046372 () Bool)

(assert (=> b!1046372 (= e!593179 call!44515)))

(declare-fun b!1046373 () Bool)

(declare-fun lt!461733 () Unit!34139)

(assert (=> b!1046373 (= e!593172 lt!461733)))

(declare-fun lt!461740 () ListLongMap!13791)

(declare-fun getCurrentListMapNoExtraKeys!3573 (array!65915 array!65917 (_ BitVec 32) (_ BitVec 32) V!38003 V!38003 (_ BitVec 32) Int) ListLongMap!13791)

(assert (=> b!1046373 (= lt!461740 (getCurrentListMapNoExtraKeys!3573 (_keys!11715 (_2!7897 lt!461618)) (_values!6432 (_2!7897 lt!461618)) (mask!30588 (_2!7897 lt!461618)) (extraKeys!6137 (_2!7897 lt!461618)) (zeroValue!6243 (_2!7897 lt!461618)) (minValue!6243 (_2!7897 lt!461618)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7897 lt!461618))))))

(declare-fun lt!461726 () (_ BitVec 64))

(assert (=> b!1046373 (= lt!461726 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461738 () (_ BitVec 64))

(assert (=> b!1046373 (= lt!461738 (select (arr!31699 (_keys!11715 (_2!7897 lt!461618))) #b00000000000000000000000000000000))))

(declare-fun lt!461729 () Unit!34139)

(declare-fun addStillContains!632 (ListLongMap!13791 (_ BitVec 64) V!38003 (_ BitVec 64)) Unit!34139)

(assert (=> b!1046373 (= lt!461729 (addStillContains!632 lt!461740 lt!461726 (zeroValue!6243 (_2!7897 lt!461618)) lt!461738))))

(assert (=> b!1046373 (contains!6103 (+!3133 lt!461740 (tuple2!15775 lt!461726 (zeroValue!6243 (_2!7897 lt!461618)))) lt!461738)))

(declare-fun lt!461727 () Unit!34139)

(assert (=> b!1046373 (= lt!461727 lt!461729)))

(declare-fun lt!461730 () ListLongMap!13791)

(assert (=> b!1046373 (= lt!461730 (getCurrentListMapNoExtraKeys!3573 (_keys!11715 (_2!7897 lt!461618)) (_values!6432 (_2!7897 lt!461618)) (mask!30588 (_2!7897 lt!461618)) (extraKeys!6137 (_2!7897 lt!461618)) (zeroValue!6243 (_2!7897 lt!461618)) (minValue!6243 (_2!7897 lt!461618)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7897 lt!461618))))))

(declare-fun lt!461743 () (_ BitVec 64))

(assert (=> b!1046373 (= lt!461743 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461732 () (_ BitVec 64))

(assert (=> b!1046373 (= lt!461732 (select (arr!31699 (_keys!11715 (_2!7897 lt!461618))) #b00000000000000000000000000000000))))

(declare-fun lt!461724 () Unit!34139)

(declare-fun addApplyDifferent!488 (ListLongMap!13791 (_ BitVec 64) V!38003 (_ BitVec 64)) Unit!34139)

(assert (=> b!1046373 (= lt!461724 (addApplyDifferent!488 lt!461730 lt!461743 (minValue!6243 (_2!7897 lt!461618)) lt!461732))))

(assert (=> b!1046373 (= (apply!922 (+!3133 lt!461730 (tuple2!15775 lt!461743 (minValue!6243 (_2!7897 lt!461618)))) lt!461732) (apply!922 lt!461730 lt!461732))))

(declare-fun lt!461737 () Unit!34139)

(assert (=> b!1046373 (= lt!461737 lt!461724)))

(declare-fun lt!461741 () ListLongMap!13791)

(assert (=> b!1046373 (= lt!461741 (getCurrentListMapNoExtraKeys!3573 (_keys!11715 (_2!7897 lt!461618)) (_values!6432 (_2!7897 lt!461618)) (mask!30588 (_2!7897 lt!461618)) (extraKeys!6137 (_2!7897 lt!461618)) (zeroValue!6243 (_2!7897 lt!461618)) (minValue!6243 (_2!7897 lt!461618)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7897 lt!461618))))))

(declare-fun lt!461731 () (_ BitVec 64))

(assert (=> b!1046373 (= lt!461731 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461739 () (_ BitVec 64))

(assert (=> b!1046373 (= lt!461739 (select (arr!31699 (_keys!11715 (_2!7897 lt!461618))) #b00000000000000000000000000000000))))

(declare-fun lt!461725 () Unit!34139)

(assert (=> b!1046373 (= lt!461725 (addApplyDifferent!488 lt!461741 lt!461731 (zeroValue!6243 (_2!7897 lt!461618)) lt!461739))))

(assert (=> b!1046373 (= (apply!922 (+!3133 lt!461741 (tuple2!15775 lt!461731 (zeroValue!6243 (_2!7897 lt!461618)))) lt!461739) (apply!922 lt!461741 lt!461739))))

(declare-fun lt!461736 () Unit!34139)

(assert (=> b!1046373 (= lt!461736 lt!461725)))

(declare-fun lt!461734 () ListLongMap!13791)

(assert (=> b!1046373 (= lt!461734 (getCurrentListMapNoExtraKeys!3573 (_keys!11715 (_2!7897 lt!461618)) (_values!6432 (_2!7897 lt!461618)) (mask!30588 (_2!7897 lt!461618)) (extraKeys!6137 (_2!7897 lt!461618)) (zeroValue!6243 (_2!7897 lt!461618)) (minValue!6243 (_2!7897 lt!461618)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7897 lt!461618))))))

(declare-fun lt!461723 () (_ BitVec 64))

(assert (=> b!1046373 (= lt!461723 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461722 () (_ BitVec 64))

(assert (=> b!1046373 (= lt!461722 (select (arr!31699 (_keys!11715 (_2!7897 lt!461618))) #b00000000000000000000000000000000))))

(assert (=> b!1046373 (= lt!461733 (addApplyDifferent!488 lt!461734 lt!461723 (minValue!6243 (_2!7897 lt!461618)) lt!461722))))

(assert (=> b!1046373 (= (apply!922 (+!3133 lt!461734 (tuple2!15775 lt!461723 (minValue!6243 (_2!7897 lt!461618)))) lt!461722) (apply!922 lt!461734 lt!461722))))

(declare-fun b!1046374 () Bool)

(assert (=> b!1046374 (= e!593175 e!593174)))

(declare-fun res!696430 () Bool)

(assert (=> b!1046374 (= res!696430 call!44520)))

(assert (=> b!1046374 (=> (not res!696430) (not e!593174))))

(declare-fun b!1046375 () Bool)

(declare-fun e!593173 () Bool)

(assert (=> b!1046375 (= e!593173 (= (apply!922 lt!461735 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6243 (_2!7897 lt!461618))))))

(declare-fun b!1046376 () Bool)

(assert (=> b!1046376 (= e!593183 e!593173)))

(declare-fun res!696428 () Bool)

(assert (=> b!1046376 (= res!696428 call!44518)))

(assert (=> b!1046376 (=> (not res!696428) (not e!593173))))

(declare-fun bm!44516 () Bool)

(assert (=> bm!44516 (= call!44521 (getCurrentListMapNoExtraKeys!3573 (_keys!11715 (_2!7897 lt!461618)) (_values!6432 (_2!7897 lt!461618)) (mask!30588 (_2!7897 lt!461618)) (extraKeys!6137 (_2!7897 lt!461618)) (zeroValue!6243 (_2!7897 lt!461618)) (minValue!6243 (_2!7897 lt!461618)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7897 lt!461618))))))

(declare-fun bm!44517 () Bool)

(assert (=> bm!44517 (= call!44519 call!44516)))

(declare-fun bm!44518 () Bool)

(assert (=> bm!44518 (= call!44520 (contains!6103 lt!461735 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!126923 c!106619) b!1046362))

(assert (= (and d!126923 (not c!106619)) b!1046368))

(assert (= (and b!1046368 c!106622) b!1046364))

(assert (= (and b!1046368 (not c!106622)) b!1046366))

(assert (= (and b!1046366 c!106620) b!1046356))

(assert (= (and b!1046366 (not c!106620)) b!1046372))

(assert (= (or b!1046356 b!1046372) bm!44513))

(assert (= (or b!1046364 bm!44513) bm!44515))

(assert (= (or b!1046364 b!1046356) bm!44517))

(assert (= (or b!1046362 bm!44515) bm!44516))

(assert (= (or b!1046362 bm!44517) bm!44512))

(assert (= (and d!126923 res!696435) b!1046371))

(assert (= (and d!126923 c!106618) b!1046373))

(assert (= (and d!126923 (not c!106618)) b!1046370))

(assert (= (and d!126923 res!696429) b!1046360))

(assert (= (and b!1046360 res!696431) b!1046367))

(assert (= (and b!1046360 (not res!696433)) b!1046358))

(assert (= (and b!1046358 res!696434) b!1046369))

(assert (= (and b!1046360 res!696432) b!1046363))

(assert (= (and b!1046363 c!106617) b!1046376))

(assert (= (and b!1046363 (not c!106617)) b!1046357))

(assert (= (and b!1046376 res!696428) b!1046375))

(assert (= (or b!1046376 b!1046357) bm!44514))

(assert (= (and b!1046363 res!696427) b!1046359))

(assert (= (and b!1046359 c!106621) b!1046374))

(assert (= (and b!1046359 (not c!106621)) b!1046365))

(assert (= (and b!1046374 res!696430) b!1046361))

(assert (= (or b!1046374 b!1046365) bm!44518))

(declare-fun b_lambda!16281 () Bool)

(assert (=> (not b_lambda!16281) (not b!1046369)))

(declare-fun tb!7071 () Bool)

(declare-fun t!31258 () Bool)

(assert (=> (and b!1046241 (= (defaultEntry!6409 thiss!1427) (defaultEntry!6409 (_2!7897 lt!461618))) t!31258) tb!7071))

(declare-fun result!14575 () Bool)

(assert (=> tb!7071 (= result!14575 tp_is_empty!24847)))

(assert (=> b!1046369 t!31258))

(declare-fun b_and!33747 () Bool)

(assert (= b_and!33737 (and (=> t!31258 result!14575) b_and!33747)))

(declare-fun m!966295 () Bool)

(assert (=> b!1046367 m!966295))

(assert (=> b!1046367 m!966295))

(declare-fun m!966297 () Bool)

(assert (=> b!1046367 m!966297))

(declare-fun m!966299 () Bool)

(assert (=> bm!44516 m!966299))

(declare-fun m!966301 () Bool)

(assert (=> bm!44512 m!966301))

(declare-fun m!966303 () Bool)

(assert (=> b!1046361 m!966303))

(declare-fun m!966305 () Bool)

(assert (=> bm!44514 m!966305))

(declare-fun m!966307 () Bool)

(assert (=> b!1046362 m!966307))

(declare-fun m!966309 () Bool)

(assert (=> b!1046373 m!966309))

(declare-fun m!966311 () Bool)

(assert (=> b!1046373 m!966311))

(assert (=> b!1046373 m!966299))

(declare-fun m!966313 () Bool)

(assert (=> b!1046373 m!966313))

(declare-fun m!966315 () Bool)

(assert (=> b!1046373 m!966315))

(declare-fun m!966317 () Bool)

(assert (=> b!1046373 m!966317))

(assert (=> b!1046373 m!966295))

(assert (=> b!1046373 m!966309))

(declare-fun m!966319 () Bool)

(assert (=> b!1046373 m!966319))

(assert (=> b!1046373 m!966313))

(declare-fun m!966321 () Bool)

(assert (=> b!1046373 m!966321))

(declare-fun m!966323 () Bool)

(assert (=> b!1046373 m!966323))

(declare-fun m!966325 () Bool)

(assert (=> b!1046373 m!966325))

(declare-fun m!966327 () Bool)

(assert (=> b!1046373 m!966327))

(declare-fun m!966329 () Bool)

(assert (=> b!1046373 m!966329))

(declare-fun m!966331 () Bool)

(assert (=> b!1046373 m!966331))

(declare-fun m!966333 () Bool)

(assert (=> b!1046373 m!966333))

(declare-fun m!966335 () Bool)

(assert (=> b!1046373 m!966335))

(assert (=> b!1046373 m!966323))

(assert (=> b!1046373 m!966331))

(declare-fun m!966337 () Bool)

(assert (=> b!1046373 m!966337))

(assert (=> b!1046369 m!966295))

(declare-fun m!966339 () Bool)

(assert (=> b!1046369 m!966339))

(declare-fun m!966341 () Bool)

(assert (=> b!1046369 m!966341))

(assert (=> b!1046369 m!966295))

(declare-fun m!966343 () Bool)

(assert (=> b!1046369 m!966343))

(assert (=> b!1046369 m!966343))

(assert (=> b!1046369 m!966341))

(declare-fun m!966345 () Bool)

(assert (=> b!1046369 m!966345))

(assert (=> b!1046358 m!966295))

(assert (=> b!1046358 m!966295))

(declare-fun m!966347 () Bool)

(assert (=> b!1046358 m!966347))

(declare-fun m!966349 () Bool)

(assert (=> b!1046375 m!966349))

(declare-fun m!966351 () Bool)

(assert (=> bm!44518 m!966351))

(assert (=> d!126923 m!966145))

(assert (=> b!1046371 m!966295))

(assert (=> b!1046371 m!966295))

(assert (=> b!1046371 m!966297))

(assert (=> b!1046244 d!126923))

(declare-fun b!1046377 () Bool)

(declare-fun e!593192 () ListLongMap!13791)

(declare-fun call!44526 () ListLongMap!13791)

(assert (=> b!1046377 (= e!593192 call!44526)))

(declare-fun b!1046378 () Bool)

(declare-fun e!593196 () Bool)

(declare-fun call!44525 () Bool)

(assert (=> b!1046378 (= e!593196 (not call!44525))))

(declare-fun b!1046379 () Bool)

(declare-fun e!593195 () Bool)

(declare-fun e!593190 () Bool)

(assert (=> b!1046379 (= e!593195 e!593190)))

(declare-fun res!696443 () Bool)

(assert (=> b!1046379 (=> (not res!696443) (not e!593190))))

(declare-fun lt!461757 () ListLongMap!13791)

(assert (=> b!1046379 (= res!696443 (contains!6103 lt!461757 (select (arr!31699 lt!461623) #b00000000000000000000000000000000)))))

(assert (=> b!1046379 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32235 lt!461623)))))

(declare-fun b!1046380 () Bool)

(declare-fun e!593193 () Bool)

(declare-fun e!593188 () Bool)

(assert (=> b!1046380 (= e!593193 e!593188)))

(declare-fun c!106627 () Bool)

(assert (=> b!1046380 (= c!106627 (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1046381 () Bool)

(declare-fun res!696441 () Bool)

(assert (=> b!1046381 (=> (not res!696441) (not e!593193))))

(assert (=> b!1046381 (= res!696441 e!593195)))

(declare-fun res!696442 () Bool)

(assert (=> b!1046381 (=> res!696442 e!593195)))

(declare-fun e!593191 () Bool)

(assert (=> b!1046381 (= res!696442 (not e!593191))))

(declare-fun res!696440 () Bool)

(assert (=> b!1046381 (=> (not res!696440) (not e!593191))))

(assert (=> b!1046381 (= res!696440 (bvslt #b00000000000000000000000000000000 (size!32235 lt!461623)))))

(declare-fun d!126925 () Bool)

(assert (=> d!126925 e!593193))

(declare-fun res!696438 () Bool)

(assert (=> d!126925 (=> (not res!696438) (not e!593193))))

(assert (=> d!126925 (= res!696438 (or (bvsge #b00000000000000000000000000000000 (size!32235 lt!461623)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32235 lt!461623)))))))

(declare-fun lt!461750 () ListLongMap!13791)

(assert (=> d!126925 (= lt!461757 lt!461750)))

(declare-fun lt!461764 () Unit!34139)

(declare-fun e!593185 () Unit!34139)

(assert (=> d!126925 (= lt!461764 e!593185)))

(declare-fun c!106624 () Bool)

(declare-fun e!593189 () Bool)

(assert (=> d!126925 (= c!106624 e!593189)))

(declare-fun res!696444 () Bool)

(assert (=> d!126925 (=> (not res!696444) (not e!593189))))

(assert (=> d!126925 (= res!696444 (bvslt #b00000000000000000000000000000000 (size!32235 lt!461623)))))

(declare-fun e!593197 () ListLongMap!13791)

(assert (=> d!126925 (= lt!461750 e!593197)))

(declare-fun c!106625 () Bool)

(assert (=> d!126925 (= c!106625 (and (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126925 (validMask!0 (mask!30588 thiss!1427))))

(assert (=> d!126925 (= (getCurrentListMap!3955 lt!461623 lt!461617 (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)) lt!461757)))

(declare-fun call!44522 () ListLongMap!13791)

(declare-fun call!44528 () ListLongMap!13791)

(declare-fun bm!44519 () Bool)

(declare-fun c!106628 () Bool)

(declare-fun call!44523 () ListLongMap!13791)

(declare-fun call!44524 () ListLongMap!13791)

(assert (=> bm!44519 (= call!44523 (+!3133 (ite c!106625 call!44528 (ite c!106628 call!44524 call!44522)) (ite (or c!106625 c!106628) (tuple2!15775 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6243 thiss!1427)) (tuple2!15775 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6243 thiss!1427)))))))

(declare-fun b!1046382 () Bool)

(declare-fun e!593187 () Bool)

(assert (=> b!1046382 (= e!593187 (= (apply!922 lt!461757 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6243 thiss!1427)))))

(declare-fun b!1046383 () Bool)

(assert (=> b!1046383 (= e!593197 (+!3133 call!44523 (tuple2!15775 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6243 thiss!1427))))))

(declare-fun bm!44520 () Bool)

(assert (=> bm!44520 (= call!44522 call!44524)))

(declare-fun b!1046384 () Bool)

(declare-fun res!696436 () Bool)

(assert (=> b!1046384 (=> (not res!696436) (not e!593193))))

(assert (=> b!1046384 (= res!696436 e!593196)))

(declare-fun c!106623 () Bool)

(assert (=> b!1046384 (= c!106623 (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1046385 () Bool)

(declare-fun e!593194 () ListLongMap!13791)

(assert (=> b!1046385 (= e!593194 call!44526)))

(declare-fun b!1046386 () Bool)

(declare-fun call!44527 () Bool)

(assert (=> b!1046386 (= e!593188 (not call!44527))))

(declare-fun b!1046387 () Bool)

(declare-fun c!106626 () Bool)

(assert (=> b!1046387 (= c!106626 (and (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1046387 (= e!593194 e!593192)))

(declare-fun b!1046388 () Bool)

(assert (=> b!1046388 (= e!593191 (validKeyInArray!0 (select (arr!31699 lt!461623) #b00000000000000000000000000000000)))))

(declare-fun b!1046389 () Bool)

(assert (=> b!1046389 (= e!593197 e!593194)))

(assert (=> b!1046389 (= c!106628 (and (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1046390 () Bool)

(assert (=> b!1046390 (= e!593190 (= (apply!922 lt!461757 (select (arr!31699 lt!461623) #b00000000000000000000000000000000)) (get!16585 (select (arr!31700 lt!461617) #b00000000000000000000000000000000) (dynLambda!2026 (defaultEntry!6409 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1046390 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32236 lt!461617)))))

(assert (=> b!1046390 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32235 lt!461623)))))

(declare-fun bm!44521 () Bool)

(assert (=> bm!44521 (= call!44525 (contains!6103 lt!461757 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1046391 () Bool)

(declare-fun Unit!34152 () Unit!34139)

(assert (=> b!1046391 (= e!593185 Unit!34152)))

(declare-fun bm!44522 () Bool)

(assert (=> bm!44522 (= call!44524 call!44528)))

(declare-fun b!1046392 () Bool)

(assert (=> b!1046392 (= e!593189 (validKeyInArray!0 (select (arr!31699 lt!461623) #b00000000000000000000000000000000)))))

(declare-fun b!1046393 () Bool)

(assert (=> b!1046393 (= e!593192 call!44522)))

(declare-fun b!1046394 () Bool)

(declare-fun lt!461755 () Unit!34139)

(assert (=> b!1046394 (= e!593185 lt!461755)))

(declare-fun lt!461762 () ListLongMap!13791)

(assert (=> b!1046394 (= lt!461762 (getCurrentListMapNoExtraKeys!3573 lt!461623 lt!461617 (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-fun lt!461748 () (_ BitVec 64))

(assert (=> b!1046394 (= lt!461748 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461760 () (_ BitVec 64))

(assert (=> b!1046394 (= lt!461760 (select (arr!31699 lt!461623) #b00000000000000000000000000000000))))

(declare-fun lt!461751 () Unit!34139)

(assert (=> b!1046394 (= lt!461751 (addStillContains!632 lt!461762 lt!461748 (zeroValue!6243 thiss!1427) lt!461760))))

(assert (=> b!1046394 (contains!6103 (+!3133 lt!461762 (tuple2!15775 lt!461748 (zeroValue!6243 thiss!1427))) lt!461760)))

(declare-fun lt!461749 () Unit!34139)

(assert (=> b!1046394 (= lt!461749 lt!461751)))

(declare-fun lt!461752 () ListLongMap!13791)

(assert (=> b!1046394 (= lt!461752 (getCurrentListMapNoExtraKeys!3573 lt!461623 lt!461617 (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-fun lt!461765 () (_ BitVec 64))

(assert (=> b!1046394 (= lt!461765 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461754 () (_ BitVec 64))

(assert (=> b!1046394 (= lt!461754 (select (arr!31699 lt!461623) #b00000000000000000000000000000000))))

(declare-fun lt!461746 () Unit!34139)

(assert (=> b!1046394 (= lt!461746 (addApplyDifferent!488 lt!461752 lt!461765 (minValue!6243 thiss!1427) lt!461754))))

(assert (=> b!1046394 (= (apply!922 (+!3133 lt!461752 (tuple2!15775 lt!461765 (minValue!6243 thiss!1427))) lt!461754) (apply!922 lt!461752 lt!461754))))

(declare-fun lt!461759 () Unit!34139)

(assert (=> b!1046394 (= lt!461759 lt!461746)))

(declare-fun lt!461763 () ListLongMap!13791)

(assert (=> b!1046394 (= lt!461763 (getCurrentListMapNoExtraKeys!3573 lt!461623 lt!461617 (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-fun lt!461753 () (_ BitVec 64))

(assert (=> b!1046394 (= lt!461753 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461761 () (_ BitVec 64))

(assert (=> b!1046394 (= lt!461761 (select (arr!31699 lt!461623) #b00000000000000000000000000000000))))

(declare-fun lt!461747 () Unit!34139)

(assert (=> b!1046394 (= lt!461747 (addApplyDifferent!488 lt!461763 lt!461753 (zeroValue!6243 thiss!1427) lt!461761))))

(assert (=> b!1046394 (= (apply!922 (+!3133 lt!461763 (tuple2!15775 lt!461753 (zeroValue!6243 thiss!1427))) lt!461761) (apply!922 lt!461763 lt!461761))))

(declare-fun lt!461758 () Unit!34139)

(assert (=> b!1046394 (= lt!461758 lt!461747)))

(declare-fun lt!461756 () ListLongMap!13791)

(assert (=> b!1046394 (= lt!461756 (getCurrentListMapNoExtraKeys!3573 lt!461623 lt!461617 (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-fun lt!461745 () (_ BitVec 64))

(assert (=> b!1046394 (= lt!461745 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461744 () (_ BitVec 64))

(assert (=> b!1046394 (= lt!461744 (select (arr!31699 lt!461623) #b00000000000000000000000000000000))))

(assert (=> b!1046394 (= lt!461755 (addApplyDifferent!488 lt!461756 lt!461745 (minValue!6243 thiss!1427) lt!461744))))

(assert (=> b!1046394 (= (apply!922 (+!3133 lt!461756 (tuple2!15775 lt!461745 (minValue!6243 thiss!1427))) lt!461744) (apply!922 lt!461756 lt!461744))))

(declare-fun b!1046395 () Bool)

(assert (=> b!1046395 (= e!593188 e!593187)))

(declare-fun res!696439 () Bool)

(assert (=> b!1046395 (= res!696439 call!44527)))

(assert (=> b!1046395 (=> (not res!696439) (not e!593187))))

(declare-fun b!1046396 () Bool)

(declare-fun e!593186 () Bool)

(assert (=> b!1046396 (= e!593186 (= (apply!922 lt!461757 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6243 thiss!1427)))))

(declare-fun b!1046397 () Bool)

(assert (=> b!1046397 (= e!593196 e!593186)))

(declare-fun res!696437 () Bool)

(assert (=> b!1046397 (= res!696437 call!44525)))

(assert (=> b!1046397 (=> (not res!696437) (not e!593186))))

(declare-fun bm!44523 () Bool)

(assert (=> bm!44523 (= call!44528 (getCurrentListMapNoExtraKeys!3573 lt!461623 lt!461617 (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-fun bm!44524 () Bool)

(assert (=> bm!44524 (= call!44526 call!44523)))

(declare-fun bm!44525 () Bool)

(assert (=> bm!44525 (= call!44527 (contains!6103 lt!461757 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!126925 c!106625) b!1046383))

(assert (= (and d!126925 (not c!106625)) b!1046389))

(assert (= (and b!1046389 c!106628) b!1046385))

(assert (= (and b!1046389 (not c!106628)) b!1046387))

(assert (= (and b!1046387 c!106626) b!1046377))

(assert (= (and b!1046387 (not c!106626)) b!1046393))

(assert (= (or b!1046377 b!1046393) bm!44520))

(assert (= (or b!1046385 bm!44520) bm!44522))

(assert (= (or b!1046385 b!1046377) bm!44524))

(assert (= (or b!1046383 bm!44522) bm!44523))

(assert (= (or b!1046383 bm!44524) bm!44519))

(assert (= (and d!126925 res!696444) b!1046392))

(assert (= (and d!126925 c!106624) b!1046394))

(assert (= (and d!126925 (not c!106624)) b!1046391))

(assert (= (and d!126925 res!696438) b!1046381))

(assert (= (and b!1046381 res!696440) b!1046388))

(assert (= (and b!1046381 (not res!696442)) b!1046379))

(assert (= (and b!1046379 res!696443) b!1046390))

(assert (= (and b!1046381 res!696441) b!1046384))

(assert (= (and b!1046384 c!106623) b!1046397))

(assert (= (and b!1046384 (not c!106623)) b!1046378))

(assert (= (and b!1046397 res!696437) b!1046396))

(assert (= (or b!1046397 b!1046378) bm!44521))

(assert (= (and b!1046384 res!696436) b!1046380))

(assert (= (and b!1046380 c!106627) b!1046395))

(assert (= (and b!1046380 (not c!106627)) b!1046386))

(assert (= (and b!1046395 res!696439) b!1046382))

(assert (= (or b!1046395 b!1046386) bm!44525))

(declare-fun b_lambda!16283 () Bool)

(assert (=> (not b_lambda!16283) (not b!1046390)))

(assert (=> b!1046390 t!31246))

(declare-fun b_and!33749 () Bool)

(assert (= b_and!33747 (and (=> t!31246 result!14563) b_and!33749)))

(declare-fun m!966353 () Bool)

(assert (=> b!1046388 m!966353))

(assert (=> b!1046388 m!966353))

(declare-fun m!966355 () Bool)

(assert (=> b!1046388 m!966355))

(declare-fun m!966357 () Bool)

(assert (=> bm!44523 m!966357))

(declare-fun m!966359 () Bool)

(assert (=> bm!44519 m!966359))

(declare-fun m!966361 () Bool)

(assert (=> b!1046382 m!966361))

(declare-fun m!966363 () Bool)

(assert (=> bm!44521 m!966363))

(declare-fun m!966365 () Bool)

(assert (=> b!1046383 m!966365))

(declare-fun m!966367 () Bool)

(assert (=> b!1046394 m!966367))

(declare-fun m!966369 () Bool)

(assert (=> b!1046394 m!966369))

(assert (=> b!1046394 m!966357))

(declare-fun m!966371 () Bool)

(assert (=> b!1046394 m!966371))

(declare-fun m!966373 () Bool)

(assert (=> b!1046394 m!966373))

(declare-fun m!966375 () Bool)

(assert (=> b!1046394 m!966375))

(assert (=> b!1046394 m!966353))

(assert (=> b!1046394 m!966367))

(declare-fun m!966377 () Bool)

(assert (=> b!1046394 m!966377))

(assert (=> b!1046394 m!966371))

(declare-fun m!966379 () Bool)

(assert (=> b!1046394 m!966379))

(declare-fun m!966381 () Bool)

(assert (=> b!1046394 m!966381))

(declare-fun m!966383 () Bool)

(assert (=> b!1046394 m!966383))

(declare-fun m!966385 () Bool)

(assert (=> b!1046394 m!966385))

(declare-fun m!966387 () Bool)

(assert (=> b!1046394 m!966387))

(declare-fun m!966389 () Bool)

(assert (=> b!1046394 m!966389))

(declare-fun m!966391 () Bool)

(assert (=> b!1046394 m!966391))

(declare-fun m!966393 () Bool)

(assert (=> b!1046394 m!966393))

(assert (=> b!1046394 m!966381))

(assert (=> b!1046394 m!966389))

(declare-fun m!966395 () Bool)

(assert (=> b!1046394 m!966395))

(assert (=> b!1046390 m!966353))

(declare-fun m!966397 () Bool)

(assert (=> b!1046390 m!966397))

(assert (=> b!1046390 m!966169))

(assert (=> b!1046390 m!966353))

(declare-fun m!966399 () Bool)

(assert (=> b!1046390 m!966399))

(assert (=> b!1046390 m!966399))

(assert (=> b!1046390 m!966169))

(declare-fun m!966401 () Bool)

(assert (=> b!1046390 m!966401))

(assert (=> b!1046379 m!966353))

(assert (=> b!1046379 m!966353))

(declare-fun m!966403 () Bool)

(assert (=> b!1046379 m!966403))

(declare-fun m!966405 () Bool)

(assert (=> b!1046396 m!966405))

(declare-fun m!966407 () Bool)

(assert (=> bm!44525 m!966407))

(declare-fun m!966409 () Bool)

(assert (=> d!126925 m!966409))

(assert (=> b!1046392 m!966353))

(assert (=> b!1046392 m!966353))

(assert (=> b!1046392 m!966355))

(assert (=> b!1046244 d!126925))

(declare-fun b!1046408 () Bool)

(declare-fun e!593202 () Bool)

(assert (=> b!1046408 (= e!593202 (bvslt (size!32235 (_keys!11715 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1046409 () Bool)

(declare-fun e!593203 () Bool)

(assert (=> b!1046409 (= e!593203 (= (arrayCountValidKeys!0 (array!65916 (store (arr!31699 (_keys!11715 thiss!1427)) (index!41572 lt!461619) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32235 (_keys!11715 thiss!1427))) #b00000000000000000000000000000000 (size!32235 (_keys!11715 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11715 thiss!1427) #b00000000000000000000000000000000 (size!32235 (_keys!11715 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1046407 () Bool)

(declare-fun res!696454 () Bool)

(assert (=> b!1046407 (=> (not res!696454) (not e!593202))))

(assert (=> b!1046407 (= res!696454 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!126927 () Bool)

(assert (=> d!126927 e!593203))

(declare-fun res!696453 () Bool)

(assert (=> d!126927 (=> (not res!696453) (not e!593203))))

(assert (=> d!126927 (= res!696453 (and (bvsge (index!41572 lt!461619) #b00000000000000000000000000000000) (bvslt (index!41572 lt!461619) (size!32235 (_keys!11715 thiss!1427)))))))

(declare-fun lt!461768 () Unit!34139)

(declare-fun choose!82 (array!65915 (_ BitVec 32) (_ BitVec 64)) Unit!34139)

(assert (=> d!126927 (= lt!461768 (choose!82 (_keys!11715 thiss!1427) (index!41572 lt!461619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126927 e!593202))

(declare-fun res!696456 () Bool)

(assert (=> d!126927 (=> (not res!696456) (not e!593202))))

(assert (=> d!126927 (= res!696456 (and (bvsge (index!41572 lt!461619) #b00000000000000000000000000000000) (bvslt (index!41572 lt!461619) (size!32235 (_keys!11715 thiss!1427)))))))

(assert (=> d!126927 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11715 thiss!1427) (index!41572 lt!461619) #b1000000000000000000000000000000000000000000000000000000000000000) lt!461768)))

(declare-fun b!1046406 () Bool)

(declare-fun res!696455 () Bool)

(assert (=> b!1046406 (=> (not res!696455) (not e!593202))))

(assert (=> b!1046406 (= res!696455 (validKeyInArray!0 (select (arr!31699 (_keys!11715 thiss!1427)) (index!41572 lt!461619))))))

(assert (= (and d!126927 res!696456) b!1046406))

(assert (= (and b!1046406 res!696455) b!1046407))

(assert (= (and b!1046407 res!696454) b!1046408))

(assert (= (and d!126927 res!696453) b!1046409))

(assert (=> b!1046409 m!966177))

(declare-fun m!966411 () Bool)

(assert (=> b!1046409 m!966411))

(assert (=> b!1046409 m!966175))

(declare-fun m!966413 () Bool)

(assert (=> b!1046407 m!966413))

(declare-fun m!966415 () Bool)

(assert (=> d!126927 m!966415))

(declare-fun m!966417 () Bool)

(assert (=> b!1046406 m!966417))

(assert (=> b!1046406 m!966417))

(declare-fun m!966419 () Bool)

(assert (=> b!1046406 m!966419))

(assert (=> b!1046244 d!126927))

(declare-fun d!126929 () Bool)

(declare-fun lt!461771 () ListLongMap!13791)

(assert (=> d!126929 (not (contains!6103 lt!461771 key!909))))

(declare-fun removeStrictlySorted!62 (List!22003 (_ BitVec 64)) List!22003)

(assert (=> d!126929 (= lt!461771 (ListLongMap!13792 (removeStrictlySorted!62 (toList!6911 (getCurrentListMap!3955 (_keys!11715 thiss!1427) (_values!6432 thiss!1427) (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427))) key!909)))))

(assert (=> d!126929 (= (-!534 (getCurrentListMap!3955 (_keys!11715 thiss!1427) (_values!6432 thiss!1427) (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)) key!909) lt!461771)))

(declare-fun bs!30543 () Bool)

(assert (= bs!30543 d!126929))

(declare-fun m!966421 () Bool)

(assert (=> bs!30543 m!966421))

(declare-fun m!966423 () Bool)

(assert (=> bs!30543 m!966423))

(assert (=> b!1046244 d!126929))

(declare-fun d!126931 () Bool)

(declare-fun e!593206 () Bool)

(assert (=> d!126931 e!593206))

(declare-fun res!696459 () Bool)

(assert (=> d!126931 (=> (not res!696459) (not e!593206))))

(assert (=> d!126931 (= res!696459 (and (bvsge (index!41572 lt!461619) #b00000000000000000000000000000000) (bvslt (index!41572 lt!461619) (size!32235 (_keys!11715 thiss!1427)))))))

(declare-fun lt!461774 () Unit!34139)

(declare-fun choose!1717 (array!65915 array!65917 (_ BitVec 32) (_ BitVec 32) V!38003 V!38003 (_ BitVec 32) (_ BitVec 64) Int) Unit!34139)

(assert (=> d!126931 (= lt!461774 (choose!1717 (_keys!11715 thiss!1427) (_values!6432 thiss!1427) (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) (index!41572 lt!461619) key!909 (defaultEntry!6409 thiss!1427)))))

(assert (=> d!126931 (validMask!0 (mask!30588 thiss!1427))))

(assert (=> d!126931 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!56 (_keys!11715 thiss!1427) (_values!6432 thiss!1427) (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) (index!41572 lt!461619) key!909 (defaultEntry!6409 thiss!1427)) lt!461774)))

(declare-fun b!1046412 () Bool)

(assert (=> b!1046412 (= e!593206 (= (-!534 (getCurrentListMap!3955 (_keys!11715 thiss!1427) (_values!6432 thiss!1427) (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)) key!909) (getCurrentListMap!3955 (array!65916 (store (arr!31699 (_keys!11715 thiss!1427)) (index!41572 lt!461619) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32235 (_keys!11715 thiss!1427))) (array!65918 (store (arr!31700 (_values!6432 thiss!1427)) (index!41572 lt!461619) (ValueCellFull!11720 (dynLambda!2026 (defaultEntry!6409 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32236 (_values!6432 thiss!1427))) (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427))))))

(assert (=> b!1046412 (bvslt (index!41572 lt!461619) (size!32236 (_values!6432 thiss!1427)))))

(assert (= (and d!126931 res!696459) b!1046412))

(declare-fun b_lambda!16285 () Bool)

(assert (=> (not b_lambda!16285) (not b!1046412)))

(assert (=> b!1046412 t!31246))

(declare-fun b_and!33751 () Bool)

(assert (= b_and!33749 (and (=> t!31246 result!14563) b_and!33751)))

(declare-fun m!966425 () Bool)

(assert (=> d!126931 m!966425))

(assert (=> d!126931 m!966409))

(assert (=> b!1046412 m!966181))

(assert (=> b!1046412 m!966177))

(assert (=> b!1046412 m!966161))

(assert (=> b!1046412 m!966169))

(declare-fun m!966427 () Bool)

(assert (=> b!1046412 m!966427))

(assert (=> b!1046412 m!966161))

(assert (=> b!1046412 m!966163))

(assert (=> b!1046244 d!126931))

(declare-fun d!126933 () Bool)

(declare-fun e!593209 () Bool)

(assert (=> d!126933 e!593209))

(declare-fun res!696462 () Bool)

(assert (=> d!126933 (=> (not res!696462) (not e!593209))))

(assert (=> d!126933 (= res!696462 (and (bvsge (index!41572 lt!461619) #b00000000000000000000000000000000) (bvslt (index!41572 lt!461619) (size!32235 (_keys!11715 thiss!1427)))))))

(declare-fun lt!461777 () Unit!34139)

(declare-fun choose!25 (array!65915 (_ BitVec 32) (_ BitVec 32)) Unit!34139)

(assert (=> d!126933 (= lt!461777 (choose!25 (_keys!11715 thiss!1427) (index!41572 lt!461619) (mask!30588 thiss!1427)))))

(assert (=> d!126933 (validMask!0 (mask!30588 thiss!1427))))

(assert (=> d!126933 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11715 thiss!1427) (index!41572 lt!461619) (mask!30588 thiss!1427)) lt!461777)))

(declare-fun b!1046415 () Bool)

(assert (=> b!1046415 (= e!593209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65916 (store (arr!31699 (_keys!11715 thiss!1427)) (index!41572 lt!461619) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32235 (_keys!11715 thiss!1427))) (mask!30588 thiss!1427)))))

(assert (= (and d!126933 res!696462) b!1046415))

(declare-fun m!966429 () Bool)

(assert (=> d!126933 m!966429))

(assert (=> d!126933 m!966409))

(assert (=> b!1046415 m!966177))

(declare-fun m!966431 () Bool)

(assert (=> b!1046415 m!966431))

(assert (=> b!1046244 d!126933))

(declare-fun b!1046424 () Bool)

(declare-fun e!593215 () (_ BitVec 32))

(declare-fun e!593214 () (_ BitVec 32))

(assert (=> b!1046424 (= e!593215 e!593214)))

(declare-fun c!106634 () Bool)

(assert (=> b!1046424 (= c!106634 (validKeyInArray!0 (select (arr!31699 (_keys!11715 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44528 () Bool)

(declare-fun call!44531 () (_ BitVec 32))

(assert (=> bm!44528 (= call!44531 (arrayCountValidKeys!0 (_keys!11715 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32235 (_keys!11715 thiss!1427))))))

(declare-fun b!1046425 () Bool)

(assert (=> b!1046425 (= e!593214 (bvadd #b00000000000000000000000000000001 call!44531))))

(declare-fun b!1046426 () Bool)

(assert (=> b!1046426 (= e!593215 #b00000000000000000000000000000000)))

(declare-fun d!126935 () Bool)

(declare-fun lt!461780 () (_ BitVec 32))

(assert (=> d!126935 (and (bvsge lt!461780 #b00000000000000000000000000000000) (bvsle lt!461780 (bvsub (size!32235 (_keys!11715 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126935 (= lt!461780 e!593215)))

(declare-fun c!106633 () Bool)

(assert (=> d!126935 (= c!106633 (bvsge #b00000000000000000000000000000000 (size!32235 (_keys!11715 thiss!1427))))))

(assert (=> d!126935 (and (bvsle #b00000000000000000000000000000000 (size!32235 (_keys!11715 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32235 (_keys!11715 thiss!1427)) (size!32235 (_keys!11715 thiss!1427))))))

(assert (=> d!126935 (= (arrayCountValidKeys!0 (_keys!11715 thiss!1427) #b00000000000000000000000000000000 (size!32235 (_keys!11715 thiss!1427))) lt!461780)))

(declare-fun b!1046427 () Bool)

(assert (=> b!1046427 (= e!593214 call!44531)))

(assert (= (and d!126935 c!106633) b!1046426))

(assert (= (and d!126935 (not c!106633)) b!1046424))

(assert (= (and b!1046424 c!106634) b!1046425))

(assert (= (and b!1046424 (not c!106634)) b!1046427))

(assert (= (or b!1046425 b!1046427) bm!44528))

(declare-fun m!966433 () Bool)

(assert (=> b!1046424 m!966433))

(assert (=> b!1046424 m!966433))

(declare-fun m!966435 () Bool)

(assert (=> b!1046424 m!966435))

(declare-fun m!966437 () Bool)

(assert (=> bm!44528 m!966437))

(assert (=> b!1046244 d!126935))

(declare-fun b!1046428 () Bool)

(declare-fun e!593217 () (_ BitVec 32))

(declare-fun e!593216 () (_ BitVec 32))

(assert (=> b!1046428 (= e!593217 e!593216)))

(declare-fun c!106636 () Bool)

(assert (=> b!1046428 (= c!106636 (validKeyInArray!0 (select (arr!31699 lt!461623) #b00000000000000000000000000000000)))))

(declare-fun bm!44529 () Bool)

(declare-fun call!44532 () (_ BitVec 32))

(assert (=> bm!44529 (= call!44532 (arrayCountValidKeys!0 lt!461623 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32235 (_keys!11715 thiss!1427))))))

(declare-fun b!1046429 () Bool)

(assert (=> b!1046429 (= e!593216 (bvadd #b00000000000000000000000000000001 call!44532))))

(declare-fun b!1046430 () Bool)

(assert (=> b!1046430 (= e!593217 #b00000000000000000000000000000000)))

(declare-fun d!126937 () Bool)

(declare-fun lt!461781 () (_ BitVec 32))

(assert (=> d!126937 (and (bvsge lt!461781 #b00000000000000000000000000000000) (bvsle lt!461781 (bvsub (size!32235 lt!461623) #b00000000000000000000000000000000)))))

(assert (=> d!126937 (= lt!461781 e!593217)))

(declare-fun c!106635 () Bool)

(assert (=> d!126937 (= c!106635 (bvsge #b00000000000000000000000000000000 (size!32235 (_keys!11715 thiss!1427))))))

(assert (=> d!126937 (and (bvsle #b00000000000000000000000000000000 (size!32235 (_keys!11715 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32235 (_keys!11715 thiss!1427)) (size!32235 lt!461623)))))

(assert (=> d!126937 (= (arrayCountValidKeys!0 lt!461623 #b00000000000000000000000000000000 (size!32235 (_keys!11715 thiss!1427))) lt!461781)))

(declare-fun b!1046431 () Bool)

(assert (=> b!1046431 (= e!593216 call!44532)))

(assert (= (and d!126937 c!106635) b!1046430))

(assert (= (and d!126937 (not c!106635)) b!1046428))

(assert (= (and b!1046428 c!106636) b!1046429))

(assert (= (and b!1046428 (not c!106636)) b!1046431))

(assert (= (or b!1046429 b!1046431) bm!44529))

(assert (=> b!1046428 m!966353))

(assert (=> b!1046428 m!966353))

(assert (=> b!1046428 m!966355))

(declare-fun m!966439 () Bool)

(assert (=> bm!44529 m!966439))

(assert (=> b!1046244 d!126937))

(declare-fun d!126939 () Bool)

(declare-fun e!593220 () Bool)

(assert (=> d!126939 e!593220))

(declare-fun res!696465 () Bool)

(assert (=> d!126939 (=> (not res!696465) (not e!593220))))

(assert (=> d!126939 (= res!696465 (bvslt (index!41572 lt!461619) (size!32235 (_keys!11715 thiss!1427))))))

(declare-fun lt!461784 () Unit!34139)

(declare-fun choose!121 (array!65915 (_ BitVec 32) (_ BitVec 64)) Unit!34139)

(assert (=> d!126939 (= lt!461784 (choose!121 (_keys!11715 thiss!1427) (index!41572 lt!461619) key!909))))

(assert (=> d!126939 (bvsge (index!41572 lt!461619) #b00000000000000000000000000000000)))

(assert (=> d!126939 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11715 thiss!1427) (index!41572 lt!461619) key!909) lt!461784)))

(declare-fun b!1046434 () Bool)

(assert (=> b!1046434 (= e!593220 (not (arrayContainsKey!0 (array!65916 (store (arr!31699 (_keys!11715 thiss!1427)) (index!41572 lt!461619) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32235 (_keys!11715 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126939 res!696465) b!1046434))

(declare-fun m!966441 () Bool)

(assert (=> d!126939 m!966441))

(assert (=> b!1046434 m!966177))

(declare-fun m!966443 () Bool)

(assert (=> b!1046434 m!966443))

(assert (=> b!1046244 d!126939))

(declare-fun d!126941 () Bool)

(declare-fun e!593223 () Bool)

(assert (=> d!126941 e!593223))

(declare-fun res!696468 () Bool)

(assert (=> d!126941 (=> (not res!696468) (not e!593223))))

(assert (=> d!126941 (= res!696468 (and (bvsge (index!41572 lt!461619) #b00000000000000000000000000000000) (bvslt (index!41572 lt!461619) (size!32235 (_keys!11715 thiss!1427)))))))

(declare-fun lt!461787 () Unit!34139)

(declare-fun choose!53 (array!65915 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22004) Unit!34139)

(assert (=> d!126941 (= lt!461787 (choose!53 (_keys!11715 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41572 lt!461619) #b00000000000000000000000000000000 Nil!22001))))

(assert (=> d!126941 (bvslt (size!32235 (_keys!11715 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126941 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11715 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41572 lt!461619) #b00000000000000000000000000000000 Nil!22001) lt!461787)))

(declare-fun b!1046437 () Bool)

(assert (=> b!1046437 (= e!593223 (arrayNoDuplicates!0 (array!65916 (store (arr!31699 (_keys!11715 thiss!1427)) (index!41572 lt!461619) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32235 (_keys!11715 thiss!1427))) #b00000000000000000000000000000000 Nil!22001))))

(assert (= (and d!126941 res!696468) b!1046437))

(declare-fun m!966445 () Bool)

(assert (=> d!126941 m!966445))

(assert (=> b!1046437 m!966177))

(declare-fun m!966447 () Bool)

(assert (=> b!1046437 m!966447))

(assert (=> b!1046244 d!126941))

(declare-fun b!1046438 () Bool)

(declare-fun e!593231 () ListLongMap!13791)

(declare-fun call!44537 () ListLongMap!13791)

(assert (=> b!1046438 (= e!593231 call!44537)))

(declare-fun b!1046439 () Bool)

(declare-fun e!593235 () Bool)

(declare-fun call!44536 () Bool)

(assert (=> b!1046439 (= e!593235 (not call!44536))))

(declare-fun b!1046440 () Bool)

(declare-fun e!593234 () Bool)

(declare-fun e!593229 () Bool)

(assert (=> b!1046440 (= e!593234 e!593229)))

(declare-fun res!696476 () Bool)

(assert (=> b!1046440 (=> (not res!696476) (not e!593229))))

(declare-fun lt!461801 () ListLongMap!13791)

(assert (=> b!1046440 (= res!696476 (contains!6103 lt!461801 (select (arr!31699 (_keys!11715 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1046440 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32235 (_keys!11715 thiss!1427))))))

(declare-fun b!1046441 () Bool)

(declare-fun e!593232 () Bool)

(declare-fun e!593227 () Bool)

(assert (=> b!1046441 (= e!593232 e!593227)))

(declare-fun c!106641 () Bool)

(assert (=> b!1046441 (= c!106641 (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1046442 () Bool)

(declare-fun res!696474 () Bool)

(assert (=> b!1046442 (=> (not res!696474) (not e!593232))))

(assert (=> b!1046442 (= res!696474 e!593234)))

(declare-fun res!696475 () Bool)

(assert (=> b!1046442 (=> res!696475 e!593234)))

(declare-fun e!593230 () Bool)

(assert (=> b!1046442 (= res!696475 (not e!593230))))

(declare-fun res!696473 () Bool)

(assert (=> b!1046442 (=> (not res!696473) (not e!593230))))

(assert (=> b!1046442 (= res!696473 (bvslt #b00000000000000000000000000000000 (size!32235 (_keys!11715 thiss!1427))))))

(declare-fun d!126943 () Bool)

(assert (=> d!126943 e!593232))

(declare-fun res!696471 () Bool)

(assert (=> d!126943 (=> (not res!696471) (not e!593232))))

(assert (=> d!126943 (= res!696471 (or (bvsge #b00000000000000000000000000000000 (size!32235 (_keys!11715 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32235 (_keys!11715 thiss!1427))))))))

(declare-fun lt!461794 () ListLongMap!13791)

(assert (=> d!126943 (= lt!461801 lt!461794)))

(declare-fun lt!461808 () Unit!34139)

(declare-fun e!593224 () Unit!34139)

(assert (=> d!126943 (= lt!461808 e!593224)))

(declare-fun c!106638 () Bool)

(declare-fun e!593228 () Bool)

(assert (=> d!126943 (= c!106638 e!593228)))

(declare-fun res!696477 () Bool)

(assert (=> d!126943 (=> (not res!696477) (not e!593228))))

(assert (=> d!126943 (= res!696477 (bvslt #b00000000000000000000000000000000 (size!32235 (_keys!11715 thiss!1427))))))

(declare-fun e!593236 () ListLongMap!13791)

(assert (=> d!126943 (= lt!461794 e!593236)))

(declare-fun c!106639 () Bool)

(assert (=> d!126943 (= c!106639 (and (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126943 (validMask!0 (mask!30588 thiss!1427))))

(assert (=> d!126943 (= (getCurrentListMap!3955 (_keys!11715 thiss!1427) (_values!6432 thiss!1427) (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)) lt!461801)))

(declare-fun call!44533 () ListLongMap!13791)

(declare-fun call!44534 () ListLongMap!13791)

(declare-fun call!44535 () ListLongMap!13791)

(declare-fun call!44539 () ListLongMap!13791)

(declare-fun c!106642 () Bool)

(declare-fun bm!44530 () Bool)

(assert (=> bm!44530 (= call!44534 (+!3133 (ite c!106639 call!44539 (ite c!106642 call!44535 call!44533)) (ite (or c!106639 c!106642) (tuple2!15775 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6243 thiss!1427)) (tuple2!15775 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6243 thiss!1427)))))))

(declare-fun b!1046443 () Bool)

(declare-fun e!593226 () Bool)

(assert (=> b!1046443 (= e!593226 (= (apply!922 lt!461801 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6243 thiss!1427)))))

(declare-fun b!1046444 () Bool)

(assert (=> b!1046444 (= e!593236 (+!3133 call!44534 (tuple2!15775 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6243 thiss!1427))))))

(declare-fun bm!44531 () Bool)

(assert (=> bm!44531 (= call!44533 call!44535)))

(declare-fun b!1046445 () Bool)

(declare-fun res!696469 () Bool)

(assert (=> b!1046445 (=> (not res!696469) (not e!593232))))

(assert (=> b!1046445 (= res!696469 e!593235)))

(declare-fun c!106637 () Bool)

(assert (=> b!1046445 (= c!106637 (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1046446 () Bool)

(declare-fun e!593233 () ListLongMap!13791)

(assert (=> b!1046446 (= e!593233 call!44537)))

(declare-fun b!1046447 () Bool)

(declare-fun call!44538 () Bool)

(assert (=> b!1046447 (= e!593227 (not call!44538))))

(declare-fun b!1046448 () Bool)

(declare-fun c!106640 () Bool)

(assert (=> b!1046448 (= c!106640 (and (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1046448 (= e!593233 e!593231)))

(declare-fun b!1046449 () Bool)

(assert (=> b!1046449 (= e!593230 (validKeyInArray!0 (select (arr!31699 (_keys!11715 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1046450 () Bool)

(assert (=> b!1046450 (= e!593236 e!593233)))

(assert (=> b!1046450 (= c!106642 (and (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1046451 () Bool)

(assert (=> b!1046451 (= e!593229 (= (apply!922 lt!461801 (select (arr!31699 (_keys!11715 thiss!1427)) #b00000000000000000000000000000000)) (get!16585 (select (arr!31700 (_values!6432 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2026 (defaultEntry!6409 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1046451 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32236 (_values!6432 thiss!1427))))))

(assert (=> b!1046451 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32235 (_keys!11715 thiss!1427))))))

(declare-fun bm!44532 () Bool)

(assert (=> bm!44532 (= call!44536 (contains!6103 lt!461801 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1046452 () Bool)

(declare-fun Unit!34153 () Unit!34139)

(assert (=> b!1046452 (= e!593224 Unit!34153)))

(declare-fun bm!44533 () Bool)

(assert (=> bm!44533 (= call!44535 call!44539)))

(declare-fun b!1046453 () Bool)

(assert (=> b!1046453 (= e!593228 (validKeyInArray!0 (select (arr!31699 (_keys!11715 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1046454 () Bool)

(assert (=> b!1046454 (= e!593231 call!44533)))

(declare-fun b!1046455 () Bool)

(declare-fun lt!461799 () Unit!34139)

(assert (=> b!1046455 (= e!593224 lt!461799)))

(declare-fun lt!461806 () ListLongMap!13791)

(assert (=> b!1046455 (= lt!461806 (getCurrentListMapNoExtraKeys!3573 (_keys!11715 thiss!1427) (_values!6432 thiss!1427) (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-fun lt!461792 () (_ BitVec 64))

(assert (=> b!1046455 (= lt!461792 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461804 () (_ BitVec 64))

(assert (=> b!1046455 (= lt!461804 (select (arr!31699 (_keys!11715 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461795 () Unit!34139)

(assert (=> b!1046455 (= lt!461795 (addStillContains!632 lt!461806 lt!461792 (zeroValue!6243 thiss!1427) lt!461804))))

(assert (=> b!1046455 (contains!6103 (+!3133 lt!461806 (tuple2!15775 lt!461792 (zeroValue!6243 thiss!1427))) lt!461804)))

(declare-fun lt!461793 () Unit!34139)

(assert (=> b!1046455 (= lt!461793 lt!461795)))

(declare-fun lt!461796 () ListLongMap!13791)

(assert (=> b!1046455 (= lt!461796 (getCurrentListMapNoExtraKeys!3573 (_keys!11715 thiss!1427) (_values!6432 thiss!1427) (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-fun lt!461809 () (_ BitVec 64))

(assert (=> b!1046455 (= lt!461809 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461798 () (_ BitVec 64))

(assert (=> b!1046455 (= lt!461798 (select (arr!31699 (_keys!11715 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461790 () Unit!34139)

(assert (=> b!1046455 (= lt!461790 (addApplyDifferent!488 lt!461796 lt!461809 (minValue!6243 thiss!1427) lt!461798))))

(assert (=> b!1046455 (= (apply!922 (+!3133 lt!461796 (tuple2!15775 lt!461809 (minValue!6243 thiss!1427))) lt!461798) (apply!922 lt!461796 lt!461798))))

(declare-fun lt!461803 () Unit!34139)

(assert (=> b!1046455 (= lt!461803 lt!461790)))

(declare-fun lt!461807 () ListLongMap!13791)

(assert (=> b!1046455 (= lt!461807 (getCurrentListMapNoExtraKeys!3573 (_keys!11715 thiss!1427) (_values!6432 thiss!1427) (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-fun lt!461797 () (_ BitVec 64))

(assert (=> b!1046455 (= lt!461797 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461805 () (_ BitVec 64))

(assert (=> b!1046455 (= lt!461805 (select (arr!31699 (_keys!11715 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461791 () Unit!34139)

(assert (=> b!1046455 (= lt!461791 (addApplyDifferent!488 lt!461807 lt!461797 (zeroValue!6243 thiss!1427) lt!461805))))

(assert (=> b!1046455 (= (apply!922 (+!3133 lt!461807 (tuple2!15775 lt!461797 (zeroValue!6243 thiss!1427))) lt!461805) (apply!922 lt!461807 lt!461805))))

(declare-fun lt!461802 () Unit!34139)

(assert (=> b!1046455 (= lt!461802 lt!461791)))

(declare-fun lt!461800 () ListLongMap!13791)

(assert (=> b!1046455 (= lt!461800 (getCurrentListMapNoExtraKeys!3573 (_keys!11715 thiss!1427) (_values!6432 thiss!1427) (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-fun lt!461789 () (_ BitVec 64))

(assert (=> b!1046455 (= lt!461789 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461788 () (_ BitVec 64))

(assert (=> b!1046455 (= lt!461788 (select (arr!31699 (_keys!11715 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1046455 (= lt!461799 (addApplyDifferent!488 lt!461800 lt!461789 (minValue!6243 thiss!1427) lt!461788))))

(assert (=> b!1046455 (= (apply!922 (+!3133 lt!461800 (tuple2!15775 lt!461789 (minValue!6243 thiss!1427))) lt!461788) (apply!922 lt!461800 lt!461788))))

(declare-fun b!1046456 () Bool)

(assert (=> b!1046456 (= e!593227 e!593226)))

(declare-fun res!696472 () Bool)

(assert (=> b!1046456 (= res!696472 call!44538)))

(assert (=> b!1046456 (=> (not res!696472) (not e!593226))))

(declare-fun b!1046457 () Bool)

(declare-fun e!593225 () Bool)

(assert (=> b!1046457 (= e!593225 (= (apply!922 lt!461801 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6243 thiss!1427)))))

(declare-fun b!1046458 () Bool)

(assert (=> b!1046458 (= e!593235 e!593225)))

(declare-fun res!696470 () Bool)

(assert (=> b!1046458 (= res!696470 call!44536)))

(assert (=> b!1046458 (=> (not res!696470) (not e!593225))))

(declare-fun bm!44534 () Bool)

(assert (=> bm!44534 (= call!44539 (getCurrentListMapNoExtraKeys!3573 (_keys!11715 thiss!1427) (_values!6432 thiss!1427) (mask!30588 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-fun bm!44535 () Bool)

(assert (=> bm!44535 (= call!44537 call!44534)))

(declare-fun bm!44536 () Bool)

(assert (=> bm!44536 (= call!44538 (contains!6103 lt!461801 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!126943 c!106639) b!1046444))

(assert (= (and d!126943 (not c!106639)) b!1046450))

(assert (= (and b!1046450 c!106642) b!1046446))

(assert (= (and b!1046450 (not c!106642)) b!1046448))

(assert (= (and b!1046448 c!106640) b!1046438))

(assert (= (and b!1046448 (not c!106640)) b!1046454))

(assert (= (or b!1046438 b!1046454) bm!44531))

(assert (= (or b!1046446 bm!44531) bm!44533))

(assert (= (or b!1046446 b!1046438) bm!44535))

(assert (= (or b!1046444 bm!44533) bm!44534))

(assert (= (or b!1046444 bm!44535) bm!44530))

(assert (= (and d!126943 res!696477) b!1046453))

(assert (= (and d!126943 c!106638) b!1046455))

(assert (= (and d!126943 (not c!106638)) b!1046452))

(assert (= (and d!126943 res!696471) b!1046442))

(assert (= (and b!1046442 res!696473) b!1046449))

(assert (= (and b!1046442 (not res!696475)) b!1046440))

(assert (= (and b!1046440 res!696476) b!1046451))

(assert (= (and b!1046442 res!696474) b!1046445))

(assert (= (and b!1046445 c!106637) b!1046458))

(assert (= (and b!1046445 (not c!106637)) b!1046439))

(assert (= (and b!1046458 res!696470) b!1046457))

(assert (= (or b!1046458 b!1046439) bm!44532))

(assert (= (and b!1046445 res!696469) b!1046441))

(assert (= (and b!1046441 c!106641) b!1046456))

(assert (= (and b!1046441 (not c!106641)) b!1046447))

(assert (= (and b!1046456 res!696472) b!1046443))

(assert (= (or b!1046456 b!1046447) bm!44536))

(declare-fun b_lambda!16287 () Bool)

(assert (=> (not b_lambda!16287) (not b!1046451)))

(assert (=> b!1046451 t!31246))

(declare-fun b_and!33753 () Bool)

(assert (= b_and!33751 (and (=> t!31246 result!14563) b_and!33753)))

(assert (=> b!1046449 m!966433))

(assert (=> b!1046449 m!966433))

(assert (=> b!1046449 m!966435))

(declare-fun m!966449 () Bool)

(assert (=> bm!44534 m!966449))

(declare-fun m!966451 () Bool)

(assert (=> bm!44530 m!966451))

(declare-fun m!966453 () Bool)

(assert (=> b!1046443 m!966453))

(declare-fun m!966455 () Bool)

(assert (=> bm!44532 m!966455))

(declare-fun m!966457 () Bool)

(assert (=> b!1046444 m!966457))

(declare-fun m!966459 () Bool)

(assert (=> b!1046455 m!966459))

(declare-fun m!966461 () Bool)

(assert (=> b!1046455 m!966461))

(assert (=> b!1046455 m!966449))

(declare-fun m!966463 () Bool)

(assert (=> b!1046455 m!966463))

(declare-fun m!966465 () Bool)

(assert (=> b!1046455 m!966465))

(declare-fun m!966467 () Bool)

(assert (=> b!1046455 m!966467))

(assert (=> b!1046455 m!966433))

(assert (=> b!1046455 m!966459))

(declare-fun m!966469 () Bool)

(assert (=> b!1046455 m!966469))

(assert (=> b!1046455 m!966463))

(declare-fun m!966471 () Bool)

(assert (=> b!1046455 m!966471))

(declare-fun m!966473 () Bool)

(assert (=> b!1046455 m!966473))

(declare-fun m!966475 () Bool)

(assert (=> b!1046455 m!966475))

(declare-fun m!966477 () Bool)

(assert (=> b!1046455 m!966477))

(declare-fun m!966479 () Bool)

(assert (=> b!1046455 m!966479))

(declare-fun m!966481 () Bool)

(assert (=> b!1046455 m!966481))

(declare-fun m!966483 () Bool)

(assert (=> b!1046455 m!966483))

(declare-fun m!966485 () Bool)

(assert (=> b!1046455 m!966485))

(assert (=> b!1046455 m!966473))

(assert (=> b!1046455 m!966481))

(declare-fun m!966487 () Bool)

(assert (=> b!1046455 m!966487))

(assert (=> b!1046451 m!966433))

(declare-fun m!966489 () Bool)

(assert (=> b!1046451 m!966489))

(assert (=> b!1046451 m!966169))

(assert (=> b!1046451 m!966433))

(declare-fun m!966491 () Bool)

(assert (=> b!1046451 m!966491))

(assert (=> b!1046451 m!966491))

(assert (=> b!1046451 m!966169))

(declare-fun m!966493 () Bool)

(assert (=> b!1046451 m!966493))

(assert (=> b!1046440 m!966433))

(assert (=> b!1046440 m!966433))

(declare-fun m!966495 () Bool)

(assert (=> b!1046440 m!966495))

(declare-fun m!966497 () Bool)

(assert (=> b!1046457 m!966497))

(declare-fun m!966499 () Bool)

(assert (=> bm!44536 m!966499))

(assert (=> d!126943 m!966409))

(assert (=> b!1046453 m!966433))

(assert (=> b!1046453 m!966433))

(assert (=> b!1046453 m!966435))

(assert (=> b!1046244 d!126943))

(declare-fun b!1046467 () Bool)

(declare-fun e!593245 () Bool)

(declare-fun e!593244 () Bool)

(assert (=> b!1046467 (= e!593245 e!593244)))

(declare-fun lt!461818 () (_ BitVec 64))

(assert (=> b!1046467 (= lt!461818 (select (arr!31699 lt!461623) #b00000000000000000000000000000000))))

(declare-fun lt!461816 () Unit!34139)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65915 (_ BitVec 64) (_ BitVec 32)) Unit!34139)

(assert (=> b!1046467 (= lt!461816 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!461623 lt!461818 #b00000000000000000000000000000000))))

(assert (=> b!1046467 (arrayContainsKey!0 lt!461623 lt!461818 #b00000000000000000000000000000000)))

(declare-fun lt!461817 () Unit!34139)

(assert (=> b!1046467 (= lt!461817 lt!461816)))

(declare-fun res!696482 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65915 (_ BitVec 32)) SeekEntryResult!9800)

(assert (=> b!1046467 (= res!696482 (= (seekEntryOrOpen!0 (select (arr!31699 lt!461623) #b00000000000000000000000000000000) lt!461623 (mask!30588 thiss!1427)) (Found!9800 #b00000000000000000000000000000000)))))

(assert (=> b!1046467 (=> (not res!696482) (not e!593244))))

(declare-fun b!1046468 () Bool)

(declare-fun call!44542 () Bool)

(assert (=> b!1046468 (= e!593244 call!44542)))

(declare-fun b!1046469 () Bool)

(declare-fun e!593243 () Bool)

(assert (=> b!1046469 (= e!593243 e!593245)))

(declare-fun c!106645 () Bool)

(assert (=> b!1046469 (= c!106645 (validKeyInArray!0 (select (arr!31699 lt!461623) #b00000000000000000000000000000000)))))

(declare-fun d!126945 () Bool)

(declare-fun res!696483 () Bool)

(assert (=> d!126945 (=> res!696483 e!593243)))

(assert (=> d!126945 (= res!696483 (bvsge #b00000000000000000000000000000000 (size!32235 lt!461623)))))

(assert (=> d!126945 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461623 (mask!30588 thiss!1427)) e!593243)))

(declare-fun b!1046470 () Bool)

(assert (=> b!1046470 (= e!593245 call!44542)))

(declare-fun bm!44539 () Bool)

(assert (=> bm!44539 (= call!44542 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!461623 (mask!30588 thiss!1427)))))

(assert (= (and d!126945 (not res!696483)) b!1046469))

(assert (= (and b!1046469 c!106645) b!1046467))

(assert (= (and b!1046469 (not c!106645)) b!1046470))

(assert (= (and b!1046467 res!696482) b!1046468))

(assert (= (or b!1046468 b!1046470) bm!44539))

(assert (=> b!1046467 m!966353))

(declare-fun m!966501 () Bool)

(assert (=> b!1046467 m!966501))

(declare-fun m!966503 () Bool)

(assert (=> b!1046467 m!966503))

(assert (=> b!1046467 m!966353))

(declare-fun m!966505 () Bool)

(assert (=> b!1046467 m!966505))

(assert (=> b!1046469 m!966353))

(assert (=> b!1046469 m!966353))

(assert (=> b!1046469 m!966355))

(declare-fun m!966507 () Bool)

(assert (=> bm!44539 m!966507))

(assert (=> b!1046244 d!126945))

(declare-fun b!1046481 () Bool)

(declare-fun e!593257 () Bool)

(declare-fun call!44545 () Bool)

(assert (=> b!1046481 (= e!593257 call!44545)))

(declare-fun bm!44542 () Bool)

(declare-fun c!106648 () Bool)

(assert (=> bm!44542 (= call!44545 (arrayNoDuplicates!0 lt!461623 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106648 (Cons!22000 (select (arr!31699 lt!461623) #b00000000000000000000000000000000) Nil!22001) Nil!22001)))))

(declare-fun b!1046482 () Bool)

(declare-fun e!593254 () Bool)

(declare-fun e!593255 () Bool)

(assert (=> b!1046482 (= e!593254 e!593255)))

(declare-fun res!696491 () Bool)

(assert (=> b!1046482 (=> (not res!696491) (not e!593255))))

(declare-fun e!593256 () Bool)

(assert (=> b!1046482 (= res!696491 (not e!593256))))

(declare-fun res!696492 () Bool)

(assert (=> b!1046482 (=> (not res!696492) (not e!593256))))

(assert (=> b!1046482 (= res!696492 (validKeyInArray!0 (select (arr!31699 lt!461623) #b00000000000000000000000000000000)))))

(declare-fun b!1046483 () Bool)

(assert (=> b!1046483 (= e!593257 call!44545)))

(declare-fun b!1046484 () Bool)

(assert (=> b!1046484 (= e!593255 e!593257)))

(assert (=> b!1046484 (= c!106648 (validKeyInArray!0 (select (arr!31699 lt!461623) #b00000000000000000000000000000000)))))

(declare-fun b!1046485 () Bool)

(declare-fun contains!6106 (List!22004 (_ BitVec 64)) Bool)

(assert (=> b!1046485 (= e!593256 (contains!6106 Nil!22001 (select (arr!31699 lt!461623) #b00000000000000000000000000000000)))))

(declare-fun d!126947 () Bool)

(declare-fun res!696490 () Bool)

(assert (=> d!126947 (=> res!696490 e!593254)))

(assert (=> d!126947 (= res!696490 (bvsge #b00000000000000000000000000000000 (size!32235 lt!461623)))))

(assert (=> d!126947 (= (arrayNoDuplicates!0 lt!461623 #b00000000000000000000000000000000 Nil!22001) e!593254)))

(assert (= (and d!126947 (not res!696490)) b!1046482))

(assert (= (and b!1046482 res!696492) b!1046485))

(assert (= (and b!1046482 res!696491) b!1046484))

(assert (= (and b!1046484 c!106648) b!1046483))

(assert (= (and b!1046484 (not c!106648)) b!1046481))

(assert (= (or b!1046483 b!1046481) bm!44542))

(assert (=> bm!44542 m!966353))

(declare-fun m!966509 () Bool)

(assert (=> bm!44542 m!966509))

(assert (=> b!1046482 m!966353))

(assert (=> b!1046482 m!966353))

(assert (=> b!1046482 m!966355))

(assert (=> b!1046484 m!966353))

(assert (=> b!1046484 m!966353))

(assert (=> b!1046484 m!966355))

(assert (=> b!1046485 m!966353))

(assert (=> b!1046485 m!966353))

(declare-fun m!966511 () Bool)

(assert (=> b!1046485 m!966511))

(assert (=> b!1046244 d!126947))

(declare-fun d!126949 () Bool)

(declare-fun res!696497 () Bool)

(declare-fun e!593262 () Bool)

(assert (=> d!126949 (=> res!696497 e!593262)))

(assert (=> d!126949 (= res!696497 (= (select (arr!31699 lt!461623) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126949 (= (arrayContainsKey!0 lt!461623 key!909 #b00000000000000000000000000000000) e!593262)))

(declare-fun b!1046490 () Bool)

(declare-fun e!593263 () Bool)

(assert (=> b!1046490 (= e!593262 e!593263)))

(declare-fun res!696498 () Bool)

(assert (=> b!1046490 (=> (not res!696498) (not e!593263))))

(assert (=> b!1046490 (= res!696498 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32235 lt!461623)))))

(declare-fun b!1046491 () Bool)

(assert (=> b!1046491 (= e!593263 (arrayContainsKey!0 lt!461623 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126949 (not res!696497)) b!1046490))

(assert (= (and b!1046490 res!696498) b!1046491))

(assert (=> d!126949 m!966353))

(declare-fun m!966513 () Bool)

(assert (=> b!1046491 m!966513))

(assert (=> b!1046244 d!126949))

(declare-fun d!126951 () Bool)

(declare-fun e!593269 () Bool)

(assert (=> d!126951 e!593269))

(declare-fun res!696501 () Bool)

(assert (=> d!126951 (=> res!696501 e!593269)))

(declare-fun lt!461829 () Bool)

(assert (=> d!126951 (= res!696501 (not lt!461829))))

(declare-fun lt!461830 () Bool)

(assert (=> d!126951 (= lt!461829 lt!461830)))

(declare-fun lt!461828 () Unit!34139)

(declare-fun e!593268 () Unit!34139)

(assert (=> d!126951 (= lt!461828 e!593268)))

(declare-fun c!106651 () Bool)

(assert (=> d!126951 (= c!106651 lt!461830)))

(declare-fun containsKey!570 (List!22003 (_ BitVec 64)) Bool)

(assert (=> d!126951 (= lt!461830 (containsKey!570 (toList!6911 (getCurrentListMap!3955 (_keys!11715 (_2!7897 lt!461618)) (_values!6432 (_2!7897 lt!461618)) (mask!30588 (_2!7897 lt!461618)) (extraKeys!6137 (_2!7897 lt!461618)) (zeroValue!6243 (_2!7897 lt!461618)) (minValue!6243 (_2!7897 lt!461618)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7897 lt!461618)))) key!909))))

(assert (=> d!126951 (= (contains!6103 (getCurrentListMap!3955 (_keys!11715 (_2!7897 lt!461618)) (_values!6432 (_2!7897 lt!461618)) (mask!30588 (_2!7897 lt!461618)) (extraKeys!6137 (_2!7897 lt!461618)) (zeroValue!6243 (_2!7897 lt!461618)) (minValue!6243 (_2!7897 lt!461618)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7897 lt!461618))) key!909) lt!461829)))

(declare-fun b!1046498 () Bool)

(declare-fun lt!461827 () Unit!34139)

(assert (=> b!1046498 (= e!593268 lt!461827)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!401 (List!22003 (_ BitVec 64)) Unit!34139)

(assert (=> b!1046498 (= lt!461827 (lemmaContainsKeyImpliesGetValueByKeyDefined!401 (toList!6911 (getCurrentListMap!3955 (_keys!11715 (_2!7897 lt!461618)) (_values!6432 (_2!7897 lt!461618)) (mask!30588 (_2!7897 lt!461618)) (extraKeys!6137 (_2!7897 lt!461618)) (zeroValue!6243 (_2!7897 lt!461618)) (minValue!6243 (_2!7897 lt!461618)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7897 lt!461618)))) key!909))))

(declare-datatypes ((Option!640 0))(
  ( (Some!639 (v!15067 V!38003)) (None!638) )
))
(declare-fun isDefined!439 (Option!640) Bool)

(declare-fun getValueByKey!589 (List!22003 (_ BitVec 64)) Option!640)

(assert (=> b!1046498 (isDefined!439 (getValueByKey!589 (toList!6911 (getCurrentListMap!3955 (_keys!11715 (_2!7897 lt!461618)) (_values!6432 (_2!7897 lt!461618)) (mask!30588 (_2!7897 lt!461618)) (extraKeys!6137 (_2!7897 lt!461618)) (zeroValue!6243 (_2!7897 lt!461618)) (minValue!6243 (_2!7897 lt!461618)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7897 lt!461618)))) key!909))))

(declare-fun b!1046499 () Bool)

(declare-fun Unit!34154 () Unit!34139)

(assert (=> b!1046499 (= e!593268 Unit!34154)))

(declare-fun b!1046500 () Bool)

(assert (=> b!1046500 (= e!593269 (isDefined!439 (getValueByKey!589 (toList!6911 (getCurrentListMap!3955 (_keys!11715 (_2!7897 lt!461618)) (_values!6432 (_2!7897 lt!461618)) (mask!30588 (_2!7897 lt!461618)) (extraKeys!6137 (_2!7897 lt!461618)) (zeroValue!6243 (_2!7897 lt!461618)) (minValue!6243 (_2!7897 lt!461618)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7897 lt!461618)))) key!909)))))

(assert (= (and d!126951 c!106651) b!1046498))

(assert (= (and d!126951 (not c!106651)) b!1046499))

(assert (= (and d!126951 (not res!696501)) b!1046500))

(declare-fun m!966515 () Bool)

(assert (=> d!126951 m!966515))

(declare-fun m!966517 () Bool)

(assert (=> b!1046498 m!966517))

(declare-fun m!966519 () Bool)

(assert (=> b!1046498 m!966519))

(assert (=> b!1046498 m!966519))

(declare-fun m!966521 () Bool)

(assert (=> b!1046498 m!966521))

(assert (=> b!1046500 m!966519))

(assert (=> b!1046500 m!966519))

(assert (=> b!1046500 m!966521))

(assert (=> b!1046244 d!126951))

(declare-fun b!1046513 () Bool)

(declare-fun e!593277 () SeekEntryResult!9800)

(declare-fun lt!461839 () SeekEntryResult!9800)

(assert (=> b!1046513 (= e!593277 (MissingZero!9800 (index!41573 lt!461839)))))

(declare-fun b!1046514 () Bool)

(declare-fun e!593276 () SeekEntryResult!9800)

(assert (=> b!1046514 (= e!593276 Undefined!9800)))

(declare-fun b!1046515 () Bool)

(declare-fun e!593278 () SeekEntryResult!9800)

(assert (=> b!1046515 (= e!593278 (Found!9800 (index!41573 lt!461839)))))

(declare-fun b!1046516 () Bool)

(declare-fun c!106660 () Bool)

(declare-fun lt!461840 () (_ BitVec 64))

(assert (=> b!1046516 (= c!106660 (= lt!461840 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1046516 (= e!593278 e!593277)))

(declare-fun b!1046517 () Bool)

(declare-fun lt!461841 () SeekEntryResult!9800)

(assert (=> b!1046517 (= e!593277 (ite ((_ is MissingVacant!9800) lt!461841) (MissingZero!9800 (index!41574 lt!461841)) lt!461841))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65915 (_ BitVec 32)) SeekEntryResult!9800)

(assert (=> b!1046517 (= lt!461841 (seekKeyOrZeroReturnVacant!0 (x!93300 lt!461839) (index!41573 lt!461839) (index!41573 lt!461839) key!909 (_keys!11715 thiss!1427) (mask!30588 thiss!1427)))))

(declare-fun b!1046518 () Bool)

(assert (=> b!1046518 (= e!593276 e!593278)))

(assert (=> b!1046518 (= lt!461840 (select (arr!31699 (_keys!11715 thiss!1427)) (index!41573 lt!461839)))))

(declare-fun c!106658 () Bool)

(assert (=> b!1046518 (= c!106658 (= lt!461840 key!909))))

(declare-fun d!126953 () Bool)

(declare-fun lt!461842 () SeekEntryResult!9800)

(assert (=> d!126953 (and (or ((_ is MissingVacant!9800) lt!461842) (not ((_ is Found!9800) lt!461842)) (and (bvsge (index!41572 lt!461842) #b00000000000000000000000000000000) (bvslt (index!41572 lt!461842) (size!32235 (_keys!11715 thiss!1427))))) (not ((_ is MissingVacant!9800) lt!461842)) (or (not ((_ is Found!9800) lt!461842)) (= (select (arr!31699 (_keys!11715 thiss!1427)) (index!41572 lt!461842)) key!909)))))

(assert (=> d!126953 (= lt!461842 e!593276)))

(declare-fun c!106659 () Bool)

(assert (=> d!126953 (= c!106659 (and ((_ is Intermediate!9800) lt!461839) (undefined!10612 lt!461839)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65915 (_ BitVec 32)) SeekEntryResult!9800)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126953 (= lt!461839 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30588 thiss!1427)) key!909 (_keys!11715 thiss!1427) (mask!30588 thiss!1427)))))

(assert (=> d!126953 (validMask!0 (mask!30588 thiss!1427))))

(assert (=> d!126953 (= (seekEntry!0 key!909 (_keys!11715 thiss!1427) (mask!30588 thiss!1427)) lt!461842)))

(assert (= (and d!126953 c!106659) b!1046514))

(assert (= (and d!126953 (not c!106659)) b!1046518))

(assert (= (and b!1046518 c!106658) b!1046515))

(assert (= (and b!1046518 (not c!106658)) b!1046516))

(assert (= (and b!1046516 c!106660) b!1046513))

(assert (= (and b!1046516 (not c!106660)) b!1046517))

(declare-fun m!966523 () Bool)

(assert (=> b!1046517 m!966523))

(declare-fun m!966525 () Bool)

(assert (=> b!1046518 m!966525))

(declare-fun m!966527 () Bool)

(assert (=> d!126953 m!966527))

(declare-fun m!966529 () Bool)

(assert (=> d!126953 m!966529))

(assert (=> d!126953 m!966529))

(declare-fun m!966531 () Bool)

(assert (=> d!126953 m!966531))

(assert (=> d!126953 m!966409))

(assert (=> b!1046240 d!126953))

(declare-fun d!126955 () Bool)

(assert (=> d!126955 (= (array_inv!24495 (_keys!11715 thiss!1427)) (bvsge (size!32235 (_keys!11715 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1046241 d!126955))

(declare-fun d!126957 () Bool)

(assert (=> d!126957 (= (array_inv!24496 (_values!6432 thiss!1427)) (bvsge (size!32236 (_values!6432 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1046241 d!126957))

(declare-fun d!126959 () Bool)

(assert (=> d!126959 (= (validMask!0 (mask!30588 (_2!7897 lt!461618))) (and (or (= (mask!30588 (_2!7897 lt!461618)) #b00000000000000000000000000000111) (= (mask!30588 (_2!7897 lt!461618)) #b00000000000000000000000000001111) (= (mask!30588 (_2!7897 lt!461618)) #b00000000000000000000000000011111) (= (mask!30588 (_2!7897 lt!461618)) #b00000000000000000000000000111111) (= (mask!30588 (_2!7897 lt!461618)) #b00000000000000000000000001111111) (= (mask!30588 (_2!7897 lt!461618)) #b00000000000000000000000011111111) (= (mask!30588 (_2!7897 lt!461618)) #b00000000000000000000000111111111) (= (mask!30588 (_2!7897 lt!461618)) #b00000000000000000000001111111111) (= (mask!30588 (_2!7897 lt!461618)) #b00000000000000000000011111111111) (= (mask!30588 (_2!7897 lt!461618)) #b00000000000000000000111111111111) (= (mask!30588 (_2!7897 lt!461618)) #b00000000000000000001111111111111) (= (mask!30588 (_2!7897 lt!461618)) #b00000000000000000011111111111111) (= (mask!30588 (_2!7897 lt!461618)) #b00000000000000000111111111111111) (= (mask!30588 (_2!7897 lt!461618)) #b00000000000000001111111111111111) (= (mask!30588 (_2!7897 lt!461618)) #b00000000000000011111111111111111) (= (mask!30588 (_2!7897 lt!461618)) #b00000000000000111111111111111111) (= (mask!30588 (_2!7897 lt!461618)) #b00000000000001111111111111111111) (= (mask!30588 (_2!7897 lt!461618)) #b00000000000011111111111111111111) (= (mask!30588 (_2!7897 lt!461618)) #b00000000000111111111111111111111) (= (mask!30588 (_2!7897 lt!461618)) #b00000000001111111111111111111111) (= (mask!30588 (_2!7897 lt!461618)) #b00000000011111111111111111111111) (= (mask!30588 (_2!7897 lt!461618)) #b00000000111111111111111111111111) (= (mask!30588 (_2!7897 lt!461618)) #b00000001111111111111111111111111) (= (mask!30588 (_2!7897 lt!461618)) #b00000011111111111111111111111111) (= (mask!30588 (_2!7897 lt!461618)) #b00000111111111111111111111111111) (= (mask!30588 (_2!7897 lt!461618)) #b00001111111111111111111111111111) (= (mask!30588 (_2!7897 lt!461618)) #b00011111111111111111111111111111) (= (mask!30588 (_2!7897 lt!461618)) #b00111111111111111111111111111111)) (bvsle (mask!30588 (_2!7897 lt!461618)) #b00111111111111111111111111111111)))))

(assert (=> b!1046237 d!126959))

(declare-fun condMapEmpty!38915 () Bool)

(declare-fun mapDefault!38915 () ValueCell!11720)

(assert (=> mapNonEmpty!38906 (= condMapEmpty!38915 (= mapRest!38906 ((as const (Array (_ BitVec 32) ValueCell!11720)) mapDefault!38915)))))

(declare-fun e!593284 () Bool)

(declare-fun mapRes!38915 () Bool)

(assert (=> mapNonEmpty!38906 (= tp!74633 (and e!593284 mapRes!38915))))

(declare-fun mapNonEmpty!38915 () Bool)

(declare-fun tp!74649 () Bool)

(declare-fun e!593283 () Bool)

(assert (=> mapNonEmpty!38915 (= mapRes!38915 (and tp!74649 e!593283))))

(declare-fun mapRest!38915 () (Array (_ BitVec 32) ValueCell!11720))

(declare-fun mapKey!38915 () (_ BitVec 32))

(declare-fun mapValue!38915 () ValueCell!11720)

(assert (=> mapNonEmpty!38915 (= mapRest!38906 (store mapRest!38915 mapKey!38915 mapValue!38915))))

(declare-fun mapIsEmpty!38915 () Bool)

(assert (=> mapIsEmpty!38915 mapRes!38915))

(declare-fun b!1046526 () Bool)

(assert (=> b!1046526 (= e!593284 tp_is_empty!24847)))

(declare-fun b!1046525 () Bool)

(assert (=> b!1046525 (= e!593283 tp_is_empty!24847)))

(assert (= (and mapNonEmpty!38906 condMapEmpty!38915) mapIsEmpty!38915))

(assert (= (and mapNonEmpty!38906 (not condMapEmpty!38915)) mapNonEmpty!38915))

(assert (= (and mapNonEmpty!38915 ((_ is ValueCellFull!11720) mapValue!38915)) b!1046525))

(assert (= (and mapNonEmpty!38906 ((_ is ValueCellFull!11720) mapDefault!38915)) b!1046526))

(declare-fun m!966533 () Bool)

(assert (=> mapNonEmpty!38915 m!966533))

(declare-fun b_lambda!16289 () Bool)

(assert (= b_lambda!16283 (or (and b!1046241 b_free!21127) b_lambda!16289)))

(declare-fun b_lambda!16291 () Bool)

(assert (= b_lambda!16285 (or (and b!1046241 b_free!21127) b_lambda!16291)))

(declare-fun b_lambda!16293 () Bool)

(assert (= b_lambda!16287 (or (and b!1046241 b_free!21127) b_lambda!16293)))

(check-sat b_and!33753 (not bm!44542) (not b!1046455) (not b!1046379) (not b!1046484) (not b!1046449) (not bm!44539) (not d!126921) (not bm!44519) (not b!1046358) (not b!1046482) (not bm!44529) (not b!1046500) (not b!1046371) (not bm!44532) (not d!126933) (not b!1046451) (not b_lambda!16289) (not b!1046362) (not b_next!21127) tp_is_empty!24847 (not bm!44525) (not b!1046440) (not b!1046369) (not b!1046467) (not bm!44534) (not b!1046424) (not b!1046457) (not b!1046312) (not d!126941) (not b!1046443) (not bm!44512) (not b!1046313) (not b!1046485) (not b!1046361) (not b!1046469) (not b!1046517) (not b!1046392) (not d!126929) (not b!1046396) (not bm!44523) (not b!1046412) (not d!126943) (not b!1046453) (not bm!44530) (not bm!44528) (not b!1046373) (not b!1046390) (not b!1046415) (not bm!44521) (not b!1046382) (not b_lambda!16291) (not b!1046437) (not d!126925) (not b!1046388) (not b!1046407) (not d!126939) (not d!126951) (not bm!44536) (not mapNonEmpty!38915) (not b!1046367) (not b!1046444) (not b!1046406) (not b_lambda!16293) (not d!126953) (not b!1046375) (not bm!44518) (not b!1046311) (not b!1046394) (not b!1046409) (not b!1046434) (not b_lambda!16281) (not b!1046428) (not d!126931) (not d!126923) (not b_lambda!16279) (not bm!44516) (not b!1046383) (not d!126927) (not b!1046498) (not bm!44514) (not b!1046491))
(check-sat b_and!33753 (not b_next!21127))
