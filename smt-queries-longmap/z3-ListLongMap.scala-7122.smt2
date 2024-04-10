; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90268 () Bool)

(assert start!90268)

(declare-fun b!1033371 () Bool)

(declare-fun b_free!20787 () Bool)

(declare-fun b_next!20787 () Bool)

(assert (=> b!1033371 (= b_free!20787 (not b_next!20787))))

(declare-fun tp!73454 () Bool)

(declare-fun b_and!33255 () Bool)

(assert (=> b!1033371 (= tp!73454 b_and!33255)))

(declare-fun mapIsEmpty!38237 () Bool)

(declare-fun mapRes!38237 () Bool)

(assert (=> mapIsEmpty!38237 mapRes!38237))

(declare-fun b!1033370 () Bool)

(declare-fun res!690471 () Bool)

(declare-fun e!584083 () Bool)

(assert (=> b!1033370 (=> (not res!690471) (not e!584083))))

(declare-datatypes ((V!37549 0))(
  ( (V!37550 (val!12304 Int)) )
))
(declare-datatypes ((ValueCell!11550 0))(
  ( (ValueCellFull!11550 (v!14881 V!37549)) (EmptyCell!11550) )
))
(declare-datatypes ((array!65090 0))(
  ( (array!65091 (arr!31341 (Array (_ BitVec 32) (_ BitVec 64))) (size!31863 (_ BitVec 32))) )
))
(declare-datatypes ((array!65092 0))(
  ( (array!65093 (arr!31342 (Array (_ BitVec 32) ValueCell!11550)) (size!31864 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5694 0))(
  ( (LongMapFixedSize!5695 (defaultEntry!6221 Int) (mask!30070 (_ BitVec 32)) (extraKeys!5953 (_ BitVec 32)) (zeroValue!6057 V!37549) (minValue!6057 V!37549) (_size!2902 (_ BitVec 32)) (_keys!11399 array!65090) (_values!6244 array!65092) (_vacant!2902 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5694)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1033370 (= res!690471 (validMask!0 (mask!30070 thiss!1427)))))

(declare-fun e!584080 () Bool)

(declare-fun tp_is_empty!24507 () Bool)

(declare-fun e!584078 () Bool)

(declare-fun array_inv!24249 (array!65090) Bool)

(declare-fun array_inv!24250 (array!65092) Bool)

(assert (=> b!1033371 (= e!584080 (and tp!73454 tp_is_empty!24507 (array_inv!24249 (_keys!11399 thiss!1427)) (array_inv!24250 (_values!6244 thiss!1427)) e!584078))))

(declare-fun b!1033372 () Bool)

(declare-fun e!584082 () Bool)

(assert (=> b!1033372 (= e!584082 tp_is_empty!24507)))

(declare-fun res!690472 () Bool)

(assert (=> start!90268 (=> (not res!690472) (not e!584083))))

(declare-fun valid!2152 (LongMapFixedSize!5694) Bool)

(assert (=> start!90268 (= res!690472 (valid!2152 thiss!1427))))

(assert (=> start!90268 e!584083))

(assert (=> start!90268 e!584080))

(assert (=> start!90268 true))

(declare-fun b!1033373 () Bool)

(declare-fun res!690473 () Bool)

(assert (=> b!1033373 (=> (not res!690473) (not e!584083))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033373 (= res!690473 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1033374 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65090 (_ BitVec 32)) Bool)

(assert (=> b!1033374 (= e!584083 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11399 thiss!1427) (mask!30070 thiss!1427))))))

(declare-fun b!1033375 () Bool)

(declare-fun e!584081 () Bool)

(assert (=> b!1033375 (= e!584081 tp_is_empty!24507)))

(declare-fun mapNonEmpty!38237 () Bool)

(declare-fun tp!73455 () Bool)

(assert (=> mapNonEmpty!38237 (= mapRes!38237 (and tp!73455 e!584081))))

(declare-fun mapValue!38237 () ValueCell!11550)

(declare-fun mapRest!38237 () (Array (_ BitVec 32) ValueCell!11550))

(declare-fun mapKey!38237 () (_ BitVec 32))

(assert (=> mapNonEmpty!38237 (= (arr!31342 (_values!6244 thiss!1427)) (store mapRest!38237 mapKey!38237 mapValue!38237))))

(declare-fun b!1033376 () Bool)

(declare-fun res!690470 () Bool)

(assert (=> b!1033376 (=> (not res!690470) (not e!584083))))

(assert (=> b!1033376 (= res!690470 (and (= (size!31864 (_values!6244 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30070 thiss!1427))) (= (size!31863 (_keys!11399 thiss!1427)) (size!31864 (_values!6244 thiss!1427))) (bvsge (mask!30070 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5953 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5953 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5953 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5953 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5953 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5953 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5953 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1033377 () Bool)

(assert (=> b!1033377 (= e!584078 (and e!584082 mapRes!38237))))

(declare-fun condMapEmpty!38237 () Bool)

(declare-fun mapDefault!38237 () ValueCell!11550)

(assert (=> b!1033377 (= condMapEmpty!38237 (= (arr!31342 (_values!6244 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11550)) mapDefault!38237)))))

(assert (= (and start!90268 res!690472) b!1033373))

(assert (= (and b!1033373 res!690473) b!1033370))

(assert (= (and b!1033370 res!690471) b!1033376))

(assert (= (and b!1033376 res!690470) b!1033374))

(assert (= (and b!1033377 condMapEmpty!38237) mapIsEmpty!38237))

(assert (= (and b!1033377 (not condMapEmpty!38237)) mapNonEmpty!38237))

(get-info :version)

(assert (= (and mapNonEmpty!38237 ((_ is ValueCellFull!11550) mapValue!38237)) b!1033375))

(assert (= (and b!1033377 ((_ is ValueCellFull!11550) mapDefault!38237)) b!1033372))

(assert (= b!1033371 b!1033377))

(assert (= start!90268 b!1033371))

(declare-fun m!953159 () Bool)

(assert (=> b!1033371 m!953159))

(declare-fun m!953161 () Bool)

(assert (=> b!1033371 m!953161))

(declare-fun m!953163 () Bool)

(assert (=> b!1033370 m!953163))

(declare-fun m!953165 () Bool)

(assert (=> mapNonEmpty!38237 m!953165))

(declare-fun m!953167 () Bool)

(assert (=> start!90268 m!953167))

(declare-fun m!953169 () Bool)

(assert (=> b!1033374 m!953169))

(check-sat (not b!1033370) (not b!1033374) (not b_next!20787) (not mapNonEmpty!38237) (not start!90268) b_and!33255 tp_is_empty!24507 (not b!1033371))
(check-sat b_and!33255 (not b_next!20787))
(get-model)

(declare-fun d!123779 () Bool)

(assert (=> d!123779 (= (validMask!0 (mask!30070 thiss!1427)) (and (or (= (mask!30070 thiss!1427) #b00000000000000000000000000000111) (= (mask!30070 thiss!1427) #b00000000000000000000000000001111) (= (mask!30070 thiss!1427) #b00000000000000000000000000011111) (= (mask!30070 thiss!1427) #b00000000000000000000000000111111) (= (mask!30070 thiss!1427) #b00000000000000000000000001111111) (= (mask!30070 thiss!1427) #b00000000000000000000000011111111) (= (mask!30070 thiss!1427) #b00000000000000000000000111111111) (= (mask!30070 thiss!1427) #b00000000000000000000001111111111) (= (mask!30070 thiss!1427) #b00000000000000000000011111111111) (= (mask!30070 thiss!1427) #b00000000000000000000111111111111) (= (mask!30070 thiss!1427) #b00000000000000000001111111111111) (= (mask!30070 thiss!1427) #b00000000000000000011111111111111) (= (mask!30070 thiss!1427) #b00000000000000000111111111111111) (= (mask!30070 thiss!1427) #b00000000000000001111111111111111) (= (mask!30070 thiss!1427) #b00000000000000011111111111111111) (= (mask!30070 thiss!1427) #b00000000000000111111111111111111) (= (mask!30070 thiss!1427) #b00000000000001111111111111111111) (= (mask!30070 thiss!1427) #b00000000000011111111111111111111) (= (mask!30070 thiss!1427) #b00000000000111111111111111111111) (= (mask!30070 thiss!1427) #b00000000001111111111111111111111) (= (mask!30070 thiss!1427) #b00000000011111111111111111111111) (= (mask!30070 thiss!1427) #b00000000111111111111111111111111) (= (mask!30070 thiss!1427) #b00000001111111111111111111111111) (= (mask!30070 thiss!1427) #b00000011111111111111111111111111) (= (mask!30070 thiss!1427) #b00000111111111111111111111111111) (= (mask!30070 thiss!1427) #b00001111111111111111111111111111) (= (mask!30070 thiss!1427) #b00011111111111111111111111111111) (= (mask!30070 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30070 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1033370 d!123779))

(declare-fun d!123781 () Bool)

(declare-fun res!690491 () Bool)

(declare-fun e!584109 () Bool)

(assert (=> d!123781 (=> res!690491 e!584109)))

(assert (=> d!123781 (= res!690491 (bvsge #b00000000000000000000000000000000 (size!31863 (_keys!11399 thiss!1427))))))

(assert (=> d!123781 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11399 thiss!1427) (mask!30070 thiss!1427)) e!584109)))

(declare-fun b!1033410 () Bool)

(declare-fun e!584108 () Bool)

(declare-fun e!584110 () Bool)

(assert (=> b!1033410 (= e!584108 e!584110)))

(declare-fun lt!456097 () (_ BitVec 64))

(assert (=> b!1033410 (= lt!456097 (select (arr!31341 (_keys!11399 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33825 0))(
  ( (Unit!33826) )
))
(declare-fun lt!456098 () Unit!33825)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65090 (_ BitVec 64) (_ BitVec 32)) Unit!33825)

(assert (=> b!1033410 (= lt!456098 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11399 thiss!1427) lt!456097 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65090 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1033410 (arrayContainsKey!0 (_keys!11399 thiss!1427) lt!456097 #b00000000000000000000000000000000)))

(declare-fun lt!456096 () Unit!33825)

(assert (=> b!1033410 (= lt!456096 lt!456098)))

(declare-fun res!690490 () Bool)

(declare-datatypes ((SeekEntryResult!9736 0))(
  ( (MissingZero!9736 (index!41315 (_ BitVec 32))) (Found!9736 (index!41316 (_ BitVec 32))) (Intermediate!9736 (undefined!10548 Bool) (index!41317 (_ BitVec 32)) (x!92166 (_ BitVec 32))) (Undefined!9736) (MissingVacant!9736 (index!41318 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65090 (_ BitVec 32)) SeekEntryResult!9736)

(assert (=> b!1033410 (= res!690490 (= (seekEntryOrOpen!0 (select (arr!31341 (_keys!11399 thiss!1427)) #b00000000000000000000000000000000) (_keys!11399 thiss!1427) (mask!30070 thiss!1427)) (Found!9736 #b00000000000000000000000000000000)))))

(assert (=> b!1033410 (=> (not res!690490) (not e!584110))))

(declare-fun b!1033411 () Bool)

(declare-fun call!43638 () Bool)

(assert (=> b!1033411 (= e!584108 call!43638)))

(declare-fun bm!43635 () Bool)

(assert (=> bm!43635 (= call!43638 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11399 thiss!1427) (mask!30070 thiss!1427)))))

(declare-fun b!1033412 () Bool)

(assert (=> b!1033412 (= e!584110 call!43638)))

(declare-fun b!1033413 () Bool)

(assert (=> b!1033413 (= e!584109 e!584108)))

(declare-fun c!104364 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1033413 (= c!104364 (validKeyInArray!0 (select (arr!31341 (_keys!11399 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123781 (not res!690491)) b!1033413))

(assert (= (and b!1033413 c!104364) b!1033410))

(assert (= (and b!1033413 (not c!104364)) b!1033411))

(assert (= (and b!1033410 res!690490) b!1033412))

(assert (= (or b!1033412 b!1033411) bm!43635))

(declare-fun m!953183 () Bool)

(assert (=> b!1033410 m!953183))

(declare-fun m!953185 () Bool)

(assert (=> b!1033410 m!953185))

(declare-fun m!953187 () Bool)

(assert (=> b!1033410 m!953187))

(assert (=> b!1033410 m!953183))

(declare-fun m!953189 () Bool)

(assert (=> b!1033410 m!953189))

(declare-fun m!953191 () Bool)

(assert (=> bm!43635 m!953191))

(assert (=> b!1033413 m!953183))

(assert (=> b!1033413 m!953183))

(declare-fun m!953193 () Bool)

(assert (=> b!1033413 m!953193))

(assert (=> b!1033374 d!123781))

(declare-fun d!123783 () Bool)

(declare-fun res!690498 () Bool)

(declare-fun e!584113 () Bool)

(assert (=> d!123783 (=> (not res!690498) (not e!584113))))

(declare-fun simpleValid!403 (LongMapFixedSize!5694) Bool)

(assert (=> d!123783 (= res!690498 (simpleValid!403 thiss!1427))))

(assert (=> d!123783 (= (valid!2152 thiss!1427) e!584113)))

(declare-fun b!1033420 () Bool)

(declare-fun res!690499 () Bool)

(assert (=> b!1033420 (=> (not res!690499) (not e!584113))))

(declare-fun arrayCountValidKeys!0 (array!65090 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1033420 (= res!690499 (= (arrayCountValidKeys!0 (_keys!11399 thiss!1427) #b00000000000000000000000000000000 (size!31863 (_keys!11399 thiss!1427))) (_size!2902 thiss!1427)))))

(declare-fun b!1033421 () Bool)

(declare-fun res!690500 () Bool)

(assert (=> b!1033421 (=> (not res!690500) (not e!584113))))

(assert (=> b!1033421 (= res!690500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11399 thiss!1427) (mask!30070 thiss!1427)))))

(declare-fun b!1033422 () Bool)

(declare-datatypes ((List!21901 0))(
  ( (Nil!21898) (Cons!21897 (h!23099 (_ BitVec 64)) (t!31095 List!21901)) )
))
(declare-fun arrayNoDuplicates!0 (array!65090 (_ BitVec 32) List!21901) Bool)

(assert (=> b!1033422 (= e!584113 (arrayNoDuplicates!0 (_keys!11399 thiss!1427) #b00000000000000000000000000000000 Nil!21898))))

(assert (= (and d!123783 res!690498) b!1033420))

(assert (= (and b!1033420 res!690499) b!1033421))

(assert (= (and b!1033421 res!690500) b!1033422))

(declare-fun m!953195 () Bool)

(assert (=> d!123783 m!953195))

(declare-fun m!953197 () Bool)

(assert (=> b!1033420 m!953197))

(assert (=> b!1033421 m!953169))

(declare-fun m!953199 () Bool)

(assert (=> b!1033422 m!953199))

(assert (=> start!90268 d!123783))

(declare-fun d!123785 () Bool)

(assert (=> d!123785 (= (array_inv!24249 (_keys!11399 thiss!1427)) (bvsge (size!31863 (_keys!11399 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033371 d!123785))

(declare-fun d!123787 () Bool)

(assert (=> d!123787 (= (array_inv!24250 (_values!6244 thiss!1427)) (bvsge (size!31864 (_values!6244 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033371 d!123787))

(declare-fun b!1033430 () Bool)

(declare-fun e!584118 () Bool)

(assert (=> b!1033430 (= e!584118 tp_is_empty!24507)))

(declare-fun condMapEmpty!38243 () Bool)

(declare-fun mapDefault!38243 () ValueCell!11550)

(assert (=> mapNonEmpty!38237 (= condMapEmpty!38243 (= mapRest!38237 ((as const (Array (_ BitVec 32) ValueCell!11550)) mapDefault!38243)))))

(declare-fun mapRes!38243 () Bool)

(assert (=> mapNonEmpty!38237 (= tp!73455 (and e!584118 mapRes!38243))))

(declare-fun mapIsEmpty!38243 () Bool)

(assert (=> mapIsEmpty!38243 mapRes!38243))

(declare-fun mapNonEmpty!38243 () Bool)

(declare-fun tp!73464 () Bool)

(declare-fun e!584119 () Bool)

(assert (=> mapNonEmpty!38243 (= mapRes!38243 (and tp!73464 e!584119))))

(declare-fun mapRest!38243 () (Array (_ BitVec 32) ValueCell!11550))

(declare-fun mapValue!38243 () ValueCell!11550)

(declare-fun mapKey!38243 () (_ BitVec 32))

(assert (=> mapNonEmpty!38243 (= mapRest!38237 (store mapRest!38243 mapKey!38243 mapValue!38243))))

(declare-fun b!1033429 () Bool)

(assert (=> b!1033429 (= e!584119 tp_is_empty!24507)))

(assert (= (and mapNonEmpty!38237 condMapEmpty!38243) mapIsEmpty!38243))

(assert (= (and mapNonEmpty!38237 (not condMapEmpty!38243)) mapNonEmpty!38243))

(assert (= (and mapNonEmpty!38243 ((_ is ValueCellFull!11550) mapValue!38243)) b!1033429))

(assert (= (and mapNonEmpty!38237 ((_ is ValueCellFull!11550) mapDefault!38243)) b!1033430))

(declare-fun m!953201 () Bool)

(assert (=> mapNonEmpty!38243 m!953201))

(check-sat (not b!1033421) (not b!1033410) (not b_next!20787) (not d!123783) b_and!33255 (not b!1033422) tp_is_empty!24507 (not b!1033420) (not bm!43635) (not mapNonEmpty!38243) (not b!1033413))
(check-sat b_and!33255 (not b_next!20787))
