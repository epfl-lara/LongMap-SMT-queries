; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109248 () Bool)

(assert start!109248)

(declare-fun b_free!28737 () Bool)

(declare-fun b_next!28737 () Bool)

(assert (=> start!109248 (= b_free!28737 (not b_next!28737))))

(declare-fun tp!101330 () Bool)

(declare-fun b_and!46827 () Bool)

(assert (=> start!109248 (= tp!101330 b_and!46827)))

(declare-fun mapNonEmpty!53126 () Bool)

(declare-fun mapRes!53126 () Bool)

(declare-fun tp!101329 () Bool)

(declare-fun e!737702 () Bool)

(assert (=> mapNonEmpty!53126 (= mapRes!53126 (and tp!101329 e!737702))))

(declare-fun mapKey!53126 () (_ BitVec 32))

(declare-datatypes ((V!50939 0))(
  ( (V!50940 (val!17263 Int)) )
))
(declare-datatypes ((ValueCell!16290 0))(
  ( (ValueCellFull!16290 (v!19866 V!50939)) (EmptyCell!16290) )
))
(declare-fun mapRest!53126 () (Array (_ BitVec 32) ValueCell!16290))

(declare-datatypes ((array!85786 0))(
  ( (array!85787 (arr!41394 (Array (_ BitVec 32) ValueCell!16290)) (size!41944 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85786)

(declare-fun mapValue!53126 () ValueCell!16290)

(assert (=> mapNonEmpty!53126 (= (arr!41394 _values!1445) (store mapRest!53126 mapKey!53126 mapValue!53126))))

(declare-fun b!1292481 () Bool)

(declare-fun e!737701 () Bool)

(declare-fun tp_is_empty!34377 () Bool)

(assert (=> b!1292481 (= e!737701 tp_is_empty!34377)))

(declare-fun b!1292482 () Bool)

(declare-fun res!858782 () Bool)

(declare-fun e!737704 () Bool)

(assert (=> b!1292482 (=> (not res!858782) (not e!737704))))

(declare-datatypes ((array!85788 0))(
  ( (array!85789 (arr!41395 (Array (_ BitVec 32) (_ BitVec 64))) (size!41945 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85788)

(declare-datatypes ((List!29362 0))(
  ( (Nil!29359) (Cons!29358 (h!30567 (_ BitVec 64)) (t!42926 List!29362)) )
))
(declare-fun arrayNoDuplicates!0 (array!85788 (_ BitVec 32) List!29362) Bool)

(assert (=> b!1292482 (= res!858782 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29359))))

(declare-fun b!1292483 () Bool)

(declare-fun res!858785 () Bool)

(assert (=> b!1292483 (=> (not res!858785) (not e!737704))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85788 (_ BitVec 32)) Bool)

(assert (=> b!1292483 (= res!858785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292485 () Bool)

(assert (=> b!1292485 (= e!737704 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22210 0))(
  ( (tuple2!22211 (_1!11116 (_ BitVec 64)) (_2!11116 V!50939)) )
))
(declare-datatypes ((List!29363 0))(
  ( (Nil!29360) (Cons!29359 (h!30568 tuple2!22210) (t!42927 List!29363)) )
))
(declare-datatypes ((ListLongMap!19867 0))(
  ( (ListLongMap!19868 (toList!9949 List!29363)) )
))
(declare-fun contains!8067 (ListLongMap!19867 (_ BitVec 64)) Bool)

(assert (=> b!1292485 (not (contains!8067 (ListLongMap!19868 Nil!29360) k0!1205))))

(declare-datatypes ((Unit!42804 0))(
  ( (Unit!42805) )
))
(declare-fun lt!579341 () Unit!42804)

(declare-fun emptyContainsNothing!124 ((_ BitVec 64)) Unit!42804)

(assert (=> b!1292485 (= lt!579341 (emptyContainsNothing!124 k0!1205))))

(declare-fun mapIsEmpty!53126 () Bool)

(assert (=> mapIsEmpty!53126 mapRes!53126))

(declare-fun b!1292486 () Bool)

(assert (=> b!1292486 (= e!737702 tp_is_empty!34377)))

(declare-fun b!1292487 () Bool)

(declare-fun res!858789 () Bool)

(assert (=> b!1292487 (=> (not res!858789) (not e!737704))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292487 (= res!858789 (and (= (size!41944 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41945 _keys!1741) (size!41944 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292488 () Bool)

(declare-fun res!858783 () Bool)

(assert (=> b!1292488 (=> (not res!858783) (not e!737704))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1292488 (= res!858783 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41945 _keys!1741))))))

(declare-fun b!1292489 () Bool)

(declare-fun res!858786 () Bool)

(assert (=> b!1292489 (=> (not res!858786) (not e!737704))))

(assert (=> b!1292489 (= res!858786 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41945 _keys!1741))))))

(declare-fun b!1292490 () Bool)

(declare-fun res!858784 () Bool)

(assert (=> b!1292490 (=> (not res!858784) (not e!737704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292490 (= res!858784 (not (validKeyInArray!0 (select (arr!41395 _keys!1741) from!2144))))))

(declare-fun b!1292491 () Bool)

(declare-fun res!858787 () Bool)

(assert (=> b!1292491 (=> (not res!858787) (not e!737704))))

(declare-fun minValue!1387 () V!50939)

(declare-fun zeroValue!1387 () V!50939)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4995 (array!85788 array!85786 (_ BitVec 32) (_ BitVec 32) V!50939 V!50939 (_ BitVec 32) Int) ListLongMap!19867)

(assert (=> b!1292491 (= res!858787 (contains!8067 (getCurrentListMap!4995 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1292484 () Bool)

(declare-fun e!737703 () Bool)

(assert (=> b!1292484 (= e!737703 (and e!737701 mapRes!53126))))

(declare-fun condMapEmpty!53126 () Bool)

(declare-fun mapDefault!53126 () ValueCell!16290)

(assert (=> b!1292484 (= condMapEmpty!53126 (= (arr!41394 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16290)) mapDefault!53126)))))

(declare-fun res!858788 () Bool)

(assert (=> start!109248 (=> (not res!858788) (not e!737704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109248 (= res!858788 (validMask!0 mask!2175))))

(assert (=> start!109248 e!737704))

(assert (=> start!109248 tp_is_empty!34377))

(assert (=> start!109248 true))

(declare-fun array_inv!31363 (array!85786) Bool)

(assert (=> start!109248 (and (array_inv!31363 _values!1445) e!737703)))

(declare-fun array_inv!31364 (array!85788) Bool)

(assert (=> start!109248 (array_inv!31364 _keys!1741)))

(assert (=> start!109248 tp!101330))

(assert (= (and start!109248 res!858788) b!1292487))

(assert (= (and b!1292487 res!858789) b!1292483))

(assert (= (and b!1292483 res!858785) b!1292482))

(assert (= (and b!1292482 res!858782) b!1292488))

(assert (= (and b!1292488 res!858783) b!1292491))

(assert (= (and b!1292491 res!858787) b!1292489))

(assert (= (and b!1292489 res!858786) b!1292490))

(assert (= (and b!1292490 res!858784) b!1292485))

(assert (= (and b!1292484 condMapEmpty!53126) mapIsEmpty!53126))

(assert (= (and b!1292484 (not condMapEmpty!53126)) mapNonEmpty!53126))

(get-info :version)

(assert (= (and mapNonEmpty!53126 ((_ is ValueCellFull!16290) mapValue!53126)) b!1292486))

(assert (= (and b!1292484 ((_ is ValueCellFull!16290) mapDefault!53126)) b!1292481))

(assert (= start!109248 b!1292484))

(declare-fun m!1185023 () Bool)

(assert (=> mapNonEmpty!53126 m!1185023))

(declare-fun m!1185025 () Bool)

(assert (=> b!1292482 m!1185025))

(declare-fun m!1185027 () Bool)

(assert (=> b!1292490 m!1185027))

(assert (=> b!1292490 m!1185027))

(declare-fun m!1185029 () Bool)

(assert (=> b!1292490 m!1185029))

(declare-fun m!1185031 () Bool)

(assert (=> b!1292491 m!1185031))

(assert (=> b!1292491 m!1185031))

(declare-fun m!1185033 () Bool)

(assert (=> b!1292491 m!1185033))

(declare-fun m!1185035 () Bool)

(assert (=> b!1292483 m!1185035))

(declare-fun m!1185037 () Bool)

(assert (=> b!1292485 m!1185037))

(declare-fun m!1185039 () Bool)

(assert (=> b!1292485 m!1185039))

(declare-fun m!1185041 () Bool)

(assert (=> start!109248 m!1185041))

(declare-fun m!1185043 () Bool)

(assert (=> start!109248 m!1185043))

(declare-fun m!1185045 () Bool)

(assert (=> start!109248 m!1185045))

(check-sat (not b!1292490) (not b!1292491) (not b_next!28737) (not b!1292485) (not b!1292482) b_and!46827 (not start!109248) (not b!1292483) (not mapNonEmpty!53126) tp_is_empty!34377)
(check-sat b_and!46827 (not b_next!28737))
