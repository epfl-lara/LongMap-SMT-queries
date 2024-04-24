; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99436 () Bool)

(assert start!99436)

(declare-fun b_free!24805 () Bool)

(declare-fun b_next!24805 () Bool)

(assert (=> start!99436 (= b_free!24805 (not b_next!24805))))

(declare-fun tp!87125 () Bool)

(declare-fun b_and!40461 () Bool)

(assert (=> start!99436 (= tp!87125 b_and!40461)))

(declare-fun b!1169260 () Bool)

(declare-fun res!775377 () Bool)

(declare-fun e!664653 () Bool)

(assert (=> b!1169260 (=> (not res!775377) (not e!664653))))

(declare-datatypes ((array!75543 0))(
  ( (array!75544 (arr!36416 (Array (_ BitVec 32) (_ BitVec 64))) (size!36953 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75543)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1169260 (= res!775377 (= (select (arr!36416 _keys!1208) i!673) k0!934))))

(declare-fun res!775372 () Bool)

(assert (=> start!99436 (=> (not res!775372) (not e!664653))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99436 (= res!775372 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36953 _keys!1208))))))

(assert (=> start!99436 e!664653))

(declare-fun tp_is_empty!29335 () Bool)

(assert (=> start!99436 tp_is_empty!29335))

(declare-fun array_inv!27914 (array!75543) Bool)

(assert (=> start!99436 (array_inv!27914 _keys!1208)))

(assert (=> start!99436 true))

(assert (=> start!99436 tp!87125))

