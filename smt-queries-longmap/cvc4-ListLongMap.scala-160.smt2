; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3034 () Bool)

(assert start!3034)

(declare-fun b!18057 () Bool)

(declare-fun b_free!641 () Bool)

(declare-fun b_next!641 () Bool)

(assert (=> b!18057 (= b_free!641 (not b_next!641))))

(declare-fun tp!3113 () Bool)

(declare-fun b_and!1289 () Bool)

(assert (=> b!18057 (= tp!3113 b_and!1289)))

(declare-fun b!18048 () Bool)

(declare-fun e!11533 () Bool)

(declare-fun e!11536 () Bool)

(declare-fun mapRes!792 () Bool)

(assert (=> b!18048 (= e!11533 (and e!11536 mapRes!792))))

(declare-fun condMapEmpty!792 () Bool)

(declare-datatypes ((V!1031 0))(
  ( (V!1032 (val!479 Int)) )
))
(declare-datatypes ((ValueCell!253 0))(
  ( (ValueCellFull!253 (v!1462 V!1031)) (EmptyCell!253) )
))
(declare-datatypes ((array!1015 0))(
  ( (array!1016 (arr!489 (Array (_ BitVec 32) ValueCell!253)) (size!579 (_ BitVec 32))) )
))
(declare-datatypes ((array!1017 0))(
  ( (array!1018 (arr!490 (Array (_ BitVec 32) (_ BitVec 64))) (size!580 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!92 0))(
  ( (LongMapFixedSize!93 (defaultEntry!1657 Int) (mask!4586 (_ BitVec 32)) (extraKeys!1570 (_ BitVec 32)) (zeroValue!1593 V!1031) (minValue!1593 V!1031) (_size!78 (_ BitVec 32)) (_keys!3082 array!1017) (_values!1654 array!1015) (_vacant!78 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!92 0))(
  ( (Cell!93 (v!1463 LongMapFixedSize!92)) )
))
(declare-datatypes ((LongMap!92 0))(
  ( (LongMap!93 (underlying!57 Cell!92)) )
))
(declare-fun thiss!848 () LongMap!92)

(declare-fun mapDefault!792 () ValueCell!253)

