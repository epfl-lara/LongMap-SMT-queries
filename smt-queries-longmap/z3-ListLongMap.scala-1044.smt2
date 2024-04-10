; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21948 () Bool)

(assert start!21948)

(declare-fun b!224189 () Bool)

(declare-fun b_free!6015 () Bool)

(declare-fun b_next!6015 () Bool)

(assert (=> b!224189 (= b_free!6015 (not b_next!6015))))

(declare-fun tp!21187 () Bool)

(declare-fun b_and!12913 () Bool)

(assert (=> b!224189 (= tp!21187 b_and!12913)))

(declare-fun b!224181 () Bool)

(declare-fun res!110288 () Bool)

(declare-fun e!145572 () Bool)

(assert (=> b!224181 (=> (not res!110288) (not e!145572))))

(declare-fun call!20879 () Bool)

(assert (=> b!224181 (= res!110288 call!20879)))

(declare-fun e!145564 () Bool)

(assert (=> b!224181 (= e!145564 e!145572)))

(declare-fun b!224182 () Bool)

(declare-fun e!145575 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((List!3333 0))(
  ( (Nil!3330) (Cons!3329 (h!3977 (_ BitVec 64)) (t!8292 List!3333)) )
))
(declare-fun contains!1553 (List!3333 (_ BitVec 64)) Bool)

(assert (=> b!224182 (= e!145575 (contains!1553 Nil!3330 key!932))))

(declare-fun b!224183 () Bool)

(declare-fun e!145577 () Bool)

(declare-fun tp_is_empty!5877 () Bool)

(assert (=> b!224183 (= e!145577 tp_is_empty!5877)))

(declare-fun b!224184 () Bool)

(declare-fun res!110271 () Bool)

(declare-fun e!145565 () Bool)

(assert (=> b!224184 (=> (not res!110271) (not e!145565))))

