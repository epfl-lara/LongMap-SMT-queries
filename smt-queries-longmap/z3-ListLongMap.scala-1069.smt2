; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22100 () Bool)

(assert start!22100)

(declare-fun b!229593 () Bool)

(declare-fun b_free!6163 () Bool)

(declare-fun b_next!6163 () Bool)

(assert (=> b!229593 (= b_free!6163 (not b_next!6163))))

(declare-fun tp!21630 () Bool)

(declare-fun b_and!13075 () Bool)

(assert (=> b!229593 (= tp!21630 b_and!13075)))

(declare-fun b!229586 () Bool)

(declare-fun e!148944 () Bool)

(declare-datatypes ((SeekEntryResult!891 0))(
  ( (MissingZero!891 (index!5734 (_ BitVec 32))) (Found!891 (index!5735 (_ BitVec 32))) (Intermediate!891 (undefined!1703 Bool) (index!5736 (_ BitVec 32)) (x!23359 (_ BitVec 32))) (Undefined!891) (MissingVacant!891 (index!5737 (_ BitVec 32))) )
))
(declare-fun lt!115521 () SeekEntryResult!891)

(get-info :version)

(assert (=> b!229586 (= e!148944 ((_ is Undefined!891) lt!115521))))

(declare-fun b!229587 () Bool)

(declare-fun e!148954 () Bool)

(declare-fun call!21311 () Bool)

(assert (=> b!229587 (= e!148954 (not call!21311))))

(declare-fun b!229588 () Bool)

(declare-fun e!148951 () Bool)

(assert (=> b!229588 (= e!148951 (not call!21311))))

(declare-fun b!229589 () Bool)

(declare-fun res!112994 () Bool)

(declare-fun e!148956 () Bool)

(assert (=> b!229589 (=> res!112994 e!148956)))

