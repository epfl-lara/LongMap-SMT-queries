; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98974 () Bool)

(assert start!98974)

(declare-fun b_free!24343 () Bool)

(declare-fun b_next!24343 () Bool)

(assert (=> start!98974 (= b_free!24343 (not b_next!24343))))

(declare-fun tp!85740 () Bool)

(declare-fun b_and!39537 () Bool)

(assert (=> start!98974 (= tp!85740 b_and!39537)))

(declare-fun b!1152079 () Bool)

(declare-datatypes ((Unit!37827 0))(
  ( (Unit!37828) )
))
(declare-fun e!655364 () Unit!37827)

(declare-fun Unit!37829 () Unit!37827)

(assert (=> b!1152079 (= e!655364 Unit!37829)))

(declare-datatypes ((V!43625 0))(
  ( (V!43626 (val!14493 Int)) )
))
(declare-fun zeroValue!944 () V!43625)

(declare-fun c!114348 () Bool)

(declare-datatypes ((tuple2!18412 0))(
  ( (tuple2!18413 (_1!9217 (_ BitVec 64)) (_2!9217 V!43625)) )
))
(declare-datatypes ((List!25165 0))(
  ( (Nil!25162) (Cons!25161 (h!26379 tuple2!18412) (t!36492 List!25165)) )
))
(declare-datatypes ((ListLongMap!16389 0))(
  ( (ListLongMap!16390 (toList!8210 List!25165)) )
))
(declare-fun call!53727 () ListLongMap!16389)

(declare-fun lt!515550 () ListLongMap!16389)

(declare-fun minValue!944 () V!43625)

(declare-fun bm!53720 () Bool)

(declare-fun c!114343 () Bool)

(declare-fun +!3648 (ListLongMap!16389 tuple2!18412) ListLongMap!16389)

