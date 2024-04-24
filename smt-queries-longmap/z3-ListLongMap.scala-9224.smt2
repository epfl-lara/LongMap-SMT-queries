; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110916 () Bool)

(assert start!110916)

(declare-fun b_free!29527 () Bool)

(declare-fun b_next!29527 () Bool)

(assert (=> start!110916 (= b_free!29527 (not b_next!29527))))

(declare-fun tp!103902 () Bool)

(declare-fun b_and!47737 () Bool)

(assert (=> start!110916 (= tp!103902 b_and!47737)))

(declare-fun b!1311130 () Bool)

(declare-fun e!748156 () Bool)

(declare-fun e!748158 () Bool)

(declare-fun mapRes!54514 () Bool)

(assert (=> b!1311130 (= e!748156 (and e!748158 mapRes!54514))))

(declare-fun condMapEmpty!54514 () Bool)

(declare-datatypes ((V!52113 0))(
  ( (V!52114 (val!17703 Int)) )
))
(declare-datatypes ((ValueCell!16730 0))(
  ( (ValueCellFull!16730 (v!20325 V!52113)) (EmptyCell!16730) )
))
(declare-datatypes ((array!87567 0))(
  ( (array!87568 (arr!42259 (Array (_ BitVec 32) ValueCell!16730)) (size!42810 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87567)

(declare-fun mapDefault!54514 () ValueCell!16730)

(assert (=> b!1311130 (= condMapEmpty!54514 (= (arr!42259 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16730)) mapDefault!54514)))))

(declare-fun b!1311131 () Bool)

(declare-fun res!870028 () Bool)

(declare-fun e!748157 () Bool)

(assert (=> b!1311131 (=> (not res!870028) (not e!748157))))

(declare-datatypes ((array!87569 0))(
  ( (array!87570 (arr!42260 (Array (_ BitVec 32) (_ BitVec 64))) (size!42811 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87569)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311131 (= res!870028 (validKeyInArray!0 (select (arr!42260 _keys!1628) from!2020)))))

(declare-fun b!1311132 () Bool)

(declare-fun tp_is_empty!35257 () Bool)

(assert (=> b!1311132 (= e!748158 tp_is_empty!35257)))

(declare-fun b!1311133 () Bool)

(declare-fun res!870023 () Bool)

(assert (=> b!1311133 (=> (not res!870023) (not e!748157))))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1311133 (= res!870023 (not (= (select (arr!42260 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1311135 () Bool)

(declare-fun res!870021 () Bool)

(assert (=> b!1311135 (=> (not res!870021) (not e!748157))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311135 (= res!870021 (and (= (size!42810 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42811 _keys!1628) (size!42810 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311136 () Bool)

(declare-fun res!870027 () Bool)

(assert (=> b!1311136 (=> (not res!870027) (not e!748157))))

(declare-datatypes ((List!30001 0))(
  ( (Nil!29998) (Cons!29997 (h!31215 (_ BitVec 64)) (t!43599 List!30001)) )
))
(declare-fun arrayNoDuplicates!0 (array!87569 (_ BitVec 32) List!30001) Bool)

(assert (=> b!1311136 (= res!870027 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29998))))

(declare-fun b!1311137 () Bool)

(assert (=> b!1311137 (= e!748157 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52113)

(declare-fun zeroValue!1296 () V!52113)

(declare-datatypes ((tuple2!22844 0))(
  ( (tuple2!22845 (_1!11433 (_ BitVec 64)) (_2!11433 V!52113)) )
))
(declare-datatypes ((List!30002 0))(
  ( (Nil!29999) (Cons!29998 (h!31216 tuple2!22844) (t!43600 List!30002)) )
))
(declare-datatypes ((ListLongMap!20509 0))(
  ( (ListLongMap!20510 (toList!10270 List!30002)) )
))
(declare-fun contains!8432 (ListLongMap!20509 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5274 (array!87569 array!87567 (_ BitVec 32) (_ BitVec 32) V!52113 V!52113 (_ BitVec 32) Int) ListLongMap!20509)

(assert (=> b!1311137 (contains!8432 (getCurrentListMap!5274 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43285 0))(
  ( (Unit!43286) )
))
(declare-fun lt!585785 () Unit!43285)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!4 (array!87569 array!87567 (_ BitVec 32) (_ BitVec 32) V!52113 V!52113 (_ BitVec 64) (_ BitVec 32) Int) Unit!43285)

(assert (=> b!1311137 (= lt!585785 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!4 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1311138 () Bool)

(declare-fun res!870022 () Bool)

(assert (=> b!1311138 (=> (not res!870022) (not e!748157))))

(assert (=> b!1311138 (= res!870022 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42811 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54514 () Bool)

(declare-fun tp!103903 () Bool)

(declare-fun e!748159 () Bool)

(assert (=> mapNonEmpty!54514 (= mapRes!54514 (and tp!103903 e!748159))))

(declare-fun mapRest!54514 () (Array (_ BitVec 32) ValueCell!16730))

(declare-fun mapValue!54514 () ValueCell!16730)

(declare-fun mapKey!54514 () (_ BitVec 32))

(assert (=> mapNonEmpty!54514 (= (arr!42259 _values!1354) (store mapRest!54514 mapKey!54514 mapValue!54514))))

(declare-fun res!870026 () Bool)

(assert (=> start!110916 (=> (not res!870026) (not e!748157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110916 (= res!870026 (validMask!0 mask!2040))))

(assert (=> start!110916 e!748157))

(assert (=> start!110916 tp!103902))

(declare-fun array_inv!32205 (array!87569) Bool)

(assert (=> start!110916 (array_inv!32205 _keys!1628)))

(assert (=> start!110916 true))

(assert (=> start!110916 tp_is_empty!35257))

(declare-fun array_inv!32206 (array!87567) Bool)

(assert (=> start!110916 (and (array_inv!32206 _values!1354) e!748156)))

(declare-fun b!1311134 () Bool)

(declare-fun res!870029 () Bool)

(assert (=> b!1311134 (=> (not res!870029) (not e!748157))))

(assert (=> b!1311134 (= res!870029 (contains!8432 (getCurrentListMap!5274 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311139 () Bool)

(declare-fun res!870025 () Bool)

(assert (=> b!1311139 (=> (not res!870025) (not e!748157))))

(assert (=> b!1311139 (= res!870025 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1311140 () Bool)

(declare-fun res!870024 () Bool)

(assert (=> b!1311140 (=> (not res!870024) (not e!748157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87569 (_ BitVec 32)) Bool)

(assert (=> b!1311140 (= res!870024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311141 () Bool)

(assert (=> b!1311141 (= e!748159 tp_is_empty!35257)))

(declare-fun mapIsEmpty!54514 () Bool)

(assert (=> mapIsEmpty!54514 mapRes!54514))

(assert (= (and start!110916 res!870026) b!1311135))

(assert (= (and b!1311135 res!870021) b!1311140))

(assert (= (and b!1311140 res!870024) b!1311136))

(assert (= (and b!1311136 res!870027) b!1311138))

(assert (= (and b!1311138 res!870022) b!1311134))

(assert (= (and b!1311134 res!870029) b!1311133))

(assert (= (and b!1311133 res!870023) b!1311131))

(assert (= (and b!1311131 res!870028) b!1311139))

(assert (= (and b!1311139 res!870025) b!1311137))

(assert (= (and b!1311130 condMapEmpty!54514) mapIsEmpty!54514))

(assert (= (and b!1311130 (not condMapEmpty!54514)) mapNonEmpty!54514))

(get-info :version)

(assert (= (and mapNonEmpty!54514 ((_ is ValueCellFull!16730) mapValue!54514)) b!1311141))

(assert (= (and b!1311130 ((_ is ValueCellFull!16730) mapDefault!54514)) b!1311132))

(assert (= start!110916 b!1311130))

(declare-fun m!1201379 () Bool)

(assert (=> b!1311140 m!1201379))

(declare-fun m!1201381 () Bool)

(assert (=> b!1311133 m!1201381))

(declare-fun m!1201383 () Bool)

(assert (=> b!1311134 m!1201383))

(assert (=> b!1311134 m!1201383))

(declare-fun m!1201385 () Bool)

(assert (=> b!1311134 m!1201385))

(declare-fun m!1201387 () Bool)

(assert (=> b!1311137 m!1201387))

(assert (=> b!1311137 m!1201387))

(declare-fun m!1201389 () Bool)

(assert (=> b!1311137 m!1201389))

(declare-fun m!1201391 () Bool)

(assert (=> b!1311137 m!1201391))

(declare-fun m!1201393 () Bool)

(assert (=> b!1311136 m!1201393))

(declare-fun m!1201395 () Bool)

(assert (=> start!110916 m!1201395))

(declare-fun m!1201397 () Bool)

(assert (=> start!110916 m!1201397))

(declare-fun m!1201399 () Bool)

(assert (=> start!110916 m!1201399))

(assert (=> b!1311131 m!1201381))

(assert (=> b!1311131 m!1201381))

(declare-fun m!1201401 () Bool)

(assert (=> b!1311131 m!1201401))

(declare-fun m!1201403 () Bool)

(assert (=> mapNonEmpty!54514 m!1201403))

(check-sat tp_is_empty!35257 (not b_next!29527) b_and!47737 (not b!1311136) (not b!1311131) (not mapNonEmpty!54514) (not start!110916) (not b!1311134) (not b!1311140) (not b!1311137))
(check-sat b_and!47737 (not b_next!29527))
