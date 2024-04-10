; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90496 () Bool)

(assert start!90496)

(declare-fun b!1035291 () Bool)

(declare-fun b_free!20835 () Bool)

(declare-fun b_next!20835 () Bool)

(assert (=> b!1035291 (= b_free!20835 (not b_next!20835))))

(declare-fun tp!73629 () Bool)

(declare-fun b_and!33335 () Bool)

(assert (=> b!1035291 (= tp!73629 b_and!33335)))

(declare-fun b!1035288 () Bool)

(declare-fun e!585364 () Bool)

(declare-fun e!585366 () Bool)

(declare-fun mapRes!38339 () Bool)

(assert (=> b!1035288 (= e!585364 (and e!585366 mapRes!38339))))

(declare-fun condMapEmpty!38339 () Bool)

(declare-datatypes ((V!37613 0))(
  ( (V!37614 (val!12328 Int)) )
))
(declare-datatypes ((ValueCell!11574 0))(
  ( (ValueCellFull!11574 (v!14908 V!37613)) (EmptyCell!11574) )
))
(declare-datatypes ((array!65202 0))(
  ( (array!65203 (arr!31389 (Array (_ BitVec 32) (_ BitVec 64))) (size!31916 (_ BitVec 32))) )
))
(declare-datatypes ((array!65204 0))(
  ( (array!65205 (arr!31390 (Array (_ BitVec 32) ValueCell!11574)) (size!31917 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5742 0))(
  ( (LongMapFixedSize!5743 (defaultEntry!6249 Int) (mask!30130 (_ BitVec 32)) (extraKeys!5979 (_ BitVec 32)) (zeroValue!6083 V!37613) (minValue!6085 V!37613) (_size!2926 (_ BitVec 32)) (_keys!11435 array!65202) (_values!6272 array!65204) (_vacant!2926 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5742)

(declare-fun mapDefault!38339 () ValueCell!11574)

(assert (=> b!1035288 (= condMapEmpty!38339 (= (arr!31390 (_values!6272 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11574)) mapDefault!38339)))))

(declare-fun b!1035289 () Bool)

(declare-fun tp_is_empty!24555 () Bool)

(assert (=> b!1035289 (= e!585366 tp_is_empty!24555)))

(declare-fun b!1035290 () Bool)

(declare-fun res!691289 () Bool)

(declare-fun e!585363 () Bool)

(assert (=> b!1035290 (=> (not res!691289) (not e!585363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035290 (= res!691289 (validMask!0 (mask!30130 thiss!1427)))))

(declare-fun mapIsEmpty!38339 () Bool)

(assert (=> mapIsEmpty!38339 mapRes!38339))

(declare-fun e!585367 () Bool)

(declare-fun array_inv!24281 (array!65202) Bool)

(declare-fun array_inv!24282 (array!65204) Bool)

(assert (=> b!1035291 (= e!585367 (and tp!73629 tp_is_empty!24555 (array_inv!24281 (_keys!11435 thiss!1427)) (array_inv!24282 (_values!6272 thiss!1427)) e!585364))))

(declare-fun b!1035292 () Bool)

(assert (=> b!1035292 (= e!585363 (and (= (size!31917 (_values!6272 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30130 thiss!1427))) (= (size!31916 (_keys!11435 thiss!1427)) (size!31917 (_values!6272 thiss!1427))) (bvsge (mask!30130 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5979 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5979 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1035293 () Bool)

(declare-fun res!691288 () Bool)

(assert (=> b!1035293 (=> (not res!691288) (not e!585363))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035293 (= res!691288 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!691287 () Bool)

(assert (=> start!90496 (=> (not res!691287) (not e!585363))))

(declare-fun valid!2169 (LongMapFixedSize!5742) Bool)

(assert (=> start!90496 (= res!691287 (valid!2169 thiss!1427))))

(assert (=> start!90496 e!585363))

(assert (=> start!90496 e!585367))

(assert (=> start!90496 true))

(declare-fun b!1035294 () Bool)

(declare-fun e!585368 () Bool)

(assert (=> b!1035294 (= e!585368 tp_is_empty!24555)))

(declare-fun mapNonEmpty!38339 () Bool)

(declare-fun tp!73628 () Bool)

(assert (=> mapNonEmpty!38339 (= mapRes!38339 (and tp!73628 e!585368))))

(declare-fun mapValue!38339 () ValueCell!11574)

(declare-fun mapKey!38339 () (_ BitVec 32))

(declare-fun mapRest!38339 () (Array (_ BitVec 32) ValueCell!11574))

(assert (=> mapNonEmpty!38339 (= (arr!31390 (_values!6272 thiss!1427)) (store mapRest!38339 mapKey!38339 mapValue!38339))))

(assert (= (and start!90496 res!691287) b!1035293))

(assert (= (and b!1035293 res!691288) b!1035290))

(assert (= (and b!1035290 res!691289) b!1035292))

(assert (= (and b!1035288 condMapEmpty!38339) mapIsEmpty!38339))

(assert (= (and b!1035288 (not condMapEmpty!38339)) mapNonEmpty!38339))

(get-info :version)

(assert (= (and mapNonEmpty!38339 ((_ is ValueCellFull!11574) mapValue!38339)) b!1035294))

(assert (= (and b!1035288 ((_ is ValueCellFull!11574) mapDefault!38339)) b!1035289))

(assert (= b!1035291 b!1035288))

(assert (= start!90496 b!1035291))

(declare-fun m!955311 () Bool)

(assert (=> b!1035290 m!955311))

(declare-fun m!955313 () Bool)

(assert (=> b!1035291 m!955313))

(declare-fun m!955315 () Bool)

(assert (=> b!1035291 m!955315))

(declare-fun m!955317 () Bool)

(assert (=> start!90496 m!955317))

(declare-fun m!955319 () Bool)

(assert (=> mapNonEmpty!38339 m!955319))

(check-sat tp_is_empty!24555 (not mapNonEmpty!38339) (not b_next!20835) (not b!1035291) (not b!1035290) b_and!33335 (not start!90496))
(check-sat b_and!33335 (not b_next!20835))
(get-model)

(declare-fun d!124507 () Bool)

(declare-fun res!691305 () Bool)

(declare-fun e!585389 () Bool)

(assert (=> d!124507 (=> (not res!691305) (not e!585389))))

(declare-fun simpleValid!411 (LongMapFixedSize!5742) Bool)

(assert (=> d!124507 (= res!691305 (simpleValid!411 thiss!1427))))

(assert (=> d!124507 (= (valid!2169 thiss!1427) e!585389)))

(declare-fun b!1035322 () Bool)

(declare-fun res!691306 () Bool)

(assert (=> b!1035322 (=> (not res!691306) (not e!585389))))

(declare-fun arrayCountValidKeys!0 (array!65202 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1035322 (= res!691306 (= (arrayCountValidKeys!0 (_keys!11435 thiss!1427) #b00000000000000000000000000000000 (size!31916 (_keys!11435 thiss!1427))) (_size!2926 thiss!1427)))))

(declare-fun b!1035323 () Bool)

(declare-fun res!691307 () Bool)

(assert (=> b!1035323 (=> (not res!691307) (not e!585389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65202 (_ BitVec 32)) Bool)

(assert (=> b!1035323 (= res!691307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11435 thiss!1427) (mask!30130 thiss!1427)))))

(declare-fun b!1035324 () Bool)

(declare-datatypes ((List!21913 0))(
  ( (Nil!21910) (Cons!21909 (h!23111 (_ BitVec 64)) (t!31116 List!21913)) )
))
(declare-fun arrayNoDuplicates!0 (array!65202 (_ BitVec 32) List!21913) Bool)

(assert (=> b!1035324 (= e!585389 (arrayNoDuplicates!0 (_keys!11435 thiss!1427) #b00000000000000000000000000000000 Nil!21910))))

(assert (= (and d!124507 res!691305) b!1035322))

(assert (= (and b!1035322 res!691306) b!1035323))

(assert (= (and b!1035323 res!691307) b!1035324))

(declare-fun m!955331 () Bool)

(assert (=> d!124507 m!955331))

(declare-fun m!955333 () Bool)

(assert (=> b!1035322 m!955333))

(declare-fun m!955335 () Bool)

(assert (=> b!1035323 m!955335))

(declare-fun m!955337 () Bool)

(assert (=> b!1035324 m!955337))

(assert (=> start!90496 d!124507))

(declare-fun d!124509 () Bool)

(assert (=> d!124509 (= (validMask!0 (mask!30130 thiss!1427)) (and (or (= (mask!30130 thiss!1427) #b00000000000000000000000000000111) (= (mask!30130 thiss!1427) #b00000000000000000000000000001111) (= (mask!30130 thiss!1427) #b00000000000000000000000000011111) (= (mask!30130 thiss!1427) #b00000000000000000000000000111111) (= (mask!30130 thiss!1427) #b00000000000000000000000001111111) (= (mask!30130 thiss!1427) #b00000000000000000000000011111111) (= (mask!30130 thiss!1427) #b00000000000000000000000111111111) (= (mask!30130 thiss!1427) #b00000000000000000000001111111111) (= (mask!30130 thiss!1427) #b00000000000000000000011111111111) (= (mask!30130 thiss!1427) #b00000000000000000000111111111111) (= (mask!30130 thiss!1427) #b00000000000000000001111111111111) (= (mask!30130 thiss!1427) #b00000000000000000011111111111111) (= (mask!30130 thiss!1427) #b00000000000000000111111111111111) (= (mask!30130 thiss!1427) #b00000000000000001111111111111111) (= (mask!30130 thiss!1427) #b00000000000000011111111111111111) (= (mask!30130 thiss!1427) #b00000000000000111111111111111111) (= (mask!30130 thiss!1427) #b00000000000001111111111111111111) (= (mask!30130 thiss!1427) #b00000000000011111111111111111111) (= (mask!30130 thiss!1427) #b00000000000111111111111111111111) (= (mask!30130 thiss!1427) #b00000000001111111111111111111111) (= (mask!30130 thiss!1427) #b00000000011111111111111111111111) (= (mask!30130 thiss!1427) #b00000000111111111111111111111111) (= (mask!30130 thiss!1427) #b00000001111111111111111111111111) (= (mask!30130 thiss!1427) #b00000011111111111111111111111111) (= (mask!30130 thiss!1427) #b00000111111111111111111111111111) (= (mask!30130 thiss!1427) #b00001111111111111111111111111111) (= (mask!30130 thiss!1427) #b00011111111111111111111111111111) (= (mask!30130 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30130 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1035290 d!124509))

(declare-fun d!124511 () Bool)

(assert (=> d!124511 (= (array_inv!24281 (_keys!11435 thiss!1427)) (bvsge (size!31916 (_keys!11435 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035291 d!124511))

(declare-fun d!124513 () Bool)

(assert (=> d!124513 (= (array_inv!24282 (_values!6272 thiss!1427)) (bvsge (size!31917 (_values!6272 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035291 d!124513))

(declare-fun mapNonEmpty!38345 () Bool)

(declare-fun mapRes!38345 () Bool)

(declare-fun tp!73638 () Bool)

(declare-fun e!585394 () Bool)

(assert (=> mapNonEmpty!38345 (= mapRes!38345 (and tp!73638 e!585394))))

(declare-fun mapValue!38345 () ValueCell!11574)

(declare-fun mapRest!38345 () (Array (_ BitVec 32) ValueCell!11574))

(declare-fun mapKey!38345 () (_ BitVec 32))

(assert (=> mapNonEmpty!38345 (= mapRest!38339 (store mapRest!38345 mapKey!38345 mapValue!38345))))

(declare-fun b!1035331 () Bool)

(assert (=> b!1035331 (= e!585394 tp_is_empty!24555)))

(declare-fun b!1035332 () Bool)

(declare-fun e!585395 () Bool)

(assert (=> b!1035332 (= e!585395 tp_is_empty!24555)))

(declare-fun condMapEmpty!38345 () Bool)

(declare-fun mapDefault!38345 () ValueCell!11574)

(assert (=> mapNonEmpty!38339 (= condMapEmpty!38345 (= mapRest!38339 ((as const (Array (_ BitVec 32) ValueCell!11574)) mapDefault!38345)))))

(assert (=> mapNonEmpty!38339 (= tp!73628 (and e!585395 mapRes!38345))))

(declare-fun mapIsEmpty!38345 () Bool)

(assert (=> mapIsEmpty!38345 mapRes!38345))

(assert (= (and mapNonEmpty!38339 condMapEmpty!38345) mapIsEmpty!38345))

(assert (= (and mapNonEmpty!38339 (not condMapEmpty!38345)) mapNonEmpty!38345))

(assert (= (and mapNonEmpty!38345 ((_ is ValueCellFull!11574) mapValue!38345)) b!1035331))

(assert (= (and mapNonEmpty!38339 ((_ is ValueCellFull!11574) mapDefault!38345)) b!1035332))

(declare-fun m!955339 () Bool)

(assert (=> mapNonEmpty!38345 m!955339))

(check-sat (not b_next!20835) tp_is_empty!24555 (not mapNonEmpty!38345) (not b!1035322) (not b!1035323) (not d!124507) b_and!33335 (not b!1035324))
(check-sat b_and!33335 (not b_next!20835))
(get-model)

(declare-fun b!1035341 () Bool)

(declare-fun e!585400 () (_ BitVec 32))

(declare-fun e!585401 () (_ BitVec 32))

(assert (=> b!1035341 (= e!585400 e!585401)))

(declare-fun c!104730 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1035341 (= c!104730 (validKeyInArray!0 (select (arr!31389 (_keys!11435 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43782 () Bool)

(declare-fun call!43785 () (_ BitVec 32))

(assert (=> bm!43782 (= call!43785 (arrayCountValidKeys!0 (_keys!11435 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31916 (_keys!11435 thiss!1427))))))

(declare-fun d!124515 () Bool)

(declare-fun lt!456747 () (_ BitVec 32))

(assert (=> d!124515 (and (bvsge lt!456747 #b00000000000000000000000000000000) (bvsle lt!456747 (bvsub (size!31916 (_keys!11435 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124515 (= lt!456747 e!585400)))

(declare-fun c!104729 () Bool)

(assert (=> d!124515 (= c!104729 (bvsge #b00000000000000000000000000000000 (size!31916 (_keys!11435 thiss!1427))))))

(assert (=> d!124515 (and (bvsle #b00000000000000000000000000000000 (size!31916 (_keys!11435 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31916 (_keys!11435 thiss!1427)) (size!31916 (_keys!11435 thiss!1427))))))

(assert (=> d!124515 (= (arrayCountValidKeys!0 (_keys!11435 thiss!1427) #b00000000000000000000000000000000 (size!31916 (_keys!11435 thiss!1427))) lt!456747)))

(declare-fun b!1035342 () Bool)

(assert (=> b!1035342 (= e!585401 (bvadd #b00000000000000000000000000000001 call!43785))))

(declare-fun b!1035343 () Bool)

(assert (=> b!1035343 (= e!585401 call!43785)))

(declare-fun b!1035344 () Bool)

(assert (=> b!1035344 (= e!585400 #b00000000000000000000000000000000)))

(assert (= (and d!124515 c!104729) b!1035344))

(assert (= (and d!124515 (not c!104729)) b!1035341))

(assert (= (and b!1035341 c!104730) b!1035342))

(assert (= (and b!1035341 (not c!104730)) b!1035343))

(assert (= (or b!1035342 b!1035343) bm!43782))

(declare-fun m!955341 () Bool)

(assert (=> b!1035341 m!955341))

(assert (=> b!1035341 m!955341))

(declare-fun m!955343 () Bool)

(assert (=> b!1035341 m!955343))

(declare-fun m!955345 () Bool)

(assert (=> bm!43782 m!955345))

(assert (=> b!1035322 d!124515))

(declare-fun b!1035353 () Bool)

(declare-fun res!691316 () Bool)

(declare-fun e!585404 () Bool)

(assert (=> b!1035353 (=> (not res!691316) (not e!585404))))

(assert (=> b!1035353 (= res!691316 (and (= (size!31917 (_values!6272 thiss!1427)) (bvadd (mask!30130 thiss!1427) #b00000000000000000000000000000001)) (= (size!31916 (_keys!11435 thiss!1427)) (size!31917 (_values!6272 thiss!1427))) (bvsge (_size!2926 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2926 thiss!1427) (bvadd (mask!30130 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun d!124517 () Bool)

(declare-fun res!691318 () Bool)

(assert (=> d!124517 (=> (not res!691318) (not e!585404))))

(assert (=> d!124517 (= res!691318 (validMask!0 (mask!30130 thiss!1427)))))

(assert (=> d!124517 (= (simpleValid!411 thiss!1427) e!585404)))

(declare-fun b!1035356 () Bool)

(assert (=> b!1035356 (= e!585404 (and (bvsge (extraKeys!5979 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5979 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2926 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1035355 () Bool)

(declare-fun res!691317 () Bool)

(assert (=> b!1035355 (=> (not res!691317) (not e!585404))))

(declare-fun size!31920 (LongMapFixedSize!5742) (_ BitVec 32))

(assert (=> b!1035355 (= res!691317 (= (size!31920 thiss!1427) (bvadd (_size!2926 thiss!1427) (bvsdiv (bvadd (extraKeys!5979 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1035354 () Bool)

(declare-fun res!691319 () Bool)

(assert (=> b!1035354 (=> (not res!691319) (not e!585404))))

(assert (=> b!1035354 (= res!691319 (bvsge (size!31920 thiss!1427) (_size!2926 thiss!1427)))))

(assert (= (and d!124517 res!691318) b!1035353))

(assert (= (and b!1035353 res!691316) b!1035354))

(assert (= (and b!1035354 res!691319) b!1035355))

(assert (= (and b!1035355 res!691317) b!1035356))

(assert (=> d!124517 m!955311))

(declare-fun m!955347 () Bool)

(assert (=> b!1035355 m!955347))

(assert (=> b!1035354 m!955347))

(assert (=> d!124507 d!124517))

(declare-fun d!124519 () Bool)

(declare-fun res!691324 () Bool)

(declare-fun e!585411 () Bool)

(assert (=> d!124519 (=> res!691324 e!585411)))

(assert (=> d!124519 (= res!691324 (bvsge #b00000000000000000000000000000000 (size!31916 (_keys!11435 thiss!1427))))))

(assert (=> d!124519 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11435 thiss!1427) (mask!30130 thiss!1427)) e!585411)))

(declare-fun b!1035365 () Bool)

(declare-fun e!585412 () Bool)

(declare-fun call!43788 () Bool)

(assert (=> b!1035365 (= e!585412 call!43788)))

(declare-fun b!1035366 () Bool)

(declare-fun e!585413 () Bool)

(assert (=> b!1035366 (= e!585411 e!585413)))

(declare-fun c!104733 () Bool)

(assert (=> b!1035366 (= c!104733 (validKeyInArray!0 (select (arr!31389 (_keys!11435 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035367 () Bool)

(assert (=> b!1035367 (= e!585413 call!43788)))

(declare-fun b!1035368 () Bool)

(assert (=> b!1035368 (= e!585413 e!585412)))

(declare-fun lt!456754 () (_ BitVec 64))

(assert (=> b!1035368 (= lt!456754 (select (arr!31389 (_keys!11435 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33888 0))(
  ( (Unit!33889) )
))
(declare-fun lt!456756 () Unit!33888)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65202 (_ BitVec 64) (_ BitVec 32)) Unit!33888)

(assert (=> b!1035368 (= lt!456756 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11435 thiss!1427) lt!456754 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1035368 (arrayContainsKey!0 (_keys!11435 thiss!1427) lt!456754 #b00000000000000000000000000000000)))

(declare-fun lt!456755 () Unit!33888)

(assert (=> b!1035368 (= lt!456755 lt!456756)))

(declare-fun res!691325 () Bool)

(declare-datatypes ((SeekEntryResult!9743 0))(
  ( (MissingZero!9743 (index!41343 (_ BitVec 32))) (Found!9743 (index!41344 (_ BitVec 32))) (Intermediate!9743 (undefined!10555 Bool) (index!41345 (_ BitVec 32)) (x!92364 (_ BitVec 32))) (Undefined!9743) (MissingVacant!9743 (index!41346 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65202 (_ BitVec 32)) SeekEntryResult!9743)

(assert (=> b!1035368 (= res!691325 (= (seekEntryOrOpen!0 (select (arr!31389 (_keys!11435 thiss!1427)) #b00000000000000000000000000000000) (_keys!11435 thiss!1427) (mask!30130 thiss!1427)) (Found!9743 #b00000000000000000000000000000000)))))

(assert (=> b!1035368 (=> (not res!691325) (not e!585412))))

(declare-fun bm!43785 () Bool)

(assert (=> bm!43785 (= call!43788 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11435 thiss!1427) (mask!30130 thiss!1427)))))

(assert (= (and d!124519 (not res!691324)) b!1035366))

(assert (= (and b!1035366 c!104733) b!1035368))

(assert (= (and b!1035366 (not c!104733)) b!1035367))

(assert (= (and b!1035368 res!691325) b!1035365))

(assert (= (or b!1035365 b!1035367) bm!43785))

(assert (=> b!1035366 m!955341))

(assert (=> b!1035366 m!955341))

(assert (=> b!1035366 m!955343))

(assert (=> b!1035368 m!955341))

(declare-fun m!955349 () Bool)

(assert (=> b!1035368 m!955349))

(declare-fun m!955351 () Bool)

(assert (=> b!1035368 m!955351))

(assert (=> b!1035368 m!955341))

(declare-fun m!955353 () Bool)

(assert (=> b!1035368 m!955353))

(declare-fun m!955355 () Bool)

(assert (=> bm!43785 m!955355))

(assert (=> b!1035323 d!124519))

(declare-fun b!1035379 () Bool)

(declare-fun e!585422 () Bool)

(declare-fun call!43791 () Bool)

(assert (=> b!1035379 (= e!585422 call!43791)))

(declare-fun d!124521 () Bool)

(declare-fun res!691332 () Bool)

(declare-fun e!585425 () Bool)

(assert (=> d!124521 (=> res!691332 e!585425)))

(assert (=> d!124521 (= res!691332 (bvsge #b00000000000000000000000000000000 (size!31916 (_keys!11435 thiss!1427))))))

(assert (=> d!124521 (= (arrayNoDuplicates!0 (_keys!11435 thiss!1427) #b00000000000000000000000000000000 Nil!21910) e!585425)))

(declare-fun bm!43788 () Bool)

(declare-fun c!104736 () Bool)

(assert (=> bm!43788 (= call!43791 (arrayNoDuplicates!0 (_keys!11435 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104736 (Cons!21909 (select (arr!31389 (_keys!11435 thiss!1427)) #b00000000000000000000000000000000) Nil!21910) Nil!21910)))))

(declare-fun b!1035380 () Bool)

(assert (=> b!1035380 (= e!585422 call!43791)))

(declare-fun b!1035381 () Bool)

(declare-fun e!585424 () Bool)

(assert (=> b!1035381 (= e!585424 e!585422)))

(assert (=> b!1035381 (= c!104736 (validKeyInArray!0 (select (arr!31389 (_keys!11435 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035382 () Bool)

(assert (=> b!1035382 (= e!585425 e!585424)))

(declare-fun res!691333 () Bool)

(assert (=> b!1035382 (=> (not res!691333) (not e!585424))))

(declare-fun e!585423 () Bool)

(assert (=> b!1035382 (= res!691333 (not e!585423))))

(declare-fun res!691334 () Bool)

(assert (=> b!1035382 (=> (not res!691334) (not e!585423))))

(assert (=> b!1035382 (= res!691334 (validKeyInArray!0 (select (arr!31389 (_keys!11435 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035383 () Bool)

(declare-fun contains!6019 (List!21913 (_ BitVec 64)) Bool)

(assert (=> b!1035383 (= e!585423 (contains!6019 Nil!21910 (select (arr!31389 (_keys!11435 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124521 (not res!691332)) b!1035382))

(assert (= (and b!1035382 res!691334) b!1035383))

(assert (= (and b!1035382 res!691333) b!1035381))

(assert (= (and b!1035381 c!104736) b!1035380))

(assert (= (and b!1035381 (not c!104736)) b!1035379))

(assert (= (or b!1035380 b!1035379) bm!43788))

(assert (=> bm!43788 m!955341))

(declare-fun m!955357 () Bool)

(assert (=> bm!43788 m!955357))

(assert (=> b!1035381 m!955341))

(assert (=> b!1035381 m!955341))

(assert (=> b!1035381 m!955343))

(assert (=> b!1035382 m!955341))

(assert (=> b!1035382 m!955341))

(assert (=> b!1035382 m!955343))

(assert (=> b!1035383 m!955341))

(assert (=> b!1035383 m!955341))

(declare-fun m!955359 () Bool)

(assert (=> b!1035383 m!955359))

(assert (=> b!1035324 d!124521))

(declare-fun mapNonEmpty!38346 () Bool)

(declare-fun mapRes!38346 () Bool)

(declare-fun tp!73639 () Bool)

(declare-fun e!585426 () Bool)

(assert (=> mapNonEmpty!38346 (= mapRes!38346 (and tp!73639 e!585426))))

(declare-fun mapValue!38346 () ValueCell!11574)

(declare-fun mapKey!38346 () (_ BitVec 32))

(declare-fun mapRest!38346 () (Array (_ BitVec 32) ValueCell!11574))

(assert (=> mapNonEmpty!38346 (= mapRest!38345 (store mapRest!38346 mapKey!38346 mapValue!38346))))

(declare-fun b!1035384 () Bool)

(assert (=> b!1035384 (= e!585426 tp_is_empty!24555)))

(declare-fun b!1035385 () Bool)

(declare-fun e!585427 () Bool)

(assert (=> b!1035385 (= e!585427 tp_is_empty!24555)))

(declare-fun condMapEmpty!38346 () Bool)

(declare-fun mapDefault!38346 () ValueCell!11574)

(assert (=> mapNonEmpty!38345 (= condMapEmpty!38346 (= mapRest!38345 ((as const (Array (_ BitVec 32) ValueCell!11574)) mapDefault!38346)))))

(assert (=> mapNonEmpty!38345 (= tp!73638 (and e!585427 mapRes!38346))))

(declare-fun mapIsEmpty!38346 () Bool)

(assert (=> mapIsEmpty!38346 mapRes!38346))

(assert (= (and mapNonEmpty!38345 condMapEmpty!38346) mapIsEmpty!38346))

(assert (= (and mapNonEmpty!38345 (not condMapEmpty!38346)) mapNonEmpty!38346))

(assert (= (and mapNonEmpty!38346 ((_ is ValueCellFull!11574) mapValue!38346)) b!1035384))

(assert (= (and mapNonEmpty!38345 ((_ is ValueCellFull!11574) mapDefault!38346)) b!1035385))

(declare-fun m!955361 () Bool)

(assert (=> mapNonEmpty!38346 m!955361))

(check-sat tp_is_empty!24555 (not mapNonEmpty!38346) (not bm!43785) (not d!124517) (not b!1035341) (not b!1035368) (not b!1035381) (not b!1035383) b_and!33335 (not bm!43782) (not b!1035366) (not bm!43788) (not b_next!20835) (not b!1035354) (not b!1035355) (not b!1035382))
(check-sat b_and!33335 (not b_next!20835))
