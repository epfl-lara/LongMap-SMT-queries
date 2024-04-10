; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98776 () Bool)

(assert start!98776)

(declare-fun b_free!24381 () Bool)

(declare-fun b_next!24381 () Bool)

(assert (=> start!98776 (= b_free!24381 (not b_next!24381))))

(declare-fun tp!85854 () Bool)

(declare-fun b_and!39611 () Bool)

(assert (=> start!98776 (= tp!85854 b_and!39611)))

(declare-fun bm!54111 () Bool)

(declare-fun call!54116 () Bool)

(declare-fun call!54118 () Bool)

(assert (=> bm!54111 (= call!54116 call!54118)))

(declare-fun b!1152538 () Bool)

(declare-fun res!766252 () Bool)

(declare-fun e!655504 () Bool)

(assert (=> b!1152538 (=> (not res!766252) (not e!655504))))

(declare-datatypes ((array!74669 0))(
  ( (array!74670 (arr!35985 (Array (_ BitVec 32) (_ BitVec 64))) (size!36521 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74669)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1152538 (= res!766252 (= (select (arr!35985 _keys!1208) i!673) k0!934))))

(declare-fun b!1152539 () Bool)

(declare-fun e!655508 () Bool)

(declare-fun e!655507 () Bool)

(assert (=> b!1152539 (= e!655508 e!655507)))

(declare-fun res!766253 () Bool)

(assert (=> b!1152539 (=> res!766253 e!655507)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1152539 (= res!766253 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43675 0))(
  ( (V!43676 (val!14512 Int)) )
))
(declare-fun zeroValue!944 () V!43675)

(declare-datatypes ((tuple2!18432 0))(
  ( (tuple2!18433 (_1!9227 (_ BitVec 64)) (_2!9227 V!43675)) )
))
(declare-datatypes ((List!25179 0))(
  ( (Nil!25176) (Cons!25175 (h!26384 tuple2!18432) (t!36552 List!25179)) )
))
(declare-datatypes ((ListLongMap!16401 0))(
  ( (ListLongMap!16402 (toList!8216 List!25179)) )
))
(declare-fun lt!516312 () ListLongMap!16401)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13746 0))(
  ( (ValueCellFull!13746 (v!17149 V!43675)) (EmptyCell!13746) )
))
(declare-datatypes ((array!74671 0))(
  ( (array!74672 (arr!35986 (Array (_ BitVec 32) ValueCell!13746)) (size!36522 (_ BitVec 32))) )
))
(declare-fun lt!516311 () array!74671)

(declare-fun lt!516308 () array!74669)

(declare-fun minValue!944 () V!43675)

(declare-fun getCurrentListMapNoExtraKeys!4688 (array!74669 array!74671 (_ BitVec 32) (_ BitVec 32) V!43675 V!43675 (_ BitVec 32) Int) ListLongMap!16401)

