; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98744 () Bool)

(assert start!98744)

(declare-fun b_free!24349 () Bool)

(declare-fun b_next!24349 () Bool)

(assert (=> start!98744 (= b_free!24349 (not b_next!24349))))

(declare-fun tp!85757 () Bool)

(declare-fun b_and!39547 () Bool)

(assert (=> start!98744 (= tp!85757 b_and!39547)))

(declare-fun b!1151066 () Bool)

(declare-fun e!654691 () Bool)

(declare-datatypes ((V!43633 0))(
  ( (V!43634 (val!14496 Int)) )
))
(declare-datatypes ((tuple2!18402 0))(
  ( (tuple2!18403 (_1!9212 (_ BitVec 64)) (_2!9212 V!43633)) )
))
(declare-datatypes ((List!25150 0))(
  ( (Nil!25147) (Cons!25146 (h!26355 tuple2!18402) (t!36491 List!25150)) )
))
(declare-datatypes ((ListLongMap!16371 0))(
  ( (ListLongMap!16372 (toList!8201 List!25150)) )
))
(declare-fun call!53731 () ListLongMap!16371)

(declare-fun call!53735 () ListLongMap!16371)

(assert (=> b!1151066 (= e!654691 (= call!53731 call!53735))))

(declare-fun lt!515256 () ListLongMap!16371)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun c!114004 () Bool)

(declare-fun call!53734 () Bool)

(declare-fun call!53737 () ListLongMap!16371)

(declare-fun bm!53727 () Bool)

(declare-fun contains!6720 (ListLongMap!16371 (_ BitVec 64)) Bool)

(assert (=> bm!53727 (= call!53734 (contains!6720 (ite c!114004 lt!515256 call!53737) k!934))))

(declare-fun b!1151067 () Bool)

(declare-fun e!654683 () Bool)

(declare-fun e!654688 () Bool)

(assert (=> b!1151067 (= e!654683 e!654688)))

(declare-fun res!765522 () Bool)

(assert (=> b!1151067 (=> (not res!765522) (not e!654688))))

(declare-datatypes ((array!74605 0))(
  ( (array!74606 (arr!35953 (Array (_ BitVec 32) (_ BitVec 64))) (size!36489 (_ BitVec 32))) )
))
(declare-fun lt!515253 () array!74605)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74605 (_ BitVec 32)) Bool)

(assert (=> b!1151067 (= res!765522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515253 mask!1564))))

(declare-fun _keys!1208 () array!74605)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1151067 (= lt!515253 (array!74606 (store (arr!35953 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36489 _keys!1208)))))

(declare-fun b!1151068 () Bool)

(declare-datatypes ((Unit!37859 0))(
  ( (Unit!37860) )
))
(declare-fun e!654696 () Unit!37859)

(declare-fun Unit!37861 () Unit!37859)

(assert (=> b!1151068 (= e!654696 Unit!37861)))

(declare-fun lt!515267 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!654694 () Bool)

(declare-fun b!1151069 () Bool)

