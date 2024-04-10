; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98768 () Bool)

(assert start!98768)

(declare-fun b_free!24373 () Bool)

(declare-fun b_next!24373 () Bool)

(assert (=> start!98768 (= b_free!24373 (not b_next!24373))))

(declare-fun tp!85829 () Bool)

(declare-fun b_and!39595 () Bool)

(assert (=> start!98768 (= tp!85829 b_and!39595)))

(declare-fun b!1152170 () Bool)

(declare-datatypes ((Unit!37911 0))(
  ( (Unit!37912) )
))
(declare-fun e!655311 () Unit!37911)

(declare-fun Unit!37913 () Unit!37911)

(assert (=> b!1152170 (= e!655311 Unit!37913)))

(declare-fun lt!516058 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1152170 (= lt!516058 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!114216 () Bool)

(assert (=> b!1152170 (= c!114216 (and (not lt!516058) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!516053 () Unit!37911)

(declare-fun e!655302 () Unit!37911)

(assert (=> b!1152170 (= lt!516053 e!655302)))

(declare-datatypes ((V!43665 0))(
  ( (V!43666 (val!14508 Int)) )
))
(declare-fun zeroValue!944 () V!43665)

(declare-datatypes ((array!74653 0))(
  ( (array!74654 (arr!35977 (Array (_ BitVec 32) (_ BitVec 64))) (size!36513 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74653)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!516062 () Unit!37911)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13742 0))(
  ( (ValueCellFull!13742 (v!17145 V!43665)) (EmptyCell!13742) )
))
(declare-datatypes ((array!74655 0))(
  ( (array!74656 (arr!35978 (Array (_ BitVec 32) ValueCell!13742)) (size!36514 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74655)

(declare-fun minValue!944 () V!43665)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!471 (array!74653 array!74655 (_ BitVec 32) (_ BitVec 32) V!43665 V!43665 (_ BitVec 64) (_ BitVec 32) Int) Unit!37911)

(assert (=> b!1152170 (= lt!516062 (lemmaListMapContainsThenArrayContainsFrom!471 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114215 () Bool)

(assert (=> b!1152170 (= c!114215 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766069 () Bool)

(declare-fun e!655298 () Bool)

(assert (=> b!1152170 (= res!766069 e!655298)))

(declare-fun e!655296 () Bool)

(assert (=> b!1152170 (=> (not res!766069) (not e!655296))))

(assert (=> b!1152170 e!655296))

(declare-fun lt!516061 () Unit!37911)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74653 (_ BitVec 32) (_ BitVec 32)) Unit!37911)

(assert (=> b!1152170 (= lt!516061 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25172 0))(
  ( (Nil!25169) (Cons!25168 (h!26377 (_ BitVec 64)) (t!36537 List!25172)) )
))
(declare-fun arrayNoDuplicates!0 (array!74653 (_ BitVec 32) List!25172) Bool)

(assert (=> b!1152170 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25169)))

(declare-fun lt!516051 () Unit!37911)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74653 (_ BitVec 64) (_ BitVec 32) List!25172) Unit!37911)

(assert (=> b!1152170 (= lt!516051 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25169))))

(assert (=> b!1152170 false))

(declare-fun b!1152171 () Bool)

(declare-fun e!655306 () Unit!37911)

(declare-fun e!655307 () Unit!37911)

(assert (=> b!1152171 (= e!655306 e!655307)))

(declare-fun c!114220 () Bool)

(assert (=> b!1152171 (= c!114220 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!516058))))

(declare-datatypes ((tuple2!18424 0))(
  ( (tuple2!18425 (_1!9223 (_ BitVec 64)) (_2!9223 V!43665)) )
))
(declare-datatypes ((List!25173 0))(
  ( (Nil!25170) (Cons!25169 (h!26378 tuple2!18424) (t!36538 List!25173)) )
))
(declare-datatypes ((ListLongMap!16393 0))(
  ( (ListLongMap!16394 (toList!8212 List!25173)) )
))
(declare-fun call!54022 () ListLongMap!16393)

(declare-fun bm!54015 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4684 (array!74653 array!74655 (_ BitVec 32) (_ BitVec 32) V!43665 V!43665 (_ BitVec 32) Int) ListLongMap!16393)

(assert (=> bm!54015 (= call!54022 (getCurrentListMapNoExtraKeys!4684 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152172 () Bool)

(declare-fun e!655299 () Bool)

(declare-fun tp_is_empty!28903 () Bool)

(assert (=> b!1152172 (= e!655299 tp_is_empty!28903)))

(declare-fun mapNonEmpty!45179 () Bool)

(declare-fun mapRes!45179 () Bool)

(declare-fun tp!85830 () Bool)

(assert (=> mapNonEmpty!45179 (= mapRes!45179 (and tp!85830 e!655299))))

(declare-fun mapRest!45179 () (Array (_ BitVec 32) ValueCell!13742))

(declare-fun mapValue!45179 () ValueCell!13742)

(declare-fun mapKey!45179 () (_ BitVec 32))

(assert (=> mapNonEmpty!45179 (= (arr!35978 _values!996) (store mapRest!45179 mapKey!45179 mapValue!45179))))

(declare-fun b!1152173 () Bool)

(declare-fun e!655310 () Bool)

(declare-fun e!655305 () Bool)

(assert (=> b!1152173 (= e!655310 e!655305)))

(declare-fun res!766070 () Bool)

(assert (=> b!1152173 (=> res!766070 e!655305)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1152173 (= res!766070 (not (= from!1455 i!673)))))

(declare-fun lt!516056 () array!74655)

(declare-fun lt!516048 () ListLongMap!16393)

(declare-fun lt!516057 () array!74653)

(assert (=> b!1152173 (= lt!516048 (getCurrentListMapNoExtraKeys!4684 lt!516057 lt!516056 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!516043 () V!43665)

(assert (=> b!1152173 (= lt!516056 (array!74656 (store (arr!35978 _values!996) i!673 (ValueCellFull!13742 lt!516043)) (size!36514 _values!996)))))

(declare-fun dynLambda!2705 (Int (_ BitVec 64)) V!43665)

(assert (=> b!1152173 (= lt!516043 (dynLambda!2705 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!516042 () ListLongMap!16393)

(assert (=> b!1152173 (= lt!516042 (getCurrentListMapNoExtraKeys!4684 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1152175 () Bool)

(declare-fun e!655297 () Bool)

(declare-fun e!655304 () Bool)

(assert (=> b!1152175 (= e!655297 e!655304)))

(declare-fun res!766063 () Bool)

(assert (=> b!1152175 (=> (not res!766063) (not e!655304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74653 (_ BitVec 32)) Bool)

(assert (=> b!1152175 (= res!766063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!516057 mask!1564))))

(assert (=> b!1152175 (= lt!516057 (array!74654 (store (arr!35977 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36513 _keys!1208)))))

(declare-fun c!114217 () Bool)

(declare-fun call!54021 () Unit!37911)

(declare-fun lt!516044 () ListLongMap!16393)

(declare-fun bm!54016 () Bool)

(declare-fun lt!516052 () ListLongMap!16393)

(declare-fun addStillContains!878 (ListLongMap!16393 (_ BitVec 64) V!43665 (_ BitVec 64)) Unit!37911)

(assert (=> bm!54016 (= call!54021 (addStillContains!878 (ite c!114216 lt!516044 lt!516052) (ite c!114216 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114217 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114216 minValue!944 (ite c!114217 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1152176 () Bool)

(assert (=> b!1152176 (= e!655298 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!516058) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1152177 () Bool)

(declare-fun e!655300 () Bool)

(assert (=> b!1152177 (= e!655305 e!655300)))

(declare-fun res!766067 () Bool)

(assert (=> b!1152177 (=> res!766067 e!655300)))

(assert (=> b!1152177 (= res!766067 (not (= (select (arr!35977 _keys!1208) from!1455) k!934)))))

(declare-fun e!655309 () Bool)

(assert (=> b!1152177 e!655309))

(declare-fun c!114218 () Bool)

(assert (=> b!1152177 (= c!114218 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!516045 () Unit!37911)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!578 (array!74653 array!74655 (_ BitVec 32) (_ BitVec 32) V!43665 V!43665 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37911)

(assert (=> b!1152177 (= lt!516045 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!578 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54017 () Bool)

(declare-fun call!54023 () Bool)

(declare-fun call!54019 () ListLongMap!16393)

(declare-fun contains!6730 (ListLongMap!16393 (_ BitVec 64)) Bool)

(assert (=> bm!54017 (= call!54023 (contains!6730 (ite c!114216 lt!516044 call!54019) k!934))))

(declare-fun bm!54018 () Bool)

(declare-fun call!54020 () ListLongMap!16393)

(declare-fun +!3630 (ListLongMap!16393 tuple2!18424) ListLongMap!16393)

(assert (=> bm!54018 (= call!54020 (+!3630 (ite c!114216 lt!516044 lt!516052) (ite c!114216 (tuple2!18425 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114217 (tuple2!18425 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18425 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1152178 () Bool)

(assert (=> b!1152178 (= e!655300 true)))

(declare-fun e!655303 () Bool)

(assert (=> b!1152178 e!655303))

(declare-fun res!766068 () Bool)

(assert (=> b!1152178 (=> (not res!766068) (not e!655303))))

(declare-fun lt!516063 () ListLongMap!16393)

(assert (=> b!1152178 (= res!766068 (= lt!516063 lt!516052))))

(declare-fun -!1343 (ListLongMap!16393 (_ BitVec 64)) ListLongMap!16393)

(assert (=> b!1152178 (= lt!516063 (-!1343 lt!516042 k!934))))

(declare-fun lt!516049 () V!43665)

(assert (=> b!1152178 (= (-!1343 (+!3630 lt!516052 (tuple2!18425 (select (arr!35977 _keys!1208) from!1455) lt!516049)) (select (arr!35977 _keys!1208) from!1455)) lt!516052)))

(declare-fun lt!516060 () Unit!37911)

(declare-fun addThenRemoveForNewKeyIsSame!185 (ListLongMap!16393 (_ BitVec 64) V!43665) Unit!37911)

(assert (=> b!1152178 (= lt!516060 (addThenRemoveForNewKeyIsSame!185 lt!516052 (select (arr!35977 _keys!1208) from!1455) lt!516049))))

(declare-fun get!18323 (ValueCell!13742 V!43665) V!43665)

(assert (=> b!1152178 (= lt!516049 (get!18323 (select (arr!35978 _values!996) from!1455) lt!516043))))

(declare-fun lt!516046 () Unit!37911)

(assert (=> b!1152178 (= lt!516046 e!655311)))

(declare-fun c!114219 () Bool)

(assert (=> b!1152178 (= c!114219 (contains!6730 lt!516052 k!934))))

(assert (=> b!1152178 (= lt!516052 (getCurrentListMapNoExtraKeys!4684 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152179 () Bool)

(declare-fun e!655308 () Bool)

(declare-fun e!655301 () Bool)

(assert (=> b!1152179 (= e!655308 (and e!655301 mapRes!45179))))

(declare-fun condMapEmpty!45179 () Bool)

(declare-fun mapDefault!45179 () ValueCell!13742)

