; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98524 () Bool)

(assert start!98524)

(declare-fun b_free!24129 () Bool)

(declare-fun b_next!24129 () Bool)

(assert (=> start!98524 (= b_free!24129 (not b_next!24129))))

(declare-fun tp!85097 () Bool)

(declare-fun b_and!39107 () Bool)

(assert (=> start!98524 (= tp!85097 b_and!39107)))

(declare-datatypes ((V!43339 0))(
  ( (V!43340 (val!14386 Int)) )
))
(declare-fun zeroValue!944 () V!43339)

(declare-datatypes ((tuple2!18196 0))(
  ( (tuple2!18197 (_1!9109 (_ BitVec 64)) (_2!9109 V!43339)) )
))
(declare-datatypes ((List!24951 0))(
  ( (Nil!24948) (Cons!24947 (h!26156 tuple2!18196) (t!36072 List!24951)) )
))
(declare-datatypes ((ListLongMap!16165 0))(
  ( (ListLongMap!16166 (toList!8098 List!24951)) )
))
(declare-fun call!51094 () ListLongMap!16165)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!74175 0))(
  ( (array!74176 (arr!35738 (Array (_ BitVec 32) (_ BitVec 64))) (size!36274 (_ BitVec 32))) )
))
(declare-fun lt!508269 () array!74175)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13620 0))(
  ( (ValueCellFull!13620 (v!17023 V!43339)) (EmptyCell!13620) )
))
(declare-datatypes ((array!74177 0))(
  ( (array!74178 (arr!35739 (Array (_ BitVec 32) ValueCell!13620)) (size!36275 (_ BitVec 32))) )
))
(declare-fun lt!508274 () array!74177)

(declare-fun bm!51087 () Bool)

(declare-fun minValue!944 () V!43339)

(declare-fun getCurrentListMapNoExtraKeys!4580 (array!74175 array!74177 (_ BitVec 32) (_ BitVec 32) V!43339 V!43339 (_ BitVec 32) Int) ListLongMap!16165)

