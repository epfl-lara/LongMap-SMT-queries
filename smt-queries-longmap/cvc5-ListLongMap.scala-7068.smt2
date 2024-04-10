; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89462 () Bool)

(assert start!89462)

(declare-fun b!1025953 () Bool)

(declare-fun b_free!20461 () Bool)

(declare-fun b_next!20461 () Bool)

(assert (=> b!1025953 (= b_free!20461 (not b_next!20461))))

(declare-fun tp!72428 () Bool)

(declare-fun b_and!32707 () Bool)

(assert (=> b!1025953 (= tp!72428 b_and!32707)))

(declare-fun b!1025947 () Bool)

(declare-fun res!686843 () Bool)

(declare-fun e!578587 () Bool)

(assert (=> b!1025947 (=> (not res!686843) (not e!578587))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025947 (= res!686843 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025948 () Bool)

(declare-fun e!578588 () Bool)

(declare-fun tp_is_empty!24181 () Bool)

(assert (=> b!1025948 (= e!578588 tp_is_empty!24181)))

(declare-fun res!686845 () Bool)

(assert (=> start!89462 (=> (not res!686845) (not e!578587))))

(declare-datatypes ((V!37115 0))(
  ( (V!37116 (val!12141 Int)) )
))
(declare-datatypes ((ValueCell!11387 0))(
  ( (ValueCellFull!11387 (v!14710 V!37115)) (EmptyCell!11387) )
))
(declare-datatypes ((array!64412 0))(
  ( (array!64413 (arr!31015 (Array (_ BitVec 32) (_ BitVec 64))) (size!31528 (_ BitVec 32))) )
))
(declare-datatypes ((array!64414 0))(
  ( (array!64415 (arr!31016 (Array (_ BitVec 32) ValueCell!11387)) (size!31529 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5368 0))(
  ( (LongMapFixedSize!5369 (defaultEntry!6036 Int) (mask!29718 (_ BitVec 32)) (extraKeys!5768 (_ BitVec 32)) (zeroValue!5872 V!37115) (minValue!5872 V!37115) (_size!2739 (_ BitVec 32)) (_keys!11183 array!64412) (_values!6059 array!64414) (_vacant!2739 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5368)

(declare-fun valid!2042 (LongMapFixedSize!5368) Bool)

(assert (=> start!89462 (= res!686845 (valid!2042 thiss!1427))))

(assert (=> start!89462 e!578587))

(declare-fun e!578584 () Bool)

(assert (=> start!89462 e!578584))

(assert (=> start!89462 true))

(declare-fun b!1025949 () Bool)

(declare-fun e!578590 () Bool)

(declare-fun mapRes!37700 () Bool)

(assert (=> b!1025949 (= e!578590 (and e!578588 mapRes!37700))))

(declare-fun condMapEmpty!37700 () Bool)

(declare-fun mapDefault!37700 () ValueCell!11387)

