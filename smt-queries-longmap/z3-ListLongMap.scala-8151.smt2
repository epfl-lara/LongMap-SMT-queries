; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99766 () Bool)

(assert start!99766)

(declare-fun b_free!25351 () Bool)

(declare-fun b_next!25351 () Bool)

(assert (=> start!99766 (= b_free!25351 (not b_next!25351))))

(declare-fun tp!88767 () Bool)

(declare-fun b_and!41547 () Bool)

(assert (=> start!99766 (= tp!88767 b_and!41547)))

(declare-fun res!787746 () Bool)

(declare-fun e!673777 () Bool)

(assert (=> start!99766 (=> (not res!787746) (not e!673777))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76496 0))(
  ( (array!76497 (arr!36898 (Array (_ BitVec 32) (_ BitVec 64))) (size!37436 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76496)

(assert (=> start!99766 (= res!787746 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37436 _keys!1208))))))

(assert (=> start!99766 e!673777))

(declare-fun tp_is_empty!29881 () Bool)

(assert (=> start!99766 tp_is_empty!29881))

(declare-fun array_inv!28274 (array!76496) Bool)

(assert (=> start!99766 (array_inv!28274 _keys!1208)))

(assert (=> start!99766 true))

(assert (=> start!99766 tp!88767))

(declare-datatypes ((V!44969 0))(
  ( (V!44970 (val!14997 Int)) )
))
(declare-datatypes ((ValueCell!14231 0))(
  ( (ValueCellFull!14231 (v!17634 V!44969)) (EmptyCell!14231) )
))
(declare-datatypes ((array!76498 0))(
  ( (array!76499 (arr!36899 (Array (_ BitVec 32) ValueCell!14231)) (size!37437 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76498)

(declare-fun e!673779 () Bool)

(declare-fun array_inv!28275 (array!76498) Bool)

(assert (=> start!99766 (and (array_inv!28275 _values!996) e!673779)))

(declare-fun b!1185043 () Bool)

(declare-fun e!673769 () Bool)

(assert (=> b!1185043 (= e!673769 tp_is_empty!29881)))

(declare-fun b!1185044 () Bool)

(declare-datatypes ((Unit!39128 0))(
  ( (Unit!39129) )
))
(declare-fun e!673772 () Unit!39128)

(declare-fun Unit!39130 () Unit!39128)

(assert (=> b!1185044 (= e!673772 Unit!39130)))

(declare-fun b!1185045 () Bool)

(declare-fun e!673771 () Bool)

(declare-fun e!673776 () Bool)

(assert (=> b!1185045 (= e!673771 (not e!673776))))

(declare-fun res!787742 () Bool)

(assert (=> b!1185045 (=> res!787742 e!673776)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1185045 (= res!787742 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185045 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!537564 () Unit!39128)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76496 (_ BitVec 64) (_ BitVec 32)) Unit!39128)

(assert (=> b!1185045 (= lt!537564 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185046 () Bool)

(declare-fun Unit!39131 () Unit!39128)

(assert (=> b!1185046 (= e!673772 Unit!39131)))

(declare-fun lt!537572 () Unit!39128)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76496 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39128)

(assert (=> b!1185046 (= lt!537572 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1185046 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537567 () Unit!39128)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76496 (_ BitVec 32) (_ BitVec 32)) Unit!39128)

(assert (=> b!1185046 (= lt!537567 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26061 0))(
  ( (Nil!26058) (Cons!26057 (h!27266 (_ BitVec 64)) (t!38395 List!26061)) )
))
(declare-fun arrayNoDuplicates!0 (array!76496 (_ BitVec 32) List!26061) Bool)

(assert (=> b!1185046 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26058)))

(declare-fun lt!537580 () Unit!39128)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76496 (_ BitVec 64) (_ BitVec 32) List!26061) Unit!39128)

(assert (=> b!1185046 (= lt!537580 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26058))))

(assert (=> b!1185046 false))

(declare-fun b!1185047 () Bool)

(declare-fun e!673770 () Bool)

(declare-fun mapRes!46649 () Bool)

(assert (=> b!1185047 (= e!673779 (and e!673770 mapRes!46649))))

(declare-fun condMapEmpty!46649 () Bool)

(declare-fun mapDefault!46649 () ValueCell!14231)

(assert (=> b!1185047 (= condMapEmpty!46649 (= (arr!36899 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14231)) mapDefault!46649)))))

