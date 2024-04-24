; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109284 () Bool)

(assert start!109284)

(declare-fun b_free!28549 () Bool)

(declare-fun b_next!28549 () Bool)

(assert (=> start!109284 (= b_free!28549 (not b_next!28549))))

(declare-fun tp!100765 () Bool)

(declare-fun b_and!46641 () Bool)

(assert (=> start!109284 (= tp!100765 b_and!46641)))

(declare-fun b!1290470 () Bool)

(declare-fun e!736929 () Bool)

(declare-fun e!736925 () Bool)

(assert (=> b!1290470 (= e!736929 (not e!736925))))

(declare-fun res!856836 () Bool)

(assert (=> b!1290470 (=> res!856836 e!736925)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1290470 (= res!856836 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50689 0))(
  ( (V!50690 (val!17169 Int)) )
))
(declare-datatypes ((tuple2!22062 0))(
  ( (tuple2!22063 (_1!11042 (_ BitVec 64)) (_2!11042 V!50689)) )
))
(declare-datatypes ((List!29243 0))(
  ( (Nil!29240) (Cons!29239 (h!30457 tuple2!22062) (t!42799 List!29243)) )
))
(declare-datatypes ((ListLongMap!19727 0))(
  ( (ListLongMap!19728 (toList!9879 List!29243)) )
))
(declare-fun contains!8010 (ListLongMap!19727 (_ BitVec 64)) Bool)

(assert (=> b!1290470 (not (contains!8010 (ListLongMap!19728 Nil!29240) k0!1205))))

(declare-datatypes ((Unit!42607 0))(
  ( (Unit!42608) )
))
(declare-fun lt!578658 () Unit!42607)

(declare-fun emptyContainsNothing!55 ((_ BitVec 64)) Unit!42607)

(assert (=> b!1290470 (= lt!578658 (emptyContainsNothing!55 k0!1205))))

(declare-fun b!1290471 () Bool)

(declare-fun res!856832 () Bool)

(assert (=> b!1290471 (=> (not res!856832) (not e!736929))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85457 0))(
  ( (array!85458 (arr!41225 (Array (_ BitVec 32) (_ BitVec 64))) (size!41776 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85457)

(assert (=> b!1290471 (= res!856832 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41776 _keys!1741))))))

(declare-fun b!1290472 () Bool)

(declare-fun res!856840 () Bool)

(assert (=> b!1290472 (=> (not res!856840) (not e!736929))))

(assert (=> b!1290472 (= res!856840 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41776 _keys!1741))))))

(declare-fun mapNonEmpty!52844 () Bool)

(declare-fun mapRes!52844 () Bool)

(declare-fun tp!100766 () Bool)

(declare-fun e!736924 () Bool)

(assert (=> mapNonEmpty!52844 (= mapRes!52844 (and tp!100766 e!736924))))

(declare-datatypes ((ValueCell!16196 0))(
  ( (ValueCellFull!16196 (v!19767 V!50689)) (EmptyCell!16196) )
))
(declare-fun mapRest!52844 () (Array (_ BitVec 32) ValueCell!16196))

