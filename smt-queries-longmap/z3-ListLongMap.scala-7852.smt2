; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97858 () Bool)

(assert start!97858)

(declare-fun b_free!23559 () Bool)

(declare-fun b_next!23559 () Bool)

(assert (=> start!97858 (= b_free!23559 (not b_next!23559))))

(declare-fun tp!83381 () Bool)

(declare-fun b_and!37901 () Bool)

(assert (=> start!97858 (= tp!83381 b_and!37901)))

(declare-fun b!1120222 () Bool)

(declare-fun res!748342 () Bool)

(declare-fun e!637908 () Bool)

(assert (=> b!1120222 (=> (not res!748342) (not e!637908))))

(declare-datatypes ((array!73059 0))(
  ( (array!73060 (arr!35182 (Array (_ BitVec 32) (_ BitVec 64))) (size!35718 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73059)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73059 (_ BitVec 32)) Bool)

(assert (=> b!1120222 (= res!748342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1120223 () Bool)

(declare-fun res!748348 () Bool)

(assert (=> b!1120223 (=> (not res!748348) (not e!637908))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1120223 (= res!748348 (= (select (arr!35182 _keys!1208) i!673) k0!934))))

(declare-fun b!1120224 () Bool)

(declare-fun res!748343 () Bool)

(assert (=> b!1120224 (=> (not res!748343) (not e!637908))))

(assert (=> b!1120224 (= res!748343 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35718 _keys!1208))))))

(declare-fun b!1120225 () Bool)

(declare-fun e!637905 () Bool)

(declare-fun e!637907 () Bool)

(declare-fun mapRes!43951 () Bool)

(assert (=> b!1120225 (= e!637905 (and e!637907 mapRes!43951))))

(declare-fun condMapEmpty!43951 () Bool)

(declare-datatypes ((V!42579 0))(
  ( (V!42580 (val!14101 Int)) )
))
(declare-datatypes ((ValueCell!13335 0))(
  ( (ValueCellFull!13335 (v!16734 V!42579)) (EmptyCell!13335) )
))
(declare-datatypes ((array!73061 0))(
  ( (array!73062 (arr!35183 (Array (_ BitVec 32) ValueCell!13335)) (size!35719 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73061)

(declare-fun mapDefault!43951 () ValueCell!13335)

(assert (=> b!1120225 (= condMapEmpty!43951 (= (arr!35183 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13335)) mapDefault!43951)))))

(declare-fun b!1120226 () Bool)

(declare-fun tp_is_empty!28089 () Bool)

(assert (=> b!1120226 (= e!637907 tp_is_empty!28089)))

(declare-fun res!748344 () Bool)

(assert (=> start!97858 (=> (not res!748344) (not e!637908))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97858 (= res!748344 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35718 _keys!1208))))))

(assert (=> start!97858 e!637908))

(assert (=> start!97858 tp_is_empty!28089))

(declare-fun array_inv!27022 (array!73059) Bool)

(assert (=> start!97858 (array_inv!27022 _keys!1208)))

(assert (=> start!97858 true))

(assert (=> start!97858 tp!83381))

(declare-fun array_inv!27023 (array!73061) Bool)

(assert (=> start!97858 (and (array_inv!27023 _values!996) e!637905)))

(declare-fun b!1120227 () Bool)

(declare-fun e!637911 () Bool)

(assert (=> b!1120227 (= e!637911 true)))

(declare-fun zeroValue!944 () V!42579)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17692 0))(
  ( (tuple2!17693 (_1!8857 (_ BitVec 64)) (_2!8857 V!42579)) )
))
(declare-datatypes ((List!24477 0))(
  ( (Nil!24474) (Cons!24473 (h!25682 tuple2!17692) (t!35028 List!24477)) )
))
(declare-datatypes ((ListLongMap!15661 0))(
  ( (ListLongMap!15662 (toList!7846 List!24477)) )
))
(declare-fun lt!497967 () ListLongMap!15661)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!497968 () array!73059)

