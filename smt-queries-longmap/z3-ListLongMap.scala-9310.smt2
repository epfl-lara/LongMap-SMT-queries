; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111298 () Bool)

(assert start!111298)

(declare-fun res!874225 () Bool)

(declare-fun e!751501 () Bool)

(assert (=> start!111298 (=> (not res!874225) (not e!751501))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111298 (= res!874225 (validMask!0 mask!2019))))

(assert (=> start!111298 e!751501))

(assert (=> start!111298 true))

(declare-datatypes ((V!52803 0))(
  ( (V!52804 (val!17962 Int)) )
))
(declare-datatypes ((ValueCell!16989 0))(
  ( (ValueCellFull!16989 (v!20592 V!52803)) (EmptyCell!16989) )
))
(declare-datatypes ((array!88510 0))(
  ( (array!88511 (arr!42729 (Array (_ BitVec 32) ValueCell!16989)) (size!43279 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88510)

(declare-fun e!751504 () Bool)

(declare-fun array_inv!32269 (array!88510) Bool)

(assert (=> start!111298 (and (array_inv!32269 _values!1337) e!751504)))

(declare-datatypes ((array!88512 0))(
  ( (array!88513 (arr!42730 (Array (_ BitVec 32) (_ BitVec 64))) (size!43280 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88512)

(declare-fun array_inv!32270 (array!88512) Bool)

(assert (=> start!111298 (array_inv!32270 _keys!1609)))

(declare-fun b!1317123 () Bool)

(declare-fun res!874224 () Bool)

(assert (=> b!1317123 (=> (not res!874224) (not e!751501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88512 (_ BitVec 32)) Bool)

(assert (=> b!1317123 (= res!874224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317124 () Bool)

(declare-fun e!751503 () Bool)

(declare-fun tp_is_empty!35775 () Bool)

(assert (=> b!1317124 (= e!751503 tp_is_empty!35775)))

(declare-fun mapIsEmpty!55310 () Bool)

(declare-fun mapRes!55310 () Bool)

(assert (=> mapIsEmpty!55310 mapRes!55310))

(declare-fun mapNonEmpty!55310 () Bool)

(declare-fun tp!105416 () Bool)

(assert (=> mapNonEmpty!55310 (= mapRes!55310 (and tp!105416 e!751503))))

(declare-fun mapRest!55310 () (Array (_ BitVec 32) ValueCell!16989))

(declare-fun mapValue!55310 () ValueCell!16989)

(declare-fun mapKey!55310 () (_ BitVec 32))

(assert (=> mapNonEmpty!55310 (= (arr!42729 _values!1337) (store mapRest!55310 mapKey!55310 mapValue!55310))))

(declare-fun b!1317125 () Bool)

(declare-fun e!751502 () Bool)

(assert (=> b!1317125 (= e!751504 (and e!751502 mapRes!55310))))

(declare-fun condMapEmpty!55310 () Bool)

(declare-fun mapDefault!55310 () ValueCell!16989)

(assert (=> b!1317125 (= condMapEmpty!55310 (= (arr!42729 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16989)) mapDefault!55310)))))

(declare-fun b!1317126 () Bool)

(declare-fun res!874226 () Bool)

(assert (=> b!1317126 (=> (not res!874226) (not e!751501))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317126 (= res!874226 (and (= (size!43279 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43280 _keys!1609) (size!43279 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317127 () Bool)

(assert (=> b!1317127 (= e!751501 false)))

(declare-fun lt!586317 () Bool)

(declare-datatypes ((List!30293 0))(
  ( (Nil!30290) (Cons!30289 (h!31498 (_ BitVec 64)) (t!43901 List!30293)) )
))
(declare-fun arrayNoDuplicates!0 (array!88512 (_ BitVec 32) List!30293) Bool)

(assert (=> b!1317127 (= lt!586317 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30290))))

(declare-fun b!1317128 () Bool)

(assert (=> b!1317128 (= e!751502 tp_is_empty!35775)))

(assert (= (and start!111298 res!874225) b!1317126))

(assert (= (and b!1317126 res!874226) b!1317123))

(assert (= (and b!1317123 res!874224) b!1317127))

(assert (= (and b!1317125 condMapEmpty!55310) mapIsEmpty!55310))

(assert (= (and b!1317125 (not condMapEmpty!55310)) mapNonEmpty!55310))

(get-info :version)

(assert (= (and mapNonEmpty!55310 ((_ is ValueCellFull!16989) mapValue!55310)) b!1317124))

(assert (= (and b!1317125 ((_ is ValueCellFull!16989) mapDefault!55310)) b!1317128))

(assert (= start!111298 b!1317125))

(declare-fun m!1205091 () Bool)

(assert (=> start!111298 m!1205091))

(declare-fun m!1205093 () Bool)

(assert (=> start!111298 m!1205093))

(declare-fun m!1205095 () Bool)

(assert (=> start!111298 m!1205095))

(declare-fun m!1205097 () Bool)

(assert (=> b!1317123 m!1205097))

(declare-fun m!1205099 () Bool)

(assert (=> mapNonEmpty!55310 m!1205099))

(declare-fun m!1205101 () Bool)

(assert (=> b!1317127 m!1205101))

(check-sat (not b!1317127) (not b!1317123) (not start!111298) tp_is_empty!35775 (not mapNonEmpty!55310))
(check-sat)
