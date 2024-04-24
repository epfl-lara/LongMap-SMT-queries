; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100170 () Bool)

(assert start!100170)

(declare-fun b_free!25513 () Bool)

(declare-fun b_next!25513 () Bool)

(assert (=> start!100170 (= b_free!25513 (not b_next!25513))))

(declare-fun tp!89252 () Bool)

(declare-fun b_and!41895 () Bool)

(assert (=> start!100170 (= tp!89252 b_and!41895)))

(declare-fun b!1191018 () Bool)

(declare-fun e!677233 () Bool)

(declare-fun tp_is_empty!30043 () Bool)

(assert (=> b!1191018 (= e!677233 tp_is_empty!30043)))

(declare-fun b!1191019 () Bool)

(declare-fun res!791677 () Bool)

(declare-fun e!677229 () Bool)

(assert (=> b!1191019 (=> (not res!791677) (not e!677229))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191019 (= res!791677 (validMask!0 mask!1564))))

(declare-fun res!791681 () Bool)

(assert (=> start!100170 (=> (not res!791681) (not e!677229))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76923 0))(
  ( (array!76924 (arr!37105 (Array (_ BitVec 32) (_ BitVec 64))) (size!37642 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76923)

(assert (=> start!100170 (= res!791681 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37642 _keys!1208))))))

(assert (=> start!100170 e!677229))

(assert (=> start!100170 tp_is_empty!30043))

(declare-fun array_inv!28370 (array!76923) Bool)

(assert (=> start!100170 (array_inv!28370 _keys!1208)))

(assert (=> start!100170 true))

(assert (=> start!100170 tp!89252))

