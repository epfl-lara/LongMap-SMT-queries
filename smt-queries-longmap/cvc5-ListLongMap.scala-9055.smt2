; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109114 () Bool)

(assert start!109114)

(declare-fun b_free!28603 () Bool)

(declare-fun b_next!28603 () Bool)

(assert (=> start!109114 (= b_free!28603 (not b_next!28603))))

(declare-fun tp!100927 () Bool)

(declare-fun b_and!46693 () Bool)

(assert (=> start!109114 (= tp!100927 b_and!46693)))

(declare-fun b!1290137 () Bool)

(declare-fun res!857044 () Bool)

(declare-fun e!736565 () Bool)

(assert (=> b!1290137 (=> (not res!857044) (not e!736565))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!85528 0))(
  ( (array!85529 (arr!41265 (Array (_ BitVec 32) (_ BitVec 64))) (size!41815 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85528)

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1290137 (= res!857044 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41815 _keys!1741))))))

(declare-fun b!1290138 () Bool)

(declare-fun res!857046 () Bool)

(assert (=> b!1290138 (=> (not res!857046) (not e!736565))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85528 (_ BitVec 32)) Bool)

(assert (=> b!1290138 (= res!857046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!857043 () Bool)

(assert (=> start!109114 (=> (not res!857043) (not e!736565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109114 (= res!857043 (validMask!0 mask!2175))))

(assert (=> start!109114 e!736565))

(declare-fun tp_is_empty!34243 () Bool)

(assert (=> start!109114 tp_is_empty!34243))

(assert (=> start!109114 true))

(declare-datatypes ((V!50761 0))(
  ( (V!50762 (val!17196 Int)) )
))
(declare-datatypes ((ValueCell!16223 0))(
  ( (ValueCellFull!16223 (v!19799 V!50761)) (EmptyCell!16223) )
))
(declare-datatypes ((array!85530 0))(
  ( (array!85531 (arr!41266 (Array (_ BitVec 32) ValueCell!16223)) (size!41816 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85530)

(declare-fun e!736563 () Bool)

(declare-fun array_inv!31275 (array!85530) Bool)

(assert (=> start!109114 (and (array_inv!31275 _values!1445) e!736563)))

(declare-fun array_inv!31276 (array!85528) Bool)

(assert (=> start!109114 (array_inv!31276 _keys!1741)))

(assert (=> start!109114 tp!100927))

(declare-fun b!1290139 () Bool)

(declare-fun e!736564 () Bool)

(assert (=> b!1290139 (= e!736564 tp_is_empty!34243)))

(declare-fun b!1290140 () Bool)

(declare-fun res!857048 () Bool)

(assert (=> b!1290140 (=> (not res!857048) (not e!736565))))

(declare-fun minValue!1387 () V!50761)

(declare-fun zeroValue!1387 () V!50761)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22092 0))(
  ( (tuple2!22093 (_1!11057 (_ BitVec 64)) (_2!11057 V!50761)) )
))
(declare-datatypes ((List!29259 0))(
  ( (Nil!29256) (Cons!29255 (h!30464 tuple2!22092) (t!42823 List!29259)) )
))
(declare-datatypes ((ListLongMap!19749 0))(
  ( (ListLongMap!19750 (toList!9890 List!29259)) )
))
(declare-fun contains!8008 (ListLongMap!19749 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4948 (array!85528 array!85530 (_ BitVec 32) (_ BitVec 32) V!50761 V!50761 (_ BitVec 32) Int) ListLongMap!19749)

(assert (=> b!1290140 (= res!857048 (contains!8008 (getCurrentListMap!4948 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1290141 () Bool)

(declare-fun res!857042 () Bool)

(assert (=> b!1290141 (=> (not res!857042) (not e!736565))))

(declare-datatypes ((List!29260 0))(
  ( (Nil!29257) (Cons!29256 (h!30465 (_ BitVec 64)) (t!42824 List!29260)) )
))
(declare-fun arrayNoDuplicates!0 (array!85528 (_ BitVec 32) List!29260) Bool)

(assert (=> b!1290141 (= res!857042 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29257))))

(declare-fun mapIsEmpty!52925 () Bool)

(declare-fun mapRes!52925 () Bool)

(assert (=> mapIsEmpty!52925 mapRes!52925))

(declare-fun b!1290142 () Bool)

(declare-fun res!857041 () Bool)

(assert (=> b!1290142 (=> (not res!857041) (not e!736565))))

(assert (=> b!1290142 (= res!857041 (and (= (size!41816 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41815 _keys!1741) (size!41816 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290143 () Bool)

(declare-fun e!736566 () Bool)

(assert (=> b!1290143 (= e!736566 tp_is_empty!34243)))

(declare-fun b!1290144 () Bool)

(declare-fun res!857047 () Bool)

(assert (=> b!1290144 (=> (not res!857047) (not e!736565))))

(assert (=> b!1290144 (= res!857047 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41815 _keys!1741))))))

(declare-fun mapNonEmpty!52925 () Bool)

(declare-fun tp!100928 () Bool)

(assert (=> mapNonEmpty!52925 (= mapRes!52925 (and tp!100928 e!736566))))

(declare-fun mapValue!52925 () ValueCell!16223)

(declare-fun mapKey!52925 () (_ BitVec 32))

(declare-fun mapRest!52925 () (Array (_ BitVec 32) ValueCell!16223))

(assert (=> mapNonEmpty!52925 (= (arr!41266 _values!1445) (store mapRest!52925 mapKey!52925 mapValue!52925))))

(declare-fun b!1290145 () Bool)

(declare-fun e!736568 () Bool)

(assert (=> b!1290145 (= e!736568 true)))

(declare-fun lt!578489 () ListLongMap!19749)

(declare-fun +!4359 (ListLongMap!19749 tuple2!22092) ListLongMap!19749)

(assert (=> b!1290145 (not (contains!8008 (+!4359 lt!578489 (tuple2!22093 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-datatypes ((Unit!42694 0))(
  ( (Unit!42695) )
))
(declare-fun lt!578490 () Unit!42694)

(declare-fun addStillNotContains!377 (ListLongMap!19749 (_ BitVec 64) V!50761 (_ BitVec 64)) Unit!42694)

(assert (=> b!1290145 (= lt!578490 (addStillNotContains!377 lt!578489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1290145 (not (contains!8008 (+!4359 lt!578489 (tuple2!22093 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun lt!578492 () Unit!42694)

(assert (=> b!1290145 (= lt!578492 (addStillNotContains!377 lt!578489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5990 (array!85528 array!85530 (_ BitVec 32) (_ BitVec 32) V!50761 V!50761 (_ BitVec 32) Int) ListLongMap!19749)

(assert (=> b!1290145 (= lt!578489 (getCurrentListMapNoExtraKeys!5990 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290146 () Bool)

(declare-fun res!857045 () Bool)

(assert (=> b!1290146 (=> (not res!857045) (not e!736565))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290146 (= res!857045 (not (validKeyInArray!0 (select (arr!41265 _keys!1741) from!2144))))))

(declare-fun b!1290147 () Bool)

(assert (=> b!1290147 (= e!736563 (and e!736564 mapRes!52925))))

(declare-fun condMapEmpty!52925 () Bool)

(declare-fun mapDefault!52925 () ValueCell!16223)

