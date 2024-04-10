; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111096 () Bool)

(assert start!111096)

(declare-fun b_free!29931 () Bool)

(declare-fun b_next!29931 () Bool)

(assert (=> start!111096 (= b_free!29931 (not b_next!29931))))

(declare-fun tp!105115 () Bool)

(declare-fun b_and!48139 () Bool)

(assert (=> start!111096 (= tp!105115 b_and!48139)))

(declare-fun res!873237 () Bool)

(declare-fun e!750346 () Bool)

(assert (=> start!111096 (=> (not res!873237) (not e!750346))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111096 (= res!873237 (validMask!0 mask!2040))))

(assert (=> start!111096 e!750346))

(assert (=> start!111096 tp!105115))

(declare-datatypes ((array!88286 0))(
  ( (array!88287 (arr!42623 (Array (_ BitVec 32) (_ BitVec 64))) (size!43173 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88286)

(declare-fun array_inv!32193 (array!88286) Bool)

(assert (=> start!111096 (array_inv!32193 _keys!1628)))

(assert (=> start!111096 true))

(declare-fun tp_is_empty!35661 () Bool)

(assert (=> start!111096 tp_is_empty!35661))

(declare-datatypes ((V!52651 0))(
  ( (V!52652 (val!17905 Int)) )
))
(declare-datatypes ((ValueCell!16932 0))(
  ( (ValueCellFull!16932 (v!20532 V!52651)) (EmptyCell!16932) )
))
(declare-datatypes ((array!88288 0))(
  ( (array!88289 (arr!42624 (Array (_ BitVec 32) ValueCell!16932)) (size!43174 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88288)

(declare-fun e!750343 () Bool)

(declare-fun array_inv!32194 (array!88288) Bool)

(assert (=> start!111096 (and (array_inv!32194 _values!1354) e!750343)))

(declare-fun b!1315382 () Bool)

(assert (=> b!1315382 (= e!750346 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52651)

(declare-fun zeroValue!1296 () V!52651)

(declare-fun lt!585906 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23100 0))(
  ( (tuple2!23101 (_1!11561 (_ BitVec 64)) (_2!11561 V!52651)) )
))
(declare-datatypes ((List!30235 0))(
  ( (Nil!30232) (Cons!30231 (h!31440 tuple2!23100) (t!43841 List!30235)) )
))
(declare-datatypes ((ListLongMap!20757 0))(
  ( (ListLongMap!20758 (toList!10394 List!30235)) )
))
(declare-fun contains!8544 (ListLongMap!20757 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5407 (array!88286 array!88288 (_ BitVec 32) (_ BitVec 32) V!52651 V!52651 (_ BitVec 32) Int) ListLongMap!20757)

(assert (=> b!1315382 (= lt!585906 (contains!8544 (getCurrentListMap!5407 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315383 () Bool)

(declare-fun e!750344 () Bool)

(declare-fun mapRes!55120 () Bool)

(assert (=> b!1315383 (= e!750343 (and e!750344 mapRes!55120))))

(declare-fun condMapEmpty!55120 () Bool)

(declare-fun mapDefault!55120 () ValueCell!16932)

(assert (=> b!1315383 (= condMapEmpty!55120 (= (arr!42624 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16932)) mapDefault!55120)))))

(declare-fun b!1315384 () Bool)

(declare-fun e!750345 () Bool)

(assert (=> b!1315384 (= e!750345 tp_is_empty!35661)))

(declare-fun b!1315385 () Bool)

(assert (=> b!1315385 (= e!750344 tp_is_empty!35661)))

(declare-fun b!1315386 () Bool)

(declare-fun res!873238 () Bool)

(assert (=> b!1315386 (=> (not res!873238) (not e!750346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88286 (_ BitVec 32)) Bool)

(assert (=> b!1315386 (= res!873238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315387 () Bool)

(declare-fun res!873240 () Bool)

(assert (=> b!1315387 (=> (not res!873240) (not e!750346))))

(declare-datatypes ((List!30236 0))(
  ( (Nil!30233) (Cons!30232 (h!31441 (_ BitVec 64)) (t!43842 List!30236)) )
))
(declare-fun arrayNoDuplicates!0 (array!88286 (_ BitVec 32) List!30236) Bool)

(assert (=> b!1315387 (= res!873240 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30233))))

(declare-fun mapNonEmpty!55120 () Bool)

(declare-fun tp!105114 () Bool)

(assert (=> mapNonEmpty!55120 (= mapRes!55120 (and tp!105114 e!750345))))

(declare-fun mapRest!55120 () (Array (_ BitVec 32) ValueCell!16932))

(declare-fun mapKey!55120 () (_ BitVec 32))

(declare-fun mapValue!55120 () ValueCell!16932)

(assert (=> mapNonEmpty!55120 (= (arr!42624 _values!1354) (store mapRest!55120 mapKey!55120 mapValue!55120))))

(declare-fun b!1315388 () Bool)

(declare-fun res!873239 () Bool)

(assert (=> b!1315388 (=> (not res!873239) (not e!750346))))

(assert (=> b!1315388 (= res!873239 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43173 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55120 () Bool)

(assert (=> mapIsEmpty!55120 mapRes!55120))

(declare-fun b!1315389 () Bool)

(declare-fun res!873236 () Bool)

(assert (=> b!1315389 (=> (not res!873236) (not e!750346))))

(assert (=> b!1315389 (= res!873236 (and (= (size!43174 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43173 _keys!1628) (size!43174 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!111096 res!873237) b!1315389))

(assert (= (and b!1315389 res!873236) b!1315386))

(assert (= (and b!1315386 res!873238) b!1315387))

(assert (= (and b!1315387 res!873240) b!1315388))

(assert (= (and b!1315388 res!873239) b!1315382))

(assert (= (and b!1315383 condMapEmpty!55120) mapIsEmpty!55120))

(assert (= (and b!1315383 (not condMapEmpty!55120)) mapNonEmpty!55120))

(get-info :version)

(assert (= (and mapNonEmpty!55120 ((_ is ValueCellFull!16932) mapValue!55120)) b!1315384))

(assert (= (and b!1315383 ((_ is ValueCellFull!16932) mapDefault!55120)) b!1315385))

(assert (= start!111096 b!1315383))

(declare-fun m!1203595 () Bool)

(assert (=> b!1315387 m!1203595))

(declare-fun m!1203597 () Bool)

(assert (=> mapNonEmpty!55120 m!1203597))

(declare-fun m!1203599 () Bool)

(assert (=> start!111096 m!1203599))

(declare-fun m!1203601 () Bool)

(assert (=> start!111096 m!1203601))

(declare-fun m!1203603 () Bool)

(assert (=> start!111096 m!1203603))

(declare-fun m!1203605 () Bool)

(assert (=> b!1315386 m!1203605))

(declare-fun m!1203607 () Bool)

(assert (=> b!1315382 m!1203607))

(assert (=> b!1315382 m!1203607))

(declare-fun m!1203609 () Bool)

(assert (=> b!1315382 m!1203609))

(check-sat tp_is_empty!35661 (not mapNonEmpty!55120) (not start!111096) b_and!48139 (not b!1315386) (not b_next!29931) (not b!1315387) (not b!1315382))
(check-sat b_and!48139 (not b_next!29931))