(declare-datatypes ((V!44241 0))(
  ( (V!44242 (val!14724 Int)) )
))
(declare-datatypes ((ValueCell!13958 0))(
  ( (ValueCellFull!13958 (v!17357 V!44241)) (EmptyCell!13958) )
))
(declare-datatypes ((array!75545 0))(
  ( (array!75546 (arr!36417 (Array (_ BitVec 32) ValueCell!13958)) (size!36954 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75545)

(declare-fun e!664655 () Bool)

(declare-fun array_inv!27915 (array!75545) Bool)

(assert (=> start!99436 (and (array_inv!27915 _values!996) e!664655)))

(declare-fun b!1169261 () Bool)

(declare-fun res!775380 () Bool)

(assert (=> b!1169261 (=> (not res!775380) (not e!664653))))

(declare-datatypes ((List!25562 0))(
  ( (Nil!25559) (Cons!25558 (h!26776 (_ BitVec 64)) (t!37351 List!25562)) )
))
(declare-fun arrayNoDuplicates!0 (array!75543 (_ BitVec 32) List!25562) Bool)

(assert (=> b!1169261 (= res!775380 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25559))))

(declare-fun b!1169262 () Bool)

(declare-fun res!775376 () Bool)

(assert (=> b!1169262 (=> (not res!775376) (not e!664653))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169262 (= res!775376 (validKeyInArray!0 k0!934))))

(declare-fun b!1169263 () Bool)

(declare-fun res!775378 () Bool)

(declare-fun e!664650 () Bool)

(assert (=> b!1169263 (=> (not res!775378) (not e!664650))))

(declare-fun lt!526326 () array!75543)

(assert (=> b!1169263 (= res!775378 (arrayNoDuplicates!0 lt!526326 #b00000000000000000000000000000000 Nil!25559))))

(declare-fun b!1169264 () Bool)

(declare-fun res!775375 () Bool)

(assert (=> b!1169264 (=> (not res!775375) (not e!664653))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1169264 (= res!775375 (and (= (size!36954 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36953 _keys!1208) (size!36954 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!45827 () Bool)

(declare-fun mapRes!45827 () Bool)

(declare-fun tp!87126 () Bool)

(declare-fun e!664654 () Bool)

(assert (=> mapNonEmpty!45827 (= mapRes!45827 (and tp!87126 e!664654))))

(declare-fun mapKey!45827 () (_ BitVec 32))

(declare-fun mapRest!45827 () (Array (_ BitVec 32) ValueCell!13958))

(declare-fun mapValue!45827 () ValueCell!13958)

(assert (=> mapNonEmpty!45827 (= (arr!36417 _values!996) (store mapRest!45827 mapKey!45827 mapValue!45827))))

(declare-fun mapIsEmpty!45827 () Bool)

(assert (=> mapIsEmpty!45827 mapRes!45827))

(declare-fun b!1169265 () Bool)

(declare-fun e!664656 () Bool)

(declare-fun e!664652 () Bool)

(assert (=> b!1169265 (= e!664656 e!664652)))

(declare-fun res!775382 () Bool)

(assert (=> b!1169265 (=> res!775382 e!664652)))

(assert (=> b!1169265 (= res!775382 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44241)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!526327 () array!75545)

(declare-datatypes ((tuple2!18822 0))(
  ( (tuple2!18823 (_1!9422 (_ BitVec 64)) (_2!9422 V!44241)) )
))
(declare-datatypes ((List!25563 0))(
  ( (Nil!25560) (Cons!25559 (h!26777 tuple2!18822) (t!37352 List!25563)) )
))
(declare-datatypes ((ListLongMap!16799 0))(
  ( (ListLongMap!16800 (toList!8415 List!25563)) )
))
(declare-fun lt!526322 () ListLongMap!16799)

(declare-fun minValue!944 () V!44241)

(declare-fun getCurrentListMapNoExtraKeys!4906 (array!75543 array!75545 (_ BitVec 32) (_ BitVec 32) V!44241 V!44241 (_ BitVec 32) Int) ListLongMap!16799)

(assert (=> b!1169265 (= lt!526322 (getCurrentListMapNoExtraKeys!4906 lt!526326 lt!526327 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2893 (Int (_ BitVec 64)) V!44241)

(assert (=> b!1169265 (= lt!526327 (array!75546 (store (arr!36417 _values!996) i!673 (ValueCellFull!13958 (dynLambda!2893 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36954 _values!996)))))

(declare-fun lt!526323 () ListLongMap!16799)

(assert (=> b!1169265 (= lt!526323 (getCurrentListMapNoExtraKeys!4906 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1169266 () Bool)

(declare-fun res!775373 () Bool)

(assert (=> b!1169266 (=> (not res!775373) (not e!664653))))

(assert (=> b!1169266 (= res!775373 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36953 _keys!1208))))))

(declare-fun b!1169267 () Bool)

(assert (=> b!1169267 (= e!664650 (not e!664656))))

(declare-fun res!775374 () Bool)

(assert (=> b!1169267 (=> res!775374 e!664656)))

(assert (=> b!1169267 (= res!775374 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169267 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38523 0))(
  ( (Unit!38524) )
))
(declare-fun lt!526325 () Unit!38523)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75543 (_ BitVec 64) (_ BitVec 32)) Unit!38523)

(assert (=> b!1169267 (= lt!526325 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169268 () Bool)

(declare-fun res!775379 () Bool)

(assert (=> b!1169268 (=> (not res!775379) (not e!664653))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75543 (_ BitVec 32)) Bool)

(assert (=> b!1169268 (= res!775379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1169269 () Bool)

(declare-fun e!664657 () Bool)

(assert (=> b!1169269 (= e!664657 tp_is_empty!29335)))

(declare-fun b!1169270 () Bool)

(assert (=> b!1169270 (= e!664652 true)))

(declare-fun -!1476 (ListLongMap!16799 (_ BitVec 64)) ListLongMap!16799)

(assert (=> b!1169270 (= (getCurrentListMapNoExtraKeys!4906 lt!526326 lt!526327 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1476 (getCurrentListMapNoExtraKeys!4906 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!526324 () Unit!38523)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!701 (array!75543 array!75545 (_ BitVec 32) (_ BitVec 32) V!44241 V!44241 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38523)

(assert (=> b!1169270 (= lt!526324 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!701 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1169271 () Bool)

(assert (=> b!1169271 (= e!664655 (and e!664657 mapRes!45827))))

(declare-fun condMapEmpty!45827 () Bool)

(declare-fun mapDefault!45827 () ValueCell!13958)

(assert (=> b!1169271 (= condMapEmpty!45827 (= (arr!36417 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13958)) mapDefault!45827)))))

(declare-fun b!1169272 () Bool)

(assert (=> b!1169272 (= e!664653 e!664650)))

(declare-fun res!775381 () Bool)

(assert (=> b!1169272 (=> (not res!775381) (not e!664650))))

(assert (=> b!1169272 (= res!775381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526326 mask!1564))))

(assert (=> b!1169272 (= lt!526326 (array!75544 (store (arr!36416 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36953 _keys!1208)))))

(declare-fun b!1169273 () Bool)

(declare-fun res!775383 () Bool)

(assert (=> b!1169273 (=> (not res!775383) (not e!664653))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169273 (= res!775383 (validMask!0 mask!1564))))

(declare-fun b!1169274 () Bool)

(assert (=> b!1169274 (= e!664654 tp_is_empty!29335)))

(assert (= (and start!99436 res!775372) b!1169273))

(assert (= (and b!1169273 res!775383) b!1169264))

(assert (= (and b!1169264 res!775375) b!1169268))

(assert (= (and b!1169268 res!775379) b!1169261))

(assert (= (and b!1169261 res!775380) b!1169266))

(assert (= (and b!1169266 res!775373) b!1169262))

(assert (= (and b!1169262 res!775376) b!1169260))

(assert (= (and b!1169260 res!775377) b!1169272))

(assert (= (and b!1169272 res!775381) b!1169263))

(assert (= (and b!1169263 res!775378) b!1169267))

(assert (= (and b!1169267 (not res!775374)) b!1169265))

(assert (= (and b!1169265 (not res!775382)) b!1169270))

(assert (= (and b!1169271 condMapEmpty!45827) mapIsEmpty!45827))

(assert (= (and b!1169271 (not condMapEmpty!45827)) mapNonEmpty!45827))

(get-info :version)

(assert (= (and mapNonEmpty!45827 ((_ is ValueCellFull!13958) mapValue!45827)) b!1169274))

(assert (= (and b!1169271 ((_ is ValueCellFull!13958) mapDefault!45827)) b!1169269))

(assert (= start!99436 b!1169271))

(declare-fun b_lambda!19905 () Bool)

(assert (=> (not b_lambda!19905) (not b!1169265)))

(declare-fun t!37350 () Bool)

(declare-fun tb!9609 () Bool)

(assert (=> (and start!99436 (= defaultEntry!1004 defaultEntry!1004) t!37350) tb!9609))

(declare-fun result!19791 () Bool)

(assert (=> tb!9609 (= result!19791 tp_is_empty!29335)))

(assert (=> b!1169265 t!37350))

(declare-fun b_and!40463 () Bool)

(assert (= b_and!40461 (and (=> t!37350 result!19791) b_and!40463)))

(declare-fun m!1077419 () Bool)

(assert (=> start!99436 m!1077419))

(declare-fun m!1077421 () Bool)

(assert (=> start!99436 m!1077421))

(declare-fun m!1077423 () Bool)

(assert (=> b!1169261 m!1077423))

(declare-fun m!1077425 () Bool)

(assert (=> b!1169272 m!1077425))

(declare-fun m!1077427 () Bool)

(assert (=> b!1169272 m!1077427))

(declare-fun m!1077429 () Bool)

(assert (=> b!1169267 m!1077429))

(declare-fun m!1077431 () Bool)

(assert (=> b!1169267 m!1077431))

(declare-fun m!1077433 () Bool)

(assert (=> b!1169263 m!1077433))

(declare-fun m!1077435 () Bool)

(assert (=> b!1169270 m!1077435))

(declare-fun m!1077437 () Bool)

(assert (=> b!1169270 m!1077437))

(assert (=> b!1169270 m!1077437))

(declare-fun m!1077439 () Bool)

(assert (=> b!1169270 m!1077439))

(declare-fun m!1077441 () Bool)

(assert (=> b!1169270 m!1077441))

(declare-fun m!1077443 () Bool)

(assert (=> b!1169260 m!1077443))

(declare-fun m!1077445 () Bool)

(assert (=> b!1169268 m!1077445))

(declare-fun m!1077447 () Bool)

(assert (=> b!1169265 m!1077447))

(declare-fun m!1077449 () Bool)

(assert (=> b!1169265 m!1077449))

(declare-fun m!1077451 () Bool)

(assert (=> b!1169265 m!1077451))

(declare-fun m!1077453 () Bool)

(assert (=> b!1169265 m!1077453))

(declare-fun m!1077455 () Bool)

(assert (=> b!1169262 m!1077455))

(declare-fun m!1077457 () Bool)

(assert (=> mapNonEmpty!45827 m!1077457))

(declare-fun m!1077459 () Bool)

(assert (=> b!1169273 m!1077459))

(check-sat (not b!1169267) b_and!40463 (not b!1169263) (not b!1169265) (not b!1169273) (not b_next!24805) (not b!1169268) (not b!1169272) (not mapNonEmpty!45827) (not b_lambda!19905) (not b!1169261) (not b!1169270) tp_is_empty!29335 (not start!99436) (not b!1169262))
(check-sat b_and!40463 (not b_next!24805))