(declare-fun minValue!944 () V!42579)

(declare-fun getCurrentListMapNoExtraKeys!4336 (array!73059 array!73061 (_ BitVec 32) (_ BitVec 32) V!42579 V!42579 (_ BitVec 32) Int) ListLongMap!15661)

(declare-fun dynLambda!2440 (Int (_ BitVec 64)) V!42579)

(assert (=> b!1120227 (= lt!497967 (getCurrentListMapNoExtraKeys!4336 lt!497968 (array!73062 (store (arr!35183 _values!996) i!673 (ValueCellFull!13335 (dynLambda!2440 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35719 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497966 () ListLongMap!15661)

(assert (=> b!1120227 (= lt!497966 (getCurrentListMapNoExtraKeys!4336 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!43951 () Bool)

(assert (=> mapIsEmpty!43951 mapRes!43951))

(declare-fun b!1120228 () Bool)

(declare-fun res!748345 () Bool)

(assert (=> b!1120228 (=> (not res!748345) (not e!637908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120228 (= res!748345 (validKeyInArray!0 k0!934))))

(declare-fun b!1120229 () Bool)

(declare-fun e!637906 () Bool)

(assert (=> b!1120229 (= e!637908 e!637906)))

(declare-fun res!748339 () Bool)

(assert (=> b!1120229 (=> (not res!748339) (not e!637906))))

(assert (=> b!1120229 (= res!748339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497968 mask!1564))))

(assert (=> b!1120229 (= lt!497968 (array!73060 (store (arr!35182 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35718 _keys!1208)))))

(declare-fun b!1120230 () Bool)

(declare-fun res!748340 () Bool)

(assert (=> b!1120230 (=> (not res!748340) (not e!637908))))

(assert (=> b!1120230 (= res!748340 (and (= (size!35719 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35718 _keys!1208) (size!35719 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1120231 () Bool)

(declare-fun e!637909 () Bool)

(assert (=> b!1120231 (= e!637909 tp_is_empty!28089)))

(declare-fun mapNonEmpty!43951 () Bool)

(declare-fun tp!83380 () Bool)

(assert (=> mapNonEmpty!43951 (= mapRes!43951 (and tp!83380 e!637909))))

(declare-fun mapRest!43951 () (Array (_ BitVec 32) ValueCell!13335))

(declare-fun mapKey!43951 () (_ BitVec 32))

(declare-fun mapValue!43951 () ValueCell!13335)

(assert (=> mapNonEmpty!43951 (= (arr!35183 _values!996) (store mapRest!43951 mapKey!43951 mapValue!43951))))

(declare-fun b!1120232 () Bool)

(declare-fun res!748347 () Bool)

(assert (=> b!1120232 (=> (not res!748347) (not e!637908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120232 (= res!748347 (validMask!0 mask!1564))))

(declare-fun b!1120233 () Bool)

(assert (=> b!1120233 (= e!637906 (not e!637911))))

(declare-fun res!748341 () Bool)

(assert (=> b!1120233 (=> res!748341 e!637911)))

(assert (=> b!1120233 (= res!748341 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120233 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36758 0))(
  ( (Unit!36759) )
))
(declare-fun lt!497969 () Unit!36758)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73059 (_ BitVec 64) (_ BitVec 32)) Unit!36758)

(assert (=> b!1120233 (= lt!497969 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1120234 () Bool)

(declare-fun res!748338 () Bool)

(assert (=> b!1120234 (=> (not res!748338) (not e!637908))))

(declare-datatypes ((List!24478 0))(
  ( (Nil!24475) (Cons!24474 (h!25683 (_ BitVec 64)) (t!35029 List!24478)) )
))
(declare-fun arrayNoDuplicates!0 (array!73059 (_ BitVec 32) List!24478) Bool)

(assert (=> b!1120234 (= res!748338 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24475))))

(declare-fun b!1120235 () Bool)

(declare-fun res!748346 () Bool)

(assert (=> b!1120235 (=> (not res!748346) (not e!637906))))

(assert (=> b!1120235 (= res!748346 (arrayNoDuplicates!0 lt!497968 #b00000000000000000000000000000000 Nil!24475))))

(assert (= (and start!97858 res!748344) b!1120232))

(assert (= (and b!1120232 res!748347) b!1120230))

(assert (= (and b!1120230 res!748340) b!1120222))

(assert (= (and b!1120222 res!748342) b!1120234))

(assert (= (and b!1120234 res!748338) b!1120224))

(assert (= (and b!1120224 res!748343) b!1120228))

(assert (= (and b!1120228 res!748345) b!1120223))

(assert (= (and b!1120223 res!748348) b!1120229))

(assert (= (and b!1120229 res!748339) b!1120235))

(assert (= (and b!1120235 res!748346) b!1120233))

(assert (= (and b!1120233 (not res!748341)) b!1120227))

(assert (= (and b!1120225 condMapEmpty!43951) mapIsEmpty!43951))

(assert (= (and b!1120225 (not condMapEmpty!43951)) mapNonEmpty!43951))

(get-info :version)

(assert (= (and mapNonEmpty!43951 ((_ is ValueCellFull!13335) mapValue!43951)) b!1120231))

(assert (= (and b!1120225 ((_ is ValueCellFull!13335) mapDefault!43951)) b!1120226))

(assert (= start!97858 b!1120225))

(declare-fun b_lambda!18529 () Bool)

(assert (=> (not b_lambda!18529) (not b!1120227)))

(declare-fun t!35027 () Bool)

(declare-fun tb!8371 () Bool)

(assert (=> (and start!97858 (= defaultEntry!1004 defaultEntry!1004) t!35027) tb!8371))

(declare-fun result!17303 () Bool)

(assert (=> tb!8371 (= result!17303 tp_is_empty!28089)))

(assert (=> b!1120227 t!35027))

(declare-fun b_and!37903 () Bool)

(assert (= b_and!37901 (and (=> t!35027 result!17303) b_and!37903)))

(declare-fun m!1035327 () Bool)

(assert (=> start!97858 m!1035327))

(declare-fun m!1035329 () Bool)

(assert (=> start!97858 m!1035329))

(declare-fun m!1035331 () Bool)

(assert (=> b!1120232 m!1035331))

(declare-fun m!1035333 () Bool)

(assert (=> mapNonEmpty!43951 m!1035333))

(declare-fun m!1035335 () Bool)

(assert (=> b!1120235 m!1035335))

(declare-fun m!1035337 () Bool)

(assert (=> b!1120233 m!1035337))

(declare-fun m!1035339 () Bool)

(assert (=> b!1120233 m!1035339))

(declare-fun m!1035341 () Bool)

(assert (=> b!1120227 m!1035341))

(declare-fun m!1035343 () Bool)

(assert (=> b!1120227 m!1035343))

(declare-fun m!1035345 () Bool)

(assert (=> b!1120227 m!1035345))

(declare-fun m!1035347 () Bool)

(assert (=> b!1120227 m!1035347))

(declare-fun m!1035349 () Bool)

(assert (=> b!1120223 m!1035349))

(declare-fun m!1035351 () Bool)

(assert (=> b!1120234 m!1035351))

(declare-fun m!1035353 () Bool)

(assert (=> b!1120229 m!1035353))

(declare-fun m!1035355 () Bool)

(assert (=> b!1120229 m!1035355))

(declare-fun m!1035357 () Bool)

(assert (=> b!1120222 m!1035357))

(declare-fun m!1035359 () Bool)

(assert (=> b!1120228 m!1035359))

(check-sat (not b!1120232) (not b!1120229) (not b!1120233) (not b!1120222) (not b!1120228) b_and!37903 (not start!97858) (not b!1120227) (not b!1120235) (not b_lambda!18529) (not b_next!23559) (not mapNonEmpty!43951) (not b!1120234) tp_is_empty!28089)
(check-sat b_and!37903 (not b_next!23559))
