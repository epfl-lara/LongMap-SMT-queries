; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21902 () Bool)

(assert start!21902)

(declare-fun b!221955 () Bool)

(declare-fun b_free!5965 () Bool)

(declare-fun b_next!5965 () Bool)

(assert (=> b!221955 (= b_free!5965 (not b_next!5965))))

(declare-fun tp!21036 () Bool)

(declare-fun b_and!12877 () Bool)

(assert (=> b!221955 (= tp!21036 b_and!12877)))

(declare-fun mapIsEmpty!9910 () Bool)

(declare-fun mapRes!9910 () Bool)

(assert (=> mapIsEmpty!9910 mapRes!9910))

(declare-fun tp_is_empty!5827 () Bool)

(declare-fun e!144245 () Bool)

(declare-datatypes ((V!7417 0))(
  ( (V!7418 (val!2958 Int)) )
))
(declare-datatypes ((ValueCell!2570 0))(
  ( (ValueCellFull!2570 (v!4979 V!7417)) (EmptyCell!2570) )
))
(declare-datatypes ((array!10895 0))(
  ( (array!10896 (arr!5167 (Array (_ BitVec 32) ValueCell!2570)) (size!5500 (_ BitVec 32))) )
))
(declare-datatypes ((array!10897 0))(
  ( (array!10898 (arr!5168 (Array (_ BitVec 32) (_ BitVec 64))) (size!5501 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3040 0))(
  ( (LongMapFixedSize!3041 (defaultEntry!4179 Int) (mask!9995 (_ BitVec 32)) (extraKeys!3916 (_ BitVec 32)) (zeroValue!4020 V!7417) (minValue!4020 V!7417) (_size!1569 (_ BitVec 32)) (_keys!6233 array!10897) (_values!4162 array!10895) (_vacant!1569 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3040)

(declare-fun e!144247 () Bool)

(declare-fun array_inv!3395 (array!10897) Bool)

(declare-fun array_inv!3396 (array!10895) Bool)

(assert (=> b!221955 (= e!144245 (and tp!21036 tp_is_empty!5827 (array_inv!3395 (_keys!6233 thiss!1504)) (array_inv!3396 (_values!4162 thiss!1504)) e!144247))))

(declare-fun b!221956 () Bool)

(declare-fun e!144248 () Bool)

(assert (=> b!221956 (= e!144248 tp_is_empty!5827)))

(declare-fun b!221957 () Bool)

(declare-fun res!108930 () Bool)

(declare-fun e!144238 () Bool)

(assert (=> b!221957 (=> (not res!108930) (not e!144238))))

(declare-datatypes ((List!3199 0))(
  ( (Nil!3196) (Cons!3195 (h!3843 (_ BitVec 64)) (t!8150 List!3199)) )
))
(declare-fun contains!1485 (List!3199 (_ BitVec 64)) Bool)

(assert (=> b!221957 (= res!108930 (not (contains!1485 Nil!3196 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!221958 () Bool)

(declare-datatypes ((Unit!6603 0))(
  ( (Unit!6604) )
))
(declare-fun e!144251 () Unit!6603)

(declare-fun Unit!6605 () Unit!6603)

(assert (=> b!221958 (= e!144251 Unit!6605)))

(declare-fun lt!112583 () Unit!6603)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!55 (array!10897 array!10895 (_ BitVec 32) (_ BitVec 32) V!7417 V!7417 (_ BitVec 64) (_ BitVec 32) Int) Unit!6603)

(assert (=> b!221958 (= lt!112583 (lemmaArrayContainsKeyThenInListMap!55 (_keys!6233 thiss!1504) (_values!4162 thiss!1504) (mask!9995 thiss!1504) (extraKeys!3916 thiss!1504) (zeroValue!4020 thiss!1504) (minValue!4020 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4179 thiss!1504)))))

(assert (=> b!221958 false))

(declare-fun bm!20714 () Bool)

(declare-fun call!20717 () Bool)

(declare-fun arrayContainsKey!0 (array!10897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20714 (= call!20717 (arrayContainsKey!0 (_keys!6233 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221959 () Bool)

(declare-fun e!144237 () Bool)

(assert (=> b!221959 (= e!144237 e!144238)))

(declare-fun res!108932 () Bool)

(assert (=> b!221959 (=> (not res!108932) (not e!144238))))

(assert (=> b!221959 (= res!108932 (and (bvslt (size!5501 (_keys!6233 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5501 (_keys!6233 thiss!1504)))))))

(declare-fun lt!112584 () Unit!6603)

(assert (=> b!221959 (= lt!112584 e!144251)))

(declare-fun c!36901 () Bool)

(assert (=> b!221959 (= c!36901 (arrayContainsKey!0 (_keys!6233 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221960 () Bool)

(declare-fun e!144243 () Unit!6603)

(declare-fun lt!112580 () Unit!6603)

(assert (=> b!221960 (= e!144243 lt!112580)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!209 (array!10897 array!10895 (_ BitVec 32) (_ BitVec 32) V!7417 V!7417 (_ BitVec 64) Int) Unit!6603)

(assert (=> b!221960 (= lt!112580 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!209 (_keys!6233 thiss!1504) (_values!4162 thiss!1504) (mask!9995 thiss!1504) (extraKeys!3916 thiss!1504) (zeroValue!4020 thiss!1504) (minValue!4020 thiss!1504) key!932 (defaultEntry!4179 thiss!1504)))))

(declare-fun c!36899 () Bool)

(declare-datatypes ((SeekEntryResult!805 0))(
  ( (MissingZero!805 (index!5390 (_ BitVec 32))) (Found!805 (index!5391 (_ BitVec 32))) (Intermediate!805 (undefined!1617 Bool) (index!5392 (_ BitVec 32)) (x!23009 (_ BitVec 32))) (Undefined!805) (MissingVacant!805 (index!5393 (_ BitVec 32))) )
))
(declare-fun lt!112581 () SeekEntryResult!805)

(get-info :version)

(assert (=> b!221960 (= c!36899 ((_ is MissingZero!805) lt!112581))))

(declare-fun e!144241 () Bool)

(assert (=> b!221960 e!144241))

(declare-fun b!221961 () Bool)

(declare-fun e!144240 () Bool)

(declare-fun e!144239 () Bool)

(assert (=> b!221961 (= e!144240 e!144239)))

(declare-fun res!108922 () Bool)

(declare-fun call!20718 () Bool)

(assert (=> b!221961 (= res!108922 call!20718)))

(assert (=> b!221961 (=> (not res!108922) (not e!144239))))

(declare-fun b!221963 () Bool)

(assert (=> b!221963 (= e!144240 ((_ is Undefined!805) lt!112581))))

(declare-fun b!221964 () Bool)

(declare-fun res!108927 () Bool)

(declare-fun e!144249 () Bool)

(assert (=> b!221964 (=> (not res!108927) (not e!144249))))

(assert (=> b!221964 (= res!108927 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!221965 () Bool)

(declare-fun res!108934 () Bool)

(assert (=> b!221965 (=> (not res!108934) (not e!144238))))

(declare-fun noDuplicate!64 (List!3199) Bool)

(assert (=> b!221965 (= res!108934 (noDuplicate!64 Nil!3196))))

(declare-fun b!221966 () Bool)

(declare-fun res!108920 () Bool)

(declare-fun e!144246 () Bool)

(assert (=> b!221966 (=> (not res!108920) (not e!144246))))

(assert (=> b!221966 (= res!108920 call!20718)))

(assert (=> b!221966 (= e!144241 e!144246)))

(declare-fun bm!20715 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20715 (= call!20718 (inRange!0 (ite c!36899 (index!5390 lt!112581) (index!5393 lt!112581)) (mask!9995 thiss!1504)))))

(declare-fun b!221967 () Bool)

(declare-fun e!144234 () Bool)

(assert (=> b!221967 (= e!144234 e!144237)))

(declare-fun res!108924 () Bool)

(assert (=> b!221967 (=> (not res!108924) (not e!144237))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!221967 (= res!108924 (inRange!0 index!297 (mask!9995 thiss!1504)))))

(declare-fun lt!112585 () Unit!6603)

(assert (=> b!221967 (= lt!112585 e!144243)))

(declare-fun c!36898 () Bool)

(declare-datatypes ((tuple2!4304 0))(
  ( (tuple2!4305 (_1!2163 (_ BitVec 64)) (_2!2163 V!7417)) )
))
(declare-datatypes ((List!3200 0))(
  ( (Nil!3197) (Cons!3196 (h!3844 tuple2!4304) (t!8151 List!3200)) )
))
(declare-datatypes ((ListLongMap!3219 0))(
  ( (ListLongMap!3220 (toList!1625 List!3200)) )
))
(declare-fun contains!1486 (ListLongMap!3219 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1157 (array!10897 array!10895 (_ BitVec 32) (_ BitVec 32) V!7417 V!7417 (_ BitVec 32) Int) ListLongMap!3219)

(assert (=> b!221967 (= c!36898 (contains!1486 (getCurrentListMap!1157 (_keys!6233 thiss!1504) (_values!4162 thiss!1504) (mask!9995 thiss!1504) (extraKeys!3916 thiss!1504) (zeroValue!4020 thiss!1504) (minValue!4020 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4179 thiss!1504)) key!932))))

(declare-fun b!221968 () Bool)

(declare-fun res!108928 () Bool)

(assert (=> b!221968 (=> (not res!108928) (not e!144246))))

(assert (=> b!221968 (= res!108928 (= (select (arr!5168 (_keys!6233 thiss!1504)) (index!5390 lt!112581)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!221969 () Bool)

(declare-fun e!144250 () Bool)

(declare-fun e!144242 () Bool)

(assert (=> b!221969 (= e!144250 e!144242)))

(declare-fun res!108929 () Bool)

(assert (=> b!221969 (=> (not res!108929) (not e!144242))))

(assert (=> b!221969 (= res!108929 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!221970 () Bool)

(assert (=> b!221970 (= e!144242 (not (contains!1485 Nil!3196 key!932)))))

(declare-fun b!221971 () Bool)

(declare-fun Unit!6606 () Unit!6603)

(assert (=> b!221971 (= e!144251 Unit!6606)))

(declare-fun mapNonEmpty!9910 () Bool)

(declare-fun tp!21037 () Bool)

(declare-fun e!144244 () Bool)

(assert (=> mapNonEmpty!9910 (= mapRes!9910 (and tp!21037 e!144244))))

(declare-fun mapKey!9910 () (_ BitVec 32))

(declare-fun mapValue!9910 () ValueCell!2570)

(declare-fun mapRest!9910 () (Array (_ BitVec 32) ValueCell!2570))

(assert (=> mapNonEmpty!9910 (= (arr!5167 (_values!4162 thiss!1504)) (store mapRest!9910 mapKey!9910 mapValue!9910))))

(declare-fun b!221972 () Bool)

(assert (=> b!221972 (= e!144247 (and e!144248 mapRes!9910))))

(declare-fun condMapEmpty!9910 () Bool)

(declare-fun mapDefault!9910 () ValueCell!2570)

(assert (=> b!221972 (= condMapEmpty!9910 (= (arr!5167 (_values!4162 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2570)) mapDefault!9910)))))

(declare-fun b!221973 () Bool)

(declare-fun e!144235 () Bool)

(assert (=> b!221973 (= e!144235 (contains!1485 Nil!3196 key!932))))

(declare-fun b!221974 () Bool)

(declare-fun Unit!6607 () Unit!6603)

(assert (=> b!221974 (= e!144243 Unit!6607)))

(declare-fun lt!112579 () Unit!6603)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!214 (array!10897 array!10895 (_ BitVec 32) (_ BitVec 32) V!7417 V!7417 (_ BitVec 64) Int) Unit!6603)

(assert (=> b!221974 (= lt!112579 (lemmaInListMapThenSeekEntryOrOpenFindsIt!214 (_keys!6233 thiss!1504) (_values!4162 thiss!1504) (mask!9995 thiss!1504) (extraKeys!3916 thiss!1504) (zeroValue!4020 thiss!1504) (minValue!4020 thiss!1504) key!932 (defaultEntry!4179 thiss!1504)))))

(assert (=> b!221974 false))

(declare-fun b!221975 () Bool)

(assert (=> b!221975 (= e!144238 false)))

(declare-fun lt!112582 () Bool)

(declare-fun arrayNoDuplicates!0 (array!10897 (_ BitVec 32) List!3199) Bool)

(assert (=> b!221975 (= lt!112582 (arrayNoDuplicates!0 (_keys!6233 thiss!1504) #b00000000000000000000000000000000 Nil!3196))))

(declare-fun b!221976 () Bool)

(declare-fun res!108919 () Bool)

(assert (=> b!221976 (=> (not res!108919) (not e!144238))))

(assert (=> b!221976 (= res!108919 (not (contains!1485 Nil!3196 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!221977 () Bool)

(assert (=> b!221977 (= e!144246 (not call!20717))))

(declare-fun b!221978 () Bool)

(assert (=> b!221978 (= e!144244 tp_is_empty!5827)))

(declare-fun b!221979 () Bool)

(assert (=> b!221979 (= e!144239 (not call!20717))))

(declare-fun b!221980 () Bool)

(declare-fun res!108923 () Bool)

(assert (=> b!221980 (=> (not res!108923) (not e!144238))))

(assert (=> b!221980 (= res!108923 e!144250)))

(declare-fun res!108931 () Bool)

(assert (=> b!221980 (=> res!108931 e!144250)))

(assert (=> b!221980 (= res!108931 e!144235)))

(declare-fun res!108933 () Bool)

(assert (=> b!221980 (=> (not res!108933) (not e!144235))))

(assert (=> b!221980 (= res!108933 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!221981 () Bool)

(declare-fun res!108926 () Bool)

(assert (=> b!221981 (= res!108926 (= (select (arr!5168 (_keys!6233 thiss!1504)) (index!5393 lt!112581)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!221981 (=> (not res!108926) (not e!144239))))

(declare-fun b!221982 () Bool)

(assert (=> b!221982 (= e!144249 e!144234)))

(declare-fun res!108925 () Bool)

(assert (=> b!221982 (=> (not res!108925) (not e!144234))))

(assert (=> b!221982 (= res!108925 (or (= lt!112581 (MissingZero!805 index!297)) (= lt!112581 (MissingVacant!805 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10897 (_ BitVec 32)) SeekEntryResult!805)

(assert (=> b!221982 (= lt!112581 (seekEntryOrOpen!0 key!932 (_keys!6233 thiss!1504) (mask!9995 thiss!1504)))))

(declare-fun b!221962 () Bool)

(declare-fun c!36900 () Bool)

(assert (=> b!221962 (= c!36900 ((_ is MissingVacant!805) lt!112581))))

(assert (=> b!221962 (= e!144241 e!144240)))

(declare-fun res!108921 () Bool)

(assert (=> start!21902 (=> (not res!108921) (not e!144249))))

(declare-fun valid!1234 (LongMapFixedSize!3040) Bool)

(assert (=> start!21902 (= res!108921 (valid!1234 thiss!1504))))

(assert (=> start!21902 e!144249))

(assert (=> start!21902 e!144245))

(assert (=> start!21902 true))

(assert (= (and start!21902 res!108921) b!221964))

(assert (= (and b!221964 res!108927) b!221982))

(assert (= (and b!221982 res!108925) b!221967))

(assert (= (and b!221967 c!36898) b!221974))

(assert (= (and b!221967 (not c!36898)) b!221960))

(assert (= (and b!221960 c!36899) b!221966))

(assert (= (and b!221960 (not c!36899)) b!221962))

(assert (= (and b!221966 res!108920) b!221968))

(assert (= (and b!221968 res!108928) b!221977))

(assert (= (and b!221962 c!36900) b!221961))

(assert (= (and b!221962 (not c!36900)) b!221963))

(assert (= (and b!221961 res!108922) b!221981))

(assert (= (and b!221981 res!108926) b!221979))

(assert (= (or b!221966 b!221961) bm!20715))

(assert (= (or b!221977 b!221979) bm!20714))

(assert (= (and b!221967 res!108924) b!221959))

(assert (= (and b!221959 c!36901) b!221958))

(assert (= (and b!221959 (not c!36901)) b!221971))

(assert (= (and b!221959 res!108932) b!221965))

(assert (= (and b!221965 res!108934) b!221957))

(assert (= (and b!221957 res!108930) b!221976))

(assert (= (and b!221976 res!108919) b!221980))

(assert (= (and b!221980 res!108933) b!221973))

(assert (= (and b!221980 (not res!108931)) b!221969))

(assert (= (and b!221969 res!108929) b!221970))

(assert (= (and b!221980 res!108923) b!221975))

(assert (= (and b!221972 condMapEmpty!9910) mapIsEmpty!9910))

(assert (= (and b!221972 (not condMapEmpty!9910)) mapNonEmpty!9910))

(assert (= (and mapNonEmpty!9910 ((_ is ValueCellFull!2570) mapValue!9910)) b!221978))

(assert (= (and b!221972 ((_ is ValueCellFull!2570) mapDefault!9910)) b!221956))

(assert (= b!221955 b!221972))

(assert (= start!21902 b!221955))

(declare-fun m!246487 () Bool)

(assert (=> b!221973 m!246487))

(declare-fun m!246489 () Bool)

(assert (=> b!221974 m!246489))

(declare-fun m!246491 () Bool)

(assert (=> b!221959 m!246491))

(declare-fun m!246493 () Bool)

(assert (=> b!221968 m!246493))

(declare-fun m!246495 () Bool)

(assert (=> b!221960 m!246495))

(declare-fun m!246497 () Bool)

(assert (=> mapNonEmpty!9910 m!246497))

(declare-fun m!246499 () Bool)

(assert (=> b!221982 m!246499))

(declare-fun m!246501 () Bool)

(assert (=> b!221957 m!246501))

(declare-fun m!246503 () Bool)

(assert (=> b!221958 m!246503))

(declare-fun m!246505 () Bool)

(assert (=> b!221967 m!246505))

(declare-fun m!246507 () Bool)

(assert (=> b!221967 m!246507))

(assert (=> b!221967 m!246507))

(declare-fun m!246509 () Bool)

(assert (=> b!221967 m!246509))

(declare-fun m!246511 () Bool)

(assert (=> b!221981 m!246511))

(declare-fun m!246513 () Bool)

(assert (=> b!221975 m!246513))

(assert (=> bm!20714 m!246491))

(declare-fun m!246515 () Bool)

(assert (=> b!221976 m!246515))

(declare-fun m!246517 () Bool)

(assert (=> start!21902 m!246517))

(assert (=> b!221970 m!246487))

(declare-fun m!246519 () Bool)

(assert (=> b!221955 m!246519))

(declare-fun m!246521 () Bool)

(assert (=> b!221955 m!246521))

(declare-fun m!246523 () Bool)

(assert (=> bm!20715 m!246523))

(declare-fun m!246525 () Bool)

(assert (=> b!221965 m!246525))

(check-sat tp_is_empty!5827 (not b!221959) (not b!221967) (not b!221974) (not b!221955) (not b!221975) (not b!221958) (not b!221957) b_and!12877 (not b!221976) (not bm!20714) (not bm!20715) (not start!21902) (not b!221973) (not b!221970) (not mapNonEmpty!9910) (not b_next!5965) (not b!221965) (not b!221982) (not b!221960))
(check-sat b_and!12877 (not b_next!5965))
