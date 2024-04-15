; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108700 () Bool)

(assert start!108700)

(declare-fun b_free!28213 () Bool)

(declare-fun b_next!28213 () Bool)

(assert (=> start!108700 (= b_free!28213 (not b_next!28213))))

(declare-fun tp!99756 () Bool)

(declare-fun b_and!46261 () Bool)

(assert (=> start!108700 (= tp!99756 b_and!46261)))

(declare-fun b!1283208 () Bool)

(declare-fun res!852400 () Bool)

(declare-fun e!733130 () Bool)

(assert (=> b!1283208 (=> (not res!852400) (not e!733130))))

(declare-datatypes ((array!84667 0))(
  ( (array!84668 (arr!40836 (Array (_ BitVec 32) (_ BitVec 64))) (size!41388 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84667)

(declare-datatypes ((List!29027 0))(
  ( (Nil!29024) (Cons!29023 (h!30232 (_ BitVec 64)) (t!42563 List!29027)) )
))
(declare-fun arrayNoDuplicates!0 (array!84667 (_ BitVec 32) List!29027) Bool)

(assert (=> b!1283208 (= res!852400 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29024))))

(declare-fun mapIsEmpty!52337 () Bool)

(declare-fun mapRes!52337 () Bool)

(assert (=> mapIsEmpty!52337 mapRes!52337))

(declare-fun b!1283209 () Bool)

(declare-fun res!852402 () Bool)

(assert (=> b!1283209 (=> (not res!852402) (not e!733130))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1283209 (= res!852402 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41388 _keys!1741))))))

(declare-fun b!1283210 () Bool)

(declare-fun res!852395 () Bool)

