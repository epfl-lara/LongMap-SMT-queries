; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98956 () Bool)

(assert start!98956)

(declare-fun b_free!24561 () Bool)

(declare-fun b_next!24561 () Bool)

(assert (=> start!98956 (= b_free!24561 (not b_next!24561))))

(declare-fun tp!86393 () Bool)

(declare-fun b_and!39971 () Bool)

(assert (=> start!98956 (= tp!86393 b_and!39971)))

(declare-datatypes ((array!75023 0))(
  ( (array!75024 (arr!36162 (Array (_ BitVec 32) (_ BitVec 64))) (size!36698 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75023)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1160818 () Bool)

(declare-fun e!660094 () Bool)

(declare-fun arrayContainsKey!0 (array!75023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1160818 (= e!660094 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!45461 () Bool)

(declare-fun mapRes!45461 () Bool)

(assert (=> mapIsEmpty!45461 mapRes!45461))

(declare-fun b!1160819 () Bool)

(declare-fun res!770294 () Bool)

(declare-fun e!660101 () Bool)

(assert (=> b!1160819 (=> (not res!770294) (not e!660101))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1160819 (= res!770294 (validKeyInArray!0 k0!934))))

(declare-fun b!1160820 () Bool)

(declare-fun res!770291 () Bool)

(assert (=> b!1160820 (=> (not res!770291) (not e!660101))))

(declare-datatypes ((List!25338 0))(
  ( (Nil!25335) (Cons!25334 (h!26543 (_ BitVec 64)) (t!36891 List!25338)) )
))
(declare-fun arrayNoDuplicates!0 (array!75023 (_ BitVec 32) List!25338) Bool)

(assert (=> b!1160820 (= res!770291 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25335))))

(declare-fun b!1160821 () Bool)

(declare-fun e!660102 () Bool)

(assert (=> b!1160821 (= e!660101 e!660102)))

(declare-fun res!770301 () Bool)

(assert (=> b!1160821 (=> (not res!770301) (not e!660102))))

(declare-fun lt!522260 () array!75023)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75023 (_ BitVec 32)) Bool)

(assert (=> b!1160821 (= res!770301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!522260 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1160821 (= lt!522260 (array!75024 (store (arr!36162 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36698 _keys!1208)))))

(declare-fun b!1160823 () Bool)

(declare-fun call!56277 () Bool)

(assert (=> b!1160823 call!56277))

(declare-datatypes ((Unit!38275 0))(
  ( (Unit!38276) )
))
(declare-fun lt!522262 () Unit!38275)

(declare-fun call!56281 () Unit!38275)

(assert (=> b!1160823 (= lt!522262 call!56281)))

(declare-fun e!660089 () Unit!38275)

(assert (=> b!1160823 (= e!660089 lt!522262)))

(declare-datatypes ((V!43915 0))(
  ( (V!43916 (val!14602 Int)) )
))
(declare-fun zeroValue!944 () V!43915)

(declare-datatypes ((tuple2!18602 0))(
  ( (tuple2!18603 (_1!9312 (_ BitVec 64)) (_2!9312 V!43915)) )
))
(declare-datatypes ((List!25339 0))(
  ( (Nil!25336) (Cons!25335 (h!26544 tuple2!18602) (t!36892 List!25339)) )
))
(declare-datatypes ((ListLongMap!16571 0))(
  ( (ListLongMap!16572 (toList!8301 List!25339)) )
))
(declare-fun call!56278 () ListLongMap!16571)

(declare-fun lt!522251 () ListLongMap!16571)

(declare-fun bm!56271 () Bool)

(declare-fun lt!522255 () ListLongMap!16571)

(declare-fun c!115908 () Bool)

(declare-fun minValue!944 () V!43915)

(declare-fun c!115909 () Bool)

(declare-fun +!3706 (ListLongMap!16571 tuple2!18602) ListLongMap!16571)

(assert (=> bm!56271 (= call!56278 (+!3706 (ite c!115908 lt!522251 lt!522255) (ite c!115908 (tuple2!18603 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115909 (tuple2!18603 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18603 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-datatypes ((ValueCell!13836 0))(
  ( (ValueCellFull!13836 (v!17239 V!43915)) (EmptyCell!13836) )
))
(declare-datatypes ((array!75025 0))(
  ( (array!75026 (arr!36163 (Array (_ BitVec 32) ValueCell!13836)) (size!36699 (_ BitVec 32))) )
))
(declare-fun lt!522257 () array!75025)

(declare-fun defaultEntry!1004 () Int)

(declare-fun b!1160824 () Bool)

(declare-fun lt!522259 () ListLongMap!16571)

(declare-fun e!660100 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4765 (array!75023 array!75025 (_ BitVec 32) (_ BitVec 32) V!43915 V!43915 (_ BitVec 32) Int) ListLongMap!16571)

(assert (=> b!1160824 (= e!660100 (= lt!522259 (getCurrentListMapNoExtraKeys!4765 lt!522260 lt!522257 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!56272 () Bool)

(declare-fun call!56276 () ListLongMap!16571)

(assert (=> bm!56272 (= call!56276 (getCurrentListMapNoExtraKeys!4765 lt!522260 lt!522257 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160825 () Bool)

(declare-fun res!770290 () Bool)

(assert (=> b!1160825 (=> (not res!770290) (not e!660101))))

(assert (=> b!1160825 (= res!770290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1160826 () Bool)

(declare-fun contains!6807 (ListLongMap!16571 (_ BitVec 64)) Bool)

(assert (=> b!1160826 (contains!6807 call!56278 k0!934)))

(declare-fun lt!522256 () Unit!38275)

(declare-fun addStillContains!948 (ListLongMap!16571 (_ BitVec 64) V!43915 (_ BitVec 64)) Unit!38275)

(assert (=> b!1160826 (= lt!522256 (addStillContains!948 lt!522251 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!56275 () Bool)

(assert (=> b!1160826 call!56275))

(assert (=> b!1160826 (= lt!522251 (+!3706 lt!522255 (tuple2!18603 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!522249 () Unit!38275)

(declare-fun call!56280 () Unit!38275)

(assert (=> b!1160826 (= lt!522249 call!56280)))

(declare-fun e!660093 () Unit!38275)

(assert (=> b!1160826 (= e!660093 lt!522256)))

(declare-fun b!1160827 () Bool)

(declare-fun Unit!38277 () Unit!38275)

(assert (=> b!1160827 (= e!660089 Unit!38277)))

(declare-fun bm!56273 () Bool)

(assert (=> bm!56273 (= call!56277 call!56275)))

(declare-fun b!1160828 () Bool)

(declare-fun e!660097 () Bool)

(declare-fun tp_is_empty!29091 () Bool)

(assert (=> b!1160828 (= e!660097 tp_is_empty!29091)))

(declare-fun b!1160829 () Bool)

(declare-fun e!660104 () Bool)

(assert (=> b!1160829 (= e!660104 tp_is_empty!29091)))

(declare-fun e!660091 () Bool)

(declare-fun b!1160830 () Bool)

(assert (=> b!1160830 (= e!660091 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160831 () Bool)

(declare-fun res!770299 () Bool)

(assert (=> b!1160831 (=> (not res!770299) (not e!660102))))

(assert (=> b!1160831 (= res!770299 (arrayNoDuplicates!0 lt!522260 #b00000000000000000000000000000000 Nil!25335))))

(declare-fun b!1160832 () Bool)

(declare-fun res!770296 () Bool)

(assert (=> b!1160832 (=> (not res!770296) (not e!660101))))

(declare-fun _values!996 () array!75025)

(assert (=> b!1160832 (= res!770296 (and (= (size!36699 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36698 _keys!1208) (size!36699 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1160833 () Bool)

(declare-fun e!660095 () Bool)

(assert (=> b!1160833 (= e!660095 (and e!660097 mapRes!45461))))

(declare-fun condMapEmpty!45461 () Bool)

(declare-fun mapDefault!45461 () ValueCell!13836)

(assert (=> b!1160833 (= condMapEmpty!45461 (= (arr!36163 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13836)) mapDefault!45461)))))

(declare-fun b!1160834 () Bool)

(declare-fun e!660092 () Bool)

(assert (=> b!1160834 (= e!660102 (not e!660092))))

(declare-fun res!770298 () Bool)

(assert (=> b!1160834 (=> res!770298 e!660092)))

(assert (=> b!1160834 (= res!770298 (bvsgt from!1455 i!673))))

(assert (=> b!1160834 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!522258 () Unit!38275)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75023 (_ BitVec 64) (_ BitVec 32)) Unit!38275)

(assert (=> b!1160834 (= lt!522258 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1160835 () Bool)

(declare-fun res!770289 () Bool)

(assert (=> b!1160835 (=> (not res!770289) (not e!660101))))

(assert (=> b!1160835 (= res!770289 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36698 _keys!1208))))))

(declare-fun b!1160836 () Bool)

(declare-fun e!660099 () Bool)

(declare-fun e!660096 () Bool)

(assert (=> b!1160836 (= e!660099 e!660096)))

(declare-fun res!770295 () Bool)

(assert (=> b!1160836 (=> res!770295 e!660096)))

(assert (=> b!1160836 (= res!770295 (not (= (select (arr!36162 _keys!1208) from!1455) k0!934)))))

(declare-fun e!660105 () Bool)

(assert (=> b!1160836 e!660105))

(declare-fun c!115911 () Bool)

(assert (=> b!1160836 (= c!115911 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!522247 () Unit!38275)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!639 (array!75023 array!75025 (_ BitVec 32) (_ BitVec 32) V!43915 V!43915 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38275)

(assert (=> b!1160836 (= lt!522247 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!639 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160837 () Bool)

(declare-fun e!660090 () Unit!38275)

(declare-fun Unit!38278 () Unit!38275)

(assert (=> b!1160837 (= e!660090 Unit!38278)))

(declare-fun b!1160838 () Bool)

(declare-fun lt!522264 () Bool)

(assert (=> b!1160838 (= e!660091 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!522264) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1160839 () Bool)

(assert (=> b!1160839 (= e!660092 e!660099)))

(declare-fun res!770300 () Bool)

(assert (=> b!1160839 (=> res!770300 e!660099)))

(assert (=> b!1160839 (= res!770300 (not (= from!1455 i!673)))))

(declare-fun lt!522266 () ListLongMap!16571)

(assert (=> b!1160839 (= lt!522266 (getCurrentListMapNoExtraKeys!4765 lt!522260 lt!522257 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!522246 () V!43915)

(assert (=> b!1160839 (= lt!522257 (array!75026 (store (arr!36163 _values!996) i!673 (ValueCellFull!13836 lt!522246)) (size!36699 _values!996)))))

(declare-fun dynLambda!2764 (Int (_ BitVec 64)) V!43915)

(assert (=> b!1160839 (= lt!522246 (dynLambda!2764 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!522253 () ListLongMap!16571)

(assert (=> b!1160839 (= lt!522253 (getCurrentListMapNoExtraKeys!4765 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1160840 () Bool)

(declare-fun e!660098 () Unit!38275)

(declare-fun lt!522263 () Unit!38275)

(assert (=> b!1160840 (= e!660098 lt!522263)))

(assert (=> b!1160840 (= lt!522263 call!56281)))

(assert (=> b!1160840 call!56277))

(declare-fun bm!56274 () Bool)

(declare-fun call!56279 () ListLongMap!16571)

(assert (=> bm!56274 (= call!56279 call!56278)))

(declare-fun bm!56275 () Bool)

(assert (=> bm!56275 (= call!56275 (contains!6807 (ite c!115908 lt!522251 call!56279) k0!934))))

(declare-fun call!56274 () ListLongMap!16571)

(declare-fun bm!56276 () Bool)

(assert (=> bm!56276 (= call!56274 (getCurrentListMapNoExtraKeys!4765 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160841 () Bool)

(declare-fun res!770292 () Bool)

(assert (=> b!1160841 (=> (not res!770292) (not e!660101))))

(assert (=> b!1160841 (= res!770292 (= (select (arr!36162 _keys!1208) i!673) k0!934))))

(declare-fun bm!56277 () Bool)

(assert (=> bm!56277 (= call!56281 call!56280)))

(declare-fun res!770293 () Bool)

(assert (=> start!98956 (=> (not res!770293) (not e!660101))))

(assert (=> start!98956 (= res!770293 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36698 _keys!1208))))))

(assert (=> start!98956 e!660101))

(assert (=> start!98956 tp_is_empty!29091))

(declare-fun array_inv!27670 (array!75023) Bool)

(assert (=> start!98956 (array_inv!27670 _keys!1208)))

(assert (=> start!98956 true))

(assert (=> start!98956 tp!86393))

(declare-fun array_inv!27671 (array!75025) Bool)

(assert (=> start!98956 (and (array_inv!27671 _values!996) e!660095)))

(declare-fun b!1160822 () Bool)

(assert (=> b!1160822 (= e!660105 (= call!56276 call!56274))))

(declare-fun bm!56278 () Bool)

(assert (=> bm!56278 (= call!56280 (addStillContains!948 lt!522255 (ite (or c!115908 c!115909) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115908 c!115909) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1160842 () Bool)

(declare-fun res!770302 () Bool)

(assert (=> b!1160842 (=> (not res!770302) (not e!660101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1160842 (= res!770302 (validMask!0 mask!1564))))

(declare-fun b!1160843 () Bool)

(assert (=> b!1160843 (= e!660096 true)))

(assert (=> b!1160843 e!660100))

(declare-fun res!770303 () Bool)

(assert (=> b!1160843 (=> (not res!770303) (not e!660100))))

(assert (=> b!1160843 (= res!770303 (= lt!522259 lt!522255))))

(declare-fun -!1410 (ListLongMap!16571 (_ BitVec 64)) ListLongMap!16571)

(assert (=> b!1160843 (= lt!522259 (-!1410 lt!522253 k0!934))))

(declare-fun lt!522250 () V!43915)

(assert (=> b!1160843 (= (-!1410 (+!3706 lt!522255 (tuple2!18603 (select (arr!36162 _keys!1208) from!1455) lt!522250)) (select (arr!36162 _keys!1208) from!1455)) lt!522255)))

(declare-fun lt!522248 () Unit!38275)

(declare-fun addThenRemoveForNewKeyIsSame!244 (ListLongMap!16571 (_ BitVec 64) V!43915) Unit!38275)

(assert (=> b!1160843 (= lt!522248 (addThenRemoveForNewKeyIsSame!244 lt!522255 (select (arr!36162 _keys!1208) from!1455) lt!522250))))

(declare-fun get!18444 (ValueCell!13836 V!43915) V!43915)

(assert (=> b!1160843 (= lt!522250 (get!18444 (select (arr!36163 _values!996) from!1455) lt!522246))))

(declare-fun lt!522265 () Unit!38275)

(assert (=> b!1160843 (= lt!522265 e!660090)))

(declare-fun c!115912 () Bool)

(assert (=> b!1160843 (= c!115912 (contains!6807 lt!522255 k0!934))))

(assert (=> b!1160843 (= lt!522255 (getCurrentListMapNoExtraKeys!4765 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45461 () Bool)

(declare-fun tp!86394 () Bool)

(assert (=> mapNonEmpty!45461 (= mapRes!45461 (and tp!86394 e!660104))))

(declare-fun mapKey!45461 () (_ BitVec 32))

(declare-fun mapValue!45461 () ValueCell!13836)

(declare-fun mapRest!45461 () (Array (_ BitVec 32) ValueCell!13836))

(assert (=> mapNonEmpty!45461 (= (arr!36163 _values!996) (store mapRest!45461 mapKey!45461 mapValue!45461))))

(declare-fun b!1160844 () Bool)

(declare-fun Unit!38279 () Unit!38275)

(assert (=> b!1160844 (= e!660090 Unit!38279)))

(assert (=> b!1160844 (= lt!522264 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1160844 (= c!115908 (and (not lt!522264) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522254 () Unit!38275)

(assert (=> b!1160844 (= lt!522254 e!660093)))

(declare-fun lt!522267 () Unit!38275)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!533 (array!75023 array!75025 (_ BitVec 32) (_ BitVec 32) V!43915 V!43915 (_ BitVec 64) (_ BitVec 32) Int) Unit!38275)

(assert (=> b!1160844 (= lt!522267 (lemmaListMapContainsThenArrayContainsFrom!533 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115910 () Bool)

(assert (=> b!1160844 (= c!115910 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770297 () Bool)

(assert (=> b!1160844 (= res!770297 e!660091)))

(assert (=> b!1160844 (=> (not res!770297) (not e!660094))))

(assert (=> b!1160844 e!660094))

(declare-fun lt!522261 () Unit!38275)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75023 (_ BitVec 32) (_ BitVec 32)) Unit!38275)

(assert (=> b!1160844 (= lt!522261 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1160844 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25335)))

(declare-fun lt!522252 () Unit!38275)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75023 (_ BitVec 64) (_ BitVec 32) List!25338) Unit!38275)

(assert (=> b!1160844 (= lt!522252 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25335))))

(assert (=> b!1160844 false))

(declare-fun b!1160845 () Bool)

(assert (=> b!1160845 (= e!660098 e!660089)))

(declare-fun c!115907 () Bool)

(assert (=> b!1160845 (= c!115907 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!522264))))

(declare-fun b!1160846 () Bool)

(assert (=> b!1160846 (= c!115909 (and (not lt!522264) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1160846 (= e!660093 e!660098)))

(declare-fun b!1160847 () Bool)

(assert (=> b!1160847 (= e!660105 (= call!56276 (-!1410 call!56274 k0!934)))))

(assert (= (and start!98956 res!770293) b!1160842))

(assert (= (and b!1160842 res!770302) b!1160832))

(assert (= (and b!1160832 res!770296) b!1160825))

(assert (= (and b!1160825 res!770290) b!1160820))

(assert (= (and b!1160820 res!770291) b!1160835))

(assert (= (and b!1160835 res!770289) b!1160819))

(assert (= (and b!1160819 res!770294) b!1160841))

(assert (= (and b!1160841 res!770292) b!1160821))

(assert (= (and b!1160821 res!770301) b!1160831))

(assert (= (and b!1160831 res!770299) b!1160834))

(assert (= (and b!1160834 (not res!770298)) b!1160839))

(assert (= (and b!1160839 (not res!770300)) b!1160836))

(assert (= (and b!1160836 c!115911) b!1160847))

(assert (= (and b!1160836 (not c!115911)) b!1160822))

(assert (= (or b!1160847 b!1160822) bm!56276))

(assert (= (or b!1160847 b!1160822) bm!56272))

(assert (= (and b!1160836 (not res!770295)) b!1160843))

(assert (= (and b!1160843 c!115912) b!1160844))

(assert (= (and b!1160843 (not c!115912)) b!1160837))

(assert (= (and b!1160844 c!115908) b!1160826))

(assert (= (and b!1160844 (not c!115908)) b!1160846))

(assert (= (and b!1160846 c!115909) b!1160840))

(assert (= (and b!1160846 (not c!115909)) b!1160845))

(assert (= (and b!1160845 c!115907) b!1160823))

(assert (= (and b!1160845 (not c!115907)) b!1160827))

(assert (= (or b!1160840 b!1160823) bm!56277))

(assert (= (or b!1160840 b!1160823) bm!56274))

(assert (= (or b!1160840 b!1160823) bm!56273))

(assert (= (or b!1160826 bm!56273) bm!56275))

(assert (= (or b!1160826 bm!56277) bm!56278))

(assert (= (or b!1160826 bm!56274) bm!56271))

(assert (= (and b!1160844 c!115910) b!1160830))

(assert (= (and b!1160844 (not c!115910)) b!1160838))

(assert (= (and b!1160844 res!770297) b!1160818))

(assert (= (and b!1160843 res!770303) b!1160824))

(assert (= (and b!1160833 condMapEmpty!45461) mapIsEmpty!45461))

(assert (= (and b!1160833 (not condMapEmpty!45461)) mapNonEmpty!45461))

(get-info :version)

(assert (= (and mapNonEmpty!45461 ((_ is ValueCellFull!13836) mapValue!45461)) b!1160829))

(assert (= (and b!1160833 ((_ is ValueCellFull!13836) mapDefault!45461)) b!1160828))

(assert (= start!98956 b!1160833))

(declare-fun b_lambda!19667 () Bool)

(assert (=> (not b_lambda!19667) (not b!1160839)))

(declare-fun t!36890 () Bool)

(declare-fun tb!9373 () Bool)

(assert (=> (and start!98956 (= defaultEntry!1004 defaultEntry!1004) t!36890) tb!9373))

(declare-fun result!19311 () Bool)

(assert (=> tb!9373 (= result!19311 tp_is_empty!29091)))

(assert (=> b!1160839 t!36890))

(declare-fun b_and!39973 () Bool)

(assert (= b_and!39971 (and (=> t!36890 result!19311) b_and!39973)))

(declare-fun m!1069721 () Bool)

(assert (=> b!1160821 m!1069721))

(declare-fun m!1069723 () Bool)

(assert (=> b!1160821 m!1069723))

(declare-fun m!1069725 () Bool)

(assert (=> bm!56271 m!1069725))

(declare-fun m!1069727 () Bool)

(assert (=> bm!56272 m!1069727))

(declare-fun m!1069729 () Bool)

(assert (=> b!1160847 m!1069729))

(declare-fun m!1069731 () Bool)

(assert (=> mapNonEmpty!45461 m!1069731))

(declare-fun m!1069733 () Bool)

(assert (=> b!1160839 m!1069733))

(declare-fun m!1069735 () Bool)

(assert (=> b!1160839 m!1069735))

(declare-fun m!1069737 () Bool)

(assert (=> b!1160839 m!1069737))

(declare-fun m!1069739 () Bool)

(assert (=> b!1160839 m!1069739))

(declare-fun m!1069741 () Bool)

(assert (=> b!1160844 m!1069741))

(declare-fun m!1069743 () Bool)

(assert (=> b!1160844 m!1069743))

(declare-fun m!1069745 () Bool)

(assert (=> b!1160844 m!1069745))

(declare-fun m!1069747 () Bool)

(assert (=> b!1160844 m!1069747))

(declare-fun m!1069749 () Bool)

(assert (=> b!1160818 m!1069749))

(assert (=> b!1160830 m!1069749))

(declare-fun m!1069751 () Bool)

(assert (=> b!1160836 m!1069751))

(declare-fun m!1069753 () Bool)

(assert (=> b!1160836 m!1069753))

(assert (=> b!1160824 m!1069727))

(declare-fun m!1069755 () Bool)

(assert (=> bm!56278 m!1069755))

(declare-fun m!1069757 () Bool)

(assert (=> b!1160841 m!1069757))

(declare-fun m!1069759 () Bool)

(assert (=> b!1160843 m!1069759))

(assert (=> b!1160843 m!1069751))

(declare-fun m!1069761 () Bool)

(assert (=> b!1160843 m!1069761))

(declare-fun m!1069763 () Bool)

(assert (=> b!1160843 m!1069763))

(assert (=> b!1160843 m!1069751))

(declare-fun m!1069765 () Bool)

(assert (=> b!1160843 m!1069765))

(declare-fun m!1069767 () Bool)

(assert (=> b!1160843 m!1069767))

(declare-fun m!1069769 () Bool)

(assert (=> b!1160843 m!1069769))

(assert (=> b!1160843 m!1069759))

(declare-fun m!1069771 () Bool)

(assert (=> b!1160843 m!1069771))

(assert (=> b!1160843 m!1069767))

(declare-fun m!1069773 () Bool)

(assert (=> b!1160843 m!1069773))

(assert (=> b!1160843 m!1069751))

(declare-fun m!1069775 () Bool)

(assert (=> b!1160834 m!1069775))

(declare-fun m!1069777 () Bool)

(assert (=> b!1160834 m!1069777))

(declare-fun m!1069779 () Bool)

(assert (=> start!98956 m!1069779))

(declare-fun m!1069781 () Bool)

(assert (=> start!98956 m!1069781))

(declare-fun m!1069783 () Bool)

(assert (=> b!1160820 m!1069783))

(declare-fun m!1069785 () Bool)

(assert (=> b!1160825 m!1069785))

(declare-fun m!1069787 () Bool)

(assert (=> bm!56275 m!1069787))

(declare-fun m!1069789 () Bool)

(assert (=> b!1160842 m!1069789))

(assert (=> bm!56276 m!1069763))

(declare-fun m!1069791 () Bool)

(assert (=> b!1160819 m!1069791))

(declare-fun m!1069793 () Bool)

(assert (=> b!1160831 m!1069793))

(declare-fun m!1069795 () Bool)

(assert (=> b!1160826 m!1069795))

(declare-fun m!1069797 () Bool)

(assert (=> b!1160826 m!1069797))

(declare-fun m!1069799 () Bool)

(assert (=> b!1160826 m!1069799))

(check-sat (not bm!56271) (not start!98956) (not b!1160839) (not b!1160831) (not b!1160825) (not b!1160844) (not b_lambda!19667) (not bm!56272) (not b!1160830) (not bm!56275) (not b!1160843) (not b_next!24561) (not b!1160836) (not b!1160847) tp_is_empty!29091 (not b!1160826) (not b!1160842) (not b!1160821) b_and!39973 (not b!1160820) (not bm!56276) (not b!1160824) (not b!1160834) (not b!1160819) (not mapNonEmpty!45461) (not bm!56278) (not b!1160818))
(check-sat b_and!39973 (not b_next!24561))