(declare-fun mapIsEmpty!46649 () Bool)

(assert (=> mapIsEmpty!46649 mapRes!46649))

(declare-fun b!1185048 () Bool)

(declare-fun e!673775 () Bool)

(assert (=> b!1185048 (= e!673775 true)))

(declare-datatypes ((tuple2!19350 0))(
  ( (tuple2!19351 (_1!9686 (_ BitVec 64)) (_2!9686 V!44969)) )
))
(declare-datatypes ((List!26062 0))(
  ( (Nil!26059) (Cons!26058 (h!27267 tuple2!19350) (t!38396 List!26062)) )
))
(declare-datatypes ((ListLongMap!17319 0))(
  ( (ListLongMap!17320 (toList!8675 List!26062)) )
))
(declare-fun lt!537578 () ListLongMap!17319)

(declare-fun lt!537579 () ListLongMap!17319)

(declare-fun -!1629 (ListLongMap!17319 (_ BitVec 64)) ListLongMap!17319)

(assert (=> b!1185048 (= (-!1629 lt!537578 k0!934) lt!537579)))

(declare-fun lt!537566 () Unit!39128)

(declare-fun lt!537576 () V!44969)

(declare-fun lt!537570 () ListLongMap!17319)

(declare-fun addRemoveCommutativeForDiffKeys!172 (ListLongMap!17319 (_ BitVec 64) V!44969 (_ BitVec 64)) Unit!39128)

(assert (=> b!1185048 (= lt!537566 (addRemoveCommutativeForDiffKeys!172 lt!537570 (select (arr!36898 _keys!1208) from!1455) lt!537576 k0!934))))

(declare-fun lt!537582 () ListLongMap!17319)

(declare-fun lt!537569 () ListLongMap!17319)

(declare-fun lt!537577 () ListLongMap!17319)

(assert (=> b!1185048 (and (= lt!537577 lt!537578) (= lt!537582 lt!537569))))

(declare-fun lt!537573 () tuple2!19350)

(declare-fun +!3958 (ListLongMap!17319 tuple2!19350) ListLongMap!17319)

(assert (=> b!1185048 (= lt!537578 (+!3958 lt!537570 lt!537573))))

(assert (=> b!1185048 (not (= (select (arr!36898 _keys!1208) from!1455) k0!934))))

(declare-fun lt!537568 () Unit!39128)

(assert (=> b!1185048 (= lt!537568 e!673772)))

(declare-fun c!117124 () Bool)

(assert (=> b!1185048 (= c!117124 (= (select (arr!36898 _keys!1208) from!1455) k0!934))))

(declare-fun e!673773 () Bool)

(assert (=> b!1185048 e!673773))

(declare-fun res!787739 () Bool)

(assert (=> b!1185048 (=> (not res!787739) (not e!673773))))

(declare-fun lt!537574 () ListLongMap!17319)

(assert (=> b!1185048 (= res!787739 (= lt!537574 lt!537579))))

(assert (=> b!1185048 (= lt!537579 (+!3958 lt!537582 lt!537573))))

(assert (=> b!1185048 (= lt!537573 (tuple2!19351 (select (arr!36898 _keys!1208) from!1455) lt!537576))))

(declare-fun lt!537565 () V!44969)

(declare-fun get!18897 (ValueCell!14231 V!44969) V!44969)

(assert (=> b!1185048 (= lt!537576 (get!18897 (select (arr!36899 _values!996) from!1455) lt!537565))))

(declare-fun b!1185049 () Bool)

