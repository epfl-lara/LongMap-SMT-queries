; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98530 () Bool)

(assert start!98530)

(declare-fun b_free!24135 () Bool)

(declare-fun b_next!24135 () Bool)

(assert (=> start!98530 (= b_free!24135 (not b_next!24135))))

(declare-fun tp!85115 () Bool)

(declare-fun b_and!39119 () Bool)

(assert (=> start!98530 (= tp!85115 b_and!39119)))

(declare-fun b!1141316 () Bool)

(declare-datatypes ((Unit!37435 0))(
  ( (Unit!37436) )
))
(declare-fun e!649324 () Unit!37435)

(declare-fun Unit!37437 () Unit!37435)

(assert (=> b!1141316 (= e!649324 Unit!37437)))

(declare-fun lt!508454 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1141316 (= lt!508454 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112076 () Bool)

(assert (=> b!1141316 (= c!112076 (and (not lt!508454) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!508453 () Unit!37435)

(declare-fun e!649320 () Unit!37435)

(assert (=> b!1141316 (= lt!508453 e!649320)))

(declare-datatypes ((V!43347 0))(
  ( (V!43348 (val!14389 Int)) )
))
(declare-fun zeroValue!944 () V!43347)

(declare-datatypes ((array!74187 0))(
  ( (array!74188 (arr!35744 (Array (_ BitVec 32) (_ BitVec 64))) (size!36280 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74187)

(declare-fun lt!508459 () Unit!37435)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13623 0))(
  ( (ValueCellFull!13623 (v!17026 V!43347)) (EmptyCell!13623) )
))
(declare-datatypes ((array!74189 0))(
  ( (array!74190 (arr!35745 (Array (_ BitVec 32) ValueCell!13623)) (size!36281 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74189)

(declare-fun minValue!944 () V!43347)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!387 (array!74187 array!74189 (_ BitVec 32) (_ BitVec 32) V!43347 V!43347 (_ BitVec 64) (_ BitVec 32) Int) Unit!37435)

(assert (=> b!1141316 (= lt!508459 (lemmaListMapContainsThenArrayContainsFrom!387 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112077 () Bool)

(assert (=> b!1141316 (= c!112077 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760810 () Bool)

(declare-fun e!649335 () Bool)

(assert (=> b!1141316 (= res!760810 e!649335)))

(declare-fun e!649334 () Bool)

(assert (=> b!1141316 (=> (not res!760810) (not e!649334))))

(assert (=> b!1141316 e!649334))

(declare-fun lt!508451 () Unit!37435)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74187 (_ BitVec 32) (_ BitVec 32)) Unit!37435)

(assert (=> b!1141316 (= lt!508451 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24957 0))(
  ( (Nil!24954) (Cons!24953 (h!26162 (_ BitVec 64)) (t!36084 List!24957)) )
))
(declare-fun arrayNoDuplicates!0 (array!74187 (_ BitVec 32) List!24957) Bool)

(assert (=> b!1141316 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24954)))

(declare-fun lt!508462 () Unit!37435)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74187 (_ BitVec 64) (_ BitVec 32) List!24957) Unit!37435)

(assert (=> b!1141316 (= lt!508462 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24954))))

(assert (=> b!1141316 false))

(declare-fun b!1141317 () Bool)

(declare-fun e!649323 () Bool)

(declare-fun e!649328 () Bool)

(declare-fun mapRes!44822 () Bool)

(assert (=> b!1141317 (= e!649323 (and e!649328 mapRes!44822))))

(declare-fun condMapEmpty!44822 () Bool)

(declare-fun mapDefault!44822 () ValueCell!13623)

(assert (=> b!1141317 (= condMapEmpty!44822 (= (arr!35745 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13623)) mapDefault!44822)))))

(declare-fun b!1141318 () Bool)

(declare-fun call!51162 () Bool)

(assert (=> b!1141318 call!51162))

(declare-fun lt!508450 () Unit!37435)

(declare-fun call!51163 () Unit!37435)

(assert (=> b!1141318 (= lt!508450 call!51163)))

(declare-fun e!649333 () Unit!37435)

(assert (=> b!1141318 (= e!649333 lt!508450)))

(declare-fun b!1141319 () Bool)

(declare-fun Unit!37438 () Unit!37435)

(assert (=> b!1141319 (= e!649333 Unit!37438)))

(declare-fun b!1141320 () Bool)

(assert (=> b!1141320 (= e!649335 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508454) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1141321 () Bool)

(declare-fun res!760811 () Bool)

(declare-fun e!649322 () Bool)

(assert (=> b!1141321 (=> (not res!760811) (not e!649322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1141321 (= res!760811 (validKeyInArray!0 k0!934))))

(declare-fun b!1141322 () Bool)

(declare-fun e!649331 () Bool)

(declare-fun e!649329 () Bool)

(assert (=> b!1141322 (= e!649331 (not e!649329))))

(declare-fun res!760805 () Bool)

(assert (=> b!1141322 (=> res!760805 e!649329)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1141322 (= res!760805 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1141322 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!508464 () Unit!37435)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74187 (_ BitVec 64) (_ BitVec 32)) Unit!37435)

(assert (=> b!1141322 (= lt!508464 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1141323 () Bool)

(declare-fun res!760801 () Bool)

(assert (=> b!1141323 (=> (not res!760801) (not e!649322))))

(assert (=> b!1141323 (= res!760801 (= (select (arr!35744 _keys!1208) i!673) k0!934))))

(declare-fun b!1141324 () Bool)

(declare-fun res!760798 () Bool)

(assert (=> b!1141324 (=> (not res!760798) (not e!649322))))

(assert (=> b!1141324 (= res!760798 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36280 _keys!1208))))))

(declare-datatypes ((tuple2!18202 0))(
  ( (tuple2!18203 (_1!9112 (_ BitVec 64)) (_2!9112 V!43347)) )
))
(declare-datatypes ((List!24958 0))(
  ( (Nil!24955) (Cons!24954 (h!26163 tuple2!18202) (t!36085 List!24958)) )
))
(declare-datatypes ((ListLongMap!16171 0))(
  ( (ListLongMap!16172 (toList!8101 List!24958)) )
))
(declare-fun call!51165 () ListLongMap!16171)

(declare-fun bm!51159 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4583 (array!74187 array!74189 (_ BitVec 32) (_ BitVec 32) V!43347 V!43347 (_ BitVec 32) Int) ListLongMap!16171)

(assert (=> bm!51159 (= call!51165 (getCurrentListMapNoExtraKeys!4583 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141325 () Bool)

(declare-fun e!649327 () Bool)

(declare-fun tp_is_empty!28665 () Bool)

(assert (=> b!1141325 (= e!649327 tp_is_empty!28665)))

(declare-fun bm!51160 () Bool)

(declare-fun call!51166 () Bool)

(assert (=> bm!51160 (= call!51162 call!51166)))

(declare-fun b!1141326 () Bool)

(declare-fun e!649326 () Bool)

(assert (=> b!1141326 (= e!649326 true)))

(declare-fun lt!508447 () ListLongMap!16171)

(declare-fun lt!508458 () V!43347)

(declare-fun -!1251 (ListLongMap!16171 (_ BitVec 64)) ListLongMap!16171)

(declare-fun +!3532 (ListLongMap!16171 tuple2!18202) ListLongMap!16171)

(assert (=> b!1141326 (= (-!1251 (+!3532 lt!508447 (tuple2!18203 (select (arr!35744 _keys!1208) from!1455) lt!508458)) (select (arr!35744 _keys!1208) from!1455)) lt!508447)))

(declare-fun lt!508457 () Unit!37435)

(declare-fun addThenRemoveForNewKeyIsSame!104 (ListLongMap!16171 (_ BitVec 64) V!43347) Unit!37435)

(assert (=> b!1141326 (= lt!508457 (addThenRemoveForNewKeyIsSame!104 lt!508447 (select (arr!35744 _keys!1208) from!1455) lt!508458))))

(declare-fun lt!508445 () V!43347)

(declare-fun get!18162 (ValueCell!13623 V!43347) V!43347)

(assert (=> b!1141326 (= lt!508458 (get!18162 (select (arr!35745 _values!996) from!1455) lt!508445))))

(declare-fun lt!508461 () Unit!37435)

(assert (=> b!1141326 (= lt!508461 e!649324)))

(declare-fun c!112074 () Bool)

(declare-fun contains!6636 (ListLongMap!16171 (_ BitVec 64)) Bool)

(assert (=> b!1141326 (= c!112074 (contains!6636 lt!508447 k0!934))))

(assert (=> b!1141326 (= lt!508447 (getCurrentListMapNoExtraKeys!4583 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51161 () Bool)

(declare-fun lt!508452 () ListLongMap!16171)

(declare-fun call!51167 () ListLongMap!16171)

(assert (=> bm!51161 (= call!51166 (contains!6636 (ite c!112076 lt!508452 call!51167) k0!934))))

(declare-fun b!1141327 () Bool)

(declare-fun c!112078 () Bool)

(assert (=> b!1141327 (= c!112078 (and (not lt!508454) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!649332 () Unit!37435)

(assert (=> b!1141327 (= e!649320 e!649332)))

(declare-fun call!51169 () Unit!37435)

(declare-fun bm!51162 () Bool)

(declare-fun addStillContains!789 (ListLongMap!16171 (_ BitVec 64) V!43347 (_ BitVec 64)) Unit!37435)

(assert (=> bm!51162 (= call!51169 (addStillContains!789 lt!508447 (ite (or c!112076 c!112078) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112076 c!112078) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1141328 () Bool)

(declare-fun e!649325 () Bool)

(assert (=> b!1141328 (= e!649325 e!649326)))

(declare-fun res!760802 () Bool)

(assert (=> b!1141328 (=> res!760802 e!649326)))

(assert (=> b!1141328 (= res!760802 (not (= (select (arr!35744 _keys!1208) from!1455) k0!934)))))

(declare-fun e!649330 () Bool)

(assert (=> b!1141328 e!649330))

(declare-fun c!112075 () Bool)

(assert (=> b!1141328 (= c!112075 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!508463 () Unit!37435)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!496 (array!74187 array!74189 (_ BitVec 32) (_ BitVec 32) V!43347 V!43347 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37435)

(assert (=> b!1141328 (= lt!508463 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!496 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141329 () Bool)

(declare-fun Unit!37439 () Unit!37435)

(assert (=> b!1141329 (= e!649324 Unit!37439)))

(declare-fun b!1141330 () Bool)

(declare-fun call!51164 () ListLongMap!16171)

(assert (=> b!1141330 (= e!649330 (= call!51164 call!51165))))

(declare-fun b!1141331 () Bool)

(declare-fun res!760803 () Bool)

(assert (=> b!1141331 (=> (not res!760803) (not e!649331))))

(declare-fun lt!508444 () array!74187)

(assert (=> b!1141331 (= res!760803 (arrayNoDuplicates!0 lt!508444 #b00000000000000000000000000000000 Nil!24954))))

(declare-fun call!51168 () ListLongMap!16171)

(declare-fun bm!51163 () Bool)

(assert (=> bm!51163 (= call!51168 (+!3532 lt!508447 (ite (or c!112076 c!112078) (tuple2!18203 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun res!760808 () Bool)

(assert (=> start!98530 (=> (not res!760808) (not e!649322))))

(assert (=> start!98530 (= res!760808 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36280 _keys!1208))))))

(assert (=> start!98530 e!649322))

(assert (=> start!98530 tp_is_empty!28665))

(declare-fun array_inv!27398 (array!74187) Bool)

(assert (=> start!98530 (array_inv!27398 _keys!1208)))

(assert (=> start!98530 true))

(assert (=> start!98530 tp!85115))

(declare-fun array_inv!27399 (array!74189) Bool)

(assert (=> start!98530 (and (array_inv!27399 _values!996) e!649323)))

(declare-fun b!1141332 () Bool)

(declare-fun lt!508448 () Unit!37435)

(assert (=> b!1141332 (= e!649332 lt!508448)))

(assert (=> b!1141332 (= lt!508448 call!51163)))

(assert (=> b!1141332 call!51162))

(declare-fun b!1141333 () Bool)

(assert (=> b!1141333 (= e!649329 e!649325)))

(declare-fun res!760809 () Bool)

(assert (=> b!1141333 (=> res!760809 e!649325)))

(assert (=> b!1141333 (= res!760809 (not (= from!1455 i!673)))))

(declare-fun lt!508449 () array!74189)

(declare-fun lt!508460 () ListLongMap!16171)

(assert (=> b!1141333 (= lt!508460 (getCurrentListMapNoExtraKeys!4583 lt!508444 lt!508449 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1141333 (= lt!508449 (array!74190 (store (arr!35745 _values!996) i!673 (ValueCellFull!13623 lt!508445)) (size!36281 _values!996)))))

(declare-fun dynLambda!2627 (Int (_ BitVec 64)) V!43347)

(assert (=> b!1141333 (= lt!508445 (dynLambda!2627 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!508455 () ListLongMap!16171)

(assert (=> b!1141333 (= lt!508455 (getCurrentListMapNoExtraKeys!4583 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1141334 () Bool)

(assert (=> b!1141334 (= e!649332 e!649333)))

(declare-fun c!112073 () Bool)

(assert (=> b!1141334 (= c!112073 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508454))))

(declare-fun b!1141335 () Bool)

(assert (=> b!1141335 (= e!649334 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1141336 () Bool)

(declare-fun res!760806 () Bool)

(assert (=> b!1141336 (=> (not res!760806) (not e!649322))))

(assert (=> b!1141336 (= res!760806 (and (= (size!36281 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36280 _keys!1208) (size!36281 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1141337 () Bool)

(assert (=> b!1141337 (= e!649322 e!649331)))

(declare-fun res!760799 () Bool)

(assert (=> b!1141337 (=> (not res!760799) (not e!649331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74187 (_ BitVec 32)) Bool)

(assert (=> b!1141337 (= res!760799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508444 mask!1564))))

(assert (=> b!1141337 (= lt!508444 (array!74188 (store (arr!35744 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36280 _keys!1208)))))

(declare-fun b!1141338 () Bool)

(declare-fun res!760800 () Bool)

(assert (=> b!1141338 (=> (not res!760800) (not e!649322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1141338 (= res!760800 (validMask!0 mask!1564))))

(declare-fun b!1141339 () Bool)

(assert (=> b!1141339 (= e!649335 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1141340 () Bool)

(assert (=> b!1141340 (contains!6636 (+!3532 lt!508452 (tuple2!18203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!508456 () Unit!37435)

(assert (=> b!1141340 (= lt!508456 (addStillContains!789 lt!508452 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1141340 call!51166))

(assert (=> b!1141340 (= lt!508452 call!51168)))

(declare-fun lt!508446 () Unit!37435)

(assert (=> b!1141340 (= lt!508446 call!51169)))

(assert (=> b!1141340 (= e!649320 lt!508456)))

(declare-fun b!1141341 () Bool)

(assert (=> b!1141341 (= e!649328 tp_is_empty!28665)))

(declare-fun bm!51164 () Bool)

(assert (=> bm!51164 (= call!51163 call!51169)))

(declare-fun bm!51165 () Bool)

(assert (=> bm!51165 (= call!51164 (getCurrentListMapNoExtraKeys!4583 lt!508444 lt!508449 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44822 () Bool)

(declare-fun tp!85116 () Bool)

(assert (=> mapNonEmpty!44822 (= mapRes!44822 (and tp!85116 e!649327))))

(declare-fun mapKey!44822 () (_ BitVec 32))

(declare-fun mapValue!44822 () ValueCell!13623)

(declare-fun mapRest!44822 () (Array (_ BitVec 32) ValueCell!13623))

(assert (=> mapNonEmpty!44822 (= (arr!35745 _values!996) (store mapRest!44822 mapKey!44822 mapValue!44822))))

(declare-fun b!1141342 () Bool)

(assert (=> b!1141342 (= e!649330 (= call!51164 (-!1251 call!51165 k0!934)))))

(declare-fun mapIsEmpty!44822 () Bool)

(assert (=> mapIsEmpty!44822 mapRes!44822))

(declare-fun b!1141343 () Bool)

(declare-fun res!760804 () Bool)

(assert (=> b!1141343 (=> (not res!760804) (not e!649322))))

(assert (=> b!1141343 (= res!760804 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24954))))

(declare-fun b!1141344 () Bool)

(declare-fun res!760807 () Bool)

(assert (=> b!1141344 (=> (not res!760807) (not e!649322))))

(assert (=> b!1141344 (= res!760807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!51166 () Bool)

(assert (=> bm!51166 (= call!51167 call!51168)))

(assert (= (and start!98530 res!760808) b!1141338))

(assert (= (and b!1141338 res!760800) b!1141336))

(assert (= (and b!1141336 res!760806) b!1141344))

(assert (= (and b!1141344 res!760807) b!1141343))

(assert (= (and b!1141343 res!760804) b!1141324))

(assert (= (and b!1141324 res!760798) b!1141321))

(assert (= (and b!1141321 res!760811) b!1141323))

(assert (= (and b!1141323 res!760801) b!1141337))

(assert (= (and b!1141337 res!760799) b!1141331))

(assert (= (and b!1141331 res!760803) b!1141322))

(assert (= (and b!1141322 (not res!760805)) b!1141333))

(assert (= (and b!1141333 (not res!760809)) b!1141328))

(assert (= (and b!1141328 c!112075) b!1141342))

(assert (= (and b!1141328 (not c!112075)) b!1141330))

(assert (= (or b!1141342 b!1141330) bm!51165))

(assert (= (or b!1141342 b!1141330) bm!51159))

(assert (= (and b!1141328 (not res!760802)) b!1141326))

(assert (= (and b!1141326 c!112074) b!1141316))

(assert (= (and b!1141326 (not c!112074)) b!1141329))

(assert (= (and b!1141316 c!112076) b!1141340))

(assert (= (and b!1141316 (not c!112076)) b!1141327))

(assert (= (and b!1141327 c!112078) b!1141332))

(assert (= (and b!1141327 (not c!112078)) b!1141334))

(assert (= (and b!1141334 c!112073) b!1141318))

(assert (= (and b!1141334 (not c!112073)) b!1141319))

(assert (= (or b!1141332 b!1141318) bm!51164))

(assert (= (or b!1141332 b!1141318) bm!51166))

(assert (= (or b!1141332 b!1141318) bm!51160))

(assert (= (or b!1141340 bm!51160) bm!51161))

(assert (= (or b!1141340 bm!51164) bm!51162))

(assert (= (or b!1141340 bm!51166) bm!51163))

(assert (= (and b!1141316 c!112077) b!1141339))

(assert (= (and b!1141316 (not c!112077)) b!1141320))

(assert (= (and b!1141316 res!760810) b!1141335))

(assert (= (and b!1141317 condMapEmpty!44822) mapIsEmpty!44822))

(assert (= (and b!1141317 (not condMapEmpty!44822)) mapNonEmpty!44822))

(get-info :version)

(assert (= (and mapNonEmpty!44822 ((_ is ValueCellFull!13623) mapValue!44822)) b!1141325))

(assert (= (and b!1141317 ((_ is ValueCellFull!13623) mapDefault!44822)) b!1141341))

(assert (= start!98530 b!1141317))

(declare-fun b_lambda!19241 () Bool)

(assert (=> (not b_lambda!19241) (not b!1141333)))

(declare-fun t!36083 () Bool)

(declare-fun tb!8947 () Bool)

(assert (=> (and start!98530 (= defaultEntry!1004 defaultEntry!1004) t!36083) tb!8947))

(declare-fun result!18459 () Bool)

(assert (=> tb!8947 (= result!18459 tp_is_empty!28665)))

(assert (=> b!1141333 t!36083))

(declare-fun b_and!39121 () Bool)

(assert (= b_and!39119 (and (=> t!36083 result!18459) b_and!39121)))

(declare-fun m!1052719 () Bool)

(assert (=> bm!51161 m!1052719))

(declare-fun m!1052721 () Bool)

(assert (=> b!1141323 m!1052721))

(declare-fun m!1052723 () Bool)

(assert (=> b!1141322 m!1052723))

(declare-fun m!1052725 () Bool)

(assert (=> b!1141322 m!1052725))

(declare-fun m!1052727 () Bool)

(assert (=> bm!51165 m!1052727))

(declare-fun m!1052729 () Bool)

(assert (=> bm!51159 m!1052729))

(declare-fun m!1052731 () Bool)

(assert (=> b!1141342 m!1052731))

(declare-fun m!1052733 () Bool)

(assert (=> start!98530 m!1052733))

(declare-fun m!1052735 () Bool)

(assert (=> start!98530 m!1052735))

(declare-fun m!1052737 () Bool)

(assert (=> b!1141331 m!1052737))

(declare-fun m!1052739 () Bool)

(assert (=> mapNonEmpty!44822 m!1052739))

(declare-fun m!1052741 () Bool)

(assert (=> b!1141339 m!1052741))

(declare-fun m!1052743 () Bool)

(assert (=> b!1141340 m!1052743))

(assert (=> b!1141340 m!1052743))

(declare-fun m!1052745 () Bool)

(assert (=> b!1141340 m!1052745))

(declare-fun m!1052747 () Bool)

(assert (=> b!1141340 m!1052747))

(declare-fun m!1052749 () Bool)

(assert (=> b!1141333 m!1052749))

(declare-fun m!1052751 () Bool)

(assert (=> b!1141333 m!1052751))

(declare-fun m!1052753 () Bool)

(assert (=> b!1141333 m!1052753))

(declare-fun m!1052755 () Bool)

(assert (=> b!1141333 m!1052755))

(declare-fun m!1052757 () Bool)

(assert (=> b!1141338 m!1052757))

(declare-fun m!1052759 () Bool)

(assert (=> b!1141344 m!1052759))

(declare-fun m!1052761 () Bool)

(assert (=> b!1141337 m!1052761))

(declare-fun m!1052763 () Bool)

(assert (=> b!1141337 m!1052763))

(declare-fun m!1052765 () Bool)

(assert (=> b!1141316 m!1052765))

(declare-fun m!1052767 () Bool)

(assert (=> b!1141316 m!1052767))

(declare-fun m!1052769 () Bool)

(assert (=> b!1141316 m!1052769))

(declare-fun m!1052771 () Bool)

(assert (=> b!1141316 m!1052771))

(declare-fun m!1052773 () Bool)

(assert (=> bm!51162 m!1052773))

(declare-fun m!1052775 () Bool)

(assert (=> b!1141321 m!1052775))

(declare-fun m!1052777 () Bool)

(assert (=> b!1141326 m!1052777))

(declare-fun m!1052779 () Bool)

(assert (=> b!1141326 m!1052779))

(assert (=> b!1141326 m!1052729))

(declare-fun m!1052781 () Bool)

(assert (=> b!1141326 m!1052781))

(declare-fun m!1052783 () Bool)

(assert (=> b!1141326 m!1052783))

(declare-fun m!1052785 () Bool)

(assert (=> b!1141326 m!1052785))

(assert (=> b!1141326 m!1052783))

(declare-fun m!1052787 () Bool)

(assert (=> b!1141326 m!1052787))

(declare-fun m!1052789 () Bool)

(assert (=> b!1141326 m!1052789))

(assert (=> b!1141326 m!1052783))

(assert (=> b!1141326 m!1052777))

(assert (=> b!1141326 m!1052781))

(declare-fun m!1052791 () Bool)

(assert (=> bm!51163 m!1052791))

(assert (=> b!1141328 m!1052783))

(declare-fun m!1052793 () Bool)

(assert (=> b!1141328 m!1052793))

(assert (=> b!1141335 m!1052741))

(declare-fun m!1052795 () Bool)

(assert (=> b!1141343 m!1052795))

(check-sat (not bm!51161) (not b!1141343) (not b!1141321) (not b!1141326) (not bm!51165) (not b_next!24135) (not b!1141340) tp_is_empty!28665 (not b!1141333) (not b!1141328) (not b!1141331) (not b!1141337) (not b!1141338) (not b!1141344) (not b!1141316) b_and!39121 (not b!1141335) (not bm!51159) (not b!1141342) (not start!98530) (not bm!51163) (not b!1141339) (not bm!51162) (not mapNonEmpty!44822) (not b!1141322) (not b_lambda!19241))
(check-sat b_and!39121 (not b_next!24135))
