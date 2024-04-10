; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113564 () Bool)

(assert start!113564)

(declare-fun b_free!31557 () Bool)

(declare-fun b_next!31557 () Bool)

(assert (=> start!113564 (= b_free!31557 (not b_next!31557))))

(declare-fun tp!110479 () Bool)

(declare-fun b_and!50903 () Bool)

(assert (=> start!113564 (= tp!110479 b_and!50903)))

(declare-fun b!1348226 () Bool)

(declare-fun res!894573 () Bool)

(declare-fun e!766978 () Bool)

(assert (=> b!1348226 (=> (not res!894573) (not e!766978))))

(declare-datatypes ((array!91942 0))(
  ( (array!91943 (arr!44426 (Array (_ BitVec 32) (_ BitVec 64))) (size!44976 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91942)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91942 (_ BitVec 32)) Bool)

(assert (=> b!1348226 (= res!894573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1348227 () Bool)

(declare-fun res!894574 () Bool)

(assert (=> b!1348227 (=> (not res!894574) (not e!766978))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!55179 0))(
  ( (V!55180 (val!18853 Int)) )
))
(declare-datatypes ((ValueCell!17880 0))(
  ( (ValueCellFull!17880 (v!21504 V!55179)) (EmptyCell!17880) )
))
(declare-datatypes ((array!91944 0))(
  ( (array!91945 (arr!44427 (Array (_ BitVec 32) ValueCell!17880)) (size!44977 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91944)

(assert (=> b!1348227 (= res!894574 (and (= (size!44977 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44976 _keys!1571) (size!44977 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1348228 () Bool)

(declare-fun res!894580 () Bool)

(assert (=> b!1348228 (=> (not res!894580) (not e!766978))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1348228 (= res!894580 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44976 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348229 () Bool)

(declare-fun e!766982 () Bool)

(declare-fun tp_is_empty!37557 () Bool)

(assert (=> b!1348229 (= e!766982 tp_is_empty!37557)))

(declare-fun mapIsEmpty!58046 () Bool)

(declare-fun mapRes!58046 () Bool)

(assert (=> mapIsEmpty!58046 mapRes!58046))

(declare-fun b!1348230 () Bool)

(declare-fun res!894581 () Bool)

(assert (=> b!1348230 (=> (not res!894581) (not e!766978))))

(declare-fun zeroValue!1245 () V!55179)

(declare-fun minValue!1245 () V!55179)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24308 0))(
  ( (tuple2!24309 (_1!12165 (_ BitVec 64)) (_2!12165 V!55179)) )
))
(declare-datatypes ((List!31460 0))(
  ( (Nil!31457) (Cons!31456 (h!32665 tuple2!24308) (t!46096 List!31460)) )
))
(declare-datatypes ((ListLongMap!21965 0))(
  ( (ListLongMap!21966 (toList!10998 List!31460)) )
))
(declare-fun contains!9176 (ListLongMap!21965 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5947 (array!91942 array!91944 (_ BitVec 32) (_ BitVec 32) V!55179 V!55179 (_ BitVec 32) Int) ListLongMap!21965)

(assert (=> b!1348230 (= res!894581 (contains!9176 (getCurrentListMap!5947 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1348231 () Bool)

(declare-fun e!766980 () Bool)

(assert (=> b!1348231 (= e!766980 tp_is_empty!37557)))

(declare-fun b!1348225 () Bool)

(declare-fun res!894578 () Bool)

(assert (=> b!1348225 (=> (not res!894578) (not e!766978))))

(assert (=> b!1348225 (= res!894578 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!894575 () Bool)

(assert (=> start!113564 (=> (not res!894575) (not e!766978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113564 (= res!894575 (validMask!0 mask!1977))))

(assert (=> start!113564 e!766978))

(assert (=> start!113564 tp_is_empty!37557))

(assert (=> start!113564 true))

(declare-fun array_inv!33465 (array!91942) Bool)

(assert (=> start!113564 (array_inv!33465 _keys!1571)))

(declare-fun e!766981 () Bool)

(declare-fun array_inv!33466 (array!91944) Bool)

(assert (=> start!113564 (and (array_inv!33466 _values!1303) e!766981)))

(assert (=> start!113564 tp!110479))

(declare-fun mapNonEmpty!58046 () Bool)

(declare-fun tp!110480 () Bool)

(assert (=> mapNonEmpty!58046 (= mapRes!58046 (and tp!110480 e!766982))))

(declare-fun mapRest!58046 () (Array (_ BitVec 32) ValueCell!17880))

(declare-fun mapKey!58046 () (_ BitVec 32))

(declare-fun mapValue!58046 () ValueCell!17880)

(assert (=> mapNonEmpty!58046 (= (arr!44427 _values!1303) (store mapRest!58046 mapKey!58046 mapValue!58046))))

(declare-fun b!1348232 () Bool)

(assert (=> b!1348232 (= e!766981 (and e!766980 mapRes!58046))))

(declare-fun condMapEmpty!58046 () Bool)

(declare-fun mapDefault!58046 () ValueCell!17880)

(assert (=> b!1348232 (= condMapEmpty!58046 (= (arr!44427 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17880)) mapDefault!58046)))))

(declare-fun b!1348233 () Bool)

(declare-fun res!894576 () Bool)

(assert (=> b!1348233 (=> (not res!894576) (not e!766978))))

(declare-datatypes ((List!31461 0))(
  ( (Nil!31458) (Cons!31457 (h!32666 (_ BitVec 64)) (t!46097 List!31461)) )
))
(declare-fun arrayNoDuplicates!0 (array!91942 (_ BitVec 32) List!31461) Bool)

(assert (=> b!1348233 (= res!894576 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31458))))

(declare-fun b!1348234 () Bool)

(assert (=> b!1348234 (= e!766978 (not (contains!9176 (getCurrentListMap!5947 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) k0!1142)))))

(declare-fun lt!595977 () ListLongMap!21965)

(declare-fun +!4848 (ListLongMap!21965 tuple2!24308) ListLongMap!21965)

(assert (=> b!1348234 (contains!9176 (+!4848 lt!595977 (tuple2!24309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!44172 0))(
  ( (Unit!44173) )
))
(declare-fun lt!595979 () Unit!44172)

(declare-fun addStillContains!1213 (ListLongMap!21965 (_ BitVec 64) V!55179 (_ BitVec 64)) Unit!44172)

(assert (=> b!1348234 (= lt!595979 (addStillContains!1213 lt!595977 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1348234 (contains!9176 lt!595977 k0!1142)))

(declare-fun lt!595981 () Unit!44172)

(declare-fun lt!595978 () V!55179)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!409 ((_ BitVec 64) (_ BitVec 64) V!55179 ListLongMap!21965) Unit!44172)

(assert (=> b!1348234 (= lt!595981 (lemmaInListMapAfterAddingDiffThenInBefore!409 k0!1142 (select (arr!44426 _keys!1571) from!1960) lt!595978 lt!595977))))

(declare-fun lt!595976 () ListLongMap!21965)

(assert (=> b!1348234 (contains!9176 lt!595976 k0!1142)))

(declare-fun lt!595980 () Unit!44172)

(assert (=> b!1348234 (= lt!595980 (lemmaInListMapAfterAddingDiffThenInBefore!409 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595976))))

(assert (=> b!1348234 (= lt!595976 (+!4848 lt!595977 (tuple2!24309 (select (arr!44426 _keys!1571) from!1960) lt!595978)))))

(declare-fun get!22442 (ValueCell!17880 V!55179) V!55179)

(declare-fun dynLambda!3787 (Int (_ BitVec 64)) V!55179)

(assert (=> b!1348234 (= lt!595978 (get!22442 (select (arr!44427 _values!1303) from!1960) (dynLambda!3787 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6494 (array!91942 array!91944 (_ BitVec 32) (_ BitVec 32) V!55179 V!55179 (_ BitVec 32) Int) ListLongMap!21965)

(assert (=> b!1348234 (= lt!595977 (getCurrentListMapNoExtraKeys!6494 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1348235 () Bool)

(declare-fun res!894577 () Bool)

(assert (=> b!1348235 (=> (not res!894577) (not e!766978))))

(assert (=> b!1348235 (= res!894577 (not (= (select (arr!44426 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1348236 () Bool)

(declare-fun res!894579 () Bool)

(assert (=> b!1348236 (=> (not res!894579) (not e!766978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1348236 (= res!894579 (validKeyInArray!0 (select (arr!44426 _keys!1571) from!1960)))))

(assert (= (and start!113564 res!894575) b!1348227))

(assert (= (and b!1348227 res!894574) b!1348226))

(assert (= (and b!1348226 res!894573) b!1348233))

(assert (= (and b!1348233 res!894576) b!1348228))

(assert (= (and b!1348228 res!894580) b!1348230))

(assert (= (and b!1348230 res!894581) b!1348235))

(assert (= (and b!1348235 res!894577) b!1348236))

(assert (= (and b!1348236 res!894579) b!1348225))

(assert (= (and b!1348225 res!894578) b!1348234))

(assert (= (and b!1348232 condMapEmpty!58046) mapIsEmpty!58046))

(assert (= (and b!1348232 (not condMapEmpty!58046)) mapNonEmpty!58046))

(get-info :version)

(assert (= (and mapNonEmpty!58046 ((_ is ValueCellFull!17880) mapValue!58046)) b!1348229))

(assert (= (and b!1348232 ((_ is ValueCellFull!17880) mapDefault!58046)) b!1348231))

(assert (= start!113564 b!1348232))

(declare-fun b_lambda!24631 () Bool)

(assert (=> (not b_lambda!24631) (not b!1348234)))

(declare-fun t!46095 () Bool)

(declare-fun tb!12439 () Bool)

(assert (=> (and start!113564 (= defaultEntry!1306 defaultEntry!1306) t!46095) tb!12439))

(declare-fun result!25971 () Bool)

(assert (=> tb!12439 (= result!25971 tp_is_empty!37557)))

(assert (=> b!1348234 t!46095))

(declare-fun b_and!50905 () Bool)

(assert (= b_and!50903 (and (=> t!46095 result!25971) b_and!50905)))

(declare-fun m!1235255 () Bool)

(assert (=> b!1348233 m!1235255))

(declare-fun m!1235257 () Bool)

(assert (=> start!113564 m!1235257))

(declare-fun m!1235259 () Bool)

(assert (=> start!113564 m!1235259))

(declare-fun m!1235261 () Bool)

(assert (=> start!113564 m!1235261))

(declare-fun m!1235263 () Bool)

(assert (=> b!1348234 m!1235263))

(declare-fun m!1235265 () Bool)

(assert (=> b!1348234 m!1235265))

(declare-fun m!1235267 () Bool)

(assert (=> b!1348234 m!1235267))

(declare-fun m!1235269 () Bool)

(assert (=> b!1348234 m!1235269))

(declare-fun m!1235271 () Bool)

(assert (=> b!1348234 m!1235271))

(assert (=> b!1348234 m!1235267))

(declare-fun m!1235273 () Bool)

(assert (=> b!1348234 m!1235273))

(declare-fun m!1235275 () Bool)

(assert (=> b!1348234 m!1235275))

(assert (=> b!1348234 m!1235265))

(declare-fun m!1235277 () Bool)

(assert (=> b!1348234 m!1235277))

(assert (=> b!1348234 m!1235269))

(declare-fun m!1235279 () Bool)

(assert (=> b!1348234 m!1235279))

(declare-fun m!1235281 () Bool)

(assert (=> b!1348234 m!1235281))

(declare-fun m!1235283 () Bool)

(assert (=> b!1348234 m!1235283))

(declare-fun m!1235285 () Bool)

(assert (=> b!1348234 m!1235285))

(assert (=> b!1348234 m!1235281))

(declare-fun m!1235287 () Bool)

(assert (=> b!1348234 m!1235287))

(assert (=> b!1348234 m!1235273))

(declare-fun m!1235289 () Bool)

(assert (=> b!1348234 m!1235289))

(declare-fun m!1235291 () Bool)

(assert (=> b!1348234 m!1235291))

(declare-fun m!1235293 () Bool)

(assert (=> b!1348226 m!1235293))

(assert (=> b!1348235 m!1235281))

(assert (=> b!1348236 m!1235281))

(assert (=> b!1348236 m!1235281))

(declare-fun m!1235295 () Bool)

(assert (=> b!1348236 m!1235295))

(declare-fun m!1235297 () Bool)

(assert (=> b!1348230 m!1235297))

(assert (=> b!1348230 m!1235297))

(declare-fun m!1235299 () Bool)

(assert (=> b!1348230 m!1235299))

(declare-fun m!1235301 () Bool)

(assert (=> mapNonEmpty!58046 m!1235301))

(check-sat (not b!1348230) (not start!113564) (not mapNonEmpty!58046) (not b!1348233) (not b_next!31557) (not b_lambda!24631) tp_is_empty!37557 (not b!1348234) (not b!1348226) b_and!50905 (not b!1348236))
(check-sat b_and!50905 (not b_next!31557))
(get-model)

(declare-fun b_lambda!24635 () Bool)

(assert (= b_lambda!24631 (or (and start!113564 b_free!31557) b_lambda!24635)))

(check-sat (not b!1348230) (not start!113564) (not mapNonEmpty!58046) (not b!1348233) (not b_next!31557) (not b_lambda!24635) tp_is_empty!37557 (not b!1348234) (not b!1348226) b_and!50905 (not b!1348236))
(check-sat b_and!50905 (not b_next!31557))
(get-model)

(declare-fun d!144465 () Bool)

(assert (=> d!144465 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!113564 d!144465))

(declare-fun d!144467 () Bool)

(assert (=> d!144467 (= (array_inv!33465 _keys!1571) (bvsge (size!44976 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!113564 d!144467))

(declare-fun d!144469 () Bool)

(assert (=> d!144469 (= (array_inv!33466 _values!1303) (bvsge (size!44977 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!113564 d!144469))

(declare-fun d!144471 () Bool)

(assert (=> d!144471 (= (validKeyInArray!0 (select (arr!44426 _keys!1571) from!1960)) (and (not (= (select (arr!44426 _keys!1571) from!1960) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44426 _keys!1571) from!1960) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1348236 d!144471))

(declare-fun d!144473 () Bool)

(declare-fun e!767003 () Bool)

(assert (=> d!144473 e!767003))

(declare-fun res!894611 () Bool)

(assert (=> d!144473 (=> res!894611 e!767003)))

(declare-fun lt!596008 () Bool)

(assert (=> d!144473 (= res!894611 (not lt!596008))))

(declare-fun lt!596009 () Bool)

(assert (=> d!144473 (= lt!596008 lt!596009)))

(declare-fun lt!596011 () Unit!44172)

(declare-fun e!767002 () Unit!44172)

(assert (=> d!144473 (= lt!596011 e!767002)))

(declare-fun c!126406 () Bool)

(assert (=> d!144473 (= c!126406 lt!596009)))

(declare-fun containsKey!743 (List!31460 (_ BitVec 64)) Bool)

(assert (=> d!144473 (= lt!596009 (containsKey!743 (toList!10998 (getCurrentListMap!5947 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> d!144473 (= (contains!9176 (getCurrentListMap!5947 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142) lt!596008)))

(declare-fun b!1348283 () Bool)

(declare-fun lt!596010 () Unit!44172)

(assert (=> b!1348283 (= e!767002 lt!596010)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!489 (List!31460 (_ BitVec 64)) Unit!44172)

(assert (=> b!1348283 (= lt!596010 (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!10998 (getCurrentListMap!5947 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-datatypes ((Option!773 0))(
  ( (Some!772 (v!21506 V!55179)) (None!771) )
))
(declare-fun isDefined!528 (Option!773) Bool)

(declare-fun getValueByKey!721 (List!31460 (_ BitVec 64)) Option!773)

(assert (=> b!1348283 (isDefined!528 (getValueByKey!721 (toList!10998 (getCurrentListMap!5947 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun b!1348284 () Bool)

(declare-fun Unit!44174 () Unit!44172)

(assert (=> b!1348284 (= e!767002 Unit!44174)))

(declare-fun b!1348285 () Bool)

(assert (=> b!1348285 (= e!767003 (isDefined!528 (getValueByKey!721 (toList!10998 (getCurrentListMap!5947 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)))))

(assert (= (and d!144473 c!126406) b!1348283))

(assert (= (and d!144473 (not c!126406)) b!1348284))

(assert (= (and d!144473 (not res!894611)) b!1348285))

(declare-fun m!1235351 () Bool)

(assert (=> d!144473 m!1235351))

(declare-fun m!1235353 () Bool)

(assert (=> b!1348283 m!1235353))

(declare-fun m!1235355 () Bool)

(assert (=> b!1348283 m!1235355))

(assert (=> b!1348283 m!1235355))

(declare-fun m!1235357 () Bool)

(assert (=> b!1348283 m!1235357))

(assert (=> b!1348285 m!1235355))

(assert (=> b!1348285 m!1235355))

(assert (=> b!1348285 m!1235357))

(assert (=> b!1348230 d!144473))

(declare-fun e!767033 () Bool)

(declare-fun b!1348328 () Bool)

(declare-fun lt!596067 () ListLongMap!21965)

(declare-fun apply!1038 (ListLongMap!21965 (_ BitVec 64)) V!55179)

(assert (=> b!1348328 (= e!767033 (= (apply!1038 lt!596067 (select (arr!44426 _keys!1571) from!1960)) (get!22442 (select (arr!44427 _values!1303) from!1960) (dynLambda!3787 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1348328 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44977 _values!1303)))))

(assert (=> b!1348328 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44976 _keys!1571)))))

(declare-fun b!1348329 () Bool)

(declare-fun e!767030 () ListLongMap!21965)

(declare-fun e!767042 () ListLongMap!21965)

(assert (=> b!1348329 (= e!767030 e!767042)))

(declare-fun c!126424 () Bool)

(assert (=> b!1348329 (= c!126424 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!65095 () Bool)

(declare-fun call!65100 () Bool)

(assert (=> bm!65095 (= call!65100 (contains!9176 lt!596067 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1348330 () Bool)

(declare-fun res!894630 () Bool)

(declare-fun e!767034 () Bool)

(assert (=> b!1348330 (=> (not res!894630) (not e!767034))))

(declare-fun e!767037 () Bool)

(assert (=> b!1348330 (= res!894630 e!767037)))

(declare-fun c!126421 () Bool)

(assert (=> b!1348330 (= c!126421 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!65097 () Bool)

(declare-fun call!65102 () ListLongMap!21965)

(declare-fun call!65104 () ListLongMap!21965)

(assert (=> bm!65097 (= call!65102 call!65104)))

(declare-fun b!1348331 () Bool)

(declare-fun e!767032 () Bool)

(assert (=> b!1348331 (= e!767032 (= (apply!1038 lt!596067 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(declare-fun b!1348332 () Bool)

(declare-fun call!65103 () ListLongMap!21965)

(assert (=> b!1348332 (= e!767042 call!65103)))

(declare-fun b!1348333 () Bool)

(assert (=> b!1348333 (= e!767037 e!767032)))

(declare-fun res!894638 () Bool)

(declare-fun call!65098 () Bool)

(assert (=> b!1348333 (= res!894638 call!65098)))

(assert (=> b!1348333 (=> (not res!894638) (not e!767032))))

(declare-fun b!1348334 () Bool)

(declare-fun e!767040 () Bool)

(assert (=> b!1348334 (= e!767040 e!767033)))

(declare-fun res!894636 () Bool)

(assert (=> b!1348334 (=> (not res!894636) (not e!767033))))

(assert (=> b!1348334 (= res!894636 (contains!9176 lt!596067 (select (arr!44426 _keys!1571) from!1960)))))

(assert (=> b!1348334 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44976 _keys!1571)))))

(declare-fun b!1348335 () Bool)

(declare-fun e!767039 () ListLongMap!21965)

(assert (=> b!1348335 (= e!767039 call!65103)))

(declare-fun b!1348336 () Bool)

(declare-fun e!767035 () Unit!44172)

(declare-fun lt!596068 () Unit!44172)

(assert (=> b!1348336 (= e!767035 lt!596068)))

(declare-fun lt!596063 () ListLongMap!21965)

(assert (=> b!1348336 (= lt!596063 (getCurrentListMapNoExtraKeys!6494 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596057 () (_ BitVec 64))

(assert (=> b!1348336 (= lt!596057 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596076 () (_ BitVec 64))

(assert (=> b!1348336 (= lt!596076 (select (arr!44426 _keys!1571) from!1960))))

(declare-fun lt!596071 () Unit!44172)

(assert (=> b!1348336 (= lt!596071 (addStillContains!1213 lt!596063 lt!596057 zeroValue!1245 lt!596076))))

(assert (=> b!1348336 (contains!9176 (+!4848 lt!596063 (tuple2!24309 lt!596057 zeroValue!1245)) lt!596076)))

(declare-fun lt!596061 () Unit!44172)

(assert (=> b!1348336 (= lt!596061 lt!596071)))

(declare-fun lt!596075 () ListLongMap!21965)

(assert (=> b!1348336 (= lt!596075 (getCurrentListMapNoExtraKeys!6494 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596070 () (_ BitVec 64))

(assert (=> b!1348336 (= lt!596070 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596077 () (_ BitVec 64))

(assert (=> b!1348336 (= lt!596077 (select (arr!44426 _keys!1571) from!1960))))

(declare-fun lt!596064 () Unit!44172)

(declare-fun addApplyDifferent!580 (ListLongMap!21965 (_ BitVec 64) V!55179 (_ BitVec 64)) Unit!44172)

(assert (=> b!1348336 (= lt!596064 (addApplyDifferent!580 lt!596075 lt!596070 minValue!1245 lt!596077))))

(assert (=> b!1348336 (= (apply!1038 (+!4848 lt!596075 (tuple2!24309 lt!596070 minValue!1245)) lt!596077) (apply!1038 lt!596075 lt!596077))))

(declare-fun lt!596069 () Unit!44172)

(assert (=> b!1348336 (= lt!596069 lt!596064)))

(declare-fun lt!596059 () ListLongMap!21965)

(assert (=> b!1348336 (= lt!596059 (getCurrentListMapNoExtraKeys!6494 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596066 () (_ BitVec 64))

(assert (=> b!1348336 (= lt!596066 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596056 () (_ BitVec 64))

(assert (=> b!1348336 (= lt!596056 (select (arr!44426 _keys!1571) from!1960))))

(declare-fun lt!596058 () Unit!44172)

(assert (=> b!1348336 (= lt!596058 (addApplyDifferent!580 lt!596059 lt!596066 zeroValue!1245 lt!596056))))

(assert (=> b!1348336 (= (apply!1038 (+!4848 lt!596059 (tuple2!24309 lt!596066 zeroValue!1245)) lt!596056) (apply!1038 lt!596059 lt!596056))))

(declare-fun lt!596072 () Unit!44172)

(assert (=> b!1348336 (= lt!596072 lt!596058)))

(declare-fun lt!596073 () ListLongMap!21965)

(assert (=> b!1348336 (= lt!596073 (getCurrentListMapNoExtraKeys!6494 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596062 () (_ BitVec 64))

(assert (=> b!1348336 (= lt!596062 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596074 () (_ BitVec 64))

(assert (=> b!1348336 (= lt!596074 (select (arr!44426 _keys!1571) from!1960))))

(assert (=> b!1348336 (= lt!596068 (addApplyDifferent!580 lt!596073 lt!596062 minValue!1245 lt!596074))))

(assert (=> b!1348336 (= (apply!1038 (+!4848 lt!596073 (tuple2!24309 lt!596062 minValue!1245)) lt!596074) (apply!1038 lt!596073 lt!596074))))

(declare-fun b!1348337 () Bool)

(declare-fun res!894635 () Bool)

(assert (=> b!1348337 (=> (not res!894635) (not e!767034))))

(assert (=> b!1348337 (= res!894635 e!767040)))

(declare-fun res!894634 () Bool)

(assert (=> b!1348337 (=> res!894634 e!767040)))

(declare-fun e!767036 () Bool)

(assert (=> b!1348337 (= res!894634 (not e!767036))))

(declare-fun res!894631 () Bool)

(assert (=> b!1348337 (=> (not res!894631) (not e!767036))))

(assert (=> b!1348337 (= res!894631 (bvslt from!1960 (size!44976 _keys!1571)))))

(declare-fun b!1348338 () Bool)

(declare-fun call!65101 () ListLongMap!21965)

(assert (=> b!1348338 (= e!767030 (+!4848 call!65101 (tuple2!24309 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun b!1348339 () Bool)

(declare-fun Unit!44175 () Unit!44172)

(assert (=> b!1348339 (= e!767035 Unit!44175)))

(declare-fun b!1348340 () Bool)

(declare-fun e!767038 () Bool)

(assert (=> b!1348340 (= e!767038 (validKeyInArray!0 (select (arr!44426 _keys!1571) from!1960)))))

(declare-fun c!126423 () Bool)

(declare-fun call!65099 () ListLongMap!21965)

(declare-fun bm!65098 () Bool)

(assert (=> bm!65098 (= call!65101 (+!4848 (ite c!126423 call!65099 (ite c!126424 call!65104 call!65102)) (ite (or c!126423 c!126424) (tuple2!24309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24309 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun b!1348341 () Bool)

(assert (=> b!1348341 (= e!767037 (not call!65098))))

(declare-fun b!1348342 () Bool)

(assert (=> b!1348342 (= e!767036 (validKeyInArray!0 (select (arr!44426 _keys!1571) from!1960)))))

(declare-fun bm!65099 () Bool)

(assert (=> bm!65099 (= call!65103 call!65101)))

(declare-fun b!1348343 () Bool)

(declare-fun e!767031 () Bool)

(assert (=> b!1348343 (= e!767034 e!767031)))

(declare-fun c!126422 () Bool)

(assert (=> b!1348343 (= c!126422 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1348344 () Bool)

(assert (=> b!1348344 (= e!767039 call!65102)))

(declare-fun b!1348345 () Bool)

(declare-fun c!126420 () Bool)

(assert (=> b!1348345 (= c!126420 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1348345 (= e!767042 e!767039)))

(declare-fun b!1348346 () Bool)

(assert (=> b!1348346 (= e!767031 (not call!65100))))

(declare-fun bm!65096 () Bool)

(assert (=> bm!65096 (= call!65099 (getCurrentListMapNoExtraKeys!6494 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun d!144475 () Bool)

(assert (=> d!144475 e!767034))

(declare-fun res!894632 () Bool)

(assert (=> d!144475 (=> (not res!894632) (not e!767034))))

(assert (=> d!144475 (= res!894632 (or (bvsge from!1960 (size!44976 _keys!1571)) (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44976 _keys!1571)))))))

(declare-fun lt!596065 () ListLongMap!21965)

(assert (=> d!144475 (= lt!596067 lt!596065)))

(declare-fun lt!596060 () Unit!44172)

(assert (=> d!144475 (= lt!596060 e!767035)))

(declare-fun c!126419 () Bool)

(assert (=> d!144475 (= c!126419 e!767038)))

(declare-fun res!894633 () Bool)

(assert (=> d!144475 (=> (not res!894633) (not e!767038))))

(assert (=> d!144475 (= res!894633 (bvslt from!1960 (size!44976 _keys!1571)))))

(assert (=> d!144475 (= lt!596065 e!767030)))

(assert (=> d!144475 (= c!126423 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144475 (validMask!0 mask!1977)))

(assert (=> d!144475 (= (getCurrentListMap!5947 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!596067)))

(declare-fun b!1348347 () Bool)

(declare-fun e!767041 () Bool)

(assert (=> b!1348347 (= e!767031 e!767041)))

(declare-fun res!894637 () Bool)

(assert (=> b!1348347 (= res!894637 call!65100)))

(assert (=> b!1348347 (=> (not res!894637) (not e!767041))))

(declare-fun bm!65100 () Bool)

(assert (=> bm!65100 (= call!65098 (contains!9176 lt!596067 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!65101 () Bool)

(assert (=> bm!65101 (= call!65104 call!65099)))

(declare-fun b!1348348 () Bool)

(assert (=> b!1348348 (= e!767041 (= (apply!1038 lt!596067 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(assert (= (and d!144475 c!126423) b!1348338))

(assert (= (and d!144475 (not c!126423)) b!1348329))

(assert (= (and b!1348329 c!126424) b!1348332))

(assert (= (and b!1348329 (not c!126424)) b!1348345))

(assert (= (and b!1348345 c!126420) b!1348335))

(assert (= (and b!1348345 (not c!126420)) b!1348344))

(assert (= (or b!1348335 b!1348344) bm!65097))

(assert (= (or b!1348332 bm!65097) bm!65101))

(assert (= (or b!1348332 b!1348335) bm!65099))

(assert (= (or b!1348338 bm!65101) bm!65096))

(assert (= (or b!1348338 bm!65099) bm!65098))

(assert (= (and d!144475 res!894633) b!1348340))

(assert (= (and d!144475 c!126419) b!1348336))

(assert (= (and d!144475 (not c!126419)) b!1348339))

(assert (= (and d!144475 res!894632) b!1348337))

(assert (= (and b!1348337 res!894631) b!1348342))

(assert (= (and b!1348337 (not res!894634)) b!1348334))

(assert (= (and b!1348334 res!894636) b!1348328))

(assert (= (and b!1348337 res!894635) b!1348330))

(assert (= (and b!1348330 c!126421) b!1348333))

(assert (= (and b!1348330 (not c!126421)) b!1348341))

(assert (= (and b!1348333 res!894638) b!1348331))

(assert (= (or b!1348333 b!1348341) bm!65100))

(assert (= (and b!1348330 res!894630) b!1348343))

(assert (= (and b!1348343 c!126422) b!1348347))

(assert (= (and b!1348343 (not c!126422)) b!1348346))

(assert (= (and b!1348347 res!894637) b!1348348))

(assert (= (or b!1348347 b!1348346) bm!65095))

(declare-fun b_lambda!24637 () Bool)

(assert (=> (not b_lambda!24637) (not b!1348328)))

(assert (=> b!1348328 t!46095))

(declare-fun b_and!50911 () Bool)

(assert (= b_and!50905 (and (=> t!46095 result!25971) b_and!50911)))

(declare-fun m!1235359 () Bool)

(assert (=> b!1348338 m!1235359))

(declare-fun m!1235361 () Bool)

(assert (=> bm!65095 m!1235361))

(declare-fun m!1235363 () Bool)

(assert (=> b!1348331 m!1235363))

(assert (=> d!144475 m!1235257))

(declare-fun m!1235365 () Bool)

(assert (=> bm!65096 m!1235365))

(declare-fun m!1235367 () Bool)

(assert (=> b!1348336 m!1235367))

(declare-fun m!1235369 () Bool)

(assert (=> b!1348336 m!1235369))

(declare-fun m!1235371 () Bool)

(assert (=> b!1348336 m!1235371))

(declare-fun m!1235373 () Bool)

(assert (=> b!1348336 m!1235373))

(declare-fun m!1235375 () Bool)

(assert (=> b!1348336 m!1235375))

(declare-fun m!1235377 () Bool)

(assert (=> b!1348336 m!1235377))

(declare-fun m!1235379 () Bool)

(assert (=> b!1348336 m!1235379))

(declare-fun m!1235381 () Bool)

(assert (=> b!1348336 m!1235381))

(assert (=> b!1348336 m!1235367))

(declare-fun m!1235383 () Bool)

(assert (=> b!1348336 m!1235383))

(declare-fun m!1235385 () Bool)

(assert (=> b!1348336 m!1235385))

(assert (=> b!1348336 m!1235383))

(declare-fun m!1235387 () Bool)

(assert (=> b!1348336 m!1235387))

(assert (=> b!1348336 m!1235377))

(declare-fun m!1235389 () Bool)

(assert (=> b!1348336 m!1235389))

(declare-fun m!1235391 () Bool)

(assert (=> b!1348336 m!1235391))

(declare-fun m!1235393 () Bool)

(assert (=> b!1348336 m!1235393))

(assert (=> b!1348336 m!1235365))

(assert (=> b!1348336 m!1235281))

(declare-fun m!1235395 () Bool)

(assert (=> b!1348336 m!1235395))

(assert (=> b!1348336 m!1235373))

(declare-fun m!1235397 () Bool)

(assert (=> b!1348348 m!1235397))

(assert (=> b!1348328 m!1235281))

(declare-fun m!1235399 () Bool)

(assert (=> b!1348328 m!1235399))

(assert (=> b!1348328 m!1235269))

(assert (=> b!1348328 m!1235281))

(assert (=> b!1348328 m!1235267))

(assert (=> b!1348328 m!1235269))

(assert (=> b!1348328 m!1235271))

(assert (=> b!1348328 m!1235267))

(declare-fun m!1235401 () Bool)

(assert (=> bm!65100 m!1235401))

(declare-fun m!1235403 () Bool)

(assert (=> bm!65098 m!1235403))

(assert (=> b!1348342 m!1235281))

(assert (=> b!1348342 m!1235281))

(assert (=> b!1348342 m!1235295))

(assert (=> b!1348334 m!1235281))

(assert (=> b!1348334 m!1235281))

(declare-fun m!1235405 () Bool)

(assert (=> b!1348334 m!1235405))

(assert (=> b!1348340 m!1235281))

(assert (=> b!1348340 m!1235281))

(assert (=> b!1348340 m!1235295))

(assert (=> b!1348230 d!144475))

(declare-fun d!144477 () Bool)

(assert (=> d!144477 (contains!9176 lt!595976 k0!1142)))

(declare-fun lt!596080 () Unit!44172)

(declare-fun choose!1976 ((_ BitVec 64) (_ BitVec 64) V!55179 ListLongMap!21965) Unit!44172)

(assert (=> d!144477 (= lt!596080 (choose!1976 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595976))))

(assert (=> d!144477 (contains!9176 (+!4848 lt!595976 (tuple2!24309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(assert (=> d!144477 (= (lemmaInListMapAfterAddingDiffThenInBefore!409 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595976) lt!596080)))

(declare-fun bs!38649 () Bool)

(assert (= bs!38649 d!144477))

(assert (=> bs!38649 m!1235279))

(declare-fun m!1235407 () Bool)

(assert (=> bs!38649 m!1235407))

(declare-fun m!1235409 () Bool)

(assert (=> bs!38649 m!1235409))

(assert (=> bs!38649 m!1235409))

(declare-fun m!1235411 () Bool)

(assert (=> bs!38649 m!1235411))

(assert (=> b!1348234 d!144477))

(declare-fun d!144479 () Bool)

(declare-fun c!126427 () Bool)

(assert (=> d!144479 (= c!126427 ((_ is ValueCellFull!17880) (select (arr!44427 _values!1303) from!1960)))))

(declare-fun e!767045 () V!55179)

(assert (=> d!144479 (= (get!22442 (select (arr!44427 _values!1303) from!1960) (dynLambda!3787 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!767045)))

(declare-fun b!1348353 () Bool)

(declare-fun get!22443 (ValueCell!17880 V!55179) V!55179)

(assert (=> b!1348353 (= e!767045 (get!22443 (select (arr!44427 _values!1303) from!1960) (dynLambda!3787 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1348354 () Bool)

(declare-fun get!22444 (ValueCell!17880 V!55179) V!55179)

(assert (=> b!1348354 (= e!767045 (get!22444 (select (arr!44427 _values!1303) from!1960) (dynLambda!3787 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144479 c!126427) b!1348353))

(assert (= (and d!144479 (not c!126427)) b!1348354))

(assert (=> b!1348353 m!1235267))

(assert (=> b!1348353 m!1235269))

(declare-fun m!1235413 () Bool)

(assert (=> b!1348353 m!1235413))

(assert (=> b!1348354 m!1235267))

(assert (=> b!1348354 m!1235269))

(declare-fun m!1235415 () Bool)

(assert (=> b!1348354 m!1235415))

(assert (=> b!1348234 d!144479))

(declare-fun d!144481 () Bool)

(assert (=> d!144481 (contains!9176 lt!595977 k0!1142)))

(declare-fun lt!596081 () Unit!44172)

(assert (=> d!144481 (= lt!596081 (choose!1976 k0!1142 (select (arr!44426 _keys!1571) from!1960) lt!595978 lt!595977))))

(assert (=> d!144481 (contains!9176 (+!4848 lt!595977 (tuple2!24309 (select (arr!44426 _keys!1571) from!1960) lt!595978)) k0!1142)))

(assert (=> d!144481 (= (lemmaInListMapAfterAddingDiffThenInBefore!409 k0!1142 (select (arr!44426 _keys!1571) from!1960) lt!595978 lt!595977) lt!596081)))

(declare-fun bs!38650 () Bool)

(assert (= bs!38650 d!144481))

(assert (=> bs!38650 m!1235289))

(assert (=> bs!38650 m!1235281))

(declare-fun m!1235417 () Bool)

(assert (=> bs!38650 m!1235417))

(assert (=> bs!38650 m!1235285))

(assert (=> bs!38650 m!1235285))

(declare-fun m!1235419 () Bool)

(assert (=> bs!38650 m!1235419))

(assert (=> b!1348234 d!144481))

(declare-fun d!144483 () Bool)

(declare-fun e!767047 () Bool)

(assert (=> d!144483 e!767047))

(declare-fun res!894639 () Bool)

(assert (=> d!144483 (=> res!894639 e!767047)))

(declare-fun lt!596082 () Bool)

(assert (=> d!144483 (= res!894639 (not lt!596082))))

(declare-fun lt!596083 () Bool)

(assert (=> d!144483 (= lt!596082 lt!596083)))

(declare-fun lt!596085 () Unit!44172)

(declare-fun e!767046 () Unit!44172)

(assert (=> d!144483 (= lt!596085 e!767046)))

(declare-fun c!126428 () Bool)

(assert (=> d!144483 (= c!126428 lt!596083)))

(assert (=> d!144483 (= lt!596083 (containsKey!743 (toList!10998 (getCurrentListMap!5947 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(assert (=> d!144483 (= (contains!9176 (getCurrentListMap!5947 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) k0!1142) lt!596082)))

(declare-fun b!1348355 () Bool)

(declare-fun lt!596084 () Unit!44172)

(assert (=> b!1348355 (= e!767046 lt!596084)))

(assert (=> b!1348355 (= lt!596084 (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!10998 (getCurrentListMap!5947 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(assert (=> b!1348355 (isDefined!528 (getValueByKey!721 (toList!10998 (getCurrentListMap!5947 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(declare-fun b!1348356 () Bool)

(declare-fun Unit!44176 () Unit!44172)

(assert (=> b!1348356 (= e!767046 Unit!44176)))

(declare-fun b!1348357 () Bool)

(assert (=> b!1348357 (= e!767047 (isDefined!528 (getValueByKey!721 (toList!10998 (getCurrentListMap!5947 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142)))))

(assert (= (and d!144483 c!126428) b!1348355))

(assert (= (and d!144483 (not c!126428)) b!1348356))

(assert (= (and d!144483 (not res!894639)) b!1348357))

(declare-fun m!1235421 () Bool)

(assert (=> d!144483 m!1235421))

(declare-fun m!1235423 () Bool)

(assert (=> b!1348355 m!1235423))

(declare-fun m!1235425 () Bool)

(assert (=> b!1348355 m!1235425))

(assert (=> b!1348355 m!1235425))

(declare-fun m!1235427 () Bool)

(assert (=> b!1348355 m!1235427))

(assert (=> b!1348357 m!1235425))

(assert (=> b!1348357 m!1235425))

(assert (=> b!1348357 m!1235427))

(assert (=> b!1348234 d!144483))

(declare-fun d!144485 () Bool)

(declare-fun e!767050 () Bool)

(assert (=> d!144485 e!767050))

(declare-fun res!894644 () Bool)

(assert (=> d!144485 (=> (not res!894644) (not e!767050))))

(declare-fun lt!596097 () ListLongMap!21965)

(assert (=> d!144485 (= res!894644 (contains!9176 lt!596097 (_1!12165 (tuple2!24309 (select (arr!44426 _keys!1571) from!1960) lt!595978))))))

(declare-fun lt!596095 () List!31460)

(assert (=> d!144485 (= lt!596097 (ListLongMap!21966 lt!596095))))

(declare-fun lt!596096 () Unit!44172)

(declare-fun lt!596094 () Unit!44172)

(assert (=> d!144485 (= lt!596096 lt!596094)))

(assert (=> d!144485 (= (getValueByKey!721 lt!596095 (_1!12165 (tuple2!24309 (select (arr!44426 _keys!1571) from!1960) lt!595978))) (Some!772 (_2!12165 (tuple2!24309 (select (arr!44426 _keys!1571) from!1960) lt!595978))))))

(declare-fun lemmaContainsTupThenGetReturnValue!366 (List!31460 (_ BitVec 64) V!55179) Unit!44172)

(assert (=> d!144485 (= lt!596094 (lemmaContainsTupThenGetReturnValue!366 lt!596095 (_1!12165 (tuple2!24309 (select (arr!44426 _keys!1571) from!1960) lt!595978)) (_2!12165 (tuple2!24309 (select (arr!44426 _keys!1571) from!1960) lt!595978))))))

(declare-fun insertStrictlySorted!495 (List!31460 (_ BitVec 64) V!55179) List!31460)

(assert (=> d!144485 (= lt!596095 (insertStrictlySorted!495 (toList!10998 lt!595977) (_1!12165 (tuple2!24309 (select (arr!44426 _keys!1571) from!1960) lt!595978)) (_2!12165 (tuple2!24309 (select (arr!44426 _keys!1571) from!1960) lt!595978))))))

(assert (=> d!144485 (= (+!4848 lt!595977 (tuple2!24309 (select (arr!44426 _keys!1571) from!1960) lt!595978)) lt!596097)))

(declare-fun b!1348362 () Bool)

(declare-fun res!894645 () Bool)

(assert (=> b!1348362 (=> (not res!894645) (not e!767050))))

(assert (=> b!1348362 (= res!894645 (= (getValueByKey!721 (toList!10998 lt!596097) (_1!12165 (tuple2!24309 (select (arr!44426 _keys!1571) from!1960) lt!595978))) (Some!772 (_2!12165 (tuple2!24309 (select (arr!44426 _keys!1571) from!1960) lt!595978)))))))

(declare-fun b!1348363 () Bool)

(declare-fun contains!9177 (List!31460 tuple2!24308) Bool)

(assert (=> b!1348363 (= e!767050 (contains!9177 (toList!10998 lt!596097) (tuple2!24309 (select (arr!44426 _keys!1571) from!1960) lt!595978)))))

(assert (= (and d!144485 res!894644) b!1348362))

(assert (= (and b!1348362 res!894645) b!1348363))

(declare-fun m!1235429 () Bool)

(assert (=> d!144485 m!1235429))

(declare-fun m!1235431 () Bool)

(assert (=> d!144485 m!1235431))

(declare-fun m!1235433 () Bool)

(assert (=> d!144485 m!1235433))

(declare-fun m!1235435 () Bool)

(assert (=> d!144485 m!1235435))

(declare-fun m!1235437 () Bool)

(assert (=> b!1348362 m!1235437))

(declare-fun m!1235439 () Bool)

(assert (=> b!1348363 m!1235439))

(assert (=> b!1348234 d!144485))

(declare-fun d!144487 () Bool)

(assert (=> d!144487 (contains!9176 (+!4848 lt!595977 (tuple2!24309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-fun lt!596100 () Unit!44172)

(declare-fun choose!1977 (ListLongMap!21965 (_ BitVec 64) V!55179 (_ BitVec 64)) Unit!44172)

(assert (=> d!144487 (= lt!596100 (choose!1977 lt!595977 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> d!144487 (contains!9176 lt!595977 k0!1142)))

(assert (=> d!144487 (= (addStillContains!1213 lt!595977 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142) lt!596100)))

(declare-fun bs!38651 () Bool)

(assert (= bs!38651 d!144487))

(assert (=> bs!38651 m!1235273))

(assert (=> bs!38651 m!1235273))

(assert (=> bs!38651 m!1235275))

(declare-fun m!1235441 () Bool)

(assert (=> bs!38651 m!1235441))

(assert (=> bs!38651 m!1235289))

(assert (=> b!1348234 d!144487))

(declare-fun e!767054 () Bool)

(declare-fun b!1348365 () Bool)

(declare-fun lt!596112 () ListLongMap!21965)

(assert (=> b!1348365 (= e!767054 (= (apply!1038 lt!596112 (select (arr!44426 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22442 (select (arr!44427 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3787 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1348365 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44977 _values!1303)))))

(assert (=> b!1348365 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44976 _keys!1571)))))

(declare-fun b!1348366 () Bool)

(declare-fun e!767051 () ListLongMap!21965)

(declare-fun e!767063 () ListLongMap!21965)

(assert (=> b!1348366 (= e!767051 e!767063)))

(declare-fun c!126434 () Bool)

(assert (=> b!1348366 (= c!126434 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!65102 () Bool)

(declare-fun call!65107 () Bool)

(assert (=> bm!65102 (= call!65107 (contains!9176 lt!596112 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1348367 () Bool)

(declare-fun res!894646 () Bool)

(declare-fun e!767055 () Bool)

(assert (=> b!1348367 (=> (not res!894646) (not e!767055))))

(declare-fun e!767058 () Bool)

(assert (=> b!1348367 (= res!894646 e!767058)))

(declare-fun c!126431 () Bool)

(assert (=> b!1348367 (= c!126431 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!65104 () Bool)

(declare-fun call!65109 () ListLongMap!21965)

(declare-fun call!65111 () ListLongMap!21965)

(assert (=> bm!65104 (= call!65109 call!65111)))

(declare-fun b!1348368 () Bool)

(declare-fun e!767053 () Bool)

(assert (=> b!1348368 (= e!767053 (= (apply!1038 lt!596112 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(declare-fun b!1348369 () Bool)

(declare-fun call!65110 () ListLongMap!21965)

(assert (=> b!1348369 (= e!767063 call!65110)))

(declare-fun b!1348370 () Bool)

(assert (=> b!1348370 (= e!767058 e!767053)))

(declare-fun res!894654 () Bool)

(declare-fun call!65105 () Bool)

(assert (=> b!1348370 (= res!894654 call!65105)))

(assert (=> b!1348370 (=> (not res!894654) (not e!767053))))

(declare-fun b!1348371 () Bool)

(declare-fun e!767061 () Bool)

(assert (=> b!1348371 (= e!767061 e!767054)))

(declare-fun res!894652 () Bool)

(assert (=> b!1348371 (=> (not res!894652) (not e!767054))))

(assert (=> b!1348371 (= res!894652 (contains!9176 lt!596112 (select (arr!44426 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1348371 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44976 _keys!1571)))))

(declare-fun b!1348372 () Bool)

(declare-fun e!767060 () ListLongMap!21965)

(assert (=> b!1348372 (= e!767060 call!65110)))

(declare-fun b!1348373 () Bool)

(declare-fun e!767056 () Unit!44172)

(declare-fun lt!596113 () Unit!44172)

(assert (=> b!1348373 (= e!767056 lt!596113)))

(declare-fun lt!596108 () ListLongMap!21965)

(assert (=> b!1348373 (= lt!596108 (getCurrentListMapNoExtraKeys!6494 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596102 () (_ BitVec 64))

(assert (=> b!1348373 (= lt!596102 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596121 () (_ BitVec 64))

(assert (=> b!1348373 (= lt!596121 (select (arr!44426 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!596116 () Unit!44172)

(assert (=> b!1348373 (= lt!596116 (addStillContains!1213 lt!596108 lt!596102 zeroValue!1245 lt!596121))))

(assert (=> b!1348373 (contains!9176 (+!4848 lt!596108 (tuple2!24309 lt!596102 zeroValue!1245)) lt!596121)))

(declare-fun lt!596106 () Unit!44172)

(assert (=> b!1348373 (= lt!596106 lt!596116)))

(declare-fun lt!596120 () ListLongMap!21965)

(assert (=> b!1348373 (= lt!596120 (getCurrentListMapNoExtraKeys!6494 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596115 () (_ BitVec 64))

(assert (=> b!1348373 (= lt!596115 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596122 () (_ BitVec 64))

(assert (=> b!1348373 (= lt!596122 (select (arr!44426 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!596109 () Unit!44172)

(assert (=> b!1348373 (= lt!596109 (addApplyDifferent!580 lt!596120 lt!596115 minValue!1245 lt!596122))))

(assert (=> b!1348373 (= (apply!1038 (+!4848 lt!596120 (tuple2!24309 lt!596115 minValue!1245)) lt!596122) (apply!1038 lt!596120 lt!596122))))

(declare-fun lt!596114 () Unit!44172)

(assert (=> b!1348373 (= lt!596114 lt!596109)))

(declare-fun lt!596104 () ListLongMap!21965)

(assert (=> b!1348373 (= lt!596104 (getCurrentListMapNoExtraKeys!6494 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596111 () (_ BitVec 64))

(assert (=> b!1348373 (= lt!596111 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596101 () (_ BitVec 64))

(assert (=> b!1348373 (= lt!596101 (select (arr!44426 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!596103 () Unit!44172)

(assert (=> b!1348373 (= lt!596103 (addApplyDifferent!580 lt!596104 lt!596111 zeroValue!1245 lt!596101))))

(assert (=> b!1348373 (= (apply!1038 (+!4848 lt!596104 (tuple2!24309 lt!596111 zeroValue!1245)) lt!596101) (apply!1038 lt!596104 lt!596101))))

(declare-fun lt!596117 () Unit!44172)

(assert (=> b!1348373 (= lt!596117 lt!596103)))

(declare-fun lt!596118 () ListLongMap!21965)

(assert (=> b!1348373 (= lt!596118 (getCurrentListMapNoExtraKeys!6494 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596107 () (_ BitVec 64))

(assert (=> b!1348373 (= lt!596107 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596119 () (_ BitVec 64))

(assert (=> b!1348373 (= lt!596119 (select (arr!44426 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(assert (=> b!1348373 (= lt!596113 (addApplyDifferent!580 lt!596118 lt!596107 minValue!1245 lt!596119))))

(assert (=> b!1348373 (= (apply!1038 (+!4848 lt!596118 (tuple2!24309 lt!596107 minValue!1245)) lt!596119) (apply!1038 lt!596118 lt!596119))))

(declare-fun b!1348374 () Bool)

(declare-fun res!894651 () Bool)

(assert (=> b!1348374 (=> (not res!894651) (not e!767055))))

(assert (=> b!1348374 (= res!894651 e!767061)))

(declare-fun res!894650 () Bool)

(assert (=> b!1348374 (=> res!894650 e!767061)))

(declare-fun e!767057 () Bool)

(assert (=> b!1348374 (= res!894650 (not e!767057))))

(declare-fun res!894647 () Bool)

(assert (=> b!1348374 (=> (not res!894647) (not e!767057))))

(assert (=> b!1348374 (= res!894647 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44976 _keys!1571)))))

(declare-fun b!1348375 () Bool)

(declare-fun call!65108 () ListLongMap!21965)

(assert (=> b!1348375 (= e!767051 (+!4848 call!65108 (tuple2!24309 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun b!1348376 () Bool)

(declare-fun Unit!44177 () Unit!44172)

(assert (=> b!1348376 (= e!767056 Unit!44177)))

(declare-fun b!1348377 () Bool)

(declare-fun e!767059 () Bool)

(assert (=> b!1348377 (= e!767059 (validKeyInArray!0 (select (arr!44426 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun call!65106 () ListLongMap!21965)

(declare-fun bm!65105 () Bool)

(declare-fun c!126433 () Bool)

(assert (=> bm!65105 (= call!65108 (+!4848 (ite c!126433 call!65106 (ite c!126434 call!65111 call!65109)) (ite (or c!126433 c!126434) (tuple2!24309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24309 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun b!1348378 () Bool)

(assert (=> b!1348378 (= e!767058 (not call!65105))))

(declare-fun b!1348379 () Bool)

(assert (=> b!1348379 (= e!767057 (validKeyInArray!0 (select (arr!44426 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun bm!65106 () Bool)

(assert (=> bm!65106 (= call!65110 call!65108)))

(declare-fun b!1348380 () Bool)

(declare-fun e!767052 () Bool)

(assert (=> b!1348380 (= e!767055 e!767052)))

(declare-fun c!126432 () Bool)

(assert (=> b!1348380 (= c!126432 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1348381 () Bool)

(assert (=> b!1348381 (= e!767060 call!65109)))

(declare-fun b!1348382 () Bool)

(declare-fun c!126430 () Bool)

(assert (=> b!1348382 (= c!126430 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1348382 (= e!767063 e!767060)))

(declare-fun b!1348383 () Bool)

(assert (=> b!1348383 (= e!767052 (not call!65107))))

(declare-fun bm!65103 () Bool)

(assert (=> bm!65103 (= call!65106 (getCurrentListMapNoExtraKeys!6494 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun d!144489 () Bool)

(assert (=> d!144489 e!767055))

(declare-fun res!894648 () Bool)

(assert (=> d!144489 (=> (not res!894648) (not e!767055))))

(assert (=> d!144489 (= res!894648 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!44976 _keys!1571)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44976 _keys!1571)))))))

(declare-fun lt!596110 () ListLongMap!21965)

(assert (=> d!144489 (= lt!596112 lt!596110)))

(declare-fun lt!596105 () Unit!44172)

(assert (=> d!144489 (= lt!596105 e!767056)))

(declare-fun c!126429 () Bool)

(assert (=> d!144489 (= c!126429 e!767059)))

(declare-fun res!894649 () Bool)

(assert (=> d!144489 (=> (not res!894649) (not e!767059))))

(assert (=> d!144489 (= res!894649 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44976 _keys!1571)))))

(assert (=> d!144489 (= lt!596110 e!767051)))

(assert (=> d!144489 (= c!126433 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144489 (validMask!0 mask!1977)))

(assert (=> d!144489 (= (getCurrentListMap!5947 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!596112)))

(declare-fun b!1348384 () Bool)

(declare-fun e!767062 () Bool)

(assert (=> b!1348384 (= e!767052 e!767062)))

(declare-fun res!894653 () Bool)

(assert (=> b!1348384 (= res!894653 call!65107)))

(assert (=> b!1348384 (=> (not res!894653) (not e!767062))))

(declare-fun bm!65107 () Bool)

(assert (=> bm!65107 (= call!65105 (contains!9176 lt!596112 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!65108 () Bool)

(assert (=> bm!65108 (= call!65111 call!65106)))

(declare-fun b!1348385 () Bool)

(assert (=> b!1348385 (= e!767062 (= (apply!1038 lt!596112 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(assert (= (and d!144489 c!126433) b!1348375))

(assert (= (and d!144489 (not c!126433)) b!1348366))

(assert (= (and b!1348366 c!126434) b!1348369))

(assert (= (and b!1348366 (not c!126434)) b!1348382))

(assert (= (and b!1348382 c!126430) b!1348372))

(assert (= (and b!1348382 (not c!126430)) b!1348381))

(assert (= (or b!1348372 b!1348381) bm!65104))

(assert (= (or b!1348369 bm!65104) bm!65108))

(assert (= (or b!1348369 b!1348372) bm!65106))

(assert (= (or b!1348375 bm!65108) bm!65103))

(assert (= (or b!1348375 bm!65106) bm!65105))

(assert (= (and d!144489 res!894649) b!1348377))

(assert (= (and d!144489 c!126429) b!1348373))

(assert (= (and d!144489 (not c!126429)) b!1348376))

(assert (= (and d!144489 res!894648) b!1348374))

(assert (= (and b!1348374 res!894647) b!1348379))

(assert (= (and b!1348374 (not res!894650)) b!1348371))

(assert (= (and b!1348371 res!894652) b!1348365))

(assert (= (and b!1348374 res!894651) b!1348367))

(assert (= (and b!1348367 c!126431) b!1348370))

(assert (= (and b!1348367 (not c!126431)) b!1348378))

(assert (= (and b!1348370 res!894654) b!1348368))

(assert (= (or b!1348370 b!1348378) bm!65107))

(assert (= (and b!1348367 res!894646) b!1348380))

(assert (= (and b!1348380 c!126432) b!1348384))

(assert (= (and b!1348380 (not c!126432)) b!1348383))

(assert (= (and b!1348384 res!894653) b!1348385))

(assert (= (or b!1348384 b!1348383) bm!65102))

(declare-fun b_lambda!24639 () Bool)

(assert (=> (not b_lambda!24639) (not b!1348365)))

(assert (=> b!1348365 t!46095))

(declare-fun b_and!50913 () Bool)

(assert (= b_and!50911 (and (=> t!46095 result!25971) b_and!50913)))

(declare-fun m!1235443 () Bool)

(assert (=> b!1348375 m!1235443))

(declare-fun m!1235445 () Bool)

(assert (=> bm!65102 m!1235445))

(declare-fun m!1235447 () Bool)

(assert (=> b!1348368 m!1235447))

(assert (=> d!144489 m!1235257))

(assert (=> bm!65103 m!1235263))

(declare-fun m!1235449 () Bool)

(assert (=> b!1348373 m!1235449))

(declare-fun m!1235451 () Bool)

(assert (=> b!1348373 m!1235451))

(declare-fun m!1235453 () Bool)

(assert (=> b!1348373 m!1235453))

(declare-fun m!1235455 () Bool)

(assert (=> b!1348373 m!1235455))

(declare-fun m!1235457 () Bool)

(assert (=> b!1348373 m!1235457))

(declare-fun m!1235459 () Bool)

(assert (=> b!1348373 m!1235459))

(declare-fun m!1235461 () Bool)

(assert (=> b!1348373 m!1235461))

(declare-fun m!1235463 () Bool)

(assert (=> b!1348373 m!1235463))

(assert (=> b!1348373 m!1235449))

(declare-fun m!1235465 () Bool)

(assert (=> b!1348373 m!1235465))

(declare-fun m!1235467 () Bool)

(assert (=> b!1348373 m!1235467))

(assert (=> b!1348373 m!1235465))

(declare-fun m!1235469 () Bool)

(assert (=> b!1348373 m!1235469))

(assert (=> b!1348373 m!1235459))

(declare-fun m!1235471 () Bool)

(assert (=> b!1348373 m!1235471))

(declare-fun m!1235473 () Bool)

(assert (=> b!1348373 m!1235473))

(declare-fun m!1235475 () Bool)

(assert (=> b!1348373 m!1235475))

(assert (=> b!1348373 m!1235263))

(declare-fun m!1235477 () Bool)

(assert (=> b!1348373 m!1235477))

(declare-fun m!1235479 () Bool)

(assert (=> b!1348373 m!1235479))

(assert (=> b!1348373 m!1235455))

(declare-fun m!1235481 () Bool)

(assert (=> b!1348385 m!1235481))

(assert (=> b!1348365 m!1235477))

(declare-fun m!1235483 () Bool)

(assert (=> b!1348365 m!1235483))

(assert (=> b!1348365 m!1235269))

(assert (=> b!1348365 m!1235477))

(declare-fun m!1235485 () Bool)

(assert (=> b!1348365 m!1235485))

(assert (=> b!1348365 m!1235269))

(declare-fun m!1235487 () Bool)

(assert (=> b!1348365 m!1235487))

(assert (=> b!1348365 m!1235485))

(declare-fun m!1235489 () Bool)

(assert (=> bm!65107 m!1235489))

(declare-fun m!1235491 () Bool)

(assert (=> bm!65105 m!1235491))

(assert (=> b!1348379 m!1235477))

(assert (=> b!1348379 m!1235477))

(declare-fun m!1235493 () Bool)

(assert (=> b!1348379 m!1235493))

(assert (=> b!1348371 m!1235477))

(assert (=> b!1348371 m!1235477))

(declare-fun m!1235495 () Bool)

(assert (=> b!1348371 m!1235495))

(assert (=> b!1348377 m!1235477))

(assert (=> b!1348377 m!1235477))

(assert (=> b!1348377 m!1235493))

(assert (=> b!1348234 d!144489))

(declare-fun d!144491 () Bool)

(declare-fun e!767065 () Bool)

(assert (=> d!144491 e!767065))

(declare-fun res!894655 () Bool)

(assert (=> d!144491 (=> res!894655 e!767065)))

(declare-fun lt!596123 () Bool)

(assert (=> d!144491 (= res!894655 (not lt!596123))))

(declare-fun lt!596124 () Bool)

(assert (=> d!144491 (= lt!596123 lt!596124)))

(declare-fun lt!596126 () Unit!44172)

(declare-fun e!767064 () Unit!44172)

(assert (=> d!144491 (= lt!596126 e!767064)))

(declare-fun c!126435 () Bool)

(assert (=> d!144491 (= c!126435 lt!596124)))

(assert (=> d!144491 (= lt!596124 (containsKey!743 (toList!10998 lt!595976) k0!1142))))

(assert (=> d!144491 (= (contains!9176 lt!595976 k0!1142) lt!596123)))

(declare-fun b!1348386 () Bool)

(declare-fun lt!596125 () Unit!44172)

(assert (=> b!1348386 (= e!767064 lt!596125)))

(assert (=> b!1348386 (= lt!596125 (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!10998 lt!595976) k0!1142))))

(assert (=> b!1348386 (isDefined!528 (getValueByKey!721 (toList!10998 lt!595976) k0!1142))))

(declare-fun b!1348387 () Bool)

(declare-fun Unit!44178 () Unit!44172)

(assert (=> b!1348387 (= e!767064 Unit!44178)))

(declare-fun b!1348388 () Bool)

(assert (=> b!1348388 (= e!767065 (isDefined!528 (getValueByKey!721 (toList!10998 lt!595976) k0!1142)))))

(assert (= (and d!144491 c!126435) b!1348386))

(assert (= (and d!144491 (not c!126435)) b!1348387))

(assert (= (and d!144491 (not res!894655)) b!1348388))

(declare-fun m!1235497 () Bool)

(assert (=> d!144491 m!1235497))

(declare-fun m!1235499 () Bool)

(assert (=> b!1348386 m!1235499))

(declare-fun m!1235501 () Bool)

(assert (=> b!1348386 m!1235501))

(assert (=> b!1348386 m!1235501))

(declare-fun m!1235503 () Bool)

(assert (=> b!1348386 m!1235503))

(assert (=> b!1348388 m!1235501))

(assert (=> b!1348388 m!1235501))

(assert (=> b!1348388 m!1235503))

(assert (=> b!1348234 d!144491))

(declare-fun d!144493 () Bool)

(declare-fun e!767067 () Bool)

(assert (=> d!144493 e!767067))

(declare-fun res!894656 () Bool)

(assert (=> d!144493 (=> res!894656 e!767067)))

(declare-fun lt!596127 () Bool)

(assert (=> d!144493 (= res!894656 (not lt!596127))))

(declare-fun lt!596128 () Bool)

(assert (=> d!144493 (= lt!596127 lt!596128)))

(declare-fun lt!596130 () Unit!44172)

(declare-fun e!767066 () Unit!44172)

(assert (=> d!144493 (= lt!596130 e!767066)))

(declare-fun c!126436 () Bool)

(assert (=> d!144493 (= c!126436 lt!596128)))

(assert (=> d!144493 (= lt!596128 (containsKey!743 (toList!10998 (+!4848 lt!595977 (tuple2!24309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(assert (=> d!144493 (= (contains!9176 (+!4848 lt!595977 (tuple2!24309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142) lt!596127)))

(declare-fun b!1348389 () Bool)

(declare-fun lt!596129 () Unit!44172)

(assert (=> b!1348389 (= e!767066 lt!596129)))

(assert (=> b!1348389 (= lt!596129 (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!10998 (+!4848 lt!595977 (tuple2!24309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(assert (=> b!1348389 (isDefined!528 (getValueByKey!721 (toList!10998 (+!4848 lt!595977 (tuple2!24309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(declare-fun b!1348390 () Bool)

(declare-fun Unit!44179 () Unit!44172)

(assert (=> b!1348390 (= e!767066 Unit!44179)))

(declare-fun b!1348391 () Bool)

(assert (=> b!1348391 (= e!767067 (isDefined!528 (getValueByKey!721 (toList!10998 (+!4848 lt!595977 (tuple2!24309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142)))))

(assert (= (and d!144493 c!126436) b!1348389))

(assert (= (and d!144493 (not c!126436)) b!1348390))

(assert (= (and d!144493 (not res!894656)) b!1348391))

(declare-fun m!1235505 () Bool)

(assert (=> d!144493 m!1235505))

(declare-fun m!1235507 () Bool)

(assert (=> b!1348389 m!1235507))

(declare-fun m!1235509 () Bool)

(assert (=> b!1348389 m!1235509))

(assert (=> b!1348389 m!1235509))

(declare-fun m!1235511 () Bool)

(assert (=> b!1348389 m!1235511))

(assert (=> b!1348391 m!1235509))

(assert (=> b!1348391 m!1235509))

(assert (=> b!1348391 m!1235511))

(assert (=> b!1348234 d!144493))

(declare-fun d!144495 () Bool)

(declare-fun e!767068 () Bool)

(assert (=> d!144495 e!767068))

(declare-fun res!894657 () Bool)

(assert (=> d!144495 (=> (not res!894657) (not e!767068))))

(declare-fun lt!596134 () ListLongMap!21965)

(assert (=> d!144495 (= res!894657 (contains!9176 lt!596134 (_1!12165 (tuple2!24309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun lt!596132 () List!31460)

(assert (=> d!144495 (= lt!596134 (ListLongMap!21966 lt!596132))))

(declare-fun lt!596133 () Unit!44172)

(declare-fun lt!596131 () Unit!44172)

(assert (=> d!144495 (= lt!596133 lt!596131)))

(assert (=> d!144495 (= (getValueByKey!721 lt!596132 (_1!12165 (tuple2!24309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) (Some!772 (_2!12165 (tuple2!24309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> d!144495 (= lt!596131 (lemmaContainsTupThenGetReturnValue!366 lt!596132 (_1!12165 (tuple2!24309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12165 (tuple2!24309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> d!144495 (= lt!596132 (insertStrictlySorted!495 (toList!10998 lt!595977) (_1!12165 (tuple2!24309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12165 (tuple2!24309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> d!144495 (= (+!4848 lt!595977 (tuple2!24309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) lt!596134)))

(declare-fun b!1348392 () Bool)

(declare-fun res!894658 () Bool)

(assert (=> b!1348392 (=> (not res!894658) (not e!767068))))

(assert (=> b!1348392 (= res!894658 (= (getValueByKey!721 (toList!10998 lt!596134) (_1!12165 (tuple2!24309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) (Some!772 (_2!12165 (tuple2!24309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(declare-fun b!1348393 () Bool)

(assert (=> b!1348393 (= e!767068 (contains!9177 (toList!10998 lt!596134) (tuple2!24309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))

(assert (= (and d!144495 res!894657) b!1348392))

(assert (= (and b!1348392 res!894658) b!1348393))

(declare-fun m!1235513 () Bool)

(assert (=> d!144495 m!1235513))

(declare-fun m!1235515 () Bool)

(assert (=> d!144495 m!1235515))

(declare-fun m!1235517 () Bool)

(assert (=> d!144495 m!1235517))

(declare-fun m!1235519 () Bool)

(assert (=> d!144495 m!1235519))

(declare-fun m!1235521 () Bool)

(assert (=> b!1348392 m!1235521))

(declare-fun m!1235523 () Bool)

(assert (=> b!1348393 m!1235523))

(assert (=> b!1348234 d!144495))

(declare-fun d!144497 () Bool)

(declare-fun e!767070 () Bool)

(assert (=> d!144497 e!767070))

(declare-fun res!894659 () Bool)

(assert (=> d!144497 (=> res!894659 e!767070)))

(declare-fun lt!596135 () Bool)

(assert (=> d!144497 (= res!894659 (not lt!596135))))

(declare-fun lt!596136 () Bool)

(assert (=> d!144497 (= lt!596135 lt!596136)))

(declare-fun lt!596138 () Unit!44172)

(declare-fun e!767069 () Unit!44172)

(assert (=> d!144497 (= lt!596138 e!767069)))

(declare-fun c!126437 () Bool)

(assert (=> d!144497 (= c!126437 lt!596136)))

(assert (=> d!144497 (= lt!596136 (containsKey!743 (toList!10998 lt!595977) k0!1142))))

(assert (=> d!144497 (= (contains!9176 lt!595977 k0!1142) lt!596135)))

(declare-fun b!1348394 () Bool)

(declare-fun lt!596137 () Unit!44172)

(assert (=> b!1348394 (= e!767069 lt!596137)))

(assert (=> b!1348394 (= lt!596137 (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!10998 lt!595977) k0!1142))))

(assert (=> b!1348394 (isDefined!528 (getValueByKey!721 (toList!10998 lt!595977) k0!1142))))

(declare-fun b!1348395 () Bool)

(declare-fun Unit!44180 () Unit!44172)

(assert (=> b!1348395 (= e!767069 Unit!44180)))

(declare-fun b!1348396 () Bool)

(assert (=> b!1348396 (= e!767070 (isDefined!528 (getValueByKey!721 (toList!10998 lt!595977) k0!1142)))))

(assert (= (and d!144497 c!126437) b!1348394))

(assert (= (and d!144497 (not c!126437)) b!1348395))

(assert (= (and d!144497 (not res!894659)) b!1348396))

(declare-fun m!1235525 () Bool)

(assert (=> d!144497 m!1235525))

(declare-fun m!1235527 () Bool)

(assert (=> b!1348394 m!1235527))

(declare-fun m!1235529 () Bool)

(assert (=> b!1348394 m!1235529))

(assert (=> b!1348394 m!1235529))

(declare-fun m!1235531 () Bool)

(assert (=> b!1348394 m!1235531))

(assert (=> b!1348396 m!1235529))

(assert (=> b!1348396 m!1235529))

(assert (=> b!1348396 m!1235531))

(assert (=> b!1348234 d!144497))

(declare-fun b!1348421 () Bool)

(assert (=> b!1348421 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44976 _keys!1571)))))

(assert (=> b!1348421 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44977 _values!1303)))))

(declare-fun e!767090 () Bool)

(declare-fun lt!596153 () ListLongMap!21965)

(assert (=> b!1348421 (= e!767090 (= (apply!1038 lt!596153 (select (arr!44426 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22442 (select (arr!44427 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3787 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348422 () Bool)

(declare-fun e!767087 () ListLongMap!21965)

(assert (=> b!1348422 (= e!767087 (ListLongMap!21966 Nil!31457))))

(declare-fun b!1348423 () Bool)

(declare-fun e!767089 () Bool)

(assert (=> b!1348423 (= e!767089 e!767090)))

(assert (=> b!1348423 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44976 _keys!1571)))))

(declare-fun res!894670 () Bool)

(assert (=> b!1348423 (= res!894670 (contains!9176 lt!596153 (select (arr!44426 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1348423 (=> (not res!894670) (not e!767090))))

(declare-fun b!1348424 () Bool)

(declare-fun lt!596154 () Unit!44172)

(declare-fun lt!596156 () Unit!44172)

(assert (=> b!1348424 (= lt!596154 lt!596156)))

(declare-fun lt!596155 () (_ BitVec 64))

(declare-fun lt!596159 () (_ BitVec 64))

(declare-fun lt!596157 () V!55179)

(declare-fun lt!596158 () ListLongMap!21965)

(assert (=> b!1348424 (not (contains!9176 (+!4848 lt!596158 (tuple2!24309 lt!596155 lt!596157)) lt!596159))))

(declare-fun addStillNotContains!502 (ListLongMap!21965 (_ BitVec 64) V!55179 (_ BitVec 64)) Unit!44172)

(assert (=> b!1348424 (= lt!596156 (addStillNotContains!502 lt!596158 lt!596155 lt!596157 lt!596159))))

(assert (=> b!1348424 (= lt!596159 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1348424 (= lt!596157 (get!22442 (select (arr!44427 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3787 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1348424 (= lt!596155 (select (arr!44426 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun call!65114 () ListLongMap!21965)

(assert (=> b!1348424 (= lt!596158 call!65114)))

(declare-fun e!767091 () ListLongMap!21965)

(assert (=> b!1348424 (= e!767091 (+!4848 call!65114 (tuple2!24309 (select (arr!44426 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22442 (select (arr!44427 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3787 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1348425 () Bool)

(declare-fun e!767085 () Bool)

(assert (=> b!1348425 (= e!767085 e!767089)))

(declare-fun c!126447 () Bool)

(declare-fun e!767086 () Bool)

(assert (=> b!1348425 (= c!126447 e!767086)))

(declare-fun res!894671 () Bool)

(assert (=> b!1348425 (=> (not res!894671) (not e!767086))))

(assert (=> b!1348425 (= res!894671 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44976 _keys!1571)))))

(declare-fun b!1348426 () Bool)

(assert (=> b!1348426 (= e!767091 call!65114)))

(declare-fun b!1348427 () Bool)

(assert (=> b!1348427 (= e!767087 e!767091)))

(declare-fun c!126449 () Bool)

(assert (=> b!1348427 (= c!126449 (validKeyInArray!0 (select (arr!44426 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1348428 () Bool)

(declare-fun e!767088 () Bool)

(assert (=> b!1348428 (= e!767088 (= lt!596153 (getCurrentListMapNoExtraKeys!6494 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun b!1348429 () Bool)

(declare-fun isEmpty!1094 (ListLongMap!21965) Bool)

(assert (=> b!1348429 (= e!767088 (isEmpty!1094 lt!596153))))

(declare-fun b!1348430 () Bool)

(assert (=> b!1348430 (= e!767089 e!767088)))

(declare-fun c!126448 () Bool)

(assert (=> b!1348430 (= c!126448 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44976 _keys!1571)))))

(declare-fun d!144499 () Bool)

(assert (=> d!144499 e!767085))

(declare-fun res!894669 () Bool)

(assert (=> d!144499 (=> (not res!894669) (not e!767085))))

(assert (=> d!144499 (= res!894669 (not (contains!9176 lt!596153 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!144499 (= lt!596153 e!767087)))

(declare-fun c!126446 () Bool)

(assert (=> d!144499 (= c!126446 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!44976 _keys!1571)))))

(assert (=> d!144499 (validMask!0 mask!1977)))

(assert (=> d!144499 (= (getCurrentListMapNoExtraKeys!6494 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!596153)))

(declare-fun b!1348431 () Bool)

(assert (=> b!1348431 (= e!767086 (validKeyInArray!0 (select (arr!44426 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1348431 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))

(declare-fun bm!65111 () Bool)

(assert (=> bm!65111 (= call!65114 (getCurrentListMapNoExtraKeys!6494 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1348432 () Bool)

(declare-fun res!894668 () Bool)

(assert (=> b!1348432 (=> (not res!894668) (not e!767085))))

(assert (=> b!1348432 (= res!894668 (not (contains!9176 lt!596153 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144499 c!126446) b!1348422))

(assert (= (and d!144499 (not c!126446)) b!1348427))

(assert (= (and b!1348427 c!126449) b!1348424))

(assert (= (and b!1348427 (not c!126449)) b!1348426))

(assert (= (or b!1348424 b!1348426) bm!65111))

(assert (= (and d!144499 res!894669) b!1348432))

(assert (= (and b!1348432 res!894668) b!1348425))

(assert (= (and b!1348425 res!894671) b!1348431))

(assert (= (and b!1348425 c!126447) b!1348423))

(assert (= (and b!1348425 (not c!126447)) b!1348430))

(assert (= (and b!1348423 res!894670) b!1348421))

(assert (= (and b!1348430 c!126448) b!1348428))

(assert (= (and b!1348430 (not c!126448)) b!1348429))

(declare-fun b_lambda!24641 () Bool)

(assert (=> (not b_lambda!24641) (not b!1348421)))

(assert (=> b!1348421 t!46095))

(declare-fun b_and!50915 () Bool)

(assert (= b_and!50913 (and (=> t!46095 result!25971) b_and!50915)))

(declare-fun b_lambda!24643 () Bool)

(assert (=> (not b_lambda!24643) (not b!1348424)))

(assert (=> b!1348424 t!46095))

(declare-fun b_and!50917 () Bool)

(assert (= b_and!50915 (and (=> t!46095 result!25971) b_and!50917)))

(declare-fun m!1235533 () Bool)

(assert (=> b!1348432 m!1235533))

(assert (=> b!1348431 m!1235477))

(assert (=> b!1348431 m!1235477))

(assert (=> b!1348431 m!1235493))

(assert (=> b!1348421 m!1235485))

(assert (=> b!1348421 m!1235269))

(assert (=> b!1348421 m!1235487))

(assert (=> b!1348421 m!1235269))

(assert (=> b!1348421 m!1235477))

(declare-fun m!1235535 () Bool)

(assert (=> b!1348421 m!1235535))

(assert (=> b!1348421 m!1235477))

(assert (=> b!1348421 m!1235485))

(declare-fun m!1235537 () Bool)

(assert (=> d!144499 m!1235537))

(assert (=> d!144499 m!1235257))

(assert (=> b!1348423 m!1235477))

(assert (=> b!1348423 m!1235477))

(declare-fun m!1235539 () Bool)

(assert (=> b!1348423 m!1235539))

(assert (=> b!1348424 m!1235485))

(assert (=> b!1348424 m!1235269))

(assert (=> b!1348424 m!1235487))

(declare-fun m!1235541 () Bool)

(assert (=> b!1348424 m!1235541))

(assert (=> b!1348424 m!1235269))

(assert (=> b!1348424 m!1235477))

(declare-fun m!1235543 () Bool)

(assert (=> b!1348424 m!1235543))

(declare-fun m!1235545 () Bool)

(assert (=> b!1348424 m!1235545))

(declare-fun m!1235547 () Bool)

(assert (=> b!1348424 m!1235547))

(assert (=> b!1348424 m!1235485))

(assert (=> b!1348424 m!1235543))

(declare-fun m!1235549 () Bool)

(assert (=> b!1348429 m!1235549))

(declare-fun m!1235551 () Bool)

(assert (=> b!1348428 m!1235551))

(assert (=> bm!65111 m!1235551))

(assert (=> b!1348427 m!1235477))

(assert (=> b!1348427 m!1235477))

(assert (=> b!1348427 m!1235493))

(assert (=> b!1348234 d!144499))

(declare-fun b!1348441 () Bool)

(declare-fun e!767099 () Bool)

(declare-fun e!767098 () Bool)

(assert (=> b!1348441 (= e!767099 e!767098)))

(declare-fun c!126452 () Bool)

(assert (=> b!1348441 (= c!126452 (validKeyInArray!0 (select (arr!44426 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun d!144501 () Bool)

(declare-fun res!894676 () Bool)

(assert (=> d!144501 (=> res!894676 e!767099)))

(assert (=> d!144501 (= res!894676 (bvsge #b00000000000000000000000000000000 (size!44976 _keys!1571)))))

(assert (=> d!144501 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!767099)))

(declare-fun b!1348442 () Bool)

(declare-fun e!767100 () Bool)

(assert (=> b!1348442 (= e!767098 e!767100)))

(declare-fun lt!596168 () (_ BitVec 64))

(assert (=> b!1348442 (= lt!596168 (select (arr!44426 _keys!1571) #b00000000000000000000000000000000))))

(declare-fun lt!596166 () Unit!44172)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!91942 (_ BitVec 64) (_ BitVec 32)) Unit!44172)

(assert (=> b!1348442 (= lt!596166 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!596168 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!91942 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1348442 (arrayContainsKey!0 _keys!1571 lt!596168 #b00000000000000000000000000000000)))

(declare-fun lt!596167 () Unit!44172)

(assert (=> b!1348442 (= lt!596167 lt!596166)))

(declare-fun res!894677 () Bool)

(declare-datatypes ((SeekEntryResult!10057 0))(
  ( (MissingZero!10057 (index!42599 (_ BitVec 32))) (Found!10057 (index!42600 (_ BitVec 32))) (Intermediate!10057 (undefined!10869 Bool) (index!42601 (_ BitVec 32)) (x!120674 (_ BitVec 32))) (Undefined!10057) (MissingVacant!10057 (index!42602 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!91942 (_ BitVec 32)) SeekEntryResult!10057)

(assert (=> b!1348442 (= res!894677 (= (seekEntryOrOpen!0 (select (arr!44426 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10057 #b00000000000000000000000000000000)))))

(assert (=> b!1348442 (=> (not res!894677) (not e!767100))))

(declare-fun b!1348443 () Bool)

(declare-fun call!65117 () Bool)

(assert (=> b!1348443 (= e!767098 call!65117)))

(declare-fun b!1348444 () Bool)

(assert (=> b!1348444 (= e!767100 call!65117)))

(declare-fun bm!65114 () Bool)

(assert (=> bm!65114 (= call!65117 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(assert (= (and d!144501 (not res!894676)) b!1348441))

(assert (= (and b!1348441 c!126452) b!1348442))

(assert (= (and b!1348441 (not c!126452)) b!1348443))

(assert (= (and b!1348442 res!894677) b!1348444))

(assert (= (or b!1348444 b!1348443) bm!65114))

(declare-fun m!1235553 () Bool)

(assert (=> b!1348441 m!1235553))

(assert (=> b!1348441 m!1235553))

(declare-fun m!1235555 () Bool)

(assert (=> b!1348441 m!1235555))

(assert (=> b!1348442 m!1235553))

(declare-fun m!1235557 () Bool)

(assert (=> b!1348442 m!1235557))

(declare-fun m!1235559 () Bool)

(assert (=> b!1348442 m!1235559))

(assert (=> b!1348442 m!1235553))

(declare-fun m!1235561 () Bool)

(assert (=> b!1348442 m!1235561))

(declare-fun m!1235563 () Bool)

(assert (=> bm!65114 m!1235563))

(assert (=> b!1348226 d!144501))

(declare-fun b!1348455 () Bool)

(declare-fun e!767111 () Bool)

(declare-fun e!767110 () Bool)

(assert (=> b!1348455 (= e!767111 e!767110)))

(declare-fun res!894686 () Bool)

(assert (=> b!1348455 (=> (not res!894686) (not e!767110))))

(declare-fun e!767109 () Bool)

(assert (=> b!1348455 (= res!894686 (not e!767109))))

(declare-fun res!894684 () Bool)

(assert (=> b!1348455 (=> (not res!894684) (not e!767109))))

(assert (=> b!1348455 (= res!894684 (validKeyInArray!0 (select (arr!44426 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun bm!65117 () Bool)

(declare-fun call!65120 () Bool)

(declare-fun c!126455 () Bool)

(assert (=> bm!65117 (= call!65120 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126455 (Cons!31457 (select (arr!44426 _keys!1571) #b00000000000000000000000000000000) Nil!31458) Nil!31458)))))

(declare-fun d!144503 () Bool)

(declare-fun res!894685 () Bool)

(assert (=> d!144503 (=> res!894685 e!767111)))

(assert (=> d!144503 (= res!894685 (bvsge #b00000000000000000000000000000000 (size!44976 _keys!1571)))))

(assert (=> d!144503 (= (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31458) e!767111)))

(declare-fun b!1348456 () Bool)

(declare-fun e!767112 () Bool)

(assert (=> b!1348456 (= e!767110 e!767112)))

(assert (=> b!1348456 (= c!126455 (validKeyInArray!0 (select (arr!44426 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1348457 () Bool)

(assert (=> b!1348457 (= e!767112 call!65120)))

(declare-fun b!1348458 () Bool)

(assert (=> b!1348458 (= e!767112 call!65120)))

(declare-fun b!1348459 () Bool)

(declare-fun contains!9178 (List!31461 (_ BitVec 64)) Bool)

(assert (=> b!1348459 (= e!767109 (contains!9178 Nil!31458 (select (arr!44426 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144503 (not res!894685)) b!1348455))

(assert (= (and b!1348455 res!894684) b!1348459))

(assert (= (and b!1348455 res!894686) b!1348456))

(assert (= (and b!1348456 c!126455) b!1348458))

(assert (= (and b!1348456 (not c!126455)) b!1348457))

(assert (= (or b!1348458 b!1348457) bm!65117))

(assert (=> b!1348455 m!1235553))

(assert (=> b!1348455 m!1235553))

(assert (=> b!1348455 m!1235555))

(assert (=> bm!65117 m!1235553))

(declare-fun m!1235565 () Bool)

(assert (=> bm!65117 m!1235565))

(assert (=> b!1348456 m!1235553))

(assert (=> b!1348456 m!1235553))

(assert (=> b!1348456 m!1235555))

(assert (=> b!1348459 m!1235553))

(assert (=> b!1348459 m!1235553))

(declare-fun m!1235567 () Bool)

(assert (=> b!1348459 m!1235567))

(assert (=> b!1348233 d!144503))

(declare-fun condMapEmpty!58052 () Bool)

(declare-fun mapDefault!58052 () ValueCell!17880)

(assert (=> mapNonEmpty!58046 (= condMapEmpty!58052 (= mapRest!58046 ((as const (Array (_ BitVec 32) ValueCell!17880)) mapDefault!58052)))))

(declare-fun e!767117 () Bool)

(declare-fun mapRes!58052 () Bool)

(assert (=> mapNonEmpty!58046 (= tp!110480 (and e!767117 mapRes!58052))))

(declare-fun mapNonEmpty!58052 () Bool)

(declare-fun tp!110489 () Bool)

(declare-fun e!767118 () Bool)

(assert (=> mapNonEmpty!58052 (= mapRes!58052 (and tp!110489 e!767118))))

(declare-fun mapRest!58052 () (Array (_ BitVec 32) ValueCell!17880))

(declare-fun mapKey!58052 () (_ BitVec 32))

(declare-fun mapValue!58052 () ValueCell!17880)

(assert (=> mapNonEmpty!58052 (= mapRest!58046 (store mapRest!58052 mapKey!58052 mapValue!58052))))

(declare-fun b!1348467 () Bool)

(assert (=> b!1348467 (= e!767117 tp_is_empty!37557)))

(declare-fun b!1348466 () Bool)

(assert (=> b!1348466 (= e!767118 tp_is_empty!37557)))

(declare-fun mapIsEmpty!58052 () Bool)

(assert (=> mapIsEmpty!58052 mapRes!58052))

(assert (= (and mapNonEmpty!58046 condMapEmpty!58052) mapIsEmpty!58052))

(assert (= (and mapNonEmpty!58046 (not condMapEmpty!58052)) mapNonEmpty!58052))

(assert (= (and mapNonEmpty!58052 ((_ is ValueCellFull!17880) mapValue!58052)) b!1348466))

(assert (= (and mapNonEmpty!58046 ((_ is ValueCellFull!17880) mapDefault!58052)) b!1348467))

(declare-fun m!1235569 () Bool)

(assert (=> mapNonEmpty!58052 m!1235569))

(declare-fun b_lambda!24645 () Bool)

(assert (= b_lambda!24637 (or (and start!113564 b_free!31557) b_lambda!24645)))

(declare-fun b_lambda!24647 () Bool)

(assert (= b_lambda!24639 (or (and start!113564 b_free!31557) b_lambda!24647)))

(declare-fun b_lambda!24649 () Bool)

(assert (= b_lambda!24643 (or (and start!113564 b_free!31557) b_lambda!24649)))

(declare-fun b_lambda!24651 () Bool)

(assert (= b_lambda!24641 (or (and start!113564 b_free!31557) b_lambda!24651)))

(check-sat (not b!1348285) (not b_lambda!24635) (not b!1348394) (not b!1348331) b_and!50917 (not b!1348368) (not b!1348391) (not bm!65102) (not b!1348392) (not b!1348441) (not b!1348377) (not b!1348373) (not b!1348338) (not b!1348355) (not b_lambda!24645) (not b!1348340) (not b!1348442) (not b!1348342) (not d!144495) (not mapNonEmpty!58052) (not bm!65111) (not b!1348427) (not b!1348428) (not b_lambda!24649) (not b_lambda!24647) (not b!1348459) (not b!1348365) (not b!1348455) (not d!144489) (not d!144475) (not b!1348429) (not b!1348334) (not b!1348336) (not b!1348348) (not b!1348375) (not b!1348393) (not b!1348388) (not bm!65098) (not bm!65107) (not b!1348396) (not d!144477) (not b!1348354) (not d!144493) (not b!1348432) (not bm!65100) (not b!1348456) (not b!1348421) (not bm!65096) (not bm!65103) (not d!144491) (not b!1348389) (not b!1348385) (not b!1348386) (not b_next!31557) (not b!1348423) tp_is_empty!37557 (not b!1348328) (not b!1348357) (not bm!65117) (not b!1348431) (not d!144487) (not b!1348353) (not b!1348283) (not b!1348424) (not bm!65105) (not d!144485) (not b!1348379) (not bm!65095) (not d!144483) (not b!1348371) (not d!144499) (not b!1348363) (not d!144473) (not d!144481) (not bm!65114) (not d!144497) (not b_lambda!24651) (not b!1348362))
(check-sat b_and!50917 (not b_next!31557))
