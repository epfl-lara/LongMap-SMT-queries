; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113420 () Bool)

(assert start!113420)

(declare-fun b_free!31471 () Bool)

(declare-fun b_next!31471 () Bool)

(assert (=> start!113420 (= b_free!31471 (not b_next!31471))))

(declare-fun tp!110217 () Bool)

(declare-fun b_and!50759 () Bool)

(assert (=> start!113420 (= tp!110217 b_and!50759)))

(declare-fun b!1346394 () Bool)

(declare-fun e!766091 () Bool)

(declare-fun tp_is_empty!37471 () Bool)

(assert (=> b!1346394 (= e!766091 tp_is_empty!37471)))

(declare-fun b!1346395 () Bool)

(declare-fun res!893400 () Bool)

(declare-fun e!766093 () Bool)

(assert (=> b!1346395 (=> (not res!893400) (not e!766093))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91774 0))(
  ( (array!91775 (arr!44343 (Array (_ BitVec 32) (_ BitVec 64))) (size!44893 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91774)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!55065 0))(
  ( (V!55066 (val!18810 Int)) )
))
(declare-datatypes ((ValueCell!17837 0))(
  ( (ValueCellFull!17837 (v!21458 V!55065)) (EmptyCell!17837) )
))
(declare-datatypes ((array!91776 0))(
  ( (array!91777 (arr!44344 (Array (_ BitVec 32) ValueCell!17837)) (size!44894 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91776)

(assert (=> b!1346395 (= res!893400 (and (= (size!44894 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44893 _keys!1571) (size!44894 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346397 () Bool)

(declare-fun e!766092 () Bool)

(declare-fun mapRes!57913 () Bool)

(assert (=> b!1346397 (= e!766092 (and e!766091 mapRes!57913))))

(declare-fun condMapEmpty!57913 () Bool)

(declare-fun mapDefault!57913 () ValueCell!17837)