(assert (=> bm!53720 (= call!53727 (+!3648 lt!515550 (ite (or c!114343 c!114348) (tuple2!18413 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18413 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1152080 () Bool)

(declare-fun e!655378 () Unit!37827)

(declare-fun Unit!37830 () Unit!37827)

(assert (=> b!1152080 (= e!655378 Unit!37830)))

(declare-fun b!1152081 () Bool)

(declare-fun e!655372 () Bool)

(declare-fun call!53725 () ListLongMap!16389)

(declare-fun call!53729 () ListLongMap!16389)

(assert (=> b!1152081 (= e!655372 (= call!53725 call!53729))))

(declare-fun b!1152082 () Bool)

(declare-fun e!655366 () Bool)

(declare-fun e!655374 () Bool)

(declare-fun mapRes!45134 () Bool)

(assert (=> b!1152082 (= e!655366 (and e!655374 mapRes!45134))))

(declare-fun condMapEmpty!45134 () Bool)

(declare-datatypes ((ValueCell!13727 0))(
  ( (ValueCellFull!13727 (v!17126 V!43625)) (EmptyCell!13727) )
))
(declare-datatypes ((array!74639 0))(
  ( (array!74640 (arr!35964 (Array (_ BitVec 32) ValueCell!13727)) (size!36501 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74639)

(declare-fun mapDefault!45134 () ValueCell!13727)

(assert (=> b!1152082 (= condMapEmpty!45134 (= (arr!35964 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13727)) mapDefault!45134)))))

(declare-fun b!1152083 () Bool)

(declare-fun tp_is_empty!28873 () Bool)

(assert (=> b!1152083 (= e!655374 tp_is_empty!28873)))

(declare-fun res!765898 () Bool)

(declare-fun e!655365 () Bool)

(assert (=> start!98974 (=> (not res!765898) (not e!655365))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74641 0))(
  ( (array!74642 (arr!35965 (Array (_ BitVec 32) (_ BitVec 64))) (size!36502 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74641)

(assert (=> start!98974 (= res!765898 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36502 _keys!1208))))))

(assert (=> start!98974 e!655365))

(assert (=> start!98974 tp_is_empty!28873))

(declare-fun array_inv!27594 (array!74641) Bool)

(assert (=> start!98974 (array_inv!27594 _keys!1208)))

(assert (=> start!98974 true))

(assert (=> start!98974 tp!85740))

(declare-fun array_inv!27595 (array!74639) Bool)

(assert (=> start!98974 (and (array_inv!27595 _values!996) e!655366)))

(declare-fun b!1152084 () Bool)

(declare-fun e!655373 () Unit!37827)

(declare-fun lt!515553 () Unit!37827)

(assert (=> b!1152084 (= e!655373 lt!515553)))

(declare-fun call!53728 () Unit!37827)

(assert (=> b!1152084 (= lt!515553 call!53728)))

(declare-fun call!53726 () Bool)

(assert (=> b!1152084 call!53726))

(declare-fun b!1152085 () Bool)

(assert (=> b!1152085 (= e!655373 e!655364)))

(declare-fun c!114347 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!515542 () Bool)

(assert (=> b!1152085 (= c!114347 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!515542))))

(declare-fun bm!53721 () Bool)

(declare-fun call!53724 () Unit!37827)

(assert (=> bm!53721 (= call!53728 call!53724)))

(declare-fun b!1152086 () Bool)

(declare-fun res!765901 () Bool)

(assert (=> b!1152086 (=> (not res!765901) (not e!655365))))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1152086 (= res!765901 (and (= (size!36501 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36502 _keys!1208) (size!36501 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1152087 () Bool)

(declare-fun res!765906 () Bool)

(assert (=> b!1152087 (=> (not res!765906) (not e!655365))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1152087 (= res!765906 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36502 _keys!1208))))))

(declare-fun b!1152088 () Bool)

(declare-fun e!655371 () Bool)

(declare-fun e!655368 () Bool)

(assert (=> b!1152088 (= e!655371 e!655368)))

(declare-fun res!765892 () Bool)

(assert (=> b!1152088 (=> res!765892 e!655368)))

(assert (=> b!1152088 (= res!765892 (not (= from!1455 i!673)))))

(declare-fun lt!515544 () array!74639)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!515555 () ListLongMap!16389)

(declare-fun lt!515540 () array!74641)

(declare-fun getCurrentListMapNoExtraKeys!4710 (array!74641 array!74639 (_ BitVec 32) (_ BitVec 32) V!43625 V!43625 (_ BitVec 32) Int) ListLongMap!16389)

(assert (=> b!1152088 (= lt!515555 (getCurrentListMapNoExtraKeys!4710 lt!515540 lt!515544 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!515549 () V!43625)

(assert (=> b!1152088 (= lt!515544 (array!74640 (store (arr!35964 _values!996) i!673 (ValueCellFull!13727 lt!515549)) (size!36501 _values!996)))))

(declare-fun dynLambda!2733 (Int (_ BitVec 64)) V!43625)

(assert (=> b!1152088 (= lt!515549 (dynLambda!2733 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!515552 () ListLongMap!16389)

(assert (=> b!1152088 (= lt!515552 (getCurrentListMapNoExtraKeys!4710 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!515546 () ListLongMap!16389)

(declare-fun bm!53722 () Bool)

(declare-fun addStillContains!872 (ListLongMap!16389 (_ BitVec 64) V!43625 (_ BitVec 64)) Unit!37827)

(assert (=> bm!53722 (= call!53724 (addStillContains!872 (ite c!114343 lt!515546 lt!515550) (ite c!114343 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114348 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114343 minValue!944 (ite c!114348 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1152089 () Bool)

(declare-fun lt!515554 () ListLongMap!16389)

(declare-fun e!655367 () Bool)

(assert (=> b!1152089 (= e!655367 (= lt!515554 (getCurrentListMapNoExtraKeys!4710 lt!515540 lt!515544 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun e!655369 () Bool)

(declare-fun b!1152090 () Bool)

(declare-fun arrayContainsKey!0 (array!74641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1152090 (= e!655369 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1152091 () Bool)

(declare-fun e!655362 () Bool)

(assert (=> b!1152091 (= e!655368 e!655362)))

(declare-fun res!765894 () Bool)

(assert (=> b!1152091 (=> res!765894 e!655362)))

(assert (=> b!1152091 (= res!765894 (not (= (select (arr!35965 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1152091 e!655372))

(declare-fun c!114345 () Bool)

(assert (=> b!1152091 (= c!114345 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!515539 () Unit!37827)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!575 (array!74641 array!74639 (_ BitVec 32) (_ BitVec 32) V!43625 V!43625 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37827)

(assert (=> b!1152091 (= lt!515539 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!575 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152092 () Bool)

(declare-fun res!765902 () Bool)

(assert (=> b!1152092 (=> (not res!765902) (not e!655365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74641 (_ BitVec 32)) Bool)

(assert (=> b!1152092 (= res!765902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!655370 () Bool)

(declare-fun b!1152093 () Bool)

(assert (=> b!1152093 (= e!655370 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1152094 () Bool)

(declare-fun res!765897 () Bool)

(assert (=> b!1152094 (=> (not res!765897) (not e!655365))))

(assert (=> b!1152094 (= res!765897 (= (select (arr!35965 _keys!1208) i!673) k0!934))))

(declare-fun b!1152095 () Bool)

(declare-fun e!655376 () Bool)

(assert (=> b!1152095 (= e!655376 tp_is_empty!28873)))

(declare-fun b!1152096 () Bool)

(declare-fun res!765903 () Bool)

(assert (=> b!1152096 (=> (not res!765903) (not e!655365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1152096 (= res!765903 (validMask!0 mask!1564))))

(declare-fun b!1152097 () Bool)

(declare-fun res!765905 () Bool)

(assert (=> b!1152097 (=> (not res!765905) (not e!655365))))

(declare-datatypes ((List!25166 0))(
  ( (Nil!25163) (Cons!25162 (h!26380 (_ BitVec 64)) (t!36493 List!25166)) )
))
(declare-fun arrayNoDuplicates!0 (array!74641 (_ BitVec 32) List!25166) Bool)

(assert (=> b!1152097 (= res!765905 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25163))))

(declare-fun b!1152098 () Bool)

(declare-fun res!765896 () Bool)

(declare-fun e!655375 () Bool)

(assert (=> b!1152098 (=> (not res!765896) (not e!655375))))

(assert (=> b!1152098 (= res!765896 (arrayNoDuplicates!0 lt!515540 #b00000000000000000000000000000000 Nil!25163))))

(declare-fun bm!53723 () Bool)

(assert (=> bm!53723 (= call!53725 (getCurrentListMapNoExtraKeys!4710 lt!515540 lt!515544 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152099 () Bool)

(assert (=> b!1152099 (= e!655362 true)))

(assert (=> b!1152099 e!655367))

(declare-fun res!765895 () Bool)

(assert (=> b!1152099 (=> (not res!765895) (not e!655367))))

(assert (=> b!1152099 (= res!765895 (= lt!515554 lt!515550))))

(declare-fun -!1330 (ListLongMap!16389 (_ BitVec 64)) ListLongMap!16389)

(assert (=> b!1152099 (= lt!515554 (-!1330 lt!515552 k0!934))))

(declare-fun lt!515536 () V!43625)

(assert (=> b!1152099 (= (-!1330 (+!3648 lt!515550 (tuple2!18413 (select (arr!35965 _keys!1208) from!1455) lt!515536)) (select (arr!35965 _keys!1208) from!1455)) lt!515550)))

(declare-fun lt!515537 () Unit!37827)

(declare-fun addThenRemoveForNewKeyIsSame!177 (ListLongMap!16389 (_ BitVec 64) V!43625) Unit!37827)

(assert (=> b!1152099 (= lt!515537 (addThenRemoveForNewKeyIsSame!177 lt!515550 (select (arr!35965 _keys!1208) from!1455) lt!515536))))

(declare-fun get!18336 (ValueCell!13727 V!43625) V!43625)

(assert (=> b!1152099 (= lt!515536 (get!18336 (select (arr!35964 _values!996) from!1455) lt!515549))))

(declare-fun lt!515557 () Unit!37827)

(assert (=> b!1152099 (= lt!515557 e!655378)))

(declare-fun c!114344 () Bool)

(declare-fun contains!6745 (ListLongMap!16389 (_ BitVec 64)) Bool)

(assert (=> b!1152099 (= c!114344 (contains!6745 lt!515550 k0!934))))

(assert (=> b!1152099 (= lt!515550 (getCurrentListMapNoExtraKeys!4710 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45134 () Bool)

(assert (=> mapIsEmpty!45134 mapRes!45134))

(declare-fun b!1152100 () Bool)

(declare-fun res!765893 () Bool)

(assert (=> b!1152100 (=> (not res!765893) (not e!655365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1152100 (= res!765893 (validKeyInArray!0 k0!934))))

(declare-fun b!1152101 () Bool)

(assert (=> b!1152101 (= e!655375 (not e!655371))))

(declare-fun res!765899 () Bool)

(assert (=> b!1152101 (=> res!765899 e!655371)))

(assert (=> b!1152101 (= res!765899 (bvsgt from!1455 i!673))))

(assert (=> b!1152101 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!515545 () Unit!37827)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74641 (_ BitVec 64) (_ BitVec 32)) Unit!37827)

(assert (=> b!1152101 (= lt!515545 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1152102 () Bool)

(assert (=> b!1152102 (= e!655372 (= call!53725 (-!1330 call!53729 k0!934)))))

(declare-fun b!1152103 () Bool)

(assert (=> b!1152103 (= e!655365 e!655375)))

(declare-fun res!765904 () Bool)

(assert (=> b!1152103 (=> (not res!765904) (not e!655375))))

(assert (=> b!1152103 (= res!765904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515540 mask!1564))))

(assert (=> b!1152103 (= lt!515540 (array!74642 (store (arr!35965 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36502 _keys!1208)))))

(declare-fun b!1152104 () Bool)

(assert (=> b!1152104 (= e!655369 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!515542) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!53724 () Bool)

(declare-fun call!53723 () Bool)

(assert (=> bm!53724 (= call!53726 call!53723)))

(declare-fun call!53730 () ListLongMap!16389)

(declare-fun bm!53725 () Bool)

(assert (=> bm!53725 (= call!53723 (contains!6745 (ite c!114343 lt!515546 call!53730) k0!934))))

(declare-fun b!1152105 () Bool)

(assert (=> b!1152105 (= c!114348 (and (not lt!515542) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!655363 () Unit!37827)

(assert (=> b!1152105 (= e!655363 e!655373)))

(declare-fun bm!53726 () Bool)

(assert (=> bm!53726 (= call!53729 (getCurrentListMapNoExtraKeys!4710 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152106 () Bool)

(declare-fun Unit!37831 () Unit!37827)

(assert (=> b!1152106 (= e!655378 Unit!37831)))

(assert (=> b!1152106 (= lt!515542 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1152106 (= c!114343 (and (not lt!515542) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515547 () Unit!37827)

(assert (=> b!1152106 (= lt!515547 e!655363)))

(declare-fun lt!515556 () Unit!37827)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!466 (array!74641 array!74639 (_ BitVec 32) (_ BitVec 32) V!43625 V!43625 (_ BitVec 64) (_ BitVec 32) Int) Unit!37827)

(assert (=> b!1152106 (= lt!515556 (lemmaListMapContainsThenArrayContainsFrom!466 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114346 () Bool)

(assert (=> b!1152106 (= c!114346 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765900 () Bool)

(assert (=> b!1152106 (= res!765900 e!655369)))

(assert (=> b!1152106 (=> (not res!765900) (not e!655370))))

(assert (=> b!1152106 e!655370))

(declare-fun lt!515541 () Unit!37827)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74641 (_ BitVec 32) (_ BitVec 32)) Unit!37827)

(assert (=> b!1152106 (= lt!515541 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1152106 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25163)))

(declare-fun lt!515548 () Unit!37827)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74641 (_ BitVec 64) (_ BitVec 32) List!25166) Unit!37827)

(assert (=> b!1152106 (= lt!515548 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25163))))

(assert (=> b!1152106 false))

(declare-fun b!1152107 () Bool)

(assert (=> b!1152107 (contains!6745 (+!3648 lt!515546 (tuple2!18413 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!515543 () Unit!37827)

(assert (=> b!1152107 (= lt!515543 call!53724)))

(assert (=> b!1152107 call!53723))

(assert (=> b!1152107 (= lt!515546 call!53727)))

(declare-fun lt!515538 () Unit!37827)

(assert (=> b!1152107 (= lt!515538 (addStillContains!872 lt!515550 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1152107 (= e!655363 lt!515543)))

(declare-fun b!1152108 () Bool)

(assert (=> b!1152108 call!53726))

(declare-fun lt!515551 () Unit!37827)

(assert (=> b!1152108 (= lt!515551 call!53728)))

(assert (=> b!1152108 (= e!655364 lt!515551)))

(declare-fun mapNonEmpty!45134 () Bool)

(declare-fun tp!85739 () Bool)

(assert (=> mapNonEmpty!45134 (= mapRes!45134 (and tp!85739 e!655376))))

(declare-fun mapKey!45134 () (_ BitVec 32))

(declare-fun mapValue!45134 () ValueCell!13727)

(declare-fun mapRest!45134 () (Array (_ BitVec 32) ValueCell!13727))

(assert (=> mapNonEmpty!45134 (= (arr!35964 _values!996) (store mapRest!45134 mapKey!45134 mapValue!45134))))

(declare-fun bm!53727 () Bool)

(assert (=> bm!53727 (= call!53730 call!53727)))

(assert (= (and start!98974 res!765898) b!1152096))

(assert (= (and b!1152096 res!765903) b!1152086))

(assert (= (and b!1152086 res!765901) b!1152092))

(assert (= (and b!1152092 res!765902) b!1152097))

(assert (= (and b!1152097 res!765905) b!1152087))

(assert (= (and b!1152087 res!765906) b!1152100))

(assert (= (and b!1152100 res!765893) b!1152094))

(assert (= (and b!1152094 res!765897) b!1152103))

(assert (= (and b!1152103 res!765904) b!1152098))

(assert (= (and b!1152098 res!765896) b!1152101))

(assert (= (and b!1152101 (not res!765899)) b!1152088))

(assert (= (and b!1152088 (not res!765892)) b!1152091))

(assert (= (and b!1152091 c!114345) b!1152102))

(assert (= (and b!1152091 (not c!114345)) b!1152081))

(assert (= (or b!1152102 b!1152081) bm!53723))

(assert (= (or b!1152102 b!1152081) bm!53726))

(assert (= (and b!1152091 (not res!765894)) b!1152099))

(assert (= (and b!1152099 c!114344) b!1152106))

(assert (= (and b!1152099 (not c!114344)) b!1152080))

(assert (= (and b!1152106 c!114343) b!1152107))

(assert (= (and b!1152106 (not c!114343)) b!1152105))

(assert (= (and b!1152105 c!114348) b!1152084))

(assert (= (and b!1152105 (not c!114348)) b!1152085))

(assert (= (and b!1152085 c!114347) b!1152108))

(assert (= (and b!1152085 (not c!114347)) b!1152079))

(assert (= (or b!1152084 b!1152108) bm!53721))

(assert (= (or b!1152084 b!1152108) bm!53727))

(assert (= (or b!1152084 b!1152108) bm!53724))

(assert (= (or b!1152107 bm!53724) bm!53725))

(assert (= (or b!1152107 bm!53721) bm!53722))

(assert (= (or b!1152107 bm!53727) bm!53720))

(assert (= (and b!1152106 c!114346) b!1152090))

(assert (= (and b!1152106 (not c!114346)) b!1152104))

(assert (= (and b!1152106 res!765900) b!1152093))

(assert (= (and b!1152099 res!765895) b!1152089))

(assert (= (and b!1152082 condMapEmpty!45134) mapIsEmpty!45134))

(assert (= (and b!1152082 (not condMapEmpty!45134)) mapNonEmpty!45134))

(get-info :version)

(assert (= (and mapNonEmpty!45134 ((_ is ValueCellFull!13727) mapValue!45134)) b!1152095))

(assert (= (and b!1152082 ((_ is ValueCellFull!13727) mapDefault!45134)) b!1152083))

(assert (= start!98974 b!1152082))

(declare-fun b_lambda!19443 () Bool)

(assert (=> (not b_lambda!19443) (not b!1152088)))

(declare-fun t!36491 () Bool)

(declare-fun tb!9147 () Bool)

(assert (=> (and start!98974 (= defaultEntry!1004 defaultEntry!1004) t!36491) tb!9147))

(declare-fun result!18867 () Bool)

(assert (=> tb!9147 (= result!18867 tp_is_empty!28873)))

(assert (=> b!1152088 t!36491))

(declare-fun b_and!39539 () Bool)

(assert (= b_and!39537 (and (=> t!36491 result!18867) b_and!39539)))

(declare-fun m!1062553 () Bool)

(assert (=> b!1152101 m!1062553))

(declare-fun m!1062555 () Bool)

(assert (=> b!1152101 m!1062555))

(declare-fun m!1062557 () Bool)

(assert (=> b!1152092 m!1062557))

(declare-fun m!1062559 () Bool)

(assert (=> b!1152106 m!1062559))

(declare-fun m!1062561 () Bool)

(assert (=> b!1152106 m!1062561))

(declare-fun m!1062563 () Bool)

(assert (=> b!1152106 m!1062563))

(declare-fun m!1062565 () Bool)

(assert (=> b!1152106 m!1062565))

(declare-fun m!1062567 () Bool)

(assert (=> b!1152089 m!1062567))

(declare-fun m!1062569 () Bool)

(assert (=> b!1152099 m!1062569))

(declare-fun m!1062571 () Bool)

(assert (=> b!1152099 m!1062571))

(assert (=> b!1152099 m!1062571))

(declare-fun m!1062573 () Bool)

(assert (=> b!1152099 m!1062573))

(declare-fun m!1062575 () Bool)

(assert (=> b!1152099 m!1062575))

(declare-fun m!1062577 () Bool)

(assert (=> b!1152099 m!1062577))

(assert (=> b!1152099 m!1062573))

(declare-fun m!1062579 () Bool)

(assert (=> b!1152099 m!1062579))

(assert (=> b!1152099 m!1062573))

(declare-fun m!1062581 () Bool)

(assert (=> b!1152099 m!1062581))

(declare-fun m!1062583 () Bool)

(assert (=> b!1152099 m!1062583))

(assert (=> b!1152099 m!1062569))

(declare-fun m!1062585 () Bool)

(assert (=> b!1152099 m!1062585))

(declare-fun m!1062587 () Bool)

(assert (=> b!1152090 m!1062587))

(declare-fun m!1062589 () Bool)

(assert (=> b!1152100 m!1062589))

(assert (=> bm!53723 m!1062567))

(declare-fun m!1062591 () Bool)

(assert (=> b!1152088 m!1062591))

(declare-fun m!1062593 () Bool)

(assert (=> b!1152088 m!1062593))

(declare-fun m!1062595 () Bool)

(assert (=> b!1152088 m!1062595))

(declare-fun m!1062597 () Bool)

(assert (=> b!1152088 m!1062597))

(assert (=> b!1152091 m!1062573))

(declare-fun m!1062599 () Bool)

(assert (=> b!1152091 m!1062599))

(declare-fun m!1062601 () Bool)

(assert (=> bm!53722 m!1062601))

(declare-fun m!1062603 () Bool)

(assert (=> b!1152096 m!1062603))

(declare-fun m!1062605 () Bool)

(assert (=> b!1152102 m!1062605))

(declare-fun m!1062607 () Bool)

(assert (=> b!1152098 m!1062607))

(declare-fun m!1062609 () Bool)

(assert (=> b!1152103 m!1062609))

(declare-fun m!1062611 () Bool)

(assert (=> b!1152103 m!1062611))

(declare-fun m!1062613 () Bool)

(assert (=> b!1152097 m!1062613))

(declare-fun m!1062615 () Bool)

(assert (=> start!98974 m!1062615))

(declare-fun m!1062617 () Bool)

(assert (=> start!98974 m!1062617))

(declare-fun m!1062619 () Bool)

(assert (=> b!1152107 m!1062619))

(assert (=> b!1152107 m!1062619))

(declare-fun m!1062621 () Bool)

(assert (=> b!1152107 m!1062621))

(declare-fun m!1062623 () Bool)

(assert (=> b!1152107 m!1062623))

(assert (=> b!1152093 m!1062587))

(declare-fun m!1062625 () Bool)

(assert (=> mapNonEmpty!45134 m!1062625))

(declare-fun m!1062627 () Bool)

(assert (=> bm!53720 m!1062627))

(declare-fun m!1062629 () Bool)

(assert (=> bm!53725 m!1062629))

(assert (=> bm!53726 m!1062579))

(declare-fun m!1062631 () Bool)

(assert (=> b!1152094 m!1062631))

(check-sat (not bm!53726) (not start!98974) (not b!1152096) (not b!1152090) (not b!1152091) (not b!1152089) (not bm!53720) (not b!1152100) (not b_lambda!19443) (not b!1152102) (not b!1152103) (not b!1152088) (not b_next!24343) (not b!1152098) (not mapNonEmpty!45134) b_and!39539 (not b!1152106) (not b!1152107) (not b!1152093) (not bm!53722) (not b!1152101) (not b!1152092) (not bm!53725) tp_is_empty!28873 (not bm!53723) (not b!1152099) (not b!1152097))
(check-sat b_and!39539 (not b_next!24343))
