; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100998 () Bool)

(assert start!100998)

(declare-fun b_free!25997 () Bool)

(declare-fun b_next!25997 () Bool)

(assert (=> start!100998 (= b_free!25997 (not b_next!25997))))

(declare-fun tp!91006 () Bool)

(declare-fun b_and!43075 () Bool)

(assert (=> start!100998 (= tp!91006 b_and!43075)))

(declare-fun b!1209598 () Bool)

(declare-fun e!686988 () Bool)

(declare-datatypes ((V!46061 0))(
  ( (V!46062 (val!15407 Int)) )
))
(declare-datatypes ((tuple2!19780 0))(
  ( (tuple2!19781 (_1!9901 (_ BitVec 64)) (_2!9901 V!46061)) )
))
(declare-datatypes ((List!26581 0))(
  ( (Nil!26578) (Cons!26577 (h!27786 tuple2!19780) (t!39558 List!26581)) )
))
(declare-datatypes ((ListLongMap!17749 0))(
  ( (ListLongMap!17750 (toList!8890 List!26581)) )
))
(declare-fun call!59411 () ListLongMap!17749)

(declare-fun call!59410 () ListLongMap!17749)

(assert (=> b!1209598 (= e!686988 (= call!59411 call!59410))))

(declare-fun lt!549081 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1209599 () Bool)

(declare-fun e!686983 () Bool)

