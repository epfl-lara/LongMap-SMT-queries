; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99744 () Bool)

(assert start!99744)

(declare-fun b_free!25087 () Bool)

(declare-fun b_next!25087 () Bool)

(assert (=> start!99744 (= b_free!25087 (not b_next!25087))))

(declare-fun tp!87975 () Bool)

(declare-fun b_and!41043 () Bool)

(assert (=> start!99744 (= tp!87975 b_and!41043)))

(declare-fun b!1177959 () Bool)

(declare-fun res!782058 () Bool)

(declare-fun e!669706 () Bool)

(assert (=> b!1177959 (=> (not res!782058) (not e!669706))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177959 (= res!782058 (validKeyInArray!0 k0!934))))

(declare-fun b!1177960 () Bool)

(declare-fun res!782063 () Bool)

(assert (=> b!1177960 (=> (not res!782063) (not e!669706))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76089 0))(
  ( (array!76090 (arr!36688 (Array (_ BitVec 32) (_ BitVec 64))) (size!37225 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76089)

(assert (=> b!1177960 (= res!782063 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37225 _keys!1208))))))

(declare-fun b!1177961 () Bool)

(declare-fun e!669715 () Bool)

(declare-fun e!669705 () Bool)

(declare-fun mapRes!46253 () Bool)

(assert (=> b!1177961 (= e!669715 (and e!669705 mapRes!46253))))

(declare-fun condMapEmpty!46253 () Bool)

(declare-datatypes ((V!44617 0))(
  ( (V!44618 (val!14865 Int)) )
))
(declare-datatypes ((ValueCell!14099 0))(
  ( (ValueCellFull!14099 (v!17499 V!44617)) (EmptyCell!14099) )
))
(declare-datatypes ((array!76091 0))(
  ( (array!76092 (arr!36689 (Array (_ BitVec 32) ValueCell!14099)) (size!37226 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76091)

(declare-fun mapDefault!46253 () ValueCell!14099)

(assert (=> b!1177961 (= condMapEmpty!46253 (= (arr!36689 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14099)) mapDefault!46253)))))

(declare-fun b!1177962 () Bool)

(declare-fun e!669714 () Bool)

(declare-fun tp_is_empty!29617 () Bool)

(assert (=> b!1177962 (= e!669714 tp_is_empty!29617)))

(declare-fun mapNonEmpty!46253 () Bool)

(declare-fun tp!87974 () Bool)

(assert (=> mapNonEmpty!46253 (= mapRes!46253 (and tp!87974 e!669714))))

(declare-fun mapKey!46253 () (_ BitVec 32))

(declare-fun mapRest!46253 () (Array (_ BitVec 32) ValueCell!14099))

(declare-fun mapValue!46253 () ValueCell!14099)

(assert (=> mapNonEmpty!46253 (= (arr!36689 _values!996) (store mapRest!46253 mapKey!46253 mapValue!46253))))

(declare-fun res!782066 () Bool)

(assert (=> start!99744 (=> (not res!782066) (not e!669706))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99744 (= res!782066 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37225 _keys!1208))))))

(assert (=> start!99744 e!669706))

(assert (=> start!99744 tp_is_empty!29617))

(declare-fun array_inv!28096 (array!76089) Bool)

(assert (=> start!99744 (array_inv!28096 _keys!1208)))

(assert (=> start!99744 true))

(assert (=> start!99744 tp!87975))

(declare-fun array_inv!28097 (array!76091) Bool)

(assert (=> start!99744 (and (array_inv!28097 _values!996) e!669715)))

(declare-fun b!1177963 () Bool)

(declare-fun res!782065 () Bool)

(assert (=> b!1177963 (=> (not res!782065) (not e!669706))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76089 (_ BitVec 32)) Bool)

(assert (=> b!1177963 (= res!782065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1177964 () Bool)

(declare-fun e!669707 () Bool)

(declare-fun e!669708 () Bool)

(assert (=> b!1177964 (= e!669707 (not e!669708))))

(declare-fun res!782064 () Bool)

(assert (=> b!1177964 (=> res!782064 e!669708)))

(assert (=> b!1177964 (= res!782064 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177964 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38843 0))(
  ( (Unit!38844) )
))
(declare-fun lt!531619 () Unit!38843)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76089 (_ BitVec 64) (_ BitVec 32)) Unit!38843)

