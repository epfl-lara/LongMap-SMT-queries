; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99876 () Bool)

(assert start!99876)

(declare-fun b_free!25219 () Bool)

(declare-fun b_next!25219 () Bool)

(assert (=> start!99876 (= b_free!25219 (not b_next!25219))))

(declare-fun tp!88371 () Bool)

(declare-fun b_and!41307 () Bool)

(assert (=> start!99876 (= tp!88371 b_and!41307)))

(declare-fun b!1182314 () Bool)

(declare-fun e!672282 () Bool)

(assert (=> b!1182314 (= e!672282 true)))

(declare-fun e!672281 () Bool)

(assert (=> b!1182314 e!672281))

(declare-fun res!785287 () Bool)

(assert (=> b!1182314 (=> (not res!785287) (not e!672281))))

(declare-datatypes ((array!76349 0))(
  ( (array!76350 (arr!36818 (Array (_ BitVec 32) (_ BitVec 64))) (size!37355 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76349)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1182314 (= res!785287 (not (= (select (arr!36818 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!39047 0))(
  ( (Unit!39048) )
))
(declare-fun lt!534583 () Unit!39047)

(declare-fun e!672287 () Unit!39047)

(assert (=> b!1182314 (= lt!534583 e!672287)))

(declare-fun c!117350 () Bool)

(assert (=> b!1182314 (= c!117350 (= (select (arr!36818 _keys!1208) from!1455) k0!934))))

(declare-fun e!672279 () Bool)

(assert (=> b!1182314 e!672279))

(declare-fun res!785291 () Bool)

(assert (=> b!1182314 (=> (not res!785291) (not e!672279))))

(declare-datatypes ((V!44793 0))(
  ( (V!44794 (val!14931 Int)) )
))
(declare-datatypes ((tuple2!19172 0))(
  ( (tuple2!19173 (_1!9597 (_ BitVec 64)) (_2!9597 V!44793)) )
))
(declare-datatypes ((List!25901 0))(
  ( (Nil!25898) (Cons!25897 (h!27115 tuple2!19172) (t!38104 List!25901)) )
))
(declare-datatypes ((ListLongMap!17149 0))(
  ( (ListLongMap!17150 (toList!8590 List!25901)) )
))
(declare-fun lt!534590 () ListLongMap!17149)

(declare-fun lt!534587 () tuple2!19172)

(declare-fun lt!534584 () ListLongMap!17149)

(declare-fun +!3913 (ListLongMap!17149 tuple2!19172) ListLongMap!17149)

(assert (=> b!1182314 (= res!785291 (= lt!534584 (+!3913 lt!534590 lt!534587)))))

(declare-fun lt!534591 () V!44793)

(declare-datatypes ((ValueCell!14165 0))(
  ( (ValueCellFull!14165 (v!17565 V!44793)) (EmptyCell!14165) )
))
(declare-datatypes ((array!76351 0))(
  ( (array!76352 (arr!36819 (Array (_ BitVec 32) ValueCell!14165)) (size!37356 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76351)

(declare-fun get!18865 (ValueCell!14165 V!44793) V!44793)

(assert (=> b!1182314 (= lt!534587 (tuple2!19173 (select (arr!36818 _keys!1208) from!1455) (get!18865 (select (arr!36819 _values!996) from!1455) lt!534591)))))

(declare-fun res!785299 () Bool)

(declare-fun e!672280 () Bool)

(assert (=> start!99876 (=> (not res!785299) (not e!672280))))

(assert (=> start!99876 (= res!785299 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37355 _keys!1208))))))

(assert (=> start!99876 e!672280))

(declare-fun tp_is_empty!29749 () Bool)

(assert (=> start!99876 tp_is_empty!29749))

(declare-fun array_inv!28188 (array!76349) Bool)

(assert (=> start!99876 (array_inv!28188 _keys!1208)))

(assert (=> start!99876 true))

(assert (=> start!99876 tp!88371))

(declare-fun e!672284 () Bool)

(declare-fun array_inv!28189 (array!76351) Bool)

(assert (=> start!99876 (and (array_inv!28189 _values!996) e!672284)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun b!1182315 () Bool)

(declare-fun e!672288 () Bool)

(declare-fun arrayContainsKey!0 (array!76349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182315 (= e!672288 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182316 () Bool)

(declare-fun lt!534585 () ListLongMap!17149)

(assert (=> b!1182316 (= e!672281 (= lt!534590 lt!534585))))

(declare-fun b!1182317 () Bool)

(declare-fun Unit!39049 () Unit!39047)

(assert (=> b!1182317 (= e!672287 Unit!39049)))

(declare-fun lt!534580 () Unit!39047)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76349 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39047)

(assert (=> b!1182317 (= lt!534580 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1182317 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534578 () Unit!39047)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76349 (_ BitVec 32) (_ BitVec 32)) Unit!39047)

(assert (=> b!1182317 (= lt!534578 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25902 0))(
  ( (Nil!25899) (Cons!25898 (h!27116 (_ BitVec 64)) (t!38105 List!25902)) )
))
(declare-fun arrayNoDuplicates!0 (array!76349 (_ BitVec 32) List!25902) Bool)

(assert (=> b!1182317 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25899)))

(declare-fun lt!534579 () Unit!39047)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76349 (_ BitVec 64) (_ BitVec 32) List!25902) Unit!39047)

(assert (=> b!1182317 (= lt!534579 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25899))))

(assert (=> b!1182317 false))

(declare-fun b!1182318 () Bool)

(declare-fun res!785301 () Bool)

(declare-fun e!672286 () Bool)

(assert (=> b!1182318 (=> (not res!785301) (not e!672286))))

(declare-fun lt!534589 () array!76349)

(assert (=> b!1182318 (= res!785301 (arrayNoDuplicates!0 lt!534589 #b00000000000000000000000000000000 Nil!25899))))

(declare-fun b!1182319 () Bool)

(declare-fun e!672289 () Bool)

(declare-fun e!672283 () Bool)

(assert (=> b!1182319 (= e!672289 e!672283)))

(declare-fun res!785295 () Bool)

(assert (=> b!1182319 (=> res!785295 e!672283)))

(assert (=> b!1182319 (= res!785295 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun zeroValue!944 () V!44793)

(declare-fun lt!534586 () array!76351)

(declare-fun minValue!944 () V!44793)

(declare-fun getCurrentListMapNoExtraKeys!5065 (array!76349 array!76351 (_ BitVec 32) (_ BitVec 32) V!44793 V!44793 (_ BitVec 32) Int) ListLongMap!17149)

(assert (=> b!1182319 (= lt!534584 (getCurrentListMapNoExtraKeys!5065 lt!534589 lt!534586 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1182319 (= lt!534586 (array!76352 (store (arr!36819 _values!996) i!673 (ValueCellFull!14165 lt!534591)) (size!37356 _values!996)))))

(declare-fun dynLambda!3031 (Int (_ BitVec 64)) V!44793)

(assert (=> b!1182319 (= lt!534591 (dynLambda!3031 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!534581 () ListLongMap!17149)

(assert (=> b!1182319 (= lt!534581 (getCurrentListMapNoExtraKeys!5065 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1182320 () Bool)

(declare-fun res!785293 () Bool)

(assert (=> b!1182320 (=> (not res!785293) (not e!672280))))

(assert (=> b!1182320 (= res!785293 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37355 _keys!1208))))))

(declare-fun b!1182321 () Bool)

(declare-fun res!785289 () Bool)

(assert (=> b!1182321 (=> (not res!785289) (not e!672280))))

(assert (=> b!1182321 (= res!785289 (and (= (size!37356 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37355 _keys!1208) (size!37356 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1182322 () Bool)

(assert (=> b!1182322 (= e!672279 e!672288)))

(declare-fun res!785294 () Bool)

(assert (=> b!1182322 (=> res!785294 e!672288)))

(assert (=> b!1182322 (= res!785294 (not (= (select (arr!36818 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1182323 () Bool)

(declare-fun res!785290 () Bool)

(assert (=> b!1182323 (=> (not res!785290) (not e!672280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76349 (_ BitVec 32)) Bool)

(assert (=> b!1182323 (= res!785290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1182324 () Bool)

(declare-fun e!672290 () Bool)

(declare-fun mapRes!46451 () Bool)

(assert (=> b!1182324 (= e!672284 (and e!672290 mapRes!46451))))

(declare-fun condMapEmpty!46451 () Bool)

(declare-fun mapDefault!46451 () ValueCell!14165)

(assert (=> b!1182324 (= condMapEmpty!46451 (= (arr!36819 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14165)) mapDefault!46451)))))

(declare-fun b!1182325 () Bool)

(declare-fun res!785296 () Bool)

(assert (=> b!1182325 (=> (not res!785296) (not e!672280))))

(assert (=> b!1182325 (= res!785296 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25899))))

(declare-fun b!1182326 () Bool)

(declare-fun res!785288 () Bool)

(assert (=> b!1182326 (=> (not res!785288) (not e!672280))))

(assert (=> b!1182326 (= res!785288 (= (select (arr!36818 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!46451 () Bool)

(assert (=> mapIsEmpty!46451 mapRes!46451))

(declare-fun b!1182327 () Bool)

(assert (=> b!1182327 (= e!672286 (not e!672289))))

(declare-fun res!785303 () Bool)

(assert (=> b!1182327 (=> res!785303 e!672289)))

(assert (=> b!1182327 (= res!785303 (bvsgt from!1455 i!673))))

(assert (=> b!1182327 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!534592 () Unit!39047)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76349 (_ BitVec 64) (_ BitVec 32)) Unit!39047)

(assert (=> b!1182327 (= lt!534592 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182328 () Bool)

(assert (=> b!1182328 (= e!672283 e!672282)))

(declare-fun res!785302 () Bool)

(assert (=> b!1182328 (=> res!785302 e!672282)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182328 (= res!785302 (not (validKeyInArray!0 (select (arr!36818 _keys!1208) from!1455))))))

(assert (=> b!1182328 (= lt!534585 lt!534590)))

(declare-fun lt!534582 () ListLongMap!17149)

(declare-fun -!1616 (ListLongMap!17149 (_ BitVec 64)) ListLongMap!17149)

(assert (=> b!1182328 (= lt!534590 (-!1616 lt!534582 k0!934))))

(assert (=> b!1182328 (= lt!534585 (getCurrentListMapNoExtraKeys!5065 lt!534589 lt!534586 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1182328 (= lt!534582 (getCurrentListMapNoExtraKeys!5065 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!534588 () Unit!39047)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!841 (array!76349 array!76351 (_ BitVec 32) (_ BitVec 32) V!44793 V!44793 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39047)

(assert (=> b!1182328 (= lt!534588 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!841 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1182329 () Bool)

(assert (=> b!1182329 (= e!672280 e!672286)))

(declare-fun res!785297 () Bool)

(assert (=> b!1182329 (=> (not res!785297) (not e!672286))))

(assert (=> b!1182329 (= res!785297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534589 mask!1564))))

(assert (=> b!1182329 (= lt!534589 (array!76350 (store (arr!36818 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37355 _keys!1208)))))

(declare-fun b!1182330 () Bool)

(declare-fun e!672285 () Bool)

(assert (=> b!1182330 (= e!672285 tp_is_empty!29749)))

(declare-fun b!1182331 () Bool)

(declare-fun res!785292 () Bool)

(assert (=> b!1182331 (=> (not res!785292) (not e!672280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1182331 (= res!785292 (validMask!0 mask!1564))))

(declare-fun b!1182332 () Bool)

(assert (=> b!1182332 (= e!672290 tp_is_empty!29749)))

(declare-fun mapNonEmpty!46451 () Bool)

(declare-fun tp!88370 () Bool)

(assert (=> mapNonEmpty!46451 (= mapRes!46451 (and tp!88370 e!672285))))

(declare-fun mapKey!46451 () (_ BitVec 32))

(declare-fun mapRest!46451 () (Array (_ BitVec 32) ValueCell!14165))

(declare-fun mapValue!46451 () ValueCell!14165)

(assert (=> mapNonEmpty!46451 (= (arr!36819 _values!996) (store mapRest!46451 mapKey!46451 mapValue!46451))))

(declare-fun b!1182333 () Bool)

(declare-fun Unit!39050 () Unit!39047)

(assert (=> b!1182333 (= e!672287 Unit!39050)))

(declare-fun b!1182334 () Bool)

(declare-fun res!785298 () Bool)

(assert (=> b!1182334 (=> (not res!785298) (not e!672280))))

(assert (=> b!1182334 (= res!785298 (validKeyInArray!0 k0!934))))

(declare-fun b!1182335 () Bool)

(declare-fun res!785300 () Bool)

(assert (=> b!1182335 (=> (not res!785300) (not e!672281))))

(assert (=> b!1182335 (= res!785300 (= lt!534581 (+!3913 lt!534582 lt!534587)))))

(assert (= (and start!99876 res!785299) b!1182331))

(assert (= (and b!1182331 res!785292) b!1182321))

(assert (= (and b!1182321 res!785289) b!1182323))

(assert (= (and b!1182323 res!785290) b!1182325))

(assert (= (and b!1182325 res!785296) b!1182320))

(assert (= (and b!1182320 res!785293) b!1182334))

(assert (= (and b!1182334 res!785298) b!1182326))

(assert (= (and b!1182326 res!785288) b!1182329))

(assert (= (and b!1182329 res!785297) b!1182318))

(assert (= (and b!1182318 res!785301) b!1182327))

(assert (= (and b!1182327 (not res!785303)) b!1182319))

(assert (= (and b!1182319 (not res!785295)) b!1182328))

(assert (= (and b!1182328 (not res!785302)) b!1182314))

(assert (= (and b!1182314 res!785291) b!1182322))

(assert (= (and b!1182322 (not res!785294)) b!1182315))

(assert (= (and b!1182314 c!117350) b!1182317))

(assert (= (and b!1182314 (not c!117350)) b!1182333))

(assert (= (and b!1182314 res!785287) b!1182335))

(assert (= (and b!1182335 res!785300) b!1182316))

(assert (= (and b!1182324 condMapEmpty!46451) mapIsEmpty!46451))

(assert (= (and b!1182324 (not condMapEmpty!46451)) mapNonEmpty!46451))

(get-info :version)

(assert (= (and mapNonEmpty!46451 ((_ is ValueCellFull!14165) mapValue!46451)) b!1182330))

(assert (= (and b!1182324 ((_ is ValueCellFull!14165) mapDefault!46451)) b!1182332))

(assert (= start!99876 b!1182324))

(declare-fun b_lambda!20357 () Bool)

(assert (=> (not b_lambda!20357) (not b!1182319)))

(declare-fun t!38103 () Bool)

(declare-fun tb!10023 () Bool)

(assert (=> (and start!99876 (= defaultEntry!1004 defaultEntry!1004) t!38103) tb!10023))

(declare-fun result!20621 () Bool)

(assert (=> tb!10023 (= result!20621 tp_is_empty!29749)))

(assert (=> b!1182319 t!38103))

(declare-fun b_and!41309 () Bool)

(assert (= b_and!41307 (and (=> t!38103 result!20621) b_and!41309)))

(declare-fun m!1090533 () Bool)

(assert (=> b!1182331 m!1090533))

(declare-fun m!1090535 () Bool)

(assert (=> b!1182328 m!1090535))

(declare-fun m!1090537 () Bool)

(assert (=> b!1182328 m!1090537))

(declare-fun m!1090539 () Bool)

(assert (=> b!1182328 m!1090539))

(declare-fun m!1090541 () Bool)

(assert (=> b!1182328 m!1090541))

(declare-fun m!1090543 () Bool)

(assert (=> b!1182328 m!1090543))

(declare-fun m!1090545 () Bool)

(assert (=> b!1182328 m!1090545))

(assert (=> b!1182328 m!1090541))

(declare-fun m!1090547 () Bool)

(assert (=> mapNonEmpty!46451 m!1090547))

(declare-fun m!1090549 () Bool)

(assert (=> b!1182325 m!1090549))

(assert (=> b!1182314 m!1090541))

(declare-fun m!1090551 () Bool)

(assert (=> b!1182314 m!1090551))

(declare-fun m!1090553 () Bool)

(assert (=> b!1182314 m!1090553))

(assert (=> b!1182314 m!1090553))

(declare-fun m!1090555 () Bool)

(assert (=> b!1182314 m!1090555))

(declare-fun m!1090557 () Bool)

(assert (=> b!1182317 m!1090557))

(declare-fun m!1090559 () Bool)

(assert (=> b!1182317 m!1090559))

(declare-fun m!1090561 () Bool)

(assert (=> b!1182317 m!1090561))

(declare-fun m!1090563 () Bool)

(assert (=> b!1182317 m!1090563))

(declare-fun m!1090565 () Bool)

(assert (=> b!1182317 m!1090565))

(declare-fun m!1090567 () Bool)

(assert (=> b!1182323 m!1090567))

(assert (=> b!1182322 m!1090541))

(declare-fun m!1090569 () Bool)

(assert (=> b!1182318 m!1090569))

(declare-fun m!1090571 () Bool)

(assert (=> b!1182329 m!1090571))

(declare-fun m!1090573 () Bool)

(assert (=> b!1182329 m!1090573))

(declare-fun m!1090575 () Bool)

(assert (=> start!99876 m!1090575))

(declare-fun m!1090577 () Bool)

(assert (=> start!99876 m!1090577))

(declare-fun m!1090579 () Bool)

(assert (=> b!1182327 m!1090579))

(declare-fun m!1090581 () Bool)

(assert (=> b!1182327 m!1090581))

(declare-fun m!1090583 () Bool)

(assert (=> b!1182319 m!1090583))

(declare-fun m!1090585 () Bool)

(assert (=> b!1182319 m!1090585))

(declare-fun m!1090587 () Bool)

(assert (=> b!1182319 m!1090587))

(declare-fun m!1090589 () Bool)

(assert (=> b!1182319 m!1090589))

(declare-fun m!1090591 () Bool)

(assert (=> b!1182335 m!1090591))

(declare-fun m!1090593 () Bool)

(assert (=> b!1182334 m!1090593))

(declare-fun m!1090595 () Bool)

(assert (=> b!1182326 m!1090595))

(declare-fun m!1090597 () Bool)

(assert (=> b!1182315 m!1090597))

(check-sat (not b!1182329) (not b!1182331) (not b!1182334) (not b!1182335) tp_is_empty!29749 (not b!1182315) (not b_next!25219) (not b!1182327) b_and!41309 (not mapNonEmpty!46451) (not b!1182328) (not b!1182314) (not b_lambda!20357) (not b!1182317) (not b!1182325) (not b!1182319) (not start!99876) (not b!1182318) (not b!1182323))
(check-sat b_and!41309 (not b_next!25219))
