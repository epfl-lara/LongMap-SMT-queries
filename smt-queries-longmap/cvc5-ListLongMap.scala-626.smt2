; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16104 () Bool)

(assert start!16104)

(declare-fun b!160122 () Bool)

(declare-fun b_free!3565 () Bool)

(declare-fun b_next!3565 () Bool)

(assert (=> b!160122 (= b_free!3565 (not b_next!3565))))

(declare-fun tp!13265 () Bool)

(declare-fun b_and!9979 () Bool)

(assert (=> b!160122 (= tp!13265 b_and!9979)))

(declare-fun e!104731 () Bool)

(declare-fun tp_is_empty!3367 () Bool)

(declare-fun e!104734 () Bool)

(declare-datatypes ((V!4137 0))(
  ( (V!4138 (val!1728 Int)) )
))
(declare-datatypes ((ValueCell!1340 0))(
  ( (ValueCellFull!1340 (v!3593 V!4137)) (EmptyCell!1340) )
))
(declare-datatypes ((array!5813 0))(
  ( (array!5814 (arr!2751 (Array (_ BitVec 32) (_ BitVec 64))) (size!3035 (_ BitVec 32))) )
))
(declare-datatypes ((array!5815 0))(
  ( (array!5816 (arr!2752 (Array (_ BitVec 32) ValueCell!1340)) (size!3036 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1588 0))(
  ( (LongMapFixedSize!1589 (defaultEntry!3236 Int) (mask!7800 (_ BitVec 32)) (extraKeys!2977 (_ BitVec 32)) (zeroValue!3079 V!4137) (minValue!3079 V!4137) (_size!843 (_ BitVec 32)) (_keys!5037 array!5813) (_values!3219 array!5815) (_vacant!843 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1588)

(declare-fun array_inv!1751 (array!5813) Bool)

(declare-fun array_inv!1752 (array!5815) Bool)

(assert (=> b!160122 (= e!104734 (and tp!13265 tp_is_empty!3367 (array_inv!1751 (_keys!5037 thiss!1248)) (array_inv!1752 (_values!3219 thiss!1248)) e!104731))))

(declare-fun b!160123 () Bool)

(declare-fun res!75768 () Bool)

(declare-fun e!104733 () Bool)

(assert (=> b!160123 (=> (not res!75768) (not e!104733))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!160123 (= res!75768 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160124 () Bool)

(declare-fun res!75765 () Bool)

(assert (=> b!160124 (=> (not res!75765) (not e!104733))))

(declare-datatypes ((SeekEntryResult!324 0))(
  ( (MissingZero!324 (index!3464 (_ BitVec 32))) (Found!324 (index!3465 (_ BitVec 32))) (Intermediate!324 (undefined!1136 Bool) (index!3466 (_ BitVec 32)) (x!17676 (_ BitVec 32))) (Undefined!324) (MissingVacant!324 (index!3467 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5813 (_ BitVec 32)) SeekEntryResult!324)

(assert (=> b!160124 (= res!75765 (is-Undefined!324 (seekEntryOrOpen!0 key!828 (_keys!5037 thiss!1248) (mask!7800 thiss!1248))))))

(declare-fun b!160125 () Bool)

(declare-fun e!104735 () Bool)

(declare-fun mapRes!5738 () Bool)

(assert (=> b!160125 (= e!104731 (and e!104735 mapRes!5738))))

(declare-fun condMapEmpty!5738 () Bool)

(declare-fun mapDefault!5738 () ValueCell!1340)

