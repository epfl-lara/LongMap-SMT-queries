; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98964 () Bool)

(assert start!98964)

(declare-fun b_free!24569 () Bool)

(declare-fun b_next!24569 () Bool)

(assert (=> start!98964 (= b_free!24569 (not b_next!24569))))

(declare-fun tp!86418 () Bool)

(declare-fun b_and!39987 () Bool)

(assert (=> start!98964 (= tp!86418 b_and!39987)))

(declare-fun b!1161186 () Bool)

(declare-datatypes ((Unit!38295 0))(
  ( (Unit!38296) )
))
(declare-fun e!660295 () Unit!38295)

(declare-fun e!660302 () Unit!38295)

(assert (=> b!1161186 (= e!660295 e!660302)))

(declare-fun c!115979 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!522521 () Bool)

(assert (=> b!1161186 (= c!115979 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!522521))))

(declare-datatypes ((array!75039 0))(
  ( (array!75040 (arr!36170 (Array (_ BitVec 32) (_ BitVec 64))) (size!36706 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75039)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!56367 () Bool)

(declare-fun c!115982 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!43925 0))(
  ( (V!43926 (val!14606 Int)) )
))
(declare-datatypes ((ValueCell!13840 0))(
  ( (ValueCellFull!13840 (v!17243 V!43925)) (EmptyCell!13840) )
))
(declare-datatypes ((array!75041 0))(
  ( (array!75042 (arr!36171 (Array (_ BitVec 32) ValueCell!13840)) (size!36707 (_ BitVec 32))) )
))
(declare-fun lt!522518 () array!75041)

(declare-fun _values!996 () array!75041)

(declare-datatypes ((tuple2!18610 0))(
  ( (tuple2!18611 (_1!9316 (_ BitVec 64)) (_2!9316 V!43925)) )
))
(declare-datatypes ((List!25346 0))(
  ( (Nil!25343) (Cons!25342 (h!26551 tuple2!18610) (t!36907 List!25346)) )
))
(declare-datatypes ((ListLongMap!16579 0))(
  ( (ListLongMap!16580 (toList!8305 List!25346)) )
))
(declare-fun call!56376 () ListLongMap!16579)

(declare-fun minValue!944 () V!43925)

(declare-fun lt!522530 () array!75039)

(declare-fun zeroValue!944 () V!43925)

(declare-fun getCurrentListMapNoExtraKeys!4769 (array!75039 array!75041 (_ BitVec 32) (_ BitVec 32) V!43925 V!43925 (_ BitVec 32) Int) ListLongMap!16579)

(assert (=> bm!56367 (= call!56376 (getCurrentListMapNoExtraKeys!4769 (ite c!115982 lt!522530 _keys!1208) (ite c!115982 lt!522518 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56368 () Bool)

(declare-fun call!56372 () ListLongMap!16579)

(declare-fun call!56371 () ListLongMap!16579)

(assert (=> bm!56368 (= call!56372 call!56371)))

(declare-fun b!1161187 () Bool)

(declare-fun e!660308 () Bool)

(declare-fun e!660293 () Bool)

(assert (=> b!1161187 (= e!660308 e!660293)))

(declare-fun res!770472 () Bool)

(assert (=> b!1161187 (=> res!770472 e!660293)))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1161187 (= res!770472 (not (= (select (arr!36170 _keys!1208) from!1455) k!934)))))

(declare-fun e!660301 () Bool)

(assert (=> b!1161187 e!660301))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1161187 (= c!115982 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!522514 () Unit!38295)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!642 (array!75039 array!75041 (_ BitVec 32) (_ BitVec 32) V!43925 V!43925 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38295)

(assert (=> b!1161187 (= lt!522514 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!642 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161188 () Bool)

(declare-fun res!770475 () Bool)

(declare-fun e!660298 () Bool)

(assert (=> b!1161188 (=> (not res!770475) (not e!660298))))

(declare-datatypes ((List!25347 0))(
  ( (Nil!25344) (Cons!25343 (h!26552 (_ BitVec 64)) (t!36908 List!25347)) )
))
(declare-fun arrayNoDuplicates!0 (array!75039 (_ BitVec 32) List!25347) Bool)

(assert (=> b!1161188 (= res!770475 (arrayNoDuplicates!0 lt!522530 #b00000000000000000000000000000000 Nil!25344))))

(declare-fun b!1161189 () Bool)

(declare-fun e!660304 () Unit!38295)

(declare-fun Unit!38297 () Unit!38295)

(assert (=> b!1161189 (= e!660304 Unit!38297)))

(assert (=> b!1161189 (= lt!522521 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115981 () Bool)

(assert (=> b!1161189 (= c!115981 (and (not lt!522521) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522512 () Unit!38295)

(declare-fun e!660305 () Unit!38295)

(assert (=> b!1161189 (= lt!522512 e!660305)))

(declare-fun lt!522516 () Unit!38295)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!537 (array!75039 array!75041 (_ BitVec 32) (_ BitVec 32) V!43925 V!43925 (_ BitVec 64) (_ BitVec 32) Int) Unit!38295)

(assert (=> b!1161189 (= lt!522516 (lemmaListMapContainsThenArrayContainsFrom!537 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115984 () Bool)

(assert (=> b!1161189 (= c!115984 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770477 () Bool)

(declare-fun e!660296 () Bool)

(assert (=> b!1161189 (= res!770477 e!660296)))

(declare-fun e!660309 () Bool)

(assert (=> b!1161189 (=> (not res!770477) (not e!660309))))

(assert (=> b!1161189 e!660309))

(declare-fun lt!522531 () Unit!38295)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75039 (_ BitVec 32) (_ BitVec 32)) Unit!38295)

(assert (=> b!1161189 (= lt!522531 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1161189 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25344)))

(declare-fun lt!522515 () Unit!38295)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75039 (_ BitVec 64) (_ BitVec 32) List!25347) Unit!38295)

(assert (=> b!1161189 (= lt!522515 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25344))))

(assert (=> b!1161189 false))

(declare-fun b!1161190 () Bool)

(declare-fun res!770474 () Bool)

(declare-fun e!660294 () Bool)

(assert (=> b!1161190 (=> (not res!770474) (not e!660294))))

(assert (=> b!1161190 (= res!770474 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36706 _keys!1208))))))

(declare-fun b!1161191 () Bool)

(declare-fun arrayContainsKey!0 (array!75039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1161191 (= e!660296 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!56369 () Bool)

(declare-fun call!56377 () Bool)

(declare-fun call!56375 () Bool)

(assert (=> bm!56369 (= call!56377 call!56375)))

(declare-fun b!1161192 () Bool)

(declare-fun e!660300 () Bool)

(declare-fun e!660306 () Bool)

(declare-fun mapRes!45473 () Bool)

(assert (=> b!1161192 (= e!660300 (and e!660306 mapRes!45473))))

(declare-fun condMapEmpty!45473 () Bool)

(declare-fun mapDefault!45473 () ValueCell!13840)

