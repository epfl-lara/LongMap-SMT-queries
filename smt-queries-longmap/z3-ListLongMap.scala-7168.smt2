; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91514 () Bool)

(assert start!91514)

(declare-fun b!1042286 () Bool)

(declare-fun b_free!21061 () Bool)

(declare-fun b_next!21061 () Bool)

(assert (=> b!1042286 (= b_free!21061 (not b_next!21061))))

(declare-fun tp!74408 () Bool)

(declare-fun b_and!33567 () Bool)

(assert (=> b!1042286 (= tp!74408 b_and!33567)))

(declare-fun mapIsEmpty!38780 () Bool)

(declare-fun mapRes!38780 () Bool)

(assert (=> mapIsEmpty!38780 mapRes!38780))

(declare-fun b!1042282 () Bool)

(declare-fun res!694524 () Bool)

(declare-fun e!590413 () Bool)

(assert (=> b!1042282 (=> res!694524 e!590413)))

(declare-datatypes ((V!37915 0))(
  ( (V!37916 (val!12441 Int)) )
))
(declare-datatypes ((ValueCell!11687 0))(
  ( (ValueCellFull!11687 (v!15031 V!37915)) (EmptyCell!11687) )
))
(declare-datatypes ((array!65655 0))(
  ( (array!65656 (arr!31584 (Array (_ BitVec 32) (_ BitVec 64))) (size!32121 (_ BitVec 32))) )
))
(declare-datatypes ((array!65657 0))(
  ( (array!65658 (arr!31585 (Array (_ BitVec 32) ValueCell!11687)) (size!32122 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5968 0))(
  ( (LongMapFixedSize!5969 (defaultEntry!6366 Int) (mask!30424 (_ BitVec 32)) (extraKeys!6094 (_ BitVec 32)) (zeroValue!6200 V!37915) (minValue!6200 V!37915) (_size!3039 (_ BitVec 32)) (_keys!11612 array!65655) (_values!6389 array!65657) (_vacant!3039 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5968)

(assert (=> b!1042282 (= res!694524 (or (not (= (size!32122 (_values!6389 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30424 thiss!1427)))) (not (= (size!32121 (_keys!11612 thiss!1427)) (size!32122 (_values!6389 thiss!1427)))) (bvslt (mask!30424 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6094 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6094 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1042283 () Bool)

(declare-fun e!590412 () Bool)

(declare-fun e!590407 () Bool)

(assert (=> b!1042283 (= e!590412 (and e!590407 mapRes!38780))))

(declare-fun condMapEmpty!38780 () Bool)

(declare-fun mapDefault!38780 () ValueCell!11687)

(assert (=> b!1042283 (= condMapEmpty!38780 (= (arr!31585 (_values!6389 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11687)) mapDefault!38780)))))

(declare-fun b!1042284 () Bool)

(declare-fun res!694526 () Bool)

(assert (=> b!1042284 (=> res!694526 e!590413)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65655 (_ BitVec 32)) Bool)

(assert (=> b!1042284 (= res!694526 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11612 thiss!1427) (mask!30424 thiss!1427))))))

(declare-fun b!1042285 () Bool)

(declare-fun res!694523 () Bool)

(declare-fun e!590414 () Bool)

(assert (=> b!1042285 (=> (not res!694523) (not e!590414))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1042285 (= res!694523 (not (= key!909 (bvneg key!909))))))

(declare-fun res!694527 () Bool)

(assert (=> start!91514 (=> (not res!694527) (not e!590414))))

(declare-fun valid!2232 (LongMapFixedSize!5968) Bool)

(assert (=> start!91514 (= res!694527 (valid!2232 thiss!1427))))

(assert (=> start!91514 e!590414))

(declare-fun e!590410 () Bool)

(assert (=> start!91514 e!590410))

(assert (=> start!91514 true))

(declare-fun tp_is_empty!24781 () Bool)

(declare-fun array_inv!24409 (array!65655) Bool)

(declare-fun array_inv!24410 (array!65657) Bool)

(assert (=> b!1042286 (= e!590410 (and tp!74408 tp_is_empty!24781 (array_inv!24409 (_keys!11612 thiss!1427)) (array_inv!24410 (_values!6389 thiss!1427)) e!590412))))

(declare-fun mapNonEmpty!38780 () Bool)

(declare-fun tp!74409 () Bool)

(declare-fun e!590409 () Bool)

(assert (=> mapNonEmpty!38780 (= mapRes!38780 (and tp!74409 e!590409))))

(declare-fun mapValue!38780 () ValueCell!11687)

(declare-fun mapRest!38780 () (Array (_ BitVec 32) ValueCell!11687))

(declare-fun mapKey!38780 () (_ BitVec 32))

(assert (=> mapNonEmpty!38780 (= (arr!31585 (_values!6389 thiss!1427)) (store mapRest!38780 mapKey!38780 mapValue!38780))))

(declare-fun b!1042287 () Bool)

(declare-fun e!590411 () Bool)

(assert (=> b!1042287 (= e!590414 e!590411)))

(declare-fun res!694525 () Bool)

(assert (=> b!1042287 (=> (not res!694525) (not e!590411))))

(declare-datatypes ((SeekEntryResult!9815 0))(
  ( (MissingZero!9815 (index!41631 (_ BitVec 32))) (Found!9815 (index!41632 (_ BitVec 32))) (Intermediate!9815 (undefined!10627 Bool) (index!41633 (_ BitVec 32)) (x!93064 (_ BitVec 32))) (Undefined!9815) (MissingVacant!9815 (index!41634 (_ BitVec 32))) )
))
(declare-fun lt!459268 () SeekEntryResult!9815)

(get-info :version)

(assert (=> b!1042287 (= res!694525 ((_ is Found!9815) lt!459268))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65655 (_ BitVec 32)) SeekEntryResult!9815)

(assert (=> b!1042287 (= lt!459268 (seekEntry!0 key!909 (_keys!11612 thiss!1427) (mask!30424 thiss!1427)))))

(declare-fun b!1042288 () Bool)

(assert (=> b!1042288 (= e!590409 tp_is_empty!24781)))

(declare-fun b!1042289 () Bool)

(assert (=> b!1042289 (= e!590407 tp_is_empty!24781)))

(declare-fun b!1042290 () Bool)

(assert (=> b!1042290 (= e!590411 (not e!590413))))

(declare-fun res!694522 () Bool)

(assert (=> b!1042290 (=> res!694522 e!590413)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1042290 (= res!694522 (not (validMask!0 (mask!30424 thiss!1427))))))

(declare-fun lt!459267 () array!65655)

(declare-fun arrayContainsKey!0 (array!65655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1042290 (not (arrayContainsKey!0 lt!459267 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33933 0))(
  ( (Unit!33934) )
))
(declare-fun lt!459269 () Unit!33933)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65655 (_ BitVec 32) (_ BitVec 64)) Unit!33933)

(assert (=> b!1042290 (= lt!459269 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11612 thiss!1427) (index!41632 lt!459268) key!909))))

(assert (=> b!1042290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459267 (mask!30424 thiss!1427))))

(declare-fun lt!459266 () Unit!33933)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65655 (_ BitVec 32) (_ BitVec 32)) Unit!33933)

(assert (=> b!1042290 (= lt!459266 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11612 thiss!1427) (index!41632 lt!459268) (mask!30424 thiss!1427)))))

