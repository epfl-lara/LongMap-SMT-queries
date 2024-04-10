; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111470 () Bool)

(assert start!111470)

(declare-fun b_free!30127 () Bool)

(declare-fun b_next!30127 () Bool)

(assert (=> start!111470 (= b_free!30127 (not b_next!30127))))

(declare-fun tp!105856 () Bool)

(declare-fun b_and!48413 () Bool)

(assert (=> start!111470 (= tp!105856 b_and!48413)))

(declare-fun b!1319440 () Bool)

(declare-fun res!875705 () Bool)

(declare-fun e!752792 () Bool)

(assert (=> b!1319440 (=> (not res!875705) (not e!752792))))

(declare-datatypes ((array!88832 0))(
  ( (array!88833 (arr!42890 (Array (_ BitVec 32) (_ BitVec 64))) (size!43440 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88832)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53033 0))(
  ( (V!53034 (val!18048 Int)) )
))
(declare-fun zeroValue!1279 () V!53033)

(declare-datatypes ((ValueCell!17075 0))(
  ( (ValueCellFull!17075 (v!20678 V!53033)) (EmptyCell!17075) )
))
(declare-datatypes ((array!88834 0))(
  ( (array!88835 (arr!42891 (Array (_ BitVec 32) ValueCell!17075)) (size!43441 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88834)

(declare-fun minValue!1279 () V!53033)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23228 0))(
  ( (tuple2!23229 (_1!11625 (_ BitVec 64)) (_2!11625 V!53033)) )
))
(declare-datatypes ((List!30382 0))(
  ( (Nil!30379) (Cons!30378 (h!31587 tuple2!23228) (t!44058 List!30382)) )
))
(declare-datatypes ((ListLongMap!20885 0))(
  ( (ListLongMap!20886 (toList!10458 List!30382)) )
))
(declare-fun contains!8613 (ListLongMap!20885 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5468 (array!88832 array!88834 (_ BitVec 32) (_ BitVec 32) V!53033 V!53033 (_ BitVec 32) Int) ListLongMap!20885)

(assert (=> b!1319440 (= res!875705 (contains!8613 (getCurrentListMap!5468 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1319441 () Bool)

(declare-fun e!752794 () Bool)

(declare-fun e!752793 () Bool)

(declare-fun mapRes!55568 () Bool)

(assert (=> b!1319441 (= e!752794 (and e!752793 mapRes!55568))))

(declare-fun condMapEmpty!55568 () Bool)

(declare-fun mapDefault!55568 () ValueCell!17075)

