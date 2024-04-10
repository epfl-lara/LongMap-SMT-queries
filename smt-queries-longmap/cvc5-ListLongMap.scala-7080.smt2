; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89534 () Bool)

(assert start!89534)

(declare-fun b!1026944 () Bool)

(declare-fun b_free!20533 () Bool)

(declare-fun b_next!20533 () Bool)

(assert (=> b!1026944 (= b_free!20533 (not b_next!20533))))

(declare-fun tp!72645 () Bool)

(declare-fun b_and!32779 () Bool)

(assert (=> b!1026944 (= tp!72645 b_and!32779)))

(declare-fun mapIsEmpty!37808 () Bool)

(declare-fun mapRes!37808 () Bool)

(assert (=> mapIsEmpty!37808 mapRes!37808))

(declare-fun b!1026941 () Bool)

(declare-fun e!579451 () Bool)

(declare-fun tp_is_empty!24253 () Bool)

(assert (=> b!1026941 (= e!579451 tp_is_empty!24253)))

(declare-fun b!1026942 () Bool)

(declare-fun e!579453 () Bool)

(assert (=> b!1026942 (= e!579453 (and e!579451 mapRes!37808))))

(declare-fun condMapEmpty!37808 () Bool)

(declare-datatypes ((V!37211 0))(
  ( (V!37212 (val!12177 Int)) )
))
(declare-datatypes ((ValueCell!11423 0))(
  ( (ValueCellFull!11423 (v!14746 V!37211)) (EmptyCell!11423) )
))
(declare-datatypes ((array!64556 0))(
  ( (array!64557 (arr!31087 (Array (_ BitVec 32) (_ BitVec 64))) (size!31600 (_ BitVec 32))) )
))
(declare-datatypes ((array!64558 0))(
  ( (array!64559 (arr!31088 (Array (_ BitVec 32) ValueCell!11423)) (size!31601 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5440 0))(
  ( (LongMapFixedSize!5441 (defaultEntry!6072 Int) (mask!29778 (_ BitVec 32)) (extraKeys!5804 (_ BitVec 32)) (zeroValue!5908 V!37211) (minValue!5908 V!37211) (_size!2775 (_ BitVec 32)) (_keys!11219 array!64556) (_values!6095 array!64558) (_vacant!2775 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5440)

(declare-fun mapDefault!37808 () ValueCell!11423)

