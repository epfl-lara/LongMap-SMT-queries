; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101136 () Bool)

(assert start!101136)

(declare-fun b_free!26065 () Bool)

(declare-fun b_next!26065 () Bool)

(assert (=> start!101136 (= b_free!26065 (not b_next!26065))))

(declare-fun tp!91216 () Bool)

(declare-fun b_and!43229 () Bool)

(assert (=> start!101136 (= tp!91216 b_and!43229)))

(declare-fun b!1212907 () Bool)

(declare-fun e!688819 () Bool)

(declare-fun e!688821 () Bool)

(assert (=> b!1212907 (= e!688819 e!688821)))

(declare-fun res!805480 () Bool)

(assert (=> b!1212907 (=> res!805480 e!688821)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1212907 (= res!805480 (not (= from!1455 i!673)))))

(declare-datatypes ((V!46153 0))(
  ( (V!46154 (val!15441 Int)) )
))
(declare-fun zeroValue!944 () V!46153)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19918 0))(
  ( (tuple2!19919 (_1!9970 (_ BitVec 64)) (_2!9970 V!46153)) )
))
(declare-datatypes ((List!26696 0))(
  ( (Nil!26693) (Cons!26692 (h!27901 tuple2!19918) (t!39732 List!26696)) )
))
(declare-datatypes ((ListLongMap!17887 0))(
  ( (ListLongMap!17888 (toList!8959 List!26696)) )
))
(declare-fun lt!551189 () ListLongMap!17887)

(declare-fun minValue!944 () V!46153)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14675 0))(
  ( (ValueCellFull!14675 (v!18093 V!46153)) (EmptyCell!14675) )
))
(declare-datatypes ((array!78240 0))(
  ( (array!78241 (arr!37755 (Array (_ BitVec 32) ValueCell!14675)) (size!38293 (_ BitVec 32))) )
))
(declare-fun lt!551205 () array!78240)

(declare-datatypes ((array!78242 0))(
  ( (array!78243 (arr!37756 (Array (_ BitVec 32) (_ BitVec 64))) (size!38294 (_ BitVec 32))) )
))
(declare-fun lt!551206 () array!78242)

(declare-fun getCurrentListMapNoExtraKeys!5400 (array!78242 array!78240 (_ BitVec 32) (_ BitVec 32) V!46153 V!46153 (_ BitVec 32) Int) ListLongMap!17887)

