; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99166 () Bool)

(assert start!99166)

(declare-fun b_free!24771 () Bool)

(declare-fun b_next!24771 () Bool)

(assert (=> start!99166 (= b_free!24771 (not b_next!24771))))

(declare-fun tp!87024 () Bool)

(declare-fun b_and!40391 () Bool)

(assert (=> start!99166 (= tp!87024 b_and!40391)))

(declare-fun b!1167172 () Bool)

(declare-fun res!774255 () Bool)

(declare-fun e!663415 () Bool)

(assert (=> b!1167172 (=> (not res!774255) (not e!663415))))

(declare-datatypes ((array!75431 0))(
  ( (array!75432 (arr!36366 (Array (_ BitVec 32) (_ BitVec 64))) (size!36902 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75431)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44195 0))(
  ( (V!44196 (val!14707 Int)) )
))
(declare-datatypes ((ValueCell!13941 0))(
  ( (ValueCellFull!13941 (v!17344 V!44195)) (EmptyCell!13941) )
))
(declare-datatypes ((array!75433 0))(
  ( (array!75434 (arr!36367 (Array (_ BitVec 32) ValueCell!13941)) (size!36903 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75433)

(assert (=> b!1167172 (= res!774255 (and (= (size!36903 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36902 _keys!1208) (size!36903 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167173 () Bool)

(declare-fun res!774256 () Bool)

(assert (=> b!1167173 (=> (not res!774256) (not e!663415))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167173 (= res!774256 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36902 _keys!1208))))))

(declare-fun b!1167174 () Bool)

(declare-fun e!663412 () Bool)

(declare-fun e!663410 () Bool)

(assert (=> b!1167174 (= e!663412 e!663410)))

(declare-fun res!774262 () Bool)

(assert (=> b!1167174 (=> res!774262 e!663410)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1167174 (= res!774262 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44195)

(declare-datatypes ((tuple2!18760 0))(
  ( (tuple2!18761 (_1!9391 (_ BitVec 64)) (_2!9391 V!44195)) )
))
(declare-datatypes ((List!25500 0))(
  ( (Nil!25497) (Cons!25496 (h!26705 tuple2!18760) (t!37263 List!25500)) )
))
(declare-datatypes ((ListLongMap!16729 0))(
  ( (ListLongMap!16730 (toList!8380 List!25500)) )
))
(declare-fun lt!525534 () ListLongMap!16729)

(declare-fun lt!525537 () array!75431)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44195)

(declare-fun lt!525532 () array!75433)

(declare-fun getCurrentListMapNoExtraKeys!4844 (array!75431 array!75433 (_ BitVec 32) (_ BitVec 32) V!44195 V!44195 (_ BitVec 32) Int) ListLongMap!16729)

(assert (=> b!1167174 (= lt!525534 (getCurrentListMapNoExtraKeys!4844 lt!525537 lt!525532 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2828 (Int (_ BitVec 64)) V!44195)

(assert (=> b!1167174 (= lt!525532 (array!75434 (store (arr!36367 _values!996) i!673 (ValueCellFull!13941 (dynLambda!2828 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36903 _values!996)))))

(declare-fun lt!525536 () ListLongMap!16729)

(assert (=> b!1167174 (= lt!525536 (getCurrentListMapNoExtraKeys!4844 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!774263 () Bool)

(assert (=> start!99166 (=> (not res!774263) (not e!663415))))

(assert (=> start!99166 (= res!774263 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36902 _keys!1208))))))

(assert (=> start!99166 e!663415))

(declare-fun tp_is_empty!29301 () Bool)

(assert (=> start!99166 tp_is_empty!29301))

(declare-fun array_inv!27802 (array!75431) Bool)

(assert (=> start!99166 (array_inv!27802 _keys!1208)))

(assert (=> start!99166 true))

(assert (=> start!99166 tp!87024))

(declare-fun e!663414 () Bool)

(declare-fun array_inv!27803 (array!75433) Bool)

(assert (=> start!99166 (and (array_inv!27803 _values!996) e!663414)))

(declare-fun b!1167175 () Bool)

(declare-fun e!663416 () Bool)

(assert (=> b!1167175 (= e!663415 e!663416)))

(declare-fun res!774253 () Bool)

(assert (=> b!1167175 (=> (not res!774253) (not e!663416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75431 (_ BitVec 32)) Bool)

(assert (=> b!1167175 (= res!774253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525537 mask!1564))))

(assert (=> b!1167175 (= lt!525537 (array!75432 (store (arr!36366 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36902 _keys!1208)))))

(declare-fun b!1167176 () Bool)

(declare-fun res!774257 () Bool)

(assert (=> b!1167176 (=> (not res!774257) (not e!663416))))

(declare-datatypes ((List!25501 0))(
  ( (Nil!25498) (Cons!25497 (h!26706 (_ BitVec 64)) (t!37264 List!25501)) )
))
(declare-fun arrayNoDuplicates!0 (array!75431 (_ BitVec 32) List!25501) Bool)

(assert (=> b!1167176 (= res!774257 (arrayNoDuplicates!0 lt!525537 #b00000000000000000000000000000000 Nil!25498))))

(declare-fun b!1167177 () Bool)

(assert (=> b!1167177 (= e!663416 (not e!663412))))

(declare-fun res!774259 () Bool)

(assert (=> b!1167177 (=> res!774259 e!663412)))

(assert (=> b!1167177 (= res!774259 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167177 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38514 0))(
  ( (Unit!38515) )
))
(declare-fun lt!525535 () Unit!38514)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75431 (_ BitVec 64) (_ BitVec 32)) Unit!38514)

(assert (=> b!1167177 (= lt!525535 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1167178 () Bool)

(declare-fun res!774260 () Bool)

(assert (=> b!1167178 (=> (not res!774260) (not e!663415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167178 (= res!774260 (validKeyInArray!0 k0!934))))

(declare-fun b!1167179 () Bool)

(declare-fun res!774254 () Bool)

(assert (=> b!1167179 (=> (not res!774254) (not e!663415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167179 (= res!774254 (validMask!0 mask!1564))))

(declare-fun b!1167180 () Bool)

(declare-fun res!774258 () Bool)

(assert (=> b!1167180 (=> (not res!774258) (not e!663415))))

(assert (=> b!1167180 (= res!774258 (= (select (arr!36366 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!45776 () Bool)

(declare-fun mapRes!45776 () Bool)

(declare-fun tp!87023 () Bool)

(declare-fun e!663417 () Bool)

(assert (=> mapNonEmpty!45776 (= mapRes!45776 (and tp!87023 e!663417))))

(declare-fun mapValue!45776 () ValueCell!13941)

(declare-fun mapKey!45776 () (_ BitVec 32))

(declare-fun mapRest!45776 () (Array (_ BitVec 32) ValueCell!13941))

(assert (=> mapNonEmpty!45776 (= (arr!36367 _values!996) (store mapRest!45776 mapKey!45776 mapValue!45776))))

(declare-fun b!1167181 () Bool)

(declare-fun e!663413 () Bool)

(assert (=> b!1167181 (= e!663414 (and e!663413 mapRes!45776))))

(declare-fun condMapEmpty!45776 () Bool)

(declare-fun mapDefault!45776 () ValueCell!13941)

(assert (=> b!1167181 (= condMapEmpty!45776 (= (arr!36367 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13941)) mapDefault!45776)))))

(declare-fun mapIsEmpty!45776 () Bool)

(assert (=> mapIsEmpty!45776 mapRes!45776))

(declare-fun b!1167182 () Bool)

(declare-fun res!774252 () Bool)

(assert (=> b!1167182 (=> (not res!774252) (not e!663415))))

(assert (=> b!1167182 (= res!774252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1167183 () Bool)

(assert (=> b!1167183 (= e!663410 true)))

(declare-fun -!1456 (ListLongMap!16729 (_ BitVec 64)) ListLongMap!16729)

(assert (=> b!1167183 (= (getCurrentListMapNoExtraKeys!4844 lt!525537 lt!525532 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1456 (getCurrentListMapNoExtraKeys!4844 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!525533 () Unit!38514)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!683 (array!75431 array!75433 (_ BitVec 32) (_ BitVec 32) V!44195 V!44195 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38514)

(assert (=> b!1167183 (= lt!525533 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!683 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167184 () Bool)

(assert (=> b!1167184 (= e!663417 tp_is_empty!29301)))

(declare-fun b!1167185 () Bool)

(assert (=> b!1167185 (= e!663413 tp_is_empty!29301)))

(declare-fun b!1167186 () Bool)

(declare-fun res!774261 () Bool)

(assert (=> b!1167186 (=> (not res!774261) (not e!663415))))

(assert (=> b!1167186 (= res!774261 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25498))))

(assert (= (and start!99166 res!774263) b!1167179))

(assert (= (and b!1167179 res!774254) b!1167172))

(assert (= (and b!1167172 res!774255) b!1167182))

(assert (= (and b!1167182 res!774252) b!1167186))

(assert (= (and b!1167186 res!774261) b!1167173))

(assert (= (and b!1167173 res!774256) b!1167178))

(assert (= (and b!1167178 res!774260) b!1167180))

(assert (= (and b!1167180 res!774258) b!1167175))

(assert (= (and b!1167175 res!774253) b!1167176))

(assert (= (and b!1167176 res!774257) b!1167177))

(assert (= (and b!1167177 (not res!774259)) b!1167174))

(assert (= (and b!1167174 (not res!774262)) b!1167183))

(assert (= (and b!1167181 condMapEmpty!45776) mapIsEmpty!45776))

(assert (= (and b!1167181 (not condMapEmpty!45776)) mapNonEmpty!45776))

(get-info :version)

(assert (= (and mapNonEmpty!45776 ((_ is ValueCellFull!13941) mapValue!45776)) b!1167184))

(assert (= (and b!1167181 ((_ is ValueCellFull!13941) mapDefault!45776)) b!1167185))

(assert (= start!99166 b!1167181))

(declare-fun b_lambda!19877 () Bool)

(assert (=> (not b_lambda!19877) (not b!1167174)))

(declare-fun t!37262 () Bool)

(declare-fun tb!9583 () Bool)

(assert (=> (and start!99166 (= defaultEntry!1004 defaultEntry!1004) t!37262) tb!9583))

(declare-fun result!19731 () Bool)

(assert (=> tb!9583 (= result!19731 tp_is_empty!29301)))

(assert (=> b!1167174 t!37262))

(declare-fun b_and!40393 () Bool)

(assert (= b_and!40391 (and (=> t!37262 result!19731) b_and!40393)))

(declare-fun m!1075133 () Bool)

(assert (=> b!1167182 m!1075133))

(declare-fun m!1075135 () Bool)

(assert (=> start!99166 m!1075135))

(declare-fun m!1075137 () Bool)

(assert (=> start!99166 m!1075137))

(declare-fun m!1075139 () Bool)

(assert (=> b!1167180 m!1075139))

(declare-fun m!1075141 () Bool)

(assert (=> b!1167175 m!1075141))

(declare-fun m!1075143 () Bool)

(assert (=> b!1167175 m!1075143))

(declare-fun m!1075145 () Bool)

(assert (=> mapNonEmpty!45776 m!1075145))

(declare-fun m!1075147 () Bool)

(assert (=> b!1167183 m!1075147))

(declare-fun m!1075149 () Bool)

(assert (=> b!1167183 m!1075149))

(assert (=> b!1167183 m!1075149))

(declare-fun m!1075151 () Bool)

(assert (=> b!1167183 m!1075151))

(declare-fun m!1075153 () Bool)

(assert (=> b!1167183 m!1075153))

(declare-fun m!1075155 () Bool)

(assert (=> b!1167174 m!1075155))

(declare-fun m!1075157 () Bool)

(assert (=> b!1167174 m!1075157))

(declare-fun m!1075159 () Bool)

(assert (=> b!1167174 m!1075159))

(declare-fun m!1075161 () Bool)

(assert (=> b!1167174 m!1075161))

(declare-fun m!1075163 () Bool)

(assert (=> b!1167178 m!1075163))

(declare-fun m!1075165 () Bool)

(assert (=> b!1167186 m!1075165))

(declare-fun m!1075167 () Bool)

(assert (=> b!1167177 m!1075167))

(declare-fun m!1075169 () Bool)

(assert (=> b!1167177 m!1075169))

(declare-fun m!1075171 () Bool)

(assert (=> b!1167176 m!1075171))

(declare-fun m!1075173 () Bool)

(assert (=> b!1167179 m!1075173))

(check-sat (not b!1167186) tp_is_empty!29301 b_and!40393 (not start!99166) (not b!1167177) (not mapNonEmpty!45776) (not b_next!24771) (not b!1167174) (not b!1167183) (not b!1167182) (not b_lambda!19877) (not b!1167178) (not b!1167176) (not b!1167175) (not b!1167179))
(check-sat b_and!40393 (not b_next!24771))
