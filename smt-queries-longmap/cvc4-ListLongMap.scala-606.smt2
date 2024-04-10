; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15806 () Bool)

(assert start!15806)

(declare-fun b!157581 () Bool)

(declare-fun b_free!3449 () Bool)

(declare-fun b_next!3449 () Bool)

(assert (=> b!157581 (= b_free!3449 (not b_next!3449))))

(declare-fun tp!12878 () Bool)

(declare-fun b_and!9863 () Bool)

(assert (=> b!157581 (= tp!12878 b_and!9863)))

(declare-fun b!157577 () Bool)

(declare-fun e!103201 () Bool)

(declare-datatypes ((V!3981 0))(
  ( (V!3982 (val!1670 Int)) )
))
(declare-datatypes ((ValueCell!1282 0))(
  ( (ValueCellFull!1282 (v!3535 V!3981)) (EmptyCell!1282) )
))
(declare-datatypes ((array!5559 0))(
  ( (array!5560 (arr!2635 (Array (_ BitVec 32) (_ BitVec 64))) (size!2914 (_ BitVec 32))) )
))
(declare-datatypes ((array!5561 0))(
  ( (array!5562 (arr!2636 (Array (_ BitVec 32) ValueCell!1282)) (size!2915 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1472 0))(
  ( (LongMapFixedSize!1473 (defaultEntry!3178 Int) (mask!7662 (_ BitVec 32)) (extraKeys!2919 (_ BitVec 32)) (zeroValue!3021 V!3981) (minValue!3021 V!3981) (_size!785 (_ BitVec 32)) (_keys!4954 array!5559) (_values!3161 array!5561) (_vacant!785 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1472)

(assert (=> b!157577 (= e!103201 (and (bvsge (mask!7662 thiss!1248) #b00000000000000000000000000000000) (not (= (size!2914 (_keys!4954 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7662 thiss!1248))))))))

(declare-fun res!74467 () Bool)

(assert (=> start!15806 (=> (not res!74467) (not e!103201))))

(declare-fun valid!698 (LongMapFixedSize!1472) Bool)

(assert (=> start!15806 (= res!74467 (valid!698 thiss!1248))))

(assert (=> start!15806 e!103201))

(declare-fun e!103203 () Bool)

(assert (=> start!15806 e!103203))

(assert (=> start!15806 true))

(declare-fun b!157578 () Bool)

(declare-fun e!103205 () Bool)

(declare-fun tp_is_empty!3251 () Bool)

(assert (=> b!157578 (= e!103205 tp_is_empty!3251)))

(declare-fun b!157579 () Bool)

(declare-fun res!74466 () Bool)

(assert (=> b!157579 (=> (not res!74466) (not e!103201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157579 (= res!74466 (validMask!0 (mask!7662 thiss!1248)))))

(declare-fun b!157580 () Bool)

(declare-fun e!103200 () Bool)

(assert (=> b!157580 (= e!103200 tp_is_empty!3251)))

(declare-fun e!103204 () Bool)

(declare-fun array_inv!1673 (array!5559) Bool)

(declare-fun array_inv!1674 (array!5561) Bool)

(assert (=> b!157581 (= e!103203 (and tp!12878 tp_is_empty!3251 (array_inv!1673 (_keys!4954 thiss!1248)) (array_inv!1674 (_values!3161 thiss!1248)) e!103204))))

(declare-fun mapNonEmpty!5526 () Bool)

(declare-fun mapRes!5526 () Bool)

(declare-fun tp!12879 () Bool)

(assert (=> mapNonEmpty!5526 (= mapRes!5526 (and tp!12879 e!103200))))

(declare-fun mapKey!5526 () (_ BitVec 32))

(declare-fun mapRest!5526 () (Array (_ BitVec 32) ValueCell!1282))

(declare-fun mapValue!5526 () ValueCell!1282)

(assert (=> mapNonEmpty!5526 (= (arr!2636 (_values!3161 thiss!1248)) (store mapRest!5526 mapKey!5526 mapValue!5526))))

(declare-fun b!157582 () Bool)

(declare-fun res!74465 () Bool)

(assert (=> b!157582 (=> (not res!74465) (not e!103201))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157582 (= res!74465 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!5526 () Bool)

(assert (=> mapIsEmpty!5526 mapRes!5526))

(declare-fun b!157583 () Bool)

(assert (=> b!157583 (= e!103204 (and e!103205 mapRes!5526))))

(declare-fun condMapEmpty!5526 () Bool)

(declare-fun mapDefault!5526 () ValueCell!1282)

