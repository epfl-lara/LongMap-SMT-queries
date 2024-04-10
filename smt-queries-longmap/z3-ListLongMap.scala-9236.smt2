; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110766 () Bool)

(assert start!110766)

(declare-fun b_free!29601 () Bool)

(declare-fun b_next!29601 () Bool)

(assert (=> start!110766 (= b_free!29601 (not b_next!29601))))

(declare-fun tp!104125 () Bool)

(declare-fun b_and!47809 () Bool)

(assert (=> start!110766 (= tp!104125 b_and!47809)))

(declare-fun b!1310999 () Bool)

(declare-fun e!747871 () Bool)

(declare-fun e!747872 () Bool)

(declare-fun mapRes!54625 () Bool)

(assert (=> b!1310999 (= e!747871 (and e!747872 mapRes!54625))))

(declare-fun condMapEmpty!54625 () Bool)

(declare-datatypes ((V!52211 0))(
  ( (V!52212 (val!17740 Int)) )
))
(declare-datatypes ((ValueCell!16767 0))(
  ( (ValueCellFull!16767 (v!20367 V!52211)) (EmptyCell!16767) )
))
(declare-datatypes ((array!87650 0))(
  ( (array!87651 (arr!42305 (Array (_ BitVec 32) ValueCell!16767)) (size!42855 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87650)

(declare-fun mapDefault!54625 () ValueCell!16767)

(assert (=> b!1310999 (= condMapEmpty!54625 (= (arr!42305 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16767)) mapDefault!54625)))))

(declare-fun b!1311000 () Bool)

(declare-fun e!747870 () Bool)

(assert (=> b!1311000 (= e!747870 false)))

(declare-datatypes ((array!87652 0))(
  ( (array!87653 (arr!42306 (Array (_ BitVec 32) (_ BitVec 64))) (size!42856 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87652)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52211)

(declare-fun zeroValue!1296 () V!52211)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585420 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!22860 0))(
  ( (tuple2!22861 (_1!11441 (_ BitVec 64)) (_2!11441 V!52211)) )
))
(declare-datatypes ((List!30000 0))(
  ( (Nil!29997) (Cons!29996 (h!31205 tuple2!22860) (t!43606 List!30000)) )
))
(declare-datatypes ((ListLongMap!20517 0))(
  ( (ListLongMap!20518 (toList!10274 List!30000)) )
))
(declare-fun contains!8424 (ListLongMap!20517 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5287 (array!87652 array!87650 (_ BitVec 32) (_ BitVec 32) V!52211 V!52211 (_ BitVec 32) Int) ListLongMap!20517)

(assert (=> b!1311000 (= lt!585420 (contains!8424 (getCurrentListMap!5287 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311001 () Bool)

(declare-fun res!870341 () Bool)

(assert (=> b!1311001 (=> (not res!870341) (not e!747870))))

(assert (=> b!1311001 (= res!870341 (and (= (size!42855 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42856 _keys!1628) (size!42855 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!870338 () Bool)

(assert (=> start!110766 (=> (not res!870338) (not e!747870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110766 (= res!870338 (validMask!0 mask!2040))))

(assert (=> start!110766 e!747870))

(assert (=> start!110766 tp!104125))

(declare-fun array_inv!31969 (array!87652) Bool)

(assert (=> start!110766 (array_inv!31969 _keys!1628)))

(assert (=> start!110766 true))

(declare-fun tp_is_empty!35331 () Bool)

(assert (=> start!110766 tp_is_empty!35331))

(declare-fun array_inv!31970 (array!87650) Bool)

(assert (=> start!110766 (and (array_inv!31970 _values!1354) e!747871)))

(declare-fun b!1311002 () Bool)

(declare-fun res!870342 () Bool)

(assert (=> b!1311002 (=> (not res!870342) (not e!747870))))

(declare-datatypes ((List!30001 0))(
  ( (Nil!29998) (Cons!29997 (h!31206 (_ BitVec 64)) (t!43607 List!30001)) )
))
(declare-fun arrayNoDuplicates!0 (array!87652 (_ BitVec 32) List!30001) Bool)

(assert (=> b!1311002 (= res!870342 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29998))))

(declare-fun b!1311003 () Bool)

(declare-fun e!747868 () Bool)

(assert (=> b!1311003 (= e!747868 tp_is_empty!35331)))

(declare-fun mapIsEmpty!54625 () Bool)

(assert (=> mapIsEmpty!54625 mapRes!54625))

(declare-fun mapNonEmpty!54625 () Bool)

(declare-fun tp!104124 () Bool)

(assert (=> mapNonEmpty!54625 (= mapRes!54625 (and tp!104124 e!747868))))

(declare-fun mapKey!54625 () (_ BitVec 32))

(declare-fun mapValue!54625 () ValueCell!16767)

(declare-fun mapRest!54625 () (Array (_ BitVec 32) ValueCell!16767))

(assert (=> mapNonEmpty!54625 (= (arr!42305 _values!1354) (store mapRest!54625 mapKey!54625 mapValue!54625))))

(declare-fun b!1311004 () Bool)

(declare-fun res!870340 () Bool)

(assert (=> b!1311004 (=> (not res!870340) (not e!747870))))

(assert (=> b!1311004 (= res!870340 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42856 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311005 () Bool)

(assert (=> b!1311005 (= e!747872 tp_is_empty!35331)))

(declare-fun b!1311006 () Bool)

(declare-fun res!870339 () Bool)

(assert (=> b!1311006 (=> (not res!870339) (not e!747870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87652 (_ BitVec 32)) Bool)

(assert (=> b!1311006 (= res!870339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110766 res!870338) b!1311001))

(assert (= (and b!1311001 res!870341) b!1311006))

(assert (= (and b!1311006 res!870339) b!1311002))

(assert (= (and b!1311002 res!870342) b!1311004))

(assert (= (and b!1311004 res!870340) b!1311000))

(assert (= (and b!1310999 condMapEmpty!54625) mapIsEmpty!54625))

(assert (= (and b!1310999 (not condMapEmpty!54625)) mapNonEmpty!54625))

(get-info :version)

(assert (= (and mapNonEmpty!54625 ((_ is ValueCellFull!16767) mapValue!54625)) b!1311003))

(assert (= (and b!1310999 ((_ is ValueCellFull!16767) mapDefault!54625)) b!1311005))

(assert (= start!110766 b!1310999))

(declare-fun m!1200613 () Bool)

(assert (=> b!1311002 m!1200613))

(declare-fun m!1200615 () Bool)

(assert (=> start!110766 m!1200615))

(declare-fun m!1200617 () Bool)

(assert (=> start!110766 m!1200617))

(declare-fun m!1200619 () Bool)

(assert (=> start!110766 m!1200619))

(declare-fun m!1200621 () Bool)

(assert (=> mapNonEmpty!54625 m!1200621))

(declare-fun m!1200623 () Bool)

(assert (=> b!1311006 m!1200623))

(declare-fun m!1200625 () Bool)

(assert (=> b!1311000 m!1200625))

(assert (=> b!1311000 m!1200625))

(declare-fun m!1200627 () Bool)

(assert (=> b!1311000 m!1200627))

(check-sat (not mapNonEmpty!54625) (not b!1311002) (not b!1311006) (not b_next!29601) b_and!47809 tp_is_empty!35331 (not b!1311000) (not start!110766))
(check-sat b_and!47809 (not b_next!29601))
