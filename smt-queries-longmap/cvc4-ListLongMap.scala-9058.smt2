; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109136 () Bool)

(assert start!109136)

(declare-fun b_free!28625 () Bool)

(declare-fun b_next!28625 () Bool)

(assert (=> start!109136 (= b_free!28625 (not b_next!28625))))

(declare-fun tp!100994 () Bool)

(declare-fun b_and!46715 () Bool)

(assert (=> start!109136 (= tp!100994 b_and!46715)))

(declare-fun b!1290533 () Bool)

(declare-fun e!736761 () Bool)

(assert (=> b!1290533 (= e!736761 true)))

(declare-datatypes ((V!50789 0))(
  ( (V!50790 (val!17207 Int)) )
))
(declare-datatypes ((tuple2!22110 0))(
  ( (tuple2!22111 (_1!11066 (_ BitVec 64)) (_2!11066 V!50789)) )
))
(declare-fun lt!578672 () tuple2!22110)

(declare-datatypes ((List!29276 0))(
  ( (Nil!29273) (Cons!29272 (h!30481 tuple2!22110) (t!42840 List!29276)) )
))
(declare-datatypes ((ListLongMap!19767 0))(
  ( (ListLongMap!19768 (toList!9899 List!29276)) )
))
(declare-fun lt!578674 () ListLongMap!19767)

(declare-fun lt!578673 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun contains!8017 (ListLongMap!19767 (_ BitVec 64)) Bool)

(declare-fun +!4367 (ListLongMap!19767 tuple2!22110) ListLongMap!19767)

(assert (=> b!1290533 (= lt!578673 (contains!8017 (+!4367 lt!578674 lt!578672) k!1205))))

(declare-fun lt!578675 () ListLongMap!19767)

(assert (=> b!1290533 (not (contains!8017 (+!4367 lt!578675 lt!578672) k!1205))))

(declare-fun minValue!1387 () V!50789)

(assert (=> b!1290533 (= lt!578672 (tuple2!22111 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))

(declare-datatypes ((Unit!42712 0))(
  ( (Unit!42713) )
))
(declare-fun lt!578677 () Unit!42712)

(declare-fun addStillNotContains!385 (ListLongMap!19767 (_ BitVec 64) V!50789 (_ BitVec 64)) Unit!42712)

(assert (=> b!1290533 (= lt!578677 (addStillNotContains!385 lt!578675 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1290533 (not (contains!8017 lt!578674 k!1205))))

(declare-fun zeroValue!1387 () V!50789)

(assert (=> b!1290533 (= lt!578674 (+!4367 lt!578675 (tuple2!22111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578676 () Unit!42712)

(assert (=> b!1290533 (= lt!578676 (addStillNotContains!385 lt!578675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16234 0))(
  ( (ValueCellFull!16234 (v!19810 V!50789)) (EmptyCell!16234) )
))
(declare-datatypes ((array!85570 0))(
  ( (array!85571 (arr!41286 (Array (_ BitVec 32) ValueCell!16234)) (size!41836 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85570)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85572 0))(
  ( (array!85573 (arr!41287 (Array (_ BitVec 32) (_ BitVec 64))) (size!41837 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85572)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5998 (array!85572 array!85570 (_ BitVec 32) (_ BitVec 32) V!50789 V!50789 (_ BitVec 32) Int) ListLongMap!19767)

(assert (=> b!1290533 (= lt!578675 (getCurrentListMapNoExtraKeys!5998 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290534 () Bool)

(declare-fun res!857338 () Bool)

(declare-fun e!736763 () Bool)

(assert (=> b!1290534 (=> (not res!857338) (not e!736763))))

(declare-fun getCurrentListMap!4957 (array!85572 array!85570 (_ BitVec 32) (_ BitVec 32) V!50789 V!50789 (_ BitVec 32) Int) ListLongMap!19767)

(assert (=> b!1290534 (= res!857338 (contains!8017 (getCurrentListMap!4957 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1290535 () Bool)

(declare-fun res!857346 () Bool)

(assert (=> b!1290535 (=> (not res!857346) (not e!736763))))

(declare-datatypes ((List!29277 0))(
  ( (Nil!29274) (Cons!29273 (h!30482 (_ BitVec 64)) (t!42841 List!29277)) )
))
(declare-fun arrayNoDuplicates!0 (array!85572 (_ BitVec 32) List!29277) Bool)

(assert (=> b!1290535 (= res!857346 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29274))))

(declare-fun b!1290537 () Bool)

(declare-fun res!857343 () Bool)

(assert (=> b!1290537 (=> (not res!857343) (not e!736763))))

(assert (=> b!1290537 (= res!857343 (and (= (size!41836 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41837 _keys!1741) (size!41836 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290538 () Bool)

(assert (=> b!1290538 (= e!736763 (not e!736761))))

(declare-fun res!857345 () Bool)

(assert (=> b!1290538 (=> res!857345 e!736761)))

(assert (=> b!1290538 (= res!857345 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290538 (not (contains!8017 (ListLongMap!19768 Nil!29273) k!1205))))

(declare-fun lt!578678 () Unit!42712)

(declare-fun emptyContainsNothing!82 ((_ BitVec 64)) Unit!42712)

(assert (=> b!1290538 (= lt!578678 (emptyContainsNothing!82 k!1205))))

(declare-fun mapIsEmpty!52958 () Bool)

(declare-fun mapRes!52958 () Bool)

(assert (=> mapIsEmpty!52958 mapRes!52958))

(declare-fun mapNonEmpty!52958 () Bool)

(declare-fun tp!100993 () Bool)

(declare-fun e!736766 () Bool)

(assert (=> mapNonEmpty!52958 (= mapRes!52958 (and tp!100993 e!736766))))

(declare-fun mapRest!52958 () (Array (_ BitVec 32) ValueCell!16234))

(declare-fun mapKey!52958 () (_ BitVec 32))

(declare-fun mapValue!52958 () ValueCell!16234)

(assert (=> mapNonEmpty!52958 (= (arr!41286 _values!1445) (store mapRest!52958 mapKey!52958 mapValue!52958))))

(declare-fun b!1290539 () Bool)

(declare-fun e!736764 () Bool)

(declare-fun tp_is_empty!34265 () Bool)

(assert (=> b!1290539 (= e!736764 tp_is_empty!34265)))

(declare-fun b!1290540 () Bool)

(declare-fun res!857340 () Bool)

(assert (=> b!1290540 (=> (not res!857340) (not e!736763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85572 (_ BitVec 32)) Bool)

(assert (=> b!1290540 (= res!857340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290541 () Bool)

(declare-fun e!736762 () Bool)

(assert (=> b!1290541 (= e!736762 (and e!736764 mapRes!52958))))

(declare-fun condMapEmpty!52958 () Bool)

(declare-fun mapDefault!52958 () ValueCell!16234)

