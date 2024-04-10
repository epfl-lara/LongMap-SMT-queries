; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21442 () Bool)

(assert start!21442)

(declare-fun b!215300 () Bool)

(declare-fun b_free!5713 () Bool)

(declare-fun b_next!5713 () Bool)

(assert (=> b!215300 (= b_free!5713 (not b_next!5713))))

(declare-fun tp!20249 () Bool)

(declare-fun b_and!12603 () Bool)

(assert (=> b!215300 (= tp!20249 b_and!12603)))

(declare-fun mapNonEmpty!9501 () Bool)

(declare-fun mapRes!9501 () Bool)

(declare-fun tp!20250 () Bool)

(declare-fun e!140053 () Bool)

(assert (=> mapNonEmpty!9501 (= mapRes!9501 (and tp!20250 e!140053))))

(declare-datatypes ((V!7081 0))(
  ( (V!7082 (val!2832 Int)) )
))
(declare-datatypes ((ValueCell!2444 0))(
  ( (ValueCellFull!2444 (v!4850 V!7081)) (EmptyCell!2444) )
))
(declare-fun mapRest!9501 () (Array (_ BitVec 32) ValueCell!2444))

(declare-fun mapKey!9501 () (_ BitVec 32))

(declare-datatypes ((array!10375 0))(
  ( (array!10376 (arr!4916 (Array (_ BitVec 32) ValueCell!2444)) (size!5245 (_ BitVec 32))) )
))
(declare-datatypes ((array!10377 0))(
  ( (array!10378 (arr!4917 (Array (_ BitVec 32) (_ BitVec 64))) (size!5246 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2788 0))(
  ( (LongMapFixedSize!2789 (defaultEntry!4044 Int) (mask!9738 (_ BitVec 32)) (extraKeys!3781 (_ BitVec 32)) (zeroValue!3885 V!7081) (minValue!3885 V!7081) (_size!1443 (_ BitVec 32)) (_keys!6074 array!10377) (_values!4027 array!10375) (_vacant!1443 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2788)

(declare-fun mapValue!9501 () ValueCell!2444)

(assert (=> mapNonEmpty!9501 (= (arr!4916 (_values!4027 thiss!1504)) (store mapRest!9501 mapKey!9501 mapValue!9501))))

(declare-fun tp_is_empty!5575 () Bool)

(declare-fun e!140056 () Bool)

(declare-fun e!140051 () Bool)

(declare-fun array_inv!3255 (array!10377) Bool)

(declare-fun array_inv!3256 (array!10375) Bool)

(assert (=> b!215300 (= e!140051 (and tp!20249 tp_is_empty!5575 (array_inv!3255 (_keys!6074 thiss!1504)) (array_inv!3256 (_values!4027 thiss!1504)) e!140056))))

(declare-fun b!215301 () Bool)

(declare-fun e!140052 () Bool)

(assert (=> b!215301 (= e!140052 tp_is_empty!5575)))

(declare-fun res!105333 () Bool)

(declare-fun e!140055 () Bool)

(assert (=> start!21442 (=> (not res!105333) (not e!140055))))

(declare-fun valid!1137 (LongMapFixedSize!2788) Bool)

(assert (=> start!21442 (= res!105333 (valid!1137 thiss!1504))))

(assert (=> start!21442 e!140055))

(assert (=> start!21442 e!140051))

(assert (=> start!21442 true))

(declare-fun b!215302 () Bool)

(declare-fun res!105331 () Bool)

(assert (=> b!215302 (=> (not res!105331) (not e!140055))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!215302 (= res!105331 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!9501 () Bool)

(assert (=> mapIsEmpty!9501 mapRes!9501))

(declare-fun b!215303 () Bool)

(assert (=> b!215303 (= e!140056 (and e!140052 mapRes!9501))))

(declare-fun condMapEmpty!9501 () Bool)

(declare-fun mapDefault!9501 () ValueCell!2444)

