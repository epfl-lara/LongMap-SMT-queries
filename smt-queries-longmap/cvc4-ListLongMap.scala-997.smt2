; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21522 () Bool)

(assert start!21522)

(declare-fun b!215869 () Bool)

(declare-fun b_free!5735 () Bool)

(declare-fun b_next!5735 () Bool)

(assert (=> b!215869 (= b_free!5735 (not b_next!5735))))

(declare-fun tp!20326 () Bool)

(declare-fun b_and!12625 () Bool)

(assert (=> b!215869 (= tp!20326 b_and!12625)))

(declare-fun b!215866 () Bool)

(declare-fun e!140449 () Bool)

(declare-fun tp_is_empty!5597 () Bool)

(assert (=> b!215866 (= e!140449 tp_is_empty!5597)))

(declare-fun mapNonEmpty!9545 () Bool)

(declare-fun mapRes!9545 () Bool)

(declare-fun tp!20327 () Bool)

(declare-fun e!140453 () Bool)

(assert (=> mapNonEmpty!9545 (= mapRes!9545 (and tp!20327 e!140453))))

(declare-datatypes ((V!7109 0))(
  ( (V!7110 (val!2843 Int)) )
))
(declare-datatypes ((ValueCell!2455 0))(
  ( (ValueCellFull!2455 (v!4861 V!7109)) (EmptyCell!2455) )
))
(declare-fun mapRest!9545 () (Array (_ BitVec 32) ValueCell!2455))

(declare-fun mapKey!9545 () (_ BitVec 32))

(declare-datatypes ((array!10425 0))(
  ( (array!10426 (arr!4938 (Array (_ BitVec 32) ValueCell!2455)) (size!5269 (_ BitVec 32))) )
))
(declare-datatypes ((array!10427 0))(
  ( (array!10428 (arr!4939 (Array (_ BitVec 32) (_ BitVec 64))) (size!5270 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2810 0))(
  ( (LongMapFixedSize!2811 (defaultEntry!4055 Int) (mask!9769 (_ BitVec 32)) (extraKeys!3792 (_ BitVec 32)) (zeroValue!3896 V!7109) (minValue!3896 V!7109) (_size!1454 (_ BitVec 32)) (_keys!6094 array!10427) (_values!4038 array!10425) (_vacant!1454 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2810)

(declare-fun mapValue!9545 () ValueCell!2455)

(assert (=> mapNonEmpty!9545 (= (arr!4938 (_values!4038 thiss!1504)) (store mapRest!9545 mapKey!9545 mapValue!9545))))

(declare-fun b!215867 () Bool)

(declare-fun e!140447 () Bool)

(assert (=> b!215867 (= e!140447 (and (= (size!5269 (_values!4038 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9769 thiss!1504))) (= (size!5270 (_keys!6094 thiss!1504)) (size!5269 (_values!4038 thiss!1504))) (bvsge (mask!9769 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3792 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3792 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!215868 () Bool)

(declare-fun res!105563 () Bool)

(declare-fun e!140451 () Bool)

(assert (=> b!215868 (=> (not res!105563) (not e!140451))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!215868 (= res!105563 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!9545 () Bool)

(assert (=> mapIsEmpty!9545 mapRes!9545))

(declare-fun e!140452 () Bool)

(declare-fun e!140448 () Bool)

(declare-fun array_inv!3267 (array!10427) Bool)

(declare-fun array_inv!3268 (array!10425) Bool)

(assert (=> b!215869 (= e!140448 (and tp!20326 tp_is_empty!5597 (array_inv!3267 (_keys!6094 thiss!1504)) (array_inv!3268 (_values!4038 thiss!1504)) e!140452))))

(declare-fun b!215870 () Bool)

(assert (=> b!215870 (= e!140452 (and e!140449 mapRes!9545))))

(declare-fun condMapEmpty!9545 () Bool)

(declare-fun mapDefault!9545 () ValueCell!2455)

