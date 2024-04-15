; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98540 () Bool)

(assert start!98540)

(declare-fun b_free!24151 () Bool)

(declare-fun b_next!24151 () Bool)

(assert (=> start!98540 (= b_free!24151 (not b_next!24151))))

(declare-fun tp!85164 () Bool)

(declare-fun b_and!39129 () Bool)

(assert (=> start!98540 (= tp!85164 b_and!39129)))

(declare-fun b!1141904 () Bool)

(declare-fun e!649629 () Bool)

(declare-fun e!649630 () Bool)

(declare-fun mapRes!44846 () Bool)

(assert (=> b!1141904 (= e!649629 (and e!649630 mapRes!44846))))

(declare-fun condMapEmpty!44846 () Bool)

(declare-datatypes ((V!43369 0))(
  ( (V!43370 (val!14397 Int)) )
))
(declare-datatypes ((ValueCell!13631 0))(
  ( (ValueCellFull!13631 (v!17033 V!43369)) (EmptyCell!13631) )
))
(declare-datatypes ((array!74144 0))(
  ( (array!74145 (arr!35723 (Array (_ BitVec 32) ValueCell!13631)) (size!36261 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74144)

(declare-fun mapDefault!44846 () ValueCell!13631)

(assert (=> b!1141904 (= condMapEmpty!44846 (= (arr!35723 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13631)) mapDefault!44846)))))

(declare-fun zeroValue!944 () V!43369)

(declare-datatypes ((array!74146 0))(
  ( (array!74147 (arr!35724 (Array (_ BitVec 32) (_ BitVec 64))) (size!36262 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74146)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!51328 () Bool)

(declare-fun minValue!944 () V!43369)

(declare-datatypes ((tuple2!18306 0))(
  ( (tuple2!18307 (_1!9164 (_ BitVec 64)) (_2!9164 V!43369)) )
))
(declare-datatypes ((List!25044 0))(
  ( (Nil!25041) (Cons!25040 (h!26249 tuple2!18306) (t!36178 List!25044)) )
))
(declare-datatypes ((ListLongMap!16275 0))(
  ( (ListLongMap!16276 (toList!8153 List!25044)) )
))
(declare-fun call!51336 () ListLongMap!16275)

(declare-fun getCurrentListMapNoExtraKeys!4645 (array!74146 array!74144 (_ BitVec 32) (_ BitVec 32) V!43369 V!43369 (_ BitVec 32) Int) ListLongMap!16275)

(assert (=> bm!51328 (= call!51336 (getCurrentListMapNoExtraKeys!4645 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141905 () Bool)

(declare-fun e!649639 () Bool)

(declare-fun e!649631 () Bool)

(assert (=> b!1141905 (= e!649639 e!649631)))

(declare-fun res!761079 () Bool)

(assert (=> b!1141905 (=> res!761079 e!649631)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1141905 (= res!761079 (not (= from!1455 i!673)))))

(declare-fun lt!508759 () array!74146)

(declare-fun lt!508756 () array!74144)

(declare-fun lt!508762 () ListLongMap!16275)

(assert (=> b!1141905 (= lt!508762 (getCurrentListMapNoExtraKeys!4645 lt!508759 lt!508756 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!508776 () V!43369)

(assert (=> b!1141905 (= lt!508756 (array!74145 (store (arr!35723 _values!996) i!673 (ValueCellFull!13631 lt!508776)) (size!36261 _values!996)))))

(declare-fun dynLambda!2625 (Int (_ BitVec 64)) V!43369)

(assert (=> b!1141905 (= lt!508776 (dynLambda!2625 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!508775 () ListLongMap!16275)

(assert (=> b!1141905 (= lt!508775 (getCurrentListMapNoExtraKeys!4645 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1141906 () Bool)

(declare-datatypes ((Unit!37322 0))(
  ( (Unit!37323) )
))
(declare-fun e!649637 () Unit!37322)

(declare-fun Unit!37324 () Unit!37322)

(assert (=> b!1141906 (= e!649637 Unit!37324)))

(declare-fun b!1141907 () Bool)

(declare-fun e!649638 () Bool)

(declare-fun tp_is_empty!28681 () Bool)

(assert (=> b!1141907 (= e!649638 tp_is_empty!28681)))

(declare-fun b!1141908 () Bool)

(declare-fun e!649627 () Bool)

(assert (=> b!1141908 (= e!649627 true)))

(declare-fun lt!508764 () V!43369)

(declare-fun lt!508766 () ListLongMap!16275)

(declare-fun -!1236 (ListLongMap!16275 (_ BitVec 64)) ListLongMap!16275)

(declare-fun +!3578 (ListLongMap!16275 tuple2!18306) ListLongMap!16275)

(assert (=> b!1141908 (= (-!1236 (+!3578 lt!508766 (tuple2!18307 (select (arr!35724 _keys!1208) from!1455) lt!508764)) (select (arr!35724 _keys!1208) from!1455)) lt!508766)))

(declare-fun lt!508767 () Unit!37322)

(declare-fun addThenRemoveForNewKeyIsSame!102 (ListLongMap!16275 (_ BitVec 64) V!43369) Unit!37322)

(assert (=> b!1141908 (= lt!508767 (addThenRemoveForNewKeyIsSame!102 lt!508766 (select (arr!35724 _keys!1208) from!1455) lt!508764))))

(declare-fun get!18166 (ValueCell!13631 V!43369) V!43369)

(assert (=> b!1141908 (= lt!508764 (get!18166 (select (arr!35723 _values!996) from!1455) lt!508776))))

(declare-fun lt!508761 () Unit!37322)

(declare-fun e!649634 () Unit!37322)

(assert (=> b!1141908 (= lt!508761 e!649634)))

(declare-fun c!112191 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6623 (ListLongMap!16275 (_ BitVec 64)) Bool)

(assert (=> b!1141908 (= c!112191 (contains!6623 lt!508766 k0!934))))

(assert (=> b!1141908 (= lt!508766 (getCurrentListMapNoExtraKeys!4645 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141909 () Bool)

(declare-fun e!649635 () Unit!37322)

(assert (=> b!1141909 (= e!649635 e!649637)))

(declare-fun c!112194 () Bool)

(declare-fun lt!508758 () Bool)

(assert (=> b!1141909 (= c!112194 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508758))))

(declare-fun e!649641 () Bool)

(declare-fun b!1141910 () Bool)

(assert (=> b!1141910 (= e!649641 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508758) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun call!51337 () Unit!37322)

(declare-fun c!112192 () Bool)

(declare-fun bm!51329 () Bool)

(declare-fun c!112196 () Bool)

(declare-fun addStillContains!792 (ListLongMap!16275 (_ BitVec 64) V!43369 (_ BitVec 64)) Unit!37322)

(assert (=> bm!51329 (= call!51337 (addStillContains!792 lt!508766 (ite (or c!112192 c!112196) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112192 c!112196) zeroValue!944 minValue!944) k0!934))))

(declare-fun call!51338 () ListLongMap!16275)

(declare-fun bm!51330 () Bool)

(assert (=> bm!51330 (= call!51338 (getCurrentListMapNoExtraKeys!4645 lt!508759 lt!508756 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141911 () Bool)

(declare-fun res!761081 () Bool)

(declare-fun e!649633 () Bool)

(assert (=> b!1141911 (=> (not res!761081) (not e!649633))))

(declare-datatypes ((List!25045 0))(
  ( (Nil!25042) (Cons!25041 (h!26250 (_ BitVec 64)) (t!36179 List!25045)) )
))
(declare-fun arrayNoDuplicates!0 (array!74146 (_ BitVec 32) List!25045) Bool)

(assert (=> b!1141911 (= res!761081 (arrayNoDuplicates!0 lt!508759 #b00000000000000000000000000000000 Nil!25042))))

(declare-fun bm!51331 () Bool)

(declare-fun call!51331 () ListLongMap!16275)

(declare-fun lt!508765 () ListLongMap!16275)

(assert (=> bm!51331 (= call!51331 (+!3578 (ite c!112192 lt!508765 lt!508766) (ite c!112192 (tuple2!18307 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112196 (tuple2!18307 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18307 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!51332 () Bool)

(declare-fun call!51333 () ListLongMap!16275)

(assert (=> bm!51332 (= call!51333 call!51331)))

(declare-fun b!1141912 () Bool)

(declare-fun res!761072 () Bool)

(declare-fun e!649640 () Bool)

(assert (=> b!1141912 (=> (not res!761072) (not e!649640))))

(assert (=> b!1141912 (= res!761072 (= (select (arr!35724 _keys!1208) i!673) k0!934))))

(declare-fun b!1141913 () Bool)

(assert (=> b!1141913 (= e!649630 tp_is_empty!28681)))

(declare-fun b!1141914 () Bool)

(declare-fun res!761069 () Bool)

(assert (=> b!1141914 (=> (not res!761069) (not e!649640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74146 (_ BitVec 32)) Bool)

(assert (=> b!1141914 (= res!761069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1141915 () Bool)

(declare-fun Unit!37325 () Unit!37322)

(assert (=> b!1141915 (= e!649634 Unit!37325)))

(declare-fun b!1141916 () Bool)

(declare-fun res!761080 () Bool)

(assert (=> b!1141916 (=> (not res!761080) (not e!649640))))

(assert (=> b!1141916 (= res!761080 (and (= (size!36261 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36262 _keys!1208) (size!36261 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!761071 () Bool)

(assert (=> start!98540 (=> (not res!761071) (not e!649640))))

(assert (=> start!98540 (= res!761071 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36262 _keys!1208))))))

(assert (=> start!98540 e!649640))

(assert (=> start!98540 tp_is_empty!28681))

(declare-fun array_inv!27454 (array!74146) Bool)

(assert (=> start!98540 (array_inv!27454 _keys!1208)))

(assert (=> start!98540 true))

(assert (=> start!98540 tp!85164))

(declare-fun array_inv!27455 (array!74144) Bool)

(assert (=> start!98540 (and (array_inv!27455 _values!996) e!649629)))

(declare-fun mapIsEmpty!44846 () Bool)

(assert (=> mapIsEmpty!44846 mapRes!44846))

(declare-fun b!1141917 () Bool)

(declare-fun call!51332 () Bool)

(assert (=> b!1141917 call!51332))

(declare-fun lt!508772 () Unit!37322)

(declare-fun call!51335 () Unit!37322)

(assert (=> b!1141917 (= lt!508772 call!51335)))

(assert (=> b!1141917 (= e!649637 lt!508772)))

(declare-fun b!1141918 () Bool)

(assert (=> b!1141918 (= e!649631 e!649627)))

(declare-fun res!761077 () Bool)

(assert (=> b!1141918 (=> res!761077 e!649627)))

(assert (=> b!1141918 (= res!761077 (not (= (select (arr!35724 _keys!1208) from!1455) k0!934)))))

(declare-fun e!649628 () Bool)

(assert (=> b!1141918 e!649628))

(declare-fun c!112195 () Bool)

(assert (=> b!1141918 (= c!112195 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!508769 () Unit!37322)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!517 (array!74146 array!74144 (_ BitVec 32) (_ BitVec 32) V!43369 V!43369 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37322)

(assert (=> b!1141918 (= lt!508769 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!517 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51333 () Bool)

(declare-fun call!51334 () Bool)

(assert (=> bm!51333 (= call!51332 call!51334)))

(declare-fun b!1141919 () Bool)

(declare-fun res!761074 () Bool)

(assert (=> b!1141919 (=> (not res!761074) (not e!649640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1141919 (= res!761074 (validMask!0 mask!1564))))

(declare-fun b!1141920 () Bool)

(assert (=> b!1141920 (= e!649640 e!649633)))

(declare-fun res!761078 () Bool)

(assert (=> b!1141920 (=> (not res!761078) (not e!649633))))

(assert (=> b!1141920 (= res!761078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508759 mask!1564))))

(assert (=> b!1141920 (= lt!508759 (array!74147 (store (arr!35724 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36262 _keys!1208)))))

(declare-fun b!1141921 () Bool)

(declare-fun lt!508768 () Unit!37322)

(assert (=> b!1141921 (= e!649635 lt!508768)))

(assert (=> b!1141921 (= lt!508768 call!51335)))

(assert (=> b!1141921 call!51332))

(declare-fun b!1141922 () Bool)

(declare-fun arrayContainsKey!0 (array!74146 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1141922 (= e!649641 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1141923 () Bool)

(assert (=> b!1141923 (= e!649628 (= call!51338 call!51336))))

(declare-fun bm!51334 () Bool)

(assert (=> bm!51334 (= call!51334 (contains!6623 (ite c!112192 lt!508765 call!51333) k0!934))))

(declare-fun e!649636 () Bool)

(declare-fun b!1141924 () Bool)

(assert (=> b!1141924 (= e!649636 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1141925 () Bool)

(assert (=> b!1141925 (contains!6623 call!51331 k0!934)))

(declare-fun lt!508774 () Unit!37322)

(assert (=> b!1141925 (= lt!508774 (addStillContains!792 lt!508765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1141925 call!51334))

(assert (=> b!1141925 (= lt!508765 (+!3578 lt!508766 (tuple2!18307 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!508760 () Unit!37322)

(assert (=> b!1141925 (= lt!508760 call!51337)))

(declare-fun e!649626 () Unit!37322)

(assert (=> b!1141925 (= e!649626 lt!508774)))

(declare-fun b!1141926 () Bool)

(assert (=> b!1141926 (= e!649633 (not e!649639))))

(declare-fun res!761076 () Bool)

(assert (=> b!1141926 (=> res!761076 e!649639)))

(assert (=> b!1141926 (= res!761076 (bvsgt from!1455 i!673))))

(assert (=> b!1141926 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!508770 () Unit!37322)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74146 (_ BitVec 64) (_ BitVec 32)) Unit!37322)

(assert (=> b!1141926 (= lt!508770 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1141927 () Bool)

(declare-fun res!761068 () Bool)

(assert (=> b!1141927 (=> (not res!761068) (not e!649640))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1141927 (= res!761068 (validKeyInArray!0 k0!934))))

(declare-fun b!1141928 () Bool)

(assert (=> b!1141928 (= c!112196 (and (not lt!508758) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1141928 (= e!649626 e!649635)))

(declare-fun b!1141929 () Bool)

(declare-fun res!761075 () Bool)

(assert (=> b!1141929 (=> (not res!761075) (not e!649640))))

(assert (=> b!1141929 (= res!761075 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25042))))

(declare-fun bm!51335 () Bool)

(assert (=> bm!51335 (= call!51335 call!51337)))

(declare-fun b!1141930 () Bool)

(declare-fun res!761073 () Bool)

(assert (=> b!1141930 (=> (not res!761073) (not e!649640))))

(assert (=> b!1141930 (= res!761073 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36262 _keys!1208))))))

(declare-fun b!1141931 () Bool)

(declare-fun Unit!37326 () Unit!37322)

(assert (=> b!1141931 (= e!649634 Unit!37326)))

(assert (=> b!1141931 (= lt!508758 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1141931 (= c!112192 (and (not lt!508758) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!508757 () Unit!37322)

(assert (=> b!1141931 (= lt!508757 e!649626)))

(declare-fun lt!508773 () Unit!37322)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!393 (array!74146 array!74144 (_ BitVec 32) (_ BitVec 32) V!43369 V!43369 (_ BitVec 64) (_ BitVec 32) Int) Unit!37322)

(assert (=> b!1141931 (= lt!508773 (lemmaListMapContainsThenArrayContainsFrom!393 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112193 () Bool)

(assert (=> b!1141931 (= c!112193 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761070 () Bool)

(assert (=> b!1141931 (= res!761070 e!649641)))

(assert (=> b!1141931 (=> (not res!761070) (not e!649636))))

(assert (=> b!1141931 e!649636))

(declare-fun lt!508763 () Unit!37322)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74146 (_ BitVec 32) (_ BitVec 32)) Unit!37322)

(assert (=> b!1141931 (= lt!508763 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1141931 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25042)))

(declare-fun lt!508771 () Unit!37322)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74146 (_ BitVec 64) (_ BitVec 32) List!25045) Unit!37322)

(assert (=> b!1141931 (= lt!508771 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25042))))

(assert (=> b!1141931 false))

(declare-fun mapNonEmpty!44846 () Bool)

(declare-fun tp!85163 () Bool)

(assert (=> mapNonEmpty!44846 (= mapRes!44846 (and tp!85163 e!649638))))

(declare-fun mapRest!44846 () (Array (_ BitVec 32) ValueCell!13631))

(declare-fun mapKey!44846 () (_ BitVec 32))

(declare-fun mapValue!44846 () ValueCell!13631)

(assert (=> mapNonEmpty!44846 (= (arr!35723 _values!996) (store mapRest!44846 mapKey!44846 mapValue!44846))))

(declare-fun b!1141932 () Bool)

(assert (=> b!1141932 (= e!649628 (= call!51338 (-!1236 call!51336 k0!934)))))

(assert (= (and start!98540 res!761071) b!1141919))

(assert (= (and b!1141919 res!761074) b!1141916))

(assert (= (and b!1141916 res!761080) b!1141914))

(assert (= (and b!1141914 res!761069) b!1141929))

(assert (= (and b!1141929 res!761075) b!1141930))

(assert (= (and b!1141930 res!761073) b!1141927))

(assert (= (and b!1141927 res!761068) b!1141912))

(assert (= (and b!1141912 res!761072) b!1141920))

(assert (= (and b!1141920 res!761078) b!1141911))

(assert (= (and b!1141911 res!761081) b!1141926))

(assert (= (and b!1141926 (not res!761076)) b!1141905))

(assert (= (and b!1141905 (not res!761079)) b!1141918))

(assert (= (and b!1141918 c!112195) b!1141932))

(assert (= (and b!1141918 (not c!112195)) b!1141923))

(assert (= (or b!1141932 b!1141923) bm!51330))

(assert (= (or b!1141932 b!1141923) bm!51328))

(assert (= (and b!1141918 (not res!761077)) b!1141908))

(assert (= (and b!1141908 c!112191) b!1141931))

(assert (= (and b!1141908 (not c!112191)) b!1141915))

(assert (= (and b!1141931 c!112192) b!1141925))

(assert (= (and b!1141931 (not c!112192)) b!1141928))

(assert (= (and b!1141928 c!112196) b!1141921))

(assert (= (and b!1141928 (not c!112196)) b!1141909))

(assert (= (and b!1141909 c!112194) b!1141917))

(assert (= (and b!1141909 (not c!112194)) b!1141906))

(assert (= (or b!1141921 b!1141917) bm!51335))

(assert (= (or b!1141921 b!1141917) bm!51332))

(assert (= (or b!1141921 b!1141917) bm!51333))

(assert (= (or b!1141925 bm!51333) bm!51334))

(assert (= (or b!1141925 bm!51335) bm!51329))

(assert (= (or b!1141925 bm!51332) bm!51331))

(assert (= (and b!1141931 c!112193) b!1141922))

(assert (= (and b!1141931 (not c!112193)) b!1141910))

(assert (= (and b!1141931 res!761070) b!1141924))

(assert (= (and b!1141904 condMapEmpty!44846) mapIsEmpty!44846))

(assert (= (and b!1141904 (not condMapEmpty!44846)) mapNonEmpty!44846))

(get-info :version)

(assert (= (and mapNonEmpty!44846 ((_ is ValueCellFull!13631) mapValue!44846)) b!1141907))

(assert (= (and b!1141904 ((_ is ValueCellFull!13631) mapDefault!44846)) b!1141913))

(assert (= start!98540 b!1141904))

(declare-fun b_lambda!19239 () Bool)

(assert (=> (not b_lambda!19239) (not b!1141905)))

(declare-fun t!36177 () Bool)

(declare-fun tb!8955 () Bool)

(assert (=> (and start!98540 (= defaultEntry!1004 defaultEntry!1004) t!36177) tb!8955))

(declare-fun result!18483 () Bool)

(assert (=> tb!8955 (= result!18483 tp_is_empty!28681)))

(assert (=> b!1141905 t!36177))

(declare-fun b_and!39131 () Bool)

(assert (= b_and!39129 (and (=> t!36177 result!18483) b_and!39131)))

(declare-fun m!1052743 () Bool)

(assert (=> b!1141919 m!1052743))

(declare-fun m!1052745 () Bool)

(assert (=> b!1141927 m!1052745))

(declare-fun m!1052747 () Bool)

(assert (=> b!1141912 m!1052747))

(declare-fun m!1052749 () Bool)

(assert (=> b!1141905 m!1052749))

(declare-fun m!1052751 () Bool)

(assert (=> b!1141905 m!1052751))

(declare-fun m!1052753 () Bool)

(assert (=> b!1141905 m!1052753))

(declare-fun m!1052755 () Bool)

(assert (=> b!1141905 m!1052755))

(declare-fun m!1052757 () Bool)

(assert (=> b!1141925 m!1052757))

(declare-fun m!1052759 () Bool)

(assert (=> b!1141925 m!1052759))

(declare-fun m!1052761 () Bool)

(assert (=> b!1141925 m!1052761))

(declare-fun m!1052763 () Bool)

(assert (=> bm!51331 m!1052763))

(declare-fun m!1052765 () Bool)

(assert (=> b!1141926 m!1052765))

(declare-fun m!1052767 () Bool)

(assert (=> b!1141926 m!1052767))

(declare-fun m!1052769 () Bool)

(assert (=> bm!51328 m!1052769))

(assert (=> b!1141908 m!1052769))

(declare-fun m!1052771 () Bool)

(assert (=> b!1141908 m!1052771))

(declare-fun m!1052773 () Bool)

(assert (=> b!1141908 m!1052773))

(declare-fun m!1052775 () Bool)

(assert (=> b!1141908 m!1052775))

(declare-fun m!1052777 () Bool)

(assert (=> b!1141908 m!1052777))

(declare-fun m!1052779 () Bool)

(assert (=> b!1141908 m!1052779))

(assert (=> b!1141908 m!1052777))

(declare-fun m!1052781 () Bool)

(assert (=> b!1141908 m!1052781))

(assert (=> b!1141908 m!1052771))

(declare-fun m!1052783 () Bool)

(assert (=> b!1141908 m!1052783))

(assert (=> b!1141908 m!1052777))

(assert (=> b!1141908 m!1052775))

(declare-fun m!1052785 () Bool)

(assert (=> b!1141929 m!1052785))

(declare-fun m!1052787 () Bool)

(assert (=> b!1141920 m!1052787))

(declare-fun m!1052789 () Bool)

(assert (=> b!1141920 m!1052789))

(declare-fun m!1052791 () Bool)

(assert (=> b!1141922 m!1052791))

(declare-fun m!1052793 () Bool)

(assert (=> mapNonEmpty!44846 m!1052793))

(declare-fun m!1052795 () Bool)

(assert (=> b!1141932 m!1052795))

(declare-fun m!1052797 () Bool)

(assert (=> bm!51334 m!1052797))

(declare-fun m!1052799 () Bool)

(assert (=> b!1141914 m!1052799))

(declare-fun m!1052801 () Bool)

(assert (=> start!98540 m!1052801))

(declare-fun m!1052803 () Bool)

(assert (=> start!98540 m!1052803))

(declare-fun m!1052805 () Bool)

(assert (=> bm!51329 m!1052805))

(assert (=> b!1141918 m!1052777))

(declare-fun m!1052807 () Bool)

(assert (=> b!1141918 m!1052807))

(assert (=> b!1141924 m!1052791))

(declare-fun m!1052809 () Bool)

(assert (=> bm!51330 m!1052809))

(declare-fun m!1052811 () Bool)

(assert (=> b!1141931 m!1052811))

(declare-fun m!1052813 () Bool)

(assert (=> b!1141931 m!1052813))

(declare-fun m!1052815 () Bool)

(assert (=> b!1141931 m!1052815))

(declare-fun m!1052817 () Bool)

(assert (=> b!1141931 m!1052817))

(declare-fun m!1052819 () Bool)

(assert (=> b!1141911 m!1052819))

(check-sat b_and!39131 (not b!1141920) (not b!1141919) (not b!1141927) (not bm!51331) (not b!1141931) (not start!98540) (not b!1141925) (not b!1141922) (not b_next!24151) (not b_lambda!19239) (not bm!51330) (not b!1141932) (not b!1141929) tp_is_empty!28681 (not bm!51334) (not mapNonEmpty!44846) (not b!1141905) (not bm!51329) (not b!1141924) (not b!1141911) (not b!1141914) (not bm!51328) (not b!1141918) (not b!1141908) (not b!1141926))
(check-sat b_and!39131 (not b_next!24151))
