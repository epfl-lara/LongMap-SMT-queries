; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113830 () Bool)

(assert start!113830)

(declare-fun b_free!31573 () Bool)

(declare-fun b_next!31573 () Bool)

(assert (=> start!113830 (= b_free!31573 (not b_next!31573))))

(declare-fun tp!110531 () Bool)

(declare-fun b_and!50933 () Bool)

(assert (=> start!113830 (= tp!110531 b_and!50933)))

(declare-fun b!1349962 () Bool)

(declare-fun e!768063 () Bool)

(declare-fun tp_is_empty!37573 () Bool)

(assert (=> b!1349962 (= e!768063 tp_is_empty!37573)))

(declare-fun b!1349963 () Bool)

(declare-fun res!895342 () Bool)

(declare-fun e!768065 () Bool)

(assert (=> b!1349963 (=> (not res!895342) (not e!768065))))

(declare-datatypes ((array!92089 0))(
  ( (array!92090 (arr!44494 (Array (_ BitVec 32) (_ BitVec 64))) (size!45045 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!92089)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1349963 (= res!895342 (validKeyInArray!0 (select (arr!44494 _keys!1571) from!1960)))))

(declare-fun mapNonEmpty!58073 () Bool)

(declare-fun mapRes!58073 () Bool)

(declare-fun tp!110530 () Bool)

(assert (=> mapNonEmpty!58073 (= mapRes!58073 (and tp!110530 e!768063))))

(declare-fun mapKey!58073 () (_ BitVec 32))

(declare-datatypes ((V!55201 0))(
  ( (V!55202 (val!18861 Int)) )
))
(declare-datatypes ((ValueCell!17888 0))(
  ( (ValueCellFull!17888 (v!21508 V!55201)) (EmptyCell!17888) )
))
(declare-fun mapValue!58073 () ValueCell!17888)

(declare-fun mapRest!58073 () (Array (_ BitVec 32) ValueCell!17888))

(declare-datatypes ((array!92091 0))(
  ( (array!92092 (arr!44495 (Array (_ BitVec 32) ValueCell!17888)) (size!45046 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!92091)

(assert (=> mapNonEmpty!58073 (= (arr!44495 _values!1303) (store mapRest!58073 mapKey!58073 mapValue!58073))))

(declare-fun b!1349964 () Bool)

(declare-fun res!895346 () Bool)

(assert (=> b!1349964 (=> (not res!895346) (not e!768065))))

(declare-fun minValue!1245 () V!55201)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!55201)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24374 0))(
  ( (tuple2!24375 (_1!12198 (_ BitVec 64)) (_2!12198 V!55201)) )
))
(declare-datatypes ((List!31511 0))(
  ( (Nil!31508) (Cons!31507 (h!32725 tuple2!24374) (t!46143 List!31511)) )
))
(declare-datatypes ((ListLongMap!22039 0))(
  ( (ListLongMap!22040 (toList!11035 List!31511)) )
))
(declare-fun contains!9226 (ListLongMap!22039 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5973 (array!92089 array!92091 (_ BitVec 32) (_ BitVec 32) V!55201 V!55201 (_ BitVec 32) Int) ListLongMap!22039)

(assert (=> b!1349964 (= res!895346 (contains!9226 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1349965 () Bool)

(declare-fun res!895343 () Bool)

(assert (=> b!1349965 (=> (not res!895343) (not e!768065))))

(declare-datatypes ((List!31512 0))(
  ( (Nil!31509) (Cons!31508 (h!32726 (_ BitVec 64)) (t!46144 List!31512)) )
))
(declare-fun arrayNoDuplicates!0 (array!92089 (_ BitVec 32) List!31512) Bool)

(assert (=> b!1349965 (= res!895343 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31509))))

(declare-fun b!1349966 () Bool)

(declare-fun res!895348 () Bool)

(assert (=> b!1349966 (=> (not res!895348) (not e!768065))))

(assert (=> b!1349966 (= res!895348 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45045 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1349967 () Bool)

(declare-fun e!768064 () Bool)

(declare-fun e!768062 () Bool)

(assert (=> b!1349967 (= e!768064 (and e!768062 mapRes!58073))))

(declare-fun condMapEmpty!58073 () Bool)

(declare-fun mapDefault!58073 () ValueCell!17888)

(assert (=> b!1349967 (= condMapEmpty!58073 (= (arr!44495 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17888)) mapDefault!58073)))))

(declare-fun b!1349968 () Bool)

(assert (=> b!1349968 (= e!768062 tp_is_empty!37573)))

(declare-fun res!895340 () Bool)

(assert (=> start!113830 (=> (not res!895340) (not e!768065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113830 (= res!895340 (validMask!0 mask!1977))))

(assert (=> start!113830 e!768065))

(assert (=> start!113830 tp_is_empty!37573))

(assert (=> start!113830 true))

(declare-fun array_inv!33777 (array!92089) Bool)

(assert (=> start!113830 (array_inv!33777 _keys!1571)))

(declare-fun array_inv!33778 (array!92091) Bool)

(assert (=> start!113830 (and (array_inv!33778 _values!1303) e!768064)))

(assert (=> start!113830 tp!110531))

(declare-fun b!1349969 () Bool)

(declare-fun res!895341 () Bool)

(assert (=> b!1349969 (=> (not res!895341) (not e!768065))))

(assert (=> b!1349969 (= res!895341 (not (= (select (arr!44494 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1349970 () Bool)

(declare-fun +!4889 (ListLongMap!22039 tuple2!24374) ListLongMap!22039)

(declare-fun getCurrentListMapNoExtraKeys!6542 (array!92089 array!92091 (_ BitVec 32) (_ BitVec 32) V!55201 V!55201 (_ BitVec 32) Int) ListLongMap!22039)

(declare-fun get!22494 (ValueCell!17888 V!55201) V!55201)

(declare-fun dynLambda!3843 (Int (_ BitVec 64)) V!55201)

(assert (=> b!1349970 (= e!768065 (not (contains!9226 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1142)))))

(declare-fun b!1349971 () Bool)

(declare-fun res!895345 () Bool)

(assert (=> b!1349971 (=> (not res!895345) (not e!768065))))

(assert (=> b!1349971 (= res!895345 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1349972 () Bool)

(declare-fun res!895344 () Bool)

(assert (=> b!1349972 (=> (not res!895344) (not e!768065))))

(assert (=> b!1349972 (= res!895344 (and (= (size!45046 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!45045 _keys!1571) (size!45046 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1349973 () Bool)

(declare-fun res!895347 () Bool)

(assert (=> b!1349973 (=> (not res!895347) (not e!768065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!92089 (_ BitVec 32)) Bool)

(assert (=> b!1349973 (= res!895347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!58073 () Bool)

(assert (=> mapIsEmpty!58073 mapRes!58073))

(assert (= (and start!113830 res!895340) b!1349972))

(assert (= (and b!1349972 res!895344) b!1349973))

(assert (= (and b!1349973 res!895347) b!1349965))

(assert (= (and b!1349965 res!895343) b!1349966))

(assert (= (and b!1349966 res!895348) b!1349964))

(assert (= (and b!1349964 res!895346) b!1349969))

(assert (= (and b!1349969 res!895341) b!1349963))

(assert (= (and b!1349963 res!895342) b!1349971))

(assert (= (and b!1349971 res!895345) b!1349970))

(assert (= (and b!1349967 condMapEmpty!58073) mapIsEmpty!58073))

(assert (= (and b!1349967 (not condMapEmpty!58073)) mapNonEmpty!58073))

(get-info :version)

(assert (= (and mapNonEmpty!58073 ((_ is ValueCellFull!17888) mapValue!58073)) b!1349962))

(assert (= (and b!1349967 ((_ is ValueCellFull!17888) mapDefault!58073)) b!1349968))

(assert (= start!113830 b!1349967))

(declare-fun b_lambda!24647 () Bool)

(assert (=> (not b_lambda!24647) (not b!1349970)))

(declare-fun t!46142 () Bool)

(declare-fun tb!12435 () Bool)

(assert (=> (and start!113830 (= defaultEntry!1306 defaultEntry!1306) t!46142) tb!12435))

(declare-fun result!25973 () Bool)

(assert (=> tb!12435 (= result!25973 tp_is_empty!37573)))

(assert (=> b!1349970 t!46142))

(declare-fun b_and!50935 () Bool)

(assert (= b_and!50933 (and (=> t!46142 result!25973) b_and!50935)))

(declare-fun m!1237277 () Bool)

(assert (=> b!1349963 m!1237277))

(assert (=> b!1349963 m!1237277))

(declare-fun m!1237279 () Bool)

(assert (=> b!1349963 m!1237279))

(declare-fun m!1237281 () Bool)

(assert (=> mapNonEmpty!58073 m!1237281))

(declare-fun m!1237283 () Bool)

(assert (=> b!1349964 m!1237283))

(assert (=> b!1349964 m!1237283))

(declare-fun m!1237285 () Bool)

(assert (=> b!1349964 m!1237285))

(declare-fun m!1237287 () Bool)

(assert (=> b!1349973 m!1237287))

(declare-fun m!1237289 () Bool)

(assert (=> start!113830 m!1237289))

(declare-fun m!1237291 () Bool)

(assert (=> start!113830 m!1237291))

(declare-fun m!1237293 () Bool)

(assert (=> start!113830 m!1237293))

(declare-fun m!1237295 () Bool)

(assert (=> b!1349970 m!1237295))

(declare-fun m!1237297 () Bool)

(assert (=> b!1349970 m!1237297))

(declare-fun m!1237299 () Bool)

(assert (=> b!1349970 m!1237299))

(declare-fun m!1237301 () Bool)

(assert (=> b!1349970 m!1237301))

(assert (=> b!1349970 m!1237295))

(declare-fun m!1237303 () Bool)

(assert (=> b!1349970 m!1237303))

(assert (=> b!1349970 m!1237297))

(assert (=> b!1349970 m!1237299))

(assert (=> b!1349970 m!1237303))

(declare-fun m!1237305 () Bool)

(assert (=> b!1349970 m!1237305))

(assert (=> b!1349970 m!1237277))

(assert (=> b!1349969 m!1237277))

(declare-fun m!1237307 () Bool)

(assert (=> b!1349965 m!1237307))

(check-sat (not b_next!31573) (not start!113830) (not b!1349963) (not b_lambda!24647) (not b!1349973) b_and!50935 (not b!1349970) (not b!1349965) (not mapNonEmpty!58073) tp_is_empty!37573 (not b!1349964))
(check-sat b_and!50935 (not b_next!31573))
(get-model)

(declare-fun b_lambda!24653 () Bool)

(assert (= b_lambda!24647 (or (and start!113830 b_free!31573) b_lambda!24653)))

(check-sat (not b_next!31573) (not start!113830) (not b_lambda!24653) (not b!1349963) (not b!1349973) b_and!50935 (not b!1349970) (not b!1349965) (not mapNonEmpty!58073) tp_is_empty!37573 (not b!1349964))
(check-sat b_and!50935 (not b_next!31573))
(get-model)

(declare-fun d!144955 () Bool)

(declare-fun e!768101 () Bool)

(assert (=> d!144955 e!768101))

(declare-fun res!895405 () Bool)

(assert (=> d!144955 (=> res!895405 e!768101)))

(declare-fun lt!596664 () Bool)

(assert (=> d!144955 (= res!895405 (not lt!596664))))

(declare-fun lt!596662 () Bool)

(assert (=> d!144955 (= lt!596664 lt!596662)))

(declare-datatypes ((Unit!44120 0))(
  ( (Unit!44121) )
))
(declare-fun lt!596665 () Unit!44120)

(declare-fun e!768102 () Unit!44120)

(assert (=> d!144955 (= lt!596665 e!768102)))

(declare-fun c!126856 () Bool)

(assert (=> d!144955 (= c!126856 lt!596662)))

(declare-fun containsKey!744 (List!31511 (_ BitVec 64)) Bool)

(assert (=> d!144955 (= lt!596662 (containsKey!744 (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142))))

(assert (=> d!144955 (= (contains!9226 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1142) lt!596664)))

(declare-fun b!1350058 () Bool)

(declare-fun lt!596663 () Unit!44120)

(assert (=> b!1350058 (= e!768102 lt!596663)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!490 (List!31511 (_ BitVec 64)) Unit!44120)

(assert (=> b!1350058 (= lt!596663 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142))))

(declare-datatypes ((Option!769 0))(
  ( (Some!768 (v!21511 V!55201)) (None!767) )
))
(declare-fun isDefined!527 (Option!769) Bool)

(declare-fun getValueByKey!718 (List!31511 (_ BitVec 64)) Option!769)

(assert (=> b!1350058 (isDefined!527 (getValueByKey!718 (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142))))

(declare-fun b!1350059 () Bool)

(declare-fun Unit!44122 () Unit!44120)

(assert (=> b!1350059 (= e!768102 Unit!44122)))

(declare-fun b!1350060 () Bool)

(assert (=> b!1350060 (= e!768101 (isDefined!527 (getValueByKey!718 (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142)))))

(assert (= (and d!144955 c!126856) b!1350058))

(assert (= (and d!144955 (not c!126856)) b!1350059))

(assert (= (and d!144955 (not res!895405)) b!1350060))

(declare-fun m!1237373 () Bool)

(assert (=> d!144955 m!1237373))

(declare-fun m!1237375 () Bool)

(assert (=> b!1350058 m!1237375))

(declare-fun m!1237377 () Bool)

(assert (=> b!1350058 m!1237377))

(assert (=> b!1350058 m!1237377))

(declare-fun m!1237379 () Bool)

(assert (=> b!1350058 m!1237379))

(assert (=> b!1350060 m!1237377))

(assert (=> b!1350060 m!1237377))

(assert (=> b!1350060 m!1237379))

(assert (=> b!1349970 d!144955))

(declare-fun d!144957 () Bool)

(declare-fun e!768105 () Bool)

(assert (=> d!144957 e!768105))

(declare-fun res!895410 () Bool)

(assert (=> d!144957 (=> (not res!895410) (not e!768105))))

(declare-fun lt!596674 () ListLongMap!22039)

(assert (=> d!144957 (= res!895410 (contains!9226 lt!596674 (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!596675 () List!31511)

(assert (=> d!144957 (= lt!596674 (ListLongMap!22040 lt!596675))))

(declare-fun lt!596676 () Unit!44120)

(declare-fun lt!596677 () Unit!44120)

(assert (=> d!144957 (= lt!596676 lt!596677)))

(assert (=> d!144957 (= (getValueByKey!718 lt!596675 (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!768 (_2!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!368 (List!31511 (_ BitVec 64) V!55201) Unit!44120)

(assert (=> d!144957 (= lt!596677 (lemmaContainsTupThenGetReturnValue!368 lt!596675 (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!497 (List!31511 (_ BitVec 64) V!55201) List!31511)

(assert (=> d!144957 (= lt!596675 (insertStrictlySorted!497 (toList!11035 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144957 (= (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!596674)))

(declare-fun b!1350065 () Bool)

(declare-fun res!895411 () Bool)

(assert (=> b!1350065 (=> (not res!895411) (not e!768105))))

(assert (=> b!1350065 (= res!895411 (= (getValueByKey!718 (toList!11035 lt!596674) (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!768 (_2!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1350066 () Bool)

(declare-fun contains!9229 (List!31511 tuple2!24374) Bool)

(assert (=> b!1350066 (= e!768105 (contains!9229 (toList!11035 lt!596674) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144957 res!895410) b!1350065))

(assert (= (and b!1350065 res!895411) b!1350066))

(declare-fun m!1237381 () Bool)

(assert (=> d!144957 m!1237381))

(declare-fun m!1237383 () Bool)

(assert (=> d!144957 m!1237383))

(declare-fun m!1237385 () Bool)

(assert (=> d!144957 m!1237385))

(declare-fun m!1237387 () Bool)

(assert (=> d!144957 m!1237387))

(declare-fun m!1237389 () Bool)

(assert (=> b!1350065 m!1237389))

(declare-fun m!1237391 () Bool)

(assert (=> b!1350066 m!1237391))

(assert (=> b!1349970 d!144957))

(declare-fun b!1350091 () Bool)

(declare-fun e!768123 () ListLongMap!22039)

(assert (=> b!1350091 (= e!768123 (ListLongMap!22040 Nil!31508))))

(declare-fun b!1350092 () Bool)

(declare-fun e!768124 () ListLongMap!22039)

(declare-fun call!65188 () ListLongMap!22039)

(assert (=> b!1350092 (= e!768124 call!65188)))

(declare-fun d!144959 () Bool)

(declare-fun e!768120 () Bool)

(assert (=> d!144959 e!768120))

(declare-fun res!895421 () Bool)

(assert (=> d!144959 (=> (not res!895421) (not e!768120))))

(declare-fun lt!596692 () ListLongMap!22039)

(assert (=> d!144959 (= res!895421 (not (contains!9226 lt!596692 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!144959 (= lt!596692 e!768123)))

(declare-fun c!126865 () Bool)

(assert (=> d!144959 (= c!126865 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!45045 _keys!1571)))))

(assert (=> d!144959 (validMask!0 mask!1977)))

(assert (=> d!144959 (= (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!596692)))

(declare-fun b!1350093 () Bool)

(declare-fun e!768122 () Bool)

(declare-fun e!768125 () Bool)

(assert (=> b!1350093 (= e!768122 e!768125)))

(assert (=> b!1350093 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45045 _keys!1571)))))

(declare-fun res!895420 () Bool)

(assert (=> b!1350093 (= res!895420 (contains!9226 lt!596692 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1350093 (=> (not res!895420) (not e!768125))))

(declare-fun b!1350094 () Bool)

(declare-fun e!768121 () Bool)

(assert (=> b!1350094 (= e!768121 (validKeyInArray!0 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1350094 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))

(declare-fun b!1350095 () Bool)

(declare-fun e!768126 () Bool)

(declare-fun isEmpty!1099 (ListLongMap!22039) Bool)

(assert (=> b!1350095 (= e!768126 (isEmpty!1099 lt!596692))))

(declare-fun b!1350096 () Bool)

(assert (=> b!1350096 (= e!768122 e!768126)))

(declare-fun c!126868 () Bool)

(assert (=> b!1350096 (= c!126868 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45045 _keys!1571)))))

(declare-fun b!1350097 () Bool)

(assert (=> b!1350097 (= e!768120 e!768122)))

(declare-fun c!126867 () Bool)

(assert (=> b!1350097 (= c!126867 e!768121)))

(declare-fun res!895422 () Bool)

(assert (=> b!1350097 (=> (not res!895422) (not e!768121))))

(assert (=> b!1350097 (= res!895422 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45045 _keys!1571)))))

(declare-fun b!1350098 () Bool)

(assert (=> b!1350098 (= e!768126 (= lt!596692 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun bm!65185 () Bool)

(assert (=> bm!65185 (= call!65188 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1350099 () Bool)

(assert (=> b!1350099 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45045 _keys!1571)))))

(assert (=> b!1350099 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45046 _values!1303)))))

(declare-fun apply!1048 (ListLongMap!22039 (_ BitVec 64)) V!55201)

(assert (=> b!1350099 (= e!768125 (= (apply!1048 lt!596692 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22494 (select (arr!44495 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1350100 () Bool)

(declare-fun lt!596697 () Unit!44120)

(declare-fun lt!596696 () Unit!44120)

(assert (=> b!1350100 (= lt!596697 lt!596696)))

(declare-fun lt!596695 () (_ BitVec 64))

(declare-fun lt!596693 () (_ BitVec 64))

(declare-fun lt!596694 () V!55201)

(declare-fun lt!596698 () ListLongMap!22039)

(assert (=> b!1350100 (not (contains!9226 (+!4889 lt!596698 (tuple2!24375 lt!596693 lt!596694)) lt!596695))))

(declare-fun addStillNotContains!504 (ListLongMap!22039 (_ BitVec 64) V!55201 (_ BitVec 64)) Unit!44120)

(assert (=> b!1350100 (= lt!596696 (addStillNotContains!504 lt!596698 lt!596693 lt!596694 lt!596695))))

(assert (=> b!1350100 (= lt!596695 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1350100 (= lt!596694 (get!22494 (select (arr!44495 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1350100 (= lt!596693 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(assert (=> b!1350100 (= lt!596698 call!65188)))

(assert (=> b!1350100 (= e!768124 (+!4889 call!65188 (tuple2!24375 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22494 (select (arr!44495 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1350101 () Bool)

(assert (=> b!1350101 (= e!768123 e!768124)))

(declare-fun c!126866 () Bool)

(assert (=> b!1350101 (= c!126866 (validKeyInArray!0 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1350102 () Bool)

(declare-fun res!895423 () Bool)

(assert (=> b!1350102 (=> (not res!895423) (not e!768120))))

(assert (=> b!1350102 (= res!895423 (not (contains!9226 lt!596692 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144959 c!126865) b!1350091))

(assert (= (and d!144959 (not c!126865)) b!1350101))

(assert (= (and b!1350101 c!126866) b!1350100))

(assert (= (and b!1350101 (not c!126866)) b!1350092))

(assert (= (or b!1350100 b!1350092) bm!65185))

(assert (= (and d!144959 res!895421) b!1350102))

(assert (= (and b!1350102 res!895423) b!1350097))

(assert (= (and b!1350097 res!895422) b!1350094))

(assert (= (and b!1350097 c!126867) b!1350093))

(assert (= (and b!1350097 (not c!126867)) b!1350096))

(assert (= (and b!1350093 res!895420) b!1350099))

(assert (= (and b!1350096 c!126868) b!1350098))

(assert (= (and b!1350096 (not c!126868)) b!1350095))

(declare-fun b_lambda!24655 () Bool)

(assert (=> (not b_lambda!24655) (not b!1350099)))

(assert (=> b!1350099 t!46142))

(declare-fun b_and!50945 () Bool)

(assert (= b_and!50935 (and (=> t!46142 result!25973) b_and!50945)))

(declare-fun b_lambda!24657 () Bool)

(assert (=> (not b_lambda!24657) (not b!1350100)))

(assert (=> b!1350100 t!46142))

(declare-fun b_and!50947 () Bool)

(assert (= b_and!50945 (and (=> t!46142 result!25973) b_and!50947)))

(declare-fun m!1237393 () Bool)

(assert (=> b!1350094 m!1237393))

(assert (=> b!1350094 m!1237393))

(declare-fun m!1237395 () Bool)

(assert (=> b!1350094 m!1237395))

(declare-fun m!1237397 () Bool)

(assert (=> b!1350098 m!1237397))

(assert (=> b!1350101 m!1237393))

(assert (=> b!1350101 m!1237393))

(assert (=> b!1350101 m!1237395))

(assert (=> bm!65185 m!1237397))

(declare-fun m!1237399 () Bool)

(assert (=> b!1350095 m!1237399))

(declare-fun m!1237401 () Bool)

(assert (=> d!144959 m!1237401))

(assert (=> d!144959 m!1237289))

(assert (=> b!1350099 m!1237393))

(declare-fun m!1237403 () Bool)

(assert (=> b!1350099 m!1237403))

(declare-fun m!1237405 () Bool)

(assert (=> b!1350099 m!1237405))

(assert (=> b!1350099 m!1237299))

(declare-fun m!1237407 () Bool)

(assert (=> b!1350099 m!1237407))

(assert (=> b!1350099 m!1237299))

(assert (=> b!1350099 m!1237393))

(assert (=> b!1350099 m!1237405))

(assert (=> b!1350100 m!1237405))

(assert (=> b!1350100 m!1237299))

(assert (=> b!1350100 m!1237407))

(declare-fun m!1237409 () Bool)

(assert (=> b!1350100 m!1237409))

(declare-fun m!1237411 () Bool)

(assert (=> b!1350100 m!1237411))

(assert (=> b!1350100 m!1237409))

(assert (=> b!1350100 m!1237299))

(declare-fun m!1237413 () Bool)

(assert (=> b!1350100 m!1237413))

(declare-fun m!1237415 () Bool)

(assert (=> b!1350100 m!1237415))

(assert (=> b!1350100 m!1237393))

(assert (=> b!1350100 m!1237405))

(assert (=> b!1350093 m!1237393))

(assert (=> b!1350093 m!1237393))

(declare-fun m!1237417 () Bool)

(assert (=> b!1350093 m!1237417))

(declare-fun m!1237419 () Bool)

(assert (=> b!1350102 m!1237419))

(assert (=> b!1349970 d!144959))

(declare-fun d!144961 () Bool)

(declare-fun c!126871 () Bool)

(assert (=> d!144961 (= c!126871 ((_ is ValueCellFull!17888) (select (arr!44495 _values!1303) from!1960)))))

(declare-fun e!768129 () V!55201)

(assert (=> d!144961 (= (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!768129)))

(declare-fun b!1350107 () Bool)

(declare-fun get!22497 (ValueCell!17888 V!55201) V!55201)

(assert (=> b!1350107 (= e!768129 (get!22497 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350108 () Bool)

(declare-fun get!22498 (ValueCell!17888 V!55201) V!55201)

(assert (=> b!1350108 (= e!768129 (get!22498 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144961 c!126871) b!1350107))

(assert (= (and d!144961 (not c!126871)) b!1350108))

(assert (=> b!1350107 m!1237297))

(assert (=> b!1350107 m!1237299))

(declare-fun m!1237421 () Bool)

(assert (=> b!1350107 m!1237421))

(assert (=> b!1350108 m!1237297))

(assert (=> b!1350108 m!1237299))

(declare-fun m!1237423 () Bool)

(assert (=> b!1350108 m!1237423))

(assert (=> b!1349970 d!144961))

(declare-fun bm!65188 () Bool)

(declare-fun call!65191 () Bool)

(declare-fun c!126874 () Bool)

(assert (=> bm!65188 (= call!65191 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126874 (Cons!31508 (select (arr!44494 _keys!1571) #b00000000000000000000000000000000) Nil!31509) Nil!31509)))))

(declare-fun d!144963 () Bool)

(declare-fun res!895431 () Bool)

(declare-fun e!768141 () Bool)

(assert (=> d!144963 (=> res!895431 e!768141)))

(assert (=> d!144963 (= res!895431 (bvsge #b00000000000000000000000000000000 (size!45045 _keys!1571)))))

(assert (=> d!144963 (= (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31509) e!768141)))

(declare-fun b!1350119 () Bool)

(declare-fun e!768138 () Bool)

(assert (=> b!1350119 (= e!768141 e!768138)))

(declare-fun res!895432 () Bool)

(assert (=> b!1350119 (=> (not res!895432) (not e!768138))))

(declare-fun e!768139 () Bool)

(assert (=> b!1350119 (= res!895432 (not e!768139))))

(declare-fun res!895430 () Bool)

(assert (=> b!1350119 (=> (not res!895430) (not e!768139))))

(assert (=> b!1350119 (= res!895430 (validKeyInArray!0 (select (arr!44494 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1350120 () Bool)

(declare-fun contains!9230 (List!31512 (_ BitVec 64)) Bool)

(assert (=> b!1350120 (= e!768139 (contains!9230 Nil!31509 (select (arr!44494 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1350121 () Bool)

(declare-fun e!768140 () Bool)

(assert (=> b!1350121 (= e!768140 call!65191)))

(declare-fun b!1350122 () Bool)

(assert (=> b!1350122 (= e!768140 call!65191)))

(declare-fun b!1350123 () Bool)

(assert (=> b!1350123 (= e!768138 e!768140)))

(assert (=> b!1350123 (= c!126874 (validKeyInArray!0 (select (arr!44494 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144963 (not res!895431)) b!1350119))

(assert (= (and b!1350119 res!895430) b!1350120))

(assert (= (and b!1350119 res!895432) b!1350123))

(assert (= (and b!1350123 c!126874) b!1350122))

(assert (= (and b!1350123 (not c!126874)) b!1350121))

(assert (= (or b!1350122 b!1350121) bm!65188))

(declare-fun m!1237425 () Bool)

(assert (=> bm!65188 m!1237425))

(declare-fun m!1237427 () Bool)

(assert (=> bm!65188 m!1237427))

(assert (=> b!1350119 m!1237425))

(assert (=> b!1350119 m!1237425))

(declare-fun m!1237429 () Bool)

(assert (=> b!1350119 m!1237429))

(assert (=> b!1350120 m!1237425))

(assert (=> b!1350120 m!1237425))

(declare-fun m!1237431 () Bool)

(assert (=> b!1350120 m!1237431))

(assert (=> b!1350123 m!1237425))

(assert (=> b!1350123 m!1237425))

(assert (=> b!1350123 m!1237429))

(assert (=> b!1349965 d!144963))

(declare-fun d!144965 () Bool)

(assert (=> d!144965 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!113830 d!144965))

(declare-fun d!144967 () Bool)

(assert (=> d!144967 (= (array_inv!33777 _keys!1571) (bvsge (size!45045 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!113830 d!144967))

(declare-fun d!144969 () Bool)

(assert (=> d!144969 (= (array_inv!33778 _values!1303) (bvsge (size!45046 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!113830 d!144969))

(declare-fun d!144971 () Bool)

(declare-fun e!768142 () Bool)

(assert (=> d!144971 e!768142))

(declare-fun res!895433 () Bool)

(assert (=> d!144971 (=> res!895433 e!768142)))

(declare-fun lt!596701 () Bool)

(assert (=> d!144971 (= res!895433 (not lt!596701))))

(declare-fun lt!596699 () Bool)

(assert (=> d!144971 (= lt!596701 lt!596699)))

(declare-fun lt!596702 () Unit!44120)

(declare-fun e!768143 () Unit!44120)

(assert (=> d!144971 (= lt!596702 e!768143)))

(declare-fun c!126875 () Bool)

(assert (=> d!144971 (= c!126875 lt!596699)))

(assert (=> d!144971 (= lt!596699 (containsKey!744 (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> d!144971 (= (contains!9226 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142) lt!596701)))

(declare-fun b!1350124 () Bool)

(declare-fun lt!596700 () Unit!44120)

(assert (=> b!1350124 (= e!768143 lt!596700)))

(assert (=> b!1350124 (= lt!596700 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> b!1350124 (isDefined!527 (getValueByKey!718 (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun b!1350125 () Bool)

(declare-fun Unit!44123 () Unit!44120)

(assert (=> b!1350125 (= e!768143 Unit!44123)))

(declare-fun b!1350126 () Bool)

(assert (=> b!1350126 (= e!768142 (isDefined!527 (getValueByKey!718 (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)))))

(assert (= (and d!144971 c!126875) b!1350124))

(assert (= (and d!144971 (not c!126875)) b!1350125))

(assert (= (and d!144971 (not res!895433)) b!1350126))

(declare-fun m!1237433 () Bool)

(assert (=> d!144971 m!1237433))

(declare-fun m!1237435 () Bool)

(assert (=> b!1350124 m!1237435))

(declare-fun m!1237437 () Bool)

(assert (=> b!1350124 m!1237437))

(assert (=> b!1350124 m!1237437))

(declare-fun m!1237439 () Bool)

(assert (=> b!1350124 m!1237439))

(assert (=> b!1350126 m!1237437))

(assert (=> b!1350126 m!1237437))

(assert (=> b!1350126 m!1237439))

(assert (=> b!1349964 d!144971))

(declare-fun b!1350169 () Bool)

(declare-fun e!768182 () Bool)

(declare-fun lt!596767 () ListLongMap!22039)

(assert (=> b!1350169 (= e!768182 (= (apply!1048 lt!596767 (select (arr!44494 _keys!1571) from!1960)) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1350169 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45046 _values!1303)))))

(assert (=> b!1350169 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45045 _keys!1571)))))

(declare-fun bm!65203 () Bool)

(declare-fun call!65207 () ListLongMap!22039)

(declare-fun call!65208 () ListLongMap!22039)

(assert (=> bm!65203 (= call!65207 call!65208)))

(declare-fun b!1350170 () Bool)

(declare-fun e!768171 () ListLongMap!22039)

(declare-fun call!65206 () ListLongMap!22039)

(assert (=> b!1350170 (= e!768171 call!65206)))

(declare-fun c!126892 () Bool)

(declare-fun bm!65204 () Bool)

(declare-fun call!65211 () ListLongMap!22039)

(declare-fun c!126889 () Bool)

(assert (=> bm!65204 (= call!65211 (+!4889 (ite c!126889 call!65208 (ite c!126892 call!65207 call!65206)) (ite (or c!126889 c!126892) (tuple2!24375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun b!1350171 () Bool)

(declare-fun e!768172 () Bool)

(assert (=> b!1350171 (= e!768172 (= (apply!1048 lt!596767 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(declare-fun b!1350172 () Bool)

(declare-fun e!768173 () Bool)

(assert (=> b!1350172 (= e!768173 (= (apply!1048 lt!596767 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(declare-fun b!1350173 () Bool)

(declare-fun e!768175 () ListLongMap!22039)

(assert (=> b!1350173 (= e!768175 (+!4889 call!65211 (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun d!144973 () Bool)

(declare-fun e!768180 () Bool)

(assert (=> d!144973 e!768180))

(declare-fun res!895457 () Bool)

(assert (=> d!144973 (=> (not res!895457) (not e!768180))))

(assert (=> d!144973 (= res!895457 (or (bvsge from!1960 (size!45045 _keys!1571)) (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45045 _keys!1571)))))))

(declare-fun lt!596749 () ListLongMap!22039)

(assert (=> d!144973 (= lt!596767 lt!596749)))

(declare-fun lt!596750 () Unit!44120)

(declare-fun e!768174 () Unit!44120)

(assert (=> d!144973 (= lt!596750 e!768174)))

(declare-fun c!126893 () Bool)

(declare-fun e!768181 () Bool)

(assert (=> d!144973 (= c!126893 e!768181)))

(declare-fun res!895455 () Bool)

(assert (=> d!144973 (=> (not res!895455) (not e!768181))))

(assert (=> d!144973 (= res!895455 (bvslt from!1960 (size!45045 _keys!1571)))))

(assert (=> d!144973 (= lt!596749 e!768175)))

(assert (=> d!144973 (= c!126889 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144973 (validMask!0 mask!1977)))

(assert (=> d!144973 (= (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!596767)))

(declare-fun b!1350174 () Bool)

(declare-fun e!768178 () Bool)

(declare-fun call!65209 () Bool)

(assert (=> b!1350174 (= e!768178 (not call!65209))))

(declare-fun b!1350175 () Bool)

(declare-fun call!65210 () ListLongMap!22039)

(assert (=> b!1350175 (= e!768171 call!65210)))

(declare-fun b!1350176 () Bool)

(declare-fun e!768179 () Bool)

(assert (=> b!1350176 (= e!768179 e!768173)))

(declare-fun res!895453 () Bool)

(declare-fun call!65212 () Bool)

(assert (=> b!1350176 (= res!895453 call!65212)))

(assert (=> b!1350176 (=> (not res!895453) (not e!768173))))

(declare-fun b!1350177 () Bool)

(assert (=> b!1350177 (= e!768181 (validKeyInArray!0 (select (arr!44494 _keys!1571) from!1960)))))

(declare-fun b!1350178 () Bool)

(assert (=> b!1350178 (= e!768178 e!768172)))

(declare-fun res!895458 () Bool)

(assert (=> b!1350178 (= res!895458 call!65209)))

(assert (=> b!1350178 (=> (not res!895458) (not e!768172))))

(declare-fun bm!65205 () Bool)

(assert (=> bm!65205 (= call!65210 call!65211)))

(declare-fun b!1350179 () Bool)

(assert (=> b!1350179 (= e!768179 (not call!65212))))

(declare-fun b!1350180 () Bool)

(declare-fun res!895459 () Bool)

(assert (=> b!1350180 (=> (not res!895459) (not e!768180))))

(assert (=> b!1350180 (= res!895459 e!768178)))

(declare-fun c!126890 () Bool)

(assert (=> b!1350180 (= c!126890 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!65206 () Bool)

(assert (=> bm!65206 (= call!65209 (contains!9226 lt!596767 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350181 () Bool)

(declare-fun lt!596756 () Unit!44120)

(assert (=> b!1350181 (= e!768174 lt!596756)))

(declare-fun lt!596751 () ListLongMap!22039)

(assert (=> b!1350181 (= lt!596751 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596765 () (_ BitVec 64))

(assert (=> b!1350181 (= lt!596765 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596748 () (_ BitVec 64))

(assert (=> b!1350181 (= lt!596748 (select (arr!44494 _keys!1571) from!1960))))

(declare-fun lt!596754 () Unit!44120)

(declare-fun addStillContains!1216 (ListLongMap!22039 (_ BitVec 64) V!55201 (_ BitVec 64)) Unit!44120)

(assert (=> b!1350181 (= lt!596754 (addStillContains!1216 lt!596751 lt!596765 zeroValue!1245 lt!596748))))

(assert (=> b!1350181 (contains!9226 (+!4889 lt!596751 (tuple2!24375 lt!596765 zeroValue!1245)) lt!596748)))

(declare-fun lt!596764 () Unit!44120)

(assert (=> b!1350181 (= lt!596764 lt!596754)))

(declare-fun lt!596768 () ListLongMap!22039)

(assert (=> b!1350181 (= lt!596768 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596761 () (_ BitVec 64))

(assert (=> b!1350181 (= lt!596761 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596755 () (_ BitVec 64))

(assert (=> b!1350181 (= lt!596755 (select (arr!44494 _keys!1571) from!1960))))

(declare-fun lt!596757 () Unit!44120)

(declare-fun addApplyDifferent!577 (ListLongMap!22039 (_ BitVec 64) V!55201 (_ BitVec 64)) Unit!44120)

(assert (=> b!1350181 (= lt!596757 (addApplyDifferent!577 lt!596768 lt!596761 minValue!1245 lt!596755))))

(assert (=> b!1350181 (= (apply!1048 (+!4889 lt!596768 (tuple2!24375 lt!596761 minValue!1245)) lt!596755) (apply!1048 lt!596768 lt!596755))))

(declare-fun lt!596758 () Unit!44120)

(assert (=> b!1350181 (= lt!596758 lt!596757)))

(declare-fun lt!596763 () ListLongMap!22039)

(assert (=> b!1350181 (= lt!596763 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596753 () (_ BitVec 64))

(assert (=> b!1350181 (= lt!596753 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596759 () (_ BitVec 64))

(assert (=> b!1350181 (= lt!596759 (select (arr!44494 _keys!1571) from!1960))))

(declare-fun lt!596762 () Unit!44120)

(assert (=> b!1350181 (= lt!596762 (addApplyDifferent!577 lt!596763 lt!596753 zeroValue!1245 lt!596759))))

(assert (=> b!1350181 (= (apply!1048 (+!4889 lt!596763 (tuple2!24375 lt!596753 zeroValue!1245)) lt!596759) (apply!1048 lt!596763 lt!596759))))

(declare-fun lt!596760 () Unit!44120)

(assert (=> b!1350181 (= lt!596760 lt!596762)))

(declare-fun lt!596747 () ListLongMap!22039)

(assert (=> b!1350181 (= lt!596747 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596752 () (_ BitVec 64))

(assert (=> b!1350181 (= lt!596752 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596766 () (_ BitVec 64))

(assert (=> b!1350181 (= lt!596766 (select (arr!44494 _keys!1571) from!1960))))

(assert (=> b!1350181 (= lt!596756 (addApplyDifferent!577 lt!596747 lt!596752 minValue!1245 lt!596766))))

(assert (=> b!1350181 (= (apply!1048 (+!4889 lt!596747 (tuple2!24375 lt!596752 minValue!1245)) lt!596766) (apply!1048 lt!596747 lt!596766))))

(declare-fun b!1350182 () Bool)

(declare-fun e!768176 () Bool)

(assert (=> b!1350182 (= e!768176 e!768182)))

(declare-fun res!895456 () Bool)

(assert (=> b!1350182 (=> (not res!895456) (not e!768182))))

(assert (=> b!1350182 (= res!895456 (contains!9226 lt!596767 (select (arr!44494 _keys!1571) from!1960)))))

(assert (=> b!1350182 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45045 _keys!1571)))))

(declare-fun b!1350183 () Bool)

(declare-fun e!768170 () Bool)

(assert (=> b!1350183 (= e!768170 (validKeyInArray!0 (select (arr!44494 _keys!1571) from!1960)))))

(declare-fun b!1350184 () Bool)

(declare-fun Unit!44124 () Unit!44120)

(assert (=> b!1350184 (= e!768174 Unit!44124)))

(declare-fun bm!65207 () Bool)

(assert (=> bm!65207 (= call!65208 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun b!1350185 () Bool)

(declare-fun e!768177 () ListLongMap!22039)

(assert (=> b!1350185 (= e!768175 e!768177)))

(assert (=> b!1350185 (= c!126892 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!65208 () Bool)

(assert (=> bm!65208 (= call!65206 call!65207)))

(declare-fun b!1350186 () Bool)

(assert (=> b!1350186 (= e!768177 call!65210)))

(declare-fun b!1350187 () Bool)

(assert (=> b!1350187 (= e!768180 e!768179)))

(declare-fun c!126891 () Bool)

(assert (=> b!1350187 (= c!126891 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1350188 () Bool)

(declare-fun res!895454 () Bool)

(assert (=> b!1350188 (=> (not res!895454) (not e!768180))))

(assert (=> b!1350188 (= res!895454 e!768176)))

(declare-fun res!895452 () Bool)

(assert (=> b!1350188 (=> res!895452 e!768176)))

(assert (=> b!1350188 (= res!895452 (not e!768170))))

(declare-fun res!895460 () Bool)

(assert (=> b!1350188 (=> (not res!895460) (not e!768170))))

(assert (=> b!1350188 (= res!895460 (bvslt from!1960 (size!45045 _keys!1571)))))

(declare-fun b!1350189 () Bool)

(declare-fun c!126888 () Bool)

(assert (=> b!1350189 (= c!126888 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1350189 (= e!768177 e!768171)))

(declare-fun bm!65209 () Bool)

(assert (=> bm!65209 (= call!65212 (contains!9226 lt!596767 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144973 c!126889) b!1350173))

(assert (= (and d!144973 (not c!126889)) b!1350185))

(assert (= (and b!1350185 c!126892) b!1350186))

(assert (= (and b!1350185 (not c!126892)) b!1350189))

(assert (= (and b!1350189 c!126888) b!1350175))

(assert (= (and b!1350189 (not c!126888)) b!1350170))

(assert (= (or b!1350175 b!1350170) bm!65208))

(assert (= (or b!1350186 bm!65208) bm!65203))

(assert (= (or b!1350186 b!1350175) bm!65205))

(assert (= (or b!1350173 bm!65203) bm!65207))

(assert (= (or b!1350173 bm!65205) bm!65204))

(assert (= (and d!144973 res!895455) b!1350177))

(assert (= (and d!144973 c!126893) b!1350181))

(assert (= (and d!144973 (not c!126893)) b!1350184))

(assert (= (and d!144973 res!895457) b!1350188))

(assert (= (and b!1350188 res!895460) b!1350183))

(assert (= (and b!1350188 (not res!895452)) b!1350182))

(assert (= (and b!1350182 res!895456) b!1350169))

(assert (= (and b!1350188 res!895454) b!1350180))

(assert (= (and b!1350180 c!126890) b!1350178))

(assert (= (and b!1350180 (not c!126890)) b!1350174))

(assert (= (and b!1350178 res!895458) b!1350171))

(assert (= (or b!1350178 b!1350174) bm!65206))

(assert (= (and b!1350180 res!895459) b!1350187))

(assert (= (and b!1350187 c!126891) b!1350176))

(assert (= (and b!1350187 (not c!126891)) b!1350179))

(assert (= (and b!1350176 res!895453) b!1350172))

(assert (= (or b!1350176 b!1350179) bm!65209))

(declare-fun b_lambda!24659 () Bool)

(assert (=> (not b_lambda!24659) (not b!1350169)))

(assert (=> b!1350169 t!46142))

(declare-fun b_and!50949 () Bool)

(assert (= b_and!50947 (and (=> t!46142 result!25973) b_and!50949)))

(declare-fun m!1237441 () Bool)

(assert (=> bm!65207 m!1237441))

(declare-fun m!1237443 () Bool)

(assert (=> b!1350173 m!1237443))

(assert (=> b!1350169 m!1237297))

(assert (=> b!1350169 m!1237299))

(assert (=> b!1350169 m!1237301))

(assert (=> b!1350169 m!1237297))

(assert (=> b!1350169 m!1237299))

(assert (=> b!1350169 m!1237277))

(declare-fun m!1237445 () Bool)

(assert (=> b!1350169 m!1237445))

(assert (=> b!1350169 m!1237277))

(assert (=> d!144973 m!1237289))

(declare-fun m!1237447 () Bool)

(assert (=> bm!65209 m!1237447))

(declare-fun m!1237449 () Bool)

(assert (=> bm!65206 m!1237449))

(declare-fun m!1237451 () Bool)

(assert (=> bm!65204 m!1237451))

(assert (=> b!1350182 m!1237277))

(assert (=> b!1350182 m!1237277))

(declare-fun m!1237453 () Bool)

(assert (=> b!1350182 m!1237453))

(assert (=> b!1350177 m!1237277))

(assert (=> b!1350177 m!1237277))

(assert (=> b!1350177 m!1237279))

(declare-fun m!1237455 () Bool)

(assert (=> b!1350181 m!1237455))

(declare-fun m!1237457 () Bool)

(assert (=> b!1350181 m!1237457))

(declare-fun m!1237459 () Bool)

(assert (=> b!1350181 m!1237459))

(declare-fun m!1237461 () Bool)

(assert (=> b!1350181 m!1237461))

(assert (=> b!1350181 m!1237461))

(declare-fun m!1237463 () Bool)

(assert (=> b!1350181 m!1237463))

(declare-fun m!1237465 () Bool)

(assert (=> b!1350181 m!1237465))

(assert (=> b!1350181 m!1237457))

(declare-fun m!1237467 () Bool)

(assert (=> b!1350181 m!1237467))

(declare-fun m!1237469 () Bool)

(assert (=> b!1350181 m!1237469))

(declare-fun m!1237471 () Bool)

(assert (=> b!1350181 m!1237471))

(declare-fun m!1237473 () Bool)

(assert (=> b!1350181 m!1237473))

(assert (=> b!1350181 m!1237469))

(declare-fun m!1237475 () Bool)

(assert (=> b!1350181 m!1237475))

(declare-fun m!1237477 () Bool)

(assert (=> b!1350181 m!1237477))

(assert (=> b!1350181 m!1237441))

(assert (=> b!1350181 m!1237277))

(assert (=> b!1350181 m!1237455))

(declare-fun m!1237479 () Bool)

(assert (=> b!1350181 m!1237479))

(declare-fun m!1237481 () Bool)

(assert (=> b!1350181 m!1237481))

(declare-fun m!1237483 () Bool)

(assert (=> b!1350181 m!1237483))

(assert (=> b!1350183 m!1237277))

(assert (=> b!1350183 m!1237277))

(assert (=> b!1350183 m!1237279))

(declare-fun m!1237485 () Bool)

(assert (=> b!1350172 m!1237485))

(declare-fun m!1237487 () Bool)

(assert (=> b!1350171 m!1237487))

(assert (=> b!1349964 d!144973))

(declare-fun d!144975 () Bool)

(assert (=> d!144975 (= (validKeyInArray!0 (select (arr!44494 _keys!1571) from!1960)) (and (not (= (select (arr!44494 _keys!1571) from!1960) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44494 _keys!1571) from!1960) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1349963 d!144975))

(declare-fun b!1350198 () Bool)

(declare-fun e!768190 () Bool)

(declare-fun e!768189 () Bool)

(assert (=> b!1350198 (= e!768190 e!768189)))

(declare-fun lt!596777 () (_ BitVec 64))

(assert (=> b!1350198 (= lt!596777 (select (arr!44494 _keys!1571) #b00000000000000000000000000000000))))

(declare-fun lt!596776 () Unit!44120)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!92089 (_ BitVec 64) (_ BitVec 32)) Unit!44120)

(assert (=> b!1350198 (= lt!596776 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!596777 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!92089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1350198 (arrayContainsKey!0 _keys!1571 lt!596777 #b00000000000000000000000000000000)))

(declare-fun lt!596775 () Unit!44120)

(assert (=> b!1350198 (= lt!596775 lt!596776)))

(declare-fun res!895466 () Bool)

(declare-datatypes ((SeekEntryResult!10014 0))(
  ( (MissingZero!10014 (index!42427 (_ BitVec 32))) (Found!10014 (index!42428 (_ BitVec 32))) (Intermediate!10014 (undefined!10826 Bool) (index!42429 (_ BitVec 32)) (x!120694 (_ BitVec 32))) (Undefined!10014) (MissingVacant!10014 (index!42430 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!92089 (_ BitVec 32)) SeekEntryResult!10014)

(assert (=> b!1350198 (= res!895466 (= (seekEntryOrOpen!0 (select (arr!44494 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10014 #b00000000000000000000000000000000)))))

(assert (=> b!1350198 (=> (not res!895466) (not e!768189))))

(declare-fun b!1350200 () Bool)

(declare-fun call!65215 () Bool)

(assert (=> b!1350200 (= e!768190 call!65215)))

(declare-fun d!144977 () Bool)

(declare-fun res!895465 () Bool)

(declare-fun e!768191 () Bool)

(assert (=> d!144977 (=> res!895465 e!768191)))

(assert (=> d!144977 (= res!895465 (bvsge #b00000000000000000000000000000000 (size!45045 _keys!1571)))))

(assert (=> d!144977 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!768191)))

(declare-fun b!1350199 () Bool)

(assert (=> b!1350199 (= e!768189 call!65215)))

(declare-fun bm!65212 () Bool)

(assert (=> bm!65212 (= call!65215 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1350201 () Bool)

(assert (=> b!1350201 (= e!768191 e!768190)))

(declare-fun c!126896 () Bool)

(assert (=> b!1350201 (= c!126896 (validKeyInArray!0 (select (arr!44494 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144977 (not res!895465)) b!1350201))

(assert (= (and b!1350201 c!126896) b!1350198))

(assert (= (and b!1350201 (not c!126896)) b!1350200))

(assert (= (and b!1350198 res!895466) b!1350199))

(assert (= (or b!1350199 b!1350200) bm!65212))

(assert (=> b!1350198 m!1237425))

(declare-fun m!1237489 () Bool)

(assert (=> b!1350198 m!1237489))

(declare-fun m!1237491 () Bool)

(assert (=> b!1350198 m!1237491))

(assert (=> b!1350198 m!1237425))

(declare-fun m!1237493 () Bool)

(assert (=> b!1350198 m!1237493))

(declare-fun m!1237495 () Bool)

(assert (=> bm!65212 m!1237495))

(assert (=> b!1350201 m!1237425))

(assert (=> b!1350201 m!1237425))

(assert (=> b!1350201 m!1237429))

(assert (=> b!1349973 d!144977))

(declare-fun b!1350208 () Bool)

(declare-fun e!768197 () Bool)

(assert (=> b!1350208 (= e!768197 tp_is_empty!37573)))

(declare-fun mapNonEmpty!58082 () Bool)

(declare-fun mapRes!58082 () Bool)

(declare-fun tp!110546 () Bool)

(assert (=> mapNonEmpty!58082 (= mapRes!58082 (and tp!110546 e!768197))))

(declare-fun mapValue!58082 () ValueCell!17888)

(declare-fun mapRest!58082 () (Array (_ BitVec 32) ValueCell!17888))

(declare-fun mapKey!58082 () (_ BitVec 32))

(assert (=> mapNonEmpty!58082 (= mapRest!58073 (store mapRest!58082 mapKey!58082 mapValue!58082))))

(declare-fun condMapEmpty!58082 () Bool)

(declare-fun mapDefault!58082 () ValueCell!17888)

(assert (=> mapNonEmpty!58073 (= condMapEmpty!58082 (= mapRest!58073 ((as const (Array (_ BitVec 32) ValueCell!17888)) mapDefault!58082)))))

(declare-fun e!768196 () Bool)

(assert (=> mapNonEmpty!58073 (= tp!110530 (and e!768196 mapRes!58082))))

(declare-fun b!1350209 () Bool)

(assert (=> b!1350209 (= e!768196 tp_is_empty!37573)))

(declare-fun mapIsEmpty!58082 () Bool)

(assert (=> mapIsEmpty!58082 mapRes!58082))

(assert (= (and mapNonEmpty!58073 condMapEmpty!58082) mapIsEmpty!58082))

(assert (= (and mapNonEmpty!58073 (not condMapEmpty!58082)) mapNonEmpty!58082))

(assert (= (and mapNonEmpty!58082 ((_ is ValueCellFull!17888) mapValue!58082)) b!1350208))

(assert (= (and mapNonEmpty!58073 ((_ is ValueCellFull!17888) mapDefault!58082)) b!1350209))

(declare-fun m!1237497 () Bool)

(assert (=> mapNonEmpty!58082 m!1237497))

(declare-fun b_lambda!24661 () Bool)

(assert (= b_lambda!24657 (or (and start!113830 b_free!31573) b_lambda!24661)))

(declare-fun b_lambda!24663 () Bool)

(assert (= b_lambda!24659 (or (and start!113830 b_free!31573) b_lambda!24663)))

(declare-fun b_lambda!24665 () Bool)

(assert (= b_lambda!24655 (or (and start!113830 b_free!31573) b_lambda!24665)))

(check-sat (not bm!65212) (not b!1350173) (not b!1350183) (not d!144959) (not b!1350107) (not b!1350095) (not b!1350177) (not bm!65209) (not b!1350094) (not b_next!31573) (not b!1350123) (not b!1350124) (not b_lambda!24653) (not bm!65204) (not d!144957) (not d!144955) (not b!1350198) (not bm!65206) (not b!1350098) (not bm!65185) (not b_lambda!24663) (not b_lambda!24665) (not d!144971) (not b!1350181) (not b!1350108) (not b!1350099) (not b!1350201) (not b!1350119) (not b!1350093) (not bm!65207) (not b_lambda!24661) (not b!1350169) (not b!1350126) (not b!1350172) (not b!1350065) (not b!1350120) (not b!1350101) (not b!1350171) tp_is_empty!37573 (not b!1350060) (not mapNonEmpty!58082) b_and!50949 (not bm!65188) (not b!1350102) (not b!1350100) (not b!1350058) (not b!1350182) (not b!1350066) (not d!144973))
(check-sat b_and!50949 (not b_next!31573))
(get-model)

(declare-fun d!144979 () Bool)

(assert (=> d!144979 (contains!9226 (+!4889 lt!596751 (tuple2!24375 lt!596765 zeroValue!1245)) lt!596748)))

(declare-fun lt!596780 () Unit!44120)

(declare-fun choose!1981 (ListLongMap!22039 (_ BitVec 64) V!55201 (_ BitVec 64)) Unit!44120)

(assert (=> d!144979 (= lt!596780 (choose!1981 lt!596751 lt!596765 zeroValue!1245 lt!596748))))

(assert (=> d!144979 (contains!9226 lt!596751 lt!596748)))

(assert (=> d!144979 (= (addStillContains!1216 lt!596751 lt!596765 zeroValue!1245 lt!596748) lt!596780)))

(declare-fun bs!38677 () Bool)

(assert (= bs!38677 d!144979))

(assert (=> bs!38677 m!1237469))

(assert (=> bs!38677 m!1237469))

(assert (=> bs!38677 m!1237475))

(declare-fun m!1237499 () Bool)

(assert (=> bs!38677 m!1237499))

(declare-fun m!1237501 () Bool)

(assert (=> bs!38677 m!1237501))

(assert (=> b!1350181 d!144979))

(declare-fun d!144981 () Bool)

(declare-fun e!768198 () Bool)

(assert (=> d!144981 e!768198))

(declare-fun res!895467 () Bool)

(assert (=> d!144981 (=> (not res!895467) (not e!768198))))

(declare-fun lt!596781 () ListLongMap!22039)

(assert (=> d!144981 (= res!895467 (contains!9226 lt!596781 (_1!12198 (tuple2!24375 lt!596761 minValue!1245))))))

(declare-fun lt!596782 () List!31511)

(assert (=> d!144981 (= lt!596781 (ListLongMap!22040 lt!596782))))

(declare-fun lt!596783 () Unit!44120)

(declare-fun lt!596784 () Unit!44120)

(assert (=> d!144981 (= lt!596783 lt!596784)))

(assert (=> d!144981 (= (getValueByKey!718 lt!596782 (_1!12198 (tuple2!24375 lt!596761 minValue!1245))) (Some!768 (_2!12198 (tuple2!24375 lt!596761 minValue!1245))))))

(assert (=> d!144981 (= lt!596784 (lemmaContainsTupThenGetReturnValue!368 lt!596782 (_1!12198 (tuple2!24375 lt!596761 minValue!1245)) (_2!12198 (tuple2!24375 lt!596761 minValue!1245))))))

(assert (=> d!144981 (= lt!596782 (insertStrictlySorted!497 (toList!11035 lt!596768) (_1!12198 (tuple2!24375 lt!596761 minValue!1245)) (_2!12198 (tuple2!24375 lt!596761 minValue!1245))))))

(assert (=> d!144981 (= (+!4889 lt!596768 (tuple2!24375 lt!596761 minValue!1245)) lt!596781)))

(declare-fun b!1350211 () Bool)

(declare-fun res!895468 () Bool)

(assert (=> b!1350211 (=> (not res!895468) (not e!768198))))

(assert (=> b!1350211 (= res!895468 (= (getValueByKey!718 (toList!11035 lt!596781) (_1!12198 (tuple2!24375 lt!596761 minValue!1245))) (Some!768 (_2!12198 (tuple2!24375 lt!596761 minValue!1245)))))))

(declare-fun b!1350212 () Bool)

(assert (=> b!1350212 (= e!768198 (contains!9229 (toList!11035 lt!596781) (tuple2!24375 lt!596761 minValue!1245)))))

(assert (= (and d!144981 res!895467) b!1350211))

(assert (= (and b!1350211 res!895468) b!1350212))

(declare-fun m!1237503 () Bool)

(assert (=> d!144981 m!1237503))

(declare-fun m!1237505 () Bool)

(assert (=> d!144981 m!1237505))

(declare-fun m!1237507 () Bool)

(assert (=> d!144981 m!1237507))

(declare-fun m!1237509 () Bool)

(assert (=> d!144981 m!1237509))

(declare-fun m!1237511 () Bool)

(assert (=> b!1350211 m!1237511))

(declare-fun m!1237513 () Bool)

(assert (=> b!1350212 m!1237513))

(assert (=> b!1350181 d!144981))

(declare-fun d!144983 () Bool)

(declare-fun e!768199 () Bool)

(assert (=> d!144983 e!768199))

(declare-fun res!895469 () Bool)

(assert (=> d!144983 (=> res!895469 e!768199)))

(declare-fun lt!596787 () Bool)

(assert (=> d!144983 (= res!895469 (not lt!596787))))

(declare-fun lt!596785 () Bool)

(assert (=> d!144983 (= lt!596787 lt!596785)))

(declare-fun lt!596788 () Unit!44120)

(declare-fun e!768200 () Unit!44120)

(assert (=> d!144983 (= lt!596788 e!768200)))

(declare-fun c!126897 () Bool)

(assert (=> d!144983 (= c!126897 lt!596785)))

(assert (=> d!144983 (= lt!596785 (containsKey!744 (toList!11035 (+!4889 lt!596751 (tuple2!24375 lt!596765 zeroValue!1245))) lt!596748))))

(assert (=> d!144983 (= (contains!9226 (+!4889 lt!596751 (tuple2!24375 lt!596765 zeroValue!1245)) lt!596748) lt!596787)))

(declare-fun b!1350213 () Bool)

(declare-fun lt!596786 () Unit!44120)

(assert (=> b!1350213 (= e!768200 lt!596786)))

(assert (=> b!1350213 (= lt!596786 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11035 (+!4889 lt!596751 (tuple2!24375 lt!596765 zeroValue!1245))) lt!596748))))

(assert (=> b!1350213 (isDefined!527 (getValueByKey!718 (toList!11035 (+!4889 lt!596751 (tuple2!24375 lt!596765 zeroValue!1245))) lt!596748))))

(declare-fun b!1350214 () Bool)

(declare-fun Unit!44125 () Unit!44120)

(assert (=> b!1350214 (= e!768200 Unit!44125)))

(declare-fun b!1350215 () Bool)

(assert (=> b!1350215 (= e!768199 (isDefined!527 (getValueByKey!718 (toList!11035 (+!4889 lt!596751 (tuple2!24375 lt!596765 zeroValue!1245))) lt!596748)))))

(assert (= (and d!144983 c!126897) b!1350213))

(assert (= (and d!144983 (not c!126897)) b!1350214))

(assert (= (and d!144983 (not res!895469)) b!1350215))

(declare-fun m!1237515 () Bool)

(assert (=> d!144983 m!1237515))

(declare-fun m!1237517 () Bool)

(assert (=> b!1350213 m!1237517))

(declare-fun m!1237519 () Bool)

(assert (=> b!1350213 m!1237519))

(assert (=> b!1350213 m!1237519))

(declare-fun m!1237521 () Bool)

(assert (=> b!1350213 m!1237521))

(assert (=> b!1350215 m!1237519))

(assert (=> b!1350215 m!1237519))

(assert (=> b!1350215 m!1237521))

(assert (=> b!1350181 d!144983))

(declare-fun d!144985 () Bool)

(declare-fun e!768201 () Bool)

(assert (=> d!144985 e!768201))

(declare-fun res!895470 () Bool)

(assert (=> d!144985 (=> (not res!895470) (not e!768201))))

(declare-fun lt!596789 () ListLongMap!22039)

(assert (=> d!144985 (= res!895470 (contains!9226 lt!596789 (_1!12198 (tuple2!24375 lt!596765 zeroValue!1245))))))

(declare-fun lt!596790 () List!31511)

(assert (=> d!144985 (= lt!596789 (ListLongMap!22040 lt!596790))))

(declare-fun lt!596791 () Unit!44120)

(declare-fun lt!596792 () Unit!44120)

(assert (=> d!144985 (= lt!596791 lt!596792)))

(assert (=> d!144985 (= (getValueByKey!718 lt!596790 (_1!12198 (tuple2!24375 lt!596765 zeroValue!1245))) (Some!768 (_2!12198 (tuple2!24375 lt!596765 zeroValue!1245))))))

(assert (=> d!144985 (= lt!596792 (lemmaContainsTupThenGetReturnValue!368 lt!596790 (_1!12198 (tuple2!24375 lt!596765 zeroValue!1245)) (_2!12198 (tuple2!24375 lt!596765 zeroValue!1245))))))

(assert (=> d!144985 (= lt!596790 (insertStrictlySorted!497 (toList!11035 lt!596751) (_1!12198 (tuple2!24375 lt!596765 zeroValue!1245)) (_2!12198 (tuple2!24375 lt!596765 zeroValue!1245))))))

(assert (=> d!144985 (= (+!4889 lt!596751 (tuple2!24375 lt!596765 zeroValue!1245)) lt!596789)))

(declare-fun b!1350216 () Bool)

(declare-fun res!895471 () Bool)

(assert (=> b!1350216 (=> (not res!895471) (not e!768201))))

(assert (=> b!1350216 (= res!895471 (= (getValueByKey!718 (toList!11035 lt!596789) (_1!12198 (tuple2!24375 lt!596765 zeroValue!1245))) (Some!768 (_2!12198 (tuple2!24375 lt!596765 zeroValue!1245)))))))

(declare-fun b!1350217 () Bool)

(assert (=> b!1350217 (= e!768201 (contains!9229 (toList!11035 lt!596789) (tuple2!24375 lt!596765 zeroValue!1245)))))

(assert (= (and d!144985 res!895470) b!1350216))

(assert (= (and b!1350216 res!895471) b!1350217))

(declare-fun m!1237523 () Bool)

(assert (=> d!144985 m!1237523))

(declare-fun m!1237525 () Bool)

(assert (=> d!144985 m!1237525))

(declare-fun m!1237527 () Bool)

(assert (=> d!144985 m!1237527))

(declare-fun m!1237529 () Bool)

(assert (=> d!144985 m!1237529))

(declare-fun m!1237531 () Bool)

(assert (=> b!1350216 m!1237531))

(declare-fun m!1237533 () Bool)

(assert (=> b!1350217 m!1237533))

(assert (=> b!1350181 d!144985))

(declare-fun d!144987 () Bool)

(assert (=> d!144987 (= (apply!1048 (+!4889 lt!596747 (tuple2!24375 lt!596752 minValue!1245)) lt!596766) (apply!1048 lt!596747 lt!596766))))

(declare-fun lt!596795 () Unit!44120)

(declare-fun choose!1982 (ListLongMap!22039 (_ BitVec 64) V!55201 (_ BitVec 64)) Unit!44120)

(assert (=> d!144987 (= lt!596795 (choose!1982 lt!596747 lt!596752 minValue!1245 lt!596766))))

(declare-fun e!768204 () Bool)

(assert (=> d!144987 e!768204))

(declare-fun res!895474 () Bool)

(assert (=> d!144987 (=> (not res!895474) (not e!768204))))

(assert (=> d!144987 (= res!895474 (contains!9226 lt!596747 lt!596766))))

(assert (=> d!144987 (= (addApplyDifferent!577 lt!596747 lt!596752 minValue!1245 lt!596766) lt!596795)))

(declare-fun b!1350221 () Bool)

(assert (=> b!1350221 (= e!768204 (not (= lt!596766 lt!596752)))))

(assert (= (and d!144987 res!895474) b!1350221))

(declare-fun m!1237535 () Bool)

(assert (=> d!144987 m!1237535))

(assert (=> d!144987 m!1237457))

(declare-fun m!1237537 () Bool)

(assert (=> d!144987 m!1237537))

(assert (=> d!144987 m!1237457))

(assert (=> d!144987 m!1237467))

(assert (=> d!144987 m!1237477))

(assert (=> b!1350181 d!144987))

(declare-fun b!1350222 () Bool)

(declare-fun e!768208 () ListLongMap!22039)

(assert (=> b!1350222 (= e!768208 (ListLongMap!22040 Nil!31508))))

(declare-fun b!1350223 () Bool)

(declare-fun e!768209 () ListLongMap!22039)

(declare-fun call!65216 () ListLongMap!22039)

(assert (=> b!1350223 (= e!768209 call!65216)))

(declare-fun d!144989 () Bool)

(declare-fun e!768205 () Bool)

(assert (=> d!144989 e!768205))

(declare-fun res!895476 () Bool)

(assert (=> d!144989 (=> (not res!895476) (not e!768205))))

(declare-fun lt!596796 () ListLongMap!22039)

(assert (=> d!144989 (= res!895476 (not (contains!9226 lt!596796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!144989 (= lt!596796 e!768208)))

(declare-fun c!126898 () Bool)

(assert (=> d!144989 (= c!126898 (bvsge from!1960 (size!45045 _keys!1571)))))

(assert (=> d!144989 (validMask!0 mask!1977)))

(assert (=> d!144989 (= (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!596796)))

(declare-fun b!1350224 () Bool)

(declare-fun e!768207 () Bool)

(declare-fun e!768210 () Bool)

(assert (=> b!1350224 (= e!768207 e!768210)))

(assert (=> b!1350224 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45045 _keys!1571)))))

(declare-fun res!895475 () Bool)

(assert (=> b!1350224 (= res!895475 (contains!9226 lt!596796 (select (arr!44494 _keys!1571) from!1960)))))

(assert (=> b!1350224 (=> (not res!895475) (not e!768210))))

(declare-fun b!1350225 () Bool)

(declare-fun e!768206 () Bool)

(assert (=> b!1350225 (= e!768206 (validKeyInArray!0 (select (arr!44494 _keys!1571) from!1960)))))

(assert (=> b!1350225 (bvsge from!1960 #b00000000000000000000000000000000)))

(declare-fun b!1350226 () Bool)

(declare-fun e!768211 () Bool)

(assert (=> b!1350226 (= e!768211 (isEmpty!1099 lt!596796))))

(declare-fun b!1350227 () Bool)

(assert (=> b!1350227 (= e!768207 e!768211)))

(declare-fun c!126901 () Bool)

(assert (=> b!1350227 (= c!126901 (bvslt from!1960 (size!45045 _keys!1571)))))

(declare-fun b!1350228 () Bool)

(assert (=> b!1350228 (= e!768205 e!768207)))

(declare-fun c!126900 () Bool)

(assert (=> b!1350228 (= c!126900 e!768206)))

(declare-fun res!895477 () Bool)

(assert (=> b!1350228 (=> (not res!895477) (not e!768206))))

(assert (=> b!1350228 (= res!895477 (bvslt from!1960 (size!45045 _keys!1571)))))

(declare-fun b!1350229 () Bool)

(assert (=> b!1350229 (= e!768211 (= lt!596796 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun bm!65213 () Bool)

(assert (=> bm!65213 (= call!65216 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1350230 () Bool)

(assert (=> b!1350230 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45045 _keys!1571)))))

(assert (=> b!1350230 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45046 _values!1303)))))

(assert (=> b!1350230 (= e!768210 (= (apply!1048 lt!596796 (select (arr!44494 _keys!1571) from!1960)) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1350231 () Bool)

(declare-fun lt!596801 () Unit!44120)

(declare-fun lt!596800 () Unit!44120)

(assert (=> b!1350231 (= lt!596801 lt!596800)))

(declare-fun lt!596798 () V!55201)

(declare-fun lt!596799 () (_ BitVec 64))

(declare-fun lt!596797 () (_ BitVec 64))

(declare-fun lt!596802 () ListLongMap!22039)

(assert (=> b!1350231 (not (contains!9226 (+!4889 lt!596802 (tuple2!24375 lt!596797 lt!596798)) lt!596799))))

(assert (=> b!1350231 (= lt!596800 (addStillNotContains!504 lt!596802 lt!596797 lt!596798 lt!596799))))

(assert (=> b!1350231 (= lt!596799 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1350231 (= lt!596798 (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1350231 (= lt!596797 (select (arr!44494 _keys!1571) from!1960))))

(assert (=> b!1350231 (= lt!596802 call!65216)))

(assert (=> b!1350231 (= e!768209 (+!4889 call!65216 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1350232 () Bool)

(assert (=> b!1350232 (= e!768208 e!768209)))

(declare-fun c!126899 () Bool)

(assert (=> b!1350232 (= c!126899 (validKeyInArray!0 (select (arr!44494 _keys!1571) from!1960)))))

(declare-fun b!1350233 () Bool)

(declare-fun res!895478 () Bool)

(assert (=> b!1350233 (=> (not res!895478) (not e!768205))))

(assert (=> b!1350233 (= res!895478 (not (contains!9226 lt!596796 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144989 c!126898) b!1350222))

(assert (= (and d!144989 (not c!126898)) b!1350232))

(assert (= (and b!1350232 c!126899) b!1350231))

(assert (= (and b!1350232 (not c!126899)) b!1350223))

(assert (= (or b!1350231 b!1350223) bm!65213))

(assert (= (and d!144989 res!895476) b!1350233))

(assert (= (and b!1350233 res!895478) b!1350228))

(assert (= (and b!1350228 res!895477) b!1350225))

(assert (= (and b!1350228 c!126900) b!1350224))

(assert (= (and b!1350228 (not c!126900)) b!1350227))

(assert (= (and b!1350224 res!895475) b!1350230))

(assert (= (and b!1350227 c!126901) b!1350229))

(assert (= (and b!1350227 (not c!126901)) b!1350226))

(declare-fun b_lambda!24667 () Bool)

(assert (=> (not b_lambda!24667) (not b!1350230)))

(assert (=> b!1350230 t!46142))

(declare-fun b_and!50951 () Bool)

(assert (= b_and!50949 (and (=> t!46142 result!25973) b_and!50951)))

(declare-fun b_lambda!24669 () Bool)

(assert (=> (not b_lambda!24669) (not b!1350231)))

(assert (=> b!1350231 t!46142))

(declare-fun b_and!50953 () Bool)

(assert (= b_and!50951 (and (=> t!46142 result!25973) b_and!50953)))

(assert (=> b!1350225 m!1237277))

(assert (=> b!1350225 m!1237277))

(assert (=> b!1350225 m!1237279))

(declare-fun m!1237539 () Bool)

(assert (=> b!1350229 m!1237539))

(assert (=> b!1350232 m!1237277))

(assert (=> b!1350232 m!1237277))

(assert (=> b!1350232 m!1237279))

(assert (=> bm!65213 m!1237539))

(declare-fun m!1237541 () Bool)

(assert (=> b!1350226 m!1237541))

(declare-fun m!1237543 () Bool)

(assert (=> d!144989 m!1237543))

(assert (=> d!144989 m!1237289))

(assert (=> b!1350230 m!1237277))

(declare-fun m!1237545 () Bool)

(assert (=> b!1350230 m!1237545))

(assert (=> b!1350230 m!1237297))

(assert (=> b!1350230 m!1237299))

(assert (=> b!1350230 m!1237301))

(assert (=> b!1350230 m!1237299))

(assert (=> b!1350230 m!1237277))

(assert (=> b!1350230 m!1237297))

(assert (=> b!1350231 m!1237297))

(assert (=> b!1350231 m!1237299))

(assert (=> b!1350231 m!1237301))

(declare-fun m!1237547 () Bool)

(assert (=> b!1350231 m!1237547))

(declare-fun m!1237549 () Bool)

(assert (=> b!1350231 m!1237549))

(assert (=> b!1350231 m!1237547))

(assert (=> b!1350231 m!1237299))

(declare-fun m!1237551 () Bool)

(assert (=> b!1350231 m!1237551))

(declare-fun m!1237553 () Bool)

(assert (=> b!1350231 m!1237553))

(assert (=> b!1350231 m!1237277))

(assert (=> b!1350231 m!1237297))

(assert (=> b!1350224 m!1237277))

(assert (=> b!1350224 m!1237277))

(declare-fun m!1237555 () Bool)

(assert (=> b!1350224 m!1237555))

(declare-fun m!1237557 () Bool)

(assert (=> b!1350233 m!1237557))

(assert (=> b!1350181 d!144989))

(declare-fun d!144991 () Bool)

(declare-fun e!768212 () Bool)

(assert (=> d!144991 e!768212))

(declare-fun res!895479 () Bool)

(assert (=> d!144991 (=> (not res!895479) (not e!768212))))

(declare-fun lt!596803 () ListLongMap!22039)

(assert (=> d!144991 (= res!895479 (contains!9226 lt!596803 (_1!12198 (tuple2!24375 lt!596752 minValue!1245))))))

(declare-fun lt!596804 () List!31511)

(assert (=> d!144991 (= lt!596803 (ListLongMap!22040 lt!596804))))

(declare-fun lt!596805 () Unit!44120)

(declare-fun lt!596806 () Unit!44120)

(assert (=> d!144991 (= lt!596805 lt!596806)))

(assert (=> d!144991 (= (getValueByKey!718 lt!596804 (_1!12198 (tuple2!24375 lt!596752 minValue!1245))) (Some!768 (_2!12198 (tuple2!24375 lt!596752 minValue!1245))))))

(assert (=> d!144991 (= lt!596806 (lemmaContainsTupThenGetReturnValue!368 lt!596804 (_1!12198 (tuple2!24375 lt!596752 minValue!1245)) (_2!12198 (tuple2!24375 lt!596752 minValue!1245))))))

(assert (=> d!144991 (= lt!596804 (insertStrictlySorted!497 (toList!11035 lt!596747) (_1!12198 (tuple2!24375 lt!596752 minValue!1245)) (_2!12198 (tuple2!24375 lt!596752 minValue!1245))))))

(assert (=> d!144991 (= (+!4889 lt!596747 (tuple2!24375 lt!596752 minValue!1245)) lt!596803)))

(declare-fun b!1350234 () Bool)

(declare-fun res!895480 () Bool)

(assert (=> b!1350234 (=> (not res!895480) (not e!768212))))

(assert (=> b!1350234 (= res!895480 (= (getValueByKey!718 (toList!11035 lt!596803) (_1!12198 (tuple2!24375 lt!596752 minValue!1245))) (Some!768 (_2!12198 (tuple2!24375 lt!596752 minValue!1245)))))))

(declare-fun b!1350235 () Bool)

(assert (=> b!1350235 (= e!768212 (contains!9229 (toList!11035 lt!596803) (tuple2!24375 lt!596752 minValue!1245)))))

(assert (= (and d!144991 res!895479) b!1350234))

(assert (= (and b!1350234 res!895480) b!1350235))

(declare-fun m!1237559 () Bool)

(assert (=> d!144991 m!1237559))

(declare-fun m!1237561 () Bool)

(assert (=> d!144991 m!1237561))

(declare-fun m!1237563 () Bool)

(assert (=> d!144991 m!1237563))

(declare-fun m!1237565 () Bool)

(assert (=> d!144991 m!1237565))

(declare-fun m!1237567 () Bool)

(assert (=> b!1350234 m!1237567))

(declare-fun m!1237569 () Bool)

(assert (=> b!1350235 m!1237569))

(assert (=> b!1350181 d!144991))

(declare-fun d!144993 () Bool)

(declare-fun get!22499 (Option!769) V!55201)

(assert (=> d!144993 (= (apply!1048 lt!596763 lt!596759) (get!22499 (getValueByKey!718 (toList!11035 lt!596763) lt!596759)))))

(declare-fun bs!38678 () Bool)

(assert (= bs!38678 d!144993))

(declare-fun m!1237571 () Bool)

(assert (=> bs!38678 m!1237571))

(assert (=> bs!38678 m!1237571))

(declare-fun m!1237573 () Bool)

(assert (=> bs!38678 m!1237573))

(assert (=> b!1350181 d!144993))

(declare-fun d!144995 () Bool)

(assert (=> d!144995 (= (apply!1048 (+!4889 lt!596763 (tuple2!24375 lt!596753 zeroValue!1245)) lt!596759) (get!22499 (getValueByKey!718 (toList!11035 (+!4889 lt!596763 (tuple2!24375 lt!596753 zeroValue!1245))) lt!596759)))))

(declare-fun bs!38679 () Bool)

(assert (= bs!38679 d!144995))

(declare-fun m!1237575 () Bool)

(assert (=> bs!38679 m!1237575))

(assert (=> bs!38679 m!1237575))

(declare-fun m!1237577 () Bool)

(assert (=> bs!38679 m!1237577))

(assert (=> b!1350181 d!144995))

(declare-fun d!144997 () Bool)

(assert (=> d!144997 (= (apply!1048 lt!596747 lt!596766) (get!22499 (getValueByKey!718 (toList!11035 lt!596747) lt!596766)))))

(declare-fun bs!38680 () Bool)

(assert (= bs!38680 d!144997))

(declare-fun m!1237579 () Bool)

(assert (=> bs!38680 m!1237579))

(assert (=> bs!38680 m!1237579))

(declare-fun m!1237581 () Bool)

(assert (=> bs!38680 m!1237581))

(assert (=> b!1350181 d!144997))

(declare-fun d!144999 () Bool)

(assert (=> d!144999 (= (apply!1048 (+!4889 lt!596747 (tuple2!24375 lt!596752 minValue!1245)) lt!596766) (get!22499 (getValueByKey!718 (toList!11035 (+!4889 lt!596747 (tuple2!24375 lt!596752 minValue!1245))) lt!596766)))))

(declare-fun bs!38681 () Bool)

(assert (= bs!38681 d!144999))

(declare-fun m!1237583 () Bool)

(assert (=> bs!38681 m!1237583))

(assert (=> bs!38681 m!1237583))

(declare-fun m!1237585 () Bool)

(assert (=> bs!38681 m!1237585))

(assert (=> b!1350181 d!144999))

(declare-fun d!145001 () Bool)

(declare-fun e!768213 () Bool)

(assert (=> d!145001 e!768213))

(declare-fun res!895481 () Bool)

(assert (=> d!145001 (=> (not res!895481) (not e!768213))))

(declare-fun lt!596807 () ListLongMap!22039)

(assert (=> d!145001 (= res!895481 (contains!9226 lt!596807 (_1!12198 (tuple2!24375 lt!596753 zeroValue!1245))))))

(declare-fun lt!596808 () List!31511)

(assert (=> d!145001 (= lt!596807 (ListLongMap!22040 lt!596808))))

(declare-fun lt!596809 () Unit!44120)

(declare-fun lt!596810 () Unit!44120)

(assert (=> d!145001 (= lt!596809 lt!596810)))

(assert (=> d!145001 (= (getValueByKey!718 lt!596808 (_1!12198 (tuple2!24375 lt!596753 zeroValue!1245))) (Some!768 (_2!12198 (tuple2!24375 lt!596753 zeroValue!1245))))))

(assert (=> d!145001 (= lt!596810 (lemmaContainsTupThenGetReturnValue!368 lt!596808 (_1!12198 (tuple2!24375 lt!596753 zeroValue!1245)) (_2!12198 (tuple2!24375 lt!596753 zeroValue!1245))))))

(assert (=> d!145001 (= lt!596808 (insertStrictlySorted!497 (toList!11035 lt!596763) (_1!12198 (tuple2!24375 lt!596753 zeroValue!1245)) (_2!12198 (tuple2!24375 lt!596753 zeroValue!1245))))))

(assert (=> d!145001 (= (+!4889 lt!596763 (tuple2!24375 lt!596753 zeroValue!1245)) lt!596807)))

(declare-fun b!1350236 () Bool)

(declare-fun res!895482 () Bool)

(assert (=> b!1350236 (=> (not res!895482) (not e!768213))))

(assert (=> b!1350236 (= res!895482 (= (getValueByKey!718 (toList!11035 lt!596807) (_1!12198 (tuple2!24375 lt!596753 zeroValue!1245))) (Some!768 (_2!12198 (tuple2!24375 lt!596753 zeroValue!1245)))))))

(declare-fun b!1350237 () Bool)

(assert (=> b!1350237 (= e!768213 (contains!9229 (toList!11035 lt!596807) (tuple2!24375 lt!596753 zeroValue!1245)))))

(assert (= (and d!145001 res!895481) b!1350236))

(assert (= (and b!1350236 res!895482) b!1350237))

(declare-fun m!1237587 () Bool)

(assert (=> d!145001 m!1237587))

(declare-fun m!1237589 () Bool)

(assert (=> d!145001 m!1237589))

(declare-fun m!1237591 () Bool)

(assert (=> d!145001 m!1237591))

(declare-fun m!1237593 () Bool)

(assert (=> d!145001 m!1237593))

(declare-fun m!1237595 () Bool)

(assert (=> b!1350236 m!1237595))

(declare-fun m!1237597 () Bool)

(assert (=> b!1350237 m!1237597))

(assert (=> b!1350181 d!145001))

(declare-fun d!145003 () Bool)

(assert (=> d!145003 (= (apply!1048 (+!4889 lt!596768 (tuple2!24375 lt!596761 minValue!1245)) lt!596755) (get!22499 (getValueByKey!718 (toList!11035 (+!4889 lt!596768 (tuple2!24375 lt!596761 minValue!1245))) lt!596755)))))

(declare-fun bs!38682 () Bool)

(assert (= bs!38682 d!145003))

(declare-fun m!1237599 () Bool)

(assert (=> bs!38682 m!1237599))

(assert (=> bs!38682 m!1237599))

(declare-fun m!1237601 () Bool)

(assert (=> bs!38682 m!1237601))

(assert (=> b!1350181 d!145003))

(declare-fun d!145005 () Bool)

(assert (=> d!145005 (= (apply!1048 (+!4889 lt!596763 (tuple2!24375 lt!596753 zeroValue!1245)) lt!596759) (apply!1048 lt!596763 lt!596759))))

(declare-fun lt!596811 () Unit!44120)

(assert (=> d!145005 (= lt!596811 (choose!1982 lt!596763 lt!596753 zeroValue!1245 lt!596759))))

(declare-fun e!768214 () Bool)

(assert (=> d!145005 e!768214))

(declare-fun res!895483 () Bool)

(assert (=> d!145005 (=> (not res!895483) (not e!768214))))

(assert (=> d!145005 (= res!895483 (contains!9226 lt!596763 lt!596759))))

(assert (=> d!145005 (= (addApplyDifferent!577 lt!596763 lt!596753 zeroValue!1245 lt!596759) lt!596811)))

(declare-fun b!1350238 () Bool)

(assert (=> b!1350238 (= e!768214 (not (= lt!596759 lt!596753)))))

(assert (= (and d!145005 res!895483) b!1350238))

(declare-fun m!1237603 () Bool)

(assert (=> d!145005 m!1237603))

(assert (=> d!145005 m!1237455))

(declare-fun m!1237605 () Bool)

(assert (=> d!145005 m!1237605))

(assert (=> d!145005 m!1237455))

(assert (=> d!145005 m!1237479))

(assert (=> d!145005 m!1237481))

(assert (=> b!1350181 d!145005))

(declare-fun d!145007 () Bool)

(assert (=> d!145007 (= (apply!1048 lt!596768 lt!596755) (get!22499 (getValueByKey!718 (toList!11035 lt!596768) lt!596755)))))

(declare-fun bs!38683 () Bool)

(assert (= bs!38683 d!145007))

(declare-fun m!1237607 () Bool)

(assert (=> bs!38683 m!1237607))

(assert (=> bs!38683 m!1237607))

(declare-fun m!1237609 () Bool)

(assert (=> bs!38683 m!1237609))

(assert (=> b!1350181 d!145007))

(declare-fun d!145009 () Bool)

(assert (=> d!145009 (= (apply!1048 (+!4889 lt!596768 (tuple2!24375 lt!596761 minValue!1245)) lt!596755) (apply!1048 lt!596768 lt!596755))))

(declare-fun lt!596812 () Unit!44120)

(assert (=> d!145009 (= lt!596812 (choose!1982 lt!596768 lt!596761 minValue!1245 lt!596755))))

(declare-fun e!768215 () Bool)

(assert (=> d!145009 e!768215))

(declare-fun res!895484 () Bool)

(assert (=> d!145009 (=> (not res!895484) (not e!768215))))

(assert (=> d!145009 (= res!895484 (contains!9226 lt!596768 lt!596755))))

(assert (=> d!145009 (= (addApplyDifferent!577 lt!596768 lt!596761 minValue!1245 lt!596755) lt!596812)))

(declare-fun b!1350239 () Bool)

(assert (=> b!1350239 (= e!768215 (not (= lt!596755 lt!596761)))))

(assert (= (and d!145009 res!895484) b!1350239))

(declare-fun m!1237611 () Bool)

(assert (=> d!145009 m!1237611))

(assert (=> d!145009 m!1237461))

(declare-fun m!1237613 () Bool)

(assert (=> d!145009 m!1237613))

(assert (=> d!145009 m!1237461))

(assert (=> d!145009 m!1237463))

(assert (=> d!145009 m!1237473))

(assert (=> b!1350181 d!145009))

(declare-fun d!145011 () Bool)

(declare-fun e!768216 () Bool)

(assert (=> d!145011 e!768216))

(declare-fun res!895485 () Bool)

(assert (=> d!145011 (=> res!895485 e!768216)))

(declare-fun lt!596815 () Bool)

(assert (=> d!145011 (= res!895485 (not lt!596815))))

(declare-fun lt!596813 () Bool)

(assert (=> d!145011 (= lt!596815 lt!596813)))

(declare-fun lt!596816 () Unit!44120)

(declare-fun e!768217 () Unit!44120)

(assert (=> d!145011 (= lt!596816 e!768217)))

(declare-fun c!126902 () Bool)

(assert (=> d!145011 (= c!126902 lt!596813)))

(assert (=> d!145011 (= lt!596813 (containsKey!744 (toList!11035 lt!596674) (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!145011 (= (contains!9226 lt!596674 (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!596815)))

(declare-fun b!1350240 () Bool)

(declare-fun lt!596814 () Unit!44120)

(assert (=> b!1350240 (= e!768217 lt!596814)))

(assert (=> b!1350240 (= lt!596814 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11035 lt!596674) (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!1350240 (isDefined!527 (getValueByKey!718 (toList!11035 lt!596674) (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1350241 () Bool)

(declare-fun Unit!44126 () Unit!44120)

(assert (=> b!1350241 (= e!768217 Unit!44126)))

(declare-fun b!1350242 () Bool)

(assert (=> b!1350242 (= e!768216 (isDefined!527 (getValueByKey!718 (toList!11035 lt!596674) (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!145011 c!126902) b!1350240))

(assert (= (and d!145011 (not c!126902)) b!1350241))

(assert (= (and d!145011 (not res!895485)) b!1350242))

(declare-fun m!1237615 () Bool)

(assert (=> d!145011 m!1237615))

(declare-fun m!1237617 () Bool)

(assert (=> b!1350240 m!1237617))

(assert (=> b!1350240 m!1237389))

(assert (=> b!1350240 m!1237389))

(declare-fun m!1237619 () Bool)

(assert (=> b!1350240 m!1237619))

(assert (=> b!1350242 m!1237389))

(assert (=> b!1350242 m!1237389))

(assert (=> b!1350242 m!1237619))

(assert (=> d!144957 d!145011))

(declare-fun b!1350254 () Bool)

(declare-fun e!768223 () Option!769)

(assert (=> b!1350254 (= e!768223 None!767)))

(declare-fun b!1350251 () Bool)

(declare-fun e!768222 () Option!769)

(assert (=> b!1350251 (= e!768222 (Some!768 (_2!12198 (h!32725 lt!596675))))))

(declare-fun b!1350252 () Bool)

(assert (=> b!1350252 (= e!768222 e!768223)))

(declare-fun c!126908 () Bool)

(assert (=> b!1350252 (= c!126908 (and ((_ is Cons!31507) lt!596675) (not (= (_1!12198 (h!32725 lt!596675)) (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun d!145013 () Bool)

(declare-fun c!126907 () Bool)

(assert (=> d!145013 (= c!126907 (and ((_ is Cons!31507) lt!596675) (= (_1!12198 (h!32725 lt!596675)) (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!145013 (= (getValueByKey!718 lt!596675 (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!768222)))

(declare-fun b!1350253 () Bool)

(assert (=> b!1350253 (= e!768223 (getValueByKey!718 (t!46143 lt!596675) (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!145013 c!126907) b!1350251))

(assert (= (and d!145013 (not c!126907)) b!1350252))

(assert (= (and b!1350252 c!126908) b!1350253))

(assert (= (and b!1350252 (not c!126908)) b!1350254))

(declare-fun m!1237621 () Bool)

(assert (=> b!1350253 m!1237621))

(assert (=> d!144957 d!145013))

(declare-fun d!145015 () Bool)

(assert (=> d!145015 (= (getValueByKey!718 lt!596675 (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!768 (_2!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!596819 () Unit!44120)

(declare-fun choose!1983 (List!31511 (_ BitVec 64) V!55201) Unit!44120)

(assert (=> d!145015 (= lt!596819 (choose!1983 lt!596675 (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!768226 () Bool)

(assert (=> d!145015 e!768226))

(declare-fun res!895490 () Bool)

(assert (=> d!145015 (=> (not res!895490) (not e!768226))))

(declare-fun isStrictlySorted!871 (List!31511) Bool)

(assert (=> d!145015 (= res!895490 (isStrictlySorted!871 lt!596675))))

(assert (=> d!145015 (= (lemmaContainsTupThenGetReturnValue!368 lt!596675 (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!596819)))

(declare-fun b!1350259 () Bool)

(declare-fun res!895491 () Bool)

(assert (=> b!1350259 (=> (not res!895491) (not e!768226))))

(assert (=> b!1350259 (= res!895491 (containsKey!744 lt!596675 (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1350260 () Bool)

(assert (=> b!1350260 (= e!768226 (contains!9229 lt!596675 (tuple2!24375 (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!145015 res!895490) b!1350259))

(assert (= (and b!1350259 res!895491) b!1350260))

(assert (=> d!145015 m!1237383))

(declare-fun m!1237623 () Bool)

(assert (=> d!145015 m!1237623))

(declare-fun m!1237625 () Bool)

(assert (=> d!145015 m!1237625))

(declare-fun m!1237627 () Bool)

(assert (=> b!1350259 m!1237627))

(declare-fun m!1237629 () Bool)

(assert (=> b!1350260 m!1237629))

(assert (=> d!144957 d!145015))

(declare-fun c!126917 () Bool)

(declare-fun e!768238 () List!31511)

(declare-fun b!1350281 () Bool)

(declare-fun c!126919 () Bool)

(assert (=> b!1350281 (= e!768238 (ite c!126917 (t!46143 (toList!11035 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (ite c!126919 (Cons!31507 (h!32725 (toList!11035 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (t!46143 (toList!11035 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) Nil!31508)))))

(declare-fun bm!65220 () Bool)

(declare-fun call!65223 () List!31511)

(declare-fun call!65224 () List!31511)

(assert (=> bm!65220 (= call!65223 call!65224)))

(declare-fun b!1350282 () Bool)

(assert (=> b!1350282 (= e!768238 (insertStrictlySorted!497 (t!46143 (toList!11035 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!596822 () List!31511)

(declare-fun e!768241 () Bool)

(declare-fun b!1350283 () Bool)

(assert (=> b!1350283 (= e!768241 (contains!9229 lt!596822 (tuple2!24375 (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1350284 () Bool)

(declare-fun e!768237 () List!31511)

(declare-fun e!768240 () List!31511)

(assert (=> b!1350284 (= e!768237 e!768240)))

(assert (=> b!1350284 (= c!126917 (and ((_ is Cons!31507) (toList!11035 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (= (_1!12198 (h!32725 (toList!11035 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun c!126918 () Bool)

(declare-fun bm!65221 () Bool)

(declare-fun $colon$colon!672 (List!31511 tuple2!24374) List!31511)

(assert (=> bm!65221 (= call!65224 ($colon$colon!672 e!768238 (ite c!126918 (h!32725 (toList!11035 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (tuple2!24375 (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!126920 () Bool)

(assert (=> bm!65221 (= c!126920 c!126918)))

(declare-fun b!1350285 () Bool)

(declare-fun e!768239 () List!31511)

(declare-fun call!65225 () List!31511)

(assert (=> b!1350285 (= e!768239 call!65225)))

(declare-fun d!145017 () Bool)

(assert (=> d!145017 e!768241))

(declare-fun res!895496 () Bool)

(assert (=> d!145017 (=> (not res!895496) (not e!768241))))

(assert (=> d!145017 (= res!895496 (isStrictlySorted!871 lt!596822))))

(assert (=> d!145017 (= lt!596822 e!768237)))

(assert (=> d!145017 (= c!126918 (and ((_ is Cons!31507) (toList!11035 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (bvslt (_1!12198 (h!32725 (toList!11035 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!145017 (isStrictlySorted!871 (toList!11035 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))))

(assert (=> d!145017 (= (insertStrictlySorted!497 (toList!11035 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!596822)))

(declare-fun b!1350286 () Bool)

(assert (=> b!1350286 (= e!768239 call!65225)))

(declare-fun bm!65222 () Bool)

(assert (=> bm!65222 (= call!65225 call!65223)))

(declare-fun b!1350287 () Bool)

(assert (=> b!1350287 (= e!768240 call!65223)))

(declare-fun b!1350288 () Bool)

(assert (=> b!1350288 (= e!768237 call!65224)))

(declare-fun b!1350289 () Bool)

(assert (=> b!1350289 (= c!126919 (and ((_ is Cons!31507) (toList!11035 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (bvsgt (_1!12198 (h!32725 (toList!11035 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!1350289 (= e!768240 e!768239)))

(declare-fun b!1350290 () Bool)

(declare-fun res!895497 () Bool)

(assert (=> b!1350290 (=> (not res!895497) (not e!768241))))

(assert (=> b!1350290 (= res!895497 (containsKey!744 lt!596822 (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!145017 c!126918) b!1350288))

(assert (= (and d!145017 (not c!126918)) b!1350284))

(assert (= (and b!1350284 c!126917) b!1350287))

(assert (= (and b!1350284 (not c!126917)) b!1350289))

(assert (= (and b!1350289 c!126919) b!1350286))

(assert (= (and b!1350289 (not c!126919)) b!1350285))

(assert (= (or b!1350286 b!1350285) bm!65222))

(assert (= (or b!1350287 bm!65222) bm!65220))

(assert (= (or b!1350288 bm!65220) bm!65221))

(assert (= (and bm!65221 c!126920) b!1350282))

(assert (= (and bm!65221 (not c!126920)) b!1350281))

(assert (= (and d!145017 res!895496) b!1350290))

(assert (= (and b!1350290 res!895497) b!1350283))

(declare-fun m!1237631 () Bool)

(assert (=> b!1350282 m!1237631))

(declare-fun m!1237633 () Bool)

(assert (=> b!1350283 m!1237633))

(declare-fun m!1237635 () Bool)

(assert (=> b!1350290 m!1237635))

(declare-fun m!1237637 () Bool)

(assert (=> bm!65221 m!1237637))

(declare-fun m!1237639 () Bool)

(assert (=> d!145017 m!1237639))

(declare-fun m!1237641 () Bool)

(assert (=> d!145017 m!1237641))

(assert (=> d!144957 d!145017))

(assert (=> d!144973 d!144965))

(assert (=> b!1350183 d!144975))

(declare-fun d!145019 () Bool)

(declare-fun e!768242 () Bool)

(assert (=> d!145019 e!768242))

(declare-fun res!895498 () Bool)

(assert (=> d!145019 (=> res!895498 e!768242)))

(declare-fun lt!596825 () Bool)

(assert (=> d!145019 (= res!895498 (not lt!596825))))

(declare-fun lt!596823 () Bool)

(assert (=> d!145019 (= lt!596825 lt!596823)))

(declare-fun lt!596826 () Unit!44120)

(declare-fun e!768243 () Unit!44120)

(assert (=> d!145019 (= lt!596826 e!768243)))

(declare-fun c!126921 () Bool)

(assert (=> d!145019 (= c!126921 lt!596823)))

(assert (=> d!145019 (= lt!596823 (containsKey!744 (toList!11035 lt!596767) (select (arr!44494 _keys!1571) from!1960)))))

(assert (=> d!145019 (= (contains!9226 lt!596767 (select (arr!44494 _keys!1571) from!1960)) lt!596825)))

(declare-fun b!1350291 () Bool)

(declare-fun lt!596824 () Unit!44120)

(assert (=> b!1350291 (= e!768243 lt!596824)))

(assert (=> b!1350291 (= lt!596824 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11035 lt!596767) (select (arr!44494 _keys!1571) from!1960)))))

(assert (=> b!1350291 (isDefined!527 (getValueByKey!718 (toList!11035 lt!596767) (select (arr!44494 _keys!1571) from!1960)))))

(declare-fun b!1350292 () Bool)

(declare-fun Unit!44127 () Unit!44120)

(assert (=> b!1350292 (= e!768243 Unit!44127)))

(declare-fun b!1350293 () Bool)

(assert (=> b!1350293 (= e!768242 (isDefined!527 (getValueByKey!718 (toList!11035 lt!596767) (select (arr!44494 _keys!1571) from!1960))))))

(assert (= (and d!145019 c!126921) b!1350291))

(assert (= (and d!145019 (not c!126921)) b!1350292))

(assert (= (and d!145019 (not res!895498)) b!1350293))

(assert (=> d!145019 m!1237277))

(declare-fun m!1237643 () Bool)

(assert (=> d!145019 m!1237643))

(assert (=> b!1350291 m!1237277))

(declare-fun m!1237645 () Bool)

(assert (=> b!1350291 m!1237645))

(assert (=> b!1350291 m!1237277))

(declare-fun m!1237647 () Bool)

(assert (=> b!1350291 m!1237647))

(assert (=> b!1350291 m!1237647))

(declare-fun m!1237649 () Bool)

(assert (=> b!1350291 m!1237649))

(assert (=> b!1350293 m!1237277))

(assert (=> b!1350293 m!1237647))

(assert (=> b!1350293 m!1237647))

(assert (=> b!1350293 m!1237649))

(assert (=> b!1350182 d!145019))

(declare-fun d!145021 () Bool)

(declare-fun res!895503 () Bool)

(declare-fun e!768248 () Bool)

(assert (=> d!145021 (=> res!895503 e!768248)))

(assert (=> d!145021 (= res!895503 (and ((_ is Cons!31507) (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (= (_1!12198 (h!32725 (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1142)))))

(assert (=> d!145021 (= (containsKey!744 (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142) e!768248)))

(declare-fun b!1350298 () Bool)

(declare-fun e!768249 () Bool)

(assert (=> b!1350298 (= e!768248 e!768249)))

(declare-fun res!895504 () Bool)

(assert (=> b!1350298 (=> (not res!895504) (not e!768249))))

(assert (=> b!1350298 (= res!895504 (and (or (not ((_ is Cons!31507) (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (bvsle (_1!12198 (h!32725 (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1142)) ((_ is Cons!31507) (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvslt (_1!12198 (h!32725 (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1142)))))

(declare-fun b!1350299 () Bool)

(assert (=> b!1350299 (= e!768249 (containsKey!744 (t!46143 (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) k0!1142))))

(assert (= (and d!145021 (not res!895503)) b!1350298))

(assert (= (and b!1350298 res!895504) b!1350299))

(declare-fun m!1237651 () Bool)

(assert (=> b!1350299 m!1237651))

(assert (=> d!144955 d!145021))

(declare-fun d!145023 () Bool)

(declare-fun e!768250 () Bool)

(assert (=> d!145023 e!768250))

(declare-fun res!895505 () Bool)

(assert (=> d!145023 (=> res!895505 e!768250)))

(declare-fun lt!596829 () Bool)

(assert (=> d!145023 (= res!895505 (not lt!596829))))

(declare-fun lt!596827 () Bool)

(assert (=> d!145023 (= lt!596829 lt!596827)))

(declare-fun lt!596830 () Unit!44120)

(declare-fun e!768251 () Unit!44120)

(assert (=> d!145023 (= lt!596830 e!768251)))

(declare-fun c!126922 () Bool)

(assert (=> d!145023 (= c!126922 lt!596827)))

(assert (=> d!145023 (= lt!596827 (containsKey!744 (toList!11035 lt!596767) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!145023 (= (contains!9226 lt!596767 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596829)))

(declare-fun b!1350300 () Bool)

(declare-fun lt!596828 () Unit!44120)

(assert (=> b!1350300 (= e!768251 lt!596828)))

(assert (=> b!1350300 (= lt!596828 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11035 lt!596767) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1350300 (isDefined!527 (getValueByKey!718 (toList!11035 lt!596767) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350301 () Bool)

(declare-fun Unit!44128 () Unit!44120)

(assert (=> b!1350301 (= e!768251 Unit!44128)))

(declare-fun b!1350302 () Bool)

(assert (=> b!1350302 (= e!768250 (isDefined!527 (getValueByKey!718 (toList!11035 lt!596767) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!145023 c!126922) b!1350300))

(assert (= (and d!145023 (not c!126922)) b!1350301))

(assert (= (and d!145023 (not res!895505)) b!1350302))

(declare-fun m!1237653 () Bool)

(assert (=> d!145023 m!1237653))

(declare-fun m!1237655 () Bool)

(assert (=> b!1350300 m!1237655))

(declare-fun m!1237657 () Bool)

(assert (=> b!1350300 m!1237657))

(assert (=> b!1350300 m!1237657))

(declare-fun m!1237659 () Bool)

(assert (=> b!1350300 m!1237659))

(assert (=> b!1350302 m!1237657))

(assert (=> b!1350302 m!1237657))

(assert (=> b!1350302 m!1237659))

(assert (=> bm!65206 d!145023))

(declare-fun d!145025 () Bool)

(assert (=> d!145025 (= (validKeyInArray!0 (select (arr!44494 _keys!1571) #b00000000000000000000000000000000)) (and (not (= (select (arr!44494 _keys!1571) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44494 _keys!1571) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1350123 d!145025))

(declare-fun d!145027 () Bool)

(assert (=> d!145027 (= (get!22497 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!21508 (select (arr!44495 _values!1303) from!1960)))))

(assert (=> b!1350107 d!145027))

(declare-fun d!145029 () Bool)

(assert (=> d!145029 (= (apply!1048 lt!596767 (select (arr!44494 _keys!1571) from!1960)) (get!22499 (getValueByKey!718 (toList!11035 lt!596767) (select (arr!44494 _keys!1571) from!1960))))))

(declare-fun bs!38684 () Bool)

(assert (= bs!38684 d!145029))

(assert (=> bs!38684 m!1237277))

(assert (=> bs!38684 m!1237647))

(assert (=> bs!38684 m!1237647))

(declare-fun m!1237661 () Bool)

(assert (=> bs!38684 m!1237661))

(assert (=> b!1350169 d!145029))

(assert (=> b!1350169 d!144961))

(declare-fun d!145031 () Bool)

(declare-fun e!768252 () Bool)

(assert (=> d!145031 e!768252))

(declare-fun res!895506 () Bool)

(assert (=> d!145031 (=> res!895506 e!768252)))

(declare-fun lt!596833 () Bool)

(assert (=> d!145031 (= res!895506 (not lt!596833))))

(declare-fun lt!596831 () Bool)

(assert (=> d!145031 (= lt!596833 lt!596831)))

(declare-fun lt!596834 () Unit!44120)

(declare-fun e!768253 () Unit!44120)

(assert (=> d!145031 (= lt!596834 e!768253)))

(declare-fun c!126923 () Bool)

(assert (=> d!145031 (= c!126923 lt!596831)))

(assert (=> d!145031 (= lt!596831 (containsKey!744 (toList!11035 lt!596692) (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> d!145031 (= (contains!9226 lt!596692 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) lt!596833)))

(declare-fun b!1350303 () Bool)

(declare-fun lt!596832 () Unit!44120)

(assert (=> b!1350303 (= e!768253 lt!596832)))

(assert (=> b!1350303 (= lt!596832 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11035 lt!596692) (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1350303 (isDefined!527 (getValueByKey!718 (toList!11035 lt!596692) (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1350304 () Bool)

(declare-fun Unit!44129 () Unit!44120)

(assert (=> b!1350304 (= e!768253 Unit!44129)))

(declare-fun b!1350305 () Bool)

(assert (=> b!1350305 (= e!768252 (isDefined!527 (getValueByKey!718 (toList!11035 lt!596692) (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))))

(assert (= (and d!145031 c!126923) b!1350303))

(assert (= (and d!145031 (not c!126923)) b!1350304))

(assert (= (and d!145031 (not res!895506)) b!1350305))

(assert (=> d!145031 m!1237393))

(declare-fun m!1237663 () Bool)

(assert (=> d!145031 m!1237663))

(assert (=> b!1350303 m!1237393))

(declare-fun m!1237665 () Bool)

(assert (=> b!1350303 m!1237665))

(assert (=> b!1350303 m!1237393))

(declare-fun m!1237667 () Bool)

(assert (=> b!1350303 m!1237667))

(assert (=> b!1350303 m!1237667))

(declare-fun m!1237669 () Bool)

(assert (=> b!1350303 m!1237669))

(assert (=> b!1350305 m!1237393))

(assert (=> b!1350305 m!1237667))

(assert (=> b!1350305 m!1237667))

(assert (=> b!1350305 m!1237669))

(assert (=> b!1350093 d!145031))

(declare-fun d!145033 () Bool)

(assert (=> d!145033 (= (get!22498 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1350108 d!145033))

(declare-fun d!145035 () Bool)

(declare-fun res!895507 () Bool)

(declare-fun e!768254 () Bool)

(assert (=> d!145035 (=> res!895507 e!768254)))

(assert (=> d!145035 (= res!895507 (and ((_ is Cons!31507) (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (= (_1!12198 (h!32725 (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(assert (=> d!145035 (= (containsKey!744 (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) e!768254)))

(declare-fun b!1350306 () Bool)

(declare-fun e!768255 () Bool)

(assert (=> b!1350306 (= e!768254 e!768255)))

(declare-fun res!895508 () Bool)

(assert (=> b!1350306 (=> (not res!895508) (not e!768255))))

(assert (=> b!1350306 (= res!895508 (and (or (not ((_ is Cons!31507) (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) (bvsle (_1!12198 (h!32725 (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)) ((_ is Cons!31507) (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (bvslt (_1!12198 (h!32725 (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(declare-fun b!1350307 () Bool)

(assert (=> b!1350307 (= e!768255 (containsKey!744 (t!46143 (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) k0!1142))))

(assert (= (and d!145035 (not res!895507)) b!1350306))

(assert (= (and b!1350306 res!895508) b!1350307))

(declare-fun m!1237671 () Bool)

(assert (=> b!1350307 m!1237671))

(assert (=> d!144971 d!145035))

(declare-fun d!145037 () Bool)

(declare-fun e!768256 () Bool)

(assert (=> d!145037 e!768256))

(declare-fun res!895509 () Bool)

(assert (=> d!145037 (=> res!895509 e!768256)))

(declare-fun lt!596837 () Bool)

(assert (=> d!145037 (= res!895509 (not lt!596837))))

(declare-fun lt!596835 () Bool)

(assert (=> d!145037 (= lt!596837 lt!596835)))

(declare-fun lt!596838 () Unit!44120)

(declare-fun e!768257 () Unit!44120)

(assert (=> d!145037 (= lt!596838 e!768257)))

(declare-fun c!126924 () Bool)

(assert (=> d!145037 (= c!126924 lt!596835)))

(assert (=> d!145037 (= lt!596835 (containsKey!744 (toList!11035 lt!596692) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!145037 (= (contains!9226 lt!596692 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596837)))

(declare-fun b!1350308 () Bool)

(declare-fun lt!596836 () Unit!44120)

(assert (=> b!1350308 (= e!768257 lt!596836)))

(assert (=> b!1350308 (= lt!596836 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11035 lt!596692) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1350308 (isDefined!527 (getValueByKey!718 (toList!11035 lt!596692) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350309 () Bool)

(declare-fun Unit!44130 () Unit!44120)

(assert (=> b!1350309 (= e!768257 Unit!44130)))

(declare-fun b!1350310 () Bool)

(assert (=> b!1350310 (= e!768256 (isDefined!527 (getValueByKey!718 (toList!11035 lt!596692) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!145037 c!126924) b!1350308))

(assert (= (and d!145037 (not c!126924)) b!1350309))

(assert (= (and d!145037 (not res!895509)) b!1350310))

(declare-fun m!1237673 () Bool)

(assert (=> d!145037 m!1237673))

(declare-fun m!1237675 () Bool)

(assert (=> b!1350308 m!1237675))

(declare-fun m!1237677 () Bool)

(assert (=> b!1350308 m!1237677))

(assert (=> b!1350308 m!1237677))

(declare-fun m!1237679 () Bool)

(assert (=> b!1350308 m!1237679))

(assert (=> b!1350310 m!1237677))

(assert (=> b!1350310 m!1237677))

(assert (=> b!1350310 m!1237679))

(assert (=> d!144959 d!145037))

(assert (=> d!144959 d!144965))

(assert (=> bm!65207 d!144989))

(declare-fun d!145039 () Bool)

(assert (=> d!145039 (isDefined!527 (getValueByKey!718 (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142))))

(declare-fun lt!596841 () Unit!44120)

(declare-fun choose!1984 (List!31511 (_ BitVec 64)) Unit!44120)

(assert (=> d!145039 (= lt!596841 (choose!1984 (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142))))

(declare-fun e!768260 () Bool)

(assert (=> d!145039 e!768260))

(declare-fun res!895512 () Bool)

(assert (=> d!145039 (=> (not res!895512) (not e!768260))))

(assert (=> d!145039 (= res!895512 (isStrictlySorted!871 (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!145039 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142) lt!596841)))

(declare-fun b!1350313 () Bool)

(assert (=> b!1350313 (= e!768260 (containsKey!744 (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142))))

(assert (= (and d!145039 res!895512) b!1350313))

(assert (=> d!145039 m!1237377))

(assert (=> d!145039 m!1237377))

(assert (=> d!145039 m!1237379))

(declare-fun m!1237681 () Bool)

(assert (=> d!145039 m!1237681))

(declare-fun m!1237683 () Bool)

(assert (=> d!145039 m!1237683))

(assert (=> b!1350313 m!1237373))

(assert (=> b!1350058 d!145039))

(declare-fun d!145041 () Bool)

(declare-fun isEmpty!1100 (Option!769) Bool)

(assert (=> d!145041 (= (isDefined!527 (getValueByKey!718 (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142)) (not (isEmpty!1100 (getValueByKey!718 (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142))))))

(declare-fun bs!38685 () Bool)

(assert (= bs!38685 d!145041))

(assert (=> bs!38685 m!1237377))

(declare-fun m!1237685 () Bool)

(assert (=> bs!38685 m!1237685))

(assert (=> b!1350058 d!145041))

(declare-fun b!1350317 () Bool)

(declare-fun e!768262 () Option!769)

(assert (=> b!1350317 (= e!768262 None!767)))

(declare-fun e!768261 () Option!769)

(declare-fun b!1350314 () Bool)

(assert (=> b!1350314 (= e!768261 (Some!768 (_2!12198 (h!32725 (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun b!1350315 () Bool)

(assert (=> b!1350315 (= e!768261 e!768262)))

(declare-fun c!126926 () Bool)

(assert (=> b!1350315 (= c!126926 (and ((_ is Cons!31507) (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (not (= (_1!12198 (h!32725 (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1142))))))

(declare-fun d!145043 () Bool)

(declare-fun c!126925 () Bool)

(assert (=> d!145043 (= c!126925 (and ((_ is Cons!31507) (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (= (_1!12198 (h!32725 (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1142)))))

(assert (=> d!145043 (= (getValueByKey!718 (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142) e!768261)))

(declare-fun b!1350316 () Bool)

(assert (=> b!1350316 (= e!768262 (getValueByKey!718 (t!46143 (toList!11035 (+!4889 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) k0!1142))))

(assert (= (and d!145043 c!126925) b!1350314))

(assert (= (and d!145043 (not c!126925)) b!1350315))

(assert (= (and b!1350315 c!126926) b!1350316))

(assert (= (and b!1350315 (not c!126926)) b!1350317))

(declare-fun m!1237687 () Bool)

(assert (=> b!1350316 m!1237687))

(assert (=> b!1350058 d!145043))

(declare-fun d!145045 () Bool)

(assert (=> d!145045 (isDefined!527 (getValueByKey!718 (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun lt!596842 () Unit!44120)

(assert (=> d!145045 (= lt!596842 (choose!1984 (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun e!768263 () Bool)

(assert (=> d!145045 e!768263))

(declare-fun res!895513 () Bool)

(assert (=> d!145045 (=> (not res!895513) (not e!768263))))

(assert (=> d!145045 (= res!895513 (isStrictlySorted!871 (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))))

(assert (=> d!145045 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) lt!596842)))

(declare-fun b!1350318 () Bool)

(assert (=> b!1350318 (= e!768263 (containsKey!744 (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (= (and d!145045 res!895513) b!1350318))

(assert (=> d!145045 m!1237437))

(assert (=> d!145045 m!1237437))

(assert (=> d!145045 m!1237439))

(declare-fun m!1237689 () Bool)

(assert (=> d!145045 m!1237689))

(declare-fun m!1237691 () Bool)

(assert (=> d!145045 m!1237691))

(assert (=> b!1350318 m!1237433))

(assert (=> b!1350124 d!145045))

(declare-fun d!145047 () Bool)

(assert (=> d!145047 (= (isDefined!527 (getValueByKey!718 (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)) (not (isEmpty!1100 (getValueByKey!718 (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))))

(declare-fun bs!38686 () Bool)

(assert (= bs!38686 d!145047))

(assert (=> bs!38686 m!1237437))

(declare-fun m!1237693 () Bool)

(assert (=> bs!38686 m!1237693))

(assert (=> b!1350124 d!145047))

(declare-fun b!1350322 () Bool)

(declare-fun e!768265 () Option!769)

(assert (=> b!1350322 (= e!768265 None!767)))

(declare-fun e!768264 () Option!769)

(declare-fun b!1350319 () Bool)

(assert (=> b!1350319 (= e!768264 (Some!768 (_2!12198 (h!32725 (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))))))

(declare-fun b!1350320 () Bool)

(assert (=> b!1350320 (= e!768264 e!768265)))

(declare-fun c!126928 () Bool)

(assert (=> b!1350320 (= c!126928 (and ((_ is Cons!31507) (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (not (= (_1!12198 (h!32725 (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142))))))

(declare-fun d!145049 () Bool)

(declare-fun c!126927 () Bool)

(assert (=> d!145049 (= c!126927 (and ((_ is Cons!31507) (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (= (_1!12198 (h!32725 (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(assert (=> d!145049 (= (getValueByKey!718 (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) e!768264)))

(declare-fun b!1350321 () Bool)

(assert (=> b!1350321 (= e!768265 (getValueByKey!718 (t!46143 (toList!11035 (getCurrentListMap!5973 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) k0!1142))))

(assert (= (and d!145049 c!126927) b!1350319))

(assert (= (and d!145049 (not c!126927)) b!1350320))

(assert (= (and b!1350320 c!126928) b!1350321))

(assert (= (and b!1350320 (not c!126928)) b!1350322))

(declare-fun m!1237695 () Bool)

(assert (=> b!1350321 m!1237695))

(assert (=> b!1350124 d!145049))

(declare-fun d!145051 () Bool)

(declare-fun e!768266 () Bool)

(assert (=> d!145051 e!768266))

(declare-fun res!895514 () Bool)

(assert (=> d!145051 (=> (not res!895514) (not e!768266))))

(declare-fun lt!596843 () ListLongMap!22039)

(assert (=> d!145051 (= res!895514 (contains!9226 lt!596843 (_1!12198 (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun lt!596844 () List!31511)

(assert (=> d!145051 (= lt!596843 (ListLongMap!22040 lt!596844))))

(declare-fun lt!596845 () Unit!44120)

(declare-fun lt!596846 () Unit!44120)

(assert (=> d!145051 (= lt!596845 lt!596846)))

(assert (=> d!145051 (= (getValueByKey!718 lt!596844 (_1!12198 (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!768 (_2!12198 (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!145051 (= lt!596846 (lemmaContainsTupThenGetReturnValue!368 lt!596844 (_1!12198 (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12198 (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!145051 (= lt!596844 (insertStrictlySorted!497 (toList!11035 call!65211) (_1!12198 (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12198 (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!145051 (= (+!4889 call!65211 (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) lt!596843)))

(declare-fun b!1350323 () Bool)

(declare-fun res!895515 () Bool)

(assert (=> b!1350323 (=> (not res!895515) (not e!768266))))

(assert (=> b!1350323 (= res!895515 (= (getValueByKey!718 (toList!11035 lt!596843) (_1!12198 (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!768 (_2!12198 (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun b!1350324 () Bool)

(assert (=> b!1350324 (= e!768266 (contains!9229 (toList!11035 lt!596843) (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(assert (= (and d!145051 res!895514) b!1350323))

(assert (= (and b!1350323 res!895515) b!1350324))

(declare-fun m!1237697 () Bool)

(assert (=> d!145051 m!1237697))

(declare-fun m!1237699 () Bool)

(assert (=> d!145051 m!1237699))

(declare-fun m!1237701 () Bool)

(assert (=> d!145051 m!1237701))

(declare-fun m!1237703 () Bool)

(assert (=> d!145051 m!1237703))

(declare-fun m!1237705 () Bool)

(assert (=> b!1350323 m!1237705))

(declare-fun m!1237707 () Bool)

(assert (=> b!1350324 m!1237707))

(assert (=> b!1350173 d!145051))

(declare-fun d!145053 () Bool)

(declare-fun e!768267 () Bool)

(assert (=> d!145053 e!768267))

(declare-fun res!895516 () Bool)

(assert (=> d!145053 (=> res!895516 e!768267)))

(declare-fun lt!596849 () Bool)

(assert (=> d!145053 (= res!895516 (not lt!596849))))

(declare-fun lt!596847 () Bool)

(assert (=> d!145053 (= lt!596849 lt!596847)))

(declare-fun lt!596850 () Unit!44120)

(declare-fun e!768268 () Unit!44120)

(assert (=> d!145053 (= lt!596850 e!768268)))

(declare-fun c!126929 () Bool)

(assert (=> d!145053 (= c!126929 lt!596847)))

(assert (=> d!145053 (= lt!596847 (containsKey!744 (toList!11035 lt!596767) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!145053 (= (contains!9226 lt!596767 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596849)))

(declare-fun b!1350325 () Bool)

(declare-fun lt!596848 () Unit!44120)

(assert (=> b!1350325 (= e!768268 lt!596848)))

(assert (=> b!1350325 (= lt!596848 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11035 lt!596767) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1350325 (isDefined!527 (getValueByKey!718 (toList!11035 lt!596767) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350326 () Bool)

(declare-fun Unit!44131 () Unit!44120)

(assert (=> b!1350326 (= e!768268 Unit!44131)))

(declare-fun b!1350327 () Bool)

(assert (=> b!1350327 (= e!768267 (isDefined!527 (getValueByKey!718 (toList!11035 lt!596767) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!145053 c!126929) b!1350325))

(assert (= (and d!145053 (not c!126929)) b!1350326))

(assert (= (and d!145053 (not res!895516)) b!1350327))

(declare-fun m!1237709 () Bool)

(assert (=> d!145053 m!1237709))

(declare-fun m!1237711 () Bool)

(assert (=> b!1350325 m!1237711))

(declare-fun m!1237713 () Bool)

(assert (=> b!1350325 m!1237713))

(assert (=> b!1350325 m!1237713))

(declare-fun m!1237715 () Bool)

(assert (=> b!1350325 m!1237715))

(assert (=> b!1350327 m!1237713))

(assert (=> b!1350327 m!1237713))

(assert (=> b!1350327 m!1237715))

(assert (=> bm!65209 d!145053))

(declare-fun b!1350331 () Bool)

(declare-fun e!768270 () Option!769)

(assert (=> b!1350331 (= e!768270 None!767)))

(declare-fun b!1350328 () Bool)

(declare-fun e!768269 () Option!769)

(assert (=> b!1350328 (= e!768269 (Some!768 (_2!12198 (h!32725 (toList!11035 lt!596674)))))))

(declare-fun b!1350329 () Bool)

(assert (=> b!1350329 (= e!768269 e!768270)))

(declare-fun c!126931 () Bool)

(assert (=> b!1350329 (= c!126931 (and ((_ is Cons!31507) (toList!11035 lt!596674)) (not (= (_1!12198 (h!32725 (toList!11035 lt!596674))) (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun d!145055 () Bool)

(declare-fun c!126930 () Bool)

(assert (=> d!145055 (= c!126930 (and ((_ is Cons!31507) (toList!11035 lt!596674)) (= (_1!12198 (h!32725 (toList!11035 lt!596674))) (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!145055 (= (getValueByKey!718 (toList!11035 lt!596674) (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!768269)))

(declare-fun b!1350330 () Bool)

(assert (=> b!1350330 (= e!768270 (getValueByKey!718 (t!46143 (toList!11035 lt!596674)) (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!145055 c!126930) b!1350328))

(assert (= (and d!145055 (not c!126930)) b!1350329))

(assert (= (and b!1350329 c!126931) b!1350330))

(assert (= (and b!1350329 (not c!126931)) b!1350331))

(declare-fun m!1237717 () Bool)

(assert (=> b!1350330 m!1237717))

(assert (=> b!1350065 d!145055))

(declare-fun d!145057 () Bool)

(assert (=> d!145057 (= (apply!1048 lt!596767 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22499 (getValueByKey!718 (toList!11035 lt!596767) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38687 () Bool)

(assert (= bs!38687 d!145057))

(assert (=> bs!38687 m!1237713))

(assert (=> bs!38687 m!1237713))

(declare-fun m!1237719 () Bool)

(assert (=> bs!38687 m!1237719))

(assert (=> b!1350172 d!145057))

(declare-fun b!1350332 () Bool)

(declare-fun e!768274 () ListLongMap!22039)

(assert (=> b!1350332 (= e!768274 (ListLongMap!22040 Nil!31508))))

(declare-fun b!1350333 () Bool)

(declare-fun e!768275 () ListLongMap!22039)

(declare-fun call!65226 () ListLongMap!22039)

(assert (=> b!1350333 (= e!768275 call!65226)))

(declare-fun d!145059 () Bool)

(declare-fun e!768271 () Bool)

(assert (=> d!145059 e!768271))

(declare-fun res!895518 () Bool)

(assert (=> d!145059 (=> (not res!895518) (not e!768271))))

(declare-fun lt!596851 () ListLongMap!22039)

(assert (=> d!145059 (= res!895518 (not (contains!9226 lt!596851 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!145059 (= lt!596851 e!768274)))

(declare-fun c!126932 () Bool)

(assert (=> d!145059 (= c!126932 (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!45045 _keys!1571)))))

(assert (=> d!145059 (validMask!0 mask!1977)))

(assert (=> d!145059 (= (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306) lt!596851)))

(declare-fun b!1350334 () Bool)

(declare-fun e!768273 () Bool)

(declare-fun e!768276 () Bool)

(assert (=> b!1350334 (= e!768273 e!768276)))

(assert (=> b!1350334 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!45045 _keys!1571)))))

(declare-fun res!895517 () Bool)

(assert (=> b!1350334 (= res!895517 (contains!9226 lt!596851 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))))))

(assert (=> b!1350334 (=> (not res!895517) (not e!768276))))

(declare-fun b!1350335 () Bool)

(declare-fun e!768272 () Bool)

(assert (=> b!1350335 (= e!768272 (validKeyInArray!0 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))))))

(assert (=> b!1350335 (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1350336 () Bool)

(declare-fun e!768277 () Bool)

(assert (=> b!1350336 (= e!768277 (isEmpty!1099 lt!596851))))

(declare-fun b!1350337 () Bool)

(assert (=> b!1350337 (= e!768273 e!768277)))

(declare-fun c!126935 () Bool)

(assert (=> b!1350337 (= c!126935 (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!45045 _keys!1571)))))

(declare-fun b!1350338 () Bool)

(assert (=> b!1350338 (= e!768271 e!768273)))

(declare-fun c!126934 () Bool)

(assert (=> b!1350338 (= c!126934 e!768272)))

(declare-fun res!895519 () Bool)

(assert (=> b!1350338 (=> (not res!895519) (not e!768272))))

(assert (=> b!1350338 (= res!895519 (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!45045 _keys!1571)))))

(declare-fun b!1350339 () Bool)

(assert (=> b!1350339 (= e!768277 (= lt!596851 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun bm!65223 () Bool)

(assert (=> bm!65223 (= call!65226 (getCurrentListMapNoExtraKeys!6542 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1350340 () Bool)

(assert (=> b!1350340 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!45045 _keys!1571)))))

(assert (=> b!1350340 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!45046 _values!1303)))))

(assert (=> b!1350340 (= e!768276 (= (apply!1048 lt!596851 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))) (get!22494 (select (arr!44495 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1350341 () Bool)

(declare-fun lt!596856 () Unit!44120)

(declare-fun lt!596855 () Unit!44120)

(assert (=> b!1350341 (= lt!596856 lt!596855)))

(declare-fun lt!596857 () ListLongMap!22039)

(declare-fun lt!596854 () (_ BitVec 64))

(declare-fun lt!596852 () (_ BitVec 64))

(declare-fun lt!596853 () V!55201)

(assert (=> b!1350341 (not (contains!9226 (+!4889 lt!596857 (tuple2!24375 lt!596852 lt!596853)) lt!596854))))

(assert (=> b!1350341 (= lt!596855 (addStillNotContains!504 lt!596857 lt!596852 lt!596853 lt!596854))))

(assert (=> b!1350341 (= lt!596854 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1350341 (= lt!596853 (get!22494 (select (arr!44495 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1350341 (= lt!596852 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)))))

(assert (=> b!1350341 (= lt!596857 call!65226)))

(assert (=> b!1350341 (= e!768275 (+!4889 call!65226 (tuple2!24375 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (get!22494 (select (arr!44495 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1350342 () Bool)

(assert (=> b!1350342 (= e!768274 e!768275)))

(declare-fun c!126933 () Bool)

(assert (=> b!1350342 (= c!126933 (validKeyInArray!0 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))))))

(declare-fun b!1350343 () Bool)

(declare-fun res!895520 () Bool)

(assert (=> b!1350343 (=> (not res!895520) (not e!768271))))

(assert (=> b!1350343 (= res!895520 (not (contains!9226 lt!596851 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!145059 c!126932) b!1350332))

(assert (= (and d!145059 (not c!126932)) b!1350342))

(assert (= (and b!1350342 c!126933) b!1350341))

(assert (= (and b!1350342 (not c!126933)) b!1350333))

(assert (= (or b!1350341 b!1350333) bm!65223))

(assert (= (and d!145059 res!895518) b!1350343))

(assert (= (and b!1350343 res!895520) b!1350338))

(assert (= (and b!1350338 res!895519) b!1350335))

(assert (= (and b!1350338 c!126934) b!1350334))

(assert (= (and b!1350338 (not c!126934)) b!1350337))

(assert (= (and b!1350334 res!895517) b!1350340))

(assert (= (and b!1350337 c!126935) b!1350339))

(assert (= (and b!1350337 (not c!126935)) b!1350336))

(declare-fun b_lambda!24671 () Bool)

(assert (=> (not b_lambda!24671) (not b!1350340)))

(assert (=> b!1350340 t!46142))

(declare-fun b_and!50955 () Bool)

(assert (= b_and!50953 (and (=> t!46142 result!25973) b_and!50955)))

(declare-fun b_lambda!24673 () Bool)

(assert (=> (not b_lambda!24673) (not b!1350341)))

(assert (=> b!1350341 t!46142))

(declare-fun b_and!50957 () Bool)

(assert (= b_and!50955 (and (=> t!46142 result!25973) b_and!50957)))

(declare-fun m!1237721 () Bool)

(assert (=> b!1350335 m!1237721))

(assert (=> b!1350335 m!1237721))

(declare-fun m!1237723 () Bool)

(assert (=> b!1350335 m!1237723))

(declare-fun m!1237725 () Bool)

(assert (=> b!1350339 m!1237725))

(assert (=> b!1350342 m!1237721))

(assert (=> b!1350342 m!1237721))

(assert (=> b!1350342 m!1237723))

(assert (=> bm!65223 m!1237725))

(declare-fun m!1237727 () Bool)

(assert (=> b!1350336 m!1237727))

(declare-fun m!1237729 () Bool)

(assert (=> d!145059 m!1237729))

(assert (=> d!145059 m!1237289))

(assert (=> b!1350340 m!1237721))

(declare-fun m!1237731 () Bool)

(assert (=> b!1350340 m!1237731))

(declare-fun m!1237733 () Bool)

(assert (=> b!1350340 m!1237733))

(assert (=> b!1350340 m!1237299))

(declare-fun m!1237735 () Bool)

(assert (=> b!1350340 m!1237735))

(assert (=> b!1350340 m!1237299))

(assert (=> b!1350340 m!1237721))

(assert (=> b!1350340 m!1237733))

(assert (=> b!1350341 m!1237733))

(assert (=> b!1350341 m!1237299))

(assert (=> b!1350341 m!1237735))

(declare-fun m!1237737 () Bool)

(assert (=> b!1350341 m!1237737))

(declare-fun m!1237739 () Bool)

(assert (=> b!1350341 m!1237739))

(assert (=> b!1350341 m!1237737))

(assert (=> b!1350341 m!1237299))

(declare-fun m!1237741 () Bool)

(assert (=> b!1350341 m!1237741))

(declare-fun m!1237743 () Bool)

(assert (=> b!1350341 m!1237743))

(assert (=> b!1350341 m!1237721))

(assert (=> b!1350341 m!1237733))

(assert (=> b!1350334 m!1237721))

(assert (=> b!1350334 m!1237721))

(declare-fun m!1237745 () Bool)

(assert (=> b!1350334 m!1237745))

(declare-fun m!1237747 () Bool)

(assert (=> b!1350343 m!1237747))

(assert (=> bm!65185 d!145059))

(declare-fun b!1350344 () Bool)

(declare-fun e!768279 () Bool)

(declare-fun e!768278 () Bool)

(assert (=> b!1350344 (= e!768279 e!768278)))

(declare-fun lt!596860 () (_ BitVec 64))

(assert (=> b!1350344 (= lt!596860 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!596859 () Unit!44120)

(assert (=> b!1350344 (= lt!596859 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!596860 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1350344 (arrayContainsKey!0 _keys!1571 lt!596860 #b00000000000000000000000000000000)))

(declare-fun lt!596858 () Unit!44120)

(assert (=> b!1350344 (= lt!596858 lt!596859)))

(declare-fun res!895522 () Bool)

(assert (=> b!1350344 (= res!895522 (= (seekEntryOrOpen!0 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1571 mask!1977) (Found!10014 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1350344 (=> (not res!895522) (not e!768278))))

(declare-fun b!1350346 () Bool)

(declare-fun call!65227 () Bool)

(assert (=> b!1350346 (= e!768279 call!65227)))

(declare-fun d!145061 () Bool)

(declare-fun res!895521 () Bool)

(declare-fun e!768280 () Bool)

(assert (=> d!145061 (=> res!895521 e!768280)))

(assert (=> d!145061 (= res!895521 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!45045 _keys!1571)))))

(assert (=> d!145061 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977) e!768280)))

(declare-fun b!1350345 () Bool)

(assert (=> b!1350345 (= e!768278 call!65227)))

(declare-fun bm!65224 () Bool)

(assert (=> bm!65224 (= call!65227 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1350347 () Bool)

(assert (=> b!1350347 (= e!768280 e!768279)))

(declare-fun c!126936 () Bool)

(assert (=> b!1350347 (= c!126936 (validKeyInArray!0 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!145061 (not res!895521)) b!1350347))

(assert (= (and b!1350347 c!126936) b!1350344))

(assert (= (and b!1350347 (not c!126936)) b!1350346))

(assert (= (and b!1350344 res!895522) b!1350345))

(assert (= (or b!1350345 b!1350346) bm!65224))

(declare-fun m!1237749 () Bool)

(assert (=> b!1350344 m!1237749))

(declare-fun m!1237751 () Bool)

(assert (=> b!1350344 m!1237751))

(declare-fun m!1237753 () Bool)

(assert (=> b!1350344 m!1237753))

(assert (=> b!1350344 m!1237749))

(declare-fun m!1237755 () Bool)

(assert (=> b!1350344 m!1237755))

(declare-fun m!1237757 () Bool)

(assert (=> bm!65224 m!1237757))

(assert (=> b!1350347 m!1237749))

(assert (=> b!1350347 m!1237749))

(declare-fun m!1237759 () Bool)

(assert (=> b!1350347 m!1237759))

(assert (=> bm!65212 d!145061))

(declare-fun d!145063 () Bool)

(declare-fun lt!596863 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!664 (List!31511) (InoxSet tuple2!24374))

(assert (=> d!145063 (= lt!596863 (select (content!664 (toList!11035 lt!596674)) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!768286 () Bool)

(assert (=> d!145063 (= lt!596863 e!768286)))

(declare-fun res!895528 () Bool)

(assert (=> d!145063 (=> (not res!895528) (not e!768286))))

(assert (=> d!145063 (= res!895528 ((_ is Cons!31507) (toList!11035 lt!596674)))))

(assert (=> d!145063 (= (contains!9229 (toList!11035 lt!596674) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!596863)))

(declare-fun b!1350352 () Bool)

(declare-fun e!768285 () Bool)

(assert (=> b!1350352 (= e!768286 e!768285)))

(declare-fun res!895527 () Bool)

(assert (=> b!1350352 (=> res!895527 e!768285)))

(assert (=> b!1350352 (= res!895527 (= (h!32725 (toList!11035 lt!596674)) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1350353 () Bool)

(assert (=> b!1350353 (= e!768285 (contains!9229 (t!46143 (toList!11035 lt!596674)) (tuple2!24375 (select (arr!44494 _keys!1571) from!1960) (get!22494 (select (arr!44495 _values!1303) from!1960) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!145063 res!895528) b!1350352))

(assert (= (and b!1350352 (not res!895527)) b!1350353))

(declare-fun m!1237761 () Bool)

(assert (=> d!145063 m!1237761))

(declare-fun m!1237763 () Bool)

(assert (=> d!145063 m!1237763))

(declare-fun m!1237765 () Bool)

(assert (=> b!1350353 m!1237765))

(assert (=> b!1350066 d!145063))

(assert (=> b!1350098 d!145059))

(declare-fun d!145065 () Bool)

(declare-fun isEmpty!1101 (List!31511) Bool)

(assert (=> d!145065 (= (isEmpty!1099 lt!596692) (isEmpty!1101 (toList!11035 lt!596692)))))

(declare-fun bs!38688 () Bool)

(assert (= bs!38688 d!145065))

(declare-fun m!1237767 () Bool)

(assert (=> bs!38688 m!1237767))

(assert (=> b!1350095 d!145065))

(declare-fun d!145067 () Bool)

(declare-fun e!768287 () Bool)

(assert (=> d!145067 e!768287))

(declare-fun res!895529 () Bool)

(assert (=> d!145067 (=> (not res!895529) (not e!768287))))

(declare-fun lt!596864 () ListLongMap!22039)

(assert (=> d!145067 (= res!895529 (contains!9226 lt!596864 (_1!12198 (ite (or c!126889 c!126892) (tuple2!24375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun lt!596865 () List!31511)

(assert (=> d!145067 (= lt!596864 (ListLongMap!22040 lt!596865))))

(declare-fun lt!596866 () Unit!44120)

(declare-fun lt!596867 () Unit!44120)

(assert (=> d!145067 (= lt!596866 lt!596867)))

(assert (=> d!145067 (= (getValueByKey!718 lt!596865 (_1!12198 (ite (or c!126889 c!126892) (tuple2!24375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!768 (_2!12198 (ite (or c!126889 c!126892) (tuple2!24375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!145067 (= lt!596867 (lemmaContainsTupThenGetReturnValue!368 lt!596865 (_1!12198 (ite (or c!126889 c!126892) (tuple2!24375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12198 (ite (or c!126889 c!126892) (tuple2!24375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!145067 (= lt!596865 (insertStrictlySorted!497 (toList!11035 (ite c!126889 call!65208 (ite c!126892 call!65207 call!65206))) (_1!12198 (ite (or c!126889 c!126892) (tuple2!24375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12198 (ite (or c!126889 c!126892) (tuple2!24375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!145067 (= (+!4889 (ite c!126889 call!65208 (ite c!126892 call!65207 call!65206)) (ite (or c!126889 c!126892) (tuple2!24375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) lt!596864)))

(declare-fun b!1350354 () Bool)

(declare-fun res!895530 () Bool)

(assert (=> b!1350354 (=> (not res!895530) (not e!768287))))

(assert (=> b!1350354 (= res!895530 (= (getValueByKey!718 (toList!11035 lt!596864) (_1!12198 (ite (or c!126889 c!126892) (tuple2!24375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!768 (_2!12198 (ite (or c!126889 c!126892) (tuple2!24375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))))

(declare-fun b!1350355 () Bool)

(assert (=> b!1350355 (= e!768287 (contains!9229 (toList!11035 lt!596864) (ite (or c!126889 c!126892) (tuple2!24375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (= (and d!145067 res!895529) b!1350354))

(assert (= (and b!1350354 res!895530) b!1350355))

(declare-fun m!1237769 () Bool)

(assert (=> d!145067 m!1237769))

(declare-fun m!1237771 () Bool)

(assert (=> d!145067 m!1237771))

(declare-fun m!1237773 () Bool)

(assert (=> d!145067 m!1237773))

(declare-fun m!1237775 () Bool)

(assert (=> d!145067 m!1237775))

(declare-fun m!1237777 () Bool)

(assert (=> b!1350354 m!1237777))

(declare-fun m!1237779 () Bool)

(assert (=> b!1350355 m!1237779))

(assert (=> bm!65204 d!145067))

(declare-fun d!145069 () Bool)

(assert (=> d!145069 (= (validKeyInArray!0 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (and (not (= (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1350094 d!145069))

(declare-fun d!145071 () Bool)

(assert (=> d!145071 (= (apply!1048 lt!596767 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22499 (getValueByKey!718 (toList!11035 lt!596767) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38689 () Bool)

(assert (= bs!38689 d!145071))

(assert (=> bs!38689 m!1237657))

(assert (=> bs!38689 m!1237657))

(declare-fun m!1237781 () Bool)

(assert (=> bs!38689 m!1237781))

(assert (=> b!1350171 d!145071))

(declare-fun d!145073 () Bool)

(assert (=> d!145073 (arrayContainsKey!0 _keys!1571 lt!596777 #b00000000000000000000000000000000)))

(declare-fun lt!596870 () Unit!44120)

(declare-fun choose!13 (array!92089 (_ BitVec 64) (_ BitVec 32)) Unit!44120)

(assert (=> d!145073 (= lt!596870 (choose!13 _keys!1571 lt!596777 #b00000000000000000000000000000000))))

(assert (=> d!145073 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!145073 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!596777 #b00000000000000000000000000000000) lt!596870)))

(declare-fun bs!38690 () Bool)

(assert (= bs!38690 d!145073))

(assert (=> bs!38690 m!1237491))

(declare-fun m!1237783 () Bool)

(assert (=> bs!38690 m!1237783))

(assert (=> b!1350198 d!145073))

(declare-fun d!145075 () Bool)

(declare-fun res!895535 () Bool)

(declare-fun e!768292 () Bool)

(assert (=> d!145075 (=> res!895535 e!768292)))

(assert (=> d!145075 (= res!895535 (= (select (arr!44494 _keys!1571) #b00000000000000000000000000000000) lt!596777))))

(assert (=> d!145075 (= (arrayContainsKey!0 _keys!1571 lt!596777 #b00000000000000000000000000000000) e!768292)))

(declare-fun b!1350360 () Bool)

(declare-fun e!768293 () Bool)

(assert (=> b!1350360 (= e!768292 e!768293)))

(declare-fun res!895536 () Bool)

(assert (=> b!1350360 (=> (not res!895536) (not e!768293))))

(assert (=> b!1350360 (= res!895536 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!45045 _keys!1571)))))

(declare-fun b!1350361 () Bool)

(assert (=> b!1350361 (= e!768293 (arrayContainsKey!0 _keys!1571 lt!596777 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!145075 (not res!895535)) b!1350360))

(assert (= (and b!1350360 res!895536) b!1350361))

(assert (=> d!145075 m!1237425))

(declare-fun m!1237785 () Bool)

(assert (=> b!1350361 m!1237785))

(assert (=> b!1350198 d!145075))

(declare-fun b!1350374 () Bool)

(declare-fun e!768302 () SeekEntryResult!10014)

(declare-fun lt!596878 () SeekEntryResult!10014)

(assert (=> b!1350374 (= e!768302 (Found!10014 (index!42429 lt!596878)))))

(declare-fun e!768300 () SeekEntryResult!10014)

(declare-fun b!1350376 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!92089 (_ BitVec 32)) SeekEntryResult!10014)

(assert (=> b!1350376 (= e!768300 (seekKeyOrZeroReturnVacant!0 (x!120694 lt!596878) (index!42429 lt!596878) (index!42429 lt!596878) (select (arr!44494 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977))))

(declare-fun b!1350377 () Bool)

(declare-fun e!768301 () SeekEntryResult!10014)

(assert (=> b!1350377 (= e!768301 Undefined!10014)))

(declare-fun b!1350378 () Bool)

(assert (=> b!1350378 (= e!768301 e!768302)))

(declare-fun lt!596879 () (_ BitVec 64))

(assert (=> b!1350378 (= lt!596879 (select (arr!44494 _keys!1571) (index!42429 lt!596878)))))

(declare-fun c!126943 () Bool)

(assert (=> b!1350378 (= c!126943 (= lt!596879 (select (arr!44494 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1350379 () Bool)

(assert (=> b!1350379 (= e!768300 (MissingZero!10014 (index!42429 lt!596878)))))

(declare-fun b!1350375 () Bool)

(declare-fun c!126945 () Bool)

(assert (=> b!1350375 (= c!126945 (= lt!596879 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1350375 (= e!768302 e!768300)))

(declare-fun d!145077 () Bool)

(declare-fun lt!596877 () SeekEntryResult!10014)

(assert (=> d!145077 (and (or ((_ is Undefined!10014) lt!596877) (not ((_ is Found!10014) lt!596877)) (and (bvsge (index!42428 lt!596877) #b00000000000000000000000000000000) (bvslt (index!42428 lt!596877) (size!45045 _keys!1571)))) (or ((_ is Undefined!10014) lt!596877) ((_ is Found!10014) lt!596877) (not ((_ is MissingZero!10014) lt!596877)) (and (bvsge (index!42427 lt!596877) #b00000000000000000000000000000000) (bvslt (index!42427 lt!596877) (size!45045 _keys!1571)))) (or ((_ is Undefined!10014) lt!596877) ((_ is Found!10014) lt!596877) ((_ is MissingZero!10014) lt!596877) (not ((_ is MissingVacant!10014) lt!596877)) (and (bvsge (index!42430 lt!596877) #b00000000000000000000000000000000) (bvslt (index!42430 lt!596877) (size!45045 _keys!1571)))) (or ((_ is Undefined!10014) lt!596877) (ite ((_ is Found!10014) lt!596877) (= (select (arr!44494 _keys!1571) (index!42428 lt!596877)) (select (arr!44494 _keys!1571) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10014) lt!596877) (= (select (arr!44494 _keys!1571) (index!42427 lt!596877)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10014) lt!596877) (= (select (arr!44494 _keys!1571) (index!42430 lt!596877)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!145077 (= lt!596877 e!768301)))

(declare-fun c!126944 () Bool)

(assert (=> d!145077 (= c!126944 (and ((_ is Intermediate!10014) lt!596878) (undefined!10826 lt!596878)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!92089 (_ BitVec 32)) SeekEntryResult!10014)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!145077 (= lt!596878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!44494 _keys!1571) #b00000000000000000000000000000000) mask!1977) (select (arr!44494 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977))))

(assert (=> d!145077 (validMask!0 mask!1977)))

(assert (=> d!145077 (= (seekEntryOrOpen!0 (select (arr!44494 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) lt!596877)))

(assert (= (and d!145077 c!126944) b!1350377))

(assert (= (and d!145077 (not c!126944)) b!1350378))

(assert (= (and b!1350378 c!126943) b!1350374))

(assert (= (and b!1350378 (not c!126943)) b!1350375))

(assert (= (and b!1350375 c!126945) b!1350379))

(assert (= (and b!1350375 (not c!126945)) b!1350376))

(assert (=> b!1350376 m!1237425))

(declare-fun m!1237787 () Bool)

(assert (=> b!1350376 m!1237787))

(declare-fun m!1237789 () Bool)

(assert (=> b!1350378 m!1237789))

(declare-fun m!1237791 () Bool)

(assert (=> d!145077 m!1237791))

(assert (=> d!145077 m!1237425))

(declare-fun m!1237793 () Bool)

(assert (=> d!145077 m!1237793))

(declare-fun m!1237795 () Bool)

(assert (=> d!145077 m!1237795))

(assert (=> d!145077 m!1237425))

(assert (=> d!145077 m!1237791))

(declare-fun m!1237797 () Bool)

(assert (=> d!145077 m!1237797))

(assert (=> d!145077 m!1237289))

(declare-fun m!1237799 () Bool)

(assert (=> d!145077 m!1237799))

(assert (=> b!1350198 d!145077))

(declare-fun d!145079 () Bool)

(declare-fun e!768303 () Bool)

(assert (=> d!145079 e!768303))

(declare-fun res!895537 () Bool)

(assert (=> d!145079 (=> res!895537 e!768303)))

(declare-fun lt!596882 () Bool)

(assert (=> d!145079 (= res!895537 (not lt!596882))))

(declare-fun lt!596880 () Bool)

(assert (=> d!145079 (= lt!596882 lt!596880)))

(declare-fun lt!596883 () Unit!44120)

(declare-fun e!768304 () Unit!44120)

(assert (=> d!145079 (= lt!596883 e!768304)))

(declare-fun c!126946 () Bool)

(assert (=> d!145079 (= c!126946 lt!596880)))

(assert (=> d!145079 (= lt!596880 (containsKey!744 (toList!11035 lt!596692) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!145079 (= (contains!9226 lt!596692 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596882)))

(declare-fun b!1350380 () Bool)

(declare-fun lt!596881 () Unit!44120)

(assert (=> b!1350380 (= e!768304 lt!596881)))

(assert (=> b!1350380 (= lt!596881 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11035 lt!596692) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1350380 (isDefined!527 (getValueByKey!718 (toList!11035 lt!596692) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350381 () Bool)

(declare-fun Unit!44132 () Unit!44120)

(assert (=> b!1350381 (= e!768304 Unit!44132)))

(declare-fun b!1350382 () Bool)

(assert (=> b!1350382 (= e!768303 (isDefined!527 (getValueByKey!718 (toList!11035 lt!596692) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!145079 c!126946) b!1350380))

(assert (= (and d!145079 (not c!126946)) b!1350381))

(assert (= (and d!145079 (not res!895537)) b!1350382))

(declare-fun m!1237801 () Bool)

(assert (=> d!145079 m!1237801))

(declare-fun m!1237803 () Bool)

(assert (=> b!1350380 m!1237803))

(declare-fun m!1237805 () Bool)

(assert (=> b!1350380 m!1237805))

(assert (=> b!1350380 m!1237805))

(declare-fun m!1237807 () Bool)

(assert (=> b!1350380 m!1237807))

(assert (=> b!1350382 m!1237805))

(assert (=> b!1350382 m!1237805))

(assert (=> b!1350382 m!1237807))

(assert (=> b!1350102 d!145079))

(assert (=> b!1350119 d!145025))

(assert (=> b!1350101 d!145069))

(declare-fun d!145081 () Bool)

(declare-fun lt!596886 () Bool)

(declare-fun content!665 (List!31512) (InoxSet (_ BitVec 64)))

(assert (=> d!145081 (= lt!596886 (select (content!665 Nil!31509) (select (arr!44494 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun e!768309 () Bool)

(assert (=> d!145081 (= lt!596886 e!768309)))

(declare-fun res!895542 () Bool)

(assert (=> d!145081 (=> (not res!895542) (not e!768309))))

(assert (=> d!145081 (= res!895542 ((_ is Cons!31508) Nil!31509))))

(assert (=> d!145081 (= (contains!9230 Nil!31509 (select (arr!44494 _keys!1571) #b00000000000000000000000000000000)) lt!596886)))

(declare-fun b!1350387 () Bool)

(declare-fun e!768310 () Bool)

(assert (=> b!1350387 (= e!768309 e!768310)))

(declare-fun res!895543 () Bool)

(assert (=> b!1350387 (=> res!895543 e!768310)))

(assert (=> b!1350387 (= res!895543 (= (h!32726 Nil!31509) (select (arr!44494 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1350388 () Bool)

(assert (=> b!1350388 (= e!768310 (contains!9230 (t!46144 Nil!31509) (select (arr!44494 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!145081 res!895542) b!1350387))

(assert (= (and b!1350387 (not res!895543)) b!1350388))

(declare-fun m!1237809 () Bool)

(assert (=> d!145081 m!1237809))

(assert (=> d!145081 m!1237425))

(declare-fun m!1237811 () Bool)

(assert (=> d!145081 m!1237811))

(assert (=> b!1350388 m!1237425))

(declare-fun m!1237813 () Bool)

(assert (=> b!1350388 m!1237813))

(assert (=> b!1350120 d!145081))

(declare-fun d!145083 () Bool)

(assert (=> d!145083 (= (apply!1048 lt!596692 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22499 (getValueByKey!718 (toList!11035 lt!596692) (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))))

(declare-fun bs!38691 () Bool)

(assert (= bs!38691 d!145083))

(assert (=> bs!38691 m!1237393))

(assert (=> bs!38691 m!1237667))

(assert (=> bs!38691 m!1237667))

(declare-fun m!1237815 () Bool)

(assert (=> bs!38691 m!1237815))

(assert (=> b!1350099 d!145083))

(declare-fun d!145085 () Bool)

(declare-fun c!126947 () Bool)

(assert (=> d!145085 (= c!126947 ((_ is ValueCellFull!17888) (select (arr!44495 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun e!768311 () V!55201)

(assert (=> d!145085 (= (get!22494 (select (arr!44495 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!768311)))

(declare-fun b!1350389 () Bool)

(assert (=> b!1350389 (= e!768311 (get!22497 (select (arr!44495 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350390 () Bool)

(assert (=> b!1350390 (= e!768311 (get!22498 (select (arr!44495 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!145085 c!126947) b!1350389))

(assert (= (and d!145085 (not c!126947)) b!1350390))

(assert (=> b!1350389 m!1237405))

(assert (=> b!1350389 m!1237299))

(declare-fun m!1237817 () Bool)

(assert (=> b!1350389 m!1237817))

(assert (=> b!1350390 m!1237405))

(assert (=> b!1350390 m!1237299))

(declare-fun m!1237819 () Bool)

(assert (=> b!1350390 m!1237819))

(assert (=> b!1350099 d!145085))

(assert (=> b!1350060 d!145041))

(assert (=> b!1350060 d!145043))

(assert (=> b!1350126 d!145047))

(assert (=> b!1350126 d!145049))

(assert (=> b!1350201 d!145025))

(assert (=> b!1350177 d!144975))

(declare-fun bm!65225 () Bool)

(declare-fun call!65228 () Bool)

(declare-fun c!126948 () Bool)

(assert (=> bm!65225 (= call!65228 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!126948 (Cons!31508 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!126874 (Cons!31508 (select (arr!44494 _keys!1571) #b00000000000000000000000000000000) Nil!31509) Nil!31509)) (ite c!126874 (Cons!31508 (select (arr!44494 _keys!1571) #b00000000000000000000000000000000) Nil!31509) Nil!31509))))))

(declare-fun d!145087 () Bool)

(declare-fun res!895545 () Bool)

(declare-fun e!768315 () Bool)

(assert (=> d!145087 (=> res!895545 e!768315)))

(assert (=> d!145087 (= res!895545 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!45045 _keys!1571)))))

(assert (=> d!145087 (= (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126874 (Cons!31508 (select (arr!44494 _keys!1571) #b00000000000000000000000000000000) Nil!31509) Nil!31509)) e!768315)))

(declare-fun b!1350391 () Bool)

(declare-fun e!768312 () Bool)

(assert (=> b!1350391 (= e!768315 e!768312)))

(declare-fun res!895546 () Bool)

(assert (=> b!1350391 (=> (not res!895546) (not e!768312))))

(declare-fun e!768313 () Bool)

(assert (=> b!1350391 (= res!895546 (not e!768313))))

(declare-fun res!895544 () Bool)

(assert (=> b!1350391 (=> (not res!895544) (not e!768313))))

(assert (=> b!1350391 (= res!895544 (validKeyInArray!0 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1350392 () Bool)

(assert (=> b!1350392 (= e!768313 (contains!9230 (ite c!126874 (Cons!31508 (select (arr!44494 _keys!1571) #b00000000000000000000000000000000) Nil!31509) Nil!31509) (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1350393 () Bool)

(declare-fun e!768314 () Bool)

(assert (=> b!1350393 (= e!768314 call!65228)))

(declare-fun b!1350394 () Bool)

(assert (=> b!1350394 (= e!768314 call!65228)))

(declare-fun b!1350395 () Bool)

(assert (=> b!1350395 (= e!768312 e!768314)))

(assert (=> b!1350395 (= c!126948 (validKeyInArray!0 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!145087 (not res!895545)) b!1350391))

(assert (= (and b!1350391 res!895544) b!1350392))

(assert (= (and b!1350391 res!895546) b!1350395))

(assert (= (and b!1350395 c!126948) b!1350394))

(assert (= (and b!1350395 (not c!126948)) b!1350393))

(assert (= (or b!1350394 b!1350393) bm!65225))

(assert (=> bm!65225 m!1237749))

(declare-fun m!1237821 () Bool)

(assert (=> bm!65225 m!1237821))

(assert (=> b!1350391 m!1237749))

(assert (=> b!1350391 m!1237749))

(assert (=> b!1350391 m!1237759))

(assert (=> b!1350392 m!1237749))

(assert (=> b!1350392 m!1237749))

(declare-fun m!1237823 () Bool)

(assert (=> b!1350392 m!1237823))

(assert (=> b!1350395 m!1237749))

(assert (=> b!1350395 m!1237749))

(assert (=> b!1350395 m!1237759))

(assert (=> bm!65188 d!145087))

(declare-fun d!145089 () Bool)

(declare-fun e!768316 () Bool)

(assert (=> d!145089 e!768316))

(declare-fun res!895547 () Bool)

(assert (=> d!145089 (=> (not res!895547) (not e!768316))))

(declare-fun lt!596887 () ListLongMap!22039)

(assert (=> d!145089 (= res!895547 (contains!9226 lt!596887 (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22494 (select (arr!44495 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!596888 () List!31511)

(assert (=> d!145089 (= lt!596887 (ListLongMap!22040 lt!596888))))

(declare-fun lt!596889 () Unit!44120)

(declare-fun lt!596890 () Unit!44120)

(assert (=> d!145089 (= lt!596889 lt!596890)))

(assert (=> d!145089 (= (getValueByKey!718 lt!596888 (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22494 (select (arr!44495 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!768 (_2!12198 (tuple2!24375 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22494 (select (arr!44495 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!145089 (= lt!596890 (lemmaContainsTupThenGetReturnValue!368 lt!596888 (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22494 (select (arr!44495 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12198 (tuple2!24375 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22494 (select (arr!44495 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!145089 (= lt!596888 (insertStrictlySorted!497 (toList!11035 call!65188) (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22494 (select (arr!44495 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12198 (tuple2!24375 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22494 (select (arr!44495 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!145089 (= (+!4889 call!65188 (tuple2!24375 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22494 (select (arr!44495 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!596887)))

(declare-fun b!1350396 () Bool)

(declare-fun res!895548 () Bool)

(assert (=> b!1350396 (=> (not res!895548) (not e!768316))))

(assert (=> b!1350396 (= res!895548 (= (getValueByKey!718 (toList!11035 lt!596887) (_1!12198 (tuple2!24375 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22494 (select (arr!44495 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!768 (_2!12198 (tuple2!24375 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22494 (select (arr!44495 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1350397 () Bool)

(assert (=> b!1350397 (= e!768316 (contains!9229 (toList!11035 lt!596887) (tuple2!24375 (select (arr!44494 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22494 (select (arr!44495 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3843 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!145089 res!895547) b!1350396))

(assert (= (and b!1350396 res!895548) b!1350397))

(declare-fun m!1237825 () Bool)

(assert (=> d!145089 m!1237825))

(declare-fun m!1237827 () Bool)

(assert (=> d!145089 m!1237827))

(declare-fun m!1237829 () Bool)

(assert (=> d!145089 m!1237829))

(declare-fun m!1237831 () Bool)

(assert (=> d!145089 m!1237831))

(declare-fun m!1237833 () Bool)

(assert (=> b!1350396 m!1237833))

(declare-fun m!1237835 () Bool)

(assert (=> b!1350397 m!1237835))

(assert (=> b!1350100 d!145089))

(assert (=> b!1350100 d!145085))

(declare-fun d!145091 () Bool)

(declare-fun e!768317 () Bool)

(assert (=> d!145091 e!768317))

(declare-fun res!895549 () Bool)

(assert (=> d!145091 (=> (not res!895549) (not e!768317))))

(declare-fun lt!596891 () ListLongMap!22039)

(assert (=> d!145091 (= res!895549 (contains!9226 lt!596891 (_1!12198 (tuple2!24375 lt!596693 lt!596694))))))

(declare-fun lt!596892 () List!31511)

(assert (=> d!145091 (= lt!596891 (ListLongMap!22040 lt!596892))))

(declare-fun lt!596893 () Unit!44120)

(declare-fun lt!596894 () Unit!44120)

(assert (=> d!145091 (= lt!596893 lt!596894)))

(assert (=> d!145091 (= (getValueByKey!718 lt!596892 (_1!12198 (tuple2!24375 lt!596693 lt!596694))) (Some!768 (_2!12198 (tuple2!24375 lt!596693 lt!596694))))))

(assert (=> d!145091 (= lt!596894 (lemmaContainsTupThenGetReturnValue!368 lt!596892 (_1!12198 (tuple2!24375 lt!596693 lt!596694)) (_2!12198 (tuple2!24375 lt!596693 lt!596694))))))

(assert (=> d!145091 (= lt!596892 (insertStrictlySorted!497 (toList!11035 lt!596698) (_1!12198 (tuple2!24375 lt!596693 lt!596694)) (_2!12198 (tuple2!24375 lt!596693 lt!596694))))))

(assert (=> d!145091 (= (+!4889 lt!596698 (tuple2!24375 lt!596693 lt!596694)) lt!596891)))

(declare-fun b!1350398 () Bool)

(declare-fun res!895550 () Bool)

(assert (=> b!1350398 (=> (not res!895550) (not e!768317))))

(assert (=> b!1350398 (= res!895550 (= (getValueByKey!718 (toList!11035 lt!596891) (_1!12198 (tuple2!24375 lt!596693 lt!596694))) (Some!768 (_2!12198 (tuple2!24375 lt!596693 lt!596694)))))))

(declare-fun b!1350399 () Bool)

(assert (=> b!1350399 (= e!768317 (contains!9229 (toList!11035 lt!596891) (tuple2!24375 lt!596693 lt!596694)))))

(assert (= (and d!145091 res!895549) b!1350398))

(assert (= (and b!1350398 res!895550) b!1350399))

(declare-fun m!1237837 () Bool)

(assert (=> d!145091 m!1237837))

(declare-fun m!1237839 () Bool)

(assert (=> d!145091 m!1237839))

(declare-fun m!1237841 () Bool)

(assert (=> d!145091 m!1237841))

(declare-fun m!1237843 () Bool)

(assert (=> d!145091 m!1237843))

(declare-fun m!1237845 () Bool)

(assert (=> b!1350398 m!1237845))

(declare-fun m!1237847 () Bool)

(assert (=> b!1350399 m!1237847))

(assert (=> b!1350100 d!145091))

(declare-fun d!145093 () Bool)

(assert (=> d!145093 (not (contains!9226 (+!4889 lt!596698 (tuple2!24375 lt!596693 lt!596694)) lt!596695))))

(declare-fun lt!596897 () Unit!44120)

(declare-fun choose!1985 (ListLongMap!22039 (_ BitVec 64) V!55201 (_ BitVec 64)) Unit!44120)

(assert (=> d!145093 (= lt!596897 (choose!1985 lt!596698 lt!596693 lt!596694 lt!596695))))

(declare-fun e!768320 () Bool)

(assert (=> d!145093 e!768320))

(declare-fun res!895553 () Bool)

(assert (=> d!145093 (=> (not res!895553) (not e!768320))))

(assert (=> d!145093 (= res!895553 (not (contains!9226 lt!596698 lt!596695)))))

(assert (=> d!145093 (= (addStillNotContains!504 lt!596698 lt!596693 lt!596694 lt!596695) lt!596897)))

(declare-fun b!1350403 () Bool)

(assert (=> b!1350403 (= e!768320 (not (= lt!596693 lt!596695)))))

(assert (= (and d!145093 res!895553) b!1350403))

(assert (=> d!145093 m!1237409))

(assert (=> d!145093 m!1237409))

(assert (=> d!145093 m!1237411))

(declare-fun m!1237849 () Bool)

(assert (=> d!145093 m!1237849))

(declare-fun m!1237851 () Bool)

(assert (=> d!145093 m!1237851))

(assert (=> b!1350100 d!145093))

(declare-fun d!145095 () Bool)

(declare-fun e!768321 () Bool)

(assert (=> d!145095 e!768321))

(declare-fun res!895554 () Bool)

(assert (=> d!145095 (=> res!895554 e!768321)))

(declare-fun lt!596900 () Bool)

(assert (=> d!145095 (= res!895554 (not lt!596900))))

(declare-fun lt!596898 () Bool)

(assert (=> d!145095 (= lt!596900 lt!596898)))

(declare-fun lt!596901 () Unit!44120)

(declare-fun e!768322 () Unit!44120)

(assert (=> d!145095 (= lt!596901 e!768322)))

(declare-fun c!126949 () Bool)

(assert (=> d!145095 (= c!126949 lt!596898)))

(assert (=> d!145095 (= lt!596898 (containsKey!744 (toList!11035 (+!4889 lt!596698 (tuple2!24375 lt!596693 lt!596694))) lt!596695))))

(assert (=> d!145095 (= (contains!9226 (+!4889 lt!596698 (tuple2!24375 lt!596693 lt!596694)) lt!596695) lt!596900)))

(declare-fun b!1350404 () Bool)

(declare-fun lt!596899 () Unit!44120)

(assert (=> b!1350404 (= e!768322 lt!596899)))

(assert (=> b!1350404 (= lt!596899 (lemmaContainsKeyImpliesGetValueByKeyDefined!490 (toList!11035 (+!4889 lt!596698 (tuple2!24375 lt!596693 lt!596694))) lt!596695))))

(assert (=> b!1350404 (isDefined!527 (getValueByKey!718 (toList!11035 (+!4889 lt!596698 (tuple2!24375 lt!596693 lt!596694))) lt!596695))))

(declare-fun b!1350405 () Bool)

(declare-fun Unit!44133 () Unit!44120)

(assert (=> b!1350405 (= e!768322 Unit!44133)))

(declare-fun b!1350406 () Bool)

(assert (=> b!1350406 (= e!768321 (isDefined!527 (getValueByKey!718 (toList!11035 (+!4889 lt!596698 (tuple2!24375 lt!596693 lt!596694))) lt!596695)))))

(assert (= (and d!145095 c!126949) b!1350404))

(assert (= (and d!145095 (not c!126949)) b!1350405))

(assert (= (and d!145095 (not res!895554)) b!1350406))

(declare-fun m!1237853 () Bool)

(assert (=> d!145095 m!1237853))

(declare-fun m!1237855 () Bool)

(assert (=> b!1350404 m!1237855))

(declare-fun m!1237857 () Bool)

(assert (=> b!1350404 m!1237857))

(assert (=> b!1350404 m!1237857))

(declare-fun m!1237859 () Bool)

(assert (=> b!1350404 m!1237859))

(assert (=> b!1350406 m!1237857))

(assert (=> b!1350406 m!1237857))

(assert (=> b!1350406 m!1237859))

(assert (=> b!1350100 d!145095))

(declare-fun b!1350407 () Bool)

(declare-fun e!768324 () Bool)

(assert (=> b!1350407 (= e!768324 tp_is_empty!37573)))

(declare-fun mapNonEmpty!58083 () Bool)

(declare-fun mapRes!58083 () Bool)

(declare-fun tp!110547 () Bool)

(assert (=> mapNonEmpty!58083 (= mapRes!58083 (and tp!110547 e!768324))))

(declare-fun mapKey!58083 () (_ BitVec 32))

(declare-fun mapValue!58083 () ValueCell!17888)

(declare-fun mapRest!58083 () (Array (_ BitVec 32) ValueCell!17888))

(assert (=> mapNonEmpty!58083 (= mapRest!58082 (store mapRest!58083 mapKey!58083 mapValue!58083))))

(declare-fun condMapEmpty!58083 () Bool)

(declare-fun mapDefault!58083 () ValueCell!17888)

(assert (=> mapNonEmpty!58082 (= condMapEmpty!58083 (= mapRest!58082 ((as const (Array (_ BitVec 32) ValueCell!17888)) mapDefault!58083)))))

(declare-fun e!768323 () Bool)

(assert (=> mapNonEmpty!58082 (= tp!110546 (and e!768323 mapRes!58083))))

(declare-fun b!1350408 () Bool)

(assert (=> b!1350408 (= e!768323 tp_is_empty!37573)))

(declare-fun mapIsEmpty!58083 () Bool)

(assert (=> mapIsEmpty!58083 mapRes!58083))

(assert (= (and mapNonEmpty!58082 condMapEmpty!58083) mapIsEmpty!58083))

(assert (= (and mapNonEmpty!58082 (not condMapEmpty!58083)) mapNonEmpty!58083))

(assert (= (and mapNonEmpty!58083 ((_ is ValueCellFull!17888) mapValue!58083)) b!1350407))

(assert (= (and mapNonEmpty!58082 ((_ is ValueCellFull!17888) mapDefault!58083)) b!1350408))

(declare-fun m!1237861 () Bool)

(assert (=> mapNonEmpty!58083 m!1237861))

(declare-fun b_lambda!24675 () Bool)

(assert (= b_lambda!24667 (or (and start!113830 b_free!31573) b_lambda!24675)))

(declare-fun b_lambda!24677 () Bool)

(assert (= b_lambda!24673 (or (and start!113830 b_free!31573) b_lambda!24677)))

(declare-fun b_lambda!24679 () Bool)

(assert (= b_lambda!24671 (or (and start!113830 b_free!31573) b_lambda!24679)))

(declare-fun b_lambda!24681 () Bool)

(assert (= b_lambda!24669 (or (and start!113830 b_free!31573) b_lambda!24681)))

(check-sat (not b!1350389) (not b!1350237) (not b!1350406) (not d!145011) (not b!1350259) (not b_next!31573) (not d!145057) (not b!1350291) (not d!145051) (not b!1350398) (not d!145039) (not b!1350299) (not b!1350390) (not b!1350302) (not b_lambda!24653) (not b!1350224) (not d!145015) (not b!1350290) (not d!145023) b_and!50957 (not d!145077) (not d!144983) (not b!1350308) (not b!1350232) (not b!1350215) (not b!1350376) (not b!1350380) (not b!1350260) (not b!1350240) (not d!145007) (not d!144993) (not b!1350334) (not b!1350303) (not b_lambda!24677) (not b!1350324) (not b!1350253) (not b!1350361) (not b!1350318) (not d!145063) (not b!1350354) (not d!145001) (not bm!65213) (not b!1350388) (not b!1350234) (not b!1350382) (not d!145009) (not d!145019) (not d!145089) (not b!1350283) (not d!145045) (not b!1350336) (not b!1350300) (not b!1350323) (not b!1350325) (not b!1350226) (not b!1350397) (not d!145031) (not b_lambda!24679) (not b!1350242) (not d!144989) (not b!1350321) (not b!1350392) (not b_lambda!24663) (not b!1350335) (not d!144995) (not b!1350293) (not b!1350307) (not b_lambda!24665) (not b!1350282) (not d!145017) (not d!145073) (not b!1350339) (not d!145047) (not d!145091) (not b!1350344) (not d!144985) (not b_lambda!24675) (not b!1350355) (not d!145005) (not d!145083) (not bm!65221) (not d!145029) (not d!144991) (not b!1350305) (not bm!65225) (not mapNonEmpty!58083) (not d!144997) (not bm!65223) (not b!1350236) (not b!1350353) (not b!1350217) (not b!1350347) (not d!145079) (not d!145003) (not b_lambda!24681) (not b!1350230) (not b!1350231) (not b!1350343) (not d!145093) (not b_lambda!24661) (not b!1350212) (not b!1350342) (not b!1350396) (not d!145065) (not d!145059) (not d!144987) (not d!145037) (not b!1350235) (not b!1350316) (not b!1350391) (not d!145041) (not d!144981) (not d!144999) (not b!1350310) (not b!1350211) tp_is_empty!37573 (not d!145081) (not b!1350341) (not bm!65224) (not b!1350399) (not b!1350213) (not d!145095) (not d!145067) (not b!1350229) (not b!1350233) (not d!145071) (not b!1350395) (not b!1350327) (not d!144979) (not b!1350313) (not b!1350330) (not b!1350216) (not b!1350225) (not d!145053) (not b!1350404) (not b!1350340))
(check-sat b_and!50957 (not b_next!31573))
