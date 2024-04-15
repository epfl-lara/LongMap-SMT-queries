; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23216 () Bool)

(assert start!23216)

(declare-fun b!243385 () Bool)

(declare-fun b_free!6523 () Bool)

(declare-fun b_next!6523 () Bool)

(assert (=> b!243385 (= b_free!6523 (not b_next!6523))))

(declare-fun tp!22792 () Bool)

(declare-fun b_and!13479 () Bool)

(assert (=> b!243385 (= tp!22792 b_and!13479)))

(declare-fun b!243364 () Bool)

(declare-fun e!157929 () Bool)

(declare-fun e!157939 () Bool)

(assert (=> b!243364 (= e!157929 e!157939)))

(declare-fun res!119261 () Bool)

(assert (=> b!243364 (=> (not res!119261) (not e!157939))))

(declare-datatypes ((SeekEntryResult!1071 0))(
  ( (MissingZero!1071 (index!6454 (_ BitVec 32))) (Found!1071 (index!6455 (_ BitVec 32))) (Intermediate!1071 (undefined!1883 Bool) (index!6456 (_ BitVec 32)) (x!24330 (_ BitVec 32))) (Undefined!1071) (MissingVacant!1071 (index!6457 (_ BitVec 32))) )
))
(declare-fun lt!122035 () SeekEntryResult!1071)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!243364 (= res!119261 (or (= lt!122035 (MissingZero!1071 index!297)) (= lt!122035 (MissingVacant!1071 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!8161 0))(
  ( (V!8162 (val!3237 Int)) )
))
(declare-datatypes ((ValueCell!2849 0))(
  ( (ValueCellFull!2849 (v!5278 V!8161)) (EmptyCell!2849) )
))
(declare-datatypes ((array!12053 0))(
  ( (array!12054 (arr!5721 (Array (_ BitVec 32) ValueCell!2849)) (size!6064 (_ BitVec 32))) )
))
(declare-datatypes ((array!12055 0))(
  ( (array!12056 (arr!5722 (Array (_ BitVec 32) (_ BitVec 64))) (size!6065 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3598 0))(
  ( (LongMapFixedSize!3599 (defaultEntry!4512 Int) (mask!10604 (_ BitVec 32)) (extraKeys!4249 (_ BitVec 32)) (zeroValue!4353 V!8161) (minValue!4353 V!8161) (_size!1848 (_ BitVec 32)) (_keys!6622 array!12055) (_values!4495 array!12053) (_vacant!1848 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3598)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12055 (_ BitVec 32)) SeekEntryResult!1071)

(assert (=> b!243364 (= lt!122035 (seekEntryOrOpen!0 key!932 (_keys!6622 thiss!1504) (mask!10604 thiss!1504)))))

(declare-fun b!243365 () Bool)

(declare-fun res!119274 () Bool)

(declare-fun e!157933 () Bool)

(assert (=> b!243365 (=> (not res!119274) (not e!157933))))

(declare-datatypes ((List!3631 0))(
  ( (Nil!3628) (Cons!3627 (h!4284 (_ BitVec 64)) (t!8629 List!3631)) )
))
(declare-fun contains!1733 (List!3631 (_ BitVec 64)) Bool)

(assert (=> b!243365 (= res!119274 (not (contains!1733 Nil!3628 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!243366 () Bool)

(declare-fun e!157943 () Bool)

(declare-fun e!157944 () Bool)

(assert (=> b!243366 (= e!157943 e!157944)))

(declare-fun res!119269 () Bool)

(declare-fun call!22688 () Bool)

(assert (=> b!243366 (= res!119269 call!22688)))

(assert (=> b!243366 (=> (not res!119269) (not e!157944))))

(declare-fun bm!22685 () Bool)

(declare-fun call!22689 () Bool)

(declare-fun arrayContainsKey!0 (array!12055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22685 (= call!22689 (arrayContainsKey!0 (_keys!6622 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243367 () Bool)

(declare-fun res!119266 () Bool)

(declare-fun e!157932 () Bool)

(assert (=> b!243367 (=> (not res!119266) (not e!157932))))

(assert (=> b!243367 (= res!119266 call!22688)))

(declare-fun e!157927 () Bool)

(assert (=> b!243367 (= e!157927 e!157932)))

(declare-fun b!243368 () Bool)

(declare-fun res!119270 () Bool)

(assert (=> b!243368 (=> (not res!119270) (not e!157933))))

(declare-fun e!157941 () Bool)

(assert (=> b!243368 (= res!119270 e!157941)))

(declare-fun res!119271 () Bool)

(assert (=> b!243368 (=> res!119271 e!157941)))

(declare-fun e!157935 () Bool)

(assert (=> b!243368 (= res!119271 e!157935)))

(declare-fun res!119268 () Bool)

(assert (=> b!243368 (=> (not res!119268) (not e!157935))))

(assert (=> b!243368 (= res!119268 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!243369 () Bool)

(declare-fun e!157930 () Bool)

(declare-fun tp_is_empty!6385 () Bool)

(assert (=> b!243369 (= e!157930 tp_is_empty!6385)))

(declare-fun b!243370 () Bool)

(get-info :version)

(assert (=> b!243370 (= e!157943 ((_ is Undefined!1071) lt!122035))))

(declare-fun mapNonEmpty!10828 () Bool)

(declare-fun mapRes!10828 () Bool)

(declare-fun tp!22791 () Bool)

(declare-fun e!157934 () Bool)

(assert (=> mapNonEmpty!10828 (= mapRes!10828 (and tp!22791 e!157934))))

(declare-fun mapValue!10828 () ValueCell!2849)

(declare-fun mapKey!10828 () (_ BitVec 32))

(declare-fun mapRest!10828 () (Array (_ BitVec 32) ValueCell!2849))

(assert (=> mapNonEmpty!10828 (= (arr!5721 (_values!4495 thiss!1504)) (store mapRest!10828 mapKey!10828 mapValue!10828))))

(declare-fun bm!22686 () Bool)

(declare-fun c!40626 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22686 (= call!22688 (inRange!0 (ite c!40626 (index!6454 lt!122035) (index!6457 lt!122035)) (mask!10604 thiss!1504)))))

(declare-fun b!243372 () Bool)

(declare-fun e!157931 () Bool)

(assert (=> b!243372 (= e!157941 e!157931)))

(declare-fun res!119265 () Bool)

(assert (=> b!243372 (=> (not res!119265) (not e!157931))))

(assert (=> b!243372 (= res!119265 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!243373 () Bool)

(declare-fun c!40625 () Bool)

(assert (=> b!243373 (= c!40625 ((_ is MissingVacant!1071) lt!122035))))

(assert (=> b!243373 (= e!157927 e!157943)))

(declare-fun b!243374 () Bool)

(declare-fun e!157936 () Bool)

(assert (=> b!243374 (= e!157936 (and e!157930 mapRes!10828))))

(declare-fun condMapEmpty!10828 () Bool)

(declare-fun mapDefault!10828 () ValueCell!2849)

(assert (=> b!243374 (= condMapEmpty!10828 (= (arr!5721 (_values!4495 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2849)) mapDefault!10828)))))

(declare-fun b!243375 () Bool)

(declare-fun res!119263 () Bool)

(assert (=> b!243375 (=> (not res!119263) (not e!157933))))

(assert (=> b!243375 (= res!119263 (not (contains!1733 Nil!3628 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!243376 () Bool)

(declare-datatypes ((Unit!7501 0))(
  ( (Unit!7502) )
))
(declare-fun e!157942 () Unit!7501)

(declare-fun Unit!7503 () Unit!7501)

(assert (=> b!243376 (= e!157942 Unit!7503)))

(declare-fun lt!122036 () Unit!7501)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!366 (array!12055 array!12053 (_ BitVec 32) (_ BitVec 32) V!8161 V!8161 (_ BitVec 64) Int) Unit!7501)

(assert (=> b!243376 (= lt!122036 (lemmaInListMapThenSeekEntryOrOpenFindsIt!366 (_keys!6622 thiss!1504) (_values!4495 thiss!1504) (mask!10604 thiss!1504) (extraKeys!4249 thiss!1504) (zeroValue!4353 thiss!1504) (minValue!4353 thiss!1504) key!932 (defaultEntry!4512 thiss!1504)))))

(assert (=> b!243376 false))

(declare-fun b!243377 () Bool)

(assert (=> b!243377 (= e!157931 (not (contains!1733 Nil!3628 key!932)))))

(declare-fun b!243378 () Bool)

(declare-fun e!157928 () Unit!7501)

(declare-fun Unit!7504 () Unit!7501)

(assert (=> b!243378 (= e!157928 Unit!7504)))

(declare-fun b!243379 () Bool)

(assert (=> b!243379 (= e!157935 (contains!1733 Nil!3628 key!932))))

(declare-fun b!243380 () Bool)

(declare-fun res!119273 () Bool)

(assert (=> b!243380 (=> (not res!119273) (not e!157933))))

(declare-fun noDuplicate!97 (List!3631) Bool)

(assert (=> b!243380 (= res!119273 (noDuplicate!97 Nil!3628))))

(declare-fun b!243381 () Bool)

(declare-fun res!119262 () Bool)

(assert (=> b!243381 (=> (not res!119262) (not e!157929))))

(assert (=> b!243381 (= res!119262 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!243382 () Bool)

(assert (=> b!243382 (= e!157932 (not call!22689))))

(declare-fun b!243383 () Bool)

(assert (=> b!243383 (= e!157934 tp_is_empty!6385)))

(declare-fun b!243384 () Bool)

(declare-fun e!157940 () Bool)

(assert (=> b!243384 (= e!157939 e!157940)))

(declare-fun res!119264 () Bool)

(assert (=> b!243384 (=> (not res!119264) (not e!157940))))

(assert (=> b!243384 (= res!119264 (inRange!0 index!297 (mask!10604 thiss!1504)))))

(declare-fun lt!122040 () Unit!7501)

(assert (=> b!243384 (= lt!122040 e!157942)))

(declare-fun c!40627 () Bool)

(declare-datatypes ((tuple2!4730 0))(
  ( (tuple2!4731 (_1!2376 (_ BitVec 64)) (_2!2376 V!8161)) )
))
(declare-datatypes ((List!3632 0))(
  ( (Nil!3629) (Cons!3628 (h!4285 tuple2!4730) (t!8630 List!3632)) )
))
(declare-datatypes ((ListLongMap!3633 0))(
  ( (ListLongMap!3634 (toList!1832 List!3632)) )
))
(declare-fun contains!1734 (ListLongMap!3633 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1341 (array!12055 array!12053 (_ BitVec 32) (_ BitVec 32) V!8161 V!8161 (_ BitVec 32) Int) ListLongMap!3633)

(assert (=> b!243384 (= c!40627 (contains!1734 (getCurrentListMap!1341 (_keys!6622 thiss!1504) (_values!4495 thiss!1504) (mask!10604 thiss!1504) (extraKeys!4249 thiss!1504) (zeroValue!4353 thiss!1504) (minValue!4353 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4512 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!10828 () Bool)

(assert (=> mapIsEmpty!10828 mapRes!10828))

(declare-fun e!157937 () Bool)

(declare-fun array_inv!3777 (array!12055) Bool)

(declare-fun array_inv!3778 (array!12053) Bool)

(assert (=> b!243385 (= e!157937 (and tp!22792 tp_is_empty!6385 (array_inv!3777 (_keys!6622 thiss!1504)) (array_inv!3778 (_values!4495 thiss!1504)) e!157936))))

(declare-fun b!243386 () Bool)

(declare-fun res!119276 () Bool)

(assert (=> b!243386 (=> (not res!119276) (not e!157932))))

(assert (=> b!243386 (= res!119276 (= (select (arr!5722 (_keys!6622 thiss!1504)) (index!6454 lt!122035)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243387 () Bool)

(assert (=> b!243387 (= e!157940 e!157933)))

(declare-fun res!119275 () Bool)

(assert (=> b!243387 (=> (not res!119275) (not e!157933))))

(assert (=> b!243387 (= res!119275 (and (bvslt (size!6065 (_keys!6622 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6065 (_keys!6622 thiss!1504)))))))

(declare-fun lt!122039 () Unit!7501)

(assert (=> b!243387 (= lt!122039 e!157928)))

(declare-fun c!40624 () Bool)

(assert (=> b!243387 (= c!40624 (arrayContainsKey!0 (_keys!6622 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243388 () Bool)

(declare-fun lt!122037 () Unit!7501)

(assert (=> b!243388 (= e!157942 lt!122037)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!363 (array!12055 array!12053 (_ BitVec 32) (_ BitVec 32) V!8161 V!8161 (_ BitVec 64) Int) Unit!7501)

(assert (=> b!243388 (= lt!122037 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!363 (_keys!6622 thiss!1504) (_values!4495 thiss!1504) (mask!10604 thiss!1504) (extraKeys!4249 thiss!1504) (zeroValue!4353 thiss!1504) (minValue!4353 thiss!1504) key!932 (defaultEntry!4512 thiss!1504)))))

(assert (=> b!243388 (= c!40626 ((_ is MissingZero!1071) lt!122035))))

(assert (=> b!243388 e!157927))

(declare-fun b!243389 () Bool)

(assert (=> b!243389 (= e!157944 (not call!22689))))

(declare-fun b!243390 () Bool)

(declare-fun Unit!7505 () Unit!7501)

(assert (=> b!243390 (= e!157928 Unit!7505)))

(declare-fun lt!122038 () Unit!7501)

(declare-fun lemmaArrayContainsKeyThenInListMap!177 (array!12055 array!12053 (_ BitVec 32) (_ BitVec 32) V!8161 V!8161 (_ BitVec 64) (_ BitVec 32) Int) Unit!7501)

(assert (=> b!243390 (= lt!122038 (lemmaArrayContainsKeyThenInListMap!177 (_keys!6622 thiss!1504) (_values!4495 thiss!1504) (mask!10604 thiss!1504) (extraKeys!4249 thiss!1504) (zeroValue!4353 thiss!1504) (minValue!4353 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4512 thiss!1504)))))

(assert (=> b!243390 false))

(declare-fun b!243391 () Bool)

(declare-fun res!119267 () Bool)

(assert (=> b!243391 (= res!119267 (= (select (arr!5722 (_keys!6622 thiss!1504)) (index!6457 lt!122035)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!243391 (=> (not res!119267) (not e!157944))))

(declare-fun b!243371 () Bool)

(assert (=> b!243371 (= e!157933 false)))

(declare-fun lt!122034 () Bool)

(declare-fun arrayNoDuplicates!0 (array!12055 (_ BitVec 32) List!3631) Bool)

(assert (=> b!243371 (= lt!122034 (arrayNoDuplicates!0 (_keys!6622 thiss!1504) #b00000000000000000000000000000000 Nil!3628))))

(declare-fun res!119272 () Bool)

(assert (=> start!23216 (=> (not res!119272) (not e!157929))))

(declare-fun valid!1419 (LongMapFixedSize!3598) Bool)

(assert (=> start!23216 (= res!119272 (valid!1419 thiss!1504))))

(assert (=> start!23216 e!157929))

(assert (=> start!23216 e!157937))

(assert (=> start!23216 true))

(assert (= (and start!23216 res!119272) b!243381))

(assert (= (and b!243381 res!119262) b!243364))

(assert (= (and b!243364 res!119261) b!243384))

(assert (= (and b!243384 c!40627) b!243376))

(assert (= (and b!243384 (not c!40627)) b!243388))

(assert (= (and b!243388 c!40626) b!243367))

(assert (= (and b!243388 (not c!40626)) b!243373))

(assert (= (and b!243367 res!119266) b!243386))

(assert (= (and b!243386 res!119276) b!243382))

(assert (= (and b!243373 c!40625) b!243366))

(assert (= (and b!243373 (not c!40625)) b!243370))

(assert (= (and b!243366 res!119269) b!243391))

(assert (= (and b!243391 res!119267) b!243389))

(assert (= (or b!243367 b!243366) bm!22686))

(assert (= (or b!243382 b!243389) bm!22685))

(assert (= (and b!243384 res!119264) b!243387))

(assert (= (and b!243387 c!40624) b!243390))

(assert (= (and b!243387 (not c!40624)) b!243378))

(assert (= (and b!243387 res!119275) b!243380))

(assert (= (and b!243380 res!119273) b!243365))

(assert (= (and b!243365 res!119274) b!243375))

(assert (= (and b!243375 res!119263) b!243368))

(assert (= (and b!243368 res!119268) b!243379))

(assert (= (and b!243368 (not res!119271)) b!243372))

(assert (= (and b!243372 res!119265) b!243377))

(assert (= (and b!243368 res!119270) b!243371))

(assert (= (and b!243374 condMapEmpty!10828) mapIsEmpty!10828))

(assert (= (and b!243374 (not condMapEmpty!10828)) mapNonEmpty!10828))

(assert (= (and mapNonEmpty!10828 ((_ is ValueCellFull!2849) mapValue!10828)) b!243383))

(assert (= (and b!243374 ((_ is ValueCellFull!2849) mapDefault!10828)) b!243369))

(assert (= b!243385 b!243374))

(assert (= start!23216 b!243385))

(declare-fun m!261295 () Bool)

(assert (=> b!243380 m!261295))

(declare-fun m!261297 () Bool)

(assert (=> start!23216 m!261297))

(declare-fun m!261299 () Bool)

(assert (=> b!243376 m!261299))

(declare-fun m!261301 () Bool)

(assert (=> b!243379 m!261301))

(declare-fun m!261303 () Bool)

(assert (=> b!243384 m!261303))

(declare-fun m!261305 () Bool)

(assert (=> b!243384 m!261305))

(assert (=> b!243384 m!261305))

(declare-fun m!261307 () Bool)

(assert (=> b!243384 m!261307))

(declare-fun m!261309 () Bool)

(assert (=> b!243364 m!261309))

(declare-fun m!261311 () Bool)

(assert (=> b!243375 m!261311))

(declare-fun m!261313 () Bool)

(assert (=> b!243365 m!261313))

(declare-fun m!261315 () Bool)

(assert (=> b!243371 m!261315))

(declare-fun m!261317 () Bool)

(assert (=> bm!22685 m!261317))

(assert (=> b!243377 m!261301))

(declare-fun m!261319 () Bool)

(assert (=> b!243391 m!261319))

(declare-fun m!261321 () Bool)

(assert (=> mapNonEmpty!10828 m!261321))

(assert (=> b!243387 m!261317))

(declare-fun m!261323 () Bool)

(assert (=> b!243386 m!261323))

(declare-fun m!261325 () Bool)

(assert (=> b!243388 m!261325))

(declare-fun m!261327 () Bool)

(assert (=> bm!22686 m!261327))

(declare-fun m!261329 () Bool)

(assert (=> b!243385 m!261329))

(declare-fun m!261331 () Bool)

(assert (=> b!243385 m!261331))

(declare-fun m!261333 () Bool)

(assert (=> b!243390 m!261333))

(check-sat (not b!243387) (not b!243364) (not start!23216) (not b!243379) (not b_next!6523) (not b!243380) (not b!243376) (not b!243375) (not mapNonEmpty!10828) tp_is_empty!6385 (not b!243385) (not bm!22685) (not b!243390) b_and!13479 (not b!243388) (not b!243377) (not b!243384) (not b!243371) (not bm!22686) (not b!243365))
(check-sat b_and!13479 (not b_next!6523))
