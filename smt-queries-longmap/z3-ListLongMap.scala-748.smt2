; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17458 () Bool)

(assert start!17458)

(declare-fun b!175053 () Bool)

(declare-fun b_free!4329 () Bool)

(declare-fun b_next!4329 () Bool)

(assert (=> b!175053 (= b_free!4329 (not b_next!4329))))

(declare-fun tp!15662 () Bool)

(declare-fun b_and!10803 () Bool)

(assert (=> b!175053 (= tp!15662 b_and!10803)))

(declare-fun b!175052 () Bool)

(declare-fun res!83005 () Bool)

(declare-fun e!115573 () Bool)

(assert (=> b!175052 (=> (not res!83005) (not e!115573))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5115 0))(
  ( (V!5116 (val!2095 Int)) )
))
(declare-datatypes ((ValueCell!1707 0))(
  ( (ValueCellFull!1707 (v!3968 V!5115)) (EmptyCell!1707) )
))
(declare-datatypes ((array!7339 0))(
  ( (array!7340 (arr!3485 (Array (_ BitVec 32) (_ BitVec 64))) (size!3786 (_ BitVec 32))) )
))
(declare-datatypes ((array!7341 0))(
  ( (array!7342 (arr!3486 (Array (_ BitVec 32) ValueCell!1707)) (size!3787 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2322 0))(
  ( (LongMapFixedSize!2323 (defaultEntry!3614 Int) (mask!8503 (_ BitVec 32)) (extraKeys!3351 (_ BitVec 32)) (zeroValue!3455 V!5115) (minValue!3455 V!5115) (_size!1210 (_ BitVec 32)) (_keys!5462 array!7339) (_values!3597 array!7341) (_vacant!1210 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2322)

(get-info :version)

(declare-datatypes ((SeekEntryResult!549 0))(
  ( (MissingZero!549 (index!4364 (_ BitVec 32))) (Found!549 (index!4365 (_ BitVec 32))) (Intermediate!549 (undefined!1361 Bool) (index!4366 (_ BitVec 32)) (x!19263 (_ BitVec 32))) (Undefined!549) (MissingVacant!549 (index!4367 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7339 (_ BitVec 32)) SeekEntryResult!549)

(assert (=> b!175052 (= res!83005 ((_ is Undefined!549) (seekEntryOrOpen!0 key!828 (_keys!5462 thiss!1248) (mask!8503 thiss!1248))))))

(declare-fun tp_is_empty!4101 () Bool)

(declare-fun e!115570 () Bool)

(declare-fun e!115569 () Bool)

(declare-fun array_inv!2233 (array!7339) Bool)

(declare-fun array_inv!2234 (array!7341) Bool)

(assert (=> b!175053 (= e!115570 (and tp!15662 tp_is_empty!4101 (array_inv!2233 (_keys!5462 thiss!1248)) (array_inv!2234 (_values!3597 thiss!1248)) e!115569))))

(declare-fun mapIsEmpty!6990 () Bool)

(declare-fun mapRes!6990 () Bool)

(assert (=> mapIsEmpty!6990 mapRes!6990))

(declare-fun mapNonEmpty!6990 () Bool)

(declare-fun tp!15663 () Bool)

(declare-fun e!115571 () Bool)

(assert (=> mapNonEmpty!6990 (= mapRes!6990 (and tp!15663 e!115571))))

(declare-fun mapValue!6990 () ValueCell!1707)

(declare-fun mapRest!6990 () (Array (_ BitVec 32) ValueCell!1707))

(declare-fun mapKey!6990 () (_ BitVec 32))

(assert (=> mapNonEmpty!6990 (= (arr!3486 (_values!3597 thiss!1248)) (store mapRest!6990 mapKey!6990 mapValue!6990))))

(declare-fun b!175054 () Bool)

(declare-fun res!83007 () Bool)

(assert (=> b!175054 (=> (not res!83007) (not e!115573))))

(declare-datatypes ((tuple2!3258 0))(
  ( (tuple2!3259 (_1!1640 (_ BitVec 64)) (_2!1640 V!5115)) )
))
(declare-datatypes ((List!2218 0))(
  ( (Nil!2215) (Cons!2214 (h!2832 tuple2!3258) (t!7034 List!2218)) )
))
(declare-datatypes ((ListLongMap!2185 0))(
  ( (ListLongMap!2186 (toList!1108 List!2218)) )
))
(declare-fun contains!1166 (ListLongMap!2185 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!760 (array!7339 array!7341 (_ BitVec 32) (_ BitVec 32) V!5115 V!5115 (_ BitVec 32) Int) ListLongMap!2185)

(assert (=> b!175054 (= res!83007 (contains!1166 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248)) key!828))))

(declare-fun b!175056 () Bool)

(declare-fun res!83006 () Bool)

(assert (=> b!175056 (=> (not res!83006) (not e!115573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!175056 (= res!83006 (validMask!0 (mask!8503 thiss!1248)))))

(declare-fun b!175057 () Bool)

(declare-fun e!115572 () Bool)

(assert (=> b!175057 (= e!115572 tp_is_empty!4101)))

(declare-fun b!175058 () Bool)

(declare-fun res!83009 () Bool)

(assert (=> b!175058 (=> (not res!83009) (not e!115573))))

(assert (=> b!175058 (= res!83009 (not (= key!828 (bvneg key!828))))))

(declare-fun b!175055 () Bool)

(assert (=> b!175055 (= e!115571 tp_is_empty!4101)))

(declare-fun res!83008 () Bool)

(assert (=> start!17458 (=> (not res!83008) (not e!115573))))

(declare-fun valid!980 (LongMapFixedSize!2322) Bool)

(assert (=> start!17458 (= res!83008 (valid!980 thiss!1248))))

(assert (=> start!17458 e!115573))

(assert (=> start!17458 e!115570))

(assert (=> start!17458 true))

(declare-fun b!175059 () Bool)

(assert (=> b!175059 (= e!115573 (and (= (size!3787 (_values!3597 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8503 thiss!1248))) (not (= (size!3786 (_keys!5462 thiss!1248)) (size!3787 (_values!3597 thiss!1248))))))))

(declare-fun b!175060 () Bool)

(assert (=> b!175060 (= e!115569 (and e!115572 mapRes!6990))))

(declare-fun condMapEmpty!6990 () Bool)

(declare-fun mapDefault!6990 () ValueCell!1707)

(assert (=> b!175060 (= condMapEmpty!6990 (= (arr!3486 (_values!3597 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1707)) mapDefault!6990)))))

(assert (= (and start!17458 res!83008) b!175058))

(assert (= (and b!175058 res!83009) b!175052))

(assert (= (and b!175052 res!83005) b!175054))

(assert (= (and b!175054 res!83007) b!175056))

(assert (= (and b!175056 res!83006) b!175059))

(assert (= (and b!175060 condMapEmpty!6990) mapIsEmpty!6990))

(assert (= (and b!175060 (not condMapEmpty!6990)) mapNonEmpty!6990))

(assert (= (and mapNonEmpty!6990 ((_ is ValueCellFull!1707) mapValue!6990)) b!175055))

(assert (= (and b!175060 ((_ is ValueCellFull!1707) mapDefault!6990)) b!175057))

(assert (= b!175053 b!175060))

(assert (= start!17458 b!175053))

(declare-fun m!204023 () Bool)

(assert (=> b!175053 m!204023))

(declare-fun m!204025 () Bool)

(assert (=> b!175053 m!204025))

(declare-fun m!204027 () Bool)

(assert (=> b!175056 m!204027))

(declare-fun m!204029 () Bool)

(assert (=> b!175054 m!204029))

(assert (=> b!175054 m!204029))

(declare-fun m!204031 () Bool)

(assert (=> b!175054 m!204031))

(declare-fun m!204033 () Bool)

(assert (=> start!17458 m!204033))

(declare-fun m!204035 () Bool)

(assert (=> mapNonEmpty!6990 m!204035))

(declare-fun m!204037 () Bool)

(assert (=> b!175052 m!204037))

(check-sat tp_is_empty!4101 (not b!175052) (not b_next!4329) (not mapNonEmpty!6990) (not b!175053) (not b!175056) b_and!10803 (not b!175054) (not start!17458))
(check-sat b_and!10803 (not b_next!4329))
(get-model)

(declare-fun d!53383 () Bool)

(assert (=> d!53383 (= (array_inv!2233 (_keys!5462 thiss!1248)) (bvsge (size!3786 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175053 d!53383))

(declare-fun d!53385 () Bool)

(assert (=> d!53385 (= (array_inv!2234 (_values!3597 thiss!1248)) (bvsge (size!3787 (_values!3597 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175053 d!53385))

(declare-fun d!53387 () Bool)

(assert (=> d!53387 (= (validMask!0 (mask!8503 thiss!1248)) (and (or (= (mask!8503 thiss!1248) #b00000000000000000000000000000111) (= (mask!8503 thiss!1248) #b00000000000000000000000000001111) (= (mask!8503 thiss!1248) #b00000000000000000000000000011111) (= (mask!8503 thiss!1248) #b00000000000000000000000000111111) (= (mask!8503 thiss!1248) #b00000000000000000000000001111111) (= (mask!8503 thiss!1248) #b00000000000000000000000011111111) (= (mask!8503 thiss!1248) #b00000000000000000000000111111111) (= (mask!8503 thiss!1248) #b00000000000000000000001111111111) (= (mask!8503 thiss!1248) #b00000000000000000000011111111111) (= (mask!8503 thiss!1248) #b00000000000000000000111111111111) (= (mask!8503 thiss!1248) #b00000000000000000001111111111111) (= (mask!8503 thiss!1248) #b00000000000000000011111111111111) (= (mask!8503 thiss!1248) #b00000000000000000111111111111111) (= (mask!8503 thiss!1248) #b00000000000000001111111111111111) (= (mask!8503 thiss!1248) #b00000000000000011111111111111111) (= (mask!8503 thiss!1248) #b00000000000000111111111111111111) (= (mask!8503 thiss!1248) #b00000000000001111111111111111111) (= (mask!8503 thiss!1248) #b00000000000011111111111111111111) (= (mask!8503 thiss!1248) #b00000000000111111111111111111111) (= (mask!8503 thiss!1248) #b00000000001111111111111111111111) (= (mask!8503 thiss!1248) #b00000000011111111111111111111111) (= (mask!8503 thiss!1248) #b00000000111111111111111111111111) (= (mask!8503 thiss!1248) #b00000001111111111111111111111111) (= (mask!8503 thiss!1248) #b00000011111111111111111111111111) (= (mask!8503 thiss!1248) #b00000111111111111111111111111111) (= (mask!8503 thiss!1248) #b00001111111111111111111111111111) (= (mask!8503 thiss!1248) #b00011111111111111111111111111111) (= (mask!8503 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8503 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!175056 d!53387))

(declare-fun b!175100 () Bool)

(declare-fun e!115599 () SeekEntryResult!549)

(declare-fun e!115600 () SeekEntryResult!549)

(assert (=> b!175100 (= e!115599 e!115600)))

(declare-fun lt!86610 () (_ BitVec 64))

(declare-fun lt!86609 () SeekEntryResult!549)

(assert (=> b!175100 (= lt!86610 (select (arr!3485 (_keys!5462 thiss!1248)) (index!4366 lt!86609)))))

(declare-fun c!31350 () Bool)

(assert (=> b!175100 (= c!31350 (= lt!86610 key!828))))

(declare-fun b!175101 () Bool)

(declare-fun c!31351 () Bool)

(assert (=> b!175101 (= c!31351 (= lt!86610 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115601 () SeekEntryResult!549)

(assert (=> b!175101 (= e!115600 e!115601)))

(declare-fun b!175102 () Bool)

(assert (=> b!175102 (= e!115600 (Found!549 (index!4366 lt!86609)))))

(declare-fun d!53389 () Bool)

(declare-fun lt!86608 () SeekEntryResult!549)

(assert (=> d!53389 (and (or ((_ is Undefined!549) lt!86608) (not ((_ is Found!549) lt!86608)) (and (bvsge (index!4365 lt!86608) #b00000000000000000000000000000000) (bvslt (index!4365 lt!86608) (size!3786 (_keys!5462 thiss!1248))))) (or ((_ is Undefined!549) lt!86608) ((_ is Found!549) lt!86608) (not ((_ is MissingZero!549) lt!86608)) (and (bvsge (index!4364 lt!86608) #b00000000000000000000000000000000) (bvslt (index!4364 lt!86608) (size!3786 (_keys!5462 thiss!1248))))) (or ((_ is Undefined!549) lt!86608) ((_ is Found!549) lt!86608) ((_ is MissingZero!549) lt!86608) (not ((_ is MissingVacant!549) lt!86608)) (and (bvsge (index!4367 lt!86608) #b00000000000000000000000000000000) (bvslt (index!4367 lt!86608) (size!3786 (_keys!5462 thiss!1248))))) (or ((_ is Undefined!549) lt!86608) (ite ((_ is Found!549) lt!86608) (= (select (arr!3485 (_keys!5462 thiss!1248)) (index!4365 lt!86608)) key!828) (ite ((_ is MissingZero!549) lt!86608) (= (select (arr!3485 (_keys!5462 thiss!1248)) (index!4364 lt!86608)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!549) lt!86608) (= (select (arr!3485 (_keys!5462 thiss!1248)) (index!4367 lt!86608)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53389 (= lt!86608 e!115599)))

(declare-fun c!31349 () Bool)

(assert (=> d!53389 (= c!31349 (and ((_ is Intermediate!549) lt!86609) (undefined!1361 lt!86609)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7339 (_ BitVec 32)) SeekEntryResult!549)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53389 (= lt!86609 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8503 thiss!1248)) key!828 (_keys!5462 thiss!1248) (mask!8503 thiss!1248)))))

(assert (=> d!53389 (validMask!0 (mask!8503 thiss!1248))))

(assert (=> d!53389 (= (seekEntryOrOpen!0 key!828 (_keys!5462 thiss!1248) (mask!8503 thiss!1248)) lt!86608)))

(declare-fun b!175103 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7339 (_ BitVec 32)) SeekEntryResult!549)

(assert (=> b!175103 (= e!115601 (seekKeyOrZeroReturnVacant!0 (x!19263 lt!86609) (index!4366 lt!86609) (index!4366 lt!86609) key!828 (_keys!5462 thiss!1248) (mask!8503 thiss!1248)))))

(declare-fun b!175104 () Bool)

(assert (=> b!175104 (= e!115599 Undefined!549)))

(declare-fun b!175105 () Bool)

(assert (=> b!175105 (= e!115601 (MissingZero!549 (index!4366 lt!86609)))))

(assert (= (and d!53389 c!31349) b!175104))

(assert (= (and d!53389 (not c!31349)) b!175100))

(assert (= (and b!175100 c!31350) b!175102))

(assert (= (and b!175100 (not c!31350)) b!175101))

(assert (= (and b!175101 c!31351) b!175105))

(assert (= (and b!175101 (not c!31351)) b!175103))

(declare-fun m!204055 () Bool)

(assert (=> b!175100 m!204055))

(declare-fun m!204057 () Bool)

(assert (=> d!53389 m!204057))

(assert (=> d!53389 m!204027))

(declare-fun m!204059 () Bool)

(assert (=> d!53389 m!204059))

(declare-fun m!204061 () Bool)

(assert (=> d!53389 m!204061))

(declare-fun m!204063 () Bool)

(assert (=> d!53389 m!204063))

(assert (=> d!53389 m!204057))

(declare-fun m!204065 () Bool)

(assert (=> d!53389 m!204065))

(declare-fun m!204067 () Bool)

(assert (=> b!175103 m!204067))

(assert (=> b!175052 d!53389))

(declare-fun d!53391 () Bool)

(declare-fun e!115607 () Bool)

(assert (=> d!53391 e!115607))

(declare-fun res!83027 () Bool)

(assert (=> d!53391 (=> res!83027 e!115607)))

(declare-fun lt!86621 () Bool)

(assert (=> d!53391 (= res!83027 (not lt!86621))))

(declare-fun lt!86622 () Bool)

(assert (=> d!53391 (= lt!86621 lt!86622)))

(declare-datatypes ((Unit!5376 0))(
  ( (Unit!5377) )
))
(declare-fun lt!86619 () Unit!5376)

(declare-fun e!115606 () Unit!5376)

(assert (=> d!53391 (= lt!86619 e!115606)))

(declare-fun c!31354 () Bool)

(assert (=> d!53391 (= c!31354 lt!86622)))

(declare-fun containsKey!192 (List!2218 (_ BitVec 64)) Bool)

(assert (=> d!53391 (= lt!86622 (containsKey!192 (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248))) key!828))))

(assert (=> d!53391 (= (contains!1166 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248)) key!828) lt!86621)))

(declare-fun b!175112 () Bool)

(declare-fun lt!86620 () Unit!5376)

(assert (=> b!175112 (= e!115606 lt!86620)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!140 (List!2218 (_ BitVec 64)) Unit!5376)

(assert (=> b!175112 (= lt!86620 (lemmaContainsKeyImpliesGetValueByKeyDefined!140 (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248))) key!828))))

(declare-datatypes ((Option!194 0))(
  ( (Some!193 (v!3970 V!5115)) (None!192) )
))
(declare-fun isDefined!141 (Option!194) Bool)

(declare-fun getValueByKey!188 (List!2218 (_ BitVec 64)) Option!194)

(assert (=> b!175112 (isDefined!141 (getValueByKey!188 (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248))) key!828))))

(declare-fun b!175113 () Bool)

(declare-fun Unit!5378 () Unit!5376)

(assert (=> b!175113 (= e!115606 Unit!5378)))

(declare-fun b!175114 () Bool)

(assert (=> b!175114 (= e!115607 (isDefined!141 (getValueByKey!188 (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248))) key!828)))))

(assert (= (and d!53391 c!31354) b!175112))

(assert (= (and d!53391 (not c!31354)) b!175113))

(assert (= (and d!53391 (not res!83027)) b!175114))

(declare-fun m!204069 () Bool)

(assert (=> d!53391 m!204069))

(declare-fun m!204071 () Bool)

(assert (=> b!175112 m!204071))

(declare-fun m!204073 () Bool)

(assert (=> b!175112 m!204073))

(assert (=> b!175112 m!204073))

(declare-fun m!204075 () Bool)

(assert (=> b!175112 m!204075))

(assert (=> b!175114 m!204073))

(assert (=> b!175114 m!204073))

(assert (=> b!175114 m!204075))

(assert (=> b!175054 d!53391))

(declare-fun bm!17737 () Bool)

(declare-fun call!17741 () ListLongMap!2185)

(declare-fun getCurrentListMapNoExtraKeys!166 (array!7339 array!7341 (_ BitVec 32) (_ BitVec 32) V!5115 V!5115 (_ BitVec 32) Int) ListLongMap!2185)

(assert (=> bm!17737 (= call!17741 (getCurrentListMapNoExtraKeys!166 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248)))))

(declare-fun b!175157 () Bool)

(declare-fun e!115645 () ListLongMap!2185)

(declare-fun e!115638 () ListLongMap!2185)

(assert (=> b!175157 (= e!115645 e!115638)))

(declare-fun c!31368 () Bool)

(assert (=> b!175157 (= c!31368 (and (not (= (bvand (extraKeys!3351 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3351 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17738 () Bool)

(declare-fun call!17745 () Bool)

(declare-fun lt!86678 () ListLongMap!2185)

(assert (=> bm!17738 (= call!17745 (contains!1166 lt!86678 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175158 () Bool)

(declare-fun e!115636 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!175158 (= e!115636 (validKeyInArray!0 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175159 () Bool)

(declare-fun e!115643 () Bool)

(declare-fun call!17744 () Bool)

(assert (=> b!175159 (= e!115643 (not call!17744))))

(declare-fun bm!17739 () Bool)

(assert (=> bm!17739 (= call!17744 (contains!1166 lt!86678 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175160 () Bool)

(declare-fun e!115639 () Bool)

(declare-fun e!115640 () Bool)

(assert (=> b!175160 (= e!115639 e!115640)))

(declare-fun res!83049 () Bool)

(assert (=> b!175160 (= res!83049 call!17745)))

(assert (=> b!175160 (=> (not res!83049) (not e!115640))))

(declare-fun b!175161 () Bool)

(declare-fun e!115642 () Bool)

(declare-fun apply!133 (ListLongMap!2185 (_ BitVec 64)) V!5115)

(assert (=> b!175161 (= e!115642 (= (apply!133 lt!86678 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3455 thiss!1248)))))

(declare-fun b!175162 () Bool)

(declare-fun res!83051 () Bool)

(declare-fun e!115646 () Bool)

(assert (=> b!175162 (=> (not res!83051) (not e!115646))))

(declare-fun e!115637 () Bool)

(assert (=> b!175162 (= res!83051 e!115637)))

(declare-fun res!83046 () Bool)

(assert (=> b!175162 (=> res!83046 e!115637)))

(declare-fun e!115635 () Bool)

(assert (=> b!175162 (= res!83046 (not e!115635))))

(declare-fun res!83050 () Bool)

(assert (=> b!175162 (=> (not res!83050) (not e!115635))))

(assert (=> b!175162 (= res!83050 (bvslt #b00000000000000000000000000000000 (size!3786 (_keys!5462 thiss!1248))))))

(declare-fun b!175163 () Bool)

(declare-fun e!115641 () Bool)

(assert (=> b!175163 (= e!115637 e!115641)))

(declare-fun res!83052 () Bool)

(assert (=> b!175163 (=> (not res!83052) (not e!115641))))

(assert (=> b!175163 (= res!83052 (contains!1166 lt!86678 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175163 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3786 (_keys!5462 thiss!1248))))))

(declare-fun b!175164 () Bool)

(assert (=> b!175164 (= e!115639 (not call!17745))))

(declare-fun d!53393 () Bool)

(assert (=> d!53393 e!115646))

(declare-fun res!83054 () Bool)

(assert (=> d!53393 (=> (not res!83054) (not e!115646))))

(assert (=> d!53393 (= res!83054 (or (bvsge #b00000000000000000000000000000000 (size!3786 (_keys!5462 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3786 (_keys!5462 thiss!1248))))))))

(declare-fun lt!86668 () ListLongMap!2185)

(assert (=> d!53393 (= lt!86678 lt!86668)))

(declare-fun lt!86682 () Unit!5376)

(declare-fun e!115644 () Unit!5376)

(assert (=> d!53393 (= lt!86682 e!115644)))

(declare-fun c!31367 () Bool)

(assert (=> d!53393 (= c!31367 e!115636)))

(declare-fun res!83047 () Bool)

(assert (=> d!53393 (=> (not res!83047) (not e!115636))))

(assert (=> d!53393 (= res!83047 (bvslt #b00000000000000000000000000000000 (size!3786 (_keys!5462 thiss!1248))))))

(assert (=> d!53393 (= lt!86668 e!115645)))

(declare-fun c!31369 () Bool)

(assert (=> d!53393 (= c!31369 (and (not (= (bvand (extraKeys!3351 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3351 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53393 (validMask!0 (mask!8503 thiss!1248))))

(assert (=> d!53393 (= (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248)) lt!86678)))

(declare-fun bm!17740 () Bool)

(declare-fun call!17746 () ListLongMap!2185)

(declare-fun call!17742 () ListLongMap!2185)

(declare-fun call!17743 () ListLongMap!2185)

(declare-fun +!250 (ListLongMap!2185 tuple2!3258) ListLongMap!2185)

(assert (=> bm!17740 (= call!17743 (+!250 (ite c!31369 call!17741 (ite c!31368 call!17742 call!17746)) (ite (or c!31369 c!31368) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3455 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248)))))))

(declare-fun b!175165 () Bool)

(declare-fun call!17740 () ListLongMap!2185)

(assert (=> b!175165 (= e!115638 call!17740)))

(declare-fun b!175166 () Bool)

(assert (=> b!175166 (= e!115646 e!115643)))

(declare-fun c!31372 () Bool)

(assert (=> b!175166 (= c!31372 (not (= (bvand (extraKeys!3351 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17741 () Bool)

(assert (=> bm!17741 (= call!17740 call!17743)))

(declare-fun b!175167 () Bool)

(declare-fun lt!86672 () Unit!5376)

(assert (=> b!175167 (= e!115644 lt!86672)))

(declare-fun lt!86670 () ListLongMap!2185)

(assert (=> b!175167 (= lt!86670 (getCurrentListMapNoExtraKeys!166 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248)))))

(declare-fun lt!86674 () (_ BitVec 64))

(assert (=> b!175167 (= lt!86674 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86681 () (_ BitVec 64))

(assert (=> b!175167 (= lt!86681 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86673 () Unit!5376)

(declare-fun addStillContains!109 (ListLongMap!2185 (_ BitVec 64) V!5115 (_ BitVec 64)) Unit!5376)

(assert (=> b!175167 (= lt!86673 (addStillContains!109 lt!86670 lt!86674 (zeroValue!3455 thiss!1248) lt!86681))))

(assert (=> b!175167 (contains!1166 (+!250 lt!86670 (tuple2!3259 lt!86674 (zeroValue!3455 thiss!1248))) lt!86681)))

(declare-fun lt!86667 () Unit!5376)

(assert (=> b!175167 (= lt!86667 lt!86673)))

(declare-fun lt!86683 () ListLongMap!2185)

(assert (=> b!175167 (= lt!86683 (getCurrentListMapNoExtraKeys!166 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248)))))

(declare-fun lt!86675 () (_ BitVec 64))

(assert (=> b!175167 (= lt!86675 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86685 () (_ BitVec 64))

(assert (=> b!175167 (= lt!86685 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86679 () Unit!5376)

(declare-fun addApplyDifferent!109 (ListLongMap!2185 (_ BitVec 64) V!5115 (_ BitVec 64)) Unit!5376)

(assert (=> b!175167 (= lt!86679 (addApplyDifferent!109 lt!86683 lt!86675 (minValue!3455 thiss!1248) lt!86685))))

(assert (=> b!175167 (= (apply!133 (+!250 lt!86683 (tuple2!3259 lt!86675 (minValue!3455 thiss!1248))) lt!86685) (apply!133 lt!86683 lt!86685))))

(declare-fun lt!86671 () Unit!5376)

(assert (=> b!175167 (= lt!86671 lt!86679)))

(declare-fun lt!86677 () ListLongMap!2185)

(assert (=> b!175167 (= lt!86677 (getCurrentListMapNoExtraKeys!166 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248)))))

(declare-fun lt!86687 () (_ BitVec 64))

(assert (=> b!175167 (= lt!86687 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86676 () (_ BitVec 64))

(assert (=> b!175167 (= lt!86676 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86684 () Unit!5376)

(assert (=> b!175167 (= lt!86684 (addApplyDifferent!109 lt!86677 lt!86687 (zeroValue!3455 thiss!1248) lt!86676))))

(assert (=> b!175167 (= (apply!133 (+!250 lt!86677 (tuple2!3259 lt!86687 (zeroValue!3455 thiss!1248))) lt!86676) (apply!133 lt!86677 lt!86676))))

(declare-fun lt!86688 () Unit!5376)

(assert (=> b!175167 (= lt!86688 lt!86684)))

(declare-fun lt!86686 () ListLongMap!2185)

(assert (=> b!175167 (= lt!86686 (getCurrentListMapNoExtraKeys!166 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248)))))

(declare-fun lt!86669 () (_ BitVec 64))

(assert (=> b!175167 (= lt!86669 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86680 () (_ BitVec 64))

(assert (=> b!175167 (= lt!86680 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175167 (= lt!86672 (addApplyDifferent!109 lt!86686 lt!86669 (minValue!3455 thiss!1248) lt!86680))))

(assert (=> b!175167 (= (apply!133 (+!250 lt!86686 (tuple2!3259 lt!86669 (minValue!3455 thiss!1248))) lt!86680) (apply!133 lt!86686 lt!86680))))

(declare-fun bm!17742 () Bool)

(assert (=> bm!17742 (= call!17746 call!17742)))

(declare-fun b!175168 () Bool)

(declare-fun e!115634 () ListLongMap!2185)

(assert (=> b!175168 (= e!115634 call!17746)))

(declare-fun b!175169 () Bool)

(declare-fun get!1983 (ValueCell!1707 V!5115) V!5115)

(declare-fun dynLambda!476 (Int (_ BitVec 64)) V!5115)

(assert (=> b!175169 (= e!115641 (= (apply!133 lt!86678 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000)) (get!1983 (select (arr!3486 (_values!3597 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!476 (defaultEntry!3614 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!175169 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3787 (_values!3597 thiss!1248))))))

(assert (=> b!175169 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3786 (_keys!5462 thiss!1248))))))

(declare-fun b!175170 () Bool)

(assert (=> b!175170 (= e!115643 e!115642)))

(declare-fun res!83053 () Bool)

(assert (=> b!175170 (= res!83053 call!17744)))

(assert (=> b!175170 (=> (not res!83053) (not e!115642))))

(declare-fun b!175171 () Bool)

(declare-fun res!83048 () Bool)

(assert (=> b!175171 (=> (not res!83048) (not e!115646))))

(assert (=> b!175171 (= res!83048 e!115639)))

(declare-fun c!31370 () Bool)

(assert (=> b!175171 (= c!31370 (not (= (bvand (extraKeys!3351 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!175172 () Bool)

(declare-fun Unit!5379 () Unit!5376)

(assert (=> b!175172 (= e!115644 Unit!5379)))

(declare-fun b!175173 () Bool)

(assert (=> b!175173 (= e!115635 (validKeyInArray!0 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175174 () Bool)

(assert (=> b!175174 (= e!115645 (+!250 call!17743 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248))))))

(declare-fun b!175175 () Bool)

(assert (=> b!175175 (= e!115640 (= (apply!133 lt!86678 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3455 thiss!1248)))))

(declare-fun b!175176 () Bool)

(declare-fun c!31371 () Bool)

(assert (=> b!175176 (= c!31371 (and (not (= (bvand (extraKeys!3351 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3351 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!175176 (= e!115638 e!115634)))

(declare-fun b!175177 () Bool)

(assert (=> b!175177 (= e!115634 call!17740)))

(declare-fun bm!17743 () Bool)

(assert (=> bm!17743 (= call!17742 call!17741)))

(assert (= (and d!53393 c!31369) b!175174))

(assert (= (and d!53393 (not c!31369)) b!175157))

(assert (= (and b!175157 c!31368) b!175165))

(assert (= (and b!175157 (not c!31368)) b!175176))

(assert (= (and b!175176 c!31371) b!175177))

(assert (= (and b!175176 (not c!31371)) b!175168))

(assert (= (or b!175177 b!175168) bm!17742))

(assert (= (or b!175165 bm!17742) bm!17743))

(assert (= (or b!175165 b!175177) bm!17741))

(assert (= (or b!175174 bm!17743) bm!17737))

(assert (= (or b!175174 bm!17741) bm!17740))

(assert (= (and d!53393 res!83047) b!175158))

(assert (= (and d!53393 c!31367) b!175167))

(assert (= (and d!53393 (not c!31367)) b!175172))

(assert (= (and d!53393 res!83054) b!175162))

(assert (= (and b!175162 res!83050) b!175173))

(assert (= (and b!175162 (not res!83046)) b!175163))

(assert (= (and b!175163 res!83052) b!175169))

(assert (= (and b!175162 res!83051) b!175171))

(assert (= (and b!175171 c!31370) b!175160))

(assert (= (and b!175171 (not c!31370)) b!175164))

(assert (= (and b!175160 res!83049) b!175175))

(assert (= (or b!175160 b!175164) bm!17738))

(assert (= (and b!175171 res!83048) b!175166))

(assert (= (and b!175166 c!31372) b!175170))

(assert (= (and b!175166 (not c!31372)) b!175159))

(assert (= (and b!175170 res!83053) b!175161))

(assert (= (or b!175170 b!175159) bm!17739))

(declare-fun b_lambda!6999 () Bool)

(assert (=> (not b_lambda!6999) (not b!175169)))

(declare-fun t!7036 () Bool)

(declare-fun tb!2777 () Bool)

(assert (=> (and b!175053 (= (defaultEntry!3614 thiss!1248) (defaultEntry!3614 thiss!1248)) t!7036) tb!2777))

(declare-fun result!4605 () Bool)

(assert (=> tb!2777 (= result!4605 tp_is_empty!4101)))

(assert (=> b!175169 t!7036))

(declare-fun b_and!10807 () Bool)

(assert (= b_and!10803 (and (=> t!7036 result!4605) b_and!10807)))

(declare-fun m!204077 () Bool)

(assert (=> bm!17737 m!204077))

(declare-fun m!204079 () Bool)

(assert (=> bm!17738 m!204079))

(declare-fun m!204081 () Bool)

(assert (=> bm!17739 m!204081))

(declare-fun m!204083 () Bool)

(assert (=> b!175163 m!204083))

(assert (=> b!175163 m!204083))

(declare-fun m!204085 () Bool)

(assert (=> b!175163 m!204085))

(declare-fun m!204087 () Bool)

(assert (=> b!175175 m!204087))

(declare-fun m!204089 () Bool)

(assert (=> b!175167 m!204089))

(declare-fun m!204091 () Bool)

(assert (=> b!175167 m!204091))

(declare-fun m!204093 () Bool)

(assert (=> b!175167 m!204093))

(declare-fun m!204095 () Bool)

(assert (=> b!175167 m!204095))

(declare-fun m!204097 () Bool)

(assert (=> b!175167 m!204097))

(declare-fun m!204099 () Bool)

(assert (=> b!175167 m!204099))

(declare-fun m!204101 () Bool)

(assert (=> b!175167 m!204101))

(declare-fun m!204103 () Bool)

(assert (=> b!175167 m!204103))

(declare-fun m!204105 () Bool)

(assert (=> b!175167 m!204105))

(declare-fun m!204107 () Bool)

(assert (=> b!175167 m!204107))

(assert (=> b!175167 m!204077))

(declare-fun m!204109 () Bool)

(assert (=> b!175167 m!204109))

(assert (=> b!175167 m!204099))

(assert (=> b!175167 m!204103))

(declare-fun m!204111 () Bool)

(assert (=> b!175167 m!204111))

(assert (=> b!175167 m!204105))

(assert (=> b!175167 m!204083))

(assert (=> b!175167 m!204089))

(declare-fun m!204113 () Bool)

(assert (=> b!175167 m!204113))

(declare-fun m!204115 () Bool)

(assert (=> b!175167 m!204115))

(declare-fun m!204117 () Bool)

(assert (=> b!175167 m!204117))

(declare-fun m!204119 () Bool)

(assert (=> bm!17740 m!204119))

(assert (=> b!175169 m!204083))

(declare-fun m!204121 () Bool)

(assert (=> b!175169 m!204121))

(assert (=> b!175169 m!204083))

(declare-fun m!204123 () Bool)

(assert (=> b!175169 m!204123))

(declare-fun m!204125 () Bool)

(assert (=> b!175169 m!204125))

(assert (=> b!175169 m!204125))

(assert (=> b!175169 m!204121))

(declare-fun m!204127 () Bool)

(assert (=> b!175169 m!204127))

(assert (=> b!175173 m!204083))

(assert (=> b!175173 m!204083))

(declare-fun m!204129 () Bool)

(assert (=> b!175173 m!204129))

(assert (=> d!53393 m!204027))

(declare-fun m!204131 () Bool)

(assert (=> b!175161 m!204131))

(assert (=> b!175158 m!204083))

(assert (=> b!175158 m!204083))

(assert (=> b!175158 m!204129))

(declare-fun m!204133 () Bool)

(assert (=> b!175174 m!204133))

(assert (=> b!175054 d!53393))

(declare-fun d!53395 () Bool)

(declare-fun res!83061 () Bool)

(declare-fun e!115649 () Bool)

(assert (=> d!53395 (=> (not res!83061) (not e!115649))))

(declare-fun simpleValid!147 (LongMapFixedSize!2322) Bool)

(assert (=> d!53395 (= res!83061 (simpleValid!147 thiss!1248))))

(assert (=> d!53395 (= (valid!980 thiss!1248) e!115649)))

(declare-fun b!175186 () Bool)

(declare-fun res!83062 () Bool)

(assert (=> b!175186 (=> (not res!83062) (not e!115649))))

(declare-fun arrayCountValidKeys!0 (array!7339 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!175186 (= res!83062 (= (arrayCountValidKeys!0 (_keys!5462 thiss!1248) #b00000000000000000000000000000000 (size!3786 (_keys!5462 thiss!1248))) (_size!1210 thiss!1248)))))

(declare-fun b!175187 () Bool)

(declare-fun res!83063 () Bool)

(assert (=> b!175187 (=> (not res!83063) (not e!115649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7339 (_ BitVec 32)) Bool)

(assert (=> b!175187 (= res!83063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5462 thiss!1248) (mask!8503 thiss!1248)))))

(declare-fun b!175188 () Bool)

(declare-datatypes ((List!2219 0))(
  ( (Nil!2216) (Cons!2215 (h!2833 (_ BitVec 64)) (t!7037 List!2219)) )
))
(declare-fun arrayNoDuplicates!0 (array!7339 (_ BitVec 32) List!2219) Bool)

(assert (=> b!175188 (= e!115649 (arrayNoDuplicates!0 (_keys!5462 thiss!1248) #b00000000000000000000000000000000 Nil!2216))))

(assert (= (and d!53395 res!83061) b!175186))

(assert (= (and b!175186 res!83062) b!175187))

(assert (= (and b!175187 res!83063) b!175188))

(declare-fun m!204135 () Bool)

(assert (=> d!53395 m!204135))

(declare-fun m!204137 () Bool)

(assert (=> b!175186 m!204137))

(declare-fun m!204139 () Bool)

(assert (=> b!175187 m!204139))

(declare-fun m!204141 () Bool)

(assert (=> b!175188 m!204141))

(assert (=> start!17458 d!53395))

(declare-fun condMapEmpty!6996 () Bool)

(declare-fun mapDefault!6996 () ValueCell!1707)

(assert (=> mapNonEmpty!6990 (= condMapEmpty!6996 (= mapRest!6990 ((as const (Array (_ BitVec 32) ValueCell!1707)) mapDefault!6996)))))

(declare-fun e!115655 () Bool)

(declare-fun mapRes!6996 () Bool)

(assert (=> mapNonEmpty!6990 (= tp!15663 (and e!115655 mapRes!6996))))

(declare-fun b!175195 () Bool)

(declare-fun e!115654 () Bool)

(assert (=> b!175195 (= e!115654 tp_is_empty!4101)))

(declare-fun b!175196 () Bool)

(assert (=> b!175196 (= e!115655 tp_is_empty!4101)))

(declare-fun mapIsEmpty!6996 () Bool)

(assert (=> mapIsEmpty!6996 mapRes!6996))

(declare-fun mapNonEmpty!6996 () Bool)

(declare-fun tp!15672 () Bool)

(assert (=> mapNonEmpty!6996 (= mapRes!6996 (and tp!15672 e!115654))))

(declare-fun mapValue!6996 () ValueCell!1707)

(declare-fun mapRest!6996 () (Array (_ BitVec 32) ValueCell!1707))

(declare-fun mapKey!6996 () (_ BitVec 32))

(assert (=> mapNonEmpty!6996 (= mapRest!6990 (store mapRest!6996 mapKey!6996 mapValue!6996))))

(assert (= (and mapNonEmpty!6990 condMapEmpty!6996) mapIsEmpty!6996))

(assert (= (and mapNonEmpty!6990 (not condMapEmpty!6996)) mapNonEmpty!6996))

(assert (= (and mapNonEmpty!6996 ((_ is ValueCellFull!1707) mapValue!6996)) b!175195))

(assert (= (and mapNonEmpty!6990 ((_ is ValueCellFull!1707) mapDefault!6996)) b!175196))

(declare-fun m!204143 () Bool)

(assert (=> mapNonEmpty!6996 m!204143))

(declare-fun b_lambda!7001 () Bool)

(assert (= b_lambda!6999 (or (and b!175053 b_free!4329) b_lambda!7001)))

(check-sat (not b!175112) (not b!175188) (not mapNonEmpty!6996) (not b!175167) (not b!175158) (not b!175103) (not bm!17740) (not b_lambda!7001) (not bm!17738) (not d!53393) tp_is_empty!4101 b_and!10807 (not b!175173) (not bm!17739) (not b_next!4329) (not b!175114) (not b!175186) (not b!175161) (not b!175175) (not b!175187) (not d!53389) (not b!175163) (not d!53391) (not d!53395) (not bm!17737) (not b!175174) (not b!175169))
(check-sat b_and!10807 (not b_next!4329))
(get-model)

(declare-fun d!53397 () Bool)

(declare-fun e!115658 () Bool)

(assert (=> d!53397 e!115658))

(declare-fun res!83069 () Bool)

(assert (=> d!53397 (=> (not res!83069) (not e!115658))))

(declare-fun lt!86698 () ListLongMap!2185)

(assert (=> d!53397 (= res!83069 (contains!1166 lt!86698 (_1!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248)))))))

(declare-fun lt!86699 () List!2218)

(assert (=> d!53397 (= lt!86698 (ListLongMap!2186 lt!86699))))

(declare-fun lt!86697 () Unit!5376)

(declare-fun lt!86700 () Unit!5376)

(assert (=> d!53397 (= lt!86697 lt!86700)))

(assert (=> d!53397 (= (getValueByKey!188 lt!86699 (_1!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248)))) (Some!193 (_2!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!100 (List!2218 (_ BitVec 64) V!5115) Unit!5376)

(assert (=> d!53397 (= lt!86700 (lemmaContainsTupThenGetReturnValue!100 lt!86699 (_1!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248))) (_2!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248)))))))

(declare-fun insertStrictlySorted!103 (List!2218 (_ BitVec 64) V!5115) List!2218)

(assert (=> d!53397 (= lt!86699 (insertStrictlySorted!103 (toList!1108 call!17743) (_1!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248))) (_2!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248)))))))

(assert (=> d!53397 (= (+!250 call!17743 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248))) lt!86698)))

(declare-fun b!175201 () Bool)

(declare-fun res!83068 () Bool)

(assert (=> b!175201 (=> (not res!83068) (not e!115658))))

(assert (=> b!175201 (= res!83068 (= (getValueByKey!188 (toList!1108 lt!86698) (_1!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248)))) (Some!193 (_2!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248))))))))

(declare-fun b!175202 () Bool)

(declare-fun contains!1167 (List!2218 tuple2!3258) Bool)

(assert (=> b!175202 (= e!115658 (contains!1167 (toList!1108 lt!86698) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248))))))

(assert (= (and d!53397 res!83069) b!175201))

(assert (= (and b!175201 res!83068) b!175202))

(declare-fun m!204145 () Bool)

(assert (=> d!53397 m!204145))

(declare-fun m!204147 () Bool)

(assert (=> d!53397 m!204147))

(declare-fun m!204149 () Bool)

(assert (=> d!53397 m!204149))

(declare-fun m!204151 () Bool)

(assert (=> d!53397 m!204151))

(declare-fun m!204153 () Bool)

(assert (=> b!175201 m!204153))

(declare-fun m!204155 () Bool)

(assert (=> b!175202 m!204155))

(assert (=> b!175174 d!53397))

(declare-fun d!53399 () Bool)

(assert (=> d!53399 (= (validKeyInArray!0 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!175173 d!53399))

(declare-fun b!175227 () Bool)

(declare-fun e!115674 () Bool)

(assert (=> b!175227 (= e!115674 (validKeyInArray!0 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175227 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!175228 () Bool)

(declare-fun e!115678 () Bool)

(declare-fun lt!86717 () ListLongMap!2185)

(declare-fun isEmpty!441 (ListLongMap!2185) Bool)

(assert (=> b!175228 (= e!115678 (isEmpty!441 lt!86717))))

(declare-fun b!175229 () Bool)

(declare-fun e!115676 () Bool)

(assert (=> b!175229 (= e!115676 e!115678)))

(declare-fun c!31383 () Bool)

(assert (=> b!175229 (= c!31383 (bvslt #b00000000000000000000000000000000 (size!3786 (_keys!5462 thiss!1248))))))

(declare-fun b!175230 () Bool)

(declare-fun e!115673 () ListLongMap!2185)

(declare-fun e!115679 () ListLongMap!2185)

(assert (=> b!175230 (= e!115673 e!115679)))

(declare-fun c!31382 () Bool)

(assert (=> b!175230 (= c!31382 (validKeyInArray!0 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175231 () Bool)

(assert (=> b!175231 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3786 (_keys!5462 thiss!1248))))))

(assert (=> b!175231 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3787 (_values!3597 thiss!1248))))))

(declare-fun e!115677 () Bool)

(assert (=> b!175231 (= e!115677 (= (apply!133 lt!86717 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000)) (get!1983 (select (arr!3486 (_values!3597 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!476 (defaultEntry!3614 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!175232 () Bool)

(declare-fun lt!86716 () Unit!5376)

(declare-fun lt!86720 () Unit!5376)

(assert (=> b!175232 (= lt!86716 lt!86720)))

(declare-fun lt!86721 () (_ BitVec 64))

(declare-fun lt!86718 () (_ BitVec 64))

(declare-fun lt!86719 () V!5115)

(declare-fun lt!86715 () ListLongMap!2185)

(assert (=> b!175232 (not (contains!1166 (+!250 lt!86715 (tuple2!3259 lt!86721 lt!86719)) lt!86718))))

(declare-fun addStillNotContains!74 (ListLongMap!2185 (_ BitVec 64) V!5115 (_ BitVec 64)) Unit!5376)

(assert (=> b!175232 (= lt!86720 (addStillNotContains!74 lt!86715 lt!86721 lt!86719 lt!86718))))

(assert (=> b!175232 (= lt!86718 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!175232 (= lt!86719 (get!1983 (select (arr!3486 (_values!3597 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!476 (defaultEntry!3614 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!175232 (= lt!86721 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!17749 () ListLongMap!2185)

(assert (=> b!175232 (= lt!86715 call!17749)))

(assert (=> b!175232 (= e!115679 (+!250 call!17749 (tuple2!3259 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000) (get!1983 (select (arr!3486 (_values!3597 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!476 (defaultEntry!3614 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!175233 () Bool)

(assert (=> b!175233 (= e!115676 e!115677)))

(assert (=> b!175233 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3786 (_keys!5462 thiss!1248))))))

(declare-fun res!83078 () Bool)

(assert (=> b!175233 (= res!83078 (contains!1166 lt!86717 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175233 (=> (not res!83078) (not e!115677))))

(declare-fun d!53401 () Bool)

(declare-fun e!115675 () Bool)

(assert (=> d!53401 e!115675))

(declare-fun res!83080 () Bool)

(assert (=> d!53401 (=> (not res!83080) (not e!115675))))

(assert (=> d!53401 (= res!83080 (not (contains!1166 lt!86717 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53401 (= lt!86717 e!115673)))

(declare-fun c!31381 () Bool)

(assert (=> d!53401 (= c!31381 (bvsge #b00000000000000000000000000000000 (size!3786 (_keys!5462 thiss!1248))))))

(assert (=> d!53401 (validMask!0 (mask!8503 thiss!1248))))

(assert (=> d!53401 (= (getCurrentListMapNoExtraKeys!166 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248)) lt!86717)))

(declare-fun b!175234 () Bool)

(assert (=> b!175234 (= e!115673 (ListLongMap!2186 Nil!2215))))

(declare-fun b!175235 () Bool)

(assert (=> b!175235 (= e!115678 (= lt!86717 (getCurrentListMapNoExtraKeys!166 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3614 thiss!1248))))))

(declare-fun b!175236 () Bool)

(declare-fun res!83081 () Bool)

(assert (=> b!175236 (=> (not res!83081) (not e!115675))))

(assert (=> b!175236 (= res!83081 (not (contains!1166 lt!86717 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175237 () Bool)

(assert (=> b!175237 (= e!115679 call!17749)))

(declare-fun bm!17746 () Bool)

(assert (=> bm!17746 (= call!17749 (getCurrentListMapNoExtraKeys!166 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3614 thiss!1248)))))

(declare-fun b!175238 () Bool)

(assert (=> b!175238 (= e!115675 e!115676)))

(declare-fun c!31384 () Bool)

(assert (=> b!175238 (= c!31384 e!115674)))

(declare-fun res!83079 () Bool)

(assert (=> b!175238 (=> (not res!83079) (not e!115674))))

(assert (=> b!175238 (= res!83079 (bvslt #b00000000000000000000000000000000 (size!3786 (_keys!5462 thiss!1248))))))

(assert (= (and d!53401 c!31381) b!175234))

(assert (= (and d!53401 (not c!31381)) b!175230))

(assert (= (and b!175230 c!31382) b!175232))

(assert (= (and b!175230 (not c!31382)) b!175237))

(assert (= (or b!175232 b!175237) bm!17746))

(assert (= (and d!53401 res!83080) b!175236))

(assert (= (and b!175236 res!83081) b!175238))

(assert (= (and b!175238 res!83079) b!175227))

(assert (= (and b!175238 c!31384) b!175233))

(assert (= (and b!175238 (not c!31384)) b!175229))

(assert (= (and b!175233 res!83078) b!175231))

(assert (= (and b!175229 c!31383) b!175235))

(assert (= (and b!175229 (not c!31383)) b!175228))

(declare-fun b_lambda!7003 () Bool)

(assert (=> (not b_lambda!7003) (not b!175231)))

(assert (=> b!175231 t!7036))

(declare-fun b_and!10809 () Bool)

(assert (= b_and!10807 (and (=> t!7036 result!4605) b_and!10809)))

(declare-fun b_lambda!7005 () Bool)

(assert (=> (not b_lambda!7005) (not b!175232)))

(assert (=> b!175232 t!7036))

(declare-fun b_and!10811 () Bool)

(assert (= b_and!10809 (and (=> t!7036 result!4605) b_and!10811)))

(declare-fun m!204157 () Bool)

(assert (=> d!53401 m!204157))

(assert (=> d!53401 m!204027))

(assert (=> b!175233 m!204083))

(assert (=> b!175233 m!204083))

(declare-fun m!204159 () Bool)

(assert (=> b!175233 m!204159))

(assert (=> b!175231 m!204125))

(assert (=> b!175231 m!204121))

(assert (=> b!175231 m!204127))

(assert (=> b!175231 m!204121))

(assert (=> b!175231 m!204083))

(declare-fun m!204161 () Bool)

(assert (=> b!175231 m!204161))

(assert (=> b!175231 m!204125))

(assert (=> b!175231 m!204083))

(assert (=> b!175230 m!204083))

(assert (=> b!175230 m!204083))

(assert (=> b!175230 m!204129))

(declare-fun m!204163 () Bool)

(assert (=> bm!17746 m!204163))

(assert (=> b!175227 m!204083))

(assert (=> b!175227 m!204083))

(assert (=> b!175227 m!204129))

(declare-fun m!204165 () Bool)

(assert (=> b!175228 m!204165))

(declare-fun m!204167 () Bool)

(assert (=> b!175236 m!204167))

(assert (=> b!175235 m!204163))

(assert (=> b!175232 m!204125))

(assert (=> b!175232 m!204121))

(assert (=> b!175232 m!204127))

(declare-fun m!204169 () Bool)

(assert (=> b!175232 m!204169))

(assert (=> b!175232 m!204169))

(declare-fun m!204171 () Bool)

(assert (=> b!175232 m!204171))

(assert (=> b!175232 m!204121))

(declare-fun m!204173 () Bool)

(assert (=> b!175232 m!204173))

(declare-fun m!204175 () Bool)

(assert (=> b!175232 m!204175))

(assert (=> b!175232 m!204125))

(assert (=> b!175232 m!204083))

(assert (=> bm!17737 d!53401))

(declare-fun d!53403 () Bool)

(declare-fun e!115680 () Bool)

(assert (=> d!53403 e!115680))

(declare-fun res!83083 () Bool)

(assert (=> d!53403 (=> (not res!83083) (not e!115680))))

(declare-fun lt!86723 () ListLongMap!2185)

(assert (=> d!53403 (= res!83083 (contains!1166 lt!86723 (_1!1640 (ite (or c!31369 c!31368) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3455 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248))))))))

(declare-fun lt!86724 () List!2218)

(assert (=> d!53403 (= lt!86723 (ListLongMap!2186 lt!86724))))

(declare-fun lt!86722 () Unit!5376)

(declare-fun lt!86725 () Unit!5376)

(assert (=> d!53403 (= lt!86722 lt!86725)))

(assert (=> d!53403 (= (getValueByKey!188 lt!86724 (_1!1640 (ite (or c!31369 c!31368) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3455 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248))))) (Some!193 (_2!1640 (ite (or c!31369 c!31368) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3455 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248))))))))

(assert (=> d!53403 (= lt!86725 (lemmaContainsTupThenGetReturnValue!100 lt!86724 (_1!1640 (ite (or c!31369 c!31368) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3455 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248)))) (_2!1640 (ite (or c!31369 c!31368) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3455 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248))))))))

(assert (=> d!53403 (= lt!86724 (insertStrictlySorted!103 (toList!1108 (ite c!31369 call!17741 (ite c!31368 call!17742 call!17746))) (_1!1640 (ite (or c!31369 c!31368) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3455 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248)))) (_2!1640 (ite (or c!31369 c!31368) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3455 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248))))))))

(assert (=> d!53403 (= (+!250 (ite c!31369 call!17741 (ite c!31368 call!17742 call!17746)) (ite (or c!31369 c!31368) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3455 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248)))) lt!86723)))

(declare-fun b!175239 () Bool)

(declare-fun res!83082 () Bool)

(assert (=> b!175239 (=> (not res!83082) (not e!115680))))

(assert (=> b!175239 (= res!83082 (= (getValueByKey!188 (toList!1108 lt!86723) (_1!1640 (ite (or c!31369 c!31368) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3455 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248))))) (Some!193 (_2!1640 (ite (or c!31369 c!31368) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3455 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248)))))))))

(declare-fun b!175240 () Bool)

(assert (=> b!175240 (= e!115680 (contains!1167 (toList!1108 lt!86723) (ite (or c!31369 c!31368) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3455 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3455 thiss!1248)))))))

(assert (= (and d!53403 res!83083) b!175239))

(assert (= (and b!175239 res!83082) b!175240))

(declare-fun m!204177 () Bool)

(assert (=> d!53403 m!204177))

(declare-fun m!204179 () Bool)

(assert (=> d!53403 m!204179))

(declare-fun m!204181 () Bool)

(assert (=> d!53403 m!204181))

(declare-fun m!204183 () Bool)

(assert (=> d!53403 m!204183))

(declare-fun m!204185 () Bool)

(assert (=> b!175239 m!204185))

(declare-fun m!204187 () Bool)

(assert (=> b!175240 m!204187))

(assert (=> bm!17740 d!53403))

(declare-fun b!175251 () Bool)

(declare-fun e!115691 () Bool)

(declare-fun contains!1168 (List!2219 (_ BitVec 64)) Bool)

(assert (=> b!175251 (= e!115691 (contains!1168 Nil!2216 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175252 () Bool)

(declare-fun e!115692 () Bool)

(declare-fun e!115689 () Bool)

(assert (=> b!175252 (= e!115692 e!115689)))

(declare-fun c!31387 () Bool)

(assert (=> b!175252 (= c!31387 (validKeyInArray!0 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175253 () Bool)

(declare-fun call!17752 () Bool)

(assert (=> b!175253 (= e!115689 call!17752)))

(declare-fun bm!17749 () Bool)

(assert (=> bm!17749 (= call!17752 (arrayNoDuplicates!0 (_keys!5462 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31387 (Cons!2215 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000) Nil!2216) Nil!2216)))))

(declare-fun b!175254 () Bool)

(assert (=> b!175254 (= e!115689 call!17752)))

(declare-fun b!175255 () Bool)

(declare-fun e!115690 () Bool)

(assert (=> b!175255 (= e!115690 e!115692)))

(declare-fun res!83091 () Bool)

(assert (=> b!175255 (=> (not res!83091) (not e!115692))))

(assert (=> b!175255 (= res!83091 (not e!115691))))

(declare-fun res!83092 () Bool)

(assert (=> b!175255 (=> (not res!83092) (not e!115691))))

(assert (=> b!175255 (= res!83092 (validKeyInArray!0 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53405 () Bool)

(declare-fun res!83090 () Bool)

(assert (=> d!53405 (=> res!83090 e!115690)))

(assert (=> d!53405 (= res!83090 (bvsge #b00000000000000000000000000000000 (size!3786 (_keys!5462 thiss!1248))))))

(assert (=> d!53405 (= (arrayNoDuplicates!0 (_keys!5462 thiss!1248) #b00000000000000000000000000000000 Nil!2216) e!115690)))

(assert (= (and d!53405 (not res!83090)) b!175255))

(assert (= (and b!175255 res!83092) b!175251))

(assert (= (and b!175255 res!83091) b!175252))

(assert (= (and b!175252 c!31387) b!175253))

(assert (= (and b!175252 (not c!31387)) b!175254))

(assert (= (or b!175253 b!175254) bm!17749))

(assert (=> b!175251 m!204083))

(assert (=> b!175251 m!204083))

(declare-fun m!204189 () Bool)

(assert (=> b!175251 m!204189))

(assert (=> b!175252 m!204083))

(assert (=> b!175252 m!204083))

(assert (=> b!175252 m!204129))

(assert (=> bm!17749 m!204083))

(declare-fun m!204191 () Bool)

(assert (=> bm!17749 m!204191))

(assert (=> b!175255 m!204083))

(assert (=> b!175255 m!204083))

(assert (=> b!175255 m!204129))

(assert (=> b!175188 d!53405))

(declare-fun b!175264 () Bool)

(declare-fun e!115701 () Bool)

(declare-fun e!115700 () Bool)

(assert (=> b!175264 (= e!115701 e!115700)))

(declare-fun c!31390 () Bool)

(assert (=> b!175264 (= c!31390 (validKeyInArray!0 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175265 () Bool)

(declare-fun call!17755 () Bool)

(assert (=> b!175265 (= e!115700 call!17755)))

(declare-fun bm!17752 () Bool)

(assert (=> bm!17752 (= call!17755 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5462 thiss!1248) (mask!8503 thiss!1248)))))

(declare-fun b!175266 () Bool)

(declare-fun e!115699 () Bool)

(assert (=> b!175266 (= e!115699 call!17755)))

(declare-fun d!53407 () Bool)

(declare-fun res!83098 () Bool)

(assert (=> d!53407 (=> res!83098 e!115701)))

(assert (=> d!53407 (= res!83098 (bvsge #b00000000000000000000000000000000 (size!3786 (_keys!5462 thiss!1248))))))

(assert (=> d!53407 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5462 thiss!1248) (mask!8503 thiss!1248)) e!115701)))

(declare-fun b!175267 () Bool)

(assert (=> b!175267 (= e!115700 e!115699)))

(declare-fun lt!86734 () (_ BitVec 64))

(assert (=> b!175267 (= lt!86734 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86732 () Unit!5376)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7339 (_ BitVec 64) (_ BitVec 32)) Unit!5376)

(assert (=> b!175267 (= lt!86732 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5462 thiss!1248) lt!86734 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!175267 (arrayContainsKey!0 (_keys!5462 thiss!1248) lt!86734 #b00000000000000000000000000000000)))

(declare-fun lt!86733 () Unit!5376)

(assert (=> b!175267 (= lt!86733 lt!86732)))

(declare-fun res!83097 () Bool)

(assert (=> b!175267 (= res!83097 (= (seekEntryOrOpen!0 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000) (_keys!5462 thiss!1248) (mask!8503 thiss!1248)) (Found!549 #b00000000000000000000000000000000)))))

(assert (=> b!175267 (=> (not res!83097) (not e!115699))))

(assert (= (and d!53407 (not res!83098)) b!175264))

(assert (= (and b!175264 c!31390) b!175267))

(assert (= (and b!175264 (not c!31390)) b!175265))

(assert (= (and b!175267 res!83097) b!175266))

(assert (= (or b!175266 b!175265) bm!17752))

(assert (=> b!175264 m!204083))

(assert (=> b!175264 m!204083))

(assert (=> b!175264 m!204129))

(declare-fun m!204193 () Bool)

(assert (=> bm!17752 m!204193))

(assert (=> b!175267 m!204083))

(declare-fun m!204195 () Bool)

(assert (=> b!175267 m!204195))

(declare-fun m!204197 () Bool)

(assert (=> b!175267 m!204197))

(assert (=> b!175267 m!204083))

(declare-fun m!204199 () Bool)

(assert (=> b!175267 m!204199))

(assert (=> b!175187 d!53407))

(declare-fun b!175286 () Bool)

(declare-fun e!115712 () SeekEntryResult!549)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!175286 (= e!115712 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8503 thiss!1248)) #b00000000000000000000000000000000 (mask!8503 thiss!1248)) key!828 (_keys!5462 thiss!1248) (mask!8503 thiss!1248)))))

(declare-fun b!175287 () Bool)

(declare-fun e!115713 () Bool)

(declare-fun e!115715 () Bool)

(assert (=> b!175287 (= e!115713 e!115715)))

(declare-fun res!83105 () Bool)

(declare-fun lt!86740 () SeekEntryResult!549)

(assert (=> b!175287 (= res!83105 (and ((_ is Intermediate!549) lt!86740) (not (undefined!1361 lt!86740)) (bvslt (x!19263 lt!86740) #b01111111111111111111111111111110) (bvsge (x!19263 lt!86740) #b00000000000000000000000000000000) (bvsge (x!19263 lt!86740) #b00000000000000000000000000000000)))))

(assert (=> b!175287 (=> (not res!83105) (not e!115715))))

(declare-fun b!175288 () Bool)

(assert (=> b!175288 (and (bvsge (index!4366 lt!86740) #b00000000000000000000000000000000) (bvslt (index!4366 lt!86740) (size!3786 (_keys!5462 thiss!1248))))))

(declare-fun res!83107 () Bool)

(assert (=> b!175288 (= res!83107 (= (select (arr!3485 (_keys!5462 thiss!1248)) (index!4366 lt!86740)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115714 () Bool)

(assert (=> b!175288 (=> res!83107 e!115714)))

(declare-fun b!175289 () Bool)

(assert (=> b!175289 (= e!115713 (bvsge (x!19263 lt!86740) #b01111111111111111111111111111110))))

(declare-fun b!175291 () Bool)

(assert (=> b!175291 (= e!115712 (Intermediate!549 false (toIndex!0 key!828 (mask!8503 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!175292 () Bool)

(assert (=> b!175292 (and (bvsge (index!4366 lt!86740) #b00000000000000000000000000000000) (bvslt (index!4366 lt!86740) (size!3786 (_keys!5462 thiss!1248))))))

(declare-fun res!83106 () Bool)

(assert (=> b!175292 (= res!83106 (= (select (arr!3485 (_keys!5462 thiss!1248)) (index!4366 lt!86740)) key!828))))

(assert (=> b!175292 (=> res!83106 e!115714)))

(assert (=> b!175292 (= e!115715 e!115714)))

(declare-fun b!175293 () Bool)

(declare-fun e!115716 () SeekEntryResult!549)

(assert (=> b!175293 (= e!115716 e!115712)))

(declare-fun c!31399 () Bool)

(declare-fun lt!86739 () (_ BitVec 64))

(assert (=> b!175293 (= c!31399 (or (= lt!86739 key!828) (= (bvadd lt!86739 lt!86739) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175294 () Bool)

(assert (=> b!175294 (= e!115716 (Intermediate!549 true (toIndex!0 key!828 (mask!8503 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!175290 () Bool)

(assert (=> b!175290 (and (bvsge (index!4366 lt!86740) #b00000000000000000000000000000000) (bvslt (index!4366 lt!86740) (size!3786 (_keys!5462 thiss!1248))))))

(assert (=> b!175290 (= e!115714 (= (select (arr!3485 (_keys!5462 thiss!1248)) (index!4366 lt!86740)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!53409 () Bool)

(assert (=> d!53409 e!115713))

(declare-fun c!31397 () Bool)

(assert (=> d!53409 (= c!31397 (and ((_ is Intermediate!549) lt!86740) (undefined!1361 lt!86740)))))

(assert (=> d!53409 (= lt!86740 e!115716)))

(declare-fun c!31398 () Bool)

(assert (=> d!53409 (= c!31398 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!53409 (= lt!86739 (select (arr!3485 (_keys!5462 thiss!1248)) (toIndex!0 key!828 (mask!8503 thiss!1248))))))

(assert (=> d!53409 (validMask!0 (mask!8503 thiss!1248))))

(assert (=> d!53409 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8503 thiss!1248)) key!828 (_keys!5462 thiss!1248) (mask!8503 thiss!1248)) lt!86740)))

(assert (= (and d!53409 c!31398) b!175294))

(assert (= (and d!53409 (not c!31398)) b!175293))

(assert (= (and b!175293 c!31399) b!175291))

(assert (= (and b!175293 (not c!31399)) b!175286))

(assert (= (and d!53409 c!31397) b!175289))

(assert (= (and d!53409 (not c!31397)) b!175287))

(assert (= (and b!175287 res!83105) b!175292))

(assert (= (and b!175292 (not res!83106)) b!175288))

(assert (= (and b!175288 (not res!83107)) b!175290))

(declare-fun m!204201 () Bool)

(assert (=> b!175292 m!204201))

(assert (=> b!175290 m!204201))

(assert (=> b!175288 m!204201))

(assert (=> d!53409 m!204057))

(declare-fun m!204203 () Bool)

(assert (=> d!53409 m!204203))

(assert (=> d!53409 m!204027))

(assert (=> b!175286 m!204057))

(declare-fun m!204205 () Bool)

(assert (=> b!175286 m!204205))

(assert (=> b!175286 m!204205))

(declare-fun m!204207 () Bool)

(assert (=> b!175286 m!204207))

(assert (=> d!53389 d!53409))

(declare-fun d!53411 () Bool)

(declare-fun lt!86746 () (_ BitVec 32))

(declare-fun lt!86745 () (_ BitVec 32))

(assert (=> d!53411 (= lt!86746 (bvmul (bvxor lt!86745 (bvlshr lt!86745 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!53411 (= lt!86745 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!53411 (and (bvsge (mask!8503 thiss!1248) #b00000000000000000000000000000000) (let ((res!83108 (let ((h!2834 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19280 (bvmul (bvxor h!2834 (bvlshr h!2834 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19280 (bvlshr x!19280 #b00000000000000000000000000001101)) (mask!8503 thiss!1248)))))) (and (bvslt res!83108 (bvadd (mask!8503 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!83108 #b00000000000000000000000000000000))))))

(assert (=> d!53411 (= (toIndex!0 key!828 (mask!8503 thiss!1248)) (bvand (bvxor lt!86746 (bvlshr lt!86746 #b00000000000000000000000000001101)) (mask!8503 thiss!1248)))))

(assert (=> d!53389 d!53411))

(assert (=> d!53389 d!53387))

(declare-fun d!53413 () Bool)

(declare-fun e!115718 () Bool)

(assert (=> d!53413 e!115718))

(declare-fun res!83109 () Bool)

(assert (=> d!53413 (=> res!83109 e!115718)))

(declare-fun lt!86749 () Bool)

(assert (=> d!53413 (= res!83109 (not lt!86749))))

(declare-fun lt!86750 () Bool)

(assert (=> d!53413 (= lt!86749 lt!86750)))

(declare-fun lt!86747 () Unit!5376)

(declare-fun e!115717 () Unit!5376)

(assert (=> d!53413 (= lt!86747 e!115717)))

(declare-fun c!31400 () Bool)

(assert (=> d!53413 (= c!31400 lt!86750)))

(assert (=> d!53413 (= lt!86750 (containsKey!192 (toList!1108 lt!86678) (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53413 (= (contains!1166 lt!86678 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000)) lt!86749)))

(declare-fun b!175295 () Bool)

(declare-fun lt!86748 () Unit!5376)

(assert (=> b!175295 (= e!115717 lt!86748)))

(assert (=> b!175295 (= lt!86748 (lemmaContainsKeyImpliesGetValueByKeyDefined!140 (toList!1108 lt!86678) (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175295 (isDefined!141 (getValueByKey!188 (toList!1108 lt!86678) (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175296 () Bool)

(declare-fun Unit!5380 () Unit!5376)

(assert (=> b!175296 (= e!115717 Unit!5380)))

(declare-fun b!175297 () Bool)

(assert (=> b!175297 (= e!115718 (isDefined!141 (getValueByKey!188 (toList!1108 lt!86678) (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53413 c!31400) b!175295))

(assert (= (and d!53413 (not c!31400)) b!175296))

(assert (= (and d!53413 (not res!83109)) b!175297))

(assert (=> d!53413 m!204083))

(declare-fun m!204209 () Bool)

(assert (=> d!53413 m!204209))

(assert (=> b!175295 m!204083))

(declare-fun m!204211 () Bool)

(assert (=> b!175295 m!204211))

(assert (=> b!175295 m!204083))

(declare-fun m!204213 () Bool)

(assert (=> b!175295 m!204213))

(assert (=> b!175295 m!204213))

(declare-fun m!204215 () Bool)

(assert (=> b!175295 m!204215))

(assert (=> b!175297 m!204083))

(assert (=> b!175297 m!204213))

(assert (=> b!175297 m!204213))

(assert (=> b!175297 m!204215))

(assert (=> b!175163 d!53413))

(declare-fun d!53415 () Bool)

(declare-fun isEmpty!442 (Option!194) Bool)

(assert (=> d!53415 (= (isDefined!141 (getValueByKey!188 (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248))) key!828)) (not (isEmpty!442 (getValueByKey!188 (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248))) key!828))))))

(declare-fun bs!7230 () Bool)

(assert (= bs!7230 d!53415))

(assert (=> bs!7230 m!204073))

(declare-fun m!204217 () Bool)

(assert (=> bs!7230 m!204217))

(assert (=> b!175114 d!53415))

(declare-fun b!175307 () Bool)

(declare-fun e!115723 () Option!194)

(declare-fun e!115724 () Option!194)

(assert (=> b!175307 (= e!115723 e!115724)))

(declare-fun c!31406 () Bool)

(assert (=> b!175307 (= c!31406 (and ((_ is Cons!2214) (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248)))) (not (= (_1!1640 (h!2832 (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248))))) key!828))))))

(declare-fun b!175308 () Bool)

(assert (=> b!175308 (= e!115724 (getValueByKey!188 (t!7034 (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248)))) key!828))))

(declare-fun d!53417 () Bool)

(declare-fun c!31405 () Bool)

(assert (=> d!53417 (= c!31405 (and ((_ is Cons!2214) (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248)))) (= (_1!1640 (h!2832 (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248))))) key!828)))))

(assert (=> d!53417 (= (getValueByKey!188 (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248))) key!828) e!115723)))

(declare-fun b!175306 () Bool)

(assert (=> b!175306 (= e!115723 (Some!193 (_2!1640 (h!2832 (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248)))))))))

(declare-fun b!175309 () Bool)

(assert (=> b!175309 (= e!115724 None!192)))

(assert (= (and d!53417 c!31405) b!175306))

(assert (= (and d!53417 (not c!31405)) b!175307))

(assert (= (and b!175307 c!31406) b!175308))

(assert (= (and b!175307 (not c!31406)) b!175309))

(declare-fun m!204219 () Bool)

(assert (=> b!175308 m!204219))

(assert (=> b!175114 d!53417))

(declare-fun d!53419 () Bool)

(declare-fun get!1984 (Option!194) V!5115)

(assert (=> d!53419 (= (apply!133 lt!86678 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000)) (get!1984 (getValueByKey!188 (toList!1108 lt!86678) (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7231 () Bool)

(assert (= bs!7231 d!53419))

(assert (=> bs!7231 m!204083))

(assert (=> bs!7231 m!204213))

(assert (=> bs!7231 m!204213))

(declare-fun m!204221 () Bool)

(assert (=> bs!7231 m!204221))

(assert (=> b!175169 d!53419))

(declare-fun d!53421 () Bool)

(declare-fun c!31409 () Bool)

(assert (=> d!53421 (= c!31409 ((_ is ValueCellFull!1707) (select (arr!3486 (_values!3597 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!115727 () V!5115)

(assert (=> d!53421 (= (get!1983 (select (arr!3486 (_values!3597 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!476 (defaultEntry!3614 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!115727)))

(declare-fun b!175314 () Bool)

(declare-fun get!1985 (ValueCell!1707 V!5115) V!5115)

(assert (=> b!175314 (= e!115727 (get!1985 (select (arr!3486 (_values!3597 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!476 (defaultEntry!3614 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175315 () Bool)

(declare-fun get!1986 (ValueCell!1707 V!5115) V!5115)

(assert (=> b!175315 (= e!115727 (get!1986 (select (arr!3486 (_values!3597 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!476 (defaultEntry!3614 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53421 c!31409) b!175314))

(assert (= (and d!53421 (not c!31409)) b!175315))

(assert (=> b!175314 m!204125))

(assert (=> b!175314 m!204121))

(declare-fun m!204223 () Bool)

(assert (=> b!175314 m!204223))

(assert (=> b!175315 m!204125))

(assert (=> b!175315 m!204121))

(declare-fun m!204225 () Bool)

(assert (=> b!175315 m!204225))

(assert (=> b!175169 d!53421))

(assert (=> d!53393 d!53387))

(declare-fun b!175324 () Bool)

(declare-fun e!115732 () (_ BitVec 32))

(declare-fun call!17758 () (_ BitVec 32))

(assert (=> b!175324 (= e!115732 call!17758)))

(declare-fun b!175325 () Bool)

(declare-fun e!115733 () (_ BitVec 32))

(assert (=> b!175325 (= e!115733 e!115732)))

(declare-fun c!31415 () Bool)

(assert (=> b!175325 (= c!31415 (validKeyInArray!0 (select (arr!3485 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175326 () Bool)

(assert (=> b!175326 (= e!115733 #b00000000000000000000000000000000)))

(declare-fun b!175327 () Bool)

(assert (=> b!175327 (= e!115732 (bvadd #b00000000000000000000000000000001 call!17758))))

(declare-fun d!53423 () Bool)

(declare-fun lt!86753 () (_ BitVec 32))

(assert (=> d!53423 (and (bvsge lt!86753 #b00000000000000000000000000000000) (bvsle lt!86753 (bvsub (size!3786 (_keys!5462 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53423 (= lt!86753 e!115733)))

(declare-fun c!31414 () Bool)

(assert (=> d!53423 (= c!31414 (bvsge #b00000000000000000000000000000000 (size!3786 (_keys!5462 thiss!1248))))))

(assert (=> d!53423 (and (bvsle #b00000000000000000000000000000000 (size!3786 (_keys!5462 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3786 (_keys!5462 thiss!1248)) (size!3786 (_keys!5462 thiss!1248))))))

(assert (=> d!53423 (= (arrayCountValidKeys!0 (_keys!5462 thiss!1248) #b00000000000000000000000000000000 (size!3786 (_keys!5462 thiss!1248))) lt!86753)))

(declare-fun bm!17755 () Bool)

(assert (=> bm!17755 (= call!17758 (arrayCountValidKeys!0 (_keys!5462 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3786 (_keys!5462 thiss!1248))))))

(assert (= (and d!53423 c!31414) b!175326))

(assert (= (and d!53423 (not c!31414)) b!175325))

(assert (= (and b!175325 c!31415) b!175327))

(assert (= (and b!175325 (not c!31415)) b!175324))

(assert (= (or b!175327 b!175324) bm!17755))

(assert (=> b!175325 m!204083))

(assert (=> b!175325 m!204083))

(assert (=> b!175325 m!204129))

(declare-fun m!204227 () Bool)

(assert (=> bm!17755 m!204227))

(assert (=> b!175186 d!53423))

(declare-fun d!53425 () Bool)

(assert (=> d!53425 (= (apply!133 lt!86678 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1984 (getValueByKey!188 (toList!1108 lt!86678) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7232 () Bool)

(assert (= bs!7232 d!53425))

(declare-fun m!204229 () Bool)

(assert (=> bs!7232 m!204229))

(assert (=> bs!7232 m!204229))

(declare-fun m!204231 () Bool)

(assert (=> bs!7232 m!204231))

(assert (=> b!175161 d!53425))

(declare-fun b!175339 () Bool)

(declare-fun e!115736 () Bool)

(assert (=> b!175339 (= e!115736 (and (bvsge (extraKeys!3351 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3351 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1210 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!53427 () Bool)

(declare-fun res!83120 () Bool)

(assert (=> d!53427 (=> (not res!83120) (not e!115736))))

(assert (=> d!53427 (= res!83120 (validMask!0 (mask!8503 thiss!1248)))))

(assert (=> d!53427 (= (simpleValid!147 thiss!1248) e!115736)))

(declare-fun b!175338 () Bool)

(declare-fun res!83119 () Bool)

(assert (=> b!175338 (=> (not res!83119) (not e!115736))))

(declare-fun size!3790 (LongMapFixedSize!2322) (_ BitVec 32))

(assert (=> b!175338 (= res!83119 (= (size!3790 thiss!1248) (bvadd (_size!1210 thiss!1248) (bvsdiv (bvadd (extraKeys!3351 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!175336 () Bool)

(declare-fun res!83118 () Bool)

(assert (=> b!175336 (=> (not res!83118) (not e!115736))))

(assert (=> b!175336 (= res!83118 (and (= (size!3787 (_values!3597 thiss!1248)) (bvadd (mask!8503 thiss!1248) #b00000000000000000000000000000001)) (= (size!3786 (_keys!5462 thiss!1248)) (size!3787 (_values!3597 thiss!1248))) (bvsge (_size!1210 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1210 thiss!1248) (bvadd (mask!8503 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!175337 () Bool)

(declare-fun res!83121 () Bool)

(assert (=> b!175337 (=> (not res!83121) (not e!115736))))

(assert (=> b!175337 (= res!83121 (bvsge (size!3790 thiss!1248) (_size!1210 thiss!1248)))))

(assert (= (and d!53427 res!83120) b!175336))

(assert (= (and b!175336 res!83118) b!175337))

(assert (= (and b!175337 res!83121) b!175338))

(assert (= (and b!175338 res!83119) b!175339))

(assert (=> d!53427 m!204027))

(declare-fun m!204233 () Bool)

(assert (=> b!175338 m!204233))

(assert (=> b!175337 m!204233))

(assert (=> d!53395 d!53427))

(declare-fun b!175352 () Bool)

(declare-fun e!115745 () SeekEntryResult!549)

(assert (=> b!175352 (= e!115745 Undefined!549)))

(declare-fun b!175353 () Bool)

(declare-fun c!31424 () Bool)

(declare-fun lt!86759 () (_ BitVec 64))

(assert (=> b!175353 (= c!31424 (= lt!86759 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115743 () SeekEntryResult!549)

(declare-fun e!115744 () SeekEntryResult!549)

(assert (=> b!175353 (= e!115743 e!115744)))

(declare-fun d!53429 () Bool)

(declare-fun lt!86758 () SeekEntryResult!549)

(assert (=> d!53429 (and (or ((_ is Undefined!549) lt!86758) (not ((_ is Found!549) lt!86758)) (and (bvsge (index!4365 lt!86758) #b00000000000000000000000000000000) (bvslt (index!4365 lt!86758) (size!3786 (_keys!5462 thiss!1248))))) (or ((_ is Undefined!549) lt!86758) ((_ is Found!549) lt!86758) (not ((_ is MissingVacant!549) lt!86758)) (not (= (index!4367 lt!86758) (index!4366 lt!86609))) (and (bvsge (index!4367 lt!86758) #b00000000000000000000000000000000) (bvslt (index!4367 lt!86758) (size!3786 (_keys!5462 thiss!1248))))) (or ((_ is Undefined!549) lt!86758) (ite ((_ is Found!549) lt!86758) (= (select (arr!3485 (_keys!5462 thiss!1248)) (index!4365 lt!86758)) key!828) (and ((_ is MissingVacant!549) lt!86758) (= (index!4367 lt!86758) (index!4366 lt!86609)) (= (select (arr!3485 (_keys!5462 thiss!1248)) (index!4367 lt!86758)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!53429 (= lt!86758 e!115745)))

(declare-fun c!31423 () Bool)

(assert (=> d!53429 (= c!31423 (bvsge (x!19263 lt!86609) #b01111111111111111111111111111110))))

(assert (=> d!53429 (= lt!86759 (select (arr!3485 (_keys!5462 thiss!1248)) (index!4366 lt!86609)))))

(assert (=> d!53429 (validMask!0 (mask!8503 thiss!1248))))

(assert (=> d!53429 (= (seekKeyOrZeroReturnVacant!0 (x!19263 lt!86609) (index!4366 lt!86609) (index!4366 lt!86609) key!828 (_keys!5462 thiss!1248) (mask!8503 thiss!1248)) lt!86758)))

(declare-fun b!175354 () Bool)

(assert (=> b!175354 (= e!115743 (Found!549 (index!4366 lt!86609)))))

(declare-fun b!175355 () Bool)

(assert (=> b!175355 (= e!115745 e!115743)))

(declare-fun c!31422 () Bool)

(assert (=> b!175355 (= c!31422 (= lt!86759 key!828))))

(declare-fun b!175356 () Bool)

(assert (=> b!175356 (= e!115744 (MissingVacant!549 (index!4366 lt!86609)))))

(declare-fun b!175357 () Bool)

(assert (=> b!175357 (= e!115744 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19263 lt!86609) #b00000000000000000000000000000001) (nextIndex!0 (index!4366 lt!86609) (x!19263 lt!86609) (mask!8503 thiss!1248)) (index!4366 lt!86609) key!828 (_keys!5462 thiss!1248) (mask!8503 thiss!1248)))))

(assert (= (and d!53429 c!31423) b!175352))

(assert (= (and d!53429 (not c!31423)) b!175355))

(assert (= (and b!175355 c!31422) b!175354))

(assert (= (and b!175355 (not c!31422)) b!175353))

(assert (= (and b!175353 c!31424) b!175356))

(assert (= (and b!175353 (not c!31424)) b!175357))

(declare-fun m!204235 () Bool)

(assert (=> d!53429 m!204235))

(declare-fun m!204237 () Bool)

(assert (=> d!53429 m!204237))

(assert (=> d!53429 m!204055))

(assert (=> d!53429 m!204027))

(declare-fun m!204239 () Bool)

(assert (=> b!175357 m!204239))

(assert (=> b!175357 m!204239))

(declare-fun m!204241 () Bool)

(assert (=> b!175357 m!204241))

(assert (=> b!175103 d!53429))

(declare-fun d!53431 () Bool)

(assert (=> d!53431 (isDefined!141 (getValueByKey!188 (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248))) key!828))))

(declare-fun lt!86762 () Unit!5376)

(declare-fun choose!937 (List!2218 (_ BitVec 64)) Unit!5376)

(assert (=> d!53431 (= lt!86762 (choose!937 (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248))) key!828))))

(declare-fun e!115748 () Bool)

(assert (=> d!53431 e!115748))

(declare-fun res!83124 () Bool)

(assert (=> d!53431 (=> (not res!83124) (not e!115748))))

(declare-fun isStrictlySorted!334 (List!2218) Bool)

(assert (=> d!53431 (= res!83124 (isStrictlySorted!334 (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248)))))))

(assert (=> d!53431 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!140 (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248))) key!828) lt!86762)))

(declare-fun b!175360 () Bool)

(assert (=> b!175360 (= e!115748 (containsKey!192 (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248))) key!828))))

(assert (= (and d!53431 res!83124) b!175360))

(assert (=> d!53431 m!204073))

(assert (=> d!53431 m!204073))

(assert (=> d!53431 m!204075))

(declare-fun m!204243 () Bool)

(assert (=> d!53431 m!204243))

(declare-fun m!204245 () Bool)

(assert (=> d!53431 m!204245))

(assert (=> b!175360 m!204069))

(assert (=> b!175112 d!53431))

(assert (=> b!175112 d!53415))

(assert (=> b!175112 d!53417))

(declare-fun d!53433 () Bool)

(declare-fun e!115750 () Bool)

(assert (=> d!53433 e!115750))

(declare-fun res!83125 () Bool)

(assert (=> d!53433 (=> res!83125 e!115750)))

(declare-fun lt!86765 () Bool)

(assert (=> d!53433 (= res!83125 (not lt!86765))))

(declare-fun lt!86766 () Bool)

(assert (=> d!53433 (= lt!86765 lt!86766)))

(declare-fun lt!86763 () Unit!5376)

(declare-fun e!115749 () Unit!5376)

(assert (=> d!53433 (= lt!86763 e!115749)))

(declare-fun c!31425 () Bool)

(assert (=> d!53433 (= c!31425 lt!86766)))

(assert (=> d!53433 (= lt!86766 (containsKey!192 (toList!1108 lt!86678) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53433 (= (contains!1166 lt!86678 #b1000000000000000000000000000000000000000000000000000000000000000) lt!86765)))

(declare-fun b!175361 () Bool)

(declare-fun lt!86764 () Unit!5376)

(assert (=> b!175361 (= e!115749 lt!86764)))

(assert (=> b!175361 (= lt!86764 (lemmaContainsKeyImpliesGetValueByKeyDefined!140 (toList!1108 lt!86678) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175361 (isDefined!141 (getValueByKey!188 (toList!1108 lt!86678) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175362 () Bool)

(declare-fun Unit!5381 () Unit!5376)

(assert (=> b!175362 (= e!115749 Unit!5381)))

(declare-fun b!175363 () Bool)

(assert (=> b!175363 (= e!115750 (isDefined!141 (getValueByKey!188 (toList!1108 lt!86678) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53433 c!31425) b!175361))

(assert (= (and d!53433 (not c!31425)) b!175362))

(assert (= (and d!53433 (not res!83125)) b!175363))

(declare-fun m!204247 () Bool)

(assert (=> d!53433 m!204247))

(declare-fun m!204249 () Bool)

(assert (=> b!175361 m!204249))

(assert (=> b!175361 m!204229))

(assert (=> b!175361 m!204229))

(declare-fun m!204251 () Bool)

(assert (=> b!175361 m!204251))

(assert (=> b!175363 m!204229))

(assert (=> b!175363 m!204229))

(assert (=> b!175363 m!204251))

(assert (=> bm!17739 d!53433))

(declare-fun d!53435 () Bool)

(declare-fun e!115751 () Bool)

(assert (=> d!53435 e!115751))

(declare-fun res!83127 () Bool)

(assert (=> d!53435 (=> (not res!83127) (not e!115751))))

(declare-fun lt!86768 () ListLongMap!2185)

(assert (=> d!53435 (= res!83127 (contains!1166 lt!86768 (_1!1640 (tuple2!3259 lt!86669 (minValue!3455 thiss!1248)))))))

(declare-fun lt!86769 () List!2218)

(assert (=> d!53435 (= lt!86768 (ListLongMap!2186 lt!86769))))

(declare-fun lt!86767 () Unit!5376)

(declare-fun lt!86770 () Unit!5376)

(assert (=> d!53435 (= lt!86767 lt!86770)))

(assert (=> d!53435 (= (getValueByKey!188 lt!86769 (_1!1640 (tuple2!3259 lt!86669 (minValue!3455 thiss!1248)))) (Some!193 (_2!1640 (tuple2!3259 lt!86669 (minValue!3455 thiss!1248)))))))

(assert (=> d!53435 (= lt!86770 (lemmaContainsTupThenGetReturnValue!100 lt!86769 (_1!1640 (tuple2!3259 lt!86669 (minValue!3455 thiss!1248))) (_2!1640 (tuple2!3259 lt!86669 (minValue!3455 thiss!1248)))))))

(assert (=> d!53435 (= lt!86769 (insertStrictlySorted!103 (toList!1108 lt!86686) (_1!1640 (tuple2!3259 lt!86669 (minValue!3455 thiss!1248))) (_2!1640 (tuple2!3259 lt!86669 (minValue!3455 thiss!1248)))))))

(assert (=> d!53435 (= (+!250 lt!86686 (tuple2!3259 lt!86669 (minValue!3455 thiss!1248))) lt!86768)))

(declare-fun b!175364 () Bool)

(declare-fun res!83126 () Bool)

(assert (=> b!175364 (=> (not res!83126) (not e!115751))))

(assert (=> b!175364 (= res!83126 (= (getValueByKey!188 (toList!1108 lt!86768) (_1!1640 (tuple2!3259 lt!86669 (minValue!3455 thiss!1248)))) (Some!193 (_2!1640 (tuple2!3259 lt!86669 (minValue!3455 thiss!1248))))))))

(declare-fun b!175365 () Bool)

(assert (=> b!175365 (= e!115751 (contains!1167 (toList!1108 lt!86768) (tuple2!3259 lt!86669 (minValue!3455 thiss!1248))))))

(assert (= (and d!53435 res!83127) b!175364))

(assert (= (and b!175364 res!83126) b!175365))

(declare-fun m!204253 () Bool)

(assert (=> d!53435 m!204253))

(declare-fun m!204255 () Bool)

(assert (=> d!53435 m!204255))

(declare-fun m!204257 () Bool)

(assert (=> d!53435 m!204257))

(declare-fun m!204259 () Bool)

(assert (=> d!53435 m!204259))

(declare-fun m!204261 () Bool)

(assert (=> b!175364 m!204261))

(declare-fun m!204263 () Bool)

(assert (=> b!175365 m!204263))

(assert (=> b!175167 d!53435))

(assert (=> b!175167 d!53401))

(declare-fun d!53437 () Bool)

(declare-fun e!115752 () Bool)

(assert (=> d!53437 e!115752))

(declare-fun res!83129 () Bool)

(assert (=> d!53437 (=> (not res!83129) (not e!115752))))

(declare-fun lt!86772 () ListLongMap!2185)

(assert (=> d!53437 (= res!83129 (contains!1166 lt!86772 (_1!1640 (tuple2!3259 lt!86674 (zeroValue!3455 thiss!1248)))))))

(declare-fun lt!86773 () List!2218)

(assert (=> d!53437 (= lt!86772 (ListLongMap!2186 lt!86773))))

(declare-fun lt!86771 () Unit!5376)

(declare-fun lt!86774 () Unit!5376)

(assert (=> d!53437 (= lt!86771 lt!86774)))

(assert (=> d!53437 (= (getValueByKey!188 lt!86773 (_1!1640 (tuple2!3259 lt!86674 (zeroValue!3455 thiss!1248)))) (Some!193 (_2!1640 (tuple2!3259 lt!86674 (zeroValue!3455 thiss!1248)))))))

(assert (=> d!53437 (= lt!86774 (lemmaContainsTupThenGetReturnValue!100 lt!86773 (_1!1640 (tuple2!3259 lt!86674 (zeroValue!3455 thiss!1248))) (_2!1640 (tuple2!3259 lt!86674 (zeroValue!3455 thiss!1248)))))))

(assert (=> d!53437 (= lt!86773 (insertStrictlySorted!103 (toList!1108 lt!86670) (_1!1640 (tuple2!3259 lt!86674 (zeroValue!3455 thiss!1248))) (_2!1640 (tuple2!3259 lt!86674 (zeroValue!3455 thiss!1248)))))))

(assert (=> d!53437 (= (+!250 lt!86670 (tuple2!3259 lt!86674 (zeroValue!3455 thiss!1248))) lt!86772)))

(declare-fun b!175366 () Bool)

(declare-fun res!83128 () Bool)

(assert (=> b!175366 (=> (not res!83128) (not e!115752))))

(assert (=> b!175366 (= res!83128 (= (getValueByKey!188 (toList!1108 lt!86772) (_1!1640 (tuple2!3259 lt!86674 (zeroValue!3455 thiss!1248)))) (Some!193 (_2!1640 (tuple2!3259 lt!86674 (zeroValue!3455 thiss!1248))))))))

(declare-fun b!175367 () Bool)

(assert (=> b!175367 (= e!115752 (contains!1167 (toList!1108 lt!86772) (tuple2!3259 lt!86674 (zeroValue!3455 thiss!1248))))))

(assert (= (and d!53437 res!83129) b!175366))

(assert (= (and b!175366 res!83128) b!175367))

(declare-fun m!204265 () Bool)

(assert (=> d!53437 m!204265))

(declare-fun m!204267 () Bool)

(assert (=> d!53437 m!204267))

(declare-fun m!204269 () Bool)

(assert (=> d!53437 m!204269))

(declare-fun m!204271 () Bool)

(assert (=> d!53437 m!204271))

(declare-fun m!204273 () Bool)

(assert (=> b!175366 m!204273))

(declare-fun m!204275 () Bool)

(assert (=> b!175367 m!204275))

(assert (=> b!175167 d!53437))

(declare-fun d!53439 () Bool)

(assert (=> d!53439 (= (apply!133 lt!86686 lt!86680) (get!1984 (getValueByKey!188 (toList!1108 lt!86686) lt!86680)))))

(declare-fun bs!7233 () Bool)

(assert (= bs!7233 d!53439))

(declare-fun m!204277 () Bool)

(assert (=> bs!7233 m!204277))

(assert (=> bs!7233 m!204277))

(declare-fun m!204279 () Bool)

(assert (=> bs!7233 m!204279))

(assert (=> b!175167 d!53439))

(declare-fun d!53441 () Bool)

(declare-fun e!115754 () Bool)

(assert (=> d!53441 e!115754))

(declare-fun res!83130 () Bool)

(assert (=> d!53441 (=> res!83130 e!115754)))

(declare-fun lt!86777 () Bool)

(assert (=> d!53441 (= res!83130 (not lt!86777))))

(declare-fun lt!86778 () Bool)

(assert (=> d!53441 (= lt!86777 lt!86778)))

(declare-fun lt!86775 () Unit!5376)

(declare-fun e!115753 () Unit!5376)

(assert (=> d!53441 (= lt!86775 e!115753)))

(declare-fun c!31426 () Bool)

(assert (=> d!53441 (= c!31426 lt!86778)))

(assert (=> d!53441 (= lt!86778 (containsKey!192 (toList!1108 (+!250 lt!86670 (tuple2!3259 lt!86674 (zeroValue!3455 thiss!1248)))) lt!86681))))

(assert (=> d!53441 (= (contains!1166 (+!250 lt!86670 (tuple2!3259 lt!86674 (zeroValue!3455 thiss!1248))) lt!86681) lt!86777)))

(declare-fun b!175368 () Bool)

(declare-fun lt!86776 () Unit!5376)

(assert (=> b!175368 (= e!115753 lt!86776)))

(assert (=> b!175368 (= lt!86776 (lemmaContainsKeyImpliesGetValueByKeyDefined!140 (toList!1108 (+!250 lt!86670 (tuple2!3259 lt!86674 (zeroValue!3455 thiss!1248)))) lt!86681))))

(assert (=> b!175368 (isDefined!141 (getValueByKey!188 (toList!1108 (+!250 lt!86670 (tuple2!3259 lt!86674 (zeroValue!3455 thiss!1248)))) lt!86681))))

(declare-fun b!175369 () Bool)

(declare-fun Unit!5382 () Unit!5376)

(assert (=> b!175369 (= e!115753 Unit!5382)))

(declare-fun b!175370 () Bool)

(assert (=> b!175370 (= e!115754 (isDefined!141 (getValueByKey!188 (toList!1108 (+!250 lt!86670 (tuple2!3259 lt!86674 (zeroValue!3455 thiss!1248)))) lt!86681)))))

(assert (= (and d!53441 c!31426) b!175368))

(assert (= (and d!53441 (not c!31426)) b!175369))

(assert (= (and d!53441 (not res!83130)) b!175370))

(declare-fun m!204281 () Bool)

(assert (=> d!53441 m!204281))

(declare-fun m!204283 () Bool)

(assert (=> b!175368 m!204283))

(declare-fun m!204285 () Bool)

(assert (=> b!175368 m!204285))

(assert (=> b!175368 m!204285))

(declare-fun m!204287 () Bool)

(assert (=> b!175368 m!204287))

(assert (=> b!175370 m!204285))

(assert (=> b!175370 m!204285))

(assert (=> b!175370 m!204287))

(assert (=> b!175167 d!53441))

(declare-fun d!53443 () Bool)

(assert (=> d!53443 (= (apply!133 (+!250 lt!86683 (tuple2!3259 lt!86675 (minValue!3455 thiss!1248))) lt!86685) (apply!133 lt!86683 lt!86685))))

(declare-fun lt!86781 () Unit!5376)

(declare-fun choose!938 (ListLongMap!2185 (_ BitVec 64) V!5115 (_ BitVec 64)) Unit!5376)

(assert (=> d!53443 (= lt!86781 (choose!938 lt!86683 lt!86675 (minValue!3455 thiss!1248) lt!86685))))

(declare-fun e!115757 () Bool)

(assert (=> d!53443 e!115757))

(declare-fun res!83133 () Bool)

(assert (=> d!53443 (=> (not res!83133) (not e!115757))))

(assert (=> d!53443 (= res!83133 (contains!1166 lt!86683 lt!86685))))

(assert (=> d!53443 (= (addApplyDifferent!109 lt!86683 lt!86675 (minValue!3455 thiss!1248) lt!86685) lt!86781)))

(declare-fun b!175374 () Bool)

(assert (=> b!175374 (= e!115757 (not (= lt!86685 lt!86675)))))

(assert (= (and d!53443 res!83133) b!175374))

(assert (=> d!53443 m!204097))

(declare-fun m!204289 () Bool)

(assert (=> d!53443 m!204289))

(assert (=> d!53443 m!204099))

(assert (=> d!53443 m!204101))

(assert (=> d!53443 m!204099))

(declare-fun m!204291 () Bool)

(assert (=> d!53443 m!204291))

(assert (=> b!175167 d!53443))

(declare-fun d!53445 () Bool)

(assert (=> d!53445 (= (apply!133 lt!86677 lt!86676) (get!1984 (getValueByKey!188 (toList!1108 lt!86677) lt!86676)))))

(declare-fun bs!7234 () Bool)

(assert (= bs!7234 d!53445))

(declare-fun m!204293 () Bool)

(assert (=> bs!7234 m!204293))

(assert (=> bs!7234 m!204293))

(declare-fun m!204295 () Bool)

(assert (=> bs!7234 m!204295))

(assert (=> b!175167 d!53445))

(declare-fun d!53447 () Bool)

(assert (=> d!53447 (contains!1166 (+!250 lt!86670 (tuple2!3259 lt!86674 (zeroValue!3455 thiss!1248))) lt!86681)))

(declare-fun lt!86784 () Unit!5376)

(declare-fun choose!939 (ListLongMap!2185 (_ BitVec 64) V!5115 (_ BitVec 64)) Unit!5376)

(assert (=> d!53447 (= lt!86784 (choose!939 lt!86670 lt!86674 (zeroValue!3455 thiss!1248) lt!86681))))

(assert (=> d!53447 (contains!1166 lt!86670 lt!86681)))

(assert (=> d!53447 (= (addStillContains!109 lt!86670 lt!86674 (zeroValue!3455 thiss!1248) lt!86681) lt!86784)))

(declare-fun bs!7235 () Bool)

(assert (= bs!7235 d!53447))

(assert (=> bs!7235 m!204089))

(assert (=> bs!7235 m!204089))

(assert (=> bs!7235 m!204113))

(declare-fun m!204297 () Bool)

(assert (=> bs!7235 m!204297))

(declare-fun m!204299 () Bool)

(assert (=> bs!7235 m!204299))

(assert (=> b!175167 d!53447))

(declare-fun d!53449 () Bool)

(assert (=> d!53449 (= (apply!133 (+!250 lt!86683 (tuple2!3259 lt!86675 (minValue!3455 thiss!1248))) lt!86685) (get!1984 (getValueByKey!188 (toList!1108 (+!250 lt!86683 (tuple2!3259 lt!86675 (minValue!3455 thiss!1248)))) lt!86685)))))

(declare-fun bs!7236 () Bool)

(assert (= bs!7236 d!53449))

(declare-fun m!204301 () Bool)

(assert (=> bs!7236 m!204301))

(assert (=> bs!7236 m!204301))

(declare-fun m!204303 () Bool)

(assert (=> bs!7236 m!204303))

(assert (=> b!175167 d!53449))

(declare-fun d!53451 () Bool)

(declare-fun e!115758 () Bool)

(assert (=> d!53451 e!115758))

(declare-fun res!83135 () Bool)

(assert (=> d!53451 (=> (not res!83135) (not e!115758))))

(declare-fun lt!86786 () ListLongMap!2185)

(assert (=> d!53451 (= res!83135 (contains!1166 lt!86786 (_1!1640 (tuple2!3259 lt!86687 (zeroValue!3455 thiss!1248)))))))

(declare-fun lt!86787 () List!2218)

(assert (=> d!53451 (= lt!86786 (ListLongMap!2186 lt!86787))))

(declare-fun lt!86785 () Unit!5376)

(declare-fun lt!86788 () Unit!5376)

(assert (=> d!53451 (= lt!86785 lt!86788)))

(assert (=> d!53451 (= (getValueByKey!188 lt!86787 (_1!1640 (tuple2!3259 lt!86687 (zeroValue!3455 thiss!1248)))) (Some!193 (_2!1640 (tuple2!3259 lt!86687 (zeroValue!3455 thiss!1248)))))))

(assert (=> d!53451 (= lt!86788 (lemmaContainsTupThenGetReturnValue!100 lt!86787 (_1!1640 (tuple2!3259 lt!86687 (zeroValue!3455 thiss!1248))) (_2!1640 (tuple2!3259 lt!86687 (zeroValue!3455 thiss!1248)))))))

(assert (=> d!53451 (= lt!86787 (insertStrictlySorted!103 (toList!1108 lt!86677) (_1!1640 (tuple2!3259 lt!86687 (zeroValue!3455 thiss!1248))) (_2!1640 (tuple2!3259 lt!86687 (zeroValue!3455 thiss!1248)))))))

(assert (=> d!53451 (= (+!250 lt!86677 (tuple2!3259 lt!86687 (zeroValue!3455 thiss!1248))) lt!86786)))

(declare-fun b!175376 () Bool)

(declare-fun res!83134 () Bool)

(assert (=> b!175376 (=> (not res!83134) (not e!115758))))

(assert (=> b!175376 (= res!83134 (= (getValueByKey!188 (toList!1108 lt!86786) (_1!1640 (tuple2!3259 lt!86687 (zeroValue!3455 thiss!1248)))) (Some!193 (_2!1640 (tuple2!3259 lt!86687 (zeroValue!3455 thiss!1248))))))))

(declare-fun b!175377 () Bool)

(assert (=> b!175377 (= e!115758 (contains!1167 (toList!1108 lt!86786) (tuple2!3259 lt!86687 (zeroValue!3455 thiss!1248))))))

(assert (= (and d!53451 res!83135) b!175376))

(assert (= (and b!175376 res!83134) b!175377))

(declare-fun m!204305 () Bool)

(assert (=> d!53451 m!204305))

(declare-fun m!204307 () Bool)

(assert (=> d!53451 m!204307))

(declare-fun m!204309 () Bool)

(assert (=> d!53451 m!204309))

(declare-fun m!204311 () Bool)

(assert (=> d!53451 m!204311))

(declare-fun m!204313 () Bool)

(assert (=> b!175376 m!204313))

(declare-fun m!204315 () Bool)

(assert (=> b!175377 m!204315))

(assert (=> b!175167 d!53451))

(declare-fun d!53453 () Bool)

(assert (=> d!53453 (= (apply!133 (+!250 lt!86677 (tuple2!3259 lt!86687 (zeroValue!3455 thiss!1248))) lt!86676) (apply!133 lt!86677 lt!86676))))

(declare-fun lt!86789 () Unit!5376)

(assert (=> d!53453 (= lt!86789 (choose!938 lt!86677 lt!86687 (zeroValue!3455 thiss!1248) lt!86676))))

(declare-fun e!115759 () Bool)

(assert (=> d!53453 e!115759))

(declare-fun res!83136 () Bool)

(assert (=> d!53453 (=> (not res!83136) (not e!115759))))

(assert (=> d!53453 (= res!83136 (contains!1166 lt!86677 lt!86676))))

(assert (=> d!53453 (= (addApplyDifferent!109 lt!86677 lt!86687 (zeroValue!3455 thiss!1248) lt!86676) lt!86789)))

(declare-fun b!175378 () Bool)

(assert (=> b!175378 (= e!115759 (not (= lt!86676 lt!86687)))))

(assert (= (and d!53453 res!83136) b!175378))

(assert (=> d!53453 m!204091))

(declare-fun m!204317 () Bool)

(assert (=> d!53453 m!204317))

(assert (=> d!53453 m!204105))

(assert (=> d!53453 m!204107))

(assert (=> d!53453 m!204105))

(declare-fun m!204319 () Bool)

(assert (=> d!53453 m!204319))

(assert (=> b!175167 d!53453))

(declare-fun d!53455 () Bool)

(assert (=> d!53455 (= (apply!133 lt!86683 lt!86685) (get!1984 (getValueByKey!188 (toList!1108 lt!86683) lt!86685)))))

(declare-fun bs!7237 () Bool)

(assert (= bs!7237 d!53455))

(declare-fun m!204321 () Bool)

(assert (=> bs!7237 m!204321))

(assert (=> bs!7237 m!204321))

(declare-fun m!204323 () Bool)

(assert (=> bs!7237 m!204323))

(assert (=> b!175167 d!53455))

(declare-fun d!53457 () Bool)

(assert (=> d!53457 (= (apply!133 (+!250 lt!86677 (tuple2!3259 lt!86687 (zeroValue!3455 thiss!1248))) lt!86676) (get!1984 (getValueByKey!188 (toList!1108 (+!250 lt!86677 (tuple2!3259 lt!86687 (zeroValue!3455 thiss!1248)))) lt!86676)))))

(declare-fun bs!7238 () Bool)

(assert (= bs!7238 d!53457))

(declare-fun m!204325 () Bool)

(assert (=> bs!7238 m!204325))

(assert (=> bs!7238 m!204325))

(declare-fun m!204327 () Bool)

(assert (=> bs!7238 m!204327))

(assert (=> b!175167 d!53457))

(declare-fun d!53459 () Bool)

(declare-fun e!115760 () Bool)

(assert (=> d!53459 e!115760))

(declare-fun res!83138 () Bool)

(assert (=> d!53459 (=> (not res!83138) (not e!115760))))

(declare-fun lt!86791 () ListLongMap!2185)

(assert (=> d!53459 (= res!83138 (contains!1166 lt!86791 (_1!1640 (tuple2!3259 lt!86675 (minValue!3455 thiss!1248)))))))

(declare-fun lt!86792 () List!2218)

(assert (=> d!53459 (= lt!86791 (ListLongMap!2186 lt!86792))))

(declare-fun lt!86790 () Unit!5376)

(declare-fun lt!86793 () Unit!5376)

(assert (=> d!53459 (= lt!86790 lt!86793)))

(assert (=> d!53459 (= (getValueByKey!188 lt!86792 (_1!1640 (tuple2!3259 lt!86675 (minValue!3455 thiss!1248)))) (Some!193 (_2!1640 (tuple2!3259 lt!86675 (minValue!3455 thiss!1248)))))))

(assert (=> d!53459 (= lt!86793 (lemmaContainsTupThenGetReturnValue!100 lt!86792 (_1!1640 (tuple2!3259 lt!86675 (minValue!3455 thiss!1248))) (_2!1640 (tuple2!3259 lt!86675 (minValue!3455 thiss!1248)))))))

(assert (=> d!53459 (= lt!86792 (insertStrictlySorted!103 (toList!1108 lt!86683) (_1!1640 (tuple2!3259 lt!86675 (minValue!3455 thiss!1248))) (_2!1640 (tuple2!3259 lt!86675 (minValue!3455 thiss!1248)))))))

(assert (=> d!53459 (= (+!250 lt!86683 (tuple2!3259 lt!86675 (minValue!3455 thiss!1248))) lt!86791)))

(declare-fun b!175379 () Bool)

(declare-fun res!83137 () Bool)

(assert (=> b!175379 (=> (not res!83137) (not e!115760))))

(assert (=> b!175379 (= res!83137 (= (getValueByKey!188 (toList!1108 lt!86791) (_1!1640 (tuple2!3259 lt!86675 (minValue!3455 thiss!1248)))) (Some!193 (_2!1640 (tuple2!3259 lt!86675 (minValue!3455 thiss!1248))))))))

(declare-fun b!175380 () Bool)

(assert (=> b!175380 (= e!115760 (contains!1167 (toList!1108 lt!86791) (tuple2!3259 lt!86675 (minValue!3455 thiss!1248))))))

(assert (= (and d!53459 res!83138) b!175379))

(assert (= (and b!175379 res!83137) b!175380))

(declare-fun m!204329 () Bool)

(assert (=> d!53459 m!204329))

(declare-fun m!204331 () Bool)

(assert (=> d!53459 m!204331))

(declare-fun m!204333 () Bool)

(assert (=> d!53459 m!204333))

(declare-fun m!204335 () Bool)

(assert (=> d!53459 m!204335))

(declare-fun m!204337 () Bool)

(assert (=> b!175379 m!204337))

(declare-fun m!204339 () Bool)

(assert (=> b!175380 m!204339))

(assert (=> b!175167 d!53459))

(declare-fun d!53461 () Bool)

(assert (=> d!53461 (= (apply!133 (+!250 lt!86686 (tuple2!3259 lt!86669 (minValue!3455 thiss!1248))) lt!86680) (get!1984 (getValueByKey!188 (toList!1108 (+!250 lt!86686 (tuple2!3259 lt!86669 (minValue!3455 thiss!1248)))) lt!86680)))))

(declare-fun bs!7239 () Bool)

(assert (= bs!7239 d!53461))

(declare-fun m!204341 () Bool)

(assert (=> bs!7239 m!204341))

(assert (=> bs!7239 m!204341))

(declare-fun m!204343 () Bool)

(assert (=> bs!7239 m!204343))

(assert (=> b!175167 d!53461))

(declare-fun d!53463 () Bool)

(assert (=> d!53463 (= (apply!133 (+!250 lt!86686 (tuple2!3259 lt!86669 (minValue!3455 thiss!1248))) lt!86680) (apply!133 lt!86686 lt!86680))))

(declare-fun lt!86794 () Unit!5376)

(assert (=> d!53463 (= lt!86794 (choose!938 lt!86686 lt!86669 (minValue!3455 thiss!1248) lt!86680))))

(declare-fun e!115761 () Bool)

(assert (=> d!53463 e!115761))

(declare-fun res!83139 () Bool)

(assert (=> d!53463 (=> (not res!83139) (not e!115761))))

(assert (=> d!53463 (= res!83139 (contains!1166 lt!86686 lt!86680))))

(assert (=> d!53463 (= (addApplyDifferent!109 lt!86686 lt!86669 (minValue!3455 thiss!1248) lt!86680) lt!86794)))

(declare-fun b!175381 () Bool)

(assert (=> b!175381 (= e!115761 (not (= lt!86680 lt!86669)))))

(assert (= (and d!53463 res!83139) b!175381))

(assert (=> d!53463 m!204115))

(declare-fun m!204345 () Bool)

(assert (=> d!53463 m!204345))

(assert (=> d!53463 m!204103))

(assert (=> d!53463 m!204111))

(assert (=> d!53463 m!204103))

(declare-fun m!204347 () Bool)

(assert (=> d!53463 m!204347))

(assert (=> b!175167 d!53463))

(declare-fun d!53465 () Bool)

(declare-fun res!83144 () Bool)

(declare-fun e!115766 () Bool)

(assert (=> d!53465 (=> res!83144 e!115766)))

(assert (=> d!53465 (= res!83144 (and ((_ is Cons!2214) (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248)))) (= (_1!1640 (h!2832 (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248))))) key!828)))))

(assert (=> d!53465 (= (containsKey!192 (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248))) key!828) e!115766)))

(declare-fun b!175386 () Bool)

(declare-fun e!115767 () Bool)

(assert (=> b!175386 (= e!115766 e!115767)))

(declare-fun res!83145 () Bool)

(assert (=> b!175386 (=> (not res!83145) (not e!115767))))

(assert (=> b!175386 (= res!83145 (and (or (not ((_ is Cons!2214) (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248))))) (bvsle (_1!1640 (h!2832 (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248))))) key!828)) ((_ is Cons!2214) (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248)))) (bvslt (_1!1640 (h!2832 (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248))))) key!828)))))

(declare-fun b!175387 () Bool)

(assert (=> b!175387 (= e!115767 (containsKey!192 (t!7034 (toList!1108 (getCurrentListMap!760 (_keys!5462 thiss!1248) (_values!3597 thiss!1248) (mask!8503 thiss!1248) (extraKeys!3351 thiss!1248) (zeroValue!3455 thiss!1248) (minValue!3455 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3614 thiss!1248)))) key!828))))

(assert (= (and d!53465 (not res!83144)) b!175386))

(assert (= (and b!175386 res!83145) b!175387))

(declare-fun m!204349 () Bool)

(assert (=> b!175387 m!204349))

(assert (=> d!53391 d!53465))

(declare-fun d!53467 () Bool)

(assert (=> d!53467 (= (apply!133 lt!86678 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1984 (getValueByKey!188 (toList!1108 lt!86678) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7240 () Bool)

(assert (= bs!7240 d!53467))

(declare-fun m!204351 () Bool)

(assert (=> bs!7240 m!204351))

(assert (=> bs!7240 m!204351))

(declare-fun m!204353 () Bool)

(assert (=> bs!7240 m!204353))

(assert (=> b!175175 d!53467))

(assert (=> b!175158 d!53399))

(declare-fun d!53469 () Bool)

(declare-fun e!115769 () Bool)

(assert (=> d!53469 e!115769))

(declare-fun res!83146 () Bool)

(assert (=> d!53469 (=> res!83146 e!115769)))

(declare-fun lt!86797 () Bool)

(assert (=> d!53469 (= res!83146 (not lt!86797))))

(declare-fun lt!86798 () Bool)

(assert (=> d!53469 (= lt!86797 lt!86798)))

(declare-fun lt!86795 () Unit!5376)

(declare-fun e!115768 () Unit!5376)

(assert (=> d!53469 (= lt!86795 e!115768)))

(declare-fun c!31427 () Bool)

(assert (=> d!53469 (= c!31427 lt!86798)))

(assert (=> d!53469 (= lt!86798 (containsKey!192 (toList!1108 lt!86678) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53469 (= (contains!1166 lt!86678 #b0000000000000000000000000000000000000000000000000000000000000000) lt!86797)))

(declare-fun b!175388 () Bool)

(declare-fun lt!86796 () Unit!5376)

(assert (=> b!175388 (= e!115768 lt!86796)))

(assert (=> b!175388 (= lt!86796 (lemmaContainsKeyImpliesGetValueByKeyDefined!140 (toList!1108 lt!86678) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175388 (isDefined!141 (getValueByKey!188 (toList!1108 lt!86678) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175389 () Bool)

(declare-fun Unit!5383 () Unit!5376)

(assert (=> b!175389 (= e!115768 Unit!5383)))

(declare-fun b!175390 () Bool)

(assert (=> b!175390 (= e!115769 (isDefined!141 (getValueByKey!188 (toList!1108 lt!86678) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53469 c!31427) b!175388))

(assert (= (and d!53469 (not c!31427)) b!175389))

(assert (= (and d!53469 (not res!83146)) b!175390))

(declare-fun m!204355 () Bool)

(assert (=> d!53469 m!204355))

(declare-fun m!204357 () Bool)

(assert (=> b!175388 m!204357))

(assert (=> b!175388 m!204351))

(assert (=> b!175388 m!204351))

(declare-fun m!204359 () Bool)

(assert (=> b!175388 m!204359))

(assert (=> b!175390 m!204351))

(assert (=> b!175390 m!204351))

(assert (=> b!175390 m!204359))

(assert (=> bm!17738 d!53469))

(declare-fun condMapEmpty!6997 () Bool)

(declare-fun mapDefault!6997 () ValueCell!1707)

(assert (=> mapNonEmpty!6996 (= condMapEmpty!6997 (= mapRest!6996 ((as const (Array (_ BitVec 32) ValueCell!1707)) mapDefault!6997)))))

(declare-fun e!115771 () Bool)

(declare-fun mapRes!6997 () Bool)

(assert (=> mapNonEmpty!6996 (= tp!15672 (and e!115771 mapRes!6997))))

(declare-fun b!175391 () Bool)

(declare-fun e!115770 () Bool)

(assert (=> b!175391 (= e!115770 tp_is_empty!4101)))

(declare-fun b!175392 () Bool)

(assert (=> b!175392 (= e!115771 tp_is_empty!4101)))

(declare-fun mapIsEmpty!6997 () Bool)

(assert (=> mapIsEmpty!6997 mapRes!6997))

(declare-fun mapNonEmpty!6997 () Bool)

(declare-fun tp!15673 () Bool)

(assert (=> mapNonEmpty!6997 (= mapRes!6997 (and tp!15673 e!115770))))

(declare-fun mapKey!6997 () (_ BitVec 32))

(declare-fun mapValue!6997 () ValueCell!1707)

(declare-fun mapRest!6997 () (Array (_ BitVec 32) ValueCell!1707))

(assert (=> mapNonEmpty!6997 (= mapRest!6996 (store mapRest!6997 mapKey!6997 mapValue!6997))))

(assert (= (and mapNonEmpty!6996 condMapEmpty!6997) mapIsEmpty!6997))

(assert (= (and mapNonEmpty!6996 (not condMapEmpty!6997)) mapNonEmpty!6997))

(assert (= (and mapNonEmpty!6997 ((_ is ValueCellFull!1707) mapValue!6997)) b!175391))

(assert (= (and mapNonEmpty!6996 ((_ is ValueCellFull!1707) mapDefault!6997)) b!175392))

(declare-fun m!204361 () Bool)

(assert (=> mapNonEmpty!6997 m!204361))

(declare-fun b_lambda!7007 () Bool)

(assert (= b_lambda!7005 (or (and b!175053 b_free!4329) b_lambda!7007)))

(declare-fun b_lambda!7009 () Bool)

(assert (= b_lambda!7003 (or (and b!175053 b_free!4329) b_lambda!7009)))

(check-sat (not b!175235) (not b!175255) (not d!53427) (not bm!17749) (not d!53457) (not b!175360) (not d!53445) (not b!175364) (not b!175231) (not d!53439) tp_is_empty!4101 (not b!175201) (not b!175325) (not d!53413) (not b!175363) (not d!53429) (not b!175286) (not b!175202) (not d!53459) (not d!53449) (not d!53463) (not b_next!4329) (not d!53431) (not b!175388) (not d!53451) (not d!53443) (not b!175295) (not b!175232) (not d!53453) (not b!175365) (not b!175337) (not b!175380) (not b!175387) (not b_lambda!7007) (not b!175227) (not b!175233) (not b!175366) (not b!175252) (not b!175377) (not b!175370) (not b!175251) (not d!53435) (not d!53461) (not d!53455) (not bm!17752) (not b!175308) (not d!53397) b_and!10811 (not d!53441) (not d!53415) (not bm!17746) (not b!175390) (not d!53409) (not b_lambda!7009) (not b!175361) (not b!175379) (not d!53419) (not b!175338) (not d!53433) (not b!175376) (not b!175368) (not b!175357) (not mapNonEmpty!6997) (not b!175236) (not b!175267) (not b!175239) (not b!175314) (not d!53403) (not d!53425) (not b_lambda!7001) (not b!175228) (not d!53447) (not bm!17755) (not b!175230) (not b!175315) (not d!53401) (not b!175264) (not d!53467) (not d!53469) (not b!175367) (not b!175297) (not b!175240) (not d!53437))
(check-sat b_and!10811 (not b_next!4329))