(assert (=> b!1151069 (= e!654694 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!515267) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1151070 () Bool)

(declare-fun e!654693 () Bool)

(declare-fun tp_is_empty!28879 () Bool)

(assert (=> b!1151070 (= e!654693 tp_is_empty!28879)))

(declare-fun b!1151071 () Bool)

(declare-fun call!53730 () Bool)

(assert (=> b!1151071 call!53730))

(declare-fun lt!515266 () Unit!37859)

(declare-fun call!53736 () Unit!37859)

(assert (=> b!1151071 (= lt!515266 call!53736)))

(assert (=> b!1151071 (= e!654696 lt!515266)))

(declare-fun zeroValue!944 () V!43633)

(declare-fun c!114000 () Bool)

(declare-fun lt!515252 () ListLongMap!16371)

(declare-fun bm!53728 () Bool)

(declare-fun call!53733 () ListLongMap!16371)

(declare-fun minValue!944 () V!43633)

(declare-fun +!3619 (ListLongMap!16371 tuple2!18402) ListLongMap!16371)

(assert (=> bm!53728 (= call!53733 (+!3619 lt!515252 (ite (or c!114004 c!114000) (tuple2!18403 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18403 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!53729 () Bool)

(assert (=> bm!53729 (= call!53730 call!53734)))

(declare-fun bm!53730 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13730 0))(
  ( (ValueCellFull!13730 (v!17133 V!43633)) (EmptyCell!13730) )
))
(declare-datatypes ((array!74607 0))(
  ( (array!74608 (arr!35954 (Array (_ BitVec 32) ValueCell!13730)) (size!36490 (_ BitVec 32))) )
))
(declare-fun lt!515257 () array!74607)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4673 (array!74605 array!74607 (_ BitVec 32) (_ BitVec 32) V!43633 V!43633 (_ BitVec 32) Int) ListLongMap!16371)

(assert (=> bm!53730 (= call!53731 (getCurrentListMapNoExtraKeys!4673 lt!515253 lt!515257 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151072 () Bool)

(declare-fun e!654685 () Bool)

(assert (=> b!1151072 (= e!654685 true)))

(declare-fun e!654699 () Bool)

(assert (=> b!1151072 e!654699))

(declare-fun res!765524 () Bool)

(assert (=> b!1151072 (=> (not res!765524) (not e!654699))))

(declare-fun lt!515264 () ListLongMap!16371)

(assert (=> b!1151072 (= res!765524 (= lt!515264 lt!515252))))

(declare-fun lt!515251 () ListLongMap!16371)

(declare-fun -!1332 (ListLongMap!16371 (_ BitVec 64)) ListLongMap!16371)

(assert (=> b!1151072 (= lt!515264 (-!1332 lt!515251 k!934))))

(declare-fun lt!515259 () V!43633)

(assert (=> b!1151072 (= (-!1332 (+!3619 lt!515252 (tuple2!18403 (select (arr!35953 _keys!1208) from!1455) lt!515259)) (select (arr!35953 _keys!1208) from!1455)) lt!515252)))

(declare-fun lt!515265 () Unit!37859)

(declare-fun addThenRemoveForNewKeyIsSame!175 (ListLongMap!16371 (_ BitVec 64) V!43633) Unit!37859)

(assert (=> b!1151072 (= lt!515265 (addThenRemoveForNewKeyIsSame!175 lt!515252 (select (arr!35953 _keys!1208) from!1455) lt!515259))))

(declare-fun _values!996 () array!74607)

(declare-fun lt!515255 () V!43633)

(declare-fun get!18305 (ValueCell!13730 V!43633) V!43633)

(assert (=> b!1151072 (= lt!515259 (get!18305 (select (arr!35954 _values!996) from!1455) lt!515255))))

(declare-fun lt!515261 () Unit!37859)

(declare-fun e!654687 () Unit!37859)

(assert (=> b!1151072 (= lt!515261 e!654687)))

(declare-fun c!114001 () Bool)

(assert (=> b!1151072 (= c!114001 (contains!6720 lt!515252 k!934))))

(assert (=> b!1151072 (= lt!515252 (getCurrentListMapNoExtraKeys!4673 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53731 () Bool)

(declare-fun call!53732 () Unit!37859)

(declare-fun addStillContains!869 (ListLongMap!16371 (_ BitVec 64) V!43633 (_ BitVec 64)) Unit!37859)

(assert (=> bm!53731 (= call!53732 (addStillContains!869 lt!515252 (ite (or c!114004 c!114000) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114004 c!114000) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1151073 () Bool)

(declare-fun e!654689 () Bool)

(assert (=> b!1151073 (= e!654689 e!654685)))

(declare-fun res!765519 () Bool)

(assert (=> b!1151073 (=> res!765519 e!654685)))

(assert (=> b!1151073 (= res!765519 (not (= (select (arr!35953 _keys!1208) from!1455) k!934)))))

(assert (=> b!1151073 e!654691))

(declare-fun c!114002 () Bool)

(assert (=> b!1151073 (= c!114002 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!515260 () Unit!37859)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!569 (array!74605 array!74607 (_ BitVec 32) (_ BitVec 32) V!43633 V!43633 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37859)

(assert (=> b!1151073 (= lt!515260 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!569 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151074 () Bool)

(declare-fun res!765525 () Bool)

(assert (=> b!1151074 (=> (not res!765525) (not e!654688))))

(declare-datatypes ((List!25151 0))(
  ( (Nil!25148) (Cons!25147 (h!26356 (_ BitVec 64)) (t!36492 List!25151)) )
))
(declare-fun arrayNoDuplicates!0 (array!74605 (_ BitVec 32) List!25151) Bool)

(assert (=> b!1151074 (= res!765525 (arrayNoDuplicates!0 lt!515253 #b00000000000000000000000000000000 Nil!25148))))

(declare-fun bm!53732 () Bool)

(assert (=> bm!53732 (= call!53737 call!53733)))

(declare-fun b!1151075 () Bool)

(declare-fun e!654697 () Unit!37859)

(declare-fun lt!515269 () Unit!37859)

(assert (=> b!1151075 (= e!654697 lt!515269)))

(assert (=> b!1151075 (= lt!515269 call!53736)))

(assert (=> b!1151075 call!53730))

(declare-fun b!1151076 () Bool)

(declare-fun res!765532 () Bool)

(assert (=> b!1151076 (=> (not res!765532) (not e!654683))))

(assert (=> b!1151076 (= res!765532 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36489 _keys!1208))))))

(declare-fun b!1151077 () Bool)

(declare-fun e!654690 () Bool)

(declare-fun arrayContainsKey!0 (array!74605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1151077 (= e!654690 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1151078 () Bool)

(assert (=> b!1151078 (= e!654697 e!654696)))

(declare-fun c!113999 () Bool)

(assert (=> b!1151078 (= c!113999 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!515267))))

(declare-fun b!1151079 () Bool)

(declare-fun e!654698 () Bool)

(assert (=> b!1151079 (= e!654698 e!654689)))

(declare-fun res!765528 () Bool)

(assert (=> b!1151079 (=> res!765528 e!654689)))

(assert (=> b!1151079 (= res!765528 (not (= from!1455 i!673)))))

(declare-fun lt!515262 () ListLongMap!16371)

(assert (=> b!1151079 (= lt!515262 (getCurrentListMapNoExtraKeys!4673 lt!515253 lt!515257 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1151079 (= lt!515257 (array!74608 (store (arr!35954 _values!996) i!673 (ValueCellFull!13730 lt!515255)) (size!36490 _values!996)))))

(declare-fun dynLambda!2696 (Int (_ BitVec 64)) V!43633)

(assert (=> b!1151079 (= lt!515255 (dynLambda!2696 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1151079 (= lt!515251 (getCurrentListMapNoExtraKeys!4673 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1151080 () Bool)

(assert (=> b!1151080 (= e!654699 (= lt!515264 (getCurrentListMapNoExtraKeys!4673 lt!515253 lt!515257 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1151081 () Bool)

(declare-fun res!765527 () Bool)

(assert (=> b!1151081 (=> (not res!765527) (not e!654683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1151081 (= res!765527 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!45143 () Bool)

(declare-fun mapRes!45143 () Bool)

(declare-fun tp!85758 () Bool)

(assert (=> mapNonEmpty!45143 (= mapRes!45143 (and tp!85758 e!654693))))

(declare-fun mapRest!45143 () (Array (_ BitVec 32) ValueCell!13730))

(declare-fun mapKey!45143 () (_ BitVec 32))

(declare-fun mapValue!45143 () ValueCell!13730)

(assert (=> mapNonEmpty!45143 (= (arr!35954 _values!996) (store mapRest!45143 mapKey!45143 mapValue!45143))))

(declare-fun b!1151082 () Bool)

(declare-fun res!765530 () Bool)

(assert (=> b!1151082 (=> (not res!765530) (not e!654683))))

(assert (=> b!1151082 (= res!765530 (and (= (size!36490 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36489 _keys!1208) (size!36490 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!53733 () Bool)

(assert (=> bm!53733 (= call!53735 (getCurrentListMapNoExtraKeys!4673 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151083 () Bool)

(assert (=> b!1151083 (= e!654691 (= call!53731 (-!1332 call!53735 k!934)))))

(declare-fun b!1151084 () Bool)

(declare-fun res!765533 () Bool)

(assert (=> b!1151084 (=> (not res!765533) (not e!654683))))

(assert (=> b!1151084 (= res!765533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1151085 () Bool)

(declare-fun Unit!37862 () Unit!37859)

(assert (=> b!1151085 (= e!654687 Unit!37862)))

(assert (=> b!1151085 (= lt!515267 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1151085 (= c!114004 (and (not lt!515267) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515271 () Unit!37859)

(declare-fun e!654684 () Unit!37859)

(assert (=> b!1151085 (= lt!515271 e!654684)))

(declare-fun lt!515270 () Unit!37859)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!461 (array!74605 array!74607 (_ BitVec 32) (_ BitVec 32) V!43633 V!43633 (_ BitVec 64) (_ BitVec 32) Int) Unit!37859)

(assert (=> b!1151085 (= lt!515270 (lemmaListMapContainsThenArrayContainsFrom!461 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114003 () Bool)

(assert (=> b!1151085 (= c!114003 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765526 () Bool)

(assert (=> b!1151085 (= res!765526 e!654694)))

(assert (=> b!1151085 (=> (not res!765526) (not e!654690))))

(assert (=> b!1151085 e!654690))

(declare-fun lt!515254 () Unit!37859)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74605 (_ BitVec 32) (_ BitVec 32)) Unit!37859)

(assert (=> b!1151085 (= lt!515254 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1151085 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25148)))

(declare-fun lt!515268 () Unit!37859)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74605 (_ BitVec 64) (_ BitVec 32) List!25151) Unit!37859)

(assert (=> b!1151085 (= lt!515268 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25148))))

(assert (=> b!1151085 false))

(declare-fun res!765520 () Bool)

(assert (=> start!98744 (=> (not res!765520) (not e!654683))))

(assert (=> start!98744 (= res!765520 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36489 _keys!1208))))))

(assert (=> start!98744 e!654683))

(assert (=> start!98744 tp_is_empty!28879))

(declare-fun array_inv!27534 (array!74605) Bool)

(assert (=> start!98744 (array_inv!27534 _keys!1208)))

(assert (=> start!98744 true))

(assert (=> start!98744 tp!85757))

(declare-fun e!654686 () Bool)

(declare-fun array_inv!27535 (array!74607) Bool)

(assert (=> start!98744 (and (array_inv!27535 _values!996) e!654686)))

(declare-fun b!1151086 () Bool)

(assert (=> b!1151086 (= e!654688 (not e!654698))))

(declare-fun res!765529 () Bool)

(assert (=> b!1151086 (=> res!765529 e!654698)))

(assert (=> b!1151086 (= res!765529 (bvsgt from!1455 i!673))))

(assert (=> b!1151086 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!515263 () Unit!37859)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74605 (_ BitVec 64) (_ BitVec 32)) Unit!37859)

(assert (=> b!1151086 (= lt!515263 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1151087 () Bool)

(declare-fun res!765531 () Bool)

(assert (=> b!1151087 (=> (not res!765531) (not e!654683))))

(assert (=> b!1151087 (= res!765531 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25148))))

(declare-fun b!1151088 () Bool)

(assert (=> b!1151088 (= c!114000 (and (not lt!515267) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1151088 (= e!654684 e!654697)))

(declare-fun b!1151089 () Bool)

(declare-fun res!765521 () Bool)

(assert (=> b!1151089 (=> (not res!765521) (not e!654683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1151089 (= res!765521 (validMask!0 mask!1564))))

(declare-fun b!1151090 () Bool)

(declare-fun res!765523 () Bool)

(assert (=> b!1151090 (=> (not res!765523) (not e!654683))))

(assert (=> b!1151090 (= res!765523 (= (select (arr!35953 _keys!1208) i!673) k!934))))

(declare-fun b!1151091 () Bool)

(declare-fun e!654692 () Bool)

(assert (=> b!1151091 (= e!654692 tp_is_empty!28879)))

(declare-fun b!1151092 () Bool)

(declare-fun Unit!37863 () Unit!37859)

(assert (=> b!1151092 (= e!654687 Unit!37863)))

(declare-fun b!1151093 () Bool)

(assert (=> b!1151093 (contains!6720 (+!3619 lt!515256 (tuple2!18403 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!515250 () Unit!37859)

(assert (=> b!1151093 (= lt!515250 (addStillContains!869 lt!515256 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1151093 call!53734))

(assert (=> b!1151093 (= lt!515256 call!53733)))

(declare-fun lt!515258 () Unit!37859)

(assert (=> b!1151093 (= lt!515258 call!53732)))

(assert (=> b!1151093 (= e!654684 lt!515250)))

(declare-fun b!1151094 () Bool)

(assert (=> b!1151094 (= e!654686 (and e!654692 mapRes!45143))))

(declare-fun condMapEmpty!45143 () Bool)

(declare-fun mapDefault!45143 () ValueCell!13730)

