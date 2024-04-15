; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22064 () Bool)

(assert start!22064)

(declare-fun b!228154 () Bool)

(declare-fun b_free!6127 () Bool)

(declare-fun b_next!6127 () Bool)

(assert (=> b!228154 (= b_free!6127 (not b_next!6127))))

(declare-fun tp!21522 () Bool)

(declare-fun b_and!12999 () Bool)

(assert (=> b!228154 (= tp!21522 b_and!12999)))

(declare-fun res!112278 () Bool)

(declare-fun e!148023 () Bool)

(assert (=> start!22064 (=> (not res!112278) (not e!148023))))

(declare-datatypes ((V!7633 0))(
  ( (V!7634 (val!3039 Int)) )
))
(declare-datatypes ((ValueCell!2651 0))(
  ( (ValueCellFull!2651 (v!5053 V!7633)) (EmptyCell!2651) )
))
(declare-datatypes ((array!11213 0))(
  ( (array!11214 (arr!5325 (Array (_ BitVec 32) ValueCell!2651)) (size!5659 (_ BitVec 32))) )
))
(declare-datatypes ((array!11215 0))(
  ( (array!11216 (arr!5326 (Array (_ BitVec 32) (_ BitVec 64))) (size!5660 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3202 0))(
  ( (LongMapFixedSize!3203 (defaultEntry!4260 Int) (mask!10129 (_ BitVec 32)) (extraKeys!3997 (_ BitVec 32)) (zeroValue!4101 V!7633) (minValue!4101 V!7633) (_size!1650 (_ BitVec 32)) (_keys!6313 array!11215) (_values!4243 array!11213) (_vacant!1650 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3202)

(declare-fun valid!1295 (LongMapFixedSize!3202) Bool)

(assert (=> start!22064 (= res!112278 (valid!1295 thiss!1504))))

(assert (=> start!22064 e!148023))

(declare-fun e!148019 () Bool)

(assert (=> start!22064 e!148019))

(assert (=> start!22064 true))

(declare-fun b!228150 () Bool)

(declare-fun c!37831 () Bool)

(declare-datatypes ((SeekEntryResult!906 0))(
  ( (MissingZero!906 (index!5794 (_ BitVec 32))) (Found!906 (index!5795 (_ BitVec 32))) (Intermediate!906 (undefined!1718 Bool) (index!5796 (_ BitVec 32)) (x!23325 (_ BitVec 32))) (Undefined!906) (MissingVacant!906 (index!5797 (_ BitVec 32))) )
))
(declare-fun lt!114679 () SeekEntryResult!906)

(get-info :version)

(assert (=> b!228150 (= c!37831 ((_ is MissingVacant!906) lt!114679))))

(declare-fun e!148016 () Bool)

(declare-fun e!148021 () Bool)

(assert (=> b!228150 (= e!148016 e!148021)))

(declare-fun b!228151 () Bool)

(declare-datatypes ((Unit!6907 0))(
  ( (Unit!6908) )
))
(declare-fun e!148014 () Unit!6907)

(declare-fun Unit!6909 () Unit!6907)

(assert (=> b!228151 (= e!148014 Unit!6909)))

(declare-fun lt!114686 () Unit!6907)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!271 (array!11215 array!11213 (_ BitVec 32) (_ BitVec 32) V!7633 V!7633 (_ BitVec 64) Int) Unit!6907)

(assert (=> b!228151 (= lt!114686 (lemmaInListMapThenSeekEntryOrOpenFindsIt!271 (_keys!6313 thiss!1504) (_values!4243 thiss!1504) (mask!10129 thiss!1504) (extraKeys!3997 thiss!1504) (zeroValue!4101 thiss!1504) (minValue!4101 thiss!1504) key!932 (defaultEntry!4260 thiss!1504)))))

(assert (=> b!228151 false))

(declare-fun b!228152 () Bool)

(declare-fun lt!114678 () Unit!6907)

(assert (=> b!228152 (= e!148014 lt!114678)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!268 (array!11215 array!11213 (_ BitVec 32) (_ BitVec 32) V!7633 V!7633 (_ BitVec 64) Int) Unit!6907)

(assert (=> b!228152 (= lt!114678 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!268 (_keys!6313 thiss!1504) (_values!4243 thiss!1504) (mask!10129 thiss!1504) (extraKeys!3997 thiss!1504) (zeroValue!4101 thiss!1504) (minValue!4101 thiss!1504) key!932 (defaultEntry!4260 thiss!1504)))))

(declare-fun c!37833 () Bool)

(assert (=> b!228152 (= c!37833 ((_ is MissingZero!906) lt!114679))))

(assert (=> b!228152 e!148016))

(declare-fun mapNonEmpty!10153 () Bool)

(declare-fun mapRes!10153 () Bool)

(declare-fun tp!21523 () Bool)

(declare-fun e!148020 () Bool)

(assert (=> mapNonEmpty!10153 (= mapRes!10153 (and tp!21523 e!148020))))

(declare-fun mapValue!10153 () ValueCell!2651)

(declare-fun mapRest!10153 () (Array (_ BitVec 32) ValueCell!2651))

(declare-fun mapKey!10153 () (_ BitVec 32))

(assert (=> mapNonEmpty!10153 (= (arr!5325 (_values!4243 thiss!1504)) (store mapRest!10153 mapKey!10153 mapValue!10153))))

(declare-fun b!228153 () Bool)

(declare-fun e!148009 () Bool)

(declare-fun call!21192 () Bool)

(assert (=> b!228153 (= e!148009 (not call!21192))))

(declare-fun e!148011 () Bool)

(declare-fun tp_is_empty!5989 () Bool)

(declare-fun array_inv!3511 (array!11215) Bool)

(declare-fun array_inv!3512 (array!11213) Bool)

(assert (=> b!228154 (= e!148019 (and tp!21522 tp_is_empty!5989 (array_inv!3511 (_keys!6313 thiss!1504)) (array_inv!3512 (_values!4243 thiss!1504)) e!148011))))

(declare-fun call!21191 () Bool)

(declare-fun bm!21188 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21188 (= call!21191 (inRange!0 (ite c!37833 (index!5794 lt!114679) (index!5797 lt!114679)) (mask!10129 thiss!1504)))))

(declare-fun b!228155 () Bool)

(assert (=> b!228155 (= e!148021 ((_ is Undefined!906) lt!114679))))

(declare-fun b!228156 () Bool)

(declare-fun e!148018 () Bool)

(declare-fun e!148017 () Bool)

(assert (=> b!228156 (= e!148018 e!148017)))

(declare-fun res!112281 () Bool)

(assert (=> b!228156 (=> (not res!112281) (not e!148017))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!228156 (= res!112281 (inRange!0 index!297 (mask!10129 thiss!1504)))))

(declare-fun lt!114688 () Unit!6907)

(assert (=> b!228156 (= lt!114688 e!148014)))

(declare-fun c!37834 () Bool)

(declare-datatypes ((tuple2!4464 0))(
  ( (tuple2!4465 (_1!2243 (_ BitVec 64)) (_2!2243 V!7633)) )
))
(declare-datatypes ((List!3396 0))(
  ( (Nil!3393) (Cons!3392 (h!4040 tuple2!4464) (t!8346 List!3396)) )
))
(declare-datatypes ((ListLongMap!3367 0))(
  ( (ListLongMap!3368 (toList!1699 List!3396)) )
))
(declare-fun contains!1574 (ListLongMap!3367 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1208 (array!11215 array!11213 (_ BitVec 32) (_ BitVec 32) V!7633 V!7633 (_ BitVec 32) Int) ListLongMap!3367)

(assert (=> b!228156 (= c!37834 (contains!1574 (getCurrentListMap!1208 (_keys!6313 thiss!1504) (_values!4243 thiss!1504) (mask!10129 thiss!1504) (extraKeys!3997 thiss!1504) (zeroValue!4101 thiss!1504) (minValue!4101 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4260 thiss!1504)) key!932))))

(declare-fun b!228157 () Bool)

(assert (=> b!228157 (= e!148020 tp_is_empty!5989)))

(declare-fun b!228158 () Bool)

(declare-fun res!112280 () Bool)

(declare-fun e!148013 () Bool)

(assert (=> b!228158 (=> (not res!112280) (not e!148013))))

(assert (=> b!228158 (= res!112280 call!21191)))

(assert (=> b!228158 (= e!148016 e!148013)))

(declare-fun bm!21189 () Bool)

(declare-fun arrayContainsKey!0 (array!11215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21189 (= call!21192 (arrayContainsKey!0 (_keys!6313 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228159 () Bool)

(assert (=> b!228159 (= e!148021 e!148009)))

(declare-fun res!112279 () Bool)

(assert (=> b!228159 (= res!112279 call!21191)))

(assert (=> b!228159 (=> (not res!112279) (not e!148009))))

(declare-fun b!228160 () Bool)

(declare-fun res!112286 () Bool)

(declare-fun e!148022 () Bool)

(assert (=> b!228160 (=> res!112286 e!148022)))

(assert (=> b!228160 (= res!112286 (or (not (= (size!5659 (_values!4243 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10129 thiss!1504)))) (not (= (size!5660 (_keys!6313 thiss!1504)) (size!5659 (_values!4243 thiss!1504)))) (bvslt (mask!10129 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3997 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3997 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!228161 () Bool)

(assert (=> b!228161 (= e!148017 (not e!148022))))

(declare-fun res!112285 () Bool)

(assert (=> b!228161 (=> res!112285 e!148022)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!228161 (= res!112285 (not (validMask!0 (mask!10129 thiss!1504))))))

(declare-fun lt!114685 () array!11215)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11215 (_ BitVec 32)) Bool)

(assert (=> b!228161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114685 (mask!10129 thiss!1504))))

(declare-fun lt!114681 () Unit!6907)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11215 (_ BitVec 32) (_ BitVec 32)) Unit!6907)

(assert (=> b!228161 (= lt!114681 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6313 thiss!1504) index!297 (mask!10129 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11215 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!228161 (= (arrayCountValidKeys!0 lt!114685 #b00000000000000000000000000000000 (size!5660 (_keys!6313 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6313 thiss!1504) #b00000000000000000000000000000000 (size!5660 (_keys!6313 thiss!1504)))))))

(declare-fun lt!114683 () Unit!6907)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11215 (_ BitVec 32) (_ BitVec 64)) Unit!6907)

(assert (=> b!228161 (= lt!114683 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6313 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3397 0))(
  ( (Nil!3394) (Cons!3393 (h!4041 (_ BitVec 64)) (t!8347 List!3397)) )
))
(declare-fun arrayNoDuplicates!0 (array!11215 (_ BitVec 32) List!3397) Bool)

(assert (=> b!228161 (arrayNoDuplicates!0 lt!114685 #b00000000000000000000000000000000 Nil!3394)))

(assert (=> b!228161 (= lt!114685 (array!11216 (store (arr!5326 (_keys!6313 thiss!1504)) index!297 key!932) (size!5660 (_keys!6313 thiss!1504))))))

(declare-fun lt!114687 () Unit!6907)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11215 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3397) Unit!6907)

(assert (=> b!228161 (= lt!114687 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6313 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3394))))

(declare-fun lt!114680 () Unit!6907)

(declare-fun e!148015 () Unit!6907)

(assert (=> b!228161 (= lt!114680 e!148015)))

(declare-fun c!37832 () Bool)

(assert (=> b!228161 (= c!37832 (arrayContainsKey!0 (_keys!6313 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228162 () Bool)

(declare-fun Unit!6910 () Unit!6907)

(assert (=> b!228162 (= e!148015 Unit!6910)))

(declare-fun mapIsEmpty!10153 () Bool)

(assert (=> mapIsEmpty!10153 mapRes!10153))

(declare-fun b!228163 () Bool)

(declare-fun e!148012 () Bool)

(assert (=> b!228163 (= e!148012 tp_is_empty!5989)))

(declare-fun b!228164 () Bool)

(declare-fun res!112277 () Bool)

(assert (=> b!228164 (= res!112277 (= (select (arr!5326 (_keys!6313 thiss!1504)) (index!5797 lt!114679)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!228164 (=> (not res!112277) (not e!148009))))

(declare-fun b!228165 () Bool)

(assert (=> b!228165 (= e!148011 (and e!148012 mapRes!10153))))

(declare-fun condMapEmpty!10153 () Bool)

(declare-fun mapDefault!10153 () ValueCell!2651)

(assert (=> b!228165 (= condMapEmpty!10153 (= (arr!5325 (_values!4243 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2651)) mapDefault!10153)))))

(declare-fun b!228166 () Bool)

(assert (=> b!228166 (= e!148022 true)))

(declare-fun lt!114684 () Bool)

(assert (=> b!228166 (= lt!114684 (arrayNoDuplicates!0 (_keys!6313 thiss!1504) #b00000000000000000000000000000000 Nil!3394))))

(declare-fun b!228167 () Bool)

(assert (=> b!228167 (= e!148023 e!148018)))

(declare-fun res!112276 () Bool)

(assert (=> b!228167 (=> (not res!112276) (not e!148018))))

(assert (=> b!228167 (= res!112276 (or (= lt!114679 (MissingZero!906 index!297)) (= lt!114679 (MissingVacant!906 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11215 (_ BitVec 32)) SeekEntryResult!906)

(assert (=> b!228167 (= lt!114679 (seekEntryOrOpen!0 key!932 (_keys!6313 thiss!1504) (mask!10129 thiss!1504)))))

(declare-fun b!228168 () Bool)

(declare-fun res!112282 () Bool)

(assert (=> b!228168 (=> res!112282 e!148022)))

(assert (=> b!228168 (= res!112282 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6313 thiss!1504) (mask!10129 thiss!1504))))))

(declare-fun b!228169 () Bool)

(assert (=> b!228169 (= e!148013 (not call!21192))))

(declare-fun b!228170 () Bool)

(declare-fun Unit!6911 () Unit!6907)

(assert (=> b!228170 (= e!148015 Unit!6911)))

(declare-fun lt!114682 () Unit!6907)

(declare-fun lemmaArrayContainsKeyThenInListMap!112 (array!11215 array!11213 (_ BitVec 32) (_ BitVec 32) V!7633 V!7633 (_ BitVec 64) (_ BitVec 32) Int) Unit!6907)

(assert (=> b!228170 (= lt!114682 (lemmaArrayContainsKeyThenInListMap!112 (_keys!6313 thiss!1504) (_values!4243 thiss!1504) (mask!10129 thiss!1504) (extraKeys!3997 thiss!1504) (zeroValue!4101 thiss!1504) (minValue!4101 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4260 thiss!1504)))))

(assert (=> b!228170 false))

(declare-fun b!228171 () Bool)

(declare-fun res!112283 () Bool)

(assert (=> b!228171 (=> (not res!112283) (not e!148023))))

(assert (=> b!228171 (= res!112283 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!228172 () Bool)

(declare-fun res!112284 () Bool)

(assert (=> b!228172 (=> (not res!112284) (not e!148013))))

(assert (=> b!228172 (= res!112284 (= (select (arr!5326 (_keys!6313 thiss!1504)) (index!5794 lt!114679)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!22064 res!112278) b!228171))

(assert (= (and b!228171 res!112283) b!228167))

(assert (= (and b!228167 res!112276) b!228156))

(assert (= (and b!228156 c!37834) b!228151))

(assert (= (and b!228156 (not c!37834)) b!228152))

(assert (= (and b!228152 c!37833) b!228158))

(assert (= (and b!228152 (not c!37833)) b!228150))

(assert (= (and b!228158 res!112280) b!228172))

(assert (= (and b!228172 res!112284) b!228169))

(assert (= (and b!228150 c!37831) b!228159))

(assert (= (and b!228150 (not c!37831)) b!228155))

(assert (= (and b!228159 res!112279) b!228164))

(assert (= (and b!228164 res!112277) b!228153))

(assert (= (or b!228158 b!228159) bm!21188))

(assert (= (or b!228169 b!228153) bm!21189))

(assert (= (and b!228156 res!112281) b!228161))

(assert (= (and b!228161 c!37832) b!228170))

(assert (= (and b!228161 (not c!37832)) b!228162))

(assert (= (and b!228161 (not res!112285)) b!228160))

(assert (= (and b!228160 (not res!112286)) b!228168))

(assert (= (and b!228168 (not res!112282)) b!228166))

(assert (= (and b!228165 condMapEmpty!10153) mapIsEmpty!10153))

(assert (= (and b!228165 (not condMapEmpty!10153)) mapNonEmpty!10153))

(assert (= (and mapNonEmpty!10153 ((_ is ValueCellFull!2651) mapValue!10153)) b!228157))

(assert (= (and b!228165 ((_ is ValueCellFull!2651) mapDefault!10153)) b!228163))

(assert (= b!228154 b!228165))

(assert (= start!22064 b!228154))

(declare-fun m!249475 () Bool)

(assert (=> b!228154 m!249475))

(declare-fun m!249477 () Bool)

(assert (=> b!228154 m!249477))

(declare-fun m!249479 () Bool)

(assert (=> bm!21189 m!249479))

(declare-fun m!249481 () Bool)

(assert (=> b!228167 m!249481))

(declare-fun m!249483 () Bool)

(assert (=> b!228161 m!249483))

(assert (=> b!228161 m!249479))

(declare-fun m!249485 () Bool)

(assert (=> b!228161 m!249485))

(declare-fun m!249487 () Bool)

(assert (=> b!228161 m!249487))

(declare-fun m!249489 () Bool)

(assert (=> b!228161 m!249489))

(declare-fun m!249491 () Bool)

(assert (=> b!228161 m!249491))

(declare-fun m!249493 () Bool)

(assert (=> b!228161 m!249493))

(declare-fun m!249495 () Bool)

(assert (=> b!228161 m!249495))

(declare-fun m!249497 () Bool)

(assert (=> b!228161 m!249497))

(declare-fun m!249499 () Bool)

(assert (=> b!228161 m!249499))

(declare-fun m!249501 () Bool)

(assert (=> bm!21188 m!249501))

(declare-fun m!249503 () Bool)

(assert (=> b!228168 m!249503))

(declare-fun m!249505 () Bool)

(assert (=> b!228151 m!249505))

(declare-fun m!249507 () Bool)

(assert (=> b!228156 m!249507))

(declare-fun m!249509 () Bool)

(assert (=> b!228156 m!249509))

(assert (=> b!228156 m!249509))

(declare-fun m!249511 () Bool)

(assert (=> b!228156 m!249511))

(declare-fun m!249513 () Bool)

(assert (=> b!228152 m!249513))

(declare-fun m!249515 () Bool)

(assert (=> start!22064 m!249515))

(declare-fun m!249517 () Bool)

(assert (=> b!228170 m!249517))

(declare-fun m!249519 () Bool)

(assert (=> mapNonEmpty!10153 m!249519))

(declare-fun m!249521 () Bool)

(assert (=> b!228164 m!249521))

(declare-fun m!249523 () Bool)

(assert (=> b!228172 m!249523))

(declare-fun m!249525 () Bool)

(assert (=> b!228166 m!249525))

(check-sat (not b!228161) (not b!228170) (not b!228152) (not b!228154) (not b!228167) (not b!228156) tp_is_empty!5989 (not b!228166) (not mapNonEmpty!10153) (not b!228151) b_and!12999 (not bm!21189) (not b!228168) (not start!22064) (not bm!21188) (not b_next!6127))
(check-sat b_and!12999 (not b_next!6127))
