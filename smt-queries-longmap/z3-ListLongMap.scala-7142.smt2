; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90738 () Bool)

(assert start!90738)

(declare-fun b!1037356 () Bool)

(declare-fun b_free!20905 () Bool)

(declare-fun b_next!20905 () Bool)

(assert (=> b!1037356 (= b_free!20905 (not b_next!20905))))

(declare-fun tp!73863 () Bool)

(declare-fun b_and!33411 () Bool)

(assert (=> b!1037356 (= tp!73863 b_and!33411)))

(declare-fun b!1037352 () Bool)

(declare-fun e!586817 () Bool)

(declare-datatypes ((List!21957 0))(
  ( (Nil!21954) (Cons!21953 (h!23156 (_ BitVec 64)) (t!31162 List!21957)) )
))
(declare-fun noDuplicate!1486 (List!21957) Bool)

(assert (=> b!1037352 (= e!586817 (noDuplicate!1486 Nil!21954))))

(declare-fun mapNonEmpty!38469 () Bool)

(declare-fun mapRes!38469 () Bool)

(declare-fun tp!73864 () Bool)

(declare-fun e!586812 () Bool)

(assert (=> mapNonEmpty!38469 (= mapRes!38469 (and tp!73864 e!586812))))

(declare-datatypes ((V!37707 0))(
  ( (V!37708 (val!12363 Int)) )
))
(declare-datatypes ((ValueCell!11609 0))(
  ( (ValueCellFull!11609 (v!14945 V!37707)) (EmptyCell!11609) )
))
(declare-fun mapRest!38469 () (Array (_ BitVec 32) ValueCell!11609))

(declare-fun mapValue!38469 () ValueCell!11609)

