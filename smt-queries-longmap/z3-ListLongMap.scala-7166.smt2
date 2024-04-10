; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91430 () Bool)

(assert start!91430)

(declare-fun b!1041960 () Bool)

(declare-fun b_free!21051 () Bool)

(declare-fun b_next!21051 () Bool)

(assert (=> b!1041960 (= b_free!21051 (not b_next!21051))))

(declare-fun tp!74371 () Bool)

(declare-fun b_and!33583 () Bool)

(assert (=> b!1041960 (= tp!74371 b_and!33583)))

(declare-fun b!1041958 () Bool)

(declare-fun e!590162 () Bool)

(declare-fun e!590166 () Bool)

(assert (=> b!1041958 (= e!590162 e!590166)))

(declare-fun res!694366 () Bool)

(assert (=> b!1041958 (=> (not res!694366) (not e!590166))))

(declare-datatypes ((SeekEntryResult!9812 0))(
  ( (MissingZero!9812 (index!41619 (_ BitVec 32))) (Found!9812 (index!41620 (_ BitVec 32))) (Intermediate!9812 (undefined!10624 Bool) (index!41621 (_ BitVec 32)) (x!93023 (_ BitVec 32))) (Undefined!9812) (MissingVacant!9812 (index!41622 (_ BitVec 32))) )
))
(declare-fun lt!459258 () SeekEntryResult!9812)

(get-info :version)

