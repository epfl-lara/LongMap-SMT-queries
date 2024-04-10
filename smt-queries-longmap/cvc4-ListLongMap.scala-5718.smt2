; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74096 () Bool)

(assert start!74096)

(declare-fun mapNonEmpty!27320 () Bool)

(declare-fun mapRes!27320 () Bool)

(declare-fun tp!52519 () Bool)

(declare-fun e!485383 () Bool)

(assert (=> mapNonEmpty!27320 (= mapRes!27320 (and tp!52519 e!485383))))

(declare-datatypes ((V!27909 0))(
  ( (V!27910 (val!8621 Int)) )
))
(declare-datatypes ((ValueCell!8134 0))(
  ( (ValueCellFull!8134 (v!11046 V!27909)) (EmptyCell!8134) )
))
(declare-fun mapRest!27320 () (Array (_ BitVec 32) ValueCell!8134))

(declare-fun mapValue!27320 () ValueCell!8134)

(declare-fun mapKey!27320 () (_ BitVec 32))

(declare-datatypes ((array!50432 0))(
  ( (array!50433 (arr!24247 (Array (_ BitVec 32) ValueCell!8134)) (size!24687 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50432)

(assert (=> mapNonEmpty!27320 (= (arr!24247 _values!688) (store mapRest!27320 mapKey!27320 mapValue!27320))))

(declare-fun b!871775 () Bool)

(declare-fun e!485381 () Bool)

(declare-fun e!485380 () Bool)

(assert (=> b!871775 (= e!485381 (and e!485380 mapRes!27320))))

(declare-fun condMapEmpty!27320 () Bool)

(declare-fun mapDefault!27320 () ValueCell!8134)

