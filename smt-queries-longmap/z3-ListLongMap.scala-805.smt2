; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19400 () Bool)

(assert start!19400)

(declare-fun b!190505 () Bool)

(declare-fun b_free!4669 () Bool)

(declare-fun b_next!4669 () Bool)

(assert (=> b!190505 (= b_free!4669 (not b_next!4669))))

(declare-fun tp!16850 () Bool)

(declare-fun b_and!11301 () Bool)

(assert (=> b!190505 (= tp!16850 b_and!11301)))

(declare-fun mapIsEmpty!7667 () Bool)

(declare-fun mapRes!7667 () Bool)

(assert (=> mapIsEmpty!7667 mapRes!7667))

(declare-fun b!190498 () Bool)

(declare-fun e!125362 () Bool)

(declare-fun e!125363 () Bool)

(assert (=> b!190498 (= e!125362 (not e!125363))))

(declare-fun res!90026 () Bool)

(assert (=> b!190498 (=> res!90026 e!125363)))

(declare-datatypes ((V!5569 0))(
  ( (V!5570 (val!2265 Int)) )
))
(declare-datatypes ((ValueCell!1877 0))(
  ( (ValueCellFull!1877 (v!4191 V!5569)) (EmptyCell!1877) )
))
(declare-datatypes ((array!8097 0))(
  ( (array!8098 (arr!3814 (Array (_ BitVec 32) (_ BitVec 64))) (size!4136 (_ BitVec 32))) )
))
(declare-datatypes ((array!8099 0))(
  ( (array!8100 (arr!3815 (Array (_ BitVec 32) ValueCell!1877)) (size!4137 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2662 0))(
  ( (LongMapFixedSize!2663 (defaultEntry!3891 Int) (mask!9097 (_ BitVec 32)) (extraKeys!3628 (_ BitVec 32)) (zeroValue!3732 V!5569) (minValue!3732 V!5569) (_size!1380 (_ BitVec 32)) (_keys!5863 array!8097) (_values!3874 array!8099) (_vacant!1380 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2662)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!190498 (= res!90026 (not (validMask!0 (mask!9097 thiss!1248))))))

(declare-datatypes ((SeekEntryResult!677 0))(
  ( (MissingZero!677 (index!4878 (_ BitVec 32))) (Found!677 (index!4879 (_ BitVec 32))) (Intermediate!677 (undefined!1489 Bool) (index!4880 (_ BitVec 32)) (x!20504 (_ BitVec 32))) (Undefined!677) (MissingVacant!677 (index!4881 (_ BitVec 32))) )
))
(declare-fun lt!94354 () SeekEntryResult!677)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!5569)

(declare-datatypes ((tuple2!3476 0))(
  ( (tuple2!3477 (_1!1749 (_ BitVec 64)) (_2!1749 V!5569)) )
))
(declare-datatypes ((List!2399 0))(
  ( (Nil!2396) (Cons!2395 (h!3033 tuple2!3476) (t!7300 List!2399)) )
))
(declare-datatypes ((ListLongMap!2385 0))(
  ( (ListLongMap!2386 (toList!1208 List!2399)) )
))
(declare-fun lt!94352 () ListLongMap!2385)

(declare-fun +!300 (ListLongMap!2385 tuple2!3476) ListLongMap!2385)

(declare-fun getCurrentListMap!841 (array!8097 array!8099 (_ BitVec 32) (_ BitVec 32) V!5569 V!5569 (_ BitVec 32) Int) ListLongMap!2385)

(assert (=> b!190498 (= (+!300 lt!94352 (tuple2!3477 key!828 v!309)) (getCurrentListMap!841 (_keys!5863 thiss!1248) (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248))) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-datatypes ((Unit!5716 0))(
  ( (Unit!5717) )
))
(declare-fun lt!94351 () Unit!5716)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!116 (array!8097 array!8099 (_ BitVec 32) (_ BitVec 32) V!5569 V!5569 (_ BitVec 32) (_ BitVec 64) V!5569 Int) Unit!5716)

(assert (=> b!190498 (= lt!94351 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!116 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) (index!4879 lt!94354) key!828 v!309 (defaultEntry!3891 thiss!1248)))))

(declare-fun lt!94356 () Unit!5716)

(declare-fun e!125359 () Unit!5716)

(assert (=> b!190498 (= lt!94356 e!125359)))

(declare-fun c!34263 () Bool)

(declare-fun contains!1325 (ListLongMap!2385 (_ BitVec 64)) Bool)

(assert (=> b!190498 (= c!34263 (contains!1325 lt!94352 key!828))))

(assert (=> b!190498 (= lt!94352 (getCurrentListMap!841 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun b!190499 () Bool)

(assert (=> b!190499 (= e!125363 (or (not (= (size!4137 (_values!3874 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9097 thiss!1248)))) (= (size!4136 (_keys!5863 thiss!1248)) (size!4137 (_values!3874 thiss!1248)))))))

(declare-fun b!190500 () Bool)

(declare-fun e!125358 () Bool)

(assert (=> b!190500 (= e!125358 (= (select (arr!3814 (_keys!5863 thiss!1248)) (index!4879 lt!94354)) key!828))))

(declare-fun b!190501 () Bool)

(declare-fun e!125364 () Bool)

(declare-fun tp_is_empty!4441 () Bool)

(assert (=> b!190501 (= e!125364 tp_is_empty!4441)))

(declare-fun mapNonEmpty!7667 () Bool)

(declare-fun tp!16849 () Bool)

(assert (=> mapNonEmpty!7667 (= mapRes!7667 (and tp!16849 e!125364))))

(declare-fun mapKey!7667 () (_ BitVec 32))

(declare-fun mapValue!7667 () ValueCell!1877)

(declare-fun mapRest!7667 () (Array (_ BitVec 32) ValueCell!1877))

(assert (=> mapNonEmpty!7667 (= (arr!3815 (_values!3874 thiss!1248)) (store mapRest!7667 mapKey!7667 mapValue!7667))))

(declare-fun b!190502 () Bool)

(declare-fun e!125361 () Bool)

(declare-fun e!125356 () Bool)

(assert (=> b!190502 (= e!125361 (and e!125356 mapRes!7667))))

(declare-fun condMapEmpty!7667 () Bool)

(declare-fun mapDefault!7667 () ValueCell!1877)

(assert (=> b!190502 (= condMapEmpty!7667 (= (arr!3815 (_values!3874 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1877)) mapDefault!7667)))))

(declare-fun b!190503 () Bool)

(declare-fun Unit!5718 () Unit!5716)

(assert (=> b!190503 (= e!125359 Unit!5718)))

(declare-fun lt!94353 () Unit!5716)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!166 (array!8097 array!8099 (_ BitVec 32) (_ BitVec 32) V!5569 V!5569 (_ BitVec 64) Int) Unit!5716)

(assert (=> b!190503 (= lt!94353 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!166 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) key!828 (defaultEntry!3891 thiss!1248)))))

(assert (=> b!190503 false))

(declare-fun b!190504 () Bool)

(declare-fun lt!94355 () Unit!5716)

(assert (=> b!190504 (= e!125359 lt!94355)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!168 (array!8097 array!8099 (_ BitVec 32) (_ BitVec 32) V!5569 V!5569 (_ BitVec 64) Int) Unit!5716)

(assert (=> b!190504 (= lt!94355 (lemmaInListMapThenSeekEntryOrOpenFindsIt!168 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) key!828 (defaultEntry!3891 thiss!1248)))))

(declare-fun res!90027 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!190504 (= res!90027 (inRange!0 (index!4879 lt!94354) (mask!9097 thiss!1248)))))

(assert (=> b!190504 (=> (not res!90027) (not e!125358))))

(assert (=> b!190504 e!125358))

(declare-fun e!125355 () Bool)

(declare-fun array_inv!2473 (array!8097) Bool)

(declare-fun array_inv!2474 (array!8099) Bool)

(assert (=> b!190505 (= e!125355 (and tp!16850 tp_is_empty!4441 (array_inv!2473 (_keys!5863 thiss!1248)) (array_inv!2474 (_values!3874 thiss!1248)) e!125361))))

(declare-fun b!190506 () Bool)

(assert (=> b!190506 (= e!125356 tp_is_empty!4441)))

(declare-fun res!90028 () Bool)

(declare-fun e!125360 () Bool)

(assert (=> start!19400 (=> (not res!90028) (not e!125360))))

(declare-fun valid!1112 (LongMapFixedSize!2662) Bool)

(assert (=> start!19400 (= res!90028 (valid!1112 thiss!1248))))

(assert (=> start!19400 e!125360))

(assert (=> start!19400 e!125355))

(assert (=> start!19400 true))

(assert (=> start!19400 tp_is_empty!4441))

(declare-fun b!190507 () Bool)

(assert (=> b!190507 (= e!125360 e!125362)))

(declare-fun res!90029 () Bool)

(assert (=> b!190507 (=> (not res!90029) (not e!125362))))

(get-info :version)

