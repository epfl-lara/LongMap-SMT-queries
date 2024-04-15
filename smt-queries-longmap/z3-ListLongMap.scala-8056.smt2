; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99170 () Bool)

(assert start!99170)

(declare-fun b_free!24781 () Bool)

(declare-fun b_next!24781 () Bool)

(assert (=> start!99170 (= b_free!24781 (not b_next!24781))))

(declare-fun tp!87054 () Bool)

(declare-fun b_and!40389 () Bool)

(assert (=> start!99170 (= tp!87054 b_and!40389)))

(declare-fun b!1167283 () Bool)

(declare-fun res!774369 () Bool)

(declare-fun e!663452 () Bool)

(assert (=> b!1167283 (=> (not res!774369) (not e!663452))))

(declare-datatypes ((array!75372 0))(
  ( (array!75373 (arr!36337 (Array (_ BitVec 32) (_ BitVec 64))) (size!36875 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75372)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75372 (_ BitVec 32)) Bool)

(assert (=> b!1167283 (= res!774369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1167284 () Bool)

(declare-fun res!774370 () Bool)

(assert (=> b!1167284 (=> (not res!774370) (not e!663452))))

(declare-datatypes ((V!44209 0))(
  ( (V!44210 (val!14712 Int)) )
))
(declare-datatypes ((ValueCell!13946 0))(
  ( (ValueCellFull!13946 (v!17348 V!44209)) (EmptyCell!13946) )
))
(declare-datatypes ((array!75374 0))(
  ( (array!75375 (arr!36338 (Array (_ BitVec 32) ValueCell!13946)) (size!36876 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75374)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1167284 (= res!774370 (and (= (size!36876 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36875 _keys!1208) (size!36876 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167285 () Bool)

(declare-fun e!663457 () Bool)

(declare-fun e!663453 () Bool)

(declare-fun mapRes!45791 () Bool)

(assert (=> b!1167285 (= e!663457 (and e!663453 mapRes!45791))))

(declare-fun condMapEmpty!45791 () Bool)

(declare-fun mapDefault!45791 () ValueCell!13946)

(assert (=> b!1167285 (= condMapEmpty!45791 (= (arr!36338 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13946)) mapDefault!45791)))))

(declare-fun b!1167286 () Bool)

(declare-fun res!774373 () Bool)

(assert (=> b!1167286 (=> (not res!774373) (not e!663452))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167286 (= res!774373 (= (select (arr!36337 _keys!1208) i!673) k0!934))))

(declare-fun b!1167287 () Bool)

(declare-fun res!774367 () Bool)

(declare-fun e!663459 () Bool)

(assert (=> b!1167287 (=> (not res!774367) (not e!663459))))

(declare-fun lt!525430 () array!75372)

(declare-datatypes ((List!25577 0))(
  ( (Nil!25574) (Cons!25573 (h!26782 (_ BitVec 64)) (t!37341 List!25577)) )
))
(declare-fun arrayNoDuplicates!0 (array!75372 (_ BitVec 32) List!25577) Bool)

(assert (=> b!1167287 (= res!774367 (arrayNoDuplicates!0 lt!525430 #b00000000000000000000000000000000 Nil!25574))))

(declare-fun b!1167288 () Bool)

(declare-fun e!663456 () Bool)

(declare-fun tp_is_empty!29311 () Bool)

(assert (=> b!1167288 (= e!663456 tp_is_empty!29311)))

(declare-fun res!774371 () Bool)

(assert (=> start!99170 (=> (not res!774371) (not e!663452))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99170 (= res!774371 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36875 _keys!1208))))))

(assert (=> start!99170 e!663452))

(assert (=> start!99170 tp_is_empty!29311))

(declare-fun array_inv!27882 (array!75372) Bool)

(assert (=> start!99170 (array_inv!27882 _keys!1208)))

(assert (=> start!99170 true))

(assert (=> start!99170 tp!87054))

(declare-fun array_inv!27883 (array!75374) Bool)

(assert (=> start!99170 (and (array_inv!27883 _values!996) e!663457)))

(declare-fun mapIsEmpty!45791 () Bool)

(assert (=> mapIsEmpty!45791 mapRes!45791))

(declare-fun b!1167289 () Bool)

(declare-fun res!774376 () Bool)

(assert (=> b!1167289 (=> (not res!774376) (not e!663452))))

(assert (=> b!1167289 (= res!774376 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36875 _keys!1208))))))

(declare-fun b!1167290 () Bool)

(declare-fun e!663458 () Bool)

(declare-fun e!663455 () Bool)

(assert (=> b!1167290 (= e!663458 e!663455)))

(declare-fun res!774377 () Bool)

(assert (=> b!1167290 (=> res!774377 e!663455)))

(assert (=> b!1167290 (= res!774377 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44209)

(declare-datatypes ((tuple2!18862 0))(
  ( (tuple2!18863 (_1!9442 (_ BitVec 64)) (_2!9442 V!44209)) )
))
(declare-datatypes ((List!25578 0))(
  ( (Nil!25575) (Cons!25574 (h!26783 tuple2!18862) (t!37342 List!25578)) )
))
(declare-datatypes ((ListLongMap!16831 0))(
  ( (ListLongMap!16832 (toList!8431 List!25578)) )
))
(declare-fun lt!525431 () ListLongMap!16831)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525434 () array!75374)

(declare-fun minValue!944 () V!44209)

(declare-fun getCurrentListMapNoExtraKeys!4907 (array!75372 array!75374 (_ BitVec 32) (_ BitVec 32) V!44209 V!44209 (_ BitVec 32) Int) ListLongMap!16831)

(assert (=> b!1167290 (= lt!525431 (getCurrentListMapNoExtraKeys!4907 lt!525430 lt!525434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2839 (Int (_ BitVec 64)) V!44209)

(assert (=> b!1167290 (= lt!525434 (array!75375 (store (arr!36338 _values!996) i!673 (ValueCellFull!13946 (dynLambda!2839 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36876 _values!996)))))

(declare-fun lt!525435 () ListLongMap!16831)

(assert (=> b!1167290 (= lt!525435 (getCurrentListMapNoExtraKeys!4907 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167291 () Bool)

(declare-fun res!774372 () Bool)

(assert (=> b!1167291 (=> (not res!774372) (not e!663452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167291 (= res!774372 (validMask!0 mask!1564))))

(declare-fun b!1167292 () Bool)

(declare-fun res!774375 () Bool)

(assert (=> b!1167292 (=> (not res!774375) (not e!663452))))

(assert (=> b!1167292 (= res!774375 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25574))))

(declare-fun b!1167293 () Bool)

(assert (=> b!1167293 (= e!663455 true)))

(declare-fun -!1441 (ListLongMap!16831 (_ BitVec 64)) ListLongMap!16831)

(assert (=> b!1167293 (= (getCurrentListMapNoExtraKeys!4907 lt!525430 lt!525434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1441 (getCurrentListMapNoExtraKeys!4907 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38347 0))(
  ( (Unit!38348) )
))
(declare-fun lt!525433 () Unit!38347)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!705 (array!75372 array!75374 (_ BitVec 32) (_ BitVec 32) V!44209 V!44209 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38347)

(assert (=> b!1167293 (= lt!525433 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!705 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167294 () Bool)

(assert (=> b!1167294 (= e!663452 e!663459)))

(declare-fun res!774368 () Bool)

(assert (=> b!1167294 (=> (not res!774368) (not e!663459))))

(assert (=> b!1167294 (= res!774368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525430 mask!1564))))

(assert (=> b!1167294 (= lt!525430 (array!75373 (store (arr!36337 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36875 _keys!1208)))))

(declare-fun mapNonEmpty!45791 () Bool)

(declare-fun tp!87053 () Bool)

(assert (=> mapNonEmpty!45791 (= mapRes!45791 (and tp!87053 e!663456))))

(declare-fun mapRest!45791 () (Array (_ BitVec 32) ValueCell!13946))

(declare-fun mapKey!45791 () (_ BitVec 32))

(declare-fun mapValue!45791 () ValueCell!13946)

(assert (=> mapNonEmpty!45791 (= (arr!36338 _values!996) (store mapRest!45791 mapKey!45791 mapValue!45791))))

(declare-fun b!1167295 () Bool)

(declare-fun res!774366 () Bool)

(assert (=> b!1167295 (=> (not res!774366) (not e!663452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167295 (= res!774366 (validKeyInArray!0 k0!934))))

(declare-fun b!1167296 () Bool)

(assert (=> b!1167296 (= e!663453 tp_is_empty!29311)))

(declare-fun b!1167297 () Bool)

(assert (=> b!1167297 (= e!663459 (not e!663458))))

(declare-fun res!774374 () Bool)

(assert (=> b!1167297 (=> res!774374 e!663458)))

(assert (=> b!1167297 (= res!774374 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75372 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167297 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525432 () Unit!38347)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75372 (_ BitVec 64) (_ BitVec 32)) Unit!38347)

(assert (=> b!1167297 (= lt!525432 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99170 res!774371) b!1167291))

(assert (= (and b!1167291 res!774372) b!1167284))

(assert (= (and b!1167284 res!774370) b!1167283))

(assert (= (and b!1167283 res!774369) b!1167292))

(assert (= (and b!1167292 res!774375) b!1167289))

(assert (= (and b!1167289 res!774376) b!1167295))

(assert (= (and b!1167295 res!774366) b!1167286))

(assert (= (and b!1167286 res!774373) b!1167294))

(assert (= (and b!1167294 res!774368) b!1167287))

(assert (= (and b!1167287 res!774367) b!1167297))

(assert (= (and b!1167297 (not res!774374)) b!1167290))

(assert (= (and b!1167290 (not res!774377)) b!1167293))

(assert (= (and b!1167285 condMapEmpty!45791) mapIsEmpty!45791))

(assert (= (and b!1167285 (not condMapEmpty!45791)) mapNonEmpty!45791))

(get-info :version)

(assert (= (and mapNonEmpty!45791 ((_ is ValueCellFull!13946) mapValue!45791)) b!1167288))

(assert (= (and b!1167285 ((_ is ValueCellFull!13946) mapDefault!45791)) b!1167296))

(assert (= start!99170 b!1167285))

(declare-fun b_lambda!19869 () Bool)

(assert (=> (not b_lambda!19869) (not b!1167290)))

(declare-fun t!37340 () Bool)

(declare-fun tb!9585 () Bool)

(assert (=> (and start!99170 (= defaultEntry!1004 defaultEntry!1004) t!37340) tb!9585))

(declare-fun result!19743 () Bool)

(assert (=> tb!9585 (= result!19743 tp_is_empty!29311)))

(assert (=> b!1167290 t!37340))

(declare-fun b_and!40391 () Bool)

(assert (= b_and!40389 (and (=> t!37340 result!19743) b_and!40391)))

(declare-fun m!1074733 () Bool)

(assert (=> mapNonEmpty!45791 m!1074733))

(declare-fun m!1074735 () Bool)

(assert (=> b!1167294 m!1074735))

(declare-fun m!1074737 () Bool)

(assert (=> b!1167294 m!1074737))

(declare-fun m!1074739 () Bool)

(assert (=> b!1167287 m!1074739))

(declare-fun m!1074741 () Bool)

(assert (=> b!1167293 m!1074741))

(declare-fun m!1074743 () Bool)

(assert (=> b!1167293 m!1074743))

(assert (=> b!1167293 m!1074743))

(declare-fun m!1074745 () Bool)

(assert (=> b!1167293 m!1074745))

(declare-fun m!1074747 () Bool)

(assert (=> b!1167293 m!1074747))

(declare-fun m!1074749 () Bool)

(assert (=> b!1167295 m!1074749))

(declare-fun m!1074751 () Bool)

(assert (=> b!1167291 m!1074751))

(declare-fun m!1074753 () Bool)

(assert (=> b!1167290 m!1074753))

(declare-fun m!1074755 () Bool)

(assert (=> b!1167290 m!1074755))

(declare-fun m!1074757 () Bool)

(assert (=> b!1167290 m!1074757))

(declare-fun m!1074759 () Bool)

(assert (=> b!1167290 m!1074759))

(declare-fun m!1074761 () Bool)

(assert (=> b!1167292 m!1074761))

(declare-fun m!1074763 () Bool)

(assert (=> b!1167297 m!1074763))

(declare-fun m!1074765 () Bool)

(assert (=> b!1167297 m!1074765))

(declare-fun m!1074767 () Bool)

(assert (=> b!1167283 m!1074767))

(declare-fun m!1074769 () Bool)

(assert (=> start!99170 m!1074769))

(declare-fun m!1074771 () Bool)

(assert (=> start!99170 m!1074771))

(declare-fun m!1074773 () Bool)

(assert (=> b!1167286 m!1074773))

(check-sat tp_is_empty!29311 (not b!1167287) b_and!40391 (not mapNonEmpty!45791) (not b_next!24781) (not b!1167295) (not b!1167294) (not b!1167291) (not start!99170) (not b!1167292) (not b_lambda!19869) (not b!1167283) (not b!1167297) (not b!1167290) (not b!1167293))
(check-sat b_and!40391 (not b_next!24781))
