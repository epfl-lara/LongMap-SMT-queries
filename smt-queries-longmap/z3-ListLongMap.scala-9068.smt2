; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109192 () Bool)

(assert start!109192)

(declare-fun b_free!28681 () Bool)

(declare-fun b_next!28681 () Bool)

(assert (=> start!109192 (= b_free!28681 (not b_next!28681))))

(declare-fun tp!101162 () Bool)

(declare-fun b_and!46753 () Bool)

(assert (=> start!109192 (= tp!101162 b_and!46753)))

(declare-fun b!1291477 () Bool)

(declare-fun e!737241 () Bool)

(declare-fun e!737240 () Bool)

(declare-fun mapRes!53042 () Bool)

(assert (=> b!1291477 (= e!737241 (and e!737240 mapRes!53042))))

(declare-fun condMapEmpty!53042 () Bool)

(declare-datatypes ((V!50865 0))(
  ( (V!50866 (val!17235 Int)) )
))
(declare-datatypes ((ValueCell!16262 0))(
  ( (ValueCellFull!16262 (v!19837 V!50865)) (EmptyCell!16262) )
))
(declare-datatypes ((array!85561 0))(
  ( (array!85562 (arr!41282 (Array (_ BitVec 32) ValueCell!16262)) (size!41834 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85561)

(declare-fun mapDefault!53042 () ValueCell!16262)

(assert (=> b!1291477 (= condMapEmpty!53042 (= (arr!41282 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16262)) mapDefault!53042)))))

(declare-fun b!1291478 () Bool)

(declare-fun res!858072 () Bool)

(declare-fun e!737237 () Bool)

(assert (=> b!1291478 (=> (not res!858072) (not e!737237))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85563 0))(
  ( (array!85564 (arr!41283 (Array (_ BitVec 32) (_ BitVec 64))) (size!41835 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85563)

(assert (=> b!1291478 (= res!858072 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41835 _keys!1741))))))

(declare-fun b!1291479 () Bool)

(declare-fun res!858068 () Bool)

(assert (=> b!1291479 (=> (not res!858068) (not e!737237))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291479 (= res!858068 (and (= (size!41834 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41835 _keys!1741) (size!41834 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291480 () Bool)

(declare-fun e!737238 () Bool)

(declare-fun tp_is_empty!34321 () Bool)

(assert (=> b!1291480 (= e!737238 tp_is_empty!34321)))

(declare-fun b!1291482 () Bool)

(declare-fun e!737239 () Bool)

(assert (=> b!1291482 (= e!737239 true)))

(assert (=> b!1291482 false))

(declare-datatypes ((tuple2!22204 0))(
  ( (tuple2!22205 (_1!11113 (_ BitVec 64)) (_2!11113 V!50865)) )
))
(declare-datatypes ((List!29358 0))(
  ( (Nil!29355) (Cons!29354 (h!30563 tuple2!22204) (t!42914 List!29358)) )
))
(declare-datatypes ((ListLongMap!19861 0))(
  ( (ListLongMap!19862 (toList!9946 List!29358)) )
))
(declare-fun lt!579001 () ListLongMap!19861)

(declare-fun minValue!1387 () V!50865)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((Unit!42584 0))(
  ( (Unit!42585) )
))
(declare-fun lt!578999 () Unit!42584)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!61 ((_ BitVec 64) (_ BitVec 64) V!50865 ListLongMap!19861) Unit!42584)

(assert (=> b!1291482 (= lt!578999 (lemmaInListMapAfterAddingDiffThenInBefore!61 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579001))))

(declare-fun lt!579003 () ListLongMap!19861)

(declare-fun contains!7994 (ListLongMap!19861 (_ BitVec 64)) Bool)

(declare-fun +!4420 (ListLongMap!19861 tuple2!22204) ListLongMap!19861)

(assert (=> b!1291482 (not (contains!7994 (+!4420 lt!579003 (tuple2!22205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579002 () Unit!42584)

(declare-fun addStillNotContains!397 (ListLongMap!19861 (_ BitVec 64) V!50865 (_ BitVec 64)) Unit!42584)

(assert (=> b!1291482 (= lt!579002 (addStillNotContains!397 lt!579003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291482 (not (contains!7994 lt!579001 k0!1205))))

(declare-fun zeroValue!1387 () V!50865)

(assert (=> b!1291482 (= lt!579001 (+!4420 lt!579003 (tuple2!22205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579000 () Unit!42584)

(assert (=> b!1291482 (= lt!579000 (addStillNotContains!397 lt!579003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6051 (array!85563 array!85561 (_ BitVec 32) (_ BitVec 32) V!50865 V!50865 (_ BitVec 32) Int) ListLongMap!19861)

(assert (=> b!1291482 (= lt!579003 (getCurrentListMapNoExtraKeys!6051 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291483 () Bool)

(declare-fun res!858071 () Bool)

(assert (=> b!1291483 (=> (not res!858071) (not e!737237))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85563 (_ BitVec 32)) Bool)

(assert (=> b!1291483 (= res!858071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291484 () Bool)

(declare-fun res!858070 () Bool)

(assert (=> b!1291484 (=> (not res!858070) (not e!737237))))

(declare-fun getCurrentListMap!4892 (array!85563 array!85561 (_ BitVec 32) (_ BitVec 32) V!50865 V!50865 (_ BitVec 32) Int) ListLongMap!19861)

(assert (=> b!1291484 (= res!858070 (contains!7994 (getCurrentListMap!4892 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1291485 () Bool)

(declare-fun res!858067 () Bool)

(assert (=> b!1291485 (=> (not res!858067) (not e!737237))))

(declare-datatypes ((List!29359 0))(
  ( (Nil!29356) (Cons!29355 (h!30564 (_ BitVec 64)) (t!42915 List!29359)) )
))
(declare-fun arrayNoDuplicates!0 (array!85563 (_ BitVec 32) List!29359) Bool)

(assert (=> b!1291485 (= res!858067 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29356))))

(declare-fun mapNonEmpty!53042 () Bool)

(declare-fun tp!101163 () Bool)

(assert (=> mapNonEmpty!53042 (= mapRes!53042 (and tp!101163 e!737238))))

(declare-fun mapKey!53042 () (_ BitVec 32))

(declare-fun mapValue!53042 () ValueCell!16262)

(declare-fun mapRest!53042 () (Array (_ BitVec 32) ValueCell!16262))

(assert (=> mapNonEmpty!53042 (= (arr!41282 _values!1445) (store mapRest!53042 mapKey!53042 mapValue!53042))))

(declare-fun b!1291481 () Bool)

(assert (=> b!1291481 (= e!737240 tp_is_empty!34321)))

(declare-fun res!858074 () Bool)

(assert (=> start!109192 (=> (not res!858074) (not e!737237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109192 (= res!858074 (validMask!0 mask!2175))))

(assert (=> start!109192 e!737237))

(assert (=> start!109192 tp_is_empty!34321))

(assert (=> start!109192 true))

(declare-fun array_inv!31441 (array!85561) Bool)

(assert (=> start!109192 (and (array_inv!31441 _values!1445) e!737241)))

(declare-fun array_inv!31442 (array!85563) Bool)

(assert (=> start!109192 (array_inv!31442 _keys!1741)))

(assert (=> start!109192 tp!101162))

(declare-fun mapIsEmpty!53042 () Bool)

(assert (=> mapIsEmpty!53042 mapRes!53042))

(declare-fun b!1291486 () Bool)

(declare-fun res!858069 () Bool)

(assert (=> b!1291486 (=> (not res!858069) (not e!737237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291486 (= res!858069 (not (validKeyInArray!0 (select (arr!41283 _keys!1741) from!2144))))))

(declare-fun b!1291487 () Bool)

(declare-fun res!858073 () Bool)

(assert (=> b!1291487 (=> (not res!858073) (not e!737237))))

(assert (=> b!1291487 (= res!858073 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41835 _keys!1741))))))

(declare-fun b!1291488 () Bool)

(assert (=> b!1291488 (= e!737237 (not e!737239))))

(declare-fun res!858075 () Bool)

(assert (=> b!1291488 (=> res!858075 e!737239)))

(assert (=> b!1291488 (= res!858075 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1291488 (not (contains!7994 (ListLongMap!19862 Nil!29355) k0!1205))))

(declare-fun lt!579004 () Unit!42584)

(declare-fun emptyContainsNothing!89 ((_ BitVec 64)) Unit!42584)

(assert (=> b!1291488 (= lt!579004 (emptyContainsNothing!89 k0!1205))))

(assert (= (and start!109192 res!858074) b!1291479))

(assert (= (and b!1291479 res!858068) b!1291483))

(assert (= (and b!1291483 res!858071) b!1291485))

(assert (= (and b!1291485 res!858067) b!1291478))

(assert (= (and b!1291478 res!858072) b!1291484))

(assert (= (and b!1291484 res!858070) b!1291487))

(assert (= (and b!1291487 res!858073) b!1291486))

(assert (= (and b!1291486 res!858069) b!1291488))

(assert (= (and b!1291488 (not res!858075)) b!1291482))

(assert (= (and b!1291477 condMapEmpty!53042) mapIsEmpty!53042))

(assert (= (and b!1291477 (not condMapEmpty!53042)) mapNonEmpty!53042))

(get-info :version)

(assert (= (and mapNonEmpty!53042 ((_ is ValueCellFull!16262) mapValue!53042)) b!1291480))

(assert (= (and b!1291477 ((_ is ValueCellFull!16262) mapDefault!53042)) b!1291481))

(assert (= start!109192 b!1291477))

(declare-fun m!1183755 () Bool)

(assert (=> b!1291484 m!1183755))

(assert (=> b!1291484 m!1183755))

(declare-fun m!1183757 () Bool)

(assert (=> b!1291484 m!1183757))

(declare-fun m!1183759 () Bool)

(assert (=> b!1291482 m!1183759))

(declare-fun m!1183761 () Bool)

(assert (=> b!1291482 m!1183761))

(declare-fun m!1183763 () Bool)

(assert (=> b!1291482 m!1183763))

(assert (=> b!1291482 m!1183761))

(declare-fun m!1183765 () Bool)

(assert (=> b!1291482 m!1183765))

(declare-fun m!1183767 () Bool)

(assert (=> b!1291482 m!1183767))

(declare-fun m!1183769 () Bool)

(assert (=> b!1291482 m!1183769))

(declare-fun m!1183771 () Bool)

(assert (=> b!1291482 m!1183771))

(declare-fun m!1183773 () Bool)

(assert (=> b!1291482 m!1183773))

(declare-fun m!1183775 () Bool)

(assert (=> b!1291485 m!1183775))

(declare-fun m!1183777 () Bool)

(assert (=> mapNonEmpty!53042 m!1183777))

(declare-fun m!1183779 () Bool)

(assert (=> b!1291486 m!1183779))

(assert (=> b!1291486 m!1183779))

(declare-fun m!1183781 () Bool)

(assert (=> b!1291486 m!1183781))

(declare-fun m!1183783 () Bool)

(assert (=> start!109192 m!1183783))

(declare-fun m!1183785 () Bool)

(assert (=> start!109192 m!1183785))

(declare-fun m!1183787 () Bool)

(assert (=> start!109192 m!1183787))

(declare-fun m!1183789 () Bool)

(assert (=> b!1291483 m!1183789))

(declare-fun m!1183791 () Bool)

(assert (=> b!1291488 m!1183791))

(declare-fun m!1183793 () Bool)

(assert (=> b!1291488 m!1183793))

(check-sat (not mapNonEmpty!53042) (not b_next!28681) (not start!109192) (not b!1291485) (not b!1291488) (not b!1291482) tp_is_empty!34321 (not b!1291486) (not b!1291483) (not b!1291484) b_and!46753)
(check-sat b_and!46753 (not b_next!28681))
