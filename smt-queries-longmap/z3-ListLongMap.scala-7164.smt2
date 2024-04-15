; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91338 () Bool)

(assert start!91338)

(declare-fun b!1041301 () Bool)

(declare-fun b_free!21037 () Bool)

(declare-fun b_next!21037 () Bool)

(assert (=> b!1041301 (= b_free!21037 (not b_next!21037))))

(declare-fun tp!74322 () Bool)

(declare-fun b_and!33543 () Bool)

(assert (=> b!1041301 (= tp!74322 b_and!33543)))

(declare-fun mapIsEmpty!38730 () Bool)

(declare-fun mapRes!38730 () Bool)

(assert (=> mapIsEmpty!38730 mapRes!38730))

(declare-fun tp_is_empty!24757 () Bool)

(declare-fun e!589690 () Bool)

(declare-datatypes ((V!37883 0))(
  ( (V!37884 (val!12429 Int)) )
))
(declare-datatypes ((ValueCell!11675 0))(
  ( (ValueCellFull!11675 (v!15017 V!37883)) (EmptyCell!11675) )
))
(declare-datatypes ((array!65599 0))(
  ( (array!65600 (arr!31560 (Array (_ BitVec 32) (_ BitVec 64))) (size!32095 (_ BitVec 32))) )
))
(declare-datatypes ((array!65601 0))(
  ( (array!65602 (arr!31561 (Array (_ BitVec 32) ValueCell!11675)) (size!32096 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5944 0))(
  ( (LongMapFixedSize!5945 (defaultEntry!6354 Int) (mask!30378 (_ BitVec 32)) (extraKeys!6082 (_ BitVec 32)) (zeroValue!6188 V!37883) (minValue!6188 V!37883) (_size!3027 (_ BitVec 32)) (_keys!11586 array!65599) (_values!6377 array!65601) (_vacant!3027 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5944)

(declare-fun e!589694 () Bool)

(declare-fun array_inv!24395 (array!65599) Bool)

(declare-fun array_inv!24396 (array!65601) Bool)

(assert (=> b!1041301 (= e!589690 (and tp!74322 tp_is_empty!24757 (array_inv!24395 (_keys!11586 thiss!1427)) (array_inv!24396 (_values!6377 thiss!1427)) e!589694))))

(declare-fun b!1041302 () Bool)

(declare-fun e!589696 () Bool)

(declare-fun e!589691 () Bool)

(assert (=> b!1041302 (= e!589696 e!589691)))

(declare-fun res!694063 () Bool)

(assert (=> b!1041302 (=> (not res!694063) (not e!589691))))

(declare-datatypes ((SeekEntryResult!9804 0))(
  ( (MissingZero!9804 (index!41587 (_ BitVec 32))) (Found!9804 (index!41588 (_ BitVec 32))) (Intermediate!9804 (undefined!10616 Bool) (index!41589 (_ BitVec 32)) (x!92971 (_ BitVec 32))) (Undefined!9804) (MissingVacant!9804 (index!41590 (_ BitVec 32))) )
))
(declare-fun lt!458811 () SeekEntryResult!9804)

(get-info :version)

(assert (=> b!1041302 (= res!694063 ((_ is Found!9804) lt!458811))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65599 (_ BitVec 32)) SeekEntryResult!9804)

(assert (=> b!1041302 (= lt!458811 (seekEntry!0 key!909 (_keys!11586 thiss!1427) (mask!30378 thiss!1427)))))

(declare-fun mapNonEmpty!38730 () Bool)

(declare-fun tp!74323 () Bool)

(declare-fun e!589695 () Bool)

(assert (=> mapNonEmpty!38730 (= mapRes!38730 (and tp!74323 e!589695))))

(declare-fun mapKey!38730 () (_ BitVec 32))

(declare-fun mapRest!38730 () (Array (_ BitVec 32) ValueCell!11675))

(declare-fun mapValue!38730 () ValueCell!11675)

(assert (=> mapNonEmpty!38730 (= (arr!31561 (_values!6377 thiss!1427)) (store mapRest!38730 mapKey!38730 mapValue!38730))))

(declare-fun b!1041303 () Bool)

(declare-fun e!589692 () Bool)

(assert (=> b!1041303 (= e!589692 tp_is_empty!24757)))

(declare-fun res!694061 () Bool)

(assert (=> start!91338 (=> (not res!694061) (not e!589696))))

(declare-fun valid!2222 (LongMapFixedSize!5944) Bool)

(assert (=> start!91338 (= res!694061 (valid!2222 thiss!1427))))

(assert (=> start!91338 e!589696))

(assert (=> start!91338 e!589690))

(assert (=> start!91338 true))

(declare-fun b!1041304 () Bool)

(assert (=> b!1041304 (= e!589694 (and e!589692 mapRes!38730))))

(declare-fun condMapEmpty!38730 () Bool)

(declare-fun mapDefault!38730 () ValueCell!11675)

(assert (=> b!1041304 (= condMapEmpty!38730 (= (arr!31561 (_values!6377 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11675)) mapDefault!38730)))))

(declare-fun b!1041305 () Bool)

(assert (=> b!1041305 (= e!589695 tp_is_empty!24757)))

(declare-fun b!1041306 () Bool)

(declare-fun e!589697 () Bool)

(assert (=> b!1041306 (= e!589691 (not e!589697))))

(declare-fun res!694062 () Bool)

(assert (=> b!1041306 (=> res!694062 e!589697)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1041306 (= res!694062 (not (validMask!0 (mask!30378 thiss!1427))))))

(declare-fun lt!458809 () array!65599)

(declare-fun arrayContainsKey!0 (array!65599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1041306 (not (arrayContainsKey!0 lt!458809 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33917 0))(
  ( (Unit!33918) )
))
(declare-fun lt!458812 () Unit!33917)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65599 (_ BitVec 32) (_ BitVec 64)) Unit!33917)

(assert (=> b!1041306 (= lt!458812 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11586 thiss!1427) (index!41588 lt!458811) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65599 (_ BitVec 32)) Bool)

(assert (=> b!1041306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458809 (mask!30378 thiss!1427))))

(declare-fun lt!458810 () Unit!33917)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65599 (_ BitVec 32) (_ BitVec 32)) Unit!33917)

(assert (=> b!1041306 (= lt!458810 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11586 thiss!1427) (index!41588 lt!458811) (mask!30378 thiss!1427)))))

