; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22058 () Bool)

(assert start!22058)

(declare-fun b!227951 () Bool)

(declare-fun b_free!6121 () Bool)

(declare-fun b_next!6121 () Bool)

(assert (=> b!227951 (= b_free!6121 (not b_next!6121))))

(declare-fun tp!21505 () Bool)

(declare-fun b_and!12993 () Bool)

(assert (=> b!227951 (= tp!21505 b_and!12993)))

(declare-fun b!227943 () Bool)

(declare-fun e!147878 () Bool)

(declare-fun e!147884 () Bool)

(declare-fun mapRes!10144 () Bool)

(assert (=> b!227943 (= e!147878 (and e!147884 mapRes!10144))))

(declare-fun condMapEmpty!10144 () Bool)

(declare-datatypes ((V!7625 0))(
  ( (V!7626 (val!3036 Int)) )
))
(declare-datatypes ((ValueCell!2648 0))(
  ( (ValueCellFull!2648 (v!5050 V!7625)) (EmptyCell!2648) )
))
(declare-datatypes ((array!11201 0))(
  ( (array!11202 (arr!5319 (Array (_ BitVec 32) ValueCell!2648)) (size!5653 (_ BitVec 32))) )
))
(declare-datatypes ((array!11203 0))(
  ( (array!11204 (arr!5320 (Array (_ BitVec 32) (_ BitVec 64))) (size!5654 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3196 0))(
  ( (LongMapFixedSize!3197 (defaultEntry!4257 Int) (mask!10124 (_ BitVec 32)) (extraKeys!3994 (_ BitVec 32)) (zeroValue!4098 V!7625) (minValue!4098 V!7625) (_size!1647 (_ BitVec 32)) (_keys!6310 array!11203) (_values!4240 array!11201) (_vacant!1647 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3196)

(declare-fun mapDefault!10144 () ValueCell!2648)

(assert (=> b!227943 (= condMapEmpty!10144 (= (arr!5319 (_values!4240 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2648)) mapDefault!10144)))))

(declare-fun b!227944 () Bool)

(declare-fun res!112186 () Bool)

(declare-fun e!147888 () Bool)

(assert (=> b!227944 (=> res!112186 e!147888)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11203 (_ BitVec 32)) Bool)

(assert (=> b!227944 (= res!112186 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6310 thiss!1504) (mask!10124 thiss!1504))))))

(declare-fun b!227945 () Bool)

(declare-datatypes ((Unit!6897 0))(
  ( (Unit!6898) )
))
(declare-fun e!147876 () Unit!6897)

(declare-fun Unit!6899 () Unit!6897)

(assert (=> b!227945 (= e!147876 Unit!6899)))

(declare-fun lt!114588 () Unit!6897)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!110 (array!11203 array!11201 (_ BitVec 32) (_ BitVec 32) V!7625 V!7625 (_ BitVec 64) (_ BitVec 32) Int) Unit!6897)

(assert (=> b!227945 (= lt!114588 (lemmaArrayContainsKeyThenInListMap!110 (_keys!6310 thiss!1504) (_values!4240 thiss!1504) (mask!10124 thiss!1504) (extraKeys!3994 thiss!1504) (zeroValue!4098 thiss!1504) (minValue!4098 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4257 thiss!1504)))))

(assert (=> b!227945 false))

(declare-fun b!227946 () Bool)

(declare-fun e!147874 () Bool)

(declare-fun e!147882 () Bool)

(assert (=> b!227946 (= e!147874 e!147882)))

(declare-fun res!112181 () Bool)

(declare-fun call!21174 () Bool)

(assert (=> b!227946 (= res!112181 call!21174)))

(assert (=> b!227946 (=> (not res!112181) (not e!147882))))

(declare-fun mapNonEmpty!10144 () Bool)

(declare-fun tp!21504 () Bool)

(declare-fun e!147880 () Bool)

(assert (=> mapNonEmpty!10144 (= mapRes!10144 (and tp!21504 e!147880))))

(declare-fun mapValue!10144 () ValueCell!2648)

(declare-fun mapRest!10144 () (Array (_ BitVec 32) ValueCell!2648))

(declare-fun mapKey!10144 () (_ BitVec 32))

(assert (=> mapNonEmpty!10144 (= (arr!5319 (_values!4240 thiss!1504)) (store mapRest!10144 mapKey!10144 mapValue!10144))))

(declare-fun res!112178 () Bool)

(declare-fun e!147887 () Bool)

(assert (=> start!22058 (=> (not res!112178) (not e!147887))))

(declare-fun valid!1293 (LongMapFixedSize!3196) Bool)

(assert (=> start!22058 (= res!112178 (valid!1293 thiss!1504))))

(assert (=> start!22058 e!147887))

(declare-fun e!147881 () Bool)

(assert (=> start!22058 e!147881))

(assert (=> start!22058 true))

(declare-fun b!227947 () Bool)

(declare-fun res!112184 () Bool)

(declare-fun e!147879 () Bool)

(assert (=> b!227947 (=> (not res!112184) (not e!147879))))

(declare-datatypes ((SeekEntryResult!904 0))(
  ( (MissingZero!904 (index!5786 (_ BitVec 32))) (Found!904 (index!5787 (_ BitVec 32))) (Intermediate!904 (undefined!1716 Bool) (index!5788 (_ BitVec 32)) (x!23315 (_ BitVec 32))) (Undefined!904) (MissingVacant!904 (index!5789 (_ BitVec 32))) )
))
(declare-fun lt!114580 () SeekEntryResult!904)

(assert (=> b!227947 (= res!112184 (= (select (arr!5320 (_keys!6310 thiss!1504)) (index!5786 lt!114580)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!227948 () Bool)

(declare-fun e!147883 () Unit!6897)

(declare-fun lt!114585 () Unit!6897)

(assert (=> b!227948 (= e!147883 lt!114585)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!266 (array!11203 array!11201 (_ BitVec 32) (_ BitVec 32) V!7625 V!7625 (_ BitVec 64) Int) Unit!6897)

(assert (=> b!227948 (= lt!114585 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!266 (_keys!6310 thiss!1504) (_values!4240 thiss!1504) (mask!10124 thiss!1504) (extraKeys!3994 thiss!1504) (zeroValue!4098 thiss!1504) (minValue!4098 thiss!1504) key!932 (defaultEntry!4257 thiss!1504)))))

(declare-fun c!37795 () Bool)

(get-info :version)

(assert (=> b!227948 (= c!37795 ((_ is MissingZero!904) lt!114580))))

(declare-fun e!147877 () Bool)

(assert (=> b!227948 e!147877))

(declare-fun b!227949 () Bool)

(declare-fun call!21173 () Bool)

(assert (=> b!227949 (= e!147882 (not call!21173))))

(declare-fun b!227950 () Bool)

(declare-fun res!112180 () Bool)

(assert (=> b!227950 (=> (not res!112180) (not e!147879))))

(assert (=> b!227950 (= res!112180 call!21174)))

(assert (=> b!227950 (= e!147877 e!147879)))

(declare-fun tp_is_empty!5983 () Bool)

(declare-fun array_inv!3509 (array!11203) Bool)

(declare-fun array_inv!3510 (array!11201) Bool)

(assert (=> b!227951 (= e!147881 (and tp!21505 tp_is_empty!5983 (array_inv!3509 (_keys!6310 thiss!1504)) (array_inv!3510 (_values!4240 thiss!1504)) e!147878))))

(declare-fun b!227952 () Bool)

(declare-fun res!112177 () Bool)

(assert (=> b!227952 (= res!112177 (= (select (arr!5320 (_keys!6310 thiss!1504)) (index!5789 lt!114580)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!227952 (=> (not res!112177) (not e!147882))))

(declare-fun bm!21170 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21170 (= call!21174 (inRange!0 (ite c!37795 (index!5786 lt!114580) (index!5789 lt!114580)) (mask!10124 thiss!1504)))))

(declare-fun b!227953 () Bool)

(declare-fun Unit!6900 () Unit!6897)

(assert (=> b!227953 (= e!147883 Unit!6900)))

(declare-fun lt!114589 () Unit!6897)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!269 (array!11203 array!11201 (_ BitVec 32) (_ BitVec 32) V!7625 V!7625 (_ BitVec 64) Int) Unit!6897)

(assert (=> b!227953 (= lt!114589 (lemmaInListMapThenSeekEntryOrOpenFindsIt!269 (_keys!6310 thiss!1504) (_values!4240 thiss!1504) (mask!10124 thiss!1504) (extraKeys!3994 thiss!1504) (zeroValue!4098 thiss!1504) (minValue!4098 thiss!1504) key!932 (defaultEntry!4257 thiss!1504)))))

(assert (=> b!227953 false))

(declare-fun bm!21171 () Bool)

(declare-fun arrayContainsKey!0 (array!11203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21171 (= call!21173 (arrayContainsKey!0 (_keys!6310 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227954 () Bool)

(declare-fun e!147875 () Bool)

(assert (=> b!227954 (= e!147875 (not e!147888))))

(declare-fun res!112187 () Bool)

(assert (=> b!227954 (=> res!112187 e!147888)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!227954 (= res!112187 (not (validMask!0 (mask!10124 thiss!1504))))))

(declare-fun lt!114579 () array!11203)

(assert (=> b!227954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114579 (mask!10124 thiss!1504))))

(declare-fun lt!114582 () Unit!6897)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11203 (_ BitVec 32) (_ BitVec 32)) Unit!6897)

(assert (=> b!227954 (= lt!114582 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6310 thiss!1504) index!297 (mask!10124 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11203 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!227954 (= (arrayCountValidKeys!0 lt!114579 #b00000000000000000000000000000000 (size!5654 (_keys!6310 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6310 thiss!1504) #b00000000000000000000000000000000 (size!5654 (_keys!6310 thiss!1504)))))))

(declare-fun lt!114583 () Unit!6897)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11203 (_ BitVec 32) (_ BitVec 64)) Unit!6897)

(assert (=> b!227954 (= lt!114583 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6310 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3393 0))(
  ( (Nil!3390) (Cons!3389 (h!4037 (_ BitVec 64)) (t!8343 List!3393)) )
))
(declare-fun arrayNoDuplicates!0 (array!11203 (_ BitVec 32) List!3393) Bool)

(assert (=> b!227954 (arrayNoDuplicates!0 lt!114579 #b00000000000000000000000000000000 Nil!3390)))

(assert (=> b!227954 (= lt!114579 (array!11204 (store (arr!5320 (_keys!6310 thiss!1504)) index!297 key!932) (size!5654 (_keys!6310 thiss!1504))))))

(declare-fun lt!114586 () Unit!6897)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11203 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3393) Unit!6897)

(assert (=> b!227954 (= lt!114586 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6310 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3390))))

(declare-fun lt!114581 () Unit!6897)

(assert (=> b!227954 (= lt!114581 e!147876)))

(declare-fun c!37798 () Bool)

(assert (=> b!227954 (= c!37798 (arrayContainsKey!0 (_keys!6310 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227955 () Bool)

(declare-fun res!112179 () Bool)

(assert (=> b!227955 (=> res!112179 e!147888)))

(assert (=> b!227955 (= res!112179 (or (not (= (size!5653 (_values!4240 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10124 thiss!1504)))) (not (= (size!5654 (_keys!6310 thiss!1504)) (size!5653 (_values!4240 thiss!1504)))) (bvslt (mask!10124 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3994 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3994 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!227956 () Bool)

(assert (=> b!227956 (= e!147880 tp_is_empty!5983)))

(declare-fun b!227957 () Bool)

(assert (=> b!227957 (= e!147874 ((_ is Undefined!904) lt!114580))))

(declare-fun b!227958 () Bool)

(declare-fun res!112185 () Bool)

(assert (=> b!227958 (=> (not res!112185) (not e!147887))))

(assert (=> b!227958 (= res!112185 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!227959 () Bool)

(declare-fun c!37796 () Bool)

(assert (=> b!227959 (= c!37796 ((_ is MissingVacant!904) lt!114580))))

(assert (=> b!227959 (= e!147877 e!147874)))

(declare-fun b!227960 () Bool)

(declare-fun e!147886 () Bool)

(assert (=> b!227960 (= e!147886 e!147875)))

(declare-fun res!112182 () Bool)

(assert (=> b!227960 (=> (not res!112182) (not e!147875))))

(assert (=> b!227960 (= res!112182 (inRange!0 index!297 (mask!10124 thiss!1504)))))

(declare-fun lt!114587 () Unit!6897)

(assert (=> b!227960 (= lt!114587 e!147883)))

(declare-fun c!37797 () Bool)

(declare-datatypes ((tuple2!4462 0))(
  ( (tuple2!4463 (_1!2242 (_ BitVec 64)) (_2!2242 V!7625)) )
))
(declare-datatypes ((List!3394 0))(
  ( (Nil!3391) (Cons!3390 (h!4038 tuple2!4462) (t!8344 List!3394)) )
))
(declare-datatypes ((ListLongMap!3365 0))(
  ( (ListLongMap!3366 (toList!1698 List!3394)) )
))
(declare-fun contains!1573 (ListLongMap!3365 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1207 (array!11203 array!11201 (_ BitVec 32) (_ BitVec 32) V!7625 V!7625 (_ BitVec 32) Int) ListLongMap!3365)

(assert (=> b!227960 (= c!37797 (contains!1573 (getCurrentListMap!1207 (_keys!6310 thiss!1504) (_values!4240 thiss!1504) (mask!10124 thiss!1504) (extraKeys!3994 thiss!1504) (zeroValue!4098 thiss!1504) (minValue!4098 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4257 thiss!1504)) key!932))))

(declare-fun b!227961 () Bool)

(declare-fun Unit!6901 () Unit!6897)

(assert (=> b!227961 (= e!147876 Unit!6901)))

(declare-fun b!227962 () Bool)

(assert (=> b!227962 (= e!147879 (not call!21173))))

(declare-fun b!227963 () Bool)

(assert (=> b!227963 (= e!147888 true)))

(declare-fun lt!114584 () Bool)

(assert (=> b!227963 (= lt!114584 (arrayNoDuplicates!0 (_keys!6310 thiss!1504) #b00000000000000000000000000000000 Nil!3390))))

(declare-fun b!227964 () Bool)

(assert (=> b!227964 (= e!147884 tp_is_empty!5983)))

(declare-fun mapIsEmpty!10144 () Bool)

(assert (=> mapIsEmpty!10144 mapRes!10144))

(declare-fun b!227965 () Bool)

(assert (=> b!227965 (= e!147887 e!147886)))

(declare-fun res!112183 () Bool)

(assert (=> b!227965 (=> (not res!112183) (not e!147886))))

(assert (=> b!227965 (= res!112183 (or (= lt!114580 (MissingZero!904 index!297)) (= lt!114580 (MissingVacant!904 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11203 (_ BitVec 32)) SeekEntryResult!904)

(assert (=> b!227965 (= lt!114580 (seekEntryOrOpen!0 key!932 (_keys!6310 thiss!1504) (mask!10124 thiss!1504)))))

(assert (= (and start!22058 res!112178) b!227958))

(assert (= (and b!227958 res!112185) b!227965))

(assert (= (and b!227965 res!112183) b!227960))

(assert (= (and b!227960 c!37797) b!227953))

(assert (= (and b!227960 (not c!37797)) b!227948))

(assert (= (and b!227948 c!37795) b!227950))

(assert (= (and b!227948 (not c!37795)) b!227959))

(assert (= (and b!227950 res!112180) b!227947))

(assert (= (and b!227947 res!112184) b!227962))

(assert (= (and b!227959 c!37796) b!227946))

(assert (= (and b!227959 (not c!37796)) b!227957))

(assert (= (and b!227946 res!112181) b!227952))

(assert (= (and b!227952 res!112177) b!227949))

(assert (= (or b!227950 b!227946) bm!21170))

(assert (= (or b!227962 b!227949) bm!21171))

(assert (= (and b!227960 res!112182) b!227954))

(assert (= (and b!227954 c!37798) b!227945))

(assert (= (and b!227954 (not c!37798)) b!227961))

(assert (= (and b!227954 (not res!112187)) b!227955))

(assert (= (and b!227955 (not res!112179)) b!227944))

(assert (= (and b!227944 (not res!112186)) b!227963))

(assert (= (and b!227943 condMapEmpty!10144) mapIsEmpty!10144))

(assert (= (and b!227943 (not condMapEmpty!10144)) mapNonEmpty!10144))

(assert (= (and mapNonEmpty!10144 ((_ is ValueCellFull!2648) mapValue!10144)) b!227956))

(assert (= (and b!227943 ((_ is ValueCellFull!2648) mapDefault!10144)) b!227964))

(assert (= b!227951 b!227943))

(assert (= start!22058 b!227951))

(declare-fun m!249319 () Bool)

(assert (=> b!227951 m!249319))

(declare-fun m!249321 () Bool)

(assert (=> b!227951 m!249321))

(declare-fun m!249323 () Bool)

(assert (=> b!227954 m!249323))

(declare-fun m!249325 () Bool)

(assert (=> b!227954 m!249325))

(declare-fun m!249327 () Bool)

(assert (=> b!227954 m!249327))

(declare-fun m!249329 () Bool)

(assert (=> b!227954 m!249329))

(declare-fun m!249331 () Bool)

(assert (=> b!227954 m!249331))

(declare-fun m!249333 () Bool)

(assert (=> b!227954 m!249333))

(declare-fun m!249335 () Bool)

(assert (=> b!227954 m!249335))

(declare-fun m!249337 () Bool)

(assert (=> b!227954 m!249337))

(declare-fun m!249339 () Bool)

(assert (=> b!227954 m!249339))

(declare-fun m!249341 () Bool)

(assert (=> b!227954 m!249341))

(declare-fun m!249343 () Bool)

(assert (=> mapNonEmpty!10144 m!249343))

(declare-fun m!249345 () Bool)

(assert (=> start!22058 m!249345))

(declare-fun m!249347 () Bool)

(assert (=> b!227952 m!249347))

(declare-fun m!249349 () Bool)

(assert (=> b!227953 m!249349))

(declare-fun m!249351 () Bool)

(assert (=> b!227963 m!249351))

(declare-fun m!249353 () Bool)

(assert (=> b!227960 m!249353))

(declare-fun m!249355 () Bool)

(assert (=> b!227960 m!249355))

(assert (=> b!227960 m!249355))

(declare-fun m!249357 () Bool)

(assert (=> b!227960 m!249357))

(assert (=> bm!21171 m!249325))

(declare-fun m!249359 () Bool)

(assert (=> b!227945 m!249359))

(declare-fun m!249361 () Bool)

(assert (=> b!227965 m!249361))

(declare-fun m!249363 () Bool)

(assert (=> b!227948 m!249363))

(declare-fun m!249365 () Bool)

(assert (=> b!227944 m!249365))

(declare-fun m!249367 () Bool)

(assert (=> bm!21170 m!249367))

(declare-fun m!249369 () Bool)

(assert (=> b!227947 m!249369))

(check-sat (not mapNonEmpty!10144) tp_is_empty!5983 (not start!22058) (not b!227965) (not b!227963) (not bm!21170) (not b!227953) (not b!227945) (not b!227960) (not b!227954) (not b!227944) (not b_next!6121) (not bm!21171) (not b!227951) b_and!12993 (not b!227948))
(check-sat b_and!12993 (not b_next!6121))
