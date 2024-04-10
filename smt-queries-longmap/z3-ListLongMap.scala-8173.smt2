; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99906 () Bool)

(assert start!99906)

(declare-fun b_free!25485 () Bool)

(declare-fun b_next!25485 () Bool)

(assert (=> start!99906 (= b_free!25485 (not b_next!25485))))

(declare-fun tp!89168 () Bool)

(declare-fun b_and!41837 () Bool)

(assert (=> start!99906 (= tp!89168 b_and!41837)))

(declare-fun b!1189071 () Bool)

(declare-fun res!790665 () Bool)

(declare-fun e!676059 () Bool)

(assert (=> b!1189071 (=> (not res!790665) (not e!676059))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76825 0))(
  ( (array!76826 (arr!37062 (Array (_ BitVec 32) (_ BitVec 64))) (size!37598 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76825)

(assert (=> b!1189071 (= res!790665 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37598 _keys!1208))))))

(declare-fun b!1189072 () Bool)

(declare-fun res!790672 () Bool)

(assert (=> b!1189072 (=> (not res!790672) (not e!676059))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189072 (= res!790672 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!46850 () Bool)

(declare-fun mapRes!46850 () Bool)

(declare-fun tp!89169 () Bool)

(declare-fun e!676062 () Bool)

(assert (=> mapNonEmpty!46850 (= mapRes!46850 (and tp!89169 e!676062))))

(declare-datatypes ((V!45147 0))(
  ( (V!45148 (val!15064 Int)) )
))
(declare-datatypes ((ValueCell!14298 0))(
  ( (ValueCellFull!14298 (v!17702 V!45147)) (EmptyCell!14298) )
))
(declare-fun mapRest!46850 () (Array (_ BitVec 32) ValueCell!14298))

(declare-fun mapKey!46850 () (_ BitVec 32))

(declare-fun mapValue!46850 () ValueCell!14298)

(declare-datatypes ((array!76827 0))(
  ( (array!76828 (arr!37063 (Array (_ BitVec 32) ValueCell!14298)) (size!37599 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76827)

(assert (=> mapNonEmpty!46850 (= (arr!37063 _values!996) (store mapRest!46850 mapKey!46850 mapValue!46850))))

(declare-fun b!1189073 () Bool)

(declare-fun res!790670 () Bool)

(assert (=> b!1189073 (=> (not res!790670) (not e!676059))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189073 (= res!790670 (validMask!0 mask!1564))))

(declare-fun b!1189074 () Bool)

(declare-fun e!676065 () Bool)

(declare-fun e!676060 () Bool)

(assert (=> b!1189074 (= e!676065 e!676060)))

(declare-fun res!790671 () Bool)

(assert (=> b!1189074 (=> res!790671 e!676060)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1189074 (= res!790671 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45147)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!540930 () array!76827)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19346 0))(
  ( (tuple2!19347 (_1!9684 (_ BitVec 64)) (_2!9684 V!45147)) )
))
(declare-datatypes ((List!26091 0))(
  ( (Nil!26088) (Cons!26087 (h!27296 tuple2!19346) (t!38568 List!26091)) )
))
(declare-datatypes ((ListLongMap!17315 0))(
  ( (ListLongMap!17316 (toList!8673 List!26091)) )
))
(declare-fun lt!540927 () ListLongMap!17315)

(declare-fun lt!540928 () array!76825)

(declare-fun minValue!944 () V!45147)

(declare-fun getCurrentListMapNoExtraKeys!5114 (array!76825 array!76827 (_ BitVec 32) (_ BitVec 32) V!45147 V!45147 (_ BitVec 32) Int) ListLongMap!17315)

(assert (=> b!1189074 (= lt!540927 (getCurrentListMapNoExtraKeys!5114 lt!540928 lt!540930 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3058 (Int (_ BitVec 64)) V!45147)

(assert (=> b!1189074 (= lt!540930 (array!76828 (store (arr!37063 _values!996) i!673 (ValueCellFull!14298 (dynLambda!3058 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37599 _values!996)))))

(declare-fun lt!540929 () ListLongMap!17315)

(assert (=> b!1189074 (= lt!540929 (getCurrentListMapNoExtraKeys!5114 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1189075 () Bool)

(declare-fun e!676063 () Bool)

(declare-fun e!676061 () Bool)

(assert (=> b!1189075 (= e!676063 (and e!676061 mapRes!46850))))

(declare-fun condMapEmpty!46850 () Bool)

(declare-fun mapDefault!46850 () ValueCell!14298)

(assert (=> b!1189075 (= condMapEmpty!46850 (= (arr!37063 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14298)) mapDefault!46850)))))

(declare-fun mapIsEmpty!46850 () Bool)

(assert (=> mapIsEmpty!46850 mapRes!46850))

(declare-fun b!1189076 () Bool)

(declare-fun e!676064 () Bool)

(assert (=> b!1189076 (= e!676064 (not e!676065))))

(declare-fun res!790667 () Bool)

(assert (=> b!1189076 (=> res!790667 e!676065)))

(assert (=> b!1189076 (= res!790667 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189076 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39446 0))(
  ( (Unit!39447) )
))
(declare-fun lt!540925 () Unit!39446)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76825 (_ BitVec 64) (_ BitVec 32)) Unit!39446)

(assert (=> b!1189076 (= lt!540925 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1189077 () Bool)

(declare-fun res!790668 () Bool)

(assert (=> b!1189077 (=> (not res!790668) (not e!676059))))

(assert (=> b!1189077 (= res!790668 (and (= (size!37599 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37598 _keys!1208) (size!37599 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1189079 () Bool)

(assert (=> b!1189079 (= e!676059 e!676064)))

(declare-fun res!790664 () Bool)

(assert (=> b!1189079 (=> (not res!790664) (not e!676064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76825 (_ BitVec 32)) Bool)

(assert (=> b!1189079 (= res!790664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540928 mask!1564))))

(assert (=> b!1189079 (= lt!540928 (array!76826 (store (arr!37062 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37598 _keys!1208)))))

(declare-fun b!1189080 () Bool)

(declare-fun res!790675 () Bool)

(assert (=> b!1189080 (=> (not res!790675) (not e!676059))))

(assert (=> b!1189080 (= res!790675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1189081 () Bool)

(declare-fun res!790666 () Bool)

(assert (=> b!1189081 (=> (not res!790666) (not e!676059))))

(declare-datatypes ((List!26092 0))(
  ( (Nil!26089) (Cons!26088 (h!27297 (_ BitVec 64)) (t!38569 List!26092)) )
))
(declare-fun arrayNoDuplicates!0 (array!76825 (_ BitVec 32) List!26092) Bool)

(assert (=> b!1189081 (= res!790666 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26089))))

(declare-fun b!1189082 () Bool)

(declare-fun tp_is_empty!30015 () Bool)

(assert (=> b!1189082 (= e!676061 tp_is_empty!30015)))

(declare-fun b!1189083 () Bool)

(assert (=> b!1189083 (= e!676062 tp_is_empty!30015)))

(declare-fun b!1189084 () Bool)

(declare-fun res!790674 () Bool)

(assert (=> b!1189084 (=> (not res!790674) (not e!676064))))

(assert (=> b!1189084 (= res!790674 (arrayNoDuplicates!0 lt!540928 #b00000000000000000000000000000000 Nil!26089))))

(declare-fun b!1189085 () Bool)

(declare-fun res!790669 () Bool)

(assert (=> b!1189085 (=> (not res!790669) (not e!676059))))

(assert (=> b!1189085 (= res!790669 (= (select (arr!37062 _keys!1208) i!673) k0!934))))

(declare-fun b!1189078 () Bool)

(assert (=> b!1189078 (= e!676060 true)))

(declare-fun -!1703 (ListLongMap!17315 (_ BitVec 64)) ListLongMap!17315)

(assert (=> b!1189078 (= (getCurrentListMapNoExtraKeys!5114 lt!540928 lt!540930 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1703 (getCurrentListMapNoExtraKeys!5114 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!540926 () Unit!39446)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!912 (array!76825 array!76827 (_ BitVec 32) (_ BitVec 32) V!45147 V!45147 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39446)

(assert (=> b!1189078 (= lt!540926 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!912 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!790673 () Bool)

(assert (=> start!99906 (=> (not res!790673) (not e!676059))))

(assert (=> start!99906 (= res!790673 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37598 _keys!1208))))))

(assert (=> start!99906 e!676059))

(assert (=> start!99906 tp_is_empty!30015))

(declare-fun array_inv!28268 (array!76825) Bool)

(assert (=> start!99906 (array_inv!28268 _keys!1208)))

(assert (=> start!99906 true))

(assert (=> start!99906 tp!89168))

(declare-fun array_inv!28269 (array!76827) Bool)

(assert (=> start!99906 (and (array_inv!28269 _values!996) e!676063)))

(assert (= (and start!99906 res!790673) b!1189073))

(assert (= (and b!1189073 res!790670) b!1189077))

(assert (= (and b!1189077 res!790668) b!1189080))

(assert (= (and b!1189080 res!790675) b!1189081))

(assert (= (and b!1189081 res!790666) b!1189071))

(assert (= (and b!1189071 res!790665) b!1189072))

(assert (= (and b!1189072 res!790672) b!1189085))

(assert (= (and b!1189085 res!790669) b!1189079))

(assert (= (and b!1189079 res!790664) b!1189084))

(assert (= (and b!1189084 res!790674) b!1189076))

(assert (= (and b!1189076 (not res!790667)) b!1189074))

(assert (= (and b!1189074 (not res!790671)) b!1189078))

(assert (= (and b!1189075 condMapEmpty!46850) mapIsEmpty!46850))

(assert (= (and b!1189075 (not condMapEmpty!46850)) mapNonEmpty!46850))

(get-info :version)

(assert (= (and mapNonEmpty!46850 ((_ is ValueCellFull!14298) mapValue!46850)) b!1189083))

(assert (= (and b!1189075 ((_ is ValueCellFull!14298) mapDefault!46850)) b!1189082))

(assert (= start!99906 b!1189075))

(declare-fun b_lambda!20629 () Bool)

(assert (=> (not b_lambda!20629) (not b!1189074)))

(declare-fun t!38567 () Bool)

(declare-fun tb!10297 () Bool)

(assert (=> (and start!99906 (= defaultEntry!1004 defaultEntry!1004) t!38567) tb!10297))

(declare-fun result!21161 () Bool)

(assert (=> tb!10297 (= result!21161 tp_is_empty!30015)))

(assert (=> b!1189074 t!38567))

(declare-fun b_and!41839 () Bool)

(assert (= b_and!41837 (and (=> t!38567 result!21161) b_and!41839)))

(declare-fun m!1097787 () Bool)

(assert (=> b!1189080 m!1097787))

(declare-fun m!1097789 () Bool)

(assert (=> b!1189073 m!1097789))

(declare-fun m!1097791 () Bool)

(assert (=> b!1189085 m!1097791))

(declare-fun m!1097793 () Bool)

(assert (=> mapNonEmpty!46850 m!1097793))

(declare-fun m!1097795 () Bool)

(assert (=> b!1189076 m!1097795))

(declare-fun m!1097797 () Bool)

(assert (=> b!1189076 m!1097797))

(declare-fun m!1097799 () Bool)

(assert (=> b!1189079 m!1097799))

(declare-fun m!1097801 () Bool)

(assert (=> b!1189079 m!1097801))

(declare-fun m!1097803 () Bool)

(assert (=> b!1189081 m!1097803))

(declare-fun m!1097805 () Bool)

(assert (=> b!1189084 m!1097805))

(declare-fun m!1097807 () Bool)

(assert (=> start!99906 m!1097807))

(declare-fun m!1097809 () Bool)

(assert (=> start!99906 m!1097809))

(declare-fun m!1097811 () Bool)

(assert (=> b!1189072 m!1097811))

(declare-fun m!1097813 () Bool)

(assert (=> b!1189078 m!1097813))

(declare-fun m!1097815 () Bool)

(assert (=> b!1189078 m!1097815))

(assert (=> b!1189078 m!1097815))

(declare-fun m!1097817 () Bool)

(assert (=> b!1189078 m!1097817))

(declare-fun m!1097819 () Bool)

(assert (=> b!1189078 m!1097819))

(declare-fun m!1097821 () Bool)

(assert (=> b!1189074 m!1097821))

(declare-fun m!1097823 () Bool)

(assert (=> b!1189074 m!1097823))

(declare-fun m!1097825 () Bool)

(assert (=> b!1189074 m!1097825))

(declare-fun m!1097827 () Bool)

(assert (=> b!1189074 m!1097827))

(check-sat (not b!1189078) (not b!1189081) (not b!1189080) (not b!1189073) tp_is_empty!30015 (not b!1189072) (not b!1189076) (not mapNonEmpty!46850) (not b!1189084) b_and!41839 (not b_next!25485) (not b!1189074) (not b!1189079) (not b_lambda!20629) (not start!99906))
(check-sat b_and!41839 (not b_next!25485))
