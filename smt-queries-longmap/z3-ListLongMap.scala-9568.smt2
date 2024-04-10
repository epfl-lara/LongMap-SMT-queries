; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113272 () Bool)

(assert start!113272)

(declare-fun b_free!31323 () Bool)

(declare-fun b_next!31323 () Bool)

(assert (=> start!113272 (= b_free!31323 (not b_next!31323))))

(declare-fun tp!109774 () Bool)

(declare-fun b_and!50545 () Bool)

(assert (=> start!113272 (= tp!109774 b_and!50545)))

(declare-fun b!1343967 () Bool)

(declare-fun e!764903 () Bool)

(declare-fun e!764899 () Bool)

(declare-fun mapRes!57691 () Bool)

(assert (=> b!1343967 (= e!764903 (and e!764899 mapRes!57691))))

(declare-fun condMapEmpty!57691 () Bool)

(declare-datatypes ((V!54867 0))(
  ( (V!54868 (val!18736 Int)) )
))
(declare-datatypes ((ValueCell!17763 0))(
  ( (ValueCellFull!17763 (v!21384 V!54867)) (EmptyCell!17763) )
))
(declare-datatypes ((array!91490 0))(
  ( (array!91491 (arr!44201 (Array (_ BitVec 32) ValueCell!17763)) (size!44751 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91490)

(declare-fun mapDefault!57691 () ValueCell!17763)

(assert (=> b!1343967 (= condMapEmpty!57691 (= (arr!44201 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17763)) mapDefault!57691)))))

(declare-fun b!1343968 () Bool)

(declare-fun tp_is_empty!37323 () Bool)

(assert (=> b!1343968 (= e!764899 tp_is_empty!37323)))

(declare-fun res!891705 () Bool)

(declare-fun e!764902 () Bool)

(assert (=> start!113272 (=> (not res!891705) (not e!764902))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113272 (= res!891705 (validMask!0 mask!1977))))

(assert (=> start!113272 e!764902))

(assert (=> start!113272 tp_is_empty!37323))

(assert (=> start!113272 true))

(declare-datatypes ((array!91492 0))(
  ( (array!91493 (arr!44202 (Array (_ BitVec 32) (_ BitVec 64))) (size!44752 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91492)

(declare-fun array_inv!33311 (array!91492) Bool)

(assert (=> start!113272 (array_inv!33311 _keys!1571)))

(declare-fun array_inv!33312 (array!91490) Bool)

(assert (=> start!113272 (and (array_inv!33312 _values!1303) e!764903)))

(assert (=> start!113272 tp!109774))

(declare-fun b!1343969 () Bool)

(declare-fun res!891703 () Bool)

(assert (=> b!1343969 (=> (not res!891703) (not e!764902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91492 (_ BitVec 32)) Bool)

(assert (=> b!1343969 (= res!891703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343970 () Bool)

(declare-fun e!764901 () Bool)

(assert (=> b!1343970 (= e!764901 tp_is_empty!37323)))

(declare-fun b!1343971 () Bool)

(declare-fun res!891704 () Bool)

(assert (=> b!1343971 (=> (not res!891704) (not e!764902))))

(declare-datatypes ((List!31295 0))(
  ( (Nil!31292) (Cons!31291 (h!32500 (_ BitVec 64)) (t!45819 List!31295)) )
))
(declare-fun arrayNoDuplicates!0 (array!91492 (_ BitVec 32) List!31295) Bool)

(assert (=> b!1343971 (= res!891704 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31292))))

(declare-fun b!1343972 () Bool)

(declare-fun res!891702 () Bool)

(assert (=> b!1343972 (=> (not res!891702) (not e!764902))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1343972 (= res!891702 (and (= (size!44751 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44752 _keys!1571) (size!44751 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57691 () Bool)

(assert (=> mapIsEmpty!57691 mapRes!57691))

(declare-fun mapNonEmpty!57691 () Bool)

(declare-fun tp!109773 () Bool)

(assert (=> mapNonEmpty!57691 (= mapRes!57691 (and tp!109773 e!764901))))

(declare-fun mapKey!57691 () (_ BitVec 32))

(declare-fun mapValue!57691 () ValueCell!17763)

(declare-fun mapRest!57691 () (Array (_ BitVec 32) ValueCell!17763))

(assert (=> mapNonEmpty!57691 (= (arr!44201 _values!1303) (store mapRest!57691 mapKey!57691 mapValue!57691))))

(declare-fun b!1343973 () Bool)

(declare-fun res!891701 () Bool)

(assert (=> b!1343973 (=> (not res!891701) (not e!764902))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1343973 (= res!891701 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44752 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343974 () Bool)

(assert (=> b!1343974 (= e!764902 false)))

(declare-fun minValue!1245 () V!54867)

(declare-fun zeroValue!1245 () V!54867)

(declare-fun lt!595134 () Bool)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24140 0))(
  ( (tuple2!24141 (_1!12081 (_ BitVec 64)) (_2!12081 V!54867)) )
))
(declare-datatypes ((List!31296 0))(
  ( (Nil!31293) (Cons!31292 (h!32501 tuple2!24140) (t!45820 List!31296)) )
))
(declare-datatypes ((ListLongMap!21797 0))(
  ( (ListLongMap!21798 (toList!10914 List!31296)) )
))
(declare-fun contains!9090 (ListLongMap!21797 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5870 (array!91492 array!91490 (_ BitVec 32) (_ BitVec 32) V!54867 V!54867 (_ BitVec 32) Int) ListLongMap!21797)

(assert (=> b!1343974 (= lt!595134 (contains!9090 (getCurrentListMap!5870 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(assert (= (and start!113272 res!891705) b!1343972))

(assert (= (and b!1343972 res!891702) b!1343969))

(assert (= (and b!1343969 res!891703) b!1343971))

(assert (= (and b!1343971 res!891704) b!1343973))

(assert (= (and b!1343973 res!891701) b!1343974))

(assert (= (and b!1343967 condMapEmpty!57691) mapIsEmpty!57691))

(assert (= (and b!1343967 (not condMapEmpty!57691)) mapNonEmpty!57691))

(get-info :version)

(assert (= (and mapNonEmpty!57691 ((_ is ValueCellFull!17763) mapValue!57691)) b!1343970))

(assert (= (and b!1343967 ((_ is ValueCellFull!17763) mapDefault!57691)) b!1343968))

(assert (= start!113272 b!1343967))

(declare-fun m!1231727 () Bool)

(assert (=> b!1343969 m!1231727))

(declare-fun m!1231729 () Bool)

(assert (=> b!1343971 m!1231729))

(declare-fun m!1231731 () Bool)

(assert (=> b!1343974 m!1231731))

(assert (=> b!1343974 m!1231731))

(declare-fun m!1231733 () Bool)

(assert (=> b!1343974 m!1231733))

(declare-fun m!1231735 () Bool)

(assert (=> mapNonEmpty!57691 m!1231735))

(declare-fun m!1231737 () Bool)

(assert (=> start!113272 m!1231737))

(declare-fun m!1231739 () Bool)

(assert (=> start!113272 m!1231739))

(declare-fun m!1231741 () Bool)

(assert (=> start!113272 m!1231741))

(check-sat (not mapNonEmpty!57691) (not b!1343974) (not b!1343971) (not b!1343969) tp_is_empty!37323 b_and!50545 (not start!113272) (not b_next!31323))
(check-sat b_and!50545 (not b_next!31323))
