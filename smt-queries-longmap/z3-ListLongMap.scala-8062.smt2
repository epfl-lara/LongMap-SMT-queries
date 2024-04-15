; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99206 () Bool)

(assert start!99206)

(declare-fun b_free!24817 () Bool)

(declare-fun b_next!24817 () Bool)

(assert (=> start!99206 (= b_free!24817 (not b_next!24817))))

(declare-fun tp!87161 () Bool)

(declare-fun b_and!40461 () Bool)

(assert (=> start!99206 (= tp!87161 b_and!40461)))

(declare-fun b!1168131 () Bool)

(declare-fun res!775020 () Bool)

(declare-fun e!663893 () Bool)

(assert (=> b!1168131 (=> (not res!775020) (not e!663893))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168131 (= res!775020 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!45845 () Bool)

(declare-fun mapRes!45845 () Bool)

(assert (=> mapIsEmpty!45845 mapRes!45845))

(declare-fun b!1168132 () Bool)

(declare-fun e!663888 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75442 0))(
  ( (array!75443 (arr!36372 (Array (_ BitVec 32) (_ BitVec 64))) (size!36910 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75442)

(assert (=> b!1168132 (= e!663888 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36910 _keys!1208))))))

(declare-fun b!1168133 () Bool)

(declare-fun res!775025 () Bool)

(assert (=> b!1168133 (=> (not res!775025) (not e!663893))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44257 0))(
  ( (V!44258 (val!14730 Int)) )
))
(declare-datatypes ((ValueCell!13964 0))(
  ( (ValueCellFull!13964 (v!17366 V!44257)) (EmptyCell!13964) )
))
(declare-datatypes ((array!75444 0))(
  ( (array!75445 (arr!36373 (Array (_ BitVec 32) ValueCell!13964)) (size!36911 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75444)

(assert (=> b!1168133 (= res!775025 (and (= (size!36911 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36910 _keys!1208) (size!36911 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168134 () Bool)

(declare-fun e!663894 () Bool)

(declare-fun tp_is_empty!29347 () Bool)

(assert (=> b!1168134 (= e!663894 tp_is_empty!29347)))

(declare-fun res!775027 () Bool)

(assert (=> start!99206 (=> (not res!775027) (not e!663893))))

(assert (=> start!99206 (= res!775027 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36910 _keys!1208))))))

(assert (=> start!99206 e!663893))

(assert (=> start!99206 tp_is_empty!29347))

(declare-fun array_inv!27908 (array!75442) Bool)

(assert (=> start!99206 (array_inv!27908 _keys!1208)))

(assert (=> start!99206 true))

(assert (=> start!99206 tp!87161))

(declare-fun e!663889 () Bool)

(declare-fun array_inv!27909 (array!75444) Bool)

(assert (=> start!99206 (and (array_inv!27909 _values!996) e!663889)))

(declare-fun b!1168135 () Bool)

(declare-fun res!775023 () Bool)

(assert (=> b!1168135 (=> (not res!775023) (not e!663893))))

(declare-datatypes ((List!25602 0))(
  ( (Nil!25599) (Cons!25598 (h!26807 (_ BitVec 64)) (t!37402 List!25602)) )
))
(declare-fun arrayNoDuplicates!0 (array!75442 (_ BitVec 32) List!25602) Bool)

(assert (=> b!1168135 (= res!775023 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25599))))

(declare-fun b!1168136 () Bool)

(declare-fun e!663892 () Bool)

(declare-fun e!663887 () Bool)

(assert (=> b!1168136 (= e!663892 (not e!663887))))

(declare-fun res!775018 () Bool)

(assert (=> b!1168136 (=> res!775018 e!663887)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1168136 (= res!775018 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168136 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38375 0))(
  ( (Unit!38376) )
))
(declare-fun lt!525756 () Unit!38375)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75442 (_ BitVec 64) (_ BitVec 32)) Unit!38375)

(assert (=> b!1168136 (= lt!525756 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1168137 () Bool)

(declare-fun res!775026 () Bool)

(assert (=> b!1168137 (=> (not res!775026) (not e!663893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168137 (= res!775026 (validKeyInArray!0 k0!934))))

(declare-fun b!1168138 () Bool)

(declare-fun res!775016 () Bool)

(assert (=> b!1168138 (=> (not res!775016) (not e!663893))))

(assert (=> b!1168138 (= res!775016 (= (select (arr!36372 _keys!1208) i!673) k0!934))))

(declare-fun b!1168139 () Bool)

(declare-fun e!663891 () Bool)

(assert (=> b!1168139 (= e!663891 e!663888)))

(declare-fun res!775028 () Bool)

(assert (=> b!1168139 (=> res!775028 e!663888)))

(assert (=> b!1168139 (= res!775028 (not (validKeyInArray!0 (select (arr!36372 _keys!1208) from!1455))))))

(declare-fun zeroValue!944 () V!44257)

(declare-fun lt!525758 () array!75442)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44257)

(declare-fun lt!525755 () array!75444)

(declare-datatypes ((tuple2!18886 0))(
  ( (tuple2!18887 (_1!9454 (_ BitVec 64)) (_2!9454 V!44257)) )
))
(declare-datatypes ((List!25603 0))(
  ( (Nil!25600) (Cons!25599 (h!26808 tuple2!18886) (t!37403 List!25603)) )
))
(declare-datatypes ((ListLongMap!16855 0))(
  ( (ListLongMap!16856 (toList!8443 List!25603)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4919 (array!75442 array!75444 (_ BitVec 32) (_ BitVec 32) V!44257 V!44257 (_ BitVec 32) Int) ListLongMap!16855)

(declare-fun -!1451 (ListLongMap!16855 (_ BitVec 64)) ListLongMap!16855)

(assert (=> b!1168139 (= (getCurrentListMapNoExtraKeys!4919 lt!525758 lt!525755 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1451 (getCurrentListMapNoExtraKeys!4919 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!525754 () Unit!38375)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!715 (array!75442 array!75444 (_ BitVec 32) (_ BitVec 32) V!44257 V!44257 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38375)

(assert (=> b!1168139 (= lt!525754 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!715 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168140 () Bool)

(declare-fun e!663890 () Bool)

(assert (=> b!1168140 (= e!663889 (and e!663890 mapRes!45845))))

(declare-fun condMapEmpty!45845 () Bool)

(declare-fun mapDefault!45845 () ValueCell!13964)

(assert (=> b!1168140 (= condMapEmpty!45845 (= (arr!36373 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13964)) mapDefault!45845)))))

(declare-fun b!1168141 () Bool)

(assert (=> b!1168141 (= e!663893 e!663892)))

(declare-fun res!775024 () Bool)

(assert (=> b!1168141 (=> (not res!775024) (not e!663892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75442 (_ BitVec 32)) Bool)

(assert (=> b!1168141 (= res!775024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525758 mask!1564))))

(assert (=> b!1168141 (= lt!525758 (array!75443 (store (arr!36372 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36910 _keys!1208)))))

(declare-fun mapNonEmpty!45845 () Bool)

(declare-fun tp!87162 () Bool)

(assert (=> mapNonEmpty!45845 (= mapRes!45845 (and tp!87162 e!663894))))

(declare-fun mapValue!45845 () ValueCell!13964)

(declare-fun mapKey!45845 () (_ BitVec 32))

(declare-fun mapRest!45845 () (Array (_ BitVec 32) ValueCell!13964))

(assert (=> mapNonEmpty!45845 (= (arr!36373 _values!996) (store mapRest!45845 mapKey!45845 mapValue!45845))))

(declare-fun b!1168142 () Bool)

(assert (=> b!1168142 (= e!663890 tp_is_empty!29347)))

(declare-fun b!1168143 () Bool)

(declare-fun res!775017 () Bool)

(assert (=> b!1168143 (=> (not res!775017) (not e!663892))))

(assert (=> b!1168143 (= res!775017 (arrayNoDuplicates!0 lt!525758 #b00000000000000000000000000000000 Nil!25599))))

(declare-fun b!1168144 () Bool)

(declare-fun res!775022 () Bool)

(assert (=> b!1168144 (=> (not res!775022) (not e!663893))))

(assert (=> b!1168144 (= res!775022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1168145 () Bool)

(declare-fun res!775021 () Bool)

(assert (=> b!1168145 (=> (not res!775021) (not e!663893))))

(assert (=> b!1168145 (= res!775021 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36910 _keys!1208))))))

(declare-fun b!1168146 () Bool)

(assert (=> b!1168146 (= e!663887 e!663891)))

(declare-fun res!775019 () Bool)

(assert (=> b!1168146 (=> res!775019 e!663891)))

(assert (=> b!1168146 (= res!775019 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525759 () ListLongMap!16855)

(assert (=> b!1168146 (= lt!525759 (getCurrentListMapNoExtraKeys!4919 lt!525758 lt!525755 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2847 (Int (_ BitVec 64)) V!44257)

(assert (=> b!1168146 (= lt!525755 (array!75445 (store (arr!36373 _values!996) i!673 (ValueCellFull!13964 (dynLambda!2847 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36911 _values!996)))))

(declare-fun lt!525757 () ListLongMap!16855)

(assert (=> b!1168146 (= lt!525757 (getCurrentListMapNoExtraKeys!4919 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!99206 res!775027) b!1168131))

(assert (= (and b!1168131 res!775020) b!1168133))

(assert (= (and b!1168133 res!775025) b!1168144))

(assert (= (and b!1168144 res!775022) b!1168135))

(assert (= (and b!1168135 res!775023) b!1168145))

(assert (= (and b!1168145 res!775021) b!1168137))

(assert (= (and b!1168137 res!775026) b!1168138))

(assert (= (and b!1168138 res!775016) b!1168141))

(assert (= (and b!1168141 res!775024) b!1168143))

(assert (= (and b!1168143 res!775017) b!1168136))

(assert (= (and b!1168136 (not res!775018)) b!1168146))

(assert (= (and b!1168146 (not res!775019)) b!1168139))

(assert (= (and b!1168139 (not res!775028)) b!1168132))

(assert (= (and b!1168140 condMapEmpty!45845) mapIsEmpty!45845))

(assert (= (and b!1168140 (not condMapEmpty!45845)) mapNonEmpty!45845))

(get-info :version)

(assert (= (and mapNonEmpty!45845 ((_ is ValueCellFull!13964) mapValue!45845)) b!1168134))

(assert (= (and b!1168140 ((_ is ValueCellFull!13964) mapDefault!45845)) b!1168142))

(assert (= start!99206 b!1168140))

(declare-fun b_lambda!19905 () Bool)

(assert (=> (not b_lambda!19905) (not b!1168146)))

(declare-fun t!37401 () Bool)

(declare-fun tb!9621 () Bool)

(assert (=> (and start!99206 (= defaultEntry!1004 defaultEntry!1004) t!37401) tb!9621))

(declare-fun result!19815 () Bool)

(assert (=> tb!9621 (= result!19815 tp_is_empty!29347)))

(assert (=> b!1168146 t!37401))

(declare-fun b_and!40463 () Bool)

(assert (= b_and!40461 (and (=> t!37401 result!19815) b_and!40463)))

(declare-fun m!1075489 () Bool)

(assert (=> b!1168141 m!1075489))

(declare-fun m!1075491 () Bool)

(assert (=> b!1168141 m!1075491))

(declare-fun m!1075493 () Bool)

(assert (=> b!1168143 m!1075493))

(declare-fun m!1075495 () Bool)

(assert (=> b!1168144 m!1075495))

(declare-fun m!1075497 () Bool)

(assert (=> b!1168135 m!1075497))

(declare-fun m!1075499 () Bool)

(assert (=> mapNonEmpty!45845 m!1075499))

(declare-fun m!1075501 () Bool)

(assert (=> b!1168138 m!1075501))

(declare-fun m!1075503 () Bool)

(assert (=> b!1168137 m!1075503))

(declare-fun m!1075505 () Bool)

(assert (=> b!1168139 m!1075505))

(declare-fun m!1075507 () Bool)

(assert (=> b!1168139 m!1075507))

(declare-fun m!1075509 () Bool)

(assert (=> b!1168139 m!1075509))

(assert (=> b!1168139 m!1075505))

(declare-fun m!1075511 () Bool)

(assert (=> b!1168139 m!1075511))

(declare-fun m!1075513 () Bool)

(assert (=> b!1168139 m!1075513))

(declare-fun m!1075515 () Bool)

(assert (=> b!1168139 m!1075515))

(assert (=> b!1168139 m!1075513))

(declare-fun m!1075517 () Bool)

(assert (=> b!1168136 m!1075517))

(declare-fun m!1075519 () Bool)

(assert (=> b!1168136 m!1075519))

(declare-fun m!1075521 () Bool)

(assert (=> b!1168146 m!1075521))

(declare-fun m!1075523 () Bool)

(assert (=> b!1168146 m!1075523))

(declare-fun m!1075525 () Bool)

(assert (=> b!1168146 m!1075525))

(declare-fun m!1075527 () Bool)

(assert (=> b!1168146 m!1075527))

(declare-fun m!1075529 () Bool)

(assert (=> start!99206 m!1075529))

(declare-fun m!1075531 () Bool)

(assert (=> start!99206 m!1075531))

(declare-fun m!1075533 () Bool)

(assert (=> b!1168131 m!1075533))

(check-sat (not b_next!24817) (not b!1168131) (not b_lambda!19905) tp_is_empty!29347 (not b!1168146) (not mapNonEmpty!45845) (not start!99206) (not b!1168143) (not b!1168141) (not b!1168136) (not b!1168144) (not b!1168135) (not b!1168139) (not b!1168137) b_and!40463)
(check-sat b_and!40463 (not b_next!24817))