(declare-datatypes ((V!7681 0))(
  ( (V!7682 (val!3057 Int)) )
))
(declare-datatypes ((ValueCell!2669 0))(
  ( (ValueCellFull!2669 (v!5078 V!7681)) (EmptyCell!2669) )
))
(declare-datatypes ((array!11291 0))(
  ( (array!11292 (arr!5365 (Array (_ BitVec 32) ValueCell!2669)) (size!5698 (_ BitVec 32))) )
))
(declare-datatypes ((array!11293 0))(
  ( (array!11294 (arr!5366 (Array (_ BitVec 32) (_ BitVec 64))) (size!5699 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3238 0))(
  ( (LongMapFixedSize!3239 (defaultEntry!4278 Int) (mask!10160 (_ BitVec 32)) (extraKeys!4015 (_ BitVec 32)) (zeroValue!4119 V!7681) (minValue!4119 V!7681) (_size!1668 (_ BitVec 32)) (_keys!6332 array!11293) (_values!4261 array!11291) (_vacant!1668 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3238)

(assert (=> b!229589 (= res!112994 (or (not (= (size!5698 (_values!4261 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10160 thiss!1504)))) (not (= (size!5699 (_keys!6332 thiss!1504)) (size!5698 (_values!4261 thiss!1504)))) (bvslt (mask!10160 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4015 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4015 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!229590 () Bool)

(declare-fun res!112996 () Bool)

(assert (=> b!229590 (=> res!112996 e!148956)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11293 (_ BitVec 32)) Bool)

(assert (=> b!229590 (= res!112996 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6332 thiss!1504) (mask!10160 thiss!1504))))))

(declare-fun b!229591 () Bool)

(declare-fun c!38086 () Bool)

(assert (=> b!229591 (= c!38086 ((_ is MissingVacant!891) lt!115521))))

(declare-fun e!148958 () Bool)

(assert (=> b!229591 (= e!148958 e!148944)))

(declare-fun b!229592 () Bool)

(assert (=> b!229592 (= e!148956 true)))

(declare-fun lt!115518 () Bool)

(declare-datatypes ((List!3351 0))(
  ( (Nil!3348) (Cons!3347 (h!3995 (_ BitVec 64)) (t!8302 List!3351)) )
))
(declare-fun arrayNoDuplicates!0 (array!11293 (_ BitVec 32) List!3351) Bool)

(assert (=> b!229592 (= lt!115518 (arrayNoDuplicates!0 (_keys!6332 thiss!1504) #b00000000000000000000000000000000 Nil!3348))))

(declare-fun e!148948 () Bool)

(declare-fun e!148955 () Bool)

(declare-fun tp_is_empty!6025 () Bool)

(declare-fun array_inv!3525 (array!11293) Bool)

(declare-fun array_inv!3526 (array!11291) Bool)

(assert (=> b!229593 (= e!148948 (and tp!21630 tp_is_empty!6025 (array_inv!3525 (_keys!6332 thiss!1504)) (array_inv!3526 (_values!4261 thiss!1504)) e!148955))))

(declare-fun mapNonEmpty!10207 () Bool)

(declare-fun mapRes!10207 () Bool)

(declare-fun tp!21631 () Bool)

(declare-fun e!148947 () Bool)

(assert (=> mapNonEmpty!10207 (= mapRes!10207 (and tp!21631 e!148947))))

(declare-fun mapRest!10207 () (Array (_ BitVec 32) ValueCell!2669))

(declare-fun mapValue!10207 () ValueCell!2669)

(declare-fun mapKey!10207 () (_ BitVec 32))

(assert (=> mapNonEmpty!10207 (= (arr!5365 (_values!4261 thiss!1504)) (store mapRest!10207 mapKey!10207 mapValue!10207))))

(declare-fun b!229594 () Bool)

(declare-datatypes ((Unit!6984 0))(
  ( (Unit!6985) )
))
(declare-fun e!148953 () Unit!6984)

(declare-fun Unit!6986 () Unit!6984)

(assert (=> b!229594 (= e!148953 Unit!6986)))

(declare-fun lt!115513 () Unit!6984)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!284 (array!11293 array!11291 (_ BitVec 32) (_ BitVec 32) V!7681 V!7681 (_ BitVec 64) Int) Unit!6984)

(assert (=> b!229594 (= lt!115513 (lemmaInListMapThenSeekEntryOrOpenFindsIt!284 (_keys!6332 thiss!1504) (_values!4261 thiss!1504) (mask!10160 thiss!1504) (extraKeys!4015 thiss!1504) (zeroValue!4119 thiss!1504) (minValue!4119 thiss!1504) key!932 (defaultEntry!4278 thiss!1504)))))

(assert (=> b!229594 false))

(declare-fun b!229596 () Bool)

(declare-fun res!112993 () Bool)

(assert (=> b!229596 (= res!112993 (= (select (arr!5366 (_keys!6332 thiss!1504)) (index!5737 lt!115521)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!229596 (=> (not res!112993) (not e!148951))))

(declare-fun b!229597 () Bool)

(declare-fun e!148952 () Bool)

(assert (=> b!229597 (= e!148952 tp_is_empty!6025)))

(declare-fun b!229598 () Bool)

(declare-fun res!112987 () Bool)

(assert (=> b!229598 (=> (not res!112987) (not e!148954))))

(assert (=> b!229598 (= res!112987 (= (select (arr!5366 (_keys!6332 thiss!1504)) (index!5734 lt!115521)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!229599 () Bool)

(declare-fun e!148949 () Bool)

(declare-fun e!148957 () Bool)

(assert (=> b!229599 (= e!148949 e!148957)))

(declare-fun res!112989 () Bool)

(assert (=> b!229599 (=> (not res!112989) (not e!148957))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229599 (= res!112989 (inRange!0 index!297 (mask!10160 thiss!1504)))))

(declare-fun lt!115514 () Unit!6984)

(assert (=> b!229599 (= lt!115514 e!148953)))

(declare-fun c!38088 () Bool)

(declare-datatypes ((tuple2!4436 0))(
  ( (tuple2!4437 (_1!2229 (_ BitVec 64)) (_2!2229 V!7681)) )
))
(declare-datatypes ((List!3352 0))(
  ( (Nil!3349) (Cons!3348 (h!3996 tuple2!4436) (t!8303 List!3352)) )
))
(declare-datatypes ((ListLongMap!3351 0))(
  ( (ListLongMap!3352 (toList!1691 List!3352)) )
))
(declare-fun contains!1580 (ListLongMap!3351 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1223 (array!11293 array!11291 (_ BitVec 32) (_ BitVec 32) V!7681 V!7681 (_ BitVec 32) Int) ListLongMap!3351)

(assert (=> b!229599 (= c!38088 (contains!1580 (getCurrentListMap!1223 (_keys!6332 thiss!1504) (_values!4261 thiss!1504) (mask!10160 thiss!1504) (extraKeys!4015 thiss!1504) (zeroValue!4119 thiss!1504) (minValue!4119 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4278 thiss!1504)) key!932))))

(declare-fun b!229600 () Bool)

(declare-fun lt!115515 () Unit!6984)

(assert (=> b!229600 (= e!148953 lt!115515)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!276 (array!11293 array!11291 (_ BitVec 32) (_ BitVec 32) V!7681 V!7681 (_ BitVec 64) Int) Unit!6984)

(assert (=> b!229600 (= lt!115515 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!276 (_keys!6332 thiss!1504) (_values!4261 thiss!1504) (mask!10160 thiss!1504) (extraKeys!4015 thiss!1504) (zeroValue!4119 thiss!1504) (minValue!4119 thiss!1504) key!932 (defaultEntry!4278 thiss!1504)))))

(declare-fun c!38089 () Bool)

(assert (=> b!229600 (= c!38089 ((_ is MissingZero!891) lt!115521))))

(assert (=> b!229600 e!148958))

(declare-fun b!229601 () Bool)

(assert (=> b!229601 (= e!148944 e!148951)))

(declare-fun res!112986 () Bool)

(declare-fun call!21312 () Bool)

(assert (=> b!229601 (= res!112986 call!21312)))

(assert (=> b!229601 (=> (not res!112986) (not e!148951))))

(declare-fun b!229602 () Bool)

(assert (=> b!229602 (= e!148947 tp_is_empty!6025)))

(declare-fun res!112992 () Bool)

(declare-fun e!148945 () Bool)

(assert (=> start!22100 (=> (not res!112992) (not e!148945))))

(declare-fun valid!1301 (LongMapFixedSize!3238) Bool)

(assert (=> start!22100 (= res!112992 (valid!1301 thiss!1504))))

(assert (=> start!22100 e!148945))

(assert (=> start!22100 e!148948))

(assert (=> start!22100 true))

(declare-fun b!229595 () Bool)

(assert (=> b!229595 (= e!148957 (not e!148956))))

(declare-fun res!112990 () Bool)

(assert (=> b!229595 (=> res!112990 e!148956)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!229595 (= res!112990 (not (validMask!0 (mask!10160 thiss!1504))))))

(declare-fun lt!115522 () array!11293)

(assert (=> b!229595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115522 (mask!10160 thiss!1504))))

(declare-fun lt!115520 () Unit!6984)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11293 (_ BitVec 32) (_ BitVec 32)) Unit!6984)

(assert (=> b!229595 (= lt!115520 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6332 thiss!1504) index!297 (mask!10160 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11293 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!229595 (= (arrayCountValidKeys!0 lt!115522 #b00000000000000000000000000000000 (size!5699 (_keys!6332 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6332 thiss!1504) #b00000000000000000000000000000000 (size!5699 (_keys!6332 thiss!1504)))))))

(declare-fun lt!115517 () Unit!6984)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11293 (_ BitVec 32) (_ BitVec 64)) Unit!6984)

(assert (=> b!229595 (= lt!115517 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6332 thiss!1504) index!297 key!932))))

(assert (=> b!229595 (arrayNoDuplicates!0 lt!115522 #b00000000000000000000000000000000 Nil!3348)))

(assert (=> b!229595 (= lt!115522 (array!11294 (store (arr!5366 (_keys!6332 thiss!1504)) index!297 key!932) (size!5699 (_keys!6332 thiss!1504))))))

(declare-fun lt!115512 () Unit!6984)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11293 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3351) Unit!6984)

(assert (=> b!229595 (= lt!115512 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6332 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3348))))

(declare-fun lt!115516 () Unit!6984)

(declare-fun e!148946 () Unit!6984)

(assert (=> b!229595 (= lt!115516 e!148946)))

(declare-fun c!38087 () Bool)

(declare-fun arrayContainsKey!0 (array!11293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229595 (= c!38087 (arrayContainsKey!0 (_keys!6332 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229603 () Bool)

(declare-fun Unit!6987 () Unit!6984)

(assert (=> b!229603 (= e!148946 Unit!6987)))

(declare-fun b!229604 () Bool)

(declare-fun res!112988 () Bool)

(assert (=> b!229604 (=> (not res!112988) (not e!148945))))

(assert (=> b!229604 (= res!112988 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!229605 () Bool)

(assert (=> b!229605 (= e!148955 (and e!148952 mapRes!10207))))

(declare-fun condMapEmpty!10207 () Bool)

(declare-fun mapDefault!10207 () ValueCell!2669)

(assert (=> b!229605 (= condMapEmpty!10207 (= (arr!5365 (_values!4261 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2669)) mapDefault!10207)))))

(declare-fun b!229606 () Bool)

(assert (=> b!229606 (= e!148945 e!148949)))

(declare-fun res!112995 () Bool)

(assert (=> b!229606 (=> (not res!112995) (not e!148949))))

(assert (=> b!229606 (= res!112995 (or (= lt!115521 (MissingZero!891 index!297)) (= lt!115521 (MissingVacant!891 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11293 (_ BitVec 32)) SeekEntryResult!891)

(assert (=> b!229606 (= lt!115521 (seekEntryOrOpen!0 key!932 (_keys!6332 thiss!1504) (mask!10160 thiss!1504)))))

(declare-fun bm!21308 () Bool)

(assert (=> bm!21308 (= call!21312 (inRange!0 (ite c!38089 (index!5734 lt!115521) (index!5737 lt!115521)) (mask!10160 thiss!1504)))))

(declare-fun mapIsEmpty!10207 () Bool)

(assert (=> mapIsEmpty!10207 mapRes!10207))

(declare-fun bm!21309 () Bool)

(assert (=> bm!21309 (= call!21311 (arrayContainsKey!0 (_keys!6332 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229607 () Bool)

(declare-fun res!112991 () Bool)

(assert (=> b!229607 (=> (not res!112991) (not e!148954))))

(assert (=> b!229607 (= res!112991 call!21312)))

(assert (=> b!229607 (= e!148958 e!148954)))

(declare-fun b!229608 () Bool)

(declare-fun Unit!6988 () Unit!6984)

(assert (=> b!229608 (= e!148946 Unit!6988)))

(declare-fun lt!115519 () Unit!6984)

(declare-fun lemmaArrayContainsKeyThenInListMap!122 (array!11293 array!11291 (_ BitVec 32) (_ BitVec 32) V!7681 V!7681 (_ BitVec 64) (_ BitVec 32) Int) Unit!6984)

(assert (=> b!229608 (= lt!115519 (lemmaArrayContainsKeyThenInListMap!122 (_keys!6332 thiss!1504) (_values!4261 thiss!1504) (mask!10160 thiss!1504) (extraKeys!4015 thiss!1504) (zeroValue!4119 thiss!1504) (minValue!4119 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4278 thiss!1504)))))

(assert (=> b!229608 false))

(assert (= (and start!22100 res!112992) b!229604))

(assert (= (and b!229604 res!112988) b!229606))

(assert (= (and b!229606 res!112995) b!229599))

(assert (= (and b!229599 c!38088) b!229594))

(assert (= (and b!229599 (not c!38088)) b!229600))

(assert (= (and b!229600 c!38089) b!229607))

(assert (= (and b!229600 (not c!38089)) b!229591))

(assert (= (and b!229607 res!112991) b!229598))

(assert (= (and b!229598 res!112987) b!229587))

(assert (= (and b!229591 c!38086) b!229601))

(assert (= (and b!229591 (not c!38086)) b!229586))

(assert (= (and b!229601 res!112986) b!229596))

(assert (= (and b!229596 res!112993) b!229588))

(assert (= (or b!229607 b!229601) bm!21308))

(assert (= (or b!229587 b!229588) bm!21309))

(assert (= (and b!229599 res!112989) b!229595))

(assert (= (and b!229595 c!38087) b!229608))

(assert (= (and b!229595 (not c!38087)) b!229603))

(assert (= (and b!229595 (not res!112990)) b!229589))

(assert (= (and b!229589 (not res!112994)) b!229590))

(assert (= (and b!229590 (not res!112996)) b!229592))

(assert (= (and b!229605 condMapEmpty!10207) mapIsEmpty!10207))

(assert (= (and b!229605 (not condMapEmpty!10207)) mapNonEmpty!10207))

(assert (= (and mapNonEmpty!10207 ((_ is ValueCellFull!2669) mapValue!10207)) b!229602))

(assert (= (and b!229605 ((_ is ValueCellFull!2669) mapDefault!10207)) b!229597))

(assert (= b!229593 b!229605))

(assert (= start!22100 b!229593))

(declare-fun m!251209 () Bool)

(assert (=> b!229593 m!251209))

(declare-fun m!251211 () Bool)

(assert (=> b!229593 m!251211))

(declare-fun m!251213 () Bool)

(assert (=> b!229590 m!251213))

(declare-fun m!251215 () Bool)

(assert (=> b!229594 m!251215))

(declare-fun m!251217 () Bool)

(assert (=> b!229595 m!251217))

(declare-fun m!251219 () Bool)

(assert (=> b!229595 m!251219))

(declare-fun m!251221 () Bool)

(assert (=> b!229595 m!251221))

(declare-fun m!251223 () Bool)

(assert (=> b!229595 m!251223))

(declare-fun m!251225 () Bool)

(assert (=> b!229595 m!251225))

(declare-fun m!251227 () Bool)

(assert (=> b!229595 m!251227))

(declare-fun m!251229 () Bool)

(assert (=> b!229595 m!251229))

(declare-fun m!251231 () Bool)

(assert (=> b!229595 m!251231))

(declare-fun m!251233 () Bool)

(assert (=> b!229595 m!251233))

(declare-fun m!251235 () Bool)

(assert (=> b!229595 m!251235))

(declare-fun m!251237 () Bool)

(assert (=> start!22100 m!251237))

(declare-fun m!251239 () Bool)

(assert (=> bm!21308 m!251239))

(declare-fun m!251241 () Bool)

(assert (=> b!229600 m!251241))

(declare-fun m!251243 () Bool)

(assert (=> b!229606 m!251243))

(declare-fun m!251245 () Bool)

(assert (=> b!229596 m!251245))

(assert (=> bm!21309 m!251219))

(declare-fun m!251247 () Bool)

(assert (=> b!229599 m!251247))

(declare-fun m!251249 () Bool)

(assert (=> b!229599 m!251249))

(assert (=> b!229599 m!251249))

(declare-fun m!251251 () Bool)

(assert (=> b!229599 m!251251))

(declare-fun m!251253 () Bool)

(assert (=> b!229608 m!251253))

(declare-fun m!251255 () Bool)

(assert (=> b!229598 m!251255))

(declare-fun m!251257 () Bool)

(assert (=> mapNonEmpty!10207 m!251257))

(declare-fun m!251259 () Bool)

(assert (=> b!229592 m!251259))

(check-sat (not b_next!6163) (not b!229608) (not b!229592) (not bm!21308) (not b!229595) (not start!22100) (not b!229606) (not mapNonEmpty!10207) (not b!229593) (not b!229600) tp_is_empty!6025 b_and!13075 (not b!229590) (not b!229594) (not b!229599) (not bm!21309))
(check-sat b_and!13075 (not b_next!6163))