(assert (=> b!1185049 (= e!673777 e!673771)))

(declare-fun res!787737 () Bool)

(assert (=> b!1185049 (=> (not res!787737) (not e!673771))))

(declare-fun lt!537571 () array!76496)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76496 (_ BitVec 32)) Bool)

(assert (=> b!1185049 (= res!787737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537571 mask!1564))))

(assert (=> b!1185049 (= lt!537571 (array!76497 (store (arr!36898 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37436 _keys!1208)))))

(declare-fun b!1185050 () Bool)

(declare-fun res!787733 () Bool)

(assert (=> b!1185050 (=> (not res!787733) (not e!673777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185050 (= res!787733 (validMask!0 mask!1564))))

(declare-fun b!1185051 () Bool)

(declare-fun e!673778 () Bool)

(assert (=> b!1185051 (= e!673778 e!673775)))

(declare-fun res!787744 () Bool)

(assert (=> b!1185051 (=> res!787744 e!673775)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185051 (= res!787744 (not (validKeyInArray!0 (select (arr!36898 _keys!1208) from!1455))))))

(assert (=> b!1185051 (= lt!537569 lt!537582)))

(assert (=> b!1185051 (= lt!537582 (-!1629 lt!537570 k0!934))))

(declare-fun zeroValue!944 () V!44969)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44969)

(declare-fun lt!537575 () array!76498)

(declare-fun getCurrentListMapNoExtraKeys!5128 (array!76496 array!76498 (_ BitVec 32) (_ BitVec 32) V!44969 V!44969 (_ BitVec 32) Int) ListLongMap!17319)

(assert (=> b!1185051 (= lt!537569 (getCurrentListMapNoExtraKeys!5128 lt!537571 lt!537575 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1185051 (= lt!537570 (getCurrentListMapNoExtraKeys!5128 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!537581 () Unit!39128)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!887 (array!76496 array!76498 (_ BitVec 32) (_ BitVec 32) V!44969 V!44969 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39128)

(assert (=> b!1185051 (= lt!537581 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!887 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1185052 () Bool)

(declare-fun res!787741 () Bool)

(assert (=> b!1185052 (=> (not res!787741) (not e!673777))))

(assert (=> b!1185052 (= res!787741 (= (select (arr!36898 _keys!1208) i!673) k0!934))))

(declare-fun b!1185053 () Bool)

(declare-fun res!787743 () Bool)

(assert (=> b!1185053 (=> (not res!787743) (not e!673771))))

(assert (=> b!1185053 (= res!787743 (arrayNoDuplicates!0 lt!537571 #b00000000000000000000000000000000 Nil!26058))))

(declare-fun b!1185054 () Bool)

(declare-fun res!787740 () Bool)

(assert (=> b!1185054 (=> (not res!787740) (not e!673777))))

(assert (=> b!1185054 (= res!787740 (validKeyInArray!0 k0!934))))

(declare-fun b!1185055 () Bool)

(assert (=> b!1185055 (= e!673770 tp_is_empty!29881)))

(declare-fun b!1185056 () Bool)

(declare-fun res!787735 () Bool)

(assert (=> b!1185056 (=> (not res!787735) (not e!673777))))

(assert (=> b!1185056 (= res!787735 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37436 _keys!1208))))))

(declare-fun b!1185057 () Bool)

(declare-fun e!673780 () Bool)

(assert (=> b!1185057 (= e!673780 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185058 () Bool)

(declare-fun res!787745 () Bool)

(assert (=> b!1185058 (=> (not res!787745) (not e!673777))))

(assert (=> b!1185058 (= res!787745 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26058))))

(declare-fun b!1185059 () Bool)

(assert (=> b!1185059 (= e!673776 e!673778)))

(declare-fun res!787734 () Bool)

(assert (=> b!1185059 (=> res!787734 e!673778)))

(assert (=> b!1185059 (= res!787734 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1185059 (= lt!537574 (getCurrentListMapNoExtraKeys!5128 lt!537571 lt!537575 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1185059 (= lt!537575 (array!76499 (store (arr!36899 _values!996) i!673 (ValueCellFull!14231 lt!537565)) (size!37437 _values!996)))))

(declare-fun dynLambda!3029 (Int (_ BitVec 64)) V!44969)

(assert (=> b!1185059 (= lt!537565 (dynLambda!3029 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1185059 (= lt!537577 (getCurrentListMapNoExtraKeys!5128 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!46649 () Bool)

(declare-fun tp!88766 () Bool)

(assert (=> mapNonEmpty!46649 (= mapRes!46649 (and tp!88766 e!673769))))

(declare-fun mapValue!46649 () ValueCell!14231)

(declare-fun mapKey!46649 () (_ BitVec 32))

(declare-fun mapRest!46649 () (Array (_ BitVec 32) ValueCell!14231))

(assert (=> mapNonEmpty!46649 (= (arr!36899 _values!996) (store mapRest!46649 mapKey!46649 mapValue!46649))))

(declare-fun b!1185060 () Bool)

(declare-fun res!787747 () Bool)

(assert (=> b!1185060 (=> (not res!787747) (not e!673777))))

(assert (=> b!1185060 (= res!787747 (and (= (size!37437 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37436 _keys!1208) (size!37437 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1185061 () Bool)

(assert (=> b!1185061 (= e!673773 e!673780)))

(declare-fun res!787738 () Bool)

(assert (=> b!1185061 (=> res!787738 e!673780)))

(assert (=> b!1185061 (= res!787738 (not (= (select (arr!36898 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1185062 () Bool)

(declare-fun res!787736 () Bool)

(assert (=> b!1185062 (=> (not res!787736) (not e!673777))))

(assert (=> b!1185062 (= res!787736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99766 res!787746) b!1185050))

(assert (= (and b!1185050 res!787733) b!1185060))

(assert (= (and b!1185060 res!787747) b!1185062))

(assert (= (and b!1185062 res!787736) b!1185058))

(assert (= (and b!1185058 res!787745) b!1185056))

(assert (= (and b!1185056 res!787735) b!1185054))

(assert (= (and b!1185054 res!787740) b!1185052))

(assert (= (and b!1185052 res!787741) b!1185049))

(assert (= (and b!1185049 res!787737) b!1185053))

(assert (= (and b!1185053 res!787743) b!1185045))

(assert (= (and b!1185045 (not res!787742)) b!1185059))

(assert (= (and b!1185059 (not res!787734)) b!1185051))

(assert (= (and b!1185051 (not res!787744)) b!1185048))

(assert (= (and b!1185048 res!787739) b!1185061))

(assert (= (and b!1185061 (not res!787738)) b!1185057))

(assert (= (and b!1185048 c!117124) b!1185046))

(assert (= (and b!1185048 (not c!117124)) b!1185044))

(assert (= (and b!1185047 condMapEmpty!46649) mapIsEmpty!46649))

(assert (= (and b!1185047 (not condMapEmpty!46649)) mapNonEmpty!46649))

(get-info :version)

(assert (= (and mapNonEmpty!46649 ((_ is ValueCellFull!14231) mapValue!46649)) b!1185043))

(assert (= (and b!1185047 ((_ is ValueCellFull!14231) mapDefault!46649)) b!1185055))

(assert (= start!99766 b!1185047))

(declare-fun b_lambda!20477 () Bool)

(assert (=> (not b_lambda!20477) (not b!1185059)))

(declare-fun t!38394 () Bool)

(declare-fun tb!10155 () Bool)

(assert (=> (and start!99766 (= defaultEntry!1004 defaultEntry!1004) t!38394) tb!10155))

(declare-fun result!20885 () Bool)

(assert (=> tb!10155 (= result!20885 tp_is_empty!29881)))

(assert (=> b!1185059 t!38394))

(declare-fun b_and!41549 () Bool)

(assert (= b_and!41547 (and (=> t!38394 result!20885) b_and!41549)))

(declare-fun m!1092935 () Bool)

(assert (=> b!1185053 m!1092935))

(declare-fun m!1092937 () Bool)

(assert (=> b!1185061 m!1092937))

(declare-fun m!1092939 () Bool)

(assert (=> b!1185052 m!1092939))

(declare-fun m!1092941 () Bool)

(assert (=> b!1185048 m!1092941))

(declare-fun m!1092943 () Bool)

(assert (=> b!1185048 m!1092943))

(assert (=> b!1185048 m!1092941))

(declare-fun m!1092945 () Bool)

(assert (=> b!1185048 m!1092945))

(assert (=> b!1185048 m!1092937))

(declare-fun m!1092947 () Bool)

(assert (=> b!1185048 m!1092947))

(declare-fun m!1092949 () Bool)

(assert (=> b!1185048 m!1092949))

(declare-fun m!1092951 () Bool)

(assert (=> b!1185048 m!1092951))

(assert (=> b!1185048 m!1092937))

(declare-fun m!1092953 () Bool)

(assert (=> b!1185058 m!1092953))

(declare-fun m!1092955 () Bool)

(assert (=> b!1185057 m!1092955))

(declare-fun m!1092957 () Bool)

(assert (=> b!1185046 m!1092957))

(declare-fun m!1092959 () Bool)

(assert (=> b!1185046 m!1092959))

(declare-fun m!1092961 () Bool)

(assert (=> b!1185046 m!1092961))

(declare-fun m!1092963 () Bool)

(assert (=> b!1185046 m!1092963))

(declare-fun m!1092965 () Bool)

(assert (=> b!1185046 m!1092965))

(declare-fun m!1092967 () Bool)

(assert (=> start!99766 m!1092967))

(declare-fun m!1092969 () Bool)

(assert (=> start!99766 m!1092969))

(declare-fun m!1092971 () Bool)

(assert (=> b!1185049 m!1092971))

(declare-fun m!1092973 () Bool)

(assert (=> b!1185049 m!1092973))

(declare-fun m!1092975 () Bool)

(assert (=> b!1185045 m!1092975))

(declare-fun m!1092977 () Bool)

(assert (=> b!1185045 m!1092977))

(declare-fun m!1092979 () Bool)

(assert (=> b!1185051 m!1092979))

(declare-fun m!1092981 () Bool)

(assert (=> b!1185051 m!1092981))

(assert (=> b!1185051 m!1092937))

(declare-fun m!1092983 () Bool)

(assert (=> b!1185051 m!1092983))

(assert (=> b!1185051 m!1092937))

(declare-fun m!1092985 () Bool)

(assert (=> b!1185051 m!1092985))

(declare-fun m!1092987 () Bool)

(assert (=> b!1185051 m!1092987))

(declare-fun m!1092989 () Bool)

(assert (=> mapNonEmpty!46649 m!1092989))

(declare-fun m!1092991 () Bool)

(assert (=> b!1185054 m!1092991))

(declare-fun m!1092993 () Bool)

(assert (=> b!1185059 m!1092993))

(declare-fun m!1092995 () Bool)

(assert (=> b!1185059 m!1092995))

(declare-fun m!1092997 () Bool)

(assert (=> b!1185059 m!1092997))

(declare-fun m!1092999 () Bool)

(assert (=> b!1185059 m!1092999))

(declare-fun m!1093001 () Bool)

(assert (=> b!1185062 m!1093001))

(declare-fun m!1093003 () Bool)

(assert (=> b!1185050 m!1093003))

(check-sat (not b!1185050) (not start!99766) (not b!1185057) (not b!1185051) tp_is_empty!29881 (not b!1185059) (not b!1185048) (not b!1185049) (not b!1185053) (not b!1185045) b_and!41549 (not b!1185054) (not b!1185062) (not b!1185058) (not mapNonEmpty!46649) (not b!1185046) (not b_lambda!20477) (not b_next!25351))
(check-sat b_and!41549 (not b_next!25351))