(declare-datatypes ((array!85459 0))(
  ( (array!85460 (arr!41226 (Array (_ BitVec 32) ValueCell!16196)) (size!41777 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85459)

(declare-fun mapValue!52844 () ValueCell!16196)

(declare-fun mapKey!52844 () (_ BitVec 32))

(assert (=> mapNonEmpty!52844 (= (arr!41226 _values!1445) (store mapRest!52844 mapKey!52844 mapValue!52844))))

(declare-fun b!1290473 () Bool)

(declare-fun e!736927 () Bool)

(declare-fun tp_is_empty!34189 () Bool)

(assert (=> b!1290473 (= e!736927 tp_is_empty!34189)))

(declare-fun b!1290474 () Bool)

(declare-fun e!736926 () Bool)

(assert (=> b!1290474 (= e!736926 (and e!736927 mapRes!52844))))

(declare-fun condMapEmpty!52844 () Bool)

(declare-fun mapDefault!52844 () ValueCell!16196)

(assert (=> b!1290474 (= condMapEmpty!52844 (= (arr!41226 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16196)) mapDefault!52844)))))

(declare-fun b!1290475 () Bool)

(declare-fun res!856834 () Bool)

(assert (=> b!1290475 (=> (not res!856834) (not e!736929))))

(declare-fun minValue!1387 () V!50689)

(declare-fun zeroValue!1387 () V!50689)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMap!4925 (array!85457 array!85459 (_ BitVec 32) (_ BitVec 32) V!50689 V!50689 (_ BitVec 32) Int) ListLongMap!19727)

(assert (=> b!1290475 (= res!856834 (contains!8010 (getCurrentListMap!4925 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290476 () Bool)

(declare-fun res!856839 () Bool)

(assert (=> b!1290476 (=> (not res!856839) (not e!736929))))

(declare-datatypes ((List!29244 0))(
  ( (Nil!29241) (Cons!29240 (h!30458 (_ BitVec 64)) (t!42800 List!29244)) )
))
(declare-fun arrayNoDuplicates!0 (array!85457 (_ BitVec 32) List!29244) Bool)

(assert (=> b!1290476 (= res!856839 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29241))))

(declare-fun b!1290477 () Bool)

(declare-fun res!856835 () Bool)

(assert (=> b!1290477 (=> (not res!856835) (not e!736929))))

(assert (=> b!1290477 (= res!856835 (and (= (size!41777 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41776 _keys!1741) (size!41777 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290478 () Bool)

(assert (=> b!1290478 (= e!736924 tp_is_empty!34189)))

(declare-fun b!1290479 () Bool)

(declare-fun res!856838 () Bool)

(assert (=> b!1290479 (=> (not res!856838) (not e!736929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290479 (= res!856838 (not (validKeyInArray!0 (select (arr!41225 _keys!1741) from!2144))))))

(declare-fun b!1290480 () Bool)

(declare-fun res!856837 () Bool)

(assert (=> b!1290480 (=> (not res!856837) (not e!736929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85457 (_ BitVec 32)) Bool)

(assert (=> b!1290480 (= res!856837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290481 () Bool)

(assert (=> b!1290481 (= e!736925 (bvsle from!2144 (size!41776 _keys!1741)))))

(declare-fun lt!578657 () ListLongMap!19727)

(declare-fun +!4384 (ListLongMap!19727 tuple2!22062) ListLongMap!19727)

(assert (=> b!1290481 (not (contains!8010 (+!4384 lt!578657 (tuple2!22063 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578656 () Unit!42607)

(declare-fun addStillNotContains!360 (ListLongMap!19727 (_ BitVec 64) V!50689 (_ BitVec 64)) Unit!42607)

(assert (=> b!1290481 (= lt!578656 (addStillNotContains!360 lt!578657 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6022 (array!85457 array!85459 (_ BitVec 32) (_ BitVec 32) V!50689 V!50689 (_ BitVec 32) Int) ListLongMap!19727)

(assert (=> b!1290481 (= lt!578657 (getCurrentListMapNoExtraKeys!6022 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun res!856833 () Bool)

(assert (=> start!109284 (=> (not res!856833) (not e!736929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109284 (= res!856833 (validMask!0 mask!2175))))

(assert (=> start!109284 e!736929))

(assert (=> start!109284 tp_is_empty!34189))

(assert (=> start!109284 true))

(declare-fun array_inv!31461 (array!85459) Bool)

(assert (=> start!109284 (and (array_inv!31461 _values!1445) e!736926)))

(declare-fun array_inv!31462 (array!85457) Bool)

(assert (=> start!109284 (array_inv!31462 _keys!1741)))

(assert (=> start!109284 tp!100765))

(declare-fun mapIsEmpty!52844 () Bool)

(assert (=> mapIsEmpty!52844 mapRes!52844))

(assert (= (and start!109284 res!856833) b!1290477))

(assert (= (and b!1290477 res!856835) b!1290480))

(assert (= (and b!1290480 res!856837) b!1290476))

(assert (= (and b!1290476 res!856839) b!1290471))

(assert (= (and b!1290471 res!856832) b!1290475))

(assert (= (and b!1290475 res!856834) b!1290472))

(assert (= (and b!1290472 res!856840) b!1290479))

(assert (= (and b!1290479 res!856838) b!1290470))

(assert (= (and b!1290470 (not res!856836)) b!1290481))

(assert (= (and b!1290474 condMapEmpty!52844) mapIsEmpty!52844))

(assert (= (and b!1290474 (not condMapEmpty!52844)) mapNonEmpty!52844))

(get-info :version)

(assert (= (and mapNonEmpty!52844 ((_ is ValueCellFull!16196) mapValue!52844)) b!1290478))

(assert (= (and b!1290474 ((_ is ValueCellFull!16196) mapDefault!52844)) b!1290473))

(assert (= start!109284 b!1290474))

(declare-fun m!1183317 () Bool)

(assert (=> b!1290480 m!1183317))

(declare-fun m!1183319 () Bool)

(assert (=> b!1290470 m!1183319))

(declare-fun m!1183321 () Bool)

(assert (=> b!1290470 m!1183321))

(declare-fun m!1183323 () Bool)

(assert (=> b!1290475 m!1183323))

(assert (=> b!1290475 m!1183323))

(declare-fun m!1183325 () Bool)

(assert (=> b!1290475 m!1183325))

(declare-fun m!1183327 () Bool)

(assert (=> mapNonEmpty!52844 m!1183327))

(declare-fun m!1183329 () Bool)

(assert (=> b!1290481 m!1183329))

(assert (=> b!1290481 m!1183329))

(declare-fun m!1183331 () Bool)

(assert (=> b!1290481 m!1183331))

(declare-fun m!1183333 () Bool)

(assert (=> b!1290481 m!1183333))

(declare-fun m!1183335 () Bool)

(assert (=> b!1290481 m!1183335))

(declare-fun m!1183337 () Bool)

(assert (=> b!1290476 m!1183337))

(declare-fun m!1183339 () Bool)

(assert (=> start!109284 m!1183339))

(declare-fun m!1183341 () Bool)

(assert (=> start!109284 m!1183341))

(declare-fun m!1183343 () Bool)

(assert (=> start!109284 m!1183343))

(declare-fun m!1183345 () Bool)

(assert (=> b!1290479 m!1183345))

(assert (=> b!1290479 m!1183345))

(declare-fun m!1183347 () Bool)

(assert (=> b!1290479 m!1183347))

(check-sat (not b!1290481) (not b!1290479) (not b_next!28549) (not start!109284) (not b!1290470) (not b!1290475) (not mapNonEmpty!52844) (not b!1290476) tp_is_empty!34189 b_and!46641 (not b!1290480))
(check-sat b_and!46641 (not b_next!28549))
