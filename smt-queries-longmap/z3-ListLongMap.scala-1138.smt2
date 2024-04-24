; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23528 () Bool)

(assert start!23528)

(declare-fun b!247081 () Bool)

(declare-fun b_free!6577 () Bool)

(declare-fun b_next!6577 () Bool)

(assert (=> b!247081 (= b_free!6577 (not b_next!6577))))

(declare-fun tp!22975 () Bool)

(declare-fun b_and!13591 () Bool)

(assert (=> b!247081 (= tp!22975 b_and!13591)))

(declare-fun b!247075 () Bool)

(declare-fun e!160284 () Bool)

(declare-fun tp_is_empty!6439 () Bool)

(assert (=> b!247075 (= e!160284 tp_is_empty!6439)))

(declare-fun b!247076 () Bool)

(declare-fun e!160277 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!247076 (= e!160277 (validKeyInArray!0 key!932))))

(declare-fun b!247077 () Bool)

(declare-datatypes ((Unit!7613 0))(
  ( (Unit!7614) )
))
(declare-fun e!160287 () Unit!7613)

(declare-fun lt!123793 () Unit!7613)

(assert (=> b!247077 (= e!160287 lt!123793)))

(declare-datatypes ((V!8233 0))(
  ( (V!8234 (val!3264 Int)) )
))
(declare-datatypes ((ValueCell!2876 0))(
  ( (ValueCellFull!2876 (v!5322 V!8233)) (EmptyCell!2876) )
))
(declare-datatypes ((array!12181 0))(
  ( (array!12182 (arr!5779 (Array (_ BitVec 32) ValueCell!2876)) (size!6122 (_ BitVec 32))) )
))
(declare-datatypes ((array!12183 0))(
  ( (array!12184 (arr!5780 (Array (_ BitVec 32) (_ BitVec 64))) (size!6123 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3652 0))(
  ( (LongMapFixedSize!3653 (defaultEntry!4571 Int) (mask!10704 (_ BitVec 32)) (extraKeys!4308 (_ BitVec 32)) (zeroValue!4412 V!8233) (minValue!4412 V!8233) (_size!1875 (_ BitVec 32)) (_keys!6692 array!12183) (_values!4554 array!12181) (_vacant!1875 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3652)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!371 (array!12183 array!12181 (_ BitVec 32) (_ BitVec 32) V!8233 V!8233 (_ BitVec 64) Int) Unit!7613)

(assert (=> b!247077 (= lt!123793 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!371 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) key!932 (defaultEntry!4571 thiss!1504)))))

(declare-fun c!41353 () Bool)

(declare-datatypes ((SeekEntryResult!1065 0))(
  ( (MissingZero!1065 (index!6430 (_ BitVec 32))) (Found!1065 (index!6431 (_ BitVec 32))) (Intermediate!1065 (undefined!1877 Bool) (index!6432 (_ BitVec 32)) (x!24475 (_ BitVec 32))) (Undefined!1065) (MissingVacant!1065 (index!6433 (_ BitVec 32))) )
))
(declare-fun lt!123789 () SeekEntryResult!1065)

(get-info :version)

(assert (=> b!247077 (= c!41353 ((_ is MissingZero!1065) lt!123789))))

(declare-fun e!160280 () Bool)

(assert (=> b!247077 e!160280))

(declare-fun b!247079 () Bool)

(declare-fun e!160276 () Bool)

(assert (=> b!247079 (= e!160276 ((_ is Undefined!1065) lt!123789))))

(declare-fun b!247080 () Bool)

(declare-fun res!121121 () Bool)

(declare-fun e!160274 () Bool)

(assert (=> b!247080 (=> (not res!121121) (not e!160274))))

(assert (=> b!247080 (= res!121121 (= (select (arr!5780 (_keys!6692 thiss!1504)) (index!6430 lt!123789)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!160285 () Bool)

(declare-fun e!160275 () Bool)

(declare-fun array_inv!3803 (array!12183) Bool)

(declare-fun array_inv!3804 (array!12181) Bool)

(assert (=> b!247081 (= e!160275 (and tp!22975 tp_is_empty!6439 (array_inv!3803 (_keys!6692 thiss!1504)) (array_inv!3804 (_values!4554 thiss!1504)) e!160285))))

(declare-fun mapIsEmpty!10931 () Bool)

(declare-fun mapRes!10931 () Bool)

(assert (=> mapIsEmpty!10931 mapRes!10931))

(declare-fun b!247082 () Bool)

(declare-fun call!23107 () Bool)

(assert (=> b!247082 (= e!160274 (not call!23107))))

(declare-fun b!247083 () Bool)

(declare-fun e!160286 () Bool)

(assert (=> b!247083 (= e!160286 (not e!160277))))

(declare-fun res!121122 () Bool)

(assert (=> b!247083 (=> res!121122 e!160277)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!247083 (= res!121122 (not (validMask!0 (mask!10704 thiss!1504))))))

(declare-fun lt!123791 () array!12183)

(declare-fun arrayCountValidKeys!0 (array!12183 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!247083 (= (arrayCountValidKeys!0 lt!123791 #b00000000000000000000000000000000 (size!6123 (_keys!6692 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6692 thiss!1504) #b00000000000000000000000000000000 (size!6123 (_keys!6692 thiss!1504)))))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!123786 () Unit!7613)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12183 (_ BitVec 32) (_ BitVec 64)) Unit!7613)

(assert (=> b!247083 (= lt!123786 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6692 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3611 0))(
  ( (Nil!3608) (Cons!3607 (h!4265 (_ BitVec 64)) (t!8624 List!3611)) )
))
(declare-fun arrayNoDuplicates!0 (array!12183 (_ BitVec 32) List!3611) Bool)

(assert (=> b!247083 (arrayNoDuplicates!0 lt!123791 #b00000000000000000000000000000000 Nil!3608)))

(assert (=> b!247083 (= lt!123791 (array!12184 (store (arr!5780 (_keys!6692 thiss!1504)) index!297 key!932) (size!6123 (_keys!6692 thiss!1504))))))

(declare-fun lt!123787 () Unit!7613)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12183 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3611) Unit!7613)

(assert (=> b!247083 (= lt!123787 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6692 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3608))))

(declare-fun lt!123792 () Unit!7613)

(declare-fun e!160278 () Unit!7613)

(assert (=> b!247083 (= lt!123792 e!160278)))

(declare-fun c!41356 () Bool)

(declare-fun arrayContainsKey!0 (array!12183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!247083 (= c!41356 (arrayContainsKey!0 (_keys!6692 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247084 () Bool)

(declare-fun e!160281 () Bool)

(assert (=> b!247084 (= e!160281 e!160286)))

(declare-fun res!121118 () Bool)

(assert (=> b!247084 (=> (not res!121118) (not e!160286))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!247084 (= res!121118 (inRange!0 index!297 (mask!10704 thiss!1504)))))

(declare-fun lt!123788 () Unit!7613)

(assert (=> b!247084 (= lt!123788 e!160287)))

(declare-fun c!41355 () Bool)

(declare-datatypes ((tuple2!4736 0))(
  ( (tuple2!4737 (_1!2379 (_ BitVec 64)) (_2!2379 V!8233)) )
))
(declare-datatypes ((List!3612 0))(
  ( (Nil!3609) (Cons!3608 (h!4266 tuple2!4736) (t!8625 List!3612)) )
))
(declare-datatypes ((ListLongMap!3651 0))(
  ( (ListLongMap!3652 (toList!1841 List!3612)) )
))
(declare-fun contains!1770 (ListLongMap!3651 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1373 (array!12183 array!12181 (_ BitVec 32) (_ BitVec 32) V!8233 V!8233 (_ BitVec 32) Int) ListLongMap!3651)

(assert (=> b!247084 (= c!41355 (contains!1770 (getCurrentListMap!1373 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)) key!932))))

(declare-fun bm!23103 () Bool)

(assert (=> bm!23103 (= call!23107 (arrayContainsKey!0 (_keys!6692 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!10931 () Bool)

(declare-fun tp!22976 () Bool)

(assert (=> mapNonEmpty!10931 (= mapRes!10931 (and tp!22976 e!160284))))

(declare-fun mapRest!10931 () (Array (_ BitVec 32) ValueCell!2876))

(declare-fun mapKey!10931 () (_ BitVec 32))

(declare-fun mapValue!10931 () ValueCell!2876)

(assert (=> mapNonEmpty!10931 (= (arr!5779 (_values!4554 thiss!1504)) (store mapRest!10931 mapKey!10931 mapValue!10931))))

(declare-fun b!247085 () Bool)

(declare-fun e!160279 () Bool)

(assert (=> b!247085 (= e!160276 e!160279)))

(declare-fun res!121119 () Bool)

(declare-fun call!23106 () Bool)

(assert (=> b!247085 (= res!121119 call!23106)))

(assert (=> b!247085 (=> (not res!121119) (not e!160279))))

(declare-fun b!247086 () Bool)

(declare-fun res!121126 () Bool)

(assert (=> b!247086 (=> res!121126 e!160277)))

(assert (=> b!247086 (= res!121126 (or (not (= (size!6123 (_keys!6692 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10704 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6123 (_keys!6692 thiss!1504)))))))

(declare-fun b!247087 () Bool)

(declare-fun Unit!7615 () Unit!7613)

(assert (=> b!247087 (= e!160287 Unit!7615)))

(declare-fun lt!123790 () Unit!7613)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!377 (array!12183 array!12181 (_ BitVec 32) (_ BitVec 32) V!8233 V!8233 (_ BitVec 64) Int) Unit!7613)

(assert (=> b!247087 (= lt!123790 (lemmaInListMapThenSeekEntryOrOpenFindsIt!377 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) key!932 (defaultEntry!4571 thiss!1504)))))

(assert (=> b!247087 false))

(declare-fun res!121124 () Bool)

(declare-fun e!160283 () Bool)

(assert (=> start!23528 (=> (not res!121124) (not e!160283))))

(declare-fun valid!1441 (LongMapFixedSize!3652) Bool)

(assert (=> start!23528 (= res!121124 (valid!1441 thiss!1504))))

(assert (=> start!23528 e!160283))

(assert (=> start!23528 e!160275))

(assert (=> start!23528 true))

(declare-fun b!247078 () Bool)

(declare-fun Unit!7616 () Unit!7613)

(assert (=> b!247078 (= e!160278 Unit!7616)))

(declare-fun lt!123785 () Unit!7613)

(declare-fun lemmaArrayContainsKeyThenInListMap!195 (array!12183 array!12181 (_ BitVec 32) (_ BitVec 32) V!8233 V!8233 (_ BitVec 64) (_ BitVec 32) Int) Unit!7613)

(assert (=> b!247078 (= lt!123785 (lemmaArrayContainsKeyThenInListMap!195 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)))))

(assert (=> b!247078 false))

(declare-fun b!247088 () Bool)

(declare-fun e!160282 () Bool)

(assert (=> b!247088 (= e!160282 tp_is_empty!6439)))

(declare-fun b!247089 () Bool)

(declare-fun Unit!7617 () Unit!7613)

(assert (=> b!247089 (= e!160278 Unit!7617)))

(declare-fun b!247090 () Bool)

(assert (=> b!247090 (= e!160283 e!160281)))

(declare-fun res!121120 () Bool)

(assert (=> b!247090 (=> (not res!121120) (not e!160281))))

(assert (=> b!247090 (= res!121120 (or (= lt!123789 (MissingZero!1065 index!297)) (= lt!123789 (MissingVacant!1065 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12183 (_ BitVec 32)) SeekEntryResult!1065)

(assert (=> b!247090 (= lt!123789 (seekEntryOrOpen!0 key!932 (_keys!6692 thiss!1504) (mask!10704 thiss!1504)))))

(declare-fun b!247091 () Bool)

(declare-fun c!41354 () Bool)

(assert (=> b!247091 (= c!41354 ((_ is MissingVacant!1065) lt!123789))))

(assert (=> b!247091 (= e!160280 e!160276)))

(declare-fun b!247092 () Bool)

(declare-fun res!121123 () Bool)

(assert (=> b!247092 (= res!121123 (= (select (arr!5780 (_keys!6692 thiss!1504)) (index!6433 lt!123789)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!247092 (=> (not res!121123) (not e!160279))))

(declare-fun b!247093 () Bool)

(assert (=> b!247093 (= e!160285 (and e!160282 mapRes!10931))))

(declare-fun condMapEmpty!10931 () Bool)

(declare-fun mapDefault!10931 () ValueCell!2876)

(assert (=> b!247093 (= condMapEmpty!10931 (= (arr!5779 (_values!4554 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2876)) mapDefault!10931)))))

(declare-fun b!247094 () Bool)

(declare-fun res!121117 () Bool)

(assert (=> b!247094 (=> (not res!121117) (not e!160283))))

(assert (=> b!247094 (= res!121117 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!247095 () Bool)

(assert (=> b!247095 (= e!160279 (not call!23107))))

(declare-fun bm!23104 () Bool)

(assert (=> bm!23104 (= call!23106 (inRange!0 (ite c!41353 (index!6430 lt!123789) (index!6433 lt!123789)) (mask!10704 thiss!1504)))))

(declare-fun b!247096 () Bool)

(declare-fun res!121125 () Bool)

(assert (=> b!247096 (=> (not res!121125) (not e!160274))))

(assert (=> b!247096 (= res!121125 call!23106)))

(assert (=> b!247096 (= e!160280 e!160274)))

(assert (= (and start!23528 res!121124) b!247094))

(assert (= (and b!247094 res!121117) b!247090))

(assert (= (and b!247090 res!121120) b!247084))

(assert (= (and b!247084 c!41355) b!247087))

(assert (= (and b!247084 (not c!41355)) b!247077))

(assert (= (and b!247077 c!41353) b!247096))

(assert (= (and b!247077 (not c!41353)) b!247091))

(assert (= (and b!247096 res!121125) b!247080))

(assert (= (and b!247080 res!121121) b!247082))

(assert (= (and b!247091 c!41354) b!247085))

(assert (= (and b!247091 (not c!41354)) b!247079))

(assert (= (and b!247085 res!121119) b!247092))

(assert (= (and b!247092 res!121123) b!247095))

(assert (= (or b!247096 b!247085) bm!23104))

(assert (= (or b!247082 b!247095) bm!23103))

(assert (= (and b!247084 res!121118) b!247083))

(assert (= (and b!247083 c!41356) b!247078))

(assert (= (and b!247083 (not c!41356)) b!247089))

(assert (= (and b!247083 (not res!121122)) b!247086))

(assert (= (and b!247086 (not res!121126)) b!247076))

(assert (= (and b!247093 condMapEmpty!10931) mapIsEmpty!10931))

(assert (= (and b!247093 (not condMapEmpty!10931)) mapNonEmpty!10931))

(assert (= (and mapNonEmpty!10931 ((_ is ValueCellFull!2876) mapValue!10931)) b!247075))

(assert (= (and b!247093 ((_ is ValueCellFull!2876) mapDefault!10931)) b!247088))

(assert (= b!247081 b!247093))

(assert (= start!23528 b!247081))

(declare-fun m!264407 () Bool)

(assert (=> b!247084 m!264407))

(declare-fun m!264409 () Bool)

(assert (=> b!247084 m!264409))

(assert (=> b!247084 m!264409))

(declare-fun m!264411 () Bool)

(assert (=> b!247084 m!264411))

(declare-fun m!264413 () Bool)

(assert (=> b!247078 m!264413))

(declare-fun m!264415 () Bool)

(assert (=> b!247090 m!264415))

(declare-fun m!264417 () Bool)

(assert (=> b!247083 m!264417))

(declare-fun m!264419 () Bool)

(assert (=> b!247083 m!264419))

(declare-fun m!264421 () Bool)

(assert (=> b!247083 m!264421))

(declare-fun m!264423 () Bool)

(assert (=> b!247083 m!264423))

(declare-fun m!264425 () Bool)

(assert (=> b!247083 m!264425))

(declare-fun m!264427 () Bool)

(assert (=> b!247083 m!264427))

(declare-fun m!264429 () Bool)

(assert (=> b!247083 m!264429))

(declare-fun m!264431 () Bool)

(assert (=> b!247083 m!264431))

(declare-fun m!264433 () Bool)

(assert (=> b!247087 m!264433))

(declare-fun m!264435 () Bool)

(assert (=> b!247081 m!264435))

(declare-fun m!264437 () Bool)

(assert (=> b!247081 m!264437))

(assert (=> bm!23103 m!264419))

(declare-fun m!264439 () Bool)

(assert (=> bm!23104 m!264439))

(declare-fun m!264441 () Bool)

(assert (=> b!247092 m!264441))

(declare-fun m!264443 () Bool)

(assert (=> b!247080 m!264443))

(declare-fun m!264445 () Bool)

(assert (=> b!247077 m!264445))

(declare-fun m!264447 () Bool)

(assert (=> b!247076 m!264447))

(declare-fun m!264449 () Bool)

(assert (=> mapNonEmpty!10931 m!264449))

(declare-fun m!264451 () Bool)

(assert (=> start!23528 m!264451))

(check-sat (not b!247081) (not b!247077) (not b!247083) (not bm!23103) (not b_next!6577) (not mapNonEmpty!10931) (not b!247078) (not b!247090) (not b!247084) b_and!13591 (not b!247076) (not start!23528) tp_is_empty!6439 (not bm!23104) (not b!247087))
(check-sat b_and!13591 (not b_next!6577))
(get-model)

(declare-fun d!60513 () Bool)

(declare-fun e!160381 () Bool)

(assert (=> d!60513 e!160381))

(declare-fun res!121192 () Bool)

(assert (=> d!60513 (=> (not res!121192) (not e!160381))))

(declare-fun lt!123853 () SeekEntryResult!1065)

(assert (=> d!60513 (= res!121192 ((_ is Found!1065) lt!123853))))

(assert (=> d!60513 (= lt!123853 (seekEntryOrOpen!0 key!932 (_keys!6692 thiss!1504) (mask!10704 thiss!1504)))))

(declare-fun lt!123852 () Unit!7613)

(declare-fun choose!1168 (array!12183 array!12181 (_ BitVec 32) (_ BitVec 32) V!8233 V!8233 (_ BitVec 64) Int) Unit!7613)

(assert (=> d!60513 (= lt!123852 (choose!1168 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) key!932 (defaultEntry!4571 thiss!1504)))))

(assert (=> d!60513 (validMask!0 (mask!10704 thiss!1504))))

(assert (=> d!60513 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!377 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) key!932 (defaultEntry!4571 thiss!1504)) lt!123852)))

(declare-fun b!247233 () Bool)

(declare-fun res!121191 () Bool)

(assert (=> b!247233 (=> (not res!121191) (not e!160381))))

(assert (=> b!247233 (= res!121191 (inRange!0 (index!6431 lt!123853) (mask!10704 thiss!1504)))))

(declare-fun b!247234 () Bool)

(assert (=> b!247234 (= e!160381 (= (select (arr!5780 (_keys!6692 thiss!1504)) (index!6431 lt!123853)) key!932))))

(assert (=> b!247234 (and (bvsge (index!6431 lt!123853) #b00000000000000000000000000000000) (bvslt (index!6431 lt!123853) (size!6123 (_keys!6692 thiss!1504))))))

(assert (= (and d!60513 res!121192) b!247233))

(assert (= (and b!247233 res!121191) b!247234))

(assert (=> d!60513 m!264415))

(declare-fun m!264545 () Bool)

(assert (=> d!60513 m!264545))

(assert (=> d!60513 m!264417))

(declare-fun m!264547 () Bool)

(assert (=> b!247233 m!264547))

(declare-fun m!264549 () Bool)

(assert (=> b!247234 m!264549))

(assert (=> b!247087 d!60513))

(declare-fun d!60515 () Bool)

(assert (=> d!60515 (= (inRange!0 index!297 (mask!10704 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10704 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!247084 d!60515))

(declare-fun d!60517 () Bool)

(declare-fun e!160386 () Bool)

(assert (=> d!60517 e!160386))

(declare-fun res!121195 () Bool)

(assert (=> d!60517 (=> res!121195 e!160386)))

(declare-fun lt!123863 () Bool)

(assert (=> d!60517 (= res!121195 (not lt!123863))))

(declare-fun lt!123864 () Bool)

(assert (=> d!60517 (= lt!123863 lt!123864)))

(declare-fun lt!123862 () Unit!7613)

(declare-fun e!160387 () Unit!7613)

(assert (=> d!60517 (= lt!123862 e!160387)))

(declare-fun c!41383 () Bool)

(assert (=> d!60517 (= c!41383 lt!123864)))

(declare-fun containsKey!284 (List!3612 (_ BitVec 64)) Bool)

(assert (=> d!60517 (= lt!123864 (containsKey!284 (toList!1841 (getCurrentListMap!1373 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504))) key!932))))

(assert (=> d!60517 (= (contains!1770 (getCurrentListMap!1373 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)) key!932) lt!123863)))

(declare-fun b!247241 () Bool)

(declare-fun lt!123865 () Unit!7613)

(assert (=> b!247241 (= e!160387 lt!123865)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!232 (List!3612 (_ BitVec 64)) Unit!7613)

(assert (=> b!247241 (= lt!123865 (lemmaContainsKeyImpliesGetValueByKeyDefined!232 (toList!1841 (getCurrentListMap!1373 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504))) key!932))))

(declare-datatypes ((Option!299 0))(
  ( (Some!298 (v!5325 V!8233)) (None!297) )
))
(declare-fun isDefined!233 (Option!299) Bool)

(declare-fun getValueByKey!293 (List!3612 (_ BitVec 64)) Option!299)

(assert (=> b!247241 (isDefined!233 (getValueByKey!293 (toList!1841 (getCurrentListMap!1373 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504))) key!932))))

(declare-fun b!247242 () Bool)

(declare-fun Unit!7625 () Unit!7613)

(assert (=> b!247242 (= e!160387 Unit!7625)))

(declare-fun b!247243 () Bool)

(assert (=> b!247243 (= e!160386 (isDefined!233 (getValueByKey!293 (toList!1841 (getCurrentListMap!1373 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504))) key!932)))))

(assert (= (and d!60517 c!41383) b!247241))

(assert (= (and d!60517 (not c!41383)) b!247242))

(assert (= (and d!60517 (not res!121195)) b!247243))

(declare-fun m!264551 () Bool)

(assert (=> d!60517 m!264551))

(declare-fun m!264553 () Bool)

(assert (=> b!247241 m!264553))

(declare-fun m!264555 () Bool)

(assert (=> b!247241 m!264555))

(assert (=> b!247241 m!264555))

(declare-fun m!264557 () Bool)

(assert (=> b!247241 m!264557))

(assert (=> b!247243 m!264555))

(assert (=> b!247243 m!264555))

(assert (=> b!247243 m!264557))

(assert (=> b!247084 d!60517))

(declare-fun bm!23131 () Bool)

(declare-fun call!23140 () ListLongMap!3651)

(declare-fun call!23139 () ListLongMap!3651)

(assert (=> bm!23131 (= call!23140 call!23139)))

(declare-fun bm!23132 () Bool)

(declare-fun call!23138 () Bool)

(declare-fun lt!123913 () ListLongMap!3651)

(assert (=> bm!23132 (= call!23138 (contains!1770 lt!123913 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!247286 () Bool)

(declare-fun e!160415 () Bool)

(declare-fun e!160424 () Bool)

(assert (=> b!247286 (= e!160415 e!160424)))

(declare-fun res!121214 () Bool)

(assert (=> b!247286 (=> (not res!121214) (not e!160424))))

(assert (=> b!247286 (= res!121214 (contains!1770 lt!123913 (select (arr!5780 (_keys!6692 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!247286 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6123 (_keys!6692 thiss!1504))))))

(declare-fun b!247287 () Bool)

(declare-fun e!160422 () ListLongMap!3651)

(declare-fun call!23134 () ListLongMap!3651)

(assert (=> b!247287 (= e!160422 call!23134)))

(declare-fun b!247288 () Bool)

(declare-fun e!160419 () Bool)

(declare-fun e!160414 () Bool)

(assert (=> b!247288 (= e!160419 e!160414)))

(declare-fun c!41396 () Bool)

(assert (=> b!247288 (= c!41396 (not (= (bvand (extraKeys!4308 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!247289 () Bool)

(declare-fun e!160416 () Bool)

(declare-fun apply!234 (ListLongMap!3651 (_ BitVec 64)) V!8233)

(assert (=> b!247289 (= e!160416 (= (apply!234 lt!123913 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4412 thiss!1504)))))

(declare-fun b!247290 () Bool)

(declare-fun res!121215 () Bool)

(assert (=> b!247290 (=> (not res!121215) (not e!160419))))

(declare-fun e!160418 () Bool)

(assert (=> b!247290 (= res!121215 e!160418)))

(declare-fun c!41398 () Bool)

(assert (=> b!247290 (= c!41398 (not (= (bvand (extraKeys!4308 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!247291 () Bool)

(declare-fun e!160421 () Unit!7613)

(declare-fun Unit!7626 () Unit!7613)

(assert (=> b!247291 (= e!160421 Unit!7626)))

(declare-fun bm!23133 () Bool)

(declare-fun call!23136 () ListLongMap!3651)

(assert (=> bm!23133 (= call!23136 call!23140)))

(declare-fun d!60519 () Bool)

(assert (=> d!60519 e!160419))

(declare-fun res!121220 () Bool)

(assert (=> d!60519 (=> (not res!121220) (not e!160419))))

(assert (=> d!60519 (= res!121220 (or (bvsge #b00000000000000000000000000000000 (size!6123 (_keys!6692 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6123 (_keys!6692 thiss!1504))))))))

(declare-fun lt!123924 () ListLongMap!3651)

(assert (=> d!60519 (= lt!123913 lt!123924)))

(declare-fun lt!123930 () Unit!7613)

(assert (=> d!60519 (= lt!123930 e!160421)))

(declare-fun c!41401 () Bool)

(declare-fun e!160423 () Bool)

(assert (=> d!60519 (= c!41401 e!160423)))

(declare-fun res!121222 () Bool)

(assert (=> d!60519 (=> (not res!121222) (not e!160423))))

(assert (=> d!60519 (= res!121222 (bvslt #b00000000000000000000000000000000 (size!6123 (_keys!6692 thiss!1504))))))

(declare-fun e!160425 () ListLongMap!3651)

(assert (=> d!60519 (= lt!123924 e!160425)))

(declare-fun c!41397 () Bool)

(assert (=> d!60519 (= c!41397 (and (not (= (bvand (extraKeys!4308 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4308 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60519 (validMask!0 (mask!10704 thiss!1504))))

(assert (=> d!60519 (= (getCurrentListMap!1373 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)) lt!123913)))

(declare-fun b!247292 () Bool)

(assert (=> b!247292 (= e!160422 call!23136)))

(declare-fun bm!23134 () Bool)

(declare-fun call!23137 () Bool)

(assert (=> bm!23134 (= call!23137 (contains!1770 lt!123913 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!247293 () Bool)

(declare-fun e!160417 () Bool)

(assert (=> b!247293 (= e!160414 e!160417)))

(declare-fun res!121216 () Bool)

(assert (=> b!247293 (= res!121216 call!23137)))

(assert (=> b!247293 (=> (not res!121216) (not e!160417))))

(declare-fun b!247294 () Bool)

(declare-fun get!2975 (ValueCell!2876 V!8233) V!8233)

(declare-fun dynLambda!577 (Int (_ BitVec 64)) V!8233)

(assert (=> b!247294 (= e!160424 (= (apply!234 lt!123913 (select (arr!5780 (_keys!6692 thiss!1504)) #b00000000000000000000000000000000)) (get!2975 (select (arr!5779 (_values!4554 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!577 (defaultEntry!4571 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!247294 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6122 (_values!4554 thiss!1504))))))

(assert (=> b!247294 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6123 (_keys!6692 thiss!1504))))))

(declare-fun b!247295 () Bool)

(declare-fun lt!123929 () Unit!7613)

(assert (=> b!247295 (= e!160421 lt!123929)))

(declare-fun lt!123910 () ListLongMap!3651)

(declare-fun getCurrentListMapNoExtraKeys!550 (array!12183 array!12181 (_ BitVec 32) (_ BitVec 32) V!8233 V!8233 (_ BitVec 32) Int) ListLongMap!3651)

(assert (=> b!247295 (= lt!123910 (getCurrentListMapNoExtraKeys!550 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)))))

(declare-fun lt!123916 () (_ BitVec 64))

(assert (=> b!247295 (= lt!123916 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123923 () (_ BitVec 64))

(assert (=> b!247295 (= lt!123923 (select (arr!5780 (_keys!6692 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123915 () Unit!7613)

(declare-fun addStillContains!210 (ListLongMap!3651 (_ BitVec 64) V!8233 (_ BitVec 64)) Unit!7613)

(assert (=> b!247295 (= lt!123915 (addStillContains!210 lt!123910 lt!123916 (zeroValue!4412 thiss!1504) lt!123923))))

(declare-fun +!661 (ListLongMap!3651 tuple2!4736) ListLongMap!3651)

(assert (=> b!247295 (contains!1770 (+!661 lt!123910 (tuple2!4737 lt!123916 (zeroValue!4412 thiss!1504))) lt!123923)))

(declare-fun lt!123927 () Unit!7613)

(assert (=> b!247295 (= lt!123927 lt!123915)))

(declare-fun lt!123914 () ListLongMap!3651)

(assert (=> b!247295 (= lt!123914 (getCurrentListMapNoExtraKeys!550 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)))))

(declare-fun lt!123911 () (_ BitVec 64))

(assert (=> b!247295 (= lt!123911 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123928 () (_ BitVec 64))

(assert (=> b!247295 (= lt!123928 (select (arr!5780 (_keys!6692 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123926 () Unit!7613)

(declare-fun addApplyDifferent!210 (ListLongMap!3651 (_ BitVec 64) V!8233 (_ BitVec 64)) Unit!7613)

(assert (=> b!247295 (= lt!123926 (addApplyDifferent!210 lt!123914 lt!123911 (minValue!4412 thiss!1504) lt!123928))))

(assert (=> b!247295 (= (apply!234 (+!661 lt!123914 (tuple2!4737 lt!123911 (minValue!4412 thiss!1504))) lt!123928) (apply!234 lt!123914 lt!123928))))

(declare-fun lt!123921 () Unit!7613)

(assert (=> b!247295 (= lt!123921 lt!123926)))

(declare-fun lt!123925 () ListLongMap!3651)

(assert (=> b!247295 (= lt!123925 (getCurrentListMapNoExtraKeys!550 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)))))

(declare-fun lt!123920 () (_ BitVec 64))

(assert (=> b!247295 (= lt!123920 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123912 () (_ BitVec 64))

(assert (=> b!247295 (= lt!123912 (select (arr!5780 (_keys!6692 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123919 () Unit!7613)

(assert (=> b!247295 (= lt!123919 (addApplyDifferent!210 lt!123925 lt!123920 (zeroValue!4412 thiss!1504) lt!123912))))

(assert (=> b!247295 (= (apply!234 (+!661 lt!123925 (tuple2!4737 lt!123920 (zeroValue!4412 thiss!1504))) lt!123912) (apply!234 lt!123925 lt!123912))))

(declare-fun lt!123917 () Unit!7613)

(assert (=> b!247295 (= lt!123917 lt!123919)))

(declare-fun lt!123918 () ListLongMap!3651)

(assert (=> b!247295 (= lt!123918 (getCurrentListMapNoExtraKeys!550 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)))))

(declare-fun lt!123922 () (_ BitVec 64))

(assert (=> b!247295 (= lt!123922 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123931 () (_ BitVec 64))

(assert (=> b!247295 (= lt!123931 (select (arr!5780 (_keys!6692 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!247295 (= lt!123929 (addApplyDifferent!210 lt!123918 lt!123922 (minValue!4412 thiss!1504) lt!123931))))

(assert (=> b!247295 (= (apply!234 (+!661 lt!123918 (tuple2!4737 lt!123922 (minValue!4412 thiss!1504))) lt!123931) (apply!234 lt!123918 lt!123931))))

(declare-fun b!247296 () Bool)

(declare-fun res!121221 () Bool)

(assert (=> b!247296 (=> (not res!121221) (not e!160419))))

(assert (=> b!247296 (= res!121221 e!160415)))

(declare-fun res!121217 () Bool)

(assert (=> b!247296 (=> res!121217 e!160415)))

(declare-fun e!160426 () Bool)

(assert (=> b!247296 (= res!121217 (not e!160426))))

(declare-fun res!121218 () Bool)

(assert (=> b!247296 (=> (not res!121218) (not e!160426))))

(assert (=> b!247296 (= res!121218 (bvslt #b00000000000000000000000000000000 (size!6123 (_keys!6692 thiss!1504))))))

(declare-fun b!247297 () Bool)

(assert (=> b!247297 (= e!160418 e!160416)))

(declare-fun res!121219 () Bool)

(assert (=> b!247297 (= res!121219 call!23138)))

(assert (=> b!247297 (=> (not res!121219) (not e!160416))))

(declare-fun b!247298 () Bool)

(assert (=> b!247298 (= e!160417 (= (apply!234 lt!123913 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4412 thiss!1504)))))

(declare-fun c!41399 () Bool)

(declare-fun bm!23135 () Bool)

(declare-fun call!23135 () ListLongMap!3651)

(assert (=> bm!23135 (= call!23135 (+!661 (ite c!41397 call!23139 (ite c!41399 call!23140 call!23136)) (ite (or c!41397 c!41399) (tuple2!4737 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4412 thiss!1504)) (tuple2!4737 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4412 thiss!1504)))))))

(declare-fun b!247299 () Bool)

(assert (=> b!247299 (= e!160426 (validKeyInArray!0 (select (arr!5780 (_keys!6692 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!247300 () Bool)

(declare-fun e!160420 () ListLongMap!3651)

(assert (=> b!247300 (= e!160425 e!160420)))

(assert (=> b!247300 (= c!41399 (and (not (= (bvand (extraKeys!4308 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4308 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!247301 () Bool)

(assert (=> b!247301 (= e!160420 call!23134)))

(declare-fun bm!23136 () Bool)

(assert (=> bm!23136 (= call!23134 call!23135)))

(declare-fun bm!23137 () Bool)

(assert (=> bm!23137 (= call!23139 (getCurrentListMapNoExtraKeys!550 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)))))

(declare-fun b!247302 () Bool)

(assert (=> b!247302 (= e!160414 (not call!23137))))

(declare-fun b!247303 () Bool)

(assert (=> b!247303 (= e!160418 (not call!23138))))

(declare-fun b!247304 () Bool)

(declare-fun c!41400 () Bool)

(assert (=> b!247304 (= c!41400 (and (not (= (bvand (extraKeys!4308 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4308 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!247304 (= e!160420 e!160422)))

(declare-fun b!247305 () Bool)

(assert (=> b!247305 (= e!160423 (validKeyInArray!0 (select (arr!5780 (_keys!6692 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!247306 () Bool)

(assert (=> b!247306 (= e!160425 (+!661 call!23135 (tuple2!4737 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4412 thiss!1504))))))

(assert (= (and d!60519 c!41397) b!247306))

(assert (= (and d!60519 (not c!41397)) b!247300))

(assert (= (and b!247300 c!41399) b!247301))

(assert (= (and b!247300 (not c!41399)) b!247304))

(assert (= (and b!247304 c!41400) b!247287))

(assert (= (and b!247304 (not c!41400)) b!247292))

(assert (= (or b!247287 b!247292) bm!23133))

(assert (= (or b!247301 bm!23133) bm!23131))

(assert (= (or b!247301 b!247287) bm!23136))

(assert (= (or b!247306 bm!23131) bm!23137))

(assert (= (or b!247306 bm!23136) bm!23135))

(assert (= (and d!60519 res!121222) b!247305))

(assert (= (and d!60519 c!41401) b!247295))

(assert (= (and d!60519 (not c!41401)) b!247291))

(assert (= (and d!60519 res!121220) b!247296))

(assert (= (and b!247296 res!121218) b!247299))

(assert (= (and b!247296 (not res!121217)) b!247286))

(assert (= (and b!247286 res!121214) b!247294))

(assert (= (and b!247296 res!121221) b!247290))

(assert (= (and b!247290 c!41398) b!247297))

(assert (= (and b!247290 (not c!41398)) b!247303))

(assert (= (and b!247297 res!121219) b!247289))

(assert (= (or b!247297 b!247303) bm!23132))

(assert (= (and b!247290 res!121215) b!247288))

(assert (= (and b!247288 c!41396) b!247293))

(assert (= (and b!247288 (not c!41396)) b!247302))

(assert (= (and b!247293 res!121216) b!247298))

(assert (= (or b!247293 b!247302) bm!23134))

(declare-fun b_lambda!8069 () Bool)

(assert (=> (not b_lambda!8069) (not b!247294)))

(declare-fun t!8630 () Bool)

(declare-fun tb!2973 () Bool)

(assert (=> (and b!247081 (= (defaultEntry!4571 thiss!1504) (defaultEntry!4571 thiss!1504)) t!8630) tb!2973))

(declare-fun result!5257 () Bool)

(assert (=> tb!2973 (= result!5257 tp_is_empty!6439)))

(assert (=> b!247294 t!8630))

(declare-fun b_and!13597 () Bool)

(assert (= b_and!13591 (and (=> t!8630 result!5257) b_and!13597)))

(assert (=> d!60519 m!264417))

(declare-fun m!264559 () Bool)

(assert (=> b!247306 m!264559))

(declare-fun m!264561 () Bool)

(assert (=> bm!23134 m!264561))

(declare-fun m!264563 () Bool)

(assert (=> b!247286 m!264563))

(assert (=> b!247286 m!264563))

(declare-fun m!264565 () Bool)

(assert (=> b!247286 m!264565))

(declare-fun m!264567 () Bool)

(assert (=> bm!23137 m!264567))

(declare-fun m!264569 () Bool)

(assert (=> bm!23132 m!264569))

(assert (=> b!247305 m!264563))

(assert (=> b!247305 m!264563))

(declare-fun m!264571 () Bool)

(assert (=> b!247305 m!264571))

(declare-fun m!264573 () Bool)

(assert (=> b!247295 m!264573))

(assert (=> b!247295 m!264567))

(declare-fun m!264575 () Bool)

(assert (=> b!247295 m!264575))

(declare-fun m!264577 () Bool)

(assert (=> b!247295 m!264577))

(declare-fun m!264579 () Bool)

(assert (=> b!247295 m!264579))

(assert (=> b!247295 m!264573))

(declare-fun m!264581 () Bool)

(assert (=> b!247295 m!264581))

(declare-fun m!264583 () Bool)

(assert (=> b!247295 m!264583))

(assert (=> b!247295 m!264583))

(declare-fun m!264585 () Bool)

(assert (=> b!247295 m!264585))

(declare-fun m!264587 () Bool)

(assert (=> b!247295 m!264587))

(declare-fun m!264589 () Bool)

(assert (=> b!247295 m!264589))

(declare-fun m!264591 () Bool)

(assert (=> b!247295 m!264591))

(declare-fun m!264593 () Bool)

(assert (=> b!247295 m!264593))

(declare-fun m!264595 () Bool)

(assert (=> b!247295 m!264595))

(declare-fun m!264597 () Bool)

(assert (=> b!247295 m!264597))

(assert (=> b!247295 m!264589))

(declare-fun m!264599 () Bool)

(assert (=> b!247295 m!264599))

(assert (=> b!247295 m!264591))

(declare-fun m!264601 () Bool)

(assert (=> b!247295 m!264601))

(assert (=> b!247295 m!264563))

(assert (=> b!247294 m!264563))

(declare-fun m!264603 () Bool)

(assert (=> b!247294 m!264603))

(declare-fun m!264605 () Bool)

(assert (=> b!247294 m!264605))

(declare-fun m!264607 () Bool)

(assert (=> b!247294 m!264607))

(declare-fun m!264609 () Bool)

(assert (=> b!247294 m!264609))

(assert (=> b!247294 m!264607))

(assert (=> b!247294 m!264605))

(assert (=> b!247294 m!264563))

(declare-fun m!264611 () Bool)

(assert (=> bm!23135 m!264611))

(assert (=> b!247299 m!264563))

(assert (=> b!247299 m!264563))

(assert (=> b!247299 m!264571))

(declare-fun m!264613 () Bool)

(assert (=> b!247298 m!264613))

(declare-fun m!264615 () Bool)

(assert (=> b!247289 m!264615))

(assert (=> b!247084 d!60519))

(declare-fun d!60521 () Bool)

(declare-fun res!121227 () Bool)

(declare-fun e!160431 () Bool)

(assert (=> d!60521 (=> res!121227 e!160431)))

(assert (=> d!60521 (= res!121227 (= (select (arr!5780 (_keys!6692 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60521 (= (arrayContainsKey!0 (_keys!6692 thiss!1504) key!932 #b00000000000000000000000000000000) e!160431)))

(declare-fun b!247313 () Bool)

(declare-fun e!160432 () Bool)

(assert (=> b!247313 (= e!160431 e!160432)))

(declare-fun res!121228 () Bool)

(assert (=> b!247313 (=> (not res!121228) (not e!160432))))

(assert (=> b!247313 (= res!121228 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6123 (_keys!6692 thiss!1504))))))

(declare-fun b!247314 () Bool)

(assert (=> b!247314 (= e!160432 (arrayContainsKey!0 (_keys!6692 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60521 (not res!121227)) b!247313))

(assert (= (and b!247313 res!121228) b!247314))

(assert (=> d!60521 m!264563))

(declare-fun m!264617 () Bool)

(assert (=> b!247314 m!264617))

(assert (=> bm!23103 d!60521))

(declare-fun d!60523 () Bool)

(assert (=> d!60523 (= (array_inv!3803 (_keys!6692 thiss!1504)) (bvsge (size!6123 (_keys!6692 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!247081 d!60523))

(declare-fun d!60525 () Bool)

(assert (=> d!60525 (= (array_inv!3804 (_values!4554 thiss!1504)) (bvsge (size!6122 (_values!4554 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!247081 d!60525))

(declare-fun d!60527 () Bool)

(assert (=> d!60527 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!247076 d!60527))

(declare-fun b!247327 () Bool)

(declare-fun e!160441 () SeekEntryResult!1065)

(assert (=> b!247327 (= e!160441 Undefined!1065)))

(declare-fun b!247328 () Bool)

(declare-fun c!41410 () Bool)

(declare-fun lt!123940 () (_ BitVec 64))

(assert (=> b!247328 (= c!41410 (= lt!123940 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!160439 () SeekEntryResult!1065)

(declare-fun e!160440 () SeekEntryResult!1065)

(assert (=> b!247328 (= e!160439 e!160440)))

(declare-fun b!247329 () Bool)

(declare-fun lt!123938 () SeekEntryResult!1065)

(assert (=> b!247329 (= e!160439 (Found!1065 (index!6432 lt!123938)))))

(declare-fun b!247330 () Bool)

(assert (=> b!247330 (= e!160441 e!160439)))

(assert (=> b!247330 (= lt!123940 (select (arr!5780 (_keys!6692 thiss!1504)) (index!6432 lt!123938)))))

(declare-fun c!41409 () Bool)

(assert (=> b!247330 (= c!41409 (= lt!123940 key!932))))

(declare-fun b!247331 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12183 (_ BitVec 32)) SeekEntryResult!1065)

(assert (=> b!247331 (= e!160440 (seekKeyOrZeroReturnVacant!0 (x!24475 lt!123938) (index!6432 lt!123938) (index!6432 lt!123938) key!932 (_keys!6692 thiss!1504) (mask!10704 thiss!1504)))))

(declare-fun d!60529 () Bool)

(declare-fun lt!123939 () SeekEntryResult!1065)

(assert (=> d!60529 (and (or ((_ is Undefined!1065) lt!123939) (not ((_ is Found!1065) lt!123939)) (and (bvsge (index!6431 lt!123939) #b00000000000000000000000000000000) (bvslt (index!6431 lt!123939) (size!6123 (_keys!6692 thiss!1504))))) (or ((_ is Undefined!1065) lt!123939) ((_ is Found!1065) lt!123939) (not ((_ is MissingZero!1065) lt!123939)) (and (bvsge (index!6430 lt!123939) #b00000000000000000000000000000000) (bvslt (index!6430 lt!123939) (size!6123 (_keys!6692 thiss!1504))))) (or ((_ is Undefined!1065) lt!123939) ((_ is Found!1065) lt!123939) ((_ is MissingZero!1065) lt!123939) (not ((_ is MissingVacant!1065) lt!123939)) (and (bvsge (index!6433 lt!123939) #b00000000000000000000000000000000) (bvslt (index!6433 lt!123939) (size!6123 (_keys!6692 thiss!1504))))) (or ((_ is Undefined!1065) lt!123939) (ite ((_ is Found!1065) lt!123939) (= (select (arr!5780 (_keys!6692 thiss!1504)) (index!6431 lt!123939)) key!932) (ite ((_ is MissingZero!1065) lt!123939) (= (select (arr!5780 (_keys!6692 thiss!1504)) (index!6430 lt!123939)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1065) lt!123939) (= (select (arr!5780 (_keys!6692 thiss!1504)) (index!6433 lt!123939)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60529 (= lt!123939 e!160441)))

(declare-fun c!41408 () Bool)

(assert (=> d!60529 (= c!41408 (and ((_ is Intermediate!1065) lt!123938) (undefined!1877 lt!123938)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12183 (_ BitVec 32)) SeekEntryResult!1065)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60529 (= lt!123938 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10704 thiss!1504)) key!932 (_keys!6692 thiss!1504) (mask!10704 thiss!1504)))))

(assert (=> d!60529 (validMask!0 (mask!10704 thiss!1504))))

(assert (=> d!60529 (= (seekEntryOrOpen!0 key!932 (_keys!6692 thiss!1504) (mask!10704 thiss!1504)) lt!123939)))

(declare-fun b!247332 () Bool)

(assert (=> b!247332 (= e!160440 (MissingZero!1065 (index!6432 lt!123938)))))

(assert (= (and d!60529 c!41408) b!247327))

(assert (= (and d!60529 (not c!41408)) b!247330))

(assert (= (and b!247330 c!41409) b!247329))

(assert (= (and b!247330 (not c!41409)) b!247328))

(assert (= (and b!247328 c!41410) b!247332))

(assert (= (and b!247328 (not c!41410)) b!247331))

(declare-fun m!264619 () Bool)

(assert (=> b!247330 m!264619))

(declare-fun m!264621 () Bool)

(assert (=> b!247331 m!264621))

(declare-fun m!264623 () Bool)

(assert (=> d!60529 m!264623))

(declare-fun m!264625 () Bool)

(assert (=> d!60529 m!264625))

(assert (=> d!60529 m!264417))

(declare-fun m!264627 () Bool)

(assert (=> d!60529 m!264627))

(assert (=> d!60529 m!264627))

(declare-fun m!264629 () Bool)

(assert (=> d!60529 m!264629))

(declare-fun m!264631 () Bool)

(assert (=> d!60529 m!264631))

(assert (=> b!247090 d!60529))

(declare-fun b!247349 () Bool)

(declare-fun res!121239 () Bool)

(declare-fun e!160453 () Bool)

(assert (=> b!247349 (=> (not res!121239) (not e!160453))))

(declare-fun call!23146 () Bool)

(assert (=> b!247349 (= res!121239 call!23146)))

(declare-fun e!160451 () Bool)

(assert (=> b!247349 (= e!160451 e!160453)))

(declare-fun bm!23142 () Bool)

(declare-fun c!41416 () Bool)

(declare-fun lt!123946 () SeekEntryResult!1065)

(assert (=> bm!23142 (= call!23146 (inRange!0 (ite c!41416 (index!6430 lt!123946) (index!6433 lt!123946)) (mask!10704 thiss!1504)))))

(declare-fun b!247350 () Bool)

(declare-fun res!121238 () Bool)

(assert (=> b!247350 (=> (not res!121238) (not e!160453))))

(assert (=> b!247350 (= res!121238 (= (select (arr!5780 (_keys!6692 thiss!1504)) (index!6433 lt!123946)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!247350 (and (bvsge (index!6433 lt!123946) #b00000000000000000000000000000000) (bvslt (index!6433 lt!123946) (size!6123 (_keys!6692 thiss!1504))))))

(declare-fun b!247351 () Bool)

(assert (=> b!247351 (and (bvsge (index!6430 lt!123946) #b00000000000000000000000000000000) (bvslt (index!6430 lt!123946) (size!6123 (_keys!6692 thiss!1504))))))

(declare-fun res!121237 () Bool)

(assert (=> b!247351 (= res!121237 (= (select (arr!5780 (_keys!6692 thiss!1504)) (index!6430 lt!123946)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!160450 () Bool)

(assert (=> b!247351 (=> (not res!121237) (not e!160450))))

(declare-fun b!247352 () Bool)

(declare-fun call!23145 () Bool)

(assert (=> b!247352 (= e!160453 (not call!23145))))

(declare-fun b!247353 () Bool)

(assert (=> b!247353 (= e!160451 ((_ is Undefined!1065) lt!123946))))

(declare-fun bm!23143 () Bool)

(assert (=> bm!23143 (= call!23145 (arrayContainsKey!0 (_keys!6692 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247354 () Bool)

(declare-fun e!160452 () Bool)

(assert (=> b!247354 (= e!160452 e!160451)))

(declare-fun c!41415 () Bool)

(assert (=> b!247354 (= c!41415 ((_ is MissingVacant!1065) lt!123946))))

(declare-fun b!247355 () Bool)

(assert (=> b!247355 (= e!160450 (not call!23145))))

(declare-fun b!247356 () Bool)

(assert (=> b!247356 (= e!160452 e!160450)))

(declare-fun res!121240 () Bool)

(assert (=> b!247356 (= res!121240 call!23146)))

(assert (=> b!247356 (=> (not res!121240) (not e!160450))))

(declare-fun d!60531 () Bool)

(assert (=> d!60531 e!160452))

(assert (=> d!60531 (= c!41416 ((_ is MissingZero!1065) lt!123946))))

(assert (=> d!60531 (= lt!123946 (seekEntryOrOpen!0 key!932 (_keys!6692 thiss!1504) (mask!10704 thiss!1504)))))

(declare-fun lt!123945 () Unit!7613)

(declare-fun choose!1169 (array!12183 array!12181 (_ BitVec 32) (_ BitVec 32) V!8233 V!8233 (_ BitVec 64) Int) Unit!7613)

(assert (=> d!60531 (= lt!123945 (choose!1169 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) key!932 (defaultEntry!4571 thiss!1504)))))

(assert (=> d!60531 (validMask!0 (mask!10704 thiss!1504))))

(assert (=> d!60531 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!371 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) key!932 (defaultEntry!4571 thiss!1504)) lt!123945)))

(assert (= (and d!60531 c!41416) b!247356))

(assert (= (and d!60531 (not c!41416)) b!247354))

(assert (= (and b!247356 res!121240) b!247351))

(assert (= (and b!247351 res!121237) b!247355))

(assert (= (and b!247354 c!41415) b!247349))

(assert (= (and b!247354 (not c!41415)) b!247353))

(assert (= (and b!247349 res!121239) b!247350))

(assert (= (and b!247350 res!121238) b!247352))

(assert (= (or b!247356 b!247349) bm!23142))

(assert (= (or b!247355 b!247352) bm!23143))

(declare-fun m!264633 () Bool)

(assert (=> b!247351 m!264633))

(assert (=> bm!23143 m!264419))

(declare-fun m!264635 () Bool)

(assert (=> bm!23142 m!264635))

(declare-fun m!264637 () Bool)

(assert (=> b!247350 m!264637))

(assert (=> d!60531 m!264415))

(declare-fun m!264639 () Bool)

(assert (=> d!60531 m!264639))

(assert (=> d!60531 m!264417))

(assert (=> b!247077 d!60531))

(declare-fun d!60533 () Bool)

(assert (=> d!60533 (= (inRange!0 (ite c!41353 (index!6430 lt!123789) (index!6433 lt!123789)) (mask!10704 thiss!1504)) (and (bvsge (ite c!41353 (index!6430 lt!123789) (index!6433 lt!123789)) #b00000000000000000000000000000000) (bvslt (ite c!41353 (index!6430 lt!123789) (index!6433 lt!123789)) (bvadd (mask!10704 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23104 d!60533))

(declare-fun d!60535 () Bool)

(assert (=> d!60535 (contains!1770 (getCurrentListMap!1373 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)) key!932)))

(declare-fun lt!123949 () Unit!7613)

(declare-fun choose!1170 (array!12183 array!12181 (_ BitVec 32) (_ BitVec 32) V!8233 V!8233 (_ BitVec 64) (_ BitVec 32) Int) Unit!7613)

(assert (=> d!60535 (= lt!123949 (choose!1170 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)))))

(assert (=> d!60535 (validMask!0 (mask!10704 thiss!1504))))

(assert (=> d!60535 (= (lemmaArrayContainsKeyThenInListMap!195 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)) lt!123949)))

(declare-fun bs!8940 () Bool)

(assert (= bs!8940 d!60535))

(assert (=> bs!8940 m!264409))

(assert (=> bs!8940 m!264409))

(assert (=> bs!8940 m!264411))

(declare-fun m!264641 () Bool)

(assert (=> bs!8940 m!264641))

(assert (=> bs!8940 m!264417))

(assert (=> b!247078 d!60535))

(declare-fun b!247366 () Bool)

(declare-fun res!121249 () Bool)

(declare-fun e!160458 () Bool)

(assert (=> b!247366 (=> (not res!121249) (not e!160458))))

(assert (=> b!247366 (= res!121249 (validKeyInArray!0 key!932))))

(declare-fun b!247367 () Bool)

(assert (=> b!247367 (= e!160458 (bvslt (size!6123 (_keys!6692 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun d!60537 () Bool)

(declare-fun e!160459 () Bool)

(assert (=> d!60537 e!160459))

(declare-fun res!121250 () Bool)

(assert (=> d!60537 (=> (not res!121250) (not e!160459))))

(assert (=> d!60537 (= res!121250 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6123 (_keys!6692 thiss!1504)))))))

(declare-fun lt!123952 () Unit!7613)

(declare-fun choose!1 (array!12183 (_ BitVec 32) (_ BitVec 64)) Unit!7613)

(assert (=> d!60537 (= lt!123952 (choose!1 (_keys!6692 thiss!1504) index!297 key!932))))

(assert (=> d!60537 e!160458))

(declare-fun res!121252 () Bool)

(assert (=> d!60537 (=> (not res!121252) (not e!160458))))

(assert (=> d!60537 (= res!121252 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6123 (_keys!6692 thiss!1504)))))))

(assert (=> d!60537 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6692 thiss!1504) index!297 key!932) lt!123952)))

(declare-fun b!247368 () Bool)

(assert (=> b!247368 (= e!160459 (= (arrayCountValidKeys!0 (array!12184 (store (arr!5780 (_keys!6692 thiss!1504)) index!297 key!932) (size!6123 (_keys!6692 thiss!1504))) #b00000000000000000000000000000000 (size!6123 (_keys!6692 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6692 thiss!1504) #b00000000000000000000000000000000 (size!6123 (_keys!6692 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!247365 () Bool)

(declare-fun res!121251 () Bool)

(assert (=> b!247365 (=> (not res!121251) (not e!160458))))

(assert (=> b!247365 (= res!121251 (not (validKeyInArray!0 (select (arr!5780 (_keys!6692 thiss!1504)) index!297))))))

(assert (= (and d!60537 res!121252) b!247365))

(assert (= (and b!247365 res!121251) b!247366))

(assert (= (and b!247366 res!121249) b!247367))

(assert (= (and d!60537 res!121250) b!247368))

(assert (=> b!247366 m!264447))

(declare-fun m!264643 () Bool)

(assert (=> d!60537 m!264643))

(assert (=> b!247368 m!264425))

(declare-fun m!264645 () Bool)

(assert (=> b!247368 m!264645))

(assert (=> b!247368 m!264427))

(declare-fun m!264647 () Bool)

(assert (=> b!247365 m!264647))

(assert (=> b!247365 m!264647))

(declare-fun m!264649 () Bool)

(assert (=> b!247365 m!264649))

(assert (=> b!247083 d!60537))

(assert (=> b!247083 d!60521))

(declare-fun b!247377 () Bool)

(declare-fun e!160465 () (_ BitVec 32))

(declare-fun call!23149 () (_ BitVec 32))

(assert (=> b!247377 (= e!160465 (bvadd #b00000000000000000000000000000001 call!23149))))

(declare-fun b!247378 () Bool)

(declare-fun e!160464 () (_ BitVec 32))

(assert (=> b!247378 (= e!160464 e!160465)))

(declare-fun c!41421 () Bool)

(assert (=> b!247378 (= c!41421 (validKeyInArray!0 (select (arr!5780 (_keys!6692 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23146 () Bool)

(assert (=> bm!23146 (= call!23149 (arrayCountValidKeys!0 (_keys!6692 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6123 (_keys!6692 thiss!1504))))))

(declare-fun b!247379 () Bool)

(assert (=> b!247379 (= e!160465 call!23149)))

(declare-fun d!60539 () Bool)

(declare-fun lt!123955 () (_ BitVec 32))

(assert (=> d!60539 (and (bvsge lt!123955 #b00000000000000000000000000000000) (bvsle lt!123955 (bvsub (size!6123 (_keys!6692 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60539 (= lt!123955 e!160464)))

(declare-fun c!41422 () Bool)

(assert (=> d!60539 (= c!41422 (bvsge #b00000000000000000000000000000000 (size!6123 (_keys!6692 thiss!1504))))))

(assert (=> d!60539 (and (bvsle #b00000000000000000000000000000000 (size!6123 (_keys!6692 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6123 (_keys!6692 thiss!1504)) (size!6123 (_keys!6692 thiss!1504))))))

(assert (=> d!60539 (= (arrayCountValidKeys!0 (_keys!6692 thiss!1504) #b00000000000000000000000000000000 (size!6123 (_keys!6692 thiss!1504))) lt!123955)))

(declare-fun b!247380 () Bool)

(assert (=> b!247380 (= e!160464 #b00000000000000000000000000000000)))

(assert (= (and d!60539 c!41422) b!247380))

(assert (= (and d!60539 (not c!41422)) b!247378))

(assert (= (and b!247378 c!41421) b!247377))

(assert (= (and b!247378 (not c!41421)) b!247379))

(assert (= (or b!247377 b!247379) bm!23146))

(assert (=> b!247378 m!264563))

(assert (=> b!247378 m!264563))

(assert (=> b!247378 m!264571))

(declare-fun m!264651 () Bool)

(assert (=> bm!23146 m!264651))

(assert (=> b!247083 d!60539))

(declare-fun d!60541 () Bool)

(assert (=> d!60541 (= (validMask!0 (mask!10704 thiss!1504)) (and (or (= (mask!10704 thiss!1504) #b00000000000000000000000000000111) (= (mask!10704 thiss!1504) #b00000000000000000000000000001111) (= (mask!10704 thiss!1504) #b00000000000000000000000000011111) (= (mask!10704 thiss!1504) #b00000000000000000000000000111111) (= (mask!10704 thiss!1504) #b00000000000000000000000001111111) (= (mask!10704 thiss!1504) #b00000000000000000000000011111111) (= (mask!10704 thiss!1504) #b00000000000000000000000111111111) (= (mask!10704 thiss!1504) #b00000000000000000000001111111111) (= (mask!10704 thiss!1504) #b00000000000000000000011111111111) (= (mask!10704 thiss!1504) #b00000000000000000000111111111111) (= (mask!10704 thiss!1504) #b00000000000000000001111111111111) (= (mask!10704 thiss!1504) #b00000000000000000011111111111111) (= (mask!10704 thiss!1504) #b00000000000000000111111111111111) (= (mask!10704 thiss!1504) #b00000000000000001111111111111111) (= (mask!10704 thiss!1504) #b00000000000000011111111111111111) (= (mask!10704 thiss!1504) #b00000000000000111111111111111111) (= (mask!10704 thiss!1504) #b00000000000001111111111111111111) (= (mask!10704 thiss!1504) #b00000000000011111111111111111111) (= (mask!10704 thiss!1504) #b00000000000111111111111111111111) (= (mask!10704 thiss!1504) #b00000000001111111111111111111111) (= (mask!10704 thiss!1504) #b00000000011111111111111111111111) (= (mask!10704 thiss!1504) #b00000000111111111111111111111111) (= (mask!10704 thiss!1504) #b00000001111111111111111111111111) (= (mask!10704 thiss!1504) #b00000011111111111111111111111111) (= (mask!10704 thiss!1504) #b00000111111111111111111111111111) (= (mask!10704 thiss!1504) #b00001111111111111111111111111111) (= (mask!10704 thiss!1504) #b00011111111111111111111111111111) (= (mask!10704 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10704 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!247083 d!60541))

(declare-fun d!60543 () Bool)

(declare-fun e!160468 () Bool)

(assert (=> d!60543 e!160468))

(declare-fun res!121255 () Bool)

(assert (=> d!60543 (=> (not res!121255) (not e!160468))))

(assert (=> d!60543 (= res!121255 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6123 (_keys!6692 thiss!1504)))))))

(declare-fun lt!123958 () Unit!7613)

(declare-fun choose!41 (array!12183 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3611) Unit!7613)

(assert (=> d!60543 (= lt!123958 (choose!41 (_keys!6692 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3608))))

(assert (=> d!60543 (bvslt (size!6123 (_keys!6692 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60543 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6692 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3608) lt!123958)))

(declare-fun b!247383 () Bool)

(assert (=> b!247383 (= e!160468 (arrayNoDuplicates!0 (array!12184 (store (arr!5780 (_keys!6692 thiss!1504)) index!297 key!932) (size!6123 (_keys!6692 thiss!1504))) #b00000000000000000000000000000000 Nil!3608))))

(assert (= (and d!60543 res!121255) b!247383))

(declare-fun m!264653 () Bool)

(assert (=> d!60543 m!264653))

(assert (=> b!247383 m!264425))

(declare-fun m!264655 () Bool)

(assert (=> b!247383 m!264655))

(assert (=> b!247083 d!60543))

(declare-fun b!247394 () Bool)

(declare-fun e!160477 () Bool)

(declare-fun contains!1772 (List!3611 (_ BitVec 64)) Bool)

(assert (=> b!247394 (= e!160477 (contains!1772 Nil!3608 (select (arr!5780 lt!123791) #b00000000000000000000000000000000)))))

(declare-fun d!60545 () Bool)

(declare-fun res!121262 () Bool)

(declare-fun e!160480 () Bool)

(assert (=> d!60545 (=> res!121262 e!160480)))

(assert (=> d!60545 (= res!121262 (bvsge #b00000000000000000000000000000000 (size!6123 lt!123791)))))

(assert (=> d!60545 (= (arrayNoDuplicates!0 lt!123791 #b00000000000000000000000000000000 Nil!3608) e!160480)))

(declare-fun bm!23149 () Bool)

(declare-fun call!23152 () Bool)

(declare-fun c!41425 () Bool)

(assert (=> bm!23149 (= call!23152 (arrayNoDuplicates!0 lt!123791 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41425 (Cons!3607 (select (arr!5780 lt!123791) #b00000000000000000000000000000000) Nil!3608) Nil!3608)))))

(declare-fun b!247395 () Bool)

(declare-fun e!160479 () Bool)

(assert (=> b!247395 (= e!160479 call!23152)))

(declare-fun b!247396 () Bool)

(declare-fun e!160478 () Bool)

(assert (=> b!247396 (= e!160480 e!160478)))

(declare-fun res!121263 () Bool)

(assert (=> b!247396 (=> (not res!121263) (not e!160478))))

(assert (=> b!247396 (= res!121263 (not e!160477))))

(declare-fun res!121264 () Bool)

(assert (=> b!247396 (=> (not res!121264) (not e!160477))))

(assert (=> b!247396 (= res!121264 (validKeyInArray!0 (select (arr!5780 lt!123791) #b00000000000000000000000000000000)))))

(declare-fun b!247397 () Bool)

(assert (=> b!247397 (= e!160478 e!160479)))

(assert (=> b!247397 (= c!41425 (validKeyInArray!0 (select (arr!5780 lt!123791) #b00000000000000000000000000000000)))))

(declare-fun b!247398 () Bool)

(assert (=> b!247398 (= e!160479 call!23152)))

(assert (= (and d!60545 (not res!121262)) b!247396))

(assert (= (and b!247396 res!121264) b!247394))

(assert (= (and b!247396 res!121263) b!247397))

(assert (= (and b!247397 c!41425) b!247398))

(assert (= (and b!247397 (not c!41425)) b!247395))

(assert (= (or b!247398 b!247395) bm!23149))

(declare-fun m!264657 () Bool)

(assert (=> b!247394 m!264657))

(assert (=> b!247394 m!264657))

(declare-fun m!264659 () Bool)

(assert (=> b!247394 m!264659))

(assert (=> bm!23149 m!264657))

(declare-fun m!264661 () Bool)

(assert (=> bm!23149 m!264661))

(assert (=> b!247396 m!264657))

(assert (=> b!247396 m!264657))

(declare-fun m!264663 () Bool)

(assert (=> b!247396 m!264663))

(assert (=> b!247397 m!264657))

(assert (=> b!247397 m!264657))

(assert (=> b!247397 m!264663))

(assert (=> b!247083 d!60545))

(declare-fun b!247399 () Bool)

(declare-fun e!160482 () (_ BitVec 32))

(declare-fun call!23153 () (_ BitVec 32))

(assert (=> b!247399 (= e!160482 (bvadd #b00000000000000000000000000000001 call!23153))))

(declare-fun b!247400 () Bool)

(declare-fun e!160481 () (_ BitVec 32))

(assert (=> b!247400 (= e!160481 e!160482)))

(declare-fun c!41426 () Bool)

(assert (=> b!247400 (= c!41426 (validKeyInArray!0 (select (arr!5780 lt!123791) #b00000000000000000000000000000000)))))

(declare-fun bm!23150 () Bool)

(assert (=> bm!23150 (= call!23153 (arrayCountValidKeys!0 lt!123791 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6123 (_keys!6692 thiss!1504))))))

(declare-fun b!247401 () Bool)

(assert (=> b!247401 (= e!160482 call!23153)))

(declare-fun d!60547 () Bool)

(declare-fun lt!123959 () (_ BitVec 32))

(assert (=> d!60547 (and (bvsge lt!123959 #b00000000000000000000000000000000) (bvsle lt!123959 (bvsub (size!6123 lt!123791) #b00000000000000000000000000000000)))))

(assert (=> d!60547 (= lt!123959 e!160481)))

(declare-fun c!41427 () Bool)

(assert (=> d!60547 (= c!41427 (bvsge #b00000000000000000000000000000000 (size!6123 (_keys!6692 thiss!1504))))))

(assert (=> d!60547 (and (bvsle #b00000000000000000000000000000000 (size!6123 (_keys!6692 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6123 (_keys!6692 thiss!1504)) (size!6123 lt!123791)))))

(assert (=> d!60547 (= (arrayCountValidKeys!0 lt!123791 #b00000000000000000000000000000000 (size!6123 (_keys!6692 thiss!1504))) lt!123959)))

(declare-fun b!247402 () Bool)

(assert (=> b!247402 (= e!160481 #b00000000000000000000000000000000)))

(assert (= (and d!60547 c!41427) b!247402))

(assert (= (and d!60547 (not c!41427)) b!247400))

(assert (= (and b!247400 c!41426) b!247399))

(assert (= (and b!247400 (not c!41426)) b!247401))

(assert (= (or b!247399 b!247401) bm!23150))

(assert (=> b!247400 m!264657))

(assert (=> b!247400 m!264657))

(assert (=> b!247400 m!264663))

(declare-fun m!264665 () Bool)

(assert (=> bm!23150 m!264665))

(assert (=> b!247083 d!60547))

(declare-fun d!60549 () Bool)

(declare-fun res!121271 () Bool)

(declare-fun e!160485 () Bool)

(assert (=> d!60549 (=> (not res!121271) (not e!160485))))

(declare-fun simpleValid!257 (LongMapFixedSize!3652) Bool)

(assert (=> d!60549 (= res!121271 (simpleValid!257 thiss!1504))))

(assert (=> d!60549 (= (valid!1441 thiss!1504) e!160485)))

(declare-fun b!247409 () Bool)

(declare-fun res!121272 () Bool)

(assert (=> b!247409 (=> (not res!121272) (not e!160485))))

(assert (=> b!247409 (= res!121272 (= (arrayCountValidKeys!0 (_keys!6692 thiss!1504) #b00000000000000000000000000000000 (size!6123 (_keys!6692 thiss!1504))) (_size!1875 thiss!1504)))))

(declare-fun b!247410 () Bool)

(declare-fun res!121273 () Bool)

(assert (=> b!247410 (=> (not res!121273) (not e!160485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12183 (_ BitVec 32)) Bool)

(assert (=> b!247410 (= res!121273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6692 thiss!1504) (mask!10704 thiss!1504)))))

(declare-fun b!247411 () Bool)

(assert (=> b!247411 (= e!160485 (arrayNoDuplicates!0 (_keys!6692 thiss!1504) #b00000000000000000000000000000000 Nil!3608))))

(assert (= (and d!60549 res!121271) b!247409))

(assert (= (and b!247409 res!121272) b!247410))

(assert (= (and b!247410 res!121273) b!247411))

(declare-fun m!264667 () Bool)

(assert (=> d!60549 m!264667))

(assert (=> b!247409 m!264427))

(declare-fun m!264669 () Bool)

(assert (=> b!247410 m!264669))

(declare-fun m!264671 () Bool)

(assert (=> b!247411 m!264671))

(assert (=> start!23528 d!60549))

(declare-fun mapNonEmpty!10940 () Bool)

(declare-fun mapRes!10940 () Bool)

(declare-fun tp!22991 () Bool)

(declare-fun e!160491 () Bool)

(assert (=> mapNonEmpty!10940 (= mapRes!10940 (and tp!22991 e!160491))))

(declare-fun mapRest!10940 () (Array (_ BitVec 32) ValueCell!2876))

(declare-fun mapKey!10940 () (_ BitVec 32))

(declare-fun mapValue!10940 () ValueCell!2876)

(assert (=> mapNonEmpty!10940 (= mapRest!10931 (store mapRest!10940 mapKey!10940 mapValue!10940))))

(declare-fun b!247419 () Bool)

(declare-fun e!160490 () Bool)

(assert (=> b!247419 (= e!160490 tp_is_empty!6439)))

(declare-fun condMapEmpty!10940 () Bool)

(declare-fun mapDefault!10940 () ValueCell!2876)

(assert (=> mapNonEmpty!10931 (= condMapEmpty!10940 (= mapRest!10931 ((as const (Array (_ BitVec 32) ValueCell!2876)) mapDefault!10940)))))

(assert (=> mapNonEmpty!10931 (= tp!22976 (and e!160490 mapRes!10940))))

(declare-fun mapIsEmpty!10940 () Bool)

(assert (=> mapIsEmpty!10940 mapRes!10940))

(declare-fun b!247418 () Bool)

(assert (=> b!247418 (= e!160491 tp_is_empty!6439)))

(assert (= (and mapNonEmpty!10931 condMapEmpty!10940) mapIsEmpty!10940))

(assert (= (and mapNonEmpty!10931 (not condMapEmpty!10940)) mapNonEmpty!10940))

(assert (= (and mapNonEmpty!10940 ((_ is ValueCellFull!2876) mapValue!10940)) b!247418))

(assert (= (and mapNonEmpty!10931 ((_ is ValueCellFull!2876) mapDefault!10940)) b!247419))

(declare-fun m!264673 () Bool)

(assert (=> mapNonEmpty!10940 m!264673))

(declare-fun b_lambda!8071 () Bool)

(assert (= b_lambda!8069 (or (and b!247081 b_free!6577) b_lambda!8071)))

(check-sat (not b!247365) (not bm!23134) tp_is_empty!6439 (not b!247378) (not b!247368) (not bm!23142) (not d!60517) (not b!247305) (not b!247294) (not b!247331) (not b!247295) (not b_lambda!8071) (not d!60549) (not bm!23149) (not d!60529) (not d!60543) (not b!247410) (not bm!23146) (not d!60513) (not d!60535) (not b!247306) (not b!247286) (not b!247396) (not b!247243) (not b!247411) (not b!247233) (not mapNonEmpty!10940) (not b!247397) (not d!60537) (not b!247383) (not b_next!6577) (not b!247241) (not bm!23137) (not d!60531) (not bm!23132) (not b!247366) (not b!247400) b_and!13597 (not d!60519) (not b!247299) (not b!247314) (not bm!23143) (not b!247298) (not bm!23150) (not b!247409) (not b!247394) (not b!247289) (not bm!23135))
(check-sat b_and!13597 (not b_next!6577))
