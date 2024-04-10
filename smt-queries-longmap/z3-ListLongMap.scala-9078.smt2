; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109254 () Bool)

(assert start!109254)

(declare-fun b_free!28743 () Bool)

(declare-fun b_next!28743 () Bool)

(assert (=> start!109254 (= b_free!28743 (not b_next!28743))))

(declare-fun tp!101348 () Bool)

(declare-fun b_and!46833 () Bool)

(assert (=> start!109254 (= tp!101348 b_and!46833)))

(declare-fun res!858858 () Bool)

(declare-fun e!737749 () Bool)

(assert (=> start!109254 (=> (not res!858858) (not e!737749))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109254 (= res!858858 (validMask!0 mask!2175))))

(assert (=> start!109254 e!737749))

(declare-fun tp_is_empty!34383 () Bool)

(assert (=> start!109254 tp_is_empty!34383))

(assert (=> start!109254 true))

(declare-datatypes ((V!50947 0))(
  ( (V!50948 (val!17266 Int)) )
))
(declare-datatypes ((ValueCell!16293 0))(
  ( (ValueCellFull!16293 (v!19869 V!50947)) (EmptyCell!16293) )
))
(declare-datatypes ((array!85798 0))(
  ( (array!85799 (arr!41400 (Array (_ BitVec 32) ValueCell!16293)) (size!41950 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85798)

(declare-fun e!737746 () Bool)

(declare-fun array_inv!31365 (array!85798) Bool)

(assert (=> start!109254 (and (array_inv!31365 _values!1445) e!737746)))

(declare-datatypes ((array!85800 0))(
  ( (array!85801 (arr!41401 (Array (_ BitVec 32) (_ BitVec 64))) (size!41951 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85800)

(declare-fun array_inv!31366 (array!85800) Bool)

(assert (=> start!109254 (array_inv!31366 _keys!1741)))

(assert (=> start!109254 tp!101348))

(declare-fun b!1292580 () Bool)

(declare-fun res!858856 () Bool)

(assert (=> b!1292580 (=> (not res!858856) (not e!737749))))

(declare-datatypes ((List!29367 0))(
  ( (Nil!29364) (Cons!29363 (h!30572 (_ BitVec 64)) (t!42931 List!29367)) )
))
(declare-fun arrayNoDuplicates!0 (array!85800 (_ BitVec 32) List!29367) Bool)

(assert (=> b!1292580 (= res!858856 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29364))))

(declare-fun b!1292581 () Bool)

(declare-fun e!737750 () Bool)

(assert (=> b!1292581 (= e!737750 tp_is_empty!34383)))

(declare-fun mapIsEmpty!53135 () Bool)

(declare-fun mapRes!53135 () Bool)

(assert (=> mapIsEmpty!53135 mapRes!53135))

(declare-fun b!1292582 () Bool)

(declare-fun res!858857 () Bool)

(assert (=> b!1292582 (=> (not res!858857) (not e!737749))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1292582 (= res!858857 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41951 _keys!1741))))))

(declare-fun b!1292583 () Bool)

(declare-fun res!858861 () Bool)

(assert (=> b!1292583 (=> (not res!858861) (not e!737749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85800 (_ BitVec 32)) Bool)

(assert (=> b!1292583 (= res!858861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292584 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292584 (= e!737749 (not (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle from!2144 (size!41951 _keys!1741)))))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22216 0))(
  ( (tuple2!22217 (_1!11119 (_ BitVec 64)) (_2!11119 V!50947)) )
))
(declare-datatypes ((List!29368 0))(
  ( (Nil!29365) (Cons!29364 (h!30573 tuple2!22216) (t!42932 List!29368)) )
))
(declare-datatypes ((ListLongMap!19873 0))(
  ( (ListLongMap!19874 (toList!9952 List!29368)) )
))
(declare-fun contains!8070 (ListLongMap!19873 (_ BitVec 64)) Bool)

(assert (=> b!1292584 (not (contains!8070 (ListLongMap!19874 Nil!29365) k0!1205))))

(declare-datatypes ((Unit!42806 0))(
  ( (Unit!42807) )
))
(declare-fun lt!579350 () Unit!42806)

(declare-fun emptyContainsNothing!125 ((_ BitVec 64)) Unit!42806)

(assert (=> b!1292584 (= lt!579350 (emptyContainsNothing!125 k0!1205))))

(declare-fun b!1292585 () Bool)

(declare-fun res!858854 () Bool)

(assert (=> b!1292585 (=> (not res!858854) (not e!737749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292585 (= res!858854 (not (validKeyInArray!0 (select (arr!41401 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!53135 () Bool)

(declare-fun tp!101347 () Bool)

(declare-fun e!737748 () Bool)

(assert (=> mapNonEmpty!53135 (= mapRes!53135 (and tp!101347 e!737748))))

(declare-fun mapValue!53135 () ValueCell!16293)

(declare-fun mapRest!53135 () (Array (_ BitVec 32) ValueCell!16293))

(declare-fun mapKey!53135 () (_ BitVec 32))

(assert (=> mapNonEmpty!53135 (= (arr!41400 _values!1445) (store mapRest!53135 mapKey!53135 mapValue!53135))))

(declare-fun b!1292586 () Bool)

(assert (=> b!1292586 (= e!737748 tp_is_empty!34383)))

(declare-fun b!1292587 () Bool)

(declare-fun res!858859 () Bool)

(assert (=> b!1292587 (=> (not res!858859) (not e!737749))))

(assert (=> b!1292587 (= res!858859 (and (= (size!41950 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41951 _keys!1741) (size!41950 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292588 () Bool)

(assert (=> b!1292588 (= e!737746 (and e!737750 mapRes!53135))))

(declare-fun condMapEmpty!53135 () Bool)

(declare-fun mapDefault!53135 () ValueCell!16293)

(assert (=> b!1292588 (= condMapEmpty!53135 (= (arr!41400 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16293)) mapDefault!53135)))))

(declare-fun b!1292589 () Bool)

(declare-fun res!858860 () Bool)

(assert (=> b!1292589 (=> (not res!858860) (not e!737749))))

(assert (=> b!1292589 (= res!858860 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41951 _keys!1741))))))

(declare-fun b!1292590 () Bool)

(declare-fun res!858855 () Bool)

(assert (=> b!1292590 (=> (not res!858855) (not e!737749))))

(declare-fun minValue!1387 () V!50947)

(declare-fun zeroValue!1387 () V!50947)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4998 (array!85800 array!85798 (_ BitVec 32) (_ BitVec 32) V!50947 V!50947 (_ BitVec 32) Int) ListLongMap!19873)

(assert (=> b!1292590 (= res!858855 (contains!8070 (getCurrentListMap!4998 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109254 res!858858) b!1292587))

(assert (= (and b!1292587 res!858859) b!1292583))

(assert (= (and b!1292583 res!858861) b!1292580))

(assert (= (and b!1292580 res!858856) b!1292582))

(assert (= (and b!1292582 res!858857) b!1292590))

(assert (= (and b!1292590 res!858855) b!1292589))

(assert (= (and b!1292589 res!858860) b!1292585))

(assert (= (and b!1292585 res!858854) b!1292584))

(assert (= (and b!1292588 condMapEmpty!53135) mapIsEmpty!53135))

(assert (= (and b!1292588 (not condMapEmpty!53135)) mapNonEmpty!53135))

(get-info :version)

(assert (= (and mapNonEmpty!53135 ((_ is ValueCellFull!16293) mapValue!53135)) b!1292586))

(assert (= (and b!1292588 ((_ is ValueCellFull!16293) mapDefault!53135)) b!1292581))

(assert (= start!109254 b!1292588))

(declare-fun m!1185095 () Bool)

(assert (=> mapNonEmpty!53135 m!1185095))

(declare-fun m!1185097 () Bool)

(assert (=> b!1292583 m!1185097))

(declare-fun m!1185099 () Bool)

(assert (=> b!1292580 m!1185099))

(declare-fun m!1185101 () Bool)

(assert (=> b!1292590 m!1185101))

(assert (=> b!1292590 m!1185101))

(declare-fun m!1185103 () Bool)

(assert (=> b!1292590 m!1185103))

(declare-fun m!1185105 () Bool)

(assert (=> start!109254 m!1185105))

(declare-fun m!1185107 () Bool)

(assert (=> start!109254 m!1185107))

(declare-fun m!1185109 () Bool)

(assert (=> start!109254 m!1185109))

(declare-fun m!1185111 () Bool)

(assert (=> b!1292584 m!1185111))

(declare-fun m!1185113 () Bool)

(assert (=> b!1292584 m!1185113))

(declare-fun m!1185115 () Bool)

(assert (=> b!1292585 m!1185115))

(assert (=> b!1292585 m!1185115))

(declare-fun m!1185117 () Bool)

(assert (=> b!1292585 m!1185117))

(check-sat (not b!1292585) (not b_next!28743) (not start!109254) tp_is_empty!34383 (not b!1292583) (not mapNonEmpty!53135) (not b!1292580) (not b!1292584) b_and!46833 (not b!1292590))
(check-sat b_and!46833 (not b_next!28743))
