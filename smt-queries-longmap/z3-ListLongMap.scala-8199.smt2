; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100296 () Bool)

(assert start!100296)

(declare-fun b_free!25639 () Bool)

(declare-fun b_next!25639 () Bool)

(assert (=> start!100296 (= b_free!25639 (not b_next!25639))))

(declare-fun tp!89631 () Bool)

(declare-fun b_and!42147 () Bool)

(assert (=> start!100296 (= tp!89631 b_and!42147)))

(declare-fun b!1193979 () Bool)

(declare-fun res!793953 () Bool)

(declare-fun e!678741 () Bool)

(assert (=> b!1193979 (=> (not res!793953) (not e!678741))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193979 (= res!793953 (validKeyInArray!0 k0!934))))

(declare-fun b!1193980 () Bool)

(declare-fun e!678742 () Bool)

(declare-fun tp_is_empty!30169 () Bool)

(assert (=> b!1193980 (= e!678742 tp_is_empty!30169)))

(declare-fun res!793951 () Bool)

(assert (=> start!100296 (=> (not res!793951) (not e!678741))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77163 0))(
  ( (array!77164 (arr!37225 (Array (_ BitVec 32) (_ BitVec 64))) (size!37762 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77163)

(assert (=> start!100296 (= res!793951 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37762 _keys!1208))))))

(assert (=> start!100296 e!678741))

(assert (=> start!100296 tp_is_empty!30169))

(declare-fun array_inv!28446 (array!77163) Bool)

(assert (=> start!100296 (array_inv!28446 _keys!1208)))

(assert (=> start!100296 true))

(assert (=> start!100296 tp!89631))

