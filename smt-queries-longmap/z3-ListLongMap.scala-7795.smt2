; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97516 () Bool)

(assert start!97516)

(declare-fun res!743023 () Bool)

(declare-fun e!634643 () Bool)

(assert (=> start!97516 (=> (not res!743023) (not e!634643))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72403 0))(
  ( (array!72404 (arr!34854 (Array (_ BitVec 32) (_ BitVec 64))) (size!35390 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72403)

(assert (=> start!97516 (= res!743023 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35390 _keys!1208))))))

(assert (=> start!97516 e!634643))

(declare-fun array_inv!26796 (array!72403) Bool)

(assert (=> start!97516 (array_inv!26796 _keys!1208)))

(assert (=> start!97516 true))

(declare-datatypes ((V!42123 0))(
  ( (V!42124 (val!13930 Int)) )
))
(declare-datatypes ((ValueCell!13164 0))(
  ( (ValueCellFull!13164 (v!16563 V!42123)) (EmptyCell!13164) )
))
(declare-datatypes ((array!72405 0))(
  ( (array!72406 (arr!34855 (Array (_ BitVec 32) ValueCell!13164)) (size!35391 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72405)

(declare-fun e!634644 () Bool)

(declare-fun array_inv!26797 (array!72405) Bool)

(assert (=> start!97516 (and (array_inv!26797 _values!996) e!634644)))

(declare-fun b!1113300 () Bool)

(declare-fun res!743028 () Bool)

(assert (=> b!1113300 (=> (not res!743028) (not e!634643))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113300 (= res!743028 (validMask!0 mask!1564))))

(declare-fun b!1113301 () Bool)

(declare-fun res!743027 () Bool)

(assert (=> b!1113301 (=> (not res!743027) (not e!634643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72403 (_ BitVec 32)) Bool)

(assert (=> b!1113301 (= res!743027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113302 () Bool)

(declare-fun e!634642 () Bool)

(assert (=> b!1113302 (= e!634643 e!634642)))

(declare-fun res!743025 () Bool)

(assert (=> b!1113302 (=> (not res!743025) (not e!634642))))

(declare-fun lt!496652 () array!72403)

(assert (=> b!1113302 (= res!743025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496652 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1113302 (= lt!496652 (array!72404 (store (arr!34854 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35390 _keys!1208)))))

(declare-fun b!1113303 () Bool)

(declare-fun res!743026 () Bool)

(assert (=> b!1113303 (=> (not res!743026) (not e!634643))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113303 (= res!743026 (validKeyInArray!0 k0!934))))

(declare-fun b!1113304 () Bool)

(assert (=> b!1113304 (= e!634642 (not true))))

(declare-fun arrayContainsKey!0 (array!72403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113304 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36532 0))(
  ( (Unit!36533) )
))
(declare-fun lt!496651 () Unit!36532)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72403 (_ BitVec 64) (_ BitVec 32)) Unit!36532)

(assert (=> b!1113304 (= lt!496651 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!43438 () Bool)

(declare-fun mapRes!43438 () Bool)

(assert (=> mapIsEmpty!43438 mapRes!43438))

(declare-fun b!1113305 () Bool)

(declare-fun e!634647 () Bool)

(declare-fun tp_is_empty!27747 () Bool)

(assert (=> b!1113305 (= e!634647 tp_is_empty!27747)))

(declare-fun b!1113306 () Bool)

(declare-fun res!743029 () Bool)

(assert (=> b!1113306 (=> (not res!743029) (not e!634642))))

(declare-datatypes ((List!24308 0))(
  ( (Nil!24305) (Cons!24304 (h!25513 (_ BitVec 64)) (t!34789 List!24308)) )
))
(declare-fun arrayNoDuplicates!0 (array!72403 (_ BitVec 32) List!24308) Bool)

(assert (=> b!1113306 (= res!743029 (arrayNoDuplicates!0 lt!496652 #b00000000000000000000000000000000 Nil!24305))))

(declare-fun b!1113307 () Bool)

(assert (=> b!1113307 (= e!634644 (and e!634647 mapRes!43438))))

(declare-fun condMapEmpty!43438 () Bool)

(declare-fun mapDefault!43438 () ValueCell!13164)

(assert (=> b!1113307 (= condMapEmpty!43438 (= (arr!34855 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13164)) mapDefault!43438)))))

(declare-fun b!1113308 () Bool)

(declare-fun res!743031 () Bool)

(assert (=> b!1113308 (=> (not res!743031) (not e!634643))))

(assert (=> b!1113308 (= res!743031 (= (select (arr!34854 _keys!1208) i!673) k0!934))))

(declare-fun b!1113309 () Bool)

(declare-fun e!634645 () Bool)

(assert (=> b!1113309 (= e!634645 tp_is_empty!27747)))

(declare-fun b!1113310 () Bool)

(declare-fun res!743024 () Bool)

(assert (=> b!1113310 (=> (not res!743024) (not e!634643))))

(assert (=> b!1113310 (= res!743024 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24305))))

(declare-fun mapNonEmpty!43438 () Bool)

(declare-fun tp!82682 () Bool)

(assert (=> mapNonEmpty!43438 (= mapRes!43438 (and tp!82682 e!634645))))

(declare-fun mapValue!43438 () ValueCell!13164)

(declare-fun mapKey!43438 () (_ BitVec 32))

(declare-fun mapRest!43438 () (Array (_ BitVec 32) ValueCell!13164))

(assert (=> mapNonEmpty!43438 (= (arr!34855 _values!996) (store mapRest!43438 mapKey!43438 mapValue!43438))))

(declare-fun b!1113311 () Bool)

(declare-fun res!743030 () Bool)

(assert (=> b!1113311 (=> (not res!743030) (not e!634643))))

(assert (=> b!1113311 (= res!743030 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35390 _keys!1208))))))

(declare-fun b!1113312 () Bool)

(declare-fun res!743032 () Bool)

(assert (=> b!1113312 (=> (not res!743032) (not e!634643))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1113312 (= res!743032 (and (= (size!35391 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35390 _keys!1208) (size!35391 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97516 res!743023) b!1113300))

(assert (= (and b!1113300 res!743028) b!1113312))

(assert (= (and b!1113312 res!743032) b!1113301))

(assert (= (and b!1113301 res!743027) b!1113310))

(assert (= (and b!1113310 res!743024) b!1113311))

(assert (= (and b!1113311 res!743030) b!1113303))

(assert (= (and b!1113303 res!743026) b!1113308))

(assert (= (and b!1113308 res!743031) b!1113302))

(assert (= (and b!1113302 res!743025) b!1113306))

(assert (= (and b!1113306 res!743029) b!1113304))

(assert (= (and b!1113307 condMapEmpty!43438) mapIsEmpty!43438))

(assert (= (and b!1113307 (not condMapEmpty!43438)) mapNonEmpty!43438))

(get-info :version)

(assert (= (and mapNonEmpty!43438 ((_ is ValueCellFull!13164) mapValue!43438)) b!1113309))

(assert (= (and b!1113307 ((_ is ValueCellFull!13164) mapDefault!43438)) b!1113305))

(assert (= start!97516 b!1113307))

(declare-fun m!1030555 () Bool)

(assert (=> b!1113301 m!1030555))

(declare-fun m!1030557 () Bool)

(assert (=> b!1113300 m!1030557))

(declare-fun m!1030559 () Bool)

(assert (=> mapNonEmpty!43438 m!1030559))

(declare-fun m!1030561 () Bool)

(assert (=> b!1113310 m!1030561))

(declare-fun m!1030563 () Bool)

(assert (=> b!1113303 m!1030563))

(declare-fun m!1030565 () Bool)

(assert (=> start!97516 m!1030565))

(declare-fun m!1030567 () Bool)

(assert (=> start!97516 m!1030567))

(declare-fun m!1030569 () Bool)

(assert (=> b!1113308 m!1030569))

(declare-fun m!1030571 () Bool)

(assert (=> b!1113306 m!1030571))

(declare-fun m!1030573 () Bool)

(assert (=> b!1113304 m!1030573))

(declare-fun m!1030575 () Bool)

(assert (=> b!1113304 m!1030575))

(declare-fun m!1030577 () Bool)

(assert (=> b!1113302 m!1030577))

(declare-fun m!1030579 () Bool)

(assert (=> b!1113302 m!1030579))

(check-sat (not b!1113306) (not start!97516) (not b!1113310) (not b!1113303) (not mapNonEmpty!43438) (not b!1113300) (not b!1113304) tp_is_empty!27747 (not b!1113301) (not b!1113302))
(check-sat)
