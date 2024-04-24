; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23332 () Bool)

(assert start!23332)

(declare-fun b!245341 () Bool)

(declare-fun b_free!6553 () Bool)

(declare-fun b_next!6553 () Bool)

(assert (=> b!245341 (= b_free!6553 (not b_next!6553))))

(declare-fun tp!22891 () Bool)

(declare-fun b_and!13555 () Bool)

(assert (=> b!245341 (= tp!22891 b_and!13555)))

(declare-fun b!245326 () Bool)

(declare-fun res!120343 () Bool)

(declare-datatypes ((V!8201 0))(
  ( (V!8202 (val!3252 Int)) )
))
(declare-datatypes ((ValueCell!2864 0))(
  ( (ValueCellFull!2864 (v!5305 V!8201)) (EmptyCell!2864) )
))
(declare-datatypes ((array!12125 0))(
  ( (array!12126 (arr!5755 (Array (_ BitVec 32) ValueCell!2864)) (size!6097 (_ BitVec 32))) )
))
(declare-datatypes ((array!12127 0))(
  ( (array!12128 (arr!5756 (Array (_ BitVec 32) (_ BitVec 64))) (size!6098 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3628 0))(
  ( (LongMapFixedSize!3629 (defaultEntry!4539 Int) (mask!10648 (_ BitVec 32)) (extraKeys!4276 (_ BitVec 32)) (zeroValue!4380 V!8201) (minValue!4380 V!8201) (_size!1863 (_ BitVec 32)) (_keys!6653 array!12127) (_values!4522 array!12125) (_vacant!1863 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3628)

(declare-datatypes ((SeekEntryResult!1055 0))(
  ( (MissingZero!1055 (index!6390 (_ BitVec 32))) (Found!1055 (index!6391 (_ BitVec 32))) (Intermediate!1055 (undefined!1867 Bool) (index!6392 (_ BitVec 32)) (x!24385 (_ BitVec 32))) (Undefined!1055) (MissingVacant!1055 (index!6393 (_ BitVec 32))) )
))
(declare-fun lt!122901 () SeekEntryResult!1055)

(assert (=> b!245326 (= res!120343 (= (select (arr!5756 (_keys!6653 thiss!1504)) (index!6393 lt!122901)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!159152 () Bool)

(assert (=> b!245326 (=> (not res!120343) (not e!159152))))

(declare-fun b!245327 () Bool)

(declare-fun e!159150 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!245327 (= e!159150 (not (validMask!0 (mask!10648 thiss!1504))))))

(declare-fun lt!122897 () array!12127)

(declare-fun arrayCountValidKeys!0 (array!12127 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!245327 (= (arrayCountValidKeys!0 lt!122897 #b00000000000000000000000000000000 (size!6098 (_keys!6653 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6653 thiss!1504) #b00000000000000000000000000000000 (size!6098 (_keys!6653 thiss!1504)))))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((Unit!7561 0))(
  ( (Unit!7562) )
))
(declare-fun lt!122894 () Unit!7561)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12127 (_ BitVec 32) (_ BitVec 64)) Unit!7561)

(assert (=> b!245327 (= lt!122894 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6653 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3594 0))(
  ( (Nil!3591) (Cons!3590 (h!4247 (_ BitVec 64)) (t!8599 List!3594)) )
))
(declare-fun arrayNoDuplicates!0 (array!12127 (_ BitVec 32) List!3594) Bool)

(assert (=> b!245327 (arrayNoDuplicates!0 lt!122897 #b00000000000000000000000000000000 Nil!3591)))

(assert (=> b!245327 (= lt!122897 (array!12128 (store (arr!5756 (_keys!6653 thiss!1504)) index!297 key!932) (size!6098 (_keys!6653 thiss!1504))))))

(declare-fun lt!122896 () Unit!7561)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12127 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3594) Unit!7561)

(assert (=> b!245327 (= lt!122896 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6653 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3591))))

(declare-fun lt!122895 () Unit!7561)

(declare-fun e!159158 () Unit!7561)

(assert (=> b!245327 (= lt!122895 e!159158)))

(declare-fun c!40962 () Bool)

(declare-fun arrayContainsKey!0 (array!12127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!245327 (= c!40962 (arrayContainsKey!0 (_keys!6653 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!245328 () Bool)

(declare-fun Unit!7563 () Unit!7561)

(assert (=> b!245328 (= e!159158 Unit!7563)))

(declare-fun b!245329 () Bool)

(declare-fun call!22881 () Bool)

(assert (=> b!245329 (= e!159152 (not call!22881))))

(declare-fun b!245330 () Bool)

(declare-fun e!159151 () Bool)

(declare-fun e!159155 () Bool)

(declare-fun mapRes!10882 () Bool)

(assert (=> b!245330 (= e!159151 (and e!159155 mapRes!10882))))

(declare-fun condMapEmpty!10882 () Bool)

(declare-fun mapDefault!10882 () ValueCell!2864)

(assert (=> b!245330 (= condMapEmpty!10882 (= (arr!5755 (_values!4522 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2864)) mapDefault!10882)))))

(declare-fun res!120348 () Bool)

(declare-fun e!159163 () Bool)

(assert (=> start!23332 (=> (not res!120348) (not e!159163))))

(declare-fun valid!1434 (LongMapFixedSize!3628) Bool)

(assert (=> start!23332 (= res!120348 (valid!1434 thiss!1504))))

(assert (=> start!23332 e!159163))

(declare-fun e!159161 () Bool)

(assert (=> start!23332 e!159161))

(assert (=> start!23332 true))

(declare-fun b!245331 () Bool)

(declare-fun tp_is_empty!6415 () Bool)

(assert (=> b!245331 (= e!159155 tp_is_empty!6415)))

(declare-fun call!22880 () Bool)

(declare-fun c!40961 () Bool)

(declare-fun bm!22877 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22877 (= call!22880 (inRange!0 (ite c!40961 (index!6390 lt!122901) (index!6393 lt!122901)) (mask!10648 thiss!1504)))))

(declare-fun b!245332 () Bool)

(declare-fun e!159154 () Unit!7561)

(declare-fun Unit!7564 () Unit!7561)

(assert (=> b!245332 (= e!159154 Unit!7564)))

(declare-fun lt!122902 () Unit!7561)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!371 (array!12127 array!12125 (_ BitVec 32) (_ BitVec 32) V!8201 V!8201 (_ BitVec 64) Int) Unit!7561)

(assert (=> b!245332 (= lt!122902 (lemmaInListMapThenSeekEntryOrOpenFindsIt!371 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) key!932 (defaultEntry!4539 thiss!1504)))))

(assert (=> b!245332 false))

(declare-fun mapIsEmpty!10882 () Bool)

(assert (=> mapIsEmpty!10882 mapRes!10882))

(declare-fun b!245333 () Bool)

(declare-fun c!40960 () Bool)

(get-info :version)

(assert (=> b!245333 (= c!40960 ((_ is MissingVacant!1055) lt!122901))))

(declare-fun e!159153 () Bool)

(declare-fun e!159156 () Bool)

(assert (=> b!245333 (= e!159153 e!159156)))

(declare-fun b!245334 () Bool)

(declare-fun e!159162 () Bool)

(assert (=> b!245334 (= e!159162 (not call!22881))))

(declare-fun bm!22878 () Bool)

(assert (=> bm!22878 (= call!22881 (arrayContainsKey!0 (_keys!6653 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!245335 () Bool)

(declare-fun e!159159 () Bool)

(assert (=> b!245335 (= e!159159 e!159150)))

(declare-fun res!120341 () Bool)

(assert (=> b!245335 (=> (not res!120341) (not e!159150))))

(assert (=> b!245335 (= res!120341 (inRange!0 index!297 (mask!10648 thiss!1504)))))

(declare-fun lt!122900 () Unit!7561)

(assert (=> b!245335 (= lt!122900 e!159154)))

(declare-fun c!40963 () Bool)

(declare-datatypes ((tuple2!4718 0))(
  ( (tuple2!4719 (_1!2370 (_ BitVec 64)) (_2!2370 V!8201)) )
))
(declare-datatypes ((List!3595 0))(
  ( (Nil!3592) (Cons!3591 (h!4248 tuple2!4718) (t!8600 List!3595)) )
))
(declare-datatypes ((ListLongMap!3633 0))(
  ( (ListLongMap!3634 (toList!1832 List!3595)) )
))
(declare-fun contains!1756 (ListLongMap!3633 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1364 (array!12127 array!12125 (_ BitVec 32) (_ BitVec 32) V!8201 V!8201 (_ BitVec 32) Int) ListLongMap!3633)

(assert (=> b!245335 (= c!40963 (contains!1756 (getCurrentListMap!1364 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)) key!932))))

(declare-fun b!245336 () Bool)

(declare-fun e!159160 () Bool)

(assert (=> b!245336 (= e!159160 tp_is_empty!6415)))

(declare-fun b!245337 () Bool)

(declare-fun res!120345 () Bool)

(assert (=> b!245337 (=> (not res!120345) (not e!159163))))

(assert (=> b!245337 (= res!120345 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!245338 () Bool)

(assert (=> b!245338 (= e!159156 e!159152)))

(declare-fun res!120347 () Bool)

(assert (=> b!245338 (= res!120347 call!22880)))

(assert (=> b!245338 (=> (not res!120347) (not e!159152))))

(declare-fun mapNonEmpty!10882 () Bool)

(declare-fun tp!22890 () Bool)

(assert (=> mapNonEmpty!10882 (= mapRes!10882 (and tp!22890 e!159160))))

(declare-fun mapKey!10882 () (_ BitVec 32))

(declare-fun mapValue!10882 () ValueCell!2864)

(declare-fun mapRest!10882 () (Array (_ BitVec 32) ValueCell!2864))

(assert (=> mapNonEmpty!10882 (= (arr!5755 (_values!4522 thiss!1504)) (store mapRest!10882 mapKey!10882 mapValue!10882))))

(declare-fun b!245339 () Bool)

(assert (=> b!245339 (= e!159156 ((_ is Undefined!1055) lt!122901))))

(declare-fun b!245340 () Bool)

(declare-fun res!120342 () Bool)

(assert (=> b!245340 (=> (not res!120342) (not e!159162))))

(assert (=> b!245340 (= res!120342 (= (select (arr!5756 (_keys!6653 thiss!1504)) (index!6390 lt!122901)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun array_inv!3787 (array!12127) Bool)

(declare-fun array_inv!3788 (array!12125) Bool)

(assert (=> b!245341 (= e!159161 (and tp!22891 tp_is_empty!6415 (array_inv!3787 (_keys!6653 thiss!1504)) (array_inv!3788 (_values!4522 thiss!1504)) e!159151))))

(declare-fun b!245342 () Bool)

(assert (=> b!245342 (= e!159163 e!159159)))

(declare-fun res!120344 () Bool)

(assert (=> b!245342 (=> (not res!120344) (not e!159159))))

(assert (=> b!245342 (= res!120344 (or (= lt!122901 (MissingZero!1055 index!297)) (= lt!122901 (MissingVacant!1055 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12127 (_ BitVec 32)) SeekEntryResult!1055)

(assert (=> b!245342 (= lt!122901 (seekEntryOrOpen!0 key!932 (_keys!6653 thiss!1504) (mask!10648 thiss!1504)))))

(declare-fun b!245343 () Bool)

(declare-fun lt!122899 () Unit!7561)

(assert (=> b!245343 (= e!159154 lt!122899)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!363 (array!12127 array!12125 (_ BitVec 32) (_ BitVec 32) V!8201 V!8201 (_ BitVec 64) Int) Unit!7561)

(assert (=> b!245343 (= lt!122899 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!363 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) key!932 (defaultEntry!4539 thiss!1504)))))

(assert (=> b!245343 (= c!40961 ((_ is MissingZero!1055) lt!122901))))

(assert (=> b!245343 e!159153))

(declare-fun b!245344 () Bool)

(declare-fun res!120346 () Bool)

(assert (=> b!245344 (=> (not res!120346) (not e!159162))))

(assert (=> b!245344 (= res!120346 call!22880)))

(assert (=> b!245344 (= e!159153 e!159162)))

(declare-fun b!245345 () Bool)

(declare-fun Unit!7565 () Unit!7561)

(assert (=> b!245345 (= e!159158 Unit!7565)))

(declare-fun lt!122898 () Unit!7561)

(declare-fun lemmaArrayContainsKeyThenInListMap!188 (array!12127 array!12125 (_ BitVec 32) (_ BitVec 32) V!8201 V!8201 (_ BitVec 64) (_ BitVec 32) Int) Unit!7561)

(assert (=> b!245345 (= lt!122898 (lemmaArrayContainsKeyThenInListMap!188 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)))))

(assert (=> b!245345 false))

(assert (= (and start!23332 res!120348) b!245337))

(assert (= (and b!245337 res!120345) b!245342))

(assert (= (and b!245342 res!120344) b!245335))

(assert (= (and b!245335 c!40963) b!245332))

(assert (= (and b!245335 (not c!40963)) b!245343))

(assert (= (and b!245343 c!40961) b!245344))

(assert (= (and b!245343 (not c!40961)) b!245333))

(assert (= (and b!245344 res!120346) b!245340))

(assert (= (and b!245340 res!120342) b!245334))

(assert (= (and b!245333 c!40960) b!245338))

(assert (= (and b!245333 (not c!40960)) b!245339))

(assert (= (and b!245338 res!120347) b!245326))

(assert (= (and b!245326 res!120343) b!245329))

(assert (= (or b!245344 b!245338) bm!22877))

(assert (= (or b!245334 b!245329) bm!22878))

(assert (= (and b!245335 res!120341) b!245327))

(assert (= (and b!245327 c!40962) b!245345))

(assert (= (and b!245327 (not c!40962)) b!245328))

(assert (= (and b!245330 condMapEmpty!10882) mapIsEmpty!10882))

(assert (= (and b!245330 (not condMapEmpty!10882)) mapNonEmpty!10882))

(assert (= (and mapNonEmpty!10882 ((_ is ValueCellFull!2864) mapValue!10882)) b!245336))

(assert (= (and b!245330 ((_ is ValueCellFull!2864) mapDefault!10882)) b!245331))

(assert (= b!245341 b!245330))

(assert (= start!23332 b!245341))

(declare-fun m!263091 () Bool)

(assert (=> bm!22878 m!263091))

(declare-fun m!263093 () Bool)

(assert (=> b!245335 m!263093))

(declare-fun m!263095 () Bool)

(assert (=> b!245335 m!263095))

(assert (=> b!245335 m!263095))

(declare-fun m!263097 () Bool)

(assert (=> b!245335 m!263097))

(declare-fun m!263099 () Bool)

(assert (=> b!245342 m!263099))

(declare-fun m!263101 () Bool)

(assert (=> start!23332 m!263101))

(declare-fun m!263103 () Bool)

(assert (=> mapNonEmpty!10882 m!263103))

(declare-fun m!263105 () Bool)

(assert (=> b!245327 m!263105))

(assert (=> b!245327 m!263091))

(declare-fun m!263107 () Bool)

(assert (=> b!245327 m!263107))

(declare-fun m!263109 () Bool)

(assert (=> b!245327 m!263109))

(declare-fun m!263111 () Bool)

(assert (=> b!245327 m!263111))

(declare-fun m!263113 () Bool)

(assert (=> b!245327 m!263113))

(declare-fun m!263115 () Bool)

(assert (=> b!245327 m!263115))

(declare-fun m!263117 () Bool)

(assert (=> b!245327 m!263117))

(declare-fun m!263119 () Bool)

(assert (=> b!245345 m!263119))

(declare-fun m!263121 () Bool)

(assert (=> b!245341 m!263121))

(declare-fun m!263123 () Bool)

(assert (=> b!245341 m!263123))

(declare-fun m!263125 () Bool)

(assert (=> bm!22877 m!263125))

(declare-fun m!263127 () Bool)

(assert (=> b!245332 m!263127))

(declare-fun m!263129 () Bool)

(assert (=> b!245343 m!263129))

(declare-fun m!263131 () Bool)

(assert (=> b!245326 m!263131))

(declare-fun m!263133 () Bool)

(assert (=> b!245340 m!263133))

(check-sat (not b!245335) (not b_next!6553) b_and!13555 (not b!245343) (not bm!22877) tp_is_empty!6415 (not mapNonEmpty!10882) (not bm!22878) (not start!23332) (not b!245345) (not b!245341) (not b!245332) (not b!245327) (not b!245342))
(check-sat b_and!13555 (not b_next!6553))
(get-model)

(declare-fun d!60255 () Bool)

(assert (=> d!60255 (= (inRange!0 (ite c!40961 (index!6390 lt!122901) (index!6393 lt!122901)) (mask!10648 thiss!1504)) (and (bvsge (ite c!40961 (index!6390 lt!122901) (index!6393 lt!122901)) #b00000000000000000000000000000000) (bvslt (ite c!40961 (index!6390 lt!122901) (index!6393 lt!122901)) (bvadd (mask!10648 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22877 d!60255))

(declare-fun d!60257 () Bool)

(declare-fun res!120403 () Bool)

(declare-fun e!159250 () Bool)

(assert (=> d!60257 (=> (not res!120403) (not e!159250))))

(declare-fun simpleValid!253 (LongMapFixedSize!3628) Bool)

(assert (=> d!60257 (= res!120403 (simpleValid!253 thiss!1504))))

(assert (=> d!60257 (= (valid!1434 thiss!1504) e!159250)))

(declare-fun b!245472 () Bool)

(declare-fun res!120404 () Bool)

(assert (=> b!245472 (=> (not res!120404) (not e!159250))))

(assert (=> b!245472 (= res!120404 (= (arrayCountValidKeys!0 (_keys!6653 thiss!1504) #b00000000000000000000000000000000 (size!6098 (_keys!6653 thiss!1504))) (_size!1863 thiss!1504)))))

(declare-fun b!245473 () Bool)

(declare-fun res!120405 () Bool)

(assert (=> b!245473 (=> (not res!120405) (not e!159250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12127 (_ BitVec 32)) Bool)

(assert (=> b!245473 (= res!120405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6653 thiss!1504) (mask!10648 thiss!1504)))))

(declare-fun b!245474 () Bool)

(assert (=> b!245474 (= e!159250 (arrayNoDuplicates!0 (_keys!6653 thiss!1504) #b00000000000000000000000000000000 Nil!3591))))

(assert (= (and d!60257 res!120403) b!245472))

(assert (= (and b!245472 res!120404) b!245473))

(assert (= (and b!245473 res!120405) b!245474))

(declare-fun m!263223 () Bool)

(assert (=> d!60257 m!263223))

(assert (=> b!245472 m!263115))

(declare-fun m!263225 () Bool)

(assert (=> b!245473 m!263225))

(declare-fun m!263227 () Bool)

(assert (=> b!245474 m!263227))

(assert (=> start!23332 d!60257))

(declare-fun d!60259 () Bool)

(declare-fun res!120410 () Bool)

(declare-fun e!159255 () Bool)

(assert (=> d!60259 (=> res!120410 e!159255)))

(assert (=> d!60259 (= res!120410 (= (select (arr!5756 (_keys!6653 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60259 (= (arrayContainsKey!0 (_keys!6653 thiss!1504) key!932 #b00000000000000000000000000000000) e!159255)))

(declare-fun b!245479 () Bool)

(declare-fun e!159256 () Bool)

(assert (=> b!245479 (= e!159255 e!159256)))

(declare-fun res!120411 () Bool)

(assert (=> b!245479 (=> (not res!120411) (not e!159256))))

(assert (=> b!245479 (= res!120411 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6098 (_keys!6653 thiss!1504))))))

(declare-fun b!245480 () Bool)

(assert (=> b!245480 (= e!159256 (arrayContainsKey!0 (_keys!6653 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60259 (not res!120410)) b!245479))

(assert (= (and b!245479 res!120411) b!245480))

(declare-fun m!263229 () Bool)

(assert (=> d!60259 m!263229))

(declare-fun m!263231 () Bool)

(assert (=> b!245480 m!263231))

(assert (=> bm!22878 d!60259))

(declare-fun d!60261 () Bool)

(assert (=> d!60261 (= (inRange!0 index!297 (mask!10648 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10648 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!245335 d!60261))

(declare-fun d!60263 () Bool)

(declare-fun e!159262 () Bool)

(assert (=> d!60263 e!159262))

(declare-fun res!120414 () Bool)

(assert (=> d!60263 (=> res!120414 e!159262)))

(declare-fun lt!122965 () Bool)

(assert (=> d!60263 (= res!120414 (not lt!122965))))

(declare-fun lt!122968 () Bool)

(assert (=> d!60263 (= lt!122965 lt!122968)))

(declare-fun lt!122966 () Unit!7561)

(declare-fun e!159261 () Unit!7561)

(assert (=> d!60263 (= lt!122966 e!159261)))

(declare-fun c!40990 () Bool)

(assert (=> d!60263 (= c!40990 lt!122968)))

(declare-fun containsKey!280 (List!3595 (_ BitVec 64)) Bool)

(assert (=> d!60263 (= lt!122968 (containsKey!280 (toList!1832 (getCurrentListMap!1364 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504))) key!932))))

(assert (=> d!60263 (= (contains!1756 (getCurrentListMap!1364 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)) key!932) lt!122965)))

(declare-fun b!245487 () Bool)

(declare-fun lt!122967 () Unit!7561)

(assert (=> b!245487 (= e!159261 lt!122967)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!228 (List!3595 (_ BitVec 64)) Unit!7561)

(assert (=> b!245487 (= lt!122967 (lemmaContainsKeyImpliesGetValueByKeyDefined!228 (toList!1832 (getCurrentListMap!1364 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504))) key!932))))

(declare-datatypes ((Option!295 0))(
  ( (Some!294 (v!5308 V!8201)) (None!293) )
))
(declare-fun isDefined!229 (Option!295) Bool)

(declare-fun getValueByKey!289 (List!3595 (_ BitVec 64)) Option!295)

(assert (=> b!245487 (isDefined!229 (getValueByKey!289 (toList!1832 (getCurrentListMap!1364 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504))) key!932))))

(declare-fun b!245488 () Bool)

(declare-fun Unit!7570 () Unit!7561)

(assert (=> b!245488 (= e!159261 Unit!7570)))

(declare-fun b!245489 () Bool)

(assert (=> b!245489 (= e!159262 (isDefined!229 (getValueByKey!289 (toList!1832 (getCurrentListMap!1364 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504))) key!932)))))

(assert (= (and d!60263 c!40990) b!245487))

(assert (= (and d!60263 (not c!40990)) b!245488))

(assert (= (and d!60263 (not res!120414)) b!245489))

(declare-fun m!263233 () Bool)

(assert (=> d!60263 m!263233))

(declare-fun m!263235 () Bool)

(assert (=> b!245487 m!263235))

(declare-fun m!263237 () Bool)

(assert (=> b!245487 m!263237))

(assert (=> b!245487 m!263237))

(declare-fun m!263239 () Bool)

(assert (=> b!245487 m!263239))

(assert (=> b!245489 m!263237))

(assert (=> b!245489 m!263237))

(assert (=> b!245489 m!263239))

(assert (=> b!245335 d!60263))

(declare-fun b!245532 () Bool)

(declare-fun e!159301 () Bool)

(declare-fun e!159296 () Bool)

(assert (=> b!245532 (= e!159301 e!159296)))

(declare-fun res!120436 () Bool)

(assert (=> b!245532 (=> (not res!120436) (not e!159296))))

(declare-fun lt!123028 () ListLongMap!3633)

(assert (=> b!245532 (= res!120436 (contains!1756 lt!123028 (select (arr!5756 (_keys!6653 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!245532 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6098 (_keys!6653 thiss!1504))))))

(declare-fun b!245533 () Bool)

(declare-fun e!159295 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!245533 (= e!159295 (validKeyInArray!0 (select (arr!5756 (_keys!6653 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!245534 () Bool)

(declare-fun e!159294 () ListLongMap!3633)

(declare-fun call!22910 () ListLongMap!3633)

(assert (=> b!245534 (= e!159294 call!22910)))

(declare-fun b!245535 () Bool)

(declare-fun apply!230 (ListLongMap!3633 (_ BitVec 64)) V!8201)

(declare-fun get!2960 (ValueCell!2864 V!8201) V!8201)

(declare-fun dynLambda!573 (Int (_ BitVec 64)) V!8201)

(assert (=> b!245535 (= e!159296 (= (apply!230 lt!123028 (select (arr!5756 (_keys!6653 thiss!1504)) #b00000000000000000000000000000000)) (get!2960 (select (arr!5755 (_values!4522 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!573 (defaultEntry!4539 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!245535 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6097 (_values!4522 thiss!1504))))))

(assert (=> b!245535 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6098 (_keys!6653 thiss!1504))))))

(declare-fun bm!22905 () Bool)

(declare-fun call!22909 () Bool)

(assert (=> bm!22905 (= call!22909 (contains!1756 lt!123028 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!245536 () Bool)

(declare-fun e!159291 () ListLongMap!3633)

(assert (=> b!245536 (= e!159291 call!22910)))

(declare-fun b!245537 () Bool)

(declare-fun e!159297 () Bool)

(assert (=> b!245537 (= e!159297 (= (apply!230 lt!123028 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4380 thiss!1504)))))

(declare-fun b!245538 () Bool)

(declare-fun e!159290 () Bool)

(assert (=> b!245538 (= e!159290 e!159297)))

(declare-fun res!120434 () Bool)

(declare-fun call!22911 () Bool)

(assert (=> b!245538 (= res!120434 call!22911)))

(assert (=> b!245538 (=> (not res!120434) (not e!159297))))

(declare-fun d!60265 () Bool)

(declare-fun e!159298 () Bool)

(assert (=> d!60265 e!159298))

(declare-fun res!120435 () Bool)

(assert (=> d!60265 (=> (not res!120435) (not e!159298))))

(assert (=> d!60265 (= res!120435 (or (bvsge #b00000000000000000000000000000000 (size!6098 (_keys!6653 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6098 (_keys!6653 thiss!1504))))))))

(declare-fun lt!123027 () ListLongMap!3633)

(assert (=> d!60265 (= lt!123028 lt!123027)))

(declare-fun lt!123013 () Unit!7561)

(declare-fun e!159299 () Unit!7561)

(assert (=> d!60265 (= lt!123013 e!159299)))

(declare-fun c!41008 () Bool)

(assert (=> d!60265 (= c!41008 e!159295)))

(declare-fun res!120437 () Bool)

(assert (=> d!60265 (=> (not res!120437) (not e!159295))))

(assert (=> d!60265 (= res!120437 (bvslt #b00000000000000000000000000000000 (size!6098 (_keys!6653 thiss!1504))))))

(declare-fun e!159293 () ListLongMap!3633)

(assert (=> d!60265 (= lt!123027 e!159293)))

(declare-fun c!41003 () Bool)

(assert (=> d!60265 (= c!41003 (and (not (= (bvand (extraKeys!4276 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4276 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60265 (validMask!0 (mask!10648 thiss!1504))))

(assert (=> d!60265 (= (getCurrentListMap!1364 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)) lt!123028)))

(declare-fun b!245539 () Bool)

(declare-fun res!120433 () Bool)

(assert (=> b!245539 (=> (not res!120433) (not e!159298))))

(assert (=> b!245539 (= res!120433 e!159290)))

(declare-fun c!41005 () Bool)

(assert (=> b!245539 (= c!41005 (not (= (bvand (extraKeys!4276 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!245540 () Bool)

(assert (=> b!245540 (= e!159290 (not call!22911))))

(declare-fun b!245541 () Bool)

(declare-fun lt!123020 () Unit!7561)

(assert (=> b!245541 (= e!159299 lt!123020)))

(declare-fun lt!123017 () ListLongMap!3633)

(declare-fun getCurrentListMapNoExtraKeys!546 (array!12127 array!12125 (_ BitVec 32) (_ BitVec 32) V!8201 V!8201 (_ BitVec 32) Int) ListLongMap!3633)

(assert (=> b!245541 (= lt!123017 (getCurrentListMapNoExtraKeys!546 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)))))

(declare-fun lt!123031 () (_ BitVec 64))

(assert (=> b!245541 (= lt!123031 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123024 () (_ BitVec 64))

(assert (=> b!245541 (= lt!123024 (select (arr!5756 (_keys!6653 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123032 () Unit!7561)

(declare-fun addStillContains!206 (ListLongMap!3633 (_ BitVec 64) V!8201 (_ BitVec 64)) Unit!7561)

(assert (=> b!245541 (= lt!123032 (addStillContains!206 lt!123017 lt!123031 (zeroValue!4380 thiss!1504) lt!123024))))

(declare-fun +!657 (ListLongMap!3633 tuple2!4718) ListLongMap!3633)

(assert (=> b!245541 (contains!1756 (+!657 lt!123017 (tuple2!4719 lt!123031 (zeroValue!4380 thiss!1504))) lt!123024)))

(declare-fun lt!123029 () Unit!7561)

(assert (=> b!245541 (= lt!123029 lt!123032)))

(declare-fun lt!123023 () ListLongMap!3633)

(assert (=> b!245541 (= lt!123023 (getCurrentListMapNoExtraKeys!546 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)))))

(declare-fun lt!123026 () (_ BitVec 64))

(assert (=> b!245541 (= lt!123026 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123022 () (_ BitVec 64))

(assert (=> b!245541 (= lt!123022 (select (arr!5756 (_keys!6653 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123014 () Unit!7561)

(declare-fun addApplyDifferent!206 (ListLongMap!3633 (_ BitVec 64) V!8201 (_ BitVec 64)) Unit!7561)

(assert (=> b!245541 (= lt!123014 (addApplyDifferent!206 lt!123023 lt!123026 (minValue!4380 thiss!1504) lt!123022))))

(assert (=> b!245541 (= (apply!230 (+!657 lt!123023 (tuple2!4719 lt!123026 (minValue!4380 thiss!1504))) lt!123022) (apply!230 lt!123023 lt!123022))))

(declare-fun lt!123025 () Unit!7561)

(assert (=> b!245541 (= lt!123025 lt!123014)))

(declare-fun lt!123021 () ListLongMap!3633)

(assert (=> b!245541 (= lt!123021 (getCurrentListMapNoExtraKeys!546 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)))))

(declare-fun lt!123033 () (_ BitVec 64))

(assert (=> b!245541 (= lt!123033 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123015 () (_ BitVec 64))

(assert (=> b!245541 (= lt!123015 (select (arr!5756 (_keys!6653 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123018 () Unit!7561)

(assert (=> b!245541 (= lt!123018 (addApplyDifferent!206 lt!123021 lt!123033 (zeroValue!4380 thiss!1504) lt!123015))))

(assert (=> b!245541 (= (apply!230 (+!657 lt!123021 (tuple2!4719 lt!123033 (zeroValue!4380 thiss!1504))) lt!123015) (apply!230 lt!123021 lt!123015))))

(declare-fun lt!123034 () Unit!7561)

(assert (=> b!245541 (= lt!123034 lt!123018)))

(declare-fun lt!123016 () ListLongMap!3633)

(assert (=> b!245541 (= lt!123016 (getCurrentListMapNoExtraKeys!546 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)))))

(declare-fun lt!123030 () (_ BitVec 64))

(assert (=> b!245541 (= lt!123030 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123019 () (_ BitVec 64))

(assert (=> b!245541 (= lt!123019 (select (arr!5756 (_keys!6653 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!245541 (= lt!123020 (addApplyDifferent!206 lt!123016 lt!123030 (minValue!4380 thiss!1504) lt!123019))))

(assert (=> b!245541 (= (apply!230 (+!657 lt!123016 (tuple2!4719 lt!123030 (minValue!4380 thiss!1504))) lt!123019) (apply!230 lt!123016 lt!123019))))

(declare-fun b!245542 () Bool)

(declare-fun e!159289 () Bool)

(assert (=> b!245542 (= e!159289 (validKeyInArray!0 (select (arr!5756 (_keys!6653 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22906 () Bool)

(declare-fun call!22912 () ListLongMap!3633)

(declare-fun call!22908 () ListLongMap!3633)

(assert (=> bm!22906 (= call!22912 call!22908)))

(declare-fun b!245543 () Bool)

(declare-fun e!159292 () Bool)

(assert (=> b!245543 (= e!159298 e!159292)))

(declare-fun c!41007 () Bool)

(assert (=> b!245543 (= c!41007 (not (= (bvand (extraKeys!4276 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22907 () Bool)

(declare-fun call!22914 () ListLongMap!3633)

(assert (=> bm!22907 (= call!22908 call!22914)))

(declare-fun b!245544 () Bool)

(declare-fun e!159300 () Bool)

(assert (=> b!245544 (= e!159292 e!159300)))

(declare-fun res!120439 () Bool)

(assert (=> b!245544 (= res!120439 call!22909)))

(assert (=> b!245544 (=> (not res!120439) (not e!159300))))

(declare-fun bm!22908 () Bool)

(assert (=> bm!22908 (= call!22914 (getCurrentListMapNoExtraKeys!546 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)))))

(declare-fun b!245545 () Bool)

(declare-fun Unit!7571 () Unit!7561)

(assert (=> b!245545 (= e!159299 Unit!7571)))

(declare-fun b!245546 () Bool)

(declare-fun res!120441 () Bool)

(assert (=> b!245546 (=> (not res!120441) (not e!159298))))

(assert (=> b!245546 (= res!120441 e!159301)))

(declare-fun res!120438 () Bool)

(assert (=> b!245546 (=> res!120438 e!159301)))

(assert (=> b!245546 (= res!120438 (not e!159289))))

(declare-fun res!120440 () Bool)

(assert (=> b!245546 (=> (not res!120440) (not e!159289))))

(assert (=> b!245546 (= res!120440 (bvslt #b00000000000000000000000000000000 (size!6098 (_keys!6653 thiss!1504))))))

(declare-fun b!245547 () Bool)

(assert (=> b!245547 (= e!159293 e!159294)))

(declare-fun c!41006 () Bool)

(assert (=> b!245547 (= c!41006 (and (not (= (bvand (extraKeys!4276 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4276 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!245548 () Bool)

(declare-fun c!41004 () Bool)

(assert (=> b!245548 (= c!41004 (and (not (= (bvand (extraKeys!4276 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4276 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!245548 (= e!159294 e!159291)))

(declare-fun b!245549 () Bool)

(declare-fun call!22913 () ListLongMap!3633)

(assert (=> b!245549 (= e!159293 (+!657 call!22913 (tuple2!4719 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4380 thiss!1504))))))

(declare-fun bm!22909 () Bool)

(assert (=> bm!22909 (= call!22910 call!22913)))

(declare-fun b!245550 () Bool)

(assert (=> b!245550 (= e!159300 (= (apply!230 lt!123028 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4380 thiss!1504)))))

(declare-fun b!245551 () Bool)

(assert (=> b!245551 (= e!159292 (not call!22909))))

(declare-fun bm!22910 () Bool)

(assert (=> bm!22910 (= call!22911 (contains!1756 lt!123028 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22911 () Bool)

(assert (=> bm!22911 (= call!22913 (+!657 (ite c!41003 call!22914 (ite c!41006 call!22908 call!22912)) (ite (or c!41003 c!41006) (tuple2!4719 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4380 thiss!1504)) (tuple2!4719 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4380 thiss!1504)))))))

(declare-fun b!245552 () Bool)

(assert (=> b!245552 (= e!159291 call!22912)))

(assert (= (and d!60265 c!41003) b!245549))

(assert (= (and d!60265 (not c!41003)) b!245547))

(assert (= (and b!245547 c!41006) b!245534))

(assert (= (and b!245547 (not c!41006)) b!245548))

(assert (= (and b!245548 c!41004) b!245536))

(assert (= (and b!245548 (not c!41004)) b!245552))

(assert (= (or b!245536 b!245552) bm!22906))

(assert (= (or b!245534 bm!22906) bm!22907))

(assert (= (or b!245534 b!245536) bm!22909))

(assert (= (or b!245549 bm!22907) bm!22908))

(assert (= (or b!245549 bm!22909) bm!22911))

(assert (= (and d!60265 res!120437) b!245533))

(assert (= (and d!60265 c!41008) b!245541))

(assert (= (and d!60265 (not c!41008)) b!245545))

(assert (= (and d!60265 res!120435) b!245546))

(assert (= (and b!245546 res!120440) b!245542))

(assert (= (and b!245546 (not res!120438)) b!245532))

(assert (= (and b!245532 res!120436) b!245535))

(assert (= (and b!245546 res!120441) b!245539))

(assert (= (and b!245539 c!41005) b!245538))

(assert (= (and b!245539 (not c!41005)) b!245540))

(assert (= (and b!245538 res!120434) b!245537))

(assert (= (or b!245538 b!245540) bm!22910))

(assert (= (and b!245539 res!120433) b!245543))

(assert (= (and b!245543 c!41007) b!245544))

(assert (= (and b!245543 (not c!41007)) b!245551))

(assert (= (and b!245544 res!120439) b!245550))

(assert (= (or b!245544 b!245551) bm!22905))

(declare-fun b_lambda!8045 () Bool)

(assert (=> (not b_lambda!8045) (not b!245535)))

(declare-fun t!8604 () Bool)

(declare-fun tb!2965 () Bool)

(assert (=> (and b!245341 (= (defaultEntry!4539 thiss!1504) (defaultEntry!4539 thiss!1504)) t!8604) tb!2965))

(declare-fun result!5233 () Bool)

(assert (=> tb!2965 (= result!5233 tp_is_empty!6415)))

(assert (=> b!245535 t!8604))

(declare-fun b_and!13561 () Bool)

(assert (= b_and!13555 (and (=> t!8604 result!5233) b_and!13561)))

(declare-fun m!263241 () Bool)

(assert (=> b!245541 m!263241))

(declare-fun m!263243 () Bool)

(assert (=> b!245541 m!263243))

(declare-fun m!263245 () Bool)

(assert (=> b!245541 m!263245))

(declare-fun m!263247 () Bool)

(assert (=> b!245541 m!263247))

(declare-fun m!263249 () Bool)

(assert (=> b!245541 m!263249))

(declare-fun m!263251 () Bool)

(assert (=> b!245541 m!263251))

(declare-fun m!263253 () Bool)

(assert (=> b!245541 m!263253))

(declare-fun m!263255 () Bool)

(assert (=> b!245541 m!263255))

(assert (=> b!245541 m!263241))

(declare-fun m!263257 () Bool)

(assert (=> b!245541 m!263257))

(declare-fun m!263259 () Bool)

(assert (=> b!245541 m!263259))

(declare-fun m!263261 () Bool)

(assert (=> b!245541 m!263261))

(assert (=> b!245541 m!263229))

(declare-fun m!263263 () Bool)

(assert (=> b!245541 m!263263))

(declare-fun m!263265 () Bool)

(assert (=> b!245541 m!263265))

(declare-fun m!263267 () Bool)

(assert (=> b!245541 m!263267))

(declare-fun m!263269 () Bool)

(assert (=> b!245541 m!263269))

(assert (=> b!245541 m!263265))

(assert (=> b!245541 m!263249))

(assert (=> b!245541 m!263255))

(declare-fun m!263271 () Bool)

(assert (=> b!245541 m!263271))

(declare-fun m!263273 () Bool)

(assert (=> bm!22910 m!263273))

(assert (=> b!245542 m!263229))

(assert (=> b!245542 m!263229))

(declare-fun m!263275 () Bool)

(assert (=> b!245542 m!263275))

(declare-fun m!263277 () Bool)

(assert (=> bm!22911 m!263277))

(assert (=> d!60265 m!263105))

(declare-fun m!263279 () Bool)

(assert (=> b!245549 m!263279))

(assert (=> b!245532 m!263229))

(assert (=> b!245532 m!263229))

(declare-fun m!263281 () Bool)

(assert (=> b!245532 m!263281))

(declare-fun m!263283 () Bool)

(assert (=> b!245535 m!263283))

(declare-fun m!263285 () Bool)

(assert (=> b!245535 m!263285))

(assert (=> b!245535 m!263283))

(declare-fun m!263287 () Bool)

(assert (=> b!245535 m!263287))

(assert (=> b!245535 m!263229))

(assert (=> b!245535 m!263229))

(declare-fun m!263289 () Bool)

(assert (=> b!245535 m!263289))

(assert (=> b!245535 m!263285))

(declare-fun m!263291 () Bool)

(assert (=> b!245550 m!263291))

(assert (=> b!245533 m!263229))

(assert (=> b!245533 m!263229))

(assert (=> b!245533 m!263275))

(assert (=> bm!22908 m!263247))

(declare-fun m!263293 () Bool)

(assert (=> bm!22905 m!263293))

(declare-fun m!263295 () Bool)

(assert (=> b!245537 m!263295))

(assert (=> b!245335 d!60265))

(assert (=> b!245327 d!60259))

(declare-fun d!60267 () Bool)

(declare-fun lt!123037 () (_ BitVec 32))

(assert (=> d!60267 (and (bvsge lt!123037 #b00000000000000000000000000000000) (bvsle lt!123037 (bvsub (size!6098 (_keys!6653 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!159306 () (_ BitVec 32))

(assert (=> d!60267 (= lt!123037 e!159306)))

(declare-fun c!41014 () Bool)

(assert (=> d!60267 (= c!41014 (bvsge #b00000000000000000000000000000000 (size!6098 (_keys!6653 thiss!1504))))))

(assert (=> d!60267 (and (bvsle #b00000000000000000000000000000000 (size!6098 (_keys!6653 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6098 (_keys!6653 thiss!1504)) (size!6098 (_keys!6653 thiss!1504))))))

(assert (=> d!60267 (= (arrayCountValidKeys!0 (_keys!6653 thiss!1504) #b00000000000000000000000000000000 (size!6098 (_keys!6653 thiss!1504))) lt!123037)))

(declare-fun b!245563 () Bool)

(assert (=> b!245563 (= e!159306 #b00000000000000000000000000000000)))

(declare-fun b!245564 () Bool)

(declare-fun e!159307 () (_ BitVec 32))

(assert (=> b!245564 (= e!159306 e!159307)))

(declare-fun c!41013 () Bool)

(assert (=> b!245564 (= c!41013 (validKeyInArray!0 (select (arr!5756 (_keys!6653 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!245565 () Bool)

(declare-fun call!22917 () (_ BitVec 32))

(assert (=> b!245565 (= e!159307 (bvadd #b00000000000000000000000000000001 call!22917))))

(declare-fun bm!22914 () Bool)

(assert (=> bm!22914 (= call!22917 (arrayCountValidKeys!0 (_keys!6653 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6098 (_keys!6653 thiss!1504))))))

(declare-fun b!245566 () Bool)

(assert (=> b!245566 (= e!159307 call!22917)))

(assert (= (and d!60267 c!41014) b!245563))

(assert (= (and d!60267 (not c!41014)) b!245564))

(assert (= (and b!245564 c!41013) b!245565))

(assert (= (and b!245564 (not c!41013)) b!245566))

(assert (= (or b!245565 b!245566) bm!22914))

(assert (=> b!245564 m!263229))

(assert (=> b!245564 m!263229))

(assert (=> b!245564 m!263275))

(declare-fun m!263297 () Bool)

(assert (=> bm!22914 m!263297))

(assert (=> b!245327 d!60267))

(declare-fun d!60269 () Bool)

(assert (=> d!60269 (= (validMask!0 (mask!10648 thiss!1504)) (and (or (= (mask!10648 thiss!1504) #b00000000000000000000000000000111) (= (mask!10648 thiss!1504) #b00000000000000000000000000001111) (= (mask!10648 thiss!1504) #b00000000000000000000000000011111) (= (mask!10648 thiss!1504) #b00000000000000000000000000111111) (= (mask!10648 thiss!1504) #b00000000000000000000000001111111) (= (mask!10648 thiss!1504) #b00000000000000000000000011111111) (= (mask!10648 thiss!1504) #b00000000000000000000000111111111) (= (mask!10648 thiss!1504) #b00000000000000000000001111111111) (= (mask!10648 thiss!1504) #b00000000000000000000011111111111) (= (mask!10648 thiss!1504) #b00000000000000000000111111111111) (= (mask!10648 thiss!1504) #b00000000000000000001111111111111) (= (mask!10648 thiss!1504) #b00000000000000000011111111111111) (= (mask!10648 thiss!1504) #b00000000000000000111111111111111) (= (mask!10648 thiss!1504) #b00000000000000001111111111111111) (= (mask!10648 thiss!1504) #b00000000000000011111111111111111) (= (mask!10648 thiss!1504) #b00000000000000111111111111111111) (= (mask!10648 thiss!1504) #b00000000000001111111111111111111) (= (mask!10648 thiss!1504) #b00000000000011111111111111111111) (= (mask!10648 thiss!1504) #b00000000000111111111111111111111) (= (mask!10648 thiss!1504) #b00000000001111111111111111111111) (= (mask!10648 thiss!1504) #b00000000011111111111111111111111) (= (mask!10648 thiss!1504) #b00000000111111111111111111111111) (= (mask!10648 thiss!1504) #b00000001111111111111111111111111) (= (mask!10648 thiss!1504) #b00000011111111111111111111111111) (= (mask!10648 thiss!1504) #b00000111111111111111111111111111) (= (mask!10648 thiss!1504) #b00001111111111111111111111111111) (= (mask!10648 thiss!1504) #b00011111111111111111111111111111) (= (mask!10648 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10648 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!245327 d!60269))

(declare-fun d!60271 () Bool)

(declare-fun lt!123038 () (_ BitVec 32))

(assert (=> d!60271 (and (bvsge lt!123038 #b00000000000000000000000000000000) (bvsle lt!123038 (bvsub (size!6098 lt!122897) #b00000000000000000000000000000000)))))

(declare-fun e!159308 () (_ BitVec 32))

(assert (=> d!60271 (= lt!123038 e!159308)))

(declare-fun c!41016 () Bool)

(assert (=> d!60271 (= c!41016 (bvsge #b00000000000000000000000000000000 (size!6098 (_keys!6653 thiss!1504))))))

(assert (=> d!60271 (and (bvsle #b00000000000000000000000000000000 (size!6098 (_keys!6653 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6098 (_keys!6653 thiss!1504)) (size!6098 lt!122897)))))

(assert (=> d!60271 (= (arrayCountValidKeys!0 lt!122897 #b00000000000000000000000000000000 (size!6098 (_keys!6653 thiss!1504))) lt!123038)))

(declare-fun b!245567 () Bool)

(assert (=> b!245567 (= e!159308 #b00000000000000000000000000000000)))

(declare-fun b!245568 () Bool)

(declare-fun e!159309 () (_ BitVec 32))

(assert (=> b!245568 (= e!159308 e!159309)))

(declare-fun c!41015 () Bool)

(assert (=> b!245568 (= c!41015 (validKeyInArray!0 (select (arr!5756 lt!122897) #b00000000000000000000000000000000)))))

(declare-fun b!245569 () Bool)

(declare-fun call!22918 () (_ BitVec 32))

(assert (=> b!245569 (= e!159309 (bvadd #b00000000000000000000000000000001 call!22918))))

(declare-fun bm!22915 () Bool)

(assert (=> bm!22915 (= call!22918 (arrayCountValidKeys!0 lt!122897 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6098 (_keys!6653 thiss!1504))))))

(declare-fun b!245570 () Bool)

(assert (=> b!245570 (= e!159309 call!22918)))

(assert (= (and d!60271 c!41016) b!245567))

(assert (= (and d!60271 (not c!41016)) b!245568))

(assert (= (and b!245568 c!41015) b!245569))

(assert (= (and b!245568 (not c!41015)) b!245570))

(assert (= (or b!245569 b!245570) bm!22915))

(declare-fun m!263299 () Bool)

(assert (=> b!245568 m!263299))

(assert (=> b!245568 m!263299))

(declare-fun m!263301 () Bool)

(assert (=> b!245568 m!263301))

(declare-fun m!263303 () Bool)

(assert (=> bm!22915 m!263303))

(assert (=> b!245327 d!60271))

(declare-fun d!60273 () Bool)

(declare-fun e!159312 () Bool)

(assert (=> d!60273 e!159312))

(declare-fun res!120444 () Bool)

(assert (=> d!60273 (=> (not res!120444) (not e!159312))))

(assert (=> d!60273 (= res!120444 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6098 (_keys!6653 thiss!1504)))))))

(declare-fun lt!123041 () Unit!7561)

(declare-fun choose!41 (array!12127 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3594) Unit!7561)

(assert (=> d!60273 (= lt!123041 (choose!41 (_keys!6653 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3591))))

(assert (=> d!60273 (bvslt (size!6098 (_keys!6653 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60273 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6653 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3591) lt!123041)))

(declare-fun b!245573 () Bool)

(assert (=> b!245573 (= e!159312 (arrayNoDuplicates!0 (array!12128 (store (arr!5756 (_keys!6653 thiss!1504)) index!297 key!932) (size!6098 (_keys!6653 thiss!1504))) #b00000000000000000000000000000000 Nil!3591))))

(assert (= (and d!60273 res!120444) b!245573))

(declare-fun m!263305 () Bool)

(assert (=> d!60273 m!263305))

(assert (=> b!245573 m!263113))

(declare-fun m!263307 () Bool)

(assert (=> b!245573 m!263307))

(assert (=> b!245327 d!60273))

(declare-fun b!245583 () Bool)

(declare-fun res!120453 () Bool)

(declare-fun e!159318 () Bool)

(assert (=> b!245583 (=> (not res!120453) (not e!159318))))

(assert (=> b!245583 (= res!120453 (validKeyInArray!0 key!932))))

(declare-fun b!245584 () Bool)

(assert (=> b!245584 (= e!159318 (bvslt (size!6098 (_keys!6653 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!245582 () Bool)

(declare-fun res!120456 () Bool)

(assert (=> b!245582 (=> (not res!120456) (not e!159318))))

(assert (=> b!245582 (= res!120456 (not (validKeyInArray!0 (select (arr!5756 (_keys!6653 thiss!1504)) index!297))))))

(declare-fun e!159317 () Bool)

(declare-fun b!245585 () Bool)

(assert (=> b!245585 (= e!159317 (= (arrayCountValidKeys!0 (array!12128 (store (arr!5756 (_keys!6653 thiss!1504)) index!297 key!932) (size!6098 (_keys!6653 thiss!1504))) #b00000000000000000000000000000000 (size!6098 (_keys!6653 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6653 thiss!1504) #b00000000000000000000000000000000 (size!6098 (_keys!6653 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun d!60275 () Bool)

(assert (=> d!60275 e!159317))

(declare-fun res!120455 () Bool)

(assert (=> d!60275 (=> (not res!120455) (not e!159317))))

(assert (=> d!60275 (= res!120455 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6098 (_keys!6653 thiss!1504)))))))

(declare-fun lt!123044 () Unit!7561)

(declare-fun choose!1 (array!12127 (_ BitVec 32) (_ BitVec 64)) Unit!7561)

(assert (=> d!60275 (= lt!123044 (choose!1 (_keys!6653 thiss!1504) index!297 key!932))))

(assert (=> d!60275 e!159318))

(declare-fun res!120454 () Bool)

(assert (=> d!60275 (=> (not res!120454) (not e!159318))))

(assert (=> d!60275 (= res!120454 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6098 (_keys!6653 thiss!1504)))))))

(assert (=> d!60275 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6653 thiss!1504) index!297 key!932) lt!123044)))

(assert (= (and d!60275 res!120454) b!245582))

(assert (= (and b!245582 res!120456) b!245583))

(assert (= (and b!245583 res!120453) b!245584))

(assert (= (and d!60275 res!120455) b!245585))

(declare-fun m!263309 () Bool)

(assert (=> b!245583 m!263309))

(declare-fun m!263311 () Bool)

(assert (=> b!245582 m!263311))

(assert (=> b!245582 m!263311))

(declare-fun m!263313 () Bool)

(assert (=> b!245582 m!263313))

(assert (=> b!245585 m!263113))

(declare-fun m!263315 () Bool)

(assert (=> b!245585 m!263315))

(assert (=> b!245585 m!263115))

(declare-fun m!263317 () Bool)

(assert (=> d!60275 m!263317))

(assert (=> b!245327 d!60275))

(declare-fun b!245596 () Bool)

(declare-fun e!159329 () Bool)

(declare-fun call!22921 () Bool)

(assert (=> b!245596 (= e!159329 call!22921)))

(declare-fun b!245597 () Bool)

(assert (=> b!245597 (= e!159329 call!22921)))

(declare-fun b!245598 () Bool)

(declare-fun e!159327 () Bool)

(declare-fun e!159328 () Bool)

(assert (=> b!245598 (= e!159327 e!159328)))

(declare-fun res!120465 () Bool)

(assert (=> b!245598 (=> (not res!120465) (not e!159328))))

(declare-fun e!159330 () Bool)

(assert (=> b!245598 (= res!120465 (not e!159330))))

(declare-fun res!120464 () Bool)

(assert (=> b!245598 (=> (not res!120464) (not e!159330))))

(assert (=> b!245598 (= res!120464 (validKeyInArray!0 (select (arr!5756 lt!122897) #b00000000000000000000000000000000)))))

(declare-fun b!245599 () Bool)

(assert (=> b!245599 (= e!159328 e!159329)))

(declare-fun c!41019 () Bool)

(assert (=> b!245599 (= c!41019 (validKeyInArray!0 (select (arr!5756 lt!122897) #b00000000000000000000000000000000)))))

(declare-fun b!245600 () Bool)

(declare-fun contains!1758 (List!3594 (_ BitVec 64)) Bool)

(assert (=> b!245600 (= e!159330 (contains!1758 Nil!3591 (select (arr!5756 lt!122897) #b00000000000000000000000000000000)))))

(declare-fun bm!22918 () Bool)

(assert (=> bm!22918 (= call!22921 (arrayNoDuplicates!0 lt!122897 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41019 (Cons!3590 (select (arr!5756 lt!122897) #b00000000000000000000000000000000) Nil!3591) Nil!3591)))))

(declare-fun d!60277 () Bool)

(declare-fun res!120463 () Bool)

(assert (=> d!60277 (=> res!120463 e!159327)))

(assert (=> d!60277 (= res!120463 (bvsge #b00000000000000000000000000000000 (size!6098 lt!122897)))))

(assert (=> d!60277 (= (arrayNoDuplicates!0 lt!122897 #b00000000000000000000000000000000 Nil!3591) e!159327)))

(assert (= (and d!60277 (not res!120463)) b!245598))

(assert (= (and b!245598 res!120464) b!245600))

(assert (= (and b!245598 res!120465) b!245599))

(assert (= (and b!245599 c!41019) b!245597))

(assert (= (and b!245599 (not c!41019)) b!245596))

(assert (= (or b!245597 b!245596) bm!22918))

(assert (=> b!245598 m!263299))

(assert (=> b!245598 m!263299))

(assert (=> b!245598 m!263301))

(assert (=> b!245599 m!263299))

(assert (=> b!245599 m!263299))

(assert (=> b!245599 m!263301))

(assert (=> b!245600 m!263299))

(assert (=> b!245600 m!263299))

(declare-fun m!263319 () Bool)

(assert (=> b!245600 m!263319))

(assert (=> bm!22918 m!263299))

(declare-fun m!263321 () Bool)

(assert (=> bm!22918 m!263321))

(assert (=> b!245327 d!60277))

(declare-fun d!60279 () Bool)

(declare-fun e!159333 () Bool)

(assert (=> d!60279 e!159333))

(declare-fun res!120470 () Bool)

(assert (=> d!60279 (=> (not res!120470) (not e!159333))))

(declare-fun lt!123050 () SeekEntryResult!1055)

(assert (=> d!60279 (= res!120470 ((_ is Found!1055) lt!123050))))

(assert (=> d!60279 (= lt!123050 (seekEntryOrOpen!0 key!932 (_keys!6653 thiss!1504) (mask!10648 thiss!1504)))))

(declare-fun lt!123049 () Unit!7561)

(declare-fun choose!1153 (array!12127 array!12125 (_ BitVec 32) (_ BitVec 32) V!8201 V!8201 (_ BitVec 64) Int) Unit!7561)

(assert (=> d!60279 (= lt!123049 (choose!1153 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) key!932 (defaultEntry!4539 thiss!1504)))))

(assert (=> d!60279 (validMask!0 (mask!10648 thiss!1504))))

(assert (=> d!60279 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!371 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) key!932 (defaultEntry!4539 thiss!1504)) lt!123049)))

(declare-fun b!245605 () Bool)

(declare-fun res!120471 () Bool)

(assert (=> b!245605 (=> (not res!120471) (not e!159333))))

(assert (=> b!245605 (= res!120471 (inRange!0 (index!6391 lt!123050) (mask!10648 thiss!1504)))))

(declare-fun b!245606 () Bool)

(assert (=> b!245606 (= e!159333 (= (select (arr!5756 (_keys!6653 thiss!1504)) (index!6391 lt!123050)) key!932))))

(assert (=> b!245606 (and (bvsge (index!6391 lt!123050) #b00000000000000000000000000000000) (bvslt (index!6391 lt!123050) (size!6098 (_keys!6653 thiss!1504))))))

(assert (= (and d!60279 res!120470) b!245605))

(assert (= (and b!245605 res!120471) b!245606))

(assert (=> d!60279 m!263099))

(declare-fun m!263323 () Bool)

(assert (=> d!60279 m!263323))

(assert (=> d!60279 m!263105))

(declare-fun m!263325 () Bool)

(assert (=> b!245605 m!263325))

(declare-fun m!263327 () Bool)

(assert (=> b!245606 m!263327))

(assert (=> b!245332 d!60279))

(declare-fun d!60281 () Bool)

(assert (=> d!60281 (contains!1756 (getCurrentListMap!1364 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)) key!932)))

(declare-fun lt!123053 () Unit!7561)

(declare-fun choose!1154 (array!12127 array!12125 (_ BitVec 32) (_ BitVec 32) V!8201 V!8201 (_ BitVec 64) (_ BitVec 32) Int) Unit!7561)

(assert (=> d!60281 (= lt!123053 (choose!1154 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)))))

(assert (=> d!60281 (validMask!0 (mask!10648 thiss!1504))))

(assert (=> d!60281 (= (lemmaArrayContainsKeyThenInListMap!188 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)) lt!123053)))

(declare-fun bs!8910 () Bool)

(assert (= bs!8910 d!60281))

(assert (=> bs!8910 m!263095))

(assert (=> bs!8910 m!263095))

(assert (=> bs!8910 m!263097))

(declare-fun m!263329 () Bool)

(assert (=> bs!8910 m!263329))

(assert (=> bs!8910 m!263105))

(assert (=> b!245345 d!60281))

(declare-fun d!60283 () Bool)

(assert (=> d!60283 (= (array_inv!3787 (_keys!6653 thiss!1504)) (bvsge (size!6098 (_keys!6653 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!245341 d!60283))

(declare-fun d!60285 () Bool)

(assert (=> d!60285 (= (array_inv!3788 (_values!4522 thiss!1504)) (bvsge (size!6097 (_values!4522 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!245341 d!60285))

(declare-fun b!245619 () Bool)

(declare-fun c!41028 () Bool)

(declare-fun lt!123061 () (_ BitVec 64))

(assert (=> b!245619 (= c!41028 (= lt!123061 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!159340 () SeekEntryResult!1055)

(declare-fun e!159341 () SeekEntryResult!1055)

(assert (=> b!245619 (= e!159340 e!159341)))

(declare-fun d!60287 () Bool)

(declare-fun lt!123062 () SeekEntryResult!1055)

(assert (=> d!60287 (and (or ((_ is Undefined!1055) lt!123062) (not ((_ is Found!1055) lt!123062)) (and (bvsge (index!6391 lt!123062) #b00000000000000000000000000000000) (bvslt (index!6391 lt!123062) (size!6098 (_keys!6653 thiss!1504))))) (or ((_ is Undefined!1055) lt!123062) ((_ is Found!1055) lt!123062) (not ((_ is MissingZero!1055) lt!123062)) (and (bvsge (index!6390 lt!123062) #b00000000000000000000000000000000) (bvslt (index!6390 lt!123062) (size!6098 (_keys!6653 thiss!1504))))) (or ((_ is Undefined!1055) lt!123062) ((_ is Found!1055) lt!123062) ((_ is MissingZero!1055) lt!123062) (not ((_ is MissingVacant!1055) lt!123062)) (and (bvsge (index!6393 lt!123062) #b00000000000000000000000000000000) (bvslt (index!6393 lt!123062) (size!6098 (_keys!6653 thiss!1504))))) (or ((_ is Undefined!1055) lt!123062) (ite ((_ is Found!1055) lt!123062) (= (select (arr!5756 (_keys!6653 thiss!1504)) (index!6391 lt!123062)) key!932) (ite ((_ is MissingZero!1055) lt!123062) (= (select (arr!5756 (_keys!6653 thiss!1504)) (index!6390 lt!123062)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1055) lt!123062) (= (select (arr!5756 (_keys!6653 thiss!1504)) (index!6393 lt!123062)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!159342 () SeekEntryResult!1055)

(assert (=> d!60287 (= lt!123062 e!159342)))

(declare-fun c!41027 () Bool)

(declare-fun lt!123060 () SeekEntryResult!1055)

(assert (=> d!60287 (= c!41027 (and ((_ is Intermediate!1055) lt!123060) (undefined!1867 lt!123060)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12127 (_ BitVec 32)) SeekEntryResult!1055)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60287 (= lt!123060 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10648 thiss!1504)) key!932 (_keys!6653 thiss!1504) (mask!10648 thiss!1504)))))

(assert (=> d!60287 (validMask!0 (mask!10648 thiss!1504))))

(assert (=> d!60287 (= (seekEntryOrOpen!0 key!932 (_keys!6653 thiss!1504) (mask!10648 thiss!1504)) lt!123062)))

(declare-fun b!245620 () Bool)

(assert (=> b!245620 (= e!159341 (MissingZero!1055 (index!6392 lt!123060)))))

(declare-fun b!245621 () Bool)

(assert (=> b!245621 (= e!159340 (Found!1055 (index!6392 lt!123060)))))

(declare-fun b!245622 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12127 (_ BitVec 32)) SeekEntryResult!1055)

(assert (=> b!245622 (= e!159341 (seekKeyOrZeroReturnVacant!0 (x!24385 lt!123060) (index!6392 lt!123060) (index!6392 lt!123060) key!932 (_keys!6653 thiss!1504) (mask!10648 thiss!1504)))))

(declare-fun b!245623 () Bool)

(assert (=> b!245623 (= e!159342 e!159340)))

(assert (=> b!245623 (= lt!123061 (select (arr!5756 (_keys!6653 thiss!1504)) (index!6392 lt!123060)))))

(declare-fun c!41026 () Bool)

(assert (=> b!245623 (= c!41026 (= lt!123061 key!932))))

(declare-fun b!245624 () Bool)

(assert (=> b!245624 (= e!159342 Undefined!1055)))

(assert (= (and d!60287 c!41027) b!245624))

(assert (= (and d!60287 (not c!41027)) b!245623))

(assert (= (and b!245623 c!41026) b!245621))

(assert (= (and b!245623 (not c!41026)) b!245619))

(assert (= (and b!245619 c!41028) b!245620))

(assert (= (and b!245619 (not c!41028)) b!245622))

(assert (=> d!60287 m!263105))

(declare-fun m!263331 () Bool)

(assert (=> d!60287 m!263331))

(declare-fun m!263333 () Bool)

(assert (=> d!60287 m!263333))

(declare-fun m!263335 () Bool)

(assert (=> d!60287 m!263335))

(declare-fun m!263337 () Bool)

(assert (=> d!60287 m!263337))

(assert (=> d!60287 m!263331))

(declare-fun m!263339 () Bool)

(assert (=> d!60287 m!263339))

(declare-fun m!263341 () Bool)

(assert (=> b!245622 m!263341))

(declare-fun m!263343 () Bool)

(assert (=> b!245623 m!263343))

(assert (=> b!245342 d!60287))

(declare-fun b!245642 () Bool)

(declare-fun lt!123067 () SeekEntryResult!1055)

(assert (=> b!245642 (and (bvsge (index!6390 lt!123067) #b00000000000000000000000000000000) (bvslt (index!6390 lt!123067) (size!6098 (_keys!6653 thiss!1504))))))

(declare-fun res!120481 () Bool)

(assert (=> b!245642 (= res!120481 (= (select (arr!5756 (_keys!6653 thiss!1504)) (index!6390 lt!123067)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!159354 () Bool)

(assert (=> b!245642 (=> (not res!120481) (not e!159354))))

(declare-fun b!245643 () Bool)

(declare-fun e!159352 () Bool)

(declare-fun e!159353 () Bool)

(assert (=> b!245643 (= e!159352 e!159353)))

(declare-fun c!41034 () Bool)

(assert (=> b!245643 (= c!41034 ((_ is MissingVacant!1055) lt!123067))))

(declare-fun b!245644 () Bool)

(declare-fun call!22926 () Bool)

(assert (=> b!245644 (= e!159354 (not call!22926))))

(declare-fun b!245645 () Bool)

(assert (=> b!245645 (= e!159353 ((_ is Undefined!1055) lt!123067))))

(declare-fun call!22927 () Bool)

(declare-fun bm!22923 () Bool)

(declare-fun c!41033 () Bool)

(assert (=> bm!22923 (= call!22927 (inRange!0 (ite c!41033 (index!6390 lt!123067) (index!6393 lt!123067)) (mask!10648 thiss!1504)))))

(declare-fun b!245641 () Bool)

(declare-fun res!120480 () Bool)

(declare-fun e!159351 () Bool)

(assert (=> b!245641 (=> (not res!120480) (not e!159351))))

(assert (=> b!245641 (= res!120480 (= (select (arr!5756 (_keys!6653 thiss!1504)) (index!6393 lt!123067)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245641 (and (bvsge (index!6393 lt!123067) #b00000000000000000000000000000000) (bvslt (index!6393 lt!123067) (size!6098 (_keys!6653 thiss!1504))))))

(declare-fun d!60289 () Bool)

(assert (=> d!60289 e!159352))

(assert (=> d!60289 (= c!41033 ((_ is MissingZero!1055) lt!123067))))

(assert (=> d!60289 (= lt!123067 (seekEntryOrOpen!0 key!932 (_keys!6653 thiss!1504) (mask!10648 thiss!1504)))))

(declare-fun lt!123068 () Unit!7561)

(declare-fun choose!1155 (array!12127 array!12125 (_ BitVec 32) (_ BitVec 32) V!8201 V!8201 (_ BitVec 64) Int) Unit!7561)

(assert (=> d!60289 (= lt!123068 (choose!1155 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) key!932 (defaultEntry!4539 thiss!1504)))))

(assert (=> d!60289 (validMask!0 (mask!10648 thiss!1504))))

(assert (=> d!60289 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!363 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) key!932 (defaultEntry!4539 thiss!1504)) lt!123068)))

(declare-fun b!245646 () Bool)

(assert (=> b!245646 (= e!159352 e!159354)))

(declare-fun res!120482 () Bool)

(assert (=> b!245646 (= res!120482 call!22927)))

(assert (=> b!245646 (=> (not res!120482) (not e!159354))))

(declare-fun bm!22924 () Bool)

(assert (=> bm!22924 (= call!22926 (arrayContainsKey!0 (_keys!6653 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!245647 () Bool)

(assert (=> b!245647 (= e!159351 (not call!22926))))

(declare-fun b!245648 () Bool)

(declare-fun res!120483 () Bool)

(assert (=> b!245648 (=> (not res!120483) (not e!159351))))

(assert (=> b!245648 (= res!120483 call!22927)))

(assert (=> b!245648 (= e!159353 e!159351)))

(assert (= (and d!60289 c!41033) b!245646))

(assert (= (and d!60289 (not c!41033)) b!245643))

(assert (= (and b!245646 res!120482) b!245642))

(assert (= (and b!245642 res!120481) b!245644))

(assert (= (and b!245643 c!41034) b!245648))

(assert (= (and b!245643 (not c!41034)) b!245645))

(assert (= (and b!245648 res!120483) b!245641))

(assert (= (and b!245641 res!120480) b!245647))

(assert (= (or b!245646 b!245648) bm!22923))

(assert (= (or b!245644 b!245647) bm!22924))

(declare-fun m!263345 () Bool)

(assert (=> b!245641 m!263345))

(declare-fun m!263347 () Bool)

(assert (=> b!245642 m!263347))

(assert (=> bm!22924 m!263091))

(declare-fun m!263349 () Bool)

(assert (=> bm!22923 m!263349))

(assert (=> d!60289 m!263099))

(declare-fun m!263351 () Bool)

(assert (=> d!60289 m!263351))

(assert (=> d!60289 m!263105))

(assert (=> b!245343 d!60289))

(declare-fun b!245655 () Bool)

(declare-fun e!159359 () Bool)

(assert (=> b!245655 (= e!159359 tp_is_empty!6415)))

(declare-fun condMapEmpty!10891 () Bool)

(declare-fun mapDefault!10891 () ValueCell!2864)

(assert (=> mapNonEmpty!10882 (= condMapEmpty!10891 (= mapRest!10882 ((as const (Array (_ BitVec 32) ValueCell!2864)) mapDefault!10891)))))

(declare-fun e!159360 () Bool)

(declare-fun mapRes!10891 () Bool)

(assert (=> mapNonEmpty!10882 (= tp!22890 (and e!159360 mapRes!10891))))

(declare-fun mapNonEmpty!10891 () Bool)

(declare-fun tp!22906 () Bool)

(assert (=> mapNonEmpty!10891 (= mapRes!10891 (and tp!22906 e!159359))))

(declare-fun mapRest!10891 () (Array (_ BitVec 32) ValueCell!2864))

(declare-fun mapKey!10891 () (_ BitVec 32))

(declare-fun mapValue!10891 () ValueCell!2864)

(assert (=> mapNonEmpty!10891 (= mapRest!10882 (store mapRest!10891 mapKey!10891 mapValue!10891))))

(declare-fun mapIsEmpty!10891 () Bool)

(assert (=> mapIsEmpty!10891 mapRes!10891))

(declare-fun b!245656 () Bool)

(assert (=> b!245656 (= e!159360 tp_is_empty!6415)))

(assert (= (and mapNonEmpty!10882 condMapEmpty!10891) mapIsEmpty!10891))

(assert (= (and mapNonEmpty!10882 (not condMapEmpty!10891)) mapNonEmpty!10891))

(assert (= (and mapNonEmpty!10891 ((_ is ValueCellFull!2864) mapValue!10891)) b!245655))

(assert (= (and mapNonEmpty!10882 ((_ is ValueCellFull!2864) mapDefault!10891)) b!245656))

(declare-fun m!263353 () Bool)

(assert (=> mapNonEmpty!10891 m!263353))

(declare-fun b_lambda!8047 () Bool)

(assert (= b_lambda!8045 (or (and b!245341 b_free!6553) b_lambda!8047)))

(check-sat (not b!245605) (not b!245568) (not b!245622) (not d!60257) (not d!60273) (not b!245598) (not bm!22915) (not b!245564) (not d!60279) (not b!245472) (not b_next!6553) (not b!245480) (not b!245532) (not d!60265) (not b!245550) (not bm!22910) (not b!245542) (not b!245573) (not b!245473) (not bm!22908) (not b!245600) (not bm!22911) (not bm!22923) (not b!245541) (not d!60275) (not b!245535) (not b!245487) (not d!60263) (not b!245585) (not b!245474) (not b_lambda!8047) (not d!60281) (not bm!22905) (not mapNonEmpty!10891) b_and!13561 (not bm!22914) (not b!245583) (not bm!22918) (not d!60287) (not b!245582) (not b!245549) tp_is_empty!6415 (not b!245489) (not b!245533) (not d!60289) (not b!245537) (not b!245599) (not bm!22924))
(check-sat b_and!13561 (not b_next!6553))
