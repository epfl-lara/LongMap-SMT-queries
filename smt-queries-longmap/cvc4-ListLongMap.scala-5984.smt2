; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77734 () Bool)

(assert start!77734)

(declare-fun b_free!16319 () Bool)

(declare-fun b_next!16319 () Bool)

(assert (=> start!77734 (= b_free!16319 (not b_next!16319))))

(declare-fun tp!57219 () Bool)

(declare-fun b_and!26791 () Bool)

(assert (=> start!77734 (= tp!57219 b_and!26791)))

(declare-fun b!907050 () Bool)

(declare-fun e!508329 () Bool)

(declare-fun e!508322 () Bool)

(declare-fun mapRes!29818 () Bool)

(assert (=> b!907050 (= e!508329 (and e!508322 mapRes!29818))))

(declare-fun condMapEmpty!29818 () Bool)

(declare-datatypes ((V!29947 0))(
  ( (V!29948 (val!9419 Int)) )
))
(declare-datatypes ((ValueCell!8887 0))(
  ( (ValueCellFull!8887 (v!11924 V!29947)) (EmptyCell!8887) )
))
(declare-datatypes ((array!53512 0))(
  ( (array!53513 (arr!25715 (Array (_ BitVec 32) ValueCell!8887)) (size!26174 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53512)

(declare-fun mapDefault!29818 () ValueCell!8887)

