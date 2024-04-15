; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111752 () Bool)

(assert start!111752)

(declare-fun b_free!30409 () Bool)

(declare-fun b_next!30409 () Bool)

(assert (=> start!111752 (= b_free!30409 (not b_next!30409))))

(declare-fun tp!106704 () Bool)

(declare-fun b_and!48929 () Bool)

(assert (=> start!111752 (= tp!106704 b_and!48929)))

(declare-fun b!1324134 () Bool)

(declare-fun res!878915 () Bool)

(declare-fun e!754876 () Bool)

(assert (=> b!1324134 (=> (not res!878915) (not e!754876))))

(declare-datatypes ((array!89301 0))(
  ( (array!89302 (arr!43125 (Array (_ BitVec 32) (_ BitVec 64))) (size!43677 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89301)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1324134 (= res!878915 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43677 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324135 () Bool)

(declare-fun e!754872 () Bool)

(declare-fun tp_is_empty!36229 () Bool)

(assert (=> b!1324135 (= e!754872 tp_is_empty!36229)))

(declare-fun b!1324136 () Bool)

(assert (=> b!1324136 (= e!754876 false)))

(declare-datatypes ((V!53409 0))(
  ( (V!53410 (val!18189 Int)) )
))
(declare-fun zeroValue!1279 () V!53409)

(declare-datatypes ((ValueCell!17216 0))(
  ( (ValueCellFull!17216 (v!20818 V!53409)) (EmptyCell!17216) )
))
(declare-datatypes ((array!89303 0))(
  ( (array!89304 (arr!43126 (Array (_ BitVec 32) ValueCell!17216)) (size!43678 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89303)

(declare-fun minValue!1279 () V!53409)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun lt!589260 () Bool)

(declare-datatypes ((tuple2!23520 0))(
  ( (tuple2!23521 (_1!11771 (_ BitVec 64)) (_2!11771 V!53409)) )
))
(declare-datatypes ((List!30651 0))(
  ( (Nil!30648) (Cons!30647 (h!31856 tuple2!23520) (t!44569 List!30651)) )
))
(declare-datatypes ((ListLongMap!21177 0))(
  ( (ListLongMap!21178 (toList!10604 List!30651)) )
))
(declare-fun contains!8687 (ListLongMap!21177 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5483 (array!89301 array!89303 (_ BitVec 32) (_ BitVec 32) V!53409 V!53409 (_ BitVec 32) Int) ListLongMap!21177)

(assert (=> b!1324136 (= lt!589260 (contains!8687 (getCurrentListMap!5483 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324137 () Bool)

(declare-fun res!878916 () Bool)

(assert (=> b!1324137 (=> (not res!878916) (not e!754876))))

(declare-datatypes ((List!30652 0))(
  ( (Nil!30649) (Cons!30648 (h!31857 (_ BitVec 64)) (t!44570 List!30652)) )
))
(declare-fun arrayNoDuplicates!0 (array!89301 (_ BitVec 32) List!30652) Bool)

(assert (=> b!1324137 (= res!878916 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30649))))

(declare-fun res!878917 () Bool)

(assert (=> start!111752 (=> (not res!878917) (not e!754876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111752 (= res!878917 (validMask!0 mask!2019))))

(assert (=> start!111752 e!754876))

(declare-fun array_inv!32741 (array!89301) Bool)

(assert (=> start!111752 (array_inv!32741 _keys!1609)))

(assert (=> start!111752 true))

(assert (=> start!111752 tp_is_empty!36229))

(declare-fun e!754873 () Bool)

(declare-fun array_inv!32742 (array!89303) Bool)

(assert (=> start!111752 (and (array_inv!32742 _values!1337) e!754873)))

(assert (=> start!111752 tp!106704))

(declare-fun mapIsEmpty!55991 () Bool)

(declare-fun mapRes!55991 () Bool)

(assert (=> mapIsEmpty!55991 mapRes!55991))

(declare-fun b!1324138 () Bool)

(declare-fun res!878919 () Bool)

(assert (=> b!1324138 (=> (not res!878919) (not e!754876))))

(assert (=> b!1324138 (= res!878919 (and (= (size!43678 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43677 _keys!1609) (size!43678 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324139 () Bool)

(assert (=> b!1324139 (= e!754873 (and e!754872 mapRes!55991))))

(declare-fun condMapEmpty!55991 () Bool)

(declare-fun mapDefault!55991 () ValueCell!17216)

(assert (=> b!1324139 (= condMapEmpty!55991 (= (arr!43126 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17216)) mapDefault!55991)))))

(declare-fun b!1324140 () Bool)

(declare-fun res!878918 () Bool)

(assert (=> b!1324140 (=> (not res!878918) (not e!754876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89301 (_ BitVec 32)) Bool)

(assert (=> b!1324140 (= res!878918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55991 () Bool)

(declare-fun tp!106703 () Bool)

(declare-fun e!754874 () Bool)

(assert (=> mapNonEmpty!55991 (= mapRes!55991 (and tp!106703 e!754874))))

(declare-fun mapValue!55991 () ValueCell!17216)

(declare-fun mapRest!55991 () (Array (_ BitVec 32) ValueCell!17216))

(declare-fun mapKey!55991 () (_ BitVec 32))

(assert (=> mapNonEmpty!55991 (= (arr!43126 _values!1337) (store mapRest!55991 mapKey!55991 mapValue!55991))))

(declare-fun b!1324141 () Bool)

(assert (=> b!1324141 (= e!754874 tp_is_empty!36229)))

(assert (= (and start!111752 res!878917) b!1324138))

(assert (= (and b!1324138 res!878919) b!1324140))

(assert (= (and b!1324140 res!878918) b!1324137))

(assert (= (and b!1324137 res!878916) b!1324134))

(assert (= (and b!1324134 res!878915) b!1324136))

(assert (= (and b!1324139 condMapEmpty!55991) mapIsEmpty!55991))

(assert (= (and b!1324139 (not condMapEmpty!55991)) mapNonEmpty!55991))

(get-info :version)

(assert (= (and mapNonEmpty!55991 ((_ is ValueCellFull!17216) mapValue!55991)) b!1324141))

(assert (= (and b!1324139 ((_ is ValueCellFull!17216) mapDefault!55991)) b!1324135))

(assert (= start!111752 b!1324139))

(declare-fun m!1212627 () Bool)

(assert (=> b!1324136 m!1212627))

(assert (=> b!1324136 m!1212627))

(declare-fun m!1212629 () Bool)

(assert (=> b!1324136 m!1212629))

(declare-fun m!1212631 () Bool)

(assert (=> b!1324137 m!1212631))

(declare-fun m!1212633 () Bool)

(assert (=> b!1324140 m!1212633))

(declare-fun m!1212635 () Bool)

(assert (=> start!111752 m!1212635))

(declare-fun m!1212637 () Bool)

(assert (=> start!111752 m!1212637))

(declare-fun m!1212639 () Bool)

(assert (=> start!111752 m!1212639))

(declare-fun m!1212641 () Bool)

(assert (=> mapNonEmpty!55991 m!1212641))

(check-sat (not start!111752) (not b!1324140) (not mapNonEmpty!55991) b_and!48929 tp_is_empty!36229 (not b_next!30409) (not b!1324136) (not b!1324137))
(check-sat b_and!48929 (not b_next!30409))
