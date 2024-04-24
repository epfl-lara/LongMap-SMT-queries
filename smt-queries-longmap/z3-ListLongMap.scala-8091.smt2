; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99648 () Bool)

(assert start!99648)

(declare-fun b_free!24991 () Bool)

(declare-fun b_next!24991 () Bool)

(assert (=> start!99648 (= b_free!24991 (not b_next!24991))))

(declare-fun tp!87687 () Bool)

(declare-fun b_and!40851 () Bool)

(assert (=> start!99648 (= tp!87687 b_and!40851)))

(declare-fun b!1174954 () Bool)

(declare-fun res!779868 () Bool)

(declare-fun e!667950 () Bool)

(assert (=> b!1174954 (=> (not res!779868) (not e!667950))))

(declare-datatypes ((array!75907 0))(
  ( (array!75908 (arr!36597 (Array (_ BitVec 32) (_ BitVec 64))) (size!37134 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75907)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75907 (_ BitVec 32)) Bool)

(assert (=> b!1174954 (= res!779868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1174955 () Bool)

(declare-fun e!667955 () Bool)

(declare-fun arrayContainsKey!0 (array!75907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174955 (= e!667955 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174956 () Bool)

(declare-fun res!779874 () Bool)

(assert (=> b!1174956 (=> (not res!779874) (not e!667950))))

(declare-datatypes ((List!25710 0))(
  ( (Nil!25707) (Cons!25706 (h!26924 (_ BitVec 64)) (t!37685 List!25710)) )
))
(declare-fun arrayNoDuplicates!0 (array!75907 (_ BitVec 32) List!25710) Bool)

(assert (=> b!1174956 (= res!779874 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25707))))

(declare-fun b!1174958 () Bool)

(declare-fun e!667952 () Bool)

(declare-fun e!667949 () Bool)

(assert (=> b!1174958 (= e!667952 (not e!667949))))

(declare-fun res!779877 () Bool)

(assert (=> b!1174958 (=> res!779877 e!667949)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1174958 (= res!779877 (bvsgt from!1455 i!673))))

(assert (=> b!1174958 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38693 0))(
  ( (Unit!38694) )
))
(declare-fun lt!529576 () Unit!38693)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75907 (_ BitVec 64) (_ BitVec 32)) Unit!38693)

(assert (=> b!1174958 (= lt!529576 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174959 () Bool)

(declare-fun res!779875 () Bool)

(assert (=> b!1174959 (=> (not res!779875) (not e!667950))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44489 0))(
  ( (V!44490 (val!14817 Int)) )
))
(declare-datatypes ((ValueCell!14051 0))(
  ( (ValueCellFull!14051 (v!17451 V!44489)) (EmptyCell!14051) )
))
(declare-datatypes ((array!75909 0))(
  ( (array!75910 (arr!36598 (Array (_ BitVec 32) ValueCell!14051)) (size!37135 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75909)

(assert (=> b!1174959 (= res!779875 (and (= (size!37135 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37134 _keys!1208) (size!37135 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46109 () Bool)

(declare-fun mapRes!46109 () Bool)

(assert (=> mapIsEmpty!46109 mapRes!46109))

(declare-fun b!1174960 () Bool)

(assert (=> b!1174960 (= e!667950 e!667952)))

(declare-fun res!779866 () Bool)

(assert (=> b!1174960 (=> (not res!779866) (not e!667952))))

(declare-fun lt!529568 () array!75907)

(assert (=> b!1174960 (= res!779866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529568 mask!1564))))

(assert (=> b!1174960 (= lt!529568 (array!75908 (store (arr!36597 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37134 _keys!1208)))))

(declare-fun mapNonEmpty!46109 () Bool)

(declare-fun tp!87686 () Bool)

(declare-fun e!667947 () Bool)

(assert (=> mapNonEmpty!46109 (= mapRes!46109 (and tp!87686 e!667947))))

(declare-fun mapRest!46109 () (Array (_ BitVec 32) ValueCell!14051))

(declare-fun mapValue!46109 () ValueCell!14051)

(declare-fun mapKey!46109 () (_ BitVec 32))

(assert (=> mapNonEmpty!46109 (= (arr!36598 _values!996) (store mapRest!46109 mapKey!46109 mapValue!46109))))

(declare-fun b!1174961 () Bool)

(declare-fun res!779865 () Bool)

(assert (=> b!1174961 (=> (not res!779865) (not e!667950))))

(assert (=> b!1174961 (= res!779865 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37134 _keys!1208))))))

(declare-fun b!1174962 () Bool)

(declare-fun e!667951 () Bool)

(declare-fun e!667953 () Bool)

(assert (=> b!1174962 (= e!667951 e!667953)))

(declare-fun res!779869 () Bool)

(assert (=> b!1174962 (=> res!779869 e!667953)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174962 (= res!779869 (not (validKeyInArray!0 (select (arr!36597 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18972 0))(
  ( (tuple2!18973 (_1!9497 (_ BitVec 64)) (_2!9497 V!44489)) )
))
(declare-datatypes ((List!25711 0))(
  ( (Nil!25708) (Cons!25707 (h!26925 tuple2!18972) (t!37686 List!25711)) )
))
(declare-datatypes ((ListLongMap!16949 0))(
  ( (ListLongMap!16950 (toList!8490 List!25711)) )
))
(declare-fun lt!529574 () ListLongMap!16949)

(declare-fun lt!529570 () ListLongMap!16949)

(assert (=> b!1174962 (= lt!529574 lt!529570)))

(declare-fun lt!529563 () ListLongMap!16949)

(declare-fun -!1537 (ListLongMap!16949 (_ BitVec 64)) ListLongMap!16949)

(assert (=> b!1174962 (= lt!529570 (-!1537 lt!529563 k0!934))))

(declare-fun zeroValue!944 () V!44489)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!529565 () array!75909)

(declare-fun minValue!944 () V!44489)

(declare-fun getCurrentListMapNoExtraKeys!4975 (array!75907 array!75909 (_ BitVec 32) (_ BitVec 32) V!44489 V!44489 (_ BitVec 32) Int) ListLongMap!16949)

(assert (=> b!1174962 (= lt!529574 (getCurrentListMapNoExtraKeys!4975 lt!529568 lt!529565 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1174962 (= lt!529563 (getCurrentListMapNoExtraKeys!4975 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529566 () Unit!38693)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!762 (array!75907 array!75909 (_ BitVec 32) (_ BitVec 32) V!44489 V!44489 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38693)

(assert (=> b!1174962 (= lt!529566 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!762 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1174963 () Bool)

(declare-fun e!667956 () Bool)

(declare-fun tp_is_empty!29521 () Bool)

(assert (=> b!1174963 (= e!667956 tp_is_empty!29521)))

(declare-fun res!779879 () Bool)

(assert (=> start!99648 (=> (not res!779879) (not e!667950))))

(assert (=> start!99648 (= res!779879 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37134 _keys!1208))))))

(assert (=> start!99648 e!667950))

(assert (=> start!99648 tp_is_empty!29521))

(declare-fun array_inv!28038 (array!75907) Bool)

(assert (=> start!99648 (array_inv!28038 _keys!1208)))

(assert (=> start!99648 true))

(assert (=> start!99648 tp!87687))

(declare-fun e!667957 () Bool)

(declare-fun array_inv!28039 (array!75909) Bool)

(assert (=> start!99648 (and (array_inv!28039 _values!996) e!667957)))

(declare-fun b!1174957 () Bool)

(declare-fun e!667954 () Bool)

(assert (=> b!1174957 (= e!667954 e!667955)))

(declare-fun res!779872 () Bool)

(assert (=> b!1174957 (=> res!779872 e!667955)))

(assert (=> b!1174957 (= res!779872 (not (= (select (arr!36597 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1174964 () Bool)

(assert (=> b!1174964 (= e!667947 tp_is_empty!29521)))

(declare-fun b!1174965 () Bool)

(declare-fun res!779867 () Bool)

(assert (=> b!1174965 (=> (not res!779867) (not e!667950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174965 (= res!779867 (validMask!0 mask!1564))))

(declare-fun b!1174966 () Bool)

(declare-fun res!779878 () Bool)

(assert (=> b!1174966 (=> (not res!779878) (not e!667950))))

(assert (=> b!1174966 (= res!779878 (= (select (arr!36597 _keys!1208) i!673) k0!934))))

(declare-fun b!1174967 () Bool)

(assert (=> b!1174967 (= e!667957 (and e!667956 mapRes!46109))))

(declare-fun condMapEmpty!46109 () Bool)

(declare-fun mapDefault!46109 () ValueCell!14051)

(assert (=> b!1174967 (= condMapEmpty!46109 (= (arr!36598 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14051)) mapDefault!46109)))))

(declare-fun b!1174968 () Bool)

(declare-fun e!667958 () Unit!38693)

(declare-fun Unit!38695 () Unit!38693)

(assert (=> b!1174968 (= e!667958 Unit!38695)))

(declare-fun lt!529571 () Unit!38693)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75907 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38693)

(assert (=> b!1174968 (= lt!529571 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1174968 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529573 () Unit!38693)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75907 (_ BitVec 32) (_ BitVec 32)) Unit!38693)

(assert (=> b!1174968 (= lt!529573 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1174968 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25707)))

(declare-fun lt!529564 () Unit!38693)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75907 (_ BitVec 64) (_ BitVec 32) List!25710) Unit!38693)

(assert (=> b!1174968 (= lt!529564 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25707))))

(assert (=> b!1174968 false))

(declare-fun b!1174969 () Bool)

(declare-fun Unit!38696 () Unit!38693)

(assert (=> b!1174969 (= e!667958 Unit!38696)))

(declare-fun b!1174970 () Bool)

(assert (=> b!1174970 (= e!667949 e!667951)))

(declare-fun res!779876 () Bool)

(assert (=> b!1174970 (=> res!779876 e!667951)))

(assert (=> b!1174970 (= res!779876 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!529575 () ListLongMap!16949)

(assert (=> b!1174970 (= lt!529575 (getCurrentListMapNoExtraKeys!4975 lt!529568 lt!529565 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!529569 () V!44489)

(assert (=> b!1174970 (= lt!529565 (array!75910 (store (arr!36598 _values!996) i!673 (ValueCellFull!14051 lt!529569)) (size!37135 _values!996)))))

(declare-fun dynLambda!2953 (Int (_ BitVec 64)) V!44489)

(assert (=> b!1174970 (= lt!529569 (dynLambda!2953 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529572 () ListLongMap!16949)

(assert (=> b!1174970 (= lt!529572 (getCurrentListMapNoExtraKeys!4975 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1174971 () Bool)

(declare-fun res!779870 () Bool)

(assert (=> b!1174971 (=> (not res!779870) (not e!667950))))

(assert (=> b!1174971 (= res!779870 (validKeyInArray!0 k0!934))))

(declare-fun b!1174972 () Bool)

(assert (=> b!1174972 (= e!667953 true)))

(assert (=> b!1174972 (not (= (select (arr!36597 _keys!1208) from!1455) k0!934))))

(declare-fun lt!529567 () Unit!38693)

(assert (=> b!1174972 (= lt!529567 e!667958)))

(declare-fun c!117008 () Bool)

(assert (=> b!1174972 (= c!117008 (= (select (arr!36597 _keys!1208) from!1455) k0!934))))

(assert (=> b!1174972 e!667954))

(declare-fun res!779871 () Bool)

(assert (=> b!1174972 (=> (not res!779871) (not e!667954))))

(declare-fun +!3823 (ListLongMap!16949 tuple2!18972) ListLongMap!16949)

(declare-fun get!18705 (ValueCell!14051 V!44489) V!44489)

(assert (=> b!1174972 (= res!779871 (= lt!529575 (+!3823 lt!529570 (tuple2!18973 (select (arr!36597 _keys!1208) from!1455) (get!18705 (select (arr!36598 _values!996) from!1455) lt!529569)))))))

(declare-fun b!1174973 () Bool)

(declare-fun res!779873 () Bool)

(assert (=> b!1174973 (=> (not res!779873) (not e!667952))))

(assert (=> b!1174973 (= res!779873 (arrayNoDuplicates!0 lt!529568 #b00000000000000000000000000000000 Nil!25707))))

(assert (= (and start!99648 res!779879) b!1174965))

(assert (= (and b!1174965 res!779867) b!1174959))

(assert (= (and b!1174959 res!779875) b!1174954))

(assert (= (and b!1174954 res!779868) b!1174956))

(assert (= (and b!1174956 res!779874) b!1174961))

(assert (= (and b!1174961 res!779865) b!1174971))

(assert (= (and b!1174971 res!779870) b!1174966))

(assert (= (and b!1174966 res!779878) b!1174960))

(assert (= (and b!1174960 res!779866) b!1174973))

(assert (= (and b!1174973 res!779873) b!1174958))

(assert (= (and b!1174958 (not res!779877)) b!1174970))

(assert (= (and b!1174970 (not res!779876)) b!1174962))

(assert (= (and b!1174962 (not res!779869)) b!1174972))

(assert (= (and b!1174972 res!779871) b!1174957))

(assert (= (and b!1174957 (not res!779872)) b!1174955))

(assert (= (and b!1174972 c!117008) b!1174968))

(assert (= (and b!1174972 (not c!117008)) b!1174969))

(assert (= (and b!1174967 condMapEmpty!46109) mapIsEmpty!46109))

(assert (= (and b!1174967 (not condMapEmpty!46109)) mapNonEmpty!46109))

(get-info :version)

(assert (= (and mapNonEmpty!46109 ((_ is ValueCellFull!14051) mapValue!46109)) b!1174964))

(assert (= (and b!1174967 ((_ is ValueCellFull!14051) mapDefault!46109)) b!1174963))

(assert (= start!99648 b!1174967))

(declare-fun b_lambda!20129 () Bool)

(assert (=> (not b_lambda!20129) (not b!1174970)))

(declare-fun t!37684 () Bool)

(declare-fun tb!9795 () Bool)

(assert (=> (and start!99648 (= defaultEntry!1004 defaultEntry!1004) t!37684) tb!9795))

(declare-fun result!20165 () Bool)

(assert (=> tb!9795 (= result!20165 tp_is_empty!29521)))

(assert (=> b!1174970 t!37684))

(declare-fun b_and!40853 () Bool)

(assert (= b_and!40851 (and (=> t!37684 result!20165) b_and!40853)))

(declare-fun m!1083087 () Bool)

(assert (=> b!1174960 m!1083087))

(declare-fun m!1083089 () Bool)

(assert (=> b!1174960 m!1083089))

(declare-fun m!1083091 () Bool)

(assert (=> b!1174965 m!1083091))

(declare-fun m!1083093 () Bool)

(assert (=> b!1174958 m!1083093))

(declare-fun m!1083095 () Bool)

(assert (=> b!1174958 m!1083095))

(declare-fun m!1083097 () Bool)

(assert (=> b!1174968 m!1083097))

(declare-fun m!1083099 () Bool)

(assert (=> b!1174968 m!1083099))

(declare-fun m!1083101 () Bool)

(assert (=> b!1174968 m!1083101))

(declare-fun m!1083103 () Bool)

(assert (=> b!1174968 m!1083103))

(declare-fun m!1083105 () Bool)

(assert (=> b!1174968 m!1083105))

(declare-fun m!1083107 () Bool)

(assert (=> b!1174966 m!1083107))

(declare-fun m!1083109 () Bool)

(assert (=> mapNonEmpty!46109 m!1083109))

(declare-fun m!1083111 () Bool)

(assert (=> b!1174955 m!1083111))

(declare-fun m!1083113 () Bool)

(assert (=> b!1174970 m!1083113))

(declare-fun m!1083115 () Bool)

(assert (=> b!1174970 m!1083115))

(declare-fun m!1083117 () Bool)

(assert (=> b!1174970 m!1083117))

(declare-fun m!1083119 () Bool)

(assert (=> b!1174970 m!1083119))

(declare-fun m!1083121 () Bool)

(assert (=> b!1174954 m!1083121))

(declare-fun m!1083123 () Bool)

(assert (=> b!1174973 m!1083123))

(declare-fun m!1083125 () Bool)

(assert (=> start!99648 m!1083125))

(declare-fun m!1083127 () Bool)

(assert (=> start!99648 m!1083127))

(declare-fun m!1083129 () Bool)

(assert (=> b!1174957 m!1083129))

(declare-fun m!1083131 () Bool)

(assert (=> b!1174962 m!1083131))

(declare-fun m!1083133 () Bool)

(assert (=> b!1174962 m!1083133))

(declare-fun m!1083135 () Bool)

(assert (=> b!1174962 m!1083135))

(declare-fun m!1083137 () Bool)

(assert (=> b!1174962 m!1083137))

(assert (=> b!1174962 m!1083129))

(declare-fun m!1083139 () Bool)

(assert (=> b!1174962 m!1083139))

(assert (=> b!1174962 m!1083129))

(declare-fun m!1083141 () Bool)

(assert (=> b!1174956 m!1083141))

(assert (=> b!1174972 m!1083129))

(declare-fun m!1083143 () Bool)

(assert (=> b!1174972 m!1083143))

(assert (=> b!1174972 m!1083143))

(declare-fun m!1083145 () Bool)

(assert (=> b!1174972 m!1083145))

(declare-fun m!1083147 () Bool)

(assert (=> b!1174972 m!1083147))

(declare-fun m!1083149 () Bool)

(assert (=> b!1174971 m!1083149))

(check-sat (not b_next!24991) (not b!1174962) (not b!1174972) (not b!1174955) (not b!1174970) (not b!1174968) (not b!1174954) (not b!1174958) b_and!40853 (not b_lambda!20129) (not mapNonEmpty!46109) (not b!1174965) (not b!1174956) tp_is_empty!29521 (not start!99648) (not b!1174971) (not b!1174960) (not b!1174973))
(check-sat b_and!40853 (not b_next!24991))
