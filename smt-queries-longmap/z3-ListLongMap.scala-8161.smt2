; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99826 () Bool)

(assert start!99826)

(declare-fun b_free!25411 () Bool)

(declare-fun b_next!25411 () Bool)

(assert (=> start!99826 (= b_free!25411 (not b_next!25411))))

(declare-fun tp!88947 () Bool)

(declare-fun b_and!41667 () Bool)

(assert (=> start!99826 (= tp!88947 b_and!41667)))

(declare-fun b!1186903 () Bool)

(declare-fun e!674849 () Bool)

(declare-fun tp_is_empty!29941 () Bool)

(assert (=> b!1186903 (= e!674849 tp_is_empty!29941)))

(declare-fun b!1186904 () Bool)

(declare-fun res!789094 () Bool)

(declare-fun e!674851 () Bool)

(assert (=> b!1186904 (=> (not res!789094) (not e!674851))))

(declare-datatypes ((array!76616 0))(
  ( (array!76617 (arr!36958 (Array (_ BitVec 32) (_ BitVec 64))) (size!37496 (_ BitVec 32))) )
))
(declare-fun lt!539289 () array!76616)

(declare-datatypes ((List!26115 0))(
  ( (Nil!26112) (Cons!26111 (h!27320 (_ BitVec 64)) (t!38509 List!26115)) )
))
(declare-fun arrayNoDuplicates!0 (array!76616 (_ BitVec 32) List!26115) Bool)