(assert (=> b!1212907 (= lt!551189 (getCurrentListMapNoExtraKeys!5400 lt!551206 lt!551205 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!551187 () V!46153)

(declare-fun _values!996 () array!78240)

(assert (=> b!1212907 (= lt!551205 (array!78241 (store (arr!37755 _values!996) i!673 (ValueCellFull!14675 lt!551187)) (size!38293 _values!996)))))

(declare-fun dynLambda!3255 (Int (_ BitVec 64)) V!46153)

(assert (=> b!1212907 (= lt!551187 (dynLambda!3255 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!78242)

(declare-fun lt!551198 () ListLongMap!17887)

(assert (=> b!1212907 (= lt!551198 (getCurrentListMapNoExtraKeys!5400 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1212908 () Bool)

(declare-fun call!60246 () ListLongMap!17887)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6966 (ListLongMap!17887 (_ BitVec 64)) Bool)

(assert (=> b!1212908 (contains!6966 call!60246 k0!934)))

(declare-datatypes ((Unit!40063 0))(
  ( (Unit!40064) )
))
(declare-fun lt!551200 () Unit!40063)

(declare-fun call!60245 () Unit!40063)

(assert (=> b!1212908 (= lt!551200 call!60245)))

(declare-fun call!60243 () Bool)

(assert (=> b!1212908 call!60243))

(declare-fun lt!551204 () ListLongMap!17887)

(declare-fun lt!551192 () ListLongMap!17887)

(declare-fun +!4078 (ListLongMap!17887 tuple2!19918) ListLongMap!17887)

(assert (=> b!1212908 (= lt!551204 (+!4078 lt!551192 (tuple2!19919 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!551202 () Unit!40063)

(declare-fun addStillContains!1063 (ListLongMap!17887 (_ BitVec 64) V!46153 (_ BitVec 64)) Unit!40063)

(assert (=> b!1212908 (= lt!551202 (addStillContains!1063 lt!551192 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!688824 () Unit!40063)

(assert (=> b!1212908 (= e!688824 lt!551200)))

(declare-fun b!1212909 () Bool)

(declare-fun e!688820 () Bool)

(declare-fun call!60248 () ListLongMap!17887)

(declare-fun call!60247 () ListLongMap!17887)

(assert (=> b!1212909 (= e!688820 (= call!60248 call!60247))))

(declare-fun mapIsEmpty!48028 () Bool)

(declare-fun mapRes!48028 () Bool)

(assert (=> mapIsEmpty!48028 mapRes!48028))

(declare-fun b!1212910 () Bool)

(declare-fun e!688825 () Unit!40063)

(declare-fun Unit!40065 () Unit!40063)

(assert (=> b!1212910 (= e!688825 Unit!40065)))

(declare-fun e!688818 () Bool)

(declare-fun b!1212911 () Bool)

(declare-fun arrayContainsKey!0 (array!78242 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1212911 (= e!688818 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1212912 () Bool)

(declare-fun e!688816 () Unit!40063)

(declare-fun Unit!40066 () Unit!40063)

(assert (=> b!1212912 (= e!688816 Unit!40066)))

(declare-fun b!1212913 () Bool)

(declare-fun -!1836 (ListLongMap!17887 (_ BitVec 64)) ListLongMap!17887)

(assert (=> b!1212913 (= e!688820 (= call!60248 (-!1836 call!60247 k0!934)))))

(declare-fun c!119775 () Bool)

(declare-fun bm!60238 () Bool)

(declare-fun c!119773 () Bool)

(assert (=> bm!60238 (= call!60246 (+!4078 (ite c!119773 lt!551204 lt!551192) (ite c!119773 (tuple2!19919 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119775 (tuple2!19919 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19919 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1212914 () Bool)

(declare-fun res!805472 () Bool)

(declare-fun e!688827 () Bool)

(assert (=> b!1212914 (=> (not res!805472) (not e!688827))))

(assert (=> b!1212914 (= res!805472 (and (= (size!38293 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38294 _keys!1208) (size!38293 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!60239 () Bool)

(assert (=> bm!60239 (= call!60247 (getCurrentListMapNoExtraKeys!5400 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212915 () Bool)

(declare-fun res!805470 () Bool)

(assert (=> b!1212915 (=> (not res!805470) (not e!688827))))

(assert (=> b!1212915 (= res!805470 (= (select (arr!37756 _keys!1208) i!673) k0!934))))

(declare-fun bm!60240 () Bool)

(assert (=> bm!60240 (= call!60248 (getCurrentListMapNoExtraKeys!5400 lt!551206 lt!551205 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212916 () Bool)

(declare-fun e!688831 () Unit!40063)

(declare-fun lt!551194 () Unit!40063)

(assert (=> b!1212916 (= e!688831 lt!551194)))

(declare-fun call!60241 () Unit!40063)

(assert (=> b!1212916 (= lt!551194 call!60241)))

(declare-fun call!60244 () Bool)

(assert (=> b!1212916 call!60244))

(declare-fun b!1212917 () Bool)

(declare-fun lt!551190 () Bool)

(assert (=> b!1212917 (= c!119775 (and (not lt!551190) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1212917 (= e!688824 e!688831)))

(declare-fun bm!60241 () Bool)

(assert (=> bm!60241 (= call!60245 (addStillContains!1063 (ite c!119773 lt!551204 lt!551192) (ite c!119773 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119775 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119773 minValue!944 (ite c!119775 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1212918 () Bool)

(assert (=> b!1212918 (= e!688818 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!551190) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1212919 () Bool)

(declare-fun res!805469 () Bool)

(assert (=> b!1212919 (=> (not res!805469) (not e!688827))))

(declare-datatypes ((List!26697 0))(
  ( (Nil!26694) (Cons!26693 (h!27902 (_ BitVec 64)) (t!39733 List!26697)) )
))
(declare-fun arrayNoDuplicates!0 (array!78242 (_ BitVec 32) List!26697) Bool)

(assert (=> b!1212919 (= res!805469 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26694))))

(declare-fun b!1212920 () Bool)

(declare-fun e!688817 () Bool)

(assert (=> b!1212920 (= e!688827 e!688817)))

(declare-fun res!805477 () Bool)

(assert (=> b!1212920 (=> (not res!805477) (not e!688817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78242 (_ BitVec 32)) Bool)

(assert (=> b!1212920 (= res!805477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!551206 mask!1564))))

(assert (=> b!1212920 (= lt!551206 (array!78243 (store (arr!37756 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38294 _keys!1208)))))

(declare-fun bm!60242 () Bool)

(assert (=> bm!60242 (= call!60244 call!60243)))

(declare-fun b!1212921 () Bool)

(assert (=> b!1212921 (= e!688817 (not e!688819))))

(declare-fun res!805478 () Bool)

(assert (=> b!1212921 (=> res!805478 e!688819)))

(assert (=> b!1212921 (= res!805478 (bvsgt from!1455 i!673))))

(assert (=> b!1212921 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!551193 () Unit!40063)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78242 (_ BitVec 64) (_ BitVec 32)) Unit!40063)

(assert (=> b!1212921 (= lt!551193 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1212922 () Bool)

(declare-fun res!805482 () Bool)

(assert (=> b!1212922 (=> (not res!805482) (not e!688827))))

(assert (=> b!1212922 (= res!805482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1212923 () Bool)

(declare-fun e!688815 () Bool)

(declare-fun tp_is_empty!30769 () Bool)

(assert (=> b!1212923 (= e!688815 tp_is_empty!30769)))

(declare-fun b!1212924 () Bool)

(declare-fun res!805479 () Bool)

(assert (=> b!1212924 (=> (not res!805479) (not e!688827))))

(assert (=> b!1212924 (= res!805479 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38294 _keys!1208))))))

(declare-fun mapNonEmpty!48028 () Bool)

(declare-fun tp!91217 () Bool)

(assert (=> mapNonEmpty!48028 (= mapRes!48028 (and tp!91217 e!688815))))

(declare-fun mapRest!48028 () (Array (_ BitVec 32) ValueCell!14675))

(declare-fun mapKey!48028 () (_ BitVec 32))

(declare-fun mapValue!48028 () ValueCell!14675)

(assert (=> mapNonEmpty!48028 (= (arr!37755 _values!996) (store mapRest!48028 mapKey!48028 mapValue!48028))))

(declare-fun b!1212925 () Bool)

(declare-fun e!688823 () Bool)

(assert (=> b!1212925 (= e!688821 e!688823)))

(declare-fun res!805483 () Bool)

(assert (=> b!1212925 (=> res!805483 e!688823)))

(assert (=> b!1212925 (= res!805483 (not (= (select (arr!37756 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1212925 e!688820))

(declare-fun c!119771 () Bool)

(assert (=> b!1212925 (= c!119771 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!551191 () Unit!40063)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1074 (array!78242 array!78240 (_ BitVec 32) (_ BitVec 32) V!46153 V!46153 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40063)

(assert (=> b!1212925 (= lt!551191 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1074 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212926 () Bool)

(declare-fun res!805471 () Bool)

(assert (=> b!1212926 (=> (not res!805471) (not e!688827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1212926 (= res!805471 (validKeyInArray!0 k0!934))))

(declare-fun lt!551207 () ListLongMap!17887)

(declare-fun e!688828 () Bool)

(declare-fun b!1212927 () Bool)

(assert (=> b!1212927 (= e!688828 (= lt!551207 (getCurrentListMapNoExtraKeys!5400 lt!551206 lt!551205 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1212928 () Bool)

(declare-fun res!805475 () Bool)

(assert (=> b!1212928 (=> (not res!805475) (not e!688827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1212928 (= res!805475 (validMask!0 mask!1564))))

(declare-fun b!1212929 () Bool)

(declare-fun res!805474 () Bool)

(assert (=> b!1212929 (=> (not res!805474) (not e!688817))))

(assert (=> b!1212929 (= res!805474 (arrayNoDuplicates!0 lt!551206 #b00000000000000000000000000000000 Nil!26694))))

(declare-fun b!1212930 () Bool)

(declare-fun e!688830 () Bool)

(declare-fun e!688829 () Bool)

(assert (=> b!1212930 (= e!688830 (and e!688829 mapRes!48028))))

(declare-fun condMapEmpty!48028 () Bool)

(declare-fun mapDefault!48028 () ValueCell!14675)

(assert (=> b!1212930 (= condMapEmpty!48028 (= (arr!37755 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14675)) mapDefault!48028)))))

(declare-fun bm!60243 () Bool)

(declare-fun call!60242 () ListLongMap!17887)

(assert (=> bm!60243 (= call!60242 call!60246)))

(declare-fun b!1212931 () Bool)

(assert (=> b!1212931 (= e!688823 true)))

(assert (=> b!1212931 e!688828))

(declare-fun res!805473 () Bool)

(assert (=> b!1212931 (=> (not res!805473) (not e!688828))))

(assert (=> b!1212931 (= res!805473 (= lt!551207 lt!551192))))

(assert (=> b!1212931 (= lt!551207 (-!1836 lt!551198 k0!934))))

(declare-fun lt!551196 () V!46153)

(assert (=> b!1212931 (= (-!1836 (+!4078 lt!551192 (tuple2!19919 (select (arr!37756 _keys!1208) from!1455) lt!551196)) (select (arr!37756 _keys!1208) from!1455)) lt!551192)))

(declare-fun lt!551197 () Unit!40063)

(declare-fun addThenRemoveForNewKeyIsSame!270 (ListLongMap!17887 (_ BitVec 64) V!46153) Unit!40063)

(assert (=> b!1212931 (= lt!551197 (addThenRemoveForNewKeyIsSame!270 lt!551192 (select (arr!37756 _keys!1208) from!1455) lt!551196))))

(declare-fun get!19263 (ValueCell!14675 V!46153) V!46153)

(assert (=> b!1212931 (= lt!551196 (get!19263 (select (arr!37755 _values!996) from!1455) lt!551187))))

(declare-fun lt!551186 () Unit!40063)

(assert (=> b!1212931 (= lt!551186 e!688825)))

(declare-fun c!119770 () Bool)

(assert (=> b!1212931 (= c!119770 (contains!6966 lt!551192 k0!934))))

(assert (=> b!1212931 (= lt!551192 (getCurrentListMapNoExtraKeys!5400 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!60244 () Bool)

(assert (=> bm!60244 (= call!60243 (contains!6966 (ite c!119773 lt!551204 call!60242) k0!934))))

(declare-fun b!1212932 () Bool)

(assert (=> b!1212932 (= e!688831 e!688816)))

(declare-fun c!119774 () Bool)

(assert (=> b!1212932 (= c!119774 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!551190))))

(declare-fun e!688822 () Bool)

(declare-fun b!1212933 () Bool)

(assert (=> b!1212933 (= e!688822 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1212934 () Bool)

(assert (=> b!1212934 (= e!688829 tp_is_empty!30769)))

(declare-fun b!1212936 () Bool)

(declare-fun Unit!40067 () Unit!40063)

(assert (=> b!1212936 (= e!688825 Unit!40067)))

(assert (=> b!1212936 (= lt!551190 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1212936 (= c!119773 (and (not lt!551190) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!551188 () Unit!40063)

(assert (=> b!1212936 (= lt!551188 e!688824)))

(declare-fun lt!551203 () Unit!40063)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!605 (array!78242 array!78240 (_ BitVec 32) (_ BitVec 32) V!46153 V!46153 (_ BitVec 64) (_ BitVec 32) Int) Unit!40063)

(assert (=> b!1212936 (= lt!551203 (lemmaListMapContainsThenArrayContainsFrom!605 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119772 () Bool)

(assert (=> b!1212936 (= c!119772 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805476 () Bool)

(assert (=> b!1212936 (= res!805476 e!688818)))

(assert (=> b!1212936 (=> (not res!805476) (not e!688822))))

(assert (=> b!1212936 e!688822))

(declare-fun lt!551195 () Unit!40063)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78242 (_ BitVec 32) (_ BitVec 32)) Unit!40063)

(assert (=> b!1212936 (= lt!551195 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1212936 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26694)))

(declare-fun lt!551201 () Unit!40063)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78242 (_ BitVec 64) (_ BitVec 32) List!26697) Unit!40063)

(assert (=> b!1212936 (= lt!551201 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26694))))

(assert (=> b!1212936 false))

(declare-fun bm!60245 () Bool)

(assert (=> bm!60245 (= call!60241 call!60245)))

(declare-fun b!1212935 () Bool)

(assert (=> b!1212935 call!60244))

(declare-fun lt!551199 () Unit!40063)

(assert (=> b!1212935 (= lt!551199 call!60241)))

(assert (=> b!1212935 (= e!688816 lt!551199)))

(declare-fun res!805481 () Bool)

(assert (=> start!101136 (=> (not res!805481) (not e!688827))))

(assert (=> start!101136 (= res!805481 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38294 _keys!1208))))))

(assert (=> start!101136 e!688827))

(assert (=> start!101136 tp_is_empty!30769))

(declare-fun array_inv!28862 (array!78242) Bool)

(assert (=> start!101136 (array_inv!28862 _keys!1208)))

(assert (=> start!101136 true))

(assert (=> start!101136 tp!91216))

(declare-fun array_inv!28863 (array!78240) Bool)

(assert (=> start!101136 (and (array_inv!28863 _values!996) e!688830)))

(assert (= (and start!101136 res!805481) b!1212928))

(assert (= (and b!1212928 res!805475) b!1212914))

(assert (= (and b!1212914 res!805472) b!1212922))

(assert (= (and b!1212922 res!805482) b!1212919))

(assert (= (and b!1212919 res!805469) b!1212924))

(assert (= (and b!1212924 res!805479) b!1212926))

(assert (= (and b!1212926 res!805471) b!1212915))

(assert (= (and b!1212915 res!805470) b!1212920))

(assert (= (and b!1212920 res!805477) b!1212929))

(assert (= (and b!1212929 res!805474) b!1212921))

(assert (= (and b!1212921 (not res!805478)) b!1212907))

(assert (= (and b!1212907 (not res!805480)) b!1212925))

(assert (= (and b!1212925 c!119771) b!1212913))

(assert (= (and b!1212925 (not c!119771)) b!1212909))

(assert (= (or b!1212913 b!1212909) bm!60240))

(assert (= (or b!1212913 b!1212909) bm!60239))

(assert (= (and b!1212925 (not res!805483)) b!1212931))

(assert (= (and b!1212931 c!119770) b!1212936))

(assert (= (and b!1212931 (not c!119770)) b!1212910))

(assert (= (and b!1212936 c!119773) b!1212908))

(assert (= (and b!1212936 (not c!119773)) b!1212917))

(assert (= (and b!1212917 c!119775) b!1212916))

(assert (= (and b!1212917 (not c!119775)) b!1212932))

(assert (= (and b!1212932 c!119774) b!1212935))

(assert (= (and b!1212932 (not c!119774)) b!1212912))

(assert (= (or b!1212916 b!1212935) bm!60245))

(assert (= (or b!1212916 b!1212935) bm!60243))

(assert (= (or b!1212916 b!1212935) bm!60242))

(assert (= (or b!1212908 bm!60242) bm!60244))

(assert (= (or b!1212908 bm!60245) bm!60241))

(assert (= (or b!1212908 bm!60243) bm!60238))

(assert (= (and b!1212936 c!119772) b!1212911))

(assert (= (and b!1212936 (not c!119772)) b!1212918))

(assert (= (and b!1212936 res!805476) b!1212933))

(assert (= (and b!1212931 res!805473) b!1212927))

(assert (= (and b!1212930 condMapEmpty!48028) mapIsEmpty!48028))

(assert (= (and b!1212930 (not condMapEmpty!48028)) mapNonEmpty!48028))

(get-info :version)

(assert (= (and mapNonEmpty!48028 ((_ is ValueCellFull!14675) mapValue!48028)) b!1212923))

(assert (= (and b!1212930 ((_ is ValueCellFull!14675) mapDefault!48028)) b!1212934))

(assert (= start!101136 b!1212930))

(declare-fun b_lambda!21731 () Bool)

(assert (=> (not b_lambda!21731) (not b!1212907)))

(declare-fun t!39731 () Bool)

(declare-fun tb!10857 () Bool)

(assert (=> (and start!101136 (= defaultEntry!1004 defaultEntry!1004) t!39731) tb!10857))

(declare-fun result!22319 () Bool)

(assert (=> tb!10857 (= result!22319 tp_is_empty!30769)))

(assert (=> b!1212907 t!39731))

(declare-fun b_and!43231 () Bool)

(assert (= b_and!43229 (and (=> t!39731 result!22319) b_and!43231)))

(declare-fun m!1117815 () Bool)

(assert (=> b!1212915 m!1117815))

(declare-fun m!1117817 () Bool)

(assert (=> b!1212929 m!1117817))

(declare-fun m!1117819 () Bool)

(assert (=> b!1212928 m!1117819))

(declare-fun m!1117821 () Bool)

(assert (=> bm!60244 m!1117821))

(declare-fun m!1117823 () Bool)

(assert (=> bm!60238 m!1117823))

(declare-fun m!1117825 () Bool)

(assert (=> b!1212920 m!1117825))

(declare-fun m!1117827 () Bool)

(assert (=> b!1212920 m!1117827))

(declare-fun m!1117829 () Bool)

(assert (=> b!1212927 m!1117829))

(declare-fun m!1117831 () Bool)

(assert (=> bm!60241 m!1117831))

(declare-fun m!1117833 () Bool)

(assert (=> b!1212911 m!1117833))

(declare-fun m!1117835 () Bool)

(assert (=> b!1212919 m!1117835))

(declare-fun m!1117837 () Bool)

(assert (=> b!1212931 m!1117837))

(declare-fun m!1117839 () Bool)

(assert (=> b!1212931 m!1117839))

(declare-fun m!1117841 () Bool)

(assert (=> b!1212931 m!1117841))

(declare-fun m!1117843 () Bool)

(assert (=> b!1212931 m!1117843))

(assert (=> b!1212931 m!1117839))

(declare-fun m!1117845 () Bool)

(assert (=> b!1212931 m!1117845))

(declare-fun m!1117847 () Bool)

(assert (=> b!1212931 m!1117847))

(declare-fun m!1117849 () Bool)

(assert (=> b!1212931 m!1117849))

(assert (=> b!1212931 m!1117849))

(declare-fun m!1117851 () Bool)

(assert (=> b!1212931 m!1117851))

(assert (=> b!1212931 m!1117841))

(assert (=> b!1212931 m!1117849))

(declare-fun m!1117853 () Bool)

(assert (=> b!1212931 m!1117853))

(declare-fun m!1117855 () Bool)

(assert (=> start!101136 m!1117855))

(declare-fun m!1117857 () Bool)

(assert (=> start!101136 m!1117857))

(assert (=> b!1212925 m!1117849))

(declare-fun m!1117859 () Bool)

(assert (=> b!1212925 m!1117859))

(declare-fun m!1117861 () Bool)

(assert (=> b!1212907 m!1117861))

(declare-fun m!1117863 () Bool)

(assert (=> b!1212907 m!1117863))

(declare-fun m!1117865 () Bool)

(assert (=> b!1212907 m!1117865))

(declare-fun m!1117867 () Bool)

(assert (=> b!1212907 m!1117867))

(declare-fun m!1117869 () Bool)

(assert (=> b!1212908 m!1117869))

(declare-fun m!1117871 () Bool)

(assert (=> b!1212908 m!1117871))

(declare-fun m!1117873 () Bool)

(assert (=> b!1212908 m!1117873))

(declare-fun m!1117875 () Bool)

(assert (=> mapNonEmpty!48028 m!1117875))

(assert (=> bm!60239 m!1117837))

(declare-fun m!1117877 () Bool)

(assert (=> b!1212926 m!1117877))

(assert (=> bm!60240 m!1117829))

(assert (=> b!1212933 m!1117833))

(declare-fun m!1117879 () Bool)

(assert (=> b!1212921 m!1117879))

(declare-fun m!1117881 () Bool)

(assert (=> b!1212921 m!1117881))

(declare-fun m!1117883 () Bool)

(assert (=> b!1212936 m!1117883))

(declare-fun m!1117885 () Bool)

(assert (=> b!1212936 m!1117885))

(declare-fun m!1117887 () Bool)

(assert (=> b!1212936 m!1117887))

(declare-fun m!1117889 () Bool)

(assert (=> b!1212936 m!1117889))

(declare-fun m!1117891 () Bool)

(assert (=> b!1212913 m!1117891))

(declare-fun m!1117893 () Bool)

(assert (=> b!1212922 m!1117893))

(check-sat tp_is_empty!30769 (not b_lambda!21731) (not bm!60238) (not b!1212922) (not b!1212936) (not b!1212926) (not b!1212928) (not b!1212925) (not b!1212911) (not start!101136) (not bm!60241) (not b!1212931) (not b!1212921) (not mapNonEmpty!48028) (not b!1212929) (not b!1212920) (not b!1212908) (not bm!60240) (not bm!60244) (not bm!60239) (not b!1212927) (not b!1212907) (not b!1212913) (not b_next!26065) b_and!43231 (not b!1212933) (not b!1212919))
(check-sat b_and!43231 (not b_next!26065))