(declare-datatypes ((V!45353 0))(
  ( (V!45354 (val!15141 Int)) )
))
(declare-datatypes ((ValueCell!14375 0))(
  ( (ValueCellFull!14375 (v!17775 V!45353)) (EmptyCell!14375) )
))
(declare-datatypes ((array!77165 0))(
  ( (array!77166 (arr!37226 (Array (_ BitVec 32) ValueCell!14375)) (size!37763 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77165)

(declare-fun e!678745 () Bool)

(declare-fun array_inv!28447 (array!77165) Bool)

(assert (=> start!100296 (and (array_inv!28447 _values!996) e!678745)))

(declare-fun b!1193981 () Bool)

(declare-fun res!793946 () Bool)

(assert (=> b!1193981 (=> (not res!793946) (not e!678741))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77163 (_ BitVec 32)) Bool)

(assert (=> b!1193981 (= res!793946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193982 () Bool)

(declare-fun res!793947 () Bool)

(declare-fun e!678744 () Bool)

(assert (=> b!1193982 (=> (not res!793947) (not e!678744))))

(declare-fun lt!542797 () array!77163)

(declare-datatypes ((List!26238 0))(
  ( (Nil!26235) (Cons!26234 (h!27452 (_ BitVec 64)) (t!38861 List!26238)) )
))
(declare-fun arrayNoDuplicates!0 (array!77163 (_ BitVec 32) List!26238) Bool)

(assert (=> b!1193982 (= res!793947 (arrayNoDuplicates!0 lt!542797 #b00000000000000000000000000000000 Nil!26235))))

(declare-fun b!1193983 () Bool)

(declare-fun res!793954 () Bool)

(assert (=> b!1193983 (=> (not res!793954) (not e!678741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193983 (= res!793954 (validMask!0 mask!1564))))

(declare-fun b!1193984 () Bool)

(declare-fun res!793949 () Bool)

(assert (=> b!1193984 (=> (not res!793949) (not e!678741))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1193984 (= res!793949 (and (= (size!37763 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37762 _keys!1208) (size!37763 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193985 () Bool)

(assert (=> b!1193985 (= e!678741 e!678744)))

(declare-fun res!793955 () Bool)

(assert (=> b!1193985 (=> (not res!793955) (not e!678744))))

(assert (=> b!1193985 (= res!793955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542797 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1193985 (= lt!542797 (array!77164 (store (arr!37225 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37762 _keys!1208)))))

(declare-fun b!1193986 () Bool)

(declare-fun res!793948 () Bool)

(assert (=> b!1193986 (=> (not res!793948) (not e!678741))))

(assert (=> b!1193986 (= res!793948 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37762 _keys!1208))))))

(declare-fun b!1193987 () Bool)

(declare-fun e!678740 () Bool)

(assert (=> b!1193987 (= e!678740 true)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!542799 () array!77165)

(declare-fun minValue!944 () V!45353)

(declare-fun zeroValue!944 () V!45353)

(declare-datatypes ((tuple2!19496 0))(
  ( (tuple2!19497 (_1!9759 (_ BitVec 64)) (_2!9759 V!45353)) )
))
(declare-datatypes ((List!26239 0))(
  ( (Nil!26236) (Cons!26235 (h!27453 tuple2!19496) (t!38862 List!26239)) )
))
(declare-datatypes ((ListLongMap!17473 0))(
  ( (ListLongMap!17474 (toList!8752 List!26239)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5220 (array!77163 array!77165 (_ BitVec 32) (_ BitVec 32) V!45353 V!45353 (_ BitVec 32) Int) ListLongMap!17473)

(declare-fun -!1757 (ListLongMap!17473 (_ BitVec 64)) ListLongMap!17473)

(assert (=> b!1193987 (= (getCurrentListMapNoExtraKeys!5220 lt!542797 lt!542799 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1757 (getCurrentListMapNoExtraKeys!5220 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39545 0))(
  ( (Unit!39546) )
))
(declare-fun lt!542800 () Unit!39545)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!972 (array!77163 array!77165 (_ BitVec 32) (_ BitVec 32) V!45353 V!45353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39545)

(assert (=> b!1193987 (= lt!542800 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!972 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1193988 () Bool)

(declare-fun e!678746 () Bool)

(declare-fun mapRes!47081 () Bool)

(assert (=> b!1193988 (= e!678745 (and e!678746 mapRes!47081))))

(declare-fun condMapEmpty!47081 () Bool)

(declare-fun mapDefault!47081 () ValueCell!14375)

(assert (=> b!1193988 (= condMapEmpty!47081 (= (arr!37226 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14375)) mapDefault!47081)))))

(declare-fun mapNonEmpty!47081 () Bool)

(declare-fun tp!89630 () Bool)

(assert (=> mapNonEmpty!47081 (= mapRes!47081 (and tp!89630 e!678742))))

(declare-fun mapRest!47081 () (Array (_ BitVec 32) ValueCell!14375))

(declare-fun mapValue!47081 () ValueCell!14375)

(declare-fun mapKey!47081 () (_ BitVec 32))

(assert (=> mapNonEmpty!47081 (= (arr!37226 _values!996) (store mapRest!47081 mapKey!47081 mapValue!47081))))

(declare-fun b!1193989 () Bool)

(declare-fun e!678739 () Bool)

(assert (=> b!1193989 (= e!678744 (not e!678739))))

(declare-fun res!793950 () Bool)

(assert (=> b!1193989 (=> res!793950 e!678739)))

(assert (=> b!1193989 (= res!793950 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193989 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542796 () Unit!39545)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77163 (_ BitVec 64) (_ BitVec 32)) Unit!39545)

(assert (=> b!1193989 (= lt!542796 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!47081 () Bool)

(assert (=> mapIsEmpty!47081 mapRes!47081))

(declare-fun b!1193990 () Bool)

(declare-fun res!793952 () Bool)

(assert (=> b!1193990 (=> (not res!793952) (not e!678741))))

(assert (=> b!1193990 (= res!793952 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26235))))

(declare-fun b!1193991 () Bool)

(declare-fun res!793945 () Bool)

(assert (=> b!1193991 (=> (not res!793945) (not e!678741))))

(assert (=> b!1193991 (= res!793945 (= (select (arr!37225 _keys!1208) i!673) k0!934))))

(declare-fun b!1193992 () Bool)

(assert (=> b!1193992 (= e!678739 e!678740)))

(declare-fun res!793944 () Bool)

(assert (=> b!1193992 (=> res!793944 e!678740)))

(assert (=> b!1193992 (= res!793944 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!542798 () ListLongMap!17473)

(assert (=> b!1193992 (= lt!542798 (getCurrentListMapNoExtraKeys!5220 lt!542797 lt!542799 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3170 (Int (_ BitVec 64)) V!45353)

(assert (=> b!1193992 (= lt!542799 (array!77166 (store (arr!37226 _values!996) i!673 (ValueCellFull!14375 (dynLambda!3170 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37763 _values!996)))))

(declare-fun lt!542795 () ListLongMap!17473)

(assert (=> b!1193992 (= lt!542795 (getCurrentListMapNoExtraKeys!5220 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1193993 () Bool)

(assert (=> b!1193993 (= e!678746 tp_is_empty!30169)))

(assert (= (and start!100296 res!793951) b!1193983))

(assert (= (and b!1193983 res!793954) b!1193984))

(assert (= (and b!1193984 res!793949) b!1193981))

(assert (= (and b!1193981 res!793946) b!1193990))

(assert (= (and b!1193990 res!793952) b!1193986))

(assert (= (and b!1193986 res!793948) b!1193979))

(assert (= (and b!1193979 res!793953) b!1193991))

(assert (= (and b!1193991 res!793945) b!1193985))

(assert (= (and b!1193985 res!793955) b!1193982))

(assert (= (and b!1193982 res!793947) b!1193989))

(assert (= (and b!1193989 (not res!793950)) b!1193992))

(assert (= (and b!1193992 (not res!793944)) b!1193987))

(assert (= (and b!1193988 condMapEmpty!47081) mapIsEmpty!47081))

(assert (= (and b!1193988 (not condMapEmpty!47081)) mapNonEmpty!47081))

(get-info :version)

(assert (= (and mapNonEmpty!47081 ((_ is ValueCellFull!14375) mapValue!47081)) b!1193980))

(assert (= (and b!1193988 ((_ is ValueCellFull!14375) mapDefault!47081)) b!1193993))

(assert (= start!100296 b!1193988))

(declare-fun b_lambda!20777 () Bool)

(assert (=> (not b_lambda!20777) (not b!1193992)))

(declare-fun t!38860 () Bool)

(declare-fun tb!10443 () Bool)

(assert (=> (and start!100296 (= defaultEntry!1004 defaultEntry!1004) t!38860) tb!10443))

(declare-fun result!21461 () Bool)

(assert (=> tb!10443 (= result!21461 tp_is_empty!30169)))

(assert (=> b!1193992 t!38860))

(declare-fun b_and!42149 () Bool)

(assert (= b_and!42147 (and (=> t!38860 result!21461) b_and!42149)))

(declare-fun m!1102593 () Bool)

(assert (=> b!1193992 m!1102593))

(declare-fun m!1102595 () Bool)

(assert (=> b!1193992 m!1102595))

(declare-fun m!1102597 () Bool)

(assert (=> b!1193992 m!1102597))

(declare-fun m!1102599 () Bool)

(assert (=> b!1193992 m!1102599))

(declare-fun m!1102601 () Bool)

(assert (=> start!100296 m!1102601))

(declare-fun m!1102603 () Bool)

(assert (=> start!100296 m!1102603))

(declare-fun m!1102605 () Bool)

(assert (=> b!1193983 m!1102605))

(declare-fun m!1102607 () Bool)

(assert (=> mapNonEmpty!47081 m!1102607))

(declare-fun m!1102609 () Bool)

(assert (=> b!1193990 m!1102609))

(declare-fun m!1102611 () Bool)

(assert (=> b!1193991 m!1102611))

(declare-fun m!1102613 () Bool)

(assert (=> b!1193987 m!1102613))

(declare-fun m!1102615 () Bool)

(assert (=> b!1193987 m!1102615))

(assert (=> b!1193987 m!1102615))

(declare-fun m!1102617 () Bool)

(assert (=> b!1193987 m!1102617))

(declare-fun m!1102619 () Bool)

(assert (=> b!1193987 m!1102619))

(declare-fun m!1102621 () Bool)

(assert (=> b!1193981 m!1102621))

(declare-fun m!1102623 () Bool)

(assert (=> b!1193985 m!1102623))

(declare-fun m!1102625 () Bool)

(assert (=> b!1193985 m!1102625))

(declare-fun m!1102627 () Bool)

(assert (=> b!1193982 m!1102627))

(declare-fun m!1102629 () Bool)

(assert (=> b!1193989 m!1102629))

(declare-fun m!1102631 () Bool)

(assert (=> b!1193989 m!1102631))

(declare-fun m!1102633 () Bool)

(assert (=> b!1193979 m!1102633))

(check-sat (not b!1193990) (not b!1193981) b_and!42149 (not b!1193979) tp_is_empty!30169 (not b!1193992) (not b!1193985) (not b!1193989) (not b_lambda!20777) (not b!1193982) (not b!1193983) (not start!100296) (not b_next!25639) (not mapNonEmpty!47081) (not b!1193987))
(check-sat b_and!42149 (not b_next!25639))
