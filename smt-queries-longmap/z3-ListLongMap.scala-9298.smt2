; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111360 () Bool)

(assert start!111360)

(declare-fun b_free!29971 () Bool)

(declare-fun b_next!29971 () Bool)

(assert (=> start!111360 (= b_free!29971 (not b_next!29971))))

(declare-fun tp!105235 () Bool)

(declare-fun b_and!48181 () Bool)

(assert (=> start!111360 (= tp!105235 b_and!48181)))

(declare-fun res!874056 () Bool)

(declare-fun e!751489 () Bool)

(assert (=> start!111360 (=> (not res!874056) (not e!751489))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111360 (= res!874056 (validMask!0 mask!2040))))

(assert (=> start!111360 e!751489))

(assert (=> start!111360 tp!105235))

(declare-datatypes ((array!88419 0))(
  ( (array!88420 (arr!42685 (Array (_ BitVec 32) (_ BitVec 64))) (size!43236 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88419)

(declare-fun array_inv!32507 (array!88419) Bool)

(assert (=> start!111360 (array_inv!32507 _keys!1628)))

(assert (=> start!111360 true))

(declare-fun tp_is_empty!35701 () Bool)

(assert (=> start!111360 tp_is_empty!35701))

(declare-datatypes ((V!52705 0))(
  ( (V!52706 (val!17925 Int)) )
))
(declare-datatypes ((ValueCell!16952 0))(
  ( (ValueCellFull!16952 (v!20547 V!52705)) (EmptyCell!16952) )
))
(declare-datatypes ((array!88421 0))(
  ( (array!88422 (arr!42686 (Array (_ BitVec 32) ValueCell!16952)) (size!43237 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88421)

(declare-fun e!751488 () Bool)

(declare-fun array_inv!32508 (array!88421) Bool)

(assert (=> start!111360 (and (array_inv!32508 _values!1354) e!751488)))

(declare-fun b!1317161 () Bool)

(declare-fun res!874057 () Bool)

(assert (=> b!1317161 (=> (not res!874057) (not e!751489))))

(declare-datatypes ((List!30297 0))(
  ( (Nil!30294) (Cons!30293 (h!31511 (_ BitVec 64)) (t!43895 List!30297)) )
))
(declare-fun arrayNoDuplicates!0 (array!88419 (_ BitVec 32) List!30297) Bool)

(assert (=> b!1317161 (= res!874057 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30294))))

(declare-fun b!1317162 () Bool)

(declare-fun e!751487 () Bool)

(assert (=> b!1317162 (= e!751487 tp_is_empty!35701)))

(declare-fun b!1317163 () Bool)

(declare-fun e!751490 () Bool)

(assert (=> b!1317163 (= e!751490 tp_is_empty!35701)))

(declare-fun b!1317164 () Bool)

(assert (=> b!1317164 (= e!751489 false)))

(declare-fun lt!586442 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52705)

(declare-fun zeroValue!1296 () V!52705)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23152 0))(
  ( (tuple2!23153 (_1!11587 (_ BitVec 64)) (_2!11587 V!52705)) )
))
(declare-datatypes ((List!30298 0))(
  ( (Nil!30295) (Cons!30294 (h!31512 tuple2!23152) (t!43896 List!30298)) )
))
(declare-datatypes ((ListLongMap!20817 0))(
  ( (ListLongMap!20818 (toList!10424 List!30298)) )
))
(declare-fun contains!8586 (ListLongMap!20817 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5428 (array!88419 array!88421 (_ BitVec 32) (_ BitVec 32) V!52705 V!52705 (_ BitVec 32) Int) ListLongMap!20817)

(assert (=> b!1317164 (= lt!586442 (contains!8586 (getCurrentListMap!5428 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1317165 () Bool)

(declare-fun res!874054 () Bool)

(assert (=> b!1317165 (=> (not res!874054) (not e!751489))))

(assert (=> b!1317165 (= res!874054 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43236 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1317166 () Bool)

(declare-fun res!874055 () Bool)

(assert (=> b!1317166 (=> (not res!874055) (not e!751489))))

(assert (=> b!1317166 (= res!874055 (and (= (size!43237 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43236 _keys!1628) (size!43237 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55180 () Bool)

(declare-fun mapRes!55180 () Bool)

(assert (=> mapIsEmpty!55180 mapRes!55180))

(declare-fun mapNonEmpty!55180 () Bool)

(declare-fun tp!105234 () Bool)

(assert (=> mapNonEmpty!55180 (= mapRes!55180 (and tp!105234 e!751490))))

(declare-fun mapKey!55180 () (_ BitVec 32))

(declare-fun mapValue!55180 () ValueCell!16952)

(declare-fun mapRest!55180 () (Array (_ BitVec 32) ValueCell!16952))

(assert (=> mapNonEmpty!55180 (= (arr!42686 _values!1354) (store mapRest!55180 mapKey!55180 mapValue!55180))))

(declare-fun b!1317167 () Bool)

(assert (=> b!1317167 (= e!751488 (and e!751487 mapRes!55180))))

(declare-fun condMapEmpty!55180 () Bool)

(declare-fun mapDefault!55180 () ValueCell!16952)

(assert (=> b!1317167 (= condMapEmpty!55180 (= (arr!42686 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16952)) mapDefault!55180)))))

(declare-fun b!1317168 () Bool)

(declare-fun res!874058 () Bool)

(assert (=> b!1317168 (=> (not res!874058) (not e!751489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88419 (_ BitVec 32)) Bool)

(assert (=> b!1317168 (= res!874058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!111360 res!874056) b!1317166))

(assert (= (and b!1317166 res!874055) b!1317168))

(assert (= (and b!1317168 res!874058) b!1317161))

(assert (= (and b!1317161 res!874057) b!1317165))

(assert (= (and b!1317165 res!874054) b!1317164))

(assert (= (and b!1317167 condMapEmpty!55180) mapIsEmpty!55180))

(assert (= (and b!1317167 (not condMapEmpty!55180)) mapNonEmpty!55180))

(get-info :version)

(assert (= (and mapNonEmpty!55180 ((_ is ValueCellFull!16952) mapValue!55180)) b!1317163))

(assert (= (and b!1317167 ((_ is ValueCellFull!16952) mapDefault!55180)) b!1317162))

(assert (= start!111360 b!1317167))

(declare-fun m!1205513 () Bool)

(assert (=> b!1317168 m!1205513))

(declare-fun m!1205515 () Bool)

(assert (=> mapNonEmpty!55180 m!1205515))

(declare-fun m!1205517 () Bool)

(assert (=> b!1317161 m!1205517))

(declare-fun m!1205519 () Bool)

(assert (=> b!1317164 m!1205519))

(assert (=> b!1317164 m!1205519))

(declare-fun m!1205521 () Bool)

(assert (=> b!1317164 m!1205521))

(declare-fun m!1205523 () Bool)

(assert (=> start!111360 m!1205523))

(declare-fun m!1205525 () Bool)

(assert (=> start!111360 m!1205525))

(declare-fun m!1205527 () Bool)

(assert (=> start!111360 m!1205527))

(check-sat b_and!48181 (not mapNonEmpty!55180) (not b_next!29971) (not b!1317164) (not start!111360) tp_is_empty!35701 (not b!1317161) (not b!1317168))
(check-sat b_and!48181 (not b_next!29971))
