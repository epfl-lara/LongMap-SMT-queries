; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91750 () Bool)

(assert start!91750)

(declare-fun b!1043749 () Bool)

(declare-fun b_free!21061 () Bool)

(declare-fun b_next!21061 () Bool)

(assert (=> b!1043749 (= b_free!21061 (not b_next!21061))))

(declare-fun tp!74409 () Bool)

(declare-fun b_and!33603 () Bool)

(assert (=> b!1043749 (= tp!74409 b_and!33603)))

(declare-fun b!1043748 () Bool)

(declare-fun e!591343 () Bool)

(declare-fun e!591348 () Bool)

(assert (=> b!1043748 (= e!591343 e!591348)))

(declare-fun res!695102 () Bool)

(assert (=> b!1043748 (=> (not res!695102) (not e!591348))))

(declare-datatypes ((SeekEntryResult!9773 0))(
  ( (MissingZero!9773 (index!41463 (_ BitVec 32))) (Found!9773 (index!41464 (_ BitVec 32))) (Intermediate!9773 (undefined!10585 Bool) (index!41465 (_ BitVec 32)) (x!93047 (_ BitVec 32))) (Undefined!9773) (MissingVacant!9773 (index!41466 (_ BitVec 32))) )
))
(declare-fun lt!459986 () SeekEntryResult!9773)

(get-info :version)

