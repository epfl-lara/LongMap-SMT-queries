; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98956 () Bool)

(assert start!98956)

(declare-fun b_free!24325 () Bool)

(declare-fun b_next!24325 () Bool)

(assert (=> start!98956 (= b_free!24325 (not b_next!24325))))

(declare-fun tp!85686 () Bool)

(declare-fun b_and!39501 () Bool)

(assert (=> start!98956 (= tp!85686 b_and!39501)))

(declare-fun b!1151251 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!654903 () Bool)

(declare-fun lt!514956 () Bool)

(assert (=> b!1151251 (= e!654903 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!514956) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1151252 () Bool)

(declare-fun res!765495 () Bool)

(declare-fun e!654917 () Bool)

(assert (=> b!1151252 (=> (not res!765495) (not e!654917))))

(declare-datatypes ((array!74603 0))(
  ( (array!74604 (arr!35946 (Array (_ BitVec 32) (_ BitVec 64))) (size!36483 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74603)

(declare-datatypes ((List!25147 0))(
  ( (Nil!25144) (Cons!25143 (h!26361 (_ BitVec 64)) (t!36456 List!25147)) )
))
(declare-fun arrayNoDuplicates!0 (array!74603 (_ BitVec 32) List!25147) Bool)

(assert (=> b!1151252 (= res!765495 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25144))))

(declare-fun b!1151253 () Bool)

(declare-fun e!654904 () Bool)

(declare-fun e!654909 () Bool)

(assert (=> b!1151253 (= e!654904 (not e!654909))))

(declare-fun res!765500 () Bool)

(assert (=> b!1151253 (=> res!765500 e!654909)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1151253 (= res!765500 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1151253 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37786 0))(
  ( (Unit!37787) )
))
(declare-fun lt!514958 () Unit!37786)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74603 (_ BitVec 64) (_ BitVec 32)) Unit!37786)

(assert (=> b!1151253 (= lt!514958 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1151254 () Bool)

(declare-fun e!654908 () Bool)

(assert (=> b!1151254 (= e!654908 true)))

(declare-fun e!654916 () Bool)

(assert (=> b!1151254 e!654916))

(declare-fun res!765491 () Bool)

(assert (=> b!1151254 (=> (not res!765491) (not e!654916))))

(declare-datatypes ((V!43601 0))(
  ( (V!43602 (val!14484 Int)) )
))
(declare-datatypes ((tuple2!18394 0))(
  ( (tuple2!18395 (_1!9208 (_ BitVec 64)) (_2!9208 V!43601)) )
))
(declare-datatypes ((List!25148 0))(
  ( (Nil!25145) (Cons!25144 (h!26362 tuple2!18394) (t!36457 List!25148)) )
))
(declare-datatypes ((ListLongMap!16371 0))(
  ( (ListLongMap!16372 (toList!8201 List!25148)) )
))
(declare-fun lt!514960 () ListLongMap!16371)

(declare-fun lt!514948 () ListLongMap!16371)

(assert (=> b!1151254 (= res!765491 (= lt!514960 lt!514948))))

(declare-fun lt!514961 () ListLongMap!16371)

(declare-fun -!1322 (ListLongMap!16371 (_ BitVec 64)) ListLongMap!16371)

(assert (=> b!1151254 (= lt!514960 (-!1322 lt!514961 k0!934))))

(declare-fun lt!514953 () V!43601)

(declare-fun +!3639 (ListLongMap!16371 tuple2!18394) ListLongMap!16371)

(assert (=> b!1151254 (= (-!1322 (+!3639 lt!514948 (tuple2!18395 (select (arr!35946 _keys!1208) from!1455) lt!514953)) (select (arr!35946 _keys!1208) from!1455)) lt!514948)))

(declare-fun lt!514963 () Unit!37786)

(declare-fun addThenRemoveForNewKeyIsSame!170 (ListLongMap!16371 (_ BitVec 64) V!43601) Unit!37786)

(assert (=> b!1151254 (= lt!514963 (addThenRemoveForNewKeyIsSame!170 lt!514948 (select (arr!35946 _keys!1208) from!1455) lt!514953))))

(declare-fun lt!514954 () V!43601)

(declare-datatypes ((ValueCell!13718 0))(
  ( (ValueCellFull!13718 (v!17117 V!43601)) (EmptyCell!13718) )
))
(declare-datatypes ((array!74605 0))(
  ( (array!74606 (arr!35947 (Array (_ BitVec 32) ValueCell!13718)) (size!36484 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74605)

(declare-fun get!18323 (ValueCell!13718 V!43601) V!43601)

(assert (=> b!1151254 (= lt!514953 (get!18323 (select (arr!35947 _values!996) from!1455) lt!514954))))

(declare-fun lt!514955 () Unit!37786)

(declare-fun e!654907 () Unit!37786)

(assert (=> b!1151254 (= lt!514955 e!654907)))

(declare-fun c!114184 () Bool)

(declare-fun contains!6736 (ListLongMap!16371 (_ BitVec 64)) Bool)

(assert (=> b!1151254 (= c!114184 (contains!6736 lt!514948 k0!934))))

(declare-fun zeroValue!944 () V!43601)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43601)

(declare-fun getCurrentListMapNoExtraKeys!4701 (array!74603 array!74605 (_ BitVec 32) (_ BitVec 32) V!43601 V!43601 (_ BitVec 32) Int) ListLongMap!16371)

(assert (=> b!1151254 (= lt!514948 (getCurrentListMapNoExtraKeys!4701 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151255 () Bool)

(declare-fun res!765488 () Bool)

(assert (=> b!1151255 (=> (not res!765488) (not e!654917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1151255 (= res!765488 (validMask!0 mask!1564))))

(declare-fun b!1151256 () Bool)

(declare-fun call!53511 () Bool)

(assert (=> b!1151256 call!53511))

(declare-fun lt!514950 () Unit!37786)

(declare-fun call!53513 () Unit!37786)

(assert (=> b!1151256 (= lt!514950 call!53513)))

(declare-fun e!654912 () Unit!37786)

(assert (=> b!1151256 (= e!654912 lt!514950)))

(declare-fun b!1151257 () Bool)

(declare-fun c!114186 () Bool)

(assert (=> b!1151257 (= c!114186 (and (not lt!514956) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!654919 () Unit!37786)

(declare-fun e!654913 () Unit!37786)

(assert (=> b!1151257 (= e!654919 e!654913)))

(declare-fun call!53508 () ListLongMap!16371)

(declare-fun call!53509 () Bool)

(declare-fun lt!514952 () ListLongMap!16371)

(declare-fun bm!53504 () Bool)

(declare-fun c!114185 () Bool)

(assert (=> bm!53504 (= call!53509 (contains!6736 (ite c!114185 lt!514952 call!53508) k0!934))))

(declare-fun bm!53505 () Bool)

(declare-fun call!53514 () ListLongMap!16371)

(assert (=> bm!53505 (= call!53514 (+!3639 lt!514948 (ite (or c!114185 c!114186) (tuple2!18395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1151258 () Bool)

(declare-fun e!654915 () Bool)

(assert (=> b!1151258 (= e!654915 e!654908)))

(declare-fun res!765501 () Bool)

(assert (=> b!1151258 (=> res!765501 e!654908)))

(assert (=> b!1151258 (= res!765501 (not (= (select (arr!35946 _keys!1208) from!1455) k0!934)))))

(declare-fun e!654914 () Bool)

(assert (=> b!1151258 e!654914))

(declare-fun c!114181 () Bool)

(assert (=> b!1151258 (= c!114181 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!514959 () Unit!37786)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!566 (array!74603 array!74605 (_ BitVec 32) (_ BitVec 32) V!43601 V!43601 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37786)

(assert (=> b!1151258 (= lt!514959 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!566 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151259 () Bool)

(assert (=> b!1151259 (contains!6736 (+!3639 lt!514952 (tuple2!18395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!514957 () Unit!37786)

(declare-fun addStillContains!863 (ListLongMap!16371 (_ BitVec 64) V!43601 (_ BitVec 64)) Unit!37786)

(assert (=> b!1151259 (= lt!514957 (addStillContains!863 lt!514952 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1151259 call!53509))

(assert (=> b!1151259 (= lt!514952 call!53514)))

(declare-fun lt!514947 () Unit!37786)

(declare-fun call!53507 () Unit!37786)

(assert (=> b!1151259 (= lt!514947 call!53507)))

(assert (=> b!1151259 (= e!654919 lt!514957)))

(declare-fun b!1151260 () Bool)

(declare-fun Unit!37788 () Unit!37786)

(assert (=> b!1151260 (= e!654912 Unit!37788)))

(declare-fun b!1151261 () Bool)

(assert (=> b!1151261 (= e!654909 e!654915)))

(declare-fun res!765499 () Bool)

(assert (=> b!1151261 (=> res!765499 e!654915)))

(assert (=> b!1151261 (= res!765499 (not (= from!1455 i!673)))))

(declare-fun lt!514962 () array!74605)

(declare-fun lt!514944 () array!74603)

(declare-fun lt!514942 () ListLongMap!16371)

(assert (=> b!1151261 (= lt!514942 (getCurrentListMapNoExtraKeys!4701 lt!514944 lt!514962 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1151261 (= lt!514962 (array!74606 (store (arr!35947 _values!996) i!673 (ValueCellFull!13718 lt!514954)) (size!36484 _values!996)))))

(declare-fun dynLambda!2724 (Int (_ BitVec 64)) V!43601)

(assert (=> b!1151261 (= lt!514954 (dynLambda!2724 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1151261 (= lt!514961 (getCurrentListMapNoExtraKeys!4701 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1151262 () Bool)

(declare-fun call!53510 () ListLongMap!16371)

(declare-fun call!53512 () ListLongMap!16371)

(assert (=> b!1151262 (= e!654914 (= call!53510 call!53512))))

(declare-fun e!654906 () Bool)

(declare-fun b!1151263 () Bool)

(assert (=> b!1151263 (= e!654906 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!45107 () Bool)

(declare-fun mapRes!45107 () Bool)

(declare-fun tp!85685 () Bool)

(declare-fun e!654910 () Bool)

(assert (=> mapNonEmpty!45107 (= mapRes!45107 (and tp!85685 e!654910))))

(declare-fun mapValue!45107 () ValueCell!13718)

(declare-fun mapKey!45107 () (_ BitVec 32))

(declare-fun mapRest!45107 () (Array (_ BitVec 32) ValueCell!13718))

(assert (=> mapNonEmpty!45107 (= (arr!35947 _values!996) (store mapRest!45107 mapKey!45107 mapValue!45107))))

(declare-fun bm!53506 () Bool)

(assert (=> bm!53506 (= call!53510 (getCurrentListMapNoExtraKeys!4701 lt!514944 lt!514962 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53507 () Bool)

(assert (=> bm!53507 (= call!53507 (addStillContains!863 lt!514948 (ite (or c!114185 c!114186) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114185 c!114186) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1151264 () Bool)

(assert (=> b!1151264 (= e!654916 (= lt!514960 (getCurrentListMapNoExtraKeys!4701 lt!514944 lt!514962 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1151265 () Bool)

(declare-fun res!765490 () Bool)

(assert (=> b!1151265 (=> (not res!765490) (not e!654904))))

(assert (=> b!1151265 (= res!765490 (arrayNoDuplicates!0 lt!514944 #b00000000000000000000000000000000 Nil!25144))))

(declare-fun mapIsEmpty!45107 () Bool)

(assert (=> mapIsEmpty!45107 mapRes!45107))

(declare-fun b!1151266 () Bool)

(declare-fun res!765492 () Bool)

(assert (=> b!1151266 (=> (not res!765492) (not e!654917))))

(assert (=> b!1151266 (= res!765492 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36483 _keys!1208))))))

(declare-fun b!1151267 () Bool)

(declare-fun e!654911 () Bool)

(declare-fun e!654918 () Bool)

(assert (=> b!1151267 (= e!654911 (and e!654918 mapRes!45107))))

(declare-fun condMapEmpty!45107 () Bool)

(declare-fun mapDefault!45107 () ValueCell!13718)

(assert (=> b!1151267 (= condMapEmpty!45107 (= (arr!35947 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13718)) mapDefault!45107)))))

(declare-fun b!1151268 () Bool)

(declare-fun Unit!37789 () Unit!37786)

(assert (=> b!1151268 (= e!654907 Unit!37789)))

(declare-fun bm!53508 () Bool)

(assert (=> bm!53508 (= call!53511 call!53509)))

(declare-fun bm!53509 () Bool)

(assert (=> bm!53509 (= call!53512 (getCurrentListMapNoExtraKeys!4701 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151269 () Bool)

(declare-fun tp_is_empty!28855 () Bool)

(assert (=> b!1151269 (= e!654918 tp_is_empty!28855)))

(declare-fun b!1151270 () Bool)

(declare-fun res!765489 () Bool)

(assert (=> b!1151270 (=> (not res!765489) (not e!654917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1151270 (= res!765489 (validKeyInArray!0 k0!934))))

(declare-fun b!1151271 () Bool)

(assert (=> b!1151271 (= e!654917 e!654904)))

(declare-fun res!765497 () Bool)

(assert (=> b!1151271 (=> (not res!765497) (not e!654904))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74603 (_ BitVec 32)) Bool)

(assert (=> b!1151271 (= res!765497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!514944 mask!1564))))

(assert (=> b!1151271 (= lt!514944 (array!74604 (store (arr!35946 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36483 _keys!1208)))))

(declare-fun b!1151272 () Bool)

(declare-fun Unit!37790 () Unit!37786)

(assert (=> b!1151272 (= e!654907 Unit!37790)))

(assert (=> b!1151272 (= lt!514956 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1151272 (= c!114185 (and (not lt!514956) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514951 () Unit!37786)

(assert (=> b!1151272 (= lt!514951 e!654919)))

(declare-fun lt!514943 () Unit!37786)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!458 (array!74603 array!74605 (_ BitVec 32) (_ BitVec 32) V!43601 V!43601 (_ BitVec 64) (_ BitVec 32) Int) Unit!37786)

(assert (=> b!1151272 (= lt!514943 (lemmaListMapContainsThenArrayContainsFrom!458 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114183 () Bool)

(assert (=> b!1151272 (= c!114183 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765496 () Bool)

(assert (=> b!1151272 (= res!765496 e!654903)))

(assert (=> b!1151272 (=> (not res!765496) (not e!654906))))

(assert (=> b!1151272 e!654906))

(declare-fun lt!514949 () Unit!37786)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74603 (_ BitVec 32) (_ BitVec 32)) Unit!37786)

(assert (=> b!1151272 (= lt!514949 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1151272 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25144)))

(declare-fun lt!514945 () Unit!37786)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74603 (_ BitVec 64) (_ BitVec 32) List!25147) Unit!37786)

(assert (=> b!1151272 (= lt!514945 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25144))))

(assert (=> b!1151272 false))

(declare-fun b!1151273 () Bool)

(declare-fun res!765498 () Bool)

(assert (=> b!1151273 (=> (not res!765498) (not e!654917))))

(assert (=> b!1151273 (= res!765498 (= (select (arr!35946 _keys!1208) i!673) k0!934))))

(declare-fun b!1151274 () Bool)

(assert (=> b!1151274 (= e!654903 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1151275 () Bool)

(declare-fun res!765494 () Bool)

(assert (=> b!1151275 (=> (not res!765494) (not e!654917))))

(assert (=> b!1151275 (= res!765494 (and (= (size!36484 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36483 _keys!1208) (size!36484 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1151276 () Bool)

(assert (=> b!1151276 (= e!654910 tp_is_empty!28855)))

(declare-fun b!1151277 () Bool)

(declare-fun res!765493 () Bool)

(assert (=> b!1151277 (=> (not res!765493) (not e!654917))))

(assert (=> b!1151277 (= res!765493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1151278 () Bool)

(assert (=> b!1151278 (= e!654913 e!654912)))

(declare-fun c!114182 () Bool)

(assert (=> b!1151278 (= c!114182 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514956))))

(declare-fun bm!53510 () Bool)

(assert (=> bm!53510 (= call!53513 call!53507)))

(declare-fun res!765487 () Bool)

(assert (=> start!98956 (=> (not res!765487) (not e!654917))))

(assert (=> start!98956 (= res!765487 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36483 _keys!1208))))))

(assert (=> start!98956 e!654917))

(assert (=> start!98956 tp_is_empty!28855))

(declare-fun array_inv!27584 (array!74603) Bool)

(assert (=> start!98956 (array_inv!27584 _keys!1208)))

(assert (=> start!98956 true))

(assert (=> start!98956 tp!85686))

(declare-fun array_inv!27585 (array!74605) Bool)

(assert (=> start!98956 (and (array_inv!27585 _values!996) e!654911)))

(declare-fun bm!53511 () Bool)

(assert (=> bm!53511 (= call!53508 call!53514)))

(declare-fun b!1151279 () Bool)

(declare-fun lt!514946 () Unit!37786)

(assert (=> b!1151279 (= e!654913 lt!514946)))

(assert (=> b!1151279 (= lt!514946 call!53513)))

(assert (=> b!1151279 call!53511))

(declare-fun b!1151280 () Bool)

(assert (=> b!1151280 (= e!654914 (= call!53510 (-!1322 call!53512 k0!934)))))

(assert (= (and start!98956 res!765487) b!1151255))

(assert (= (and b!1151255 res!765488) b!1151275))

(assert (= (and b!1151275 res!765494) b!1151277))

(assert (= (and b!1151277 res!765493) b!1151252))

(assert (= (and b!1151252 res!765495) b!1151266))

(assert (= (and b!1151266 res!765492) b!1151270))

(assert (= (and b!1151270 res!765489) b!1151273))

(assert (= (and b!1151273 res!765498) b!1151271))

(assert (= (and b!1151271 res!765497) b!1151265))

(assert (= (and b!1151265 res!765490) b!1151253))

(assert (= (and b!1151253 (not res!765500)) b!1151261))

(assert (= (and b!1151261 (not res!765499)) b!1151258))

(assert (= (and b!1151258 c!114181) b!1151280))

(assert (= (and b!1151258 (not c!114181)) b!1151262))

(assert (= (or b!1151280 b!1151262) bm!53506))

(assert (= (or b!1151280 b!1151262) bm!53509))

(assert (= (and b!1151258 (not res!765501)) b!1151254))

(assert (= (and b!1151254 c!114184) b!1151272))

(assert (= (and b!1151254 (not c!114184)) b!1151268))

(assert (= (and b!1151272 c!114185) b!1151259))

(assert (= (and b!1151272 (not c!114185)) b!1151257))

(assert (= (and b!1151257 c!114186) b!1151279))

(assert (= (and b!1151257 (not c!114186)) b!1151278))

(assert (= (and b!1151278 c!114182) b!1151256))

(assert (= (and b!1151278 (not c!114182)) b!1151260))

(assert (= (or b!1151279 b!1151256) bm!53510))

(assert (= (or b!1151279 b!1151256) bm!53511))

(assert (= (or b!1151279 b!1151256) bm!53508))

(assert (= (or b!1151259 bm!53508) bm!53504))

(assert (= (or b!1151259 bm!53510) bm!53507))

(assert (= (or b!1151259 bm!53511) bm!53505))

(assert (= (and b!1151272 c!114183) b!1151274))

(assert (= (and b!1151272 (not c!114183)) b!1151251))

(assert (= (and b!1151272 res!765496) b!1151263))

(assert (= (and b!1151254 res!765491) b!1151264))

(assert (= (and b!1151267 condMapEmpty!45107) mapIsEmpty!45107))

(assert (= (and b!1151267 (not condMapEmpty!45107)) mapNonEmpty!45107))

(get-info :version)

(assert (= (and mapNonEmpty!45107 ((_ is ValueCellFull!13718) mapValue!45107)) b!1151276))

(assert (= (and b!1151267 ((_ is ValueCellFull!13718) mapDefault!45107)) b!1151269))

(assert (= start!98956 b!1151267))

(declare-fun b_lambda!19425 () Bool)

(assert (=> (not b_lambda!19425) (not b!1151261)))

(declare-fun t!36455 () Bool)

(declare-fun tb!9129 () Bool)

(assert (=> (and start!98956 (= defaultEntry!1004 defaultEntry!1004) t!36455) tb!9129))

(declare-fun result!18831 () Bool)

(assert (=> tb!9129 (= result!18831 tp_is_empty!28855)))

(assert (=> b!1151261 t!36455))

(declare-fun b_and!39503 () Bool)

(assert (= b_and!39501 (and (=> t!36455 result!18831) b_and!39503)))

(declare-fun m!1061833 () Bool)

(assert (=> b!1151261 m!1061833))

(declare-fun m!1061835 () Bool)

(assert (=> b!1151261 m!1061835))

(declare-fun m!1061837 () Bool)

(assert (=> b!1151261 m!1061837))

(declare-fun m!1061839 () Bool)

(assert (=> b!1151261 m!1061839))

(declare-fun m!1061841 () Bool)

(assert (=> b!1151255 m!1061841))

(declare-fun m!1061843 () Bool)

(assert (=> b!1151253 m!1061843))

(declare-fun m!1061845 () Bool)

(assert (=> b!1151253 m!1061845))

(declare-fun m!1061847 () Bool)

(assert (=> b!1151277 m!1061847))

(declare-fun m!1061849 () Bool)

(assert (=> bm!53504 m!1061849))

(declare-fun m!1061851 () Bool)

(assert (=> b!1151265 m!1061851))

(declare-fun m!1061853 () Bool)

(assert (=> bm!53507 m!1061853))

(declare-fun m!1061855 () Bool)

(assert (=> b!1151263 m!1061855))

(declare-fun m!1061857 () Bool)

(assert (=> b!1151264 m!1061857))

(declare-fun m!1061859 () Bool)

(assert (=> mapNonEmpty!45107 m!1061859))

(assert (=> bm!53506 m!1061857))

(declare-fun m!1061861 () Bool)

(assert (=> b!1151272 m!1061861))

(declare-fun m!1061863 () Bool)

(assert (=> b!1151272 m!1061863))

(declare-fun m!1061865 () Bool)

(assert (=> b!1151272 m!1061865))

(declare-fun m!1061867 () Bool)

(assert (=> b!1151272 m!1061867))

(declare-fun m!1061869 () Bool)

(assert (=> b!1151273 m!1061869))

(declare-fun m!1061871 () Bool)

(assert (=> b!1151280 m!1061871))

(assert (=> b!1151274 m!1061855))

(declare-fun m!1061873 () Bool)

(assert (=> b!1151270 m!1061873))

(declare-fun m!1061875 () Bool)

(assert (=> b!1151258 m!1061875))

(declare-fun m!1061877 () Bool)

(assert (=> b!1151258 m!1061877))

(declare-fun m!1061879 () Bool)

(assert (=> bm!53505 m!1061879))

(declare-fun m!1061881 () Bool)

(assert (=> b!1151259 m!1061881))

(assert (=> b!1151259 m!1061881))

(declare-fun m!1061883 () Bool)

(assert (=> b!1151259 m!1061883))

(declare-fun m!1061885 () Bool)

(assert (=> b!1151259 m!1061885))

(declare-fun m!1061887 () Bool)

(assert (=> b!1151252 m!1061887))

(declare-fun m!1061889 () Bool)

(assert (=> b!1151271 m!1061889))

(declare-fun m!1061891 () Bool)

(assert (=> b!1151271 m!1061891))

(declare-fun m!1061893 () Bool)

(assert (=> start!98956 m!1061893))

(declare-fun m!1061895 () Bool)

(assert (=> start!98956 m!1061895))

(declare-fun m!1061897 () Bool)

(assert (=> bm!53509 m!1061897))

(assert (=> b!1151254 m!1061897))

(declare-fun m!1061899 () Bool)

(assert (=> b!1151254 m!1061899))

(declare-fun m!1061901 () Bool)

(assert (=> b!1151254 m!1061901))

(assert (=> b!1151254 m!1061875))

(declare-fun m!1061903 () Bool)

(assert (=> b!1151254 m!1061903))

(declare-fun m!1061905 () Bool)

(assert (=> b!1151254 m!1061905))

(assert (=> b!1151254 m!1061875))

(declare-fun m!1061907 () Bool)

(assert (=> b!1151254 m!1061907))

(assert (=> b!1151254 m!1061905))

(assert (=> b!1151254 m!1061875))

(assert (=> b!1151254 m!1061899))

(declare-fun m!1061909 () Bool)

(assert (=> b!1151254 m!1061909))

(declare-fun m!1061911 () Bool)

(assert (=> b!1151254 m!1061911))

(check-sat (not bm!53507) (not b!1151261) (not bm!53505) (not b!1151259) (not start!98956) (not b!1151258) tp_is_empty!28855 (not bm!53506) (not b!1151270) (not b!1151272) (not b_next!24325) (not b!1151253) b_and!39503 (not b!1151271) (not b!1151264) (not bm!53509) (not b!1151274) (not mapNonEmpty!45107) (not b!1151280) (not b!1151265) (not b!1151254) (not b!1151255) (not b!1151277) (not b!1151263) (not bm!53504) (not b!1151252) (not b_lambda!19425))
(check-sat b_and!39503 (not b_next!24325))
