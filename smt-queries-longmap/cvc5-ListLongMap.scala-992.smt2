; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21396 () Bool)

(assert start!21396)

(declare-fun b!214996 () Bool)

(declare-fun b_free!5701 () Bool)

(declare-fun b_next!5701 () Bool)

(assert (=> b!214996 (= b_free!5701 (not b_next!5701))))

(declare-fun tp!20207 () Bool)

(declare-fun b_and!12591 () Bool)

(assert (=> b!214996 (= tp!20207 b_and!12591)))

(declare-fun b!214995 () Bool)

(declare-fun e!139837 () Bool)

(declare-fun tp_is_empty!5563 () Bool)

(assert (=> b!214995 (= e!139837 tp_is_empty!5563)))

(declare-fun e!139835 () Bool)

(declare-datatypes ((V!7065 0))(
  ( (V!7066 (val!2826 Int)) )
))
(declare-datatypes ((ValueCell!2438 0))(
  ( (ValueCellFull!2438 (v!4844 V!7065)) (EmptyCell!2438) )
))
(declare-datatypes ((array!10347 0))(
  ( (array!10348 (arr!4904 (Array (_ BitVec 32) ValueCell!2438)) (size!5232 (_ BitVec 32))) )
))
(declare-datatypes ((array!10349 0))(
  ( (array!10350 (arr!4905 (Array (_ BitVec 32) (_ BitVec 64))) (size!5233 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2776 0))(
  ( (LongMapFixedSize!2777 (defaultEntry!4038 Int) (mask!9720 (_ BitVec 32)) (extraKeys!3775 (_ BitVec 32)) (zeroValue!3879 V!7065) (minValue!3879 V!7065) (_size!1437 (_ BitVec 32)) (_keys!6063 array!10349) (_values!4021 array!10347) (_vacant!1437 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2776)

(declare-fun e!139838 () Bool)

(declare-fun array_inv!3247 (array!10349) Bool)

(declare-fun array_inv!3248 (array!10347) Bool)

(assert (=> b!214996 (= e!139838 (and tp!20207 tp_is_empty!5563 (array_inv!3247 (_keys!6063 thiss!1504)) (array_inv!3248 (_values!4021 thiss!1504)) e!139835))))

(declare-fun b!214997 () Bool)

(declare-fun res!105210 () Bool)

(declare-fun e!139834 () Bool)

(assert (=> b!214997 (=> (not res!105210) (not e!139834))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!214997 (= res!105210 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!214998 () Bool)

(declare-fun mapRes!9476 () Bool)

(assert (=> b!214998 (= e!139835 (and e!139837 mapRes!9476))))

(declare-fun condMapEmpty!9476 () Bool)

(declare-fun mapDefault!9476 () ValueCell!2438)

