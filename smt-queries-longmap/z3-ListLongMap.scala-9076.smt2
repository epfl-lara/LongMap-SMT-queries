; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109242 () Bool)

(assert start!109242)

(declare-fun b_free!28731 () Bool)

(declare-fun b_next!28731 () Bool)

(assert (=> start!109242 (= b_free!28731 (not b_next!28731))))

(declare-fun tp!101312 () Bool)

(declare-fun b_and!46821 () Bool)

(assert (=> start!109242 (= tp!101312 b_and!46821)))

(declare-fun b!1292382 () Bool)

(declare-fun res!858717 () Bool)

(declare-fun e!737659 () Bool)

(assert (=> b!1292382 (=> (not res!858717) (not e!737659))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85774 0))(
  ( (array!85775 (arr!41388 (Array (_ BitVec 32) (_ BitVec 64))) (size!41938 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85774)

(assert (=> b!1292382 (= res!858717 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41938 _keys!1741))))))

(declare-fun b!1292383 () Bool)

(declare-fun res!858713 () Bool)

(assert (=> b!1292383 (=> (not res!858713) (not e!737659))))

(declare-datatypes ((List!29358 0))(
  ( (Nil!29355) (Cons!29354 (h!30563 (_ BitVec 64)) (t!42922 List!29358)) )
))
(declare-fun arrayNoDuplicates!0 (array!85774 (_ BitVec 32) List!29358) Bool)

(assert (=> b!1292383 (= res!858713 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29355))))

(declare-fun b!1292384 () Bool)

(declare-fun res!858715 () Bool)

(assert (=> b!1292384 (=> (not res!858715) (not e!737659))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85774 (_ BitVec 32)) Bool)

