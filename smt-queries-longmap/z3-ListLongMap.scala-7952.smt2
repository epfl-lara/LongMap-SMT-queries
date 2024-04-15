; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98546 () Bool)

(assert start!98546)

(declare-fun b_free!24157 () Bool)

(declare-fun b_next!24157 () Bool)

(assert (=> start!98546 (= b_free!24157 (not b_next!24157))))

(declare-fun tp!85181 () Bool)

(declare-fun b_and!39141 () Bool)

(assert (=> start!98546 (= tp!85181 b_and!39141)))

(declare-fun res!761204 () Bool)

(declare-fun e!649780 () Bool)

(assert (=> start!98546 (=> (not res!761204) (not e!649780))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74156 0))(
  ( (array!74157 (arr!35729 (Array (_ BitVec 32) (_ BitVec 64))) (size!36267 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74156)

(assert (=> start!98546 (= res!761204 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36267 _keys!1208))))))

(assert (=> start!98546 e!649780))

(declare-fun tp_is_empty!28687 () Bool)

(assert (=> start!98546 tp_is_empty!28687))

(declare-fun array_inv!27458 (array!74156) Bool)

(assert (=> start!98546 (array_inv!27458 _keys!1208)))

(assert (=> start!98546 true))

(assert (=> start!98546 tp!85181))

