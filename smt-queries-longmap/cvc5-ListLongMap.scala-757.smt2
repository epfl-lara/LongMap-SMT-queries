; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17728 () Bool)

(assert start!17728)

(declare-fun b!177236 () Bool)

(declare-fun b_free!4381 () Bool)

(declare-fun b_next!4381 () Bool)

(assert (=> b!177236 (= b_free!4381 (not b_next!4381))))

(declare-fun tp!15842 () Bool)

(declare-fun b_and!10881 () Bool)

(assert (=> b!177236 (= tp!15842 b_and!10881)))

(declare-fun b!177232 () Bool)

(declare-fun e!116880 () Bool)

(declare-fun e!116881 () Bool)

(declare-fun mapRes!7092 () Bool)

(assert (=> b!177232 (= e!116880 (and e!116881 mapRes!7092))))

(declare-fun condMapEmpty!7092 () Bool)

(declare-datatypes ((V!5185 0))(
  ( (V!5186 (val!2121 Int)) )
))
(declare-datatypes ((ValueCell!1733 0))(
  ( (ValueCellFull!1733 (v!4001 V!5185)) (EmptyCell!1733) )
))
(declare-datatypes ((array!7457 0))(
  ( (array!7458 (arr!3537 (Array (_ BitVec 32) (_ BitVec 64))) (size!3841 (_ BitVec 32))) )
))
(declare-datatypes ((array!7459 0))(
  ( (array!7460 (arr!3538 (Array (_ BitVec 32) ValueCell!1733)) (size!3842 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2374 0))(
  ( (LongMapFixedSize!2375 (defaultEntry!3650 Int) (mask!8586 (_ BitVec 32)) (extraKeys!3387 (_ BitVec 32)) (zeroValue!3491 V!5185) (minValue!3491 V!5185) (_size!1236 (_ BitVec 32)) (_keys!5517 array!7457) (_values!3633 array!7459) (_vacant!1236 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2374)

(declare-fun mapDefault!7092 () ValueCell!1733)

