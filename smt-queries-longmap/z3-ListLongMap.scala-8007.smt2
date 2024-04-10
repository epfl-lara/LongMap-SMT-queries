; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98884 () Bool)

(assert start!98884)

(declare-fun b_free!24489 () Bool)

(declare-fun b_next!24489 () Bool)

(assert (=> start!98884 (= b_free!24489 (not b_next!24489))))

(declare-fun tp!86177 () Bool)

(declare-fun b_and!39827 () Bool)

(assert (=> start!98884 (= tp!86177 b_and!39827)))

(declare-datatypes ((V!43819 0))(
  ( (V!43820 (val!14566 Int)) )
))
(declare-datatypes ((tuple2!18534 0))(
  ( (tuple2!18535 (_1!9278 (_ BitVec 64)) (_2!9278 V!43819)) )
))
(declare-datatypes ((List!25275 0))(
  ( (Nil!25272) (Cons!25271 (h!26480 tuple2!18534) (t!36756 List!25275)) )
))
(declare-datatypes ((ListLongMap!16503 0))(
  ( (ListLongMap!16504 (toList!8267 List!25275)) )
))
(declare-fun call!55411 () ListLongMap!16503)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!658261 () Bool)

(declare-fun b!1157506 () Bool)

(declare-fun call!55412 () ListLongMap!16503)

(declare-fun -!1381 (ListLongMap!16503 (_ BitVec 64)) ListLongMap!16503)

(assert (=> b!1157506 (= e!658261 (= call!55411 (-!1381 call!55412 k0!934)))))

(declare-fun call!55413 () Bool)

(declare-fun lt!519890 () ListLongMap!16503)

(declare-fun bm!55407 () Bool)

(declare-fun c!115262 () Bool)

(declare-fun call!55415 () ListLongMap!16503)

(declare-fun contains!6778 (ListLongMap!16503 (_ BitVec 64)) Bool)

(assert (=> bm!55407 (= call!55413 (contains!6778 (ite c!115262 lt!519890 call!55415) k0!934))))

(declare-fun b!1157507 () Bool)

(declare-fun res!768682 () Bool)

(declare-fun e!658256 () Bool)

(assert (=> b!1157507 (=> (not res!768682) (not e!658256))))

