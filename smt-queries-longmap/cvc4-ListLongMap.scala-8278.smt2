; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100772 () Bool)

(assert start!100772)

(declare-fun b_free!25943 () Bool)

(declare-fun b_next!25943 () Bool)

(assert (=> start!100772 (= b_free!25943 (not b_next!25943))))

(declare-fun tp!90831 () Bool)

(declare-fun b_and!42869 () Bool)

(assert (=> start!100772 (= tp!90831 b_and!42869)))

(declare-datatypes ((array!78075 0))(
  ( (array!78076 (arr!37678 (Array (_ BitVec 32) (_ BitVec 64))) (size!38214 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78075)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1206123 () Bool)

(declare-fun e!684945 () Bool)

(declare-fun arrayContainsKey!0 (array!78075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1206123 (= e!684945 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206124 () Bool)

(declare-fun call!58647 () Bool)

(assert (=> b!1206124 call!58647))

(declare-datatypes ((Unit!39985 0))(
  ( (Unit!39986) )
))
(declare-fun lt!547114 () Unit!39985)

(declare-fun call!58648 () Unit!39985)

(assert (=> b!1206124 (= lt!547114 call!58648)))

(declare-fun e!684938 () Unit!39985)

(assert (=> b!1206124 (= e!684938 lt!547114)))

(declare-fun b!1206125 () Bool)

(declare-fun res!802152 () Bool)

(declare-fun e!684947 () Bool)

(assert (=> b!1206125 (=> (not res!802152) (not e!684947))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45989 0))(
  ( (V!45990 (val!15380 Int)) )
))
(declare-datatypes ((ValueCell!14614 0))(
  ( (ValueCellFull!14614 (v!18024 V!45989)) (EmptyCell!14614) )
))
(declare-datatypes ((array!78077 0))(
  ( (array!78078 (arr!37679 (Array (_ BitVec 32) ValueCell!14614)) (size!38215 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78077)

(assert (=> b!1206125 (= res!802152 (and (= (size!38215 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38214 _keys!1208) (size!38215 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1206126 () Bool)

(declare-fun e!684944 () Unit!39985)

(declare-fun lt!547104 () Unit!39985)

(assert (=> b!1206126 (= e!684944 lt!547104)))

(declare-fun lt!547103 () Unit!39985)

(declare-fun call!58651 () Unit!39985)

(assert (=> b!1206126 (= lt!547103 call!58651)))

(declare-datatypes ((tuple2!19732 0))(
  ( (tuple2!19733 (_1!9877 (_ BitVec 64)) (_2!9877 V!45989)) )
))
(declare-datatypes ((List!26536 0))(
  ( (Nil!26533) (Cons!26532 (h!27741 tuple2!19732) (t!39459 List!26536)) )
))
(declare-datatypes ((ListLongMap!17701 0))(
  ( (ListLongMap!17702 (toList!8866 List!26536)) )
))
(declare-fun lt!547107 () ListLongMap!17701)

(declare-fun lt!547112 () ListLongMap!17701)

(declare-fun zeroValue!944 () V!45989)

(declare-fun +!3987 (ListLongMap!17701 tuple2!19732) ListLongMap!17701)

(assert (=> b!1206126 (= lt!547107 (+!3987 lt!547112 (tuple2!19733 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!58644 () Bool)

(assert (=> b!1206126 call!58644))

(declare-fun minValue!944 () V!45989)

(declare-fun addStillContains!1016 (ListLongMap!17701 (_ BitVec 64) V!45989 (_ BitVec 64)) Unit!39985)

(assert (=> b!1206126 (= lt!547104 (addStillContains!1016 lt!547107 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!58650 () ListLongMap!17701)

(declare-fun contains!6924 (ListLongMap!17701 (_ BitVec 64)) Bool)

(assert (=> b!1206126 (contains!6924 call!58650 k!934)))

(declare-fun b!1206127 () Bool)

(declare-fun e!684939 () Bool)

(assert (=> b!1206127 (= e!684939 true)))

(assert (=> b!1206127 e!684945))

(declare-fun res!802156 () Bool)

(assert (=> b!1206127 (=> (not res!802156) (not e!684945))))

(declare-fun e!684936 () Bool)

(assert (=> b!1206127 (= res!802156 e!684936)))

(declare-fun c!118403 () Bool)

(assert (=> b!1206127 (= c!118403 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!547111 () Unit!39985)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!572 (array!78075 array!78077 (_ BitVec 32) (_ BitVec 32) V!45989 V!45989 (_ BitVec 64) (_ BitVec 32) Int) Unit!39985)

(assert (=> b!1206127 (= lt!547111 (lemmaListMapContainsThenArrayContainsFrom!572 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547102 () Unit!39985)

(assert (=> b!1206127 (= lt!547102 e!684944)))

(declare-fun c!118404 () Bool)

(declare-fun lt!547105 () Bool)

(assert (=> b!1206127 (= c!118404 (and (not lt!547105) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1206127 (= lt!547105 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1206128 () Bool)

(declare-fun e!684943 () Bool)

(assert (=> b!1206128 (= e!684947 e!684943)))

(declare-fun res!802150 () Bool)

(assert (=> b!1206128 (=> (not res!802150) (not e!684943))))

(declare-fun lt!547113 () array!78075)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78075 (_ BitVec 32)) Bool)

(assert (=> b!1206128 (= res!802150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547113 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1206128 (= lt!547113 (array!78076 (store (arr!37678 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38214 _keys!1208)))))

(declare-fun bm!58641 () Bool)

(declare-fun call!58645 () ListLongMap!17701)

(declare-fun getCurrentListMapNoExtraKeys!5301 (array!78075 array!78077 (_ BitVec 32) (_ BitVec 32) V!45989 V!45989 (_ BitVec 32) Int) ListLongMap!17701)

(assert (=> bm!58641 (= call!58645 (getCurrentListMapNoExtraKeys!5301 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58642 () Bool)

(declare-fun call!58646 () ListLongMap!17701)

(declare-fun lt!547110 () array!78077)

(assert (=> bm!58642 (= call!58646 (getCurrentListMapNoExtraKeys!5301 lt!547113 lt!547110 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206129 () Bool)

(declare-fun e!684948 () Bool)

(declare-fun e!684950 () Bool)

(assert (=> b!1206129 (= e!684948 e!684950)))

(declare-fun res!802158 () Bool)

(assert (=> b!1206129 (=> res!802158 e!684950)))

(assert (=> b!1206129 (= res!802158 (not (= from!1455 i!673)))))

(declare-fun lt!547100 () ListLongMap!17701)

(assert (=> b!1206129 (= lt!547100 (getCurrentListMapNoExtraKeys!5301 lt!547113 lt!547110 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3208 (Int (_ BitVec 64)) V!45989)

(assert (=> b!1206129 (= lt!547110 (array!78078 (store (arr!37679 _values!996) i!673 (ValueCellFull!14614 (dynLambda!3208 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38215 _values!996)))))

(declare-fun lt!547106 () ListLongMap!17701)

(assert (=> b!1206129 (= lt!547106 (getCurrentListMapNoExtraKeys!5301 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!58643 () Bool)

(assert (=> bm!58643 (= call!58648 call!58651)))

(declare-fun b!1206130 () Bool)

(declare-fun res!802155 () Bool)

(assert (=> b!1206130 (=> (not res!802155) (not e!684943))))

(declare-datatypes ((List!26537 0))(
  ( (Nil!26534) (Cons!26533 (h!27742 (_ BitVec 64)) (t!39460 List!26537)) )
))
(declare-fun arrayNoDuplicates!0 (array!78075 (_ BitVec 32) List!26537) Bool)

(assert (=> b!1206130 (= res!802155 (arrayNoDuplicates!0 lt!547113 #b00000000000000000000000000000000 Nil!26534))))

(declare-fun b!1206131 () Bool)

(assert (=> b!1206131 (= e!684936 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!547105) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1206132 () Bool)

(declare-fun e!684946 () Bool)

(assert (=> b!1206132 (= e!684946 (= call!58646 call!58645))))

(declare-fun mapNonEmpty!47826 () Bool)

(declare-fun mapRes!47826 () Bool)

(declare-fun tp!90832 () Bool)

(declare-fun e!684941 () Bool)

(assert (=> mapNonEmpty!47826 (= mapRes!47826 (and tp!90832 e!684941))))

(declare-fun mapValue!47826 () ValueCell!14614)

(declare-fun mapRest!47826 () (Array (_ BitVec 32) ValueCell!14614))

(declare-fun mapKey!47826 () (_ BitVec 32))

(assert (=> mapNonEmpty!47826 (= (arr!37679 _values!996) (store mapRest!47826 mapKey!47826 mapValue!47826))))

(declare-fun res!802162 () Bool)

(assert (=> start!100772 (=> (not res!802162) (not e!684947))))

(assert (=> start!100772 (= res!802162 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38214 _keys!1208))))))

(assert (=> start!100772 e!684947))

(declare-fun tp_is_empty!30647 () Bool)

(assert (=> start!100772 tp_is_empty!30647))

(declare-fun array_inv!28704 (array!78075) Bool)

(assert (=> start!100772 (array_inv!28704 _keys!1208)))

(assert (=> start!100772 true))

(assert (=> start!100772 tp!90831))

(declare-fun e!684949 () Bool)

(declare-fun array_inv!28705 (array!78077) Bool)

(assert (=> start!100772 (and (array_inv!28705 _values!996) e!684949)))

(declare-fun bm!58644 () Bool)

(assert (=> bm!58644 (= call!58647 call!58644)))

(declare-fun b!1206133 () Bool)

(assert (=> b!1206133 (= e!684944 e!684938)))

(declare-fun c!118400 () Bool)

(assert (=> b!1206133 (= c!118400 (and (not lt!547105) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1206134 () Bool)

(declare-fun res!802151 () Bool)

(assert (=> b!1206134 (=> (not res!802151) (not e!684947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1206134 (= res!802151 (validMask!0 mask!1564))))

(declare-fun b!1206135 () Bool)

(declare-fun res!802159 () Bool)

(assert (=> b!1206135 (=> (not res!802159) (not e!684947))))

(assert (=> b!1206135 (= res!802159 (= (select (arr!37678 _keys!1208) i!673) k!934))))

(declare-fun b!1206136 () Bool)

(declare-fun res!802153 () Bool)

(assert (=> b!1206136 (=> (not res!802153) (not e!684947))))

(assert (=> b!1206136 (= res!802153 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26534))))

(declare-fun b!1206137 () Bool)

(declare-fun e!684937 () Unit!39985)

(declare-fun Unit!39987 () Unit!39985)

(assert (=> b!1206137 (= e!684937 Unit!39987)))

(declare-fun b!1206138 () Bool)

(declare-fun e!684942 () Bool)

(assert (=> b!1206138 (= e!684950 e!684942)))

(declare-fun res!802154 () Bool)

(assert (=> b!1206138 (=> res!802154 e!684942)))

(assert (=> b!1206138 (= res!802154 (not (= (select (arr!37678 _keys!1208) from!1455) k!934)))))

(assert (=> b!1206138 e!684946))

(declare-fun c!118401 () Bool)

(assert (=> b!1206138 (= c!118401 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!547101 () Unit!39985)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1032 (array!78075 array!78077 (_ BitVec 32) (_ BitVec 32) V!45989 V!45989 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39985)

(assert (=> b!1206138 (= lt!547101 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1032 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58645 () Bool)

(declare-fun call!58649 () ListLongMap!17701)

(assert (=> bm!58645 (= call!58644 (contains!6924 (ite c!118404 lt!547107 call!58649) k!934))))

(declare-fun b!1206139 () Bool)

(declare-fun c!118402 () Bool)

(assert (=> b!1206139 (= c!118402 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!547105))))

(assert (=> b!1206139 (= e!684938 e!684937)))

(declare-fun b!1206140 () Bool)

(assert (=> b!1206140 (= e!684941 tp_is_empty!30647)))

(declare-fun b!1206141 () Bool)

(declare-fun res!802148 () Bool)

(assert (=> b!1206141 (=> (not res!802148) (not e!684947))))

(assert (=> b!1206141 (= res!802148 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38214 _keys!1208))))))

(declare-fun b!1206142 () Bool)

(assert (=> b!1206142 (= e!684936 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206143 () Bool)

(assert (=> b!1206143 (= e!684943 (not e!684948))))

(declare-fun res!802161 () Bool)

(assert (=> b!1206143 (=> res!802161 e!684948)))

(assert (=> b!1206143 (= res!802161 (bvsgt from!1455 i!673))))

(assert (=> b!1206143 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!547108 () Unit!39985)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78075 (_ BitVec 64) (_ BitVec 32)) Unit!39985)

(assert (=> b!1206143 (= lt!547108 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1206144 () Bool)

(assert (=> b!1206144 (= e!684942 e!684939)))

(declare-fun res!802160 () Bool)

(assert (=> b!1206144 (=> res!802160 e!684939)))

(assert (=> b!1206144 (= res!802160 (not (contains!6924 lt!547112 k!934)))))

(assert (=> b!1206144 (= lt!547112 (getCurrentListMapNoExtraKeys!5301 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206145 () Bool)

(declare-fun res!802149 () Bool)

(assert (=> b!1206145 (=> (not res!802149) (not e!684947))))

(assert (=> b!1206145 (= res!802149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1206146 () Bool)

(declare-fun e!684935 () Bool)

(assert (=> b!1206146 (= e!684935 tp_is_empty!30647)))

(declare-fun b!1206147 () Bool)

(declare-fun res!802157 () Bool)

(assert (=> b!1206147 (=> (not res!802157) (not e!684947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1206147 (= res!802157 (validKeyInArray!0 k!934))))

(declare-fun b!1206148 () Bool)

(declare-fun -!1825 (ListLongMap!17701 (_ BitVec 64)) ListLongMap!17701)

(assert (=> b!1206148 (= e!684946 (= call!58646 (-!1825 call!58645 k!934)))))

(declare-fun mapIsEmpty!47826 () Bool)

(assert (=> mapIsEmpty!47826 mapRes!47826))

(declare-fun bm!58646 () Bool)

(assert (=> bm!58646 (= call!58651 (addStillContains!1016 lt!547112 (ite (or c!118404 c!118400) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118404 c!118400) zeroValue!944 minValue!944) k!934))))

(declare-fun bm!58647 () Bool)

(assert (=> bm!58647 (= call!58649 call!58650)))

(declare-fun bm!58648 () Bool)

(assert (=> bm!58648 (= call!58650 (+!3987 (ite c!118404 lt!547107 lt!547112) (ite c!118404 (tuple2!19733 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118400 (tuple2!19733 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19733 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1206149 () Bool)

(declare-fun lt!547109 () Unit!39985)

(assert (=> b!1206149 (= e!684937 lt!547109)))

(assert (=> b!1206149 (= lt!547109 call!58648)))

(assert (=> b!1206149 call!58647))

(declare-fun b!1206150 () Bool)

(assert (=> b!1206150 (= e!684949 (and e!684935 mapRes!47826))))

(declare-fun condMapEmpty!47826 () Bool)

(declare-fun mapDefault!47826 () ValueCell!14614)

