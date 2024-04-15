; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101068 () Bool)

(assert start!101068)

(declare-fun b_free!26035 () Bool)

(declare-fun b_next!26035 () Bool)

(assert (=> start!101068 (= b_free!26035 (not b_next!26035))))

(declare-fun tp!91123 () Bool)

(declare-fun b_and!43143 () Bool)

(assert (=> start!101068 (= tp!91123 b_and!43143)))

(declare-fun b!1211336 () Bool)

(declare-fun res!804722 () Bool)

(declare-fun e!687940 () Bool)

(assert (=> b!1211336 (=> (not res!804722) (not e!687940))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78178 0))(
  ( (array!78179 (arr!37725 (Array (_ BitVec 32) (_ BitVec 64))) (size!38263 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78178)

(assert (=> b!1211336 (= res!804722 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38263 _keys!1208))))))

(declare-fun mapIsEmpty!47980 () Bool)

(declare-fun mapRes!47980 () Bool)

(assert (=> mapIsEmpty!47980 mapRes!47980))

(declare-fun b!1211337 () Bool)

(declare-fun c!119446 () Bool)

(declare-fun lt!550070 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1211337 (= c!119446 (and (not lt!550070) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!39999 0))(
  ( (Unit!40000) )
))
(declare-fun e!687942 () Unit!39999)

(declare-fun e!687937 () Unit!39999)

(assert (=> b!1211337 (= e!687942 e!687937)))

(declare-datatypes ((V!46113 0))(
  ( (V!46114 (val!15426 Int)) )
))
(declare-fun zeroValue!944 () V!46113)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!59855 () Bool)

