; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99118 () Bool)

(assert start!99118)

(declare-fun b_free!24723 () Bool)

(declare-fun b_next!24723 () Bool)

(assert (=> start!99118 (= b_free!24723 (not b_next!24723))))

(declare-fun tp!86879 () Bool)

(declare-fun b_and!40295 () Bool)

(assert (=> start!99118 (= tp!86879 b_and!40295)))

(declare-fun mapNonEmpty!45704 () Bool)

(declare-fun mapRes!45704 () Bool)

(declare-fun tp!86880 () Bool)

(declare-fun e!662837 () Bool)

(assert (=> mapNonEmpty!45704 (= mapRes!45704 (and tp!86880 e!662837))))

(declare-datatypes ((V!44131 0))(
  ( (V!44132 (val!14683 Int)) )
))
(declare-datatypes ((ValueCell!13917 0))(
  ( (ValueCellFull!13917 (v!17320 V!44131)) (EmptyCell!13917) )
))
(declare-fun mapValue!45704 () ValueCell!13917)

(declare-fun mapRest!45704 () (Array (_ BitVec 32) ValueCell!13917))

(declare-datatypes ((array!75337 0))(
  ( (array!75338 (arr!36319 (Array (_ BitVec 32) ValueCell!13917)) (size!36855 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75337)

(declare-fun mapKey!45704 () (_ BitVec 32))

(assert (=> mapNonEmpty!45704 (= (arr!36319 _values!996) (store mapRest!45704 mapKey!45704 mapValue!45704))))

(declare-fun b!1166044 () Bool)

(declare-fun e!662838 () Bool)

(declare-fun e!662841 () Bool)

(assert (=> b!1166044 (= e!662838 (and e!662841 mapRes!45704))))

(declare-fun condMapEmpty!45704 () Bool)

(declare-fun mapDefault!45704 () ValueCell!13917)

(assert (=> b!1166044 (= condMapEmpty!45704 (= (arr!36319 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13917)) mapDefault!45704)))))

(declare-fun b!1166045 () Bool)

(declare-fun res!773395 () Bool)

(declare-fun e!662834 () Bool)

(assert (=> b!1166045 (=> (not res!773395) (not e!662834))))

(declare-datatypes ((array!75339 0))(
  ( (array!75340 (arr!36320 (Array (_ BitVec 32) (_ BitVec 64))) (size!36856 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75339)

(declare-datatypes ((List!25464 0))(
  ( (Nil!25461) (Cons!25460 (h!26669 (_ BitVec 64)) (t!37179 List!25464)) )
))
(declare-fun arrayNoDuplicates!0 (array!75339 (_ BitVec 32) List!25464) Bool)

(assert (=> b!1166045 (= res!773395 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25461))))

(declare-fun b!1166046 () Bool)

(declare-fun e!662835 () Bool)

(declare-fun e!662839 () Bool)

(assert (=> b!1166046 (= e!662835 (not e!662839))))

(declare-fun res!773398 () Bool)

(assert (=> b!1166046 (=> res!773398 e!662839)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1166046 (= res!773398 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166046 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38476 0))(
  ( (Unit!38477) )
))
(declare-fun lt!525105 () Unit!38476)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75339 (_ BitVec 64) (_ BitVec 32)) Unit!38476)

(assert (=> b!1166046 (= lt!525105 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1166047 () Bool)

(declare-fun res!773389 () Bool)

(assert (=> b!1166047 (=> (not res!773389) (not e!662834))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166047 (= res!773389 (validMask!0 mask!1564))))

(declare-fun b!1166048 () Bool)

(declare-fun res!773394 () Bool)

(assert (=> b!1166048 (=> (not res!773394) (not e!662834))))

(assert (=> b!1166048 (= res!773394 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36856 _keys!1208))))))

(declare-fun mapIsEmpty!45704 () Bool)

(assert (=> mapIsEmpty!45704 mapRes!45704))

(declare-fun b!1166049 () Bool)

(declare-fun res!773388 () Bool)

(assert (=> b!1166049 (=> (not res!773388) (not e!662834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75339 (_ BitVec 32)) Bool)

(assert (=> b!1166049 (= res!773388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!773391 () Bool)

(assert (=> start!99118 (=> (not res!773391) (not e!662834))))

(assert (=> start!99118 (= res!773391 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36856 _keys!1208))))))

(assert (=> start!99118 e!662834))

(declare-fun tp_is_empty!29253 () Bool)

(assert (=> start!99118 tp_is_empty!29253))

(declare-fun array_inv!27778 (array!75339) Bool)

(assert (=> start!99118 (array_inv!27778 _keys!1208)))

(assert (=> start!99118 true))

(assert (=> start!99118 tp!86879))

(declare-fun array_inv!27779 (array!75337) Bool)

(assert (=> start!99118 (and (array_inv!27779 _values!996) e!662838)))

(declare-fun b!1166050 () Bool)

(declare-fun e!662836 () Bool)

(assert (=> b!1166050 (= e!662836 true)))

(declare-fun zeroValue!944 () V!44131)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!525100 () array!75339)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525102 () array!75337)

(declare-fun minValue!944 () V!44131)

(declare-datatypes ((tuple2!18726 0))(
  ( (tuple2!18727 (_1!9374 (_ BitVec 64)) (_2!9374 V!44131)) )
))
(declare-datatypes ((List!25465 0))(
  ( (Nil!25462) (Cons!25461 (h!26670 tuple2!18726) (t!37180 List!25465)) )
))
(declare-datatypes ((ListLongMap!16695 0))(
  ( (ListLongMap!16696 (toList!8363 List!25465)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4827 (array!75339 array!75337 (_ BitVec 32) (_ BitVec 32) V!44131 V!44131 (_ BitVec 32) Int) ListLongMap!16695)

(declare-fun -!1440 (ListLongMap!16695 (_ BitVec 64)) ListLongMap!16695)

(assert (=> b!1166050 (= (getCurrentListMapNoExtraKeys!4827 lt!525100 lt!525102 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1440 (getCurrentListMapNoExtraKeys!4827 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!525103 () Unit!38476)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!667 (array!75339 array!75337 (_ BitVec 32) (_ BitVec 32) V!44131 V!44131 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38476)

(assert (=> b!1166050 (= lt!525103 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!667 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1166051 () Bool)

(declare-fun res!773390 () Bool)

(assert (=> b!1166051 (=> (not res!773390) (not e!662834))))

(assert (=> b!1166051 (= res!773390 (and (= (size!36855 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36856 _keys!1208) (size!36855 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1166052 () Bool)

(declare-fun res!773397 () Bool)

(assert (=> b!1166052 (=> (not res!773397) (not e!662835))))

(assert (=> b!1166052 (= res!773397 (arrayNoDuplicates!0 lt!525100 #b00000000000000000000000000000000 Nil!25461))))

(declare-fun b!1166053 () Bool)

(assert (=> b!1166053 (= e!662837 tp_is_empty!29253)))

(declare-fun b!1166054 () Bool)

(declare-fun res!773396 () Bool)

(assert (=> b!1166054 (=> (not res!773396) (not e!662834))))

(assert (=> b!1166054 (= res!773396 (= (select (arr!36320 _keys!1208) i!673) k0!934))))

(declare-fun b!1166055 () Bool)

(assert (=> b!1166055 (= e!662839 e!662836)))

(declare-fun res!773393 () Bool)

(assert (=> b!1166055 (=> res!773393 e!662836)))

(assert (=> b!1166055 (= res!773393 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525101 () ListLongMap!16695)

(assert (=> b!1166055 (= lt!525101 (getCurrentListMapNoExtraKeys!4827 lt!525100 lt!525102 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2817 (Int (_ BitVec 64)) V!44131)

(assert (=> b!1166055 (= lt!525102 (array!75338 (store (arr!36319 _values!996) i!673 (ValueCellFull!13917 (dynLambda!2817 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36855 _values!996)))))

(declare-fun lt!525104 () ListLongMap!16695)

(assert (=> b!1166055 (= lt!525104 (getCurrentListMapNoExtraKeys!4827 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1166056 () Bool)

(assert (=> b!1166056 (= e!662834 e!662835)))

(declare-fun res!773399 () Bool)

(assert (=> b!1166056 (=> (not res!773399) (not e!662835))))

(assert (=> b!1166056 (= res!773399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525100 mask!1564))))

(assert (=> b!1166056 (= lt!525100 (array!75340 (store (arr!36320 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36856 _keys!1208)))))

(declare-fun b!1166057 () Bool)

(declare-fun res!773392 () Bool)

(assert (=> b!1166057 (=> (not res!773392) (not e!662834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166057 (= res!773392 (validKeyInArray!0 k0!934))))

(declare-fun b!1166058 () Bool)

(assert (=> b!1166058 (= e!662841 tp_is_empty!29253)))

(assert (= (and start!99118 res!773391) b!1166047))

(assert (= (and b!1166047 res!773389) b!1166051))

(assert (= (and b!1166051 res!773390) b!1166049))

(assert (= (and b!1166049 res!773388) b!1166045))

(assert (= (and b!1166045 res!773395) b!1166048))

(assert (= (and b!1166048 res!773394) b!1166057))

(assert (= (and b!1166057 res!773392) b!1166054))

(assert (= (and b!1166054 res!773396) b!1166056))

(assert (= (and b!1166056 res!773399) b!1166052))

(assert (= (and b!1166052 res!773397) b!1166046))

(assert (= (and b!1166046 (not res!773398)) b!1166055))

(assert (= (and b!1166055 (not res!773393)) b!1166050))

(assert (= (and b!1166044 condMapEmpty!45704) mapIsEmpty!45704))

(assert (= (and b!1166044 (not condMapEmpty!45704)) mapNonEmpty!45704))

(get-info :version)

(assert (= (and mapNonEmpty!45704 ((_ is ValueCellFull!13917) mapValue!45704)) b!1166053))

(assert (= (and b!1166044 ((_ is ValueCellFull!13917) mapDefault!45704)) b!1166058))

(assert (= start!99118 b!1166044))

(declare-fun b_lambda!19829 () Bool)

(assert (=> (not b_lambda!19829) (not b!1166055)))

(declare-fun t!37178 () Bool)

(declare-fun tb!9535 () Bool)

(assert (=> (and start!99118 (= defaultEntry!1004 defaultEntry!1004) t!37178) tb!9535))

(declare-fun result!19635 () Bool)

(assert (=> tb!9535 (= result!19635 tp_is_empty!29253)))

(assert (=> b!1166055 t!37178))

(declare-fun b_and!40297 () Bool)

(assert (= b_and!40295 (and (=> t!37178 result!19635) b_and!40297)))

(declare-fun m!1074125 () Bool)

(assert (=> b!1166045 m!1074125))

(declare-fun m!1074127 () Bool)

(assert (=> b!1166047 m!1074127))

(declare-fun m!1074129 () Bool)

(assert (=> b!1166050 m!1074129))

(declare-fun m!1074131 () Bool)

(assert (=> b!1166050 m!1074131))

(assert (=> b!1166050 m!1074131))

(declare-fun m!1074133 () Bool)

(assert (=> b!1166050 m!1074133))

(declare-fun m!1074135 () Bool)

(assert (=> b!1166050 m!1074135))

(declare-fun m!1074137 () Bool)

(assert (=> mapNonEmpty!45704 m!1074137))

(declare-fun m!1074139 () Bool)

(assert (=> b!1166046 m!1074139))

(declare-fun m!1074141 () Bool)

(assert (=> b!1166046 m!1074141))

(declare-fun m!1074143 () Bool)

(assert (=> start!99118 m!1074143))

(declare-fun m!1074145 () Bool)

(assert (=> start!99118 m!1074145))

(declare-fun m!1074147 () Bool)

(assert (=> b!1166049 m!1074147))

(declare-fun m!1074149 () Bool)

(assert (=> b!1166054 m!1074149))

(declare-fun m!1074151 () Bool)

(assert (=> b!1166057 m!1074151))

(declare-fun m!1074153 () Bool)

(assert (=> b!1166056 m!1074153))

(declare-fun m!1074155 () Bool)

(assert (=> b!1166056 m!1074155))

(declare-fun m!1074157 () Bool)

(assert (=> b!1166055 m!1074157))

(declare-fun m!1074159 () Bool)

(assert (=> b!1166055 m!1074159))

(declare-fun m!1074161 () Bool)

(assert (=> b!1166055 m!1074161))

(declare-fun m!1074163 () Bool)

(assert (=> b!1166055 m!1074163))

(declare-fun m!1074165 () Bool)

(assert (=> b!1166052 m!1074165))

(check-sat (not b!1166055) (not b!1166047) tp_is_empty!29253 (not b!1166050) b_and!40297 (not b_lambda!19829) (not start!99118) (not b!1166057) (not b!1166049) (not b!1166046) (not b!1166045) (not b_next!24723) (not b!1166052) (not mapNonEmpty!45704) (not b!1166056))
(check-sat b_and!40297 (not b_next!24723))
