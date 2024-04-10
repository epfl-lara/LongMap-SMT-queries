; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109108 () Bool)

(assert start!109108)

(declare-fun b_free!28597 () Bool)

(declare-fun b_next!28597 () Bool)

(assert (=> start!109108 (= b_free!28597 (not b_next!28597))))

(declare-fun tp!100909 () Bool)

(declare-fun b_and!46687 () Bool)

(assert (=> start!109108 (= tp!100909 b_and!46687)))

(declare-fun res!856968 () Bool)

(declare-fun e!736514 () Bool)

(assert (=> start!109108 (=> (not res!856968) (not e!736514))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109108 (= res!856968 (validMask!0 mask!2175))))

(assert (=> start!109108 e!736514))

(declare-fun tp_is_empty!34237 () Bool)

(assert (=> start!109108 tp_is_empty!34237))

(assert (=> start!109108 true))

(declare-datatypes ((V!50753 0))(
  ( (V!50754 (val!17193 Int)) )
))
(declare-datatypes ((ValueCell!16220 0))(
  ( (ValueCellFull!16220 (v!19796 V!50753)) (EmptyCell!16220) )
))
(declare-datatypes ((array!85516 0))(
  ( (array!85517 (arr!41259 (Array (_ BitVec 32) ValueCell!16220)) (size!41809 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85516)

(declare-fun e!736512 () Bool)

(declare-fun array_inv!31271 (array!85516) Bool)

(assert (=> start!109108 (and (array_inv!31271 _values!1445) e!736512)))

(declare-datatypes ((array!85518 0))(
  ( (array!85519 (arr!41260 (Array (_ BitVec 32) (_ BitVec 64))) (size!41810 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85518)

(declare-fun array_inv!31272 (array!85518) Bool)

(assert (=> start!109108 (array_inv!31272 _keys!1741)))

(assert (=> start!109108 tp!100909))

(declare-fun b!1290029 () Bool)

(declare-fun res!856961 () Bool)

(assert (=> b!1290029 (=> (not res!856961) (not e!736514))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1290029 (= res!856961 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41810 _keys!1741))))))

(declare-fun b!1290030 () Bool)

(declare-fun e!736511 () Bool)

(assert (=> b!1290030 (= e!736514 (not e!736511))))

(declare-fun res!856966 () Bool)

(assert (=> b!1290030 (=> res!856966 e!736511)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1290030 (= res!856966 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22088 0))(
  ( (tuple2!22089 (_1!11055 (_ BitVec 64)) (_2!11055 V!50753)) )
))
(declare-datatypes ((List!29255 0))(
  ( (Nil!29252) (Cons!29251 (h!30460 tuple2!22088) (t!42819 List!29255)) )
))
(declare-datatypes ((ListLongMap!19745 0))(
  ( (ListLongMap!19746 (toList!9888 List!29255)) )
))
(declare-fun contains!8006 (ListLongMap!19745 (_ BitVec 64)) Bool)

(assert (=> b!1290030 (not (contains!8006 (ListLongMap!19746 Nil!29252) k!1205))))

(declare-datatypes ((Unit!42690 0))(
  ( (Unit!42691) )
))
(declare-fun lt!578454 () Unit!42690)

(declare-fun emptyContainsNothing!72 ((_ BitVec 64)) Unit!42690)

(assert (=> b!1290030 (= lt!578454 (emptyContainsNothing!72 k!1205))))

(declare-fun b!1290031 () Bool)

(declare-fun e!736513 () Bool)

(assert (=> b!1290031 (= e!736513 tp_is_empty!34237)))

(declare-fun b!1290032 () Bool)

(declare-fun e!736509 () Bool)

(assert (=> b!1290032 (= e!736509 tp_is_empty!34237)))

(declare-fun mapIsEmpty!52916 () Bool)

(declare-fun mapRes!52916 () Bool)

(assert (=> mapIsEmpty!52916 mapRes!52916))

(declare-fun mapNonEmpty!52916 () Bool)

(declare-fun tp!100910 () Bool)

(assert (=> mapNonEmpty!52916 (= mapRes!52916 (and tp!100910 e!736513))))

(declare-fun mapRest!52916 () (Array (_ BitVec 32) ValueCell!16220))

(declare-fun mapValue!52916 () ValueCell!16220)

(declare-fun mapKey!52916 () (_ BitVec 32))

(assert (=> mapNonEmpty!52916 (= (arr!41259 _values!1445) (store mapRest!52916 mapKey!52916 mapValue!52916))))

(declare-fun b!1290033 () Bool)

(assert (=> b!1290033 (= e!736511 true)))

(declare-fun lt!578456 () ListLongMap!19745)

(declare-fun minValue!1387 () V!50753)

(declare-fun +!4357 (ListLongMap!19745 tuple2!22088) ListLongMap!19745)

(assert (=> b!1290033 (not (contains!8006 (+!4357 lt!578456 (tuple2!22089 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!578455 () Unit!42690)

(declare-fun addStillNotContains!375 (ListLongMap!19745 (_ BitVec 64) V!50753 (_ BitVec 64)) Unit!42690)

(assert (=> b!1290033 (= lt!578455 (addStillNotContains!375 lt!578456 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(declare-fun zeroValue!1387 () V!50753)

(assert (=> b!1290033 (not (contains!8006 (+!4357 lt!578456 (tuple2!22089 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun lt!578453 () Unit!42690)

(assert (=> b!1290033 (= lt!578453 (addStillNotContains!375 lt!578456 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5988 (array!85518 array!85516 (_ BitVec 32) (_ BitVec 32) V!50753 V!50753 (_ BitVec 32) Int) ListLongMap!19745)

(assert (=> b!1290033 (= lt!578456 (getCurrentListMapNoExtraKeys!5988 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290034 () Bool)

(declare-fun res!856962 () Bool)

(assert (=> b!1290034 (=> (not res!856962) (not e!736514))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85518 (_ BitVec 32)) Bool)

(assert (=> b!1290034 (= res!856962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290035 () Bool)

(declare-fun res!856964 () Bool)

(assert (=> b!1290035 (=> (not res!856964) (not e!736514))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290035 (= res!856964 (not (validKeyInArray!0 (select (arr!41260 _keys!1741) from!2144))))))

(declare-fun b!1290036 () Bool)

(declare-fun res!856963 () Bool)

(assert (=> b!1290036 (=> (not res!856963) (not e!736514))))

(declare-datatypes ((List!29256 0))(
  ( (Nil!29253) (Cons!29252 (h!30461 (_ BitVec 64)) (t!42820 List!29256)) )
))
(declare-fun arrayNoDuplicates!0 (array!85518 (_ BitVec 32) List!29256) Bool)

(assert (=> b!1290036 (= res!856963 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29253))))

(declare-fun b!1290037 () Bool)

(declare-fun res!856960 () Bool)

(assert (=> b!1290037 (=> (not res!856960) (not e!736514))))

(assert (=> b!1290037 (= res!856960 (and (= (size!41809 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41810 _keys!1741) (size!41809 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290038 () Bool)

(assert (=> b!1290038 (= e!736512 (and e!736509 mapRes!52916))))

(declare-fun condMapEmpty!52916 () Bool)

(declare-fun mapDefault!52916 () ValueCell!16220)

