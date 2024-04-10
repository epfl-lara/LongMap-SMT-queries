; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15840 () Bool)

(assert start!15840)

(declare-fun b!157760 () Bool)

(declare-fun b_free!3457 () Bool)

(declare-fun b_next!3457 () Bool)

(assert (=> b!157760 (= b_free!3457 (not b_next!3457))))

(declare-fun tp!12910 () Bool)

(declare-fun b_and!9871 () Bool)

(assert (=> b!157760 (= tp!12910 b_and!9871)))

(declare-fun b!157757 () Bool)

(declare-fun e!103324 () Bool)

(declare-datatypes ((V!3993 0))(
  ( (V!3994 (val!1674 Int)) )
))
(declare-datatypes ((ValueCell!1286 0))(
  ( (ValueCellFull!1286 (v!3539 V!3993)) (EmptyCell!1286) )
))
(declare-datatypes ((array!5579 0))(
  ( (array!5580 (arr!2643 (Array (_ BitVec 32) (_ BitVec 64))) (size!2923 (_ BitVec 32))) )
))
(declare-datatypes ((array!5581 0))(
  ( (array!5582 (arr!2644 (Array (_ BitVec 32) ValueCell!1286)) (size!2924 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1480 0))(
  ( (LongMapFixedSize!1481 (defaultEntry!3182 Int) (mask!7673 (_ BitVec 32)) (extraKeys!2923 (_ BitVec 32)) (zeroValue!3025 V!3993) (minValue!3025 V!3993) (_size!789 (_ BitVec 32)) (_keys!4959 array!5579) (_values!3165 array!5581) (_vacant!789 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1480)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157757 (= e!103324 (not (validMask!0 (mask!7673 thiss!1248))))))

(declare-fun b!157758 () Bool)

(declare-fun e!103322 () Bool)

(declare-fun tp_is_empty!3259 () Bool)

(assert (=> b!157758 (= e!103322 tp_is_empty!3259)))

(declare-fun b!157759 () Bool)

(declare-fun e!103325 () Bool)

(assert (=> b!157759 (= e!103325 tp_is_empty!3259)))

(declare-fun e!103326 () Bool)

(declare-fun e!103323 () Bool)

(declare-fun array_inv!1681 (array!5579) Bool)

(declare-fun array_inv!1682 (array!5581) Bool)

(assert (=> b!157760 (= e!103323 (and tp!12910 tp_is_empty!3259 (array_inv!1681 (_keys!4959 thiss!1248)) (array_inv!1682 (_values!3165 thiss!1248)) e!103326))))

(declare-fun b!157761 () Bool)

(declare-fun res!74557 () Bool)

(assert (=> b!157761 (=> (not res!74557) (not e!103324))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157761 (= res!74557 (not (= key!828 (bvneg key!828))))))

(declare-fun b!157762 () Bool)

(declare-fun mapRes!5545 () Bool)

(assert (=> b!157762 (= e!103326 (and e!103325 mapRes!5545))))

(declare-fun condMapEmpty!5545 () Bool)

(declare-fun mapDefault!5545 () ValueCell!1286)

