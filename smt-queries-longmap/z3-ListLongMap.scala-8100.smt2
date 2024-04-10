; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99468 () Bool)

(assert start!99468)

(declare-fun b_free!25047 () Bool)

(declare-fun b_next!25047 () Bool)

(assert (=> start!99468 (= b_free!25047 (not b_next!25047))))

(declare-fun tp!87854 () Bool)

(declare-fun b_and!40961 () Bool)

(assert (=> start!99468 (= tp!87854 b_and!40961)))

(declare-fun b!1175401 () Bool)

(declare-fun e!668127 () Bool)

(declare-fun e!668126 () Bool)

(assert (=> b!1175401 (= e!668127 (not e!668126))))

(declare-fun res!780626 () Bool)

(assert (=> b!1175401 (=> res!780626 e!668126)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1175401 (= res!780626 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75963 0))(
  ( (array!75964 (arr!36631 (Array (_ BitVec 32) (_ BitVec 64))) (size!37167 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75963)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175401 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38789 0))(
  ( (Unit!38790) )
))
(declare-fun lt!530258 () Unit!38789)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75963 (_ BitVec 64) (_ BitVec 32)) Unit!38789)

(assert (=> b!1175401 (= lt!530258 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46193 () Bool)

(declare-fun mapRes!46193 () Bool)

(assert (=> mapIsEmpty!46193 mapRes!46193))

(declare-fun b!1175402 () Bool)

(declare-fun res!780627 () Bool)

(declare-fun e!668134 () Bool)

(assert (=> b!1175402 (=> (not res!780627) (not e!668134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1175402 (= res!780627 (validKeyInArray!0 k0!934))))

(declare-fun b!1175403 () Bool)

(declare-fun res!780620 () Bool)

(assert (=> b!1175403 (=> (not res!780620) (not e!668134))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44563 0))(
  ( (V!44564 (val!14845 Int)) )
))
(declare-datatypes ((ValueCell!14079 0))(
  ( (ValueCellFull!14079 (v!17483 V!44563)) (EmptyCell!14079) )
))
(declare-datatypes ((array!75965 0))(
  ( (array!75966 (arr!36632 (Array (_ BitVec 32) ValueCell!14079)) (size!37168 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75965)

(assert (=> b!1175403 (= res!780620 (and (= (size!37168 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37167 _keys!1208) (size!37168 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1175404 () Bool)

(declare-fun res!780625 () Bool)

(assert (=> b!1175404 (=> (not res!780625) (not e!668134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1175404 (= res!780625 (validMask!0 mask!1564))))

(declare-fun b!1175405 () Bool)

(declare-fun e!668133 () Bool)

(declare-fun tp_is_empty!29577 () Bool)

(assert (=> b!1175405 (= e!668133 tp_is_empty!29577)))

(declare-fun res!780631 () Bool)

(assert (=> start!99468 (=> (not res!780631) (not e!668134))))

(assert (=> start!99468 (= res!780631 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37167 _keys!1208))))))

(assert (=> start!99468 e!668134))

(assert (=> start!99468 tp_is_empty!29577))

(declare-fun array_inv!27980 (array!75963) Bool)

(assert (=> start!99468 (array_inv!27980 _keys!1208)))

(assert (=> start!99468 true))

(assert (=> start!99468 tp!87854))

(declare-fun e!668129 () Bool)

(declare-fun array_inv!27981 (array!75965) Bool)

(assert (=> start!99468 (and (array_inv!27981 _values!996) e!668129)))

(declare-fun b!1175406 () Bool)

(declare-fun e!668130 () Unit!38789)

(declare-fun Unit!38791 () Unit!38789)

(assert (=> b!1175406 (= e!668130 Unit!38791)))

(declare-fun lt!530260 () Unit!38789)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75963 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38789)

(assert (=> b!1175406 (= lt!530260 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1175406 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530268 () Unit!38789)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75963 (_ BitVec 32) (_ BitVec 32)) Unit!38789)

(assert (=> b!1175406 (= lt!530268 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25720 0))(
  ( (Nil!25717) (Cons!25716 (h!26925 (_ BitVec 64)) (t!37759 List!25720)) )
))
(declare-fun arrayNoDuplicates!0 (array!75963 (_ BitVec 32) List!25720) Bool)

(assert (=> b!1175406 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25717)))

(declare-fun lt!530264 () Unit!38789)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75963 (_ BitVec 64) (_ BitVec 32) List!25720) Unit!38789)

(assert (=> b!1175406 (= lt!530264 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25717))))

(assert (=> b!1175406 false))

(declare-fun b!1175407 () Bool)

(declare-fun Unit!38792 () Unit!38789)

(assert (=> b!1175407 (= e!668130 Unit!38792)))

(declare-fun b!1175408 () Bool)

(declare-fun e!668124 () Bool)

(declare-fun e!668128 () Bool)

(assert (=> b!1175408 (= e!668124 e!668128)))

(declare-fun res!780622 () Bool)

(assert (=> b!1175408 (=> res!780622 e!668128)))

(assert (=> b!1175408 (= res!780622 (not (= (select (arr!36631 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1175409 () Bool)

(assert (=> b!1175409 (= e!668128 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175410 () Bool)

(declare-fun res!780629 () Bool)

(assert (=> b!1175410 (=> (not res!780629) (not e!668134))))

(assert (=> b!1175410 (= res!780629 (= (select (arr!36631 _keys!1208) i!673) k0!934))))

(declare-fun b!1175411 () Bool)

(declare-fun res!780618 () Bool)

(assert (=> b!1175411 (=> (not res!780618) (not e!668134))))

(assert (=> b!1175411 (= res!780618 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37167 _keys!1208))))))

(declare-fun b!1175412 () Bool)

(declare-fun e!668123 () Bool)

(assert (=> b!1175412 (= e!668123 true)))

(assert (=> b!1175412 (not (= (select (arr!36631 _keys!1208) from!1455) k0!934))))

(declare-fun lt!530257 () Unit!38789)

(assert (=> b!1175412 (= lt!530257 e!668130)))

(declare-fun c!116694 () Bool)

(assert (=> b!1175412 (= c!116694 (= (select (arr!36631 _keys!1208) from!1455) k0!934))))

(assert (=> b!1175412 e!668124))

(declare-fun res!780619 () Bool)

(assert (=> b!1175412 (=> (not res!780619) (not e!668124))))

(declare-fun lt!530265 () V!44563)

(declare-datatypes ((tuple2!18982 0))(
  ( (tuple2!18983 (_1!9502 (_ BitVec 64)) (_2!9502 V!44563)) )
))
(declare-datatypes ((List!25721 0))(
  ( (Nil!25718) (Cons!25717 (h!26926 tuple2!18982) (t!37760 List!25721)) )
))
(declare-datatypes ((ListLongMap!16951 0))(
  ( (ListLongMap!16952 (toList!8491 List!25721)) )
))
(declare-fun lt!530256 () ListLongMap!16951)

(declare-fun lt!530266 () ListLongMap!16951)

(declare-fun +!3807 (ListLongMap!16951 tuple2!18982) ListLongMap!16951)

(declare-fun get!18703 (ValueCell!14079 V!44563) V!44563)

(assert (=> b!1175412 (= res!780619 (= lt!530256 (+!3807 lt!530266 (tuple2!18983 (select (arr!36631 _keys!1208) from!1455) (get!18703 (select (arr!36632 _values!996) from!1455) lt!530265)))))))

(declare-fun b!1175413 () Bool)

(assert (=> b!1175413 (= e!668129 (and e!668133 mapRes!46193))))

(declare-fun condMapEmpty!46193 () Bool)

(declare-fun mapDefault!46193 () ValueCell!14079)

(assert (=> b!1175413 (= condMapEmpty!46193 (= (arr!36632 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14079)) mapDefault!46193)))))

(declare-fun b!1175414 () Bool)

(declare-fun res!780630 () Bool)

(assert (=> b!1175414 (=> (not res!780630) (not e!668127))))

(declare-fun lt!530262 () array!75963)

(assert (=> b!1175414 (= res!780630 (arrayNoDuplicates!0 lt!530262 #b00000000000000000000000000000000 Nil!25717))))

(declare-fun mapNonEmpty!46193 () Bool)

(declare-fun tp!87855 () Bool)

(declare-fun e!668132 () Bool)

(assert (=> mapNonEmpty!46193 (= mapRes!46193 (and tp!87855 e!668132))))

(declare-fun mapRest!46193 () (Array (_ BitVec 32) ValueCell!14079))

(declare-fun mapKey!46193 () (_ BitVec 32))

(declare-fun mapValue!46193 () ValueCell!14079)

(assert (=> mapNonEmpty!46193 (= (arr!36632 _values!996) (store mapRest!46193 mapKey!46193 mapValue!46193))))

(declare-fun b!1175415 () Bool)

(declare-fun res!780628 () Bool)

(assert (=> b!1175415 (=> (not res!780628) (not e!668134))))

(assert (=> b!1175415 (= res!780628 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25717))))

(declare-fun b!1175416 () Bool)

(declare-fun e!668125 () Bool)

(assert (=> b!1175416 (= e!668125 e!668123)))

(declare-fun res!780624 () Bool)

(assert (=> b!1175416 (=> res!780624 e!668123)))

(assert (=> b!1175416 (= res!780624 (not (validKeyInArray!0 (select (arr!36631 _keys!1208) from!1455))))))

(declare-fun lt!530261 () ListLongMap!16951)

(assert (=> b!1175416 (= lt!530261 lt!530266)))

(declare-fun lt!530263 () ListLongMap!16951)

(declare-fun -!1547 (ListLongMap!16951 (_ BitVec 64)) ListLongMap!16951)

(assert (=> b!1175416 (= lt!530266 (-!1547 lt!530263 k0!934))))

(declare-fun zeroValue!944 () V!44563)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!530267 () array!75965)

(declare-fun minValue!944 () V!44563)

(declare-fun getCurrentListMapNoExtraKeys!4951 (array!75963 array!75965 (_ BitVec 32) (_ BitVec 32) V!44563 V!44563 (_ BitVec 32) Int) ListLongMap!16951)

(assert (=> b!1175416 (= lt!530261 (getCurrentListMapNoExtraKeys!4951 lt!530262 lt!530267 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1175416 (= lt!530263 (getCurrentListMapNoExtraKeys!4951 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!530259 () Unit!38789)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!774 (array!75963 array!75965 (_ BitVec 32) (_ BitVec 32) V!44563 V!44563 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38789)

(assert (=> b!1175416 (= lt!530259 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!774 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1175417 () Bool)

(assert (=> b!1175417 (= e!668132 tp_is_empty!29577)))

(declare-fun b!1175418 () Bool)

(declare-fun res!780617 () Bool)

(assert (=> b!1175418 (=> (not res!780617) (not e!668134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75963 (_ BitVec 32)) Bool)

(assert (=> b!1175418 (= res!780617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1175419 () Bool)

(assert (=> b!1175419 (= e!668134 e!668127)))

(declare-fun res!780623 () Bool)

(assert (=> b!1175419 (=> (not res!780623) (not e!668127))))

(assert (=> b!1175419 (= res!780623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530262 mask!1564))))

(assert (=> b!1175419 (= lt!530262 (array!75964 (store (arr!36631 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37167 _keys!1208)))))

(declare-fun b!1175420 () Bool)

(assert (=> b!1175420 (= e!668126 e!668125)))

(declare-fun res!780621 () Bool)

(assert (=> b!1175420 (=> res!780621 e!668125)))

(assert (=> b!1175420 (= res!780621 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1175420 (= lt!530256 (getCurrentListMapNoExtraKeys!4951 lt!530262 lt!530267 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1175420 (= lt!530267 (array!75966 (store (arr!36632 _values!996) i!673 (ValueCellFull!14079 lt!530265)) (size!37168 _values!996)))))

(declare-fun dynLambda!2917 (Int (_ BitVec 64)) V!44563)

(assert (=> b!1175420 (= lt!530265 (dynLambda!2917 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530255 () ListLongMap!16951)

(assert (=> b!1175420 (= lt!530255 (getCurrentListMapNoExtraKeys!4951 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!99468 res!780631) b!1175404))

(assert (= (and b!1175404 res!780625) b!1175403))

(assert (= (and b!1175403 res!780620) b!1175418))

(assert (= (and b!1175418 res!780617) b!1175415))

(assert (= (and b!1175415 res!780628) b!1175411))

(assert (= (and b!1175411 res!780618) b!1175402))

(assert (= (and b!1175402 res!780627) b!1175410))

(assert (= (and b!1175410 res!780629) b!1175419))

(assert (= (and b!1175419 res!780623) b!1175414))

(assert (= (and b!1175414 res!780630) b!1175401))

(assert (= (and b!1175401 (not res!780626)) b!1175420))

(assert (= (and b!1175420 (not res!780621)) b!1175416))

(assert (= (and b!1175416 (not res!780624)) b!1175412))

(assert (= (and b!1175412 res!780619) b!1175408))

(assert (= (and b!1175408 (not res!780622)) b!1175409))

(assert (= (and b!1175412 c!116694) b!1175406))

(assert (= (and b!1175412 (not c!116694)) b!1175407))

(assert (= (and b!1175413 condMapEmpty!46193) mapIsEmpty!46193))

(assert (= (and b!1175413 (not condMapEmpty!46193)) mapNonEmpty!46193))

(get-info :version)

(assert (= (and mapNonEmpty!46193 ((_ is ValueCellFull!14079) mapValue!46193)) b!1175417))

(assert (= (and b!1175413 ((_ is ValueCellFull!14079) mapDefault!46193)) b!1175405))

(assert (= start!99468 b!1175413))

(declare-fun b_lambda!20191 () Bool)

(assert (=> (not b_lambda!20191) (not b!1175420)))

(declare-fun t!37758 () Bool)

(declare-fun tb!9859 () Bool)

(assert (=> (and start!99468 (= defaultEntry!1004 defaultEntry!1004) t!37758) tb!9859))

(declare-fun result!20285 () Bool)

(assert (=> tb!9859 (= result!20285 tp_is_empty!29577)))

(assert (=> b!1175420 t!37758))

(declare-fun b_and!40963 () Bool)

(assert (= b_and!40961 (and (=> t!37758 result!20285) b_and!40963)))

(declare-fun m!1083307 () Bool)

(assert (=> b!1175419 m!1083307))

(declare-fun m!1083309 () Bool)

(assert (=> b!1175419 m!1083309))

(declare-fun m!1083311 () Bool)

(assert (=> b!1175402 m!1083311))

(declare-fun m!1083313 () Bool)

(assert (=> b!1175416 m!1083313))

(declare-fun m!1083315 () Bool)

(assert (=> b!1175416 m!1083315))

(declare-fun m!1083317 () Bool)

(assert (=> b!1175416 m!1083317))

(declare-fun m!1083319 () Bool)

(assert (=> b!1175416 m!1083319))

(declare-fun m!1083321 () Bool)

(assert (=> b!1175416 m!1083321))

(assert (=> b!1175416 m!1083319))

(declare-fun m!1083323 () Bool)

(assert (=> b!1175416 m!1083323))

(declare-fun m!1083325 () Bool)

(assert (=> start!99468 m!1083325))

(declare-fun m!1083327 () Bool)

(assert (=> start!99468 m!1083327))

(assert (=> b!1175412 m!1083319))

(declare-fun m!1083329 () Bool)

(assert (=> b!1175412 m!1083329))

(assert (=> b!1175412 m!1083329))

(declare-fun m!1083331 () Bool)

(assert (=> b!1175412 m!1083331))

(declare-fun m!1083333 () Bool)

(assert (=> b!1175412 m!1083333))

(assert (=> b!1175408 m!1083319))

(declare-fun m!1083335 () Bool)

(assert (=> mapNonEmpty!46193 m!1083335))

(declare-fun m!1083337 () Bool)

(assert (=> b!1175415 m!1083337))

(declare-fun m!1083339 () Bool)

(assert (=> b!1175410 m!1083339))

(declare-fun m!1083341 () Bool)

(assert (=> b!1175406 m!1083341))

(declare-fun m!1083343 () Bool)

(assert (=> b!1175406 m!1083343))

(declare-fun m!1083345 () Bool)

(assert (=> b!1175406 m!1083345))

(declare-fun m!1083347 () Bool)

(assert (=> b!1175406 m!1083347))

(declare-fun m!1083349 () Bool)

(assert (=> b!1175406 m!1083349))

(declare-fun m!1083351 () Bool)

(assert (=> b!1175420 m!1083351))

(declare-fun m!1083353 () Bool)

(assert (=> b!1175420 m!1083353))

(declare-fun m!1083355 () Bool)

(assert (=> b!1175420 m!1083355))

(declare-fun m!1083357 () Bool)

(assert (=> b!1175420 m!1083357))

(declare-fun m!1083359 () Bool)

(assert (=> b!1175409 m!1083359))

(declare-fun m!1083361 () Bool)

(assert (=> b!1175414 m!1083361))

(declare-fun m!1083363 () Bool)

(assert (=> b!1175404 m!1083363))

(declare-fun m!1083365 () Bool)

(assert (=> b!1175401 m!1083365))

(declare-fun m!1083367 () Bool)

(assert (=> b!1175401 m!1083367))

(declare-fun m!1083369 () Bool)

(assert (=> b!1175418 m!1083369))

(check-sat (not b!1175418) (not b!1175419) (not start!99468) (not b!1175409) (not b!1175416) (not b_lambda!20191) tp_is_empty!29577 (not mapNonEmpty!46193) (not b_next!25047) (not b!1175415) (not b!1175414) (not b!1175401) (not b!1175406) (not b!1175402) b_and!40963 (not b!1175420) (not b!1175404) (not b!1175412))
(check-sat b_and!40963 (not b_next!25047))
