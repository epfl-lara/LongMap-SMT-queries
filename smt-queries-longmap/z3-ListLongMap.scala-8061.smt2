; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99208 () Bool)

(assert start!99208)

(declare-fun b_free!24813 () Bool)

(declare-fun b_next!24813 () Bool)

(assert (=> start!99208 (= b_free!24813 (not b_next!24813))))

(declare-fun tp!87149 () Bool)

(declare-fun b_and!40475 () Bool)

(assert (=> start!99208 (= tp!87149 b_and!40475)))

(declare-fun res!775019 () Bool)

(declare-fun e!663914 () Bool)

(assert (=> start!99208 (=> (not res!775019) (not e!663914))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75507 0))(
  ( (array!75508 (arr!36404 (Array (_ BitVec 32) (_ BitVec 64))) (size!36940 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75507)

(assert (=> start!99208 (= res!775019 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36940 _keys!1208))))))

(assert (=> start!99208 e!663914))

(declare-fun tp_is_empty!29343 () Bool)

(assert (=> start!99208 tp_is_empty!29343))

(declare-fun array_inv!27828 (array!75507) Bool)

(assert (=> start!99208 (array_inv!27828 _keys!1208)))

(assert (=> start!99208 true))

(assert (=> start!99208 tp!87149))

(declare-datatypes ((V!44251 0))(
  ( (V!44252 (val!14728 Int)) )
))
(declare-datatypes ((ValueCell!13962 0))(
  ( (ValueCellFull!13962 (v!17365 V!44251)) (EmptyCell!13962) )
))
(declare-datatypes ((array!75509 0))(
  ( (array!75510 (arr!36405 (Array (_ BitVec 32) ValueCell!13962)) (size!36941 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75509)

(declare-fun e!663919 () Bool)

(declare-fun array_inv!27829 (array!75509) Bool)

(assert (=> start!99208 (and (array_inv!27829 _values!996) e!663919)))

(declare-fun mapIsEmpty!45839 () Bool)

(declare-fun mapRes!45839 () Bool)

(assert (=> mapIsEmpty!45839 mapRes!45839))

(declare-fun mapNonEmpty!45839 () Bool)

(declare-fun tp!87150 () Bool)

(declare-fun e!663916 () Bool)

(assert (=> mapNonEmpty!45839 (= mapRes!45839 (and tp!87150 e!663916))))

(declare-fun mapValue!45839 () ValueCell!13962)

(declare-fun mapKey!45839 () (_ BitVec 32))

(declare-fun mapRest!45839 () (Array (_ BitVec 32) ValueCell!13962))

(assert (=> mapNonEmpty!45839 (= (arr!36405 _values!996) (store mapRest!45839 mapKey!45839 mapValue!45839))))

(declare-fun b!1168159 () Bool)

(declare-fun res!775017 () Bool)

(assert (=> b!1168159 (=> (not res!775017) (not e!663914))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168159 (= res!775017 (validKeyInArray!0 k0!934))))

(declare-fun b!1168160 () Bool)

(declare-fun res!775013 () Bool)

(assert (=> b!1168160 (=> (not res!775013) (not e!663914))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75507 (_ BitVec 32)) Bool)

(assert (=> b!1168160 (= res!775013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1168161 () Bool)

(declare-fun res!775009 () Bool)

(assert (=> b!1168161 (=> (not res!775009) (not e!663914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168161 (= res!775009 (validMask!0 mask!1564))))

(declare-fun b!1168162 () Bool)

(declare-fun res!775016 () Bool)

(assert (=> b!1168162 (=> (not res!775016) (not e!663914))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1168162 (= res!775016 (and (= (size!36941 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36940 _keys!1208) (size!36941 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168163 () Bool)

(declare-fun res!775015 () Bool)

(assert (=> b!1168163 (=> (not res!775015) (not e!663914))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1168163 (= res!775015 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36940 _keys!1208))))))

(declare-fun b!1168164 () Bool)

(declare-fun res!775010 () Bool)

(assert (=> b!1168164 (=> (not res!775010) (not e!663914))))

(declare-datatypes ((List!25532 0))(
  ( (Nil!25529) (Cons!25528 (h!26737 (_ BitVec 64)) (t!37337 List!25532)) )
))
(declare-fun arrayNoDuplicates!0 (array!75507 (_ BitVec 32) List!25532) Bool)

(assert (=> b!1168164 (= res!775010 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25529))))

(declare-fun b!1168165 () Bool)

(declare-fun e!663917 () Bool)

(declare-fun e!663920 () Bool)

(assert (=> b!1168165 (= e!663917 (not e!663920))))

(declare-fun res!775011 () Bool)

(assert (=> b!1168165 (=> res!775011 e!663920)))

(assert (=> b!1168165 (= res!775011 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168165 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38544 0))(
  ( (Unit!38545) )
))
(declare-fun lt!525915 () Unit!38544)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75507 (_ BitVec 64) (_ BitVec 32)) Unit!38544)

(assert (=> b!1168165 (= lt!525915 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1168166 () Bool)

(declare-fun e!663918 () Bool)

(assert (=> b!1168166 (= e!663918 tp_is_empty!29343)))

(declare-fun b!1168167 () Bool)

(assert (=> b!1168167 (= e!663919 (and e!663918 mapRes!45839))))

(declare-fun condMapEmpty!45839 () Bool)

(declare-fun mapDefault!45839 () ValueCell!13962)

(assert (=> b!1168167 (= condMapEmpty!45839 (= (arr!36405 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13962)) mapDefault!45839)))))

(declare-fun b!1168168 () Bool)

(assert (=> b!1168168 (= e!663916 tp_is_empty!29343)))

(declare-fun b!1168169 () Bool)

(declare-fun e!663915 () Bool)

(assert (=> b!1168169 (= e!663920 e!663915)))

(declare-fun res!775014 () Bool)

(assert (=> b!1168169 (=> res!775014 e!663915)))

(assert (=> b!1168169 (= res!775014 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44251)

(declare-fun lt!525912 () array!75507)

(declare-fun lt!525914 () array!75509)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44251)

(declare-datatypes ((tuple2!18792 0))(
  ( (tuple2!18793 (_1!9407 (_ BitVec 64)) (_2!9407 V!44251)) )
))
(declare-datatypes ((List!25533 0))(
  ( (Nil!25530) (Cons!25529 (h!26738 tuple2!18792) (t!37338 List!25533)) )
))
(declare-datatypes ((ListLongMap!16761 0))(
  ( (ListLongMap!16762 (toList!8396 List!25533)) )
))
(declare-fun lt!525913 () ListLongMap!16761)

(declare-fun getCurrentListMapNoExtraKeys!4860 (array!75507 array!75509 (_ BitVec 32) (_ BitVec 32) V!44251 V!44251 (_ BitVec 32) Int) ListLongMap!16761)

(assert (=> b!1168169 (= lt!525913 (getCurrentListMapNoExtraKeys!4860 lt!525912 lt!525914 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2841 (Int (_ BitVec 64)) V!44251)

(assert (=> b!1168169 (= lt!525914 (array!75510 (store (arr!36405 _values!996) i!673 (ValueCellFull!13962 (dynLambda!2841 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36941 _values!996)))))

(declare-fun lt!525911 () ListLongMap!16761)

(assert (=> b!1168169 (= lt!525911 (getCurrentListMapNoExtraKeys!4860 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168170 () Bool)

(declare-fun res!775018 () Bool)

(assert (=> b!1168170 (=> (not res!775018) (not e!663917))))

(assert (=> b!1168170 (= res!775018 (arrayNoDuplicates!0 lt!525912 #b00000000000000000000000000000000 Nil!25529))))

(declare-fun b!1168171 () Bool)

(declare-fun res!775012 () Bool)

(assert (=> b!1168171 (=> (not res!775012) (not e!663914))))

(assert (=> b!1168171 (= res!775012 (= (select (arr!36404 _keys!1208) i!673) k0!934))))

(declare-fun b!1168172 () Bool)

(assert (=> b!1168172 (= e!663914 e!663917)))

(declare-fun res!775008 () Bool)

(assert (=> b!1168172 (=> (not res!775008) (not e!663917))))

(assert (=> b!1168172 (= res!775008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525912 mask!1564))))

(assert (=> b!1168172 (= lt!525912 (array!75508 (store (arr!36404 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36940 _keys!1208)))))

(declare-fun b!1168173 () Bool)

(assert (=> b!1168173 (= e!663915 true)))

(declare-fun -!1470 (ListLongMap!16761 (_ BitVec 64)) ListLongMap!16761)

(assert (=> b!1168173 (= (getCurrentListMapNoExtraKeys!4860 lt!525912 lt!525914 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1470 (getCurrentListMapNoExtraKeys!4860 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!525910 () Unit!38544)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!697 (array!75507 array!75509 (_ BitVec 32) (_ BitVec 32) V!44251 V!44251 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38544)

(assert (=> b!1168173 (= lt!525910 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!697 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99208 res!775019) b!1168161))

(assert (= (and b!1168161 res!775009) b!1168162))

(assert (= (and b!1168162 res!775016) b!1168160))

(assert (= (and b!1168160 res!775013) b!1168164))

(assert (= (and b!1168164 res!775010) b!1168163))

(assert (= (and b!1168163 res!775015) b!1168159))

(assert (= (and b!1168159 res!775017) b!1168171))

(assert (= (and b!1168171 res!775012) b!1168172))

(assert (= (and b!1168172 res!775008) b!1168170))

(assert (= (and b!1168170 res!775018) b!1168165))

(assert (= (and b!1168165 (not res!775011)) b!1168169))

(assert (= (and b!1168169 (not res!775014)) b!1168173))

(assert (= (and b!1168167 condMapEmpty!45839) mapIsEmpty!45839))

(assert (= (and b!1168167 (not condMapEmpty!45839)) mapNonEmpty!45839))

(get-info :version)

(assert (= (and mapNonEmpty!45839 ((_ is ValueCellFull!13962) mapValue!45839)) b!1168168))

(assert (= (and b!1168167 ((_ is ValueCellFull!13962) mapDefault!45839)) b!1168166))

(assert (= start!99208 b!1168167))

(declare-fun b_lambda!19919 () Bool)

(assert (=> (not b_lambda!19919) (not b!1168169)))

(declare-fun t!37336 () Bool)

(declare-fun tb!9625 () Bool)

(assert (=> (and start!99208 (= defaultEntry!1004 defaultEntry!1004) t!37336) tb!9625))

(declare-fun result!19815 () Bool)

(assert (=> tb!9625 (= result!19815 tp_is_empty!29343)))

(assert (=> b!1168169 t!37336))

(declare-fun b_and!40477 () Bool)

(assert (= b_and!40475 (and (=> t!37336 result!19815) b_and!40477)))

(declare-fun m!1076015 () Bool)

(assert (=> b!1168165 m!1076015))

(declare-fun m!1076017 () Bool)

(assert (=> b!1168165 m!1076017))

(declare-fun m!1076019 () Bool)

(assert (=> start!99208 m!1076019))

(declare-fun m!1076021 () Bool)

(assert (=> start!99208 m!1076021))

(declare-fun m!1076023 () Bool)

(assert (=> b!1168170 m!1076023))

(declare-fun m!1076025 () Bool)

(assert (=> b!1168159 m!1076025))

(declare-fun m!1076027 () Bool)

(assert (=> b!1168164 m!1076027))

(declare-fun m!1076029 () Bool)

(assert (=> b!1168172 m!1076029))

(declare-fun m!1076031 () Bool)

(assert (=> b!1168172 m!1076031))

(declare-fun m!1076033 () Bool)

(assert (=> mapNonEmpty!45839 m!1076033))

(declare-fun m!1076035 () Bool)

(assert (=> b!1168161 m!1076035))

(declare-fun m!1076037 () Bool)

(assert (=> b!1168171 m!1076037))

(declare-fun m!1076039 () Bool)

(assert (=> b!1168160 m!1076039))

(declare-fun m!1076041 () Bool)

(assert (=> b!1168169 m!1076041))

(declare-fun m!1076043 () Bool)

(assert (=> b!1168169 m!1076043))

(declare-fun m!1076045 () Bool)

(assert (=> b!1168169 m!1076045))

(declare-fun m!1076047 () Bool)

(assert (=> b!1168169 m!1076047))

(declare-fun m!1076049 () Bool)

(assert (=> b!1168173 m!1076049))

(declare-fun m!1076051 () Bool)

(assert (=> b!1168173 m!1076051))

(assert (=> b!1168173 m!1076051))

(declare-fun m!1076053 () Bool)

(assert (=> b!1168173 m!1076053))

(declare-fun m!1076055 () Bool)

(assert (=> b!1168173 m!1076055))

(check-sat tp_is_empty!29343 (not b!1168172) (not b!1168161) (not b_lambda!19919) (not start!99208) (not mapNonEmpty!45839) (not b!1168170) (not b!1168173) b_and!40477 (not b!1168165) (not b!1168159) (not b!1168164) (not b_next!24813) (not b!1168169) (not b!1168160))
(check-sat b_and!40477 (not b_next!24813))