(declare-datatypes ((List!22012 0))(
  ( (Nil!22009) (Cons!22008 (h!23216 (_ BitVec 64)) (t!31217 List!22012)) )
))
(declare-fun arrayNoDuplicates!0 (array!65655 (_ BitVec 32) List!22012) Bool)

(assert (=> b!1042290 (arrayNoDuplicates!0 lt!459267 #b00000000000000000000000000000000 Nil!22009)))

(declare-fun lt!459271 () Unit!33933)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65655 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22012) Unit!33933)

(assert (=> b!1042290 (= lt!459271 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11612 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41632 lt!459268) #b00000000000000000000000000000000 Nil!22009))))

(declare-fun arrayCountValidKeys!0 (array!65655 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1042290 (= (arrayCountValidKeys!0 lt!459267 #b00000000000000000000000000000000 (size!32121 (_keys!11612 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11612 thiss!1427) #b00000000000000000000000000000000 (size!32121 (_keys!11612 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1042290 (= lt!459267 (array!65656 (store (arr!31584 (_keys!11612 thiss!1427)) (index!41632 lt!459268) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32121 (_keys!11612 thiss!1427))))))

(declare-fun lt!459270 () Unit!33933)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65655 (_ BitVec 32) (_ BitVec 64)) Unit!33933)

(assert (=> b!1042290 (= lt!459270 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11612 thiss!1427) (index!41632 lt!459268) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1042291 () Bool)

(assert (=> b!1042291 (= e!590413 (arrayNoDuplicates!0 (_keys!11612 thiss!1427) #b00000000000000000000000000000000 Nil!22009))))

(assert (= (and start!91514 res!694527) b!1042285))

(assert (= (and b!1042285 res!694523) b!1042287))

(assert (= (and b!1042287 res!694525) b!1042290))

(assert (= (and b!1042290 (not res!694522)) b!1042282))

(assert (= (and b!1042282 (not res!694524)) b!1042284))

(assert (= (and b!1042284 (not res!694526)) b!1042291))

(assert (= (and b!1042283 condMapEmpty!38780) mapIsEmpty!38780))

(assert (= (and b!1042283 (not condMapEmpty!38780)) mapNonEmpty!38780))

(assert (= (and mapNonEmpty!38780 ((_ is ValueCellFull!11687) mapValue!38780)) b!1042288))

(assert (= (and b!1042283 ((_ is ValueCellFull!11687) mapDefault!38780)) b!1042289))

(assert (= b!1042286 b!1042283))

(assert (= start!91514 b!1042286))

(declare-fun m!961119 () Bool)

(assert (=> b!1042286 m!961119))

(declare-fun m!961121 () Bool)

(assert (=> b!1042286 m!961121))

(declare-fun m!961123 () Bool)

(assert (=> b!1042287 m!961123))

(declare-fun m!961125 () Bool)

(assert (=> b!1042291 m!961125))

(declare-fun m!961127 () Bool)

(assert (=> mapNonEmpty!38780 m!961127))

(declare-fun m!961129 () Bool)

(assert (=> start!91514 m!961129))

(declare-fun m!961131 () Bool)

(assert (=> b!1042284 m!961131))

(declare-fun m!961133 () Bool)

(assert (=> b!1042290 m!961133))

(declare-fun m!961135 () Bool)

(assert (=> b!1042290 m!961135))

(declare-fun m!961137 () Bool)

(assert (=> b!1042290 m!961137))

(declare-fun m!961139 () Bool)

(assert (=> b!1042290 m!961139))

(declare-fun m!961141 () Bool)

(assert (=> b!1042290 m!961141))

(declare-fun m!961143 () Bool)

(assert (=> b!1042290 m!961143))

(declare-fun m!961145 () Bool)

(assert (=> b!1042290 m!961145))

(declare-fun m!961147 () Bool)

(assert (=> b!1042290 m!961147))

(declare-fun m!961149 () Bool)

(assert (=> b!1042290 m!961149))

(declare-fun m!961151 () Bool)

(assert (=> b!1042290 m!961151))

(declare-fun m!961153 () Bool)

(assert (=> b!1042290 m!961153))

(check-sat (not b!1042286) b_and!33567 (not b!1042291) tp_is_empty!24781 (not b!1042284) (not b!1042290) (not start!91514) (not mapNonEmpty!38780) (not b!1042287) (not b_next!21061))
(check-sat b_and!33567 (not b_next!21061))
(get-model)

(declare-fun d!125967 () Bool)

(assert (=> d!125967 (= (array_inv!24409 (_keys!11612 thiss!1427)) (bvsge (size!32121 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042286 d!125967))

(declare-fun d!125969 () Bool)

(assert (=> d!125969 (= (array_inv!24410 (_values!6389 thiss!1427)) (bvsge (size!32122 (_values!6389 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042286 d!125969))

(declare-fun d!125971 () Bool)

(declare-fun res!694568 () Bool)

(declare-fun e!590467 () Bool)

(assert (=> d!125971 (=> res!694568 e!590467)))

(assert (=> d!125971 (= res!694568 (= (select (arr!31584 lt!459267) #b00000000000000000000000000000000) key!909))))

(assert (=> d!125971 (= (arrayContainsKey!0 lt!459267 key!909 #b00000000000000000000000000000000) e!590467)))

(declare-fun b!1042356 () Bool)

(declare-fun e!590468 () Bool)

(assert (=> b!1042356 (= e!590467 e!590468)))

(declare-fun res!694569 () Bool)

(assert (=> b!1042356 (=> (not res!694569) (not e!590468))))

(assert (=> b!1042356 (= res!694569 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32121 lt!459267)))))

(declare-fun b!1042357 () Bool)

(assert (=> b!1042357 (= e!590468 (arrayContainsKey!0 lt!459267 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125971 (not res!694568)) b!1042356))

(assert (= (and b!1042356 res!694569) b!1042357))

(declare-fun m!961227 () Bool)

(assert (=> d!125971 m!961227))

(declare-fun m!961229 () Bool)

(assert (=> b!1042357 m!961229))

(assert (=> b!1042290 d!125971))

(declare-fun b!1042368 () Bool)

(declare-fun e!590478 () Bool)

(declare-fun contains!6038 (List!22012 (_ BitVec 64)) Bool)

(assert (=> b!1042368 (= e!590478 (contains!6038 Nil!22009 (select (arr!31584 lt!459267) #b00000000000000000000000000000000)))))

(declare-fun b!1042369 () Bool)

(declare-fun e!590480 () Bool)

(declare-fun e!590477 () Bool)

(assert (=> b!1042369 (= e!590480 e!590477)))

(declare-fun res!694578 () Bool)

(assert (=> b!1042369 (=> (not res!694578) (not e!590477))))

(assert (=> b!1042369 (= res!694578 (not e!590478))))

(declare-fun res!694576 () Bool)

(assert (=> b!1042369 (=> (not res!694576) (not e!590478))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1042369 (= res!694576 (validKeyInArray!0 (select (arr!31584 lt!459267) #b00000000000000000000000000000000)))))

(declare-fun b!1042370 () Bool)

(declare-fun e!590479 () Bool)

(assert (=> b!1042370 (= e!590477 e!590479)))

(declare-fun c!105796 () Bool)

(assert (=> b!1042370 (= c!105796 (validKeyInArray!0 (select (arr!31584 lt!459267) #b00000000000000000000000000000000)))))

(declare-fun d!125973 () Bool)

(declare-fun res!694577 () Bool)

(assert (=> d!125973 (=> res!694577 e!590480)))

(assert (=> d!125973 (= res!694577 (bvsge #b00000000000000000000000000000000 (size!32121 lt!459267)))))

(assert (=> d!125973 (= (arrayNoDuplicates!0 lt!459267 #b00000000000000000000000000000000 Nil!22009) e!590480)))

(declare-fun bm!44151 () Bool)

(declare-fun call!44154 () Bool)

(assert (=> bm!44151 (= call!44154 (arrayNoDuplicates!0 lt!459267 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105796 (Cons!22008 (select (arr!31584 lt!459267) #b00000000000000000000000000000000) Nil!22009) Nil!22009)))))

(declare-fun b!1042371 () Bool)

(assert (=> b!1042371 (= e!590479 call!44154)))

(declare-fun b!1042372 () Bool)

(assert (=> b!1042372 (= e!590479 call!44154)))

(assert (= (and d!125973 (not res!694577)) b!1042369))

(assert (= (and b!1042369 res!694576) b!1042368))

(assert (= (and b!1042369 res!694578) b!1042370))

(assert (= (and b!1042370 c!105796) b!1042372))

(assert (= (and b!1042370 (not c!105796)) b!1042371))

(assert (= (or b!1042372 b!1042371) bm!44151))

(assert (=> b!1042368 m!961227))

(assert (=> b!1042368 m!961227))

(declare-fun m!961231 () Bool)

(assert (=> b!1042368 m!961231))

(assert (=> b!1042369 m!961227))

(assert (=> b!1042369 m!961227))

(declare-fun m!961233 () Bool)

(assert (=> b!1042369 m!961233))

(assert (=> b!1042370 m!961227))

(assert (=> b!1042370 m!961227))

(assert (=> b!1042370 m!961233))

(assert (=> bm!44151 m!961227))

(declare-fun m!961235 () Bool)

(assert (=> bm!44151 m!961235))

(assert (=> b!1042290 d!125973))

(declare-fun d!125975 () Bool)

(declare-fun e!590483 () Bool)

(assert (=> d!125975 e!590483))

(declare-fun res!694581 () Bool)

(assert (=> d!125975 (=> (not res!694581) (not e!590483))))

(assert (=> d!125975 (= res!694581 (and (bvsge (index!41632 lt!459268) #b00000000000000000000000000000000) (bvslt (index!41632 lt!459268) (size!32121 (_keys!11612 thiss!1427)))))))

(declare-fun lt!459310 () Unit!33933)

(declare-fun choose!25 (array!65655 (_ BitVec 32) (_ BitVec 32)) Unit!33933)

(assert (=> d!125975 (= lt!459310 (choose!25 (_keys!11612 thiss!1427) (index!41632 lt!459268) (mask!30424 thiss!1427)))))

(assert (=> d!125975 (validMask!0 (mask!30424 thiss!1427))))

(assert (=> d!125975 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11612 thiss!1427) (index!41632 lt!459268) (mask!30424 thiss!1427)) lt!459310)))

(declare-fun b!1042375 () Bool)

(assert (=> b!1042375 (= e!590483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65656 (store (arr!31584 (_keys!11612 thiss!1427)) (index!41632 lt!459268) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32121 (_keys!11612 thiss!1427))) (mask!30424 thiss!1427)))))

(assert (= (and d!125975 res!694581) b!1042375))

(declare-fun m!961237 () Bool)

(assert (=> d!125975 m!961237))

(assert (=> d!125975 m!961139))

(assert (=> b!1042375 m!961149))

(declare-fun m!961239 () Bool)

(assert (=> b!1042375 m!961239))

(assert (=> b!1042290 d!125975))

(declare-fun d!125977 () Bool)

(assert (=> d!125977 (= (validMask!0 (mask!30424 thiss!1427)) (and (or (= (mask!30424 thiss!1427) #b00000000000000000000000000000111) (= (mask!30424 thiss!1427) #b00000000000000000000000000001111) (= (mask!30424 thiss!1427) #b00000000000000000000000000011111) (= (mask!30424 thiss!1427) #b00000000000000000000000000111111) (= (mask!30424 thiss!1427) #b00000000000000000000000001111111) (= (mask!30424 thiss!1427) #b00000000000000000000000011111111) (= (mask!30424 thiss!1427) #b00000000000000000000000111111111) (= (mask!30424 thiss!1427) #b00000000000000000000001111111111) (= (mask!30424 thiss!1427) #b00000000000000000000011111111111) (= (mask!30424 thiss!1427) #b00000000000000000000111111111111) (= (mask!30424 thiss!1427) #b00000000000000000001111111111111) (= (mask!30424 thiss!1427) #b00000000000000000011111111111111) (= (mask!30424 thiss!1427) #b00000000000000000111111111111111) (= (mask!30424 thiss!1427) #b00000000000000001111111111111111) (= (mask!30424 thiss!1427) #b00000000000000011111111111111111) (= (mask!30424 thiss!1427) #b00000000000000111111111111111111) (= (mask!30424 thiss!1427) #b00000000000001111111111111111111) (= (mask!30424 thiss!1427) #b00000000000011111111111111111111) (= (mask!30424 thiss!1427) #b00000000000111111111111111111111) (= (mask!30424 thiss!1427) #b00000000001111111111111111111111) (= (mask!30424 thiss!1427) #b00000000011111111111111111111111) (= (mask!30424 thiss!1427) #b00000000111111111111111111111111) (= (mask!30424 thiss!1427) #b00000001111111111111111111111111) (= (mask!30424 thiss!1427) #b00000011111111111111111111111111) (= (mask!30424 thiss!1427) #b00000111111111111111111111111111) (= (mask!30424 thiss!1427) #b00001111111111111111111111111111) (= (mask!30424 thiss!1427) #b00011111111111111111111111111111) (= (mask!30424 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30424 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1042290 d!125977))

(declare-fun b!1042386 () Bool)

(declare-fun e!590488 () Bool)

(assert (=> b!1042386 (= e!590488 (bvslt (size!32121 (_keys!11612 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun d!125979 () Bool)

(declare-fun e!590489 () Bool)

(assert (=> d!125979 e!590489))

(declare-fun res!694590 () Bool)

(assert (=> d!125979 (=> (not res!694590) (not e!590489))))

(assert (=> d!125979 (= res!694590 (and (bvsge (index!41632 lt!459268) #b00000000000000000000000000000000) (bvslt (index!41632 lt!459268) (size!32121 (_keys!11612 thiss!1427)))))))

(declare-fun lt!459313 () Unit!33933)

(declare-fun choose!82 (array!65655 (_ BitVec 32) (_ BitVec 64)) Unit!33933)

(assert (=> d!125979 (= lt!459313 (choose!82 (_keys!11612 thiss!1427) (index!41632 lt!459268) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125979 e!590488))

(declare-fun res!694593 () Bool)

(assert (=> d!125979 (=> (not res!694593) (not e!590488))))

(assert (=> d!125979 (= res!694593 (and (bvsge (index!41632 lt!459268) #b00000000000000000000000000000000) (bvslt (index!41632 lt!459268) (size!32121 (_keys!11612 thiss!1427)))))))

(assert (=> d!125979 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11612 thiss!1427) (index!41632 lt!459268) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459313)))

(declare-fun b!1042384 () Bool)

(declare-fun res!694591 () Bool)

(assert (=> b!1042384 (=> (not res!694591) (not e!590488))))

(assert (=> b!1042384 (= res!694591 (validKeyInArray!0 (select (arr!31584 (_keys!11612 thiss!1427)) (index!41632 lt!459268))))))

(declare-fun b!1042385 () Bool)

(declare-fun res!694592 () Bool)

(assert (=> b!1042385 (=> (not res!694592) (not e!590488))))

(assert (=> b!1042385 (= res!694592 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1042387 () Bool)

(assert (=> b!1042387 (= e!590489 (= (arrayCountValidKeys!0 (array!65656 (store (arr!31584 (_keys!11612 thiss!1427)) (index!41632 lt!459268) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32121 (_keys!11612 thiss!1427))) #b00000000000000000000000000000000 (size!32121 (_keys!11612 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11612 thiss!1427) #b00000000000000000000000000000000 (size!32121 (_keys!11612 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!125979 res!694593) b!1042384))

(assert (= (and b!1042384 res!694591) b!1042385))

(assert (= (and b!1042385 res!694592) b!1042386))

(assert (= (and d!125979 res!694590) b!1042387))

(declare-fun m!961241 () Bool)

(assert (=> d!125979 m!961241))

(declare-fun m!961243 () Bool)

(assert (=> b!1042384 m!961243))

(assert (=> b!1042384 m!961243))

(declare-fun m!961245 () Bool)

(assert (=> b!1042384 m!961245))

(declare-fun m!961247 () Bool)

(assert (=> b!1042385 m!961247))

(assert (=> b!1042387 m!961149))

(declare-fun m!961249 () Bool)

(assert (=> b!1042387 m!961249))

(assert (=> b!1042387 m!961143))

(assert (=> b!1042290 d!125979))

(declare-fun d!125981 () Bool)

(declare-fun e!590492 () Bool)

(assert (=> d!125981 e!590492))

(declare-fun res!694596 () Bool)

(assert (=> d!125981 (=> (not res!694596) (not e!590492))))

(assert (=> d!125981 (= res!694596 (and (bvsge (index!41632 lt!459268) #b00000000000000000000000000000000) (bvslt (index!41632 lt!459268) (size!32121 (_keys!11612 thiss!1427)))))))

(declare-fun lt!459316 () Unit!33933)

(declare-fun choose!53 (array!65655 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22012) Unit!33933)

(assert (=> d!125981 (= lt!459316 (choose!53 (_keys!11612 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41632 lt!459268) #b00000000000000000000000000000000 Nil!22009))))

(assert (=> d!125981 (bvslt (size!32121 (_keys!11612 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125981 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11612 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41632 lt!459268) #b00000000000000000000000000000000 Nil!22009) lt!459316)))

(declare-fun b!1042390 () Bool)

(assert (=> b!1042390 (= e!590492 (arrayNoDuplicates!0 (array!65656 (store (arr!31584 (_keys!11612 thiss!1427)) (index!41632 lt!459268) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32121 (_keys!11612 thiss!1427))) #b00000000000000000000000000000000 Nil!22009))))

(assert (= (and d!125981 res!694596) b!1042390))

(declare-fun m!961251 () Bool)

(assert (=> d!125981 m!961251))

(assert (=> b!1042390 m!961149))

(declare-fun m!961253 () Bool)

(assert (=> b!1042390 m!961253))

(assert (=> b!1042290 d!125981))

(declare-fun b!1042399 () Bool)

(declare-fun e!590498 () (_ BitVec 32))

(declare-fun call!44157 () (_ BitVec 32))

(assert (=> b!1042399 (= e!590498 (bvadd #b00000000000000000000000000000001 call!44157))))

(declare-fun bm!44154 () Bool)

(assert (=> bm!44154 (= call!44157 (arrayCountValidKeys!0 (_keys!11612 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32121 (_keys!11612 thiss!1427))))))

(declare-fun b!1042400 () Bool)

(declare-fun e!590497 () (_ BitVec 32))

(assert (=> b!1042400 (= e!590497 #b00000000000000000000000000000000)))

(declare-fun b!1042401 () Bool)

(assert (=> b!1042401 (= e!590497 e!590498)))

(declare-fun c!105801 () Bool)

(assert (=> b!1042401 (= c!105801 (validKeyInArray!0 (select (arr!31584 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042402 () Bool)

(assert (=> b!1042402 (= e!590498 call!44157)))

(declare-fun d!125983 () Bool)

(declare-fun lt!459319 () (_ BitVec 32))

(assert (=> d!125983 (and (bvsge lt!459319 #b00000000000000000000000000000000) (bvsle lt!459319 (bvsub (size!32121 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125983 (= lt!459319 e!590497)))

(declare-fun c!105802 () Bool)

(assert (=> d!125983 (= c!105802 (bvsge #b00000000000000000000000000000000 (size!32121 (_keys!11612 thiss!1427))))))

(assert (=> d!125983 (and (bvsle #b00000000000000000000000000000000 (size!32121 (_keys!11612 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32121 (_keys!11612 thiss!1427)) (size!32121 (_keys!11612 thiss!1427))))))

(assert (=> d!125983 (= (arrayCountValidKeys!0 (_keys!11612 thiss!1427) #b00000000000000000000000000000000 (size!32121 (_keys!11612 thiss!1427))) lt!459319)))

(assert (= (and d!125983 c!105802) b!1042400))

(assert (= (and d!125983 (not c!105802)) b!1042401))

(assert (= (and b!1042401 c!105801) b!1042399))

(assert (= (and b!1042401 (not c!105801)) b!1042402))

(assert (= (or b!1042399 b!1042402) bm!44154))

(declare-fun m!961255 () Bool)

(assert (=> bm!44154 m!961255))

(declare-fun m!961257 () Bool)

(assert (=> b!1042401 m!961257))

(assert (=> b!1042401 m!961257))

(declare-fun m!961259 () Bool)

(assert (=> b!1042401 m!961259))

(assert (=> b!1042290 d!125983))

(declare-fun d!125985 () Bool)

(declare-fun res!694601 () Bool)

(declare-fun e!590506 () Bool)

(assert (=> d!125985 (=> res!694601 e!590506)))

(assert (=> d!125985 (= res!694601 (bvsge #b00000000000000000000000000000000 (size!32121 lt!459267)))))

(assert (=> d!125985 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459267 (mask!30424 thiss!1427)) e!590506)))

(declare-fun b!1042411 () Bool)

(declare-fun e!590507 () Bool)

(declare-fun e!590505 () Bool)

(assert (=> b!1042411 (= e!590507 e!590505)))

(declare-fun lt!459328 () (_ BitVec 64))

(assert (=> b!1042411 (= lt!459328 (select (arr!31584 lt!459267) #b00000000000000000000000000000000))))

(declare-fun lt!459327 () Unit!33933)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65655 (_ BitVec 64) (_ BitVec 32)) Unit!33933)

(assert (=> b!1042411 (= lt!459327 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459267 lt!459328 #b00000000000000000000000000000000))))

(assert (=> b!1042411 (arrayContainsKey!0 lt!459267 lt!459328 #b00000000000000000000000000000000)))

(declare-fun lt!459326 () Unit!33933)

(assert (=> b!1042411 (= lt!459326 lt!459327)))

(declare-fun res!694602 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65655 (_ BitVec 32)) SeekEntryResult!9815)

(assert (=> b!1042411 (= res!694602 (= (seekEntryOrOpen!0 (select (arr!31584 lt!459267) #b00000000000000000000000000000000) lt!459267 (mask!30424 thiss!1427)) (Found!9815 #b00000000000000000000000000000000)))))

(assert (=> b!1042411 (=> (not res!694602) (not e!590505))))

(declare-fun b!1042412 () Bool)

(declare-fun call!44160 () Bool)

(assert (=> b!1042412 (= e!590505 call!44160)))

(declare-fun b!1042413 () Bool)

(assert (=> b!1042413 (= e!590507 call!44160)))

(declare-fun b!1042414 () Bool)

(assert (=> b!1042414 (= e!590506 e!590507)))

(declare-fun c!105805 () Bool)

(assert (=> b!1042414 (= c!105805 (validKeyInArray!0 (select (arr!31584 lt!459267) #b00000000000000000000000000000000)))))

(declare-fun bm!44157 () Bool)

(assert (=> bm!44157 (= call!44160 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459267 (mask!30424 thiss!1427)))))

(assert (= (and d!125985 (not res!694601)) b!1042414))

(assert (= (and b!1042414 c!105805) b!1042411))

(assert (= (and b!1042414 (not c!105805)) b!1042413))

(assert (= (and b!1042411 res!694602) b!1042412))

(assert (= (or b!1042412 b!1042413) bm!44157))

(assert (=> b!1042411 m!961227))

(declare-fun m!961261 () Bool)

(assert (=> b!1042411 m!961261))

(declare-fun m!961263 () Bool)

(assert (=> b!1042411 m!961263))

(assert (=> b!1042411 m!961227))

(declare-fun m!961265 () Bool)

(assert (=> b!1042411 m!961265))

(assert (=> b!1042414 m!961227))

(assert (=> b!1042414 m!961227))

(assert (=> b!1042414 m!961233))

(declare-fun m!961267 () Bool)

(assert (=> bm!44157 m!961267))

(assert (=> b!1042290 d!125985))

(declare-fun d!125987 () Bool)

(declare-fun e!590510 () Bool)

(assert (=> d!125987 e!590510))

(declare-fun res!694605 () Bool)

(assert (=> d!125987 (=> (not res!694605) (not e!590510))))

(assert (=> d!125987 (= res!694605 (bvslt (index!41632 lt!459268) (size!32121 (_keys!11612 thiss!1427))))))

(declare-fun lt!459331 () Unit!33933)

(declare-fun choose!121 (array!65655 (_ BitVec 32) (_ BitVec 64)) Unit!33933)

(assert (=> d!125987 (= lt!459331 (choose!121 (_keys!11612 thiss!1427) (index!41632 lt!459268) key!909))))

(assert (=> d!125987 (bvsge (index!41632 lt!459268) #b00000000000000000000000000000000)))

(assert (=> d!125987 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11612 thiss!1427) (index!41632 lt!459268) key!909) lt!459331)))

(declare-fun b!1042417 () Bool)

(assert (=> b!1042417 (= e!590510 (not (arrayContainsKey!0 (array!65656 (store (arr!31584 (_keys!11612 thiss!1427)) (index!41632 lt!459268) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32121 (_keys!11612 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!125987 res!694605) b!1042417))

(declare-fun m!961269 () Bool)

(assert (=> d!125987 m!961269))

(assert (=> b!1042417 m!961149))

(declare-fun m!961271 () Bool)

(assert (=> b!1042417 m!961271))

(assert (=> b!1042290 d!125987))

(declare-fun b!1042418 () Bool)

(declare-fun e!590512 () (_ BitVec 32))

(declare-fun call!44161 () (_ BitVec 32))

(assert (=> b!1042418 (= e!590512 (bvadd #b00000000000000000000000000000001 call!44161))))

(declare-fun bm!44158 () Bool)

(assert (=> bm!44158 (= call!44161 (arrayCountValidKeys!0 lt!459267 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32121 (_keys!11612 thiss!1427))))))

(declare-fun b!1042419 () Bool)

(declare-fun e!590511 () (_ BitVec 32))

(assert (=> b!1042419 (= e!590511 #b00000000000000000000000000000000)))

(declare-fun b!1042420 () Bool)

(assert (=> b!1042420 (= e!590511 e!590512)))

(declare-fun c!105806 () Bool)

(assert (=> b!1042420 (= c!105806 (validKeyInArray!0 (select (arr!31584 lt!459267) #b00000000000000000000000000000000)))))

(declare-fun b!1042421 () Bool)

(assert (=> b!1042421 (= e!590512 call!44161)))

(declare-fun d!125989 () Bool)

(declare-fun lt!459332 () (_ BitVec 32))

(assert (=> d!125989 (and (bvsge lt!459332 #b00000000000000000000000000000000) (bvsle lt!459332 (bvsub (size!32121 lt!459267) #b00000000000000000000000000000000)))))

(assert (=> d!125989 (= lt!459332 e!590511)))

(declare-fun c!105807 () Bool)

(assert (=> d!125989 (= c!105807 (bvsge #b00000000000000000000000000000000 (size!32121 (_keys!11612 thiss!1427))))))

(assert (=> d!125989 (and (bvsle #b00000000000000000000000000000000 (size!32121 (_keys!11612 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32121 (_keys!11612 thiss!1427)) (size!32121 lt!459267)))))

(assert (=> d!125989 (= (arrayCountValidKeys!0 lt!459267 #b00000000000000000000000000000000 (size!32121 (_keys!11612 thiss!1427))) lt!459332)))

(assert (= (and d!125989 c!105807) b!1042419))

(assert (= (and d!125989 (not c!105807)) b!1042420))

(assert (= (and b!1042420 c!105806) b!1042418))

(assert (= (and b!1042420 (not c!105806)) b!1042421))

(assert (= (or b!1042418 b!1042421) bm!44158))

(declare-fun m!961273 () Bool)

(assert (=> bm!44158 m!961273))

(assert (=> b!1042420 m!961227))

(assert (=> b!1042420 m!961227))

(assert (=> b!1042420 m!961233))

(assert (=> b!1042290 d!125989))

(declare-fun b!1042422 () Bool)

(declare-fun e!590514 () Bool)

(assert (=> b!1042422 (= e!590514 (contains!6038 Nil!22009 (select (arr!31584 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042423 () Bool)

(declare-fun e!590516 () Bool)

(declare-fun e!590513 () Bool)

(assert (=> b!1042423 (= e!590516 e!590513)))

(declare-fun res!694608 () Bool)

(assert (=> b!1042423 (=> (not res!694608) (not e!590513))))

(assert (=> b!1042423 (= res!694608 (not e!590514))))

(declare-fun res!694606 () Bool)

(assert (=> b!1042423 (=> (not res!694606) (not e!590514))))

(assert (=> b!1042423 (= res!694606 (validKeyInArray!0 (select (arr!31584 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042424 () Bool)

(declare-fun e!590515 () Bool)

(assert (=> b!1042424 (= e!590513 e!590515)))

(declare-fun c!105808 () Bool)

(assert (=> b!1042424 (= c!105808 (validKeyInArray!0 (select (arr!31584 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125991 () Bool)

(declare-fun res!694607 () Bool)

(assert (=> d!125991 (=> res!694607 e!590516)))

(assert (=> d!125991 (= res!694607 (bvsge #b00000000000000000000000000000000 (size!32121 (_keys!11612 thiss!1427))))))

(assert (=> d!125991 (= (arrayNoDuplicates!0 (_keys!11612 thiss!1427) #b00000000000000000000000000000000 Nil!22009) e!590516)))

(declare-fun bm!44159 () Bool)

(declare-fun call!44162 () Bool)

(assert (=> bm!44159 (= call!44162 (arrayNoDuplicates!0 (_keys!11612 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105808 (Cons!22008 (select (arr!31584 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000) Nil!22009) Nil!22009)))))

(declare-fun b!1042425 () Bool)

(assert (=> b!1042425 (= e!590515 call!44162)))

(declare-fun b!1042426 () Bool)

(assert (=> b!1042426 (= e!590515 call!44162)))

(assert (= (and d!125991 (not res!694607)) b!1042423))

(assert (= (and b!1042423 res!694606) b!1042422))

(assert (= (and b!1042423 res!694608) b!1042424))

(assert (= (and b!1042424 c!105808) b!1042426))

(assert (= (and b!1042424 (not c!105808)) b!1042425))

(assert (= (or b!1042426 b!1042425) bm!44159))

(assert (=> b!1042422 m!961257))

(assert (=> b!1042422 m!961257))

(declare-fun m!961275 () Bool)

(assert (=> b!1042422 m!961275))

(assert (=> b!1042423 m!961257))

(assert (=> b!1042423 m!961257))

(assert (=> b!1042423 m!961259))

(assert (=> b!1042424 m!961257))

(assert (=> b!1042424 m!961257))

(assert (=> b!1042424 m!961259))

(assert (=> bm!44159 m!961257))

(declare-fun m!961277 () Bool)

(assert (=> bm!44159 m!961277))

(assert (=> b!1042291 d!125991))

(declare-fun d!125993 () Bool)

(declare-fun res!694615 () Bool)

(declare-fun e!590519 () Bool)

(assert (=> d!125993 (=> (not res!694615) (not e!590519))))

(declare-fun simpleValid!442 (LongMapFixedSize!5968) Bool)

(assert (=> d!125993 (= res!694615 (simpleValid!442 thiss!1427))))

(assert (=> d!125993 (= (valid!2232 thiss!1427) e!590519)))

(declare-fun b!1042433 () Bool)

(declare-fun res!694616 () Bool)

(assert (=> b!1042433 (=> (not res!694616) (not e!590519))))

(assert (=> b!1042433 (= res!694616 (= (arrayCountValidKeys!0 (_keys!11612 thiss!1427) #b00000000000000000000000000000000 (size!32121 (_keys!11612 thiss!1427))) (_size!3039 thiss!1427)))))

(declare-fun b!1042434 () Bool)

(declare-fun res!694617 () Bool)

(assert (=> b!1042434 (=> (not res!694617) (not e!590519))))

(assert (=> b!1042434 (= res!694617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11612 thiss!1427) (mask!30424 thiss!1427)))))

(declare-fun b!1042435 () Bool)

(assert (=> b!1042435 (= e!590519 (arrayNoDuplicates!0 (_keys!11612 thiss!1427) #b00000000000000000000000000000000 Nil!22009))))

(assert (= (and d!125993 res!694615) b!1042433))

(assert (= (and b!1042433 res!694616) b!1042434))

(assert (= (and b!1042434 res!694617) b!1042435))

(declare-fun m!961279 () Bool)

(assert (=> d!125993 m!961279))

(assert (=> b!1042433 m!961143))

(assert (=> b!1042434 m!961131))

(assert (=> b!1042435 m!961125))

(assert (=> start!91514 d!125993))

(declare-fun b!1042448 () Bool)

(declare-fun e!590528 () SeekEntryResult!9815)

(declare-fun e!590527 () SeekEntryResult!9815)

(assert (=> b!1042448 (= e!590528 e!590527)))

(declare-fun lt!459342 () (_ BitVec 64))

(declare-fun lt!459344 () SeekEntryResult!9815)

(assert (=> b!1042448 (= lt!459342 (select (arr!31584 (_keys!11612 thiss!1427)) (index!41633 lt!459344)))))

(declare-fun c!105815 () Bool)

(assert (=> b!1042448 (= c!105815 (= lt!459342 key!909))))

(declare-fun b!1042449 () Bool)

(assert (=> b!1042449 (= e!590528 Undefined!9815)))

(declare-fun d!125995 () Bool)

(declare-fun lt!459341 () SeekEntryResult!9815)

(assert (=> d!125995 (and (or ((_ is MissingVacant!9815) lt!459341) (not ((_ is Found!9815) lt!459341)) (and (bvsge (index!41632 lt!459341) #b00000000000000000000000000000000) (bvslt (index!41632 lt!459341) (size!32121 (_keys!11612 thiss!1427))))) (not ((_ is MissingVacant!9815) lt!459341)) (or (not ((_ is Found!9815) lt!459341)) (= (select (arr!31584 (_keys!11612 thiss!1427)) (index!41632 lt!459341)) key!909)))))

(assert (=> d!125995 (= lt!459341 e!590528)))

(declare-fun c!105817 () Bool)

(assert (=> d!125995 (= c!105817 (and ((_ is Intermediate!9815) lt!459344) (undefined!10627 lt!459344)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65655 (_ BitVec 32)) SeekEntryResult!9815)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125995 (= lt!459344 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30424 thiss!1427)) key!909 (_keys!11612 thiss!1427) (mask!30424 thiss!1427)))))

(assert (=> d!125995 (validMask!0 (mask!30424 thiss!1427))))

(assert (=> d!125995 (= (seekEntry!0 key!909 (_keys!11612 thiss!1427) (mask!30424 thiss!1427)) lt!459341)))

(declare-fun b!1042450 () Bool)

(assert (=> b!1042450 (= e!590527 (Found!9815 (index!41633 lt!459344)))))

(declare-fun b!1042451 () Bool)

(declare-fun c!105816 () Bool)

(assert (=> b!1042451 (= c!105816 (= lt!459342 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!590526 () SeekEntryResult!9815)

(assert (=> b!1042451 (= e!590527 e!590526)))

(declare-fun b!1042452 () Bool)

(declare-fun lt!459343 () SeekEntryResult!9815)

(assert (=> b!1042452 (= e!590526 (ite ((_ is MissingVacant!9815) lt!459343) (MissingZero!9815 (index!41634 lt!459343)) lt!459343))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65655 (_ BitVec 32)) SeekEntryResult!9815)

(assert (=> b!1042452 (= lt!459343 (seekKeyOrZeroReturnVacant!0 (x!93064 lt!459344) (index!41633 lt!459344) (index!41633 lt!459344) key!909 (_keys!11612 thiss!1427) (mask!30424 thiss!1427)))))

(declare-fun b!1042453 () Bool)

(assert (=> b!1042453 (= e!590526 (MissingZero!9815 (index!41633 lt!459344)))))

(assert (= (and d!125995 c!105817) b!1042449))

(assert (= (and d!125995 (not c!105817)) b!1042448))

(assert (= (and b!1042448 c!105815) b!1042450))

(assert (= (and b!1042448 (not c!105815)) b!1042451))

(assert (= (and b!1042451 c!105816) b!1042453))

(assert (= (and b!1042451 (not c!105816)) b!1042452))

(declare-fun m!961281 () Bool)

(assert (=> b!1042448 m!961281))

(declare-fun m!961283 () Bool)

(assert (=> d!125995 m!961283))

(declare-fun m!961285 () Bool)

(assert (=> d!125995 m!961285))

(assert (=> d!125995 m!961285))

(declare-fun m!961287 () Bool)

(assert (=> d!125995 m!961287))

(assert (=> d!125995 m!961139))

(declare-fun m!961289 () Bool)

(assert (=> b!1042452 m!961289))

(assert (=> b!1042287 d!125995))

(declare-fun d!125997 () Bool)

(declare-fun res!694618 () Bool)

(declare-fun e!590530 () Bool)

(assert (=> d!125997 (=> res!694618 e!590530)))

(assert (=> d!125997 (= res!694618 (bvsge #b00000000000000000000000000000000 (size!32121 (_keys!11612 thiss!1427))))))

(assert (=> d!125997 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11612 thiss!1427) (mask!30424 thiss!1427)) e!590530)))

(declare-fun b!1042454 () Bool)

(declare-fun e!590531 () Bool)

(declare-fun e!590529 () Bool)

(assert (=> b!1042454 (= e!590531 e!590529)))

(declare-fun lt!459347 () (_ BitVec 64))

(assert (=> b!1042454 (= lt!459347 (select (arr!31584 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459346 () Unit!33933)

(assert (=> b!1042454 (= lt!459346 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11612 thiss!1427) lt!459347 #b00000000000000000000000000000000))))

(assert (=> b!1042454 (arrayContainsKey!0 (_keys!11612 thiss!1427) lt!459347 #b00000000000000000000000000000000)))

(declare-fun lt!459345 () Unit!33933)

(assert (=> b!1042454 (= lt!459345 lt!459346)))

(declare-fun res!694619 () Bool)

(assert (=> b!1042454 (= res!694619 (= (seekEntryOrOpen!0 (select (arr!31584 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000) (_keys!11612 thiss!1427) (mask!30424 thiss!1427)) (Found!9815 #b00000000000000000000000000000000)))))

(assert (=> b!1042454 (=> (not res!694619) (not e!590529))))

(declare-fun b!1042455 () Bool)

(declare-fun call!44163 () Bool)

(assert (=> b!1042455 (= e!590529 call!44163)))

(declare-fun b!1042456 () Bool)

(assert (=> b!1042456 (= e!590531 call!44163)))

(declare-fun b!1042457 () Bool)

(assert (=> b!1042457 (= e!590530 e!590531)))

(declare-fun c!105818 () Bool)

(assert (=> b!1042457 (= c!105818 (validKeyInArray!0 (select (arr!31584 (_keys!11612 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44160 () Bool)

(assert (=> bm!44160 (= call!44163 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11612 thiss!1427) (mask!30424 thiss!1427)))))

(assert (= (and d!125997 (not res!694618)) b!1042457))

(assert (= (and b!1042457 c!105818) b!1042454))

(assert (= (and b!1042457 (not c!105818)) b!1042456))

(assert (= (and b!1042454 res!694619) b!1042455))

(assert (= (or b!1042455 b!1042456) bm!44160))

(assert (=> b!1042454 m!961257))

(declare-fun m!961291 () Bool)

(assert (=> b!1042454 m!961291))

(declare-fun m!961293 () Bool)

(assert (=> b!1042454 m!961293))

(assert (=> b!1042454 m!961257))

(declare-fun m!961295 () Bool)

(assert (=> b!1042454 m!961295))

(assert (=> b!1042457 m!961257))

(assert (=> b!1042457 m!961257))

(assert (=> b!1042457 m!961259))

(declare-fun m!961297 () Bool)

(assert (=> bm!44160 m!961297))

(assert (=> b!1042284 d!125997))

(declare-fun b!1042465 () Bool)

(declare-fun e!590537 () Bool)

(assert (=> b!1042465 (= e!590537 tp_is_empty!24781)))

(declare-fun mapIsEmpty!38789 () Bool)

(declare-fun mapRes!38789 () Bool)

(assert (=> mapIsEmpty!38789 mapRes!38789))

(declare-fun condMapEmpty!38789 () Bool)

(declare-fun mapDefault!38789 () ValueCell!11687)

(assert (=> mapNonEmpty!38780 (= condMapEmpty!38789 (= mapRest!38780 ((as const (Array (_ BitVec 32) ValueCell!11687)) mapDefault!38789)))))

(assert (=> mapNonEmpty!38780 (= tp!74409 (and e!590537 mapRes!38789))))

(declare-fun mapNonEmpty!38789 () Bool)

(declare-fun tp!74424 () Bool)

(declare-fun e!590536 () Bool)

(assert (=> mapNonEmpty!38789 (= mapRes!38789 (and tp!74424 e!590536))))

(declare-fun mapValue!38789 () ValueCell!11687)

(declare-fun mapKey!38789 () (_ BitVec 32))

(declare-fun mapRest!38789 () (Array (_ BitVec 32) ValueCell!11687))

(assert (=> mapNonEmpty!38789 (= mapRest!38780 (store mapRest!38789 mapKey!38789 mapValue!38789))))

(declare-fun b!1042464 () Bool)

(assert (=> b!1042464 (= e!590536 tp_is_empty!24781)))

(assert (= (and mapNonEmpty!38780 condMapEmpty!38789) mapIsEmpty!38789))

(assert (= (and mapNonEmpty!38780 (not condMapEmpty!38789)) mapNonEmpty!38789))

(assert (= (and mapNonEmpty!38789 ((_ is ValueCellFull!11687) mapValue!38789)) b!1042464))

(assert (= (and mapNonEmpty!38780 ((_ is ValueCellFull!11687) mapDefault!38789)) b!1042465))

(declare-fun m!961299 () Bool)

(assert (=> mapNonEmpty!38789 m!961299))

(check-sat (not b!1042420) (not d!125981) (not b!1042454) (not b!1042414) (not b!1042390) (not b!1042385) (not b!1042452) (not b!1042422) (not d!125993) (not b!1042369) (not mapNonEmpty!38789) (not b!1042357) (not b!1042368) (not b_next!21061) (not b!1042401) (not b!1042435) (not b!1042417) (not b!1042384) (not bm!44157) b_and!33567 (not bm!44158) (not b!1042370) (not b!1042387) (not b!1042375) (not b!1042457) (not d!125975) (not b!1042411) (not d!125987) (not b!1042424) (not b!1042433) tp_is_empty!24781 (not bm!44159) (not b!1042423) (not d!125995) (not bm!44160) (not bm!44154) (not d!125979) (not bm!44151) (not b!1042434))
(check-sat b_and!33567 (not b_next!21061))
