; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91518 () Bool)

(assert start!91518)

(declare-fun b!1042469 () Bool)

(declare-fun b_free!21031 () Bool)

(declare-fun b_next!21031 () Bool)

(assert (=> b!1042469 (= b_free!21031 (not b_next!21031))))

(declare-fun tp!74300 () Bool)

(declare-fun b_and!33573 () Bool)

(assert (=> b!1042469 (= tp!74300 b_and!33573)))

(declare-fun mapNonEmpty!38717 () Bool)

(declare-fun mapRes!38717 () Bool)

(declare-fun tp!74301 () Bool)

(declare-fun e!590411 () Bool)

(assert (=> mapNonEmpty!38717 (= mapRes!38717 (and tp!74301 e!590411))))

(declare-datatypes ((V!37875 0))(
  ( (V!37876 (val!12426 Int)) )
))
(declare-datatypes ((ValueCell!11672 0))(
  ( (ValueCellFull!11672 (v!15010 V!37875)) (EmptyCell!11672) )
))
(declare-fun mapRest!38717 () (Array (_ BitVec 32) ValueCell!11672))

(declare-fun mapKey!38717 () (_ BitVec 32))

(declare-fun mapValue!38717 () ValueCell!11672)

(declare-datatypes ((array!65695 0))(
  ( (array!65696 (arr!31603 (Array (_ BitVec 32) (_ BitVec 64))) (size!32136 (_ BitVec 32))) )
))
(declare-datatypes ((array!65697 0))(
  ( (array!65698 (arr!31604 (Array (_ BitVec 32) ValueCell!11672)) (size!32137 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5938 0))(
  ( (LongMapFixedSize!5939 (defaultEntry!6351 Int) (mask!30429 (_ BitVec 32)) (extraKeys!6079 (_ BitVec 32)) (zeroValue!6185 V!37875) (minValue!6185 V!37875) (_size!3024 (_ BitVec 32)) (_keys!11620 array!65695) (_values!6374 array!65697) (_vacant!3024 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5938)

(assert (=> mapNonEmpty!38717 (= (arr!31604 (_values!6374 thiss!1427)) (store mapRest!38717 mapKey!38717 mapValue!38717))))

(declare-fun b!1042463 () Bool)

(declare-fun e!590413 () Bool)

(declare-fun tp_is_empty!24751 () Bool)

(assert (=> b!1042463 (= e!590413 tp_is_empty!24751)))

(declare-fun mapIsEmpty!38717 () Bool)

(assert (=> mapIsEmpty!38717 mapRes!38717))

(declare-fun b!1042464 () Bool)

(assert (=> b!1042464 (= e!590411 tp_is_empty!24751)))

(declare-fun b!1042465 () Bool)

(declare-fun res!694505 () Bool)

(declare-fun e!590407 () Bool)

(assert (=> b!1042465 (=> (not res!694505) (not e!590407))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1042465 (= res!694505 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1042462 () Bool)

(declare-fun e!590408 () Bool)

(assert (=> b!1042462 (= e!590408 (or (not (= (size!32137 (_values!6374 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30429 thiss!1427)))) (= (size!32136 (_keys!11620 thiss!1427)) (size!32137 (_values!6374 thiss!1427)))))))

(declare-fun res!694503 () Bool)

(assert (=> start!91518 (=> (not res!694503) (not e!590407))))

(declare-fun valid!2238 (LongMapFixedSize!5938) Bool)

(assert (=> start!91518 (= res!694503 (valid!2238 thiss!1427))))

(assert (=> start!91518 e!590407))

(declare-fun e!590410 () Bool)

(assert (=> start!91518 e!590410))

(assert (=> start!91518 true))

(declare-fun b!1042466 () Bool)

(declare-fun e!590414 () Bool)

(assert (=> b!1042466 (= e!590407 e!590414)))

(declare-fun res!694504 () Bool)

(assert (=> b!1042466 (=> (not res!694504) (not e!590414))))

(declare-datatypes ((SeekEntryResult!9760 0))(
  ( (MissingZero!9760 (index!41411 (_ BitVec 32))) (Found!9760 (index!41412 (_ BitVec 32))) (Intermediate!9760 (undefined!10572 Bool) (index!41413 (_ BitVec 32)) (x!92927 (_ BitVec 32))) (Undefined!9760) (MissingVacant!9760 (index!41414 (_ BitVec 32))) )
))
(declare-fun lt!459392 () SeekEntryResult!9760)

(get-info :version)

(assert (=> b!1042466 (= res!694504 ((_ is Found!9760) lt!459392))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65695 (_ BitVec 32)) SeekEntryResult!9760)

(assert (=> b!1042466 (= lt!459392 (seekEntry!0 key!909 (_keys!11620 thiss!1427) (mask!30429 thiss!1427)))))

(declare-fun b!1042467 () Bool)

(declare-fun e!590412 () Bool)

(assert (=> b!1042467 (= e!590412 (and e!590413 mapRes!38717))))

(declare-fun condMapEmpty!38717 () Bool)

(declare-fun mapDefault!38717 () ValueCell!11672)

(assert (=> b!1042467 (= condMapEmpty!38717 (= (arr!31604 (_values!6374 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11672)) mapDefault!38717)))))

(declare-fun b!1042468 () Bool)

(assert (=> b!1042468 (= e!590414 (not e!590408))))

(declare-fun res!694502 () Bool)

(assert (=> b!1042468 (=> res!694502 e!590408)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1042468 (= res!694502 (not (validMask!0 (mask!30429 thiss!1427))))))

(declare-fun lt!459391 () array!65695)

(declare-fun arrayContainsKey!0 (array!65695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1042468 (not (arrayContainsKey!0 lt!459391 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34035 0))(
  ( (Unit!34036) )
))
(declare-fun lt!459389 () Unit!34035)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65695 (_ BitVec 32) (_ BitVec 64)) Unit!34035)

(assert (=> b!1042468 (= lt!459389 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11620 thiss!1427) (index!41412 lt!459392) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65695 (_ BitVec 32)) Bool)

(assert (=> b!1042468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459391 (mask!30429 thiss!1427))))

(declare-fun lt!459390 () Unit!34035)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65695 (_ BitVec 32) (_ BitVec 32)) Unit!34035)

(assert (=> b!1042468 (= lt!459390 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11620 thiss!1427) (index!41412 lt!459392) (mask!30429 thiss!1427)))))

(declare-datatypes ((List!21955 0))(
  ( (Nil!21952) (Cons!21951 (h!23165 (_ BitVec 64)) (t!31161 List!21955)) )
))
(declare-fun arrayNoDuplicates!0 (array!65695 (_ BitVec 32) List!21955) Bool)

(assert (=> b!1042468 (arrayNoDuplicates!0 lt!459391 #b00000000000000000000000000000000 Nil!21952)))

(declare-fun lt!459388 () Unit!34035)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65695 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21955) Unit!34035)

(assert (=> b!1042468 (= lt!459388 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11620 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41412 lt!459392) #b00000000000000000000000000000000 Nil!21952))))

(declare-fun arrayCountValidKeys!0 (array!65695 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1042468 (= (arrayCountValidKeys!0 lt!459391 #b00000000000000000000000000000000 (size!32136 (_keys!11620 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11620 thiss!1427) #b00000000000000000000000000000000 (size!32136 (_keys!11620 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1042468 (= lt!459391 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))))))

(declare-fun lt!459393 () Unit!34035)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65695 (_ BitVec 32) (_ BitVec 64)) Unit!34035)

(assert (=> b!1042468 (= lt!459393 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11620 thiss!1427) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun array_inv!24435 (array!65695) Bool)

(declare-fun array_inv!24436 (array!65697) Bool)

(assert (=> b!1042469 (= e!590410 (and tp!74300 tp_is_empty!24751 (array_inv!24435 (_keys!11620 thiss!1427)) (array_inv!24436 (_values!6374 thiss!1427)) e!590412))))

(assert (= (and start!91518 res!694503) b!1042465))

(assert (= (and b!1042465 res!694505) b!1042466))

(assert (= (and b!1042466 res!694504) b!1042468))

(assert (= (and b!1042468 (not res!694502)) b!1042462))

(assert (= (and b!1042467 condMapEmpty!38717) mapIsEmpty!38717))

(assert (= (and b!1042467 (not condMapEmpty!38717)) mapNonEmpty!38717))

(assert (= (and mapNonEmpty!38717 ((_ is ValueCellFull!11672) mapValue!38717)) b!1042464))

(assert (= (and b!1042467 ((_ is ValueCellFull!11672) mapDefault!38717)) b!1042463))

(assert (= b!1042469 b!1042467))

(assert (= start!91518 b!1042469))

(declare-fun m!962275 () Bool)

(assert (=> start!91518 m!962275))

(declare-fun m!962277 () Bool)

(assert (=> b!1042466 m!962277))

(declare-fun m!962279 () Bool)

(assert (=> b!1042468 m!962279))

(declare-fun m!962281 () Bool)

(assert (=> b!1042468 m!962281))

(declare-fun m!962283 () Bool)

(assert (=> b!1042468 m!962283))

(declare-fun m!962285 () Bool)

(assert (=> b!1042468 m!962285))

(declare-fun m!962287 () Bool)

(assert (=> b!1042468 m!962287))

(declare-fun m!962289 () Bool)

(assert (=> b!1042468 m!962289))

(declare-fun m!962291 () Bool)

(assert (=> b!1042468 m!962291))

(declare-fun m!962293 () Bool)

(assert (=> b!1042468 m!962293))

(declare-fun m!962295 () Bool)

(assert (=> b!1042468 m!962295))

(declare-fun m!962297 () Bool)

(assert (=> b!1042468 m!962297))

(declare-fun m!962299 () Bool)

(assert (=> b!1042468 m!962299))

(declare-fun m!962301 () Bool)

(assert (=> b!1042469 m!962301))

(declare-fun m!962303 () Bool)

(assert (=> b!1042469 m!962303))

(declare-fun m!962305 () Bool)

(assert (=> mapNonEmpty!38717 m!962305))

(check-sat (not b_next!21031) (not b!1042468) tp_is_empty!24751 (not start!91518) (not b!1042469) b_and!33573 (not b!1042466) (not mapNonEmpty!38717))
(check-sat b_and!33573 (not b_next!21031))
(get-model)

(declare-fun d!126265 () Bool)

(declare-fun res!694536 () Bool)

(declare-fun e!590465 () Bool)

(assert (=> d!126265 (=> (not res!694536) (not e!590465))))

(declare-fun simpleValid!437 (LongMapFixedSize!5938) Bool)

(assert (=> d!126265 (= res!694536 (simpleValid!437 thiss!1427))))

(assert (=> d!126265 (= (valid!2238 thiss!1427) e!590465)))

(declare-fun b!1042524 () Bool)

(declare-fun res!694537 () Bool)

(assert (=> b!1042524 (=> (not res!694537) (not e!590465))))

(assert (=> b!1042524 (= res!694537 (= (arrayCountValidKeys!0 (_keys!11620 thiss!1427) #b00000000000000000000000000000000 (size!32136 (_keys!11620 thiss!1427))) (_size!3024 thiss!1427)))))

(declare-fun b!1042525 () Bool)

(declare-fun res!694538 () Bool)

(assert (=> b!1042525 (=> (not res!694538) (not e!590465))))

(assert (=> b!1042525 (= res!694538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11620 thiss!1427) (mask!30429 thiss!1427)))))

(declare-fun b!1042526 () Bool)

(assert (=> b!1042526 (= e!590465 (arrayNoDuplicates!0 (_keys!11620 thiss!1427) #b00000000000000000000000000000000 Nil!21952))))

(assert (= (and d!126265 res!694536) b!1042524))

(assert (= (and b!1042524 res!694537) b!1042525))

(assert (= (and b!1042525 res!694538) b!1042526))

(declare-fun m!962371 () Bool)

(assert (=> d!126265 m!962371))

(assert (=> b!1042524 m!962295))

(declare-fun m!962373 () Bool)

(assert (=> b!1042525 m!962373))

(declare-fun m!962375 () Bool)

(assert (=> b!1042526 m!962375))

(assert (=> start!91518 d!126265))

(declare-fun b!1042539 () Bool)

(declare-fun e!590474 () SeekEntryResult!9760)

(assert (=> b!1042539 (= e!590474 Undefined!9760)))

(declare-fun b!1042540 () Bool)

(declare-fun e!590472 () SeekEntryResult!9760)

(assert (=> b!1042540 (= e!590474 e!590472)))

(declare-fun lt!459439 () (_ BitVec 64))

(declare-fun lt!459441 () SeekEntryResult!9760)

(assert (=> b!1042540 (= lt!459439 (select (arr!31603 (_keys!11620 thiss!1427)) (index!41413 lt!459441)))))

(declare-fun c!106017 () Bool)

(assert (=> b!1042540 (= c!106017 (= lt!459439 key!909))))

(declare-fun b!1042541 () Bool)

(declare-fun e!590473 () SeekEntryResult!9760)

(assert (=> b!1042541 (= e!590473 (MissingZero!9760 (index!41413 lt!459441)))))

(declare-fun b!1042542 () Bool)

(declare-fun lt!459440 () SeekEntryResult!9760)

(assert (=> b!1042542 (= e!590473 (ite ((_ is MissingVacant!9760) lt!459440) (MissingZero!9760 (index!41414 lt!459440)) lt!459440))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65695 (_ BitVec 32)) SeekEntryResult!9760)

(assert (=> b!1042542 (= lt!459440 (seekKeyOrZeroReturnVacant!0 (x!92927 lt!459441) (index!41413 lt!459441) (index!41413 lt!459441) key!909 (_keys!11620 thiss!1427) (mask!30429 thiss!1427)))))

(declare-fun d!126267 () Bool)

(declare-fun lt!459438 () SeekEntryResult!9760)

(assert (=> d!126267 (and (or ((_ is MissingVacant!9760) lt!459438) (not ((_ is Found!9760) lt!459438)) (and (bvsge (index!41412 lt!459438) #b00000000000000000000000000000000) (bvslt (index!41412 lt!459438) (size!32136 (_keys!11620 thiss!1427))))) (not ((_ is MissingVacant!9760) lt!459438)) (or (not ((_ is Found!9760) lt!459438)) (= (select (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459438)) key!909)))))

(assert (=> d!126267 (= lt!459438 e!590474)))

(declare-fun c!106018 () Bool)

(assert (=> d!126267 (= c!106018 (and ((_ is Intermediate!9760) lt!459441) (undefined!10572 lt!459441)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65695 (_ BitVec 32)) SeekEntryResult!9760)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126267 (= lt!459441 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30429 thiss!1427)) key!909 (_keys!11620 thiss!1427) (mask!30429 thiss!1427)))))

(assert (=> d!126267 (validMask!0 (mask!30429 thiss!1427))))

(assert (=> d!126267 (= (seekEntry!0 key!909 (_keys!11620 thiss!1427) (mask!30429 thiss!1427)) lt!459438)))

(declare-fun b!1042543 () Bool)

(declare-fun c!106016 () Bool)

(assert (=> b!1042543 (= c!106016 (= lt!459439 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1042543 (= e!590472 e!590473)))

(declare-fun b!1042544 () Bool)

(assert (=> b!1042544 (= e!590472 (Found!9760 (index!41413 lt!459441)))))

(assert (= (and d!126267 c!106018) b!1042539))

(assert (= (and d!126267 (not c!106018)) b!1042540))

(assert (= (and b!1042540 c!106017) b!1042544))

(assert (= (and b!1042540 (not c!106017)) b!1042543))

(assert (= (and b!1042543 c!106016) b!1042541))

(assert (= (and b!1042543 (not c!106016)) b!1042542))

(declare-fun m!962377 () Bool)

(assert (=> b!1042540 m!962377))

(declare-fun m!962379 () Bool)

(assert (=> b!1042542 m!962379))

(declare-fun m!962381 () Bool)

(assert (=> d!126267 m!962381))

(declare-fun m!962383 () Bool)

(assert (=> d!126267 m!962383))

(assert (=> d!126267 m!962383))

(declare-fun m!962385 () Bool)

(assert (=> d!126267 m!962385))

(assert (=> d!126267 m!962285))

(assert (=> b!1042466 d!126267))

(declare-fun b!1042553 () Bool)

(declare-fun res!694549 () Bool)

(declare-fun e!590480 () Bool)

(assert (=> b!1042553 (=> (not res!694549) (not e!590480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1042553 (= res!694549 (validKeyInArray!0 (select (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392))))))

(declare-fun b!1042554 () Bool)

(declare-fun res!694547 () Bool)

(assert (=> b!1042554 (=> (not res!694547) (not e!590480))))

(assert (=> b!1042554 (= res!694547 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!126269 () Bool)

(declare-fun e!590479 () Bool)

(assert (=> d!126269 e!590479))

(declare-fun res!694550 () Bool)

(assert (=> d!126269 (=> (not res!694550) (not e!590479))))

(assert (=> d!126269 (= res!694550 (and (bvsge (index!41412 lt!459392) #b00000000000000000000000000000000) (bvslt (index!41412 lt!459392) (size!32136 (_keys!11620 thiss!1427)))))))

(declare-fun lt!459444 () Unit!34035)

(declare-fun choose!82 (array!65695 (_ BitVec 32) (_ BitVec 64)) Unit!34035)

(assert (=> d!126269 (= lt!459444 (choose!82 (_keys!11620 thiss!1427) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126269 e!590480))

(declare-fun res!694548 () Bool)

(assert (=> d!126269 (=> (not res!694548) (not e!590480))))

(assert (=> d!126269 (= res!694548 (and (bvsge (index!41412 lt!459392) #b00000000000000000000000000000000) (bvslt (index!41412 lt!459392) (size!32136 (_keys!11620 thiss!1427)))))))

(assert (=> d!126269 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11620 thiss!1427) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459444)))

(declare-fun b!1042556 () Bool)

(assert (=> b!1042556 (= e!590479 (= (arrayCountValidKeys!0 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))) #b00000000000000000000000000000000 (size!32136 (_keys!11620 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11620 thiss!1427) #b00000000000000000000000000000000 (size!32136 (_keys!11620 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1042555 () Bool)

(assert (=> b!1042555 (= e!590480 (bvslt (size!32136 (_keys!11620 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!126269 res!694548) b!1042553))

(assert (= (and b!1042553 res!694549) b!1042554))

(assert (= (and b!1042554 res!694547) b!1042555))

(assert (= (and d!126269 res!694550) b!1042556))

(declare-fun m!962387 () Bool)

(assert (=> b!1042553 m!962387))

(assert (=> b!1042553 m!962387))

(declare-fun m!962389 () Bool)

(assert (=> b!1042553 m!962389))

(declare-fun m!962391 () Bool)

(assert (=> b!1042554 m!962391))

(declare-fun m!962393 () Bool)

(assert (=> d!126269 m!962393))

(assert (=> b!1042556 m!962291))

(declare-fun m!962395 () Bool)

(assert (=> b!1042556 m!962395))

(assert (=> b!1042556 m!962295))

(assert (=> b!1042468 d!126269))

(declare-fun b!1042567 () Bool)

(declare-fun e!590490 () Bool)

(declare-fun e!590489 () Bool)

(assert (=> b!1042567 (= e!590490 e!590489)))

(declare-fun res!694557 () Bool)

(assert (=> b!1042567 (=> (not res!694557) (not e!590489))))

(declare-fun e!590491 () Bool)

(assert (=> b!1042567 (= res!694557 (not e!590491))))

(declare-fun res!694558 () Bool)

(assert (=> b!1042567 (=> (not res!694558) (not e!590491))))

(assert (=> b!1042567 (= res!694558 (validKeyInArray!0 (select (arr!31603 lt!459391) #b00000000000000000000000000000000)))))

(declare-fun b!1042568 () Bool)

(declare-fun e!590492 () Bool)

(assert (=> b!1042568 (= e!590489 e!590492)))

(declare-fun c!106021 () Bool)

(assert (=> b!1042568 (= c!106021 (validKeyInArray!0 (select (arr!31603 lt!459391) #b00000000000000000000000000000000)))))

(declare-fun b!1042569 () Bool)

(declare-fun call!44166 () Bool)

(assert (=> b!1042569 (= e!590492 call!44166)))

(declare-fun bm!44163 () Bool)

(assert (=> bm!44163 (= call!44166 (arrayNoDuplicates!0 lt!459391 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106021 (Cons!21951 (select (arr!31603 lt!459391) #b00000000000000000000000000000000) Nil!21952) Nil!21952)))))

(declare-fun b!1042571 () Bool)

(assert (=> b!1042571 (= e!590492 call!44166)))

(declare-fun d!126271 () Bool)

(declare-fun res!694559 () Bool)

(assert (=> d!126271 (=> res!694559 e!590490)))

(assert (=> d!126271 (= res!694559 (bvsge #b00000000000000000000000000000000 (size!32136 lt!459391)))))

(assert (=> d!126271 (= (arrayNoDuplicates!0 lt!459391 #b00000000000000000000000000000000 Nil!21952) e!590490)))

(declare-fun b!1042570 () Bool)

(declare-fun contains!6079 (List!21955 (_ BitVec 64)) Bool)

(assert (=> b!1042570 (= e!590491 (contains!6079 Nil!21952 (select (arr!31603 lt!459391) #b00000000000000000000000000000000)))))

(assert (= (and d!126271 (not res!694559)) b!1042567))

(assert (= (and b!1042567 res!694558) b!1042570))

(assert (= (and b!1042567 res!694557) b!1042568))

(assert (= (and b!1042568 c!106021) b!1042569))

(assert (= (and b!1042568 (not c!106021)) b!1042571))

(assert (= (or b!1042569 b!1042571) bm!44163))

(declare-fun m!962397 () Bool)

(assert (=> b!1042567 m!962397))

(assert (=> b!1042567 m!962397))

(declare-fun m!962399 () Bool)

(assert (=> b!1042567 m!962399))

(assert (=> b!1042568 m!962397))

(assert (=> b!1042568 m!962397))

(assert (=> b!1042568 m!962399))

(assert (=> bm!44163 m!962397))

(declare-fun m!962401 () Bool)

(assert (=> bm!44163 m!962401))

(assert (=> b!1042570 m!962397))

(assert (=> b!1042570 m!962397))

(declare-fun m!962403 () Bool)

(assert (=> b!1042570 m!962403))

(assert (=> b!1042468 d!126271))

(declare-fun d!126273 () Bool)

(declare-fun e!590495 () Bool)

(assert (=> d!126273 e!590495))

(declare-fun res!694562 () Bool)

(assert (=> d!126273 (=> (not res!694562) (not e!590495))))

(assert (=> d!126273 (= res!694562 (and (bvsge (index!41412 lt!459392) #b00000000000000000000000000000000) (bvslt (index!41412 lt!459392) (size!32136 (_keys!11620 thiss!1427)))))))

(declare-fun lt!459447 () Unit!34035)

(declare-fun choose!25 (array!65695 (_ BitVec 32) (_ BitVec 32)) Unit!34035)

(assert (=> d!126273 (= lt!459447 (choose!25 (_keys!11620 thiss!1427) (index!41412 lt!459392) (mask!30429 thiss!1427)))))

(assert (=> d!126273 (validMask!0 (mask!30429 thiss!1427))))

(assert (=> d!126273 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11620 thiss!1427) (index!41412 lt!459392) (mask!30429 thiss!1427)) lt!459447)))

(declare-fun b!1042574 () Bool)

(assert (=> b!1042574 (= e!590495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))) (mask!30429 thiss!1427)))))

(assert (= (and d!126273 res!694562) b!1042574))

(declare-fun m!962405 () Bool)

(assert (=> d!126273 m!962405))

(assert (=> d!126273 m!962285))

(assert (=> b!1042574 m!962291))

(declare-fun m!962407 () Bool)

(assert (=> b!1042574 m!962407))

(assert (=> b!1042468 d!126273))

(declare-fun d!126275 () Bool)

(assert (=> d!126275 (= (validMask!0 (mask!30429 thiss!1427)) (and (or (= (mask!30429 thiss!1427) #b00000000000000000000000000000111) (= (mask!30429 thiss!1427) #b00000000000000000000000000001111) (= (mask!30429 thiss!1427) #b00000000000000000000000000011111) (= (mask!30429 thiss!1427) #b00000000000000000000000000111111) (= (mask!30429 thiss!1427) #b00000000000000000000000001111111) (= (mask!30429 thiss!1427) #b00000000000000000000000011111111) (= (mask!30429 thiss!1427) #b00000000000000000000000111111111) (= (mask!30429 thiss!1427) #b00000000000000000000001111111111) (= (mask!30429 thiss!1427) #b00000000000000000000011111111111) (= (mask!30429 thiss!1427) #b00000000000000000000111111111111) (= (mask!30429 thiss!1427) #b00000000000000000001111111111111) (= (mask!30429 thiss!1427) #b00000000000000000011111111111111) (= (mask!30429 thiss!1427) #b00000000000000000111111111111111) (= (mask!30429 thiss!1427) #b00000000000000001111111111111111) (= (mask!30429 thiss!1427) #b00000000000000011111111111111111) (= (mask!30429 thiss!1427) #b00000000000000111111111111111111) (= (mask!30429 thiss!1427) #b00000000000001111111111111111111) (= (mask!30429 thiss!1427) #b00000000000011111111111111111111) (= (mask!30429 thiss!1427) #b00000000000111111111111111111111) (= (mask!30429 thiss!1427) #b00000000001111111111111111111111) (= (mask!30429 thiss!1427) #b00000000011111111111111111111111) (= (mask!30429 thiss!1427) #b00000000111111111111111111111111) (= (mask!30429 thiss!1427) #b00000001111111111111111111111111) (= (mask!30429 thiss!1427) #b00000011111111111111111111111111) (= (mask!30429 thiss!1427) #b00000111111111111111111111111111) (= (mask!30429 thiss!1427) #b00001111111111111111111111111111) (= (mask!30429 thiss!1427) #b00011111111111111111111111111111) (= (mask!30429 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30429 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1042468 d!126275))

(declare-fun b!1042583 () Bool)

(declare-fun e!590501 () (_ BitVec 32))

(assert (=> b!1042583 (= e!590501 #b00000000000000000000000000000000)))

(declare-fun d!126277 () Bool)

(declare-fun lt!459450 () (_ BitVec 32))

(assert (=> d!126277 (and (bvsge lt!459450 #b00000000000000000000000000000000) (bvsle lt!459450 (bvsub (size!32136 lt!459391) #b00000000000000000000000000000000)))))

(assert (=> d!126277 (= lt!459450 e!590501)))

(declare-fun c!106026 () Bool)

(assert (=> d!126277 (= c!106026 (bvsge #b00000000000000000000000000000000 (size!32136 (_keys!11620 thiss!1427))))))

(assert (=> d!126277 (and (bvsle #b00000000000000000000000000000000 (size!32136 (_keys!11620 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32136 (_keys!11620 thiss!1427)) (size!32136 lt!459391)))))

(assert (=> d!126277 (= (arrayCountValidKeys!0 lt!459391 #b00000000000000000000000000000000 (size!32136 (_keys!11620 thiss!1427))) lt!459450)))

(declare-fun b!1042584 () Bool)

(declare-fun e!590500 () (_ BitVec 32))

(declare-fun call!44169 () (_ BitVec 32))

(assert (=> b!1042584 (= e!590500 call!44169)))

(declare-fun b!1042585 () Bool)

(assert (=> b!1042585 (= e!590500 (bvadd #b00000000000000000000000000000001 call!44169))))

(declare-fun b!1042586 () Bool)

(assert (=> b!1042586 (= e!590501 e!590500)))

(declare-fun c!106027 () Bool)

(assert (=> b!1042586 (= c!106027 (validKeyInArray!0 (select (arr!31603 lt!459391) #b00000000000000000000000000000000)))))

(declare-fun bm!44166 () Bool)

(assert (=> bm!44166 (= call!44169 (arrayCountValidKeys!0 lt!459391 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32136 (_keys!11620 thiss!1427))))))

(assert (= (and d!126277 c!106026) b!1042583))

(assert (= (and d!126277 (not c!106026)) b!1042586))

(assert (= (and b!1042586 c!106027) b!1042585))

(assert (= (and b!1042586 (not c!106027)) b!1042584))

(assert (= (or b!1042585 b!1042584) bm!44166))

(assert (=> b!1042586 m!962397))

(assert (=> b!1042586 m!962397))

(assert (=> b!1042586 m!962399))

(declare-fun m!962409 () Bool)

(assert (=> bm!44166 m!962409))

(assert (=> b!1042468 d!126277))

(declare-fun b!1042587 () Bool)

(declare-fun e!590503 () (_ BitVec 32))

(assert (=> b!1042587 (= e!590503 #b00000000000000000000000000000000)))

(declare-fun d!126279 () Bool)

(declare-fun lt!459451 () (_ BitVec 32))

(assert (=> d!126279 (and (bvsge lt!459451 #b00000000000000000000000000000000) (bvsle lt!459451 (bvsub (size!32136 (_keys!11620 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126279 (= lt!459451 e!590503)))

(declare-fun c!106028 () Bool)

(assert (=> d!126279 (= c!106028 (bvsge #b00000000000000000000000000000000 (size!32136 (_keys!11620 thiss!1427))))))

(assert (=> d!126279 (and (bvsle #b00000000000000000000000000000000 (size!32136 (_keys!11620 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32136 (_keys!11620 thiss!1427)) (size!32136 (_keys!11620 thiss!1427))))))

(assert (=> d!126279 (= (arrayCountValidKeys!0 (_keys!11620 thiss!1427) #b00000000000000000000000000000000 (size!32136 (_keys!11620 thiss!1427))) lt!459451)))

(declare-fun b!1042588 () Bool)

(declare-fun e!590502 () (_ BitVec 32))

(declare-fun call!44170 () (_ BitVec 32))

(assert (=> b!1042588 (= e!590502 call!44170)))

(declare-fun b!1042589 () Bool)

(assert (=> b!1042589 (= e!590502 (bvadd #b00000000000000000000000000000001 call!44170))))

(declare-fun b!1042590 () Bool)

(assert (=> b!1042590 (= e!590503 e!590502)))

(declare-fun c!106029 () Bool)

(assert (=> b!1042590 (= c!106029 (validKeyInArray!0 (select (arr!31603 (_keys!11620 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44167 () Bool)

(assert (=> bm!44167 (= call!44170 (arrayCountValidKeys!0 (_keys!11620 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32136 (_keys!11620 thiss!1427))))))

(assert (= (and d!126279 c!106028) b!1042587))

(assert (= (and d!126279 (not c!106028)) b!1042590))

(assert (= (and b!1042590 c!106029) b!1042589))

(assert (= (and b!1042590 (not c!106029)) b!1042588))

(assert (= (or b!1042589 b!1042588) bm!44167))

(declare-fun m!962411 () Bool)

(assert (=> b!1042590 m!962411))

(assert (=> b!1042590 m!962411))

(declare-fun m!962413 () Bool)

(assert (=> b!1042590 m!962413))

(declare-fun m!962415 () Bool)

(assert (=> bm!44167 m!962415))

(assert (=> b!1042468 d!126279))

(declare-fun d!126281 () Bool)

(declare-fun e!590506 () Bool)

(assert (=> d!126281 e!590506))

(declare-fun res!694565 () Bool)

(assert (=> d!126281 (=> (not res!694565) (not e!590506))))

(assert (=> d!126281 (= res!694565 (bvslt (index!41412 lt!459392) (size!32136 (_keys!11620 thiss!1427))))))

(declare-fun lt!459454 () Unit!34035)

(declare-fun choose!121 (array!65695 (_ BitVec 32) (_ BitVec 64)) Unit!34035)

(assert (=> d!126281 (= lt!459454 (choose!121 (_keys!11620 thiss!1427) (index!41412 lt!459392) key!909))))

(assert (=> d!126281 (bvsge (index!41412 lt!459392) #b00000000000000000000000000000000)))

(assert (=> d!126281 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11620 thiss!1427) (index!41412 lt!459392) key!909) lt!459454)))

(declare-fun b!1042593 () Bool)

(assert (=> b!1042593 (= e!590506 (not (arrayContainsKey!0 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126281 res!694565) b!1042593))

(declare-fun m!962417 () Bool)

(assert (=> d!126281 m!962417))

(assert (=> b!1042593 m!962291))

(declare-fun m!962419 () Bool)

(assert (=> b!1042593 m!962419))

(assert (=> b!1042468 d!126281))

(declare-fun d!126283 () Bool)

(declare-fun res!694570 () Bool)

(declare-fun e!590511 () Bool)

(assert (=> d!126283 (=> res!694570 e!590511)))

(assert (=> d!126283 (= res!694570 (= (select (arr!31603 lt!459391) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126283 (= (arrayContainsKey!0 lt!459391 key!909 #b00000000000000000000000000000000) e!590511)))

(declare-fun b!1042598 () Bool)

(declare-fun e!590512 () Bool)

(assert (=> b!1042598 (= e!590511 e!590512)))

(declare-fun res!694571 () Bool)

(assert (=> b!1042598 (=> (not res!694571) (not e!590512))))

(assert (=> b!1042598 (= res!694571 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32136 lt!459391)))))

(declare-fun b!1042599 () Bool)

(assert (=> b!1042599 (= e!590512 (arrayContainsKey!0 lt!459391 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126283 (not res!694570)) b!1042598))

(assert (= (and b!1042598 res!694571) b!1042599))

(assert (=> d!126283 m!962397))

(declare-fun m!962421 () Bool)

(assert (=> b!1042599 m!962421))

(assert (=> b!1042468 d!126283))

(declare-fun d!126285 () Bool)

(declare-fun e!590515 () Bool)

(assert (=> d!126285 e!590515))

(declare-fun res!694574 () Bool)

(assert (=> d!126285 (=> (not res!694574) (not e!590515))))

(assert (=> d!126285 (= res!694574 (and (bvsge (index!41412 lt!459392) #b00000000000000000000000000000000) (bvslt (index!41412 lt!459392) (size!32136 (_keys!11620 thiss!1427)))))))

(declare-fun lt!459457 () Unit!34035)

(declare-fun choose!53 (array!65695 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21955) Unit!34035)

(assert (=> d!126285 (= lt!459457 (choose!53 (_keys!11620 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41412 lt!459392) #b00000000000000000000000000000000 Nil!21952))))

(assert (=> d!126285 (bvslt (size!32136 (_keys!11620 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126285 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11620 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41412 lt!459392) #b00000000000000000000000000000000 Nil!21952) lt!459457)))

(declare-fun b!1042602 () Bool)

(assert (=> b!1042602 (= e!590515 (arrayNoDuplicates!0 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))) #b00000000000000000000000000000000 Nil!21952))))

(assert (= (and d!126285 res!694574) b!1042602))

(declare-fun m!962423 () Bool)

(assert (=> d!126285 m!962423))

(assert (=> b!1042602 m!962291))

(declare-fun m!962425 () Bool)

(assert (=> b!1042602 m!962425))

(assert (=> b!1042468 d!126285))

(declare-fun b!1042611 () Bool)

(declare-fun e!590524 () Bool)

(declare-fun call!44173 () Bool)

(assert (=> b!1042611 (= e!590524 call!44173)))

(declare-fun d!126287 () Bool)

(declare-fun res!694579 () Bool)

(declare-fun e!590522 () Bool)

(assert (=> d!126287 (=> res!694579 e!590522)))

(assert (=> d!126287 (= res!694579 (bvsge #b00000000000000000000000000000000 (size!32136 lt!459391)))))

(assert (=> d!126287 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459391 (mask!30429 thiss!1427)) e!590522)))

(declare-fun b!1042612 () Bool)

(assert (=> b!1042612 (= e!590522 e!590524)))

(declare-fun c!106032 () Bool)

(assert (=> b!1042612 (= c!106032 (validKeyInArray!0 (select (arr!31603 lt!459391) #b00000000000000000000000000000000)))))

(declare-fun bm!44170 () Bool)

(assert (=> bm!44170 (= call!44173 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459391 (mask!30429 thiss!1427)))))

(declare-fun b!1042613 () Bool)

(declare-fun e!590523 () Bool)

(assert (=> b!1042613 (= e!590523 call!44173)))

(declare-fun b!1042614 () Bool)

(assert (=> b!1042614 (= e!590524 e!590523)))

(declare-fun lt!459466 () (_ BitVec 64))

(assert (=> b!1042614 (= lt!459466 (select (arr!31603 lt!459391) #b00000000000000000000000000000000))))

(declare-fun lt!459465 () Unit!34035)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65695 (_ BitVec 64) (_ BitVec 32)) Unit!34035)

(assert (=> b!1042614 (= lt!459465 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459391 lt!459466 #b00000000000000000000000000000000))))

(assert (=> b!1042614 (arrayContainsKey!0 lt!459391 lt!459466 #b00000000000000000000000000000000)))

(declare-fun lt!459464 () Unit!34035)

(assert (=> b!1042614 (= lt!459464 lt!459465)))

(declare-fun res!694580 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65695 (_ BitVec 32)) SeekEntryResult!9760)

(assert (=> b!1042614 (= res!694580 (= (seekEntryOrOpen!0 (select (arr!31603 lt!459391) #b00000000000000000000000000000000) lt!459391 (mask!30429 thiss!1427)) (Found!9760 #b00000000000000000000000000000000)))))

(assert (=> b!1042614 (=> (not res!694580) (not e!590523))))

(assert (= (and d!126287 (not res!694579)) b!1042612))

(assert (= (and b!1042612 c!106032) b!1042614))

(assert (= (and b!1042612 (not c!106032)) b!1042611))

(assert (= (and b!1042614 res!694580) b!1042613))

(assert (= (or b!1042613 b!1042611) bm!44170))

(assert (=> b!1042612 m!962397))

(assert (=> b!1042612 m!962397))

(assert (=> b!1042612 m!962399))

(declare-fun m!962427 () Bool)

(assert (=> bm!44170 m!962427))

(assert (=> b!1042614 m!962397))

(declare-fun m!962429 () Bool)

(assert (=> b!1042614 m!962429))

(declare-fun m!962431 () Bool)

(assert (=> b!1042614 m!962431))

(assert (=> b!1042614 m!962397))

(declare-fun m!962433 () Bool)

(assert (=> b!1042614 m!962433))

(assert (=> b!1042468 d!126287))

(declare-fun d!126289 () Bool)

(assert (=> d!126289 (= (array_inv!24435 (_keys!11620 thiss!1427)) (bvsge (size!32136 (_keys!11620 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042469 d!126289))

(declare-fun d!126291 () Bool)

(assert (=> d!126291 (= (array_inv!24436 (_values!6374 thiss!1427)) (bvsge (size!32137 (_values!6374 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042469 d!126291))

(declare-fun mapNonEmpty!38726 () Bool)

(declare-fun mapRes!38726 () Bool)

(declare-fun tp!74316 () Bool)

(declare-fun e!590529 () Bool)

(assert (=> mapNonEmpty!38726 (= mapRes!38726 (and tp!74316 e!590529))))

(declare-fun mapRest!38726 () (Array (_ BitVec 32) ValueCell!11672))

(declare-fun mapKey!38726 () (_ BitVec 32))

(declare-fun mapValue!38726 () ValueCell!11672)

(assert (=> mapNonEmpty!38726 (= mapRest!38717 (store mapRest!38726 mapKey!38726 mapValue!38726))))

(declare-fun b!1042621 () Bool)

(assert (=> b!1042621 (= e!590529 tp_is_empty!24751)))

(declare-fun mapIsEmpty!38726 () Bool)

(assert (=> mapIsEmpty!38726 mapRes!38726))

(declare-fun b!1042622 () Bool)

(declare-fun e!590530 () Bool)

(assert (=> b!1042622 (= e!590530 tp_is_empty!24751)))

(declare-fun condMapEmpty!38726 () Bool)

(declare-fun mapDefault!38726 () ValueCell!11672)

(assert (=> mapNonEmpty!38717 (= condMapEmpty!38726 (= mapRest!38717 ((as const (Array (_ BitVec 32) ValueCell!11672)) mapDefault!38726)))))

(assert (=> mapNonEmpty!38717 (= tp!74301 (and e!590530 mapRes!38726))))

(assert (= (and mapNonEmpty!38717 condMapEmpty!38726) mapIsEmpty!38726))

(assert (= (and mapNonEmpty!38717 (not condMapEmpty!38726)) mapNonEmpty!38726))

(assert (= (and mapNonEmpty!38726 ((_ is ValueCellFull!11672) mapValue!38726)) b!1042621))

(assert (= (and mapNonEmpty!38717 ((_ is ValueCellFull!11672) mapDefault!38726)) b!1042622))

(declare-fun m!962435 () Bool)

(assert (=> mapNonEmpty!38726 m!962435))

(check-sat (not b_next!21031) (not b!1042542) (not d!126265) (not b!1042526) (not d!126281) (not b!1042590) (not b!1042602) (not b!1042524) (not b!1042570) (not bm!44166) (not b!1042556) (not b!1042612) (not b!1042599) (not d!126285) (not b!1042614) (not bm!44163) tp_is_empty!24751 (not bm!44170) (not bm!44167) (not mapNonEmpty!38726) (not b!1042567) (not d!126269) (not d!126267) (not b!1042574) (not b!1042593) (not b!1042525) (not b!1042554) (not b!1042568) b_and!33573 (not d!126273) (not b!1042553) (not b!1042586))
(check-sat b_and!33573 (not b_next!21031))
(get-model)

(declare-fun d!126293 () Bool)

(declare-fun lt!459469 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!524 (List!21955) (InoxSet (_ BitVec 64)))

(assert (=> d!126293 (= lt!459469 (select (content!524 Nil!21952) (select (arr!31603 lt!459391) #b00000000000000000000000000000000)))))

(declare-fun e!590536 () Bool)

(assert (=> d!126293 (= lt!459469 e!590536)))

(declare-fun res!694585 () Bool)

(assert (=> d!126293 (=> (not res!694585) (not e!590536))))

(assert (=> d!126293 (= res!694585 ((_ is Cons!21951) Nil!21952))))

(assert (=> d!126293 (= (contains!6079 Nil!21952 (select (arr!31603 lt!459391) #b00000000000000000000000000000000)) lt!459469)))

(declare-fun b!1042627 () Bool)

(declare-fun e!590535 () Bool)

(assert (=> b!1042627 (= e!590536 e!590535)))

(declare-fun res!694586 () Bool)

(assert (=> b!1042627 (=> res!694586 e!590535)))

(assert (=> b!1042627 (= res!694586 (= (h!23165 Nil!21952) (select (arr!31603 lt!459391) #b00000000000000000000000000000000)))))

(declare-fun b!1042628 () Bool)

(assert (=> b!1042628 (= e!590535 (contains!6079 (t!31161 Nil!21952) (select (arr!31603 lt!459391) #b00000000000000000000000000000000)))))

(assert (= (and d!126293 res!694585) b!1042627))

(assert (= (and b!1042627 (not res!694586)) b!1042628))

(declare-fun m!962437 () Bool)

(assert (=> d!126293 m!962437))

(assert (=> d!126293 m!962397))

(declare-fun m!962439 () Bool)

(assert (=> d!126293 m!962439))

(assert (=> b!1042628 m!962397))

(declare-fun m!962441 () Bool)

(assert (=> b!1042628 m!962441))

(assert (=> b!1042570 d!126293))

(declare-fun b!1042629 () Bool)

(declare-fun e!590538 () Bool)

(declare-fun e!590537 () Bool)

(assert (=> b!1042629 (= e!590538 e!590537)))

(declare-fun res!694587 () Bool)

(assert (=> b!1042629 (=> (not res!694587) (not e!590537))))

(declare-fun e!590539 () Bool)

(assert (=> b!1042629 (= res!694587 (not e!590539))))

(declare-fun res!694588 () Bool)

(assert (=> b!1042629 (=> (not res!694588) (not e!590539))))

(assert (=> b!1042629 (= res!694588 (validKeyInArray!0 (select (arr!31603 lt!459391) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1042630 () Bool)

(declare-fun e!590540 () Bool)

(assert (=> b!1042630 (= e!590537 e!590540)))

(declare-fun c!106033 () Bool)

(assert (=> b!1042630 (= c!106033 (validKeyInArray!0 (select (arr!31603 lt!459391) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1042631 () Bool)

(declare-fun call!44174 () Bool)

(assert (=> b!1042631 (= e!590540 call!44174)))

(declare-fun bm!44171 () Bool)

(assert (=> bm!44171 (= call!44174 (arrayNoDuplicates!0 lt!459391 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!106033 (Cons!21951 (select (arr!31603 lt!459391) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!106021 (Cons!21951 (select (arr!31603 lt!459391) #b00000000000000000000000000000000) Nil!21952) Nil!21952)) (ite c!106021 (Cons!21951 (select (arr!31603 lt!459391) #b00000000000000000000000000000000) Nil!21952) Nil!21952))))))

(declare-fun b!1042633 () Bool)

(assert (=> b!1042633 (= e!590540 call!44174)))

(declare-fun d!126295 () Bool)

(declare-fun res!694589 () Bool)

(assert (=> d!126295 (=> res!694589 e!590538)))

(assert (=> d!126295 (= res!694589 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32136 lt!459391)))))

(assert (=> d!126295 (= (arrayNoDuplicates!0 lt!459391 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106021 (Cons!21951 (select (arr!31603 lt!459391) #b00000000000000000000000000000000) Nil!21952) Nil!21952)) e!590538)))

(declare-fun b!1042632 () Bool)

(assert (=> b!1042632 (= e!590539 (contains!6079 (ite c!106021 (Cons!21951 (select (arr!31603 lt!459391) #b00000000000000000000000000000000) Nil!21952) Nil!21952) (select (arr!31603 lt!459391) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!126295 (not res!694589)) b!1042629))

(assert (= (and b!1042629 res!694588) b!1042632))

(assert (= (and b!1042629 res!694587) b!1042630))

(assert (= (and b!1042630 c!106033) b!1042631))

(assert (= (and b!1042630 (not c!106033)) b!1042633))

(assert (= (or b!1042631 b!1042633) bm!44171))

(declare-fun m!962443 () Bool)

(assert (=> b!1042629 m!962443))

(assert (=> b!1042629 m!962443))

(declare-fun m!962445 () Bool)

(assert (=> b!1042629 m!962445))

(assert (=> b!1042630 m!962443))

(assert (=> b!1042630 m!962443))

(assert (=> b!1042630 m!962445))

(assert (=> bm!44171 m!962443))

(declare-fun m!962447 () Bool)

(assert (=> bm!44171 m!962447))

(assert (=> b!1042632 m!962443))

(assert (=> b!1042632 m!962443))

(declare-fun m!962449 () Bool)

(assert (=> b!1042632 m!962449))

(assert (=> bm!44163 d!126295))

(declare-fun d!126297 () Bool)

(assert (=> d!126297 (= (validKeyInArray!0 (select (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392))) (and (not (= (select (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1042553 d!126297))

(declare-fun d!126299 () Bool)

(assert (=> d!126299 (arrayNoDuplicates!0 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))) #b00000000000000000000000000000000 Nil!21952)))

(assert (=> d!126299 true))

(declare-fun _$66!50 () Unit!34035)

(assert (=> d!126299 (= (choose!53 (_keys!11620 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41412 lt!459392) #b00000000000000000000000000000000 Nil!21952) _$66!50)))

(declare-fun bs!30475 () Bool)

(assert (= bs!30475 d!126299))

(assert (=> bs!30475 m!962291))

(assert (=> bs!30475 m!962425))

(assert (=> d!126285 d!126299))

(declare-fun d!126301 () Bool)

(assert (=> d!126301 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1042554 d!126301))

(declare-fun d!126303 () Bool)

(declare-fun res!694590 () Bool)

(declare-fun e!590541 () Bool)

(assert (=> d!126303 (=> res!694590 e!590541)))

(assert (=> d!126303 (= res!694590 (= (select (arr!31603 lt!459391) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!126303 (= (arrayContainsKey!0 lt!459391 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!590541)))

(declare-fun b!1042634 () Bool)

(declare-fun e!590542 () Bool)

(assert (=> b!1042634 (= e!590541 e!590542)))

(declare-fun res!694591 () Bool)

(assert (=> b!1042634 (=> (not res!694591) (not e!590542))))

(assert (=> b!1042634 (= res!694591 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32136 lt!459391)))))

(declare-fun b!1042635 () Bool)

(assert (=> b!1042635 (= e!590542 (arrayContainsKey!0 lt!459391 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!126303 (not res!694590)) b!1042634))

(assert (= (and b!1042634 res!694591) b!1042635))

(assert (=> d!126303 m!962443))

(declare-fun m!962451 () Bool)

(assert (=> b!1042635 m!962451))

(assert (=> b!1042599 d!126303))

(declare-fun b!1042636 () Bool)

(declare-fun e!590545 () Bool)

(declare-fun call!44175 () Bool)

(assert (=> b!1042636 (= e!590545 call!44175)))

(declare-fun d!126305 () Bool)

(declare-fun res!694592 () Bool)

(declare-fun e!590543 () Bool)

(assert (=> d!126305 (=> res!694592 e!590543)))

(assert (=> d!126305 (= res!694592 (bvsge #b00000000000000000000000000000000 (size!32136 (_keys!11620 thiss!1427))))))

(assert (=> d!126305 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11620 thiss!1427) (mask!30429 thiss!1427)) e!590543)))

(declare-fun b!1042637 () Bool)

(assert (=> b!1042637 (= e!590543 e!590545)))

(declare-fun c!106034 () Bool)

(assert (=> b!1042637 (= c!106034 (validKeyInArray!0 (select (arr!31603 (_keys!11620 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44172 () Bool)

(assert (=> bm!44172 (= call!44175 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11620 thiss!1427) (mask!30429 thiss!1427)))))

(declare-fun b!1042638 () Bool)

(declare-fun e!590544 () Bool)

(assert (=> b!1042638 (= e!590544 call!44175)))

(declare-fun b!1042639 () Bool)

(assert (=> b!1042639 (= e!590545 e!590544)))

(declare-fun lt!459472 () (_ BitVec 64))

(assert (=> b!1042639 (= lt!459472 (select (arr!31603 (_keys!11620 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459471 () Unit!34035)

(assert (=> b!1042639 (= lt!459471 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11620 thiss!1427) lt!459472 #b00000000000000000000000000000000))))

(assert (=> b!1042639 (arrayContainsKey!0 (_keys!11620 thiss!1427) lt!459472 #b00000000000000000000000000000000)))

(declare-fun lt!459470 () Unit!34035)

(assert (=> b!1042639 (= lt!459470 lt!459471)))

(declare-fun res!694593 () Bool)

(assert (=> b!1042639 (= res!694593 (= (seekEntryOrOpen!0 (select (arr!31603 (_keys!11620 thiss!1427)) #b00000000000000000000000000000000) (_keys!11620 thiss!1427) (mask!30429 thiss!1427)) (Found!9760 #b00000000000000000000000000000000)))))

(assert (=> b!1042639 (=> (not res!694593) (not e!590544))))

(assert (= (and d!126305 (not res!694592)) b!1042637))

(assert (= (and b!1042637 c!106034) b!1042639))

(assert (= (and b!1042637 (not c!106034)) b!1042636))

(assert (= (and b!1042639 res!694593) b!1042638))

(assert (= (or b!1042638 b!1042636) bm!44172))

(assert (=> b!1042637 m!962411))

(assert (=> b!1042637 m!962411))

(assert (=> b!1042637 m!962413))

(declare-fun m!962453 () Bool)

(assert (=> bm!44172 m!962453))

(assert (=> b!1042639 m!962411))

(declare-fun m!962455 () Bool)

(assert (=> b!1042639 m!962455))

(declare-fun m!962457 () Bool)

(assert (=> b!1042639 m!962457))

(assert (=> b!1042639 m!962411))

(declare-fun m!962459 () Bool)

(assert (=> b!1042639 m!962459))

(assert (=> b!1042525 d!126305))

(declare-fun d!126307 () Bool)

(assert (=> d!126307 (= (validKeyInArray!0 (select (arr!31603 lt!459391) #b00000000000000000000000000000000)) (and (not (= (select (arr!31603 lt!459391) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31603 lt!459391) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1042568 d!126307))

(declare-fun b!1042640 () Bool)

(declare-fun e!590547 () Bool)

(declare-fun e!590546 () Bool)

(assert (=> b!1042640 (= e!590547 e!590546)))

(declare-fun res!694594 () Bool)

(assert (=> b!1042640 (=> (not res!694594) (not e!590546))))

(declare-fun e!590548 () Bool)

(assert (=> b!1042640 (= res!694594 (not e!590548))))

(declare-fun res!694595 () Bool)

(assert (=> b!1042640 (=> (not res!694595) (not e!590548))))

(assert (=> b!1042640 (= res!694595 (validKeyInArray!0 (select (arr!31603 (_keys!11620 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042641 () Bool)

(declare-fun e!590549 () Bool)

(assert (=> b!1042641 (= e!590546 e!590549)))

(declare-fun c!106035 () Bool)

(assert (=> b!1042641 (= c!106035 (validKeyInArray!0 (select (arr!31603 (_keys!11620 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042642 () Bool)

(declare-fun call!44176 () Bool)

(assert (=> b!1042642 (= e!590549 call!44176)))

(declare-fun bm!44173 () Bool)

(assert (=> bm!44173 (= call!44176 (arrayNoDuplicates!0 (_keys!11620 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106035 (Cons!21951 (select (arr!31603 (_keys!11620 thiss!1427)) #b00000000000000000000000000000000) Nil!21952) Nil!21952)))))

(declare-fun b!1042644 () Bool)

(assert (=> b!1042644 (= e!590549 call!44176)))

(declare-fun d!126309 () Bool)

(declare-fun res!694596 () Bool)

(assert (=> d!126309 (=> res!694596 e!590547)))

(assert (=> d!126309 (= res!694596 (bvsge #b00000000000000000000000000000000 (size!32136 (_keys!11620 thiss!1427))))))

(assert (=> d!126309 (= (arrayNoDuplicates!0 (_keys!11620 thiss!1427) #b00000000000000000000000000000000 Nil!21952) e!590547)))

(declare-fun b!1042643 () Bool)

(assert (=> b!1042643 (= e!590548 (contains!6079 Nil!21952 (select (arr!31603 (_keys!11620 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126309 (not res!694596)) b!1042640))

(assert (= (and b!1042640 res!694595) b!1042643))

(assert (= (and b!1042640 res!694594) b!1042641))

(assert (= (and b!1042641 c!106035) b!1042642))

(assert (= (and b!1042641 (not c!106035)) b!1042644))

(assert (= (or b!1042642 b!1042644) bm!44173))

(assert (=> b!1042640 m!962411))

(assert (=> b!1042640 m!962411))

(assert (=> b!1042640 m!962413))

(assert (=> b!1042641 m!962411))

(assert (=> b!1042641 m!962411))

(assert (=> b!1042641 m!962413))

(assert (=> bm!44173 m!962411))

(declare-fun m!962461 () Bool)

(assert (=> bm!44173 m!962461))

(assert (=> b!1042643 m!962411))

(assert (=> b!1042643 m!962411))

(declare-fun m!962463 () Bool)

(assert (=> b!1042643 m!962463))

(assert (=> b!1042526 d!126309))

(declare-fun b!1042645 () Bool)

(declare-fun e!590551 () Bool)

(declare-fun e!590550 () Bool)

(assert (=> b!1042645 (= e!590551 e!590550)))

(declare-fun res!694597 () Bool)

(assert (=> b!1042645 (=> (not res!694597) (not e!590550))))

(declare-fun e!590552 () Bool)

(assert (=> b!1042645 (= res!694597 (not e!590552))))

(declare-fun res!694598 () Bool)

(assert (=> b!1042645 (=> (not res!694598) (not e!590552))))

(assert (=> b!1042645 (= res!694598 (validKeyInArray!0 (select (arr!31603 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1042646 () Bool)

(declare-fun e!590553 () Bool)

(assert (=> b!1042646 (= e!590550 e!590553)))

(declare-fun c!106036 () Bool)

(assert (=> b!1042646 (= c!106036 (validKeyInArray!0 (select (arr!31603 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1042647 () Bool)

(declare-fun call!44177 () Bool)

(assert (=> b!1042647 (= e!590553 call!44177)))

(declare-fun bm!44174 () Bool)

(assert (=> bm!44174 (= call!44177 (arrayNoDuplicates!0 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106036 (Cons!21951 (select (arr!31603 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427)))) #b00000000000000000000000000000000) Nil!21952) Nil!21952)))))

(declare-fun b!1042649 () Bool)

(assert (=> b!1042649 (= e!590553 call!44177)))

(declare-fun d!126311 () Bool)

(declare-fun res!694599 () Bool)

(assert (=> d!126311 (=> res!694599 e!590551)))

(assert (=> d!126311 (= res!694599 (bvsge #b00000000000000000000000000000000 (size!32136 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))))))))

(assert (=> d!126311 (= (arrayNoDuplicates!0 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))) #b00000000000000000000000000000000 Nil!21952) e!590551)))

(declare-fun b!1042648 () Bool)

(assert (=> b!1042648 (= e!590552 (contains!6079 Nil!21952 (select (arr!31603 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (= (and d!126311 (not res!694599)) b!1042645))

(assert (= (and b!1042645 res!694598) b!1042648))

(assert (= (and b!1042645 res!694597) b!1042646))

(assert (= (and b!1042646 c!106036) b!1042647))

(assert (= (and b!1042646 (not c!106036)) b!1042649))

(assert (= (or b!1042647 b!1042649) bm!44174))

(declare-fun m!962465 () Bool)

(assert (=> b!1042645 m!962465))

(assert (=> b!1042645 m!962465))

(declare-fun m!962467 () Bool)

(assert (=> b!1042645 m!962467))

(assert (=> b!1042646 m!962465))

(assert (=> b!1042646 m!962465))

(assert (=> b!1042646 m!962467))

(assert (=> bm!44174 m!962465))

(declare-fun m!962469 () Bool)

(assert (=> bm!44174 m!962469))

(assert (=> b!1042648 m!962465))

(assert (=> b!1042648 m!962465))

(declare-fun m!962471 () Bool)

(assert (=> b!1042648 m!962471))

(assert (=> b!1042602 d!126311))

(declare-fun d!126313 () Bool)

(assert (=> d!126313 (= (validKeyInArray!0 (select (arr!31603 (_keys!11620 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31603 (_keys!11620 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31603 (_keys!11620 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1042590 d!126313))

(declare-fun d!126315 () Bool)

(declare-fun e!590565 () Bool)

(assert (=> d!126315 e!590565))

(declare-fun c!106045 () Bool)

(declare-fun lt!459477 () SeekEntryResult!9760)

(assert (=> d!126315 (= c!106045 (and ((_ is Intermediate!9760) lt!459477) (undefined!10572 lt!459477)))))

(declare-fun e!590567 () SeekEntryResult!9760)

(assert (=> d!126315 (= lt!459477 e!590567)))

(declare-fun c!106043 () Bool)

(assert (=> d!126315 (= c!106043 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!459478 () (_ BitVec 64))

(assert (=> d!126315 (= lt!459478 (select (arr!31603 (_keys!11620 thiss!1427)) (toIndex!0 key!909 (mask!30429 thiss!1427))))))

(assert (=> d!126315 (validMask!0 (mask!30429 thiss!1427))))

(assert (=> d!126315 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30429 thiss!1427)) key!909 (_keys!11620 thiss!1427) (mask!30429 thiss!1427)) lt!459477)))

(declare-fun b!1042668 () Bool)

(declare-fun e!590568 () Bool)

(assert (=> b!1042668 (= e!590565 e!590568)))

(declare-fun res!694607 () Bool)

(assert (=> b!1042668 (= res!694607 (and ((_ is Intermediate!9760) lt!459477) (not (undefined!10572 lt!459477)) (bvslt (x!92927 lt!459477) #b01111111111111111111111111111110) (bvsge (x!92927 lt!459477) #b00000000000000000000000000000000) (bvsge (x!92927 lt!459477) #b00000000000000000000000000000000)))))

(assert (=> b!1042668 (=> (not res!694607) (not e!590568))))

(declare-fun b!1042669 () Bool)

(assert (=> b!1042669 (= e!590567 (Intermediate!9760 true (toIndex!0 key!909 (mask!30429 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1042670 () Bool)

(declare-fun e!590566 () SeekEntryResult!9760)

(assert (=> b!1042670 (= e!590567 e!590566)))

(declare-fun c!106044 () Bool)

(assert (=> b!1042670 (= c!106044 (or (= lt!459478 key!909) (= (bvadd lt!459478 lt!459478) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1042671 () Bool)

(assert (=> b!1042671 (and (bvsge (index!41413 lt!459477) #b00000000000000000000000000000000) (bvslt (index!41413 lt!459477) (size!32136 (_keys!11620 thiss!1427))))))

(declare-fun res!694606 () Bool)

(assert (=> b!1042671 (= res!694606 (= (select (arr!31603 (_keys!11620 thiss!1427)) (index!41413 lt!459477)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!590564 () Bool)

(assert (=> b!1042671 (=> res!694606 e!590564)))

(declare-fun b!1042672 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1042672 (= e!590566 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!30429 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!30429 thiss!1427)) key!909 (_keys!11620 thiss!1427) (mask!30429 thiss!1427)))))

(declare-fun b!1042673 () Bool)

(assert (=> b!1042673 (and (bvsge (index!41413 lt!459477) #b00000000000000000000000000000000) (bvslt (index!41413 lt!459477) (size!32136 (_keys!11620 thiss!1427))))))

(assert (=> b!1042673 (= e!590564 (= (select (arr!31603 (_keys!11620 thiss!1427)) (index!41413 lt!459477)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1042674 () Bool)

(assert (=> b!1042674 (= e!590566 (Intermediate!9760 false (toIndex!0 key!909 (mask!30429 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1042675 () Bool)

(assert (=> b!1042675 (= e!590565 (bvsge (x!92927 lt!459477) #b01111111111111111111111111111110))))

(declare-fun b!1042676 () Bool)

(assert (=> b!1042676 (and (bvsge (index!41413 lt!459477) #b00000000000000000000000000000000) (bvslt (index!41413 lt!459477) (size!32136 (_keys!11620 thiss!1427))))))

(declare-fun res!694608 () Bool)

(assert (=> b!1042676 (= res!694608 (= (select (arr!31603 (_keys!11620 thiss!1427)) (index!41413 lt!459477)) key!909))))

(assert (=> b!1042676 (=> res!694608 e!590564)))

(assert (=> b!1042676 (= e!590568 e!590564)))

(assert (= (and d!126315 c!106043) b!1042669))

(assert (= (and d!126315 (not c!106043)) b!1042670))

(assert (= (and b!1042670 c!106044) b!1042674))

(assert (= (and b!1042670 (not c!106044)) b!1042672))

(assert (= (and d!126315 c!106045) b!1042675))

(assert (= (and d!126315 (not c!106045)) b!1042668))

(assert (= (and b!1042668 res!694607) b!1042676))

(assert (= (and b!1042676 (not res!694608)) b!1042671))

(assert (= (and b!1042671 (not res!694606)) b!1042673))

(declare-fun m!962473 () Bool)

(assert (=> b!1042671 m!962473))

(assert (=> d!126315 m!962383))

(declare-fun m!962475 () Bool)

(assert (=> d!126315 m!962475))

(assert (=> d!126315 m!962285))

(assert (=> b!1042672 m!962383))

(declare-fun m!962477 () Bool)

(assert (=> b!1042672 m!962477))

(assert (=> b!1042672 m!962477))

(declare-fun m!962479 () Bool)

(assert (=> b!1042672 m!962479))

(assert (=> b!1042676 m!962473))

(assert (=> b!1042673 m!962473))

(assert (=> d!126267 d!126315))

(declare-fun d!126317 () Bool)

(declare-fun lt!459484 () (_ BitVec 32))

(declare-fun lt!459483 () (_ BitVec 32))

(assert (=> d!126317 (= lt!459484 (bvmul (bvxor lt!459483 (bvlshr lt!459483 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!126317 (= lt!459483 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!126317 (and (bvsge (mask!30429 thiss!1427) #b00000000000000000000000000000000) (let ((res!694609 (let ((h!23167 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!92944 (bvmul (bvxor h!23167 (bvlshr h!23167 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!92944 (bvlshr x!92944 #b00000000000000000000000000001101)) (mask!30429 thiss!1427)))))) (and (bvslt res!694609 (bvadd (mask!30429 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!694609 #b00000000000000000000000000000000))))))

(assert (=> d!126317 (= (toIndex!0 key!909 (mask!30429 thiss!1427)) (bvand (bvxor lt!459484 (bvlshr lt!459484 #b00000000000000000000000000001101)) (mask!30429 thiss!1427)))))

(assert (=> d!126267 d!126317))

(assert (=> d!126267 d!126275))

(declare-fun b!1042677 () Bool)

(declare-fun e!590570 () (_ BitVec 32))

(assert (=> b!1042677 (= e!590570 #b00000000000000000000000000000000)))

(declare-fun d!126319 () Bool)

(declare-fun lt!459485 () (_ BitVec 32))

(assert (=> d!126319 (and (bvsge lt!459485 #b00000000000000000000000000000000) (bvsle lt!459485 (bvsub (size!32136 (_keys!11620 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!126319 (= lt!459485 e!590570)))

(declare-fun c!106046 () Bool)

(assert (=> d!126319 (= c!106046 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32136 (_keys!11620 thiss!1427))))))

(assert (=> d!126319 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32136 (_keys!11620 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32136 (_keys!11620 thiss!1427)) (size!32136 (_keys!11620 thiss!1427))))))

(assert (=> d!126319 (= (arrayCountValidKeys!0 (_keys!11620 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32136 (_keys!11620 thiss!1427))) lt!459485)))

(declare-fun b!1042678 () Bool)

(declare-fun e!590569 () (_ BitVec 32))

(declare-fun call!44178 () (_ BitVec 32))

(assert (=> b!1042678 (= e!590569 call!44178)))

(declare-fun b!1042679 () Bool)

(assert (=> b!1042679 (= e!590569 (bvadd #b00000000000000000000000000000001 call!44178))))

(declare-fun b!1042680 () Bool)

(assert (=> b!1042680 (= e!590570 e!590569)))

(declare-fun c!106047 () Bool)

(assert (=> b!1042680 (= c!106047 (validKeyInArray!0 (select (arr!31603 (_keys!11620 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!44175 () Bool)

(assert (=> bm!44175 (= call!44178 (arrayCountValidKeys!0 (_keys!11620 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32136 (_keys!11620 thiss!1427))))))

(assert (= (and d!126319 c!106046) b!1042677))

(assert (= (and d!126319 (not c!106046)) b!1042680))

(assert (= (and b!1042680 c!106047) b!1042679))

(assert (= (and b!1042680 (not c!106047)) b!1042678))

(assert (= (or b!1042679 b!1042678) bm!44175))

(declare-fun m!962481 () Bool)

(assert (=> b!1042680 m!962481))

(assert (=> b!1042680 m!962481))

(declare-fun m!962483 () Bool)

(assert (=> b!1042680 m!962483))

(declare-fun m!962485 () Bool)

(assert (=> bm!44175 m!962485))

(assert (=> bm!44167 d!126319))

(declare-fun b!1042681 () Bool)

(declare-fun e!590573 () Bool)

(declare-fun call!44179 () Bool)

(assert (=> b!1042681 (= e!590573 call!44179)))

(declare-fun d!126321 () Bool)

(declare-fun res!694610 () Bool)

(declare-fun e!590571 () Bool)

(assert (=> d!126321 (=> res!694610 e!590571)))

(assert (=> d!126321 (= res!694610 (bvsge #b00000000000000000000000000000000 (size!32136 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))))))))

(assert (=> d!126321 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))) (mask!30429 thiss!1427)) e!590571)))

(declare-fun b!1042682 () Bool)

(assert (=> b!1042682 (= e!590571 e!590573)))

(declare-fun c!106048 () Bool)

(assert (=> b!1042682 (= c!106048 (validKeyInArray!0 (select (arr!31603 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!44176 () Bool)

(assert (=> bm!44176 (= call!44179 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))) (mask!30429 thiss!1427)))))

(declare-fun b!1042683 () Bool)

(declare-fun e!590572 () Bool)

(assert (=> b!1042683 (= e!590572 call!44179)))

(declare-fun b!1042684 () Bool)

(assert (=> b!1042684 (= e!590573 e!590572)))

(declare-fun lt!459488 () (_ BitVec 64))

(assert (=> b!1042684 (= lt!459488 (select (arr!31603 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!459487 () Unit!34035)

(assert (=> b!1042684 (= lt!459487 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))) lt!459488 #b00000000000000000000000000000000))))

(assert (=> b!1042684 (arrayContainsKey!0 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))) lt!459488 #b00000000000000000000000000000000)))

(declare-fun lt!459486 () Unit!34035)

(assert (=> b!1042684 (= lt!459486 lt!459487)))

(declare-fun res!694611 () Bool)

(assert (=> b!1042684 (= res!694611 (= (seekEntryOrOpen!0 (select (arr!31603 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427)))) #b00000000000000000000000000000000) (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))) (mask!30429 thiss!1427)) (Found!9760 #b00000000000000000000000000000000)))))

(assert (=> b!1042684 (=> (not res!694611) (not e!590572))))

(assert (= (and d!126321 (not res!694610)) b!1042682))

(assert (= (and b!1042682 c!106048) b!1042684))

(assert (= (and b!1042682 (not c!106048)) b!1042681))

(assert (= (and b!1042684 res!694611) b!1042683))

(assert (= (or b!1042683 b!1042681) bm!44176))

(assert (=> b!1042682 m!962465))

(assert (=> b!1042682 m!962465))

(assert (=> b!1042682 m!962467))

(declare-fun m!962487 () Bool)

(assert (=> bm!44176 m!962487))

(assert (=> b!1042684 m!962465))

(declare-fun m!962489 () Bool)

(assert (=> b!1042684 m!962489))

(declare-fun m!962491 () Bool)

(assert (=> b!1042684 m!962491))

(assert (=> b!1042684 m!962465))

(declare-fun m!962493 () Bool)

(assert (=> b!1042684 m!962493))

(assert (=> b!1042574 d!126321))

(declare-fun b!1042685 () Bool)

(declare-fun e!590575 () (_ BitVec 32))

(assert (=> b!1042685 (= e!590575 #b00000000000000000000000000000000)))

(declare-fun d!126323 () Bool)

(declare-fun lt!459489 () (_ BitVec 32))

(assert (=> d!126323 (and (bvsge lt!459489 #b00000000000000000000000000000000) (bvsle lt!459489 (bvsub (size!32136 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!126323 (= lt!459489 e!590575)))

(declare-fun c!106049 () Bool)

(assert (=> d!126323 (= c!106049 (bvsge #b00000000000000000000000000000000 (size!32136 (_keys!11620 thiss!1427))))))

(assert (=> d!126323 (and (bvsle #b00000000000000000000000000000000 (size!32136 (_keys!11620 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32136 (_keys!11620 thiss!1427)) (size!32136 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))))))))

(assert (=> d!126323 (= (arrayCountValidKeys!0 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))) #b00000000000000000000000000000000 (size!32136 (_keys!11620 thiss!1427))) lt!459489)))

(declare-fun b!1042686 () Bool)

(declare-fun e!590574 () (_ BitVec 32))

(declare-fun call!44180 () (_ BitVec 32))

(assert (=> b!1042686 (= e!590574 call!44180)))

(declare-fun b!1042687 () Bool)

(assert (=> b!1042687 (= e!590574 (bvadd #b00000000000000000000000000000001 call!44180))))

(declare-fun b!1042688 () Bool)

(assert (=> b!1042688 (= e!590575 e!590574)))

(declare-fun c!106050 () Bool)

(assert (=> b!1042688 (= c!106050 (validKeyInArray!0 (select (arr!31603 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!44177 () Bool)

(assert (=> bm!44177 (= call!44180 (arrayCountValidKeys!0 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32136 (_keys!11620 thiss!1427))))))

(assert (= (and d!126323 c!106049) b!1042685))

(assert (= (and d!126323 (not c!106049)) b!1042688))

(assert (= (and b!1042688 c!106050) b!1042687))

(assert (= (and b!1042688 (not c!106050)) b!1042686))

(assert (= (or b!1042687 b!1042686) bm!44177))

(assert (=> b!1042688 m!962465))

(assert (=> b!1042688 m!962465))

(assert (=> b!1042688 m!962467))

(declare-fun m!962495 () Bool)

(assert (=> bm!44177 m!962495))

(assert (=> b!1042556 d!126323))

(assert (=> b!1042556 d!126279))

(declare-fun b!1042689 () Bool)

(declare-fun e!590578 () Bool)

(declare-fun call!44181 () Bool)

(assert (=> b!1042689 (= e!590578 call!44181)))

(declare-fun d!126325 () Bool)

(declare-fun res!694612 () Bool)

(declare-fun e!590576 () Bool)

(assert (=> d!126325 (=> res!694612 e!590576)))

(assert (=> d!126325 (= res!694612 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32136 lt!459391)))))

(assert (=> d!126325 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459391 (mask!30429 thiss!1427)) e!590576)))

(declare-fun b!1042690 () Bool)

(assert (=> b!1042690 (= e!590576 e!590578)))

(declare-fun c!106051 () Bool)

(assert (=> b!1042690 (= c!106051 (validKeyInArray!0 (select (arr!31603 lt!459391) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!44178 () Bool)

(assert (=> bm!44178 (= call!44181 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!459391 (mask!30429 thiss!1427)))))

(declare-fun b!1042691 () Bool)

(declare-fun e!590577 () Bool)

(assert (=> b!1042691 (= e!590577 call!44181)))

(declare-fun b!1042692 () Bool)

(assert (=> b!1042692 (= e!590578 e!590577)))

(declare-fun lt!459492 () (_ BitVec 64))

(assert (=> b!1042692 (= lt!459492 (select (arr!31603 lt!459391) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!459491 () Unit!34035)

(assert (=> b!1042692 (= lt!459491 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459391 lt!459492 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1042692 (arrayContainsKey!0 lt!459391 lt!459492 #b00000000000000000000000000000000)))

(declare-fun lt!459490 () Unit!34035)

(assert (=> b!1042692 (= lt!459490 lt!459491)))

(declare-fun res!694613 () Bool)

(assert (=> b!1042692 (= res!694613 (= (seekEntryOrOpen!0 (select (arr!31603 lt!459391) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!459391 (mask!30429 thiss!1427)) (Found!9760 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1042692 (=> (not res!694613) (not e!590577))))

(assert (= (and d!126325 (not res!694612)) b!1042690))

(assert (= (and b!1042690 c!106051) b!1042692))

(assert (= (and b!1042690 (not c!106051)) b!1042689))

(assert (= (and b!1042692 res!694613) b!1042691))

(assert (= (or b!1042691 b!1042689) bm!44178))

(assert (=> b!1042690 m!962443))

(assert (=> b!1042690 m!962443))

(assert (=> b!1042690 m!962445))

(declare-fun m!962497 () Bool)

(assert (=> bm!44178 m!962497))

(assert (=> b!1042692 m!962443))

(declare-fun m!962499 () Bool)

(assert (=> b!1042692 m!962499))

(declare-fun m!962501 () Bool)

(assert (=> b!1042692 m!962501))

(assert (=> b!1042692 m!962443))

(declare-fun m!962503 () Bool)

(assert (=> b!1042692 m!962503))

(assert (=> bm!44170 d!126325))

(declare-fun d!126327 () Bool)

(declare-fun res!694614 () Bool)

(declare-fun e!590579 () Bool)

(assert (=> d!126327 (=> res!694614 e!590579)))

(assert (=> d!126327 (= res!694614 (= (select (arr!31603 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126327 (= (arrayContainsKey!0 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))) key!909 #b00000000000000000000000000000000) e!590579)))

(declare-fun b!1042693 () Bool)

(declare-fun e!590580 () Bool)

(assert (=> b!1042693 (= e!590579 e!590580)))

(declare-fun res!694615 () Bool)

(assert (=> b!1042693 (=> (not res!694615) (not e!590580))))

(assert (=> b!1042693 (= res!694615 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32136 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))))))))

(declare-fun b!1042694 () Bool)

(assert (=> b!1042694 (= e!590580 (arrayContainsKey!0 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126327 (not res!694614)) b!1042693))

(assert (= (and b!1042693 res!694615) b!1042694))

(assert (=> d!126327 m!962465))

(declare-fun m!962505 () Bool)

(assert (=> b!1042694 m!962505))

(assert (=> b!1042593 d!126327))

(declare-fun d!126329 () Bool)

(assert (=> d!126329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))) (mask!30429 thiss!1427))))

(assert (=> d!126329 true))

(declare-fun _$44!24 () Unit!34035)

(assert (=> d!126329 (= (choose!25 (_keys!11620 thiss!1427) (index!41412 lt!459392) (mask!30429 thiss!1427)) _$44!24)))

(declare-fun bs!30476 () Bool)

(assert (= bs!30476 d!126329))

(assert (=> bs!30476 m!962291))

(assert (=> bs!30476 m!962407))

(assert (=> d!126273 d!126329))

(assert (=> d!126273 d!126275))

(assert (=> b!1042586 d!126307))

(declare-fun d!126331 () Bool)

(assert (=> d!126331 (arrayContainsKey!0 lt!459391 lt!459466 #b00000000000000000000000000000000)))

(declare-fun lt!459495 () Unit!34035)

(declare-fun choose!13 (array!65695 (_ BitVec 64) (_ BitVec 32)) Unit!34035)

(assert (=> d!126331 (= lt!459495 (choose!13 lt!459391 lt!459466 #b00000000000000000000000000000000))))

(assert (=> d!126331 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!126331 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459391 lt!459466 #b00000000000000000000000000000000) lt!459495)))

(declare-fun bs!30477 () Bool)

(assert (= bs!30477 d!126331))

(assert (=> bs!30477 m!962431))

(declare-fun m!962507 () Bool)

(assert (=> bs!30477 m!962507))

(assert (=> b!1042614 d!126331))

(declare-fun d!126333 () Bool)

(declare-fun res!694616 () Bool)

(declare-fun e!590581 () Bool)

(assert (=> d!126333 (=> res!694616 e!590581)))

(assert (=> d!126333 (= res!694616 (= (select (arr!31603 lt!459391) #b00000000000000000000000000000000) lt!459466))))

(assert (=> d!126333 (= (arrayContainsKey!0 lt!459391 lt!459466 #b00000000000000000000000000000000) e!590581)))

(declare-fun b!1042695 () Bool)

(declare-fun e!590582 () Bool)

(assert (=> b!1042695 (= e!590581 e!590582)))

(declare-fun res!694617 () Bool)

(assert (=> b!1042695 (=> (not res!694617) (not e!590582))))

(assert (=> b!1042695 (= res!694617 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32136 lt!459391)))))

(declare-fun b!1042696 () Bool)

(assert (=> b!1042696 (= e!590582 (arrayContainsKey!0 lt!459391 lt!459466 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126333 (not res!694616)) b!1042695))

(assert (= (and b!1042695 res!694617) b!1042696))

(assert (=> d!126333 m!962397))

(declare-fun m!962509 () Bool)

(assert (=> b!1042696 m!962509))

(assert (=> b!1042614 d!126333))

(declare-fun b!1042709 () Bool)

(declare-fun e!590591 () SeekEntryResult!9760)

(assert (=> b!1042709 (= e!590591 Undefined!9760)))

(declare-fun b!1042710 () Bool)

(declare-fun e!590589 () SeekEntryResult!9760)

(declare-fun lt!459502 () SeekEntryResult!9760)

(assert (=> b!1042710 (= e!590589 (MissingZero!9760 (index!41413 lt!459502)))))

(declare-fun b!1042711 () Bool)

(assert (=> b!1042711 (= e!590589 (seekKeyOrZeroReturnVacant!0 (x!92927 lt!459502) (index!41413 lt!459502) (index!41413 lt!459502) (select (arr!31603 lt!459391) #b00000000000000000000000000000000) lt!459391 (mask!30429 thiss!1427)))))

(declare-fun d!126335 () Bool)

(declare-fun lt!459504 () SeekEntryResult!9760)

(assert (=> d!126335 (and (or ((_ is Undefined!9760) lt!459504) (not ((_ is Found!9760) lt!459504)) (and (bvsge (index!41412 lt!459504) #b00000000000000000000000000000000) (bvslt (index!41412 lt!459504) (size!32136 lt!459391)))) (or ((_ is Undefined!9760) lt!459504) ((_ is Found!9760) lt!459504) (not ((_ is MissingZero!9760) lt!459504)) (and (bvsge (index!41411 lt!459504) #b00000000000000000000000000000000) (bvslt (index!41411 lt!459504) (size!32136 lt!459391)))) (or ((_ is Undefined!9760) lt!459504) ((_ is Found!9760) lt!459504) ((_ is MissingZero!9760) lt!459504) (not ((_ is MissingVacant!9760) lt!459504)) (and (bvsge (index!41414 lt!459504) #b00000000000000000000000000000000) (bvslt (index!41414 lt!459504) (size!32136 lt!459391)))) (or ((_ is Undefined!9760) lt!459504) (ite ((_ is Found!9760) lt!459504) (= (select (arr!31603 lt!459391) (index!41412 lt!459504)) (select (arr!31603 lt!459391) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9760) lt!459504) (= (select (arr!31603 lt!459391) (index!41411 lt!459504)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9760) lt!459504) (= (select (arr!31603 lt!459391) (index!41414 lt!459504)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!126335 (= lt!459504 e!590591)))

(declare-fun c!106060 () Bool)

(assert (=> d!126335 (= c!106060 (and ((_ is Intermediate!9760) lt!459502) (undefined!10572 lt!459502)))))

(assert (=> d!126335 (= lt!459502 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31603 lt!459391) #b00000000000000000000000000000000) (mask!30429 thiss!1427)) (select (arr!31603 lt!459391) #b00000000000000000000000000000000) lt!459391 (mask!30429 thiss!1427)))))

(assert (=> d!126335 (validMask!0 (mask!30429 thiss!1427))))

(assert (=> d!126335 (= (seekEntryOrOpen!0 (select (arr!31603 lt!459391) #b00000000000000000000000000000000) lt!459391 (mask!30429 thiss!1427)) lt!459504)))

(declare-fun b!1042712 () Bool)

(declare-fun c!106059 () Bool)

(declare-fun lt!459503 () (_ BitVec 64))

(assert (=> b!1042712 (= c!106059 (= lt!459503 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!590590 () SeekEntryResult!9760)

(assert (=> b!1042712 (= e!590590 e!590589)))

(declare-fun b!1042713 () Bool)

(assert (=> b!1042713 (= e!590590 (Found!9760 (index!41413 lt!459502)))))

(declare-fun b!1042714 () Bool)

(assert (=> b!1042714 (= e!590591 e!590590)))

(assert (=> b!1042714 (= lt!459503 (select (arr!31603 lt!459391) (index!41413 lt!459502)))))

(declare-fun c!106058 () Bool)

(assert (=> b!1042714 (= c!106058 (= lt!459503 (select (arr!31603 lt!459391) #b00000000000000000000000000000000)))))

(assert (= (and d!126335 c!106060) b!1042709))

(assert (= (and d!126335 (not c!106060)) b!1042714))

(assert (= (and b!1042714 c!106058) b!1042713))

(assert (= (and b!1042714 (not c!106058)) b!1042712))

(assert (= (and b!1042712 c!106059) b!1042710))

(assert (= (and b!1042712 (not c!106059)) b!1042711))

(assert (=> b!1042711 m!962397))

(declare-fun m!962511 () Bool)

(assert (=> b!1042711 m!962511))

(assert (=> d!126335 m!962285))

(declare-fun m!962513 () Bool)

(assert (=> d!126335 m!962513))

(declare-fun m!962515 () Bool)

(assert (=> d!126335 m!962515))

(assert (=> d!126335 m!962397))

(declare-fun m!962517 () Bool)

(assert (=> d!126335 m!962517))

(declare-fun m!962519 () Bool)

(assert (=> d!126335 m!962519))

(assert (=> d!126335 m!962397))

(assert (=> d!126335 m!962515))

(declare-fun m!962521 () Bool)

(assert (=> d!126335 m!962521))

(declare-fun m!962523 () Bool)

(assert (=> b!1042714 m!962523))

(assert (=> b!1042614 d!126335))

(declare-fun d!126337 () Bool)

(assert (=> d!126337 (= (arrayCountValidKeys!0 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))) #b00000000000000000000000000000000 (size!32136 (_keys!11620 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11620 thiss!1427) #b00000000000000000000000000000000 (size!32136 (_keys!11620 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!126337 true))

(declare-fun _$79!26 () Unit!34035)

(assert (=> d!126337 (= (choose!82 (_keys!11620 thiss!1427) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!26)))

(declare-fun bs!30478 () Bool)

(assert (= bs!30478 d!126337))

(assert (=> bs!30478 m!962291))

(assert (=> bs!30478 m!962395))

(assert (=> bs!30478 m!962295))

(assert (=> d!126269 d!126337))

(assert (=> b!1042612 d!126307))

(declare-fun e!590600 () SeekEntryResult!9760)

(declare-fun b!1042727 () Bool)

(assert (=> b!1042727 (= e!590600 (seekKeyOrZeroReturnVacant!0 (bvadd (x!92927 lt!459441) #b00000000000000000000000000000001) (nextIndex!0 (index!41413 lt!459441) (bvadd (x!92927 lt!459441) #b00000000000000000000000000000001) (mask!30429 thiss!1427)) (index!41413 lt!459441) key!909 (_keys!11620 thiss!1427) (mask!30429 thiss!1427)))))

(declare-fun b!1042728 () Bool)

(declare-fun e!590598 () SeekEntryResult!9760)

(assert (=> b!1042728 (= e!590598 Undefined!9760)))

(declare-fun b!1042729 () Bool)

(assert (=> b!1042729 (= e!590600 (MissingVacant!9760 (index!41413 lt!459441)))))

(declare-fun d!126339 () Bool)

(declare-fun lt!459510 () SeekEntryResult!9760)

(assert (=> d!126339 (and (or ((_ is Undefined!9760) lt!459510) (not ((_ is Found!9760) lt!459510)) (and (bvsge (index!41412 lt!459510) #b00000000000000000000000000000000) (bvslt (index!41412 lt!459510) (size!32136 (_keys!11620 thiss!1427))))) (or ((_ is Undefined!9760) lt!459510) ((_ is Found!9760) lt!459510) (not ((_ is MissingVacant!9760) lt!459510)) (not (= (index!41414 lt!459510) (index!41413 lt!459441))) (and (bvsge (index!41414 lt!459510) #b00000000000000000000000000000000) (bvslt (index!41414 lt!459510) (size!32136 (_keys!11620 thiss!1427))))) (or ((_ is Undefined!9760) lt!459510) (ite ((_ is Found!9760) lt!459510) (= (select (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459510)) key!909) (and ((_ is MissingVacant!9760) lt!459510) (= (index!41414 lt!459510) (index!41413 lt!459441)) (= (select (arr!31603 (_keys!11620 thiss!1427)) (index!41414 lt!459510)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!126339 (= lt!459510 e!590598)))

(declare-fun c!106069 () Bool)

(assert (=> d!126339 (= c!106069 (bvsge (x!92927 lt!459441) #b01111111111111111111111111111110))))

(declare-fun lt!459509 () (_ BitVec 64))

(assert (=> d!126339 (= lt!459509 (select (arr!31603 (_keys!11620 thiss!1427)) (index!41413 lt!459441)))))

(assert (=> d!126339 (validMask!0 (mask!30429 thiss!1427))))

(assert (=> d!126339 (= (seekKeyOrZeroReturnVacant!0 (x!92927 lt!459441) (index!41413 lt!459441) (index!41413 lt!459441) key!909 (_keys!11620 thiss!1427) (mask!30429 thiss!1427)) lt!459510)))

(declare-fun b!1042730 () Bool)

(declare-fun e!590599 () SeekEntryResult!9760)

(assert (=> b!1042730 (= e!590599 (Found!9760 (index!41413 lt!459441)))))

(declare-fun b!1042731 () Bool)

(declare-fun c!106067 () Bool)

(assert (=> b!1042731 (= c!106067 (= lt!459509 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1042731 (= e!590599 e!590600)))

(declare-fun b!1042732 () Bool)

(assert (=> b!1042732 (= e!590598 e!590599)))

(declare-fun c!106068 () Bool)

(assert (=> b!1042732 (= c!106068 (= lt!459509 key!909))))

(assert (= (and d!126339 c!106069) b!1042728))

(assert (= (and d!126339 (not c!106069)) b!1042732))

(assert (= (and b!1042732 c!106068) b!1042730))

(assert (= (and b!1042732 (not c!106068)) b!1042731))

(assert (= (and b!1042731 c!106067) b!1042729))

(assert (= (and b!1042731 (not c!106067)) b!1042727))

(declare-fun m!962525 () Bool)

(assert (=> b!1042727 m!962525))

(assert (=> b!1042727 m!962525))

(declare-fun m!962527 () Bool)

(assert (=> b!1042727 m!962527))

(declare-fun m!962529 () Bool)

(assert (=> d!126339 m!962529))

(declare-fun m!962531 () Bool)

(assert (=> d!126339 m!962531))

(assert (=> d!126339 m!962377))

(assert (=> d!126339 m!962285))

(assert (=> b!1042542 d!126339))

(declare-fun d!126341 () Bool)

(declare-fun res!694629 () Bool)

(declare-fun e!590603 () Bool)

(assert (=> d!126341 (=> (not res!694629) (not e!590603))))

(assert (=> d!126341 (= res!694629 (validMask!0 (mask!30429 thiss!1427)))))

(assert (=> d!126341 (= (simpleValid!437 thiss!1427) e!590603)))

(declare-fun b!1042741 () Bool)

(declare-fun res!694628 () Bool)

(assert (=> b!1042741 (=> (not res!694628) (not e!590603))))

(assert (=> b!1042741 (= res!694628 (and (= (size!32137 (_values!6374 thiss!1427)) (bvadd (mask!30429 thiss!1427) #b00000000000000000000000000000001)) (= (size!32136 (_keys!11620 thiss!1427)) (size!32137 (_values!6374 thiss!1427))) (bvsge (_size!3024 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!3024 thiss!1427) (bvadd (mask!30429 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1042742 () Bool)

(declare-fun res!694627 () Bool)

(assert (=> b!1042742 (=> (not res!694627) (not e!590603))))

(declare-fun size!32142 (LongMapFixedSize!5938) (_ BitVec 32))

(assert (=> b!1042742 (= res!694627 (bvsge (size!32142 thiss!1427) (_size!3024 thiss!1427)))))

(declare-fun b!1042744 () Bool)

(assert (=> b!1042744 (= e!590603 (and (bvsge (extraKeys!6079 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6079 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!3024 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1042743 () Bool)

(declare-fun res!694626 () Bool)

(assert (=> b!1042743 (=> (not res!694626) (not e!590603))))

(assert (=> b!1042743 (= res!694626 (= (size!32142 thiss!1427) (bvadd (_size!3024 thiss!1427) (bvsdiv (bvadd (extraKeys!6079 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!126341 res!694629) b!1042741))

(assert (= (and b!1042741 res!694628) b!1042742))

(assert (= (and b!1042742 res!694627) b!1042743))

(assert (= (and b!1042743 res!694626) b!1042744))

(assert (=> d!126341 m!962285))

(declare-fun m!962533 () Bool)

(assert (=> b!1042742 m!962533))

(assert (=> b!1042743 m!962533))

(assert (=> d!126265 d!126341))

(assert (=> b!1042567 d!126307))

(assert (=> b!1042524 d!126279))

(declare-fun b!1042745 () Bool)

(declare-fun e!590605 () (_ BitVec 32))

(assert (=> b!1042745 (= e!590605 #b00000000000000000000000000000000)))

(declare-fun d!126343 () Bool)

(declare-fun lt!459511 () (_ BitVec 32))

(assert (=> d!126343 (and (bvsge lt!459511 #b00000000000000000000000000000000) (bvsle lt!459511 (bvsub (size!32136 lt!459391) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!126343 (= lt!459511 e!590605)))

(declare-fun c!106070 () Bool)

(assert (=> d!126343 (= c!106070 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32136 (_keys!11620 thiss!1427))))))

(assert (=> d!126343 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32136 (_keys!11620 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32136 (_keys!11620 thiss!1427)) (size!32136 lt!459391)))))

(assert (=> d!126343 (= (arrayCountValidKeys!0 lt!459391 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32136 (_keys!11620 thiss!1427))) lt!459511)))

(declare-fun b!1042746 () Bool)

(declare-fun e!590604 () (_ BitVec 32))

(declare-fun call!44182 () (_ BitVec 32))

(assert (=> b!1042746 (= e!590604 call!44182)))

(declare-fun b!1042747 () Bool)

(assert (=> b!1042747 (= e!590604 (bvadd #b00000000000000000000000000000001 call!44182))))

(declare-fun b!1042748 () Bool)

(assert (=> b!1042748 (= e!590605 e!590604)))

(declare-fun c!106071 () Bool)

(assert (=> b!1042748 (= c!106071 (validKeyInArray!0 (select (arr!31603 lt!459391) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!44179 () Bool)

(assert (=> bm!44179 (= call!44182 (arrayCountValidKeys!0 lt!459391 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32136 (_keys!11620 thiss!1427))))))

(assert (= (and d!126343 c!106070) b!1042745))

(assert (= (and d!126343 (not c!106070)) b!1042748))

(assert (= (and b!1042748 c!106071) b!1042747))

(assert (= (and b!1042748 (not c!106071)) b!1042746))

(assert (= (or b!1042747 b!1042746) bm!44179))

(assert (=> b!1042748 m!962443))

(assert (=> b!1042748 m!962443))

(assert (=> b!1042748 m!962445))

(declare-fun m!962535 () Bool)

(assert (=> bm!44179 m!962535))

(assert (=> bm!44166 d!126343))

(declare-fun d!126345 () Bool)

(assert (=> d!126345 (not (arrayContainsKey!0 (array!65696 (store (arr!31603 (_keys!11620 thiss!1427)) (index!41412 lt!459392) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32136 (_keys!11620 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!126345 true))

(declare-fun _$59!26 () Unit!34035)

(assert (=> d!126345 (= (choose!121 (_keys!11620 thiss!1427) (index!41412 lt!459392) key!909) _$59!26)))

(declare-fun bs!30479 () Bool)

(assert (= bs!30479 d!126345))

(assert (=> bs!30479 m!962291))

(assert (=> bs!30479 m!962419))

(assert (=> d!126281 d!126345))

(declare-fun mapNonEmpty!38727 () Bool)

(declare-fun mapRes!38727 () Bool)

(declare-fun tp!74317 () Bool)

(declare-fun e!590606 () Bool)

(assert (=> mapNonEmpty!38727 (= mapRes!38727 (and tp!74317 e!590606))))

(declare-fun mapValue!38727 () ValueCell!11672)

(declare-fun mapRest!38727 () (Array (_ BitVec 32) ValueCell!11672))

(declare-fun mapKey!38727 () (_ BitVec 32))

(assert (=> mapNonEmpty!38727 (= mapRest!38726 (store mapRest!38727 mapKey!38727 mapValue!38727))))

(declare-fun b!1042749 () Bool)

(assert (=> b!1042749 (= e!590606 tp_is_empty!24751)))

(declare-fun mapIsEmpty!38727 () Bool)

(assert (=> mapIsEmpty!38727 mapRes!38727))

(declare-fun b!1042750 () Bool)

(declare-fun e!590607 () Bool)

(assert (=> b!1042750 (= e!590607 tp_is_empty!24751)))

(declare-fun condMapEmpty!38727 () Bool)

(declare-fun mapDefault!38727 () ValueCell!11672)

(assert (=> mapNonEmpty!38726 (= condMapEmpty!38727 (= mapRest!38726 ((as const (Array (_ BitVec 32) ValueCell!11672)) mapDefault!38727)))))

(assert (=> mapNonEmpty!38726 (= tp!74316 (and e!590607 mapRes!38727))))

(assert (= (and mapNonEmpty!38726 condMapEmpty!38727) mapIsEmpty!38727))

(assert (= (and mapNonEmpty!38726 (not condMapEmpty!38727)) mapNonEmpty!38727))

(assert (= (and mapNonEmpty!38727 ((_ is ValueCellFull!11672) mapValue!38727)) b!1042749))

(assert (= (and mapNonEmpty!38726 ((_ is ValueCellFull!11672) mapDefault!38727)) b!1042750))

(declare-fun m!962537 () Bool)

(assert (=> mapNonEmpty!38727 m!962537))

(check-sat (not bm!44174) (not b!1042684) (not d!126339) (not b!1042690) (not b!1042688) (not mapNonEmpty!38727) (not b!1042648) (not d!126293) (not b!1042635) (not b!1042694) (not b!1042727) (not b!1042632) (not d!126329) (not bm!44177) (not b_next!21031) (not d!126315) (not b!1042680) (not b!1042637) (not bm!44171) (not b!1042628) (not d!126299) (not b!1042630) (not bm!44179) tp_is_empty!24751 (not b!1042645) (not bm!44173) (not b!1042748) (not b!1042682) (not d!126331) (not b!1042742) (not b!1042696) (not d!126337) (not b!1042640) (not b!1042743) (not d!126345) (not b!1042639) (not bm!44172) (not bm!44178) b_and!33573 (not b!1042629) (not b!1042646) (not d!126335) (not b!1042711) (not b!1042643) (not b!1042692) (not b!1042641) (not d!126341) (not bm!44175) (not bm!44176) (not b!1042672))
(check-sat b_and!33573 (not b_next!21031))