(declare-datatypes ((V!43377 0))(
  ( (V!43378 (val!14400 Int)) )
))
(declare-datatypes ((ValueCell!13634 0))(
  ( (ValueCellFull!13634 (v!17036 V!43377)) (EmptyCell!13634) )
))
(declare-datatypes ((array!74158 0))(
  ( (array!74159 (arr!35730 (Array (_ BitVec 32) ValueCell!13634)) (size!36268 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74158)

(declare-fun e!649774 () Bool)

(declare-fun array_inv!27459 (array!74158) Bool)

(assert (=> start!98546 (and (array_inv!27459 _values!996) e!649774)))

(declare-fun b!1142171 () Bool)

(declare-fun e!649773 () Bool)

(assert (=> b!1142171 (= e!649773 true)))

(declare-datatypes ((tuple2!18312 0))(
  ( (tuple2!18313 (_1!9167 (_ BitVec 64)) (_2!9167 V!43377)) )
))
(declare-datatypes ((List!25050 0))(
  ( (Nil!25047) (Cons!25046 (h!26255 tuple2!18312) (t!36190 List!25050)) )
))
(declare-datatypes ((ListLongMap!16281 0))(
  ( (ListLongMap!16282 (toList!8156 List!25050)) )
))
(declare-fun lt!508962 () ListLongMap!16281)

(declare-fun lt!508948 () V!43377)

(declare-fun -!1238 (ListLongMap!16281 (_ BitVec 64)) ListLongMap!16281)

(declare-fun +!3580 (ListLongMap!16281 tuple2!18312) ListLongMap!16281)

(assert (=> b!1142171 (= (-!1238 (+!3580 lt!508962 (tuple2!18313 (select (arr!35729 _keys!1208) from!1455) lt!508948)) (select (arr!35729 _keys!1208) from!1455)) lt!508962)))

(declare-datatypes ((Unit!37334 0))(
  ( (Unit!37335) )
))
(declare-fun lt!508951 () Unit!37334)

(declare-fun addThenRemoveForNewKeyIsSame!104 (ListLongMap!16281 (_ BitVec 64) V!43377) Unit!37334)

(assert (=> b!1142171 (= lt!508951 (addThenRemoveForNewKeyIsSame!104 lt!508962 (select (arr!35729 _keys!1208) from!1455) lt!508948))))

(declare-fun lt!508957 () V!43377)

(declare-fun get!18170 (ValueCell!13634 V!43377) V!43377)

(assert (=> b!1142171 (= lt!508948 (get!18170 (select (arr!35730 _values!996) from!1455) lt!508957))))

(declare-fun lt!508946 () Unit!37334)

(declare-fun e!649777 () Unit!37334)

(assert (=> b!1142171 (= lt!508946 e!649777)))

(declare-fun c!112249 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6625 (ListLongMap!16281 (_ BitVec 64)) Bool)

(assert (=> b!1142171 (= c!112249 (contains!6625 lt!508962 k0!934))))

(declare-fun zeroValue!944 () V!43377)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43377)

(declare-fun getCurrentListMapNoExtraKeys!4647 (array!74156 array!74158 (_ BitVec 32) (_ BitVec 32) V!43377 V!43377 (_ BitVec 32) Int) ListLongMap!16281)

(assert (=> b!1142171 (= lt!508962 (getCurrentListMapNoExtraKeys!4647 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51400 () Bool)

(declare-fun c!112248 () Bool)

(declare-fun lt!508961 () ListLongMap!16281)

(declare-fun call!51410 () Bool)

(declare-fun call!51406 () ListLongMap!16281)

(assert (=> bm!51400 (= call!51410 (contains!6625 (ite c!112248 lt!508961 call!51406) k0!934))))

(declare-fun bm!51401 () Bool)

(declare-fun call!51405 () Unit!37334)

(declare-fun call!51408 () Unit!37334)

(assert (=> bm!51401 (= call!51405 call!51408)))

(declare-fun b!1142172 () Bool)

(declare-fun res!761198 () Bool)

(assert (=> b!1142172 (=> (not res!761198) (not e!649780))))

(assert (=> b!1142172 (= res!761198 (and (= (size!36268 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36267 _keys!1208) (size!36268 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!51402 () Bool)

(declare-fun call!51403 () Bool)

(assert (=> bm!51402 (= call!51403 call!51410)))

(declare-fun b!1142173 () Bool)

(declare-fun res!761205 () Bool)

(assert (=> b!1142173 (=> (not res!761205) (not e!649780))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1142173 (= res!761205 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36267 _keys!1208))))))

(declare-fun b!1142174 () Bool)

(declare-fun e!649770 () Bool)

(declare-fun e!649781 () Bool)

(assert (=> b!1142174 (= e!649770 e!649781)))

(declare-fun res!761207 () Bool)

(assert (=> b!1142174 (=> res!761207 e!649781)))

(assert (=> b!1142174 (= res!761207 (not (= from!1455 i!673)))))

(declare-fun lt!508965 () array!74156)

(declare-fun lt!508949 () ListLongMap!16281)

(declare-fun lt!508963 () array!74158)

(assert (=> b!1142174 (= lt!508949 (getCurrentListMapNoExtraKeys!4647 lt!508965 lt!508963 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1142174 (= lt!508963 (array!74159 (store (arr!35730 _values!996) i!673 (ValueCellFull!13634 lt!508957)) (size!36268 _values!996)))))

(declare-fun dynLambda!2627 (Int (_ BitVec 64)) V!43377)

(assert (=> b!1142174 (= lt!508957 (dynLambda!2627 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!508955 () ListLongMap!16281)

(assert (=> b!1142174 (= lt!508955 (getCurrentListMapNoExtraKeys!4647 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1142175 () Bool)

(declare-fun e!649775 () Bool)

(declare-fun mapRes!44855 () Bool)

(assert (=> b!1142175 (= e!649774 (and e!649775 mapRes!44855))))

(declare-fun condMapEmpty!44855 () Bool)

(declare-fun mapDefault!44855 () ValueCell!13634)

(assert (=> b!1142175 (= condMapEmpty!44855 (= (arr!35730 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13634)) mapDefault!44855)))))

(declare-fun b!1142176 () Bool)

(declare-fun res!761201 () Bool)

(assert (=> b!1142176 (=> (not res!761201) (not e!649780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1142176 (= res!761201 (validMask!0 mask!1564))))

(declare-fun call!51404 () ListLongMap!16281)

(declare-fun bm!51403 () Bool)

(assert (=> bm!51403 (= call!51404 (getCurrentListMapNoExtraKeys!4647 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!649785 () Bool)

(declare-fun b!1142177 () Bool)

(declare-fun lt!508959 () Bool)

(assert (=> b!1142177 (= e!649785 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508959) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1142178 () Bool)

(declare-fun e!649784 () Bool)

(assert (=> b!1142178 (= e!649784 tp_is_empty!28687)))

(declare-fun b!1142179 () Bool)

(declare-fun res!761194 () Bool)

(assert (=> b!1142179 (=> (not res!761194) (not e!649780))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1142179 (= res!761194 (validKeyInArray!0 k0!934))))

(declare-fun bm!51404 () Bool)

(declare-fun call!51407 () ListLongMap!16281)

(declare-fun c!112246 () Bool)

(assert (=> bm!51404 (= call!51407 (+!3580 lt!508962 (ite (or c!112248 c!112246) (tuple2!18313 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18313 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1142180 () Bool)

(assert (=> b!1142180 (= e!649775 tp_is_empty!28687)))

(declare-fun bm!51405 () Bool)

(assert (=> bm!51405 (= call!51406 call!51407)))

(declare-fun b!1142181 () Bool)

(declare-fun e!649776 () Unit!37334)

(declare-fun lt!508964 () Unit!37334)

(assert (=> b!1142181 (= e!649776 lt!508964)))

(assert (=> b!1142181 (= lt!508964 call!51405)))

(assert (=> b!1142181 call!51403))

(declare-fun b!1142182 () Bool)

(declare-fun e!649782 () Unit!37334)

(assert (=> b!1142182 (= e!649776 e!649782)))

(declare-fun c!112245 () Bool)

(assert (=> b!1142182 (= c!112245 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508959))))

(declare-fun b!1142183 () Bool)

(declare-fun res!761199 () Bool)

(assert (=> b!1142183 (=> (not res!761199) (not e!649780))))

(assert (=> b!1142183 (= res!761199 (= (select (arr!35729 _keys!1208) i!673) k0!934))))

(declare-fun b!1142184 () Bool)

(declare-fun e!649783 () Bool)

(declare-fun call!51409 () ListLongMap!16281)

(assert (=> b!1142184 (= e!649783 (= call!51409 call!51404))))

(declare-fun b!1142185 () Bool)

(declare-fun arrayContainsKey!0 (array!74156 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1142185 (= e!649785 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51406 () Bool)

(assert (=> bm!51406 (= call!51409 (getCurrentListMapNoExtraKeys!4647 lt!508965 lt!508963 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142186 () Bool)

(declare-fun Unit!37336 () Unit!37334)

(assert (=> b!1142186 (= e!649777 Unit!37336)))

(declare-fun bm!51407 () Bool)

(declare-fun addStillContains!795 (ListLongMap!16281 (_ BitVec 64) V!43377 (_ BitVec 64)) Unit!37334)

(assert (=> bm!51407 (= call!51408 (addStillContains!795 lt!508962 (ite (or c!112248 c!112246) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112248 c!112246) zeroValue!944 minValue!944) k0!934))))

(declare-fun e!649771 () Bool)

(declare-fun b!1142187 () Bool)

(assert (=> b!1142187 (= e!649771 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1142188 () Bool)

(assert (=> b!1142188 (= c!112246 (and (not lt!508959) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!649772 () Unit!37334)

(assert (=> b!1142188 (= e!649772 e!649776)))

(declare-fun b!1142189 () Bool)

(assert (=> b!1142189 (= e!649783 (= call!51409 (-!1238 call!51404 k0!934)))))

(declare-fun mapIsEmpty!44855 () Bool)

(assert (=> mapIsEmpty!44855 mapRes!44855))

(declare-fun b!1142190 () Bool)

(declare-fun Unit!37337 () Unit!37334)

(assert (=> b!1142190 (= e!649777 Unit!37337)))

(assert (=> b!1142190 (= lt!508959 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1142190 (= c!112248 (and (not lt!508959) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!508953 () Unit!37334)

(assert (=> b!1142190 (= lt!508953 e!649772)))

(declare-fun lt!508947 () Unit!37334)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!395 (array!74156 array!74158 (_ BitVec 32) (_ BitVec 32) V!43377 V!43377 (_ BitVec 64) (_ BitVec 32) Int) Unit!37334)

(assert (=> b!1142190 (= lt!508947 (lemmaListMapContainsThenArrayContainsFrom!395 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112247 () Bool)

(assert (=> b!1142190 (= c!112247 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761202 () Bool)

(assert (=> b!1142190 (= res!761202 e!649785)))

(assert (=> b!1142190 (=> (not res!761202) (not e!649771))))

(assert (=> b!1142190 e!649771))

(declare-fun lt!508945 () Unit!37334)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74156 (_ BitVec 32) (_ BitVec 32)) Unit!37334)

(assert (=> b!1142190 (= lt!508945 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25051 0))(
  ( (Nil!25048) (Cons!25047 (h!26256 (_ BitVec 64)) (t!36191 List!25051)) )
))
(declare-fun arrayNoDuplicates!0 (array!74156 (_ BitVec 32) List!25051) Bool)

(assert (=> b!1142190 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25048)))

(declare-fun lt!508950 () Unit!37334)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74156 (_ BitVec 64) (_ BitVec 32) List!25051) Unit!37334)

(assert (=> b!1142190 (= lt!508950 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25048))))

(assert (=> b!1142190 false))

(declare-fun b!1142191 () Bool)

(assert (=> b!1142191 (contains!6625 (+!3580 lt!508961 (tuple2!18313 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!508958 () Unit!37334)

(assert (=> b!1142191 (= lt!508958 (addStillContains!795 lt!508961 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1142191 call!51410))

(assert (=> b!1142191 (= lt!508961 call!51407)))

(declare-fun lt!508960 () Unit!37334)

(assert (=> b!1142191 (= lt!508960 call!51408)))

(assert (=> b!1142191 (= e!649772 lt!508958)))

(declare-fun b!1142192 () Bool)

(declare-fun res!761197 () Bool)

(assert (=> b!1142192 (=> (not res!761197) (not e!649780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74156 (_ BitVec 32)) Bool)

(assert (=> b!1142192 (= res!761197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1142193 () Bool)

(declare-fun res!761195 () Bool)

(assert (=> b!1142193 (=> (not res!761195) (not e!649780))))

(assert (=> b!1142193 (= res!761195 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25048))))

(declare-fun b!1142194 () Bool)

(declare-fun res!761200 () Bool)

(declare-fun e!649779 () Bool)

(assert (=> b!1142194 (=> (not res!761200) (not e!649779))))

(assert (=> b!1142194 (= res!761200 (arrayNoDuplicates!0 lt!508965 #b00000000000000000000000000000000 Nil!25048))))

(declare-fun b!1142195 () Bool)

(assert (=> b!1142195 (= e!649779 (not e!649770))))

(declare-fun res!761196 () Bool)

(assert (=> b!1142195 (=> res!761196 e!649770)))

(assert (=> b!1142195 (= res!761196 (bvsgt from!1455 i!673))))

(assert (=> b!1142195 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!508952 () Unit!37334)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74156 (_ BitVec 64) (_ BitVec 32)) Unit!37334)

(assert (=> b!1142195 (= lt!508952 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1142196 () Bool)

(declare-fun Unit!37338 () Unit!37334)

(assert (=> b!1142196 (= e!649782 Unit!37338)))

(declare-fun mapNonEmpty!44855 () Bool)

(declare-fun tp!85182 () Bool)

(assert (=> mapNonEmpty!44855 (= mapRes!44855 (and tp!85182 e!649784))))

(declare-fun mapKey!44855 () (_ BitVec 32))

(declare-fun mapRest!44855 () (Array (_ BitVec 32) ValueCell!13634))

(declare-fun mapValue!44855 () ValueCell!13634)

(assert (=> mapNonEmpty!44855 (= (arr!35730 _values!996) (store mapRest!44855 mapKey!44855 mapValue!44855))))

(declare-fun b!1142197 () Bool)

(assert (=> b!1142197 (= e!649781 e!649773)))

(declare-fun res!761203 () Bool)

(assert (=> b!1142197 (=> res!761203 e!649773)))

(assert (=> b!1142197 (= res!761203 (not (= (select (arr!35729 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1142197 e!649783))

(declare-fun c!112250 () Bool)

(assert (=> b!1142197 (= c!112250 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!508956 () Unit!37334)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!519 (array!74156 array!74158 (_ BitVec 32) (_ BitVec 32) V!43377 V!43377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37334)

(assert (=> b!1142197 (= lt!508956 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!519 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142198 () Bool)

(assert (=> b!1142198 (= e!649780 e!649779)))

(declare-fun res!761206 () Bool)

(assert (=> b!1142198 (=> (not res!761206) (not e!649779))))

(assert (=> b!1142198 (= res!761206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508965 mask!1564))))

(assert (=> b!1142198 (= lt!508965 (array!74157 (store (arr!35729 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36267 _keys!1208)))))

(declare-fun b!1142199 () Bool)

(assert (=> b!1142199 call!51403))

(declare-fun lt!508954 () Unit!37334)

(assert (=> b!1142199 (= lt!508954 call!51405)))

(assert (=> b!1142199 (= e!649782 lt!508954)))

(assert (= (and start!98546 res!761204) b!1142176))

(assert (= (and b!1142176 res!761201) b!1142172))

(assert (= (and b!1142172 res!761198) b!1142192))

(assert (= (and b!1142192 res!761197) b!1142193))

(assert (= (and b!1142193 res!761195) b!1142173))

(assert (= (and b!1142173 res!761205) b!1142179))

(assert (= (and b!1142179 res!761194) b!1142183))

(assert (= (and b!1142183 res!761199) b!1142198))

(assert (= (and b!1142198 res!761206) b!1142194))

(assert (= (and b!1142194 res!761200) b!1142195))

(assert (= (and b!1142195 (not res!761196)) b!1142174))

(assert (= (and b!1142174 (not res!761207)) b!1142197))

(assert (= (and b!1142197 c!112250) b!1142189))

(assert (= (and b!1142197 (not c!112250)) b!1142184))

(assert (= (or b!1142189 b!1142184) bm!51406))

(assert (= (or b!1142189 b!1142184) bm!51403))

(assert (= (and b!1142197 (not res!761203)) b!1142171))

(assert (= (and b!1142171 c!112249) b!1142190))

(assert (= (and b!1142171 (not c!112249)) b!1142186))

(assert (= (and b!1142190 c!112248) b!1142191))

(assert (= (and b!1142190 (not c!112248)) b!1142188))

(assert (= (and b!1142188 c!112246) b!1142181))

(assert (= (and b!1142188 (not c!112246)) b!1142182))

(assert (= (and b!1142182 c!112245) b!1142199))

(assert (= (and b!1142182 (not c!112245)) b!1142196))

(assert (= (or b!1142181 b!1142199) bm!51401))

(assert (= (or b!1142181 b!1142199) bm!51405))

(assert (= (or b!1142181 b!1142199) bm!51402))

(assert (= (or b!1142191 bm!51402) bm!51400))

(assert (= (or b!1142191 bm!51401) bm!51407))

(assert (= (or b!1142191 bm!51405) bm!51404))

(assert (= (and b!1142190 c!112247) b!1142185))

(assert (= (and b!1142190 (not c!112247)) b!1142177))

(assert (= (and b!1142190 res!761202) b!1142187))

(assert (= (and b!1142175 condMapEmpty!44855) mapIsEmpty!44855))

(assert (= (and b!1142175 (not condMapEmpty!44855)) mapNonEmpty!44855))

(get-info :version)

(assert (= (and mapNonEmpty!44855 ((_ is ValueCellFull!13634) mapValue!44855)) b!1142178))

(assert (= (and b!1142175 ((_ is ValueCellFull!13634) mapDefault!44855)) b!1142180))

(assert (= start!98546 b!1142175))

(declare-fun b_lambda!19245 () Bool)

(assert (=> (not b_lambda!19245) (not b!1142174)))

(declare-fun t!36189 () Bool)

(declare-fun tb!8961 () Bool)

(assert (=> (and start!98546 (= defaultEntry!1004 defaultEntry!1004) t!36189) tb!8961))

(declare-fun result!18495 () Bool)

(assert (=> tb!8961 (= result!18495 tp_is_empty!28687)))

(assert (=> b!1142174 t!36189))

(declare-fun b_and!39143 () Bool)

(assert (= b_and!39141 (and (=> t!36189 result!18495) b_and!39143)))

(declare-fun m!1052977 () Bool)

(assert (=> b!1142193 m!1052977))

(declare-fun m!1052979 () Bool)

(assert (=> b!1142185 m!1052979))

(declare-fun m!1052981 () Bool)

(assert (=> bm!51404 m!1052981))

(declare-fun m!1052983 () Bool)

(assert (=> b!1142171 m!1052983))

(declare-fun m!1052985 () Bool)

(assert (=> b!1142171 m!1052985))

(declare-fun m!1052987 () Bool)

(assert (=> b!1142171 m!1052987))

(declare-fun m!1052989 () Bool)

(assert (=> b!1142171 m!1052989))

(declare-fun m!1052991 () Bool)

(assert (=> b!1142171 m!1052991))

(assert (=> b!1142171 m!1052987))

(declare-fun m!1052993 () Bool)

(assert (=> b!1142171 m!1052993))

(assert (=> b!1142171 m!1052991))

(declare-fun m!1052995 () Bool)

(assert (=> b!1142171 m!1052995))

(assert (=> b!1142171 m!1052985))

(declare-fun m!1052997 () Bool)

(assert (=> b!1142171 m!1052997))

(assert (=> b!1142171 m!1052987))

(declare-fun m!1052999 () Bool)

(assert (=> b!1142189 m!1052999))

(declare-fun m!1053001 () Bool)

(assert (=> bm!51407 m!1053001))

(declare-fun m!1053003 () Bool)

(assert (=> b!1142183 m!1053003))

(declare-fun m!1053005 () Bool)

(assert (=> start!98546 m!1053005))

(declare-fun m!1053007 () Bool)

(assert (=> start!98546 m!1053007))

(declare-fun m!1053009 () Bool)

(assert (=> bm!51400 m!1053009))

(assert (=> b!1142187 m!1052979))

(declare-fun m!1053011 () Bool)

(assert (=> b!1142192 m!1053011))

(declare-fun m!1053013 () Bool)

(assert (=> b!1142174 m!1053013))

(declare-fun m!1053015 () Bool)

(assert (=> b!1142174 m!1053015))

(declare-fun m!1053017 () Bool)

(assert (=> b!1142174 m!1053017))

(declare-fun m!1053019 () Bool)

(assert (=> b!1142174 m!1053019))

(assert (=> b!1142197 m!1052987))

(declare-fun m!1053021 () Bool)

(assert (=> b!1142197 m!1053021))

(declare-fun m!1053023 () Bool)

(assert (=> b!1142191 m!1053023))

(assert (=> b!1142191 m!1053023))

(declare-fun m!1053025 () Bool)

(assert (=> b!1142191 m!1053025))

(declare-fun m!1053027 () Bool)

(assert (=> b!1142191 m!1053027))

(declare-fun m!1053029 () Bool)

(assert (=> b!1142198 m!1053029))

(declare-fun m!1053031 () Bool)

(assert (=> b!1142198 m!1053031))

(declare-fun m!1053033 () Bool)

(assert (=> b!1142194 m!1053033))

(declare-fun m!1053035 () Bool)

(assert (=> b!1142190 m!1053035))

(declare-fun m!1053037 () Bool)

(assert (=> b!1142190 m!1053037))

(declare-fun m!1053039 () Bool)

(assert (=> b!1142190 m!1053039))

(declare-fun m!1053041 () Bool)

(assert (=> b!1142190 m!1053041))

(assert (=> bm!51403 m!1052983))

(declare-fun m!1053043 () Bool)

(assert (=> b!1142195 m!1053043))

(declare-fun m!1053045 () Bool)

(assert (=> b!1142195 m!1053045))

(declare-fun m!1053047 () Bool)

(assert (=> b!1142176 m!1053047))

(declare-fun m!1053049 () Bool)

(assert (=> bm!51406 m!1053049))

(declare-fun m!1053051 () Bool)

(assert (=> mapNonEmpty!44855 m!1053051))

(declare-fun m!1053053 () Bool)

(assert (=> b!1142179 m!1053053))

(check-sat (not b!1142179) (not b!1142194) (not start!98546) (not b!1142197) (not b!1142187) tp_is_empty!28687 (not b!1142189) (not b!1142171) (not b!1142191) (not bm!51400) (not b!1142198) (not b!1142174) b_and!39143 (not bm!51407) (not b_next!24157) (not bm!51403) (not bm!51404) (not b!1142193) (not b!1142195) (not mapNonEmpty!44855) (not b_lambda!19245) (not b!1142185) (not bm!51406) (not b!1142176) (not b!1142190) (not b!1142192))
(check-sat b_and!39143 (not b_next!24157))
