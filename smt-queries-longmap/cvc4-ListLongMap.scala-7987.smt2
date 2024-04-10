; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98766 () Bool)

(assert start!98766)

(declare-fun b_free!24371 () Bool)

(declare-fun b_next!24371 () Bool)

(assert (=> start!98766 (= b_free!24371 (not b_next!24371))))

(declare-fun tp!85824 () Bool)

(declare-fun b_and!39591 () Bool)

(assert (=> start!98766 (= tp!85824 b_and!39591)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1152078 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!655247 () Bool)

(declare-fun lt!515981 () Bool)

(assert (=> b!1152078 (= e!655247 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!515981) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1152079 () Bool)

(declare-datatypes ((Unit!37906 0))(
  ( (Unit!37907) )
))
(declare-fun e!655250 () Unit!37906)

(declare-fun Unit!37908 () Unit!37906)

(assert (=> b!1152079 (= e!655250 Unit!37908)))

(declare-fun bm!53991 () Bool)

(declare-fun call!53995 () Bool)

(declare-fun call!53997 () Bool)

(assert (=> bm!53991 (= call!53995 call!53997)))

(declare-fun bm!53992 () Bool)

(declare-datatypes ((V!43661 0))(
  ( (V!43662 (val!14507 Int)) )
))
(declare-datatypes ((tuple2!18422 0))(
  ( (tuple2!18423 (_1!9222 (_ BitVec 64)) (_2!9222 V!43661)) )
))
(declare-datatypes ((List!25170 0))(
  ( (Nil!25167) (Cons!25166 (h!26375 tuple2!18422) (t!36533 List!25170)) )
))
(declare-datatypes ((ListLongMap!16391 0))(
  ( (ListLongMap!16392 (toList!8211 List!25170)) )
))
(declare-fun call!53994 () ListLongMap!16391)

(declare-fun call!53999 () ListLongMap!16391)

(assert (=> bm!53992 (= call!53994 call!53999)))

(declare-fun zeroValue!944 () V!43661)

(declare-fun bm!53993 () Bool)

(declare-fun lt!515996 () ListLongMap!16391)

(declare-fun c!114198 () Bool)

(declare-fun minValue!944 () V!43661)

(declare-fun call!54000 () Unit!37906)

(declare-fun c!114201 () Bool)

(declare-fun addStillContains!877 (ListLongMap!16391 (_ BitVec 64) V!43661 (_ BitVec 64)) Unit!37906)

(assert (=> bm!53993 (= call!54000 (addStillContains!877 lt!515996 (ite (or c!114198 c!114201) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114198 c!114201) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1152080 () Bool)

(declare-fun res!766025 () Bool)

(declare-fun e!655249 () Bool)

(assert (=> b!1152080 (=> (not res!766025) (not e!655249))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1152080 (= res!766025 (validKeyInArray!0 k!934))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74649 0))(
  ( (array!74650 (arr!35975 (Array (_ BitVec 32) (_ BitVec 64))) (size!36511 (_ BitVec 32))) )
))
(declare-fun lt!515994 () array!74649)

(declare-fun bm!53994 () Bool)

(declare-datatypes ((ValueCell!13741 0))(
  ( (ValueCellFull!13741 (v!17144 V!43661)) (EmptyCell!13741) )
))
(declare-datatypes ((array!74651 0))(
  ( (array!74652 (arr!35976 (Array (_ BitVec 32) ValueCell!13741)) (size!36512 (_ BitVec 32))) )
))
(declare-fun lt!515986 () array!74651)

(declare-fun call!54001 () ListLongMap!16391)

(declare-fun getCurrentListMapNoExtraKeys!4683 (array!74649 array!74651 (_ BitVec 32) (_ BitVec 32) V!43661 V!43661 (_ BitVec 32) Int) ListLongMap!16391)

(assert (=> bm!53994 (= call!54001 (getCurrentListMapNoExtraKeys!4683 lt!515994 lt!515986 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152081 () Bool)

(declare-fun res!766026 () Bool)

(assert (=> b!1152081 (=> (not res!766026) (not e!655249))))

(declare-fun _keys!1208 () array!74649)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1152081 (= res!766026 (= (select (arr!35975 _keys!1208) i!673) k!934))))

(declare-fun e!655259 () Bool)

(declare-fun b!1152082 () Bool)

(declare-fun arrayContainsKey!0 (array!74649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1152082 (= e!655259 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1152083 () Bool)

(declare-fun e!655252 () Unit!37906)

(declare-fun Unit!37909 () Unit!37906)

(assert (=> b!1152083 (= e!655252 Unit!37909)))

(declare-fun b!1152084 () Bool)

(declare-fun res!766014 () Bool)

(assert (=> b!1152084 (=> (not res!766014) (not e!655249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74649 (_ BitVec 32)) Bool)

(assert (=> b!1152084 (= res!766014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1152085 () Bool)

(assert (=> b!1152085 call!53995))

(declare-fun lt!515984 () Unit!37906)

(declare-fun call!53998 () Unit!37906)

(assert (=> b!1152085 (= lt!515984 call!53998)))

(assert (=> b!1152085 (= e!655250 lt!515984)))

(declare-fun bm!53995 () Bool)

(declare-fun +!3629 (ListLongMap!16391 tuple2!18422) ListLongMap!16391)

(assert (=> bm!53995 (= call!53999 (+!3629 lt!515996 (ite (or c!114198 c!114201) (tuple2!18423 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18423 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1152086 () Bool)

(declare-fun e!655251 () Bool)

(declare-fun e!655254 () Bool)

(assert (=> b!1152086 (= e!655251 e!655254)))

(declare-fun res!766020 () Bool)

(assert (=> b!1152086 (=> res!766020 e!655254)))

(assert (=> b!1152086 (= res!766020 (not (= (select (arr!35975 _keys!1208) from!1455) k!934)))))

(declare-fun e!655248 () Bool)

(assert (=> b!1152086 e!655248))

(declare-fun c!114202 () Bool)

(assert (=> b!1152086 (= c!114202 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!515989 () Unit!37906)

(declare-fun _values!996 () array!74651)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!577 (array!74649 array!74651 (_ BitVec 32) (_ BitVec 32) V!43661 V!43661 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37906)

(assert (=> b!1152086 (= lt!515989 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!577 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152087 () Bool)

(declare-fun call!53996 () ListLongMap!16391)

(assert (=> b!1152087 (= e!655248 (= call!54001 call!53996))))

(declare-fun b!1152088 () Bool)

(declare-fun res!766028 () Bool)

(assert (=> b!1152088 (=> (not res!766028) (not e!655249))))

(assert (=> b!1152088 (= res!766028 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36511 _keys!1208))))))

(declare-fun b!1152089 () Bool)

(assert (=> b!1152089 (= e!655247 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1152090 () Bool)

(declare-fun e!655258 () Bool)

(assert (=> b!1152090 (= e!655249 e!655258)))

(declare-fun res!766023 () Bool)

(assert (=> b!1152090 (=> (not res!766023) (not e!655258))))

(assert (=> b!1152090 (= res!766023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515994 mask!1564))))

(assert (=> b!1152090 (= lt!515994 (array!74650 (store (arr!35975 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36511 _keys!1208)))))

(declare-fun b!1152091 () Bool)

(declare-fun e!655244 () Bool)

(assert (=> b!1152091 (= e!655258 (not e!655244))))

(declare-fun res!766022 () Bool)

(assert (=> b!1152091 (=> res!766022 e!655244)))

(assert (=> b!1152091 (= res!766022 (bvsgt from!1455 i!673))))

(assert (=> b!1152091 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!515993 () Unit!37906)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74649 (_ BitVec 64) (_ BitVec 32)) Unit!37906)

(assert (=> b!1152091 (= lt!515993 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1152092 () Bool)

(declare-fun -!1342 (ListLongMap!16391 (_ BitVec 64)) ListLongMap!16391)

(assert (=> b!1152092 (= e!655248 (= call!54001 (-!1342 call!53996 k!934)))))

(declare-fun b!1152093 () Bool)

(declare-fun e!655260 () Unit!37906)

(declare-fun lt!515982 () Unit!37906)

(assert (=> b!1152093 (= e!655260 lt!515982)))

(assert (=> b!1152093 (= lt!515982 call!53998)))

(assert (=> b!1152093 call!53995))

(declare-fun b!1152094 () Bool)

(declare-fun res!766027 () Bool)

(assert (=> b!1152094 (=> (not res!766027) (not e!655249))))

(assert (=> b!1152094 (= res!766027 (and (= (size!36512 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36511 _keys!1208) (size!36512 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1152095 () Bool)

(declare-fun lt!515977 () ListLongMap!16391)

(declare-fun contains!6729 (ListLongMap!16391 (_ BitVec 64)) Bool)

(assert (=> b!1152095 (contains!6729 (+!3629 lt!515977 (tuple2!18423 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!515976 () Unit!37906)

(assert (=> b!1152095 (= lt!515976 (addStillContains!877 lt!515977 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1152095 call!53997))

(assert (=> b!1152095 (= lt!515977 call!53999)))

(declare-fun lt!515990 () Unit!37906)

(assert (=> b!1152095 (= lt!515990 call!54000)))

(declare-fun e!655246 () Unit!37906)

(assert (=> b!1152095 (= e!655246 lt!515976)))

(declare-fun b!1152096 () Bool)

(assert (=> b!1152096 (= c!114201 (and (not lt!515981) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1152096 (= e!655246 e!655260)))

(declare-fun mapNonEmpty!45176 () Bool)

(declare-fun mapRes!45176 () Bool)

(declare-fun tp!85823 () Bool)

(declare-fun e!655253 () Bool)

(assert (=> mapNonEmpty!45176 (= mapRes!45176 (and tp!85823 e!655253))))

(declare-fun mapValue!45176 () ValueCell!13741)

(declare-fun mapRest!45176 () (Array (_ BitVec 32) ValueCell!13741))

(declare-fun mapKey!45176 () (_ BitVec 32))

(assert (=> mapNonEmpty!45176 (= (arr!35976 _values!996) (store mapRest!45176 mapKey!45176 mapValue!45176))))

(declare-fun bm!53996 () Bool)

(assert (=> bm!53996 (= call!53998 call!54000)))

(declare-fun bm!53997 () Bool)

(assert (=> bm!53997 (= call!53996 (getCurrentListMapNoExtraKeys!4683 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45176 () Bool)

(assert (=> mapIsEmpty!45176 mapRes!45176))

(declare-fun b!1152097 () Bool)

(declare-fun res!766017 () Bool)

(assert (=> b!1152097 (=> (not res!766017) (not e!655249))))

(declare-datatypes ((List!25171 0))(
  ( (Nil!25168) (Cons!25167 (h!26376 (_ BitVec 64)) (t!36534 List!25171)) )
))
(declare-fun arrayNoDuplicates!0 (array!74649 (_ BitVec 32) List!25171) Bool)

(assert (=> b!1152097 (= res!766017 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25168))))

(declare-fun b!1152098 () Bool)

(declare-fun lt!515995 () ListLongMap!16391)

(declare-fun e!655256 () Bool)

(assert (=> b!1152098 (= e!655256 (= lt!515995 (getCurrentListMapNoExtraKeys!4683 lt!515994 lt!515986 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!53998 () Bool)

(assert (=> bm!53998 (= call!53997 (contains!6729 (ite c!114198 lt!515977 call!53994) k!934))))

(declare-fun b!1152099 () Bool)

(declare-fun Unit!37910 () Unit!37906)

(assert (=> b!1152099 (= e!655252 Unit!37910)))

(assert (=> b!1152099 (= lt!515981 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1152099 (= c!114198 (and (not lt!515981) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515992 () Unit!37906)

(assert (=> b!1152099 (= lt!515992 e!655246)))

(declare-fun lt!515991 () Unit!37906)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!470 (array!74649 array!74651 (_ BitVec 32) (_ BitVec 32) V!43661 V!43661 (_ BitVec 64) (_ BitVec 32) Int) Unit!37906)

(assert (=> b!1152099 (= lt!515991 (lemmaListMapContainsThenArrayContainsFrom!470 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114199 () Bool)

(assert (=> b!1152099 (= c!114199 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766018 () Bool)

(assert (=> b!1152099 (= res!766018 e!655247)))

(assert (=> b!1152099 (=> (not res!766018) (not e!655259))))

(assert (=> b!1152099 e!655259))

(declare-fun lt!515997 () Unit!37906)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74649 (_ BitVec 32) (_ BitVec 32)) Unit!37906)

(assert (=> b!1152099 (= lt!515997 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1152099 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25168)))

(declare-fun lt!515979 () Unit!37906)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74649 (_ BitVec 64) (_ BitVec 32) List!25171) Unit!37906)

(assert (=> b!1152099 (= lt!515979 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25168))))

(assert (=> b!1152099 false))

(declare-fun b!1152100 () Bool)

(assert (=> b!1152100 (= e!655260 e!655250)))

(declare-fun c!114200 () Bool)

(assert (=> b!1152100 (= c!114200 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!515981))))

(declare-fun res!766015 () Bool)

(assert (=> start!98766 (=> (not res!766015) (not e!655249))))

(assert (=> start!98766 (= res!766015 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36511 _keys!1208))))))

(assert (=> start!98766 e!655249))

(declare-fun tp_is_empty!28901 () Bool)

(assert (=> start!98766 tp_is_empty!28901))

(declare-fun array_inv!27550 (array!74649) Bool)

(assert (=> start!98766 (array_inv!27550 _keys!1208)))

(assert (=> start!98766 true))

(assert (=> start!98766 tp!85824))

(declare-fun e!655257 () Bool)

(declare-fun array_inv!27551 (array!74651) Bool)

(assert (=> start!98766 (and (array_inv!27551 _values!996) e!655257)))

(declare-fun b!1152101 () Bool)

(declare-fun res!766019 () Bool)

(assert (=> b!1152101 (=> (not res!766019) (not e!655249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1152101 (= res!766019 (validMask!0 mask!1564))))

(declare-fun b!1152102 () Bool)

(declare-fun e!655255 () Bool)

(assert (=> b!1152102 (= e!655255 tp_is_empty!28901)))

(declare-fun b!1152103 () Bool)

(declare-fun res!766024 () Bool)

(assert (=> b!1152103 (=> (not res!766024) (not e!655258))))

(assert (=> b!1152103 (= res!766024 (arrayNoDuplicates!0 lt!515994 #b00000000000000000000000000000000 Nil!25168))))

(declare-fun b!1152104 () Bool)

(assert (=> b!1152104 (= e!655253 tp_is_empty!28901)))

(declare-fun b!1152105 () Bool)

(assert (=> b!1152105 (= e!655254 true)))

(assert (=> b!1152105 e!655256))

(declare-fun res!766021 () Bool)

(assert (=> b!1152105 (=> (not res!766021) (not e!655256))))

(assert (=> b!1152105 (= res!766021 (= lt!515995 lt!515996))))

(declare-fun lt!515983 () ListLongMap!16391)

(assert (=> b!1152105 (= lt!515995 (-!1342 lt!515983 k!934))))

(declare-fun lt!515987 () V!43661)

(assert (=> b!1152105 (= (-!1342 (+!3629 lt!515996 (tuple2!18423 (select (arr!35975 _keys!1208) from!1455) lt!515987)) (select (arr!35975 _keys!1208) from!1455)) lt!515996)))

(declare-fun lt!515980 () Unit!37906)

(declare-fun addThenRemoveForNewKeyIsSame!184 (ListLongMap!16391 (_ BitVec 64) V!43661) Unit!37906)

(assert (=> b!1152105 (= lt!515980 (addThenRemoveForNewKeyIsSame!184 lt!515996 (select (arr!35975 _keys!1208) from!1455) lt!515987))))

(declare-fun lt!515985 () V!43661)

(declare-fun get!18320 (ValueCell!13741 V!43661) V!43661)

(assert (=> b!1152105 (= lt!515987 (get!18320 (select (arr!35976 _values!996) from!1455) lt!515985))))

(declare-fun lt!515978 () Unit!37906)

(assert (=> b!1152105 (= lt!515978 e!655252)))

(declare-fun c!114197 () Bool)

(assert (=> b!1152105 (= c!114197 (contains!6729 lt!515996 k!934))))

(assert (=> b!1152105 (= lt!515996 (getCurrentListMapNoExtraKeys!4683 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152106 () Bool)

(assert (=> b!1152106 (= e!655257 (and e!655255 mapRes!45176))))

(declare-fun condMapEmpty!45176 () Bool)

(declare-fun mapDefault!45176 () ValueCell!13741)

