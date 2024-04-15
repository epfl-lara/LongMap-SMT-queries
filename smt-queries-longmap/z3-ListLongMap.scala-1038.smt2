; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21914 () Bool)

(assert start!21914)

(declare-fun b!222275 () Bool)

(declare-fun b_free!5977 () Bool)

(declare-fun b_next!5977 () Bool)

(assert (=> b!222275 (= b_free!5977 (not b_next!5977))))

(declare-fun tp!21073 () Bool)

(declare-fun b_and!12849 () Bool)

(assert (=> b!222275 (= tp!21073 b_and!12849)))

(declare-fun b!222265 () Bool)

(declare-fun e!144435 () Bool)

(declare-fun call!20741 () Bool)

(assert (=> b!222265 (= e!144435 (not call!20741))))

(declare-fun b!222266 () Bool)

(declare-fun e!144437 () Bool)

(declare-fun tp_is_empty!5839 () Bool)

(assert (=> b!222266 (= e!144437 tp_is_empty!5839)))

(declare-fun b!222268 () Bool)

(declare-fun e!144433 () Bool)

(declare-fun e!144448 () Bool)

(assert (=> b!222268 (= e!144433 e!144448)))

(declare-fun res!109099 () Bool)

(declare-fun call!20742 () Bool)

(assert (=> b!222268 (= res!109099 call!20742)))

(assert (=> b!222268 (=> (not res!109099) (not e!144448))))

(declare-fun b!222269 () Bool)

(declare-fun e!144442 () Bool)

(declare-fun e!144439 () Bool)

(assert (=> b!222269 (= e!144442 e!144439)))

(declare-fun res!109091 () Bool)

