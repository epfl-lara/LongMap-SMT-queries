; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111404 () Bool)

(assert start!111404)

(declare-fun b_free!30061 () Bool)

(declare-fun b_next!30061 () Bool)

(assert (=> start!111404 (= b_free!30061 (not b_next!30061))))

(declare-fun tp!105659 () Bool)

(declare-fun b_and!48263 () Bool)

(assert (=> start!111404 (= tp!105659 b_and!48263)))

(declare-fun mapIsEmpty!55469 () Bool)

(declare-fun mapRes!55469 () Bool)

(assert (=> mapIsEmpty!55469 mapRes!55469))

(declare-fun b!1318215 () Bool)

(declare-fun e!752264 () Bool)

(declare-fun tp_is_empty!35881 () Bool)

(assert (=> b!1318215 (= e!752264 tp_is_empty!35881)))

(declare-fun b!1318216 () Bool)

(declare-fun res!874883 () Bool)

(declare-fun e!752263 () Bool)

(assert (=> b!1318216 (=> (not res!874883) (not e!752263))))

(declare-datatypes ((array!88631 0))(
  ( (array!88632 (arr!42790 (Array (_ BitVec 32) (_ BitVec 64))) (size!43342 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88631)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!52945 0))(
  ( (V!52946 (val!18015 Int)) )
))
(declare-fun zeroValue!1279 () V!52945)

(declare-datatypes ((ValueCell!17042 0))(
  ( (ValueCellFull!17042 (v!20644 V!52945)) (EmptyCell!17042) )
))
(declare-datatypes ((array!88633 0))(
  ( (array!88634 (arr!42791 (Array (_ BitVec 32) ValueCell!17042)) (size!43343 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88633)

(declare-fun minValue!1279 () V!52945)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23266 0))(
  ( (tuple2!23267 (_1!11644 (_ BitVec 64)) (_2!11644 V!52945)) )
))
(declare-datatypes ((List!30406 0))(
  ( (Nil!30403) (Cons!30402 (h!31611 tuple2!23266) (t!44008 List!30406)) )
))
(declare-datatypes ((ListLongMap!20923 0))(
  ( (ListLongMap!20924 (toList!10477 List!30406)) )
))
(declare-fun contains!8560 (ListLongMap!20923 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5372 (array!88631 array!88633 (_ BitVec 32) (_ BitVec 32) V!52945 V!52945 (_ BitVec 32) Int) ListLongMap!20923)

(assert (=> b!1318216 (= res!874883 (contains!8560 (getCurrentListMap!5372 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1318217 () Bool)

(declare-fun res!874887 () Bool)

(assert (=> b!1318217 (=> (not res!874887) (not e!752263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318217 (= res!874887 (validKeyInArray!0 (select (arr!42790 _keys!1609) from!2000)))))

(declare-fun b!1318218 () Bool)

(declare-fun e!752262 () Bool)

(assert (=> b!1318218 (= e!752262 (and e!752264 mapRes!55469))))

(declare-fun condMapEmpty!55469 () Bool)

(declare-fun mapDefault!55469 () ValueCell!17042)

(assert (=> b!1318218 (= condMapEmpty!55469 (= (arr!42791 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17042)) mapDefault!55469)))))

(declare-fun res!874880 () Bool)

(assert (=> start!111404 (=> (not res!874880) (not e!752263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111404 (= res!874880 (validMask!0 mask!2019))))

(assert (=> start!111404 e!752263))

(declare-fun array_inv!32497 (array!88631) Bool)

(assert (=> start!111404 (array_inv!32497 _keys!1609)))

(assert (=> start!111404 true))

(assert (=> start!111404 tp_is_empty!35881))

(declare-fun array_inv!32498 (array!88633) Bool)

(assert (=> start!111404 (and (array_inv!32498 _values!1337) e!752262)))

(assert (=> start!111404 tp!105659))

(declare-fun b!1318219 () Bool)

(assert (=> b!1318219 (= e!752263 false)))

(declare-fun lt!586272 () Bool)

(declare-fun +!4530 (ListLongMap!20923 tuple2!23266) ListLongMap!20923)

(declare-fun getCurrentListMapNoExtraKeys!6163 (array!88631 array!88633 (_ BitVec 32) (_ BitVec 32) V!52945 V!52945 (_ BitVec 32) Int) ListLongMap!20923)

(declare-fun get!21509 (ValueCell!17042 V!52945) V!52945)

(declare-fun dynLambda!3460 (Int (_ BitVec 64)) V!52945)

(assert (=> b!1318219 (= lt!586272 (contains!8560 (+!4530 (+!4530 (+!4530 (getCurrentListMapNoExtraKeys!6163 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23267 (select (arr!42790 _keys!1609) from!2000) (get!21509 (select (arr!42791 _values!1337) from!2000) (dynLambda!3460 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23267 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23267 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164))))

(declare-fun mapNonEmpty!55469 () Bool)

(declare-fun tp!105660 () Bool)

(declare-fun e!752265 () Bool)

(assert (=> mapNonEmpty!55469 (= mapRes!55469 (and tp!105660 e!752265))))

(declare-fun mapRest!55469 () (Array (_ BitVec 32) ValueCell!17042))

(declare-fun mapKey!55469 () (_ BitVec 32))

(declare-fun mapValue!55469 () ValueCell!17042)

(assert (=> mapNonEmpty!55469 (= (arr!42791 _values!1337) (store mapRest!55469 mapKey!55469 mapValue!55469))))

(declare-fun b!1318220 () Bool)

(declare-fun res!874884 () Bool)

(assert (=> b!1318220 (=> (not res!874884) (not e!752263))))

(assert (=> b!1318220 (= res!874884 (not (= (select (arr!42790 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1318221 () Bool)

(declare-fun res!874886 () Bool)

(assert (=> b!1318221 (=> (not res!874886) (not e!752263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88631 (_ BitVec 32)) Bool)

(assert (=> b!1318221 (= res!874886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318222 () Bool)

(declare-fun res!874882 () Bool)

(assert (=> b!1318222 (=> (not res!874882) (not e!752263))))

(assert (=> b!1318222 (= res!874882 (and (= (size!43343 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43342 _keys!1609) (size!43343 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318223 () Bool)

(declare-fun res!874885 () Bool)

(assert (=> b!1318223 (=> (not res!874885) (not e!752263))))

(declare-datatypes ((List!30407 0))(
  ( (Nil!30404) (Cons!30403 (h!31612 (_ BitVec 64)) (t!44009 List!30407)) )
))
(declare-fun arrayNoDuplicates!0 (array!88631 (_ BitVec 32) List!30407) Bool)

(assert (=> b!1318223 (= res!874885 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30404))))

(declare-fun b!1318224 () Bool)

(declare-fun res!874881 () Bool)

(assert (=> b!1318224 (=> (not res!874881) (not e!752263))))

(assert (=> b!1318224 (= res!874881 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43342 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318225 () Bool)

(assert (=> b!1318225 (= e!752265 tp_is_empty!35881)))

(assert (= (and start!111404 res!874880) b!1318222))

(assert (= (and b!1318222 res!874882) b!1318221))

(assert (= (and b!1318221 res!874886) b!1318223))

(assert (= (and b!1318223 res!874885) b!1318224))

(assert (= (and b!1318224 res!874881) b!1318216))

(assert (= (and b!1318216 res!874883) b!1318220))

(assert (= (and b!1318220 res!874884) b!1318217))

(assert (= (and b!1318217 res!874887) b!1318219))

(assert (= (and b!1318218 condMapEmpty!55469) mapIsEmpty!55469))

(assert (= (and b!1318218 (not condMapEmpty!55469)) mapNonEmpty!55469))

(get-info :version)

(assert (= (and mapNonEmpty!55469 ((_ is ValueCellFull!17042) mapValue!55469)) b!1318225))

(assert (= (and b!1318218 ((_ is ValueCellFull!17042) mapDefault!55469)) b!1318215))

(assert (= start!111404 b!1318218))

(declare-fun b_lambda!23377 () Bool)

(assert (=> (not b_lambda!23377) (not b!1318219)))

(declare-fun t!44007 () Bool)

(declare-fun tb!11405 () Bool)

(assert (=> (and start!111404 (= defaultEntry!1340 defaultEntry!1340) t!44007) tb!11405))

(declare-fun result!23873 () Bool)

(assert (=> tb!11405 (= result!23873 tp_is_empty!35881)))

(assert (=> b!1318219 t!44007))

(declare-fun b_and!48265 () Bool)

(assert (= b_and!48263 (and (=> t!44007 result!23873) b_and!48265)))

(declare-fun m!1205331 () Bool)

(assert (=> b!1318216 m!1205331))

(assert (=> b!1318216 m!1205331))

(declare-fun m!1205333 () Bool)

(assert (=> b!1318216 m!1205333))

(declare-fun m!1205335 () Bool)

(assert (=> b!1318220 m!1205335))

(declare-fun m!1205337 () Bool)

(assert (=> start!111404 m!1205337))

(declare-fun m!1205339 () Bool)

(assert (=> start!111404 m!1205339))

(declare-fun m!1205341 () Bool)

(assert (=> start!111404 m!1205341))

(assert (=> b!1318217 m!1205335))

(assert (=> b!1318217 m!1205335))

(declare-fun m!1205343 () Bool)

(assert (=> b!1318217 m!1205343))

(declare-fun m!1205345 () Bool)

(assert (=> b!1318221 m!1205345))

(declare-fun m!1205347 () Bool)

(assert (=> mapNonEmpty!55469 m!1205347))

(declare-fun m!1205349 () Bool)

(assert (=> b!1318223 m!1205349))

(declare-fun m!1205351 () Bool)

(assert (=> b!1318219 m!1205351))

(declare-fun m!1205353 () Bool)

(assert (=> b!1318219 m!1205353))

(assert (=> b!1318219 m!1205351))

(declare-fun m!1205355 () Bool)

(assert (=> b!1318219 m!1205355))

(declare-fun m!1205357 () Bool)

(assert (=> b!1318219 m!1205357))

(declare-fun m!1205359 () Bool)

(assert (=> b!1318219 m!1205359))

(declare-fun m!1205361 () Bool)

(assert (=> b!1318219 m!1205361))

(assert (=> b!1318219 m!1205355))

(declare-fun m!1205363 () Bool)

(assert (=> b!1318219 m!1205363))

(assert (=> b!1318219 m!1205335))

(assert (=> b!1318219 m!1205363))

(assert (=> b!1318219 m!1205357))

(assert (=> b!1318219 m!1205361))

(assert (=> b!1318219 m!1205353))

(declare-fun m!1205365 () Bool)

(assert (=> b!1318219 m!1205365))

(check-sat (not b!1318221) b_and!48265 (not b!1318223) (not b!1318219) (not b!1318216) tp_is_empty!35881 (not b_next!30061) (not start!111404) (not b!1318217) (not b_lambda!23377) (not mapNonEmpty!55469))
(check-sat b_and!48265 (not b_next!30061))
