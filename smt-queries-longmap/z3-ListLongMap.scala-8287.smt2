; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100988 () Bool)

(assert start!100988)

(declare-fun b_free!25993 () Bool)

(declare-fun b_next!25993 () Bool)

(assert (=> start!100988 (= b_free!25993 (not b_next!25993))))

(declare-fun tp!90995 () Bool)

(declare-fun b_and!43041 () Bool)

(assert (=> start!100988 (= tp!90995 b_and!43041)))

(declare-fun res!803720 () Bool)

(declare-fun e!686801 () Bool)

(assert (=> start!100988 (=> (not res!803720) (not e!686801))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78092 0))(
  ( (array!78093 (arr!37683 (Array (_ BitVec 32) (_ BitVec 64))) (size!38221 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78092)

(assert (=> start!100988 (= res!803720 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38221 _keys!1208))))))

(assert (=> start!100988 e!686801))

(declare-fun tp_is_empty!30697 () Bool)

(assert (=> start!100988 tp_is_empty!30697))

(declare-fun array_inv!28814 (array!78092) Bool)

(assert (=> start!100988 (array_inv!28814 _keys!1208)))

(assert (=> start!100988 true))

(assert (=> start!100988 tp!90995))

(declare-datatypes ((V!46057 0))(
  ( (V!46058 (val!15405 Int)) )
))
(declare-datatypes ((ValueCell!14639 0))(
  ( (ValueCellFull!14639 (v!18055 V!46057)) (EmptyCell!14639) )
))
(declare-datatypes ((array!78094 0))(
  ( (array!78095 (arr!37684 (Array (_ BitVec 32) ValueCell!14639)) (size!38222 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78094)

(declare-fun e!686793 () Bool)

(declare-fun array_inv!28815 (array!78094) Bool)

(assert (=> start!100988 (and (array_inv!28815 _values!996) e!686793)))

(declare-fun b!1209275 () Bool)

(declare-fun call!59334 () Bool)

(assert (=> b!1209275 call!59334))

(declare-datatypes ((Unit!39919 0))(
  ( (Unit!39920) )
))
(declare-fun lt!548771 () Unit!39919)

(declare-fun call!59340 () Unit!39919)

(assert (=> b!1209275 (= lt!548771 call!59340)))

(declare-fun e!686804 () Unit!39919)

(assert (=> b!1209275 (= e!686804 lt!548771)))

(declare-fun lt!548781 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1209276 () Bool)

(declare-fun e!686795 () Bool)

(assert (=> b!1209276 (= e!686795 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!548781) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1209277 () Bool)

(declare-fun e!686802 () Unit!39919)

(declare-fun lt!548778 () Unit!39919)

(assert (=> b!1209277 (= e!686802 lt!548778)))

(assert (=> b!1209277 (= lt!548778 call!59340)))

(assert (=> b!1209277 call!59334))

(declare-fun b!1209278 () Bool)

(declare-fun e!686798 () Bool)

(declare-fun e!686800 () Bool)

(assert (=> b!1209278 (= e!686798 e!686800)))

(declare-fun res!803729 () Bool)

(assert (=> b!1209278 (=> res!803729 e!686800)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1209278 (= res!803729 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46057)

(declare-fun lt!548770 () array!78092)

(declare-datatypes ((tuple2!19850 0))(
  ( (tuple2!19851 (_1!9936 (_ BitVec 64)) (_2!9936 V!46057)) )
))
(declare-datatypes ((List!26630 0))(
  ( (Nil!26627) (Cons!26626 (h!27835 tuple2!19850) (t!39594 List!26630)) )
))
(declare-datatypes ((ListLongMap!17819 0))(
  ( (ListLongMap!17820 (toList!8925 List!26630)) )
))
(declare-fun lt!548772 () ListLongMap!17819)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46057)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!548776 () array!78094)

(declare-fun getCurrentListMapNoExtraKeys!5367 (array!78092 array!78094 (_ BitVec 32) (_ BitVec 32) V!46057 V!46057 (_ BitVec 32) Int) ListLongMap!17819)

(assert (=> b!1209278 (= lt!548772 (getCurrentListMapNoExtraKeys!5367 lt!548770 lt!548776 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3231 (Int (_ BitVec 64)) V!46057)

(assert (=> b!1209278 (= lt!548776 (array!78095 (store (arr!37684 _values!996) i!673 (ValueCellFull!14639 (dynLambda!3231 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38222 _values!996)))))

(declare-fun lt!548769 () ListLongMap!17819)

(assert (=> b!1209278 (= lt!548769 (getCurrentListMapNoExtraKeys!5367 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1209279 () Bool)

(declare-fun e!686790 () Bool)

(assert (=> b!1209279 (= e!686800 e!686790)))

(declare-fun res!803723 () Bool)

(assert (=> b!1209279 (=> res!803723 e!686790)))

(assert (=> b!1209279 (= res!803723 (not (= (select (arr!37683 _keys!1208) from!1455) k0!934)))))

(declare-fun e!686791 () Bool)

(assert (=> b!1209279 e!686791))

(declare-fun c!119036 () Bool)

(assert (=> b!1209279 (= c!119036 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!548777 () Unit!39919)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1051 (array!78092 array!78094 (_ BitVec 32) (_ BitVec 32) V!46057 V!46057 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39919)

(assert (=> b!1209279 (= lt!548777 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1051 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!59333 () ListLongMap!17819)

(declare-fun bm!59330 () Bool)

(assert (=> bm!59330 (= call!59333 (getCurrentListMapNoExtraKeys!5367 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119037 () Bool)

(declare-fun bm!59331 () Bool)

(declare-fun c!119040 () Bool)

(declare-fun call!59339 () Unit!39919)

(declare-fun lt!548783 () ListLongMap!17819)

(declare-fun addStillContains!1035 (ListLongMap!17819 (_ BitVec 64) V!46057 (_ BitVec 64)) Unit!39919)

(assert (=> bm!59331 (= call!59339 (addStillContains!1035 lt!548783 (ite (or c!119037 c!119040) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119037 c!119040) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!59332 () Bool)

(assert (=> bm!59332 (= call!59340 call!59339)))

(declare-fun e!686792 () Bool)

(declare-fun b!1209280 () Bool)

(declare-fun arrayContainsKey!0 (array!78092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1209280 (= e!686792 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1209281 () Bool)

(assert (=> b!1209281 (= e!686795 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1209282 () Bool)

(declare-fun res!803730 () Bool)

(declare-fun e!686794 () Bool)

(assert (=> b!1209282 (=> res!803730 e!686794)))

(declare-datatypes ((List!26631 0))(
  ( (Nil!26628) (Cons!26627 (h!27836 (_ BitVec 64)) (t!39595 List!26631)) )
))
(declare-fun contains!6932 (List!26631 (_ BitVec 64)) Bool)

(assert (=> b!1209282 (= res!803730 (contains!6932 Nil!26628 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1209283 () Bool)

(declare-fun res!803732 () Bool)

(declare-fun e!686789 () Bool)

(assert (=> b!1209283 (=> (not res!803732) (not e!686789))))

(declare-fun arrayNoDuplicates!0 (array!78092 (_ BitVec 32) List!26631) Bool)

(assert (=> b!1209283 (= res!803732 (arrayNoDuplicates!0 lt!548770 #b00000000000000000000000000000000 Nil!26628))))

(declare-fun b!1209284 () Bool)

(declare-fun res!803726 () Bool)

(assert (=> b!1209284 (=> (not res!803726) (not e!686801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1209284 (= res!803726 (validKeyInArray!0 k0!934))))

(declare-fun b!1209285 () Bool)

(declare-fun call!59337 () ListLongMap!17819)

(assert (=> b!1209285 (= e!686791 (= call!59337 call!59333))))

(declare-fun call!59338 () ListLongMap!17819)

(declare-fun lt!548779 () ListLongMap!17819)

(declare-fun bm!59333 () Bool)

(declare-fun +!4051 (ListLongMap!17819 tuple2!19850) ListLongMap!17819)

(assert (=> bm!59333 (= call!59338 (+!4051 (ite c!119037 lt!548779 lt!548783) (ite c!119037 (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119040 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1209286 () Bool)

(declare-fun e!686799 () Unit!39919)

(assert (=> b!1209286 (= e!686799 e!686804)))

(assert (=> b!1209286 (= c!119040 (and (not lt!548781) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!59334 () Bool)

(assert (=> bm!59334 (= call!59337 (getCurrentListMapNoExtraKeys!5367 lt!548770 lt!548776 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209287 () Bool)

(declare-fun res!803724 () Bool)

(assert (=> b!1209287 (=> (not res!803724) (not e!686801))))

(assert (=> b!1209287 (= res!803724 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38221 _keys!1208))))))

(declare-fun b!1209288 () Bool)

(declare-fun res!803727 () Bool)

(assert (=> b!1209288 (=> (not res!803727) (not e!686801))))

(assert (=> b!1209288 (= res!803727 (and (= (size!38222 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38221 _keys!1208) (size!38222 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1209289 () Bool)

(declare-fun e!686803 () Bool)

(assert (=> b!1209289 (= e!686803 tp_is_empty!30697)))

(declare-fun b!1209290 () Bool)

(declare-fun e!686796 () Bool)

(assert (=> b!1209290 (= e!686796 tp_is_empty!30697)))

(declare-fun b!1209291 () Bool)

(declare-fun res!803722 () Bool)

(assert (=> b!1209291 (=> res!803722 e!686794)))

(declare-fun noDuplicate!1643 (List!26631) Bool)

(assert (=> b!1209291 (= res!803722 (not (noDuplicate!1643 Nil!26628)))))

(declare-fun bm!59335 () Bool)

(declare-fun call!59335 () ListLongMap!17819)

(declare-fun call!59336 () Bool)

(declare-fun contains!6933 (ListLongMap!17819 (_ BitVec 64)) Bool)

(assert (=> bm!59335 (= call!59336 (contains!6933 (ite c!119037 lt!548779 call!59335) k0!934))))

(declare-fun b!1209292 () Bool)

(declare-fun Unit!39921 () Unit!39919)

(assert (=> b!1209292 (= e!686802 Unit!39921)))

(declare-fun bm!59336 () Bool)

(assert (=> bm!59336 (= call!59335 call!59338)))

(declare-fun b!1209293 () Bool)

(declare-fun res!803731 () Bool)

(assert (=> b!1209293 (=> (not res!803731) (not e!686801))))

(assert (=> b!1209293 (= res!803731 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26628))))

(declare-fun mapNonEmpty!47914 () Bool)

(declare-fun mapRes!47914 () Bool)

(declare-fun tp!90994 () Bool)

(assert (=> mapNonEmpty!47914 (= mapRes!47914 (and tp!90994 e!686803))))

(declare-fun mapValue!47914 () ValueCell!14639)

(declare-fun mapRest!47914 () (Array (_ BitVec 32) ValueCell!14639))

(declare-fun mapKey!47914 () (_ BitVec 32))

(assert (=> mapNonEmpty!47914 (= (arr!37684 _values!996) (store mapRest!47914 mapKey!47914 mapValue!47914))))

(declare-fun mapIsEmpty!47914 () Bool)

(assert (=> mapIsEmpty!47914 mapRes!47914))

(declare-fun b!1209294 () Bool)

(declare-fun res!803735 () Bool)

(assert (=> b!1209294 (=> (not res!803735) (not e!686801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1209294 (= res!803735 (validMask!0 mask!1564))))

(declare-fun bm!59337 () Bool)

(assert (=> bm!59337 (= call!59334 call!59336)))

(declare-fun b!1209295 () Bool)

(declare-fun -!1808 (ListLongMap!17819 (_ BitVec 64)) ListLongMap!17819)

(assert (=> b!1209295 (= e!686791 (= call!59337 (-!1808 call!59333 k0!934)))))

(declare-fun b!1209296 () Bool)

(assert (=> b!1209296 (= e!686801 e!686789)))

(declare-fun res!803721 () Bool)

(assert (=> b!1209296 (=> (not res!803721) (not e!686789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78092 (_ BitVec 32)) Bool)

(assert (=> b!1209296 (= res!803721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548770 mask!1564))))

(assert (=> b!1209296 (= lt!548770 (array!78093 (store (arr!37683 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38221 _keys!1208)))))

(declare-fun b!1209297 () Bool)

(declare-fun lt!548780 () Unit!39919)

(assert (=> b!1209297 (= e!686799 lt!548780)))

(declare-fun lt!548774 () Unit!39919)

(assert (=> b!1209297 (= lt!548774 call!59339)))

(assert (=> b!1209297 (= lt!548779 (+!4051 lt!548783 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1209297 call!59336))

(assert (=> b!1209297 (= lt!548780 (addStillContains!1035 lt!548779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1209297 (contains!6933 call!59338 k0!934)))

(declare-fun b!1209298 () Bool)

(declare-fun res!803728 () Bool)

(assert (=> b!1209298 (=> (not res!803728) (not e!686801))))

(assert (=> b!1209298 (= res!803728 (= (select (arr!37683 _keys!1208) i!673) k0!934))))

(declare-fun b!1209299 () Bool)

(assert (=> b!1209299 (= e!686789 (not e!686798))))

(declare-fun res!803725 () Bool)

(assert (=> b!1209299 (=> res!803725 e!686798)))

(assert (=> b!1209299 (= res!803725 (bvsgt from!1455 i!673))))

(assert (=> b!1209299 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!548784 () Unit!39919)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78092 (_ BitVec 64) (_ BitVec 32)) Unit!39919)

(assert (=> b!1209299 (= lt!548784 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1209300 () Bool)

(declare-fun e!686797 () Bool)

(assert (=> b!1209300 (= e!686797 e!686794)))

(declare-fun res!803734 () Bool)

(assert (=> b!1209300 (=> res!803734 e!686794)))

(assert (=> b!1209300 (= res!803734 (or (bvsge (size!38221 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38221 _keys!1208)) (bvsge from!1455 (size!38221 _keys!1208))))))

(assert (=> b!1209300 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26628)))

(declare-fun lt!548785 () Unit!39919)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78092 (_ BitVec 32) (_ BitVec 32)) Unit!39919)

(assert (=> b!1209300 (= lt!548785 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1209300 e!686792))

(declare-fun res!803733 () Bool)

(assert (=> b!1209300 (=> (not res!803733) (not e!686792))))

(assert (=> b!1209300 (= res!803733 e!686795)))

(declare-fun c!119039 () Bool)

(assert (=> b!1209300 (= c!119039 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548775 () Unit!39919)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!579 (array!78092 array!78094 (_ BitVec 32) (_ BitVec 32) V!46057 V!46057 (_ BitVec 64) (_ BitVec 32) Int) Unit!39919)

(assert (=> b!1209300 (= lt!548775 (lemmaListMapContainsThenArrayContainsFrom!579 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!548773 () Unit!39919)

(assert (=> b!1209300 (= lt!548773 e!686799)))

(assert (=> b!1209300 (= c!119037 (and (not lt!548781) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1209300 (= lt!548781 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1209301 () Bool)

(assert (=> b!1209301 (= e!686793 (and e!686796 mapRes!47914))))

(declare-fun condMapEmpty!47914 () Bool)

(declare-fun mapDefault!47914 () ValueCell!14639)

(assert (=> b!1209301 (= condMapEmpty!47914 (= (arr!37684 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14639)) mapDefault!47914)))))

(declare-fun b!1209302 () Bool)

(declare-fun c!119038 () Bool)

(assert (=> b!1209302 (= c!119038 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!548781))))

(assert (=> b!1209302 (= e!686804 e!686802)))

(declare-fun b!1209303 () Bool)

(assert (=> b!1209303 (= e!686794 true)))

(declare-fun lt!548782 () Bool)

(assert (=> b!1209303 (= lt!548782 (contains!6932 Nil!26628 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1209304 () Bool)

(assert (=> b!1209304 (= e!686790 e!686797)))

(declare-fun res!803719 () Bool)

(assert (=> b!1209304 (=> res!803719 e!686797)))

(assert (=> b!1209304 (= res!803719 (not (contains!6933 lt!548783 k0!934)))))

(assert (=> b!1209304 (= lt!548783 (getCurrentListMapNoExtraKeys!5367 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209305 () Bool)

(declare-fun res!803736 () Bool)

(assert (=> b!1209305 (=> (not res!803736) (not e!686801))))

(assert (=> b!1209305 (= res!803736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!100988 res!803720) b!1209294))

(assert (= (and b!1209294 res!803735) b!1209288))

(assert (= (and b!1209288 res!803727) b!1209305))

(assert (= (and b!1209305 res!803736) b!1209293))

(assert (= (and b!1209293 res!803731) b!1209287))

(assert (= (and b!1209287 res!803724) b!1209284))

(assert (= (and b!1209284 res!803726) b!1209298))

(assert (= (and b!1209298 res!803728) b!1209296))

(assert (= (and b!1209296 res!803721) b!1209283))

(assert (= (and b!1209283 res!803732) b!1209299))

(assert (= (and b!1209299 (not res!803725)) b!1209278))

(assert (= (and b!1209278 (not res!803729)) b!1209279))

(assert (= (and b!1209279 c!119036) b!1209295))

(assert (= (and b!1209279 (not c!119036)) b!1209285))

(assert (= (or b!1209295 b!1209285) bm!59334))

(assert (= (or b!1209295 b!1209285) bm!59330))

(assert (= (and b!1209279 (not res!803723)) b!1209304))

(assert (= (and b!1209304 (not res!803719)) b!1209300))

(assert (= (and b!1209300 c!119037) b!1209297))

(assert (= (and b!1209300 (not c!119037)) b!1209286))

(assert (= (and b!1209286 c!119040) b!1209275))

(assert (= (and b!1209286 (not c!119040)) b!1209302))

(assert (= (and b!1209302 c!119038) b!1209277))

(assert (= (and b!1209302 (not c!119038)) b!1209292))

(assert (= (or b!1209275 b!1209277) bm!59332))

(assert (= (or b!1209275 b!1209277) bm!59336))

(assert (= (or b!1209275 b!1209277) bm!59337))

(assert (= (or b!1209297 bm!59337) bm!59335))

(assert (= (or b!1209297 bm!59332) bm!59331))

(assert (= (or b!1209297 bm!59336) bm!59333))

(assert (= (and b!1209300 c!119039) b!1209281))

(assert (= (and b!1209300 (not c!119039)) b!1209276))

(assert (= (and b!1209300 res!803733) b!1209280))

(assert (= (and b!1209300 (not res!803734)) b!1209291))

(assert (= (and b!1209291 (not res!803722)) b!1209282))

(assert (= (and b!1209282 (not res!803730)) b!1209303))

(assert (= (and b!1209301 condMapEmpty!47914) mapIsEmpty!47914))

(assert (= (and b!1209301 (not condMapEmpty!47914)) mapNonEmpty!47914))

(get-info :version)

(assert (= (and mapNonEmpty!47914 ((_ is ValueCellFull!14639) mapValue!47914)) b!1209289))

(assert (= (and b!1209301 ((_ is ValueCellFull!14639) mapDefault!47914)) b!1209290))

(assert (= start!100988 b!1209301))

(declare-fun b_lambda!21567 () Bool)

(assert (=> (not b_lambda!21567) (not b!1209278)))

(declare-fun t!39593 () Bool)

(declare-fun tb!10785 () Bool)

(assert (=> (and start!100988 (= defaultEntry!1004 defaultEntry!1004) t!39593) tb!10785))

(declare-fun result!22171 () Bool)

(assert (=> tb!10785 (= result!22171 tp_is_empty!30697)))

(assert (=> b!1209278 t!39593))

(declare-fun b_and!43043 () Bool)

(assert (= b_and!43041 (and (=> t!39593 result!22171) b_and!43043)))

(declare-fun m!1114513 () Bool)

(assert (=> b!1209282 m!1114513))

(declare-fun m!1114515 () Bool)

(assert (=> bm!59335 m!1114515))

(declare-fun m!1114517 () Bool)

(assert (=> b!1209280 m!1114517))

(declare-fun m!1114519 () Bool)

(assert (=> b!1209278 m!1114519))

(declare-fun m!1114521 () Bool)

(assert (=> b!1209278 m!1114521))

(declare-fun m!1114523 () Bool)

(assert (=> b!1209278 m!1114523))

(declare-fun m!1114525 () Bool)

(assert (=> b!1209278 m!1114525))

(declare-fun m!1114527 () Bool)

(assert (=> start!100988 m!1114527))

(declare-fun m!1114529 () Bool)

(assert (=> start!100988 m!1114529))

(declare-fun m!1114531 () Bool)

(assert (=> b!1209300 m!1114531))

(declare-fun m!1114533 () Bool)

(assert (=> b!1209300 m!1114533))

(declare-fun m!1114535 () Bool)

(assert (=> b!1209300 m!1114535))

(declare-fun m!1114537 () Bool)

(assert (=> bm!59330 m!1114537))

(assert (=> b!1209281 m!1114517))

(declare-fun m!1114539 () Bool)

(assert (=> b!1209298 m!1114539))

(declare-fun m!1114541 () Bool)

(assert (=> b!1209296 m!1114541))

(declare-fun m!1114543 () Bool)

(assert (=> b!1209296 m!1114543))

(declare-fun m!1114545 () Bool)

(assert (=> b!1209295 m!1114545))

(declare-fun m!1114547 () Bool)

(assert (=> b!1209294 m!1114547))

(declare-fun m!1114549 () Bool)

(assert (=> b!1209279 m!1114549))

(declare-fun m!1114551 () Bool)

(assert (=> b!1209279 m!1114551))

(declare-fun m!1114553 () Bool)

(assert (=> b!1209283 m!1114553))

(declare-fun m!1114555 () Bool)

(assert (=> b!1209304 m!1114555))

(assert (=> b!1209304 m!1114537))

(declare-fun m!1114557 () Bool)

(assert (=> b!1209291 m!1114557))

(declare-fun m!1114559 () Bool)

(assert (=> b!1209305 m!1114559))

(declare-fun m!1114561 () Bool)

(assert (=> bm!59331 m!1114561))

(declare-fun m!1114563 () Bool)

(assert (=> b!1209297 m!1114563))

(declare-fun m!1114565 () Bool)

(assert (=> b!1209297 m!1114565))

(declare-fun m!1114567 () Bool)

(assert (=> b!1209297 m!1114567))

(declare-fun m!1114569 () Bool)

(assert (=> bm!59333 m!1114569))

(declare-fun m!1114571 () Bool)

(assert (=> b!1209303 m!1114571))

(declare-fun m!1114573 () Bool)

(assert (=> mapNonEmpty!47914 m!1114573))

(declare-fun m!1114575 () Bool)

(assert (=> b!1209293 m!1114575))

(declare-fun m!1114577 () Bool)

(assert (=> b!1209284 m!1114577))

(declare-fun m!1114579 () Bool)

(assert (=> b!1209299 m!1114579))

(declare-fun m!1114581 () Bool)

(assert (=> b!1209299 m!1114581))

(declare-fun m!1114583 () Bool)

(assert (=> bm!59334 m!1114583))

(check-sat (not b_next!25993) (not b!1209279) (not bm!59331) (not b!1209303) tp_is_empty!30697 (not b!1209284) (not b!1209305) (not bm!59335) (not bm!59333) (not b!1209297) (not bm!59334) (not b!1209294) (not b!1209281) (not b!1209299) (not mapNonEmpty!47914) (not b_lambda!21567) (not b!1209282) (not b!1209283) (not start!100988) (not b!1209280) (not b!1209300) (not b!1209278) (not b!1209293) (not b!1209296) (not bm!59330) (not b!1209304) (not b!1209295) (not b!1209291) b_and!43043)
(check-sat b_and!43043 (not b_next!25993))