(assert (=> b!224184 (= res!110271 (not (contains!1553 Nil!3330 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!224185 () Bool)

(declare-datatypes ((Unit!6742 0))(
  ( (Unit!6743) )
))
(declare-fun e!145561 () Unit!6742)

(declare-fun Unit!6744 () Unit!6742)

(assert (=> b!224185 (= e!145561 Unit!6744)))

(declare-fun lt!113090 () Unit!6742)

(declare-datatypes ((V!7483 0))(
  ( (V!7484 (val!2983 Int)) )
))
(declare-datatypes ((ValueCell!2595 0))(
  ( (ValueCellFull!2595 (v!5003 V!7483)) (EmptyCell!2595) )
))
(declare-datatypes ((array!10997 0))(
  ( (array!10998 (arr!5218 (Array (_ BitVec 32) ValueCell!2595)) (size!5551 (_ BitVec 32))) )
))
(declare-datatypes ((array!10999 0))(
  ( (array!11000 (arr!5219 (Array (_ BitVec 32) (_ BitVec 64))) (size!5552 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3090 0))(
  ( (LongMapFixedSize!3091 (defaultEntry!4204 Int) (mask!10036 (_ BitVec 32)) (extraKeys!3941 (_ BitVec 32)) (zeroValue!4045 V!7483) (minValue!4045 V!7483) (_size!1594 (_ BitVec 32)) (_keys!6258 array!10999) (_values!4187 array!10997) (_vacant!1594 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3090)

(declare-fun lemmaArrayContainsKeyThenInListMap!77 (array!10999 array!10997 (_ BitVec 32) (_ BitVec 32) V!7483 V!7483 (_ BitVec 64) (_ BitVec 32) Int) Unit!6742)

(assert (=> b!224185 (= lt!113090 (lemmaArrayContainsKeyThenInListMap!77 (_keys!6258 thiss!1504) (_values!4187 thiss!1504) (mask!10036 thiss!1504) (extraKeys!3941 thiss!1504) (zeroValue!4045 thiss!1504) (minValue!4045 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4204 thiss!1504)))))

(assert (=> b!224185 false))

(declare-fun b!224186 () Bool)

(declare-fun e!145571 () Bool)

(declare-datatypes ((SeekEntryResult!856 0))(
  ( (MissingZero!856 (index!5594 (_ BitVec 32))) (Found!856 (index!5595 (_ BitVec 32))) (Intermediate!856 (undefined!1668 Bool) (index!5596 (_ BitVec 32)) (x!23124 (_ BitVec 32))) (Undefined!856) (MissingVacant!856 (index!5597 (_ BitVec 32))) )
))
(declare-fun lt!113092 () SeekEntryResult!856)

(get-info :version)

(assert (=> b!224186 (= e!145571 ((_ is Undefined!856) lt!113092))))

(declare-fun b!224187 () Bool)

(assert (=> b!224187 (= e!145565 false)))

(declare-fun lt!113087 () Bool)

(assert (=> b!224187 (= lt!113087 (contains!1553 Nil!3330 key!932))))

(declare-fun e!145574 () Bool)

(declare-fun e!145562 () Bool)

(declare-fun array_inv!3453 (array!10999) Bool)

(declare-fun array_inv!3454 (array!10997) Bool)

(assert (=> b!224189 (= e!145562 (and tp!21187 tp_is_empty!5877 (array_inv!3453 (_keys!6258 thiss!1504)) (array_inv!3454 (_values!4187 thiss!1504)) e!145574))))

(declare-fun mapIsEmpty!9985 () Bool)

(declare-fun mapRes!9985 () Bool)

(assert (=> mapIsEmpty!9985 mapRes!9985))

(declare-fun b!224190 () Bool)

(declare-fun e!145576 () Unit!6742)

(declare-fun lt!113093 () Unit!6742)

(assert (=> b!224190 (= e!145576 lt!113093)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!248 (array!10999 array!10997 (_ BitVec 32) (_ BitVec 32) V!7483 V!7483 (_ BitVec 64) Int) Unit!6742)

(assert (=> b!224190 (= lt!113093 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!248 (_keys!6258 thiss!1504) (_values!4187 thiss!1504) (mask!10036 thiss!1504) (extraKeys!3941 thiss!1504) (zeroValue!4045 thiss!1504) (minValue!4045 thiss!1504) key!932 (defaultEntry!4204 thiss!1504)))))

(declare-fun c!37185 () Bool)

(assert (=> b!224190 (= c!37185 ((_ is MissingZero!856) lt!113092))))

(assert (=> b!224190 e!145564))

(declare-fun bm!20876 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20876 (= call!20879 (inRange!0 (ite c!37185 (index!5594 lt!113092) (index!5597 lt!113092)) (mask!10036 thiss!1504)))))

(declare-fun bm!20877 () Bool)

(declare-fun call!20880 () Bool)

(declare-fun arrayContainsKey!0 (array!10999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20877 (= call!20880 (arrayContainsKey!0 (_keys!6258 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224191 () Bool)

(assert (=> b!224191 (= e!145572 (not call!20880))))

(declare-fun b!224192 () Bool)

(declare-fun res!110289 () Bool)

(declare-fun e!145560 () Bool)

(assert (=> b!224192 (=> (not res!110289) (not e!145560))))

(assert (=> b!224192 (= res!110289 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!224193 () Bool)

(declare-fun res!110277 () Bool)

(assert (=> b!224193 (=> (not res!110277) (not e!145565))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!224193 (= res!110277 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5552 (_keys!6258 thiss!1504)))))))

(declare-fun b!224194 () Bool)

(declare-fun e!145568 () Bool)

(assert (=> b!224194 (= e!145571 e!145568)))

(declare-fun res!110283 () Bool)

(assert (=> b!224194 (= res!110283 call!20879)))

(assert (=> b!224194 (=> (not res!110283) (not e!145568))))

(declare-fun b!224195 () Bool)

(declare-fun res!110282 () Bool)

(assert (=> b!224195 (=> (not res!110282) (not e!145565))))

(declare-fun arrayNoDuplicates!0 (array!10999 (_ BitVec 32) List!3333) Bool)

(assert (=> b!224195 (= res!110282 (arrayNoDuplicates!0 (_keys!6258 thiss!1504) #b00000000000000000000000000000000 Nil!3330))))

(declare-fun b!224196 () Bool)

(declare-fun e!145570 () Bool)

(assert (=> b!224196 (= e!145560 e!145570)))

(declare-fun res!110274 () Bool)

(assert (=> b!224196 (=> (not res!110274) (not e!145570))))

(assert (=> b!224196 (= res!110274 (or (= lt!113092 (MissingZero!856 index!297)) (= lt!113092 (MissingVacant!856 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10999 (_ BitVec 32)) SeekEntryResult!856)

(assert (=> b!224196 (= lt!113092 (seekEntryOrOpen!0 key!932 (_keys!6258 thiss!1504) (mask!10036 thiss!1504)))))

(declare-fun b!224197 () Bool)

(declare-fun res!110279 () Bool)

(assert (=> b!224197 (=> (not res!110279) (not e!145565))))

(declare-fun noDuplicate!83 (List!3333) Bool)

(assert (=> b!224197 (= res!110279 (noDuplicate!83 Nil!3330))))

(declare-fun b!224198 () Bool)

(declare-fun Unit!6745 () Unit!6742)

(assert (=> b!224198 (= e!145561 Unit!6745)))

(declare-fun b!224199 () Bool)

(declare-fun e!145569 () Bool)

(assert (=> b!224199 (= e!145569 e!145565)))

(declare-fun res!110281 () Bool)

(assert (=> b!224199 (=> (not res!110281) (not e!145565))))

(assert (=> b!224199 (= res!110281 (and (bvslt (size!5552 (_keys!6258 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5552 (_keys!6258 thiss!1504)))))))

(declare-fun lt!113086 () Unit!6742)

(assert (=> b!224199 (= lt!113086 e!145561)))

(declare-fun c!37187 () Bool)

(declare-fun lt!113088 () Bool)

(assert (=> b!224199 (= c!37187 lt!113088)))

(assert (=> b!224199 (= lt!113088 (arrayContainsKey!0 (_keys!6258 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!9985 () Bool)

(declare-fun tp!21186 () Bool)

(assert (=> mapNonEmpty!9985 (= mapRes!9985 (and tp!21186 e!145577))))

(declare-fun mapKey!9985 () (_ BitVec 32))

(declare-fun mapRest!9985 () (Array (_ BitVec 32) ValueCell!2595))

(declare-fun mapValue!9985 () ValueCell!2595)

(assert (=> mapNonEmpty!9985 (= (arr!5218 (_values!4187 thiss!1504)) (store mapRest!9985 mapKey!9985 mapValue!9985))))

(declare-fun b!224200 () Bool)

(declare-fun res!110278 () Bool)

(assert (=> b!224200 (=> (not res!110278) (not e!145565))))

(declare-fun e!145567 () Bool)

(assert (=> b!224200 (= res!110278 e!145567)))

(declare-fun res!110285 () Bool)

(assert (=> b!224200 (=> res!110285 e!145567)))

(assert (=> b!224200 (= res!110285 e!145575)))

(declare-fun res!110280 () Bool)

(assert (=> b!224200 (=> (not res!110280) (not e!145575))))

(assert (=> b!224200 (= res!110280 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!224201 () Bool)

(assert (=> b!224201 (= e!145568 (not call!20880))))

(declare-fun b!224202 () Bool)

(declare-fun res!110284 () Bool)

(assert (=> b!224202 (=> (not res!110284) (not e!145565))))

(assert (=> b!224202 (= res!110284 (not lt!113088))))

(declare-fun b!224203 () Bool)

(assert (=> b!224203 (= e!145570 e!145569)))

(declare-fun res!110287 () Bool)

(assert (=> b!224203 (=> (not res!110287) (not e!145569))))

(assert (=> b!224203 (= res!110287 (inRange!0 index!297 (mask!10036 thiss!1504)))))

(declare-fun lt!113089 () Unit!6742)

(assert (=> b!224203 (= lt!113089 e!145576)))

(declare-fun c!37186 () Bool)

(declare-datatypes ((tuple2!4422 0))(
  ( (tuple2!4423 (_1!2222 (_ BitVec 64)) (_2!2222 V!7483)) )
))
(declare-datatypes ((List!3334 0))(
  ( (Nil!3331) (Cons!3330 (h!3978 tuple2!4422) (t!8293 List!3334)) )
))
(declare-datatypes ((ListLongMap!3335 0))(
  ( (ListLongMap!3336 (toList!1683 List!3334)) )
))
(declare-fun contains!1554 (ListLongMap!3335 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1211 (array!10999 array!10997 (_ BitVec 32) (_ BitVec 32) V!7483 V!7483 (_ BitVec 32) Int) ListLongMap!3335)

(assert (=> b!224203 (= c!37186 (contains!1554 (getCurrentListMap!1211 (_keys!6258 thiss!1504) (_values!4187 thiss!1504) (mask!10036 thiss!1504) (extraKeys!3941 thiss!1504) (zeroValue!4045 thiss!1504) (minValue!4045 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4204 thiss!1504)) key!932))))

(declare-fun b!224204 () Bool)

(declare-fun e!145573 () Bool)

(assert (=> b!224204 (= e!145573 tp_is_empty!5877)))

(declare-fun b!224205 () Bool)

(declare-fun res!110276 () Bool)

(assert (=> b!224205 (=> (not res!110276) (not e!145572))))

(assert (=> b!224205 (= res!110276 (= (select (arr!5219 (_keys!6258 thiss!1504)) (index!5594 lt!113092)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!224206 () Bool)

(declare-fun res!110286 () Bool)

(assert (=> b!224206 (=> (not res!110286) (not e!145565))))

(assert (=> b!224206 (= res!110286 (not (contains!1553 Nil!3330 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!224207 () Bool)

(assert (=> b!224207 (= e!145574 (and e!145573 mapRes!9985))))

(declare-fun condMapEmpty!9985 () Bool)

(declare-fun mapDefault!9985 () ValueCell!2595)

(assert (=> b!224207 (= condMapEmpty!9985 (= (arr!5218 (_values!4187 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2595)) mapDefault!9985)))))

(declare-fun b!224208 () Bool)

(declare-fun Unit!6746 () Unit!6742)

(assert (=> b!224208 (= e!145576 Unit!6746)))

(declare-fun lt!113091 () Unit!6742)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!237 (array!10999 array!10997 (_ BitVec 32) (_ BitVec 32) V!7483 V!7483 (_ BitVec 64) Int) Unit!6742)

(assert (=> b!224208 (= lt!113091 (lemmaInListMapThenSeekEntryOrOpenFindsIt!237 (_keys!6258 thiss!1504) (_values!4187 thiss!1504) (mask!10036 thiss!1504) (extraKeys!3941 thiss!1504) (zeroValue!4045 thiss!1504) (minValue!4045 thiss!1504) key!932 (defaultEntry!4204 thiss!1504)))))

(assert (=> b!224208 false))

(declare-fun b!224209 () Bool)

(declare-fun e!145566 () Bool)

(assert (=> b!224209 (= e!145566 (not (contains!1553 Nil!3330 key!932)))))

(declare-fun b!224210 () Bool)

(declare-fun res!110275 () Bool)

(assert (=> b!224210 (= res!110275 (= (select (arr!5219 (_keys!6258 thiss!1504)) (index!5597 lt!113092)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!224210 (=> (not res!110275) (not e!145568))))

(declare-fun b!224188 () Bool)

(assert (=> b!224188 (= e!145567 e!145566)))

(declare-fun res!110272 () Bool)

(assert (=> b!224188 (=> (not res!110272) (not e!145566))))

(assert (=> b!224188 (= res!110272 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun res!110273 () Bool)

(assert (=> start!21948 (=> (not res!110273) (not e!145560))))

(declare-fun valid!1245 (LongMapFixedSize!3090) Bool)

(assert (=> start!21948 (= res!110273 (valid!1245 thiss!1504))))

(assert (=> start!21948 e!145560))

(assert (=> start!21948 e!145562))

(assert (=> start!21948 true))

(declare-fun b!224211 () Bool)

(declare-fun c!37188 () Bool)

(assert (=> b!224211 (= c!37188 ((_ is MissingVacant!856) lt!113092))))

(assert (=> b!224211 (= e!145564 e!145571)))

(declare-fun b!224212 () Bool)

(declare-fun res!110290 () Bool)

(assert (=> b!224212 (=> (not res!110290) (not e!145565))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!224212 (= res!110290 (validKeyInArray!0 key!932))))

(assert (= (and start!21948 res!110273) b!224192))

(assert (= (and b!224192 res!110289) b!224196))

(assert (= (and b!224196 res!110274) b!224203))

(assert (= (and b!224203 c!37186) b!224208))

(assert (= (and b!224203 (not c!37186)) b!224190))

(assert (= (and b!224190 c!37185) b!224181))

(assert (= (and b!224190 (not c!37185)) b!224211))

(assert (= (and b!224181 res!110288) b!224205))

(assert (= (and b!224205 res!110276) b!224191))

(assert (= (and b!224211 c!37188) b!224194))

(assert (= (and b!224211 (not c!37188)) b!224186))

(assert (= (and b!224194 res!110283) b!224210))

(assert (= (and b!224210 res!110275) b!224201))

(assert (= (or b!224181 b!224194) bm!20876))

(assert (= (or b!224191 b!224201) bm!20877))

(assert (= (and b!224203 res!110287) b!224199))

(assert (= (and b!224199 c!37187) b!224185))

(assert (= (and b!224199 (not c!37187)) b!224198))

(assert (= (and b!224199 res!110281) b!224197))

(assert (= (and b!224197 res!110279) b!224184))

(assert (= (and b!224184 res!110271) b!224206))

(assert (= (and b!224206 res!110286) b!224200))

(assert (= (and b!224200 res!110280) b!224182))

(assert (= (and b!224200 (not res!110285)) b!224188))

(assert (= (and b!224188 res!110272) b!224209))

(assert (= (and b!224200 res!110278) b!224195))

(assert (= (and b!224195 res!110282) b!224193))

(assert (= (and b!224193 res!110277) b!224212))

(assert (= (and b!224212 res!110290) b!224202))

(assert (= (and b!224202 res!110284) b!224187))

(assert (= (and b!224207 condMapEmpty!9985) mapIsEmpty!9985))

(assert (= (and b!224207 (not condMapEmpty!9985)) mapNonEmpty!9985))

(assert (= (and mapNonEmpty!9985 ((_ is ValueCellFull!2595) mapValue!9985)) b!224183))

(assert (= (and b!224207 ((_ is ValueCellFull!2595) mapDefault!9985)) b!224204))

(assert (= b!224189 b!224207))

(assert (= start!21948 b!224189))

(declare-fun m!247331 () Bool)

(assert (=> b!224182 m!247331))

(declare-fun m!247333 () Bool)

(assert (=> bm!20876 m!247333))

(assert (=> b!224209 m!247331))

(assert (=> b!224187 m!247331))

(declare-fun m!247335 () Bool)

(assert (=> b!224196 m!247335))

(declare-fun m!247337 () Bool)

(assert (=> b!224210 m!247337))

(declare-fun m!247339 () Bool)

(assert (=> start!21948 m!247339))

(declare-fun m!247341 () Bool)

(assert (=> b!224189 m!247341))

(declare-fun m!247343 () Bool)

(assert (=> b!224189 m!247343))

(declare-fun m!247345 () Bool)

(assert (=> b!224195 m!247345))

(declare-fun m!247347 () Bool)

(assert (=> b!224190 m!247347))

(declare-fun m!247349 () Bool)

(assert (=> b!224212 m!247349))

(declare-fun m!247351 () Bool)

(assert (=> b!224203 m!247351))

(declare-fun m!247353 () Bool)

(assert (=> b!224203 m!247353))

(assert (=> b!224203 m!247353))

(declare-fun m!247355 () Bool)

(assert (=> b!224203 m!247355))

(declare-fun m!247357 () Bool)

(assert (=> b!224199 m!247357))

(declare-fun m!247359 () Bool)

(assert (=> b!224208 m!247359))

(declare-fun m!247361 () Bool)

(assert (=> b!224206 m!247361))

(declare-fun m!247363 () Bool)

(assert (=> mapNonEmpty!9985 m!247363))

(declare-fun m!247365 () Bool)

(assert (=> b!224184 m!247365))

(declare-fun m!247367 () Bool)

(assert (=> b!224197 m!247367))

(declare-fun m!247369 () Bool)

(assert (=> b!224205 m!247369))

(declare-fun m!247371 () Bool)

(assert (=> b!224185 m!247371))

(assert (=> bm!20877 m!247357))

(check-sat (not b!224190) (not b!224208) (not b!224184) (not b!224196) (not bm!20876) (not b_next!6015) (not b!224187) b_and!12913 (not mapNonEmpty!9985) (not b!224203) (not bm!20877) (not b!224182) (not b!224197) (not start!21948) (not b!224185) (not b!224209) (not b!224189) (not b!224212) (not b!224206) tp_is_empty!5877 (not b!224199) (not b!224195))
(check-sat b_and!12913 (not b_next!6015))
