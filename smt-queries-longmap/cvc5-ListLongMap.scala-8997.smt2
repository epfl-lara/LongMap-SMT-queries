; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108742 () Bool)

(assert start!108742)

(declare-fun b_free!28255 () Bool)

(declare-fun b_next!28255 () Bool)

(assert (=> start!108742 (= b_free!28255 (not b_next!28255))))

(declare-fun tp!99881 () Bool)

(declare-fun b_and!46321 () Bool)

(assert (=> start!108742 (= tp!99881 b_and!46321)))

(declare-fun b!1284028 () Bool)

(declare-fun res!852991 () Bool)

(declare-fun e!733474 () Bool)

(assert (=> b!1284028 (=> (not res!852991) (not e!733474))))

(declare-datatypes ((array!84848 0))(
  ( (array!84849 (arr!40926 (Array (_ BitVec 32) (_ BitVec 64))) (size!41476 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84848)

(declare-datatypes ((List!28996 0))(
  ( (Nil!28993) (Cons!28992 (h!30201 (_ BitVec 64)) (t!42540 List!28996)) )
))
(declare-fun arrayNoDuplicates!0 (array!84848 (_ BitVec 32) List!28996) Bool)

(assert (=> b!1284028 (= res!852991 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28993))))

(declare-fun b!1284029 () Bool)

(assert (=> b!1284029 (= e!733474 (not true))))

(declare-datatypes ((V!50297 0))(
  ( (V!50298 (val!17022 Int)) )
))
(declare-datatypes ((tuple2!21802 0))(
  ( (tuple2!21803 (_1!10912 (_ BitVec 64)) (_2!10912 V!50297)) )
))
(declare-datatypes ((List!28997 0))(
  ( (Nil!28994) (Cons!28993 (h!30202 tuple2!21802) (t!42541 List!28997)) )
))
(declare-datatypes ((ListLongMap!19459 0))(
  ( (ListLongMap!19460 (toList!9745 List!28997)) )
))
(declare-fun lt!576754 () ListLongMap!19459)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun contains!7862 (ListLongMap!19459 (_ BitVec 64)) Bool)

(assert (=> b!1284029 (contains!7862 lt!576754 k!1205)))

(declare-fun minValue!1387 () V!50297)

(declare-datatypes ((Unit!42497 0))(
  ( (Unit!42498) )
))
(declare-fun lt!576753 () Unit!42497)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!19 ((_ BitVec 64) (_ BitVec 64) V!50297 ListLongMap!19459) Unit!42497)

(assert (=> b!1284029 (= lt!576753 (lemmaInListMapAfterAddingDiffThenInBefore!19 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576754))))

(declare-fun zeroValue!1387 () V!50297)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16049 0))(
  ( (ValueCellFull!16049 (v!19624 V!50297)) (EmptyCell!16049) )
))
(declare-datatypes ((array!84850 0))(
  ( (array!84851 (arr!40927 (Array (_ BitVec 32) ValueCell!16049)) (size!41477 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84850)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun +!4295 (ListLongMap!19459 tuple2!21802) ListLongMap!19459)

(declare-fun getCurrentListMapNoExtraKeys!5925 (array!84848 array!84850 (_ BitVec 32) (_ BitVec 32) V!50297 V!50297 (_ BitVec 32) Int) ListLongMap!19459)

(assert (=> b!1284029 (= lt!576754 (+!4295 (getCurrentListMapNoExtraKeys!5925 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21803 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1284030 () Bool)

(declare-fun e!733471 () Bool)

(declare-fun e!733473 () Bool)

(declare-fun mapRes!52400 () Bool)

(assert (=> b!1284030 (= e!733471 (and e!733473 mapRes!52400))))

(declare-fun condMapEmpty!52400 () Bool)

(declare-fun mapDefault!52400 () ValueCell!16049)

