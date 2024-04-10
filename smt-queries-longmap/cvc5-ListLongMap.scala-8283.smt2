; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100900 () Bool)

(assert start!100900)

(declare-fun b_free!25969 () Bool)

(declare-fun b_next!25969 () Bool)

(assert (=> start!100900 (= b_free!25969 (not b_next!25969))))

(declare-fun tp!90916 () Bool)

(declare-fun b_and!42979 () Bool)

(assert (=> start!100900 (= tp!90916 b_and!42979)))

(declare-fun b!1207939 () Bool)

(declare-fun e!686011 () Bool)

(declare-fun tp_is_empty!30673 () Bool)

(assert (=> b!1207939 (= e!686011 tp_is_empty!30673)))

(declare-fun b!1207940 () Bool)

(declare-fun res!803017 () Bool)

(declare-fun e!686020 () Bool)

(assert (=> b!1207940 (=> (not res!803017) (not e!686020))))

(declare-datatypes ((array!78129 0))(
  ( (array!78130 (arr!37703 (Array (_ BitVec 32) (_ BitVec 64))) (size!38239 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78129)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78129 (_ BitVec 32)) Bool)

(assert (=> b!1207940 (= res!803017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1207941 () Bool)

(declare-fun e!686022 () Bool)

(declare-datatypes ((V!46025 0))(
  ( (V!46026 (val!15393 Int)) )
))
(declare-datatypes ((tuple2!19756 0))(
  ( (tuple2!19757 (_1!9889 (_ BitVec 64)) (_2!9889 V!46025)) )
))
(declare-datatypes ((List!26557 0))(
  ( (Nil!26554) (Cons!26553 (h!27762 tuple2!19756) (t!39506 List!26557)) )
))
(declare-datatypes ((ListLongMap!17725 0))(
  ( (ListLongMap!17726 (toList!8878 List!26557)) )
))
(declare-fun call!59027 () ListLongMap!17725)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!59026 () ListLongMap!17725)

(declare-fun -!1833 (ListLongMap!17725 (_ BitVec 64)) ListLongMap!17725)

(assert (=> b!1207941 (= e!686022 (= call!59027 (-!1833 call!59026 k!934)))))

(declare-fun bm!59023 () Bool)

(declare-datatypes ((Unit!40045 0))(
  ( (Unit!40046) )
))
(declare-fun call!59030 () Unit!40045)

(declare-fun call!59031 () Unit!40045)

(assert (=> bm!59023 (= call!59030 call!59031)))

(declare-fun b!1207942 () Bool)

(declare-fun e!686013 () Bool)

(declare-fun e!686024 () Bool)

(assert (=> b!1207942 (= e!686013 e!686024)))

(declare-fun res!803026 () Bool)

(assert (=> b!1207942 (=> res!803026 e!686024)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1207942 (= res!803026 (not (= (select (arr!37703 _keys!1208) from!1455) k!934)))))

(assert (=> b!1207942 e!686022))

(declare-fun c!118797 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1207942 (= c!118797 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!46025)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14627 0))(
  ( (ValueCellFull!14627 (v!18041 V!46025)) (EmptyCell!14627) )
))
(declare-datatypes ((array!78131 0))(
  ( (array!78132 (arr!37704 (Array (_ BitVec 32) ValueCell!14627)) (size!38240 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78131)

(declare-fun minValue!944 () V!46025)

(declare-fun lt!548151 () Unit!40045)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1040 (array!78129 array!78131 (_ BitVec 32) (_ BitVec 32) V!46025 V!46025 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40045)

(assert (=> b!1207942 (= lt!548151 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1040 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207943 () Bool)

(declare-fun res!803018 () Bool)

(assert (=> b!1207943 (=> (not res!803018) (not e!686020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1207943 (= res!803018 (validMask!0 mask!1564))))

(declare-fun lt!548159 () ListLongMap!17725)

(declare-fun bm!59024 () Bool)

(declare-fun c!118796 () Bool)

(declare-fun lt!548153 () ListLongMap!17725)

(declare-fun c!118793 () Bool)

(declare-fun call!59028 () ListLongMap!17725)

(declare-fun +!3997 (ListLongMap!17725 tuple2!19756) ListLongMap!17725)

(assert (=> bm!59024 (= call!59028 (+!3997 (ite c!118796 lt!548153 lt!548159) (ite c!118796 (tuple2!19757 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118793 (tuple2!19757 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19757 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1207944 () Bool)

(declare-fun e!686023 () Unit!40045)

(declare-fun lt!548156 () Unit!40045)

(assert (=> b!1207944 (= e!686023 lt!548156)))

(declare-fun lt!548152 () Unit!40045)

(assert (=> b!1207944 (= lt!548152 call!59031)))

(assert (=> b!1207944 (= lt!548153 (+!3997 lt!548159 (tuple2!19757 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!59033 () Bool)

(assert (=> b!1207944 call!59033))

(declare-fun addStillContains!1026 (ListLongMap!17725 (_ BitVec 64) V!46025 (_ BitVec 64)) Unit!40045)

(assert (=> b!1207944 (= lt!548156 (addStillContains!1026 lt!548153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun contains!6938 (ListLongMap!17725 (_ BitVec 64)) Bool)

(assert (=> b!1207944 (contains!6938 call!59028 k!934)))

(declare-fun mapNonEmpty!47872 () Bool)

(declare-fun mapRes!47872 () Bool)

(declare-fun tp!90917 () Bool)

(declare-fun e!686012 () Bool)

(assert (=> mapNonEmpty!47872 (= mapRes!47872 (and tp!90917 e!686012))))

(declare-fun mapRest!47872 () (Array (_ BitVec 32) ValueCell!14627))

(declare-fun mapKey!47872 () (_ BitVec 32))

(declare-fun mapValue!47872 () ValueCell!14627)

(assert (=> mapNonEmpty!47872 (= (arr!37704 _values!996) (store mapRest!47872 mapKey!47872 mapValue!47872))))

(declare-fun b!1207945 () Bool)

(declare-fun e!686021 () Unit!40045)

(assert (=> b!1207945 (= e!686023 e!686021)))

(declare-fun lt!548154 () Bool)

(assert (=> b!1207945 (= c!118793 (and (not lt!548154) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1207946 () Bool)

(declare-fun e!686009 () Bool)

(assert (=> b!1207946 (= e!686009 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!548154) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!59025 () Bool)

(declare-fun call!59029 () ListLongMap!17725)

(assert (=> bm!59025 (= call!59029 call!59028)))

(declare-fun b!1207947 () Bool)

(assert (=> b!1207947 (= e!686012 tp_is_empty!30673)))

(declare-fun res!803013 () Bool)

(assert (=> start!100900 (=> (not res!803013) (not e!686020))))

(assert (=> start!100900 (= res!803013 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38239 _keys!1208))))))

(assert (=> start!100900 e!686020))

(assert (=> start!100900 tp_is_empty!30673))

(declare-fun array_inv!28718 (array!78129) Bool)

(assert (=> start!100900 (array_inv!28718 _keys!1208)))

(assert (=> start!100900 true))

(assert (=> start!100900 tp!90916))

(declare-fun e!686015 () Bool)

(declare-fun array_inv!28719 (array!78131) Bool)

(assert (=> start!100900 (and (array_inv!28719 _values!996) e!686015)))

(declare-fun b!1207948 () Bool)

(declare-fun e!686018 () Unit!40045)

(declare-fun Unit!40047 () Unit!40045)

(assert (=> b!1207948 (= e!686018 Unit!40047)))

(declare-fun b!1207949 () Bool)

(declare-fun call!59032 () Bool)

(assert (=> b!1207949 call!59032))

(declare-fun lt!548155 () Unit!40045)

(assert (=> b!1207949 (= lt!548155 call!59030)))

(assert (=> b!1207949 (= e!686021 lt!548155)))

(declare-fun lt!548163 () array!78131)

(declare-fun bm!59026 () Bool)

(declare-fun lt!548158 () array!78129)

(declare-fun getCurrentListMapNoExtraKeys!5312 (array!78129 array!78131 (_ BitVec 32) (_ BitVec 32) V!46025 V!46025 (_ BitVec 32) Int) ListLongMap!17725)

(assert (=> bm!59026 (= call!59027 (getCurrentListMapNoExtraKeys!5312 lt!548158 lt!548163 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207950 () Bool)

(declare-fun res!803027 () Bool)

(assert (=> b!1207950 (=> (not res!803027) (not e!686020))))

(assert (=> b!1207950 (= res!803027 (= (select (arr!37703 _keys!1208) i!673) k!934))))

(declare-fun b!1207951 () Bool)

(declare-fun c!118795 () Bool)

(assert (=> b!1207951 (= c!118795 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!548154))))

(assert (=> b!1207951 (= e!686021 e!686018)))

(declare-fun b!1207952 () Bool)

(declare-fun e!686014 () Bool)

(assert (=> b!1207952 (= e!686020 e!686014)))

(declare-fun res!803016 () Bool)

(assert (=> b!1207952 (=> (not res!803016) (not e!686014))))

(assert (=> b!1207952 (= res!803016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548158 mask!1564))))

(assert (=> b!1207952 (= lt!548158 (array!78130 (store (arr!37703 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38239 _keys!1208)))))

(declare-fun b!1207953 () Bool)

(declare-fun e!686016 () Bool)

(assert (=> b!1207953 (= e!686024 e!686016)))

(declare-fun res!803023 () Bool)

(assert (=> b!1207953 (=> res!803023 e!686016)))

(assert (=> b!1207953 (= res!803023 (not (contains!6938 lt!548159 k!934)))))

(assert (=> b!1207953 (= lt!548159 (getCurrentListMapNoExtraKeys!5312 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207954 () Bool)

(assert (=> b!1207954 (= e!686022 (= call!59027 call!59026))))

(declare-fun b!1207955 () Bool)

(assert (=> b!1207955 (= e!686016 (or (bvsge (size!38239 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38239 _keys!1208)) (bvslt from!1455 (size!38239 _keys!1208))))))

(declare-datatypes ((List!26558 0))(
  ( (Nil!26555) (Cons!26554 (h!27763 (_ BitVec 64)) (t!39507 List!26558)) )
))
(declare-fun arrayNoDuplicates!0 (array!78129 (_ BitVec 32) List!26558) Bool)

(assert (=> b!1207955 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26555)))

(declare-fun lt!548150 () Unit!40045)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78129 (_ BitVec 32) (_ BitVec 32)) Unit!40045)

(assert (=> b!1207955 (= lt!548150 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!686019 () Bool)

(assert (=> b!1207955 e!686019))

(declare-fun res!803022 () Bool)

(assert (=> b!1207955 (=> (not res!803022) (not e!686019))))

(assert (=> b!1207955 (= res!803022 e!686009)))

(declare-fun c!118794 () Bool)

(assert (=> b!1207955 (= c!118794 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548162 () Unit!40045)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!580 (array!78129 array!78131 (_ BitVec 32) (_ BitVec 32) V!46025 V!46025 (_ BitVec 64) (_ BitVec 32) Int) Unit!40045)

(assert (=> b!1207955 (= lt!548162 (lemmaListMapContainsThenArrayContainsFrom!580 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!548149 () Unit!40045)

(assert (=> b!1207955 (= lt!548149 e!686023)))

(assert (=> b!1207955 (= c!118796 (and (not lt!548154) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1207955 (= lt!548154 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1207956 () Bool)

(declare-fun lt!548161 () Unit!40045)

(assert (=> b!1207956 (= e!686018 lt!548161)))

(assert (=> b!1207956 (= lt!548161 call!59030)))

(assert (=> b!1207956 call!59032))

(declare-fun b!1207957 () Bool)

(declare-fun res!803020 () Bool)

(assert (=> b!1207957 (=> (not res!803020) (not e!686020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1207957 (= res!803020 (validKeyInArray!0 k!934))))

(declare-fun b!1207958 () Bool)

(declare-fun e!686017 () Bool)

(assert (=> b!1207958 (= e!686014 (not e!686017))))

(declare-fun res!803014 () Bool)

(assert (=> b!1207958 (=> res!803014 e!686017)))

(assert (=> b!1207958 (= res!803014 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1207958 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!548157 () Unit!40045)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78129 (_ BitVec 64) (_ BitVec 32)) Unit!40045)

(assert (=> b!1207958 (= lt!548157 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1207959 () Bool)

(assert (=> b!1207959 (= e!686015 (and e!686011 mapRes!47872))))

(declare-fun condMapEmpty!47872 () Bool)

(declare-fun mapDefault!47872 () ValueCell!14627)

