; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21570 () Bool)

(assert start!21570)

(declare-fun b!216011 () Bool)

(declare-fun b_free!5743 () Bool)

(declare-fun b_next!5743 () Bool)

(assert (=> b!216011 (= b_free!5743 (not b_next!5743))))

(declare-fun tp!20358 () Bool)

(declare-fun b_and!12607 () Bool)

(assert (=> b!216011 (= tp!20358 b_and!12607)))

(declare-fun mapNonEmpty!9564 () Bool)

(declare-fun mapRes!9564 () Bool)

(declare-fun tp!20357 () Bool)

(declare-fun e!140535 () Bool)

(assert (=> mapNonEmpty!9564 (= mapRes!9564 (and tp!20357 e!140535))))

(declare-datatypes ((V!7121 0))(
  ( (V!7122 (val!2847 Int)) )
))
(declare-datatypes ((ValueCell!2459 0))(
  ( (ValueCellFull!2459 (v!4859 V!7121)) (EmptyCell!2459) )
))
(declare-fun mapValue!9564 () ValueCell!2459)

(declare-datatypes ((array!10437 0))(
  ( (array!10438 (arr!4941 (Array (_ BitVec 32) ValueCell!2459)) (size!5274 (_ BitVec 32))) )
))
(declare-datatypes ((array!10439 0))(
  ( (array!10440 (arr!4942 (Array (_ BitVec 32) (_ BitVec 64))) (size!5275 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2818 0))(
  ( (LongMapFixedSize!2819 (defaultEntry!4059 Int) (mask!9785 (_ BitVec 32)) (extraKeys!3796 (_ BitVec 32)) (zeroValue!3900 V!7121) (minValue!3900 V!7121) (_size!1458 (_ BitVec 32)) (_keys!6103 array!10439) (_values!4042 array!10437) (_vacant!1458 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2818)

(declare-fun mapRest!9564 () (Array (_ BitVec 32) ValueCell!2459))

(declare-fun mapKey!9564 () (_ BitVec 32))

(assert (=> mapNonEmpty!9564 (= (arr!4941 (_values!4042 thiss!1504)) (store mapRest!9564 mapKey!9564 mapValue!9564))))

(declare-fun b!216007 () Bool)

(declare-fun e!140533 () Bool)

(declare-fun tp_is_empty!5605 () Bool)

(assert (=> b!216007 (= e!140533 tp_is_empty!5605)))

(declare-fun b!216008 () Bool)

(declare-fun res!105590 () Bool)

(declare-fun e!140534 () Bool)

(assert (=> b!216008 (=> (not res!105590) (not e!140534))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!216008 (= res!105590 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216009 () Bool)

(assert (=> b!216009 (= e!140535 tp_is_empty!5605)))

(declare-fun b!216010 () Bool)

(declare-fun e!140531 () Bool)

(assert (=> b!216010 (= e!140534 e!140531)))

(declare-fun res!105594 () Bool)

(assert (=> b!216010 (=> (not res!105594) (not e!140531))))

(declare-datatypes ((SeekEntryResult!736 0))(
  ( (MissingZero!736 (index!5114 (_ BitVec 32))) (Found!736 (index!5115 (_ BitVec 32))) (Intermediate!736 (undefined!1548 Bool) (index!5116 (_ BitVec 32)) (x!22599 (_ BitVec 32))) (Undefined!736) (MissingVacant!736 (index!5117 (_ BitVec 32))) )
))
(declare-fun lt!110933 () SeekEntryResult!736)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216010 (= res!105594 (or (= lt!110933 (MissingZero!736 index!297)) (= lt!110933 (MissingVacant!736 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10439 (_ BitVec 32)) SeekEntryResult!736)

(assert (=> b!216010 (= lt!110933 (seekEntryOrOpen!0 key!932 (_keys!6103 thiss!1504) (mask!9785 thiss!1504)))))

(declare-fun e!140532 () Bool)

(declare-fun e!140536 () Bool)

(declare-fun array_inv!3249 (array!10439) Bool)

(declare-fun array_inv!3250 (array!10437) Bool)

(assert (=> b!216011 (= e!140536 (and tp!20358 tp_is_empty!5605 (array_inv!3249 (_keys!6103 thiss!1504)) (array_inv!3250 (_values!4042 thiss!1504)) e!140532))))

(declare-fun b!216012 () Bool)

(declare-fun res!105592 () Bool)

(assert (=> b!216012 (=> (not res!105592) (not e!140531))))

(assert (=> b!216012 (= res!105592 (and (= (size!5274 (_values!4042 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9785 thiss!1504))) (= (size!5275 (_keys!6103 thiss!1504)) (size!5274 (_values!4042 thiss!1504))) (bvsge (mask!9785 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3796 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3796 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!105595 () Bool)

(assert (=> start!21570 (=> (not res!105595) (not e!140534))))

(declare-fun valid!1163 (LongMapFixedSize!2818) Bool)

(assert (=> start!21570 (= res!105595 (valid!1163 thiss!1504))))

(assert (=> start!21570 e!140534))

(assert (=> start!21570 e!140536))

(assert (=> start!21570 true))

(declare-fun b!216013 () Bool)

(assert (=> b!216013 (= e!140532 (and e!140533 mapRes!9564))))

(declare-fun condMapEmpty!9564 () Bool)

(declare-fun mapDefault!9564 () ValueCell!2459)

(assert (=> b!216013 (= condMapEmpty!9564 (= (arr!4941 (_values!4042 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2459)) mapDefault!9564)))))

(declare-fun b!216014 () Bool)

(declare-datatypes ((List!3128 0))(
  ( (Nil!3125) (Cons!3124 (h!3771 (_ BitVec 64)) (t!8074 List!3128)) )
))
(declare-fun arrayNoDuplicates!0 (array!10439 (_ BitVec 32) List!3128) Bool)

(assert (=> b!216014 (= e!140531 (not (arrayNoDuplicates!0 (_keys!6103 thiss!1504) #b00000000000000000000000000000000 Nil!3125)))))

(declare-fun mapIsEmpty!9564 () Bool)

(assert (=> mapIsEmpty!9564 mapRes!9564))

(declare-fun b!216015 () Bool)

(declare-fun res!105591 () Bool)

(assert (=> b!216015 (=> (not res!105591) (not e!140531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216015 (= res!105591 (validMask!0 (mask!9785 thiss!1504)))))

(declare-fun b!216016 () Bool)

(declare-fun res!105593 () Bool)

(assert (=> b!216016 (=> (not res!105593) (not e!140531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10439 (_ BitVec 32)) Bool)

(assert (=> b!216016 (= res!105593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6103 thiss!1504) (mask!9785 thiss!1504)))))

(assert (= (and start!21570 res!105595) b!216008))

(assert (= (and b!216008 res!105590) b!216010))

(assert (= (and b!216010 res!105594) b!216015))

(assert (= (and b!216015 res!105591) b!216012))

(assert (= (and b!216012 res!105592) b!216016))

(assert (= (and b!216016 res!105593) b!216014))

(assert (= (and b!216013 condMapEmpty!9564) mapIsEmpty!9564))

(assert (= (and b!216013 (not condMapEmpty!9564)) mapNonEmpty!9564))

(get-info :version)

(assert (= (and mapNonEmpty!9564 ((_ is ValueCellFull!2459) mapValue!9564)) b!216009))

(assert (= (and b!216013 ((_ is ValueCellFull!2459) mapDefault!9564)) b!216007))

(assert (= b!216011 b!216013))

(assert (= start!21570 b!216011))

(declare-fun m!242385 () Bool)

(assert (=> start!21570 m!242385))

(declare-fun m!242387 () Bool)

(assert (=> b!216011 m!242387))

(declare-fun m!242389 () Bool)

(assert (=> b!216011 m!242389))

(declare-fun m!242391 () Bool)

(assert (=> b!216016 m!242391))

(declare-fun m!242393 () Bool)

(assert (=> b!216010 m!242393))

(declare-fun m!242395 () Bool)

(assert (=> b!216014 m!242395))

(declare-fun m!242397 () Bool)

(assert (=> mapNonEmpty!9564 m!242397))

(declare-fun m!242399 () Bool)

(assert (=> b!216015 m!242399))

(check-sat (not b_next!5743) b_and!12607 (not b!216014) (not mapNonEmpty!9564) (not b!216015) (not b!216016) (not b!216010) (not b!216011) tp_is_empty!5605 (not start!21570))
(check-sat b_and!12607 (not b_next!5743))
(get-model)

(declare-fun bm!20346 () Bool)

(declare-fun call!20349 () Bool)

(declare-fun c!36276 () Bool)

(assert (=> bm!20346 (= call!20349 (arrayNoDuplicates!0 (_keys!6103 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36276 (Cons!3124 (select (arr!4942 (_keys!6103 thiss!1504)) #b00000000000000000000000000000000) Nil!3125) Nil!3125)))))

(declare-fun b!216087 () Bool)

(declare-fun e!140589 () Bool)

(declare-fun e!140591 () Bool)

(assert (=> b!216087 (= e!140589 e!140591)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!216087 (= c!36276 (validKeyInArray!0 (select (arr!4942 (_keys!6103 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!216088 () Bool)

(declare-fun e!140590 () Bool)

(assert (=> b!216088 (= e!140590 e!140589)))

(declare-fun res!105640 () Bool)

(assert (=> b!216088 (=> (not res!105640) (not e!140589))))

(declare-fun e!140588 () Bool)

(assert (=> b!216088 (= res!105640 (not e!140588))))

(declare-fun res!105638 () Bool)

(assert (=> b!216088 (=> (not res!105638) (not e!140588))))

(assert (=> b!216088 (= res!105638 (validKeyInArray!0 (select (arr!4942 (_keys!6103 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58377 () Bool)

(declare-fun res!105639 () Bool)

(assert (=> d!58377 (=> res!105639 e!140590)))

(assert (=> d!58377 (= res!105639 (bvsge #b00000000000000000000000000000000 (size!5275 (_keys!6103 thiss!1504))))))

(assert (=> d!58377 (= (arrayNoDuplicates!0 (_keys!6103 thiss!1504) #b00000000000000000000000000000000 Nil!3125) e!140590)))

(declare-fun b!216089 () Bool)

(assert (=> b!216089 (= e!140591 call!20349)))

(declare-fun b!216090 () Bool)

(declare-fun contains!1410 (List!3128 (_ BitVec 64)) Bool)

(assert (=> b!216090 (= e!140588 (contains!1410 Nil!3125 (select (arr!4942 (_keys!6103 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!216091 () Bool)

(assert (=> b!216091 (= e!140591 call!20349)))

(assert (= (and d!58377 (not res!105639)) b!216088))

(assert (= (and b!216088 res!105638) b!216090))

(assert (= (and b!216088 res!105640) b!216087))

(assert (= (and b!216087 c!36276) b!216089))

(assert (= (and b!216087 (not c!36276)) b!216091))

(assert (= (or b!216089 b!216091) bm!20346))

(declare-fun m!242433 () Bool)

(assert (=> bm!20346 m!242433))

(declare-fun m!242435 () Bool)

(assert (=> bm!20346 m!242435))

(assert (=> b!216087 m!242433))

(assert (=> b!216087 m!242433))

(declare-fun m!242437 () Bool)

(assert (=> b!216087 m!242437))

(assert (=> b!216088 m!242433))

(assert (=> b!216088 m!242433))

(assert (=> b!216088 m!242437))

(assert (=> b!216090 m!242433))

(assert (=> b!216090 m!242433))

(declare-fun m!242439 () Bool)

(assert (=> b!216090 m!242439))

(assert (=> b!216014 d!58377))

(declare-fun b!216100 () Bool)

(declare-fun e!140598 () Bool)

(declare-fun e!140599 () Bool)

(assert (=> b!216100 (= e!140598 e!140599)))

(declare-fun lt!110947 () (_ BitVec 64))

(assert (=> b!216100 (= lt!110947 (select (arr!4942 (_keys!6103 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6462 0))(
  ( (Unit!6463) )
))
(declare-fun lt!110946 () Unit!6462)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10439 (_ BitVec 64) (_ BitVec 32)) Unit!6462)

(assert (=> b!216100 (= lt!110946 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6103 thiss!1504) lt!110947 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!216100 (arrayContainsKey!0 (_keys!6103 thiss!1504) lt!110947 #b00000000000000000000000000000000)))

(declare-fun lt!110948 () Unit!6462)

(assert (=> b!216100 (= lt!110948 lt!110946)))

(declare-fun res!105645 () Bool)

(assert (=> b!216100 (= res!105645 (= (seekEntryOrOpen!0 (select (arr!4942 (_keys!6103 thiss!1504)) #b00000000000000000000000000000000) (_keys!6103 thiss!1504) (mask!9785 thiss!1504)) (Found!736 #b00000000000000000000000000000000)))))

(assert (=> b!216100 (=> (not res!105645) (not e!140599))))

(declare-fun b!216101 () Bool)

(declare-fun e!140600 () Bool)

(assert (=> b!216101 (= e!140600 e!140598)))

(declare-fun c!36279 () Bool)

(assert (=> b!216101 (= c!36279 (validKeyInArray!0 (select (arr!4942 (_keys!6103 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58379 () Bool)

(declare-fun res!105646 () Bool)

(assert (=> d!58379 (=> res!105646 e!140600)))

(assert (=> d!58379 (= res!105646 (bvsge #b00000000000000000000000000000000 (size!5275 (_keys!6103 thiss!1504))))))

(assert (=> d!58379 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6103 thiss!1504) (mask!9785 thiss!1504)) e!140600)))

(declare-fun bm!20349 () Bool)

(declare-fun call!20352 () Bool)

(assert (=> bm!20349 (= call!20352 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6103 thiss!1504) (mask!9785 thiss!1504)))))

(declare-fun b!216102 () Bool)

(assert (=> b!216102 (= e!140598 call!20352)))

(declare-fun b!216103 () Bool)

(assert (=> b!216103 (= e!140599 call!20352)))

(assert (= (and d!58379 (not res!105646)) b!216101))

(assert (= (and b!216101 c!36279) b!216100))

(assert (= (and b!216101 (not c!36279)) b!216102))

(assert (= (and b!216100 res!105645) b!216103))

(assert (= (or b!216103 b!216102) bm!20349))

(assert (=> b!216100 m!242433))

(declare-fun m!242441 () Bool)

(assert (=> b!216100 m!242441))

(declare-fun m!242443 () Bool)

(assert (=> b!216100 m!242443))

(assert (=> b!216100 m!242433))

(declare-fun m!242445 () Bool)

(assert (=> b!216100 m!242445))

(assert (=> b!216101 m!242433))

(assert (=> b!216101 m!242433))

(assert (=> b!216101 m!242437))

(declare-fun m!242447 () Bool)

(assert (=> bm!20349 m!242447))

(assert (=> b!216016 d!58379))

(declare-fun d!58381 () Bool)

(assert (=> d!58381 (= (array_inv!3249 (_keys!6103 thiss!1504)) (bvsge (size!5275 (_keys!6103 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!216011 d!58381))

(declare-fun d!58383 () Bool)

(assert (=> d!58383 (= (array_inv!3250 (_values!4042 thiss!1504)) (bvsge (size!5274 (_values!4042 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!216011 d!58383))

(declare-fun d!58385 () Bool)

(assert (=> d!58385 (= (validMask!0 (mask!9785 thiss!1504)) (and (or (= (mask!9785 thiss!1504) #b00000000000000000000000000000111) (= (mask!9785 thiss!1504) #b00000000000000000000000000001111) (= (mask!9785 thiss!1504) #b00000000000000000000000000011111) (= (mask!9785 thiss!1504) #b00000000000000000000000000111111) (= (mask!9785 thiss!1504) #b00000000000000000000000001111111) (= (mask!9785 thiss!1504) #b00000000000000000000000011111111) (= (mask!9785 thiss!1504) #b00000000000000000000000111111111) (= (mask!9785 thiss!1504) #b00000000000000000000001111111111) (= (mask!9785 thiss!1504) #b00000000000000000000011111111111) (= (mask!9785 thiss!1504) #b00000000000000000000111111111111) (= (mask!9785 thiss!1504) #b00000000000000000001111111111111) (= (mask!9785 thiss!1504) #b00000000000000000011111111111111) (= (mask!9785 thiss!1504) #b00000000000000000111111111111111) (= (mask!9785 thiss!1504) #b00000000000000001111111111111111) (= (mask!9785 thiss!1504) #b00000000000000011111111111111111) (= (mask!9785 thiss!1504) #b00000000000000111111111111111111) (= (mask!9785 thiss!1504) #b00000000000001111111111111111111) (= (mask!9785 thiss!1504) #b00000000000011111111111111111111) (= (mask!9785 thiss!1504) #b00000000000111111111111111111111) (= (mask!9785 thiss!1504) #b00000000001111111111111111111111) (= (mask!9785 thiss!1504) #b00000000011111111111111111111111) (= (mask!9785 thiss!1504) #b00000000111111111111111111111111) (= (mask!9785 thiss!1504) #b00000001111111111111111111111111) (= (mask!9785 thiss!1504) #b00000011111111111111111111111111) (= (mask!9785 thiss!1504) #b00000111111111111111111111111111) (= (mask!9785 thiss!1504) #b00001111111111111111111111111111) (= (mask!9785 thiss!1504) #b00011111111111111111111111111111) (= (mask!9785 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9785 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!216015 d!58385))

(declare-fun d!58387 () Bool)

(declare-fun res!105653 () Bool)

(declare-fun e!140603 () Bool)

(assert (=> d!58387 (=> (not res!105653) (not e!140603))))

(declare-fun simpleValid!222 (LongMapFixedSize!2818) Bool)

(assert (=> d!58387 (= res!105653 (simpleValid!222 thiss!1504))))

(assert (=> d!58387 (= (valid!1163 thiss!1504) e!140603)))

(declare-fun b!216110 () Bool)

(declare-fun res!105654 () Bool)

(assert (=> b!216110 (=> (not res!105654) (not e!140603))))

(declare-fun arrayCountValidKeys!0 (array!10439 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!216110 (= res!105654 (= (arrayCountValidKeys!0 (_keys!6103 thiss!1504) #b00000000000000000000000000000000 (size!5275 (_keys!6103 thiss!1504))) (_size!1458 thiss!1504)))))

(declare-fun b!216111 () Bool)

(declare-fun res!105655 () Bool)

(assert (=> b!216111 (=> (not res!105655) (not e!140603))))

(assert (=> b!216111 (= res!105655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6103 thiss!1504) (mask!9785 thiss!1504)))))

(declare-fun b!216112 () Bool)

(assert (=> b!216112 (= e!140603 (arrayNoDuplicates!0 (_keys!6103 thiss!1504) #b00000000000000000000000000000000 Nil!3125))))

(assert (= (and d!58387 res!105653) b!216110))

(assert (= (and b!216110 res!105654) b!216111))

(assert (= (and b!216111 res!105655) b!216112))

(declare-fun m!242449 () Bool)

(assert (=> d!58387 m!242449))

(declare-fun m!242451 () Bool)

(assert (=> b!216110 m!242451))

(assert (=> b!216111 m!242391))

(assert (=> b!216112 m!242395))

(assert (=> start!21570 d!58387))

(declare-fun b!216125 () Bool)

(declare-fun e!140612 () SeekEntryResult!736)

(declare-fun e!140610 () SeekEntryResult!736)

(assert (=> b!216125 (= e!140612 e!140610)))

(declare-fun lt!110955 () (_ BitVec 64))

(declare-fun lt!110957 () SeekEntryResult!736)

(assert (=> b!216125 (= lt!110955 (select (arr!4942 (_keys!6103 thiss!1504)) (index!5116 lt!110957)))))

(declare-fun c!36288 () Bool)

(assert (=> b!216125 (= c!36288 (= lt!110955 key!932))))

(declare-fun b!216126 () Bool)

(assert (=> b!216126 (= e!140610 (Found!736 (index!5116 lt!110957)))))

(declare-fun b!216127 () Bool)

(assert (=> b!216127 (= e!140612 Undefined!736)))

(declare-fun b!216128 () Bool)

(declare-fun e!140611 () SeekEntryResult!736)

(assert (=> b!216128 (= e!140611 (MissingZero!736 (index!5116 lt!110957)))))

(declare-fun d!58389 () Bool)

(declare-fun lt!110956 () SeekEntryResult!736)

(assert (=> d!58389 (and (or ((_ is Undefined!736) lt!110956) (not ((_ is Found!736) lt!110956)) (and (bvsge (index!5115 lt!110956) #b00000000000000000000000000000000) (bvslt (index!5115 lt!110956) (size!5275 (_keys!6103 thiss!1504))))) (or ((_ is Undefined!736) lt!110956) ((_ is Found!736) lt!110956) (not ((_ is MissingZero!736) lt!110956)) (and (bvsge (index!5114 lt!110956) #b00000000000000000000000000000000) (bvslt (index!5114 lt!110956) (size!5275 (_keys!6103 thiss!1504))))) (or ((_ is Undefined!736) lt!110956) ((_ is Found!736) lt!110956) ((_ is MissingZero!736) lt!110956) (not ((_ is MissingVacant!736) lt!110956)) (and (bvsge (index!5117 lt!110956) #b00000000000000000000000000000000) (bvslt (index!5117 lt!110956) (size!5275 (_keys!6103 thiss!1504))))) (or ((_ is Undefined!736) lt!110956) (ite ((_ is Found!736) lt!110956) (= (select (arr!4942 (_keys!6103 thiss!1504)) (index!5115 lt!110956)) key!932) (ite ((_ is MissingZero!736) lt!110956) (= (select (arr!4942 (_keys!6103 thiss!1504)) (index!5114 lt!110956)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!736) lt!110956) (= (select (arr!4942 (_keys!6103 thiss!1504)) (index!5117 lt!110956)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58389 (= lt!110956 e!140612)))

(declare-fun c!36286 () Bool)

(assert (=> d!58389 (= c!36286 (and ((_ is Intermediate!736) lt!110957) (undefined!1548 lt!110957)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10439 (_ BitVec 32)) SeekEntryResult!736)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58389 (= lt!110957 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9785 thiss!1504)) key!932 (_keys!6103 thiss!1504) (mask!9785 thiss!1504)))))

(assert (=> d!58389 (validMask!0 (mask!9785 thiss!1504))))

(assert (=> d!58389 (= (seekEntryOrOpen!0 key!932 (_keys!6103 thiss!1504) (mask!9785 thiss!1504)) lt!110956)))

(declare-fun b!216129 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10439 (_ BitVec 32)) SeekEntryResult!736)

(assert (=> b!216129 (= e!140611 (seekKeyOrZeroReturnVacant!0 (x!22599 lt!110957) (index!5116 lt!110957) (index!5116 lt!110957) key!932 (_keys!6103 thiss!1504) (mask!9785 thiss!1504)))))

(declare-fun b!216130 () Bool)

(declare-fun c!36287 () Bool)

(assert (=> b!216130 (= c!36287 (= lt!110955 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!216130 (= e!140610 e!140611)))

(assert (= (and d!58389 c!36286) b!216127))

(assert (= (and d!58389 (not c!36286)) b!216125))

(assert (= (and b!216125 c!36288) b!216126))

(assert (= (and b!216125 (not c!36288)) b!216130))

(assert (= (and b!216130 c!36287) b!216128))

(assert (= (and b!216130 (not c!36287)) b!216129))

(declare-fun m!242453 () Bool)

(assert (=> b!216125 m!242453))

(declare-fun m!242455 () Bool)

(assert (=> d!58389 m!242455))

(assert (=> d!58389 m!242399))

(declare-fun m!242457 () Bool)

(assert (=> d!58389 m!242457))

(declare-fun m!242459 () Bool)

(assert (=> d!58389 m!242459))

(declare-fun m!242461 () Bool)

(assert (=> d!58389 m!242461))

(assert (=> d!58389 m!242461))

(declare-fun m!242463 () Bool)

(assert (=> d!58389 m!242463))

(declare-fun m!242465 () Bool)

(assert (=> b!216129 m!242465))

(assert (=> b!216010 d!58389))

(declare-fun mapIsEmpty!9573 () Bool)

(declare-fun mapRes!9573 () Bool)

(assert (=> mapIsEmpty!9573 mapRes!9573))

(declare-fun b!216137 () Bool)

(declare-fun e!140617 () Bool)

(assert (=> b!216137 (= e!140617 tp_is_empty!5605)))

(declare-fun b!216138 () Bool)

(declare-fun e!140618 () Bool)

(assert (=> b!216138 (= e!140618 tp_is_empty!5605)))

(declare-fun condMapEmpty!9573 () Bool)

(declare-fun mapDefault!9573 () ValueCell!2459)

(assert (=> mapNonEmpty!9564 (= condMapEmpty!9573 (= mapRest!9564 ((as const (Array (_ BitVec 32) ValueCell!2459)) mapDefault!9573)))))

(assert (=> mapNonEmpty!9564 (= tp!20357 (and e!140618 mapRes!9573))))

(declare-fun mapNonEmpty!9573 () Bool)

(declare-fun tp!20373 () Bool)

(assert (=> mapNonEmpty!9573 (= mapRes!9573 (and tp!20373 e!140617))))

(declare-fun mapValue!9573 () ValueCell!2459)

(declare-fun mapRest!9573 () (Array (_ BitVec 32) ValueCell!2459))

(declare-fun mapKey!9573 () (_ BitVec 32))

(assert (=> mapNonEmpty!9573 (= mapRest!9564 (store mapRest!9573 mapKey!9573 mapValue!9573))))

(assert (= (and mapNonEmpty!9564 condMapEmpty!9573) mapIsEmpty!9573))

(assert (= (and mapNonEmpty!9564 (not condMapEmpty!9573)) mapNonEmpty!9573))

(assert (= (and mapNonEmpty!9573 ((_ is ValueCellFull!2459) mapValue!9573)) b!216137))

(assert (= (and mapNonEmpty!9564 ((_ is ValueCellFull!2459) mapDefault!9573)) b!216138))

(declare-fun m!242467 () Bool)

(assert (=> mapNonEmpty!9573 m!242467))

(check-sat b_and!12607 (not b!216090) (not mapNonEmpty!9573) (not b!216100) (not b!216087) (not b!216111) (not bm!20349) (not b_next!5743) (not bm!20346) (not b!216112) (not b!216129) (not b!216110) (not d!58387) tp_is_empty!5605 (not d!58389) (not b!216101) (not b!216088))
(check-sat b_and!12607 (not b_next!5743))
