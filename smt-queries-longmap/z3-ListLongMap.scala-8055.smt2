; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99172 () Bool)

(assert start!99172)

(declare-fun b_free!24777 () Bool)

(declare-fun b_next!24777 () Bool)

(assert (=> start!99172 (= b_free!24777 (not b_next!24777))))

(declare-fun tp!87041 () Bool)

(declare-fun b_and!40403 () Bool)

(assert (=> start!99172 (= tp!87041 b_and!40403)))

(declare-fun b!1167313 () Bool)

(declare-fun e!663489 () Bool)

(assert (=> b!1167313 (= e!663489 true)))

(declare-datatypes ((V!44203 0))(
  ( (V!44204 (val!14710 Int)) )
))
(declare-fun zeroValue!944 () V!44203)

(declare-datatypes ((array!75443 0))(
  ( (array!75444 (arr!36372 (Array (_ BitVec 32) (_ BitVec 64))) (size!36908 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75443)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13944 0))(
  ( (ValueCellFull!13944 (v!17347 V!44203)) (EmptyCell!13944) )
))
(declare-datatypes ((array!75445 0))(
  ( (array!75446 (arr!36373 (Array (_ BitVec 32) ValueCell!13944)) (size!36909 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75445)

(declare-fun lt!525591 () array!75443)

(declare-fun lt!525589 () array!75445)

(declare-fun minValue!944 () V!44203)

(declare-datatypes ((tuple2!18766 0))(
  ( (tuple2!18767 (_1!9394 (_ BitVec 64)) (_2!9394 V!44203)) )
))
(declare-datatypes ((List!25506 0))(
  ( (Nil!25503) (Cons!25502 (h!26711 tuple2!18766) (t!37275 List!25506)) )
))
(declare-datatypes ((ListLongMap!16735 0))(
  ( (ListLongMap!16736 (toList!8383 List!25506)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4847 (array!75443 array!75445 (_ BitVec 32) (_ BitVec 32) V!44203 V!44203 (_ BitVec 32) Int) ListLongMap!16735)

(declare-fun -!1458 (ListLongMap!16735 (_ BitVec 64)) ListLongMap!16735)

(assert (=> b!1167313 (= (getCurrentListMapNoExtraKeys!4847 lt!525591 lt!525589 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1458 (getCurrentListMapNoExtraKeys!4847 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38518 0))(
  ( (Unit!38519) )
))
(declare-fun lt!525587 () Unit!38518)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!685 (array!75443 array!75445 (_ BitVec 32) (_ BitVec 32) V!44203 V!44203 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38518)

(assert (=> b!1167313 (= lt!525587 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!685 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167314 () Bool)

(declare-fun e!663485 () Bool)

(declare-fun e!663482 () Bool)

(assert (=> b!1167314 (= e!663485 e!663482)))

(declare-fun res!774365 () Bool)

(assert (=> b!1167314 (=> (not res!774365) (not e!663482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75443 (_ BitVec 32)) Bool)

(assert (=> b!1167314 (= res!774365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525591 mask!1564))))

(assert (=> b!1167314 (= lt!525591 (array!75444 (store (arr!36372 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36908 _keys!1208)))))

(declare-fun b!1167315 () Bool)

(declare-fun e!663484 () Bool)

(assert (=> b!1167315 (= e!663482 (not e!663484))))

(declare-fun res!774362 () Bool)

(assert (=> b!1167315 (=> res!774362 e!663484)))

(assert (=> b!1167315 (= res!774362 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167315 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525588 () Unit!38518)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75443 (_ BitVec 64) (_ BitVec 32)) Unit!38518)

(assert (=> b!1167315 (= lt!525588 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1167316 () Bool)

(declare-fun e!663488 () Bool)

(declare-fun tp_is_empty!29307 () Bool)

(assert (=> b!1167316 (= e!663488 tp_is_empty!29307)))

(declare-fun b!1167317 () Bool)

(assert (=> b!1167317 (= e!663484 e!663489)))

(declare-fun res!774361 () Bool)

(assert (=> b!1167317 (=> res!774361 e!663489)))

(assert (=> b!1167317 (= res!774361 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525586 () ListLongMap!16735)

(assert (=> b!1167317 (= lt!525586 (getCurrentListMapNoExtraKeys!4847 lt!525591 lt!525589 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2830 (Int (_ BitVec 64)) V!44203)

(assert (=> b!1167317 (= lt!525589 (array!75446 (store (arr!36373 _values!996) i!673 (ValueCellFull!13944 (dynLambda!2830 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36909 _values!996)))))

(declare-fun lt!525590 () ListLongMap!16735)

(assert (=> b!1167317 (= lt!525590 (getCurrentListMapNoExtraKeys!4847 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167318 () Bool)

(declare-fun res!774363 () Bool)

(assert (=> b!1167318 (=> (not res!774363) (not e!663485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167318 (= res!774363 (validKeyInArray!0 k0!934))))

(declare-fun b!1167319 () Bool)

(declare-fun e!663486 () Bool)

(declare-fun mapRes!45785 () Bool)

(assert (=> b!1167319 (= e!663486 (and e!663488 mapRes!45785))))

(declare-fun condMapEmpty!45785 () Bool)

(declare-fun mapDefault!45785 () ValueCell!13944)

(assert (=> b!1167319 (= condMapEmpty!45785 (= (arr!36373 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13944)) mapDefault!45785)))))

(declare-fun b!1167320 () Bool)

(declare-fun res!774360 () Bool)

(assert (=> b!1167320 (=> (not res!774360) (not e!663485))))

(declare-datatypes ((List!25507 0))(
  ( (Nil!25504) (Cons!25503 (h!26712 (_ BitVec 64)) (t!37276 List!25507)) )
))
(declare-fun arrayNoDuplicates!0 (array!75443 (_ BitVec 32) List!25507) Bool)

(assert (=> b!1167320 (= res!774360 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25504))))

(declare-fun b!1167321 () Bool)

(declare-fun res!774366 () Bool)

(assert (=> b!1167321 (=> (not res!774366) (not e!663485))))

(assert (=> b!1167321 (= res!774366 (= (select (arr!36372 _keys!1208) i!673) k0!934))))

(declare-fun b!1167322 () Bool)

(declare-fun res!774371 () Bool)

(assert (=> b!1167322 (=> (not res!774371) (not e!663485))))

(assert (=> b!1167322 (= res!774371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1167323 () Bool)

(declare-fun res!774368 () Bool)

(assert (=> b!1167323 (=> (not res!774368) (not e!663485))))

(assert (=> b!1167323 (= res!774368 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36908 _keys!1208))))))

(declare-fun b!1167324 () Bool)

(declare-fun res!774369 () Bool)

(assert (=> b!1167324 (=> (not res!774369) (not e!663482))))

(assert (=> b!1167324 (= res!774369 (arrayNoDuplicates!0 lt!525591 #b00000000000000000000000000000000 Nil!25504))))

(declare-fun mapIsEmpty!45785 () Bool)

(assert (=> mapIsEmpty!45785 mapRes!45785))

(declare-fun b!1167325 () Bool)

(declare-fun res!774367 () Bool)

(assert (=> b!1167325 (=> (not res!774367) (not e!663485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167325 (= res!774367 (validMask!0 mask!1564))))

(declare-fun b!1167326 () Bool)

(declare-fun e!663483 () Bool)

(assert (=> b!1167326 (= e!663483 tp_is_empty!29307)))

(declare-fun b!1167327 () Bool)

(declare-fun res!774370 () Bool)

(assert (=> b!1167327 (=> (not res!774370) (not e!663485))))

(assert (=> b!1167327 (= res!774370 (and (= (size!36909 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36908 _keys!1208) (size!36909 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!774364 () Bool)

(assert (=> start!99172 (=> (not res!774364) (not e!663485))))

(assert (=> start!99172 (= res!774364 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36908 _keys!1208))))))

(assert (=> start!99172 e!663485))

(assert (=> start!99172 tp_is_empty!29307))

(declare-fun array_inv!27806 (array!75443) Bool)

(assert (=> start!99172 (array_inv!27806 _keys!1208)))

(assert (=> start!99172 true))

(assert (=> start!99172 tp!87041))

(declare-fun array_inv!27807 (array!75445) Bool)

(assert (=> start!99172 (and (array_inv!27807 _values!996) e!663486)))

(declare-fun mapNonEmpty!45785 () Bool)

(declare-fun tp!87042 () Bool)

(assert (=> mapNonEmpty!45785 (= mapRes!45785 (and tp!87042 e!663483))))

(declare-fun mapKey!45785 () (_ BitVec 32))

(declare-fun mapValue!45785 () ValueCell!13944)

(declare-fun mapRest!45785 () (Array (_ BitVec 32) ValueCell!13944))

(assert (=> mapNonEmpty!45785 (= (arr!36373 _values!996) (store mapRest!45785 mapKey!45785 mapValue!45785))))

(assert (= (and start!99172 res!774364) b!1167325))

(assert (= (and b!1167325 res!774367) b!1167327))

(assert (= (and b!1167327 res!774370) b!1167322))

(assert (= (and b!1167322 res!774371) b!1167320))

(assert (= (and b!1167320 res!774360) b!1167323))

(assert (= (and b!1167323 res!774368) b!1167318))

(assert (= (and b!1167318 res!774363) b!1167321))

(assert (= (and b!1167321 res!774366) b!1167314))

(assert (= (and b!1167314 res!774365) b!1167324))

(assert (= (and b!1167324 res!774369) b!1167315))

(assert (= (and b!1167315 (not res!774362)) b!1167317))

(assert (= (and b!1167317 (not res!774361)) b!1167313))

(assert (= (and b!1167319 condMapEmpty!45785) mapIsEmpty!45785))

(assert (= (and b!1167319 (not condMapEmpty!45785)) mapNonEmpty!45785))

(get-info :version)

(assert (= (and mapNonEmpty!45785 ((_ is ValueCellFull!13944) mapValue!45785)) b!1167326))

(assert (= (and b!1167319 ((_ is ValueCellFull!13944) mapDefault!45785)) b!1167316))

(assert (= start!99172 b!1167319))

(declare-fun b_lambda!19883 () Bool)

(assert (=> (not b_lambda!19883) (not b!1167317)))

(declare-fun t!37274 () Bool)

(declare-fun tb!9589 () Bool)

(assert (=> (and start!99172 (= defaultEntry!1004 defaultEntry!1004) t!37274) tb!9589))

(declare-fun result!19743 () Bool)

(assert (=> tb!9589 (= result!19743 tp_is_empty!29307)))

(assert (=> b!1167317 t!37274))

(declare-fun b_and!40405 () Bool)

(assert (= b_and!40403 (and (=> t!37274 result!19743) b_and!40405)))

(declare-fun m!1075259 () Bool)

(assert (=> b!1167321 m!1075259))

(declare-fun m!1075261 () Bool)

(assert (=> b!1167320 m!1075261))

(declare-fun m!1075263 () Bool)

(assert (=> b!1167325 m!1075263))

(declare-fun m!1075265 () Bool)

(assert (=> b!1167313 m!1075265))

(declare-fun m!1075267 () Bool)

(assert (=> b!1167313 m!1075267))

(assert (=> b!1167313 m!1075267))

(declare-fun m!1075269 () Bool)

(assert (=> b!1167313 m!1075269))

(declare-fun m!1075271 () Bool)

(assert (=> b!1167313 m!1075271))

(declare-fun m!1075273 () Bool)

(assert (=> start!99172 m!1075273))

(declare-fun m!1075275 () Bool)

(assert (=> start!99172 m!1075275))

(declare-fun m!1075277 () Bool)

(assert (=> b!1167315 m!1075277))

(declare-fun m!1075279 () Bool)

(assert (=> b!1167315 m!1075279))

(declare-fun m!1075281 () Bool)

(assert (=> b!1167324 m!1075281))

(declare-fun m!1075283 () Bool)

(assert (=> b!1167317 m!1075283))

(declare-fun m!1075285 () Bool)

(assert (=> b!1167317 m!1075285))

(declare-fun m!1075287 () Bool)

(assert (=> b!1167317 m!1075287))

(declare-fun m!1075289 () Bool)

(assert (=> b!1167317 m!1075289))

(declare-fun m!1075291 () Bool)

(assert (=> mapNonEmpty!45785 m!1075291))

(declare-fun m!1075293 () Bool)

(assert (=> b!1167314 m!1075293))

(declare-fun m!1075295 () Bool)

(assert (=> b!1167314 m!1075295))

(declare-fun m!1075297 () Bool)

(assert (=> b!1167322 m!1075297))

(declare-fun m!1075299 () Bool)

(assert (=> b!1167318 m!1075299))

(check-sat b_and!40405 (not b!1167322) (not b!1167315) (not b!1167314) (not b!1167313) (not b!1167320) (not b!1167318) tp_is_empty!29307 (not b_next!24777) (not b!1167324) (not b_lambda!19883) (not mapNonEmpty!45785) (not b!1167317) (not start!99172) (not b!1167325))
(check-sat b_and!40405 (not b_next!24777))