(declare-datatypes ((array!65295 0))(
  ( (array!65296 (arr!31428 (Array (_ BitVec 32) (_ BitVec 64))) (size!31960 (_ BitVec 32))) )
))
(declare-datatypes ((array!65297 0))(
  ( (array!65298 (arr!31429 (Array (_ BitVec 32) ValueCell!11609)) (size!31961 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5812 0))(
  ( (LongMapFixedSize!5813 (defaultEntry!6288 Int) (mask!30205 (_ BitVec 32)) (extraKeys!6016 (_ BitVec 32)) (zeroValue!6122 V!37707) (minValue!6122 V!37707) (_size!2961 (_ BitVec 32)) (_keys!11481 array!65295) (_values!6311 array!65297) (_vacant!2961 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5812)

(declare-fun mapKey!38469 () (_ BitVec 32))

(assert (=> mapNonEmpty!38469 (= (arr!31429 (_values!6311 thiss!1427)) (store mapRest!38469 mapKey!38469 mapValue!38469))))

(declare-fun b!1037353 () Bool)

(declare-fun e!586811 () Bool)

(declare-fun tp_is_empty!24625 () Bool)

(assert (=> b!1037353 (= e!586811 tp_is_empty!24625)))

(declare-fun b!1037355 () Bool)

(declare-fun e!586814 () Bool)

(assert (=> b!1037355 (= e!586814 (not e!586817))))

(declare-fun res!692142 () Bool)

(assert (=> b!1037355 (=> res!692142 e!586817)))

(assert (=> b!1037355 (= res!692142 (or (bvsge (size!31960 (_keys!11481 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31960 (_keys!11481 thiss!1427)))))))

(declare-datatypes ((SeekEntryResult!9749 0))(
  ( (MissingZero!9749 (index!41367 (_ BitVec 32))) (Found!9749 (index!41368 (_ BitVec 32))) (Intermediate!9749 (undefined!10561 Bool) (index!41369 (_ BitVec 32)) (x!92553 (_ BitVec 32))) (Undefined!9749) (MissingVacant!9749 (index!41370 (_ BitVec 32))) )
))
(declare-fun lt!457312 () SeekEntryResult!9749)

(declare-fun arrayCountValidKeys!0 (array!65295 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037355 (= (arrayCountValidKeys!0 (array!65296 (store (arr!31428 (_keys!11481 thiss!1427)) (index!41368 lt!457312) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31960 (_keys!11481 thiss!1427))) #b00000000000000000000000000000000 (size!31960 (_keys!11481 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11481 thiss!1427) #b00000000000000000000000000000000 (size!31960 (_keys!11481 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33837 0))(
  ( (Unit!33838) )
))
(declare-fun lt!457311 () Unit!33837)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65295 (_ BitVec 32) (_ BitVec 64)) Unit!33837)

(assert (=> b!1037355 (= lt!457311 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11481 thiss!1427) (index!41368 lt!457312) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586816 () Bool)

(declare-fun e!586810 () Bool)

(declare-fun array_inv!24305 (array!65295) Bool)

(declare-fun array_inv!24306 (array!65297) Bool)

(assert (=> b!1037356 (= e!586810 (and tp!73863 tp_is_empty!24625 (array_inv!24305 (_keys!11481 thiss!1427)) (array_inv!24306 (_values!6311 thiss!1427)) e!586816))))

(declare-fun res!692144 () Bool)

(declare-fun e!586813 () Bool)

(assert (=> start!90738 (=> (not res!692144) (not e!586813))))

(declare-fun valid!2182 (LongMapFixedSize!5812) Bool)

(assert (=> start!90738 (= res!692144 (valid!2182 thiss!1427))))

(assert (=> start!90738 e!586813))

(assert (=> start!90738 e!586810))

(assert (=> start!90738 true))

(declare-fun b!1037354 () Bool)

(declare-fun res!692141 () Bool)

(assert (=> b!1037354 (=> (not res!692141) (not e!586813))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1037354 (= res!692141 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1037357 () Bool)

(assert (=> b!1037357 (= e!586816 (and e!586811 mapRes!38469))))

(declare-fun condMapEmpty!38469 () Bool)

(declare-fun mapDefault!38469 () ValueCell!11609)

(assert (=> b!1037357 (= condMapEmpty!38469 (= (arr!31429 (_values!6311 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11609)) mapDefault!38469)))))

(declare-fun mapIsEmpty!38469 () Bool)

(assert (=> mapIsEmpty!38469 mapRes!38469))

(declare-fun b!1037358 () Bool)

(assert (=> b!1037358 (= e!586812 tp_is_empty!24625)))

(declare-fun b!1037359 () Bool)

(assert (=> b!1037359 (= e!586813 e!586814)))

(declare-fun res!692143 () Bool)

(assert (=> b!1037359 (=> (not res!692143) (not e!586814))))

(get-info :version)

(assert (=> b!1037359 (= res!692143 ((_ is Found!9749) lt!457312))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65295 (_ BitVec 32)) SeekEntryResult!9749)

(assert (=> b!1037359 (= lt!457312 (seekEntry!0 key!909 (_keys!11481 thiss!1427) (mask!30205 thiss!1427)))))

(assert (= (and start!90738 res!692144) b!1037354))

(assert (= (and b!1037354 res!692141) b!1037359))

(assert (= (and b!1037359 res!692143) b!1037355))

(assert (= (and b!1037355 (not res!692142)) b!1037352))

(assert (= (and b!1037357 condMapEmpty!38469) mapIsEmpty!38469))

(assert (= (and b!1037357 (not condMapEmpty!38469)) mapNonEmpty!38469))

(assert (= (and mapNonEmpty!38469 ((_ is ValueCellFull!11609) mapValue!38469)) b!1037358))

(assert (= (and b!1037357 ((_ is ValueCellFull!11609) mapDefault!38469)) b!1037353))

(assert (= b!1037356 b!1037357))

(assert (= start!90738 b!1037356))

(declare-fun m!957075 () Bool)

(assert (=> b!1037356 m!957075))

(declare-fun m!957077 () Bool)

(assert (=> b!1037356 m!957077))

(declare-fun m!957079 () Bool)

(assert (=> b!1037352 m!957079))

(declare-fun m!957081 () Bool)

(assert (=> b!1037355 m!957081))

(declare-fun m!957083 () Bool)

(assert (=> b!1037355 m!957083))

(declare-fun m!957085 () Bool)

(assert (=> b!1037355 m!957085))

(declare-fun m!957087 () Bool)

(assert (=> b!1037355 m!957087))

(declare-fun m!957089 () Bool)

(assert (=> start!90738 m!957089))

(declare-fun m!957091 () Bool)

(assert (=> mapNonEmpty!38469 m!957091))

(declare-fun m!957093 () Bool)

(assert (=> b!1037359 m!957093))

(check-sat (not b!1037356) (not b!1037352) b_and!33411 (not mapNonEmpty!38469) (not b!1037355) (not start!90738) (not b!1037359) tp_is_empty!24625 (not b_next!20905))
(check-sat b_and!33411 (not b_next!20905))
(get-model)

(declare-fun b!1037416 () Bool)

(declare-fun e!586871 () (_ BitVec 32))

(assert (=> b!1037416 (= e!586871 #b00000000000000000000000000000000)))

(declare-fun b!1037417 () Bool)

(declare-fun e!586870 () (_ BitVec 32))

(assert (=> b!1037417 (= e!586871 e!586870)))

(declare-fun c!105091 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1037417 (= c!105091 (validKeyInArray!0 (select (arr!31428 (array!65296 (store (arr!31428 (_keys!11481 thiss!1427)) (index!41368 lt!457312) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31960 (_keys!11481 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!43896 () Bool)

(declare-fun call!43899 () (_ BitVec 32))

(assert (=> bm!43896 (= call!43899 (arrayCountValidKeys!0 (array!65296 (store (arr!31428 (_keys!11481 thiss!1427)) (index!41368 lt!457312) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31960 (_keys!11481 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31960 (_keys!11481 thiss!1427))))))

(declare-fun b!1037418 () Bool)

(assert (=> b!1037418 (= e!586870 call!43899)))

(declare-fun d!125091 () Bool)

(declare-fun lt!457327 () (_ BitVec 32))

(assert (=> d!125091 (and (bvsge lt!457327 #b00000000000000000000000000000000) (bvsle lt!457327 (bvsub (size!31960 (array!65296 (store (arr!31428 (_keys!11481 thiss!1427)) (index!41368 lt!457312) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31960 (_keys!11481 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!125091 (= lt!457327 e!586871)))

(declare-fun c!105090 () Bool)

(assert (=> d!125091 (= c!105090 (bvsge #b00000000000000000000000000000000 (size!31960 (_keys!11481 thiss!1427))))))

(assert (=> d!125091 (and (bvsle #b00000000000000000000000000000000 (size!31960 (_keys!11481 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31960 (_keys!11481 thiss!1427)) (size!31960 (array!65296 (store (arr!31428 (_keys!11481 thiss!1427)) (index!41368 lt!457312) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31960 (_keys!11481 thiss!1427))))))))

(assert (=> d!125091 (= (arrayCountValidKeys!0 (array!65296 (store (arr!31428 (_keys!11481 thiss!1427)) (index!41368 lt!457312) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31960 (_keys!11481 thiss!1427))) #b00000000000000000000000000000000 (size!31960 (_keys!11481 thiss!1427))) lt!457327)))

(declare-fun b!1037419 () Bool)

(assert (=> b!1037419 (= e!586870 (bvadd #b00000000000000000000000000000001 call!43899))))

(assert (= (and d!125091 c!105090) b!1037416))

(assert (= (and d!125091 (not c!105090)) b!1037417))

(assert (= (and b!1037417 c!105091) b!1037419))

(assert (= (and b!1037417 (not c!105091)) b!1037418))

(assert (= (or b!1037419 b!1037418) bm!43896))

(declare-fun m!957135 () Bool)

(assert (=> b!1037417 m!957135))

(assert (=> b!1037417 m!957135))

(declare-fun m!957137 () Bool)

(assert (=> b!1037417 m!957137))

(declare-fun m!957139 () Bool)

(assert (=> bm!43896 m!957139))

(assert (=> b!1037355 d!125091))

(declare-fun b!1037420 () Bool)

(declare-fun e!586873 () (_ BitVec 32))

(assert (=> b!1037420 (= e!586873 #b00000000000000000000000000000000)))

(declare-fun b!1037421 () Bool)

(declare-fun e!586872 () (_ BitVec 32))

(assert (=> b!1037421 (= e!586873 e!586872)))

(declare-fun c!105093 () Bool)

(assert (=> b!1037421 (= c!105093 (validKeyInArray!0 (select (arr!31428 (_keys!11481 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43897 () Bool)

(declare-fun call!43900 () (_ BitVec 32))

(assert (=> bm!43897 (= call!43900 (arrayCountValidKeys!0 (_keys!11481 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31960 (_keys!11481 thiss!1427))))))

(declare-fun b!1037422 () Bool)

(assert (=> b!1037422 (= e!586872 call!43900)))

(declare-fun d!125093 () Bool)

(declare-fun lt!457328 () (_ BitVec 32))

(assert (=> d!125093 (and (bvsge lt!457328 #b00000000000000000000000000000000) (bvsle lt!457328 (bvsub (size!31960 (_keys!11481 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125093 (= lt!457328 e!586873)))

(declare-fun c!105092 () Bool)

(assert (=> d!125093 (= c!105092 (bvsge #b00000000000000000000000000000000 (size!31960 (_keys!11481 thiss!1427))))))

(assert (=> d!125093 (and (bvsle #b00000000000000000000000000000000 (size!31960 (_keys!11481 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31960 (_keys!11481 thiss!1427)) (size!31960 (_keys!11481 thiss!1427))))))

(assert (=> d!125093 (= (arrayCountValidKeys!0 (_keys!11481 thiss!1427) #b00000000000000000000000000000000 (size!31960 (_keys!11481 thiss!1427))) lt!457328)))

(declare-fun b!1037423 () Bool)

(assert (=> b!1037423 (= e!586872 (bvadd #b00000000000000000000000000000001 call!43900))))

(assert (= (and d!125093 c!105092) b!1037420))

(assert (= (and d!125093 (not c!105092)) b!1037421))

(assert (= (and b!1037421 c!105093) b!1037423))

(assert (= (and b!1037421 (not c!105093)) b!1037422))

(assert (= (or b!1037423 b!1037422) bm!43897))

(declare-fun m!957141 () Bool)

(assert (=> b!1037421 m!957141))

(assert (=> b!1037421 m!957141))

(declare-fun m!957143 () Bool)

(assert (=> b!1037421 m!957143))

(declare-fun m!957145 () Bool)

(assert (=> bm!43897 m!957145))

(assert (=> b!1037355 d!125093))

(declare-fun b!1037432 () Bool)

(declare-fun res!692177 () Bool)

(declare-fun e!586879 () Bool)

(assert (=> b!1037432 (=> (not res!692177) (not e!586879))))

(assert (=> b!1037432 (= res!692177 (validKeyInArray!0 (select (arr!31428 (_keys!11481 thiss!1427)) (index!41368 lt!457312))))))

(declare-fun d!125095 () Bool)

(declare-fun e!586878 () Bool)

(assert (=> d!125095 e!586878))

(declare-fun res!692179 () Bool)

(assert (=> d!125095 (=> (not res!692179) (not e!586878))))

(assert (=> d!125095 (= res!692179 (and (bvsge (index!41368 lt!457312) #b00000000000000000000000000000000) (bvslt (index!41368 lt!457312) (size!31960 (_keys!11481 thiss!1427)))))))

(declare-fun lt!457331 () Unit!33837)

(declare-fun choose!82 (array!65295 (_ BitVec 32) (_ BitVec 64)) Unit!33837)

(assert (=> d!125095 (= lt!457331 (choose!82 (_keys!11481 thiss!1427) (index!41368 lt!457312) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125095 e!586879))

(declare-fun res!692178 () Bool)

(assert (=> d!125095 (=> (not res!692178) (not e!586879))))

(assert (=> d!125095 (= res!692178 (and (bvsge (index!41368 lt!457312) #b00000000000000000000000000000000) (bvslt (index!41368 lt!457312) (size!31960 (_keys!11481 thiss!1427)))))))

(assert (=> d!125095 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11481 thiss!1427) (index!41368 lt!457312) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457331)))

(declare-fun b!1037434 () Bool)

(assert (=> b!1037434 (= e!586879 (bvslt (size!31960 (_keys!11481 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1037435 () Bool)

(assert (=> b!1037435 (= e!586878 (= (arrayCountValidKeys!0 (array!65296 (store (arr!31428 (_keys!11481 thiss!1427)) (index!41368 lt!457312) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31960 (_keys!11481 thiss!1427))) #b00000000000000000000000000000000 (size!31960 (_keys!11481 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11481 thiss!1427) #b00000000000000000000000000000000 (size!31960 (_keys!11481 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1037433 () Bool)

(declare-fun res!692180 () Bool)

(assert (=> b!1037433 (=> (not res!692180) (not e!586879))))

(assert (=> b!1037433 (= res!692180 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125095 res!692178) b!1037432))

(assert (= (and b!1037432 res!692177) b!1037433))

(assert (= (and b!1037433 res!692180) b!1037434))

(assert (= (and d!125095 res!692179) b!1037435))

(declare-fun m!957147 () Bool)

(assert (=> b!1037432 m!957147))

(assert (=> b!1037432 m!957147))

(declare-fun m!957149 () Bool)

(assert (=> b!1037432 m!957149))

(declare-fun m!957151 () Bool)

(assert (=> d!125095 m!957151))

(assert (=> b!1037435 m!957081))

(assert (=> b!1037435 m!957083))

(assert (=> b!1037435 m!957085))

(declare-fun m!957153 () Bool)

(assert (=> b!1037433 m!957153))

(assert (=> b!1037355 d!125095))

(declare-fun b!1037448 () Bool)

(declare-fun e!586886 () SeekEntryResult!9749)

(declare-fun lt!457341 () SeekEntryResult!9749)

(assert (=> b!1037448 (= e!586886 (ite ((_ is MissingVacant!9749) lt!457341) (MissingZero!9749 (index!41370 lt!457341)) lt!457341))))

(declare-fun lt!457343 () SeekEntryResult!9749)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65295 (_ BitVec 32)) SeekEntryResult!9749)

(assert (=> b!1037448 (= lt!457341 (seekKeyOrZeroReturnVacant!0 (x!92553 lt!457343) (index!41369 lt!457343) (index!41369 lt!457343) key!909 (_keys!11481 thiss!1427) (mask!30205 thiss!1427)))))

(declare-fun b!1037449 () Bool)

(declare-fun c!105101 () Bool)

(declare-fun lt!457342 () (_ BitVec 64))

(assert (=> b!1037449 (= c!105101 (= lt!457342 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586888 () SeekEntryResult!9749)

(assert (=> b!1037449 (= e!586888 e!586886)))

(declare-fun b!1037450 () Bool)

(assert (=> b!1037450 (= e!586888 (Found!9749 (index!41369 lt!457343)))))

(declare-fun b!1037451 () Bool)

(declare-fun e!586887 () SeekEntryResult!9749)

(assert (=> b!1037451 (= e!586887 e!586888)))

(assert (=> b!1037451 (= lt!457342 (select (arr!31428 (_keys!11481 thiss!1427)) (index!41369 lt!457343)))))

(declare-fun c!105102 () Bool)

(assert (=> b!1037451 (= c!105102 (= lt!457342 key!909))))

(declare-fun b!1037452 () Bool)

(assert (=> b!1037452 (= e!586886 (MissingZero!9749 (index!41369 lt!457343)))))

(declare-fun d!125097 () Bool)

(declare-fun lt!457340 () SeekEntryResult!9749)

(assert (=> d!125097 (and (or ((_ is MissingVacant!9749) lt!457340) (not ((_ is Found!9749) lt!457340)) (and (bvsge (index!41368 lt!457340) #b00000000000000000000000000000000) (bvslt (index!41368 lt!457340) (size!31960 (_keys!11481 thiss!1427))))) (not ((_ is MissingVacant!9749) lt!457340)) (or (not ((_ is Found!9749) lt!457340)) (= (select (arr!31428 (_keys!11481 thiss!1427)) (index!41368 lt!457340)) key!909)))))

(assert (=> d!125097 (= lt!457340 e!586887)))

(declare-fun c!105100 () Bool)

(assert (=> d!125097 (= c!105100 (and ((_ is Intermediate!9749) lt!457343) (undefined!10561 lt!457343)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65295 (_ BitVec 32)) SeekEntryResult!9749)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125097 (= lt!457343 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30205 thiss!1427)) key!909 (_keys!11481 thiss!1427) (mask!30205 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125097 (validMask!0 (mask!30205 thiss!1427))))

(assert (=> d!125097 (= (seekEntry!0 key!909 (_keys!11481 thiss!1427) (mask!30205 thiss!1427)) lt!457340)))

(declare-fun b!1037453 () Bool)

(assert (=> b!1037453 (= e!586887 Undefined!9749)))

(assert (= (and d!125097 c!105100) b!1037453))

(assert (= (and d!125097 (not c!105100)) b!1037451))

(assert (= (and b!1037451 c!105102) b!1037450))

(assert (= (and b!1037451 (not c!105102)) b!1037449))

(assert (= (and b!1037449 c!105101) b!1037452))

(assert (= (and b!1037449 (not c!105101)) b!1037448))

(declare-fun m!957155 () Bool)

(assert (=> b!1037448 m!957155))

(declare-fun m!957157 () Bool)

(assert (=> b!1037451 m!957157))

(declare-fun m!957159 () Bool)

(assert (=> d!125097 m!957159))

(declare-fun m!957161 () Bool)

(assert (=> d!125097 m!957161))

(assert (=> d!125097 m!957161))

(declare-fun m!957163 () Bool)

(assert (=> d!125097 m!957163))

(declare-fun m!957165 () Bool)

(assert (=> d!125097 m!957165))

(assert (=> b!1037359 d!125097))

(declare-fun d!125099 () Bool)

(declare-fun res!692187 () Bool)

(declare-fun e!586891 () Bool)

(assert (=> d!125099 (=> (not res!692187) (not e!586891))))

(declare-fun simpleValid!418 (LongMapFixedSize!5812) Bool)

(assert (=> d!125099 (= res!692187 (simpleValid!418 thiss!1427))))

(assert (=> d!125099 (= (valid!2182 thiss!1427) e!586891)))

(declare-fun b!1037460 () Bool)

(declare-fun res!692188 () Bool)

(assert (=> b!1037460 (=> (not res!692188) (not e!586891))))

(assert (=> b!1037460 (= res!692188 (= (arrayCountValidKeys!0 (_keys!11481 thiss!1427) #b00000000000000000000000000000000 (size!31960 (_keys!11481 thiss!1427))) (_size!2961 thiss!1427)))))

(declare-fun b!1037461 () Bool)

(declare-fun res!692189 () Bool)

(assert (=> b!1037461 (=> (not res!692189) (not e!586891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65295 (_ BitVec 32)) Bool)

(assert (=> b!1037461 (= res!692189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11481 thiss!1427) (mask!30205 thiss!1427)))))

(declare-fun b!1037462 () Bool)

(declare-fun arrayNoDuplicates!0 (array!65295 (_ BitVec 32) List!21957) Bool)

(assert (=> b!1037462 (= e!586891 (arrayNoDuplicates!0 (_keys!11481 thiss!1427) #b00000000000000000000000000000000 Nil!21954))))

(assert (= (and d!125099 res!692187) b!1037460))

(assert (= (and b!1037460 res!692188) b!1037461))

(assert (= (and b!1037461 res!692189) b!1037462))

(declare-fun m!957167 () Bool)

(assert (=> d!125099 m!957167))

(assert (=> b!1037460 m!957085))

(declare-fun m!957169 () Bool)

(assert (=> b!1037461 m!957169))

(declare-fun m!957171 () Bool)

(assert (=> b!1037462 m!957171))

(assert (=> start!90738 d!125099))

(declare-fun d!125101 () Bool)

(declare-fun res!692194 () Bool)

(declare-fun e!586896 () Bool)

(assert (=> d!125101 (=> res!692194 e!586896)))

(assert (=> d!125101 (= res!692194 ((_ is Nil!21954) Nil!21954))))

(assert (=> d!125101 (= (noDuplicate!1486 Nil!21954) e!586896)))

(declare-fun b!1037467 () Bool)

(declare-fun e!586897 () Bool)

(assert (=> b!1037467 (= e!586896 e!586897)))

(declare-fun res!692195 () Bool)

(assert (=> b!1037467 (=> (not res!692195) (not e!586897))))

(declare-fun contains!6005 (List!21957 (_ BitVec 64)) Bool)

(assert (=> b!1037467 (= res!692195 (not (contains!6005 (t!31162 Nil!21954) (h!23156 Nil!21954))))))

(declare-fun b!1037468 () Bool)

(assert (=> b!1037468 (= e!586897 (noDuplicate!1486 (t!31162 Nil!21954)))))

(assert (= (and d!125101 (not res!692194)) b!1037467))

(assert (= (and b!1037467 res!692195) b!1037468))

(declare-fun m!957173 () Bool)

(assert (=> b!1037467 m!957173))

(declare-fun m!957175 () Bool)

(assert (=> b!1037468 m!957175))

(assert (=> b!1037352 d!125101))

(declare-fun d!125103 () Bool)

(assert (=> d!125103 (= (array_inv!24305 (_keys!11481 thiss!1427)) (bvsge (size!31960 (_keys!11481 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037356 d!125103))

(declare-fun d!125105 () Bool)

(assert (=> d!125105 (= (array_inv!24306 (_values!6311 thiss!1427)) (bvsge (size!31961 (_values!6311 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037356 d!125105))

(declare-fun condMapEmpty!38478 () Bool)

(declare-fun mapDefault!38478 () ValueCell!11609)

(assert (=> mapNonEmpty!38469 (= condMapEmpty!38478 (= mapRest!38469 ((as const (Array (_ BitVec 32) ValueCell!11609)) mapDefault!38478)))))

(declare-fun e!586902 () Bool)

(declare-fun mapRes!38478 () Bool)

(assert (=> mapNonEmpty!38469 (= tp!73864 (and e!586902 mapRes!38478))))

(declare-fun b!1037476 () Bool)

(assert (=> b!1037476 (= e!586902 tp_is_empty!24625)))

(declare-fun mapIsEmpty!38478 () Bool)

(assert (=> mapIsEmpty!38478 mapRes!38478))

(declare-fun mapNonEmpty!38478 () Bool)

(declare-fun tp!73879 () Bool)

(declare-fun e!586903 () Bool)

(assert (=> mapNonEmpty!38478 (= mapRes!38478 (and tp!73879 e!586903))))

(declare-fun mapValue!38478 () ValueCell!11609)

(declare-fun mapKey!38478 () (_ BitVec 32))

(declare-fun mapRest!38478 () (Array (_ BitVec 32) ValueCell!11609))

(assert (=> mapNonEmpty!38478 (= mapRest!38469 (store mapRest!38478 mapKey!38478 mapValue!38478))))

(declare-fun b!1037475 () Bool)

(assert (=> b!1037475 (= e!586903 tp_is_empty!24625)))

(assert (= (and mapNonEmpty!38469 condMapEmpty!38478) mapIsEmpty!38478))

(assert (= (and mapNonEmpty!38469 (not condMapEmpty!38478)) mapNonEmpty!38478))

(assert (= (and mapNonEmpty!38478 ((_ is ValueCellFull!11609) mapValue!38478)) b!1037475))

(assert (= (and mapNonEmpty!38469 ((_ is ValueCellFull!11609) mapDefault!38478)) b!1037476))

(declare-fun m!957177 () Bool)

(assert (=> mapNonEmpty!38478 m!957177))

(check-sat (not b!1037421) (not b!1037433) (not b!1037467) (not d!125099) (not mapNonEmpty!38478) (not b!1037468) (not b!1037461) (not b!1037460) (not d!125097) (not b!1037435) (not b!1037448) (not d!125095) tp_is_empty!24625 (not b_next!20905) b_and!33411 (not bm!43897) (not bm!43896) (not b!1037417) (not b!1037432) (not b!1037462))
(check-sat b_and!33411 (not b_next!20905))