(assert (=> b!1152539 (= lt!516312 (getCurrentListMapNoExtraKeys!4688 lt!516308 lt!516311 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!516320 () V!43675)

(declare-fun _values!996 () array!74671)

(assert (=> b!1152539 (= lt!516311 (array!74672 (store (arr!35986 _values!996) i!673 (ValueCellFull!13746 lt!516320)) (size!36522 _values!996)))))

(declare-fun dynLambda!2708 (Int (_ BitVec 64)) V!43675)

(assert (=> b!1152539 (= lt!516320 (dynLambda!2708 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!516323 () ListLongMap!16401)

(assert (=> b!1152539 (= lt!516323 (getCurrentListMapNoExtraKeys!4688 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1152540 () Bool)

(declare-fun res!766247 () Bool)

(assert (=> b!1152540 (=> (not res!766247) (not e!655504))))

(assert (=> b!1152540 (= res!766247 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36521 _keys!1208))))))

(declare-fun b!1152541 () Bool)

(declare-datatypes ((Unit!37927 0))(
  ( (Unit!37928) )
))
(declare-fun e!655502 () Unit!37927)

(declare-fun lt!516306 () Unit!37927)

(assert (=> b!1152541 (= e!655502 lt!516306)))

(declare-fun call!54114 () Unit!37927)

(assert (=> b!1152541 (= lt!516306 call!54114)))

(assert (=> b!1152541 call!54116))

(declare-fun b!1152542 () Bool)

(declare-fun res!766245 () Bool)

(assert (=> b!1152542 (=> (not res!766245) (not e!655504))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1152542 (= res!766245 (validKeyInArray!0 k0!934))))

(declare-fun b!1152543 () Bool)

(declare-fun res!766251 () Bool)

(assert (=> b!1152543 (=> (not res!766251) (not e!655504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1152543 (= res!766251 (validMask!0 mask!1564))))

(declare-fun bm!54112 () Bool)

(declare-fun call!54119 () ListLongMap!16401)

(assert (=> bm!54112 (= call!54119 (getCurrentListMapNoExtraKeys!4688 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152544 () Bool)

(declare-fun lt!516316 () ListLongMap!16401)

(declare-fun contains!6734 (ListLongMap!16401 (_ BitVec 64)) Bool)

(declare-fun +!3634 (ListLongMap!16401 tuple2!18432) ListLongMap!16401)

(assert (=> b!1152544 (contains!6734 (+!3634 lt!516316 (tuple2!18433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!516314 () Unit!37927)

(declare-fun call!54115 () Unit!37927)

(assert (=> b!1152544 (= lt!516314 call!54115)))

(assert (=> b!1152544 call!54118))

(declare-fun call!54121 () ListLongMap!16401)

(assert (=> b!1152544 (= lt!516316 call!54121)))

(declare-fun lt!516324 () Unit!37927)

(declare-fun lt!516321 () ListLongMap!16401)

(declare-fun addStillContains!882 (ListLongMap!16401 (_ BitVec 64) V!43675 (_ BitVec 64)) Unit!37927)

(assert (=> b!1152544 (= lt!516324 (addStillContains!882 lt!516321 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!655505 () Unit!37927)

(assert (=> b!1152544 (= e!655505 lt!516314)))

(declare-fun b!1152545 () Bool)

(declare-fun e!655511 () Bool)

(assert (=> b!1152545 (= e!655511 (not e!655508))))

(declare-fun res!766244 () Bool)

(assert (=> b!1152545 (=> res!766244 e!655508)))

(assert (=> b!1152545 (= res!766244 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1152545 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!516315 () Unit!37927)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74669 (_ BitVec 64) (_ BitVec 32)) Unit!37927)

(assert (=> b!1152545 (= lt!516315 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1152546 () Bool)

(declare-fun res!766241 () Bool)

(assert (=> b!1152546 (=> (not res!766241) (not e!655504))))

(assert (=> b!1152546 (= res!766241 (and (= (size!36522 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36521 _keys!1208) (size!36522 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun lt!516327 () ListLongMap!16401)

(declare-fun b!1152547 () Bool)

(declare-fun e!655501 () Bool)

(assert (=> b!1152547 (= e!655501 (= lt!516327 (getCurrentListMapNoExtraKeys!4688 lt!516308 lt!516311 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun call!54120 () ListLongMap!16401)

(declare-fun bm!54113 () Bool)

(assert (=> bm!54113 (= call!54120 (getCurrentListMapNoExtraKeys!4688 lt!516308 lt!516311 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54114 () Bool)

(declare-fun c!114287 () Bool)

(declare-fun c!114292 () Bool)

(assert (=> bm!54114 (= call!54115 (addStillContains!882 (ite c!114292 lt!516316 lt!516321) (ite c!114292 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114287 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114292 minValue!944 (ite c!114287 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1152548 () Bool)

(declare-fun res!766250 () Bool)

(assert (=> b!1152548 (=> (not res!766250) (not e!655504))))

(declare-datatypes ((List!25180 0))(
  ( (Nil!25177) (Cons!25176 (h!26385 (_ BitVec 64)) (t!36553 List!25180)) )
))
(declare-fun arrayNoDuplicates!0 (array!74669 (_ BitVec 32) List!25180) Bool)

(assert (=> b!1152548 (= res!766250 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25177))))

(declare-fun mapNonEmpty!45191 () Bool)

(declare-fun mapRes!45191 () Bool)

(declare-fun tp!85853 () Bool)

(declare-fun e!655503 () Bool)

(assert (=> mapNonEmpty!45191 (= mapRes!45191 (and tp!85853 e!655503))))

(declare-fun mapRest!45191 () (Array (_ BitVec 32) ValueCell!13746))

(declare-fun mapKey!45191 () (_ BitVec 32))

(declare-fun mapValue!45191 () ValueCell!13746)

(assert (=> mapNonEmpty!45191 (= (arr!35986 _values!996) (store mapRest!45191 mapKey!45191 mapValue!45191))))

(declare-fun b!1152549 () Bool)

(declare-fun e!655514 () Unit!37927)

(declare-fun Unit!37929 () Unit!37927)

(assert (=> b!1152549 (= e!655514 Unit!37929)))

(declare-fun lt!516313 () Bool)

(assert (=> b!1152549 (= lt!516313 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1152549 (= c!114292 (and (not lt!516313) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!516325 () Unit!37927)

(assert (=> b!1152549 (= lt!516325 e!655505)))

(declare-fun lt!516310 () Unit!37927)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!474 (array!74669 array!74671 (_ BitVec 32) (_ BitVec 32) V!43675 V!43675 (_ BitVec 64) (_ BitVec 32) Int) Unit!37927)

(assert (=> b!1152549 (= lt!516310 (lemmaListMapContainsThenArrayContainsFrom!474 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114288 () Bool)

(assert (=> b!1152549 (= c!114288 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766240 () Bool)

(declare-fun e!655515 () Bool)

(assert (=> b!1152549 (= res!766240 e!655515)))

(declare-fun e!655509 () Bool)

(assert (=> b!1152549 (=> (not res!766240) (not e!655509))))

(assert (=> b!1152549 e!655509))

(declare-fun lt!516309 () Unit!37927)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74669 (_ BitVec 32) (_ BitVec 32)) Unit!37927)

(assert (=> b!1152549 (= lt!516309 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1152549 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25177)))

(declare-fun lt!516322 () Unit!37927)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74669 (_ BitVec 64) (_ BitVec 32) List!25180) Unit!37927)

(assert (=> b!1152549 (= lt!516322 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25177))))

(assert (=> b!1152549 false))

(declare-fun b!1152550 () Bool)

(declare-fun e!655499 () Bool)

(assert (=> b!1152550 (= e!655507 e!655499)))

(declare-fun res!766248 () Bool)

(assert (=> b!1152550 (=> res!766248 e!655499)))

(assert (=> b!1152550 (= res!766248 (not (= (select (arr!35985 _keys!1208) from!1455) k0!934)))))

(declare-fun e!655510 () Bool)

(assert (=> b!1152550 e!655510))

(declare-fun c!114291 () Bool)

(assert (=> b!1152550 (= c!114291 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!516326 () Unit!37927)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!582 (array!74669 array!74671 (_ BitVec 32) (_ BitVec 32) V!43675 V!43675 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37927)

(assert (=> b!1152550 (= lt!516326 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!582 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54115 () Bool)

(declare-fun call!54117 () ListLongMap!16401)

(assert (=> bm!54115 (= call!54117 call!54121)))

(declare-fun b!1152551 () Bool)

(declare-fun e!655506 () Bool)

(declare-fun e!655513 () Bool)

(assert (=> b!1152551 (= e!655506 (and e!655513 mapRes!45191))))

(declare-fun condMapEmpty!45191 () Bool)

(declare-fun mapDefault!45191 () ValueCell!13746)

(assert (=> b!1152551 (= condMapEmpty!45191 (= (arr!35986 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13746)) mapDefault!45191)))))

(declare-fun res!766246 () Bool)

(assert (=> start!98776 (=> (not res!766246) (not e!655504))))

(assert (=> start!98776 (= res!766246 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36521 _keys!1208))))))

(assert (=> start!98776 e!655504))

(declare-fun tp_is_empty!28911 () Bool)

(assert (=> start!98776 tp_is_empty!28911))

(declare-fun array_inv!27556 (array!74669) Bool)

(assert (=> start!98776 (array_inv!27556 _keys!1208)))

(assert (=> start!98776 true))

(assert (=> start!98776 tp!85854))

(declare-fun array_inv!27557 (array!74671) Bool)

(assert (=> start!98776 (and (array_inv!27557 _values!996) e!655506)))

(declare-fun b!1152552 () Bool)

(declare-fun e!655500 () Unit!37927)

(assert (=> b!1152552 (= e!655502 e!655500)))

(declare-fun c!114289 () Bool)

(assert (=> b!1152552 (= c!114289 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!516313))))

(declare-fun b!1152553 () Bool)

(declare-fun Unit!37930 () Unit!37927)

(assert (=> b!1152553 (= e!655500 Unit!37930)))

(declare-fun b!1152554 () Bool)

(assert (=> b!1152554 (= e!655510 (= call!54120 call!54119))))

(declare-fun b!1152555 () Bool)

(assert (=> b!1152555 (= e!655503 tp_is_empty!28911)))

(declare-fun b!1152556 () Bool)

(assert (=> b!1152556 (= c!114287 (and (not lt!516313) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1152556 (= e!655505 e!655502)))

(declare-fun bm!54116 () Bool)

(assert (=> bm!54116 (= call!54118 (contains!6734 (ite c!114292 lt!516316 call!54117) k0!934))))

(declare-fun b!1152557 () Bool)

(declare-fun res!766249 () Bool)

(assert (=> b!1152557 (=> (not res!766249) (not e!655511))))

(assert (=> b!1152557 (= res!766249 (arrayNoDuplicates!0 lt!516308 #b00000000000000000000000000000000 Nil!25177))))

(declare-fun b!1152558 () Bool)

(declare-fun res!766239 () Bool)

(assert (=> b!1152558 (=> (not res!766239) (not e!655504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74669 (_ BitVec 32)) Bool)

(assert (=> b!1152558 (= res!766239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!54117 () Bool)

(assert (=> bm!54117 (= call!54121 (+!3634 lt!516321 (ite (or c!114292 c!114287) (tuple2!18433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1152559 () Bool)

(assert (=> b!1152559 (= e!655509 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1152560 () Bool)

(assert (=> b!1152560 call!54116))

(declare-fun lt!516317 () Unit!37927)

(assert (=> b!1152560 (= lt!516317 call!54114)))

(assert (=> b!1152560 (= e!655500 lt!516317)))

(declare-fun b!1152561 () Bool)

(assert (=> b!1152561 (= e!655499 true)))

(assert (=> b!1152561 e!655501))

(declare-fun res!766242 () Bool)

(assert (=> b!1152561 (=> (not res!766242) (not e!655501))))

(assert (=> b!1152561 (= res!766242 (= lt!516327 lt!516321))))

(declare-fun -!1346 (ListLongMap!16401 (_ BitVec 64)) ListLongMap!16401)

(assert (=> b!1152561 (= lt!516327 (-!1346 lt!516323 k0!934))))

(declare-fun lt!516307 () V!43675)

(assert (=> b!1152561 (= (-!1346 (+!3634 lt!516321 (tuple2!18433 (select (arr!35985 _keys!1208) from!1455) lt!516307)) (select (arr!35985 _keys!1208) from!1455)) lt!516321)))

(declare-fun lt!516318 () Unit!37927)

(declare-fun addThenRemoveForNewKeyIsSame!187 (ListLongMap!16401 (_ BitVec 64) V!43675) Unit!37927)

(assert (=> b!1152561 (= lt!516318 (addThenRemoveForNewKeyIsSame!187 lt!516321 (select (arr!35985 _keys!1208) from!1455) lt!516307))))

(declare-fun get!18327 (ValueCell!13746 V!43675) V!43675)

(assert (=> b!1152561 (= lt!516307 (get!18327 (select (arr!35986 _values!996) from!1455) lt!516320))))

(declare-fun lt!516319 () Unit!37927)

(assert (=> b!1152561 (= lt!516319 e!655514)))

(declare-fun c!114290 () Bool)

(assert (=> b!1152561 (= c!114290 (contains!6734 lt!516321 k0!934))))

(assert (=> b!1152561 (= lt!516321 (getCurrentListMapNoExtraKeys!4688 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45191 () Bool)

(assert (=> mapIsEmpty!45191 mapRes!45191))

(declare-fun b!1152562 () Bool)

(assert (=> b!1152562 (= e!655504 e!655511)))

(declare-fun res!766243 () Bool)

(assert (=> b!1152562 (=> (not res!766243) (not e!655511))))

(assert (=> b!1152562 (= res!766243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!516308 mask!1564))))

(assert (=> b!1152562 (= lt!516308 (array!74670 (store (arr!35985 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36521 _keys!1208)))))

(declare-fun b!1152563 () Bool)

(assert (=> b!1152563 (= e!655515 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1152564 () Bool)

(assert (=> b!1152564 (= e!655513 tp_is_empty!28911)))

(declare-fun b!1152565 () Bool)

(assert (=> b!1152565 (= e!655515 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!516313) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1152566 () Bool)

(declare-fun Unit!37931 () Unit!37927)

(assert (=> b!1152566 (= e!655514 Unit!37931)))

(declare-fun b!1152567 () Bool)

(assert (=> b!1152567 (= e!655510 (= call!54120 (-!1346 call!54119 k0!934)))))

(declare-fun bm!54118 () Bool)

(assert (=> bm!54118 (= call!54114 call!54115)))

(assert (= (and start!98776 res!766246) b!1152543))

(assert (= (and b!1152543 res!766251) b!1152546))

(assert (= (and b!1152546 res!766241) b!1152558))

(assert (= (and b!1152558 res!766239) b!1152548))

(assert (= (and b!1152548 res!766250) b!1152540))

(assert (= (and b!1152540 res!766247) b!1152542))

(assert (= (and b!1152542 res!766245) b!1152538))

(assert (= (and b!1152538 res!766252) b!1152562))

(assert (= (and b!1152562 res!766243) b!1152557))

(assert (= (and b!1152557 res!766249) b!1152545))

(assert (= (and b!1152545 (not res!766244)) b!1152539))

(assert (= (and b!1152539 (not res!766253)) b!1152550))

(assert (= (and b!1152550 c!114291) b!1152567))

(assert (= (and b!1152550 (not c!114291)) b!1152554))

(assert (= (or b!1152567 b!1152554) bm!54113))

(assert (= (or b!1152567 b!1152554) bm!54112))

(assert (= (and b!1152550 (not res!766248)) b!1152561))

(assert (= (and b!1152561 c!114290) b!1152549))

(assert (= (and b!1152561 (not c!114290)) b!1152566))

(assert (= (and b!1152549 c!114292) b!1152544))

(assert (= (and b!1152549 (not c!114292)) b!1152556))

(assert (= (and b!1152556 c!114287) b!1152541))

(assert (= (and b!1152556 (not c!114287)) b!1152552))

(assert (= (and b!1152552 c!114289) b!1152560))

(assert (= (and b!1152552 (not c!114289)) b!1152553))

(assert (= (or b!1152541 b!1152560) bm!54118))

(assert (= (or b!1152541 b!1152560) bm!54115))

(assert (= (or b!1152541 b!1152560) bm!54111))

(assert (= (or b!1152544 bm!54111) bm!54116))

(assert (= (or b!1152544 bm!54118) bm!54114))

(assert (= (or b!1152544 bm!54115) bm!54117))

(assert (= (and b!1152549 c!114288) b!1152563))

(assert (= (and b!1152549 (not c!114288)) b!1152565))

(assert (= (and b!1152549 res!766240) b!1152559))

(assert (= (and b!1152561 res!766242) b!1152547))

(assert (= (and b!1152551 condMapEmpty!45191) mapIsEmpty!45191))

(assert (= (and b!1152551 (not condMapEmpty!45191)) mapNonEmpty!45191))

(get-info :version)

(assert (= (and mapNonEmpty!45191 ((_ is ValueCellFull!13746) mapValue!45191)) b!1152555))

(assert (= (and b!1152551 ((_ is ValueCellFull!13746) mapDefault!45191)) b!1152564))

(assert (= start!98776 b!1152551))

(declare-fun b_lambda!19487 () Bool)

(assert (=> (not b_lambda!19487) (not b!1152539)))

(declare-fun t!36551 () Bool)

(declare-fun tb!9193 () Bool)

(assert (=> (and start!98776 (= defaultEntry!1004 defaultEntry!1004) t!36551) tb!9193))

(declare-fun result!18951 () Bool)

(assert (=> tb!9193 (= result!18951 tp_is_empty!28911)))

(assert (=> b!1152539 t!36551))

(declare-fun b_and!39613 () Bool)

(assert (= b_and!39611 (and (=> t!36551 result!18951) b_and!39613)))

(declare-fun m!1062505 () Bool)

(assert (=> b!1152562 m!1062505))

(declare-fun m!1062507 () Bool)

(assert (=> b!1152562 m!1062507))

(declare-fun m!1062509 () Bool)

(assert (=> b!1152558 m!1062509))

(declare-fun m!1062511 () Bool)

(assert (=> b!1152549 m!1062511))

(declare-fun m!1062513 () Bool)

(assert (=> b!1152549 m!1062513))

(declare-fun m!1062515 () Bool)

(assert (=> b!1152549 m!1062515))

(declare-fun m!1062517 () Bool)

(assert (=> b!1152549 m!1062517))

(declare-fun m!1062519 () Bool)

(assert (=> b!1152547 m!1062519))

(declare-fun m!1062521 () Bool)

(assert (=> b!1152538 m!1062521))

(declare-fun m!1062523 () Bool)

(assert (=> b!1152557 m!1062523))

(declare-fun m!1062525 () Bool)

(assert (=> b!1152543 m!1062525))

(assert (=> bm!54113 m!1062519))

(declare-fun m!1062527 () Bool)

(assert (=> mapNonEmpty!45191 m!1062527))

(declare-fun m!1062529 () Bool)

(assert (=> bm!54117 m!1062529))

(declare-fun m!1062531 () Bool)

(assert (=> start!98776 m!1062531))

(declare-fun m!1062533 () Bool)

(assert (=> start!98776 m!1062533))

(declare-fun m!1062535 () Bool)

(assert (=> bm!54114 m!1062535))

(declare-fun m!1062537 () Bool)

(assert (=> b!1152539 m!1062537))

(declare-fun m!1062539 () Bool)

(assert (=> b!1152539 m!1062539))

(declare-fun m!1062541 () Bool)

(assert (=> b!1152539 m!1062541))

(declare-fun m!1062543 () Bool)

(assert (=> b!1152539 m!1062543))

(declare-fun m!1062545 () Bool)

(assert (=> b!1152559 m!1062545))

(declare-fun m!1062547 () Bool)

(assert (=> b!1152550 m!1062547))

(declare-fun m!1062549 () Bool)

(assert (=> b!1152550 m!1062549))

(declare-fun m!1062551 () Bool)

(assert (=> b!1152545 m!1062551))

(declare-fun m!1062553 () Bool)

(assert (=> b!1152545 m!1062553))

(declare-fun m!1062555 () Bool)

(assert (=> b!1152567 m!1062555))

(declare-fun m!1062557 () Bool)

(assert (=> b!1152544 m!1062557))

(assert (=> b!1152544 m!1062557))

(declare-fun m!1062559 () Bool)

(assert (=> b!1152544 m!1062559))

(declare-fun m!1062561 () Bool)

(assert (=> b!1152544 m!1062561))

(declare-fun m!1062563 () Bool)

(assert (=> b!1152548 m!1062563))

(declare-fun m!1062565 () Bool)

(assert (=> b!1152561 m!1062565))

(assert (=> b!1152561 m!1062547))

(declare-fun m!1062567 () Bool)

(assert (=> b!1152561 m!1062567))

(declare-fun m!1062569 () Bool)

(assert (=> b!1152561 m!1062569))

(declare-fun m!1062571 () Bool)

(assert (=> b!1152561 m!1062571))

(assert (=> b!1152561 m!1062547))

(declare-fun m!1062573 () Bool)

(assert (=> b!1152561 m!1062573))

(declare-fun m!1062575 () Bool)

(assert (=> b!1152561 m!1062575))

(assert (=> b!1152561 m!1062569))

(declare-fun m!1062577 () Bool)

(assert (=> b!1152561 m!1062577))

(assert (=> b!1152561 m!1062547))

(declare-fun m!1062579 () Bool)

(assert (=> b!1152561 m!1062579))

(assert (=> b!1152561 m!1062571))

(assert (=> b!1152563 m!1062545))

(assert (=> bm!54112 m!1062565))

(declare-fun m!1062581 () Bool)

(assert (=> b!1152542 m!1062581))

(declare-fun m!1062583 () Bool)

(assert (=> bm!54116 m!1062583))

(check-sat (not b!1152550) (not bm!54112) (not b!1152539) (not b!1152562) (not b!1152543) (not b!1152559) (not mapNonEmpty!45191) (not b!1152561) (not b!1152567) (not b!1152558) (not b!1152563) b_and!39613 (not b!1152557) (not b!1152548) (not bm!54117) (not b!1152547) (not bm!54116) (not start!98776) (not b!1152544) (not b!1152542) (not bm!54113) (not bm!54114) (not b!1152545) (not b_lambda!19487) (not b_next!24381) (not b!1152549) tp_is_empty!28911)
(check-sat b_and!39613 (not b_next!24381))
