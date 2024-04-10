; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21612 () Bool)

(assert start!21612)

(declare-fun b!216575 () Bool)

(declare-fun b_free!5761 () Bool)

(declare-fun b_next!5761 () Bool)

(assert (=> b!216575 (= b_free!5761 (not b_next!5761))))

(declare-fun tp!20417 () Bool)

(declare-fun b_and!12651 () Bool)

(assert (=> b!216575 (= tp!20417 b_and!12651)))

(declare-fun mapNonEmpty!9597 () Bool)

(declare-fun mapRes!9597 () Bool)

(declare-fun tp!20418 () Bool)

(declare-fun e!140905 () Bool)

(assert (=> mapNonEmpty!9597 (= mapRes!9597 (and tp!20418 e!140905))))

(declare-datatypes ((V!7145 0))(
  ( (V!7146 (val!2856 Int)) )
))
(declare-datatypes ((ValueCell!2468 0))(
  ( (ValueCellFull!2468 (v!4874 V!7145)) (EmptyCell!2468) )
))
(declare-fun mapRest!9597 () (Array (_ BitVec 32) ValueCell!2468))

(declare-fun mapKey!9597 () (_ BitVec 32))

(declare-datatypes ((array!10485 0))(
  ( (array!10486 (arr!4964 (Array (_ BitVec 32) ValueCell!2468)) (size!5296 (_ BitVec 32))) )
))
(declare-datatypes ((array!10487 0))(
  ( (array!10488 (arr!4965 (Array (_ BitVec 32) (_ BitVec 64))) (size!5297 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2836 0))(
  ( (LongMapFixedSize!2837 (defaultEntry!4068 Int) (mask!9807 (_ BitVec 32)) (extraKeys!3805 (_ BitVec 32)) (zeroValue!3909 V!7145) (minValue!3909 V!7145) (_size!1467 (_ BitVec 32)) (_keys!6117 array!10487) (_values!4051 array!10485) (_vacant!1467 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2836)

(declare-fun mapValue!9597 () ValueCell!2468)

(assert (=> mapNonEmpty!9597 (= (arr!4964 (_values!4051 thiss!1504)) (store mapRest!9597 mapKey!9597 mapValue!9597))))

(declare-fun b!216568 () Bool)

(declare-fun tp_is_empty!5623 () Bool)

(assert (=> b!216568 (= e!140905 tp_is_empty!5623)))

(declare-fun b!216569 () Bool)

(declare-fun e!140900 () Bool)

(assert (=> b!216569 (= e!140900 false)))

(declare-fun lt!111188 () Bool)

(declare-datatypes ((List!3153 0))(
  ( (Nil!3150) (Cons!3149 (h!3796 (_ BitVec 64)) (t!8108 List!3153)) )
))
(declare-fun arrayNoDuplicates!0 (array!10487 (_ BitVec 32) List!3153) Bool)

(assert (=> b!216569 (= lt!111188 (arrayNoDuplicates!0 (_keys!6117 thiss!1504) #b00000000000000000000000000000000 Nil!3150))))

(declare-fun b!216570 () Bool)

(declare-fun e!140903 () Bool)

(assert (=> b!216570 (= e!140903 tp_is_empty!5623)))

(declare-fun b!216571 () Bool)

(declare-fun res!105921 () Bool)

(declare-fun e!140901 () Bool)

(assert (=> b!216571 (=> (not res!105921) (not e!140901))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!216571 (= res!105921 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216572 () Bool)

(declare-fun res!105918 () Bool)

(assert (=> b!216572 (=> (not res!105918) (not e!140900))))

(assert (=> b!216572 (= res!105918 (and (= (size!5296 (_values!4051 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9807 thiss!1504))) (= (size!5297 (_keys!6117 thiss!1504)) (size!5296 (_values!4051 thiss!1504))) (bvsge (mask!9807 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3805 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3805 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!216573 () Bool)

(declare-fun res!105919 () Bool)

(assert (=> b!216573 (=> (not res!105919) (not e!140900))))

(declare-datatypes ((tuple2!4248 0))(
  ( (tuple2!4249 (_1!2135 (_ BitVec 64)) (_2!2135 V!7145)) )
))
(declare-datatypes ((List!3154 0))(
  ( (Nil!3151) (Cons!3150 (h!3797 tuple2!4248) (t!8109 List!3154)) )
))
(declare-datatypes ((ListLongMap!3161 0))(
  ( (ListLongMap!3162 (toList!1596 List!3154)) )
))
(declare-fun contains!1437 (ListLongMap!3161 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1124 (array!10487 array!10485 (_ BitVec 32) (_ BitVec 32) V!7145 V!7145 (_ BitVec 32) Int) ListLongMap!3161)

(assert (=> b!216573 (= res!105919 (contains!1437 (getCurrentListMap!1124 (_keys!6117 thiss!1504) (_values!4051 thiss!1504) (mask!9807 thiss!1504) (extraKeys!3805 thiss!1504) (zeroValue!3909 thiss!1504) (minValue!3909 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4068 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!9597 () Bool)

(assert (=> mapIsEmpty!9597 mapRes!9597))

(declare-fun res!105917 () Bool)

(assert (=> start!21612 (=> (not res!105917) (not e!140901))))

(declare-fun valid!1153 (LongMapFixedSize!2836) Bool)

(assert (=> start!21612 (= res!105917 (valid!1153 thiss!1504))))

(assert (=> start!21612 e!140901))

(declare-fun e!140902 () Bool)

(assert (=> start!21612 e!140902))

(assert (=> start!21612 true))

(declare-fun b!216574 () Bool)

(assert (=> b!216574 (= e!140901 e!140900)))

(declare-fun res!105916 () Bool)

(assert (=> b!216574 (=> (not res!105916) (not e!140900))))

(declare-datatypes ((SeekEntryResult!747 0))(
  ( (MissingZero!747 (index!5158 (_ BitVec 32))) (Found!747 (index!5159 (_ BitVec 32))) (Intermediate!747 (undefined!1559 Bool) (index!5160 (_ BitVec 32)) (x!22651 (_ BitVec 32))) (Undefined!747) (MissingVacant!747 (index!5161 (_ BitVec 32))) )
))
(declare-fun lt!111189 () SeekEntryResult!747)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216574 (= res!105916 (or (= lt!111189 (MissingZero!747 index!297)) (= lt!111189 (MissingVacant!747 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10487 (_ BitVec 32)) SeekEntryResult!747)

(assert (=> b!216574 (= lt!111189 (seekEntryOrOpen!0 key!932 (_keys!6117 thiss!1504) (mask!9807 thiss!1504)))))

(declare-fun e!140904 () Bool)

(declare-fun array_inv!3285 (array!10487) Bool)

(declare-fun array_inv!3286 (array!10485) Bool)

(assert (=> b!216575 (= e!140902 (and tp!20417 tp_is_empty!5623 (array_inv!3285 (_keys!6117 thiss!1504)) (array_inv!3286 (_values!4051 thiss!1504)) e!140904))))

(declare-fun b!216576 () Bool)

(assert (=> b!216576 (= e!140904 (and e!140903 mapRes!9597))))

(declare-fun condMapEmpty!9597 () Bool)

(declare-fun mapDefault!9597 () ValueCell!2468)