(assert (=> b!1041958 (= res!694366 ((_ is Found!9812) lt!459258))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37901 0))(
  ( (V!37902 (val!12436 Int)) )
))
(declare-datatypes ((ValueCell!11682 0))(
  ( (ValueCellFull!11682 (v!15026 V!37901)) (EmptyCell!11682) )
))
(declare-datatypes ((array!65692 0))(
  ( (array!65693 (arr!31605 (Array (_ BitVec 32) (_ BitVec 64))) (size!32139 (_ BitVec 32))) )
))
(declare-datatypes ((array!65694 0))(
  ( (array!65695 (arr!31606 (Array (_ BitVec 32) ValueCell!11682)) (size!32140 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5958 0))(
  ( (LongMapFixedSize!5959 (defaultEntry!6361 Int) (mask!30407 (_ BitVec 32)) (extraKeys!6089 (_ BitVec 32)) (zeroValue!6195 V!37901) (minValue!6195 V!37901) (_size!3034 (_ BitVec 32)) (_keys!11604 array!65692) (_values!6384 array!65694) (_vacant!3034 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5958)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65692 (_ BitVec 32)) SeekEntryResult!9812)

(assert (=> b!1041958 (= lt!459258 (seekEntry!0 key!909 (_keys!11604 thiss!1427) (mask!30407 thiss!1427)))))

(declare-fun b!1041959 () Bool)

(declare-fun e!590168 () Bool)

(assert (=> b!1041959 (= e!590168 (or (not (= (size!32140 (_values!6384 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30407 thiss!1427)))) (not (= (size!32139 (_keys!11604 thiss!1427)) (size!32140 (_values!6384 thiss!1427)))) (bvslt (mask!30407 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6089 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6089 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun e!590169 () Bool)

(declare-fun tp_is_empty!24771 () Bool)

(declare-fun e!590164 () Bool)

(declare-fun array_inv!24419 (array!65692) Bool)

(declare-fun array_inv!24420 (array!65694) Bool)

(assert (=> b!1041960 (= e!590164 (and tp!74371 tp_is_empty!24771 (array_inv!24419 (_keys!11604 thiss!1427)) (array_inv!24420 (_values!6384 thiss!1427)) e!590169))))

(declare-fun b!1041961 () Bool)

(declare-fun e!590163 () Bool)

(assert (=> b!1041961 (= e!590163 tp_is_empty!24771)))

(declare-fun b!1041962 () Bool)

(assert (=> b!1041962 (= e!590166 (not e!590168))))

(declare-fun res!694365 () Bool)

(assert (=> b!1041962 (=> res!694365 e!590168)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1041962 (= res!694365 (not (validMask!0 (mask!30407 thiss!1427))))))

(declare-fun lt!459257 () array!65692)

(declare-fun arrayContainsKey!0 (array!65692 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1041962 (not (arrayContainsKey!0 lt!459257 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34039 0))(
  ( (Unit!34040) )
))
(declare-fun lt!459259 () Unit!34039)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65692 (_ BitVec 32) (_ BitVec 64)) Unit!34039)

(assert (=> b!1041962 (= lt!459259 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11604 thiss!1427) (index!41620 lt!459258) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65692 (_ BitVec 32)) Bool)

(assert (=> b!1041962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459257 (mask!30407 thiss!1427))))

(declare-fun lt!459256 () Unit!34039)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65692 (_ BitVec 32) (_ BitVec 32)) Unit!34039)

(assert (=> b!1041962 (= lt!459256 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11604 thiss!1427) (index!41620 lt!459258) (mask!30407 thiss!1427)))))

(declare-datatypes ((List!21971 0))(
  ( (Nil!21968) (Cons!21967 (h!23174 (_ BitVec 64)) (t!31185 List!21971)) )
))
(declare-fun arrayNoDuplicates!0 (array!65692 (_ BitVec 32) List!21971) Bool)

(assert (=> b!1041962 (arrayNoDuplicates!0 lt!459257 #b00000000000000000000000000000000 Nil!21968)))

(declare-fun lt!459255 () Unit!34039)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65692 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21971) Unit!34039)

(assert (=> b!1041962 (= lt!459255 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11604 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41620 lt!459258) #b00000000000000000000000000000000 Nil!21968))))

(declare-fun arrayCountValidKeys!0 (array!65692 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041962 (= (arrayCountValidKeys!0 lt!459257 #b00000000000000000000000000000000 (size!32139 (_keys!11604 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11604 thiss!1427) #b00000000000000000000000000000000 (size!32139 (_keys!11604 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1041962 (= lt!459257 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))))))

(declare-fun lt!459254 () Unit!34039)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65692 (_ BitVec 32) (_ BitVec 64)) Unit!34039)

(assert (=> b!1041962 (= lt!459254 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11604 thiss!1427) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38758 () Bool)

(declare-fun mapRes!38758 () Bool)

(assert (=> mapIsEmpty!38758 mapRes!38758))

(declare-fun b!1041963 () Bool)

(declare-fun e!590167 () Bool)

(assert (=> b!1041963 (= e!590167 tp_is_empty!24771)))

(declare-fun res!694363 () Bool)

(assert (=> start!91430 (=> (not res!694363) (not e!590162))))

(declare-fun valid!2238 (LongMapFixedSize!5958) Bool)

(assert (=> start!91430 (= res!694363 (valid!2238 thiss!1427))))

(assert (=> start!91430 e!590162))

(assert (=> start!91430 e!590164))

(assert (=> start!91430 true))

(declare-fun b!1041964 () Bool)

(assert (=> b!1041964 (= e!590169 (and e!590167 mapRes!38758))))

(declare-fun condMapEmpty!38758 () Bool)

(declare-fun mapDefault!38758 () ValueCell!11682)

(assert (=> b!1041964 (= condMapEmpty!38758 (= (arr!31606 (_values!6384 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11682)) mapDefault!38758)))))

(declare-fun b!1041965 () Bool)

(declare-fun res!694364 () Bool)

(assert (=> b!1041965 (=> (not res!694364) (not e!590162))))

(assert (=> b!1041965 (= res!694364 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!38758 () Bool)

(declare-fun tp!74372 () Bool)

(assert (=> mapNonEmpty!38758 (= mapRes!38758 (and tp!74372 e!590163))))

(declare-fun mapValue!38758 () ValueCell!11682)

(declare-fun mapKey!38758 () (_ BitVec 32))

(declare-fun mapRest!38758 () (Array (_ BitVec 32) ValueCell!11682))

(assert (=> mapNonEmpty!38758 (= (arr!31606 (_values!6384 thiss!1427)) (store mapRest!38758 mapKey!38758 mapValue!38758))))

(assert (= (and start!91430 res!694363) b!1041965))

(assert (= (and b!1041965 res!694364) b!1041958))

(assert (= (and b!1041958 res!694366) b!1041962))

(assert (= (and b!1041962 (not res!694365)) b!1041959))

(assert (= (and b!1041964 condMapEmpty!38758) mapIsEmpty!38758))

(assert (= (and b!1041964 (not condMapEmpty!38758)) mapNonEmpty!38758))

(assert (= (and mapNonEmpty!38758 ((_ is ValueCellFull!11682) mapValue!38758)) b!1041961))

(assert (= (and b!1041964 ((_ is ValueCellFull!11682) mapDefault!38758)) b!1041963))

(assert (= b!1041960 b!1041964))

(assert (= start!91430 b!1041960))

(declare-fun m!961333 () Bool)

(assert (=> b!1041960 m!961333))

(declare-fun m!961335 () Bool)

(assert (=> b!1041960 m!961335))

(declare-fun m!961337 () Bool)

(assert (=> start!91430 m!961337))

(declare-fun m!961339 () Bool)

(assert (=> b!1041958 m!961339))

(declare-fun m!961341 () Bool)

(assert (=> mapNonEmpty!38758 m!961341))

(declare-fun m!961343 () Bool)

(assert (=> b!1041962 m!961343))

(declare-fun m!961345 () Bool)

(assert (=> b!1041962 m!961345))

(declare-fun m!961347 () Bool)

(assert (=> b!1041962 m!961347))

(declare-fun m!961349 () Bool)

(assert (=> b!1041962 m!961349))

(declare-fun m!961351 () Bool)

(assert (=> b!1041962 m!961351))

(declare-fun m!961353 () Bool)

(assert (=> b!1041962 m!961353))

(declare-fun m!961355 () Bool)

(assert (=> b!1041962 m!961355))

(declare-fun m!961357 () Bool)

(assert (=> b!1041962 m!961357))

(declare-fun m!961359 () Bool)

(assert (=> b!1041962 m!961359))

(declare-fun m!961361 () Bool)

(assert (=> b!1041962 m!961361))

(declare-fun m!961363 () Bool)

(assert (=> b!1041962 m!961363))

(check-sat (not b_next!21051) b_and!33583 (not mapNonEmpty!38758) (not start!91430) (not b!1041960) tp_is_empty!24771 (not b!1041958) (not b!1041962))
(check-sat b_and!33583 (not b_next!21051))
(get-model)

(declare-fun d!126001 () Bool)

(assert (=> d!126001 (= (array_inv!24419 (_keys!11604 thiss!1427)) (bvsge (size!32139 (_keys!11604 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041960 d!126001))

(declare-fun d!126003 () Bool)

(assert (=> d!126003 (= (array_inv!24420 (_values!6384 thiss!1427)) (bvsge (size!32140 (_values!6384 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041960 d!126003))

(declare-fun b!1041998 () Bool)

(declare-fun e!590198 () (_ BitVec 32))

(declare-fun e!590199 () (_ BitVec 32))

(assert (=> b!1041998 (= e!590198 e!590199)))

(declare-fun c!105751 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1041998 (= c!105751 (validKeyInArray!0 (select (arr!31605 lt!459257) #b00000000000000000000000000000000)))))

(declare-fun bm!44144 () Bool)

(declare-fun call!44147 () (_ BitVec 32))

(assert (=> bm!44144 (= call!44147 (arrayCountValidKeys!0 lt!459257 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32139 (_keys!11604 thiss!1427))))))

(declare-fun b!1041999 () Bool)

(assert (=> b!1041999 (= e!590199 call!44147)))

(declare-fun b!1042000 () Bool)

(assert (=> b!1042000 (= e!590198 #b00000000000000000000000000000000)))

(declare-fun b!1042001 () Bool)

(assert (=> b!1042001 (= e!590199 (bvadd #b00000000000000000000000000000001 call!44147))))

(declare-fun d!126005 () Bool)

(declare-fun lt!459280 () (_ BitVec 32))

(assert (=> d!126005 (and (bvsge lt!459280 #b00000000000000000000000000000000) (bvsle lt!459280 (bvsub (size!32139 lt!459257) #b00000000000000000000000000000000)))))

(assert (=> d!126005 (= lt!459280 e!590198)))

(declare-fun c!105752 () Bool)

(assert (=> d!126005 (= c!105752 (bvsge #b00000000000000000000000000000000 (size!32139 (_keys!11604 thiss!1427))))))

(assert (=> d!126005 (and (bvsle #b00000000000000000000000000000000 (size!32139 (_keys!11604 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32139 (_keys!11604 thiss!1427)) (size!32139 lt!459257)))))

(assert (=> d!126005 (= (arrayCountValidKeys!0 lt!459257 #b00000000000000000000000000000000 (size!32139 (_keys!11604 thiss!1427))) lt!459280)))

(assert (= (and d!126005 c!105752) b!1042000))

(assert (= (and d!126005 (not c!105752)) b!1041998))

(assert (= (and b!1041998 c!105751) b!1042001))

(assert (= (and b!1041998 (not c!105751)) b!1041999))

(assert (= (or b!1042001 b!1041999) bm!44144))

(declare-fun m!961397 () Bool)

(assert (=> b!1041998 m!961397))

(assert (=> b!1041998 m!961397))

(declare-fun m!961399 () Bool)

(assert (=> b!1041998 m!961399))

(declare-fun m!961401 () Bool)

(assert (=> bm!44144 m!961401))

(assert (=> b!1041962 d!126005))

(declare-fun d!126007 () Bool)

(declare-fun e!590202 () Bool)

(assert (=> d!126007 e!590202))

(declare-fun res!694381 () Bool)

(assert (=> d!126007 (=> (not res!694381) (not e!590202))))

(assert (=> d!126007 (= res!694381 (bvslt (index!41620 lt!459258) (size!32139 (_keys!11604 thiss!1427))))))

(declare-fun lt!459283 () Unit!34039)

(declare-fun choose!121 (array!65692 (_ BitVec 32) (_ BitVec 64)) Unit!34039)

(assert (=> d!126007 (= lt!459283 (choose!121 (_keys!11604 thiss!1427) (index!41620 lt!459258) key!909))))

(assert (=> d!126007 (bvsge (index!41620 lt!459258) #b00000000000000000000000000000000)))

(assert (=> d!126007 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11604 thiss!1427) (index!41620 lt!459258) key!909) lt!459283)))

(declare-fun b!1042004 () Bool)

(assert (=> b!1042004 (= e!590202 (not (arrayContainsKey!0 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126007 res!694381) b!1042004))

(declare-fun m!961403 () Bool)

(assert (=> d!126007 m!961403))

(assert (=> b!1042004 m!961349))

(declare-fun m!961405 () Bool)

(assert (=> b!1042004 m!961405))

(assert (=> b!1041962 d!126007))

(declare-fun d!126009 () Bool)

(declare-fun e!590205 () Bool)

(assert (=> d!126009 e!590205))

(declare-fun res!694384 () Bool)

(assert (=> d!126009 (=> (not res!694384) (not e!590205))))

(assert (=> d!126009 (= res!694384 (and (bvsge (index!41620 lt!459258) #b00000000000000000000000000000000) (bvslt (index!41620 lt!459258) (size!32139 (_keys!11604 thiss!1427)))))))

(declare-fun lt!459286 () Unit!34039)

(declare-fun choose!25 (array!65692 (_ BitVec 32) (_ BitVec 32)) Unit!34039)

(assert (=> d!126009 (= lt!459286 (choose!25 (_keys!11604 thiss!1427) (index!41620 lt!459258) (mask!30407 thiss!1427)))))

(assert (=> d!126009 (validMask!0 (mask!30407 thiss!1427))))

(assert (=> d!126009 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11604 thiss!1427) (index!41620 lt!459258) (mask!30407 thiss!1427)) lt!459286)))

(declare-fun b!1042007 () Bool)

(assert (=> b!1042007 (= e!590205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))) (mask!30407 thiss!1427)))))

(assert (= (and d!126009 res!694384) b!1042007))

(declare-fun m!961407 () Bool)

(assert (=> d!126009 m!961407))

(assert (=> d!126009 m!961351))

(assert (=> b!1042007 m!961349))

(declare-fun m!961409 () Bool)

(assert (=> b!1042007 m!961409))

(assert (=> b!1041962 d!126009))

(declare-fun d!126011 () Bool)

(declare-fun res!694389 () Bool)

(declare-fun e!590210 () Bool)

(assert (=> d!126011 (=> res!694389 e!590210)))

(assert (=> d!126011 (= res!694389 (= (select (arr!31605 lt!459257) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126011 (= (arrayContainsKey!0 lt!459257 key!909 #b00000000000000000000000000000000) e!590210)))

(declare-fun b!1042012 () Bool)

(declare-fun e!590211 () Bool)

(assert (=> b!1042012 (= e!590210 e!590211)))

(declare-fun res!694390 () Bool)

(assert (=> b!1042012 (=> (not res!694390) (not e!590211))))

(assert (=> b!1042012 (= res!694390 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32139 lt!459257)))))

(declare-fun b!1042013 () Bool)

(assert (=> b!1042013 (= e!590211 (arrayContainsKey!0 lt!459257 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126011 (not res!694389)) b!1042012))

(assert (= (and b!1042012 res!694390) b!1042013))

(assert (=> d!126011 m!961397))

(declare-fun m!961411 () Bool)

(assert (=> b!1042013 m!961411))

(assert (=> b!1041962 d!126011))

(declare-fun d!126013 () Bool)

(declare-fun e!590214 () Bool)

(assert (=> d!126013 e!590214))

(declare-fun res!694393 () Bool)

(assert (=> d!126013 (=> (not res!694393) (not e!590214))))

(assert (=> d!126013 (= res!694393 (and (bvsge (index!41620 lt!459258) #b00000000000000000000000000000000) (bvslt (index!41620 lt!459258) (size!32139 (_keys!11604 thiss!1427)))))))

(declare-fun lt!459289 () Unit!34039)

(declare-fun choose!53 (array!65692 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21971) Unit!34039)

(assert (=> d!126013 (= lt!459289 (choose!53 (_keys!11604 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41620 lt!459258) #b00000000000000000000000000000000 Nil!21968))))

(assert (=> d!126013 (bvslt (size!32139 (_keys!11604 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126013 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11604 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41620 lt!459258) #b00000000000000000000000000000000 Nil!21968) lt!459289)))

(declare-fun b!1042016 () Bool)

(assert (=> b!1042016 (= e!590214 (arrayNoDuplicates!0 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))) #b00000000000000000000000000000000 Nil!21968))))

(assert (= (and d!126013 res!694393) b!1042016))

(declare-fun m!961413 () Bool)

(assert (=> d!126013 m!961413))

(assert (=> b!1042016 m!961349))

(declare-fun m!961415 () Bool)

(assert (=> b!1042016 m!961415))

(assert (=> b!1041962 d!126013))

(declare-fun b!1042026 () Bool)

(declare-fun res!694405 () Bool)

(declare-fun e!590220 () Bool)

(assert (=> b!1042026 (=> (not res!694405) (not e!590220))))

(assert (=> b!1042026 (= res!694405 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1042028 () Bool)

(declare-fun e!590219 () Bool)

(assert (=> b!1042028 (= e!590219 (= (arrayCountValidKeys!0 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))) #b00000000000000000000000000000000 (size!32139 (_keys!11604 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11604 thiss!1427) #b00000000000000000000000000000000 (size!32139 (_keys!11604 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!126015 () Bool)

(assert (=> d!126015 e!590219))

(declare-fun res!694404 () Bool)

(assert (=> d!126015 (=> (not res!694404) (not e!590219))))

(assert (=> d!126015 (= res!694404 (and (bvsge (index!41620 lt!459258) #b00000000000000000000000000000000) (bvslt (index!41620 lt!459258) (size!32139 (_keys!11604 thiss!1427)))))))

(declare-fun lt!459292 () Unit!34039)

(declare-fun choose!82 (array!65692 (_ BitVec 32) (_ BitVec 64)) Unit!34039)

(assert (=> d!126015 (= lt!459292 (choose!82 (_keys!11604 thiss!1427) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126015 e!590220))

(declare-fun res!694403 () Bool)

(assert (=> d!126015 (=> (not res!694403) (not e!590220))))

(assert (=> d!126015 (= res!694403 (and (bvsge (index!41620 lt!459258) #b00000000000000000000000000000000) (bvslt (index!41620 lt!459258) (size!32139 (_keys!11604 thiss!1427)))))))

(assert (=> d!126015 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11604 thiss!1427) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459292)))

(declare-fun b!1042027 () Bool)

(assert (=> b!1042027 (= e!590220 (bvslt (size!32139 (_keys!11604 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1042025 () Bool)

(declare-fun res!694402 () Bool)

(assert (=> b!1042025 (=> (not res!694402) (not e!590220))))

(assert (=> b!1042025 (= res!694402 (validKeyInArray!0 (select (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258))))))

(assert (= (and d!126015 res!694403) b!1042025))

(assert (= (and b!1042025 res!694402) b!1042026))

(assert (= (and b!1042026 res!694405) b!1042027))

(assert (= (and d!126015 res!694404) b!1042028))

(declare-fun m!961417 () Bool)

(assert (=> b!1042026 m!961417))

(assert (=> b!1042028 m!961349))

(declare-fun m!961419 () Bool)

(assert (=> b!1042028 m!961419))

(assert (=> b!1042028 m!961359))

(declare-fun m!961421 () Bool)

(assert (=> d!126015 m!961421))

(declare-fun m!961423 () Bool)

(assert (=> b!1042025 m!961423))

(assert (=> b!1042025 m!961423))

(declare-fun m!961425 () Bool)

(assert (=> b!1042025 m!961425))

(assert (=> b!1041962 d!126015))

(declare-fun d!126017 () Bool)

(assert (=> d!126017 (= (validMask!0 (mask!30407 thiss!1427)) (and (or (= (mask!30407 thiss!1427) #b00000000000000000000000000000111) (= (mask!30407 thiss!1427) #b00000000000000000000000000001111) (= (mask!30407 thiss!1427) #b00000000000000000000000000011111) (= (mask!30407 thiss!1427) #b00000000000000000000000000111111) (= (mask!30407 thiss!1427) #b00000000000000000000000001111111) (= (mask!30407 thiss!1427) #b00000000000000000000000011111111) (= (mask!30407 thiss!1427) #b00000000000000000000000111111111) (= (mask!30407 thiss!1427) #b00000000000000000000001111111111) (= (mask!30407 thiss!1427) #b00000000000000000000011111111111) (= (mask!30407 thiss!1427) #b00000000000000000000111111111111) (= (mask!30407 thiss!1427) #b00000000000000000001111111111111) (= (mask!30407 thiss!1427) #b00000000000000000011111111111111) (= (mask!30407 thiss!1427) #b00000000000000000111111111111111) (= (mask!30407 thiss!1427) #b00000000000000001111111111111111) (= (mask!30407 thiss!1427) #b00000000000000011111111111111111) (= (mask!30407 thiss!1427) #b00000000000000111111111111111111) (= (mask!30407 thiss!1427) #b00000000000001111111111111111111) (= (mask!30407 thiss!1427) #b00000000000011111111111111111111) (= (mask!30407 thiss!1427) #b00000000000111111111111111111111) (= (mask!30407 thiss!1427) #b00000000001111111111111111111111) (= (mask!30407 thiss!1427) #b00000000011111111111111111111111) (= (mask!30407 thiss!1427) #b00000000111111111111111111111111) (= (mask!30407 thiss!1427) #b00000001111111111111111111111111) (= (mask!30407 thiss!1427) #b00000011111111111111111111111111) (= (mask!30407 thiss!1427) #b00000111111111111111111111111111) (= (mask!30407 thiss!1427) #b00001111111111111111111111111111) (= (mask!30407 thiss!1427) #b00011111111111111111111111111111) (= (mask!30407 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30407 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1041962 d!126017))

(declare-fun b!1042037 () Bool)

(declare-fun e!590227 () Bool)

(declare-fun e!590228 () Bool)

(assert (=> b!1042037 (= e!590227 e!590228)))

(declare-fun lt!459300 () (_ BitVec 64))

(assert (=> b!1042037 (= lt!459300 (select (arr!31605 lt!459257) #b00000000000000000000000000000000))))

(declare-fun lt!459301 () Unit!34039)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65692 (_ BitVec 64) (_ BitVec 32)) Unit!34039)

(assert (=> b!1042037 (= lt!459301 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459257 lt!459300 #b00000000000000000000000000000000))))

(assert (=> b!1042037 (arrayContainsKey!0 lt!459257 lt!459300 #b00000000000000000000000000000000)))

(declare-fun lt!459299 () Unit!34039)

(assert (=> b!1042037 (= lt!459299 lt!459301)))

(declare-fun res!694410 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65692 (_ BitVec 32)) SeekEntryResult!9812)

(assert (=> b!1042037 (= res!694410 (= (seekEntryOrOpen!0 (select (arr!31605 lt!459257) #b00000000000000000000000000000000) lt!459257 (mask!30407 thiss!1427)) (Found!9812 #b00000000000000000000000000000000)))))

(assert (=> b!1042037 (=> (not res!694410) (not e!590228))))

(declare-fun b!1042038 () Bool)

(declare-fun e!590229 () Bool)

(assert (=> b!1042038 (= e!590229 e!590227)))

(declare-fun c!105755 () Bool)

(assert (=> b!1042038 (= c!105755 (validKeyInArray!0 (select (arr!31605 lt!459257) #b00000000000000000000000000000000)))))

(declare-fun d!126019 () Bool)

(declare-fun res!694411 () Bool)

(assert (=> d!126019 (=> res!694411 e!590229)))

(assert (=> d!126019 (= res!694411 (bvsge #b00000000000000000000000000000000 (size!32139 lt!459257)))))

(assert (=> d!126019 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459257 (mask!30407 thiss!1427)) e!590229)))

(declare-fun b!1042039 () Bool)

(declare-fun call!44150 () Bool)

(assert (=> b!1042039 (= e!590227 call!44150)))

(declare-fun b!1042040 () Bool)

(assert (=> b!1042040 (= e!590228 call!44150)))

(declare-fun bm!44147 () Bool)

(assert (=> bm!44147 (= call!44150 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459257 (mask!30407 thiss!1427)))))

(assert (= (and d!126019 (not res!694411)) b!1042038))

(assert (= (and b!1042038 c!105755) b!1042037))

(assert (= (and b!1042038 (not c!105755)) b!1042039))

(assert (= (and b!1042037 res!694410) b!1042040))

(assert (= (or b!1042040 b!1042039) bm!44147))

(assert (=> b!1042037 m!961397))

(declare-fun m!961427 () Bool)

(assert (=> b!1042037 m!961427))

(declare-fun m!961429 () Bool)

(assert (=> b!1042037 m!961429))

(assert (=> b!1042037 m!961397))

(declare-fun m!961431 () Bool)

(assert (=> b!1042037 m!961431))

(assert (=> b!1042038 m!961397))

(assert (=> b!1042038 m!961397))

(assert (=> b!1042038 m!961399))

(declare-fun m!961433 () Bool)

(assert (=> bm!44147 m!961433))

(assert (=> b!1041962 d!126019))

(declare-fun b!1042051 () Bool)

(declare-fun e!590240 () Bool)

(declare-fun call!44153 () Bool)

(assert (=> b!1042051 (= e!590240 call!44153)))

(declare-fun d!126021 () Bool)

(declare-fun res!694418 () Bool)

(declare-fun e!590241 () Bool)

(assert (=> d!126021 (=> res!694418 e!590241)))

(assert (=> d!126021 (= res!694418 (bvsge #b00000000000000000000000000000000 (size!32139 lt!459257)))))

(assert (=> d!126021 (= (arrayNoDuplicates!0 lt!459257 #b00000000000000000000000000000000 Nil!21968) e!590241)))

(declare-fun bm!44150 () Bool)

(declare-fun c!105758 () Bool)

(assert (=> bm!44150 (= call!44153 (arrayNoDuplicates!0 lt!459257 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105758 (Cons!21967 (select (arr!31605 lt!459257) #b00000000000000000000000000000000) Nil!21968) Nil!21968)))))

(declare-fun b!1042052 () Bool)

(declare-fun e!590239 () Bool)

(declare-fun contains!6056 (List!21971 (_ BitVec 64)) Bool)

(assert (=> b!1042052 (= e!590239 (contains!6056 Nil!21968 (select (arr!31605 lt!459257) #b00000000000000000000000000000000)))))

(declare-fun b!1042053 () Bool)

(declare-fun e!590238 () Bool)

(assert (=> b!1042053 (= e!590241 e!590238)))

(declare-fun res!694419 () Bool)

(assert (=> b!1042053 (=> (not res!694419) (not e!590238))))

(assert (=> b!1042053 (= res!694419 (not e!590239))))

(declare-fun res!694420 () Bool)

(assert (=> b!1042053 (=> (not res!694420) (not e!590239))))

(assert (=> b!1042053 (= res!694420 (validKeyInArray!0 (select (arr!31605 lt!459257) #b00000000000000000000000000000000)))))

(declare-fun b!1042054 () Bool)

(assert (=> b!1042054 (= e!590240 call!44153)))

(declare-fun b!1042055 () Bool)

(assert (=> b!1042055 (= e!590238 e!590240)))

(assert (=> b!1042055 (= c!105758 (validKeyInArray!0 (select (arr!31605 lt!459257) #b00000000000000000000000000000000)))))

(assert (= (and d!126021 (not res!694418)) b!1042053))

(assert (= (and b!1042053 res!694420) b!1042052))

(assert (= (and b!1042053 res!694419) b!1042055))

(assert (= (and b!1042055 c!105758) b!1042054))

(assert (= (and b!1042055 (not c!105758)) b!1042051))

(assert (= (or b!1042054 b!1042051) bm!44150))

(assert (=> bm!44150 m!961397))

(declare-fun m!961435 () Bool)

(assert (=> bm!44150 m!961435))

(assert (=> b!1042052 m!961397))

(assert (=> b!1042052 m!961397))

(declare-fun m!961437 () Bool)

(assert (=> b!1042052 m!961437))

(assert (=> b!1042053 m!961397))

(assert (=> b!1042053 m!961397))

(assert (=> b!1042053 m!961399))

(assert (=> b!1042055 m!961397))

(assert (=> b!1042055 m!961397))

(assert (=> b!1042055 m!961399))

(assert (=> b!1041962 d!126021))

(declare-fun b!1042056 () Bool)

(declare-fun e!590242 () (_ BitVec 32))

(declare-fun e!590243 () (_ BitVec 32))

(assert (=> b!1042056 (= e!590242 e!590243)))

(declare-fun c!105759 () Bool)

(assert (=> b!1042056 (= c!105759 (validKeyInArray!0 (select (arr!31605 (_keys!11604 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44151 () Bool)

(declare-fun call!44154 () (_ BitVec 32))

(assert (=> bm!44151 (= call!44154 (arrayCountValidKeys!0 (_keys!11604 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32139 (_keys!11604 thiss!1427))))))

(declare-fun b!1042057 () Bool)

(assert (=> b!1042057 (= e!590243 call!44154)))

(declare-fun b!1042058 () Bool)

(assert (=> b!1042058 (= e!590242 #b00000000000000000000000000000000)))

(declare-fun b!1042059 () Bool)

(assert (=> b!1042059 (= e!590243 (bvadd #b00000000000000000000000000000001 call!44154))))

(declare-fun d!126023 () Bool)

(declare-fun lt!459302 () (_ BitVec 32))

(assert (=> d!126023 (and (bvsge lt!459302 #b00000000000000000000000000000000) (bvsle lt!459302 (bvsub (size!32139 (_keys!11604 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126023 (= lt!459302 e!590242)))

(declare-fun c!105760 () Bool)

(assert (=> d!126023 (= c!105760 (bvsge #b00000000000000000000000000000000 (size!32139 (_keys!11604 thiss!1427))))))

(assert (=> d!126023 (and (bvsle #b00000000000000000000000000000000 (size!32139 (_keys!11604 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32139 (_keys!11604 thiss!1427)) (size!32139 (_keys!11604 thiss!1427))))))

(assert (=> d!126023 (= (arrayCountValidKeys!0 (_keys!11604 thiss!1427) #b00000000000000000000000000000000 (size!32139 (_keys!11604 thiss!1427))) lt!459302)))

(assert (= (and d!126023 c!105760) b!1042058))

(assert (= (and d!126023 (not c!105760)) b!1042056))

(assert (= (and b!1042056 c!105759) b!1042059))

(assert (= (and b!1042056 (not c!105759)) b!1042057))

(assert (= (or b!1042059 b!1042057) bm!44151))

(declare-fun m!961439 () Bool)

(assert (=> b!1042056 m!961439))

(assert (=> b!1042056 m!961439))

(declare-fun m!961441 () Bool)

(assert (=> b!1042056 m!961441))

(declare-fun m!961443 () Bool)

(assert (=> bm!44151 m!961443))

(assert (=> b!1041962 d!126023))

(declare-fun d!126025 () Bool)

(declare-fun res!694427 () Bool)

(declare-fun e!590246 () Bool)

(assert (=> d!126025 (=> (not res!694427) (not e!590246))))

(declare-fun simpleValid!440 (LongMapFixedSize!5958) Bool)

(assert (=> d!126025 (= res!694427 (simpleValid!440 thiss!1427))))

(assert (=> d!126025 (= (valid!2238 thiss!1427) e!590246)))

(declare-fun b!1042066 () Bool)

(declare-fun res!694428 () Bool)

(assert (=> b!1042066 (=> (not res!694428) (not e!590246))))

(assert (=> b!1042066 (= res!694428 (= (arrayCountValidKeys!0 (_keys!11604 thiss!1427) #b00000000000000000000000000000000 (size!32139 (_keys!11604 thiss!1427))) (_size!3034 thiss!1427)))))

(declare-fun b!1042067 () Bool)

(declare-fun res!694429 () Bool)

(assert (=> b!1042067 (=> (not res!694429) (not e!590246))))

(assert (=> b!1042067 (= res!694429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11604 thiss!1427) (mask!30407 thiss!1427)))))

(declare-fun b!1042068 () Bool)

(assert (=> b!1042068 (= e!590246 (arrayNoDuplicates!0 (_keys!11604 thiss!1427) #b00000000000000000000000000000000 Nil!21968))))

(assert (= (and d!126025 res!694427) b!1042066))

(assert (= (and b!1042066 res!694428) b!1042067))

(assert (= (and b!1042067 res!694429) b!1042068))

(declare-fun m!961445 () Bool)

(assert (=> d!126025 m!961445))

(assert (=> b!1042066 m!961359))

(declare-fun m!961447 () Bool)

(assert (=> b!1042067 m!961447))

(declare-fun m!961449 () Bool)

(assert (=> b!1042068 m!961449))

(assert (=> start!91430 d!126025))

(declare-fun b!1042081 () Bool)

(declare-fun c!105769 () Bool)

(declare-fun lt!459311 () (_ BitVec 64))

(assert (=> b!1042081 (= c!105769 (= lt!459311 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!590253 () SeekEntryResult!9812)

(declare-fun e!590255 () SeekEntryResult!9812)

(assert (=> b!1042081 (= e!590253 e!590255)))

(declare-fun b!1042082 () Bool)

(declare-fun lt!459314 () SeekEntryResult!9812)

(assert (=> b!1042082 (= e!590253 (Found!9812 (index!41621 lt!459314)))))

(declare-fun b!1042083 () Bool)

(declare-fun e!590254 () SeekEntryResult!9812)

(assert (=> b!1042083 (= e!590254 e!590253)))

(assert (=> b!1042083 (= lt!459311 (select (arr!31605 (_keys!11604 thiss!1427)) (index!41621 lt!459314)))))

(declare-fun c!105768 () Bool)

(assert (=> b!1042083 (= c!105768 (= lt!459311 key!909))))

(declare-fun b!1042084 () Bool)

(assert (=> b!1042084 (= e!590254 Undefined!9812)))

(declare-fun b!1042085 () Bool)

(declare-fun lt!459313 () SeekEntryResult!9812)

(assert (=> b!1042085 (= e!590255 (ite ((_ is MissingVacant!9812) lt!459313) (MissingZero!9812 (index!41622 lt!459313)) lt!459313))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65692 (_ BitVec 32)) SeekEntryResult!9812)

(assert (=> b!1042085 (= lt!459313 (seekKeyOrZeroReturnVacant!0 (x!93023 lt!459314) (index!41621 lt!459314) (index!41621 lt!459314) key!909 (_keys!11604 thiss!1427) (mask!30407 thiss!1427)))))

(declare-fun b!1042086 () Bool)

(assert (=> b!1042086 (= e!590255 (MissingZero!9812 (index!41621 lt!459314)))))

(declare-fun d!126027 () Bool)

(declare-fun lt!459312 () SeekEntryResult!9812)

(assert (=> d!126027 (and (or ((_ is MissingVacant!9812) lt!459312) (not ((_ is Found!9812) lt!459312)) (and (bvsge (index!41620 lt!459312) #b00000000000000000000000000000000) (bvslt (index!41620 lt!459312) (size!32139 (_keys!11604 thiss!1427))))) (not ((_ is MissingVacant!9812) lt!459312)) (or (not ((_ is Found!9812) lt!459312)) (= (select (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459312)) key!909)))))

(assert (=> d!126027 (= lt!459312 e!590254)))

(declare-fun c!105767 () Bool)

(assert (=> d!126027 (= c!105767 (and ((_ is Intermediate!9812) lt!459314) (undefined!10624 lt!459314)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65692 (_ BitVec 32)) SeekEntryResult!9812)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126027 (= lt!459314 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30407 thiss!1427)) key!909 (_keys!11604 thiss!1427) (mask!30407 thiss!1427)))))

(assert (=> d!126027 (validMask!0 (mask!30407 thiss!1427))))

(assert (=> d!126027 (= (seekEntry!0 key!909 (_keys!11604 thiss!1427) (mask!30407 thiss!1427)) lt!459312)))

(assert (= (and d!126027 c!105767) b!1042084))

(assert (= (and d!126027 (not c!105767)) b!1042083))

(assert (= (and b!1042083 c!105768) b!1042082))

(assert (= (and b!1042083 (not c!105768)) b!1042081))

(assert (= (and b!1042081 c!105769) b!1042086))

(assert (= (and b!1042081 (not c!105769)) b!1042085))

(declare-fun m!961451 () Bool)

(assert (=> b!1042083 m!961451))

(declare-fun m!961453 () Bool)

(assert (=> b!1042085 m!961453))

(declare-fun m!961455 () Bool)

(assert (=> d!126027 m!961455))

(declare-fun m!961457 () Bool)

(assert (=> d!126027 m!961457))

(assert (=> d!126027 m!961457))

(declare-fun m!961459 () Bool)

(assert (=> d!126027 m!961459))

(assert (=> d!126027 m!961351))

(assert (=> b!1041958 d!126027))

(declare-fun mapIsEmpty!38764 () Bool)

(declare-fun mapRes!38764 () Bool)

(assert (=> mapIsEmpty!38764 mapRes!38764))

(declare-fun b!1042093 () Bool)

(declare-fun e!590260 () Bool)

(assert (=> b!1042093 (= e!590260 tp_is_empty!24771)))

(declare-fun mapNonEmpty!38764 () Bool)

(declare-fun tp!74381 () Bool)

(assert (=> mapNonEmpty!38764 (= mapRes!38764 (and tp!74381 e!590260))))

(declare-fun mapRest!38764 () (Array (_ BitVec 32) ValueCell!11682))

(declare-fun mapValue!38764 () ValueCell!11682)

(declare-fun mapKey!38764 () (_ BitVec 32))

(assert (=> mapNonEmpty!38764 (= mapRest!38758 (store mapRest!38764 mapKey!38764 mapValue!38764))))

(declare-fun b!1042094 () Bool)

(declare-fun e!590261 () Bool)

(assert (=> b!1042094 (= e!590261 tp_is_empty!24771)))

(declare-fun condMapEmpty!38764 () Bool)

(declare-fun mapDefault!38764 () ValueCell!11682)

(assert (=> mapNonEmpty!38758 (= condMapEmpty!38764 (= mapRest!38758 ((as const (Array (_ BitVec 32) ValueCell!11682)) mapDefault!38764)))))

(assert (=> mapNonEmpty!38758 (= tp!74372 (and e!590261 mapRes!38764))))

(assert (= (and mapNonEmpty!38758 condMapEmpty!38764) mapIsEmpty!38764))

(assert (= (and mapNonEmpty!38758 (not condMapEmpty!38764)) mapNonEmpty!38764))

(assert (= (and mapNonEmpty!38764 ((_ is ValueCellFull!11682) mapValue!38764)) b!1042093))

(assert (= (and mapNonEmpty!38758 ((_ is ValueCellFull!11682) mapDefault!38764)) b!1042094))

(declare-fun m!961461 () Bool)

(assert (=> mapNonEmpty!38764 m!961461))

(check-sat (not bm!44151) (not b!1042038) (not b!1042026) (not b!1042068) (not b!1042066) (not b!1042016) (not b!1042037) (not b!1042013) (not d!126015) (not b!1042055) (not bm!44150) (not b!1042025) (not b_next!21051) (not b!1042028) (not b!1042067) (not d!126007) b_and!33583 (not b!1042085) (not b!1042056) tp_is_empty!24771 (not bm!44147) (not d!126013) (not d!126009) (not b!1042004) (not d!126025) (not b!1042053) (not d!126027) (not bm!44144) (not b!1042052) (not b!1042007) (not mapNonEmpty!38764) (not b!1041998))
(check-sat b_and!33583 (not b_next!21051))
(get-model)

(declare-fun b!1042095 () Bool)

(declare-fun e!590262 () Bool)

(declare-fun e!590263 () Bool)

(assert (=> b!1042095 (= e!590262 e!590263)))

(declare-fun lt!459316 () (_ BitVec 64))

(assert (=> b!1042095 (= lt!459316 (select (arr!31605 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!459317 () Unit!34039)

(assert (=> b!1042095 (= lt!459317 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))) lt!459316 #b00000000000000000000000000000000))))

(assert (=> b!1042095 (arrayContainsKey!0 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))) lt!459316 #b00000000000000000000000000000000)))

(declare-fun lt!459315 () Unit!34039)

(assert (=> b!1042095 (= lt!459315 lt!459317)))

(declare-fun res!694430 () Bool)

(assert (=> b!1042095 (= res!694430 (= (seekEntryOrOpen!0 (select (arr!31605 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427)))) #b00000000000000000000000000000000) (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))) (mask!30407 thiss!1427)) (Found!9812 #b00000000000000000000000000000000)))))

(assert (=> b!1042095 (=> (not res!694430) (not e!590263))))

(declare-fun b!1042096 () Bool)

(declare-fun e!590264 () Bool)

(assert (=> b!1042096 (= e!590264 e!590262)))

(declare-fun c!105770 () Bool)

(assert (=> b!1042096 (= c!105770 (validKeyInArray!0 (select (arr!31605 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!126029 () Bool)

(declare-fun res!694431 () Bool)

(assert (=> d!126029 (=> res!694431 e!590264)))

(assert (=> d!126029 (= res!694431 (bvsge #b00000000000000000000000000000000 (size!32139 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))))))))

(assert (=> d!126029 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))) (mask!30407 thiss!1427)) e!590264)))

(declare-fun b!1042097 () Bool)

(declare-fun call!44155 () Bool)

(assert (=> b!1042097 (= e!590262 call!44155)))

(declare-fun b!1042098 () Bool)

(assert (=> b!1042098 (= e!590263 call!44155)))

(declare-fun bm!44152 () Bool)

(assert (=> bm!44152 (= call!44155 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))) (mask!30407 thiss!1427)))))

(assert (= (and d!126029 (not res!694431)) b!1042096))

(assert (= (and b!1042096 c!105770) b!1042095))

(assert (= (and b!1042096 (not c!105770)) b!1042097))

(assert (= (and b!1042095 res!694430) b!1042098))

(assert (= (or b!1042098 b!1042097) bm!44152))

(declare-fun m!961463 () Bool)

(assert (=> b!1042095 m!961463))

(declare-fun m!961465 () Bool)

(assert (=> b!1042095 m!961465))

(declare-fun m!961467 () Bool)

(assert (=> b!1042095 m!961467))

(assert (=> b!1042095 m!961463))

(declare-fun m!961469 () Bool)

(assert (=> b!1042095 m!961469))

(assert (=> b!1042096 m!961463))

(assert (=> b!1042096 m!961463))

(declare-fun m!961471 () Bool)

(assert (=> b!1042096 m!961471))

(declare-fun m!961473 () Bool)

(assert (=> bm!44152 m!961473))

(assert (=> b!1042007 d!126029))

(declare-fun b!1042099 () Bool)

(declare-fun e!590265 () (_ BitVec 32))

(declare-fun e!590266 () (_ BitVec 32))

(assert (=> b!1042099 (= e!590265 e!590266)))

(declare-fun c!105771 () Bool)

(assert (=> b!1042099 (= c!105771 (validKeyInArray!0 (select (arr!31605 (_keys!11604 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!44153 () Bool)

(declare-fun call!44156 () (_ BitVec 32))

(assert (=> bm!44153 (= call!44156 (arrayCountValidKeys!0 (_keys!11604 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32139 (_keys!11604 thiss!1427))))))

(declare-fun b!1042100 () Bool)

(assert (=> b!1042100 (= e!590266 call!44156)))

(declare-fun b!1042101 () Bool)

(assert (=> b!1042101 (= e!590265 #b00000000000000000000000000000000)))

(declare-fun b!1042102 () Bool)

(assert (=> b!1042102 (= e!590266 (bvadd #b00000000000000000000000000000001 call!44156))))

(declare-fun d!126031 () Bool)

(declare-fun lt!459318 () (_ BitVec 32))

(assert (=> d!126031 (and (bvsge lt!459318 #b00000000000000000000000000000000) (bvsle lt!459318 (bvsub (size!32139 (_keys!11604 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!126031 (= lt!459318 e!590265)))

(declare-fun c!105772 () Bool)

(assert (=> d!126031 (= c!105772 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32139 (_keys!11604 thiss!1427))))))

(assert (=> d!126031 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32139 (_keys!11604 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32139 (_keys!11604 thiss!1427)) (size!32139 (_keys!11604 thiss!1427))))))

(assert (=> d!126031 (= (arrayCountValidKeys!0 (_keys!11604 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32139 (_keys!11604 thiss!1427))) lt!459318)))

(assert (= (and d!126031 c!105772) b!1042101))

(assert (= (and d!126031 (not c!105772)) b!1042099))

(assert (= (and b!1042099 c!105771) b!1042102))

(assert (= (and b!1042099 (not c!105771)) b!1042100))

(assert (= (or b!1042102 b!1042100) bm!44153))

(declare-fun m!961475 () Bool)

(assert (=> b!1042099 m!961475))

(assert (=> b!1042099 m!961475))

(declare-fun m!961477 () Bool)

(assert (=> b!1042099 m!961477))

(declare-fun m!961479 () Bool)

(assert (=> bm!44153 m!961479))

(assert (=> bm!44151 d!126031))

(declare-fun d!126033 () Bool)

(assert (=> d!126033 (= (validKeyInArray!0 (select (arr!31605 (_keys!11604 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31605 (_keys!11604 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31605 (_keys!11604 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1042056 d!126033))

(declare-fun d!126035 () Bool)

(declare-fun res!694432 () Bool)

(declare-fun e!590267 () Bool)

(assert (=> d!126035 (=> res!694432 e!590267)))

(assert (=> d!126035 (= res!694432 (= (select (arr!31605 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126035 (= (arrayContainsKey!0 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))) key!909 #b00000000000000000000000000000000) e!590267)))

(declare-fun b!1042103 () Bool)

(declare-fun e!590268 () Bool)

(assert (=> b!1042103 (= e!590267 e!590268)))

(declare-fun res!694433 () Bool)

(assert (=> b!1042103 (=> (not res!694433) (not e!590268))))

(assert (=> b!1042103 (= res!694433 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32139 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))))))))

(declare-fun b!1042104 () Bool)

(assert (=> b!1042104 (= e!590268 (arrayContainsKey!0 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126035 (not res!694432)) b!1042103))

(assert (= (and b!1042103 res!694433) b!1042104))

(assert (=> d!126035 m!961463))

(declare-fun m!961481 () Bool)

(assert (=> b!1042104 m!961481))

(assert (=> b!1042004 d!126035))

(declare-fun b!1042105 () Bool)

(declare-fun e!590271 () Bool)

(declare-fun call!44157 () Bool)

(assert (=> b!1042105 (= e!590271 call!44157)))

(declare-fun d!126037 () Bool)

(declare-fun res!694434 () Bool)

(declare-fun e!590272 () Bool)

(assert (=> d!126037 (=> res!694434 e!590272)))

(assert (=> d!126037 (= res!694434 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32139 lt!459257)))))

(assert (=> d!126037 (= (arrayNoDuplicates!0 lt!459257 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105758 (Cons!21967 (select (arr!31605 lt!459257) #b00000000000000000000000000000000) Nil!21968) Nil!21968)) e!590272)))

(declare-fun c!105773 () Bool)

(declare-fun bm!44154 () Bool)

(assert (=> bm!44154 (= call!44157 (arrayNoDuplicates!0 lt!459257 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!105773 (Cons!21967 (select (arr!31605 lt!459257) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!105758 (Cons!21967 (select (arr!31605 lt!459257) #b00000000000000000000000000000000) Nil!21968) Nil!21968)) (ite c!105758 (Cons!21967 (select (arr!31605 lt!459257) #b00000000000000000000000000000000) Nil!21968) Nil!21968))))))

(declare-fun b!1042106 () Bool)

(declare-fun e!590270 () Bool)

(assert (=> b!1042106 (= e!590270 (contains!6056 (ite c!105758 (Cons!21967 (select (arr!31605 lt!459257) #b00000000000000000000000000000000) Nil!21968) Nil!21968) (select (arr!31605 lt!459257) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1042107 () Bool)

(declare-fun e!590269 () Bool)

(assert (=> b!1042107 (= e!590272 e!590269)))

(declare-fun res!694435 () Bool)

(assert (=> b!1042107 (=> (not res!694435) (not e!590269))))

(assert (=> b!1042107 (= res!694435 (not e!590270))))

(declare-fun res!694436 () Bool)

(assert (=> b!1042107 (=> (not res!694436) (not e!590270))))

(assert (=> b!1042107 (= res!694436 (validKeyInArray!0 (select (arr!31605 lt!459257) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1042108 () Bool)

(assert (=> b!1042108 (= e!590271 call!44157)))

(declare-fun b!1042109 () Bool)

(assert (=> b!1042109 (= e!590269 e!590271)))

(assert (=> b!1042109 (= c!105773 (validKeyInArray!0 (select (arr!31605 lt!459257) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!126037 (not res!694434)) b!1042107))

(assert (= (and b!1042107 res!694436) b!1042106))

(assert (= (and b!1042107 res!694435) b!1042109))

(assert (= (and b!1042109 c!105773) b!1042108))

(assert (= (and b!1042109 (not c!105773)) b!1042105))

(assert (= (or b!1042108 b!1042105) bm!44154))

(declare-fun m!961483 () Bool)

(assert (=> bm!44154 m!961483))

(declare-fun m!961485 () Bool)

(assert (=> bm!44154 m!961485))

(assert (=> b!1042106 m!961483))

(assert (=> b!1042106 m!961483))

(declare-fun m!961487 () Bool)

(assert (=> b!1042106 m!961487))

(assert (=> b!1042107 m!961483))

(assert (=> b!1042107 m!961483))

(declare-fun m!961489 () Bool)

(assert (=> b!1042107 m!961489))

(assert (=> b!1042109 m!961483))

(assert (=> b!1042109 m!961483))

(assert (=> b!1042109 m!961489))

(assert (=> bm!44150 d!126037))

(declare-fun d!126039 () Bool)

(assert (=> d!126039 (= (validKeyInArray!0 (select (arr!31605 lt!459257) #b00000000000000000000000000000000)) (and (not (= (select (arr!31605 lt!459257) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31605 lt!459257) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1042053 d!126039))

(declare-fun d!126041 () Bool)

(assert (=> d!126041 (= (validKeyInArray!0 (select (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258))) (and (not (= (select (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1042025 d!126041))

(declare-fun d!126043 () Bool)

(declare-fun res!694437 () Bool)

(declare-fun e!590273 () Bool)

(assert (=> d!126043 (=> res!694437 e!590273)))

(assert (=> d!126043 (= res!694437 (= (select (arr!31605 lt!459257) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!126043 (= (arrayContainsKey!0 lt!459257 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!590273)))

(declare-fun b!1042110 () Bool)

(declare-fun e!590274 () Bool)

(assert (=> b!1042110 (= e!590273 e!590274)))

(declare-fun res!694438 () Bool)

(assert (=> b!1042110 (=> (not res!694438) (not e!590274))))

(assert (=> b!1042110 (= res!694438 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32139 lt!459257)))))

(declare-fun b!1042111 () Bool)

(assert (=> b!1042111 (= e!590274 (arrayContainsKey!0 lt!459257 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!126043 (not res!694437)) b!1042110))

(assert (= (and b!1042110 res!694438) b!1042111))

(assert (=> d!126043 m!961483))

(declare-fun m!961491 () Bool)

(assert (=> b!1042111 m!961491))

(assert (=> b!1042013 d!126043))

(declare-fun d!126045 () Bool)

(declare-fun lt!459321 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!523 (List!21971) (InoxSet (_ BitVec 64)))

(assert (=> d!126045 (= lt!459321 (select (content!523 Nil!21968) (select (arr!31605 lt!459257) #b00000000000000000000000000000000)))))

(declare-fun e!590280 () Bool)

(assert (=> d!126045 (= lt!459321 e!590280)))

(declare-fun res!694443 () Bool)

(assert (=> d!126045 (=> (not res!694443) (not e!590280))))

(assert (=> d!126045 (= res!694443 ((_ is Cons!21967) Nil!21968))))

(assert (=> d!126045 (= (contains!6056 Nil!21968 (select (arr!31605 lt!459257) #b00000000000000000000000000000000)) lt!459321)))

(declare-fun b!1042116 () Bool)

(declare-fun e!590279 () Bool)

(assert (=> b!1042116 (= e!590280 e!590279)))

(declare-fun res!694444 () Bool)

(assert (=> b!1042116 (=> res!694444 e!590279)))

(assert (=> b!1042116 (= res!694444 (= (h!23174 Nil!21968) (select (arr!31605 lt!459257) #b00000000000000000000000000000000)))))

(declare-fun b!1042117 () Bool)

(assert (=> b!1042117 (= e!590279 (contains!6056 (t!31185 Nil!21968) (select (arr!31605 lt!459257) #b00000000000000000000000000000000)))))

(assert (= (and d!126045 res!694443) b!1042116))

(assert (= (and b!1042116 (not res!694444)) b!1042117))

(declare-fun m!961493 () Bool)

(assert (=> d!126045 m!961493))

(assert (=> d!126045 m!961397))

(declare-fun m!961495 () Bool)

(assert (=> d!126045 m!961495))

(assert (=> b!1042117 m!961397))

(declare-fun m!961497 () Bool)

(assert (=> b!1042117 m!961497))

(assert (=> b!1042052 d!126045))

(declare-fun b!1042136 () Bool)

(declare-fun e!590295 () SeekEntryResult!9812)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1042136 (= e!590295 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!30407 thiss!1427)) #b00000000000000000000000000000000 (mask!30407 thiss!1427)) key!909 (_keys!11604 thiss!1427) (mask!30407 thiss!1427)))))

(declare-fun b!1042137 () Bool)

(assert (=> b!1042137 (= e!590295 (Intermediate!9812 false (toIndex!0 key!909 (mask!30407 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1042138 () Bool)

(declare-fun e!590294 () Bool)

(declare-fun lt!459326 () SeekEntryResult!9812)

(assert (=> b!1042138 (= e!590294 (bvsge (x!93023 lt!459326) #b01111111111111111111111111111110))))

(declare-fun b!1042139 () Bool)

(declare-fun e!590293 () SeekEntryResult!9812)

(assert (=> b!1042139 (= e!590293 (Intermediate!9812 true (toIndex!0 key!909 (mask!30407 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun d!126047 () Bool)

(assert (=> d!126047 e!590294))

(declare-fun c!105782 () Bool)

(assert (=> d!126047 (= c!105782 (and ((_ is Intermediate!9812) lt!459326) (undefined!10624 lt!459326)))))

(assert (=> d!126047 (= lt!459326 e!590293)))

(declare-fun c!105781 () Bool)

(assert (=> d!126047 (= c!105781 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!459327 () (_ BitVec 64))

(assert (=> d!126047 (= lt!459327 (select (arr!31605 (_keys!11604 thiss!1427)) (toIndex!0 key!909 (mask!30407 thiss!1427))))))

(assert (=> d!126047 (validMask!0 (mask!30407 thiss!1427))))

(assert (=> d!126047 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30407 thiss!1427)) key!909 (_keys!11604 thiss!1427) (mask!30407 thiss!1427)) lt!459326)))

(declare-fun b!1042140 () Bool)

(assert (=> b!1042140 (and (bvsge (index!41621 lt!459326) #b00000000000000000000000000000000) (bvslt (index!41621 lt!459326) (size!32139 (_keys!11604 thiss!1427))))))

(declare-fun e!590291 () Bool)

(assert (=> b!1042140 (= e!590291 (= (select (arr!31605 (_keys!11604 thiss!1427)) (index!41621 lt!459326)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1042141 () Bool)

(assert (=> b!1042141 (and (bvsge (index!41621 lt!459326) #b00000000000000000000000000000000) (bvslt (index!41621 lt!459326) (size!32139 (_keys!11604 thiss!1427))))))

(declare-fun res!694451 () Bool)

(assert (=> b!1042141 (= res!694451 (= (select (arr!31605 (_keys!11604 thiss!1427)) (index!41621 lt!459326)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1042141 (=> res!694451 e!590291)))

(declare-fun b!1042142 () Bool)

(assert (=> b!1042142 (and (bvsge (index!41621 lt!459326) #b00000000000000000000000000000000) (bvslt (index!41621 lt!459326) (size!32139 (_keys!11604 thiss!1427))))))

(declare-fun res!694453 () Bool)

(assert (=> b!1042142 (= res!694453 (= (select (arr!31605 (_keys!11604 thiss!1427)) (index!41621 lt!459326)) key!909))))

(assert (=> b!1042142 (=> res!694453 e!590291)))

(declare-fun e!590292 () Bool)

(assert (=> b!1042142 (= e!590292 e!590291)))

(declare-fun b!1042143 () Bool)

(assert (=> b!1042143 (= e!590293 e!590295)))

(declare-fun c!105780 () Bool)

(assert (=> b!1042143 (= c!105780 (or (= lt!459327 key!909) (= (bvadd lt!459327 lt!459327) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1042144 () Bool)

(assert (=> b!1042144 (= e!590294 e!590292)))

(declare-fun res!694452 () Bool)

(assert (=> b!1042144 (= res!694452 (and ((_ is Intermediate!9812) lt!459326) (not (undefined!10624 lt!459326)) (bvslt (x!93023 lt!459326) #b01111111111111111111111111111110) (bvsge (x!93023 lt!459326) #b00000000000000000000000000000000) (bvsge (x!93023 lt!459326) #b00000000000000000000000000000000)))))

(assert (=> b!1042144 (=> (not res!694452) (not e!590292))))

(assert (= (and d!126047 c!105781) b!1042139))

(assert (= (and d!126047 (not c!105781)) b!1042143))

(assert (= (and b!1042143 c!105780) b!1042137))

(assert (= (and b!1042143 (not c!105780)) b!1042136))

(assert (= (and d!126047 c!105782) b!1042138))

(assert (= (and d!126047 (not c!105782)) b!1042144))

(assert (= (and b!1042144 res!694452) b!1042142))

(assert (= (and b!1042142 (not res!694453)) b!1042141))

(assert (= (and b!1042141 (not res!694451)) b!1042140))

(declare-fun m!961499 () Bool)

(assert (=> b!1042140 m!961499))

(assert (=> d!126047 m!961457))

(declare-fun m!961501 () Bool)

(assert (=> d!126047 m!961501))

(assert (=> d!126047 m!961351))

(assert (=> b!1042142 m!961499))

(assert (=> b!1042136 m!961457))

(declare-fun m!961503 () Bool)

(assert (=> b!1042136 m!961503))

(assert (=> b!1042136 m!961503))

(declare-fun m!961505 () Bool)

(assert (=> b!1042136 m!961505))

(assert (=> b!1042141 m!961499))

(assert (=> d!126027 d!126047))

(declare-fun d!126049 () Bool)

(declare-fun lt!459333 () (_ BitVec 32))

(declare-fun lt!459332 () (_ BitVec 32))

(assert (=> d!126049 (= lt!459333 (bvmul (bvxor lt!459332 (bvlshr lt!459332 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!126049 (= lt!459332 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!126049 (and (bvsge (mask!30407 thiss!1427) #b00000000000000000000000000000000) (let ((res!694454 (let ((h!23175 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!93039 (bvmul (bvxor h!23175 (bvlshr h!23175 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!93039 (bvlshr x!93039 #b00000000000000000000000000001101)) (mask!30407 thiss!1427)))))) (and (bvslt res!694454 (bvadd (mask!30407 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!694454 #b00000000000000000000000000000000))))))

(assert (=> d!126049 (= (toIndex!0 key!909 (mask!30407 thiss!1427)) (bvand (bvxor lt!459333 (bvlshr lt!459333 #b00000000000000000000000000001101)) (mask!30407 thiss!1427)))))

(assert (=> d!126027 d!126049))

(assert (=> d!126027 d!126017))

(declare-fun d!126051 () Bool)

(assert (=> d!126051 (not (arrayContainsKey!0 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!126051 true))

(declare-fun _$59!32 () Unit!34039)

(assert (=> d!126051 (= (choose!121 (_keys!11604 thiss!1427) (index!41620 lt!459258) key!909) _$59!32)))

(declare-fun bs!30474 () Bool)

(assert (= bs!30474 d!126051))

(assert (=> bs!30474 m!961349))

(assert (=> bs!30474 m!961405))

(assert (=> d!126007 d!126051))

(declare-fun d!126053 () Bool)

(assert (=> d!126053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))) (mask!30407 thiss!1427))))

(assert (=> d!126053 true))

(declare-fun _$44!30 () Unit!34039)

(assert (=> d!126053 (= (choose!25 (_keys!11604 thiss!1427) (index!41620 lt!459258) (mask!30407 thiss!1427)) _$44!30)))

(declare-fun bs!30475 () Bool)

(assert (= bs!30475 d!126053))

(assert (=> bs!30475 m!961349))

(assert (=> bs!30475 m!961409))

(assert (=> d!126009 d!126053))

(assert (=> d!126009 d!126017))

(declare-fun d!126055 () Bool)

(assert (=> d!126055 (arrayNoDuplicates!0 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))) #b00000000000000000000000000000000 Nil!21968)))

(assert (=> d!126055 true))

(declare-fun _$66!56 () Unit!34039)

(assert (=> d!126055 (= (choose!53 (_keys!11604 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41620 lt!459258) #b00000000000000000000000000000000 Nil!21968) _$66!56)))

(declare-fun bs!30476 () Bool)

(assert (= bs!30476 d!126055))

(assert (=> bs!30476 m!961349))

(assert (=> bs!30476 m!961415))

(assert (=> d!126013 d!126055))

(assert (=> b!1042038 d!126039))

(declare-fun b!1042145 () Bool)

(declare-fun e!590296 () (_ BitVec 32))

(declare-fun e!590297 () (_ BitVec 32))

(assert (=> b!1042145 (= e!590296 e!590297)))

(declare-fun c!105783 () Bool)

(assert (=> b!1042145 (= c!105783 (validKeyInArray!0 (select (arr!31605 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!44155 () Bool)

(declare-fun call!44158 () (_ BitVec 32))

(assert (=> bm!44155 (= call!44158 (arrayCountValidKeys!0 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32139 (_keys!11604 thiss!1427))))))

(declare-fun b!1042146 () Bool)

(assert (=> b!1042146 (= e!590297 call!44158)))

(declare-fun b!1042147 () Bool)

(assert (=> b!1042147 (= e!590296 #b00000000000000000000000000000000)))

(declare-fun b!1042148 () Bool)

(assert (=> b!1042148 (= e!590297 (bvadd #b00000000000000000000000000000001 call!44158))))

(declare-fun d!126057 () Bool)

(declare-fun lt!459334 () (_ BitVec 32))

(assert (=> d!126057 (and (bvsge lt!459334 #b00000000000000000000000000000000) (bvsle lt!459334 (bvsub (size!32139 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!126057 (= lt!459334 e!590296)))

(declare-fun c!105784 () Bool)

(assert (=> d!126057 (= c!105784 (bvsge #b00000000000000000000000000000000 (size!32139 (_keys!11604 thiss!1427))))))

(assert (=> d!126057 (and (bvsle #b00000000000000000000000000000000 (size!32139 (_keys!11604 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32139 (_keys!11604 thiss!1427)) (size!32139 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))))))))

(assert (=> d!126057 (= (arrayCountValidKeys!0 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))) #b00000000000000000000000000000000 (size!32139 (_keys!11604 thiss!1427))) lt!459334)))

(assert (= (and d!126057 c!105784) b!1042147))

(assert (= (and d!126057 (not c!105784)) b!1042145))

(assert (= (and b!1042145 c!105783) b!1042148))

(assert (= (and b!1042145 (not c!105783)) b!1042146))

(assert (= (or b!1042148 b!1042146) bm!44155))

(assert (=> b!1042145 m!961463))

(assert (=> b!1042145 m!961463))

(assert (=> b!1042145 m!961471))

(declare-fun m!961507 () Bool)

(assert (=> bm!44155 m!961507))

(assert (=> b!1042028 d!126057))

(assert (=> b!1042028 d!126023))

(declare-fun b!1042161 () Bool)

(declare-fun e!590306 () SeekEntryResult!9812)

(assert (=> b!1042161 (= e!590306 Undefined!9812)))

(declare-fun lt!459340 () SeekEntryResult!9812)

(declare-fun d!126059 () Bool)

(assert (=> d!126059 (and (or ((_ is Undefined!9812) lt!459340) (not ((_ is Found!9812) lt!459340)) (and (bvsge (index!41620 lt!459340) #b00000000000000000000000000000000) (bvslt (index!41620 lt!459340) (size!32139 (_keys!11604 thiss!1427))))) (or ((_ is Undefined!9812) lt!459340) ((_ is Found!9812) lt!459340) (not ((_ is MissingVacant!9812) lt!459340)) (not (= (index!41622 lt!459340) (index!41621 lt!459314))) (and (bvsge (index!41622 lt!459340) #b00000000000000000000000000000000) (bvslt (index!41622 lt!459340) (size!32139 (_keys!11604 thiss!1427))))) (or ((_ is Undefined!9812) lt!459340) (ite ((_ is Found!9812) lt!459340) (= (select (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459340)) key!909) (and ((_ is MissingVacant!9812) lt!459340) (= (index!41622 lt!459340) (index!41621 lt!459314)) (= (select (arr!31605 (_keys!11604 thiss!1427)) (index!41622 lt!459340)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!126059 (= lt!459340 e!590306)))

(declare-fun c!105793 () Bool)

(assert (=> d!126059 (= c!105793 (bvsge (x!93023 lt!459314) #b01111111111111111111111111111110))))

(declare-fun lt!459339 () (_ BitVec 64))

(assert (=> d!126059 (= lt!459339 (select (arr!31605 (_keys!11604 thiss!1427)) (index!41621 lt!459314)))))

(assert (=> d!126059 (validMask!0 (mask!30407 thiss!1427))))

(assert (=> d!126059 (= (seekKeyOrZeroReturnVacant!0 (x!93023 lt!459314) (index!41621 lt!459314) (index!41621 lt!459314) key!909 (_keys!11604 thiss!1427) (mask!30407 thiss!1427)) lt!459340)))

(declare-fun b!1042162 () Bool)

(declare-fun e!590305 () SeekEntryResult!9812)

(assert (=> b!1042162 (= e!590305 (Found!9812 (index!41621 lt!459314)))))

(declare-fun e!590304 () SeekEntryResult!9812)

(declare-fun b!1042163 () Bool)

(assert (=> b!1042163 (= e!590304 (seekKeyOrZeroReturnVacant!0 (bvadd (x!93023 lt!459314) #b00000000000000000000000000000001) (nextIndex!0 (index!41621 lt!459314) (x!93023 lt!459314) (mask!30407 thiss!1427)) (index!41621 lt!459314) key!909 (_keys!11604 thiss!1427) (mask!30407 thiss!1427)))))

(declare-fun b!1042164 () Bool)

(declare-fun c!105792 () Bool)

(assert (=> b!1042164 (= c!105792 (= lt!459339 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1042164 (= e!590305 e!590304)))

(declare-fun b!1042165 () Bool)

(assert (=> b!1042165 (= e!590304 (MissingVacant!9812 (index!41621 lt!459314)))))

(declare-fun b!1042166 () Bool)

(assert (=> b!1042166 (= e!590306 e!590305)))

(declare-fun c!105791 () Bool)

(assert (=> b!1042166 (= c!105791 (= lt!459339 key!909))))

(assert (= (and d!126059 c!105793) b!1042161))

(assert (= (and d!126059 (not c!105793)) b!1042166))

(assert (= (and b!1042166 c!105791) b!1042162))

(assert (= (and b!1042166 (not c!105791)) b!1042164))

(assert (= (and b!1042164 c!105792) b!1042165))

(assert (= (and b!1042164 (not c!105792)) b!1042163))

(declare-fun m!961509 () Bool)

(assert (=> d!126059 m!961509))

(declare-fun m!961511 () Bool)

(assert (=> d!126059 m!961511))

(assert (=> d!126059 m!961451))

(assert (=> d!126059 m!961351))

(declare-fun m!961513 () Bool)

(assert (=> b!1042163 m!961513))

(assert (=> b!1042163 m!961513))

(declare-fun m!961515 () Bool)

(assert (=> b!1042163 m!961515))

(assert (=> b!1042085 d!126059))

(declare-fun b!1042167 () Bool)

(declare-fun e!590307 () (_ BitVec 32))

(declare-fun e!590308 () (_ BitVec 32))

(assert (=> b!1042167 (= e!590307 e!590308)))

(declare-fun c!105794 () Bool)

(assert (=> b!1042167 (= c!105794 (validKeyInArray!0 (select (arr!31605 lt!459257) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!44156 () Bool)

(declare-fun call!44159 () (_ BitVec 32))

(assert (=> bm!44156 (= call!44159 (arrayCountValidKeys!0 lt!459257 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32139 (_keys!11604 thiss!1427))))))

(declare-fun b!1042168 () Bool)

(assert (=> b!1042168 (= e!590308 call!44159)))

(declare-fun b!1042169 () Bool)

(assert (=> b!1042169 (= e!590307 #b00000000000000000000000000000000)))

(declare-fun b!1042170 () Bool)

(assert (=> b!1042170 (= e!590308 (bvadd #b00000000000000000000000000000001 call!44159))))

(declare-fun d!126061 () Bool)

(declare-fun lt!459341 () (_ BitVec 32))

(assert (=> d!126061 (and (bvsge lt!459341 #b00000000000000000000000000000000) (bvsle lt!459341 (bvsub (size!32139 lt!459257) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!126061 (= lt!459341 e!590307)))

(declare-fun c!105795 () Bool)

(assert (=> d!126061 (= c!105795 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32139 (_keys!11604 thiss!1427))))))

(assert (=> d!126061 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32139 (_keys!11604 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32139 (_keys!11604 thiss!1427)) (size!32139 lt!459257)))))

(assert (=> d!126061 (= (arrayCountValidKeys!0 lt!459257 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32139 (_keys!11604 thiss!1427))) lt!459341)))

(assert (= (and d!126061 c!105795) b!1042169))

(assert (= (and d!126061 (not c!105795)) b!1042167))

(assert (= (and b!1042167 c!105794) b!1042170))

(assert (= (and b!1042167 (not c!105794)) b!1042168))

(assert (= (or b!1042170 b!1042168) bm!44156))

(assert (=> b!1042167 m!961483))

(assert (=> b!1042167 m!961483))

(assert (=> b!1042167 m!961489))

(declare-fun m!961517 () Bool)

(assert (=> bm!44156 m!961517))

(assert (=> bm!44144 d!126061))

(assert (=> b!1041998 d!126039))

(declare-fun d!126063 () Bool)

(assert (=> d!126063 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1042026 d!126063))

(declare-fun b!1042171 () Bool)

(declare-fun e!590311 () Bool)

(declare-fun call!44160 () Bool)

(assert (=> b!1042171 (= e!590311 call!44160)))

(declare-fun d!126065 () Bool)

(declare-fun res!694455 () Bool)

(declare-fun e!590312 () Bool)

(assert (=> d!126065 (=> res!694455 e!590312)))

(assert (=> d!126065 (= res!694455 (bvsge #b00000000000000000000000000000000 (size!32139 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))))))))

(assert (=> d!126065 (= (arrayNoDuplicates!0 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))) #b00000000000000000000000000000000 Nil!21968) e!590312)))

(declare-fun c!105796 () Bool)

(declare-fun bm!44157 () Bool)

(assert (=> bm!44157 (= call!44160 (arrayNoDuplicates!0 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105796 (Cons!21967 (select (arr!31605 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427)))) #b00000000000000000000000000000000) Nil!21968) Nil!21968)))))

(declare-fun b!1042172 () Bool)

(declare-fun e!590310 () Bool)

(assert (=> b!1042172 (= e!590310 (contains!6056 Nil!21968 (select (arr!31605 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1042173 () Bool)

(declare-fun e!590309 () Bool)

(assert (=> b!1042173 (= e!590312 e!590309)))

(declare-fun res!694456 () Bool)

(assert (=> b!1042173 (=> (not res!694456) (not e!590309))))

(assert (=> b!1042173 (= res!694456 (not e!590310))))

(declare-fun res!694457 () Bool)

(assert (=> b!1042173 (=> (not res!694457) (not e!590310))))

(assert (=> b!1042173 (= res!694457 (validKeyInArray!0 (select (arr!31605 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1042174 () Bool)

(assert (=> b!1042174 (= e!590311 call!44160)))

(declare-fun b!1042175 () Bool)

(assert (=> b!1042175 (= e!590309 e!590311)))

(assert (=> b!1042175 (= c!105796 (validKeyInArray!0 (select (arr!31605 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (= (and d!126065 (not res!694455)) b!1042173))

(assert (= (and b!1042173 res!694457) b!1042172))

(assert (= (and b!1042173 res!694456) b!1042175))

(assert (= (and b!1042175 c!105796) b!1042174))

(assert (= (and b!1042175 (not c!105796)) b!1042171))

(assert (= (or b!1042174 b!1042171) bm!44157))

(assert (=> bm!44157 m!961463))

(declare-fun m!961519 () Bool)

(assert (=> bm!44157 m!961519))

(assert (=> b!1042172 m!961463))

(assert (=> b!1042172 m!961463))

(declare-fun m!961521 () Bool)

(assert (=> b!1042172 m!961521))

(assert (=> b!1042173 m!961463))

(assert (=> b!1042173 m!961463))

(assert (=> b!1042173 m!961471))

(assert (=> b!1042175 m!961463))

(assert (=> b!1042175 m!961463))

(assert (=> b!1042175 m!961471))

(assert (=> b!1042016 d!126065))

(assert (=> b!1042055 d!126039))

(declare-fun d!126067 () Bool)

(assert (=> d!126067 (arrayContainsKey!0 lt!459257 lt!459300 #b00000000000000000000000000000000)))

(declare-fun lt!459344 () Unit!34039)

(declare-fun choose!13 (array!65692 (_ BitVec 64) (_ BitVec 32)) Unit!34039)

(assert (=> d!126067 (= lt!459344 (choose!13 lt!459257 lt!459300 #b00000000000000000000000000000000))))

(assert (=> d!126067 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!126067 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459257 lt!459300 #b00000000000000000000000000000000) lt!459344)))

(declare-fun bs!30477 () Bool)

(assert (= bs!30477 d!126067))

(assert (=> bs!30477 m!961429))

(declare-fun m!961523 () Bool)

(assert (=> bs!30477 m!961523))

(assert (=> b!1042037 d!126067))

(declare-fun d!126069 () Bool)

(declare-fun res!694458 () Bool)

(declare-fun e!590313 () Bool)

(assert (=> d!126069 (=> res!694458 e!590313)))

(assert (=> d!126069 (= res!694458 (= (select (arr!31605 lt!459257) #b00000000000000000000000000000000) lt!459300))))

(assert (=> d!126069 (= (arrayContainsKey!0 lt!459257 lt!459300 #b00000000000000000000000000000000) e!590313)))

(declare-fun b!1042176 () Bool)

(declare-fun e!590314 () Bool)

(assert (=> b!1042176 (= e!590313 e!590314)))

(declare-fun res!694459 () Bool)

(assert (=> b!1042176 (=> (not res!694459) (not e!590314))))

(assert (=> b!1042176 (= res!694459 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32139 lt!459257)))))

(declare-fun b!1042177 () Bool)

(assert (=> b!1042177 (= e!590314 (arrayContainsKey!0 lt!459257 lt!459300 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126069 (not res!694458)) b!1042176))

(assert (= (and b!1042176 res!694459) b!1042177))

(assert (=> d!126069 m!961397))

(declare-fun m!961525 () Bool)

(assert (=> b!1042177 m!961525))

(assert (=> b!1042037 d!126069))

(declare-fun b!1042190 () Bool)

(declare-fun e!590323 () SeekEntryResult!9812)

(declare-fun e!590322 () SeekEntryResult!9812)

(assert (=> b!1042190 (= e!590323 e!590322)))

(declare-fun lt!459351 () (_ BitVec 64))

(declare-fun lt!459353 () SeekEntryResult!9812)

(assert (=> b!1042190 (= lt!459351 (select (arr!31605 lt!459257) (index!41621 lt!459353)))))

(declare-fun c!105803 () Bool)

(assert (=> b!1042190 (= c!105803 (= lt!459351 (select (arr!31605 lt!459257) #b00000000000000000000000000000000)))))

(declare-fun d!126071 () Bool)

(declare-fun lt!459352 () SeekEntryResult!9812)

(assert (=> d!126071 (and (or ((_ is Undefined!9812) lt!459352) (not ((_ is Found!9812) lt!459352)) (and (bvsge (index!41620 lt!459352) #b00000000000000000000000000000000) (bvslt (index!41620 lt!459352) (size!32139 lt!459257)))) (or ((_ is Undefined!9812) lt!459352) ((_ is Found!9812) lt!459352) (not ((_ is MissingZero!9812) lt!459352)) (and (bvsge (index!41619 lt!459352) #b00000000000000000000000000000000) (bvslt (index!41619 lt!459352) (size!32139 lt!459257)))) (or ((_ is Undefined!9812) lt!459352) ((_ is Found!9812) lt!459352) ((_ is MissingZero!9812) lt!459352) (not ((_ is MissingVacant!9812) lt!459352)) (and (bvsge (index!41622 lt!459352) #b00000000000000000000000000000000) (bvslt (index!41622 lt!459352) (size!32139 lt!459257)))) (or ((_ is Undefined!9812) lt!459352) (ite ((_ is Found!9812) lt!459352) (= (select (arr!31605 lt!459257) (index!41620 lt!459352)) (select (arr!31605 lt!459257) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9812) lt!459352) (= (select (arr!31605 lt!459257) (index!41619 lt!459352)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9812) lt!459352) (= (select (arr!31605 lt!459257) (index!41622 lt!459352)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!126071 (= lt!459352 e!590323)))

(declare-fun c!105805 () Bool)

(assert (=> d!126071 (= c!105805 (and ((_ is Intermediate!9812) lt!459353) (undefined!10624 lt!459353)))))

(assert (=> d!126071 (= lt!459353 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31605 lt!459257) #b00000000000000000000000000000000) (mask!30407 thiss!1427)) (select (arr!31605 lt!459257) #b00000000000000000000000000000000) lt!459257 (mask!30407 thiss!1427)))))

(assert (=> d!126071 (validMask!0 (mask!30407 thiss!1427))))

(assert (=> d!126071 (= (seekEntryOrOpen!0 (select (arr!31605 lt!459257) #b00000000000000000000000000000000) lt!459257 (mask!30407 thiss!1427)) lt!459352)))

(declare-fun b!1042191 () Bool)

(declare-fun e!590321 () SeekEntryResult!9812)

(assert (=> b!1042191 (= e!590321 (MissingZero!9812 (index!41621 lt!459353)))))

(declare-fun b!1042192 () Bool)

(declare-fun c!105804 () Bool)

(assert (=> b!1042192 (= c!105804 (= lt!459351 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1042192 (= e!590322 e!590321)))

(declare-fun b!1042193 () Bool)

(assert (=> b!1042193 (= e!590322 (Found!9812 (index!41621 lt!459353)))))

(declare-fun b!1042194 () Bool)

(assert (=> b!1042194 (= e!590323 Undefined!9812)))

(declare-fun b!1042195 () Bool)

(assert (=> b!1042195 (= e!590321 (seekKeyOrZeroReturnVacant!0 (x!93023 lt!459353) (index!41621 lt!459353) (index!41621 lt!459353) (select (arr!31605 lt!459257) #b00000000000000000000000000000000) lt!459257 (mask!30407 thiss!1427)))))

(assert (= (and d!126071 c!105805) b!1042194))

(assert (= (and d!126071 (not c!105805)) b!1042190))

(assert (= (and b!1042190 c!105803) b!1042193))

(assert (= (and b!1042190 (not c!105803)) b!1042192))

(assert (= (and b!1042192 c!105804) b!1042191))

(assert (= (and b!1042192 (not c!105804)) b!1042195))

(declare-fun m!961527 () Bool)

(assert (=> b!1042190 m!961527))

(declare-fun m!961529 () Bool)

(assert (=> d!126071 m!961529))

(declare-fun m!961531 () Bool)

(assert (=> d!126071 m!961531))

(assert (=> d!126071 m!961397))

(declare-fun m!961533 () Bool)

(assert (=> d!126071 m!961533))

(declare-fun m!961535 () Bool)

(assert (=> d!126071 m!961535))

(declare-fun m!961537 () Bool)

(assert (=> d!126071 m!961537))

(assert (=> d!126071 m!961351))

(assert (=> d!126071 m!961397))

(assert (=> d!126071 m!961531))

(assert (=> b!1042195 m!961397))

(declare-fun m!961539 () Bool)

(assert (=> b!1042195 m!961539))

(assert (=> b!1042037 d!126071))

(declare-fun b!1042196 () Bool)

(declare-fun e!590326 () Bool)

(declare-fun call!44161 () Bool)

(assert (=> b!1042196 (= e!590326 call!44161)))

(declare-fun d!126073 () Bool)

(declare-fun res!694460 () Bool)

(declare-fun e!590327 () Bool)

(assert (=> d!126073 (=> res!694460 e!590327)))

(assert (=> d!126073 (= res!694460 (bvsge #b00000000000000000000000000000000 (size!32139 (_keys!11604 thiss!1427))))))

(assert (=> d!126073 (= (arrayNoDuplicates!0 (_keys!11604 thiss!1427) #b00000000000000000000000000000000 Nil!21968) e!590327)))

(declare-fun bm!44158 () Bool)

(declare-fun c!105806 () Bool)

(assert (=> bm!44158 (= call!44161 (arrayNoDuplicates!0 (_keys!11604 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105806 (Cons!21967 (select (arr!31605 (_keys!11604 thiss!1427)) #b00000000000000000000000000000000) Nil!21968) Nil!21968)))))

(declare-fun b!1042197 () Bool)

(declare-fun e!590325 () Bool)

(assert (=> b!1042197 (= e!590325 (contains!6056 Nil!21968 (select (arr!31605 (_keys!11604 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042198 () Bool)

(declare-fun e!590324 () Bool)

(assert (=> b!1042198 (= e!590327 e!590324)))

(declare-fun res!694461 () Bool)

(assert (=> b!1042198 (=> (not res!694461) (not e!590324))))

(assert (=> b!1042198 (= res!694461 (not e!590325))))

(declare-fun res!694462 () Bool)

(assert (=> b!1042198 (=> (not res!694462) (not e!590325))))

(assert (=> b!1042198 (= res!694462 (validKeyInArray!0 (select (arr!31605 (_keys!11604 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042199 () Bool)

(assert (=> b!1042199 (= e!590326 call!44161)))

(declare-fun b!1042200 () Bool)

(assert (=> b!1042200 (= e!590324 e!590326)))

(assert (=> b!1042200 (= c!105806 (validKeyInArray!0 (select (arr!31605 (_keys!11604 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126073 (not res!694460)) b!1042198))

(assert (= (and b!1042198 res!694462) b!1042197))

(assert (= (and b!1042198 res!694461) b!1042200))

(assert (= (and b!1042200 c!105806) b!1042199))

(assert (= (and b!1042200 (not c!105806)) b!1042196))

(assert (= (or b!1042199 b!1042196) bm!44158))

(assert (=> bm!44158 m!961439))

(declare-fun m!961541 () Bool)

(assert (=> bm!44158 m!961541))

(assert (=> b!1042197 m!961439))

(assert (=> b!1042197 m!961439))

(declare-fun m!961543 () Bool)

(assert (=> b!1042197 m!961543))

(assert (=> b!1042198 m!961439))

(assert (=> b!1042198 m!961439))

(assert (=> b!1042198 m!961441))

(assert (=> b!1042200 m!961439))

(assert (=> b!1042200 m!961439))

(assert (=> b!1042200 m!961441))

(assert (=> b!1042068 d!126073))

(assert (=> b!1042066 d!126023))

(declare-fun b!1042211 () Bool)

(declare-fun res!694471 () Bool)

(declare-fun e!590330 () Bool)

(assert (=> b!1042211 (=> (not res!694471) (not e!590330))))

(declare-fun size!32143 (LongMapFixedSize!5958) (_ BitVec 32))

(assert (=> b!1042211 (= res!694471 (= (size!32143 thiss!1427) (bvadd (_size!3034 thiss!1427) (bvsdiv (bvadd (extraKeys!6089 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1042209 () Bool)

(declare-fun res!694474 () Bool)

(assert (=> b!1042209 (=> (not res!694474) (not e!590330))))

(assert (=> b!1042209 (= res!694474 (and (= (size!32140 (_values!6384 thiss!1427)) (bvadd (mask!30407 thiss!1427) #b00000000000000000000000000000001)) (= (size!32139 (_keys!11604 thiss!1427)) (size!32140 (_values!6384 thiss!1427))) (bvsge (_size!3034 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!3034 thiss!1427) (bvadd (mask!30407 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun d!126075 () Bool)

(declare-fun res!694472 () Bool)

(assert (=> d!126075 (=> (not res!694472) (not e!590330))))

(assert (=> d!126075 (= res!694472 (validMask!0 (mask!30407 thiss!1427)))))

(assert (=> d!126075 (= (simpleValid!440 thiss!1427) e!590330)))

(declare-fun b!1042212 () Bool)

(assert (=> b!1042212 (= e!590330 (and (bvsge (extraKeys!6089 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6089 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!3034 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1042210 () Bool)

(declare-fun res!694473 () Bool)

(assert (=> b!1042210 (=> (not res!694473) (not e!590330))))

(assert (=> b!1042210 (= res!694473 (bvsge (size!32143 thiss!1427) (_size!3034 thiss!1427)))))

(assert (= (and d!126075 res!694472) b!1042209))

(assert (= (and b!1042209 res!694474) b!1042210))

(assert (= (and b!1042210 res!694473) b!1042211))

(assert (= (and b!1042211 res!694471) b!1042212))

(declare-fun m!961545 () Bool)

(assert (=> b!1042211 m!961545))

(assert (=> d!126075 m!961351))

(assert (=> b!1042210 m!961545))

(assert (=> d!126025 d!126075))

(declare-fun b!1042213 () Bool)

(declare-fun e!590331 () Bool)

(declare-fun e!590332 () Bool)

(assert (=> b!1042213 (= e!590331 e!590332)))

(declare-fun lt!459355 () (_ BitVec 64))

(assert (=> b!1042213 (= lt!459355 (select (arr!31605 lt!459257) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!459356 () Unit!34039)

(assert (=> b!1042213 (= lt!459356 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459257 lt!459355 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1042213 (arrayContainsKey!0 lt!459257 lt!459355 #b00000000000000000000000000000000)))

(declare-fun lt!459354 () Unit!34039)

(assert (=> b!1042213 (= lt!459354 lt!459356)))

(declare-fun res!694475 () Bool)

(assert (=> b!1042213 (= res!694475 (= (seekEntryOrOpen!0 (select (arr!31605 lt!459257) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!459257 (mask!30407 thiss!1427)) (Found!9812 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1042213 (=> (not res!694475) (not e!590332))))

(declare-fun b!1042214 () Bool)

(declare-fun e!590333 () Bool)

(assert (=> b!1042214 (= e!590333 e!590331)))

(declare-fun c!105807 () Bool)

(assert (=> b!1042214 (= c!105807 (validKeyInArray!0 (select (arr!31605 lt!459257) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!126077 () Bool)

(declare-fun res!694476 () Bool)

(assert (=> d!126077 (=> res!694476 e!590333)))

(assert (=> d!126077 (= res!694476 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32139 lt!459257)))))

(assert (=> d!126077 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459257 (mask!30407 thiss!1427)) e!590333)))

(declare-fun b!1042215 () Bool)

(declare-fun call!44162 () Bool)

(assert (=> b!1042215 (= e!590331 call!44162)))

(declare-fun b!1042216 () Bool)

(assert (=> b!1042216 (= e!590332 call!44162)))

(declare-fun bm!44159 () Bool)

(assert (=> bm!44159 (= call!44162 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!459257 (mask!30407 thiss!1427)))))

(assert (= (and d!126077 (not res!694476)) b!1042214))

(assert (= (and b!1042214 c!105807) b!1042213))

(assert (= (and b!1042214 (not c!105807)) b!1042215))

(assert (= (and b!1042213 res!694475) b!1042216))

(assert (= (or b!1042216 b!1042215) bm!44159))

(assert (=> b!1042213 m!961483))

(declare-fun m!961547 () Bool)

(assert (=> b!1042213 m!961547))

(declare-fun m!961549 () Bool)

(assert (=> b!1042213 m!961549))

(assert (=> b!1042213 m!961483))

(declare-fun m!961551 () Bool)

(assert (=> b!1042213 m!961551))

(assert (=> b!1042214 m!961483))

(assert (=> b!1042214 m!961483))

(assert (=> b!1042214 m!961489))

(declare-fun m!961553 () Bool)

(assert (=> bm!44159 m!961553))

(assert (=> bm!44147 d!126077))

(declare-fun d!126079 () Bool)

(assert (=> d!126079 (= (arrayCountValidKeys!0 (array!65693 (store (arr!31605 (_keys!11604 thiss!1427)) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11604 thiss!1427))) #b00000000000000000000000000000000 (size!32139 (_keys!11604 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11604 thiss!1427) #b00000000000000000000000000000000 (size!32139 (_keys!11604 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!126079 true))

(declare-fun _$79!32 () Unit!34039)

(assert (=> d!126079 (= (choose!82 (_keys!11604 thiss!1427) (index!41620 lt!459258) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!32)))

(declare-fun bs!30478 () Bool)

(assert (= bs!30478 d!126079))

(assert (=> bs!30478 m!961349))

(assert (=> bs!30478 m!961419))

(assert (=> bs!30478 m!961359))

(assert (=> d!126015 d!126079))

(declare-fun b!1042217 () Bool)

(declare-fun e!590334 () Bool)

(declare-fun e!590335 () Bool)

(assert (=> b!1042217 (= e!590334 e!590335)))

(declare-fun lt!459358 () (_ BitVec 64))

(assert (=> b!1042217 (= lt!459358 (select (arr!31605 (_keys!11604 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459359 () Unit!34039)

(assert (=> b!1042217 (= lt!459359 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11604 thiss!1427) lt!459358 #b00000000000000000000000000000000))))

(assert (=> b!1042217 (arrayContainsKey!0 (_keys!11604 thiss!1427) lt!459358 #b00000000000000000000000000000000)))

(declare-fun lt!459357 () Unit!34039)

(assert (=> b!1042217 (= lt!459357 lt!459359)))

(declare-fun res!694477 () Bool)

(assert (=> b!1042217 (= res!694477 (= (seekEntryOrOpen!0 (select (arr!31605 (_keys!11604 thiss!1427)) #b00000000000000000000000000000000) (_keys!11604 thiss!1427) (mask!30407 thiss!1427)) (Found!9812 #b00000000000000000000000000000000)))))

(assert (=> b!1042217 (=> (not res!694477) (not e!590335))))

(declare-fun b!1042218 () Bool)

(declare-fun e!590336 () Bool)

(assert (=> b!1042218 (= e!590336 e!590334)))

(declare-fun c!105808 () Bool)

(assert (=> b!1042218 (= c!105808 (validKeyInArray!0 (select (arr!31605 (_keys!11604 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!126081 () Bool)

(declare-fun res!694478 () Bool)

(assert (=> d!126081 (=> res!694478 e!590336)))

(assert (=> d!126081 (= res!694478 (bvsge #b00000000000000000000000000000000 (size!32139 (_keys!11604 thiss!1427))))))

(assert (=> d!126081 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11604 thiss!1427) (mask!30407 thiss!1427)) e!590336)))

(declare-fun b!1042219 () Bool)

(declare-fun call!44163 () Bool)

(assert (=> b!1042219 (= e!590334 call!44163)))

(declare-fun b!1042220 () Bool)

(assert (=> b!1042220 (= e!590335 call!44163)))

(declare-fun bm!44160 () Bool)

(assert (=> bm!44160 (= call!44163 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11604 thiss!1427) (mask!30407 thiss!1427)))))

(assert (= (and d!126081 (not res!694478)) b!1042218))

(assert (= (and b!1042218 c!105808) b!1042217))

(assert (= (and b!1042218 (not c!105808)) b!1042219))

(assert (= (and b!1042217 res!694477) b!1042220))

(assert (= (or b!1042220 b!1042219) bm!44160))

(assert (=> b!1042217 m!961439))

(declare-fun m!961555 () Bool)

(assert (=> b!1042217 m!961555))

(declare-fun m!961557 () Bool)

(assert (=> b!1042217 m!961557))

(assert (=> b!1042217 m!961439))

(declare-fun m!961559 () Bool)

(assert (=> b!1042217 m!961559))

(assert (=> b!1042218 m!961439))

(assert (=> b!1042218 m!961439))

(assert (=> b!1042218 m!961441))

(declare-fun m!961561 () Bool)

(assert (=> bm!44160 m!961561))

(assert (=> b!1042067 d!126081))

(declare-fun mapIsEmpty!38765 () Bool)

(declare-fun mapRes!38765 () Bool)

(assert (=> mapIsEmpty!38765 mapRes!38765))

(declare-fun b!1042221 () Bool)

(declare-fun e!590337 () Bool)

(assert (=> b!1042221 (= e!590337 tp_is_empty!24771)))

(declare-fun mapNonEmpty!38765 () Bool)

(declare-fun tp!74382 () Bool)

(assert (=> mapNonEmpty!38765 (= mapRes!38765 (and tp!74382 e!590337))))

(declare-fun mapRest!38765 () (Array (_ BitVec 32) ValueCell!11682))

(declare-fun mapKey!38765 () (_ BitVec 32))

(declare-fun mapValue!38765 () ValueCell!11682)

(assert (=> mapNonEmpty!38765 (= mapRest!38764 (store mapRest!38765 mapKey!38765 mapValue!38765))))

(declare-fun b!1042222 () Bool)

(declare-fun e!590338 () Bool)

(assert (=> b!1042222 (= e!590338 tp_is_empty!24771)))

(declare-fun condMapEmpty!38765 () Bool)

(declare-fun mapDefault!38765 () ValueCell!11682)

(assert (=> mapNonEmpty!38764 (= condMapEmpty!38765 (= mapRest!38764 ((as const (Array (_ BitVec 32) ValueCell!11682)) mapDefault!38765)))))

(assert (=> mapNonEmpty!38764 (= tp!74381 (and e!590338 mapRes!38765))))

(assert (= (and mapNonEmpty!38764 condMapEmpty!38765) mapIsEmpty!38765))

(assert (= (and mapNonEmpty!38764 (not condMapEmpty!38765)) mapNonEmpty!38765))

(assert (= (and mapNonEmpty!38765 ((_ is ValueCellFull!11682) mapValue!38765)) b!1042221))

(assert (= (and mapNonEmpty!38764 ((_ is ValueCellFull!11682) mapDefault!38765)) b!1042222))

(declare-fun m!961563 () Bool)

(assert (=> mapNonEmpty!38765 m!961563))

(check-sat (not b!1042210) (not b!1042213) tp_is_empty!24771 (not b!1042198) (not b!1042200) (not d!126045) (not b!1042211) (not b!1042218) (not d!126047) (not bm!44154) (not b!1042195) (not d!126059) (not b!1042107) (not bm!44160) (not b!1042172) (not b!1042096) (not b_next!21051) (not d!126051) (not d!126079) (not d!126055) b_and!33583 (not b!1042136) (not bm!44158) (not bm!44152) (not b!1042167) (not bm!44155) (not b!1042104) (not d!126053) (not b!1042163) (not b!1042109) (not d!126067) (not bm!44157) (not b!1042173) (not d!126071) (not bm!44156) (not bm!44153) (not mapNonEmpty!38765) (not b!1042214) (not b!1042217) (not b!1042095) (not b!1042106) (not b!1042177) (not b!1042145) (not b!1042175) (not b!1042111) (not bm!44159) (not b!1042117) (not b!1042099) (not b!1042197) (not d!126075))
(check-sat b_and!33583 (not b_next!21051))
