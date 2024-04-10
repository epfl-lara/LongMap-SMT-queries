; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17668 () Bool)

(assert start!17668)

(declare-fun b!176621 () Bool)

(declare-fun b_free!4359 () Bool)

(declare-fun b_next!4359 () Bool)

(assert (=> b!176621 (= b_free!4359 (not b_next!4359))))

(declare-fun tp!15771 () Bool)

(declare-fun b_and!10855 () Bool)

(assert (=> b!176621 (= tp!15771 b_and!10855)))

(declare-fun e!116514 () Bool)

(declare-fun tp_is_empty!4131 () Bool)

(declare-fun e!116516 () Bool)

(declare-datatypes ((V!5155 0))(
  ( (V!5156 (val!2110 Int)) )
))
(declare-datatypes ((ValueCell!1722 0))(
  ( (ValueCellFull!1722 (v!3988 V!5155)) (EmptyCell!1722) )
))
(declare-datatypes ((array!7409 0))(
  ( (array!7410 (arr!3515 (Array (_ BitVec 32) (_ BitVec 64))) (size!3819 (_ BitVec 32))) )
))
(declare-datatypes ((array!7411 0))(
  ( (array!7412 (arr!3516 (Array (_ BitVec 32) ValueCell!1722)) (size!3820 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2352 0))(
  ( (LongMapFixedSize!2353 (defaultEntry!3637 Int) (mask!8559 (_ BitVec 32)) (extraKeys!3374 (_ BitVec 32)) (zeroValue!3478 V!5155) (minValue!3478 V!5155) (_size!1225 (_ BitVec 32)) (_keys!5500 array!7409) (_values!3620 array!7411) (_vacant!1225 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2352)

(declare-fun array_inv!2251 (array!7409) Bool)

(declare-fun array_inv!2252 (array!7411) Bool)

(assert (=> b!176621 (= e!116516 (and tp!15771 tp_is_empty!4131 (array_inv!2251 (_keys!5500 thiss!1248)) (array_inv!2252 (_values!3620 thiss!1248)) e!116514))))

(declare-fun b!176622 () Bool)

(declare-fun e!116515 () Bool)

(assert (=> b!176622 (= e!116515 tp_is_empty!4131)))

(declare-fun mapIsEmpty!7053 () Bool)

(declare-fun mapRes!7053 () Bool)

(assert (=> mapIsEmpty!7053 mapRes!7053))

(declare-fun b!176623 () Bool)

(declare-fun res!83699 () Bool)

(declare-fun e!116512 () Bool)

(assert (=> b!176623 (=> (not res!83699) (not e!116512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!176623 (= res!83699 (validMask!0 (mask!8559 thiss!1248)))))

(declare-fun b!176624 () Bool)

(declare-fun e!116513 () Bool)

(assert (=> b!176624 (= e!116514 (and e!116513 mapRes!7053))))

(declare-fun condMapEmpty!7053 () Bool)

(declare-fun mapDefault!7053 () ValueCell!1722)

(assert (=> b!176624 (= condMapEmpty!7053 (= (arr!3516 (_values!3620 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1722)) mapDefault!7053)))))

(declare-fun res!83704 () Bool)

(assert (=> start!17668 (=> (not res!83704) (not e!116512))))

(declare-fun valid!988 (LongMapFixedSize!2352) Bool)

(assert (=> start!17668 (= res!83704 (valid!988 thiss!1248))))

(assert (=> start!17668 e!116512))

(assert (=> start!17668 e!116516))

(assert (=> start!17668 true))

(declare-fun b!176625 () Bool)

(declare-fun res!83700 () Bool)

(assert (=> b!176625 (=> (not res!83700) (not e!116512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7409 (_ BitVec 32)) Bool)

(assert (=> b!176625 (= res!83700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5500 thiss!1248) (mask!8559 thiss!1248)))))

(declare-fun b!176626 () Bool)

(declare-fun res!83703 () Bool)

(assert (=> b!176626 (=> (not res!83703) (not e!116512))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!176626 (= res!83703 (not (= key!828 (bvneg key!828))))))

(declare-fun b!176627 () Bool)

(declare-fun res!83705 () Bool)

(assert (=> b!176627 (=> (not res!83705) (not e!116512))))

(declare-datatypes ((tuple2!3284 0))(
  ( (tuple2!3285 (_1!1653 (_ BitVec 64)) (_2!1653 V!5155)) )
))
(declare-datatypes ((List!2237 0))(
  ( (Nil!2234) (Cons!2233 (h!2854 tuple2!3284) (t!7063 List!2237)) )
))
(declare-datatypes ((ListLongMap!2211 0))(
  ( (ListLongMap!2212 (toList!1121 List!2237)) )
))
(declare-fun contains!1185 (ListLongMap!2211 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!773 (array!7409 array!7411 (_ BitVec 32) (_ BitVec 32) V!5155 V!5155 (_ BitVec 32) Int) ListLongMap!2211)

(assert (=> b!176627 (= res!83705 (contains!1185 (getCurrentListMap!773 (_keys!5500 thiss!1248) (_values!3620 thiss!1248) (mask!8559 thiss!1248) (extraKeys!3374 thiss!1248) (zeroValue!3478 thiss!1248) (minValue!3478 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3637 thiss!1248)) key!828))))

(declare-fun b!176628 () Bool)

(assert (=> b!176628 (= e!116513 tp_is_empty!4131)))

(declare-fun b!176629 () Bool)

(declare-fun res!83702 () Bool)

(assert (=> b!176629 (=> (not res!83702) (not e!116512))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!556 0))(
  ( (MissingZero!556 (index!4392 (_ BitVec 32))) (Found!556 (index!4393 (_ BitVec 32))) (Intermediate!556 (undefined!1368 Bool) (index!4394 (_ BitVec 32)) (x!19384 (_ BitVec 32))) (Undefined!556) (MissingVacant!556 (index!4395 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7409 (_ BitVec 32)) SeekEntryResult!556)

(assert (=> b!176629 (= res!83702 ((_ is Undefined!556) (seekEntryOrOpen!0 key!828 (_keys!5500 thiss!1248) (mask!8559 thiss!1248))))))

(declare-fun b!176630 () Bool)

(declare-fun res!83701 () Bool)

(assert (=> b!176630 (=> (not res!83701) (not e!116512))))

(assert (=> b!176630 (= res!83701 (and (= (size!3820 (_values!3620 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8559 thiss!1248))) (= (size!3819 (_keys!5500 thiss!1248)) (size!3820 (_values!3620 thiss!1248))) (bvsge (mask!8559 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3374 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3374 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!7053 () Bool)

(declare-fun tp!15770 () Bool)

(assert (=> mapNonEmpty!7053 (= mapRes!7053 (and tp!15770 e!116515))))

(declare-fun mapKey!7053 () (_ BitVec 32))

(declare-fun mapValue!7053 () ValueCell!1722)

(declare-fun mapRest!7053 () (Array (_ BitVec 32) ValueCell!1722))

(assert (=> mapNonEmpty!7053 (= (arr!3516 (_values!3620 thiss!1248)) (store mapRest!7053 mapKey!7053 mapValue!7053))))

(declare-fun b!176631 () Bool)

(declare-datatypes ((List!2238 0))(
  ( (Nil!2235) (Cons!2234 (h!2855 (_ BitVec 64)) (t!7064 List!2238)) )
))
(declare-fun arrayNoDuplicates!0 (array!7409 (_ BitVec 32) List!2238) Bool)

(assert (=> b!176631 (= e!116512 (not (arrayNoDuplicates!0 (_keys!5500 thiss!1248) #b00000000000000000000000000000000 Nil!2235)))))

(assert (= (and start!17668 res!83704) b!176626))

(assert (= (and b!176626 res!83703) b!176629))

(assert (= (and b!176629 res!83702) b!176627))

(assert (= (and b!176627 res!83705) b!176623))

(assert (= (and b!176623 res!83699) b!176630))

(assert (= (and b!176630 res!83701) b!176625))

(assert (= (and b!176625 res!83700) b!176631))

(assert (= (and b!176624 condMapEmpty!7053) mapIsEmpty!7053))

(assert (= (and b!176624 (not condMapEmpty!7053)) mapNonEmpty!7053))

(assert (= (and mapNonEmpty!7053 ((_ is ValueCellFull!1722) mapValue!7053)) b!176622))

(assert (= (and b!176624 ((_ is ValueCellFull!1722) mapDefault!7053)) b!176628))

(assert (= b!176621 b!176624))

(assert (= start!17668 b!176621))

(declare-fun m!205383 () Bool)

(assert (=> b!176623 m!205383))

(declare-fun m!205385 () Bool)

(assert (=> b!176627 m!205385))

(assert (=> b!176627 m!205385))

(declare-fun m!205387 () Bool)

(assert (=> b!176627 m!205387))

(declare-fun m!205389 () Bool)

(assert (=> b!176629 m!205389))

(declare-fun m!205391 () Bool)

(assert (=> b!176631 m!205391))

(declare-fun m!205393 () Bool)

(assert (=> mapNonEmpty!7053 m!205393))

(declare-fun m!205395 () Bool)

(assert (=> b!176621 m!205395))

(declare-fun m!205397 () Bool)

(assert (=> b!176621 m!205397))

(declare-fun m!205399 () Bool)

(assert (=> b!176625 m!205399))

(declare-fun m!205401 () Bool)

(assert (=> start!17668 m!205401))

(check-sat (not b!176629) (not b!176623) (not b!176627) (not mapNonEmpty!7053) (not start!17668) (not b_next!4359) (not b!176631) (not b!176621) tp_is_empty!4131 b_and!10855 (not b!176625))
(check-sat b_and!10855 (not b_next!4359))
(get-model)

(declare-fun d!53687 () Bool)

(assert (=> d!53687 (= (validMask!0 (mask!8559 thiss!1248)) (and (or (= (mask!8559 thiss!1248) #b00000000000000000000000000000111) (= (mask!8559 thiss!1248) #b00000000000000000000000000001111) (= (mask!8559 thiss!1248) #b00000000000000000000000000011111) (= (mask!8559 thiss!1248) #b00000000000000000000000000111111) (= (mask!8559 thiss!1248) #b00000000000000000000000001111111) (= (mask!8559 thiss!1248) #b00000000000000000000000011111111) (= (mask!8559 thiss!1248) #b00000000000000000000000111111111) (= (mask!8559 thiss!1248) #b00000000000000000000001111111111) (= (mask!8559 thiss!1248) #b00000000000000000000011111111111) (= (mask!8559 thiss!1248) #b00000000000000000000111111111111) (= (mask!8559 thiss!1248) #b00000000000000000001111111111111) (= (mask!8559 thiss!1248) #b00000000000000000011111111111111) (= (mask!8559 thiss!1248) #b00000000000000000111111111111111) (= (mask!8559 thiss!1248) #b00000000000000001111111111111111) (= (mask!8559 thiss!1248) #b00000000000000011111111111111111) (= (mask!8559 thiss!1248) #b00000000000000111111111111111111) (= (mask!8559 thiss!1248) #b00000000000001111111111111111111) (= (mask!8559 thiss!1248) #b00000000000011111111111111111111) (= (mask!8559 thiss!1248) #b00000000000111111111111111111111) (= (mask!8559 thiss!1248) #b00000000001111111111111111111111) (= (mask!8559 thiss!1248) #b00000000011111111111111111111111) (= (mask!8559 thiss!1248) #b00000000111111111111111111111111) (= (mask!8559 thiss!1248) #b00000001111111111111111111111111) (= (mask!8559 thiss!1248) #b00000011111111111111111111111111) (= (mask!8559 thiss!1248) #b00000111111111111111111111111111) (= (mask!8559 thiss!1248) #b00001111111111111111111111111111) (= (mask!8559 thiss!1248) #b00011111111111111111111111111111) (= (mask!8559 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8559 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!176623 d!53687))

(declare-fun d!53689 () Bool)

(declare-fun e!116539 () Bool)

(assert (=> d!53689 e!116539))

(declare-fun res!83729 () Bool)

(assert (=> d!53689 (=> res!83729 e!116539)))

(declare-fun lt!87385 () Bool)

(assert (=> d!53689 (= res!83729 (not lt!87385))))

(declare-fun lt!87386 () Bool)

(assert (=> d!53689 (= lt!87385 lt!87386)))

(declare-datatypes ((Unit!5408 0))(
  ( (Unit!5409) )
))
(declare-fun lt!87387 () Unit!5408)

(declare-fun e!116540 () Unit!5408)

(assert (=> d!53689 (= lt!87387 e!116540)))

(declare-fun c!31663 () Bool)

(assert (=> d!53689 (= c!31663 lt!87386)))

(declare-fun containsKey!197 (List!2237 (_ BitVec 64)) Bool)

(assert (=> d!53689 (= lt!87386 (containsKey!197 (toList!1121 (getCurrentListMap!773 (_keys!5500 thiss!1248) (_values!3620 thiss!1248) (mask!8559 thiss!1248) (extraKeys!3374 thiss!1248) (zeroValue!3478 thiss!1248) (minValue!3478 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3637 thiss!1248))) key!828))))

(assert (=> d!53689 (= (contains!1185 (getCurrentListMap!773 (_keys!5500 thiss!1248) (_values!3620 thiss!1248) (mask!8559 thiss!1248) (extraKeys!3374 thiss!1248) (zeroValue!3478 thiss!1248) (minValue!3478 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3637 thiss!1248)) key!828) lt!87385)))

(declare-fun b!176671 () Bool)

(declare-fun lt!87384 () Unit!5408)

(assert (=> b!176671 (= e!116540 lt!87384)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!145 (List!2237 (_ BitVec 64)) Unit!5408)

(assert (=> b!176671 (= lt!87384 (lemmaContainsKeyImpliesGetValueByKeyDefined!145 (toList!1121 (getCurrentListMap!773 (_keys!5500 thiss!1248) (_values!3620 thiss!1248) (mask!8559 thiss!1248) (extraKeys!3374 thiss!1248) (zeroValue!3478 thiss!1248) (minValue!3478 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3637 thiss!1248))) key!828))))

(declare-datatypes ((Option!199 0))(
  ( (Some!198 (v!3990 V!5155)) (None!197) )
))
(declare-fun isDefined!146 (Option!199) Bool)

(declare-fun getValueByKey!193 (List!2237 (_ BitVec 64)) Option!199)

(assert (=> b!176671 (isDefined!146 (getValueByKey!193 (toList!1121 (getCurrentListMap!773 (_keys!5500 thiss!1248) (_values!3620 thiss!1248) (mask!8559 thiss!1248) (extraKeys!3374 thiss!1248) (zeroValue!3478 thiss!1248) (minValue!3478 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3637 thiss!1248))) key!828))))

(declare-fun b!176672 () Bool)

(declare-fun Unit!5410 () Unit!5408)

(assert (=> b!176672 (= e!116540 Unit!5410)))

(declare-fun b!176673 () Bool)

(assert (=> b!176673 (= e!116539 (isDefined!146 (getValueByKey!193 (toList!1121 (getCurrentListMap!773 (_keys!5500 thiss!1248) (_values!3620 thiss!1248) (mask!8559 thiss!1248) (extraKeys!3374 thiss!1248) (zeroValue!3478 thiss!1248) (minValue!3478 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3637 thiss!1248))) key!828)))))

(assert (= (and d!53689 c!31663) b!176671))

(assert (= (and d!53689 (not c!31663)) b!176672))

(assert (= (and d!53689 (not res!83729)) b!176673))

(declare-fun m!205423 () Bool)

(assert (=> d!53689 m!205423))

(declare-fun m!205425 () Bool)

(assert (=> b!176671 m!205425))

(declare-fun m!205427 () Bool)

(assert (=> b!176671 m!205427))

(assert (=> b!176671 m!205427))

(declare-fun m!205429 () Bool)

(assert (=> b!176671 m!205429))

(assert (=> b!176673 m!205427))

(assert (=> b!176673 m!205427))

(assert (=> b!176673 m!205429))

(assert (=> b!176627 d!53689))

(declare-fun b!176716 () Bool)

(declare-fun e!116576 () Bool)

(declare-fun e!116570 () Bool)

(assert (=> b!176716 (= e!116576 e!116570)))

(declare-fun res!83750 () Bool)

(assert (=> b!176716 (=> (not res!83750) (not e!116570))))

(declare-fun lt!87438 () ListLongMap!2211)

(assert (=> b!176716 (= res!83750 (contains!1185 lt!87438 (select (arr!3515 (_keys!5500 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!176716 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3819 (_keys!5500 thiss!1248))))))

(declare-fun b!176717 () Bool)

(declare-fun e!116573 () Bool)

(declare-fun apply!138 (ListLongMap!2211 (_ BitVec 64)) V!5155)

(assert (=> b!176717 (= e!116573 (= (apply!138 lt!87438 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3478 thiss!1248)))))

(declare-fun b!176718 () Bool)

(declare-fun e!116572 () Bool)

(assert (=> b!176718 (= e!116572 (= (apply!138 lt!87438 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3478 thiss!1248)))))

(declare-fun b!176719 () Bool)

(declare-fun e!116567 () Unit!5408)

(declare-fun lt!87436 () Unit!5408)

(assert (=> b!176719 (= e!116567 lt!87436)))

(declare-fun lt!87452 () ListLongMap!2211)

(declare-fun getCurrentListMapNoExtraKeys!171 (array!7409 array!7411 (_ BitVec 32) (_ BitVec 32) V!5155 V!5155 (_ BitVec 32) Int) ListLongMap!2211)

(assert (=> b!176719 (= lt!87452 (getCurrentListMapNoExtraKeys!171 (_keys!5500 thiss!1248) (_values!3620 thiss!1248) (mask!8559 thiss!1248) (extraKeys!3374 thiss!1248) (zeroValue!3478 thiss!1248) (minValue!3478 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3637 thiss!1248)))))

(declare-fun lt!87443 () (_ BitVec 64))

(assert (=> b!176719 (= lt!87443 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87440 () (_ BitVec 64))

(assert (=> b!176719 (= lt!87440 (select (arr!3515 (_keys!5500 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87444 () Unit!5408)

(declare-fun addStillContains!114 (ListLongMap!2211 (_ BitVec 64) V!5155 (_ BitVec 64)) Unit!5408)

(assert (=> b!176719 (= lt!87444 (addStillContains!114 lt!87452 lt!87443 (zeroValue!3478 thiss!1248) lt!87440))))

(declare-fun +!255 (ListLongMap!2211 tuple2!3284) ListLongMap!2211)

(assert (=> b!176719 (contains!1185 (+!255 lt!87452 (tuple2!3285 lt!87443 (zeroValue!3478 thiss!1248))) lt!87440)))

(declare-fun lt!87442 () Unit!5408)

(assert (=> b!176719 (= lt!87442 lt!87444)))

(declare-fun lt!87448 () ListLongMap!2211)

(assert (=> b!176719 (= lt!87448 (getCurrentListMapNoExtraKeys!171 (_keys!5500 thiss!1248) (_values!3620 thiss!1248) (mask!8559 thiss!1248) (extraKeys!3374 thiss!1248) (zeroValue!3478 thiss!1248) (minValue!3478 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3637 thiss!1248)))))

(declare-fun lt!87437 () (_ BitVec 64))

(assert (=> b!176719 (= lt!87437 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87447 () (_ BitVec 64))

(assert (=> b!176719 (= lt!87447 (select (arr!3515 (_keys!5500 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87451 () Unit!5408)

(declare-fun addApplyDifferent!114 (ListLongMap!2211 (_ BitVec 64) V!5155 (_ BitVec 64)) Unit!5408)

(assert (=> b!176719 (= lt!87451 (addApplyDifferent!114 lt!87448 lt!87437 (minValue!3478 thiss!1248) lt!87447))))

(assert (=> b!176719 (= (apply!138 (+!255 lt!87448 (tuple2!3285 lt!87437 (minValue!3478 thiss!1248))) lt!87447) (apply!138 lt!87448 lt!87447))))

(declare-fun lt!87445 () Unit!5408)

(assert (=> b!176719 (= lt!87445 lt!87451)))

(declare-fun lt!87435 () ListLongMap!2211)

(assert (=> b!176719 (= lt!87435 (getCurrentListMapNoExtraKeys!171 (_keys!5500 thiss!1248) (_values!3620 thiss!1248) (mask!8559 thiss!1248) (extraKeys!3374 thiss!1248) (zeroValue!3478 thiss!1248) (minValue!3478 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3637 thiss!1248)))))

(declare-fun lt!87449 () (_ BitVec 64))

(assert (=> b!176719 (= lt!87449 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87453 () (_ BitVec 64))

(assert (=> b!176719 (= lt!87453 (select (arr!3515 (_keys!5500 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87441 () Unit!5408)

(assert (=> b!176719 (= lt!87441 (addApplyDifferent!114 lt!87435 lt!87449 (zeroValue!3478 thiss!1248) lt!87453))))

(assert (=> b!176719 (= (apply!138 (+!255 lt!87435 (tuple2!3285 lt!87449 (zeroValue!3478 thiss!1248))) lt!87453) (apply!138 lt!87435 lt!87453))))

(declare-fun lt!87439 () Unit!5408)

(assert (=> b!176719 (= lt!87439 lt!87441)))

(declare-fun lt!87434 () ListLongMap!2211)

(assert (=> b!176719 (= lt!87434 (getCurrentListMapNoExtraKeys!171 (_keys!5500 thiss!1248) (_values!3620 thiss!1248) (mask!8559 thiss!1248) (extraKeys!3374 thiss!1248) (zeroValue!3478 thiss!1248) (minValue!3478 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3637 thiss!1248)))))

(declare-fun lt!87450 () (_ BitVec 64))

(assert (=> b!176719 (= lt!87450 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87433 () (_ BitVec 64))

(assert (=> b!176719 (= lt!87433 (select (arr!3515 (_keys!5500 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176719 (= lt!87436 (addApplyDifferent!114 lt!87434 lt!87450 (minValue!3478 thiss!1248) lt!87433))))

(assert (=> b!176719 (= (apply!138 (+!255 lt!87434 (tuple2!3285 lt!87450 (minValue!3478 thiss!1248))) lt!87433) (apply!138 lt!87434 lt!87433))))

(declare-fun call!17885 () ListLongMap!2211)

(declare-fun c!31681 () Bool)

(declare-fun c!31680 () Bool)

(declare-fun call!17889 () ListLongMap!2211)

(declare-fun call!17884 () ListLongMap!2211)

(declare-fun bm!17881 () Bool)

(declare-fun call!17887 () ListLongMap!2211)

(assert (=> bm!17881 (= call!17889 (+!255 (ite c!31680 call!17885 (ite c!31681 call!17887 call!17884)) (ite (or c!31680 c!31681) (tuple2!3285 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3478 thiss!1248)) (tuple2!3285 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3478 thiss!1248)))))))

(declare-fun b!176721 () Bool)

(declare-fun e!116579 () Bool)

(declare-fun call!17886 () Bool)

(assert (=> b!176721 (= e!116579 (not call!17886))))

(declare-fun bm!17882 () Bool)

(assert (=> bm!17882 (= call!17884 call!17887)))

(declare-fun bm!17883 () Bool)

(declare-fun call!17890 () ListLongMap!2211)

(assert (=> bm!17883 (= call!17890 call!17889)))

(declare-fun b!176722 () Bool)

(declare-fun e!116571 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!176722 (= e!116571 (validKeyInArray!0 (select (arr!3515 (_keys!5500 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176723 () Bool)

(declare-fun c!31676 () Bool)

(assert (=> b!176723 (= c!31676 (and (not (= (bvand (extraKeys!3374 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3374 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!116569 () ListLongMap!2211)

(declare-fun e!116575 () ListLongMap!2211)

(assert (=> b!176723 (= e!116569 e!116575)))

(declare-fun b!176724 () Bool)

(declare-fun get!2007 (ValueCell!1722 V!5155) V!5155)

(declare-fun dynLambda!481 (Int (_ BitVec 64)) V!5155)

(assert (=> b!176724 (= e!116570 (= (apply!138 lt!87438 (select (arr!3515 (_keys!5500 thiss!1248)) #b00000000000000000000000000000000)) (get!2007 (select (arr!3516 (_values!3620 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!481 (defaultEntry!3637 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!176724 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3820 (_values!3620 thiss!1248))))))

(assert (=> b!176724 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3819 (_keys!5500 thiss!1248))))))

(declare-fun b!176725 () Bool)

(assert (=> b!176725 (= e!116579 e!116573)))

(declare-fun res!83752 () Bool)

(assert (=> b!176725 (= res!83752 call!17886)))

(assert (=> b!176725 (=> (not res!83752) (not e!116573))))

(declare-fun b!176726 () Bool)

(declare-fun res!83755 () Bool)

(declare-fun e!116577 () Bool)

(assert (=> b!176726 (=> (not res!83755) (not e!116577))))

(assert (=> b!176726 (= res!83755 e!116579)))

(declare-fun c!31677 () Bool)

(assert (=> b!176726 (= c!31677 (not (= (bvand (extraKeys!3374 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!176727 () Bool)

(declare-fun e!116568 () Bool)

(assert (=> b!176727 (= e!116568 (validKeyInArray!0 (select (arr!3515 (_keys!5500 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17884 () Bool)

(declare-fun call!17888 () Bool)

(assert (=> bm!17884 (= call!17888 (contains!1185 lt!87438 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176728 () Bool)

(assert (=> b!176728 (= e!116575 call!17890)))

(declare-fun d!53691 () Bool)

(assert (=> d!53691 e!116577))

(declare-fun res!83748 () Bool)

(assert (=> d!53691 (=> (not res!83748) (not e!116577))))

(assert (=> d!53691 (= res!83748 (or (bvsge #b00000000000000000000000000000000 (size!3819 (_keys!5500 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3819 (_keys!5500 thiss!1248))))))))

(declare-fun lt!87432 () ListLongMap!2211)

(assert (=> d!53691 (= lt!87438 lt!87432)))

(declare-fun lt!87446 () Unit!5408)

(assert (=> d!53691 (= lt!87446 e!116567)))

(declare-fun c!31678 () Bool)

(assert (=> d!53691 (= c!31678 e!116568)))

(declare-fun res!83749 () Bool)

(assert (=> d!53691 (=> (not res!83749) (not e!116568))))

(assert (=> d!53691 (= res!83749 (bvslt #b00000000000000000000000000000000 (size!3819 (_keys!5500 thiss!1248))))))

(declare-fun e!116574 () ListLongMap!2211)

(assert (=> d!53691 (= lt!87432 e!116574)))

(assert (=> d!53691 (= c!31680 (and (not (= (bvand (extraKeys!3374 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3374 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53691 (validMask!0 (mask!8559 thiss!1248))))

(assert (=> d!53691 (= (getCurrentListMap!773 (_keys!5500 thiss!1248) (_values!3620 thiss!1248) (mask!8559 thiss!1248) (extraKeys!3374 thiss!1248) (zeroValue!3478 thiss!1248) (minValue!3478 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3637 thiss!1248)) lt!87438)))

(declare-fun b!176720 () Bool)

(declare-fun res!83751 () Bool)

(assert (=> b!176720 (=> (not res!83751) (not e!116577))))

(assert (=> b!176720 (= res!83751 e!116576)))

(declare-fun res!83754 () Bool)

(assert (=> b!176720 (=> res!83754 e!116576)))

(assert (=> b!176720 (= res!83754 (not e!116571))))

(declare-fun res!83756 () Bool)

(assert (=> b!176720 (=> (not res!83756) (not e!116571))))

(assert (=> b!176720 (= res!83756 (bvslt #b00000000000000000000000000000000 (size!3819 (_keys!5500 thiss!1248))))))

(declare-fun b!176729 () Bool)

(declare-fun e!116578 () Bool)

(assert (=> b!176729 (= e!116578 e!116572)))

(declare-fun res!83753 () Bool)

(assert (=> b!176729 (= res!83753 call!17888)))

(assert (=> b!176729 (=> (not res!83753) (not e!116572))))

(declare-fun bm!17885 () Bool)

(assert (=> bm!17885 (= call!17885 (getCurrentListMapNoExtraKeys!171 (_keys!5500 thiss!1248) (_values!3620 thiss!1248) (mask!8559 thiss!1248) (extraKeys!3374 thiss!1248) (zeroValue!3478 thiss!1248) (minValue!3478 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3637 thiss!1248)))))

(declare-fun b!176730 () Bool)

(assert (=> b!176730 (= e!116578 (not call!17888))))

(declare-fun b!176731 () Bool)

(assert (=> b!176731 (= e!116574 (+!255 call!17889 (tuple2!3285 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3478 thiss!1248))))))

(declare-fun b!176732 () Bool)

(assert (=> b!176732 (= e!116577 e!116578)))

(declare-fun c!31679 () Bool)

(assert (=> b!176732 (= c!31679 (not (= (bvand (extraKeys!3374 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17886 () Bool)

(assert (=> bm!17886 (= call!17886 (contains!1185 lt!87438 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176733 () Bool)

(assert (=> b!176733 (= e!116569 call!17890)))

(declare-fun bm!17887 () Bool)

(assert (=> bm!17887 (= call!17887 call!17885)))

(declare-fun b!176734 () Bool)

(assert (=> b!176734 (= e!116574 e!116569)))

(assert (=> b!176734 (= c!31681 (and (not (= (bvand (extraKeys!3374 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3374 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!176735 () Bool)

(assert (=> b!176735 (= e!116575 call!17884)))

(declare-fun b!176736 () Bool)

(declare-fun Unit!5411 () Unit!5408)

(assert (=> b!176736 (= e!116567 Unit!5411)))

(assert (= (and d!53691 c!31680) b!176731))

(assert (= (and d!53691 (not c!31680)) b!176734))

(assert (= (and b!176734 c!31681) b!176733))

(assert (= (and b!176734 (not c!31681)) b!176723))

(assert (= (and b!176723 c!31676) b!176728))

(assert (= (and b!176723 (not c!31676)) b!176735))

(assert (= (or b!176728 b!176735) bm!17882))

(assert (= (or b!176733 bm!17882) bm!17887))

(assert (= (or b!176733 b!176728) bm!17883))

(assert (= (or b!176731 bm!17887) bm!17885))

(assert (= (or b!176731 bm!17883) bm!17881))

(assert (= (and d!53691 res!83749) b!176727))

(assert (= (and d!53691 c!31678) b!176719))

(assert (= (and d!53691 (not c!31678)) b!176736))

(assert (= (and d!53691 res!83748) b!176720))

(assert (= (and b!176720 res!83756) b!176722))

(assert (= (and b!176720 (not res!83754)) b!176716))

(assert (= (and b!176716 res!83750) b!176724))

(assert (= (and b!176720 res!83751) b!176726))

(assert (= (and b!176726 c!31677) b!176725))

(assert (= (and b!176726 (not c!31677)) b!176721))

(assert (= (and b!176725 res!83752) b!176717))

(assert (= (or b!176725 b!176721) bm!17886))

(assert (= (and b!176726 res!83755) b!176732))

(assert (= (and b!176732 c!31679) b!176729))

(assert (= (and b!176732 (not c!31679)) b!176730))

(assert (= (and b!176729 res!83753) b!176718))

(assert (= (or b!176729 b!176730) bm!17884))

(declare-fun b_lambda!7043 () Bool)

(assert (=> (not b_lambda!7043) (not b!176724)))

(declare-fun t!7068 () Bool)

(declare-fun tb!2787 () Bool)

(assert (=> (and b!176621 (= (defaultEntry!3637 thiss!1248) (defaultEntry!3637 thiss!1248)) t!7068) tb!2787))

(declare-fun result!4635 () Bool)

(assert (=> tb!2787 (= result!4635 tp_is_empty!4131)))

(assert (=> b!176724 t!7068))

(declare-fun b_and!10859 () Bool)

(assert (= b_and!10855 (and (=> t!7068 result!4635) b_and!10859)))

(declare-fun m!205431 () Bool)

(assert (=> b!176722 m!205431))

(assert (=> b!176722 m!205431))

(declare-fun m!205433 () Bool)

(assert (=> b!176722 m!205433))

(assert (=> b!176716 m!205431))

(assert (=> b!176716 m!205431))

(declare-fun m!205435 () Bool)

(assert (=> b!176716 m!205435))

(declare-fun m!205437 () Bool)

(assert (=> bm!17886 m!205437))

(declare-fun m!205439 () Bool)

(assert (=> bm!17885 m!205439))

(declare-fun m!205441 () Bool)

(assert (=> bm!17884 m!205441))

(declare-fun m!205443 () Bool)

(assert (=> b!176718 m!205443))

(assert (=> b!176724 m!205431))

(declare-fun m!205445 () Bool)

(assert (=> b!176724 m!205445))

(declare-fun m!205447 () Bool)

(assert (=> b!176724 m!205447))

(declare-fun m!205449 () Bool)

(assert (=> b!176724 m!205449))

(assert (=> b!176724 m!205447))

(assert (=> b!176724 m!205431))

(declare-fun m!205451 () Bool)

(assert (=> b!176724 m!205451))

(assert (=> b!176724 m!205445))

(declare-fun m!205453 () Bool)

(assert (=> b!176731 m!205453))

(declare-fun m!205455 () Bool)

(assert (=> b!176717 m!205455))

(assert (=> d!53691 m!205383))

(assert (=> b!176727 m!205431))

(assert (=> b!176727 m!205431))

(assert (=> b!176727 m!205433))

(declare-fun m!205457 () Bool)

(assert (=> b!176719 m!205457))

(declare-fun m!205459 () Bool)

(assert (=> b!176719 m!205459))

(declare-fun m!205461 () Bool)

(assert (=> b!176719 m!205461))

(declare-fun m!205463 () Bool)

(assert (=> b!176719 m!205463))

(declare-fun m!205465 () Bool)

(assert (=> b!176719 m!205465))

(declare-fun m!205467 () Bool)

(assert (=> b!176719 m!205467))

(assert (=> b!176719 m!205439))

(declare-fun m!205469 () Bool)

(assert (=> b!176719 m!205469))

(declare-fun m!205471 () Bool)

(assert (=> b!176719 m!205471))

(assert (=> b!176719 m!205471))

(declare-fun m!205473 () Bool)

(assert (=> b!176719 m!205473))

(assert (=> b!176719 m!205459))

(declare-fun m!205475 () Bool)

(assert (=> b!176719 m!205475))

(assert (=> b!176719 m!205457))

(declare-fun m!205477 () Bool)

(assert (=> b!176719 m!205477))

(assert (=> b!176719 m!205431))

(declare-fun m!205479 () Bool)

(assert (=> b!176719 m!205479))

(declare-fun m!205481 () Bool)

(assert (=> b!176719 m!205481))

(declare-fun m!205483 () Bool)

(assert (=> b!176719 m!205483))

(assert (=> b!176719 m!205467))

(declare-fun m!205485 () Bool)

(assert (=> b!176719 m!205485))

(declare-fun m!205487 () Bool)

(assert (=> bm!17881 m!205487))

(assert (=> b!176627 d!53691))

(declare-fun b!176749 () Bool)

(declare-fun e!116590 () Bool)

(declare-fun contains!1187 (List!2238 (_ BitVec 64)) Bool)

(assert (=> b!176749 (= e!116590 (contains!1187 Nil!2235 (select (arr!3515 (_keys!5500 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176750 () Bool)

(declare-fun e!116588 () Bool)

(declare-fun call!17893 () Bool)

(assert (=> b!176750 (= e!116588 call!17893)))

(declare-fun b!176751 () Bool)

(assert (=> b!176751 (= e!116588 call!17893)))

(declare-fun d!53693 () Bool)

(declare-fun res!83764 () Bool)

(declare-fun e!116591 () Bool)

(assert (=> d!53693 (=> res!83764 e!116591)))

(assert (=> d!53693 (= res!83764 (bvsge #b00000000000000000000000000000000 (size!3819 (_keys!5500 thiss!1248))))))

(assert (=> d!53693 (= (arrayNoDuplicates!0 (_keys!5500 thiss!1248) #b00000000000000000000000000000000 Nil!2235) e!116591)))

(declare-fun b!176752 () Bool)

(declare-fun e!116589 () Bool)

(assert (=> b!176752 (= e!116589 e!116588)))

(declare-fun c!31684 () Bool)

(assert (=> b!176752 (= c!31684 (validKeyInArray!0 (select (arr!3515 (_keys!5500 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17890 () Bool)

(assert (=> bm!17890 (= call!17893 (arrayNoDuplicates!0 (_keys!5500 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31684 (Cons!2234 (select (arr!3515 (_keys!5500 thiss!1248)) #b00000000000000000000000000000000) Nil!2235) Nil!2235)))))

(declare-fun b!176753 () Bool)

(assert (=> b!176753 (= e!116591 e!116589)))

(declare-fun res!83763 () Bool)

(assert (=> b!176753 (=> (not res!83763) (not e!116589))))

(assert (=> b!176753 (= res!83763 (not e!116590))))

(declare-fun res!83765 () Bool)

(assert (=> b!176753 (=> (not res!83765) (not e!116590))))

(assert (=> b!176753 (= res!83765 (validKeyInArray!0 (select (arr!3515 (_keys!5500 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53693 (not res!83764)) b!176753))

(assert (= (and b!176753 res!83765) b!176749))

(assert (= (and b!176753 res!83763) b!176752))

(assert (= (and b!176752 c!31684) b!176751))

(assert (= (and b!176752 (not c!31684)) b!176750))

(assert (= (or b!176751 b!176750) bm!17890))

(assert (=> b!176749 m!205431))

(assert (=> b!176749 m!205431))

(declare-fun m!205489 () Bool)

(assert (=> b!176749 m!205489))

(assert (=> b!176752 m!205431))

(assert (=> b!176752 m!205431))

(assert (=> b!176752 m!205433))

(assert (=> bm!17890 m!205431))

(declare-fun m!205491 () Bool)

(assert (=> bm!17890 m!205491))

(assert (=> b!176753 m!205431))

(assert (=> b!176753 m!205431))

(assert (=> b!176753 m!205433))

(assert (=> b!176631 d!53693))

(declare-fun b!176762 () Bool)

(declare-fun e!116599 () Bool)

(declare-fun call!17896 () Bool)

(assert (=> b!176762 (= e!116599 call!17896)))

(declare-fun b!176763 () Bool)

(declare-fun e!116600 () Bool)

(declare-fun e!116598 () Bool)

(assert (=> b!176763 (= e!116600 e!116598)))

(declare-fun c!31687 () Bool)

(assert (=> b!176763 (= c!31687 (validKeyInArray!0 (select (arr!3515 (_keys!5500 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53695 () Bool)

(declare-fun res!83771 () Bool)

(assert (=> d!53695 (=> res!83771 e!116600)))

(assert (=> d!53695 (= res!83771 (bvsge #b00000000000000000000000000000000 (size!3819 (_keys!5500 thiss!1248))))))

(assert (=> d!53695 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5500 thiss!1248) (mask!8559 thiss!1248)) e!116600)))

(declare-fun b!176764 () Bool)

(assert (=> b!176764 (= e!116598 call!17896)))

(declare-fun b!176765 () Bool)

(assert (=> b!176765 (= e!116598 e!116599)))

(declare-fun lt!87462 () (_ BitVec 64))

(assert (=> b!176765 (= lt!87462 (select (arr!3515 (_keys!5500 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87461 () Unit!5408)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7409 (_ BitVec 64) (_ BitVec 32)) Unit!5408)

(assert (=> b!176765 (= lt!87461 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5500 thiss!1248) lt!87462 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!176765 (arrayContainsKey!0 (_keys!5500 thiss!1248) lt!87462 #b00000000000000000000000000000000)))

(declare-fun lt!87460 () Unit!5408)

(assert (=> b!176765 (= lt!87460 lt!87461)))

(declare-fun res!83770 () Bool)

(assert (=> b!176765 (= res!83770 (= (seekEntryOrOpen!0 (select (arr!3515 (_keys!5500 thiss!1248)) #b00000000000000000000000000000000) (_keys!5500 thiss!1248) (mask!8559 thiss!1248)) (Found!556 #b00000000000000000000000000000000)))))

(assert (=> b!176765 (=> (not res!83770) (not e!116599))))

(declare-fun bm!17893 () Bool)

(assert (=> bm!17893 (= call!17896 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5500 thiss!1248) (mask!8559 thiss!1248)))))

(assert (= (and d!53695 (not res!83771)) b!176763))

(assert (= (and b!176763 c!31687) b!176765))

(assert (= (and b!176763 (not c!31687)) b!176764))

(assert (= (and b!176765 res!83770) b!176762))

(assert (= (or b!176762 b!176764) bm!17893))

(assert (=> b!176763 m!205431))

(assert (=> b!176763 m!205431))

(assert (=> b!176763 m!205433))

(assert (=> b!176765 m!205431))

(declare-fun m!205493 () Bool)

(assert (=> b!176765 m!205493))

(declare-fun m!205495 () Bool)

(assert (=> b!176765 m!205495))

(assert (=> b!176765 m!205431))

(declare-fun m!205497 () Bool)

(assert (=> b!176765 m!205497))

(declare-fun m!205499 () Bool)

(assert (=> bm!17893 m!205499))

(assert (=> b!176625 d!53695))

(declare-fun d!53697 () Bool)

(assert (=> d!53697 (= (array_inv!2251 (_keys!5500 thiss!1248)) (bvsge (size!3819 (_keys!5500 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176621 d!53697))

(declare-fun d!53699 () Bool)

(assert (=> d!53699 (= (array_inv!2252 (_values!3620 thiss!1248)) (bvsge (size!3820 (_values!3620 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176621 d!53699))

(declare-fun b!176778 () Bool)

(declare-fun e!116608 () SeekEntryResult!556)

(declare-fun lt!87470 () SeekEntryResult!556)

(assert (=> b!176778 (= e!116608 (MissingZero!556 (index!4394 lt!87470)))))

(declare-fun b!176779 () Bool)

(declare-fun c!31695 () Bool)

(declare-fun lt!87469 () (_ BitVec 64))

(assert (=> b!176779 (= c!31695 (= lt!87469 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!116607 () SeekEntryResult!556)

(assert (=> b!176779 (= e!116607 e!116608)))

(declare-fun b!176780 () Bool)

(declare-fun e!116609 () SeekEntryResult!556)

(assert (=> b!176780 (= e!116609 e!116607)))

(assert (=> b!176780 (= lt!87469 (select (arr!3515 (_keys!5500 thiss!1248)) (index!4394 lt!87470)))))

(declare-fun c!31696 () Bool)

(assert (=> b!176780 (= c!31696 (= lt!87469 key!828))))

(declare-fun d!53701 () Bool)

(declare-fun lt!87471 () SeekEntryResult!556)

(assert (=> d!53701 (and (or ((_ is Undefined!556) lt!87471) (not ((_ is Found!556) lt!87471)) (and (bvsge (index!4393 lt!87471) #b00000000000000000000000000000000) (bvslt (index!4393 lt!87471) (size!3819 (_keys!5500 thiss!1248))))) (or ((_ is Undefined!556) lt!87471) ((_ is Found!556) lt!87471) (not ((_ is MissingZero!556) lt!87471)) (and (bvsge (index!4392 lt!87471) #b00000000000000000000000000000000) (bvslt (index!4392 lt!87471) (size!3819 (_keys!5500 thiss!1248))))) (or ((_ is Undefined!556) lt!87471) ((_ is Found!556) lt!87471) ((_ is MissingZero!556) lt!87471) (not ((_ is MissingVacant!556) lt!87471)) (and (bvsge (index!4395 lt!87471) #b00000000000000000000000000000000) (bvslt (index!4395 lt!87471) (size!3819 (_keys!5500 thiss!1248))))) (or ((_ is Undefined!556) lt!87471) (ite ((_ is Found!556) lt!87471) (= (select (arr!3515 (_keys!5500 thiss!1248)) (index!4393 lt!87471)) key!828) (ite ((_ is MissingZero!556) lt!87471) (= (select (arr!3515 (_keys!5500 thiss!1248)) (index!4392 lt!87471)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!556) lt!87471) (= (select (arr!3515 (_keys!5500 thiss!1248)) (index!4395 lt!87471)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53701 (= lt!87471 e!116609)))

(declare-fun c!31694 () Bool)

(assert (=> d!53701 (= c!31694 (and ((_ is Intermediate!556) lt!87470) (undefined!1368 lt!87470)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7409 (_ BitVec 32)) SeekEntryResult!556)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53701 (= lt!87470 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8559 thiss!1248)) key!828 (_keys!5500 thiss!1248) (mask!8559 thiss!1248)))))

(assert (=> d!53701 (validMask!0 (mask!8559 thiss!1248))))

(assert (=> d!53701 (= (seekEntryOrOpen!0 key!828 (_keys!5500 thiss!1248) (mask!8559 thiss!1248)) lt!87471)))

(declare-fun b!176781 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7409 (_ BitVec 32)) SeekEntryResult!556)

(assert (=> b!176781 (= e!116608 (seekKeyOrZeroReturnVacant!0 (x!19384 lt!87470) (index!4394 lt!87470) (index!4394 lt!87470) key!828 (_keys!5500 thiss!1248) (mask!8559 thiss!1248)))))

(declare-fun b!176782 () Bool)

(assert (=> b!176782 (= e!116609 Undefined!556)))

(declare-fun b!176783 () Bool)

(assert (=> b!176783 (= e!116607 (Found!556 (index!4394 lt!87470)))))

(assert (= (and d!53701 c!31694) b!176782))

(assert (= (and d!53701 (not c!31694)) b!176780))

(assert (= (and b!176780 c!31696) b!176783))

(assert (= (and b!176780 (not c!31696)) b!176779))

(assert (= (and b!176779 c!31695) b!176778))

(assert (= (and b!176779 (not c!31695)) b!176781))

(declare-fun m!205501 () Bool)

(assert (=> b!176780 m!205501))

(declare-fun m!205503 () Bool)

(assert (=> d!53701 m!205503))

(declare-fun m!205505 () Bool)

(assert (=> d!53701 m!205505))

(declare-fun m!205507 () Bool)

(assert (=> d!53701 m!205507))

(declare-fun m!205509 () Bool)

(assert (=> d!53701 m!205509))

(assert (=> d!53701 m!205505))

(assert (=> d!53701 m!205383))

(declare-fun m!205511 () Bool)

(assert (=> d!53701 m!205511))

(declare-fun m!205513 () Bool)

(assert (=> b!176781 m!205513))

(assert (=> b!176629 d!53701))

(declare-fun d!53703 () Bool)

(declare-fun res!83778 () Bool)

(declare-fun e!116612 () Bool)

(assert (=> d!53703 (=> (not res!83778) (not e!116612))))

(declare-fun simpleValid!152 (LongMapFixedSize!2352) Bool)

(assert (=> d!53703 (= res!83778 (simpleValid!152 thiss!1248))))

(assert (=> d!53703 (= (valid!988 thiss!1248) e!116612)))

(declare-fun b!176790 () Bool)

(declare-fun res!83779 () Bool)

(assert (=> b!176790 (=> (not res!83779) (not e!116612))))

(declare-fun arrayCountValidKeys!0 (array!7409 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!176790 (= res!83779 (= (arrayCountValidKeys!0 (_keys!5500 thiss!1248) #b00000000000000000000000000000000 (size!3819 (_keys!5500 thiss!1248))) (_size!1225 thiss!1248)))))

(declare-fun b!176791 () Bool)

(declare-fun res!83780 () Bool)

(assert (=> b!176791 (=> (not res!83780) (not e!116612))))

(assert (=> b!176791 (= res!83780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5500 thiss!1248) (mask!8559 thiss!1248)))))

(declare-fun b!176792 () Bool)

(assert (=> b!176792 (= e!116612 (arrayNoDuplicates!0 (_keys!5500 thiss!1248) #b00000000000000000000000000000000 Nil!2235))))

(assert (= (and d!53703 res!83778) b!176790))

(assert (= (and b!176790 res!83779) b!176791))

(assert (= (and b!176791 res!83780) b!176792))

(declare-fun m!205515 () Bool)

(assert (=> d!53703 m!205515))

(declare-fun m!205517 () Bool)

(assert (=> b!176790 m!205517))

(assert (=> b!176791 m!205399))

(assert (=> b!176792 m!205391))

(assert (=> start!17668 d!53703))

(declare-fun condMapEmpty!7059 () Bool)

(declare-fun mapDefault!7059 () ValueCell!1722)

(assert (=> mapNonEmpty!7053 (= condMapEmpty!7059 (= mapRest!7053 ((as const (Array (_ BitVec 32) ValueCell!1722)) mapDefault!7059)))))

(declare-fun e!116617 () Bool)

(declare-fun mapRes!7059 () Bool)

(assert (=> mapNonEmpty!7053 (= tp!15770 (and e!116617 mapRes!7059))))

(declare-fun mapNonEmpty!7059 () Bool)

(declare-fun tp!15780 () Bool)

(declare-fun e!116618 () Bool)

(assert (=> mapNonEmpty!7059 (= mapRes!7059 (and tp!15780 e!116618))))

(declare-fun mapKey!7059 () (_ BitVec 32))

(declare-fun mapRest!7059 () (Array (_ BitVec 32) ValueCell!1722))

(declare-fun mapValue!7059 () ValueCell!1722)

(assert (=> mapNonEmpty!7059 (= mapRest!7053 (store mapRest!7059 mapKey!7059 mapValue!7059))))

(declare-fun b!176800 () Bool)

(assert (=> b!176800 (= e!116617 tp_is_empty!4131)))

(declare-fun b!176799 () Bool)

(assert (=> b!176799 (= e!116618 tp_is_empty!4131)))

(declare-fun mapIsEmpty!7059 () Bool)

(assert (=> mapIsEmpty!7059 mapRes!7059))

(assert (= (and mapNonEmpty!7053 condMapEmpty!7059) mapIsEmpty!7059))

(assert (= (and mapNonEmpty!7053 (not condMapEmpty!7059)) mapNonEmpty!7059))

(assert (= (and mapNonEmpty!7059 ((_ is ValueCellFull!1722) mapValue!7059)) b!176799))

(assert (= (and mapNonEmpty!7053 ((_ is ValueCellFull!1722) mapDefault!7059)) b!176800))

(declare-fun m!205519 () Bool)

(assert (=> mapNonEmpty!7059 m!205519))

(declare-fun b_lambda!7045 () Bool)

(assert (= b_lambda!7043 (or (and b!176621 b_free!4359) b_lambda!7045)))

(check-sat (not b!176763) (not b!176718) tp_is_empty!4131 (not b!176765) (not b!176719) (not b!176790) (not b_lambda!7045) (not d!53691) (not b!176749) (not b!176781) (not b!176673) (not b!176727) (not b!176731) (not b!176752) (not b!176671) b_and!10859 (not b!176722) (not b!176792) (not b!176716) (not b!176724) (not d!53703) (not bm!17886) (not bm!17881) (not b!176753) (not d!53701) (not bm!17890) (not b!176717) (not mapNonEmpty!7059) (not d!53689) (not bm!17885) (not bm!17893) (not b_next!4359) (not bm!17884) (not b!176791))
(check-sat b_and!10859 (not b_next!4359))