(declare-datatypes ((List!22004 0))(
  ( (Nil!22001) (Cons!22000 (h!23206 (_ BitVec 64)) (t!31209 List!22004)) )
))
(declare-fun arrayNoDuplicates!0 (array!65599 (_ BitVec 32) List!22004) Bool)

(assert (=> b!1041306 (arrayNoDuplicates!0 lt!458809 #b00000000000000000000000000000000 Nil!22001)))

(declare-fun lt!458814 () Unit!33917)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65599 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22004) Unit!33917)

(assert (=> b!1041306 (= lt!458814 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11586 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41588 lt!458811) #b00000000000000000000000000000000 Nil!22001))))

(declare-fun arrayCountValidKeys!0 (array!65599 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041306 (= (arrayCountValidKeys!0 lt!458809 #b00000000000000000000000000000000 (size!32095 (_keys!11586 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11586 thiss!1427) #b00000000000000000000000000000000 (size!32095 (_keys!11586 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1041306 (= lt!458809 (array!65600 (store (arr!31560 (_keys!11586 thiss!1427)) (index!41588 lt!458811) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32095 (_keys!11586 thiss!1427))))))

(declare-fun lt!458813 () Unit!33917)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65599 (_ BitVec 32) (_ BitVec 64)) Unit!33917)

(assert (=> b!1041306 (= lt!458813 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11586 thiss!1427) (index!41588 lt!458811) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1041307 () Bool)

(assert (=> b!1041307 (= e!589697 (or (not (= (size!32096 (_values!6377 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30378 thiss!1427)))) (not (= (size!32095 (_keys!11586 thiss!1427)) (size!32096 (_values!6377 thiss!1427)))) (bvsge (mask!30378 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1041308 () Bool)

(declare-fun res!694064 () Bool)

(assert (=> b!1041308 (=> (not res!694064) (not e!589696))))

(assert (=> b!1041308 (= res!694064 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!91338 res!694061) b!1041308))

(assert (= (and b!1041308 res!694064) b!1041302))

(assert (= (and b!1041302 res!694063) b!1041306))

(assert (= (and b!1041306 (not res!694062)) b!1041307))

(assert (= (and b!1041304 condMapEmpty!38730) mapIsEmpty!38730))

(assert (= (and b!1041304 (not condMapEmpty!38730)) mapNonEmpty!38730))

(assert (= (and mapNonEmpty!38730 ((_ is ValueCellFull!11675) mapValue!38730)) b!1041305))

(assert (= (and b!1041304 ((_ is ValueCellFull!11675) mapDefault!38730)) b!1041303))

(assert (= b!1041301 b!1041304))

(assert (= start!91338 b!1041301))

(declare-fun m!960255 () Bool)

(assert (=> b!1041302 m!960255))

(declare-fun m!960257 () Bool)

(assert (=> mapNonEmpty!38730 m!960257))

(declare-fun m!960259 () Bool)

(assert (=> start!91338 m!960259))

(declare-fun m!960261 () Bool)

(assert (=> b!1041301 m!960261))

(declare-fun m!960263 () Bool)

(assert (=> b!1041301 m!960263))

(declare-fun m!960265 () Bool)

(assert (=> b!1041306 m!960265))

(declare-fun m!960267 () Bool)

(assert (=> b!1041306 m!960267))

(declare-fun m!960269 () Bool)

(assert (=> b!1041306 m!960269))

(declare-fun m!960271 () Bool)

(assert (=> b!1041306 m!960271))

(declare-fun m!960273 () Bool)

(assert (=> b!1041306 m!960273))

(declare-fun m!960275 () Bool)

(assert (=> b!1041306 m!960275))

(declare-fun m!960277 () Bool)

(assert (=> b!1041306 m!960277))

(declare-fun m!960279 () Bool)

(assert (=> b!1041306 m!960279))

(declare-fun m!960281 () Bool)

(assert (=> b!1041306 m!960281))

(declare-fun m!960283 () Bool)

(assert (=> b!1041306 m!960283))

(declare-fun m!960285 () Bool)

(assert (=> b!1041306 m!960285))

(check-sat (not b_next!21037) (not b!1041301) b_and!33543 (not start!91338) (not b!1041302) (not mapNonEmpty!38730) tp_is_empty!24757 (not b!1041306))
(check-sat b_and!33543 (not b_next!21037))
(get-model)

(declare-fun d!125737 () Bool)

(declare-fun res!694095 () Bool)

(declare-fun e!589748 () Bool)

(assert (=> d!125737 (=> (not res!694095) (not e!589748))))

(declare-fun simpleValid!438 (LongMapFixedSize!5944) Bool)

(assert (=> d!125737 (= res!694095 (simpleValid!438 thiss!1427))))

(assert (=> d!125737 (= (valid!2222 thiss!1427) e!589748)))

(declare-fun b!1041363 () Bool)

(declare-fun res!694096 () Bool)

(assert (=> b!1041363 (=> (not res!694096) (not e!589748))))

(assert (=> b!1041363 (= res!694096 (= (arrayCountValidKeys!0 (_keys!11586 thiss!1427) #b00000000000000000000000000000000 (size!32095 (_keys!11586 thiss!1427))) (_size!3027 thiss!1427)))))

(declare-fun b!1041364 () Bool)

(declare-fun res!694097 () Bool)

(assert (=> b!1041364 (=> (not res!694097) (not e!589748))))

(assert (=> b!1041364 (= res!694097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11586 thiss!1427) (mask!30378 thiss!1427)))))

(declare-fun b!1041365 () Bool)

(assert (=> b!1041365 (= e!589748 (arrayNoDuplicates!0 (_keys!11586 thiss!1427) #b00000000000000000000000000000000 Nil!22001))))

(assert (= (and d!125737 res!694095) b!1041363))

(assert (= (and b!1041363 res!694096) b!1041364))

(assert (= (and b!1041364 res!694097) b!1041365))

(declare-fun m!960351 () Bool)

(assert (=> d!125737 m!960351))

(assert (=> b!1041363 m!960277))

(declare-fun m!960353 () Bool)

(assert (=> b!1041364 m!960353))

(declare-fun m!960355 () Bool)

(assert (=> b!1041365 m!960355))

(assert (=> start!91338 d!125737))

(declare-fun b!1041378 () Bool)

(declare-fun e!589757 () SeekEntryResult!9804)

(declare-fun e!589755 () SeekEntryResult!9804)

(assert (=> b!1041378 (= e!589757 e!589755)))

(declare-fun lt!458859 () (_ BitVec 64))

(declare-fun lt!458860 () SeekEntryResult!9804)

(assert (=> b!1041378 (= lt!458859 (select (arr!31560 (_keys!11586 thiss!1427)) (index!41589 lt!458860)))))

(declare-fun c!105631 () Bool)

(assert (=> b!1041378 (= c!105631 (= lt!458859 key!909))))

(declare-fun b!1041379 () Bool)

(declare-fun e!589756 () SeekEntryResult!9804)

(declare-fun lt!458862 () SeekEntryResult!9804)

(assert (=> b!1041379 (= e!589756 (ite ((_ is MissingVacant!9804) lt!458862) (MissingZero!9804 (index!41590 lt!458862)) lt!458862))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65599 (_ BitVec 32)) SeekEntryResult!9804)

(assert (=> b!1041379 (= lt!458862 (seekKeyOrZeroReturnVacant!0 (x!92971 lt!458860) (index!41589 lt!458860) (index!41589 lt!458860) key!909 (_keys!11586 thiss!1427) (mask!30378 thiss!1427)))))

(declare-fun d!125739 () Bool)

(declare-fun lt!458861 () SeekEntryResult!9804)

(assert (=> d!125739 (and (or ((_ is MissingVacant!9804) lt!458861) (not ((_ is Found!9804) lt!458861)) (and (bvsge (index!41588 lt!458861) #b00000000000000000000000000000000) (bvslt (index!41588 lt!458861) (size!32095 (_keys!11586 thiss!1427))))) (not ((_ is MissingVacant!9804) lt!458861)) (or (not ((_ is Found!9804) lt!458861)) (= (select (arr!31560 (_keys!11586 thiss!1427)) (index!41588 lt!458861)) key!909)))))

(assert (=> d!125739 (= lt!458861 e!589757)))

(declare-fun c!105629 () Bool)

(assert (=> d!125739 (= c!105629 (and ((_ is Intermediate!9804) lt!458860) (undefined!10616 lt!458860)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65599 (_ BitVec 32)) SeekEntryResult!9804)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125739 (= lt!458860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30378 thiss!1427)) key!909 (_keys!11586 thiss!1427) (mask!30378 thiss!1427)))))

(assert (=> d!125739 (validMask!0 (mask!30378 thiss!1427))))

(assert (=> d!125739 (= (seekEntry!0 key!909 (_keys!11586 thiss!1427) (mask!30378 thiss!1427)) lt!458861)))

(declare-fun b!1041380 () Bool)

(assert (=> b!1041380 (= e!589757 Undefined!9804)))

(declare-fun b!1041381 () Bool)

(assert (=> b!1041381 (= e!589756 (MissingZero!9804 (index!41589 lt!458860)))))

(declare-fun b!1041382 () Bool)

(declare-fun c!105630 () Bool)

(assert (=> b!1041382 (= c!105630 (= lt!458859 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1041382 (= e!589755 e!589756)))

(declare-fun b!1041383 () Bool)

(assert (=> b!1041383 (= e!589755 (Found!9804 (index!41589 lt!458860)))))

(assert (= (and d!125739 c!105629) b!1041380))

(assert (= (and d!125739 (not c!105629)) b!1041378))

(assert (= (and b!1041378 c!105631) b!1041383))

(assert (= (and b!1041378 (not c!105631)) b!1041382))

(assert (= (and b!1041382 c!105630) b!1041381))

(assert (= (and b!1041382 (not c!105630)) b!1041379))

(declare-fun m!960357 () Bool)

(assert (=> b!1041378 m!960357))

(declare-fun m!960359 () Bool)

(assert (=> b!1041379 m!960359))

(declare-fun m!960361 () Bool)

(assert (=> d!125739 m!960361))

(declare-fun m!960363 () Bool)

(assert (=> d!125739 m!960363))

(assert (=> d!125739 m!960363))

(declare-fun m!960365 () Bool)

(assert (=> d!125739 m!960365))

(assert (=> d!125739 m!960269))

(assert (=> b!1041302 d!125739))

(declare-fun d!125741 () Bool)

(declare-fun res!694102 () Bool)

(declare-fun e!589762 () Bool)

(assert (=> d!125741 (=> res!694102 e!589762)))

(assert (=> d!125741 (= res!694102 (= (select (arr!31560 lt!458809) #b00000000000000000000000000000000) key!909))))

(assert (=> d!125741 (= (arrayContainsKey!0 lt!458809 key!909 #b00000000000000000000000000000000) e!589762)))

(declare-fun b!1041388 () Bool)

(declare-fun e!589763 () Bool)

(assert (=> b!1041388 (= e!589762 e!589763)))

(declare-fun res!694103 () Bool)

(assert (=> b!1041388 (=> (not res!694103) (not e!589763))))

(assert (=> b!1041388 (= res!694103 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32095 lt!458809)))))

(declare-fun b!1041389 () Bool)

(assert (=> b!1041389 (= e!589763 (arrayContainsKey!0 lt!458809 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125741 (not res!694102)) b!1041388))

(assert (= (and b!1041388 res!694103) b!1041389))

(declare-fun m!960367 () Bool)

(assert (=> d!125741 m!960367))

(declare-fun m!960369 () Bool)

(assert (=> b!1041389 m!960369))

(assert (=> b!1041306 d!125741))

(declare-fun bm!44092 () Bool)

(declare-fun call!44095 () (_ BitVec 32))

(assert (=> bm!44092 (= call!44095 (arrayCountValidKeys!0 lt!458809 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32095 (_keys!11586 thiss!1427))))))

(declare-fun b!1041398 () Bool)

(declare-fun e!589768 () (_ BitVec 32))

(declare-fun e!589769 () (_ BitVec 32))

(assert (=> b!1041398 (= e!589768 e!589769)))

(declare-fun c!105636 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1041398 (= c!105636 (validKeyInArray!0 (select (arr!31560 lt!458809) #b00000000000000000000000000000000)))))

(declare-fun b!1041399 () Bool)

(assert (=> b!1041399 (= e!589769 (bvadd #b00000000000000000000000000000001 call!44095))))

(declare-fun d!125743 () Bool)

(declare-fun lt!458865 () (_ BitVec 32))

(assert (=> d!125743 (and (bvsge lt!458865 #b00000000000000000000000000000000) (bvsle lt!458865 (bvsub (size!32095 lt!458809) #b00000000000000000000000000000000)))))

(assert (=> d!125743 (= lt!458865 e!589768)))

(declare-fun c!105637 () Bool)

(assert (=> d!125743 (= c!105637 (bvsge #b00000000000000000000000000000000 (size!32095 (_keys!11586 thiss!1427))))))

(assert (=> d!125743 (and (bvsle #b00000000000000000000000000000000 (size!32095 (_keys!11586 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32095 (_keys!11586 thiss!1427)) (size!32095 lt!458809)))))

(assert (=> d!125743 (= (arrayCountValidKeys!0 lt!458809 #b00000000000000000000000000000000 (size!32095 (_keys!11586 thiss!1427))) lt!458865)))

(declare-fun b!1041400 () Bool)

(assert (=> b!1041400 (= e!589768 #b00000000000000000000000000000000)))

(declare-fun b!1041401 () Bool)

(assert (=> b!1041401 (= e!589769 call!44095)))

(assert (= (and d!125743 c!105637) b!1041400))

(assert (= (and d!125743 (not c!105637)) b!1041398))

(assert (= (and b!1041398 c!105636) b!1041399))

(assert (= (and b!1041398 (not c!105636)) b!1041401))

(assert (= (or b!1041399 b!1041401) bm!44092))

(declare-fun m!960371 () Bool)

(assert (=> bm!44092 m!960371))

(assert (=> b!1041398 m!960367))

(assert (=> b!1041398 m!960367))

(declare-fun m!960373 () Bool)

(assert (=> b!1041398 m!960373))

(assert (=> b!1041306 d!125743))

(declare-fun d!125745 () Bool)

(assert (=> d!125745 (= (validMask!0 (mask!30378 thiss!1427)) (and (or (= (mask!30378 thiss!1427) #b00000000000000000000000000000111) (= (mask!30378 thiss!1427) #b00000000000000000000000000001111) (= (mask!30378 thiss!1427) #b00000000000000000000000000011111) (= (mask!30378 thiss!1427) #b00000000000000000000000000111111) (= (mask!30378 thiss!1427) #b00000000000000000000000001111111) (= (mask!30378 thiss!1427) #b00000000000000000000000011111111) (= (mask!30378 thiss!1427) #b00000000000000000000000111111111) (= (mask!30378 thiss!1427) #b00000000000000000000001111111111) (= (mask!30378 thiss!1427) #b00000000000000000000011111111111) (= (mask!30378 thiss!1427) #b00000000000000000000111111111111) (= (mask!30378 thiss!1427) #b00000000000000000001111111111111) (= (mask!30378 thiss!1427) #b00000000000000000011111111111111) (= (mask!30378 thiss!1427) #b00000000000000000111111111111111) (= (mask!30378 thiss!1427) #b00000000000000001111111111111111) (= (mask!30378 thiss!1427) #b00000000000000011111111111111111) (= (mask!30378 thiss!1427) #b00000000000000111111111111111111) (= (mask!30378 thiss!1427) #b00000000000001111111111111111111) (= (mask!30378 thiss!1427) #b00000000000011111111111111111111) (= (mask!30378 thiss!1427) #b00000000000111111111111111111111) (= (mask!30378 thiss!1427) #b00000000001111111111111111111111) (= (mask!30378 thiss!1427) #b00000000011111111111111111111111) (= (mask!30378 thiss!1427) #b00000000111111111111111111111111) (= (mask!30378 thiss!1427) #b00000001111111111111111111111111) (= (mask!30378 thiss!1427) #b00000011111111111111111111111111) (= (mask!30378 thiss!1427) #b00000111111111111111111111111111) (= (mask!30378 thiss!1427) #b00001111111111111111111111111111) (= (mask!30378 thiss!1427) #b00011111111111111111111111111111) (= (mask!30378 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30378 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1041306 d!125745))

(declare-fun d!125747 () Bool)

(declare-fun e!589772 () Bool)

(assert (=> d!125747 e!589772))

(declare-fun res!694106 () Bool)

(assert (=> d!125747 (=> (not res!694106) (not e!589772))))

(assert (=> d!125747 (= res!694106 (and (bvsge (index!41588 lt!458811) #b00000000000000000000000000000000) (bvslt (index!41588 lt!458811) (size!32095 (_keys!11586 thiss!1427)))))))

(declare-fun lt!458868 () Unit!33917)

(declare-fun choose!25 (array!65599 (_ BitVec 32) (_ BitVec 32)) Unit!33917)

(assert (=> d!125747 (= lt!458868 (choose!25 (_keys!11586 thiss!1427) (index!41588 lt!458811) (mask!30378 thiss!1427)))))

(assert (=> d!125747 (validMask!0 (mask!30378 thiss!1427))))

(assert (=> d!125747 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11586 thiss!1427) (index!41588 lt!458811) (mask!30378 thiss!1427)) lt!458868)))

(declare-fun b!1041404 () Bool)

(assert (=> b!1041404 (= e!589772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65600 (store (arr!31560 (_keys!11586 thiss!1427)) (index!41588 lt!458811) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32095 (_keys!11586 thiss!1427))) (mask!30378 thiss!1427)))))

(assert (= (and d!125747 res!694106) b!1041404))

(declare-fun m!960375 () Bool)

(assert (=> d!125747 m!960375))

(assert (=> d!125747 m!960269))

(assert (=> b!1041404 m!960275))

(declare-fun m!960377 () Bool)

(assert (=> b!1041404 m!960377))

(assert (=> b!1041306 d!125747))

(declare-fun d!125749 () Bool)

(declare-fun e!589775 () Bool)

(assert (=> d!125749 e!589775))

(declare-fun res!694109 () Bool)

(assert (=> d!125749 (=> (not res!694109) (not e!589775))))

(assert (=> d!125749 (= res!694109 (bvslt (index!41588 lt!458811) (size!32095 (_keys!11586 thiss!1427))))))

(declare-fun lt!458871 () Unit!33917)

(declare-fun choose!121 (array!65599 (_ BitVec 32) (_ BitVec 64)) Unit!33917)

(assert (=> d!125749 (= lt!458871 (choose!121 (_keys!11586 thiss!1427) (index!41588 lt!458811) key!909))))

(assert (=> d!125749 (bvsge (index!41588 lt!458811) #b00000000000000000000000000000000)))

(assert (=> d!125749 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11586 thiss!1427) (index!41588 lt!458811) key!909) lt!458871)))

(declare-fun b!1041407 () Bool)

(assert (=> b!1041407 (= e!589775 (not (arrayContainsKey!0 (array!65600 (store (arr!31560 (_keys!11586 thiss!1427)) (index!41588 lt!458811) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32095 (_keys!11586 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!125749 res!694109) b!1041407))

(declare-fun m!960379 () Bool)

(assert (=> d!125749 m!960379))

(assert (=> b!1041407 m!960275))

(declare-fun m!960381 () Bool)

(assert (=> b!1041407 m!960381))

(assert (=> b!1041306 d!125749))

(declare-fun bm!44093 () Bool)

(declare-fun call!44096 () (_ BitVec 32))

(assert (=> bm!44093 (= call!44096 (arrayCountValidKeys!0 (_keys!11586 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32095 (_keys!11586 thiss!1427))))))

(declare-fun b!1041408 () Bool)

(declare-fun e!589776 () (_ BitVec 32))

(declare-fun e!589777 () (_ BitVec 32))

(assert (=> b!1041408 (= e!589776 e!589777)))

(declare-fun c!105638 () Bool)

(assert (=> b!1041408 (= c!105638 (validKeyInArray!0 (select (arr!31560 (_keys!11586 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1041409 () Bool)

(assert (=> b!1041409 (= e!589777 (bvadd #b00000000000000000000000000000001 call!44096))))

(declare-fun d!125751 () Bool)

(declare-fun lt!458872 () (_ BitVec 32))

(assert (=> d!125751 (and (bvsge lt!458872 #b00000000000000000000000000000000) (bvsle lt!458872 (bvsub (size!32095 (_keys!11586 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125751 (= lt!458872 e!589776)))

(declare-fun c!105639 () Bool)

(assert (=> d!125751 (= c!105639 (bvsge #b00000000000000000000000000000000 (size!32095 (_keys!11586 thiss!1427))))))

(assert (=> d!125751 (and (bvsle #b00000000000000000000000000000000 (size!32095 (_keys!11586 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32095 (_keys!11586 thiss!1427)) (size!32095 (_keys!11586 thiss!1427))))))

(assert (=> d!125751 (= (arrayCountValidKeys!0 (_keys!11586 thiss!1427) #b00000000000000000000000000000000 (size!32095 (_keys!11586 thiss!1427))) lt!458872)))

(declare-fun b!1041410 () Bool)

(assert (=> b!1041410 (= e!589776 #b00000000000000000000000000000000)))

(declare-fun b!1041411 () Bool)

(assert (=> b!1041411 (= e!589777 call!44096)))

(assert (= (and d!125751 c!105639) b!1041410))

(assert (= (and d!125751 (not c!105639)) b!1041408))

(assert (= (and b!1041408 c!105638) b!1041409))

(assert (= (and b!1041408 (not c!105638)) b!1041411))

(assert (= (or b!1041409 b!1041411) bm!44093))

(declare-fun m!960383 () Bool)

(assert (=> bm!44093 m!960383))

(declare-fun m!960385 () Bool)

(assert (=> b!1041408 m!960385))

(assert (=> b!1041408 m!960385))

(declare-fun m!960387 () Bool)

(assert (=> b!1041408 m!960387))

(assert (=> b!1041306 d!125751))

(declare-fun b!1041422 () Bool)

(declare-fun e!589788 () Bool)

(declare-fun call!44099 () Bool)

(assert (=> b!1041422 (= e!589788 call!44099)))

(declare-fun b!1041423 () Bool)

(declare-fun e!589786 () Bool)

(declare-fun contains!6034 (List!22004 (_ BitVec 64)) Bool)

(assert (=> b!1041423 (= e!589786 (contains!6034 Nil!22001 (select (arr!31560 lt!458809) #b00000000000000000000000000000000)))))

(declare-fun bm!44096 () Bool)

(declare-fun c!105642 () Bool)

(assert (=> bm!44096 (= call!44099 (arrayNoDuplicates!0 lt!458809 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105642 (Cons!22000 (select (arr!31560 lt!458809) #b00000000000000000000000000000000) Nil!22001) Nil!22001)))))

(declare-fun b!1041424 () Bool)

(declare-fun e!589787 () Bool)

(assert (=> b!1041424 (= e!589787 e!589788)))

(assert (=> b!1041424 (= c!105642 (validKeyInArray!0 (select (arr!31560 lt!458809) #b00000000000000000000000000000000)))))

(declare-fun b!1041426 () Bool)

(assert (=> b!1041426 (= e!589788 call!44099)))

(declare-fun d!125753 () Bool)

(declare-fun res!694116 () Bool)

(declare-fun e!589789 () Bool)

(assert (=> d!125753 (=> res!694116 e!589789)))

(assert (=> d!125753 (= res!694116 (bvsge #b00000000000000000000000000000000 (size!32095 lt!458809)))))

(assert (=> d!125753 (= (arrayNoDuplicates!0 lt!458809 #b00000000000000000000000000000000 Nil!22001) e!589789)))

(declare-fun b!1041425 () Bool)

(assert (=> b!1041425 (= e!589789 e!589787)))

(declare-fun res!694118 () Bool)

(assert (=> b!1041425 (=> (not res!694118) (not e!589787))))

(assert (=> b!1041425 (= res!694118 (not e!589786))))

(declare-fun res!694117 () Bool)

(assert (=> b!1041425 (=> (not res!694117) (not e!589786))))

(assert (=> b!1041425 (= res!694117 (validKeyInArray!0 (select (arr!31560 lt!458809) #b00000000000000000000000000000000)))))

(assert (= (and d!125753 (not res!694116)) b!1041425))

(assert (= (and b!1041425 res!694117) b!1041423))

(assert (= (and b!1041425 res!694118) b!1041424))

(assert (= (and b!1041424 c!105642) b!1041422))

(assert (= (and b!1041424 (not c!105642)) b!1041426))

(assert (= (or b!1041422 b!1041426) bm!44096))

(assert (=> b!1041423 m!960367))

(assert (=> b!1041423 m!960367))

(declare-fun m!960389 () Bool)

(assert (=> b!1041423 m!960389))

(assert (=> bm!44096 m!960367))

(declare-fun m!960391 () Bool)

(assert (=> bm!44096 m!960391))

(assert (=> b!1041424 m!960367))

(assert (=> b!1041424 m!960367))

(assert (=> b!1041424 m!960373))

(assert (=> b!1041425 m!960367))

(assert (=> b!1041425 m!960367))

(assert (=> b!1041425 m!960373))

(assert (=> b!1041306 d!125753))

(declare-fun bm!44099 () Bool)

(declare-fun call!44102 () Bool)

(assert (=> bm!44099 (= call!44102 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458809 (mask!30378 thiss!1427)))))

(declare-fun b!1041435 () Bool)

(declare-fun e!589797 () Bool)

(declare-fun e!589796 () Bool)

(assert (=> b!1041435 (= e!589797 e!589796)))

(declare-fun lt!458879 () (_ BitVec 64))

(assert (=> b!1041435 (= lt!458879 (select (arr!31560 lt!458809) #b00000000000000000000000000000000))))

(declare-fun lt!458880 () Unit!33917)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65599 (_ BitVec 64) (_ BitVec 32)) Unit!33917)

(assert (=> b!1041435 (= lt!458880 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458809 lt!458879 #b00000000000000000000000000000000))))

(assert (=> b!1041435 (arrayContainsKey!0 lt!458809 lt!458879 #b00000000000000000000000000000000)))

(declare-fun lt!458881 () Unit!33917)

(assert (=> b!1041435 (= lt!458881 lt!458880)))

(declare-fun res!694123 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65599 (_ BitVec 32)) SeekEntryResult!9804)

(assert (=> b!1041435 (= res!694123 (= (seekEntryOrOpen!0 (select (arr!31560 lt!458809) #b00000000000000000000000000000000) lt!458809 (mask!30378 thiss!1427)) (Found!9804 #b00000000000000000000000000000000)))))

(assert (=> b!1041435 (=> (not res!694123) (not e!589796))))

(declare-fun b!1041436 () Bool)

(assert (=> b!1041436 (= e!589797 call!44102)))

(declare-fun d!125755 () Bool)

(declare-fun res!694124 () Bool)

(declare-fun e!589798 () Bool)

(assert (=> d!125755 (=> res!694124 e!589798)))

(assert (=> d!125755 (= res!694124 (bvsge #b00000000000000000000000000000000 (size!32095 lt!458809)))))

(assert (=> d!125755 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458809 (mask!30378 thiss!1427)) e!589798)))

(declare-fun b!1041437 () Bool)

(assert (=> b!1041437 (= e!589798 e!589797)))

(declare-fun c!105645 () Bool)

(assert (=> b!1041437 (= c!105645 (validKeyInArray!0 (select (arr!31560 lt!458809) #b00000000000000000000000000000000)))))

(declare-fun b!1041438 () Bool)

(assert (=> b!1041438 (= e!589796 call!44102)))

(assert (= (and d!125755 (not res!694124)) b!1041437))

(assert (= (and b!1041437 c!105645) b!1041435))

(assert (= (and b!1041437 (not c!105645)) b!1041436))

(assert (= (and b!1041435 res!694123) b!1041438))

(assert (= (or b!1041438 b!1041436) bm!44099))

(declare-fun m!960393 () Bool)

(assert (=> bm!44099 m!960393))

(assert (=> b!1041435 m!960367))

(declare-fun m!960395 () Bool)

(assert (=> b!1041435 m!960395))

(declare-fun m!960397 () Bool)

(assert (=> b!1041435 m!960397))

(assert (=> b!1041435 m!960367))

(declare-fun m!960399 () Bool)

(assert (=> b!1041435 m!960399))

(assert (=> b!1041437 m!960367))

(assert (=> b!1041437 m!960367))

(assert (=> b!1041437 m!960373))

(assert (=> b!1041306 d!125755))

(declare-fun d!125757 () Bool)

(declare-fun e!589801 () Bool)

(assert (=> d!125757 e!589801))

(declare-fun res!694127 () Bool)

(assert (=> d!125757 (=> (not res!694127) (not e!589801))))

(assert (=> d!125757 (= res!694127 (and (bvsge (index!41588 lt!458811) #b00000000000000000000000000000000) (bvslt (index!41588 lt!458811) (size!32095 (_keys!11586 thiss!1427)))))))

(declare-fun lt!458884 () Unit!33917)

(declare-fun choose!53 (array!65599 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22004) Unit!33917)

(assert (=> d!125757 (= lt!458884 (choose!53 (_keys!11586 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41588 lt!458811) #b00000000000000000000000000000000 Nil!22001))))

(assert (=> d!125757 (bvslt (size!32095 (_keys!11586 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125757 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11586 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41588 lt!458811) #b00000000000000000000000000000000 Nil!22001) lt!458884)))

(declare-fun b!1041441 () Bool)

(assert (=> b!1041441 (= e!589801 (arrayNoDuplicates!0 (array!65600 (store (arr!31560 (_keys!11586 thiss!1427)) (index!41588 lt!458811) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32095 (_keys!11586 thiss!1427))) #b00000000000000000000000000000000 Nil!22001))))

(assert (= (and d!125757 res!694127) b!1041441))

(declare-fun m!960401 () Bool)

(assert (=> d!125757 m!960401))

(assert (=> b!1041441 m!960275))

(declare-fun m!960403 () Bool)

(assert (=> b!1041441 m!960403))

(assert (=> b!1041306 d!125757))

(declare-fun b!1041451 () Bool)

(declare-fun res!694138 () Bool)

(declare-fun e!589807 () Bool)

(assert (=> b!1041451 (=> (not res!694138) (not e!589807))))

(assert (=> b!1041451 (= res!694138 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!125759 () Bool)

(declare-fun e!589806 () Bool)

(assert (=> d!125759 e!589806))

(declare-fun res!694136 () Bool)

(assert (=> d!125759 (=> (not res!694136) (not e!589806))))

(assert (=> d!125759 (= res!694136 (and (bvsge (index!41588 lt!458811) #b00000000000000000000000000000000) (bvslt (index!41588 lt!458811) (size!32095 (_keys!11586 thiss!1427)))))))

(declare-fun lt!458887 () Unit!33917)

(declare-fun choose!82 (array!65599 (_ BitVec 32) (_ BitVec 64)) Unit!33917)

(assert (=> d!125759 (= lt!458887 (choose!82 (_keys!11586 thiss!1427) (index!41588 lt!458811) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125759 e!589807))

(declare-fun res!694139 () Bool)

(assert (=> d!125759 (=> (not res!694139) (not e!589807))))

(assert (=> d!125759 (= res!694139 (and (bvsge (index!41588 lt!458811) #b00000000000000000000000000000000) (bvslt (index!41588 lt!458811) (size!32095 (_keys!11586 thiss!1427)))))))

(assert (=> d!125759 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11586 thiss!1427) (index!41588 lt!458811) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458887)))

(declare-fun b!1041450 () Bool)

(declare-fun res!694137 () Bool)

(assert (=> b!1041450 (=> (not res!694137) (not e!589807))))

(assert (=> b!1041450 (= res!694137 (validKeyInArray!0 (select (arr!31560 (_keys!11586 thiss!1427)) (index!41588 lt!458811))))))

(declare-fun b!1041453 () Bool)

(assert (=> b!1041453 (= e!589806 (= (arrayCountValidKeys!0 (array!65600 (store (arr!31560 (_keys!11586 thiss!1427)) (index!41588 lt!458811) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32095 (_keys!11586 thiss!1427))) #b00000000000000000000000000000000 (size!32095 (_keys!11586 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11586 thiss!1427) #b00000000000000000000000000000000 (size!32095 (_keys!11586 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1041452 () Bool)

(assert (=> b!1041452 (= e!589807 (bvslt (size!32095 (_keys!11586 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!125759 res!694139) b!1041450))

(assert (= (and b!1041450 res!694137) b!1041451))

(assert (= (and b!1041451 res!694138) b!1041452))

(assert (= (and d!125759 res!694136) b!1041453))

(declare-fun m!960405 () Bool)

(assert (=> b!1041451 m!960405))

(declare-fun m!960407 () Bool)

(assert (=> d!125759 m!960407))

(declare-fun m!960409 () Bool)

(assert (=> b!1041450 m!960409))

(assert (=> b!1041450 m!960409))

(declare-fun m!960411 () Bool)

(assert (=> b!1041450 m!960411))

(assert (=> b!1041453 m!960275))

(declare-fun m!960413 () Bool)

(assert (=> b!1041453 m!960413))

(assert (=> b!1041453 m!960277))

(assert (=> b!1041306 d!125759))

(declare-fun d!125761 () Bool)

(assert (=> d!125761 (= (array_inv!24395 (_keys!11586 thiss!1427)) (bvsge (size!32095 (_keys!11586 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041301 d!125761))

(declare-fun d!125763 () Bool)

(assert (=> d!125763 (= (array_inv!24396 (_values!6377 thiss!1427)) (bvsge (size!32096 (_values!6377 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041301 d!125763))

(declare-fun mapIsEmpty!38739 () Bool)

(declare-fun mapRes!38739 () Bool)

(assert (=> mapIsEmpty!38739 mapRes!38739))

(declare-fun mapNonEmpty!38739 () Bool)

(declare-fun tp!74338 () Bool)

(declare-fun e!589813 () Bool)

(assert (=> mapNonEmpty!38739 (= mapRes!38739 (and tp!74338 e!589813))))

(declare-fun mapValue!38739 () ValueCell!11675)

(declare-fun mapKey!38739 () (_ BitVec 32))

(declare-fun mapRest!38739 () (Array (_ BitVec 32) ValueCell!11675))

(assert (=> mapNonEmpty!38739 (= mapRest!38730 (store mapRest!38739 mapKey!38739 mapValue!38739))))

(declare-fun b!1041461 () Bool)

(declare-fun e!589812 () Bool)

(assert (=> b!1041461 (= e!589812 tp_is_empty!24757)))

(declare-fun b!1041460 () Bool)

(assert (=> b!1041460 (= e!589813 tp_is_empty!24757)))

(declare-fun condMapEmpty!38739 () Bool)

(declare-fun mapDefault!38739 () ValueCell!11675)

(assert (=> mapNonEmpty!38730 (= condMapEmpty!38739 (= mapRest!38730 ((as const (Array (_ BitVec 32) ValueCell!11675)) mapDefault!38739)))))

(assert (=> mapNonEmpty!38730 (= tp!74323 (and e!589812 mapRes!38739))))

(assert (= (and mapNonEmpty!38730 condMapEmpty!38739) mapIsEmpty!38739))

(assert (= (and mapNonEmpty!38730 (not condMapEmpty!38739)) mapNonEmpty!38739))

(assert (= (and mapNonEmpty!38739 ((_ is ValueCellFull!11675) mapValue!38739)) b!1041460))

(assert (= (and mapNonEmpty!38730 ((_ is ValueCellFull!11675) mapDefault!38739)) b!1041461))

(declare-fun m!960415 () Bool)

(assert (=> mapNonEmpty!38739 m!960415))

(check-sat (not bm!44093) (not b!1041389) (not bm!44096) (not b!1041425) (not b!1041437) (not b!1041453) (not b!1041451) (not d!125747) (not d!125757) (not b!1041379) (not bm!44092) tp_is_empty!24757 (not b!1041364) (not d!125749) (not d!125737) (not d!125739) (not b_next!21037) (not b!1041365) (not b!1041450) b_and!33543 (not bm!44099) (not b!1041423) (not b!1041407) (not b!1041363) (not mapNonEmpty!38739) (not b!1041408) (not b!1041435) (not b!1041404) (not b!1041398) (not b!1041441) (not d!125759) (not b!1041424))
(check-sat b_and!33543 (not b_next!21037))
