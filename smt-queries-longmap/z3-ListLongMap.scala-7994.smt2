; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98806 () Bool)

(assert start!98806)

(declare-fun b_free!24411 () Bool)

(declare-fun b_next!24411 () Bool)

(assert (=> start!98806 (= b_free!24411 (not b_next!24411))))

(declare-fun tp!85943 () Bool)

(declare-fun b_and!39671 () Bool)

(assert (=> start!98806 (= tp!85943 b_and!39671)))

(declare-fun res!766920 () Bool)

(declare-fun e!656265 () Bool)

(assert (=> start!98806 (=> (not res!766920) (not e!656265))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74729 0))(
  ( (array!74730 (arr!36015 (Array (_ BitVec 32) (_ BitVec 64))) (size!36551 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74729)

(assert (=> start!98806 (= res!766920 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36551 _keys!1208))))))

(assert (=> start!98806 e!656265))

(declare-fun tp_is_empty!28941 () Bool)

(assert (=> start!98806 tp_is_empty!28941))

(declare-fun array_inv!27570 (array!74729) Bool)

(assert (=> start!98806 (array_inv!27570 _keys!1208)))

(assert (=> start!98806 true))

(assert (=> start!98806 tp!85943))

(declare-datatypes ((V!43715 0))(
  ( (V!43716 (val!14527 Int)) )
))
(declare-datatypes ((ValueCell!13761 0))(
  ( (ValueCellFull!13761 (v!17164 V!43715)) (EmptyCell!13761) )
))
(declare-datatypes ((array!74731 0))(
  ( (array!74732 (arr!36016 (Array (_ BitVec 32) ValueCell!13761)) (size!36552 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74731)

(declare-fun e!656269 () Bool)

(declare-fun array_inv!27571 (array!74731) Bool)

(assert (=> start!98806 (and (array_inv!27571 _values!996) e!656269)))

(declare-fun b!1153918 () Bool)

(declare-fun c!114561 () Bool)

(declare-fun lt!517316 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1153918 (= c!114561 (and (not lt!517316) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37980 0))(
  ( (Unit!37981) )
))
(declare-fun e!656264 () Unit!37980)

(declare-fun e!656273 () Unit!37980)

(assert (=> b!1153918 (= e!656264 e!656273)))

(declare-fun b!1153919 () Bool)

(declare-fun e!656266 () Bool)

(declare-fun e!656271 () Bool)

(assert (=> b!1153919 (= e!656266 (not e!656271))))

(declare-fun res!766922 () Bool)

(assert (=> b!1153919 (=> res!766922 e!656271)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1153919 (= res!766922 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1153919 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!517296 () Unit!37980)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74729 (_ BitVec 64) (_ BitVec 32)) Unit!37980)

(assert (=> b!1153919 (= lt!517296 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun zeroValue!944 () V!43715)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!517308 () array!74729)

(declare-fun e!656270 () Bool)

(declare-fun b!1153920 () Bool)

(declare-fun lt!517313 () array!74731)

(declare-datatypes ((tuple2!18462 0))(
  ( (tuple2!18463 (_1!9242 (_ BitVec 64)) (_2!9242 V!43715)) )
))
(declare-datatypes ((List!25206 0))(
  ( (Nil!25203) (Cons!25202 (h!26411 tuple2!18462) (t!36609 List!25206)) )
))
(declare-datatypes ((ListLongMap!16431 0))(
  ( (ListLongMap!16432 (toList!8231 List!25206)) )
))
(declare-fun lt!517302 () ListLongMap!16431)

(declare-fun minValue!944 () V!43715)

(declare-fun getCurrentListMapNoExtraKeys!4700 (array!74729 array!74731 (_ BitVec 32) (_ BitVec 32) V!43715 V!43715 (_ BitVec 32) Int) ListLongMap!16431)

(assert (=> b!1153920 (= e!656270 (= lt!517302 (getCurrentListMapNoExtraKeys!4700 lt!517308 lt!517313 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1153921 () Bool)

(declare-fun call!54474 () Bool)

(assert (=> b!1153921 call!54474))

(declare-fun lt!517306 () Unit!37980)

(declare-fun call!54475 () Unit!37980)

(assert (=> b!1153921 (= lt!517306 call!54475)))

(declare-fun e!656275 () Unit!37980)

(assert (=> b!1153921 (= e!656275 lt!517306)))

(declare-fun b!1153922 () Bool)

(declare-fun res!766915 () Bool)

(assert (=> b!1153922 (=> (not res!766915) (not e!656265))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1153922 (= res!766915 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!45236 () Bool)

(declare-fun mapRes!45236 () Bool)

(assert (=> mapIsEmpty!45236 mapRes!45236))

(declare-fun bm!54471 () Bool)

(declare-fun call!54481 () Unit!37980)

(assert (=> bm!54471 (= call!54475 call!54481)))

(declare-fun b!1153923 () Bool)

(declare-fun lt!517312 () Unit!37980)

(assert (=> b!1153923 (= e!656273 lt!517312)))

(assert (=> b!1153923 (= lt!517312 call!54475)))

(assert (=> b!1153923 call!54474))

(declare-fun b!1153924 () Bool)

(declare-fun e!656280 () Unit!37980)

(declare-fun Unit!37982 () Unit!37980)

(assert (=> b!1153924 (= e!656280 Unit!37982)))

(declare-fun b!1153925 () Bool)

(declare-fun res!766924 () Bool)

(assert (=> b!1153925 (=> (not res!766924) (not e!656265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74729 (_ BitVec 32)) Bool)

(assert (=> b!1153925 (= res!766924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!656277 () Bool)

(declare-fun b!1153926 () Bool)

(assert (=> b!1153926 (= e!656277 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!54472 () Bool)

(declare-fun call!54477 () ListLongMap!16431)

(assert (=> bm!54472 (= call!54477 (getCurrentListMapNoExtraKeys!4700 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153927 () Bool)

(assert (=> b!1153927 (= e!656273 e!656275)))

(declare-fun c!114560 () Bool)

(assert (=> b!1153927 (= c!114560 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!517316))))

(declare-fun lt!517303 () ListLongMap!16431)

(declare-fun c!114558 () Bool)

(declare-fun call!54476 () ListLongMap!16431)

(declare-fun call!54480 () Bool)

(declare-fun bm!54473 () Bool)

(declare-fun contains!6745 (ListLongMap!16431 (_ BitVec 64)) Bool)

(assert (=> bm!54473 (= call!54480 (contains!6745 (ite c!114558 lt!517303 call!54476) k0!934))))

(declare-fun b!1153928 () Bool)

(declare-fun e!656278 () Bool)

(assert (=> b!1153928 (= e!656278 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!517316) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1153929 () Bool)

(declare-fun +!3644 (ListLongMap!16431 tuple2!18462) ListLongMap!16431)

(assert (=> b!1153929 (contains!6745 (+!3644 lt!517303 (tuple2!18463 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!517314 () Unit!37980)

(assert (=> b!1153929 (= lt!517314 call!54481)))

(assert (=> b!1153929 call!54480))

(declare-fun call!54479 () ListLongMap!16431)

(assert (=> b!1153929 (= lt!517303 call!54479)))

(declare-fun lt!517300 () Unit!37980)

(declare-fun lt!517317 () ListLongMap!16431)

(declare-fun addStillContains!890 (ListLongMap!16431 (_ BitVec 64) V!43715 (_ BitVec 64)) Unit!37980)

(assert (=> b!1153929 (= lt!517300 (addStillContains!890 lt!517317 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1153929 (= e!656264 lt!517314)))

(declare-fun bm!54474 () Bool)

(assert (=> bm!54474 (= call!54479 (+!3644 lt!517317 (ite (or c!114558 c!114561) (tuple2!18463 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18463 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun call!54478 () ListLongMap!16431)

(declare-fun e!656267 () Bool)

(declare-fun b!1153930 () Bool)

(declare-fun -!1353 (ListLongMap!16431 (_ BitVec 64)) ListLongMap!16431)

(assert (=> b!1153930 (= e!656267 (= call!54478 (-!1353 call!54477 k0!934)))))

(declare-fun b!1153931 () Bool)

(declare-fun res!766921 () Bool)

(assert (=> b!1153931 (=> (not res!766921) (not e!656265))))

(assert (=> b!1153931 (= res!766921 (and (= (size!36552 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36551 _keys!1208) (size!36552 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1153932 () Bool)

(declare-fun e!656274 () Bool)

(assert (=> b!1153932 (= e!656274 tp_is_empty!28941)))

(declare-fun b!1153933 () Bool)

(assert (=> b!1153933 (= e!656267 (= call!54478 call!54477))))

(declare-fun b!1153934 () Bool)

(declare-fun Unit!37983 () Unit!37980)

(assert (=> b!1153934 (= e!656280 Unit!37983)))

(assert (=> b!1153934 (= lt!517316 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1153934 (= c!114558 (and (not lt!517316) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!517297 () Unit!37980)

(assert (=> b!1153934 (= lt!517297 e!656264)))

(declare-fun lt!517307 () Unit!37980)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!482 (array!74729 array!74731 (_ BitVec 32) (_ BitVec 32) V!43715 V!43715 (_ BitVec 64) (_ BitVec 32) Int) Unit!37980)

(assert (=> b!1153934 (= lt!517307 (lemmaListMapContainsThenArrayContainsFrom!482 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114557 () Bool)

(assert (=> b!1153934 (= c!114557 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766923 () Bool)

(assert (=> b!1153934 (= res!766923 e!656278)))

(assert (=> b!1153934 (=> (not res!766923) (not e!656277))))

(assert (=> b!1153934 e!656277))

(declare-fun lt!517298 () Unit!37980)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74729 (_ BitVec 32) (_ BitVec 32)) Unit!37980)

(assert (=> b!1153934 (= lt!517298 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25207 0))(
  ( (Nil!25204) (Cons!25203 (h!26412 (_ BitVec 64)) (t!36610 List!25207)) )
))
(declare-fun arrayNoDuplicates!0 (array!74729 (_ BitVec 32) List!25207) Bool)

(assert (=> b!1153934 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25204)))

(declare-fun lt!517304 () Unit!37980)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74729 (_ BitVec 64) (_ BitVec 32) List!25207) Unit!37980)

(assert (=> b!1153934 (= lt!517304 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25204))))

(assert (=> b!1153934 false))

(declare-fun b!1153935 () Bool)

(declare-fun res!766918 () Bool)

(assert (=> b!1153935 (=> (not res!766918) (not e!656265))))

(assert (=> b!1153935 (= res!766918 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36551 _keys!1208))))))

(declare-fun mapNonEmpty!45236 () Bool)

(declare-fun tp!85944 () Bool)

(assert (=> mapNonEmpty!45236 (= mapRes!45236 (and tp!85944 e!656274))))

(declare-fun mapValue!45236 () ValueCell!13761)

(declare-fun mapKey!45236 () (_ BitVec 32))

(declare-fun mapRest!45236 () (Array (_ BitVec 32) ValueCell!13761))

(assert (=> mapNonEmpty!45236 (= (arr!36016 _values!996) (store mapRest!45236 mapKey!45236 mapValue!45236))))

(declare-fun bm!54475 () Bool)

(assert (=> bm!54475 (= call!54476 call!54479)))

(declare-fun bm!54476 () Bool)

(assert (=> bm!54476 (= call!54481 (addStillContains!890 (ite c!114558 lt!517303 lt!517317) (ite c!114558 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114561 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114558 minValue!944 (ite c!114561 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1153936 () Bool)

(declare-fun e!656279 () Bool)

(assert (=> b!1153936 (= e!656279 tp_is_empty!28941)))

(declare-fun b!1153937 () Bool)

(declare-fun res!766919 () Bool)

(assert (=> b!1153937 (=> (not res!766919) (not e!656265))))

(assert (=> b!1153937 (= res!766919 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25204))))

(declare-fun b!1153938 () Bool)

(declare-fun e!656272 () Bool)

(declare-fun e!656268 () Bool)

(assert (=> b!1153938 (= e!656272 e!656268)))

(declare-fun res!766917 () Bool)

(assert (=> b!1153938 (=> res!766917 e!656268)))

(assert (=> b!1153938 (= res!766917 (not (= (select (arr!36015 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1153938 e!656267))

(declare-fun c!114562 () Bool)

(assert (=> b!1153938 (= c!114562 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!517310 () Unit!37980)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!588 (array!74729 array!74731 (_ BitVec 32) (_ BitVec 32) V!43715 V!43715 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37980)

(assert (=> b!1153938 (= lt!517310 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!588 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153939 () Bool)

(assert (=> b!1153939 (= e!656268 true)))

(assert (=> b!1153939 e!656270))

(declare-fun res!766927 () Bool)

(assert (=> b!1153939 (=> (not res!766927) (not e!656270))))

(assert (=> b!1153939 (= res!766927 (= lt!517302 lt!517317))))

(declare-fun lt!517305 () ListLongMap!16431)

(assert (=> b!1153939 (= lt!517302 (-!1353 lt!517305 k0!934))))

(declare-fun lt!517311 () V!43715)

(assert (=> b!1153939 (= (-!1353 (+!3644 lt!517317 (tuple2!18463 (select (arr!36015 _keys!1208) from!1455) lt!517311)) (select (arr!36015 _keys!1208) from!1455)) lt!517317)))

(declare-fun lt!517315 () Unit!37980)

(declare-fun addThenRemoveForNewKeyIsSame!193 (ListLongMap!16431 (_ BitVec 64) V!43715) Unit!37980)

(assert (=> b!1153939 (= lt!517315 (addThenRemoveForNewKeyIsSame!193 lt!517317 (select (arr!36015 _keys!1208) from!1455) lt!517311))))

(declare-fun lt!517301 () V!43715)

(declare-fun get!18343 (ValueCell!13761 V!43715) V!43715)

(assert (=> b!1153939 (= lt!517311 (get!18343 (select (arr!36016 _values!996) from!1455) lt!517301))))

(declare-fun lt!517309 () Unit!37980)

(assert (=> b!1153939 (= lt!517309 e!656280)))

(declare-fun c!114559 () Bool)

(assert (=> b!1153939 (= c!114559 (contains!6745 lt!517317 k0!934))))

(assert (=> b!1153939 (= lt!517317 (getCurrentListMapNoExtraKeys!4700 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153940 () Bool)

(declare-fun res!766925 () Bool)

(assert (=> b!1153940 (=> (not res!766925) (not e!656265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1153940 (= res!766925 (validMask!0 mask!1564))))

(declare-fun b!1153941 () Bool)

(assert (=> b!1153941 (= e!656265 e!656266)))

(declare-fun res!766928 () Bool)

(assert (=> b!1153941 (=> (not res!766928) (not e!656266))))

(assert (=> b!1153941 (= res!766928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!517308 mask!1564))))

(assert (=> b!1153941 (= lt!517308 (array!74730 (store (arr!36015 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36551 _keys!1208)))))

(declare-fun b!1153942 () Bool)

(assert (=> b!1153942 (= e!656278 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1153943 () Bool)

(assert (=> b!1153943 (= e!656269 (and e!656279 mapRes!45236))))

(declare-fun condMapEmpty!45236 () Bool)

(declare-fun mapDefault!45236 () ValueCell!13761)

(assert (=> b!1153943 (= condMapEmpty!45236 (= (arr!36016 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13761)) mapDefault!45236)))))

(declare-fun bm!54477 () Bool)

(assert (=> bm!54477 (= call!54478 (getCurrentListMapNoExtraKeys!4700 lt!517308 lt!517313 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153944 () Bool)

(assert (=> b!1153944 (= e!656271 e!656272)))

(declare-fun res!766914 () Bool)

(assert (=> b!1153944 (=> res!766914 e!656272)))

(assert (=> b!1153944 (= res!766914 (not (= from!1455 i!673)))))

(declare-fun lt!517299 () ListLongMap!16431)

(assert (=> b!1153944 (= lt!517299 (getCurrentListMapNoExtraKeys!4700 lt!517308 lt!517313 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1153944 (= lt!517313 (array!74732 (store (arr!36016 _values!996) i!673 (ValueCellFull!13761 lt!517301)) (size!36552 _values!996)))))

(declare-fun dynLambda!2714 (Int (_ BitVec 64)) V!43715)

(assert (=> b!1153944 (= lt!517301 (dynLambda!2714 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1153944 (= lt!517305 (getCurrentListMapNoExtraKeys!4700 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!54478 () Bool)

(assert (=> bm!54478 (= call!54474 call!54480)))

(declare-fun b!1153945 () Bool)

(declare-fun res!766926 () Bool)

(assert (=> b!1153945 (=> (not res!766926) (not e!656266))))

(assert (=> b!1153945 (= res!766926 (arrayNoDuplicates!0 lt!517308 #b00000000000000000000000000000000 Nil!25204))))

(declare-fun b!1153946 () Bool)

(declare-fun Unit!37984 () Unit!37980)

(assert (=> b!1153946 (= e!656275 Unit!37984)))

(declare-fun b!1153947 () Bool)

(declare-fun res!766916 () Bool)

(assert (=> b!1153947 (=> (not res!766916) (not e!656265))))

(assert (=> b!1153947 (= res!766916 (= (select (arr!36015 _keys!1208) i!673) k0!934))))

(assert (= (and start!98806 res!766920) b!1153940))

(assert (= (and b!1153940 res!766925) b!1153931))

(assert (= (and b!1153931 res!766921) b!1153925))

(assert (= (and b!1153925 res!766924) b!1153937))

(assert (= (and b!1153937 res!766919) b!1153935))

(assert (= (and b!1153935 res!766918) b!1153922))

(assert (= (and b!1153922 res!766915) b!1153947))

(assert (= (and b!1153947 res!766916) b!1153941))

(assert (= (and b!1153941 res!766928) b!1153945))

(assert (= (and b!1153945 res!766926) b!1153919))

(assert (= (and b!1153919 (not res!766922)) b!1153944))

(assert (= (and b!1153944 (not res!766914)) b!1153938))

(assert (= (and b!1153938 c!114562) b!1153930))

(assert (= (and b!1153938 (not c!114562)) b!1153933))

(assert (= (or b!1153930 b!1153933) bm!54477))

(assert (= (or b!1153930 b!1153933) bm!54472))

(assert (= (and b!1153938 (not res!766917)) b!1153939))

(assert (= (and b!1153939 c!114559) b!1153934))

(assert (= (and b!1153939 (not c!114559)) b!1153924))

(assert (= (and b!1153934 c!114558) b!1153929))

(assert (= (and b!1153934 (not c!114558)) b!1153918))

(assert (= (and b!1153918 c!114561) b!1153923))

(assert (= (and b!1153918 (not c!114561)) b!1153927))

(assert (= (and b!1153927 c!114560) b!1153921))

(assert (= (and b!1153927 (not c!114560)) b!1153946))

(assert (= (or b!1153923 b!1153921) bm!54471))

(assert (= (or b!1153923 b!1153921) bm!54475))

(assert (= (or b!1153923 b!1153921) bm!54478))

(assert (= (or b!1153929 bm!54478) bm!54473))

(assert (= (or b!1153929 bm!54471) bm!54476))

(assert (= (or b!1153929 bm!54475) bm!54474))

(assert (= (and b!1153934 c!114557) b!1153942))

(assert (= (and b!1153934 (not c!114557)) b!1153928))

(assert (= (and b!1153934 res!766923) b!1153926))

(assert (= (and b!1153939 res!766927) b!1153920))

(assert (= (and b!1153943 condMapEmpty!45236) mapIsEmpty!45236))

(assert (= (and b!1153943 (not condMapEmpty!45236)) mapNonEmpty!45236))

(get-info :version)

(assert (= (and mapNonEmpty!45236 ((_ is ValueCellFull!13761) mapValue!45236)) b!1153932))

(assert (= (and b!1153943 ((_ is ValueCellFull!13761) mapDefault!45236)) b!1153936))

(assert (= start!98806 b!1153943))

(declare-fun b_lambda!19517 () Bool)

(assert (=> (not b_lambda!19517) (not b!1153944)))

(declare-fun t!36608 () Bool)

(declare-fun tb!9223 () Bool)

(assert (=> (and start!98806 (= defaultEntry!1004 defaultEntry!1004) t!36608) tb!9223))

(declare-fun result!19011 () Bool)

(assert (=> tb!9223 (= result!19011 tp_is_empty!28941)))

(assert (=> b!1153944 t!36608))

(declare-fun b_and!39673 () Bool)

(assert (= b_and!39671 (and (=> t!36608 result!19011) b_and!39673)))

(declare-fun m!1063705 () Bool)

(assert (=> b!1153940 m!1063705))

(declare-fun m!1063707 () Bool)

(assert (=> bm!54477 m!1063707))

(declare-fun m!1063709 () Bool)

(assert (=> start!98806 m!1063709))

(declare-fun m!1063711 () Bool)

(assert (=> start!98806 m!1063711))

(declare-fun m!1063713 () Bool)

(assert (=> b!1153925 m!1063713))

(declare-fun m!1063715 () Bool)

(assert (=> b!1153934 m!1063715))

(declare-fun m!1063717 () Bool)

(assert (=> b!1153934 m!1063717))

(declare-fun m!1063719 () Bool)

(assert (=> b!1153934 m!1063719))

(declare-fun m!1063721 () Bool)

(assert (=> b!1153934 m!1063721))

(declare-fun m!1063723 () Bool)

(assert (=> b!1153942 m!1063723))

(declare-fun m!1063725 () Bool)

(assert (=> b!1153922 m!1063725))

(declare-fun m!1063727 () Bool)

(assert (=> bm!54472 m!1063727))

(declare-fun m!1063729 () Bool)

(assert (=> b!1153947 m!1063729))

(declare-fun m!1063731 () Bool)

(assert (=> bm!54474 m!1063731))

(declare-fun m!1063733 () Bool)

(assert (=> mapNonEmpty!45236 m!1063733))

(declare-fun m!1063735 () Bool)

(assert (=> b!1153939 m!1063735))

(declare-fun m!1063737 () Bool)

(assert (=> b!1153939 m!1063737))

(declare-fun m!1063739 () Bool)

(assert (=> b!1153939 m!1063739))

(assert (=> b!1153939 m!1063739))

(declare-fun m!1063741 () Bool)

(assert (=> b!1153939 m!1063741))

(declare-fun m!1063743 () Bool)

(assert (=> b!1153939 m!1063743))

(declare-fun m!1063745 () Bool)

(assert (=> b!1153939 m!1063745))

(assert (=> b!1153939 m!1063743))

(assert (=> b!1153939 m!1063735))

(declare-fun m!1063747 () Bool)

(assert (=> b!1153939 m!1063747))

(assert (=> b!1153939 m!1063727))

(assert (=> b!1153939 m!1063735))

(declare-fun m!1063749 () Bool)

(assert (=> b!1153939 m!1063749))

(declare-fun m!1063751 () Bool)

(assert (=> b!1153944 m!1063751))

(declare-fun m!1063753 () Bool)

(assert (=> b!1153944 m!1063753))

(declare-fun m!1063755 () Bool)

(assert (=> b!1153944 m!1063755))

(declare-fun m!1063757 () Bool)

(assert (=> b!1153944 m!1063757))

(declare-fun m!1063759 () Bool)

(assert (=> b!1153929 m!1063759))

(assert (=> b!1153929 m!1063759))

(declare-fun m!1063761 () Bool)

(assert (=> b!1153929 m!1063761))

(declare-fun m!1063763 () Bool)

(assert (=> b!1153929 m!1063763))

(assert (=> b!1153938 m!1063735))

(declare-fun m!1063765 () Bool)

(assert (=> b!1153938 m!1063765))

(assert (=> b!1153920 m!1063707))

(declare-fun m!1063767 () Bool)

(assert (=> b!1153930 m!1063767))

(declare-fun m!1063769 () Bool)

(assert (=> b!1153945 m!1063769))

(assert (=> b!1153926 m!1063723))

(declare-fun m!1063771 () Bool)

(assert (=> b!1153919 m!1063771))

(declare-fun m!1063773 () Bool)

(assert (=> b!1153919 m!1063773))

(declare-fun m!1063775 () Bool)

(assert (=> bm!54473 m!1063775))

(declare-fun m!1063777 () Bool)

(assert (=> bm!54476 m!1063777))

(declare-fun m!1063779 () Bool)

(assert (=> b!1153941 m!1063779))

(declare-fun m!1063781 () Bool)

(assert (=> b!1153941 m!1063781))

(declare-fun m!1063783 () Bool)

(assert (=> b!1153937 m!1063783))

(check-sat (not start!98806) (not b!1153920) (not b!1153919) (not b!1153929) (not b!1153922) (not b!1153937) (not b_lambda!19517) (not bm!54477) tp_is_empty!28941 (not bm!54474) (not bm!54473) (not b!1153945) (not b!1153925) (not b!1153944) (not b!1153934) (not b!1153939) (not bm!54476) (not b!1153940) (not b!1153926) (not b!1153930) (not b!1153942) (not bm!54472) (not b!1153938) (not b!1153941) (not b_next!24411) b_and!39673 (not mapNonEmpty!45236))
(check-sat b_and!39673 (not b_next!24411))