(assert (=> b!1283210 (=> (not res!852395) (not e!733130))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50241 0))(
  ( (V!50242 (val!17001 Int)) )
))
(declare-datatypes ((ValueCell!16028 0))(
  ( (ValueCellFull!16028 (v!19602 V!50241)) (EmptyCell!16028) )
))
(declare-datatypes ((array!84669 0))(
  ( (array!84670 (arr!40837 (Array (_ BitVec 32) ValueCell!16028)) (size!41389 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84669)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1283210 (= res!852395 (and (= (size!41389 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41388 _keys!1741) (size!41389 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!852397 () Bool)

(assert (=> start!108700 (=> (not res!852397) (not e!733130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108700 (= res!852397 (validMask!0 mask!2175))))

(assert (=> start!108700 e!733130))

(declare-fun tp_is_empty!33853 () Bool)

(assert (=> start!108700 tp_is_empty!33853))

(assert (=> start!108700 true))

(declare-fun e!733127 () Bool)

(declare-fun array_inv!31133 (array!84669) Bool)

(assert (=> start!108700 (and (array_inv!31133 _values!1445) e!733127)))

(declare-fun array_inv!31134 (array!84667) Bool)

(assert (=> start!108700 (array_inv!31134 _keys!1741)))

(assert (=> start!108700 tp!99756))

(declare-fun b!1283211 () Bool)

(declare-fun e!733131 () Bool)

(assert (=> b!1283211 (= e!733131 tp_is_empty!33853)))

(declare-fun mapNonEmpty!52337 () Bool)

(declare-fun tp!99755 () Bool)

(assert (=> mapNonEmpty!52337 (= mapRes!52337 (and tp!99755 e!733131))))

(declare-fun mapRest!52337 () (Array (_ BitVec 32) ValueCell!16028))

(declare-fun mapKey!52337 () (_ BitVec 32))

(declare-fun mapValue!52337 () ValueCell!16028)

(assert (=> mapNonEmpty!52337 (= (arr!40837 _values!1445) (store mapRest!52337 mapKey!52337 mapValue!52337))))

(declare-fun b!1283212 () Bool)

(declare-fun res!852399 () Bool)

(assert (=> b!1283212 (=> (not res!852399) (not e!733130))))

(assert (=> b!1283212 (= res!852399 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1283213 () Bool)

(assert (=> b!1283213 (= e!733130 (not true))))

(declare-datatypes ((tuple2!21838 0))(
  ( (tuple2!21839 (_1!10930 (_ BitVec 64)) (_2!10930 V!50241)) )
))
(declare-datatypes ((List!29028 0))(
  ( (Nil!29025) (Cons!29024 (h!30233 tuple2!21838) (t!42564 List!29028)) )
))
(declare-datatypes ((ListLongMap!19495 0))(
  ( (ListLongMap!19496 (toList!9763 List!29028)) )
))
(declare-fun lt!576450 () ListLongMap!19495)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7810 (ListLongMap!19495 (_ BitVec 64)) Bool)

(assert (=> b!1283213 (contains!7810 lt!576450 k0!1205)))

(declare-fun minValue!1387 () V!50241)

(declare-datatypes ((Unit!42311 0))(
  ( (Unit!42312) )
))
(declare-fun lt!576449 () Unit!42311)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!6 ((_ BitVec 64) (_ BitVec 64) V!50241 ListLongMap!19495) Unit!42311)

(assert (=> b!1283213 (= lt!576449 (lemmaInListMapAfterAddingDiffThenInBefore!6 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576450))))

(declare-fun zeroValue!1387 () V!50241)

(declare-fun defaultEntry!1448 () Int)

(declare-fun +!4321 (ListLongMap!19495 tuple2!21838) ListLongMap!19495)

(declare-fun getCurrentListMapNoExtraKeys!5952 (array!84667 array!84669 (_ BitVec 32) (_ BitVec 32) V!50241 V!50241 (_ BitVec 32) Int) ListLongMap!19495)

(assert (=> b!1283213 (= lt!576450 (+!4321 (getCurrentListMapNoExtraKeys!5952 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21839 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283214 () Bool)

(declare-fun res!852394 () Bool)

(assert (=> b!1283214 (=> (not res!852394) (not e!733130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84667 (_ BitVec 32)) Bool)

(assert (=> b!1283214 (= res!852394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283215 () Bool)

(declare-fun res!852398 () Bool)

(assert (=> b!1283215 (=> (not res!852398) (not e!733130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283215 (= res!852398 (validKeyInArray!0 (select (arr!40836 _keys!1741) from!2144)))))

(declare-fun b!1283216 () Bool)

(declare-fun e!733128 () Bool)

(assert (=> b!1283216 (= e!733127 (and e!733128 mapRes!52337))))

(declare-fun condMapEmpty!52337 () Bool)

(declare-fun mapDefault!52337 () ValueCell!16028)

(assert (=> b!1283216 (= condMapEmpty!52337 (= (arr!40837 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16028)) mapDefault!52337)))))

(declare-fun b!1283217 () Bool)

(assert (=> b!1283217 (= e!733128 tp_is_empty!33853)))

(declare-fun b!1283218 () Bool)

(declare-fun res!852401 () Bool)

(assert (=> b!1283218 (=> (not res!852401) (not e!733130))))

(declare-fun getCurrentListMap!4737 (array!84667 array!84669 (_ BitVec 32) (_ BitVec 32) V!50241 V!50241 (_ BitVec 32) Int) ListLongMap!19495)

(assert (=> b!1283218 (= res!852401 (contains!7810 (getCurrentListMap!4737 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283219 () Bool)

(declare-fun res!852396 () Bool)

(assert (=> b!1283219 (=> (not res!852396) (not e!733130))))

(assert (=> b!1283219 (= res!852396 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41388 _keys!1741))))))

(assert (= (and start!108700 res!852397) b!1283210))

(assert (= (and b!1283210 res!852395) b!1283214))

(assert (= (and b!1283214 res!852394) b!1283208))

(assert (= (and b!1283208 res!852400) b!1283209))

(assert (= (and b!1283209 res!852402) b!1283218))

(assert (= (and b!1283218 res!852401) b!1283219))

(assert (= (and b!1283219 res!852396) b!1283215))

(assert (= (and b!1283215 res!852398) b!1283212))

(assert (= (and b!1283212 res!852399) b!1283213))

(assert (= (and b!1283216 condMapEmpty!52337) mapIsEmpty!52337))

(assert (= (and b!1283216 (not condMapEmpty!52337)) mapNonEmpty!52337))

(get-info :version)

(assert (= (and mapNonEmpty!52337 ((_ is ValueCellFull!16028) mapValue!52337)) b!1283211))

(assert (= (and b!1283216 ((_ is ValueCellFull!16028) mapDefault!52337)) b!1283217))

(assert (= start!108700 b!1283216))

(declare-fun m!1176733 () Bool)

(assert (=> b!1283215 m!1176733))

(assert (=> b!1283215 m!1176733))

(declare-fun m!1176735 () Bool)

(assert (=> b!1283215 m!1176735))

(declare-fun m!1176737 () Bool)

(assert (=> b!1283214 m!1176737))

(declare-fun m!1176739 () Bool)

(assert (=> start!108700 m!1176739))

(declare-fun m!1176741 () Bool)

(assert (=> start!108700 m!1176741))

(declare-fun m!1176743 () Bool)

(assert (=> start!108700 m!1176743))

(declare-fun m!1176745 () Bool)

(assert (=> b!1283213 m!1176745))

(declare-fun m!1176747 () Bool)

(assert (=> b!1283213 m!1176747))

(declare-fun m!1176749 () Bool)

(assert (=> b!1283213 m!1176749))

(assert (=> b!1283213 m!1176749))

(declare-fun m!1176751 () Bool)

(assert (=> b!1283213 m!1176751))

(declare-fun m!1176753 () Bool)

(assert (=> b!1283208 m!1176753))

(declare-fun m!1176755 () Bool)

(assert (=> mapNonEmpty!52337 m!1176755))

(declare-fun m!1176757 () Bool)

(assert (=> b!1283218 m!1176757))

(assert (=> b!1283218 m!1176757))

(declare-fun m!1176759 () Bool)

(assert (=> b!1283218 m!1176759))

(check-sat b_and!46261 (not b_next!28213) (not b!1283208) (not b!1283214) (not b!1283218) (not mapNonEmpty!52337) (not start!108700) tp_is_empty!33853 (not b!1283213) (not b!1283215))
(check-sat b_and!46261 (not b_next!28213))
