; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22028 () Bool)

(assert start!22028)

(declare-fun b!227112 () Bool)

(declare-fun b_free!6091 () Bool)

(declare-fun b_next!6091 () Bool)

(assert (=> b!227112 (= b_free!6091 (not b_next!6091))))

(declare-fun tp!21415 () Bool)

(declare-fun b_and!13003 () Bool)

(assert (=> b!227112 (= tp!21415 b_and!13003)))

(declare-fun b!227102 () Bool)

(declare-fun e!147328 () Bool)

(declare-fun e!147336 () Bool)

(assert (=> b!227102 (= e!147328 (not e!147336))))

(declare-fun res!111808 () Bool)

(assert (=> b!227102 (=> res!111808 e!147336)))

(declare-datatypes ((V!7585 0))(
  ( (V!7586 (val!3021 Int)) )
))
(declare-datatypes ((ValueCell!2633 0))(
  ( (ValueCellFull!2633 (v!5042 V!7585)) (EmptyCell!2633) )
))
(declare-datatypes ((array!11147 0))(
  ( (array!11148 (arr!5293 (Array (_ BitVec 32) ValueCell!2633)) (size!5626 (_ BitVec 32))) )
))
(declare-datatypes ((array!11149 0))(
  ( (array!11150 (arr!5294 (Array (_ BitVec 32) (_ BitVec 64))) (size!5627 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3166 0))(
  ( (LongMapFixedSize!3167 (defaultEntry!4242 Int) (mask!10100 (_ BitVec 32)) (extraKeys!3979 (_ BitVec 32)) (zeroValue!4083 V!7585) (minValue!4083 V!7585) (_size!1632 (_ BitVec 32)) (_keys!6296 array!11149) (_values!4225 array!11147) (_vacant!1632 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3166)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!227102 (= res!111808 (not (validMask!0 (mask!10100 thiss!1504))))))

(declare-fun lt!114333 () array!11149)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11149 (_ BitVec 32)) Bool)

(assert (=> b!227102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114333 (mask!10100 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((Unit!6855 0))(
  ( (Unit!6856) )
))
(declare-fun lt!114331 () Unit!6855)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11149 (_ BitVec 32) (_ BitVec 32)) Unit!6855)

(assert (=> b!227102 (= lt!114331 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6296 thiss!1504) index!297 (mask!10100 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11149 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!227102 (= (arrayCountValidKeys!0 lt!114333 #b00000000000000000000000000000000 (size!5627 (_keys!6296 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6296 thiss!1504) #b00000000000000000000000000000000 (size!5627 (_keys!6296 thiss!1504)))))))

(declare-fun lt!114325 () Unit!6855)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11149 (_ BitVec 32) (_ BitVec 64)) Unit!6855)

(assert (=> b!227102 (= lt!114325 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6296 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3299 0))(
  ( (Nil!3296) (Cons!3295 (h!3943 (_ BitVec 64)) (t!8250 List!3299)) )
))
(declare-fun arrayNoDuplicates!0 (array!11149 (_ BitVec 32) List!3299) Bool)

(assert (=> b!227102 (arrayNoDuplicates!0 lt!114333 #b00000000000000000000000000000000 Nil!3296)))

(assert (=> b!227102 (= lt!114333 (array!11150 (store (arr!5294 (_keys!6296 thiss!1504)) index!297 key!932) (size!5627 (_keys!6296 thiss!1504))))))

(declare-fun lt!114326 () Unit!6855)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11149 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3299) Unit!6855)

(assert (=> b!227102 (= lt!114326 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6296 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3296))))

(declare-fun lt!114327 () Unit!6855)

(declare-fun e!147331 () Unit!6855)

(assert (=> b!227102 (= lt!114327 e!147331)))

(declare-fun c!37656 () Bool)

(declare-fun arrayContainsKey!0 (array!11149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227102 (= c!37656 (arrayContainsKey!0 (_keys!6296 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227103 () Bool)

(declare-fun e!147326 () Bool)

(declare-datatypes ((SeekEntryResult!860 0))(
  ( (MissingZero!860 (index!5610 (_ BitVec 32))) (Found!860 (index!5611 (_ BitVec 32))) (Intermediate!860 (undefined!1672 Bool) (index!5612 (_ BitVec 32)) (x!23232 (_ BitVec 32))) (Undefined!860) (MissingVacant!860 (index!5613 (_ BitVec 32))) )
))
(declare-fun lt!114324 () SeekEntryResult!860)

(get-info :version)

(assert (=> b!227103 (= e!147326 ((_ is Undefined!860) lt!114324))))

(declare-fun mapIsEmpty!10099 () Bool)

(declare-fun mapRes!10099 () Bool)

(assert (=> mapIsEmpty!10099 mapRes!10099))

(declare-fun b!227104 () Bool)

(declare-fun e!147335 () Bool)

(declare-fun call!21095 () Bool)

(assert (=> b!227104 (= e!147335 (not call!21095))))

(declare-fun b!227105 () Bool)

(declare-fun res!111805 () Bool)

(assert (=> b!227105 (=> res!111805 e!147336)))

(assert (=> b!227105 (= res!111805 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6296 thiss!1504) (mask!10100 thiss!1504))))))

(declare-fun b!227106 () Bool)

(declare-fun e!147332 () Bool)

(declare-fun e!147325 () Bool)

(assert (=> b!227106 (= e!147332 e!147325)))

(declare-fun res!111799 () Bool)

(assert (=> b!227106 (=> (not res!111799) (not e!147325))))

(assert (=> b!227106 (= res!111799 (or (= lt!114324 (MissingZero!860 index!297)) (= lt!114324 (MissingVacant!860 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11149 (_ BitVec 32)) SeekEntryResult!860)

(assert (=> b!227106 (= lt!114324 (seekEntryOrOpen!0 key!932 (_keys!6296 thiss!1504) (mask!10100 thiss!1504)))))

(declare-fun b!227107 () Bool)

(declare-fun c!37657 () Bool)

(assert (=> b!227107 (= c!37657 ((_ is MissingVacant!860) lt!114324))))

(declare-fun e!147333 () Bool)

(assert (=> b!227107 (= e!147333 e!147326)))

(declare-fun b!227108 () Bool)

(declare-fun res!111803 () Bool)

(declare-fun e!147338 () Bool)

(assert (=> b!227108 (=> (not res!111803) (not e!147338))))

(declare-fun call!21096 () Bool)

(assert (=> b!227108 (= res!111803 call!21096)))

(assert (=> b!227108 (= e!147333 e!147338)))

(declare-fun res!111804 () Bool)

(assert (=> start!22028 (=> (not res!111804) (not e!147332))))

(declare-fun valid!1276 (LongMapFixedSize!3166) Bool)

(assert (=> start!22028 (= res!111804 (valid!1276 thiss!1504))))

(assert (=> start!22028 e!147332))

(declare-fun e!147337 () Bool)

(assert (=> start!22028 e!147337))

(assert (=> start!22028 true))

(declare-fun b!227109 () Bool)

(assert (=> b!227109 (= e!147338 (not call!21095))))

(declare-fun b!227110 () Bool)

(declare-fun res!111806 () Bool)

(assert (=> b!227110 (= res!111806 (= (select (arr!5294 (_keys!6296 thiss!1504)) (index!5613 lt!114324)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!227110 (=> (not res!111806) (not e!147335))))

(declare-fun b!227111 () Bool)

(declare-fun e!147334 () Unit!6855)

(declare-fun lt!114332 () Unit!6855)

(assert (=> b!227111 (= e!147334 lt!114332)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!252 (array!11149 array!11147 (_ BitVec 32) (_ BitVec 32) V!7585 V!7585 (_ BitVec 64) Int) Unit!6855)

(assert (=> b!227111 (= lt!114332 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!252 (_keys!6296 thiss!1504) (_values!4225 thiss!1504) (mask!10100 thiss!1504) (extraKeys!3979 thiss!1504) (zeroValue!4083 thiss!1504) (minValue!4083 thiss!1504) key!932 (defaultEntry!4242 thiss!1504)))))

(declare-fun c!37654 () Bool)

(assert (=> b!227111 (= c!37654 ((_ is MissingZero!860) lt!114324))))

(assert (=> b!227111 e!147333))

(declare-fun tp_is_empty!5953 () Bool)

(declare-fun e!147324 () Bool)

(declare-fun array_inv!3475 (array!11149) Bool)

(declare-fun array_inv!3476 (array!11147) Bool)

(assert (=> b!227112 (= e!147337 (and tp!21415 tp_is_empty!5953 (array_inv!3475 (_keys!6296 thiss!1504)) (array_inv!3476 (_values!4225 thiss!1504)) e!147324))))

(declare-fun bm!21092 () Bool)

(assert (=> bm!21092 (= call!21095 (arrayContainsKey!0 (_keys!6296 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227113 () Bool)

(declare-fun res!111801 () Bool)

(assert (=> b!227113 (=> (not res!111801) (not e!147332))))

(assert (=> b!227113 (= res!111801 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!227114 () Bool)

(declare-fun Unit!6857 () Unit!6855)

(assert (=> b!227114 (= e!147331 Unit!6857)))

(declare-fun lt!114329 () Unit!6855)

(declare-fun lemmaArrayContainsKeyThenInListMap!100 (array!11149 array!11147 (_ BitVec 32) (_ BitVec 32) V!7585 V!7585 (_ BitVec 64) (_ BitVec 32) Int) Unit!6855)

(assert (=> b!227114 (= lt!114329 (lemmaArrayContainsKeyThenInListMap!100 (_keys!6296 thiss!1504) (_values!4225 thiss!1504) (mask!10100 thiss!1504) (extraKeys!3979 thiss!1504) (zeroValue!4083 thiss!1504) (minValue!4083 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4242 thiss!1504)))))

(assert (=> b!227114 false))

(declare-fun b!227115 () Bool)

(assert (=> b!227115 (= e!147336 true)))

(declare-fun lt!114330 () Bool)

(assert (=> b!227115 (= lt!114330 (arrayNoDuplicates!0 (_keys!6296 thiss!1504) #b00000000000000000000000000000000 Nil!3296))))

(declare-fun b!227116 () Bool)

(declare-fun e!147330 () Bool)

(assert (=> b!227116 (= e!147330 tp_is_empty!5953)))

(declare-fun b!227117 () Bool)

(declare-fun res!111798 () Bool)

(assert (=> b!227117 (=> res!111798 e!147336)))

(assert (=> b!227117 (= res!111798 (or (not (= (size!5626 (_values!4225 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10100 thiss!1504)))) (not (= (size!5627 (_keys!6296 thiss!1504)) (size!5626 (_values!4225 thiss!1504)))) (bvslt (mask!10100 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3979 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3979 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!227118 () Bool)

(declare-fun e!147329 () Bool)

(assert (=> b!227118 (= e!147324 (and e!147329 mapRes!10099))))

(declare-fun condMapEmpty!10099 () Bool)

(declare-fun mapDefault!10099 () ValueCell!2633)

(assert (=> b!227118 (= condMapEmpty!10099 (= (arr!5293 (_values!4225 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2633)) mapDefault!10099)))))

(declare-fun b!227119 () Bool)

(declare-fun Unit!6858 () Unit!6855)

(assert (=> b!227119 (= e!147334 Unit!6858)))

(declare-fun lt!114334 () Unit!6855)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!262 (array!11149 array!11147 (_ BitVec 32) (_ BitVec 32) V!7585 V!7585 (_ BitVec 64) Int) Unit!6855)

(assert (=> b!227119 (= lt!114334 (lemmaInListMapThenSeekEntryOrOpenFindsIt!262 (_keys!6296 thiss!1504) (_values!4225 thiss!1504) (mask!10100 thiss!1504) (extraKeys!3979 thiss!1504) (zeroValue!4083 thiss!1504) (minValue!4083 thiss!1504) key!932 (defaultEntry!4242 thiss!1504)))))

(assert (=> b!227119 false))

(declare-fun mapNonEmpty!10099 () Bool)

(declare-fun tp!21414 () Bool)

(assert (=> mapNonEmpty!10099 (= mapRes!10099 (and tp!21414 e!147330))))

(declare-fun mapKey!10099 () (_ BitVec 32))

(declare-fun mapValue!10099 () ValueCell!2633)

(declare-fun mapRest!10099 () (Array (_ BitVec 32) ValueCell!2633))

(assert (=> mapNonEmpty!10099 (= (arr!5293 (_values!4225 thiss!1504)) (store mapRest!10099 mapKey!10099 mapValue!10099))))

(declare-fun b!227120 () Bool)

(assert (=> b!227120 (= e!147329 tp_is_empty!5953)))

(declare-fun b!227121 () Bool)

(assert (=> b!227121 (= e!147326 e!147335)))

(declare-fun res!111802 () Bool)

(assert (=> b!227121 (= res!111802 call!21096)))

(assert (=> b!227121 (=> (not res!111802) (not e!147335))))

(declare-fun b!227122 () Bool)

(assert (=> b!227122 (= e!147325 e!147328)))

(declare-fun res!111800 () Bool)

(assert (=> b!227122 (=> (not res!111800) (not e!147328))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227122 (= res!111800 (inRange!0 index!297 (mask!10100 thiss!1504)))))

(declare-fun lt!114328 () Unit!6855)

(assert (=> b!227122 (= lt!114328 e!147334)))

(declare-fun c!37655 () Bool)

(declare-datatypes ((tuple2!4388 0))(
  ( (tuple2!4389 (_1!2205 (_ BitVec 64)) (_2!2205 V!7585)) )
))
(declare-datatypes ((List!3300 0))(
  ( (Nil!3297) (Cons!3296 (h!3944 tuple2!4388) (t!8251 List!3300)) )
))
(declare-datatypes ((ListLongMap!3303 0))(
  ( (ListLongMap!3304 (toList!1667 List!3300)) )
))
(declare-fun contains!1556 (ListLongMap!3303 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1199 (array!11149 array!11147 (_ BitVec 32) (_ BitVec 32) V!7585 V!7585 (_ BitVec 32) Int) ListLongMap!3303)

(assert (=> b!227122 (= c!37655 (contains!1556 (getCurrentListMap!1199 (_keys!6296 thiss!1504) (_values!4225 thiss!1504) (mask!10100 thiss!1504) (extraKeys!3979 thiss!1504) (zeroValue!4083 thiss!1504) (minValue!4083 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4242 thiss!1504)) key!932))))

(declare-fun bm!21093 () Bool)

(assert (=> bm!21093 (= call!21096 (inRange!0 (ite c!37654 (index!5610 lt!114324) (index!5613 lt!114324)) (mask!10100 thiss!1504)))))

(declare-fun b!227123 () Bool)

(declare-fun Unit!6859 () Unit!6855)

(assert (=> b!227123 (= e!147331 Unit!6859)))

(declare-fun b!227124 () Bool)

(declare-fun res!111807 () Bool)

(assert (=> b!227124 (=> (not res!111807) (not e!147338))))

(assert (=> b!227124 (= res!111807 (= (select (arr!5294 (_keys!6296 thiss!1504)) (index!5610 lt!114324)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!22028 res!111804) b!227113))

(assert (= (and b!227113 res!111801) b!227106))

(assert (= (and b!227106 res!111799) b!227122))

(assert (= (and b!227122 c!37655) b!227119))

(assert (= (and b!227122 (not c!37655)) b!227111))

(assert (= (and b!227111 c!37654) b!227108))

(assert (= (and b!227111 (not c!37654)) b!227107))

(assert (= (and b!227108 res!111803) b!227124))

(assert (= (and b!227124 res!111807) b!227109))

(assert (= (and b!227107 c!37657) b!227121))

(assert (= (and b!227107 (not c!37657)) b!227103))

(assert (= (and b!227121 res!111802) b!227110))

(assert (= (and b!227110 res!111806) b!227104))

(assert (= (or b!227108 b!227121) bm!21093))

(assert (= (or b!227109 b!227104) bm!21092))

(assert (= (and b!227122 res!111800) b!227102))

(assert (= (and b!227102 c!37656) b!227114))

(assert (= (and b!227102 (not c!37656)) b!227123))

(assert (= (and b!227102 (not res!111808)) b!227117))

(assert (= (and b!227117 (not res!111798)) b!227105))

(assert (= (and b!227105 (not res!111805)) b!227115))

(assert (= (and b!227118 condMapEmpty!10099) mapIsEmpty!10099))

(assert (= (and b!227118 (not condMapEmpty!10099)) mapNonEmpty!10099))

(assert (= (and mapNonEmpty!10099 ((_ is ValueCellFull!2633) mapValue!10099)) b!227116))

(assert (= (and b!227118 ((_ is ValueCellFull!2633) mapDefault!10099)) b!227120))

(assert (= b!227112 b!227118))

(assert (= start!22028 b!227112))

(declare-fun m!249337 () Bool)

(assert (=> mapNonEmpty!10099 m!249337))

(declare-fun m!249339 () Bool)

(assert (=> start!22028 m!249339))

(declare-fun m!249341 () Bool)

(assert (=> b!227110 m!249341))

(declare-fun m!249343 () Bool)

(assert (=> b!227112 m!249343))

(declare-fun m!249345 () Bool)

(assert (=> b!227112 m!249345))

(declare-fun m!249347 () Bool)

(assert (=> bm!21092 m!249347))

(declare-fun m!249349 () Bool)

(assert (=> b!227105 m!249349))

(declare-fun m!249351 () Bool)

(assert (=> b!227124 m!249351))

(declare-fun m!249353 () Bool)

(assert (=> b!227114 m!249353))

(declare-fun m!249355 () Bool)

(assert (=> b!227115 m!249355))

(declare-fun m!249357 () Bool)

(assert (=> b!227106 m!249357))

(declare-fun m!249359 () Bool)

(assert (=> bm!21093 m!249359))

(declare-fun m!249361 () Bool)

(assert (=> b!227122 m!249361))

(declare-fun m!249363 () Bool)

(assert (=> b!227122 m!249363))

(assert (=> b!227122 m!249363))

(declare-fun m!249365 () Bool)

(assert (=> b!227122 m!249365))

(declare-fun m!249367 () Bool)

(assert (=> b!227111 m!249367))

(declare-fun m!249369 () Bool)

(assert (=> b!227119 m!249369))

(declare-fun m!249371 () Bool)

(assert (=> b!227102 m!249371))

(assert (=> b!227102 m!249347))

(declare-fun m!249373 () Bool)

(assert (=> b!227102 m!249373))

(declare-fun m!249375 () Bool)

(assert (=> b!227102 m!249375))

(declare-fun m!249377 () Bool)

(assert (=> b!227102 m!249377))

(declare-fun m!249379 () Bool)

(assert (=> b!227102 m!249379))

(declare-fun m!249381 () Bool)

(assert (=> b!227102 m!249381))

(declare-fun m!249383 () Bool)

(assert (=> b!227102 m!249383))

(declare-fun m!249385 () Bool)

(assert (=> b!227102 m!249385))

(declare-fun m!249387 () Bool)

(assert (=> b!227102 m!249387))

(check-sat (not bm!21093) (not b!227111) tp_is_empty!5953 (not b_next!6091) (not b!227114) (not b!227122) (not b!227102) (not b!227119) (not b!227115) (not b!227106) (not start!22028) (not mapNonEmpty!10099) (not b!227105) b_and!13003 (not b!227112) (not bm!21092))
(check-sat b_and!13003 (not b_next!6091))
