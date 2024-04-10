; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19508 () Bool)

(assert start!19508)

(declare-fun b!191573 () Bool)

(declare-fun b_free!4685 () Bool)

(declare-fun b_next!4685 () Bool)

(assert (=> b!191573 (= b_free!4685 (not b_next!4685))))

(declare-fun tp!16905 () Bool)

(declare-fun b_and!11359 () Bool)

(assert (=> b!191573 (= tp!16905 b_and!11359)))

(declare-fun b!191571 () Bool)

(declare-fun e!126083 () Bool)

(declare-fun e!126085 () Bool)

(assert (=> b!191571 (= e!126083 (not e!126085))))

(declare-fun res!90537 () Bool)

(assert (=> b!191571 (=> res!90537 e!126085)))

(declare-datatypes ((V!5589 0))(
  ( (V!5590 (val!2273 Int)) )
))
(declare-datatypes ((ValueCell!1885 0))(
  ( (ValueCellFull!1885 (v!4213 V!5589)) (EmptyCell!1885) )
))
(declare-datatypes ((array!8153 0))(
  ( (array!8154 (arr!3841 (Array (_ BitVec 32) (_ BitVec 64))) (size!4163 (_ BitVec 32))) )
))
(declare-datatypes ((array!8155 0))(
  ( (array!8156 (arr!3842 (Array (_ BitVec 32) ValueCell!1885)) (size!4164 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2678 0))(
  ( (LongMapFixedSize!2679 (defaultEntry!3911 Int) (mask!9132 (_ BitVec 32)) (extraKeys!3648 (_ BitVec 32)) (zeroValue!3752 V!5589) (minValue!3752 V!5589) (_size!1388 (_ BitVec 32)) (_keys!5889 array!8153) (_values!3894 array!8155) (_vacant!1388 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2678)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!191571 (= res!90537 (not (validMask!0 (mask!9132 thiss!1248))))))

(declare-datatypes ((tuple2!3534 0))(
  ( (tuple2!3535 (_1!1778 (_ BitVec 64)) (_2!1778 V!5589)) )
))
(declare-datatypes ((List!2426 0))(
  ( (Nil!2423) (Cons!2422 (h!3061 tuple2!3534) (t!7340 List!2426)) )
))
(declare-datatypes ((ListLongMap!2451 0))(
  ( (ListLongMap!2452 (toList!1241 List!2426)) )
))
(declare-fun lt!95126 () ListLongMap!2451)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!680 0))(
  ( (MissingZero!680 (index!4890 (_ BitVec 32))) (Found!680 (index!4891 (_ BitVec 32))) (Intermediate!680 (undefined!1492 Bool) (index!4892 (_ BitVec 32)) (x!20552 (_ BitVec 32))) (Undefined!680) (MissingVacant!680 (index!4893 (_ BitVec 32))) )
))
(declare-fun lt!95125 () SeekEntryResult!680)

(declare-fun v!309 () V!5589)

(declare-fun +!309 (ListLongMap!2451 tuple2!3534) ListLongMap!2451)

(declare-fun getCurrentListMap!889 (array!8153 array!8155 (_ BitVec 32) (_ BitVec 32) V!5589 V!5589 (_ BitVec 32) Int) ListLongMap!2451)

(assert (=> b!191571 (= (+!309 lt!95126 (tuple2!3535 key!828 v!309)) (getCurrentListMap!889 (_keys!5889 thiss!1248) (array!8156 (store (arr!3842 (_values!3894 thiss!1248)) (index!4891 lt!95125) (ValueCellFull!1885 v!309)) (size!4164 (_values!3894 thiss!1248))) (mask!9132 thiss!1248) (extraKeys!3648 thiss!1248) (zeroValue!3752 thiss!1248) (minValue!3752 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3911 thiss!1248)))))

(declare-datatypes ((Unit!5796 0))(
  ( (Unit!5797) )
))
(declare-fun lt!95128 () Unit!5796)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!110 (array!8153 array!8155 (_ BitVec 32) (_ BitVec 32) V!5589 V!5589 (_ BitVec 32) (_ BitVec 64) V!5589 Int) Unit!5796)

(assert (=> b!191571 (= lt!95128 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!110 (_keys!5889 thiss!1248) (_values!3894 thiss!1248) (mask!9132 thiss!1248) (extraKeys!3648 thiss!1248) (zeroValue!3752 thiss!1248) (minValue!3752 thiss!1248) (index!4891 lt!95125) key!828 v!309 (defaultEntry!3911 thiss!1248)))))

(declare-fun lt!95129 () Unit!5796)

(declare-fun e!126081 () Unit!5796)

(assert (=> b!191571 (= lt!95129 e!126081)))

(declare-fun c!34484 () Bool)

(declare-fun contains!1355 (ListLongMap!2451 (_ BitVec 64)) Bool)

(assert (=> b!191571 (= c!34484 (contains!1355 lt!95126 key!828))))

(assert (=> b!191571 (= lt!95126 (getCurrentListMap!889 (_keys!5889 thiss!1248) (_values!3894 thiss!1248) (mask!9132 thiss!1248) (extraKeys!3648 thiss!1248) (zeroValue!3752 thiss!1248) (minValue!3752 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3911 thiss!1248)))))

