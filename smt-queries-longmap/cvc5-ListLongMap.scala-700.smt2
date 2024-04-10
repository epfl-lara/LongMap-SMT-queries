; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16704 () Bool)

(assert start!16704)

(declare-fun b!167495 () Bool)

(declare-fun b_free!4009 () Bool)

(declare-fun b_next!4009 () Bool)

(assert (=> b!167495 (= b_free!4009 (not b_next!4009))))

(declare-fun tp!14628 () Bool)

(declare-fun b_and!10423 () Bool)

(assert (=> b!167495 (= tp!14628 b_and!10423)))

(declare-fun b!167487 () Bool)

(declare-datatypes ((Unit!5131 0))(
  ( (Unit!5132) )
))
(declare-fun e!110005 () Unit!5131)

(declare-fun Unit!5133 () Unit!5131)

(assert (=> b!167487 (= e!110005 Unit!5133)))

(declare-fun lt!83714 () Unit!5131)

(declare-datatypes ((V!4729 0))(
  ( (V!4730 (val!1950 Int)) )
))
(declare-datatypes ((ValueCell!1562 0))(
  ( (ValueCellFull!1562 (v!3815 V!4729)) (EmptyCell!1562) )
))
(declare-datatypes ((array!6719 0))(
  ( (array!6720 (arr!3195 (Array (_ BitVec 32) (_ BitVec 64))) (size!3483 (_ BitVec 32))) )
))
(declare-datatypes ((array!6721 0))(
  ( (array!6722 (arr!3196 (Array (_ BitVec 32) ValueCell!1562)) (size!3484 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2032 0))(
  ( (LongMapFixedSize!2033 (defaultEntry!3458 Int) (mask!8207 (_ BitVec 32)) (extraKeys!3199 (_ BitVec 32)) (zeroValue!3301 V!4729) (minValue!3301 V!4729) (_size!1065 (_ BitVec 32)) (_keys!5283 array!6719) (_values!3441 array!6721) (_vacant!1065 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2032)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!108 (array!6719 array!6721 (_ BitVec 32) (_ BitVec 32) V!4729 V!4729 (_ BitVec 64) Int) Unit!5131)

(assert (=> b!167487 (= lt!83714 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!108 (_keys!5283 thiss!1248) (_values!3441 thiss!1248) (mask!8207 thiss!1248) (extraKeys!3199 thiss!1248) (zeroValue!3301 thiss!1248) (minValue!3301 thiss!1248) key!828 (defaultEntry!3458 thiss!1248)))))

(assert (=> b!167487 false))

(declare-fun b!167488 () Bool)

(declare-fun res!79671 () Bool)

(declare-fun e!110007 () Bool)

(assert (=> b!167488 (=> res!79671 e!110007)))

(assert (=> b!167488 (= res!79671 (or (not (= (size!3484 (_values!3441 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8207 thiss!1248)))) (not (= (size!3483 (_keys!5283 thiss!1248)) (size!3484 (_values!3441 thiss!1248)))) (bvslt (mask!8207 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3199 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3199 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!167489 () Bool)

(declare-fun e!110001 () Bool)

(declare-fun e!110008 () Bool)

(assert (=> b!167489 (= e!110001 e!110008)))

(declare-fun res!79666 () Bool)

(assert (=> b!167489 (=> (not res!79666) (not e!110008))))

(declare-datatypes ((SeekEntryResult!481 0))(
  ( (MissingZero!481 (index!4092 (_ BitVec 32))) (Found!481 (index!4093 (_ BitVec 32))) (Intermediate!481 (undefined!1293 Bool) (index!4094 (_ BitVec 32)) (x!18533 (_ BitVec 32))) (Undefined!481) (MissingVacant!481 (index!4095 (_ BitVec 32))) )
))
(declare-fun lt!83718 () SeekEntryResult!481)

(assert (=> b!167489 (= res!79666 (and (not (is-Undefined!481 lt!83718)) (not (is-MissingVacant!481 lt!83718)) (not (is-MissingZero!481 lt!83718)) (is-Found!481 lt!83718)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6719 (_ BitVec 32)) SeekEntryResult!481)

(assert (=> b!167489 (= lt!83718 (seekEntryOrOpen!0 key!828 (_keys!5283 thiss!1248) (mask!8207 thiss!1248)))))

(declare-fun b!167490 () Bool)

(declare-fun res!79665 () Bool)

(assert (=> b!167490 (=> (not res!79665) (not e!110001))))

(assert (=> b!167490 (= res!79665 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167491 () Bool)

(assert (=> b!167491 (= e!110008 (not e!110007))))

(declare-fun res!79667 () Bool)

(assert (=> b!167491 (=> res!79667 e!110007)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167491 (= res!79667 (not (validMask!0 (mask!8207 thiss!1248))))))

(declare-fun v!309 () V!4729)

(declare-datatypes ((tuple2!3144 0))(
  ( (tuple2!3145 (_1!1583 (_ BitVec 64)) (_2!1583 V!4729)) )
))
(declare-datatypes ((List!2132 0))(
  ( (Nil!2129) (Cons!2128 (h!2745 tuple2!3144) (t!6934 List!2132)) )
))
(declare-datatypes ((ListLongMap!2099 0))(
  ( (ListLongMap!2100 (toList!1065 List!2132)) )
))
(declare-fun lt!83713 () ListLongMap!2099)

(declare-fun +!217 (ListLongMap!2099 tuple2!3144) ListLongMap!2099)

(declare-fun getCurrentListMap!723 (array!6719 array!6721 (_ BitVec 32) (_ BitVec 32) V!4729 V!4729 (_ BitVec 32) Int) ListLongMap!2099)

(assert (=> b!167491 (= (+!217 lt!83713 (tuple2!3145 key!828 v!309)) (getCurrentListMap!723 (_keys!5283 thiss!1248) (array!6722 (store (arr!3196 (_values!3441 thiss!1248)) (index!4093 lt!83718) (ValueCellFull!1562 v!309)) (size!3484 (_values!3441 thiss!1248))) (mask!8207 thiss!1248) (extraKeys!3199 thiss!1248) (zeroValue!3301 thiss!1248) (minValue!3301 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3458 thiss!1248)))))

(declare-fun lt!83716 () Unit!5131)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!72 (array!6719 array!6721 (_ BitVec 32) (_ BitVec 32) V!4729 V!4729 (_ BitVec 32) (_ BitVec 64) V!4729 Int) Unit!5131)

(assert (=> b!167491 (= lt!83716 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!72 (_keys!5283 thiss!1248) (_values!3441 thiss!1248) (mask!8207 thiss!1248) (extraKeys!3199 thiss!1248) (zeroValue!3301 thiss!1248) (minValue!3301 thiss!1248) (index!4093 lt!83718) key!828 v!309 (defaultEntry!3458 thiss!1248)))))

(declare-fun lt!83719 () Unit!5131)

(assert (=> b!167491 (= lt!83719 e!110005)))

(declare-fun c!30295 () Bool)

(declare-fun contains!1107 (ListLongMap!2099 (_ BitVec 64)) Bool)

(assert (=> b!167491 (= c!30295 (contains!1107 lt!83713 key!828))))

(assert (=> b!167491 (= lt!83713 (getCurrentListMap!723 (_keys!5283 thiss!1248) (_values!3441 thiss!1248) (mask!8207 thiss!1248) (extraKeys!3199 thiss!1248) (zeroValue!3301 thiss!1248) (minValue!3301 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3458 thiss!1248)))))

(declare-fun b!167492 () Bool)

(declare-fun e!110006 () Bool)

(declare-fun e!110000 () Bool)

(declare-fun mapRes!6435 () Bool)

(assert (=> b!167492 (= e!110006 (and e!110000 mapRes!6435))))

(declare-fun condMapEmpty!6435 () Bool)

(declare-fun mapDefault!6435 () ValueCell!1562)

