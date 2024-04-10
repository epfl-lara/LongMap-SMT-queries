; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110928 () Bool)

(assert start!110928)

(declare-fun b_free!29763 () Bool)

(declare-fun b_next!29763 () Bool)

(assert (=> start!110928 (= b_free!29763 (not b_next!29763))))

(declare-fun tp!104610 () Bool)

(declare-fun b_and!47971 () Bool)

(assert (=> start!110928 (= tp!104610 b_and!47971)))

(declare-fun b!1313294 () Bool)

(declare-fun e!749083 () Bool)

(declare-fun e!749084 () Bool)

(declare-fun mapRes!54868 () Bool)

(assert (=> b!1313294 (= e!749083 (and e!749084 mapRes!54868))))

(declare-fun condMapEmpty!54868 () Bool)

(declare-datatypes ((V!52427 0))(
  ( (V!52428 (val!17821 Int)) )
))
(declare-datatypes ((ValueCell!16848 0))(
  ( (ValueCellFull!16848 (v!20448 V!52427)) (EmptyCell!16848) )
))
(declare-datatypes ((array!87968 0))(
  ( (array!87969 (arr!42464 (Array (_ BitVec 32) ValueCell!16848)) (size!43014 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87968)

(declare-fun mapDefault!54868 () ValueCell!16848)

(assert (=> b!1313294 (= condMapEmpty!54868 (= (arr!42464 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16848)) mapDefault!54868)))))

(declare-fun b!1313295 () Bool)

(declare-fun res!871908 () Bool)

(declare-fun e!749085 () Bool)

(assert (=> b!1313295 (=> (not res!871908) (not e!749085))))

(declare-datatypes ((array!87970 0))(
  ( (array!87971 (arr!42465 (Array (_ BitVec 32) (_ BitVec 64))) (size!43015 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87970)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313295 (= res!871908 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43015 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!871905 () Bool)

(assert (=> start!110928 (=> (not res!871905) (not e!749085))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110928 (= res!871905 (validMask!0 mask!2040))))

(assert (=> start!110928 e!749085))

(assert (=> start!110928 tp!104610))

(declare-fun array_inv!32079 (array!87970) Bool)

(assert (=> start!110928 (array_inv!32079 _keys!1628)))

(assert (=> start!110928 true))

(declare-fun tp_is_empty!35493 () Bool)

(assert (=> start!110928 tp_is_empty!35493))

(declare-fun array_inv!32080 (array!87968) Bool)

(assert (=> start!110928 (and (array_inv!32080 _values!1354) e!749083)))

(declare-fun mapNonEmpty!54868 () Bool)

(declare-fun tp!104611 () Bool)

(declare-fun e!749087 () Bool)

(assert (=> mapNonEmpty!54868 (= mapRes!54868 (and tp!104611 e!749087))))

(declare-fun mapKey!54868 () (_ BitVec 32))

(declare-fun mapRest!54868 () (Array (_ BitVec 32) ValueCell!16848))

(declare-fun mapValue!54868 () ValueCell!16848)

(assert (=> mapNonEmpty!54868 (= (arr!42464 _values!1354) (store mapRest!54868 mapKey!54868 mapValue!54868))))

(declare-fun b!1313296 () Bool)

(assert (=> b!1313296 (= e!749084 tp_is_empty!35493)))

(declare-fun b!1313297 () Bool)

(declare-fun res!871906 () Bool)

(assert (=> b!1313297 (=> (not res!871906) (not e!749085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87970 (_ BitVec 32)) Bool)

(assert (=> b!1313297 (= res!871906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313298 () Bool)

(assert (=> b!1313298 (= e!749085 false)))

(declare-fun lt!585654 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52427)

(declare-fun zeroValue!1296 () V!52427)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22976 0))(
  ( (tuple2!22977 (_1!11499 (_ BitVec 64)) (_2!11499 V!52427)) )
))
(declare-datatypes ((List!30113 0))(
  ( (Nil!30110) (Cons!30109 (h!31318 tuple2!22976) (t!43719 List!30113)) )
))
(declare-datatypes ((ListLongMap!20633 0))(
  ( (ListLongMap!20634 (toList!10332 List!30113)) )
))
(declare-fun contains!8482 (ListLongMap!20633 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5345 (array!87970 array!87968 (_ BitVec 32) (_ BitVec 32) V!52427 V!52427 (_ BitVec 32) Int) ListLongMap!20633)

(assert (=> b!1313298 (= lt!585654 (contains!8482 (getCurrentListMap!5345 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313299 () Bool)

(assert (=> b!1313299 (= e!749087 tp_is_empty!35493)))

(declare-fun mapIsEmpty!54868 () Bool)

(assert (=> mapIsEmpty!54868 mapRes!54868))

(declare-fun b!1313300 () Bool)

(declare-fun res!871904 () Bool)

(assert (=> b!1313300 (=> (not res!871904) (not e!749085))))

(assert (=> b!1313300 (= res!871904 (and (= (size!43014 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43015 _keys!1628) (size!43014 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313301 () Bool)

(declare-fun res!871907 () Bool)

(assert (=> b!1313301 (=> (not res!871907) (not e!749085))))

(declare-datatypes ((List!30114 0))(
  ( (Nil!30111) (Cons!30110 (h!31319 (_ BitVec 64)) (t!43720 List!30114)) )
))
(declare-fun arrayNoDuplicates!0 (array!87970 (_ BitVec 32) List!30114) Bool)

(assert (=> b!1313301 (= res!871907 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30111))))

(assert (= (and start!110928 res!871905) b!1313300))

(assert (= (and b!1313300 res!871904) b!1313297))

(assert (= (and b!1313297 res!871906) b!1313301))

(assert (= (and b!1313301 res!871907) b!1313295))

(assert (= (and b!1313295 res!871908) b!1313298))

(assert (= (and b!1313294 condMapEmpty!54868) mapIsEmpty!54868))

(assert (= (and b!1313294 (not condMapEmpty!54868)) mapNonEmpty!54868))

(get-info :version)

(assert (= (and mapNonEmpty!54868 ((_ is ValueCellFull!16848) mapValue!54868)) b!1313299))

(assert (= (and b!1313294 ((_ is ValueCellFull!16848) mapDefault!54868)) b!1313296))

(assert (= start!110928 b!1313294))

(declare-fun m!1202191 () Bool)

(assert (=> b!1313301 m!1202191))

(declare-fun m!1202193 () Bool)

(assert (=> mapNonEmpty!54868 m!1202193))

(declare-fun m!1202195 () Bool)

(assert (=> b!1313297 m!1202195))

(declare-fun m!1202197 () Bool)

(assert (=> b!1313298 m!1202197))

(assert (=> b!1313298 m!1202197))

(declare-fun m!1202199 () Bool)

(assert (=> b!1313298 m!1202199))

(declare-fun m!1202201 () Bool)

(assert (=> start!110928 m!1202201))

(declare-fun m!1202203 () Bool)

(assert (=> start!110928 m!1202203))

(declare-fun m!1202205 () Bool)

(assert (=> start!110928 m!1202205))

(check-sat (not start!110928) b_and!47971 (not b!1313301) (not b!1313297) tp_is_empty!35493 (not b!1313298) (not b_next!29763) (not mapNonEmpty!54868))
(check-sat b_and!47971 (not b_next!29763))