(assert (=> b!1292384 (= res!858715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292385 () Bool)

(declare-fun res!858710 () Bool)

(assert (=> b!1292385 (=> (not res!858710) (not e!737659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292385 (= res!858710 (not (validKeyInArray!0 (select (arr!41388 _keys!1741) from!2144))))))

(declare-fun res!858716 () Bool)

(assert (=> start!109242 (=> (not res!858716) (not e!737659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109242 (= res!858716 (validMask!0 mask!2175))))

(assert (=> start!109242 e!737659))

(declare-fun tp_is_empty!34371 () Bool)

(assert (=> start!109242 tp_is_empty!34371))

(assert (=> start!109242 true))

(declare-datatypes ((V!50931 0))(
  ( (V!50932 (val!17260 Int)) )
))
(declare-datatypes ((ValueCell!16287 0))(
  ( (ValueCellFull!16287 (v!19863 V!50931)) (EmptyCell!16287) )
))
(declare-datatypes ((array!85776 0))(
  ( (array!85777 (arr!41389 (Array (_ BitVec 32) ValueCell!16287)) (size!41939 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85776)

(declare-fun e!737660 () Bool)

(declare-fun array_inv!31361 (array!85776) Bool)

(assert (=> start!109242 (and (array_inv!31361 _values!1445) e!737660)))

(declare-fun array_inv!31362 (array!85774) Bool)

(assert (=> start!109242 (array_inv!31362 _keys!1741)))

(assert (=> start!109242 tp!101312))

(declare-fun b!1292386 () Bool)

(declare-fun e!737658 () Bool)

(declare-fun mapRes!53117 () Bool)

(assert (=> b!1292386 (= e!737660 (and e!737658 mapRes!53117))))

(declare-fun condMapEmpty!53117 () Bool)

(declare-fun mapDefault!53117 () ValueCell!16287)

(assert (=> b!1292386 (= condMapEmpty!53117 (= (arr!41389 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16287)) mapDefault!53117)))))

(declare-fun b!1292387 () Bool)

(declare-fun res!858714 () Bool)

(assert (=> b!1292387 (=> (not res!858714) (not e!737659))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292387 (= res!858714 (and (= (size!41939 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41938 _keys!1741) (size!41939 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292388 () Bool)

(declare-fun res!858711 () Bool)

(assert (=> b!1292388 (=> (not res!858711) (not e!737659))))

(declare-fun minValue!1387 () V!50931)

(declare-fun zeroValue!1387 () V!50931)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22206 0))(
  ( (tuple2!22207 (_1!11114 (_ BitVec 64)) (_2!11114 V!50931)) )
))
(declare-datatypes ((List!29359 0))(
  ( (Nil!29356) (Cons!29355 (h!30564 tuple2!22206) (t!42923 List!29359)) )
))
(declare-datatypes ((ListLongMap!19863 0))(
  ( (ListLongMap!19864 (toList!9947 List!29359)) )
))
(declare-fun contains!8065 (ListLongMap!19863 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4993 (array!85774 array!85776 (_ BitVec 32) (_ BitVec 32) V!50931 V!50931 (_ BitVec 32) Int) ListLongMap!19863)

(assert (=> b!1292388 (= res!858711 (contains!8065 (getCurrentListMap!4993 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1292389 () Bool)

(assert (=> b!1292389 (= e!737658 tp_is_empty!34371)))

(declare-fun mapNonEmpty!53117 () Bool)

(declare-fun tp!101311 () Bool)

(declare-fun e!737656 () Bool)

(assert (=> mapNonEmpty!53117 (= mapRes!53117 (and tp!101311 e!737656))))

(declare-fun mapRest!53117 () (Array (_ BitVec 32) ValueCell!16287))

(declare-fun mapValue!53117 () ValueCell!16287)

(declare-fun mapKey!53117 () (_ BitVec 32))

(assert (=> mapNonEmpty!53117 (= (arr!41389 _values!1445) (store mapRest!53117 mapKey!53117 mapValue!53117))))

(declare-fun b!1292390 () Bool)

(assert (=> b!1292390 (= e!737656 tp_is_empty!34371)))

(declare-fun b!1292391 () Bool)

(assert (=> b!1292391 (= e!737659 (not true))))

(assert (=> b!1292391 (not (contains!8065 (ListLongMap!19864 Nil!29356) k0!1205))))

(declare-datatypes ((Unit!42802 0))(
  ( (Unit!42803) )
))
(declare-fun lt!579332 () Unit!42802)

(declare-fun emptyContainsNothing!123 ((_ BitVec 64)) Unit!42802)

(assert (=> b!1292391 (= lt!579332 (emptyContainsNothing!123 k0!1205))))

(declare-fun mapIsEmpty!53117 () Bool)

(assert (=> mapIsEmpty!53117 mapRes!53117))

(declare-fun b!1292392 () Bool)

(declare-fun res!858712 () Bool)

(assert (=> b!1292392 (=> (not res!858712) (not e!737659))))

(assert (=> b!1292392 (= res!858712 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41938 _keys!1741))))))

(assert (= (and start!109242 res!858716) b!1292387))

(assert (= (and b!1292387 res!858714) b!1292384))

(assert (= (and b!1292384 res!858715) b!1292383))

(assert (= (and b!1292383 res!858713) b!1292392))

(assert (= (and b!1292392 res!858712) b!1292388))

(assert (= (and b!1292388 res!858711) b!1292382))

(assert (= (and b!1292382 res!858717) b!1292385))

(assert (= (and b!1292385 res!858710) b!1292391))

(assert (= (and b!1292386 condMapEmpty!53117) mapIsEmpty!53117))

(assert (= (and b!1292386 (not condMapEmpty!53117)) mapNonEmpty!53117))

(get-info :version)

(assert (= (and mapNonEmpty!53117 ((_ is ValueCellFull!16287) mapValue!53117)) b!1292390))

(assert (= (and b!1292386 ((_ is ValueCellFull!16287) mapDefault!53117)) b!1292389))

(assert (= start!109242 b!1292386))

(declare-fun m!1184951 () Bool)

(assert (=> b!1292383 m!1184951))

(declare-fun m!1184953 () Bool)

(assert (=> b!1292391 m!1184953))

(declare-fun m!1184955 () Bool)

(assert (=> b!1292391 m!1184955))

(declare-fun m!1184957 () Bool)

(assert (=> b!1292385 m!1184957))

(assert (=> b!1292385 m!1184957))

(declare-fun m!1184959 () Bool)

(assert (=> b!1292385 m!1184959))

(declare-fun m!1184961 () Bool)

(assert (=> mapNonEmpty!53117 m!1184961))

(declare-fun m!1184963 () Bool)

(assert (=> b!1292384 m!1184963))

(declare-fun m!1184965 () Bool)

(assert (=> b!1292388 m!1184965))

(assert (=> b!1292388 m!1184965))

(declare-fun m!1184967 () Bool)

(assert (=> b!1292388 m!1184967))

(declare-fun m!1184969 () Bool)

(assert (=> start!109242 m!1184969))

(declare-fun m!1184971 () Bool)

(assert (=> start!109242 m!1184971))

(declare-fun m!1184973 () Bool)

(assert (=> start!109242 m!1184973))

(check-sat tp_is_empty!34371 (not b!1292385) (not b!1292384) (not b!1292391) (not b!1292383) b_and!46821 (not b_next!28731) (not b!1292388) (not start!109242) (not mapNonEmpty!53117))
(check-sat b_and!46821 (not b_next!28731))
