; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99498 () Bool)

(assert start!99498)

(declare-fun b_free!25077 () Bool)

(declare-fun b_next!25077 () Bool)

(assert (=> start!99498 (= b_free!25077 (not b_next!25077))))

(declare-fun tp!87945 () Bool)

(declare-fun b_and!41021 () Bool)

(assert (=> start!99498 (= tp!87945 b_and!41021)))

(declare-fun b!1176345 () Bool)

(declare-fun e!668679 () Bool)

(assert (=> b!1176345 (= e!668679 true)))

(declare-fun e!668681 () Bool)

(assert (=> b!1176345 e!668681))

(declare-fun res!781310 () Bool)

(assert (=> b!1176345 (=> (not res!781310) (not e!668681))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76021 0))(
  ( (array!76022 (arr!36660 (Array (_ BitVec 32) (_ BitVec 64))) (size!37196 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76021)

(assert (=> b!1176345 (= res!781310 (not (= (select (arr!36660 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!38831 0))(
  ( (Unit!38832) )
))
(declare-fun lt!530913 () Unit!38831)

(declare-fun e!668687 () Unit!38831)

(assert (=> b!1176345 (= lt!530913 e!668687)))

(declare-fun c!116739 () Bool)

(assert (=> b!1176345 (= c!116739 (= (select (arr!36660 _keys!1208) from!1455) k0!934))))

(declare-fun e!668684 () Bool)

(assert (=> b!1176345 e!668684))

(declare-fun res!781312 () Bool)

(assert (=> b!1176345 (=> (not res!781312) (not e!668684))))

(declare-datatypes ((V!44603 0))(
  ( (V!44604 (val!14860 Int)) )
))
(declare-datatypes ((tuple2!19002 0))(
  ( (tuple2!19003 (_1!9512 (_ BitVec 64)) (_2!9512 V!44603)) )
))
(declare-fun lt!530907 () tuple2!19002)

(declare-datatypes ((List!25740 0))(
  ( (Nil!25737) (Cons!25736 (h!26945 tuple2!19002) (t!37809 List!25740)) )
))
(declare-datatypes ((ListLongMap!16971 0))(
  ( (ListLongMap!16972 (toList!8501 List!25740)) )
))
(declare-fun lt!530901 () ListLongMap!16971)

(declare-fun lt!530910 () ListLongMap!16971)

(declare-fun +!3817 (ListLongMap!16971 tuple2!19002) ListLongMap!16971)

(assert (=> b!1176345 (= res!781312 (= lt!530910 (+!3817 lt!530901 lt!530907)))))

(declare-fun lt!530912 () V!44603)

(declare-datatypes ((ValueCell!14094 0))(
  ( (ValueCellFull!14094 (v!17498 V!44603)) (EmptyCell!14094) )
))
(declare-datatypes ((array!76023 0))(
  ( (array!76024 (arr!36661 (Array (_ BitVec 32) ValueCell!14094)) (size!37197 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76023)

(declare-fun get!18723 (ValueCell!14094 V!44603) V!44603)

(assert (=> b!1176345 (= lt!530907 (tuple2!19003 (select (arr!36660 _keys!1208) from!1455) (get!18723 (select (arr!36661 _values!996) from!1455) lt!530912)))))

(declare-fun b!1176346 () Bool)

(declare-fun Unit!38833 () Unit!38831)

(assert (=> b!1176346 (= e!668687 Unit!38833)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!530905 () Unit!38831)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76021 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38831)

(assert (=> b!1176346 (= lt!530905 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1176346 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530911 () Unit!38831)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76021 (_ BitVec 32) (_ BitVec 32)) Unit!38831)

(assert (=> b!1176346 (= lt!530911 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25741 0))(
  ( (Nil!25738) (Cons!25737 (h!26946 (_ BitVec 64)) (t!37810 List!25741)) )
))
(declare-fun arrayNoDuplicates!0 (array!76021 (_ BitVec 32) List!25741) Bool)

(assert (=> b!1176346 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25738)))

(declare-fun lt!530906 () Unit!38831)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76021 (_ BitVec 64) (_ BitVec 32) List!25741) Unit!38831)

(assert (=> b!1176346 (= lt!530906 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25738))))

(assert (=> b!1176346 false))

(declare-fun b!1176347 () Bool)

(declare-fun e!668682 () Bool)

(declare-fun e!668686 () Bool)

(declare-fun mapRes!46238 () Bool)

(assert (=> b!1176347 (= e!668682 (and e!668686 mapRes!46238))))

(declare-fun condMapEmpty!46238 () Bool)

(declare-fun mapDefault!46238 () ValueCell!14094)

(assert (=> b!1176347 (= condMapEmpty!46238 (= (arr!36661 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14094)) mapDefault!46238)))))

(declare-fun b!1176348 () Bool)

(declare-fun res!781314 () Bool)

(declare-fun e!668688 () Bool)

(assert (=> b!1176348 (=> (not res!781314) (not e!668688))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1176348 (= res!781314 (and (= (size!37197 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37196 _keys!1208) (size!37197 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!781317 () Bool)

(assert (=> start!99498 (=> (not res!781317) (not e!668688))))

(assert (=> start!99498 (= res!781317 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37196 _keys!1208))))))

(assert (=> start!99498 e!668688))

(declare-fun tp_is_empty!29607 () Bool)

(assert (=> start!99498 tp_is_empty!29607))

(declare-fun array_inv!27998 (array!76021) Bool)

(assert (=> start!99498 (array_inv!27998 _keys!1208)))

(assert (=> start!99498 true))

(assert (=> start!99498 tp!87945))

(declare-fun array_inv!27999 (array!76023) Bool)

(assert (=> start!99498 (and (array_inv!27999 _values!996) e!668682)))

(declare-fun b!1176349 () Bool)

(declare-fun e!668678 () Bool)

(assert (=> b!1176349 (= e!668678 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176350 () Bool)

(declare-fun e!668689 () Bool)

(assert (=> b!1176350 (= e!668688 e!668689)))

(declare-fun res!781319 () Bool)

(assert (=> b!1176350 (=> (not res!781319) (not e!668689))))

(declare-fun lt!530899 () array!76021)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76021 (_ BitVec 32)) Bool)

(assert (=> b!1176350 (= res!781319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530899 mask!1564))))

(assert (=> b!1176350 (= lt!530899 (array!76022 (store (arr!36660 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37196 _keys!1208)))))

(declare-fun b!1176351 () Bool)

(declare-fun e!668677 () Bool)

(assert (=> b!1176351 (= e!668677 tp_is_empty!29607)))

(declare-fun b!1176352 () Bool)

(assert (=> b!1176352 (= e!668684 e!668678)))

(declare-fun res!781313 () Bool)

(assert (=> b!1176352 (=> res!781313 e!668678)))

(assert (=> b!1176352 (= res!781313 (not (= (select (arr!36660 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1176353 () Bool)

(declare-fun e!668680 () Bool)

(declare-fun e!668685 () Bool)

(assert (=> b!1176353 (= e!668680 e!668685)))

(declare-fun res!781316 () Bool)

(assert (=> b!1176353 (=> res!781316 e!668685)))

(assert (=> b!1176353 (= res!781316 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44603)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!530900 () array!76023)

(declare-fun minValue!944 () V!44603)

(declare-fun getCurrentListMapNoExtraKeys!4960 (array!76021 array!76023 (_ BitVec 32) (_ BitVec 32) V!44603 V!44603 (_ BitVec 32) Int) ListLongMap!16971)

(assert (=> b!1176353 (= lt!530910 (getCurrentListMapNoExtraKeys!4960 lt!530899 lt!530900 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1176353 (= lt!530900 (array!76024 (store (arr!36661 _values!996) i!673 (ValueCellFull!14094 lt!530912)) (size!37197 _values!996)))))

(declare-fun dynLambda!2925 (Int (_ BitVec 64)) V!44603)

(assert (=> b!1176353 (= lt!530912 (dynLambda!2925 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530908 () ListLongMap!16971)

(assert (=> b!1176353 (= lt!530908 (getCurrentListMapNoExtraKeys!4960 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1176354 () Bool)

(declare-fun res!781315 () Bool)

(assert (=> b!1176354 (=> (not res!781315) (not e!668688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1176354 (= res!781315 (validMask!0 mask!1564))))

(declare-fun b!1176355 () Bool)

(declare-fun res!781311 () Bool)

(assert (=> b!1176355 (=> (not res!781311) (not e!668688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176355 (= res!781311 (validKeyInArray!0 k0!934))))

(declare-fun b!1176356 () Bool)

(declare-fun res!781308 () Bool)

(assert (=> b!1176356 (=> (not res!781308) (not e!668688))))

(assert (=> b!1176356 (= res!781308 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37196 _keys!1208))))))

(declare-fun b!1176357 () Bool)

(declare-fun Unit!38834 () Unit!38831)

(assert (=> b!1176357 (= e!668687 Unit!38834)))

(declare-fun b!1176358 () Bool)

(assert (=> b!1176358 (= e!668685 e!668679)))

(declare-fun res!781321 () Bool)

(assert (=> b!1176358 (=> res!781321 e!668679)))

(assert (=> b!1176358 (= res!781321 (not (validKeyInArray!0 (select (arr!36660 _keys!1208) from!1455))))))

(declare-fun lt!530902 () ListLongMap!16971)

(assert (=> b!1176358 (= lt!530902 lt!530901)))

(declare-fun lt!530903 () ListLongMap!16971)

(declare-fun -!1555 (ListLongMap!16971 (_ BitVec 64)) ListLongMap!16971)

(assert (=> b!1176358 (= lt!530901 (-!1555 lt!530903 k0!934))))

(assert (=> b!1176358 (= lt!530902 (getCurrentListMapNoExtraKeys!4960 lt!530899 lt!530900 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1176358 (= lt!530903 (getCurrentListMapNoExtraKeys!4960 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!530904 () Unit!38831)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!782 (array!76021 array!76023 (_ BitVec 32) (_ BitVec 32) V!44603 V!44603 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38831)

(assert (=> b!1176358 (= lt!530904 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!782 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1176359 () Bool)

(assert (=> b!1176359 (= e!668689 (not e!668680))))

(declare-fun res!781309 () Bool)

(assert (=> b!1176359 (=> res!781309 e!668680)))

(assert (=> b!1176359 (= res!781309 (bvsgt from!1455 i!673))))

(assert (=> b!1176359 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530909 () Unit!38831)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76021 (_ BitVec 64) (_ BitVec 32)) Unit!38831)

(assert (=> b!1176359 (= lt!530909 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46238 () Bool)

(declare-fun tp!87944 () Bool)

(assert (=> mapNonEmpty!46238 (= mapRes!46238 (and tp!87944 e!668677))))

(declare-fun mapRest!46238 () (Array (_ BitVec 32) ValueCell!14094))

(declare-fun mapValue!46238 () ValueCell!14094)

(declare-fun mapKey!46238 () (_ BitVec 32))

(assert (=> mapNonEmpty!46238 (= (arr!36661 _values!996) (store mapRest!46238 mapKey!46238 mapValue!46238))))

(declare-fun b!1176360 () Bool)

(declare-fun res!781306 () Bool)

(assert (=> b!1176360 (=> (not res!781306) (not e!668688))))

(assert (=> b!1176360 (= res!781306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1176361 () Bool)

(assert (=> b!1176361 (= e!668686 tp_is_empty!29607)))

(declare-fun mapIsEmpty!46238 () Bool)

(assert (=> mapIsEmpty!46238 mapRes!46238))

(declare-fun b!1176362 () Bool)

(declare-fun res!781318 () Bool)

(assert (=> b!1176362 (=> (not res!781318) (not e!668688))))

(assert (=> b!1176362 (= res!781318 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25738))))

(declare-fun b!1176363 () Bool)

(assert (=> b!1176363 (= e!668681 (= lt!530908 (+!3817 lt!530903 lt!530907)))))

(declare-fun b!1176364 () Bool)

(declare-fun res!781307 () Bool)

(assert (=> b!1176364 (=> (not res!781307) (not e!668688))))

(assert (=> b!1176364 (= res!781307 (= (select (arr!36660 _keys!1208) i!673) k0!934))))

(declare-fun b!1176365 () Bool)

(declare-fun res!781320 () Bool)

(assert (=> b!1176365 (=> (not res!781320) (not e!668689))))

(assert (=> b!1176365 (= res!781320 (arrayNoDuplicates!0 lt!530899 #b00000000000000000000000000000000 Nil!25738))))

(assert (= (and start!99498 res!781317) b!1176354))

(assert (= (and b!1176354 res!781315) b!1176348))

(assert (= (and b!1176348 res!781314) b!1176360))

(assert (= (and b!1176360 res!781306) b!1176362))

(assert (= (and b!1176362 res!781318) b!1176356))

(assert (= (and b!1176356 res!781308) b!1176355))

(assert (= (and b!1176355 res!781311) b!1176364))

(assert (= (and b!1176364 res!781307) b!1176350))

(assert (= (and b!1176350 res!781319) b!1176365))

(assert (= (and b!1176365 res!781320) b!1176359))

(assert (= (and b!1176359 (not res!781309)) b!1176353))

(assert (= (and b!1176353 (not res!781316)) b!1176358))

(assert (= (and b!1176358 (not res!781321)) b!1176345))

(assert (= (and b!1176345 res!781312) b!1176352))

(assert (= (and b!1176352 (not res!781313)) b!1176349))

(assert (= (and b!1176345 c!116739) b!1176346))

(assert (= (and b!1176345 (not c!116739)) b!1176357))

(assert (= (and b!1176345 res!781310) b!1176363))

(assert (= (and b!1176347 condMapEmpty!46238) mapIsEmpty!46238))

(assert (= (and b!1176347 (not condMapEmpty!46238)) mapNonEmpty!46238))

(get-info :version)

(assert (= (and mapNonEmpty!46238 ((_ is ValueCellFull!14094) mapValue!46238)) b!1176351))

(assert (= (and b!1176347 ((_ is ValueCellFull!14094) mapDefault!46238)) b!1176361))

(assert (= start!99498 b!1176347))

(declare-fun b_lambda!20221 () Bool)

(assert (=> (not b_lambda!20221) (not b!1176353)))

(declare-fun t!37808 () Bool)

(declare-fun tb!9889 () Bool)

(assert (=> (and start!99498 (= defaultEntry!1004 defaultEntry!1004) t!37808) tb!9889))

(declare-fun result!20345 () Bool)

(assert (=> tb!9889 (= result!20345 tp_is_empty!29607)))

(assert (=> b!1176353 t!37808))

(declare-fun b_and!41023 () Bool)

(assert (= b_and!41021 (and (=> t!37808 result!20345) b_and!41023)))

(declare-fun m!1084275 () Bool)

(assert (=> b!1176353 m!1084275))

(declare-fun m!1084277 () Bool)

(assert (=> b!1176353 m!1084277))

(declare-fun m!1084279 () Bool)

(assert (=> b!1176353 m!1084279))

(declare-fun m!1084281 () Bool)

(assert (=> b!1176353 m!1084281))

(declare-fun m!1084283 () Bool)

(assert (=> mapNonEmpty!46238 m!1084283))

(declare-fun m!1084285 () Bool)

(assert (=> b!1176352 m!1084285))

(declare-fun m!1084287 () Bool)

(assert (=> b!1176346 m!1084287))

(declare-fun m!1084289 () Bool)

(assert (=> b!1176346 m!1084289))

(declare-fun m!1084291 () Bool)

(assert (=> b!1176346 m!1084291))

(declare-fun m!1084293 () Bool)

(assert (=> b!1176346 m!1084293))

(declare-fun m!1084295 () Bool)

(assert (=> b!1176346 m!1084295))

(declare-fun m!1084297 () Bool)

(assert (=> b!1176355 m!1084297))

(assert (=> b!1176345 m!1084285))

(declare-fun m!1084299 () Bool)

(assert (=> b!1176345 m!1084299))

(declare-fun m!1084301 () Bool)

(assert (=> b!1176345 m!1084301))

(assert (=> b!1176345 m!1084301))

(declare-fun m!1084303 () Bool)

(assert (=> b!1176345 m!1084303))

(declare-fun m!1084305 () Bool)

(assert (=> b!1176350 m!1084305))

(declare-fun m!1084307 () Bool)

(assert (=> b!1176350 m!1084307))

(declare-fun m!1084309 () Bool)

(assert (=> start!99498 m!1084309))

(declare-fun m!1084311 () Bool)

(assert (=> start!99498 m!1084311))

(declare-fun m!1084313 () Bool)

(assert (=> b!1176362 m!1084313))

(declare-fun m!1084315 () Bool)

(assert (=> b!1176354 m!1084315))

(declare-fun m!1084317 () Bool)

(assert (=> b!1176359 m!1084317))

(declare-fun m!1084319 () Bool)

(assert (=> b!1176359 m!1084319))

(declare-fun m!1084321 () Bool)

(assert (=> b!1176358 m!1084321))

(declare-fun m!1084323 () Bool)

(assert (=> b!1176358 m!1084323))

(declare-fun m!1084325 () Bool)

(assert (=> b!1176358 m!1084325))

(assert (=> b!1176358 m!1084285))

(declare-fun m!1084327 () Bool)

(assert (=> b!1176358 m!1084327))

(assert (=> b!1176358 m!1084285))

(declare-fun m!1084329 () Bool)

(assert (=> b!1176358 m!1084329))

(declare-fun m!1084331 () Bool)

(assert (=> b!1176363 m!1084331))

(declare-fun m!1084333 () Bool)

(assert (=> b!1176365 m!1084333))

(declare-fun m!1084335 () Bool)

(assert (=> b!1176349 m!1084335))

(declare-fun m!1084337 () Bool)

(assert (=> b!1176360 m!1084337))

(declare-fun m!1084339 () Bool)

(assert (=> b!1176364 m!1084339))

(check-sat (not b!1176359) (not b_lambda!20221) b_and!41023 (not b!1176346) (not b!1176350) (not b!1176362) (not b!1176363) (not b!1176365) (not b!1176358) tp_is_empty!29607 (not start!99498) (not b!1176349) (not b!1176354) (not b!1176355) (not b!1176345) (not b_next!25077) (not b!1176360) (not mapNonEmpty!46238) (not b!1176353))
(check-sat b_and!41023 (not b_next!25077))
