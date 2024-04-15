; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91138 () Bool)

(assert start!91138)

(declare-fun b!1040158 () Bool)

(declare-fun b_free!21007 () Bool)

(declare-fun b_next!21007 () Bool)

(assert (=> b!1040158 (= b_free!21007 (not b_next!21007))))

(declare-fun tp!74215 () Bool)

(declare-fun b_and!33513 () Bool)

(assert (=> b!1040158 (= tp!74215 b_and!33513)))

(declare-fun mapIsEmpty!38668 () Bool)

(declare-fun mapRes!38668 () Bool)

(assert (=> mapIsEmpty!38668 mapRes!38668))

(declare-fun b!1040152 () Bool)

(declare-fun e!588862 () Bool)

(declare-fun e!588856 () Bool)

(assert (=> b!1040152 (= e!588862 e!588856)))

(declare-fun res!693525 () Bool)

(assert (=> b!1040152 (=> (not res!693525) (not e!588856))))

(declare-datatypes ((SeekEntryResult!9790 0))(
  ( (MissingZero!9790 (index!41531 (_ BitVec 32))) (Found!9790 (index!41532 (_ BitVec 32))) (Intermediate!9790 (undefined!10602 Bool) (index!41533 (_ BitVec 32)) (x!92859 (_ BitVec 32))) (Undefined!9790) (MissingVacant!9790 (index!41534 (_ BitVec 32))) )
))
(declare-fun lt!458289 () SeekEntryResult!9790)

(get-info :version)

