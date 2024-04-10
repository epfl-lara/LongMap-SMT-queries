; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110628 () Bool)

(assert start!110628)

(declare-fun b_free!29463 () Bool)

(declare-fun b_next!29463 () Bool)

(assert (=> start!110628 (= b_free!29463 (not b_next!29463))))

(declare-fun tp!103711 () Bool)

(declare-fun b_and!47671 () Bool)

(assert (=> start!110628 (= tp!103711 b_and!47671)))

(declare-fun res!868983 () Bool)

(declare-fun e!746833 () Bool)

(assert (=> start!110628 (=> (not res!868983) (not e!746833))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110628 (= res!868983 (validMask!0 mask!2040))))

(assert (=> start!110628 e!746833))

(assert (=> start!110628 tp!103711))

(declare-datatypes ((array!87380 0))(
  ( (array!87381 (arr!42170 (Array (_ BitVec 32) (_ BitVec 64))) (size!42720 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87380)

(declare-fun array_inv!31873 (array!87380) Bool)

(assert (=> start!110628 (array_inv!31873 _keys!1628)))

(assert (=> start!110628 true))

(declare-fun tp_is_empty!35193 () Bool)

(assert (=> start!110628 tp_is_empty!35193))

(declare-datatypes ((V!52027 0))(
  ( (V!52028 (val!17671 Int)) )
))
(declare-datatypes ((ValueCell!16698 0))(
  ( (ValueCellFull!16698 (v!20298 V!52027)) (EmptyCell!16698) )
))
(declare-datatypes ((array!87382 0))(
  ( (array!87383 (arr!42171 (Array (_ BitVec 32) ValueCell!16698)) (size!42721 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87382)

(declare-fun e!746835 () Bool)

(declare-fun array_inv!31874 (array!87382) Bool)

(assert (=> start!110628 (and (array_inv!31874 _values!1354) e!746835)))

(declare-fun b!1309019 () Bool)

(declare-fun e!746836 () Bool)

(assert (=> b!1309019 (= e!746836 tp_is_empty!35193)))

(declare-fun b!1309020 () Bool)

(declare-fun res!868982 () Bool)

(assert (=> b!1309020 (=> (not res!868982) (not e!746833))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309020 (= res!868982 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42720 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309021 () Bool)

(declare-fun res!868979 () Bool)

(assert (=> b!1309021 (=> (not res!868979) (not e!746833))))

(declare-datatypes ((List!29897 0))(
  ( (Nil!29894) (Cons!29893 (h!31102 (_ BitVec 64)) (t!43503 List!29897)) )
))
(declare-fun arrayNoDuplicates!0 (array!87380 (_ BitVec 32) List!29897) Bool)

(assert (=> b!1309021 (= res!868979 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29894))))

(declare-fun b!1309022 () Bool)

(declare-fun res!868981 () Bool)

(assert (=> b!1309022 (=> (not res!868981) (not e!746833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87380 (_ BitVec 32)) Bool)

(assert (=> b!1309022 (= res!868981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54418 () Bool)

(declare-fun mapRes!54418 () Bool)

(assert (=> mapIsEmpty!54418 mapRes!54418))

(declare-fun b!1309023 () Bool)

(declare-fun e!746837 () Bool)

(assert (=> b!1309023 (= e!746835 (and e!746837 mapRes!54418))))

(declare-fun condMapEmpty!54418 () Bool)

(declare-fun mapDefault!54418 () ValueCell!16698)

(assert (=> b!1309023 (= condMapEmpty!54418 (= (arr!42171 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16698)) mapDefault!54418)))))

(declare-fun b!1309024 () Bool)

(assert (=> b!1309024 (= e!746833 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52027)

(declare-fun zeroValue!1296 () V!52027)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585213 () Bool)

(declare-datatypes ((tuple2!22756 0))(
  ( (tuple2!22757 (_1!11389 (_ BitVec 64)) (_2!11389 V!52027)) )
))
(declare-datatypes ((List!29898 0))(
  ( (Nil!29895) (Cons!29894 (h!31103 tuple2!22756) (t!43504 List!29898)) )
))
(declare-datatypes ((ListLongMap!20413 0))(
  ( (ListLongMap!20414 (toList!10222 List!29898)) )
))
(declare-fun contains!8372 (ListLongMap!20413 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5235 (array!87380 array!87382 (_ BitVec 32) (_ BitVec 32) V!52027 V!52027 (_ BitVec 32) Int) ListLongMap!20413)

(assert (=> b!1309024 (= lt!585213 (contains!8372 (getCurrentListMap!5235 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309025 () Bool)

(declare-fun res!868980 () Bool)

(assert (=> b!1309025 (=> (not res!868980) (not e!746833))))

(assert (=> b!1309025 (= res!868980 (and (= (size!42721 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42720 _keys!1628) (size!42721 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54418 () Bool)

(declare-fun tp!103710 () Bool)

(assert (=> mapNonEmpty!54418 (= mapRes!54418 (and tp!103710 e!746836))))

(declare-fun mapRest!54418 () (Array (_ BitVec 32) ValueCell!16698))

(declare-fun mapValue!54418 () ValueCell!16698)

(declare-fun mapKey!54418 () (_ BitVec 32))

(assert (=> mapNonEmpty!54418 (= (arr!42171 _values!1354) (store mapRest!54418 mapKey!54418 mapValue!54418))))

(declare-fun b!1309026 () Bool)

(assert (=> b!1309026 (= e!746837 tp_is_empty!35193)))

(assert (= (and start!110628 res!868983) b!1309025))

(assert (= (and b!1309025 res!868980) b!1309022))

(assert (= (and b!1309022 res!868981) b!1309021))

(assert (= (and b!1309021 res!868979) b!1309020))

(assert (= (and b!1309020 res!868982) b!1309024))

(assert (= (and b!1309023 condMapEmpty!54418) mapIsEmpty!54418))

(assert (= (and b!1309023 (not condMapEmpty!54418)) mapNonEmpty!54418))

(get-info :version)

(assert (= (and mapNonEmpty!54418 ((_ is ValueCellFull!16698) mapValue!54418)) b!1309019))

(assert (= (and b!1309023 ((_ is ValueCellFull!16698) mapDefault!54418)) b!1309026))

(assert (= start!110628 b!1309023))

(declare-fun m!1199239 () Bool)

(assert (=> mapNonEmpty!54418 m!1199239))

(declare-fun m!1199241 () Bool)

(assert (=> b!1309022 m!1199241))

(declare-fun m!1199243 () Bool)

(assert (=> start!110628 m!1199243))

(declare-fun m!1199245 () Bool)

(assert (=> start!110628 m!1199245))

(declare-fun m!1199247 () Bool)

(assert (=> start!110628 m!1199247))

(declare-fun m!1199249 () Bool)

(assert (=> b!1309021 m!1199249))

(declare-fun m!1199251 () Bool)

(assert (=> b!1309024 m!1199251))

(assert (=> b!1309024 m!1199251))

(declare-fun m!1199253 () Bool)

(assert (=> b!1309024 m!1199253))

(check-sat (not b!1309022) b_and!47671 (not b_next!29463) (not b!1309021) tp_is_empty!35193 (not b!1309024) (not start!110628) (not mapNonEmpty!54418))
(check-sat b_and!47671 (not b_next!29463))
