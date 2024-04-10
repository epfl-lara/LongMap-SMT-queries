; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13196 () Bool)

(assert start!13196)

(declare-fun b!116070 () Bool)

(declare-fun b_free!2725 () Bool)

(declare-fun b_next!2725 () Bool)

(assert (=> b!116070 (= b_free!2725 (not b_next!2725))))

(declare-fun tp!10545 () Bool)

(declare-fun b_and!7223 () Bool)

(assert (=> b!116070 (= tp!10545 b_and!7223)))

(declare-fun b!116063 () Bool)

(declare-fun b_free!2727 () Bool)

(declare-fun b_next!2727 () Bool)

(assert (=> b!116063 (= b_free!2727 (not b_next!2727))))

(declare-fun tp!10543 () Bool)

(declare-fun b_and!7225 () Bool)

(assert (=> b!116063 (= tp!10543 b_and!7225)))

(declare-fun b!116055 () Bool)

(declare-fun e!75753 () Bool)

(declare-fun e!75747 () Bool)

(declare-fun mapRes!4276 () Bool)

(assert (=> b!116055 (= e!75753 (and e!75747 mapRes!4276))))

(declare-fun condMapEmpty!4275 () Bool)

(declare-datatypes ((V!3353 0))(
  ( (V!3354 (val!1434 Int)) )
))
(declare-datatypes ((array!4563 0))(
  ( (array!4564 (arr!2163 (Array (_ BitVec 32) (_ BitVec 64))) (size!2424 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1046 0))(
  ( (ValueCellFull!1046 (v!3037 V!3353)) (EmptyCell!1046) )
))
(declare-datatypes ((array!4565 0))(
  ( (array!4566 (arr!2164 (Array (_ BitVec 32) ValueCell!1046)) (size!2425 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1000 0))(
  ( (LongMapFixedSize!1001 (defaultEntry!2711 Int) (mask!6925 (_ BitVec 32)) (extraKeys!2500 (_ BitVec 32)) (zeroValue!2578 V!3353) (minValue!2578 V!3353) (_size!549 (_ BitVec 32)) (_keys!4434 array!4563) (_values!2694 array!4565) (_vacant!549 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!798 0))(
  ( (Cell!799 (v!3038 LongMapFixedSize!1000)) )
))
(declare-datatypes ((LongMap!798 0))(
  ( (LongMap!799 (underlying!410 Cell!798)) )
))
(declare-fun thiss!992 () LongMap!798)

(declare-fun mapDefault!4275 () ValueCell!1046)

