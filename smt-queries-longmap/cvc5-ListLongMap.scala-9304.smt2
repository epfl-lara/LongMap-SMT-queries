; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111216 () Bool)

(assert start!111216)

(declare-fun b!1316669 () Bool)

(declare-fun e!751122 () Bool)

(declare-fun tp_is_empty!35737 () Bool)

(assert (=> b!1316669 (= e!751122 tp_is_empty!35737)))

(declare-fun b!1316670 () Bool)

(declare-fun e!751124 () Bool)

(declare-fun e!751123 () Bool)

(declare-fun mapRes!55238 () Bool)

(assert (=> b!1316670 (= e!751124 (and e!751123 mapRes!55238))))

(declare-fun condMapEmpty!55238 () Bool)

(declare-datatypes ((V!52753 0))(
  ( (V!52754 (val!17943 Int)) )
))
(declare-datatypes ((ValueCell!16970 0))(
  ( (ValueCellFull!16970 (v!20572 V!52753)) (EmptyCell!16970) )
))
(declare-datatypes ((array!88434 0))(
  ( (array!88435 (arr!42696 (Array (_ BitVec 32) ValueCell!16970)) (size!43246 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88434)

(declare-fun mapDefault!55238 () ValueCell!16970)

