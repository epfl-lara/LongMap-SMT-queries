; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98684 () Bool)

(assert start!98684)

(declare-fun b_free!24289 () Bool)

(declare-fun b_next!24289 () Bool)

(assert (=> start!98684 (= b_free!24289 (not b_next!24289))))

(declare-fun tp!85577 () Bool)

(declare-fun b_and!39427 () Bool)

(assert (=> start!98684 (= tp!85577 b_and!39427)))

(declare-datatypes ((V!43553 0))(
  ( (V!43554 (val!14466 Int)) )
))
(declare-fun zeroValue!944 () V!43553)

(declare-datatypes ((array!74485 0))(
  ( (array!74486 (arr!35893 (Array (_ BitVec 32) (_ BitVec 64))) (size!36429 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74485)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18344 0))(
  ( (tuple2!18345 (_1!9183 (_ BitVec 64)) (_2!9183 V!43553)) )
))
(declare-datatypes ((List!25095 0))(
  ( (Nil!25092) (Cons!25091 (h!26300 tuple2!18344) (t!36376 List!25095)) )
))
(declare-datatypes ((ListLongMap!16313 0))(
  ( (ListLongMap!16314 (toList!8172 List!25095)) )
))
(declare-fun call!53016 () ListLongMap!16313)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!53007 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13700 0))(
  ( (ValueCellFull!13700 (v!17103 V!43553)) (EmptyCell!13700) )
))
(declare-datatypes ((array!74487 0))(
  ( (array!74488 (arr!35894 (Array (_ BitVec 32) ValueCell!13700)) (size!36430 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74487)

(declare-fun minValue!944 () V!43553)

(declare-fun getCurrentListMapNoExtraKeys!4645 (array!74485 array!74487 (_ BitVec 32) (_ BitVec 32) V!43553 V!43553 (_ BitVec 32) Int) ListLongMap!16313)

(assert (=> bm!53007 (= call!53016 (getCurrentListMapNoExtraKeys!4645 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148306 () Bool)

(declare-fun res!764174 () Bool)

(declare-fun e!653155 () Bool)

(assert (=> b!1148306 (=> (not res!764174) (not e!653155))))

(declare-fun lt!513315 () array!74485)

(declare-datatypes ((List!25096 0))(
  ( (Nil!25093) (Cons!25092 (h!26301 (_ BitVec 64)) (t!36377 List!25096)) )
))
(declare-fun arrayNoDuplicates!0 (array!74485 (_ BitVec 32) List!25096) Bool)

(assert (=> b!1148306 (= res!764174 (arrayNoDuplicates!0 lt!513315 #b00000000000000000000000000000000 Nil!25093))))

(declare-fun e!653166 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!53010 () ListLongMap!16313)

(declare-fun b!1148307 () Bool)

(declare-fun -!1307 (ListLongMap!16313 (_ BitVec 64)) ListLongMap!16313)

(assert (=> b!1148307 (= e!653166 (= call!53010 (-!1307 call!53016 k!934)))))

(declare-fun bm!53008 () Bool)

(declare-fun c!113464 () Bool)

(declare-fun c!113459 () Bool)

(declare-fun call!53017 () ListLongMap!16313)

(declare-fun lt!513305 () ListLongMap!16313)

(declare-fun +!3594 (ListLongMap!16313 tuple2!18344) ListLongMap!16313)

(assert (=> bm!53008 (= call!53017 (+!3594 lt!513305 (ite (or c!113459 c!113464) (tuple2!18345 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18345 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1148308 () Bool)

(declare-datatypes ((Unit!37731 0))(
  ( (Unit!37732) )
))
(declare-fun e!653154 () Unit!37731)

(declare-fun lt!513312 () Unit!37731)

(assert (=> b!1148308 (= e!653154 lt!513312)))

(declare-fun call!53015 () Unit!37731)

(assert (=> b!1148308 (= lt!513312 call!53015)))

(declare-fun call!53011 () Bool)

(assert (=> b!1148308 call!53011))

(declare-fun b!1148309 () Bool)

(declare-fun e!653160 () Unit!37731)

(declare-fun Unit!37733 () Unit!37731)

(assert (=> b!1148309 (= e!653160 Unit!37733)))

(declare-fun lt!513308 () Bool)

(assert (=> b!1148309 (= lt!513308 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1148309 (= c!113459 (and (not lt!513308) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513300 () Unit!37731)

(declare-fun e!653159 () Unit!37731)

(assert (=> b!1148309 (= lt!513300 e!653159)))

(declare-fun lt!513307 () Unit!37731)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!440 (array!74485 array!74487 (_ BitVec 32) (_ BitVec 32) V!43553 V!43553 (_ BitVec 64) (_ BitVec 32) Int) Unit!37731)

(assert (=> b!1148309 (= lt!513307 (lemmaListMapContainsThenArrayContainsFrom!440 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113460 () Bool)

(assert (=> b!1148309 (= c!113460 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764173 () Bool)

(declare-fun e!653167 () Bool)

(assert (=> b!1148309 (= res!764173 e!653167)))

(declare-fun e!653161 () Bool)

(assert (=> b!1148309 (=> (not res!764173) (not e!653161))))

(assert (=> b!1148309 e!653161))

(declare-fun lt!513313 () Unit!37731)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74485 (_ BitVec 32) (_ BitVec 32)) Unit!37731)

(assert (=> b!1148309 (= lt!513313 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1148309 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25093)))

(declare-fun lt!513295 () Unit!37731)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74485 (_ BitVec 64) (_ BitVec 32) List!25096) Unit!37731)

(assert (=> b!1148309 (= lt!513295 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25093))))

(assert (=> b!1148309 false))

(declare-fun b!1148310 () Bool)

(assert (=> b!1148310 call!53011))

(declare-fun lt!513301 () Unit!37731)

(assert (=> b!1148310 (= lt!513301 call!53015)))

(declare-fun e!653156 () Unit!37731)

(assert (=> b!1148310 (= e!653156 lt!513301)))

(declare-fun b!1148311 () Bool)

(declare-fun res!764176 () Bool)

(declare-fun e!653162 () Bool)

(assert (=> b!1148311 (=> (not res!764176) (not e!653162))))

(assert (=> b!1148311 (= res!764176 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25093))))

(declare-fun b!1148313 () Bool)

(declare-fun e!653168 () Bool)

(assert (=> b!1148313 (= e!653168 true)))

(declare-fun e!653153 () Bool)

(assert (=> b!1148313 e!653153))

(declare-fun res!764182 () Bool)

(assert (=> b!1148313 (=> (not res!764182) (not e!653153))))

(declare-fun lt!513306 () V!43553)

(assert (=> b!1148313 (= res!764182 (= (-!1307 (+!3594 lt!513305 (tuple2!18345 (select (arr!35893 _keys!1208) from!1455) lt!513306)) (select (arr!35893 _keys!1208) from!1455)) lt!513305))))

(declare-fun lt!513298 () Unit!37731)

(declare-fun addThenRemoveForNewKeyIsSame!152 (ListLongMap!16313 (_ BitVec 64) V!43553) Unit!37731)

(assert (=> b!1148313 (= lt!513298 (addThenRemoveForNewKeyIsSame!152 lt!513305 (select (arr!35893 _keys!1208) from!1455) lt!513306))))

(declare-fun lt!513299 () V!43553)

(declare-fun get!18262 (ValueCell!13700 V!43553) V!43553)

(assert (=> b!1148313 (= lt!513306 (get!18262 (select (arr!35894 _values!996) from!1455) lt!513299))))

(declare-fun lt!513311 () Unit!37731)

(assert (=> b!1148313 (= lt!513311 e!653160)))

(declare-fun c!113461 () Bool)

(declare-fun contains!6695 (ListLongMap!16313 (_ BitVec 64)) Bool)

(assert (=> b!1148313 (= c!113461 (contains!6695 lt!513305 k!934))))

(assert (=> b!1148313 (= lt!513305 (getCurrentListMapNoExtraKeys!4645 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148314 () Bool)

(assert (=> b!1148314 (= e!653162 e!653155)))

(declare-fun res!764170 () Bool)

(assert (=> b!1148314 (=> (not res!764170) (not e!653155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74485 (_ BitVec 32)) Bool)

(assert (=> b!1148314 (= res!764170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513315 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1148314 (= lt!513315 (array!74486 (store (arr!35893 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36429 _keys!1208)))))

(declare-fun mapIsEmpty!45053 () Bool)

(declare-fun mapRes!45053 () Bool)

(assert (=> mapIsEmpty!45053 mapRes!45053))

(declare-fun b!1148315 () Bool)

(declare-fun lt!513304 () ListLongMap!16313)

(assert (=> b!1148315 (= e!653153 (= (-!1307 lt!513304 k!934) lt!513305))))

(declare-fun b!1148316 () Bool)

(declare-fun Unit!37734 () Unit!37731)

(assert (=> b!1148316 (= e!653160 Unit!37734)))

(declare-fun b!1148317 () Bool)

(declare-fun e!653157 () Bool)

(assert (=> b!1148317 (= e!653155 (not e!653157))))

(declare-fun res!764181 () Bool)

(assert (=> b!1148317 (=> res!764181 e!653157)))

(assert (=> b!1148317 (= res!764181 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1148317 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!513302 () Unit!37731)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74485 (_ BitVec 64) (_ BitVec 32)) Unit!37731)

(assert (=> b!1148317 (= lt!513302 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1148318 () Bool)

(declare-fun Unit!37735 () Unit!37731)

(assert (=> b!1148318 (= e!653156 Unit!37735)))

(declare-fun b!1148319 () Bool)

(declare-fun res!764183 () Bool)

(assert (=> b!1148319 (=> (not res!764183) (not e!653162))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1148319 (= res!764183 (validKeyInArray!0 k!934))))

(declare-fun b!1148320 () Bool)

(declare-fun e!653165 () Bool)

(assert (=> b!1148320 (= e!653165 e!653168)))

(declare-fun res!764178 () Bool)

(assert (=> b!1148320 (=> res!764178 e!653168)))

(assert (=> b!1148320 (= res!764178 (not (= (select (arr!35893 _keys!1208) from!1455) k!934)))))

(assert (=> b!1148320 e!653166))

(declare-fun c!113463 () Bool)

(assert (=> b!1148320 (= c!113463 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!513303 () Unit!37731)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!545 (array!74485 array!74487 (_ BitVec 32) (_ BitVec 32) V!43553 V!43553 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37731)

(assert (=> b!1148320 (= lt!513303 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!545 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148321 () Bool)

(assert (=> b!1148321 (= e!653161 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!45053 () Bool)

(declare-fun tp!85578 () Bool)

(declare-fun e!653169 () Bool)

(assert (=> mapNonEmpty!45053 (= mapRes!45053 (and tp!85578 e!653169))))

(declare-fun mapKey!45053 () (_ BitVec 32))

(declare-fun mapRest!45053 () (Array (_ BitVec 32) ValueCell!13700))

(declare-fun mapValue!45053 () ValueCell!13700)

(assert (=> mapNonEmpty!45053 (= (arr!35894 _values!996) (store mapRest!45053 mapKey!45053 mapValue!45053))))

(declare-fun b!1148322 () Bool)

(declare-fun res!764172 () Bool)

(assert (=> b!1148322 (=> (not res!764172) (not e!653162))))

(assert (=> b!1148322 (= res!764172 (and (= (size!36430 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36429 _keys!1208) (size!36430 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1148323 () Bool)

(declare-fun e!653163 () Bool)

(declare-fun e!653164 () Bool)

(assert (=> b!1148323 (= e!653163 (and e!653164 mapRes!45053))))

(declare-fun condMapEmpty!45053 () Bool)

(declare-fun mapDefault!45053 () ValueCell!13700)

