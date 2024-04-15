; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23452 () Bool)

(assert start!23452)

(declare-fun b!246127 () Bool)

(declare-fun b_free!6565 () Bool)

(declare-fun b_next!6565 () Bool)

(assert (=> b!246127 (= b_free!6565 (not b_next!6565))))

(declare-fun tp!22934 () Bool)

(declare-fun b_and!13535 () Bool)

(assert (=> b!246127 (= tp!22934 b_and!13535)))

(declare-fun b!246119 () Bool)

(declare-fun e!159656 () Bool)

(declare-fun e!159667 () Bool)

(assert (=> b!246119 (= e!159656 e!159667)))

(declare-fun res!120666 () Bool)

(declare-fun call!22990 () Bool)

(assert (=> b!246119 (= res!120666 call!22990)))

(assert (=> b!246119 (=> (not res!120666) (not e!159667))))

(declare-datatypes ((V!8217 0))(
  ( (V!8218 (val!3258 Int)) )
))
(declare-datatypes ((ValueCell!2870 0))(
  ( (ValueCellFull!2870 (v!5307 V!8217)) (EmptyCell!2870) )
))
(declare-datatypes ((array!12147 0))(
  ( (array!12148 (arr!5763 (Array (_ BitVec 32) ValueCell!2870)) (size!6107 (_ BitVec 32))) )
))
(declare-datatypes ((array!12149 0))(
  ( (array!12150 (arr!5764 (Array (_ BitVec 32) (_ BitVec 64))) (size!6108 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3640 0))(
  ( (LongMapFixedSize!3641 (defaultEntry!4557 Int) (mask!10679 (_ BitVec 32)) (extraKeys!4294 (_ BitVec 32)) (zeroValue!4398 V!8217) (minValue!4398 V!8217) (_size!1869 (_ BitVec 32)) (_keys!6675 array!12149) (_values!4540 array!12147) (_vacant!1869 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3640)

(declare-fun bm!22987 () Bool)

(declare-fun c!41151 () Bool)

(declare-datatypes ((SeekEntryResult!1091 0))(
  ( (MissingZero!1091 (index!6534 (_ BitVec 32))) (Found!1091 (index!6535 (_ BitVec 32))) (Intermediate!1091 (undefined!1903 Bool) (index!6536 (_ BitVec 32)) (x!24464 (_ BitVec 32))) (Undefined!1091) (MissingVacant!1091 (index!6537 (_ BitVec 32))) )
))
(declare-fun lt!123161 () SeekEntryResult!1091)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22987 (= call!22990 (inRange!0 (ite c!41151 (index!6534 lt!123161) (index!6537 lt!123161)) (mask!10679 thiss!1504)))))

(declare-fun b!246120 () Bool)

(declare-datatypes ((Unit!7595 0))(
  ( (Unit!7596) )
))
(declare-fun e!159653 () Unit!7595)

(declare-fun Unit!7597 () Unit!7595)

(assert (=> b!246120 (= e!159653 Unit!7597)))

(declare-fun b!246121 () Bool)

(declare-fun e!159654 () Bool)

(declare-fun e!159664 () Bool)

(assert (=> b!246121 (= e!159654 e!159664)))

(declare-fun res!120664 () Bool)

(assert (=> b!246121 (=> (not res!120664) (not e!159664))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!246121 (= res!120664 (or (= lt!123161 (MissingZero!1091 index!297)) (= lt!123161 (MissingVacant!1091 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12149 (_ BitVec 32)) SeekEntryResult!1091)

(assert (=> b!246121 (= lt!123161 (seekEntryOrOpen!0 key!932 (_keys!6675 thiss!1504) (mask!10679 thiss!1504)))))

(declare-fun b!246122 () Bool)

(declare-fun e!159665 () Bool)

(declare-fun e!159657 () Bool)

(declare-fun mapRes!10907 () Bool)

(assert (=> b!246122 (= e!159665 (and e!159657 mapRes!10907))))

(declare-fun condMapEmpty!10907 () Bool)

(declare-fun mapDefault!10907 () ValueCell!2870)

(assert (=> b!246122 (= condMapEmpty!10907 (= (arr!5763 (_values!4540 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2870)) mapDefault!10907)))))

(declare-fun b!246123 () Bool)

(declare-fun res!120665 () Bool)

(declare-fun e!159663 () Bool)

(assert (=> b!246123 (=> (not res!120665) (not e!159663))))

(assert (=> b!246123 (= res!120665 call!22990)))

(declare-fun e!159660 () Bool)

(assert (=> b!246123 (= e!159660 e!159663)))

(declare-fun b!246124 () Bool)

(declare-fun res!120667 () Bool)

(assert (=> b!246124 (=> (not res!120667) (not e!159654))))

(assert (=> b!246124 (= res!120667 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!246125 () Bool)

(declare-fun e!159666 () Bool)

(assert (=> b!246125 (= e!159666 (or (not (= (size!6108 (_keys!6675 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10679 thiss!1504)))) (bvsge index!297 #b00000000000000000000000000000000)))))

(declare-fun b!246126 () Bool)

(declare-fun e!159661 () Bool)

(assert (=> b!246126 (= e!159664 e!159661)))

(declare-fun res!120671 () Bool)

(assert (=> b!246126 (=> (not res!120671) (not e!159661))))

(assert (=> b!246126 (= res!120671 (inRange!0 index!297 (mask!10679 thiss!1504)))))

(declare-fun lt!123166 () Unit!7595)

(declare-fun e!159659 () Unit!7595)

(assert (=> b!246126 (= lt!123166 e!159659)))

(declare-fun c!41150 () Bool)

(declare-datatypes ((tuple2!4764 0))(
  ( (tuple2!4765 (_1!2393 (_ BitVec 64)) (_2!2393 V!8217)) )
))
(declare-datatypes ((List!3667 0))(
  ( (Nil!3664) (Cons!3663 (h!4321 tuple2!4764) (t!8675 List!3667)) )
))
(declare-datatypes ((ListLongMap!3667 0))(
  ( (ListLongMap!3668 (toList!1849 List!3667)) )
))
(declare-fun contains!1765 (ListLongMap!3667 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1358 (array!12149 array!12147 (_ BitVec 32) (_ BitVec 32) V!8217 V!8217 (_ BitVec 32) Int) ListLongMap!3667)

(assert (=> b!246126 (= c!41150 (contains!1765 (getCurrentListMap!1358 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)) key!932))))

(declare-fun tp_is_empty!6427 () Bool)

(declare-fun e!159662 () Bool)

(declare-fun array_inv!3801 (array!12149) Bool)

(declare-fun array_inv!3802 (array!12147) Bool)

(assert (=> b!246127 (= e!159662 (and tp!22934 tp_is_empty!6427 (array_inv!3801 (_keys!6675 thiss!1504)) (array_inv!3802 (_values!4540 thiss!1504)) e!159665))))

(declare-fun b!246128 () Bool)

(assert (=> b!246128 (= e!159661 (not e!159666))))

(declare-fun res!120663 () Bool)

(assert (=> b!246128 (=> res!120663 e!159666)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!246128 (= res!120663 (not (validMask!0 (mask!10679 thiss!1504))))))

(declare-fun lt!123162 () array!12149)

(declare-fun arrayCountValidKeys!0 (array!12149 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!246128 (= (arrayCountValidKeys!0 lt!123162 #b00000000000000000000000000000000 (size!6108 (_keys!6675 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6675 thiss!1504) #b00000000000000000000000000000000 (size!6108 (_keys!6675 thiss!1504)))))))

(declare-fun lt!123163 () Unit!7595)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12149 (_ BitVec 32) (_ BitVec 64)) Unit!7595)

(assert (=> b!246128 (= lt!123163 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6675 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3668 0))(
  ( (Nil!3665) (Cons!3664 (h!4322 (_ BitVec 64)) (t!8676 List!3668)) )
))
(declare-fun arrayNoDuplicates!0 (array!12149 (_ BitVec 32) List!3668) Bool)

(assert (=> b!246128 (arrayNoDuplicates!0 lt!123162 #b00000000000000000000000000000000 Nil!3665)))

(assert (=> b!246128 (= lt!123162 (array!12150 (store (arr!5764 (_keys!6675 thiss!1504)) index!297 key!932) (size!6108 (_keys!6675 thiss!1504))))))

(declare-fun lt!123164 () Unit!7595)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12149 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3668) Unit!7595)

(assert (=> b!246128 (= lt!123164 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6675 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3665))))

(declare-fun lt!123167 () Unit!7595)

(assert (=> b!246128 (= lt!123167 e!159653)))

(declare-fun c!41148 () Bool)

(declare-fun arrayContainsKey!0 (array!12149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!246128 (= c!41148 (arrayContainsKey!0 (_keys!6675 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10907 () Bool)

(assert (=> mapIsEmpty!10907 mapRes!10907))

(declare-fun b!246129 () Bool)

(declare-fun Unit!7598 () Unit!7595)

(assert (=> b!246129 (= e!159653 Unit!7598)))

(declare-fun lt!123165 () Unit!7595)

(declare-fun lemmaArrayContainsKeyThenInListMap!189 (array!12149 array!12147 (_ BitVec 32) (_ BitVec 32) V!8217 V!8217 (_ BitVec 64) (_ BitVec 32) Int) Unit!7595)

(assert (=> b!246129 (= lt!123165 (lemmaArrayContainsKeyThenInListMap!189 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)))))

(assert (=> b!246129 false))

(declare-fun b!246130 () Bool)

(assert (=> b!246130 (= e!159657 tp_is_empty!6427)))

(declare-fun b!246131 () Bool)

(declare-fun call!22991 () Bool)

(assert (=> b!246131 (= e!159667 (not call!22991))))

(declare-fun b!246132 () Bool)

(declare-fun res!120668 () Bool)

(assert (=> b!246132 (= res!120668 (= (select (arr!5764 (_keys!6675 thiss!1504)) (index!6537 lt!123161)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246132 (=> (not res!120668) (not e!159667))))

(declare-fun b!246133 () Bool)

(declare-fun lt!123159 () Unit!7595)

(assert (=> b!246133 (= e!159659 lt!123159)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!377 (array!12149 array!12147 (_ BitVec 32) (_ BitVec 32) V!8217 V!8217 (_ BitVec 64) Int) Unit!7595)

(assert (=> b!246133 (= lt!123159 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!377 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) key!932 (defaultEntry!4557 thiss!1504)))))

(get-info :version)

(assert (=> b!246133 (= c!41151 ((_ is MissingZero!1091) lt!123161))))

(assert (=> b!246133 e!159660))

(declare-fun b!246134 () Bool)

(declare-fun c!41149 () Bool)

(assert (=> b!246134 (= c!41149 ((_ is MissingVacant!1091) lt!123161))))

(assert (=> b!246134 (= e!159660 e!159656)))

(declare-fun b!246135 () Bool)

(declare-fun Unit!7599 () Unit!7595)

(assert (=> b!246135 (= e!159659 Unit!7599)))

(declare-fun lt!123160 () Unit!7595)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!380 (array!12149 array!12147 (_ BitVec 32) (_ BitVec 32) V!8217 V!8217 (_ BitVec 64) Int) Unit!7595)

(assert (=> b!246135 (= lt!123160 (lemmaInListMapThenSeekEntryOrOpenFindsIt!380 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) key!932 (defaultEntry!4557 thiss!1504)))))

(assert (=> b!246135 false))

(declare-fun bm!22988 () Bool)

(assert (=> bm!22988 (= call!22991 (arrayContainsKey!0 (_keys!6675 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!246136 () Bool)

(declare-fun e!159658 () Bool)

(assert (=> b!246136 (= e!159658 tp_is_empty!6427)))

(declare-fun b!246137 () Bool)

(assert (=> b!246137 (= e!159663 (not call!22991))))

(declare-fun res!120669 () Bool)

(assert (=> start!23452 (=> (not res!120669) (not e!159654))))

(declare-fun valid!1434 (LongMapFixedSize!3640) Bool)

(assert (=> start!23452 (= res!120669 (valid!1434 thiss!1504))))

(assert (=> start!23452 e!159654))

(assert (=> start!23452 e!159662))

(assert (=> start!23452 true))

(declare-fun mapNonEmpty!10907 () Bool)

(declare-fun tp!22933 () Bool)

(assert (=> mapNonEmpty!10907 (= mapRes!10907 (and tp!22933 e!159658))))

(declare-fun mapRest!10907 () (Array (_ BitVec 32) ValueCell!2870))

(declare-fun mapKey!10907 () (_ BitVec 32))

(declare-fun mapValue!10907 () ValueCell!2870)

(assert (=> mapNonEmpty!10907 (= (arr!5763 (_values!4540 thiss!1504)) (store mapRest!10907 mapKey!10907 mapValue!10907))))

(declare-fun b!246138 () Bool)

(declare-fun res!120670 () Bool)

(assert (=> b!246138 (=> (not res!120670) (not e!159663))))

(assert (=> b!246138 (= res!120670 (= (select (arr!5764 (_keys!6675 thiss!1504)) (index!6534 lt!123161)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246139 () Bool)

(assert (=> b!246139 (= e!159656 ((_ is Undefined!1091) lt!123161))))

(assert (= (and start!23452 res!120669) b!246124))

(assert (= (and b!246124 res!120667) b!246121))

(assert (= (and b!246121 res!120664) b!246126))

(assert (= (and b!246126 c!41150) b!246135))

(assert (= (and b!246126 (not c!41150)) b!246133))

(assert (= (and b!246133 c!41151) b!246123))

(assert (= (and b!246133 (not c!41151)) b!246134))

(assert (= (and b!246123 res!120665) b!246138))

(assert (= (and b!246138 res!120670) b!246137))

(assert (= (and b!246134 c!41149) b!246119))

(assert (= (and b!246134 (not c!41149)) b!246139))

(assert (= (and b!246119 res!120666) b!246132))

(assert (= (and b!246132 res!120668) b!246131))

(assert (= (or b!246123 b!246119) bm!22987))

(assert (= (or b!246137 b!246131) bm!22988))

(assert (= (and b!246126 res!120671) b!246128))

(assert (= (and b!246128 c!41148) b!246129))

(assert (= (and b!246128 (not c!41148)) b!246120))

(assert (= (and b!246128 (not res!120663)) b!246125))

(assert (= (and b!246122 condMapEmpty!10907) mapIsEmpty!10907))

(assert (= (and b!246122 (not condMapEmpty!10907)) mapNonEmpty!10907))

(assert (= (and mapNonEmpty!10907 ((_ is ValueCellFull!2870) mapValue!10907)) b!246136))

(assert (= (and b!246122 ((_ is ValueCellFull!2870) mapDefault!10907)) b!246130))

(assert (= b!246127 b!246122))

(assert (= start!23452 b!246127))

(declare-fun m!263081 () Bool)

(assert (=> start!23452 m!263081))

(declare-fun m!263083 () Bool)

(assert (=> bm!22987 m!263083))

(declare-fun m!263085 () Bool)

(assert (=> mapNonEmpty!10907 m!263085))

(declare-fun m!263087 () Bool)

(assert (=> b!246121 m!263087))

(declare-fun m!263089 () Bool)

(assert (=> b!246132 m!263089))

(declare-fun m!263091 () Bool)

(assert (=> b!246129 m!263091))

(declare-fun m!263093 () Bool)

(assert (=> bm!22988 m!263093))

(declare-fun m!263095 () Bool)

(assert (=> b!246138 m!263095))

(declare-fun m!263097 () Bool)

(assert (=> b!246128 m!263097))

(assert (=> b!246128 m!263093))

(declare-fun m!263099 () Bool)

(assert (=> b!246128 m!263099))

(declare-fun m!263101 () Bool)

(assert (=> b!246128 m!263101))

(declare-fun m!263103 () Bool)

(assert (=> b!246128 m!263103))

(declare-fun m!263105 () Bool)

(assert (=> b!246128 m!263105))

(declare-fun m!263107 () Bool)

(assert (=> b!246128 m!263107))

(declare-fun m!263109 () Bool)

(assert (=> b!246128 m!263109))

(declare-fun m!263111 () Bool)

(assert (=> b!246127 m!263111))

(declare-fun m!263113 () Bool)

(assert (=> b!246127 m!263113))

(declare-fun m!263115 () Bool)

(assert (=> b!246126 m!263115))

(declare-fun m!263117 () Bool)

(assert (=> b!246126 m!263117))

(assert (=> b!246126 m!263117))

(declare-fun m!263119 () Bool)

(assert (=> b!246126 m!263119))

(declare-fun m!263121 () Bool)

(assert (=> b!246135 m!263121))

(declare-fun m!263123 () Bool)

(assert (=> b!246133 m!263123))

(check-sat (not b!246121) (not bm!22987) (not start!23452) (not b!246127) (not b!246129) (not b!246133) (not mapNonEmpty!10907) (not b!246135) (not b_next!6565) tp_is_empty!6427 (not b!246128) (not b!246126) b_and!13535 (not bm!22988))
(check-sat b_and!13535 (not b_next!6565))
(get-model)

(declare-fun d!60215 () Bool)

(declare-fun res!120730 () Bool)

(declare-fun e!159762 () Bool)

(assert (=> d!60215 (=> res!120730 e!159762)))

(assert (=> d!60215 (= res!120730 (= (select (arr!5764 (_keys!6675 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60215 (= (arrayContainsKey!0 (_keys!6675 thiss!1504) key!932 #b00000000000000000000000000000000) e!159762)))

(declare-fun b!246270 () Bool)

(declare-fun e!159763 () Bool)

(assert (=> b!246270 (= e!159762 e!159763)))

(declare-fun res!120731 () Bool)

(assert (=> b!246270 (=> (not res!120731) (not e!159763))))

(assert (=> b!246270 (= res!120731 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6108 (_keys!6675 thiss!1504))))))

(declare-fun b!246271 () Bool)

(assert (=> b!246271 (= e!159763 (arrayContainsKey!0 (_keys!6675 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60215 (not res!120730)) b!246270))

(assert (= (and b!246270 res!120731) b!246271))

(declare-fun m!263213 () Bool)

(assert (=> d!60215 m!263213))

(declare-fun m!263215 () Bool)

(assert (=> b!246271 m!263215))

(assert (=> bm!22988 d!60215))

(declare-fun d!60217 () Bool)

(assert (=> d!60217 (= (array_inv!3801 (_keys!6675 thiss!1504)) (bvsge (size!6108 (_keys!6675 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246127 d!60217))

(declare-fun d!60219 () Bool)

(assert (=> d!60219 (= (array_inv!3802 (_values!4540 thiss!1504)) (bvsge (size!6107 (_values!4540 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246127 d!60219))

(declare-fun d!60221 () Bool)

(assert (=> d!60221 (= (inRange!0 index!297 (mask!10679 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10679 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!246126 d!60221))

(declare-fun d!60223 () Bool)

(declare-fun e!159769 () Bool)

(assert (=> d!60223 e!159769))

(declare-fun res!120734 () Bool)

(assert (=> d!60223 (=> res!120734 e!159769)))

(declare-fun lt!123230 () Bool)

(assert (=> d!60223 (= res!120734 (not lt!123230))))

(declare-fun lt!123233 () Bool)

(assert (=> d!60223 (= lt!123230 lt!123233)))

(declare-fun lt!123232 () Unit!7595)

(declare-fun e!159768 () Unit!7595)

(assert (=> d!60223 (= lt!123232 e!159768)))

(declare-fun c!41178 () Bool)

(assert (=> d!60223 (= c!41178 lt!123233)))

(declare-fun containsKey!280 (List!3667 (_ BitVec 64)) Bool)

(assert (=> d!60223 (= lt!123233 (containsKey!280 (toList!1849 (getCurrentListMap!1358 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504))) key!932))))

(assert (=> d!60223 (= (contains!1765 (getCurrentListMap!1358 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)) key!932) lt!123230)))

(declare-fun b!246278 () Bool)

(declare-fun lt!123231 () Unit!7595)

(assert (=> b!246278 (= e!159768 lt!123231)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!229 (List!3667 (_ BitVec 64)) Unit!7595)

(assert (=> b!246278 (= lt!123231 (lemmaContainsKeyImpliesGetValueByKeyDefined!229 (toList!1849 (getCurrentListMap!1358 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504))) key!932))))

(declare-datatypes ((Option!294 0))(
  ( (Some!293 (v!5310 V!8217)) (None!292) )
))
(declare-fun isDefined!230 (Option!294) Bool)

(declare-fun getValueByKey!288 (List!3667 (_ BitVec 64)) Option!294)

(assert (=> b!246278 (isDefined!230 (getValueByKey!288 (toList!1849 (getCurrentListMap!1358 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504))) key!932))))

(declare-fun b!246279 () Bool)

(declare-fun Unit!7604 () Unit!7595)

(assert (=> b!246279 (= e!159768 Unit!7604)))

(declare-fun b!246280 () Bool)

(assert (=> b!246280 (= e!159769 (isDefined!230 (getValueByKey!288 (toList!1849 (getCurrentListMap!1358 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504))) key!932)))))

(assert (= (and d!60223 c!41178) b!246278))

(assert (= (and d!60223 (not c!41178)) b!246279))

(assert (= (and d!60223 (not res!120734)) b!246280))

(declare-fun m!263217 () Bool)

(assert (=> d!60223 m!263217))

(declare-fun m!263219 () Bool)

(assert (=> b!246278 m!263219))

(declare-fun m!263221 () Bool)

(assert (=> b!246278 m!263221))

(assert (=> b!246278 m!263221))

(declare-fun m!263223 () Bool)

(assert (=> b!246278 m!263223))

(assert (=> b!246280 m!263221))

(assert (=> b!246280 m!263221))

(assert (=> b!246280 m!263223))

(assert (=> b!246126 d!60223))

(declare-fun bm!23015 () Bool)

(declare-fun call!23024 () ListLongMap!3667)

(declare-fun call!23019 () ListLongMap!3667)

(assert (=> bm!23015 (= call!23024 call!23019)))

(declare-fun b!246324 () Bool)

(declare-fun e!159805 () ListLongMap!3667)

(declare-fun e!159798 () ListLongMap!3667)

(assert (=> b!246324 (= e!159805 e!159798)))

(declare-fun c!41195 () Bool)

(assert (=> b!246324 (= c!41195 (and (not (= (bvand (extraKeys!4294 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4294 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!246325 () Bool)

(declare-fun e!159806 () Bool)

(declare-fun e!159800 () Bool)

(assert (=> b!246325 (= e!159806 e!159800)))

(declare-fun res!120761 () Bool)

(declare-fun call!23023 () Bool)

(assert (=> b!246325 (= res!120761 call!23023)))

(assert (=> b!246325 (=> (not res!120761) (not e!159800))))

(declare-fun b!246326 () Bool)

(declare-fun e!159807 () Bool)

(declare-fun lt!123291 () ListLongMap!3667)

(declare-fun apply!232 (ListLongMap!3667 (_ BitVec 64)) V!8217)

(assert (=> b!246326 (= e!159807 (= (apply!232 lt!123291 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4398 thiss!1504)))))

(declare-fun b!246327 () Bool)

(declare-fun call!23022 () ListLongMap!3667)

(declare-fun +!665 (ListLongMap!3667 tuple2!4764) ListLongMap!3667)

(assert (=> b!246327 (= e!159805 (+!665 call!23022 (tuple2!4765 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4398 thiss!1504))))))

(declare-fun b!246328 () Bool)

(declare-fun e!159804 () Unit!7595)

(declare-fun Unit!7605 () Unit!7595)

(assert (=> b!246328 (= e!159804 Unit!7605)))

(declare-fun bm!23016 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!548 (array!12149 array!12147 (_ BitVec 32) (_ BitVec 32) V!8217 V!8217 (_ BitVec 32) Int) ListLongMap!3667)

(assert (=> bm!23016 (= call!23019 (getCurrentListMapNoExtraKeys!548 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)))))

(declare-fun b!246329 () Bool)

(declare-fun e!159799 () Bool)

(declare-fun call!23020 () Bool)

(assert (=> b!246329 (= e!159799 (not call!23020))))

(declare-fun b!246330 () Bool)

(declare-fun e!159803 () ListLongMap!3667)

(declare-fun call!23018 () ListLongMap!3667)

(assert (=> b!246330 (= e!159803 call!23018)))

(declare-fun b!246331 () Bool)

(assert (=> b!246331 (= e!159799 e!159807)))

(declare-fun res!120760 () Bool)

(assert (=> b!246331 (= res!120760 call!23020)))

(assert (=> b!246331 (=> (not res!120760) (not e!159807))))

(declare-fun b!246323 () Bool)

(assert (=> b!246323 (= e!159806 (not call!23023))))

(declare-fun d!60225 () Bool)

(declare-fun e!159802 () Bool)

(assert (=> d!60225 e!159802))

(declare-fun res!120755 () Bool)

(assert (=> d!60225 (=> (not res!120755) (not e!159802))))

(assert (=> d!60225 (= res!120755 (or (bvsge #b00000000000000000000000000000000 (size!6108 (_keys!6675 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6108 (_keys!6675 thiss!1504))))))))

(declare-fun lt!123296 () ListLongMap!3667)

(assert (=> d!60225 (= lt!123291 lt!123296)))

(declare-fun lt!123286 () Unit!7595)

(assert (=> d!60225 (= lt!123286 e!159804)))

(declare-fun c!41193 () Bool)

(declare-fun e!159797 () Bool)

(assert (=> d!60225 (= c!41193 e!159797)))

(declare-fun res!120756 () Bool)

(assert (=> d!60225 (=> (not res!120756) (not e!159797))))

(assert (=> d!60225 (= res!120756 (bvslt #b00000000000000000000000000000000 (size!6108 (_keys!6675 thiss!1504))))))

(assert (=> d!60225 (= lt!123296 e!159805)))

(declare-fun c!41194 () Bool)

(assert (=> d!60225 (= c!41194 (and (not (= (bvand (extraKeys!4294 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4294 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60225 (validMask!0 (mask!10679 thiss!1504))))

(assert (=> d!60225 (= (getCurrentListMap!1358 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)) lt!123291)))

(declare-fun bm!23017 () Bool)

(assert (=> bm!23017 (= call!23023 (contains!1765 lt!123291 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246332 () Bool)

(declare-fun lt!123278 () Unit!7595)

(assert (=> b!246332 (= e!159804 lt!123278)))

(declare-fun lt!123294 () ListLongMap!3667)

(assert (=> b!246332 (= lt!123294 (getCurrentListMapNoExtraKeys!548 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)))))

(declare-fun lt!123283 () (_ BitVec 64))

(assert (=> b!246332 (= lt!123283 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123288 () (_ BitVec 64))

(assert (=> b!246332 (= lt!123288 (select (arr!5764 (_keys!6675 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123280 () Unit!7595)

(declare-fun addStillContains!208 (ListLongMap!3667 (_ BitVec 64) V!8217 (_ BitVec 64)) Unit!7595)

(assert (=> b!246332 (= lt!123280 (addStillContains!208 lt!123294 lt!123283 (zeroValue!4398 thiss!1504) lt!123288))))

(assert (=> b!246332 (contains!1765 (+!665 lt!123294 (tuple2!4765 lt!123283 (zeroValue!4398 thiss!1504))) lt!123288)))

(declare-fun lt!123298 () Unit!7595)

(assert (=> b!246332 (= lt!123298 lt!123280)))

(declare-fun lt!123285 () ListLongMap!3667)

(assert (=> b!246332 (= lt!123285 (getCurrentListMapNoExtraKeys!548 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)))))

(declare-fun lt!123284 () (_ BitVec 64))

(assert (=> b!246332 (= lt!123284 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123297 () (_ BitVec 64))

(assert (=> b!246332 (= lt!123297 (select (arr!5764 (_keys!6675 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123293 () Unit!7595)

(declare-fun addApplyDifferent!208 (ListLongMap!3667 (_ BitVec 64) V!8217 (_ BitVec 64)) Unit!7595)

(assert (=> b!246332 (= lt!123293 (addApplyDifferent!208 lt!123285 lt!123284 (minValue!4398 thiss!1504) lt!123297))))

(assert (=> b!246332 (= (apply!232 (+!665 lt!123285 (tuple2!4765 lt!123284 (minValue!4398 thiss!1504))) lt!123297) (apply!232 lt!123285 lt!123297))))

(declare-fun lt!123282 () Unit!7595)

(assert (=> b!246332 (= lt!123282 lt!123293)))

(declare-fun lt!123299 () ListLongMap!3667)

(assert (=> b!246332 (= lt!123299 (getCurrentListMapNoExtraKeys!548 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)))))

(declare-fun lt!123289 () (_ BitVec 64))

(assert (=> b!246332 (= lt!123289 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123279 () (_ BitVec 64))

(assert (=> b!246332 (= lt!123279 (select (arr!5764 (_keys!6675 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123287 () Unit!7595)

(assert (=> b!246332 (= lt!123287 (addApplyDifferent!208 lt!123299 lt!123289 (zeroValue!4398 thiss!1504) lt!123279))))

(assert (=> b!246332 (= (apply!232 (+!665 lt!123299 (tuple2!4765 lt!123289 (zeroValue!4398 thiss!1504))) lt!123279) (apply!232 lt!123299 lt!123279))))

(declare-fun lt!123290 () Unit!7595)

(assert (=> b!246332 (= lt!123290 lt!123287)))

(declare-fun lt!123292 () ListLongMap!3667)

(assert (=> b!246332 (= lt!123292 (getCurrentListMapNoExtraKeys!548 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)))))

(declare-fun lt!123281 () (_ BitVec 64))

(assert (=> b!246332 (= lt!123281 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123295 () (_ BitVec 64))

(assert (=> b!246332 (= lt!123295 (select (arr!5764 (_keys!6675 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246332 (= lt!123278 (addApplyDifferent!208 lt!123292 lt!123281 (minValue!4398 thiss!1504) lt!123295))))

(assert (=> b!246332 (= (apply!232 (+!665 lt!123292 (tuple2!4765 lt!123281 (minValue!4398 thiss!1504))) lt!123295) (apply!232 lt!123292 lt!123295))))

(declare-fun bm!23018 () Bool)

(assert (=> bm!23018 (= call!23018 call!23022)))

(declare-fun call!23021 () ListLongMap!3667)

(declare-fun bm!23019 () Bool)

(assert (=> bm!23019 (= call!23022 (+!665 (ite c!41194 call!23019 (ite c!41195 call!23024 call!23021)) (ite (or c!41194 c!41195) (tuple2!4765 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4398 thiss!1504)) (tuple2!4765 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4398 thiss!1504)))))))

(declare-fun b!246333 () Bool)

(declare-fun res!120757 () Bool)

(assert (=> b!246333 (=> (not res!120757) (not e!159802))))

(assert (=> b!246333 (= res!120757 e!159806)))

(declare-fun c!41191 () Bool)

(assert (=> b!246333 (= c!41191 (not (= (bvand (extraKeys!4294 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!246334 () Bool)

(declare-fun c!41192 () Bool)

(assert (=> b!246334 (= c!41192 (and (not (= (bvand (extraKeys!4294 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4294 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!246334 (= e!159798 e!159803)))

(declare-fun b!246335 () Bool)

(declare-fun e!159801 () Bool)

(declare-fun get!2957 (ValueCell!2870 V!8217) V!8217)

(declare-fun dynLambda!566 (Int (_ BitVec 64)) V!8217)

(assert (=> b!246335 (= e!159801 (= (apply!232 lt!123291 (select (arr!5764 (_keys!6675 thiss!1504)) #b00000000000000000000000000000000)) (get!2957 (select (arr!5763 (_values!4540 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!566 (defaultEntry!4557 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!246335 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6107 (_values!4540 thiss!1504))))))

(assert (=> b!246335 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6108 (_keys!6675 thiss!1504))))))

(declare-fun b!246336 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!246336 (= e!159797 (validKeyInArray!0 (select (arr!5764 (_keys!6675 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23020 () Bool)

(assert (=> bm!23020 (= call!23021 call!23024)))

(declare-fun b!246337 () Bool)

(assert (=> b!246337 (= e!159800 (= (apply!232 lt!123291 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4398 thiss!1504)))))

(declare-fun b!246338 () Bool)

(declare-fun e!159808 () Bool)

(assert (=> b!246338 (= e!159808 (validKeyInArray!0 (select (arr!5764 (_keys!6675 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23021 () Bool)

(assert (=> bm!23021 (= call!23020 (contains!1765 lt!123291 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246339 () Bool)

(assert (=> b!246339 (= e!159802 e!159799)))

(declare-fun c!41196 () Bool)

(assert (=> b!246339 (= c!41196 (not (= (bvand (extraKeys!4294 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!246340 () Bool)

(declare-fun res!120754 () Bool)

(assert (=> b!246340 (=> (not res!120754) (not e!159802))))

(declare-fun e!159796 () Bool)

(assert (=> b!246340 (= res!120754 e!159796)))

(declare-fun res!120759 () Bool)

(assert (=> b!246340 (=> res!120759 e!159796)))

(assert (=> b!246340 (= res!120759 (not e!159808))))

(declare-fun res!120758 () Bool)

(assert (=> b!246340 (=> (not res!120758) (not e!159808))))

(assert (=> b!246340 (= res!120758 (bvslt #b00000000000000000000000000000000 (size!6108 (_keys!6675 thiss!1504))))))

(declare-fun b!246341 () Bool)

(assert (=> b!246341 (= e!159803 call!23021)))

(declare-fun b!246342 () Bool)

(assert (=> b!246342 (= e!159796 e!159801)))

(declare-fun res!120753 () Bool)

(assert (=> b!246342 (=> (not res!120753) (not e!159801))))

(assert (=> b!246342 (= res!120753 (contains!1765 lt!123291 (select (arr!5764 (_keys!6675 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!246342 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6108 (_keys!6675 thiss!1504))))))

(declare-fun b!246343 () Bool)

(assert (=> b!246343 (= e!159798 call!23018)))

(assert (= (and d!60225 c!41194) b!246327))

(assert (= (and d!60225 (not c!41194)) b!246324))

(assert (= (and b!246324 c!41195) b!246343))

(assert (= (and b!246324 (not c!41195)) b!246334))

(assert (= (and b!246334 c!41192) b!246330))

(assert (= (and b!246334 (not c!41192)) b!246341))

(assert (= (or b!246330 b!246341) bm!23020))

(assert (= (or b!246343 bm!23020) bm!23015))

(assert (= (or b!246343 b!246330) bm!23018))

(assert (= (or b!246327 bm!23015) bm!23016))

(assert (= (or b!246327 bm!23018) bm!23019))

(assert (= (and d!60225 res!120756) b!246336))

(assert (= (and d!60225 c!41193) b!246332))

(assert (= (and d!60225 (not c!41193)) b!246328))

(assert (= (and d!60225 res!120755) b!246340))

(assert (= (and b!246340 res!120758) b!246338))

(assert (= (and b!246340 (not res!120759)) b!246342))

(assert (= (and b!246342 res!120753) b!246335))

(assert (= (and b!246340 res!120754) b!246333))

(assert (= (and b!246333 c!41191) b!246325))

(assert (= (and b!246333 (not c!41191)) b!246323))

(assert (= (and b!246325 res!120761) b!246337))

(assert (= (or b!246325 b!246323) bm!23017))

(assert (= (and b!246333 res!120757) b!246339))

(assert (= (and b!246339 c!41196) b!246331))

(assert (= (and b!246339 (not c!41196)) b!246329))

(assert (= (and b!246331 res!120760) b!246326))

(assert (= (or b!246331 b!246329) bm!23021))

(declare-fun b_lambda!8021 () Bool)

(assert (=> (not b_lambda!8021) (not b!246335)))

(declare-fun t!8680 () Bool)

(declare-fun tb!2969 () Bool)

(assert (=> (and b!246127 (= (defaultEntry!4557 thiss!1504) (defaultEntry!4557 thiss!1504)) t!8680) tb!2969))

(declare-fun result!5245 () Bool)

(assert (=> tb!2969 (= result!5245 tp_is_empty!6427)))

(assert (=> b!246335 t!8680))

(declare-fun b_and!13541 () Bool)

(assert (= b_and!13535 (and (=> t!8680 result!5245) b_and!13541)))

(assert (=> b!246342 m!263213))

(assert (=> b!246342 m!263213))

(declare-fun m!263225 () Bool)

(assert (=> b!246342 m!263225))

(declare-fun m!263227 () Bool)

(assert (=> bm!23019 m!263227))

(declare-fun m!263229 () Bool)

(assert (=> b!246337 m!263229))

(assert (=> d!60225 m!263097))

(assert (=> b!246336 m!263213))

(assert (=> b!246336 m!263213))

(declare-fun m!263231 () Bool)

(assert (=> b!246336 m!263231))

(assert (=> b!246338 m!263213))

(assert (=> b!246338 m!263213))

(assert (=> b!246338 m!263231))

(declare-fun m!263233 () Bool)

(assert (=> bm!23017 m!263233))

(declare-fun m!263235 () Bool)

(assert (=> b!246332 m!263235))

(declare-fun m!263237 () Bool)

(assert (=> b!246332 m!263237))

(declare-fun m!263239 () Bool)

(assert (=> b!246332 m!263239))

(declare-fun m!263241 () Bool)

(assert (=> b!246332 m!263241))

(assert (=> b!246332 m!263239))

(declare-fun m!263243 () Bool)

(assert (=> b!246332 m!263243))

(declare-fun m!263245 () Bool)

(assert (=> b!246332 m!263245))

(declare-fun m!263247 () Bool)

(assert (=> b!246332 m!263247))

(declare-fun m!263249 () Bool)

(assert (=> b!246332 m!263249))

(declare-fun m!263251 () Bool)

(assert (=> b!246332 m!263251))

(assert (=> b!246332 m!263213))

(declare-fun m!263253 () Bool)

(assert (=> b!246332 m!263253))

(assert (=> b!246332 m!263253))

(declare-fun m!263255 () Bool)

(assert (=> b!246332 m!263255))

(declare-fun m!263257 () Bool)

(assert (=> b!246332 m!263257))

(assert (=> b!246332 m!263245))

(declare-fun m!263259 () Bool)

(assert (=> b!246332 m!263259))

(declare-fun m!263261 () Bool)

(assert (=> b!246332 m!263261))

(declare-fun m!263263 () Bool)

(assert (=> b!246332 m!263263))

(declare-fun m!263265 () Bool)

(assert (=> b!246332 m!263265))

(assert (=> b!246332 m!263263))

(assert (=> bm!23016 m!263251))

(assert (=> b!246335 m!263213))

(declare-fun m!263267 () Bool)

(assert (=> b!246335 m!263267))

(declare-fun m!263269 () Bool)

(assert (=> b!246335 m!263269))

(declare-fun m!263271 () Bool)

(assert (=> b!246335 m!263271))

(assert (=> b!246335 m!263269))

(declare-fun m!263273 () Bool)

(assert (=> b!246335 m!263273))

(assert (=> b!246335 m!263271))

(assert (=> b!246335 m!263213))

(declare-fun m!263275 () Bool)

(assert (=> bm!23021 m!263275))

(declare-fun m!263277 () Bool)

(assert (=> b!246327 m!263277))

(declare-fun m!263279 () Bool)

(assert (=> b!246326 m!263279))

(assert (=> b!246126 d!60225))

(declare-fun d!60227 () Bool)

(assert (=> d!60227 (contains!1765 (getCurrentListMap!1358 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)) key!932)))

(declare-fun lt!123302 () Unit!7595)

(declare-fun choose!1162 (array!12149 array!12147 (_ BitVec 32) (_ BitVec 32) V!8217 V!8217 (_ BitVec 64) (_ BitVec 32) Int) Unit!7595)

(assert (=> d!60227 (= lt!123302 (choose!1162 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)))))

(assert (=> d!60227 (validMask!0 (mask!10679 thiss!1504))))

(assert (=> d!60227 (= (lemmaArrayContainsKeyThenInListMap!189 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)) lt!123302)))

(declare-fun bs!8888 () Bool)

(assert (= bs!8888 d!60227))

(assert (=> bs!8888 m!263117))

(assert (=> bs!8888 m!263117))

(assert (=> bs!8888 m!263119))

(declare-fun m!263281 () Bool)

(assert (=> bs!8888 m!263281))

(assert (=> bs!8888 m!263097))

(assert (=> b!246129 d!60227))

(declare-fun d!60229 () Bool)

(declare-fun res!120768 () Bool)

(declare-fun e!159811 () Bool)

(assert (=> d!60229 (=> (not res!120768) (not e!159811))))

(declare-fun simpleValid!255 (LongMapFixedSize!3640) Bool)

(assert (=> d!60229 (= res!120768 (simpleValid!255 thiss!1504))))

(assert (=> d!60229 (= (valid!1434 thiss!1504) e!159811)))

(declare-fun b!246352 () Bool)

(declare-fun res!120769 () Bool)

(assert (=> b!246352 (=> (not res!120769) (not e!159811))))

(assert (=> b!246352 (= res!120769 (= (arrayCountValidKeys!0 (_keys!6675 thiss!1504) #b00000000000000000000000000000000 (size!6108 (_keys!6675 thiss!1504))) (_size!1869 thiss!1504)))))

(declare-fun b!246353 () Bool)

(declare-fun res!120770 () Bool)

(assert (=> b!246353 (=> (not res!120770) (not e!159811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12149 (_ BitVec 32)) Bool)

(assert (=> b!246353 (= res!120770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6675 thiss!1504) (mask!10679 thiss!1504)))))

(declare-fun b!246354 () Bool)

(assert (=> b!246354 (= e!159811 (arrayNoDuplicates!0 (_keys!6675 thiss!1504) #b00000000000000000000000000000000 Nil!3665))))

(assert (= (and d!60229 res!120768) b!246352))

(assert (= (and b!246352 res!120769) b!246353))

(assert (= (and b!246353 res!120770) b!246354))

(declare-fun m!263283 () Bool)

(assert (=> d!60229 m!263283))

(assert (=> b!246352 m!263107))

(declare-fun m!263285 () Bool)

(assert (=> b!246353 m!263285))

(declare-fun m!263287 () Bool)

(assert (=> b!246354 m!263287))

(assert (=> start!23452 d!60229))

(declare-fun d!60231 () Bool)

(declare-fun e!159814 () Bool)

(assert (=> d!60231 e!159814))

(declare-fun res!120776 () Bool)

(assert (=> d!60231 (=> (not res!120776) (not e!159814))))

(declare-fun lt!123307 () SeekEntryResult!1091)

(assert (=> d!60231 (= res!120776 ((_ is Found!1091) lt!123307))))

(assert (=> d!60231 (= lt!123307 (seekEntryOrOpen!0 key!932 (_keys!6675 thiss!1504) (mask!10679 thiss!1504)))))

(declare-fun lt!123308 () Unit!7595)

(declare-fun choose!1163 (array!12149 array!12147 (_ BitVec 32) (_ BitVec 32) V!8217 V!8217 (_ BitVec 64) Int) Unit!7595)

(assert (=> d!60231 (= lt!123308 (choose!1163 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) key!932 (defaultEntry!4557 thiss!1504)))))

(assert (=> d!60231 (validMask!0 (mask!10679 thiss!1504))))

(assert (=> d!60231 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!380 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) key!932 (defaultEntry!4557 thiss!1504)) lt!123308)))

(declare-fun b!246359 () Bool)

(declare-fun res!120775 () Bool)

(assert (=> b!246359 (=> (not res!120775) (not e!159814))))

(assert (=> b!246359 (= res!120775 (inRange!0 (index!6535 lt!123307) (mask!10679 thiss!1504)))))

(declare-fun b!246360 () Bool)

(assert (=> b!246360 (= e!159814 (= (select (arr!5764 (_keys!6675 thiss!1504)) (index!6535 lt!123307)) key!932))))

(assert (=> b!246360 (and (bvsge (index!6535 lt!123307) #b00000000000000000000000000000000) (bvslt (index!6535 lt!123307) (size!6108 (_keys!6675 thiss!1504))))))

(assert (= (and d!60231 res!120776) b!246359))

(assert (= (and b!246359 res!120775) b!246360))

(assert (=> d!60231 m!263087))

(declare-fun m!263289 () Bool)

(assert (=> d!60231 m!263289))

(assert (=> d!60231 m!263097))

(declare-fun m!263291 () Bool)

(assert (=> b!246359 m!263291))

(declare-fun m!263293 () Bool)

(assert (=> b!246360 m!263293))

(assert (=> b!246135 d!60231))

(declare-fun b!246373 () Bool)

(declare-fun e!159822 () SeekEntryResult!1091)

(declare-fun lt!123316 () SeekEntryResult!1091)

(assert (=> b!246373 (= e!159822 (Found!1091 (index!6536 lt!123316)))))

(declare-fun d!60233 () Bool)

(declare-fun lt!123317 () SeekEntryResult!1091)

(assert (=> d!60233 (and (or ((_ is Undefined!1091) lt!123317) (not ((_ is Found!1091) lt!123317)) (and (bvsge (index!6535 lt!123317) #b00000000000000000000000000000000) (bvslt (index!6535 lt!123317) (size!6108 (_keys!6675 thiss!1504))))) (or ((_ is Undefined!1091) lt!123317) ((_ is Found!1091) lt!123317) (not ((_ is MissingZero!1091) lt!123317)) (and (bvsge (index!6534 lt!123317) #b00000000000000000000000000000000) (bvslt (index!6534 lt!123317) (size!6108 (_keys!6675 thiss!1504))))) (or ((_ is Undefined!1091) lt!123317) ((_ is Found!1091) lt!123317) ((_ is MissingZero!1091) lt!123317) (not ((_ is MissingVacant!1091) lt!123317)) (and (bvsge (index!6537 lt!123317) #b00000000000000000000000000000000) (bvslt (index!6537 lt!123317) (size!6108 (_keys!6675 thiss!1504))))) (or ((_ is Undefined!1091) lt!123317) (ite ((_ is Found!1091) lt!123317) (= (select (arr!5764 (_keys!6675 thiss!1504)) (index!6535 lt!123317)) key!932) (ite ((_ is MissingZero!1091) lt!123317) (= (select (arr!5764 (_keys!6675 thiss!1504)) (index!6534 lt!123317)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1091) lt!123317) (= (select (arr!5764 (_keys!6675 thiss!1504)) (index!6537 lt!123317)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!159821 () SeekEntryResult!1091)

(assert (=> d!60233 (= lt!123317 e!159821)))

(declare-fun c!41205 () Bool)

(assert (=> d!60233 (= c!41205 (and ((_ is Intermediate!1091) lt!123316) (undefined!1903 lt!123316)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12149 (_ BitVec 32)) SeekEntryResult!1091)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60233 (= lt!123316 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10679 thiss!1504)) key!932 (_keys!6675 thiss!1504) (mask!10679 thiss!1504)))))

(assert (=> d!60233 (validMask!0 (mask!10679 thiss!1504))))

(assert (=> d!60233 (= (seekEntryOrOpen!0 key!932 (_keys!6675 thiss!1504) (mask!10679 thiss!1504)) lt!123317)))

(declare-fun b!246374 () Bool)

(declare-fun c!41204 () Bool)

(declare-fun lt!123315 () (_ BitVec 64))

(assert (=> b!246374 (= c!41204 (= lt!123315 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!159823 () SeekEntryResult!1091)

(assert (=> b!246374 (= e!159822 e!159823)))

(declare-fun b!246375 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12149 (_ BitVec 32)) SeekEntryResult!1091)

(assert (=> b!246375 (= e!159823 (seekKeyOrZeroReturnVacant!0 (x!24464 lt!123316) (index!6536 lt!123316) (index!6536 lt!123316) key!932 (_keys!6675 thiss!1504) (mask!10679 thiss!1504)))))

(declare-fun b!246376 () Bool)

(assert (=> b!246376 (= e!159821 Undefined!1091)))

(declare-fun b!246377 () Bool)

(assert (=> b!246377 (= e!159823 (MissingZero!1091 (index!6536 lt!123316)))))

(declare-fun b!246378 () Bool)

(assert (=> b!246378 (= e!159821 e!159822)))

(assert (=> b!246378 (= lt!123315 (select (arr!5764 (_keys!6675 thiss!1504)) (index!6536 lt!123316)))))

(declare-fun c!41203 () Bool)

(assert (=> b!246378 (= c!41203 (= lt!123315 key!932))))

(assert (= (and d!60233 c!41205) b!246376))

(assert (= (and d!60233 (not c!41205)) b!246378))

(assert (= (and b!246378 c!41203) b!246373))

(assert (= (and b!246378 (not c!41203)) b!246374))

(assert (= (and b!246374 c!41204) b!246377))

(assert (= (and b!246374 (not c!41204)) b!246375))

(declare-fun m!263295 () Bool)

(assert (=> d!60233 m!263295))

(declare-fun m!263297 () Bool)

(assert (=> d!60233 m!263297))

(assert (=> d!60233 m!263097))

(declare-fun m!263299 () Bool)

(assert (=> d!60233 m!263299))

(declare-fun m!263301 () Bool)

(assert (=> d!60233 m!263301))

(assert (=> d!60233 m!263301))

(declare-fun m!263303 () Bool)

(assert (=> d!60233 m!263303))

(declare-fun m!263305 () Bool)

(assert (=> b!246375 m!263305))

(declare-fun m!263307 () Bool)

(assert (=> b!246378 m!263307))

(assert (=> b!246121 d!60233))

(declare-fun b!246395 () Bool)

(declare-fun e!159833 () Bool)

(declare-fun call!23030 () Bool)

(assert (=> b!246395 (= e!159833 (not call!23030))))

(declare-fun bm!23027 () Bool)

(assert (=> bm!23027 (= call!23030 (arrayContainsKey!0 (_keys!6675 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!246396 () Bool)

(declare-fun e!159835 () Bool)

(declare-fun e!159832 () Bool)

(assert (=> b!246396 (= e!159835 e!159832)))

(declare-fun c!41211 () Bool)

(declare-fun lt!123322 () SeekEntryResult!1091)

(assert (=> b!246396 (= c!41211 ((_ is MissingVacant!1091) lt!123322))))

(declare-fun b!246397 () Bool)

(assert (=> b!246397 (= e!159832 ((_ is Undefined!1091) lt!123322))))

(declare-fun b!246398 () Bool)

(declare-fun e!159834 () Bool)

(assert (=> b!246398 (= e!159834 (not call!23030))))

(declare-fun b!246399 () Bool)

(declare-fun res!120785 () Bool)

(assert (=> b!246399 (=> (not res!120785) (not e!159834))))

(declare-fun call!23029 () Bool)

(assert (=> b!246399 (= res!120785 call!23029)))

(assert (=> b!246399 (= e!159832 e!159834)))

(declare-fun b!246400 () Bool)

(assert (=> b!246400 (and (bvsge (index!6534 lt!123322) #b00000000000000000000000000000000) (bvslt (index!6534 lt!123322) (size!6108 (_keys!6675 thiss!1504))))))

(declare-fun res!120787 () Bool)

(assert (=> b!246400 (= res!120787 (= (select (arr!5764 (_keys!6675 thiss!1504)) (index!6534 lt!123322)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246400 (=> (not res!120787) (not e!159833))))

(declare-fun bm!23026 () Bool)

(declare-fun c!41210 () Bool)

(assert (=> bm!23026 (= call!23029 (inRange!0 (ite c!41210 (index!6534 lt!123322) (index!6537 lt!123322)) (mask!10679 thiss!1504)))))

(declare-fun d!60235 () Bool)

(assert (=> d!60235 e!159835))

(assert (=> d!60235 (= c!41210 ((_ is MissingZero!1091) lt!123322))))

(assert (=> d!60235 (= lt!123322 (seekEntryOrOpen!0 key!932 (_keys!6675 thiss!1504) (mask!10679 thiss!1504)))))

(declare-fun lt!123323 () Unit!7595)

(declare-fun choose!1164 (array!12149 array!12147 (_ BitVec 32) (_ BitVec 32) V!8217 V!8217 (_ BitVec 64) Int) Unit!7595)

(assert (=> d!60235 (= lt!123323 (choose!1164 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) key!932 (defaultEntry!4557 thiss!1504)))))

(assert (=> d!60235 (validMask!0 (mask!10679 thiss!1504))))

(assert (=> d!60235 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!377 (_keys!6675 thiss!1504) (_values!4540 thiss!1504) (mask!10679 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) key!932 (defaultEntry!4557 thiss!1504)) lt!123323)))

(declare-fun b!246401 () Bool)

(assert (=> b!246401 (= e!159835 e!159833)))

(declare-fun res!120788 () Bool)

(assert (=> b!246401 (= res!120788 call!23029)))

(assert (=> b!246401 (=> (not res!120788) (not e!159833))))

(declare-fun b!246402 () Bool)

(declare-fun res!120786 () Bool)

(assert (=> b!246402 (=> (not res!120786) (not e!159834))))

(assert (=> b!246402 (= res!120786 (= (select (arr!5764 (_keys!6675 thiss!1504)) (index!6537 lt!123322)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246402 (and (bvsge (index!6537 lt!123322) #b00000000000000000000000000000000) (bvslt (index!6537 lt!123322) (size!6108 (_keys!6675 thiss!1504))))))

(assert (= (and d!60235 c!41210) b!246401))

(assert (= (and d!60235 (not c!41210)) b!246396))

(assert (= (and b!246401 res!120788) b!246400))

(assert (= (and b!246400 res!120787) b!246395))

(assert (= (and b!246396 c!41211) b!246399))

(assert (= (and b!246396 (not c!41211)) b!246397))

(assert (= (and b!246399 res!120785) b!246402))

(assert (= (and b!246402 res!120786) b!246398))

(assert (= (or b!246401 b!246399) bm!23026))

(assert (= (or b!246395 b!246398) bm!23027))

(assert (=> d!60235 m!263087))

(declare-fun m!263309 () Bool)

(assert (=> d!60235 m!263309))

(assert (=> d!60235 m!263097))

(declare-fun m!263311 () Bool)

(assert (=> b!246400 m!263311))

(declare-fun m!263313 () Bool)

(assert (=> bm!23026 m!263313))

(declare-fun m!263315 () Bool)

(assert (=> b!246402 m!263315))

(assert (=> bm!23027 m!263093))

(assert (=> b!246133 d!60235))

(declare-fun d!60237 () Bool)

(assert (=> d!60237 (= (inRange!0 (ite c!41151 (index!6534 lt!123161) (index!6537 lt!123161)) (mask!10679 thiss!1504)) (and (bvsge (ite c!41151 (index!6534 lt!123161) (index!6537 lt!123161)) #b00000000000000000000000000000000) (bvslt (ite c!41151 (index!6534 lt!123161) (index!6537 lt!123161)) (bvadd (mask!10679 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22987 d!60237))

(declare-fun d!60239 () Bool)

(declare-fun e!159841 () Bool)

(assert (=> d!60239 e!159841))

(declare-fun res!120799 () Bool)

(assert (=> d!60239 (=> (not res!120799) (not e!159841))))

(assert (=> d!60239 (= res!120799 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6108 (_keys!6675 thiss!1504)))))))

(declare-fun lt!123326 () Unit!7595)

(declare-fun choose!1 (array!12149 (_ BitVec 32) (_ BitVec 64)) Unit!7595)

(assert (=> d!60239 (= lt!123326 (choose!1 (_keys!6675 thiss!1504) index!297 key!932))))

(declare-fun e!159840 () Bool)

(assert (=> d!60239 e!159840))

(declare-fun res!120797 () Bool)

(assert (=> d!60239 (=> (not res!120797) (not e!159840))))

(assert (=> d!60239 (= res!120797 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6108 (_keys!6675 thiss!1504)))))))

(assert (=> d!60239 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6675 thiss!1504) index!297 key!932) lt!123326)))

(declare-fun b!246411 () Bool)

(declare-fun res!120798 () Bool)

(assert (=> b!246411 (=> (not res!120798) (not e!159840))))

(assert (=> b!246411 (= res!120798 (not (validKeyInArray!0 (select (arr!5764 (_keys!6675 thiss!1504)) index!297))))))

(declare-fun b!246412 () Bool)

(declare-fun res!120800 () Bool)

(assert (=> b!246412 (=> (not res!120800) (not e!159840))))

(assert (=> b!246412 (= res!120800 (validKeyInArray!0 key!932))))

(declare-fun b!246414 () Bool)

(assert (=> b!246414 (= e!159841 (= (arrayCountValidKeys!0 (array!12150 (store (arr!5764 (_keys!6675 thiss!1504)) index!297 key!932) (size!6108 (_keys!6675 thiss!1504))) #b00000000000000000000000000000000 (size!6108 (_keys!6675 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6675 thiss!1504) #b00000000000000000000000000000000 (size!6108 (_keys!6675 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!246413 () Bool)

(assert (=> b!246413 (= e!159840 (bvslt (size!6108 (_keys!6675 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!60239 res!120797) b!246411))

(assert (= (and b!246411 res!120798) b!246412))

(assert (= (and b!246412 res!120800) b!246413))

(assert (= (and d!60239 res!120799) b!246414))

(declare-fun m!263317 () Bool)

(assert (=> d!60239 m!263317))

(declare-fun m!263319 () Bool)

(assert (=> b!246411 m!263319))

(assert (=> b!246411 m!263319))

(declare-fun m!263321 () Bool)

(assert (=> b!246411 m!263321))

(declare-fun m!263323 () Bool)

(assert (=> b!246412 m!263323))

(assert (=> b!246414 m!263105))

(declare-fun m!263325 () Bool)

(assert (=> b!246414 m!263325))

(assert (=> b!246414 m!263107))

(assert (=> b!246128 d!60239))

(declare-fun b!246423 () Bool)

(declare-fun e!159846 () (_ BitVec 32))

(declare-fun call!23033 () (_ BitVec 32))

(assert (=> b!246423 (= e!159846 (bvadd #b00000000000000000000000000000001 call!23033))))

(declare-fun b!246424 () Bool)

(declare-fun e!159847 () (_ BitVec 32))

(assert (=> b!246424 (= e!159847 e!159846)))

(declare-fun c!41217 () Bool)

(assert (=> b!246424 (= c!41217 (validKeyInArray!0 (select (arr!5764 (_keys!6675 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!60241 () Bool)

(declare-fun lt!123329 () (_ BitVec 32))

(assert (=> d!60241 (and (bvsge lt!123329 #b00000000000000000000000000000000) (bvsle lt!123329 (bvsub (size!6108 (_keys!6675 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60241 (= lt!123329 e!159847)))

(declare-fun c!41216 () Bool)

(assert (=> d!60241 (= c!41216 (bvsge #b00000000000000000000000000000000 (size!6108 (_keys!6675 thiss!1504))))))

(assert (=> d!60241 (and (bvsle #b00000000000000000000000000000000 (size!6108 (_keys!6675 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6108 (_keys!6675 thiss!1504)) (size!6108 (_keys!6675 thiss!1504))))))

(assert (=> d!60241 (= (arrayCountValidKeys!0 (_keys!6675 thiss!1504) #b00000000000000000000000000000000 (size!6108 (_keys!6675 thiss!1504))) lt!123329)))

(declare-fun b!246425 () Bool)

(assert (=> b!246425 (= e!159847 #b00000000000000000000000000000000)))

(declare-fun bm!23030 () Bool)

(assert (=> bm!23030 (= call!23033 (arrayCountValidKeys!0 (_keys!6675 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6108 (_keys!6675 thiss!1504))))))

(declare-fun b!246426 () Bool)

(assert (=> b!246426 (= e!159846 call!23033)))

(assert (= (and d!60241 c!41216) b!246425))

(assert (= (and d!60241 (not c!41216)) b!246424))

(assert (= (and b!246424 c!41217) b!246423))

(assert (= (and b!246424 (not c!41217)) b!246426))

(assert (= (or b!246423 b!246426) bm!23030))

(assert (=> b!246424 m!263213))

(assert (=> b!246424 m!263213))

(assert (=> b!246424 m!263231))

(declare-fun m!263327 () Bool)

(assert (=> bm!23030 m!263327))

(assert (=> b!246128 d!60241))

(declare-fun d!60243 () Bool)

(assert (=> d!60243 (= (validMask!0 (mask!10679 thiss!1504)) (and (or (= (mask!10679 thiss!1504) #b00000000000000000000000000000111) (= (mask!10679 thiss!1504) #b00000000000000000000000000001111) (= (mask!10679 thiss!1504) #b00000000000000000000000000011111) (= (mask!10679 thiss!1504) #b00000000000000000000000000111111) (= (mask!10679 thiss!1504) #b00000000000000000000000001111111) (= (mask!10679 thiss!1504) #b00000000000000000000000011111111) (= (mask!10679 thiss!1504) #b00000000000000000000000111111111) (= (mask!10679 thiss!1504) #b00000000000000000000001111111111) (= (mask!10679 thiss!1504) #b00000000000000000000011111111111) (= (mask!10679 thiss!1504) #b00000000000000000000111111111111) (= (mask!10679 thiss!1504) #b00000000000000000001111111111111) (= (mask!10679 thiss!1504) #b00000000000000000011111111111111) (= (mask!10679 thiss!1504) #b00000000000000000111111111111111) (= (mask!10679 thiss!1504) #b00000000000000001111111111111111) (= (mask!10679 thiss!1504) #b00000000000000011111111111111111) (= (mask!10679 thiss!1504) #b00000000000000111111111111111111) (= (mask!10679 thiss!1504) #b00000000000001111111111111111111) (= (mask!10679 thiss!1504) #b00000000000011111111111111111111) (= (mask!10679 thiss!1504) #b00000000000111111111111111111111) (= (mask!10679 thiss!1504) #b00000000001111111111111111111111) (= (mask!10679 thiss!1504) #b00000000011111111111111111111111) (= (mask!10679 thiss!1504) #b00000000111111111111111111111111) (= (mask!10679 thiss!1504) #b00000001111111111111111111111111) (= (mask!10679 thiss!1504) #b00000011111111111111111111111111) (= (mask!10679 thiss!1504) #b00000111111111111111111111111111) (= (mask!10679 thiss!1504) #b00001111111111111111111111111111) (= (mask!10679 thiss!1504) #b00011111111111111111111111111111) (= (mask!10679 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10679 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!246128 d!60243))

(declare-fun b!246437 () Bool)

(declare-fun e!159859 () Bool)

(declare-fun e!159858 () Bool)

(assert (=> b!246437 (= e!159859 e!159858)))

(declare-fun c!41220 () Bool)

(assert (=> b!246437 (= c!41220 (validKeyInArray!0 (select (arr!5764 lt!123162) #b00000000000000000000000000000000)))))

(declare-fun b!246438 () Bool)

(declare-fun e!159857 () Bool)

(declare-fun contains!1767 (List!3668 (_ BitVec 64)) Bool)

(assert (=> b!246438 (= e!159857 (contains!1767 Nil!3665 (select (arr!5764 lt!123162) #b00000000000000000000000000000000)))))

(declare-fun b!246439 () Bool)

(declare-fun call!23036 () Bool)

(assert (=> b!246439 (= e!159858 call!23036)))

(declare-fun bm!23033 () Bool)

(assert (=> bm!23033 (= call!23036 (arrayNoDuplicates!0 lt!123162 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41220 (Cons!3664 (select (arr!5764 lt!123162) #b00000000000000000000000000000000) Nil!3665) Nil!3665)))))

(declare-fun b!246440 () Bool)

(declare-fun e!159856 () Bool)

(assert (=> b!246440 (= e!159856 e!159859)))

(declare-fun res!120808 () Bool)

(assert (=> b!246440 (=> (not res!120808) (not e!159859))))

(assert (=> b!246440 (= res!120808 (not e!159857))))

(declare-fun res!120809 () Bool)

(assert (=> b!246440 (=> (not res!120809) (not e!159857))))

(assert (=> b!246440 (= res!120809 (validKeyInArray!0 (select (arr!5764 lt!123162) #b00000000000000000000000000000000)))))

(declare-fun b!246441 () Bool)

(assert (=> b!246441 (= e!159858 call!23036)))

(declare-fun d!60245 () Bool)

(declare-fun res!120807 () Bool)

(assert (=> d!60245 (=> res!120807 e!159856)))

(assert (=> d!60245 (= res!120807 (bvsge #b00000000000000000000000000000000 (size!6108 lt!123162)))))

(assert (=> d!60245 (= (arrayNoDuplicates!0 lt!123162 #b00000000000000000000000000000000 Nil!3665) e!159856)))

(assert (= (and d!60245 (not res!120807)) b!246440))

(assert (= (and b!246440 res!120809) b!246438))

(assert (= (and b!246440 res!120808) b!246437))

(assert (= (and b!246437 c!41220) b!246441))

(assert (= (and b!246437 (not c!41220)) b!246439))

(assert (= (or b!246441 b!246439) bm!23033))

(declare-fun m!263329 () Bool)

(assert (=> b!246437 m!263329))

(assert (=> b!246437 m!263329))

(declare-fun m!263331 () Bool)

(assert (=> b!246437 m!263331))

(assert (=> b!246438 m!263329))

(assert (=> b!246438 m!263329))

(declare-fun m!263333 () Bool)

(assert (=> b!246438 m!263333))

(assert (=> bm!23033 m!263329))

(declare-fun m!263335 () Bool)

(assert (=> bm!23033 m!263335))

(assert (=> b!246440 m!263329))

(assert (=> b!246440 m!263329))

(assert (=> b!246440 m!263331))

(assert (=> b!246128 d!60245))

(declare-fun d!60247 () Bool)

(declare-fun e!159862 () Bool)

(assert (=> d!60247 e!159862))

(declare-fun res!120812 () Bool)

(assert (=> d!60247 (=> (not res!120812) (not e!159862))))

(assert (=> d!60247 (= res!120812 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6108 (_keys!6675 thiss!1504)))))))

(declare-fun lt!123332 () Unit!7595)

(declare-fun choose!41 (array!12149 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3668) Unit!7595)

(assert (=> d!60247 (= lt!123332 (choose!41 (_keys!6675 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3665))))

(assert (=> d!60247 (bvslt (size!6108 (_keys!6675 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60247 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6675 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3665) lt!123332)))

(declare-fun b!246444 () Bool)

(assert (=> b!246444 (= e!159862 (arrayNoDuplicates!0 (array!12150 (store (arr!5764 (_keys!6675 thiss!1504)) index!297 key!932) (size!6108 (_keys!6675 thiss!1504))) #b00000000000000000000000000000000 Nil!3665))))

(assert (= (and d!60247 res!120812) b!246444))

(declare-fun m!263337 () Bool)

(assert (=> d!60247 m!263337))

(assert (=> b!246444 m!263105))

(declare-fun m!263339 () Bool)

(assert (=> b!246444 m!263339))

(assert (=> b!246128 d!60247))

(assert (=> b!246128 d!60215))

(declare-fun b!246445 () Bool)

(declare-fun e!159863 () (_ BitVec 32))

(declare-fun call!23037 () (_ BitVec 32))

(assert (=> b!246445 (= e!159863 (bvadd #b00000000000000000000000000000001 call!23037))))

(declare-fun b!246446 () Bool)

(declare-fun e!159864 () (_ BitVec 32))

(assert (=> b!246446 (= e!159864 e!159863)))

(declare-fun c!41222 () Bool)

(assert (=> b!246446 (= c!41222 (validKeyInArray!0 (select (arr!5764 lt!123162) #b00000000000000000000000000000000)))))

(declare-fun d!60249 () Bool)

(declare-fun lt!123333 () (_ BitVec 32))

(assert (=> d!60249 (and (bvsge lt!123333 #b00000000000000000000000000000000) (bvsle lt!123333 (bvsub (size!6108 lt!123162) #b00000000000000000000000000000000)))))

(assert (=> d!60249 (= lt!123333 e!159864)))

(declare-fun c!41221 () Bool)

(assert (=> d!60249 (= c!41221 (bvsge #b00000000000000000000000000000000 (size!6108 (_keys!6675 thiss!1504))))))

(assert (=> d!60249 (and (bvsle #b00000000000000000000000000000000 (size!6108 (_keys!6675 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6108 (_keys!6675 thiss!1504)) (size!6108 lt!123162)))))

(assert (=> d!60249 (= (arrayCountValidKeys!0 lt!123162 #b00000000000000000000000000000000 (size!6108 (_keys!6675 thiss!1504))) lt!123333)))

(declare-fun b!246447 () Bool)

(assert (=> b!246447 (= e!159864 #b00000000000000000000000000000000)))

(declare-fun bm!23034 () Bool)

(assert (=> bm!23034 (= call!23037 (arrayCountValidKeys!0 lt!123162 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6108 (_keys!6675 thiss!1504))))))

(declare-fun b!246448 () Bool)

(assert (=> b!246448 (= e!159863 call!23037)))

(assert (= (and d!60249 c!41221) b!246447))

(assert (= (and d!60249 (not c!41221)) b!246446))

(assert (= (and b!246446 c!41222) b!246445))

(assert (= (and b!246446 (not c!41222)) b!246448))

(assert (= (or b!246445 b!246448) bm!23034))

(assert (=> b!246446 m!263329))

(assert (=> b!246446 m!263329))

(assert (=> b!246446 m!263331))

(declare-fun m!263341 () Bool)

(assert (=> bm!23034 m!263341))

(assert (=> b!246128 d!60249))

(declare-fun b!246455 () Bool)

(declare-fun e!159870 () Bool)

(assert (=> b!246455 (= e!159870 tp_is_empty!6427)))

(declare-fun mapNonEmpty!10916 () Bool)

(declare-fun mapRes!10916 () Bool)

(declare-fun tp!22949 () Bool)

(assert (=> mapNonEmpty!10916 (= mapRes!10916 (and tp!22949 e!159870))))

(declare-fun mapRest!10916 () (Array (_ BitVec 32) ValueCell!2870))

(declare-fun mapKey!10916 () (_ BitVec 32))

(declare-fun mapValue!10916 () ValueCell!2870)

(assert (=> mapNonEmpty!10916 (= mapRest!10907 (store mapRest!10916 mapKey!10916 mapValue!10916))))

(declare-fun condMapEmpty!10916 () Bool)

(declare-fun mapDefault!10916 () ValueCell!2870)

(assert (=> mapNonEmpty!10907 (= condMapEmpty!10916 (= mapRest!10907 ((as const (Array (_ BitVec 32) ValueCell!2870)) mapDefault!10916)))))

(declare-fun e!159869 () Bool)

(assert (=> mapNonEmpty!10907 (= tp!22933 (and e!159869 mapRes!10916))))

(declare-fun b!246456 () Bool)

(assert (=> b!246456 (= e!159869 tp_is_empty!6427)))

(declare-fun mapIsEmpty!10916 () Bool)

(assert (=> mapIsEmpty!10916 mapRes!10916))

(assert (= (and mapNonEmpty!10907 condMapEmpty!10916) mapIsEmpty!10916))

(assert (= (and mapNonEmpty!10907 (not condMapEmpty!10916)) mapNonEmpty!10916))

(assert (= (and mapNonEmpty!10916 ((_ is ValueCellFull!2870) mapValue!10916)) b!246455))

(assert (= (and mapNonEmpty!10907 ((_ is ValueCellFull!2870) mapDefault!10916)) b!246456))

(declare-fun m!263343 () Bool)

(assert (=> mapNonEmpty!10916 m!263343))

(declare-fun b_lambda!8023 () Bool)

(assert (= b_lambda!8021 (or (and b!246127 b_free!6565) b_lambda!8023)))

(check-sat (not b!246411) (not b!246278) (not b!246444) (not d!60227) (not b_lambda!8023) (not bm!23033) (not b!246354) (not b!246335) (not b!246338) (not b!246336) (not d!60233) (not b!246352) (not b!246353) b_and!13541 (not d!60247) (not d!60231) (not bm!23027) (not bm!23026) (not b!246271) (not b!246280) (not bm!23016) (not b!246440) (not b!246375) (not b!246342) (not d!60229) (not b!246424) (not b_next!6565) tp_is_empty!6427 (not b!246337) (not b!246414) (not b!246446) (not b!246412) (not b!246326) (not d!60223) (not b!246327) (not b!246359) (not d!60239) (not bm!23034) (not bm!23030) (not d!60225) (not bm!23021) (not b!246332) (not mapNonEmpty!10916) (not bm!23019) (not bm!23017) (not d!60235) (not b!246438) (not b!246437))
(check-sat b_and!13541 (not b_next!6565))
