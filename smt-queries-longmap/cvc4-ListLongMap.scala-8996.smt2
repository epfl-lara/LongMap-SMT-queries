; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108740 () Bool)

(assert start!108740)

(declare-fun b_free!28253 () Bool)

(declare-fun b_next!28253 () Bool)

(assert (=> start!108740 (= b_free!28253 (not b_next!28253))))

(declare-fun tp!99875 () Bool)

(declare-fun b_and!46319 () Bool)

(assert (=> start!108740 (= tp!99875 b_and!46319)))

(declare-fun b!1283992 () Bool)

(declare-fun e!733460 () Bool)

(declare-fun tp_is_empty!33893 () Bool)

(assert (=> b!1283992 (= e!733460 tp_is_empty!33893)))

(declare-fun b!1283994 () Bool)

(declare-fun e!733456 () Bool)

(assert (=> b!1283994 (= e!733456 tp_is_empty!33893)))

(declare-fun b!1283995 () Bool)

(declare-fun res!852969 () Bool)

(declare-fun e!733458 () Bool)

(assert (=> b!1283995 (=> (not res!852969) (not e!733458))))

(declare-datatypes ((array!84844 0))(
  ( (array!84845 (arr!40924 (Array (_ BitVec 32) (_ BitVec 64))) (size!41474 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84844)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283995 (= res!852969 (validKeyInArray!0 (select (arr!40924 _keys!1741) from!2144)))))

(declare-fun mapNonEmpty!52397 () Bool)

(declare-fun mapRes!52397 () Bool)

(declare-fun tp!99874 () Bool)

(assert (=> mapNonEmpty!52397 (= mapRes!52397 (and tp!99874 e!733460))))

(declare-datatypes ((V!50293 0))(
  ( (V!50294 (val!17021 Int)) )
))
(declare-datatypes ((ValueCell!16048 0))(
  ( (ValueCellFull!16048 (v!19623 V!50293)) (EmptyCell!16048) )
))
(declare-fun mapValue!52397 () ValueCell!16048)

(declare-fun mapKey!52397 () (_ BitVec 32))

(declare-datatypes ((array!84846 0))(
  ( (array!84847 (arr!40925 (Array (_ BitVec 32) ValueCell!16048)) (size!41475 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84846)

(declare-fun mapRest!52397 () (Array (_ BitVec 32) ValueCell!16048))

(assert (=> mapNonEmpty!52397 (= (arr!40925 _values!1445) (store mapRest!52397 mapKey!52397 mapValue!52397))))

(declare-fun b!1283996 () Bool)

(declare-fun res!852965 () Bool)

(assert (=> b!1283996 (=> (not res!852965) (not e!733458))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1283996 (= res!852965 (and (= (size!41475 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41474 _keys!1741) (size!41475 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283997 () Bool)

(declare-fun res!852968 () Bool)

(assert (=> b!1283997 (=> (not res!852968) (not e!733458))))

(assert (=> b!1283997 (= res!852968 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41474 _keys!1741))))))

(declare-fun mapIsEmpty!52397 () Bool)

(assert (=> mapIsEmpty!52397 mapRes!52397))

(declare-fun b!1283998 () Bool)

(declare-fun res!852964 () Bool)

(assert (=> b!1283998 (=> (not res!852964) (not e!733458))))

(declare-fun minValue!1387 () V!50293)

(declare-fun zeroValue!1387 () V!50293)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21800 0))(
  ( (tuple2!21801 (_1!10911 (_ BitVec 64)) (_2!10911 V!50293)) )
))
(declare-datatypes ((List!28995 0))(
  ( (Nil!28992) (Cons!28991 (h!30200 tuple2!21800) (t!42539 List!28995)) )
))
(declare-datatypes ((ListLongMap!19457 0))(
  ( (ListLongMap!19458 (toList!9744 List!28995)) )
))
(declare-fun contains!7861 (ListLongMap!19457 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4824 (array!84844 array!84846 (_ BitVec 32) (_ BitVec 32) V!50293 V!50293 (_ BitVec 32) Int) ListLongMap!19457)

(assert (=> b!1283998 (= res!852964 (contains!7861 (getCurrentListMap!4824 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1283999 () Bool)

(assert (=> b!1283999 (= e!733458 (not (bvsle from!2144 (size!41474 _keys!1741))))))

(declare-fun lt!576748 () ListLongMap!19457)

(assert (=> b!1283999 (contains!7861 lt!576748 k!1205)))

(declare-datatypes ((Unit!42495 0))(
  ( (Unit!42496) )
))
(declare-fun lt!576747 () Unit!42495)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!18 ((_ BitVec 64) (_ BitVec 64) V!50293 ListLongMap!19457) Unit!42495)

(assert (=> b!1283999 (= lt!576747 (lemmaInListMapAfterAddingDiffThenInBefore!18 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576748))))

(declare-fun +!4294 (ListLongMap!19457 tuple2!21800) ListLongMap!19457)

(declare-fun getCurrentListMapNoExtraKeys!5924 (array!84844 array!84846 (_ BitVec 32) (_ BitVec 32) V!50293 V!50293 (_ BitVec 32) Int) ListLongMap!19457)

(assert (=> b!1283999 (= lt!576748 (+!4294 (getCurrentListMapNoExtraKeys!5924 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21801 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1284000 () Bool)

(declare-fun e!733457 () Bool)

(assert (=> b!1284000 (= e!733457 (and e!733456 mapRes!52397))))

(declare-fun condMapEmpty!52397 () Bool)

(declare-fun mapDefault!52397 () ValueCell!16048)

