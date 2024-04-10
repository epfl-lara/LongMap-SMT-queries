; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99220 () Bool)

(assert start!99220)

(declare-fun b_free!24825 () Bool)

(declare-fun b_next!24825 () Bool)

(assert (=> start!99220 (= b_free!24825 (not b_next!24825))))

(declare-fun tp!87185 () Bool)

(declare-fun b_and!40499 () Bool)

(assert (=> start!99220 (= tp!87185 b_and!40499)))

(declare-fun b!1168455 () Bool)

(declare-fun e!664079 () Bool)

(declare-fun tp_is_empty!29355 () Bool)

(assert (=> b!1168455 (= e!664079 tp_is_empty!29355)))

(declare-fun res!775240 () Bool)

(declare-fun e!664076 () Bool)

(assert (=> start!99220 (=> (not res!775240) (not e!664076))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75531 0))(
  ( (array!75532 (arr!36416 (Array (_ BitVec 32) (_ BitVec 64))) (size!36952 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75531)

(assert (=> start!99220 (= res!775240 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36952 _keys!1208))))))

(assert (=> start!99220 e!664076))

(assert (=> start!99220 tp_is_empty!29355))

(declare-fun array_inv!27836 (array!75531) Bool)

(assert (=> start!99220 (array_inv!27836 _keys!1208)))

(assert (=> start!99220 true))

(assert (=> start!99220 tp!87185))

