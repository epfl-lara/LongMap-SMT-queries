; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111748 () Bool)

(assert start!111748)

(declare-fun b_free!30405 () Bool)

(declare-fun b_next!30405 () Bool)

(assert (=> start!111748 (= b_free!30405 (not b_next!30405))))

(declare-fun tp!106690 () Bool)

(declare-fun b_and!48943 () Bool)

(assert (=> start!111748 (= tp!106690 b_and!48943)))

(declare-fun mapNonEmpty!55985 () Bool)

(declare-fun mapRes!55985 () Bool)

(declare-fun tp!106691 () Bool)

(declare-fun e!754879 () Bool)

(assert (=> mapNonEmpty!55985 (= mapRes!55985 (and tp!106691 e!754879))))

(declare-datatypes ((V!53403 0))(
  ( (V!53404 (val!18187 Int)) )
))
(declare-datatypes ((ValueCell!17214 0))(
  ( (ValueCellFull!17214 (v!20817 V!53403)) (EmptyCell!17214) )
))
(declare-fun mapValue!55985 () ValueCell!17214)

(declare-datatypes ((array!89366 0))(
  ( (array!89367 (arr!43157 (Array (_ BitVec 32) ValueCell!17214)) (size!43707 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89366)

(declare-fun mapRest!55985 () (Array (_ BitVec 32) ValueCell!17214))

(declare-fun mapKey!55985 () (_ BitVec 32))

(assert (=> mapNonEmpty!55985 (= (arr!43157 _values!1337) (store mapRest!55985 mapKey!55985 mapValue!55985))))

(declare-fun res!878917 () Bool)

(declare-fun e!754876 () Bool)

(assert (=> start!111748 (=> (not res!878917) (not e!754876))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111748 (= res!878917 (validMask!0 mask!2019))))

(assert (=> start!111748 e!754876))

(declare-datatypes ((array!89368 0))(
  ( (array!89369 (arr!43158 (Array (_ BitVec 32) (_ BitVec 64))) (size!43708 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89368)

(declare-fun array_inv!32581 (array!89368) Bool)

(assert (=> start!111748 (array_inv!32581 _keys!1609)))

(assert (=> start!111748 true))

(declare-fun tp_is_empty!36225 () Bool)

(assert (=> start!111748 tp_is_empty!36225))

(declare-fun e!754877 () Bool)

(declare-fun array_inv!32582 (array!89366) Bool)

(assert (=> start!111748 (and (array_inv!32582 _values!1337) e!754877)))

(assert (=> start!111748 tp!106690))

(declare-fun mapIsEmpty!55985 () Bool)

(assert (=> mapIsEmpty!55985 mapRes!55985))

(declare-fun b!1324156 () Bool)

(assert (=> b!1324156 (= e!754879 tp_is_empty!36225)))

(declare-fun b!1324157 () Bool)

(declare-fun e!754875 () Bool)

(assert (=> b!1324157 (= e!754877 (and e!754875 mapRes!55985))))

(declare-fun condMapEmpty!55985 () Bool)

(declare-fun mapDefault!55985 () ValueCell!17214)

(assert (=> b!1324157 (= condMapEmpty!55985 (= (arr!43157 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17214)) mapDefault!55985)))))

(declare-fun b!1324158 () Bool)

(declare-fun res!878916 () Bool)

(assert (=> b!1324158 (=> (not res!878916) (not e!754876))))

(declare-datatypes ((List!30593 0))(
  ( (Nil!30590) (Cons!30589 (h!31798 (_ BitVec 64)) (t!44519 List!30593)) )
))
(declare-fun arrayNoDuplicates!0 (array!89368 (_ BitVec 32) List!30593) Bool)

(assert (=> b!1324158 (= res!878916 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30590))))

(declare-fun b!1324159 () Bool)

(assert (=> b!1324159 (= e!754876 false)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53403)

(declare-fun minValue!1279 () V!53403)

(declare-fun defaultEntry!1340 () Int)

(declare-fun lt!589440 () Bool)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(declare-datatypes ((tuple2!23452 0))(
  ( (tuple2!23453 (_1!11737 (_ BitVec 64)) (_2!11737 V!53403)) )
))
(declare-datatypes ((List!30594 0))(
  ( (Nil!30591) (Cons!30590 (h!31799 tuple2!23452) (t!44520 List!30594)) )
))
(declare-datatypes ((ListLongMap!21109 0))(
  ( (ListLongMap!21110 (toList!10570 List!30594)) )
))
(declare-fun contains!8725 (ListLongMap!21109 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5566 (array!89368 array!89366 (_ BitVec 32) (_ BitVec 32) V!53403 V!53403 (_ BitVec 32) Int) ListLongMap!21109)

(assert (=> b!1324159 (= lt!589440 (contains!8725 (getCurrentListMap!5566 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324160 () Bool)

(assert (=> b!1324160 (= e!754875 tp_is_empty!36225)))

(declare-fun b!1324161 () Bool)

(declare-fun res!878914 () Bool)

(assert (=> b!1324161 (=> (not res!878914) (not e!754876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89368 (_ BitVec 32)) Bool)

(assert (=> b!1324161 (= res!878914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324162 () Bool)

(declare-fun res!878918 () Bool)

(assert (=> b!1324162 (=> (not res!878918) (not e!754876))))

(assert (=> b!1324162 (= res!878918 (and (= (size!43707 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43708 _keys!1609) (size!43707 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324163 () Bool)

(declare-fun res!878915 () Bool)

(assert (=> b!1324163 (=> (not res!878915) (not e!754876))))

(assert (=> b!1324163 (= res!878915 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43708 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111748 res!878917) b!1324162))

(assert (= (and b!1324162 res!878918) b!1324161))

(assert (= (and b!1324161 res!878914) b!1324158))

(assert (= (and b!1324158 res!878916) b!1324163))

(assert (= (and b!1324163 res!878915) b!1324159))

(assert (= (and b!1324157 condMapEmpty!55985) mapIsEmpty!55985))

(assert (= (and b!1324157 (not condMapEmpty!55985)) mapNonEmpty!55985))

(get-info :version)

(assert (= (and mapNonEmpty!55985 ((_ is ValueCellFull!17214) mapValue!55985)) b!1324156))

(assert (= (and b!1324157 ((_ is ValueCellFull!17214) mapDefault!55985)) b!1324160))

(assert (= start!111748 b!1324157))

(declare-fun m!1213111 () Bool)

(assert (=> b!1324158 m!1213111))

(declare-fun m!1213113 () Bool)

(assert (=> b!1324161 m!1213113))

(declare-fun m!1213115 () Bool)

(assert (=> mapNonEmpty!55985 m!1213115))

(declare-fun m!1213117 () Bool)

(assert (=> b!1324159 m!1213117))

(assert (=> b!1324159 m!1213117))

(declare-fun m!1213119 () Bool)

(assert (=> b!1324159 m!1213119))

(declare-fun m!1213121 () Bool)

(assert (=> start!111748 m!1213121))

(declare-fun m!1213123 () Bool)

(assert (=> start!111748 m!1213123))

(declare-fun m!1213125 () Bool)

(assert (=> start!111748 m!1213125))

(check-sat (not mapNonEmpty!55985) (not b!1324161) (not b!1324158) b_and!48943 (not start!111748) (not b!1324159) (not b_next!30405) tp_is_empty!36225)
(check-sat b_and!48943 (not b_next!30405))
