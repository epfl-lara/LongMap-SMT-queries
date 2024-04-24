; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101048 () Bool)

(assert start!101048)

(declare-fun b_free!25951 () Bool)

(declare-fun b_next!25951 () Bool)

(assert (=> start!101048 (= b_free!25951 (not b_next!25951))))

(declare-fun tp!90859 () Bool)

(declare-fun b_and!42909 () Bool)

(assert (=> start!101048 (= tp!90859 b_and!42909)))

(declare-datatypes ((array!78125 0))(
  ( (array!78126 (arr!37696 (Array (_ BitVec 32) (_ BitVec 64))) (size!38233 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78125)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!686080 () Bool)

(declare-fun b!1207934 () Bool)

(declare-fun arrayContainsKey!0 (array!78125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1207934 (= e!686080 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1207935 () Bool)

(declare-fun e!686088 () Bool)

(declare-fun e!686082 () Bool)

(assert (=> b!1207935 (= e!686088 e!686082)))

(declare-fun res!802919 () Bool)

(assert (=> b!1207935 (=> res!802919 e!686082)))

(declare-datatypes ((V!46001 0))(
  ( (V!46002 (val!15384 Int)) )
))
(declare-datatypes ((tuple2!19750 0))(
  ( (tuple2!19751 (_1!9886 (_ BitVec 64)) (_2!9886 V!46001)) )
))
(declare-datatypes ((List!26558 0))(
  ( (Nil!26555) (Cons!26554 (h!27772 tuple2!19750) (t!39481 List!26558)) )
))
(declare-datatypes ((ListLongMap!17727 0))(
  ( (ListLongMap!17728 (toList!8879 List!26558)) )
))
(declare-fun lt!547891 () ListLongMap!17727)

(declare-fun contains!6960 (ListLongMap!17727 (_ BitVec 64)) Bool)

(assert (=> b!1207935 (= res!802919 (not (contains!6960 lt!547891 k0!934)))))

(declare-fun zeroValue!944 () V!46001)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14618 0))(
  ( (ValueCellFull!14618 (v!18025 V!46001)) (EmptyCell!14618) )
))
(declare-datatypes ((array!78127 0))(
  ( (array!78128 (arr!37697 (Array (_ BitVec 32) ValueCell!14618)) (size!38234 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78127)

(declare-fun minValue!944 () V!46001)

(declare-fun getCurrentListMapNoExtraKeys!5341 (array!78125 array!78127 (_ BitVec 32) (_ BitVec 32) V!46001 V!46001 (_ BitVec 32) Int) ListLongMap!17727)

(assert (=> b!1207935 (= lt!547891 (getCurrentListMapNoExtraKeys!5341 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207936 () Bool)

(declare-fun call!58827 () Bool)

(assert (=> b!1207936 call!58827))

(declare-datatypes ((Unit!39957 0))(
  ( (Unit!39958) )
))
(declare-fun lt!547894 () Unit!39957)

(declare-fun call!58834 () Unit!39957)

(assert (=> b!1207936 (= lt!547894 call!58834)))

(declare-fun e!686086 () Unit!39957)

(assert (=> b!1207936 (= e!686086 lt!547894)))

(declare-fun b!1207937 () Bool)

(declare-fun e!686079 () Bool)

(declare-fun e!686089 () Bool)

(assert (=> b!1207937 (= e!686079 e!686089)))

(declare-fun res!802915 () Bool)

(assert (=> b!1207937 (=> (not res!802915) (not e!686089))))

(declare-fun lt!547898 () array!78125)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78125 (_ BitVec 32)) Bool)

(assert (=> b!1207937 (= res!802915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547898 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1207937 (= lt!547898 (array!78126 (store (arr!37696 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38233 _keys!1208)))))

(declare-fun lt!547887 () Bool)

(declare-fun b!1207938 () Bool)

(assert (=> b!1207938 (= e!686080 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!547887) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!58824 () Bool)

(declare-fun call!58828 () Unit!39957)

(assert (=> bm!58824 (= call!58834 call!58828)))

(declare-fun b!1207939 () Bool)

(declare-fun e!686081 () Bool)

(declare-fun e!686085 () Bool)

(declare-fun mapRes!47841 () Bool)

(assert (=> b!1207939 (= e!686081 (and e!686085 mapRes!47841))))

(declare-fun condMapEmpty!47841 () Bool)

(declare-fun mapDefault!47841 () ValueCell!14618)

(assert (=> b!1207939 (= condMapEmpty!47841 (= (arr!37697 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14618)) mapDefault!47841)))))

(declare-fun b!1207940 () Bool)

(declare-fun e!686091 () Unit!39957)

(declare-fun lt!547896 () Unit!39957)

(assert (=> b!1207940 (= e!686091 lt!547896)))

(assert (=> b!1207940 (= lt!547896 call!58834)))

(assert (=> b!1207940 call!58827))

(declare-fun bm!58825 () Bool)

(declare-fun call!58830 () ListLongMap!17727)

(declare-fun call!58831 () ListLongMap!17727)

(assert (=> bm!58825 (= call!58830 call!58831)))

(declare-fun b!1207941 () Bool)

(assert (=> b!1207941 (= e!686082 true)))

(declare-datatypes ((List!26559 0))(
  ( (Nil!26556) (Cons!26555 (h!27773 (_ BitVec 64)) (t!39482 List!26559)) )
))
(declare-fun arrayNoDuplicates!0 (array!78125 (_ BitVec 32) List!26559) Bool)

(assert (=> b!1207941 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26556)))

(declare-fun lt!547895 () Unit!39957)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78125 (_ BitVec 32) (_ BitVec 32)) Unit!39957)

(assert (=> b!1207941 (= lt!547895 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!686077 () Bool)

(assert (=> b!1207941 e!686077))

(declare-fun res!802918 () Bool)

(assert (=> b!1207941 (=> (not res!802918) (not e!686077))))

(assert (=> b!1207941 (= res!802918 e!686080)))

(declare-fun c!118907 () Bool)

(assert (=> b!1207941 (= c!118907 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547889 () Unit!39957)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!580 (array!78125 array!78127 (_ BitVec 32) (_ BitVec 32) V!46001 V!46001 (_ BitVec 64) (_ BitVec 32) Int) Unit!39957)

(assert (=> b!1207941 (= lt!547889 (lemmaListMapContainsThenArrayContainsFrom!580 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547888 () Unit!39957)

(declare-fun e!686087 () Unit!39957)

(assert (=> b!1207941 (= lt!547888 e!686087)))

(declare-fun c!118908 () Bool)

(assert (=> b!1207941 (= c!118908 (and (not lt!547887) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1207941 (= lt!547887 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1207942 () Bool)

(declare-fun lt!547893 () Unit!39957)

(assert (=> b!1207942 (= e!686087 lt!547893)))

(declare-fun lt!547897 () Unit!39957)

(assert (=> b!1207942 (= lt!547897 call!58828)))

(declare-fun lt!547900 () ListLongMap!17727)

(declare-fun +!4042 (ListLongMap!17727 tuple2!19750) ListLongMap!17727)

(assert (=> b!1207942 (= lt!547900 (+!4042 lt!547891 (tuple2!19751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!58829 () Bool)

(assert (=> b!1207942 call!58829))

(declare-fun addStillContains!1027 (ListLongMap!17727 (_ BitVec 64) V!46001 (_ BitVec 64)) Unit!39957)

(assert (=> b!1207942 (= lt!547893 (addStillContains!1027 lt!547900 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1207942 (contains!6960 call!58831 k0!934)))

(declare-fun b!1207943 () Bool)

(declare-fun res!802912 () Bool)

(assert (=> b!1207943 (=> (not res!802912) (not e!686079))))

(assert (=> b!1207943 (= res!802912 (= (select (arr!37696 _keys!1208) i!673) k0!934))))

(declare-fun b!1207944 () Bool)

(declare-fun res!802917 () Bool)

(assert (=> b!1207944 (=> (not res!802917) (not e!686079))))

(assert (=> b!1207944 (= res!802917 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38233 _keys!1208))))))

(declare-fun b!1207945 () Bool)

(assert (=> b!1207945 (= e!686077 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1207946 () Bool)

(declare-fun res!802922 () Bool)

(assert (=> b!1207946 (=> (not res!802922) (not e!686089))))

(assert (=> b!1207946 (= res!802922 (arrayNoDuplicates!0 lt!547898 #b00000000000000000000000000000000 Nil!26556))))

(declare-fun mapNonEmpty!47841 () Bool)

(declare-fun tp!90858 () Bool)

(declare-fun e!686083 () Bool)

(assert (=> mapNonEmpty!47841 (= mapRes!47841 (and tp!90858 e!686083))))

(declare-fun mapKey!47841 () (_ BitVec 32))

(declare-fun mapValue!47841 () ValueCell!14618)

(declare-fun mapRest!47841 () (Array (_ BitVec 32) ValueCell!14618))

(assert (=> mapNonEmpty!47841 (= (arr!37697 _values!996) (store mapRest!47841 mapKey!47841 mapValue!47841))))

(declare-fun b!1207947 () Bool)

(declare-fun c!118909 () Bool)

(assert (=> b!1207947 (= c!118909 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!547887))))

(assert (=> b!1207947 (= e!686086 e!686091)))

(declare-fun b!1207948 () Bool)

(declare-fun e!686076 () Bool)

(assert (=> b!1207948 (= e!686089 (not e!686076))))

(declare-fun res!802913 () Bool)

(assert (=> b!1207948 (=> res!802913 e!686076)))

(assert (=> b!1207948 (= res!802913 (bvsgt from!1455 i!673))))

(assert (=> b!1207948 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!547899 () Unit!39957)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78125 (_ BitVec 64) (_ BitVec 32)) Unit!39957)

(assert (=> b!1207948 (= lt!547899 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!802914 () Bool)

(assert (=> start!101048 (=> (not res!802914) (not e!686079))))

(assert (=> start!101048 (= res!802914 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38233 _keys!1208))))))

(assert (=> start!101048 e!686079))

(declare-fun tp_is_empty!30655 () Bool)

(assert (=> start!101048 tp_is_empty!30655))

(declare-fun array_inv!28784 (array!78125) Bool)

(assert (=> start!101048 (array_inv!28784 _keys!1208)))

(assert (=> start!101048 true))

(assert (=> start!101048 tp!90859))

(declare-fun array_inv!28785 (array!78127) Bool)

(assert (=> start!101048 (and (array_inv!28785 _values!996) e!686081)))

(declare-fun bm!58826 () Bool)

(declare-fun c!118910 () Bool)

(assert (=> bm!58826 (= call!58828 (addStillContains!1027 lt!547891 (ite (or c!118908 c!118910) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118908 c!118910) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1207949 () Bool)

(declare-fun res!802920 () Bool)

(assert (=> b!1207949 (=> (not res!802920) (not e!686079))))

(assert (=> b!1207949 (= res!802920 (and (= (size!38234 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38233 _keys!1208) (size!38234 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1207950 () Bool)

(assert (=> b!1207950 (= e!686083 tp_is_empty!30655)))

(declare-fun b!1207951 () Bool)

(assert (=> b!1207951 (= e!686087 e!686086)))

(assert (=> b!1207951 (= c!118910 (and (not lt!547887) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!58833 () ListLongMap!17727)

(declare-fun lt!547902 () array!78127)

(declare-fun bm!58827 () Bool)

(assert (=> bm!58827 (= call!58833 (getCurrentListMapNoExtraKeys!5341 lt!547898 lt!547902 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58828 () Bool)

(assert (=> bm!58828 (= call!58829 (contains!6960 (ite c!118908 lt!547900 call!58830) k0!934))))

(declare-fun b!1207952 () Bool)

(declare-fun e!686078 () Bool)

(assert (=> b!1207952 (= e!686078 e!686088)))

(declare-fun res!802916 () Bool)

(assert (=> b!1207952 (=> res!802916 e!686088)))

(assert (=> b!1207952 (= res!802916 (not (= (select (arr!37696 _keys!1208) from!1455) k0!934)))))

(declare-fun e!686090 () Bool)

(assert (=> b!1207952 e!686090))

(declare-fun c!118906 () Bool)

(assert (=> b!1207952 (= c!118906 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!547892 () Unit!39957)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1038 (array!78125 array!78127 (_ BitVec 32) (_ BitVec 32) V!46001 V!46001 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39957)

(assert (=> b!1207952 (= lt!547892 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1038 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207953 () Bool)

(declare-fun res!802921 () Bool)

(assert (=> b!1207953 (=> (not res!802921) (not e!686079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1207953 (= res!802921 (validMask!0 mask!1564))))

(declare-fun b!1207954 () Bool)

(declare-fun call!58832 () ListLongMap!17727)

(assert (=> b!1207954 (= e!686090 (= call!58833 call!58832))))

(declare-fun bm!58829 () Bool)

(assert (=> bm!58829 (= call!58832 (getCurrentListMapNoExtraKeys!5341 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207955 () Bool)

(assert (=> b!1207955 (= e!686085 tp_is_empty!30655)))

(declare-fun b!1207956 () Bool)

(declare-fun res!802911 () Bool)

(assert (=> b!1207956 (=> (not res!802911) (not e!686079))))

(assert (=> b!1207956 (= res!802911 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26556))))

(declare-fun b!1207957 () Bool)

(declare-fun res!802909 () Bool)

(assert (=> b!1207957 (=> (not res!802909) (not e!686079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1207957 (= res!802909 (validKeyInArray!0 k0!934))))

(declare-fun b!1207958 () Bool)

(declare-fun Unit!39959 () Unit!39957)

(assert (=> b!1207958 (= e!686091 Unit!39959)))

(declare-fun mapIsEmpty!47841 () Bool)

(assert (=> mapIsEmpty!47841 mapRes!47841))

(declare-fun b!1207959 () Bool)

(declare-fun -!1819 (ListLongMap!17727 (_ BitVec 64)) ListLongMap!17727)

(assert (=> b!1207959 (= e!686090 (= call!58833 (-!1819 call!58832 k0!934)))))

(declare-fun b!1207960 () Bool)

(assert (=> b!1207960 (= e!686076 e!686078)))

(declare-fun res!802910 () Bool)

(assert (=> b!1207960 (=> res!802910 e!686078)))

(assert (=> b!1207960 (= res!802910 (not (= from!1455 i!673)))))

(declare-fun lt!547901 () ListLongMap!17727)

(assert (=> b!1207960 (= lt!547901 (getCurrentListMapNoExtraKeys!5341 lt!547898 lt!547902 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3263 (Int (_ BitVec 64)) V!46001)

(assert (=> b!1207960 (= lt!547902 (array!78128 (store (arr!37697 _values!996) i!673 (ValueCellFull!14618 (dynLambda!3263 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38234 _values!996)))))

(declare-fun lt!547890 () ListLongMap!17727)

(assert (=> b!1207960 (= lt!547890 (getCurrentListMapNoExtraKeys!5341 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1207961 () Bool)

(declare-fun res!802923 () Bool)

(assert (=> b!1207961 (=> (not res!802923) (not e!686079))))

(assert (=> b!1207961 (= res!802923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!58830 () Bool)

(assert (=> bm!58830 (= call!58827 call!58829)))

(declare-fun bm!58831 () Bool)

(assert (=> bm!58831 (= call!58831 (+!4042 (ite c!118908 lt!547900 lt!547891) (ite c!118908 (tuple2!19751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118910 (tuple2!19751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and start!101048 res!802914) b!1207953))

(assert (= (and b!1207953 res!802921) b!1207949))

(assert (= (and b!1207949 res!802920) b!1207961))

(assert (= (and b!1207961 res!802923) b!1207956))

(assert (= (and b!1207956 res!802911) b!1207944))

(assert (= (and b!1207944 res!802917) b!1207957))

(assert (= (and b!1207957 res!802909) b!1207943))

(assert (= (and b!1207943 res!802912) b!1207937))

(assert (= (and b!1207937 res!802915) b!1207946))

(assert (= (and b!1207946 res!802922) b!1207948))

(assert (= (and b!1207948 (not res!802913)) b!1207960))

(assert (= (and b!1207960 (not res!802910)) b!1207952))

(assert (= (and b!1207952 c!118906) b!1207959))

(assert (= (and b!1207952 (not c!118906)) b!1207954))

(assert (= (or b!1207959 b!1207954) bm!58827))

(assert (= (or b!1207959 b!1207954) bm!58829))

(assert (= (and b!1207952 (not res!802916)) b!1207935))

(assert (= (and b!1207935 (not res!802919)) b!1207941))

(assert (= (and b!1207941 c!118908) b!1207942))

(assert (= (and b!1207941 (not c!118908)) b!1207951))

(assert (= (and b!1207951 c!118910) b!1207936))

(assert (= (and b!1207951 (not c!118910)) b!1207947))

(assert (= (and b!1207947 c!118909) b!1207940))

(assert (= (and b!1207947 (not c!118909)) b!1207958))

(assert (= (or b!1207936 b!1207940) bm!58824))

(assert (= (or b!1207936 b!1207940) bm!58825))

(assert (= (or b!1207936 b!1207940) bm!58830))

(assert (= (or b!1207942 bm!58830) bm!58828))

(assert (= (or b!1207942 bm!58824) bm!58826))

(assert (= (or b!1207942 bm!58825) bm!58831))

(assert (= (and b!1207941 c!118907) b!1207934))

(assert (= (and b!1207941 (not c!118907)) b!1207938))

(assert (= (and b!1207941 res!802918) b!1207945))

(assert (= (and b!1207939 condMapEmpty!47841) mapIsEmpty!47841))

(assert (= (and b!1207939 (not condMapEmpty!47841)) mapNonEmpty!47841))

(get-info :version)

(assert (= (and mapNonEmpty!47841 ((_ is ValueCellFull!14618) mapValue!47841)) b!1207950))

(assert (= (and b!1207939 ((_ is ValueCellFull!14618) mapDefault!47841)) b!1207955))

(assert (= start!101048 b!1207939))

(declare-fun b_lambda!21387 () Bool)

(assert (=> (not b_lambda!21387) (not b!1207960)))

(declare-fun t!39480 () Bool)

(declare-fun tb!10743 () Bool)

(assert (=> (and start!101048 (= defaultEntry!1004 defaultEntry!1004) t!39480) tb!10743))

(declare-fun result!22081 () Bool)

(assert (=> tb!10743 (= result!22081 tp_is_empty!30655)))

(assert (=> b!1207960 t!39480))

(declare-fun b_and!42911 () Bool)

(assert (= b_and!42909 (and (=> t!39480 result!22081) b_and!42911)))

(declare-fun m!1113927 () Bool)

(assert (=> b!1207959 m!1113927))

(declare-fun m!1113929 () Bool)

(assert (=> b!1207937 m!1113929))

(declare-fun m!1113931 () Bool)

(assert (=> b!1207937 m!1113931))

(declare-fun m!1113933 () Bool)

(assert (=> b!1207948 m!1113933))

(declare-fun m!1113935 () Bool)

(assert (=> b!1207948 m!1113935))

(declare-fun m!1113937 () Bool)

(assert (=> b!1207953 m!1113937))

(declare-fun m!1113939 () Bool)

(assert (=> b!1207961 m!1113939))

(declare-fun m!1113941 () Bool)

(assert (=> b!1207942 m!1113941))

(declare-fun m!1113943 () Bool)

(assert (=> b!1207942 m!1113943))

(declare-fun m!1113945 () Bool)

(assert (=> b!1207942 m!1113945))

(declare-fun m!1113947 () Bool)

(assert (=> bm!58827 m!1113947))

(declare-fun m!1113949 () Bool)

(assert (=> bm!58826 m!1113949))

(declare-fun m!1113951 () Bool)

(assert (=> b!1207935 m!1113951))

(declare-fun m!1113953 () Bool)

(assert (=> b!1207935 m!1113953))

(declare-fun m!1113955 () Bool)

(assert (=> b!1207957 m!1113955))

(declare-fun m!1113957 () Bool)

(assert (=> bm!58831 m!1113957))

(declare-fun m!1113959 () Bool)

(assert (=> bm!58828 m!1113959))

(declare-fun m!1113961 () Bool)

(assert (=> b!1207934 m!1113961))

(declare-fun m!1113963 () Bool)

(assert (=> start!101048 m!1113963))

(declare-fun m!1113965 () Bool)

(assert (=> start!101048 m!1113965))

(declare-fun m!1113967 () Bool)

(assert (=> b!1207941 m!1113967))

(declare-fun m!1113969 () Bool)

(assert (=> b!1207941 m!1113969))

(declare-fun m!1113971 () Bool)

(assert (=> b!1207941 m!1113971))

(declare-fun m!1113973 () Bool)

(assert (=> b!1207943 m!1113973))

(declare-fun m!1113975 () Bool)

(assert (=> mapNonEmpty!47841 m!1113975))

(declare-fun m!1113977 () Bool)

(assert (=> b!1207946 m!1113977))

(declare-fun m!1113979 () Bool)

(assert (=> b!1207960 m!1113979))

(declare-fun m!1113981 () Bool)

(assert (=> b!1207960 m!1113981))

(declare-fun m!1113983 () Bool)

(assert (=> b!1207960 m!1113983))

(declare-fun m!1113985 () Bool)

(assert (=> b!1207960 m!1113985))

(declare-fun m!1113987 () Bool)

(assert (=> b!1207952 m!1113987))

(declare-fun m!1113989 () Bool)

(assert (=> b!1207952 m!1113989))

(declare-fun m!1113991 () Bool)

(assert (=> b!1207956 m!1113991))

(assert (=> bm!58829 m!1113953))

(assert (=> b!1207945 m!1113961))

(check-sat (not b!1207959) (not b!1207952) (not b!1207934) (not b!1207960) (not bm!58827) (not bm!58826) (not b_lambda!21387) (not b!1207948) tp_is_empty!30655 (not b!1207945) (not bm!58828) (not b_next!25951) b_and!42911 (not b!1207953) (not bm!58829) (not b!1207941) (not b!1207937) (not b!1207956) (not b!1207935) (not b!1207957) (not b!1207942) (not b!1207946) (not bm!58831) (not start!101048) (not mapNonEmpty!47841) (not b!1207961))
(check-sat b_and!42911 (not b_next!25951))
