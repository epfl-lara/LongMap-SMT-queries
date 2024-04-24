; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91322 () Bool)

(assert start!91322)

(declare-fun b!1041283 () Bool)

(declare-fun b_free!20995 () Bool)

(declare-fun b_next!20995 () Bool)

(assert (=> b!1041283 (= b_free!20995 (not b_next!20995))))

(declare-fun tp!74173 () Bool)

(declare-fun b_and!33537 () Bool)

(assert (=> b!1041283 (= tp!74173 b_and!33537)))

(declare-fun res!693949 () Bool)

(declare-fun e!589531 () Bool)

(assert (=> start!91322 (=> (not res!693949) (not e!589531))))

(declare-datatypes ((V!37827 0))(
  ( (V!37828 (val!12408 Int)) )
))
(declare-datatypes ((ValueCell!11654 0))(
  ( (ValueCellFull!11654 (v!14991 V!37827)) (EmptyCell!11654) )
))
(declare-datatypes ((array!65611 0))(
  ( (array!65612 (arr!31567 (Array (_ BitVec 32) (_ BitVec 64))) (size!32099 (_ BitVec 32))) )
))
(declare-datatypes ((array!65613 0))(
  ( (array!65614 (arr!31568 (Array (_ BitVec 32) ValueCell!11654)) (size!32100 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5902 0))(
  ( (LongMapFixedSize!5903 (defaultEntry!6333 Int) (mask!30374 (_ BitVec 32)) (extraKeys!6061 (_ BitVec 32)) (zeroValue!6167 V!37827) (minValue!6167 V!37827) (_size!3006 (_ BitVec 32)) (_keys!11587 array!65611) (_values!6356 array!65613) (_vacant!3006 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5902)

(declare-fun valid!2228 (LongMapFixedSize!5902) Bool)

(assert (=> start!91322 (= res!693949 (valid!2228 thiss!1427))))

(assert (=> start!91322 e!589531))

(declare-fun e!589534 () Bool)

(assert (=> start!91322 e!589534))

(assert (=> start!91322 true))

(declare-fun mapNonEmpty!38644 () Bool)

(declare-fun mapRes!38644 () Bool)

(declare-fun tp!74174 () Bool)

(declare-fun e!589533 () Bool)

(assert (=> mapNonEmpty!38644 (= mapRes!38644 (and tp!74174 e!589533))))

(declare-fun mapValue!38644 () ValueCell!11654)

(declare-fun mapRest!38644 () (Array (_ BitVec 32) ValueCell!11654))

(declare-fun mapKey!38644 () (_ BitVec 32))

(assert (=> mapNonEmpty!38644 (= (arr!31568 (_values!6356 thiss!1427)) (store mapRest!38644 mapKey!38644 mapValue!38644))))

(declare-fun b!1041282 () Bool)

(declare-fun e!589532 () Bool)

(declare-fun e!589536 () Bool)

(assert (=> b!1041282 (= e!589532 (and e!589536 mapRes!38644))))

(declare-fun condMapEmpty!38644 () Bool)

(declare-fun mapDefault!38644 () ValueCell!11654)

(assert (=> b!1041282 (= condMapEmpty!38644 (= (arr!31568 (_values!6356 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11654)) mapDefault!38644)))))

(declare-fun tp_is_empty!24715 () Bool)

(declare-fun array_inv!24413 (array!65611) Bool)

(declare-fun array_inv!24414 (array!65613) Bool)

(assert (=> b!1041283 (= e!589534 (and tp!74173 tp_is_empty!24715 (array_inv!24413 (_keys!11587 thiss!1427)) (array_inv!24414 (_values!6356 thiss!1427)) e!589532))))

(declare-fun mapIsEmpty!38644 () Bool)

(assert (=> mapIsEmpty!38644 mapRes!38644))

(declare-fun b!1041284 () Bool)

(assert (=> b!1041284 (= e!589536 tp_is_empty!24715)))

(declare-fun b!1041285 () Bool)

(assert (=> b!1041285 (= e!589533 tp_is_empty!24715)))

(declare-fun b!1041286 () Bool)

(declare-fun e!589535 () Bool)

(assert (=> b!1041286 (= e!589531 e!589535)))

(declare-fun res!693948 () Bool)

(assert (=> b!1041286 (=> (not res!693948) (not e!589535))))

(declare-datatypes ((SeekEntryResult!9745 0))(
  ( (MissingZero!9745 (index!41351 (_ BitVec 32))) (Found!9745 (index!41352 (_ BitVec 32))) (Intermediate!9745 (undefined!10557 Bool) (index!41353 (_ BitVec 32)) (x!92807 (_ BitVec 32))) (Undefined!9745) (MissingVacant!9745 (index!41354 (_ BitVec 32))) )
))
(declare-fun lt!458845 () SeekEntryResult!9745)

(get-info :version)

(assert (=> b!1041286 (= res!693948 ((_ is Found!9745) lt!458845))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65611 (_ BitVec 32)) SeekEntryResult!9745)

(assert (=> b!1041286 (= lt!458845 (seekEntry!0 key!909 (_keys!11587 thiss!1427) (mask!30374 thiss!1427)))))

(declare-fun b!1041287 () Bool)

(declare-fun res!693947 () Bool)

(assert (=> b!1041287 (=> (not res!693947) (not e!589531))))

(assert (=> b!1041287 (= res!693947 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1041288 () Bool)

(assert (=> b!1041288 (= e!589535 (not (or (bvslt (index!41352 lt!458845) #b00000000000000000000000000000000) (bvsge (index!41352 lt!458845) (size!32099 (_keys!11587 thiss!1427))) (bvslt (size!32099 (_keys!11587 thiss!1427)) #b01111111111111111111111111111111))))))

(declare-fun lt!458847 () array!65611)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65611 (_ BitVec 32)) Bool)

(assert (=> b!1041288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458847 (mask!30374 thiss!1427))))

(declare-datatypes ((Unit!34009 0))(
  ( (Unit!34010) )
))
(declare-fun lt!458846 () Unit!34009)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65611 (_ BitVec 32) (_ BitVec 32)) Unit!34009)

(assert (=> b!1041288 (= lt!458846 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11587 thiss!1427) (index!41352 lt!458845) (mask!30374 thiss!1427)))))

(declare-datatypes ((List!21941 0))(
  ( (Nil!21938) (Cons!21937 (h!23150 (_ BitVec 64)) (t!31147 List!21941)) )
))
(declare-fun arrayNoDuplicates!0 (array!65611 (_ BitVec 32) List!21941) Bool)

(assert (=> b!1041288 (arrayNoDuplicates!0 lt!458847 #b00000000000000000000000000000000 Nil!21938)))

(declare-fun lt!458844 () Unit!34009)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65611 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21941) Unit!34009)

(assert (=> b!1041288 (= lt!458844 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11587 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41352 lt!458845) #b00000000000000000000000000000000 Nil!21938))))

(declare-fun arrayCountValidKeys!0 (array!65611 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041288 (= (arrayCountValidKeys!0 lt!458847 #b00000000000000000000000000000000 (size!32099 (_keys!11587 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11587 thiss!1427) #b00000000000000000000000000000000 (size!32099 (_keys!11587 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1041288 (= lt!458847 (array!65612 (store (arr!31567 (_keys!11587 thiss!1427)) (index!41352 lt!458845) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32099 (_keys!11587 thiss!1427))))))

(declare-fun lt!458843 () Unit!34009)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65611 (_ BitVec 32) (_ BitVec 64)) Unit!34009)

(assert (=> b!1041288 (= lt!458843 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11587 thiss!1427) (index!41352 lt!458845) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!91322 res!693949) b!1041287))

(assert (= (and b!1041287 res!693947) b!1041286))

(assert (= (and b!1041286 res!693948) b!1041288))

(assert (= (and b!1041282 condMapEmpty!38644) mapIsEmpty!38644))

(assert (= (and b!1041282 (not condMapEmpty!38644)) mapNonEmpty!38644))

(assert (= (and mapNonEmpty!38644 ((_ is ValueCellFull!11654) mapValue!38644)) b!1041285))

(assert (= (and b!1041282 ((_ is ValueCellFull!11654) mapDefault!38644)) b!1041284))

(assert (= b!1041283 b!1041282))

(assert (= start!91322 b!1041283))

(declare-fun m!961249 () Bool)

(assert (=> b!1041286 m!961249))

(declare-fun m!961251 () Bool)

(assert (=> b!1041288 m!961251))

(declare-fun m!961253 () Bool)

(assert (=> b!1041288 m!961253))

(declare-fun m!961255 () Bool)

(assert (=> b!1041288 m!961255))

(declare-fun m!961257 () Bool)

(assert (=> b!1041288 m!961257))

(declare-fun m!961259 () Bool)

(assert (=> b!1041288 m!961259))

(declare-fun m!961261 () Bool)

(assert (=> b!1041288 m!961261))

(declare-fun m!961263 () Bool)

(assert (=> b!1041288 m!961263))

(declare-fun m!961265 () Bool)

(assert (=> b!1041288 m!961265))

(declare-fun m!961267 () Bool)

(assert (=> start!91322 m!961267))

(declare-fun m!961269 () Bool)

(assert (=> mapNonEmpty!38644 m!961269))

(declare-fun m!961271 () Bool)

(assert (=> b!1041283 m!961271))

(declare-fun m!961273 () Bool)

(assert (=> b!1041283 m!961273))

(check-sat b_and!33537 (not start!91322) (not b!1041286) (not b!1041288) (not b!1041283) tp_is_empty!24715 (not mapNonEmpty!38644) (not b_next!20995))
(check-sat b_and!33537 (not b_next!20995))
(get-model)

(declare-fun d!126045 () Bool)

(declare-fun lt!458887 () SeekEntryResult!9745)

(assert (=> d!126045 (and (or ((_ is MissingVacant!9745) lt!458887) (not ((_ is Found!9745) lt!458887)) (and (bvsge (index!41352 lt!458887) #b00000000000000000000000000000000) (bvslt (index!41352 lt!458887) (size!32099 (_keys!11587 thiss!1427))))) (not ((_ is MissingVacant!9745) lt!458887)) (or (not ((_ is Found!9745) lt!458887)) (= (select (arr!31567 (_keys!11587 thiss!1427)) (index!41352 lt!458887)) key!909)))))

(declare-fun e!589586 () SeekEntryResult!9745)

(assert (=> d!126045 (= lt!458887 e!589586)))

(declare-fun c!105836 () Bool)

(declare-fun lt!458886 () SeekEntryResult!9745)

(assert (=> d!126045 (= c!105836 (and ((_ is Intermediate!9745) lt!458886) (undefined!10557 lt!458886)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65611 (_ BitVec 32)) SeekEntryResult!9745)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126045 (= lt!458886 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30374 thiss!1427)) key!909 (_keys!11587 thiss!1427) (mask!30374 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!126045 (validMask!0 (mask!30374 thiss!1427))))

(assert (=> d!126045 (= (seekEntry!0 key!909 (_keys!11587 thiss!1427) (mask!30374 thiss!1427)) lt!458887)))

(declare-fun b!1041343 () Bool)

(assert (=> b!1041343 (= e!589586 Undefined!9745)))

(declare-fun b!1041344 () Bool)

(declare-fun e!589587 () SeekEntryResult!9745)

(assert (=> b!1041344 (= e!589587 (Found!9745 (index!41353 lt!458886)))))

(declare-fun b!1041345 () Bool)

(declare-fun e!589585 () SeekEntryResult!9745)

(assert (=> b!1041345 (= e!589585 (MissingZero!9745 (index!41353 lt!458886)))))

(declare-fun b!1041346 () Bool)

(declare-fun c!105837 () Bool)

(declare-fun lt!458889 () (_ BitVec 64))

(assert (=> b!1041346 (= c!105837 (= lt!458889 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1041346 (= e!589587 e!589585)))

(declare-fun b!1041347 () Bool)

(assert (=> b!1041347 (= e!589586 e!589587)))

(assert (=> b!1041347 (= lt!458889 (select (arr!31567 (_keys!11587 thiss!1427)) (index!41353 lt!458886)))))

(declare-fun c!105838 () Bool)

(assert (=> b!1041347 (= c!105838 (= lt!458889 key!909))))

(declare-fun b!1041348 () Bool)

(declare-fun lt!458888 () SeekEntryResult!9745)

(assert (=> b!1041348 (= e!589585 (ite ((_ is MissingVacant!9745) lt!458888) (MissingZero!9745 (index!41354 lt!458888)) lt!458888))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65611 (_ BitVec 32)) SeekEntryResult!9745)

(assert (=> b!1041348 (= lt!458888 (seekKeyOrZeroReturnVacant!0 (x!92807 lt!458886) (index!41353 lt!458886) (index!41353 lt!458886) key!909 (_keys!11587 thiss!1427) (mask!30374 thiss!1427)))))

(assert (= (and d!126045 c!105836) b!1041343))

(assert (= (and d!126045 (not c!105836)) b!1041347))

(assert (= (and b!1041347 c!105838) b!1041344))

(assert (= (and b!1041347 (not c!105838)) b!1041346))

(assert (= (and b!1041346 c!105837) b!1041345))

(assert (= (and b!1041346 (not c!105837)) b!1041348))

(declare-fun m!961327 () Bool)

(assert (=> d!126045 m!961327))

(declare-fun m!961329 () Bool)

(assert (=> d!126045 m!961329))

(assert (=> d!126045 m!961329))

(declare-fun m!961331 () Bool)

(assert (=> d!126045 m!961331))

(declare-fun m!961333 () Bool)

(assert (=> d!126045 m!961333))

(declare-fun m!961335 () Bool)

(assert (=> b!1041347 m!961335))

(declare-fun m!961337 () Bool)

(assert (=> b!1041348 m!961337))

(assert (=> b!1041286 d!126045))

(declare-fun d!126047 () Bool)

(declare-fun res!693974 () Bool)

(declare-fun e!589590 () Bool)

(assert (=> d!126047 (=> (not res!693974) (not e!589590))))

(declare-fun simpleValid!431 (LongMapFixedSize!5902) Bool)

(assert (=> d!126047 (= res!693974 (simpleValid!431 thiss!1427))))

(assert (=> d!126047 (= (valid!2228 thiss!1427) e!589590)))

(declare-fun b!1041355 () Bool)

(declare-fun res!693975 () Bool)

(assert (=> b!1041355 (=> (not res!693975) (not e!589590))))

(assert (=> b!1041355 (= res!693975 (= (arrayCountValidKeys!0 (_keys!11587 thiss!1427) #b00000000000000000000000000000000 (size!32099 (_keys!11587 thiss!1427))) (_size!3006 thiss!1427)))))

(declare-fun b!1041356 () Bool)

(declare-fun res!693976 () Bool)

(assert (=> b!1041356 (=> (not res!693976) (not e!589590))))

(assert (=> b!1041356 (= res!693976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11587 thiss!1427) (mask!30374 thiss!1427)))))

(declare-fun b!1041357 () Bool)

(assert (=> b!1041357 (= e!589590 (arrayNoDuplicates!0 (_keys!11587 thiss!1427) #b00000000000000000000000000000000 Nil!21938))))

(assert (= (and d!126047 res!693974) b!1041355))

(assert (= (and b!1041355 res!693975) b!1041356))

(assert (= (and b!1041356 res!693976) b!1041357))

(declare-fun m!961339 () Bool)

(assert (=> d!126047 m!961339))

(assert (=> b!1041355 m!961253))

(declare-fun m!961341 () Bool)

(assert (=> b!1041356 m!961341))

(declare-fun m!961343 () Bool)

(assert (=> b!1041357 m!961343))

(assert (=> start!91322 d!126047))

(declare-fun d!126049 () Bool)

(assert (=> d!126049 (= (array_inv!24413 (_keys!11587 thiss!1427)) (bvsge (size!32099 (_keys!11587 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041283 d!126049))

(declare-fun d!126051 () Bool)

(assert (=> d!126051 (= (array_inv!24414 (_values!6356 thiss!1427)) (bvsge (size!32100 (_values!6356 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041283 d!126051))

(declare-fun d!126053 () Bool)

(declare-fun e!589593 () Bool)

(assert (=> d!126053 e!589593))

(declare-fun res!693979 () Bool)

(assert (=> d!126053 (=> (not res!693979) (not e!589593))))

(assert (=> d!126053 (= res!693979 (and (bvsge (index!41352 lt!458845) #b00000000000000000000000000000000) (bvslt (index!41352 lt!458845) (size!32099 (_keys!11587 thiss!1427)))))))

(declare-fun lt!458892 () Unit!34009)

(declare-fun choose!25 (array!65611 (_ BitVec 32) (_ BitVec 32)) Unit!34009)

(assert (=> d!126053 (= lt!458892 (choose!25 (_keys!11587 thiss!1427) (index!41352 lt!458845) (mask!30374 thiss!1427)))))

(assert (=> d!126053 (validMask!0 (mask!30374 thiss!1427))))

(assert (=> d!126053 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11587 thiss!1427) (index!41352 lt!458845) (mask!30374 thiss!1427)) lt!458892)))

(declare-fun b!1041360 () Bool)

(assert (=> b!1041360 (= e!589593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65612 (store (arr!31567 (_keys!11587 thiss!1427)) (index!41352 lt!458845) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32099 (_keys!11587 thiss!1427))) (mask!30374 thiss!1427)))))

(assert (= (and d!126053 res!693979) b!1041360))

(declare-fun m!961345 () Bool)

(assert (=> d!126053 m!961345))

(assert (=> d!126053 m!961333))

(assert (=> b!1041360 m!961255))

(declare-fun m!961347 () Bool)

(assert (=> b!1041360 m!961347))

(assert (=> b!1041288 d!126053))

(declare-fun b!1041369 () Bool)

(declare-fun e!589602 () Bool)

(declare-fun call!44094 () Bool)

(assert (=> b!1041369 (= e!589602 call!44094)))

(declare-fun b!1041370 () Bool)

(declare-fun e!589601 () Bool)

(assert (=> b!1041370 (= e!589601 call!44094)))

(declare-fun b!1041371 () Bool)

(assert (=> b!1041371 (= e!589602 e!589601)))

(declare-fun lt!458899 () (_ BitVec 64))

(assert (=> b!1041371 (= lt!458899 (select (arr!31567 lt!458847) #b00000000000000000000000000000000))))

(declare-fun lt!458901 () Unit!34009)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65611 (_ BitVec 64) (_ BitVec 32)) Unit!34009)

(assert (=> b!1041371 (= lt!458901 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458847 lt!458899 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1041371 (arrayContainsKey!0 lt!458847 lt!458899 #b00000000000000000000000000000000)))

(declare-fun lt!458900 () Unit!34009)

(assert (=> b!1041371 (= lt!458900 lt!458901)))

(declare-fun res!693984 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65611 (_ BitVec 32)) SeekEntryResult!9745)

(assert (=> b!1041371 (= res!693984 (= (seekEntryOrOpen!0 (select (arr!31567 lt!458847) #b00000000000000000000000000000000) lt!458847 (mask!30374 thiss!1427)) (Found!9745 #b00000000000000000000000000000000)))))

(assert (=> b!1041371 (=> (not res!693984) (not e!589601))))

(declare-fun b!1041372 () Bool)

(declare-fun e!589600 () Bool)

(assert (=> b!1041372 (= e!589600 e!589602)))

(declare-fun c!105841 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1041372 (= c!105841 (validKeyInArray!0 (select (arr!31567 lt!458847) #b00000000000000000000000000000000)))))

(declare-fun d!126055 () Bool)

(declare-fun res!693985 () Bool)

(assert (=> d!126055 (=> res!693985 e!589600)))

(assert (=> d!126055 (= res!693985 (bvsge #b00000000000000000000000000000000 (size!32099 lt!458847)))))

(assert (=> d!126055 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458847 (mask!30374 thiss!1427)) e!589600)))

(declare-fun bm!44091 () Bool)

(assert (=> bm!44091 (= call!44094 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458847 (mask!30374 thiss!1427)))))

(assert (= (and d!126055 (not res!693985)) b!1041372))

(assert (= (and b!1041372 c!105841) b!1041371))

(assert (= (and b!1041372 (not c!105841)) b!1041369))

(assert (= (and b!1041371 res!693984) b!1041370))

(assert (= (or b!1041370 b!1041369) bm!44091))

(declare-fun m!961349 () Bool)

(assert (=> b!1041371 m!961349))

(declare-fun m!961351 () Bool)

(assert (=> b!1041371 m!961351))

(declare-fun m!961353 () Bool)

(assert (=> b!1041371 m!961353))

(assert (=> b!1041371 m!961349))

(declare-fun m!961355 () Bool)

(assert (=> b!1041371 m!961355))

(assert (=> b!1041372 m!961349))

(assert (=> b!1041372 m!961349))

(declare-fun m!961357 () Bool)

(assert (=> b!1041372 m!961357))

(declare-fun m!961359 () Bool)

(assert (=> bm!44091 m!961359))

(assert (=> b!1041288 d!126055))

(declare-fun b!1041381 () Bool)

(declare-fun res!693996 () Bool)

(declare-fun e!589607 () Bool)

(assert (=> b!1041381 (=> (not res!693996) (not e!589607))))

(assert (=> b!1041381 (= res!693996 (validKeyInArray!0 (select (arr!31567 (_keys!11587 thiss!1427)) (index!41352 lt!458845))))))

(declare-fun b!1041383 () Bool)

(assert (=> b!1041383 (= e!589607 (bvslt (size!32099 (_keys!11587 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1041384 () Bool)

(declare-fun e!589608 () Bool)

(assert (=> b!1041384 (= e!589608 (= (arrayCountValidKeys!0 (array!65612 (store (arr!31567 (_keys!11587 thiss!1427)) (index!41352 lt!458845) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32099 (_keys!11587 thiss!1427))) #b00000000000000000000000000000000 (size!32099 (_keys!11587 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11587 thiss!1427) #b00000000000000000000000000000000 (size!32099 (_keys!11587 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!126057 () Bool)

(assert (=> d!126057 e!589608))

(declare-fun res!693994 () Bool)

(assert (=> d!126057 (=> (not res!693994) (not e!589608))))

(assert (=> d!126057 (= res!693994 (and (bvsge (index!41352 lt!458845) #b00000000000000000000000000000000) (bvslt (index!41352 lt!458845) (size!32099 (_keys!11587 thiss!1427)))))))

(declare-fun lt!458904 () Unit!34009)

(declare-fun choose!82 (array!65611 (_ BitVec 32) (_ BitVec 64)) Unit!34009)

(assert (=> d!126057 (= lt!458904 (choose!82 (_keys!11587 thiss!1427) (index!41352 lt!458845) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126057 e!589607))

(declare-fun res!693995 () Bool)

(assert (=> d!126057 (=> (not res!693995) (not e!589607))))

(assert (=> d!126057 (= res!693995 (and (bvsge (index!41352 lt!458845) #b00000000000000000000000000000000) (bvslt (index!41352 lt!458845) (size!32099 (_keys!11587 thiss!1427)))))))

(assert (=> d!126057 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11587 thiss!1427) (index!41352 lt!458845) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458904)))

(declare-fun b!1041382 () Bool)

(declare-fun res!693997 () Bool)

(assert (=> b!1041382 (=> (not res!693997) (not e!589607))))

(assert (=> b!1041382 (= res!693997 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!126057 res!693995) b!1041381))

(assert (= (and b!1041381 res!693996) b!1041382))

(assert (= (and b!1041382 res!693997) b!1041383))

(assert (= (and d!126057 res!693994) b!1041384))

(declare-fun m!961361 () Bool)

(assert (=> b!1041381 m!961361))

(assert (=> b!1041381 m!961361))

(declare-fun m!961363 () Bool)

(assert (=> b!1041381 m!961363))

(assert (=> b!1041384 m!961255))

(declare-fun m!961365 () Bool)

(assert (=> b!1041384 m!961365))

(assert (=> b!1041384 m!961253))

(declare-fun m!961367 () Bool)

(assert (=> d!126057 m!961367))

(declare-fun m!961369 () Bool)

(assert (=> b!1041382 m!961369))

(assert (=> b!1041288 d!126057))

(declare-fun b!1041395 () Bool)

(declare-fun e!589619 () Bool)

(declare-fun e!589618 () Bool)

(assert (=> b!1041395 (= e!589619 e!589618)))

(declare-fun c!105844 () Bool)

(assert (=> b!1041395 (= c!105844 (validKeyInArray!0 (select (arr!31567 lt!458847) #b00000000000000000000000000000000)))))

(declare-fun d!126059 () Bool)

(declare-fun res!694006 () Bool)

(declare-fun e!589620 () Bool)

(assert (=> d!126059 (=> res!694006 e!589620)))

(assert (=> d!126059 (= res!694006 (bvsge #b00000000000000000000000000000000 (size!32099 lt!458847)))))

(assert (=> d!126059 (= (arrayNoDuplicates!0 lt!458847 #b00000000000000000000000000000000 Nil!21938) e!589620)))

(declare-fun bm!44094 () Bool)

(declare-fun call!44097 () Bool)

(assert (=> bm!44094 (= call!44097 (arrayNoDuplicates!0 lt!458847 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105844 (Cons!21937 (select (arr!31567 lt!458847) #b00000000000000000000000000000000) Nil!21938) Nil!21938)))))

(declare-fun b!1041396 () Bool)

(assert (=> b!1041396 (= e!589618 call!44097)))

(declare-fun b!1041397 () Bool)

(assert (=> b!1041397 (= e!589618 call!44097)))

(declare-fun b!1041398 () Bool)

(declare-fun e!589617 () Bool)

(declare-fun contains!6073 (List!21941 (_ BitVec 64)) Bool)

(assert (=> b!1041398 (= e!589617 (contains!6073 Nil!21938 (select (arr!31567 lt!458847) #b00000000000000000000000000000000)))))

(declare-fun b!1041399 () Bool)

(assert (=> b!1041399 (= e!589620 e!589619)))

(declare-fun res!694005 () Bool)

(assert (=> b!1041399 (=> (not res!694005) (not e!589619))))

(assert (=> b!1041399 (= res!694005 (not e!589617))))

(declare-fun res!694004 () Bool)

(assert (=> b!1041399 (=> (not res!694004) (not e!589617))))

(assert (=> b!1041399 (= res!694004 (validKeyInArray!0 (select (arr!31567 lt!458847) #b00000000000000000000000000000000)))))

(assert (= (and d!126059 (not res!694006)) b!1041399))

(assert (= (and b!1041399 res!694004) b!1041398))

(assert (= (and b!1041399 res!694005) b!1041395))

(assert (= (and b!1041395 c!105844) b!1041397))

(assert (= (and b!1041395 (not c!105844)) b!1041396))

(assert (= (or b!1041397 b!1041396) bm!44094))

(assert (=> b!1041395 m!961349))

(assert (=> b!1041395 m!961349))

(assert (=> b!1041395 m!961357))

(assert (=> bm!44094 m!961349))

(declare-fun m!961371 () Bool)

(assert (=> bm!44094 m!961371))

(assert (=> b!1041398 m!961349))

(assert (=> b!1041398 m!961349))

(declare-fun m!961373 () Bool)

(assert (=> b!1041398 m!961373))

(assert (=> b!1041399 m!961349))

(assert (=> b!1041399 m!961349))

(assert (=> b!1041399 m!961357))

(assert (=> b!1041288 d!126059))

(declare-fun b!1041408 () Bool)

(declare-fun e!589625 () (_ BitVec 32))

(declare-fun call!44100 () (_ BitVec 32))

(assert (=> b!1041408 (= e!589625 call!44100)))

(declare-fun b!1041409 () Bool)

(declare-fun e!589626 () (_ BitVec 32))

(assert (=> b!1041409 (= e!589626 #b00000000000000000000000000000000)))

(declare-fun b!1041410 () Bool)

(assert (=> b!1041410 (= e!589626 e!589625)))

(declare-fun c!105849 () Bool)

(assert (=> b!1041410 (= c!105849 (validKeyInArray!0 (select (arr!31567 lt!458847) #b00000000000000000000000000000000)))))

(declare-fun b!1041411 () Bool)

(assert (=> b!1041411 (= e!589625 (bvadd #b00000000000000000000000000000001 call!44100))))

(declare-fun d!126061 () Bool)

(declare-fun lt!458907 () (_ BitVec 32))

(assert (=> d!126061 (and (bvsge lt!458907 #b00000000000000000000000000000000) (bvsle lt!458907 (bvsub (size!32099 lt!458847) #b00000000000000000000000000000000)))))

(assert (=> d!126061 (= lt!458907 e!589626)))

(declare-fun c!105850 () Bool)

(assert (=> d!126061 (= c!105850 (bvsge #b00000000000000000000000000000000 (size!32099 (_keys!11587 thiss!1427))))))

(assert (=> d!126061 (and (bvsle #b00000000000000000000000000000000 (size!32099 (_keys!11587 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32099 (_keys!11587 thiss!1427)) (size!32099 lt!458847)))))

(assert (=> d!126061 (= (arrayCountValidKeys!0 lt!458847 #b00000000000000000000000000000000 (size!32099 (_keys!11587 thiss!1427))) lt!458907)))

(declare-fun bm!44097 () Bool)

(assert (=> bm!44097 (= call!44100 (arrayCountValidKeys!0 lt!458847 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32099 (_keys!11587 thiss!1427))))))

(assert (= (and d!126061 c!105850) b!1041409))

(assert (= (and d!126061 (not c!105850)) b!1041410))

(assert (= (and b!1041410 c!105849) b!1041411))

(assert (= (and b!1041410 (not c!105849)) b!1041408))

(assert (= (or b!1041411 b!1041408) bm!44097))

(assert (=> b!1041410 m!961349))

(assert (=> b!1041410 m!961349))

(assert (=> b!1041410 m!961357))

(declare-fun m!961375 () Bool)

(assert (=> bm!44097 m!961375))

(assert (=> b!1041288 d!126061))

(declare-fun b!1041412 () Bool)

(declare-fun e!589627 () (_ BitVec 32))

(declare-fun call!44101 () (_ BitVec 32))

(assert (=> b!1041412 (= e!589627 call!44101)))

(declare-fun b!1041413 () Bool)

(declare-fun e!589628 () (_ BitVec 32))

(assert (=> b!1041413 (= e!589628 #b00000000000000000000000000000000)))

(declare-fun b!1041414 () Bool)

(assert (=> b!1041414 (= e!589628 e!589627)))

(declare-fun c!105851 () Bool)

(assert (=> b!1041414 (= c!105851 (validKeyInArray!0 (select (arr!31567 (_keys!11587 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1041415 () Bool)

(assert (=> b!1041415 (= e!589627 (bvadd #b00000000000000000000000000000001 call!44101))))

(declare-fun d!126063 () Bool)

(declare-fun lt!458908 () (_ BitVec 32))

(assert (=> d!126063 (and (bvsge lt!458908 #b00000000000000000000000000000000) (bvsle lt!458908 (bvsub (size!32099 (_keys!11587 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126063 (= lt!458908 e!589628)))

(declare-fun c!105852 () Bool)

(assert (=> d!126063 (= c!105852 (bvsge #b00000000000000000000000000000000 (size!32099 (_keys!11587 thiss!1427))))))

(assert (=> d!126063 (and (bvsle #b00000000000000000000000000000000 (size!32099 (_keys!11587 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32099 (_keys!11587 thiss!1427)) (size!32099 (_keys!11587 thiss!1427))))))

(assert (=> d!126063 (= (arrayCountValidKeys!0 (_keys!11587 thiss!1427) #b00000000000000000000000000000000 (size!32099 (_keys!11587 thiss!1427))) lt!458908)))

(declare-fun bm!44098 () Bool)

(assert (=> bm!44098 (= call!44101 (arrayCountValidKeys!0 (_keys!11587 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32099 (_keys!11587 thiss!1427))))))

(assert (= (and d!126063 c!105852) b!1041413))

(assert (= (and d!126063 (not c!105852)) b!1041414))

(assert (= (and b!1041414 c!105851) b!1041415))

(assert (= (and b!1041414 (not c!105851)) b!1041412))

(assert (= (or b!1041415 b!1041412) bm!44098))

(declare-fun m!961377 () Bool)

(assert (=> b!1041414 m!961377))

(assert (=> b!1041414 m!961377))

(declare-fun m!961379 () Bool)

(assert (=> b!1041414 m!961379))

(declare-fun m!961381 () Bool)

(assert (=> bm!44098 m!961381))

(assert (=> b!1041288 d!126063))

(declare-fun d!126065 () Bool)

(declare-fun e!589631 () Bool)

(assert (=> d!126065 e!589631))

(declare-fun res!694009 () Bool)

(assert (=> d!126065 (=> (not res!694009) (not e!589631))))

(assert (=> d!126065 (= res!694009 (and (bvsge (index!41352 lt!458845) #b00000000000000000000000000000000) (bvslt (index!41352 lt!458845) (size!32099 (_keys!11587 thiss!1427)))))))

(declare-fun lt!458911 () Unit!34009)

(declare-fun choose!53 (array!65611 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21941) Unit!34009)

(assert (=> d!126065 (= lt!458911 (choose!53 (_keys!11587 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41352 lt!458845) #b00000000000000000000000000000000 Nil!21938))))

(assert (=> d!126065 (bvslt (size!32099 (_keys!11587 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126065 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11587 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41352 lt!458845) #b00000000000000000000000000000000 Nil!21938) lt!458911)))

(declare-fun b!1041418 () Bool)

(assert (=> b!1041418 (= e!589631 (arrayNoDuplicates!0 (array!65612 (store (arr!31567 (_keys!11587 thiss!1427)) (index!41352 lt!458845) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32099 (_keys!11587 thiss!1427))) #b00000000000000000000000000000000 Nil!21938))))

(assert (= (and d!126065 res!694009) b!1041418))

(declare-fun m!961383 () Bool)

(assert (=> d!126065 m!961383))

(assert (=> b!1041418 m!961255))

(declare-fun m!961385 () Bool)

(assert (=> b!1041418 m!961385))

(assert (=> b!1041288 d!126065))

(declare-fun b!1041425 () Bool)

(declare-fun e!589637 () Bool)

(assert (=> b!1041425 (= e!589637 tp_is_empty!24715)))

(declare-fun mapNonEmpty!38653 () Bool)

(declare-fun mapRes!38653 () Bool)

(declare-fun tp!74189 () Bool)

(assert (=> mapNonEmpty!38653 (= mapRes!38653 (and tp!74189 e!589637))))

(declare-fun mapRest!38653 () (Array (_ BitVec 32) ValueCell!11654))

(declare-fun mapKey!38653 () (_ BitVec 32))

(declare-fun mapValue!38653 () ValueCell!11654)

(assert (=> mapNonEmpty!38653 (= mapRest!38644 (store mapRest!38653 mapKey!38653 mapValue!38653))))

(declare-fun condMapEmpty!38653 () Bool)

(declare-fun mapDefault!38653 () ValueCell!11654)

(assert (=> mapNonEmpty!38644 (= condMapEmpty!38653 (= mapRest!38644 ((as const (Array (_ BitVec 32) ValueCell!11654)) mapDefault!38653)))))

(declare-fun e!589636 () Bool)

(assert (=> mapNonEmpty!38644 (= tp!74174 (and e!589636 mapRes!38653))))

(declare-fun b!1041426 () Bool)

(assert (=> b!1041426 (= e!589636 tp_is_empty!24715)))

(declare-fun mapIsEmpty!38653 () Bool)

(assert (=> mapIsEmpty!38653 mapRes!38653))

(assert (= (and mapNonEmpty!38644 condMapEmpty!38653) mapIsEmpty!38653))

(assert (= (and mapNonEmpty!38644 (not condMapEmpty!38653)) mapNonEmpty!38653))

(assert (= (and mapNonEmpty!38653 ((_ is ValueCellFull!11654) mapValue!38653)) b!1041425))

(assert (= (and mapNonEmpty!38644 ((_ is ValueCellFull!11654) mapDefault!38653)) b!1041426))

(declare-fun m!961387 () Bool)

(assert (=> mapNonEmpty!38653 m!961387))

(check-sat (not b!1041360) (not b!1041356) (not d!126065) (not b!1041357) (not b!1041418) (not b!1041355) (not b!1041381) (not b_next!20995) (not mapNonEmpty!38653) (not d!126053) (not d!126045) (not d!126047) (not bm!44098) (not b!1041395) b_and!33537 (not bm!44094) (not b!1041398) (not b!1041410) (not b!1041348) (not b!1041414) (not d!126057) (not b!1041382) (not bm!44097) (not b!1041384) (not b!1041399) (not bm!44091) (not b!1041371) tp_is_empty!24715 (not b!1041372))
(check-sat b_and!33537 (not b_next!20995))
