; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17128 () Bool)

(assert start!17128)

(declare-fun b!172223 () Bool)

(declare-fun b_free!4243 () Bool)

(declare-fun b_next!4243 () Bool)

(assert (=> b!172223 (= b_free!4243 (not b_next!4243))))

(declare-fun tp!15368 () Bool)

(declare-fun b_and!10697 () Bool)

(assert (=> b!172223 (= tp!15368 b_and!10697)))

(declare-fun b!172220 () Bool)

(declare-fun res!81776 () Bool)

(declare-fun e!113657 () Bool)

(assert (=> b!172220 (=> (not res!81776) (not e!113657))))

(declare-datatypes ((V!5001 0))(
  ( (V!5002 (val!2052 Int)) )
))
(declare-datatypes ((ValueCell!1664 0))(
  ( (ValueCellFull!1664 (v!3921 V!5001)) (EmptyCell!1664) )
))
(declare-datatypes ((array!7133 0))(
  ( (array!7134 (arr!3392 (Array (_ BitVec 32) (_ BitVec 64))) (size!3687 (_ BitVec 32))) )
))
(declare-datatypes ((array!7135 0))(
  ( (array!7136 (arr!3393 (Array (_ BitVec 32) ValueCell!1664)) (size!3688 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2236 0))(
  ( (LongMapFixedSize!2237 (defaultEntry!3564 Int) (mask!8401 (_ BitVec 32)) (extraKeys!3303 (_ BitVec 32)) (zeroValue!3405 V!5001) (minValue!3407 V!5001) (_size!1167 (_ BitVec 32)) (_keys!5399 array!7133) (_values!3547 array!7135) (_vacant!1167 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2236)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172220 (= res!81776 (validMask!0 (mask!8401 thiss!1248)))))

(declare-fun b!172222 () Bool)

(declare-fun e!113661 () Bool)

(declare-fun tp_is_empty!4015 () Bool)

(assert (=> b!172222 (= e!113661 tp_is_empty!4015)))

(declare-fun mapIsEmpty!6824 () Bool)

(declare-fun mapRes!6824 () Bool)

(assert (=> mapIsEmpty!6824 mapRes!6824))

(declare-fun e!113656 () Bool)

(declare-fun e!113658 () Bool)

(declare-fun array_inv!2183 (array!7133) Bool)

(declare-fun array_inv!2184 (array!7135) Bool)

(assert (=> b!172223 (= e!113658 (and tp!15368 tp_is_empty!4015 (array_inv!2183 (_keys!5399 thiss!1248)) (array_inv!2184 (_values!3547 thiss!1248)) e!113656))))

(declare-fun res!81777 () Bool)

(assert (=> start!17128 (=> (not res!81777) (not e!113657))))

(declare-fun valid!967 (LongMapFixedSize!2236) Bool)

(assert (=> start!17128 (= res!81777 (valid!967 thiss!1248))))

(assert (=> start!17128 e!113657))

(assert (=> start!17128 e!113658))

(assert (=> start!17128 true))

(declare-fun b!172221 () Bool)

(assert (=> b!172221 (= e!113656 (and e!113661 mapRes!6824))))

(declare-fun condMapEmpty!6824 () Bool)

(declare-fun mapDefault!6824 () ValueCell!1664)

(assert (=> b!172221 (= condMapEmpty!6824 (= (arr!3393 (_values!3547 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1664)) mapDefault!6824)))))

(declare-fun mapNonEmpty!6824 () Bool)

(declare-fun tp!15367 () Bool)

(declare-fun e!113659 () Bool)

(assert (=> mapNonEmpty!6824 (= mapRes!6824 (and tp!15367 e!113659))))

(declare-fun mapValue!6824 () ValueCell!1664)

(declare-fun mapRest!6824 () (Array (_ BitVec 32) ValueCell!1664))

(declare-fun mapKey!6824 () (_ BitVec 32))

(assert (=> mapNonEmpty!6824 (= (arr!3393 (_values!3547 thiss!1248)) (store mapRest!6824 mapKey!6824 mapValue!6824))))

(declare-fun b!172224 () Bool)

(assert (=> b!172224 (= e!113657 (not (= (size!3688 (_values!3547 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8401 thiss!1248)))))))

(declare-fun b!172225 () Bool)

(assert (=> b!172225 (= e!113659 tp_is_empty!4015)))

(declare-fun b!172226 () Bool)

(declare-fun res!81775 () Bool)

(assert (=> b!172226 (=> (not res!81775) (not e!113657))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172226 (= res!81775 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!17128 res!81777) b!172226))

(assert (= (and b!172226 res!81775) b!172220))

(assert (= (and b!172220 res!81776) b!172224))

(assert (= (and b!172221 condMapEmpty!6824) mapIsEmpty!6824))

(assert (= (and b!172221 (not condMapEmpty!6824)) mapNonEmpty!6824))

(get-info :version)

(assert (= (and mapNonEmpty!6824 ((_ is ValueCellFull!1664) mapValue!6824)) b!172225))

(assert (= (and b!172221 ((_ is ValueCellFull!1664) mapDefault!6824)) b!172222))

(assert (= b!172223 b!172221))

(assert (= start!17128 b!172223))

(declare-fun m!201287 () Bool)

(assert (=> b!172220 m!201287))

(declare-fun m!201289 () Bool)

(assert (=> b!172223 m!201289))

(declare-fun m!201291 () Bool)

(assert (=> b!172223 m!201291))

(declare-fun m!201293 () Bool)

(assert (=> start!17128 m!201293))

(declare-fun m!201295 () Bool)

(assert (=> mapNonEmpty!6824 m!201295))

(check-sat tp_is_empty!4015 (not mapNonEmpty!6824) (not b!172220) (not b!172223) b_and!10697 (not b_next!4243) (not start!17128))
(check-sat b_and!10697 (not b_next!4243))
(get-model)

(declare-fun d!52547 () Bool)

(assert (=> d!52547 (= (array_inv!2183 (_keys!5399 thiss!1248)) (bvsge (size!3687 (_keys!5399 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172223 d!52547))

(declare-fun d!52549 () Bool)

(assert (=> d!52549 (= (array_inv!2184 (_values!3547 thiss!1248)) (bvsge (size!3688 (_values!3547 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172223 d!52549))

(declare-fun d!52551 () Bool)

(assert (=> d!52551 (= (validMask!0 (mask!8401 thiss!1248)) (and (or (= (mask!8401 thiss!1248) #b00000000000000000000000000000111) (= (mask!8401 thiss!1248) #b00000000000000000000000000001111) (= (mask!8401 thiss!1248) #b00000000000000000000000000011111) (= (mask!8401 thiss!1248) #b00000000000000000000000000111111) (= (mask!8401 thiss!1248) #b00000000000000000000000001111111) (= (mask!8401 thiss!1248) #b00000000000000000000000011111111) (= (mask!8401 thiss!1248) #b00000000000000000000000111111111) (= (mask!8401 thiss!1248) #b00000000000000000000001111111111) (= (mask!8401 thiss!1248) #b00000000000000000000011111111111) (= (mask!8401 thiss!1248) #b00000000000000000000111111111111) (= (mask!8401 thiss!1248) #b00000000000000000001111111111111) (= (mask!8401 thiss!1248) #b00000000000000000011111111111111) (= (mask!8401 thiss!1248) #b00000000000000000111111111111111) (= (mask!8401 thiss!1248) #b00000000000000001111111111111111) (= (mask!8401 thiss!1248) #b00000000000000011111111111111111) (= (mask!8401 thiss!1248) #b00000000000000111111111111111111) (= (mask!8401 thiss!1248) #b00000000000001111111111111111111) (= (mask!8401 thiss!1248) #b00000000000011111111111111111111) (= (mask!8401 thiss!1248) #b00000000000111111111111111111111) (= (mask!8401 thiss!1248) #b00000000001111111111111111111111) (= (mask!8401 thiss!1248) #b00000000011111111111111111111111) (= (mask!8401 thiss!1248) #b00000000111111111111111111111111) (= (mask!8401 thiss!1248) #b00000001111111111111111111111111) (= (mask!8401 thiss!1248) #b00000011111111111111111111111111) (= (mask!8401 thiss!1248) #b00000111111111111111111111111111) (= (mask!8401 thiss!1248) #b00001111111111111111111111111111) (= (mask!8401 thiss!1248) #b00011111111111111111111111111111) (= (mask!8401 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8401 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!172220 d!52551))

(declare-fun d!52553 () Bool)

(declare-fun res!81802 () Bool)

(declare-fun e!113700 () Bool)

(assert (=> d!52553 (=> (not res!81802) (not e!113700))))

(declare-fun simpleValid!137 (LongMapFixedSize!2236) Bool)

(assert (=> d!52553 (= res!81802 (simpleValid!137 thiss!1248))))

(assert (=> d!52553 (= (valid!967 thiss!1248) e!113700)))

(declare-fun b!172275 () Bool)

(declare-fun res!81803 () Bool)

(assert (=> b!172275 (=> (not res!81803) (not e!113700))))

(declare-fun arrayCountValidKeys!0 (array!7133 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!172275 (= res!81803 (= (arrayCountValidKeys!0 (_keys!5399 thiss!1248) #b00000000000000000000000000000000 (size!3687 (_keys!5399 thiss!1248))) (_size!1167 thiss!1248)))))

(declare-fun b!172276 () Bool)

(declare-fun res!81804 () Bool)

(assert (=> b!172276 (=> (not res!81804) (not e!113700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7133 (_ BitVec 32)) Bool)

(assert (=> b!172276 (= res!81804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5399 thiss!1248) (mask!8401 thiss!1248)))))

(declare-fun b!172277 () Bool)

(declare-datatypes ((List!2180 0))(
  ( (Nil!2177) (Cons!2176 (h!2793 (_ BitVec 64)) (t!6979 List!2180)) )
))
(declare-fun arrayNoDuplicates!0 (array!7133 (_ BitVec 32) List!2180) Bool)

(assert (=> b!172277 (= e!113700 (arrayNoDuplicates!0 (_keys!5399 thiss!1248) #b00000000000000000000000000000000 Nil!2177))))

(assert (= (and d!52553 res!81802) b!172275))

(assert (= (and b!172275 res!81803) b!172276))

(assert (= (and b!172276 res!81804) b!172277))

(declare-fun m!201317 () Bool)

(assert (=> d!52553 m!201317))

(declare-fun m!201319 () Bool)

(assert (=> b!172275 m!201319))

(declare-fun m!201321 () Bool)

(assert (=> b!172276 m!201321))

(declare-fun m!201323 () Bool)

(assert (=> b!172277 m!201323))

(assert (=> start!17128 d!52553))

(declare-fun mapNonEmpty!6833 () Bool)

(declare-fun mapRes!6833 () Bool)

(declare-fun tp!15383 () Bool)

(declare-fun e!113705 () Bool)

(assert (=> mapNonEmpty!6833 (= mapRes!6833 (and tp!15383 e!113705))))

(declare-fun mapValue!6833 () ValueCell!1664)

(declare-fun mapKey!6833 () (_ BitVec 32))

(declare-fun mapRest!6833 () (Array (_ BitVec 32) ValueCell!1664))

(assert (=> mapNonEmpty!6833 (= mapRest!6824 (store mapRest!6833 mapKey!6833 mapValue!6833))))

(declare-fun mapIsEmpty!6833 () Bool)

(assert (=> mapIsEmpty!6833 mapRes!6833))

(declare-fun condMapEmpty!6833 () Bool)

(declare-fun mapDefault!6833 () ValueCell!1664)

(assert (=> mapNonEmpty!6824 (= condMapEmpty!6833 (= mapRest!6824 ((as const (Array (_ BitVec 32) ValueCell!1664)) mapDefault!6833)))))

(declare-fun e!113706 () Bool)

(assert (=> mapNonEmpty!6824 (= tp!15367 (and e!113706 mapRes!6833))))

(declare-fun b!172284 () Bool)

(assert (=> b!172284 (= e!113705 tp_is_empty!4015)))

(declare-fun b!172285 () Bool)

(assert (=> b!172285 (= e!113706 tp_is_empty!4015)))

(assert (= (and mapNonEmpty!6824 condMapEmpty!6833) mapIsEmpty!6833))

(assert (= (and mapNonEmpty!6824 (not condMapEmpty!6833)) mapNonEmpty!6833))

(assert (= (and mapNonEmpty!6833 ((_ is ValueCellFull!1664) mapValue!6833)) b!172284))

(assert (= (and mapNonEmpty!6824 ((_ is ValueCellFull!1664) mapDefault!6833)) b!172285))

(declare-fun m!201325 () Bool)

(assert (=> mapNonEmpty!6833 m!201325))

(check-sat (not b!172275) (not b!172276) tp_is_empty!4015 (not d!52553) (not mapNonEmpty!6833) b_and!10697 (not b_next!4243) (not b!172277))
(check-sat b_and!10697 (not b_next!4243))
(get-model)

(declare-fun b!172297 () Bool)

(declare-fun e!113709 () Bool)

(assert (=> b!172297 (= e!113709 (and (bvsge (extraKeys!3303 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3303 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1167 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!172294 () Bool)

(declare-fun res!81814 () Bool)

(assert (=> b!172294 (=> (not res!81814) (not e!113709))))

(assert (=> b!172294 (= res!81814 (and (= (size!3688 (_values!3547 thiss!1248)) (bvadd (mask!8401 thiss!1248) #b00000000000000000000000000000001)) (= (size!3687 (_keys!5399 thiss!1248)) (size!3688 (_values!3547 thiss!1248))) (bvsge (_size!1167 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1167 thiss!1248) (bvadd (mask!8401 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!172295 () Bool)

(declare-fun res!81813 () Bool)

(assert (=> b!172295 (=> (not res!81813) (not e!113709))))

(declare-fun size!3693 (LongMapFixedSize!2236) (_ BitVec 32))

(assert (=> b!172295 (= res!81813 (bvsge (size!3693 thiss!1248) (_size!1167 thiss!1248)))))

(declare-fun d!52555 () Bool)

(declare-fun res!81815 () Bool)

(assert (=> d!52555 (=> (not res!81815) (not e!113709))))

(assert (=> d!52555 (= res!81815 (validMask!0 (mask!8401 thiss!1248)))))

(assert (=> d!52555 (= (simpleValid!137 thiss!1248) e!113709)))

(declare-fun b!172296 () Bool)

(declare-fun res!81816 () Bool)

(assert (=> b!172296 (=> (not res!81816) (not e!113709))))

(assert (=> b!172296 (= res!81816 (= (size!3693 thiss!1248) (bvadd (_size!1167 thiss!1248) (bvsdiv (bvadd (extraKeys!3303 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!52555 res!81815) b!172294))

(assert (= (and b!172294 res!81814) b!172295))

(assert (= (and b!172295 res!81813) b!172296))

(assert (= (and b!172296 res!81816) b!172297))

(declare-fun m!201327 () Bool)

(assert (=> b!172295 m!201327))

(assert (=> d!52555 m!201287))

(assert (=> b!172296 m!201327))

(assert (=> d!52553 d!52555))

(declare-fun b!172306 () Bool)

(declare-fun e!113715 () (_ BitVec 32))

(declare-fun call!17503 () (_ BitVec 32))

(assert (=> b!172306 (= e!113715 (bvadd #b00000000000000000000000000000001 call!17503))))

(declare-fun d!52557 () Bool)

(declare-fun lt!85707 () (_ BitVec 32))

(assert (=> d!52557 (and (bvsge lt!85707 #b00000000000000000000000000000000) (bvsle lt!85707 (bvsub (size!3687 (_keys!5399 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!113714 () (_ BitVec 32))

(assert (=> d!52557 (= lt!85707 e!113714)))

(declare-fun c!30857 () Bool)

(assert (=> d!52557 (= c!30857 (bvsge #b00000000000000000000000000000000 (size!3687 (_keys!5399 thiss!1248))))))

(assert (=> d!52557 (and (bvsle #b00000000000000000000000000000000 (size!3687 (_keys!5399 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3687 (_keys!5399 thiss!1248)) (size!3687 (_keys!5399 thiss!1248))))))

(assert (=> d!52557 (= (arrayCountValidKeys!0 (_keys!5399 thiss!1248) #b00000000000000000000000000000000 (size!3687 (_keys!5399 thiss!1248))) lt!85707)))

(declare-fun b!172307 () Bool)

(assert (=> b!172307 (= e!113714 e!113715)))

(declare-fun c!30858 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!172307 (= c!30858 (validKeyInArray!0 (select (arr!3392 (_keys!5399 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172308 () Bool)

(assert (=> b!172308 (= e!113714 #b00000000000000000000000000000000)))

(declare-fun b!172309 () Bool)

(assert (=> b!172309 (= e!113715 call!17503)))

(declare-fun bm!17500 () Bool)

(assert (=> bm!17500 (= call!17503 (arrayCountValidKeys!0 (_keys!5399 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3687 (_keys!5399 thiss!1248))))))

(assert (= (and d!52557 c!30857) b!172308))

(assert (= (and d!52557 (not c!30857)) b!172307))

(assert (= (and b!172307 c!30858) b!172306))

(assert (= (and b!172307 (not c!30858)) b!172309))

(assert (= (or b!172306 b!172309) bm!17500))

(declare-fun m!201329 () Bool)

(assert (=> b!172307 m!201329))

(assert (=> b!172307 m!201329))

(declare-fun m!201331 () Bool)

(assert (=> b!172307 m!201331))

(declare-fun m!201333 () Bool)

(assert (=> bm!17500 m!201333))

(assert (=> b!172275 d!52557))

(declare-fun d!52559 () Bool)

(declare-fun res!81821 () Bool)

(declare-fun e!113723 () Bool)

(assert (=> d!52559 (=> res!81821 e!113723)))

(assert (=> d!52559 (= res!81821 (bvsge #b00000000000000000000000000000000 (size!3687 (_keys!5399 thiss!1248))))))

(assert (=> d!52559 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5399 thiss!1248) (mask!8401 thiss!1248)) e!113723)))

(declare-fun b!172318 () Bool)

(declare-fun e!113724 () Bool)

(declare-fun call!17506 () Bool)

(assert (=> b!172318 (= e!113724 call!17506)))

(declare-fun bm!17503 () Bool)

(assert (=> bm!17503 (= call!17506 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5399 thiss!1248) (mask!8401 thiss!1248)))))

(declare-fun b!172319 () Bool)

(declare-fun e!113722 () Bool)

(assert (=> b!172319 (= e!113722 call!17506)))

(declare-fun b!172320 () Bool)

(assert (=> b!172320 (= e!113723 e!113722)))

(declare-fun c!30861 () Bool)

(assert (=> b!172320 (= c!30861 (validKeyInArray!0 (select (arr!3392 (_keys!5399 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172321 () Bool)

(assert (=> b!172321 (= e!113722 e!113724)))

(declare-fun lt!85715 () (_ BitVec 64))

(assert (=> b!172321 (= lt!85715 (select (arr!3392 (_keys!5399 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5303 0))(
  ( (Unit!5304) )
))
(declare-fun lt!85714 () Unit!5303)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7133 (_ BitVec 64) (_ BitVec 32)) Unit!5303)

(assert (=> b!172321 (= lt!85714 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5399 thiss!1248) lt!85715 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!172321 (arrayContainsKey!0 (_keys!5399 thiss!1248) lt!85715 #b00000000000000000000000000000000)))

(declare-fun lt!85716 () Unit!5303)

(assert (=> b!172321 (= lt!85716 lt!85714)))

(declare-fun res!81822 () Bool)

(declare-datatypes ((SeekEntryResult!530 0))(
  ( (MissingZero!530 (index!4288 (_ BitVec 32))) (Found!530 (index!4289 (_ BitVec 32))) (Intermediate!530 (undefined!1342 Bool) (index!4290 (_ BitVec 32)) (x!19007 (_ BitVec 32))) (Undefined!530) (MissingVacant!530 (index!4291 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7133 (_ BitVec 32)) SeekEntryResult!530)

(assert (=> b!172321 (= res!81822 (= (seekEntryOrOpen!0 (select (arr!3392 (_keys!5399 thiss!1248)) #b00000000000000000000000000000000) (_keys!5399 thiss!1248) (mask!8401 thiss!1248)) (Found!530 #b00000000000000000000000000000000)))))

(assert (=> b!172321 (=> (not res!81822) (not e!113724))))

(assert (= (and d!52559 (not res!81821)) b!172320))

(assert (= (and b!172320 c!30861) b!172321))

(assert (= (and b!172320 (not c!30861)) b!172319))

(assert (= (and b!172321 res!81822) b!172318))

(assert (= (or b!172318 b!172319) bm!17503))

(declare-fun m!201335 () Bool)

(assert (=> bm!17503 m!201335))

(assert (=> b!172320 m!201329))

(assert (=> b!172320 m!201329))

(assert (=> b!172320 m!201331))

(assert (=> b!172321 m!201329))

(declare-fun m!201337 () Bool)

(assert (=> b!172321 m!201337))

(declare-fun m!201339 () Bool)

(assert (=> b!172321 m!201339))

(assert (=> b!172321 m!201329))

(declare-fun m!201341 () Bool)

(assert (=> b!172321 m!201341))

(assert (=> b!172276 d!52559))

(declare-fun b!172332 () Bool)

(declare-fun e!113733 () Bool)

(declare-fun e!113734 () Bool)

(assert (=> b!172332 (= e!113733 e!113734)))

(declare-fun res!81831 () Bool)

(assert (=> b!172332 (=> (not res!81831) (not e!113734))))

(declare-fun e!113735 () Bool)

(assert (=> b!172332 (= res!81831 (not e!113735))))

(declare-fun res!81829 () Bool)

(assert (=> b!172332 (=> (not res!81829) (not e!113735))))

(assert (=> b!172332 (= res!81829 (validKeyInArray!0 (select (arr!3392 (_keys!5399 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17506 () Bool)

(declare-fun call!17509 () Bool)

(declare-fun c!30864 () Bool)

(assert (=> bm!17506 (= call!17509 (arrayNoDuplicates!0 (_keys!5399 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30864 (Cons!2176 (select (arr!3392 (_keys!5399 thiss!1248)) #b00000000000000000000000000000000) Nil!2177) Nil!2177)))))

(declare-fun b!172333 () Bool)

(declare-fun e!113736 () Bool)

(assert (=> b!172333 (= e!113736 call!17509)))

(declare-fun b!172334 () Bool)

(assert (=> b!172334 (= e!113736 call!17509)))

(declare-fun b!172335 () Bool)

(declare-fun contains!1144 (List!2180 (_ BitVec 64)) Bool)

(assert (=> b!172335 (= e!113735 (contains!1144 Nil!2177 (select (arr!3392 (_keys!5399 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52561 () Bool)

(declare-fun res!81830 () Bool)

(assert (=> d!52561 (=> res!81830 e!113733)))

(assert (=> d!52561 (= res!81830 (bvsge #b00000000000000000000000000000000 (size!3687 (_keys!5399 thiss!1248))))))

(assert (=> d!52561 (= (arrayNoDuplicates!0 (_keys!5399 thiss!1248) #b00000000000000000000000000000000 Nil!2177) e!113733)))

(declare-fun b!172336 () Bool)

(assert (=> b!172336 (= e!113734 e!113736)))

(assert (=> b!172336 (= c!30864 (validKeyInArray!0 (select (arr!3392 (_keys!5399 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52561 (not res!81830)) b!172332))

(assert (= (and b!172332 res!81829) b!172335))

(assert (= (and b!172332 res!81831) b!172336))

(assert (= (and b!172336 c!30864) b!172334))

(assert (= (and b!172336 (not c!30864)) b!172333))

(assert (= (or b!172334 b!172333) bm!17506))

(assert (=> b!172332 m!201329))

(assert (=> b!172332 m!201329))

(assert (=> b!172332 m!201331))

(assert (=> bm!17506 m!201329))

(declare-fun m!201343 () Bool)

(assert (=> bm!17506 m!201343))

(assert (=> b!172335 m!201329))

(assert (=> b!172335 m!201329))

(declare-fun m!201345 () Bool)

(assert (=> b!172335 m!201345))

(assert (=> b!172336 m!201329))

(assert (=> b!172336 m!201329))

(assert (=> b!172336 m!201331))

(assert (=> b!172277 d!52561))

(declare-fun mapNonEmpty!6834 () Bool)

(declare-fun mapRes!6834 () Bool)

(declare-fun tp!15384 () Bool)

(declare-fun e!113737 () Bool)

(assert (=> mapNonEmpty!6834 (= mapRes!6834 (and tp!15384 e!113737))))

(declare-fun mapRest!6834 () (Array (_ BitVec 32) ValueCell!1664))

(declare-fun mapKey!6834 () (_ BitVec 32))

(declare-fun mapValue!6834 () ValueCell!1664)

(assert (=> mapNonEmpty!6834 (= mapRest!6833 (store mapRest!6834 mapKey!6834 mapValue!6834))))

(declare-fun mapIsEmpty!6834 () Bool)

(assert (=> mapIsEmpty!6834 mapRes!6834))

(declare-fun condMapEmpty!6834 () Bool)

(declare-fun mapDefault!6834 () ValueCell!1664)

(assert (=> mapNonEmpty!6833 (= condMapEmpty!6834 (= mapRest!6833 ((as const (Array (_ BitVec 32) ValueCell!1664)) mapDefault!6834)))))

(declare-fun e!113738 () Bool)

(assert (=> mapNonEmpty!6833 (= tp!15383 (and e!113738 mapRes!6834))))

(declare-fun b!172337 () Bool)

(assert (=> b!172337 (= e!113737 tp_is_empty!4015)))

(declare-fun b!172338 () Bool)

(assert (=> b!172338 (= e!113738 tp_is_empty!4015)))

(assert (= (and mapNonEmpty!6833 condMapEmpty!6834) mapIsEmpty!6834))

(assert (= (and mapNonEmpty!6833 (not condMapEmpty!6834)) mapNonEmpty!6834))

(assert (= (and mapNonEmpty!6834 ((_ is ValueCellFull!1664) mapValue!6834)) b!172337))

(assert (= (and mapNonEmpty!6833 ((_ is ValueCellFull!1664) mapDefault!6834)) b!172338))

(declare-fun m!201347 () Bool)

(assert (=> mapNonEmpty!6834 m!201347))

(check-sat (not b!172332) (not bm!17506) (not d!52555) (not b!172295) (not b_next!4243) (not b!172320) (not b!172296) (not b!172307) (not b!172335) (not bm!17503) (not b!172336) b_and!10697 (not mapNonEmpty!6834) tp_is_empty!4015 (not b!172321) (not bm!17500))
(check-sat b_and!10697 (not b_next!4243))
