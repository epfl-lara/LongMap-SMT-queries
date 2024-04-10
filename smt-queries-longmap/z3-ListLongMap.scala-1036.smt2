; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21900 () Bool)

(assert start!21900)

(declare-fun b!222007 () Bool)

(declare-fun b_free!5967 () Bool)

(declare-fun b_next!5967 () Bool)

(assert (=> b!222007 (= b_free!5967 (not b_next!5967))))

(declare-fun tp!21043 () Bool)

(declare-fun b_and!12865 () Bool)

(assert (=> b!222007 (= tp!21043 b_and!12865)))

(declare-fun b!221992 () Bool)

(declare-fun e!144264 () Bool)

(declare-fun e!144269 () Bool)

(assert (=> b!221992 (= e!144264 e!144269)))

(declare-fun res!108949 () Bool)

(declare-fun call!20736 () Bool)

(assert (=> b!221992 (= res!108949 call!20736)))

(assert (=> b!221992 (=> (not res!108949) (not e!144269))))

(declare-datatypes ((V!7419 0))(
  ( (V!7420 (val!2959 Int)) )
))
(declare-datatypes ((ValueCell!2571 0))(
  ( (ValueCellFull!2571 (v!4979 V!7419)) (EmptyCell!2571) )
))
(declare-datatypes ((array!10901 0))(
  ( (array!10902 (arr!5170 (Array (_ BitVec 32) ValueCell!2571)) (size!5503 (_ BitVec 32))) )
))
(declare-datatypes ((array!10903 0))(
  ( (array!10904 (arr!5171 (Array (_ BitVec 32) (_ BitVec 64))) (size!5504 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3042 0))(
  ( (LongMapFixedSize!3043 (defaultEntry!4180 Int) (mask!9996 (_ BitVec 32)) (extraKeys!3917 (_ BitVec 32)) (zeroValue!4021 V!7419) (minValue!4021 V!7419) (_size!1570 (_ BitVec 32)) (_keys!6234 array!10903) (_values!4163 array!10901) (_vacant!1570 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3042)

(declare-fun bm!20732 () Bool)

(declare-fun c!36898 () Bool)

(declare-datatypes ((SeekEntryResult!832 0))(
  ( (MissingZero!832 (index!5498 (_ BitVec 32))) (Found!832 (index!5499 (_ BitVec 32))) (Intermediate!832 (undefined!1644 Bool) (index!5500 (_ BitVec 32)) (x!23036 (_ BitVec 32))) (Undefined!832) (MissingVacant!832 (index!5501 (_ BitVec 32))) )
))
(declare-fun lt!112543 () SeekEntryResult!832)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20732 (= call!20736 (inRange!0 (ite c!36898 (index!5498 lt!112543) (index!5501 lt!112543)) (mask!9996 thiss!1504)))))

(declare-fun b!221994 () Bool)

(declare-datatypes ((Unit!6643 0))(
  ( (Unit!6644) )
))
(declare-fun e!144274 () Unit!6643)

(declare-fun Unit!6645 () Unit!6643)

(assert (=> b!221994 (= e!144274 Unit!6645)))

(declare-fun lt!112545 () Unit!6643)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!56 (array!10903 array!10901 (_ BitVec 32) (_ BitVec 32) V!7419 V!7419 (_ BitVec 64) (_ BitVec 32) Int) Unit!6643)

(assert (=> b!221994 (= lt!112545 (lemmaArrayContainsKeyThenInListMap!56 (_keys!6234 thiss!1504) (_values!4163 thiss!1504) (mask!9996 thiss!1504) (extraKeys!3917 thiss!1504) (zeroValue!4021 thiss!1504) (minValue!4021 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4180 thiss!1504)))))

(assert (=> b!221994 false))

(declare-fun b!221995 () Bool)

(declare-fun e!144280 () Bool)

(declare-datatypes ((List!3296 0))(
  ( (Nil!3293) (Cons!3292 (h!3940 (_ BitVec 64)) (t!8255 List!3296)) )
))
(declare-fun contains!1516 (List!3296 (_ BitVec 64)) Bool)

(assert (=> b!221995 (= e!144280 (contains!1516 Nil!3293 key!932))))

(declare-fun b!221996 () Bool)

(declare-fun res!108954 () Bool)

(declare-fun e!144265 () Bool)

(assert (=> b!221996 (=> (not res!108954) (not e!144265))))

(assert (=> b!221996 (= res!108954 (= (select (arr!5171 (_keys!6234 thiss!1504)) (index!5498 lt!112543)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!221997 () Bool)

(declare-fun e!144268 () Bool)

(assert (=> b!221997 (= e!144268 false)))

(declare-fun lt!112547 () Bool)

(declare-fun arrayNoDuplicates!0 (array!10903 (_ BitVec 32) List!3296) Bool)

(assert (=> b!221997 (= lt!112547 (arrayNoDuplicates!0 (_keys!6234 thiss!1504) #b00000000000000000000000000000000 Nil!3293))))

(declare-fun b!221998 () Bool)

(declare-fun e!144276 () Bool)

(assert (=> b!221998 (= e!144276 (not (contains!1516 Nil!3293 key!932)))))

(declare-fun b!221999 () Bool)

(declare-fun e!144267 () Unit!6643)

(declare-fun lt!112546 () Unit!6643)

(assert (=> b!221999 (= e!144267 lt!112546)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!232 (array!10903 array!10901 (_ BitVec 32) (_ BitVec 32) V!7419 V!7419 (_ BitVec 64) Int) Unit!6643)

(assert (=> b!221999 (= lt!112546 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!232 (_keys!6234 thiss!1504) (_values!4163 thiss!1504) (mask!9996 thiss!1504) (extraKeys!3917 thiss!1504) (zeroValue!4021 thiss!1504) (minValue!4021 thiss!1504) key!932 (defaultEntry!4180 thiss!1504)))))

(get-info :version)

(assert (=> b!221999 (= c!36898 ((_ is MissingZero!832) lt!112543))))

(declare-fun e!144275 () Bool)

(assert (=> b!221999 e!144275))

(declare-fun b!222000 () Bool)

(declare-fun res!108959 () Bool)

(assert (=> b!222000 (=> (not res!108959) (not e!144268))))

(declare-fun noDuplicate!67 (List!3296) Bool)

(assert (=> b!222000 (= res!108959 (noDuplicate!67 Nil!3293))))

(declare-fun mapNonEmpty!9913 () Bool)

(declare-fun mapRes!9913 () Bool)

(declare-fun tp!21042 () Bool)

(declare-fun e!144279 () Bool)

(assert (=> mapNonEmpty!9913 (= mapRes!9913 (and tp!21042 e!144279))))

(declare-fun mapRest!9913 () (Array (_ BitVec 32) ValueCell!2571))

(declare-fun mapKey!9913 () (_ BitVec 32))

(declare-fun mapValue!9913 () ValueCell!2571)

(assert (=> mapNonEmpty!9913 (= (arr!5170 (_values!4163 thiss!1504)) (store mapRest!9913 mapKey!9913 mapValue!9913))))

(declare-fun b!222001 () Bool)

(declare-fun e!144272 () Bool)

(declare-fun e!144281 () Bool)

(assert (=> b!222001 (= e!144272 (and e!144281 mapRes!9913))))

(declare-fun condMapEmpty!9913 () Bool)

(declare-fun mapDefault!9913 () ValueCell!2571)

(assert (=> b!222001 (= condMapEmpty!9913 (= (arr!5170 (_values!4163 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2571)) mapDefault!9913)))))

(declare-fun b!222002 () Bool)

(declare-fun res!108950 () Bool)

(assert (=> b!222002 (=> (not res!108950) (not e!144268))))

(declare-fun e!144266 () Bool)

(assert (=> b!222002 (= res!108950 e!144266)))

(declare-fun res!108952 () Bool)

(assert (=> b!222002 (=> res!108952 e!144266)))

(assert (=> b!222002 (= res!108952 e!144280)))

(declare-fun res!108946 () Bool)

(assert (=> b!222002 (=> (not res!108946) (not e!144280))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!222002 (= res!108946 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun bm!20733 () Bool)

(declare-fun call!20735 () Bool)

(declare-fun arrayContainsKey!0 (array!10903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20733 (= call!20735 (arrayContainsKey!0 (_keys!6234 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222003 () Bool)

(assert (=> b!222003 (= e!144265 (not call!20735))))

(declare-fun mapIsEmpty!9913 () Bool)

(assert (=> mapIsEmpty!9913 mapRes!9913))

(declare-fun b!222004 () Bool)

(declare-fun res!108951 () Bool)

(assert (=> b!222004 (=> (not res!108951) (not e!144265))))

(assert (=> b!222004 (= res!108951 call!20736)))

(assert (=> b!222004 (= e!144275 e!144265)))

(declare-fun b!222005 () Bool)

(declare-fun res!108961 () Bool)

(assert (=> b!222005 (=> (not res!108961) (not e!144268))))

(assert (=> b!222005 (= res!108961 (not (contains!1516 Nil!3293 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222006 () Bool)

(assert (=> b!222006 (= e!144264 ((_ is Undefined!832) lt!112543))))

(declare-fun e!144277 () Bool)

(declare-fun tp_is_empty!5829 () Bool)

(declare-fun array_inv!3423 (array!10903) Bool)

(declare-fun array_inv!3424 (array!10901) Bool)

(assert (=> b!222007 (= e!144277 (and tp!21043 tp_is_empty!5829 (array_inv!3423 (_keys!6234 thiss!1504)) (array_inv!3424 (_values!4163 thiss!1504)) e!144272))))

(declare-fun res!108953 () Bool)

(declare-fun e!144273 () Bool)

(assert (=> start!21900 (=> (not res!108953) (not e!144273))))

(declare-fun valid!1228 (LongMapFixedSize!3042) Bool)

(assert (=> start!21900 (= res!108953 (valid!1228 thiss!1504))))

(assert (=> start!21900 e!144273))

(assert (=> start!21900 e!144277))

(assert (=> start!21900 true))

(declare-fun b!221993 () Bool)

(declare-fun e!144271 () Bool)

(assert (=> b!221993 (= e!144271 e!144268)))

(declare-fun res!108958 () Bool)

(assert (=> b!221993 (=> (not res!108958) (not e!144268))))

(assert (=> b!221993 (= res!108958 (and (bvslt (size!5504 (_keys!6234 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5504 (_keys!6234 thiss!1504)))))))

(declare-fun lt!112544 () Unit!6643)

(assert (=> b!221993 (= lt!112544 e!144274)))

(declare-fun c!36900 () Bool)

(assert (=> b!221993 (= c!36900 (arrayContainsKey!0 (_keys!6234 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222008 () Bool)

(declare-fun e!144278 () Bool)

(assert (=> b!222008 (= e!144278 e!144271)))

(declare-fun res!108955 () Bool)

(assert (=> b!222008 (=> (not res!108955) (not e!144271))))

(assert (=> b!222008 (= res!108955 (inRange!0 index!297 (mask!9996 thiss!1504)))))

(declare-fun lt!112542 () Unit!6643)

(assert (=> b!222008 (= lt!112542 e!144267)))

(declare-fun c!36899 () Bool)

(declare-datatypes ((tuple2!4394 0))(
  ( (tuple2!4395 (_1!2208 (_ BitVec 64)) (_2!2208 V!7419)) )
))
(declare-datatypes ((List!3297 0))(
  ( (Nil!3294) (Cons!3293 (h!3941 tuple2!4394) (t!8256 List!3297)) )
))
(declare-datatypes ((ListLongMap!3307 0))(
  ( (ListLongMap!3308 (toList!1669 List!3297)) )
))
(declare-fun contains!1517 (ListLongMap!3307 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1197 (array!10903 array!10901 (_ BitVec 32) (_ BitVec 32) V!7419 V!7419 (_ BitVec 32) Int) ListLongMap!3307)

(assert (=> b!222008 (= c!36899 (contains!1517 (getCurrentListMap!1197 (_keys!6234 thiss!1504) (_values!4163 thiss!1504) (mask!9996 thiss!1504) (extraKeys!3917 thiss!1504) (zeroValue!4021 thiss!1504) (minValue!4021 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4180 thiss!1504)) key!932))))

(declare-fun b!222009 () Bool)

(assert (=> b!222009 (= e!144279 tp_is_empty!5829)))

(declare-fun b!222010 () Bool)

(assert (=> b!222010 (= e!144269 (not call!20735))))

(declare-fun b!222011 () Bool)

(assert (=> b!222011 (= e!144273 e!144278)))

(declare-fun res!108960 () Bool)

(assert (=> b!222011 (=> (not res!108960) (not e!144278))))

(assert (=> b!222011 (= res!108960 (or (= lt!112543 (MissingZero!832 index!297)) (= lt!112543 (MissingVacant!832 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10903 (_ BitVec 32)) SeekEntryResult!832)

(assert (=> b!222011 (= lt!112543 (seekEntryOrOpen!0 key!932 (_keys!6234 thiss!1504) (mask!9996 thiss!1504)))))

(declare-fun b!222012 () Bool)

(declare-fun res!108956 () Bool)

(assert (=> b!222012 (=> (not res!108956) (not e!144273))))

(assert (=> b!222012 (= res!108956 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!222013 () Bool)

(declare-fun c!36897 () Bool)

(assert (=> b!222013 (= c!36897 ((_ is MissingVacant!832) lt!112543))))

(assert (=> b!222013 (= e!144275 e!144264)))

(declare-fun b!222014 () Bool)

(assert (=> b!222014 (= e!144266 e!144276)))

(declare-fun res!108947 () Bool)

(assert (=> b!222014 (=> (not res!108947) (not e!144276))))

(assert (=> b!222014 (= res!108947 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!222015 () Bool)

(declare-fun res!108948 () Bool)

(assert (=> b!222015 (= res!108948 (= (select (arr!5171 (_keys!6234 thiss!1504)) (index!5501 lt!112543)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!222015 (=> (not res!108948) (not e!144269))))

(declare-fun b!222016 () Bool)

(assert (=> b!222016 (= e!144281 tp_is_empty!5829)))

(declare-fun b!222017 () Bool)

(declare-fun Unit!6646 () Unit!6643)

(assert (=> b!222017 (= e!144274 Unit!6646)))

(declare-fun b!222018 () Bool)

(declare-fun res!108957 () Bool)

(assert (=> b!222018 (=> (not res!108957) (not e!144268))))

(assert (=> b!222018 (= res!108957 (not (contains!1516 Nil!3293 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222019 () Bool)

(declare-fun Unit!6647 () Unit!6643)

(assert (=> b!222019 (= e!144267 Unit!6647)))

(declare-fun lt!112541 () Unit!6643)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!221 (array!10903 array!10901 (_ BitVec 32) (_ BitVec 32) V!7419 V!7419 (_ BitVec 64) Int) Unit!6643)

(assert (=> b!222019 (= lt!112541 (lemmaInListMapThenSeekEntryOrOpenFindsIt!221 (_keys!6234 thiss!1504) (_values!4163 thiss!1504) (mask!9996 thiss!1504) (extraKeys!3917 thiss!1504) (zeroValue!4021 thiss!1504) (minValue!4021 thiss!1504) key!932 (defaultEntry!4180 thiss!1504)))))

(assert (=> b!222019 false))

(assert (= (and start!21900 res!108953) b!222012))

(assert (= (and b!222012 res!108956) b!222011))

(assert (= (and b!222011 res!108960) b!222008))

(assert (= (and b!222008 c!36899) b!222019))

(assert (= (and b!222008 (not c!36899)) b!221999))

(assert (= (and b!221999 c!36898) b!222004))

(assert (= (and b!221999 (not c!36898)) b!222013))

(assert (= (and b!222004 res!108951) b!221996))

(assert (= (and b!221996 res!108954) b!222003))

(assert (= (and b!222013 c!36897) b!221992))

(assert (= (and b!222013 (not c!36897)) b!222006))

(assert (= (and b!221992 res!108949) b!222015))

(assert (= (and b!222015 res!108948) b!222010))

(assert (= (or b!222004 b!221992) bm!20732))

(assert (= (or b!222003 b!222010) bm!20733))

(assert (= (and b!222008 res!108955) b!221993))

(assert (= (and b!221993 c!36900) b!221994))

(assert (= (and b!221993 (not c!36900)) b!222017))

(assert (= (and b!221993 res!108958) b!222000))

(assert (= (and b!222000 res!108959) b!222005))

(assert (= (and b!222005 res!108961) b!222018))

(assert (= (and b!222018 res!108957) b!222002))

(assert (= (and b!222002 res!108946) b!221995))

(assert (= (and b!222002 (not res!108952)) b!222014))

(assert (= (and b!222014 res!108947) b!221998))

(assert (= (and b!222002 res!108950) b!221997))

(assert (= (and b!222001 condMapEmpty!9913) mapIsEmpty!9913))

(assert (= (and b!222001 (not condMapEmpty!9913)) mapNonEmpty!9913))

(assert (= (and mapNonEmpty!9913 ((_ is ValueCellFull!2571) mapValue!9913)) b!222009))

(assert (= (and b!222001 ((_ is ValueCellFull!2571) mapDefault!9913)) b!222016))

(assert (= b!222007 b!222001))

(assert (= start!21900 b!222007))

(declare-fun m!246345 () Bool)

(assert (=> bm!20732 m!246345))

(declare-fun m!246347 () Bool)

(assert (=> b!221996 m!246347))

(declare-fun m!246349 () Bool)

(assert (=> b!222019 m!246349))

(declare-fun m!246351 () Bool)

(assert (=> b!221994 m!246351))

(declare-fun m!246353 () Bool)

(assert (=> b!221997 m!246353))

(declare-fun m!246355 () Bool)

(assert (=> b!221999 m!246355))

(declare-fun m!246357 () Bool)

(assert (=> b!222008 m!246357))

(declare-fun m!246359 () Bool)

(assert (=> b!222008 m!246359))

(assert (=> b!222008 m!246359))

(declare-fun m!246361 () Bool)

(assert (=> b!222008 m!246361))

(declare-fun m!246363 () Bool)

(assert (=> b!222011 m!246363))

(declare-fun m!246365 () Bool)

(assert (=> b!222007 m!246365))

(declare-fun m!246367 () Bool)

(assert (=> b!222007 m!246367))

(declare-fun m!246369 () Bool)

(assert (=> b!222015 m!246369))

(declare-fun m!246371 () Bool)

(assert (=> bm!20733 m!246371))

(declare-fun m!246373 () Bool)

(assert (=> start!21900 m!246373))

(declare-fun m!246375 () Bool)

(assert (=> b!222000 m!246375))

(declare-fun m!246377 () Bool)

(assert (=> b!222005 m!246377))

(declare-fun m!246379 () Bool)

(assert (=> b!221998 m!246379))

(assert (=> b!221995 m!246379))

(declare-fun m!246381 () Bool)

(assert (=> mapNonEmpty!9913 m!246381))

(assert (=> b!221993 m!246371))

(declare-fun m!246383 () Bool)

(assert (=> b!222018 m!246383))

(check-sat (not b!222019) (not start!21900) b_and!12865 tp_is_empty!5829 (not b!222011) (not b!221993) (not b!222000) (not bm!20732) (not b!221998) (not b!222007) (not bm!20733) (not mapNonEmpty!9913) (not b!222008) (not b!222005) (not b!222018) (not b!221995) (not b!221999) (not b!221994) (not b_next!5967) (not b!221997))
(check-sat b_and!12865 (not b_next!5967))
