; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101566 () Bool)

(assert start!101566)

(declare-fun b_free!26227 () Bool)

(declare-fun b_next!26227 () Bool)

(assert (=> start!101566 (= b_free!26227 (not b_next!26227))))

(declare-fun tp!91706 () Bool)

(declare-fun b_and!43591 () Bool)

(assert (=> start!101566 (= tp!91706 b_and!43591)))

(declare-fun mapIsEmpty!48274 () Bool)

(declare-fun mapRes!48274 () Bool)

(assert (=> mapIsEmpty!48274 mapRes!48274))

(declare-fun b!1218812 () Bool)

(declare-fun res!809064 () Bool)

(declare-fun e!692061 () Bool)

(assert (=> b!1218812 (=> (not res!809064) (not e!692061))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1218812 (= res!809064 (validKeyInArray!0 k0!934))))

(declare-fun b!1218813 () Bool)

(declare-fun e!692055 () Bool)

(declare-fun tp_is_empty!30931 () Bool)

(assert (=> b!1218813 (= e!692055 tp_is_empty!30931)))

(declare-fun b!1218815 () Bool)

(declare-fun res!809058 () Bool)

(assert (=> b!1218815 (=> (not res!809058) (not e!692061))))

(declare-datatypes ((array!78677 0))(
  ( (array!78678 (arr!37966 (Array (_ BitVec 32) (_ BitVec 64))) (size!38503 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78677)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78677 (_ BitVec 32)) Bool)

(assert (=> b!1218815 (= res!809058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1218816 () Bool)

(declare-fun e!692058 () Bool)

(declare-fun e!692057 () Bool)

(assert (=> b!1218816 (= e!692058 e!692057)))

(declare-fun res!809056 () Bool)

(assert (=> b!1218816 (=> res!809056 e!692057)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1218816 (= res!809056 (not (validKeyInArray!0 (select (arr!37966 _keys!1208) from!1455))))))

(declare-datatypes ((V!46369 0))(
  ( (V!46370 (val!15522 Int)) )
))
(declare-datatypes ((tuple2!19974 0))(
  ( (tuple2!19975 (_1!9998 (_ BitVec 64)) (_2!9998 V!46369)) )
))
(declare-datatypes ((List!26783 0))(
  ( (Nil!26780) (Cons!26779 (h!27997 tuple2!19974) (t!39982 List!26783)) )
))
(declare-datatypes ((ListLongMap!17951 0))(
  ( (ListLongMap!17952 (toList!8991 List!26783)) )
))
(declare-fun lt!553886 () ListLongMap!17951)

(declare-fun lt!553884 () ListLongMap!17951)

(assert (=> b!1218816 (= lt!553886 lt!553884)))

(declare-fun lt!553885 () ListLongMap!17951)

(declare-fun -!1882 (ListLongMap!17951 (_ BitVec 64)) ListLongMap!17951)

(assert (=> b!1218816 (= lt!553884 (-!1882 lt!553885 k0!934))))

(declare-fun zeroValue!944 () V!46369)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14756 0))(
  ( (ValueCellFull!14756 (v!18172 V!46369)) (EmptyCell!14756) )
))
(declare-datatypes ((array!78679 0))(
  ( (array!78680 (arr!37967 (Array (_ BitVec 32) ValueCell!14756)) (size!38504 (_ BitVec 32))) )
))
(declare-fun lt!553883 () array!78679)

(declare-fun minValue!944 () V!46369)

(declare-fun lt!553887 () array!78677)

(declare-fun getCurrentListMapNoExtraKeys!5448 (array!78677 array!78679 (_ BitVec 32) (_ BitVec 32) V!46369 V!46369 (_ BitVec 32) Int) ListLongMap!17951)

(assert (=> b!1218816 (= lt!553886 (getCurrentListMapNoExtraKeys!5448 lt!553887 lt!553883 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78679)

(assert (=> b!1218816 (= lt!553885 (getCurrentListMapNoExtraKeys!5448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40338 0))(
  ( (Unit!40339) )
))
(declare-fun lt!553879 () Unit!40338)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1097 (array!78677 array!78679 (_ BitVec 32) (_ BitVec 32) V!46369 V!46369 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40338)

(assert (=> b!1218816 (= lt!553879 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1097 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1218817 () Bool)

(declare-fun res!809066 () Bool)

(assert (=> b!1218817 (=> (not res!809066) (not e!692061))))

(assert (=> b!1218817 (= res!809066 (and (= (size!38504 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38503 _keys!1208) (size!38504 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1218818 () Bool)

(declare-fun e!692059 () Bool)

(declare-fun e!692060 () Bool)

(assert (=> b!1218818 (= e!692059 (not e!692060))))

(declare-fun res!809059 () Bool)

(assert (=> b!1218818 (=> res!809059 e!692060)))

(assert (=> b!1218818 (= res!809059 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218818 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!553882 () Unit!40338)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78677 (_ BitVec 64) (_ BitVec 32)) Unit!40338)

(assert (=> b!1218818 (= lt!553882 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218819 () Bool)

(declare-fun e!692056 () Bool)

(assert (=> b!1218819 (= e!692057 e!692056)))

(declare-fun res!809054 () Bool)

(assert (=> b!1218819 (=> res!809054 e!692056)))

(assert (=> b!1218819 (= res!809054 (not (= (select (arr!37966 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!553880 () ListLongMap!17951)

(declare-fun lt!553881 () V!46369)

(declare-fun +!4104 (ListLongMap!17951 tuple2!19974) ListLongMap!17951)

(declare-fun get!19386 (ValueCell!14756 V!46369) V!46369)

(assert (=> b!1218819 (= lt!553880 (+!4104 lt!553884 (tuple2!19975 (select (arr!37966 _keys!1208) from!1455) (get!19386 (select (arr!37967 _values!996) from!1455) lt!553881))))))

(declare-fun b!1218820 () Bool)

(declare-fun res!809065 () Bool)

(assert (=> b!1218820 (=> (not res!809065) (not e!692061))))

(assert (=> b!1218820 (= res!809065 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38503 _keys!1208))))))

(declare-fun b!1218821 () Bool)

(assert (=> b!1218821 (= e!692060 e!692058)))

(declare-fun res!809062 () Bool)

(assert (=> b!1218821 (=> res!809062 e!692058)))

(assert (=> b!1218821 (= res!809062 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1218821 (= lt!553880 (getCurrentListMapNoExtraKeys!5448 lt!553887 lt!553883 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1218821 (= lt!553883 (array!78680 (store (arr!37967 _values!996) i!673 (ValueCellFull!14756 lt!553881)) (size!38504 _values!996)))))

(declare-fun dynLambda!3354 (Int (_ BitVec 64)) V!46369)

(assert (=> b!1218821 (= lt!553881 (dynLambda!3354 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553878 () ListLongMap!17951)

(assert (=> b!1218821 (= lt!553878 (getCurrentListMapNoExtraKeys!5448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1218822 () Bool)

(assert (=> b!1218822 (= e!692061 e!692059)))

(declare-fun res!809061 () Bool)

(assert (=> b!1218822 (=> (not res!809061) (not e!692059))))

(assert (=> b!1218822 (= res!809061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553887 mask!1564))))

(assert (=> b!1218822 (= lt!553887 (array!78678 (store (arr!37966 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38503 _keys!1208)))))

(declare-fun b!1218823 () Bool)

(declare-fun res!809060 () Bool)

(assert (=> b!1218823 (=> (not res!809060) (not e!692061))))

(declare-datatypes ((List!26784 0))(
  ( (Nil!26781) (Cons!26780 (h!27998 (_ BitVec 64)) (t!39983 List!26784)) )
))
(declare-fun arrayNoDuplicates!0 (array!78677 (_ BitVec 32) List!26784) Bool)

(assert (=> b!1218823 (= res!809060 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26781))))

(declare-fun mapNonEmpty!48274 () Bool)

(declare-fun tp!91705 () Bool)

(assert (=> mapNonEmpty!48274 (= mapRes!48274 (and tp!91705 e!692055))))

(declare-fun mapValue!48274 () ValueCell!14756)

(declare-fun mapRest!48274 () (Array (_ BitVec 32) ValueCell!14756))

(declare-fun mapKey!48274 () (_ BitVec 32))

(assert (=> mapNonEmpty!48274 (= (arr!37967 _values!996) (store mapRest!48274 mapKey!48274 mapValue!48274))))

(declare-fun b!1218824 () Bool)

(assert (=> b!1218824 (= e!692056 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun res!809067 () Bool)

(assert (=> start!101566 (=> (not res!809067) (not e!692061))))

(assert (=> start!101566 (= res!809067 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38503 _keys!1208))))))

(assert (=> start!101566 e!692061))

(assert (=> start!101566 tp_is_empty!30931))

(declare-fun array_inv!28964 (array!78677) Bool)

(assert (=> start!101566 (array_inv!28964 _keys!1208)))

(assert (=> start!101566 true))

(assert (=> start!101566 tp!91706))

(declare-fun e!692063 () Bool)

(declare-fun array_inv!28965 (array!78679) Bool)

(assert (=> start!101566 (and (array_inv!28965 _values!996) e!692063)))

(declare-fun b!1218814 () Bool)

(declare-fun e!692062 () Bool)

(assert (=> b!1218814 (= e!692062 tp_is_empty!30931)))

(declare-fun b!1218825 () Bool)

(assert (=> b!1218825 (= e!692063 (and e!692062 mapRes!48274))))

(declare-fun condMapEmpty!48274 () Bool)

(declare-fun mapDefault!48274 () ValueCell!14756)

(assert (=> b!1218825 (= condMapEmpty!48274 (= (arr!37967 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14756)) mapDefault!48274)))))

(declare-fun b!1218826 () Bool)

(declare-fun res!809063 () Bool)

(assert (=> b!1218826 (=> (not res!809063) (not e!692059))))

(assert (=> b!1218826 (= res!809063 (arrayNoDuplicates!0 lt!553887 #b00000000000000000000000000000000 Nil!26781))))

(declare-fun b!1218827 () Bool)

(declare-fun res!809057 () Bool)

(assert (=> b!1218827 (=> (not res!809057) (not e!692061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1218827 (= res!809057 (validMask!0 mask!1564))))

(declare-fun b!1218828 () Bool)

(declare-fun res!809055 () Bool)

(assert (=> b!1218828 (=> (not res!809055) (not e!692061))))

(assert (=> b!1218828 (= res!809055 (= (select (arr!37966 _keys!1208) i!673) k0!934))))

(assert (= (and start!101566 res!809067) b!1218827))

(assert (= (and b!1218827 res!809057) b!1218817))

(assert (= (and b!1218817 res!809066) b!1218815))

(assert (= (and b!1218815 res!809058) b!1218823))

(assert (= (and b!1218823 res!809060) b!1218820))

(assert (= (and b!1218820 res!809065) b!1218812))

(assert (= (and b!1218812 res!809064) b!1218828))

(assert (= (and b!1218828 res!809055) b!1218822))

(assert (= (and b!1218822 res!809061) b!1218826))

(assert (= (and b!1218826 res!809063) b!1218818))

(assert (= (and b!1218818 (not res!809059)) b!1218821))

(assert (= (and b!1218821 (not res!809062)) b!1218816))

(assert (= (and b!1218816 (not res!809056)) b!1218819))

(assert (= (and b!1218819 (not res!809054)) b!1218824))

(assert (= (and b!1218825 condMapEmpty!48274) mapIsEmpty!48274))

(assert (= (and b!1218825 (not condMapEmpty!48274)) mapNonEmpty!48274))

(get-info :version)

(assert (= (and mapNonEmpty!48274 ((_ is ValueCellFull!14756) mapValue!48274)) b!1218813))

(assert (= (and b!1218825 ((_ is ValueCellFull!14756) mapDefault!48274)) b!1218814))

(assert (= start!101566 b!1218825))

(declare-fun b_lambda!21935 () Bool)

(assert (=> (not b_lambda!21935) (not b!1218821)))

(declare-fun t!39981 () Bool)

(declare-fun tb!11019 () Bool)

(assert (=> (and start!101566 (= defaultEntry!1004 defaultEntry!1004) t!39981) tb!11019))

(declare-fun result!22645 () Bool)

(assert (=> tb!11019 (= result!22645 tp_is_empty!30931)))

(assert (=> b!1218821 t!39981))

(declare-fun b_and!43593 () Bool)

(assert (= b_and!43591 (and (=> t!39981 result!22645) b_and!43593)))

(declare-fun m!1123849 () Bool)

(assert (=> mapNonEmpty!48274 m!1123849))

(declare-fun m!1123851 () Bool)

(assert (=> b!1218812 m!1123851))

(declare-fun m!1123853 () Bool)

(assert (=> b!1218819 m!1123853))

(declare-fun m!1123855 () Bool)

(assert (=> b!1218819 m!1123855))

(assert (=> b!1218819 m!1123855))

(declare-fun m!1123857 () Bool)

(assert (=> b!1218819 m!1123857))

(declare-fun m!1123859 () Bool)

(assert (=> b!1218819 m!1123859))

(declare-fun m!1123861 () Bool)

(assert (=> b!1218818 m!1123861))

(declare-fun m!1123863 () Bool)

(assert (=> b!1218818 m!1123863))

(declare-fun m!1123865 () Bool)

(assert (=> b!1218824 m!1123865))

(declare-fun m!1123867 () Bool)

(assert (=> b!1218816 m!1123867))

(declare-fun m!1123869 () Bool)

(assert (=> b!1218816 m!1123869))

(declare-fun m!1123871 () Bool)

(assert (=> b!1218816 m!1123871))

(declare-fun m!1123873 () Bool)

(assert (=> b!1218816 m!1123873))

(assert (=> b!1218816 m!1123853))

(declare-fun m!1123875 () Bool)

(assert (=> b!1218816 m!1123875))

(assert (=> b!1218816 m!1123853))

(declare-fun m!1123877 () Bool)

(assert (=> b!1218821 m!1123877))

(declare-fun m!1123879 () Bool)

(assert (=> b!1218821 m!1123879))

(declare-fun m!1123881 () Bool)

(assert (=> b!1218821 m!1123881))

(declare-fun m!1123883 () Bool)

(assert (=> b!1218821 m!1123883))

(declare-fun m!1123885 () Bool)

(assert (=> b!1218823 m!1123885))

(declare-fun m!1123887 () Bool)

(assert (=> b!1218828 m!1123887))

(declare-fun m!1123889 () Bool)

(assert (=> b!1218827 m!1123889))

(declare-fun m!1123891 () Bool)

(assert (=> b!1218815 m!1123891))

(declare-fun m!1123893 () Bool)

(assert (=> start!101566 m!1123893))

(declare-fun m!1123895 () Bool)

(assert (=> start!101566 m!1123895))

(declare-fun m!1123897 () Bool)

(assert (=> b!1218826 m!1123897))

(declare-fun m!1123899 () Bool)

(assert (=> b!1218822 m!1123899))

(declare-fun m!1123901 () Bool)

(assert (=> b!1218822 m!1123901))

(check-sat tp_is_empty!30931 (not b!1218819) (not b!1218815) (not b!1218822) (not b!1218827) (not mapNonEmpty!48274) (not b_lambda!21935) (not b!1218812) (not b!1218821) (not b_next!26227) b_and!43593 (not b!1218823) (not b!1218818) (not b!1218826) (not b!1218816) (not b!1218824) (not start!101566))
(check-sat b_and!43593 (not b_next!26227))
(get-model)

(declare-fun b_lambda!21941 () Bool)

(assert (= b_lambda!21935 (or (and start!101566 b_free!26227) b_lambda!21941)))

(check-sat (not b_lambda!21941) tp_is_empty!30931 (not b!1218819) (not b!1218815) (not b!1218822) (not b!1218827) (not mapNonEmpty!48274) (not b!1218812) (not b!1218821) (not b_next!26227) b_and!43593 (not b!1218823) (not b!1218818) (not b!1218826) (not b!1218816) (not b!1218824) (not start!101566))
(check-sat b_and!43593 (not b_next!26227))
(get-model)

(declare-fun d!134031 () Bool)

(declare-fun res!809156 () Bool)

(declare-fun e!692128 () Bool)

(assert (=> d!134031 (=> res!809156 e!692128)))

(assert (=> d!134031 (= res!809156 (= (select (arr!37966 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!134031 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!692128)))

(declare-fun b!1218941 () Bool)

(declare-fun e!692129 () Bool)

(assert (=> b!1218941 (= e!692128 e!692129)))

(declare-fun res!809157 () Bool)

(assert (=> b!1218941 (=> (not res!809157) (not e!692129))))

(assert (=> b!1218941 (= res!809157 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38503 _keys!1208)))))

(declare-fun b!1218942 () Bool)

(assert (=> b!1218942 (= e!692129 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!134031 (not res!809156)) b!1218941))

(assert (= (and b!1218941 res!809157) b!1218942))

(declare-fun m!1124011 () Bool)

(assert (=> d!134031 m!1124011))

(declare-fun m!1124013 () Bool)

(assert (=> b!1218942 m!1124013))

(assert (=> b!1218818 d!134031))

(declare-fun d!134033 () Bool)

(assert (=> d!134033 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!553950 () Unit!40338)

(declare-fun choose!13 (array!78677 (_ BitVec 64) (_ BitVec 32)) Unit!40338)

(assert (=> d!134033 (= lt!553950 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!134033 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!134033 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!553950)))

(declare-fun bs!34332 () Bool)

(assert (= bs!34332 d!134033))

(assert (=> bs!34332 m!1123861))

(declare-fun m!1124015 () Bool)

(assert (=> bs!34332 m!1124015))

(assert (=> b!1218818 d!134033))

(declare-fun d!134035 () Bool)

(declare-fun e!692132 () Bool)

(assert (=> d!134035 e!692132))

(declare-fun res!809162 () Bool)

(assert (=> d!134035 (=> (not res!809162) (not e!692132))))

(declare-fun lt!553960 () ListLongMap!17951)

(declare-fun contains!7043 (ListLongMap!17951 (_ BitVec 64)) Bool)

(assert (=> d!134035 (= res!809162 (contains!7043 lt!553960 (_1!9998 (tuple2!19975 (select (arr!37966 _keys!1208) from!1455) (get!19386 (select (arr!37967 _values!996) from!1455) lt!553881)))))))

(declare-fun lt!553961 () List!26783)

(assert (=> d!134035 (= lt!553960 (ListLongMap!17952 lt!553961))))

(declare-fun lt!553959 () Unit!40338)

(declare-fun lt!553962 () Unit!40338)

(assert (=> d!134035 (= lt!553959 lt!553962)))

(declare-datatypes ((Option!689 0))(
  ( (Some!688 (v!18175 V!46369)) (None!687) )
))
(declare-fun getValueByKey!638 (List!26783 (_ BitVec 64)) Option!689)

(assert (=> d!134035 (= (getValueByKey!638 lt!553961 (_1!9998 (tuple2!19975 (select (arr!37966 _keys!1208) from!1455) (get!19386 (select (arr!37967 _values!996) from!1455) lt!553881)))) (Some!688 (_2!9998 (tuple2!19975 (select (arr!37966 _keys!1208) from!1455) (get!19386 (select (arr!37967 _values!996) from!1455) lt!553881)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!320 (List!26783 (_ BitVec 64) V!46369) Unit!40338)

(assert (=> d!134035 (= lt!553962 (lemmaContainsTupThenGetReturnValue!320 lt!553961 (_1!9998 (tuple2!19975 (select (arr!37966 _keys!1208) from!1455) (get!19386 (select (arr!37967 _values!996) from!1455) lt!553881))) (_2!9998 (tuple2!19975 (select (arr!37966 _keys!1208) from!1455) (get!19386 (select (arr!37967 _values!996) from!1455) lt!553881)))))))

(declare-fun insertStrictlySorted!413 (List!26783 (_ BitVec 64) V!46369) List!26783)

(assert (=> d!134035 (= lt!553961 (insertStrictlySorted!413 (toList!8991 lt!553884) (_1!9998 (tuple2!19975 (select (arr!37966 _keys!1208) from!1455) (get!19386 (select (arr!37967 _values!996) from!1455) lt!553881))) (_2!9998 (tuple2!19975 (select (arr!37966 _keys!1208) from!1455) (get!19386 (select (arr!37967 _values!996) from!1455) lt!553881)))))))

(assert (=> d!134035 (= (+!4104 lt!553884 (tuple2!19975 (select (arr!37966 _keys!1208) from!1455) (get!19386 (select (arr!37967 _values!996) from!1455) lt!553881))) lt!553960)))

(declare-fun b!1218947 () Bool)

(declare-fun res!809163 () Bool)

(assert (=> b!1218947 (=> (not res!809163) (not e!692132))))

(assert (=> b!1218947 (= res!809163 (= (getValueByKey!638 (toList!8991 lt!553960) (_1!9998 (tuple2!19975 (select (arr!37966 _keys!1208) from!1455) (get!19386 (select (arr!37967 _values!996) from!1455) lt!553881)))) (Some!688 (_2!9998 (tuple2!19975 (select (arr!37966 _keys!1208) from!1455) (get!19386 (select (arr!37967 _values!996) from!1455) lt!553881))))))))

(declare-fun b!1218948 () Bool)

(declare-fun contains!7044 (List!26783 tuple2!19974) Bool)

(assert (=> b!1218948 (= e!692132 (contains!7044 (toList!8991 lt!553960) (tuple2!19975 (select (arr!37966 _keys!1208) from!1455) (get!19386 (select (arr!37967 _values!996) from!1455) lt!553881))))))

(assert (= (and d!134035 res!809162) b!1218947))

(assert (= (and b!1218947 res!809163) b!1218948))

(declare-fun m!1124017 () Bool)

(assert (=> d!134035 m!1124017))

(declare-fun m!1124019 () Bool)

(assert (=> d!134035 m!1124019))

(declare-fun m!1124021 () Bool)

(assert (=> d!134035 m!1124021))

(declare-fun m!1124023 () Bool)

(assert (=> d!134035 m!1124023))

(declare-fun m!1124025 () Bool)

(assert (=> b!1218947 m!1124025))

(declare-fun m!1124027 () Bool)

(assert (=> b!1218948 m!1124027))

(assert (=> b!1218819 d!134035))

(declare-fun d!134037 () Bool)

(declare-fun c!120487 () Bool)

(assert (=> d!134037 (= c!120487 ((_ is ValueCellFull!14756) (select (arr!37967 _values!996) from!1455)))))

(declare-fun e!692135 () V!46369)

(assert (=> d!134037 (= (get!19386 (select (arr!37967 _values!996) from!1455) lt!553881) e!692135)))

(declare-fun b!1218953 () Bool)

(declare-fun get!19388 (ValueCell!14756 V!46369) V!46369)

(assert (=> b!1218953 (= e!692135 (get!19388 (select (arr!37967 _values!996) from!1455) lt!553881))))

(declare-fun b!1218954 () Bool)

(declare-fun get!19389 (ValueCell!14756 V!46369) V!46369)

(assert (=> b!1218954 (= e!692135 (get!19389 (select (arr!37967 _values!996) from!1455) lt!553881))))

(assert (= (and d!134037 c!120487) b!1218953))

(assert (= (and d!134037 (not c!120487)) b!1218954))

(assert (=> b!1218953 m!1123855))

(declare-fun m!1124029 () Bool)

(assert (=> b!1218953 m!1124029))

(assert (=> b!1218954 m!1123855))

(declare-fun m!1124031 () Bool)

(assert (=> b!1218954 m!1124031))

(assert (=> b!1218819 d!134037))

(declare-fun b!1218979 () Bool)

(declare-fun lt!553979 () Unit!40338)

(declare-fun lt!553982 () Unit!40338)

(assert (=> b!1218979 (= lt!553979 lt!553982)))

(declare-fun lt!553978 () V!46369)

(declare-fun lt!553980 () ListLongMap!17951)

(declare-fun lt!553983 () (_ BitVec 64))

(declare-fun lt!553977 () (_ BitVec 64))

(assert (=> b!1218979 (not (contains!7043 (+!4104 lt!553980 (tuple2!19975 lt!553977 lt!553978)) lt!553983))))

(declare-fun addStillNotContains!301 (ListLongMap!17951 (_ BitVec 64) V!46369 (_ BitVec 64)) Unit!40338)

(assert (=> b!1218979 (= lt!553982 (addStillNotContains!301 lt!553980 lt!553977 lt!553978 lt!553983))))

(assert (=> b!1218979 (= lt!553983 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1218979 (= lt!553978 (get!19386 (select (arr!37967 lt!553883) from!1455) (dynLambda!3354 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1218979 (= lt!553977 (select (arr!37966 lt!553887) from!1455))))

(declare-fun call!60694 () ListLongMap!17951)

(assert (=> b!1218979 (= lt!553980 call!60694)))

(declare-fun e!692154 () ListLongMap!17951)

(assert (=> b!1218979 (= e!692154 (+!4104 call!60694 (tuple2!19975 (select (arr!37966 lt!553887) from!1455) (get!19386 (select (arr!37967 lt!553883) from!1455) (dynLambda!3354 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!134039 () Bool)

(declare-fun e!692155 () Bool)

(assert (=> d!134039 e!692155))

(declare-fun res!809175 () Bool)

(assert (=> d!134039 (=> (not res!809175) (not e!692155))))

(declare-fun lt!553981 () ListLongMap!17951)

(assert (=> d!134039 (= res!809175 (not (contains!7043 lt!553981 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!692152 () ListLongMap!17951)

(assert (=> d!134039 (= lt!553981 e!692152)))

(declare-fun c!120496 () Bool)

(assert (=> d!134039 (= c!120496 (bvsge from!1455 (size!38503 lt!553887)))))

(assert (=> d!134039 (validMask!0 mask!1564)))

(assert (=> d!134039 (= (getCurrentListMapNoExtraKeys!5448 lt!553887 lt!553883 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!553981)))

(declare-fun b!1218980 () Bool)

(assert (=> b!1218980 (= e!692154 call!60694)))

(declare-fun b!1218981 () Bool)

(assert (=> b!1218981 (= e!692152 e!692154)))

(declare-fun c!120497 () Bool)

(assert (=> b!1218981 (= c!120497 (validKeyInArray!0 (select (arr!37966 lt!553887) from!1455)))))

(declare-fun b!1218982 () Bool)

(assert (=> b!1218982 (= e!692152 (ListLongMap!17952 Nil!26780))))

(declare-fun b!1218983 () Bool)

(declare-fun e!692156 () Bool)

(assert (=> b!1218983 (= e!692155 e!692156)))

(declare-fun c!120499 () Bool)

(declare-fun e!692151 () Bool)

(assert (=> b!1218983 (= c!120499 e!692151)))

(declare-fun res!809173 () Bool)

(assert (=> b!1218983 (=> (not res!809173) (not e!692151))))

(assert (=> b!1218983 (= res!809173 (bvslt from!1455 (size!38503 lt!553887)))))

(declare-fun b!1218984 () Bool)

(declare-fun e!692150 () Bool)

(declare-fun isEmpty!999 (ListLongMap!17951) Bool)

(assert (=> b!1218984 (= e!692150 (isEmpty!999 lt!553981))))

(declare-fun b!1218985 () Bool)

(assert (=> b!1218985 (= e!692150 (= lt!553981 (getCurrentListMapNoExtraKeys!5448 lt!553887 lt!553883 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1218986 () Bool)

(declare-fun e!692153 () Bool)

(assert (=> b!1218986 (= e!692156 e!692153)))

(assert (=> b!1218986 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38503 lt!553887)))))

(declare-fun res!809172 () Bool)

(assert (=> b!1218986 (= res!809172 (contains!7043 lt!553981 (select (arr!37966 lt!553887) from!1455)))))

(assert (=> b!1218986 (=> (not res!809172) (not e!692153))))

(declare-fun b!1218987 () Bool)

(declare-fun res!809174 () Bool)

(assert (=> b!1218987 (=> (not res!809174) (not e!692155))))

(assert (=> b!1218987 (= res!809174 (not (contains!7043 lt!553981 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1218988 () Bool)

(assert (=> b!1218988 (= e!692156 e!692150)))

(declare-fun c!120498 () Bool)

(assert (=> b!1218988 (= c!120498 (bvslt from!1455 (size!38503 lt!553887)))))

(declare-fun b!1218989 () Bool)

(assert (=> b!1218989 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38503 lt!553887)))))

(assert (=> b!1218989 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38504 lt!553883)))))

(declare-fun apply!980 (ListLongMap!17951 (_ BitVec 64)) V!46369)

(assert (=> b!1218989 (= e!692153 (= (apply!980 lt!553981 (select (arr!37966 lt!553887) from!1455)) (get!19386 (select (arr!37967 lt!553883) from!1455) (dynLambda!3354 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1218990 () Bool)

(assert (=> b!1218990 (= e!692151 (validKeyInArray!0 (select (arr!37966 lt!553887) from!1455)))))

(assert (=> b!1218990 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun bm!60691 () Bool)

(assert (=> bm!60691 (= call!60694 (getCurrentListMapNoExtraKeys!5448 lt!553887 lt!553883 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(assert (= (and d!134039 c!120496) b!1218982))

(assert (= (and d!134039 (not c!120496)) b!1218981))

(assert (= (and b!1218981 c!120497) b!1218979))

(assert (= (and b!1218981 (not c!120497)) b!1218980))

(assert (= (or b!1218979 b!1218980) bm!60691))

(assert (= (and d!134039 res!809175) b!1218987))

(assert (= (and b!1218987 res!809174) b!1218983))

(assert (= (and b!1218983 res!809173) b!1218990))

(assert (= (and b!1218983 c!120499) b!1218986))

(assert (= (and b!1218983 (not c!120499)) b!1218988))

(assert (= (and b!1218986 res!809172) b!1218989))

(assert (= (and b!1218988 c!120498) b!1218985))

(assert (= (and b!1218988 (not c!120498)) b!1218984))

(declare-fun b_lambda!21943 () Bool)

(assert (=> (not b_lambda!21943) (not b!1218979)))

(assert (=> b!1218979 t!39981))

(declare-fun b_and!43603 () Bool)

(assert (= b_and!43593 (and (=> t!39981 result!22645) b_and!43603)))

(declare-fun b_lambda!21945 () Bool)

(assert (=> (not b_lambda!21945) (not b!1218989)))

(assert (=> b!1218989 t!39981))

(declare-fun b_and!43605 () Bool)

(assert (= b_and!43603 (and (=> t!39981 result!22645) b_and!43605)))

(declare-fun m!1124033 () Bool)

(assert (=> b!1218986 m!1124033))

(assert (=> b!1218986 m!1124033))

(declare-fun m!1124035 () Bool)

(assert (=> b!1218986 m!1124035))

(assert (=> b!1218981 m!1124033))

(assert (=> b!1218981 m!1124033))

(declare-fun m!1124037 () Bool)

(assert (=> b!1218981 m!1124037))

(declare-fun m!1124039 () Bool)

(assert (=> b!1218987 m!1124039))

(assert (=> b!1218989 m!1124033))

(declare-fun m!1124041 () Bool)

(assert (=> b!1218989 m!1124041))

(declare-fun m!1124043 () Bool)

(assert (=> b!1218989 m!1124043))

(assert (=> b!1218989 m!1124033))

(assert (=> b!1218989 m!1124043))

(assert (=> b!1218989 m!1123881))

(declare-fun m!1124045 () Bool)

(assert (=> b!1218989 m!1124045))

(assert (=> b!1218989 m!1123881))

(assert (=> b!1218990 m!1124033))

(assert (=> b!1218990 m!1124033))

(assert (=> b!1218990 m!1124037))

(declare-fun m!1124047 () Bool)

(assert (=> d!134039 m!1124047))

(assert (=> d!134039 m!1123889))

(declare-fun m!1124049 () Bool)

(assert (=> b!1218985 m!1124049))

(declare-fun m!1124051 () Bool)

(assert (=> b!1218984 m!1124051))

(declare-fun m!1124053 () Bool)

(assert (=> b!1218979 m!1124053))

(declare-fun m!1124055 () Bool)

(assert (=> b!1218979 m!1124055))

(assert (=> b!1218979 m!1124043))

(assert (=> b!1218979 m!1124033))

(assert (=> b!1218979 m!1124043))

(assert (=> b!1218979 m!1123881))

(assert (=> b!1218979 m!1124045))

(declare-fun m!1124057 () Bool)

(assert (=> b!1218979 m!1124057))

(assert (=> b!1218979 m!1124053))

(declare-fun m!1124059 () Bool)

(assert (=> b!1218979 m!1124059))

(assert (=> b!1218979 m!1123881))

(assert (=> bm!60691 m!1124049))

(assert (=> b!1218821 d!134039))

(declare-fun b!1218991 () Bool)

(declare-fun lt!553986 () Unit!40338)

(declare-fun lt!553989 () Unit!40338)

(assert (=> b!1218991 (= lt!553986 lt!553989)))

(declare-fun lt!553985 () V!46369)

(declare-fun lt!553984 () (_ BitVec 64))

(declare-fun lt!553990 () (_ BitVec 64))

(declare-fun lt!553987 () ListLongMap!17951)

(assert (=> b!1218991 (not (contains!7043 (+!4104 lt!553987 (tuple2!19975 lt!553984 lt!553985)) lt!553990))))

(assert (=> b!1218991 (= lt!553989 (addStillNotContains!301 lt!553987 lt!553984 lt!553985 lt!553990))))

(assert (=> b!1218991 (= lt!553990 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1218991 (= lt!553985 (get!19386 (select (arr!37967 _values!996) from!1455) (dynLambda!3354 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1218991 (= lt!553984 (select (arr!37966 _keys!1208) from!1455))))

(declare-fun call!60695 () ListLongMap!17951)

(assert (=> b!1218991 (= lt!553987 call!60695)))

(declare-fun e!692161 () ListLongMap!17951)

(assert (=> b!1218991 (= e!692161 (+!4104 call!60695 (tuple2!19975 (select (arr!37966 _keys!1208) from!1455) (get!19386 (select (arr!37967 _values!996) from!1455) (dynLambda!3354 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!134041 () Bool)

(declare-fun e!692162 () Bool)

(assert (=> d!134041 e!692162))

(declare-fun res!809179 () Bool)

(assert (=> d!134041 (=> (not res!809179) (not e!692162))))

(declare-fun lt!553988 () ListLongMap!17951)

(assert (=> d!134041 (= res!809179 (not (contains!7043 lt!553988 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!692159 () ListLongMap!17951)

(assert (=> d!134041 (= lt!553988 e!692159)))

(declare-fun c!120500 () Bool)

(assert (=> d!134041 (= c!120500 (bvsge from!1455 (size!38503 _keys!1208)))))

(assert (=> d!134041 (validMask!0 mask!1564)))

(assert (=> d!134041 (= (getCurrentListMapNoExtraKeys!5448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!553988)))

(declare-fun b!1218992 () Bool)

(assert (=> b!1218992 (= e!692161 call!60695)))

(declare-fun b!1218993 () Bool)

(assert (=> b!1218993 (= e!692159 e!692161)))

(declare-fun c!120501 () Bool)

(assert (=> b!1218993 (= c!120501 (validKeyInArray!0 (select (arr!37966 _keys!1208) from!1455)))))

(declare-fun b!1218994 () Bool)

(assert (=> b!1218994 (= e!692159 (ListLongMap!17952 Nil!26780))))

(declare-fun b!1218995 () Bool)

(declare-fun e!692163 () Bool)

(assert (=> b!1218995 (= e!692162 e!692163)))

(declare-fun c!120503 () Bool)

(declare-fun e!692158 () Bool)

(assert (=> b!1218995 (= c!120503 e!692158)))

(declare-fun res!809177 () Bool)

(assert (=> b!1218995 (=> (not res!809177) (not e!692158))))

(assert (=> b!1218995 (= res!809177 (bvslt from!1455 (size!38503 _keys!1208)))))

(declare-fun b!1218996 () Bool)

(declare-fun e!692157 () Bool)

(assert (=> b!1218996 (= e!692157 (isEmpty!999 lt!553988))))

(declare-fun b!1218997 () Bool)

(assert (=> b!1218997 (= e!692157 (= lt!553988 (getCurrentListMapNoExtraKeys!5448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1218998 () Bool)

(declare-fun e!692160 () Bool)

(assert (=> b!1218998 (= e!692163 e!692160)))

(assert (=> b!1218998 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38503 _keys!1208)))))

(declare-fun res!809176 () Bool)

(assert (=> b!1218998 (= res!809176 (contains!7043 lt!553988 (select (arr!37966 _keys!1208) from!1455)))))

(assert (=> b!1218998 (=> (not res!809176) (not e!692160))))

(declare-fun b!1218999 () Bool)

(declare-fun res!809178 () Bool)

(assert (=> b!1218999 (=> (not res!809178) (not e!692162))))

(assert (=> b!1218999 (= res!809178 (not (contains!7043 lt!553988 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1219000 () Bool)

(assert (=> b!1219000 (= e!692163 e!692157)))

(declare-fun c!120502 () Bool)

(assert (=> b!1219000 (= c!120502 (bvslt from!1455 (size!38503 _keys!1208)))))

(declare-fun b!1219001 () Bool)

(assert (=> b!1219001 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38503 _keys!1208)))))

(assert (=> b!1219001 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38504 _values!996)))))

(assert (=> b!1219001 (= e!692160 (= (apply!980 lt!553988 (select (arr!37966 _keys!1208) from!1455)) (get!19386 (select (arr!37967 _values!996) from!1455) (dynLambda!3354 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1219002 () Bool)

(assert (=> b!1219002 (= e!692158 (validKeyInArray!0 (select (arr!37966 _keys!1208) from!1455)))))

(assert (=> b!1219002 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun bm!60692 () Bool)

(assert (=> bm!60692 (= call!60695 (getCurrentListMapNoExtraKeys!5448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(assert (= (and d!134041 c!120500) b!1218994))

(assert (= (and d!134041 (not c!120500)) b!1218993))

(assert (= (and b!1218993 c!120501) b!1218991))

(assert (= (and b!1218993 (not c!120501)) b!1218992))

(assert (= (or b!1218991 b!1218992) bm!60692))

(assert (= (and d!134041 res!809179) b!1218999))

(assert (= (and b!1218999 res!809178) b!1218995))

(assert (= (and b!1218995 res!809177) b!1219002))

(assert (= (and b!1218995 c!120503) b!1218998))

(assert (= (and b!1218995 (not c!120503)) b!1219000))

(assert (= (and b!1218998 res!809176) b!1219001))

(assert (= (and b!1219000 c!120502) b!1218997))

(assert (= (and b!1219000 (not c!120502)) b!1218996))

(declare-fun b_lambda!21947 () Bool)

(assert (=> (not b_lambda!21947) (not b!1218991)))

(assert (=> b!1218991 t!39981))

(declare-fun b_and!43607 () Bool)

(assert (= b_and!43605 (and (=> t!39981 result!22645) b_and!43607)))

(declare-fun b_lambda!21949 () Bool)

(assert (=> (not b_lambda!21949) (not b!1219001)))

(assert (=> b!1219001 t!39981))

(declare-fun b_and!43609 () Bool)

(assert (= b_and!43607 (and (=> t!39981 result!22645) b_and!43609)))

(assert (=> b!1218998 m!1123853))

(assert (=> b!1218998 m!1123853))

(declare-fun m!1124061 () Bool)

(assert (=> b!1218998 m!1124061))

(assert (=> b!1218993 m!1123853))

(assert (=> b!1218993 m!1123853))

(assert (=> b!1218993 m!1123875))

(declare-fun m!1124063 () Bool)

(assert (=> b!1218999 m!1124063))

(assert (=> b!1219001 m!1123853))

(declare-fun m!1124065 () Bool)

(assert (=> b!1219001 m!1124065))

(assert (=> b!1219001 m!1123855))

(assert (=> b!1219001 m!1123853))

(assert (=> b!1219001 m!1123855))

(assert (=> b!1219001 m!1123881))

(declare-fun m!1124067 () Bool)

(assert (=> b!1219001 m!1124067))

(assert (=> b!1219001 m!1123881))

(assert (=> b!1219002 m!1123853))

(assert (=> b!1219002 m!1123853))

(assert (=> b!1219002 m!1123875))

(declare-fun m!1124069 () Bool)

(assert (=> d!134041 m!1124069))

(assert (=> d!134041 m!1123889))

(declare-fun m!1124071 () Bool)

(assert (=> b!1218997 m!1124071))

(declare-fun m!1124073 () Bool)

(assert (=> b!1218996 m!1124073))

(declare-fun m!1124075 () Bool)

(assert (=> b!1218991 m!1124075))

(declare-fun m!1124077 () Bool)

(assert (=> b!1218991 m!1124077))

(assert (=> b!1218991 m!1123855))

(assert (=> b!1218991 m!1123853))

(assert (=> b!1218991 m!1123855))

(assert (=> b!1218991 m!1123881))

(assert (=> b!1218991 m!1124067))

(declare-fun m!1124079 () Bool)

(assert (=> b!1218991 m!1124079))

(assert (=> b!1218991 m!1124075))

(declare-fun m!1124081 () Bool)

(assert (=> b!1218991 m!1124081))

(assert (=> b!1218991 m!1123881))

(assert (=> bm!60692 m!1124071))

(assert (=> b!1218821 d!134041))

(declare-fun d!134043 () Bool)

(declare-fun res!809184 () Bool)

(declare-fun e!692170 () Bool)

(assert (=> d!134043 (=> res!809184 e!692170)))

(assert (=> d!134043 (= res!809184 (bvsge #b00000000000000000000000000000000 (size!38503 lt!553887)))))

(assert (=> d!134043 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553887 mask!1564) e!692170)))

(declare-fun b!1219011 () Bool)

(declare-fun e!692171 () Bool)

(declare-fun call!60698 () Bool)

(assert (=> b!1219011 (= e!692171 call!60698)))

(declare-fun b!1219012 () Bool)

(declare-fun e!692172 () Bool)

(assert (=> b!1219012 (= e!692171 e!692172)))

(declare-fun lt!553998 () (_ BitVec 64))

(assert (=> b!1219012 (= lt!553998 (select (arr!37966 lt!553887) #b00000000000000000000000000000000))))

(declare-fun lt!553997 () Unit!40338)

(assert (=> b!1219012 (= lt!553997 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!553887 lt!553998 #b00000000000000000000000000000000))))

(assert (=> b!1219012 (arrayContainsKey!0 lt!553887 lt!553998 #b00000000000000000000000000000000)))

(declare-fun lt!553999 () Unit!40338)

(assert (=> b!1219012 (= lt!553999 lt!553997)))

(declare-fun res!809185 () Bool)

(declare-datatypes ((SeekEntryResult!9900 0))(
  ( (MissingZero!9900 (index!41971 (_ BitVec 32))) (Found!9900 (index!41972 (_ BitVec 32))) (Intermediate!9900 (undefined!10712 Bool) (index!41973 (_ BitVec 32)) (x!107250 (_ BitVec 32))) (Undefined!9900) (MissingVacant!9900 (index!41974 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78677 (_ BitVec 32)) SeekEntryResult!9900)

(assert (=> b!1219012 (= res!809185 (= (seekEntryOrOpen!0 (select (arr!37966 lt!553887) #b00000000000000000000000000000000) lt!553887 mask!1564) (Found!9900 #b00000000000000000000000000000000)))))

(assert (=> b!1219012 (=> (not res!809185) (not e!692172))))

(declare-fun b!1219013 () Bool)

(assert (=> b!1219013 (= e!692170 e!692171)))

(declare-fun c!120506 () Bool)

(assert (=> b!1219013 (= c!120506 (validKeyInArray!0 (select (arr!37966 lt!553887) #b00000000000000000000000000000000)))))

(declare-fun b!1219014 () Bool)

(assert (=> b!1219014 (= e!692172 call!60698)))

(declare-fun bm!60695 () Bool)

(assert (=> bm!60695 (= call!60698 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!553887 mask!1564))))

(assert (= (and d!134043 (not res!809184)) b!1219013))

(assert (= (and b!1219013 c!120506) b!1219012))

(assert (= (and b!1219013 (not c!120506)) b!1219011))

(assert (= (and b!1219012 res!809185) b!1219014))

(assert (= (or b!1219014 b!1219011) bm!60695))

(declare-fun m!1124083 () Bool)

(assert (=> b!1219012 m!1124083))

(declare-fun m!1124085 () Bool)

(assert (=> b!1219012 m!1124085))

(declare-fun m!1124087 () Bool)

(assert (=> b!1219012 m!1124087))

(assert (=> b!1219012 m!1124083))

(declare-fun m!1124089 () Bool)

(assert (=> b!1219012 m!1124089))

(assert (=> b!1219013 m!1124083))

(assert (=> b!1219013 m!1124083))

(declare-fun m!1124091 () Bool)

(assert (=> b!1219013 m!1124091))

(declare-fun m!1124093 () Bool)

(assert (=> bm!60695 m!1124093))

(assert (=> b!1218822 d!134043))

(declare-fun d!134045 () Bool)

(assert (=> d!134045 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1218812 d!134045))

(declare-fun b!1219025 () Bool)

(declare-fun e!692182 () Bool)

(declare-fun call!60701 () Bool)

(assert (=> b!1219025 (= e!692182 call!60701)))

(declare-fun b!1219026 () Bool)

(assert (=> b!1219026 (= e!692182 call!60701)))

(declare-fun bm!60698 () Bool)

(declare-fun c!120509 () Bool)

(assert (=> bm!60698 (= call!60701 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120509 (Cons!26780 (select (arr!37966 _keys!1208) #b00000000000000000000000000000000) Nil!26781) Nil!26781)))))

(declare-fun b!1219027 () Bool)

(declare-fun e!692184 () Bool)

(declare-fun contains!7045 (List!26784 (_ BitVec 64)) Bool)

(assert (=> b!1219027 (= e!692184 (contains!7045 Nil!26781 (select (arr!37966 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!134047 () Bool)

(declare-fun res!809194 () Bool)

(declare-fun e!692181 () Bool)

(assert (=> d!134047 (=> res!809194 e!692181)))

(assert (=> d!134047 (= res!809194 (bvsge #b00000000000000000000000000000000 (size!38503 _keys!1208)))))

(assert (=> d!134047 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26781) e!692181)))

(declare-fun b!1219028 () Bool)

(declare-fun e!692183 () Bool)

(assert (=> b!1219028 (= e!692181 e!692183)))

(declare-fun res!809193 () Bool)

(assert (=> b!1219028 (=> (not res!809193) (not e!692183))))

(assert (=> b!1219028 (= res!809193 (not e!692184))))

(declare-fun res!809192 () Bool)

(assert (=> b!1219028 (=> (not res!809192) (not e!692184))))

(assert (=> b!1219028 (= res!809192 (validKeyInArray!0 (select (arr!37966 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1219029 () Bool)

(assert (=> b!1219029 (= e!692183 e!692182)))

(assert (=> b!1219029 (= c!120509 (validKeyInArray!0 (select (arr!37966 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!134047 (not res!809194)) b!1219028))

(assert (= (and b!1219028 res!809192) b!1219027))

(assert (= (and b!1219028 res!809193) b!1219029))

(assert (= (and b!1219029 c!120509) b!1219026))

(assert (= (and b!1219029 (not c!120509)) b!1219025))

(assert (= (or b!1219026 b!1219025) bm!60698))

(assert (=> bm!60698 m!1124011))

(declare-fun m!1124095 () Bool)

(assert (=> bm!60698 m!1124095))

(assert (=> b!1219027 m!1124011))

(assert (=> b!1219027 m!1124011))

(declare-fun m!1124097 () Bool)

(assert (=> b!1219027 m!1124097))

(assert (=> b!1219028 m!1124011))

(assert (=> b!1219028 m!1124011))

(declare-fun m!1124099 () Bool)

(assert (=> b!1219028 m!1124099))

(assert (=> b!1219029 m!1124011))

(assert (=> b!1219029 m!1124011))

(assert (=> b!1219029 m!1124099))

(assert (=> b!1218823 d!134047))

(declare-fun d!134049 () Bool)

(declare-fun res!809195 () Bool)

(declare-fun e!692185 () Bool)

(assert (=> d!134049 (=> res!809195 e!692185)))

(assert (=> d!134049 (= res!809195 (= (select (arr!37966 _keys!1208) i!673) k0!934))))

(assert (=> d!134049 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!692185)))

(declare-fun b!1219030 () Bool)

(declare-fun e!692186 () Bool)

(assert (=> b!1219030 (= e!692185 e!692186)))

(declare-fun res!809196 () Bool)

(assert (=> b!1219030 (=> (not res!809196) (not e!692186))))

(assert (=> b!1219030 (= res!809196 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!38503 _keys!1208)))))

(declare-fun b!1219031 () Bool)

(assert (=> b!1219031 (= e!692186 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!134049 (not res!809195)) b!1219030))

(assert (= (and b!1219030 res!809196) b!1219031))

(assert (=> d!134049 m!1123887))

(declare-fun m!1124101 () Bool)

(assert (=> b!1219031 m!1124101))

(assert (=> b!1218824 d!134049))

(declare-fun d!134051 () Bool)

(assert (=> d!134051 (= (array_inv!28964 _keys!1208) (bvsge (size!38503 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101566 d!134051))

(declare-fun d!134053 () Bool)

(assert (=> d!134053 (= (array_inv!28965 _values!996) (bvsge (size!38504 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101566 d!134053))

(declare-fun d!134055 () Bool)

(declare-fun res!809197 () Bool)

(declare-fun e!692187 () Bool)

(assert (=> d!134055 (=> res!809197 e!692187)))

(assert (=> d!134055 (= res!809197 (bvsge #b00000000000000000000000000000000 (size!38503 _keys!1208)))))

(assert (=> d!134055 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!692187)))

(declare-fun b!1219032 () Bool)

(declare-fun e!692188 () Bool)

(declare-fun call!60702 () Bool)

(assert (=> b!1219032 (= e!692188 call!60702)))

(declare-fun b!1219033 () Bool)

(declare-fun e!692189 () Bool)

(assert (=> b!1219033 (= e!692188 e!692189)))

(declare-fun lt!554001 () (_ BitVec 64))

(assert (=> b!1219033 (= lt!554001 (select (arr!37966 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!554000 () Unit!40338)

(assert (=> b!1219033 (= lt!554000 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!554001 #b00000000000000000000000000000000))))

(assert (=> b!1219033 (arrayContainsKey!0 _keys!1208 lt!554001 #b00000000000000000000000000000000)))

(declare-fun lt!554002 () Unit!40338)

(assert (=> b!1219033 (= lt!554002 lt!554000)))

(declare-fun res!809198 () Bool)

(assert (=> b!1219033 (= res!809198 (= (seekEntryOrOpen!0 (select (arr!37966 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9900 #b00000000000000000000000000000000)))))

(assert (=> b!1219033 (=> (not res!809198) (not e!692189))))

(declare-fun b!1219034 () Bool)

(assert (=> b!1219034 (= e!692187 e!692188)))

(declare-fun c!120510 () Bool)

(assert (=> b!1219034 (= c!120510 (validKeyInArray!0 (select (arr!37966 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1219035 () Bool)

(assert (=> b!1219035 (= e!692189 call!60702)))

(declare-fun bm!60699 () Bool)

(assert (=> bm!60699 (= call!60702 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(assert (= (and d!134055 (not res!809197)) b!1219034))

(assert (= (and b!1219034 c!120510) b!1219033))

(assert (= (and b!1219034 (not c!120510)) b!1219032))

(assert (= (and b!1219033 res!809198) b!1219035))

(assert (= (or b!1219035 b!1219032) bm!60699))

(assert (=> b!1219033 m!1124011))

(declare-fun m!1124103 () Bool)

(assert (=> b!1219033 m!1124103))

(declare-fun m!1124105 () Bool)

(assert (=> b!1219033 m!1124105))

(assert (=> b!1219033 m!1124011))

(declare-fun m!1124107 () Bool)

(assert (=> b!1219033 m!1124107))

(assert (=> b!1219034 m!1124011))

(assert (=> b!1219034 m!1124011))

(assert (=> b!1219034 m!1124099))

(declare-fun m!1124109 () Bool)

(assert (=> bm!60699 m!1124109))

(assert (=> b!1218815 d!134055))

(declare-fun d!134057 () Bool)

(assert (=> d!134057 (= (validKeyInArray!0 (select (arr!37966 _keys!1208) from!1455)) (and (not (= (select (arr!37966 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37966 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1218816 d!134057))

(declare-fun d!134059 () Bool)

(declare-fun lt!554005 () ListLongMap!17951)

(assert (=> d!134059 (not (contains!7043 lt!554005 k0!934))))

(declare-fun removeStrictlySorted!103 (List!26783 (_ BitVec 64)) List!26783)

(assert (=> d!134059 (= lt!554005 (ListLongMap!17952 (removeStrictlySorted!103 (toList!8991 lt!553885) k0!934)))))

(assert (=> d!134059 (= (-!1882 lt!553885 k0!934) lt!554005)))

(declare-fun bs!34333 () Bool)

(assert (= bs!34333 d!134059))

(declare-fun m!1124111 () Bool)

(assert (=> bs!34333 m!1124111))

(declare-fun m!1124113 () Bool)

(assert (=> bs!34333 m!1124113))

(assert (=> b!1218816 d!134059))

(declare-fun b!1219042 () Bool)

(declare-fun e!692195 () Bool)

(declare-fun call!60707 () ListLongMap!17951)

(declare-fun call!60708 () ListLongMap!17951)

(assert (=> b!1219042 (= e!692195 (= call!60707 call!60708))))

(assert (=> b!1219042 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38504 _values!996)))))

(declare-fun bm!60704 () Bool)

(assert (=> bm!60704 (= call!60707 (getCurrentListMapNoExtraKeys!5448 (array!78678 (store (arr!37966 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38503 _keys!1208)) (array!78680 (store (arr!37967 _values!996) i!673 (ValueCellFull!14756 (dynLambda!3354 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38504 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!60705 () Bool)

(assert (=> bm!60705 (= call!60708 (getCurrentListMapNoExtraKeys!5448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!134061 () Bool)

(declare-fun e!692194 () Bool)

(assert (=> d!134061 e!692194))

(declare-fun res!809201 () Bool)

(assert (=> d!134061 (=> (not res!809201) (not e!692194))))

(assert (=> d!134061 (= res!809201 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38503 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38503 _keys!1208))))))))

(declare-fun lt!554008 () Unit!40338)

(declare-fun choose!1827 (array!78677 array!78679 (_ BitVec 32) (_ BitVec 32) V!46369 V!46369 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40338)

(assert (=> d!134061 (= lt!554008 (choose!1827 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!134061 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38503 _keys!1208)))))

(assert (=> d!134061 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1097 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554008)))

(declare-fun b!1219043 () Bool)

(assert (=> b!1219043 (= e!692195 (= call!60707 (-!1882 call!60708 k0!934)))))

(assert (=> b!1219043 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38504 _values!996)))))

(declare-fun b!1219044 () Bool)

(assert (=> b!1219044 (= e!692194 e!692195)))

(declare-fun c!120513 () Bool)

(assert (=> b!1219044 (= c!120513 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(assert (= (and d!134061 res!809201) b!1219044))

(assert (= (and b!1219044 c!120513) b!1219043))

(assert (= (and b!1219044 (not c!120513)) b!1219042))

(assert (= (or b!1219043 b!1219042) bm!60705))

(assert (= (or b!1219043 b!1219042) bm!60704))

(declare-fun b_lambda!21951 () Bool)

(assert (=> (not b_lambda!21951) (not bm!60704)))

(assert (=> bm!60704 t!39981))

(declare-fun b_and!43611 () Bool)

(assert (= b_and!43609 (and (=> t!39981 result!22645) b_and!43611)))

(assert (=> bm!60704 m!1123901))

(assert (=> bm!60704 m!1123881))

(declare-fun m!1124115 () Bool)

(assert (=> bm!60704 m!1124115))

(declare-fun m!1124117 () Bool)

(assert (=> bm!60704 m!1124117))

(assert (=> bm!60705 m!1123867))

(declare-fun m!1124119 () Bool)

(assert (=> d!134061 m!1124119))

(declare-fun m!1124121 () Bool)

(assert (=> b!1219043 m!1124121))

(assert (=> b!1218816 d!134061))

(declare-fun b!1219045 () Bool)

(declare-fun lt!554011 () Unit!40338)

(declare-fun lt!554014 () Unit!40338)

(assert (=> b!1219045 (= lt!554011 lt!554014)))

(declare-fun lt!554009 () (_ BitVec 64))

(declare-fun lt!554010 () V!46369)

(declare-fun lt!554012 () ListLongMap!17951)

(declare-fun lt!554015 () (_ BitVec 64))

(assert (=> b!1219045 (not (contains!7043 (+!4104 lt!554012 (tuple2!19975 lt!554009 lt!554010)) lt!554015))))

(assert (=> b!1219045 (= lt!554014 (addStillNotContains!301 lt!554012 lt!554009 lt!554010 lt!554015))))

(assert (=> b!1219045 (= lt!554015 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1219045 (= lt!554010 (get!19386 (select (arr!37967 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3354 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1219045 (= lt!554009 (select (arr!37966 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60709 () ListLongMap!17951)

(assert (=> b!1219045 (= lt!554012 call!60709)))

(declare-fun e!692200 () ListLongMap!17951)

(assert (=> b!1219045 (= e!692200 (+!4104 call!60709 (tuple2!19975 (select (arr!37966 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19386 (select (arr!37967 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3354 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!134063 () Bool)

(declare-fun e!692201 () Bool)

(assert (=> d!134063 e!692201))

(declare-fun res!809205 () Bool)

(assert (=> d!134063 (=> (not res!809205) (not e!692201))))

(declare-fun lt!554013 () ListLongMap!17951)

(assert (=> d!134063 (= res!809205 (not (contains!7043 lt!554013 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!692198 () ListLongMap!17951)

(assert (=> d!134063 (= lt!554013 e!692198)))

(declare-fun c!120514 () Bool)

(assert (=> d!134063 (= c!120514 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38503 _keys!1208)))))

(assert (=> d!134063 (validMask!0 mask!1564)))

(assert (=> d!134063 (= (getCurrentListMapNoExtraKeys!5448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554013)))

(declare-fun b!1219046 () Bool)

(assert (=> b!1219046 (= e!692200 call!60709)))

(declare-fun b!1219047 () Bool)

(assert (=> b!1219047 (= e!692198 e!692200)))

(declare-fun c!120515 () Bool)

(assert (=> b!1219047 (= c!120515 (validKeyInArray!0 (select (arr!37966 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1219048 () Bool)

(assert (=> b!1219048 (= e!692198 (ListLongMap!17952 Nil!26780))))

(declare-fun b!1219049 () Bool)

(declare-fun e!692202 () Bool)

(assert (=> b!1219049 (= e!692201 e!692202)))

(declare-fun c!120517 () Bool)

(declare-fun e!692197 () Bool)

(assert (=> b!1219049 (= c!120517 e!692197)))

(declare-fun res!809203 () Bool)

(assert (=> b!1219049 (=> (not res!809203) (not e!692197))))

(assert (=> b!1219049 (= res!809203 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38503 _keys!1208)))))

(declare-fun b!1219050 () Bool)

(declare-fun e!692196 () Bool)

(assert (=> b!1219050 (= e!692196 (isEmpty!999 lt!554013))))

(declare-fun b!1219051 () Bool)

(assert (=> b!1219051 (= e!692196 (= lt!554013 (getCurrentListMapNoExtraKeys!5448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1219052 () Bool)

(declare-fun e!692199 () Bool)

(assert (=> b!1219052 (= e!692202 e!692199)))

(assert (=> b!1219052 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38503 _keys!1208)))))

(declare-fun res!809202 () Bool)

(assert (=> b!1219052 (= res!809202 (contains!7043 lt!554013 (select (arr!37966 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1219052 (=> (not res!809202) (not e!692199))))

(declare-fun b!1219053 () Bool)

(declare-fun res!809204 () Bool)

(assert (=> b!1219053 (=> (not res!809204) (not e!692201))))

(assert (=> b!1219053 (= res!809204 (not (contains!7043 lt!554013 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1219054 () Bool)

(assert (=> b!1219054 (= e!692202 e!692196)))

(declare-fun c!120516 () Bool)

(assert (=> b!1219054 (= c!120516 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38503 _keys!1208)))))

(declare-fun b!1219055 () Bool)

(assert (=> b!1219055 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38503 _keys!1208)))))

(assert (=> b!1219055 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38504 _values!996)))))

(assert (=> b!1219055 (= e!692199 (= (apply!980 lt!554013 (select (arr!37966 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19386 (select (arr!37967 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3354 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1219056 () Bool)

(assert (=> b!1219056 (= e!692197 (validKeyInArray!0 (select (arr!37966 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1219056 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun bm!60706 () Bool)

(assert (=> bm!60706 (= call!60709 (getCurrentListMapNoExtraKeys!5448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(assert (= (and d!134063 c!120514) b!1219048))

(assert (= (and d!134063 (not c!120514)) b!1219047))

(assert (= (and b!1219047 c!120515) b!1219045))

(assert (= (and b!1219047 (not c!120515)) b!1219046))

(assert (= (or b!1219045 b!1219046) bm!60706))

(assert (= (and d!134063 res!809205) b!1219053))

(assert (= (and b!1219053 res!809204) b!1219049))

(assert (= (and b!1219049 res!809203) b!1219056))

(assert (= (and b!1219049 c!120517) b!1219052))

(assert (= (and b!1219049 (not c!120517)) b!1219054))

(assert (= (and b!1219052 res!809202) b!1219055))

(assert (= (and b!1219054 c!120516) b!1219051))

(assert (= (and b!1219054 (not c!120516)) b!1219050))

(declare-fun b_lambda!21953 () Bool)

(assert (=> (not b_lambda!21953) (not b!1219045)))

(assert (=> b!1219045 t!39981))

(declare-fun b_and!43613 () Bool)

(assert (= b_and!43611 (and (=> t!39981 result!22645) b_and!43613)))

(declare-fun b_lambda!21955 () Bool)

(assert (=> (not b_lambda!21955) (not b!1219055)))

(assert (=> b!1219055 t!39981))

(declare-fun b_and!43615 () Bool)

(assert (= b_and!43613 (and (=> t!39981 result!22645) b_and!43615)))

(declare-fun m!1124123 () Bool)

(assert (=> b!1219052 m!1124123))

(assert (=> b!1219052 m!1124123))

(declare-fun m!1124125 () Bool)

(assert (=> b!1219052 m!1124125))

(assert (=> b!1219047 m!1124123))

(assert (=> b!1219047 m!1124123))

(declare-fun m!1124127 () Bool)

(assert (=> b!1219047 m!1124127))

(declare-fun m!1124129 () Bool)

(assert (=> b!1219053 m!1124129))

(assert (=> b!1219055 m!1124123))

(declare-fun m!1124131 () Bool)

(assert (=> b!1219055 m!1124131))

(declare-fun m!1124133 () Bool)

(assert (=> b!1219055 m!1124133))

(assert (=> b!1219055 m!1124123))

(assert (=> b!1219055 m!1124133))

(assert (=> b!1219055 m!1123881))

(declare-fun m!1124135 () Bool)

(assert (=> b!1219055 m!1124135))

(assert (=> b!1219055 m!1123881))

(assert (=> b!1219056 m!1124123))

(assert (=> b!1219056 m!1124123))

(assert (=> b!1219056 m!1124127))

(declare-fun m!1124137 () Bool)

(assert (=> d!134063 m!1124137))

(assert (=> d!134063 m!1123889))

(declare-fun m!1124139 () Bool)

(assert (=> b!1219051 m!1124139))

(declare-fun m!1124141 () Bool)

(assert (=> b!1219050 m!1124141))

(declare-fun m!1124143 () Bool)

(assert (=> b!1219045 m!1124143))

(declare-fun m!1124145 () Bool)

(assert (=> b!1219045 m!1124145))

(assert (=> b!1219045 m!1124133))

(assert (=> b!1219045 m!1124123))

(assert (=> b!1219045 m!1124133))

(assert (=> b!1219045 m!1123881))

(assert (=> b!1219045 m!1124135))

(declare-fun m!1124147 () Bool)

(assert (=> b!1219045 m!1124147))

(assert (=> b!1219045 m!1124143))

(declare-fun m!1124149 () Bool)

(assert (=> b!1219045 m!1124149))

(assert (=> b!1219045 m!1123881))

(assert (=> bm!60706 m!1124139))

(assert (=> b!1218816 d!134063))

(declare-fun b!1219057 () Bool)

(declare-fun lt!554018 () Unit!40338)

(declare-fun lt!554021 () Unit!40338)

(assert (=> b!1219057 (= lt!554018 lt!554021)))

(declare-fun lt!554017 () V!46369)

(declare-fun lt!554019 () ListLongMap!17951)

(declare-fun lt!554022 () (_ BitVec 64))

(declare-fun lt!554016 () (_ BitVec 64))

(assert (=> b!1219057 (not (contains!7043 (+!4104 lt!554019 (tuple2!19975 lt!554016 lt!554017)) lt!554022))))

(assert (=> b!1219057 (= lt!554021 (addStillNotContains!301 lt!554019 lt!554016 lt!554017 lt!554022))))

(assert (=> b!1219057 (= lt!554022 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1219057 (= lt!554017 (get!19386 (select (arr!37967 lt!553883) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3354 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1219057 (= lt!554016 (select (arr!37966 lt!553887) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60710 () ListLongMap!17951)

(assert (=> b!1219057 (= lt!554019 call!60710)))

(declare-fun e!692207 () ListLongMap!17951)

(assert (=> b!1219057 (= e!692207 (+!4104 call!60710 (tuple2!19975 (select (arr!37966 lt!553887) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19386 (select (arr!37967 lt!553883) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3354 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!134065 () Bool)

(declare-fun e!692208 () Bool)

(assert (=> d!134065 e!692208))

(declare-fun res!809209 () Bool)

(assert (=> d!134065 (=> (not res!809209) (not e!692208))))

(declare-fun lt!554020 () ListLongMap!17951)

(assert (=> d!134065 (= res!809209 (not (contains!7043 lt!554020 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!692205 () ListLongMap!17951)

(assert (=> d!134065 (= lt!554020 e!692205)))

(declare-fun c!120518 () Bool)

(assert (=> d!134065 (= c!120518 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38503 lt!553887)))))

(assert (=> d!134065 (validMask!0 mask!1564)))

(assert (=> d!134065 (= (getCurrentListMapNoExtraKeys!5448 lt!553887 lt!553883 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554020)))

(declare-fun b!1219058 () Bool)

(assert (=> b!1219058 (= e!692207 call!60710)))

(declare-fun b!1219059 () Bool)

(assert (=> b!1219059 (= e!692205 e!692207)))

(declare-fun c!120519 () Bool)

(assert (=> b!1219059 (= c!120519 (validKeyInArray!0 (select (arr!37966 lt!553887) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1219060 () Bool)

(assert (=> b!1219060 (= e!692205 (ListLongMap!17952 Nil!26780))))

(declare-fun b!1219061 () Bool)

(declare-fun e!692209 () Bool)

(assert (=> b!1219061 (= e!692208 e!692209)))

(declare-fun c!120521 () Bool)

(declare-fun e!692204 () Bool)

(assert (=> b!1219061 (= c!120521 e!692204)))

(declare-fun res!809207 () Bool)

(assert (=> b!1219061 (=> (not res!809207) (not e!692204))))

(assert (=> b!1219061 (= res!809207 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38503 lt!553887)))))

(declare-fun b!1219062 () Bool)

(declare-fun e!692203 () Bool)

(assert (=> b!1219062 (= e!692203 (isEmpty!999 lt!554020))))

(declare-fun b!1219063 () Bool)

(assert (=> b!1219063 (= e!692203 (= lt!554020 (getCurrentListMapNoExtraKeys!5448 lt!553887 lt!553883 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1219064 () Bool)

(declare-fun e!692206 () Bool)

(assert (=> b!1219064 (= e!692209 e!692206)))

(assert (=> b!1219064 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38503 lt!553887)))))

(declare-fun res!809206 () Bool)

(assert (=> b!1219064 (= res!809206 (contains!7043 lt!554020 (select (arr!37966 lt!553887) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1219064 (=> (not res!809206) (not e!692206))))

(declare-fun b!1219065 () Bool)

(declare-fun res!809208 () Bool)

(assert (=> b!1219065 (=> (not res!809208) (not e!692208))))

(assert (=> b!1219065 (= res!809208 (not (contains!7043 lt!554020 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1219066 () Bool)

(assert (=> b!1219066 (= e!692209 e!692203)))

(declare-fun c!120520 () Bool)

(assert (=> b!1219066 (= c!120520 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38503 lt!553887)))))

(declare-fun b!1219067 () Bool)

(assert (=> b!1219067 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38503 lt!553887)))))

(assert (=> b!1219067 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38504 lt!553883)))))

(assert (=> b!1219067 (= e!692206 (= (apply!980 lt!554020 (select (arr!37966 lt!553887) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19386 (select (arr!37967 lt!553883) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3354 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1219068 () Bool)

(assert (=> b!1219068 (= e!692204 (validKeyInArray!0 (select (arr!37966 lt!553887) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1219068 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun bm!60707 () Bool)

(assert (=> bm!60707 (= call!60710 (getCurrentListMapNoExtraKeys!5448 lt!553887 lt!553883 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(assert (= (and d!134065 c!120518) b!1219060))

(assert (= (and d!134065 (not c!120518)) b!1219059))

(assert (= (and b!1219059 c!120519) b!1219057))

(assert (= (and b!1219059 (not c!120519)) b!1219058))

(assert (= (or b!1219057 b!1219058) bm!60707))

(assert (= (and d!134065 res!809209) b!1219065))

(assert (= (and b!1219065 res!809208) b!1219061))

(assert (= (and b!1219061 res!809207) b!1219068))

(assert (= (and b!1219061 c!120521) b!1219064))

(assert (= (and b!1219061 (not c!120521)) b!1219066))

(assert (= (and b!1219064 res!809206) b!1219067))

(assert (= (and b!1219066 c!120520) b!1219063))

(assert (= (and b!1219066 (not c!120520)) b!1219062))

(declare-fun b_lambda!21957 () Bool)

(assert (=> (not b_lambda!21957) (not b!1219057)))

(assert (=> b!1219057 t!39981))

(declare-fun b_and!43617 () Bool)

(assert (= b_and!43615 (and (=> t!39981 result!22645) b_and!43617)))

(declare-fun b_lambda!21959 () Bool)

(assert (=> (not b_lambda!21959) (not b!1219067)))

(assert (=> b!1219067 t!39981))

(declare-fun b_and!43619 () Bool)

(assert (= b_and!43617 (and (=> t!39981 result!22645) b_and!43619)))

(declare-fun m!1124151 () Bool)

(assert (=> b!1219064 m!1124151))

(assert (=> b!1219064 m!1124151))

(declare-fun m!1124153 () Bool)

(assert (=> b!1219064 m!1124153))

(assert (=> b!1219059 m!1124151))

(assert (=> b!1219059 m!1124151))

(declare-fun m!1124155 () Bool)

(assert (=> b!1219059 m!1124155))

(declare-fun m!1124157 () Bool)

(assert (=> b!1219065 m!1124157))

(assert (=> b!1219067 m!1124151))

(declare-fun m!1124159 () Bool)

(assert (=> b!1219067 m!1124159))

(declare-fun m!1124161 () Bool)

(assert (=> b!1219067 m!1124161))

(assert (=> b!1219067 m!1124151))

(assert (=> b!1219067 m!1124161))

(assert (=> b!1219067 m!1123881))

(declare-fun m!1124163 () Bool)

(assert (=> b!1219067 m!1124163))

(assert (=> b!1219067 m!1123881))

(assert (=> b!1219068 m!1124151))

(assert (=> b!1219068 m!1124151))

(assert (=> b!1219068 m!1124155))

(declare-fun m!1124165 () Bool)

(assert (=> d!134065 m!1124165))

(assert (=> d!134065 m!1123889))

(declare-fun m!1124167 () Bool)

(assert (=> b!1219063 m!1124167))

(declare-fun m!1124169 () Bool)

(assert (=> b!1219062 m!1124169))

(declare-fun m!1124171 () Bool)

(assert (=> b!1219057 m!1124171))

(declare-fun m!1124173 () Bool)

(assert (=> b!1219057 m!1124173))

(assert (=> b!1219057 m!1124161))

(assert (=> b!1219057 m!1124151))

(assert (=> b!1219057 m!1124161))

(assert (=> b!1219057 m!1123881))

(assert (=> b!1219057 m!1124163))

(declare-fun m!1124175 () Bool)

(assert (=> b!1219057 m!1124175))

(assert (=> b!1219057 m!1124171))

(declare-fun m!1124177 () Bool)

(assert (=> b!1219057 m!1124177))

(assert (=> b!1219057 m!1123881))

(assert (=> bm!60707 m!1124167))

(assert (=> b!1218816 d!134065))

(declare-fun b!1219069 () Bool)

(declare-fun e!692211 () Bool)

(declare-fun call!60711 () Bool)

(assert (=> b!1219069 (= e!692211 call!60711)))

(declare-fun b!1219070 () Bool)

(assert (=> b!1219070 (= e!692211 call!60711)))

(declare-fun bm!60708 () Bool)

(declare-fun c!120522 () Bool)

(assert (=> bm!60708 (= call!60711 (arrayNoDuplicates!0 lt!553887 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120522 (Cons!26780 (select (arr!37966 lt!553887) #b00000000000000000000000000000000) Nil!26781) Nil!26781)))))

(declare-fun b!1219071 () Bool)

(declare-fun e!692213 () Bool)

(assert (=> b!1219071 (= e!692213 (contains!7045 Nil!26781 (select (arr!37966 lt!553887) #b00000000000000000000000000000000)))))

(declare-fun d!134067 () Bool)

(declare-fun res!809212 () Bool)

(declare-fun e!692210 () Bool)

(assert (=> d!134067 (=> res!809212 e!692210)))

(assert (=> d!134067 (= res!809212 (bvsge #b00000000000000000000000000000000 (size!38503 lt!553887)))))

(assert (=> d!134067 (= (arrayNoDuplicates!0 lt!553887 #b00000000000000000000000000000000 Nil!26781) e!692210)))

(declare-fun b!1219072 () Bool)

(declare-fun e!692212 () Bool)

(assert (=> b!1219072 (= e!692210 e!692212)))

(declare-fun res!809211 () Bool)

(assert (=> b!1219072 (=> (not res!809211) (not e!692212))))

(assert (=> b!1219072 (= res!809211 (not e!692213))))

(declare-fun res!809210 () Bool)

(assert (=> b!1219072 (=> (not res!809210) (not e!692213))))

(assert (=> b!1219072 (= res!809210 (validKeyInArray!0 (select (arr!37966 lt!553887) #b00000000000000000000000000000000)))))

(declare-fun b!1219073 () Bool)

(assert (=> b!1219073 (= e!692212 e!692211)))

(assert (=> b!1219073 (= c!120522 (validKeyInArray!0 (select (arr!37966 lt!553887) #b00000000000000000000000000000000)))))

(assert (= (and d!134067 (not res!809212)) b!1219072))

(assert (= (and b!1219072 res!809210) b!1219071))

(assert (= (and b!1219072 res!809211) b!1219073))

(assert (= (and b!1219073 c!120522) b!1219070))

(assert (= (and b!1219073 (not c!120522)) b!1219069))

(assert (= (or b!1219070 b!1219069) bm!60708))

(assert (=> bm!60708 m!1124083))

(declare-fun m!1124179 () Bool)

(assert (=> bm!60708 m!1124179))

(assert (=> b!1219071 m!1124083))

(assert (=> b!1219071 m!1124083))

(declare-fun m!1124181 () Bool)

(assert (=> b!1219071 m!1124181))

(assert (=> b!1219072 m!1124083))

(assert (=> b!1219072 m!1124083))

(assert (=> b!1219072 m!1124091))

(assert (=> b!1219073 m!1124083))

(assert (=> b!1219073 m!1124083))

(assert (=> b!1219073 m!1124091))

(assert (=> b!1218826 d!134067))

(declare-fun d!134069 () Bool)

(assert (=> d!134069 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1218827 d!134069))

(declare-fun condMapEmpty!48283 () Bool)

(declare-fun mapDefault!48283 () ValueCell!14756)

(assert (=> mapNonEmpty!48274 (= condMapEmpty!48283 (= mapRest!48274 ((as const (Array (_ BitVec 32) ValueCell!14756)) mapDefault!48283)))))

(declare-fun e!692218 () Bool)

(declare-fun mapRes!48283 () Bool)

(assert (=> mapNonEmpty!48274 (= tp!91705 (and e!692218 mapRes!48283))))

(declare-fun mapNonEmpty!48283 () Bool)

(declare-fun tp!91721 () Bool)

(declare-fun e!692219 () Bool)

(assert (=> mapNonEmpty!48283 (= mapRes!48283 (and tp!91721 e!692219))))

(declare-fun mapKey!48283 () (_ BitVec 32))

(declare-fun mapRest!48283 () (Array (_ BitVec 32) ValueCell!14756))

(declare-fun mapValue!48283 () ValueCell!14756)

(assert (=> mapNonEmpty!48283 (= mapRest!48274 (store mapRest!48283 mapKey!48283 mapValue!48283))))

(declare-fun b!1219080 () Bool)

(assert (=> b!1219080 (= e!692219 tp_is_empty!30931)))

(declare-fun mapIsEmpty!48283 () Bool)

(assert (=> mapIsEmpty!48283 mapRes!48283))

(declare-fun b!1219081 () Bool)

(assert (=> b!1219081 (= e!692218 tp_is_empty!30931)))

(assert (= (and mapNonEmpty!48274 condMapEmpty!48283) mapIsEmpty!48283))

(assert (= (and mapNonEmpty!48274 (not condMapEmpty!48283)) mapNonEmpty!48283))

(assert (= (and mapNonEmpty!48283 ((_ is ValueCellFull!14756) mapValue!48283)) b!1219080))

(assert (= (and mapNonEmpty!48274 ((_ is ValueCellFull!14756) mapDefault!48283)) b!1219081))

(declare-fun m!1124183 () Bool)

(assert (=> mapNonEmpty!48283 m!1124183))

(declare-fun b_lambda!21961 () Bool)

(assert (= b_lambda!21951 (or (and start!101566 b_free!26227) b_lambda!21961)))

(declare-fun b_lambda!21963 () Bool)

(assert (= b_lambda!21957 (or (and start!101566 b_free!26227) b_lambda!21963)))

(declare-fun b_lambda!21965 () Bool)

(assert (= b_lambda!21943 (or (and start!101566 b_free!26227) b_lambda!21965)))

(declare-fun b_lambda!21967 () Bool)

(assert (= b_lambda!21945 (or (and start!101566 b_free!26227) b_lambda!21967)))

(declare-fun b_lambda!21969 () Bool)

(assert (= b_lambda!21949 (or (and start!101566 b_free!26227) b_lambda!21969)))

(declare-fun b_lambda!21971 () Bool)

(assert (= b_lambda!21955 (or (and start!101566 b_free!26227) b_lambda!21971)))

(declare-fun b_lambda!21973 () Bool)

(assert (= b_lambda!21953 (or (and start!101566 b_free!26227) b_lambda!21973)))

(declare-fun b_lambda!21975 () Bool)

(assert (= b_lambda!21959 (or (and start!101566 b_free!26227) b_lambda!21975)))

(declare-fun b_lambda!21977 () Bool)

(assert (= b_lambda!21947 (or (and start!101566 b_free!26227) b_lambda!21977)))

(check-sat (not b!1218947) (not b!1218987) (not b!1218986) (not b!1219052) (not b!1218997) (not b!1219053) (not b_lambda!21971) (not b!1218998) (not b!1219063) (not b!1218991) (not d!134063) (not bm!60692) (not d!134065) (not b!1219059) (not d!134061) (not b!1218993) (not b_lambda!21969) (not b!1219055) (not b!1219050) (not bm!60704) (not bm!60708) (not b!1219067) (not b!1218996) (not b!1219045) (not bm!60699) (not b!1219027) (not b!1219065) (not b_lambda!21941) (not b!1219012) (not b!1219062) (not b!1219051) (not b!1219068) (not b_lambda!21961) (not b!1219028) tp_is_empty!30931 (not bm!60698) (not b!1218985) (not b_next!26227) (not b!1219002) (not b!1219033) (not b!1219029) (not mapNonEmpty!48283) (not b!1218979) (not b!1219073) (not b!1219034) (not b!1218984) (not d!134039) (not bm!60691) (not bm!60695) (not b!1219056) (not b!1219047) (not b_lambda!21977) (not b!1219001) (not d!134059) (not b_lambda!21965) (not b!1219071) (not b!1218999) (not d!134033) (not b!1219064) (not b!1218981) (not b!1218990) (not b_lambda!21967) (not d!134041) (not d!134035) (not b!1219072) (not bm!60707) (not bm!60706) b_and!43619 (not b_lambda!21975) (not b!1219031) (not b!1219043) (not b!1218942) (not b!1219057) (not b!1218989) (not bm!60705) (not b_lambda!21973) (not b!1218953) (not b_lambda!21963) (not b!1219013) (not b!1218954) (not b!1218948))
(check-sat b_and!43619 (not b_next!26227))
