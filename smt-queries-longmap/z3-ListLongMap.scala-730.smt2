; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16976 () Bool)

(assert start!16976)

(declare-fun b!170490 () Bool)

(declare-fun b_free!4219 () Bool)

(declare-fun b_next!4219 () Bool)

(assert (=> b!170490 (= b_free!4219 (not b_next!4219))))

(declare-fun tp!15280 () Bool)

(declare-fun b_and!10607 () Bool)

(assert (=> b!170490 (= tp!15280 b_and!10607)))

(declare-fun b!170487 () Bool)

(declare-fun res!81013 () Bool)

(declare-fun e!112529 () Bool)

(assert (=> b!170487 (=> (not res!81013) (not e!112529))))

(declare-datatypes ((V!4969 0))(
  ( (V!4970 (val!2040 Int)) )
))
(declare-datatypes ((ValueCell!1652 0))(
  ( (ValueCellFull!1652 (v!3899 V!4969)) (EmptyCell!1652) )
))
(declare-datatypes ((array!7071 0))(
  ( (array!7072 (arr!3364 (Array (_ BitVec 32) (_ BitVec 64))) (size!3658 (_ BitVec 32))) )
))
(declare-datatypes ((array!7073 0))(
  ( (array!7074 (arr!3365 (Array (_ BitVec 32) ValueCell!1652)) (size!3659 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2212 0))(
  ( (LongMapFixedSize!2213 (defaultEntry!3548 Int) (mask!8367 (_ BitVec 32)) (extraKeys!3289 (_ BitVec 32)) (zeroValue!3391 V!4969) (minValue!3391 V!4969) (_size!1155 (_ BitVec 32)) (_keys!5377 array!7071) (_values!3531 array!7073) (_vacant!1155 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2212)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170487 (= res!81013 (validMask!0 (mask!8367 thiss!1248)))))

(declare-fun b!170488 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7071 (_ BitVec 32)) Bool)

(assert (=> b!170488 (= e!112529 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5377 thiss!1248) (mask!8367 thiss!1248))))))

(declare-fun b!170489 () Bool)

(declare-fun e!112527 () Bool)

(declare-fun tp_is_empty!3991 () Bool)

(assert (=> b!170489 (= e!112527 tp_is_empty!3991)))

(declare-fun e!112531 () Bool)

(declare-fun e!112530 () Bool)

(declare-fun array_inv!2169 (array!7071) Bool)

(declare-fun array_inv!2170 (array!7073) Bool)

(assert (=> b!170490 (= e!112531 (and tp!15280 tp_is_empty!3991 (array_inv!2169 (_keys!5377 thiss!1248)) (array_inv!2170 (_values!3531 thiss!1248)) e!112530))))

(declare-fun b!170491 () Bool)

(declare-fun e!112526 () Bool)

(assert (=> b!170491 (= e!112526 tp_is_empty!3991)))

(declare-fun mapIsEmpty!6773 () Bool)

(declare-fun mapRes!6773 () Bool)

(assert (=> mapIsEmpty!6773 mapRes!6773))

(declare-fun b!170492 () Bool)

(assert (=> b!170492 (= e!112530 (and e!112527 mapRes!6773))))

(declare-fun condMapEmpty!6773 () Bool)

(declare-fun mapDefault!6773 () ValueCell!1652)

(assert (=> b!170492 (= condMapEmpty!6773 (= (arr!3365 (_values!3531 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1652)) mapDefault!6773)))))

(declare-fun b!170493 () Bool)

(declare-fun res!81014 () Bool)

