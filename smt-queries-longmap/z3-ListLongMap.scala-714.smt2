; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16792 () Bool)

(assert start!16792)

(declare-fun b!168891 () Bool)

(declare-fun b_free!4093 () Bool)

(declare-fun b_next!4093 () Bool)

(assert (=> b!168891 (= b_free!4093 (not b_next!4093))))

(declare-fun tp!14880 () Bool)

(declare-fun b_and!10481 () Bool)

(assert (=> b!168891 (= tp!14880 b_and!10481)))

(declare-fun res!80358 () Bool)

(declare-fun e!111144 () Bool)

(assert (=> start!16792 (=> (not res!80358) (not e!111144))))

(declare-datatypes ((V!4841 0))(
  ( (V!4842 (val!1992 Int)) )
))
(declare-datatypes ((ValueCell!1604 0))(
  ( (ValueCellFull!1604 (v!3851 V!4841)) (EmptyCell!1604) )
))
(declare-datatypes ((array!6867 0))(
  ( (array!6868 (arr!3268 (Array (_ BitVec 32) (_ BitVec 64))) (size!3557 (_ BitVec 32))) )
))
(declare-datatypes ((array!6869 0))(
  ( (array!6870 (arr!3269 (Array (_ BitVec 32) ValueCell!1604)) (size!3558 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2116 0))(
  ( (LongMapFixedSize!2117 (defaultEntry!3500 Int) (mask!8276 (_ BitVec 32)) (extraKeys!3241 (_ BitVec 32)) (zeroValue!3343 V!4841) (minValue!3343 V!4841) (_size!1107 (_ BitVec 32)) (_keys!5324 array!6867) (_values!3483 array!6869) (_vacant!1107 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2116)

(declare-fun valid!930 (LongMapFixedSize!2116) Bool)

(assert (=> start!16792 (= res!80358 (valid!930 thiss!1248))))

(assert (=> start!16792 e!111144))

(declare-fun e!111141 () Bool)

(assert (=> start!16792 e!111141))

(assert (=> start!16792 true))

(declare-fun tp_is_empty!3895 () Bool)

(assert (=> start!16792 tp_is_empty!3895))

(declare-fun mapNonEmpty!6561 () Bool)

(declare-fun mapRes!6561 () Bool)

(declare-fun tp!14879 () Bool)

(declare-fun e!111140 () Bool)

(assert (=> mapNonEmpty!6561 (= mapRes!6561 (and tp!14879 e!111140))))

(declare-fun mapKey!6561 () (_ BitVec 32))

(declare-fun mapValue!6561 () ValueCell!1604)

(declare-fun mapRest!6561 () (Array (_ BitVec 32) ValueCell!1604))

(assert (=> mapNonEmpty!6561 (= (arr!3269 (_values!3483 thiss!1248)) (store mapRest!6561 mapKey!6561 mapValue!6561))))

(declare-fun b!168882 () Bool)

(declare-fun e!111143 () Bool)

(declare-fun e!111142 () Bool)

(assert (=> b!168882 (= e!111143 (and e!111142 mapRes!6561))))

(declare-fun condMapEmpty!6561 () Bool)

(declare-fun mapDefault!6561 () ValueCell!1604)

(assert (=> b!168882 (= condMapEmpty!6561 (= (arr!3269 (_values!3483 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1604)) mapDefault!6561)))))

(declare-fun mapIsEmpty!6561 () Bool)

(assert (=> mapIsEmpty!6561 mapRes!6561))

(declare-fun e!111145 () Bool)

(declare-datatypes ((SeekEntryResult!529 0))(
  ( (MissingZero!529 (index!4284 (_ BitVec 32))) (Found!529 (index!4285 (_ BitVec 32))) (Intermediate!529 (undefined!1341 Bool) (index!4286 (_ BitVec 32)) (x!18692 (_ BitVec 32))) (Undefined!529) (MissingVacant!529 (index!4287 (_ BitVec 32))) )
))
(declare-fun lt!84584 () SeekEntryResult!529)

(declare-fun b!168883 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!168883 (= e!111145 (= (select (arr!3268 (_keys!5324 thiss!1248)) (index!4285 lt!84584)) key!828))))

(declare-fun b!168884 () Bool)

(declare-datatypes ((Unit!5206 0))(
  ( (Unit!5207) )
))
(declare-fun e!111139 () Unit!5206)

(declare-fun lt!84585 () Unit!5206)

(assert (=> b!168884 (= e!111139 lt!84585)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!134 (array!6867 array!6869 (_ BitVec 32) (_ BitVec 32) V!4841 V!4841 (_ BitVec 64) Int) Unit!5206)

(assert (=> b!168884 (= lt!84585 (lemmaInListMapThenSeekEntryOrOpenFindsIt!134 (_keys!5324 thiss!1248) (_values!3483 thiss!1248) (mask!8276 thiss!1248) (extraKeys!3241 thiss!1248) (zeroValue!3343 thiss!1248) (minValue!3343 thiss!1248) key!828 (defaultEntry!3500 thiss!1248)))))

(declare-fun res!80356 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168884 (= res!80356 (inRange!0 (index!4285 lt!84584) (mask!8276 thiss!1248)))))

(assert (=> b!168884 (=> (not res!80356) (not e!111145))))

(assert (=> b!168884 e!111145))

(declare-fun b!168885 () Bool)

(declare-fun Unit!5208 () Unit!5206)

(assert (=> b!168885 (= e!111139 Unit!5208)))

(declare-fun lt!84594 () Unit!5206)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!132 (array!6867 array!6869 (_ BitVec 32) (_ BitVec 32) V!4841 V!4841 (_ BitVec 64) Int) Unit!5206)

(assert (=> b!168885 (= lt!84594 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!132 (_keys!5324 thiss!1248) (_values!3483 thiss!1248) (mask!8276 thiss!1248) (extraKeys!3241 thiss!1248) (zeroValue!3343 thiss!1248) (minValue!3343 thiss!1248) key!828 (defaultEntry!3500 thiss!1248)))))

(assert (=> b!168885 false))

(declare-fun b!168886 () Bool)

(assert (=> b!168886 (= e!111140 tp_is_empty!3895)))

(declare-fun b!168887 () Bool)

(assert (=> b!168887 (= e!111142 tp_is_empty!3895)))

(declare-fun b!168888 () Bool)

(declare-fun e!111146 () Bool)

(assert (=> b!168888 (= e!111144 e!111146)))

(declare-fun res!80359 () Bool)

(assert (=> b!168888 (=> (not res!80359) (not e!111146))))

(get-info :version)

(assert (=> b!168888 (= res!80359 (and (not ((_ is Undefined!529) lt!84584)) (not ((_ is MissingVacant!529) lt!84584)) (not ((_ is MissingZero!529) lt!84584)) ((_ is Found!529) lt!84584)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6867 (_ BitVec 32)) SeekEntryResult!529)

(assert (=> b!168888 (= lt!84584 (seekEntryOrOpen!0 key!828 (_keys!5324 thiss!1248) (mask!8276 thiss!1248)))))

(declare-fun b!168889 () Bool)

(declare-fun res!80357 () Bool)

(assert (=> b!168889 (=> (not res!80357) (not e!111144))))

(assert (=> b!168889 (= res!80357 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168890 () Bool)

(assert (=> b!168890 (= e!111146 (not true))))

(declare-fun lt!84591 () Bool)

(declare-fun lt!84587 () array!6869)

(assert (=> b!168890 (= lt!84591 (valid!930 (LongMapFixedSize!2117 (defaultEntry!3500 thiss!1248) (mask!8276 thiss!1248) (extraKeys!3241 thiss!1248) (zeroValue!3343 thiss!1248) (minValue!3343 thiss!1248) (_size!1107 thiss!1248) (_keys!5324 thiss!1248) lt!84587 (_vacant!1107 thiss!1248))))))

(declare-datatypes ((tuple2!3196 0))(
  ( (tuple2!3197 (_1!1609 (_ BitVec 64)) (_2!1609 V!4841)) )
))
(declare-datatypes ((List!2188 0))(
  ( (Nil!2185) (Cons!2184 (h!2801 tuple2!3196) (t!6981 List!2188)) )
))
(declare-datatypes ((ListLongMap!2139 0))(
  ( (ListLongMap!2140 (toList!1085 List!2188)) )
))
(declare-fun lt!84588 () ListLongMap!2139)

(declare-fun contains!1130 (ListLongMap!2139 (_ BitVec 64)) Bool)

(assert (=> b!168890 (contains!1130 lt!84588 (select (arr!3268 (_keys!5324 thiss!1248)) (index!4285 lt!84584)))))

(declare-fun lt!84593 () Unit!5206)

(declare-fun lemmaValidKeyInArrayIsInListMap!139 (array!6867 array!6869 (_ BitVec 32) (_ BitVec 32) V!4841 V!4841 (_ BitVec 32) Int) Unit!5206)

(assert (=> b!168890 (= lt!84593 (lemmaValidKeyInArrayIsInListMap!139 (_keys!5324 thiss!1248) lt!84587 (mask!8276 thiss!1248) (extraKeys!3241 thiss!1248) (zeroValue!3343 thiss!1248) (minValue!3343 thiss!1248) (index!4285 lt!84584) (defaultEntry!3500 thiss!1248)))))

(declare-fun lt!84586 () ListLongMap!2139)

(assert (=> b!168890 (= lt!84586 lt!84588)))

(declare-fun getCurrentListMap!727 (array!6867 array!6869 (_ BitVec 32) (_ BitVec 32) V!4841 V!4841 (_ BitVec 32) Int) ListLongMap!2139)

(assert (=> b!168890 (= lt!84588 (getCurrentListMap!727 (_keys!5324 thiss!1248) lt!84587 (mask!8276 thiss!1248) (extraKeys!3241 thiss!1248) (zeroValue!3343 thiss!1248) (minValue!3343 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3500 thiss!1248)))))

(declare-fun lt!84589 () ListLongMap!2139)

(declare-fun v!309 () V!4841)

(declare-fun +!236 (ListLongMap!2139 tuple2!3196) ListLongMap!2139)

(assert (=> b!168890 (= lt!84586 (+!236 lt!84589 (tuple2!3197 key!828 v!309)))))

(assert (=> b!168890 (= lt!84587 (array!6870 (store (arr!3269 (_values!3483 thiss!1248)) (index!4285 lt!84584) (ValueCellFull!1604 v!309)) (size!3558 (_values!3483 thiss!1248))))))

(declare-fun lt!84590 () Unit!5206)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!108 (array!6867 array!6869 (_ BitVec 32) (_ BitVec 32) V!4841 V!4841 (_ BitVec 32) (_ BitVec 64) V!4841 Int) Unit!5206)

(assert (=> b!168890 (= lt!84590 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!108 (_keys!5324 thiss!1248) (_values!3483 thiss!1248) (mask!8276 thiss!1248) (extraKeys!3241 thiss!1248) (zeroValue!3343 thiss!1248) (minValue!3343 thiss!1248) (index!4285 lt!84584) key!828 v!309 (defaultEntry!3500 thiss!1248)))))

(declare-fun lt!84592 () Unit!5206)

(assert (=> b!168890 (= lt!84592 e!111139)))

(declare-fun c!30395 () Bool)

(assert (=> b!168890 (= c!30395 (contains!1130 lt!84589 key!828))))

(assert (=> b!168890 (= lt!84589 (getCurrentListMap!727 (_keys!5324 thiss!1248) (_values!3483 thiss!1248) (mask!8276 thiss!1248) (extraKeys!3241 thiss!1248) (zeroValue!3343 thiss!1248) (minValue!3343 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3500 thiss!1248)))))

(declare-fun array_inv!2101 (array!6867) Bool)

(declare-fun array_inv!2102 (array!6869) Bool)

(assert (=> b!168891 (= e!111141 (and tp!14880 tp_is_empty!3895 (array_inv!2101 (_keys!5324 thiss!1248)) (array_inv!2102 (_values!3483 thiss!1248)) e!111143))))

(assert (= (and start!16792 res!80358) b!168889))

(assert (= (and b!168889 res!80357) b!168888))

(assert (= (and b!168888 res!80359) b!168890))

(assert (= (and b!168890 c!30395) b!168884))

(assert (= (and b!168890 (not c!30395)) b!168885))

(assert (= (and b!168884 res!80356) b!168883))

(assert (= (and b!168882 condMapEmpty!6561) mapIsEmpty!6561))

(assert (= (and b!168882 (not condMapEmpty!6561)) mapNonEmpty!6561))

(assert (= (and mapNonEmpty!6561 ((_ is ValueCellFull!1604) mapValue!6561)) b!168886))

(assert (= (and b!168882 ((_ is ValueCellFull!1604) mapDefault!6561)) b!168887))

(assert (= b!168891 b!168882))

(assert (= start!16792 b!168891))

(declare-fun m!197551 () Bool)

(assert (=> start!16792 m!197551))

(declare-fun m!197553 () Bool)

(assert (=> b!168884 m!197553))

(declare-fun m!197555 () Bool)

(assert (=> b!168884 m!197555))

(declare-fun m!197557 () Bool)

(assert (=> b!168885 m!197557))

(declare-fun m!197559 () Bool)

(assert (=> mapNonEmpty!6561 m!197559))

(declare-fun m!197561 () Bool)

(assert (=> b!168883 m!197561))

(declare-fun m!197563 () Bool)

(assert (=> b!168890 m!197563))

(declare-fun m!197565 () Bool)

(assert (=> b!168890 m!197565))

(declare-fun m!197567 () Bool)

(assert (=> b!168890 m!197567))

(assert (=> b!168890 m!197561))

(declare-fun m!197569 () Bool)

(assert (=> b!168890 m!197569))

(declare-fun m!197571 () Bool)

(assert (=> b!168890 m!197571))

(declare-fun m!197573 () Bool)

(assert (=> b!168890 m!197573))

(declare-fun m!197575 () Bool)

(assert (=> b!168890 m!197575))

(declare-fun m!197577 () Bool)

(assert (=> b!168890 m!197577))

(declare-fun m!197579 () Bool)

(assert (=> b!168890 m!197579))

(assert (=> b!168890 m!197561))

(declare-fun m!197581 () Bool)

(assert (=> b!168888 m!197581))

(declare-fun m!197583 () Bool)

(assert (=> b!168891 m!197583))

(declare-fun m!197585 () Bool)

(assert (=> b!168891 m!197585))

(check-sat (not b!168888) tp_is_empty!3895 (not b!168885) (not mapNonEmpty!6561) (not b!168884) (not b!168891) (not b_next!4093) b_and!10481 (not start!16792) (not b!168890))
(check-sat b_and!10481 (not b_next!4093))
