; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111066 () Bool)

(assert start!111066)

(declare-fun b_free!29901 () Bool)

(declare-fun b_next!29901 () Bool)

(assert (=> start!111066 (= b_free!29901 (not b_next!29901))))

(declare-fun tp!105025 () Bool)

(declare-fun b_and!48109 () Bool)

(assert (=> start!111066 (= tp!105025 b_and!48109)))

(declare-fun b!1314986 () Bool)

(declare-fun e!750121 () Bool)

(declare-fun tp_is_empty!35631 () Bool)

(assert (=> b!1314986 (= e!750121 tp_is_empty!35631)))

(declare-fun b!1314988 () Bool)

(declare-fun res!872977 () Bool)

(declare-fun e!750120 () Bool)

(assert (=> b!1314988 (=> (not res!872977) (not e!750120))))

(declare-datatypes ((array!88226 0))(
  ( (array!88227 (arr!42593 (Array (_ BitVec 32) (_ BitVec 64))) (size!43143 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88226)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314988 (= res!872977 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43143 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314989 () Bool)

(assert (=> b!1314989 (= e!750120 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun lt!585861 () Bool)

(declare-datatypes ((V!52611 0))(
  ( (V!52612 (val!17890 Int)) )
))
(declare-fun minValue!1296 () V!52611)

(declare-datatypes ((ValueCell!16917 0))(
  ( (ValueCellFull!16917 (v!20517 V!52611)) (EmptyCell!16917) )
))
(declare-datatypes ((array!88228 0))(
  ( (array!88229 (arr!42594 (Array (_ BitVec 32) ValueCell!16917)) (size!43144 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88228)

(declare-fun zeroValue!1296 () V!52611)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23072 0))(
  ( (tuple2!23073 (_1!11547 (_ BitVec 64)) (_2!11547 V!52611)) )
))
(declare-datatypes ((List!30209 0))(
  ( (Nil!30206) (Cons!30205 (h!31414 tuple2!23072) (t!43815 List!30209)) )
))
(declare-datatypes ((ListLongMap!20729 0))(
  ( (ListLongMap!20730 (toList!10380 List!30209)) )
))
(declare-fun contains!8530 (ListLongMap!20729 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5393 (array!88226 array!88228 (_ BitVec 32) (_ BitVec 32) V!52611 V!52611 (_ BitVec 32) Int) ListLongMap!20729)

(assert (=> b!1314989 (= lt!585861 (contains!8530 (getCurrentListMap!5393 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!872978 () Bool)

(assert (=> start!111066 (=> (not res!872978) (not e!750120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111066 (= res!872978 (validMask!0 mask!2040))))

(assert (=> start!111066 e!750120))

(assert (=> start!111066 tp!105025))

(declare-fun array_inv!32167 (array!88226) Bool)

(assert (=> start!111066 (array_inv!32167 _keys!1628)))

(assert (=> start!111066 true))

(assert (=> start!111066 tp_is_empty!35631))

(declare-fun e!750119 () Bool)

(declare-fun array_inv!32168 (array!88228) Bool)

(assert (=> start!111066 (and (array_inv!32168 _values!1354) e!750119)))

(declare-fun b!1314987 () Bool)

(declare-fun res!872976 () Bool)

(assert (=> b!1314987 (=> (not res!872976) (not e!750120))))

(assert (=> b!1314987 (= res!872976 (and (= (size!43144 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43143 _keys!1628) (size!43144 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314990 () Bool)

(declare-fun e!750122 () Bool)

(assert (=> b!1314990 (= e!750122 tp_is_empty!35631)))

(declare-fun b!1314991 () Bool)

(declare-fun res!872975 () Bool)

(assert (=> b!1314991 (=> (not res!872975) (not e!750120))))

(declare-datatypes ((List!30210 0))(
  ( (Nil!30207) (Cons!30206 (h!31415 (_ BitVec 64)) (t!43816 List!30210)) )
))
(declare-fun arrayNoDuplicates!0 (array!88226 (_ BitVec 32) List!30210) Bool)

(assert (=> b!1314991 (= res!872975 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30207))))

(declare-fun b!1314992 () Bool)

(declare-fun res!872979 () Bool)

(assert (=> b!1314992 (=> (not res!872979) (not e!750120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88226 (_ BitVec 32)) Bool)

(assert (=> b!1314992 (= res!872979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314993 () Bool)

(declare-fun mapRes!55075 () Bool)

(assert (=> b!1314993 (= e!750119 (and e!750121 mapRes!55075))))

(declare-fun condMapEmpty!55075 () Bool)

(declare-fun mapDefault!55075 () ValueCell!16917)

(assert (=> b!1314993 (= condMapEmpty!55075 (= (arr!42594 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16917)) mapDefault!55075)))))

(declare-fun mapNonEmpty!55075 () Bool)

(declare-fun tp!105024 () Bool)

(assert (=> mapNonEmpty!55075 (= mapRes!55075 (and tp!105024 e!750122))))

(declare-fun mapRest!55075 () (Array (_ BitVec 32) ValueCell!16917))

(declare-fun mapKey!55075 () (_ BitVec 32))

(declare-fun mapValue!55075 () ValueCell!16917)

(assert (=> mapNonEmpty!55075 (= (arr!42594 _values!1354) (store mapRest!55075 mapKey!55075 mapValue!55075))))

(declare-fun mapIsEmpty!55075 () Bool)

(assert (=> mapIsEmpty!55075 mapRes!55075))

(assert (= (and start!111066 res!872978) b!1314987))

(assert (= (and b!1314987 res!872976) b!1314992))

(assert (= (and b!1314992 res!872979) b!1314991))

(assert (= (and b!1314991 res!872975) b!1314988))

(assert (= (and b!1314988 res!872977) b!1314989))

(assert (= (and b!1314993 condMapEmpty!55075) mapIsEmpty!55075))

(assert (= (and b!1314993 (not condMapEmpty!55075)) mapNonEmpty!55075))

(get-info :version)

(assert (= (and mapNonEmpty!55075 ((_ is ValueCellFull!16917) mapValue!55075)) b!1314990))

(assert (= (and b!1314993 ((_ is ValueCellFull!16917) mapDefault!55075)) b!1314986))

(assert (= start!111066 b!1314993))

(declare-fun m!1203325 () Bool)

(assert (=> mapNonEmpty!55075 m!1203325))

(declare-fun m!1203327 () Bool)

(assert (=> b!1314989 m!1203327))

(assert (=> b!1314989 m!1203327))

(declare-fun m!1203329 () Bool)

(assert (=> b!1314989 m!1203329))

(declare-fun m!1203331 () Bool)

(assert (=> start!111066 m!1203331))

(declare-fun m!1203333 () Bool)

(assert (=> start!111066 m!1203333))

(declare-fun m!1203335 () Bool)

(assert (=> start!111066 m!1203335))

(declare-fun m!1203337 () Bool)

(assert (=> b!1314991 m!1203337))

(declare-fun m!1203339 () Bool)

(assert (=> b!1314992 m!1203339))

(check-sat (not start!111066) b_and!48109 tp_is_empty!35631 (not b!1314991) (not b!1314992) (not b!1314989) (not mapNonEmpty!55075) (not b_next!29901))
(check-sat b_and!48109 (not b_next!29901))
