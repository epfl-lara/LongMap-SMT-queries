; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18674 () Bool)

(assert start!18674)

(declare-fun b!184710 () Bool)

(declare-fun b_free!4549 () Bool)

(declare-fun b_next!4549 () Bool)

(assert (=> b!184710 (= b_free!4549 (not b_next!4549))))

(declare-fun tp!16432 () Bool)

(declare-fun b_and!11153 () Bool)

(assert (=> b!184710 (= tp!16432 b_and!11153)))

(declare-fun b!184705 () Bool)

(declare-fun e!121562 () Bool)

(declare-datatypes ((V!5409 0))(
  ( (V!5410 (val!2205 Int)) )
))
(declare-datatypes ((ValueCell!1817 0))(
  ( (ValueCellFull!1817 (v!4113 V!5409)) (EmptyCell!1817) )
))
(declare-datatypes ((array!7829 0))(
  ( (array!7830 (arr!3698 (Array (_ BitVec 32) (_ BitVec 64))) (size!4013 (_ BitVec 32))) )
))
(declare-datatypes ((array!7831 0))(
  ( (array!7832 (arr!3699 (Array (_ BitVec 32) ValueCell!1817)) (size!4014 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2542 0))(
  ( (LongMapFixedSize!2543 (defaultEntry!3768 Int) (mask!8858 (_ BitVec 32)) (extraKeys!3505 (_ BitVec 32)) (zeroValue!3609 V!5409) (minValue!3609 V!5409) (_size!1320 (_ BitVec 32)) (_keys!5699 array!7829) (_values!3751 array!7831) (_vacant!1320 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2542)

(assert (=> b!184705 (= e!121562 (and (= (size!4014 (_values!3751 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8858 thiss!1248))) (= (size!4013 (_keys!5699 thiss!1248)) (size!4014 (_values!3751 thiss!1248))) (bvsge (mask!8858 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3505 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3505 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!87375 () Bool)

(declare-fun e!121565 () Bool)

(assert (=> start!18674 (=> (not res!87375) (not e!121565))))

(declare-fun valid!1072 (LongMapFixedSize!2542) Bool)

(assert (=> start!18674 (= res!87375 (valid!1072 thiss!1248))))

(assert (=> start!18674 e!121565))

(declare-fun e!121568 () Bool)

(assert (=> start!18674 e!121568))

(assert (=> start!18674 true))

(declare-fun b!184706 () Bool)

(declare-fun res!87378 () Bool)

(assert (=> b!184706 (=> (not res!87378) (not e!121562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!184706 (= res!87378 (validMask!0 (mask!8858 thiss!1248)))))

(declare-fun b!184707 () Bool)

(declare-fun e!121564 () Bool)

(declare-fun e!121563 () Bool)

(declare-fun mapRes!7430 () Bool)

(assert (=> b!184707 (= e!121564 (and e!121563 mapRes!7430))))

(declare-fun condMapEmpty!7430 () Bool)

(declare-fun mapDefault!7430 () ValueCell!1817)

(assert (=> b!184707 (= condMapEmpty!7430 (= (arr!3699 (_values!3751 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1817)) mapDefault!7430)))))

(declare-fun mapIsEmpty!7430 () Bool)

(assert (=> mapIsEmpty!7430 mapRes!7430))

(declare-fun b!184708 () Bool)

(declare-fun e!121566 () Bool)

(declare-fun tp_is_empty!4321 () Bool)

(assert (=> b!184708 (= e!121566 tp_is_empty!4321)))

(declare-fun b!184709 () Bool)

(declare-fun res!87377 () Bool)

(assert (=> b!184709 (=> (not res!87377) (not e!121562))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3376 0))(
  ( (tuple2!3377 (_1!1699 (_ BitVec 64)) (_2!1699 V!5409)) )
))
(declare-datatypes ((List!2312 0))(
  ( (Nil!2309) (Cons!2308 (h!2940 tuple2!3376) (t!7180 List!2312)) )
))
(declare-datatypes ((ListLongMap!2297 0))(
  ( (ListLongMap!2298 (toList!1164 List!2312)) )
))
(declare-fun contains!1268 (ListLongMap!2297 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!816 (array!7829 array!7831 (_ BitVec 32) (_ BitVec 32) V!5409 V!5409 (_ BitVec 32) Int) ListLongMap!2297)

(assert (=> b!184709 (= res!87377 (not (contains!1268 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)) key!828)))))

(declare-fun array_inv!2385 (array!7829) Bool)

(declare-fun array_inv!2386 (array!7831) Bool)

(assert (=> b!184710 (= e!121568 (and tp!16432 tp_is_empty!4321 (array_inv!2385 (_keys!5699 thiss!1248)) (array_inv!2386 (_values!3751 thiss!1248)) e!121564))))

(declare-fun b!184711 () Bool)

(assert (=> b!184711 (= e!121565 e!121562)))

(declare-fun res!87376 () Bool)

(assert (=> b!184711 (=> (not res!87376) (not e!121562))))

(declare-datatypes ((SeekEntryResult!616 0))(
  ( (MissingZero!616 (index!4634 (_ BitVec 32))) (Found!616 (index!4635 (_ BitVec 32))) (Intermediate!616 (undefined!1428 Bool) (index!4636 (_ BitVec 32)) (x!20066 (_ BitVec 32))) (Undefined!616) (MissingVacant!616 (index!4637 (_ BitVec 32))) )
))
(declare-fun lt!91392 () SeekEntryResult!616)

(get-info :version)

(assert (=> b!184711 (= res!87376 (and (not ((_ is Undefined!616) lt!91392)) (not ((_ is MissingVacant!616) lt!91392)) (not ((_ is MissingZero!616) lt!91392)) ((_ is Found!616) lt!91392)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7829 (_ BitVec 32)) SeekEntryResult!616)

(assert (=> b!184711 (= lt!91392 (seekEntryOrOpen!0 key!828 (_keys!5699 thiss!1248) (mask!8858 thiss!1248)))))

(declare-fun mapNonEmpty!7430 () Bool)

(declare-fun tp!16433 () Bool)

(assert (=> mapNonEmpty!7430 (= mapRes!7430 (and tp!16433 e!121566))))

(declare-fun mapValue!7430 () ValueCell!1817)

(declare-fun mapRest!7430 () (Array (_ BitVec 32) ValueCell!1817))

(declare-fun mapKey!7430 () (_ BitVec 32))

(assert (=> mapNonEmpty!7430 (= (arr!3699 (_values!3751 thiss!1248)) (store mapRest!7430 mapKey!7430 mapValue!7430))))

(declare-fun b!184712 () Bool)

(declare-fun res!87374 () Bool)

(assert (=> b!184712 (=> (not res!87374) (not e!121565))))

(assert (=> b!184712 (= res!87374 (not (= key!828 (bvneg key!828))))))

(declare-fun b!184713 () Bool)

(assert (=> b!184713 (= e!121563 tp_is_empty!4321)))

(assert (= (and start!18674 res!87375) b!184712))

(assert (= (and b!184712 res!87374) b!184711))

(assert (= (and b!184711 res!87376) b!184709))

(assert (= (and b!184709 res!87377) b!184706))

(assert (= (and b!184706 res!87378) b!184705))

(assert (= (and b!184707 condMapEmpty!7430) mapIsEmpty!7430))

(assert (= (and b!184707 (not condMapEmpty!7430)) mapNonEmpty!7430))

(assert (= (and mapNonEmpty!7430 ((_ is ValueCellFull!1817) mapValue!7430)) b!184708))

(assert (= (and b!184707 ((_ is ValueCellFull!1817) mapDefault!7430)) b!184713))

(assert (= b!184710 b!184707))

(assert (= start!18674 b!184710))

(declare-fun m!212219 () Bool)

(assert (=> b!184709 m!212219))

(assert (=> b!184709 m!212219))

(declare-fun m!212221 () Bool)

(assert (=> b!184709 m!212221))

(declare-fun m!212223 () Bool)

(assert (=> b!184706 m!212223))

(declare-fun m!212225 () Bool)

(assert (=> start!18674 m!212225))

(declare-fun m!212227 () Bool)

(assert (=> b!184711 m!212227))

(declare-fun m!212229 () Bool)

(assert (=> b!184710 m!212229))

(declare-fun m!212231 () Bool)

(assert (=> b!184710 m!212231))

(declare-fun m!212233 () Bool)

(assert (=> mapNonEmpty!7430 m!212233))

(check-sat (not b_next!4549) (not start!18674) (not mapNonEmpty!7430) (not b!184709) (not b!184711) tp_is_empty!4321 b_and!11153 (not b!184710) (not b!184706))
(check-sat b_and!11153 (not b_next!4549))
(get-model)

(declare-fun d!55063 () Bool)

(assert (=> d!55063 (= (validMask!0 (mask!8858 thiss!1248)) (and (or (= (mask!8858 thiss!1248) #b00000000000000000000000000000111) (= (mask!8858 thiss!1248) #b00000000000000000000000000001111) (= (mask!8858 thiss!1248) #b00000000000000000000000000011111) (= (mask!8858 thiss!1248) #b00000000000000000000000000111111) (= (mask!8858 thiss!1248) #b00000000000000000000000001111111) (= (mask!8858 thiss!1248) #b00000000000000000000000011111111) (= (mask!8858 thiss!1248) #b00000000000000000000000111111111) (= (mask!8858 thiss!1248) #b00000000000000000000001111111111) (= (mask!8858 thiss!1248) #b00000000000000000000011111111111) (= (mask!8858 thiss!1248) #b00000000000000000000111111111111) (= (mask!8858 thiss!1248) #b00000000000000000001111111111111) (= (mask!8858 thiss!1248) #b00000000000000000011111111111111) (= (mask!8858 thiss!1248) #b00000000000000000111111111111111) (= (mask!8858 thiss!1248) #b00000000000000001111111111111111) (= (mask!8858 thiss!1248) #b00000000000000011111111111111111) (= (mask!8858 thiss!1248) #b00000000000000111111111111111111) (= (mask!8858 thiss!1248) #b00000000000001111111111111111111) (= (mask!8858 thiss!1248) #b00000000000011111111111111111111) (= (mask!8858 thiss!1248) #b00000000000111111111111111111111) (= (mask!8858 thiss!1248) #b00000000001111111111111111111111) (= (mask!8858 thiss!1248) #b00000000011111111111111111111111) (= (mask!8858 thiss!1248) #b00000000111111111111111111111111) (= (mask!8858 thiss!1248) #b00000001111111111111111111111111) (= (mask!8858 thiss!1248) #b00000011111111111111111111111111) (= (mask!8858 thiss!1248) #b00000111111111111111111111111111) (= (mask!8858 thiss!1248) #b00001111111111111111111111111111) (= (mask!8858 thiss!1248) #b00011111111111111111111111111111) (= (mask!8858 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8858 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!184706 d!55063))

(declare-fun d!55065 () Bool)

(assert (=> d!55065 (= (array_inv!2385 (_keys!5699 thiss!1248)) (bvsge (size!4013 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184710 d!55065))

(declare-fun d!55067 () Bool)

(assert (=> d!55067 (= (array_inv!2386 (_values!3751 thiss!1248)) (bvsge (size!4014 (_values!3751 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184710 d!55067))

(declare-fun d!55069 () Bool)

(declare-fun lt!91406 () SeekEntryResult!616)

(assert (=> d!55069 (and (or ((_ is Undefined!616) lt!91406) (not ((_ is Found!616) lt!91406)) (and (bvsge (index!4635 lt!91406) #b00000000000000000000000000000000) (bvslt (index!4635 lt!91406) (size!4013 (_keys!5699 thiss!1248))))) (or ((_ is Undefined!616) lt!91406) ((_ is Found!616) lt!91406) (not ((_ is MissingZero!616) lt!91406)) (and (bvsge (index!4634 lt!91406) #b00000000000000000000000000000000) (bvslt (index!4634 lt!91406) (size!4013 (_keys!5699 thiss!1248))))) (or ((_ is Undefined!616) lt!91406) ((_ is Found!616) lt!91406) ((_ is MissingZero!616) lt!91406) (not ((_ is MissingVacant!616) lt!91406)) (and (bvsge (index!4637 lt!91406) #b00000000000000000000000000000000) (bvslt (index!4637 lt!91406) (size!4013 (_keys!5699 thiss!1248))))) (or ((_ is Undefined!616) lt!91406) (ite ((_ is Found!616) lt!91406) (= (select (arr!3698 (_keys!5699 thiss!1248)) (index!4635 lt!91406)) key!828) (ite ((_ is MissingZero!616) lt!91406) (= (select (arr!3698 (_keys!5699 thiss!1248)) (index!4634 lt!91406)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!616) lt!91406) (= (select (arr!3698 (_keys!5699 thiss!1248)) (index!4637 lt!91406)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!121618 () SeekEntryResult!616)

(assert (=> d!55069 (= lt!91406 e!121618)))

(declare-fun c!33153 () Bool)

(declare-fun lt!91405 () SeekEntryResult!616)

(assert (=> d!55069 (= c!33153 (and ((_ is Intermediate!616) lt!91405) (undefined!1428 lt!91405)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7829 (_ BitVec 32)) SeekEntryResult!616)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55069 (= lt!91405 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8858 thiss!1248)) key!828 (_keys!5699 thiss!1248) (mask!8858 thiss!1248)))))

(assert (=> d!55069 (validMask!0 (mask!8858 thiss!1248))))

(assert (=> d!55069 (= (seekEntryOrOpen!0 key!828 (_keys!5699 thiss!1248) (mask!8858 thiss!1248)) lt!91406)))

(declare-fun b!184780 () Bool)

(assert (=> b!184780 (= e!121618 Undefined!616)))

(declare-fun b!184781 () Bool)

(declare-fun c!33152 () Bool)

(declare-fun lt!91407 () (_ BitVec 64))

(assert (=> b!184781 (= c!33152 (= lt!91407 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!121619 () SeekEntryResult!616)

(declare-fun e!121617 () SeekEntryResult!616)

(assert (=> b!184781 (= e!121619 e!121617)))

(declare-fun b!184782 () Bool)

(assert (=> b!184782 (= e!121618 e!121619)))

(assert (=> b!184782 (= lt!91407 (select (arr!3698 (_keys!5699 thiss!1248)) (index!4636 lt!91405)))))

(declare-fun c!33154 () Bool)

(assert (=> b!184782 (= c!33154 (= lt!91407 key!828))))

(declare-fun b!184783 () Bool)

(assert (=> b!184783 (= e!121619 (Found!616 (index!4636 lt!91405)))))

(declare-fun b!184784 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7829 (_ BitVec 32)) SeekEntryResult!616)

(assert (=> b!184784 (= e!121617 (seekKeyOrZeroReturnVacant!0 (x!20066 lt!91405) (index!4636 lt!91405) (index!4636 lt!91405) key!828 (_keys!5699 thiss!1248) (mask!8858 thiss!1248)))))

(declare-fun b!184785 () Bool)

(assert (=> b!184785 (= e!121617 (MissingZero!616 (index!4636 lt!91405)))))

(assert (= (and d!55069 c!33153) b!184780))

(assert (= (and d!55069 (not c!33153)) b!184782))

(assert (= (and b!184782 c!33154) b!184783))

(assert (= (and b!184782 (not c!33154)) b!184781))

(assert (= (and b!184781 c!33152) b!184785))

(assert (= (and b!184781 (not c!33152)) b!184784))

(declare-fun m!212267 () Bool)

(assert (=> d!55069 m!212267))

(declare-fun m!212269 () Bool)

(assert (=> d!55069 m!212269))

(assert (=> d!55069 m!212223))

(declare-fun m!212271 () Bool)

(assert (=> d!55069 m!212271))

(declare-fun m!212273 () Bool)

(assert (=> d!55069 m!212273))

(declare-fun m!212275 () Bool)

(assert (=> d!55069 m!212275))

(assert (=> d!55069 m!212273))

(declare-fun m!212277 () Bool)

(assert (=> b!184782 m!212277))

(declare-fun m!212279 () Bool)

(assert (=> b!184784 m!212279))

(assert (=> b!184711 d!55069))

(declare-fun d!55071 () Bool)

(declare-fun res!87415 () Bool)

(declare-fun e!121622 () Bool)

(assert (=> d!55071 (=> (not res!87415) (not e!121622))))

(declare-fun simpleValid!179 (LongMapFixedSize!2542) Bool)

(assert (=> d!55071 (= res!87415 (simpleValid!179 thiss!1248))))

(assert (=> d!55071 (= (valid!1072 thiss!1248) e!121622)))

(declare-fun b!184792 () Bool)

(declare-fun res!87416 () Bool)

(assert (=> b!184792 (=> (not res!87416) (not e!121622))))

(declare-fun arrayCountValidKeys!0 (array!7829 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!184792 (= res!87416 (= (arrayCountValidKeys!0 (_keys!5699 thiss!1248) #b00000000000000000000000000000000 (size!4013 (_keys!5699 thiss!1248))) (_size!1320 thiss!1248)))))

(declare-fun b!184793 () Bool)

(declare-fun res!87417 () Bool)

(assert (=> b!184793 (=> (not res!87417) (not e!121622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7829 (_ BitVec 32)) Bool)

(assert (=> b!184793 (= res!87417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5699 thiss!1248) (mask!8858 thiss!1248)))))

(declare-fun b!184794 () Bool)

(declare-datatypes ((List!2315 0))(
  ( (Nil!2312) (Cons!2311 (h!2943 (_ BitVec 64)) (t!7185 List!2315)) )
))
(declare-fun arrayNoDuplicates!0 (array!7829 (_ BitVec 32) List!2315) Bool)

(assert (=> b!184794 (= e!121622 (arrayNoDuplicates!0 (_keys!5699 thiss!1248) #b00000000000000000000000000000000 Nil!2312))))

(assert (= (and d!55071 res!87415) b!184792))

(assert (= (and b!184792 res!87416) b!184793))

(assert (= (and b!184793 res!87417) b!184794))

(declare-fun m!212281 () Bool)

(assert (=> d!55071 m!212281))

(declare-fun m!212283 () Bool)

(assert (=> b!184792 m!212283))

(declare-fun m!212285 () Bool)

(assert (=> b!184793 m!212285))

(declare-fun m!212287 () Bool)

(assert (=> b!184794 m!212287))

(assert (=> start!18674 d!55071))

(declare-fun d!55073 () Bool)

(declare-fun e!121627 () Bool)

(assert (=> d!55073 e!121627))

(declare-fun res!87420 () Bool)

(assert (=> d!55073 (=> res!87420 e!121627)))

(declare-fun lt!91416 () Bool)

(assert (=> d!55073 (= res!87420 (not lt!91416))))

(declare-fun lt!91419 () Bool)

(assert (=> d!55073 (= lt!91416 lt!91419)))

(declare-datatypes ((Unit!5576 0))(
  ( (Unit!5577) )
))
(declare-fun lt!91418 () Unit!5576)

(declare-fun e!121628 () Unit!5576)

(assert (=> d!55073 (= lt!91418 e!121628)))

(declare-fun c!33157 () Bool)

(assert (=> d!55073 (= c!33157 lt!91419)))

(declare-fun containsKey!224 (List!2312 (_ BitVec 64)) Bool)

(assert (=> d!55073 (= lt!91419 (containsKey!224 (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828))))

(assert (=> d!55073 (= (contains!1268 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)) key!828) lt!91416)))

(declare-fun b!184801 () Bool)

(declare-fun lt!91417 () Unit!5576)

(assert (=> b!184801 (= e!121628 lt!91417)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!172 (List!2312 (_ BitVec 64)) Unit!5576)

(assert (=> b!184801 (= lt!91417 (lemmaContainsKeyImpliesGetValueByKeyDefined!172 (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828))))

(declare-datatypes ((Option!227 0))(
  ( (Some!226 (v!4116 V!5409)) (None!225) )
))
(declare-fun isDefined!173 (Option!227) Bool)

(declare-fun getValueByKey!221 (List!2312 (_ BitVec 64)) Option!227)

(assert (=> b!184801 (isDefined!173 (getValueByKey!221 (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828))))

(declare-fun b!184802 () Bool)

(declare-fun Unit!5578 () Unit!5576)

(assert (=> b!184802 (= e!121628 Unit!5578)))

(declare-fun b!184803 () Bool)

(assert (=> b!184803 (= e!121627 (isDefined!173 (getValueByKey!221 (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828)))))

(assert (= (and d!55073 c!33157) b!184801))

(assert (= (and d!55073 (not c!33157)) b!184802))

(assert (= (and d!55073 (not res!87420)) b!184803))

(declare-fun m!212289 () Bool)

(assert (=> d!55073 m!212289))

(declare-fun m!212291 () Bool)

(assert (=> b!184801 m!212291))

(declare-fun m!212293 () Bool)

(assert (=> b!184801 m!212293))

(assert (=> b!184801 m!212293))

(declare-fun m!212295 () Bool)

(assert (=> b!184801 m!212295))

(assert (=> b!184803 m!212293))

(assert (=> b!184803 m!212293))

(assert (=> b!184803 m!212295))

(assert (=> b!184709 d!55073))

(declare-fun b!184846 () Bool)

(declare-fun e!121665 () Bool)

(declare-fun lt!91473 () ListLongMap!2297)

(declare-fun apply!163 (ListLongMap!2297 (_ BitVec 64)) V!5409)

(assert (=> b!184846 (= e!121665 (= (apply!163 lt!91473 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3609 thiss!1248)))))

(declare-fun b!184847 () Bool)

(declare-fun res!87445 () Bool)

(declare-fun e!121657 () Bool)

(assert (=> b!184847 (=> (not res!87445) (not e!121657))))

(declare-fun e!121662 () Bool)

(assert (=> b!184847 (= res!87445 e!121662)))

(declare-fun c!33175 () Bool)

(assert (=> b!184847 (= c!33175 (not (= (bvand (extraKeys!3505 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!184848 () Bool)

(declare-fun e!121655 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!184848 (= e!121655 (validKeyInArray!0 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18628 () Bool)

(declare-fun call!18636 () ListLongMap!2297)

(declare-fun call!18637 () ListLongMap!2297)

(assert (=> bm!18628 (= call!18636 call!18637)))

(declare-fun b!184849 () Bool)

(declare-fun e!121663 () Bool)

(assert (=> b!184849 (= e!121663 (validKeyInArray!0 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184851 () Bool)

(declare-fun e!121666 () ListLongMap!2297)

(declare-fun +!283 (ListLongMap!2297 tuple2!3376) ListLongMap!2297)

(assert (=> b!184851 (= e!121666 (+!283 call!18637 (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))))))

(declare-fun b!184852 () Bool)

(declare-fun e!121661 () Bool)

(declare-fun call!18635 () Bool)

(assert (=> b!184852 (= e!121661 (not call!18635))))

(declare-fun b!184853 () Bool)

(declare-fun call!18633 () Bool)

(assert (=> b!184853 (= e!121662 (not call!18633))))

(declare-fun b!184854 () Bool)

(assert (=> b!184854 (= e!121657 e!121661)))

(declare-fun c!33173 () Bool)

(assert (=> b!184854 (= c!33173 (not (= (bvand (extraKeys!3505 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!184855 () Bool)

(declare-fun e!121656 () ListLongMap!2297)

(declare-fun call!18631 () ListLongMap!2297)

(assert (=> b!184855 (= e!121656 call!18631)))

(declare-fun b!184856 () Bool)

(declare-fun e!121667 () ListLongMap!2297)

(assert (=> b!184856 (= e!121667 call!18636)))

(declare-fun bm!18629 () Bool)

(assert (=> bm!18629 (= call!18635 (contains!1268 lt!91473 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184857 () Bool)

(assert (=> b!184857 (= e!121662 e!121665)))

(declare-fun res!87447 () Bool)

(assert (=> b!184857 (= res!87447 call!18633)))

(assert (=> b!184857 (=> (not res!87447) (not e!121665))))

(declare-fun bm!18630 () Bool)

(declare-fun call!18634 () ListLongMap!2297)

(declare-fun getCurrentListMapNoExtraKeys!194 (array!7829 array!7831 (_ BitVec 32) (_ BitVec 32) V!5409 V!5409 (_ BitVec 32) Int) ListLongMap!2297)

(assert (=> bm!18630 (= call!18634 (getCurrentListMapNoExtraKeys!194 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))))

(declare-fun b!184858 () Bool)

(declare-fun e!121660 () Unit!5576)

(declare-fun lt!91484 () Unit!5576)

(assert (=> b!184858 (= e!121660 lt!91484)))

(declare-fun lt!91482 () ListLongMap!2297)

(assert (=> b!184858 (= lt!91482 (getCurrentListMapNoExtraKeys!194 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))))

(declare-fun lt!91485 () (_ BitVec 64))

(assert (=> b!184858 (= lt!91485 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91476 () (_ BitVec 64))

(assert (=> b!184858 (= lt!91476 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91468 () Unit!5576)

(declare-fun addStillContains!139 (ListLongMap!2297 (_ BitVec 64) V!5409 (_ BitVec 64)) Unit!5576)

(assert (=> b!184858 (= lt!91468 (addStillContains!139 lt!91482 lt!91485 (zeroValue!3609 thiss!1248) lt!91476))))

(assert (=> b!184858 (contains!1268 (+!283 lt!91482 (tuple2!3377 lt!91485 (zeroValue!3609 thiss!1248))) lt!91476)))

(declare-fun lt!91465 () Unit!5576)

(assert (=> b!184858 (= lt!91465 lt!91468)))

(declare-fun lt!91472 () ListLongMap!2297)

(assert (=> b!184858 (= lt!91472 (getCurrentListMapNoExtraKeys!194 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))))

(declare-fun lt!91479 () (_ BitVec 64))

(assert (=> b!184858 (= lt!91479 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91481 () (_ BitVec 64))

(assert (=> b!184858 (= lt!91481 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91477 () Unit!5576)

(declare-fun addApplyDifferent!139 (ListLongMap!2297 (_ BitVec 64) V!5409 (_ BitVec 64)) Unit!5576)

(assert (=> b!184858 (= lt!91477 (addApplyDifferent!139 lt!91472 lt!91479 (minValue!3609 thiss!1248) lt!91481))))

(assert (=> b!184858 (= (apply!163 (+!283 lt!91472 (tuple2!3377 lt!91479 (minValue!3609 thiss!1248))) lt!91481) (apply!163 lt!91472 lt!91481))))

(declare-fun lt!91475 () Unit!5576)

(assert (=> b!184858 (= lt!91475 lt!91477)))

(declare-fun lt!91470 () ListLongMap!2297)

(assert (=> b!184858 (= lt!91470 (getCurrentListMapNoExtraKeys!194 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))))

(declare-fun lt!91474 () (_ BitVec 64))

(assert (=> b!184858 (= lt!91474 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91466 () (_ BitVec 64))

(assert (=> b!184858 (= lt!91466 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91467 () Unit!5576)

(assert (=> b!184858 (= lt!91467 (addApplyDifferent!139 lt!91470 lt!91474 (zeroValue!3609 thiss!1248) lt!91466))))

(assert (=> b!184858 (= (apply!163 (+!283 lt!91470 (tuple2!3377 lt!91474 (zeroValue!3609 thiss!1248))) lt!91466) (apply!163 lt!91470 lt!91466))))

(declare-fun lt!91480 () Unit!5576)

(assert (=> b!184858 (= lt!91480 lt!91467)))

(declare-fun lt!91478 () ListLongMap!2297)

(assert (=> b!184858 (= lt!91478 (getCurrentListMapNoExtraKeys!194 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))))

(declare-fun lt!91471 () (_ BitVec 64))

(assert (=> b!184858 (= lt!91471 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91483 () (_ BitVec 64))

(assert (=> b!184858 (= lt!91483 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184858 (= lt!91484 (addApplyDifferent!139 lt!91478 lt!91471 (minValue!3609 thiss!1248) lt!91483))))

(assert (=> b!184858 (= (apply!163 (+!283 lt!91478 (tuple2!3377 lt!91471 (minValue!3609 thiss!1248))) lt!91483) (apply!163 lt!91478 lt!91483))))

(declare-fun bm!18631 () Bool)

(declare-fun call!18632 () ListLongMap!2297)

(assert (=> bm!18631 (= call!18631 call!18632)))

(declare-fun b!184859 () Bool)

(declare-fun res!87441 () Bool)

(assert (=> b!184859 (=> (not res!87441) (not e!121657))))

(declare-fun e!121659 () Bool)

(assert (=> b!184859 (= res!87441 e!121659)))

(declare-fun res!87446 () Bool)

(assert (=> b!184859 (=> res!87446 e!121659)))

(assert (=> b!184859 (= res!87446 (not e!121663))))

(declare-fun res!87443 () Bool)

(assert (=> b!184859 (=> (not res!87443) (not e!121663))))

(assert (=> b!184859 (= res!87443 (bvslt #b00000000000000000000000000000000 (size!4013 (_keys!5699 thiss!1248))))))

(declare-fun b!184860 () Bool)

(declare-fun e!121658 () Bool)

(assert (=> b!184860 (= e!121658 (= (apply!163 lt!91473 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3609 thiss!1248)))))

(declare-fun d!55075 () Bool)

(assert (=> d!55075 e!121657))

(declare-fun res!87444 () Bool)

(assert (=> d!55075 (=> (not res!87444) (not e!121657))))

(assert (=> d!55075 (= res!87444 (or (bvsge #b00000000000000000000000000000000 (size!4013 (_keys!5699 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4013 (_keys!5699 thiss!1248))))))))

(declare-fun lt!91464 () ListLongMap!2297)

(assert (=> d!55075 (= lt!91473 lt!91464)))

(declare-fun lt!91469 () Unit!5576)

(assert (=> d!55075 (= lt!91469 e!121660)))

(declare-fun c!33170 () Bool)

(assert (=> d!55075 (= c!33170 e!121655)))

(declare-fun res!87439 () Bool)

(assert (=> d!55075 (=> (not res!87439) (not e!121655))))

(assert (=> d!55075 (= res!87439 (bvslt #b00000000000000000000000000000000 (size!4013 (_keys!5699 thiss!1248))))))

(assert (=> d!55075 (= lt!91464 e!121666)))

(declare-fun c!33171 () Bool)

(assert (=> d!55075 (= c!33171 (and (not (= (bvand (extraKeys!3505 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3505 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55075 (validMask!0 (mask!8858 thiss!1248))))

(assert (=> d!55075 (= (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)) lt!91473)))

(declare-fun b!184850 () Bool)

(declare-fun e!121664 () Bool)

(declare-fun get!2135 (ValueCell!1817 V!5409) V!5409)

(declare-fun dynLambda!506 (Int (_ BitVec 64)) V!5409)

(assert (=> b!184850 (= e!121664 (= (apply!163 lt!91473 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000)) (get!2135 (select (arr!3699 (_values!3751 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!506 (defaultEntry!3768 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!184850 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4014 (_values!3751 thiss!1248))))))

(assert (=> b!184850 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4013 (_keys!5699 thiss!1248))))))

(declare-fun b!184861 () Bool)

(assert (=> b!184861 (= e!121661 e!121658)))

(declare-fun res!87440 () Bool)

(assert (=> b!184861 (= res!87440 call!18635)))

(assert (=> b!184861 (=> (not res!87440) (not e!121658))))

(declare-fun b!184862 () Bool)

(assert (=> b!184862 (= e!121666 e!121667)))

(declare-fun c!33174 () Bool)

(assert (=> b!184862 (= c!33174 (and (not (= (bvand (extraKeys!3505 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3505 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!184863 () Bool)

(assert (=> b!184863 (= e!121659 e!121664)))

(declare-fun res!87442 () Bool)

(assert (=> b!184863 (=> (not res!87442) (not e!121664))))

(assert (=> b!184863 (= res!87442 (contains!1268 lt!91473 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184863 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4013 (_keys!5699 thiss!1248))))))

(declare-fun bm!18632 () Bool)

(assert (=> bm!18632 (= call!18632 call!18634)))

(declare-fun b!184864 () Bool)

(assert (=> b!184864 (= e!121656 call!18636)))

(declare-fun b!184865 () Bool)

(declare-fun Unit!5579 () Unit!5576)

(assert (=> b!184865 (= e!121660 Unit!5579)))

(declare-fun bm!18633 () Bool)

(assert (=> bm!18633 (= call!18637 (+!283 (ite c!33171 call!18634 (ite c!33174 call!18632 call!18631)) (ite (or c!33171 c!33174) (tuple2!3377 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))))))

(declare-fun b!184866 () Bool)

(declare-fun c!33172 () Bool)

(assert (=> b!184866 (= c!33172 (and (not (= (bvand (extraKeys!3505 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3505 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!184866 (= e!121667 e!121656)))

(declare-fun bm!18634 () Bool)

(assert (=> bm!18634 (= call!18633 (contains!1268 lt!91473 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!55075 c!33171) b!184851))

(assert (= (and d!55075 (not c!33171)) b!184862))

(assert (= (and b!184862 c!33174) b!184856))

(assert (= (and b!184862 (not c!33174)) b!184866))

(assert (= (and b!184866 c!33172) b!184864))

(assert (= (and b!184866 (not c!33172)) b!184855))

(assert (= (or b!184864 b!184855) bm!18631))

(assert (= (or b!184856 bm!18631) bm!18632))

(assert (= (or b!184856 b!184864) bm!18628))

(assert (= (or b!184851 bm!18632) bm!18630))

(assert (= (or b!184851 bm!18628) bm!18633))

(assert (= (and d!55075 res!87439) b!184848))

(assert (= (and d!55075 c!33170) b!184858))

(assert (= (and d!55075 (not c!33170)) b!184865))

(assert (= (and d!55075 res!87444) b!184859))

(assert (= (and b!184859 res!87443) b!184849))

(assert (= (and b!184859 (not res!87446)) b!184863))

(assert (= (and b!184863 res!87442) b!184850))

(assert (= (and b!184859 res!87441) b!184847))

(assert (= (and b!184847 c!33175) b!184857))

(assert (= (and b!184847 (not c!33175)) b!184853))

(assert (= (and b!184857 res!87447) b!184846))

(assert (= (or b!184857 b!184853) bm!18634))

(assert (= (and b!184847 res!87445) b!184854))

(assert (= (and b!184854 c!33173) b!184861))

(assert (= (and b!184854 (not c!33173)) b!184852))

(assert (= (and b!184861 res!87440) b!184860))

(assert (= (or b!184861 b!184852) bm!18629))

(declare-fun b_lambda!7253 () Bool)

(assert (=> (not b_lambda!7253) (not b!184850)))

(declare-fun t!7184 () Bool)

(declare-fun tb!2829 () Bool)

(assert (=> (and b!184710 (= (defaultEntry!3768 thiss!1248) (defaultEntry!3768 thiss!1248)) t!7184) tb!2829))

(declare-fun result!4781 () Bool)

(assert (=> tb!2829 (= result!4781 tp_is_empty!4321)))

(assert (=> b!184850 t!7184))

(declare-fun b_and!11159 () Bool)

(assert (= b_and!11153 (and (=> t!7184 result!4781) b_and!11159)))

(declare-fun m!212297 () Bool)

(assert (=> bm!18629 m!212297))

(declare-fun m!212299 () Bool)

(assert (=> b!184850 m!212299))

(declare-fun m!212301 () Bool)

(assert (=> b!184850 m!212301))

(declare-fun m!212303 () Bool)

(assert (=> b!184850 m!212303))

(declare-fun m!212305 () Bool)

(assert (=> b!184850 m!212305))

(assert (=> b!184850 m!212303))

(assert (=> b!184850 m!212299))

(assert (=> b!184850 m!212301))

(declare-fun m!212307 () Bool)

(assert (=> b!184850 m!212307))

(declare-fun m!212309 () Bool)

(assert (=> bm!18634 m!212309))

(assert (=> b!184848 m!212303))

(assert (=> b!184848 m!212303))

(declare-fun m!212311 () Bool)

(assert (=> b!184848 m!212311))

(declare-fun m!212313 () Bool)

(assert (=> bm!18633 m!212313))

(assert (=> b!184849 m!212303))

(assert (=> b!184849 m!212303))

(assert (=> b!184849 m!212311))

(declare-fun m!212315 () Bool)

(assert (=> b!184860 m!212315))

(declare-fun m!212317 () Bool)

(assert (=> b!184858 m!212317))

(declare-fun m!212319 () Bool)

(assert (=> b!184858 m!212319))

(assert (=> b!184858 m!212319))

(declare-fun m!212321 () Bool)

(assert (=> b!184858 m!212321))

(declare-fun m!212323 () Bool)

(assert (=> b!184858 m!212323))

(declare-fun m!212325 () Bool)

(assert (=> b!184858 m!212325))

(declare-fun m!212327 () Bool)

(assert (=> b!184858 m!212327))

(declare-fun m!212329 () Bool)

(assert (=> b!184858 m!212329))

(declare-fun m!212331 () Bool)

(assert (=> b!184858 m!212331))

(declare-fun m!212333 () Bool)

(assert (=> b!184858 m!212333))

(declare-fun m!212335 () Bool)

(assert (=> b!184858 m!212335))

(assert (=> b!184858 m!212329))

(declare-fun m!212337 () Bool)

(assert (=> b!184858 m!212337))

(declare-fun m!212339 () Bool)

(assert (=> b!184858 m!212339))

(assert (=> b!184858 m!212337))

(declare-fun m!212341 () Bool)

(assert (=> b!184858 m!212341))

(declare-fun m!212343 () Bool)

(assert (=> b!184858 m!212343))

(assert (=> b!184858 m!212303))

(declare-fun m!212345 () Bool)

(assert (=> b!184858 m!212345))

(assert (=> b!184858 m!212323))

(declare-fun m!212347 () Bool)

(assert (=> b!184858 m!212347))

(assert (=> d!55075 m!212223))

(assert (=> b!184863 m!212303))

(assert (=> b!184863 m!212303))

(declare-fun m!212349 () Bool)

(assert (=> b!184863 m!212349))

(declare-fun m!212351 () Bool)

(assert (=> b!184851 m!212351))

(assert (=> bm!18630 m!212333))

(declare-fun m!212353 () Bool)

(assert (=> b!184846 m!212353))

(assert (=> b!184709 d!55075))

(declare-fun mapNonEmpty!7439 () Bool)

(declare-fun mapRes!7439 () Bool)

(declare-fun tp!16448 () Bool)

(declare-fun e!121672 () Bool)

(assert (=> mapNonEmpty!7439 (= mapRes!7439 (and tp!16448 e!121672))))

(declare-fun mapValue!7439 () ValueCell!1817)

(declare-fun mapKey!7439 () (_ BitVec 32))

(declare-fun mapRest!7439 () (Array (_ BitVec 32) ValueCell!1817))

(assert (=> mapNonEmpty!7439 (= mapRest!7430 (store mapRest!7439 mapKey!7439 mapValue!7439))))

(declare-fun mapIsEmpty!7439 () Bool)

(assert (=> mapIsEmpty!7439 mapRes!7439))

(declare-fun b!184876 () Bool)

(declare-fun e!121673 () Bool)

(assert (=> b!184876 (= e!121673 tp_is_empty!4321)))

(declare-fun b!184875 () Bool)

(assert (=> b!184875 (= e!121672 tp_is_empty!4321)))

(declare-fun condMapEmpty!7439 () Bool)

(declare-fun mapDefault!7439 () ValueCell!1817)

(assert (=> mapNonEmpty!7430 (= condMapEmpty!7439 (= mapRest!7430 ((as const (Array (_ BitVec 32) ValueCell!1817)) mapDefault!7439)))))

(assert (=> mapNonEmpty!7430 (= tp!16433 (and e!121673 mapRes!7439))))

(assert (= (and mapNonEmpty!7430 condMapEmpty!7439) mapIsEmpty!7439))

(assert (= (and mapNonEmpty!7430 (not condMapEmpty!7439)) mapNonEmpty!7439))

(assert (= (and mapNonEmpty!7439 ((_ is ValueCellFull!1817) mapValue!7439)) b!184875))

(assert (= (and mapNonEmpty!7430 ((_ is ValueCellFull!1817) mapDefault!7439)) b!184876))

(declare-fun m!212355 () Bool)

(assert (=> mapNonEmpty!7439 m!212355))

(declare-fun b_lambda!7255 () Bool)

(assert (= b_lambda!7253 (or (and b!184710 b_free!4549) b_lambda!7255)))

(check-sat (not bm!18634) (not bm!18633) (not b!184849) (not b!184860) (not mapNonEmpty!7439) (not b!184794) (not d!55069) (not b!184793) (not d!55073) (not b!184851) (not bm!18629) (not b!184850) (not b_next!4549) (not b!184784) (not b!184858) (not b!184803) (not b!184863) (not b!184848) (not b_lambda!7255) (not b!184801) tp_is_empty!4321 (not b!184846) (not d!55071) b_and!11159 (not d!55075) (not bm!18630) (not b!184792))
(check-sat b_and!11159 (not b_next!4549))
(get-model)

(declare-fun d!55077 () Bool)

(declare-fun isEmpty!475 (Option!227) Bool)

(assert (=> d!55077 (= (isDefined!173 (getValueByKey!221 (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828)) (not (isEmpty!475 (getValueByKey!221 (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828))))))

(declare-fun bs!7518 () Bool)

(assert (= bs!7518 d!55077))

(assert (=> bs!7518 m!212293))

(declare-fun m!212357 () Bool)

(assert (=> bs!7518 m!212357))

(assert (=> b!184803 d!55077))

(declare-fun b!184886 () Bool)

(declare-fun e!121678 () Option!227)

(declare-fun e!121679 () Option!227)

(assert (=> b!184886 (= e!121678 e!121679)))

(declare-fun c!33181 () Bool)

(assert (=> b!184886 (= c!33181 (and ((_ is Cons!2308) (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))) (not (= (_1!1699 (h!2940 (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))))) key!828))))))

(declare-fun b!184888 () Bool)

(assert (=> b!184888 (= e!121679 None!225)))

(declare-fun b!184887 () Bool)

(assert (=> b!184887 (= e!121679 (getValueByKey!221 (t!7180 (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))) key!828))))

(declare-fun b!184885 () Bool)

(assert (=> b!184885 (= e!121678 (Some!226 (_2!1699 (h!2940 (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))))))))

(declare-fun d!55079 () Bool)

(declare-fun c!33180 () Bool)

(assert (=> d!55079 (= c!33180 (and ((_ is Cons!2308) (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))) (= (_1!1699 (h!2940 (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))))) key!828)))))

(assert (=> d!55079 (= (getValueByKey!221 (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828) e!121678)))

(assert (= (and d!55079 c!33180) b!184885))

(assert (= (and d!55079 (not c!33180)) b!184886))

(assert (= (and b!184886 c!33181) b!184887))

(assert (= (and b!184886 (not c!33181)) b!184888))

(declare-fun m!212359 () Bool)

(assert (=> b!184887 m!212359))

(assert (=> b!184803 d!55079))

(declare-fun d!55081 () Bool)

(declare-fun get!2136 (Option!227) V!5409)

(assert (=> d!55081 (= (apply!163 lt!91473 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000)) (get!2136 (getValueByKey!221 (toList!1164 lt!91473) (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7519 () Bool)

(assert (= bs!7519 d!55081))

(assert (=> bs!7519 m!212303))

(declare-fun m!212361 () Bool)

(assert (=> bs!7519 m!212361))

(assert (=> bs!7519 m!212361))

(declare-fun m!212363 () Bool)

(assert (=> bs!7519 m!212363))

(assert (=> b!184850 d!55081))

(declare-fun d!55083 () Bool)

(declare-fun c!33184 () Bool)

(assert (=> d!55083 (= c!33184 ((_ is ValueCellFull!1817) (select (arr!3699 (_values!3751 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!121682 () V!5409)

(assert (=> d!55083 (= (get!2135 (select (arr!3699 (_values!3751 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!506 (defaultEntry!3768 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!121682)))

(declare-fun b!184893 () Bool)

(declare-fun get!2137 (ValueCell!1817 V!5409) V!5409)

(assert (=> b!184893 (= e!121682 (get!2137 (select (arr!3699 (_values!3751 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!506 (defaultEntry!3768 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!184894 () Bool)

(declare-fun get!2138 (ValueCell!1817 V!5409) V!5409)

(assert (=> b!184894 (= e!121682 (get!2138 (select (arr!3699 (_values!3751 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!506 (defaultEntry!3768 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55083 c!33184) b!184893))

(assert (= (and d!55083 (not c!33184)) b!184894))

(assert (=> b!184893 m!212299))

(assert (=> b!184893 m!212301))

(declare-fun m!212365 () Bool)

(assert (=> b!184893 m!212365))

(assert (=> b!184894 m!212299))

(assert (=> b!184894 m!212301))

(declare-fun m!212367 () Bool)

(assert (=> b!184894 m!212367))

(assert (=> b!184850 d!55083))

(declare-fun e!121689 () SeekEntryResult!616)

(declare-fun b!184907 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!184907 (= e!121689 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20066 lt!91405) #b00000000000000000000000000000001) (nextIndex!0 (index!4636 lt!91405) (bvadd (x!20066 lt!91405) #b00000000000000000000000000000001) (mask!8858 thiss!1248)) (index!4636 lt!91405) key!828 (_keys!5699 thiss!1248) (mask!8858 thiss!1248)))))

(declare-fun b!184908 () Bool)

(declare-fun e!121690 () SeekEntryResult!616)

(assert (=> b!184908 (= e!121690 Undefined!616)))

(declare-fun b!184909 () Bool)

(declare-fun e!121691 () SeekEntryResult!616)

(assert (=> b!184909 (= e!121690 e!121691)))

(declare-fun c!33193 () Bool)

(declare-fun lt!91490 () (_ BitVec 64))

(assert (=> b!184909 (= c!33193 (= lt!91490 key!828))))

(declare-fun lt!91491 () SeekEntryResult!616)

(declare-fun d!55085 () Bool)

(assert (=> d!55085 (and (or ((_ is Undefined!616) lt!91491) (not ((_ is Found!616) lt!91491)) (and (bvsge (index!4635 lt!91491) #b00000000000000000000000000000000) (bvslt (index!4635 lt!91491) (size!4013 (_keys!5699 thiss!1248))))) (or ((_ is Undefined!616) lt!91491) ((_ is Found!616) lt!91491) (not ((_ is MissingVacant!616) lt!91491)) (not (= (index!4637 lt!91491) (index!4636 lt!91405))) (and (bvsge (index!4637 lt!91491) #b00000000000000000000000000000000) (bvslt (index!4637 lt!91491) (size!4013 (_keys!5699 thiss!1248))))) (or ((_ is Undefined!616) lt!91491) (ite ((_ is Found!616) lt!91491) (= (select (arr!3698 (_keys!5699 thiss!1248)) (index!4635 lt!91491)) key!828) (and ((_ is MissingVacant!616) lt!91491) (= (index!4637 lt!91491) (index!4636 lt!91405)) (= (select (arr!3698 (_keys!5699 thiss!1248)) (index!4637 lt!91491)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!55085 (= lt!91491 e!121690)))

(declare-fun c!33191 () Bool)

(assert (=> d!55085 (= c!33191 (bvsge (x!20066 lt!91405) #b01111111111111111111111111111110))))

(assert (=> d!55085 (= lt!91490 (select (arr!3698 (_keys!5699 thiss!1248)) (index!4636 lt!91405)))))

(assert (=> d!55085 (validMask!0 (mask!8858 thiss!1248))))

(assert (=> d!55085 (= (seekKeyOrZeroReturnVacant!0 (x!20066 lt!91405) (index!4636 lt!91405) (index!4636 lt!91405) key!828 (_keys!5699 thiss!1248) (mask!8858 thiss!1248)) lt!91491)))

(declare-fun b!184910 () Bool)

(declare-fun c!33192 () Bool)

(assert (=> b!184910 (= c!33192 (= lt!91490 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184910 (= e!121691 e!121689)))

(declare-fun b!184911 () Bool)

(assert (=> b!184911 (= e!121689 (MissingVacant!616 (index!4636 lt!91405)))))

(declare-fun b!184912 () Bool)

(assert (=> b!184912 (= e!121691 (Found!616 (index!4636 lt!91405)))))

(assert (= (and d!55085 c!33191) b!184908))

(assert (= (and d!55085 (not c!33191)) b!184909))

(assert (= (and b!184909 c!33193) b!184912))

(assert (= (and b!184909 (not c!33193)) b!184910))

(assert (= (and b!184910 c!33192) b!184911))

(assert (= (and b!184910 (not c!33192)) b!184907))

(declare-fun m!212369 () Bool)

(assert (=> b!184907 m!212369))

(assert (=> b!184907 m!212369))

(declare-fun m!212371 () Bool)

(assert (=> b!184907 m!212371))

(declare-fun m!212373 () Bool)

(assert (=> d!55085 m!212373))

(declare-fun m!212375 () Bool)

(assert (=> d!55085 m!212375))

(assert (=> d!55085 m!212277))

(assert (=> d!55085 m!212223))

(assert (=> b!184784 d!55085))

(declare-fun d!55087 () Bool)

(declare-fun e!121692 () Bool)

(assert (=> d!55087 e!121692))

(declare-fun res!87448 () Bool)

(assert (=> d!55087 (=> res!87448 e!121692)))

(declare-fun lt!91492 () Bool)

(assert (=> d!55087 (= res!87448 (not lt!91492))))

(declare-fun lt!91495 () Bool)

(assert (=> d!55087 (= lt!91492 lt!91495)))

(declare-fun lt!91494 () Unit!5576)

(declare-fun e!121693 () Unit!5576)

(assert (=> d!55087 (= lt!91494 e!121693)))

(declare-fun c!33194 () Bool)

(assert (=> d!55087 (= c!33194 lt!91495)))

(assert (=> d!55087 (= lt!91495 (containsKey!224 (toList!1164 lt!91473) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55087 (= (contains!1268 lt!91473 #b0000000000000000000000000000000000000000000000000000000000000000) lt!91492)))

(declare-fun b!184913 () Bool)

(declare-fun lt!91493 () Unit!5576)

(assert (=> b!184913 (= e!121693 lt!91493)))

(assert (=> b!184913 (= lt!91493 (lemmaContainsKeyImpliesGetValueByKeyDefined!172 (toList!1164 lt!91473) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184913 (isDefined!173 (getValueByKey!221 (toList!1164 lt!91473) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184914 () Bool)

(declare-fun Unit!5580 () Unit!5576)

(assert (=> b!184914 (= e!121693 Unit!5580)))

(declare-fun b!184915 () Bool)

(assert (=> b!184915 (= e!121692 (isDefined!173 (getValueByKey!221 (toList!1164 lt!91473) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55087 c!33194) b!184913))

(assert (= (and d!55087 (not c!33194)) b!184914))

(assert (= (and d!55087 (not res!87448)) b!184915))

(declare-fun m!212377 () Bool)

(assert (=> d!55087 m!212377))

(declare-fun m!212379 () Bool)

(assert (=> b!184913 m!212379))

(declare-fun m!212381 () Bool)

(assert (=> b!184913 m!212381))

(assert (=> b!184913 m!212381))

(declare-fun m!212383 () Bool)

(assert (=> b!184913 m!212383))

(assert (=> b!184915 m!212381))

(assert (=> b!184915 m!212381))

(assert (=> b!184915 m!212383))

(assert (=> bm!18634 d!55087))

(declare-fun d!55089 () Bool)

(declare-fun e!121696 () Bool)

(assert (=> d!55089 e!121696))

(declare-fun res!87453 () Bool)

(assert (=> d!55089 (=> (not res!87453) (not e!121696))))

(declare-fun lt!91507 () ListLongMap!2297)

(assert (=> d!55089 (= res!87453 (contains!1268 lt!91507 (_1!1699 (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))))))

(declare-fun lt!91505 () List!2312)

(assert (=> d!55089 (= lt!91507 (ListLongMap!2298 lt!91505))))

(declare-fun lt!91506 () Unit!5576)

(declare-fun lt!91504 () Unit!5576)

(assert (=> d!55089 (= lt!91506 lt!91504)))

(assert (=> d!55089 (= (getValueByKey!221 lt!91505 (_1!1699 (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))) (Some!226 (_2!1699 (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!117 (List!2312 (_ BitVec 64) V!5409) Unit!5576)

(assert (=> d!55089 (= lt!91504 (lemmaContainsTupThenGetReturnValue!117 lt!91505 (_1!1699 (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))) (_2!1699 (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))))))

(declare-fun insertStrictlySorted!120 (List!2312 (_ BitVec 64) V!5409) List!2312)

(assert (=> d!55089 (= lt!91505 (insertStrictlySorted!120 (toList!1164 call!18637) (_1!1699 (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))) (_2!1699 (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))))))

(assert (=> d!55089 (= (+!283 call!18637 (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))) lt!91507)))

(declare-fun b!184920 () Bool)

(declare-fun res!87454 () Bool)

(assert (=> b!184920 (=> (not res!87454) (not e!121696))))

(assert (=> b!184920 (= res!87454 (= (getValueByKey!221 (toList!1164 lt!91507) (_1!1699 (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))) (Some!226 (_2!1699 (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))))))))

(declare-fun b!184921 () Bool)

(declare-fun contains!1271 (List!2312 tuple2!3376) Bool)

(assert (=> b!184921 (= e!121696 (contains!1271 (toList!1164 lt!91507) (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))))))

(assert (= (and d!55089 res!87453) b!184920))

(assert (= (and b!184920 res!87454) b!184921))

(declare-fun m!212385 () Bool)

(assert (=> d!55089 m!212385))

(declare-fun m!212387 () Bool)

(assert (=> d!55089 m!212387))

(declare-fun m!212389 () Bool)

(assert (=> d!55089 m!212389))

(declare-fun m!212391 () Bool)

(assert (=> d!55089 m!212391))

(declare-fun m!212393 () Bool)

(assert (=> b!184920 m!212393))

(declare-fun m!212395 () Bool)

(assert (=> b!184921 m!212395))

(assert (=> b!184851 d!55089))

(declare-fun d!55091 () Bool)

(assert (=> d!55091 (isDefined!173 (getValueByKey!221 (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828))))

(declare-fun lt!91510 () Unit!5576)

(declare-fun choose!986 (List!2312 (_ BitVec 64)) Unit!5576)

(assert (=> d!55091 (= lt!91510 (choose!986 (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828))))

(declare-fun e!121699 () Bool)

(assert (=> d!55091 e!121699))

(declare-fun res!87457 () Bool)

(assert (=> d!55091 (=> (not res!87457) (not e!121699))))

(declare-fun isStrictlySorted!335 (List!2312) Bool)

(assert (=> d!55091 (= res!87457 (isStrictlySorted!335 (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))))))

(assert (=> d!55091 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!172 (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828) lt!91510)))

(declare-fun b!184924 () Bool)

(assert (=> b!184924 (= e!121699 (containsKey!224 (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828))))

(assert (= (and d!55091 res!87457) b!184924))

(assert (=> d!55091 m!212293))

(assert (=> d!55091 m!212293))

(assert (=> d!55091 m!212295))

(declare-fun m!212397 () Bool)

(assert (=> d!55091 m!212397))

(declare-fun m!212399 () Bool)

(assert (=> d!55091 m!212399))

(assert (=> b!184924 m!212289))

(assert (=> b!184801 d!55091))

(assert (=> b!184801 d!55077))

(assert (=> b!184801 d!55079))

(declare-fun b!184943 () Bool)

(declare-fun lt!91516 () SeekEntryResult!616)

(assert (=> b!184943 (and (bvsge (index!4636 lt!91516) #b00000000000000000000000000000000) (bvslt (index!4636 lt!91516) (size!4013 (_keys!5699 thiss!1248))))))

(declare-fun e!121710 () Bool)

(assert (=> b!184943 (= e!121710 (= (select (arr!3698 (_keys!5699 thiss!1248)) (index!4636 lt!91516)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184944 () Bool)

(declare-fun e!121714 () SeekEntryResult!616)

(declare-fun e!121712 () SeekEntryResult!616)

(assert (=> b!184944 (= e!121714 e!121712)))

(declare-fun c!33203 () Bool)

(declare-fun lt!91515 () (_ BitVec 64))

(assert (=> b!184944 (= c!33203 (or (= lt!91515 key!828) (= (bvadd lt!91515 lt!91515) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!184945 () Bool)

(assert (=> b!184945 (and (bvsge (index!4636 lt!91516) #b00000000000000000000000000000000) (bvslt (index!4636 lt!91516) (size!4013 (_keys!5699 thiss!1248))))))

(declare-fun res!87465 () Bool)

(assert (=> b!184945 (= res!87465 (= (select (arr!3698 (_keys!5699 thiss!1248)) (index!4636 lt!91516)) key!828))))

(assert (=> b!184945 (=> res!87465 e!121710)))

(declare-fun e!121711 () Bool)

(assert (=> b!184945 (= e!121711 e!121710)))

(declare-fun d!55093 () Bool)

(declare-fun e!121713 () Bool)

(assert (=> d!55093 e!121713))

(declare-fun c!33201 () Bool)

(assert (=> d!55093 (= c!33201 (and ((_ is Intermediate!616) lt!91516) (undefined!1428 lt!91516)))))

(assert (=> d!55093 (= lt!91516 e!121714)))

(declare-fun c!33202 () Bool)

(assert (=> d!55093 (= c!33202 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!55093 (= lt!91515 (select (arr!3698 (_keys!5699 thiss!1248)) (toIndex!0 key!828 (mask!8858 thiss!1248))))))

(assert (=> d!55093 (validMask!0 (mask!8858 thiss!1248))))

(assert (=> d!55093 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8858 thiss!1248)) key!828 (_keys!5699 thiss!1248) (mask!8858 thiss!1248)) lt!91516)))

(declare-fun b!184946 () Bool)

(assert (=> b!184946 (= e!121712 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8858 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8858 thiss!1248)) key!828 (_keys!5699 thiss!1248) (mask!8858 thiss!1248)))))

(declare-fun b!184947 () Bool)

(assert (=> b!184947 (= e!121714 (Intermediate!616 true (toIndex!0 key!828 (mask!8858 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!184948 () Bool)

(assert (=> b!184948 (and (bvsge (index!4636 lt!91516) #b00000000000000000000000000000000) (bvslt (index!4636 lt!91516) (size!4013 (_keys!5699 thiss!1248))))))

(declare-fun res!87466 () Bool)

(assert (=> b!184948 (= res!87466 (= (select (arr!3698 (_keys!5699 thiss!1248)) (index!4636 lt!91516)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184948 (=> res!87466 e!121710)))

(declare-fun b!184949 () Bool)

(assert (=> b!184949 (= e!121713 e!121711)))

(declare-fun res!87464 () Bool)

(assert (=> b!184949 (= res!87464 (and ((_ is Intermediate!616) lt!91516) (not (undefined!1428 lt!91516)) (bvslt (x!20066 lt!91516) #b01111111111111111111111111111110) (bvsge (x!20066 lt!91516) #b00000000000000000000000000000000) (bvsge (x!20066 lt!91516) #b00000000000000000000000000000000)))))

(assert (=> b!184949 (=> (not res!87464) (not e!121711))))

(declare-fun b!184950 () Bool)

(assert (=> b!184950 (= e!121713 (bvsge (x!20066 lt!91516) #b01111111111111111111111111111110))))

(declare-fun b!184951 () Bool)

(assert (=> b!184951 (= e!121712 (Intermediate!616 false (toIndex!0 key!828 (mask!8858 thiss!1248)) #b00000000000000000000000000000000))))

(assert (= (and d!55093 c!33202) b!184947))

(assert (= (and d!55093 (not c!33202)) b!184944))

(assert (= (and b!184944 c!33203) b!184951))

(assert (= (and b!184944 (not c!33203)) b!184946))

(assert (= (and d!55093 c!33201) b!184950))

(assert (= (and d!55093 (not c!33201)) b!184949))

(assert (= (and b!184949 res!87464) b!184945))

(assert (= (and b!184945 (not res!87465)) b!184948))

(assert (= (and b!184948 (not res!87466)) b!184943))

(declare-fun m!212401 () Bool)

(assert (=> b!184943 m!212401))

(assert (=> b!184946 m!212273))

(declare-fun m!212403 () Bool)

(assert (=> b!184946 m!212403))

(assert (=> b!184946 m!212403))

(declare-fun m!212405 () Bool)

(assert (=> b!184946 m!212405))

(assert (=> d!55093 m!212273))

(declare-fun m!212407 () Bool)

(assert (=> d!55093 m!212407))

(assert (=> d!55093 m!212223))

(assert (=> b!184945 m!212401))

(assert (=> b!184948 m!212401))

(assert (=> d!55069 d!55093))

(declare-fun d!55095 () Bool)

(declare-fun lt!91522 () (_ BitVec 32))

(declare-fun lt!91521 () (_ BitVec 32))

(assert (=> d!55095 (= lt!91522 (bvmul (bvxor lt!91521 (bvlshr lt!91521 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!55095 (= lt!91521 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!55095 (and (bvsge (mask!8858 thiss!1248) #b00000000000000000000000000000000) (let ((res!87467 (let ((h!2944 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20085 (bvmul (bvxor h!2944 (bvlshr h!2944 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20085 (bvlshr x!20085 #b00000000000000000000000000001101)) (mask!8858 thiss!1248)))))) (and (bvslt res!87467 (bvadd (mask!8858 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!87467 #b00000000000000000000000000000000))))))

(assert (=> d!55095 (= (toIndex!0 key!828 (mask!8858 thiss!1248)) (bvand (bvxor lt!91522 (bvlshr lt!91522 #b00000000000000000000000000001101)) (mask!8858 thiss!1248)))))

(assert (=> d!55069 d!55095))

(assert (=> d!55069 d!55063))

(declare-fun d!55097 () Bool)

(assert (=> d!55097 (= (apply!163 lt!91473 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2136 (getValueByKey!221 (toList!1164 lt!91473) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7520 () Bool)

(assert (= bs!7520 d!55097))

(declare-fun m!212409 () Bool)

(assert (=> bs!7520 m!212409))

(assert (=> bs!7520 m!212409))

(declare-fun m!212411 () Bool)

(assert (=> bs!7520 m!212411))

(assert (=> b!184860 d!55097))

(assert (=> d!55075 d!55063))

(declare-fun d!55099 () Bool)

(declare-fun res!87473 () Bool)

(declare-fun e!121723 () Bool)

(assert (=> d!55099 (=> res!87473 e!121723)))

(assert (=> d!55099 (= res!87473 (bvsge #b00000000000000000000000000000000 (size!4013 (_keys!5699 thiss!1248))))))

(assert (=> d!55099 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5699 thiss!1248) (mask!8858 thiss!1248)) e!121723)))

(declare-fun b!184960 () Bool)

(declare-fun e!121722 () Bool)

(assert (=> b!184960 (= e!121723 e!121722)))

(declare-fun c!33206 () Bool)

(assert (=> b!184960 (= c!33206 (validKeyInArray!0 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184961 () Bool)

(declare-fun call!18640 () Bool)

(assert (=> b!184961 (= e!121722 call!18640)))

(declare-fun bm!18637 () Bool)

(assert (=> bm!18637 (= call!18640 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5699 thiss!1248) (mask!8858 thiss!1248)))))

(declare-fun b!184962 () Bool)

(declare-fun e!121721 () Bool)

(assert (=> b!184962 (= e!121721 call!18640)))

(declare-fun b!184963 () Bool)

(assert (=> b!184963 (= e!121722 e!121721)))

(declare-fun lt!91530 () (_ BitVec 64))

(assert (=> b!184963 (= lt!91530 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91531 () Unit!5576)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7829 (_ BitVec 64) (_ BitVec 32)) Unit!5576)

(assert (=> b!184963 (= lt!91531 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5699 thiss!1248) lt!91530 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!184963 (arrayContainsKey!0 (_keys!5699 thiss!1248) lt!91530 #b00000000000000000000000000000000)))

(declare-fun lt!91529 () Unit!5576)

(assert (=> b!184963 (= lt!91529 lt!91531)))

(declare-fun res!87472 () Bool)

(assert (=> b!184963 (= res!87472 (= (seekEntryOrOpen!0 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000) (_keys!5699 thiss!1248) (mask!8858 thiss!1248)) (Found!616 #b00000000000000000000000000000000)))))

(assert (=> b!184963 (=> (not res!87472) (not e!121721))))

(assert (= (and d!55099 (not res!87473)) b!184960))

(assert (= (and b!184960 c!33206) b!184963))

(assert (= (and b!184960 (not c!33206)) b!184961))

(assert (= (and b!184963 res!87472) b!184962))

(assert (= (or b!184962 b!184961) bm!18637))

(assert (=> b!184960 m!212303))

(assert (=> b!184960 m!212303))

(assert (=> b!184960 m!212311))

(declare-fun m!212413 () Bool)

(assert (=> bm!18637 m!212413))

(assert (=> b!184963 m!212303))

(declare-fun m!212415 () Bool)

(assert (=> b!184963 m!212415))

(declare-fun m!212417 () Bool)

(assert (=> b!184963 m!212417))

(assert (=> b!184963 m!212303))

(declare-fun m!212419 () Bool)

(assert (=> b!184963 m!212419))

(assert (=> b!184793 d!55099))

(declare-fun d!55101 () Bool)

(declare-fun res!87478 () Bool)

(declare-fun e!121728 () Bool)

(assert (=> d!55101 (=> res!87478 e!121728)))

(assert (=> d!55101 (= res!87478 (and ((_ is Cons!2308) (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))) (= (_1!1699 (h!2940 (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))))) key!828)))))

(assert (=> d!55101 (= (containsKey!224 (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828) e!121728)))

(declare-fun b!184968 () Bool)

(declare-fun e!121729 () Bool)

(assert (=> b!184968 (= e!121728 e!121729)))

(declare-fun res!87479 () Bool)

(assert (=> b!184968 (=> (not res!87479) (not e!121729))))

(assert (=> b!184968 (= res!87479 (and (or (not ((_ is Cons!2308) (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))))) (bvsle (_1!1699 (h!2940 (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))))) key!828)) ((_ is Cons!2308) (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))) (bvslt (_1!1699 (h!2940 (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))))) key!828)))))

(declare-fun b!184969 () Bool)

(assert (=> b!184969 (= e!121729 (containsKey!224 (t!7180 (toList!1164 (getCurrentListMap!816 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))) key!828))))

(assert (= (and d!55101 (not res!87478)) b!184968))

(assert (= (and b!184968 res!87479) b!184969))

(declare-fun m!212421 () Bool)

(assert (=> b!184969 m!212421))

(assert (=> d!55073 d!55101))

(declare-fun b!184994 () Bool)

(declare-fun res!87488 () Bool)

(declare-fun e!121746 () Bool)

(assert (=> b!184994 (=> (not res!87488) (not e!121746))))

(declare-fun lt!91551 () ListLongMap!2297)

(assert (=> b!184994 (= res!87488 (not (contains!1268 lt!91551 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!184995 () Bool)

(declare-fun e!121750 () Bool)

(assert (=> b!184995 (= e!121750 (validKeyInArray!0 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184995 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!184996 () Bool)

(declare-fun e!121744 () Bool)

(declare-fun e!121745 () Bool)

(assert (=> b!184996 (= e!121744 e!121745)))

(declare-fun c!33215 () Bool)

(assert (=> b!184996 (= c!33215 (bvslt #b00000000000000000000000000000000 (size!4013 (_keys!5699 thiss!1248))))))

(declare-fun b!184997 () Bool)

(assert (=> b!184997 (= e!121746 e!121744)))

(declare-fun c!33216 () Bool)

(assert (=> b!184997 (= c!33216 e!121750)))

(declare-fun res!87491 () Bool)

(assert (=> b!184997 (=> (not res!87491) (not e!121750))))

(assert (=> b!184997 (= res!87491 (bvslt #b00000000000000000000000000000000 (size!4013 (_keys!5699 thiss!1248))))))

(declare-fun b!184998 () Bool)

(declare-fun e!121749 () ListLongMap!2297)

(declare-fun e!121748 () ListLongMap!2297)

(assert (=> b!184998 (= e!121749 e!121748)))

(declare-fun c!33218 () Bool)

(assert (=> b!184998 (= c!33218 (validKeyInArray!0 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184999 () Bool)

(declare-fun isEmpty!476 (ListLongMap!2297) Bool)

(assert (=> b!184999 (= e!121745 (isEmpty!476 lt!91551))))

(declare-fun b!185000 () Bool)

(declare-fun e!121747 () Bool)

(assert (=> b!185000 (= e!121744 e!121747)))

(assert (=> b!185000 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4013 (_keys!5699 thiss!1248))))))

(declare-fun res!87490 () Bool)

(assert (=> b!185000 (= res!87490 (contains!1268 lt!91551 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!185000 (=> (not res!87490) (not e!121747))))

(declare-fun d!55103 () Bool)

(assert (=> d!55103 e!121746))

(declare-fun res!87489 () Bool)

(assert (=> d!55103 (=> (not res!87489) (not e!121746))))

(assert (=> d!55103 (= res!87489 (not (contains!1268 lt!91551 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55103 (= lt!91551 e!121749)))

(declare-fun c!33217 () Bool)

(assert (=> d!55103 (= c!33217 (bvsge #b00000000000000000000000000000000 (size!4013 (_keys!5699 thiss!1248))))))

(assert (=> d!55103 (validMask!0 (mask!8858 thiss!1248))))

(assert (=> d!55103 (= (getCurrentListMapNoExtraKeys!194 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)) lt!91551)))

(declare-fun b!185001 () Bool)

(assert (=> b!185001 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4013 (_keys!5699 thiss!1248))))))

(assert (=> b!185001 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4014 (_values!3751 thiss!1248))))))

(assert (=> b!185001 (= e!121747 (= (apply!163 lt!91551 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000)) (get!2135 (select (arr!3699 (_values!3751 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!506 (defaultEntry!3768 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!185002 () Bool)

(declare-fun call!18643 () ListLongMap!2297)

(assert (=> b!185002 (= e!121748 call!18643)))

(declare-fun b!185003 () Bool)

(assert (=> b!185003 (= e!121749 (ListLongMap!2298 Nil!2309))))

(declare-fun b!185004 () Bool)

(declare-fun lt!91549 () Unit!5576)

(declare-fun lt!91550 () Unit!5576)

(assert (=> b!185004 (= lt!91549 lt!91550)))

(declare-fun lt!91546 () (_ BitVec 64))

(declare-fun lt!91552 () (_ BitVec 64))

(declare-fun lt!91548 () ListLongMap!2297)

(declare-fun lt!91547 () V!5409)

(assert (=> b!185004 (not (contains!1268 (+!283 lt!91548 (tuple2!3377 lt!91552 lt!91547)) lt!91546))))

(declare-fun addStillNotContains!90 (ListLongMap!2297 (_ BitVec 64) V!5409 (_ BitVec 64)) Unit!5576)

(assert (=> b!185004 (= lt!91550 (addStillNotContains!90 lt!91548 lt!91552 lt!91547 lt!91546))))

(assert (=> b!185004 (= lt!91546 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!185004 (= lt!91547 (get!2135 (select (arr!3699 (_values!3751 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!506 (defaultEntry!3768 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185004 (= lt!91552 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185004 (= lt!91548 call!18643)))

(assert (=> b!185004 (= e!121748 (+!283 call!18643 (tuple2!3377 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000) (get!2135 (select (arr!3699 (_values!3751 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!506 (defaultEntry!3768 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!185005 () Bool)

(assert (=> b!185005 (= e!121745 (= lt!91551 (getCurrentListMapNoExtraKeys!194 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3768 thiss!1248))))))

(declare-fun bm!18640 () Bool)

(assert (=> bm!18640 (= call!18643 (getCurrentListMapNoExtraKeys!194 (_keys!5699 thiss!1248) (_values!3751 thiss!1248) (mask!8858 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3768 thiss!1248)))))

(assert (= (and d!55103 c!33217) b!185003))

(assert (= (and d!55103 (not c!33217)) b!184998))

(assert (= (and b!184998 c!33218) b!185004))

(assert (= (and b!184998 (not c!33218)) b!185002))

(assert (= (or b!185004 b!185002) bm!18640))

(assert (= (and d!55103 res!87489) b!184994))

(assert (= (and b!184994 res!87488) b!184997))

(assert (= (and b!184997 res!87491) b!184995))

(assert (= (and b!184997 c!33216) b!185000))

(assert (= (and b!184997 (not c!33216)) b!184996))

(assert (= (and b!185000 res!87490) b!185001))

(assert (= (and b!184996 c!33215) b!185005))

(assert (= (and b!184996 (not c!33215)) b!184999))

(declare-fun b_lambda!7257 () Bool)

(assert (=> (not b_lambda!7257) (not b!185001)))

(assert (=> b!185001 t!7184))

(declare-fun b_and!11161 () Bool)

(assert (= b_and!11159 (and (=> t!7184 result!4781) b_and!11161)))

(declare-fun b_lambda!7259 () Bool)

(assert (=> (not b_lambda!7259) (not b!185004)))

(assert (=> b!185004 t!7184))

(declare-fun b_and!11163 () Bool)

(assert (= b_and!11161 (and (=> t!7184 result!4781) b_and!11163)))

(assert (=> b!184995 m!212303))

(assert (=> b!184995 m!212303))

(assert (=> b!184995 m!212311))

(assert (=> b!185001 m!212303))

(assert (=> b!185001 m!212301))

(assert (=> b!185001 m!212299))

(assert (=> b!185001 m!212299))

(assert (=> b!185001 m!212301))

(assert (=> b!185001 m!212307))

(assert (=> b!185001 m!212303))

(declare-fun m!212423 () Bool)

(assert (=> b!185001 m!212423))

(assert (=> b!185004 m!212301))

(assert (=> b!185004 m!212299))

(declare-fun m!212425 () Bool)

(assert (=> b!185004 m!212425))

(assert (=> b!185004 m!212299))

(assert (=> b!185004 m!212301))

(assert (=> b!185004 m!212307))

(declare-fun m!212427 () Bool)

(assert (=> b!185004 m!212427))

(declare-fun m!212429 () Bool)

(assert (=> b!185004 m!212429))

(declare-fun m!212431 () Bool)

(assert (=> b!185004 m!212431))

(assert (=> b!185004 m!212303))

(assert (=> b!185004 m!212429))

(declare-fun m!212433 () Bool)

(assert (=> d!55103 m!212433))

(assert (=> d!55103 m!212223))

(declare-fun m!212435 () Bool)

(assert (=> bm!18640 m!212435))

(assert (=> b!185000 m!212303))

(assert (=> b!185000 m!212303))

(declare-fun m!212437 () Bool)

(assert (=> b!185000 m!212437))

(assert (=> b!185005 m!212435))

(declare-fun m!212439 () Bool)

(assert (=> b!184994 m!212439))

(declare-fun m!212441 () Bool)

(assert (=> b!184999 m!212441))

(assert (=> b!184998 m!212303))

(assert (=> b!184998 m!212303))

(assert (=> b!184998 m!212311))

(assert (=> bm!18630 d!55103))

(declare-fun d!55105 () Bool)

(declare-fun e!121751 () Bool)

(assert (=> d!55105 e!121751))

(declare-fun res!87492 () Bool)

(assert (=> d!55105 (=> (not res!87492) (not e!121751))))

(declare-fun lt!91556 () ListLongMap!2297)

(assert (=> d!55105 (= res!87492 (contains!1268 lt!91556 (_1!1699 (ite (or c!33171 c!33174) (tuple2!3377 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))))))))

(declare-fun lt!91554 () List!2312)

(assert (=> d!55105 (= lt!91556 (ListLongMap!2298 lt!91554))))

(declare-fun lt!91555 () Unit!5576)

(declare-fun lt!91553 () Unit!5576)

(assert (=> d!55105 (= lt!91555 lt!91553)))

(assert (=> d!55105 (= (getValueByKey!221 lt!91554 (_1!1699 (ite (or c!33171 c!33174) (tuple2!3377 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))))) (Some!226 (_2!1699 (ite (or c!33171 c!33174) (tuple2!3377 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))))))))

(assert (=> d!55105 (= lt!91553 (lemmaContainsTupThenGetReturnValue!117 lt!91554 (_1!1699 (ite (or c!33171 c!33174) (tuple2!3377 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))) (_2!1699 (ite (or c!33171 c!33174) (tuple2!3377 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))))))))

(assert (=> d!55105 (= lt!91554 (insertStrictlySorted!120 (toList!1164 (ite c!33171 call!18634 (ite c!33174 call!18632 call!18631))) (_1!1699 (ite (or c!33171 c!33174) (tuple2!3377 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))) (_2!1699 (ite (or c!33171 c!33174) (tuple2!3377 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))))))))

(assert (=> d!55105 (= (+!283 (ite c!33171 call!18634 (ite c!33174 call!18632 call!18631)) (ite (or c!33171 c!33174) (tuple2!3377 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))) lt!91556)))

(declare-fun b!185006 () Bool)

(declare-fun res!87493 () Bool)

(assert (=> b!185006 (=> (not res!87493) (not e!121751))))

(assert (=> b!185006 (= res!87493 (= (getValueByKey!221 (toList!1164 lt!91556) (_1!1699 (ite (or c!33171 c!33174) (tuple2!3377 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))))) (Some!226 (_2!1699 (ite (or c!33171 c!33174) (tuple2!3377 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))))))))

(declare-fun b!185007 () Bool)

(assert (=> b!185007 (= e!121751 (contains!1271 (toList!1164 lt!91556) (ite (or c!33171 c!33174) (tuple2!3377 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3377 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))))))

(assert (= (and d!55105 res!87492) b!185006))

(assert (= (and b!185006 res!87493) b!185007))

(declare-fun m!212443 () Bool)

(assert (=> d!55105 m!212443))

(declare-fun m!212445 () Bool)

(assert (=> d!55105 m!212445))

(declare-fun m!212447 () Bool)

(assert (=> d!55105 m!212447))

(declare-fun m!212449 () Bool)

(assert (=> d!55105 m!212449))

(declare-fun m!212451 () Bool)

(assert (=> b!185006 m!212451))

(declare-fun m!212453 () Bool)

(assert (=> b!185007 m!212453))

(assert (=> bm!18633 d!55105))

(declare-fun b!185018 () Bool)

(declare-fun e!121762 () Bool)

(declare-fun call!18646 () Bool)

(assert (=> b!185018 (= e!121762 call!18646)))

(declare-fun d!55107 () Bool)

(declare-fun res!87501 () Bool)

(declare-fun e!121761 () Bool)

(assert (=> d!55107 (=> res!87501 e!121761)))

(assert (=> d!55107 (= res!87501 (bvsge #b00000000000000000000000000000000 (size!4013 (_keys!5699 thiss!1248))))))

(assert (=> d!55107 (= (arrayNoDuplicates!0 (_keys!5699 thiss!1248) #b00000000000000000000000000000000 Nil!2312) e!121761)))

(declare-fun b!185019 () Bool)

(declare-fun e!121760 () Bool)

(assert (=> b!185019 (= e!121760 e!121762)))

(declare-fun c!33221 () Bool)

(assert (=> b!185019 (= c!33221 (validKeyInArray!0 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185020 () Bool)

(assert (=> b!185020 (= e!121761 e!121760)))

(declare-fun res!87502 () Bool)

(assert (=> b!185020 (=> (not res!87502) (not e!121760))))

(declare-fun e!121763 () Bool)

(assert (=> b!185020 (= res!87502 (not e!121763))))

(declare-fun res!87500 () Bool)

(assert (=> b!185020 (=> (not res!87500) (not e!121763))))

(assert (=> b!185020 (= res!87500 (validKeyInArray!0 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185021 () Bool)

(assert (=> b!185021 (= e!121762 call!18646)))

(declare-fun b!185022 () Bool)

(declare-fun contains!1272 (List!2315 (_ BitVec 64)) Bool)

(assert (=> b!185022 (= e!121763 (contains!1272 Nil!2312 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18643 () Bool)

(assert (=> bm!18643 (= call!18646 (arrayNoDuplicates!0 (_keys!5699 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33221 (Cons!2311 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000) Nil!2312) Nil!2312)))))

(assert (= (and d!55107 (not res!87501)) b!185020))

(assert (= (and b!185020 res!87500) b!185022))

(assert (= (and b!185020 res!87502) b!185019))

(assert (= (and b!185019 c!33221) b!185018))

(assert (= (and b!185019 (not c!33221)) b!185021))

(assert (= (or b!185018 b!185021) bm!18643))

(assert (=> b!185019 m!212303))

(assert (=> b!185019 m!212303))

(assert (=> b!185019 m!212311))

(assert (=> b!185020 m!212303))

(assert (=> b!185020 m!212303))

(assert (=> b!185020 m!212311))

(assert (=> b!185022 m!212303))

(assert (=> b!185022 m!212303))

(declare-fun m!212455 () Bool)

(assert (=> b!185022 m!212455))

(assert (=> bm!18643 m!212303))

(declare-fun m!212457 () Bool)

(assert (=> bm!18643 m!212457))

(assert (=> b!184794 d!55107))

(declare-fun d!55109 () Bool)

(assert (=> d!55109 (= (validKeyInArray!0 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!184849 d!55109))

(declare-fun d!55111 () Bool)

(assert (=> d!55111 (contains!1268 (+!283 lt!91482 (tuple2!3377 lt!91485 (zeroValue!3609 thiss!1248))) lt!91476)))

(declare-fun lt!91559 () Unit!5576)

(declare-fun choose!987 (ListLongMap!2297 (_ BitVec 64) V!5409 (_ BitVec 64)) Unit!5576)

(assert (=> d!55111 (= lt!91559 (choose!987 lt!91482 lt!91485 (zeroValue!3609 thiss!1248) lt!91476))))

(assert (=> d!55111 (contains!1268 lt!91482 lt!91476)))

(assert (=> d!55111 (= (addStillContains!139 lt!91482 lt!91485 (zeroValue!3609 thiss!1248) lt!91476) lt!91559)))

(declare-fun bs!7521 () Bool)

(assert (= bs!7521 d!55111))

(assert (=> bs!7521 m!212319))

(assert (=> bs!7521 m!212319))

(assert (=> bs!7521 m!212321))

(declare-fun m!212459 () Bool)

(assert (=> bs!7521 m!212459))

(declare-fun m!212461 () Bool)

(assert (=> bs!7521 m!212461))

(assert (=> b!184858 d!55111))

(declare-fun d!55113 () Bool)

(assert (=> d!55113 (= (apply!163 (+!283 lt!91470 (tuple2!3377 lt!91474 (zeroValue!3609 thiss!1248))) lt!91466) (apply!163 lt!91470 lt!91466))))

(declare-fun lt!91562 () Unit!5576)

(declare-fun choose!988 (ListLongMap!2297 (_ BitVec 64) V!5409 (_ BitVec 64)) Unit!5576)

(assert (=> d!55113 (= lt!91562 (choose!988 lt!91470 lt!91474 (zeroValue!3609 thiss!1248) lt!91466))))

(declare-fun e!121766 () Bool)

(assert (=> d!55113 e!121766))

(declare-fun res!87505 () Bool)

(assert (=> d!55113 (=> (not res!87505) (not e!121766))))

(assert (=> d!55113 (= res!87505 (contains!1268 lt!91470 lt!91466))))

(assert (=> d!55113 (= (addApplyDifferent!139 lt!91470 lt!91474 (zeroValue!3609 thiss!1248) lt!91466) lt!91562)))

(declare-fun b!185027 () Bool)

(assert (=> b!185027 (= e!121766 (not (= lt!91466 lt!91474)))))

(assert (= (and d!55113 res!87505) b!185027))

(assert (=> d!55113 m!212325))

(assert (=> d!55113 m!212329))

(assert (=> d!55113 m!212329))

(assert (=> d!55113 m!212331))

(declare-fun m!212463 () Bool)

(assert (=> d!55113 m!212463))

(declare-fun m!212465 () Bool)

(assert (=> d!55113 m!212465))

(assert (=> b!184858 d!55113))

(declare-fun d!55115 () Bool)

(assert (=> d!55115 (= (apply!163 (+!283 lt!91478 (tuple2!3377 lt!91471 (minValue!3609 thiss!1248))) lt!91483) (apply!163 lt!91478 lt!91483))))

(declare-fun lt!91563 () Unit!5576)

(assert (=> d!55115 (= lt!91563 (choose!988 lt!91478 lt!91471 (minValue!3609 thiss!1248) lt!91483))))

(declare-fun e!121767 () Bool)

(assert (=> d!55115 e!121767))

(declare-fun res!87506 () Bool)

(assert (=> d!55115 (=> (not res!87506) (not e!121767))))

(assert (=> d!55115 (= res!87506 (contains!1268 lt!91478 lt!91483))))

(assert (=> d!55115 (= (addApplyDifferent!139 lt!91478 lt!91471 (minValue!3609 thiss!1248) lt!91483) lt!91563)))

(declare-fun b!185028 () Bool)

(assert (=> b!185028 (= e!121767 (not (= lt!91483 lt!91471)))))

(assert (= (and d!55115 res!87506) b!185028))

(assert (=> d!55115 m!212327))

(assert (=> d!55115 m!212323))

(assert (=> d!55115 m!212323))

(assert (=> d!55115 m!212347))

(declare-fun m!212467 () Bool)

(assert (=> d!55115 m!212467))

(declare-fun m!212469 () Bool)

(assert (=> d!55115 m!212469))

(assert (=> b!184858 d!55115))

(declare-fun d!55117 () Bool)

(assert (=> d!55117 (= (apply!163 (+!283 lt!91472 (tuple2!3377 lt!91479 (minValue!3609 thiss!1248))) lt!91481) (apply!163 lt!91472 lt!91481))))

(declare-fun lt!91564 () Unit!5576)

(assert (=> d!55117 (= lt!91564 (choose!988 lt!91472 lt!91479 (minValue!3609 thiss!1248) lt!91481))))

(declare-fun e!121768 () Bool)

(assert (=> d!55117 e!121768))

(declare-fun res!87507 () Bool)

(assert (=> d!55117 (=> (not res!87507) (not e!121768))))

(assert (=> d!55117 (= res!87507 (contains!1268 lt!91472 lt!91481))))

(assert (=> d!55117 (= (addApplyDifferent!139 lt!91472 lt!91479 (minValue!3609 thiss!1248) lt!91481) lt!91564)))

(declare-fun b!185029 () Bool)

(assert (=> b!185029 (= e!121768 (not (= lt!91481 lt!91479)))))

(assert (= (and d!55117 res!87507) b!185029))

(assert (=> d!55117 m!212339))

(assert (=> d!55117 m!212337))

(assert (=> d!55117 m!212337))

(assert (=> d!55117 m!212341))

(declare-fun m!212471 () Bool)

(assert (=> d!55117 m!212471))

(declare-fun m!212473 () Bool)

(assert (=> d!55117 m!212473))

(assert (=> b!184858 d!55117))

(declare-fun d!55119 () Bool)

(declare-fun e!121769 () Bool)

(assert (=> d!55119 e!121769))

(declare-fun res!87508 () Bool)

(assert (=> d!55119 (=> (not res!87508) (not e!121769))))

(declare-fun lt!91568 () ListLongMap!2297)

(assert (=> d!55119 (= res!87508 (contains!1268 lt!91568 (_1!1699 (tuple2!3377 lt!91479 (minValue!3609 thiss!1248)))))))

(declare-fun lt!91566 () List!2312)

(assert (=> d!55119 (= lt!91568 (ListLongMap!2298 lt!91566))))

(declare-fun lt!91567 () Unit!5576)

(declare-fun lt!91565 () Unit!5576)

(assert (=> d!55119 (= lt!91567 lt!91565)))

(assert (=> d!55119 (= (getValueByKey!221 lt!91566 (_1!1699 (tuple2!3377 lt!91479 (minValue!3609 thiss!1248)))) (Some!226 (_2!1699 (tuple2!3377 lt!91479 (minValue!3609 thiss!1248)))))))

(assert (=> d!55119 (= lt!91565 (lemmaContainsTupThenGetReturnValue!117 lt!91566 (_1!1699 (tuple2!3377 lt!91479 (minValue!3609 thiss!1248))) (_2!1699 (tuple2!3377 lt!91479 (minValue!3609 thiss!1248)))))))

(assert (=> d!55119 (= lt!91566 (insertStrictlySorted!120 (toList!1164 lt!91472) (_1!1699 (tuple2!3377 lt!91479 (minValue!3609 thiss!1248))) (_2!1699 (tuple2!3377 lt!91479 (minValue!3609 thiss!1248)))))))

(assert (=> d!55119 (= (+!283 lt!91472 (tuple2!3377 lt!91479 (minValue!3609 thiss!1248))) lt!91568)))

(declare-fun b!185030 () Bool)

(declare-fun res!87509 () Bool)

(assert (=> b!185030 (=> (not res!87509) (not e!121769))))

(assert (=> b!185030 (= res!87509 (= (getValueByKey!221 (toList!1164 lt!91568) (_1!1699 (tuple2!3377 lt!91479 (minValue!3609 thiss!1248)))) (Some!226 (_2!1699 (tuple2!3377 lt!91479 (minValue!3609 thiss!1248))))))))

(declare-fun b!185031 () Bool)

(assert (=> b!185031 (= e!121769 (contains!1271 (toList!1164 lt!91568) (tuple2!3377 lt!91479 (minValue!3609 thiss!1248))))))

(assert (= (and d!55119 res!87508) b!185030))

(assert (= (and b!185030 res!87509) b!185031))

(declare-fun m!212475 () Bool)

(assert (=> d!55119 m!212475))

(declare-fun m!212477 () Bool)

(assert (=> d!55119 m!212477))

(declare-fun m!212479 () Bool)

(assert (=> d!55119 m!212479))

(declare-fun m!212481 () Bool)

(assert (=> d!55119 m!212481))

(declare-fun m!212483 () Bool)

(assert (=> b!185030 m!212483))

(declare-fun m!212485 () Bool)

(assert (=> b!185031 m!212485))

(assert (=> b!184858 d!55119))

(declare-fun d!55121 () Bool)

(assert (=> d!55121 (= (apply!163 lt!91470 lt!91466) (get!2136 (getValueByKey!221 (toList!1164 lt!91470) lt!91466)))))

(declare-fun bs!7522 () Bool)

(assert (= bs!7522 d!55121))

(declare-fun m!212487 () Bool)

(assert (=> bs!7522 m!212487))

(assert (=> bs!7522 m!212487))

(declare-fun m!212489 () Bool)

(assert (=> bs!7522 m!212489))

(assert (=> b!184858 d!55121))

(declare-fun d!55123 () Bool)

(declare-fun e!121770 () Bool)

(assert (=> d!55123 e!121770))

(declare-fun res!87510 () Bool)

(assert (=> d!55123 (=> (not res!87510) (not e!121770))))

(declare-fun lt!91572 () ListLongMap!2297)

(assert (=> d!55123 (= res!87510 (contains!1268 lt!91572 (_1!1699 (tuple2!3377 lt!91471 (minValue!3609 thiss!1248)))))))

(declare-fun lt!91570 () List!2312)

(assert (=> d!55123 (= lt!91572 (ListLongMap!2298 lt!91570))))

(declare-fun lt!91571 () Unit!5576)

(declare-fun lt!91569 () Unit!5576)

(assert (=> d!55123 (= lt!91571 lt!91569)))

(assert (=> d!55123 (= (getValueByKey!221 lt!91570 (_1!1699 (tuple2!3377 lt!91471 (minValue!3609 thiss!1248)))) (Some!226 (_2!1699 (tuple2!3377 lt!91471 (minValue!3609 thiss!1248)))))))

(assert (=> d!55123 (= lt!91569 (lemmaContainsTupThenGetReturnValue!117 lt!91570 (_1!1699 (tuple2!3377 lt!91471 (minValue!3609 thiss!1248))) (_2!1699 (tuple2!3377 lt!91471 (minValue!3609 thiss!1248)))))))

(assert (=> d!55123 (= lt!91570 (insertStrictlySorted!120 (toList!1164 lt!91478) (_1!1699 (tuple2!3377 lt!91471 (minValue!3609 thiss!1248))) (_2!1699 (tuple2!3377 lt!91471 (minValue!3609 thiss!1248)))))))

(assert (=> d!55123 (= (+!283 lt!91478 (tuple2!3377 lt!91471 (minValue!3609 thiss!1248))) lt!91572)))

(declare-fun b!185032 () Bool)

(declare-fun res!87511 () Bool)

(assert (=> b!185032 (=> (not res!87511) (not e!121770))))

(assert (=> b!185032 (= res!87511 (= (getValueByKey!221 (toList!1164 lt!91572) (_1!1699 (tuple2!3377 lt!91471 (minValue!3609 thiss!1248)))) (Some!226 (_2!1699 (tuple2!3377 lt!91471 (minValue!3609 thiss!1248))))))))

(declare-fun b!185033 () Bool)

(assert (=> b!185033 (= e!121770 (contains!1271 (toList!1164 lt!91572) (tuple2!3377 lt!91471 (minValue!3609 thiss!1248))))))

(assert (= (and d!55123 res!87510) b!185032))

(assert (= (and b!185032 res!87511) b!185033))

(declare-fun m!212491 () Bool)

(assert (=> d!55123 m!212491))

(declare-fun m!212493 () Bool)

(assert (=> d!55123 m!212493))

(declare-fun m!212495 () Bool)

(assert (=> d!55123 m!212495))

(declare-fun m!212497 () Bool)

(assert (=> d!55123 m!212497))

(declare-fun m!212499 () Bool)

(assert (=> b!185032 m!212499))

(declare-fun m!212501 () Bool)

(assert (=> b!185033 m!212501))

(assert (=> b!184858 d!55123))

(declare-fun d!55125 () Bool)

(declare-fun e!121771 () Bool)

(assert (=> d!55125 e!121771))

(declare-fun res!87512 () Bool)

(assert (=> d!55125 (=> res!87512 e!121771)))

(declare-fun lt!91573 () Bool)

(assert (=> d!55125 (= res!87512 (not lt!91573))))

(declare-fun lt!91576 () Bool)

(assert (=> d!55125 (= lt!91573 lt!91576)))

(declare-fun lt!91575 () Unit!5576)

(declare-fun e!121772 () Unit!5576)

(assert (=> d!55125 (= lt!91575 e!121772)))

(declare-fun c!33222 () Bool)

(assert (=> d!55125 (= c!33222 lt!91576)))

(assert (=> d!55125 (= lt!91576 (containsKey!224 (toList!1164 (+!283 lt!91482 (tuple2!3377 lt!91485 (zeroValue!3609 thiss!1248)))) lt!91476))))

(assert (=> d!55125 (= (contains!1268 (+!283 lt!91482 (tuple2!3377 lt!91485 (zeroValue!3609 thiss!1248))) lt!91476) lt!91573)))

(declare-fun b!185034 () Bool)

(declare-fun lt!91574 () Unit!5576)

(assert (=> b!185034 (= e!121772 lt!91574)))

(assert (=> b!185034 (= lt!91574 (lemmaContainsKeyImpliesGetValueByKeyDefined!172 (toList!1164 (+!283 lt!91482 (tuple2!3377 lt!91485 (zeroValue!3609 thiss!1248)))) lt!91476))))

(assert (=> b!185034 (isDefined!173 (getValueByKey!221 (toList!1164 (+!283 lt!91482 (tuple2!3377 lt!91485 (zeroValue!3609 thiss!1248)))) lt!91476))))

(declare-fun b!185035 () Bool)

(declare-fun Unit!5581 () Unit!5576)

(assert (=> b!185035 (= e!121772 Unit!5581)))

(declare-fun b!185036 () Bool)

(assert (=> b!185036 (= e!121771 (isDefined!173 (getValueByKey!221 (toList!1164 (+!283 lt!91482 (tuple2!3377 lt!91485 (zeroValue!3609 thiss!1248)))) lt!91476)))))

(assert (= (and d!55125 c!33222) b!185034))

(assert (= (and d!55125 (not c!33222)) b!185035))

(assert (= (and d!55125 (not res!87512)) b!185036))

(declare-fun m!212503 () Bool)

(assert (=> d!55125 m!212503))

(declare-fun m!212505 () Bool)

(assert (=> b!185034 m!212505))

(declare-fun m!212507 () Bool)

(assert (=> b!185034 m!212507))

(assert (=> b!185034 m!212507))

(declare-fun m!212509 () Bool)

(assert (=> b!185034 m!212509))

(assert (=> b!185036 m!212507))

(assert (=> b!185036 m!212507))

(assert (=> b!185036 m!212509))

(assert (=> b!184858 d!55125))

(declare-fun d!55127 () Bool)

(assert (=> d!55127 (= (apply!163 (+!283 lt!91478 (tuple2!3377 lt!91471 (minValue!3609 thiss!1248))) lt!91483) (get!2136 (getValueByKey!221 (toList!1164 (+!283 lt!91478 (tuple2!3377 lt!91471 (minValue!3609 thiss!1248)))) lt!91483)))))

(declare-fun bs!7523 () Bool)

(assert (= bs!7523 d!55127))

(declare-fun m!212511 () Bool)

(assert (=> bs!7523 m!212511))

(assert (=> bs!7523 m!212511))

(declare-fun m!212513 () Bool)

(assert (=> bs!7523 m!212513))

(assert (=> b!184858 d!55127))

(assert (=> b!184858 d!55103))

(declare-fun d!55129 () Bool)

(assert (=> d!55129 (= (apply!163 (+!283 lt!91472 (tuple2!3377 lt!91479 (minValue!3609 thiss!1248))) lt!91481) (get!2136 (getValueByKey!221 (toList!1164 (+!283 lt!91472 (tuple2!3377 lt!91479 (minValue!3609 thiss!1248)))) lt!91481)))))

(declare-fun bs!7524 () Bool)

(assert (= bs!7524 d!55129))

(declare-fun m!212515 () Bool)

(assert (=> bs!7524 m!212515))

(assert (=> bs!7524 m!212515))

(declare-fun m!212517 () Bool)

(assert (=> bs!7524 m!212517))

(assert (=> b!184858 d!55129))

(declare-fun d!55131 () Bool)

(declare-fun e!121773 () Bool)

(assert (=> d!55131 e!121773))

(declare-fun res!87513 () Bool)

(assert (=> d!55131 (=> (not res!87513) (not e!121773))))

(declare-fun lt!91580 () ListLongMap!2297)

(assert (=> d!55131 (= res!87513 (contains!1268 lt!91580 (_1!1699 (tuple2!3377 lt!91485 (zeroValue!3609 thiss!1248)))))))

(declare-fun lt!91578 () List!2312)

(assert (=> d!55131 (= lt!91580 (ListLongMap!2298 lt!91578))))

(declare-fun lt!91579 () Unit!5576)

(declare-fun lt!91577 () Unit!5576)

(assert (=> d!55131 (= lt!91579 lt!91577)))

(assert (=> d!55131 (= (getValueByKey!221 lt!91578 (_1!1699 (tuple2!3377 lt!91485 (zeroValue!3609 thiss!1248)))) (Some!226 (_2!1699 (tuple2!3377 lt!91485 (zeroValue!3609 thiss!1248)))))))

(assert (=> d!55131 (= lt!91577 (lemmaContainsTupThenGetReturnValue!117 lt!91578 (_1!1699 (tuple2!3377 lt!91485 (zeroValue!3609 thiss!1248))) (_2!1699 (tuple2!3377 lt!91485 (zeroValue!3609 thiss!1248)))))))

(assert (=> d!55131 (= lt!91578 (insertStrictlySorted!120 (toList!1164 lt!91482) (_1!1699 (tuple2!3377 lt!91485 (zeroValue!3609 thiss!1248))) (_2!1699 (tuple2!3377 lt!91485 (zeroValue!3609 thiss!1248)))))))

(assert (=> d!55131 (= (+!283 lt!91482 (tuple2!3377 lt!91485 (zeroValue!3609 thiss!1248))) lt!91580)))

(declare-fun b!185037 () Bool)

(declare-fun res!87514 () Bool)

(assert (=> b!185037 (=> (not res!87514) (not e!121773))))

(assert (=> b!185037 (= res!87514 (= (getValueByKey!221 (toList!1164 lt!91580) (_1!1699 (tuple2!3377 lt!91485 (zeroValue!3609 thiss!1248)))) (Some!226 (_2!1699 (tuple2!3377 lt!91485 (zeroValue!3609 thiss!1248))))))))

(declare-fun b!185038 () Bool)

(assert (=> b!185038 (= e!121773 (contains!1271 (toList!1164 lt!91580) (tuple2!3377 lt!91485 (zeroValue!3609 thiss!1248))))))

(assert (= (and d!55131 res!87513) b!185037))

(assert (= (and b!185037 res!87514) b!185038))

(declare-fun m!212519 () Bool)

(assert (=> d!55131 m!212519))

(declare-fun m!212521 () Bool)

(assert (=> d!55131 m!212521))

(declare-fun m!212523 () Bool)

(assert (=> d!55131 m!212523))

(declare-fun m!212525 () Bool)

(assert (=> d!55131 m!212525))

(declare-fun m!212527 () Bool)

(assert (=> b!185037 m!212527))

(declare-fun m!212529 () Bool)

(assert (=> b!185038 m!212529))

(assert (=> b!184858 d!55131))

(declare-fun d!55133 () Bool)

(declare-fun e!121774 () Bool)

(assert (=> d!55133 e!121774))

(declare-fun res!87515 () Bool)

(assert (=> d!55133 (=> (not res!87515) (not e!121774))))

(declare-fun lt!91584 () ListLongMap!2297)

(assert (=> d!55133 (= res!87515 (contains!1268 lt!91584 (_1!1699 (tuple2!3377 lt!91474 (zeroValue!3609 thiss!1248)))))))

(declare-fun lt!91582 () List!2312)

(assert (=> d!55133 (= lt!91584 (ListLongMap!2298 lt!91582))))

(declare-fun lt!91583 () Unit!5576)

(declare-fun lt!91581 () Unit!5576)

(assert (=> d!55133 (= lt!91583 lt!91581)))

(assert (=> d!55133 (= (getValueByKey!221 lt!91582 (_1!1699 (tuple2!3377 lt!91474 (zeroValue!3609 thiss!1248)))) (Some!226 (_2!1699 (tuple2!3377 lt!91474 (zeroValue!3609 thiss!1248)))))))

(assert (=> d!55133 (= lt!91581 (lemmaContainsTupThenGetReturnValue!117 lt!91582 (_1!1699 (tuple2!3377 lt!91474 (zeroValue!3609 thiss!1248))) (_2!1699 (tuple2!3377 lt!91474 (zeroValue!3609 thiss!1248)))))))

(assert (=> d!55133 (= lt!91582 (insertStrictlySorted!120 (toList!1164 lt!91470) (_1!1699 (tuple2!3377 lt!91474 (zeroValue!3609 thiss!1248))) (_2!1699 (tuple2!3377 lt!91474 (zeroValue!3609 thiss!1248)))))))

(assert (=> d!55133 (= (+!283 lt!91470 (tuple2!3377 lt!91474 (zeroValue!3609 thiss!1248))) lt!91584)))

(declare-fun b!185039 () Bool)

(declare-fun res!87516 () Bool)

(assert (=> b!185039 (=> (not res!87516) (not e!121774))))

(assert (=> b!185039 (= res!87516 (= (getValueByKey!221 (toList!1164 lt!91584) (_1!1699 (tuple2!3377 lt!91474 (zeroValue!3609 thiss!1248)))) (Some!226 (_2!1699 (tuple2!3377 lt!91474 (zeroValue!3609 thiss!1248))))))))

(declare-fun b!185040 () Bool)

(assert (=> b!185040 (= e!121774 (contains!1271 (toList!1164 lt!91584) (tuple2!3377 lt!91474 (zeroValue!3609 thiss!1248))))))

(assert (= (and d!55133 res!87515) b!185039))

(assert (= (and b!185039 res!87516) b!185040))

(declare-fun m!212531 () Bool)

(assert (=> d!55133 m!212531))

(declare-fun m!212533 () Bool)

(assert (=> d!55133 m!212533))

(declare-fun m!212535 () Bool)

(assert (=> d!55133 m!212535))

(declare-fun m!212537 () Bool)

(assert (=> d!55133 m!212537))

(declare-fun m!212539 () Bool)

(assert (=> b!185039 m!212539))

(declare-fun m!212541 () Bool)

(assert (=> b!185040 m!212541))

(assert (=> b!184858 d!55133))

(declare-fun d!55135 () Bool)

(assert (=> d!55135 (= (apply!163 (+!283 lt!91470 (tuple2!3377 lt!91474 (zeroValue!3609 thiss!1248))) lt!91466) (get!2136 (getValueByKey!221 (toList!1164 (+!283 lt!91470 (tuple2!3377 lt!91474 (zeroValue!3609 thiss!1248)))) lt!91466)))))

(declare-fun bs!7525 () Bool)

(assert (= bs!7525 d!55135))

(declare-fun m!212543 () Bool)

(assert (=> bs!7525 m!212543))

(assert (=> bs!7525 m!212543))

(declare-fun m!212545 () Bool)

(assert (=> bs!7525 m!212545))

(assert (=> b!184858 d!55135))

(declare-fun d!55137 () Bool)

(assert (=> d!55137 (= (apply!163 lt!91472 lt!91481) (get!2136 (getValueByKey!221 (toList!1164 lt!91472) lt!91481)))))

(declare-fun bs!7526 () Bool)

(assert (= bs!7526 d!55137))

(declare-fun m!212547 () Bool)

(assert (=> bs!7526 m!212547))

(assert (=> bs!7526 m!212547))

(declare-fun m!212549 () Bool)

(assert (=> bs!7526 m!212549))

(assert (=> b!184858 d!55137))

(declare-fun d!55139 () Bool)

(assert (=> d!55139 (= (apply!163 lt!91478 lt!91483) (get!2136 (getValueByKey!221 (toList!1164 lt!91478) lt!91483)))))

(declare-fun bs!7527 () Bool)

(assert (= bs!7527 d!55139))

(declare-fun m!212551 () Bool)

(assert (=> bs!7527 m!212551))

(assert (=> bs!7527 m!212551))

(declare-fun m!212553 () Bool)

(assert (=> bs!7527 m!212553))

(assert (=> b!184858 d!55139))

(declare-fun d!55141 () Bool)

(declare-fun e!121775 () Bool)

(assert (=> d!55141 e!121775))

(declare-fun res!87517 () Bool)

(assert (=> d!55141 (=> res!87517 e!121775)))

(declare-fun lt!91585 () Bool)

(assert (=> d!55141 (= res!87517 (not lt!91585))))

(declare-fun lt!91588 () Bool)

(assert (=> d!55141 (= lt!91585 lt!91588)))

(declare-fun lt!91587 () Unit!5576)

(declare-fun e!121776 () Unit!5576)

(assert (=> d!55141 (= lt!91587 e!121776)))

(declare-fun c!33223 () Bool)

(assert (=> d!55141 (= c!33223 lt!91588)))

(assert (=> d!55141 (= lt!91588 (containsKey!224 (toList!1164 lt!91473) (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55141 (= (contains!1268 lt!91473 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000)) lt!91585)))

(declare-fun b!185041 () Bool)

(declare-fun lt!91586 () Unit!5576)

(assert (=> b!185041 (= e!121776 lt!91586)))

(assert (=> b!185041 (= lt!91586 (lemmaContainsKeyImpliesGetValueByKeyDefined!172 (toList!1164 lt!91473) (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!185041 (isDefined!173 (getValueByKey!221 (toList!1164 lt!91473) (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185042 () Bool)

(declare-fun Unit!5582 () Unit!5576)

(assert (=> b!185042 (= e!121776 Unit!5582)))

(declare-fun b!185043 () Bool)

(assert (=> b!185043 (= e!121775 (isDefined!173 (getValueByKey!221 (toList!1164 lt!91473) (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55141 c!33223) b!185041))

(assert (= (and d!55141 (not c!33223)) b!185042))

(assert (= (and d!55141 (not res!87517)) b!185043))

(assert (=> d!55141 m!212303))

(declare-fun m!212555 () Bool)

(assert (=> d!55141 m!212555))

(assert (=> b!185041 m!212303))

(declare-fun m!212557 () Bool)

(assert (=> b!185041 m!212557))

(assert (=> b!185041 m!212303))

(assert (=> b!185041 m!212361))

(assert (=> b!185041 m!212361))

(declare-fun m!212559 () Bool)

(assert (=> b!185041 m!212559))

(assert (=> b!185043 m!212303))

(assert (=> b!185043 m!212361))

(assert (=> b!185043 m!212361))

(assert (=> b!185043 m!212559))

(assert (=> b!184863 d!55141))

(declare-fun d!55143 () Bool)

(assert (=> d!55143 (= (apply!163 lt!91473 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2136 (getValueByKey!221 (toList!1164 lt!91473) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7528 () Bool)

(assert (= bs!7528 d!55143))

(assert (=> bs!7528 m!212381))

(assert (=> bs!7528 m!212381))

(declare-fun m!212561 () Bool)

(assert (=> bs!7528 m!212561))

(assert (=> b!184846 d!55143))

(declare-fun d!55145 () Bool)

(declare-fun res!87528 () Bool)

(declare-fun e!121779 () Bool)

(assert (=> d!55145 (=> (not res!87528) (not e!121779))))

(assert (=> d!55145 (= res!87528 (validMask!0 (mask!8858 thiss!1248)))))

(assert (=> d!55145 (= (simpleValid!179 thiss!1248) e!121779)))

(declare-fun b!185055 () Bool)

(assert (=> b!185055 (= e!121779 (and (bvsge (extraKeys!3505 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3505 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1320 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!185052 () Bool)

(declare-fun res!87527 () Bool)

(assert (=> b!185052 (=> (not res!87527) (not e!121779))))

(assert (=> b!185052 (= res!87527 (and (= (size!4014 (_values!3751 thiss!1248)) (bvadd (mask!8858 thiss!1248) #b00000000000000000000000000000001)) (= (size!4013 (_keys!5699 thiss!1248)) (size!4014 (_values!3751 thiss!1248))) (bvsge (_size!1320 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1320 thiss!1248) (bvadd (mask!8858 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!185054 () Bool)

(declare-fun res!87526 () Bool)

(assert (=> b!185054 (=> (not res!87526) (not e!121779))))

(declare-fun size!4019 (LongMapFixedSize!2542) (_ BitVec 32))

(assert (=> b!185054 (= res!87526 (= (size!4019 thiss!1248) (bvadd (_size!1320 thiss!1248) (bvsdiv (bvadd (extraKeys!3505 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!185053 () Bool)

(declare-fun res!87529 () Bool)

(assert (=> b!185053 (=> (not res!87529) (not e!121779))))

(assert (=> b!185053 (= res!87529 (bvsge (size!4019 thiss!1248) (_size!1320 thiss!1248)))))

(assert (= (and d!55145 res!87528) b!185052))

(assert (= (and b!185052 res!87527) b!185053))

(assert (= (and b!185053 res!87529) b!185054))

(assert (= (and b!185054 res!87526) b!185055))

(assert (=> d!55145 m!212223))

(declare-fun m!212563 () Bool)

(assert (=> b!185054 m!212563))

(assert (=> b!185053 m!212563))

(assert (=> d!55071 d!55145))

(declare-fun d!55147 () Bool)

(declare-fun e!121780 () Bool)

(assert (=> d!55147 e!121780))

(declare-fun res!87530 () Bool)

(assert (=> d!55147 (=> res!87530 e!121780)))

(declare-fun lt!91589 () Bool)

(assert (=> d!55147 (= res!87530 (not lt!91589))))

(declare-fun lt!91592 () Bool)

(assert (=> d!55147 (= lt!91589 lt!91592)))

(declare-fun lt!91591 () Unit!5576)

(declare-fun e!121781 () Unit!5576)

(assert (=> d!55147 (= lt!91591 e!121781)))

(declare-fun c!33224 () Bool)

(assert (=> d!55147 (= c!33224 lt!91592)))

(assert (=> d!55147 (= lt!91592 (containsKey!224 (toList!1164 lt!91473) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55147 (= (contains!1268 lt!91473 #b1000000000000000000000000000000000000000000000000000000000000000) lt!91589)))

(declare-fun b!185056 () Bool)

(declare-fun lt!91590 () Unit!5576)

(assert (=> b!185056 (= e!121781 lt!91590)))

(assert (=> b!185056 (= lt!91590 (lemmaContainsKeyImpliesGetValueByKeyDefined!172 (toList!1164 lt!91473) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!185056 (isDefined!173 (getValueByKey!221 (toList!1164 lt!91473) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!185057 () Bool)

(declare-fun Unit!5583 () Unit!5576)

(assert (=> b!185057 (= e!121781 Unit!5583)))

(declare-fun b!185058 () Bool)

(assert (=> b!185058 (= e!121780 (isDefined!173 (getValueByKey!221 (toList!1164 lt!91473) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55147 c!33224) b!185056))

(assert (= (and d!55147 (not c!33224)) b!185057))

(assert (= (and d!55147 (not res!87530)) b!185058))

(declare-fun m!212565 () Bool)

(assert (=> d!55147 m!212565))

(declare-fun m!212567 () Bool)

(assert (=> b!185056 m!212567))

(assert (=> b!185056 m!212409))

(assert (=> b!185056 m!212409))

(declare-fun m!212569 () Bool)

(assert (=> b!185056 m!212569))

(assert (=> b!185058 m!212409))

(assert (=> b!185058 m!212409))

(assert (=> b!185058 m!212569))

(assert (=> bm!18629 d!55147))

(declare-fun d!55149 () Bool)

(declare-fun lt!91595 () (_ BitVec 32))

(assert (=> d!55149 (and (bvsge lt!91595 #b00000000000000000000000000000000) (bvsle lt!91595 (bvsub (size!4013 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!121787 () (_ BitVec 32))

(assert (=> d!55149 (= lt!91595 e!121787)))

(declare-fun c!33230 () Bool)

(assert (=> d!55149 (= c!33230 (bvsge #b00000000000000000000000000000000 (size!4013 (_keys!5699 thiss!1248))))))

(assert (=> d!55149 (and (bvsle #b00000000000000000000000000000000 (size!4013 (_keys!5699 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4013 (_keys!5699 thiss!1248)) (size!4013 (_keys!5699 thiss!1248))))))

(assert (=> d!55149 (= (arrayCountValidKeys!0 (_keys!5699 thiss!1248) #b00000000000000000000000000000000 (size!4013 (_keys!5699 thiss!1248))) lt!91595)))

(declare-fun bm!18646 () Bool)

(declare-fun call!18649 () (_ BitVec 32))

(assert (=> bm!18646 (= call!18649 (arrayCountValidKeys!0 (_keys!5699 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4013 (_keys!5699 thiss!1248))))))

(declare-fun b!185067 () Bool)

(declare-fun e!121786 () (_ BitVec 32))

(assert (=> b!185067 (= e!121787 e!121786)))

(declare-fun c!33229 () Bool)

(assert (=> b!185067 (= c!33229 (validKeyInArray!0 (select (arr!3698 (_keys!5699 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185068 () Bool)

(assert (=> b!185068 (= e!121786 (bvadd #b00000000000000000000000000000001 call!18649))))

(declare-fun b!185069 () Bool)

(assert (=> b!185069 (= e!121787 #b00000000000000000000000000000000)))

(declare-fun b!185070 () Bool)

(assert (=> b!185070 (= e!121786 call!18649)))

(assert (= (and d!55149 c!33230) b!185069))

(assert (= (and d!55149 (not c!33230)) b!185067))

(assert (= (and b!185067 c!33229) b!185068))

(assert (= (and b!185067 (not c!33229)) b!185070))

(assert (= (or b!185068 b!185070) bm!18646))

(declare-fun m!212571 () Bool)

(assert (=> bm!18646 m!212571))

(assert (=> b!185067 m!212303))

(assert (=> b!185067 m!212303))

(assert (=> b!185067 m!212311))

(assert (=> b!184792 d!55149))

(assert (=> b!184848 d!55109))

(declare-fun mapNonEmpty!7440 () Bool)

(declare-fun mapRes!7440 () Bool)

(declare-fun tp!16449 () Bool)

(declare-fun e!121788 () Bool)

(assert (=> mapNonEmpty!7440 (= mapRes!7440 (and tp!16449 e!121788))))

(declare-fun mapRest!7440 () (Array (_ BitVec 32) ValueCell!1817))

(declare-fun mapValue!7440 () ValueCell!1817)

(declare-fun mapKey!7440 () (_ BitVec 32))

(assert (=> mapNonEmpty!7440 (= mapRest!7439 (store mapRest!7440 mapKey!7440 mapValue!7440))))

(declare-fun mapIsEmpty!7440 () Bool)

(assert (=> mapIsEmpty!7440 mapRes!7440))

(declare-fun b!185072 () Bool)

(declare-fun e!121789 () Bool)

(assert (=> b!185072 (= e!121789 tp_is_empty!4321)))

(declare-fun b!185071 () Bool)

(assert (=> b!185071 (= e!121788 tp_is_empty!4321)))

(declare-fun condMapEmpty!7440 () Bool)

(declare-fun mapDefault!7440 () ValueCell!1817)

(assert (=> mapNonEmpty!7439 (= condMapEmpty!7440 (= mapRest!7439 ((as const (Array (_ BitVec 32) ValueCell!1817)) mapDefault!7440)))))

(assert (=> mapNonEmpty!7439 (= tp!16448 (and e!121789 mapRes!7440))))

(assert (= (and mapNonEmpty!7439 condMapEmpty!7440) mapIsEmpty!7440))

(assert (= (and mapNonEmpty!7439 (not condMapEmpty!7440)) mapNonEmpty!7440))

(assert (= (and mapNonEmpty!7440 ((_ is ValueCellFull!1817) mapValue!7440)) b!185071))

(assert (= (and mapNonEmpty!7439 ((_ is ValueCellFull!1817) mapDefault!7440)) b!185072))

(declare-fun m!212573 () Bool)

(assert (=> mapNonEmpty!7440 m!212573))

(declare-fun b_lambda!7261 () Bool)

(assert (= b_lambda!7259 (or (and b!184710 b_free!4549) b_lambda!7261)))

(declare-fun b_lambda!7263 () Bool)

(assert (= b_lambda!7257 (or (and b!184710 b_free!4549) b_lambda!7263)))

(check-sat (not b!184893) (not d!55133) (not d!55127) (not b!184963) (not b!184921) (not d!55105) (not d!55125) (not d!55139) (not b!185031) (not b!185019) (not b!185034) (not d!55093) (not b!184894) (not d!55119) (not mapNonEmpty!7440) (not d!55077) (not b_next!4549) (not b_lambda!7261) (not b!184960) (not d!55137) (not b!185033) (not d!55117) (not d!55103) (not d!55129) (not d!55097) (not d!55115) (not b!184969) (not d!55113) (not b!184907) (not b!185041) (not d!55145) (not d!55111) (not b!185004) (not bm!18643) b_and!11163 (not b!185056) (not d!55147) (not bm!18637) (not b!184946) (not b!185006) (not d!55087) (not b!185067) (not d!55123) (not b!185039) (not b_lambda!7263) (not b!185043) (not b_lambda!7255) (not b!185001) (not d!55143) (not b!184994) (not d!55089) (not d!55131) tp_is_empty!4321 (not b!185038) (not b!185054) (not b!185036) (not b!184920) (not b!185007) (not b!184999) (not d!55085) (not b!185000) (not b!184924) (not b!185037) (not b!184995) (not b!184915) (not d!55135) (not b!184913) (not d!55081) (not b!185040) (not d!55121) (not bm!18646) (not b!185030) (not b!184887) (not bm!18640) (not b!185058) (not b!185022) (not b!185005) (not d!55091) (not b!184998) (not b!185032) (not b!185020) (not d!55141) (not b!185053))
(check-sat b_and!11163 (not b_next!4549))
