; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99172 () Bool)

(assert start!99172)

(declare-fun b_free!24541 () Bool)

(declare-fun b_next!24541 () Bool)

(assert (=> start!99172 (= b_free!24541 (not b_next!24541))))

(declare-fun tp!86334 () Bool)

(declare-fun b_and!39933 () Bool)

(assert (=> start!99172 (= tp!86334 b_and!39933)))

(declare-fun b!1161187 () Bool)

(declare-fun res!770351 () Bool)

(declare-fun e!660419 () Bool)

(assert (=> b!1161187 (=> (not res!770351) (not e!660419))))

(declare-datatypes ((array!75031 0))(
  ( (array!75032 (arr!36160 (Array (_ BitVec 32) (_ BitVec 64))) (size!36697 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75031)

(declare-datatypes ((List!25346 0))(
  ( (Nil!25343) (Cons!25342 (h!26560 (_ BitVec 64)) (t!36871 List!25346)) )
))
(declare-fun arrayNoDuplicates!0 (array!75031 (_ BitVec 32) List!25346) Bool)

(assert (=> b!1161187 (= res!770351 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25343))))

(declare-fun bm!56096 () Bool)

(declare-datatypes ((V!43889 0))(
  ( (V!43890 (val!14592 Int)) )
))
(declare-datatypes ((tuple2!18608 0))(
  ( (tuple2!18609 (_1!9315 (_ BitVec 64)) (_2!9315 V!43889)) )
))
(declare-datatypes ((List!25347 0))(
  ( (Nil!25344) (Cons!25343 (h!26561 tuple2!18608) (t!36872 List!25347)) )
))
(declare-datatypes ((ListLongMap!16585 0))(
  ( (ListLongMap!16586 (toList!8308 List!25347)) )
))
(declare-fun call!56102 () ListLongMap!16585)

(declare-fun call!56099 () ListLongMap!16585)

(assert (=> bm!56096 (= call!56102 call!56099)))

(declare-fun b!1161188 () Bool)

(declare-fun c!116130 () Bool)

(declare-fun lt!522088 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1161188 (= c!116130 (and (not lt!522088) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!38221 0))(
  ( (Unit!38222) )
))
(declare-fun e!660416 () Unit!38221)

(declare-fun e!660414 () Unit!38221)

(assert (=> b!1161188 (= e!660416 e!660414)))

(declare-fun zeroValue!944 () V!43889)

(declare-fun lt!522086 () ListLongMap!16585)

(declare-fun lt!522089 () ListLongMap!16585)

(declare-fun bm!56097 () Bool)

(declare-fun minValue!944 () V!43889)

(declare-fun c!116126 () Bool)

(declare-fun +!3726 (ListLongMap!16585 tuple2!18608) ListLongMap!16585)

(assert (=> bm!56097 (= call!56099 (+!3726 (ite c!116126 lt!522086 lt!522089) (ite c!116126 (tuple2!18609 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116130 (tuple2!18609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18609 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun call!56106 () Bool)

(declare-fun bm!56098 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6827 (ListLongMap!16585 (_ BitVec 64)) Bool)

(assert (=> bm!56098 (= call!56106 (contains!6827 (ite c!116126 lt!522086 call!56102) k0!934))))

(declare-fun b!1161189 () Bool)

(declare-fun e!660423 () Bool)

(assert (=> b!1161189 (= e!660419 e!660423)))

(declare-fun res!770359 () Bool)

(assert (=> b!1161189 (=> (not res!770359) (not e!660423))))

(declare-fun lt!522082 () array!75031)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75031 (_ BitVec 32)) Bool)

(assert (=> b!1161189 (= res!770359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!522082 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1161189 (= lt!522082 (array!75032 (store (arr!36160 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36697 _keys!1208)))))

(declare-fun b!1161190 () Bool)

(declare-fun e!660424 () Bool)

(declare-fun e!660411 () Bool)

(declare-fun mapRes!45431 () Bool)

(assert (=> b!1161190 (= e!660424 (and e!660411 mapRes!45431))))

(declare-fun condMapEmpty!45431 () Bool)

(declare-datatypes ((ValueCell!13826 0))(
  ( (ValueCellFull!13826 (v!17225 V!43889)) (EmptyCell!13826) )
))
(declare-datatypes ((array!75033 0))(
  ( (array!75034 (arr!36161 (Array (_ BitVec 32) ValueCell!13826)) (size!36698 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75033)

(declare-fun mapDefault!45431 () ValueCell!13826)

(assert (=> b!1161190 (= condMapEmpty!45431 (= (arr!36161 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13826)) mapDefault!45431)))))

(declare-fun b!1161191 () Bool)

(declare-fun e!660418 () Unit!38221)

(declare-fun Unit!38223 () Unit!38221)

(assert (=> b!1161191 (= e!660418 Unit!38223)))

(declare-fun mapNonEmpty!45431 () Bool)

(declare-fun tp!86333 () Bool)

(declare-fun e!660415 () Bool)

(assert (=> mapNonEmpty!45431 (= mapRes!45431 (and tp!86333 e!660415))))

(declare-fun mapKey!45431 () (_ BitVec 32))

(declare-fun mapValue!45431 () ValueCell!13826)

(declare-fun mapRest!45431 () (Array (_ BitVec 32) ValueCell!13826))

(assert (=> mapNonEmpty!45431 (= (arr!36161 _values!996) (store mapRest!45431 mapKey!45431 mapValue!45431))))

(declare-fun lt!522091 () ListLongMap!16585)

(declare-fun e!660417 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1161192 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!522072 () array!75033)

(declare-fun getCurrentListMapNoExtraKeys!4800 (array!75031 array!75033 (_ BitVec 32) (_ BitVec 32) V!43889 V!43889 (_ BitVec 32) Int) ListLongMap!16585)

(assert (=> b!1161192 (= e!660417 (= lt!522091 (getCurrentListMapNoExtraKeys!4800 lt!522082 lt!522072 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1161193 () Bool)

(declare-fun res!770353 () Bool)

(assert (=> b!1161193 (=> (not res!770353) (not e!660419))))

(assert (=> b!1161193 (= res!770353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1161194 () Bool)

(assert (=> b!1161194 (= e!660414 e!660418)))

(declare-fun c!116129 () Bool)

(assert (=> b!1161194 (= c!116129 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!522088))))

(declare-fun b!1161196 () Bool)

(declare-fun e!660425 () Bool)

(assert (=> b!1161196 (= e!660423 (not e!660425))))

(declare-fun res!770352 () Bool)

(assert (=> b!1161196 (=> res!770352 e!660425)))

(assert (=> b!1161196 (= res!770352 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1161196 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!522070 () Unit!38221)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75031 (_ BitVec 64) (_ BitVec 32)) Unit!38221)

(assert (=> b!1161196 (= lt!522070 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun call!56103 () Unit!38221)

(declare-fun bm!56099 () Bool)

(declare-fun addStillContains!945 (ListLongMap!16585 (_ BitVec 64) V!43889 (_ BitVec 64)) Unit!38221)

(assert (=> bm!56099 (= call!56103 (addStillContains!945 lt!522089 (ite (or c!116126 c!116130) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!116126 c!116130) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1161197 () Bool)

(declare-fun e!660426 () Bool)

(assert (=> b!1161197 (= e!660426 true)))

(assert (=> b!1161197 e!660417))

(declare-fun res!770350 () Bool)

(assert (=> b!1161197 (=> (not res!770350) (not e!660417))))

(assert (=> b!1161197 (= res!770350 (= lt!522091 lt!522089))))

(declare-fun lt!522087 () ListLongMap!16585)

(declare-fun -!1406 (ListLongMap!16585 (_ BitVec 64)) ListLongMap!16585)

(assert (=> b!1161197 (= lt!522091 (-!1406 lt!522087 k0!934))))

(declare-fun lt!522079 () V!43889)

(assert (=> b!1161197 (= (-!1406 (+!3726 lt!522089 (tuple2!18609 (select (arr!36160 _keys!1208) from!1455) lt!522079)) (select (arr!36160 _keys!1208) from!1455)) lt!522089)))

(declare-fun lt!522085 () Unit!38221)

(declare-fun addThenRemoveForNewKeyIsSame!236 (ListLongMap!16585 (_ BitVec 64) V!43889) Unit!38221)

(assert (=> b!1161197 (= lt!522085 (addThenRemoveForNewKeyIsSame!236 lt!522089 (select (arr!36160 _keys!1208) from!1455) lt!522079))))

(declare-fun lt!522083 () V!43889)

(declare-fun get!18461 (ValueCell!13826 V!43889) V!43889)

(assert (=> b!1161197 (= lt!522079 (get!18461 (select (arr!36161 _values!996) from!1455) lt!522083))))

(declare-fun lt!522075 () Unit!38221)

(declare-fun e!660413 () Unit!38221)

(assert (=> b!1161197 (= lt!522075 e!660413)))

(declare-fun c!116128 () Bool)

(assert (=> b!1161197 (= c!116128 (contains!6827 lt!522089 k0!934))))

(assert (=> b!1161197 (= lt!522089 (getCurrentListMapNoExtraKeys!4800 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161198 () Bool)

(declare-fun lt!522076 () Unit!38221)

(assert (=> b!1161198 (= e!660414 lt!522076)))

(declare-fun call!56101 () Unit!38221)

(assert (=> b!1161198 (= lt!522076 call!56101)))

(declare-fun call!56100 () Bool)

(assert (=> b!1161198 call!56100))

(declare-fun bm!56100 () Bool)

(assert (=> bm!56100 (= call!56101 call!56103)))

(declare-fun b!1161199 () Bool)

(declare-fun res!770357 () Bool)

(assert (=> b!1161199 (=> (not res!770357) (not e!660419))))

(assert (=> b!1161199 (= res!770357 (and (= (size!36698 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36697 _keys!1208) (size!36698 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1161200 () Bool)

(declare-fun e!660420 () Bool)

(assert (=> b!1161200 (= e!660420 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1161201 () Bool)

(declare-fun e!660421 () Bool)

(declare-fun call!56104 () ListLongMap!16585)

(declare-fun call!56105 () ListLongMap!16585)

(assert (=> b!1161201 (= e!660421 (= call!56104 call!56105))))

(declare-fun bm!56101 () Bool)

(assert (=> bm!56101 (= call!56100 call!56106)))

(declare-fun bm!56102 () Bool)

(assert (=> bm!56102 (= call!56104 (getCurrentListMapNoExtraKeys!4800 lt!522082 lt!522072 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161202 () Bool)

(declare-fun res!770349 () Bool)

(assert (=> b!1161202 (=> (not res!770349) (not e!660419))))

(assert (=> b!1161202 (= res!770349 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36697 _keys!1208))))))

(declare-fun b!1161203 () Bool)

(assert (=> b!1161203 (contains!6827 call!56099 k0!934)))

(declare-fun lt!522071 () Unit!38221)

(assert (=> b!1161203 (= lt!522071 (addStillContains!945 lt!522086 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1161203 call!56106))

(assert (=> b!1161203 (= lt!522086 (+!3726 lt!522089 (tuple2!18609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!522090 () Unit!38221)

(assert (=> b!1161203 (= lt!522090 call!56103)))

(assert (=> b!1161203 (= e!660416 lt!522071)))

(declare-fun e!660422 () Bool)

(declare-fun b!1161204 () Bool)

(assert (=> b!1161204 (= e!660422 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1161205 () Bool)

(declare-fun e!660412 () Bool)

(assert (=> b!1161205 (= e!660412 e!660426)))

(declare-fun res!770348 () Bool)

(assert (=> b!1161205 (=> res!770348 e!660426)))

(assert (=> b!1161205 (= res!770348 (not (= (select (arr!36160 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1161205 e!660421))

(declare-fun c!116125 () Bool)

(assert (=> b!1161205 (= c!116125 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!522074 () Unit!38221)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!639 (array!75031 array!75033 (_ BitVec 32) (_ BitVec 32) V!43889 V!43889 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38221)

(assert (=> b!1161205 (= lt!522074 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!639 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161206 () Bool)

(declare-fun tp_is_empty!29071 () Bool)

(assert (=> b!1161206 (= e!660411 tp_is_empty!29071)))

(declare-fun mapIsEmpty!45431 () Bool)

(assert (=> mapIsEmpty!45431 mapRes!45431))

(declare-fun b!1161207 () Bool)

(declare-fun res!770355 () Bool)

(assert (=> b!1161207 (=> (not res!770355) (not e!660419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1161207 (= res!770355 (validKeyInArray!0 k0!934))))

(declare-fun b!1161208 () Bool)

(declare-fun Unit!38224 () Unit!38221)

(assert (=> b!1161208 (= e!660413 Unit!38224)))

(declare-fun b!1161209 () Bool)

(declare-fun Unit!38225 () Unit!38221)

(assert (=> b!1161209 (= e!660413 Unit!38225)))

(assert (=> b!1161209 (= lt!522088 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1161209 (= c!116126 (and (not lt!522088) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522077 () Unit!38221)

(assert (=> b!1161209 (= lt!522077 e!660416)))

(declare-fun lt!522078 () Unit!38221)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!533 (array!75031 array!75033 (_ BitVec 32) (_ BitVec 32) V!43889 V!43889 (_ BitVec 64) (_ BitVec 32) Int) Unit!38221)

(assert (=> b!1161209 (= lt!522078 (lemmaListMapContainsThenArrayContainsFrom!533 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116127 () Bool)

(assert (=> b!1161209 (= c!116127 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770356 () Bool)

(assert (=> b!1161209 (= res!770356 e!660420)))

(assert (=> b!1161209 (=> (not res!770356) (not e!660422))))

(assert (=> b!1161209 e!660422))

(declare-fun lt!522081 () Unit!38221)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75031 (_ BitVec 32) (_ BitVec 32)) Unit!38221)

(assert (=> b!1161209 (= lt!522081 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1161209 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25343)))

(declare-fun lt!522084 () Unit!38221)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75031 (_ BitVec 64) (_ BitVec 32) List!25346) Unit!38221)

(assert (=> b!1161209 (= lt!522084 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25343))))

(assert (=> b!1161209 false))

(declare-fun b!1161210 () Bool)

(assert (=> b!1161210 (= e!660415 tp_is_empty!29071)))

(declare-fun bm!56103 () Bool)

(assert (=> bm!56103 (= call!56105 (getCurrentListMapNoExtraKeys!4800 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161211 () Bool)

(assert (=> b!1161211 (= e!660420 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!522088) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1161212 () Bool)

(assert (=> b!1161212 (= e!660421 (= call!56104 (-!1406 call!56105 k0!934)))))

(declare-fun b!1161213 () Bool)

(declare-fun res!770361 () Bool)

(assert (=> b!1161213 (=> (not res!770361) (not e!660419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1161213 (= res!770361 (validMask!0 mask!1564))))

(declare-fun b!1161214 () Bool)

(declare-fun res!770354 () Bool)

(assert (=> b!1161214 (=> (not res!770354) (not e!660423))))

(assert (=> b!1161214 (= res!770354 (arrayNoDuplicates!0 lt!522082 #b00000000000000000000000000000000 Nil!25343))))

(declare-fun b!1161215 () Bool)

(declare-fun res!770360 () Bool)

(assert (=> b!1161215 (=> (not res!770360) (not e!660419))))

(assert (=> b!1161215 (= res!770360 (= (select (arr!36160 _keys!1208) i!673) k0!934))))

(declare-fun b!1161216 () Bool)

(assert (=> b!1161216 call!56100))

(declare-fun lt!522080 () Unit!38221)

(assert (=> b!1161216 (= lt!522080 call!56101)))

(assert (=> b!1161216 (= e!660418 lt!522080)))

(declare-fun res!770347 () Bool)

(assert (=> start!99172 (=> (not res!770347) (not e!660419))))

(assert (=> start!99172 (= res!770347 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36697 _keys!1208))))))

(assert (=> start!99172 e!660419))

(assert (=> start!99172 tp_is_empty!29071))

(declare-fun array_inv!27736 (array!75031) Bool)

(assert (=> start!99172 (array_inv!27736 _keys!1208)))

(assert (=> start!99172 true))

(assert (=> start!99172 tp!86334))

(declare-fun array_inv!27737 (array!75033) Bool)

(assert (=> start!99172 (and (array_inv!27737 _values!996) e!660424)))

(declare-fun b!1161195 () Bool)

(assert (=> b!1161195 (= e!660425 e!660412)))

(declare-fun res!770358 () Bool)

(assert (=> b!1161195 (=> res!770358 e!660412)))

(assert (=> b!1161195 (= res!770358 (not (= from!1455 i!673)))))

(declare-fun lt!522073 () ListLongMap!16585)

(assert (=> b!1161195 (= lt!522073 (getCurrentListMapNoExtraKeys!4800 lt!522082 lt!522072 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1161195 (= lt!522072 (array!75034 (store (arr!36161 _values!996) i!673 (ValueCellFull!13826 lt!522083)) (size!36698 _values!996)))))

(declare-fun dynLambda!2803 (Int (_ BitVec 64)) V!43889)

(assert (=> b!1161195 (= lt!522083 (dynLambda!2803 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1161195 (= lt!522087 (getCurrentListMapNoExtraKeys!4800 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!99172 res!770347) b!1161213))

(assert (= (and b!1161213 res!770361) b!1161199))

(assert (= (and b!1161199 res!770357) b!1161193))

(assert (= (and b!1161193 res!770353) b!1161187))

(assert (= (and b!1161187 res!770351) b!1161202))

(assert (= (and b!1161202 res!770349) b!1161207))

(assert (= (and b!1161207 res!770355) b!1161215))

(assert (= (and b!1161215 res!770360) b!1161189))

(assert (= (and b!1161189 res!770359) b!1161214))

(assert (= (and b!1161214 res!770354) b!1161196))

(assert (= (and b!1161196 (not res!770352)) b!1161195))

(assert (= (and b!1161195 (not res!770358)) b!1161205))

(assert (= (and b!1161205 c!116125) b!1161212))

(assert (= (and b!1161205 (not c!116125)) b!1161201))

(assert (= (or b!1161212 b!1161201) bm!56102))

(assert (= (or b!1161212 b!1161201) bm!56103))

(assert (= (and b!1161205 (not res!770348)) b!1161197))

(assert (= (and b!1161197 c!116128) b!1161209))

(assert (= (and b!1161197 (not c!116128)) b!1161208))

(assert (= (and b!1161209 c!116126) b!1161203))

(assert (= (and b!1161209 (not c!116126)) b!1161188))

(assert (= (and b!1161188 c!116130) b!1161198))

(assert (= (and b!1161188 (not c!116130)) b!1161194))

(assert (= (and b!1161194 c!116129) b!1161216))

(assert (= (and b!1161194 (not c!116129)) b!1161191))

(assert (= (or b!1161198 b!1161216) bm!56100))

(assert (= (or b!1161198 b!1161216) bm!56096))

(assert (= (or b!1161198 b!1161216) bm!56101))

(assert (= (or b!1161203 bm!56101) bm!56098))

(assert (= (or b!1161203 bm!56100) bm!56099))

(assert (= (or b!1161203 bm!56096) bm!56097))

(assert (= (and b!1161209 c!116127) b!1161200))

(assert (= (and b!1161209 (not c!116127)) b!1161211))

(assert (= (and b!1161209 res!770356) b!1161204))

(assert (= (and b!1161197 res!770350) b!1161192))

(assert (= (and b!1161190 condMapEmpty!45431) mapIsEmpty!45431))

(assert (= (and b!1161190 (not condMapEmpty!45431)) mapNonEmpty!45431))

(get-info :version)

(assert (= (and mapNonEmpty!45431 ((_ is ValueCellFull!13826) mapValue!45431)) b!1161210))

(assert (= (and b!1161190 ((_ is ValueCellFull!13826) mapDefault!45431)) b!1161206))

(assert (= start!99172 b!1161190))

(declare-fun b_lambda!19641 () Bool)

(assert (=> (not b_lambda!19641) (not b!1161195)))

(declare-fun t!36870 () Bool)

(declare-fun tb!9345 () Bool)

(assert (=> (and start!99172 (= defaultEntry!1004 defaultEntry!1004) t!36870) tb!9345))

(declare-fun result!19263 () Bool)

(assert (=> tb!9345 (= result!19263 tp_is_empty!29071)))

(assert (=> b!1161195 t!36870))

(declare-fun b_and!39935 () Bool)

(assert (= b_and!39933 (and (=> t!36870 result!19263) b_and!39935)))

(declare-fun m!1070485 () Bool)

(assert (=> b!1161200 m!1070485))

(declare-fun m!1070487 () Bool)

(assert (=> b!1161215 m!1070487))

(declare-fun m!1070489 () Bool)

(assert (=> b!1161196 m!1070489))

(declare-fun m!1070491 () Bool)

(assert (=> b!1161196 m!1070491))

(declare-fun m!1070493 () Bool)

(assert (=> b!1161209 m!1070493))

(declare-fun m!1070495 () Bool)

(assert (=> b!1161209 m!1070495))

(declare-fun m!1070497 () Bool)

(assert (=> b!1161209 m!1070497))

(declare-fun m!1070499 () Bool)

(assert (=> b!1161209 m!1070499))

(declare-fun m!1070501 () Bool)

(assert (=> b!1161203 m!1070501))

(declare-fun m!1070503 () Bool)

(assert (=> b!1161203 m!1070503))

(declare-fun m!1070505 () Bool)

(assert (=> b!1161203 m!1070505))

(declare-fun m!1070507 () Bool)

(assert (=> b!1161187 m!1070507))

(declare-fun m!1070509 () Bool)

(assert (=> bm!56099 m!1070509))

(declare-fun m!1070511 () Bool)

(assert (=> b!1161207 m!1070511))

(declare-fun m!1070513 () Bool)

(assert (=> mapNonEmpty!45431 m!1070513))

(declare-fun m!1070515 () Bool)

(assert (=> b!1161195 m!1070515))

(declare-fun m!1070517 () Bool)

(assert (=> b!1161195 m!1070517))

(declare-fun m!1070519 () Bool)

(assert (=> b!1161195 m!1070519))

(declare-fun m!1070521 () Bool)

(assert (=> b!1161195 m!1070521))

(declare-fun m!1070523 () Bool)

(assert (=> start!99172 m!1070523))

(declare-fun m!1070525 () Bool)

(assert (=> start!99172 m!1070525))

(declare-fun m!1070527 () Bool)

(assert (=> bm!56103 m!1070527))

(declare-fun m!1070529 () Bool)

(assert (=> b!1161214 m!1070529))

(declare-fun m!1070531 () Bool)

(assert (=> b!1161212 m!1070531))

(declare-fun m!1070533 () Bool)

(assert (=> bm!56097 m!1070533))

(declare-fun m!1070535 () Bool)

(assert (=> b!1161213 m!1070535))

(declare-fun m!1070537 () Bool)

(assert (=> bm!56102 m!1070537))

(declare-fun m!1070539 () Bool)

(assert (=> b!1161205 m!1070539))

(declare-fun m!1070541 () Bool)

(assert (=> b!1161205 m!1070541))

(declare-fun m!1070543 () Bool)

(assert (=> bm!56098 m!1070543))

(declare-fun m!1070545 () Bool)

(assert (=> b!1161193 m!1070545))

(assert (=> b!1161197 m!1070527))

(declare-fun m!1070547 () Bool)

(assert (=> b!1161197 m!1070547))

(assert (=> b!1161197 m!1070539))

(declare-fun m!1070549 () Bool)

(assert (=> b!1161197 m!1070549))

(declare-fun m!1070551 () Bool)

(assert (=> b!1161197 m!1070551))

(declare-fun m!1070553 () Bool)

(assert (=> b!1161197 m!1070553))

(assert (=> b!1161197 m!1070547))

(declare-fun m!1070555 () Bool)

(assert (=> b!1161197 m!1070555))

(assert (=> b!1161197 m!1070539))

(declare-fun m!1070557 () Bool)

(assert (=> b!1161197 m!1070557))

(assert (=> b!1161197 m!1070553))

(assert (=> b!1161197 m!1070539))

(declare-fun m!1070559 () Bool)

(assert (=> b!1161197 m!1070559))

(assert (=> b!1161204 m!1070485))

(assert (=> b!1161192 m!1070537))

(declare-fun m!1070561 () Bool)

(assert (=> b!1161189 m!1070561))

(declare-fun m!1070563 () Bool)

(assert (=> b!1161189 m!1070563))

(check-sat (not b!1161192) (not b!1161203) (not b!1161197) (not b!1161204) (not b!1161209) (not bm!56103) tp_is_empty!29071 b_and!39935 (not mapNonEmpty!45431) (not b!1161212) (not start!99172) (not bm!56099) (not bm!56097) (not b_lambda!19641) (not b!1161195) (not b_next!24541) (not b!1161205) (not b!1161189) (not b!1161193) (not b!1161214) (not b!1161200) (not b!1161213) (not bm!56098) (not b!1161196) (not bm!56102) (not b!1161207) (not b!1161187))
(check-sat b_and!39935 (not b_next!24541))