(declare-datatypes ((V!45185 0))(
  ( (V!45186 (val!15078 Int)) )
))
(declare-datatypes ((ValueCell!14312 0))(
  ( (ValueCellFull!14312 (v!17712 V!45185)) (EmptyCell!14312) )
))
(declare-datatypes ((array!76925 0))(
  ( (array!76926 (arr!37106 (Array (_ BitVec 32) ValueCell!14312)) (size!37643 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76925)

(declare-fun e!677230 () Bool)

(declare-fun array_inv!28371 (array!76925) Bool)

(assert (=> start!100170 (and (array_inv!28371 _values!996) e!677230)))

(declare-fun b!1191020 () Bool)

(declare-fun e!677234 () Bool)

(assert (=> b!1191020 (= e!677234 true)))

(declare-fun zeroValue!944 () V!45185)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!541662 () array!76925)

(declare-fun minValue!944 () V!45185)

(declare-fun lt!541666 () array!76923)

(declare-datatypes ((tuple2!19400 0))(
  ( (tuple2!19401 (_1!9711 (_ BitVec 64)) (_2!9711 V!45185)) )
))
(declare-datatypes ((List!26143 0))(
  ( (Nil!26140) (Cons!26139 (h!27357 tuple2!19400) (t!38640 List!26143)) )
))
(declare-datatypes ((ListLongMap!17377 0))(
  ( (ListLongMap!17378 (toList!8704 List!26143)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5172 (array!76923 array!76925 (_ BitVec 32) (_ BitVec 32) V!45185 V!45185 (_ BitVec 32) Int) ListLongMap!17377)

(declare-fun -!1719 (ListLongMap!17377 (_ BitVec 64)) ListLongMap!17377)

(assert (=> b!1191020 (= (getCurrentListMapNoExtraKeys!5172 lt!541666 lt!541662 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1719 (getCurrentListMapNoExtraKeys!5172 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39451 0))(
  ( (Unit!39452) )
))
(declare-fun lt!541661 () Unit!39451)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!934 (array!76923 array!76925 (_ BitVec 32) (_ BitVec 32) V!45185 V!45185 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39451)

(assert (=> b!1191020 (= lt!541661 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!934 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191021 () Bool)

(declare-fun res!791686 () Bool)

(assert (=> b!1191021 (=> (not res!791686) (not e!677229))))

(declare-datatypes ((List!26144 0))(
  ( (Nil!26141) (Cons!26140 (h!27358 (_ BitVec 64)) (t!38641 List!26144)) )
))
(declare-fun arrayNoDuplicates!0 (array!76923 (_ BitVec 32) List!26144) Bool)

(assert (=> b!1191021 (= res!791686 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26141))))

(declare-fun b!1191022 () Bool)

(declare-fun res!791680 () Bool)

(declare-fun e!677228 () Bool)

(assert (=> b!1191022 (=> (not res!791680) (not e!677228))))

(assert (=> b!1191022 (= res!791680 (arrayNoDuplicates!0 lt!541666 #b00000000000000000000000000000000 Nil!26141))))

(declare-fun b!1191023 () Bool)

(declare-fun e!677227 () Bool)

(assert (=> b!1191023 (= e!677227 e!677234)))

(declare-fun res!791687 () Bool)

(assert (=> b!1191023 (=> res!791687 e!677234)))

(assert (=> b!1191023 (= res!791687 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541663 () ListLongMap!17377)

(assert (=> b!1191023 (= lt!541663 (getCurrentListMapNoExtraKeys!5172 lt!541666 lt!541662 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3129 (Int (_ BitVec 64)) V!45185)

(assert (=> b!1191023 (= lt!541662 (array!76926 (store (arr!37106 _values!996) i!673 (ValueCellFull!14312 (dynLambda!3129 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37643 _values!996)))))

(declare-fun lt!541665 () ListLongMap!17377)

(assert (=> b!1191023 (= lt!541665 (getCurrentListMapNoExtraKeys!5172 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!46892 () Bool)

(declare-fun mapRes!46892 () Bool)

(declare-fun tp!89253 () Bool)

(declare-fun e!677231 () Bool)

(assert (=> mapNonEmpty!46892 (= mapRes!46892 (and tp!89253 e!677231))))

(declare-fun mapKey!46892 () (_ BitVec 32))

(declare-fun mapRest!46892 () (Array (_ BitVec 32) ValueCell!14312))

(declare-fun mapValue!46892 () ValueCell!14312)

(assert (=> mapNonEmpty!46892 (= (arr!37106 _values!996) (store mapRest!46892 mapKey!46892 mapValue!46892))))

(declare-fun b!1191024 () Bool)

(declare-fun res!791682 () Bool)

(assert (=> b!1191024 (=> (not res!791682) (not e!677229))))

(assert (=> b!1191024 (= res!791682 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37642 _keys!1208))))))

(declare-fun b!1191025 () Bool)

(declare-fun res!791683 () Bool)

(assert (=> b!1191025 (=> (not res!791683) (not e!677229))))

(assert (=> b!1191025 (= res!791683 (and (= (size!37643 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37642 _keys!1208) (size!37643 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191026 () Bool)

(assert (=> b!1191026 (= e!677230 (and e!677233 mapRes!46892))))

(declare-fun condMapEmpty!46892 () Bool)

(declare-fun mapDefault!46892 () ValueCell!14312)

(assert (=> b!1191026 (= condMapEmpty!46892 (= (arr!37106 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14312)) mapDefault!46892)))))

(declare-fun b!1191027 () Bool)

(assert (=> b!1191027 (= e!677228 (not e!677227))))

(declare-fun res!791685 () Bool)

(assert (=> b!1191027 (=> res!791685 e!677227)))

(assert (=> b!1191027 (= res!791685 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191027 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541664 () Unit!39451)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76923 (_ BitVec 64) (_ BitVec 32)) Unit!39451)

(assert (=> b!1191027 (= lt!541664 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1191028 () Bool)

(declare-fun res!791684 () Bool)

(assert (=> b!1191028 (=> (not res!791684) (not e!677229))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191028 (= res!791684 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!46892 () Bool)

(assert (=> mapIsEmpty!46892 mapRes!46892))

(declare-fun b!1191029 () Bool)

(assert (=> b!1191029 (= e!677229 e!677228)))

(declare-fun res!791679 () Bool)

(assert (=> b!1191029 (=> (not res!791679) (not e!677228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76923 (_ BitVec 32)) Bool)

(assert (=> b!1191029 (= res!791679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541666 mask!1564))))

(assert (=> b!1191029 (= lt!541666 (array!76924 (store (arr!37105 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37642 _keys!1208)))))

(declare-fun b!1191030 () Bool)

(declare-fun res!791676 () Bool)

(assert (=> b!1191030 (=> (not res!791676) (not e!677229))))

(assert (=> b!1191030 (= res!791676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1191031 () Bool)

(assert (=> b!1191031 (= e!677231 tp_is_empty!30043)))

(declare-fun b!1191032 () Bool)

(declare-fun res!791678 () Bool)

(assert (=> b!1191032 (=> (not res!791678) (not e!677229))))

(assert (=> b!1191032 (= res!791678 (= (select (arr!37105 _keys!1208) i!673) k0!934))))

(assert (= (and start!100170 res!791681) b!1191019))

(assert (= (and b!1191019 res!791677) b!1191025))

(assert (= (and b!1191025 res!791683) b!1191030))

(assert (= (and b!1191030 res!791676) b!1191021))

(assert (= (and b!1191021 res!791686) b!1191024))

(assert (= (and b!1191024 res!791682) b!1191028))

(assert (= (and b!1191028 res!791684) b!1191032))

(assert (= (and b!1191032 res!791678) b!1191029))

(assert (= (and b!1191029 res!791679) b!1191022))

(assert (= (and b!1191022 res!791680) b!1191027))

(assert (= (and b!1191027 (not res!791685)) b!1191023))

(assert (= (and b!1191023 (not res!791687)) b!1191020))

(assert (= (and b!1191026 condMapEmpty!46892) mapIsEmpty!46892))

(assert (= (and b!1191026 (not condMapEmpty!46892)) mapNonEmpty!46892))

(get-info :version)

(assert (= (and mapNonEmpty!46892 ((_ is ValueCellFull!14312) mapValue!46892)) b!1191031))

(assert (= (and b!1191026 ((_ is ValueCellFull!14312) mapDefault!46892)) b!1191018))

(assert (= start!100170 b!1191026))

(declare-fun b_lambda!20651 () Bool)

(assert (=> (not b_lambda!20651) (not b!1191023)))

(declare-fun t!38639 () Bool)

(declare-fun tb!10317 () Bool)

(assert (=> (and start!100170 (= defaultEntry!1004 defaultEntry!1004) t!38639) tb!10317))

(declare-fun result!21209 () Bool)

(assert (=> tb!10317 (= result!21209 tp_is_empty!30043)))

(assert (=> b!1191023 t!38639))

(declare-fun b_and!41897 () Bool)

(assert (= b_and!41895 (and (=> t!38639 result!21209) b_and!41897)))

(declare-fun m!1099947 () Bool)

(assert (=> b!1191032 m!1099947))

(declare-fun m!1099949 () Bool)

(assert (=> b!1191019 m!1099949))

(declare-fun m!1099951 () Bool)

(assert (=> b!1191022 m!1099951))

(declare-fun m!1099953 () Bool)

(assert (=> b!1191021 m!1099953))

(declare-fun m!1099955 () Bool)

(assert (=> b!1191029 m!1099955))

(declare-fun m!1099957 () Bool)

(assert (=> b!1191029 m!1099957))

(declare-fun m!1099959 () Bool)

(assert (=> b!1191030 m!1099959))

(declare-fun m!1099961 () Bool)

(assert (=> b!1191028 m!1099961))

(declare-fun m!1099963 () Bool)

(assert (=> b!1191020 m!1099963))

(declare-fun m!1099965 () Bool)

(assert (=> b!1191020 m!1099965))

(assert (=> b!1191020 m!1099965))

(declare-fun m!1099967 () Bool)

(assert (=> b!1191020 m!1099967))

(declare-fun m!1099969 () Bool)

(assert (=> b!1191020 m!1099969))

(declare-fun m!1099971 () Bool)

(assert (=> b!1191023 m!1099971))

(declare-fun m!1099973 () Bool)

(assert (=> b!1191023 m!1099973))

(declare-fun m!1099975 () Bool)

(assert (=> b!1191023 m!1099975))

(declare-fun m!1099977 () Bool)

(assert (=> b!1191023 m!1099977))

(declare-fun m!1099979 () Bool)

(assert (=> start!100170 m!1099979))

(declare-fun m!1099981 () Bool)

(assert (=> start!100170 m!1099981))

(declare-fun m!1099983 () Bool)

(assert (=> mapNonEmpty!46892 m!1099983))

(declare-fun m!1099985 () Bool)

(assert (=> b!1191027 m!1099985))

(declare-fun m!1099987 () Bool)

(assert (=> b!1191027 m!1099987))

(check-sat (not b!1191022) (not b!1191020) (not mapNonEmpty!46892) (not b!1191027) (not b!1191023) tp_is_empty!30043 (not b!1191029) (not b_next!25513) (not b!1191028) (not b!1191021) (not b!1191019) (not start!100170) b_and!41897 (not b!1191030) (not b_lambda!20651))
(check-sat b_and!41897 (not b_next!25513))