(assert (=> b!1043748 (= res!695102 ((_ is Found!9773) lt!459986))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37915 0))(
  ( (V!37916 (val!12441 Int)) )
))
(declare-datatypes ((ValueCell!11687 0))(
  ( (ValueCellFull!11687 (v!15028 V!37915)) (EmptyCell!11687) )
))
(declare-datatypes ((array!65765 0))(
  ( (array!65766 (arr!31633 (Array (_ BitVec 32) (_ BitVec 64))) (size!32169 (_ BitVec 32))) )
))
(declare-datatypes ((array!65767 0))(
  ( (array!65768 (arr!31634 (Array (_ BitVec 32) ValueCell!11687)) (size!32170 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5968 0))(
  ( (LongMapFixedSize!5969 (defaultEntry!6366 Int) (mask!30489 (_ BitVec 32)) (extraKeys!6094 (_ BitVec 32)) (zeroValue!6200 V!37915) (minValue!6200 V!37915) (_size!3039 (_ BitVec 32)) (_keys!11654 array!65765) (_values!6389 array!65767) (_vacant!3039 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5968)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65765 (_ BitVec 32)) SeekEntryResult!9773)

(assert (=> b!1043748 (= lt!459986 (seekEntry!0 key!909 (_keys!11654 thiss!1427) (mask!30489 thiss!1427)))))

(declare-fun mapNonEmpty!38780 () Bool)

(declare-fun mapRes!38780 () Bool)

(declare-fun tp!74408 () Bool)

(declare-fun e!591345 () Bool)

(assert (=> mapNonEmpty!38780 (= mapRes!38780 (and tp!74408 e!591345))))

(declare-fun mapRest!38780 () (Array (_ BitVec 32) ValueCell!11687))

(declare-fun mapValue!38780 () ValueCell!11687)

(declare-fun mapKey!38780 () (_ BitVec 32))

(assert (=> mapNonEmpty!38780 (= (arr!31634 (_values!6389 thiss!1427)) (store mapRest!38780 mapKey!38780 mapValue!38780))))

(declare-fun e!591341 () Bool)

(declare-fun tp_is_empty!24781 () Bool)

(declare-fun e!591342 () Bool)

(declare-fun array_inv!24455 (array!65765) Bool)

(declare-fun array_inv!24456 (array!65767) Bool)

(assert (=> b!1043749 (= e!591341 (and tp!74409 tp_is_empty!24781 (array_inv!24455 (_keys!11654 thiss!1427)) (array_inv!24456 (_values!6389 thiss!1427)) e!591342))))

(declare-fun mapIsEmpty!38780 () Bool)

(assert (=> mapIsEmpty!38780 mapRes!38780))

(declare-fun b!1043750 () Bool)

(declare-fun res!695100 () Bool)

(declare-fun e!591346 () Bool)

(assert (=> b!1043750 (=> res!695100 e!591346)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65765 (_ BitVec 32)) Bool)

(assert (=> b!1043750 (= res!695100 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11654 thiss!1427) (mask!30489 thiss!1427))))))

(declare-fun b!1043751 () Bool)

(declare-datatypes ((List!21967 0))(
  ( (Nil!21964) (Cons!21963 (h!23180 (_ BitVec 64)) (t!31173 List!21967)) )
))
(declare-fun arrayNoDuplicates!0 (array!65765 (_ BitVec 32) List!21967) Bool)

(assert (=> b!1043751 (= e!591346 (arrayNoDuplicates!0 (_keys!11654 thiss!1427) #b00000000000000000000000000000000 Nil!21964))))

(declare-fun b!1043752 () Bool)

(declare-fun res!695103 () Bool)

(assert (=> b!1043752 (=> res!695103 e!591346)))

(assert (=> b!1043752 (= res!695103 (or (not (= (size!32170 (_values!6389 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30489 thiss!1427)))) (not (= (size!32169 (_keys!11654 thiss!1427)) (size!32170 (_values!6389 thiss!1427)))) (bvslt (mask!30489 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6094 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6094 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun res!695101 () Bool)

(assert (=> start!91750 (=> (not res!695101) (not e!591343))))

(declare-fun valid!2248 (LongMapFixedSize!5968) Bool)

(assert (=> start!91750 (= res!695101 (valid!2248 thiss!1427))))

(assert (=> start!91750 e!591343))

(assert (=> start!91750 e!591341))

(assert (=> start!91750 true))

(declare-fun b!1043753 () Bool)

(assert (=> b!1043753 (= e!591345 tp_is_empty!24781)))

(declare-fun b!1043754 () Bool)

(assert (=> b!1043754 (= e!591348 (not e!591346))))

(declare-fun res!695104 () Bool)

(assert (=> b!1043754 (=> res!695104 e!591346)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1043754 (= res!695104 (not (validMask!0 (mask!30489 thiss!1427))))))

(declare-fun lt!459983 () array!65765)

(declare-fun arrayContainsKey!0 (array!65765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1043754 (not (arrayContainsKey!0 lt!459983 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34059 0))(
  ( (Unit!34060) )
))
(declare-fun lt!459982 () Unit!34059)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65765 (_ BitVec 32) (_ BitVec 64)) Unit!34059)

(assert (=> b!1043754 (= lt!459982 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11654 thiss!1427) (index!41464 lt!459986) key!909))))

(assert (=> b!1043754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459983 (mask!30489 thiss!1427))))

(declare-fun lt!459981 () Unit!34059)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65765 (_ BitVec 32) (_ BitVec 32)) Unit!34059)

(assert (=> b!1043754 (= lt!459981 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11654 thiss!1427) (index!41464 lt!459986) (mask!30489 thiss!1427)))))

(assert (=> b!1043754 (arrayNoDuplicates!0 lt!459983 #b00000000000000000000000000000000 Nil!21964)))

(declare-fun lt!459984 () Unit!34059)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65765 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21967) Unit!34059)

(assert (=> b!1043754 (= lt!459984 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11654 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41464 lt!459986) #b00000000000000000000000000000000 Nil!21964))))

(declare-fun arrayCountValidKeys!0 (array!65765 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043754 (= (arrayCountValidKeys!0 lt!459983 #b00000000000000000000000000000000 (size!32169 (_keys!11654 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11654 thiss!1427) #b00000000000000000000000000000000 (size!32169 (_keys!11654 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1043754 (= lt!459983 (array!65766 (store (arr!31633 (_keys!11654 thiss!1427)) (index!41464 lt!459986) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32169 (_keys!11654 thiss!1427))))))

(declare-fun lt!459985 () Unit!34059)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65765 (_ BitVec 32) (_ BitVec 64)) Unit!34059)

(assert (=> b!1043754 (= lt!459985 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11654 thiss!1427) (index!41464 lt!459986) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043755 () Bool)

(declare-fun e!591344 () Bool)

(assert (=> b!1043755 (= e!591344 tp_is_empty!24781)))

(declare-fun b!1043756 () Bool)

(declare-fun res!695099 () Bool)

(assert (=> b!1043756 (=> (not res!695099) (not e!591343))))

(assert (=> b!1043756 (= res!695099 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1043757 () Bool)

(assert (=> b!1043757 (= e!591342 (and e!591344 mapRes!38780))))

(declare-fun condMapEmpty!38780 () Bool)

(declare-fun mapDefault!38780 () ValueCell!11687)

(assert (=> b!1043757 (= condMapEmpty!38780 (= (arr!31634 (_values!6389 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11687)) mapDefault!38780)))))

(assert (= (and start!91750 res!695101) b!1043756))

(assert (= (and b!1043756 res!695099) b!1043748))

(assert (= (and b!1043748 res!695102) b!1043754))

(assert (= (and b!1043754 (not res!695104)) b!1043752))

(assert (= (and b!1043752 (not res!695103)) b!1043750))

(assert (= (and b!1043750 (not res!695100)) b!1043751))

(assert (= (and b!1043757 condMapEmpty!38780) mapIsEmpty!38780))

(assert (= (and b!1043757 (not condMapEmpty!38780)) mapNonEmpty!38780))

(assert (= (and mapNonEmpty!38780 ((_ is ValueCellFull!11687) mapValue!38780)) b!1043753))

(assert (= (and b!1043757 ((_ is ValueCellFull!11687) mapDefault!38780)) b!1043755))

(assert (= b!1043749 b!1043757))

(assert (= start!91750 b!1043749))

(declare-fun m!963403 () Bool)

(assert (=> b!1043754 m!963403))

(declare-fun m!963405 () Bool)

(assert (=> b!1043754 m!963405))

(declare-fun m!963407 () Bool)

(assert (=> b!1043754 m!963407))

(declare-fun m!963409 () Bool)

(assert (=> b!1043754 m!963409))

(declare-fun m!963411 () Bool)

(assert (=> b!1043754 m!963411))

(declare-fun m!963413 () Bool)

(assert (=> b!1043754 m!963413))

(declare-fun m!963415 () Bool)

(assert (=> b!1043754 m!963415))

(declare-fun m!963417 () Bool)

(assert (=> b!1043754 m!963417))

(declare-fun m!963419 () Bool)

(assert (=> b!1043754 m!963419))

(declare-fun m!963421 () Bool)

(assert (=> b!1043754 m!963421))

(declare-fun m!963423 () Bool)

(assert (=> b!1043754 m!963423))

(declare-fun m!963425 () Bool)

(assert (=> b!1043749 m!963425))

(declare-fun m!963427 () Bool)

(assert (=> b!1043749 m!963427))

(declare-fun m!963429 () Bool)

(assert (=> b!1043748 m!963429))

(declare-fun m!963431 () Bool)

(assert (=> start!91750 m!963431))

(declare-fun m!963433 () Bool)

(assert (=> mapNonEmpty!38780 m!963433))

(declare-fun m!963435 () Bool)

(assert (=> b!1043751 m!963435))

(declare-fun m!963437 () Bool)

(assert (=> b!1043750 m!963437))

(check-sat tp_is_empty!24781 (not mapNonEmpty!38780) (not start!91750) (not b!1043751) (not b!1043754) (not b!1043749) b_and!33603 (not b!1043748) (not b_next!21061) (not b!1043750))
(check-sat b_and!33603 (not b_next!21061))
(get-model)

(declare-fun d!126579 () Bool)

(declare-fun e!591399 () Bool)

(assert (=> d!126579 e!591399))

(declare-fun res!695143 () Bool)

(assert (=> d!126579 (=> (not res!695143) (not e!591399))))

(assert (=> d!126579 (= res!695143 (and (bvsge (index!41464 lt!459986) #b00000000000000000000000000000000) (bvslt (index!41464 lt!459986) (size!32169 (_keys!11654 thiss!1427)))))))

(declare-fun lt!460025 () Unit!34059)

(declare-fun choose!25 (array!65765 (_ BitVec 32) (_ BitVec 32)) Unit!34059)

(assert (=> d!126579 (= lt!460025 (choose!25 (_keys!11654 thiss!1427) (index!41464 lt!459986) (mask!30489 thiss!1427)))))

(assert (=> d!126579 (validMask!0 (mask!30489 thiss!1427))))

(assert (=> d!126579 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11654 thiss!1427) (index!41464 lt!459986) (mask!30489 thiss!1427)) lt!460025)))

(declare-fun b!1043820 () Bool)

(assert (=> b!1043820 (= e!591399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65766 (store (arr!31633 (_keys!11654 thiss!1427)) (index!41464 lt!459986) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32169 (_keys!11654 thiss!1427))) (mask!30489 thiss!1427)))))

(assert (= (and d!126579 res!695143) b!1043820))

(declare-fun m!963511 () Bool)

(assert (=> d!126579 m!963511))

(assert (=> d!126579 m!963405))

(assert (=> b!1043820 m!963415))

(declare-fun m!963513 () Bool)

(assert (=> b!1043820 m!963513))

(assert (=> b!1043754 d!126579))

(declare-fun d!126581 () Bool)

(declare-fun e!591402 () Bool)

(assert (=> d!126581 e!591402))

(declare-fun res!695146 () Bool)

(assert (=> d!126581 (=> (not res!695146) (not e!591402))))

(assert (=> d!126581 (= res!695146 (bvslt (index!41464 lt!459986) (size!32169 (_keys!11654 thiss!1427))))))

(declare-fun lt!460028 () Unit!34059)

(declare-fun choose!121 (array!65765 (_ BitVec 32) (_ BitVec 64)) Unit!34059)

(assert (=> d!126581 (= lt!460028 (choose!121 (_keys!11654 thiss!1427) (index!41464 lt!459986) key!909))))

(assert (=> d!126581 (bvsge (index!41464 lt!459986) #b00000000000000000000000000000000)))

(assert (=> d!126581 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11654 thiss!1427) (index!41464 lt!459986) key!909) lt!460028)))

(declare-fun b!1043823 () Bool)

(assert (=> b!1043823 (= e!591402 (not (arrayContainsKey!0 (array!65766 (store (arr!31633 (_keys!11654 thiss!1427)) (index!41464 lt!459986) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32169 (_keys!11654 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126581 res!695146) b!1043823))

(declare-fun m!963515 () Bool)

(assert (=> d!126581 m!963515))

(assert (=> b!1043823 m!963415))

(declare-fun m!963517 () Bool)

(assert (=> b!1043823 m!963517))

(assert (=> b!1043754 d!126581))

(declare-fun d!126583 () Bool)

(declare-fun e!591405 () Bool)

(assert (=> d!126583 e!591405))

(declare-fun res!695149 () Bool)

(assert (=> d!126583 (=> (not res!695149) (not e!591405))))

(assert (=> d!126583 (= res!695149 (and (bvsge (index!41464 lt!459986) #b00000000000000000000000000000000) (bvslt (index!41464 lt!459986) (size!32169 (_keys!11654 thiss!1427)))))))

(declare-fun lt!460031 () Unit!34059)

(declare-fun choose!53 (array!65765 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21967) Unit!34059)

(assert (=> d!126583 (= lt!460031 (choose!53 (_keys!11654 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41464 lt!459986) #b00000000000000000000000000000000 Nil!21964))))

(assert (=> d!126583 (bvslt (size!32169 (_keys!11654 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126583 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11654 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41464 lt!459986) #b00000000000000000000000000000000 Nil!21964) lt!460031)))

(declare-fun b!1043826 () Bool)

(assert (=> b!1043826 (= e!591405 (arrayNoDuplicates!0 (array!65766 (store (arr!31633 (_keys!11654 thiss!1427)) (index!41464 lt!459986) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32169 (_keys!11654 thiss!1427))) #b00000000000000000000000000000000 Nil!21964))))

(assert (= (and d!126583 res!695149) b!1043826))

(declare-fun m!963519 () Bool)

(assert (=> d!126583 m!963519))

(assert (=> b!1043826 m!963415))

(declare-fun m!963521 () Bool)

(assert (=> b!1043826 m!963521))

(assert (=> b!1043754 d!126583))

(declare-fun d!126585 () Bool)

(declare-fun res!695154 () Bool)

(declare-fun e!591410 () Bool)

(assert (=> d!126585 (=> res!695154 e!591410)))

(assert (=> d!126585 (= res!695154 (= (select (arr!31633 lt!459983) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126585 (= (arrayContainsKey!0 lt!459983 key!909 #b00000000000000000000000000000000) e!591410)))

(declare-fun b!1043831 () Bool)

(declare-fun e!591411 () Bool)

(assert (=> b!1043831 (= e!591410 e!591411)))

(declare-fun res!695155 () Bool)

(assert (=> b!1043831 (=> (not res!695155) (not e!591411))))

(assert (=> b!1043831 (= res!695155 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32169 lt!459983)))))

(declare-fun b!1043832 () Bool)

(assert (=> b!1043832 (= e!591411 (arrayContainsKey!0 lt!459983 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126585 (not res!695154)) b!1043831))

(assert (= (and b!1043831 res!695155) b!1043832))

(declare-fun m!963523 () Bool)

(assert (=> d!126585 m!963523))

(declare-fun m!963525 () Bool)

(assert (=> b!1043832 m!963525))

(assert (=> b!1043754 d!126585))

(declare-fun b!1043841 () Bool)

(declare-fun e!591419 () Bool)

(declare-fun e!591420 () Bool)

(assert (=> b!1043841 (= e!591419 e!591420)))

(declare-fun lt!460038 () (_ BitVec 64))

(assert (=> b!1043841 (= lt!460038 (select (arr!31633 lt!459983) #b00000000000000000000000000000000))))

(declare-fun lt!460039 () Unit!34059)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65765 (_ BitVec 64) (_ BitVec 32)) Unit!34059)

(assert (=> b!1043841 (= lt!460039 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459983 lt!460038 #b00000000000000000000000000000000))))

(assert (=> b!1043841 (arrayContainsKey!0 lt!459983 lt!460038 #b00000000000000000000000000000000)))

(declare-fun lt!460040 () Unit!34059)

(assert (=> b!1043841 (= lt!460040 lt!460039)))

(declare-fun res!695160 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65765 (_ BitVec 32)) SeekEntryResult!9773)

(assert (=> b!1043841 (= res!695160 (= (seekEntryOrOpen!0 (select (arr!31633 lt!459983) #b00000000000000000000000000000000) lt!459983 (mask!30489 thiss!1427)) (Found!9773 #b00000000000000000000000000000000)))))

(assert (=> b!1043841 (=> (not res!695160) (not e!591420))))

(declare-fun b!1043842 () Bool)

(declare-fun e!591418 () Bool)

(assert (=> b!1043842 (= e!591418 e!591419)))

(declare-fun c!106245 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1043842 (= c!106245 (validKeyInArray!0 (select (arr!31633 lt!459983) #b00000000000000000000000000000000)))))

(declare-fun b!1043843 () Bool)

(declare-fun call!44244 () Bool)

(assert (=> b!1043843 (= e!591420 call!44244)))

(declare-fun d!126587 () Bool)

(declare-fun res!695161 () Bool)

(assert (=> d!126587 (=> res!695161 e!591418)))

(assert (=> d!126587 (= res!695161 (bvsge #b00000000000000000000000000000000 (size!32169 lt!459983)))))

(assert (=> d!126587 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459983 (mask!30489 thiss!1427)) e!591418)))

(declare-fun b!1043844 () Bool)

(assert (=> b!1043844 (= e!591419 call!44244)))

(declare-fun bm!44241 () Bool)

(assert (=> bm!44241 (= call!44244 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459983 (mask!30489 thiss!1427)))))

(assert (= (and d!126587 (not res!695161)) b!1043842))

(assert (= (and b!1043842 c!106245) b!1043841))

(assert (= (and b!1043842 (not c!106245)) b!1043844))

(assert (= (and b!1043841 res!695160) b!1043843))

(assert (= (or b!1043843 b!1043844) bm!44241))

(assert (=> b!1043841 m!963523))

(declare-fun m!963527 () Bool)

(assert (=> b!1043841 m!963527))

(declare-fun m!963529 () Bool)

(assert (=> b!1043841 m!963529))

(assert (=> b!1043841 m!963523))

(declare-fun m!963531 () Bool)

(assert (=> b!1043841 m!963531))

(assert (=> b!1043842 m!963523))

(assert (=> b!1043842 m!963523))

(declare-fun m!963533 () Bool)

(assert (=> b!1043842 m!963533))

(declare-fun m!963535 () Bool)

(assert (=> bm!44241 m!963535))

(assert (=> b!1043754 d!126587))

(declare-fun b!1043853 () Bool)

(declare-fun e!591426 () (_ BitVec 32))

(declare-fun call!44247 () (_ BitVec 32))

(assert (=> b!1043853 (= e!591426 call!44247)))

(declare-fun b!1043854 () Bool)

(declare-fun e!591425 () (_ BitVec 32))

(assert (=> b!1043854 (= e!591425 e!591426)))

(declare-fun c!106250 () Bool)

(assert (=> b!1043854 (= c!106250 (validKeyInArray!0 (select (arr!31633 (_keys!11654 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043855 () Bool)

(assert (=> b!1043855 (= e!591425 #b00000000000000000000000000000000)))

(declare-fun bm!44244 () Bool)

(assert (=> bm!44244 (= call!44247 (arrayCountValidKeys!0 (_keys!11654 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32169 (_keys!11654 thiss!1427))))))

(declare-fun d!126589 () Bool)

(declare-fun lt!460043 () (_ BitVec 32))

(assert (=> d!126589 (and (bvsge lt!460043 #b00000000000000000000000000000000) (bvsle lt!460043 (bvsub (size!32169 (_keys!11654 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126589 (= lt!460043 e!591425)))

(declare-fun c!106251 () Bool)

(assert (=> d!126589 (= c!106251 (bvsge #b00000000000000000000000000000000 (size!32169 (_keys!11654 thiss!1427))))))

(assert (=> d!126589 (and (bvsle #b00000000000000000000000000000000 (size!32169 (_keys!11654 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32169 (_keys!11654 thiss!1427)) (size!32169 (_keys!11654 thiss!1427))))))

(assert (=> d!126589 (= (arrayCountValidKeys!0 (_keys!11654 thiss!1427) #b00000000000000000000000000000000 (size!32169 (_keys!11654 thiss!1427))) lt!460043)))

(declare-fun b!1043856 () Bool)

(assert (=> b!1043856 (= e!591426 (bvadd #b00000000000000000000000000000001 call!44247))))

(assert (= (and d!126589 c!106251) b!1043855))

(assert (= (and d!126589 (not c!106251)) b!1043854))

(assert (= (and b!1043854 c!106250) b!1043856))

(assert (= (and b!1043854 (not c!106250)) b!1043853))

(assert (= (or b!1043856 b!1043853) bm!44244))

(declare-fun m!963537 () Bool)

(assert (=> b!1043854 m!963537))

(assert (=> b!1043854 m!963537))

(declare-fun m!963539 () Bool)

(assert (=> b!1043854 m!963539))

(declare-fun m!963541 () Bool)

(assert (=> bm!44244 m!963541))

(assert (=> b!1043754 d!126589))

(declare-fun b!1043867 () Bool)

(declare-fun e!591438 () Bool)

(declare-fun call!44250 () Bool)

(assert (=> b!1043867 (= e!591438 call!44250)))

(declare-fun b!1043868 () Bool)

(assert (=> b!1043868 (= e!591438 call!44250)))

(declare-fun b!1043869 () Bool)

(declare-fun e!591437 () Bool)

(declare-fun e!591436 () Bool)

(assert (=> b!1043869 (= e!591437 e!591436)))

(declare-fun res!695169 () Bool)

(assert (=> b!1043869 (=> (not res!695169) (not e!591436))))

(declare-fun e!591435 () Bool)

(assert (=> b!1043869 (= res!695169 (not e!591435))))

(declare-fun res!695170 () Bool)

(assert (=> b!1043869 (=> (not res!695170) (not e!591435))))

(assert (=> b!1043869 (= res!695170 (validKeyInArray!0 (select (arr!31633 lt!459983) #b00000000000000000000000000000000)))))

(declare-fun d!126591 () Bool)

(declare-fun res!695168 () Bool)

(assert (=> d!126591 (=> res!695168 e!591437)))

(assert (=> d!126591 (= res!695168 (bvsge #b00000000000000000000000000000000 (size!32169 lt!459983)))))

(assert (=> d!126591 (= (arrayNoDuplicates!0 lt!459983 #b00000000000000000000000000000000 Nil!21964) e!591437)))

(declare-fun b!1043870 () Bool)

(declare-fun contains!6084 (List!21967 (_ BitVec 64)) Bool)

(assert (=> b!1043870 (= e!591435 (contains!6084 Nil!21964 (select (arr!31633 lt!459983) #b00000000000000000000000000000000)))))

(declare-fun bm!44247 () Bool)

(declare-fun c!106254 () Bool)

(assert (=> bm!44247 (= call!44250 (arrayNoDuplicates!0 lt!459983 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106254 (Cons!21963 (select (arr!31633 lt!459983) #b00000000000000000000000000000000) Nil!21964) Nil!21964)))))

(declare-fun b!1043871 () Bool)

(assert (=> b!1043871 (= e!591436 e!591438)))

(assert (=> b!1043871 (= c!106254 (validKeyInArray!0 (select (arr!31633 lt!459983) #b00000000000000000000000000000000)))))

(assert (= (and d!126591 (not res!695168)) b!1043869))

(assert (= (and b!1043869 res!695170) b!1043870))

(assert (= (and b!1043869 res!695169) b!1043871))

(assert (= (and b!1043871 c!106254) b!1043868))

(assert (= (and b!1043871 (not c!106254)) b!1043867))

(assert (= (or b!1043868 b!1043867) bm!44247))

(assert (=> b!1043869 m!963523))

(assert (=> b!1043869 m!963523))

(assert (=> b!1043869 m!963533))

(assert (=> b!1043870 m!963523))

(assert (=> b!1043870 m!963523))

(declare-fun m!963543 () Bool)

(assert (=> b!1043870 m!963543))

(assert (=> bm!44247 m!963523))

(declare-fun m!963545 () Bool)

(assert (=> bm!44247 m!963545))

(assert (=> b!1043871 m!963523))

(assert (=> b!1043871 m!963523))

(assert (=> b!1043871 m!963533))

(assert (=> b!1043754 d!126591))

(declare-fun b!1043881 () Bool)

(declare-fun res!695179 () Bool)

(declare-fun e!591444 () Bool)

(assert (=> b!1043881 (=> (not res!695179) (not e!591444))))

(assert (=> b!1043881 (= res!695179 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!126593 () Bool)

(declare-fun e!591443 () Bool)

(assert (=> d!126593 e!591443))

(declare-fun res!695181 () Bool)

(assert (=> d!126593 (=> (not res!695181) (not e!591443))))

(assert (=> d!126593 (= res!695181 (and (bvsge (index!41464 lt!459986) #b00000000000000000000000000000000) (bvslt (index!41464 lt!459986) (size!32169 (_keys!11654 thiss!1427)))))))

(declare-fun lt!460046 () Unit!34059)

(declare-fun choose!82 (array!65765 (_ BitVec 32) (_ BitVec 64)) Unit!34059)

(assert (=> d!126593 (= lt!460046 (choose!82 (_keys!11654 thiss!1427) (index!41464 lt!459986) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126593 e!591444))

(declare-fun res!695182 () Bool)

(assert (=> d!126593 (=> (not res!695182) (not e!591444))))

(assert (=> d!126593 (= res!695182 (and (bvsge (index!41464 lt!459986) #b00000000000000000000000000000000) (bvslt (index!41464 lt!459986) (size!32169 (_keys!11654 thiss!1427)))))))

(assert (=> d!126593 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11654 thiss!1427) (index!41464 lt!459986) #b1000000000000000000000000000000000000000000000000000000000000000) lt!460046)))

(declare-fun b!1043880 () Bool)

(declare-fun res!695180 () Bool)

(assert (=> b!1043880 (=> (not res!695180) (not e!591444))))

(assert (=> b!1043880 (= res!695180 (validKeyInArray!0 (select (arr!31633 (_keys!11654 thiss!1427)) (index!41464 lt!459986))))))

(declare-fun b!1043882 () Bool)

(assert (=> b!1043882 (= e!591444 (bvslt (size!32169 (_keys!11654 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1043883 () Bool)

(assert (=> b!1043883 (= e!591443 (= (arrayCountValidKeys!0 (array!65766 (store (arr!31633 (_keys!11654 thiss!1427)) (index!41464 lt!459986) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32169 (_keys!11654 thiss!1427))) #b00000000000000000000000000000000 (size!32169 (_keys!11654 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11654 thiss!1427) #b00000000000000000000000000000000 (size!32169 (_keys!11654 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!126593 res!695182) b!1043880))

(assert (= (and b!1043880 res!695180) b!1043881))

(assert (= (and b!1043881 res!695179) b!1043882))

(assert (= (and d!126593 res!695181) b!1043883))

(declare-fun m!963547 () Bool)

(assert (=> b!1043881 m!963547))

(declare-fun m!963549 () Bool)

(assert (=> d!126593 m!963549))

(declare-fun m!963551 () Bool)

(assert (=> b!1043880 m!963551))

(assert (=> b!1043880 m!963551))

(declare-fun m!963553 () Bool)

(assert (=> b!1043880 m!963553))

(assert (=> b!1043883 m!963415))

(declare-fun m!963555 () Bool)

(assert (=> b!1043883 m!963555))

(assert (=> b!1043883 m!963423))

(assert (=> b!1043754 d!126593))

(declare-fun d!126595 () Bool)

(assert (=> d!126595 (= (validMask!0 (mask!30489 thiss!1427)) (and (or (= (mask!30489 thiss!1427) #b00000000000000000000000000000111) (= (mask!30489 thiss!1427) #b00000000000000000000000000001111) (= (mask!30489 thiss!1427) #b00000000000000000000000000011111) (= (mask!30489 thiss!1427) #b00000000000000000000000000111111) (= (mask!30489 thiss!1427) #b00000000000000000000000001111111) (= (mask!30489 thiss!1427) #b00000000000000000000000011111111) (= (mask!30489 thiss!1427) #b00000000000000000000000111111111) (= (mask!30489 thiss!1427) #b00000000000000000000001111111111) (= (mask!30489 thiss!1427) #b00000000000000000000011111111111) (= (mask!30489 thiss!1427) #b00000000000000000000111111111111) (= (mask!30489 thiss!1427) #b00000000000000000001111111111111) (= (mask!30489 thiss!1427) #b00000000000000000011111111111111) (= (mask!30489 thiss!1427) #b00000000000000000111111111111111) (= (mask!30489 thiss!1427) #b00000000000000001111111111111111) (= (mask!30489 thiss!1427) #b00000000000000011111111111111111) (= (mask!30489 thiss!1427) #b00000000000000111111111111111111) (= (mask!30489 thiss!1427) #b00000000000001111111111111111111) (= (mask!30489 thiss!1427) #b00000000000011111111111111111111) (= (mask!30489 thiss!1427) #b00000000000111111111111111111111) (= (mask!30489 thiss!1427) #b00000000001111111111111111111111) (= (mask!30489 thiss!1427) #b00000000011111111111111111111111) (= (mask!30489 thiss!1427) #b00000000111111111111111111111111) (= (mask!30489 thiss!1427) #b00000001111111111111111111111111) (= (mask!30489 thiss!1427) #b00000011111111111111111111111111) (= (mask!30489 thiss!1427) #b00000111111111111111111111111111) (= (mask!30489 thiss!1427) #b00001111111111111111111111111111) (= (mask!30489 thiss!1427) #b00011111111111111111111111111111) (= (mask!30489 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30489 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1043754 d!126595))

(declare-fun b!1043884 () Bool)

(declare-fun e!591446 () (_ BitVec 32))

(declare-fun call!44251 () (_ BitVec 32))

(assert (=> b!1043884 (= e!591446 call!44251)))

(declare-fun b!1043885 () Bool)

(declare-fun e!591445 () (_ BitVec 32))

(assert (=> b!1043885 (= e!591445 e!591446)))

(declare-fun c!106255 () Bool)

(assert (=> b!1043885 (= c!106255 (validKeyInArray!0 (select (arr!31633 lt!459983) #b00000000000000000000000000000000)))))

(declare-fun b!1043886 () Bool)

(assert (=> b!1043886 (= e!591445 #b00000000000000000000000000000000)))

(declare-fun bm!44248 () Bool)

(assert (=> bm!44248 (= call!44251 (arrayCountValidKeys!0 lt!459983 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32169 (_keys!11654 thiss!1427))))))

(declare-fun d!126597 () Bool)

(declare-fun lt!460047 () (_ BitVec 32))

(assert (=> d!126597 (and (bvsge lt!460047 #b00000000000000000000000000000000) (bvsle lt!460047 (bvsub (size!32169 lt!459983) #b00000000000000000000000000000000)))))

(assert (=> d!126597 (= lt!460047 e!591445)))

(declare-fun c!106256 () Bool)

(assert (=> d!126597 (= c!106256 (bvsge #b00000000000000000000000000000000 (size!32169 (_keys!11654 thiss!1427))))))

(assert (=> d!126597 (and (bvsle #b00000000000000000000000000000000 (size!32169 (_keys!11654 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32169 (_keys!11654 thiss!1427)) (size!32169 lt!459983)))))

(assert (=> d!126597 (= (arrayCountValidKeys!0 lt!459983 #b00000000000000000000000000000000 (size!32169 (_keys!11654 thiss!1427))) lt!460047)))

(declare-fun b!1043887 () Bool)

(assert (=> b!1043887 (= e!591446 (bvadd #b00000000000000000000000000000001 call!44251))))

(assert (= (and d!126597 c!106256) b!1043886))

(assert (= (and d!126597 (not c!106256)) b!1043885))

(assert (= (and b!1043885 c!106255) b!1043887))

(assert (= (and b!1043885 (not c!106255)) b!1043884))

(assert (= (or b!1043887 b!1043884) bm!44248))

(assert (=> b!1043885 m!963523))

(assert (=> b!1043885 m!963523))

(assert (=> b!1043885 m!963533))

(declare-fun m!963557 () Bool)

(assert (=> bm!44248 m!963557))

(assert (=> b!1043754 d!126597))

(declare-fun d!126599 () Bool)

(assert (=> d!126599 (= (array_inv!24455 (_keys!11654 thiss!1427)) (bvsge (size!32169 (_keys!11654 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043749 d!126599))

(declare-fun d!126601 () Bool)

(assert (=> d!126601 (= (array_inv!24456 (_values!6389 thiss!1427)) (bvsge (size!32170 (_values!6389 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043749 d!126601))

(declare-fun b!1043888 () Bool)

(declare-fun e!591448 () Bool)

(declare-fun e!591449 () Bool)

(assert (=> b!1043888 (= e!591448 e!591449)))

(declare-fun lt!460048 () (_ BitVec 64))

(assert (=> b!1043888 (= lt!460048 (select (arr!31633 (_keys!11654 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460049 () Unit!34059)

(assert (=> b!1043888 (= lt!460049 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11654 thiss!1427) lt!460048 #b00000000000000000000000000000000))))

(assert (=> b!1043888 (arrayContainsKey!0 (_keys!11654 thiss!1427) lt!460048 #b00000000000000000000000000000000)))

(declare-fun lt!460050 () Unit!34059)

(assert (=> b!1043888 (= lt!460050 lt!460049)))

(declare-fun res!695183 () Bool)

(assert (=> b!1043888 (= res!695183 (= (seekEntryOrOpen!0 (select (arr!31633 (_keys!11654 thiss!1427)) #b00000000000000000000000000000000) (_keys!11654 thiss!1427) (mask!30489 thiss!1427)) (Found!9773 #b00000000000000000000000000000000)))))

(assert (=> b!1043888 (=> (not res!695183) (not e!591449))))

(declare-fun b!1043889 () Bool)

(declare-fun e!591447 () Bool)

(assert (=> b!1043889 (= e!591447 e!591448)))

(declare-fun c!106257 () Bool)

(assert (=> b!1043889 (= c!106257 (validKeyInArray!0 (select (arr!31633 (_keys!11654 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043890 () Bool)

(declare-fun call!44252 () Bool)

(assert (=> b!1043890 (= e!591449 call!44252)))

(declare-fun d!126603 () Bool)

(declare-fun res!695184 () Bool)

(assert (=> d!126603 (=> res!695184 e!591447)))

(assert (=> d!126603 (= res!695184 (bvsge #b00000000000000000000000000000000 (size!32169 (_keys!11654 thiss!1427))))))

(assert (=> d!126603 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11654 thiss!1427) (mask!30489 thiss!1427)) e!591447)))

(declare-fun b!1043891 () Bool)

(assert (=> b!1043891 (= e!591448 call!44252)))

(declare-fun bm!44249 () Bool)

(assert (=> bm!44249 (= call!44252 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11654 thiss!1427) (mask!30489 thiss!1427)))))

(assert (= (and d!126603 (not res!695184)) b!1043889))

(assert (= (and b!1043889 c!106257) b!1043888))

(assert (= (and b!1043889 (not c!106257)) b!1043891))

(assert (= (and b!1043888 res!695183) b!1043890))

(assert (= (or b!1043890 b!1043891) bm!44249))

(assert (=> b!1043888 m!963537))

(declare-fun m!963559 () Bool)

(assert (=> b!1043888 m!963559))

(declare-fun m!963561 () Bool)

(assert (=> b!1043888 m!963561))

(assert (=> b!1043888 m!963537))

(declare-fun m!963563 () Bool)

(assert (=> b!1043888 m!963563))

(assert (=> b!1043889 m!963537))

(assert (=> b!1043889 m!963537))

(assert (=> b!1043889 m!963539))

(declare-fun m!963565 () Bool)

(assert (=> bm!44249 m!963565))

(assert (=> b!1043750 d!126603))

(declare-fun b!1043892 () Bool)

(declare-fun e!591453 () Bool)

(declare-fun call!44253 () Bool)

(assert (=> b!1043892 (= e!591453 call!44253)))

(declare-fun b!1043893 () Bool)

(assert (=> b!1043893 (= e!591453 call!44253)))

(declare-fun b!1043894 () Bool)

(declare-fun e!591452 () Bool)

(declare-fun e!591451 () Bool)

(assert (=> b!1043894 (= e!591452 e!591451)))

(declare-fun res!695186 () Bool)

(assert (=> b!1043894 (=> (not res!695186) (not e!591451))))

(declare-fun e!591450 () Bool)

(assert (=> b!1043894 (= res!695186 (not e!591450))))

(declare-fun res!695187 () Bool)

(assert (=> b!1043894 (=> (not res!695187) (not e!591450))))

(assert (=> b!1043894 (= res!695187 (validKeyInArray!0 (select (arr!31633 (_keys!11654 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!126605 () Bool)

(declare-fun res!695185 () Bool)

(assert (=> d!126605 (=> res!695185 e!591452)))

(assert (=> d!126605 (= res!695185 (bvsge #b00000000000000000000000000000000 (size!32169 (_keys!11654 thiss!1427))))))

(assert (=> d!126605 (= (arrayNoDuplicates!0 (_keys!11654 thiss!1427) #b00000000000000000000000000000000 Nil!21964) e!591452)))

(declare-fun b!1043895 () Bool)

(assert (=> b!1043895 (= e!591450 (contains!6084 Nil!21964 (select (arr!31633 (_keys!11654 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44250 () Bool)

(declare-fun c!106258 () Bool)

(assert (=> bm!44250 (= call!44253 (arrayNoDuplicates!0 (_keys!11654 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106258 (Cons!21963 (select (arr!31633 (_keys!11654 thiss!1427)) #b00000000000000000000000000000000) Nil!21964) Nil!21964)))))

(declare-fun b!1043896 () Bool)

(assert (=> b!1043896 (= e!591451 e!591453)))

(assert (=> b!1043896 (= c!106258 (validKeyInArray!0 (select (arr!31633 (_keys!11654 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126605 (not res!695185)) b!1043894))

(assert (= (and b!1043894 res!695187) b!1043895))

(assert (= (and b!1043894 res!695186) b!1043896))

(assert (= (and b!1043896 c!106258) b!1043893))

(assert (= (and b!1043896 (not c!106258)) b!1043892))

(assert (= (or b!1043893 b!1043892) bm!44250))

(assert (=> b!1043894 m!963537))

(assert (=> b!1043894 m!963537))

(assert (=> b!1043894 m!963539))

(assert (=> b!1043895 m!963537))

(assert (=> b!1043895 m!963537))

(declare-fun m!963567 () Bool)

(assert (=> b!1043895 m!963567))

(assert (=> bm!44250 m!963537))

(declare-fun m!963569 () Bool)

(assert (=> bm!44250 m!963569))

(assert (=> b!1043896 m!963537))

(assert (=> b!1043896 m!963537))

(assert (=> b!1043896 m!963539))

(assert (=> b!1043751 d!126605))

(declare-fun b!1043909 () Bool)

(declare-fun e!591461 () SeekEntryResult!9773)

(declare-fun e!591460 () SeekEntryResult!9773)

(assert (=> b!1043909 (= e!591461 e!591460)))

(declare-fun lt!460061 () (_ BitVec 64))

(declare-fun lt!460062 () SeekEntryResult!9773)

(assert (=> b!1043909 (= lt!460061 (select (arr!31633 (_keys!11654 thiss!1427)) (index!41465 lt!460062)))))

(declare-fun c!106267 () Bool)

(assert (=> b!1043909 (= c!106267 (= lt!460061 key!909))))

(declare-fun b!1043910 () Bool)

(declare-fun e!591462 () SeekEntryResult!9773)

(assert (=> b!1043910 (= e!591462 (MissingZero!9773 (index!41465 lt!460062)))))

(declare-fun b!1043911 () Bool)

(assert (=> b!1043911 (= e!591460 (Found!9773 (index!41465 lt!460062)))))

(declare-fun b!1043912 () Bool)

(declare-fun c!106265 () Bool)

(assert (=> b!1043912 (= c!106265 (= lt!460061 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1043912 (= e!591460 e!591462)))

(declare-fun b!1043913 () Bool)

(assert (=> b!1043913 (= e!591461 Undefined!9773)))

(declare-fun b!1043914 () Bool)

(declare-fun lt!460060 () SeekEntryResult!9773)

(assert (=> b!1043914 (= e!591462 (ite ((_ is MissingVacant!9773) lt!460060) (MissingZero!9773 (index!41466 lt!460060)) lt!460060))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65765 (_ BitVec 32)) SeekEntryResult!9773)

(assert (=> b!1043914 (= lt!460060 (seekKeyOrZeroReturnVacant!0 (x!93047 lt!460062) (index!41465 lt!460062) (index!41465 lt!460062) key!909 (_keys!11654 thiss!1427) (mask!30489 thiss!1427)))))

(declare-fun d!126607 () Bool)

(declare-fun lt!460059 () SeekEntryResult!9773)

(assert (=> d!126607 (and (or ((_ is MissingVacant!9773) lt!460059) (not ((_ is Found!9773) lt!460059)) (and (bvsge (index!41464 lt!460059) #b00000000000000000000000000000000) (bvslt (index!41464 lt!460059) (size!32169 (_keys!11654 thiss!1427))))) (not ((_ is MissingVacant!9773) lt!460059)) (or (not ((_ is Found!9773) lt!460059)) (= (select (arr!31633 (_keys!11654 thiss!1427)) (index!41464 lt!460059)) key!909)))))

(assert (=> d!126607 (= lt!460059 e!591461)))

(declare-fun c!106266 () Bool)

(assert (=> d!126607 (= c!106266 (and ((_ is Intermediate!9773) lt!460062) (undefined!10585 lt!460062)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65765 (_ BitVec 32)) SeekEntryResult!9773)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126607 (= lt!460062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30489 thiss!1427)) key!909 (_keys!11654 thiss!1427) (mask!30489 thiss!1427)))))

(assert (=> d!126607 (validMask!0 (mask!30489 thiss!1427))))

(assert (=> d!126607 (= (seekEntry!0 key!909 (_keys!11654 thiss!1427) (mask!30489 thiss!1427)) lt!460059)))

(assert (= (and d!126607 c!106266) b!1043913))

(assert (= (and d!126607 (not c!106266)) b!1043909))

(assert (= (and b!1043909 c!106267) b!1043911))

(assert (= (and b!1043909 (not c!106267)) b!1043912))

(assert (= (and b!1043912 c!106265) b!1043910))

(assert (= (and b!1043912 (not c!106265)) b!1043914))

(declare-fun m!963571 () Bool)

(assert (=> b!1043909 m!963571))

(declare-fun m!963573 () Bool)

(assert (=> b!1043914 m!963573))

(declare-fun m!963575 () Bool)

(assert (=> d!126607 m!963575))

(declare-fun m!963577 () Bool)

(assert (=> d!126607 m!963577))

(assert (=> d!126607 m!963577))

(declare-fun m!963579 () Bool)

(assert (=> d!126607 m!963579))

(assert (=> d!126607 m!963405))

(assert (=> b!1043748 d!126607))

(declare-fun d!126609 () Bool)

(declare-fun res!695194 () Bool)

(declare-fun e!591465 () Bool)

(assert (=> d!126609 (=> (not res!695194) (not e!591465))))

(declare-fun simpleValid!442 (LongMapFixedSize!5968) Bool)

(assert (=> d!126609 (= res!695194 (simpleValid!442 thiss!1427))))

(assert (=> d!126609 (= (valid!2248 thiss!1427) e!591465)))

(declare-fun b!1043921 () Bool)

(declare-fun res!695195 () Bool)

(assert (=> b!1043921 (=> (not res!695195) (not e!591465))))

(assert (=> b!1043921 (= res!695195 (= (arrayCountValidKeys!0 (_keys!11654 thiss!1427) #b00000000000000000000000000000000 (size!32169 (_keys!11654 thiss!1427))) (_size!3039 thiss!1427)))))

(declare-fun b!1043922 () Bool)

(declare-fun res!695196 () Bool)

(assert (=> b!1043922 (=> (not res!695196) (not e!591465))))

(assert (=> b!1043922 (= res!695196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11654 thiss!1427) (mask!30489 thiss!1427)))))

(declare-fun b!1043923 () Bool)

(assert (=> b!1043923 (= e!591465 (arrayNoDuplicates!0 (_keys!11654 thiss!1427) #b00000000000000000000000000000000 Nil!21964))))

(assert (= (and d!126609 res!695194) b!1043921))

(assert (= (and b!1043921 res!695195) b!1043922))

(assert (= (and b!1043922 res!695196) b!1043923))

(declare-fun m!963581 () Bool)

(assert (=> d!126609 m!963581))

(assert (=> b!1043921 m!963423))

(assert (=> b!1043922 m!963437))

(assert (=> b!1043923 m!963435))

(assert (=> start!91750 d!126609))

(declare-fun b!1043930 () Bool)

(declare-fun e!591470 () Bool)

(assert (=> b!1043930 (= e!591470 tp_is_empty!24781)))

(declare-fun b!1043931 () Bool)

(declare-fun e!591471 () Bool)

(assert (=> b!1043931 (= e!591471 tp_is_empty!24781)))

(declare-fun condMapEmpty!38789 () Bool)

(declare-fun mapDefault!38789 () ValueCell!11687)

(assert (=> mapNonEmpty!38780 (= condMapEmpty!38789 (= mapRest!38780 ((as const (Array (_ BitVec 32) ValueCell!11687)) mapDefault!38789)))))

(declare-fun mapRes!38789 () Bool)

(assert (=> mapNonEmpty!38780 (= tp!74408 (and e!591471 mapRes!38789))))

(declare-fun mapNonEmpty!38789 () Bool)

(declare-fun tp!74424 () Bool)

(assert (=> mapNonEmpty!38789 (= mapRes!38789 (and tp!74424 e!591470))))

(declare-fun mapValue!38789 () ValueCell!11687)

(declare-fun mapRest!38789 () (Array (_ BitVec 32) ValueCell!11687))

(declare-fun mapKey!38789 () (_ BitVec 32))

(assert (=> mapNonEmpty!38789 (= mapRest!38780 (store mapRest!38789 mapKey!38789 mapValue!38789))))

(declare-fun mapIsEmpty!38789 () Bool)

(assert (=> mapIsEmpty!38789 mapRes!38789))

(assert (= (and mapNonEmpty!38780 condMapEmpty!38789) mapIsEmpty!38789))

(assert (= (and mapNonEmpty!38780 (not condMapEmpty!38789)) mapNonEmpty!38789))

(assert (= (and mapNonEmpty!38789 ((_ is ValueCellFull!11687) mapValue!38789)) b!1043930))

(assert (= (and mapNonEmpty!38780 ((_ is ValueCellFull!11687) mapDefault!38789)) b!1043931))

(declare-fun m!963583 () Bool)

(assert (=> mapNonEmpty!38789 m!963583))

(check-sat tp_is_empty!24781 (not b!1043881) (not d!126609) (not bm!44247) (not b!1043854) (not d!126581) (not d!126607) (not b!1043921) (not d!126583) (not b!1043832) (not b!1043826) (not bm!44248) (not bm!44244) (not b!1043842) (not b!1043883) (not b!1043870) (not b!1043922) (not bm!44241) (not b!1043869) (not b!1043823) (not b!1043895) (not d!126593) (not b!1043894) (not b!1043880) (not b!1043820) (not bm!44249) (not b!1043871) b_and!33603 (not b!1043841) (not bm!44250) (not b!1043923) (not b!1043888) (not d!126579) (not b_next!21061) (not b!1043914) (not b!1043896) (not b!1043889) (not mapNonEmpty!38789) (not b!1043885))
(check-sat b_and!33603 (not b_next!21061))