(assert (=> bm!51087 (= call!51094 (getCurrentListMapNoExtraKeys!4580 lt!508269 lt!508274 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141049 () Bool)

(declare-fun res!760677 () Bool)

(declare-fun e!649182 () Bool)

(assert (=> b!1141049 (=> (not res!760677) (not e!649182))))

(declare-fun _keys!1208 () array!74175)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74175 (_ BitVec 32)) Bool)

(assert (=> b!1141049 (= res!760677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!51088 () Bool)

(declare-datatypes ((Unit!37423 0))(
  ( (Unit!37424) )
))
(declare-fun call!51090 () Unit!37423)

(declare-fun call!51092 () Unit!37423)

(assert (=> bm!51088 (= call!51090 call!51092)))

(declare-fun b!1141050 () Bool)

(declare-fun res!760681 () Bool)

(assert (=> b!1141050 (=> (not res!760681) (not e!649182))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1141050 (= res!760681 (validKeyInArray!0 k0!934))))

(declare-fun b!1141051 () Bool)

(declare-fun e!649178 () Bool)

(assert (=> b!1141051 (= e!649178 true)))

(declare-fun lt!508266 () ListLongMap!16165)

(declare-fun lt!508270 () V!43339)

(declare-fun -!1248 (ListLongMap!16165 (_ BitVec 64)) ListLongMap!16165)

(declare-fun +!3529 (ListLongMap!16165 tuple2!18196) ListLongMap!16165)

(assert (=> b!1141051 (= (-!1248 (+!3529 lt!508266 (tuple2!18197 (select (arr!35738 _keys!1208) from!1455) lt!508270)) (select (arr!35738 _keys!1208) from!1455)) lt!508266)))

(declare-fun lt!508275 () Unit!37423)

(declare-fun addThenRemoveForNewKeyIsSame!101 (ListLongMap!16165 (_ BitVec 64) V!43339) Unit!37423)

(assert (=> b!1141051 (= lt!508275 (addThenRemoveForNewKeyIsSame!101 lt!508266 (select (arr!35738 _keys!1208) from!1455) lt!508270))))

(declare-fun _values!996 () array!74177)

(declare-fun lt!508271 () V!43339)

(declare-fun get!18157 (ValueCell!13620 V!43339) V!43339)

(assert (=> b!1141051 (= lt!508270 (get!18157 (select (arr!35739 _values!996) from!1455) lt!508271))))

(declare-fun lt!508256 () Unit!37423)

(declare-fun e!649183 () Unit!37423)

(assert (=> b!1141051 (= lt!508256 e!649183)))

(declare-fun c!112023 () Bool)

(declare-fun contains!6633 (ListLongMap!16165 (_ BitVec 64)) Bool)

(assert (=> b!1141051 (= c!112023 (contains!6633 lt!508266 k0!934))))

(assert (=> b!1141051 (= lt!508266 (getCurrentListMapNoExtraKeys!4580 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141052 () Bool)

(declare-fun res!760682 () Bool)

(assert (=> b!1141052 (=> (not res!760682) (not e!649182))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1141052 (= res!760682 (= (select (arr!35738 _keys!1208) i!673) k0!934))))

(declare-fun b!1141053 () Bool)

(declare-fun res!760685 () Bool)

(assert (=> b!1141053 (=> (not res!760685) (not e!649182))))

(assert (=> b!1141053 (= res!760685 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36274 _keys!1208))))))

(declare-fun b!1141054 () Bool)

(declare-fun e!649187 () Unit!37423)

(declare-fun lt!508268 () Unit!37423)

(assert (=> b!1141054 (= e!649187 lt!508268)))

(assert (=> b!1141054 (= lt!508268 call!51090)))

(declare-fun call!51093 () Bool)

(assert (=> b!1141054 call!51093))

(declare-fun b!1141055 () Bool)

(declare-fun res!760672 () Bool)

(declare-fun e!649179 () Bool)

(assert (=> b!1141055 (=> (not res!760672) (not e!649179))))

(declare-datatypes ((List!24952 0))(
  ( (Nil!24949) (Cons!24948 (h!26157 (_ BitVec 64)) (t!36073 List!24952)) )
))
(declare-fun arrayNoDuplicates!0 (array!74175 (_ BitVec 32) List!24952) Bool)

(assert (=> b!1141055 (= res!760672 (arrayNoDuplicates!0 lt!508269 #b00000000000000000000000000000000 Nil!24949))))

(declare-fun res!760673 () Bool)

(assert (=> start!98524 (=> (not res!760673) (not e!649182))))

(assert (=> start!98524 (= res!760673 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36274 _keys!1208))))))

(assert (=> start!98524 e!649182))

(declare-fun tp_is_empty!28659 () Bool)

(assert (=> start!98524 tp_is_empty!28659))

(declare-fun array_inv!27392 (array!74175) Bool)

(assert (=> start!98524 (array_inv!27392 _keys!1208)))

(assert (=> start!98524 true))

(assert (=> start!98524 tp!85097))

(declare-fun e!649176 () Bool)

(declare-fun array_inv!27393 (array!74177) Bool)

(assert (=> start!98524 (and (array_inv!27393 _values!996) e!649176)))

(declare-fun mapNonEmpty!44813 () Bool)

(declare-fun mapRes!44813 () Bool)

(declare-fun tp!85098 () Bool)

(declare-fun e!649181 () Bool)

(assert (=> mapNonEmpty!44813 (= mapRes!44813 (and tp!85098 e!649181))))

(declare-fun mapKey!44813 () (_ BitVec 32))

(declare-fun mapValue!44813 () ValueCell!13620)

(declare-fun mapRest!44813 () (Array (_ BitVec 32) ValueCell!13620))

(assert (=> mapNonEmpty!44813 (= (arr!35739 _values!996) (store mapRest!44813 mapKey!44813 mapValue!44813))))

(declare-fun call!51096 () Bool)

(declare-fun bm!51089 () Bool)

(declare-fun call!51091 () ListLongMap!16165)

(declare-fun lt!508260 () ListLongMap!16165)

(declare-fun c!112022 () Bool)

(assert (=> bm!51089 (= call!51096 (contains!6633 (ite c!112022 lt!508260 call!51091) k0!934))))

(declare-fun b!1141056 () Bool)

(declare-fun Unit!37425 () Unit!37423)

(assert (=> b!1141056 (= e!649183 Unit!37425)))

(declare-fun lt!508262 () Bool)

(assert (=> b!1141056 (= lt!508262 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1141056 (= c!112022 (and (not lt!508262) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!508265 () Unit!37423)

(declare-fun e!649190 () Unit!37423)

(assert (=> b!1141056 (= lt!508265 e!649190)))

(declare-fun lt!508264 () Unit!37423)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!385 (array!74175 array!74177 (_ BitVec 32) (_ BitVec 32) V!43339 V!43339 (_ BitVec 64) (_ BitVec 32) Int) Unit!37423)

(assert (=> b!1141056 (= lt!508264 (lemmaListMapContainsThenArrayContainsFrom!385 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112021 () Bool)

(assert (=> b!1141056 (= c!112021 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760678 () Bool)

(declare-fun e!649189 () Bool)

(assert (=> b!1141056 (= res!760678 e!649189)))

(declare-fun e!649188 () Bool)

(assert (=> b!1141056 (=> (not res!760678) (not e!649188))))

(assert (=> b!1141056 e!649188))

(declare-fun lt!508259 () Unit!37423)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74175 (_ BitVec 32) (_ BitVec 32)) Unit!37423)

(assert (=> b!1141056 (= lt!508259 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1141056 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24949)))

(declare-fun lt!508257 () Unit!37423)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74175 (_ BitVec 64) (_ BitVec 32) List!24952) Unit!37423)

(assert (=> b!1141056 (= lt!508257 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24949))))

(assert (=> b!1141056 false))

(declare-fun b!1141057 () Bool)

(declare-fun c!112024 () Bool)

(assert (=> b!1141057 (= c!112024 (and (not lt!508262) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1141057 (= e!649190 e!649187)))

(declare-fun b!1141058 () Bool)

(declare-fun res!760675 () Bool)

(assert (=> b!1141058 (=> (not res!760675) (not e!649182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1141058 (= res!760675 (validMask!0 mask!1564))))

(declare-fun b!1141059 () Bool)

(assert (=> b!1141059 (= e!649182 e!649179)))

(declare-fun res!760679 () Bool)

(assert (=> b!1141059 (=> (not res!760679) (not e!649179))))

(assert (=> b!1141059 (= res!760679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508269 mask!1564))))

(assert (=> b!1141059 (= lt!508269 (array!74176 (store (arr!35738 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36274 _keys!1208)))))

(declare-fun b!1141060 () Bool)

(declare-fun e!649180 () Bool)

(assert (=> b!1141060 (= e!649179 (not e!649180))))

(declare-fun res!760684 () Bool)

(assert (=> b!1141060 (=> res!760684 e!649180)))

(assert (=> b!1141060 (= res!760684 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1141060 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!508255 () Unit!37423)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74175 (_ BitVec 64) (_ BitVec 32)) Unit!37423)

(assert (=> b!1141060 (= lt!508255 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1141061 () Bool)

(assert (=> b!1141061 (= e!649189 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1141062 () Bool)

(assert (=> b!1141062 (= e!649181 tp_is_empty!28659)))

(declare-fun b!1141063 () Bool)

(declare-fun e!649191 () Bool)

(assert (=> b!1141063 (= e!649191 e!649178)))

(declare-fun res!760683 () Bool)

(assert (=> b!1141063 (=> res!760683 e!649178)))

(assert (=> b!1141063 (= res!760683 (not (= (select (arr!35738 _keys!1208) from!1455) k0!934)))))

(declare-fun e!649184 () Bool)

(assert (=> b!1141063 e!649184))

(declare-fun c!112019 () Bool)

(assert (=> b!1141063 (= c!112019 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!508261 () Unit!37423)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!493 (array!74175 array!74177 (_ BitVec 32) (_ BitVec 32) V!43339 V!43339 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37423)

(assert (=> b!1141063 (= lt!508261 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!493 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44813 () Bool)

(assert (=> mapIsEmpty!44813 mapRes!44813))

(declare-fun b!1141064 () Bool)

(declare-fun res!760680 () Bool)

(assert (=> b!1141064 (=> (not res!760680) (not e!649182))))

(assert (=> b!1141064 (= res!760680 (and (= (size!36275 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36274 _keys!1208) (size!36275 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1141065 () Bool)

(declare-fun e!649186 () Bool)

(assert (=> b!1141065 (= e!649186 tp_is_empty!28659)))

(declare-fun bm!51090 () Bool)

(declare-fun addStillContains!786 (ListLongMap!16165 (_ BitVec 64) V!43339 (_ BitVec 64)) Unit!37423)

(assert (=> bm!51090 (= call!51092 (addStillContains!786 lt!508266 (ite (or c!112022 c!112024) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112022 c!112024) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1141066 () Bool)

(declare-fun call!51097 () ListLongMap!16165)

(assert (=> b!1141066 (= e!649184 (= call!51094 call!51097))))

(declare-fun b!1141067 () Bool)

(declare-fun e!649177 () Unit!37423)

(assert (=> b!1141067 (= e!649187 e!649177)))

(declare-fun c!112020 () Bool)

(assert (=> b!1141067 (= c!112020 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508262))))

(declare-fun b!1141068 () Bool)

(assert (=> b!1141068 (= e!649188 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51091 () Bool)

(declare-fun call!51095 () ListLongMap!16165)

(assert (=> bm!51091 (= call!51091 call!51095)))

(declare-fun b!1141069 () Bool)

(assert (=> b!1141069 (= e!649184 (= call!51094 (-!1248 call!51097 k0!934)))))

(declare-fun bm!51092 () Bool)

(assert (=> bm!51092 (= call!51095 (+!3529 lt!508266 (ite (or c!112022 c!112024) (tuple2!18197 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18197 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1141070 () Bool)

(assert (=> b!1141070 (= e!649189 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508262) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1141071 () Bool)

(assert (=> b!1141071 (= e!649180 e!649191)))

(declare-fun res!760676 () Bool)

(assert (=> b!1141071 (=> res!760676 e!649191)))

(assert (=> b!1141071 (= res!760676 (not (= from!1455 i!673)))))

(declare-fun lt!508263 () ListLongMap!16165)

(assert (=> b!1141071 (= lt!508263 (getCurrentListMapNoExtraKeys!4580 lt!508269 lt!508274 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1141071 (= lt!508274 (array!74178 (store (arr!35739 _values!996) i!673 (ValueCellFull!13620 lt!508271)) (size!36275 _values!996)))))

(declare-fun dynLambda!2625 (Int (_ BitVec 64)) V!43339)

(assert (=> b!1141071 (= lt!508271 (dynLambda!2625 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!508258 () ListLongMap!16165)

(assert (=> b!1141071 (= lt!508258 (getCurrentListMapNoExtraKeys!4580 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!51093 () Bool)

(assert (=> bm!51093 (= call!51097 (getCurrentListMapNoExtraKeys!4580 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141072 () Bool)

(declare-fun Unit!37426 () Unit!37423)

(assert (=> b!1141072 (= e!649183 Unit!37426)))

(declare-fun b!1141073 () Bool)

(assert (=> b!1141073 (= e!649176 (and e!649186 mapRes!44813))))

(declare-fun condMapEmpty!44813 () Bool)

(declare-fun mapDefault!44813 () ValueCell!13620)

(assert (=> b!1141073 (= condMapEmpty!44813 (= (arr!35739 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13620)) mapDefault!44813)))))

(declare-fun bm!51094 () Bool)

(assert (=> bm!51094 (= call!51093 call!51096)))

(declare-fun b!1141074 () Bool)

(assert (=> b!1141074 (contains!6633 (+!3529 lt!508260 (tuple2!18197 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!508272 () Unit!37423)

(assert (=> b!1141074 (= lt!508272 (addStillContains!786 lt!508260 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1141074 call!51096))

(assert (=> b!1141074 (= lt!508260 call!51095)))

(declare-fun lt!508273 () Unit!37423)

(assert (=> b!1141074 (= lt!508273 call!51092)))

(assert (=> b!1141074 (= e!649190 lt!508272)))

(declare-fun b!1141075 () Bool)

(declare-fun res!760674 () Bool)

(assert (=> b!1141075 (=> (not res!760674) (not e!649182))))

(assert (=> b!1141075 (= res!760674 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24949))))

(declare-fun b!1141076 () Bool)

(declare-fun Unit!37427 () Unit!37423)

(assert (=> b!1141076 (= e!649177 Unit!37427)))

(declare-fun b!1141077 () Bool)

(assert (=> b!1141077 call!51093))

(declare-fun lt!508267 () Unit!37423)

(assert (=> b!1141077 (= lt!508267 call!51090)))

(assert (=> b!1141077 (= e!649177 lt!508267)))

(assert (= (and start!98524 res!760673) b!1141058))

(assert (= (and b!1141058 res!760675) b!1141064))

(assert (= (and b!1141064 res!760680) b!1141049))

(assert (= (and b!1141049 res!760677) b!1141075))

(assert (= (and b!1141075 res!760674) b!1141053))

(assert (= (and b!1141053 res!760685) b!1141050))

(assert (= (and b!1141050 res!760681) b!1141052))

(assert (= (and b!1141052 res!760682) b!1141059))

(assert (= (and b!1141059 res!760679) b!1141055))

(assert (= (and b!1141055 res!760672) b!1141060))

(assert (= (and b!1141060 (not res!760684)) b!1141071))

(assert (= (and b!1141071 (not res!760676)) b!1141063))

(assert (= (and b!1141063 c!112019) b!1141069))

(assert (= (and b!1141063 (not c!112019)) b!1141066))

(assert (= (or b!1141069 b!1141066) bm!51087))

(assert (= (or b!1141069 b!1141066) bm!51093))

(assert (= (and b!1141063 (not res!760683)) b!1141051))

(assert (= (and b!1141051 c!112023) b!1141056))

(assert (= (and b!1141051 (not c!112023)) b!1141072))

(assert (= (and b!1141056 c!112022) b!1141074))

(assert (= (and b!1141056 (not c!112022)) b!1141057))

(assert (= (and b!1141057 c!112024) b!1141054))

(assert (= (and b!1141057 (not c!112024)) b!1141067))

(assert (= (and b!1141067 c!112020) b!1141077))

(assert (= (and b!1141067 (not c!112020)) b!1141076))

(assert (= (or b!1141054 b!1141077) bm!51088))

(assert (= (or b!1141054 b!1141077) bm!51091))

(assert (= (or b!1141054 b!1141077) bm!51094))

(assert (= (or b!1141074 bm!51094) bm!51089))

(assert (= (or b!1141074 bm!51088) bm!51090))

(assert (= (or b!1141074 bm!51091) bm!51092))

(assert (= (and b!1141056 c!112021) b!1141061))

(assert (= (and b!1141056 (not c!112021)) b!1141070))

(assert (= (and b!1141056 res!760678) b!1141068))

(assert (= (and b!1141073 condMapEmpty!44813) mapIsEmpty!44813))

(assert (= (and b!1141073 (not condMapEmpty!44813)) mapNonEmpty!44813))

(get-info :version)

(assert (= (and mapNonEmpty!44813 ((_ is ValueCellFull!13620) mapValue!44813)) b!1141062))

(assert (= (and b!1141073 ((_ is ValueCellFull!13620) mapDefault!44813)) b!1141065))

(assert (= start!98524 b!1141073))

(declare-fun b_lambda!19235 () Bool)

(assert (=> (not b_lambda!19235) (not b!1141071)))

(declare-fun t!36071 () Bool)

(declare-fun tb!8941 () Bool)

(assert (=> (and start!98524 (= defaultEntry!1004 defaultEntry!1004) t!36071) tb!8941))

(declare-fun result!18447 () Bool)

(assert (=> tb!8941 (= result!18447 tp_is_empty!28659)))

(assert (=> b!1141071 t!36071))

(declare-fun b_and!39109 () Bool)

(assert (= b_and!39107 (and (=> t!36071 result!18447) b_and!39109)))

(declare-fun m!1052485 () Bool)

(assert (=> b!1141071 m!1052485))

(declare-fun m!1052487 () Bool)

(assert (=> b!1141071 m!1052487))

(declare-fun m!1052489 () Bool)

(assert (=> b!1141071 m!1052489))

(declare-fun m!1052491 () Bool)

(assert (=> b!1141071 m!1052491))

(declare-fun m!1052493 () Bool)

(assert (=> b!1141051 m!1052493))

(declare-fun m!1052495 () Bool)

(assert (=> b!1141051 m!1052495))

(declare-fun m!1052497 () Bool)

(assert (=> b!1141051 m!1052497))

(declare-fun m!1052499 () Bool)

(assert (=> b!1141051 m!1052499))

(assert (=> b!1141051 m!1052495))

(declare-fun m!1052501 () Bool)

(assert (=> b!1141051 m!1052501))

(declare-fun m!1052503 () Bool)

(assert (=> b!1141051 m!1052503))

(declare-fun m!1052505 () Bool)

(assert (=> b!1141051 m!1052505))

(assert (=> b!1141051 m!1052503))

(assert (=> b!1141051 m!1052497))

(assert (=> b!1141051 m!1052503))

(declare-fun m!1052507 () Bool)

(assert (=> b!1141051 m!1052507))

(declare-fun m!1052509 () Bool)

(assert (=> b!1141058 m!1052509))

(declare-fun m!1052511 () Bool)

(assert (=> b!1141055 m!1052511))

(declare-fun m!1052513 () Bool)

(assert (=> b!1141059 m!1052513))

(declare-fun m!1052515 () Bool)

(assert (=> b!1141059 m!1052515))

(declare-fun m!1052517 () Bool)

(assert (=> b!1141061 m!1052517))

(assert (=> bm!51093 m!1052493))

(declare-fun m!1052519 () Bool)

(assert (=> b!1141069 m!1052519))

(declare-fun m!1052521 () Bool)

(assert (=> bm!51090 m!1052521))

(declare-fun m!1052523 () Bool)

(assert (=> b!1141050 m!1052523))

(declare-fun m!1052525 () Bool)

(assert (=> b!1141052 m!1052525))

(declare-fun m!1052527 () Bool)

(assert (=> b!1141075 m!1052527))

(declare-fun m!1052529 () Bool)

(assert (=> b!1141049 m!1052529))

(declare-fun m!1052531 () Bool)

(assert (=> mapNonEmpty!44813 m!1052531))

(declare-fun m!1052533 () Bool)

(assert (=> b!1141074 m!1052533))

(assert (=> b!1141074 m!1052533))

(declare-fun m!1052535 () Bool)

(assert (=> b!1141074 m!1052535))

(declare-fun m!1052537 () Bool)

(assert (=> b!1141074 m!1052537))

(assert (=> b!1141063 m!1052503))

(declare-fun m!1052539 () Bool)

(assert (=> b!1141063 m!1052539))

(declare-fun m!1052541 () Bool)

(assert (=> bm!51087 m!1052541))

(declare-fun m!1052543 () Bool)

(assert (=> start!98524 m!1052543))

(declare-fun m!1052545 () Bool)

(assert (=> start!98524 m!1052545))

(declare-fun m!1052547 () Bool)

(assert (=> b!1141056 m!1052547))

(declare-fun m!1052549 () Bool)

(assert (=> b!1141056 m!1052549))

(declare-fun m!1052551 () Bool)

(assert (=> b!1141056 m!1052551))

(declare-fun m!1052553 () Bool)

(assert (=> b!1141056 m!1052553))

(declare-fun m!1052555 () Bool)

(assert (=> bm!51089 m!1052555))

(declare-fun m!1052557 () Bool)

(assert (=> b!1141060 m!1052557))

(declare-fun m!1052559 () Bool)

(assert (=> b!1141060 m!1052559))

(assert (=> b!1141068 m!1052517))

(declare-fun m!1052561 () Bool)

(assert (=> bm!51092 m!1052561))

(check-sat (not b!1141061) b_and!39109 (not b!1141059) (not start!98524) (not b!1141050) (not b!1141055) (not bm!51089) (not b_next!24129) (not bm!51087) (not bm!51090) (not b!1141058) (not b!1141049) (not b_lambda!19235) (not bm!51092) (not b!1141075) tp_is_empty!28659 (not bm!51093) (not b!1141069) (not b!1141071) (not b!1141068) (not b!1141074) (not b!1141056) (not b!1141051) (not mapNonEmpty!44813) (not b!1141063) (not b!1141060))
(check-sat b_and!39109 (not b_next!24129))
