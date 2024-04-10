; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21332 () Bool)

(assert start!21332)

(declare-fun b!214573 () Bool)

(declare-fun b_free!5683 () Bool)

(declare-fun b_next!5683 () Bool)

(assert (=> b!214573 (= b_free!5683 (not b_next!5683))))

(declare-fun tp!20142 () Bool)

(declare-fun b_and!12573 () Bool)

(assert (=> b!214573 (= tp!20142 b_and!12573)))

(declare-fun b!214569 () Bool)

(declare-fun res!105033 () Bool)

(declare-fun e!139561 () Bool)

(assert (=> b!214569 (=> (not res!105033) (not e!139561))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7041 0))(
  ( (V!7042 (val!2817 Int)) )
))
(declare-datatypes ((ValueCell!2429 0))(
  ( (ValueCellFull!2429 (v!4835 V!7041)) (EmptyCell!2429) )
))
(declare-datatypes ((array!10305 0))(
  ( (array!10306 (arr!4886 (Array (_ BitVec 32) ValueCell!2429)) (size!5213 (_ BitVec 32))) )
))
(declare-datatypes ((array!10307 0))(
  ( (array!10308 (arr!4887 (Array (_ BitVec 32) (_ BitVec 64))) (size!5214 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2758 0))(
  ( (LongMapFixedSize!2759 (defaultEntry!4029 Int) (mask!9695 (_ BitVec 32)) (extraKeys!3766 (_ BitVec 32)) (zeroValue!3870 V!7041) (minValue!3870 V!7041) (_size!1428 (_ BitVec 32)) (_keys!6048 array!10307) (_values!4012 array!10305) (_vacant!1428 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2758)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!719 0))(
  ( (MissingZero!719 (index!5046 (_ BitVec 32))) (Found!719 (index!5047 (_ BitVec 32))) (Intermediate!719 (undefined!1531 Bool) (index!5048 (_ BitVec 32)) (x!22378 (_ BitVec 32))) (Undefined!719) (MissingVacant!719 (index!5049 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10307 (_ BitVec 32)) SeekEntryResult!719)

(assert (=> b!214569 (= res!105033 (not (= (seekEntryOrOpen!0 key!932 (_keys!6048 thiss!1504) (mask!9695 thiss!1504)) (MissingZero!719 index!297))))))

(declare-fun b!214570 () Bool)

(declare-fun e!139563 () Bool)

(declare-fun tp_is_empty!5545 () Bool)

(assert (=> b!214570 (= e!139563 tp_is_empty!5545)))

(declare-fun b!214571 () Bool)

(declare-fun e!139559 () Bool)

(assert (=> b!214571 (= e!139559 tp_is_empty!5545)))

(declare-fun mapIsEmpty!9439 () Bool)

(declare-fun mapRes!9439 () Bool)

(assert (=> mapIsEmpty!9439 mapRes!9439))

(declare-fun b!214572 () Bool)

(declare-fun res!105031 () Bool)

(assert (=> b!214572 (=> (not res!105031) (not e!139561))))

(assert (=> b!214572 (= res!105031 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!139560 () Bool)

(declare-fun e!139558 () Bool)

(declare-fun array_inv!3231 (array!10307) Bool)

(declare-fun array_inv!3232 (array!10305) Bool)

(assert (=> b!214573 (= e!139558 (and tp!20142 tp_is_empty!5545 (array_inv!3231 (_keys!6048 thiss!1504)) (array_inv!3232 (_values!4012 thiss!1504)) e!139560))))

(declare-fun res!105034 () Bool)

(assert (=> start!21332 (=> (not res!105034) (not e!139561))))

(declare-fun valid!1128 (LongMapFixedSize!2758) Bool)

(assert (=> start!21332 (= res!105034 (valid!1128 thiss!1504))))

(assert (=> start!21332 e!139561))

(assert (=> start!21332 e!139558))

(assert (=> start!21332 true))

(declare-fun b!214574 () Bool)

(declare-fun res!105032 () Bool)

(assert (=> b!214574 (=> (not res!105032) (not e!139561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214574 (= res!105032 (validMask!0 (mask!9695 thiss!1504)))))

(declare-fun b!214575 () Bool)

(assert (=> b!214575 (= e!139560 (and e!139563 mapRes!9439))))

(declare-fun condMapEmpty!9439 () Bool)

(declare-fun mapDefault!9439 () ValueCell!2429)

