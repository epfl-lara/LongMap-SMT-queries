; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22350 () Bool)

(assert start!22350)

(declare-fun b!234111 () Bool)

(declare-fun b_free!6303 () Bool)

(declare-fun b_next!6303 () Bool)

(assert (=> b!234111 (= b_free!6303 (not b_next!6303))))

(declare-fun tp!22062 () Bool)

(declare-fun b_and!13215 () Bool)

(assert (=> b!234111 (= tp!22062 b_and!13215)))

(declare-fun b!234109 () Bool)

(declare-fun e!152069 () Bool)

(declare-fun e!152067 () Bool)

(assert (=> b!234109 (= e!152069 e!152067)))

(declare-fun res!114856 () Bool)

(assert (=> b!234109 (=> (not res!114856) (not e!152067))))

(declare-datatypes ((SeekEntryResult!979 0))(
  ( (MissingZero!979 (index!6086 (_ BitVec 32))) (Found!979 (index!6087 (_ BitVec 32))) (Intermediate!979 (undefined!1791 Bool) (index!6088 (_ BitVec 32)) (x!23677 (_ BitVec 32))) (Undefined!979) (MissingVacant!979 (index!6089 (_ BitVec 32))) )
))
(declare-fun lt!118419 () SeekEntryResult!979)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!234109 (= res!114856 (or (= lt!118419 (MissingZero!979 index!297)) (= lt!118419 (MissingVacant!979 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7867 0))(
  ( (V!7868 (val!3127 Int)) )
))
(declare-datatypes ((ValueCell!2739 0))(
  ( (ValueCellFull!2739 (v!5150 V!7867)) (EmptyCell!2739) )
))
(declare-datatypes ((array!11579 0))(
  ( (array!11580 (arr!5506 (Array (_ BitVec 32) ValueCell!2739)) (size!5841 (_ BitVec 32))) )
))
(declare-datatypes ((array!11581 0))(
  ( (array!11582 (arr!5507 (Array (_ BitVec 32) (_ BitVec 64))) (size!5842 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3378 0))(
  ( (LongMapFixedSize!3379 (defaultEntry!4353 Int) (mask!10295 (_ BitVec 32)) (extraKeys!4090 (_ BitVec 32)) (zeroValue!4194 V!7867) (minValue!4194 V!7867) (_size!1738 (_ BitVec 32)) (_keys!6416 array!11581) (_values!4336 array!11579) (_vacant!1738 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3378)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11581 (_ BitVec 32)) SeekEntryResult!979)

(assert (=> b!234109 (= lt!118419 (seekEntryOrOpen!0 key!932 (_keys!6416 thiss!1504) (mask!10295 thiss!1504)))))

(declare-fun mapIsEmpty!10428 () Bool)

(declare-fun mapRes!10428 () Bool)

(assert (=> mapIsEmpty!10428 mapRes!10428))

(declare-fun res!114855 () Bool)

(assert (=> start!22350 (=> (not res!114855) (not e!152069))))

(declare-fun valid!1333 (LongMapFixedSize!3378) Bool)

(assert (=> start!22350 (= res!114855 (valid!1333 thiss!1504))))

(assert (=> start!22350 e!152069))

(declare-fun e!152066 () Bool)

(assert (=> start!22350 e!152066))

(assert (=> start!22350 true))

(declare-fun b!234110 () Bool)

(assert (=> b!234110 (= e!152067 (and (= (size!5841 (_values!4336 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10295 thiss!1504))) (= (size!5842 (_keys!6416 thiss!1504)) (size!5841 (_values!4336 thiss!1504))) (bvslt (mask!10295 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun e!152068 () Bool)

(declare-fun tp_is_empty!6165 () Bool)

(declare-fun array_inv!3629 (array!11581) Bool)

(declare-fun array_inv!3630 (array!11579) Bool)

(assert (=> b!234111 (= e!152066 (and tp!22062 tp_is_empty!6165 (array_inv!3629 (_keys!6416 thiss!1504)) (array_inv!3630 (_values!4336 thiss!1504)) e!152068))))

(declare-fun b!234112 () Bool)

(declare-fun e!152065 () Bool)

(assert (=> b!234112 (= e!152065 tp_is_empty!6165)))

(declare-fun b!234113 () Bool)

(declare-fun res!114857 () Bool)

(assert (=> b!234113 (=> (not res!114857) (not e!152067))))

(declare-datatypes ((tuple2!4610 0))(
  ( (tuple2!4611 (_1!2316 (_ BitVec 64)) (_2!2316 V!7867)) )
))
(declare-datatypes ((List!3521 0))(
  ( (Nil!3518) (Cons!3517 (h!4167 tuple2!4610) (t!8486 List!3521)) )
))
(declare-datatypes ((ListLongMap!3523 0))(
  ( (ListLongMap!3524 (toList!1777 List!3521)) )
))
(declare-fun contains!1649 (ListLongMap!3523 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1305 (array!11581 array!11579 (_ BitVec 32) (_ BitVec 32) V!7867 V!7867 (_ BitVec 32) Int) ListLongMap!3523)

(assert (=> b!234113 (= res!114857 (contains!1649 (getCurrentListMap!1305 (_keys!6416 thiss!1504) (_values!4336 thiss!1504) (mask!10295 thiss!1504) (extraKeys!4090 thiss!1504) (zeroValue!4194 thiss!1504) (minValue!4194 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4353 thiss!1504)) key!932))))

(declare-fun mapNonEmpty!10428 () Bool)

(declare-fun tp!22061 () Bool)

(assert (=> mapNonEmpty!10428 (= mapRes!10428 (and tp!22061 e!152065))))

(declare-fun mapRest!10428 () (Array (_ BitVec 32) ValueCell!2739))

(declare-fun mapKey!10428 () (_ BitVec 32))

(declare-fun mapValue!10428 () ValueCell!2739)

(assert (=> mapNonEmpty!10428 (= (arr!5506 (_values!4336 thiss!1504)) (store mapRest!10428 mapKey!10428 mapValue!10428))))

(declare-fun b!234114 () Bool)

(declare-fun res!114854 () Bool)

(assert (=> b!234114 (=> (not res!114854) (not e!152069))))

(assert (=> b!234114 (= res!114854 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!234115 () Bool)

(declare-fun e!152064 () Bool)

(assert (=> b!234115 (= e!152064 tp_is_empty!6165)))

(declare-fun b!234116 () Bool)

(declare-fun res!114853 () Bool)

(assert (=> b!234116 (=> (not res!114853) (not e!152067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!234116 (= res!114853 (validMask!0 (mask!10295 thiss!1504)))))

(declare-fun b!234117 () Bool)

(assert (=> b!234117 (= e!152068 (and e!152064 mapRes!10428))))

(declare-fun condMapEmpty!10428 () Bool)

(declare-fun mapDefault!10428 () ValueCell!2739)

(assert (=> b!234117 (= condMapEmpty!10428 (= (arr!5506 (_values!4336 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2739)) mapDefault!10428)))))

(assert (= (and start!22350 res!114855) b!234114))

(assert (= (and b!234114 res!114854) b!234109))

(assert (= (and b!234109 res!114856) b!234113))

(assert (= (and b!234113 res!114857) b!234116))

(assert (= (and b!234116 res!114853) b!234110))

(assert (= (and b!234117 condMapEmpty!10428) mapIsEmpty!10428))

(assert (= (and b!234117 (not condMapEmpty!10428)) mapNonEmpty!10428))

(get-info :version)

(assert (= (and mapNonEmpty!10428 ((_ is ValueCellFull!2739) mapValue!10428)) b!234112))

(assert (= (and b!234117 ((_ is ValueCellFull!2739) mapDefault!10428)) b!234115))

(assert (= b!234111 b!234117))

(assert (= start!22350 b!234111))

(declare-fun m!255451 () Bool)

(assert (=> b!234113 m!255451))

(assert (=> b!234113 m!255451))

(declare-fun m!255453 () Bool)

(assert (=> b!234113 m!255453))

(declare-fun m!255455 () Bool)

(assert (=> b!234109 m!255455))

(declare-fun m!255457 () Bool)

(assert (=> b!234111 m!255457))

(declare-fun m!255459 () Bool)

(assert (=> b!234111 m!255459))

(declare-fun m!255461 () Bool)

(assert (=> b!234116 m!255461))

(declare-fun m!255463 () Bool)

(assert (=> mapNonEmpty!10428 m!255463))

(declare-fun m!255465 () Bool)

(assert (=> start!22350 m!255465))

(check-sat (not b!234111) (not b_next!6303) tp_is_empty!6165 (not b!234113) (not b!234116) (not start!22350) (not mapNonEmpty!10428) b_and!13215 (not b!234109))
(check-sat b_and!13215 (not b_next!6303))
(get-model)

(declare-fun d!59059 () Bool)

(declare-fun e!152096 () Bool)

(assert (=> d!59059 e!152096))

(declare-fun res!114875 () Bool)

(assert (=> d!59059 (=> res!114875 e!152096)))

(declare-fun lt!118431 () Bool)

(assert (=> d!59059 (= res!114875 (not lt!118431))))

(declare-fun lt!118434 () Bool)

(assert (=> d!59059 (= lt!118431 lt!118434)))

(declare-datatypes ((Unit!7230 0))(
  ( (Unit!7231) )
))
(declare-fun lt!118433 () Unit!7230)

(declare-fun e!152097 () Unit!7230)

(assert (=> d!59059 (= lt!118433 e!152097)))

(declare-fun c!38978 () Bool)

(assert (=> d!59059 (= c!38978 lt!118434)))

(declare-fun containsKey!256 (List!3521 (_ BitVec 64)) Bool)

(assert (=> d!59059 (= lt!118434 (containsKey!256 (toList!1777 (getCurrentListMap!1305 (_keys!6416 thiss!1504) (_values!4336 thiss!1504) (mask!10295 thiss!1504) (extraKeys!4090 thiss!1504) (zeroValue!4194 thiss!1504) (minValue!4194 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4353 thiss!1504))) key!932))))

(assert (=> d!59059 (= (contains!1649 (getCurrentListMap!1305 (_keys!6416 thiss!1504) (_values!4336 thiss!1504) (mask!10295 thiss!1504) (extraKeys!4090 thiss!1504) (zeroValue!4194 thiss!1504) (minValue!4194 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4353 thiss!1504)) key!932) lt!118431)))

(declare-fun b!234151 () Bool)

(declare-fun lt!118432 () Unit!7230)

(assert (=> b!234151 (= e!152097 lt!118432)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!204 (List!3521 (_ BitVec 64)) Unit!7230)

(assert (=> b!234151 (= lt!118432 (lemmaContainsKeyImpliesGetValueByKeyDefined!204 (toList!1777 (getCurrentListMap!1305 (_keys!6416 thiss!1504) (_values!4336 thiss!1504) (mask!10295 thiss!1504) (extraKeys!4090 thiss!1504) (zeroValue!4194 thiss!1504) (minValue!4194 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4353 thiss!1504))) key!932))))

(declare-datatypes ((Option!270 0))(
  ( (Some!269 (v!5152 V!7867)) (None!268) )
))
(declare-fun isDefined!205 (Option!270) Bool)

(declare-fun getValueByKey!264 (List!3521 (_ BitVec 64)) Option!270)

(assert (=> b!234151 (isDefined!205 (getValueByKey!264 (toList!1777 (getCurrentListMap!1305 (_keys!6416 thiss!1504) (_values!4336 thiss!1504) (mask!10295 thiss!1504) (extraKeys!4090 thiss!1504) (zeroValue!4194 thiss!1504) (minValue!4194 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4353 thiss!1504))) key!932))))

(declare-fun b!234152 () Bool)

(declare-fun Unit!7232 () Unit!7230)

(assert (=> b!234152 (= e!152097 Unit!7232)))

(declare-fun b!234153 () Bool)

(assert (=> b!234153 (= e!152096 (isDefined!205 (getValueByKey!264 (toList!1777 (getCurrentListMap!1305 (_keys!6416 thiss!1504) (_values!4336 thiss!1504) (mask!10295 thiss!1504) (extraKeys!4090 thiss!1504) (zeroValue!4194 thiss!1504) (minValue!4194 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4353 thiss!1504))) key!932)))))

(assert (= (and d!59059 c!38978) b!234151))

(assert (= (and d!59059 (not c!38978)) b!234152))

(assert (= (and d!59059 (not res!114875)) b!234153))

(declare-fun m!255483 () Bool)

(assert (=> d!59059 m!255483))

(declare-fun m!255485 () Bool)

(assert (=> b!234151 m!255485))

(declare-fun m!255487 () Bool)

(assert (=> b!234151 m!255487))

(assert (=> b!234151 m!255487))

(declare-fun m!255489 () Bool)

(assert (=> b!234151 m!255489))

(assert (=> b!234153 m!255487))

(assert (=> b!234153 m!255487))

(assert (=> b!234153 m!255489))

(assert (=> b!234113 d!59059))

(declare-fun b!234196 () Bool)

(declare-fun c!38994 () Bool)

(assert (=> b!234196 (= c!38994 (and (not (= (bvand (extraKeys!4090 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4090 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!152124 () ListLongMap!3523)

(declare-fun e!152126 () ListLongMap!3523)

(assert (=> b!234196 (= e!152124 e!152126)))

(declare-fun b!234197 () Bool)

(declare-fun e!152134 () Bool)

(declare-fun lt!118495 () ListLongMap!3523)

(declare-fun apply!206 (ListLongMap!3523 (_ BitVec 64)) V!7867)

(assert (=> b!234197 (= e!152134 (= (apply!206 lt!118495 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4194 thiss!1504)))))

(declare-fun b!234198 () Bool)

(declare-fun call!21781 () ListLongMap!3523)

(assert (=> b!234198 (= e!152126 call!21781)))

(declare-fun b!234199 () Bool)

(declare-fun e!152132 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!234199 (= e!152132 (validKeyInArray!0 (select (arr!5507 (_keys!6416 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234200 () Bool)

(declare-fun e!152133 () Unit!7230)

(declare-fun Unit!7233 () Unit!7230)

(assert (=> b!234200 (= e!152133 Unit!7233)))

(declare-fun b!234201 () Bool)

(declare-fun call!21782 () ListLongMap!3523)

(assert (=> b!234201 (= e!152126 call!21782)))

(declare-fun bm!21777 () Bool)

(declare-fun call!21784 () Bool)

(assert (=> bm!21777 (= call!21784 (contains!1649 lt!118495 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!59061 () Bool)

(declare-fun e!152131 () Bool)

(assert (=> d!59061 e!152131))

(declare-fun res!114898 () Bool)

(assert (=> d!59061 (=> (not res!114898) (not e!152131))))

(assert (=> d!59061 (= res!114898 (or (bvsge #b00000000000000000000000000000000 (size!5842 (_keys!6416 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5842 (_keys!6416 thiss!1504))))))))

(declare-fun lt!118486 () ListLongMap!3523)

(assert (=> d!59061 (= lt!118495 lt!118486)))

(declare-fun lt!118497 () Unit!7230)

(assert (=> d!59061 (= lt!118497 e!152133)))

(declare-fun c!38991 () Bool)

(declare-fun e!152125 () Bool)

(assert (=> d!59061 (= c!38991 e!152125)))

(declare-fun res!114902 () Bool)

(assert (=> d!59061 (=> (not res!114902) (not e!152125))))

(assert (=> d!59061 (= res!114902 (bvslt #b00000000000000000000000000000000 (size!5842 (_keys!6416 thiss!1504))))))

(declare-fun e!152128 () ListLongMap!3523)

(assert (=> d!59061 (= lt!118486 e!152128)))

(declare-fun c!38993 () Bool)

(assert (=> d!59061 (= c!38993 (and (not (= (bvand (extraKeys!4090 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4090 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59061 (validMask!0 (mask!10295 thiss!1504))))

(assert (=> d!59061 (= (getCurrentListMap!1305 (_keys!6416 thiss!1504) (_values!4336 thiss!1504) (mask!10295 thiss!1504) (extraKeys!4090 thiss!1504) (zeroValue!4194 thiss!1504) (minValue!4194 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4353 thiss!1504)) lt!118495)))

(declare-fun b!234202 () Bool)

(declare-fun e!152130 () Bool)

(declare-fun e!152127 () Bool)

(assert (=> b!234202 (= e!152130 e!152127)))

(declare-fun res!114897 () Bool)

(assert (=> b!234202 (= res!114897 call!21784)))

(assert (=> b!234202 (=> (not res!114897) (not e!152127))))

(declare-fun b!234203 () Bool)

(declare-fun call!21780 () ListLongMap!3523)

(declare-fun +!633 (ListLongMap!3523 tuple2!4610) ListLongMap!3523)

(assert (=> b!234203 (= e!152128 (+!633 call!21780 (tuple2!4611 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4194 thiss!1504))))))

(declare-fun b!234204 () Bool)

(assert (=> b!234204 (= e!152128 e!152124)))

(declare-fun c!38995 () Bool)

(assert (=> b!234204 (= c!38995 (and (not (= (bvand (extraKeys!4090 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4090 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!21778 () Bool)

(declare-fun call!21786 () ListLongMap!3523)

(declare-fun getCurrentListMapNoExtraKeys!528 (array!11581 array!11579 (_ BitVec 32) (_ BitVec 32) V!7867 V!7867 (_ BitVec 32) Int) ListLongMap!3523)

(assert (=> bm!21778 (= call!21786 (getCurrentListMapNoExtraKeys!528 (_keys!6416 thiss!1504) (_values!4336 thiss!1504) (mask!10295 thiss!1504) (extraKeys!4090 thiss!1504) (zeroValue!4194 thiss!1504) (minValue!4194 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4353 thiss!1504)))))

(declare-fun b!234205 () Bool)

(assert (=> b!234205 (= e!152130 (not call!21784))))

(declare-fun b!234206 () Bool)

(declare-fun res!114895 () Bool)

(assert (=> b!234206 (=> (not res!114895) (not e!152131))))

(declare-fun e!152136 () Bool)

(assert (=> b!234206 (= res!114895 e!152136)))

(declare-fun res!114896 () Bool)

(assert (=> b!234206 (=> res!114896 e!152136)))

(assert (=> b!234206 (= res!114896 (not e!152132))))

(declare-fun res!114899 () Bool)

(assert (=> b!234206 (=> (not res!114899) (not e!152132))))

(assert (=> b!234206 (= res!114899 (bvslt #b00000000000000000000000000000000 (size!5842 (_keys!6416 thiss!1504))))))

(declare-fun bm!21779 () Bool)

(declare-fun call!21785 () ListLongMap!3523)

(assert (=> bm!21779 (= call!21780 (+!633 (ite c!38993 call!21786 (ite c!38995 call!21785 call!21781)) (ite (or c!38993 c!38995) (tuple2!4611 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4194 thiss!1504)) (tuple2!4611 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4194 thiss!1504)))))))

(declare-fun bm!21780 () Bool)

(assert (=> bm!21780 (= call!21781 call!21785)))

(declare-fun b!234207 () Bool)

(declare-fun e!152129 () Bool)

(declare-fun get!2825 (ValueCell!2739 V!7867) V!7867)

(declare-fun dynLambda!549 (Int (_ BitVec 64)) V!7867)

(assert (=> b!234207 (= e!152129 (= (apply!206 lt!118495 (select (arr!5507 (_keys!6416 thiss!1504)) #b00000000000000000000000000000000)) (get!2825 (select (arr!5506 (_values!4336 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!549 (defaultEntry!4353 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!234207 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5841 (_values!4336 thiss!1504))))))

(assert (=> b!234207 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5842 (_keys!6416 thiss!1504))))))

(declare-fun b!234208 () Bool)

(declare-fun lt!118485 () Unit!7230)

(assert (=> b!234208 (= e!152133 lt!118485)))

(declare-fun lt!118500 () ListLongMap!3523)

(assert (=> b!234208 (= lt!118500 (getCurrentListMapNoExtraKeys!528 (_keys!6416 thiss!1504) (_values!4336 thiss!1504) (mask!10295 thiss!1504) (extraKeys!4090 thiss!1504) (zeroValue!4194 thiss!1504) (minValue!4194 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4353 thiss!1504)))))

(declare-fun lt!118498 () (_ BitVec 64))

(assert (=> b!234208 (= lt!118498 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118488 () (_ BitVec 64))

(assert (=> b!234208 (= lt!118488 (select (arr!5507 (_keys!6416 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118493 () Unit!7230)

(declare-fun addStillContains!182 (ListLongMap!3523 (_ BitVec 64) V!7867 (_ BitVec 64)) Unit!7230)

(assert (=> b!234208 (= lt!118493 (addStillContains!182 lt!118500 lt!118498 (zeroValue!4194 thiss!1504) lt!118488))))

(assert (=> b!234208 (contains!1649 (+!633 lt!118500 (tuple2!4611 lt!118498 (zeroValue!4194 thiss!1504))) lt!118488)))

(declare-fun lt!118491 () Unit!7230)

(assert (=> b!234208 (= lt!118491 lt!118493)))

(declare-fun lt!118499 () ListLongMap!3523)

(assert (=> b!234208 (= lt!118499 (getCurrentListMapNoExtraKeys!528 (_keys!6416 thiss!1504) (_values!4336 thiss!1504) (mask!10295 thiss!1504) (extraKeys!4090 thiss!1504) (zeroValue!4194 thiss!1504) (minValue!4194 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4353 thiss!1504)))))

(declare-fun lt!118487 () (_ BitVec 64))

(assert (=> b!234208 (= lt!118487 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118480 () (_ BitVec 64))

(assert (=> b!234208 (= lt!118480 (select (arr!5507 (_keys!6416 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118490 () Unit!7230)

(declare-fun addApplyDifferent!182 (ListLongMap!3523 (_ BitVec 64) V!7867 (_ BitVec 64)) Unit!7230)

(assert (=> b!234208 (= lt!118490 (addApplyDifferent!182 lt!118499 lt!118487 (minValue!4194 thiss!1504) lt!118480))))

(assert (=> b!234208 (= (apply!206 (+!633 lt!118499 (tuple2!4611 lt!118487 (minValue!4194 thiss!1504))) lt!118480) (apply!206 lt!118499 lt!118480))))

(declare-fun lt!118483 () Unit!7230)

(assert (=> b!234208 (= lt!118483 lt!118490)))

(declare-fun lt!118494 () ListLongMap!3523)

(assert (=> b!234208 (= lt!118494 (getCurrentListMapNoExtraKeys!528 (_keys!6416 thiss!1504) (_values!4336 thiss!1504) (mask!10295 thiss!1504) (extraKeys!4090 thiss!1504) (zeroValue!4194 thiss!1504) (minValue!4194 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4353 thiss!1504)))))

(declare-fun lt!118481 () (_ BitVec 64))

(assert (=> b!234208 (= lt!118481 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118496 () (_ BitVec 64))

(assert (=> b!234208 (= lt!118496 (select (arr!5507 (_keys!6416 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118492 () Unit!7230)

(assert (=> b!234208 (= lt!118492 (addApplyDifferent!182 lt!118494 lt!118481 (zeroValue!4194 thiss!1504) lt!118496))))

(assert (=> b!234208 (= (apply!206 (+!633 lt!118494 (tuple2!4611 lt!118481 (zeroValue!4194 thiss!1504))) lt!118496) (apply!206 lt!118494 lt!118496))))

(declare-fun lt!118484 () Unit!7230)

(assert (=> b!234208 (= lt!118484 lt!118492)))

(declare-fun lt!118482 () ListLongMap!3523)

(assert (=> b!234208 (= lt!118482 (getCurrentListMapNoExtraKeys!528 (_keys!6416 thiss!1504) (_values!4336 thiss!1504) (mask!10295 thiss!1504) (extraKeys!4090 thiss!1504) (zeroValue!4194 thiss!1504) (minValue!4194 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4353 thiss!1504)))))

(declare-fun lt!118479 () (_ BitVec 64))

(assert (=> b!234208 (= lt!118479 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118489 () (_ BitVec 64))

(assert (=> b!234208 (= lt!118489 (select (arr!5507 (_keys!6416 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234208 (= lt!118485 (addApplyDifferent!182 lt!118482 lt!118479 (minValue!4194 thiss!1504) lt!118489))))

(assert (=> b!234208 (= (apply!206 (+!633 lt!118482 (tuple2!4611 lt!118479 (minValue!4194 thiss!1504))) lt!118489) (apply!206 lt!118482 lt!118489))))

(declare-fun b!234209 () Bool)

(declare-fun res!114894 () Bool)

(assert (=> b!234209 (=> (not res!114894) (not e!152131))))

(declare-fun e!152135 () Bool)

(assert (=> b!234209 (= res!114894 e!152135)))

(declare-fun c!38996 () Bool)

(assert (=> b!234209 (= c!38996 (not (= (bvand (extraKeys!4090 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!234210 () Bool)

(assert (=> b!234210 (= e!152124 call!21782)))

(declare-fun b!234211 () Bool)

(assert (=> b!234211 (= e!152136 e!152129)))

(declare-fun res!114901 () Bool)

(assert (=> b!234211 (=> (not res!114901) (not e!152129))))

(assert (=> b!234211 (= res!114901 (contains!1649 lt!118495 (select (arr!5507 (_keys!6416 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234211 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5842 (_keys!6416 thiss!1504))))))

(declare-fun bm!21781 () Bool)

(declare-fun call!21783 () Bool)

(assert (=> bm!21781 (= call!21783 (contains!1649 lt!118495 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!21782 () Bool)

(assert (=> bm!21782 (= call!21785 call!21786)))

(declare-fun b!234212 () Bool)

(assert (=> b!234212 (= e!152127 (= (apply!206 lt!118495 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4194 thiss!1504)))))

(declare-fun b!234213 () Bool)

(assert (=> b!234213 (= e!152125 (validKeyInArray!0 (select (arr!5507 (_keys!6416 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21783 () Bool)

(assert (=> bm!21783 (= call!21782 call!21780)))

(declare-fun b!234214 () Bool)

(assert (=> b!234214 (= e!152131 e!152130)))

(declare-fun c!38992 () Bool)

(assert (=> b!234214 (= c!38992 (not (= (bvand (extraKeys!4090 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!234215 () Bool)

(assert (=> b!234215 (= e!152135 (not call!21783))))

(declare-fun b!234216 () Bool)

(assert (=> b!234216 (= e!152135 e!152134)))

(declare-fun res!114900 () Bool)

(assert (=> b!234216 (= res!114900 call!21783)))

(assert (=> b!234216 (=> (not res!114900) (not e!152134))))

(assert (= (and d!59061 c!38993) b!234203))

(assert (= (and d!59061 (not c!38993)) b!234204))

(assert (= (and b!234204 c!38995) b!234210))

(assert (= (and b!234204 (not c!38995)) b!234196))

(assert (= (and b!234196 c!38994) b!234201))

(assert (= (and b!234196 (not c!38994)) b!234198))

(assert (= (or b!234201 b!234198) bm!21780))

(assert (= (or b!234210 bm!21780) bm!21782))

(assert (= (or b!234210 b!234201) bm!21783))

(assert (= (or b!234203 bm!21782) bm!21778))

(assert (= (or b!234203 bm!21783) bm!21779))

(assert (= (and d!59061 res!114902) b!234213))

(assert (= (and d!59061 c!38991) b!234208))

(assert (= (and d!59061 (not c!38991)) b!234200))

(assert (= (and d!59061 res!114898) b!234206))

(assert (= (and b!234206 res!114899) b!234199))

(assert (= (and b!234206 (not res!114896)) b!234211))

(assert (= (and b!234211 res!114901) b!234207))

(assert (= (and b!234206 res!114895) b!234209))

(assert (= (and b!234209 c!38996) b!234216))

(assert (= (and b!234209 (not c!38996)) b!234215))

(assert (= (and b!234216 res!114900) b!234197))

(assert (= (or b!234216 b!234215) bm!21781))

(assert (= (and b!234209 res!114894) b!234214))

(assert (= (and b!234214 c!38992) b!234202))

(assert (= (and b!234214 (not c!38992)) b!234205))

(assert (= (and b!234202 res!114897) b!234212))

(assert (= (or b!234202 b!234205) bm!21777))

(declare-fun b_lambda!7871 () Bool)

(assert (=> (not b_lambda!7871) (not b!234207)))

(declare-fun t!8489 () Bool)

(declare-fun tb!2925 () Bool)

(assert (=> (and b!234111 (= (defaultEntry!4353 thiss!1504) (defaultEntry!4353 thiss!1504)) t!8489) tb!2925))

(declare-fun result!5097 () Bool)

(assert (=> tb!2925 (= result!5097 tp_is_empty!6165)))

(assert (=> b!234207 t!8489))

(declare-fun b_and!13219 () Bool)

(assert (= b_and!13215 (and (=> t!8489 result!5097) b_and!13219)))

(declare-fun m!255491 () Bool)

(assert (=> bm!21777 m!255491))

(declare-fun m!255493 () Bool)

(assert (=> bm!21779 m!255493))

(declare-fun m!255495 () Bool)

(assert (=> bm!21781 m!255495))

(declare-fun m!255497 () Bool)

(assert (=> b!234197 m!255497))

(assert (=> d!59061 m!255461))

(declare-fun m!255499 () Bool)

(assert (=> b!234211 m!255499))

(assert (=> b!234211 m!255499))

(declare-fun m!255501 () Bool)

(assert (=> b!234211 m!255501))

(declare-fun m!255503 () Bool)

(assert (=> b!234203 m!255503))

(declare-fun m!255505 () Bool)

(assert (=> b!234207 m!255505))

(assert (=> b!234207 m!255505))

(declare-fun m!255507 () Bool)

(assert (=> b!234207 m!255507))

(declare-fun m!255509 () Bool)

(assert (=> b!234207 m!255509))

(assert (=> b!234207 m!255499))

(declare-fun m!255511 () Bool)

(assert (=> b!234207 m!255511))

(assert (=> b!234207 m!255507))

(assert (=> b!234207 m!255499))

(declare-fun m!255513 () Bool)

(assert (=> b!234212 m!255513))

(declare-fun m!255515 () Bool)

(assert (=> bm!21778 m!255515))

(assert (=> b!234199 m!255499))

(assert (=> b!234199 m!255499))

(declare-fun m!255517 () Bool)

(assert (=> b!234199 m!255517))

(assert (=> b!234213 m!255499))

(assert (=> b!234213 m!255499))

(assert (=> b!234213 m!255517))

(declare-fun m!255519 () Bool)

(assert (=> b!234208 m!255519))

(declare-fun m!255521 () Bool)

(assert (=> b!234208 m!255521))

(declare-fun m!255523 () Bool)

(assert (=> b!234208 m!255523))

(declare-fun m!255525 () Bool)

(assert (=> b!234208 m!255525))

(assert (=> b!234208 m!255499))

(declare-fun m!255527 () Bool)

(assert (=> b!234208 m!255527))

(declare-fun m!255529 () Bool)

(assert (=> b!234208 m!255529))

(declare-fun m!255531 () Bool)

(assert (=> b!234208 m!255531))

(declare-fun m!255533 () Bool)

(assert (=> b!234208 m!255533))

(assert (=> b!234208 m!255533))

(declare-fun m!255535 () Bool)

(assert (=> b!234208 m!255535))

(declare-fun m!255537 () Bool)

(assert (=> b!234208 m!255537))

(declare-fun m!255539 () Bool)

(assert (=> b!234208 m!255539))

(assert (=> b!234208 m!255527))

(declare-fun m!255541 () Bool)

(assert (=> b!234208 m!255541))

(assert (=> b!234208 m!255519))

(declare-fun m!255543 () Bool)

(assert (=> b!234208 m!255543))

(declare-fun m!255545 () Bool)

(assert (=> b!234208 m!255545))

(declare-fun m!255547 () Bool)

(assert (=> b!234208 m!255547))

(assert (=> b!234208 m!255515))

(assert (=> b!234208 m!255545))

(assert (=> b!234113 d!59061))

(declare-fun b!234231 () Bool)

(declare-fun e!152144 () SeekEntryResult!979)

(declare-fun lt!118508 () SeekEntryResult!979)

(assert (=> b!234231 (= e!152144 (Found!979 (index!6088 lt!118508)))))

(declare-fun b!234232 () Bool)

(declare-fun e!152145 () SeekEntryResult!979)

(assert (=> b!234232 (= e!152145 Undefined!979)))

(declare-fun b!234233 () Bool)

(declare-fun c!39005 () Bool)

(declare-fun lt!118507 () (_ BitVec 64))

(assert (=> b!234233 (= c!39005 (= lt!118507 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!152143 () SeekEntryResult!979)

(assert (=> b!234233 (= e!152144 e!152143)))

(declare-fun d!59063 () Bool)

(declare-fun lt!118509 () SeekEntryResult!979)

(assert (=> d!59063 (and (or ((_ is Undefined!979) lt!118509) (not ((_ is Found!979) lt!118509)) (and (bvsge (index!6087 lt!118509) #b00000000000000000000000000000000) (bvslt (index!6087 lt!118509) (size!5842 (_keys!6416 thiss!1504))))) (or ((_ is Undefined!979) lt!118509) ((_ is Found!979) lt!118509) (not ((_ is MissingZero!979) lt!118509)) (and (bvsge (index!6086 lt!118509) #b00000000000000000000000000000000) (bvslt (index!6086 lt!118509) (size!5842 (_keys!6416 thiss!1504))))) (or ((_ is Undefined!979) lt!118509) ((_ is Found!979) lt!118509) ((_ is MissingZero!979) lt!118509) (not ((_ is MissingVacant!979) lt!118509)) (and (bvsge (index!6089 lt!118509) #b00000000000000000000000000000000) (bvslt (index!6089 lt!118509) (size!5842 (_keys!6416 thiss!1504))))) (or ((_ is Undefined!979) lt!118509) (ite ((_ is Found!979) lt!118509) (= (select (arr!5507 (_keys!6416 thiss!1504)) (index!6087 lt!118509)) key!932) (ite ((_ is MissingZero!979) lt!118509) (= (select (arr!5507 (_keys!6416 thiss!1504)) (index!6086 lt!118509)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!979) lt!118509) (= (select (arr!5507 (_keys!6416 thiss!1504)) (index!6089 lt!118509)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59063 (= lt!118509 e!152145)))

(declare-fun c!39004 () Bool)

(assert (=> d!59063 (= c!39004 (and ((_ is Intermediate!979) lt!118508) (undefined!1791 lt!118508)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11581 (_ BitVec 32)) SeekEntryResult!979)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59063 (= lt!118508 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10295 thiss!1504)) key!932 (_keys!6416 thiss!1504) (mask!10295 thiss!1504)))))

(assert (=> d!59063 (validMask!0 (mask!10295 thiss!1504))))

(assert (=> d!59063 (= (seekEntryOrOpen!0 key!932 (_keys!6416 thiss!1504) (mask!10295 thiss!1504)) lt!118509)))

(declare-fun b!234234 () Bool)

(assert (=> b!234234 (= e!152145 e!152144)))

(assert (=> b!234234 (= lt!118507 (select (arr!5507 (_keys!6416 thiss!1504)) (index!6088 lt!118508)))))

(declare-fun c!39003 () Bool)

(assert (=> b!234234 (= c!39003 (= lt!118507 key!932))))

(declare-fun b!234235 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11581 (_ BitVec 32)) SeekEntryResult!979)

(assert (=> b!234235 (= e!152143 (seekKeyOrZeroReturnVacant!0 (x!23677 lt!118508) (index!6088 lt!118508) (index!6088 lt!118508) key!932 (_keys!6416 thiss!1504) (mask!10295 thiss!1504)))))

(declare-fun b!234236 () Bool)

(assert (=> b!234236 (= e!152143 (MissingZero!979 (index!6088 lt!118508)))))

(assert (= (and d!59063 c!39004) b!234232))

(assert (= (and d!59063 (not c!39004)) b!234234))

(assert (= (and b!234234 c!39003) b!234231))

(assert (= (and b!234234 (not c!39003)) b!234233))

(assert (= (and b!234233 c!39005) b!234236))

(assert (= (and b!234233 (not c!39005)) b!234235))

(assert (=> d!59063 m!255461))

(declare-fun m!255549 () Bool)

(assert (=> d!59063 m!255549))

(declare-fun m!255551 () Bool)

(assert (=> d!59063 m!255551))

(declare-fun m!255553 () Bool)

(assert (=> d!59063 m!255553))

(declare-fun m!255555 () Bool)

(assert (=> d!59063 m!255555))

(assert (=> d!59063 m!255549))

(declare-fun m!255557 () Bool)

(assert (=> d!59063 m!255557))

(declare-fun m!255559 () Bool)

(assert (=> b!234234 m!255559))

(declare-fun m!255561 () Bool)

(assert (=> b!234235 m!255561))

(assert (=> b!234109 d!59063))

(declare-fun d!59065 () Bool)

(assert (=> d!59065 (= (validMask!0 (mask!10295 thiss!1504)) (and (or (= (mask!10295 thiss!1504) #b00000000000000000000000000000111) (= (mask!10295 thiss!1504) #b00000000000000000000000000001111) (= (mask!10295 thiss!1504) #b00000000000000000000000000011111) (= (mask!10295 thiss!1504) #b00000000000000000000000000111111) (= (mask!10295 thiss!1504) #b00000000000000000000000001111111) (= (mask!10295 thiss!1504) #b00000000000000000000000011111111) (= (mask!10295 thiss!1504) #b00000000000000000000000111111111) (= (mask!10295 thiss!1504) #b00000000000000000000001111111111) (= (mask!10295 thiss!1504) #b00000000000000000000011111111111) (= (mask!10295 thiss!1504) #b00000000000000000000111111111111) (= (mask!10295 thiss!1504) #b00000000000000000001111111111111) (= (mask!10295 thiss!1504) #b00000000000000000011111111111111) (= (mask!10295 thiss!1504) #b00000000000000000111111111111111) (= (mask!10295 thiss!1504) #b00000000000000001111111111111111) (= (mask!10295 thiss!1504) #b00000000000000011111111111111111) (= (mask!10295 thiss!1504) #b00000000000000111111111111111111) (= (mask!10295 thiss!1504) #b00000000000001111111111111111111) (= (mask!10295 thiss!1504) #b00000000000011111111111111111111) (= (mask!10295 thiss!1504) #b00000000000111111111111111111111) (= (mask!10295 thiss!1504) #b00000000001111111111111111111111) (= (mask!10295 thiss!1504) #b00000000011111111111111111111111) (= (mask!10295 thiss!1504) #b00000000111111111111111111111111) (= (mask!10295 thiss!1504) #b00000001111111111111111111111111) (= (mask!10295 thiss!1504) #b00000011111111111111111111111111) (= (mask!10295 thiss!1504) #b00000111111111111111111111111111) (= (mask!10295 thiss!1504) #b00001111111111111111111111111111) (= (mask!10295 thiss!1504) #b00011111111111111111111111111111) (= (mask!10295 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10295 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!234116 d!59065))

(declare-fun d!59067 () Bool)

(assert (=> d!59067 (= (array_inv!3629 (_keys!6416 thiss!1504)) (bvsge (size!5842 (_keys!6416 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234111 d!59067))

(declare-fun d!59069 () Bool)

(assert (=> d!59069 (= (array_inv!3630 (_values!4336 thiss!1504)) (bvsge (size!5841 (_values!4336 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234111 d!59069))

(declare-fun d!59071 () Bool)

(declare-fun res!114909 () Bool)

(declare-fun e!152148 () Bool)

(assert (=> d!59071 (=> (not res!114909) (not e!152148))))

(declare-fun simpleValid!229 (LongMapFixedSize!3378) Bool)

(assert (=> d!59071 (= res!114909 (simpleValid!229 thiss!1504))))

(assert (=> d!59071 (= (valid!1333 thiss!1504) e!152148)))

(declare-fun b!234243 () Bool)

(declare-fun res!114910 () Bool)

(assert (=> b!234243 (=> (not res!114910) (not e!152148))))

(declare-fun arrayCountValidKeys!0 (array!11581 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!234243 (= res!114910 (= (arrayCountValidKeys!0 (_keys!6416 thiss!1504) #b00000000000000000000000000000000 (size!5842 (_keys!6416 thiss!1504))) (_size!1738 thiss!1504)))))

(declare-fun b!234244 () Bool)

(declare-fun res!114911 () Bool)

(assert (=> b!234244 (=> (not res!114911) (not e!152148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11581 (_ BitVec 32)) Bool)

(assert (=> b!234244 (= res!114911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6416 thiss!1504) (mask!10295 thiss!1504)))))

(declare-fun b!234245 () Bool)

(declare-datatypes ((List!3523 0))(
  ( (Nil!3520) (Cons!3519 (h!4169 (_ BitVec 64)) (t!8490 List!3523)) )
))
(declare-fun arrayNoDuplicates!0 (array!11581 (_ BitVec 32) List!3523) Bool)

(assert (=> b!234245 (= e!152148 (arrayNoDuplicates!0 (_keys!6416 thiss!1504) #b00000000000000000000000000000000 Nil!3520))))

(assert (= (and d!59071 res!114909) b!234243))

(assert (= (and b!234243 res!114910) b!234244))

(assert (= (and b!234244 res!114911) b!234245))

(declare-fun m!255563 () Bool)

(assert (=> d!59071 m!255563))

(declare-fun m!255565 () Bool)

(assert (=> b!234243 m!255565))

(declare-fun m!255567 () Bool)

(assert (=> b!234244 m!255567))

(declare-fun m!255569 () Bool)

(assert (=> b!234245 m!255569))

(assert (=> start!22350 d!59071))

(declare-fun b!234252 () Bool)

(declare-fun e!152153 () Bool)

(assert (=> b!234252 (= e!152153 tp_is_empty!6165)))

(declare-fun b!234253 () Bool)

(declare-fun e!152154 () Bool)

(assert (=> b!234253 (= e!152154 tp_is_empty!6165)))

(declare-fun mapNonEmpty!10434 () Bool)

(declare-fun mapRes!10434 () Bool)

(declare-fun tp!22071 () Bool)

(assert (=> mapNonEmpty!10434 (= mapRes!10434 (and tp!22071 e!152153))))

(declare-fun mapValue!10434 () ValueCell!2739)

(declare-fun mapKey!10434 () (_ BitVec 32))

(declare-fun mapRest!10434 () (Array (_ BitVec 32) ValueCell!2739))

(assert (=> mapNonEmpty!10434 (= mapRest!10428 (store mapRest!10434 mapKey!10434 mapValue!10434))))

(declare-fun mapIsEmpty!10434 () Bool)

(assert (=> mapIsEmpty!10434 mapRes!10434))

(declare-fun condMapEmpty!10434 () Bool)

(declare-fun mapDefault!10434 () ValueCell!2739)

(assert (=> mapNonEmpty!10428 (= condMapEmpty!10434 (= mapRest!10428 ((as const (Array (_ BitVec 32) ValueCell!2739)) mapDefault!10434)))))

(assert (=> mapNonEmpty!10428 (= tp!22061 (and e!152154 mapRes!10434))))

(assert (= (and mapNonEmpty!10428 condMapEmpty!10434) mapIsEmpty!10434))

(assert (= (and mapNonEmpty!10428 (not condMapEmpty!10434)) mapNonEmpty!10434))

(assert (= (and mapNonEmpty!10434 ((_ is ValueCellFull!2739) mapValue!10434)) b!234252))

(assert (= (and mapNonEmpty!10428 ((_ is ValueCellFull!2739) mapDefault!10434)) b!234253))

(declare-fun m!255571 () Bool)

(assert (=> mapNonEmpty!10434 m!255571))

(declare-fun b_lambda!7873 () Bool)

(assert (= b_lambda!7871 (or (and b!234111 b_free!6303) b_lambda!7873)))

(check-sat (not b!234207) (not b!234244) (not b!234243) (not b!234197) (not b!234212) tp_is_empty!6165 (not d!59063) (not d!59071) (not b!234153) (not bm!21777) (not b!234213) (not bm!21781) b_and!13219 (not b!234151) (not b_next!6303) (not b!234208) (not d!59059) (not mapNonEmpty!10434) (not bm!21778) (not b!234199) (not b!234211) (not b!234245) (not b!234235) (not bm!21779) (not b!234203) (not b_lambda!7873) (not d!59061))
(check-sat b_and!13219 (not b_next!6303))
