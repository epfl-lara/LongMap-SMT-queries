; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98944 () Bool)

(assert start!98944)

(declare-fun b_free!24549 () Bool)

(declare-fun b_next!24549 () Bool)

(assert (=> start!98944 (= b_free!24549 (not b_next!24549))))

(declare-fun tp!86357 () Bool)

(declare-fun b_and!39947 () Bool)

(assert (=> start!98944 (= tp!86357 b_and!39947)))

(declare-fun b!1160266 () Bool)

(declare-fun e!659797 () Bool)

(declare-datatypes ((V!43899 0))(
  ( (V!43900 (val!14596 Int)) )
))
(declare-datatypes ((tuple2!18590 0))(
  ( (tuple2!18591 (_1!9306 (_ BitVec 64)) (_2!9306 V!43899)) )
))
(declare-datatypes ((List!25327 0))(
  ( (Nil!25324) (Cons!25323 (h!26532 tuple2!18590) (t!36868 List!25327)) )
))
(declare-datatypes ((ListLongMap!16559 0))(
  ( (ListLongMap!16560 (toList!8295 List!25327)) )
))
(declare-fun call!56135 () ListLongMap!16559)

(declare-fun call!56131 () ListLongMap!16559)

(assert (=> b!1160266 (= e!659797 (= call!56135 call!56131))))

(declare-fun b!1160267 () Bool)

(declare-fun res!770021 () Bool)

(declare-fun e!659798 () Bool)

(assert (=> b!1160267 (=> (not res!770021) (not e!659798))))

