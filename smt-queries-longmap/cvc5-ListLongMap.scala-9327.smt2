; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111398 () Bool)

(assert start!111398)

(declare-fun b_free!30055 () Bool)

(declare-fun b_next!30055 () Bool)

(assert (=> start!111398 (= b_free!30055 (not b_next!30055))))

(declare-fun tp!105640 () Bool)

(declare-fun b_and!48275 () Bool)

(assert (=> start!111398 (= tp!105640 b_and!48275)))

(declare-fun b!1318186 () Bool)

(declare-fun res!874841 () Bool)

(declare-fun e!752252 () Bool)

(assert (=> b!1318186 (=> (not res!874841) (not e!752252))))

(declare-datatypes ((array!88698 0))(
  ( (array!88699 (arr!42823 (Array (_ BitVec 32) (_ BitVec 64))) (size!43373 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88698)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!52937 0))(
  ( (V!52938 (val!18012 Int)) )
))
(declare-datatypes ((ValueCell!17039 0))(
  ( (ValueCellFull!17039 (v!20642 V!52937)) (EmptyCell!17039) )
))
(declare-datatypes ((array!88700 0))(
  ( (array!88701 (arr!42824 (Array (_ BitVec 32) ValueCell!17039)) (size!43374 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88700)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1318186 (= res!874841 (and (= (size!43374 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43373 _keys!1609) (size!43374 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318187 () Bool)

(declare-fun res!874837 () Bool)

(assert (=> b!1318187 (=> (not res!874837) (not e!752252))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1318187 (= res!874837 (not (= (select (arr!42823 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1318188 () Bool)

(declare-fun e!752253 () Bool)

(declare-fun e!752254 () Bool)

(declare-fun mapRes!55460 () Bool)

(assert (=> b!1318188 (= e!752253 (and e!752254 mapRes!55460))))

(declare-fun condMapEmpty!55460 () Bool)

(declare-fun mapDefault!55460 () ValueCell!17039)

