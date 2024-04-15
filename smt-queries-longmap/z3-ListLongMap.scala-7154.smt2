; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91006 () Bool)

(assert start!91006)

(declare-fun b!1039313 () Bool)

(declare-fun b_free!20977 () Bool)

(declare-fun b_next!20977 () Bool)

(assert (=> b!1039313 (= b_free!20977 (not b_next!20977))))

(declare-fun tp!74111 () Bool)

(declare-fun b_and!33483 () Bool)

(assert (=> b!1039313 (= tp!74111 b_and!33483)))

(declare-fun b!1039309 () Bool)

(declare-fun res!693138 () Bool)

(declare-fun e!588222 () Bool)

(assert (=> b!1039309 (=> (not res!693138) (not e!588222))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1039309 (= res!693138 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1039310 () Bool)

(declare-fun res!693140 () Bool)

(declare-fun e!588228 () Bool)

(assert (=> b!1039310 (=> res!693140 e!588228)))

(declare-datatypes ((V!37803 0))(
  ( (V!37804 (val!12399 Int)) )
))
(declare-datatypes ((ValueCell!11645 0))(
  ( (ValueCellFull!11645 (v!14985 V!37803)) (EmptyCell!11645) )
))
(declare-datatypes ((array!65459 0))(
  ( (array!65460 (arr!31500 (Array (_ BitVec 32) (_ BitVec 64))) (size!32033 (_ BitVec 32))) )
))
(declare-datatypes ((array!65461 0))(
  ( (array!65462 (arr!31501 (Array (_ BitVec 32) ValueCell!11645)) (size!32034 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5884 0))(
  ( (LongMapFixedSize!5885 (defaultEntry!6324 Int) (mask!30285 (_ BitVec 32)) (extraKeys!6052 (_ BitVec 32)) (zeroValue!6158 V!37803) (minValue!6158 V!37803) (_size!2997 (_ BitVec 32)) (_keys!11530 array!65459) (_values!6347 array!65461) (_vacant!2997 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5884)

(declare-datatypes ((SeekEntryResult!9779 0))(
  ( (MissingZero!9779 (index!41487 (_ BitVec 32))) (Found!9779 (index!41488 (_ BitVec 32))) (Intermediate!9779 (undefined!10591 Bool) (index!41489 (_ BitVec 32)) (x!92768 (_ BitVec 32))) (Undefined!9779) (MissingVacant!9779 (index!41490 (_ BitVec 32))) )
))
(declare-fun lt!457903 () SeekEntryResult!9779)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1039310 (= res!693140 (not (validKeyInArray!0 (select (arr!31500 (_keys!11530 thiss!1427)) (index!41488 lt!457903)))))))

(declare-fun b!1039311 () Bool)

(declare-fun res!693135 () Bool)

(assert (=> b!1039311 (=> res!693135 e!588228)))

(assert (=> b!1039311 (= res!693135 (or (not (= (size!32033 (_keys!11530 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30285 thiss!1427)))) (bvslt (index!41488 lt!457903) #b00000000000000000000000000000000) (bvsge (index!41488 lt!457903) (size!32033 (_keys!11530 thiss!1427)))))))

(declare-fun mapIsEmpty!38608 () Bool)

(declare-fun mapRes!38608 () Bool)

(assert (=> mapIsEmpty!38608 mapRes!38608))

(declare-fun b!1039312 () Bool)

(declare-fun res!693137 () Bool)

(assert (=> b!1039312 (=> res!693137 e!588228)))

(declare-datatypes ((List!21983 0))(
  ( (Nil!21980) (Cons!21979 (h!23183 (_ BitVec 64)) (t!31188 List!21983)) )
))
(declare-fun arrayNoDuplicates!0 (array!65459 (_ BitVec 32) List!21983) Bool)

(assert (=> b!1039312 (= res!693137 (not (arrayNoDuplicates!0 (_keys!11530 thiss!1427) #b00000000000000000000000000000000 Nil!21980)))))

(declare-fun e!588225 () Bool)

(declare-fun tp_is_empty!24697 () Bool)

(declare-fun e!588229 () Bool)

(declare-fun array_inv!24355 (array!65459) Bool)

(declare-fun array_inv!24356 (array!65461) Bool)

(assert (=> b!1039313 (= e!588225 (and tp!74111 tp_is_empty!24697 (array_inv!24355 (_keys!11530 thiss!1427)) (array_inv!24356 (_values!6347 thiss!1427)) e!588229))))

(declare-fun b!1039314 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65459 (_ BitVec 32)) Bool)

(assert (=> b!1039314 (= e!588228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11530 thiss!1427) (mask!30285 thiss!1427)))))

(declare-fun mapNonEmpty!38608 () Bool)

(declare-fun tp!74110 () Bool)

(declare-fun e!588226 () Bool)

(assert (=> mapNonEmpty!38608 (= mapRes!38608 (and tp!74110 e!588226))))

(declare-fun mapRest!38608 () (Array (_ BitVec 32) ValueCell!11645))

(declare-fun mapValue!38608 () ValueCell!11645)

(declare-fun mapKey!38608 () (_ BitVec 32))

(assert (=> mapNonEmpty!38608 (= (arr!31501 (_values!6347 thiss!1427)) (store mapRest!38608 mapKey!38608 mapValue!38608))))

(declare-fun b!1039316 () Bool)

(declare-fun e!588227 () Bool)

(assert (=> b!1039316 (= e!588222 e!588227)))

(declare-fun res!693141 () Bool)

(assert (=> b!1039316 (=> (not res!693141) (not e!588227))))

(get-info :version)

(assert (=> b!1039316 (= res!693141 ((_ is Found!9779) lt!457903))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65459 (_ BitVec 32)) SeekEntryResult!9779)

(assert (=> b!1039316 (= lt!457903 (seekEntry!0 key!909 (_keys!11530 thiss!1427) (mask!30285 thiss!1427)))))

(declare-fun b!1039317 () Bool)

(assert (=> b!1039317 (= e!588226 tp_is_empty!24697)))

(declare-fun b!1039318 () Bool)

(declare-fun e!588224 () Bool)

(assert (=> b!1039318 (= e!588229 (and e!588224 mapRes!38608))))

(declare-fun condMapEmpty!38608 () Bool)

(declare-fun mapDefault!38608 () ValueCell!11645)

(assert (=> b!1039318 (= condMapEmpty!38608 (= (arr!31501 (_values!6347 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11645)) mapDefault!38608)))))

(declare-fun b!1039319 () Bool)

(assert (=> b!1039319 (= e!588224 tp_is_empty!24697)))

(declare-fun res!693136 () Bool)

(assert (=> start!91006 (=> (not res!693136) (not e!588222))))

(declare-fun valid!2204 (LongMapFixedSize!5884) Bool)

(assert (=> start!91006 (= res!693136 (valid!2204 thiss!1427))))

(assert (=> start!91006 e!588222))

(assert (=> start!91006 e!588225))

(assert (=> start!91006 true))

(declare-fun b!1039315 () Bool)

(assert (=> b!1039315 (= e!588227 (not e!588228))))

(declare-fun res!693139 () Bool)

(assert (=> b!1039315 (=> res!693139 e!588228)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1039315 (= res!693139 (not (validMask!0 (mask!30285 thiss!1427))))))

(declare-fun lt!457902 () array!65459)

(assert (=> b!1039315 (arrayNoDuplicates!0 lt!457902 #b00000000000000000000000000000000 Nil!21980)))

(declare-datatypes ((Unit!33879 0))(
  ( (Unit!33880) )
))
(declare-fun lt!457901 () Unit!33879)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65459 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21983) Unit!33879)

(assert (=> b!1039315 (= lt!457901 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11530 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41488 lt!457903) #b00000000000000000000000000000000 Nil!21980))))

(declare-fun arrayCountValidKeys!0 (array!65459 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039315 (= (arrayCountValidKeys!0 lt!457902 #b00000000000000000000000000000000 (size!32033 (_keys!11530 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11530 thiss!1427) #b00000000000000000000000000000000 (size!32033 (_keys!11530 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1039315 (= lt!457902 (array!65460 (store (arr!31500 (_keys!11530 thiss!1427)) (index!41488 lt!457903) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32033 (_keys!11530 thiss!1427))))))

(declare-fun lt!457904 () Unit!33879)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65459 (_ BitVec 32) (_ BitVec 64)) Unit!33879)

(assert (=> b!1039315 (= lt!457904 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11530 thiss!1427) (index!41488 lt!457903) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!91006 res!693136) b!1039309))

(assert (= (and b!1039309 res!693138) b!1039316))

(assert (= (and b!1039316 res!693141) b!1039315))

(assert (= (and b!1039315 (not res!693139)) b!1039311))

(assert (= (and b!1039311 (not res!693135)) b!1039310))

(assert (= (and b!1039310 (not res!693140)) b!1039312))

(assert (= (and b!1039312 (not res!693137)) b!1039314))

(assert (= (and b!1039318 condMapEmpty!38608) mapIsEmpty!38608))

(assert (= (and b!1039318 (not condMapEmpty!38608)) mapNonEmpty!38608))

(assert (= (and mapNonEmpty!38608 ((_ is ValueCellFull!11645) mapValue!38608)) b!1039317))

(assert (= (and b!1039318 ((_ is ValueCellFull!11645) mapDefault!38608)) b!1039319))

(assert (= b!1039313 b!1039318))

(assert (= start!91006 b!1039313))

(declare-fun m!958537 () Bool)

(assert (=> b!1039313 m!958537))

(declare-fun m!958539 () Bool)

(assert (=> b!1039313 m!958539))

(declare-fun m!958541 () Bool)

(assert (=> b!1039310 m!958541))

(assert (=> b!1039310 m!958541))

(declare-fun m!958543 () Bool)

(assert (=> b!1039310 m!958543))

(declare-fun m!958545 () Bool)

(assert (=> b!1039315 m!958545))

(declare-fun m!958547 () Bool)

(assert (=> b!1039315 m!958547))

(declare-fun m!958549 () Bool)

(assert (=> b!1039315 m!958549))

(declare-fun m!958551 () Bool)

(assert (=> b!1039315 m!958551))

(declare-fun m!958553 () Bool)

(assert (=> b!1039315 m!958553))

(declare-fun m!958555 () Bool)

(assert (=> b!1039315 m!958555))

(declare-fun m!958557 () Bool)

(assert (=> b!1039315 m!958557))

(declare-fun m!958559 () Bool)

(assert (=> b!1039312 m!958559))

(declare-fun m!958561 () Bool)

(assert (=> mapNonEmpty!38608 m!958561))

(declare-fun m!958563 () Bool)

(assert (=> b!1039314 m!958563))

(declare-fun m!958565 () Bool)

(assert (=> start!91006 m!958565))

(declare-fun m!958567 () Bool)

(assert (=> b!1039316 m!958567))

(check-sat (not b!1039315) b_and!33483 (not b!1039312) (not b_next!20977) (not mapNonEmpty!38608) (not b!1039310) (not b!1039316) (not b!1039313) tp_is_empty!24697 (not start!91006) (not b!1039314))
(check-sat b_and!33483 (not b_next!20977))
(get-model)

(declare-fun d!125357 () Bool)

(assert (=> d!125357 (= (validKeyInArray!0 (select (arr!31500 (_keys!11530 thiss!1427)) (index!41488 lt!457903))) (and (not (= (select (arr!31500 (_keys!11530 thiss!1427)) (index!41488 lt!457903)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31500 (_keys!11530 thiss!1427)) (index!41488 lt!457903)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1039310 d!125357))

(declare-fun d!125359 () Bool)

(declare-fun res!693189 () Bool)

(declare-fun e!588284 () Bool)

(assert (=> d!125359 (=> res!693189 e!588284)))

(assert (=> d!125359 (= res!693189 (bvsge #b00000000000000000000000000000000 (size!32033 (_keys!11530 thiss!1427))))))

(assert (=> d!125359 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11530 thiss!1427) (mask!30285 thiss!1427)) e!588284)))

(declare-fun b!1039394 () Bool)

(declare-fun e!588285 () Bool)

(declare-fun call!43973 () Bool)

(assert (=> b!1039394 (= e!588285 call!43973)))

(declare-fun b!1039395 () Bool)

(declare-fun e!588286 () Bool)

(assert (=> b!1039395 (= e!588285 e!588286)))

(declare-fun lt!457935 () (_ BitVec 64))

(assert (=> b!1039395 (= lt!457935 (select (arr!31500 (_keys!11530 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!457937 () Unit!33879)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65459 (_ BitVec 64) (_ BitVec 32)) Unit!33879)

(assert (=> b!1039395 (= lt!457937 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11530 thiss!1427) lt!457935 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1039395 (arrayContainsKey!0 (_keys!11530 thiss!1427) lt!457935 #b00000000000000000000000000000000)))

(declare-fun lt!457936 () Unit!33879)

(assert (=> b!1039395 (= lt!457936 lt!457937)))

(declare-fun res!693188 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65459 (_ BitVec 32)) SeekEntryResult!9779)

(assert (=> b!1039395 (= res!693188 (= (seekEntryOrOpen!0 (select (arr!31500 (_keys!11530 thiss!1427)) #b00000000000000000000000000000000) (_keys!11530 thiss!1427) (mask!30285 thiss!1427)) (Found!9779 #b00000000000000000000000000000000)))))

(assert (=> b!1039395 (=> (not res!693188) (not e!588286))))

(declare-fun b!1039396 () Bool)

(assert (=> b!1039396 (= e!588284 e!588285)))

(declare-fun c!105313 () Bool)

(assert (=> b!1039396 (= c!105313 (validKeyInArray!0 (select (arr!31500 (_keys!11530 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43970 () Bool)

(assert (=> bm!43970 (= call!43973 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11530 thiss!1427) (mask!30285 thiss!1427)))))

(declare-fun b!1039397 () Bool)

(assert (=> b!1039397 (= e!588286 call!43973)))

(assert (= (and d!125359 (not res!693189)) b!1039396))

(assert (= (and b!1039396 c!105313) b!1039395))

(assert (= (and b!1039396 (not c!105313)) b!1039394))

(assert (= (and b!1039395 res!693188) b!1039397))

(assert (= (or b!1039397 b!1039394) bm!43970))

(declare-fun m!958633 () Bool)

(assert (=> b!1039395 m!958633))

(declare-fun m!958635 () Bool)

(assert (=> b!1039395 m!958635))

(declare-fun m!958637 () Bool)

(assert (=> b!1039395 m!958637))

(assert (=> b!1039395 m!958633))

(declare-fun m!958639 () Bool)

(assert (=> b!1039395 m!958639))

(assert (=> b!1039396 m!958633))

(assert (=> b!1039396 m!958633))

(declare-fun m!958641 () Bool)

(assert (=> b!1039396 m!958641))

(declare-fun m!958643 () Bool)

(assert (=> bm!43970 m!958643))

(assert (=> b!1039314 d!125359))

(declare-fun b!1039408 () Bool)

(declare-fun e!588298 () Bool)

(declare-fun e!588295 () Bool)

(assert (=> b!1039408 (= e!588298 e!588295)))

(declare-fun c!105316 () Bool)

(assert (=> b!1039408 (= c!105316 (validKeyInArray!0 (select (arr!31500 lt!457902) #b00000000000000000000000000000000)))))

(declare-fun b!1039409 () Bool)

(declare-fun e!588297 () Bool)

(declare-fun contains!6024 (List!21983 (_ BitVec 64)) Bool)

(assert (=> b!1039409 (= e!588297 (contains!6024 Nil!21980 (select (arr!31500 lt!457902) #b00000000000000000000000000000000)))))

(declare-fun b!1039410 () Bool)

(declare-fun call!43976 () Bool)

(assert (=> b!1039410 (= e!588295 call!43976)))

(declare-fun b!1039411 () Bool)

(declare-fun e!588296 () Bool)

(assert (=> b!1039411 (= e!588296 e!588298)))

(declare-fun res!693196 () Bool)

(assert (=> b!1039411 (=> (not res!693196) (not e!588298))))

(assert (=> b!1039411 (= res!693196 (not e!588297))))

(declare-fun res!693198 () Bool)

(assert (=> b!1039411 (=> (not res!693198) (not e!588297))))

(assert (=> b!1039411 (= res!693198 (validKeyInArray!0 (select (arr!31500 lt!457902) #b00000000000000000000000000000000)))))

(declare-fun d!125361 () Bool)

(declare-fun res!693197 () Bool)

(assert (=> d!125361 (=> res!693197 e!588296)))

(assert (=> d!125361 (= res!693197 (bvsge #b00000000000000000000000000000000 (size!32033 lt!457902)))))

(assert (=> d!125361 (= (arrayNoDuplicates!0 lt!457902 #b00000000000000000000000000000000 Nil!21980) e!588296)))

(declare-fun b!1039412 () Bool)

(assert (=> b!1039412 (= e!588295 call!43976)))

(declare-fun bm!43973 () Bool)

(assert (=> bm!43973 (= call!43976 (arrayNoDuplicates!0 lt!457902 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105316 (Cons!21979 (select (arr!31500 lt!457902) #b00000000000000000000000000000000) Nil!21980) Nil!21980)))))

(assert (= (and d!125361 (not res!693197)) b!1039411))

(assert (= (and b!1039411 res!693198) b!1039409))

(assert (= (and b!1039411 res!693196) b!1039408))

(assert (= (and b!1039408 c!105316) b!1039410))

(assert (= (and b!1039408 (not c!105316)) b!1039412))

(assert (= (or b!1039410 b!1039412) bm!43973))

(declare-fun m!958645 () Bool)

(assert (=> b!1039408 m!958645))

(assert (=> b!1039408 m!958645))

(declare-fun m!958647 () Bool)

(assert (=> b!1039408 m!958647))

(assert (=> b!1039409 m!958645))

(assert (=> b!1039409 m!958645))

(declare-fun m!958649 () Bool)

(assert (=> b!1039409 m!958649))

(assert (=> b!1039411 m!958645))

(assert (=> b!1039411 m!958645))

(assert (=> b!1039411 m!958647))

(assert (=> bm!43973 m!958645))

(declare-fun m!958651 () Bool)

(assert (=> bm!43973 m!958651))

(assert (=> b!1039315 d!125361))

(declare-fun d!125363 () Bool)

(declare-fun e!588303 () Bool)

(assert (=> d!125363 e!588303))

(declare-fun res!693208 () Bool)

(assert (=> d!125363 (=> (not res!693208) (not e!588303))))

(assert (=> d!125363 (= res!693208 (and (bvsge (index!41488 lt!457903) #b00000000000000000000000000000000) (bvslt (index!41488 lt!457903) (size!32033 (_keys!11530 thiss!1427)))))))

(declare-fun lt!457940 () Unit!33879)

(declare-fun choose!82 (array!65459 (_ BitVec 32) (_ BitVec 64)) Unit!33879)

(assert (=> d!125363 (= lt!457940 (choose!82 (_keys!11530 thiss!1427) (index!41488 lt!457903) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588304 () Bool)

(assert (=> d!125363 e!588304))

(declare-fun res!693210 () Bool)

(assert (=> d!125363 (=> (not res!693210) (not e!588304))))

(assert (=> d!125363 (= res!693210 (and (bvsge (index!41488 lt!457903) #b00000000000000000000000000000000) (bvslt (index!41488 lt!457903) (size!32033 (_keys!11530 thiss!1427)))))))

(assert (=> d!125363 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11530 thiss!1427) (index!41488 lt!457903) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457940)))

(declare-fun b!1039422 () Bool)

(declare-fun res!693207 () Bool)

(assert (=> b!1039422 (=> (not res!693207) (not e!588304))))

(assert (=> b!1039422 (= res!693207 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1039424 () Bool)

(assert (=> b!1039424 (= e!588303 (= (arrayCountValidKeys!0 (array!65460 (store (arr!31500 (_keys!11530 thiss!1427)) (index!41488 lt!457903) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32033 (_keys!11530 thiss!1427))) #b00000000000000000000000000000000 (size!32033 (_keys!11530 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11530 thiss!1427) #b00000000000000000000000000000000 (size!32033 (_keys!11530 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1039421 () Bool)

(declare-fun res!693209 () Bool)

(assert (=> b!1039421 (=> (not res!693209) (not e!588304))))

(assert (=> b!1039421 (= res!693209 (validKeyInArray!0 (select (arr!31500 (_keys!11530 thiss!1427)) (index!41488 lt!457903))))))

(declare-fun b!1039423 () Bool)

(assert (=> b!1039423 (= e!588304 (bvslt (size!32033 (_keys!11530 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!125363 res!693210) b!1039421))

(assert (= (and b!1039421 res!693209) b!1039422))

(assert (= (and b!1039422 res!693207) b!1039423))

(assert (= (and d!125363 res!693208) b!1039424))

(declare-fun m!958653 () Bool)

(assert (=> d!125363 m!958653))

(declare-fun m!958655 () Bool)

(assert (=> b!1039422 m!958655))

(assert (=> b!1039424 m!958547))

(declare-fun m!958657 () Bool)

(assert (=> b!1039424 m!958657))

(assert (=> b!1039424 m!958549))

(assert (=> b!1039421 m!958541))

(assert (=> b!1039421 m!958541))

(assert (=> b!1039421 m!958543))

(assert (=> b!1039315 d!125363))

(declare-fun d!125365 () Bool)

(assert (=> d!125365 (= (validMask!0 (mask!30285 thiss!1427)) (and (or (= (mask!30285 thiss!1427) #b00000000000000000000000000000111) (= (mask!30285 thiss!1427) #b00000000000000000000000000001111) (= (mask!30285 thiss!1427) #b00000000000000000000000000011111) (= (mask!30285 thiss!1427) #b00000000000000000000000000111111) (= (mask!30285 thiss!1427) #b00000000000000000000000001111111) (= (mask!30285 thiss!1427) #b00000000000000000000000011111111) (= (mask!30285 thiss!1427) #b00000000000000000000000111111111) (= (mask!30285 thiss!1427) #b00000000000000000000001111111111) (= (mask!30285 thiss!1427) #b00000000000000000000011111111111) (= (mask!30285 thiss!1427) #b00000000000000000000111111111111) (= (mask!30285 thiss!1427) #b00000000000000000001111111111111) (= (mask!30285 thiss!1427) #b00000000000000000011111111111111) (= (mask!30285 thiss!1427) #b00000000000000000111111111111111) (= (mask!30285 thiss!1427) #b00000000000000001111111111111111) (= (mask!30285 thiss!1427) #b00000000000000011111111111111111) (= (mask!30285 thiss!1427) #b00000000000000111111111111111111) (= (mask!30285 thiss!1427) #b00000000000001111111111111111111) (= (mask!30285 thiss!1427) #b00000000000011111111111111111111) (= (mask!30285 thiss!1427) #b00000000000111111111111111111111) (= (mask!30285 thiss!1427) #b00000000001111111111111111111111) (= (mask!30285 thiss!1427) #b00000000011111111111111111111111) (= (mask!30285 thiss!1427) #b00000000111111111111111111111111) (= (mask!30285 thiss!1427) #b00000001111111111111111111111111) (= (mask!30285 thiss!1427) #b00000011111111111111111111111111) (= (mask!30285 thiss!1427) #b00000111111111111111111111111111) (= (mask!30285 thiss!1427) #b00001111111111111111111111111111) (= (mask!30285 thiss!1427) #b00011111111111111111111111111111) (= (mask!30285 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30285 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1039315 d!125365))

(declare-fun d!125367 () Bool)

(declare-fun e!588307 () Bool)

(assert (=> d!125367 e!588307))

(declare-fun res!693213 () Bool)

(assert (=> d!125367 (=> (not res!693213) (not e!588307))))

(assert (=> d!125367 (= res!693213 (and (bvsge (index!41488 lt!457903) #b00000000000000000000000000000000) (bvslt (index!41488 lt!457903) (size!32033 (_keys!11530 thiss!1427)))))))

(declare-fun lt!457943 () Unit!33879)

(declare-fun choose!53 (array!65459 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21983) Unit!33879)

(assert (=> d!125367 (= lt!457943 (choose!53 (_keys!11530 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41488 lt!457903) #b00000000000000000000000000000000 Nil!21980))))

(assert (=> d!125367 (bvslt (size!32033 (_keys!11530 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125367 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11530 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41488 lt!457903) #b00000000000000000000000000000000 Nil!21980) lt!457943)))

(declare-fun b!1039427 () Bool)

(assert (=> b!1039427 (= e!588307 (arrayNoDuplicates!0 (array!65460 (store (arr!31500 (_keys!11530 thiss!1427)) (index!41488 lt!457903) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32033 (_keys!11530 thiss!1427))) #b00000000000000000000000000000000 Nil!21980))))

(assert (= (and d!125367 res!693213) b!1039427))

(declare-fun m!958659 () Bool)

(assert (=> d!125367 m!958659))

(assert (=> b!1039427 m!958547))

(declare-fun m!958661 () Bool)

(assert (=> b!1039427 m!958661))

(assert (=> b!1039315 d!125367))

(declare-fun d!125369 () Bool)

(declare-fun lt!457946 () (_ BitVec 32))

(assert (=> d!125369 (and (bvsge lt!457946 #b00000000000000000000000000000000) (bvsle lt!457946 (bvsub (size!32033 (_keys!11530 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!588312 () (_ BitVec 32))

(assert (=> d!125369 (= lt!457946 e!588312)))

(declare-fun c!105321 () Bool)

(assert (=> d!125369 (= c!105321 (bvsge #b00000000000000000000000000000000 (size!32033 (_keys!11530 thiss!1427))))))

(assert (=> d!125369 (and (bvsle #b00000000000000000000000000000000 (size!32033 (_keys!11530 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32033 (_keys!11530 thiss!1427)) (size!32033 (_keys!11530 thiss!1427))))))

(assert (=> d!125369 (= (arrayCountValidKeys!0 (_keys!11530 thiss!1427) #b00000000000000000000000000000000 (size!32033 (_keys!11530 thiss!1427))) lt!457946)))

(declare-fun b!1039436 () Bool)

(declare-fun e!588313 () (_ BitVec 32))

(assert (=> b!1039436 (= e!588312 e!588313)))

(declare-fun c!105322 () Bool)

(assert (=> b!1039436 (= c!105322 (validKeyInArray!0 (select (arr!31500 (_keys!11530 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1039437 () Bool)

(declare-fun call!43979 () (_ BitVec 32))

(assert (=> b!1039437 (= e!588313 call!43979)))

(declare-fun b!1039438 () Bool)

(assert (=> b!1039438 (= e!588312 #b00000000000000000000000000000000)))

(declare-fun bm!43976 () Bool)

(assert (=> bm!43976 (= call!43979 (arrayCountValidKeys!0 (_keys!11530 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32033 (_keys!11530 thiss!1427))))))

(declare-fun b!1039439 () Bool)

(assert (=> b!1039439 (= e!588313 (bvadd #b00000000000000000000000000000001 call!43979))))

(assert (= (and d!125369 c!105321) b!1039438))

(assert (= (and d!125369 (not c!105321)) b!1039436))

(assert (= (and b!1039436 c!105322) b!1039439))

(assert (= (and b!1039436 (not c!105322)) b!1039437))

(assert (= (or b!1039439 b!1039437) bm!43976))

(assert (=> b!1039436 m!958633))

(assert (=> b!1039436 m!958633))

(assert (=> b!1039436 m!958641))

(declare-fun m!958663 () Bool)

(assert (=> bm!43976 m!958663))

(assert (=> b!1039315 d!125369))

(declare-fun d!125371 () Bool)

(declare-fun lt!457947 () (_ BitVec 32))

(assert (=> d!125371 (and (bvsge lt!457947 #b00000000000000000000000000000000) (bvsle lt!457947 (bvsub (size!32033 lt!457902) #b00000000000000000000000000000000)))))

(declare-fun e!588314 () (_ BitVec 32))

(assert (=> d!125371 (= lt!457947 e!588314)))

(declare-fun c!105323 () Bool)

(assert (=> d!125371 (= c!105323 (bvsge #b00000000000000000000000000000000 (size!32033 (_keys!11530 thiss!1427))))))

(assert (=> d!125371 (and (bvsle #b00000000000000000000000000000000 (size!32033 (_keys!11530 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32033 (_keys!11530 thiss!1427)) (size!32033 lt!457902)))))

(assert (=> d!125371 (= (arrayCountValidKeys!0 lt!457902 #b00000000000000000000000000000000 (size!32033 (_keys!11530 thiss!1427))) lt!457947)))

(declare-fun b!1039440 () Bool)

(declare-fun e!588315 () (_ BitVec 32))

(assert (=> b!1039440 (= e!588314 e!588315)))

(declare-fun c!105324 () Bool)

(assert (=> b!1039440 (= c!105324 (validKeyInArray!0 (select (arr!31500 lt!457902) #b00000000000000000000000000000000)))))

(declare-fun b!1039441 () Bool)

(declare-fun call!43980 () (_ BitVec 32))

(assert (=> b!1039441 (= e!588315 call!43980)))

(declare-fun b!1039442 () Bool)

(assert (=> b!1039442 (= e!588314 #b00000000000000000000000000000000)))

(declare-fun bm!43977 () Bool)

(assert (=> bm!43977 (= call!43980 (arrayCountValidKeys!0 lt!457902 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32033 (_keys!11530 thiss!1427))))))

(declare-fun b!1039443 () Bool)

(assert (=> b!1039443 (= e!588315 (bvadd #b00000000000000000000000000000001 call!43980))))

(assert (= (and d!125371 c!105323) b!1039442))

(assert (= (and d!125371 (not c!105323)) b!1039440))

(assert (= (and b!1039440 c!105324) b!1039443))

(assert (= (and b!1039440 (not c!105324)) b!1039441))

(assert (= (or b!1039443 b!1039441) bm!43977))

(assert (=> b!1039440 m!958645))

(assert (=> b!1039440 m!958645))

(assert (=> b!1039440 m!958647))

(declare-fun m!958665 () Bool)

(assert (=> bm!43977 m!958665))

(assert (=> b!1039315 d!125371))

(declare-fun d!125373 () Bool)

(declare-fun res!693220 () Bool)

(declare-fun e!588318 () Bool)

(assert (=> d!125373 (=> (not res!693220) (not e!588318))))

(declare-fun simpleValid!428 (LongMapFixedSize!5884) Bool)

(assert (=> d!125373 (= res!693220 (simpleValid!428 thiss!1427))))

(assert (=> d!125373 (= (valid!2204 thiss!1427) e!588318)))

(declare-fun b!1039450 () Bool)

(declare-fun res!693221 () Bool)

(assert (=> b!1039450 (=> (not res!693221) (not e!588318))))

(assert (=> b!1039450 (= res!693221 (= (arrayCountValidKeys!0 (_keys!11530 thiss!1427) #b00000000000000000000000000000000 (size!32033 (_keys!11530 thiss!1427))) (_size!2997 thiss!1427)))))

(declare-fun b!1039451 () Bool)

(declare-fun res!693222 () Bool)

(assert (=> b!1039451 (=> (not res!693222) (not e!588318))))

(assert (=> b!1039451 (= res!693222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11530 thiss!1427) (mask!30285 thiss!1427)))))

(declare-fun b!1039452 () Bool)

(assert (=> b!1039452 (= e!588318 (arrayNoDuplicates!0 (_keys!11530 thiss!1427) #b00000000000000000000000000000000 Nil!21980))))

(assert (= (and d!125373 res!693220) b!1039450))

(assert (= (and b!1039450 res!693221) b!1039451))

(assert (= (and b!1039451 res!693222) b!1039452))

(declare-fun m!958667 () Bool)

(assert (=> d!125373 m!958667))

(assert (=> b!1039450 m!958549))

(assert (=> b!1039451 m!958563))

(assert (=> b!1039452 m!958559))

(assert (=> start!91006 d!125373))

(declare-fun b!1039453 () Bool)

(declare-fun e!588322 () Bool)

(declare-fun e!588319 () Bool)

(assert (=> b!1039453 (= e!588322 e!588319)))

(declare-fun c!105325 () Bool)

(assert (=> b!1039453 (= c!105325 (validKeyInArray!0 (select (arr!31500 (_keys!11530 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1039454 () Bool)

(declare-fun e!588321 () Bool)

(assert (=> b!1039454 (= e!588321 (contains!6024 Nil!21980 (select (arr!31500 (_keys!11530 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1039455 () Bool)

(declare-fun call!43981 () Bool)

(assert (=> b!1039455 (= e!588319 call!43981)))

(declare-fun b!1039456 () Bool)

(declare-fun e!588320 () Bool)

(assert (=> b!1039456 (= e!588320 e!588322)))

(declare-fun res!693223 () Bool)

(assert (=> b!1039456 (=> (not res!693223) (not e!588322))))

(assert (=> b!1039456 (= res!693223 (not e!588321))))

(declare-fun res!693225 () Bool)

(assert (=> b!1039456 (=> (not res!693225) (not e!588321))))

(assert (=> b!1039456 (= res!693225 (validKeyInArray!0 (select (arr!31500 (_keys!11530 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125375 () Bool)

(declare-fun res!693224 () Bool)

(assert (=> d!125375 (=> res!693224 e!588320)))

(assert (=> d!125375 (= res!693224 (bvsge #b00000000000000000000000000000000 (size!32033 (_keys!11530 thiss!1427))))))

(assert (=> d!125375 (= (arrayNoDuplicates!0 (_keys!11530 thiss!1427) #b00000000000000000000000000000000 Nil!21980) e!588320)))

(declare-fun b!1039457 () Bool)

(assert (=> b!1039457 (= e!588319 call!43981)))

(declare-fun bm!43978 () Bool)

(assert (=> bm!43978 (= call!43981 (arrayNoDuplicates!0 (_keys!11530 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105325 (Cons!21979 (select (arr!31500 (_keys!11530 thiss!1427)) #b00000000000000000000000000000000) Nil!21980) Nil!21980)))))

(assert (= (and d!125375 (not res!693224)) b!1039456))

(assert (= (and b!1039456 res!693225) b!1039454))

(assert (= (and b!1039456 res!693223) b!1039453))

(assert (= (and b!1039453 c!105325) b!1039455))

(assert (= (and b!1039453 (not c!105325)) b!1039457))

(assert (= (or b!1039455 b!1039457) bm!43978))

(assert (=> b!1039453 m!958633))

(assert (=> b!1039453 m!958633))

(assert (=> b!1039453 m!958641))

(assert (=> b!1039454 m!958633))

(assert (=> b!1039454 m!958633))

(declare-fun m!958669 () Bool)

(assert (=> b!1039454 m!958669))

(assert (=> b!1039456 m!958633))

(assert (=> b!1039456 m!958633))

(assert (=> b!1039456 m!958641))

(assert (=> bm!43978 m!958633))

(declare-fun m!958671 () Bool)

(assert (=> bm!43978 m!958671))

(assert (=> b!1039312 d!125375))

(declare-fun b!1039470 () Bool)

(declare-fun c!105332 () Bool)

(declare-fun lt!457957 () (_ BitVec 64))

(assert (=> b!1039470 (= c!105332 (= lt!457957 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588331 () SeekEntryResult!9779)

(declare-fun e!588329 () SeekEntryResult!9779)

(assert (=> b!1039470 (= e!588331 e!588329)))

(declare-fun b!1039471 () Bool)

(declare-fun e!588330 () SeekEntryResult!9779)

(assert (=> b!1039471 (= e!588330 Undefined!9779)))

(declare-fun b!1039472 () Bool)

(declare-fun lt!457958 () SeekEntryResult!9779)

(assert (=> b!1039472 (= e!588329 (MissingZero!9779 (index!41489 lt!457958)))))

(declare-fun b!1039473 () Bool)

(declare-fun lt!457956 () SeekEntryResult!9779)

(assert (=> b!1039473 (= e!588329 (ite ((_ is MissingVacant!9779) lt!457956) (MissingZero!9779 (index!41490 lt!457956)) lt!457956))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65459 (_ BitVec 32)) SeekEntryResult!9779)

(assert (=> b!1039473 (= lt!457956 (seekKeyOrZeroReturnVacant!0 (x!92768 lt!457958) (index!41489 lt!457958) (index!41489 lt!457958) key!909 (_keys!11530 thiss!1427) (mask!30285 thiss!1427)))))

(declare-fun d!125377 () Bool)

(declare-fun lt!457959 () SeekEntryResult!9779)

(assert (=> d!125377 (and (or ((_ is MissingVacant!9779) lt!457959) (not ((_ is Found!9779) lt!457959)) (and (bvsge (index!41488 lt!457959) #b00000000000000000000000000000000) (bvslt (index!41488 lt!457959) (size!32033 (_keys!11530 thiss!1427))))) (not ((_ is MissingVacant!9779) lt!457959)) (or (not ((_ is Found!9779) lt!457959)) (= (select (arr!31500 (_keys!11530 thiss!1427)) (index!41488 lt!457959)) key!909)))))

(assert (=> d!125377 (= lt!457959 e!588330)))

(declare-fun c!105334 () Bool)

(assert (=> d!125377 (= c!105334 (and ((_ is Intermediate!9779) lt!457958) (undefined!10591 lt!457958)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65459 (_ BitVec 32)) SeekEntryResult!9779)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125377 (= lt!457958 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30285 thiss!1427)) key!909 (_keys!11530 thiss!1427) (mask!30285 thiss!1427)))))

(assert (=> d!125377 (validMask!0 (mask!30285 thiss!1427))))

(assert (=> d!125377 (= (seekEntry!0 key!909 (_keys!11530 thiss!1427) (mask!30285 thiss!1427)) lt!457959)))

(declare-fun b!1039474 () Bool)

(assert (=> b!1039474 (= e!588330 e!588331)))

(assert (=> b!1039474 (= lt!457957 (select (arr!31500 (_keys!11530 thiss!1427)) (index!41489 lt!457958)))))

(declare-fun c!105333 () Bool)

(assert (=> b!1039474 (= c!105333 (= lt!457957 key!909))))

(declare-fun b!1039475 () Bool)

(assert (=> b!1039475 (= e!588331 (Found!9779 (index!41489 lt!457958)))))

(assert (= (and d!125377 c!105334) b!1039471))

(assert (= (and d!125377 (not c!105334)) b!1039474))

(assert (= (and b!1039474 c!105333) b!1039475))

(assert (= (and b!1039474 (not c!105333)) b!1039470))

(assert (= (and b!1039470 c!105332) b!1039472))

(assert (= (and b!1039470 (not c!105332)) b!1039473))

(declare-fun m!958673 () Bool)

(assert (=> b!1039473 m!958673))

(declare-fun m!958675 () Bool)

(assert (=> d!125377 m!958675))

(declare-fun m!958677 () Bool)

(assert (=> d!125377 m!958677))

(assert (=> d!125377 m!958677))

(declare-fun m!958679 () Bool)

(assert (=> d!125377 m!958679))

(assert (=> d!125377 m!958557))

(declare-fun m!958681 () Bool)

(assert (=> b!1039474 m!958681))

(assert (=> b!1039316 d!125377))

(declare-fun d!125379 () Bool)

(assert (=> d!125379 (= (array_inv!24355 (_keys!11530 thiss!1427)) (bvsge (size!32033 (_keys!11530 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039313 d!125379))

(declare-fun d!125381 () Bool)

(assert (=> d!125381 (= (array_inv!24356 (_values!6347 thiss!1427)) (bvsge (size!32034 (_values!6347 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039313 d!125381))

(declare-fun b!1039482 () Bool)

(declare-fun e!588337 () Bool)

(assert (=> b!1039482 (= e!588337 tp_is_empty!24697)))

(declare-fun mapIsEmpty!38617 () Bool)

(declare-fun mapRes!38617 () Bool)

(assert (=> mapIsEmpty!38617 mapRes!38617))

(declare-fun mapNonEmpty!38617 () Bool)

(declare-fun tp!74126 () Bool)

(assert (=> mapNonEmpty!38617 (= mapRes!38617 (and tp!74126 e!588337))))

(declare-fun mapValue!38617 () ValueCell!11645)

(declare-fun mapKey!38617 () (_ BitVec 32))

(declare-fun mapRest!38617 () (Array (_ BitVec 32) ValueCell!11645))

(assert (=> mapNonEmpty!38617 (= mapRest!38608 (store mapRest!38617 mapKey!38617 mapValue!38617))))

(declare-fun condMapEmpty!38617 () Bool)

(declare-fun mapDefault!38617 () ValueCell!11645)

(assert (=> mapNonEmpty!38608 (= condMapEmpty!38617 (= mapRest!38608 ((as const (Array (_ BitVec 32) ValueCell!11645)) mapDefault!38617)))))

(declare-fun e!588336 () Bool)

(assert (=> mapNonEmpty!38608 (= tp!74110 (and e!588336 mapRes!38617))))

(declare-fun b!1039483 () Bool)

(assert (=> b!1039483 (= e!588336 tp_is_empty!24697)))

(assert (= (and mapNonEmpty!38608 condMapEmpty!38617) mapIsEmpty!38617))

(assert (= (and mapNonEmpty!38608 (not condMapEmpty!38617)) mapNonEmpty!38617))

(assert (= (and mapNonEmpty!38617 ((_ is ValueCellFull!11645) mapValue!38617)) b!1039482))

(assert (= (and mapNonEmpty!38608 ((_ is ValueCellFull!11645) mapDefault!38617)) b!1039483))

(declare-fun m!958683 () Bool)

(assert (=> mapNonEmpty!38617 m!958683))

(check-sat (not b!1039473) b_and!33483 (not b!1039396) (not b!1039427) (not mapNonEmpty!38617) (not b!1039452) (not d!125373) (not b!1039408) (not b!1039454) (not b!1039422) (not bm!43976) (not bm!43970) (not b_next!20977) (not d!125377) (not d!125367) (not b!1039436) (not b!1039450) (not b!1039424) (not b!1039456) (not b!1039411) (not bm!43977) (not b!1039409) (not b!1039440) tp_is_empty!24697 (not b!1039395) (not bm!43973) (not b!1039453) (not bm!43978) (not b!1039451) (not b!1039421) (not d!125363))
(check-sat b_and!33483 (not b_next!20977))
