; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99472 () Bool)

(assert start!99472)

(declare-fun b_free!25051 () Bool)

(declare-fun b_next!25051 () Bool)

(assert (=> start!99472 (= b_free!25051 (not b_next!25051))))

(declare-fun tp!87866 () Bool)

(declare-fun b_and!40969 () Bool)

(assert (=> start!99472 (= tp!87866 b_and!40969)))

(declare-fun b!1175525 () Bool)

(declare-fun res!780708 () Bool)

(declare-fun e!668197 () Bool)

(assert (=> b!1175525 (=> (not res!780708) (not e!668197))))

(declare-datatypes ((array!75969 0))(
  ( (array!75970 (arr!36634 (Array (_ BitVec 32) (_ BitVec 64))) (size!37170 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75969)

(declare-datatypes ((List!25722 0))(
  ( (Nil!25719) (Cons!25718 (h!26927 (_ BitVec 64)) (t!37765 List!25722)) )
))
(declare-fun arrayNoDuplicates!0 (array!75969 (_ BitVec 32) List!25722) Bool)

(assert (=> b!1175525 (= res!780708 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25719))))

(declare-fun b!1175526 () Bool)

(declare-fun e!668206 () Bool)

(declare-fun tp_is_empty!29581 () Bool)

(assert (=> b!1175526 (= e!668206 tp_is_empty!29581)))

(declare-fun b!1175527 () Bool)

(declare-fun e!668203 () Bool)

(declare-fun mapRes!46199 () Bool)

(assert (=> b!1175527 (= e!668203 (and e!668206 mapRes!46199))))

(declare-fun condMapEmpty!46199 () Bool)

(declare-datatypes ((V!44569 0))(
  ( (V!44570 (val!14847 Int)) )
))
(declare-datatypes ((ValueCell!14081 0))(
  ( (ValueCellFull!14081 (v!17485 V!44569)) (EmptyCell!14081) )
))
(declare-datatypes ((array!75971 0))(
  ( (array!75972 (arr!36635 (Array (_ BitVec 32) ValueCell!14081)) (size!37171 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75971)

(declare-fun mapDefault!46199 () ValueCell!14081)

