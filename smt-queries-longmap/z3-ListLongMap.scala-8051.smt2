; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99148 () Bool)

(assert start!99148)

(declare-fun b_free!24753 () Bool)

(declare-fun b_next!24753 () Bool)

(assert (=> start!99148 (= b_free!24753 (not b_next!24753))))

(declare-fun tp!86970 () Bool)

(declare-fun b_and!40355 () Bool)

(assert (=> start!99148 (= tp!86970 b_and!40355)))

(declare-fun mapNonEmpty!45749 () Bool)

(declare-fun mapRes!45749 () Bool)

(declare-fun tp!86969 () Bool)

(declare-fun e!663201 () Bool)

(assert (=> mapNonEmpty!45749 (= mapRes!45749 (and tp!86969 e!663201))))

(declare-fun mapKey!45749 () (_ BitVec 32))

(declare-datatypes ((V!44171 0))(
  ( (V!44172 (val!14698 Int)) )
))
(declare-datatypes ((ValueCell!13932 0))(
  ( (ValueCellFull!13932 (v!17335 V!44171)) (EmptyCell!13932) )
))
(declare-fun mapRest!45749 () (Array (_ BitVec 32) ValueCell!13932))

(declare-datatypes ((array!75397 0))(
  ( (array!75398 (arr!36349 (Array (_ BitVec 32) ValueCell!13932)) (size!36885 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75397)

(declare-fun mapValue!45749 () ValueCell!13932)

(assert (=> mapNonEmpty!45749 (= (arr!36349 _values!996) (store mapRest!45749 mapKey!45749 mapValue!45749))))

(declare-fun b!1166749 () Bool)

(declare-fun e!663195 () Bool)

(declare-fun e!663199 () Bool)

(assert (=> b!1166749 (= e!663195 (and e!663199 mapRes!45749))))

(declare-fun condMapEmpty!45749 () Bool)

(declare-fun mapDefault!45749 () ValueCell!13932)

(assert (=> b!1166749 (= condMapEmpty!45749 (= (arr!36349 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13932)) mapDefault!45749)))))

(declare-fun b!1166750 () Bool)

(declare-fun tp_is_empty!29283 () Bool)

(assert (=> b!1166750 (= e!663201 tp_is_empty!29283)))

(declare-fun b!1166751 () Bool)

(declare-fun res!773936 () Bool)

(declare-fun e!663194 () Bool)

(assert (=> b!1166751 (=> (not res!773936) (not e!663194))))

(declare-datatypes ((array!75399 0))(
  ( (array!75400 (arr!36350 (Array (_ BitVec 32) (_ BitVec 64))) (size!36886 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75399)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75399 (_ BitVec 32)) Bool)

(assert (=> b!1166751 (= res!773936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1166752 () Bool)

(declare-fun res!773939 () Bool)

(assert (=> b!1166752 (=> (not res!773939) (not e!663194))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1166752 (= res!773939 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36886 _keys!1208))))))

(declare-fun b!1166753 () Bool)

(declare-fun e!663198 () Bool)

(declare-fun e!663196 () Bool)

(assert (=> b!1166753 (= e!663198 e!663196)))

(declare-fun res!773932 () Bool)

(assert (=> b!1166753 (=> res!773932 e!663196)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1166753 (= res!773932 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44171)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525372 () array!75397)

(declare-fun minValue!944 () V!44171)

(declare-fun lt!525370 () array!75399)

(declare-datatypes ((tuple2!18746 0))(
  ( (tuple2!18747 (_1!9384 (_ BitVec 64)) (_2!9384 V!44171)) )
))
(declare-datatypes ((List!25487 0))(
  ( (Nil!25484) (Cons!25483 (h!26692 tuple2!18746) (t!37232 List!25487)) )
))
(declare-datatypes ((ListLongMap!16715 0))(
  ( (ListLongMap!16716 (toList!8373 List!25487)) )
))
(declare-fun lt!525373 () ListLongMap!16715)

(declare-fun getCurrentListMapNoExtraKeys!4837 (array!75399 array!75397 (_ BitVec 32) (_ BitVec 32) V!44171 V!44171 (_ BitVec 32) Int) ListLongMap!16715)

(assert (=> b!1166753 (= lt!525373 (getCurrentListMapNoExtraKeys!4837 lt!525370 lt!525372 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2825 (Int (_ BitVec 64)) V!44171)

(assert (=> b!1166753 (= lt!525372 (array!75398 (store (arr!36349 _values!996) i!673 (ValueCellFull!13932 (dynLambda!2825 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36885 _values!996)))))

(declare-fun lt!525374 () ListLongMap!16715)

(assert (=> b!1166753 (= lt!525374 (getCurrentListMapNoExtraKeys!4837 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!45749 () Bool)

(assert (=> mapIsEmpty!45749 mapRes!45749))

(declare-fun b!1166754 () Bool)

(declare-fun e!663197 () Bool)

(assert (=> b!1166754 (= e!663197 (not e!663198))))

(declare-fun res!773929 () Bool)

(assert (=> b!1166754 (=> res!773929 e!663198)))

(assert (=> b!1166754 (= res!773929 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166754 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38500 0))(
  ( (Unit!38501) )
))
(declare-fun lt!525371 () Unit!38500)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75399 (_ BitVec 64) (_ BitVec 32)) Unit!38500)

(assert (=> b!1166754 (= lt!525371 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1166755 () Bool)

(declare-fun res!773935 () Bool)

(assert (=> b!1166755 (=> (not res!773935) (not e!663194))))

(declare-datatypes ((List!25488 0))(
  ( (Nil!25485) (Cons!25484 (h!26693 (_ BitVec 64)) (t!37233 List!25488)) )
))
(declare-fun arrayNoDuplicates!0 (array!75399 (_ BitVec 32) List!25488) Bool)

(assert (=> b!1166755 (= res!773935 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25485))))

(declare-fun res!773934 () Bool)

(assert (=> start!99148 (=> (not res!773934) (not e!663194))))

(assert (=> start!99148 (= res!773934 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36886 _keys!1208))))))

(assert (=> start!99148 e!663194))

(assert (=> start!99148 tp_is_empty!29283))

(declare-fun array_inv!27794 (array!75399) Bool)

(assert (=> start!99148 (array_inv!27794 _keys!1208)))

(assert (=> start!99148 true))

(assert (=> start!99148 tp!86970))

(declare-fun array_inv!27795 (array!75397) Bool)

(assert (=> start!99148 (and (array_inv!27795 _values!996) e!663195)))

(declare-fun b!1166756 () Bool)

(declare-fun res!773930 () Bool)

(assert (=> b!1166756 (=> (not res!773930) (not e!663194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166756 (= res!773930 (validKeyInArray!0 k0!934))))

(declare-fun b!1166757 () Bool)

(declare-fun res!773938 () Bool)

(assert (=> b!1166757 (=> (not res!773938) (not e!663194))))

(assert (=> b!1166757 (= res!773938 (= (select (arr!36350 _keys!1208) i!673) k0!934))))

(declare-fun b!1166758 () Bool)

(assert (=> b!1166758 (= e!663196 true)))

(declare-fun -!1449 (ListLongMap!16715 (_ BitVec 64)) ListLongMap!16715)

(assert (=> b!1166758 (= (getCurrentListMapNoExtraKeys!4837 lt!525370 lt!525372 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1449 (getCurrentListMapNoExtraKeys!4837 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!525375 () Unit!38500)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!676 (array!75399 array!75397 (_ BitVec 32) (_ BitVec 32) V!44171 V!44171 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38500)

(assert (=> b!1166758 (= lt!525375 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!676 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1166759 () Bool)

(assert (=> b!1166759 (= e!663194 e!663197)))

(declare-fun res!773928 () Bool)

(assert (=> b!1166759 (=> (not res!773928) (not e!663197))))

(assert (=> b!1166759 (= res!773928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525370 mask!1564))))

(assert (=> b!1166759 (= lt!525370 (array!75400 (store (arr!36350 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36886 _keys!1208)))))

(declare-fun b!1166760 () Bool)

(assert (=> b!1166760 (= e!663199 tp_is_empty!29283)))

(declare-fun b!1166761 () Bool)

(declare-fun res!773931 () Bool)

(assert (=> b!1166761 (=> (not res!773931) (not e!663197))))

(assert (=> b!1166761 (= res!773931 (arrayNoDuplicates!0 lt!525370 #b00000000000000000000000000000000 Nil!25485))))

(declare-fun b!1166762 () Bool)

(declare-fun res!773937 () Bool)

(assert (=> b!1166762 (=> (not res!773937) (not e!663194))))

(assert (=> b!1166762 (= res!773937 (and (= (size!36885 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36886 _keys!1208) (size!36885 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1166763 () Bool)

(declare-fun res!773933 () Bool)

(assert (=> b!1166763 (=> (not res!773933) (not e!663194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166763 (= res!773933 (validMask!0 mask!1564))))

(assert (= (and start!99148 res!773934) b!1166763))

(assert (= (and b!1166763 res!773933) b!1166762))

(assert (= (and b!1166762 res!773937) b!1166751))

(assert (= (and b!1166751 res!773936) b!1166755))

(assert (= (and b!1166755 res!773935) b!1166752))

(assert (= (and b!1166752 res!773939) b!1166756))

(assert (= (and b!1166756 res!773930) b!1166757))

(assert (= (and b!1166757 res!773938) b!1166759))

(assert (= (and b!1166759 res!773928) b!1166761))

(assert (= (and b!1166761 res!773931) b!1166754))

(assert (= (and b!1166754 (not res!773929)) b!1166753))

(assert (= (and b!1166753 (not res!773932)) b!1166758))

(assert (= (and b!1166749 condMapEmpty!45749) mapIsEmpty!45749))

(assert (= (and b!1166749 (not condMapEmpty!45749)) mapNonEmpty!45749))

(get-info :version)

(assert (= (and mapNonEmpty!45749 ((_ is ValueCellFull!13932) mapValue!45749)) b!1166750))

(assert (= (and b!1166749 ((_ is ValueCellFull!13932) mapDefault!45749)) b!1166760))

(assert (= start!99148 b!1166749))

(declare-fun b_lambda!19859 () Bool)

(assert (=> (not b_lambda!19859) (not b!1166753)))

(declare-fun t!37231 () Bool)

(declare-fun tb!9565 () Bool)

(assert (=> (and start!99148 (= defaultEntry!1004 defaultEntry!1004) t!37231) tb!9565))

(declare-fun result!19695 () Bool)

(assert (=> tb!9565 (= result!19695 tp_is_empty!29283)))

(assert (=> b!1166753 t!37231))

(declare-fun b_and!40357 () Bool)

(assert (= b_and!40355 (and (=> t!37231 result!19695) b_and!40357)))

(declare-fun m!1074755 () Bool)

(assert (=> start!99148 m!1074755))

(declare-fun m!1074757 () Bool)

(assert (=> start!99148 m!1074757))

(declare-fun m!1074759 () Bool)

(assert (=> b!1166757 m!1074759))

(declare-fun m!1074761 () Bool)

(assert (=> b!1166761 m!1074761))

(declare-fun m!1074763 () Bool)

(assert (=> b!1166756 m!1074763))

(declare-fun m!1074765 () Bool)

(assert (=> b!1166755 m!1074765))

(declare-fun m!1074767 () Bool)

(assert (=> b!1166763 m!1074767))

(declare-fun m!1074769 () Bool)

(assert (=> b!1166759 m!1074769))

(declare-fun m!1074771 () Bool)

(assert (=> b!1166759 m!1074771))

(declare-fun m!1074773 () Bool)

(assert (=> b!1166754 m!1074773))

(declare-fun m!1074775 () Bool)

(assert (=> b!1166754 m!1074775))

(declare-fun m!1074777 () Bool)

(assert (=> b!1166758 m!1074777))

(declare-fun m!1074779 () Bool)

(assert (=> b!1166758 m!1074779))

(assert (=> b!1166758 m!1074779))

(declare-fun m!1074781 () Bool)

(assert (=> b!1166758 m!1074781))

(declare-fun m!1074783 () Bool)

(assert (=> b!1166758 m!1074783))

(declare-fun m!1074785 () Bool)

(assert (=> mapNonEmpty!45749 m!1074785))

(declare-fun m!1074787 () Bool)

(assert (=> b!1166753 m!1074787))

(declare-fun m!1074789 () Bool)

(assert (=> b!1166753 m!1074789))

(declare-fun m!1074791 () Bool)

(assert (=> b!1166753 m!1074791))

(declare-fun m!1074793 () Bool)

(assert (=> b!1166753 m!1074793))

(declare-fun m!1074795 () Bool)

(assert (=> b!1166751 m!1074795))

(check-sat (not b!1166761) (not b!1166759) (not b!1166758) (not b!1166751) (not b_next!24753) b_and!40357 (not b!1166756) (not b!1166763) (not b_lambda!19859) (not b!1166755) (not mapNonEmpty!45749) (not b!1166754) tp_is_empty!29283 (not b!1166753) (not start!99148))
(check-sat b_and!40357 (not b_next!24753))
