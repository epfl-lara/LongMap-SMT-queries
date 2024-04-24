; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19478 () Bool)

(assert start!19478)

(declare-fun b!191285 () Bool)

(declare-fun b_free!4675 () Bool)

(declare-fun b_next!4675 () Bool)

(assert (=> b!191285 (= b_free!4675 (not b_next!4675))))

(declare-fun tp!16872 () Bool)

(declare-fun b_and!11359 () Bool)

(assert (=> b!191285 (= tp!16872 b_and!11359)))

(declare-fun res!90408 () Bool)

(declare-fun e!125862 () Bool)

(assert (=> start!19478 (=> (not res!90408) (not e!125862))))

(declare-datatypes ((V!5577 0))(
  ( (V!5578 (val!2268 Int)) )
))
(declare-datatypes ((ValueCell!1880 0))(
  ( (ValueCellFull!1880 (v!4206 V!5577)) (EmptyCell!1880) )
))
(declare-datatypes ((array!8117 0))(
  ( (array!8118 (arr!3824 (Array (_ BitVec 32) (_ BitVec 64))) (size!4146 (_ BitVec 32))) )
))
(declare-datatypes ((array!8119 0))(
  ( (array!8120 (arr!3825 (Array (_ BitVec 32) ValueCell!1880)) (size!4147 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2668 0))(
  ( (LongMapFixedSize!2669 (defaultEntry!3902 Int) (mask!9118 (_ BitVec 32)) (extraKeys!3639 (_ BitVec 32)) (zeroValue!3743 V!5577) (minValue!3743 V!5577) (_size!1383 (_ BitVec 32)) (_keys!5879 array!8117) (_values!3885 array!8119) (_vacant!1383 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2668)

(declare-fun valid!1119 (LongMapFixedSize!2668) Bool)

(assert (=> start!19478 (= res!90408 (valid!1119 thiss!1248))))

(assert (=> start!19478 e!125862))

(declare-fun e!125858 () Bool)

(assert (=> start!19478 e!125858))

(assert (=> start!19478 true))

(declare-fun tp_is_empty!4447 () Bool)

(assert (=> start!19478 tp_is_empty!4447))

(declare-fun b!191284 () Bool)

(declare-fun e!125867 () Bool)

(declare-fun e!125865 () Bool)

(assert (=> b!191284 (= e!125867 (not e!125865))))

(declare-fun res!90412 () Bool)

(assert (=> b!191284 (=> res!90412 e!125865)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!191284 (= res!90412 (not (validMask!0 (mask!9118 thiss!1248))))))

(declare-datatypes ((SeekEntryResult!666 0))(
  ( (MissingZero!666 (index!4834 (_ BitVec 32))) (Found!666 (index!4835 (_ BitVec 32))) (Intermediate!666 (undefined!1478 Bool) (index!4836 (_ BitVec 32)) (x!20520 (_ BitVec 32))) (Undefined!666) (MissingVacant!666 (index!4837 (_ BitVec 32))) )
))
(declare-fun lt!94959 () SeekEntryResult!666)

(declare-datatypes ((tuple2!3474 0))(
  ( (tuple2!3475 (_1!1748 (_ BitVec 64)) (_2!1748 V!5577)) )
))
(declare-datatypes ((List!2385 0))(
  ( (Nil!2382) (Cons!2381 (h!3020 tuple2!3474) (t!7289 List!2385)) )
))
(declare-datatypes ((ListLongMap!2395 0))(
  ( (ListLongMap!2396 (toList!1213 List!2385)) )
))
(declare-fun lt!94961 () ListLongMap!2395)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!5577)

(declare-fun +!306 (ListLongMap!2395 tuple2!3474) ListLongMap!2395)

(declare-fun getCurrentListMap!865 (array!8117 array!8119 (_ BitVec 32) (_ BitVec 32) V!5577 V!5577 (_ BitVec 32) Int) ListLongMap!2395)

(assert (=> b!191284 (= (+!306 lt!94961 (tuple2!3475 key!828 v!309)) (getCurrentListMap!865 (_keys!5879 thiss!1248) (array!8120 (store (arr!3825 (_values!3885 thiss!1248)) (index!4835 lt!94959) (ValueCellFull!1880 v!309)) (size!4147 (_values!3885 thiss!1248))) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-datatypes ((Unit!5773 0))(
  ( (Unit!5774) )
))
(declare-fun lt!94960 () Unit!5773)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!110 (array!8117 array!8119 (_ BitVec 32) (_ BitVec 32) V!5577 V!5577 (_ BitVec 32) (_ BitVec 64) V!5577 Int) Unit!5773)

(assert (=> b!191284 (= lt!94960 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!110 (_keys!5879 thiss!1248) (_values!3885 thiss!1248) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) (index!4835 lt!94959) key!828 v!309 (defaultEntry!3902 thiss!1248)))))

(declare-fun lt!94958 () Unit!5773)

(declare-fun e!125864 () Unit!5773)

(assert (=> b!191284 (= lt!94958 e!125864)))

(declare-fun c!34440 () Bool)

(declare-fun contains!1338 (ListLongMap!2395 (_ BitVec 64)) Bool)

(assert (=> b!191284 (= c!34440 (contains!1338 lt!94961 key!828))))

(assert (=> b!191284 (= lt!94961 (getCurrentListMap!865 (_keys!5879 thiss!1248) (_values!3885 thiss!1248) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun e!125860 () Bool)

(declare-fun array_inv!2465 (array!8117) Bool)

(declare-fun array_inv!2466 (array!8119) Bool)

(assert (=> b!191285 (= e!125858 (and tp!16872 tp_is_empty!4447 (array_inv!2465 (_keys!5879 thiss!1248)) (array_inv!2466 (_values!3885 thiss!1248)) e!125860))))

(declare-fun e!125863 () Bool)

(declare-fun b!191286 () Bool)

(assert (=> b!191286 (= e!125863 (= (select (arr!3824 (_keys!5879 thiss!1248)) (index!4835 lt!94959)) key!828))))

(declare-fun b!191287 () Bool)

(declare-fun Unit!5775 () Unit!5773)

(assert (=> b!191287 (= e!125864 Unit!5775)))

(declare-fun lt!94962 () Unit!5773)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!168 (array!8117 array!8119 (_ BitVec 32) (_ BitVec 32) V!5577 V!5577 (_ BitVec 64) Int) Unit!5773)

(assert (=> b!191287 (= lt!94962 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!168 (_keys!5879 thiss!1248) (_values!3885 thiss!1248) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) key!828 (defaultEntry!3902 thiss!1248)))))

(assert (=> b!191287 false))

(declare-fun b!191288 () Bool)

(declare-fun res!90411 () Bool)

(assert (=> b!191288 (=> (not res!90411) (not e!125862))))

(assert (=> b!191288 (= res!90411 (not (= key!828 (bvneg key!828))))))

(declare-fun b!191289 () Bool)

(declare-fun e!125861 () Bool)

(assert (=> b!191289 (= e!125861 tp_is_empty!4447)))

(declare-fun b!191290 () Bool)

(assert (=> b!191290 (= e!125862 e!125867)))

(declare-fun res!90409 () Bool)

(assert (=> b!191290 (=> (not res!90409) (not e!125867))))

(get-info :version)

(assert (=> b!191290 (= res!90409 (and (not ((_ is Undefined!666) lt!94959)) (not ((_ is MissingVacant!666) lt!94959)) (not ((_ is MissingZero!666) lt!94959)) ((_ is Found!666) lt!94959)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8117 (_ BitVec 32)) SeekEntryResult!666)

(assert (=> b!191290 (= lt!94959 (seekEntryOrOpen!0 key!828 (_keys!5879 thiss!1248) (mask!9118 thiss!1248)))))

(declare-fun mapIsEmpty!7680 () Bool)

(declare-fun mapRes!7680 () Bool)

(assert (=> mapIsEmpty!7680 mapRes!7680))

(declare-fun b!191291 () Bool)

(assert (=> b!191291 (= e!125865 (or (not (= (size!4147 (_values!3885 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9118 thiss!1248)))) (not (= (size!4146 (_keys!5879 thiss!1248)) (size!4147 (_values!3885 thiss!1248)))) (bvsge (mask!9118 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!191292 () Bool)

(declare-fun lt!94957 () Unit!5773)

(assert (=> b!191292 (= e!125864 lt!94957)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!172 (array!8117 array!8119 (_ BitVec 32) (_ BitVec 32) V!5577 V!5577 (_ BitVec 64) Int) Unit!5773)

(assert (=> b!191292 (= lt!94957 (lemmaInListMapThenSeekEntryOrOpenFindsIt!172 (_keys!5879 thiss!1248) (_values!3885 thiss!1248) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) key!828 (defaultEntry!3902 thiss!1248)))))

(declare-fun res!90410 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!191292 (= res!90410 (inRange!0 (index!4835 lt!94959) (mask!9118 thiss!1248)))))

(assert (=> b!191292 (=> (not res!90410) (not e!125863))))

(assert (=> b!191292 e!125863))

(declare-fun mapNonEmpty!7680 () Bool)

(declare-fun tp!16871 () Bool)

(declare-fun e!125866 () Bool)

(assert (=> mapNonEmpty!7680 (= mapRes!7680 (and tp!16871 e!125866))))

(declare-fun mapKey!7680 () (_ BitVec 32))

(declare-fun mapValue!7680 () ValueCell!1880)

(declare-fun mapRest!7680 () (Array (_ BitVec 32) ValueCell!1880))

(assert (=> mapNonEmpty!7680 (= (arr!3825 (_values!3885 thiss!1248)) (store mapRest!7680 mapKey!7680 mapValue!7680))))

(declare-fun b!191293 () Bool)

(assert (=> b!191293 (= e!125860 (and e!125861 mapRes!7680))))

(declare-fun condMapEmpty!7680 () Bool)

(declare-fun mapDefault!7680 () ValueCell!1880)

(assert (=> b!191293 (= condMapEmpty!7680 (= (arr!3825 (_values!3885 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1880)) mapDefault!7680)))))

(declare-fun b!191294 () Bool)

(assert (=> b!191294 (= e!125866 tp_is_empty!4447)))

(assert (= (and start!19478 res!90408) b!191288))

(assert (= (and b!191288 res!90411) b!191290))

(assert (= (and b!191290 res!90409) b!191284))

(assert (= (and b!191284 c!34440) b!191292))

(assert (= (and b!191284 (not c!34440)) b!191287))

(assert (= (and b!191292 res!90410) b!191286))

(assert (= (and b!191284 (not res!90412)) b!191291))

(assert (= (and b!191293 condMapEmpty!7680) mapIsEmpty!7680))

(assert (= (and b!191293 (not condMapEmpty!7680)) mapNonEmpty!7680))

(assert (= (and mapNonEmpty!7680 ((_ is ValueCellFull!1880) mapValue!7680)) b!191294))

(assert (= (and b!191293 ((_ is ValueCellFull!1880) mapDefault!7680)) b!191289))

(assert (= b!191285 b!191293))

(assert (= start!19478 b!191285))

(declare-fun m!217999 () Bool)

(assert (=> start!19478 m!217999))

(declare-fun m!218001 () Bool)

(assert (=> b!191292 m!218001))

(declare-fun m!218003 () Bool)

(assert (=> b!191292 m!218003))

(declare-fun m!218005 () Bool)

(assert (=> b!191286 m!218005))

(declare-fun m!218007 () Bool)

(assert (=> b!191287 m!218007))

(declare-fun m!218009 () Bool)

(assert (=> b!191290 m!218009))

(declare-fun m!218011 () Bool)

(assert (=> b!191284 m!218011))

(declare-fun m!218013 () Bool)

(assert (=> b!191284 m!218013))

(declare-fun m!218015 () Bool)

(assert (=> b!191284 m!218015))

(declare-fun m!218017 () Bool)

(assert (=> b!191284 m!218017))

(declare-fun m!218019 () Bool)

(assert (=> b!191284 m!218019))

(declare-fun m!218021 () Bool)

(assert (=> b!191284 m!218021))

(declare-fun m!218023 () Bool)

(assert (=> b!191284 m!218023))

(declare-fun m!218025 () Bool)

(assert (=> mapNonEmpty!7680 m!218025))

(declare-fun m!218027 () Bool)

(assert (=> b!191285 m!218027))

(declare-fun m!218029 () Bool)

(assert (=> b!191285 m!218029))

(check-sat (not b!191292) (not b!191285) (not b!191284) (not b_next!4675) b_and!11359 (not b!191290) (not mapNonEmpty!7680) (not b!191287) tp_is_empty!4447 (not start!19478))
(check-sat b_and!11359 (not b_next!4675))
(get-model)

(declare-fun d!56201 () Bool)

(declare-fun e!125930 () Bool)

(assert (=> d!56201 e!125930))

(declare-fun res!90447 () Bool)

(assert (=> d!56201 (=> (not res!90447) (not e!125930))))

(declare-fun lt!95003 () SeekEntryResult!666)

(assert (=> d!56201 (= res!90447 ((_ is Found!666) lt!95003))))

(assert (=> d!56201 (= lt!95003 (seekEntryOrOpen!0 key!828 (_keys!5879 thiss!1248) (mask!9118 thiss!1248)))))

(declare-fun lt!95004 () Unit!5773)

(declare-fun choose!1041 (array!8117 array!8119 (_ BitVec 32) (_ BitVec 32) V!5577 V!5577 (_ BitVec 64) Int) Unit!5773)

(assert (=> d!56201 (= lt!95004 (choose!1041 (_keys!5879 thiss!1248) (_values!3885 thiss!1248) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) key!828 (defaultEntry!3902 thiss!1248)))))

(assert (=> d!56201 (validMask!0 (mask!9118 thiss!1248))))

(assert (=> d!56201 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!172 (_keys!5879 thiss!1248) (_values!3885 thiss!1248) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) key!828 (defaultEntry!3902 thiss!1248)) lt!95004)))

(declare-fun b!191365 () Bool)

(declare-fun res!90448 () Bool)

(assert (=> b!191365 (=> (not res!90448) (not e!125930))))

(assert (=> b!191365 (= res!90448 (inRange!0 (index!4835 lt!95003) (mask!9118 thiss!1248)))))

(declare-fun b!191366 () Bool)

(assert (=> b!191366 (= e!125930 (= (select (arr!3824 (_keys!5879 thiss!1248)) (index!4835 lt!95003)) key!828))))

(assert (=> b!191366 (and (bvsge (index!4835 lt!95003) #b00000000000000000000000000000000) (bvslt (index!4835 lt!95003) (size!4146 (_keys!5879 thiss!1248))))))

(assert (= (and d!56201 res!90447) b!191365))

(assert (= (and b!191365 res!90448) b!191366))

(assert (=> d!56201 m!218009))

(declare-fun m!218095 () Bool)

(assert (=> d!56201 m!218095))

(assert (=> d!56201 m!218023))

(declare-fun m!218097 () Bool)

(assert (=> b!191365 m!218097))

(declare-fun m!218099 () Bool)

(assert (=> b!191366 m!218099))

(assert (=> b!191292 d!56201))

(declare-fun d!56203 () Bool)

(assert (=> d!56203 (= (inRange!0 (index!4835 lt!94959) (mask!9118 thiss!1248)) (and (bvsge (index!4835 lt!94959) #b00000000000000000000000000000000) (bvslt (index!4835 lt!94959) (bvadd (mask!9118 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!191292 d!56203))

(declare-fun d!56205 () Bool)

(declare-fun res!90455 () Bool)

(declare-fun e!125933 () Bool)

(assert (=> d!56205 (=> (not res!90455) (not e!125933))))

(declare-fun simpleValid!197 (LongMapFixedSize!2668) Bool)

(assert (=> d!56205 (= res!90455 (simpleValid!197 thiss!1248))))

(assert (=> d!56205 (= (valid!1119 thiss!1248) e!125933)))

(declare-fun b!191373 () Bool)

(declare-fun res!90456 () Bool)

(assert (=> b!191373 (=> (not res!90456) (not e!125933))))

(declare-fun arrayCountValidKeys!0 (array!8117 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!191373 (= res!90456 (= (arrayCountValidKeys!0 (_keys!5879 thiss!1248) #b00000000000000000000000000000000 (size!4146 (_keys!5879 thiss!1248))) (_size!1383 thiss!1248)))))

(declare-fun b!191374 () Bool)

(declare-fun res!90457 () Bool)

(assert (=> b!191374 (=> (not res!90457) (not e!125933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8117 (_ BitVec 32)) Bool)

(assert (=> b!191374 (= res!90457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5879 thiss!1248) (mask!9118 thiss!1248)))))

(declare-fun b!191375 () Bool)

(declare-datatypes ((List!2386 0))(
  ( (Nil!2383) (Cons!2382 (h!3021 (_ BitVec 64)) (t!7292 List!2386)) )
))
(declare-fun arrayNoDuplicates!0 (array!8117 (_ BitVec 32) List!2386) Bool)

(assert (=> b!191375 (= e!125933 (arrayNoDuplicates!0 (_keys!5879 thiss!1248) #b00000000000000000000000000000000 Nil!2383))))

(assert (= (and d!56205 res!90455) b!191373))

(assert (= (and b!191373 res!90456) b!191374))

(assert (= (and b!191374 res!90457) b!191375))

(declare-fun m!218101 () Bool)

(assert (=> d!56205 m!218101))

(declare-fun m!218103 () Bool)

(assert (=> b!191373 m!218103))

(declare-fun m!218105 () Bool)

(assert (=> b!191374 m!218105))

(declare-fun m!218107 () Bool)

(assert (=> b!191375 m!218107))

(assert (=> start!19478 d!56205))

(declare-fun b!191392 () Bool)

(declare-fun res!90466 () Bool)

(declare-fun e!125943 () Bool)

(assert (=> b!191392 (=> (not res!90466) (not e!125943))))

(declare-fun lt!95010 () SeekEntryResult!666)

(assert (=> b!191392 (= res!90466 (= (select (arr!3824 (_keys!5879 thiss!1248)) (index!4837 lt!95010)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191392 (and (bvsge (index!4837 lt!95010) #b00000000000000000000000000000000) (bvslt (index!4837 lt!95010) (size!4146 (_keys!5879 thiss!1248))))))

(declare-fun d!56207 () Bool)

(declare-fun e!125944 () Bool)

(assert (=> d!56207 e!125944))

(declare-fun c!34452 () Bool)

(assert (=> d!56207 (= c!34452 ((_ is MissingZero!666) lt!95010))))

(assert (=> d!56207 (= lt!95010 (seekEntryOrOpen!0 key!828 (_keys!5879 thiss!1248) (mask!9118 thiss!1248)))))

(declare-fun lt!95009 () Unit!5773)

(declare-fun choose!1042 (array!8117 array!8119 (_ BitVec 32) (_ BitVec 32) V!5577 V!5577 (_ BitVec 64) Int) Unit!5773)

(assert (=> d!56207 (= lt!95009 (choose!1042 (_keys!5879 thiss!1248) (_values!3885 thiss!1248) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) key!828 (defaultEntry!3902 thiss!1248)))))

(assert (=> d!56207 (validMask!0 (mask!9118 thiss!1248))))

(assert (=> d!56207 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!168 (_keys!5879 thiss!1248) (_values!3885 thiss!1248) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) key!828 (defaultEntry!3902 thiss!1248)) lt!95009)))

(declare-fun b!191393 () Bool)

(assert (=> b!191393 (and (bvsge (index!4834 lt!95010) #b00000000000000000000000000000000) (bvslt (index!4834 lt!95010) (size!4146 (_keys!5879 thiss!1248))))))

(declare-fun res!90467 () Bool)

(assert (=> b!191393 (= res!90467 (= (select (arr!3824 (_keys!5879 thiss!1248)) (index!4834 lt!95010)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!125942 () Bool)

(assert (=> b!191393 (=> (not res!90467) (not e!125942))))

(declare-fun b!191394 () Bool)

(declare-fun e!125945 () Bool)

(assert (=> b!191394 (= e!125945 ((_ is Undefined!666) lt!95010))))

(declare-fun b!191395 () Bool)

(assert (=> b!191395 (= e!125944 e!125945)))

(declare-fun c!34451 () Bool)

(assert (=> b!191395 (= c!34451 ((_ is MissingVacant!666) lt!95010))))

(declare-fun b!191396 () Bool)

(assert (=> b!191396 (= e!125944 e!125942)))

(declare-fun res!90468 () Bool)

(declare-fun call!19288 () Bool)

(assert (=> b!191396 (= res!90468 call!19288)))

(assert (=> b!191396 (=> (not res!90468) (not e!125942))))

(declare-fun b!191397 () Bool)

(declare-fun call!19287 () Bool)

(assert (=> b!191397 (= e!125943 (not call!19287))))

(declare-fun bm!19284 () Bool)

(declare-fun arrayContainsKey!0 (array!8117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19284 (= call!19287 (arrayContainsKey!0 (_keys!5879 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!191398 () Bool)

(declare-fun res!90469 () Bool)

(assert (=> b!191398 (=> (not res!90469) (not e!125943))))

(assert (=> b!191398 (= res!90469 call!19288)))

(assert (=> b!191398 (= e!125945 e!125943)))

(declare-fun b!191399 () Bool)

(assert (=> b!191399 (= e!125942 (not call!19287))))

(declare-fun bm!19285 () Bool)

(assert (=> bm!19285 (= call!19288 (inRange!0 (ite c!34452 (index!4834 lt!95010) (index!4837 lt!95010)) (mask!9118 thiss!1248)))))

(assert (= (and d!56207 c!34452) b!191396))

(assert (= (and d!56207 (not c!34452)) b!191395))

(assert (= (and b!191396 res!90468) b!191393))

(assert (= (and b!191393 res!90467) b!191399))

(assert (= (and b!191395 c!34451) b!191398))

(assert (= (and b!191395 (not c!34451)) b!191394))

(assert (= (and b!191398 res!90469) b!191392))

(assert (= (and b!191392 res!90466) b!191397))

(assert (= (or b!191396 b!191398) bm!19285))

(assert (= (or b!191399 b!191397) bm!19284))

(declare-fun m!218109 () Bool)

(assert (=> b!191393 m!218109))

(declare-fun m!218111 () Bool)

(assert (=> bm!19284 m!218111))

(assert (=> d!56207 m!218009))

(declare-fun m!218113 () Bool)

(assert (=> d!56207 m!218113))

(assert (=> d!56207 m!218023))

(declare-fun m!218115 () Bool)

(assert (=> bm!19285 m!218115))

(declare-fun m!218117 () Bool)

(assert (=> b!191392 m!218117))

(assert (=> b!191287 d!56207))

(declare-fun d!56209 () Bool)

(assert (=> d!56209 (= (array_inv!2465 (_keys!5879 thiss!1248)) (bvsge (size!4146 (_keys!5879 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191285 d!56209))

(declare-fun d!56211 () Bool)

(assert (=> d!56211 (= (array_inv!2466 (_values!3885 thiss!1248)) (bvsge (size!4147 (_values!3885 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191285 d!56211))

(declare-fun d!56213 () Bool)

(declare-fun e!125948 () Bool)

(assert (=> d!56213 e!125948))

(declare-fun res!90475 () Bool)

(assert (=> d!56213 (=> (not res!90475) (not e!125948))))

(declare-fun lt!95021 () ListLongMap!2395)

(assert (=> d!56213 (= res!90475 (contains!1338 lt!95021 (_1!1748 (tuple2!3475 key!828 v!309))))))

(declare-fun lt!95019 () List!2385)

(assert (=> d!56213 (= lt!95021 (ListLongMap!2396 lt!95019))))

(declare-fun lt!95022 () Unit!5773)

(declare-fun lt!95020 () Unit!5773)

(assert (=> d!56213 (= lt!95022 lt!95020)))

(declare-datatypes ((Option!245 0))(
  ( (Some!244 (v!4211 V!5577)) (None!243) )
))
(declare-fun getValueByKey!239 (List!2385 (_ BitVec 64)) Option!245)

(assert (=> d!56213 (= (getValueByKey!239 lt!95019 (_1!1748 (tuple2!3475 key!828 v!309))) (Some!244 (_2!1748 (tuple2!3475 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!126 (List!2385 (_ BitVec 64) V!5577) Unit!5773)

(assert (=> d!56213 (= lt!95020 (lemmaContainsTupThenGetReturnValue!126 lt!95019 (_1!1748 (tuple2!3475 key!828 v!309)) (_2!1748 (tuple2!3475 key!828 v!309))))))

(declare-fun insertStrictlySorted!129 (List!2385 (_ BitVec 64) V!5577) List!2385)

(assert (=> d!56213 (= lt!95019 (insertStrictlySorted!129 (toList!1213 lt!94961) (_1!1748 (tuple2!3475 key!828 v!309)) (_2!1748 (tuple2!3475 key!828 v!309))))))

(assert (=> d!56213 (= (+!306 lt!94961 (tuple2!3475 key!828 v!309)) lt!95021)))

(declare-fun b!191404 () Bool)

(declare-fun res!90474 () Bool)

(assert (=> b!191404 (=> (not res!90474) (not e!125948))))

(assert (=> b!191404 (= res!90474 (= (getValueByKey!239 (toList!1213 lt!95021) (_1!1748 (tuple2!3475 key!828 v!309))) (Some!244 (_2!1748 (tuple2!3475 key!828 v!309)))))))

(declare-fun b!191405 () Bool)

(declare-fun contains!1339 (List!2385 tuple2!3474) Bool)

(assert (=> b!191405 (= e!125948 (contains!1339 (toList!1213 lt!95021) (tuple2!3475 key!828 v!309)))))

(assert (= (and d!56213 res!90475) b!191404))

(assert (= (and b!191404 res!90474) b!191405))

(declare-fun m!218119 () Bool)

(assert (=> d!56213 m!218119))

(declare-fun m!218121 () Bool)

(assert (=> d!56213 m!218121))

(declare-fun m!218123 () Bool)

(assert (=> d!56213 m!218123))

(declare-fun m!218125 () Bool)

(assert (=> d!56213 m!218125))

(declare-fun m!218127 () Bool)

(assert (=> b!191404 m!218127))

(declare-fun m!218129 () Bool)

(assert (=> b!191405 m!218129))

(assert (=> b!191284 d!56213))

(declare-fun d!56215 () Bool)

(assert (=> d!56215 (= (validMask!0 (mask!9118 thiss!1248)) (and (or (= (mask!9118 thiss!1248) #b00000000000000000000000000000111) (= (mask!9118 thiss!1248) #b00000000000000000000000000001111) (= (mask!9118 thiss!1248) #b00000000000000000000000000011111) (= (mask!9118 thiss!1248) #b00000000000000000000000000111111) (= (mask!9118 thiss!1248) #b00000000000000000000000001111111) (= (mask!9118 thiss!1248) #b00000000000000000000000011111111) (= (mask!9118 thiss!1248) #b00000000000000000000000111111111) (= (mask!9118 thiss!1248) #b00000000000000000000001111111111) (= (mask!9118 thiss!1248) #b00000000000000000000011111111111) (= (mask!9118 thiss!1248) #b00000000000000000000111111111111) (= (mask!9118 thiss!1248) #b00000000000000000001111111111111) (= (mask!9118 thiss!1248) #b00000000000000000011111111111111) (= (mask!9118 thiss!1248) #b00000000000000000111111111111111) (= (mask!9118 thiss!1248) #b00000000000000001111111111111111) (= (mask!9118 thiss!1248) #b00000000000000011111111111111111) (= (mask!9118 thiss!1248) #b00000000000000111111111111111111) (= (mask!9118 thiss!1248) #b00000000000001111111111111111111) (= (mask!9118 thiss!1248) #b00000000000011111111111111111111) (= (mask!9118 thiss!1248) #b00000000000111111111111111111111) (= (mask!9118 thiss!1248) #b00000000001111111111111111111111) (= (mask!9118 thiss!1248) #b00000000011111111111111111111111) (= (mask!9118 thiss!1248) #b00000000111111111111111111111111) (= (mask!9118 thiss!1248) #b00000001111111111111111111111111) (= (mask!9118 thiss!1248) #b00000011111111111111111111111111) (= (mask!9118 thiss!1248) #b00000111111111111111111111111111) (= (mask!9118 thiss!1248) #b00001111111111111111111111111111) (= (mask!9118 thiss!1248) #b00011111111111111111111111111111) (= (mask!9118 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9118 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!191284 d!56215))

(declare-fun b!191448 () Bool)

(declare-fun e!125981 () Bool)

(declare-fun e!125977 () Bool)

(assert (=> b!191448 (= e!125981 e!125977)))

(declare-fun c!34465 () Bool)

(assert (=> b!191448 (= c!34465 (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!191449 () Bool)

(declare-fun e!125979 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!191449 (= e!125979 (validKeyInArray!0 (select (arr!3824 (_keys!5879 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191450 () Bool)

(declare-fun res!90495 () Bool)

(assert (=> b!191450 (=> (not res!90495) (not e!125981))))

(declare-fun e!125985 () Bool)

(assert (=> b!191450 (= res!90495 e!125985)))

(declare-fun c!34467 () Bool)

(assert (=> b!191450 (= c!34467 (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19300 () Bool)

(declare-fun call!19303 () ListLongMap!2395)

(declare-fun call!19307 () ListLongMap!2395)

(assert (=> bm!19300 (= call!19303 call!19307)))

(declare-fun b!191451 () Bool)

(declare-fun e!125975 () Bool)

(assert (=> b!191451 (= e!125977 e!125975)))

(declare-fun res!90498 () Bool)

(declare-fun call!19308 () Bool)

(assert (=> b!191451 (= res!90498 call!19308)))

(assert (=> b!191451 (=> (not res!90498) (not e!125975))))

(declare-fun b!191452 () Bool)

(declare-fun e!125983 () Bool)

(declare-fun e!125984 () Bool)

(assert (=> b!191452 (= e!125983 e!125984)))

(declare-fun res!90496 () Bool)

(assert (=> b!191452 (=> (not res!90496) (not e!125984))))

(declare-fun lt!95088 () ListLongMap!2395)

(assert (=> b!191452 (= res!90496 (contains!1338 lt!95088 (select (arr!3824 (_keys!5879 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191452 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4146 (_keys!5879 thiss!1248))))))

(declare-fun bm!19301 () Bool)

(declare-fun call!19309 () ListLongMap!2395)

(declare-fun getCurrentListMapNoExtraKeys!212 (array!8117 array!8119 (_ BitVec 32) (_ BitVec 32) V!5577 V!5577 (_ BitVec 32) Int) ListLongMap!2395)

(assert (=> bm!19301 (= call!19309 (getCurrentListMapNoExtraKeys!212 (_keys!5879 thiss!1248) (_values!3885 thiss!1248) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun bm!19302 () Bool)

(declare-fun call!19306 () ListLongMap!2395)

(declare-fun call!19305 () ListLongMap!2395)

(assert (=> bm!19302 (= call!19306 call!19305)))

(declare-fun bm!19303 () Bool)

(assert (=> bm!19303 (= call!19308 (contains!1338 lt!95088 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191453 () Bool)

(declare-fun c!34468 () Bool)

(assert (=> b!191453 (= c!34468 (and (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!125980 () ListLongMap!2395)

(declare-fun e!125982 () ListLongMap!2395)

(assert (=> b!191453 (= e!125980 e!125982)))

(declare-fun b!191454 () Bool)

(declare-fun apply!181 (ListLongMap!2395 (_ BitVec 64)) V!5577)

(declare-fun get!2216 (ValueCell!1880 V!5577) V!5577)

(declare-fun dynLambda!524 (Int (_ BitVec 64)) V!5577)

(assert (=> b!191454 (= e!125984 (= (apply!181 lt!95088 (select (arr!3824 (_keys!5879 thiss!1248)) #b00000000000000000000000000000000)) (get!2216 (select (arr!3825 (_values!3885 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!524 (defaultEntry!3902 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!191454 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4147 (_values!3885 thiss!1248))))))

(assert (=> b!191454 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4146 (_keys!5879 thiss!1248))))))

(declare-fun b!191455 () Bool)

(declare-fun res!90502 () Bool)

(assert (=> b!191455 (=> (not res!90502) (not e!125981))))

(assert (=> b!191455 (= res!90502 e!125983)))

(declare-fun res!90494 () Bool)

(assert (=> b!191455 (=> res!90494 e!125983)))

(declare-fun e!125986 () Bool)

(assert (=> b!191455 (= res!90494 (not e!125986))))

(declare-fun res!90500 () Bool)

(assert (=> b!191455 (=> (not res!90500) (not e!125986))))

(assert (=> b!191455 (= res!90500 (bvslt #b00000000000000000000000000000000 (size!4146 (_keys!5879 thiss!1248))))))

(declare-fun b!191456 () Bool)

(assert (=> b!191456 (= e!125982 call!19303)))

(declare-fun c!34469 () Bool)

(declare-fun bm!19304 () Bool)

(declare-fun c!34466 () Bool)

(assert (=> bm!19304 (= call!19305 (+!306 (ite c!34466 call!19309 (ite c!34469 call!19307 call!19303)) (ite (or c!34466 c!34469) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3743 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3743 thiss!1248)))))))

(declare-fun b!191457 () Bool)

(declare-fun e!125976 () Bool)

(assert (=> b!191457 (= e!125976 (= (apply!181 lt!95088 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3743 thiss!1248)))))

(declare-fun b!191458 () Bool)

(declare-fun e!125987 () Unit!5773)

(declare-fun Unit!5779 () Unit!5773)

(assert (=> b!191458 (= e!125987 Unit!5779)))

(declare-fun b!191459 () Bool)

(assert (=> b!191459 (= e!125977 (not call!19308))))

(declare-fun b!191460 () Bool)

(assert (=> b!191460 (= e!125985 e!125976)))

(declare-fun res!90497 () Bool)

(declare-fun call!19304 () Bool)

(assert (=> b!191460 (= res!90497 call!19304)))

(assert (=> b!191460 (=> (not res!90497) (not e!125976))))

(declare-fun b!191461 () Bool)

(declare-fun lt!95069 () Unit!5773)

(assert (=> b!191461 (= e!125987 lt!95069)))

(declare-fun lt!95073 () ListLongMap!2395)

(assert (=> b!191461 (= lt!95073 (getCurrentListMapNoExtraKeys!212 (_keys!5879 thiss!1248) (_values!3885 thiss!1248) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun lt!95077 () (_ BitVec 64))

(assert (=> b!191461 (= lt!95077 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95076 () (_ BitVec 64))

(assert (=> b!191461 (= lt!95076 (select (arr!3824 (_keys!5879 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95079 () Unit!5773)

(declare-fun addStillContains!157 (ListLongMap!2395 (_ BitVec 64) V!5577 (_ BitVec 64)) Unit!5773)

(assert (=> b!191461 (= lt!95079 (addStillContains!157 lt!95073 lt!95077 (zeroValue!3743 thiss!1248) lt!95076))))

(assert (=> b!191461 (contains!1338 (+!306 lt!95073 (tuple2!3475 lt!95077 (zeroValue!3743 thiss!1248))) lt!95076)))

(declare-fun lt!95074 () Unit!5773)

(assert (=> b!191461 (= lt!95074 lt!95079)))

(declare-fun lt!95084 () ListLongMap!2395)

(assert (=> b!191461 (= lt!95084 (getCurrentListMapNoExtraKeys!212 (_keys!5879 thiss!1248) (_values!3885 thiss!1248) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun lt!95075 () (_ BitVec 64))

(assert (=> b!191461 (= lt!95075 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95081 () (_ BitVec 64))

(assert (=> b!191461 (= lt!95081 (select (arr!3824 (_keys!5879 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95085 () Unit!5773)

(declare-fun addApplyDifferent!157 (ListLongMap!2395 (_ BitVec 64) V!5577 (_ BitVec 64)) Unit!5773)

(assert (=> b!191461 (= lt!95085 (addApplyDifferent!157 lt!95084 lt!95075 (minValue!3743 thiss!1248) lt!95081))))

(assert (=> b!191461 (= (apply!181 (+!306 lt!95084 (tuple2!3475 lt!95075 (minValue!3743 thiss!1248))) lt!95081) (apply!181 lt!95084 lt!95081))))

(declare-fun lt!95070 () Unit!5773)

(assert (=> b!191461 (= lt!95070 lt!95085)))

(declare-fun lt!95082 () ListLongMap!2395)

(assert (=> b!191461 (= lt!95082 (getCurrentListMapNoExtraKeys!212 (_keys!5879 thiss!1248) (_values!3885 thiss!1248) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun lt!95086 () (_ BitVec 64))

(assert (=> b!191461 (= lt!95086 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95072 () (_ BitVec 64))

(assert (=> b!191461 (= lt!95072 (select (arr!3824 (_keys!5879 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95067 () Unit!5773)

(assert (=> b!191461 (= lt!95067 (addApplyDifferent!157 lt!95082 lt!95086 (zeroValue!3743 thiss!1248) lt!95072))))

(assert (=> b!191461 (= (apply!181 (+!306 lt!95082 (tuple2!3475 lt!95086 (zeroValue!3743 thiss!1248))) lt!95072) (apply!181 lt!95082 lt!95072))))

(declare-fun lt!95080 () Unit!5773)

(assert (=> b!191461 (= lt!95080 lt!95067)))

(declare-fun lt!95087 () ListLongMap!2395)

(assert (=> b!191461 (= lt!95087 (getCurrentListMapNoExtraKeys!212 (_keys!5879 thiss!1248) (_values!3885 thiss!1248) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun lt!95083 () (_ BitVec 64))

(assert (=> b!191461 (= lt!95083 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95078 () (_ BitVec 64))

(assert (=> b!191461 (= lt!95078 (select (arr!3824 (_keys!5879 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191461 (= lt!95069 (addApplyDifferent!157 lt!95087 lt!95083 (minValue!3743 thiss!1248) lt!95078))))

(assert (=> b!191461 (= (apply!181 (+!306 lt!95087 (tuple2!3475 lt!95083 (minValue!3743 thiss!1248))) lt!95078) (apply!181 lt!95087 lt!95078))))

(declare-fun bm!19305 () Bool)

(assert (=> bm!19305 (= call!19307 call!19309)))

(declare-fun b!191462 () Bool)

(assert (=> b!191462 (= e!125986 (validKeyInArray!0 (select (arr!3824 (_keys!5879 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191463 () Bool)

(assert (=> b!191463 (= e!125985 (not call!19304))))

(declare-fun bm!19306 () Bool)

(assert (=> bm!19306 (= call!19304 (contains!1338 lt!95088 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191464 () Bool)

(declare-fun e!125978 () ListLongMap!2395)

(assert (=> b!191464 (= e!125978 e!125980)))

(assert (=> b!191464 (= c!34469 (and (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!56217 () Bool)

(assert (=> d!56217 e!125981))

(declare-fun res!90499 () Bool)

(assert (=> d!56217 (=> (not res!90499) (not e!125981))))

(assert (=> d!56217 (= res!90499 (or (bvsge #b00000000000000000000000000000000 (size!4146 (_keys!5879 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4146 (_keys!5879 thiss!1248))))))))

(declare-fun lt!95068 () ListLongMap!2395)

(assert (=> d!56217 (= lt!95088 lt!95068)))

(declare-fun lt!95071 () Unit!5773)

(assert (=> d!56217 (= lt!95071 e!125987)))

(declare-fun c!34470 () Bool)

(assert (=> d!56217 (= c!34470 e!125979)))

(declare-fun res!90501 () Bool)

(assert (=> d!56217 (=> (not res!90501) (not e!125979))))

(assert (=> d!56217 (= res!90501 (bvslt #b00000000000000000000000000000000 (size!4146 (_keys!5879 thiss!1248))))))

(assert (=> d!56217 (= lt!95068 e!125978)))

(assert (=> d!56217 (= c!34466 (and (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56217 (validMask!0 (mask!9118 thiss!1248))))

(assert (=> d!56217 (= (getCurrentListMap!865 (_keys!5879 thiss!1248) (_values!3885 thiss!1248) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)) lt!95088)))

(declare-fun b!191465 () Bool)

(assert (=> b!191465 (= e!125975 (= (apply!181 lt!95088 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3743 thiss!1248)))))

(declare-fun b!191466 () Bool)

(assert (=> b!191466 (= e!125982 call!19306)))

(declare-fun b!191467 () Bool)

(assert (=> b!191467 (= e!125978 (+!306 call!19305 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3743 thiss!1248))))))

(declare-fun b!191468 () Bool)

(assert (=> b!191468 (= e!125980 call!19306)))

(assert (= (and d!56217 c!34466) b!191467))

(assert (= (and d!56217 (not c!34466)) b!191464))

(assert (= (and b!191464 c!34469) b!191468))

(assert (= (and b!191464 (not c!34469)) b!191453))

(assert (= (and b!191453 c!34468) b!191466))

(assert (= (and b!191453 (not c!34468)) b!191456))

(assert (= (or b!191466 b!191456) bm!19300))

(assert (= (or b!191468 bm!19300) bm!19305))

(assert (= (or b!191468 b!191466) bm!19302))

(assert (= (or b!191467 bm!19305) bm!19301))

(assert (= (or b!191467 bm!19302) bm!19304))

(assert (= (and d!56217 res!90501) b!191449))

(assert (= (and d!56217 c!34470) b!191461))

(assert (= (and d!56217 (not c!34470)) b!191458))

(assert (= (and d!56217 res!90499) b!191455))

(assert (= (and b!191455 res!90500) b!191462))

(assert (= (and b!191455 (not res!90494)) b!191452))

(assert (= (and b!191452 res!90496) b!191454))

(assert (= (and b!191455 res!90502) b!191450))

(assert (= (and b!191450 c!34467) b!191460))

(assert (= (and b!191450 (not c!34467)) b!191463))

(assert (= (and b!191460 res!90497) b!191457))

(assert (= (or b!191460 b!191463) bm!19306))

(assert (= (and b!191450 res!90495) b!191448))

(assert (= (and b!191448 c!34465) b!191451))

(assert (= (and b!191448 (not c!34465)) b!191459))

(assert (= (and b!191451 res!90498) b!191465))

(assert (= (or b!191451 b!191459) bm!19303))

(declare-fun b_lambda!7413 () Bool)

(assert (=> (not b_lambda!7413) (not b!191454)))

(declare-fun t!7291 () Bool)

(declare-fun tb!2865 () Bool)

(assert (=> (and b!191285 (= (defaultEntry!3902 thiss!1248) (defaultEntry!3902 thiss!1248)) t!7291) tb!2865))

(declare-fun result!4889 () Bool)

(assert (=> tb!2865 (= result!4889 tp_is_empty!4447)))

(assert (=> b!191454 t!7291))

(declare-fun b_and!11365 () Bool)

(assert (= b_and!11359 (and (=> t!7291 result!4889) b_and!11365)))

(declare-fun m!218131 () Bool)

(assert (=> b!191467 m!218131))

(declare-fun m!218133 () Bool)

(assert (=> b!191452 m!218133))

(assert (=> b!191452 m!218133))

(declare-fun m!218135 () Bool)

(assert (=> b!191452 m!218135))

(declare-fun m!218137 () Bool)

(assert (=> bm!19303 m!218137))

(assert (=> b!191462 m!218133))

(assert (=> b!191462 m!218133))

(declare-fun m!218139 () Bool)

(assert (=> b!191462 m!218139))

(declare-fun m!218141 () Bool)

(assert (=> bm!19306 m!218141))

(declare-fun m!218143 () Bool)

(assert (=> b!191457 m!218143))

(assert (=> b!191449 m!218133))

(assert (=> b!191449 m!218133))

(assert (=> b!191449 m!218139))

(declare-fun m!218145 () Bool)

(assert (=> bm!19304 m!218145))

(assert (=> d!56217 m!218023))

(declare-fun m!218147 () Bool)

(assert (=> b!191465 m!218147))

(declare-fun m!218149 () Bool)

(assert (=> b!191461 m!218149))

(declare-fun m!218151 () Bool)

(assert (=> b!191461 m!218151))

(declare-fun m!218153 () Bool)

(assert (=> b!191461 m!218153))

(declare-fun m!218155 () Bool)

(assert (=> b!191461 m!218155))

(declare-fun m!218157 () Bool)

(assert (=> b!191461 m!218157))

(declare-fun m!218159 () Bool)

(assert (=> b!191461 m!218159))

(declare-fun m!218161 () Bool)

(assert (=> b!191461 m!218161))

(declare-fun m!218163 () Bool)

(assert (=> b!191461 m!218163))

(declare-fun m!218165 () Bool)

(assert (=> b!191461 m!218165))

(assert (=> b!191461 m!218163))

(declare-fun m!218167 () Bool)

(assert (=> b!191461 m!218167))

(declare-fun m!218169 () Bool)

(assert (=> b!191461 m!218169))

(declare-fun m!218171 () Bool)

(assert (=> b!191461 m!218171))

(declare-fun m!218173 () Bool)

(assert (=> b!191461 m!218173))

(declare-fun m!218175 () Bool)

(assert (=> b!191461 m!218175))

(assert (=> b!191461 m!218173))

(declare-fun m!218177 () Bool)

(assert (=> b!191461 m!218177))

(assert (=> b!191461 m!218133))

(assert (=> b!191461 m!218149))

(declare-fun m!218179 () Bool)

(assert (=> b!191461 m!218179))

(assert (=> b!191461 m!218153))

(assert (=> b!191454 m!218133))

(declare-fun m!218181 () Bool)

(assert (=> b!191454 m!218181))

(declare-fun m!218183 () Bool)

(assert (=> b!191454 m!218183))

(declare-fun m!218185 () Bool)

(assert (=> b!191454 m!218185))

(declare-fun m!218187 () Bool)

(assert (=> b!191454 m!218187))

(assert (=> b!191454 m!218183))

(assert (=> b!191454 m!218185))

(assert (=> b!191454 m!218133))

(assert (=> bm!19301 m!218157))

(assert (=> b!191284 d!56217))

(declare-fun b!191471 () Bool)

(declare-fun e!125994 () Bool)

(declare-fun e!125990 () Bool)

(assert (=> b!191471 (= e!125994 e!125990)))

(declare-fun c!34471 () Bool)

(assert (=> b!191471 (= c!34471 (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!191472 () Bool)

(declare-fun e!125992 () Bool)

(assert (=> b!191472 (= e!125992 (validKeyInArray!0 (select (arr!3824 (_keys!5879 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191473 () Bool)

(declare-fun res!90504 () Bool)

(assert (=> b!191473 (=> (not res!90504) (not e!125994))))

(declare-fun e!125998 () Bool)

(assert (=> b!191473 (= res!90504 e!125998)))

(declare-fun c!34473 () Bool)

(assert (=> b!191473 (= c!34473 (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19307 () Bool)

(declare-fun call!19310 () ListLongMap!2395)

(declare-fun call!19314 () ListLongMap!2395)

(assert (=> bm!19307 (= call!19310 call!19314)))

(declare-fun b!191474 () Bool)

(declare-fun e!125988 () Bool)

(assert (=> b!191474 (= e!125990 e!125988)))

(declare-fun res!90507 () Bool)

(declare-fun call!19315 () Bool)

(assert (=> b!191474 (= res!90507 call!19315)))

(assert (=> b!191474 (=> (not res!90507) (not e!125988))))

(declare-fun b!191475 () Bool)

(declare-fun e!125996 () Bool)

(declare-fun e!125997 () Bool)

(assert (=> b!191475 (= e!125996 e!125997)))

(declare-fun res!90505 () Bool)

(assert (=> b!191475 (=> (not res!90505) (not e!125997))))

(declare-fun lt!95110 () ListLongMap!2395)

(assert (=> b!191475 (= res!90505 (contains!1338 lt!95110 (select (arr!3824 (_keys!5879 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191475 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4146 (_keys!5879 thiss!1248))))))

(declare-fun bm!19308 () Bool)

(declare-fun call!19316 () ListLongMap!2395)

(assert (=> bm!19308 (= call!19316 (getCurrentListMapNoExtraKeys!212 (_keys!5879 thiss!1248) (array!8120 (store (arr!3825 (_values!3885 thiss!1248)) (index!4835 lt!94959) (ValueCellFull!1880 v!309)) (size!4147 (_values!3885 thiss!1248))) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun bm!19309 () Bool)

(declare-fun call!19313 () ListLongMap!2395)

(declare-fun call!19312 () ListLongMap!2395)

(assert (=> bm!19309 (= call!19313 call!19312)))

(declare-fun bm!19310 () Bool)

(assert (=> bm!19310 (= call!19315 (contains!1338 lt!95110 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191476 () Bool)

(declare-fun c!34474 () Bool)

(assert (=> b!191476 (= c!34474 (and (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!125993 () ListLongMap!2395)

(declare-fun e!125995 () ListLongMap!2395)

(assert (=> b!191476 (= e!125993 e!125995)))

(declare-fun b!191477 () Bool)

(assert (=> b!191477 (= e!125997 (= (apply!181 lt!95110 (select (arr!3824 (_keys!5879 thiss!1248)) #b00000000000000000000000000000000)) (get!2216 (select (arr!3825 (array!8120 (store (arr!3825 (_values!3885 thiss!1248)) (index!4835 lt!94959) (ValueCellFull!1880 v!309)) (size!4147 (_values!3885 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!524 (defaultEntry!3902 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!191477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4147 (array!8120 (store (arr!3825 (_values!3885 thiss!1248)) (index!4835 lt!94959) (ValueCellFull!1880 v!309)) (size!4147 (_values!3885 thiss!1248))))))))

(assert (=> b!191477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4146 (_keys!5879 thiss!1248))))))

(declare-fun b!191478 () Bool)

(declare-fun res!90511 () Bool)

(assert (=> b!191478 (=> (not res!90511) (not e!125994))))

(assert (=> b!191478 (= res!90511 e!125996)))

(declare-fun res!90503 () Bool)

(assert (=> b!191478 (=> res!90503 e!125996)))

(declare-fun e!125999 () Bool)

(assert (=> b!191478 (= res!90503 (not e!125999))))

(declare-fun res!90509 () Bool)

(assert (=> b!191478 (=> (not res!90509) (not e!125999))))

(assert (=> b!191478 (= res!90509 (bvslt #b00000000000000000000000000000000 (size!4146 (_keys!5879 thiss!1248))))))

(declare-fun b!191479 () Bool)

(assert (=> b!191479 (= e!125995 call!19310)))

(declare-fun c!34472 () Bool)

(declare-fun c!34475 () Bool)

(declare-fun bm!19311 () Bool)

(assert (=> bm!19311 (= call!19312 (+!306 (ite c!34472 call!19316 (ite c!34475 call!19314 call!19310)) (ite (or c!34472 c!34475) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3743 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3743 thiss!1248)))))))

(declare-fun b!191480 () Bool)

(declare-fun e!125989 () Bool)

(assert (=> b!191480 (= e!125989 (= (apply!181 lt!95110 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3743 thiss!1248)))))

(declare-fun b!191481 () Bool)

(declare-fun e!126000 () Unit!5773)

(declare-fun Unit!5780 () Unit!5773)

(assert (=> b!191481 (= e!126000 Unit!5780)))

(declare-fun b!191482 () Bool)

(assert (=> b!191482 (= e!125990 (not call!19315))))

(declare-fun b!191483 () Bool)

(assert (=> b!191483 (= e!125998 e!125989)))

(declare-fun res!90506 () Bool)

(declare-fun call!19311 () Bool)

(assert (=> b!191483 (= res!90506 call!19311)))

(assert (=> b!191483 (=> (not res!90506) (not e!125989))))

(declare-fun b!191484 () Bool)

(declare-fun lt!95091 () Unit!5773)

(assert (=> b!191484 (= e!126000 lt!95091)))

(declare-fun lt!95095 () ListLongMap!2395)

(assert (=> b!191484 (= lt!95095 (getCurrentListMapNoExtraKeys!212 (_keys!5879 thiss!1248) (array!8120 (store (arr!3825 (_values!3885 thiss!1248)) (index!4835 lt!94959) (ValueCellFull!1880 v!309)) (size!4147 (_values!3885 thiss!1248))) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun lt!95099 () (_ BitVec 64))

(assert (=> b!191484 (= lt!95099 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95098 () (_ BitVec 64))

(assert (=> b!191484 (= lt!95098 (select (arr!3824 (_keys!5879 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95101 () Unit!5773)

(assert (=> b!191484 (= lt!95101 (addStillContains!157 lt!95095 lt!95099 (zeroValue!3743 thiss!1248) lt!95098))))

(assert (=> b!191484 (contains!1338 (+!306 lt!95095 (tuple2!3475 lt!95099 (zeroValue!3743 thiss!1248))) lt!95098)))

(declare-fun lt!95096 () Unit!5773)

(assert (=> b!191484 (= lt!95096 lt!95101)))

(declare-fun lt!95106 () ListLongMap!2395)

(assert (=> b!191484 (= lt!95106 (getCurrentListMapNoExtraKeys!212 (_keys!5879 thiss!1248) (array!8120 (store (arr!3825 (_values!3885 thiss!1248)) (index!4835 lt!94959) (ValueCellFull!1880 v!309)) (size!4147 (_values!3885 thiss!1248))) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun lt!95097 () (_ BitVec 64))

(assert (=> b!191484 (= lt!95097 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95103 () (_ BitVec 64))

(assert (=> b!191484 (= lt!95103 (select (arr!3824 (_keys!5879 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95107 () Unit!5773)

(assert (=> b!191484 (= lt!95107 (addApplyDifferent!157 lt!95106 lt!95097 (minValue!3743 thiss!1248) lt!95103))))

(assert (=> b!191484 (= (apply!181 (+!306 lt!95106 (tuple2!3475 lt!95097 (minValue!3743 thiss!1248))) lt!95103) (apply!181 lt!95106 lt!95103))))

(declare-fun lt!95092 () Unit!5773)

(assert (=> b!191484 (= lt!95092 lt!95107)))

(declare-fun lt!95104 () ListLongMap!2395)

(assert (=> b!191484 (= lt!95104 (getCurrentListMapNoExtraKeys!212 (_keys!5879 thiss!1248) (array!8120 (store (arr!3825 (_values!3885 thiss!1248)) (index!4835 lt!94959) (ValueCellFull!1880 v!309)) (size!4147 (_values!3885 thiss!1248))) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun lt!95108 () (_ BitVec 64))

(assert (=> b!191484 (= lt!95108 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95094 () (_ BitVec 64))

(assert (=> b!191484 (= lt!95094 (select (arr!3824 (_keys!5879 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95089 () Unit!5773)

(assert (=> b!191484 (= lt!95089 (addApplyDifferent!157 lt!95104 lt!95108 (zeroValue!3743 thiss!1248) lt!95094))))

(assert (=> b!191484 (= (apply!181 (+!306 lt!95104 (tuple2!3475 lt!95108 (zeroValue!3743 thiss!1248))) lt!95094) (apply!181 lt!95104 lt!95094))))

(declare-fun lt!95102 () Unit!5773)

(assert (=> b!191484 (= lt!95102 lt!95089)))

(declare-fun lt!95109 () ListLongMap!2395)

(assert (=> b!191484 (= lt!95109 (getCurrentListMapNoExtraKeys!212 (_keys!5879 thiss!1248) (array!8120 (store (arr!3825 (_values!3885 thiss!1248)) (index!4835 lt!94959) (ValueCellFull!1880 v!309)) (size!4147 (_values!3885 thiss!1248))) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun lt!95105 () (_ BitVec 64))

(assert (=> b!191484 (= lt!95105 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95100 () (_ BitVec 64))

(assert (=> b!191484 (= lt!95100 (select (arr!3824 (_keys!5879 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191484 (= lt!95091 (addApplyDifferent!157 lt!95109 lt!95105 (minValue!3743 thiss!1248) lt!95100))))

(assert (=> b!191484 (= (apply!181 (+!306 lt!95109 (tuple2!3475 lt!95105 (minValue!3743 thiss!1248))) lt!95100) (apply!181 lt!95109 lt!95100))))

(declare-fun bm!19312 () Bool)

(assert (=> bm!19312 (= call!19314 call!19316)))

(declare-fun b!191485 () Bool)

(assert (=> b!191485 (= e!125999 (validKeyInArray!0 (select (arr!3824 (_keys!5879 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191486 () Bool)

(assert (=> b!191486 (= e!125998 (not call!19311))))

(declare-fun bm!19313 () Bool)

(assert (=> bm!19313 (= call!19311 (contains!1338 lt!95110 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191487 () Bool)

(declare-fun e!125991 () ListLongMap!2395)

(assert (=> b!191487 (= e!125991 e!125993)))

(assert (=> b!191487 (= c!34475 (and (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!56219 () Bool)

(assert (=> d!56219 e!125994))

(declare-fun res!90508 () Bool)

(assert (=> d!56219 (=> (not res!90508) (not e!125994))))

(assert (=> d!56219 (= res!90508 (or (bvsge #b00000000000000000000000000000000 (size!4146 (_keys!5879 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4146 (_keys!5879 thiss!1248))))))))

(declare-fun lt!95090 () ListLongMap!2395)

(assert (=> d!56219 (= lt!95110 lt!95090)))

(declare-fun lt!95093 () Unit!5773)

(assert (=> d!56219 (= lt!95093 e!126000)))

(declare-fun c!34476 () Bool)

(assert (=> d!56219 (= c!34476 e!125992)))

(declare-fun res!90510 () Bool)

(assert (=> d!56219 (=> (not res!90510) (not e!125992))))

(assert (=> d!56219 (= res!90510 (bvslt #b00000000000000000000000000000000 (size!4146 (_keys!5879 thiss!1248))))))

(assert (=> d!56219 (= lt!95090 e!125991)))

(assert (=> d!56219 (= c!34472 (and (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3639 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56219 (validMask!0 (mask!9118 thiss!1248))))

(assert (=> d!56219 (= (getCurrentListMap!865 (_keys!5879 thiss!1248) (array!8120 (store (arr!3825 (_values!3885 thiss!1248)) (index!4835 lt!94959) (ValueCellFull!1880 v!309)) (size!4147 (_values!3885 thiss!1248))) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)) lt!95110)))

(declare-fun b!191488 () Bool)

(assert (=> b!191488 (= e!125988 (= (apply!181 lt!95110 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3743 thiss!1248)))))

(declare-fun b!191489 () Bool)

(assert (=> b!191489 (= e!125995 call!19313)))

(declare-fun b!191490 () Bool)

(assert (=> b!191490 (= e!125991 (+!306 call!19312 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3743 thiss!1248))))))

(declare-fun b!191491 () Bool)

(assert (=> b!191491 (= e!125993 call!19313)))

(assert (= (and d!56219 c!34472) b!191490))

(assert (= (and d!56219 (not c!34472)) b!191487))

(assert (= (and b!191487 c!34475) b!191491))

(assert (= (and b!191487 (not c!34475)) b!191476))

(assert (= (and b!191476 c!34474) b!191489))

(assert (= (and b!191476 (not c!34474)) b!191479))

(assert (= (or b!191489 b!191479) bm!19307))

(assert (= (or b!191491 bm!19307) bm!19312))

(assert (= (or b!191491 b!191489) bm!19309))

(assert (= (or b!191490 bm!19312) bm!19308))

(assert (= (or b!191490 bm!19309) bm!19311))

(assert (= (and d!56219 res!90510) b!191472))

(assert (= (and d!56219 c!34476) b!191484))

(assert (= (and d!56219 (not c!34476)) b!191481))

(assert (= (and d!56219 res!90508) b!191478))

(assert (= (and b!191478 res!90509) b!191485))

(assert (= (and b!191478 (not res!90503)) b!191475))

(assert (= (and b!191475 res!90505) b!191477))

(assert (= (and b!191478 res!90511) b!191473))

(assert (= (and b!191473 c!34473) b!191483))

(assert (= (and b!191473 (not c!34473)) b!191486))

(assert (= (and b!191483 res!90506) b!191480))

(assert (= (or b!191483 b!191486) bm!19313))

(assert (= (and b!191473 res!90504) b!191471))

(assert (= (and b!191471 c!34471) b!191474))

(assert (= (and b!191471 (not c!34471)) b!191482))

(assert (= (and b!191474 res!90507) b!191488))

(assert (= (or b!191474 b!191482) bm!19310))

(declare-fun b_lambda!7415 () Bool)

(assert (=> (not b_lambda!7415) (not b!191477)))

(assert (=> b!191477 t!7291))

(declare-fun b_and!11367 () Bool)

(assert (= b_and!11365 (and (=> t!7291 result!4889) b_and!11367)))

(declare-fun m!218189 () Bool)

(assert (=> b!191490 m!218189))

(assert (=> b!191475 m!218133))

(assert (=> b!191475 m!218133))

(declare-fun m!218191 () Bool)

(assert (=> b!191475 m!218191))

(declare-fun m!218193 () Bool)

(assert (=> bm!19310 m!218193))

(assert (=> b!191485 m!218133))

(assert (=> b!191485 m!218133))

(assert (=> b!191485 m!218139))

(declare-fun m!218195 () Bool)

(assert (=> bm!19313 m!218195))

(declare-fun m!218197 () Bool)

(assert (=> b!191480 m!218197))

(assert (=> b!191472 m!218133))

(assert (=> b!191472 m!218133))

(assert (=> b!191472 m!218139))

(declare-fun m!218199 () Bool)

(assert (=> bm!19311 m!218199))

(assert (=> d!56219 m!218023))

(declare-fun m!218201 () Bool)

(assert (=> b!191488 m!218201))

(declare-fun m!218203 () Bool)

(assert (=> b!191484 m!218203))

(declare-fun m!218205 () Bool)

(assert (=> b!191484 m!218205))

(declare-fun m!218207 () Bool)

(assert (=> b!191484 m!218207))

(declare-fun m!218209 () Bool)

(assert (=> b!191484 m!218209))

(declare-fun m!218211 () Bool)

(assert (=> b!191484 m!218211))

(declare-fun m!218213 () Bool)

(assert (=> b!191484 m!218213))

(declare-fun m!218215 () Bool)

(assert (=> b!191484 m!218215))

(declare-fun m!218217 () Bool)

(assert (=> b!191484 m!218217))

(declare-fun m!218219 () Bool)

(assert (=> b!191484 m!218219))

(assert (=> b!191484 m!218217))

(declare-fun m!218221 () Bool)

(assert (=> b!191484 m!218221))

(declare-fun m!218223 () Bool)

(assert (=> b!191484 m!218223))

(declare-fun m!218225 () Bool)

(assert (=> b!191484 m!218225))

(declare-fun m!218227 () Bool)

(assert (=> b!191484 m!218227))

(declare-fun m!218229 () Bool)

(assert (=> b!191484 m!218229))

(assert (=> b!191484 m!218227))

(declare-fun m!218231 () Bool)

(assert (=> b!191484 m!218231))

(assert (=> b!191484 m!218133))

(assert (=> b!191484 m!218203))

(declare-fun m!218233 () Bool)

(assert (=> b!191484 m!218233))

(assert (=> b!191484 m!218207))

(assert (=> b!191477 m!218133))

(declare-fun m!218235 () Bool)

(assert (=> b!191477 m!218235))

(declare-fun m!218237 () Bool)

(assert (=> b!191477 m!218237))

(assert (=> b!191477 m!218185))

(declare-fun m!218239 () Bool)

(assert (=> b!191477 m!218239))

(assert (=> b!191477 m!218237))

(assert (=> b!191477 m!218185))

(assert (=> b!191477 m!218133))

(assert (=> bm!19308 m!218211))

(assert (=> b!191284 d!56219))

(declare-fun d!56221 () Bool)

(declare-fun e!126005 () Bool)

(assert (=> d!56221 e!126005))

(declare-fun res!90514 () Bool)

(assert (=> d!56221 (=> res!90514 e!126005)))

(declare-fun lt!95122 () Bool)

(assert (=> d!56221 (= res!90514 (not lt!95122))))

(declare-fun lt!95120 () Bool)

(assert (=> d!56221 (= lt!95122 lt!95120)))

(declare-fun lt!95119 () Unit!5773)

(declare-fun e!126006 () Unit!5773)

(assert (=> d!56221 (= lt!95119 e!126006)))

(declare-fun c!34479 () Bool)

(assert (=> d!56221 (= c!34479 lt!95120)))

(declare-fun containsKey!242 (List!2385 (_ BitVec 64)) Bool)

(assert (=> d!56221 (= lt!95120 (containsKey!242 (toList!1213 lt!94961) key!828))))

(assert (=> d!56221 (= (contains!1338 lt!94961 key!828) lt!95122)))

(declare-fun b!191498 () Bool)

(declare-fun lt!95121 () Unit!5773)

(assert (=> b!191498 (= e!126006 lt!95121)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!190 (List!2385 (_ BitVec 64)) Unit!5773)

(assert (=> b!191498 (= lt!95121 (lemmaContainsKeyImpliesGetValueByKeyDefined!190 (toList!1213 lt!94961) key!828))))

(declare-fun isDefined!191 (Option!245) Bool)

(assert (=> b!191498 (isDefined!191 (getValueByKey!239 (toList!1213 lt!94961) key!828))))

(declare-fun b!191499 () Bool)

(declare-fun Unit!5781 () Unit!5773)

(assert (=> b!191499 (= e!126006 Unit!5781)))

(declare-fun b!191500 () Bool)

(assert (=> b!191500 (= e!126005 (isDefined!191 (getValueByKey!239 (toList!1213 lt!94961) key!828)))))

(assert (= (and d!56221 c!34479) b!191498))

(assert (= (and d!56221 (not c!34479)) b!191499))

(assert (= (and d!56221 (not res!90514)) b!191500))

(declare-fun m!218241 () Bool)

(assert (=> d!56221 m!218241))

(declare-fun m!218243 () Bool)

(assert (=> b!191498 m!218243))

(declare-fun m!218245 () Bool)

(assert (=> b!191498 m!218245))

(assert (=> b!191498 m!218245))

(declare-fun m!218247 () Bool)

(assert (=> b!191498 m!218247))

(assert (=> b!191500 m!218245))

(assert (=> b!191500 m!218245))

(assert (=> b!191500 m!218247))

(assert (=> b!191284 d!56221))

(declare-fun d!56223 () Bool)

(declare-fun e!126009 () Bool)

(assert (=> d!56223 e!126009))

(declare-fun res!90517 () Bool)

(assert (=> d!56223 (=> (not res!90517) (not e!126009))))

(assert (=> d!56223 (= res!90517 (and (bvsge (index!4835 lt!94959) #b00000000000000000000000000000000) (bvslt (index!4835 lt!94959) (size!4147 (_values!3885 thiss!1248)))))))

(declare-fun lt!95125 () Unit!5773)

(declare-fun choose!1043 (array!8117 array!8119 (_ BitVec 32) (_ BitVec 32) V!5577 V!5577 (_ BitVec 32) (_ BitVec 64) V!5577 Int) Unit!5773)

(assert (=> d!56223 (= lt!95125 (choose!1043 (_keys!5879 thiss!1248) (_values!3885 thiss!1248) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) (index!4835 lt!94959) key!828 v!309 (defaultEntry!3902 thiss!1248)))))

(assert (=> d!56223 (validMask!0 (mask!9118 thiss!1248))))

(assert (=> d!56223 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!110 (_keys!5879 thiss!1248) (_values!3885 thiss!1248) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) (index!4835 lt!94959) key!828 v!309 (defaultEntry!3902 thiss!1248)) lt!95125)))

(declare-fun b!191503 () Bool)

(assert (=> b!191503 (= e!126009 (= (+!306 (getCurrentListMap!865 (_keys!5879 thiss!1248) (_values!3885 thiss!1248) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)) (tuple2!3475 key!828 v!309)) (getCurrentListMap!865 (_keys!5879 thiss!1248) (array!8120 (store (arr!3825 (_values!3885 thiss!1248)) (index!4835 lt!94959) (ValueCellFull!1880 v!309)) (size!4147 (_values!3885 thiss!1248))) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248))))))

(assert (= (and d!56223 res!90517) b!191503))

(declare-fun m!218249 () Bool)

(assert (=> d!56223 m!218249))

(assert (=> d!56223 m!218023))

(assert (=> b!191503 m!218011))

(assert (=> b!191503 m!218011))

(declare-fun m!218251 () Bool)

(assert (=> b!191503 m!218251))

(assert (=> b!191503 m!218021))

(assert (=> b!191503 m!218013))

(assert (=> b!191284 d!56223))

(declare-fun d!56225 () Bool)

(declare-fun lt!95134 () SeekEntryResult!666)

(assert (=> d!56225 (and (or ((_ is Undefined!666) lt!95134) (not ((_ is Found!666) lt!95134)) (and (bvsge (index!4835 lt!95134) #b00000000000000000000000000000000) (bvslt (index!4835 lt!95134) (size!4146 (_keys!5879 thiss!1248))))) (or ((_ is Undefined!666) lt!95134) ((_ is Found!666) lt!95134) (not ((_ is MissingZero!666) lt!95134)) (and (bvsge (index!4834 lt!95134) #b00000000000000000000000000000000) (bvslt (index!4834 lt!95134) (size!4146 (_keys!5879 thiss!1248))))) (or ((_ is Undefined!666) lt!95134) ((_ is Found!666) lt!95134) ((_ is MissingZero!666) lt!95134) (not ((_ is MissingVacant!666) lt!95134)) (and (bvsge (index!4837 lt!95134) #b00000000000000000000000000000000) (bvslt (index!4837 lt!95134) (size!4146 (_keys!5879 thiss!1248))))) (or ((_ is Undefined!666) lt!95134) (ite ((_ is Found!666) lt!95134) (= (select (arr!3824 (_keys!5879 thiss!1248)) (index!4835 lt!95134)) key!828) (ite ((_ is MissingZero!666) lt!95134) (= (select (arr!3824 (_keys!5879 thiss!1248)) (index!4834 lt!95134)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!666) lt!95134) (= (select (arr!3824 (_keys!5879 thiss!1248)) (index!4837 lt!95134)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!126016 () SeekEntryResult!666)

(assert (=> d!56225 (= lt!95134 e!126016)))

(declare-fun c!34486 () Bool)

(declare-fun lt!95132 () SeekEntryResult!666)

(assert (=> d!56225 (= c!34486 (and ((_ is Intermediate!666) lt!95132) (undefined!1478 lt!95132)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8117 (_ BitVec 32)) SeekEntryResult!666)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56225 (= lt!95132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9118 thiss!1248)) key!828 (_keys!5879 thiss!1248) (mask!9118 thiss!1248)))))

(assert (=> d!56225 (validMask!0 (mask!9118 thiss!1248))))

(assert (=> d!56225 (= (seekEntryOrOpen!0 key!828 (_keys!5879 thiss!1248) (mask!9118 thiss!1248)) lt!95134)))

(declare-fun b!191516 () Bool)

(declare-fun e!126018 () SeekEntryResult!666)

(assert (=> b!191516 (= e!126018 (MissingZero!666 (index!4836 lt!95132)))))

(declare-fun b!191517 () Bool)

(declare-fun c!34488 () Bool)

(declare-fun lt!95133 () (_ BitVec 64))

(assert (=> b!191517 (= c!34488 (= lt!95133 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!126017 () SeekEntryResult!666)

(assert (=> b!191517 (= e!126017 e!126018)))

(declare-fun b!191518 () Bool)

(assert (=> b!191518 (= e!126017 (Found!666 (index!4836 lt!95132)))))

(declare-fun b!191519 () Bool)

(assert (=> b!191519 (= e!126016 e!126017)))

(assert (=> b!191519 (= lt!95133 (select (arr!3824 (_keys!5879 thiss!1248)) (index!4836 lt!95132)))))

(declare-fun c!34487 () Bool)

(assert (=> b!191519 (= c!34487 (= lt!95133 key!828))))

(declare-fun b!191520 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8117 (_ BitVec 32)) SeekEntryResult!666)

(assert (=> b!191520 (= e!126018 (seekKeyOrZeroReturnVacant!0 (x!20520 lt!95132) (index!4836 lt!95132) (index!4836 lt!95132) key!828 (_keys!5879 thiss!1248) (mask!9118 thiss!1248)))))

(declare-fun b!191521 () Bool)

(assert (=> b!191521 (= e!126016 Undefined!666)))

(assert (= (and d!56225 c!34486) b!191521))

(assert (= (and d!56225 (not c!34486)) b!191519))

(assert (= (and b!191519 c!34487) b!191518))

(assert (= (and b!191519 (not c!34487)) b!191517))

(assert (= (and b!191517 c!34488) b!191516))

(assert (= (and b!191517 (not c!34488)) b!191520))

(declare-fun m!218253 () Bool)

(assert (=> d!56225 m!218253))

(declare-fun m!218255 () Bool)

(assert (=> d!56225 m!218255))

(declare-fun m!218257 () Bool)

(assert (=> d!56225 m!218257))

(declare-fun m!218259 () Bool)

(assert (=> d!56225 m!218259))

(assert (=> d!56225 m!218023))

(assert (=> d!56225 m!218257))

(declare-fun m!218261 () Bool)

(assert (=> d!56225 m!218261))

(declare-fun m!218263 () Bool)

(assert (=> b!191519 m!218263))

(declare-fun m!218265 () Bool)

(assert (=> b!191520 m!218265))

(assert (=> b!191290 d!56225))

(declare-fun b!191528 () Bool)

(declare-fun e!126023 () Bool)

(assert (=> b!191528 (= e!126023 tp_is_empty!4447)))

(declare-fun mapIsEmpty!7689 () Bool)

(declare-fun mapRes!7689 () Bool)

(assert (=> mapIsEmpty!7689 mapRes!7689))

(declare-fun b!191529 () Bool)

(declare-fun e!126024 () Bool)

(assert (=> b!191529 (= e!126024 tp_is_empty!4447)))

(declare-fun mapNonEmpty!7689 () Bool)

(declare-fun tp!16887 () Bool)

(assert (=> mapNonEmpty!7689 (= mapRes!7689 (and tp!16887 e!126023))))

(declare-fun mapValue!7689 () ValueCell!1880)

(declare-fun mapRest!7689 () (Array (_ BitVec 32) ValueCell!1880))

(declare-fun mapKey!7689 () (_ BitVec 32))

(assert (=> mapNonEmpty!7689 (= mapRest!7680 (store mapRest!7689 mapKey!7689 mapValue!7689))))

(declare-fun condMapEmpty!7689 () Bool)

(declare-fun mapDefault!7689 () ValueCell!1880)

(assert (=> mapNonEmpty!7680 (= condMapEmpty!7689 (= mapRest!7680 ((as const (Array (_ BitVec 32) ValueCell!1880)) mapDefault!7689)))))

(assert (=> mapNonEmpty!7680 (= tp!16871 (and e!126024 mapRes!7689))))

(assert (= (and mapNonEmpty!7680 condMapEmpty!7689) mapIsEmpty!7689))

(assert (= (and mapNonEmpty!7680 (not condMapEmpty!7689)) mapNonEmpty!7689))

(assert (= (and mapNonEmpty!7689 ((_ is ValueCellFull!1880) mapValue!7689)) b!191528))

(assert (= (and mapNonEmpty!7680 ((_ is ValueCellFull!1880) mapDefault!7689)) b!191529))

(declare-fun m!218267 () Bool)

(assert (=> mapNonEmpty!7689 m!218267))

(declare-fun b_lambda!7417 () Bool)

(assert (= b_lambda!7415 (or (and b!191285 b_free!4675) b_lambda!7417)))

(declare-fun b_lambda!7419 () Bool)

(assert (= b_lambda!7413 (or (and b!191285 b_free!4675) b_lambda!7419)))

(check-sat (not b!191480) (not b!191365) (not b!191373) tp_is_empty!4447 (not bm!19303) (not b_next!4675) (not b!191467) (not bm!19285) (not b!191452) (not b!191405) (not b!191374) (not d!56213) (not b!191462) (not d!56201) (not b!191457) (not d!56225) (not b!191500) (not bm!19311) (not b!191461) (not d!56219) (not b_lambda!7417) (not b!191375) (not b!191490) (not bm!19306) (not b!191465) (not b!191488) (not b_lambda!7419) (not d!56217) (not bm!19301) (not b!191484) (not b!191454) (not bm!19308) (not mapNonEmpty!7689) (not b!191498) (not b!191475) (not d!56223) (not bm!19284) (not d!56207) (not b!191477) (not d!56205) (not b!191503) (not bm!19304) (not b!191520) (not b!191404) (not bm!19313) (not b!191485) (not bm!19310) (not b!191449) (not b!191472) (not d!56221) b_and!11367)
(check-sat b_and!11367 (not b_next!4675))