(assert (=> b!1186904 (= res!789094 (arrayNoDuplicates!0 lt!539289 #b00000000000000000000000000000000 Nil!26112))))

(declare-fun res!789091 () Bool)

(declare-fun e!674856 () Bool)

(assert (=> start!99826 (=> (not res!789091) (not e!674856))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _keys!1208 () array!76616)

(assert (=> start!99826 (= res!789091 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37496 _keys!1208))))))

(assert (=> start!99826 e!674856))

(assert (=> start!99826 tp_is_empty!29941))

(declare-fun array_inv!28314 (array!76616) Bool)

(assert (=> start!99826 (array_inv!28314 _keys!1208)))

(assert (=> start!99826 true))

(assert (=> start!99826 tp!88947))

(declare-datatypes ((V!45049 0))(
  ( (V!45050 (val!15027 Int)) )
))
(declare-datatypes ((ValueCell!14261 0))(
  ( (ValueCellFull!14261 (v!17664 V!45049)) (EmptyCell!14261) )
))
(declare-datatypes ((array!76618 0))(
  ( (array!76619 (arr!36959 (Array (_ BitVec 32) ValueCell!14261)) (size!37497 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76618)

(declare-fun e!674854 () Bool)

(declare-fun array_inv!28315 (array!76618) Bool)

(assert (=> start!99826 (and (array_inv!28315 _values!996) e!674854)))

(declare-fun b!1186905 () Bool)

(declare-fun res!789092 () Bool)

(assert (=> b!1186905 (=> (not res!789092) (not e!674856))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1186905 (= res!789092 (= (select (arr!36958 _keys!1208) i!673) k0!934))))

(declare-fun b!1186906 () Bool)

(declare-fun res!789083 () Bool)

(assert (=> b!1186906 (=> (not res!789083) (not e!674856))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76616 (_ BitVec 32)) Bool)

(assert (=> b!1186906 (= res!789083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1186907 () Bool)

(declare-fun res!789095 () Bool)

(assert (=> b!1186907 (=> (not res!789095) (not e!674856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186907 (= res!789095 (validKeyInArray!0 k0!934))))

(declare-fun b!1186908 () Bool)

(declare-fun e!674859 () Bool)

(declare-fun arrayContainsKey!0 (array!76616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186908 (= e!674859 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46739 () Bool)

(declare-fun mapRes!46739 () Bool)

(declare-fun tp!88946 () Bool)

(assert (=> mapNonEmpty!46739 (= mapRes!46739 (and tp!88946 e!674849))))

(declare-fun mapRest!46739 () (Array (_ BitVec 32) ValueCell!14261))

(declare-fun mapKey!46739 () (_ BitVec 32))

(declare-fun mapValue!46739 () ValueCell!14261)

(assert (=> mapNonEmpty!46739 (= (arr!36959 _values!996) (store mapRest!46739 mapKey!46739 mapValue!46739))))

(declare-fun b!1186909 () Bool)

(declare-fun res!789089 () Bool)

(assert (=> b!1186909 (=> (not res!789089) (not e!674856))))

(assert (=> b!1186909 (= res!789089 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37496 _keys!1208))))))

(declare-fun b!1186910 () Bool)

(declare-datatypes ((Unit!39227 0))(
  ( (Unit!39228) )
))
(declare-fun e!674852 () Unit!39227)

(declare-fun Unit!39229 () Unit!39227)

(assert (=> b!1186910 (= e!674852 Unit!39229)))

(declare-fun b!1186911 () Bool)

(declare-fun e!674855 () Bool)

(declare-fun e!674858 () Bool)

(assert (=> b!1186911 (= e!674855 e!674858)))

(declare-fun res!789085 () Bool)

(assert (=> b!1186911 (=> res!789085 e!674858)))

(assert (=> b!1186911 (= res!789085 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45049)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19402 0))(
  ( (tuple2!19403 (_1!9712 (_ BitVec 64)) (_2!9712 V!45049)) )
))
(declare-datatypes ((List!26116 0))(
  ( (Nil!26113) (Cons!26112 (h!27321 tuple2!19402) (t!38510 List!26116)) )
))
(declare-datatypes ((ListLongMap!17371 0))(
  ( (ListLongMap!17372 (toList!8701 List!26116)) )
))
(declare-fun lt!539285 () ListLongMap!17371)

(declare-fun lt!539283 () array!76618)

(declare-fun minValue!944 () V!45049)

(declare-fun getCurrentListMapNoExtraKeys!5152 (array!76616 array!76618 (_ BitVec 32) (_ BitVec 32) V!45049 V!45049 (_ BitVec 32) Int) ListLongMap!17371)

(assert (=> b!1186911 (= lt!539285 (getCurrentListMapNoExtraKeys!5152 lt!539289 lt!539283 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!539275 () V!45049)

(assert (=> b!1186911 (= lt!539283 (array!76619 (store (arr!36959 _values!996) i!673 (ValueCellFull!14261 lt!539275)) (size!37497 _values!996)))))

(declare-fun dynLambda!3051 (Int (_ BitVec 64)) V!45049)

(assert (=> b!1186911 (= lt!539275 (dynLambda!3051 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!539279 () ListLongMap!17371)

(assert (=> b!1186911 (= lt!539279 (getCurrentListMapNoExtraKeys!5152 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1186912 () Bool)

(declare-fun res!789086 () Bool)

(assert (=> b!1186912 (=> (not res!789086) (not e!674856))))

(assert (=> b!1186912 (= res!789086 (and (= (size!37497 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37496 _keys!1208) (size!37497 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1186913 () Bool)

(declare-fun res!789090 () Bool)

(assert (=> b!1186913 (=> (not res!789090) (not e!674856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1186913 (= res!789090 (validMask!0 mask!1564))))

(declare-fun b!1186914 () Bool)

(assert (=> b!1186914 (= e!674851 (not e!674855))))

(declare-fun res!789097 () Bool)

(assert (=> b!1186914 (=> res!789097 e!674855)))

(assert (=> b!1186914 (= res!789097 (bvsgt from!1455 i!673))))

(assert (=> b!1186914 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!539276 () Unit!39227)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76616 (_ BitVec 64) (_ BitVec 32)) Unit!39227)

(assert (=> b!1186914 (= lt!539276 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186915 () Bool)

(declare-fun e!674853 () Bool)

(assert (=> b!1186915 (= e!674858 e!674853)))

(declare-fun res!789093 () Bool)

(assert (=> b!1186915 (=> res!789093 e!674853)))

(assert (=> b!1186915 (= res!789093 (not (validKeyInArray!0 (select (arr!36958 _keys!1208) from!1455))))))

(declare-fun lt!539277 () ListLongMap!17371)

(declare-fun lt!539292 () ListLongMap!17371)

(assert (=> b!1186915 (= lt!539277 lt!539292)))

(declare-fun lt!539291 () ListLongMap!17371)

(declare-fun -!1651 (ListLongMap!17371 (_ BitVec 64)) ListLongMap!17371)

(assert (=> b!1186915 (= lt!539292 (-!1651 lt!539291 k0!934))))

(assert (=> b!1186915 (= lt!539277 (getCurrentListMapNoExtraKeys!5152 lt!539289 lt!539283 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1186915 (= lt!539291 (getCurrentListMapNoExtraKeys!5152 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!539274 () Unit!39227)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!905 (array!76616 array!76618 (_ BitVec 32) (_ BitVec 32) V!45049 V!45049 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39227)

(assert (=> b!1186915 (= lt!539274 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!905 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1186916 () Bool)

(assert (=> b!1186916 (= e!674853 true)))

(declare-fun lt!539287 () ListLongMap!17371)

(declare-fun lt!539282 () ListLongMap!17371)

(assert (=> b!1186916 (= (-!1651 lt!539287 k0!934) lt!539282)))

(declare-fun lt!539280 () Unit!39227)

(declare-fun lt!539281 () V!45049)

(declare-fun addRemoveCommutativeForDiffKeys!194 (ListLongMap!17371 (_ BitVec 64) V!45049 (_ BitVec 64)) Unit!39227)

(assert (=> b!1186916 (= lt!539280 (addRemoveCommutativeForDiffKeys!194 lt!539291 (select (arr!36958 _keys!1208) from!1455) lt!539281 k0!934))))

(assert (=> b!1186916 (and (= lt!539279 lt!539287) (= lt!539292 lt!539277))))

(declare-fun lt!539288 () tuple2!19402)

(declare-fun +!3980 (ListLongMap!17371 tuple2!19402) ListLongMap!17371)

(assert (=> b!1186916 (= lt!539287 (+!3980 lt!539291 lt!539288))))

(assert (=> b!1186916 (not (= (select (arr!36958 _keys!1208) from!1455) k0!934))))

(declare-fun lt!539290 () Unit!39227)

(assert (=> b!1186916 (= lt!539290 e!674852)))

(declare-fun c!117214 () Bool)

(assert (=> b!1186916 (= c!117214 (= (select (arr!36958 _keys!1208) from!1455) k0!934))))

(declare-fun e!674860 () Bool)

(assert (=> b!1186916 e!674860))

(declare-fun res!789096 () Bool)

(assert (=> b!1186916 (=> (not res!789096) (not e!674860))))

(assert (=> b!1186916 (= res!789096 (= lt!539285 lt!539282))))

(assert (=> b!1186916 (= lt!539282 (+!3980 lt!539292 lt!539288))))

(assert (=> b!1186916 (= lt!539288 (tuple2!19403 (select (arr!36958 _keys!1208) from!1455) lt!539281))))

(declare-fun get!18939 (ValueCell!14261 V!45049) V!45049)

(assert (=> b!1186916 (= lt!539281 (get!18939 (select (arr!36959 _values!996) from!1455) lt!539275))))

(declare-fun b!1186917 () Bool)

(declare-fun res!789087 () Bool)

(assert (=> b!1186917 (=> (not res!789087) (not e!674856))))

(assert (=> b!1186917 (= res!789087 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26112))))

(declare-fun mapIsEmpty!46739 () Bool)

(assert (=> mapIsEmpty!46739 mapRes!46739))

(declare-fun b!1186918 () Bool)

(declare-fun Unit!39230 () Unit!39227)

(assert (=> b!1186918 (= e!674852 Unit!39230)))

(declare-fun lt!539286 () Unit!39227)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76616 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39227)

(assert (=> b!1186918 (= lt!539286 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1186918 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539278 () Unit!39227)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76616 (_ BitVec 32) (_ BitVec 32)) Unit!39227)

(assert (=> b!1186918 (= lt!539278 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1186918 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26112)))

(declare-fun lt!539284 () Unit!39227)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76616 (_ BitVec 64) (_ BitVec 32) List!26115) Unit!39227)

(assert (=> b!1186918 (= lt!539284 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26112))))

(assert (=> b!1186918 false))

(declare-fun b!1186919 () Bool)

(declare-fun e!674850 () Bool)

(assert (=> b!1186919 (= e!674854 (and e!674850 mapRes!46739))))

(declare-fun condMapEmpty!46739 () Bool)

(declare-fun mapDefault!46739 () ValueCell!14261)

(assert (=> b!1186919 (= condMapEmpty!46739 (= (arr!36959 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14261)) mapDefault!46739)))))

(declare-fun b!1186920 () Bool)

(assert (=> b!1186920 (= e!674850 tp_is_empty!29941)))

(declare-fun b!1186921 () Bool)

(assert (=> b!1186921 (= e!674860 e!674859)))

(declare-fun res!789088 () Bool)

(assert (=> b!1186921 (=> res!789088 e!674859)))

(assert (=> b!1186921 (= res!789088 (not (= (select (arr!36958 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1186922 () Bool)

(assert (=> b!1186922 (= e!674856 e!674851)))

(declare-fun res!789084 () Bool)

(assert (=> b!1186922 (=> (not res!789084) (not e!674851))))

(assert (=> b!1186922 (= res!789084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539289 mask!1564))))

(assert (=> b!1186922 (= lt!539289 (array!76617 (store (arr!36958 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37496 _keys!1208)))))

(assert (= (and start!99826 res!789091) b!1186913))

(assert (= (and b!1186913 res!789090) b!1186912))

(assert (= (and b!1186912 res!789086) b!1186906))

(assert (= (and b!1186906 res!789083) b!1186917))

(assert (= (and b!1186917 res!789087) b!1186909))

(assert (= (and b!1186909 res!789089) b!1186907))

(assert (= (and b!1186907 res!789095) b!1186905))

(assert (= (and b!1186905 res!789092) b!1186922))

(assert (= (and b!1186922 res!789084) b!1186904))

(assert (= (and b!1186904 res!789094) b!1186914))

(assert (= (and b!1186914 (not res!789097)) b!1186911))

(assert (= (and b!1186911 (not res!789085)) b!1186915))

(assert (= (and b!1186915 (not res!789093)) b!1186916))

(assert (= (and b!1186916 res!789096) b!1186921))

(assert (= (and b!1186921 (not res!789088)) b!1186908))

(assert (= (and b!1186916 c!117214) b!1186918))

(assert (= (and b!1186916 (not c!117214)) b!1186910))

(assert (= (and b!1186919 condMapEmpty!46739) mapIsEmpty!46739))

(assert (= (and b!1186919 (not condMapEmpty!46739)) mapNonEmpty!46739))

(get-info :version)

(assert (= (and mapNonEmpty!46739 ((_ is ValueCellFull!14261) mapValue!46739)) b!1186903))

(assert (= (and b!1186919 ((_ is ValueCellFull!14261) mapDefault!46739)) b!1186920))

(assert (= start!99826 b!1186919))

(declare-fun b_lambda!20537 () Bool)

(assert (=> (not b_lambda!20537) (not b!1186911)))

(declare-fun t!38508 () Bool)

(declare-fun tb!10215 () Bool)

(assert (=> (and start!99826 (= defaultEntry!1004 defaultEntry!1004) t!38508) tb!10215))

(declare-fun result!21005 () Bool)

(assert (=> tb!10215 (= result!21005 tp_is_empty!29941)))

(assert (=> b!1186911 t!38508))

(declare-fun b_and!41669 () Bool)

(assert (= b_and!41667 (and (=> t!38508 result!21005) b_and!41669)))

(declare-fun m!1095035 () Bool)

(assert (=> mapNonEmpty!46739 m!1095035))

(declare-fun m!1095037 () Bool)

(assert (=> b!1186914 m!1095037))

(declare-fun m!1095039 () Bool)

(assert (=> b!1186914 m!1095039))

(declare-fun m!1095041 () Bool)

(assert (=> b!1186915 m!1095041))

(declare-fun m!1095043 () Bool)

(assert (=> b!1186915 m!1095043))

(declare-fun m!1095045 () Bool)

(assert (=> b!1186915 m!1095045))

(declare-fun m!1095047 () Bool)

(assert (=> b!1186915 m!1095047))

(declare-fun m!1095049 () Bool)

(assert (=> b!1186915 m!1095049))

(declare-fun m!1095051 () Bool)

(assert (=> b!1186915 m!1095051))

(assert (=> b!1186915 m!1095049))

(declare-fun m!1095053 () Bool)

(assert (=> b!1186917 m!1095053))

(declare-fun m!1095055 () Bool)

(assert (=> b!1186916 m!1095055))

(declare-fun m!1095057 () Bool)

(assert (=> b!1186916 m!1095057))

(assert (=> b!1186916 m!1095049))

(declare-fun m!1095059 () Bool)

(assert (=> b!1186916 m!1095059))

(assert (=> b!1186916 m!1095055))

(declare-fun m!1095061 () Bool)

(assert (=> b!1186916 m!1095061))

(declare-fun m!1095063 () Bool)

(assert (=> b!1186916 m!1095063))

(declare-fun m!1095065 () Bool)

(assert (=> b!1186916 m!1095065))

(assert (=> b!1186916 m!1095049))

(declare-fun m!1095067 () Bool)

(assert (=> b!1186911 m!1095067))

(declare-fun m!1095069 () Bool)

(assert (=> b!1186911 m!1095069))

(declare-fun m!1095071 () Bool)

(assert (=> b!1186911 m!1095071))

(declare-fun m!1095073 () Bool)

(assert (=> b!1186911 m!1095073))

(declare-fun m!1095075 () Bool)

(assert (=> b!1186913 m!1095075))

(declare-fun m!1095077 () Bool)

(assert (=> b!1186908 m!1095077))

(declare-fun m!1095079 () Bool)

(assert (=> b!1186907 m!1095079))

(declare-fun m!1095081 () Bool)

(assert (=> b!1186918 m!1095081))

(declare-fun m!1095083 () Bool)

(assert (=> b!1186918 m!1095083))

(declare-fun m!1095085 () Bool)

(assert (=> b!1186918 m!1095085))

(declare-fun m!1095087 () Bool)

(assert (=> b!1186918 m!1095087))

(declare-fun m!1095089 () Bool)

(assert (=> b!1186918 m!1095089))

(declare-fun m!1095091 () Bool)

(assert (=> b!1186905 m!1095091))

(assert (=> b!1186921 m!1095049))

(declare-fun m!1095093 () Bool)

(assert (=> b!1186904 m!1095093))

(declare-fun m!1095095 () Bool)

(assert (=> b!1186906 m!1095095))

(declare-fun m!1095097 () Bool)

(assert (=> b!1186922 m!1095097))

(declare-fun m!1095099 () Bool)

(assert (=> b!1186922 m!1095099))

(declare-fun m!1095101 () Bool)

(assert (=> start!99826 m!1095101))

(declare-fun m!1095103 () Bool)

(assert (=> start!99826 m!1095103))

(check-sat (not b!1186906) tp_is_empty!29941 (not b!1186908) (not b!1186907) (not b!1186916) (not b!1186917) (not b!1186915) (not b!1186922) (not b_lambda!20537) (not b_next!25411) (not b!1186911) (not b!1186904) (not b!1186914) b_and!41669 (not b!1186913) (not mapNonEmpty!46739) (not start!99826) (not b!1186918))
(check-sat b_and!41669 (not b_next!25411))
