; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77722 () Bool)

(assert start!77722)

(declare-fun b_free!16307 () Bool)

(declare-fun b_next!16307 () Bool)

(assert (=> start!77722 (= b_free!16307 (not b_next!16307))))

(declare-fun tp!57182 () Bool)

(declare-fun b_and!26767 () Bool)

(assert (=> start!77722 (= tp!57182 b_and!26767)))

(declare-fun b!906804 () Bool)

(declare-fun e!508184 () Bool)

(declare-fun tp_is_empty!18725 () Bool)

(assert (=> b!906804 (= e!508184 tp_is_empty!18725)))

(declare-fun b!906805 () Bool)

(declare-fun e!508179 () Bool)

(declare-fun mapRes!29800 () Bool)

(assert (=> b!906805 (= e!508179 (and e!508184 mapRes!29800))))

(declare-fun condMapEmpty!29800 () Bool)

(declare-datatypes ((V!29931 0))(
  ( (V!29932 (val!9413 Int)) )
))
(declare-datatypes ((ValueCell!8881 0))(
  ( (ValueCellFull!8881 (v!11918 V!29931)) (EmptyCell!8881) )
))
(declare-datatypes ((array!53492 0))(
  ( (array!53493 (arr!25705 (Array (_ BitVec 32) ValueCell!8881)) (size!26164 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53492)

(declare-fun mapDefault!29800 () ValueCell!8881)

