; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23086 () Bool)

(assert start!23086)

(declare-fun b!242027 () Bool)

(declare-fun b_free!6501 () Bool)

(declare-fun b_next!6501 () Bool)

(assert (=> b!242027 (= b_free!6501 (not b_next!6501))))

(declare-fun tp!22714 () Bool)

(declare-fun b_and!13475 () Bool)

(assert (=> b!242027 (= tp!22714 b_and!13475)))

(declare-fun b!242022 () Bool)

(declare-fun e!157079 () Bool)

(declare-fun e!157075 () Bool)

(assert (=> b!242022 (= e!157079 e!157075)))

(declare-fun res!118601 () Bool)

(assert (=> b!242022 (=> (not res!118601) (not e!157075))))

(declare-datatypes ((V!8131 0))(
  ( (V!8132 (val!3226 Int)) )
))
(declare-datatypes ((ValueCell!2838 0))(
  ( (ValueCellFull!2838 (v!5266 V!8131)) (EmptyCell!2838) )
))
(declare-datatypes ((array!12009 0))(
  ( (array!12010 (arr!5704 (Array (_ BitVec 32) ValueCell!2838)) (size!6046 (_ BitVec 32))) )
))
(declare-datatypes ((array!12011 0))(
  ( (array!12012 (arr!5705 (Array (_ BitVec 32) (_ BitVec 64))) (size!6047 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3576 0))(
  ( (LongMapFixedSize!3577 (defaultEntry!4485 Int) (mask!10562 (_ BitVec 32)) (extraKeys!4222 (_ BitVec 32)) (zeroValue!4326 V!8131) (minValue!4326 V!8131) (_size!1837 (_ BitVec 32)) (_keys!6592 array!12011) (_values!4468 array!12009) (_vacant!1837 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3576)

(assert (=> b!242022 (= res!118601 (and (bvslt (size!6047 (_keys!6592 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6047 (_keys!6592 thiss!1504)))))))

(declare-datatypes ((Unit!7460 0))(
  ( (Unit!7461) )
))
(declare-fun lt!121593 () Unit!7460)

(declare-fun e!157078 () Unit!7460)

(assert (=> b!242022 (= lt!121593 e!157078)))

(declare-fun c!40373 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!242022 (= c!40373 (arrayContainsKey!0 (_keys!6592 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!242023 () Bool)

(declare-fun e!157081 () Unit!7460)

(declare-fun Unit!7462 () Unit!7460)

(assert (=> b!242023 (= e!157081 Unit!7462)))

(declare-fun lt!121594 () Unit!7460)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!353 (array!12011 array!12009 (_ BitVec 32) (_ BitVec 32) V!8131 V!8131 (_ BitVec 64) Int) Unit!7460)

(assert (=> b!242023 (= lt!121594 (lemmaInListMapThenSeekEntryOrOpenFindsIt!353 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) key!932 (defaultEntry!4485 thiss!1504)))))

(assert (=> b!242023 false))

(declare-fun mapIsEmpty!10783 () Bool)

(declare-fun mapRes!10783 () Bool)

(assert (=> mapIsEmpty!10783 mapRes!10783))

(declare-fun mapNonEmpty!10783 () Bool)

(declare-fun tp!22713 () Bool)

(declare-fun e!157084 () Bool)

(assert (=> mapNonEmpty!10783 (= mapRes!10783 (and tp!22713 e!157084))))

(declare-fun mapValue!10783 () ValueCell!2838)

(declare-fun mapKey!10783 () (_ BitVec 32))

(declare-fun mapRest!10783 () (Array (_ BitVec 32) ValueCell!2838))

(assert (=> mapNonEmpty!10783 (= (arr!5704 (_values!4468 thiss!1504)) (store mapRest!10783 mapKey!10783 mapValue!10783))))

(declare-fun b!242024 () Bool)

(declare-fun res!118598 () Bool)

(declare-fun e!157087 () Bool)

(assert (=> b!242024 (=> (not res!118598) (not e!157087))))

(assert (=> b!242024 (= res!118598 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!242025 () Bool)

(declare-fun e!157074 () Bool)

(declare-datatypes ((SeekEntryResult!1062 0))(
  ( (MissingZero!1062 (index!6418 (_ BitVec 32))) (Found!1062 (index!6419 (_ BitVec 32))) (Intermediate!1062 (undefined!1874 Bool) (index!6420 (_ BitVec 32)) (x!24250 (_ BitVec 32))) (Undefined!1062) (MissingVacant!1062 (index!6421 (_ BitVec 32))) )
))
(declare-fun lt!121596 () SeekEntryResult!1062)

(get-info :version)

(assert (=> b!242025 (= e!157074 ((_ is Undefined!1062) lt!121596))))

(declare-fun b!242026 () Bool)

(declare-fun e!157083 () Bool)

(declare-fun call!22536 () Bool)

(assert (=> b!242026 (= e!157083 (not call!22536))))

(declare-fun tp_is_empty!6363 () Bool)

(declare-fun e!157080 () Bool)

(declare-fun e!157086 () Bool)

(declare-fun array_inv!3775 (array!12011) Bool)

(declare-fun array_inv!3776 (array!12009) Bool)

(assert (=> b!242027 (= e!157080 (and tp!22714 tp_is_empty!6363 (array_inv!3775 (_keys!6592 thiss!1504)) (array_inv!3776 (_values!4468 thiss!1504)) e!157086))))

(declare-fun b!242028 () Bool)

(declare-fun c!40372 () Bool)

(assert (=> b!242028 (= c!40372 ((_ is MissingVacant!1062) lt!121596))))

(declare-fun e!157077 () Bool)

(assert (=> b!242028 (= e!157077 e!157074)))

(declare-fun b!242029 () Bool)

(declare-fun e!157085 () Bool)

(assert (=> b!242029 (= e!157085 tp_is_empty!6363)))

(declare-fun b!242030 () Bool)

(declare-fun Unit!7463 () Unit!7460)

(assert (=> b!242030 (= e!157078 Unit!7463)))

(declare-fun b!242031 () Bool)

(declare-fun Unit!7464 () Unit!7460)

(assert (=> b!242031 (= e!157078 Unit!7464)))

(declare-fun lt!121597 () Unit!7460)

(declare-fun lemmaArrayContainsKeyThenInListMap!156 (array!12011 array!12009 (_ BitVec 32) (_ BitVec 32) V!8131 V!8131 (_ BitVec 64) (_ BitVec 32) Int) Unit!7460)

(assert (=> b!242031 (= lt!121597 (lemmaArrayContainsKeyThenInListMap!156 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4485 thiss!1504)))))

(assert (=> b!242031 false))

(declare-fun b!242032 () Bool)

(declare-fun res!118600 () Bool)

(assert (=> b!242032 (=> (not res!118600) (not e!157083))))

(assert (=> b!242032 (= res!118600 (= (select (arr!5705 (_keys!6592 thiss!1504)) (index!6418 lt!121596)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242033 () Bool)

(declare-fun e!157076 () Bool)

(assert (=> b!242033 (= e!157076 e!157079)))

(declare-fun res!118602 () Bool)

(assert (=> b!242033 (=> (not res!118602) (not e!157079))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242033 (= res!118602 (inRange!0 index!297 (mask!10562 thiss!1504)))))

(declare-fun lt!121595 () Unit!7460)

(assert (=> b!242033 (= lt!121595 e!157081)))

(declare-fun c!40371 () Bool)

(declare-datatypes ((tuple2!4752 0))(
  ( (tuple2!4753 (_1!2387 (_ BitVec 64)) (_2!2387 V!8131)) )
))
(declare-datatypes ((List!3630 0))(
  ( (Nil!3627) (Cons!3626 (h!4283 tuple2!4752) (t!8629 List!3630)) )
))
(declare-datatypes ((ListLongMap!3665 0))(
  ( (ListLongMap!3666 (toList!1848 List!3630)) )
))
(declare-fun contains!1738 (ListLongMap!3665 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1376 (array!12011 array!12009 (_ BitVec 32) (_ BitVec 32) V!8131 V!8131 (_ BitVec 32) Int) ListLongMap!3665)

(assert (=> b!242033 (= c!40371 (contains!1738 (getCurrentListMap!1376 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4485 thiss!1504)) key!932))))

(declare-fun b!242034 () Bool)

(declare-fun e!157073 () Bool)

(assert (=> b!242034 (= e!157074 e!157073)))

(declare-fun res!118599 () Bool)

(declare-fun call!22535 () Bool)

(assert (=> b!242034 (= res!118599 call!22535)))

(assert (=> b!242034 (=> (not res!118599) (not e!157073))))

(declare-fun res!118605 () Bool)

(assert (=> start!23086 (=> (not res!118605) (not e!157087))))

(declare-fun valid!1404 (LongMapFixedSize!3576) Bool)

(assert (=> start!23086 (= res!118605 (valid!1404 thiss!1504))))

(assert (=> start!23086 e!157087))

(assert (=> start!23086 e!157080))

(assert (=> start!23086 true))

(declare-fun b!242035 () Bool)

(declare-fun lt!121598 () Unit!7460)

(assert (=> b!242035 (= e!157081 lt!121598)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!362 (array!12011 array!12009 (_ BitVec 32) (_ BitVec 32) V!8131 V!8131 (_ BitVec 64) Int) Unit!7460)

(assert (=> b!242035 (= lt!121598 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!362 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) key!932 (defaultEntry!4485 thiss!1504)))))

(declare-fun c!40374 () Bool)

(assert (=> b!242035 (= c!40374 ((_ is MissingZero!1062) lt!121596))))

(assert (=> b!242035 e!157077))

(declare-fun b!242036 () Bool)

(assert (=> b!242036 (= e!157084 tp_is_empty!6363)))

(declare-fun b!242037 () Bool)

(declare-fun res!118597 () Bool)

(assert (=> b!242037 (= res!118597 (= (select (arr!5705 (_keys!6592 thiss!1504)) (index!6421 lt!121596)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242037 (=> (not res!118597) (not e!157073))))

(declare-fun b!242038 () Bool)

(declare-fun res!118603 () Bool)

(assert (=> b!242038 (=> (not res!118603) (not e!157083))))

(assert (=> b!242038 (= res!118603 call!22535)))

(assert (=> b!242038 (= e!157077 e!157083)))

(declare-fun b!242039 () Bool)

(assert (=> b!242039 (= e!157087 e!157076)))

(declare-fun res!118604 () Bool)

(assert (=> b!242039 (=> (not res!118604) (not e!157076))))

(assert (=> b!242039 (= res!118604 (or (= lt!121596 (MissingZero!1062 index!297)) (= lt!121596 (MissingVacant!1062 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12011 (_ BitVec 32)) SeekEntryResult!1062)

(assert (=> b!242039 (= lt!121596 (seekEntryOrOpen!0 key!932 (_keys!6592 thiss!1504) (mask!10562 thiss!1504)))))

(declare-fun b!242040 () Bool)

(declare-datatypes ((List!3631 0))(
  ( (Nil!3628) (Cons!3627 (h!4284 (_ BitVec 64)) (t!8630 List!3631)) )
))
(declare-fun noDuplicate!88 (List!3631) Bool)

(assert (=> b!242040 (= e!157075 (not (noDuplicate!88 Nil!3628)))))

(declare-fun bm!22532 () Bool)

(assert (=> bm!22532 (= call!22536 (arrayContainsKey!0 (_keys!6592 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!242041 () Bool)

(assert (=> b!242041 (= e!157073 (not call!22536))))

(declare-fun b!242042 () Bool)

(assert (=> b!242042 (= e!157086 (and e!157085 mapRes!10783))))

(declare-fun condMapEmpty!10783 () Bool)

(declare-fun mapDefault!10783 () ValueCell!2838)

(assert (=> b!242042 (= condMapEmpty!10783 (= (arr!5704 (_values!4468 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2838)) mapDefault!10783)))))

(declare-fun bm!22533 () Bool)

(assert (=> bm!22533 (= call!22535 (inRange!0 (ite c!40374 (index!6418 lt!121596) (index!6421 lt!121596)) (mask!10562 thiss!1504)))))

(assert (= (and start!23086 res!118605) b!242024))

(assert (= (and b!242024 res!118598) b!242039))

(assert (= (and b!242039 res!118604) b!242033))

(assert (= (and b!242033 c!40371) b!242023))

(assert (= (and b!242033 (not c!40371)) b!242035))

(assert (= (and b!242035 c!40374) b!242038))

(assert (= (and b!242035 (not c!40374)) b!242028))

(assert (= (and b!242038 res!118603) b!242032))

(assert (= (and b!242032 res!118600) b!242026))

(assert (= (and b!242028 c!40372) b!242034))

(assert (= (and b!242028 (not c!40372)) b!242025))

(assert (= (and b!242034 res!118599) b!242037))

(assert (= (and b!242037 res!118597) b!242041))

(assert (= (or b!242038 b!242034) bm!22533))

(assert (= (or b!242026 b!242041) bm!22532))

(assert (= (and b!242033 res!118602) b!242022))

(assert (= (and b!242022 c!40373) b!242031))

(assert (= (and b!242022 (not c!40373)) b!242030))

(assert (= (and b!242022 res!118601) b!242040))

(assert (= (and b!242042 condMapEmpty!10783) mapIsEmpty!10783))

(assert (= (and b!242042 (not condMapEmpty!10783)) mapNonEmpty!10783))

(assert (= (and mapNonEmpty!10783 ((_ is ValueCellFull!2838) mapValue!10783)) b!242036))

(assert (= (and b!242042 ((_ is ValueCellFull!2838) mapDefault!10783)) b!242029))

(assert (= b!242027 b!242042))

(assert (= start!23086 b!242027))

(declare-fun m!261009 () Bool)

(assert (=> b!242037 m!261009))

(declare-fun m!261011 () Bool)

(assert (=> b!242023 m!261011))

(declare-fun m!261013 () Bool)

(assert (=> b!242032 m!261013))

(declare-fun m!261015 () Bool)

(assert (=> b!242033 m!261015))

(declare-fun m!261017 () Bool)

(assert (=> b!242033 m!261017))

(assert (=> b!242033 m!261017))

(declare-fun m!261019 () Bool)

(assert (=> b!242033 m!261019))

(declare-fun m!261021 () Bool)

(assert (=> b!242035 m!261021))

(declare-fun m!261023 () Bool)

(assert (=> bm!22532 m!261023))

(declare-fun m!261025 () Bool)

(assert (=> b!242040 m!261025))

(declare-fun m!261027 () Bool)

(assert (=> start!23086 m!261027))

(declare-fun m!261029 () Bool)

(assert (=> b!242039 m!261029))

(declare-fun m!261031 () Bool)

(assert (=> bm!22533 m!261031))

(assert (=> b!242022 m!261023))

(declare-fun m!261033 () Bool)

(assert (=> b!242031 m!261033))

(declare-fun m!261035 () Bool)

(assert (=> mapNonEmpty!10783 m!261035))

(declare-fun m!261037 () Bool)

(assert (=> b!242027 m!261037))

(declare-fun m!261039 () Bool)

(assert (=> b!242027 m!261039))

(check-sat (not b!242023) (not b!242033) (not bm!22533) (not mapNonEmpty!10783) (not start!23086) (not b!242035) (not b!242022) (not b_next!6501) (not b!242039) (not b!242027) b_and!13475 (not b!242031) tp_is_empty!6363 (not bm!22532) (not b!242040))
(check-sat b_and!13475 (not b_next!6501))
(get-model)

(declare-fun d!59939 () Bool)

(declare-fun res!118637 () Bool)

(declare-fun e!157137 () Bool)

(assert (=> d!59939 (=> res!118637 e!157137)))

(assert (=> d!59939 (= res!118637 (= (select (arr!5705 (_keys!6592 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!59939 (= (arrayContainsKey!0 (_keys!6592 thiss!1504) key!932 #b00000000000000000000000000000000) e!157137)))

(declare-fun b!242110 () Bool)

(declare-fun e!157138 () Bool)

(assert (=> b!242110 (= e!157137 e!157138)))

(declare-fun res!118638 () Bool)

(assert (=> b!242110 (=> (not res!118638) (not e!157138))))

(assert (=> b!242110 (= res!118638 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6047 (_keys!6592 thiss!1504))))))

(declare-fun b!242111 () Bool)

(assert (=> b!242111 (= e!157138 (arrayContainsKey!0 (_keys!6592 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!59939 (not res!118637)) b!242110))

(assert (= (and b!242110 res!118638) b!242111))

(declare-fun m!261073 () Bool)

(assert (=> d!59939 m!261073))

(declare-fun m!261075 () Bool)

(assert (=> b!242111 m!261075))

(assert (=> bm!22532 d!59939))

(assert (=> b!242022 d!59939))

(declare-fun d!59941 () Bool)

(assert (=> d!59941 (contains!1738 (getCurrentListMap!1376 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4485 thiss!1504)) key!932)))

(declare-fun lt!121619 () Unit!7460)

(declare-fun choose!1125 (array!12011 array!12009 (_ BitVec 32) (_ BitVec 32) V!8131 V!8131 (_ BitVec 64) (_ BitVec 32) Int) Unit!7460)

(assert (=> d!59941 (= lt!121619 (choose!1125 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4485 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!59941 (validMask!0 (mask!10562 thiss!1504))))

(assert (=> d!59941 (= (lemmaArrayContainsKeyThenInListMap!156 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4485 thiss!1504)) lt!121619)))

(declare-fun bs!8857 () Bool)

(assert (= bs!8857 d!59941))

(assert (=> bs!8857 m!261017))

(assert (=> bs!8857 m!261017))

(assert (=> bs!8857 m!261019))

(declare-fun m!261077 () Bool)

(assert (=> bs!8857 m!261077))

(declare-fun m!261079 () Bool)

(assert (=> bs!8857 m!261079))

(assert (=> b!242031 d!59941))

(declare-fun d!59943 () Bool)

(declare-fun e!157141 () Bool)

(assert (=> d!59943 e!157141))

(declare-fun res!118644 () Bool)

(assert (=> d!59943 (=> (not res!118644) (not e!157141))))

(declare-fun lt!121624 () SeekEntryResult!1062)

(assert (=> d!59943 (= res!118644 ((_ is Found!1062) lt!121624))))

(assert (=> d!59943 (= lt!121624 (seekEntryOrOpen!0 key!932 (_keys!6592 thiss!1504) (mask!10562 thiss!1504)))))

(declare-fun lt!121625 () Unit!7460)

(declare-fun choose!1126 (array!12011 array!12009 (_ BitVec 32) (_ BitVec 32) V!8131 V!8131 (_ BitVec 64) Int) Unit!7460)

(assert (=> d!59943 (= lt!121625 (choose!1126 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) key!932 (defaultEntry!4485 thiss!1504)))))

(assert (=> d!59943 (validMask!0 (mask!10562 thiss!1504))))

(assert (=> d!59943 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!353 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) key!932 (defaultEntry!4485 thiss!1504)) lt!121625)))

(declare-fun b!242116 () Bool)

(declare-fun res!118643 () Bool)

(assert (=> b!242116 (=> (not res!118643) (not e!157141))))

(assert (=> b!242116 (= res!118643 (inRange!0 (index!6419 lt!121624) (mask!10562 thiss!1504)))))

(declare-fun b!242117 () Bool)

(assert (=> b!242117 (= e!157141 (= (select (arr!5705 (_keys!6592 thiss!1504)) (index!6419 lt!121624)) key!932))))

(assert (=> b!242117 (and (bvsge (index!6419 lt!121624) #b00000000000000000000000000000000) (bvslt (index!6419 lt!121624) (size!6047 (_keys!6592 thiss!1504))))))

(assert (= (and d!59943 res!118644) b!242116))

(assert (= (and b!242116 res!118643) b!242117))

(assert (=> d!59943 m!261029))

(declare-fun m!261081 () Bool)

(assert (=> d!59943 m!261081))

(assert (=> d!59943 m!261079))

(declare-fun m!261083 () Bool)

(assert (=> b!242116 m!261083))

(declare-fun m!261085 () Bool)

(assert (=> b!242117 m!261085))

(assert (=> b!242023 d!59943))

(declare-fun d!59945 () Bool)

(assert (=> d!59945 (= (array_inv!3775 (_keys!6592 thiss!1504)) (bvsge (size!6047 (_keys!6592 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242027 d!59945))

(declare-fun d!59947 () Bool)

(assert (=> d!59947 (= (array_inv!3776 (_values!4468 thiss!1504)) (bvsge (size!6046 (_values!4468 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242027 d!59947))

(declare-fun d!59949 () Bool)

(declare-fun res!118651 () Bool)

(declare-fun e!157144 () Bool)

(assert (=> d!59949 (=> (not res!118651) (not e!157144))))

(declare-fun simpleValid!246 (LongMapFixedSize!3576) Bool)

(assert (=> d!59949 (= res!118651 (simpleValid!246 thiss!1504))))

(assert (=> d!59949 (= (valid!1404 thiss!1504) e!157144)))

(declare-fun b!242124 () Bool)

(declare-fun res!118652 () Bool)

(assert (=> b!242124 (=> (not res!118652) (not e!157144))))

(declare-fun arrayCountValidKeys!0 (array!12011 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!242124 (= res!118652 (= (arrayCountValidKeys!0 (_keys!6592 thiss!1504) #b00000000000000000000000000000000 (size!6047 (_keys!6592 thiss!1504))) (_size!1837 thiss!1504)))))

(declare-fun b!242125 () Bool)

(declare-fun res!118653 () Bool)

(assert (=> b!242125 (=> (not res!118653) (not e!157144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12011 (_ BitVec 32)) Bool)

(assert (=> b!242125 (= res!118653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6592 thiss!1504) (mask!10562 thiss!1504)))))

(declare-fun b!242126 () Bool)

(declare-fun arrayNoDuplicates!0 (array!12011 (_ BitVec 32) List!3631) Bool)

(assert (=> b!242126 (= e!157144 (arrayNoDuplicates!0 (_keys!6592 thiss!1504) #b00000000000000000000000000000000 Nil!3628))))

(assert (= (and d!59949 res!118651) b!242124))

(assert (= (and b!242124 res!118652) b!242125))

(assert (= (and b!242125 res!118653) b!242126))

(declare-fun m!261087 () Bool)

(assert (=> d!59949 m!261087))

(declare-fun m!261089 () Bool)

(assert (=> b!242124 m!261089))

(declare-fun m!261091 () Bool)

(assert (=> b!242125 m!261091))

(declare-fun m!261093 () Bool)

(assert (=> b!242126 m!261093))

(assert (=> start!23086 d!59949))

(declare-fun d!59951 () Bool)

(assert (=> d!59951 (= (inRange!0 index!297 (mask!10562 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10562 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!242033 d!59951))

(declare-fun d!59953 () Bool)

(declare-fun e!157149 () Bool)

(assert (=> d!59953 e!157149))

(declare-fun res!118656 () Bool)

(assert (=> d!59953 (=> res!118656 e!157149)))

(declare-fun lt!121635 () Bool)

(assert (=> d!59953 (= res!118656 (not lt!121635))))

(declare-fun lt!121637 () Bool)

(assert (=> d!59953 (= lt!121635 lt!121637)))

(declare-fun lt!121634 () Unit!7460)

(declare-fun e!157150 () Unit!7460)

(assert (=> d!59953 (= lt!121634 e!157150)))

(declare-fun c!40389 () Bool)

(assert (=> d!59953 (= c!40389 lt!121637)))

(declare-fun containsKey!273 (List!3630 (_ BitVec 64)) Bool)

(assert (=> d!59953 (= lt!121637 (containsKey!273 (toList!1848 (getCurrentListMap!1376 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4485 thiss!1504))) key!932))))

(assert (=> d!59953 (= (contains!1738 (getCurrentListMap!1376 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4485 thiss!1504)) key!932) lt!121635)))

(declare-fun b!242133 () Bool)

(declare-fun lt!121636 () Unit!7460)

(assert (=> b!242133 (= e!157150 lt!121636)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!221 (List!3630 (_ BitVec 64)) Unit!7460)

(assert (=> b!242133 (= lt!121636 (lemmaContainsKeyImpliesGetValueByKeyDefined!221 (toList!1848 (getCurrentListMap!1376 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4485 thiss!1504))) key!932))))

(declare-datatypes ((Option!287 0))(
  ( (Some!286 (v!5268 V!8131)) (None!285) )
))
(declare-fun isDefined!222 (Option!287) Bool)

(declare-fun getValueByKey!281 (List!3630 (_ BitVec 64)) Option!287)

(assert (=> b!242133 (isDefined!222 (getValueByKey!281 (toList!1848 (getCurrentListMap!1376 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4485 thiss!1504))) key!932))))

(declare-fun b!242134 () Bool)

(declare-fun Unit!7469 () Unit!7460)

(assert (=> b!242134 (= e!157150 Unit!7469)))

(declare-fun b!242135 () Bool)

(assert (=> b!242135 (= e!157149 (isDefined!222 (getValueByKey!281 (toList!1848 (getCurrentListMap!1376 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4485 thiss!1504))) key!932)))))

(assert (= (and d!59953 c!40389) b!242133))

(assert (= (and d!59953 (not c!40389)) b!242134))

(assert (= (and d!59953 (not res!118656)) b!242135))

(declare-fun m!261095 () Bool)

(assert (=> d!59953 m!261095))

(declare-fun m!261097 () Bool)

(assert (=> b!242133 m!261097))

(declare-fun m!261099 () Bool)

(assert (=> b!242133 m!261099))

(assert (=> b!242133 m!261099))

(declare-fun m!261101 () Bool)

(assert (=> b!242133 m!261101))

(assert (=> b!242135 m!261099))

(assert (=> b!242135 m!261099))

(assert (=> b!242135 m!261101))

(assert (=> b!242033 d!59953))

(declare-fun b!242178 () Bool)

(declare-fun e!157178 () Bool)

(declare-fun call!22562 () Bool)

(assert (=> b!242178 (= e!157178 (not call!22562))))

(declare-fun b!242179 () Bool)

(declare-fun c!40404 () Bool)

(assert (=> b!242179 (= c!40404 (and (not (= (bvand (extraKeys!4222 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4222 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!157179 () ListLongMap!3665)

(declare-fun e!157183 () ListLongMap!3665)

(assert (=> b!242179 (= e!157179 e!157183)))

(declare-fun bm!22554 () Bool)

(declare-fun call!22559 () Bool)

(declare-fun lt!121686 () ListLongMap!3665)

(assert (=> bm!22554 (= call!22559 (contains!1738 lt!121686 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242181 () Bool)

(declare-fun e!157185 () Unit!7460)

(declare-fun lt!121682 () Unit!7460)

(assert (=> b!242181 (= e!157185 lt!121682)))

(declare-fun lt!121694 () ListLongMap!3665)

(declare-fun getCurrentListMapNoExtraKeys!545 (array!12011 array!12009 (_ BitVec 32) (_ BitVec 32) V!8131 V!8131 (_ BitVec 32) Int) ListLongMap!3665)

(assert (=> b!242181 (= lt!121694 (getCurrentListMapNoExtraKeys!545 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4485 thiss!1504)))))

(declare-fun lt!121702 () (_ BitVec 64))

(assert (=> b!242181 (= lt!121702 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121687 () (_ BitVec 64))

(assert (=> b!242181 (= lt!121687 (select (arr!5705 (_keys!6592 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121689 () Unit!7460)

(declare-fun addStillContains!199 (ListLongMap!3665 (_ BitVec 64) V!8131 (_ BitVec 64)) Unit!7460)

(assert (=> b!242181 (= lt!121689 (addStillContains!199 lt!121694 lt!121702 (zeroValue!4326 thiss!1504) lt!121687))))

(declare-fun +!650 (ListLongMap!3665 tuple2!4752) ListLongMap!3665)

(assert (=> b!242181 (contains!1738 (+!650 lt!121694 (tuple2!4753 lt!121702 (zeroValue!4326 thiss!1504))) lt!121687)))

(declare-fun lt!121685 () Unit!7460)

(assert (=> b!242181 (= lt!121685 lt!121689)))

(declare-fun lt!121699 () ListLongMap!3665)

(assert (=> b!242181 (= lt!121699 (getCurrentListMapNoExtraKeys!545 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4485 thiss!1504)))))

(declare-fun lt!121696 () (_ BitVec 64))

(assert (=> b!242181 (= lt!121696 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121690 () (_ BitVec 64))

(assert (=> b!242181 (= lt!121690 (select (arr!5705 (_keys!6592 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121698 () Unit!7460)

(declare-fun addApplyDifferent!199 (ListLongMap!3665 (_ BitVec 64) V!8131 (_ BitVec 64)) Unit!7460)

(assert (=> b!242181 (= lt!121698 (addApplyDifferent!199 lt!121699 lt!121696 (minValue!4326 thiss!1504) lt!121690))))

(declare-fun apply!223 (ListLongMap!3665 (_ BitVec 64)) V!8131)

(assert (=> b!242181 (= (apply!223 (+!650 lt!121699 (tuple2!4753 lt!121696 (minValue!4326 thiss!1504))) lt!121690) (apply!223 lt!121699 lt!121690))))

(declare-fun lt!121691 () Unit!7460)

(assert (=> b!242181 (= lt!121691 lt!121698)))

(declare-fun lt!121703 () ListLongMap!3665)

(assert (=> b!242181 (= lt!121703 (getCurrentListMapNoExtraKeys!545 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4485 thiss!1504)))))

(declare-fun lt!121693 () (_ BitVec 64))

(assert (=> b!242181 (= lt!121693 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121683 () (_ BitVec 64))

(assert (=> b!242181 (= lt!121683 (select (arr!5705 (_keys!6592 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121697 () Unit!7460)

(assert (=> b!242181 (= lt!121697 (addApplyDifferent!199 lt!121703 lt!121693 (zeroValue!4326 thiss!1504) lt!121683))))

(assert (=> b!242181 (= (apply!223 (+!650 lt!121703 (tuple2!4753 lt!121693 (zeroValue!4326 thiss!1504))) lt!121683) (apply!223 lt!121703 lt!121683))))

(declare-fun lt!121692 () Unit!7460)

(assert (=> b!242181 (= lt!121692 lt!121697)))

(declare-fun lt!121688 () ListLongMap!3665)

(assert (=> b!242181 (= lt!121688 (getCurrentListMapNoExtraKeys!545 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4485 thiss!1504)))))

(declare-fun lt!121700 () (_ BitVec 64))

(assert (=> b!242181 (= lt!121700 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121684 () (_ BitVec 64))

(assert (=> b!242181 (= lt!121684 (select (arr!5705 (_keys!6592 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242181 (= lt!121682 (addApplyDifferent!199 lt!121688 lt!121700 (minValue!4326 thiss!1504) lt!121684))))

(assert (=> b!242181 (= (apply!223 (+!650 lt!121688 (tuple2!4753 lt!121700 (minValue!4326 thiss!1504))) lt!121684) (apply!223 lt!121688 lt!121684))))

(declare-fun b!242182 () Bool)

(declare-fun e!157177 () Bool)

(assert (=> b!242182 (= e!157177 (= (apply!223 lt!121686 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4326 thiss!1504)))))

(declare-fun b!242183 () Bool)

(declare-fun call!22563 () ListLongMap!3665)

(assert (=> b!242183 (= e!157183 call!22563)))

(declare-fun b!242184 () Bool)

(declare-fun e!157188 () ListLongMap!3665)

(assert (=> b!242184 (= e!157188 e!157179)))

(declare-fun c!40403 () Bool)

(assert (=> b!242184 (= c!40403 (and (not (= (bvand (extraKeys!4222 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4222 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22555 () Bool)

(declare-fun call!22561 () ListLongMap!3665)

(declare-fun call!22558 () ListLongMap!3665)

(assert (=> bm!22555 (= call!22561 call!22558)))

(declare-fun b!242185 () Bool)

(declare-fun e!157182 () Bool)

(assert (=> b!242185 (= e!157182 e!157177)))

(declare-fun res!118675 () Bool)

(assert (=> b!242185 (= res!118675 call!22559)))

(assert (=> b!242185 (=> (not res!118675) (not e!157177))))

(declare-fun b!242186 () Bool)

(declare-fun e!157189 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!242186 (= e!157189 (validKeyInArray!0 (select (arr!5705 (_keys!6592 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!242187 () Bool)

(declare-fun e!157187 () Bool)

(assert (=> b!242187 (= e!157187 e!157178)))

(declare-fun c!40407 () Bool)

(assert (=> b!242187 (= c!40407 (not (= (bvand (extraKeys!4222 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!242188 () Bool)

(declare-fun res!118676 () Bool)

(assert (=> b!242188 (=> (not res!118676) (not e!157187))))

(assert (=> b!242188 (= res!118676 e!157182)))

(declare-fun c!40406 () Bool)

(assert (=> b!242188 (= c!40406 (not (= (bvand (extraKeys!4222 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun call!22560 () ListLongMap!3665)

(declare-fun call!22557 () ListLongMap!3665)

(declare-fun c!40405 () Bool)

(declare-fun bm!22556 () Bool)

(assert (=> bm!22556 (= call!22558 (+!650 (ite c!40405 call!22560 (ite c!40403 call!22557 call!22563)) (ite (or c!40405 c!40403) (tuple2!4753 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4326 thiss!1504)) (tuple2!4753 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4326 thiss!1504)))))))

(declare-fun b!242180 () Bool)

(assert (=> b!242180 (= e!157183 call!22561)))

(declare-fun d!59955 () Bool)

(assert (=> d!59955 e!157187))

(declare-fun res!118680 () Bool)

(assert (=> d!59955 (=> (not res!118680) (not e!157187))))

(assert (=> d!59955 (= res!118680 (or (bvsge #b00000000000000000000000000000000 (size!6047 (_keys!6592 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6047 (_keys!6592 thiss!1504))))))))

(declare-fun lt!121695 () ListLongMap!3665)

(assert (=> d!59955 (= lt!121686 lt!121695)))

(declare-fun lt!121701 () Unit!7460)

(assert (=> d!59955 (= lt!121701 e!157185)))

(declare-fun c!40402 () Bool)

(declare-fun e!157181 () Bool)

(assert (=> d!59955 (= c!40402 e!157181)))

(declare-fun res!118683 () Bool)

(assert (=> d!59955 (=> (not res!118683) (not e!157181))))

(assert (=> d!59955 (= res!118683 (bvslt #b00000000000000000000000000000000 (size!6047 (_keys!6592 thiss!1504))))))

(assert (=> d!59955 (= lt!121695 e!157188)))

(assert (=> d!59955 (= c!40405 (and (not (= (bvand (extraKeys!4222 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4222 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59955 (validMask!0 (mask!10562 thiss!1504))))

(assert (=> d!59955 (= (getCurrentListMap!1376 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4485 thiss!1504)) lt!121686)))

(declare-fun b!242189 () Bool)

(declare-fun Unit!7470 () Unit!7460)

(assert (=> b!242189 (= e!157185 Unit!7470)))

(declare-fun bm!22557 () Bool)

(assert (=> bm!22557 (= call!22560 (getCurrentListMapNoExtraKeys!545 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4485 thiss!1504)))))

(declare-fun b!242190 () Bool)

(declare-fun e!157180 () Bool)

(assert (=> b!242190 (= e!157178 e!157180)))

(declare-fun res!118677 () Bool)

(assert (=> b!242190 (= res!118677 call!22562)))

(assert (=> b!242190 (=> (not res!118677) (not e!157180))))

(declare-fun b!242191 () Bool)

(declare-fun res!118682 () Bool)

(assert (=> b!242191 (=> (not res!118682) (not e!157187))))

(declare-fun e!157184 () Bool)

(assert (=> b!242191 (= res!118682 e!157184)))

(declare-fun res!118678 () Bool)

(assert (=> b!242191 (=> res!118678 e!157184)))

(assert (=> b!242191 (= res!118678 (not e!157189))))

(declare-fun res!118679 () Bool)

(assert (=> b!242191 (=> (not res!118679) (not e!157189))))

(assert (=> b!242191 (= res!118679 (bvslt #b00000000000000000000000000000000 (size!6047 (_keys!6592 thiss!1504))))))

(declare-fun b!242192 () Bool)

(declare-fun e!157186 () Bool)

(declare-fun get!2929 (ValueCell!2838 V!8131) V!8131)

(declare-fun dynLambda!566 (Int (_ BitVec 64)) V!8131)

(assert (=> b!242192 (= e!157186 (= (apply!223 lt!121686 (select (arr!5705 (_keys!6592 thiss!1504)) #b00000000000000000000000000000000)) (get!2929 (select (arr!5704 (_values!4468 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!566 (defaultEntry!4485 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!242192 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6046 (_values!4468 thiss!1504))))))

(assert (=> b!242192 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6047 (_keys!6592 thiss!1504))))))

(declare-fun b!242193 () Bool)

(assert (=> b!242193 (= e!157188 (+!650 call!22558 (tuple2!4753 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4326 thiss!1504))))))

(declare-fun bm!22558 () Bool)

(assert (=> bm!22558 (= call!22557 call!22560)))

(declare-fun b!242194 () Bool)

(assert (=> b!242194 (= e!157179 call!22561)))

(declare-fun b!242195 () Bool)

(assert (=> b!242195 (= e!157180 (= (apply!223 lt!121686 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4326 thiss!1504)))))

(declare-fun bm!22559 () Bool)

(assert (=> bm!22559 (= call!22563 call!22557)))

(declare-fun b!242196 () Bool)

(assert (=> b!242196 (= e!157184 e!157186)))

(declare-fun res!118681 () Bool)

(assert (=> b!242196 (=> (not res!118681) (not e!157186))))

(assert (=> b!242196 (= res!118681 (contains!1738 lt!121686 (select (arr!5705 (_keys!6592 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!242196 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6047 (_keys!6592 thiss!1504))))))

(declare-fun b!242197 () Bool)

(assert (=> b!242197 (= e!157182 (not call!22559))))

(declare-fun b!242198 () Bool)

(assert (=> b!242198 (= e!157181 (validKeyInArray!0 (select (arr!5705 (_keys!6592 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22560 () Bool)

(assert (=> bm!22560 (= call!22562 (contains!1738 lt!121686 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!59955 c!40405) b!242193))

(assert (= (and d!59955 (not c!40405)) b!242184))

(assert (= (and b!242184 c!40403) b!242194))

(assert (= (and b!242184 (not c!40403)) b!242179))

(assert (= (and b!242179 c!40404) b!242180))

(assert (= (and b!242179 (not c!40404)) b!242183))

(assert (= (or b!242180 b!242183) bm!22559))

(assert (= (or b!242194 bm!22559) bm!22558))

(assert (= (or b!242194 b!242180) bm!22555))

(assert (= (or b!242193 bm!22558) bm!22557))

(assert (= (or b!242193 bm!22555) bm!22556))

(assert (= (and d!59955 res!118683) b!242198))

(assert (= (and d!59955 c!40402) b!242181))

(assert (= (and d!59955 (not c!40402)) b!242189))

(assert (= (and d!59955 res!118680) b!242191))

(assert (= (and b!242191 res!118679) b!242186))

(assert (= (and b!242191 (not res!118678)) b!242196))

(assert (= (and b!242196 res!118681) b!242192))

(assert (= (and b!242191 res!118682) b!242188))

(assert (= (and b!242188 c!40406) b!242185))

(assert (= (and b!242188 (not c!40406)) b!242197))

(assert (= (and b!242185 res!118675) b!242182))

(assert (= (or b!242185 b!242197) bm!22554))

(assert (= (and b!242188 res!118676) b!242187))

(assert (= (and b!242187 c!40407) b!242190))

(assert (= (and b!242187 (not c!40407)) b!242178))

(assert (= (and b!242190 res!118677) b!242195))

(assert (= (or b!242190 b!242178) bm!22560))

(declare-fun b_lambda!7995 () Bool)

(assert (=> (not b_lambda!7995) (not b!242192)))

(declare-fun t!8633 () Bool)

(declare-fun tb!2959 () Bool)

(assert (=> (and b!242027 (= (defaultEntry!4485 thiss!1504) (defaultEntry!4485 thiss!1504)) t!8633) tb!2959))

(declare-fun result!5199 () Bool)

(assert (=> tb!2959 (= result!5199 tp_is_empty!6363)))

(assert (=> b!242192 t!8633))

(declare-fun b_and!13479 () Bool)

(assert (= b_and!13475 (and (=> t!8633 result!5199) b_and!13479)))

(declare-fun m!261103 () Bool)

(assert (=> bm!22560 m!261103))

(assert (=> d!59955 m!261079))

(assert (=> b!242198 m!261073))

(assert (=> b!242198 m!261073))

(declare-fun m!261105 () Bool)

(assert (=> b!242198 m!261105))

(declare-fun m!261107 () Bool)

(assert (=> bm!22556 m!261107))

(declare-fun m!261109 () Bool)

(assert (=> b!242193 m!261109))

(assert (=> b!242186 m!261073))

(assert (=> b!242186 m!261073))

(assert (=> b!242186 m!261105))

(declare-fun m!261111 () Bool)

(assert (=> bm!22557 m!261111))

(declare-fun m!261113 () Bool)

(assert (=> b!242195 m!261113))

(assert (=> b!242196 m!261073))

(assert (=> b!242196 m!261073))

(declare-fun m!261115 () Bool)

(assert (=> b!242196 m!261115))

(declare-fun m!261117 () Bool)

(assert (=> b!242182 m!261117))

(assert (=> b!242192 m!261073))

(declare-fun m!261119 () Bool)

(assert (=> b!242192 m!261119))

(declare-fun m!261121 () Bool)

(assert (=> b!242192 m!261121))

(declare-fun m!261123 () Bool)

(assert (=> b!242192 m!261123))

(declare-fun m!261125 () Bool)

(assert (=> b!242192 m!261125))

(assert (=> b!242192 m!261073))

(assert (=> b!242192 m!261121))

(assert (=> b!242192 m!261123))

(declare-fun m!261127 () Bool)

(assert (=> b!242181 m!261127))

(declare-fun m!261129 () Bool)

(assert (=> b!242181 m!261129))

(declare-fun m!261131 () Bool)

(assert (=> b!242181 m!261131))

(declare-fun m!261133 () Bool)

(assert (=> b!242181 m!261133))

(declare-fun m!261135 () Bool)

(assert (=> b!242181 m!261135))

(declare-fun m!261137 () Bool)

(assert (=> b!242181 m!261137))

(declare-fun m!261139 () Bool)

(assert (=> b!242181 m!261139))

(assert (=> b!242181 m!261111))

(declare-fun m!261141 () Bool)

(assert (=> b!242181 m!261141))

(declare-fun m!261143 () Bool)

(assert (=> b!242181 m!261143))

(declare-fun m!261145 () Bool)

(assert (=> b!242181 m!261145))

(declare-fun m!261147 () Bool)

(assert (=> b!242181 m!261147))

(assert (=> b!242181 m!261129))

(declare-fun m!261149 () Bool)

(assert (=> b!242181 m!261149))

(declare-fun m!261151 () Bool)

(assert (=> b!242181 m!261151))

(declare-fun m!261153 () Bool)

(assert (=> b!242181 m!261153))

(assert (=> b!242181 m!261073))

(assert (=> b!242181 m!261151))

(declare-fun m!261155 () Bool)

(assert (=> b!242181 m!261155))

(assert (=> b!242181 m!261145))

(assert (=> b!242181 m!261135))

(declare-fun m!261157 () Bool)

(assert (=> bm!22554 m!261157))

(assert (=> b!242033 d!59955))

(declare-fun d!59957 () Bool)

(assert (=> d!59957 (= (inRange!0 (ite c!40374 (index!6418 lt!121596) (index!6421 lt!121596)) (mask!10562 thiss!1504)) (and (bvsge (ite c!40374 (index!6418 lt!121596) (index!6421 lt!121596)) #b00000000000000000000000000000000) (bvslt (ite c!40374 (index!6418 lt!121596) (index!6421 lt!121596)) (bvadd (mask!10562 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22533 d!59957))

(declare-fun b!242213 () Bool)

(declare-fun e!157197 () SeekEntryResult!1062)

(declare-fun e!157198 () SeekEntryResult!1062)

(assert (=> b!242213 (= e!157197 e!157198)))

(declare-fun lt!121712 () (_ BitVec 64))

(declare-fun lt!121711 () SeekEntryResult!1062)

(assert (=> b!242213 (= lt!121712 (select (arr!5705 (_keys!6592 thiss!1504)) (index!6420 lt!121711)))))

(declare-fun c!40415 () Bool)

(assert (=> b!242213 (= c!40415 (= lt!121712 key!932))))

(declare-fun d!59959 () Bool)

(declare-fun lt!121710 () SeekEntryResult!1062)

(assert (=> d!59959 (and (or ((_ is Undefined!1062) lt!121710) (not ((_ is Found!1062) lt!121710)) (and (bvsge (index!6419 lt!121710) #b00000000000000000000000000000000) (bvslt (index!6419 lt!121710) (size!6047 (_keys!6592 thiss!1504))))) (or ((_ is Undefined!1062) lt!121710) ((_ is Found!1062) lt!121710) (not ((_ is MissingZero!1062) lt!121710)) (and (bvsge (index!6418 lt!121710) #b00000000000000000000000000000000) (bvslt (index!6418 lt!121710) (size!6047 (_keys!6592 thiss!1504))))) (or ((_ is Undefined!1062) lt!121710) ((_ is Found!1062) lt!121710) ((_ is MissingZero!1062) lt!121710) (not ((_ is MissingVacant!1062) lt!121710)) (and (bvsge (index!6421 lt!121710) #b00000000000000000000000000000000) (bvslt (index!6421 lt!121710) (size!6047 (_keys!6592 thiss!1504))))) (or ((_ is Undefined!1062) lt!121710) (ite ((_ is Found!1062) lt!121710) (= (select (arr!5705 (_keys!6592 thiss!1504)) (index!6419 lt!121710)) key!932) (ite ((_ is MissingZero!1062) lt!121710) (= (select (arr!5705 (_keys!6592 thiss!1504)) (index!6418 lt!121710)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1062) lt!121710) (= (select (arr!5705 (_keys!6592 thiss!1504)) (index!6421 lt!121710)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59959 (= lt!121710 e!157197)))

(declare-fun c!40416 () Bool)

(assert (=> d!59959 (= c!40416 (and ((_ is Intermediate!1062) lt!121711) (undefined!1874 lt!121711)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12011 (_ BitVec 32)) SeekEntryResult!1062)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59959 (= lt!121711 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10562 thiss!1504)) key!932 (_keys!6592 thiss!1504) (mask!10562 thiss!1504)))))

(assert (=> d!59959 (validMask!0 (mask!10562 thiss!1504))))

(assert (=> d!59959 (= (seekEntryOrOpen!0 key!932 (_keys!6592 thiss!1504) (mask!10562 thiss!1504)) lt!121710)))

(declare-fun b!242214 () Bool)

(assert (=> b!242214 (= e!157197 Undefined!1062)))

(declare-fun e!157196 () SeekEntryResult!1062)

(declare-fun b!242215 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12011 (_ BitVec 32)) SeekEntryResult!1062)

(assert (=> b!242215 (= e!157196 (seekKeyOrZeroReturnVacant!0 (x!24250 lt!121711) (index!6420 lt!121711) (index!6420 lt!121711) key!932 (_keys!6592 thiss!1504) (mask!10562 thiss!1504)))))

(declare-fun b!242216 () Bool)

(assert (=> b!242216 (= e!157196 (MissingZero!1062 (index!6420 lt!121711)))))

(declare-fun b!242217 () Bool)

(declare-fun c!40414 () Bool)

(assert (=> b!242217 (= c!40414 (= lt!121712 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242217 (= e!157198 e!157196)))

(declare-fun b!242218 () Bool)

(assert (=> b!242218 (= e!157198 (Found!1062 (index!6420 lt!121711)))))

(assert (= (and d!59959 c!40416) b!242214))

(assert (= (and d!59959 (not c!40416)) b!242213))

(assert (= (and b!242213 c!40415) b!242218))

(assert (= (and b!242213 (not c!40415)) b!242217))

(assert (= (and b!242217 c!40414) b!242216))

(assert (= (and b!242217 (not c!40414)) b!242215))

(declare-fun m!261159 () Bool)

(assert (=> b!242213 m!261159))

(declare-fun m!261161 () Bool)

(assert (=> d!59959 m!261161))

(declare-fun m!261163 () Bool)

(assert (=> d!59959 m!261163))

(assert (=> d!59959 m!261079))

(declare-fun m!261165 () Bool)

(assert (=> d!59959 m!261165))

(assert (=> d!59959 m!261165))

(declare-fun m!261167 () Bool)

(assert (=> d!59959 m!261167))

(declare-fun m!261169 () Bool)

(assert (=> d!59959 m!261169))

(declare-fun m!261171 () Bool)

(assert (=> b!242215 m!261171))

(assert (=> b!242039 d!59959))

(declare-fun d!59961 () Bool)

(declare-fun res!118688 () Bool)

(declare-fun e!157203 () Bool)

(assert (=> d!59961 (=> res!118688 e!157203)))

(assert (=> d!59961 (= res!118688 ((_ is Nil!3628) Nil!3628))))

(assert (=> d!59961 (= (noDuplicate!88 Nil!3628) e!157203)))

(declare-fun b!242223 () Bool)

(declare-fun e!157204 () Bool)

(assert (=> b!242223 (= e!157203 e!157204)))

(declare-fun res!118689 () Bool)

(assert (=> b!242223 (=> (not res!118689) (not e!157204))))

(declare-fun contains!1740 (List!3631 (_ BitVec 64)) Bool)

(assert (=> b!242223 (= res!118689 (not (contains!1740 (t!8630 Nil!3628) (h!4284 Nil!3628))))))

(declare-fun b!242224 () Bool)

(assert (=> b!242224 (= e!157204 (noDuplicate!88 (t!8630 Nil!3628)))))

(assert (= (and d!59961 (not res!118688)) b!242223))

(assert (= (and b!242223 res!118689) b!242224))

(declare-fun m!261173 () Bool)

(assert (=> b!242223 m!261173))

(declare-fun m!261175 () Bool)

(assert (=> b!242224 m!261175))

(assert (=> b!242040 d!59961))

(declare-fun bm!22565 () Bool)

(declare-fun call!22569 () Bool)

(assert (=> bm!22565 (= call!22569 (arrayContainsKey!0 (_keys!6592 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!242241 () Bool)

(declare-fun e!157216 () Bool)

(assert (=> b!242241 (= e!157216 (not call!22569))))

(declare-fun lt!121717 () SeekEntryResult!1062)

(declare-fun c!40422 () Bool)

(declare-fun bm!22566 () Bool)

(declare-fun call!22568 () Bool)

(assert (=> bm!22566 (= call!22568 (inRange!0 (ite c!40422 (index!6418 lt!121717) (index!6421 lt!121717)) (mask!10562 thiss!1504)))))

(declare-fun b!242243 () Bool)

(declare-fun res!118698 () Bool)

(assert (=> b!242243 (=> (not res!118698) (not e!157216))))

(assert (=> b!242243 (= res!118698 (= (select (arr!5705 (_keys!6592 thiss!1504)) (index!6421 lt!121717)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242243 (and (bvsge (index!6421 lt!121717) #b00000000000000000000000000000000) (bvslt (index!6421 lt!121717) (size!6047 (_keys!6592 thiss!1504))))))

(declare-fun b!242244 () Bool)

(declare-fun e!157213 () Bool)

(declare-fun e!157215 () Bool)

(assert (=> b!242244 (= e!157213 e!157215)))

(declare-fun c!40421 () Bool)

(assert (=> b!242244 (= c!40421 ((_ is MissingVacant!1062) lt!121717))))

(declare-fun b!242245 () Bool)

(declare-fun res!118701 () Bool)

(assert (=> b!242245 (=> (not res!118701) (not e!157216))))

(assert (=> b!242245 (= res!118701 call!22568)))

(assert (=> b!242245 (= e!157215 e!157216)))

(declare-fun d!59963 () Bool)

(assert (=> d!59963 e!157213))

(assert (=> d!59963 (= c!40422 ((_ is MissingZero!1062) lt!121717))))

(assert (=> d!59963 (= lt!121717 (seekEntryOrOpen!0 key!932 (_keys!6592 thiss!1504) (mask!10562 thiss!1504)))))

(declare-fun lt!121718 () Unit!7460)

(declare-fun choose!1127 (array!12011 array!12009 (_ BitVec 32) (_ BitVec 32) V!8131 V!8131 (_ BitVec 64) Int) Unit!7460)

(assert (=> d!59963 (= lt!121718 (choose!1127 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) key!932 (defaultEntry!4485 thiss!1504)))))

(assert (=> d!59963 (validMask!0 (mask!10562 thiss!1504))))

(assert (=> d!59963 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!362 (_keys!6592 thiss!1504) (_values!4468 thiss!1504) (mask!10562 thiss!1504) (extraKeys!4222 thiss!1504) (zeroValue!4326 thiss!1504) (minValue!4326 thiss!1504) key!932 (defaultEntry!4485 thiss!1504)) lt!121718)))

(declare-fun b!242242 () Bool)

(assert (=> b!242242 (= e!157215 ((_ is Undefined!1062) lt!121717))))

(declare-fun b!242246 () Bool)

(declare-fun e!157214 () Bool)

(assert (=> b!242246 (= e!157214 (not call!22569))))

(declare-fun b!242247 () Bool)

(assert (=> b!242247 (= e!157213 e!157214)))

(declare-fun res!118699 () Bool)

(assert (=> b!242247 (= res!118699 call!22568)))

(assert (=> b!242247 (=> (not res!118699) (not e!157214))))

(declare-fun b!242248 () Bool)

(assert (=> b!242248 (and (bvsge (index!6418 lt!121717) #b00000000000000000000000000000000) (bvslt (index!6418 lt!121717) (size!6047 (_keys!6592 thiss!1504))))))

(declare-fun res!118700 () Bool)

(assert (=> b!242248 (= res!118700 (= (select (arr!5705 (_keys!6592 thiss!1504)) (index!6418 lt!121717)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242248 (=> (not res!118700) (not e!157214))))

(assert (= (and d!59963 c!40422) b!242247))

(assert (= (and d!59963 (not c!40422)) b!242244))

(assert (= (and b!242247 res!118699) b!242248))

(assert (= (and b!242248 res!118700) b!242246))

(assert (= (and b!242244 c!40421) b!242245))

(assert (= (and b!242244 (not c!40421)) b!242242))

(assert (= (and b!242245 res!118701) b!242243))

(assert (= (and b!242243 res!118698) b!242241))

(assert (= (or b!242247 b!242245) bm!22566))

(assert (= (or b!242246 b!242241) bm!22565))

(assert (=> d!59963 m!261029))

(declare-fun m!261177 () Bool)

(assert (=> d!59963 m!261177))

(assert (=> d!59963 m!261079))

(declare-fun m!261179 () Bool)

(assert (=> b!242248 m!261179))

(declare-fun m!261181 () Bool)

(assert (=> b!242243 m!261181))

(assert (=> bm!22565 m!261023))

(declare-fun m!261183 () Bool)

(assert (=> bm!22566 m!261183))

(assert (=> b!242035 d!59963))

(declare-fun b!242256 () Bool)

(declare-fun e!157221 () Bool)

(assert (=> b!242256 (= e!157221 tp_is_empty!6363)))

(declare-fun mapIsEmpty!10789 () Bool)

(declare-fun mapRes!10789 () Bool)

(assert (=> mapIsEmpty!10789 mapRes!10789))

(declare-fun mapNonEmpty!10789 () Bool)

(declare-fun tp!22723 () Bool)

(declare-fun e!157222 () Bool)

(assert (=> mapNonEmpty!10789 (= mapRes!10789 (and tp!22723 e!157222))))

(declare-fun mapKey!10789 () (_ BitVec 32))

(declare-fun mapValue!10789 () ValueCell!2838)

(declare-fun mapRest!10789 () (Array (_ BitVec 32) ValueCell!2838))

(assert (=> mapNonEmpty!10789 (= mapRest!10783 (store mapRest!10789 mapKey!10789 mapValue!10789))))

(declare-fun condMapEmpty!10789 () Bool)

(declare-fun mapDefault!10789 () ValueCell!2838)

(assert (=> mapNonEmpty!10783 (= condMapEmpty!10789 (= mapRest!10783 ((as const (Array (_ BitVec 32) ValueCell!2838)) mapDefault!10789)))))

(assert (=> mapNonEmpty!10783 (= tp!22713 (and e!157221 mapRes!10789))))

(declare-fun b!242255 () Bool)

(assert (=> b!242255 (= e!157222 tp_is_empty!6363)))

(assert (= (and mapNonEmpty!10783 condMapEmpty!10789) mapIsEmpty!10789))

(assert (= (and mapNonEmpty!10783 (not condMapEmpty!10789)) mapNonEmpty!10789))

(assert (= (and mapNonEmpty!10789 ((_ is ValueCellFull!2838) mapValue!10789)) b!242255))

(assert (= (and mapNonEmpty!10783 ((_ is ValueCellFull!2838) mapDefault!10789)) b!242256))

(declare-fun m!261185 () Bool)

(assert (=> mapNonEmpty!10789 m!261185))

(declare-fun b_lambda!7997 () Bool)

(assert (= b_lambda!7995 (or (and b!242027 b_free!6501) b_lambda!7997)))

(check-sat (not b!242198) tp_is_empty!6363 (not b!242196) (not bm!22557) (not bm!22556) (not b!242215) (not b!242125) (not d!59943) (not b!242224) (not bm!22554) (not d!59959) (not b!242195) (not bm!22565) (not b!242111) (not d!59953) (not b!242135) (not b!242116) (not b!242186) (not b!242126) (not d!59955) (not b!242181) (not b!242192) (not b!242124) (not b!242133) (not b_lambda!7997) (not d!59949) (not b!242182) b_and!13479 (not b!242193) (not b!242223) (not mapNonEmpty!10789) (not bm!22566) (not d!59941) (not b_next!6501) (not bm!22560) (not d!59963))
(check-sat b_and!13479 (not b_next!6501))
