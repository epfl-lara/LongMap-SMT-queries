; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98976 () Bool)

(assert start!98976)

(declare-fun b_free!24581 () Bool)

(declare-fun b_next!24581 () Bool)

(assert (=> start!98976 (= b_free!24581 (not b_next!24581))))

(declare-fun tp!86454 () Bool)

(declare-fun b_and!40011 () Bool)

(assert (=> start!98976 (= tp!86454 b_and!40011)))

(declare-fun bm!56511 () Bool)

(declare-datatypes ((V!43941 0))(
  ( (V!43942 (val!14612 Int)) )
))
(declare-datatypes ((tuple2!18620 0))(
  ( (tuple2!18621 (_1!9321 (_ BitVec 64)) (_2!9321 V!43941)) )
))
(declare-datatypes ((List!25355 0))(
  ( (Nil!25352) (Cons!25351 (h!26560 tuple2!18620) (t!36928 List!25355)) )
))
(declare-datatypes ((ListLongMap!16589 0))(
  ( (ListLongMap!16590 (toList!8310 List!25355)) )
))
(declare-fun call!56514 () ListLongMap!16589)

(declare-fun call!56518 () ListLongMap!16589)

(assert (=> bm!56511 (= call!56514 call!56518)))

(declare-fun zeroValue!944 () V!43941)