(assert (=> b!1209599 (= e!686983 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549081) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((array!78187 0))(
  ( (array!78188 (arr!37730 (Array (_ BitVec 32) (_ BitVec 64))) (size!38266 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78187)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1209600 () Bool)

(declare-fun arrayContainsKey!0 (array!78187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1209600 (= e!686983 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1209601 () Bool)

(declare-fun e!686975 () Bool)

(declare-fun tp_is_empty!30701 () Bool)

(assert (=> b!1209601 (= e!686975 tp_is_empty!30701)))

(declare-fun b!1209602 () Bool)

(declare-fun e!686980 () Bool)

(declare-fun e!686976 () Bool)

(assert (=> b!1209602 (= e!686980 e!686976)))

(declare-fun res!803908 () Bool)

(assert (=> b!1209602 (=> res!803908 e!686976)))

(assert (=> b!1209602 (= res!803908 (or (bvsge (size!38266 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38266 _keys!1208)) (bvsge from!1455 (size!38266 _keys!1208))))))

(declare-datatypes ((List!26582 0))(
  ( (Nil!26579) (Cons!26578 (h!27787 (_ BitVec 64)) (t!39559 List!26582)) )
))
(declare-fun arrayNoDuplicates!0 (array!78187 (_ BitVec 32) List!26582) Bool)

(assert (=> b!1209602 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26579)))

(declare-datatypes ((Unit!40088 0))(
  ( (Unit!40089) )
))
(declare-fun lt!549074 () Unit!40088)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78187 (_ BitVec 32) (_ BitVec 32)) Unit!40088)

(assert (=> b!1209602 (= lt!549074 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!686977 () Bool)

(assert (=> b!1209602 e!686977))

(declare-fun res!803911 () Bool)

(assert (=> b!1209602 (=> (not res!803911) (not e!686977))))

(assert (=> b!1209602 (= res!803911 e!686983)))

(declare-fun c!119095 () Bool)

(assert (=> b!1209602 (= c!119095 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun zeroValue!944 () V!46061)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!549069 () Unit!40088)

(declare-datatypes ((ValueCell!14641 0))(
  ( (ValueCellFull!14641 (v!18058 V!46061)) (EmptyCell!14641) )
))
(declare-datatypes ((array!78189 0))(
  ( (array!78190 (arr!37731 (Array (_ BitVec 32) ValueCell!14641)) (size!38267 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78189)

(declare-fun minValue!944 () V!46061)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!590 (array!78187 array!78189 (_ BitVec 32) (_ BitVec 32) V!46061 V!46061 (_ BitVec 64) (_ BitVec 32) Int) Unit!40088)

(assert (=> b!1209602 (= lt!549069 (lemmaListMapContainsThenArrayContainsFrom!590 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!549075 () Unit!40088)

(declare-fun e!686984 () Unit!40088)

(assert (=> b!1209602 (= lt!549075 e!686984)))

(declare-fun c!119099 () Bool)

(assert (=> b!1209602 (= c!119099 (and (not lt!549081) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1209602 (= lt!549081 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!59402 () Bool)

(declare-fun call!59405 () ListLongMap!17749)

(declare-fun call!59408 () ListLongMap!17749)

(assert (=> bm!59402 (= call!59405 call!59408)))

(declare-fun b!1209603 () Bool)

(declare-fun res!803907 () Bool)

(declare-fun e!686978 () Bool)

(assert (=> b!1209603 (=> (not res!803907) (not e!686978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78187 (_ BitVec 32)) Bool)

(assert (=> b!1209603 (= res!803907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1209604 () Bool)

(assert (=> b!1209604 (= e!686977 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1209605 () Bool)

(declare-fun e!686990 () Bool)

(declare-fun e!686981 () Bool)

(assert (=> b!1209605 (= e!686990 (not e!686981))))

(declare-fun res!803896 () Bool)

(assert (=> b!1209605 (=> res!803896 e!686981)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1209605 (= res!803896 (bvsgt from!1455 i!673))))

(assert (=> b!1209605 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!549072 () Unit!40088)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78187 (_ BitVec 64) (_ BitVec 32)) Unit!40088)

(assert (=> b!1209605 (= lt!549072 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!803900 () Bool)

(assert (=> start!100998 (=> (not res!803900) (not e!686978))))

(assert (=> start!100998 (= res!803900 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38266 _keys!1208))))))

(assert (=> start!100998 e!686978))

(assert (=> start!100998 tp_is_empty!30701))

(declare-fun array_inv!28742 (array!78187) Bool)

(assert (=> start!100998 (array_inv!28742 _keys!1208)))

(assert (=> start!100998 true))

(assert (=> start!100998 tp!91006))

(declare-fun e!686987 () Bool)

(declare-fun array_inv!28743 (array!78189) Bool)

(assert (=> start!100998 (and (array_inv!28743 _values!996) e!686987)))

(declare-fun lt!549073 () ListLongMap!17749)

(declare-fun bm!59403 () Bool)

(declare-fun call!59412 () Unit!40088)

(declare-fun c!119096 () Bool)

(declare-fun addStillContains!1037 (ListLongMap!17749 (_ BitVec 64) V!46061 (_ BitVec 64)) Unit!40088)

(assert (=> bm!59403 (= call!59412 (addStillContains!1037 lt!549073 (ite (or c!119099 c!119096) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119099 c!119096) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1209606 () Bool)

(declare-fun res!803910 () Bool)

(assert (=> b!1209606 (=> (not res!803910) (not e!686978))))

(assert (=> b!1209606 (= res!803910 (and (= (size!38267 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38266 _keys!1208) (size!38267 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1209607 () Bool)

(assert (=> b!1209607 (= e!686976 true)))

(declare-fun lt!549068 () Bool)

(declare-fun contains!6960 (List!26582 (_ BitVec 64)) Bool)

(assert (=> b!1209607 (= lt!549068 (contains!6960 Nil!26579 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1209608 () Bool)

(declare-fun res!803909 () Bool)

(assert (=> b!1209608 (=> (not res!803909) (not e!686978))))

(assert (=> b!1209608 (= res!803909 (= (select (arr!37730 _keys!1208) i!673) k!934))))

(declare-fun call!59406 () Bool)

(declare-fun bm!59404 () Bool)

(declare-fun lt!549077 () ListLongMap!17749)

(declare-fun contains!6961 (ListLongMap!17749 (_ BitVec 64)) Bool)

(assert (=> bm!59404 (= call!59406 (contains!6961 (ite c!119099 lt!549077 call!59405) k!934))))

(declare-fun b!1209609 () Bool)

(declare-fun res!803905 () Bool)

(assert (=> b!1209609 (=> (not res!803905) (not e!686978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1209609 (= res!803905 (validKeyInArray!0 k!934))))

(declare-fun b!1209610 () Bool)

(declare-fun res!803903 () Bool)

(assert (=> b!1209610 (=> (not res!803903) (not e!686978))))

(assert (=> b!1209610 (= res!803903 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26579))))

(declare-fun b!1209611 () Bool)

(declare-fun e!686982 () Unit!40088)

(declare-fun Unit!40090 () Unit!40088)

(assert (=> b!1209611 (= e!686982 Unit!40090)))

(declare-fun b!1209612 () Bool)

(declare-fun e!686985 () Bool)

(assert (=> b!1209612 (= e!686981 e!686985)))

(declare-fun res!803901 () Bool)

(assert (=> b!1209612 (=> res!803901 e!686985)))

(assert (=> b!1209612 (= res!803901 (not (= from!1455 i!673)))))

(declare-fun lt!549070 () ListLongMap!17749)

(declare-fun lt!549067 () array!78187)

(declare-fun lt!549080 () array!78189)

(declare-fun getCurrentListMapNoExtraKeys!5324 (array!78187 array!78189 (_ BitVec 32) (_ BitVec 32) V!46061 V!46061 (_ BitVec 32) Int) ListLongMap!17749)

(assert (=> b!1209612 (= lt!549070 (getCurrentListMapNoExtraKeys!5324 lt!549067 lt!549080 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3223 (Int (_ BitVec 64)) V!46061)

(assert (=> b!1209612 (= lt!549080 (array!78190 (store (arr!37731 _values!996) i!673 (ValueCellFull!14641 (dynLambda!3223 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38267 _values!996)))))

(declare-fun lt!549079 () ListLongMap!17749)

(assert (=> b!1209612 (= lt!549079 (getCurrentListMapNoExtraKeys!5324 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1209613 () Bool)

(declare-fun e!686989 () Bool)

(assert (=> b!1209613 (= e!686989 tp_is_empty!30701)))

(declare-fun b!1209614 () Bool)

(assert (=> b!1209614 (= e!686978 e!686990)))

(declare-fun res!803912 () Bool)

(assert (=> b!1209614 (=> (not res!803912) (not e!686990))))

(assert (=> b!1209614 (= res!803912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549067 mask!1564))))

(assert (=> b!1209614 (= lt!549067 (array!78188 (store (arr!37730 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38266 _keys!1208)))))

(declare-fun bm!59405 () Bool)

(assert (=> bm!59405 (= call!59410 (getCurrentListMapNoExtraKeys!5324 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209615 () Bool)

(declare-fun mapRes!47920 () Bool)

(assert (=> b!1209615 (= e!686987 (and e!686975 mapRes!47920))))

(declare-fun condMapEmpty!47920 () Bool)

(declare-fun mapDefault!47920 () ValueCell!14641)

