; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98942 () Bool)

(assert start!98942)

(declare-fun b_free!24547 () Bool)

(declare-fun b_next!24547 () Bool)

(assert (=> start!98942 (= b_free!24547 (not b_next!24547))))

(declare-fun tp!86352 () Bool)

(declare-fun b_and!39943 () Bool)

(assert (=> start!98942 (= tp!86352 b_and!39943)))

(declare-fun b!1160174 () Bool)

(declare-fun res!769975 () Bool)

(declare-fun e!659734 () Bool)

(assert (=> b!1160174 (=> (not res!769975) (not e!659734))))

(declare-datatypes ((array!74995 0))(
  ( (array!74996 (arr!36148 (Array (_ BitVec 32) (_ BitVec 64))) (size!36684 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74995)

(declare-datatypes ((List!25325 0))(
  ( (Nil!25322) (Cons!25321 (h!26530 (_ BitVec 64)) (t!36864 List!25325)) )
))
(declare-fun arrayNoDuplicates!0 (array!74995 (_ BitVec 32) List!25325) Bool)

(assert (=> b!1160174 (= res!769975 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25322))))

(declare-fun b!1160175 () Bool)

(declare-datatypes ((Unit!38245 0))(
  ( (Unit!38246) )
))
(declare-fun e!659732 () Unit!38245)

(declare-fun Unit!38247 () Unit!38245)

(assert (=> b!1160175 (= e!659732 Unit!38247)))

(declare-datatypes ((V!43897 0))(
  ( (V!43898 (val!14595 Int)) )
))
(declare-fun zeroValue!944 () V!43897)

(declare-fun e!659739 () Bool)

(declare-datatypes ((tuple2!18588 0))(
  ( (tuple2!18589 (_1!9305 (_ BitVec 64)) (_2!9305 V!43897)) )
))
(declare-datatypes ((List!25326 0))(
  ( (Nil!25323) (Cons!25322 (h!26531 tuple2!18588) (t!36865 List!25326)) )
))
(declare-datatypes ((ListLongMap!16557 0))(
  ( (ListLongMap!16558 (toList!8294 List!25326)) )
))
(declare-fun lt!521804 () ListLongMap!16557)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43897)

(declare-fun lt!521792 () array!74995)

(declare-fun b!1160176 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13829 0))(
  ( (ValueCellFull!13829 (v!17232 V!43897)) (EmptyCell!13829) )
))
(declare-datatypes ((array!74997 0))(
  ( (array!74998 (arr!36149 (Array (_ BitVec 32) ValueCell!13829)) (size!36685 (_ BitVec 32))) )
))
(declare-fun lt!521805 () array!74997)

(declare-fun getCurrentListMapNoExtraKeys!4758 (array!74995 array!74997 (_ BitVec 32) (_ BitVec 32) V!43897 V!43897 (_ BitVec 32) Int) ListLongMap!16557)