(declare-fun res!90539 () Bool)

(declare-fun e!126088 () Bool)

(assert (=> start!19508 (=> (not res!90539) (not e!126088))))

(declare-fun valid!1099 (LongMapFixedSize!2678) Bool)

(assert (=> start!19508 (= res!90539 (valid!1099 thiss!1248))))

(assert (=> start!19508 e!126088))

(declare-fun e!126089 () Bool)

(assert (=> start!19508 e!126089))

(assert (=> start!19508 true))

(declare-fun tp_is_empty!4457 () Bool)

(assert (=> start!19508 tp_is_empty!4457))

(declare-fun b!191572 () Bool)

(declare-fun lt!95124 () Unit!5796)

(assert (=> b!191572 (= e!126081 lt!95124)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!175 (array!8153 array!8155 (_ BitVec 32) (_ BitVec 32) V!5589 V!5589 (_ BitVec 64) Int) Unit!5796)

(assert (=> b!191572 (= lt!95124 (lemmaInListMapThenSeekEntryOrOpenFindsIt!175 (_keys!5889 thiss!1248) (_values!3894 thiss!1248) (mask!9132 thiss!1248) (extraKeys!3648 thiss!1248) (zeroValue!3752 thiss!1248) (minValue!3752 thiss!1248) key!828 (defaultEntry!3911 thiss!1248)))))

(declare-fun res!90538 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!191572 (= res!90538 (inRange!0 (index!4891 lt!95125) (mask!9132 thiss!1248)))))

(declare-fun e!126086 () Bool)

(assert (=> b!191572 (=> (not res!90538) (not e!126086))))

(assert (=> b!191572 e!126086))

(declare-fun e!126084 () Bool)

(declare-fun array_inv!2491 (array!8153) Bool)

(declare-fun array_inv!2492 (array!8155) Bool)

(assert (=> b!191573 (= e!126089 (and tp!16905 tp_is_empty!4457 (array_inv!2491 (_keys!5889 thiss!1248)) (array_inv!2492 (_values!3894 thiss!1248)) e!126084))))

(declare-fun mapNonEmpty!7698 () Bool)

(declare-fun mapRes!7698 () Bool)

(declare-fun tp!16904 () Bool)

(declare-fun e!126090 () Bool)

(assert (=> mapNonEmpty!7698 (= mapRes!7698 (and tp!16904 e!126090))))

(declare-fun mapKey!7698 () (_ BitVec 32))

(declare-fun mapValue!7698 () ValueCell!1885)

(declare-fun mapRest!7698 () (Array (_ BitVec 32) ValueCell!1885))

(assert (=> mapNonEmpty!7698 (= (arr!3842 (_values!3894 thiss!1248)) (store mapRest!7698 mapKey!7698 mapValue!7698))))

(declare-fun b!191574 () Bool)

(assert (=> b!191574 (= e!126090 tp_is_empty!4457)))

(declare-fun mapIsEmpty!7698 () Bool)

(assert (=> mapIsEmpty!7698 mapRes!7698))

(declare-fun b!191575 () Bool)

(assert (=> b!191575 (= e!126086 (= (select (arr!3841 (_keys!5889 thiss!1248)) (index!4891 lt!95125)) key!828))))

(declare-fun b!191576 () Bool)

(assert (=> b!191576 (= e!126088 e!126083)))

(declare-fun res!90540 () Bool)

(assert (=> b!191576 (=> (not res!90540) (not e!126083))))

(assert (=> b!191576 (= res!90540 (and (not (is-Undefined!680 lt!95125)) (not (is-MissingVacant!680 lt!95125)) (not (is-MissingZero!680 lt!95125)) (is-Found!680 lt!95125)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8153 (_ BitVec 32)) SeekEntryResult!680)

(assert (=> b!191576 (= lt!95125 (seekEntryOrOpen!0 key!828 (_keys!5889 thiss!1248) (mask!9132 thiss!1248)))))

(declare-fun b!191577 () Bool)

(declare-fun Unit!5798 () Unit!5796)

(assert (=> b!191577 (= e!126081 Unit!5798)))

(declare-fun lt!95127 () Unit!5796)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!182 (array!8153 array!8155 (_ BitVec 32) (_ BitVec 32) V!5589 V!5589 (_ BitVec 64) Int) Unit!5796)

(assert (=> b!191577 (= lt!95127 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!182 (_keys!5889 thiss!1248) (_values!3894 thiss!1248) (mask!9132 thiss!1248) (extraKeys!3648 thiss!1248) (zeroValue!3752 thiss!1248) (minValue!3752 thiss!1248) key!828 (defaultEntry!3911 thiss!1248)))))

(assert (=> b!191577 false))

(declare-fun b!191578 () Bool)

(declare-fun res!90541 () Bool)

(assert (=> b!191578 (=> (not res!90541) (not e!126088))))

(assert (=> b!191578 (= res!90541 (not (= key!828 (bvneg key!828))))))

(declare-fun b!191579 () Bool)

(declare-fun e!126082 () Bool)

(assert (=> b!191579 (= e!126084 (and e!126082 mapRes!7698))))

(declare-fun condMapEmpty!7698 () Bool)

(declare-fun mapDefault!7698 () ValueCell!1885)