(declare-datatypes ((array!75061 0))(
  ( (array!75062 (arr!36181 (Array (_ BitVec 32) (_ BitVec 64))) (size!36717 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75061)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun call!56519 () ListLongMap!16589)

(declare-datatypes ((ValueCell!13846 0))(
  ( (ValueCellFull!13846 (v!17249 V!43941)) (EmptyCell!13846) )
))
(declare-datatypes ((array!75063 0))(
  ( (array!75064 (arr!36182 (Array (_ BitVec 32) ValueCell!13846)) (size!36718 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75063)

(declare-fun minValue!944 () V!43941)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!56512 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4774 (array!75061 array!75063 (_ BitVec 32) (_ BitVec 32) V!43941 V!43941 (_ BitVec 32) Int) ListLongMap!16589)

(assert (=> bm!56512 (= call!56519 (getCurrentListMapNoExtraKeys!4774 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45491 () Bool)

(declare-fun mapRes!45491 () Bool)

(declare-fun tp!86453 () Bool)

(declare-fun e!660613 () Bool)

(assert (=> mapNonEmpty!45491 (= mapRes!45491 (and tp!86453 e!660613))))

(declare-fun mapValue!45491 () ValueCell!13846)

(declare-fun mapKey!45491 () (_ BitVec 32))

(declare-fun mapRest!45491 () (Array (_ BitVec 32) ValueCell!13846))

(assert (=> mapNonEmpty!45491 (= (arr!36182 _values!996) (store mapRest!45491 mapKey!45491 mapValue!45491))))

(declare-fun b!1161738 () Bool)

(declare-fun e!660604 () Bool)

(assert (=> b!1161738 (= e!660604 true)))

(declare-fun e!660601 () Bool)

(assert (=> b!1161738 e!660601))

(declare-fun res!770751 () Bool)

(assert (=> b!1161738 (=> (not res!770751) (not e!660601))))

(declare-fun lt!522917 () ListLongMap!16589)

(declare-fun lt!522914 () ListLongMap!16589)

(assert (=> b!1161738 (= res!770751 (= lt!522917 lt!522914))))

(declare-fun lt!522925 () ListLongMap!16589)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1416 (ListLongMap!16589 (_ BitVec 64)) ListLongMap!16589)

(assert (=> b!1161738 (= lt!522917 (-!1416 lt!522925 k!934))))

(declare-fun lt!522923 () V!43941)

(declare-fun +!3714 (ListLongMap!16589 tuple2!18620) ListLongMap!16589)

(assert (=> b!1161738 (= (-!1416 (+!3714 lt!522914 (tuple2!18621 (select (arr!36181 _keys!1208) from!1455) lt!522923)) (select (arr!36181 _keys!1208) from!1455)) lt!522914)))

(declare-datatypes ((Unit!38316 0))(
  ( (Unit!38317) )
))
(declare-fun lt!522915 () Unit!38316)

(declare-fun addThenRemoveForNewKeyIsSame!250 (ListLongMap!16589 (_ BitVec 64) V!43941) Unit!38316)

(assert (=> b!1161738 (= lt!522915 (addThenRemoveForNewKeyIsSame!250 lt!522914 (select (arr!36181 _keys!1208) from!1455) lt!522923))))

(declare-fun lt!522918 () V!43941)

(declare-fun get!18456 (ValueCell!13846 V!43941) V!43941)

(assert (=> b!1161738 (= lt!522923 (get!18456 (select (arr!36182 _values!996) from!1455) lt!522918))))

(declare-fun lt!522920 () Unit!38316)

(declare-fun e!660610 () Unit!38316)

(assert (=> b!1161738 (= lt!522920 e!660610)))

(declare-fun c!116089 () Bool)

(declare-fun contains!6815 (ListLongMap!16589 (_ BitVec 64)) Bool)

(assert (=> b!1161738 (= c!116089 (contains!6815 lt!522914 k!934))))

(assert (=> b!1161738 (= lt!522914 (getCurrentListMapNoExtraKeys!4774 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161739 () Bool)

(declare-fun Unit!38318 () Unit!38316)

(assert (=> b!1161739 (= e!660610 Unit!38318)))

(declare-fun lt!522919 () ListLongMap!16589)

(declare-fun c!116090 () Bool)

(declare-fun bm!56513 () Bool)

(declare-fun call!56515 () Bool)

(assert (=> bm!56513 (= call!56515 (contains!6815 (ite c!116090 lt!522919 call!56514) k!934))))

(declare-fun c!116088 () Bool)

(declare-fun bm!56514 () Bool)

(declare-fun call!56516 () Unit!38316)

(declare-fun addStillContains!956 (ListLongMap!16589 (_ BitVec 64) V!43941 (_ BitVec 64)) Unit!38316)

(assert (=> bm!56514 (= call!56516 (addStillContains!956 (ite c!116090 lt!522919 lt!522914) (ite c!116090 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116088 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116090 minValue!944 (ite c!116088 zeroValue!944 minValue!944)) k!934))))

(declare-fun bm!56515 () Bool)

(declare-fun lt!522926 () array!75061)

(declare-fun call!56520 () ListLongMap!16589)

(declare-fun lt!522906 () array!75063)

(assert (=> bm!56515 (= call!56520 (getCurrentListMapNoExtraKeys!4774 lt!522926 lt!522906 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161741 () Bool)

(declare-fun res!770749 () Bool)

(declare-fun e!660602 () Bool)

(assert (=> b!1161741 (=> (not res!770749) (not e!660602))))

(assert (=> b!1161741 (= res!770749 (and (= (size!36718 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36717 _keys!1208) (size!36718 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1161742 () Bool)

(declare-fun res!770750 () Bool)

(assert (=> b!1161742 (=> (not res!770750) (not e!660602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1161742 (= res!770750 (validMask!0 mask!1564))))

(declare-fun b!1161743 () Bool)

(declare-fun e!660612 () Bool)

(assert (=> b!1161743 (= e!660612 e!660604)))

(declare-fun res!770742 () Bool)

(assert (=> b!1161743 (=> res!770742 e!660604)))

(assert (=> b!1161743 (= res!770742 (not (= (select (arr!36181 _keys!1208) from!1455) k!934)))))

(declare-fun e!660608 () Bool)

(assert (=> b!1161743 e!660608))

(declare-fun c!116087 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1161743 (= c!116087 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!522908 () Unit!38316)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!646 (array!75061 array!75063 (_ BitVec 32) (_ BitVec 32) V!43941 V!43941 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38316)

(assert (=> b!1161743 (= lt!522908 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!646 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161744 () Bool)

(declare-fun e!660615 () Bool)

(assert (=> b!1161744 (= e!660615 e!660612)))

(declare-fun res!770753 () Bool)

(assert (=> b!1161744 (=> res!770753 e!660612)))

(assert (=> b!1161744 (= res!770753 (not (= from!1455 i!673)))))

(declare-fun lt!522922 () ListLongMap!16589)

(assert (=> b!1161744 (= lt!522922 (getCurrentListMapNoExtraKeys!4774 lt!522926 lt!522906 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1161744 (= lt!522906 (array!75064 (store (arr!36182 _values!996) i!673 (ValueCellFull!13846 lt!522918)) (size!36718 _values!996)))))

(declare-fun dynLambda!2770 (Int (_ BitVec 64)) V!43941)

(assert (=> b!1161744 (= lt!522918 (dynLambda!2770 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1161744 (= lt!522925 (getCurrentListMapNoExtraKeys!4774 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1161745 () Bool)

(declare-fun res!770744 () Bool)

(assert (=> b!1161745 (=> (not res!770744) (not e!660602))))

(assert (=> b!1161745 (= res!770744 (= (select (arr!36181 _keys!1208) i!673) k!934))))

(declare-fun e!660599 () Bool)

(declare-fun b!1161746 () Bool)

(declare-fun arrayContainsKey!0 (array!75061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1161746 (= e!660599 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1161747 () Bool)

(declare-fun Unit!38319 () Unit!38316)

(assert (=> b!1161747 (= e!660610 Unit!38319)))

(declare-fun lt!522916 () Bool)

(assert (=> b!1161747 (= lt!522916 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1161747 (= c!116090 (and (not lt!522916) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522921 () Unit!38316)

(declare-fun e!660609 () Unit!38316)

(assert (=> b!1161747 (= lt!522921 e!660609)))

(declare-fun lt!522911 () Unit!38316)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!541 (array!75061 array!75063 (_ BitVec 32) (_ BitVec 32) V!43941 V!43941 (_ BitVec 64) (_ BitVec 32) Int) Unit!38316)

(assert (=> b!1161747 (= lt!522911 (lemmaListMapContainsThenArrayContainsFrom!541 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116092 () Bool)

(assert (=> b!1161747 (= c!116092 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770739 () Bool)

(declare-fun e!660600 () Bool)

(assert (=> b!1161747 (= res!770739 e!660600)))

(assert (=> b!1161747 (=> (not res!770739) (not e!660599))))

(assert (=> b!1161747 e!660599))

(declare-fun lt!522912 () Unit!38316)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75061 (_ BitVec 32) (_ BitVec 32)) Unit!38316)

(assert (=> b!1161747 (= lt!522912 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25356 0))(
  ( (Nil!25353) (Cons!25352 (h!26561 (_ BitVec 64)) (t!36929 List!25356)) )
))
(declare-fun arrayNoDuplicates!0 (array!75061 (_ BitVec 32) List!25356) Bool)

(assert (=> b!1161747 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25353)))

(declare-fun lt!522927 () Unit!38316)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75061 (_ BitVec 64) (_ BitVec 32) List!25356) Unit!38316)

(assert (=> b!1161747 (= lt!522927 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25353))))

(assert (=> b!1161747 false))

(declare-fun b!1161748 () Bool)

(assert (=> b!1161748 (= c!116088 (and (not lt!522916) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!660607 () Unit!38316)

(assert (=> b!1161748 (= e!660609 e!660607)))

(declare-fun bm!56516 () Bool)

(assert (=> bm!56516 (= call!56518 (+!3714 lt!522914 (ite (or c!116090 c!116088) (tuple2!18621 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18621 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1161749 () Bool)

(assert (=> b!1161749 (= e!660608 (= call!56520 call!56519))))

(declare-fun b!1161750 () Bool)

(declare-fun e!660606 () Bool)

(declare-fun tp_is_empty!29111 () Bool)

(assert (=> b!1161750 (= e!660606 tp_is_empty!29111)))

(declare-fun bm!56517 () Bool)

(declare-fun call!56517 () Bool)

(assert (=> bm!56517 (= call!56517 call!56515)))

(declare-fun b!1161751 () Bool)

(assert (=> b!1161751 (= e!660613 tp_is_empty!29111)))

(declare-fun b!1161752 () Bool)

(assert (=> b!1161752 (= e!660600 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!522916) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1161753 () Bool)

(declare-fun e!660603 () Unit!38316)

(assert (=> b!1161753 (= e!660607 e!660603)))

(declare-fun c!116091 () Bool)

(assert (=> b!1161753 (= c!116091 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!522916))))

(declare-fun b!1161754 () Bool)

(declare-fun res!770752 () Bool)

(assert (=> b!1161754 (=> (not res!770752) (not e!660602))))

(assert (=> b!1161754 (= res!770752 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25353))))

(declare-fun b!1161755 () Bool)

(declare-fun Unit!38320 () Unit!38316)

(assert (=> b!1161755 (= e!660603 Unit!38320)))

(declare-fun b!1161756 () Bool)

(assert (=> b!1161756 (= e!660608 (= call!56520 (-!1416 call!56519 k!934)))))

(declare-fun b!1161740 () Bool)

(declare-fun res!770741 () Bool)

(assert (=> b!1161740 (=> (not res!770741) (not e!660602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1161740 (= res!770741 (validKeyInArray!0 k!934))))

(declare-fun res!770747 () Bool)

(assert (=> start!98976 (=> (not res!770747) (not e!660602))))

(assert (=> start!98976 (= res!770747 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36717 _keys!1208))))))

(assert (=> start!98976 e!660602))

(assert (=> start!98976 tp_is_empty!29111))

(declare-fun array_inv!27684 (array!75061) Bool)

(assert (=> start!98976 (array_inv!27684 _keys!1208)))

(assert (=> start!98976 true))

(assert (=> start!98976 tp!86454))

(declare-fun e!660614 () Bool)

(declare-fun array_inv!27685 (array!75063) Bool)

(assert (=> start!98976 (and (array_inv!27685 _values!996) e!660614)))

(declare-fun b!1161757 () Bool)

(declare-fun res!770746 () Bool)

(assert (=> b!1161757 (=> (not res!770746) (not e!660602))))

(assert (=> b!1161757 (= res!770746 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36717 _keys!1208))))))

(declare-fun mapIsEmpty!45491 () Bool)

(assert (=> mapIsEmpty!45491 mapRes!45491))

(declare-fun b!1161758 () Bool)

(declare-fun e!660611 () Bool)

(assert (=> b!1161758 (= e!660602 e!660611)))

(declare-fun res!770748 () Bool)

(assert (=> b!1161758 (=> (not res!770748) (not e!660611))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75061 (_ BitVec 32)) Bool)

(assert (=> b!1161758 (= res!770748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!522926 mask!1564))))

(assert (=> b!1161758 (= lt!522926 (array!75062 (store (arr!36181 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36717 _keys!1208)))))

(declare-fun b!1161759 () Bool)

(declare-fun res!770743 () Bool)

(assert (=> b!1161759 (=> (not res!770743) (not e!660602))))

(assert (=> b!1161759 (= res!770743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1161760 () Bool)

(assert (=> b!1161760 call!56517))

(declare-fun lt!522910 () Unit!38316)

(declare-fun call!56521 () Unit!38316)

(assert (=> b!1161760 (= lt!522910 call!56521)))

(assert (=> b!1161760 (= e!660603 lt!522910)))

(declare-fun b!1161761 () Bool)

(declare-fun res!770745 () Bool)

(assert (=> b!1161761 (=> (not res!770745) (not e!660611))))

(assert (=> b!1161761 (= res!770745 (arrayNoDuplicates!0 lt!522926 #b00000000000000000000000000000000 Nil!25353))))

(declare-fun bm!56518 () Bool)

(assert (=> bm!56518 (= call!56521 call!56516)))

(declare-fun b!1161762 () Bool)

(assert (=> b!1161762 (= e!660611 (not e!660615))))

(declare-fun res!770740 () Bool)

(assert (=> b!1161762 (=> res!770740 e!660615)))

(assert (=> b!1161762 (= res!770740 (bvsgt from!1455 i!673))))

(assert (=> b!1161762 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!522913 () Unit!38316)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75061 (_ BitVec 64) (_ BitVec 32)) Unit!38316)

(assert (=> b!1161762 (= lt!522913 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1161763 () Bool)

(assert (=> b!1161763 (= e!660601 (= lt!522917 (getCurrentListMapNoExtraKeys!4774 lt!522926 lt!522906 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1161764 () Bool)

(assert (=> b!1161764 (contains!6815 (+!3714 lt!522919 (tuple2!18621 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!522907 () Unit!38316)

(assert (=> b!1161764 (= lt!522907 call!56516)))

(assert (=> b!1161764 call!56515))

(assert (=> b!1161764 (= lt!522919 call!56518)))

(declare-fun lt!522924 () Unit!38316)

(assert (=> b!1161764 (= lt!522924 (addStillContains!956 lt!522914 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1161764 (= e!660609 lt!522907)))

(declare-fun b!1161765 () Bool)

(declare-fun lt!522909 () Unit!38316)

(assert (=> b!1161765 (= e!660607 lt!522909)))

(assert (=> b!1161765 (= lt!522909 call!56521)))

(assert (=> b!1161765 call!56517))

(declare-fun b!1161766 () Bool)

(assert (=> b!1161766 (= e!660600 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1161767 () Bool)

(assert (=> b!1161767 (= e!660614 (and e!660606 mapRes!45491))))

(declare-fun condMapEmpty!45491 () Bool)

(declare-fun mapDefault!45491 () ValueCell!13846)

