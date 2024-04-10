; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100646 () Bool)

(assert start!100646)

(declare-fun b_free!25907 () Bool)

(declare-fun b_next!25907 () Bool)

(assert (=> start!100646 (= b_free!25907 (not b_next!25907))))

(declare-fun tp!90714 () Bool)

(declare-fun b_and!42741 () Bool)

(assert (=> start!100646 (= tp!90714 b_and!42741)))

(declare-fun b!1204039 () Bool)

(declare-datatypes ((Unit!39925 0))(
  ( (Unit!39926) )
))
(declare-fun e!683735 () Unit!39925)

(declare-fun Unit!39927 () Unit!39925)

(assert (=> b!1204039 (= e!683735 Unit!39927)))

(declare-datatypes ((V!45941 0))(
  ( (V!45942 (val!15362 Int)) )
))
(declare-fun zeroValue!944 () V!45941)

(declare-datatypes ((array!77997 0))(
  ( (array!77998 (arr!37642 (Array (_ BitVec 32) (_ BitVec 64))) (size!38178 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77997)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!58128 () Bool)

(declare-datatypes ((ValueCell!14596 0))(
  ( (ValueCellFull!14596 (v!18003 V!45941)) (EmptyCell!14596) )
))
(declare-datatypes ((array!77999 0))(
  ( (array!78000 (arr!37643 (Array (_ BitVec 32) ValueCell!14596)) (size!38179 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77999)

(declare-datatypes ((tuple2!19696 0))(
  ( (tuple2!19697 (_1!9859 (_ BitVec 64)) (_2!9859 V!45941)) )
))
(declare-datatypes ((List!26506 0))(
  ( (Nil!26503) (Cons!26502 (h!27711 tuple2!19696) (t!39393 List!26506)) )
))
(declare-datatypes ((ListLongMap!17665 0))(
  ( (ListLongMap!17666 (toList!8848 List!26506)) )
))
(declare-fun call!58136 () ListLongMap!17665)

(declare-fun minValue!944 () V!45941)

(declare-fun getCurrentListMapNoExtraKeys!5284 (array!77997 array!77999 (_ BitVec 32) (_ BitVec 32) V!45941 V!45941 (_ BitVec 32) Int) ListLongMap!17665)

(assert (=> bm!58128 (= call!58136 (getCurrentListMapNoExtraKeys!5284 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204040 () Bool)

(declare-fun lt!545910 () Unit!39925)

(assert (=> b!1204040 (= e!683735 lt!545910)))

(declare-fun call!58134 () Unit!39925)

(assert (=> b!1204040 (= lt!545910 call!58134)))

(declare-fun call!58132 () Bool)

(assert (=> b!1204040 call!58132))

(declare-fun lt!545906 () array!77997)

(declare-fun call!58138 () ListLongMap!17665)

(declare-fun bm!58129 () Bool)

(declare-fun lt!545908 () array!77999)

(assert (=> bm!58129 (= call!58138 (getCurrentListMapNoExtraKeys!5284 lt!545906 lt!545908 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!117989 () Bool)

(declare-fun bm!58130 () Bool)

(declare-fun lt!545907 () ListLongMap!17665)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!58137 () Unit!39925)

(declare-fun c!117986 () Bool)

(declare-fun addStillContains!1003 (ListLongMap!17665 (_ BitVec 64) V!45941 (_ BitVec 64)) Unit!39925)

(assert (=> bm!58130 (= call!58137 (addStillContains!1003 lt!545907 (ite (or c!117989 c!117986) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117989 c!117986) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1204041 () Bool)

(declare-fun e!683728 () Bool)

(declare-fun tp_is_empty!30611 () Bool)

(assert (=> b!1204041 (= e!683728 tp_is_empty!30611)))

(declare-fun b!1204042 () Bool)

(declare-fun e!683734 () Bool)

(declare-fun e!683729 () Bool)

(assert (=> b!1204042 (= e!683734 e!683729)))

(declare-fun res!801125 () Bool)

(assert (=> b!1204042 (=> res!801125 e!683729)))

(declare-fun contains!6904 (ListLongMap!17665 (_ BitVec 64)) Bool)

(assert (=> b!1204042 (= res!801125 (not (contains!6904 lt!545907 k!934)))))

(assert (=> b!1204042 (= lt!545907 (getCurrentListMapNoExtraKeys!5284 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47763 () Bool)

(declare-fun mapRes!47763 () Bool)

(declare-fun tp!90715 () Bool)

(assert (=> mapNonEmpty!47763 (= mapRes!47763 (and tp!90715 e!683728))))

(declare-fun mapRest!47763 () (Array (_ BitVec 32) ValueCell!14596))

(declare-fun mapKey!47763 () (_ BitVec 32))

(declare-fun mapValue!47763 () ValueCell!14596)

(assert (=> mapNonEmpty!47763 (= (arr!37643 _values!996) (store mapRest!47763 mapKey!47763 mapValue!47763))))

(declare-fun bm!58131 () Bool)

(declare-fun lt!545918 () ListLongMap!17665)

(declare-fun call!58133 () ListLongMap!17665)

(declare-fun +!3974 (ListLongMap!17665 tuple2!19696) ListLongMap!17665)

(assert (=> bm!58131 (= call!58133 (+!3974 (ite c!117989 lt!545918 lt!545907) (ite c!117989 (tuple2!19697 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117986 (tuple2!19697 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19697 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1204043 () Bool)

(declare-fun e!683736 () Bool)

(declare-fun e!683732 () Bool)

(assert (=> b!1204043 (= e!683736 (not e!683732))))

(declare-fun res!801127 () Bool)

(assert (=> b!1204043 (=> res!801127 e!683732)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1204043 (= res!801127 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1204043 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!545909 () Unit!39925)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77997 (_ BitVec 64) (_ BitVec 32)) Unit!39925)

(assert (=> b!1204043 (= lt!545909 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!58132 () Bool)

(declare-fun call!58131 () Bool)

(assert (=> bm!58132 (= call!58132 call!58131)))

(declare-fun e!683737 () Bool)

(declare-fun b!1204044 () Bool)

(declare-fun -!1814 (ListLongMap!17665 (_ BitVec 64)) ListLongMap!17665)

(assert (=> b!1204044 (= e!683737 (= call!58138 (-!1814 call!58136 k!934)))))

(declare-fun b!1204045 () Bool)

(declare-fun res!801124 () Bool)

(declare-fun e!683725 () Bool)

(assert (=> b!1204045 (=> (not res!801124) (not e!683725))))

(assert (=> b!1204045 (= res!801124 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38178 _keys!1208))))))

(declare-fun b!1204046 () Bool)

(declare-fun res!801119 () Bool)

(assert (=> b!1204046 (=> (not res!801119) (not e!683725))))

(assert (=> b!1204046 (= res!801119 (= (select (arr!37642 _keys!1208) i!673) k!934))))

(declare-fun b!1204047 () Bool)

(declare-fun e!683733 () Bool)

(assert (=> b!1204047 (= e!683733 e!683734)))

(declare-fun res!801126 () Bool)

(assert (=> b!1204047 (=> res!801126 e!683734)))

(assert (=> b!1204047 (= res!801126 (not (= (select (arr!37642 _keys!1208) from!1455) k!934)))))

(assert (=> b!1204047 e!683737))

(declare-fun c!117988 () Bool)

(assert (=> b!1204047 (= c!117988 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!545915 () Unit!39925)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1019 (array!77997 array!77999 (_ BitVec 32) (_ BitVec 32) V!45941 V!45941 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39925)

(assert (=> b!1204047 (= lt!545915 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1019 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!801128 () Bool)

(assert (=> start!100646 (=> (not res!801128) (not e!683725))))

(assert (=> start!100646 (= res!801128 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38178 _keys!1208))))))

(assert (=> start!100646 e!683725))

(assert (=> start!100646 tp_is_empty!30611))

(declare-fun array_inv!28678 (array!77997) Bool)

(assert (=> start!100646 (array_inv!28678 _keys!1208)))

(assert (=> start!100646 true))

(assert (=> start!100646 tp!90714))

(declare-fun e!683738 () Bool)

(declare-fun array_inv!28679 (array!77999) Bool)

(assert (=> start!100646 (and (array_inv!28679 _values!996) e!683738)))

(declare-fun bm!58133 () Bool)

(assert (=> bm!58133 (= call!58134 call!58137)))

(declare-fun b!1204048 () Bool)

(declare-fun e!683724 () Bool)

(assert (=> b!1204048 (= e!683724 tp_is_empty!30611)))

(declare-fun b!1204049 () Bool)

(declare-fun res!801122 () Bool)

(assert (=> b!1204049 (=> (not res!801122) (not e!683725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1204049 (= res!801122 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47763 () Bool)

(assert (=> mapIsEmpty!47763 mapRes!47763))

(declare-fun b!1204050 () Bool)

(assert (=> b!1204050 (= e!683732 e!683733)))

(declare-fun res!801131 () Bool)

(assert (=> b!1204050 (=> res!801131 e!683733)))

(assert (=> b!1204050 (= res!801131 (not (= from!1455 i!673)))))

(declare-fun lt!545914 () ListLongMap!17665)

(assert (=> b!1204050 (= lt!545914 (getCurrentListMapNoExtraKeys!5284 lt!545906 lt!545908 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3196 (Int (_ BitVec 64)) V!45941)

(assert (=> b!1204050 (= lt!545908 (array!78000 (store (arr!37643 _values!996) i!673 (ValueCellFull!14596 (dynLambda!3196 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38179 _values!996)))))

(declare-fun lt!545919 () ListLongMap!17665)

(assert (=> b!1204050 (= lt!545919 (getCurrentListMapNoExtraKeys!5284 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1204051 () Bool)

(declare-fun e!683726 () Bool)

(assert (=> b!1204051 (= e!683729 e!683726)))

(declare-fun res!801123 () Bool)

(assert (=> b!1204051 (=> res!801123 e!683726)))

(assert (=> b!1204051 (= res!801123 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38178 _keys!1208))))))

(declare-fun lt!545916 () Unit!39925)

(declare-fun e!683731 () Unit!39925)

(assert (=> b!1204051 (= lt!545916 e!683731)))

(declare-fun lt!545911 () Bool)

(assert (=> b!1204051 (= c!117989 (and (not lt!545911) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1204051 (= lt!545911 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1204052 () Bool)

(declare-fun c!117987 () Bool)

(assert (=> b!1204052 (= c!117987 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!545911))))

(declare-fun e!683727 () Unit!39925)

(assert (=> b!1204052 (= e!683727 e!683735)))

(declare-fun b!1204053 () Bool)

(declare-fun lt!545913 () Unit!39925)

(assert (=> b!1204053 (= e!683731 lt!545913)))

(declare-fun lt!545912 () Unit!39925)

(assert (=> b!1204053 (= lt!545912 call!58137)))

(assert (=> b!1204053 (= lt!545918 (+!3974 lt!545907 (tuple2!19697 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1204053 call!58131))

(assert (=> b!1204053 (= lt!545913 (addStillContains!1003 lt!545918 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1204053 (contains!6904 call!58133 k!934)))

(declare-fun b!1204054 () Bool)

(assert (=> b!1204054 call!58132))

(declare-fun lt!545917 () Unit!39925)

(assert (=> b!1204054 (= lt!545917 call!58134)))

(assert (=> b!1204054 (= e!683727 lt!545917)))

(declare-fun b!1204055 () Bool)

(declare-fun res!801118 () Bool)

(assert (=> b!1204055 (=> (not res!801118) (not e!683725))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1204055 (= res!801118 (validKeyInArray!0 k!934))))

(declare-fun bm!58134 () Bool)

(declare-fun call!58135 () ListLongMap!17665)

(assert (=> bm!58134 (= call!58131 (contains!6904 (ite c!117989 lt!545918 call!58135) k!934))))

(declare-fun b!1204056 () Bool)

(assert (=> b!1204056 (= e!683731 e!683727)))

(assert (=> b!1204056 (= c!117986 (and (not lt!545911) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1204057 () Bool)

(declare-fun res!801121 () Bool)

(assert (=> b!1204057 (=> (not res!801121) (not e!683725))))

(declare-datatypes ((List!26507 0))(
  ( (Nil!26504) (Cons!26503 (h!27712 (_ BitVec 64)) (t!39394 List!26507)) )
))
(declare-fun arrayNoDuplicates!0 (array!77997 (_ BitVec 32) List!26507) Bool)

(assert (=> b!1204057 (= res!801121 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26504))))

(declare-fun bm!58135 () Bool)

(assert (=> bm!58135 (= call!58135 call!58133)))

(declare-fun b!1204058 () Bool)

(declare-fun res!801117 () Bool)

(assert (=> b!1204058 (=> (not res!801117) (not e!683725))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77997 (_ BitVec 32)) Bool)

(assert (=> b!1204058 (= res!801117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1204059 () Bool)

(assert (=> b!1204059 (= e!683737 (= call!58138 call!58136))))

(declare-fun b!1204060 () Bool)

(declare-fun res!801120 () Bool)

(assert (=> b!1204060 (=> (not res!801120) (not e!683736))))

(assert (=> b!1204060 (= res!801120 (arrayNoDuplicates!0 lt!545906 #b00000000000000000000000000000000 Nil!26504))))

(declare-fun b!1204061 () Bool)

(declare-fun getCurrentListMap!4433 (array!77997 array!77999 (_ BitVec 32) (_ BitVec 32) V!45941 V!45941 (_ BitVec 32) Int) ListLongMap!17665)

(assert (=> b!1204061 (= e!683726 (contains!6904 (getCurrentListMap!4433 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1204062 () Bool)

(assert (=> b!1204062 (= e!683738 (and e!683724 mapRes!47763))))

(declare-fun condMapEmpty!47763 () Bool)

(declare-fun mapDefault!47763 () ValueCell!14596)

