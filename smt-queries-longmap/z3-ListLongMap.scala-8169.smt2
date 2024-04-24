; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100116 () Bool)

(assert start!100116)

(declare-fun b_free!25459 () Bool)

(declare-fun b_next!25459 () Bool)

(assert (=> start!100116 (= b_free!25459 (not b_next!25459))))

(declare-fun tp!89090 () Bool)

(declare-fun b_and!41787 () Bool)

(assert (=> start!100116 (= tp!89090 b_and!41787)))

(declare-fun b!1189749 () Bool)

(declare-fun e!676579 () Bool)

(declare-fun tp_is_empty!29989 () Bool)

(assert (=> b!1189749 (= e!676579 tp_is_empty!29989)))

(declare-fun b!1189750 () Bool)

(declare-fun res!790715 () Bool)

(declare-fun e!676585 () Bool)

(assert (=> b!1189750 (=> (not res!790715) (not e!676585))))

(declare-datatypes ((array!76819 0))(
  ( (array!76820 (arr!37053 (Array (_ BitVec 32) (_ BitVec 64))) (size!37590 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76819)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45113 0))(
  ( (V!45114 (val!15051 Int)) )
))
(declare-datatypes ((ValueCell!14285 0))(
  ( (ValueCellFull!14285 (v!17685 V!45113)) (EmptyCell!14285) )
))
(declare-datatypes ((array!76821 0))(
  ( (array!76822 (arr!37054 (Array (_ BitVec 32) ValueCell!14285)) (size!37591 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76821)

(assert (=> b!1189750 (= res!790715 (and (= (size!37591 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37590 _keys!1208) (size!37591 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1189751 () Bool)

(declare-fun e!676583 () Bool)

(assert (=> b!1189751 (= e!676585 e!676583)))

(declare-fun res!790710 () Bool)

(assert (=> b!1189751 (=> (not res!790710) (not e!676583))))

(declare-fun lt!541176 () array!76819)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76819 (_ BitVec 32)) Bool)

(assert (=> b!1189751 (= res!790710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541176 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1189751 (= lt!541176 (array!76820 (store (arr!37053 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37590 _keys!1208)))))

(declare-fun mapIsEmpty!46811 () Bool)

(declare-fun mapRes!46811 () Bool)

(assert (=> mapIsEmpty!46811 mapRes!46811))

(declare-fun b!1189752 () Bool)

(declare-fun res!790708 () Bool)

(assert (=> b!1189752 (=> (not res!790708) (not e!676585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189752 (= res!790708 (validMask!0 mask!1564))))

(declare-fun b!1189753 () Bool)

(declare-fun res!790706 () Bool)

(assert (=> b!1189753 (=> (not res!790706) (not e!676585))))

(declare-datatypes ((List!26103 0))(
  ( (Nil!26100) (Cons!26099 (h!27317 (_ BitVec 64)) (t!38546 List!26103)) )
))
(declare-fun arrayNoDuplicates!0 (array!76819 (_ BitVec 32) List!26103) Bool)

(assert (=> b!1189753 (= res!790706 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26100))))

(declare-fun b!1189754 () Bool)

(declare-fun e!676582 () Bool)

(assert (=> b!1189754 (= e!676583 (not e!676582))))

(declare-fun res!790713 () Bool)

(assert (=> b!1189754 (=> res!790713 e!676582)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1189754 (= res!790713 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189754 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39409 0))(
  ( (Unit!39410) )
))
(declare-fun lt!541180 () Unit!39409)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76819 (_ BitVec 64) (_ BitVec 32)) Unit!39409)

(assert (=> b!1189754 (= lt!541180 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1189755 () Bool)

(declare-fun res!790714 () Bool)

(assert (=> b!1189755 (=> (not res!790714) (not e!676585))))

(assert (=> b!1189755 (= res!790714 (= (select (arr!37053 _keys!1208) i!673) k0!934))))

(declare-fun b!1189756 () Bool)

(declare-fun res!790709 () Bool)

(assert (=> b!1189756 (=> (not res!790709) (not e!676583))))

(assert (=> b!1189756 (= res!790709 (arrayNoDuplicates!0 lt!541176 #b00000000000000000000000000000000 Nil!26100))))

(declare-fun b!1189757 () Bool)

(declare-fun res!790712 () Bool)

(assert (=> b!1189757 (=> (not res!790712) (not e!676585))))

(assert (=> b!1189757 (= res!790712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1189758 () Bool)

(declare-fun res!790705 () Bool)

(assert (=> b!1189758 (=> (not res!790705) (not e!676585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189758 (= res!790705 (validKeyInArray!0 k0!934))))

(declare-fun b!1189759 () Bool)

(declare-fun e!676586 () Bool)

(assert (=> b!1189759 (= e!676586 true)))

(declare-fun zeroValue!944 () V!45113)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541178 () array!76821)

(declare-fun minValue!944 () V!45113)

(declare-datatypes ((tuple2!19362 0))(
  ( (tuple2!19363 (_1!9692 (_ BitVec 64)) (_2!9692 V!45113)) )
))
(declare-datatypes ((List!26104 0))(
  ( (Nil!26101) (Cons!26100 (h!27318 tuple2!19362) (t!38547 List!26104)) )
))
(declare-datatypes ((ListLongMap!17339 0))(
  ( (ListLongMap!17340 (toList!8685 List!26104)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5153 (array!76819 array!76821 (_ BitVec 32) (_ BitVec 32) V!45113 V!45113 (_ BitVec 32) Int) ListLongMap!17339)

(declare-fun -!1703 (ListLongMap!17339 (_ BitVec 64)) ListLongMap!17339)

(assert (=> b!1189759 (= (getCurrentListMapNoExtraKeys!5153 lt!541176 lt!541178 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1703 (getCurrentListMapNoExtraKeys!5153 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541177 () Unit!39409)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!918 (array!76819 array!76821 (_ BitVec 32) (_ BitVec 32) V!45113 V!45113 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39409)

(assert (=> b!1189759 (= lt!541177 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!918 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!46811 () Bool)

(declare-fun tp!89091 () Bool)

(declare-fun e!676584 () Bool)

(assert (=> mapNonEmpty!46811 (= mapRes!46811 (and tp!89091 e!676584))))

(declare-fun mapRest!46811 () (Array (_ BitVec 32) ValueCell!14285))

(declare-fun mapValue!46811 () ValueCell!14285)

(declare-fun mapKey!46811 () (_ BitVec 32))

(assert (=> mapNonEmpty!46811 (= (arr!37054 _values!996) (store mapRest!46811 mapKey!46811 mapValue!46811))))

(declare-fun b!1189760 () Bool)

(declare-fun e!676581 () Bool)

(assert (=> b!1189760 (= e!676581 (and e!676579 mapRes!46811))))

(declare-fun condMapEmpty!46811 () Bool)

(declare-fun mapDefault!46811 () ValueCell!14285)

(assert (=> b!1189760 (= condMapEmpty!46811 (= (arr!37054 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14285)) mapDefault!46811)))))

(declare-fun res!790711 () Bool)

(assert (=> start!100116 (=> (not res!790711) (not e!676585))))

(assert (=> start!100116 (= res!790711 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37590 _keys!1208))))))

(assert (=> start!100116 e!676585))

(assert (=> start!100116 tp_is_empty!29989))

(declare-fun array_inv!28336 (array!76819) Bool)

(assert (=> start!100116 (array_inv!28336 _keys!1208)))

(assert (=> start!100116 true))

(assert (=> start!100116 tp!89090))

(declare-fun array_inv!28337 (array!76821) Bool)

(assert (=> start!100116 (and (array_inv!28337 _values!996) e!676581)))

(declare-fun b!1189761 () Bool)

(assert (=> b!1189761 (= e!676584 tp_is_empty!29989)))

(declare-fun b!1189762 () Bool)

(declare-fun res!790704 () Bool)

(assert (=> b!1189762 (=> (not res!790704) (not e!676585))))

(assert (=> b!1189762 (= res!790704 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37590 _keys!1208))))))

(declare-fun b!1189763 () Bool)

(assert (=> b!1189763 (= e!676582 e!676586)))

(declare-fun res!790707 () Bool)

(assert (=> b!1189763 (=> res!790707 e!676586)))

(assert (=> b!1189763 (= res!790707 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541179 () ListLongMap!17339)

(assert (=> b!1189763 (= lt!541179 (getCurrentListMapNoExtraKeys!5153 lt!541176 lt!541178 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3111 (Int (_ BitVec 64)) V!45113)

(assert (=> b!1189763 (= lt!541178 (array!76822 (store (arr!37054 _values!996) i!673 (ValueCellFull!14285 (dynLambda!3111 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37591 _values!996)))))

(declare-fun lt!541175 () ListLongMap!17339)

(assert (=> b!1189763 (= lt!541175 (getCurrentListMapNoExtraKeys!5153 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!100116 res!790711) b!1189752))

(assert (= (and b!1189752 res!790708) b!1189750))

(assert (= (and b!1189750 res!790715) b!1189757))

(assert (= (and b!1189757 res!790712) b!1189753))

(assert (= (and b!1189753 res!790706) b!1189762))

(assert (= (and b!1189762 res!790704) b!1189758))

(assert (= (and b!1189758 res!790705) b!1189755))

(assert (= (and b!1189755 res!790714) b!1189751))

(assert (= (and b!1189751 res!790710) b!1189756))

(assert (= (and b!1189756 res!790709) b!1189754))

(assert (= (and b!1189754 (not res!790713)) b!1189763))

(assert (= (and b!1189763 (not res!790707)) b!1189759))

(assert (= (and b!1189760 condMapEmpty!46811) mapIsEmpty!46811))

(assert (= (and b!1189760 (not condMapEmpty!46811)) mapNonEmpty!46811))

(get-info :version)

(assert (= (and mapNonEmpty!46811 ((_ is ValueCellFull!14285) mapValue!46811)) b!1189761))

(assert (= (and b!1189760 ((_ is ValueCellFull!14285) mapDefault!46811)) b!1189749))

(assert (= start!100116 b!1189760))

(declare-fun b_lambda!20597 () Bool)

(assert (=> (not b_lambda!20597) (not b!1189763)))

(declare-fun t!38545 () Bool)

(declare-fun tb!10263 () Bool)

(assert (=> (and start!100116 (= defaultEntry!1004 defaultEntry!1004) t!38545) tb!10263))

(declare-fun result!21101 () Bool)

(assert (=> tb!10263 (= result!21101 tp_is_empty!29989)))

(assert (=> b!1189763 t!38545))

(declare-fun b_and!41789 () Bool)

(assert (= b_and!41787 (and (=> t!38545 result!21101) b_and!41789)))

(declare-fun m!1098813 () Bool)

(assert (=> b!1189755 m!1098813))

(declare-fun m!1098815 () Bool)

(assert (=> b!1189751 m!1098815))

(declare-fun m!1098817 () Bool)

(assert (=> b!1189751 m!1098817))

(declare-fun m!1098819 () Bool)

(assert (=> start!100116 m!1098819))

(declare-fun m!1098821 () Bool)

(assert (=> start!100116 m!1098821))

(declare-fun m!1098823 () Bool)

(assert (=> b!1189757 m!1098823))

(declare-fun m!1098825 () Bool)

(assert (=> b!1189752 m!1098825))

(declare-fun m!1098827 () Bool)

(assert (=> b!1189754 m!1098827))

(declare-fun m!1098829 () Bool)

(assert (=> b!1189754 m!1098829))

(declare-fun m!1098831 () Bool)

(assert (=> b!1189753 m!1098831))

(declare-fun m!1098833 () Bool)

(assert (=> b!1189759 m!1098833))

(declare-fun m!1098835 () Bool)

(assert (=> b!1189759 m!1098835))

(assert (=> b!1189759 m!1098835))

(declare-fun m!1098837 () Bool)

(assert (=> b!1189759 m!1098837))

(declare-fun m!1098839 () Bool)

(assert (=> b!1189759 m!1098839))

(declare-fun m!1098841 () Bool)

(assert (=> b!1189756 m!1098841))

(declare-fun m!1098843 () Bool)

(assert (=> b!1189763 m!1098843))

(declare-fun m!1098845 () Bool)

(assert (=> b!1189763 m!1098845))

(declare-fun m!1098847 () Bool)

(assert (=> b!1189763 m!1098847))

(declare-fun m!1098849 () Bool)

(assert (=> b!1189763 m!1098849))

(declare-fun m!1098851 () Bool)

(assert (=> b!1189758 m!1098851))

(declare-fun m!1098853 () Bool)

(assert (=> mapNonEmpty!46811 m!1098853))

(check-sat (not b_lambda!20597) (not b!1189751) (not mapNonEmpty!46811) tp_is_empty!29989 (not b_next!25459) (not b!1189759) (not b!1189754) (not b!1189752) (not b!1189756) (not b!1189753) (not b!1189758) (not start!100116) b_and!41789 (not b!1189763) (not b!1189757))
(check-sat b_and!41789 (not b_next!25459))