(declare-datatypes ((array!74881 0))(
  ( (array!74882 (arr!36091 (Array (_ BitVec 32) (_ BitVec 64))) (size!36627 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74881)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1157507 (= res!768682 (= (select (arr!36091 _keys!1208) i!673) k0!934))))

(declare-fun b!1157508 () Bool)

(declare-fun e!658265 () Bool)

(assert (=> b!1157508 (= e!658265 true)))

(declare-fun e!658257 () Bool)

(assert (=> b!1157508 e!658257))

(declare-fun res!768670 () Bool)

(assert (=> b!1157508 (=> (not res!768670) (not e!658257))))

(declare-fun lt!519876 () ListLongMap!16503)

(declare-fun lt!519886 () ListLongMap!16503)

(assert (=> b!1157508 (= res!768670 (= lt!519876 lt!519886))))

(declare-fun lt!519878 () ListLongMap!16503)

(assert (=> b!1157508 (= lt!519876 (-!1381 lt!519878 k0!934))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!519885 () V!43819)

(declare-fun +!3678 (ListLongMap!16503 tuple2!18534) ListLongMap!16503)

(assert (=> b!1157508 (= (-!1381 (+!3678 lt!519886 (tuple2!18535 (select (arr!36091 _keys!1208) from!1455) lt!519885)) (select (arr!36091 _keys!1208) from!1455)) lt!519886)))

(declare-datatypes ((Unit!38134 0))(
  ( (Unit!38135) )
))
(declare-fun lt!519871 () Unit!38134)

(declare-fun addThenRemoveForNewKeyIsSame!220 (ListLongMap!16503 (_ BitVec 64) V!43819) Unit!38134)

(assert (=> b!1157508 (= lt!519871 (addThenRemoveForNewKeyIsSame!220 lt!519886 (select (arr!36091 _keys!1208) from!1455) lt!519885))))

(declare-fun lt!519877 () V!43819)

(declare-datatypes ((ValueCell!13800 0))(
  ( (ValueCellFull!13800 (v!17203 V!43819)) (EmptyCell!13800) )
))
(declare-datatypes ((array!74883 0))(
  ( (array!74884 (arr!36092 (Array (_ BitVec 32) ValueCell!13800)) (size!36628 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74883)

(declare-fun get!18396 (ValueCell!13800 V!43819) V!43819)

(assert (=> b!1157508 (= lt!519885 (get!18396 (select (arr!36092 _values!996) from!1455) lt!519877))))

(declare-fun lt!519882 () Unit!38134)

(declare-fun e!658253 () Unit!38134)

(assert (=> b!1157508 (= lt!519882 e!658253)))

(declare-fun c!115260 () Bool)

(assert (=> b!1157508 (= c!115260 (contains!6778 lt!519886 k0!934))))

(declare-fun zeroValue!944 () V!43819)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43819)

(declare-fun getCurrentListMapNoExtraKeys!4734 (array!74881 array!74883 (_ BitVec 32) (_ BitVec 32) V!43819 V!43819 (_ BitVec 32) Int) ListLongMap!16503)

(assert (=> b!1157508 (= lt!519886 (getCurrentListMapNoExtraKeys!4734 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45353 () Bool)

(declare-fun mapRes!45353 () Bool)

(assert (=> mapIsEmpty!45353 mapRes!45353))

(declare-fun e!658263 () Bool)

(declare-fun b!1157509 () Bool)

(declare-fun arrayContainsKey!0 (array!74881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1157509 (= e!658263 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1157510 () Bool)

(declare-fun res!768672 () Bool)

(assert (=> b!1157510 (=> (not res!768672) (not e!658256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1157510 (= res!768672 (validMask!0 mask!1564))))

(declare-fun b!1157511 () Bool)

(declare-fun res!768679 () Bool)

(assert (=> b!1157511 (=> (not res!768679) (not e!658256))))

(declare-datatypes ((List!25276 0))(
  ( (Nil!25273) (Cons!25272 (h!26481 (_ BitVec 64)) (t!36757 List!25276)) )
))
(declare-fun arrayNoDuplicates!0 (array!74881 (_ BitVec 32) List!25276) Bool)

(assert (=> b!1157511 (= res!768679 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25273))))

(declare-fun b!1157513 () Bool)

(declare-fun call!55410 () ListLongMap!16503)

(assert (=> b!1157513 (contains!6778 call!55410 k0!934)))

(declare-fun lt!519883 () Unit!38134)

(declare-fun call!55416 () Unit!38134)

(assert (=> b!1157513 (= lt!519883 call!55416)))

(assert (=> b!1157513 call!55413))

(assert (=> b!1157513 (= lt!519890 (+!3678 lt!519886 (tuple2!18535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!519879 () Unit!38134)

(declare-fun addStillContains!920 (ListLongMap!16503 (_ BitVec 64) V!43819 (_ BitVec 64)) Unit!38134)

(assert (=> b!1157513 (= lt!519879 (addStillContains!920 lt!519886 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!658267 () Unit!38134)

(assert (=> b!1157513 (= e!658267 lt!519883)))

(declare-fun b!1157514 () Bool)

(declare-fun res!768683 () Bool)

(declare-fun e!658255 () Bool)

(assert (=> b!1157514 (=> (not res!768683) (not e!658255))))

(declare-fun lt!519875 () array!74881)

(assert (=> b!1157514 (= res!768683 (arrayNoDuplicates!0 lt!519875 #b00000000000000000000000000000000 Nil!25273))))

(declare-fun c!115263 () Bool)

(declare-fun bm!55408 () Bool)

(assert (=> bm!55408 (= call!55416 (addStillContains!920 (ite c!115262 lt!519890 lt!519886) (ite c!115262 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115263 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115262 minValue!944 (ite c!115263 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1157515 () Bool)

(declare-fun e!658258 () Bool)

(assert (=> b!1157515 (= e!658258 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1157516 () Bool)

(declare-fun e!658264 () Bool)

(assert (=> b!1157516 (= e!658255 (not e!658264))))

(declare-fun res!768680 () Bool)

(assert (=> b!1157516 (=> res!768680 e!658264)))

(assert (=> b!1157516 (= res!768680 (bvsgt from!1455 i!673))))

(assert (=> b!1157516 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!519881 () Unit!38134)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74881 (_ BitVec 64) (_ BitVec 32)) Unit!38134)

(assert (=> b!1157516 (= lt!519881 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1157517 () Bool)

(declare-fun call!55417 () Bool)

(assert (=> b!1157517 call!55417))

(declare-fun lt!519889 () Unit!38134)

(declare-fun call!55414 () Unit!38134)

(assert (=> b!1157517 (= lt!519889 call!55414)))

(declare-fun e!658259 () Unit!38134)

(assert (=> b!1157517 (= e!658259 lt!519889)))

(declare-fun mapNonEmpty!45353 () Bool)

(declare-fun tp!86178 () Bool)

(declare-fun e!658269 () Bool)

(assert (=> mapNonEmpty!45353 (= mapRes!45353 (and tp!86178 e!658269))))

(declare-fun mapKey!45353 () (_ BitVec 32))

(declare-fun mapValue!45353 () ValueCell!13800)

(declare-fun mapRest!45353 () (Array (_ BitVec 32) ValueCell!13800))

(assert (=> mapNonEmpty!45353 (= (arr!36092 _values!996) (store mapRest!45353 mapKey!45353 mapValue!45353))))

(declare-fun b!1157518 () Bool)

(assert (=> b!1157518 (= e!658261 (= call!55411 call!55412))))

(declare-fun bm!55409 () Bool)

(assert (=> bm!55409 (= call!55414 call!55416)))

(declare-fun b!1157519 () Bool)

(declare-fun e!658260 () Bool)

(declare-fun e!658266 () Bool)

(assert (=> b!1157519 (= e!658260 (and e!658266 mapRes!45353))))

(declare-fun condMapEmpty!45353 () Bool)

(declare-fun mapDefault!45353 () ValueCell!13800)

(assert (=> b!1157519 (= condMapEmpty!45353 (= (arr!36092 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13800)) mapDefault!45353)))))

(declare-fun lt!519874 () array!74883)

(declare-fun bm!55410 () Bool)

(assert (=> bm!55410 (= call!55411 (getCurrentListMapNoExtraKeys!4734 lt!519875 lt!519874 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157520 () Bool)

(declare-fun res!768678 () Bool)

(assert (=> b!1157520 (=> (not res!768678) (not e!658256))))

(assert (=> b!1157520 (= res!768678 (and (= (size!36628 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36627 _keys!1208) (size!36628 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1157521 () Bool)

(assert (=> b!1157521 (= e!658256 e!658255)))

(declare-fun res!768673 () Bool)

(assert (=> b!1157521 (=> (not res!768673) (not e!658255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74881 (_ BitVec 32)) Bool)

(assert (=> b!1157521 (= res!768673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!519875 mask!1564))))

(assert (=> b!1157521 (= lt!519875 (array!74882 (store (arr!36091 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36627 _keys!1208)))))

(declare-fun b!1157522 () Bool)

(declare-fun e!658268 () Unit!38134)

(assert (=> b!1157522 (= e!658268 e!658259)))

(declare-fun c!115261 () Bool)

(declare-fun lt!519888 () Bool)

(assert (=> b!1157522 (= c!115261 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!519888))))

(declare-fun b!1157523 () Bool)

(declare-fun Unit!38136 () Unit!38134)

(assert (=> b!1157523 (= e!658253 Unit!38136)))

(assert (=> b!1157523 (= lt!519888 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1157523 (= c!115262 (and (not lt!519888) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!519872 () Unit!38134)

(assert (=> b!1157523 (= lt!519872 e!658267)))

(declare-fun lt!519873 () Unit!38134)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!507 (array!74881 array!74883 (_ BitVec 32) (_ BitVec 32) V!43819 V!43819 (_ BitVec 64) (_ BitVec 32) Int) Unit!38134)

(assert (=> b!1157523 (= lt!519873 (lemmaListMapContainsThenArrayContainsFrom!507 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115264 () Bool)

(assert (=> b!1157523 (= c!115264 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768675 () Bool)

(assert (=> b!1157523 (= res!768675 e!658263)))

(assert (=> b!1157523 (=> (not res!768675) (not e!658258))))

(assert (=> b!1157523 e!658258))

(declare-fun lt!519880 () Unit!38134)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74881 (_ BitVec 32) (_ BitVec 32)) Unit!38134)

(assert (=> b!1157523 (= lt!519880 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1157523 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25273)))

(declare-fun lt!519870 () Unit!38134)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74881 (_ BitVec 64) (_ BitVec 32) List!25276) Unit!38134)

(assert (=> b!1157523 (= lt!519870 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25273))))

(assert (=> b!1157523 false))

(declare-fun b!1157524 () Bool)

(declare-fun tp_is_empty!29019 () Bool)

(assert (=> b!1157524 (= e!658266 tp_is_empty!29019)))

(declare-fun b!1157525 () Bool)

(declare-fun Unit!38137 () Unit!38134)

(assert (=> b!1157525 (= e!658253 Unit!38137)))

(declare-fun b!1157526 () Bool)

(declare-fun res!768669 () Bool)

(assert (=> b!1157526 (=> (not res!768669) (not e!658256))))

(assert (=> b!1157526 (= res!768669 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36627 _keys!1208))))))

(declare-fun b!1157527 () Bool)

(assert (=> b!1157527 (= e!658269 tp_is_empty!29019)))

(declare-fun b!1157528 () Bool)

(assert (=> b!1157528 (= c!115263 (and (not lt!519888) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1157528 (= e!658267 e!658268)))

(declare-fun bm!55411 () Bool)

(assert (=> bm!55411 (= call!55412 (getCurrentListMapNoExtraKeys!4734 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55412 () Bool)

(assert (=> bm!55412 (= call!55410 (+!3678 (ite c!115262 lt!519890 lt!519886) (ite c!115262 (tuple2!18535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115263 (tuple2!18535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1157529 () Bool)

(assert (=> b!1157529 (= e!658263 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!519888) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1157530 () Bool)

(declare-fun res!768671 () Bool)

(assert (=> b!1157530 (=> (not res!768671) (not e!658256))))

(assert (=> b!1157530 (= res!768671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!55413 () Bool)

(assert (=> bm!55413 (= call!55417 call!55413)))

(declare-fun res!768676 () Bool)

(assert (=> start!98884 (=> (not res!768676) (not e!658256))))

(assert (=> start!98884 (= res!768676 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36627 _keys!1208))))))

(assert (=> start!98884 e!658256))

(assert (=> start!98884 tp_is_empty!29019))

(declare-fun array_inv!27622 (array!74881) Bool)

(assert (=> start!98884 (array_inv!27622 _keys!1208)))

(assert (=> start!98884 true))

(assert (=> start!98884 tp!86177))

(declare-fun array_inv!27623 (array!74883) Bool)

(assert (=> start!98884 (and (array_inv!27623 _values!996) e!658260)))

(declare-fun b!1157512 () Bool)

(declare-fun lt!519891 () Unit!38134)

(assert (=> b!1157512 (= e!658268 lt!519891)))

(assert (=> b!1157512 (= lt!519891 call!55414)))

(assert (=> b!1157512 call!55417))

(declare-fun b!1157531 () Bool)

(declare-fun res!768681 () Bool)

(assert (=> b!1157531 (=> (not res!768681) (not e!658256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1157531 (= res!768681 (validKeyInArray!0 k0!934))))

(declare-fun b!1157532 () Bool)

(declare-fun e!658254 () Bool)

(assert (=> b!1157532 (= e!658254 e!658265)))

(declare-fun res!768674 () Bool)

(assert (=> b!1157532 (=> res!768674 e!658265)))

(assert (=> b!1157532 (= res!768674 (not (= (select (arr!36091 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1157532 e!658261))

(declare-fun c!115259 () Bool)

(assert (=> b!1157532 (= c!115259 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!519887 () Unit!38134)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!614 (array!74881 array!74883 (_ BitVec 32) (_ BitVec 32) V!43819 V!43819 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38134)

(assert (=> b!1157532 (= lt!519887 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!614 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157533 () Bool)

(assert (=> b!1157533 (= e!658257 (= lt!519876 (getCurrentListMapNoExtraKeys!4734 lt!519875 lt!519874 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!55414 () Bool)

(assert (=> bm!55414 (= call!55415 call!55410)))

(declare-fun b!1157534 () Bool)

(declare-fun Unit!38138 () Unit!38134)

(assert (=> b!1157534 (= e!658259 Unit!38138)))

(declare-fun b!1157535 () Bool)

(assert (=> b!1157535 (= e!658264 e!658254)))

(declare-fun res!768677 () Bool)

(assert (=> b!1157535 (=> res!768677 e!658254)))

(assert (=> b!1157535 (= res!768677 (not (= from!1455 i!673)))))

(declare-fun lt!519884 () ListLongMap!16503)

(assert (=> b!1157535 (= lt!519884 (getCurrentListMapNoExtraKeys!4734 lt!519875 lt!519874 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1157535 (= lt!519874 (array!74884 (store (arr!36092 _values!996) i!673 (ValueCellFull!13800 lt!519877)) (size!36628 _values!996)))))

(declare-fun dynLambda!2741 (Int (_ BitVec 64)) V!43819)

(assert (=> b!1157535 (= lt!519877 (dynLambda!2741 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1157535 (= lt!519878 (getCurrentListMapNoExtraKeys!4734 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!98884 res!768676) b!1157510))

(assert (= (and b!1157510 res!768672) b!1157520))

(assert (= (and b!1157520 res!768678) b!1157530))

(assert (= (and b!1157530 res!768671) b!1157511))

(assert (= (and b!1157511 res!768679) b!1157526))

(assert (= (and b!1157526 res!768669) b!1157531))

(assert (= (and b!1157531 res!768681) b!1157507))

(assert (= (and b!1157507 res!768682) b!1157521))

(assert (= (and b!1157521 res!768673) b!1157514))

(assert (= (and b!1157514 res!768683) b!1157516))

(assert (= (and b!1157516 (not res!768680)) b!1157535))

(assert (= (and b!1157535 (not res!768677)) b!1157532))

(assert (= (and b!1157532 c!115259) b!1157506))

(assert (= (and b!1157532 (not c!115259)) b!1157518))

(assert (= (or b!1157506 b!1157518) bm!55410))

(assert (= (or b!1157506 b!1157518) bm!55411))

(assert (= (and b!1157532 (not res!768674)) b!1157508))

(assert (= (and b!1157508 c!115260) b!1157523))

(assert (= (and b!1157508 (not c!115260)) b!1157525))

(assert (= (and b!1157523 c!115262) b!1157513))

(assert (= (and b!1157523 (not c!115262)) b!1157528))

(assert (= (and b!1157528 c!115263) b!1157512))

(assert (= (and b!1157528 (not c!115263)) b!1157522))

(assert (= (and b!1157522 c!115261) b!1157517))

(assert (= (and b!1157522 (not c!115261)) b!1157534))

(assert (= (or b!1157512 b!1157517) bm!55409))

(assert (= (or b!1157512 b!1157517) bm!55414))

(assert (= (or b!1157512 b!1157517) bm!55413))

(assert (= (or b!1157513 bm!55413) bm!55407))

(assert (= (or b!1157513 bm!55409) bm!55408))

(assert (= (or b!1157513 bm!55414) bm!55412))

(assert (= (and b!1157523 c!115264) b!1157509))

(assert (= (and b!1157523 (not c!115264)) b!1157529))

(assert (= (and b!1157523 res!768675) b!1157515))

(assert (= (and b!1157508 res!768670) b!1157533))

(assert (= (and b!1157519 condMapEmpty!45353) mapIsEmpty!45353))

(assert (= (and b!1157519 (not condMapEmpty!45353)) mapNonEmpty!45353))

(get-info :version)

(assert (= (and mapNonEmpty!45353 ((_ is ValueCellFull!13800) mapValue!45353)) b!1157527))

(assert (= (and b!1157519 ((_ is ValueCellFull!13800) mapDefault!45353)) b!1157524))

(assert (= start!98884 b!1157519))

(declare-fun b_lambda!19595 () Bool)

(assert (=> (not b_lambda!19595) (not b!1157535)))

(declare-fun t!36755 () Bool)

(declare-fun tb!9301 () Bool)

(assert (=> (and start!98884 (= defaultEntry!1004 defaultEntry!1004) t!36755) tb!9301))

(declare-fun result!19167 () Bool)

(assert (=> tb!9301 (= result!19167 tp_is_empty!29019)))

(assert (=> b!1157535 t!36755))

(declare-fun b_and!39829 () Bool)

(assert (= b_and!39827 (and (=> t!36755 result!19167) b_and!39829)))

(declare-fun m!1066829 () Bool)

(assert (=> b!1157533 m!1066829))

(declare-fun m!1066831 () Bool)

(assert (=> b!1157514 m!1066831))

(declare-fun m!1066833 () Bool)

(assert (=> b!1157535 m!1066833))

(declare-fun m!1066835 () Bool)

(assert (=> b!1157535 m!1066835))

(declare-fun m!1066837 () Bool)

(assert (=> b!1157535 m!1066837))

(declare-fun m!1066839 () Bool)

(assert (=> b!1157535 m!1066839))

(declare-fun m!1066841 () Bool)

(assert (=> b!1157521 m!1066841))

(declare-fun m!1066843 () Bool)

(assert (=> b!1157521 m!1066843))

(declare-fun m!1066845 () Bool)

(assert (=> b!1157531 m!1066845))

(declare-fun m!1066847 () Bool)

(assert (=> b!1157506 m!1066847))

(declare-fun m!1066849 () Bool)

(assert (=> mapNonEmpty!45353 m!1066849))

(declare-fun m!1066851 () Bool)

(assert (=> b!1157513 m!1066851))

(declare-fun m!1066853 () Bool)

(assert (=> b!1157513 m!1066853))

(declare-fun m!1066855 () Bool)

(assert (=> b!1157513 m!1066855))

(declare-fun m!1066857 () Bool)

(assert (=> b!1157508 m!1066857))

(declare-fun m!1066859 () Bool)

(assert (=> b!1157508 m!1066859))

(declare-fun m!1066861 () Bool)

(assert (=> b!1157508 m!1066861))

(declare-fun m!1066863 () Bool)

(assert (=> b!1157508 m!1066863))

(declare-fun m!1066865 () Bool)

(assert (=> b!1157508 m!1066865))

(declare-fun m!1066867 () Bool)

(assert (=> b!1157508 m!1066867))

(declare-fun m!1066869 () Bool)

(assert (=> b!1157508 m!1066869))

(assert (=> b!1157508 m!1066861))

(declare-fun m!1066871 () Bool)

(assert (=> b!1157508 m!1066871))

(assert (=> b!1157508 m!1066861))

(assert (=> b!1157508 m!1066859))

(declare-fun m!1066873 () Bool)

(assert (=> b!1157508 m!1066873))

(assert (=> b!1157508 m!1066869))

(declare-fun m!1066875 () Bool)

(assert (=> bm!55408 m!1066875))

(declare-fun m!1066877 () Bool)

(assert (=> b!1157510 m!1066877))

(assert (=> b!1157532 m!1066861))

(declare-fun m!1066879 () Bool)

(assert (=> b!1157532 m!1066879))

(declare-fun m!1066881 () Bool)

(assert (=> b!1157511 m!1066881))

(declare-fun m!1066883 () Bool)

(assert (=> b!1157530 m!1066883))

(assert (=> bm!55410 m!1066829))

(declare-fun m!1066885 () Bool)

(assert (=> b!1157523 m!1066885))

(declare-fun m!1066887 () Bool)

(assert (=> b!1157523 m!1066887))

(declare-fun m!1066889 () Bool)

(assert (=> b!1157523 m!1066889))

(declare-fun m!1066891 () Bool)

(assert (=> b!1157523 m!1066891))

(assert (=> bm!55411 m!1066857))

(declare-fun m!1066893 () Bool)

(assert (=> start!98884 m!1066893))

(declare-fun m!1066895 () Bool)

(assert (=> start!98884 m!1066895))

(declare-fun m!1066897 () Bool)

(assert (=> b!1157515 m!1066897))

(declare-fun m!1066899 () Bool)

(assert (=> bm!55407 m!1066899))

(declare-fun m!1066901 () Bool)

(assert (=> bm!55412 m!1066901))

(assert (=> b!1157509 m!1066897))

(declare-fun m!1066903 () Bool)

(assert (=> b!1157516 m!1066903))

(declare-fun m!1066905 () Bool)

(assert (=> b!1157516 m!1066905))

(declare-fun m!1066907 () Bool)

(assert (=> b!1157507 m!1066907))

(check-sat (not b!1157511) b_and!39829 (not b!1157523) (not start!98884) (not b!1157514) (not bm!55407) (not b!1157509) tp_is_empty!29019 (not b!1157513) (not b_next!24489) (not b!1157531) (not b!1157521) (not mapNonEmpty!45353) (not b!1157535) (not bm!55408) (not b!1157516) (not b!1157508) (not b!1157515) (not bm!55411) (not bm!55410) (not b!1157506) (not b!1157530) (not b_lambda!19595) (not b!1157533) (not b!1157510) (not b!1157532) (not bm!55412))
(check-sat b_and!39829 (not b_next!24489))