(declare-datatypes ((ValueCell!14660 0))(
  ( (ValueCellFull!14660 (v!18077 V!46113)) (EmptyCell!14660) )
))
(declare-datatypes ((array!78180 0))(
  ( (array!78181 (arr!37726 (Array (_ BitVec 32) ValueCell!14660)) (size!38264 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78180)

(declare-fun minValue!944 () V!46113)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!19892 0))(
  ( (tuple2!19893 (_1!9957 (_ BitVec 64)) (_2!9957 V!46113)) )
))
(declare-datatypes ((List!26670 0))(
  ( (Nil!26667) (Cons!26666 (h!27875 tuple2!19892) (t!39676 List!26670)) )
))
(declare-datatypes ((ListLongMap!17861 0))(
  ( (ListLongMap!17862 (toList!8946 List!26670)) )
))
(declare-fun call!59858 () ListLongMap!17861)

(declare-fun getCurrentListMapNoExtraKeys!5388 (array!78178 array!78180 (_ BitVec 32) (_ BitVec 32) V!46113 V!46113 (_ BitVec 32) Int) ListLongMap!17861)

(assert (=> bm!59855 (= call!59858 (getCurrentListMapNoExtraKeys!5388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211338 () Bool)

(declare-fun res!804728 () Bool)

(assert (=> b!1211338 (=> (not res!804728) (not e!687940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1211338 (= res!804728 (validMask!0 mask!1564))))

(declare-fun b!1211339 () Bool)

(declare-fun e!687932 () Bool)

(declare-fun tp_is_empty!30739 () Bool)

(assert (=> b!1211339 (= e!687932 tp_is_empty!30739)))

(declare-fun bm!59856 () Bool)

(declare-fun call!59859 () Bool)

(declare-fun call!59860 () Bool)

(assert (=> bm!59856 (= call!59859 call!59860)))

(declare-fun res!804731 () Bool)

(assert (=> start!101068 (=> (not res!804731) (not e!687940))))

(assert (=> start!101068 (= res!804731 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38263 _keys!1208))))))

(assert (=> start!101068 e!687940))

(assert (=> start!101068 tp_is_empty!30739))

(declare-fun array_inv!28844 (array!78178) Bool)

(assert (=> start!101068 (array_inv!28844 _keys!1208)))

(assert (=> start!101068 true))

(assert (=> start!101068 tp!91123))

(declare-fun e!687934 () Bool)

(declare-fun array_inv!28845 (array!78180) Bool)

(assert (=> start!101068 (and (array_inv!28845 _values!996) e!687934)))

(declare-fun b!1211340 () Bool)

(declare-fun res!804727 () Bool)

(assert (=> b!1211340 (=> (not res!804727) (not e!687940))))

(declare-datatypes ((List!26671 0))(
  ( (Nil!26668) (Cons!26667 (h!27876 (_ BitVec 64)) (t!39677 List!26671)) )
))
(declare-fun arrayNoDuplicates!0 (array!78178 (_ BitVec 32) List!26671) Bool)

(assert (=> b!1211340 (= res!804727 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26668))))

(declare-fun bm!59857 () Bool)

(declare-fun call!59864 () Unit!39999)

(declare-fun call!59862 () Unit!39999)

(assert (=> bm!59857 (= call!59864 call!59862)))

(declare-fun call!59865 () ListLongMap!17861)

(declare-fun lt!550083 () array!78180)

(declare-fun lt!550081 () array!78178)

(declare-fun bm!59858 () Bool)

(assert (=> bm!59858 (= call!59865 (getCurrentListMapNoExtraKeys!5388 lt!550081 lt!550083 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47980 () Bool)

(declare-fun tp!91124 () Bool)

(assert (=> mapNonEmpty!47980 (= mapRes!47980 (and tp!91124 e!687932))))

(declare-fun mapKey!47980 () (_ BitVec 32))

(declare-fun mapValue!47980 () ValueCell!14660)

(declare-fun mapRest!47980 () (Array (_ BitVec 32) ValueCell!14660))

(assert (=> mapNonEmpty!47980 (= (arr!37726 _values!996) (store mapRest!47980 mapKey!47980 mapValue!47980))))

(declare-fun b!1211341 () Bool)

(declare-fun lt!550085 () ListLongMap!17861)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6954 (ListLongMap!17861 (_ BitVec 64)) Bool)

(declare-fun +!4068 (ListLongMap!17861 tuple2!19892) ListLongMap!17861)

(assert (=> b!1211341 (contains!6954 (+!4068 lt!550085 (tuple2!19893 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!550087 () Unit!39999)

(declare-fun addStillContains!1053 (ListLongMap!17861 (_ BitVec 64) V!46113 (_ BitVec 64)) Unit!39999)

(assert (=> b!1211341 (= lt!550087 (addStillContains!1053 lt!550085 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1211341 call!59860))

(declare-fun call!59861 () ListLongMap!17861)

(assert (=> b!1211341 (= lt!550085 call!59861)))

(declare-fun lt!550086 () Unit!39999)

(assert (=> b!1211341 (= lt!550086 call!59862)))

(assert (=> b!1211341 (= e!687942 lt!550087)))

(declare-fun b!1211342 () Bool)

(declare-fun e!687930 () Unit!39999)

(declare-fun Unit!40001 () Unit!39999)

(assert (=> b!1211342 (= e!687930 Unit!40001)))

(declare-fun bm!59859 () Bool)

(declare-fun call!59863 () ListLongMap!17861)

(assert (=> bm!59859 (= call!59863 call!59861)))

(declare-fun b!1211343 () Bool)

(declare-fun res!804729 () Bool)

(assert (=> b!1211343 (=> (not res!804729) (not e!687940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1211343 (= res!804729 (validKeyInArray!0 k0!934))))

(declare-fun b!1211344 () Bool)

(declare-fun e!687933 () Bool)

(declare-fun e!687945 () Bool)

(assert (=> b!1211344 (= e!687933 e!687945)))

(declare-fun res!804733 () Bool)

(assert (=> b!1211344 (=> res!804733 e!687945)))

(assert (=> b!1211344 (= res!804733 (not (= from!1455 i!673)))))

(declare-fun lt!550074 () ListLongMap!17861)

(assert (=> b!1211344 (= lt!550074 (getCurrentListMapNoExtraKeys!5388 lt!550081 lt!550083 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!550077 () V!46113)

(assert (=> b!1211344 (= lt!550083 (array!78181 (store (arr!37726 _values!996) i!673 (ValueCellFull!14660 lt!550077)) (size!38264 _values!996)))))

(declare-fun dynLambda!3247 (Int (_ BitVec 64)) V!46113)

(assert (=> b!1211344 (= lt!550077 (dynLambda!3247 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!550079 () ListLongMap!17861)

(assert (=> b!1211344 (= lt!550079 (getCurrentListMapNoExtraKeys!5388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1211345 () Bool)

(declare-fun e!687944 () Bool)

(assert (=> b!1211345 (= e!687944 (bvslt i!673 (size!38264 _values!996)))))

(declare-fun e!687946 () Bool)

(assert (=> b!1211345 e!687946))

(declare-fun res!804730 () Bool)

(assert (=> b!1211345 (=> (not res!804730) (not e!687946))))

(declare-fun lt!550068 () ListLongMap!17861)

(declare-fun lt!550080 () V!46113)

(declare-fun -!1824 (ListLongMap!17861 (_ BitVec 64)) ListLongMap!17861)

(assert (=> b!1211345 (= res!804730 (= (-!1824 (+!4068 lt!550068 (tuple2!19893 (select (arr!37725 _keys!1208) from!1455) lt!550080)) (select (arr!37725 _keys!1208) from!1455)) lt!550068))))

(declare-fun lt!550073 () Unit!39999)

(declare-fun addThenRemoveForNewKeyIsSame!262 (ListLongMap!17861 (_ BitVec 64) V!46113) Unit!39999)

(assert (=> b!1211345 (= lt!550073 (addThenRemoveForNewKeyIsSame!262 lt!550068 (select (arr!37725 _keys!1208) from!1455) lt!550080))))

(declare-fun get!19243 (ValueCell!14660 V!46113) V!46113)

(assert (=> b!1211345 (= lt!550080 (get!19243 (select (arr!37726 _values!996) from!1455) lt!550077))))

(declare-fun lt!550071 () Unit!39999)

(assert (=> b!1211345 (= lt!550071 e!687930)))

(declare-fun c!119449 () Bool)

(assert (=> b!1211345 (= c!119449 (contains!6954 lt!550068 k0!934))))

(assert (=> b!1211345 (= lt!550068 (getCurrentListMapNoExtraKeys!5388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!687931 () Bool)

(declare-fun b!1211346 () Bool)

(declare-fun arrayContainsKey!0 (array!78178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1211346 (= e!687931 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211347 () Bool)

(declare-fun lt!550069 () Unit!39999)

(assert (=> b!1211347 (= e!687937 lt!550069)))

(assert (=> b!1211347 (= lt!550069 call!59864)))

(assert (=> b!1211347 call!59859))

(declare-fun b!1211348 () Bool)

(declare-fun e!687938 () Bool)

(assert (=> b!1211348 (= e!687938 (not e!687933))))

(declare-fun res!804732 () Bool)

(assert (=> b!1211348 (=> res!804732 e!687933)))

(assert (=> b!1211348 (= res!804732 (bvsgt from!1455 i!673))))

(assert (=> b!1211348 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!550075 () Unit!39999)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78178 (_ BitVec 64) (_ BitVec 32)) Unit!39999)

(assert (=> b!1211348 (= lt!550075 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1211349 () Bool)

(declare-fun res!804726 () Bool)

(assert (=> b!1211349 (=> (not res!804726) (not e!687938))))

(assert (=> b!1211349 (= res!804726 (arrayNoDuplicates!0 lt!550081 #b00000000000000000000000000000000 Nil!26668))))

(declare-fun b!1211350 () Bool)

(assert (=> b!1211350 (= e!687945 e!687944)))

(declare-fun res!804735 () Bool)

(assert (=> b!1211350 (=> res!804735 e!687944)))

(assert (=> b!1211350 (= res!804735 (not (= (select (arr!37725 _keys!1208) from!1455) k0!934)))))

(declare-fun e!687939 () Bool)

(assert (=> b!1211350 e!687939))

(declare-fun c!119447 () Bool)

(assert (=> b!1211350 (= c!119447 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!550082 () Unit!39999)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1065 (array!78178 array!78180 (_ BitVec 32) (_ BitVec 32) V!46113 V!46113 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39999)

(assert (=> b!1211350 (= lt!550082 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1065 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211351 () Bool)

(declare-fun res!804725 () Bool)

(assert (=> b!1211351 (=> (not res!804725) (not e!687940))))

(assert (=> b!1211351 (= res!804725 (and (= (size!38264 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38263 _keys!1208) (size!38264 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun e!687943 () Bool)

(declare-fun b!1211352 () Bool)

(assert (=> b!1211352 (= e!687943 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211353 () Bool)

(assert (=> b!1211353 (= e!687940 e!687938)))

(declare-fun res!804734 () Bool)

(assert (=> b!1211353 (=> (not res!804734) (not e!687938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78178 (_ BitVec 32)) Bool)

(assert (=> b!1211353 (= res!804734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550081 mask!1564))))

(assert (=> b!1211353 (= lt!550081 (array!78179 (store (arr!37725 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38263 _keys!1208)))))

(declare-fun b!1211354 () Bool)

(assert (=> b!1211354 call!59859))

(declare-fun lt!550084 () Unit!39999)

(assert (=> b!1211354 (= lt!550084 call!59864)))

(declare-fun e!687935 () Unit!39999)

(assert (=> b!1211354 (= e!687935 lt!550084)))

(declare-fun b!1211355 () Bool)

(declare-fun res!804736 () Bool)

(assert (=> b!1211355 (=> (not res!804736) (not e!687940))))

(assert (=> b!1211355 (= res!804736 (= (select (arr!37725 _keys!1208) i!673) k0!934))))

(declare-fun b!1211356 () Bool)

(assert (=> b!1211356 (= e!687943 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550070) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1211357 () Bool)

(declare-fun e!687936 () Bool)

(assert (=> b!1211357 (= e!687936 tp_is_empty!30739)))

(declare-fun b!1211358 () Bool)

(declare-fun Unit!40002 () Unit!39999)

(assert (=> b!1211358 (= e!687935 Unit!40002)))

(declare-fun b!1211359 () Bool)

(assert (=> b!1211359 (= e!687946 (= (-!1824 lt!550079 k0!934) lt!550068))))

(declare-fun b!1211360 () Bool)

(assert (=> b!1211360 (= e!687937 e!687935)))

(declare-fun c!119450 () Bool)

(assert (=> b!1211360 (= c!119450 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!550070))))

(declare-fun c!119448 () Bool)

(declare-fun bm!59860 () Bool)

(assert (=> bm!59860 (= call!59861 (+!4068 lt!550068 (ite (or c!119448 c!119446) (tuple2!19893 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19893 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1211361 () Bool)

(declare-fun Unit!40003 () Unit!39999)

(assert (=> b!1211361 (= e!687930 Unit!40003)))

(assert (=> b!1211361 (= lt!550070 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1211361 (= c!119448 (and (not lt!550070) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550088 () Unit!39999)

(assert (=> b!1211361 (= lt!550088 e!687942)))

(declare-fun lt!550078 () Unit!39999)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!593 (array!78178 array!78180 (_ BitVec 32) (_ BitVec 32) V!46113 V!46113 (_ BitVec 64) (_ BitVec 32) Int) Unit!39999)

(assert (=> b!1211361 (= lt!550078 (lemmaListMapContainsThenArrayContainsFrom!593 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119445 () Bool)

(assert (=> b!1211361 (= c!119445 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804723 () Bool)

(assert (=> b!1211361 (= res!804723 e!687943)))

(assert (=> b!1211361 (=> (not res!804723) (not e!687931))))

(assert (=> b!1211361 e!687931))

(declare-fun lt!550072 () Unit!39999)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78178 (_ BitVec 32) (_ BitVec 32)) Unit!39999)

(assert (=> b!1211361 (= lt!550072 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1211361 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26668)))

(declare-fun lt!550076 () Unit!39999)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78178 (_ BitVec 64) (_ BitVec 32) List!26671) Unit!39999)

(assert (=> b!1211361 (= lt!550076 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26668))))

(assert (=> b!1211361 false))

(declare-fun bm!59861 () Bool)

(assert (=> bm!59861 (= call!59862 (addStillContains!1053 lt!550068 (ite (or c!119448 c!119446) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119448 c!119446) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1211362 () Bool)

(assert (=> b!1211362 (= e!687939 (= call!59865 call!59858))))

(declare-fun b!1211363 () Bool)

(assert (=> b!1211363 (= e!687939 (= call!59865 (-!1824 call!59858 k0!934)))))

(declare-fun b!1211364 () Bool)

(declare-fun res!804724 () Bool)

(assert (=> b!1211364 (=> (not res!804724) (not e!687940))))

(assert (=> b!1211364 (= res!804724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!59862 () Bool)

(assert (=> bm!59862 (= call!59860 (contains!6954 (ite c!119448 lt!550085 call!59863) k0!934))))

(declare-fun b!1211365 () Bool)

(assert (=> b!1211365 (= e!687934 (and e!687936 mapRes!47980))))

(declare-fun condMapEmpty!47980 () Bool)

(declare-fun mapDefault!47980 () ValueCell!14660)

(assert (=> b!1211365 (= condMapEmpty!47980 (= (arr!37726 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14660)) mapDefault!47980)))))

(assert (= (and start!101068 res!804731) b!1211338))

(assert (= (and b!1211338 res!804728) b!1211351))

(assert (= (and b!1211351 res!804725) b!1211364))

(assert (= (and b!1211364 res!804724) b!1211340))

(assert (= (and b!1211340 res!804727) b!1211336))

(assert (= (and b!1211336 res!804722) b!1211343))

(assert (= (and b!1211343 res!804729) b!1211355))

(assert (= (and b!1211355 res!804736) b!1211353))

(assert (= (and b!1211353 res!804734) b!1211349))

(assert (= (and b!1211349 res!804726) b!1211348))

(assert (= (and b!1211348 (not res!804732)) b!1211344))

(assert (= (and b!1211344 (not res!804733)) b!1211350))

(assert (= (and b!1211350 c!119447) b!1211363))

(assert (= (and b!1211350 (not c!119447)) b!1211362))

(assert (= (or b!1211363 b!1211362) bm!59858))

(assert (= (or b!1211363 b!1211362) bm!59855))

(assert (= (and b!1211350 (not res!804735)) b!1211345))

(assert (= (and b!1211345 c!119449) b!1211361))

(assert (= (and b!1211345 (not c!119449)) b!1211342))

(assert (= (and b!1211361 c!119448) b!1211341))

(assert (= (and b!1211361 (not c!119448)) b!1211337))

(assert (= (and b!1211337 c!119446) b!1211347))

(assert (= (and b!1211337 (not c!119446)) b!1211360))

(assert (= (and b!1211360 c!119450) b!1211354))

(assert (= (and b!1211360 (not c!119450)) b!1211358))

(assert (= (or b!1211347 b!1211354) bm!59857))

(assert (= (or b!1211347 b!1211354) bm!59859))

(assert (= (or b!1211347 b!1211354) bm!59856))

(assert (= (or b!1211341 bm!59856) bm!59862))

(assert (= (or b!1211341 bm!59857) bm!59861))

(assert (= (or b!1211341 bm!59859) bm!59860))

(assert (= (and b!1211361 c!119445) b!1211352))

(assert (= (and b!1211361 (not c!119445)) b!1211356))

(assert (= (and b!1211361 res!804723) b!1211346))

(assert (= (and b!1211345 res!804730) b!1211359))

(assert (= (and b!1211365 condMapEmpty!47980) mapIsEmpty!47980))

(assert (= (and b!1211365 (not condMapEmpty!47980)) mapNonEmpty!47980))

(get-info :version)

(assert (= (and mapNonEmpty!47980 ((_ is ValueCellFull!14660) mapValue!47980)) b!1211339))

(assert (= (and b!1211365 ((_ is ValueCellFull!14660) mapDefault!47980)) b!1211357))

(assert (= start!101068 b!1211365))

(declare-fun b_lambda!21647 () Bool)

(assert (=> (not b_lambda!21647) (not b!1211344)))

(declare-fun t!39675 () Bool)

(declare-fun tb!10827 () Bool)

(assert (=> (and start!101068 (= defaultEntry!1004 defaultEntry!1004) t!39675) tb!10827))

(declare-fun result!22257 () Bool)

(assert (=> tb!10827 (= result!22257 tp_is_empty!30739)))

(assert (=> b!1211344 t!39675))

(declare-fun b_and!43145 () Bool)

(assert (= b_and!43143 (and (=> t!39675 result!22257) b_and!43145)))

(declare-fun m!1116291 () Bool)

(assert (=> b!1211353 m!1116291))

(declare-fun m!1116293 () Bool)

(assert (=> b!1211353 m!1116293))

(declare-fun m!1116295 () Bool)

(assert (=> bm!59855 m!1116295))

(declare-fun m!1116297 () Bool)

(assert (=> bm!59862 m!1116297))

(declare-fun m!1116299 () Bool)

(assert (=> b!1211361 m!1116299))

(declare-fun m!1116301 () Bool)

(assert (=> b!1211361 m!1116301))

(declare-fun m!1116303 () Bool)

(assert (=> b!1211361 m!1116303))

(declare-fun m!1116305 () Bool)

(assert (=> b!1211361 m!1116305))

(declare-fun m!1116307 () Bool)

(assert (=> b!1211341 m!1116307))

(assert (=> b!1211341 m!1116307))

(declare-fun m!1116309 () Bool)

(assert (=> b!1211341 m!1116309))

(declare-fun m!1116311 () Bool)

(assert (=> b!1211341 m!1116311))

(declare-fun m!1116313 () Bool)

(assert (=> b!1211344 m!1116313))

(declare-fun m!1116315 () Bool)

(assert (=> b!1211344 m!1116315))

(declare-fun m!1116317 () Bool)

(assert (=> b!1211344 m!1116317))

(declare-fun m!1116319 () Bool)

(assert (=> b!1211344 m!1116319))

(declare-fun m!1116321 () Bool)

(assert (=> b!1211345 m!1116321))

(declare-fun m!1116323 () Bool)

(assert (=> b!1211345 m!1116323))

(declare-fun m!1116325 () Bool)

(assert (=> b!1211345 m!1116325))

(assert (=> b!1211345 m!1116323))

(declare-fun m!1116327 () Bool)

(assert (=> b!1211345 m!1116327))

(declare-fun m!1116329 () Bool)

(assert (=> b!1211345 m!1116329))

(declare-fun m!1116331 () Bool)

(assert (=> b!1211345 m!1116331))

(assert (=> b!1211345 m!1116323))

(assert (=> b!1211345 m!1116321))

(assert (=> b!1211345 m!1116295))

(assert (=> b!1211345 m!1116329))

(declare-fun m!1116333 () Bool)

(assert (=> b!1211345 m!1116333))

(declare-fun m!1116335 () Bool)

(assert (=> b!1211340 m!1116335))

(declare-fun m!1116337 () Bool)

(assert (=> b!1211346 m!1116337))

(assert (=> b!1211352 m!1116337))

(declare-fun m!1116339 () Bool)

(assert (=> bm!59860 m!1116339))

(declare-fun m!1116341 () Bool)

(assert (=> start!101068 m!1116341))

(declare-fun m!1116343 () Bool)

(assert (=> start!101068 m!1116343))

(declare-fun m!1116345 () Bool)

(assert (=> b!1211348 m!1116345))

(declare-fun m!1116347 () Bool)

(assert (=> b!1211348 m!1116347))

(declare-fun m!1116349 () Bool)

(assert (=> b!1211359 m!1116349))

(declare-fun m!1116351 () Bool)

(assert (=> b!1211355 m!1116351))

(assert (=> b!1211350 m!1116323))

(declare-fun m!1116353 () Bool)

(assert (=> b!1211350 m!1116353))

(declare-fun m!1116355 () Bool)

(assert (=> mapNonEmpty!47980 m!1116355))

(declare-fun m!1116357 () Bool)

(assert (=> b!1211363 m!1116357))

(declare-fun m!1116359 () Bool)

(assert (=> b!1211338 m!1116359))

(declare-fun m!1116361 () Bool)

(assert (=> bm!59861 m!1116361))

(declare-fun m!1116363 () Bool)

(assert (=> bm!59858 m!1116363))

(declare-fun m!1116365 () Bool)

(assert (=> b!1211364 m!1116365))

(declare-fun m!1116367 () Bool)

(assert (=> b!1211349 m!1116367))

(declare-fun m!1116369 () Bool)

(assert (=> b!1211343 m!1116369))

(check-sat (not mapNonEmpty!47980) (not b!1211346) (not b!1211350) (not b_lambda!21647) (not b!1211353) (not b!1211344) (not b!1211363) (not b!1211349) (not bm!59862) (not b!1211343) (not bm!59860) tp_is_empty!30739 (not bm!59861) (not b!1211352) (not b!1211345) (not b!1211341) (not b!1211340) (not b!1211348) (not b!1211338) (not b!1211364) (not start!101068) (not b!1211361) (not b_next!26035) (not bm!59858) (not bm!59855) b_and!43145 (not b!1211359))
(check-sat b_and!43145 (not b_next!26035))
