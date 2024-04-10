; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99864 () Bool)

(assert start!99864)

(declare-fun b_free!25443 () Bool)

(declare-fun b_next!25443 () Bool)

(assert (=> start!99864 (= b_free!25443 (not b_next!25443))))

(declare-fun tp!89042 () Bool)

(declare-fun b_and!41753 () Bool)

(assert (=> start!99864 (= tp!89042 b_and!41753)))

(declare-fun b!1188019 () Bool)

(declare-fun res!789882 () Bool)

(declare-fun e!675510 () Bool)

(assert (=> b!1188019 (=> (not res!789882) (not e!675510))))

(declare-datatypes ((array!76741 0))(
  ( (array!76742 (arr!37020 (Array (_ BitVec 32) (_ BitVec 64))) (size!37556 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76741)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76741 (_ BitVec 32)) Bool)

(assert (=> b!1188019 (= res!789882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!789870 () Bool)

(assert (=> start!99864 (=> (not res!789870) (not e!675510))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99864 (= res!789870 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37556 _keys!1208))))))

(assert (=> start!99864 e!675510))

(declare-fun tp_is_empty!29973 () Bool)

(assert (=> start!99864 tp_is_empty!29973))

(declare-fun array_inv!28244 (array!76741) Bool)

(assert (=> start!99864 (array_inv!28244 _keys!1208)))

(assert (=> start!99864 true))

(assert (=> start!99864 tp!89042))

(declare-datatypes ((V!45091 0))(
  ( (V!45092 (val!15043 Int)) )
))
(declare-datatypes ((ValueCell!14277 0))(
  ( (ValueCellFull!14277 (v!17681 V!45091)) (EmptyCell!14277) )
))
(declare-datatypes ((array!76743 0))(
  ( (array!76744 (arr!37021 (Array (_ BitVec 32) ValueCell!14277)) (size!37557 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76743)

(declare-fun e!675511 () Bool)

(declare-fun array_inv!28245 (array!76743) Bool)

(assert (=> start!99864 (and (array_inv!28245 _values!996) e!675511)))

(declare-fun b!1188020 () Bool)

(declare-fun res!789871 () Bool)

(assert (=> b!1188020 (=> (not res!789871) (not e!675510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188020 (= res!789871 (validMask!0 mask!1564))))

(declare-fun b!1188021 () Bool)

(declare-fun res!789877 () Bool)

(assert (=> b!1188021 (=> (not res!789877) (not e!675510))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1188021 (= res!789877 (= (select (arr!37020 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!46787 () Bool)

(declare-fun mapRes!46787 () Bool)

(declare-fun tp!89043 () Bool)

(declare-fun e!675504 () Bool)

(assert (=> mapNonEmpty!46787 (= mapRes!46787 (and tp!89043 e!675504))))

(declare-fun mapValue!46787 () ValueCell!14277)

(declare-fun mapRest!46787 () (Array (_ BitVec 32) ValueCell!14277))

(declare-fun mapKey!46787 () (_ BitVec 32))

(assert (=> mapNonEmpty!46787 (= (arr!37021 _values!996) (store mapRest!46787 mapKey!46787 mapValue!46787))))

(declare-fun b!1188022 () Bool)

(declare-fun e!675512 () Bool)

(declare-fun e!675509 () Bool)

(assert (=> b!1188022 (= e!675512 e!675509)))

(declare-fun res!789874 () Bool)

(assert (=> b!1188022 (=> res!789874 e!675509)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188022 (= res!789874 (not (validKeyInArray!0 (select (arr!37020 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19316 0))(
  ( (tuple2!19317 (_1!9669 (_ BitVec 64)) (_2!9669 V!45091)) )
))
(declare-datatypes ((List!26056 0))(
  ( (Nil!26053) (Cons!26052 (h!27261 tuple2!19316) (t!38491 List!26056)) )
))
(declare-datatypes ((ListLongMap!17285 0))(
  ( (ListLongMap!17286 (toList!8658 List!26056)) )
))
(declare-fun lt!540394 () ListLongMap!17285)

(declare-fun lt!540380 () ListLongMap!17285)

(assert (=> b!1188022 (= lt!540394 lt!540380)))

(declare-fun lt!540389 () ListLongMap!17285)

(declare-fun -!1688 (ListLongMap!17285 (_ BitVec 64)) ListLongMap!17285)

(assert (=> b!1188022 (= lt!540380 (-!1688 lt!540389 k0!934))))

(declare-fun zeroValue!944 () V!45091)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!540387 () array!76741)

(declare-fun minValue!944 () V!45091)

(declare-fun lt!540396 () array!76743)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5099 (array!76741 array!76743 (_ BitVec 32) (_ BitVec 32) V!45091 V!45091 (_ BitVec 32) Int) ListLongMap!17285)

(assert (=> b!1188022 (= lt!540394 (getCurrentListMapNoExtraKeys!5099 lt!540387 lt!540396 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1188022 (= lt!540389 (getCurrentListMapNoExtraKeys!5099 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39409 0))(
  ( (Unit!39410) )
))
(declare-fun lt!540379 () Unit!39409)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!898 (array!76741 array!76743 (_ BitVec 32) (_ BitVec 32) V!45091 V!45091 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39409)

(assert (=> b!1188022 (= lt!540379 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!898 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1188023 () Bool)

(declare-fun e!675506 () Bool)

(assert (=> b!1188023 (= e!675511 (and e!675506 mapRes!46787))))

(declare-fun condMapEmpty!46787 () Bool)

(declare-fun mapDefault!46787 () ValueCell!14277)

(assert (=> b!1188023 (= condMapEmpty!46787 (= (arr!37021 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14277)) mapDefault!46787)))))

(declare-fun b!1188024 () Bool)

(declare-fun e!675503 () Bool)

(declare-fun arrayContainsKey!0 (array!76741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188024 (= e!675503 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188025 () Bool)

(assert (=> b!1188025 (= e!675506 tp_is_empty!29973)))

(declare-fun b!1188026 () Bool)

(declare-fun res!789869 () Bool)

(assert (=> b!1188026 (=> (not res!789869) (not e!675510))))

(declare-datatypes ((List!26057 0))(
  ( (Nil!26054) (Cons!26053 (h!27262 (_ BitVec 64)) (t!38492 List!26057)) )
))
(declare-fun arrayNoDuplicates!0 (array!76741 (_ BitVec 32) List!26057) Bool)

(assert (=> b!1188026 (= res!789869 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26054))))

(declare-fun b!1188027 () Bool)

(declare-fun res!789872 () Bool)

(declare-fun e!675514 () Bool)

(assert (=> b!1188027 (=> (not res!789872) (not e!675514))))

(assert (=> b!1188027 (= res!789872 (arrayNoDuplicates!0 lt!540387 #b00000000000000000000000000000000 Nil!26054))))

(declare-fun b!1188028 () Bool)

(declare-fun res!789876 () Bool)

(assert (=> b!1188028 (=> (not res!789876) (not e!675510))))

(assert (=> b!1188028 (= res!789876 (and (= (size!37557 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37556 _keys!1208) (size!37557 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188029 () Bool)

(assert (=> b!1188029 (= e!675510 e!675514)))

(declare-fun res!789883 () Bool)

(assert (=> b!1188029 (=> (not res!789883) (not e!675514))))

(assert (=> b!1188029 (= res!789883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540387 mask!1564))))

(assert (=> b!1188029 (= lt!540387 (array!76742 (store (arr!37020 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37556 _keys!1208)))))

(declare-fun b!1188030 () Bool)

(declare-fun e!675505 () Unit!39409)

(declare-fun Unit!39411 () Unit!39409)

(assert (=> b!1188030 (= e!675505 Unit!39411)))

(declare-fun lt!540381 () Unit!39409)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76741 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39409)

(assert (=> b!1188030 (= lt!540381 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1188030 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!540390 () Unit!39409)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76741 (_ BitVec 32) (_ BitVec 32)) Unit!39409)

(assert (=> b!1188030 (= lt!540390 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1188030 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26054)))

(declare-fun lt!540393 () Unit!39409)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76741 (_ BitVec 64) (_ BitVec 32) List!26057) Unit!39409)

(assert (=> b!1188030 (= lt!540393 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26054))))

(assert (=> b!1188030 false))

(declare-fun b!1188031 () Bool)

(declare-fun e!675513 () Bool)

(assert (=> b!1188031 (= e!675514 (not e!675513))))

(declare-fun res!789878 () Bool)

(assert (=> b!1188031 (=> res!789878 e!675513)))

(assert (=> b!1188031 (= res!789878 (bvsgt from!1455 i!673))))

(assert (=> b!1188031 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!540392 () Unit!39409)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76741 (_ BitVec 64) (_ BitVec 32)) Unit!39409)

(assert (=> b!1188031 (= lt!540392 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188032 () Bool)

(declare-fun e!675508 () Bool)

(assert (=> b!1188032 (= e!675508 e!675503)))

(declare-fun res!789879 () Bool)

(assert (=> b!1188032 (=> res!789879 e!675503)))

(assert (=> b!1188032 (= res!789879 (not (= (select (arr!37020 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1188033 () Bool)

(declare-fun res!789880 () Bool)

(assert (=> b!1188033 (=> (not res!789880) (not e!675510))))

(assert (=> b!1188033 (= res!789880 (validKeyInArray!0 k0!934))))

(declare-fun b!1188034 () Bool)

(assert (=> b!1188034 (= e!675513 e!675512)))

(declare-fun res!789875 () Bool)

(assert (=> b!1188034 (=> res!789875 e!675512)))

(assert (=> b!1188034 (= res!789875 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!540388 () ListLongMap!17285)

(assert (=> b!1188034 (= lt!540388 (getCurrentListMapNoExtraKeys!5099 lt!540387 lt!540396 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!540386 () V!45091)

(assert (=> b!1188034 (= lt!540396 (array!76744 (store (arr!37021 _values!996) i!673 (ValueCellFull!14277 lt!540386)) (size!37557 _values!996)))))

(declare-fun dynLambda!3045 (Int (_ BitVec 64)) V!45091)

(assert (=> b!1188034 (= lt!540386 (dynLambda!3045 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!540384 () ListLongMap!17285)

(assert (=> b!1188034 (= lt!540384 (getCurrentListMapNoExtraKeys!5099 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188035 () Bool)

(assert (=> b!1188035 (= e!675504 tp_is_empty!29973)))

(declare-fun b!1188036 () Bool)

(declare-fun res!789881 () Bool)

(assert (=> b!1188036 (=> (not res!789881) (not e!675510))))

(assert (=> b!1188036 (= res!789881 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37556 _keys!1208))))))

(declare-fun b!1188037 () Bool)

(assert (=> b!1188037 (= e!675509 true)))

(declare-fun lt!540382 () ListLongMap!17285)

(declare-fun lt!540383 () ListLongMap!17285)

(assert (=> b!1188037 (= (-!1688 lt!540382 k0!934) lt!540383)))

(declare-fun lt!540378 () Unit!39409)

(declare-fun lt!540385 () V!45091)

(declare-fun addRemoveCommutativeForDiffKeys!207 (ListLongMap!17285 (_ BitVec 64) V!45091 (_ BitVec 64)) Unit!39409)

(assert (=> b!1188037 (= lt!540378 (addRemoveCommutativeForDiffKeys!207 lt!540389 (select (arr!37020 _keys!1208) from!1455) lt!540385 k0!934))))

(assert (=> b!1188037 (and (= lt!540384 lt!540382) (= lt!540380 lt!540394))))

(declare-fun lt!540391 () tuple2!19316)

(declare-fun +!3944 (ListLongMap!17285 tuple2!19316) ListLongMap!17285)

(assert (=> b!1188037 (= lt!540382 (+!3944 lt!540389 lt!540391))))

(assert (=> b!1188037 (not (= (select (arr!37020 _keys!1208) from!1455) k0!934))))

(declare-fun lt!540395 () Unit!39409)

(assert (=> b!1188037 (= lt!540395 e!675505)))

(declare-fun c!117288 () Bool)

(assert (=> b!1188037 (= c!117288 (= (select (arr!37020 _keys!1208) from!1455) k0!934))))

(assert (=> b!1188037 e!675508))

(declare-fun res!789873 () Bool)

(assert (=> b!1188037 (=> (not res!789873) (not e!675508))))

(assert (=> b!1188037 (= res!789873 (= lt!540388 lt!540383))))

(assert (=> b!1188037 (= lt!540383 (+!3944 lt!540380 lt!540391))))

(assert (=> b!1188037 (= lt!540391 (tuple2!19317 (select (arr!37020 _keys!1208) from!1455) lt!540385))))

(declare-fun get!18965 (ValueCell!14277 V!45091) V!45091)

(assert (=> b!1188037 (= lt!540385 (get!18965 (select (arr!37021 _values!996) from!1455) lt!540386))))

(declare-fun b!1188038 () Bool)

(declare-fun Unit!39412 () Unit!39409)

(assert (=> b!1188038 (= e!675505 Unit!39412)))

(declare-fun mapIsEmpty!46787 () Bool)

(assert (=> mapIsEmpty!46787 mapRes!46787))

(assert (= (and start!99864 res!789870) b!1188020))

(assert (= (and b!1188020 res!789871) b!1188028))

(assert (= (and b!1188028 res!789876) b!1188019))

(assert (= (and b!1188019 res!789882) b!1188026))

(assert (= (and b!1188026 res!789869) b!1188036))

(assert (= (and b!1188036 res!789881) b!1188033))

(assert (= (and b!1188033 res!789880) b!1188021))

(assert (= (and b!1188021 res!789877) b!1188029))

(assert (= (and b!1188029 res!789883) b!1188027))

(assert (= (and b!1188027 res!789872) b!1188031))

(assert (= (and b!1188031 (not res!789878)) b!1188034))

(assert (= (and b!1188034 (not res!789875)) b!1188022))

(assert (= (and b!1188022 (not res!789874)) b!1188037))

(assert (= (and b!1188037 res!789873) b!1188032))

(assert (= (and b!1188032 (not res!789879)) b!1188024))

(assert (= (and b!1188037 c!117288) b!1188030))

(assert (= (and b!1188037 (not c!117288)) b!1188038))

(assert (= (and b!1188023 condMapEmpty!46787) mapIsEmpty!46787))

(assert (= (and b!1188023 (not condMapEmpty!46787)) mapNonEmpty!46787))

(get-info :version)

(assert (= (and mapNonEmpty!46787 ((_ is ValueCellFull!14277) mapValue!46787)) b!1188035))

(assert (= (and b!1188023 ((_ is ValueCellFull!14277) mapDefault!46787)) b!1188025))

(assert (= start!99864 b!1188023))

(declare-fun b_lambda!20587 () Bool)

(assert (=> (not b_lambda!20587) (not b!1188034)))

(declare-fun t!38490 () Bool)

(declare-fun tb!10255 () Bool)

(assert (=> (and start!99864 (= defaultEntry!1004 defaultEntry!1004) t!38490) tb!10255))

(declare-fun result!21077 () Bool)

(assert (=> tb!10255 (= result!21077 tp_is_empty!29973)))

(assert (=> b!1188034 t!38490))

(declare-fun b_and!41755 () Bool)

(assert (= b_and!41753 (and (=> t!38490 result!21077) b_and!41755)))

(declare-fun m!1096765 () Bool)

(assert (=> b!1188031 m!1096765))

(declare-fun m!1096767 () Bool)

(assert (=> b!1188031 m!1096767))

(declare-fun m!1096769 () Bool)

(assert (=> b!1188027 m!1096769))

(declare-fun m!1096771 () Bool)

(assert (=> b!1188021 m!1096771))

(declare-fun m!1096773 () Bool)

(assert (=> b!1188029 m!1096773))

(declare-fun m!1096775 () Bool)

(assert (=> b!1188029 m!1096775))

(declare-fun m!1096777 () Bool)

(assert (=> b!1188030 m!1096777))

(declare-fun m!1096779 () Bool)

(assert (=> b!1188030 m!1096779))

(declare-fun m!1096781 () Bool)

(assert (=> b!1188030 m!1096781))

(declare-fun m!1096783 () Bool)

(assert (=> b!1188030 m!1096783))

(declare-fun m!1096785 () Bool)

(assert (=> b!1188030 m!1096785))

(declare-fun m!1096787 () Bool)

(assert (=> mapNonEmpty!46787 m!1096787))

(declare-fun m!1096789 () Bool)

(assert (=> b!1188034 m!1096789))

(declare-fun m!1096791 () Bool)

(assert (=> b!1188034 m!1096791))

(declare-fun m!1096793 () Bool)

(assert (=> b!1188034 m!1096793))

(declare-fun m!1096795 () Bool)

(assert (=> b!1188034 m!1096795))

(declare-fun m!1096797 () Bool)

(assert (=> b!1188022 m!1096797))

(declare-fun m!1096799 () Bool)

(assert (=> b!1188022 m!1096799))

(declare-fun m!1096801 () Bool)

(assert (=> b!1188022 m!1096801))

(declare-fun m!1096803 () Bool)

(assert (=> b!1188022 m!1096803))

(declare-fun m!1096805 () Bool)

(assert (=> b!1188022 m!1096805))

(declare-fun m!1096807 () Bool)

(assert (=> b!1188022 m!1096807))

(assert (=> b!1188022 m!1096805))

(declare-fun m!1096809 () Bool)

(assert (=> b!1188019 m!1096809))

(assert (=> b!1188032 m!1096805))

(declare-fun m!1096811 () Bool)

(assert (=> b!1188026 m!1096811))

(declare-fun m!1096813 () Bool)

(assert (=> b!1188037 m!1096813))

(declare-fun m!1096815 () Bool)

(assert (=> b!1188037 m!1096815))

(declare-fun m!1096817 () Bool)

(assert (=> b!1188037 m!1096817))

(assert (=> b!1188037 m!1096805))

(declare-fun m!1096819 () Bool)

(assert (=> b!1188037 m!1096819))

(assert (=> b!1188037 m!1096813))

(declare-fun m!1096821 () Bool)

(assert (=> b!1188037 m!1096821))

(declare-fun m!1096823 () Bool)

(assert (=> b!1188037 m!1096823))

(assert (=> b!1188037 m!1096805))

(declare-fun m!1096825 () Bool)

(assert (=> start!99864 m!1096825))

(declare-fun m!1096827 () Bool)

(assert (=> start!99864 m!1096827))

(declare-fun m!1096829 () Bool)

(assert (=> b!1188024 m!1096829))

(declare-fun m!1096831 () Bool)

(assert (=> b!1188033 m!1096831))

(declare-fun m!1096833 () Bool)

(assert (=> b!1188020 m!1096833))

(check-sat (not b!1188031) (not b!1188022) (not start!99864) (not b!1188019) (not b!1188037) tp_is_empty!29973 (not b!1188020) (not b!1188026) (not b!1188034) (not b!1188033) (not b_lambda!20587) b_and!41755 (not b_next!25443) (not mapNonEmpty!46787) (not b!1188030) (not b!1188027) (not b!1188024) (not b!1188029))
(check-sat b_and!41755 (not b_next!25443))
