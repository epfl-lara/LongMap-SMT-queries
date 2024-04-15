; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111398 () Bool)

(assert start!111398)

(declare-fun b_free!30055 () Bool)

(declare-fun b_next!30055 () Bool)

(assert (=> start!111398 (= b_free!30055 (not b_next!30055))))

(declare-fun tp!105641 () Bool)

(declare-fun b_and!48257 () Bool)

(assert (=> start!111398 (= tp!105641 b_and!48257)))

(declare-fun b!1318116 () Bool)

(declare-fun res!874808 () Bool)

(declare-fun e!752219 () Bool)

(assert (=> b!1318116 (=> (not res!874808) (not e!752219))))

(declare-datatypes ((array!88619 0))(
  ( (array!88620 (arr!42784 (Array (_ BitVec 32) (_ BitVec 64))) (size!43336 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88619)

(declare-datatypes ((List!30400 0))(
  ( (Nil!30397) (Cons!30396 (h!31605 (_ BitVec 64)) (t!44000 List!30400)) )
))
(declare-fun arrayNoDuplicates!0 (array!88619 (_ BitVec 32) List!30400) Bool)

(assert (=> b!1318116 (= res!874808 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30397))))

(declare-fun b!1318117 () Bool)

(declare-fun res!874815 () Bool)

(assert (=> b!1318117 (=> (not res!874815) (not e!752219))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88619 (_ BitVec 32)) Bool)

(assert (=> b!1318117 (= res!874815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318118 () Bool)

(declare-fun from!2000 () (_ BitVec 32))

(assert (=> b!1318118 (= e!752219 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000))))

(declare-fun b!1318119 () Bool)

(declare-fun e!752220 () Bool)

(declare-fun e!752218 () Bool)

(declare-fun mapRes!55460 () Bool)

(assert (=> b!1318119 (= e!752220 (and e!752218 mapRes!55460))))

(declare-fun condMapEmpty!55460 () Bool)

(declare-datatypes ((V!52937 0))(
  ( (V!52938 (val!18012 Int)) )
))
(declare-datatypes ((ValueCell!17039 0))(
  ( (ValueCellFull!17039 (v!20641 V!52937)) (EmptyCell!17039) )
))
(declare-datatypes ((array!88621 0))(
  ( (array!88622 (arr!42785 (Array (_ BitVec 32) ValueCell!17039)) (size!43337 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88621)

(declare-fun mapDefault!55460 () ValueCell!17039)

(assert (=> b!1318119 (= condMapEmpty!55460 (= (arr!42785 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17039)) mapDefault!55460)))))

(declare-fun b!1318120 () Bool)

(declare-fun res!874810 () Bool)

(assert (=> b!1318120 (=> (not res!874810) (not e!752219))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1318120 (= res!874810 (not (= (select (arr!42784 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1318121 () Bool)

(declare-fun res!874814 () Bool)

(assert (=> b!1318121 (=> (not res!874814) (not e!752219))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318121 (= res!874814 (validKeyInArray!0 (select (arr!42784 _keys!1609) from!2000)))))

(declare-fun b!1318122 () Bool)

(declare-fun res!874811 () Bool)

(assert (=> b!1318122 (=> (not res!874811) (not e!752219))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1318122 (= res!874811 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43336 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318123 () Bool)

(declare-fun tp_is_empty!35875 () Bool)

(assert (=> b!1318123 (= e!752218 tp_is_empty!35875)))

(declare-fun b!1318124 () Bool)

(declare-fun res!874809 () Bool)

(assert (=> b!1318124 (=> (not res!874809) (not e!752219))))

(assert (=> b!1318124 (= res!874809 (and (= (size!43337 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43336 _keys!1609) (size!43337 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!874813 () Bool)

(assert (=> start!111398 (=> (not res!874813) (not e!752219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111398 (= res!874813 (validMask!0 mask!2019))))

(assert (=> start!111398 e!752219))

(declare-fun array_inv!32491 (array!88619) Bool)

(assert (=> start!111398 (array_inv!32491 _keys!1609)))

(assert (=> start!111398 true))

(assert (=> start!111398 tp_is_empty!35875))

(declare-fun array_inv!32492 (array!88621) Bool)

(assert (=> start!111398 (and (array_inv!32492 _values!1337) e!752220)))

(assert (=> start!111398 tp!105641))

(declare-fun mapIsEmpty!55460 () Bool)

(assert (=> mapIsEmpty!55460 mapRes!55460))

(declare-fun mapNonEmpty!55460 () Bool)

(declare-fun tp!105642 () Bool)

(declare-fun e!752217 () Bool)

(assert (=> mapNonEmpty!55460 (= mapRes!55460 (and tp!105642 e!752217))))

(declare-fun mapValue!55460 () ValueCell!17039)

(declare-fun mapRest!55460 () (Array (_ BitVec 32) ValueCell!17039))

(declare-fun mapKey!55460 () (_ BitVec 32))

(assert (=> mapNonEmpty!55460 (= (arr!42785 _values!1337) (store mapRest!55460 mapKey!55460 mapValue!55460))))

(declare-fun b!1318125 () Bool)

(assert (=> b!1318125 (= e!752217 tp_is_empty!35875)))

(declare-fun b!1318126 () Bool)

(declare-fun res!874812 () Bool)

(assert (=> b!1318126 (=> (not res!874812) (not e!752219))))

(declare-fun zeroValue!1279 () V!52937)

(declare-fun defaultEntry!1340 () Int)

(declare-fun minValue!1279 () V!52937)

(declare-datatypes ((tuple2!23260 0))(
  ( (tuple2!23261 (_1!11641 (_ BitVec 64)) (_2!11641 V!52937)) )
))
(declare-datatypes ((List!30401 0))(
  ( (Nil!30398) (Cons!30397 (h!31606 tuple2!23260) (t!44001 List!30401)) )
))
(declare-datatypes ((ListLongMap!20917 0))(
  ( (ListLongMap!20918 (toList!10474 List!30401)) )
))
(declare-fun contains!8557 (ListLongMap!20917 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5369 (array!88619 array!88621 (_ BitVec 32) (_ BitVec 32) V!52937 V!52937 (_ BitVec 32) Int) ListLongMap!20917)

(assert (=> b!1318126 (= res!874812 (contains!8557 (getCurrentListMap!5369 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!111398 res!874813) b!1318124))

(assert (= (and b!1318124 res!874809) b!1318117))

(assert (= (and b!1318117 res!874815) b!1318116))

(assert (= (and b!1318116 res!874808) b!1318122))

(assert (= (and b!1318122 res!874811) b!1318126))

(assert (= (and b!1318126 res!874812) b!1318120))

(assert (= (and b!1318120 res!874810) b!1318121))

(assert (= (and b!1318121 res!874814) b!1318118))

(assert (= (and b!1318119 condMapEmpty!55460) mapIsEmpty!55460))

(assert (= (and b!1318119 (not condMapEmpty!55460)) mapNonEmpty!55460))

(get-info :version)

(assert (= (and mapNonEmpty!55460 ((_ is ValueCellFull!17039) mapValue!55460)) b!1318125))

(assert (= (and b!1318119 ((_ is ValueCellFull!17039) mapDefault!55460)) b!1318123))

(assert (= start!111398 b!1318119))

(declare-fun m!1205271 () Bool)

(assert (=> b!1318116 m!1205271))

(declare-fun m!1205273 () Bool)

(assert (=> b!1318121 m!1205273))

(assert (=> b!1318121 m!1205273))

(declare-fun m!1205275 () Bool)

(assert (=> b!1318121 m!1205275))

(declare-fun m!1205277 () Bool)

(assert (=> mapNonEmpty!55460 m!1205277))

(assert (=> b!1318120 m!1205273))

(declare-fun m!1205279 () Bool)

(assert (=> start!111398 m!1205279))

(declare-fun m!1205281 () Bool)

(assert (=> start!111398 m!1205281))

(declare-fun m!1205283 () Bool)

(assert (=> start!111398 m!1205283))

(declare-fun m!1205285 () Bool)

(assert (=> b!1318126 m!1205285))

(assert (=> b!1318126 m!1205285))

(declare-fun m!1205287 () Bool)

(assert (=> b!1318126 m!1205287))

(declare-fun m!1205289 () Bool)

(assert (=> b!1318117 m!1205289))

(check-sat (not b!1318121) (not start!111398) (not b!1318116) b_and!48257 (not b!1318126) (not b!1318117) tp_is_empty!35875 (not b_next!30055) (not mapNonEmpty!55460))
(check-sat b_and!48257 (not b_next!30055))