(assert (=> b!1160176 (= e!659739 (= lt!521804 (getCurrentListMapNoExtraKeys!4758 lt!521792 lt!521805 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1160177 () Bool)

(declare-fun call!56110 () ListLongMap!16557)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6800 (ListLongMap!16557 (_ BitVec 64)) Bool)

(assert (=> b!1160177 (contains!6800 call!56110 k!934)))

(declare-fun lt!521788 () Unit!38245)

(declare-fun lt!521801 () ListLongMap!16557)

(declare-fun addStillContains!941 (ListLongMap!16557 (_ BitVec 64) V!43897 (_ BitVec 64)) Unit!38245)

(assert (=> b!1160177 (= lt!521788 (addStillContains!941 lt!521801 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!56106 () Bool)

(assert (=> b!1160177 call!56106))

(declare-fun lt!521791 () ListLongMap!16557)

(declare-fun +!3699 (ListLongMap!16557 tuple2!18588) ListLongMap!16557)

(assert (=> b!1160177 (= lt!521801 (+!3699 lt!521791 (tuple2!18589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!521784 () Unit!38245)

(declare-fun call!56112 () Unit!38245)

(assert (=> b!1160177 (= lt!521784 call!56112)))

(declare-fun e!659736 () Unit!38245)

(assert (=> b!1160177 (= e!659736 lt!521788)))

(declare-fun b!1160178 () Bool)

(declare-fun e!659741 () Bool)

(declare-fun call!56113 () ListLongMap!16557)

(declare-fun call!56107 () ListLongMap!16557)

(assert (=> b!1160178 (= e!659741 (= call!56113 call!56107))))

(declare-fun c!115782 () Bool)

(declare-fun bm!56103 () Bool)

(declare-fun call!56111 () ListLongMap!16557)

(assert (=> bm!56103 (= call!56106 (contains!6800 (ite c!115782 lt!521801 call!56111) k!934))))

(declare-fun b!1160179 () Bool)

(declare-fun res!769974 () Bool)

(declare-fun e!659743 () Bool)

(assert (=> b!1160179 (=> (not res!769974) (not e!659743))))

(assert (=> b!1160179 (= res!769974 (arrayNoDuplicates!0 lt!521792 #b00000000000000000000000000000000 Nil!25322))))

(declare-fun b!1160180 () Bool)

(assert (=> b!1160180 (= e!659734 e!659743)))

(declare-fun res!769980 () Bool)

(assert (=> b!1160180 (=> (not res!769980) (not e!659743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74995 (_ BitVec 32)) Bool)

(assert (=> b!1160180 (= res!769980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521792 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1160180 (= lt!521792 (array!74996 (store (arr!36148 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36684 _keys!1208)))))

(declare-fun b!1160181 () Bool)

(declare-fun -!1403 (ListLongMap!16557 (_ BitVec 64)) ListLongMap!16557)

(assert (=> b!1160181 (= e!659741 (= call!56113 (-!1403 call!56107 k!934)))))

(declare-fun b!1160182 () Bool)

(declare-fun res!769986 () Bool)

(assert (=> b!1160182 (=> (not res!769986) (not e!659734))))

(declare-fun _values!996 () array!74997)

(assert (=> b!1160182 (= res!769986 (and (= (size!36685 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36684 _keys!1208) (size!36685 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1160183 () Bool)

(declare-fun c!115781 () Bool)

(declare-fun lt!521786 () Bool)

(assert (=> b!1160183 (= c!115781 (and (not lt!521786) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!659738 () Unit!38245)

(assert (=> b!1160183 (= e!659736 e!659738)))

(declare-fun bm!56104 () Bool)

(assert (=> bm!56104 (= call!56110 (+!3699 (ite c!115782 lt!521801 lt!521791) (ite c!115782 (tuple2!18589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115781 (tuple2!18589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun mapIsEmpty!45440 () Bool)

(declare-fun mapRes!45440 () Bool)

(assert (=> mapIsEmpty!45440 mapRes!45440))

(declare-fun bm!56105 () Bool)

(assert (=> bm!56105 (= call!56113 (getCurrentListMapNoExtraKeys!4758 lt!521792 lt!521805 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56106 () Bool)

(declare-fun call!56108 () Unit!38245)

(assert (=> bm!56106 (= call!56108 call!56112)))

(declare-fun b!1160184 () Bool)

(declare-fun res!769981 () Bool)

(assert (=> b!1160184 (=> (not res!769981) (not e!659734))))

(assert (=> b!1160184 (= res!769981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1160185 () Bool)

(declare-fun lt!521799 () Unit!38245)

(assert (=> b!1160185 (= e!659738 lt!521799)))

(assert (=> b!1160185 (= lt!521799 call!56108)))

(declare-fun call!56109 () Bool)

(assert (=> b!1160185 call!56109))

(declare-fun b!1160186 () Bool)

(declare-fun e!659742 () Unit!38245)

(assert (=> b!1160186 (= e!659738 e!659742)))

(declare-fun c!115784 () Bool)

(assert (=> b!1160186 (= c!115784 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521786))))

(declare-fun b!1160187 () Bool)

(declare-fun res!769988 () Bool)

(assert (=> b!1160187 (=> (not res!769988) (not e!659734))))

(assert (=> b!1160187 (= res!769988 (= (select (arr!36148 _keys!1208) i!673) k!934))))

(declare-fun b!1160188 () Bool)

(declare-fun e!659744 () Bool)

(declare-fun tp_is_empty!29077 () Bool)

(assert (=> b!1160188 (= e!659744 tp_is_empty!29077)))

(declare-fun res!769982 () Bool)

(assert (=> start!98942 (=> (not res!769982) (not e!659734))))

(assert (=> start!98942 (= res!769982 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36684 _keys!1208))))))

(assert (=> start!98942 e!659734))

(assert (=> start!98942 tp_is_empty!29077))

(declare-fun array_inv!27660 (array!74995) Bool)

(assert (=> start!98942 (array_inv!27660 _keys!1208)))

(assert (=> start!98942 true))

(assert (=> start!98942 tp!86352))

(declare-fun e!659740 () Bool)

(declare-fun array_inv!27661 (array!74997) Bool)

(assert (=> start!98942 (and (array_inv!27661 _values!996) e!659740)))

(declare-fun b!1160189 () Bool)

(declare-fun e!659733 () Bool)

(assert (=> b!1160189 (= e!659743 (not e!659733))))

(declare-fun res!769987 () Bool)

(assert (=> b!1160189 (=> res!769987 e!659733)))

(assert (=> b!1160189 (= res!769987 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1160189 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!521794 () Unit!38245)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74995 (_ BitVec 64) (_ BitVec 32)) Unit!38245)

(assert (=> b!1160189 (= lt!521794 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1160190 () Bool)

(declare-fun e!659748 () Bool)

(assert (=> b!1160190 (= e!659748 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!56107 () Bool)

(assert (=> bm!56107 (= call!56107 (getCurrentListMapNoExtraKeys!4758 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160191 () Bool)

(declare-fun e!659747 () Bool)

(assert (=> b!1160191 (= e!659733 e!659747)))

(declare-fun res!769985 () Bool)

(assert (=> b!1160191 (=> res!769985 e!659747)))

(assert (=> b!1160191 (= res!769985 (not (= from!1455 i!673)))))

(declare-fun lt!521795 () ListLongMap!16557)

(assert (=> b!1160191 (= lt!521795 (getCurrentListMapNoExtraKeys!4758 lt!521792 lt!521805 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!521785 () V!43897)

(assert (=> b!1160191 (= lt!521805 (array!74998 (store (arr!36149 _values!996) i!673 (ValueCellFull!13829 lt!521785)) (size!36685 _values!996)))))

(declare-fun dynLambda!2758 (Int (_ BitVec 64)) V!43897)

(assert (=> b!1160191 (= lt!521785 (dynLambda!2758 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!521796 () ListLongMap!16557)

(assert (=> b!1160191 (= lt!521796 (getCurrentListMapNoExtraKeys!4758 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1160192 () Bool)

(declare-fun res!769979 () Bool)

(assert (=> b!1160192 (=> (not res!769979) (not e!659734))))

(assert (=> b!1160192 (= res!769979 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36684 _keys!1208))))))

(declare-fun b!1160193 () Bool)

(declare-fun e!659745 () Bool)

(assert (=> b!1160193 (= e!659740 (and e!659745 mapRes!45440))))

(declare-fun condMapEmpty!45440 () Bool)

(declare-fun mapDefault!45440 () ValueCell!13829)