(assert (=> b!170493 (=> (not res!81014) (not e!112529))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170493 (= res!81014 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!6773 () Bool)

(declare-fun tp!15281 () Bool)

(assert (=> mapNonEmpty!6773 (= mapRes!6773 (and tp!15281 e!112526))))

(declare-fun mapKey!6773 () (_ BitVec 32))

(declare-fun mapRest!6773 () (Array (_ BitVec 32) ValueCell!1652))

(declare-fun mapValue!6773 () ValueCell!1652)

(assert (=> mapNonEmpty!6773 (= (arr!3365 (_values!3531 thiss!1248)) (store mapRest!6773 mapKey!6773 mapValue!6773))))

(declare-fun b!170494 () Bool)

(declare-fun res!81015 () Bool)

(assert (=> b!170494 (=> (not res!81015) (not e!112529))))

(assert (=> b!170494 (= res!81015 (and (= (size!3659 (_values!3531 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8367 thiss!1248))) (= (size!3658 (_keys!5377 thiss!1248)) (size!3659 (_values!3531 thiss!1248))) (bvsge (mask!8367 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3289 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3289 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3289 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3289 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!3289 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!3289 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!3289 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!81016 () Bool)

(assert (=> start!16976 (=> (not res!81016) (not e!112529))))

(declare-fun valid!963 (LongMapFixedSize!2212) Bool)

(assert (=> start!16976 (= res!81016 (valid!963 thiss!1248))))

(assert (=> start!16976 e!112529))

(assert (=> start!16976 e!112531))

(assert (=> start!16976 true))

(assert (= (and start!16976 res!81016) b!170493))

(assert (= (and b!170493 res!81014) b!170487))

(assert (= (and b!170487 res!81013) b!170494))

(assert (= (and b!170494 res!81015) b!170488))

(assert (= (and b!170492 condMapEmpty!6773) mapIsEmpty!6773))

(assert (= (and b!170492 (not condMapEmpty!6773)) mapNonEmpty!6773))

(get-info :version)

(assert (= (and mapNonEmpty!6773 ((_ is ValueCellFull!1652) mapValue!6773)) b!170491))

(assert (= (and b!170492 ((_ is ValueCellFull!1652) mapDefault!6773)) b!170489))

(assert (= b!170490 b!170492))

(assert (= start!16976 b!170490))

(declare-fun m!198423 () Bool)

(assert (=> mapNonEmpty!6773 m!198423))

(declare-fun m!198425 () Bool)

(assert (=> b!170487 m!198425))

(declare-fun m!198427 () Bool)

(assert (=> b!170490 m!198427))

(declare-fun m!198429 () Bool)

(assert (=> b!170490 m!198429))

(declare-fun m!198431 () Bool)

(assert (=> start!16976 m!198431))

(declare-fun m!198433 () Bool)

(assert (=> b!170488 m!198433))

(check-sat (not b!170488) tp_is_empty!3991 (not start!16976) (not b_next!4219) (not b!170487) b_and!10607 (not b!170490) (not mapNonEmpty!6773))
(check-sat b_and!10607 (not b_next!4219))
(get-model)

(declare-fun d!51593 () Bool)

(declare-fun res!81047 () Bool)

(declare-fun e!112570 () Bool)

(assert (=> d!51593 (=> (not res!81047) (not e!112570))))

(declare-fun simpleValid!133 (LongMapFixedSize!2212) Bool)

(assert (=> d!51593 (= res!81047 (simpleValid!133 thiss!1248))))

(assert (=> d!51593 (= (valid!963 thiss!1248) e!112570)))

(declare-fun b!170549 () Bool)

(declare-fun res!81048 () Bool)

(assert (=> b!170549 (=> (not res!81048) (not e!112570))))

(declare-fun arrayCountValidKeys!0 (array!7071 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!170549 (= res!81048 (= (arrayCountValidKeys!0 (_keys!5377 thiss!1248) #b00000000000000000000000000000000 (size!3658 (_keys!5377 thiss!1248))) (_size!1155 thiss!1248)))))

(declare-fun b!170550 () Bool)

(declare-fun res!81049 () Bool)

(assert (=> b!170550 (=> (not res!81049) (not e!112570))))

(assert (=> b!170550 (= res!81049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5377 thiss!1248) (mask!8367 thiss!1248)))))

(declare-fun b!170551 () Bool)

(declare-datatypes ((List!2200 0))(
  ( (Nil!2197) (Cons!2196 (h!2813 (_ BitVec 64)) (t!6993 List!2200)) )
))
(declare-fun arrayNoDuplicates!0 (array!7071 (_ BitVec 32) List!2200) Bool)

(assert (=> b!170551 (= e!112570 (arrayNoDuplicates!0 (_keys!5377 thiss!1248) #b00000000000000000000000000000000 Nil!2197))))

(assert (= (and d!51593 res!81047) b!170549))

(assert (= (and b!170549 res!81048) b!170550))

(assert (= (and b!170550 res!81049) b!170551))

(declare-fun m!198459 () Bool)

(assert (=> d!51593 m!198459))

(declare-fun m!198461 () Bool)

(assert (=> b!170549 m!198461))

(assert (=> b!170550 m!198433))

(declare-fun m!198463 () Bool)

(assert (=> b!170551 m!198463))

(assert (=> start!16976 d!51593))

(declare-fun d!51595 () Bool)

(assert (=> d!51595 (= (array_inv!2169 (_keys!5377 thiss!1248)) (bvsge (size!3658 (_keys!5377 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170490 d!51595))

(declare-fun d!51597 () Bool)

(assert (=> d!51597 (= (array_inv!2170 (_values!3531 thiss!1248)) (bvsge (size!3659 (_values!3531 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170490 d!51597))

(declare-fun d!51599 () Bool)

(assert (=> d!51599 (= (validMask!0 (mask!8367 thiss!1248)) (and (or (= (mask!8367 thiss!1248) #b00000000000000000000000000000111) (= (mask!8367 thiss!1248) #b00000000000000000000000000001111) (= (mask!8367 thiss!1248) #b00000000000000000000000000011111) (= (mask!8367 thiss!1248) #b00000000000000000000000000111111) (= (mask!8367 thiss!1248) #b00000000000000000000000001111111) (= (mask!8367 thiss!1248) #b00000000000000000000000011111111) (= (mask!8367 thiss!1248) #b00000000000000000000000111111111) (= (mask!8367 thiss!1248) #b00000000000000000000001111111111) (= (mask!8367 thiss!1248) #b00000000000000000000011111111111) (= (mask!8367 thiss!1248) #b00000000000000000000111111111111) (= (mask!8367 thiss!1248) #b00000000000000000001111111111111) (= (mask!8367 thiss!1248) #b00000000000000000011111111111111) (= (mask!8367 thiss!1248) #b00000000000000000111111111111111) (= (mask!8367 thiss!1248) #b00000000000000001111111111111111) (= (mask!8367 thiss!1248) #b00000000000000011111111111111111) (= (mask!8367 thiss!1248) #b00000000000000111111111111111111) (= (mask!8367 thiss!1248) #b00000000000001111111111111111111) (= (mask!8367 thiss!1248) #b00000000000011111111111111111111) (= (mask!8367 thiss!1248) #b00000000000111111111111111111111) (= (mask!8367 thiss!1248) #b00000000001111111111111111111111) (= (mask!8367 thiss!1248) #b00000000011111111111111111111111) (= (mask!8367 thiss!1248) #b00000000111111111111111111111111) (= (mask!8367 thiss!1248) #b00000001111111111111111111111111) (= (mask!8367 thiss!1248) #b00000011111111111111111111111111) (= (mask!8367 thiss!1248) #b00000111111111111111111111111111) (= (mask!8367 thiss!1248) #b00001111111111111111111111111111) (= (mask!8367 thiss!1248) #b00011111111111111111111111111111) (= (mask!8367 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8367 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!170487 d!51599))

(declare-fun bm!17356 () Bool)

(declare-fun call!17359 () Bool)

(assert (=> bm!17356 (= call!17359 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5377 thiss!1248) (mask!8367 thiss!1248)))))

(declare-fun b!170560 () Bool)

(declare-fun e!112578 () Bool)

(assert (=> b!170560 (= e!112578 call!17359)))

(declare-fun b!170561 () Bool)

(declare-fun e!112579 () Bool)

(assert (=> b!170561 (= e!112579 call!17359)))

(declare-fun d!51601 () Bool)

(declare-fun res!81054 () Bool)

(declare-fun e!112577 () Bool)

(assert (=> d!51601 (=> res!81054 e!112577)))

(assert (=> d!51601 (= res!81054 (bvsge #b00000000000000000000000000000000 (size!3658 (_keys!5377 thiss!1248))))))

(assert (=> d!51601 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5377 thiss!1248) (mask!8367 thiss!1248)) e!112577)))

(declare-fun b!170562 () Bool)

(assert (=> b!170562 (= e!112577 e!112579)))

(declare-fun c!30464 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!170562 (= c!30464 (validKeyInArray!0 (select (arr!3364 (_keys!5377 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170563 () Bool)

(assert (=> b!170563 (= e!112579 e!112578)))

(declare-fun lt!84836 () (_ BitVec 64))

(assert (=> b!170563 (= lt!84836 (select (arr!3364 (_keys!5377 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5223 0))(
  ( (Unit!5224) )
))
(declare-fun lt!84835 () Unit!5223)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7071 (_ BitVec 64) (_ BitVec 32)) Unit!5223)

(assert (=> b!170563 (= lt!84835 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5377 thiss!1248) lt!84836 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!170563 (arrayContainsKey!0 (_keys!5377 thiss!1248) lt!84836 #b00000000000000000000000000000000)))

(declare-fun lt!84837 () Unit!5223)

(assert (=> b!170563 (= lt!84837 lt!84835)))

(declare-fun res!81055 () Bool)

(declare-datatypes ((SeekEntryResult!543 0))(
  ( (MissingZero!543 (index!4340 (_ BitVec 32))) (Found!543 (index!4341 (_ BitVec 32))) (Intermediate!543 (undefined!1355 Bool) (index!4342 (_ BitVec 32)) (x!18920 (_ BitVec 32))) (Undefined!543) (MissingVacant!543 (index!4343 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7071 (_ BitVec 32)) SeekEntryResult!543)

(assert (=> b!170563 (= res!81055 (= (seekEntryOrOpen!0 (select (arr!3364 (_keys!5377 thiss!1248)) #b00000000000000000000000000000000) (_keys!5377 thiss!1248) (mask!8367 thiss!1248)) (Found!543 #b00000000000000000000000000000000)))))

(assert (=> b!170563 (=> (not res!81055) (not e!112578))))

(assert (= (and d!51601 (not res!81054)) b!170562))

(assert (= (and b!170562 c!30464) b!170563))

(assert (= (and b!170562 (not c!30464)) b!170561))

(assert (= (and b!170563 res!81055) b!170560))

(assert (= (or b!170560 b!170561) bm!17356))

(declare-fun m!198465 () Bool)

(assert (=> bm!17356 m!198465))

(declare-fun m!198467 () Bool)

(assert (=> b!170562 m!198467))

(assert (=> b!170562 m!198467))

(declare-fun m!198469 () Bool)

(assert (=> b!170562 m!198469))

(assert (=> b!170563 m!198467))

(declare-fun m!198471 () Bool)

(assert (=> b!170563 m!198471))

(declare-fun m!198473 () Bool)

(assert (=> b!170563 m!198473))

(assert (=> b!170563 m!198467))

(declare-fun m!198475 () Bool)

(assert (=> b!170563 m!198475))

(assert (=> b!170488 d!51601))

(declare-fun b!170571 () Bool)

(declare-fun e!112584 () Bool)

(assert (=> b!170571 (= e!112584 tp_is_empty!3991)))

(declare-fun mapIsEmpty!6782 () Bool)

(declare-fun mapRes!6782 () Bool)

(assert (=> mapIsEmpty!6782 mapRes!6782))

(declare-fun mapNonEmpty!6782 () Bool)

(declare-fun tp!15296 () Bool)

(declare-fun e!112585 () Bool)

(assert (=> mapNonEmpty!6782 (= mapRes!6782 (and tp!15296 e!112585))))

(declare-fun mapKey!6782 () (_ BitVec 32))

(declare-fun mapValue!6782 () ValueCell!1652)

(declare-fun mapRest!6782 () (Array (_ BitVec 32) ValueCell!1652))

(assert (=> mapNonEmpty!6782 (= mapRest!6773 (store mapRest!6782 mapKey!6782 mapValue!6782))))

(declare-fun b!170570 () Bool)

(assert (=> b!170570 (= e!112585 tp_is_empty!3991)))

(declare-fun condMapEmpty!6782 () Bool)

(declare-fun mapDefault!6782 () ValueCell!1652)

(assert (=> mapNonEmpty!6773 (= condMapEmpty!6782 (= mapRest!6773 ((as const (Array (_ BitVec 32) ValueCell!1652)) mapDefault!6782)))))

(assert (=> mapNonEmpty!6773 (= tp!15281 (and e!112584 mapRes!6782))))

(assert (= (and mapNonEmpty!6773 condMapEmpty!6782) mapIsEmpty!6782))

(assert (= (and mapNonEmpty!6773 (not condMapEmpty!6782)) mapNonEmpty!6782))

(assert (= (and mapNonEmpty!6782 ((_ is ValueCellFull!1652) mapValue!6782)) b!170570))

(assert (= (and mapNonEmpty!6773 ((_ is ValueCellFull!1652) mapDefault!6782)) b!170571))

(declare-fun m!198477 () Bool)

(assert (=> mapNonEmpty!6782 m!198477))

(check-sat (not b!170550) (not mapNonEmpty!6782) (not b!170549) tp_is_empty!3991 (not b!170563) (not b_next!4219) (not bm!17356) (not b!170562) b_and!10607 (not d!51593) (not b!170551))
(check-sat b_and!10607 (not b_next!4219))