(assert (=> b!190507 (= res!90029 (and (not ((_ is Undefined!677) lt!94354)) (not ((_ is MissingVacant!677) lt!94354)) (not ((_ is MissingZero!677) lt!94354)) ((_ is Found!677) lt!94354)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8097 (_ BitVec 32)) SeekEntryResult!677)

(assert (=> b!190507 (= lt!94354 (seekEntryOrOpen!0 key!828 (_keys!5863 thiss!1248) (mask!9097 thiss!1248)))))

(declare-fun b!190508 () Bool)

(declare-fun res!90025 () Bool)

(assert (=> b!190508 (=> (not res!90025) (not e!125360))))

(assert (=> b!190508 (= res!90025 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!19400 res!90028) b!190508))

(assert (= (and b!190508 res!90025) b!190507))

(assert (= (and b!190507 res!90029) b!190498))

(assert (= (and b!190498 c!34263) b!190504))

(assert (= (and b!190498 (not c!34263)) b!190503))

(assert (= (and b!190504 res!90027) b!190500))

(assert (= (and b!190498 (not res!90026)) b!190499))

(assert (= (and b!190502 condMapEmpty!7667) mapIsEmpty!7667))

(assert (= (and b!190502 (not condMapEmpty!7667)) mapNonEmpty!7667))

(assert (= (and mapNonEmpty!7667 ((_ is ValueCellFull!1877) mapValue!7667)) b!190501))

(assert (= (and b!190502 ((_ is ValueCellFull!1877) mapDefault!7667)) b!190506))

(assert (= b!190505 b!190502))

(assert (= start!19400 b!190505))

(declare-fun m!216481 () Bool)

(assert (=> b!190498 m!216481))

(declare-fun m!216483 () Bool)

(assert (=> b!190498 m!216483))

(declare-fun m!216485 () Bool)

(assert (=> b!190498 m!216485))

(declare-fun m!216487 () Bool)

(assert (=> b!190498 m!216487))

(declare-fun m!216489 () Bool)

(assert (=> b!190498 m!216489))

(declare-fun m!216491 () Bool)

(assert (=> b!190498 m!216491))

(declare-fun m!216493 () Bool)

(assert (=> b!190498 m!216493))

(declare-fun m!216495 () Bool)

(assert (=> b!190507 m!216495))

(declare-fun m!216497 () Bool)

(assert (=> b!190500 m!216497))

(declare-fun m!216499 () Bool)

(assert (=> b!190505 m!216499))

(declare-fun m!216501 () Bool)

(assert (=> b!190505 m!216501))

(declare-fun m!216503 () Bool)

(assert (=> start!19400 m!216503))

(declare-fun m!216505 () Bool)

(assert (=> mapNonEmpty!7667 m!216505))

(declare-fun m!216507 () Bool)

(assert (=> b!190503 m!216507))

(declare-fun m!216509 () Bool)

(assert (=> b!190504 m!216509))

(declare-fun m!216511 () Bool)

(assert (=> b!190504 m!216511))

(check-sat b_and!11301 tp_is_empty!4441 (not start!19400) (not b!190498) (not b!190505) (not b_next!4669) (not b!190503) (not mapNonEmpty!7667) (not b!190507) (not b!190504))
(check-sat b_and!11301 (not b_next!4669))
(get-model)

(declare-fun d!55801 () Bool)

(assert (=> d!55801 (= (array_inv!2473 (_keys!5863 thiss!1248)) (bvsge (size!4136 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190505 d!55801))

(declare-fun d!55803 () Bool)

(assert (=> d!55803 (= (array_inv!2474 (_values!3874 thiss!1248)) (bvsge (size!4137 (_values!3874 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190505 d!55803))

(declare-fun d!55805 () Bool)

(declare-fun res!90066 () Bool)

(declare-fun e!125427 () Bool)

(assert (=> d!55805 (=> (not res!90066) (not e!125427))))

(declare-fun simpleValid!196 (LongMapFixedSize!2662) Bool)

(assert (=> d!55805 (= res!90066 (simpleValid!196 thiss!1248))))

(assert (=> d!55805 (= (valid!1112 thiss!1248) e!125427)))

(declare-fun b!190581 () Bool)

(declare-fun res!90067 () Bool)

(assert (=> b!190581 (=> (not res!90067) (not e!125427))))

(declare-fun arrayCountValidKeys!0 (array!8097 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!190581 (= res!90067 (= (arrayCountValidKeys!0 (_keys!5863 thiss!1248) #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))) (_size!1380 thiss!1248)))))

(declare-fun b!190582 () Bool)

(declare-fun res!90068 () Bool)

(assert (=> b!190582 (=> (not res!90068) (not e!125427))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8097 (_ BitVec 32)) Bool)

(assert (=> b!190582 (= res!90068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5863 thiss!1248) (mask!9097 thiss!1248)))))

(declare-fun b!190583 () Bool)

(declare-datatypes ((List!2401 0))(
  ( (Nil!2398) (Cons!2397 (h!3035 (_ BitVec 64)) (t!7304 List!2401)) )
))
(declare-fun arrayNoDuplicates!0 (array!8097 (_ BitVec 32) List!2401) Bool)

(assert (=> b!190583 (= e!125427 (arrayNoDuplicates!0 (_keys!5863 thiss!1248) #b00000000000000000000000000000000 Nil!2398))))

(assert (= (and d!55805 res!90066) b!190581))

(assert (= (and b!190581 res!90067) b!190582))

(assert (= (and b!190582 res!90068) b!190583))

(declare-fun m!216577 () Bool)

(assert (=> d!55805 m!216577))

(declare-fun m!216579 () Bool)

(assert (=> b!190581 m!216579))

(declare-fun m!216581 () Bool)

(assert (=> b!190582 m!216581))

(declare-fun m!216583 () Bool)

(assert (=> b!190583 m!216583))

(assert (=> start!19400 d!55805))

(declare-fun b!190596 () Bool)

(declare-fun e!125436 () SeekEntryResult!677)

(declare-fun lt!94400 () SeekEntryResult!677)

(assert (=> b!190596 (= e!125436 (MissingZero!677 (index!4880 lt!94400)))))

(declare-fun b!190597 () Bool)

(declare-fun c!34278 () Bool)

(declare-fun lt!94399 () (_ BitVec 64))

(assert (=> b!190597 (= c!34278 (= lt!94399 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!125435 () SeekEntryResult!677)

(assert (=> b!190597 (= e!125435 e!125436)))

(declare-fun d!55807 () Bool)

(declare-fun lt!94401 () SeekEntryResult!677)

(assert (=> d!55807 (and (or ((_ is Undefined!677) lt!94401) (not ((_ is Found!677) lt!94401)) (and (bvsge (index!4879 lt!94401) #b00000000000000000000000000000000) (bvslt (index!4879 lt!94401) (size!4136 (_keys!5863 thiss!1248))))) (or ((_ is Undefined!677) lt!94401) ((_ is Found!677) lt!94401) (not ((_ is MissingZero!677) lt!94401)) (and (bvsge (index!4878 lt!94401) #b00000000000000000000000000000000) (bvslt (index!4878 lt!94401) (size!4136 (_keys!5863 thiss!1248))))) (or ((_ is Undefined!677) lt!94401) ((_ is Found!677) lt!94401) ((_ is MissingZero!677) lt!94401) (not ((_ is MissingVacant!677) lt!94401)) (and (bvsge (index!4881 lt!94401) #b00000000000000000000000000000000) (bvslt (index!4881 lt!94401) (size!4136 (_keys!5863 thiss!1248))))) (or ((_ is Undefined!677) lt!94401) (ite ((_ is Found!677) lt!94401) (= (select (arr!3814 (_keys!5863 thiss!1248)) (index!4879 lt!94401)) key!828) (ite ((_ is MissingZero!677) lt!94401) (= (select (arr!3814 (_keys!5863 thiss!1248)) (index!4878 lt!94401)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!677) lt!94401) (= (select (arr!3814 (_keys!5863 thiss!1248)) (index!4881 lt!94401)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!125434 () SeekEntryResult!677)

(assert (=> d!55807 (= lt!94401 e!125434)))

(declare-fun c!34276 () Bool)

(assert (=> d!55807 (= c!34276 (and ((_ is Intermediate!677) lt!94400) (undefined!1489 lt!94400)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8097 (_ BitVec 32)) SeekEntryResult!677)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55807 (= lt!94400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9097 thiss!1248)) key!828 (_keys!5863 thiss!1248) (mask!9097 thiss!1248)))))

(assert (=> d!55807 (validMask!0 (mask!9097 thiss!1248))))

(assert (=> d!55807 (= (seekEntryOrOpen!0 key!828 (_keys!5863 thiss!1248) (mask!9097 thiss!1248)) lt!94401)))

(declare-fun b!190598 () Bool)

(assert (=> b!190598 (= e!125434 Undefined!677)))

(declare-fun b!190599 () Bool)

(assert (=> b!190599 (= e!125435 (Found!677 (index!4880 lt!94400)))))

(declare-fun b!190600 () Bool)

(assert (=> b!190600 (= e!125434 e!125435)))

(assert (=> b!190600 (= lt!94399 (select (arr!3814 (_keys!5863 thiss!1248)) (index!4880 lt!94400)))))

(declare-fun c!34277 () Bool)

(assert (=> b!190600 (= c!34277 (= lt!94399 key!828))))

(declare-fun b!190601 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8097 (_ BitVec 32)) SeekEntryResult!677)

(assert (=> b!190601 (= e!125436 (seekKeyOrZeroReturnVacant!0 (x!20504 lt!94400) (index!4880 lt!94400) (index!4880 lt!94400) key!828 (_keys!5863 thiss!1248) (mask!9097 thiss!1248)))))

(assert (= (and d!55807 c!34276) b!190598))

(assert (= (and d!55807 (not c!34276)) b!190600))

(assert (= (and b!190600 c!34277) b!190599))

(assert (= (and b!190600 (not c!34277)) b!190597))

(assert (= (and b!190597 c!34278) b!190596))

(assert (= (and b!190597 (not c!34278)) b!190601))

(declare-fun m!216585 () Bool)

(assert (=> d!55807 m!216585))

(declare-fun m!216587 () Bool)

(assert (=> d!55807 m!216587))

(declare-fun m!216589 () Bool)

(assert (=> d!55807 m!216589))

(declare-fun m!216591 () Bool)

(assert (=> d!55807 m!216591))

(assert (=> d!55807 m!216587))

(declare-fun m!216593 () Bool)

(assert (=> d!55807 m!216593))

(assert (=> d!55807 m!216493))

(declare-fun m!216595 () Bool)

(assert (=> b!190600 m!216595))

(declare-fun m!216597 () Bool)

(assert (=> b!190601 m!216597))

(assert (=> b!190507 d!55807))

(declare-fun d!55809 () Bool)

(assert (=> d!55809 (= (validMask!0 (mask!9097 thiss!1248)) (and (or (= (mask!9097 thiss!1248) #b00000000000000000000000000000111) (= (mask!9097 thiss!1248) #b00000000000000000000000000001111) (= (mask!9097 thiss!1248) #b00000000000000000000000000011111) (= (mask!9097 thiss!1248) #b00000000000000000000000000111111) (= (mask!9097 thiss!1248) #b00000000000000000000000001111111) (= (mask!9097 thiss!1248) #b00000000000000000000000011111111) (= (mask!9097 thiss!1248) #b00000000000000000000000111111111) (= (mask!9097 thiss!1248) #b00000000000000000000001111111111) (= (mask!9097 thiss!1248) #b00000000000000000000011111111111) (= (mask!9097 thiss!1248) #b00000000000000000000111111111111) (= (mask!9097 thiss!1248) #b00000000000000000001111111111111) (= (mask!9097 thiss!1248) #b00000000000000000011111111111111) (= (mask!9097 thiss!1248) #b00000000000000000111111111111111) (= (mask!9097 thiss!1248) #b00000000000000001111111111111111) (= (mask!9097 thiss!1248) #b00000000000000011111111111111111) (= (mask!9097 thiss!1248) #b00000000000000111111111111111111) (= (mask!9097 thiss!1248) #b00000000000001111111111111111111) (= (mask!9097 thiss!1248) #b00000000000011111111111111111111) (= (mask!9097 thiss!1248) #b00000000000111111111111111111111) (= (mask!9097 thiss!1248) #b00000000001111111111111111111111) (= (mask!9097 thiss!1248) #b00000000011111111111111111111111) (= (mask!9097 thiss!1248) #b00000000111111111111111111111111) (= (mask!9097 thiss!1248) #b00000001111111111111111111111111) (= (mask!9097 thiss!1248) #b00000011111111111111111111111111) (= (mask!9097 thiss!1248) #b00000111111111111111111111111111) (= (mask!9097 thiss!1248) #b00001111111111111111111111111111) (= (mask!9097 thiss!1248) #b00011111111111111111111111111111) (= (mask!9097 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9097 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!190498 d!55809))

(declare-fun d!55811 () Bool)

(declare-fun e!125442 () Bool)

(assert (=> d!55811 e!125442))

(declare-fun res!90071 () Bool)

(assert (=> d!55811 (=> res!90071 e!125442)))

(declare-fun lt!94413 () Bool)

(assert (=> d!55811 (= res!90071 (not lt!94413))))

(declare-fun lt!94410 () Bool)

(assert (=> d!55811 (= lt!94413 lt!94410)))

(declare-fun lt!94411 () Unit!5716)

(declare-fun e!125441 () Unit!5716)

(assert (=> d!55811 (= lt!94411 e!125441)))

(declare-fun c!34281 () Bool)

(assert (=> d!55811 (= c!34281 lt!94410)))

(declare-fun containsKey!239 (List!2399 (_ BitVec 64)) Bool)

(assert (=> d!55811 (= lt!94410 (containsKey!239 (toList!1208 lt!94352) key!828))))

(assert (=> d!55811 (= (contains!1325 lt!94352 key!828) lt!94413)))

(declare-fun b!190608 () Bool)

(declare-fun lt!94412 () Unit!5716)

(assert (=> b!190608 (= e!125441 lt!94412)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!188 (List!2399 (_ BitVec 64)) Unit!5716)

(assert (=> b!190608 (= lt!94412 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1208 lt!94352) key!828))))

(declare-datatypes ((Option!241 0))(
  ( (Some!240 (v!4196 V!5569)) (None!239) )
))
(declare-fun isDefined!189 (Option!241) Bool)

(declare-fun getValueByKey!235 (List!2399 (_ BitVec 64)) Option!241)

(assert (=> b!190608 (isDefined!189 (getValueByKey!235 (toList!1208 lt!94352) key!828))))

(declare-fun b!190609 () Bool)

(declare-fun Unit!5722 () Unit!5716)

(assert (=> b!190609 (= e!125441 Unit!5722)))

(declare-fun b!190610 () Bool)

(assert (=> b!190610 (= e!125442 (isDefined!189 (getValueByKey!235 (toList!1208 lt!94352) key!828)))))

(assert (= (and d!55811 c!34281) b!190608))

(assert (= (and d!55811 (not c!34281)) b!190609))

(assert (= (and d!55811 (not res!90071)) b!190610))

(declare-fun m!216599 () Bool)

(assert (=> d!55811 m!216599))

(declare-fun m!216601 () Bool)

(assert (=> b!190608 m!216601))

(declare-fun m!216603 () Bool)

(assert (=> b!190608 m!216603))

(assert (=> b!190608 m!216603))

(declare-fun m!216605 () Bool)

(assert (=> b!190608 m!216605))

(assert (=> b!190610 m!216603))

(assert (=> b!190610 m!216603))

(assert (=> b!190610 m!216605))

(assert (=> b!190498 d!55811))

(declare-fun b!190653 () Bool)

(declare-fun e!125478 () Bool)

(declare-fun lt!94472 () ListLongMap!2385)

(declare-fun apply!180 (ListLongMap!2385 (_ BitVec 64)) V!5569)

(assert (=> b!190653 (= e!125478 (= (apply!180 lt!94472 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3732 thiss!1248)))))

(declare-fun call!19223 () ListLongMap!2385)

(declare-fun call!19228 () ListLongMap!2385)

(declare-fun bm!19220 () Bool)

(declare-fun c!34296 () Bool)

(declare-fun call!19224 () ListLongMap!2385)

(declare-fun call!19226 () ListLongMap!2385)

(declare-fun c!34298 () Bool)

(assert (=> bm!19220 (= call!19223 (+!300 (ite c!34298 call!19226 (ite c!34296 call!19224 call!19228)) (ite (or c!34298 c!34296) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(declare-fun b!190654 () Bool)

(declare-fun e!125476 () Bool)

(assert (=> b!190654 (= e!125476 (= (apply!180 lt!94472 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3732 thiss!1248)))))

(declare-fun b!190655 () Bool)

(declare-fun e!125480 () Bool)

(declare-fun call!19227 () Bool)

(assert (=> b!190655 (= e!125480 (not call!19227))))

(declare-fun b!190656 () Bool)

(declare-fun e!125475 () ListLongMap!2385)

(declare-fun e!125481 () ListLongMap!2385)

(assert (=> b!190656 (= e!125475 e!125481)))

(assert (=> b!190656 (= c!34296 (and (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!55813 () Bool)

(declare-fun e!125472 () Bool)

(assert (=> d!55813 e!125472))

(declare-fun res!90095 () Bool)

(assert (=> d!55813 (=> (not res!90095) (not e!125472))))

(assert (=> d!55813 (= res!90095 (or (bvsge #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))))

(declare-fun lt!94458 () ListLongMap!2385)

(assert (=> d!55813 (= lt!94472 lt!94458)))

(declare-fun lt!94466 () Unit!5716)

(declare-fun e!125474 () Unit!5716)

(assert (=> d!55813 (= lt!94466 e!125474)))

(declare-fun c!34295 () Bool)

(declare-fun e!125470 () Bool)

(assert (=> d!55813 (= c!34295 e!125470)))

(declare-fun res!90091 () Bool)

(assert (=> d!55813 (=> (not res!90091) (not e!125470))))

(assert (=> d!55813 (= res!90091 (bvslt #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))

(assert (=> d!55813 (= lt!94458 e!125475)))

(assert (=> d!55813 (= c!34298 (and (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55813 (validMask!0 (mask!9097 thiss!1248))))

(assert (=> d!55813 (= (getCurrentListMap!841 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)) lt!94472)))

(declare-fun bm!19221 () Bool)

(assert (=> bm!19221 (= call!19228 call!19224)))

(declare-fun b!190657 () Bool)

(assert (=> b!190657 (= e!125475 (+!300 call!19223 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))

(declare-fun b!190658 () Bool)

(declare-fun res!90096 () Bool)

(assert (=> b!190658 (=> (not res!90096) (not e!125472))))

(declare-fun e!125479 () Bool)

(assert (=> b!190658 (= res!90096 e!125479)))

(declare-fun c!34294 () Bool)

(assert (=> b!190658 (= c!34294 (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!190659 () Bool)

(assert (=> b!190659 (= e!125479 e!125476)))

(declare-fun res!90098 () Bool)

(declare-fun call!19225 () Bool)

(assert (=> b!190659 (= res!90098 call!19225)))

(assert (=> b!190659 (=> (not res!90098) (not e!125476))))

(declare-fun b!190660 () Bool)

(declare-fun e!125471 () ListLongMap!2385)

(assert (=> b!190660 (= e!125471 call!19228)))

(declare-fun b!190661 () Bool)

(declare-fun e!125469 () Bool)

(declare-fun get!2198 (ValueCell!1877 V!5569) V!5569)

(declare-fun dynLambda!514 (Int (_ BitVec 64)) V!5569)

(assert (=> b!190661 (= e!125469 (= (apply!180 lt!94472 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)) (get!2198 (select (arr!3815 (_values!3874 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!190661 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4137 (_values!3874 thiss!1248))))))

(assert (=> b!190661 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))

(declare-fun b!190662 () Bool)

(declare-fun res!90094 () Bool)

(assert (=> b!190662 (=> (not res!90094) (not e!125472))))

(declare-fun e!125477 () Bool)

(assert (=> b!190662 (= res!90094 e!125477)))

(declare-fun res!90092 () Bool)

(assert (=> b!190662 (=> res!90092 e!125477)))

(declare-fun e!125473 () Bool)

(assert (=> b!190662 (= res!90092 (not e!125473))))

(declare-fun res!90097 () Bool)

(assert (=> b!190662 (=> (not res!90097) (not e!125473))))

(assert (=> b!190662 (= res!90097 (bvslt #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))

(declare-fun b!190663 () Bool)

(assert (=> b!190663 (= e!125477 e!125469)))

(declare-fun res!90090 () Bool)

(assert (=> b!190663 (=> (not res!90090) (not e!125469))))

(assert (=> b!190663 (= res!90090 (contains!1325 lt!94472 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190663 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))

(declare-fun b!190664 () Bool)

(assert (=> b!190664 (= e!125472 e!125480)))

(declare-fun c!34297 () Bool)

(assert (=> b!190664 (= c!34297 (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!190665 () Bool)

(declare-fun call!19229 () ListLongMap!2385)

(assert (=> b!190665 (= e!125471 call!19229)))

(declare-fun bm!19222 () Bool)

(assert (=> bm!19222 (= call!19227 (contains!1325 lt!94472 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19223 () Bool)

(assert (=> bm!19223 (= call!19224 call!19226)))

(declare-fun bm!19224 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!201 (array!8097 array!8099 (_ BitVec 32) (_ BitVec 32) V!5569 V!5569 (_ BitVec 32) Int) ListLongMap!2385)

(assert (=> bm!19224 (= call!19226 (getCurrentListMapNoExtraKeys!201 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun b!190666 () Bool)

(declare-fun Unit!5723 () Unit!5716)

(assert (=> b!190666 (= e!125474 Unit!5723)))

(declare-fun bm!19225 () Bool)

(assert (=> bm!19225 (= call!19229 call!19223)))

(declare-fun b!190667 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!190667 (= e!125473 (validKeyInArray!0 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190668 () Bool)

(assert (=> b!190668 (= e!125480 e!125478)))

(declare-fun res!90093 () Bool)

(assert (=> b!190668 (= res!90093 call!19227)))

(assert (=> b!190668 (=> (not res!90093) (not e!125478))))

(declare-fun b!190669 () Bool)

(assert (=> b!190669 (= e!125479 (not call!19225))))

(declare-fun b!190670 () Bool)

(assert (=> b!190670 (= e!125470 (validKeyInArray!0 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190671 () Bool)

(declare-fun lt!94459 () Unit!5716)

(assert (=> b!190671 (= e!125474 lt!94459)))

(declare-fun lt!94477 () ListLongMap!2385)

(assert (=> b!190671 (= lt!94477 (getCurrentListMapNoExtraKeys!201 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun lt!94463 () (_ BitVec 64))

(assert (=> b!190671 (= lt!94463 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94469 () (_ BitVec 64))

(assert (=> b!190671 (= lt!94469 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94478 () Unit!5716)

(declare-fun addStillContains!156 (ListLongMap!2385 (_ BitVec 64) V!5569 (_ BitVec 64)) Unit!5716)

(assert (=> b!190671 (= lt!94478 (addStillContains!156 lt!94477 lt!94463 (zeroValue!3732 thiss!1248) lt!94469))))

(assert (=> b!190671 (contains!1325 (+!300 lt!94477 (tuple2!3477 lt!94463 (zeroValue!3732 thiss!1248))) lt!94469)))

(declare-fun lt!94473 () Unit!5716)

(assert (=> b!190671 (= lt!94473 lt!94478)))

(declare-fun lt!94470 () ListLongMap!2385)

(assert (=> b!190671 (= lt!94470 (getCurrentListMapNoExtraKeys!201 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun lt!94468 () (_ BitVec 64))

(assert (=> b!190671 (= lt!94468 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94461 () (_ BitVec 64))

(assert (=> b!190671 (= lt!94461 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94471 () Unit!5716)

(declare-fun addApplyDifferent!156 (ListLongMap!2385 (_ BitVec 64) V!5569 (_ BitVec 64)) Unit!5716)

(assert (=> b!190671 (= lt!94471 (addApplyDifferent!156 lt!94470 lt!94468 (minValue!3732 thiss!1248) lt!94461))))

(assert (=> b!190671 (= (apply!180 (+!300 lt!94470 (tuple2!3477 lt!94468 (minValue!3732 thiss!1248))) lt!94461) (apply!180 lt!94470 lt!94461))))

(declare-fun lt!94476 () Unit!5716)

(assert (=> b!190671 (= lt!94476 lt!94471)))

(declare-fun lt!94464 () ListLongMap!2385)

(assert (=> b!190671 (= lt!94464 (getCurrentListMapNoExtraKeys!201 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun lt!94475 () (_ BitVec 64))

(assert (=> b!190671 (= lt!94475 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94462 () (_ BitVec 64))

(assert (=> b!190671 (= lt!94462 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94479 () Unit!5716)

(assert (=> b!190671 (= lt!94479 (addApplyDifferent!156 lt!94464 lt!94475 (zeroValue!3732 thiss!1248) lt!94462))))

(assert (=> b!190671 (= (apply!180 (+!300 lt!94464 (tuple2!3477 lt!94475 (zeroValue!3732 thiss!1248))) lt!94462) (apply!180 lt!94464 lt!94462))))

(declare-fun lt!94474 () Unit!5716)

(assert (=> b!190671 (= lt!94474 lt!94479)))

(declare-fun lt!94460 () ListLongMap!2385)

(assert (=> b!190671 (= lt!94460 (getCurrentListMapNoExtraKeys!201 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun lt!94467 () (_ BitVec 64))

(assert (=> b!190671 (= lt!94467 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94465 () (_ BitVec 64))

(assert (=> b!190671 (= lt!94465 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190671 (= lt!94459 (addApplyDifferent!156 lt!94460 lt!94467 (minValue!3732 thiss!1248) lt!94465))))

(assert (=> b!190671 (= (apply!180 (+!300 lt!94460 (tuple2!3477 lt!94467 (minValue!3732 thiss!1248))) lt!94465) (apply!180 lt!94460 lt!94465))))

(declare-fun b!190672 () Bool)

(assert (=> b!190672 (= e!125481 call!19229)))

(declare-fun b!190673 () Bool)

(declare-fun c!34299 () Bool)

(assert (=> b!190673 (= c!34299 (and (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!190673 (= e!125481 e!125471)))

(declare-fun bm!19226 () Bool)

(assert (=> bm!19226 (= call!19225 (contains!1325 lt!94472 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!55813 c!34298) b!190657))

(assert (= (and d!55813 (not c!34298)) b!190656))

(assert (= (and b!190656 c!34296) b!190672))

(assert (= (and b!190656 (not c!34296)) b!190673))

(assert (= (and b!190673 c!34299) b!190665))

(assert (= (and b!190673 (not c!34299)) b!190660))

(assert (= (or b!190665 b!190660) bm!19221))

(assert (= (or b!190672 bm!19221) bm!19223))

(assert (= (or b!190672 b!190665) bm!19225))

(assert (= (or b!190657 bm!19223) bm!19224))

(assert (= (or b!190657 bm!19225) bm!19220))

(assert (= (and d!55813 res!90091) b!190670))

(assert (= (and d!55813 c!34295) b!190671))

(assert (= (and d!55813 (not c!34295)) b!190666))

(assert (= (and d!55813 res!90095) b!190662))

(assert (= (and b!190662 res!90097) b!190667))

(assert (= (and b!190662 (not res!90092)) b!190663))

(assert (= (and b!190663 res!90090) b!190661))

(assert (= (and b!190662 res!90094) b!190658))

(assert (= (and b!190658 c!34294) b!190659))

(assert (= (and b!190658 (not c!34294)) b!190669))

(assert (= (and b!190659 res!90098) b!190654))

(assert (= (or b!190659 b!190669) bm!19226))

(assert (= (and b!190658 res!90096) b!190664))

(assert (= (and b!190664 c!34297) b!190668))

(assert (= (and b!190664 (not c!34297)) b!190655))

(assert (= (and b!190668 res!90093) b!190653))

(assert (= (or b!190668 b!190655) bm!19222))

(declare-fun b_lambda!7349 () Bool)

(assert (=> (not b_lambda!7349) (not b!190661)))

(declare-fun t!7303 () Bool)

(declare-fun tb!2863 () Bool)

(assert (=> (and b!190505 (= (defaultEntry!3891 thiss!1248) (defaultEntry!3891 thiss!1248)) t!7303) tb!2863))

(declare-fun result!4883 () Bool)

(assert (=> tb!2863 (= result!4883 tp_is_empty!4441)))

(assert (=> b!190661 t!7303))

(declare-fun b_and!11307 () Bool)

(assert (= b_and!11301 (and (=> t!7303 result!4883) b_and!11307)))

(declare-fun m!216607 () Bool)

(assert (=> bm!19220 m!216607))

(declare-fun m!216609 () Bool)

(assert (=> b!190661 m!216609))

(declare-fun m!216611 () Bool)

(assert (=> b!190661 m!216611))

(declare-fun m!216613 () Bool)

(assert (=> b!190661 m!216613))

(assert (=> b!190661 m!216611))

(declare-fun m!216615 () Bool)

(assert (=> b!190661 m!216615))

(assert (=> b!190661 m!216613))

(assert (=> b!190661 m!216609))

(declare-fun m!216617 () Bool)

(assert (=> b!190661 m!216617))

(declare-fun m!216619 () Bool)

(assert (=> bm!19224 m!216619))

(declare-fun m!216621 () Bool)

(assert (=> bm!19222 m!216621))

(declare-fun m!216623 () Bool)

(assert (=> b!190671 m!216623))

(declare-fun m!216625 () Bool)

(assert (=> b!190671 m!216625))

(declare-fun m!216627 () Bool)

(assert (=> b!190671 m!216627))

(declare-fun m!216629 () Bool)

(assert (=> b!190671 m!216629))

(assert (=> b!190671 m!216623))

(assert (=> b!190671 m!216611))

(declare-fun m!216631 () Bool)

(assert (=> b!190671 m!216631))

(declare-fun m!216633 () Bool)

(assert (=> b!190671 m!216633))

(declare-fun m!216635 () Bool)

(assert (=> b!190671 m!216635))

(declare-fun m!216637 () Bool)

(assert (=> b!190671 m!216637))

(declare-fun m!216639 () Bool)

(assert (=> b!190671 m!216639))

(assert (=> b!190671 m!216619))

(assert (=> b!190671 m!216637))

(assert (=> b!190671 m!216633))

(declare-fun m!216641 () Bool)

(assert (=> b!190671 m!216641))

(declare-fun m!216643 () Bool)

(assert (=> b!190671 m!216643))

(assert (=> b!190671 m!216627))

(declare-fun m!216645 () Bool)

(assert (=> b!190671 m!216645))

(declare-fun m!216647 () Bool)

(assert (=> b!190671 m!216647))

(declare-fun m!216649 () Bool)

(assert (=> b!190671 m!216649))

(declare-fun m!216651 () Bool)

(assert (=> b!190671 m!216651))

(declare-fun m!216653 () Bool)

(assert (=> b!190657 m!216653))

(assert (=> b!190670 m!216611))

(assert (=> b!190670 m!216611))

(declare-fun m!216655 () Bool)

(assert (=> b!190670 m!216655))

(declare-fun m!216657 () Bool)

(assert (=> bm!19226 m!216657))

(declare-fun m!216659 () Bool)

(assert (=> b!190653 m!216659))

(declare-fun m!216661 () Bool)

(assert (=> b!190654 m!216661))

(assert (=> d!55813 m!216493))

(assert (=> b!190667 m!216611))

(assert (=> b!190667 m!216611))

(assert (=> b!190667 m!216655))

(assert (=> b!190663 m!216611))

(assert (=> b!190663 m!216611))

(declare-fun m!216663 () Bool)

(assert (=> b!190663 m!216663))

(assert (=> b!190498 d!55813))

(declare-fun b!190676 () Bool)

(declare-fun e!125491 () Bool)

(declare-fun lt!94494 () ListLongMap!2385)

(assert (=> b!190676 (= e!125491 (= (apply!180 lt!94494 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3732 thiss!1248)))))

(declare-fun call!19231 () ListLongMap!2385)

(declare-fun call!19235 () ListLongMap!2385)

(declare-fun call!19230 () ListLongMap!2385)

(declare-fun bm!19227 () Bool)

(declare-fun c!34302 () Bool)

(declare-fun call!19233 () ListLongMap!2385)

(declare-fun c!34304 () Bool)

(assert (=> bm!19227 (= call!19230 (+!300 (ite c!34304 call!19233 (ite c!34302 call!19231 call!19235)) (ite (or c!34304 c!34302) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(declare-fun b!190677 () Bool)

(declare-fun e!125489 () Bool)

(assert (=> b!190677 (= e!125489 (= (apply!180 lt!94494 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3732 thiss!1248)))))

(declare-fun b!190678 () Bool)

(declare-fun e!125493 () Bool)

(declare-fun call!19234 () Bool)

(assert (=> b!190678 (= e!125493 (not call!19234))))

(declare-fun b!190679 () Bool)

(declare-fun e!125488 () ListLongMap!2385)

(declare-fun e!125494 () ListLongMap!2385)

(assert (=> b!190679 (= e!125488 e!125494)))

(assert (=> b!190679 (= c!34302 (and (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!55815 () Bool)

(declare-fun e!125485 () Bool)

(assert (=> d!55815 e!125485))

(declare-fun res!90104 () Bool)

(assert (=> d!55815 (=> (not res!90104) (not e!125485))))

(assert (=> d!55815 (= res!90104 (or (bvsge #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))))

(declare-fun lt!94480 () ListLongMap!2385)

(assert (=> d!55815 (= lt!94494 lt!94480)))

(declare-fun lt!94488 () Unit!5716)

(declare-fun e!125487 () Unit!5716)

(assert (=> d!55815 (= lt!94488 e!125487)))

(declare-fun c!34301 () Bool)

(declare-fun e!125483 () Bool)

(assert (=> d!55815 (= c!34301 e!125483)))

(declare-fun res!90100 () Bool)

(assert (=> d!55815 (=> (not res!90100) (not e!125483))))

(assert (=> d!55815 (= res!90100 (bvslt #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))

(assert (=> d!55815 (= lt!94480 e!125488)))

(assert (=> d!55815 (= c!34304 (and (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55815 (validMask!0 (mask!9097 thiss!1248))))

(assert (=> d!55815 (= (getCurrentListMap!841 (_keys!5863 thiss!1248) (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248))) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)) lt!94494)))

(declare-fun bm!19228 () Bool)

(assert (=> bm!19228 (= call!19235 call!19231)))

(declare-fun b!190680 () Bool)

(assert (=> b!190680 (= e!125488 (+!300 call!19230 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))

(declare-fun b!190681 () Bool)

(declare-fun res!90105 () Bool)

(assert (=> b!190681 (=> (not res!90105) (not e!125485))))

(declare-fun e!125492 () Bool)

(assert (=> b!190681 (= res!90105 e!125492)))

(declare-fun c!34300 () Bool)

(assert (=> b!190681 (= c!34300 (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!190682 () Bool)

(assert (=> b!190682 (= e!125492 e!125489)))

(declare-fun res!90107 () Bool)

(declare-fun call!19232 () Bool)

(assert (=> b!190682 (= res!90107 call!19232)))

(assert (=> b!190682 (=> (not res!90107) (not e!125489))))

(declare-fun b!190683 () Bool)

(declare-fun e!125484 () ListLongMap!2385)

(assert (=> b!190683 (= e!125484 call!19235)))

(declare-fun e!125482 () Bool)

(declare-fun b!190684 () Bool)

(assert (=> b!190684 (= e!125482 (= (apply!180 lt!94494 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)) (get!2198 (select (arr!3815 (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!190684 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4137 (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248))))))))

(assert (=> b!190684 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))

(declare-fun b!190685 () Bool)

(declare-fun res!90103 () Bool)

(assert (=> b!190685 (=> (not res!90103) (not e!125485))))

(declare-fun e!125490 () Bool)

(assert (=> b!190685 (= res!90103 e!125490)))

(declare-fun res!90101 () Bool)

(assert (=> b!190685 (=> res!90101 e!125490)))

(declare-fun e!125486 () Bool)

(assert (=> b!190685 (= res!90101 (not e!125486))))

(declare-fun res!90106 () Bool)

(assert (=> b!190685 (=> (not res!90106) (not e!125486))))

(assert (=> b!190685 (= res!90106 (bvslt #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))

(declare-fun b!190686 () Bool)

(assert (=> b!190686 (= e!125490 e!125482)))

(declare-fun res!90099 () Bool)

(assert (=> b!190686 (=> (not res!90099) (not e!125482))))

(assert (=> b!190686 (= res!90099 (contains!1325 lt!94494 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190686 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))

(declare-fun b!190687 () Bool)

(assert (=> b!190687 (= e!125485 e!125493)))

(declare-fun c!34303 () Bool)

(assert (=> b!190687 (= c!34303 (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!190688 () Bool)

(declare-fun call!19236 () ListLongMap!2385)

(assert (=> b!190688 (= e!125484 call!19236)))

(declare-fun bm!19229 () Bool)

(assert (=> bm!19229 (= call!19234 (contains!1325 lt!94494 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19230 () Bool)

(assert (=> bm!19230 (= call!19231 call!19233)))

(declare-fun bm!19231 () Bool)

(assert (=> bm!19231 (= call!19233 (getCurrentListMapNoExtraKeys!201 (_keys!5863 thiss!1248) (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248))) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun b!190689 () Bool)

(declare-fun Unit!5724 () Unit!5716)

(assert (=> b!190689 (= e!125487 Unit!5724)))

(declare-fun bm!19232 () Bool)

(assert (=> bm!19232 (= call!19236 call!19230)))

(declare-fun b!190690 () Bool)

(assert (=> b!190690 (= e!125486 (validKeyInArray!0 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190691 () Bool)

(assert (=> b!190691 (= e!125493 e!125491)))

(declare-fun res!90102 () Bool)

(assert (=> b!190691 (= res!90102 call!19234)))

(assert (=> b!190691 (=> (not res!90102) (not e!125491))))

(declare-fun b!190692 () Bool)

(assert (=> b!190692 (= e!125492 (not call!19232))))

(declare-fun b!190693 () Bool)

(assert (=> b!190693 (= e!125483 (validKeyInArray!0 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190694 () Bool)

(declare-fun lt!94481 () Unit!5716)

(assert (=> b!190694 (= e!125487 lt!94481)))

(declare-fun lt!94499 () ListLongMap!2385)

(assert (=> b!190694 (= lt!94499 (getCurrentListMapNoExtraKeys!201 (_keys!5863 thiss!1248) (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248))) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun lt!94485 () (_ BitVec 64))

(assert (=> b!190694 (= lt!94485 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94491 () (_ BitVec 64))

(assert (=> b!190694 (= lt!94491 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94500 () Unit!5716)

(assert (=> b!190694 (= lt!94500 (addStillContains!156 lt!94499 lt!94485 (zeroValue!3732 thiss!1248) lt!94491))))

(assert (=> b!190694 (contains!1325 (+!300 lt!94499 (tuple2!3477 lt!94485 (zeroValue!3732 thiss!1248))) lt!94491)))

(declare-fun lt!94495 () Unit!5716)

(assert (=> b!190694 (= lt!94495 lt!94500)))

(declare-fun lt!94492 () ListLongMap!2385)

(assert (=> b!190694 (= lt!94492 (getCurrentListMapNoExtraKeys!201 (_keys!5863 thiss!1248) (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248))) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun lt!94490 () (_ BitVec 64))

(assert (=> b!190694 (= lt!94490 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94483 () (_ BitVec 64))

(assert (=> b!190694 (= lt!94483 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94493 () Unit!5716)

(assert (=> b!190694 (= lt!94493 (addApplyDifferent!156 lt!94492 lt!94490 (minValue!3732 thiss!1248) lt!94483))))

(assert (=> b!190694 (= (apply!180 (+!300 lt!94492 (tuple2!3477 lt!94490 (minValue!3732 thiss!1248))) lt!94483) (apply!180 lt!94492 lt!94483))))

(declare-fun lt!94498 () Unit!5716)

(assert (=> b!190694 (= lt!94498 lt!94493)))

(declare-fun lt!94486 () ListLongMap!2385)

(assert (=> b!190694 (= lt!94486 (getCurrentListMapNoExtraKeys!201 (_keys!5863 thiss!1248) (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248))) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun lt!94497 () (_ BitVec 64))

(assert (=> b!190694 (= lt!94497 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94484 () (_ BitVec 64))

(assert (=> b!190694 (= lt!94484 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94501 () Unit!5716)

(assert (=> b!190694 (= lt!94501 (addApplyDifferent!156 lt!94486 lt!94497 (zeroValue!3732 thiss!1248) lt!94484))))

(assert (=> b!190694 (= (apply!180 (+!300 lt!94486 (tuple2!3477 lt!94497 (zeroValue!3732 thiss!1248))) lt!94484) (apply!180 lt!94486 lt!94484))))

(declare-fun lt!94496 () Unit!5716)

(assert (=> b!190694 (= lt!94496 lt!94501)))

(declare-fun lt!94482 () ListLongMap!2385)

(assert (=> b!190694 (= lt!94482 (getCurrentListMapNoExtraKeys!201 (_keys!5863 thiss!1248) (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248))) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(declare-fun lt!94489 () (_ BitVec 64))

(assert (=> b!190694 (= lt!94489 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94487 () (_ BitVec 64))

(assert (=> b!190694 (= lt!94487 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190694 (= lt!94481 (addApplyDifferent!156 lt!94482 lt!94489 (minValue!3732 thiss!1248) lt!94487))))

(assert (=> b!190694 (= (apply!180 (+!300 lt!94482 (tuple2!3477 lt!94489 (minValue!3732 thiss!1248))) lt!94487) (apply!180 lt!94482 lt!94487))))

(declare-fun b!190695 () Bool)

(assert (=> b!190695 (= e!125494 call!19236)))

(declare-fun b!190696 () Bool)

(declare-fun c!34305 () Bool)

(assert (=> b!190696 (= c!34305 (and (not (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3628 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!190696 (= e!125494 e!125484)))

(declare-fun bm!19233 () Bool)

(assert (=> bm!19233 (= call!19232 (contains!1325 lt!94494 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!55815 c!34304) b!190680))

(assert (= (and d!55815 (not c!34304)) b!190679))

(assert (= (and b!190679 c!34302) b!190695))

(assert (= (and b!190679 (not c!34302)) b!190696))

(assert (= (and b!190696 c!34305) b!190688))

(assert (= (and b!190696 (not c!34305)) b!190683))

(assert (= (or b!190688 b!190683) bm!19228))

(assert (= (or b!190695 bm!19228) bm!19230))

(assert (= (or b!190695 b!190688) bm!19232))

(assert (= (or b!190680 bm!19230) bm!19231))

(assert (= (or b!190680 bm!19232) bm!19227))

(assert (= (and d!55815 res!90100) b!190693))

(assert (= (and d!55815 c!34301) b!190694))

(assert (= (and d!55815 (not c!34301)) b!190689))

(assert (= (and d!55815 res!90104) b!190685))

(assert (= (and b!190685 res!90106) b!190690))

(assert (= (and b!190685 (not res!90101)) b!190686))

(assert (= (and b!190686 res!90099) b!190684))

(assert (= (and b!190685 res!90103) b!190681))

(assert (= (and b!190681 c!34300) b!190682))

(assert (= (and b!190681 (not c!34300)) b!190692))

(assert (= (and b!190682 res!90107) b!190677))

(assert (= (or b!190682 b!190692) bm!19233))

(assert (= (and b!190681 res!90105) b!190687))

(assert (= (and b!190687 c!34303) b!190691))

(assert (= (and b!190687 (not c!34303)) b!190678))

(assert (= (and b!190691 res!90102) b!190676))

(assert (= (or b!190691 b!190678) bm!19229))

(declare-fun b_lambda!7351 () Bool)

(assert (=> (not b_lambda!7351) (not b!190684)))

(assert (=> b!190684 t!7303))

(declare-fun b_and!11309 () Bool)

(assert (= b_and!11307 (and (=> t!7303 result!4883) b_and!11309)))

(declare-fun m!216665 () Bool)

(assert (=> bm!19227 m!216665))

(assert (=> b!190684 m!216609))

(assert (=> b!190684 m!216611))

(declare-fun m!216667 () Bool)

(assert (=> b!190684 m!216667))

(assert (=> b!190684 m!216611))

(declare-fun m!216669 () Bool)

(assert (=> b!190684 m!216669))

(assert (=> b!190684 m!216667))

(assert (=> b!190684 m!216609))

(declare-fun m!216671 () Bool)

(assert (=> b!190684 m!216671))

(declare-fun m!216673 () Bool)

(assert (=> bm!19231 m!216673))

(declare-fun m!216675 () Bool)

(assert (=> bm!19229 m!216675))

(declare-fun m!216677 () Bool)

(assert (=> b!190694 m!216677))

(declare-fun m!216679 () Bool)

(assert (=> b!190694 m!216679))

(declare-fun m!216681 () Bool)

(assert (=> b!190694 m!216681))

(declare-fun m!216683 () Bool)

(assert (=> b!190694 m!216683))

(assert (=> b!190694 m!216677))

(assert (=> b!190694 m!216611))

(declare-fun m!216685 () Bool)

(assert (=> b!190694 m!216685))

(declare-fun m!216687 () Bool)

(assert (=> b!190694 m!216687))

(declare-fun m!216689 () Bool)

(assert (=> b!190694 m!216689))

(declare-fun m!216691 () Bool)

(assert (=> b!190694 m!216691))

(declare-fun m!216693 () Bool)

(assert (=> b!190694 m!216693))

(assert (=> b!190694 m!216673))

(assert (=> b!190694 m!216691))

(assert (=> b!190694 m!216687))

(declare-fun m!216695 () Bool)

(assert (=> b!190694 m!216695))

(declare-fun m!216697 () Bool)

(assert (=> b!190694 m!216697))

(assert (=> b!190694 m!216681))

(declare-fun m!216699 () Bool)

(assert (=> b!190694 m!216699))

(declare-fun m!216701 () Bool)

(assert (=> b!190694 m!216701))

(declare-fun m!216703 () Bool)

(assert (=> b!190694 m!216703))

(declare-fun m!216705 () Bool)

(assert (=> b!190694 m!216705))

(declare-fun m!216707 () Bool)

(assert (=> b!190680 m!216707))

(assert (=> b!190693 m!216611))

(assert (=> b!190693 m!216611))

(assert (=> b!190693 m!216655))

(declare-fun m!216709 () Bool)

(assert (=> bm!19233 m!216709))

(declare-fun m!216711 () Bool)

(assert (=> b!190676 m!216711))

(declare-fun m!216713 () Bool)

(assert (=> b!190677 m!216713))

(assert (=> d!55815 m!216493))

(assert (=> b!190690 m!216611))

(assert (=> b!190690 m!216611))

(assert (=> b!190690 m!216655))

(assert (=> b!190686 m!216611))

(assert (=> b!190686 m!216611))

(declare-fun m!216715 () Bool)

(assert (=> b!190686 m!216715))

(assert (=> b!190498 d!55815))

(declare-fun d!55817 () Bool)

(declare-fun e!125497 () Bool)

(assert (=> d!55817 e!125497))

(declare-fun res!90112 () Bool)

(assert (=> d!55817 (=> (not res!90112) (not e!125497))))

(declare-fun lt!94510 () ListLongMap!2385)

(assert (=> d!55817 (= res!90112 (contains!1325 lt!94510 (_1!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun lt!94513 () List!2399)

(assert (=> d!55817 (= lt!94510 (ListLongMap!2386 lt!94513))))

(declare-fun lt!94512 () Unit!5716)

(declare-fun lt!94511 () Unit!5716)

(assert (=> d!55817 (= lt!94512 lt!94511)))

(assert (=> d!55817 (= (getValueByKey!235 lt!94513 (_1!1749 (tuple2!3477 key!828 v!309))) (Some!240 (_2!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!125 (List!2399 (_ BitVec 64) V!5569) Unit!5716)

(assert (=> d!55817 (= lt!94511 (lemmaContainsTupThenGetReturnValue!125 lt!94513 (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun insertStrictlySorted!128 (List!2399 (_ BitVec 64) V!5569) List!2399)

(assert (=> d!55817 (= lt!94513 (insertStrictlySorted!128 (toList!1208 lt!94352) (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309))))))

(assert (=> d!55817 (= (+!300 lt!94352 (tuple2!3477 key!828 v!309)) lt!94510)))

(declare-fun b!190701 () Bool)

(declare-fun res!90113 () Bool)

(assert (=> b!190701 (=> (not res!90113) (not e!125497))))

(assert (=> b!190701 (= res!90113 (= (getValueByKey!235 (toList!1208 lt!94510) (_1!1749 (tuple2!3477 key!828 v!309))) (Some!240 (_2!1749 (tuple2!3477 key!828 v!309)))))))

(declare-fun b!190702 () Bool)

(declare-fun contains!1327 (List!2399 tuple2!3476) Bool)

(assert (=> b!190702 (= e!125497 (contains!1327 (toList!1208 lt!94510) (tuple2!3477 key!828 v!309)))))

(assert (= (and d!55817 res!90112) b!190701))

(assert (= (and b!190701 res!90113) b!190702))

(declare-fun m!216717 () Bool)

(assert (=> d!55817 m!216717))

(declare-fun m!216719 () Bool)

(assert (=> d!55817 m!216719))

(declare-fun m!216721 () Bool)

(assert (=> d!55817 m!216721))

(declare-fun m!216723 () Bool)

(assert (=> d!55817 m!216723))

(declare-fun m!216725 () Bool)

(assert (=> b!190701 m!216725))

(declare-fun m!216727 () Bool)

(assert (=> b!190702 m!216727))

(assert (=> b!190498 d!55817))

(declare-fun d!55819 () Bool)

(declare-fun e!125500 () Bool)

(assert (=> d!55819 e!125500))

(declare-fun res!90116 () Bool)

(assert (=> d!55819 (=> (not res!90116) (not e!125500))))

(assert (=> d!55819 (= res!90116 (and (bvsge (index!4879 lt!94354) #b00000000000000000000000000000000) (bvslt (index!4879 lt!94354) (size!4137 (_values!3874 thiss!1248)))))))

(declare-fun lt!94516 () Unit!5716)

(declare-fun choose!1034 (array!8097 array!8099 (_ BitVec 32) (_ BitVec 32) V!5569 V!5569 (_ BitVec 32) (_ BitVec 64) V!5569 Int) Unit!5716)

(assert (=> d!55819 (= lt!94516 (choose!1034 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) (index!4879 lt!94354) key!828 v!309 (defaultEntry!3891 thiss!1248)))))

(assert (=> d!55819 (validMask!0 (mask!9097 thiss!1248))))

(assert (=> d!55819 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!116 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) (index!4879 lt!94354) key!828 v!309 (defaultEntry!3891 thiss!1248)) lt!94516)))

(declare-fun b!190705 () Bool)

(assert (=> b!190705 (= e!125500 (= (+!300 (getCurrentListMap!841 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)) (tuple2!3477 key!828 v!309)) (getCurrentListMap!841 (_keys!5863 thiss!1248) (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248))) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248))))))

(assert (= (and d!55819 res!90116) b!190705))

(declare-fun m!216729 () Bool)

(assert (=> d!55819 m!216729))

(assert (=> d!55819 m!216493))

(assert (=> b!190705 m!216483))

(assert (=> b!190705 m!216483))

(declare-fun m!216731 () Bool)

(assert (=> b!190705 m!216731))

(assert (=> b!190705 m!216481))

(assert (=> b!190705 m!216487))

(assert (=> b!190498 d!55819))

(declare-fun b!190722 () Bool)

(declare-fun lt!94522 () SeekEntryResult!677)

(assert (=> b!190722 (and (bvsge (index!4878 lt!94522) #b00000000000000000000000000000000) (bvslt (index!4878 lt!94522) (size!4136 (_keys!5863 thiss!1248))))))

(declare-fun res!90126 () Bool)

(assert (=> b!190722 (= res!90126 (= (select (arr!3814 (_keys!5863 thiss!1248)) (index!4878 lt!94522)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!125511 () Bool)

(assert (=> b!190722 (=> (not res!90126) (not e!125511))))

(declare-fun b!190723 () Bool)

(declare-fun e!125510 () Bool)

(declare-fun e!125509 () Bool)

(assert (=> b!190723 (= e!125510 e!125509)))

(declare-fun c!34311 () Bool)

(assert (=> b!190723 (= c!34311 ((_ is MissingVacant!677) lt!94522))))

(declare-fun b!190724 () Bool)

(declare-fun call!19241 () Bool)

(assert (=> b!190724 (= e!125511 (not call!19241))))

(declare-fun bm!19238 () Bool)

(declare-fun arrayContainsKey!0 (array!8097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19238 (= call!19241 (arrayContainsKey!0 (_keys!5863 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!190725 () Bool)

(declare-fun e!125512 () Bool)

(assert (=> b!190725 (= e!125512 (not call!19241))))

(declare-fun c!34310 () Bool)

(declare-fun bm!19239 () Bool)

(declare-fun call!19242 () Bool)

(assert (=> bm!19239 (= call!19242 (inRange!0 (ite c!34310 (index!4878 lt!94522) (index!4881 lt!94522)) (mask!9097 thiss!1248)))))

(declare-fun b!190726 () Bool)

(assert (=> b!190726 (= e!125509 ((_ is Undefined!677) lt!94522))))

(declare-fun b!190727 () Bool)

(assert (=> b!190727 (= e!125510 e!125511)))

(declare-fun res!90128 () Bool)

(assert (=> b!190727 (= res!90128 call!19242)))

(assert (=> b!190727 (=> (not res!90128) (not e!125511))))

(declare-fun d!55821 () Bool)

(assert (=> d!55821 e!125510))

(assert (=> d!55821 (= c!34310 ((_ is MissingZero!677) lt!94522))))

(assert (=> d!55821 (= lt!94522 (seekEntryOrOpen!0 key!828 (_keys!5863 thiss!1248) (mask!9097 thiss!1248)))))

(declare-fun lt!94521 () Unit!5716)

(declare-fun choose!1035 (array!8097 array!8099 (_ BitVec 32) (_ BitVec 32) V!5569 V!5569 (_ BitVec 64) Int) Unit!5716)

(assert (=> d!55821 (= lt!94521 (choose!1035 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) key!828 (defaultEntry!3891 thiss!1248)))))

(assert (=> d!55821 (validMask!0 (mask!9097 thiss!1248))))

(assert (=> d!55821 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!166 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) key!828 (defaultEntry!3891 thiss!1248)) lt!94521)))

(declare-fun b!190728 () Bool)

(declare-fun res!90127 () Bool)

(assert (=> b!190728 (=> (not res!90127) (not e!125512))))

(assert (=> b!190728 (= res!90127 call!19242)))

(assert (=> b!190728 (= e!125509 e!125512)))

(declare-fun b!190729 () Bool)

(declare-fun res!90125 () Bool)

(assert (=> b!190729 (=> (not res!90125) (not e!125512))))

(assert (=> b!190729 (= res!90125 (= (select (arr!3814 (_keys!5863 thiss!1248)) (index!4881 lt!94522)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190729 (and (bvsge (index!4881 lt!94522) #b00000000000000000000000000000000) (bvslt (index!4881 lt!94522) (size!4136 (_keys!5863 thiss!1248))))))

(assert (= (and d!55821 c!34310) b!190727))

(assert (= (and d!55821 (not c!34310)) b!190723))

(assert (= (and b!190727 res!90128) b!190722))

(assert (= (and b!190722 res!90126) b!190724))

(assert (= (and b!190723 c!34311) b!190728))

(assert (= (and b!190723 (not c!34311)) b!190726))

(assert (= (and b!190728 res!90127) b!190729))

(assert (= (and b!190729 res!90125) b!190725))

(assert (= (or b!190727 b!190728) bm!19239))

(assert (= (or b!190724 b!190725) bm!19238))

(assert (=> d!55821 m!216495))

(declare-fun m!216733 () Bool)

(assert (=> d!55821 m!216733))

(assert (=> d!55821 m!216493))

(declare-fun m!216735 () Bool)

(assert (=> b!190722 m!216735))

(declare-fun m!216737 () Bool)

(assert (=> bm!19239 m!216737))

(declare-fun m!216739 () Bool)

(assert (=> bm!19238 m!216739))

(declare-fun m!216741 () Bool)

(assert (=> b!190729 m!216741))

(assert (=> b!190503 d!55821))

(declare-fun d!55823 () Bool)

(declare-fun e!125515 () Bool)

(assert (=> d!55823 e!125515))

(declare-fun res!90133 () Bool)

(assert (=> d!55823 (=> (not res!90133) (not e!125515))))

(declare-fun lt!94528 () SeekEntryResult!677)

(assert (=> d!55823 (= res!90133 ((_ is Found!677) lt!94528))))

(assert (=> d!55823 (= lt!94528 (seekEntryOrOpen!0 key!828 (_keys!5863 thiss!1248) (mask!9097 thiss!1248)))))

(declare-fun lt!94527 () Unit!5716)

(declare-fun choose!1036 (array!8097 array!8099 (_ BitVec 32) (_ BitVec 32) V!5569 V!5569 (_ BitVec 64) Int) Unit!5716)

(assert (=> d!55823 (= lt!94527 (choose!1036 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) key!828 (defaultEntry!3891 thiss!1248)))))

(assert (=> d!55823 (validMask!0 (mask!9097 thiss!1248))))

(assert (=> d!55823 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!168 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) key!828 (defaultEntry!3891 thiss!1248)) lt!94527)))

(declare-fun b!190734 () Bool)

(declare-fun res!90134 () Bool)

(assert (=> b!190734 (=> (not res!90134) (not e!125515))))

(assert (=> b!190734 (= res!90134 (inRange!0 (index!4879 lt!94528) (mask!9097 thiss!1248)))))

(declare-fun b!190735 () Bool)

(assert (=> b!190735 (= e!125515 (= (select (arr!3814 (_keys!5863 thiss!1248)) (index!4879 lt!94528)) key!828))))

(assert (=> b!190735 (and (bvsge (index!4879 lt!94528) #b00000000000000000000000000000000) (bvslt (index!4879 lt!94528) (size!4136 (_keys!5863 thiss!1248))))))

(assert (= (and d!55823 res!90133) b!190734))

(assert (= (and b!190734 res!90134) b!190735))

(assert (=> d!55823 m!216495))

(declare-fun m!216743 () Bool)

(assert (=> d!55823 m!216743))

(assert (=> d!55823 m!216493))

(declare-fun m!216745 () Bool)

(assert (=> b!190734 m!216745))

(declare-fun m!216747 () Bool)

(assert (=> b!190735 m!216747))

(assert (=> b!190504 d!55823))

(declare-fun d!55825 () Bool)

(assert (=> d!55825 (= (inRange!0 (index!4879 lt!94354) (mask!9097 thiss!1248)) (and (bvsge (index!4879 lt!94354) #b00000000000000000000000000000000) (bvslt (index!4879 lt!94354) (bvadd (mask!9097 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!190504 d!55825))

(declare-fun b!190742 () Bool)

(declare-fun e!125520 () Bool)

(assert (=> b!190742 (= e!125520 tp_is_empty!4441)))

(declare-fun mapNonEmpty!7676 () Bool)

(declare-fun mapRes!7676 () Bool)

(declare-fun tp!16865 () Bool)

(assert (=> mapNonEmpty!7676 (= mapRes!7676 (and tp!16865 e!125520))))

(declare-fun mapKey!7676 () (_ BitVec 32))

(declare-fun mapRest!7676 () (Array (_ BitVec 32) ValueCell!1877))

(declare-fun mapValue!7676 () ValueCell!1877)

(assert (=> mapNonEmpty!7676 (= mapRest!7667 (store mapRest!7676 mapKey!7676 mapValue!7676))))

(declare-fun condMapEmpty!7676 () Bool)

(declare-fun mapDefault!7676 () ValueCell!1877)

(assert (=> mapNonEmpty!7667 (= condMapEmpty!7676 (= mapRest!7667 ((as const (Array (_ BitVec 32) ValueCell!1877)) mapDefault!7676)))))

(declare-fun e!125521 () Bool)

(assert (=> mapNonEmpty!7667 (= tp!16849 (and e!125521 mapRes!7676))))

(declare-fun b!190743 () Bool)

(assert (=> b!190743 (= e!125521 tp_is_empty!4441)))

(declare-fun mapIsEmpty!7676 () Bool)

(assert (=> mapIsEmpty!7676 mapRes!7676))

(assert (= (and mapNonEmpty!7667 condMapEmpty!7676) mapIsEmpty!7676))

(assert (= (and mapNonEmpty!7667 (not condMapEmpty!7676)) mapNonEmpty!7676))

(assert (= (and mapNonEmpty!7676 ((_ is ValueCellFull!1877) mapValue!7676)) b!190742))

(assert (= (and mapNonEmpty!7667 ((_ is ValueCellFull!1877) mapDefault!7676)) b!190743))

(declare-fun m!216749 () Bool)

(assert (=> mapNonEmpty!7676 m!216749))

(declare-fun b_lambda!7353 () Bool)

(assert (= b_lambda!7349 (or (and b!190505 b_free!4669) b_lambda!7353)))

(declare-fun b_lambda!7355 () Bool)

(assert (= b_lambda!7351 (or (and b!190505 b_free!4669) b_lambda!7355)))

(check-sat (not b!190610) (not b!190657) (not d!55807) (not b!190676) (not b!190702) (not bm!19233) (not bm!19231) (not d!55805) (not mapNonEmpty!7676) (not b!190701) (not b!190671) (not b!190677) (not b!190670) tp_is_empty!4441 (not b_lambda!7355) (not bm!19220) (not b!190680) (not b!190690) (not b!190582) (not bm!19222) (not b!190661) (not bm!19239) (not d!55813) (not bm!19227) (not d!55821) (not d!55815) (not b!190601) (not b_next!4669) (not d!55817) (not b!190608) (not b!190684) (not b_lambda!7353) (not d!55811) (not b!190734) (not b!190705) b_and!11309 (not b!190667) (not b!190654) (not bm!19238) (not bm!19224) (not b!190581) (not bm!19226) (not b!190653) (not b!190583) (not b!190663) (not d!55819) (not d!55823) (not b!190693) (not bm!19229) (not b!190694) (not b!190686))
(check-sat b_and!11309 (not b_next!4669))
(get-model)

(declare-fun d!55827 () Bool)

(declare-fun get!2199 (Option!241) V!5569)

(assert (=> d!55827 (= (apply!180 lt!94472 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2199 (getValueByKey!235 (toList!1208 lt!94472) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7611 () Bool)

(assert (= bs!7611 d!55827))

(declare-fun m!216751 () Bool)

(assert (=> bs!7611 m!216751))

(assert (=> bs!7611 m!216751))

(declare-fun m!216753 () Bool)

(assert (=> bs!7611 m!216753))

(assert (=> b!190654 d!55827))

(declare-fun d!55829 () Bool)

(declare-fun e!125523 () Bool)

(assert (=> d!55829 e!125523))

(declare-fun res!90135 () Bool)

(assert (=> d!55829 (=> res!90135 e!125523)))

(declare-fun lt!94532 () Bool)

(assert (=> d!55829 (= res!90135 (not lt!94532))))

(declare-fun lt!94529 () Bool)

(assert (=> d!55829 (= lt!94532 lt!94529)))

(declare-fun lt!94530 () Unit!5716)

(declare-fun e!125522 () Unit!5716)

(assert (=> d!55829 (= lt!94530 e!125522)))

(declare-fun c!34312 () Bool)

(assert (=> d!55829 (= c!34312 lt!94529)))

(assert (=> d!55829 (= lt!94529 (containsKey!239 (toList!1208 lt!94494) (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55829 (= (contains!1325 lt!94494 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)) lt!94532)))

(declare-fun b!190744 () Bool)

(declare-fun lt!94531 () Unit!5716)

(assert (=> b!190744 (= e!125522 lt!94531)))

(assert (=> b!190744 (= lt!94531 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1208 lt!94494) (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190744 (isDefined!189 (getValueByKey!235 (toList!1208 lt!94494) (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190745 () Bool)

(declare-fun Unit!5725 () Unit!5716)

(assert (=> b!190745 (= e!125522 Unit!5725)))

(declare-fun b!190746 () Bool)

(assert (=> b!190746 (= e!125523 (isDefined!189 (getValueByKey!235 (toList!1208 lt!94494) (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55829 c!34312) b!190744))

(assert (= (and d!55829 (not c!34312)) b!190745))

(assert (= (and d!55829 (not res!90135)) b!190746))

(assert (=> d!55829 m!216611))

(declare-fun m!216755 () Bool)

(assert (=> d!55829 m!216755))

(assert (=> b!190744 m!216611))

(declare-fun m!216757 () Bool)

(assert (=> b!190744 m!216757))

(assert (=> b!190744 m!216611))

(declare-fun m!216759 () Bool)

(assert (=> b!190744 m!216759))

(assert (=> b!190744 m!216759))

(declare-fun m!216761 () Bool)

(assert (=> b!190744 m!216761))

(assert (=> b!190746 m!216611))

(assert (=> b!190746 m!216759))

(assert (=> b!190746 m!216759))

(assert (=> b!190746 m!216761))

(assert (=> b!190686 d!55829))

(declare-fun d!55831 () Bool)

(assert (=> d!55831 (contains!1325 (+!300 lt!94477 (tuple2!3477 lt!94463 (zeroValue!3732 thiss!1248))) lt!94469)))

(declare-fun lt!94535 () Unit!5716)

(declare-fun choose!1037 (ListLongMap!2385 (_ BitVec 64) V!5569 (_ BitVec 64)) Unit!5716)

(assert (=> d!55831 (= lt!94535 (choose!1037 lt!94477 lt!94463 (zeroValue!3732 thiss!1248) lt!94469))))

(assert (=> d!55831 (contains!1325 lt!94477 lt!94469)))

(assert (=> d!55831 (= (addStillContains!156 lt!94477 lt!94463 (zeroValue!3732 thiss!1248) lt!94469) lt!94535)))

(declare-fun bs!7612 () Bool)

(assert (= bs!7612 d!55831))

(assert (=> bs!7612 m!216623))

(assert (=> bs!7612 m!216623))

(assert (=> bs!7612 m!216625))

(declare-fun m!216763 () Bool)

(assert (=> bs!7612 m!216763))

(declare-fun m!216765 () Bool)

(assert (=> bs!7612 m!216765))

(assert (=> b!190671 d!55831))

(declare-fun d!55833 () Bool)

(assert (=> d!55833 (= (apply!180 (+!300 lt!94464 (tuple2!3477 lt!94475 (zeroValue!3732 thiss!1248))) lt!94462) (get!2199 (getValueByKey!235 (toList!1208 (+!300 lt!94464 (tuple2!3477 lt!94475 (zeroValue!3732 thiss!1248)))) lt!94462)))))

(declare-fun bs!7613 () Bool)

(assert (= bs!7613 d!55833))

(declare-fun m!216767 () Bool)

(assert (=> bs!7613 m!216767))

(assert (=> bs!7613 m!216767))

(declare-fun m!216769 () Bool)

(assert (=> bs!7613 m!216769))

(assert (=> b!190671 d!55833))

(declare-fun d!55835 () Bool)

(assert (=> d!55835 (= (apply!180 lt!94460 lt!94465) (get!2199 (getValueByKey!235 (toList!1208 lt!94460) lt!94465)))))

(declare-fun bs!7614 () Bool)

(assert (= bs!7614 d!55835))

(declare-fun m!216771 () Bool)

(assert (=> bs!7614 m!216771))

(assert (=> bs!7614 m!216771))

(declare-fun m!216773 () Bool)

(assert (=> bs!7614 m!216773))

(assert (=> b!190671 d!55835))

(declare-fun d!55837 () Bool)

(assert (=> d!55837 (= (apply!180 (+!300 lt!94460 (tuple2!3477 lt!94467 (minValue!3732 thiss!1248))) lt!94465) (get!2199 (getValueByKey!235 (toList!1208 (+!300 lt!94460 (tuple2!3477 lt!94467 (minValue!3732 thiss!1248)))) lt!94465)))))

(declare-fun bs!7615 () Bool)

(assert (= bs!7615 d!55837))

(declare-fun m!216775 () Bool)

(assert (=> bs!7615 m!216775))

(assert (=> bs!7615 m!216775))

(declare-fun m!216777 () Bool)

(assert (=> bs!7615 m!216777))

(assert (=> b!190671 d!55837))

(declare-fun d!55839 () Bool)

(assert (=> d!55839 (= (apply!180 (+!300 lt!94470 (tuple2!3477 lt!94468 (minValue!3732 thiss!1248))) lt!94461) (get!2199 (getValueByKey!235 (toList!1208 (+!300 lt!94470 (tuple2!3477 lt!94468 (minValue!3732 thiss!1248)))) lt!94461)))))

(declare-fun bs!7616 () Bool)

(assert (= bs!7616 d!55839))

(declare-fun m!216779 () Bool)

(assert (=> bs!7616 m!216779))

(assert (=> bs!7616 m!216779))

(declare-fun m!216781 () Bool)

(assert (=> bs!7616 m!216781))

(assert (=> b!190671 d!55839))

(declare-fun d!55841 () Bool)

(declare-fun e!125524 () Bool)

(assert (=> d!55841 e!125524))

(declare-fun res!90136 () Bool)

(assert (=> d!55841 (=> (not res!90136) (not e!125524))))

(declare-fun lt!94536 () ListLongMap!2385)

(assert (=> d!55841 (= res!90136 (contains!1325 lt!94536 (_1!1749 (tuple2!3477 lt!94463 (zeroValue!3732 thiss!1248)))))))

(declare-fun lt!94539 () List!2399)

(assert (=> d!55841 (= lt!94536 (ListLongMap!2386 lt!94539))))

(declare-fun lt!94538 () Unit!5716)

(declare-fun lt!94537 () Unit!5716)

(assert (=> d!55841 (= lt!94538 lt!94537)))

(assert (=> d!55841 (= (getValueByKey!235 lt!94539 (_1!1749 (tuple2!3477 lt!94463 (zeroValue!3732 thiss!1248)))) (Some!240 (_2!1749 (tuple2!3477 lt!94463 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!55841 (= lt!94537 (lemmaContainsTupThenGetReturnValue!125 lt!94539 (_1!1749 (tuple2!3477 lt!94463 (zeroValue!3732 thiss!1248))) (_2!1749 (tuple2!3477 lt!94463 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!55841 (= lt!94539 (insertStrictlySorted!128 (toList!1208 lt!94477) (_1!1749 (tuple2!3477 lt!94463 (zeroValue!3732 thiss!1248))) (_2!1749 (tuple2!3477 lt!94463 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!55841 (= (+!300 lt!94477 (tuple2!3477 lt!94463 (zeroValue!3732 thiss!1248))) lt!94536)))

(declare-fun b!190748 () Bool)

(declare-fun res!90137 () Bool)

(assert (=> b!190748 (=> (not res!90137) (not e!125524))))

(assert (=> b!190748 (= res!90137 (= (getValueByKey!235 (toList!1208 lt!94536) (_1!1749 (tuple2!3477 lt!94463 (zeroValue!3732 thiss!1248)))) (Some!240 (_2!1749 (tuple2!3477 lt!94463 (zeroValue!3732 thiss!1248))))))))

(declare-fun b!190749 () Bool)

(assert (=> b!190749 (= e!125524 (contains!1327 (toList!1208 lt!94536) (tuple2!3477 lt!94463 (zeroValue!3732 thiss!1248))))))

(assert (= (and d!55841 res!90136) b!190748))

(assert (= (and b!190748 res!90137) b!190749))

(declare-fun m!216783 () Bool)

(assert (=> d!55841 m!216783))

(declare-fun m!216785 () Bool)

(assert (=> d!55841 m!216785))

(declare-fun m!216787 () Bool)

(assert (=> d!55841 m!216787))

(declare-fun m!216789 () Bool)

(assert (=> d!55841 m!216789))

(declare-fun m!216791 () Bool)

(assert (=> b!190748 m!216791))

(declare-fun m!216793 () Bool)

(assert (=> b!190749 m!216793))

(assert (=> b!190671 d!55841))

(declare-fun d!55843 () Bool)

(assert (=> d!55843 (= (apply!180 (+!300 lt!94460 (tuple2!3477 lt!94467 (minValue!3732 thiss!1248))) lt!94465) (apply!180 lt!94460 lt!94465))))

(declare-fun lt!94542 () Unit!5716)

(declare-fun choose!1038 (ListLongMap!2385 (_ BitVec 64) V!5569 (_ BitVec 64)) Unit!5716)

(assert (=> d!55843 (= lt!94542 (choose!1038 lt!94460 lt!94467 (minValue!3732 thiss!1248) lt!94465))))

(declare-fun e!125527 () Bool)

(assert (=> d!55843 e!125527))

(declare-fun res!90140 () Bool)

(assert (=> d!55843 (=> (not res!90140) (not e!125527))))

(assert (=> d!55843 (= res!90140 (contains!1325 lt!94460 lt!94465))))

(assert (=> d!55843 (= (addApplyDifferent!156 lt!94460 lt!94467 (minValue!3732 thiss!1248) lt!94465) lt!94542)))

(declare-fun b!190753 () Bool)

(assert (=> b!190753 (= e!125527 (not (= lt!94465 lt!94467)))))

(assert (= (and d!55843 res!90140) b!190753))

(assert (=> d!55843 m!216627))

(declare-fun m!216795 () Bool)

(assert (=> d!55843 m!216795))

(assert (=> d!55843 m!216627))

(assert (=> d!55843 m!216645))

(declare-fun m!216797 () Bool)

(assert (=> d!55843 m!216797))

(assert (=> d!55843 m!216643))

(assert (=> b!190671 d!55843))

(declare-fun d!55845 () Bool)

(assert (=> d!55845 (= (apply!180 lt!94470 lt!94461) (get!2199 (getValueByKey!235 (toList!1208 lt!94470) lt!94461)))))

(declare-fun bs!7617 () Bool)

(assert (= bs!7617 d!55845))

(declare-fun m!216799 () Bool)

(assert (=> bs!7617 m!216799))

(assert (=> bs!7617 m!216799))

(declare-fun m!216801 () Bool)

(assert (=> bs!7617 m!216801))

(assert (=> b!190671 d!55845))

(declare-fun d!55847 () Bool)

(declare-fun e!125528 () Bool)

(assert (=> d!55847 e!125528))

(declare-fun res!90141 () Bool)

(assert (=> d!55847 (=> (not res!90141) (not e!125528))))

(declare-fun lt!94543 () ListLongMap!2385)

(assert (=> d!55847 (= res!90141 (contains!1325 lt!94543 (_1!1749 (tuple2!3477 lt!94467 (minValue!3732 thiss!1248)))))))

(declare-fun lt!94546 () List!2399)

(assert (=> d!55847 (= lt!94543 (ListLongMap!2386 lt!94546))))

(declare-fun lt!94545 () Unit!5716)

(declare-fun lt!94544 () Unit!5716)

(assert (=> d!55847 (= lt!94545 lt!94544)))

(assert (=> d!55847 (= (getValueByKey!235 lt!94546 (_1!1749 (tuple2!3477 lt!94467 (minValue!3732 thiss!1248)))) (Some!240 (_2!1749 (tuple2!3477 lt!94467 (minValue!3732 thiss!1248)))))))

(assert (=> d!55847 (= lt!94544 (lemmaContainsTupThenGetReturnValue!125 lt!94546 (_1!1749 (tuple2!3477 lt!94467 (minValue!3732 thiss!1248))) (_2!1749 (tuple2!3477 lt!94467 (minValue!3732 thiss!1248)))))))

(assert (=> d!55847 (= lt!94546 (insertStrictlySorted!128 (toList!1208 lt!94460) (_1!1749 (tuple2!3477 lt!94467 (minValue!3732 thiss!1248))) (_2!1749 (tuple2!3477 lt!94467 (minValue!3732 thiss!1248)))))))

(assert (=> d!55847 (= (+!300 lt!94460 (tuple2!3477 lt!94467 (minValue!3732 thiss!1248))) lt!94543)))

(declare-fun b!190754 () Bool)

(declare-fun res!90142 () Bool)

(assert (=> b!190754 (=> (not res!90142) (not e!125528))))

(assert (=> b!190754 (= res!90142 (= (getValueByKey!235 (toList!1208 lt!94543) (_1!1749 (tuple2!3477 lt!94467 (minValue!3732 thiss!1248)))) (Some!240 (_2!1749 (tuple2!3477 lt!94467 (minValue!3732 thiss!1248))))))))

(declare-fun b!190755 () Bool)

(assert (=> b!190755 (= e!125528 (contains!1327 (toList!1208 lt!94543) (tuple2!3477 lt!94467 (minValue!3732 thiss!1248))))))

(assert (= (and d!55847 res!90141) b!190754))

(assert (= (and b!190754 res!90142) b!190755))

(declare-fun m!216803 () Bool)

(assert (=> d!55847 m!216803))

(declare-fun m!216805 () Bool)

(assert (=> d!55847 m!216805))

(declare-fun m!216807 () Bool)

(assert (=> d!55847 m!216807))

(declare-fun m!216809 () Bool)

(assert (=> d!55847 m!216809))

(declare-fun m!216811 () Bool)

(assert (=> b!190754 m!216811))

(declare-fun m!216813 () Bool)

(assert (=> b!190755 m!216813))

(assert (=> b!190671 d!55847))

(declare-fun d!55849 () Bool)

(declare-fun e!125530 () Bool)

(assert (=> d!55849 e!125530))

(declare-fun res!90143 () Bool)

(assert (=> d!55849 (=> res!90143 e!125530)))

(declare-fun lt!94550 () Bool)

(assert (=> d!55849 (= res!90143 (not lt!94550))))

(declare-fun lt!94547 () Bool)

(assert (=> d!55849 (= lt!94550 lt!94547)))

(declare-fun lt!94548 () Unit!5716)

(declare-fun e!125529 () Unit!5716)

(assert (=> d!55849 (= lt!94548 e!125529)))

(declare-fun c!34313 () Bool)

(assert (=> d!55849 (= c!34313 lt!94547)))

(assert (=> d!55849 (= lt!94547 (containsKey!239 (toList!1208 (+!300 lt!94477 (tuple2!3477 lt!94463 (zeroValue!3732 thiss!1248)))) lt!94469))))

(assert (=> d!55849 (= (contains!1325 (+!300 lt!94477 (tuple2!3477 lt!94463 (zeroValue!3732 thiss!1248))) lt!94469) lt!94550)))

(declare-fun b!190756 () Bool)

(declare-fun lt!94549 () Unit!5716)

(assert (=> b!190756 (= e!125529 lt!94549)))

(assert (=> b!190756 (= lt!94549 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1208 (+!300 lt!94477 (tuple2!3477 lt!94463 (zeroValue!3732 thiss!1248)))) lt!94469))))

(assert (=> b!190756 (isDefined!189 (getValueByKey!235 (toList!1208 (+!300 lt!94477 (tuple2!3477 lt!94463 (zeroValue!3732 thiss!1248)))) lt!94469))))

(declare-fun b!190757 () Bool)

(declare-fun Unit!5726 () Unit!5716)

(assert (=> b!190757 (= e!125529 Unit!5726)))

(declare-fun b!190758 () Bool)

(assert (=> b!190758 (= e!125530 (isDefined!189 (getValueByKey!235 (toList!1208 (+!300 lt!94477 (tuple2!3477 lt!94463 (zeroValue!3732 thiss!1248)))) lt!94469)))))

(assert (= (and d!55849 c!34313) b!190756))

(assert (= (and d!55849 (not c!34313)) b!190757))

(assert (= (and d!55849 (not res!90143)) b!190758))

(declare-fun m!216815 () Bool)

(assert (=> d!55849 m!216815))

(declare-fun m!216817 () Bool)

(assert (=> b!190756 m!216817))

(declare-fun m!216819 () Bool)

(assert (=> b!190756 m!216819))

(assert (=> b!190756 m!216819))

(declare-fun m!216821 () Bool)

(assert (=> b!190756 m!216821))

(assert (=> b!190758 m!216819))

(assert (=> b!190758 m!216819))

(assert (=> b!190758 m!216821))

(assert (=> b!190671 d!55849))

(declare-fun d!55851 () Bool)

(assert (=> d!55851 (= (apply!180 (+!300 lt!94464 (tuple2!3477 lt!94475 (zeroValue!3732 thiss!1248))) lt!94462) (apply!180 lt!94464 lt!94462))))

(declare-fun lt!94551 () Unit!5716)

(assert (=> d!55851 (= lt!94551 (choose!1038 lt!94464 lt!94475 (zeroValue!3732 thiss!1248) lt!94462))))

(declare-fun e!125531 () Bool)

(assert (=> d!55851 e!125531))

(declare-fun res!90144 () Bool)

(assert (=> d!55851 (=> (not res!90144) (not e!125531))))

(assert (=> d!55851 (= res!90144 (contains!1325 lt!94464 lt!94462))))

(assert (=> d!55851 (= (addApplyDifferent!156 lt!94464 lt!94475 (zeroValue!3732 thiss!1248) lt!94462) lt!94551)))

(declare-fun b!190759 () Bool)

(assert (=> b!190759 (= e!125531 (not (= lt!94462 lt!94475)))))

(assert (= (and d!55851 res!90144) b!190759))

(assert (=> d!55851 m!216633))

(declare-fun m!216823 () Bool)

(assert (=> d!55851 m!216823))

(assert (=> d!55851 m!216633))

(assert (=> d!55851 m!216641))

(declare-fun m!216825 () Bool)

(assert (=> d!55851 m!216825))

(assert (=> d!55851 m!216629))

(assert (=> b!190671 d!55851))

(declare-fun b!190784 () Bool)

(declare-fun e!125547 () Bool)

(declare-fun e!125550 () Bool)

(assert (=> b!190784 (= e!125547 e!125550)))

(assert (=> b!190784 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))

(declare-fun res!90153 () Bool)

(declare-fun lt!94568 () ListLongMap!2385)

(assert (=> b!190784 (= res!90153 (contains!1325 lt!94568 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190784 (=> (not res!90153) (not e!125550))))

(declare-fun bm!19242 () Bool)

(declare-fun call!19245 () ListLongMap!2385)

(assert (=> bm!19242 (= call!19245 (getCurrentListMapNoExtraKeys!201 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3891 thiss!1248)))))

(declare-fun b!190785 () Bool)

(declare-fun e!125549 () ListLongMap!2385)

(assert (=> b!190785 (= e!125549 call!19245)))

(declare-fun b!190786 () Bool)

(declare-fun e!125552 () Bool)

(assert (=> b!190786 (= e!125552 (= lt!94568 (getCurrentListMapNoExtraKeys!201 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3891 thiss!1248))))))

(declare-fun b!190787 () Bool)

(declare-fun isEmpty!485 (ListLongMap!2385) Bool)

(assert (=> b!190787 (= e!125552 (isEmpty!485 lt!94568))))

(declare-fun d!55853 () Bool)

(declare-fun e!125551 () Bool)

(assert (=> d!55853 e!125551))

(declare-fun res!90154 () Bool)

(assert (=> d!55853 (=> (not res!90154) (not e!125551))))

(assert (=> d!55853 (= res!90154 (not (contains!1325 lt!94568 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!125548 () ListLongMap!2385)

(assert (=> d!55853 (= lt!94568 e!125548)))

(declare-fun c!34323 () Bool)

(assert (=> d!55853 (= c!34323 (bvsge #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))

(assert (=> d!55853 (validMask!0 (mask!9097 thiss!1248))))

(assert (=> d!55853 (= (getCurrentListMapNoExtraKeys!201 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)) lt!94568)))

(declare-fun b!190788 () Bool)

(declare-fun res!90155 () Bool)

(assert (=> b!190788 (=> (not res!90155) (not e!125551))))

(assert (=> b!190788 (= res!90155 (not (contains!1325 lt!94568 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190789 () Bool)

(declare-fun e!125546 () Bool)

(assert (=> b!190789 (= e!125546 (validKeyInArray!0 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190789 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!190790 () Bool)

(assert (=> b!190790 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))

(assert (=> b!190790 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4137 (_values!3874 thiss!1248))))))

(assert (=> b!190790 (= e!125550 (= (apply!180 lt!94568 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)) (get!2198 (select (arr!3815 (_values!3874 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!190791 () Bool)

(assert (=> b!190791 (= e!125547 e!125552)))

(declare-fun c!34322 () Bool)

(assert (=> b!190791 (= c!34322 (bvslt #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))

(declare-fun b!190792 () Bool)

(assert (=> b!190792 (= e!125548 e!125549)))

(declare-fun c!34324 () Bool)

(assert (=> b!190792 (= c!34324 (validKeyInArray!0 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190793 () Bool)

(assert (=> b!190793 (= e!125548 (ListLongMap!2386 Nil!2396))))

(declare-fun b!190794 () Bool)

(assert (=> b!190794 (= e!125551 e!125547)))

(declare-fun c!34325 () Bool)

(assert (=> b!190794 (= c!34325 e!125546)))

(declare-fun res!90156 () Bool)

(assert (=> b!190794 (=> (not res!90156) (not e!125546))))

(assert (=> b!190794 (= res!90156 (bvslt #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))

(declare-fun b!190795 () Bool)

(declare-fun lt!94567 () Unit!5716)

(declare-fun lt!94569 () Unit!5716)

(assert (=> b!190795 (= lt!94567 lt!94569)))

(declare-fun lt!94571 () (_ BitVec 64))

(declare-fun lt!94572 () (_ BitVec 64))

(declare-fun lt!94570 () V!5569)

(declare-fun lt!94566 () ListLongMap!2385)

(assert (=> b!190795 (not (contains!1325 (+!300 lt!94566 (tuple2!3477 lt!94571 lt!94570)) lt!94572))))

(declare-fun addStillNotContains!95 (ListLongMap!2385 (_ BitVec 64) V!5569 (_ BitVec 64)) Unit!5716)

(assert (=> b!190795 (= lt!94569 (addStillNotContains!95 lt!94566 lt!94571 lt!94570 lt!94572))))

(assert (=> b!190795 (= lt!94572 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!190795 (= lt!94570 (get!2198 (select (arr!3815 (_values!3874 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190795 (= lt!94571 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190795 (= lt!94566 call!19245)))

(assert (=> b!190795 (= e!125549 (+!300 call!19245 (tuple2!3477 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000) (get!2198 (select (arr!3815 (_values!3874 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!55853 c!34323) b!190793))

(assert (= (and d!55853 (not c!34323)) b!190792))

(assert (= (and b!190792 c!34324) b!190795))

(assert (= (and b!190792 (not c!34324)) b!190785))

(assert (= (or b!190795 b!190785) bm!19242))

(assert (= (and d!55853 res!90154) b!190788))

(assert (= (and b!190788 res!90155) b!190794))

(assert (= (and b!190794 res!90156) b!190789))

(assert (= (and b!190794 c!34325) b!190784))

(assert (= (and b!190794 (not c!34325)) b!190791))

(assert (= (and b!190784 res!90153) b!190790))

(assert (= (and b!190791 c!34322) b!190786))

(assert (= (and b!190791 (not c!34322)) b!190787))

(declare-fun b_lambda!7357 () Bool)

(assert (=> (not b_lambda!7357) (not b!190790)))

(assert (=> b!190790 t!7303))

(declare-fun b_and!11311 () Bool)

(assert (= b_and!11309 (and (=> t!7303 result!4883) b_and!11311)))

(declare-fun b_lambda!7359 () Bool)

(assert (=> (not b_lambda!7359) (not b!190795)))

(assert (=> b!190795 t!7303))

(declare-fun b_and!11313 () Bool)

(assert (= b_and!11311 (and (=> t!7303 result!4883) b_and!11313)))

(declare-fun m!216827 () Bool)

(assert (=> d!55853 m!216827))

(assert (=> d!55853 m!216493))

(declare-fun m!216829 () Bool)

(assert (=> b!190788 m!216829))

(declare-fun m!216831 () Bool)

(assert (=> bm!19242 m!216831))

(assert (=> b!190790 m!216609))

(assert (=> b!190790 m!216611))

(assert (=> b!190790 m!216613))

(assert (=> b!190790 m!216611))

(declare-fun m!216833 () Bool)

(assert (=> b!190790 m!216833))

(assert (=> b!190790 m!216613))

(assert (=> b!190790 m!216609))

(assert (=> b!190790 m!216617))

(assert (=> b!190784 m!216611))

(assert (=> b!190784 m!216611))

(declare-fun m!216835 () Bool)

(assert (=> b!190784 m!216835))

(assert (=> b!190795 m!216609))

(assert (=> b!190795 m!216611))

(declare-fun m!216837 () Bool)

(assert (=> b!190795 m!216837))

(assert (=> b!190795 m!216613))

(declare-fun m!216839 () Bool)

(assert (=> b!190795 m!216839))

(declare-fun m!216841 () Bool)

(assert (=> b!190795 m!216841))

(assert (=> b!190795 m!216837))

(declare-fun m!216843 () Bool)

(assert (=> b!190795 m!216843))

(assert (=> b!190795 m!216613))

(assert (=> b!190795 m!216609))

(assert (=> b!190795 m!216617))

(assert (=> b!190789 m!216611))

(assert (=> b!190789 m!216611))

(assert (=> b!190789 m!216655))

(assert (=> b!190792 m!216611))

(assert (=> b!190792 m!216611))

(assert (=> b!190792 m!216655))

(declare-fun m!216845 () Bool)

(assert (=> b!190787 m!216845))

(assert (=> b!190786 m!216831))

(assert (=> b!190671 d!55853))

(declare-fun d!55855 () Bool)

(assert (=> d!55855 (= (apply!180 (+!300 lt!94470 (tuple2!3477 lt!94468 (minValue!3732 thiss!1248))) lt!94461) (apply!180 lt!94470 lt!94461))))

(declare-fun lt!94573 () Unit!5716)

(assert (=> d!55855 (= lt!94573 (choose!1038 lt!94470 lt!94468 (minValue!3732 thiss!1248) lt!94461))))

(declare-fun e!125553 () Bool)

(assert (=> d!55855 e!125553))

(declare-fun res!90157 () Bool)

(assert (=> d!55855 (=> (not res!90157) (not e!125553))))

(assert (=> d!55855 (= res!90157 (contains!1325 lt!94470 lt!94461))))

(assert (=> d!55855 (= (addApplyDifferent!156 lt!94470 lt!94468 (minValue!3732 thiss!1248) lt!94461) lt!94573)))

(declare-fun b!190796 () Bool)

(assert (=> b!190796 (= e!125553 (not (= lt!94461 lt!94468)))))

(assert (= (and d!55855 res!90157) b!190796))

(assert (=> d!55855 m!216637))

(declare-fun m!216847 () Bool)

(assert (=> d!55855 m!216847))

(assert (=> d!55855 m!216637))

(assert (=> d!55855 m!216639))

(declare-fun m!216849 () Bool)

(assert (=> d!55855 m!216849))

(assert (=> d!55855 m!216631))

(assert (=> b!190671 d!55855))

(declare-fun d!55857 () Bool)

(assert (=> d!55857 (= (apply!180 lt!94464 lt!94462) (get!2199 (getValueByKey!235 (toList!1208 lt!94464) lt!94462)))))

(declare-fun bs!7618 () Bool)

(assert (= bs!7618 d!55857))

(declare-fun m!216851 () Bool)

(assert (=> bs!7618 m!216851))

(assert (=> bs!7618 m!216851))

(declare-fun m!216853 () Bool)

(assert (=> bs!7618 m!216853))

(assert (=> b!190671 d!55857))

(declare-fun d!55859 () Bool)

(declare-fun e!125554 () Bool)

(assert (=> d!55859 e!125554))

(declare-fun res!90158 () Bool)

(assert (=> d!55859 (=> (not res!90158) (not e!125554))))

(declare-fun lt!94574 () ListLongMap!2385)

(assert (=> d!55859 (= res!90158 (contains!1325 lt!94574 (_1!1749 (tuple2!3477 lt!94475 (zeroValue!3732 thiss!1248)))))))

(declare-fun lt!94577 () List!2399)

(assert (=> d!55859 (= lt!94574 (ListLongMap!2386 lt!94577))))

(declare-fun lt!94576 () Unit!5716)

(declare-fun lt!94575 () Unit!5716)

(assert (=> d!55859 (= lt!94576 lt!94575)))

(assert (=> d!55859 (= (getValueByKey!235 lt!94577 (_1!1749 (tuple2!3477 lt!94475 (zeroValue!3732 thiss!1248)))) (Some!240 (_2!1749 (tuple2!3477 lt!94475 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!55859 (= lt!94575 (lemmaContainsTupThenGetReturnValue!125 lt!94577 (_1!1749 (tuple2!3477 lt!94475 (zeroValue!3732 thiss!1248))) (_2!1749 (tuple2!3477 lt!94475 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!55859 (= lt!94577 (insertStrictlySorted!128 (toList!1208 lt!94464) (_1!1749 (tuple2!3477 lt!94475 (zeroValue!3732 thiss!1248))) (_2!1749 (tuple2!3477 lt!94475 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!55859 (= (+!300 lt!94464 (tuple2!3477 lt!94475 (zeroValue!3732 thiss!1248))) lt!94574)))

(declare-fun b!190797 () Bool)

(declare-fun res!90159 () Bool)

(assert (=> b!190797 (=> (not res!90159) (not e!125554))))

(assert (=> b!190797 (= res!90159 (= (getValueByKey!235 (toList!1208 lt!94574) (_1!1749 (tuple2!3477 lt!94475 (zeroValue!3732 thiss!1248)))) (Some!240 (_2!1749 (tuple2!3477 lt!94475 (zeroValue!3732 thiss!1248))))))))

(declare-fun b!190798 () Bool)

(assert (=> b!190798 (= e!125554 (contains!1327 (toList!1208 lt!94574) (tuple2!3477 lt!94475 (zeroValue!3732 thiss!1248))))))

(assert (= (and d!55859 res!90158) b!190797))

(assert (= (and b!190797 res!90159) b!190798))

(declare-fun m!216855 () Bool)

(assert (=> d!55859 m!216855))

(declare-fun m!216857 () Bool)

(assert (=> d!55859 m!216857))

(declare-fun m!216859 () Bool)

(assert (=> d!55859 m!216859))

(declare-fun m!216861 () Bool)

(assert (=> d!55859 m!216861))

(declare-fun m!216863 () Bool)

(assert (=> b!190797 m!216863))

(declare-fun m!216865 () Bool)

(assert (=> b!190798 m!216865))

(assert (=> b!190671 d!55859))

(declare-fun d!55861 () Bool)

(declare-fun e!125555 () Bool)

(assert (=> d!55861 e!125555))

(declare-fun res!90160 () Bool)

(assert (=> d!55861 (=> (not res!90160) (not e!125555))))

(declare-fun lt!94578 () ListLongMap!2385)

(assert (=> d!55861 (= res!90160 (contains!1325 lt!94578 (_1!1749 (tuple2!3477 lt!94468 (minValue!3732 thiss!1248)))))))

(declare-fun lt!94581 () List!2399)

(assert (=> d!55861 (= lt!94578 (ListLongMap!2386 lt!94581))))

(declare-fun lt!94580 () Unit!5716)

(declare-fun lt!94579 () Unit!5716)

(assert (=> d!55861 (= lt!94580 lt!94579)))

(assert (=> d!55861 (= (getValueByKey!235 lt!94581 (_1!1749 (tuple2!3477 lt!94468 (minValue!3732 thiss!1248)))) (Some!240 (_2!1749 (tuple2!3477 lt!94468 (minValue!3732 thiss!1248)))))))

(assert (=> d!55861 (= lt!94579 (lemmaContainsTupThenGetReturnValue!125 lt!94581 (_1!1749 (tuple2!3477 lt!94468 (minValue!3732 thiss!1248))) (_2!1749 (tuple2!3477 lt!94468 (minValue!3732 thiss!1248)))))))

(assert (=> d!55861 (= lt!94581 (insertStrictlySorted!128 (toList!1208 lt!94470) (_1!1749 (tuple2!3477 lt!94468 (minValue!3732 thiss!1248))) (_2!1749 (tuple2!3477 lt!94468 (minValue!3732 thiss!1248)))))))

(assert (=> d!55861 (= (+!300 lt!94470 (tuple2!3477 lt!94468 (minValue!3732 thiss!1248))) lt!94578)))

(declare-fun b!190799 () Bool)

(declare-fun res!90161 () Bool)

(assert (=> b!190799 (=> (not res!90161) (not e!125555))))

(assert (=> b!190799 (= res!90161 (= (getValueByKey!235 (toList!1208 lt!94578) (_1!1749 (tuple2!3477 lt!94468 (minValue!3732 thiss!1248)))) (Some!240 (_2!1749 (tuple2!3477 lt!94468 (minValue!3732 thiss!1248))))))))

(declare-fun b!190800 () Bool)

(assert (=> b!190800 (= e!125555 (contains!1327 (toList!1208 lt!94578) (tuple2!3477 lt!94468 (minValue!3732 thiss!1248))))))

(assert (= (and d!55861 res!90160) b!190799))

(assert (= (and b!190799 res!90161) b!190800))

(declare-fun m!216867 () Bool)

(assert (=> d!55861 m!216867))

(declare-fun m!216869 () Bool)

(assert (=> d!55861 m!216869))

(declare-fun m!216871 () Bool)

(assert (=> d!55861 m!216871))

(declare-fun m!216873 () Bool)

(assert (=> d!55861 m!216873))

(declare-fun m!216875 () Bool)

(assert (=> b!190799 m!216875))

(declare-fun m!216877 () Bool)

(assert (=> b!190800 m!216877))

(assert (=> b!190671 d!55861))

(declare-fun b!190819 () Bool)

(declare-fun e!125570 () SeekEntryResult!677)

(assert (=> b!190819 (= e!125570 (Intermediate!677 true (toIndex!0 key!828 (mask!9097 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!190820 () Bool)

(declare-fun e!125568 () SeekEntryResult!677)

(assert (=> b!190820 (= e!125570 e!125568)))

(declare-fun c!34333 () Bool)

(declare-fun lt!94587 () (_ BitVec 64))

(assert (=> b!190820 (= c!34333 (or (= lt!94587 key!828) (= (bvadd lt!94587 lt!94587) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190821 () Bool)

(declare-fun lt!94586 () SeekEntryResult!677)

(assert (=> b!190821 (and (bvsge (index!4880 lt!94586) #b00000000000000000000000000000000) (bvslt (index!4880 lt!94586) (size!4136 (_keys!5863 thiss!1248))))))

(declare-fun e!125566 () Bool)

(assert (=> b!190821 (= e!125566 (= (select (arr!3814 (_keys!5863 thiss!1248)) (index!4880 lt!94586)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!55863 () Bool)

(declare-fun e!125567 () Bool)

(assert (=> d!55863 e!125567))

(declare-fun c!34334 () Bool)

(assert (=> d!55863 (= c!34334 (and ((_ is Intermediate!677) lt!94586) (undefined!1489 lt!94586)))))

(assert (=> d!55863 (= lt!94586 e!125570)))

(declare-fun c!34332 () Bool)

(assert (=> d!55863 (= c!34332 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!55863 (= lt!94587 (select (arr!3814 (_keys!5863 thiss!1248)) (toIndex!0 key!828 (mask!9097 thiss!1248))))))

(assert (=> d!55863 (validMask!0 (mask!9097 thiss!1248))))

(assert (=> d!55863 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9097 thiss!1248)) key!828 (_keys!5863 thiss!1248) (mask!9097 thiss!1248)) lt!94586)))

(declare-fun b!190822 () Bool)

(assert (=> b!190822 (and (bvsge (index!4880 lt!94586) #b00000000000000000000000000000000) (bvslt (index!4880 lt!94586) (size!4136 (_keys!5863 thiss!1248))))))

(declare-fun res!90169 () Bool)

(assert (=> b!190822 (= res!90169 (= (select (arr!3814 (_keys!5863 thiss!1248)) (index!4880 lt!94586)) key!828))))

(assert (=> b!190822 (=> res!90169 e!125566)))

(declare-fun e!125569 () Bool)

(assert (=> b!190822 (= e!125569 e!125566)))

(declare-fun b!190823 () Bool)

(assert (=> b!190823 (= e!125567 (bvsge (x!20504 lt!94586) #b01111111111111111111111111111110))))

(declare-fun b!190824 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!190824 (= e!125568 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!9097 thiss!1248)) #b00000000000000000000000000000000 (mask!9097 thiss!1248)) key!828 (_keys!5863 thiss!1248) (mask!9097 thiss!1248)))))

(declare-fun b!190825 () Bool)

(assert (=> b!190825 (and (bvsge (index!4880 lt!94586) #b00000000000000000000000000000000) (bvslt (index!4880 lt!94586) (size!4136 (_keys!5863 thiss!1248))))))

(declare-fun res!90170 () Bool)

(assert (=> b!190825 (= res!90170 (= (select (arr!3814 (_keys!5863 thiss!1248)) (index!4880 lt!94586)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190825 (=> res!90170 e!125566)))

(declare-fun b!190826 () Bool)

(assert (=> b!190826 (= e!125567 e!125569)))

(declare-fun res!90168 () Bool)

(assert (=> b!190826 (= res!90168 (and ((_ is Intermediate!677) lt!94586) (not (undefined!1489 lt!94586)) (bvslt (x!20504 lt!94586) #b01111111111111111111111111111110) (bvsge (x!20504 lt!94586) #b00000000000000000000000000000000) (bvsge (x!20504 lt!94586) #b00000000000000000000000000000000)))))

(assert (=> b!190826 (=> (not res!90168) (not e!125569))))

(declare-fun b!190827 () Bool)

(assert (=> b!190827 (= e!125568 (Intermediate!677 false (toIndex!0 key!828 (mask!9097 thiss!1248)) #b00000000000000000000000000000000))))

(assert (= (and d!55863 c!34332) b!190819))

(assert (= (and d!55863 (not c!34332)) b!190820))

(assert (= (and b!190820 c!34333) b!190827))

(assert (= (and b!190820 (not c!34333)) b!190824))

(assert (= (and d!55863 c!34334) b!190823))

(assert (= (and d!55863 (not c!34334)) b!190826))

(assert (= (and b!190826 res!90168) b!190822))

(assert (= (and b!190822 (not res!90169)) b!190825))

(assert (= (and b!190825 (not res!90170)) b!190821))

(declare-fun m!216879 () Bool)

(assert (=> b!190821 m!216879))

(assert (=> b!190822 m!216879))

(assert (=> d!55863 m!216587))

(declare-fun m!216881 () Bool)

(assert (=> d!55863 m!216881))

(assert (=> d!55863 m!216493))

(assert (=> b!190825 m!216879))

(assert (=> b!190824 m!216587))

(declare-fun m!216883 () Bool)

(assert (=> b!190824 m!216883))

(assert (=> b!190824 m!216883))

(declare-fun m!216885 () Bool)

(assert (=> b!190824 m!216885))

(assert (=> d!55807 d!55863))

(declare-fun d!55865 () Bool)

(declare-fun lt!94593 () (_ BitVec 32))

(declare-fun lt!94592 () (_ BitVec 32))

(assert (=> d!55865 (= lt!94593 (bvmul (bvxor lt!94592 (bvlshr lt!94592 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!55865 (= lt!94592 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!55865 (and (bvsge (mask!9097 thiss!1248) #b00000000000000000000000000000000) (let ((res!90171 (let ((h!3036 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20522 (bvmul (bvxor h!3036 (bvlshr h!3036 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20522 (bvlshr x!20522 #b00000000000000000000000000001101)) (mask!9097 thiss!1248)))))) (and (bvslt res!90171 (bvadd (mask!9097 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!90171 #b00000000000000000000000000000000))))))

(assert (=> d!55865 (= (toIndex!0 key!828 (mask!9097 thiss!1248)) (bvand (bvxor lt!94593 (bvlshr lt!94593 #b00000000000000000000000000001101)) (mask!9097 thiss!1248)))))

(assert (=> d!55807 d!55865))

(assert (=> d!55807 d!55809))

(declare-fun lt!94596 () Bool)

(declare-fun d!55867 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!152 (List!2399) (InoxSet tuple2!3476))

(assert (=> d!55867 (= lt!94596 (select (content!152 (toList!1208 lt!94510)) (tuple2!3477 key!828 v!309)))))

(declare-fun e!125575 () Bool)

(assert (=> d!55867 (= lt!94596 e!125575)))

(declare-fun res!90177 () Bool)

(assert (=> d!55867 (=> (not res!90177) (not e!125575))))

(assert (=> d!55867 (= res!90177 ((_ is Cons!2395) (toList!1208 lt!94510)))))

(assert (=> d!55867 (= (contains!1327 (toList!1208 lt!94510) (tuple2!3477 key!828 v!309)) lt!94596)))

(declare-fun b!190832 () Bool)

(declare-fun e!125576 () Bool)

(assert (=> b!190832 (= e!125575 e!125576)))

(declare-fun res!90176 () Bool)

(assert (=> b!190832 (=> res!90176 e!125576)))

(assert (=> b!190832 (= res!90176 (= (h!3033 (toList!1208 lt!94510)) (tuple2!3477 key!828 v!309)))))

(declare-fun b!190833 () Bool)

(assert (=> b!190833 (= e!125576 (contains!1327 (t!7300 (toList!1208 lt!94510)) (tuple2!3477 key!828 v!309)))))

(assert (= (and d!55867 res!90177) b!190832))

(assert (= (and b!190832 (not res!90176)) b!190833))

(declare-fun m!216887 () Bool)

(assert (=> d!55867 m!216887))

(declare-fun m!216889 () Bool)

(assert (=> d!55867 m!216889))

(declare-fun m!216891 () Bool)

(assert (=> b!190833 m!216891))

(assert (=> b!190702 d!55867))

(declare-fun d!55869 () Bool)

(assert (=> d!55869 (= (apply!180 lt!94472 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2199 (getValueByKey!235 (toList!1208 lt!94472) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7619 () Bool)

(assert (= bs!7619 d!55869))

(declare-fun m!216893 () Bool)

(assert (=> bs!7619 m!216893))

(assert (=> bs!7619 m!216893))

(declare-fun m!216895 () Bool)

(assert (=> bs!7619 m!216895))

(assert (=> b!190653 d!55869))

(declare-fun d!55871 () Bool)

(assert (=> d!55871 (= (apply!180 lt!94494 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)) (get!2199 (getValueByKey!235 (toList!1208 lt!94494) (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7620 () Bool)

(assert (= bs!7620 d!55871))

(assert (=> bs!7620 m!216611))

(assert (=> bs!7620 m!216759))

(assert (=> bs!7620 m!216759))

(declare-fun m!216897 () Bool)

(assert (=> bs!7620 m!216897))

(assert (=> b!190684 d!55871))

(declare-fun d!55873 () Bool)

(declare-fun c!34337 () Bool)

(assert (=> d!55873 (= c!34337 ((_ is ValueCellFull!1877) (select (arr!3815 (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248)))) #b00000000000000000000000000000000)))))

(declare-fun e!125579 () V!5569)

(assert (=> d!55873 (= (get!2198 (select (arr!3815 (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!125579)))

(declare-fun b!190838 () Bool)

(declare-fun get!2200 (ValueCell!1877 V!5569) V!5569)

(assert (=> b!190838 (= e!125579 (get!2200 (select (arr!3815 (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190839 () Bool)

(declare-fun get!2201 (ValueCell!1877 V!5569) V!5569)

(assert (=> b!190839 (= e!125579 (get!2201 (select (arr!3815 (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55873 c!34337) b!190838))

(assert (= (and d!55873 (not c!34337)) b!190839))

(assert (=> b!190838 m!216667))

(assert (=> b!190838 m!216609))

(declare-fun m!216899 () Bool)

(assert (=> b!190838 m!216899))

(assert (=> b!190839 m!216667))

(assert (=> b!190839 m!216609))

(declare-fun m!216901 () Bool)

(assert (=> b!190839 m!216901))

(assert (=> b!190684 d!55873))

(declare-fun d!55875 () Bool)

(declare-fun e!125580 () Bool)

(assert (=> d!55875 e!125580))

(declare-fun res!90178 () Bool)

(assert (=> d!55875 (=> (not res!90178) (not e!125580))))

(declare-fun lt!94597 () ListLongMap!2385)

(assert (=> d!55875 (= res!90178 (contains!1325 lt!94597 (_1!1749 (ite (or c!34298 c!34296) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))))

(declare-fun lt!94600 () List!2399)

(assert (=> d!55875 (= lt!94597 (ListLongMap!2386 lt!94600))))

(declare-fun lt!94599 () Unit!5716)

(declare-fun lt!94598 () Unit!5716)

(assert (=> d!55875 (= lt!94599 lt!94598)))

(assert (=> d!55875 (= (getValueByKey!235 lt!94600 (_1!1749 (ite (or c!34298 c!34296) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))) (Some!240 (_2!1749 (ite (or c!34298 c!34296) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))))

(assert (=> d!55875 (= lt!94598 (lemmaContainsTupThenGetReturnValue!125 lt!94600 (_1!1749 (ite (or c!34298 c!34296) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))) (_2!1749 (ite (or c!34298 c!34296) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))))

(assert (=> d!55875 (= lt!94600 (insertStrictlySorted!128 (toList!1208 (ite c!34298 call!19226 (ite c!34296 call!19224 call!19228))) (_1!1749 (ite (or c!34298 c!34296) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))) (_2!1749 (ite (or c!34298 c!34296) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))))

(assert (=> d!55875 (= (+!300 (ite c!34298 call!19226 (ite c!34296 call!19224 call!19228)) (ite (or c!34298 c!34296) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))) lt!94597)))

(declare-fun b!190840 () Bool)

(declare-fun res!90179 () Bool)

(assert (=> b!190840 (=> (not res!90179) (not e!125580))))

(assert (=> b!190840 (= res!90179 (= (getValueByKey!235 (toList!1208 lt!94597) (_1!1749 (ite (or c!34298 c!34296) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))) (Some!240 (_2!1749 (ite (or c!34298 c!34296) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))))

(declare-fun b!190841 () Bool)

(assert (=> b!190841 (= e!125580 (contains!1327 (toList!1208 lt!94597) (ite (or c!34298 c!34296) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(assert (= (and d!55875 res!90178) b!190840))

(assert (= (and b!190840 res!90179) b!190841))

(declare-fun m!216903 () Bool)

(assert (=> d!55875 m!216903))

(declare-fun m!216905 () Bool)

(assert (=> d!55875 m!216905))

(declare-fun m!216907 () Bool)

(assert (=> d!55875 m!216907))

(declare-fun m!216909 () Bool)

(assert (=> d!55875 m!216909))

(declare-fun m!216911 () Bool)

(assert (=> b!190840 m!216911))

(declare-fun m!216913 () Bool)

(assert (=> b!190841 m!216913))

(assert (=> bm!19220 d!55875))

(declare-fun d!55877 () Bool)

(assert (=> d!55877 (= (validKeyInArray!0 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!190670 d!55877))

(assert (=> d!55821 d!55807))

(declare-fun b!190858 () Bool)

(declare-fun e!125590 () Bool)

(declare-fun e!125592 () Bool)

(assert (=> b!190858 (= e!125590 e!125592)))

(declare-fun res!90191 () Bool)

(declare-fun call!19250 () Bool)

(assert (=> b!190858 (= res!90191 call!19250)))

(assert (=> b!190858 (=> (not res!90191) (not e!125592))))

(declare-fun b!190859 () Bool)

(declare-fun res!90188 () Bool)

(declare-fun e!125591 () Bool)

(assert (=> b!190859 (=> (not res!90188) (not e!125591))))

(declare-fun lt!94603 () SeekEntryResult!677)

(assert (=> b!190859 (= res!90188 (= (select (arr!3814 (_keys!5863 thiss!1248)) (index!4881 lt!94603)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!34343 () Bool)

(declare-fun bm!19247 () Bool)

(assert (=> bm!19247 (= call!19250 (inRange!0 (ite c!34343 (index!4878 lt!94603) (index!4881 lt!94603)) (mask!9097 thiss!1248)))))

(declare-fun b!190860 () Bool)

(declare-fun res!90190 () Bool)

(assert (=> b!190860 (= res!90190 (= (select (arr!3814 (_keys!5863 thiss!1248)) (index!4878 lt!94603)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190860 (=> (not res!90190) (not e!125592))))

(declare-fun bm!19248 () Bool)

(declare-fun call!19251 () Bool)

(assert (=> bm!19248 (= call!19251 (arrayContainsKey!0 (_keys!5863 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun d!55879 () Bool)

(assert (=> d!55879 e!125590))

(assert (=> d!55879 (= c!34343 ((_ is MissingZero!677) lt!94603))))

(assert (=> d!55879 (= lt!94603 (seekEntryOrOpen!0 key!828 (_keys!5863 thiss!1248) (mask!9097 thiss!1248)))))

(assert (=> d!55879 true))

(declare-fun _$34!1078 () Unit!5716)

(assert (=> d!55879 (= (choose!1035 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) key!828 (defaultEntry!3891 thiss!1248)) _$34!1078)))

(declare-fun b!190861 () Bool)

(assert (=> b!190861 (= e!125591 (not call!19251))))

(declare-fun b!190862 () Bool)

(declare-fun e!125589 () Bool)

(assert (=> b!190862 (= e!125590 e!125589)))

(declare-fun c!34342 () Bool)

(assert (=> b!190862 (= c!34342 ((_ is MissingVacant!677) lt!94603))))

(declare-fun b!190863 () Bool)

(declare-fun res!90189 () Bool)

(assert (=> b!190863 (=> (not res!90189) (not e!125591))))

(assert (=> b!190863 (= res!90189 call!19250)))

(assert (=> b!190863 (= e!125589 e!125591)))

(declare-fun b!190864 () Bool)

(assert (=> b!190864 (= e!125589 ((_ is Undefined!677) lt!94603))))

(declare-fun b!190865 () Bool)

(assert (=> b!190865 (= e!125592 (not call!19251))))

(assert (= (and d!55879 c!34343) b!190858))

(assert (= (and d!55879 (not c!34343)) b!190862))

(assert (= (and b!190858 res!90191) b!190860))

(assert (= (and b!190860 res!90190) b!190865))

(assert (= (and b!190862 c!34342) b!190863))

(assert (= (and b!190862 (not c!34342)) b!190864))

(assert (= (and b!190863 res!90189) b!190859))

(assert (= (and b!190859 res!90188) b!190861))

(assert (= (or b!190858 b!190863) bm!19247))

(assert (= (or b!190865 b!190861) bm!19248))

(declare-fun m!216915 () Bool)

(assert (=> b!190859 m!216915))

(assert (=> bm!19248 m!216739))

(declare-fun m!216917 () Bool)

(assert (=> b!190860 m!216917))

(assert (=> d!55879 m!216495))

(declare-fun m!216919 () Bool)

(assert (=> bm!19247 m!216919))

(assert (=> d!55821 d!55879))

(assert (=> d!55821 d!55809))

(assert (=> d!55813 d!55809))

(declare-fun d!55881 () Bool)

(assert (=> d!55881 (= (inRange!0 (ite c!34310 (index!4878 lt!94522) (index!4881 lt!94522)) (mask!9097 thiss!1248)) (and (bvsge (ite c!34310 (index!4878 lt!94522) (index!4881 lt!94522)) #b00000000000000000000000000000000) (bvslt (ite c!34310 (index!4878 lt!94522) (index!4881 lt!94522)) (bvadd (mask!9097 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!19239 d!55881))

(declare-fun d!55883 () Bool)

(declare-fun c!34348 () Bool)

(assert (=> d!55883 (= c!34348 (and ((_ is Cons!2395) (toList!1208 lt!94510)) (= (_1!1749 (h!3033 (toList!1208 lt!94510))) (_1!1749 (tuple2!3477 key!828 v!309)))))))

(declare-fun e!125597 () Option!241)

(assert (=> d!55883 (= (getValueByKey!235 (toList!1208 lt!94510) (_1!1749 (tuple2!3477 key!828 v!309))) e!125597)))

(declare-fun b!190876 () Bool)

(declare-fun e!125598 () Option!241)

(assert (=> b!190876 (= e!125598 (getValueByKey!235 (t!7300 (toList!1208 lt!94510)) (_1!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun b!190875 () Bool)

(assert (=> b!190875 (= e!125597 e!125598)))

(declare-fun c!34349 () Bool)

(assert (=> b!190875 (= c!34349 (and ((_ is Cons!2395) (toList!1208 lt!94510)) (not (= (_1!1749 (h!3033 (toList!1208 lt!94510))) (_1!1749 (tuple2!3477 key!828 v!309))))))))

(declare-fun b!190877 () Bool)

(assert (=> b!190877 (= e!125598 None!239)))

(declare-fun b!190874 () Bool)

(assert (=> b!190874 (= e!125597 (Some!240 (_2!1749 (h!3033 (toList!1208 lt!94510)))))))

(assert (= (and d!55883 c!34348) b!190874))

(assert (= (and d!55883 (not c!34348)) b!190875))

(assert (= (and b!190875 c!34349) b!190876))

(assert (= (and b!190875 (not c!34349)) b!190877))

(declare-fun m!216921 () Bool)

(assert (=> b!190876 m!216921))

(assert (=> b!190701 d!55883))

(assert (=> b!190667 d!55877))

(declare-fun d!55885 () Bool)

(assert (=> d!55885 (= (inRange!0 (index!4879 lt!94528) (mask!9097 thiss!1248)) (and (bvsge (index!4879 lt!94528) #b00000000000000000000000000000000) (bvslt (index!4879 lt!94528) (bvadd (mask!9097 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!190734 d!55885))

(assert (=> bm!19224 d!55853))

(declare-fun d!55887 () Bool)

(declare-fun e!125600 () Bool)

(assert (=> d!55887 e!125600))

(declare-fun res!90192 () Bool)

(assert (=> d!55887 (=> res!90192 e!125600)))

(declare-fun lt!94607 () Bool)

(assert (=> d!55887 (= res!90192 (not lt!94607))))

(declare-fun lt!94604 () Bool)

(assert (=> d!55887 (= lt!94607 lt!94604)))

(declare-fun lt!94605 () Unit!5716)

(declare-fun e!125599 () Unit!5716)

(assert (=> d!55887 (= lt!94605 e!125599)))

(declare-fun c!34350 () Bool)

(assert (=> d!55887 (= c!34350 lt!94604)))

(assert (=> d!55887 (= lt!94604 (containsKey!239 (toList!1208 lt!94494) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55887 (= (contains!1325 lt!94494 #b0000000000000000000000000000000000000000000000000000000000000000) lt!94607)))

(declare-fun b!190878 () Bool)

(declare-fun lt!94606 () Unit!5716)

(assert (=> b!190878 (= e!125599 lt!94606)))

(assert (=> b!190878 (= lt!94606 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1208 lt!94494) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190878 (isDefined!189 (getValueByKey!235 (toList!1208 lt!94494) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190879 () Bool)

(declare-fun Unit!5727 () Unit!5716)

(assert (=> b!190879 (= e!125599 Unit!5727)))

(declare-fun b!190880 () Bool)

(assert (=> b!190880 (= e!125600 (isDefined!189 (getValueByKey!235 (toList!1208 lt!94494) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55887 c!34350) b!190878))

(assert (= (and d!55887 (not c!34350)) b!190879))

(assert (= (and d!55887 (not res!90192)) b!190880))

(declare-fun m!216923 () Bool)

(assert (=> d!55887 m!216923))

(declare-fun m!216925 () Bool)

(assert (=> b!190878 m!216925))

(declare-fun m!216927 () Bool)

(assert (=> b!190878 m!216927))

(assert (=> b!190878 m!216927))

(declare-fun m!216929 () Bool)

(assert (=> b!190878 m!216929))

(assert (=> b!190880 m!216927))

(assert (=> b!190880 m!216927))

(assert (=> b!190880 m!216929))

(assert (=> bm!19233 d!55887))

(declare-fun d!55889 () Bool)

(declare-fun e!125601 () Bool)

(assert (=> d!55889 e!125601))

(declare-fun res!90193 () Bool)

(assert (=> d!55889 (=> (not res!90193) (not e!125601))))

(declare-fun lt!94608 () ListLongMap!2385)

(assert (=> d!55889 (= res!90193 (contains!1325 lt!94608 (_1!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun lt!94611 () List!2399)

(assert (=> d!55889 (= lt!94608 (ListLongMap!2386 lt!94611))))

(declare-fun lt!94610 () Unit!5716)

(declare-fun lt!94609 () Unit!5716)

(assert (=> d!55889 (= lt!94610 lt!94609)))

(assert (=> d!55889 (= (getValueByKey!235 lt!94611 (_1!1749 (tuple2!3477 key!828 v!309))) (Some!240 (_2!1749 (tuple2!3477 key!828 v!309))))))

(assert (=> d!55889 (= lt!94609 (lemmaContainsTupThenGetReturnValue!125 lt!94611 (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309))))))

(assert (=> d!55889 (= lt!94611 (insertStrictlySorted!128 (toList!1208 (getCurrentListMap!841 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248))) (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309))))))

(assert (=> d!55889 (= (+!300 (getCurrentListMap!841 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)) (tuple2!3477 key!828 v!309)) lt!94608)))

(declare-fun b!190881 () Bool)

(declare-fun res!90194 () Bool)

(assert (=> b!190881 (=> (not res!90194) (not e!125601))))

(assert (=> b!190881 (= res!90194 (= (getValueByKey!235 (toList!1208 lt!94608) (_1!1749 (tuple2!3477 key!828 v!309))) (Some!240 (_2!1749 (tuple2!3477 key!828 v!309)))))))

(declare-fun b!190882 () Bool)

(assert (=> b!190882 (= e!125601 (contains!1327 (toList!1208 lt!94608) (tuple2!3477 key!828 v!309)))))

(assert (= (and d!55889 res!90193) b!190881))

(assert (= (and b!190881 res!90194) b!190882))

(declare-fun m!216931 () Bool)

(assert (=> d!55889 m!216931))

(declare-fun m!216933 () Bool)

(assert (=> d!55889 m!216933))

(declare-fun m!216935 () Bool)

(assert (=> d!55889 m!216935))

(declare-fun m!216937 () Bool)

(assert (=> d!55889 m!216937))

(declare-fun m!216939 () Bool)

(assert (=> b!190881 m!216939))

(declare-fun m!216941 () Bool)

(assert (=> b!190882 m!216941))

(assert (=> b!190705 d!55889))

(assert (=> b!190705 d!55813))

(assert (=> b!190705 d!55815))

(assert (=> d!55815 d!55809))

(declare-fun d!55891 () Bool)

(declare-fun e!125602 () Bool)

(assert (=> d!55891 e!125602))

(declare-fun res!90195 () Bool)

(assert (=> d!55891 (=> (not res!90195) (not e!125602))))

(declare-fun lt!94612 () ListLongMap!2385)

(assert (=> d!55891 (= res!90195 (contains!1325 lt!94612 (_1!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(declare-fun lt!94615 () List!2399)

(assert (=> d!55891 (= lt!94612 (ListLongMap!2386 lt!94615))))

(declare-fun lt!94614 () Unit!5716)

(declare-fun lt!94613 () Unit!5716)

(assert (=> d!55891 (= lt!94614 lt!94613)))

(assert (=> d!55891 (= (getValueByKey!235 lt!94615 (_1!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))) (Some!240 (_2!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(assert (=> d!55891 (= lt!94613 (lemmaContainsTupThenGetReturnValue!125 lt!94615 (_1!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))) (_2!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(assert (=> d!55891 (= lt!94615 (insertStrictlySorted!128 (toList!1208 call!19230) (_1!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))) (_2!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(assert (=> d!55891 (= (+!300 call!19230 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))) lt!94612)))

(declare-fun b!190883 () Bool)

(declare-fun res!90196 () Bool)

(assert (=> b!190883 (=> (not res!90196) (not e!125602))))

(assert (=> b!190883 (= res!90196 (= (getValueByKey!235 (toList!1208 lt!94612) (_1!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))) (Some!240 (_2!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))))

(declare-fun b!190884 () Bool)

(assert (=> b!190884 (= e!125602 (contains!1327 (toList!1208 lt!94612) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))

(assert (= (and d!55891 res!90195) b!190883))

(assert (= (and b!190883 res!90196) b!190884))

(declare-fun m!216943 () Bool)

(assert (=> d!55891 m!216943))

(declare-fun m!216945 () Bool)

(assert (=> d!55891 m!216945))

(declare-fun m!216947 () Bool)

(assert (=> d!55891 m!216947))

(declare-fun m!216949 () Bool)

(assert (=> d!55891 m!216949))

(declare-fun m!216951 () Bool)

(assert (=> b!190883 m!216951))

(declare-fun m!216953 () Bool)

(assert (=> b!190884 m!216953))

(assert (=> b!190680 d!55891))

(declare-fun d!55893 () Bool)

(declare-fun e!125603 () Bool)

(assert (=> d!55893 e!125603))

(declare-fun res!90197 () Bool)

(assert (=> d!55893 (=> (not res!90197) (not e!125603))))

(declare-fun lt!94616 () ListLongMap!2385)

(assert (=> d!55893 (= res!90197 (contains!1325 lt!94616 (_1!1749 (ite (or c!34304 c!34302) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))))

(declare-fun lt!94619 () List!2399)

(assert (=> d!55893 (= lt!94616 (ListLongMap!2386 lt!94619))))

(declare-fun lt!94618 () Unit!5716)

(declare-fun lt!94617 () Unit!5716)

(assert (=> d!55893 (= lt!94618 lt!94617)))

(assert (=> d!55893 (= (getValueByKey!235 lt!94619 (_1!1749 (ite (or c!34304 c!34302) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))) (Some!240 (_2!1749 (ite (or c!34304 c!34302) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))))

(assert (=> d!55893 (= lt!94617 (lemmaContainsTupThenGetReturnValue!125 lt!94619 (_1!1749 (ite (or c!34304 c!34302) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))) (_2!1749 (ite (or c!34304 c!34302) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))))

(assert (=> d!55893 (= lt!94619 (insertStrictlySorted!128 (toList!1208 (ite c!34304 call!19233 (ite c!34302 call!19231 call!19235))) (_1!1749 (ite (or c!34304 c!34302) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))) (_2!1749 (ite (or c!34304 c!34302) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))))

(assert (=> d!55893 (= (+!300 (ite c!34304 call!19233 (ite c!34302 call!19231 call!19235)) (ite (or c!34304 c!34302) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))) lt!94616)))

(declare-fun b!190885 () Bool)

(declare-fun res!90198 () Bool)

(assert (=> b!190885 (=> (not res!90198) (not e!125603))))

(assert (=> b!190885 (= res!90198 (= (getValueByKey!235 (toList!1208 lt!94616) (_1!1749 (ite (or c!34304 c!34302) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))) (Some!240 (_2!1749 (ite (or c!34304 c!34302) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))))

(declare-fun b!190886 () Bool)

(assert (=> b!190886 (= e!125603 (contains!1327 (toList!1208 lt!94616) (ite (or c!34304 c!34302) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3732 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(assert (= (and d!55893 res!90197) b!190885))

(assert (= (and b!190885 res!90198) b!190886))

(declare-fun m!216955 () Bool)

(assert (=> d!55893 m!216955))

(declare-fun m!216957 () Bool)

(assert (=> d!55893 m!216957))

(declare-fun m!216959 () Bool)

(assert (=> d!55893 m!216959))

(declare-fun m!216961 () Bool)

(assert (=> d!55893 m!216961))

(declare-fun m!216963 () Bool)

(assert (=> b!190885 m!216963))

(declare-fun m!216965 () Bool)

(assert (=> b!190886 m!216965))

(assert (=> bm!19227 d!55893))

(declare-fun b!190895 () Bool)

(declare-fun e!125609 () (_ BitVec 32))

(declare-fun call!19254 () (_ BitVec 32))

(assert (=> b!190895 (= e!125609 (bvadd #b00000000000000000000000000000001 call!19254))))

(declare-fun d!55895 () Bool)

(declare-fun lt!94622 () (_ BitVec 32))

(assert (=> d!55895 (and (bvsge lt!94622 #b00000000000000000000000000000000) (bvsle lt!94622 (bvsub (size!4136 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!125608 () (_ BitVec 32))

(assert (=> d!55895 (= lt!94622 e!125608)))

(declare-fun c!34356 () Bool)

(assert (=> d!55895 (= c!34356 (bvsge #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))

(assert (=> d!55895 (and (bvsle #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4136 (_keys!5863 thiss!1248)) (size!4136 (_keys!5863 thiss!1248))))))

(assert (=> d!55895 (= (arrayCountValidKeys!0 (_keys!5863 thiss!1248) #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))) lt!94622)))

(declare-fun bm!19251 () Bool)

(assert (=> bm!19251 (= call!19254 (arrayCountValidKeys!0 (_keys!5863 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4136 (_keys!5863 thiss!1248))))))

(declare-fun b!190896 () Bool)

(assert (=> b!190896 (= e!125608 e!125609)))

(declare-fun c!34355 () Bool)

(assert (=> b!190896 (= c!34355 (validKeyInArray!0 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190897 () Bool)

(assert (=> b!190897 (= e!125609 call!19254)))

(declare-fun b!190898 () Bool)

(assert (=> b!190898 (= e!125608 #b00000000000000000000000000000000)))

(assert (= (and d!55895 c!34356) b!190898))

(assert (= (and d!55895 (not c!34356)) b!190896))

(assert (= (and b!190896 c!34355) b!190895))

(assert (= (and b!190896 (not c!34355)) b!190897))

(assert (= (or b!190895 b!190897) bm!19251))

(declare-fun m!216967 () Bool)

(assert (=> bm!19251 m!216967))

(assert (=> b!190896 m!216611))

(assert (=> b!190896 m!216611))

(assert (=> b!190896 m!216655))

(assert (=> b!190581 d!55895))

(assert (=> b!190693 d!55877))

(declare-fun d!55897 () Bool)

(assert (=> d!55897 (= (+!300 (getCurrentListMap!841 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)) (tuple2!3477 key!828 v!309)) (getCurrentListMap!841 (_keys!5863 thiss!1248) (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248))) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)))))

(assert (=> d!55897 true))

(declare-fun _$5!149 () Unit!5716)

(assert (=> d!55897 (= (choose!1034 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) (index!4879 lt!94354) key!828 v!309 (defaultEntry!3891 thiss!1248)) _$5!149)))

(declare-fun bs!7621 () Bool)

(assert (= bs!7621 d!55897))

(assert (=> bs!7621 m!216483))

(assert (=> bs!7621 m!216483))

(assert (=> bs!7621 m!216731))

(assert (=> bs!7621 m!216481))

(assert (=> bs!7621 m!216487))

(assert (=> d!55819 d!55897))

(assert (=> d!55819 d!55809))

(declare-fun d!55899 () Bool)

(assert (=> d!55899 (= (apply!180 lt!94494 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2199 (getValueByKey!235 (toList!1208 lt!94494) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7622 () Bool)

(assert (= bs!7622 d!55899))

(assert (=> bs!7622 m!216927))

(assert (=> bs!7622 m!216927))

(declare-fun m!216969 () Bool)

(assert (=> bs!7622 m!216969))

(assert (=> b!190677 d!55899))

(declare-fun d!55901 () Bool)

(declare-fun res!90203 () Bool)

(declare-fun e!125614 () Bool)

(assert (=> d!55901 (=> res!90203 e!125614)))

(assert (=> d!55901 (= res!90203 (and ((_ is Cons!2395) (toList!1208 lt!94352)) (= (_1!1749 (h!3033 (toList!1208 lt!94352))) key!828)))))

(assert (=> d!55901 (= (containsKey!239 (toList!1208 lt!94352) key!828) e!125614)))

(declare-fun b!190903 () Bool)

(declare-fun e!125615 () Bool)

(assert (=> b!190903 (= e!125614 e!125615)))

(declare-fun res!90204 () Bool)

(assert (=> b!190903 (=> (not res!90204) (not e!125615))))

(assert (=> b!190903 (= res!90204 (and (or (not ((_ is Cons!2395) (toList!1208 lt!94352))) (bvsle (_1!1749 (h!3033 (toList!1208 lt!94352))) key!828)) ((_ is Cons!2395) (toList!1208 lt!94352)) (bvslt (_1!1749 (h!3033 (toList!1208 lt!94352))) key!828)))))

(declare-fun b!190904 () Bool)

(assert (=> b!190904 (= e!125615 (containsKey!239 (t!7300 (toList!1208 lt!94352)) key!828))))

(assert (= (and d!55901 (not res!90203)) b!190903))

(assert (= (and b!190903 res!90204) b!190904))

(declare-fun m!216971 () Bool)

(assert (=> b!190904 m!216971))

(assert (=> d!55811 d!55901))

(declare-fun b!190917 () Bool)

(declare-fun e!125622 () SeekEntryResult!677)

(assert (=> b!190917 (= e!125622 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20504 lt!94400) #b00000000000000000000000000000001) (nextIndex!0 (index!4880 lt!94400) (x!20504 lt!94400) (mask!9097 thiss!1248)) (index!4880 lt!94400) key!828 (_keys!5863 thiss!1248) (mask!9097 thiss!1248)))))

(declare-fun b!190918 () Bool)

(declare-fun e!125623 () SeekEntryResult!677)

(assert (=> b!190918 (= e!125623 Undefined!677)))

(declare-fun b!190919 () Bool)

(declare-fun c!34364 () Bool)

(declare-fun lt!94628 () (_ BitVec 64))

(assert (=> b!190919 (= c!34364 (= lt!94628 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!125624 () SeekEntryResult!677)

(assert (=> b!190919 (= e!125624 e!125622)))

(declare-fun b!190920 () Bool)

(assert (=> b!190920 (= e!125624 (Found!677 (index!4880 lt!94400)))))

(declare-fun d!55903 () Bool)

(declare-fun lt!94627 () SeekEntryResult!677)

(assert (=> d!55903 (and (or ((_ is Undefined!677) lt!94627) (not ((_ is Found!677) lt!94627)) (and (bvsge (index!4879 lt!94627) #b00000000000000000000000000000000) (bvslt (index!4879 lt!94627) (size!4136 (_keys!5863 thiss!1248))))) (or ((_ is Undefined!677) lt!94627) ((_ is Found!677) lt!94627) (not ((_ is MissingVacant!677) lt!94627)) (not (= (index!4881 lt!94627) (index!4880 lt!94400))) (and (bvsge (index!4881 lt!94627) #b00000000000000000000000000000000) (bvslt (index!4881 lt!94627) (size!4136 (_keys!5863 thiss!1248))))) (or ((_ is Undefined!677) lt!94627) (ite ((_ is Found!677) lt!94627) (= (select (arr!3814 (_keys!5863 thiss!1248)) (index!4879 lt!94627)) key!828) (and ((_ is MissingVacant!677) lt!94627) (= (index!4881 lt!94627) (index!4880 lt!94400)) (= (select (arr!3814 (_keys!5863 thiss!1248)) (index!4881 lt!94627)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!55903 (= lt!94627 e!125623)))

(declare-fun c!34363 () Bool)

(assert (=> d!55903 (= c!34363 (bvsge (x!20504 lt!94400) #b01111111111111111111111111111110))))

(assert (=> d!55903 (= lt!94628 (select (arr!3814 (_keys!5863 thiss!1248)) (index!4880 lt!94400)))))

(assert (=> d!55903 (validMask!0 (mask!9097 thiss!1248))))

(assert (=> d!55903 (= (seekKeyOrZeroReturnVacant!0 (x!20504 lt!94400) (index!4880 lt!94400) (index!4880 lt!94400) key!828 (_keys!5863 thiss!1248) (mask!9097 thiss!1248)) lt!94627)))

(declare-fun b!190921 () Bool)

(assert (=> b!190921 (= e!125622 (MissingVacant!677 (index!4880 lt!94400)))))

(declare-fun b!190922 () Bool)

(assert (=> b!190922 (= e!125623 e!125624)))

(declare-fun c!34365 () Bool)

(assert (=> b!190922 (= c!34365 (= lt!94628 key!828))))

(assert (= (and d!55903 c!34363) b!190918))

(assert (= (and d!55903 (not c!34363)) b!190922))

(assert (= (and b!190922 c!34365) b!190920))

(assert (= (and b!190922 (not c!34365)) b!190919))

(assert (= (and b!190919 c!34364) b!190921))

(assert (= (and b!190919 (not c!34364)) b!190917))

(declare-fun m!216973 () Bool)

(assert (=> b!190917 m!216973))

(assert (=> b!190917 m!216973))

(declare-fun m!216975 () Bool)

(assert (=> b!190917 m!216975))

(declare-fun m!216977 () Bool)

(assert (=> d!55903 m!216977))

(declare-fun m!216979 () Bool)

(assert (=> d!55903 m!216979))

(assert (=> d!55903 m!216595))

(assert (=> d!55903 m!216493))

(assert (=> b!190601 d!55903))

(declare-fun b!190931 () Bool)

(declare-fun e!125632 () Bool)

(declare-fun e!125631 () Bool)

(assert (=> b!190931 (= e!125632 e!125631)))

(declare-fun c!34368 () Bool)

(assert (=> b!190931 (= c!34368 (validKeyInArray!0 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190932 () Bool)

(declare-fun e!125633 () Bool)

(assert (=> b!190932 (= e!125631 e!125633)))

(declare-fun lt!94637 () (_ BitVec 64))

(assert (=> b!190932 (= lt!94637 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94636 () Unit!5716)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8097 (_ BitVec 64) (_ BitVec 32)) Unit!5716)

(assert (=> b!190932 (= lt!94636 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5863 thiss!1248) lt!94637 #b00000000000000000000000000000000))))

(assert (=> b!190932 (arrayContainsKey!0 (_keys!5863 thiss!1248) lt!94637 #b00000000000000000000000000000000)))

(declare-fun lt!94635 () Unit!5716)

(assert (=> b!190932 (= lt!94635 lt!94636)))

(declare-fun res!90210 () Bool)

(assert (=> b!190932 (= res!90210 (= (seekEntryOrOpen!0 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000) (_keys!5863 thiss!1248) (mask!9097 thiss!1248)) (Found!677 #b00000000000000000000000000000000)))))

(assert (=> b!190932 (=> (not res!90210) (not e!125633))))

(declare-fun b!190933 () Bool)

(declare-fun call!19257 () Bool)

(assert (=> b!190933 (= e!125631 call!19257)))

(declare-fun b!190934 () Bool)

(assert (=> b!190934 (= e!125633 call!19257)))

(declare-fun bm!19254 () Bool)

(assert (=> bm!19254 (= call!19257 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5863 thiss!1248) (mask!9097 thiss!1248)))))

(declare-fun d!55905 () Bool)

(declare-fun res!90209 () Bool)

(assert (=> d!55905 (=> res!90209 e!125632)))

(assert (=> d!55905 (= res!90209 (bvsge #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))

(assert (=> d!55905 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5863 thiss!1248) (mask!9097 thiss!1248)) e!125632)))

(assert (= (and d!55905 (not res!90209)) b!190931))

(assert (= (and b!190931 c!34368) b!190932))

(assert (= (and b!190931 (not c!34368)) b!190933))

(assert (= (and b!190932 res!90210) b!190934))

(assert (= (or b!190934 b!190933) bm!19254))

(assert (=> b!190931 m!216611))

(assert (=> b!190931 m!216611))

(assert (=> b!190931 m!216655))

(assert (=> b!190932 m!216611))

(declare-fun m!216981 () Bool)

(assert (=> b!190932 m!216981))

(declare-fun m!216983 () Bool)

(assert (=> b!190932 m!216983))

(assert (=> b!190932 m!216611))

(declare-fun m!216985 () Bool)

(assert (=> b!190932 m!216985))

(declare-fun m!216987 () Bool)

(assert (=> bm!19254 m!216987))

(assert (=> b!190582 d!55905))

(declare-fun b!190935 () Bool)

(declare-fun e!125635 () Bool)

(declare-fun e!125638 () Bool)

(assert (=> b!190935 (= e!125635 e!125638)))

(assert (=> b!190935 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))

(declare-fun res!90211 () Bool)

(declare-fun lt!94640 () ListLongMap!2385)

(assert (=> b!190935 (= res!90211 (contains!1325 lt!94640 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190935 (=> (not res!90211) (not e!125638))))

(declare-fun call!19258 () ListLongMap!2385)

(declare-fun bm!19255 () Bool)

(assert (=> bm!19255 (= call!19258 (getCurrentListMapNoExtraKeys!201 (_keys!5863 thiss!1248) (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248))) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3891 thiss!1248)))))

(declare-fun b!190936 () Bool)

(declare-fun e!125637 () ListLongMap!2385)

(assert (=> b!190936 (= e!125637 call!19258)))

(declare-fun e!125640 () Bool)

(declare-fun b!190937 () Bool)

(assert (=> b!190937 (= e!125640 (= lt!94640 (getCurrentListMapNoExtraKeys!201 (_keys!5863 thiss!1248) (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248))) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3891 thiss!1248))))))

(declare-fun b!190938 () Bool)

(assert (=> b!190938 (= e!125640 (isEmpty!485 lt!94640))))

(declare-fun d!55907 () Bool)

(declare-fun e!125639 () Bool)

(assert (=> d!55907 e!125639))

(declare-fun res!90212 () Bool)

(assert (=> d!55907 (=> (not res!90212) (not e!125639))))

(assert (=> d!55907 (= res!90212 (not (contains!1325 lt!94640 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!125636 () ListLongMap!2385)

(assert (=> d!55907 (= lt!94640 e!125636)))

(declare-fun c!34370 () Bool)

(assert (=> d!55907 (= c!34370 (bvsge #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))

(assert (=> d!55907 (validMask!0 (mask!9097 thiss!1248))))

(assert (=> d!55907 (= (getCurrentListMapNoExtraKeys!201 (_keys!5863 thiss!1248) (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248))) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3891 thiss!1248)) lt!94640)))

(declare-fun b!190939 () Bool)

(declare-fun res!90213 () Bool)

(assert (=> b!190939 (=> (not res!90213) (not e!125639))))

(assert (=> b!190939 (= res!90213 (not (contains!1325 lt!94640 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190940 () Bool)

(declare-fun e!125634 () Bool)

(assert (=> b!190940 (= e!125634 (validKeyInArray!0 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190940 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!190941 () Bool)

(assert (=> b!190941 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))

(assert (=> b!190941 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4137 (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248))))))))

(assert (=> b!190941 (= e!125638 (= (apply!180 lt!94640 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)) (get!2198 (select (arr!3815 (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!190942 () Bool)

(assert (=> b!190942 (= e!125635 e!125640)))

(declare-fun c!34369 () Bool)

(assert (=> b!190942 (= c!34369 (bvslt #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))

(declare-fun b!190943 () Bool)

(assert (=> b!190943 (= e!125636 e!125637)))

(declare-fun c!34371 () Bool)

(assert (=> b!190943 (= c!34371 (validKeyInArray!0 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190944 () Bool)

(assert (=> b!190944 (= e!125636 (ListLongMap!2386 Nil!2396))))

(declare-fun b!190945 () Bool)

(assert (=> b!190945 (= e!125639 e!125635)))

(declare-fun c!34372 () Bool)

(assert (=> b!190945 (= c!34372 e!125634)))

(declare-fun res!90214 () Bool)

(assert (=> b!190945 (=> (not res!90214) (not e!125634))))

(assert (=> b!190945 (= res!90214 (bvslt #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))

(declare-fun b!190946 () Bool)

(declare-fun lt!94639 () Unit!5716)

(declare-fun lt!94641 () Unit!5716)

(assert (=> b!190946 (= lt!94639 lt!94641)))

(declare-fun lt!94644 () (_ BitVec 64))

(declare-fun lt!94642 () V!5569)

(declare-fun lt!94643 () (_ BitVec 64))

(declare-fun lt!94638 () ListLongMap!2385)

(assert (=> b!190946 (not (contains!1325 (+!300 lt!94638 (tuple2!3477 lt!94643 lt!94642)) lt!94644))))

(assert (=> b!190946 (= lt!94641 (addStillNotContains!95 lt!94638 lt!94643 lt!94642 lt!94644))))

(assert (=> b!190946 (= lt!94644 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!190946 (= lt!94642 (get!2198 (select (arr!3815 (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190946 (= lt!94643 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190946 (= lt!94638 call!19258)))

(assert (=> b!190946 (= e!125637 (+!300 call!19258 (tuple2!3477 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000) (get!2198 (select (arr!3815 (array!8100 (store (arr!3815 (_values!3874 thiss!1248)) (index!4879 lt!94354) (ValueCellFull!1877 v!309)) (size!4137 (_values!3874 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!55907 c!34370) b!190944))

(assert (= (and d!55907 (not c!34370)) b!190943))

(assert (= (and b!190943 c!34371) b!190946))

(assert (= (and b!190943 (not c!34371)) b!190936))

(assert (= (or b!190946 b!190936) bm!19255))

(assert (= (and d!55907 res!90212) b!190939))

(assert (= (and b!190939 res!90213) b!190945))

(assert (= (and b!190945 res!90214) b!190940))

(assert (= (and b!190945 c!34372) b!190935))

(assert (= (and b!190945 (not c!34372)) b!190942))

(assert (= (and b!190935 res!90211) b!190941))

(assert (= (and b!190942 c!34369) b!190937))

(assert (= (and b!190942 (not c!34369)) b!190938))

(declare-fun b_lambda!7361 () Bool)

(assert (=> (not b_lambda!7361) (not b!190941)))

(assert (=> b!190941 t!7303))

(declare-fun b_and!11315 () Bool)

(assert (= b_and!11313 (and (=> t!7303 result!4883) b_and!11315)))

(declare-fun b_lambda!7363 () Bool)

(assert (=> (not b_lambda!7363) (not b!190946)))

(assert (=> b!190946 t!7303))

(declare-fun b_and!11317 () Bool)

(assert (= b_and!11315 (and (=> t!7303 result!4883) b_and!11317)))

(declare-fun m!216989 () Bool)

(assert (=> d!55907 m!216989))

(assert (=> d!55907 m!216493))

(declare-fun m!216991 () Bool)

(assert (=> b!190939 m!216991))

(declare-fun m!216993 () Bool)

(assert (=> bm!19255 m!216993))

(assert (=> b!190941 m!216609))

(assert (=> b!190941 m!216611))

(assert (=> b!190941 m!216667))

(assert (=> b!190941 m!216611))

(declare-fun m!216995 () Bool)

(assert (=> b!190941 m!216995))

(assert (=> b!190941 m!216667))

(assert (=> b!190941 m!216609))

(assert (=> b!190941 m!216671))

(assert (=> b!190935 m!216611))

(assert (=> b!190935 m!216611))

(declare-fun m!216997 () Bool)

(assert (=> b!190935 m!216997))

(assert (=> b!190946 m!216609))

(assert (=> b!190946 m!216611))

(declare-fun m!216999 () Bool)

(assert (=> b!190946 m!216999))

(assert (=> b!190946 m!216667))

(declare-fun m!217001 () Bool)

(assert (=> b!190946 m!217001))

(declare-fun m!217003 () Bool)

(assert (=> b!190946 m!217003))

(assert (=> b!190946 m!216999))

(declare-fun m!217005 () Bool)

(assert (=> b!190946 m!217005))

(assert (=> b!190946 m!216667))

(assert (=> b!190946 m!216609))

(assert (=> b!190946 m!216671))

(assert (=> b!190940 m!216611))

(assert (=> b!190940 m!216611))

(assert (=> b!190940 m!216655))

(assert (=> b!190943 m!216611))

(assert (=> b!190943 m!216611))

(assert (=> b!190943 m!216655))

(declare-fun m!217007 () Bool)

(assert (=> b!190938 m!217007))

(assert (=> b!190937 m!216993))

(assert (=> b!190694 d!55907))

(declare-fun d!55909 () Bool)

(declare-fun e!125641 () Bool)

(assert (=> d!55909 e!125641))

(declare-fun res!90215 () Bool)

(assert (=> d!55909 (=> (not res!90215) (not e!125641))))

(declare-fun lt!94645 () ListLongMap!2385)

(assert (=> d!55909 (= res!90215 (contains!1325 lt!94645 (_1!1749 (tuple2!3477 lt!94497 (zeroValue!3732 thiss!1248)))))))

(declare-fun lt!94648 () List!2399)

(assert (=> d!55909 (= lt!94645 (ListLongMap!2386 lt!94648))))

(declare-fun lt!94647 () Unit!5716)

(declare-fun lt!94646 () Unit!5716)

(assert (=> d!55909 (= lt!94647 lt!94646)))

(assert (=> d!55909 (= (getValueByKey!235 lt!94648 (_1!1749 (tuple2!3477 lt!94497 (zeroValue!3732 thiss!1248)))) (Some!240 (_2!1749 (tuple2!3477 lt!94497 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!55909 (= lt!94646 (lemmaContainsTupThenGetReturnValue!125 lt!94648 (_1!1749 (tuple2!3477 lt!94497 (zeroValue!3732 thiss!1248))) (_2!1749 (tuple2!3477 lt!94497 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!55909 (= lt!94648 (insertStrictlySorted!128 (toList!1208 lt!94486) (_1!1749 (tuple2!3477 lt!94497 (zeroValue!3732 thiss!1248))) (_2!1749 (tuple2!3477 lt!94497 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!55909 (= (+!300 lt!94486 (tuple2!3477 lt!94497 (zeroValue!3732 thiss!1248))) lt!94645)))

(declare-fun b!190947 () Bool)

(declare-fun res!90216 () Bool)

(assert (=> b!190947 (=> (not res!90216) (not e!125641))))

(assert (=> b!190947 (= res!90216 (= (getValueByKey!235 (toList!1208 lt!94645) (_1!1749 (tuple2!3477 lt!94497 (zeroValue!3732 thiss!1248)))) (Some!240 (_2!1749 (tuple2!3477 lt!94497 (zeroValue!3732 thiss!1248))))))))

(declare-fun b!190948 () Bool)

(assert (=> b!190948 (= e!125641 (contains!1327 (toList!1208 lt!94645) (tuple2!3477 lt!94497 (zeroValue!3732 thiss!1248))))))

(assert (= (and d!55909 res!90215) b!190947))

(assert (= (and b!190947 res!90216) b!190948))

(declare-fun m!217009 () Bool)

(assert (=> d!55909 m!217009))

(declare-fun m!217011 () Bool)

(assert (=> d!55909 m!217011))

(declare-fun m!217013 () Bool)

(assert (=> d!55909 m!217013))

(declare-fun m!217015 () Bool)

(assert (=> d!55909 m!217015))

(declare-fun m!217017 () Bool)

(assert (=> b!190947 m!217017))

(declare-fun m!217019 () Bool)

(assert (=> b!190948 m!217019))

(assert (=> b!190694 d!55909))

(declare-fun d!55911 () Bool)

(declare-fun e!125642 () Bool)

(assert (=> d!55911 e!125642))

(declare-fun res!90217 () Bool)

(assert (=> d!55911 (=> (not res!90217) (not e!125642))))

(declare-fun lt!94649 () ListLongMap!2385)

(assert (=> d!55911 (= res!90217 (contains!1325 lt!94649 (_1!1749 (tuple2!3477 lt!94490 (minValue!3732 thiss!1248)))))))

(declare-fun lt!94652 () List!2399)

(assert (=> d!55911 (= lt!94649 (ListLongMap!2386 lt!94652))))

(declare-fun lt!94651 () Unit!5716)

(declare-fun lt!94650 () Unit!5716)

(assert (=> d!55911 (= lt!94651 lt!94650)))

(assert (=> d!55911 (= (getValueByKey!235 lt!94652 (_1!1749 (tuple2!3477 lt!94490 (minValue!3732 thiss!1248)))) (Some!240 (_2!1749 (tuple2!3477 lt!94490 (minValue!3732 thiss!1248)))))))

(assert (=> d!55911 (= lt!94650 (lemmaContainsTupThenGetReturnValue!125 lt!94652 (_1!1749 (tuple2!3477 lt!94490 (minValue!3732 thiss!1248))) (_2!1749 (tuple2!3477 lt!94490 (minValue!3732 thiss!1248)))))))

(assert (=> d!55911 (= lt!94652 (insertStrictlySorted!128 (toList!1208 lt!94492) (_1!1749 (tuple2!3477 lt!94490 (minValue!3732 thiss!1248))) (_2!1749 (tuple2!3477 lt!94490 (minValue!3732 thiss!1248)))))))

(assert (=> d!55911 (= (+!300 lt!94492 (tuple2!3477 lt!94490 (minValue!3732 thiss!1248))) lt!94649)))

(declare-fun b!190949 () Bool)

(declare-fun res!90218 () Bool)

(assert (=> b!190949 (=> (not res!90218) (not e!125642))))

(assert (=> b!190949 (= res!90218 (= (getValueByKey!235 (toList!1208 lt!94649) (_1!1749 (tuple2!3477 lt!94490 (minValue!3732 thiss!1248)))) (Some!240 (_2!1749 (tuple2!3477 lt!94490 (minValue!3732 thiss!1248))))))))

(declare-fun b!190950 () Bool)

(assert (=> b!190950 (= e!125642 (contains!1327 (toList!1208 lt!94649) (tuple2!3477 lt!94490 (minValue!3732 thiss!1248))))))

(assert (= (and d!55911 res!90217) b!190949))

(assert (= (and b!190949 res!90218) b!190950))

(declare-fun m!217021 () Bool)

(assert (=> d!55911 m!217021))

(declare-fun m!217023 () Bool)

(assert (=> d!55911 m!217023))

(declare-fun m!217025 () Bool)

(assert (=> d!55911 m!217025))

(declare-fun m!217027 () Bool)

(assert (=> d!55911 m!217027))

(declare-fun m!217029 () Bool)

(assert (=> b!190949 m!217029))

(declare-fun m!217031 () Bool)

(assert (=> b!190950 m!217031))

(assert (=> b!190694 d!55911))

(declare-fun d!55913 () Bool)

(assert (=> d!55913 (= (apply!180 (+!300 lt!94486 (tuple2!3477 lt!94497 (zeroValue!3732 thiss!1248))) lt!94484) (get!2199 (getValueByKey!235 (toList!1208 (+!300 lt!94486 (tuple2!3477 lt!94497 (zeroValue!3732 thiss!1248)))) lt!94484)))))

(declare-fun bs!7623 () Bool)

(assert (= bs!7623 d!55913))

(declare-fun m!217033 () Bool)

(assert (=> bs!7623 m!217033))

(assert (=> bs!7623 m!217033))

(declare-fun m!217035 () Bool)

(assert (=> bs!7623 m!217035))

(assert (=> b!190694 d!55913))

(declare-fun d!55915 () Bool)

(assert (=> d!55915 (= (apply!180 (+!300 lt!94486 (tuple2!3477 lt!94497 (zeroValue!3732 thiss!1248))) lt!94484) (apply!180 lt!94486 lt!94484))))

(declare-fun lt!94653 () Unit!5716)

(assert (=> d!55915 (= lt!94653 (choose!1038 lt!94486 lt!94497 (zeroValue!3732 thiss!1248) lt!94484))))

(declare-fun e!125643 () Bool)

(assert (=> d!55915 e!125643))

(declare-fun res!90219 () Bool)

(assert (=> d!55915 (=> (not res!90219) (not e!125643))))

(assert (=> d!55915 (= res!90219 (contains!1325 lt!94486 lt!94484))))

(assert (=> d!55915 (= (addApplyDifferent!156 lt!94486 lt!94497 (zeroValue!3732 thiss!1248) lt!94484) lt!94653)))

(declare-fun b!190951 () Bool)

(assert (=> b!190951 (= e!125643 (not (= lt!94484 lt!94497)))))

(assert (= (and d!55915 res!90219) b!190951))

(assert (=> d!55915 m!216687))

(declare-fun m!217037 () Bool)

(assert (=> d!55915 m!217037))

(assert (=> d!55915 m!216687))

(assert (=> d!55915 m!216695))

(declare-fun m!217039 () Bool)

(assert (=> d!55915 m!217039))

(assert (=> d!55915 m!216683))

(assert (=> b!190694 d!55915))

(declare-fun d!55917 () Bool)

(assert (=> d!55917 (= (apply!180 (+!300 lt!94492 (tuple2!3477 lt!94490 (minValue!3732 thiss!1248))) lt!94483) (apply!180 lt!94492 lt!94483))))

(declare-fun lt!94654 () Unit!5716)

(assert (=> d!55917 (= lt!94654 (choose!1038 lt!94492 lt!94490 (minValue!3732 thiss!1248) lt!94483))))

(declare-fun e!125644 () Bool)

(assert (=> d!55917 e!125644))

(declare-fun res!90220 () Bool)

(assert (=> d!55917 (=> (not res!90220) (not e!125644))))

(assert (=> d!55917 (= res!90220 (contains!1325 lt!94492 lt!94483))))

(assert (=> d!55917 (= (addApplyDifferent!156 lt!94492 lt!94490 (minValue!3732 thiss!1248) lt!94483) lt!94654)))

(declare-fun b!190952 () Bool)

(assert (=> b!190952 (= e!125644 (not (= lt!94483 lt!94490)))))

(assert (= (and d!55917 res!90220) b!190952))

(assert (=> d!55917 m!216691))

(declare-fun m!217041 () Bool)

(assert (=> d!55917 m!217041))

(assert (=> d!55917 m!216691))

(assert (=> d!55917 m!216693))

(declare-fun m!217043 () Bool)

(assert (=> d!55917 m!217043))

(assert (=> d!55917 m!216685))

(assert (=> b!190694 d!55917))

(declare-fun d!55919 () Bool)

(declare-fun e!125645 () Bool)

(assert (=> d!55919 e!125645))

(declare-fun res!90221 () Bool)

(assert (=> d!55919 (=> (not res!90221) (not e!125645))))

(declare-fun lt!94655 () ListLongMap!2385)

(assert (=> d!55919 (= res!90221 (contains!1325 lt!94655 (_1!1749 (tuple2!3477 lt!94485 (zeroValue!3732 thiss!1248)))))))

(declare-fun lt!94658 () List!2399)

(assert (=> d!55919 (= lt!94655 (ListLongMap!2386 lt!94658))))

(declare-fun lt!94657 () Unit!5716)

(declare-fun lt!94656 () Unit!5716)

(assert (=> d!55919 (= lt!94657 lt!94656)))

(assert (=> d!55919 (= (getValueByKey!235 lt!94658 (_1!1749 (tuple2!3477 lt!94485 (zeroValue!3732 thiss!1248)))) (Some!240 (_2!1749 (tuple2!3477 lt!94485 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!55919 (= lt!94656 (lemmaContainsTupThenGetReturnValue!125 lt!94658 (_1!1749 (tuple2!3477 lt!94485 (zeroValue!3732 thiss!1248))) (_2!1749 (tuple2!3477 lt!94485 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!55919 (= lt!94658 (insertStrictlySorted!128 (toList!1208 lt!94499) (_1!1749 (tuple2!3477 lt!94485 (zeroValue!3732 thiss!1248))) (_2!1749 (tuple2!3477 lt!94485 (zeroValue!3732 thiss!1248)))))))

(assert (=> d!55919 (= (+!300 lt!94499 (tuple2!3477 lt!94485 (zeroValue!3732 thiss!1248))) lt!94655)))

(declare-fun b!190953 () Bool)

(declare-fun res!90222 () Bool)

(assert (=> b!190953 (=> (not res!90222) (not e!125645))))

(assert (=> b!190953 (= res!90222 (= (getValueByKey!235 (toList!1208 lt!94655) (_1!1749 (tuple2!3477 lt!94485 (zeroValue!3732 thiss!1248)))) (Some!240 (_2!1749 (tuple2!3477 lt!94485 (zeroValue!3732 thiss!1248))))))))

(declare-fun b!190954 () Bool)

(assert (=> b!190954 (= e!125645 (contains!1327 (toList!1208 lt!94655) (tuple2!3477 lt!94485 (zeroValue!3732 thiss!1248))))))

(assert (= (and d!55919 res!90221) b!190953))

(assert (= (and b!190953 res!90222) b!190954))

(declare-fun m!217045 () Bool)

(assert (=> d!55919 m!217045))

(declare-fun m!217047 () Bool)

(assert (=> d!55919 m!217047))

(declare-fun m!217049 () Bool)

(assert (=> d!55919 m!217049))

(declare-fun m!217051 () Bool)

(assert (=> d!55919 m!217051))

(declare-fun m!217053 () Bool)

(assert (=> b!190953 m!217053))

(declare-fun m!217055 () Bool)

(assert (=> b!190954 m!217055))

(assert (=> b!190694 d!55919))

(declare-fun d!55921 () Bool)

(assert (=> d!55921 (= (apply!180 (+!300 lt!94482 (tuple2!3477 lt!94489 (minValue!3732 thiss!1248))) lt!94487) (get!2199 (getValueByKey!235 (toList!1208 (+!300 lt!94482 (tuple2!3477 lt!94489 (minValue!3732 thiss!1248)))) lt!94487)))))

(declare-fun bs!7624 () Bool)

(assert (= bs!7624 d!55921))

(declare-fun m!217057 () Bool)

(assert (=> bs!7624 m!217057))

(assert (=> bs!7624 m!217057))

(declare-fun m!217059 () Bool)

(assert (=> bs!7624 m!217059))

(assert (=> b!190694 d!55921))

(declare-fun d!55923 () Bool)

(assert (=> d!55923 (= (apply!180 (+!300 lt!94482 (tuple2!3477 lt!94489 (minValue!3732 thiss!1248))) lt!94487) (apply!180 lt!94482 lt!94487))))

(declare-fun lt!94659 () Unit!5716)

(assert (=> d!55923 (= lt!94659 (choose!1038 lt!94482 lt!94489 (minValue!3732 thiss!1248) lt!94487))))

(declare-fun e!125646 () Bool)

(assert (=> d!55923 e!125646))

(declare-fun res!90223 () Bool)

(assert (=> d!55923 (=> (not res!90223) (not e!125646))))

(assert (=> d!55923 (= res!90223 (contains!1325 lt!94482 lt!94487))))

(assert (=> d!55923 (= (addApplyDifferent!156 lt!94482 lt!94489 (minValue!3732 thiss!1248) lt!94487) lt!94659)))

(declare-fun b!190955 () Bool)

(assert (=> b!190955 (= e!125646 (not (= lt!94487 lt!94489)))))

(assert (= (and d!55923 res!90223) b!190955))

(assert (=> d!55923 m!216681))

(declare-fun m!217061 () Bool)

(assert (=> d!55923 m!217061))

(assert (=> d!55923 m!216681))

(assert (=> d!55923 m!216699))

(declare-fun m!217063 () Bool)

(assert (=> d!55923 m!217063))

(assert (=> d!55923 m!216697))

(assert (=> b!190694 d!55923))

(declare-fun d!55925 () Bool)

(declare-fun e!125648 () Bool)

(assert (=> d!55925 e!125648))

(declare-fun res!90224 () Bool)

(assert (=> d!55925 (=> res!90224 e!125648)))

(declare-fun lt!94663 () Bool)

(assert (=> d!55925 (= res!90224 (not lt!94663))))

(declare-fun lt!94660 () Bool)

(assert (=> d!55925 (= lt!94663 lt!94660)))

(declare-fun lt!94661 () Unit!5716)

(declare-fun e!125647 () Unit!5716)

(assert (=> d!55925 (= lt!94661 e!125647)))

(declare-fun c!34373 () Bool)

(assert (=> d!55925 (= c!34373 lt!94660)))

(assert (=> d!55925 (= lt!94660 (containsKey!239 (toList!1208 (+!300 lt!94499 (tuple2!3477 lt!94485 (zeroValue!3732 thiss!1248)))) lt!94491))))

(assert (=> d!55925 (= (contains!1325 (+!300 lt!94499 (tuple2!3477 lt!94485 (zeroValue!3732 thiss!1248))) lt!94491) lt!94663)))

(declare-fun b!190956 () Bool)

(declare-fun lt!94662 () Unit!5716)

(assert (=> b!190956 (= e!125647 lt!94662)))

(assert (=> b!190956 (= lt!94662 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1208 (+!300 lt!94499 (tuple2!3477 lt!94485 (zeroValue!3732 thiss!1248)))) lt!94491))))

(assert (=> b!190956 (isDefined!189 (getValueByKey!235 (toList!1208 (+!300 lt!94499 (tuple2!3477 lt!94485 (zeroValue!3732 thiss!1248)))) lt!94491))))

(declare-fun b!190957 () Bool)

(declare-fun Unit!5728 () Unit!5716)

(assert (=> b!190957 (= e!125647 Unit!5728)))

(declare-fun b!190958 () Bool)

(assert (=> b!190958 (= e!125648 (isDefined!189 (getValueByKey!235 (toList!1208 (+!300 lt!94499 (tuple2!3477 lt!94485 (zeroValue!3732 thiss!1248)))) lt!94491)))))

(assert (= (and d!55925 c!34373) b!190956))

(assert (= (and d!55925 (not c!34373)) b!190957))

(assert (= (and d!55925 (not res!90224)) b!190958))

(declare-fun m!217065 () Bool)

(assert (=> d!55925 m!217065))

(declare-fun m!217067 () Bool)

(assert (=> b!190956 m!217067))

(declare-fun m!217069 () Bool)

(assert (=> b!190956 m!217069))

(assert (=> b!190956 m!217069))

(declare-fun m!217071 () Bool)

(assert (=> b!190956 m!217071))

(assert (=> b!190958 m!217069))

(assert (=> b!190958 m!217069))

(assert (=> b!190958 m!217071))

(assert (=> b!190694 d!55925))

(declare-fun d!55927 () Bool)

(assert (=> d!55927 (contains!1325 (+!300 lt!94499 (tuple2!3477 lt!94485 (zeroValue!3732 thiss!1248))) lt!94491)))

(declare-fun lt!94664 () Unit!5716)

(assert (=> d!55927 (= lt!94664 (choose!1037 lt!94499 lt!94485 (zeroValue!3732 thiss!1248) lt!94491))))

(assert (=> d!55927 (contains!1325 lt!94499 lt!94491)))

(assert (=> d!55927 (= (addStillContains!156 lt!94499 lt!94485 (zeroValue!3732 thiss!1248) lt!94491) lt!94664)))

(declare-fun bs!7625 () Bool)

(assert (= bs!7625 d!55927))

(assert (=> bs!7625 m!216677))

(assert (=> bs!7625 m!216677))

(assert (=> bs!7625 m!216679))

(declare-fun m!217073 () Bool)

(assert (=> bs!7625 m!217073))

(declare-fun m!217075 () Bool)

(assert (=> bs!7625 m!217075))

(assert (=> b!190694 d!55927))

(declare-fun d!55929 () Bool)

(assert (=> d!55929 (= (apply!180 lt!94482 lt!94487) (get!2199 (getValueByKey!235 (toList!1208 lt!94482) lt!94487)))))

(declare-fun bs!7626 () Bool)

(assert (= bs!7626 d!55929))

(declare-fun m!217077 () Bool)

(assert (=> bs!7626 m!217077))

(assert (=> bs!7626 m!217077))

(declare-fun m!217079 () Bool)

(assert (=> bs!7626 m!217079))

(assert (=> b!190694 d!55929))

(declare-fun d!55931 () Bool)

(assert (=> d!55931 (= (apply!180 lt!94492 lt!94483) (get!2199 (getValueByKey!235 (toList!1208 lt!94492) lt!94483)))))

(declare-fun bs!7627 () Bool)

(assert (= bs!7627 d!55931))

(declare-fun m!217081 () Bool)

(assert (=> bs!7627 m!217081))

(assert (=> bs!7627 m!217081))

(declare-fun m!217083 () Bool)

(assert (=> bs!7627 m!217083))

(assert (=> b!190694 d!55931))

(declare-fun d!55933 () Bool)

(declare-fun e!125649 () Bool)

(assert (=> d!55933 e!125649))

(declare-fun res!90225 () Bool)

(assert (=> d!55933 (=> (not res!90225) (not e!125649))))

(declare-fun lt!94665 () ListLongMap!2385)

(assert (=> d!55933 (= res!90225 (contains!1325 lt!94665 (_1!1749 (tuple2!3477 lt!94489 (minValue!3732 thiss!1248)))))))

(declare-fun lt!94668 () List!2399)

(assert (=> d!55933 (= lt!94665 (ListLongMap!2386 lt!94668))))

(declare-fun lt!94667 () Unit!5716)

(declare-fun lt!94666 () Unit!5716)

(assert (=> d!55933 (= lt!94667 lt!94666)))

(assert (=> d!55933 (= (getValueByKey!235 lt!94668 (_1!1749 (tuple2!3477 lt!94489 (minValue!3732 thiss!1248)))) (Some!240 (_2!1749 (tuple2!3477 lt!94489 (minValue!3732 thiss!1248)))))))

(assert (=> d!55933 (= lt!94666 (lemmaContainsTupThenGetReturnValue!125 lt!94668 (_1!1749 (tuple2!3477 lt!94489 (minValue!3732 thiss!1248))) (_2!1749 (tuple2!3477 lt!94489 (minValue!3732 thiss!1248)))))))

(assert (=> d!55933 (= lt!94668 (insertStrictlySorted!128 (toList!1208 lt!94482) (_1!1749 (tuple2!3477 lt!94489 (minValue!3732 thiss!1248))) (_2!1749 (tuple2!3477 lt!94489 (minValue!3732 thiss!1248)))))))

(assert (=> d!55933 (= (+!300 lt!94482 (tuple2!3477 lt!94489 (minValue!3732 thiss!1248))) lt!94665)))

(declare-fun b!190959 () Bool)

(declare-fun res!90226 () Bool)

(assert (=> b!190959 (=> (not res!90226) (not e!125649))))

(assert (=> b!190959 (= res!90226 (= (getValueByKey!235 (toList!1208 lt!94665) (_1!1749 (tuple2!3477 lt!94489 (minValue!3732 thiss!1248)))) (Some!240 (_2!1749 (tuple2!3477 lt!94489 (minValue!3732 thiss!1248))))))))

(declare-fun b!190960 () Bool)

(assert (=> b!190960 (= e!125649 (contains!1327 (toList!1208 lt!94665) (tuple2!3477 lt!94489 (minValue!3732 thiss!1248))))))

(assert (= (and d!55933 res!90225) b!190959))

(assert (= (and b!190959 res!90226) b!190960))

(declare-fun m!217085 () Bool)

(assert (=> d!55933 m!217085))

(declare-fun m!217087 () Bool)

(assert (=> d!55933 m!217087))

(declare-fun m!217089 () Bool)

(assert (=> d!55933 m!217089))

(declare-fun m!217091 () Bool)

(assert (=> d!55933 m!217091))

(declare-fun m!217093 () Bool)

(assert (=> b!190959 m!217093))

(declare-fun m!217095 () Bool)

(assert (=> b!190960 m!217095))

(assert (=> b!190694 d!55933))

(declare-fun d!55935 () Bool)

(assert (=> d!55935 (= (apply!180 lt!94486 lt!94484) (get!2199 (getValueByKey!235 (toList!1208 lt!94486) lt!94484)))))

(declare-fun bs!7628 () Bool)

(assert (= bs!7628 d!55935))

(declare-fun m!217097 () Bool)

(assert (=> bs!7628 m!217097))

(assert (=> bs!7628 m!217097))

(declare-fun m!217099 () Bool)

(assert (=> bs!7628 m!217099))

(assert (=> b!190694 d!55935))

(declare-fun d!55937 () Bool)

(assert (=> d!55937 (= (apply!180 (+!300 lt!94492 (tuple2!3477 lt!94490 (minValue!3732 thiss!1248))) lt!94483) (get!2199 (getValueByKey!235 (toList!1208 (+!300 lt!94492 (tuple2!3477 lt!94490 (minValue!3732 thiss!1248)))) lt!94483)))))

(declare-fun bs!7629 () Bool)

(assert (= bs!7629 d!55937))

(declare-fun m!217101 () Bool)

(assert (=> bs!7629 m!217101))

(assert (=> bs!7629 m!217101))

(declare-fun m!217103 () Bool)

(assert (=> bs!7629 m!217103))

(assert (=> b!190694 d!55937))

(assert (=> d!55823 d!55807))

(declare-fun d!55939 () Bool)

(declare-fun e!125652 () Bool)

(assert (=> d!55939 e!125652))

(declare-fun res!90231 () Bool)

(assert (=> d!55939 (=> (not res!90231) (not e!125652))))

(declare-fun lt!94671 () SeekEntryResult!677)

(assert (=> d!55939 (= res!90231 ((_ is Found!677) lt!94671))))

(assert (=> d!55939 (= lt!94671 (seekEntryOrOpen!0 key!828 (_keys!5863 thiss!1248) (mask!9097 thiss!1248)))))

(assert (=> d!55939 true))

(declare-fun _$33!141 () Unit!5716)

(assert (=> d!55939 (= (choose!1036 (_keys!5863 thiss!1248) (_values!3874 thiss!1248) (mask!9097 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) key!828 (defaultEntry!3891 thiss!1248)) _$33!141)))

(declare-fun b!190965 () Bool)

(declare-fun res!90232 () Bool)

(assert (=> b!190965 (=> (not res!90232) (not e!125652))))

(assert (=> b!190965 (= res!90232 (inRange!0 (index!4879 lt!94671) (mask!9097 thiss!1248)))))

(declare-fun b!190966 () Bool)

(assert (=> b!190966 (= e!125652 (= (select (arr!3814 (_keys!5863 thiss!1248)) (index!4879 lt!94671)) key!828))))

(assert (= (and d!55939 res!90231) b!190965))

(assert (= (and b!190965 res!90232) b!190966))

(assert (=> d!55939 m!216495))

(declare-fun m!217105 () Bool)

(assert (=> b!190965 m!217105))

(declare-fun m!217107 () Bool)

(assert (=> b!190966 m!217107))

(assert (=> d!55823 d!55939))

(assert (=> d!55823 d!55809))

(declare-fun d!55941 () Bool)

(declare-fun e!125654 () Bool)

(assert (=> d!55941 e!125654))

(declare-fun res!90233 () Bool)

(assert (=> d!55941 (=> res!90233 e!125654)))

(declare-fun lt!94675 () Bool)

(assert (=> d!55941 (= res!90233 (not lt!94675))))

(declare-fun lt!94672 () Bool)

(assert (=> d!55941 (= lt!94675 lt!94672)))

(declare-fun lt!94673 () Unit!5716)

(declare-fun e!125653 () Unit!5716)

(assert (=> d!55941 (= lt!94673 e!125653)))

(declare-fun c!34374 () Bool)

(assert (=> d!55941 (= c!34374 lt!94672)))

(assert (=> d!55941 (= lt!94672 (containsKey!239 (toList!1208 lt!94472) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55941 (= (contains!1325 lt!94472 #b1000000000000000000000000000000000000000000000000000000000000000) lt!94675)))

(declare-fun b!190967 () Bool)

(declare-fun lt!94674 () Unit!5716)

(assert (=> b!190967 (= e!125653 lt!94674)))

(assert (=> b!190967 (= lt!94674 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1208 lt!94472) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190967 (isDefined!189 (getValueByKey!235 (toList!1208 lt!94472) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190968 () Bool)

(declare-fun Unit!5729 () Unit!5716)

(assert (=> b!190968 (= e!125653 Unit!5729)))

(declare-fun b!190969 () Bool)

(assert (=> b!190969 (= e!125654 (isDefined!189 (getValueByKey!235 (toList!1208 lt!94472) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55941 c!34374) b!190967))

(assert (= (and d!55941 (not c!34374)) b!190968))

(assert (= (and d!55941 (not res!90233)) b!190969))

(declare-fun m!217109 () Bool)

(assert (=> d!55941 m!217109))

(declare-fun m!217111 () Bool)

(assert (=> b!190967 m!217111))

(assert (=> b!190967 m!216893))

(assert (=> b!190967 m!216893))

(declare-fun m!217113 () Bool)

(assert (=> b!190967 m!217113))

(assert (=> b!190969 m!216893))

(assert (=> b!190969 m!216893))

(assert (=> b!190969 m!217113))

(assert (=> bm!19222 d!55941))

(declare-fun b!190980 () Bool)

(declare-fun e!125664 () Bool)

(declare-fun call!19261 () Bool)

(assert (=> b!190980 (= e!125664 call!19261)))

(declare-fun b!190981 () Bool)

(declare-fun e!125665 () Bool)

(declare-fun contains!1328 (List!2401 (_ BitVec 64)) Bool)

(assert (=> b!190981 (= e!125665 (contains!1328 Nil!2398 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19258 () Bool)

(declare-fun c!34377 () Bool)

(assert (=> bm!19258 (= call!19261 (arrayNoDuplicates!0 (_keys!5863 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34377 (Cons!2397 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000) Nil!2398) Nil!2398)))))

(declare-fun b!190983 () Bool)

(declare-fun e!125663 () Bool)

(assert (=> b!190983 (= e!125663 e!125664)))

(assert (=> b!190983 (= c!34377 (validKeyInArray!0 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190984 () Bool)

(assert (=> b!190984 (= e!125664 call!19261)))

(declare-fun d!55943 () Bool)

(declare-fun res!90242 () Bool)

(declare-fun e!125666 () Bool)

(assert (=> d!55943 (=> res!90242 e!125666)))

(assert (=> d!55943 (= res!90242 (bvsge #b00000000000000000000000000000000 (size!4136 (_keys!5863 thiss!1248))))))

(assert (=> d!55943 (= (arrayNoDuplicates!0 (_keys!5863 thiss!1248) #b00000000000000000000000000000000 Nil!2398) e!125666)))

(declare-fun b!190982 () Bool)

(assert (=> b!190982 (= e!125666 e!125663)))

(declare-fun res!90240 () Bool)

(assert (=> b!190982 (=> (not res!90240) (not e!125663))))

(assert (=> b!190982 (= res!90240 (not e!125665))))

(declare-fun res!90241 () Bool)

(assert (=> b!190982 (=> (not res!90241) (not e!125665))))

(assert (=> b!190982 (= res!90241 (validKeyInArray!0 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55943 (not res!90242)) b!190982))

(assert (= (and b!190982 res!90241) b!190981))

(assert (= (and b!190982 res!90240) b!190983))

(assert (= (and b!190983 c!34377) b!190980))

(assert (= (and b!190983 (not c!34377)) b!190984))

(assert (= (or b!190980 b!190984) bm!19258))

(assert (=> b!190981 m!216611))

(assert (=> b!190981 m!216611))

(declare-fun m!217115 () Bool)

(assert (=> b!190981 m!217115))

(assert (=> bm!19258 m!216611))

(declare-fun m!217117 () Bool)

(assert (=> bm!19258 m!217117))

(assert (=> b!190983 m!216611))

(assert (=> b!190983 m!216611))

(assert (=> b!190983 m!216655))

(assert (=> b!190982 m!216611))

(assert (=> b!190982 m!216611))

(assert (=> b!190982 m!216655))

(assert (=> b!190583 d!55943))

(declare-fun d!55945 () Bool)

(assert (=> d!55945 (= (apply!180 lt!94472 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)) (get!2199 (getValueByKey!235 (toList!1208 lt!94472) (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7630 () Bool)

(assert (= bs!7630 d!55945))

(assert (=> bs!7630 m!216611))

(declare-fun m!217119 () Bool)

(assert (=> bs!7630 m!217119))

(assert (=> bs!7630 m!217119))

(declare-fun m!217121 () Bool)

(assert (=> bs!7630 m!217121))

(assert (=> b!190661 d!55945))

(declare-fun d!55947 () Bool)

(declare-fun c!34378 () Bool)

(assert (=> d!55947 (= c!34378 ((_ is ValueCellFull!1877) (select (arr!3815 (_values!3874 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!125667 () V!5569)

(assert (=> d!55947 (= (get!2198 (select (arr!3815 (_values!3874 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!125667)))

(declare-fun b!190985 () Bool)

(assert (=> b!190985 (= e!125667 (get!2200 (select (arr!3815 (_values!3874 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190986 () Bool)

(assert (=> b!190986 (= e!125667 (get!2201 (select (arr!3815 (_values!3874 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!514 (defaultEntry!3891 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55947 c!34378) b!190985))

(assert (= (and d!55947 (not c!34378)) b!190986))

(assert (=> b!190985 m!216613))

(assert (=> b!190985 m!216609))

(declare-fun m!217123 () Bool)

(assert (=> b!190985 m!217123))

(assert (=> b!190986 m!216613))

(assert (=> b!190986 m!216609))

(declare-fun m!217125 () Bool)

(assert (=> b!190986 m!217125))

(assert (=> b!190661 d!55947))

(assert (=> b!190690 d!55877))

(declare-fun d!55949 () Bool)

(declare-fun res!90247 () Bool)

(declare-fun e!125672 () Bool)

(assert (=> d!55949 (=> res!90247 e!125672)))

(assert (=> d!55949 (= res!90247 (= (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!55949 (= (arrayContainsKey!0 (_keys!5863 thiss!1248) key!828 #b00000000000000000000000000000000) e!125672)))

(declare-fun b!190991 () Bool)

(declare-fun e!125673 () Bool)

(assert (=> b!190991 (= e!125672 e!125673)))

(declare-fun res!90248 () Bool)

(assert (=> b!190991 (=> (not res!90248) (not e!125673))))

(assert (=> b!190991 (= res!90248 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4136 (_keys!5863 thiss!1248))))))

(declare-fun b!190992 () Bool)

(assert (=> b!190992 (= e!125673 (arrayContainsKey!0 (_keys!5863 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!55949 (not res!90247)) b!190991))

(assert (= (and b!190991 res!90248) b!190992))

(assert (=> d!55949 m!216611))

(declare-fun m!217127 () Bool)

(assert (=> b!190992 m!217127))

(assert (=> bm!19238 d!55949))

(declare-fun d!55951 () Bool)

(declare-fun e!125675 () Bool)

(assert (=> d!55951 e!125675))

(declare-fun res!90249 () Bool)

(assert (=> d!55951 (=> res!90249 e!125675)))

(declare-fun lt!94679 () Bool)

(assert (=> d!55951 (= res!90249 (not lt!94679))))

(declare-fun lt!94676 () Bool)

(assert (=> d!55951 (= lt!94679 lt!94676)))

(declare-fun lt!94677 () Unit!5716)

(declare-fun e!125674 () Unit!5716)

(assert (=> d!55951 (= lt!94677 e!125674)))

(declare-fun c!34379 () Bool)

(assert (=> d!55951 (= c!34379 lt!94676)))

(assert (=> d!55951 (= lt!94676 (containsKey!239 (toList!1208 lt!94510) (_1!1749 (tuple2!3477 key!828 v!309))))))

(assert (=> d!55951 (= (contains!1325 lt!94510 (_1!1749 (tuple2!3477 key!828 v!309))) lt!94679)))

(declare-fun b!190993 () Bool)

(declare-fun lt!94678 () Unit!5716)

(assert (=> b!190993 (= e!125674 lt!94678)))

(assert (=> b!190993 (= lt!94678 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1208 lt!94510) (_1!1749 (tuple2!3477 key!828 v!309))))))

(assert (=> b!190993 (isDefined!189 (getValueByKey!235 (toList!1208 lt!94510) (_1!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun b!190994 () Bool)

(declare-fun Unit!5730 () Unit!5716)

(assert (=> b!190994 (= e!125674 Unit!5730)))

(declare-fun b!190995 () Bool)

(assert (=> b!190995 (= e!125675 (isDefined!189 (getValueByKey!235 (toList!1208 lt!94510) (_1!1749 (tuple2!3477 key!828 v!309)))))))

(assert (= (and d!55951 c!34379) b!190993))

(assert (= (and d!55951 (not c!34379)) b!190994))

(assert (= (and d!55951 (not res!90249)) b!190995))

(declare-fun m!217129 () Bool)

(assert (=> d!55951 m!217129))

(declare-fun m!217131 () Bool)

(assert (=> b!190993 m!217131))

(assert (=> b!190993 m!216725))

(assert (=> b!190993 m!216725))

(declare-fun m!217133 () Bool)

(assert (=> b!190993 m!217133))

(assert (=> b!190995 m!216725))

(assert (=> b!190995 m!216725))

(assert (=> b!190995 m!217133))

(assert (=> d!55817 d!55951))

(declare-fun d!55953 () Bool)

(declare-fun c!34380 () Bool)

(assert (=> d!55953 (= c!34380 (and ((_ is Cons!2395) lt!94513) (= (_1!1749 (h!3033 lt!94513)) (_1!1749 (tuple2!3477 key!828 v!309)))))))

(declare-fun e!125676 () Option!241)

(assert (=> d!55953 (= (getValueByKey!235 lt!94513 (_1!1749 (tuple2!3477 key!828 v!309))) e!125676)))

(declare-fun e!125677 () Option!241)

(declare-fun b!190998 () Bool)

(assert (=> b!190998 (= e!125677 (getValueByKey!235 (t!7300 lt!94513) (_1!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun b!190997 () Bool)

(assert (=> b!190997 (= e!125676 e!125677)))

(declare-fun c!34381 () Bool)

(assert (=> b!190997 (= c!34381 (and ((_ is Cons!2395) lt!94513) (not (= (_1!1749 (h!3033 lt!94513)) (_1!1749 (tuple2!3477 key!828 v!309))))))))

(declare-fun b!190999 () Bool)

(assert (=> b!190999 (= e!125677 None!239)))

(declare-fun b!190996 () Bool)

(assert (=> b!190996 (= e!125676 (Some!240 (_2!1749 (h!3033 lt!94513))))))

(assert (= (and d!55953 c!34380) b!190996))

(assert (= (and d!55953 (not c!34380)) b!190997))

(assert (= (and b!190997 c!34381) b!190998))

(assert (= (and b!190997 (not c!34381)) b!190999))

(declare-fun m!217135 () Bool)

(assert (=> b!190998 m!217135))

(assert (=> d!55817 d!55953))

(declare-fun d!55955 () Bool)

(assert (=> d!55955 (= (getValueByKey!235 lt!94513 (_1!1749 (tuple2!3477 key!828 v!309))) (Some!240 (_2!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun lt!94682 () Unit!5716)

(declare-fun choose!1039 (List!2399 (_ BitVec 64) V!5569) Unit!5716)

(assert (=> d!55955 (= lt!94682 (choose!1039 lt!94513 (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun e!125680 () Bool)

(assert (=> d!55955 e!125680))

(declare-fun res!90254 () Bool)

(assert (=> d!55955 (=> (not res!90254) (not e!125680))))

(declare-fun isStrictlySorted!349 (List!2399) Bool)

(assert (=> d!55955 (= res!90254 (isStrictlySorted!349 lt!94513))))

(assert (=> d!55955 (= (lemmaContainsTupThenGetReturnValue!125 lt!94513 (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309))) lt!94682)))

(declare-fun b!191004 () Bool)

(declare-fun res!90255 () Bool)

(assert (=> b!191004 (=> (not res!90255) (not e!125680))))

(assert (=> b!191004 (= res!90255 (containsKey!239 lt!94513 (_1!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun b!191005 () Bool)

(assert (=> b!191005 (= e!125680 (contains!1327 lt!94513 (tuple2!3477 (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309)))))))

(assert (= (and d!55955 res!90254) b!191004))

(assert (= (and b!191004 res!90255) b!191005))

(assert (=> d!55955 m!216719))

(declare-fun m!217137 () Bool)

(assert (=> d!55955 m!217137))

(declare-fun m!217139 () Bool)

(assert (=> d!55955 m!217139))

(declare-fun m!217141 () Bool)

(assert (=> b!191004 m!217141))

(declare-fun m!217143 () Bool)

(assert (=> b!191005 m!217143))

(assert (=> d!55817 d!55955))

(declare-fun d!55957 () Bool)

(declare-fun e!125694 () Bool)

(assert (=> d!55957 e!125694))

(declare-fun res!90260 () Bool)

(assert (=> d!55957 (=> (not res!90260) (not e!125694))))

(declare-fun lt!94685 () List!2399)

(assert (=> d!55957 (= res!90260 (isStrictlySorted!349 lt!94685))))

(declare-fun e!125692 () List!2399)

(assert (=> d!55957 (= lt!94685 e!125692)))

(declare-fun c!34391 () Bool)

(assert (=> d!55957 (= c!34391 (and ((_ is Cons!2395) (toList!1208 lt!94352)) (bvslt (_1!1749 (h!3033 (toList!1208 lt!94352))) (_1!1749 (tuple2!3477 key!828 v!309)))))))

(assert (=> d!55957 (isStrictlySorted!349 (toList!1208 lt!94352))))

(assert (=> d!55957 (= (insertStrictlySorted!128 (toList!1208 lt!94352) (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309))) lt!94685)))

(declare-fun b!191026 () Bool)

(declare-fun e!125695 () List!2399)

(declare-fun call!19268 () List!2399)

(assert (=> b!191026 (= e!125695 call!19268)))

(declare-fun e!125693 () List!2399)

(declare-fun b!191027 () Bool)

(assert (=> b!191027 (= e!125693 (insertStrictlySorted!128 (t!7300 (toList!1208 lt!94352)) (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun b!191028 () Bool)

(assert (=> b!191028 (= e!125694 (contains!1327 lt!94685 (tuple2!3477 (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309)))))))

(declare-fun b!191029 () Bool)

(assert (=> b!191029 (= e!125692 e!125695)))

(declare-fun c!34393 () Bool)

(assert (=> b!191029 (= c!34393 (and ((_ is Cons!2395) (toList!1208 lt!94352)) (= (_1!1749 (h!3033 (toList!1208 lt!94352))) (_1!1749 (tuple2!3477 key!828 v!309)))))))

(declare-fun bm!19265 () Bool)

(declare-fun call!19270 () List!2399)

(declare-fun $colon$colon!99 (List!2399 tuple2!3476) List!2399)

(assert (=> bm!19265 (= call!19270 ($colon$colon!99 e!125693 (ite c!34391 (h!3033 (toList!1208 lt!94352)) (tuple2!3477 (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309))))))))

(declare-fun c!34390 () Bool)

(assert (=> bm!19265 (= c!34390 c!34391)))

(declare-fun b!191030 () Bool)

(declare-fun e!125691 () List!2399)

(declare-fun call!19269 () List!2399)

(assert (=> b!191030 (= e!125691 call!19269)))

(declare-fun bm!19266 () Bool)

(assert (=> bm!19266 (= call!19268 call!19270)))

(declare-fun b!191031 () Bool)

(declare-fun c!34392 () Bool)

(assert (=> b!191031 (= e!125693 (ite c!34393 (t!7300 (toList!1208 lt!94352)) (ite c!34392 (Cons!2395 (h!3033 (toList!1208 lt!94352)) (t!7300 (toList!1208 lt!94352))) Nil!2396)))))

(declare-fun b!191032 () Bool)

(declare-fun res!90261 () Bool)

(assert (=> b!191032 (=> (not res!90261) (not e!125694))))

(assert (=> b!191032 (= res!90261 (containsKey!239 lt!94685 (_1!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun b!191033 () Bool)

(assert (=> b!191033 (= c!34392 (and ((_ is Cons!2395) (toList!1208 lt!94352)) (bvsgt (_1!1749 (h!3033 (toList!1208 lt!94352))) (_1!1749 (tuple2!3477 key!828 v!309)))))))

(assert (=> b!191033 (= e!125695 e!125691)))

(declare-fun bm!19267 () Bool)

(assert (=> bm!19267 (= call!19269 call!19268)))

(declare-fun b!191034 () Bool)

(assert (=> b!191034 (= e!125692 call!19270)))

(declare-fun b!191035 () Bool)

(assert (=> b!191035 (= e!125691 call!19269)))

(assert (= (and d!55957 c!34391) b!191034))

(assert (= (and d!55957 (not c!34391)) b!191029))

(assert (= (and b!191029 c!34393) b!191026))

(assert (= (and b!191029 (not c!34393)) b!191033))

(assert (= (and b!191033 c!34392) b!191030))

(assert (= (and b!191033 (not c!34392)) b!191035))

(assert (= (or b!191030 b!191035) bm!19267))

(assert (= (or b!191026 bm!19267) bm!19266))

(assert (= (or b!191034 bm!19266) bm!19265))

(assert (= (and bm!19265 c!34390) b!191027))

(assert (= (and bm!19265 (not c!34390)) b!191031))

(assert (= (and d!55957 res!90260) b!191032))

(assert (= (and b!191032 res!90261) b!191028))

(declare-fun m!217145 () Bool)

(assert (=> b!191028 m!217145))

(declare-fun m!217147 () Bool)

(assert (=> b!191027 m!217147))

(declare-fun m!217149 () Bool)

(assert (=> d!55957 m!217149))

(declare-fun m!217151 () Bool)

(assert (=> d!55957 m!217151))

(declare-fun m!217153 () Bool)

(assert (=> bm!19265 m!217153))

(declare-fun m!217155 () Bool)

(assert (=> b!191032 m!217155))

(assert (=> d!55817 d!55957))

(declare-fun d!55959 () Bool)

(assert (=> d!55959 (= (apply!180 lt!94494 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2199 (getValueByKey!235 (toList!1208 lt!94494) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7631 () Bool)

(assert (= bs!7631 d!55959))

(declare-fun m!217157 () Bool)

(assert (=> bs!7631 m!217157))

(assert (=> bs!7631 m!217157))

(declare-fun m!217159 () Bool)

(assert (=> bs!7631 m!217159))

(assert (=> b!190676 d!55959))

(declare-fun d!55961 () Bool)

(declare-fun e!125697 () Bool)

(assert (=> d!55961 e!125697))

(declare-fun res!90262 () Bool)

(assert (=> d!55961 (=> res!90262 e!125697)))

(declare-fun lt!94689 () Bool)

(assert (=> d!55961 (= res!90262 (not lt!94689))))

(declare-fun lt!94686 () Bool)

(assert (=> d!55961 (= lt!94689 lt!94686)))

(declare-fun lt!94687 () Unit!5716)

(declare-fun e!125696 () Unit!5716)

(assert (=> d!55961 (= lt!94687 e!125696)))

(declare-fun c!34394 () Bool)

(assert (=> d!55961 (= c!34394 lt!94686)))

(assert (=> d!55961 (= lt!94686 (containsKey!239 (toList!1208 lt!94472) (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55961 (= (contains!1325 lt!94472 (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)) lt!94689)))

(declare-fun b!191036 () Bool)

(declare-fun lt!94688 () Unit!5716)

(assert (=> b!191036 (= e!125696 lt!94688)))

(assert (=> b!191036 (= lt!94688 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1208 lt!94472) (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191036 (isDefined!189 (getValueByKey!235 (toList!1208 lt!94472) (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191037 () Bool)

(declare-fun Unit!5731 () Unit!5716)

(assert (=> b!191037 (= e!125696 Unit!5731)))

(declare-fun b!191038 () Bool)

(assert (=> b!191038 (= e!125697 (isDefined!189 (getValueByKey!235 (toList!1208 lt!94472) (select (arr!3814 (_keys!5863 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55961 c!34394) b!191036))

(assert (= (and d!55961 (not c!34394)) b!191037))

(assert (= (and d!55961 (not res!90262)) b!191038))

(assert (=> d!55961 m!216611))

(declare-fun m!217161 () Bool)

(assert (=> d!55961 m!217161))

(assert (=> b!191036 m!216611))

(declare-fun m!217163 () Bool)

(assert (=> b!191036 m!217163))

(assert (=> b!191036 m!216611))

(assert (=> b!191036 m!217119))

(assert (=> b!191036 m!217119))

(declare-fun m!217165 () Bool)

(assert (=> b!191036 m!217165))

(assert (=> b!191038 m!216611))

(assert (=> b!191038 m!217119))

(assert (=> b!191038 m!217119))

(assert (=> b!191038 m!217165))

(assert (=> b!190663 d!55961))

(declare-fun b!191047 () Bool)

(declare-fun res!90274 () Bool)

(declare-fun e!125700 () Bool)

(assert (=> b!191047 (=> (not res!90274) (not e!125700))))

(assert (=> b!191047 (= res!90274 (and (= (size!4137 (_values!3874 thiss!1248)) (bvadd (mask!9097 thiss!1248) #b00000000000000000000000000000001)) (= (size!4136 (_keys!5863 thiss!1248)) (size!4137 (_values!3874 thiss!1248))) (bvsge (_size!1380 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1380 thiss!1248) (bvadd (mask!9097 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!191049 () Bool)

(declare-fun res!90272 () Bool)

(assert (=> b!191049 (=> (not res!90272) (not e!125700))))

(declare-fun size!4142 (LongMapFixedSize!2662) (_ BitVec 32))

(assert (=> b!191049 (= res!90272 (= (size!4142 thiss!1248) (bvadd (_size!1380 thiss!1248) (bvsdiv (bvadd (extraKeys!3628 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!55963 () Bool)

(declare-fun res!90271 () Bool)

(assert (=> d!55963 (=> (not res!90271) (not e!125700))))

(assert (=> d!55963 (= res!90271 (validMask!0 (mask!9097 thiss!1248)))))

(assert (=> d!55963 (= (simpleValid!196 thiss!1248) e!125700)))

(declare-fun b!191050 () Bool)

(assert (=> b!191050 (= e!125700 (and (bvsge (extraKeys!3628 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3628 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1380 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!191048 () Bool)

(declare-fun res!90273 () Bool)

(assert (=> b!191048 (=> (not res!90273) (not e!125700))))

(assert (=> b!191048 (= res!90273 (bvsge (size!4142 thiss!1248) (_size!1380 thiss!1248)))))

(assert (= (and d!55963 res!90271) b!191047))

(assert (= (and b!191047 res!90274) b!191048))

(assert (= (and b!191048 res!90273) b!191049))

(assert (= (and b!191049 res!90272) b!191050))

(declare-fun m!217167 () Bool)

(assert (=> b!191049 m!217167))

(assert (=> d!55963 m!216493))

(assert (=> b!191048 m!217167))

(assert (=> d!55805 d!55963))

(assert (=> bm!19231 d!55907))

(declare-fun d!55965 () Bool)

(declare-fun isEmpty!486 (Option!241) Bool)

(assert (=> d!55965 (= (isDefined!189 (getValueByKey!235 (toList!1208 lt!94352) key!828)) (not (isEmpty!486 (getValueByKey!235 (toList!1208 lt!94352) key!828))))))

(declare-fun bs!7632 () Bool)

(assert (= bs!7632 d!55965))

(assert (=> bs!7632 m!216603))

(declare-fun m!217169 () Bool)

(assert (=> bs!7632 m!217169))

(assert (=> b!190610 d!55965))

(declare-fun d!55967 () Bool)

(declare-fun c!34395 () Bool)

(assert (=> d!55967 (= c!34395 (and ((_ is Cons!2395) (toList!1208 lt!94352)) (= (_1!1749 (h!3033 (toList!1208 lt!94352))) key!828)))))

(declare-fun e!125701 () Option!241)

(assert (=> d!55967 (= (getValueByKey!235 (toList!1208 lt!94352) key!828) e!125701)))

(declare-fun b!191053 () Bool)

(declare-fun e!125702 () Option!241)

(assert (=> b!191053 (= e!125702 (getValueByKey!235 (t!7300 (toList!1208 lt!94352)) key!828))))

(declare-fun b!191052 () Bool)

(assert (=> b!191052 (= e!125701 e!125702)))

(declare-fun c!34396 () Bool)

(assert (=> b!191052 (= c!34396 (and ((_ is Cons!2395) (toList!1208 lt!94352)) (not (= (_1!1749 (h!3033 (toList!1208 lt!94352))) key!828))))))

(declare-fun b!191054 () Bool)

(assert (=> b!191054 (= e!125702 None!239)))

(declare-fun b!191051 () Bool)

(assert (=> b!191051 (= e!125701 (Some!240 (_2!1749 (h!3033 (toList!1208 lt!94352)))))))

(assert (= (and d!55967 c!34395) b!191051))

(assert (= (and d!55967 (not c!34395)) b!191052))

(assert (= (and b!191052 c!34396) b!191053))

(assert (= (and b!191052 (not c!34396)) b!191054))

(declare-fun m!217171 () Bool)

(assert (=> b!191053 m!217171))

(assert (=> b!190610 d!55967))

(declare-fun d!55969 () Bool)

(declare-fun e!125704 () Bool)

(assert (=> d!55969 e!125704))

(declare-fun res!90275 () Bool)

(assert (=> d!55969 (=> res!90275 e!125704)))

(declare-fun lt!94693 () Bool)

(assert (=> d!55969 (= res!90275 (not lt!94693))))

(declare-fun lt!94690 () Bool)

(assert (=> d!55969 (= lt!94693 lt!94690)))

(declare-fun lt!94691 () Unit!5716)

(declare-fun e!125703 () Unit!5716)

(assert (=> d!55969 (= lt!94691 e!125703)))

(declare-fun c!34397 () Bool)

(assert (=> d!55969 (= c!34397 lt!94690)))

(assert (=> d!55969 (= lt!94690 (containsKey!239 (toList!1208 lt!94494) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55969 (= (contains!1325 lt!94494 #b1000000000000000000000000000000000000000000000000000000000000000) lt!94693)))

(declare-fun b!191055 () Bool)

(declare-fun lt!94692 () Unit!5716)

(assert (=> b!191055 (= e!125703 lt!94692)))

(assert (=> b!191055 (= lt!94692 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1208 lt!94494) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191055 (isDefined!189 (getValueByKey!235 (toList!1208 lt!94494) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191056 () Bool)

(declare-fun Unit!5732 () Unit!5716)

(assert (=> b!191056 (= e!125703 Unit!5732)))

(declare-fun b!191057 () Bool)

(assert (=> b!191057 (= e!125704 (isDefined!189 (getValueByKey!235 (toList!1208 lt!94494) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55969 c!34397) b!191055))

(assert (= (and d!55969 (not c!34397)) b!191056))

(assert (= (and d!55969 (not res!90275)) b!191057))

(declare-fun m!217173 () Bool)

(assert (=> d!55969 m!217173))

(declare-fun m!217175 () Bool)

(assert (=> b!191055 m!217175))

(assert (=> b!191055 m!217157))

(assert (=> b!191055 m!217157))

(declare-fun m!217177 () Bool)

(assert (=> b!191055 m!217177))

(assert (=> b!191057 m!217157))

(assert (=> b!191057 m!217157))

(assert (=> b!191057 m!217177))

(assert (=> bm!19229 d!55969))

(declare-fun d!55971 () Bool)

(declare-fun e!125706 () Bool)

(assert (=> d!55971 e!125706))

(declare-fun res!90276 () Bool)

(assert (=> d!55971 (=> res!90276 e!125706)))

(declare-fun lt!94697 () Bool)

(assert (=> d!55971 (= res!90276 (not lt!94697))))

(declare-fun lt!94694 () Bool)

(assert (=> d!55971 (= lt!94697 lt!94694)))

(declare-fun lt!94695 () Unit!5716)

(declare-fun e!125705 () Unit!5716)

(assert (=> d!55971 (= lt!94695 e!125705)))

(declare-fun c!34398 () Bool)

(assert (=> d!55971 (= c!34398 lt!94694)))

(assert (=> d!55971 (= lt!94694 (containsKey!239 (toList!1208 lt!94472) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55971 (= (contains!1325 lt!94472 #b0000000000000000000000000000000000000000000000000000000000000000) lt!94697)))

(declare-fun b!191058 () Bool)

(declare-fun lt!94696 () Unit!5716)

(assert (=> b!191058 (= e!125705 lt!94696)))

(assert (=> b!191058 (= lt!94696 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1208 lt!94472) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191058 (isDefined!189 (getValueByKey!235 (toList!1208 lt!94472) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191059 () Bool)

(declare-fun Unit!5733 () Unit!5716)

(assert (=> b!191059 (= e!125705 Unit!5733)))

(declare-fun b!191060 () Bool)

(assert (=> b!191060 (= e!125706 (isDefined!189 (getValueByKey!235 (toList!1208 lt!94472) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55971 c!34398) b!191058))

(assert (= (and d!55971 (not c!34398)) b!191059))

(assert (= (and d!55971 (not res!90276)) b!191060))

(declare-fun m!217179 () Bool)

(assert (=> d!55971 m!217179))

(declare-fun m!217181 () Bool)

(assert (=> b!191058 m!217181))

(assert (=> b!191058 m!216751))

(assert (=> b!191058 m!216751))

(declare-fun m!217183 () Bool)

(assert (=> b!191058 m!217183))

(assert (=> b!191060 m!216751))

(assert (=> b!191060 m!216751))

(assert (=> b!191060 m!217183))

(assert (=> bm!19226 d!55971))

(declare-fun d!55973 () Bool)

(declare-fun e!125707 () Bool)

(assert (=> d!55973 e!125707))

(declare-fun res!90277 () Bool)

(assert (=> d!55973 (=> (not res!90277) (not e!125707))))

(declare-fun lt!94698 () ListLongMap!2385)

(assert (=> d!55973 (= res!90277 (contains!1325 lt!94698 (_1!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(declare-fun lt!94701 () List!2399)

(assert (=> d!55973 (= lt!94698 (ListLongMap!2386 lt!94701))))

(declare-fun lt!94700 () Unit!5716)

(declare-fun lt!94699 () Unit!5716)

(assert (=> d!55973 (= lt!94700 lt!94699)))

(assert (=> d!55973 (= (getValueByKey!235 lt!94701 (_1!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))) (Some!240 (_2!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(assert (=> d!55973 (= lt!94699 (lemmaContainsTupThenGetReturnValue!125 lt!94701 (_1!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))) (_2!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(assert (=> d!55973 (= lt!94701 (insertStrictlySorted!128 (toList!1208 call!19223) (_1!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))) (_2!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))))))

(assert (=> d!55973 (= (+!300 call!19223 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))) lt!94698)))

(declare-fun b!191061 () Bool)

(declare-fun res!90278 () Bool)

(assert (=> b!191061 (=> (not res!90278) (not e!125707))))

(assert (=> b!191061 (= res!90278 (= (getValueByKey!235 (toList!1208 lt!94698) (_1!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248)))) (Some!240 (_2!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))))

(declare-fun b!191062 () Bool)

(assert (=> b!191062 (= e!125707 (contains!1327 (toList!1208 lt!94698) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3732 thiss!1248))))))

(assert (= (and d!55973 res!90277) b!191061))

(assert (= (and b!191061 res!90278) b!191062))

(declare-fun m!217185 () Bool)

(assert (=> d!55973 m!217185))

(declare-fun m!217187 () Bool)

(assert (=> d!55973 m!217187))

(declare-fun m!217189 () Bool)

(assert (=> d!55973 m!217189))

(declare-fun m!217191 () Bool)

(assert (=> d!55973 m!217191))

(declare-fun m!217193 () Bool)

(assert (=> b!191061 m!217193))

(declare-fun m!217195 () Bool)

(assert (=> b!191062 m!217195))

(assert (=> b!190657 d!55973))

(declare-fun d!55975 () Bool)

(assert (=> d!55975 (isDefined!189 (getValueByKey!235 (toList!1208 lt!94352) key!828))))

(declare-fun lt!94704 () Unit!5716)

(declare-fun choose!1040 (List!2399 (_ BitVec 64)) Unit!5716)

(assert (=> d!55975 (= lt!94704 (choose!1040 (toList!1208 lt!94352) key!828))))

(declare-fun e!125710 () Bool)

(assert (=> d!55975 e!125710))

(declare-fun res!90281 () Bool)

(assert (=> d!55975 (=> (not res!90281) (not e!125710))))

(assert (=> d!55975 (= res!90281 (isStrictlySorted!349 (toList!1208 lt!94352)))))

(assert (=> d!55975 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1208 lt!94352) key!828) lt!94704)))

(declare-fun b!191065 () Bool)

(assert (=> b!191065 (= e!125710 (containsKey!239 (toList!1208 lt!94352) key!828))))

(assert (= (and d!55975 res!90281) b!191065))

(assert (=> d!55975 m!216603))

(assert (=> d!55975 m!216603))

(assert (=> d!55975 m!216605))

(declare-fun m!217197 () Bool)

(assert (=> d!55975 m!217197))

(assert (=> d!55975 m!217151))

(assert (=> b!191065 m!216599))

(assert (=> b!190608 d!55975))

(assert (=> b!190608 d!55965))

(assert (=> b!190608 d!55967))

(declare-fun b!191066 () Bool)

(declare-fun e!125711 () Bool)

(assert (=> b!191066 (= e!125711 tp_is_empty!4441)))

(declare-fun mapNonEmpty!7677 () Bool)

(declare-fun mapRes!7677 () Bool)

(declare-fun tp!16866 () Bool)

(assert (=> mapNonEmpty!7677 (= mapRes!7677 (and tp!16866 e!125711))))

(declare-fun mapKey!7677 () (_ BitVec 32))

(declare-fun mapRest!7677 () (Array (_ BitVec 32) ValueCell!1877))

(declare-fun mapValue!7677 () ValueCell!1877)

(assert (=> mapNonEmpty!7677 (= mapRest!7676 (store mapRest!7677 mapKey!7677 mapValue!7677))))

(declare-fun condMapEmpty!7677 () Bool)

(declare-fun mapDefault!7677 () ValueCell!1877)

(assert (=> mapNonEmpty!7676 (= condMapEmpty!7677 (= mapRest!7676 ((as const (Array (_ BitVec 32) ValueCell!1877)) mapDefault!7677)))))

(declare-fun e!125712 () Bool)

(assert (=> mapNonEmpty!7676 (= tp!16865 (and e!125712 mapRes!7677))))

(declare-fun b!191067 () Bool)

(assert (=> b!191067 (= e!125712 tp_is_empty!4441)))

(declare-fun mapIsEmpty!7677 () Bool)

(assert (=> mapIsEmpty!7677 mapRes!7677))

(assert (= (and mapNonEmpty!7676 condMapEmpty!7677) mapIsEmpty!7677))

(assert (= (and mapNonEmpty!7676 (not condMapEmpty!7677)) mapNonEmpty!7677))

(assert (= (and mapNonEmpty!7677 ((_ is ValueCellFull!1877) mapValue!7677)) b!191066))

(assert (= (and mapNonEmpty!7676 ((_ is ValueCellFull!1877) mapDefault!7677)) b!191067))

(declare-fun m!217199 () Bool)

(assert (=> mapNonEmpty!7677 m!217199))

(declare-fun b_lambda!7365 () Bool)

(assert (= b_lambda!7363 (or (and b!190505 b_free!4669) b_lambda!7365)))

(declare-fun b_lambda!7367 () Bool)

(assert (= b_lambda!7357 (or (and b!190505 b_free!4669) b_lambda!7367)))

(declare-fun b_lambda!7369 () Bool)

(assert (= b_lambda!7361 (or (and b!190505 b_free!4669) b_lambda!7369)))

(declare-fun b_lambda!7371 () Bool)

(assert (= b_lambda!7359 (or (and b!190505 b_free!4669) b_lambda!7371)))

(check-sat (not bm!19248) (not b!190840) (not b!190981) (not b!190939) (not b!190833) (not b!190917) (not b!190746) (not d!55971) (not b!190993) (not b!190896) (not b!190969) (not d!55851) (not b!190884) (not b!190992) (not b!191053) (not b!191058) tp_is_empty!4441 (not d!55935) (not d!55859) (not b!190789) (not b_lambda!7355) (not b!190744) (not b!190965) (not bm!19242) (not b!190758) (not d!55889) (not d!55893) (not b!191061) (not b!190958) (not d!55845) (not d!55959) (not b!191060) (not d!55911) (not b!190883) (not d!55919) (not d!55849) (not b!190880) (not d!55957) (not b!190960) (not b!191036) (not b!190798) (not d!55913) (not d!55863) (not d!55933) (not d!55835) (not b!191048) (not b!190788) (not b!190938) (not b!191004) (not mapNonEmpty!7677) (not b!190954) (not b!191027) (not d!55879) (not b!190940) (not d!55915) (not b!190755) (not d!55897) (not b!190937) (not b!190983) (not b!190935) (not d!55843) (not d!55945) (not b!190967) (not b_lambda!7371) b_and!11317 (not d!55867) (not d!55937) (not b!190932) (not b!190841) (not bm!19254) (not b!190959) (not b!190838) (not b_lambda!7369) (not b_next!4669) (not b!191057) (not b!190947) (not b!190882) (not b!190754) (not b!190881) (not d!55931) (not bm!19265) (not b!190839) (not d!55839) (not d!55831) (not bm!19247) (not d!55875) (not b!190786) (not d!55871) (not d!55975) (not b!191032) (not b_lambda!7353) (not bm!19251) (not b!190878) (not b!191028) (not d!55909) (not b!190799) (not d!55961) (not b!190797) (not b!190931) (not b!190756) (not d!55903) (not b!190790) (not b!190985) (not d!55925) (not d!55951) (not b!190876) (not bm!19255) (not d!55929) (not b!190941) (not b!190943) (not b!191038) (not b!191062) (not d!55927) (not bm!19258) (not b!190787) (not d!55827) (not b!191065) (not d!55887) (not b!190986) (not b!190998) (not b!190748) (not b!190953) (not b!190885) (not d!55955) (not d!55969) (not b!190948) (not d!55921) (not b_lambda!7367) (not b!190949) (not d!55973) (not d!55841) (not d!55855) (not d!55891) (not d!55833) (not b!190904) (not d!55899) (not b!190800) (not d!55917) (not b!190784) (not b!190956) (not d!55939) (not b!190792) (not b!191005) (not d!55857) (not b!190749) (not d!55869) (not b!190946) (not b!190824) (not d!55923) (not d!55847) (not d!55829) (not d!55965) (not d!55853) (not b!190886) (not b!190950) (not d!55907) (not b!191049) (not d!55963) (not b!190795) (not b_lambda!7365) (not d!55941) (not b!191055) (not d!55837) (not d!55861) (not b!190982) (not b!190995))
(check-sat b_and!11317 (not b_next!4669))
