; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98960 () Bool)

(assert start!98960)

(declare-fun b_free!24565 () Bool)

(declare-fun b_next!24565 () Bool)

(assert (=> start!98960 (= b_free!24565 (not b_next!24565))))

(declare-fun tp!86405 () Bool)

(declare-fun b_and!39979 () Bool)

(assert (=> start!98960 (= tp!86405 b_and!39979)))

(declare-fun b!1161002 () Bool)

(declare-datatypes ((Unit!38285 0))(
  ( (Unit!38286) )
))
(declare-fun e!660196 () Unit!38285)

(declare-fun Unit!38287 () Unit!38285)

(assert (=> b!1161002 (= e!660196 Unit!38287)))

(declare-fun lt!522393 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1161002 (= lt!522393 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115946 () Bool)

(assert (=> b!1161002 (= c!115946 (and (not lt!522393) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522398 () Unit!38285)

(declare-fun e!660202 () Unit!38285)

(assert (=> b!1161002 (= lt!522398 e!660202)))

(declare-datatypes ((V!43921 0))(
  ( (V!43922 (val!14604 Int)) )
))
(declare-fun zeroValue!944 () V!43921)

(declare-datatypes ((array!75031 0))(
  ( (array!75032 (arr!36166 (Array (_ BitVec 32) (_ BitVec 64))) (size!36702 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75031)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!522389 () Unit!38285)

(declare-datatypes ((ValueCell!13838 0))(
  ( (ValueCellFull!13838 (v!17241 V!43921)) (EmptyCell!13838) )
))
(declare-datatypes ((array!75033 0))(
  ( (array!75034 (arr!36167 (Array (_ BitVec 32) ValueCell!13838)) (size!36703 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75033)

(declare-fun minValue!944 () V!43921)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!535 (array!75031 array!75033 (_ BitVec 32) (_ BitVec 32) V!43921 V!43921 (_ BitVec 64) (_ BitVec 32) Int) Unit!38285)

(assert (=> b!1161002 (= lt!522389 (lemmaListMapContainsThenArrayContainsFrom!535 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115947 () Bool)

(assert (=> b!1161002 (= c!115947 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770393 () Bool)

(declare-fun e!660206 () Bool)

(assert (=> b!1161002 (= res!770393 e!660206)))

(declare-fun e!660204 () Bool)

(assert (=> b!1161002 (=> (not res!770393) (not e!660204))))

(assert (=> b!1161002 e!660204))

(declare-fun lt!522382 () Unit!38285)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75031 (_ BitVec 32) (_ BitVec 32)) Unit!38285)

(assert (=> b!1161002 (= lt!522382 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25342 0))(
  ( (Nil!25339) (Cons!25338 (h!26547 (_ BitVec 64)) (t!36899 List!25342)) )
))
(declare-fun arrayNoDuplicates!0 (array!75031 (_ BitVec 32) List!25342) Bool)

(assert (=> b!1161002 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25339)))

(declare-fun lt!522394 () Unit!38285)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75031 (_ BitVec 64) (_ BitVec 32) List!25342) Unit!38285)

(assert (=> b!1161002 (= lt!522394 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25339))))

(assert (=> b!1161002 false))

(declare-fun bm!56319 () Bool)

(declare-fun call!56328 () Unit!38285)

(declare-fun call!56326 () Unit!38285)

(assert (=> bm!56319 (= call!56328 call!56326)))

(declare-fun b!1161003 () Bool)

(declare-fun res!770389 () Bool)

(declare-fun e!660195 () Bool)

(assert (=> b!1161003 (=> (not res!770389) (not e!660195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1161003 (= res!770389 (validMask!0 mask!1564))))

(declare-fun b!1161004 () Bool)

(declare-fun call!56322 () Bool)

(assert (=> b!1161004 call!56322))

(declare-fun lt!522397 () Unit!38285)

(assert (=> b!1161004 (= lt!522397 call!56328)))

(declare-fun e!660193 () Unit!38285)

(assert (=> b!1161004 (= e!660193 lt!522397)))

(declare-fun b!1161005 () Bool)

(declare-fun e!660198 () Bool)

(declare-fun e!660205 () Bool)

(assert (=> b!1161005 (= e!660198 e!660205)))

(declare-fun res!770392 () Bool)

(assert (=> b!1161005 (=> res!770392 e!660205)))

(assert (=> b!1161005 (= res!770392 (not (= (select (arr!36166 _keys!1208) from!1455) k!934)))))

(declare-fun e!660192 () Bool)

(assert (=> b!1161005 e!660192))

(declare-fun c!115943 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1161005 (= c!115943 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!522396 () Unit!38285)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!640 (array!75031 array!75033 (_ BitVec 32) (_ BitVec 32) V!43921 V!43921 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38285)

(assert (=> b!1161005 (= lt!522396 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!640 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161006 () Bool)

(declare-fun e!660201 () Bool)

(declare-fun tp_is_empty!29095 () Bool)

(assert (=> b!1161006 (= e!660201 tp_is_empty!29095)))

(declare-fun b!1161008 () Bool)

(declare-fun e!660191 () Bool)

(declare-fun e!660194 () Bool)

(assert (=> b!1161008 (= e!660191 (not e!660194))))

(declare-fun res!770380 () Bool)

(assert (=> b!1161008 (=> res!770380 e!660194)))

(assert (=> b!1161008 (= res!770380 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1161008 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!522386 () Unit!38285)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75031 (_ BitVec 64) (_ BitVec 32)) Unit!38285)

(assert (=> b!1161008 (= lt!522386 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-datatypes ((tuple2!18606 0))(
  ( (tuple2!18607 (_1!9314 (_ BitVec 64)) (_2!9314 V!43921)) )
))
(declare-datatypes ((List!25343 0))(
  ( (Nil!25340) (Cons!25339 (h!26548 tuple2!18606) (t!36900 List!25343)) )
))
(declare-datatypes ((ListLongMap!16575 0))(
  ( (ListLongMap!16576 (toList!8303 List!25343)) )
))
(declare-fun lt!522385 () ListLongMap!16575)

(declare-fun bm!56320 () Bool)

(declare-fun c!115944 () Bool)

(declare-fun call!56324 () ListLongMap!16575)

(declare-fun +!3708 (ListLongMap!16575 tuple2!18606) ListLongMap!16575)

(assert (=> bm!56320 (= call!56324 (+!3708 lt!522385 (ite (or c!115946 c!115944) (tuple2!18607 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!56321 () Bool)

(declare-fun call!56329 () ListLongMap!16575)

(assert (=> bm!56321 (= call!56329 call!56324)))

(declare-fun b!1161009 () Bool)

(declare-fun Unit!38288 () Unit!38285)

(assert (=> b!1161009 (= e!660193 Unit!38288)))

(declare-fun b!1161010 () Bool)

(declare-fun lt!522392 () ListLongMap!16575)

(declare-fun contains!6809 (ListLongMap!16575 (_ BitVec 64)) Bool)

(assert (=> b!1161010 (contains!6809 (+!3708 lt!522392 (tuple2!18607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!522388 () Unit!38285)

(declare-fun addStillContains!950 (ListLongMap!16575 (_ BitVec 64) V!43921 (_ BitVec 64)) Unit!38285)

(assert (=> b!1161010 (= lt!522388 (addStillContains!950 lt!522392 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!56325 () Bool)

(assert (=> b!1161010 call!56325))

(assert (=> b!1161010 (= lt!522392 call!56324)))

(declare-fun lt!522390 () Unit!38285)

(assert (=> b!1161010 (= lt!522390 call!56326)))

(assert (=> b!1161010 (= e!660202 lt!522388)))

(declare-fun b!1161011 () Bool)

(declare-fun res!770379 () Bool)

(assert (=> b!1161011 (=> (not res!770379) (not e!660195))))

(assert (=> b!1161011 (= res!770379 (= (select (arr!36166 _keys!1208) i!673) k!934))))

(declare-fun b!1161012 () Bool)

(declare-fun e!660197 () Unit!38285)

(declare-fun lt!522387 () Unit!38285)

(assert (=> b!1161012 (= e!660197 lt!522387)))

(assert (=> b!1161012 (= lt!522387 call!56328)))

(assert (=> b!1161012 call!56322))

(declare-fun b!1161013 () Bool)

(declare-fun Unit!38289 () Unit!38285)

(assert (=> b!1161013 (= e!660196 Unit!38289)))

(declare-fun b!1161014 () Bool)

(assert (=> b!1161014 (= e!660194 e!660198)))

(declare-fun res!770384 () Bool)

(assert (=> b!1161014 (=> res!770384 e!660198)))

(assert (=> b!1161014 (= res!770384 (not (= from!1455 i!673)))))

(declare-fun lt!522383 () array!75033)

(declare-fun lt!522395 () ListLongMap!16575)

(declare-fun lt!522379 () array!75031)

(declare-fun getCurrentListMapNoExtraKeys!4767 (array!75031 array!75033 (_ BitVec 32) (_ BitVec 32) V!43921 V!43921 (_ BitVec 32) Int) ListLongMap!16575)

(assert (=> b!1161014 (= lt!522395 (getCurrentListMapNoExtraKeys!4767 lt!522379 lt!522383 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!522384 () V!43921)

(assert (=> b!1161014 (= lt!522383 (array!75034 (store (arr!36167 _values!996) i!673 (ValueCellFull!13838 lt!522384)) (size!36703 _values!996)))))

(declare-fun dynLambda!2765 (Int (_ BitVec 64)) V!43921)

(assert (=> b!1161014 (= lt!522384 (dynLambda!2765 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!522380 () ListLongMap!16575)

(assert (=> b!1161014 (= lt!522380 (getCurrentListMapNoExtraKeys!4767 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!56322 () Bool)

(assert (=> bm!56322 (= call!56322 call!56325)))

(declare-fun b!1161015 () Bool)

(declare-fun call!56327 () ListLongMap!16575)

(declare-fun call!56323 () ListLongMap!16575)

(assert (=> b!1161015 (= e!660192 (= call!56327 call!56323))))

(declare-fun bm!56323 () Bool)

(assert (=> bm!56323 (= call!56327 (getCurrentListMapNoExtraKeys!4767 lt!522379 lt!522383 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56324 () Bool)

(assert (=> bm!56324 (= call!56326 (addStillContains!950 lt!522385 (ite (or c!115946 c!115944) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115946 c!115944) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1161016 () Bool)

(declare-fun e!660200 () Bool)

(declare-fun e!660207 () Bool)

(declare-fun mapRes!45467 () Bool)

(assert (=> b!1161016 (= e!660200 (and e!660207 mapRes!45467))))

(declare-fun condMapEmpty!45467 () Bool)

(declare-fun mapDefault!45467 () ValueCell!13838)

