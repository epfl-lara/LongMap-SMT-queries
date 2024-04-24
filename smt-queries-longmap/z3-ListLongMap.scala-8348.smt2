; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101874 () Bool)

(assert start!101874)

(declare-fun b_free!26359 () Bool)

(declare-fun b_next!26359 () Bool)

(assert (=> start!101874 (= b_free!26359 (not b_next!26359))))

(declare-fun tp!92119 () Bool)

(declare-fun b_and!43963 () Bool)

(assert (=> start!101874 (= tp!92119 b_and!43963)))

(declare-fun b!1223643 () Bool)

(declare-fun res!812657 () Bool)

(declare-fun e!695028 () Bool)

(assert (=> b!1223643 (=> (not res!812657) (not e!695028))))

(declare-datatypes ((array!78947 0))(
  ( (array!78948 (arr!38095 (Array (_ BitVec 32) (_ BitVec 64))) (size!38632 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78947)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!46545 0))(
  ( (V!46546 (val!15588 Int)) )
))
(declare-datatypes ((ValueCell!14822 0))(
  ( (ValueCellFull!14822 (v!18245 V!46545)) (EmptyCell!14822) )
))
(declare-datatypes ((array!78949 0))(
  ( (array!78950 (arr!38096 (Array (_ BitVec 32) ValueCell!14822)) (size!38633 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78949)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1223643 (= res!812657 (and (= (size!38633 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38632 _keys!1208) (size!38633 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1223644 () Bool)

(declare-fun e!695032 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1223644 (= e!695032 (bvslt from!1455 (size!38632 _keys!1208)))))

(declare-datatypes ((Unit!40452 0))(
  ( (Unit!40453) )
))
(declare-fun lt!556606 () Unit!40452)

(declare-fun e!695024 () Unit!40452)

(assert (=> b!1223644 (= lt!556606 e!695024)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun c!120718 () Bool)

(assert (=> b!1223644 (= c!120718 (= (select (arr!38095 _keys!1208) from!1455) k0!934))))

(declare-fun e!695023 () Bool)

(assert (=> b!1223644 e!695023))

(declare-fun res!812652 () Bool)

(assert (=> b!1223644 (=> (not res!812652) (not e!695023))))

(declare-datatypes ((tuple2!20092 0))(
  ( (tuple2!20093 (_1!10057 (_ BitVec 64)) (_2!10057 V!46545)) )
))
(declare-datatypes ((List!26902 0))(
  ( (Nil!26899) (Cons!26898 (h!28116 tuple2!20092) (t!40233 List!26902)) )
))
(declare-datatypes ((ListLongMap!18069 0))(
  ( (ListLongMap!18070 (toList!9050 List!26902)) )
))
(declare-fun lt!556602 () ListLongMap!18069)

(declare-fun lt!556595 () ListLongMap!18069)

(declare-fun lt!556600 () V!46545)

(declare-fun +!4152 (ListLongMap!18069 tuple2!20092) ListLongMap!18069)

(declare-fun get!19490 (ValueCell!14822 V!46545) V!46545)

(assert (=> b!1223644 (= res!812652 (= lt!556595 (+!4152 lt!556602 (tuple2!20093 (select (arr!38095 _keys!1208) from!1455) (get!19490 (select (arr!38096 _values!996) from!1455) lt!556600)))))))

(declare-fun b!1223645 () Bool)

(declare-fun res!812650 () Bool)

(assert (=> b!1223645 (=> (not res!812650) (not e!695028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1223645 (= res!812650 (validMask!0 mask!1564))))

(declare-fun b!1223646 () Bool)

(declare-fun e!695026 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!78947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1223646 (= e!695026 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun res!812649 () Bool)

(assert (=> start!101874 (=> (not res!812649) (not e!695028))))

(assert (=> start!101874 (= res!812649 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38632 _keys!1208))))))

(assert (=> start!101874 e!695028))

(declare-fun tp_is_empty!31063 () Bool)

(assert (=> start!101874 tp_is_empty!31063))

(declare-fun array_inv!29066 (array!78947) Bool)

(assert (=> start!101874 (array_inv!29066 _keys!1208)))

(assert (=> start!101874 true))

(assert (=> start!101874 tp!92119))

(declare-fun e!695025 () Bool)

(declare-fun array_inv!29067 (array!78949) Bool)

(assert (=> start!101874 (and (array_inv!29067 _values!996) e!695025)))

(declare-fun b!1223647 () Bool)

(declare-fun e!695034 () Bool)

(assert (=> b!1223647 (= e!695034 tp_is_empty!31063)))

(declare-fun b!1223648 () Bool)

(declare-fun Unit!40454 () Unit!40452)

(assert (=> b!1223648 (= e!695024 Unit!40454)))

(declare-fun b!1223649 () Bool)

(assert (=> b!1223649 (= e!695023 e!695026)))

(declare-fun res!812651 () Bool)

(assert (=> b!1223649 (=> res!812651 e!695026)))

(assert (=> b!1223649 (= res!812651 (not (= (select (arr!38095 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1223650 () Bool)

(declare-fun e!695033 () Bool)

(declare-fun e!695031 () Bool)

(assert (=> b!1223650 (= e!695033 (not e!695031))))

(declare-fun res!812647 () Bool)

(assert (=> b!1223650 (=> res!812647 e!695031)))

(assert (=> b!1223650 (= res!812647 (bvsgt from!1455 i!673))))

(assert (=> b!1223650 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!556594 () Unit!40452)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78947 (_ BitVec 64) (_ BitVec 32)) Unit!40452)

(assert (=> b!1223650 (= lt!556594 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223651 () Bool)

(declare-fun res!812655 () Bool)

(assert (=> b!1223651 (=> (not res!812655) (not e!695033))))

(declare-fun lt!556599 () array!78947)

(declare-datatypes ((List!26903 0))(
  ( (Nil!26900) (Cons!26899 (h!28117 (_ BitVec 64)) (t!40234 List!26903)) )
))
(declare-fun arrayNoDuplicates!0 (array!78947 (_ BitVec 32) List!26903) Bool)

(assert (=> b!1223651 (= res!812655 (arrayNoDuplicates!0 lt!556599 #b00000000000000000000000000000000 Nil!26900))))

(declare-fun b!1223652 () Bool)

(declare-fun e!695027 () Bool)

(assert (=> b!1223652 (= e!695027 e!695032)))

(declare-fun res!812653 () Bool)

(assert (=> b!1223652 (=> res!812653 e!695032)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1223652 (= res!812653 (not (validKeyInArray!0 (select (arr!38095 _keys!1208) from!1455))))))

(declare-fun lt!556598 () ListLongMap!18069)

(assert (=> b!1223652 (= lt!556598 lt!556602)))

(declare-fun lt!556597 () ListLongMap!18069)

(declare-fun -!1930 (ListLongMap!18069 (_ BitVec 64)) ListLongMap!18069)

(assert (=> b!1223652 (= lt!556602 (-!1930 lt!556597 k0!934))))

(declare-fun zeroValue!944 () V!46545)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!556601 () array!78949)

(declare-fun minValue!944 () V!46545)

(declare-fun getCurrentListMapNoExtraKeys!5503 (array!78947 array!78949 (_ BitVec 32) (_ BitVec 32) V!46545 V!46545 (_ BitVec 32) Int) ListLongMap!18069)

(assert (=> b!1223652 (= lt!556598 (getCurrentListMapNoExtraKeys!5503 lt!556599 lt!556601 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1223652 (= lt!556597 (getCurrentListMapNoExtraKeys!5503 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556596 () Unit!40452)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1145 (array!78947 array!78949 (_ BitVec 32) (_ BitVec 32) V!46545 V!46545 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40452)

(assert (=> b!1223652 (= lt!556596 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1145 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1223653 () Bool)

(declare-fun res!812648 () Bool)

(assert (=> b!1223653 (=> (not res!812648) (not e!695028))))

(assert (=> b!1223653 (= res!812648 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26900))))

(declare-fun b!1223654 () Bool)

(assert (=> b!1223654 (= e!695031 e!695027)))

(declare-fun res!812658 () Bool)

(assert (=> b!1223654 (=> res!812658 e!695027)))

(assert (=> b!1223654 (= res!812658 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1223654 (= lt!556595 (getCurrentListMapNoExtraKeys!5503 lt!556599 lt!556601 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1223654 (= lt!556601 (array!78950 (store (arr!38096 _values!996) i!673 (ValueCellFull!14822 lt!556600)) (size!38633 _values!996)))))

(declare-fun dynLambda!3403 (Int (_ BitVec 64)) V!46545)

(assert (=> b!1223654 (= lt!556600 (dynLambda!3403 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556593 () ListLongMap!18069)

(assert (=> b!1223654 (= lt!556593 (getCurrentListMapNoExtraKeys!5503 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1223655 () Bool)

(declare-fun res!812645 () Bool)

(assert (=> b!1223655 (=> (not res!812645) (not e!695028))))

(assert (=> b!1223655 (= res!812645 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38632 _keys!1208))))))

(declare-fun b!1223656 () Bool)

(declare-fun mapRes!48490 () Bool)

(assert (=> b!1223656 (= e!695025 (and e!695034 mapRes!48490))))

(declare-fun condMapEmpty!48490 () Bool)

(declare-fun mapDefault!48490 () ValueCell!14822)

(assert (=> b!1223656 (= condMapEmpty!48490 (= (arr!38096 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14822)) mapDefault!48490)))))

(declare-fun b!1223657 () Bool)

(declare-fun e!695029 () Bool)

(assert (=> b!1223657 (= e!695029 tp_is_empty!31063)))

(declare-fun b!1223658 () Bool)

(declare-fun res!812659 () Bool)

(assert (=> b!1223658 (=> (not res!812659) (not e!695028))))

(assert (=> b!1223658 (= res!812659 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!48490 () Bool)

(assert (=> mapIsEmpty!48490 mapRes!48490))

(declare-fun b!1223659 () Bool)

(declare-fun res!812654 () Bool)

(assert (=> b!1223659 (=> (not res!812654) (not e!695028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78947 (_ BitVec 32)) Bool)

(assert (=> b!1223659 (= res!812654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!48490 () Bool)

(declare-fun tp!92120 () Bool)

(assert (=> mapNonEmpty!48490 (= mapRes!48490 (and tp!92120 e!695029))))

(declare-fun mapKey!48490 () (_ BitVec 32))

(declare-fun mapValue!48490 () ValueCell!14822)

(declare-fun mapRest!48490 () (Array (_ BitVec 32) ValueCell!14822))

(assert (=> mapNonEmpty!48490 (= (arr!38096 _values!996) (store mapRest!48490 mapKey!48490 mapValue!48490))))

(declare-fun b!1223660 () Bool)

(assert (=> b!1223660 (= e!695028 e!695033)))

(declare-fun res!812656 () Bool)

(assert (=> b!1223660 (=> (not res!812656) (not e!695033))))

(assert (=> b!1223660 (= res!812656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556599 mask!1564))))

(assert (=> b!1223660 (= lt!556599 (array!78948 (store (arr!38095 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38632 _keys!1208)))))

(declare-fun b!1223661 () Bool)

(declare-fun res!812646 () Bool)

(assert (=> b!1223661 (=> (not res!812646) (not e!695028))))

(assert (=> b!1223661 (= res!812646 (= (select (arr!38095 _keys!1208) i!673) k0!934))))

(declare-fun b!1223662 () Bool)

(declare-fun Unit!40455 () Unit!40452)

(assert (=> b!1223662 (= e!695024 Unit!40455)))

(declare-fun lt!556603 () Unit!40452)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78947 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40452)

(assert (=> b!1223662 (= lt!556603 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1223662 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556604 () Unit!40452)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78947 (_ BitVec 32) (_ BitVec 32)) Unit!40452)

(assert (=> b!1223662 (= lt!556604 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1223662 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26900)))

(declare-fun lt!556605 () Unit!40452)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78947 (_ BitVec 64) (_ BitVec 32) List!26903) Unit!40452)

(assert (=> b!1223662 (= lt!556605 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26900))))

(assert (=> b!1223662 false))

(assert (= (and start!101874 res!812649) b!1223645))

(assert (= (and b!1223645 res!812650) b!1223643))

(assert (= (and b!1223643 res!812657) b!1223659))

(assert (= (and b!1223659 res!812654) b!1223653))

(assert (= (and b!1223653 res!812648) b!1223655))

(assert (= (and b!1223655 res!812645) b!1223658))

(assert (= (and b!1223658 res!812659) b!1223661))

(assert (= (and b!1223661 res!812646) b!1223660))

(assert (= (and b!1223660 res!812656) b!1223651))

(assert (= (and b!1223651 res!812655) b!1223650))

(assert (= (and b!1223650 (not res!812647)) b!1223654))

(assert (= (and b!1223654 (not res!812658)) b!1223652))

(assert (= (and b!1223652 (not res!812653)) b!1223644))

(assert (= (and b!1223644 res!812652) b!1223649))

(assert (= (and b!1223649 (not res!812651)) b!1223646))

(assert (= (and b!1223644 c!120718) b!1223662))

(assert (= (and b!1223644 (not c!120718)) b!1223648))

(assert (= (and b!1223656 condMapEmpty!48490) mapIsEmpty!48490))

(assert (= (and b!1223656 (not condMapEmpty!48490)) mapNonEmpty!48490))

(get-info :version)

(assert (= (and mapNonEmpty!48490 ((_ is ValueCellFull!14822) mapValue!48490)) b!1223657))

(assert (= (and b!1223656 ((_ is ValueCellFull!14822) mapDefault!48490)) b!1223647))

(assert (= start!101874 b!1223656))

(declare-fun b_lambda!22295 () Bool)

(assert (=> (not b_lambda!22295) (not b!1223654)))

(declare-fun t!40232 () Bool)

(declare-fun tb!11151 () Bool)

(assert (=> (and start!101874 (= defaultEntry!1004 defaultEntry!1004) t!40232) tb!11151))

(declare-fun result!22921 () Bool)

(assert (=> tb!11151 (= result!22921 tp_is_empty!31063)))

(assert (=> b!1223654 t!40232))

(declare-fun b_and!43965 () Bool)

(assert (= b_and!43963 (and (=> t!40232 result!22921) b_and!43965)))

(declare-fun m!1128875 () Bool)

(assert (=> b!1223651 m!1128875))

(declare-fun m!1128877 () Bool)

(assert (=> b!1223659 m!1128877))

(declare-fun m!1128879 () Bool)

(assert (=> b!1223662 m!1128879))

(declare-fun m!1128881 () Bool)

(assert (=> b!1223662 m!1128881))

(declare-fun m!1128883 () Bool)

(assert (=> b!1223662 m!1128883))

(declare-fun m!1128885 () Bool)

(assert (=> b!1223662 m!1128885))

(declare-fun m!1128887 () Bool)

(assert (=> b!1223662 m!1128887))

(declare-fun m!1128889 () Bool)

(assert (=> b!1223661 m!1128889))

(declare-fun m!1128891 () Bool)

(assert (=> b!1223645 m!1128891))

(declare-fun m!1128893 () Bool)

(assert (=> b!1223660 m!1128893))

(declare-fun m!1128895 () Bool)

(assert (=> b!1223660 m!1128895))

(declare-fun m!1128897 () Bool)

(assert (=> start!101874 m!1128897))

(declare-fun m!1128899 () Bool)

(assert (=> start!101874 m!1128899))

(declare-fun m!1128901 () Bool)

(assert (=> b!1223652 m!1128901))

(declare-fun m!1128903 () Bool)

(assert (=> b!1223652 m!1128903))

(declare-fun m!1128905 () Bool)

(assert (=> b!1223652 m!1128905))

(declare-fun m!1128907 () Bool)

(assert (=> b!1223652 m!1128907))

(declare-fun m!1128909 () Bool)

(assert (=> b!1223652 m!1128909))

(assert (=> b!1223652 m!1128907))

(declare-fun m!1128911 () Bool)

(assert (=> b!1223652 m!1128911))

(assert (=> b!1223649 m!1128907))

(declare-fun m!1128913 () Bool)

(assert (=> b!1223650 m!1128913))

(declare-fun m!1128915 () Bool)

(assert (=> b!1223650 m!1128915))

(declare-fun m!1128917 () Bool)

(assert (=> b!1223658 m!1128917))

(declare-fun m!1128919 () Bool)

(assert (=> b!1223646 m!1128919))

(assert (=> b!1223644 m!1128907))

(declare-fun m!1128921 () Bool)

(assert (=> b!1223644 m!1128921))

(assert (=> b!1223644 m!1128921))

(declare-fun m!1128923 () Bool)

(assert (=> b!1223644 m!1128923))

(declare-fun m!1128925 () Bool)

(assert (=> b!1223644 m!1128925))

(declare-fun m!1128927 () Bool)

(assert (=> mapNonEmpty!48490 m!1128927))

(declare-fun m!1128929 () Bool)

(assert (=> b!1223654 m!1128929))

(declare-fun m!1128931 () Bool)

(assert (=> b!1223654 m!1128931))

(declare-fun m!1128933 () Bool)

(assert (=> b!1223654 m!1128933))

(declare-fun m!1128935 () Bool)

(assert (=> b!1223654 m!1128935))

(declare-fun m!1128937 () Bool)

(assert (=> b!1223653 m!1128937))

(check-sat (not start!101874) (not b!1223645) b_and!43965 (not b_lambda!22295) (not b!1223662) (not b!1223659) (not b!1223644) (not b!1223651) (not b!1223652) (not b!1223654) (not b!1223658) (not b!1223646) tp_is_empty!31063 (not mapNonEmpty!48490) (not b_next!26359) (not b!1223653) (not b!1223660) (not b!1223650))
(check-sat b_and!43965 (not b_next!26359))
