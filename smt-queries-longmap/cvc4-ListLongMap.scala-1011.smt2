; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21670 () Bool)

(assert start!21670)

(declare-fun b!217525 () Bool)

(declare-fun b_free!5819 () Bool)

(declare-fun b_next!5819 () Bool)

(assert (=> b!217525 (= b_free!5819 (not b_next!5819))))

(declare-fun tp!20591 () Bool)

(declare-fun b_and!12709 () Bool)

(assert (=> b!217525 (= tp!20591 b_and!12709)))

(declare-fun tp_is_empty!5681 () Bool)

(declare-datatypes ((V!7221 0))(
  ( (V!7222 (val!2885 Int)) )
))
(declare-datatypes ((ValueCell!2497 0))(
  ( (ValueCellFull!2497 (v!4903 V!7221)) (EmptyCell!2497) )
))
(declare-datatypes ((array!10601 0))(
  ( (array!10602 (arr!5022 (Array (_ BitVec 32) ValueCell!2497)) (size!5354 (_ BitVec 32))) )
))
(declare-datatypes ((array!10603 0))(
  ( (array!10604 (arr!5023 (Array (_ BitVec 32) (_ BitVec 64))) (size!5355 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2894 0))(
  ( (LongMapFixedSize!2895 (defaultEntry!4097 Int) (mask!9854 (_ BitVec 32)) (extraKeys!3834 (_ BitVec 32)) (zeroValue!3938 V!7221) (minValue!3938 V!7221) (_size!1496 (_ BitVec 32)) (_keys!6146 array!10603) (_values!4080 array!10601) (_vacant!1496 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2894)

(declare-fun e!141508 () Bool)

(declare-fun e!141511 () Bool)

(declare-fun array_inv!3327 (array!10603) Bool)

(declare-fun array_inv!3328 (array!10601) Bool)

(assert (=> b!217525 (= e!141511 (and tp!20591 tp_is_empty!5681 (array_inv!3327 (_keys!6146 thiss!1504)) (array_inv!3328 (_values!4080 thiss!1504)) e!141508))))

(declare-fun b!217526 () Bool)

(declare-fun e!141512 () Bool)

(assert (=> b!217526 (= e!141512 tp_is_empty!5681)))

(declare-fun b!217527 () Bool)

(declare-fun res!106528 () Bool)

(declare-fun e!141514 () Bool)

(assert (=> b!217527 (=> (not res!106528) (not e!141514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217527 (= res!106528 (validMask!0 (mask!9854 thiss!1504)))))

(declare-fun b!217528 () Bool)

(declare-fun res!106529 () Bool)

(declare-fun e!141509 () Bool)

(assert (=> b!217528 (=> (not res!106529) (not e!141509))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!217528 (= res!106529 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217529 () Bool)

(declare-fun mapRes!9684 () Bool)

(assert (=> b!217529 (= e!141508 (and e!141512 mapRes!9684))))

(declare-fun condMapEmpty!9684 () Bool)

(declare-fun mapDefault!9684 () ValueCell!2497)

