; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113426 () Bool)

(assert start!113426)

(declare-fun b_free!31477 () Bool)

(declare-fun b_next!31477 () Bool)

(assert (=> start!113426 (= b_free!31477 (not b_next!31477))))

(declare-fun tp!110235 () Bool)

(declare-fun b_and!50765 () Bool)

(assert (=> start!113426 (= tp!110235 b_and!50765)))

(declare-fun b!1346466 () Bool)

(declare-fun e!766135 () Bool)

(assert (=> b!1346466 (= e!766135 false)))

(declare-datatypes ((V!55073 0))(
  ( (V!55074 (val!18813 Int)) )
))
(declare-fun minValue!1245 () V!55073)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91786 0))(
  ( (array!91787 (arr!44349 (Array (_ BitVec 32) (_ BitVec 64))) (size!44899 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91786)

(declare-fun zeroValue!1245 () V!55073)

(declare-fun lt!595518 () Bool)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17840 0))(
  ( (ValueCellFull!17840 (v!21461 V!55073)) (EmptyCell!17840) )
))
(declare-datatypes ((array!91788 0))(
  ( (array!91789 (arr!44350 (Array (_ BitVec 32) ValueCell!17840)) (size!44900 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91788)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24248 0))(
  ( (tuple2!24249 (_1!12135 (_ BitVec 64)) (_2!12135 V!55073)) )
))
(declare-datatypes ((List!31405 0))(
  ( (Nil!31402) (Cons!31401 (h!32610 tuple2!24248) (t!45995 List!31405)) )
))
(declare-datatypes ((ListLongMap!21905 0))(
  ( (ListLongMap!21906 (toList!10968 List!31405)) )
))
(declare-fun contains!9144 (ListLongMap!21905 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5920 (array!91786 array!91788 (_ BitVec 32) (_ BitVec 32) V!55073 V!55073 (_ BitVec 32) Int) ListLongMap!21905)

(assert (=> b!1346466 (= lt!595518 (contains!9144 (getCurrentListMap!5920 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1346467 () Bool)

(declare-fun res!893441 () Bool)

(assert (=> b!1346467 (=> (not res!893441) (not e!766135))))

(declare-datatypes ((List!31406 0))(
  ( (Nil!31403) (Cons!31402 (h!32611 (_ BitVec 64)) (t!45996 List!31406)) )
))
(declare-fun arrayNoDuplicates!0 (array!91786 (_ BitVec 32) List!31406) Bool)

(assert (=> b!1346467 (= res!893441 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31403))))

(declare-fun mapNonEmpty!57922 () Bool)

(declare-fun mapRes!57922 () Bool)

(declare-fun tp!110236 () Bool)

(declare-fun e!766137 () Bool)

(assert (=> mapNonEmpty!57922 (= mapRes!57922 (and tp!110236 e!766137))))

(declare-fun mapRest!57922 () (Array (_ BitVec 32) ValueCell!17840))

(declare-fun mapKey!57922 () (_ BitVec 32))

(declare-fun mapValue!57922 () ValueCell!17840)

(assert (=> mapNonEmpty!57922 (= (arr!44350 _values!1303) (store mapRest!57922 mapKey!57922 mapValue!57922))))

(declare-fun b!1346468 () Bool)

(declare-fun tp_is_empty!37477 () Bool)

(assert (=> b!1346468 (= e!766137 tp_is_empty!37477)))

(declare-fun b!1346469 () Bool)

(declare-fun e!766138 () Bool)

(declare-fun e!766139 () Bool)

(assert (=> b!1346469 (= e!766138 (and e!766139 mapRes!57922))))

(declare-fun condMapEmpty!57922 () Bool)

(declare-fun mapDefault!57922 () ValueCell!17840)

