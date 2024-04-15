; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99478 () Bool)

(assert start!99478)

(declare-fun b_free!25063 () Bool)

(declare-fun b_next!25063 () Bool)

(assert (=> start!99478 (= b_free!25063 (not b_next!25063))))

(declare-fun tp!87903 () Bool)

(declare-fun b_and!40971 () Bool)

(assert (=> start!99478 (= tp!87903 b_and!40971)))

(declare-fun b!1175773 () Bool)

(declare-fun res!780922 () Bool)

(declare-fun e!668336 () Bool)

(assert (=> b!1175773 (=> (not res!780922) (not e!668336))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1175773 (= res!780922 (validKeyInArray!0 k0!934))))

(declare-fun b!1175774 () Bool)

(declare-fun e!668335 () Bool)

(declare-fun e!668339 () Bool)

(assert (=> b!1175774 (= e!668335 e!668339)))

(declare-fun res!780920 () Bool)

(assert (=> b!1175774 (=> res!780920 e!668339)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1175774 (= res!780920 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44585 0))(
  ( (V!44586 (val!14853 Int)) )
))
(declare-fun zeroValue!944 () V!44585)

(declare-datatypes ((array!75926 0))(
  ( (array!75927 (arr!36613 (Array (_ BitVec 32) (_ BitVec 64))) (size!37151 (_ BitVec 32))) )
))
(declare-fun lt!530403 () array!75926)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19096 0))(
  ( (tuple2!19097 (_1!9559 (_ BitVec 64)) (_2!9559 V!44585)) )
))
(declare-datatypes ((List!25807 0))(
  ( (Nil!25804) (Cons!25803 (h!27012 tuple2!19096) (t!37853 List!25807)) )
))
(declare-datatypes ((ListLongMap!17065 0))(
  ( (ListLongMap!17066 (toList!8548 List!25807)) )
))
(declare-fun lt!530410 () ListLongMap!17065)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44585)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14087 0))(
  ( (ValueCellFull!14087 (v!17490 V!44585)) (EmptyCell!14087) )
))
(declare-datatypes ((array!75928 0))(
  ( (array!75929 (arr!36614 (Array (_ BitVec 32) ValueCell!14087)) (size!37152 (_ BitVec 32))) )
))
(declare-fun lt!530399 () array!75928)

(declare-fun getCurrentListMapNoExtraKeys!5017 (array!75926 array!75928 (_ BitVec 32) (_ BitVec 32) V!44585 V!44585 (_ BitVec 32) Int) ListLongMap!17065)

