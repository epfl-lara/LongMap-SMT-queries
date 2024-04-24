; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99552 () Bool)

(assert start!99552)

(declare-fun b_free!24895 () Bool)

(declare-fun b_next!24895 () Bool)

(assert (=> start!99552 (= b_free!24895 (not b_next!24895))))

(declare-fun tp!87399 () Bool)

(declare-fun b_and!40659 () Bool)

(assert (=> start!99552 (= tp!87399 b_and!40659)))

(declare-fun b!1171832 () Bool)

(declare-fun e!666148 () Bool)

(declare-fun e!666138 () Bool)

(assert (=> b!1171832 (= e!666148 e!666138)))

(declare-fun res!777367 () Bool)

(assert (=> b!1171832 (=> res!777367 e!666138)))

(declare-datatypes ((array!75719 0))(
  ( (array!75720 (arr!36503 (Array (_ BitVec 32) (_ BitVec 64))) (size!37040 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75719)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1171832 (= res!777367 (not (validKeyInArray!0 (select (arr!36503 _keys!1208) from!1455))))))

(declare-datatypes ((V!44361 0))(
  ( (V!44362 (val!14769 Int)) )
))
(declare-datatypes ((tuple2!18894 0))(
  ( (tuple2!18895 (_1!9458 (_ BitVec 64)) (_2!9458 V!44361)) )
))
(declare-datatypes ((List!25628 0))(
  ( (Nil!25625) (Cons!25624 (h!26842 tuple2!18894) (t!37507 List!25628)) )
))
(declare-datatypes ((ListLongMap!16871 0))(
  ( (ListLongMap!16872 (toList!8451 List!25628)) )
))
(declare-fun lt!527678 () ListLongMap!16871)

(declare-fun lt!527680 () ListLongMap!16871)

(assert (=> b!1171832 (= lt!527678 lt!527680)))

(declare-fun lt!527676 () ListLongMap!16871)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1506 (ListLongMap!16871 (_ BitVec 64)) ListLongMap!16871)

(assert (=> b!1171832 (= lt!527680 (-!1506 lt!527676 k0!934))))

(declare-fun zeroValue!944 () V!44361)

(declare-fun lt!527684 () array!75719)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14003 0))(
  ( (ValueCellFull!14003 (v!17403 V!44361)) (EmptyCell!14003) )
))
(declare-datatypes ((array!75721 0))(
  ( (array!75722 (arr!36504 (Array (_ BitVec 32) ValueCell!14003)) (size!37041 (_ BitVec 32))) )
))
(declare-fun lt!527683 () array!75721)

(declare-fun minValue!944 () V!44361)

(declare-fun getCurrentListMapNoExtraKeys!4938 (array!75719 array!75721 (_ BitVec 32) (_ BitVec 32) V!44361 V!44361 (_ BitVec 32) Int) ListLongMap!16871)

