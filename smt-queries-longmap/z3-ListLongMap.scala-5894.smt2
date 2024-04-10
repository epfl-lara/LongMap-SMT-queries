; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76124 () Bool)

(assert start!76124)

(declare-fun b!894395 () Bool)

(declare-fun b_free!15867 () Bool)

(declare-fun b_next!15867 () Bool)

(assert (=> b!894395 (= b_free!15867 (not b_next!15867))))

(declare-fun tp!55586 () Bool)

(declare-fun b_and!26155 () Bool)

(assert (=> b!894395 (= tp!55586 b_and!26155)))

(declare-fun b!894389 () Bool)

(declare-fun e!499555 () Bool)

(declare-datatypes ((array!52378 0))(
  ( (array!52379 (arr!25191 (Array (_ BitVec 32) (_ BitVec 64))) (size!25637 (_ BitVec 32))) )
))
(declare-datatypes ((V!29225 0))(
  ( (V!29226 (val!9148 Int)) )
))
(declare-datatypes ((ValueCell!8616 0))(
  ( (ValueCellFull!8616 (v!11636 V!29225)) (EmptyCell!8616) )
))
(declare-datatypes ((array!52380 0))(
  ( (array!52381 (arr!25192 (Array (_ BitVec 32) ValueCell!8616)) (size!25638 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4248 0))(
  ( (LongMapFixedSize!4249 (defaultEntry!5336 Int) (mask!25893 (_ BitVec 32)) (extraKeys!5032 (_ BitVec 32)) (zeroValue!5136 V!29225) (minValue!5136 V!29225) (_size!2179 (_ BitVec 32)) (_keys!10033 array!52378) (_values!5323 array!52380) (_vacant!2179 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4248)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun dynLambda!1301 (Int (_ BitVec 64)) V!29225)

(declare-datatypes ((Option!459 0))(
  ( (Some!458 (v!11637 V!29225)) (None!457) )
))
(declare-fun get!13269 (Option!459) V!29225)

(declare-datatypes ((tuple2!12026 0))(
  ( (tuple2!12027 (_1!6024 (_ BitVec 64)) (_2!6024 V!29225)) )
))
(declare-datatypes ((List!17804 0))(
  ( (Nil!17801) (Cons!17800 (h!18933 tuple2!12026) (t!25141 List!17804)) )
))
(declare-fun getValueByKey!453 (List!17804 (_ BitVec 64)) Option!459)

(declare-datatypes ((ListLongMap!10723 0))(
  ( (ListLongMap!10724 (toList!5377 List!17804)) )
))
(declare-fun map!12224 (LongMapFixedSize!4248) ListLongMap!10723)

(assert (=> b!894389 (= e!499555 (not (= (dynLambda!1301 (defaultEntry!5336 thiss!1181) key!785) (get!13269 (getValueByKey!453 (toList!5377 (map!12224 thiss!1181)) key!785)))))))

(declare-fun b!894390 () Bool)

(declare-fun e!499559 () Bool)

(declare-fun tp_is_empty!18195 () Bool)

(assert (=> b!894390 (= e!499559 tp_is_empty!18195)))

(declare-fun mapIsEmpty!28863 () Bool)

(declare-fun mapRes!28863 () Bool)

(assert (=> mapIsEmpty!28863 mapRes!28863))

(declare-fun b!894391 () Bool)

(declare-fun e!499560 () Bool)

(assert (=> b!894391 (= e!499560 tp_is_empty!18195)))

(declare-fun b!894392 () Bool)

(declare-fun e!499557 () Bool)

(assert (=> b!894392 (= e!499557 (and e!499559 mapRes!28863))))

(declare-fun condMapEmpty!28863 () Bool)

(declare-fun mapDefault!28863 () ValueCell!8616)

(assert (=> b!894392 (= condMapEmpty!28863 (= (arr!25192 (_values!5323 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8616)) mapDefault!28863)))))

(declare-fun b!894393 () Bool)

(declare-fun res!605338 () Bool)

(assert (=> b!894393 (=> (not res!605338) (not e!499555))))

(declare-fun contains!4391 (LongMapFixedSize!4248 (_ BitVec 64)) Bool)

(assert (=> b!894393 (= res!605338 (contains!4391 thiss!1181 key!785))))

(declare-fun mapNonEmpty!28863 () Bool)

(declare-fun tp!55585 () Bool)

(assert (=> mapNonEmpty!28863 (= mapRes!28863 (and tp!55585 e!499560))))

(declare-fun mapKey!28863 () (_ BitVec 32))

(declare-fun mapRest!28863 () (Array (_ BitVec 32) ValueCell!8616))

(declare-fun mapValue!28863 () ValueCell!8616)

(assert (=> mapNonEmpty!28863 (= (arr!25192 (_values!5323 thiss!1181)) (store mapRest!28863 mapKey!28863 mapValue!28863))))

(declare-fun b!894394 () Bool)

(declare-fun res!605336 () Bool)

(assert (=> b!894394 (=> (not res!605336) (not e!499555))))

(assert (=> b!894394 (= res!605336 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!5032 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (or (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!5032 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun e!499556 () Bool)

(declare-fun array_inv!19780 (array!52378) Bool)

(declare-fun array_inv!19781 (array!52380) Bool)

(assert (=> b!894395 (= e!499556 (and tp!55586 tp_is_empty!18195 (array_inv!19780 (_keys!10033 thiss!1181)) (array_inv!19781 (_values!5323 thiss!1181)) e!499557))))

(declare-fun res!605337 () Bool)

(assert (=> start!76124 (=> (not res!605337) (not e!499555))))

(declare-fun valid!1640 (LongMapFixedSize!4248) Bool)

(assert (=> start!76124 (= res!605337 (valid!1640 thiss!1181))))

(assert (=> start!76124 e!499555))

(assert (=> start!76124 e!499556))

(assert (=> start!76124 true))

(assert (= (and start!76124 res!605337) b!894394))

(assert (= (and b!894394 res!605336) b!894393))

(assert (= (and b!894393 res!605338) b!894389))

(assert (= (and b!894392 condMapEmpty!28863) mapIsEmpty!28863))

(assert (= (and b!894392 (not condMapEmpty!28863)) mapNonEmpty!28863))

(get-info :version)

(assert (= (and mapNonEmpty!28863 ((_ is ValueCellFull!8616) mapValue!28863)) b!894391))

(assert (= (and b!894392 ((_ is ValueCellFull!8616) mapDefault!28863)) b!894390))

(assert (= b!894395 b!894392))

(assert (= start!76124 b!894395))

(declare-fun b_lambda!12953 () Bool)

(assert (=> (not b_lambda!12953) (not b!894389)))

(declare-fun t!25140 () Bool)

(declare-fun tb!5187 () Bool)

(assert (=> (and b!894395 (= (defaultEntry!5336 thiss!1181) (defaultEntry!5336 thiss!1181)) t!25140) tb!5187))

(declare-fun result!10089 () Bool)

(assert (=> tb!5187 (= result!10089 tp_is_empty!18195)))

(assert (=> b!894389 t!25140))

(declare-fun b_and!26157 () Bool)

(assert (= b_and!26155 (and (=> t!25140 result!10089) b_and!26157)))

(declare-fun m!832467 () Bool)

(assert (=> b!894389 m!832467))

(declare-fun m!832469 () Bool)

(assert (=> b!894389 m!832469))

(declare-fun m!832471 () Bool)

(assert (=> b!894389 m!832471))

(assert (=> b!894389 m!832471))

(declare-fun m!832473 () Bool)

(assert (=> b!894389 m!832473))

(declare-fun m!832475 () Bool)

(assert (=> mapNonEmpty!28863 m!832475))

(declare-fun m!832477 () Bool)

(assert (=> b!894393 m!832477))

(declare-fun m!832479 () Bool)

(assert (=> b!894395 m!832479))

(declare-fun m!832481 () Bool)

(assert (=> b!894395 m!832481))

(declare-fun m!832483 () Bool)

(assert (=> start!76124 m!832483))

(check-sat (not b_next!15867) (not b_lambda!12953) (not b!894395) (not mapNonEmpty!28863) tp_is_empty!18195 b_and!26157 (not b!894389) (not start!76124) (not b!894393))
(check-sat b_and!26157 (not b_next!15867))
(get-model)

(declare-fun b_lambda!12957 () Bool)

(assert (= b_lambda!12953 (or (and b!894395 b_free!15867) b_lambda!12957)))

(check-sat (not b_next!15867) (not b!894395) (not mapNonEmpty!28863) tp_is_empty!18195 b_and!26157 (not b_lambda!12957) (not b!894389) (not start!76124) (not b!894393))
(check-sat b_and!26157 (not b_next!15867))
(get-model)

(declare-fun d!110639 () Bool)

(assert (=> d!110639 (= (array_inv!19780 (_keys!10033 thiss!1181)) (bvsge (size!25637 (_keys!10033 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894395 d!110639))

(declare-fun d!110641 () Bool)

(assert (=> d!110641 (= (array_inv!19781 (_values!5323 thiss!1181)) (bvsge (size!25638 (_values!5323 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894395 d!110641))

(declare-fun d!110643 () Bool)

(declare-fun res!605354 () Bool)

(declare-fun e!499581 () Bool)

(assert (=> d!110643 (=> (not res!605354) (not e!499581))))

(declare-fun simpleValid!299 (LongMapFixedSize!4248) Bool)

(assert (=> d!110643 (= res!605354 (simpleValid!299 thiss!1181))))

(assert (=> d!110643 (= (valid!1640 thiss!1181) e!499581)))

(declare-fun b!894427 () Bool)

(declare-fun res!605355 () Bool)

(assert (=> b!894427 (=> (not res!605355) (not e!499581))))

(declare-fun arrayCountValidKeys!0 (array!52378 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894427 (= res!605355 (= (arrayCountValidKeys!0 (_keys!10033 thiss!1181) #b00000000000000000000000000000000 (size!25637 (_keys!10033 thiss!1181))) (_size!2179 thiss!1181)))))

(declare-fun b!894428 () Bool)

(declare-fun res!605356 () Bool)

(assert (=> b!894428 (=> (not res!605356) (not e!499581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52378 (_ BitVec 32)) Bool)

(assert (=> b!894428 (= res!605356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10033 thiss!1181) (mask!25893 thiss!1181)))))

(declare-fun b!894429 () Bool)

(declare-datatypes ((List!17806 0))(
  ( (Nil!17803) (Cons!17802 (h!18935 (_ BitVec 64)) (t!25145 List!17806)) )
))
(declare-fun arrayNoDuplicates!0 (array!52378 (_ BitVec 32) List!17806) Bool)

(assert (=> b!894429 (= e!499581 (arrayNoDuplicates!0 (_keys!10033 thiss!1181) #b00000000000000000000000000000000 Nil!17803))))

(assert (= (and d!110643 res!605354) b!894427))

(assert (= (and b!894427 res!605355) b!894428))

(assert (= (and b!894428 res!605356) b!894429))

(declare-fun m!832503 () Bool)

(assert (=> d!110643 m!832503))

(declare-fun m!832505 () Bool)

(assert (=> b!894427 m!832505))

(declare-fun m!832507 () Bool)

(assert (=> b!894428 m!832507))

(declare-fun m!832509 () Bool)

(assert (=> b!894429 m!832509))

(assert (=> start!76124 d!110643))

(declare-fun b!894450 () Bool)

(declare-fun c!94393 () Bool)

(declare-datatypes ((SeekEntryResult!8865 0))(
  ( (MissingZero!8865 (index!37831 (_ BitVec 32))) (Found!8865 (index!37832 (_ BitVec 32))) (Intermediate!8865 (undefined!9677 Bool) (index!37833 (_ BitVec 32)) (x!76037 (_ BitVec 32))) (Undefined!8865) (MissingVacant!8865 (index!37834 (_ BitVec 32))) )
))
(declare-fun lt!404278 () SeekEntryResult!8865)

(assert (=> b!894450 (= c!94393 ((_ is Found!8865) lt!404278))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52378 (_ BitVec 32)) SeekEntryResult!8865)

(assert (=> b!894450 (= lt!404278 (seekEntry!0 key!785 (_keys!10033 thiss!1181) (mask!25893 thiss!1181)))))

(declare-fun e!499594 () Bool)

(declare-fun e!499596 () Bool)

(assert (=> b!894450 (= e!499594 e!499596)))

(declare-fun b!894451 () Bool)

(declare-fun e!499593 () Bool)

(assert (=> b!894451 (= e!499593 (not (= (bvand (extraKeys!5032 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!894452 () Bool)

(declare-datatypes ((Unit!30450 0))(
  ( (Unit!30451) )
))
(declare-fun e!499595 () Unit!30450)

(declare-fun Unit!30452 () Unit!30450)

(assert (=> b!894452 (= e!499595 Unit!30452)))

(declare-fun b!894453 () Bool)

(assert (=> b!894453 false))

(declare-fun lt!404279 () Unit!30450)

(declare-fun lt!404273 () Unit!30450)

(assert (=> b!894453 (= lt!404279 lt!404273)))

(declare-fun lt!404275 () SeekEntryResult!8865)

(declare-fun lt!404284 () (_ BitVec 32))

(assert (=> b!894453 (and ((_ is Found!8865) lt!404275) (= (index!37832 lt!404275) lt!404284))))

(assert (=> b!894453 (= lt!404275 (seekEntry!0 key!785 (_keys!10033 thiss!1181) (mask!25893 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!52378 (_ BitVec 32)) Unit!30450)

(assert (=> b!894453 (= lt!404273 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!404284 (_keys!10033 thiss!1181) (mask!25893 thiss!1181)))))

(declare-fun lt!404277 () Unit!30450)

(declare-fun lt!404276 () Unit!30450)

(assert (=> b!894453 (= lt!404277 lt!404276)))

(assert (=> b!894453 (arrayForallSeekEntryOrOpenFound!0 lt!404284 (_keys!10033 thiss!1181) (mask!25893 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!52378 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30450)

(assert (=> b!894453 (= lt!404276 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10033 thiss!1181) (mask!25893 thiss!1181) #b00000000000000000000000000000000 lt!404284))))

(declare-fun arrayScanForKey!0 (array!52378 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894453 (= lt!404284 (arrayScanForKey!0 (_keys!10033 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!404282 () Unit!30450)

(declare-fun lt!404280 () Unit!30450)

(assert (=> b!894453 (= lt!404282 lt!404280)))

(declare-fun e!499592 () Bool)

(assert (=> b!894453 e!499592))

(declare-fun c!94391 () Bool)

(assert (=> b!894453 (= c!94391 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!164 (array!52378 array!52380 (_ BitVec 32) (_ BitVec 32) V!29225 V!29225 (_ BitVec 64) Int) Unit!30450)

(assert (=> b!894453 (= lt!404280 (lemmaKeyInListMapIsInArray!164 (_keys!10033 thiss!1181) (_values!5323 thiss!1181) (mask!25893 thiss!1181) (extraKeys!5032 thiss!1181) (zeroValue!5136 thiss!1181) (minValue!5136 thiss!1181) key!785 (defaultEntry!5336 thiss!1181)))))

(declare-fun Unit!30453 () Unit!30450)

(assert (=> b!894453 (= e!499595 Unit!30453)))

(declare-fun b!894454 () Bool)

(assert (=> b!894454 (= e!499594 (not (= (bvand (extraKeys!5032 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!39716 () Bool)

(declare-fun call!39718 () ListLongMap!10723)

(declare-fun bm!39713 () Bool)

(declare-fun contains!4393 (ListLongMap!10723 (_ BitVec 64)) Bool)

(assert (=> bm!39713 (= call!39716 (contains!4393 call!39718 (ite c!94393 (select (arr!25191 (_keys!10033 thiss!1181)) (index!37832 lt!404278)) key!785)))))

(declare-fun b!894455 () Bool)

(assert (=> b!894455 (= e!499596 false)))

(declare-fun c!94390 () Bool)

(assert (=> b!894455 (= c!94390 call!39716)))

(declare-fun lt!404271 () Unit!30450)

(assert (=> b!894455 (= lt!404271 e!499595)))

(declare-fun b!894456 () Bool)

(declare-fun call!39717 () Bool)

(assert (=> b!894456 (= e!499592 call!39717)))

(declare-fun d!110645 () Bool)

(declare-fun lt!404281 () Bool)

(assert (=> d!110645 (= lt!404281 (contains!4393 (map!12224 thiss!1181) key!785))))

(assert (=> d!110645 (= lt!404281 e!499593)))

(declare-fun c!94392 () Bool)

(assert (=> d!110645 (= c!94392 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110645 (valid!1640 thiss!1181)))

(assert (=> d!110645 (= (contains!4391 thiss!1181 key!785) lt!404281)))

(declare-fun b!894457 () Bool)

(assert (=> b!894457 (= e!499596 true)))

(declare-fun lt!404283 () Unit!30450)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52378 (_ BitVec 64) (_ BitVec 32)) Unit!30450)

(assert (=> b!894457 (= lt!404283 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10033 thiss!1181) key!785 (index!37832 lt!404278)))))

(assert (=> b!894457 call!39717))

(declare-fun lt!404274 () Unit!30450)

(assert (=> b!894457 (= lt!404274 lt!404283)))

(declare-fun lt!404272 () Unit!30450)

(declare-fun lemmaValidKeyInArrayIsInListMap!241 (array!52378 array!52380 (_ BitVec 32) (_ BitVec 32) V!29225 V!29225 (_ BitVec 32) Int) Unit!30450)

(assert (=> b!894457 (= lt!404272 (lemmaValidKeyInArrayIsInListMap!241 (_keys!10033 thiss!1181) (_values!5323 thiss!1181) (mask!25893 thiss!1181) (extraKeys!5032 thiss!1181) (zeroValue!5136 thiss!1181) (minValue!5136 thiss!1181) (index!37832 lt!404278) (defaultEntry!5336 thiss!1181)))))

(assert (=> b!894457 call!39716))

(declare-fun lt!404270 () Unit!30450)

(assert (=> b!894457 (= lt!404270 lt!404272)))

(declare-fun b!894458 () Bool)

(assert (=> b!894458 (= e!499592 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5032 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5032 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!39714 () Bool)

(declare-fun arrayContainsKey!0 (array!52378 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39714 (= call!39717 (arrayContainsKey!0 (_keys!10033 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!894459 () Bool)

(assert (=> b!894459 (= e!499593 e!499594)))

(declare-fun c!94394 () Bool)

(assert (=> b!894459 (= c!94394 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!39715 () Bool)

(declare-fun getCurrentListMap!2652 (array!52378 array!52380 (_ BitVec 32) (_ BitVec 32) V!29225 V!29225 (_ BitVec 32) Int) ListLongMap!10723)

(assert (=> bm!39715 (= call!39718 (getCurrentListMap!2652 (_keys!10033 thiss!1181) (_values!5323 thiss!1181) (mask!25893 thiss!1181) (extraKeys!5032 thiss!1181) (zeroValue!5136 thiss!1181) (minValue!5136 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5336 thiss!1181)))))

(assert (= (and d!110645 c!94392) b!894451))

(assert (= (and d!110645 (not c!94392)) b!894459))

(assert (= (and b!894459 c!94394) b!894454))

(assert (= (and b!894459 (not c!94394)) b!894450))

(assert (= (and b!894450 c!94393) b!894457))

(assert (= (and b!894450 (not c!94393)) b!894455))

(assert (= (and b!894455 c!94390) b!894453))

(assert (= (and b!894455 (not c!94390)) b!894452))

(assert (= (and b!894453 c!94391) b!894456))

(assert (= (and b!894453 (not c!94391)) b!894458))

(assert (= (or b!894457 b!894456) bm!39714))

(assert (= (or b!894457 b!894455) bm!39715))

(assert (= (or b!894457 b!894455) bm!39713))

(declare-fun m!832511 () Bool)

(assert (=> b!894453 m!832511))

(declare-fun m!832513 () Bool)

(assert (=> b!894453 m!832513))

(declare-fun m!832515 () Bool)

(assert (=> b!894453 m!832515))

(declare-fun m!832517 () Bool)

(assert (=> b!894453 m!832517))

(declare-fun m!832519 () Bool)

(assert (=> b!894453 m!832519))

(declare-fun m!832521 () Bool)

(assert (=> b!894453 m!832521))

(declare-fun m!832523 () Bool)

(assert (=> bm!39713 m!832523))

(declare-fun m!832525 () Bool)

(assert (=> bm!39713 m!832525))

(declare-fun m!832527 () Bool)

(assert (=> b!894457 m!832527))

(declare-fun m!832529 () Bool)

(assert (=> b!894457 m!832529))

(declare-fun m!832531 () Bool)

(assert (=> bm!39715 m!832531))

(assert (=> b!894450 m!832513))

(declare-fun m!832533 () Bool)

(assert (=> bm!39714 m!832533))

(assert (=> d!110645 m!832469))

(assert (=> d!110645 m!832469))

(declare-fun m!832535 () Bool)

(assert (=> d!110645 m!832535))

(assert (=> d!110645 m!832483))

(assert (=> b!894393 d!110645))

(declare-fun d!110647 () Bool)

(assert (=> d!110647 (= (get!13269 (getValueByKey!453 (toList!5377 (map!12224 thiss!1181)) key!785)) (v!11637 (getValueByKey!453 (toList!5377 (map!12224 thiss!1181)) key!785)))))

(assert (=> b!894389 d!110647))

(declare-fun b!894469 () Bool)

(declare-fun e!499601 () Option!459)

(declare-fun e!499602 () Option!459)

(assert (=> b!894469 (= e!499601 e!499602)))

(declare-fun c!94400 () Bool)

(assert (=> b!894469 (= c!94400 (and ((_ is Cons!17800) (toList!5377 (map!12224 thiss!1181))) (not (= (_1!6024 (h!18933 (toList!5377 (map!12224 thiss!1181)))) key!785))))))

(declare-fun b!894470 () Bool)

(assert (=> b!894470 (= e!499602 (getValueByKey!453 (t!25141 (toList!5377 (map!12224 thiss!1181))) key!785))))

(declare-fun d!110649 () Bool)

(declare-fun c!94399 () Bool)

(assert (=> d!110649 (= c!94399 (and ((_ is Cons!17800) (toList!5377 (map!12224 thiss!1181))) (= (_1!6024 (h!18933 (toList!5377 (map!12224 thiss!1181)))) key!785)))))

(assert (=> d!110649 (= (getValueByKey!453 (toList!5377 (map!12224 thiss!1181)) key!785) e!499601)))

(declare-fun b!894471 () Bool)

(assert (=> b!894471 (= e!499602 None!457)))

(declare-fun b!894468 () Bool)

(assert (=> b!894468 (= e!499601 (Some!458 (_2!6024 (h!18933 (toList!5377 (map!12224 thiss!1181))))))))

(assert (= (and d!110649 c!94399) b!894468))

(assert (= (and d!110649 (not c!94399)) b!894469))

(assert (= (and b!894469 c!94400) b!894470))

(assert (= (and b!894469 (not c!94400)) b!894471))

(declare-fun m!832537 () Bool)

(assert (=> b!894470 m!832537))

(assert (=> b!894389 d!110649))

(declare-fun d!110651 () Bool)

(assert (=> d!110651 (= (map!12224 thiss!1181) (getCurrentListMap!2652 (_keys!10033 thiss!1181) (_values!5323 thiss!1181) (mask!25893 thiss!1181) (extraKeys!5032 thiss!1181) (zeroValue!5136 thiss!1181) (minValue!5136 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5336 thiss!1181)))))

(declare-fun bs!25123 () Bool)

(assert (= bs!25123 d!110651))

(assert (=> bs!25123 m!832531))

(assert (=> b!894389 d!110651))

(declare-fun condMapEmpty!28869 () Bool)

(declare-fun mapDefault!28869 () ValueCell!8616)

(assert (=> mapNonEmpty!28863 (= condMapEmpty!28869 (= mapRest!28863 ((as const (Array (_ BitVec 32) ValueCell!8616)) mapDefault!28869)))))

(declare-fun e!499607 () Bool)

(declare-fun mapRes!28869 () Bool)

(assert (=> mapNonEmpty!28863 (= tp!55585 (and e!499607 mapRes!28869))))

(declare-fun b!894478 () Bool)

(declare-fun e!499608 () Bool)

(assert (=> b!894478 (= e!499608 tp_is_empty!18195)))

(declare-fun b!894479 () Bool)

(assert (=> b!894479 (= e!499607 tp_is_empty!18195)))

(declare-fun mapNonEmpty!28869 () Bool)

(declare-fun tp!55595 () Bool)

(assert (=> mapNonEmpty!28869 (= mapRes!28869 (and tp!55595 e!499608))))

(declare-fun mapRest!28869 () (Array (_ BitVec 32) ValueCell!8616))

(declare-fun mapValue!28869 () ValueCell!8616)

(declare-fun mapKey!28869 () (_ BitVec 32))

(assert (=> mapNonEmpty!28869 (= mapRest!28863 (store mapRest!28869 mapKey!28869 mapValue!28869))))

(declare-fun mapIsEmpty!28869 () Bool)

(assert (=> mapIsEmpty!28869 mapRes!28869))

(assert (= (and mapNonEmpty!28863 condMapEmpty!28869) mapIsEmpty!28869))

(assert (= (and mapNonEmpty!28863 (not condMapEmpty!28869)) mapNonEmpty!28869))

(assert (= (and mapNonEmpty!28869 ((_ is ValueCellFull!8616) mapValue!28869)) b!894478))

(assert (= (and mapNonEmpty!28863 ((_ is ValueCellFull!8616) mapDefault!28869)) b!894479))

(declare-fun m!832539 () Bool)

(assert (=> mapNonEmpty!28869 m!832539))

(check-sat (not b!894457) (not b_next!15867) (not d!110651) (not d!110645) (not b!894428) (not b!894427) (not b!894453) (not d!110643) tp_is_empty!18195 b_and!26157 (not bm!39713) (not b_lambda!12957) (not b!894450) (not mapNonEmpty!28869) (not bm!39715) (not b!894470) (not bm!39714) (not b!894429))
(check-sat b_and!26157 (not b_next!15867))