(declare-datatypes ((array!74999 0))(
  ( (array!75000 (arr!36150 (Array (_ BitVec 32) (_ BitVec 64))) (size!36686 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74999)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13830 0))(
  ( (ValueCellFull!13830 (v!17233 V!43899)) (EmptyCell!13830) )
))
(declare-datatypes ((array!75001 0))(
  ( (array!75002 (arr!36151 (Array (_ BitVec 32) ValueCell!13830)) (size!36687 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75001)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1160267 (= res!770021 (and (= (size!36687 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36686 _keys!1208) (size!36687 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1160268 () Bool)

(declare-fun e!659799 () Bool)

(declare-fun lt!521864 () Bool)

(assert (=> b!1160268 (= e!659799 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521864) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1160269 () Bool)

(declare-datatypes ((Unit!38248 0))(
  ( (Unit!38249) )
))
(declare-fun e!659786 () Unit!38248)

(declare-fun Unit!38250 () Unit!38248)

(assert (=> b!1160269 (= e!659786 Unit!38250)))

(assert (=> b!1160269 (= lt!521864 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115799 () Bool)

(assert (=> b!1160269 (= c!115799 (and (not lt!521864) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521860 () Unit!38248)

(declare-fun e!659788 () Unit!38248)

(assert (=> b!1160269 (= lt!521860 e!659788)))

(declare-fun zeroValue!944 () V!43899)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43899)

(declare-fun lt!521870 () Unit!38248)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!528 (array!74999 array!75001 (_ BitVec 32) (_ BitVec 32) V!43899 V!43899 (_ BitVec 64) (_ BitVec 32) Int) Unit!38248)

(assert (=> b!1160269 (= lt!521870 (lemmaListMapContainsThenArrayContainsFrom!528 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115804 () Bool)

(assert (=> b!1160269 (= c!115804 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770019 () Bool)

(assert (=> b!1160269 (= res!770019 e!659799)))

(declare-fun e!659791 () Bool)

(assert (=> b!1160269 (=> (not res!770019) (not e!659791))))

(assert (=> b!1160269 e!659791))

(declare-fun lt!521858 () Unit!38248)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74999 (_ BitVec 32) (_ BitVec 32)) Unit!38248)

(assert (=> b!1160269 (= lt!521858 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25328 0))(
  ( (Nil!25325) (Cons!25324 (h!26533 (_ BitVec 64)) (t!36869 List!25328)) )
))
(declare-fun arrayNoDuplicates!0 (array!74999 (_ BitVec 32) List!25328) Bool)

(assert (=> b!1160269 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25325)))

(declare-fun lt!521868 () Unit!38248)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74999 (_ BitVec 64) (_ BitVec 32) List!25328) Unit!38248)

(assert (=> b!1160269 (= lt!521868 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25325))))

(assert (=> b!1160269 false))

(declare-fun b!1160270 () Bool)

(declare-fun arrayContainsKey!0 (array!74999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1160270 (= e!659791 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160271 () Bool)

(declare-fun e!659795 () Bool)

(declare-fun tp_is_empty!29079 () Bool)

(assert (=> b!1160271 (= e!659795 tp_is_empty!29079)))

(declare-fun bm!56127 () Bool)

(declare-fun call!56134 () ListLongMap!16559)

(declare-fun call!56130 () ListLongMap!16559)

(assert (=> bm!56127 (= call!56134 call!56130)))

(declare-fun b!1160272 () Bool)

(declare-fun e!659783 () Unit!38248)

(declare-fun lt!521852 () Unit!38248)

(assert (=> b!1160272 (= e!659783 lt!521852)))

(declare-fun call!56137 () Unit!38248)

(assert (=> b!1160272 (= lt!521852 call!56137)))

(declare-fun call!56133 () Bool)

(assert (=> b!1160272 call!56133))

(declare-fun c!115800 () Bool)

(declare-fun lt!521853 () ListLongMap!16559)

(declare-fun bm!56128 () Bool)

(declare-fun call!56136 () Unit!38248)

(declare-fun addStillContains!942 (ListLongMap!16559 (_ BitVec 64) V!43899 (_ BitVec 64)) Unit!38248)

(assert (=> bm!56128 (= call!56136 (addStillContains!942 lt!521853 (ite (or c!115799 c!115800) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115799 c!115800) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1160274 () Bool)

(declare-fun res!770022 () Bool)

(assert (=> b!1160274 (=> (not res!770022) (not e!659798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1160274 (= res!770022 (validMask!0 mask!1564))))

(declare-fun b!1160275 () Bool)

(declare-fun -!1404 (ListLongMap!16559 (_ BitVec 64)) ListLongMap!16559)

(assert (=> b!1160275 (= e!659797 (= call!56131 (-!1404 call!56135 k0!934)))))

(declare-fun b!1160276 () Bool)

(declare-fun e!659784 () Bool)

(declare-fun e!659793 () Bool)

(assert (=> b!1160276 (= e!659784 e!659793)))

(declare-fun res!770023 () Bool)

(assert (=> b!1160276 (=> res!770023 e!659793)))

(assert (=> b!1160276 (= res!770023 (not (= (select (arr!36150 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1160276 e!659797))

(declare-fun c!115802 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1160276 (= c!115802 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!521857 () Unit!38248)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!634 (array!74999 array!75001 (_ BitVec 32) (_ BitVec 32) V!43899 V!43899 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38248)

(assert (=> b!1160276 (= lt!521857 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!634 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56129 () Bool)

(assert (=> bm!56129 (= call!56137 call!56136)))

(declare-fun b!1160277 () Bool)

(assert (=> b!1160277 call!56133))

(declare-fun lt!521855 () Unit!38248)

(assert (=> b!1160277 (= lt!521855 call!56137)))

(declare-fun e!659789 () Unit!38248)

(assert (=> b!1160277 (= e!659789 lt!521855)))

(declare-fun call!56132 () Bool)

(declare-fun lt!521862 () ListLongMap!16559)

(declare-fun bm!56130 () Bool)

(declare-fun contains!6801 (ListLongMap!16559 (_ BitVec 64)) Bool)

(assert (=> bm!56130 (= call!56132 (contains!6801 (ite c!115799 lt!521862 call!56134) k0!934))))

(declare-fun b!1160278 () Bool)

(declare-fun res!770033 () Bool)

(assert (=> b!1160278 (=> (not res!770033) (not e!659798))))

(assert (=> b!1160278 (= res!770033 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25325))))

(declare-fun b!1160279 () Bool)

(assert (=> b!1160279 (= e!659799 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!45443 () Bool)

(declare-fun mapRes!45443 () Bool)

(declare-fun tp!86358 () Bool)

(assert (=> mapNonEmpty!45443 (= mapRes!45443 (and tp!86358 e!659795))))

(declare-fun mapValue!45443 () ValueCell!13830)

(declare-fun mapKey!45443 () (_ BitVec 32))

(declare-fun mapRest!45443 () (Array (_ BitVec 32) ValueCell!13830))

(assert (=> mapNonEmpty!45443 (= (arr!36151 _values!996) (store mapRest!45443 mapKey!45443 mapValue!45443))))

(declare-fun b!1160280 () Bool)

(declare-fun res!770027 () Bool)

(assert (=> b!1160280 (=> (not res!770027) (not e!659798))))

(assert (=> b!1160280 (= res!770027 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36686 _keys!1208))))))

(declare-fun lt!521856 () array!74999)

(declare-fun b!1160281 () Bool)

(declare-fun e!659794 () Bool)

(declare-fun lt!521854 () array!75001)

(declare-fun lt!521859 () ListLongMap!16559)

(declare-fun getCurrentListMapNoExtraKeys!4759 (array!74999 array!75001 (_ BitVec 32) (_ BitVec 32) V!43899 V!43899 (_ BitVec 32) Int) ListLongMap!16559)

(assert (=> b!1160281 (= e!659794 (= lt!521859 (getCurrentListMapNoExtraKeys!4759 lt!521856 lt!521854 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1160282 () Bool)

(declare-fun res!770030 () Bool)

(declare-fun e!659796 () Bool)

(assert (=> b!1160282 (=> (not res!770030) (not e!659796))))

(assert (=> b!1160282 (= res!770030 (arrayNoDuplicates!0 lt!521856 #b00000000000000000000000000000000 Nil!25325))))

(declare-fun bm!56131 () Bool)

(assert (=> bm!56131 (= call!56131 (getCurrentListMapNoExtraKeys!4759 (ite c!115802 lt!521856 _keys!1208) (ite c!115802 lt!521854 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56132 () Bool)

(declare-fun +!3700 (ListLongMap!16559 tuple2!18590) ListLongMap!16559)

(assert (=> bm!56132 (= call!56130 (+!3700 (ite c!115799 lt!521862 lt!521853) (ite c!115799 (tuple2!18591 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115800 (tuple2!18591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18591 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1160283 () Bool)

(declare-fun e!659792 () Bool)

(assert (=> b!1160283 (= e!659792 e!659784)))

(declare-fun res!770032 () Bool)

(assert (=> b!1160283 (=> res!770032 e!659784)))

(assert (=> b!1160283 (= res!770032 (not (= from!1455 i!673)))))

(declare-fun lt!521871 () ListLongMap!16559)

(assert (=> b!1160283 (= lt!521871 (getCurrentListMapNoExtraKeys!4759 lt!521856 lt!521854 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!521865 () V!43899)

(assert (=> b!1160283 (= lt!521854 (array!75002 (store (arr!36151 _values!996) i!673 (ValueCellFull!13830 lt!521865)) (size!36687 _values!996)))))

(declare-fun dynLambda!2759 (Int (_ BitVec 64)) V!43899)

(assert (=> b!1160283 (= lt!521865 (dynLambda!2759 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!521863 () ListLongMap!16559)

(assert (=> b!1160283 (= lt!521863 (getCurrentListMapNoExtraKeys!4759 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!56133 () Bool)

(assert (=> bm!56133 (= call!56133 call!56132)))

(declare-fun b!1160284 () Bool)

(declare-fun Unit!38251 () Unit!38248)

(assert (=> b!1160284 (= e!659786 Unit!38251)))

(declare-fun bm!56134 () Bool)

(assert (=> bm!56134 (= call!56135 (getCurrentListMapNoExtraKeys!4759 (ite c!115802 _keys!1208 lt!521856) (ite c!115802 _values!996 lt!521854) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!770024 () Bool)

(assert (=> start!98944 (=> (not res!770024) (not e!659798))))

(assert (=> start!98944 (= res!770024 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36686 _keys!1208))))))

(assert (=> start!98944 e!659798))

(assert (=> start!98944 tp_is_empty!29079))

(declare-fun array_inv!27662 (array!74999) Bool)

(assert (=> start!98944 (array_inv!27662 _keys!1208)))

(assert (=> start!98944 true))

(assert (=> start!98944 tp!86357))

(declare-fun e!659785 () Bool)

(declare-fun array_inv!27663 (array!75001) Bool)

(assert (=> start!98944 (and (array_inv!27663 _values!996) e!659785)))

(declare-fun b!1160273 () Bool)

(declare-fun e!659787 () Bool)

(assert (=> b!1160273 (= e!659785 (and e!659787 mapRes!45443))))

(declare-fun condMapEmpty!45443 () Bool)

(declare-fun mapDefault!45443 () ValueCell!13830)

(assert (=> b!1160273 (= condMapEmpty!45443 (= (arr!36151 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13830)) mapDefault!45443)))))

(declare-fun b!1160285 () Bool)

(declare-fun res!770028 () Bool)

(assert (=> b!1160285 (=> (not res!770028) (not e!659798))))

(assert (=> b!1160285 (= res!770028 (= (select (arr!36150 _keys!1208) i!673) k0!934))))

(declare-fun b!1160286 () Bool)

(assert (=> b!1160286 (= e!659798 e!659796)))

(declare-fun res!770026 () Bool)

(assert (=> b!1160286 (=> (not res!770026) (not e!659796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74999 (_ BitVec 32)) Bool)

(assert (=> b!1160286 (= res!770026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521856 mask!1564))))

(assert (=> b!1160286 (= lt!521856 (array!75000 (store (arr!36150 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36686 _keys!1208)))))

(declare-fun b!1160287 () Bool)

(assert (=> b!1160287 (= e!659796 (not e!659792))))

(declare-fun res!770029 () Bool)

(assert (=> b!1160287 (=> res!770029 e!659792)))

(assert (=> b!1160287 (= res!770029 (bvsgt from!1455 i!673))))

(assert (=> b!1160287 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!521851 () Unit!38248)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74999 (_ BitVec 64) (_ BitVec 32)) Unit!38248)

(assert (=> b!1160287 (= lt!521851 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1160288 () Bool)

(assert (=> b!1160288 (= c!115800 (and (not lt!521864) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1160288 (= e!659788 e!659783)))

(declare-fun b!1160289 () Bool)

(declare-fun res!770031 () Bool)

(assert (=> b!1160289 (=> (not res!770031) (not e!659798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1160289 (= res!770031 (validKeyInArray!0 k0!934))))

(declare-fun b!1160290 () Bool)

(assert (=> b!1160290 (= e!659793 true)))

(assert (=> b!1160290 e!659794))

(declare-fun res!770020 () Bool)

(assert (=> b!1160290 (=> (not res!770020) (not e!659794))))

(assert (=> b!1160290 (= res!770020 (= lt!521859 lt!521853))))

(assert (=> b!1160290 (= lt!521859 (-!1404 lt!521863 k0!934))))

(declare-fun lt!521850 () V!43899)

(assert (=> b!1160290 (= (-!1404 (+!3700 lt!521853 (tuple2!18591 (select (arr!36150 _keys!1208) from!1455) lt!521850)) (select (arr!36150 _keys!1208) from!1455)) lt!521853)))

(declare-fun lt!521861 () Unit!38248)

(declare-fun addThenRemoveForNewKeyIsSame!238 (ListLongMap!16559 (_ BitVec 64) V!43899) Unit!38248)

(assert (=> b!1160290 (= lt!521861 (addThenRemoveForNewKeyIsSame!238 lt!521853 (select (arr!36150 _keys!1208) from!1455) lt!521850))))

(declare-fun get!18434 (ValueCell!13830 V!43899) V!43899)

(assert (=> b!1160290 (= lt!521850 (get!18434 (select (arr!36151 _values!996) from!1455) lt!521865))))

(declare-fun lt!521869 () Unit!38248)

(assert (=> b!1160290 (= lt!521869 e!659786)))

(declare-fun c!115803 () Bool)

(assert (=> b!1160290 (= c!115803 (contains!6801 lt!521853 k0!934))))

(assert (=> b!1160290 (= lt!521853 (getCurrentListMapNoExtraKeys!4759 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160291 () Bool)

(declare-fun Unit!38252 () Unit!38248)

(assert (=> b!1160291 (= e!659789 Unit!38252)))

(declare-fun mapIsEmpty!45443 () Bool)

(assert (=> mapIsEmpty!45443 mapRes!45443))

(declare-fun b!1160292 () Bool)

(assert (=> b!1160292 (= e!659783 e!659789)))

(declare-fun c!115801 () Bool)

(assert (=> b!1160292 (= c!115801 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521864))))

(declare-fun b!1160293 () Bool)

(assert (=> b!1160293 (contains!6801 call!56130 k0!934)))

(declare-fun lt!521866 () Unit!38248)

(assert (=> b!1160293 (= lt!521866 (addStillContains!942 lt!521862 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1160293 call!56132))

(assert (=> b!1160293 (= lt!521862 (+!3700 lt!521853 (tuple2!18591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!521867 () Unit!38248)

(assert (=> b!1160293 (= lt!521867 call!56136)))

(assert (=> b!1160293 (= e!659788 lt!521866)))

(declare-fun b!1160294 () Bool)

(assert (=> b!1160294 (= e!659787 tp_is_empty!29079)))

(declare-fun b!1160295 () Bool)

(declare-fun res!770025 () Bool)

(assert (=> b!1160295 (=> (not res!770025) (not e!659798))))

(assert (=> b!1160295 (= res!770025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!98944 res!770024) b!1160274))

(assert (= (and b!1160274 res!770022) b!1160267))

(assert (= (and b!1160267 res!770021) b!1160295))

(assert (= (and b!1160295 res!770025) b!1160278))

(assert (= (and b!1160278 res!770033) b!1160280))

(assert (= (and b!1160280 res!770027) b!1160289))

(assert (= (and b!1160289 res!770031) b!1160285))

(assert (= (and b!1160285 res!770028) b!1160286))

(assert (= (and b!1160286 res!770026) b!1160282))

(assert (= (and b!1160282 res!770030) b!1160287))

(assert (= (and b!1160287 (not res!770029)) b!1160283))

(assert (= (and b!1160283 (not res!770032)) b!1160276))

(assert (= (and b!1160276 c!115802) b!1160275))

(assert (= (and b!1160276 (not c!115802)) b!1160266))

(assert (= (or b!1160275 b!1160266) bm!56134))

(assert (= (or b!1160275 b!1160266) bm!56131))

(assert (= (and b!1160276 (not res!770023)) b!1160290))

(assert (= (and b!1160290 c!115803) b!1160269))

(assert (= (and b!1160290 (not c!115803)) b!1160284))

(assert (= (and b!1160269 c!115799) b!1160293))

(assert (= (and b!1160269 (not c!115799)) b!1160288))

(assert (= (and b!1160288 c!115800) b!1160272))

(assert (= (and b!1160288 (not c!115800)) b!1160292))

(assert (= (and b!1160292 c!115801) b!1160277))

(assert (= (and b!1160292 (not c!115801)) b!1160291))

(assert (= (or b!1160272 b!1160277) bm!56129))

(assert (= (or b!1160272 b!1160277) bm!56127))

(assert (= (or b!1160272 b!1160277) bm!56133))

(assert (= (or b!1160293 bm!56133) bm!56130))

(assert (= (or b!1160293 bm!56129) bm!56128))

(assert (= (or b!1160293 bm!56127) bm!56132))

(assert (= (and b!1160269 c!115804) b!1160279))

(assert (= (and b!1160269 (not c!115804)) b!1160268))

(assert (= (and b!1160269 res!770019) b!1160270))

(assert (= (and b!1160290 res!770020) b!1160281))

(assert (= (and b!1160273 condMapEmpty!45443) mapIsEmpty!45443))

(assert (= (and b!1160273 (not condMapEmpty!45443)) mapNonEmpty!45443))

(get-info :version)

(assert (= (and mapNonEmpty!45443 ((_ is ValueCellFull!13830) mapValue!45443)) b!1160271))

(assert (= (and b!1160273 ((_ is ValueCellFull!13830) mapDefault!45443)) b!1160294))

(assert (= start!98944 b!1160273))

(declare-fun b_lambda!19655 () Bool)

(assert (=> (not b_lambda!19655) (not b!1160283)))

(declare-fun t!36867 () Bool)

(declare-fun tb!9361 () Bool)

(assert (=> (and start!98944 (= defaultEntry!1004 defaultEntry!1004) t!36867) tb!9361))

(declare-fun result!19287 () Bool)

(assert (=> tb!9361 (= result!19287 tp_is_empty!29079)))

(assert (=> b!1160283 t!36867))

(declare-fun b_and!39949 () Bool)

(assert (= b_and!39947 (and (=> t!36867 result!19287) b_and!39949)))

(declare-fun m!1069233 () Bool)

(assert (=> b!1160295 m!1069233))

(declare-fun m!1069235 () Bool)

(assert (=> b!1160276 m!1069235))

(declare-fun m!1069237 () Bool)

(assert (=> b!1160276 m!1069237))

(declare-fun m!1069239 () Bool)

(assert (=> b!1160287 m!1069239))

(declare-fun m!1069241 () Bool)

(assert (=> b!1160287 m!1069241))

(declare-fun m!1069243 () Bool)

(assert (=> bm!56132 m!1069243))

(declare-fun m!1069245 () Bool)

(assert (=> b!1160275 m!1069245))

(declare-fun m!1069247 () Bool)

(assert (=> b!1160282 m!1069247))

(declare-fun m!1069249 () Bool)

(assert (=> mapNonEmpty!45443 m!1069249))

(declare-fun m!1069251 () Bool)

(assert (=> bm!56134 m!1069251))

(declare-fun m!1069253 () Bool)

(assert (=> bm!56130 m!1069253))

(declare-fun m!1069255 () Bool)

(assert (=> b!1160289 m!1069255))

(declare-fun m!1069257 () Bool)

(assert (=> start!98944 m!1069257))

(declare-fun m!1069259 () Bool)

(assert (=> start!98944 m!1069259))

(declare-fun m!1069261 () Bool)

(assert (=> b!1160278 m!1069261))

(declare-fun m!1069263 () Bool)

(assert (=> b!1160285 m!1069263))

(declare-fun m!1069265 () Bool)

(assert (=> b!1160293 m!1069265))

(declare-fun m!1069267 () Bool)

(assert (=> b!1160293 m!1069267))

(declare-fun m!1069269 () Bool)

(assert (=> b!1160293 m!1069269))

(declare-fun m!1069271 () Bool)

(assert (=> bm!56128 m!1069271))

(declare-fun m!1069273 () Bool)

(assert (=> b!1160269 m!1069273))

(declare-fun m!1069275 () Bool)

(assert (=> b!1160269 m!1069275))

(declare-fun m!1069277 () Bool)

(assert (=> b!1160269 m!1069277))

(declare-fun m!1069279 () Bool)

(assert (=> b!1160269 m!1069279))

(declare-fun m!1069281 () Bool)

(assert (=> b!1160283 m!1069281))

(declare-fun m!1069283 () Bool)

(assert (=> b!1160283 m!1069283))

(declare-fun m!1069285 () Bool)

(assert (=> b!1160283 m!1069285))

(declare-fun m!1069287 () Bool)

(assert (=> b!1160283 m!1069287))

(declare-fun m!1069289 () Bool)

(assert (=> b!1160281 m!1069289))

(declare-fun m!1069291 () Bool)

(assert (=> bm!56131 m!1069291))

(declare-fun m!1069293 () Bool)

(assert (=> b!1160286 m!1069293))

(declare-fun m!1069295 () Bool)

(assert (=> b!1160286 m!1069295))

(declare-fun m!1069297 () Bool)

(assert (=> b!1160290 m!1069297))

(declare-fun m!1069299 () Bool)

(assert (=> b!1160290 m!1069299))

(declare-fun m!1069301 () Bool)

(assert (=> b!1160290 m!1069301))

(assert (=> b!1160290 m!1069235))

(declare-fun m!1069303 () Bool)

(assert (=> b!1160290 m!1069303))

(assert (=> b!1160290 m!1069299))

(declare-fun m!1069305 () Bool)

(assert (=> b!1160290 m!1069305))

(assert (=> b!1160290 m!1069235))

(declare-fun m!1069307 () Bool)

(assert (=> b!1160290 m!1069307))

(declare-fun m!1069309 () Bool)

(assert (=> b!1160290 m!1069309))

(declare-fun m!1069311 () Bool)

(assert (=> b!1160290 m!1069311))

(assert (=> b!1160290 m!1069305))

(assert (=> b!1160290 m!1069235))

(declare-fun m!1069313 () Bool)

(assert (=> b!1160279 m!1069313))

(declare-fun m!1069315 () Bool)

(assert (=> b!1160274 m!1069315))

(assert (=> b!1160270 m!1069313))

(check-sat (not b!1160283) (not b!1160282) (not b!1160279) (not bm!56131) (not b!1160286) (not b!1160295) (not b!1160293) b_and!39949 tp_is_empty!29079 (not start!98944) (not b_next!24549) (not bm!56128) (not bm!56134) (not b!1160281) (not b!1160274) (not b!1160289) (not b!1160275) (not b_lambda!19655) (not mapNonEmpty!45443) (not b!1160269) (not bm!56130) (not b!1160287) (not b!1160290) (not b!1160278) (not b!1160276) (not bm!56132) (not b!1160270))
(check-sat b_and!39949 (not b_next!24549))