(declare-datatypes ((V!44267 0))(
  ( (V!44268 (val!14734 Int)) )
))
(declare-datatypes ((ValueCell!13968 0))(
  ( (ValueCellFull!13968 (v!17371 V!44267)) (EmptyCell!13968) )
))
(declare-datatypes ((array!75533 0))(
  ( (array!75534 (arr!36417 (Array (_ BitVec 32) ValueCell!13968)) (size!36953 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75533)

(declare-fun e!664078 () Bool)

(declare-fun array_inv!27837 (array!75533) Bool)

(assert (=> start!99220 (and (array_inv!27837 _values!996) e!664078)))

(declare-fun b!1168456 () Bool)

(declare-fun e!664074 () Bool)

(declare-fun e!664080 () Bool)

(assert (=> b!1168456 (= e!664074 e!664080)))

(declare-fun res!775244 () Bool)

(assert (=> b!1168456 (=> res!775244 e!664080)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168456 (= res!775244 (not (validKeyInArray!0 (select (arr!36416 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18804 0))(
  ( (tuple2!18805 (_1!9413 (_ BitVec 64)) (_2!9413 V!44267)) )
))
(declare-datatypes ((List!25544 0))(
  ( (Nil!25541) (Cons!25540 (h!26749 tuple2!18804) (t!37361 List!25544)) )
))
(declare-datatypes ((ListLongMap!16773 0))(
  ( (ListLongMap!16774 (toList!8402 List!25544)) )
))
(declare-fun lt!526043 () ListLongMap!16773)

(declare-fun lt!526044 () ListLongMap!16773)

(assert (=> b!1168456 (= lt!526043 lt!526044)))

(declare-fun lt!526047 () ListLongMap!16773)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1474 (ListLongMap!16773 (_ BitVec 64)) ListLongMap!16773)

(assert (=> b!1168456 (= lt!526044 (-!1474 lt!526047 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!526040 () array!75531)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!526038 () array!75533)

(declare-fun minValue!944 () V!44267)

(declare-fun zeroValue!944 () V!44267)

(declare-fun getCurrentListMapNoExtraKeys!4866 (array!75531 array!75533 (_ BitVec 32) (_ BitVec 32) V!44267 V!44267 (_ BitVec 32) Int) ListLongMap!16773)

(assert (=> b!1168456 (= lt!526043 (getCurrentListMapNoExtraKeys!4866 lt!526040 lt!526038 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1168456 (= lt!526047 (getCurrentListMapNoExtraKeys!4866 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38556 0))(
  ( (Unit!38557) )
))
(declare-fun lt!526045 () Unit!38556)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!701 (array!75531 array!75533 (_ BitVec 32) (_ BitVec 32) V!44267 V!44267 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38556)

(assert (=> b!1168456 (= lt!526045 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!701 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168457 () Bool)

(declare-fun res!775249 () Bool)

(assert (=> b!1168457 (=> (not res!775249) (not e!664076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75531 (_ BitVec 32)) Bool)

(assert (=> b!1168457 (= res!775249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1168458 () Bool)

(declare-fun res!775243 () Bool)

(assert (=> b!1168458 (=> (not res!775243) (not e!664076))))

(assert (=> b!1168458 (= res!775243 (= (select (arr!36416 _keys!1208) i!673) k0!934))))

(declare-fun b!1168459 () Bool)

(declare-fun e!664075 () Bool)

(assert (=> b!1168459 (= e!664075 e!664074)))

(declare-fun res!775246 () Bool)

(assert (=> b!1168459 (=> res!775246 e!664074)))

(assert (=> b!1168459 (= res!775246 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!526041 () ListLongMap!16773)

(assert (=> b!1168459 (= lt!526041 (getCurrentListMapNoExtraKeys!4866 lt!526040 lt!526038 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!526039 () V!44267)

(assert (=> b!1168459 (= lt!526038 (array!75534 (store (arr!36417 _values!996) i!673 (ValueCellFull!13968 lt!526039)) (size!36953 _values!996)))))

(declare-fun dynLambda!2847 (Int (_ BitVec 64)) V!44267)

(assert (=> b!1168459 (= lt!526039 (dynLambda!2847 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526042 () ListLongMap!16773)

(assert (=> b!1168459 (= lt!526042 (getCurrentListMapNoExtraKeys!4866 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168460 () Bool)

(declare-fun res!775247 () Bool)

(declare-fun e!664077 () Bool)

(assert (=> b!1168460 (=> (not res!775247) (not e!664077))))

(declare-datatypes ((List!25545 0))(
  ( (Nil!25542) (Cons!25541 (h!26750 (_ BitVec 64)) (t!37362 List!25545)) )
))
(declare-fun arrayNoDuplicates!0 (array!75531 (_ BitVec 32) List!25545) Bool)

(assert (=> b!1168460 (= res!775247 (arrayNoDuplicates!0 lt!526040 #b00000000000000000000000000000000 Nil!25542))))

(declare-fun b!1168461 () Bool)

(assert (=> b!1168461 (= e!664077 (not e!664075))))

(declare-fun res!775241 () Bool)

(assert (=> b!1168461 (=> res!775241 e!664075)))

(assert (=> b!1168461 (= res!775241 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168461 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!526046 () Unit!38556)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75531 (_ BitVec 64) (_ BitVec 32)) Unit!38556)

(assert (=> b!1168461 (= lt!526046 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1168462 () Bool)

(declare-fun res!775239 () Bool)

(assert (=> b!1168462 (=> (not res!775239) (not e!664076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168462 (= res!775239 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!45857 () Bool)

(declare-fun mapRes!45857 () Bool)

(declare-fun tp!87186 () Bool)

(assert (=> mapNonEmpty!45857 (= mapRes!45857 (and tp!87186 e!664079))))

(declare-fun mapRest!45857 () (Array (_ BitVec 32) ValueCell!13968))

(declare-fun mapKey!45857 () (_ BitVec 32))

(declare-fun mapValue!45857 () ValueCell!13968)

(assert (=> mapNonEmpty!45857 (= (arr!36417 _values!996) (store mapRest!45857 mapKey!45857 mapValue!45857))))

(declare-fun mapIsEmpty!45857 () Bool)

(assert (=> mapIsEmpty!45857 mapRes!45857))

(declare-fun b!1168463 () Bool)

(assert (=> b!1168463 (= e!664080 true)))

(declare-fun +!3738 (ListLongMap!16773 tuple2!18804) ListLongMap!16773)

(declare-fun get!18558 (ValueCell!13968 V!44267) V!44267)

(assert (=> b!1168463 (= lt!526041 (+!3738 lt!526044 (tuple2!18805 (select (arr!36416 _keys!1208) from!1455) (get!18558 (select (arr!36417 _values!996) from!1455) lt!526039))))))

(declare-fun b!1168464 () Bool)

(declare-fun res!775245 () Bool)

(assert (=> b!1168464 (=> (not res!775245) (not e!664076))))

(assert (=> b!1168464 (= res!775245 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25542))))

(declare-fun b!1168465 () Bool)

(declare-fun res!775238 () Bool)

(assert (=> b!1168465 (=> (not res!775238) (not e!664076))))

(assert (=> b!1168465 (= res!775238 (validKeyInArray!0 k0!934))))

(declare-fun b!1168466 () Bool)

(assert (=> b!1168466 (= e!664076 e!664077)))

(declare-fun res!775242 () Bool)

(assert (=> b!1168466 (=> (not res!775242) (not e!664077))))

(assert (=> b!1168466 (= res!775242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526040 mask!1564))))

(assert (=> b!1168466 (= lt!526040 (array!75532 (store (arr!36416 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36952 _keys!1208)))))

(declare-fun b!1168467 () Bool)

(declare-fun res!775248 () Bool)

(assert (=> b!1168467 (=> (not res!775248) (not e!664076))))

(assert (=> b!1168467 (= res!775248 (and (= (size!36953 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36952 _keys!1208) (size!36953 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168468 () Bool)

(declare-fun e!664073 () Bool)

(assert (=> b!1168468 (= e!664073 tp_is_empty!29355)))

(declare-fun b!1168469 () Bool)

(assert (=> b!1168469 (= e!664078 (and e!664073 mapRes!45857))))

(declare-fun condMapEmpty!45857 () Bool)

(declare-fun mapDefault!45857 () ValueCell!13968)

(assert (=> b!1168469 (= condMapEmpty!45857 (= (arr!36417 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13968)) mapDefault!45857)))))

(declare-fun b!1168470 () Bool)

(declare-fun res!775250 () Bool)

(assert (=> b!1168470 (=> (not res!775250) (not e!664076))))

(assert (=> b!1168470 (= res!775250 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36952 _keys!1208))))))

(assert (= (and start!99220 res!775240) b!1168462))

(assert (= (and b!1168462 res!775239) b!1168467))

(assert (= (and b!1168467 res!775248) b!1168457))

(assert (= (and b!1168457 res!775249) b!1168464))

(assert (= (and b!1168464 res!775245) b!1168470))

(assert (= (and b!1168470 res!775250) b!1168465))

(assert (= (and b!1168465 res!775238) b!1168458))

(assert (= (and b!1168458 res!775243) b!1168466))

(assert (= (and b!1168466 res!775242) b!1168460))

(assert (= (and b!1168460 res!775247) b!1168461))

(assert (= (and b!1168461 (not res!775241)) b!1168459))

(assert (= (and b!1168459 (not res!775246)) b!1168456))

(assert (= (and b!1168456 (not res!775244)) b!1168463))

(assert (= (and b!1168469 condMapEmpty!45857) mapIsEmpty!45857))

(assert (= (and b!1168469 (not condMapEmpty!45857)) mapNonEmpty!45857))

(get-info :version)

(assert (= (and mapNonEmpty!45857 ((_ is ValueCellFull!13968) mapValue!45857)) b!1168455))

(assert (= (and b!1168469 ((_ is ValueCellFull!13968) mapDefault!45857)) b!1168468))

(assert (= start!99220 b!1168469))

(declare-fun b_lambda!19931 () Bool)

(assert (=> (not b_lambda!19931) (not b!1168459)))

(declare-fun t!37360 () Bool)

(declare-fun tb!9637 () Bool)

(assert (=> (and start!99220 (= defaultEntry!1004 defaultEntry!1004) t!37360) tb!9637))

(declare-fun result!19839 () Bool)

(assert (=> tb!9637 (= result!19839 tp_is_empty!29355)))

(assert (=> b!1168459 t!37360))

(declare-fun b_and!40501 () Bool)

(assert (= b_and!40499 (and (=> t!37360 result!19839) b_and!40501)))

(declare-fun m!1076289 () Bool)

(assert (=> b!1168460 m!1076289))

(declare-fun m!1076291 () Bool)

(assert (=> b!1168466 m!1076291))

(declare-fun m!1076293 () Bool)

(assert (=> b!1168466 m!1076293))

(declare-fun m!1076295 () Bool)

(assert (=> b!1168458 m!1076295))

(declare-fun m!1076297 () Bool)

(assert (=> b!1168464 m!1076297))

(declare-fun m!1076299 () Bool)

(assert (=> b!1168457 m!1076299))

(declare-fun m!1076301 () Bool)

(assert (=> mapNonEmpty!45857 m!1076301))

(declare-fun m!1076303 () Bool)

(assert (=> b!1168462 m!1076303))

(declare-fun m!1076305 () Bool)

(assert (=> b!1168465 m!1076305))

(declare-fun m!1076307 () Bool)

(assert (=> b!1168463 m!1076307))

(declare-fun m!1076309 () Bool)

(assert (=> b!1168463 m!1076309))

(assert (=> b!1168463 m!1076309))

(declare-fun m!1076311 () Bool)

(assert (=> b!1168463 m!1076311))

(declare-fun m!1076313 () Bool)

(assert (=> b!1168463 m!1076313))

(declare-fun m!1076315 () Bool)

(assert (=> b!1168459 m!1076315))

(declare-fun m!1076317 () Bool)

(assert (=> b!1168459 m!1076317))

(declare-fun m!1076319 () Bool)

(assert (=> b!1168459 m!1076319))

(declare-fun m!1076321 () Bool)

(assert (=> b!1168459 m!1076321))

(declare-fun m!1076323 () Bool)

(assert (=> b!1168461 m!1076323))

(declare-fun m!1076325 () Bool)

(assert (=> b!1168461 m!1076325))

(declare-fun m!1076327 () Bool)

(assert (=> start!99220 m!1076327))

(declare-fun m!1076329 () Bool)

(assert (=> start!99220 m!1076329))

(declare-fun m!1076331 () Bool)

(assert (=> b!1168456 m!1076331))

(declare-fun m!1076333 () Bool)

(assert (=> b!1168456 m!1076333))

(declare-fun m!1076335 () Bool)

(assert (=> b!1168456 m!1076335))

(declare-fun m!1076337 () Bool)

(assert (=> b!1168456 m!1076337))

(assert (=> b!1168456 m!1076307))

(declare-fun m!1076339 () Bool)

(assert (=> b!1168456 m!1076339))

(assert (=> b!1168456 m!1076307))

(check-sat (not b_lambda!19931) b_and!40501 (not b!1168456) (not b!1168457) (not b_next!24825) (not b!1168461) (not b!1168466) (not b!1168465) (not mapNonEmpty!45857) (not b!1168459) tp_is_empty!29355 (not b!1168462) (not b!1168463) (not b!1168460) (not start!99220) (not b!1168464))
(check-sat b_and!40501 (not b_next!24825))
