; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99472 () Bool)

(assert start!99472)

(declare-fun b_free!25057 () Bool)

(declare-fun b_next!25057 () Bool)

(assert (=> start!99472 (= b_free!25057 (not b_next!25057))))

(declare-fun tp!87885 () Bool)

(declare-fun b_and!40959 () Bool)

(assert (=> start!99472 (= tp!87885 b_and!40959)))

(declare-fun b!1175587 () Bool)

(declare-fun e!668227 () Bool)

(assert (=> b!1175587 (= e!668227 true)))

(declare-datatypes ((array!75914 0))(
  ( (array!75915 (arr!36607 (Array (_ BitVec 32) (_ BitVec 64))) (size!37145 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75914)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1175587 (not (= (select (arr!36607 _keys!1208) from!1455) k0!934))))

(declare-datatypes ((Unit!38637 0))(
  ( (Unit!38638) )
))
(declare-fun lt!530282 () Unit!38637)

(declare-fun e!668236 () Unit!38637)

(assert (=> b!1175587 (= lt!530282 e!668236)))

(declare-fun c!116683 () Bool)

(assert (=> b!1175587 (= c!116683 (= (select (arr!36607 _keys!1208) from!1455) k0!934))))

(declare-fun e!668229 () Bool)

(assert (=> b!1175587 e!668229))

(declare-fun res!780777 () Bool)

(assert (=> b!1175587 (=> (not res!780777) (not e!668229))))

(declare-datatypes ((V!44577 0))(
  ( (V!44578 (val!14850 Int)) )
))
(declare-fun lt!530276 () V!44577)

(declare-datatypes ((tuple2!19090 0))(
  ( (tuple2!19091 (_1!9556 (_ BitVec 64)) (_2!9556 V!44577)) )
))
(declare-datatypes ((List!25802 0))(
  ( (Nil!25799) (Cons!25798 (h!27007 tuple2!19090) (t!37842 List!25802)) )
))
(declare-datatypes ((ListLongMap!17059 0))(
  ( (ListLongMap!17060 (toList!8545 List!25802)) )
))
(declare-fun lt!530278 () ListLongMap!17059)

(declare-datatypes ((ValueCell!14084 0))(
  ( (ValueCellFull!14084 (v!17487 V!44577)) (EmptyCell!14084) )
))
(declare-datatypes ((array!75916 0))(
  ( (array!75917 (arr!36608 (Array (_ BitVec 32) ValueCell!14084)) (size!37146 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75916)

(declare-fun lt!530273 () ListLongMap!17059)

(declare-fun +!3851 (ListLongMap!17059 tuple2!19090) ListLongMap!17059)

(declare-fun get!18703 (ValueCell!14084 V!44577) V!44577)

(assert (=> b!1175587 (= res!780777 (= lt!530278 (+!3851 lt!530273 (tuple2!19091 (select (arr!36607 _keys!1208) from!1455) (get!18703 (select (arr!36608 _values!996) from!1455) lt!530276)))))))

(declare-fun b!1175588 () Bool)

(declare-fun res!780783 () Bool)

(declare-fun e!668226 () Bool)

(assert (=> b!1175588 (=> (not res!780783) (not e!668226))))

(declare-datatypes ((List!25803 0))(
  ( (Nil!25800) (Cons!25799 (h!27008 (_ BitVec 64)) (t!37843 List!25803)) )
))
(declare-fun arrayNoDuplicates!0 (array!75914 (_ BitVec 32) List!25803) Bool)

(assert (=> b!1175588 (= res!780783 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25800))))

(declare-fun mapNonEmpty!46208 () Bool)

(declare-fun mapRes!46208 () Bool)

(declare-fun tp!87884 () Bool)

(declare-fun e!668232 () Bool)

(assert (=> mapNonEmpty!46208 (= mapRes!46208 (and tp!87884 e!668232))))

(declare-fun mapKey!46208 () (_ BitVec 32))

(declare-fun mapRest!46208 () (Array (_ BitVec 32) ValueCell!14084))

(declare-fun mapValue!46208 () ValueCell!14084)

(assert (=> mapNonEmpty!46208 (= (arr!36608 _values!996) (store mapRest!46208 mapKey!46208 mapValue!46208))))

(declare-fun b!1175589 () Bool)

(declare-fun Unit!38639 () Unit!38637)

(assert (=> b!1175589 (= e!668236 Unit!38639)))

(declare-fun b!1175590 () Bool)

(declare-fun e!668234 () Bool)

(declare-fun tp_is_empty!29587 () Bool)

(assert (=> b!1175590 (= e!668234 tp_is_empty!29587)))

(declare-fun res!780789 () Bool)

(assert (=> start!99472 (=> (not res!780789) (not e!668226))))

(assert (=> start!99472 (= res!780789 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37145 _keys!1208))))))

(assert (=> start!99472 e!668226))

(assert (=> start!99472 tp_is_empty!29587))

(declare-fun array_inv!28070 (array!75914) Bool)

(assert (=> start!99472 (array_inv!28070 _keys!1208)))

(assert (=> start!99472 true))

(assert (=> start!99472 tp!87885))

(declare-fun e!668233 () Bool)

(declare-fun array_inv!28071 (array!75916) Bool)

(assert (=> start!99472 (and (array_inv!28071 _values!996) e!668233)))

(declare-fun b!1175591 () Bool)

(declare-fun e!668225 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!75914 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175591 (= e!668225 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175592 () Bool)

(declare-fun e!668231 () Bool)

(declare-fun e!668228 () Bool)

(assert (=> b!1175592 (= e!668231 (not e!668228))))

(declare-fun res!780788 () Bool)

(assert (=> b!1175592 (=> res!780788 e!668228)))

(assert (=> b!1175592 (= res!780788 (bvsgt from!1455 i!673))))

(assert (=> b!1175592 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530284 () Unit!38637)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75914 (_ BitVec 64) (_ BitVec 32)) Unit!38637)

(assert (=> b!1175592 (= lt!530284 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175593 () Bool)

(declare-fun e!668230 () Bool)

(assert (=> b!1175593 (= e!668228 e!668230)))

(declare-fun res!780778 () Bool)

(assert (=> b!1175593 (=> res!780778 e!668230)))

(assert (=> b!1175593 (= res!780778 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44577)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!530275 () array!75914)

(declare-fun minValue!944 () V!44577)

(declare-fun lt!530274 () array!75916)

(declare-fun getCurrentListMapNoExtraKeys!5015 (array!75914 array!75916 (_ BitVec 32) (_ BitVec 32) V!44577 V!44577 (_ BitVec 32) Int) ListLongMap!17059)

(assert (=> b!1175593 (= lt!530278 (getCurrentListMapNoExtraKeys!5015 lt!530275 lt!530274 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1175593 (= lt!530274 (array!75917 (store (arr!36608 _values!996) i!673 (ValueCellFull!14084 lt!530276)) (size!37146 _values!996)))))

(declare-fun dynLambda!2932 (Int (_ BitVec 64)) V!44577)

(assert (=> b!1175593 (= lt!530276 (dynLambda!2932 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530277 () ListLongMap!17059)

(assert (=> b!1175593 (= lt!530277 (getCurrentListMapNoExtraKeys!5015 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1175594 () Bool)

(assert (=> b!1175594 (= e!668230 e!668227)))

(declare-fun res!780776 () Bool)

(assert (=> b!1175594 (=> res!780776 e!668227)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1175594 (= res!780776 (not (validKeyInArray!0 (select (arr!36607 _keys!1208) from!1455))))))

(declare-fun lt!530281 () ListLongMap!17059)

(assert (=> b!1175594 (= lt!530281 lt!530273)))

(declare-fun lt!530283 () ListLongMap!17059)

(declare-fun -!1528 (ListLongMap!17059 (_ BitVec 64)) ListLongMap!17059)

(assert (=> b!1175594 (= lt!530273 (-!1528 lt!530283 k0!934))))

(assert (=> b!1175594 (= lt!530281 (getCurrentListMapNoExtraKeys!5015 lt!530275 lt!530274 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1175594 (= lt!530283 (getCurrentListMapNoExtraKeys!5015 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!530285 () Unit!38637)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!792 (array!75914 array!75916 (_ BitVec 32) (_ BitVec 32) V!44577 V!44577 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38637)

(assert (=> b!1175594 (= lt!530285 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!792 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1175595 () Bool)

(assert (=> b!1175595 (= e!668233 (and e!668234 mapRes!46208))))

(declare-fun condMapEmpty!46208 () Bool)

(declare-fun mapDefault!46208 () ValueCell!14084)

(assert (=> b!1175595 (= condMapEmpty!46208 (= (arr!36608 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14084)) mapDefault!46208)))))

(declare-fun mapIsEmpty!46208 () Bool)

(assert (=> mapIsEmpty!46208 mapRes!46208))

(declare-fun b!1175596 () Bool)

(assert (=> b!1175596 (= e!668229 e!668225)))

(declare-fun res!780787 () Bool)

(assert (=> b!1175596 (=> res!780787 e!668225)))

(assert (=> b!1175596 (= res!780787 (not (= (select (arr!36607 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1175597 () Bool)

(assert (=> b!1175597 (= e!668232 tp_is_empty!29587)))

(declare-fun b!1175598 () Bool)

(declare-fun res!780786 () Bool)

(assert (=> b!1175598 (=> (not res!780786) (not e!668226))))

(assert (=> b!1175598 (= res!780786 (= (select (arr!36607 _keys!1208) i!673) k0!934))))

(declare-fun b!1175599 () Bool)

(declare-fun res!780780 () Bool)

(assert (=> b!1175599 (=> (not res!780780) (not e!668231))))

(assert (=> b!1175599 (= res!780780 (arrayNoDuplicates!0 lt!530275 #b00000000000000000000000000000000 Nil!25800))))

(declare-fun b!1175600 () Bool)

(declare-fun res!780781 () Bool)

(assert (=> b!1175600 (=> (not res!780781) (not e!668226))))

(assert (=> b!1175600 (= res!780781 (validKeyInArray!0 k0!934))))

(declare-fun b!1175601 () Bool)

(declare-fun res!780784 () Bool)

(assert (=> b!1175601 (=> (not res!780784) (not e!668226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75914 (_ BitVec 32)) Bool)

(assert (=> b!1175601 (= res!780784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1175602 () Bool)

(declare-fun res!780785 () Bool)

(assert (=> b!1175602 (=> (not res!780785) (not e!668226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1175602 (= res!780785 (validMask!0 mask!1564))))

(declare-fun b!1175603 () Bool)

(declare-fun Unit!38640 () Unit!38637)

(assert (=> b!1175603 (= e!668236 Unit!38640)))

(declare-fun lt!530279 () Unit!38637)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75914 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38637)

(assert (=> b!1175603 (= lt!530279 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1175603 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530286 () Unit!38637)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75914 (_ BitVec 32) (_ BitVec 32)) Unit!38637)

(assert (=> b!1175603 (= lt!530286 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1175603 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25800)))

(declare-fun lt!530280 () Unit!38637)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75914 (_ BitVec 64) (_ BitVec 32) List!25803) Unit!38637)

(assert (=> b!1175603 (= lt!530280 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25800))))

(assert (=> b!1175603 false))

(declare-fun b!1175604 () Bool)

(declare-fun res!780779 () Bool)

(assert (=> b!1175604 (=> (not res!780779) (not e!668226))))

(assert (=> b!1175604 (= res!780779 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37145 _keys!1208))))))

(declare-fun b!1175605 () Bool)

(declare-fun res!780782 () Bool)

(assert (=> b!1175605 (=> (not res!780782) (not e!668226))))

(assert (=> b!1175605 (= res!780782 (and (= (size!37146 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37145 _keys!1208) (size!37146 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1175606 () Bool)

(assert (=> b!1175606 (= e!668226 e!668231)))

(declare-fun res!780790 () Bool)

(assert (=> b!1175606 (=> (not res!780790) (not e!668231))))

(assert (=> b!1175606 (= res!780790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530275 mask!1564))))

(assert (=> b!1175606 (= lt!530275 (array!75915 (store (arr!36607 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37145 _keys!1208)))))

(assert (= (and start!99472 res!780789) b!1175602))

(assert (= (and b!1175602 res!780785) b!1175605))

(assert (= (and b!1175605 res!780782) b!1175601))

(assert (= (and b!1175601 res!780784) b!1175588))

(assert (= (and b!1175588 res!780783) b!1175604))

(assert (= (and b!1175604 res!780779) b!1175600))

(assert (= (and b!1175600 res!780781) b!1175598))

(assert (= (and b!1175598 res!780786) b!1175606))

(assert (= (and b!1175606 res!780790) b!1175599))

(assert (= (and b!1175599 res!780780) b!1175592))

(assert (= (and b!1175592 (not res!780788)) b!1175593))

(assert (= (and b!1175593 (not res!780778)) b!1175594))

(assert (= (and b!1175594 (not res!780776)) b!1175587))

(assert (= (and b!1175587 res!780777) b!1175596))

(assert (= (and b!1175596 (not res!780787)) b!1175591))

(assert (= (and b!1175587 c!116683) b!1175603))

(assert (= (and b!1175587 (not c!116683)) b!1175589))

(assert (= (and b!1175595 condMapEmpty!46208) mapIsEmpty!46208))

(assert (= (and b!1175595 (not condMapEmpty!46208)) mapNonEmpty!46208))

(get-info :version)

(assert (= (and mapNonEmpty!46208 ((_ is ValueCellFull!14084) mapValue!46208)) b!1175597))

(assert (= (and b!1175595 ((_ is ValueCellFull!14084) mapDefault!46208)) b!1175590))

(assert (= start!99472 b!1175595))

(declare-fun b_lambda!20183 () Bool)

(assert (=> (not b_lambda!20183) (not b!1175593)))

(declare-fun t!37841 () Bool)

(declare-fun tb!9861 () Bool)

(assert (=> (and start!99472 (= defaultEntry!1004 defaultEntry!1004) t!37841) tb!9861))

(declare-fun result!20297 () Bool)

(assert (=> tb!9861 (= result!20297 tp_is_empty!29587)))

(assert (=> b!1175593 t!37841))

(declare-fun b_and!40961 () Bool)

(assert (= b_and!40959 (and (=> t!37841 result!20297) b_and!40961)))

(declare-fun m!1083017 () Bool)

(assert (=> mapNonEmpty!46208 m!1083017))

(declare-fun m!1083019 () Bool)

(assert (=> b!1175603 m!1083019))

(declare-fun m!1083021 () Bool)

(assert (=> b!1175603 m!1083021))

(declare-fun m!1083023 () Bool)

(assert (=> b!1175603 m!1083023))

(declare-fun m!1083025 () Bool)

(assert (=> b!1175603 m!1083025))

(declare-fun m!1083027 () Bool)

(assert (=> b!1175603 m!1083027))

(declare-fun m!1083029 () Bool)

(assert (=> b!1175599 m!1083029))

(declare-fun m!1083031 () Bool)

(assert (=> b!1175598 m!1083031))

(declare-fun m!1083033 () Bool)

(assert (=> b!1175592 m!1083033))

(declare-fun m!1083035 () Bool)

(assert (=> b!1175592 m!1083035))

(declare-fun m!1083037 () Bool)

(assert (=> b!1175606 m!1083037))

(declare-fun m!1083039 () Bool)

(assert (=> b!1175606 m!1083039))

(declare-fun m!1083041 () Bool)

(assert (=> b!1175602 m!1083041))

(declare-fun m!1083043 () Bool)

(assert (=> b!1175594 m!1083043))

(declare-fun m!1083045 () Bool)

(assert (=> b!1175594 m!1083045))

(declare-fun m!1083047 () Bool)

(assert (=> b!1175594 m!1083047))

(declare-fun m!1083049 () Bool)

(assert (=> b!1175594 m!1083049))

(declare-fun m!1083051 () Bool)

(assert (=> b!1175594 m!1083051))

(declare-fun m!1083053 () Bool)

(assert (=> b!1175594 m!1083053))

(assert (=> b!1175594 m!1083051))

(declare-fun m!1083055 () Bool)

(assert (=> b!1175601 m!1083055))

(declare-fun m!1083057 () Bool)

(assert (=> b!1175591 m!1083057))

(assert (=> b!1175596 m!1083051))

(declare-fun m!1083059 () Bool)

(assert (=> b!1175588 m!1083059))

(assert (=> b!1175587 m!1083051))

(declare-fun m!1083061 () Bool)

(assert (=> b!1175587 m!1083061))

(assert (=> b!1175587 m!1083061))

(declare-fun m!1083063 () Bool)

(assert (=> b!1175587 m!1083063))

(declare-fun m!1083065 () Bool)

(assert (=> b!1175587 m!1083065))

(declare-fun m!1083067 () Bool)

(assert (=> start!99472 m!1083067))

(declare-fun m!1083069 () Bool)

(assert (=> start!99472 m!1083069))

(declare-fun m!1083071 () Bool)

(assert (=> b!1175600 m!1083071))

(declare-fun m!1083073 () Bool)

(assert (=> b!1175593 m!1083073))

(declare-fun m!1083075 () Bool)

(assert (=> b!1175593 m!1083075))

(declare-fun m!1083077 () Bool)

(assert (=> b!1175593 m!1083077))

(declare-fun m!1083079 () Bool)

(assert (=> b!1175593 m!1083079))

(check-sat (not b!1175601) (not mapNonEmpty!46208) (not b!1175592) tp_is_empty!29587 (not b!1175600) (not b!1175587) (not b!1175599) (not b!1175603) (not start!99472) (not b!1175593) (not b!1175606) (not b_lambda!20183) (not b_next!25057) (not b!1175588) b_and!40961 (not b!1175591) (not b!1175602) (not b!1175594))
(check-sat b_and!40961 (not b_next!25057))
