; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100994 () Bool)

(assert start!100994)

(declare-fun b_free!25999 () Bool)

(declare-fun b_next!25999 () Bool)

(assert (=> start!100994 (= b_free!25999 (not b_next!25999))))

(declare-fun tp!91013 () Bool)

(declare-fun b_and!43053 () Bool)

(assert (=> start!100994 (= tp!91013 b_and!43053)))

(declare-datatypes ((array!78104 0))(
  ( (array!78105 (arr!37689 (Array (_ BitVec 32) (_ BitVec 64))) (size!38227 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78104)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1209554 () Bool)

(declare-fun e!686955 () Bool)

(declare-fun arrayContainsKey!0 (array!78104 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1209554 (= e!686955 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!47923 () Bool)

(declare-fun mapRes!47923 () Bool)

(assert (=> mapIsEmpty!47923 mapRes!47923))

(declare-fun b!1209556 () Bool)

(declare-fun call!59407 () Bool)

(assert (=> b!1209556 call!59407))

(declare-datatypes ((Unit!39927 0))(
  ( (Unit!39928) )
))
(declare-fun lt!548922 () Unit!39927)

(declare-fun call!59408 () Unit!39927)

(assert (=> b!1209556 (= lt!548922 call!59408)))

(declare-fun e!686945 () Unit!39927)

(assert (=> b!1209556 (= e!686945 lt!548922)))

(declare-fun b!1209557 () Bool)

(declare-fun e!686949 () Unit!39927)

(declare-fun lt!548938 () Unit!39927)

(assert (=> b!1209557 (= e!686949 lt!548938)))

(assert (=> b!1209557 (= lt!548938 call!59408)))

(assert (=> b!1209557 call!59407))

(declare-fun b!1209558 () Bool)

(declare-fun res!803889 () Bool)

(declare-fun e!686952 () Bool)

(assert (=> b!1209558 (=> (not res!803889) (not e!686952))))

(declare-fun lt!548936 () array!78104)

(declare-datatypes ((List!26636 0))(
  ( (Nil!26633) (Cons!26632 (h!27841 (_ BitVec 64)) (t!39606 List!26636)) )
))
(declare-fun arrayNoDuplicates!0 (array!78104 (_ BitVec 32) List!26636) Bool)

(assert (=> b!1209558 (= res!803889 (arrayNoDuplicates!0 lt!548936 #b00000000000000000000000000000000 Nil!26633))))

(declare-fun b!1209559 () Bool)

(declare-fun res!803883 () Bool)

(declare-fun e!686946 () Bool)

(assert (=> b!1209559 (=> (not res!803883) (not e!686946))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46065 0))(
  ( (V!46066 (val!15408 Int)) )
))
(declare-datatypes ((ValueCell!14642 0))(
  ( (ValueCellFull!14642 (v!18058 V!46065)) (EmptyCell!14642) )
))
(declare-datatypes ((array!78106 0))(
  ( (array!78107 (arr!37690 (Array (_ BitVec 32) ValueCell!14642)) (size!38228 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78106)

(assert (=> b!1209559 (= res!803883 (and (= (size!38228 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38227 _keys!1208) (size!38228 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!944 () V!46065)

(declare-fun bm!59402 () Bool)

(declare-fun minValue!944 () V!46065)

(declare-fun lt!548923 () array!78106)

(declare-datatypes ((tuple2!19856 0))(
  ( (tuple2!19857 (_1!9939 (_ BitVec 64)) (_2!9939 V!46065)) )
))
(declare-datatypes ((List!26637 0))(
  ( (Nil!26634) (Cons!26633 (h!27842 tuple2!19856) (t!39607 List!26637)) )
))
(declare-datatypes ((ListLongMap!17825 0))(
  ( (ListLongMap!17826 (toList!8928 List!26637)) )
))
(declare-fun call!59406 () ListLongMap!17825)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5370 (array!78104 array!78106 (_ BitVec 32) (_ BitVec 32) V!46065 V!46065 (_ BitVec 32) Int) ListLongMap!17825)

(assert (=> bm!59402 (= call!59406 (getCurrentListMapNoExtraKeys!5370 lt!548936 lt!548923 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209560 () Bool)

(declare-fun e!686950 () Unit!39927)

(assert (=> b!1209560 (= e!686950 e!686945)))

(declare-fun c!119082 () Bool)

(declare-fun lt!548934 () Bool)

(assert (=> b!1209560 (= c!119082 (and (not lt!548934) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1209561 () Bool)

(declare-fun Unit!39929 () Unit!39927)

(assert (=> b!1209561 (= e!686949 Unit!39929)))

(declare-fun bm!59403 () Bool)

(declare-fun call!59410 () ListLongMap!17825)

(assert (=> bm!59403 (= call!59410 (getCurrentListMapNoExtraKeys!5370 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209562 () Bool)

(declare-fun e!686953 () Bool)

(declare-fun e!686943 () Bool)

(assert (=> b!1209562 (= e!686953 e!686943)))

(declare-fun res!803887 () Bool)

(assert (=> b!1209562 (=> res!803887 e!686943)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1209562 (= res!803887 (not (= from!1455 i!673)))))

(declare-fun lt!548925 () ListLongMap!17825)

(assert (=> b!1209562 (= lt!548925 (getCurrentListMapNoExtraKeys!5370 lt!548936 lt!548923 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3233 (Int (_ BitVec 64)) V!46065)

(assert (=> b!1209562 (= lt!548923 (array!78107 (store (arr!37690 _values!996) i!673 (ValueCellFull!14642 (dynLambda!3233 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38228 _values!996)))))

(declare-fun lt!548931 () ListLongMap!17825)

(assert (=> b!1209562 (= lt!548931 (getCurrentListMapNoExtraKeys!5370 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!59404 () Bool)

(declare-fun call!59409 () Unit!39927)

(assert (=> bm!59404 (= call!59408 call!59409)))

(declare-fun b!1209563 () Bool)

(declare-fun res!803882 () Bool)

(assert (=> b!1209563 (=> (not res!803882) (not e!686946))))

(assert (=> b!1209563 (= res!803882 (= (select (arr!37689 _keys!1208) i!673) k0!934))))

(declare-fun b!1209555 () Bool)

(assert (=> b!1209555 (= e!686946 e!686952)))

(declare-fun res!803878 () Bool)

(assert (=> b!1209555 (=> (not res!803878) (not e!686952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78104 (_ BitVec 32)) Bool)

(assert (=> b!1209555 (= res!803878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548936 mask!1564))))

(assert (=> b!1209555 (= lt!548936 (array!78105 (store (arr!37689 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38227 _keys!1208)))))

(declare-fun res!803877 () Bool)

(assert (=> start!100994 (=> (not res!803877) (not e!686946))))

(assert (=> start!100994 (= res!803877 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38227 _keys!1208))))))

(assert (=> start!100994 e!686946))

(declare-fun tp_is_empty!30703 () Bool)

(assert (=> start!100994 tp_is_empty!30703))

(declare-fun array_inv!28818 (array!78104) Bool)

(assert (=> start!100994 (array_inv!28818 _keys!1208)))

(assert (=> start!100994 true))

(assert (=> start!100994 tp!91013))

(declare-fun e!686951 () Bool)

(declare-fun array_inv!28819 (array!78106) Bool)

(assert (=> start!100994 (and (array_inv!28819 _values!996) e!686951)))

(declare-fun b!1209564 () Bool)

(declare-fun e!686944 () Bool)

(declare-fun e!686941 () Bool)

(assert (=> b!1209564 (= e!686944 e!686941)))

(declare-fun res!803888 () Bool)

(assert (=> b!1209564 (=> res!803888 e!686941)))

(declare-fun lt!548930 () ListLongMap!17825)

(declare-fun contains!6936 (ListLongMap!17825 (_ BitVec 64)) Bool)

(assert (=> b!1209564 (= res!803888 (not (contains!6936 lt!548930 k0!934)))))

(assert (=> b!1209564 (= lt!548930 (getCurrentListMapNoExtraKeys!5370 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209565 () Bool)

(declare-fun e!686940 () Bool)

(assert (=> b!1209565 (= e!686940 (= call!59406 call!59410))))

(declare-fun e!686954 () Bool)

(declare-fun b!1209566 () Bool)

(assert (=> b!1209566 (= e!686954 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!59405 () Bool)

(declare-fun call!59412 () ListLongMap!17825)

(declare-fun call!59411 () ListLongMap!17825)

(assert (=> bm!59405 (= call!59412 call!59411)))

(declare-fun b!1209567 () Bool)

(assert (=> b!1209567 (= e!686952 (not e!686953))))

(declare-fun res!803884 () Bool)

(assert (=> b!1209567 (=> res!803884 e!686953)))

(assert (=> b!1209567 (= res!803884 (bvsgt from!1455 i!673))))

(assert (=> b!1209567 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!548928 () Unit!39927)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78104 (_ BitVec 64) (_ BitVec 32)) Unit!39927)

(assert (=> b!1209567 (= lt!548928 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1209568 () Bool)

(assert (=> b!1209568 (= e!686954 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!548934) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun c!119083 () Bool)

(declare-fun lt!548924 () ListLongMap!17825)

(declare-fun bm!59406 () Bool)

(declare-fun +!4053 (ListLongMap!17825 tuple2!19856) ListLongMap!17825)

(assert (=> bm!59406 (= call!59411 (+!4053 (ite c!119083 lt!548924 lt!548930) (ite c!119083 (tuple2!19857 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119082 (tuple2!19857 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19857 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1209569 () Bool)

(declare-fun -!1809 (ListLongMap!17825 (_ BitVec 64)) ListLongMap!17825)

(assert (=> b!1209569 (= e!686940 (= call!59406 (-!1809 call!59410 k0!934)))))

(declare-fun b!1209570 () Bool)

(declare-fun res!803879 () Bool)

(assert (=> b!1209570 (=> (not res!803879) (not e!686946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1209570 (= res!803879 (validMask!0 mask!1564))))

(declare-fun bm!59407 () Bool)

(declare-fun addStillContains!1037 (ListLongMap!17825 (_ BitVec 64) V!46065 (_ BitVec 64)) Unit!39927)

(assert (=> bm!59407 (= call!59409 (addStillContains!1037 (ite c!119083 lt!548924 lt!548930) (ite c!119083 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119082 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119083 minValue!944 (ite c!119082 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1209571 () Bool)

(declare-fun e!686942 () Bool)

(assert (=> b!1209571 (= e!686942 tp_is_empty!30703)))

(declare-fun bm!59408 () Bool)

(declare-fun call!59405 () Bool)

(assert (=> bm!59408 (= call!59407 call!59405)))

(declare-fun b!1209572 () Bool)

(declare-fun res!803880 () Bool)

(assert (=> b!1209572 (=> (not res!803880) (not e!686946))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1209572 (= res!803880 (validKeyInArray!0 k0!934))))

(declare-fun b!1209573 () Bool)

(assert (=> b!1209573 (= e!686943 e!686944)))

(declare-fun res!803885 () Bool)

(assert (=> b!1209573 (=> res!803885 e!686944)))

(assert (=> b!1209573 (= res!803885 (not (= (select (arr!37689 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1209573 e!686940))

(declare-fun c!119081 () Bool)

(assert (=> b!1209573 (= c!119081 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!548927 () Unit!39927)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1053 (array!78104 array!78106 (_ BitVec 32) (_ BitVec 32) V!46065 V!46065 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39927)

(assert (=> b!1209573 (= lt!548927 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1053 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209574 () Bool)

(assert (=> b!1209574 (= e!686951 (and e!686942 mapRes!47923))))

(declare-fun condMapEmpty!47923 () Bool)

(declare-fun mapDefault!47923 () ValueCell!14642)

(assert (=> b!1209574 (= condMapEmpty!47923 (= (arr!37690 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14642)) mapDefault!47923)))))

(declare-fun b!1209575 () Bool)

(declare-fun c!119085 () Bool)

(assert (=> b!1209575 (= c!119085 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!548934))))

(assert (=> b!1209575 (= e!686945 e!686949)))

(declare-fun b!1209576 () Bool)

(assert (=> b!1209576 (= e!686941 true)))

(assert (=> b!1209576 false))

(declare-fun lt!548933 () Unit!39927)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78104 (_ BitVec 64) (_ BitVec 32) List!26636) Unit!39927)

(assert (=> b!1209576 (= lt!548933 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26633))))

(assert (=> b!1209576 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26633)))

(declare-fun lt!548937 () Unit!39927)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78104 (_ BitVec 32) (_ BitVec 32)) Unit!39927)

(assert (=> b!1209576 (= lt!548937 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1209576 e!686955))

(declare-fun res!803876 () Bool)

(assert (=> b!1209576 (=> (not res!803876) (not e!686955))))

(assert (=> b!1209576 (= res!803876 e!686954)))

(declare-fun c!119084 () Bool)

(assert (=> b!1209576 (= c!119084 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548932 () Unit!39927)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!580 (array!78104 array!78106 (_ BitVec 32) (_ BitVec 32) V!46065 V!46065 (_ BitVec 64) (_ BitVec 32) Int) Unit!39927)

(assert (=> b!1209576 (= lt!548932 (lemmaListMapContainsThenArrayContainsFrom!580 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!548935 () Unit!39927)

(assert (=> b!1209576 (= lt!548935 e!686950)))

(assert (=> b!1209576 (= c!119083 (and (not lt!548934) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1209576 (= lt!548934 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1209577 () Bool)

(declare-fun e!686948 () Bool)

(assert (=> b!1209577 (= e!686948 tp_is_empty!30703)))

(declare-fun mapNonEmpty!47923 () Bool)

(declare-fun tp!91012 () Bool)

(assert (=> mapNonEmpty!47923 (= mapRes!47923 (and tp!91012 e!686948))))

(declare-fun mapKey!47923 () (_ BitVec 32))

(declare-fun mapValue!47923 () ValueCell!14642)

(declare-fun mapRest!47923 () (Array (_ BitVec 32) ValueCell!14642))

(assert (=> mapNonEmpty!47923 (= (arr!37690 _values!996) (store mapRest!47923 mapKey!47923 mapValue!47923))))

(declare-fun bm!59409 () Bool)

(assert (=> bm!59409 (= call!59405 (contains!6936 (ite c!119083 lt!548924 call!59412) k0!934))))

(declare-fun b!1209578 () Bool)

(declare-fun res!803881 () Bool)

(assert (=> b!1209578 (=> (not res!803881) (not e!686946))))

(assert (=> b!1209578 (= res!803881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1209579 () Bool)

(declare-fun res!803875 () Bool)

(assert (=> b!1209579 (=> (not res!803875) (not e!686946))))

(assert (=> b!1209579 (= res!803875 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38227 _keys!1208))))))

(declare-fun b!1209580 () Bool)

(declare-fun res!803886 () Bool)

(assert (=> b!1209580 (=> (not res!803886) (not e!686946))))

(assert (=> b!1209580 (= res!803886 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26633))))

(declare-fun b!1209581 () Bool)

(declare-fun lt!548926 () Unit!39927)

(assert (=> b!1209581 (= e!686950 lt!548926)))

(declare-fun lt!548929 () Unit!39927)

(assert (=> b!1209581 (= lt!548929 (addStillContains!1037 lt!548930 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1209581 (= lt!548924 (+!4053 lt!548930 (tuple2!19857 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1209581 call!59405))

(assert (=> b!1209581 (= lt!548926 call!59409)))

(assert (=> b!1209581 (contains!6936 call!59411 k0!934)))

(assert (= (and start!100994 res!803877) b!1209570))

(assert (= (and b!1209570 res!803879) b!1209559))

(assert (= (and b!1209559 res!803883) b!1209578))

(assert (= (and b!1209578 res!803881) b!1209580))

(assert (= (and b!1209580 res!803886) b!1209579))

(assert (= (and b!1209579 res!803875) b!1209572))

(assert (= (and b!1209572 res!803880) b!1209563))

(assert (= (and b!1209563 res!803882) b!1209555))

(assert (= (and b!1209555 res!803878) b!1209558))

(assert (= (and b!1209558 res!803889) b!1209567))

(assert (= (and b!1209567 (not res!803884)) b!1209562))

(assert (= (and b!1209562 (not res!803887)) b!1209573))

(assert (= (and b!1209573 c!119081) b!1209569))

(assert (= (and b!1209573 (not c!119081)) b!1209565))

(assert (= (or b!1209569 b!1209565) bm!59402))

(assert (= (or b!1209569 b!1209565) bm!59403))

(assert (= (and b!1209573 (not res!803885)) b!1209564))

(assert (= (and b!1209564 (not res!803888)) b!1209576))

(assert (= (and b!1209576 c!119083) b!1209581))

(assert (= (and b!1209576 (not c!119083)) b!1209560))

(assert (= (and b!1209560 c!119082) b!1209556))

(assert (= (and b!1209560 (not c!119082)) b!1209575))

(assert (= (and b!1209575 c!119085) b!1209557))

(assert (= (and b!1209575 (not c!119085)) b!1209561))

(assert (= (or b!1209556 b!1209557) bm!59404))

(assert (= (or b!1209556 b!1209557) bm!59405))

(assert (= (or b!1209556 b!1209557) bm!59408))

(assert (= (or b!1209581 bm!59408) bm!59409))

(assert (= (or b!1209581 bm!59404) bm!59407))

(assert (= (or b!1209581 bm!59405) bm!59406))

(assert (= (and b!1209576 c!119084) b!1209566))

(assert (= (and b!1209576 (not c!119084)) b!1209568))

(assert (= (and b!1209576 res!803876) b!1209554))

(assert (= (and b!1209574 condMapEmpty!47923) mapIsEmpty!47923))

(assert (= (and b!1209574 (not condMapEmpty!47923)) mapNonEmpty!47923))

(get-info :version)

(assert (= (and mapNonEmpty!47923 ((_ is ValueCellFull!14642) mapValue!47923)) b!1209577))

(assert (= (and b!1209574 ((_ is ValueCellFull!14642) mapDefault!47923)) b!1209571))

(assert (= start!100994 b!1209574))

(declare-fun b_lambda!21573 () Bool)

(assert (=> (not b_lambda!21573) (not b!1209562)))

(declare-fun t!39605 () Bool)

(declare-fun tb!10791 () Bool)

(assert (=> (and start!100994 (= defaultEntry!1004 defaultEntry!1004) t!39605) tb!10791))

(declare-fun result!22183 () Bool)

(assert (=> tb!10791 (= result!22183 tp_is_empty!30703)))

(assert (=> b!1209562 t!39605))

(declare-fun b_and!43055 () Bool)

(assert (= b_and!43053 (and (=> t!39605 result!22183) b_and!43055)))

(declare-fun m!1114729 () Bool)

(assert (=> b!1209554 m!1114729))

(declare-fun m!1114731 () Bool)

(assert (=> mapNonEmpty!47923 m!1114731))

(assert (=> b!1209566 m!1114729))

(declare-fun m!1114733 () Bool)

(assert (=> b!1209576 m!1114733))

(declare-fun m!1114735 () Bool)

(assert (=> b!1209576 m!1114735))

(declare-fun m!1114737 () Bool)

(assert (=> b!1209576 m!1114737))

(declare-fun m!1114739 () Bool)

(assert (=> b!1209576 m!1114739))

(declare-fun m!1114741 () Bool)

(assert (=> b!1209567 m!1114741))

(declare-fun m!1114743 () Bool)

(assert (=> b!1209567 m!1114743))

(declare-fun m!1114745 () Bool)

(assert (=> b!1209558 m!1114745))

(declare-fun m!1114747 () Bool)

(assert (=> start!100994 m!1114747))

(declare-fun m!1114749 () Bool)

(assert (=> start!100994 m!1114749))

(declare-fun m!1114751 () Bool)

(assert (=> b!1209578 m!1114751))

(declare-fun m!1114753 () Bool)

(assert (=> bm!59403 m!1114753))

(declare-fun m!1114755 () Bool)

(assert (=> b!1209570 m!1114755))

(declare-fun m!1114757 () Bool)

(assert (=> b!1209564 m!1114757))

(assert (=> b!1209564 m!1114753))

(declare-fun m!1114759 () Bool)

(assert (=> b!1209563 m!1114759))

(declare-fun m!1114761 () Bool)

(assert (=> bm!59409 m!1114761))

(declare-fun m!1114763 () Bool)

(assert (=> b!1209555 m!1114763))

(declare-fun m!1114765 () Bool)

(assert (=> b!1209555 m!1114765))

(declare-fun m!1114767 () Bool)

(assert (=> b!1209569 m!1114767))

(declare-fun m!1114769 () Bool)

(assert (=> bm!59406 m!1114769))

(declare-fun m!1114771 () Bool)

(assert (=> b!1209572 m!1114771))

(declare-fun m!1114773 () Bool)

(assert (=> b!1209573 m!1114773))

(declare-fun m!1114775 () Bool)

(assert (=> b!1209573 m!1114775))

(declare-fun m!1114777 () Bool)

(assert (=> bm!59407 m!1114777))

(declare-fun m!1114779 () Bool)

(assert (=> b!1209580 m!1114779))

(declare-fun m!1114781 () Bool)

(assert (=> b!1209562 m!1114781))

(declare-fun m!1114783 () Bool)

(assert (=> b!1209562 m!1114783))

(declare-fun m!1114785 () Bool)

(assert (=> b!1209562 m!1114785))

(declare-fun m!1114787 () Bool)

(assert (=> b!1209562 m!1114787))

(declare-fun m!1114789 () Bool)

(assert (=> bm!59402 m!1114789))

(declare-fun m!1114791 () Bool)

(assert (=> b!1209581 m!1114791))

(declare-fun m!1114793 () Bool)

(assert (=> b!1209581 m!1114793))

(declare-fun m!1114795 () Bool)

(assert (=> b!1209581 m!1114795))

(check-sat (not b!1209572) (not b!1209570) (not bm!59409) (not b!1209580) (not b_next!25999) (not mapNonEmpty!47923) (not bm!59402) (not b!1209566) (not b!1209567) (not b!1209576) (not bm!59403) (not b_lambda!21573) (not bm!59407) b_and!43055 (not b!1209569) (not b!1209578) (not b!1209573) (not start!100994) (not bm!59406) (not b!1209555) (not b!1209581) (not b!1209564) tp_is_empty!30703 (not b!1209554) (not b!1209562) (not b!1209558))
(check-sat b_and!43055 (not b_next!25999))