(assert (=> b!222269 (=> (not res!109091) (not e!144439))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7433 0))(
  ( (V!7434 (val!2964 Int)) )
))
(declare-datatypes ((ValueCell!2576 0))(
  ( (ValueCellFull!2576 (v!4978 V!7433)) (EmptyCell!2576) )
))
(declare-datatypes ((array!10913 0))(
  ( (array!10914 (arr!5175 (Array (_ BitVec 32) ValueCell!2576)) (size!5509 (_ BitVec 32))) )
))
(declare-datatypes ((array!10915 0))(
  ( (array!10916 (arr!5176 (Array (_ BitVec 32) (_ BitVec 64))) (size!5510 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3052 0))(
  ( (LongMapFixedSize!3053 (defaultEntry!4185 Int) (mask!10004 (_ BitVec 32)) (extraKeys!3922 (_ BitVec 32)) (zeroValue!4026 V!7433) (minValue!4026 V!7433) (_size!1575 (_ BitVec 32)) (_keys!6238 array!10915) (_values!4168 array!10913) (_vacant!1575 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3052)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!222269 (= res!109091 (inRange!0 index!297 (mask!10004 thiss!1504)))))

(declare-datatypes ((Unit!6610 0))(
  ( (Unit!6611) )
))
(declare-fun lt!112470 () Unit!6610)

(declare-fun e!144446 () Unit!6610)

(assert (=> b!222269 (= lt!112470 e!144446)))

(declare-fun c!36931 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4366 0))(
  ( (tuple2!4367 (_1!2194 (_ BitVec 64)) (_2!2194 V!7433)) )
))
(declare-datatypes ((List!3286 0))(
  ( (Nil!3283) (Cons!3282 (h!3930 tuple2!4366) (t!8236 List!3286)) )
))
(declare-datatypes ((ListLongMap!3269 0))(
  ( (ListLongMap!3270 (toList!1650 List!3286)) )
))
(declare-fun contains!1502 (ListLongMap!3269 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1159 (array!10915 array!10913 (_ BitVec 32) (_ BitVec 32) V!7433 V!7433 (_ BitVec 32) Int) ListLongMap!3269)

(assert (=> b!222269 (= c!36931 (contains!1502 (getCurrentListMap!1159 (_keys!6238 thiss!1504) (_values!4168 thiss!1504) (mask!10004 thiss!1504) (extraKeys!3922 thiss!1504) (zeroValue!4026 thiss!1504) (minValue!4026 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4185 thiss!1504)) key!932))))

(declare-fun b!222270 () Bool)

(declare-fun lt!112466 () Unit!6610)

(assert (=> b!222270 (= e!144446 lt!112466)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!218 (array!10915 array!10913 (_ BitVec 32) (_ BitVec 32) V!7433 V!7433 (_ BitVec 64) Int) Unit!6610)

(assert (=> b!222270 (= lt!112466 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!218 (_keys!6238 thiss!1504) (_values!4168 thiss!1504) (mask!10004 thiss!1504) (extraKeys!3922 thiss!1504) (zeroValue!4026 thiss!1504) (minValue!4026 thiss!1504) key!932 (defaultEntry!4185 thiss!1504)))))

(declare-fun c!36934 () Bool)

(declare-datatypes ((SeekEntryResult!832 0))(
  ( (MissingZero!832 (index!5498 (_ BitVec 32))) (Found!832 (index!5499 (_ BitVec 32))) (Intermediate!832 (undefined!1644 Bool) (index!5500 (_ BitVec 32)) (x!23051 (_ BitVec 32))) (Undefined!832) (MissingVacant!832 (index!5501 (_ BitVec 32))) )
))
(declare-fun lt!112467 () SeekEntryResult!832)

(get-info :version)

(assert (=> b!222270 (= c!36934 ((_ is MissingZero!832) lt!112467))))

(declare-fun e!144434 () Bool)

(assert (=> b!222270 e!144434))

(declare-fun b!222271 () Bool)

(declare-fun res!109105 () Bool)

(assert (=> b!222271 (=> (not res!109105) (not e!144435))))

(assert (=> b!222271 (= res!109105 (= (select (arr!5176 (_keys!6238 thiss!1504)) (index!5498 lt!112467)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!222272 () Bool)

(declare-fun Unit!6612 () Unit!6610)

(assert (=> b!222272 (= e!144446 Unit!6612)))

(declare-fun lt!112468 () Unit!6610)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!217 (array!10915 array!10913 (_ BitVec 32) (_ BitVec 32) V!7433 V!7433 (_ BitVec 64) Int) Unit!6610)

(assert (=> b!222272 (= lt!112468 (lemmaInListMapThenSeekEntryOrOpenFindsIt!217 (_keys!6238 thiss!1504) (_values!4168 thiss!1504) (mask!10004 thiss!1504) (extraKeys!3922 thiss!1504) (zeroValue!4026 thiss!1504) (minValue!4026 thiss!1504) key!932 (defaultEntry!4185 thiss!1504)))))

(assert (=> b!222272 false))

(declare-fun mapNonEmpty!9928 () Bool)

(declare-fun mapRes!9928 () Bool)

(declare-fun tp!21072 () Bool)

(declare-fun e!144450 () Bool)

(assert (=> mapNonEmpty!9928 (= mapRes!9928 (and tp!21072 e!144450))))

(declare-fun mapKey!9928 () (_ BitVec 32))

(declare-fun mapValue!9928 () ValueCell!2576)

(declare-fun mapRest!9928 () (Array (_ BitVec 32) ValueCell!2576))

(assert (=> mapNonEmpty!9928 (= (arr!5175 (_values!4168 thiss!1504)) (store mapRest!9928 mapKey!9928 mapValue!9928))))

(declare-fun b!222273 () Bool)

(declare-fun e!144444 () Unit!6610)

(declare-fun Unit!6613 () Unit!6610)

(assert (=> b!222273 (= e!144444 Unit!6613)))

(declare-fun b!222274 () Bool)

(declare-fun e!144440 () Bool)

(assert (=> b!222274 (= e!144440 (and e!144437 mapRes!9928))))

(declare-fun condMapEmpty!9928 () Bool)

(declare-fun mapDefault!9928 () ValueCell!2576)

(assert (=> b!222274 (= condMapEmpty!9928 (= (arr!5175 (_values!4168 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2576)) mapDefault!9928)))))

(declare-fun e!144449 () Bool)

(declare-fun array_inv!3413 (array!10915) Bool)

(declare-fun array_inv!3414 (array!10913) Bool)

(assert (=> b!222275 (= e!144449 (and tp!21073 tp_is_empty!5839 (array_inv!3413 (_keys!6238 thiss!1504)) (array_inv!3414 (_values!4168 thiss!1504)) e!144440))))

(declare-fun b!222276 () Bool)

(declare-fun res!109102 () Bool)

(assert (=> b!222276 (=> (not res!109102) (not e!144435))))

(assert (=> b!222276 (= res!109102 call!20742)))

(assert (=> b!222276 (= e!144434 e!144435)))

(declare-fun b!222277 () Bool)

(declare-fun res!109094 () Bool)

(declare-fun e!144445 () Bool)

(assert (=> b!222277 (=> (not res!109094) (not e!144445))))

(assert (=> b!222277 (= res!109094 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!222278 () Bool)

(declare-fun res!109104 () Bool)

(assert (=> b!222278 (= res!109104 (= (select (arr!5176 (_keys!6238 thiss!1504)) (index!5501 lt!112467)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!222278 (=> (not res!109104) (not e!144448))))

(declare-fun b!222279 () Bool)

(declare-fun res!109106 () Bool)

(declare-fun e!144443 () Bool)

(assert (=> b!222279 (=> (not res!109106) (not e!144443))))

(declare-datatypes ((List!3287 0))(
  ( (Nil!3284) (Cons!3283 (h!3931 (_ BitVec 64)) (t!8237 List!3287)) )
))
(declare-fun noDuplicate!69 (List!3287) Bool)

(assert (=> b!222279 (= res!109106 (noDuplicate!69 Nil!3284))))

(declare-fun res!109098 () Bool)

(assert (=> start!21914 (=> (not res!109098) (not e!144445))))

(declare-fun valid!1246 (LongMapFixedSize!3052) Bool)

(assert (=> start!21914 (= res!109098 (valid!1246 thiss!1504))))

(assert (=> start!21914 e!144445))

(assert (=> start!21914 e!144449))

(assert (=> start!21914 true))

(declare-fun b!222267 () Bool)

(declare-fun c!36933 () Bool)

(assert (=> b!222267 (= c!36933 ((_ is MissingVacant!832) lt!112467))))

(assert (=> b!222267 (= e!144434 e!144433)))

(declare-fun b!222280 () Bool)

(assert (=> b!222280 (= e!144450 tp_is_empty!5839)))

(declare-fun mapIsEmpty!9928 () Bool)

(assert (=> mapIsEmpty!9928 mapRes!9928))

(declare-fun b!222281 () Bool)

(assert (=> b!222281 (= e!144439 e!144443)))

(declare-fun res!109100 () Bool)

(assert (=> b!222281 (=> (not res!109100) (not e!144443))))

(assert (=> b!222281 (= res!109100 (and (bvslt (size!5510 (_keys!6238 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5510 (_keys!6238 thiss!1504)))))))

(declare-fun lt!112469 () Unit!6610)

(assert (=> b!222281 (= lt!112469 e!144444)))

(declare-fun c!36932 () Bool)

(declare-fun arrayContainsKey!0 (array!10915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222281 (= c!36932 (arrayContainsKey!0 (_keys!6238 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222282 () Bool)

(declare-fun Unit!6614 () Unit!6610)

(assert (=> b!222282 (= e!144444 Unit!6614)))

(declare-fun lt!112465 () Unit!6610)

(declare-fun lemmaArrayContainsKeyThenInListMap!59 (array!10915 array!10913 (_ BitVec 32) (_ BitVec 32) V!7433 V!7433 (_ BitVec 64) (_ BitVec 32) Int) Unit!6610)

(assert (=> b!222282 (= lt!112465 (lemmaArrayContainsKeyThenInListMap!59 (_keys!6238 thiss!1504) (_values!4168 thiss!1504) (mask!10004 thiss!1504) (extraKeys!3922 thiss!1504) (zeroValue!4026 thiss!1504) (minValue!4026 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4185 thiss!1504)))))

(assert (=> b!222282 false))

(declare-fun b!222283 () Bool)

(declare-fun res!109103 () Bool)

(assert (=> b!222283 (=> (not res!109103) (not e!144443))))

(declare-fun e!144436 () Bool)

(assert (=> b!222283 (= res!109103 e!144436)))

(declare-fun res!109097 () Bool)

(assert (=> b!222283 (=> res!109097 e!144436)))

(declare-fun e!144438 () Bool)

(assert (=> b!222283 (= res!109097 e!144438)))

(declare-fun res!109101 () Bool)

(assert (=> b!222283 (=> (not res!109101) (not e!144438))))

(assert (=> b!222283 (= res!109101 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!222284 () Bool)

(assert (=> b!222284 (= e!144445 e!144442)))

(declare-fun res!109095 () Bool)

(assert (=> b!222284 (=> (not res!109095) (not e!144442))))

(assert (=> b!222284 (= res!109095 (or (= lt!112467 (MissingZero!832 index!297)) (= lt!112467 (MissingVacant!832 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10915 (_ BitVec 32)) SeekEntryResult!832)

(assert (=> b!222284 (= lt!112467 (seekEntryOrOpen!0 key!932 (_keys!6238 thiss!1504) (mask!10004 thiss!1504)))))

(declare-fun b!222285 () Bool)

(assert (=> b!222285 (= e!144443 false)))

(declare-fun lt!112471 () Bool)

(declare-fun arrayNoDuplicates!0 (array!10915 (_ BitVec 32) List!3287) Bool)

(assert (=> b!222285 (= lt!112471 (arrayNoDuplicates!0 (_keys!6238 thiss!1504) #b00000000000000000000000000000000 Nil!3284))))

(declare-fun b!222286 () Bool)

(declare-fun e!144447 () Bool)

(assert (=> b!222286 (= e!144436 e!144447)))

(declare-fun res!109096 () Bool)

(assert (=> b!222286 (=> (not res!109096) (not e!144447))))

(assert (=> b!222286 (= res!109096 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun bm!20738 () Bool)

(assert (=> bm!20738 (= call!20742 (inRange!0 (ite c!36934 (index!5498 lt!112467) (index!5501 lt!112467)) (mask!10004 thiss!1504)))))

(declare-fun b!222287 () Bool)

(declare-fun res!109093 () Bool)

(assert (=> b!222287 (=> (not res!109093) (not e!144443))))

(declare-fun contains!1503 (List!3287 (_ BitVec 64)) Bool)

(assert (=> b!222287 (= res!109093 (not (contains!1503 Nil!3284 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222288 () Bool)

(assert (=> b!222288 (= e!144433 ((_ is Undefined!832) lt!112467))))

(declare-fun b!222289 () Bool)

(assert (=> b!222289 (= e!144438 (contains!1503 Nil!3284 key!932))))

(declare-fun b!222290 () Bool)

(declare-fun res!109092 () Bool)

(assert (=> b!222290 (=> (not res!109092) (not e!144443))))

(assert (=> b!222290 (= res!109092 (not (contains!1503 Nil!3284 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222291 () Bool)

(assert (=> b!222291 (= e!144447 (not (contains!1503 Nil!3284 key!932)))))

(declare-fun bm!20739 () Bool)

(assert (=> bm!20739 (= call!20741 (arrayContainsKey!0 (_keys!6238 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222292 () Bool)

(assert (=> b!222292 (= e!144448 (not call!20741))))

(assert (= (and start!21914 res!109098) b!222277))

(assert (= (and b!222277 res!109094) b!222284))

(assert (= (and b!222284 res!109095) b!222269))

(assert (= (and b!222269 c!36931) b!222272))

(assert (= (and b!222269 (not c!36931)) b!222270))

(assert (= (and b!222270 c!36934) b!222276))

(assert (= (and b!222270 (not c!36934)) b!222267))

(assert (= (and b!222276 res!109102) b!222271))

(assert (= (and b!222271 res!109105) b!222265))

(assert (= (and b!222267 c!36933) b!222268))

(assert (= (and b!222267 (not c!36933)) b!222288))

(assert (= (and b!222268 res!109099) b!222278))

(assert (= (and b!222278 res!109104) b!222292))

(assert (= (or b!222276 b!222268) bm!20738))

(assert (= (or b!222265 b!222292) bm!20739))

(assert (= (and b!222269 res!109091) b!222281))

(assert (= (and b!222281 c!36932) b!222282))

(assert (= (and b!222281 (not c!36932)) b!222273))

(assert (= (and b!222281 res!109100) b!222279))

(assert (= (and b!222279 res!109106) b!222290))

(assert (= (and b!222290 res!109092) b!222287))

(assert (= (and b!222287 res!109093) b!222283))

(assert (= (and b!222283 res!109101) b!222289))

(assert (= (and b!222283 (not res!109097)) b!222286))

(assert (= (and b!222286 res!109096) b!222291))

(assert (= (and b!222283 res!109103) b!222285))

(assert (= (and b!222274 condMapEmpty!9928) mapIsEmpty!9928))

(assert (= (and b!222274 (not condMapEmpty!9928)) mapNonEmpty!9928))

(assert (= (and mapNonEmpty!9928 ((_ is ValueCellFull!2576) mapValue!9928)) b!222280))

(assert (= (and b!222274 ((_ is ValueCellFull!2576) mapDefault!9928)) b!222266))

(assert (= b!222275 b!222274))

(assert (= start!21914 b!222275))

(declare-fun m!245929 () Bool)

(assert (=> b!222287 m!245929))

(declare-fun m!245931 () Bool)

(assert (=> mapNonEmpty!9928 m!245931))

(declare-fun m!245933 () Bool)

(assert (=> b!222281 m!245933))

(assert (=> bm!20739 m!245933))

(declare-fun m!245935 () Bool)

(assert (=> b!222291 m!245935))

(declare-fun m!245937 () Bool)

(assert (=> b!222282 m!245937))

(declare-fun m!245939 () Bool)

(assert (=> b!222270 m!245939))

(declare-fun m!245941 () Bool)

(assert (=> start!21914 m!245941))

(declare-fun m!245943 () Bool)

(assert (=> b!222278 m!245943))

(declare-fun m!245945 () Bool)

(assert (=> b!222279 m!245945))

(declare-fun m!245947 () Bool)

(assert (=> b!222269 m!245947))

(declare-fun m!245949 () Bool)

(assert (=> b!222269 m!245949))

(assert (=> b!222269 m!245949))

(declare-fun m!245951 () Bool)

(assert (=> b!222269 m!245951))

(declare-fun m!245953 () Bool)

(assert (=> bm!20738 m!245953))

(declare-fun m!245955 () Bool)

(assert (=> b!222275 m!245955))

(declare-fun m!245957 () Bool)

(assert (=> b!222275 m!245957))

(declare-fun m!245959 () Bool)

(assert (=> b!222272 m!245959))

(declare-fun m!245961 () Bool)

(assert (=> b!222271 m!245961))

(assert (=> b!222289 m!245935))

(declare-fun m!245963 () Bool)

(assert (=> b!222285 m!245963))

(declare-fun m!245965 () Bool)

(assert (=> b!222284 m!245965))

(declare-fun m!245967 () Bool)

(assert (=> b!222290 m!245967))

(check-sat (not b!222285) (not b_next!5977) tp_is_empty!5839 (not bm!20739) (not start!21914) (not b!222282) (not b!222279) (not bm!20738) (not b!222290) (not b!222269) (not b!222272) (not b!222289) (not b!222291) (not b!222284) (not b!222281) (not b!222287) b_and!12849 (not b!222270) (not b!222275) (not mapNonEmpty!9928))
(check-sat b_and!12849 (not b_next!5977))