(assert (=> b!1171832 (= lt!527678 (getCurrentListMapNoExtraKeys!4938 lt!527684 lt!527683 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75721)

(assert (=> b!1171832 (= lt!527676 (getCurrentListMapNoExtraKeys!4938 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38589 0))(
  ( (Unit!38590) )
))
(declare-fun lt!527677 () Unit!38589)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!731 (array!75719 array!75721 (_ BitVec 32) (_ BitVec 32) V!44361 V!44361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38589)

(assert (=> b!1171832 (= lt!527677 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!731 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1171833 () Bool)

(declare-fun res!777375 () Bool)

(declare-fun e!666141 () Bool)

(assert (=> b!1171833 (=> (not res!777375) (not e!666141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75719 (_ BitVec 32)) Bool)

(assert (=> b!1171833 (= res!777375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1171834 () Bool)

(declare-fun e!666144 () Bool)

(declare-fun tp_is_empty!29425 () Bool)

(assert (=> b!1171834 (= e!666144 tp_is_empty!29425)))

(declare-fun b!1171835 () Bool)

(declare-fun res!777368 () Bool)

(assert (=> b!1171835 (=> (not res!777368) (not e!666141))))

(assert (=> b!1171835 (= res!777368 (and (= (size!37041 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37040 _keys!1208) (size!37041 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!777370 () Bool)

(assert (=> start!99552 (=> (not res!777370) (not e!666141))))

(assert (=> start!99552 (= res!777370 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37040 _keys!1208))))))

(assert (=> start!99552 e!666141))

(assert (=> start!99552 tp_is_empty!29425))

(declare-fun array_inv!27972 (array!75719) Bool)

(assert (=> start!99552 (array_inv!27972 _keys!1208)))

(assert (=> start!99552 true))

(assert (=> start!99552 tp!87399))

(declare-fun e!666140 () Bool)

(declare-fun array_inv!27973 (array!75721) Bool)

(assert (=> start!99552 (and (array_inv!27973 _values!996) e!666140)))

(declare-fun b!1171836 () Bool)

(declare-fun e!666147 () Bool)

(assert (=> b!1171836 (= e!666147 true)))

(declare-fun arrayContainsKey!0 (array!75719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1171836 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527681 () Unit!38589)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75719 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38589)

(assert (=> b!1171836 (= lt!527681 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1171837 () Bool)

(declare-fun e!666143 () Bool)

(assert (=> b!1171837 (= e!666143 tp_is_empty!29425)))

(declare-fun b!1171838 () Bool)

(declare-fun res!777378 () Bool)

(assert (=> b!1171838 (=> (not res!777378) (not e!666141))))

(assert (=> b!1171838 (= res!777378 (validKeyInArray!0 k0!934))))

(declare-fun b!1171839 () Bool)

(declare-fun e!666149 () Bool)

(assert (=> b!1171839 (= e!666149 e!666148)))

(declare-fun res!777380 () Bool)

(assert (=> b!1171839 (=> res!777380 e!666148)))

(assert (=> b!1171839 (= res!777380 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!527686 () ListLongMap!16871)

(assert (=> b!1171839 (= lt!527686 (getCurrentListMapNoExtraKeys!4938 lt!527684 lt!527683 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527679 () V!44361)

(assert (=> b!1171839 (= lt!527683 (array!75722 (store (arr!36504 _values!996) i!673 (ValueCellFull!14003 lt!527679)) (size!37041 _values!996)))))

(declare-fun dynLambda!2919 (Int (_ BitVec 64)) V!44361)

(assert (=> b!1171839 (= lt!527679 (dynLambda!2919 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527682 () ListLongMap!16871)

(assert (=> b!1171839 (= lt!527682 (getCurrentListMapNoExtraKeys!4938 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1171840 () Bool)

(declare-fun res!777372 () Bool)

(assert (=> b!1171840 (=> (not res!777372) (not e!666141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1171840 (= res!777372 (validMask!0 mask!1564))))

(declare-fun b!1171841 () Bool)

(assert (=> b!1171841 (= e!666138 e!666147)))

(declare-fun res!777377 () Bool)

(assert (=> b!1171841 (=> res!777377 e!666147)))

(assert (=> b!1171841 (= res!777377 (not (= (select (arr!36503 _keys!1208) from!1455) k0!934)))))

(declare-fun e!666146 () Bool)

(assert (=> b!1171841 e!666146))

(declare-fun res!777366 () Bool)

(assert (=> b!1171841 (=> (not res!777366) (not e!666146))))

(declare-fun +!3790 (ListLongMap!16871 tuple2!18894) ListLongMap!16871)

(declare-fun get!18640 (ValueCell!14003 V!44361) V!44361)

(assert (=> b!1171841 (= res!777366 (= lt!527686 (+!3790 lt!527680 (tuple2!18895 (select (arr!36503 _keys!1208) from!1455) (get!18640 (select (arr!36504 _values!996) from!1455) lt!527679)))))))

(declare-fun b!1171842 () Bool)

(declare-fun e!666145 () Bool)

(assert (=> b!1171842 (= e!666146 e!666145)))

(declare-fun res!777371 () Bool)

(assert (=> b!1171842 (=> res!777371 e!666145)))

(assert (=> b!1171842 (= res!777371 (not (= (select (arr!36503 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1171843 () Bool)

(declare-fun res!777365 () Bool)

(assert (=> b!1171843 (=> (not res!777365) (not e!666141))))

(declare-datatypes ((List!25629 0))(
  ( (Nil!25626) (Cons!25625 (h!26843 (_ BitVec 64)) (t!37508 List!25629)) )
))
(declare-fun arrayNoDuplicates!0 (array!75719 (_ BitVec 32) List!25629) Bool)

(assert (=> b!1171843 (= res!777365 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25626))))

(declare-fun b!1171844 () Bool)

(declare-fun res!777374 () Bool)

(assert (=> b!1171844 (=> (not res!777374) (not e!666141))))

(assert (=> b!1171844 (= res!777374 (= (select (arr!36503 _keys!1208) i!673) k0!934))))

(declare-fun b!1171845 () Bool)

(assert (=> b!1171845 (= e!666145 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171846 () Bool)

(declare-fun res!777376 () Bool)

(assert (=> b!1171846 (=> (not res!777376) (not e!666141))))

(assert (=> b!1171846 (= res!777376 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37040 _keys!1208))))))

(declare-fun b!1171847 () Bool)

(declare-fun mapRes!45965 () Bool)

(assert (=> b!1171847 (= e!666140 (and e!666144 mapRes!45965))))

(declare-fun condMapEmpty!45965 () Bool)

(declare-fun mapDefault!45965 () ValueCell!14003)

(assert (=> b!1171847 (= condMapEmpty!45965 (= (arr!36504 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14003)) mapDefault!45965)))))

(declare-fun b!1171848 () Bool)

(declare-fun e!666139 () Bool)

(assert (=> b!1171848 (= e!666141 e!666139)))

(declare-fun res!777373 () Bool)

(assert (=> b!1171848 (=> (not res!777373) (not e!666139))))

(assert (=> b!1171848 (= res!777373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527684 mask!1564))))

(assert (=> b!1171848 (= lt!527684 (array!75720 (store (arr!36503 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37040 _keys!1208)))))

(declare-fun mapNonEmpty!45965 () Bool)

(declare-fun tp!87398 () Bool)

(assert (=> mapNonEmpty!45965 (= mapRes!45965 (and tp!87398 e!666143))))

(declare-fun mapValue!45965 () ValueCell!14003)

(declare-fun mapKey!45965 () (_ BitVec 32))

(declare-fun mapRest!45965 () (Array (_ BitVec 32) ValueCell!14003))

(assert (=> mapNonEmpty!45965 (= (arr!36504 _values!996) (store mapRest!45965 mapKey!45965 mapValue!45965))))

(declare-fun b!1171849 () Bool)

(declare-fun res!777369 () Bool)

(assert (=> b!1171849 (=> (not res!777369) (not e!666139))))

(assert (=> b!1171849 (= res!777369 (arrayNoDuplicates!0 lt!527684 #b00000000000000000000000000000000 Nil!25626))))

(declare-fun mapIsEmpty!45965 () Bool)

(assert (=> mapIsEmpty!45965 mapRes!45965))

(declare-fun b!1171850 () Bool)

(assert (=> b!1171850 (= e!666139 (not e!666149))))

(declare-fun res!777379 () Bool)

(assert (=> b!1171850 (=> res!777379 e!666149)))

(assert (=> b!1171850 (= res!777379 (bvsgt from!1455 i!673))))

(assert (=> b!1171850 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!527685 () Unit!38589)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75719 (_ BitVec 64) (_ BitVec 32)) Unit!38589)

(assert (=> b!1171850 (= lt!527685 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99552 res!777370) b!1171840))

(assert (= (and b!1171840 res!777372) b!1171835))

(assert (= (and b!1171835 res!777368) b!1171833))

(assert (= (and b!1171833 res!777375) b!1171843))

(assert (= (and b!1171843 res!777365) b!1171846))

(assert (= (and b!1171846 res!777376) b!1171838))

(assert (= (and b!1171838 res!777378) b!1171844))

(assert (= (and b!1171844 res!777374) b!1171848))

(assert (= (and b!1171848 res!777373) b!1171849))

(assert (= (and b!1171849 res!777369) b!1171850))

(assert (= (and b!1171850 (not res!777379)) b!1171839))

(assert (= (and b!1171839 (not res!777380)) b!1171832))

(assert (= (and b!1171832 (not res!777367)) b!1171841))

(assert (= (and b!1171841 res!777366) b!1171842))

(assert (= (and b!1171842 (not res!777371)) b!1171845))

(assert (= (and b!1171841 (not res!777377)) b!1171836))

(assert (= (and b!1171847 condMapEmpty!45965) mapIsEmpty!45965))

(assert (= (and b!1171847 (not condMapEmpty!45965)) mapNonEmpty!45965))

(get-info :version)

(assert (= (and mapNonEmpty!45965 ((_ is ValueCellFull!14003) mapValue!45965)) b!1171837))

(assert (= (and b!1171847 ((_ is ValueCellFull!14003) mapDefault!45965)) b!1171834))

(assert (= start!99552 b!1171847))

(declare-fun b_lambda!20033 () Bool)

(assert (=> (not b_lambda!20033) (not b!1171839)))

(declare-fun t!37506 () Bool)

(declare-fun tb!9699 () Bool)

(assert (=> (and start!99552 (= defaultEntry!1004 defaultEntry!1004) t!37506) tb!9699))

(declare-fun result!19973 () Bool)

(assert (=> tb!9699 (= result!19973 tp_is_empty!29425)))

(assert (=> b!1171839 t!37506))

(declare-fun b_and!40661 () Bool)

(assert (= b_and!40659 (and (=> t!37506 result!19973) b_and!40661)))

(declare-fun m!1079943 () Bool)

(assert (=> b!1171840 m!1079943))

(declare-fun m!1079945 () Bool)

(assert (=> b!1171833 m!1079945))

(declare-fun m!1079947 () Bool)

(assert (=> b!1171845 m!1079947))

(declare-fun m!1079949 () Bool)

(assert (=> b!1171844 m!1079949))

(declare-fun m!1079951 () Bool)

(assert (=> b!1171838 m!1079951))

(declare-fun m!1079953 () Bool)

(assert (=> start!99552 m!1079953))

(declare-fun m!1079955 () Bool)

(assert (=> start!99552 m!1079955))

(declare-fun m!1079957 () Bool)

(assert (=> b!1171839 m!1079957))

(declare-fun m!1079959 () Bool)

(assert (=> b!1171839 m!1079959))

(declare-fun m!1079961 () Bool)

(assert (=> b!1171839 m!1079961))

(declare-fun m!1079963 () Bool)

(assert (=> b!1171839 m!1079963))

(declare-fun m!1079965 () Bool)

(assert (=> b!1171849 m!1079965))

(declare-fun m!1079967 () Bool)

(assert (=> b!1171836 m!1079967))

(declare-fun m!1079969 () Bool)

(assert (=> b!1171836 m!1079969))

(declare-fun m!1079971 () Bool)

(assert (=> b!1171848 m!1079971))

(declare-fun m!1079973 () Bool)

(assert (=> b!1171848 m!1079973))

(declare-fun m!1079975 () Bool)

(assert (=> b!1171841 m!1079975))

(declare-fun m!1079977 () Bool)

(assert (=> b!1171841 m!1079977))

(assert (=> b!1171841 m!1079977))

(declare-fun m!1079979 () Bool)

(assert (=> b!1171841 m!1079979))

(declare-fun m!1079981 () Bool)

(assert (=> b!1171841 m!1079981))

(declare-fun m!1079983 () Bool)

(assert (=> b!1171832 m!1079983))

(declare-fun m!1079985 () Bool)

(assert (=> b!1171832 m!1079985))

(declare-fun m!1079987 () Bool)

(assert (=> b!1171832 m!1079987))

(declare-fun m!1079989 () Bool)

(assert (=> b!1171832 m!1079989))

(assert (=> b!1171832 m!1079975))

(declare-fun m!1079991 () Bool)

(assert (=> b!1171832 m!1079991))

(assert (=> b!1171832 m!1079975))

(declare-fun m!1079993 () Bool)

(assert (=> b!1171850 m!1079993))

(declare-fun m!1079995 () Bool)

(assert (=> b!1171850 m!1079995))

(declare-fun m!1079997 () Bool)

(assert (=> mapNonEmpty!45965 m!1079997))

(assert (=> b!1171842 m!1079975))

(declare-fun m!1079999 () Bool)

(assert (=> b!1171843 m!1079999))

(check-sat (not b_next!24895) (not b!1171838) (not b_lambda!20033) (not b!1171843) (not b!1171832) (not mapNonEmpty!45965) (not start!99552) (not b!1171836) (not b!1171849) (not b!1171850) (not b!1171848) (not b!1171845) (not b!1171840) (not b!1171839) (not b!1171841) b_and!40661 tp_is_empty!29425 (not b!1171833))
(check-sat b_and!40661 (not b_next!24895))