(assert (=> b!1177964 (= lt!531619 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177965 () Bool)

(assert (=> b!1177965 (= e!669705 tp_is_empty!29617)))

(declare-fun b!1177966 () Bool)

(declare-fun e!669712 () Unit!38843)

(declare-fun Unit!38845 () Unit!38843)

(assert (=> b!1177966 (= e!669712 Unit!38845)))

(declare-fun b!1177967 () Bool)

(assert (=> b!1177967 (= e!669706 e!669707)))

(declare-fun res!782068 () Bool)

(assert (=> b!1177967 (=> (not res!782068) (not e!669707))))

(declare-fun lt!531621 () array!76089)

(assert (=> b!1177967 (= res!782068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531621 mask!1564))))

(assert (=> b!1177967 (= lt!531621 (array!76090 (store (arr!36688 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37225 _keys!1208)))))

(declare-fun b!1177968 () Bool)

(declare-fun res!782056 () Bool)

(assert (=> b!1177968 (=> (not res!782056) (not e!669707))))

(declare-datatypes ((List!25790 0))(
  ( (Nil!25787) (Cons!25786 (h!27004 (_ BitVec 64)) (t!37861 List!25790)) )
))
(declare-fun arrayNoDuplicates!0 (array!76089 (_ BitVec 32) List!25790) Bool)

(assert (=> b!1177968 (= res!782056 (arrayNoDuplicates!0 lt!531621 #b00000000000000000000000000000000 Nil!25787))))

(declare-datatypes ((tuple2!19058 0))(
  ( (tuple2!19059 (_1!9540 (_ BitVec 64)) (_2!9540 V!44617)) )
))
(declare-datatypes ((List!25791 0))(
  ( (Nil!25788) (Cons!25787 (h!27005 tuple2!19058) (t!37862 List!25791)) )
))
(declare-datatypes ((ListLongMap!17035 0))(
  ( (ListLongMap!17036 (toList!8533 List!25791)) )
))
(declare-fun lt!531614 () ListLongMap!17035)

(declare-fun e!669716 () Bool)

(declare-fun b!1177969 () Bool)

(declare-fun lt!531610 () tuple2!19058)

(declare-fun lt!531613 () ListLongMap!17035)

(declare-fun +!3861 (ListLongMap!17035 tuple2!19058) ListLongMap!17035)

(assert (=> b!1177969 (= e!669716 (= lt!531613 (+!3861 lt!531614 lt!531610)))))

(declare-fun b!1177970 () Bool)

(declare-fun Unit!38846 () Unit!38843)

(assert (=> b!1177970 (= e!669712 Unit!38846)))

(declare-fun lt!531612 () Unit!38843)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76089 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38843)

(assert (=> b!1177970 (= lt!531612 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1177970 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531622 () Unit!38843)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76089 (_ BitVec 32) (_ BitVec 32)) Unit!38843)

(assert (=> b!1177970 (= lt!531622 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1177970 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25787)))

(declare-fun lt!531608 () Unit!38843)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76089 (_ BitVec 64) (_ BitVec 32) List!25790) Unit!38843)

(assert (=> b!1177970 (= lt!531608 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25787))))

(assert (=> b!1177970 false))

(declare-fun b!1177971 () Bool)

(declare-fun e!669704 () Bool)

(declare-fun e!669713 () Bool)

(assert (=> b!1177971 (= e!669704 e!669713)))

(declare-fun res!782062 () Bool)

(assert (=> b!1177971 (=> res!782062 e!669713)))

(assert (=> b!1177971 (= res!782062 (not (= (select (arr!36688 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1177972 () Bool)

(declare-fun res!782067 () Bool)

(assert (=> b!1177972 (=> (not res!782067) (not e!669706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177972 (= res!782067 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46253 () Bool)

(assert (=> mapIsEmpty!46253 mapRes!46253))

(declare-fun b!1177973 () Bool)

(declare-fun e!669711 () Bool)

(assert (=> b!1177973 (= e!669708 e!669711)))

(declare-fun res!782061 () Bool)

(assert (=> b!1177973 (=> res!782061 e!669711)))

(assert (=> b!1177973 (= res!782061 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44617)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!531620 () ListLongMap!17035)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!531616 () array!76091)

(declare-fun minValue!944 () V!44617)

(declare-fun getCurrentListMapNoExtraKeys!5014 (array!76089 array!76091 (_ BitVec 32) (_ BitVec 32) V!44617 V!44617 (_ BitVec 32) Int) ListLongMap!17035)

(assert (=> b!1177973 (= lt!531620 (getCurrentListMapNoExtraKeys!5014 lt!531621 lt!531616 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!531618 () V!44617)

(assert (=> b!1177973 (= lt!531616 (array!76092 (store (arr!36689 _values!996) i!673 (ValueCellFull!14099 lt!531618)) (size!37226 _values!996)))))

(declare-fun dynLambda!2989 (Int (_ BitVec 64)) V!44617)

(assert (=> b!1177973 (= lt!531618 (dynLambda!2989 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1177973 (= lt!531613 (getCurrentListMapNoExtraKeys!5014 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1177974 () Bool)

(declare-fun res!782059 () Bool)

(assert (=> b!1177974 (=> (not res!782059) (not e!669706))))

(assert (=> b!1177974 (= res!782059 (= (select (arr!36688 _keys!1208) i!673) k0!934))))

(declare-fun b!1177975 () Bool)

(declare-fun res!782060 () Bool)

(assert (=> b!1177975 (=> (not res!782060) (not e!669706))))

(assert (=> b!1177975 (= res!782060 (and (= (size!37226 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37225 _keys!1208) (size!37226 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1177976 () Bool)

(declare-fun e!669710 () Bool)

(assert (=> b!1177976 (= e!669711 e!669710)))

(declare-fun res!782055 () Bool)

(assert (=> b!1177976 (=> res!782055 e!669710)))

(assert (=> b!1177976 (= res!782055 (not (validKeyInArray!0 (select (arr!36688 _keys!1208) from!1455))))))

(declare-fun lt!531609 () ListLongMap!17035)

(declare-fun lt!531611 () ListLongMap!17035)

(assert (=> b!1177976 (= lt!531609 lt!531611)))

(declare-fun -!1570 (ListLongMap!17035 (_ BitVec 64)) ListLongMap!17035)

(assert (=> b!1177976 (= lt!531611 (-!1570 lt!531614 k0!934))))

(assert (=> b!1177976 (= lt!531609 (getCurrentListMapNoExtraKeys!5014 lt!531621 lt!531616 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1177976 (= lt!531614 (getCurrentListMapNoExtraKeys!5014 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!531617 () Unit!38843)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!795 (array!76089 array!76091 (_ BitVec 32) (_ BitVec 32) V!44617 V!44617 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38843)

(assert (=> b!1177976 (= lt!531617 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!795 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1177977 () Bool)

(declare-fun res!782069 () Bool)

(assert (=> b!1177977 (=> (not res!782069) (not e!669706))))

(assert (=> b!1177977 (= res!782069 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25787))))

(declare-fun b!1177978 () Bool)

(assert (=> b!1177978 (= e!669713 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177979 () Bool)

(assert (=> b!1177979 (= e!669710 true)))

(assert (=> b!1177979 e!669716))

(declare-fun res!782054 () Bool)

(assert (=> b!1177979 (=> (not res!782054) (not e!669716))))

(assert (=> b!1177979 (= res!782054 (not (= (select (arr!36688 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!531615 () Unit!38843)

(assert (=> b!1177979 (= lt!531615 e!669712)))

(declare-fun c!117152 () Bool)

(assert (=> b!1177979 (= c!117152 (= (select (arr!36688 _keys!1208) from!1455) k0!934))))

(assert (=> b!1177979 e!669704))

(declare-fun res!782057 () Bool)

(assert (=> b!1177979 (=> (not res!782057) (not e!669704))))

(assert (=> b!1177979 (= res!782057 (= lt!531620 (+!3861 lt!531611 lt!531610)))))

(declare-fun get!18775 (ValueCell!14099 V!44617) V!44617)

(assert (=> b!1177979 (= lt!531610 (tuple2!19059 (select (arr!36688 _keys!1208) from!1455) (get!18775 (select (arr!36689 _values!996) from!1455) lt!531618)))))

(assert (= (and start!99744 res!782066) b!1177972))

(assert (= (and b!1177972 res!782067) b!1177975))

(assert (= (and b!1177975 res!782060) b!1177963))

(assert (= (and b!1177963 res!782065) b!1177977))

(assert (= (and b!1177977 res!782069) b!1177960))

(assert (= (and b!1177960 res!782063) b!1177959))

(assert (= (and b!1177959 res!782058) b!1177974))

(assert (= (and b!1177974 res!782059) b!1177967))

(assert (= (and b!1177967 res!782068) b!1177968))

(assert (= (and b!1177968 res!782056) b!1177964))

(assert (= (and b!1177964 (not res!782064)) b!1177973))

(assert (= (and b!1177973 (not res!782061)) b!1177976))

(assert (= (and b!1177976 (not res!782055)) b!1177979))

(assert (= (and b!1177979 res!782057) b!1177971))

(assert (= (and b!1177971 (not res!782062)) b!1177978))

(assert (= (and b!1177979 c!117152) b!1177970))

(assert (= (and b!1177979 (not c!117152)) b!1177966))

(assert (= (and b!1177979 res!782054) b!1177969))

(assert (= (and b!1177961 condMapEmpty!46253) mapIsEmpty!46253))

(assert (= (and b!1177961 (not condMapEmpty!46253)) mapNonEmpty!46253))

(get-info :version)

(assert (= (and mapNonEmpty!46253 ((_ is ValueCellFull!14099) mapValue!46253)) b!1177962))

(assert (= (and b!1177961 ((_ is ValueCellFull!14099) mapDefault!46253)) b!1177965))

(assert (= start!99744 b!1177961))

(declare-fun b_lambda!20225 () Bool)

(assert (=> (not b_lambda!20225) (not b!1177973)))

(declare-fun t!37860 () Bool)

(declare-fun tb!9891 () Bool)

(assert (=> (and start!99744 (= defaultEntry!1004 defaultEntry!1004) t!37860) tb!9891))

(declare-fun result!20357 () Bool)

(assert (=> tb!9891 (= result!20357 tp_is_empty!29617)))

(assert (=> b!1177973 t!37860))

(declare-fun b_and!41045 () Bool)

(assert (= b_and!41043 (and (=> t!37860 result!20357) b_and!41045)))

(declare-fun m!1086177 () Bool)

(assert (=> start!99744 m!1086177))

(declare-fun m!1086179 () Bool)

(assert (=> start!99744 m!1086179))

(declare-fun m!1086181 () Bool)

(assert (=> b!1177967 m!1086181))

(declare-fun m!1086183 () Bool)

(assert (=> b!1177967 m!1086183))

(declare-fun m!1086185 () Bool)

(assert (=> b!1177978 m!1086185))

(declare-fun m!1086187 () Bool)

(assert (=> b!1177973 m!1086187))

(declare-fun m!1086189 () Bool)

(assert (=> b!1177973 m!1086189))

(declare-fun m!1086191 () Bool)

(assert (=> b!1177973 m!1086191))

(declare-fun m!1086193 () Bool)

(assert (=> b!1177973 m!1086193))

(declare-fun m!1086195 () Bool)

(assert (=> b!1177971 m!1086195))

(declare-fun m!1086197 () Bool)

(assert (=> b!1177969 m!1086197))

(declare-fun m!1086199 () Bool)

(assert (=> b!1177972 m!1086199))

(declare-fun m!1086201 () Bool)

(assert (=> b!1177959 m!1086201))

(declare-fun m!1086203 () Bool)

(assert (=> b!1177964 m!1086203))

(declare-fun m!1086205 () Bool)

(assert (=> b!1177964 m!1086205))

(declare-fun m!1086207 () Bool)

(assert (=> mapNonEmpty!46253 m!1086207))

(declare-fun m!1086209 () Bool)

(assert (=> b!1177977 m!1086209))

(assert (=> b!1177979 m!1086195))

(declare-fun m!1086211 () Bool)

(assert (=> b!1177979 m!1086211))

(declare-fun m!1086213 () Bool)

(assert (=> b!1177979 m!1086213))

(assert (=> b!1177979 m!1086213))

(declare-fun m!1086215 () Bool)

(assert (=> b!1177979 m!1086215))

(declare-fun m!1086217 () Bool)

(assert (=> b!1177970 m!1086217))

(declare-fun m!1086219 () Bool)

(assert (=> b!1177970 m!1086219))

(declare-fun m!1086221 () Bool)

(assert (=> b!1177970 m!1086221))

(declare-fun m!1086223 () Bool)

(assert (=> b!1177970 m!1086223))

(declare-fun m!1086225 () Bool)

(assert (=> b!1177970 m!1086225))

(declare-fun m!1086227 () Bool)

(assert (=> b!1177976 m!1086227))

(declare-fun m!1086229 () Bool)

(assert (=> b!1177976 m!1086229))

(declare-fun m!1086231 () Bool)

(assert (=> b!1177976 m!1086231))

(assert (=> b!1177976 m!1086195))

(declare-fun m!1086233 () Bool)

(assert (=> b!1177976 m!1086233))

(declare-fun m!1086235 () Bool)

(assert (=> b!1177976 m!1086235))

(assert (=> b!1177976 m!1086195))

(declare-fun m!1086237 () Bool)

(assert (=> b!1177968 m!1086237))

(declare-fun m!1086239 () Bool)

(assert (=> b!1177974 m!1086239))

(declare-fun m!1086241 () Bool)

(assert (=> b!1177963 m!1086241))

(check-sat (not b!1177968) (not b!1177967) (not b!1177976) (not b!1177970) (not b!1177978) b_and!41045 (not start!99744) (not b!1177969) (not b!1177963) tp_is_empty!29617 (not b!1177973) (not b!1177964) (not b_lambda!20225) (not b!1177977) (not mapNonEmpty!46253) (not b_next!25087) (not b!1177959) (not b!1177972) (not b!1177979))
(check-sat b_and!41045 (not b_next!25087))
