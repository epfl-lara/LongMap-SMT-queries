; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90698 () Bool)

(assert start!90698)

(declare-fun b!1037190 () Bool)

(declare-fun b_free!20887 () Bool)

(declare-fun b_next!20887 () Bool)

(assert (=> b!1037190 (= b_free!20887 (not b_next!20887))))

(declare-fun tp!73803 () Bool)

(declare-fun b_and!33419 () Bool)

(assert (=> b!1037190 (= tp!73803 b_and!33419)))

(declare-fun b!1037186 () Bool)

(declare-fun e!586648 () Bool)

(declare-fun e!586651 () Bool)

(declare-fun mapRes!38436 () Bool)

(assert (=> b!1037186 (= e!586648 (and e!586651 mapRes!38436))))

(declare-fun condMapEmpty!38436 () Bool)

(declare-datatypes ((V!37683 0))(
  ( (V!37684 (val!12354 Int)) )
))
(declare-datatypes ((ValueCell!11600 0))(
  ( (ValueCellFull!11600 (v!14937 V!37683)) (EmptyCell!11600) )
))
(declare-datatypes ((array!65316 0))(
  ( (array!65317 (arr!31441 (Array (_ BitVec 32) (_ BitVec 64))) (size!31971 (_ BitVec 32))) )
))
(declare-datatypes ((array!65318 0))(
  ( (array!65319 (arr!31442 (Array (_ BitVec 32) ValueCell!11600)) (size!31972 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5794 0))(
  ( (LongMapFixedSize!5795 (defaultEntry!6279 Int) (mask!30193 (_ BitVec 32)) (extraKeys!6007 (_ BitVec 32)) (zeroValue!6113 V!37683) (minValue!6113 V!37683) (_size!2952 (_ BitVec 32)) (_keys!11474 array!65316) (_values!6302 array!65318) (_vacant!2952 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5794)

(declare-fun mapDefault!38436 () ValueCell!11600)