(assert (=> b!1175774 (= lt!530410 (getCurrentListMapNoExtraKeys!5017 lt!530403 lt!530399 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!75928)

(declare-fun lt!530400 () V!44585)

(assert (=> b!1175774 (= lt!530399 (array!75929 (store (arr!36614 _values!996) i!673 (ValueCellFull!14087 lt!530400)) (size!37152 _values!996)))))

(declare-fun dynLambda!2934 (Int (_ BitVec 64)) V!44585)

(assert (=> b!1175774 (= lt!530400 (dynLambda!2934 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!75926)

(declare-fun lt!530404 () ListLongMap!17065)

(assert (=> b!1175774 (= lt!530404 (getCurrentListMapNoExtraKeys!5017 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1175775 () Bool)

(declare-fun e!668343 () Bool)

(declare-fun tp_is_empty!29593 () Bool)

(assert (=> b!1175775 (= e!668343 tp_is_empty!29593)))

(declare-fun b!1175776 () Bool)

(declare-fun e!668342 () Bool)

(assert (=> b!1175776 (= e!668339 e!668342)))

(declare-fun res!780915 () Bool)

(assert (=> b!1175776 (=> res!780915 e!668342)))

(assert (=> b!1175776 (= res!780915 (not (validKeyInArray!0 (select (arr!36613 _keys!1208) from!1455))))))

(declare-fun lt!530401 () ListLongMap!17065)

(declare-fun lt!530411 () ListLongMap!17065)

(assert (=> b!1175776 (= lt!530401 lt!530411)))

(declare-fun lt!530409 () ListLongMap!17065)

(declare-fun -!1529 (ListLongMap!17065 (_ BitVec 64)) ListLongMap!17065)

(assert (=> b!1175776 (= lt!530411 (-!1529 lt!530409 k0!934))))

(assert (=> b!1175776 (= lt!530401 (getCurrentListMapNoExtraKeys!5017 lt!530403 lt!530399 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1175776 (= lt!530409 (getCurrentListMapNoExtraKeys!5017 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38647 0))(
  ( (Unit!38648) )
))
(declare-fun lt!530407 () Unit!38647)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!793 (array!75926 array!75928 (_ BitVec 32) (_ BitVec 32) V!44585 V!44585 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38647)

(assert (=> b!1175776 (= lt!530407 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!793 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46217 () Bool)

(declare-fun mapRes!46217 () Bool)

(assert (=> mapIsEmpty!46217 mapRes!46217))

(declare-fun b!1175777 () Bool)

(declare-fun e!668341 () Bool)

(assert (=> b!1175777 (= e!668341 (not e!668335))))

(declare-fun res!780925 () Bool)

(assert (=> b!1175777 (=> res!780925 e!668335)))

(assert (=> b!1175777 (= res!780925 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75926 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175777 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530408 () Unit!38647)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75926 (_ BitVec 64) (_ BitVec 32)) Unit!38647)

(assert (=> b!1175777 (= lt!530408 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175778 () Bool)

(declare-fun res!780917 () Bool)

(assert (=> b!1175778 (=> (not res!780917) (not e!668336))))

(assert (=> b!1175778 (= res!780917 (= (select (arr!36613 _keys!1208) i!673) k0!934))))

(declare-fun b!1175779 () Bool)

(declare-fun e!668340 () Unit!38647)

(declare-fun Unit!38649 () Unit!38647)

(assert (=> b!1175779 (= e!668340 Unit!38649)))

(declare-fun b!1175780 () Bool)

(declare-fun res!780916 () Bool)

(assert (=> b!1175780 (=> (not res!780916) (not e!668336))))

(assert (=> b!1175780 (= res!780916 (and (= (size!37152 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37151 _keys!1208) (size!37152 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1175781 () Bool)

(declare-fun res!780913 () Bool)

(assert (=> b!1175781 (=> (not res!780913) (not e!668336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75926 (_ BitVec 32)) Bool)

(assert (=> b!1175781 (= res!780913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!780921 () Bool)

(assert (=> start!99478 (=> (not res!780921) (not e!668336))))

(assert (=> start!99478 (= res!780921 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37151 _keys!1208))))))

(assert (=> start!99478 e!668336))

(assert (=> start!99478 tp_is_empty!29593))

(declare-fun array_inv!28072 (array!75926) Bool)

(assert (=> start!99478 (array_inv!28072 _keys!1208)))

(assert (=> start!99478 true))

(assert (=> start!99478 tp!87903))

(declare-fun e!668338 () Bool)

(declare-fun array_inv!28073 (array!75928) Bool)

(assert (=> start!99478 (and (array_inv!28073 _values!996) e!668338)))

(declare-fun b!1175782 () Bool)

(assert (=> b!1175782 (= e!668336 e!668341)))

(declare-fun res!780918 () Bool)

(assert (=> b!1175782 (=> (not res!780918) (not e!668341))))

(assert (=> b!1175782 (= res!780918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530403 mask!1564))))

(assert (=> b!1175782 (= lt!530403 (array!75927 (store (arr!36613 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37151 _keys!1208)))))

(declare-fun b!1175783 () Bool)

(assert (=> b!1175783 (= e!668338 (and e!668343 mapRes!46217))))

(declare-fun condMapEmpty!46217 () Bool)

(declare-fun mapDefault!46217 () ValueCell!14087)

(assert (=> b!1175783 (= condMapEmpty!46217 (= (arr!36614 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14087)) mapDefault!46217)))))

(declare-fun b!1175784 () Bool)

(declare-fun e!668333 () Bool)

(declare-fun e!668337 () Bool)

(assert (=> b!1175784 (= e!668333 e!668337)))

(declare-fun res!780914 () Bool)

(assert (=> b!1175784 (=> res!780914 e!668337)))

(assert (=> b!1175784 (= res!780914 (not (= (select (arr!36613 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1175785 () Bool)

(declare-fun res!780924 () Bool)

(assert (=> b!1175785 (=> (not res!780924) (not e!668341))))

(declare-datatypes ((List!25808 0))(
  ( (Nil!25805) (Cons!25804 (h!27013 (_ BitVec 64)) (t!37854 List!25808)) )
))
(declare-fun arrayNoDuplicates!0 (array!75926 (_ BitVec 32) List!25808) Bool)

(assert (=> b!1175785 (= res!780924 (arrayNoDuplicates!0 lt!530403 #b00000000000000000000000000000000 Nil!25805))))

(declare-fun mapNonEmpty!46217 () Bool)

(declare-fun tp!87902 () Bool)

(declare-fun e!668334 () Bool)

(assert (=> mapNonEmpty!46217 (= mapRes!46217 (and tp!87902 e!668334))))

(declare-fun mapRest!46217 () (Array (_ BitVec 32) ValueCell!14087))

(declare-fun mapKey!46217 () (_ BitVec 32))

(declare-fun mapValue!46217 () ValueCell!14087)

(assert (=> mapNonEmpty!46217 (= (arr!36614 _values!996) (store mapRest!46217 mapKey!46217 mapValue!46217))))

(declare-fun b!1175786 () Bool)

(assert (=> b!1175786 (= e!668337 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175787 () Bool)

(declare-fun res!780912 () Bool)

(assert (=> b!1175787 (=> (not res!780912) (not e!668336))))

(assert (=> b!1175787 (= res!780912 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25805))))

(declare-fun b!1175788 () Bool)

(declare-fun res!780911 () Bool)

(assert (=> b!1175788 (=> (not res!780911) (not e!668336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1175788 (= res!780911 (validMask!0 mask!1564))))

(declare-fun b!1175789 () Bool)

(assert (=> b!1175789 (= e!668342 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37151 _keys!1208))))))

(assert (=> b!1175789 (not (= (select (arr!36613 _keys!1208) from!1455) k0!934))))

(declare-fun lt!530412 () Unit!38647)

(assert (=> b!1175789 (= lt!530412 e!668340)))

(declare-fun c!116692 () Bool)

(assert (=> b!1175789 (= c!116692 (= (select (arr!36613 _keys!1208) from!1455) k0!934))))

(assert (=> b!1175789 e!668333))

(declare-fun res!780919 () Bool)

(assert (=> b!1175789 (=> (not res!780919) (not e!668333))))

(declare-fun +!3853 (ListLongMap!17065 tuple2!19096) ListLongMap!17065)

(declare-fun get!18707 (ValueCell!14087 V!44585) V!44585)

(assert (=> b!1175789 (= res!780919 (= lt!530410 (+!3853 lt!530411 (tuple2!19097 (select (arr!36613 _keys!1208) from!1455) (get!18707 (select (arr!36614 _values!996) from!1455) lt!530400)))))))

(declare-fun b!1175790 () Bool)

(declare-fun Unit!38650 () Unit!38647)

(assert (=> b!1175790 (= e!668340 Unit!38650)))

(declare-fun lt!530406 () Unit!38647)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75926 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38647)

(assert (=> b!1175790 (= lt!530406 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1175790 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530405 () Unit!38647)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75926 (_ BitVec 32) (_ BitVec 32)) Unit!38647)

(assert (=> b!1175790 (= lt!530405 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1175790 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25805)))

(declare-fun lt!530402 () Unit!38647)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75926 (_ BitVec 64) (_ BitVec 32) List!25808) Unit!38647)

(assert (=> b!1175790 (= lt!530402 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25805))))

(assert (=> b!1175790 false))

(declare-fun b!1175791 () Bool)

(declare-fun res!780923 () Bool)

(assert (=> b!1175791 (=> (not res!780923) (not e!668336))))

(assert (=> b!1175791 (= res!780923 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37151 _keys!1208))))))

(declare-fun b!1175792 () Bool)

(assert (=> b!1175792 (= e!668334 tp_is_empty!29593)))

(assert (= (and start!99478 res!780921) b!1175788))

(assert (= (and b!1175788 res!780911) b!1175780))

(assert (= (and b!1175780 res!780916) b!1175781))

(assert (= (and b!1175781 res!780913) b!1175787))

(assert (= (and b!1175787 res!780912) b!1175791))

(assert (= (and b!1175791 res!780923) b!1175773))

(assert (= (and b!1175773 res!780922) b!1175778))

(assert (= (and b!1175778 res!780917) b!1175782))

(assert (= (and b!1175782 res!780918) b!1175785))

(assert (= (and b!1175785 res!780924) b!1175777))

(assert (= (and b!1175777 (not res!780925)) b!1175774))

(assert (= (and b!1175774 (not res!780920)) b!1175776))

(assert (= (and b!1175776 (not res!780915)) b!1175789))

(assert (= (and b!1175789 res!780919) b!1175784))

(assert (= (and b!1175784 (not res!780914)) b!1175786))

(assert (= (and b!1175789 c!116692) b!1175790))

(assert (= (and b!1175789 (not c!116692)) b!1175779))

(assert (= (and b!1175783 condMapEmpty!46217) mapIsEmpty!46217))

(assert (= (and b!1175783 (not condMapEmpty!46217)) mapNonEmpty!46217))

(get-info :version)

(assert (= (and mapNonEmpty!46217 ((_ is ValueCellFull!14087) mapValue!46217)) b!1175792))

(assert (= (and b!1175783 ((_ is ValueCellFull!14087) mapDefault!46217)) b!1175775))

(assert (= start!99478 b!1175783))

(declare-fun b_lambda!20189 () Bool)

(assert (=> (not b_lambda!20189) (not b!1175774)))

(declare-fun t!37852 () Bool)

(declare-fun tb!9867 () Bool)

(assert (=> (and start!99478 (= defaultEntry!1004 defaultEntry!1004) t!37852) tb!9867))

(declare-fun result!20309 () Bool)

(assert (=> tb!9867 (= result!20309 tp_is_empty!29593)))

(assert (=> b!1175774 t!37852))

(declare-fun b_and!40973 () Bool)

(assert (= b_and!40971 (and (=> t!37852 result!20309) b_and!40973)))

(declare-fun m!1083209 () Bool)

(assert (=> b!1175778 m!1083209))

(declare-fun m!1083211 () Bool)

(assert (=> b!1175774 m!1083211))

(declare-fun m!1083213 () Bool)

(assert (=> b!1175774 m!1083213))

(declare-fun m!1083215 () Bool)

(assert (=> b!1175774 m!1083215))

(declare-fun m!1083217 () Bool)

(assert (=> b!1175774 m!1083217))

(declare-fun m!1083219 () Bool)

(assert (=> b!1175786 m!1083219))

(declare-fun m!1083221 () Bool)

(assert (=> mapNonEmpty!46217 m!1083221))

(declare-fun m!1083223 () Bool)

(assert (=> b!1175790 m!1083223))

(declare-fun m!1083225 () Bool)

(assert (=> b!1175790 m!1083225))

(declare-fun m!1083227 () Bool)

(assert (=> b!1175790 m!1083227))

(declare-fun m!1083229 () Bool)

(assert (=> b!1175790 m!1083229))

(declare-fun m!1083231 () Bool)

(assert (=> b!1175790 m!1083231))

(declare-fun m!1083233 () Bool)

(assert (=> b!1175784 m!1083233))

(declare-fun m!1083235 () Bool)

(assert (=> start!99478 m!1083235))

(declare-fun m!1083237 () Bool)

(assert (=> start!99478 m!1083237))

(assert (=> b!1175789 m!1083233))

(declare-fun m!1083239 () Bool)

(assert (=> b!1175789 m!1083239))

(assert (=> b!1175789 m!1083239))

(declare-fun m!1083241 () Bool)

(assert (=> b!1175789 m!1083241))

(declare-fun m!1083243 () Bool)

(assert (=> b!1175789 m!1083243))

(declare-fun m!1083245 () Bool)

(assert (=> b!1175787 m!1083245))

(declare-fun m!1083247 () Bool)

(assert (=> b!1175777 m!1083247))

(declare-fun m!1083249 () Bool)

(assert (=> b!1175777 m!1083249))

(declare-fun m!1083251 () Bool)

(assert (=> b!1175785 m!1083251))

(declare-fun m!1083253 () Bool)

(assert (=> b!1175773 m!1083253))

(declare-fun m!1083255 () Bool)

(assert (=> b!1175788 m!1083255))

(declare-fun m!1083257 () Bool)

(assert (=> b!1175776 m!1083257))

(declare-fun m!1083259 () Bool)

(assert (=> b!1175776 m!1083259))

(declare-fun m!1083261 () Bool)

(assert (=> b!1175776 m!1083261))

(assert (=> b!1175776 m!1083233))

(declare-fun m!1083263 () Bool)

(assert (=> b!1175776 m!1083263))

(declare-fun m!1083265 () Bool)

(assert (=> b!1175776 m!1083265))

(assert (=> b!1175776 m!1083233))

(declare-fun m!1083267 () Bool)

(assert (=> b!1175781 m!1083267))

(declare-fun m!1083269 () Bool)

(assert (=> b!1175782 m!1083269))

(declare-fun m!1083271 () Bool)

(assert (=> b!1175782 m!1083271))

(check-sat (not b!1175788) (not b_next!25063) (not mapNonEmpty!46217) (not b!1175777) (not b!1175787) tp_is_empty!29593 (not b!1175776) (not b!1175773) (not b!1175781) (not b!1175789) (not b!1175774) (not b!1175786) (not b!1175785) (not b!1175782) b_and!40973 (not b!1175790) (not b_lambda!20189) (not start!99478))
(check-sat b_and!40973 (not b_next!25063))