(assert (=> b!1040152 (= res!693525 ((_ is Found!9790) lt!458289))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37843 0))(
  ( (V!37844 (val!12414 Int)) )
))
(declare-datatypes ((ValueCell!11660 0))(
  ( (ValueCellFull!11660 (v!15000 V!37843)) (EmptyCell!11660) )
))
(declare-datatypes ((array!65529 0))(
  ( (array!65530 (arr!31530 (Array (_ BitVec 32) (_ BitVec 64))) (size!32063 (_ BitVec 32))) )
))
(declare-datatypes ((array!65531 0))(
  ( (array!65532 (arr!31531 (Array (_ BitVec 32) ValueCell!11660)) (size!32064 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5914 0))(
  ( (LongMapFixedSize!5915 (defaultEntry!6339 Int) (mask!30325 (_ BitVec 32)) (extraKeys!6067 (_ BitVec 32)) (zeroValue!6173 V!37843) (minValue!6173 V!37843) (_size!3012 (_ BitVec 32)) (_keys!11555 array!65529) (_values!6362 array!65531) (_vacant!3012 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5914)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65529 (_ BitVec 32)) SeekEntryResult!9790)

(assert (=> b!1040152 (= lt!458289 (seekEntry!0 key!909 (_keys!11555 thiss!1427) (mask!30325 thiss!1427)))))

(declare-fun b!1040153 () Bool)

(declare-fun e!588860 () Bool)

(assert (=> b!1040153 (= e!588856 (not e!588860))))

(declare-fun res!693524 () Bool)

(assert (=> b!1040153 (=> res!693524 e!588860)))

(assert (=> b!1040153 (= res!693524 (or (bvslt (index!41532 lt!458289) #b00000000000000000000000000000000) (bvsge (index!41532 lt!458289) (size!32063 (_keys!11555 thiss!1427))) (bvsge (size!32063 (_keys!11555 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!458290 () array!65529)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65529 (_ BitVec 32)) Bool)

(assert (=> b!1040153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458290 (mask!30325 thiss!1427))))

(declare-datatypes ((Unit!33897 0))(
  ( (Unit!33898) )
))
(declare-fun lt!458286 () Unit!33897)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65529 (_ BitVec 32) (_ BitVec 32)) Unit!33897)

(assert (=> b!1040153 (= lt!458286 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11555 thiss!1427) (index!41532 lt!458289) (mask!30325 thiss!1427)))))

(declare-datatypes ((List!21994 0))(
  ( (Nil!21991) (Cons!21990 (h!23194 (_ BitVec 64)) (t!31199 List!21994)) )
))
(declare-fun arrayNoDuplicates!0 (array!65529 (_ BitVec 32) List!21994) Bool)

(assert (=> b!1040153 (arrayNoDuplicates!0 lt!458290 #b00000000000000000000000000000000 Nil!21991)))

(declare-fun lt!458287 () Unit!33897)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65529 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21994) Unit!33897)

(assert (=> b!1040153 (= lt!458287 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11555 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41532 lt!458289) #b00000000000000000000000000000000 Nil!21991))))

(declare-fun arrayCountValidKeys!0 (array!65529 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040153 (= (arrayCountValidKeys!0 lt!458290 #b00000000000000000000000000000000 (size!32063 (_keys!11555 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11555 thiss!1427) #b00000000000000000000000000000000 (size!32063 (_keys!11555 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1040153 (= lt!458290 (array!65530 (store (arr!31530 (_keys!11555 thiss!1427)) (index!41532 lt!458289) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32063 (_keys!11555 thiss!1427))))))

(declare-fun lt!458288 () Unit!33897)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65529 (_ BitVec 32) (_ BitVec 64)) Unit!33897)

(assert (=> b!1040153 (= lt!458288 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11555 thiss!1427) (index!41532 lt!458289) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!693526 () Bool)

(assert (=> start!91138 (=> (not res!693526) (not e!588862))))

(declare-fun valid!2213 (LongMapFixedSize!5914) Bool)

(assert (=> start!91138 (= res!693526 (valid!2213 thiss!1427))))

(assert (=> start!91138 e!588862))

(declare-fun e!588861 () Bool)

(assert (=> start!91138 e!588861))

(assert (=> start!91138 true))

(declare-fun b!1040154 () Bool)

(declare-fun res!693527 () Bool)

(assert (=> b!1040154 (=> (not res!693527) (not e!588862))))

(assert (=> b!1040154 (= res!693527 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1040155 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1040155 (= e!588860 (validKeyInArray!0 key!909))))

(declare-fun b!1040156 () Bool)

(declare-fun res!693528 () Bool)

(assert (=> b!1040156 (=> res!693528 e!588860)))

(assert (=> b!1040156 (= res!693528 (not (arrayNoDuplicates!0 (_keys!11555 thiss!1427) #b00000000000000000000000000000000 Nil!21991)))))

(declare-fun b!1040157 () Bool)

(declare-fun e!588858 () Bool)

(declare-fun tp_is_empty!24727 () Bool)

(assert (=> b!1040157 (= e!588858 tp_is_empty!24727)))

(declare-fun e!588855 () Bool)

(declare-fun array_inv!24377 (array!65529) Bool)

(declare-fun array_inv!24378 (array!65531) Bool)

(assert (=> b!1040158 (= e!588861 (and tp!74215 tp_is_empty!24727 (array_inv!24377 (_keys!11555 thiss!1427)) (array_inv!24378 (_values!6362 thiss!1427)) e!588855))))

(declare-fun b!1040159 () Bool)

(assert (=> b!1040159 (= e!588855 (and e!588858 mapRes!38668))))

(declare-fun condMapEmpty!38668 () Bool)

(declare-fun mapDefault!38668 () ValueCell!11660)

(assert (=> b!1040159 (= condMapEmpty!38668 (= (arr!31531 (_values!6362 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11660)) mapDefault!38668)))))

(declare-fun b!1040160 () Bool)

(declare-fun e!588859 () Bool)

(assert (=> b!1040160 (= e!588859 tp_is_empty!24727)))

(declare-fun mapNonEmpty!38668 () Bool)

(declare-fun tp!74216 () Bool)

(assert (=> mapNonEmpty!38668 (= mapRes!38668 (and tp!74216 e!588859))))

(declare-fun mapValue!38668 () ValueCell!11660)

(declare-fun mapKey!38668 () (_ BitVec 32))

(declare-fun mapRest!38668 () (Array (_ BitVec 32) ValueCell!11660))

(assert (=> mapNonEmpty!38668 (= (arr!31531 (_values!6362 thiss!1427)) (store mapRest!38668 mapKey!38668 mapValue!38668))))

(assert (= (and start!91138 res!693526) b!1040154))

(assert (= (and b!1040154 res!693527) b!1040152))

(assert (= (and b!1040152 res!693525) b!1040153))

(assert (= (and b!1040153 (not res!693524)) b!1040156))

(assert (= (and b!1040156 (not res!693528)) b!1040155))

(assert (= (and b!1040159 condMapEmpty!38668) mapIsEmpty!38668))

(assert (= (and b!1040159 (not condMapEmpty!38668)) mapNonEmpty!38668))

(assert (= (and mapNonEmpty!38668 ((_ is ValueCellFull!11660) mapValue!38668)) b!1040160))

(assert (= (and b!1040159 ((_ is ValueCellFull!11660) mapDefault!38668)) b!1040157))

(assert (= b!1040158 b!1040159))

(assert (= start!91138 b!1040158))

(declare-fun m!959253 () Bool)

(assert (=> b!1040153 m!959253))

(declare-fun m!959255 () Bool)

(assert (=> b!1040153 m!959255))

(declare-fun m!959257 () Bool)

(assert (=> b!1040153 m!959257))

(declare-fun m!959259 () Bool)

(assert (=> b!1040153 m!959259))

(declare-fun m!959261 () Bool)

(assert (=> b!1040153 m!959261))

(declare-fun m!959263 () Bool)

(assert (=> b!1040153 m!959263))

(declare-fun m!959265 () Bool)

(assert (=> b!1040153 m!959265))

(declare-fun m!959267 () Bool)

(assert (=> b!1040153 m!959267))

(declare-fun m!959269 () Bool)

(assert (=> b!1040156 m!959269))

(declare-fun m!959271 () Bool)

(assert (=> mapNonEmpty!38668 m!959271))

(declare-fun m!959273 () Bool)

(assert (=> start!91138 m!959273))

(declare-fun m!959275 () Bool)

(assert (=> b!1040155 m!959275))

(declare-fun m!959277 () Bool)

(assert (=> b!1040158 m!959277))

(declare-fun m!959279 () Bool)

(assert (=> b!1040158 m!959279))

(declare-fun m!959281 () Bool)

(assert (=> b!1040152 m!959281))

(check-sat tp_is_empty!24727 (not b!1040152) b_and!33513 (not b!1040156) (not b_next!21007) (not b!1040153) (not b!1040158) (not start!91138) (not mapNonEmpty!38668) (not b!1040155))
(check-sat b_and!33513 (not b_next!21007))
(get-model)

(declare-fun b!1040227 () Bool)

(declare-fun e!588917 () SeekEntryResult!9790)

(declare-fun lt!458329 () SeekEntryResult!9790)

(assert (=> b!1040227 (= e!588917 (ite ((_ is MissingVacant!9790) lt!458329) (MissingZero!9790 (index!41534 lt!458329)) lt!458329))))

(declare-fun lt!458332 () SeekEntryResult!9790)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65529 (_ BitVec 32)) SeekEntryResult!9790)

(assert (=> b!1040227 (= lt!458329 (seekKeyOrZeroReturnVacant!0 (x!92859 lt!458332) (index!41533 lt!458332) (index!41533 lt!458332) key!909 (_keys!11555 thiss!1427) (mask!30325 thiss!1427)))))

(declare-fun d!125483 () Bool)

(declare-fun lt!458330 () SeekEntryResult!9790)

(assert (=> d!125483 (and (or ((_ is MissingVacant!9790) lt!458330) (not ((_ is Found!9790) lt!458330)) (and (bvsge (index!41532 lt!458330) #b00000000000000000000000000000000) (bvslt (index!41532 lt!458330) (size!32063 (_keys!11555 thiss!1427))))) (not ((_ is MissingVacant!9790) lt!458330)) (or (not ((_ is Found!9790) lt!458330)) (= (select (arr!31530 (_keys!11555 thiss!1427)) (index!41532 lt!458330)) key!909)))))

(declare-fun e!588918 () SeekEntryResult!9790)

(assert (=> d!125483 (= lt!458330 e!588918)))

(declare-fun c!105436 () Bool)

(assert (=> d!125483 (= c!105436 (and ((_ is Intermediate!9790) lt!458332) (undefined!10602 lt!458332)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65529 (_ BitVec 32)) SeekEntryResult!9790)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125483 (= lt!458332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30325 thiss!1427)) key!909 (_keys!11555 thiss!1427) (mask!30325 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125483 (validMask!0 (mask!30325 thiss!1427))))

(assert (=> d!125483 (= (seekEntry!0 key!909 (_keys!11555 thiss!1427) (mask!30325 thiss!1427)) lt!458330)))

(declare-fun b!1040228 () Bool)

(assert (=> b!1040228 (= e!588917 (MissingZero!9790 (index!41533 lt!458332)))))

(declare-fun b!1040229 () Bool)

(assert (=> b!1040229 (= e!588918 Undefined!9790)))

(declare-fun b!1040230 () Bool)

(declare-fun e!588919 () SeekEntryResult!9790)

(assert (=> b!1040230 (= e!588918 e!588919)))

(declare-fun lt!458331 () (_ BitVec 64))

(assert (=> b!1040230 (= lt!458331 (select (arr!31530 (_keys!11555 thiss!1427)) (index!41533 lt!458332)))))

(declare-fun c!105435 () Bool)

(assert (=> b!1040230 (= c!105435 (= lt!458331 key!909))))

(declare-fun b!1040231 () Bool)

(assert (=> b!1040231 (= e!588919 (Found!9790 (index!41533 lt!458332)))))

(declare-fun b!1040232 () Bool)

(declare-fun c!105434 () Bool)

(assert (=> b!1040232 (= c!105434 (= lt!458331 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1040232 (= e!588919 e!588917)))

(assert (= (and d!125483 c!105436) b!1040229))

(assert (= (and d!125483 (not c!105436)) b!1040230))

(assert (= (and b!1040230 c!105435) b!1040231))

(assert (= (and b!1040230 (not c!105435)) b!1040232))

(assert (= (and b!1040232 c!105434) b!1040228))

(assert (= (and b!1040232 (not c!105434)) b!1040227))

(declare-fun m!959343 () Bool)

(assert (=> b!1040227 m!959343))

(declare-fun m!959345 () Bool)

(assert (=> d!125483 m!959345))

(declare-fun m!959347 () Bool)

(assert (=> d!125483 m!959347))

(assert (=> d!125483 m!959347))

(declare-fun m!959349 () Bool)

(assert (=> d!125483 m!959349))

(declare-fun m!959351 () Bool)

(assert (=> d!125483 m!959351))

(declare-fun m!959353 () Bool)

(assert (=> b!1040230 m!959353))

(assert (=> b!1040152 d!125483))

(declare-fun b!1040243 () Bool)

(declare-fun e!588930 () Bool)

(declare-fun contains!6029 (List!21994 (_ BitVec 64)) Bool)

(assert (=> b!1040243 (= e!588930 (contains!6029 Nil!21991 (select (arr!31530 (_keys!11555 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040244 () Bool)

(declare-fun e!588929 () Bool)

(declare-fun e!588928 () Bool)

(assert (=> b!1040244 (= e!588929 e!588928)))

(declare-fun res!693565 () Bool)

(assert (=> b!1040244 (=> (not res!693565) (not e!588928))))

(assert (=> b!1040244 (= res!693565 (not e!588930))))

(declare-fun res!693566 () Bool)

(assert (=> b!1040244 (=> (not res!693566) (not e!588930))))

(assert (=> b!1040244 (= res!693566 (validKeyInArray!0 (select (arr!31530 (_keys!11555 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44022 () Bool)

(declare-fun call!44025 () Bool)

(declare-fun c!105439 () Bool)

(assert (=> bm!44022 (= call!44025 (arrayNoDuplicates!0 (_keys!11555 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105439 (Cons!21990 (select (arr!31530 (_keys!11555 thiss!1427)) #b00000000000000000000000000000000) Nil!21991) Nil!21991)))))

(declare-fun d!125485 () Bool)

(declare-fun res!693567 () Bool)

(assert (=> d!125485 (=> res!693567 e!588929)))

(assert (=> d!125485 (= res!693567 (bvsge #b00000000000000000000000000000000 (size!32063 (_keys!11555 thiss!1427))))))

(assert (=> d!125485 (= (arrayNoDuplicates!0 (_keys!11555 thiss!1427) #b00000000000000000000000000000000 Nil!21991) e!588929)))

(declare-fun b!1040245 () Bool)

(declare-fun e!588931 () Bool)

(assert (=> b!1040245 (= e!588928 e!588931)))

(assert (=> b!1040245 (= c!105439 (validKeyInArray!0 (select (arr!31530 (_keys!11555 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040246 () Bool)

(assert (=> b!1040246 (= e!588931 call!44025)))

(declare-fun b!1040247 () Bool)

(assert (=> b!1040247 (= e!588931 call!44025)))

(assert (= (and d!125485 (not res!693567)) b!1040244))

(assert (= (and b!1040244 res!693566) b!1040243))

(assert (= (and b!1040244 res!693565) b!1040245))

(assert (= (and b!1040245 c!105439) b!1040246))

(assert (= (and b!1040245 (not c!105439)) b!1040247))

(assert (= (or b!1040246 b!1040247) bm!44022))

(declare-fun m!959355 () Bool)

(assert (=> b!1040243 m!959355))

(assert (=> b!1040243 m!959355))

(declare-fun m!959357 () Bool)

(assert (=> b!1040243 m!959357))

(assert (=> b!1040244 m!959355))

(assert (=> b!1040244 m!959355))

(declare-fun m!959359 () Bool)

(assert (=> b!1040244 m!959359))

(assert (=> bm!44022 m!959355))

(declare-fun m!959361 () Bool)

(assert (=> bm!44022 m!959361))

(assert (=> b!1040245 m!959355))

(assert (=> b!1040245 m!959355))

(assert (=> b!1040245 m!959359))

(assert (=> b!1040156 d!125485))

(declare-fun d!125487 () Bool)

(declare-fun res!693574 () Bool)

(declare-fun e!588934 () Bool)

(assert (=> d!125487 (=> (not res!693574) (not e!588934))))

(declare-fun simpleValid!433 (LongMapFixedSize!5914) Bool)

(assert (=> d!125487 (= res!693574 (simpleValid!433 thiss!1427))))

(assert (=> d!125487 (= (valid!2213 thiss!1427) e!588934)))

(declare-fun b!1040254 () Bool)

(declare-fun res!693575 () Bool)

(assert (=> b!1040254 (=> (not res!693575) (not e!588934))))

(assert (=> b!1040254 (= res!693575 (= (arrayCountValidKeys!0 (_keys!11555 thiss!1427) #b00000000000000000000000000000000 (size!32063 (_keys!11555 thiss!1427))) (_size!3012 thiss!1427)))))

(declare-fun b!1040255 () Bool)

(declare-fun res!693576 () Bool)

(assert (=> b!1040255 (=> (not res!693576) (not e!588934))))

(assert (=> b!1040255 (= res!693576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11555 thiss!1427) (mask!30325 thiss!1427)))))

(declare-fun b!1040256 () Bool)

(assert (=> b!1040256 (= e!588934 (arrayNoDuplicates!0 (_keys!11555 thiss!1427) #b00000000000000000000000000000000 Nil!21991))))

(assert (= (and d!125487 res!693574) b!1040254))

(assert (= (and b!1040254 res!693575) b!1040255))

(assert (= (and b!1040255 res!693576) b!1040256))

(declare-fun m!959363 () Bool)

(assert (=> d!125487 m!959363))

(assert (=> b!1040254 m!959261))

(declare-fun m!959365 () Bool)

(assert (=> b!1040255 m!959365))

(assert (=> b!1040256 m!959269))

(assert (=> start!91138 d!125487))

(declare-fun d!125489 () Bool)

(assert (=> d!125489 (= (validKeyInArray!0 key!909) (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1040155 d!125489))

(declare-fun d!125491 () Bool)

(assert (=> d!125491 (= (array_inv!24377 (_keys!11555 thiss!1427)) (bvsge (size!32063 (_keys!11555 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040158 d!125491))

(declare-fun d!125493 () Bool)

(assert (=> d!125493 (= (array_inv!24378 (_values!6362 thiss!1427)) (bvsge (size!32064 (_values!6362 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040158 d!125493))

(declare-fun b!1040265 () Bool)

(declare-fun e!588942 () Bool)

(declare-fun e!588941 () Bool)

(assert (=> b!1040265 (= e!588942 e!588941)))

(declare-fun c!105442 () Bool)

(assert (=> b!1040265 (= c!105442 (validKeyInArray!0 (select (arr!31530 lt!458290) #b00000000000000000000000000000000)))))

(declare-fun bm!44025 () Bool)

(declare-fun call!44028 () Bool)

(assert (=> bm!44025 (= call!44028 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458290 (mask!30325 thiss!1427)))))

(declare-fun b!1040266 () Bool)

(declare-fun e!588943 () Bool)

(assert (=> b!1040266 (= e!588943 call!44028)))

(declare-fun d!125495 () Bool)

(declare-fun res!693582 () Bool)

(assert (=> d!125495 (=> res!693582 e!588942)))

(assert (=> d!125495 (= res!693582 (bvsge #b00000000000000000000000000000000 (size!32063 lt!458290)))))

(assert (=> d!125495 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458290 (mask!30325 thiss!1427)) e!588942)))

(declare-fun b!1040267 () Bool)

(assert (=> b!1040267 (= e!588941 e!588943)))

(declare-fun lt!458339 () (_ BitVec 64))

(assert (=> b!1040267 (= lt!458339 (select (arr!31530 lt!458290) #b00000000000000000000000000000000))))

(declare-fun lt!458341 () Unit!33897)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65529 (_ BitVec 64) (_ BitVec 32)) Unit!33897)

(assert (=> b!1040267 (= lt!458341 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458290 lt!458339 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1040267 (arrayContainsKey!0 lt!458290 lt!458339 #b00000000000000000000000000000000)))

(declare-fun lt!458340 () Unit!33897)

(assert (=> b!1040267 (= lt!458340 lt!458341)))

(declare-fun res!693581 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65529 (_ BitVec 32)) SeekEntryResult!9790)

(assert (=> b!1040267 (= res!693581 (= (seekEntryOrOpen!0 (select (arr!31530 lt!458290) #b00000000000000000000000000000000) lt!458290 (mask!30325 thiss!1427)) (Found!9790 #b00000000000000000000000000000000)))))

(assert (=> b!1040267 (=> (not res!693581) (not e!588943))))

(declare-fun b!1040268 () Bool)

(assert (=> b!1040268 (= e!588941 call!44028)))

(assert (= (and d!125495 (not res!693582)) b!1040265))

(assert (= (and b!1040265 c!105442) b!1040267))

(assert (= (and b!1040265 (not c!105442)) b!1040268))

(assert (= (and b!1040267 res!693581) b!1040266))

(assert (= (or b!1040266 b!1040268) bm!44025))

(declare-fun m!959367 () Bool)

(assert (=> b!1040265 m!959367))

(assert (=> b!1040265 m!959367))

(declare-fun m!959369 () Bool)

(assert (=> b!1040265 m!959369))

(declare-fun m!959371 () Bool)

(assert (=> bm!44025 m!959371))

(assert (=> b!1040267 m!959367))

(declare-fun m!959373 () Bool)

(assert (=> b!1040267 m!959373))

(declare-fun m!959375 () Bool)

(assert (=> b!1040267 m!959375))

(assert (=> b!1040267 m!959367))

(declare-fun m!959377 () Bool)

(assert (=> b!1040267 m!959377))

(assert (=> b!1040153 d!125495))

(declare-fun d!125497 () Bool)

(declare-fun e!588948 () Bool)

(assert (=> d!125497 e!588948))

(declare-fun res!693591 () Bool)

(assert (=> d!125497 (=> (not res!693591) (not e!588948))))

(assert (=> d!125497 (= res!693591 (and (bvsge (index!41532 lt!458289) #b00000000000000000000000000000000) (bvslt (index!41532 lt!458289) (size!32063 (_keys!11555 thiss!1427)))))))

(declare-fun lt!458344 () Unit!33897)

(declare-fun choose!82 (array!65529 (_ BitVec 32) (_ BitVec 64)) Unit!33897)

(assert (=> d!125497 (= lt!458344 (choose!82 (_keys!11555 thiss!1427) (index!41532 lt!458289) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588949 () Bool)

(assert (=> d!125497 e!588949))

(declare-fun res!693594 () Bool)

(assert (=> d!125497 (=> (not res!693594) (not e!588949))))

(assert (=> d!125497 (= res!693594 (and (bvsge (index!41532 lt!458289) #b00000000000000000000000000000000) (bvslt (index!41532 lt!458289) (size!32063 (_keys!11555 thiss!1427)))))))

(assert (=> d!125497 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11555 thiss!1427) (index!41532 lt!458289) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458344)))

(declare-fun b!1040280 () Bool)

(assert (=> b!1040280 (= e!588948 (= (arrayCountValidKeys!0 (array!65530 (store (arr!31530 (_keys!11555 thiss!1427)) (index!41532 lt!458289) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32063 (_keys!11555 thiss!1427))) #b00000000000000000000000000000000 (size!32063 (_keys!11555 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11555 thiss!1427) #b00000000000000000000000000000000 (size!32063 (_keys!11555 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1040279 () Bool)

(assert (=> b!1040279 (= e!588949 (bvslt (size!32063 (_keys!11555 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1040278 () Bool)

(declare-fun res!693593 () Bool)

(assert (=> b!1040278 (=> (not res!693593) (not e!588949))))

(assert (=> b!1040278 (= res!693593 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1040277 () Bool)

(declare-fun res!693592 () Bool)

(assert (=> b!1040277 (=> (not res!693592) (not e!588949))))

(assert (=> b!1040277 (= res!693592 (validKeyInArray!0 (select (arr!31530 (_keys!11555 thiss!1427)) (index!41532 lt!458289))))))

(assert (= (and d!125497 res!693594) b!1040277))

(assert (= (and b!1040277 res!693592) b!1040278))

(assert (= (and b!1040278 res!693593) b!1040279))

(assert (= (and d!125497 res!693591) b!1040280))

(declare-fun m!959379 () Bool)

(assert (=> d!125497 m!959379))

(assert (=> b!1040280 m!959263))

(declare-fun m!959381 () Bool)

(assert (=> b!1040280 m!959381))

(assert (=> b!1040280 m!959261))

(declare-fun m!959383 () Bool)

(assert (=> b!1040278 m!959383))

(declare-fun m!959385 () Bool)

(assert (=> b!1040277 m!959385))

(assert (=> b!1040277 m!959385))

(declare-fun m!959387 () Bool)

(assert (=> b!1040277 m!959387))

(assert (=> b!1040153 d!125497))

(declare-fun b!1040289 () Bool)

(declare-fun e!588955 () (_ BitVec 32))

(declare-fun call!44031 () (_ BitVec 32))

(assert (=> b!1040289 (= e!588955 call!44031)))

(declare-fun bm!44028 () Bool)

(assert (=> bm!44028 (= call!44031 (arrayCountValidKeys!0 lt!458290 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32063 (_keys!11555 thiss!1427))))))

(declare-fun b!1040291 () Bool)

(declare-fun e!588954 () (_ BitVec 32))

(assert (=> b!1040291 (= e!588954 e!588955)))

(declare-fun c!105447 () Bool)

(assert (=> b!1040291 (= c!105447 (validKeyInArray!0 (select (arr!31530 lt!458290) #b00000000000000000000000000000000)))))

(declare-fun b!1040292 () Bool)

(assert (=> b!1040292 (= e!588954 #b00000000000000000000000000000000)))

(declare-fun d!125499 () Bool)

(declare-fun lt!458347 () (_ BitVec 32))

(assert (=> d!125499 (and (bvsge lt!458347 #b00000000000000000000000000000000) (bvsle lt!458347 (bvsub (size!32063 lt!458290) #b00000000000000000000000000000000)))))

(assert (=> d!125499 (= lt!458347 e!588954)))

(declare-fun c!105448 () Bool)

(assert (=> d!125499 (= c!105448 (bvsge #b00000000000000000000000000000000 (size!32063 (_keys!11555 thiss!1427))))))

(assert (=> d!125499 (and (bvsle #b00000000000000000000000000000000 (size!32063 (_keys!11555 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32063 (_keys!11555 thiss!1427)) (size!32063 lt!458290)))))

(assert (=> d!125499 (= (arrayCountValidKeys!0 lt!458290 #b00000000000000000000000000000000 (size!32063 (_keys!11555 thiss!1427))) lt!458347)))

(declare-fun b!1040290 () Bool)

(assert (=> b!1040290 (= e!588955 (bvadd #b00000000000000000000000000000001 call!44031))))

(assert (= (and d!125499 c!105448) b!1040292))

(assert (= (and d!125499 (not c!105448)) b!1040291))

(assert (= (and b!1040291 c!105447) b!1040290))

(assert (= (and b!1040291 (not c!105447)) b!1040289))

(assert (= (or b!1040290 b!1040289) bm!44028))

(declare-fun m!959389 () Bool)

(assert (=> bm!44028 m!959389))

(assert (=> b!1040291 m!959367))

(assert (=> b!1040291 m!959367))

(assert (=> b!1040291 m!959369))

(assert (=> b!1040153 d!125499))

(declare-fun d!125501 () Bool)

(declare-fun e!588958 () Bool)

(assert (=> d!125501 e!588958))

(declare-fun res!693597 () Bool)

(assert (=> d!125501 (=> (not res!693597) (not e!588958))))

(assert (=> d!125501 (= res!693597 (and (bvsge (index!41532 lt!458289) #b00000000000000000000000000000000) (bvslt (index!41532 lt!458289) (size!32063 (_keys!11555 thiss!1427)))))))

(declare-fun lt!458350 () Unit!33897)

(declare-fun choose!53 (array!65529 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21994) Unit!33897)

(assert (=> d!125501 (= lt!458350 (choose!53 (_keys!11555 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41532 lt!458289) #b00000000000000000000000000000000 Nil!21991))))

(assert (=> d!125501 (bvslt (size!32063 (_keys!11555 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125501 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11555 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41532 lt!458289) #b00000000000000000000000000000000 Nil!21991) lt!458350)))

(declare-fun b!1040295 () Bool)

(assert (=> b!1040295 (= e!588958 (arrayNoDuplicates!0 (array!65530 (store (arr!31530 (_keys!11555 thiss!1427)) (index!41532 lt!458289) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32063 (_keys!11555 thiss!1427))) #b00000000000000000000000000000000 Nil!21991))))

(assert (= (and d!125501 res!693597) b!1040295))

(declare-fun m!959391 () Bool)

(assert (=> d!125501 m!959391))

(assert (=> b!1040295 m!959263))

(declare-fun m!959393 () Bool)

(assert (=> b!1040295 m!959393))

(assert (=> b!1040153 d!125501))

(declare-fun b!1040296 () Bool)

(declare-fun e!588960 () (_ BitVec 32))

(declare-fun call!44032 () (_ BitVec 32))

(assert (=> b!1040296 (= e!588960 call!44032)))

(declare-fun bm!44029 () Bool)

(assert (=> bm!44029 (= call!44032 (arrayCountValidKeys!0 (_keys!11555 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32063 (_keys!11555 thiss!1427))))))

(declare-fun b!1040298 () Bool)

(declare-fun e!588959 () (_ BitVec 32))

(assert (=> b!1040298 (= e!588959 e!588960)))

(declare-fun c!105449 () Bool)

(assert (=> b!1040298 (= c!105449 (validKeyInArray!0 (select (arr!31530 (_keys!11555 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040299 () Bool)

(assert (=> b!1040299 (= e!588959 #b00000000000000000000000000000000)))

(declare-fun d!125503 () Bool)

(declare-fun lt!458351 () (_ BitVec 32))

(assert (=> d!125503 (and (bvsge lt!458351 #b00000000000000000000000000000000) (bvsle lt!458351 (bvsub (size!32063 (_keys!11555 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125503 (= lt!458351 e!588959)))

(declare-fun c!105450 () Bool)

(assert (=> d!125503 (= c!105450 (bvsge #b00000000000000000000000000000000 (size!32063 (_keys!11555 thiss!1427))))))

(assert (=> d!125503 (and (bvsle #b00000000000000000000000000000000 (size!32063 (_keys!11555 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32063 (_keys!11555 thiss!1427)) (size!32063 (_keys!11555 thiss!1427))))))

(assert (=> d!125503 (= (arrayCountValidKeys!0 (_keys!11555 thiss!1427) #b00000000000000000000000000000000 (size!32063 (_keys!11555 thiss!1427))) lt!458351)))

(declare-fun b!1040297 () Bool)

(assert (=> b!1040297 (= e!588960 (bvadd #b00000000000000000000000000000001 call!44032))))

(assert (= (and d!125503 c!105450) b!1040299))

(assert (= (and d!125503 (not c!105450)) b!1040298))

(assert (= (and b!1040298 c!105449) b!1040297))

(assert (= (and b!1040298 (not c!105449)) b!1040296))

(assert (= (or b!1040297 b!1040296) bm!44029))

(declare-fun m!959395 () Bool)

(assert (=> bm!44029 m!959395))

(assert (=> b!1040298 m!959355))

(assert (=> b!1040298 m!959355))

(assert (=> b!1040298 m!959359))

(assert (=> b!1040153 d!125503))

(declare-fun d!125505 () Bool)

(declare-fun e!588963 () Bool)

(assert (=> d!125505 e!588963))

(declare-fun res!693600 () Bool)

(assert (=> d!125505 (=> (not res!693600) (not e!588963))))

(assert (=> d!125505 (= res!693600 (and (bvsge (index!41532 lt!458289) #b00000000000000000000000000000000) (bvslt (index!41532 lt!458289) (size!32063 (_keys!11555 thiss!1427)))))))

(declare-fun lt!458354 () Unit!33897)

(declare-fun choose!25 (array!65529 (_ BitVec 32) (_ BitVec 32)) Unit!33897)

(assert (=> d!125505 (= lt!458354 (choose!25 (_keys!11555 thiss!1427) (index!41532 lt!458289) (mask!30325 thiss!1427)))))

(assert (=> d!125505 (validMask!0 (mask!30325 thiss!1427))))

(assert (=> d!125505 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11555 thiss!1427) (index!41532 lt!458289) (mask!30325 thiss!1427)) lt!458354)))

(declare-fun b!1040302 () Bool)

(assert (=> b!1040302 (= e!588963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65530 (store (arr!31530 (_keys!11555 thiss!1427)) (index!41532 lt!458289) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32063 (_keys!11555 thiss!1427))) (mask!30325 thiss!1427)))))

(assert (= (and d!125505 res!693600) b!1040302))

(declare-fun m!959397 () Bool)

(assert (=> d!125505 m!959397))

(assert (=> d!125505 m!959351))

(assert (=> b!1040302 m!959263))

(declare-fun m!959399 () Bool)

(assert (=> b!1040302 m!959399))

(assert (=> b!1040153 d!125505))

(declare-fun b!1040303 () Bool)

(declare-fun e!588966 () Bool)

(assert (=> b!1040303 (= e!588966 (contains!6029 Nil!21991 (select (arr!31530 lt!458290) #b00000000000000000000000000000000)))))

(declare-fun b!1040304 () Bool)

(declare-fun e!588965 () Bool)

(declare-fun e!588964 () Bool)

(assert (=> b!1040304 (= e!588965 e!588964)))

(declare-fun res!693601 () Bool)

(assert (=> b!1040304 (=> (not res!693601) (not e!588964))))

(assert (=> b!1040304 (= res!693601 (not e!588966))))

(declare-fun res!693602 () Bool)

(assert (=> b!1040304 (=> (not res!693602) (not e!588966))))

(assert (=> b!1040304 (= res!693602 (validKeyInArray!0 (select (arr!31530 lt!458290) #b00000000000000000000000000000000)))))

(declare-fun bm!44030 () Bool)

(declare-fun call!44033 () Bool)

(declare-fun c!105451 () Bool)

(assert (=> bm!44030 (= call!44033 (arrayNoDuplicates!0 lt!458290 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105451 (Cons!21990 (select (arr!31530 lt!458290) #b00000000000000000000000000000000) Nil!21991) Nil!21991)))))

(declare-fun d!125507 () Bool)

(declare-fun res!693603 () Bool)

(assert (=> d!125507 (=> res!693603 e!588965)))

(assert (=> d!125507 (= res!693603 (bvsge #b00000000000000000000000000000000 (size!32063 lt!458290)))))

(assert (=> d!125507 (= (arrayNoDuplicates!0 lt!458290 #b00000000000000000000000000000000 Nil!21991) e!588965)))

(declare-fun b!1040305 () Bool)

(declare-fun e!588967 () Bool)

(assert (=> b!1040305 (= e!588964 e!588967)))

(assert (=> b!1040305 (= c!105451 (validKeyInArray!0 (select (arr!31530 lt!458290) #b00000000000000000000000000000000)))))

(declare-fun b!1040306 () Bool)

(assert (=> b!1040306 (= e!588967 call!44033)))

(declare-fun b!1040307 () Bool)

(assert (=> b!1040307 (= e!588967 call!44033)))

(assert (= (and d!125507 (not res!693603)) b!1040304))

(assert (= (and b!1040304 res!693602) b!1040303))

(assert (= (and b!1040304 res!693601) b!1040305))

(assert (= (and b!1040305 c!105451) b!1040306))

(assert (= (and b!1040305 (not c!105451)) b!1040307))

(assert (= (or b!1040306 b!1040307) bm!44030))

(assert (=> b!1040303 m!959367))

(assert (=> b!1040303 m!959367))

(declare-fun m!959401 () Bool)

(assert (=> b!1040303 m!959401))

(assert (=> b!1040304 m!959367))

(assert (=> b!1040304 m!959367))

(assert (=> b!1040304 m!959369))

(assert (=> bm!44030 m!959367))

(declare-fun m!959403 () Bool)

(assert (=> bm!44030 m!959403))

(assert (=> b!1040305 m!959367))

(assert (=> b!1040305 m!959367))

(assert (=> b!1040305 m!959369))

(assert (=> b!1040153 d!125507))

(declare-fun b!1040314 () Bool)

(declare-fun e!588973 () Bool)

(assert (=> b!1040314 (= e!588973 tp_is_empty!24727)))

(declare-fun b!1040315 () Bool)

(declare-fun e!588972 () Bool)

(assert (=> b!1040315 (= e!588972 tp_is_empty!24727)))

(declare-fun mapNonEmpty!38677 () Bool)

(declare-fun mapRes!38677 () Bool)

(declare-fun tp!74231 () Bool)

(assert (=> mapNonEmpty!38677 (= mapRes!38677 (and tp!74231 e!588973))))

(declare-fun mapValue!38677 () ValueCell!11660)

(declare-fun mapRest!38677 () (Array (_ BitVec 32) ValueCell!11660))

(declare-fun mapKey!38677 () (_ BitVec 32))

(assert (=> mapNonEmpty!38677 (= mapRest!38668 (store mapRest!38677 mapKey!38677 mapValue!38677))))

(declare-fun condMapEmpty!38677 () Bool)

(declare-fun mapDefault!38677 () ValueCell!11660)

(assert (=> mapNonEmpty!38668 (= condMapEmpty!38677 (= mapRest!38668 ((as const (Array (_ BitVec 32) ValueCell!11660)) mapDefault!38677)))))

(assert (=> mapNonEmpty!38668 (= tp!74216 (and e!588972 mapRes!38677))))

(declare-fun mapIsEmpty!38677 () Bool)

(assert (=> mapIsEmpty!38677 mapRes!38677))

(assert (= (and mapNonEmpty!38668 condMapEmpty!38677) mapIsEmpty!38677))

(assert (= (and mapNonEmpty!38668 (not condMapEmpty!38677)) mapNonEmpty!38677))

(assert (= (and mapNonEmpty!38677 ((_ is ValueCellFull!11660) mapValue!38677)) b!1040314))

(assert (= (and mapNonEmpty!38668 ((_ is ValueCellFull!11660) mapDefault!38677)) b!1040315))

(declare-fun m!959405 () Bool)

(assert (=> mapNonEmpty!38677 m!959405))

(check-sat (not b!1040291) (not b!1040245) b_and!33513 (not b!1040254) (not b!1040265) (not d!125497) (not b!1040277) (not b!1040303) (not bm!44028) (not b!1040267) (not d!125483) (not d!125505) (not b!1040244) (not bm!44022) (not b!1040280) (not b!1040304) (not b!1040302) (not b!1040295) (not b!1040256) (not bm!44029) (not b!1040298) tp_is_empty!24727 (not b!1040305) (not b!1040227) (not bm!44030) (not bm!44025) (not b!1040278) (not b!1040255) (not b!1040243) (not mapNonEmpty!38677) (not b_next!21007) (not d!125501) (not d!125487))
(check-sat b_and!33513 (not b_next!21007))
