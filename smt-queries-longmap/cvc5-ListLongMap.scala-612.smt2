; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15932 () Bool)

(assert start!15932)

(declare-fun b!158376 () Bool)

(declare-fun b_free!3481 () Bool)

(declare-fun b_next!3481 () Bool)

(assert (=> b!158376 (= b_free!3481 (not b_next!3481))))

(declare-fun tp!12995 () Bool)

(declare-fun b_and!9895 () Bool)

(assert (=> b!158376 (= tp!12995 b_and!9895)))

(declare-fun res!74804 () Bool)

(declare-fun e!103722 () Bool)

(assert (=> start!15932 (=> (not res!74804) (not e!103722))))

(declare-datatypes ((V!4025 0))(
  ( (V!4026 (val!1686 Int)) )
))
(declare-datatypes ((ValueCell!1298 0))(
  ( (ValueCellFull!1298 (v!3551 V!4025)) (EmptyCell!1298) )
))
(declare-datatypes ((array!5635 0))(
  ( (array!5636 (arr!2667 (Array (_ BitVec 32) (_ BitVec 64))) (size!2949 (_ BitVec 32))) )
))
(declare-datatypes ((array!5637 0))(
  ( (array!5638 (arr!2668 (Array (_ BitVec 32) ValueCell!1298)) (size!2950 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1504 0))(
  ( (LongMapFixedSize!1505 (defaultEntry!3194 Int) (mask!7709 (_ BitVec 32)) (extraKeys!2935 (_ BitVec 32)) (zeroValue!3037 V!4025) (minValue!3037 V!4025) (_size!801 (_ BitVec 32)) (_keys!4981 array!5635) (_values!3177 array!5637) (_vacant!801 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1504)

(declare-fun valid!708 (LongMapFixedSize!1504) Bool)

(assert (=> start!15932 (= res!74804 (valid!708 thiss!1248))))

(assert (=> start!15932 e!103722))

(declare-fun e!103723 () Bool)

(assert (=> start!15932 e!103723))

(assert (=> start!15932 true))

(declare-fun mapNonEmpty!5595 () Bool)

(declare-fun mapRes!5595 () Bool)

(declare-fun tp!12996 () Bool)

(declare-fun e!103726 () Bool)

(assert (=> mapNonEmpty!5595 (= mapRes!5595 (and tp!12996 e!103726))))

(declare-fun mapRest!5595 () (Array (_ BitVec 32) ValueCell!1298))

(declare-fun mapKey!5595 () (_ BitVec 32))

(declare-fun mapValue!5595 () ValueCell!1298)

(assert (=> mapNonEmpty!5595 (= (arr!2668 (_values!3177 thiss!1248)) (store mapRest!5595 mapKey!5595 mapValue!5595))))

(declare-fun b!158374 () Bool)

(declare-fun e!103727 () Bool)

(declare-fun tp_is_empty!3283 () Bool)

(assert (=> b!158374 (= e!103727 tp_is_empty!3283)))

(declare-fun b!158375 () Bool)

(assert (=> b!158375 (= e!103726 tp_is_empty!3283)))

(declare-fun e!103724 () Bool)

(declare-fun array_inv!1697 (array!5635) Bool)

(declare-fun array_inv!1698 (array!5637) Bool)

(assert (=> b!158376 (= e!103723 (and tp!12995 tp_is_empty!3283 (array_inv!1697 (_keys!4981 thiss!1248)) (array_inv!1698 (_values!3177 thiss!1248)) e!103724))))

(declare-fun b!158377 () Bool)

(declare-fun res!74805 () Bool)

(assert (=> b!158377 (=> (not res!74805) (not e!103722))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!295 0))(
  ( (MissingZero!295 (index!3348 (_ BitVec 32))) (Found!295 (index!3349 (_ BitVec 32))) (Intermediate!295 (undefined!1107 Bool) (index!3350 (_ BitVec 32)) (x!17477 (_ BitVec 32))) (Undefined!295) (MissingVacant!295 (index!3351 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5635 (_ BitVec 32)) SeekEntryResult!295)

(assert (=> b!158377 (= res!74805 (is-Undefined!295 (seekEntryOrOpen!0 key!828 (_keys!4981 thiss!1248) (mask!7709 thiss!1248))))))

(declare-fun b!158378 () Bool)

(declare-fun res!74802 () Bool)

(assert (=> b!158378 (=> (not res!74802) (not e!103722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158378 (= res!74802 (validMask!0 (mask!7709 thiss!1248)))))

(declare-fun mapIsEmpty!5595 () Bool)

(assert (=> mapIsEmpty!5595 mapRes!5595))

(declare-fun b!158379 () Bool)

(assert (=> b!158379 (= e!103722 (and (= (size!2950 (_values!3177 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7709 thiss!1248))) (= (size!2949 (_keys!4981 thiss!1248)) (size!2950 (_values!3177 thiss!1248))) (bvsge (mask!7709 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!2935 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!158380 () Bool)

(assert (=> b!158380 (= e!103724 (and e!103727 mapRes!5595))))

(declare-fun condMapEmpty!5595 () Bool)

(declare-fun mapDefault!5595 () ValueCell!1298)

