; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98884 () Bool)

(assert start!98884)

(declare-fun b_free!24253 () Bool)

(declare-fun b_next!24253 () Bool)

(assert (=> start!98884 (= b_free!24253 (not b_next!24253))))

(declare-fun tp!85469 () Bool)

(declare-fun b_and!39357 () Bool)

(assert (=> start!98884 (= tp!85469 b_and!39357)))

(declare-fun res!763867 () Bool)

(declare-fun e!653076 () Bool)

(assert (=> start!98884 (=> (not res!763867) (not e!653076))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74461 0))(
  ( (array!74462 (arr!35875 (Array (_ BitVec 32) (_ BitVec 64))) (size!36412 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74461)

(assert (=> start!98884 (= res!763867 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36412 _keys!1208))))))

(assert (=> start!98884 e!653076))

(declare-fun tp_is_empty!28783 () Bool)

(assert (=> start!98884 tp_is_empty!28783))

(declare-fun array_inv!27532 (array!74461) Bool)

(assert (=> start!98884 (array_inv!27532 _keys!1208)))

(assert (=> start!98884 true))

(assert (=> start!98884 tp!85469))

(declare-datatypes ((V!43505 0))(
  ( (V!43506 (val!14448 Int)) )
))
(declare-datatypes ((ValueCell!13682 0))(
  ( (ValueCellFull!13682 (v!17081 V!43505)) (EmptyCell!13682) )
))
(declare-datatypes ((array!74463 0))(
  ( (array!74464 (arr!35876 (Array (_ BitVec 32) ValueCell!13682)) (size!36413 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74463)

(declare-fun e!653077 () Bool)

(declare-fun array_inv!27533 (array!74463) Bool)

(assert (=> start!98884 (and (array_inv!27533 _values!996) e!653077)))

(declare-fun mapNonEmpty!44999 () Bool)

(declare-fun mapRes!44999 () Bool)

(declare-fun tp!85470 () Bool)

(declare-fun e!653073 () Bool)

(assert (=> mapNonEmpty!44999 (= mapRes!44999 (and tp!85470 e!653073))))

(declare-fun mapRest!44999 () (Array (_ BitVec 32) ValueCell!13682))

(declare-fun mapKey!44999 () (_ BitVec 32))

(declare-fun mapValue!44999 () ValueCell!13682)

(assert (=> mapNonEmpty!44999 (= (arr!35876 _values!996) (store mapRest!44999 mapKey!44999 mapValue!44999))))

(declare-fun b!1147939 () Bool)

(declare-datatypes ((Unit!37637 0))(
  ( (Unit!37638) )
))
(declare-fun e!653083 () Unit!37637)

(declare-fun Unit!37639 () Unit!37637)

(assert (=> b!1147939 (= e!653083 Unit!37639)))

(declare-fun lt!512648 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1147939 (= lt!512648 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113536 () Bool)

(assert (=> b!1147939 (= c!113536 (and (not lt!512648) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512649 () Unit!37637)

(declare-fun e!653078 () Unit!37637)

(assert (=> b!1147939 (= lt!512649 e!653078)))

(declare-fun zeroValue!944 () V!43505)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!43505)

(declare-fun lt!512652 () Unit!37637)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!428 (array!74461 array!74463 (_ BitVec 32) (_ BitVec 32) V!43505 V!43505 (_ BitVec 64) (_ BitVec 32) Int) Unit!37637)

(assert (=> b!1147939 (= lt!512652 (lemmaListMapContainsThenArrayContainsFrom!428 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113538 () Bool)

(assert (=> b!1147939 (= c!113538 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763876 () Bool)

(declare-fun e!653071 () Bool)

(assert (=> b!1147939 (= res!763876 e!653071)))

(declare-fun e!653070 () Bool)

(assert (=> b!1147939 (=> (not res!763876) (not e!653070))))

(assert (=> b!1147939 e!653070))

(declare-fun lt!512651 () Unit!37637)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74461 (_ BitVec 32) (_ BitVec 32)) Unit!37637)

(assert (=> b!1147939 (= lt!512651 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25078 0))(
  ( (Nil!25075) (Cons!25074 (h!26292 (_ BitVec 64)) (t!36315 List!25078)) )
))
(declare-fun arrayNoDuplicates!0 (array!74461 (_ BitVec 32) List!25078) Bool)

(assert (=> b!1147939 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25075)))

(declare-fun lt!512646 () Unit!37637)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74461 (_ BitVec 64) (_ BitVec 32) List!25078) Unit!37637)

(assert (=> b!1147939 (= lt!512646 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25075))))

(assert (=> b!1147939 false))

(declare-fun b!1147940 () Bool)

(declare-fun res!763877 () Bool)

(declare-fun e!653080 () Bool)

(assert (=> b!1147940 (=> (not res!763877) (not e!653080))))

(declare-fun lt!512661 () array!74461)

(assert (=> b!1147940 (= res!763877 (arrayNoDuplicates!0 lt!512661 #b00000000000000000000000000000000 Nil!25075))))

(declare-fun b!1147941 () Bool)

(declare-fun res!763874 () Bool)

(assert (=> b!1147941 (=> (not res!763874) (not e!653076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1147941 (= res!763874 (validKeyInArray!0 k0!934))))

(declare-fun b!1147942 () Bool)

(declare-fun e!653074 () Bool)

(declare-datatypes ((tuple2!18324 0))(
  ( (tuple2!18325 (_1!9173 (_ BitVec 64)) (_2!9173 V!43505)) )
))
(declare-datatypes ((List!25079 0))(
  ( (Nil!25076) (Cons!25075 (h!26293 tuple2!18324) (t!36316 List!25079)) )
))
(declare-datatypes ((ListLongMap!16301 0))(
  ( (ListLongMap!16302 (toList!8166 List!25079)) )
))
(declare-fun call!52646 () ListLongMap!16301)

(declare-fun call!52643 () ListLongMap!16301)

(assert (=> b!1147942 (= e!653074 (= call!52646 call!52643))))

(declare-fun b!1147943 () Bool)

(declare-fun e!653082 () Unit!37637)

(declare-fun e!653081 () Unit!37637)

(assert (=> b!1147943 (= e!653082 e!653081)))

(declare-fun c!113535 () Bool)

(assert (=> b!1147943 (= c!113535 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512648))))

(declare-fun bm!52640 () Bool)

(declare-fun call!52644 () ListLongMap!16301)

(declare-fun call!52645 () ListLongMap!16301)

(assert (=> bm!52640 (= call!52644 call!52645)))

(declare-fun b!1147944 () Bool)

(declare-fun c!113533 () Bool)

(assert (=> b!1147944 (= c!113533 (and (not lt!512648) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1147944 (= e!653078 e!653082)))

(declare-fun lt!512663 () ListLongMap!16301)

(declare-fun e!653072 () Bool)

(declare-fun b!1147945 () Bool)

(declare-fun lt!512645 () ListLongMap!16301)

(declare-fun -!1291 (ListLongMap!16301 (_ BitVec 64)) ListLongMap!16301)

(assert (=> b!1147945 (= e!653072 (= (-!1291 lt!512663 k0!934) lt!512645))))

(declare-fun b!1147946 () Bool)

(declare-fun Unit!37640 () Unit!37637)

(assert (=> b!1147946 (= e!653081 Unit!37640)))

(declare-fun b!1147947 () Bool)

(assert (=> b!1147947 (= e!653071 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512648) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1147948 () Bool)

(declare-fun Unit!37641 () Unit!37637)

(assert (=> b!1147948 (= e!653083 Unit!37641)))

(declare-fun b!1147949 () Bool)

(declare-fun e!653075 () Bool)

(declare-fun e!653079 () Bool)

(assert (=> b!1147949 (= e!653075 e!653079)))

(declare-fun res!763871 () Bool)

(assert (=> b!1147949 (=> res!763871 e!653079)))

(assert (=> b!1147949 (= res!763871 (not (= (select (arr!35875 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1147949 e!653074))

(declare-fun c!113537 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1147949 (= c!113537 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!512659 () Unit!37637)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!538 (array!74461 array!74463 (_ BitVec 32) (_ BitVec 32) V!43505 V!43505 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37637)

(assert (=> b!1147949 (= lt!512659 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!538 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147950 () Bool)

(assert (=> b!1147950 (= e!653079 true)))

(assert (=> b!1147950 e!653072))

(declare-fun res!763870 () Bool)

(assert (=> b!1147950 (=> (not res!763870) (not e!653072))))

(declare-fun lt!512655 () V!43505)

(declare-fun +!3606 (ListLongMap!16301 tuple2!18324) ListLongMap!16301)

(assert (=> b!1147950 (= res!763870 (= (-!1291 (+!3606 lt!512645 (tuple2!18325 (select (arr!35875 _keys!1208) from!1455) lt!512655)) (select (arr!35875 _keys!1208) from!1455)) lt!512645))))

(declare-fun lt!512657 () Unit!37637)

(declare-fun addThenRemoveForNewKeyIsSame!144 (ListLongMap!16301 (_ BitVec 64) V!43505) Unit!37637)

(assert (=> b!1147950 (= lt!512657 (addThenRemoveForNewKeyIsSame!144 lt!512645 (select (arr!35875 _keys!1208) from!1455) lt!512655))))

(declare-fun lt!512664 () V!43505)

(declare-fun get!18273 (ValueCell!13682 V!43505) V!43505)

(assert (=> b!1147950 (= lt!512655 (get!18273 (select (arr!35876 _values!996) from!1455) lt!512664))))

(declare-fun lt!512653 () Unit!37637)

(assert (=> b!1147950 (= lt!512653 e!653083)))

(declare-fun c!113534 () Bool)

(declare-fun contains!6705 (ListLongMap!16301 (_ BitVec 64)) Bool)

(assert (=> b!1147950 (= c!113534 (contains!6705 lt!512645 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4670 (array!74461 array!74463 (_ BitVec 32) (_ BitVec 32) V!43505 V!43505 (_ BitVec 32) Int) ListLongMap!16301)

(assert (=> b!1147950 (= lt!512645 (getCurrentListMapNoExtraKeys!4670 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147951 () Bool)

(declare-fun call!52649 () Bool)

(assert (=> b!1147951 call!52649))

(declare-fun lt!512662 () Unit!37637)

(declare-fun call!52647 () Unit!37637)

(assert (=> b!1147951 (= lt!512662 call!52647)))

(assert (=> b!1147951 (= e!653081 lt!512662)))

(declare-fun lt!512658 () ListLongMap!16301)

(declare-fun bm!52641 () Bool)

(assert (=> bm!52641 (= call!52645 (+!3606 (ite c!113536 lt!512658 lt!512645) (ite c!113536 (tuple2!18325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113533 (tuple2!18325 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1147952 () Bool)

(declare-fun e!653068 () Bool)

(assert (=> b!1147952 (= e!653077 (and e!653068 mapRes!44999))))

(declare-fun condMapEmpty!44999 () Bool)

(declare-fun mapDefault!44999 () ValueCell!13682)

(assert (=> b!1147952 (= condMapEmpty!44999 (= (arr!35876 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13682)) mapDefault!44999)))))

(declare-fun b!1147953 () Bool)

(assert (=> b!1147953 (= e!653074 (= call!52646 (-!1291 call!52643 k0!934)))))

(declare-fun b!1147954 () Bool)

(assert (=> b!1147954 (contains!6705 call!52645 k0!934)))

(declare-fun lt!512650 () Unit!37637)

(declare-fun call!52648 () Unit!37637)

(assert (=> b!1147954 (= lt!512650 call!52648)))

(declare-fun call!52650 () Bool)

(assert (=> b!1147954 call!52650))

(assert (=> b!1147954 (= lt!512658 (+!3606 lt!512645 (tuple2!18325 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!512656 () Unit!37637)

(declare-fun addStillContains!833 (ListLongMap!16301 (_ BitVec 64) V!43505 (_ BitVec 64)) Unit!37637)

(assert (=> b!1147954 (= lt!512656 (addStillContains!833 lt!512645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1147954 (= e!653078 lt!512650)))

(declare-fun b!1147955 () Bool)

(declare-fun res!763878 () Bool)

(assert (=> b!1147955 (=> (not res!763878) (not e!653076))))

(assert (=> b!1147955 (= res!763878 (and (= (size!36413 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36412 _keys!1208) (size!36413 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1147956 () Bool)

(declare-fun res!763873 () Bool)

(assert (=> b!1147956 (=> (not res!763873) (not e!653076))))

(assert (=> b!1147956 (= res!763873 (= (select (arr!35875 _keys!1208) i!673) k0!934))))

(declare-fun bm!52642 () Bool)

(assert (=> bm!52642 (= call!52648 (addStillContains!833 (ite c!113536 lt!512658 lt!512645) (ite c!113536 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113533 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113536 minValue!944 (ite c!113533 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1147957 () Bool)

(declare-fun res!763868 () Bool)

(assert (=> b!1147957 (=> (not res!763868) (not e!653076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1147957 (= res!763868 (validMask!0 mask!1564))))

(declare-fun b!1147958 () Bool)

(declare-fun arrayContainsKey!0 (array!74461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1147958 (= e!653071 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147959 () Bool)

(assert (=> b!1147959 (= e!653070 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!52643 () Bool)

(assert (=> bm!52643 (= call!52647 call!52648)))

(declare-fun b!1147960 () Bool)

(declare-fun lt!512665 () Unit!37637)

(assert (=> b!1147960 (= e!653082 lt!512665)))

(assert (=> b!1147960 (= lt!512665 call!52647)))

(assert (=> b!1147960 call!52649))

(declare-fun bm!52644 () Bool)

(assert (=> bm!52644 (= call!52643 (getCurrentListMapNoExtraKeys!4670 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147961 () Bool)

(declare-fun e!653067 () Bool)

(assert (=> b!1147961 (= e!653067 e!653075)))

(declare-fun res!763881 () Bool)

(assert (=> b!1147961 (=> res!763881 e!653075)))

(assert (=> b!1147961 (= res!763881 (not (= from!1455 i!673)))))

(declare-fun lt!512654 () array!74463)

(declare-fun lt!512647 () ListLongMap!16301)

(assert (=> b!1147961 (= lt!512647 (getCurrentListMapNoExtraKeys!4670 lt!512661 lt!512654 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1147961 (= lt!512654 (array!74464 (store (arr!35876 _values!996) i!673 (ValueCellFull!13682 lt!512664)) (size!36413 _values!996)))))

(declare-fun dynLambda!2697 (Int (_ BitVec 64)) V!43505)

(assert (=> b!1147961 (= lt!512664 (dynLambda!2697 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1147961 (= lt!512663 (getCurrentListMapNoExtraKeys!4670 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1147962 () Bool)

(declare-fun res!763879 () Bool)

(assert (=> b!1147962 (=> (not res!763879) (not e!653076))))

(assert (=> b!1147962 (= res!763879 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36412 _keys!1208))))))

(declare-fun mapIsEmpty!44999 () Bool)

(assert (=> mapIsEmpty!44999 mapRes!44999))

(declare-fun b!1147963 () Bool)

(declare-fun res!763872 () Bool)

(assert (=> b!1147963 (=> (not res!763872) (not e!653076))))

(assert (=> b!1147963 (= res!763872 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25075))))

(declare-fun b!1147964 () Bool)

(assert (=> b!1147964 (= e!653080 (not e!653067))))

(declare-fun res!763880 () Bool)

(assert (=> b!1147964 (=> res!763880 e!653067)))

(assert (=> b!1147964 (= res!763880 (bvsgt from!1455 i!673))))

(assert (=> b!1147964 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!512660 () Unit!37637)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74461 (_ BitVec 64) (_ BitVec 32)) Unit!37637)

(assert (=> b!1147964 (= lt!512660 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1147965 () Bool)

(assert (=> b!1147965 (= e!653076 e!653080)))

(declare-fun res!763869 () Bool)

(assert (=> b!1147965 (=> (not res!763869) (not e!653080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74461 (_ BitVec 32)) Bool)

(assert (=> b!1147965 (= res!763869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512661 mask!1564))))

(assert (=> b!1147965 (= lt!512661 (array!74462 (store (arr!35875 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36412 _keys!1208)))))

(declare-fun bm!52645 () Bool)

(assert (=> bm!52645 (= call!52650 (contains!6705 (ite c!113536 lt!512658 call!52644) k0!934))))

(declare-fun b!1147966 () Bool)

(assert (=> b!1147966 (= e!653068 tp_is_empty!28783)))

(declare-fun bm!52646 () Bool)

(assert (=> bm!52646 (= call!52646 (getCurrentListMapNoExtraKeys!4670 lt!512661 lt!512654 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147967 () Bool)

(declare-fun res!763875 () Bool)

(assert (=> b!1147967 (=> (not res!763875) (not e!653076))))

(assert (=> b!1147967 (= res!763875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!52647 () Bool)

(assert (=> bm!52647 (= call!52649 call!52650)))

(declare-fun b!1147968 () Bool)

(assert (=> b!1147968 (= e!653073 tp_is_empty!28783)))

(assert (= (and start!98884 res!763867) b!1147957))

(assert (= (and b!1147957 res!763868) b!1147955))

(assert (= (and b!1147955 res!763878) b!1147967))

(assert (= (and b!1147967 res!763875) b!1147963))

(assert (= (and b!1147963 res!763872) b!1147962))

(assert (= (and b!1147962 res!763879) b!1147941))

(assert (= (and b!1147941 res!763874) b!1147956))

(assert (= (and b!1147956 res!763873) b!1147965))

(assert (= (and b!1147965 res!763869) b!1147940))

(assert (= (and b!1147940 res!763877) b!1147964))

(assert (= (and b!1147964 (not res!763880)) b!1147961))

(assert (= (and b!1147961 (not res!763881)) b!1147949))

(assert (= (and b!1147949 c!113537) b!1147953))

(assert (= (and b!1147949 (not c!113537)) b!1147942))

(assert (= (or b!1147953 b!1147942) bm!52646))

(assert (= (or b!1147953 b!1147942) bm!52644))

(assert (= (and b!1147949 (not res!763871)) b!1147950))

(assert (= (and b!1147950 c!113534) b!1147939))

(assert (= (and b!1147950 (not c!113534)) b!1147948))

(assert (= (and b!1147939 c!113536) b!1147954))

(assert (= (and b!1147939 (not c!113536)) b!1147944))

(assert (= (and b!1147944 c!113533) b!1147960))

(assert (= (and b!1147944 (not c!113533)) b!1147943))

(assert (= (and b!1147943 c!113535) b!1147951))

(assert (= (and b!1147943 (not c!113535)) b!1147946))

(assert (= (or b!1147960 b!1147951) bm!52643))

(assert (= (or b!1147960 b!1147951) bm!52640))

(assert (= (or b!1147960 b!1147951) bm!52647))

(assert (= (or b!1147954 bm!52647) bm!52645))

(assert (= (or b!1147954 bm!52643) bm!52642))

(assert (= (or b!1147954 bm!52640) bm!52641))

(assert (= (and b!1147939 c!113538) b!1147958))

(assert (= (and b!1147939 (not c!113538)) b!1147947))

(assert (= (and b!1147939 res!763876) b!1147959))

(assert (= (and b!1147950 res!763870) b!1147945))

(assert (= (and b!1147952 condMapEmpty!44999) mapIsEmpty!44999))

(assert (= (and b!1147952 (not condMapEmpty!44999)) mapNonEmpty!44999))

(get-info :version)

(assert (= (and mapNonEmpty!44999 ((_ is ValueCellFull!13682) mapValue!44999)) b!1147968))

(assert (= (and b!1147952 ((_ is ValueCellFull!13682) mapDefault!44999)) b!1147966))

(assert (= start!98884 b!1147952))

(declare-fun b_lambda!19353 () Bool)

(assert (=> (not b_lambda!19353) (not b!1147961)))

(declare-fun t!36314 () Bool)

(declare-fun tb!9057 () Bool)

(assert (=> (and start!98884 (= defaultEntry!1004 defaultEntry!1004) t!36314) tb!9057))

(declare-fun result!18687 () Bool)

(assert (=> tb!9057 (= result!18687 tp_is_empty!28783)))

(assert (=> b!1147961 t!36314))

(declare-fun b_and!39359 () Bool)

(assert (= b_and!39357 (and (=> t!36314 result!18687) b_and!39359)))

(declare-fun m!1058953 () Bool)

(assert (=> b!1147964 m!1058953))

(declare-fun m!1058955 () Bool)

(assert (=> b!1147964 m!1058955))

(declare-fun m!1058957 () Bool)

(assert (=> b!1147950 m!1058957))

(declare-fun m!1058959 () Bool)

(assert (=> b!1147950 m!1058959))

(declare-fun m!1058961 () Bool)

(assert (=> b!1147950 m!1058961))

(declare-fun m!1058963 () Bool)

(assert (=> b!1147950 m!1058963))

(declare-fun m!1058965 () Bool)

(assert (=> b!1147950 m!1058965))

(declare-fun m!1058967 () Bool)

(assert (=> b!1147950 m!1058967))

(assert (=> b!1147950 m!1058959))

(declare-fun m!1058969 () Bool)

(assert (=> b!1147950 m!1058969))

(assert (=> b!1147950 m!1058963))

(declare-fun m!1058971 () Bool)

(assert (=> b!1147950 m!1058971))

(assert (=> b!1147950 m!1058967))

(assert (=> b!1147950 m!1058959))

(declare-fun m!1058973 () Bool)

(assert (=> bm!52645 m!1058973))

(declare-fun m!1058975 () Bool)

(assert (=> mapNonEmpty!44999 m!1058975))

(assert (=> b!1147949 m!1058959))

(declare-fun m!1058977 () Bool)

(assert (=> b!1147949 m!1058977))

(declare-fun m!1058979 () Bool)

(assert (=> b!1147965 m!1058979))

(declare-fun m!1058981 () Bool)

(assert (=> b!1147965 m!1058981))

(declare-fun m!1058983 () Bool)

(assert (=> b!1147961 m!1058983))

(declare-fun m!1058985 () Bool)

(assert (=> b!1147961 m!1058985))

(declare-fun m!1058987 () Bool)

(assert (=> b!1147961 m!1058987))

(declare-fun m!1058989 () Bool)

(assert (=> b!1147961 m!1058989))

(declare-fun m!1058991 () Bool)

(assert (=> bm!52646 m!1058991))

(declare-fun m!1058993 () Bool)

(assert (=> b!1147945 m!1058993))

(declare-fun m!1058995 () Bool)

(assert (=> b!1147958 m!1058995))

(declare-fun m!1058997 () Bool)

(assert (=> b!1147954 m!1058997))

(declare-fun m!1058999 () Bool)

(assert (=> b!1147954 m!1058999))

(declare-fun m!1059001 () Bool)

(assert (=> b!1147954 m!1059001))

(declare-fun m!1059003 () Bool)

(assert (=> b!1147956 m!1059003))

(declare-fun m!1059005 () Bool)

(assert (=> b!1147941 m!1059005))

(declare-fun m!1059007 () Bool)

(assert (=> bm!52642 m!1059007))

(declare-fun m!1059009 () Bool)

(assert (=> b!1147967 m!1059009))

(assert (=> bm!52644 m!1058957))

(declare-fun m!1059011 () Bool)

(assert (=> b!1147940 m!1059011))

(declare-fun m!1059013 () Bool)

(assert (=> b!1147953 m!1059013))

(declare-fun m!1059015 () Bool)

(assert (=> start!98884 m!1059015))

(declare-fun m!1059017 () Bool)

(assert (=> start!98884 m!1059017))

(assert (=> b!1147959 m!1058995))

(declare-fun m!1059019 () Bool)

(assert (=> b!1147957 m!1059019))

(declare-fun m!1059021 () Bool)

(assert (=> b!1147963 m!1059021))

(declare-fun m!1059023 () Bool)

(assert (=> b!1147939 m!1059023))

(declare-fun m!1059025 () Bool)

(assert (=> b!1147939 m!1059025))

(declare-fun m!1059027 () Bool)

(assert (=> b!1147939 m!1059027))

(declare-fun m!1059029 () Bool)

(assert (=> b!1147939 m!1059029))

(declare-fun m!1059031 () Bool)

(assert (=> bm!52641 m!1059031))

(check-sat (not b_lambda!19353) (not b!1147953) (not b!1147950) (not bm!52641) (not b!1147961) (not bm!52642) (not mapNonEmpty!44999) (not b!1147957) (not b!1147963) (not b!1147965) (not b_next!24253) b_and!39359 (not bm!52646) (not bm!52644) (not b!1147939) (not bm!52645) (not b!1147967) (not b!1147949) (not b!1147954) (not b!1147940) (not b!1147964) (not start!98884) (not b!1147958) tp_is_empty!28783 (not b!1147959) (not b!1147945) (not b!1147941))
(check-sat b_and!39359 (not b_next!24253))
