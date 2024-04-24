; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16792 () Bool)

(assert start!16792)

(declare-fun b!169078 () Bool)

(declare-fun b_free!4093 () Bool)

(declare-fun b_next!4093 () Bool)

(assert (=> b!169078 (= b_free!4093 (not b_next!4093))))

(declare-fun tp!14880 () Bool)

(declare-fun b_and!10521 () Bool)

(assert (=> b!169078 (= tp!14880 b_and!10521)))

(declare-fun b!169076 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4841 0))(
  ( (V!4842 (val!1992 Int)) )
))
(declare-datatypes ((ValueCell!1604 0))(
  ( (ValueCellFull!1604 (v!3858 V!4841)) (EmptyCell!1604) )
))
(declare-datatypes ((array!6873 0))(
  ( (array!6874 (arr!3272 (Array (_ BitVec 32) (_ BitVec 64))) (size!3560 (_ BitVec 32))) )
))
(declare-datatypes ((array!6875 0))(
  ( (array!6876 (arr!3273 (Array (_ BitVec 32) ValueCell!1604)) (size!3561 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2116 0))(
  ( (LongMapFixedSize!2117 (defaultEntry!3500 Int) (mask!8277 (_ BitVec 32)) (extraKeys!3241 (_ BitVec 32)) (zeroValue!3343 V!4841) (minValue!3343 V!4841) (_size!1107 (_ BitVec 32)) (_keys!5325 array!6873) (_values!3483 array!6875) (_vacant!1107 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2116)

(declare-datatypes ((SeekEntryResult!508 0))(
  ( (MissingZero!508 (index!4200 (_ BitVec 32))) (Found!508 (index!4201 (_ BitVec 32))) (Intermediate!508 (undefined!1320 Bool) (index!4202 (_ BitVec 32)) (x!18672 (_ BitVec 32))) (Undefined!508) (MissingVacant!508 (index!4203 (_ BitVec 32))) )
))
(declare-fun lt!84833 () SeekEntryResult!508)

(declare-fun e!111269 () Bool)

(assert (=> b!169076 (= e!111269 (= (select (arr!3272 (_keys!5325 thiss!1248)) (index!4201 lt!84833)) key!828))))

(declare-fun b!169077 () Bool)

(declare-fun e!111268 () Bool)

(declare-fun e!111266 () Bool)

(assert (=> b!169077 (= e!111268 e!111266)))

(declare-fun res!80473 () Bool)

(assert (=> b!169077 (=> (not res!80473) (not e!111266))))

(get-info :version)

(assert (=> b!169077 (= res!80473 (and (not ((_ is Undefined!508) lt!84833)) (not ((_ is MissingVacant!508) lt!84833)) (not ((_ is MissingZero!508) lt!84833)) ((_ is Found!508) lt!84833)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6873 (_ BitVec 32)) SeekEntryResult!508)

(assert (=> b!169077 (= lt!84833 (seekEntryOrOpen!0 key!828 (_keys!5325 thiss!1248) (mask!8277 thiss!1248)))))

(declare-fun e!111270 () Bool)

(declare-fun e!111272 () Bool)

(declare-fun tp_is_empty!3895 () Bool)

(declare-fun array_inv!2095 (array!6873) Bool)

(declare-fun array_inv!2096 (array!6875) Bool)

(assert (=> b!169078 (= e!111272 (and tp!14880 tp_is_empty!3895 (array_inv!2095 (_keys!5325 thiss!1248)) (array_inv!2096 (_values!3483 thiss!1248)) e!111270))))

(declare-fun res!80472 () Bool)

(assert (=> start!16792 (=> (not res!80472) (not e!111268))))

(declare-fun valid!925 (LongMapFixedSize!2116) Bool)

(assert (=> start!16792 (= res!80472 (valid!925 thiss!1248))))

(assert (=> start!16792 e!111268))

(assert (=> start!16792 e!111272))

(assert (=> start!16792 true))

(assert (=> start!16792 tp_is_empty!3895))

(declare-fun b!169079 () Bool)

(declare-datatypes ((Unit!5229 0))(
  ( (Unit!5230) )
))
(declare-fun e!111264 () Unit!5229)

(declare-fun Unit!5231 () Unit!5229)

(assert (=> b!169079 (= e!111264 Unit!5231)))

(declare-fun lt!84825 () Unit!5229)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!127 (array!6873 array!6875 (_ BitVec 32) (_ BitVec 32) V!4841 V!4841 (_ BitVec 64) Int) Unit!5229)

(assert (=> b!169079 (= lt!84825 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!127 (_keys!5325 thiss!1248) (_values!3483 thiss!1248) (mask!8277 thiss!1248) (extraKeys!3241 thiss!1248) (zeroValue!3343 thiss!1248) (minValue!3343 thiss!1248) key!828 (defaultEntry!3500 thiss!1248)))))

(assert (=> b!169079 false))

(declare-fun mapNonEmpty!6561 () Bool)

(declare-fun mapRes!6561 () Bool)

(declare-fun tp!14879 () Bool)

(declare-fun e!111267 () Bool)

(assert (=> mapNonEmpty!6561 (= mapRes!6561 (and tp!14879 e!111267))))

(declare-fun mapKey!6561 () (_ BitVec 32))

(declare-fun mapRest!6561 () (Array (_ BitVec 32) ValueCell!1604))

(declare-fun mapValue!6561 () ValueCell!1604)

(assert (=> mapNonEmpty!6561 (= (arr!3273 (_values!3483 thiss!1248)) (store mapRest!6561 mapKey!6561 mapValue!6561))))

(declare-fun b!169080 () Bool)

(declare-fun e!111271 () Bool)

(assert (=> b!169080 (= e!111271 tp_is_empty!3895)))

(declare-fun b!169081 () Bool)

(assert (=> b!169081 (= e!111267 tp_is_empty!3895)))

(declare-fun b!169082 () Bool)

(assert (=> b!169082 (= e!111266 (not true))))

(declare-fun lt!84827 () Bool)

(declare-fun lt!84831 () array!6875)

(assert (=> b!169082 (= lt!84827 (valid!925 (LongMapFixedSize!2117 (defaultEntry!3500 thiss!1248) (mask!8277 thiss!1248) (extraKeys!3241 thiss!1248) (zeroValue!3343 thiss!1248) (minValue!3343 thiss!1248) (_size!1107 thiss!1248) (_keys!5325 thiss!1248) lt!84831 (_vacant!1107 thiss!1248))))))

(declare-datatypes ((tuple2!3158 0))(
  ( (tuple2!3159 (_1!1590 (_ BitVec 64)) (_2!1590 V!4841)) )
))
(declare-datatypes ((List!2160 0))(
  ( (Nil!2157) (Cons!2156 (h!2773 tuple2!3158) (t!6954 List!2160)) )
))
(declare-datatypes ((ListLongMap!2119 0))(
  ( (ListLongMap!2120 (toList!1075 List!2160)) )
))
(declare-fun lt!84829 () ListLongMap!2119)

(declare-fun contains!1127 (ListLongMap!2119 (_ BitVec 64)) Bool)

(assert (=> b!169082 (contains!1127 lt!84829 (select (arr!3272 (_keys!5325 thiss!1248)) (index!4201 lt!84833)))))

(declare-fun lt!84828 () Unit!5229)

(declare-fun lemmaValidKeyInArrayIsInListMap!139 (array!6873 array!6875 (_ BitVec 32) (_ BitVec 32) V!4841 V!4841 (_ BitVec 32) Int) Unit!5229)

(assert (=> b!169082 (= lt!84828 (lemmaValidKeyInArrayIsInListMap!139 (_keys!5325 thiss!1248) lt!84831 (mask!8277 thiss!1248) (extraKeys!3241 thiss!1248) (zeroValue!3343 thiss!1248) (minValue!3343 thiss!1248) (index!4201 lt!84833) (defaultEntry!3500 thiss!1248)))))

(declare-fun lt!84834 () ListLongMap!2119)

(assert (=> b!169082 (= lt!84834 lt!84829)))

(declare-fun getCurrentListMap!735 (array!6873 array!6875 (_ BitVec 32) (_ BitVec 32) V!4841 V!4841 (_ BitVec 32) Int) ListLongMap!2119)

(assert (=> b!169082 (= lt!84829 (getCurrentListMap!735 (_keys!5325 thiss!1248) lt!84831 (mask!8277 thiss!1248) (extraKeys!3241 thiss!1248) (zeroValue!3343 thiss!1248) (minValue!3343 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3500 thiss!1248)))))

(declare-fun lt!84830 () ListLongMap!2119)

(declare-fun v!309 () V!4841)

(declare-fun +!241 (ListLongMap!2119 tuple2!3158) ListLongMap!2119)

(assert (=> b!169082 (= lt!84834 (+!241 lt!84830 (tuple2!3159 key!828 v!309)))))

(assert (=> b!169082 (= lt!84831 (array!6876 (store (arr!3273 (_values!3483 thiss!1248)) (index!4201 lt!84833) (ValueCellFull!1604 v!309)) (size!3561 (_values!3483 thiss!1248))))))

(declare-fun lt!84824 () Unit!5229)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!99 (array!6873 array!6875 (_ BitVec 32) (_ BitVec 32) V!4841 V!4841 (_ BitVec 32) (_ BitVec 64) V!4841 Int) Unit!5229)

(assert (=> b!169082 (= lt!84824 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!99 (_keys!5325 thiss!1248) (_values!3483 thiss!1248) (mask!8277 thiss!1248) (extraKeys!3241 thiss!1248) (zeroValue!3343 thiss!1248) (minValue!3343 thiss!1248) (index!4201 lt!84833) key!828 v!309 (defaultEntry!3500 thiss!1248)))))

(declare-fun lt!84826 () Unit!5229)

(assert (=> b!169082 (= lt!84826 e!111264)))

(declare-fun c!30434 () Bool)

(assert (=> b!169082 (= c!30434 (contains!1127 lt!84830 key!828))))

(assert (=> b!169082 (= lt!84830 (getCurrentListMap!735 (_keys!5325 thiss!1248) (_values!3483 thiss!1248) (mask!8277 thiss!1248) (extraKeys!3241 thiss!1248) (zeroValue!3343 thiss!1248) (minValue!3343 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3500 thiss!1248)))))

(declare-fun b!169083 () Bool)

(assert (=> b!169083 (= e!111270 (and e!111271 mapRes!6561))))

(declare-fun condMapEmpty!6561 () Bool)

(declare-fun mapDefault!6561 () ValueCell!1604)

(assert (=> b!169083 (= condMapEmpty!6561 (= (arr!3273 (_values!3483 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1604)) mapDefault!6561)))))

(declare-fun b!169084 () Bool)

(declare-fun lt!84832 () Unit!5229)

(assert (=> b!169084 (= e!111264 lt!84832)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!136 (array!6873 array!6875 (_ BitVec 32) (_ BitVec 32) V!4841 V!4841 (_ BitVec 64) Int) Unit!5229)

(assert (=> b!169084 (= lt!84832 (lemmaInListMapThenSeekEntryOrOpenFindsIt!136 (_keys!5325 thiss!1248) (_values!3483 thiss!1248) (mask!8277 thiss!1248) (extraKeys!3241 thiss!1248) (zeroValue!3343 thiss!1248) (minValue!3343 thiss!1248) key!828 (defaultEntry!3500 thiss!1248)))))

(declare-fun res!80474 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!169084 (= res!80474 (inRange!0 (index!4201 lt!84833) (mask!8277 thiss!1248)))))

(assert (=> b!169084 (=> (not res!80474) (not e!111269))))

(assert (=> b!169084 e!111269))

(declare-fun b!169085 () Bool)

(declare-fun res!80475 () Bool)

(assert (=> b!169085 (=> (not res!80475) (not e!111268))))

(assert (=> b!169085 (= res!80475 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6561 () Bool)

(assert (=> mapIsEmpty!6561 mapRes!6561))

(assert (= (and start!16792 res!80472) b!169085))

(assert (= (and b!169085 res!80475) b!169077))

(assert (= (and b!169077 res!80473) b!169082))

(assert (= (and b!169082 c!30434) b!169084))

(assert (= (and b!169082 (not c!30434)) b!169079))

(assert (= (and b!169084 res!80474) b!169076))

(assert (= (and b!169083 condMapEmpty!6561) mapIsEmpty!6561))

(assert (= (and b!169083 (not condMapEmpty!6561)) mapNonEmpty!6561))

(assert (= (and mapNonEmpty!6561 ((_ is ValueCellFull!1604) mapValue!6561)) b!169081))

(assert (= (and b!169083 ((_ is ValueCellFull!1604) mapDefault!6561)) b!169080))

(assert (= b!169078 b!169083))

(assert (= start!16792 b!169078))

(declare-fun m!198353 () Bool)

(assert (=> start!16792 m!198353))

(declare-fun m!198355 () Bool)

(assert (=> b!169076 m!198355))

(declare-fun m!198357 () Bool)

(assert (=> mapNonEmpty!6561 m!198357))

(declare-fun m!198359 () Bool)

(assert (=> b!169084 m!198359))

(declare-fun m!198361 () Bool)

(assert (=> b!169084 m!198361))

(declare-fun m!198363 () Bool)

(assert (=> b!169079 m!198363))

(declare-fun m!198365 () Bool)

(assert (=> b!169077 m!198365))

(declare-fun m!198367 () Bool)

(assert (=> b!169078 m!198367))

(declare-fun m!198369 () Bool)

(assert (=> b!169078 m!198369))

(assert (=> b!169082 m!198355))

(declare-fun m!198371 () Bool)

(assert (=> b!169082 m!198371))

(declare-fun m!198373 () Bool)

(assert (=> b!169082 m!198373))

(assert (=> b!169082 m!198355))

(declare-fun m!198375 () Bool)

(assert (=> b!169082 m!198375))

(declare-fun m!198377 () Bool)

(assert (=> b!169082 m!198377))

(declare-fun m!198379 () Bool)

(assert (=> b!169082 m!198379))

(declare-fun m!198381 () Bool)

(assert (=> b!169082 m!198381))

(declare-fun m!198383 () Bool)

(assert (=> b!169082 m!198383))

(declare-fun m!198385 () Bool)

(assert (=> b!169082 m!198385))

(declare-fun m!198387 () Bool)

(assert (=> b!169082 m!198387))

(check-sat (not start!16792) (not b!169079) (not b_next!4093) (not b!169077) b_and!10521 (not b!169084) (not b!169082) (not mapNonEmpty!6561) (not b!169078) tp_is_empty!3895)
(check-sat b_and!10521 (not b_next!4093))
