; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22106 () Bool)

(assert start!22106)

(declare-fun b!229611 () Bool)

(declare-fun b_free!6169 () Bool)

(declare-fun b_next!6169 () Bool)

(assert (=> b!229611 (= b_free!6169 (not b_next!6169))))

(declare-fun tp!21648 () Bool)

(declare-fun b_and!13041 () Bool)

(assert (=> b!229611 (= tp!21648 b_and!13041)))

(declare-fun b!229593 () Bool)

(declare-fun e!148953 () Bool)

(assert (=> b!229593 (= e!148953 (not true))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7689 0))(
  ( (V!7690 (val!3060 Int)) )
))
(declare-fun v!346 () V!7689)

(declare-datatypes ((tuple2!4488 0))(
  ( (tuple2!4489 (_1!2255 (_ BitVec 64)) (_2!2255 V!7689)) )
))
(declare-datatypes ((List!3426 0))(
  ( (Nil!3423) (Cons!3422 (h!4070 tuple2!4488) (t!8376 List!3426)) )
))
(declare-datatypes ((ListLongMap!3391 0))(
  ( (ListLongMap!3392 (toList!1711 List!3426)) )
))
(declare-fun lt!115375 () ListLongMap!3391)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((ValueCell!2672 0))(
  ( (ValueCellFull!2672 (v!5074 V!7689)) (EmptyCell!2672) )
))
(declare-datatypes ((array!11297 0))(
  ( (array!11298 (arr!5367 (Array (_ BitVec 32) ValueCell!2672)) (size!5701 (_ BitVec 32))) )
))
(declare-datatypes ((array!11299 0))(
  ( (array!11300 (arr!5368 (Array (_ BitVec 32) (_ BitVec 64))) (size!5702 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3244 0))(
  ( (LongMapFixedSize!3245 (defaultEntry!4281 Int) (mask!10164 (_ BitVec 32)) (extraKeys!4018 (_ BitVec 32)) (zeroValue!4122 V!7689) (minValue!4122 V!7689) (_size!1671 (_ BitVec 32)) (_keys!6334 array!11299) (_values!4264 array!11297) (_vacant!1671 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3244)

(declare-fun lt!115383 () array!11299)

(declare-fun +!597 (ListLongMap!3391 tuple2!4488) ListLongMap!3391)

(declare-fun getCurrentListMap!1220 (array!11299 array!11297 (_ BitVec 32) (_ BitVec 32) V!7689 V!7689 (_ BitVec 32) Int) ListLongMap!3391)

(assert (=> b!229593 (= (+!597 lt!115375 (tuple2!4489 key!932 v!346)) (getCurrentListMap!1220 lt!115383 (array!11298 (store (arr!5367 (_values!4264 thiss!1504)) index!297 (ValueCellFull!2672 v!346)) (size!5701 (_values!4264 thiss!1504))) (mask!10164 thiss!1504) (extraKeys!4018 thiss!1504) (zeroValue!4122 thiss!1504) (minValue!4122 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4281 thiss!1504)))))

(declare-datatypes ((Unit!6983 0))(
  ( (Unit!6984) )
))
(declare-fun lt!115379 () Unit!6983)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!52 (array!11299 array!11297 (_ BitVec 32) (_ BitVec 32) V!7689 V!7689 (_ BitVec 32) (_ BitVec 64) V!7689 Int) Unit!6983)

(assert (=> b!229593 (= lt!115379 (lemmaAddValidKeyToArrayThenAddPairToListMap!52 (_keys!6334 thiss!1504) (_values!4264 thiss!1504) (mask!10164 thiss!1504) (extraKeys!4018 thiss!1504) (zeroValue!4122 thiss!1504) (minValue!4122 thiss!1504) index!297 key!932 v!346 (defaultEntry!4281 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11299 (_ BitVec 32)) Bool)

(assert (=> b!229593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115383 (mask!10164 thiss!1504))))

(declare-fun lt!115384 () Unit!6983)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11299 (_ BitVec 32) (_ BitVec 32)) Unit!6983)

(assert (=> b!229593 (= lt!115384 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6334 thiss!1504) index!297 (mask!10164 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11299 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!229593 (= (arrayCountValidKeys!0 lt!115383 #b00000000000000000000000000000000 (size!5702 (_keys!6334 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6334 thiss!1504) #b00000000000000000000000000000000 (size!5702 (_keys!6334 thiss!1504)))))))

(declare-fun lt!115373 () Unit!6983)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11299 (_ BitVec 32) (_ BitVec 64)) Unit!6983)

(assert (=> b!229593 (= lt!115373 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6334 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3427 0))(
  ( (Nil!3424) (Cons!3423 (h!4071 (_ BitVec 64)) (t!8377 List!3427)) )
))
(declare-fun arrayNoDuplicates!0 (array!11299 (_ BitVec 32) List!3427) Bool)

(assert (=> b!229593 (arrayNoDuplicates!0 lt!115383 #b00000000000000000000000000000000 Nil!3424)))

(assert (=> b!229593 (= lt!115383 (array!11300 (store (arr!5368 (_keys!6334 thiss!1504)) index!297 key!932) (size!5702 (_keys!6334 thiss!1504))))))

(declare-fun lt!115376 () Unit!6983)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11299 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3427) Unit!6983)

(assert (=> b!229593 (= lt!115376 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6334 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3424))))

(declare-fun lt!115382 () Unit!6983)

(declare-fun e!148958 () Unit!6983)

(assert (=> b!229593 (= lt!115382 e!148958)))

(declare-fun c!38085 () Bool)

(declare-fun arrayContainsKey!0 (array!11299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229593 (= c!38085 (arrayContainsKey!0 (_keys!6334 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229594 () Bool)

(declare-fun e!148954 () Bool)

(declare-fun tp_is_empty!6031 () Bool)

(assert (=> b!229594 (= e!148954 tp_is_empty!6031)))

(declare-fun b!229595 () Bool)

(declare-fun res!112967 () Bool)

(declare-fun e!148964 () Bool)

(assert (=> b!229595 (=> (not res!112967) (not e!148964))))

(assert (=> b!229595 (= res!112967 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((SeekEntryResult!923 0))(
  ( (MissingZero!923 (index!5862 (_ BitVec 32))) (Found!923 (index!5863 (_ BitVec 32))) (Intermediate!923 (undefined!1735 Bool) (index!5864 (_ BitVec 32)) (x!23398 (_ BitVec 32))) (Undefined!923) (MissingVacant!923 (index!5865 (_ BitVec 32))) )
))
(declare-fun lt!115381 () SeekEntryResult!923)

(declare-fun c!38084 () Bool)

(declare-fun bm!21314 () Bool)

(declare-fun call!21318 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21314 (= call!21318 (inRange!0 (ite c!38084 (index!5862 lt!115381) (index!5865 lt!115381)) (mask!10164 thiss!1504)))))

(declare-fun bm!21315 () Bool)

(declare-fun call!21317 () Bool)

(assert (=> bm!21315 (= call!21317 (arrayContainsKey!0 (_keys!6334 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229596 () Bool)

(declare-fun res!112965 () Bool)

(declare-fun e!148961 () Bool)

(assert (=> b!229596 (=> (not res!112965) (not e!148961))))

(assert (=> b!229596 (= res!112965 call!21318)))

(declare-fun e!148952 () Bool)

(assert (=> b!229596 (= e!148952 e!148961)))

(declare-fun b!229597 () Bool)

(declare-fun e!148957 () Bool)

(assert (=> b!229597 (= e!148964 e!148957)))

(declare-fun res!112969 () Bool)

(assert (=> b!229597 (=> (not res!112969) (not e!148957))))

(assert (=> b!229597 (= res!112969 (or (= lt!115381 (MissingZero!923 index!297)) (= lt!115381 (MissingVacant!923 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11299 (_ BitVec 32)) SeekEntryResult!923)

(assert (=> b!229597 (= lt!115381 (seekEntryOrOpen!0 key!932 (_keys!6334 thiss!1504) (mask!10164 thiss!1504)))))

(declare-fun b!229598 () Bool)

(declare-fun res!112964 () Bool)

(assert (=> b!229598 (=> (not res!112964) (not e!148961))))

(assert (=> b!229598 (= res!112964 (= (select (arr!5368 (_keys!6334 thiss!1504)) (index!5862 lt!115381)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!229599 () Bool)

(declare-fun Unit!6985 () Unit!6983)

(assert (=> b!229599 (= e!148958 Unit!6985)))

(declare-fun mapNonEmpty!10216 () Bool)

(declare-fun mapRes!10216 () Bool)

(declare-fun tp!21649 () Bool)

(assert (=> mapNonEmpty!10216 (= mapRes!10216 (and tp!21649 e!148954))))

(declare-fun mapKey!10216 () (_ BitVec 32))

(declare-fun mapValue!10216 () ValueCell!2672)

(declare-fun mapRest!10216 () (Array (_ BitVec 32) ValueCell!2672))

(assert (=> mapNonEmpty!10216 (= (arr!5367 (_values!4264 thiss!1504)) (store mapRest!10216 mapKey!10216 mapValue!10216))))

(declare-fun b!229600 () Bool)

(declare-fun Unit!6986 () Unit!6983)

(assert (=> b!229600 (= e!148958 Unit!6986)))

(declare-fun lt!115380 () Unit!6983)

(declare-fun lemmaArrayContainsKeyThenInListMap!123 (array!11299 array!11297 (_ BitVec 32) (_ BitVec 32) V!7689 V!7689 (_ BitVec 64) (_ BitVec 32) Int) Unit!6983)

(assert (=> b!229600 (= lt!115380 (lemmaArrayContainsKeyThenInListMap!123 (_keys!6334 thiss!1504) (_values!4264 thiss!1504) (mask!10164 thiss!1504) (extraKeys!4018 thiss!1504) (zeroValue!4122 thiss!1504) (minValue!4122 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4281 thiss!1504)))))

(assert (=> b!229600 false))

(declare-fun b!229601 () Bool)

(declare-fun e!148959 () Bool)

(assert (=> b!229601 (= e!148959 (not call!21317))))

(declare-fun b!229602 () Bool)

(declare-fun e!148955 () Bool)

(declare-fun e!148956 () Bool)

(assert (=> b!229602 (= e!148955 (and e!148956 mapRes!10216))))

(declare-fun condMapEmpty!10216 () Bool)

(declare-fun mapDefault!10216 () ValueCell!2672)

(assert (=> b!229602 (= condMapEmpty!10216 (= (arr!5367 (_values!4264 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2672)) mapDefault!10216)))))

(declare-fun b!229603 () Bool)

(assert (=> b!229603 (= e!148956 tp_is_empty!6031)))

(declare-fun b!229604 () Bool)

(declare-fun res!112970 () Bool)

(assert (=> b!229604 (= res!112970 (= (select (arr!5368 (_keys!6334 thiss!1504)) (index!5865 lt!115381)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!229604 (=> (not res!112970) (not e!148959))))

(declare-fun b!229605 () Bool)

(assert (=> b!229605 (= e!148961 (not call!21317))))

(declare-fun b!229606 () Bool)

(declare-fun e!148965 () Bool)

(get-info :version)

(assert (=> b!229606 (= e!148965 ((_ is Undefined!923) lt!115381))))

(declare-fun b!229607 () Bool)

(declare-fun c!38083 () Bool)

(assert (=> b!229607 (= c!38083 ((_ is MissingVacant!923) lt!115381))))

(assert (=> b!229607 (= e!148952 e!148965)))

(declare-fun mapIsEmpty!10216 () Bool)

(assert (=> mapIsEmpty!10216 mapRes!10216))

(declare-fun b!229608 () Bool)

(assert (=> b!229608 (= e!148965 e!148959)))

(declare-fun res!112966 () Bool)

(assert (=> b!229608 (= res!112966 call!21318)))

(assert (=> b!229608 (=> (not res!112966) (not e!148959))))

(declare-fun b!229609 () Bool)

(declare-fun e!148963 () Unit!6983)

(declare-fun Unit!6987 () Unit!6983)

(assert (=> b!229609 (= e!148963 Unit!6987)))

(declare-fun lt!115377 () Unit!6983)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!283 (array!11299 array!11297 (_ BitVec 32) (_ BitVec 32) V!7689 V!7689 (_ BitVec 64) Int) Unit!6983)

(assert (=> b!229609 (= lt!115377 (lemmaInListMapThenSeekEntryOrOpenFindsIt!283 (_keys!6334 thiss!1504) (_values!4264 thiss!1504) (mask!10164 thiss!1504) (extraKeys!4018 thiss!1504) (zeroValue!4122 thiss!1504) (minValue!4122 thiss!1504) key!932 (defaultEntry!4281 thiss!1504)))))

(assert (=> b!229609 false))

(declare-fun b!229610 () Bool)

(declare-fun lt!115378 () Unit!6983)

(assert (=> b!229610 (= e!148963 lt!115378)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!279 (array!11299 array!11297 (_ BitVec 32) (_ BitVec 32) V!7689 V!7689 (_ BitVec 64) Int) Unit!6983)

(assert (=> b!229610 (= lt!115378 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!279 (_keys!6334 thiss!1504) (_values!4264 thiss!1504) (mask!10164 thiss!1504) (extraKeys!4018 thiss!1504) (zeroValue!4122 thiss!1504) (minValue!4122 thiss!1504) key!932 (defaultEntry!4281 thiss!1504)))))

(assert (=> b!229610 (= c!38084 ((_ is MissingZero!923) lt!115381))))

(assert (=> b!229610 e!148952))

(declare-fun e!148960 () Bool)

(declare-fun array_inv!3539 (array!11299) Bool)

(declare-fun array_inv!3540 (array!11297) Bool)

(assert (=> b!229611 (= e!148960 (and tp!21648 tp_is_empty!6031 (array_inv!3539 (_keys!6334 thiss!1504)) (array_inv!3540 (_values!4264 thiss!1504)) e!148955))))

(declare-fun b!229612 () Bool)

(assert (=> b!229612 (= e!148957 e!148953)))

(declare-fun res!112963 () Bool)

(assert (=> b!229612 (=> (not res!112963) (not e!148953))))

(assert (=> b!229612 (= res!112963 (inRange!0 index!297 (mask!10164 thiss!1504)))))

(declare-fun lt!115374 () Unit!6983)

(assert (=> b!229612 (= lt!115374 e!148963)))

(declare-fun c!38086 () Bool)

(declare-fun contains!1586 (ListLongMap!3391 (_ BitVec 64)) Bool)

(assert (=> b!229612 (= c!38086 (contains!1586 lt!115375 key!932))))

(assert (=> b!229612 (= lt!115375 (getCurrentListMap!1220 (_keys!6334 thiss!1504) (_values!4264 thiss!1504) (mask!10164 thiss!1504) (extraKeys!4018 thiss!1504) (zeroValue!4122 thiss!1504) (minValue!4122 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4281 thiss!1504)))))

(declare-fun res!112968 () Bool)

(assert (=> start!22106 (=> (not res!112968) (not e!148964))))

(declare-fun valid!1306 (LongMapFixedSize!3244) Bool)

(assert (=> start!22106 (= res!112968 (valid!1306 thiss!1504))))

(assert (=> start!22106 e!148964))

(assert (=> start!22106 e!148960))

(assert (=> start!22106 true))

(assert (=> start!22106 tp_is_empty!6031))

(assert (= (and start!22106 res!112968) b!229595))

(assert (= (and b!229595 res!112967) b!229597))

(assert (= (and b!229597 res!112969) b!229612))

(assert (= (and b!229612 c!38086) b!229609))

(assert (= (and b!229612 (not c!38086)) b!229610))

(assert (= (and b!229610 c!38084) b!229596))

(assert (= (and b!229610 (not c!38084)) b!229607))

(assert (= (and b!229596 res!112965) b!229598))

(assert (= (and b!229598 res!112964) b!229605))

(assert (= (and b!229607 c!38083) b!229608))

(assert (= (and b!229607 (not c!38083)) b!229606))

(assert (= (and b!229608 res!112966) b!229604))

(assert (= (and b!229604 res!112970) b!229601))

(assert (= (or b!229596 b!229608) bm!21314))

(assert (= (or b!229605 b!229601) bm!21315))

(assert (= (and b!229612 res!112963) b!229593))

(assert (= (and b!229593 c!38085) b!229600))

(assert (= (and b!229593 (not c!38085)) b!229599))

(assert (= (and b!229602 condMapEmpty!10216) mapIsEmpty!10216))

(assert (= (and b!229602 (not condMapEmpty!10216)) mapNonEmpty!10216))

(assert (= (and mapNonEmpty!10216 ((_ is ValueCellFull!2672) mapValue!10216)) b!229594))

(assert (= (and b!229602 ((_ is ValueCellFull!2672) mapDefault!10216)) b!229603))

(assert (= b!229611 b!229602))

(assert (= start!22106 b!229611))

(declare-fun m!250567 () Bool)

(assert (=> bm!21314 m!250567))

(declare-fun m!250569 () Bool)

(assert (=> start!22106 m!250569))

(declare-fun m!250571 () Bool)

(assert (=> b!229598 m!250571))

(declare-fun m!250573 () Bool)

(assert (=> b!229604 m!250573))

(declare-fun m!250575 () Bool)

(assert (=> mapNonEmpty!10216 m!250575))

(declare-fun m!250577 () Bool)

(assert (=> b!229600 m!250577))

(declare-fun m!250579 () Bool)

(assert (=> b!229597 m!250579))

(declare-fun m!250581 () Bool)

(assert (=> b!229609 m!250581))

(declare-fun m!250583 () Bool)

(assert (=> b!229611 m!250583))

(declare-fun m!250585 () Bool)

(assert (=> b!229611 m!250585))

(declare-fun m!250587 () Bool)

(assert (=> b!229612 m!250587))

(declare-fun m!250589 () Bool)

(assert (=> b!229612 m!250589))

(declare-fun m!250591 () Bool)

(assert (=> b!229612 m!250591))

(declare-fun m!250593 () Bool)

(assert (=> bm!21315 m!250593))

(declare-fun m!250595 () Bool)

(assert (=> b!229610 m!250595))

(assert (=> b!229593 m!250593))

(declare-fun m!250597 () Bool)

(assert (=> b!229593 m!250597))

(declare-fun m!250599 () Bool)

(assert (=> b!229593 m!250599))

(declare-fun m!250601 () Bool)

(assert (=> b!229593 m!250601))

(declare-fun m!250603 () Bool)

(assert (=> b!229593 m!250603))

(declare-fun m!250605 () Bool)

(assert (=> b!229593 m!250605))

(declare-fun m!250607 () Bool)

(assert (=> b!229593 m!250607))

(declare-fun m!250609 () Bool)

(assert (=> b!229593 m!250609))

(declare-fun m!250611 () Bool)

(assert (=> b!229593 m!250611))

(declare-fun m!250613 () Bool)

(assert (=> b!229593 m!250613))

(declare-fun m!250615 () Bool)

(assert (=> b!229593 m!250615))

(declare-fun m!250617 () Bool)

(assert (=> b!229593 m!250617))

(declare-fun m!250619 () Bool)

(assert (=> b!229593 m!250619))

(check-sat (not bm!21314) tp_is_empty!6031 (not b!229612) (not b!229597) (not start!22106) (not b!229600) (not b!229593) (not mapNonEmpty!10216) b_and!13041 (not b!229611) (not b_next!6169) (not b!229610) (not b!229609) (not bm!21315))
(check-sat b_and!13041 (not b_next!6169))
