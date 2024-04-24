; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79868 () Bool)

(assert start!79868)

(declare-fun b_free!17749 () Bool)

(declare-fun b_next!17749 () Bool)

(assert (=> start!79868 (= b_free!17749 (not b_next!17749))))

(declare-fun tp!61703 () Bool)

(declare-fun b_and!29099 () Bool)

(assert (=> start!79868 (= tp!61703 b_and!29099)))

(declare-fun b!938593 () Bool)

(declare-datatypes ((Unit!31648 0))(
  ( (Unit!31649) )
))
(declare-fun e!527150 () Unit!31648)

(declare-fun e!527143 () Unit!31648)

(assert (=> b!938593 (= e!527150 e!527143)))

(declare-fun lt!423563 () (_ BitVec 64))

(declare-datatypes ((array!56503 0))(
  ( (array!56504 (arr!27187 (Array (_ BitVec 32) (_ BitVec 64))) (size!27647 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56503)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!938593 (= lt!423563 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97903 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!938593 (= c!97903 (validKeyInArray!0 lt!423563))))

(declare-fun b!938594 () Bool)

(declare-fun e!527141 () Bool)

(declare-fun e!527145 () Bool)

(assert (=> b!938594 (= e!527141 e!527145)))

(declare-fun res!631404 () Bool)

(assert (=> b!938594 (=> (not res!631404) (not e!527145))))

(declare-datatypes ((V!31975 0))(
  ( (V!31976 (val!10179 Int)) )
))
(declare-datatypes ((tuple2!13360 0))(
  ( (tuple2!13361 (_1!6691 (_ BitVec 64)) (_2!6691 V!31975)) )
))
(declare-datatypes ((List!19140 0))(
  ( (Nil!19137) (Cons!19136 (h!20288 tuple2!13360) (t!27425 List!19140)) )
))
(declare-datatypes ((ListLongMap!12059 0))(
  ( (ListLongMap!12060 (toList!6045 List!19140)) )
))
(declare-fun lt!423561 () ListLongMap!12059)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5115 (ListLongMap!12059 (_ BitVec 64)) Bool)

(assert (=> b!938594 (= res!631404 (contains!5115 lt!423561 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9647 0))(
  ( (ValueCellFull!9647 (v!12701 V!31975)) (EmptyCell!9647) )
))
(declare-datatypes ((array!56505 0))(
  ( (array!56506 (arr!27188 (Array (_ BitVec 32) ValueCell!9647)) (size!27648 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56505)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31975)

(declare-fun minValue!1173 () V!31975)

(declare-fun getCurrentListMap!3280 (array!56503 array!56505 (_ BitVec 32) (_ BitVec 32) V!31975 V!31975 (_ BitVec 32) Int) ListLongMap!12059)

(assert (=> b!938594 (= lt!423561 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!631408 () Bool)

(assert (=> start!79868 (=> (not res!631408) (not e!527141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79868 (= res!631408 (validMask!0 mask!1881))))

(assert (=> start!79868 e!527141))

(assert (=> start!79868 true))

(declare-fun tp_is_empty!20257 () Bool)

(assert (=> start!79868 tp_is_empty!20257))

(declare-fun e!527146 () Bool)

(declare-fun array_inv!21232 (array!56505) Bool)

(assert (=> start!79868 (and (array_inv!21232 _values!1231) e!527146)))

(assert (=> start!79868 tp!61703))

(declare-fun array_inv!21233 (array!56503) Bool)

(assert (=> start!79868 (array_inv!21233 _keys!1487)))

(declare-fun b!938595 () Bool)

(declare-fun e!527151 () Bool)

(assert (=> b!938595 (= e!527151 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!938596 () Bool)

(declare-fun e!527149 () Bool)

(declare-fun e!527147 () Bool)

(assert (=> b!938596 (= e!527149 e!527147)))

(declare-fun res!631405 () Bool)

(assert (=> b!938596 (=> (not res!631405) (not e!527147))))

(assert (=> b!938596 (= res!631405 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27647 _keys!1487)))))

(declare-fun lt!423564 () Unit!31648)

(assert (=> b!938596 (= lt!423564 e!527150)))

(declare-fun c!97904 () Bool)

(assert (=> b!938596 (= c!97904 (validKeyInArray!0 k0!1099))))

(declare-fun b!938597 () Bool)

(declare-fun lt!423565 () ListLongMap!12059)

(declare-fun lt!423568 () V!31975)

(declare-fun apply!862 (ListLongMap!12059 (_ BitVec 64)) V!31975)

(assert (=> b!938597 (= (apply!862 lt!423565 k0!1099) lt!423568)))

(declare-fun lt!423562 () V!31975)

(declare-fun lt!423570 () Unit!31648)

(declare-fun addApplyDifferent!437 (ListLongMap!12059 (_ BitVec 64) V!31975 (_ BitVec 64)) Unit!31648)

(assert (=> b!938597 (= lt!423570 (addApplyDifferent!437 lt!423561 lt!423563 lt!423562 k0!1099))))

(assert (=> b!938597 (not (= lt!423563 k0!1099))))

(declare-fun lt!423566 () Unit!31648)

(declare-datatypes ((List!19141 0))(
  ( (Nil!19138) (Cons!19137 (h!20289 (_ BitVec 64)) (t!27426 List!19141)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56503 (_ BitVec 64) (_ BitVec 32) List!19141) Unit!31648)

(assert (=> b!938597 (= lt!423566 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19138))))

(assert (=> b!938597 e!527151))

(declare-fun c!97905 () Bool)

(assert (=> b!938597 (= c!97905 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!423569 () Unit!31648)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!307 (array!56503 array!56505 (_ BitVec 32) (_ BitVec 32) V!31975 V!31975 (_ BitVec 64) (_ BitVec 32) Int) Unit!31648)

(assert (=> b!938597 (= lt!423569 (lemmaListMapContainsThenArrayContainsFrom!307 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56503 (_ BitVec 32) List!19141) Bool)

(assert (=> b!938597 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19138)))

(declare-fun lt!423560 () Unit!31648)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56503 (_ BitVec 32) (_ BitVec 32)) Unit!31648)

(assert (=> b!938597 (= lt!423560 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!938597 (contains!5115 lt!423565 k0!1099)))

(declare-fun lt!423559 () tuple2!13360)

(declare-fun +!2853 (ListLongMap!12059 tuple2!13360) ListLongMap!12059)

(assert (=> b!938597 (= lt!423565 (+!2853 lt!423561 lt!423559))))

(declare-fun lt!423558 () Unit!31648)

(declare-fun addStillContains!556 (ListLongMap!12059 (_ BitVec 64) V!31975 (_ BitVec 64)) Unit!31648)

(assert (=> b!938597 (= lt!423558 (addStillContains!556 lt!423561 lt!423563 lt!423562 k0!1099))))

(assert (=> b!938597 (= (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2853 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423559))))

(assert (=> b!938597 (= lt!423559 (tuple2!13361 lt!423563 lt!423562))))

(declare-fun get!14353 (ValueCell!9647 V!31975) V!31975)

(declare-fun dynLambda!1650 (Int (_ BitVec 64)) V!31975)

(assert (=> b!938597 (= lt!423562 (get!14353 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!423567 () Unit!31648)

(declare-fun lemmaListMapRecursiveValidKeyArray!233 (array!56503 array!56505 (_ BitVec 32) (_ BitVec 32) V!31975 V!31975 (_ BitVec 32) Int) Unit!31648)

(assert (=> b!938597 (= lt!423567 (lemmaListMapRecursiveValidKeyArray!233 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!938597 (= e!527143 lt!423570)))

(declare-fun b!938598 () Bool)

(assert (=> b!938598 (= e!527145 e!527149)))

(declare-fun res!631407 () Bool)

(assert (=> b!938598 (=> (not res!631407) (not e!527149))))

(declare-fun v!791 () V!31975)

(assert (=> b!938598 (= res!631407 (and (= lt!423568 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!938598 (= lt!423568 (apply!862 lt!423561 k0!1099))))

(declare-fun mapIsEmpty!32157 () Bool)

(declare-fun mapRes!32157 () Bool)

(assert (=> mapIsEmpty!32157 mapRes!32157))

(declare-fun b!938599 () Bool)

(declare-fun res!631409 () Bool)

(assert (=> b!938599 (=> (not res!631409) (not e!527141))))

(assert (=> b!938599 (= res!631409 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19138))))

(declare-fun b!938600 () Bool)

(declare-fun arrayContainsKey!0 (array!56503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!938600 (= e!527151 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!938601 () Bool)

(declare-fun Unit!31650 () Unit!31648)

(assert (=> b!938601 (= e!527143 Unit!31650)))

(declare-fun b!938602 () Bool)

(declare-fun res!631403 () Bool)

(assert (=> b!938602 (=> (not res!631403) (not e!527141))))

(assert (=> b!938602 (= res!631403 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27647 _keys!1487))))))

(declare-fun b!938603 () Bool)

(assert (=> b!938603 (= e!527147 (not (contains!5115 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) k0!1099)))))

(declare-fun b!938604 () Bool)

(declare-fun res!631406 () Bool)

(assert (=> b!938604 (=> (not res!631406) (not e!527141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56503 (_ BitVec 32)) Bool)

(assert (=> b!938604 (= res!631406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!938605 () Bool)

(declare-fun e!527148 () Bool)

(assert (=> b!938605 (= e!527148 tp_is_empty!20257)))

(declare-fun b!938606 () Bool)

(declare-fun e!527144 () Bool)

(assert (=> b!938606 (= e!527144 tp_is_empty!20257)))

(declare-fun b!938607 () Bool)

(declare-fun res!631410 () Bool)

(assert (=> b!938607 (=> (not res!631410) (not e!527141))))

(assert (=> b!938607 (= res!631410 (and (= (size!27648 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27647 _keys!1487) (size!27648 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!32157 () Bool)

(declare-fun tp!61704 () Bool)

(assert (=> mapNonEmpty!32157 (= mapRes!32157 (and tp!61704 e!527148))))

(declare-fun mapValue!32157 () ValueCell!9647)

(declare-fun mapRest!32157 () (Array (_ BitVec 32) ValueCell!9647))

(declare-fun mapKey!32157 () (_ BitVec 32))

(assert (=> mapNonEmpty!32157 (= (arr!27188 _values!1231) (store mapRest!32157 mapKey!32157 mapValue!32157))))

(declare-fun b!938608 () Bool)

(declare-fun Unit!31651 () Unit!31648)

(assert (=> b!938608 (= e!527150 Unit!31651)))

(declare-fun b!938609 () Bool)

(assert (=> b!938609 (= e!527146 (and e!527144 mapRes!32157))))

(declare-fun condMapEmpty!32157 () Bool)

(declare-fun mapDefault!32157 () ValueCell!9647)

(assert (=> b!938609 (= condMapEmpty!32157 (= (arr!27188 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9647)) mapDefault!32157)))))

(assert (= (and start!79868 res!631408) b!938607))

(assert (= (and b!938607 res!631410) b!938604))

(assert (= (and b!938604 res!631406) b!938599))

(assert (= (and b!938599 res!631409) b!938602))

(assert (= (and b!938602 res!631403) b!938594))

(assert (= (and b!938594 res!631404) b!938598))

(assert (= (and b!938598 res!631407) b!938596))

(assert (= (and b!938596 c!97904) b!938593))

(assert (= (and b!938596 (not c!97904)) b!938608))

(assert (= (and b!938593 c!97903) b!938597))

(assert (= (and b!938593 (not c!97903)) b!938601))

(assert (= (and b!938597 c!97905) b!938600))

(assert (= (and b!938597 (not c!97905)) b!938595))

(assert (= (and b!938596 res!631405) b!938603))

(assert (= (and b!938609 condMapEmpty!32157) mapIsEmpty!32157))

(assert (= (and b!938609 (not condMapEmpty!32157)) mapNonEmpty!32157))

(get-info :version)

(assert (= (and mapNonEmpty!32157 ((_ is ValueCellFull!9647) mapValue!32157)) b!938605))

(assert (= (and b!938609 ((_ is ValueCellFull!9647) mapDefault!32157)) b!938606))

(assert (= start!79868 b!938609))

(declare-fun b_lambda!14169 () Bool)

(assert (=> (not b_lambda!14169) (not b!938597)))

(declare-fun t!27424 () Bool)

(declare-fun tb!6135 () Bool)

(assert (=> (and start!79868 (= defaultEntry!1235 defaultEntry!1235) t!27424) tb!6135))

(declare-fun result!12111 () Bool)

(assert (=> tb!6135 (= result!12111 tp_is_empty!20257)))

(assert (=> b!938597 t!27424))

(declare-fun b_and!29101 () Bool)

(assert (= b_and!29099 (and (=> t!27424 result!12111) b_and!29101)))

(declare-fun m!873785 () Bool)

(assert (=> b!938599 m!873785))

(declare-fun m!873787 () Bool)

(assert (=> b!938597 m!873787))

(declare-fun m!873789 () Bool)

(assert (=> b!938597 m!873789))

(declare-fun m!873791 () Bool)

(assert (=> b!938597 m!873791))

(declare-fun m!873793 () Bool)

(assert (=> b!938597 m!873793))

(declare-fun m!873795 () Bool)

(assert (=> b!938597 m!873795))

(declare-fun m!873797 () Bool)

(assert (=> b!938597 m!873797))

(declare-fun m!873799 () Bool)

(assert (=> b!938597 m!873799))

(assert (=> b!938597 m!873793))

(assert (=> b!938597 m!873795))

(declare-fun m!873801 () Bool)

(assert (=> b!938597 m!873801))

(declare-fun m!873803 () Bool)

(assert (=> b!938597 m!873803))

(declare-fun m!873805 () Bool)

(assert (=> b!938597 m!873805))

(declare-fun m!873807 () Bool)

(assert (=> b!938597 m!873807))

(declare-fun m!873809 () Bool)

(assert (=> b!938597 m!873809))

(declare-fun m!873811 () Bool)

(assert (=> b!938597 m!873811))

(declare-fun m!873813 () Bool)

(assert (=> b!938597 m!873813))

(declare-fun m!873815 () Bool)

(assert (=> b!938597 m!873815))

(assert (=> b!938597 m!873797))

(declare-fun m!873817 () Bool)

(assert (=> b!938597 m!873817))

(declare-fun m!873819 () Bool)

(assert (=> b!938596 m!873819))

(declare-fun m!873821 () Bool)

(assert (=> b!938604 m!873821))

(declare-fun m!873823 () Bool)

(assert (=> b!938594 m!873823))

(declare-fun m!873825 () Bool)

(assert (=> b!938594 m!873825))

(declare-fun m!873827 () Bool)

(assert (=> start!79868 m!873827))

(declare-fun m!873829 () Bool)

(assert (=> start!79868 m!873829))

(declare-fun m!873831 () Bool)

(assert (=> start!79868 m!873831))

(declare-fun m!873833 () Bool)

(assert (=> b!938600 m!873833))

(declare-fun m!873835 () Bool)

(assert (=> b!938598 m!873835))

(assert (=> b!938603 m!873803))

(assert (=> b!938603 m!873803))

(declare-fun m!873837 () Bool)

(assert (=> b!938603 m!873837))

(declare-fun m!873839 () Bool)

(assert (=> mapNonEmpty!32157 m!873839))

(declare-fun m!873841 () Bool)

(assert (=> b!938593 m!873841))

(declare-fun m!873843 () Bool)

(assert (=> b!938593 m!873843))

(check-sat (not b_next!17749) (not b!938600) (not b!938594) (not b!938596) b_and!29101 (not b!938598) (not start!79868) (not b!938597) tp_is_empty!20257 (not b!938604) (not b!938603) (not b!938599) (not b_lambda!14169) (not mapNonEmpty!32157) (not b!938593))
(check-sat b_and!29101 (not b_next!17749))
(get-model)

(declare-fun b_lambda!14175 () Bool)

(assert (= b_lambda!14169 (or (and start!79868 b_free!17749) b_lambda!14175)))

(check-sat (not b_next!17749) (not b!938600) (not b!938594) (not b_lambda!14175) (not b!938596) b_and!29101 (not b!938598) (not start!79868) (not b!938597) tp_is_empty!20257 (not b!938604) (not b!938603) (not b!938599) (not mapNonEmpty!32157) (not b!938593))
(check-sat b_and!29101 (not b_next!17749))
(get-model)

(declare-fun d!113649 () Bool)

(declare-fun e!527223 () Bool)

(assert (=> d!113649 e!527223))

(declare-fun res!631461 () Bool)

(assert (=> d!113649 (=> res!631461 e!527223)))

(declare-fun lt!423659 () Bool)

(assert (=> d!113649 (= res!631461 (not lt!423659))))

(declare-fun lt!423658 () Bool)

(assert (=> d!113649 (= lt!423659 lt!423658)))

(declare-fun lt!423660 () Unit!31648)

(declare-fun e!527222 () Unit!31648)

(assert (=> d!113649 (= lt!423660 e!527222)))

(declare-fun c!97926 () Bool)

(assert (=> d!113649 (= c!97926 lt!423658)))

(declare-fun containsKey!452 (List!19140 (_ BitVec 64)) Bool)

(assert (=> d!113649 (= lt!423658 (containsKey!452 (toList!6045 lt!423561) k0!1099))))

(assert (=> d!113649 (= (contains!5115 lt!423561 k0!1099) lt!423659)))

(declare-fun b!938724 () Bool)

(declare-fun lt!423657 () Unit!31648)

(assert (=> b!938724 (= e!527222 lt!423657)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!346 (List!19140 (_ BitVec 64)) Unit!31648)

(assert (=> b!938724 (= lt!423657 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6045 lt!423561) k0!1099))))

(declare-datatypes ((Option!487 0))(
  ( (Some!486 (v!12704 V!31975)) (None!485) )
))
(declare-fun isDefined!354 (Option!487) Bool)

(declare-fun getValueByKey!481 (List!19140 (_ BitVec 64)) Option!487)

(assert (=> b!938724 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423561) k0!1099))))

(declare-fun b!938725 () Bool)

(declare-fun Unit!31660 () Unit!31648)

(assert (=> b!938725 (= e!527222 Unit!31660)))

(declare-fun b!938726 () Bool)

(assert (=> b!938726 (= e!527223 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423561) k0!1099)))))

(assert (= (and d!113649 c!97926) b!938724))

(assert (= (and d!113649 (not c!97926)) b!938725))

(assert (= (and d!113649 (not res!631461)) b!938726))

(declare-fun m!873965 () Bool)

(assert (=> d!113649 m!873965))

(declare-fun m!873967 () Bool)

(assert (=> b!938724 m!873967))

(declare-fun m!873969 () Bool)

(assert (=> b!938724 m!873969))

(assert (=> b!938724 m!873969))

(declare-fun m!873971 () Bool)

(assert (=> b!938724 m!873971))

(assert (=> b!938726 m!873969))

(assert (=> b!938726 m!873969))

(assert (=> b!938726 m!873971))

(assert (=> b!938594 d!113649))

(declare-fun b!938769 () Bool)

(declare-fun e!527256 () ListLongMap!12059)

(declare-fun e!527250 () ListLongMap!12059)

(assert (=> b!938769 (= e!527256 e!527250)))

(declare-fun c!97939 () Bool)

(assert (=> b!938769 (= c!97939 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40815 () Bool)

(declare-fun call!40820 () ListLongMap!12059)

(declare-fun call!40822 () ListLongMap!12059)

(assert (=> bm!40815 (= call!40820 call!40822)))

(declare-fun bm!40816 () Bool)

(declare-fun call!40824 () ListLongMap!12059)

(declare-fun call!40821 () ListLongMap!12059)

(assert (=> bm!40816 (= call!40824 call!40821)))

(declare-fun b!938770 () Bool)

(declare-fun e!527254 () Bool)

(declare-fun e!527262 () Bool)

(assert (=> b!938770 (= e!527254 e!527262)))

(declare-fun res!631488 () Bool)

(declare-fun call!40818 () Bool)

(assert (=> b!938770 (= res!631488 call!40818)))

(assert (=> b!938770 (=> (not res!631488) (not e!527262))))

(declare-fun b!938771 () Bool)

(declare-fun e!527257 () Unit!31648)

(declare-fun lt!423722 () Unit!31648)

(assert (=> b!938771 (= e!527257 lt!423722)))

(declare-fun lt!423721 () ListLongMap!12059)

(declare-fun getCurrentListMapNoExtraKeys!3347 (array!56503 array!56505 (_ BitVec 32) (_ BitVec 32) V!31975 V!31975 (_ BitVec 32) Int) ListLongMap!12059)

(assert (=> b!938771 (= lt!423721 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!423710 () (_ BitVec 64))

(assert (=> b!938771 (= lt!423710 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423708 () (_ BitVec 64))

(assert (=> b!938771 (= lt!423708 (select (arr!27187 _keys!1487) from!1844))))

(declare-fun lt!423712 () Unit!31648)

(assert (=> b!938771 (= lt!423712 (addStillContains!556 lt!423721 lt!423710 zeroValue!1173 lt!423708))))

(assert (=> b!938771 (contains!5115 (+!2853 lt!423721 (tuple2!13361 lt!423710 zeroValue!1173)) lt!423708)))

(declare-fun lt!423716 () Unit!31648)

(assert (=> b!938771 (= lt!423716 lt!423712)))

(declare-fun lt!423711 () ListLongMap!12059)

(assert (=> b!938771 (= lt!423711 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!423713 () (_ BitVec 64))

(assert (=> b!938771 (= lt!423713 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423706 () (_ BitVec 64))

(assert (=> b!938771 (= lt!423706 (select (arr!27187 _keys!1487) from!1844))))

(declare-fun lt!423717 () Unit!31648)

(assert (=> b!938771 (= lt!423717 (addApplyDifferent!437 lt!423711 lt!423713 minValue!1173 lt!423706))))

(assert (=> b!938771 (= (apply!862 (+!2853 lt!423711 (tuple2!13361 lt!423713 minValue!1173)) lt!423706) (apply!862 lt!423711 lt!423706))))

(declare-fun lt!423724 () Unit!31648)

(assert (=> b!938771 (= lt!423724 lt!423717)))

(declare-fun lt!423720 () ListLongMap!12059)

(assert (=> b!938771 (= lt!423720 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!423709 () (_ BitVec 64))

(assert (=> b!938771 (= lt!423709 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423718 () (_ BitVec 64))

(assert (=> b!938771 (= lt!423718 (select (arr!27187 _keys!1487) from!1844))))

(declare-fun lt!423725 () Unit!31648)

(assert (=> b!938771 (= lt!423725 (addApplyDifferent!437 lt!423720 lt!423709 zeroValue!1173 lt!423718))))

(assert (=> b!938771 (= (apply!862 (+!2853 lt!423720 (tuple2!13361 lt!423709 zeroValue!1173)) lt!423718) (apply!862 lt!423720 lt!423718))))

(declare-fun lt!423723 () Unit!31648)

(assert (=> b!938771 (= lt!423723 lt!423725)))

(declare-fun lt!423726 () ListLongMap!12059)

(assert (=> b!938771 (= lt!423726 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!423714 () (_ BitVec 64))

(assert (=> b!938771 (= lt!423714 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423707 () (_ BitVec 64))

(assert (=> b!938771 (= lt!423707 (select (arr!27187 _keys!1487) from!1844))))

(assert (=> b!938771 (= lt!423722 (addApplyDifferent!437 lt!423726 lt!423714 minValue!1173 lt!423707))))

(assert (=> b!938771 (= (apply!862 (+!2853 lt!423726 (tuple2!13361 lt!423714 minValue!1173)) lt!423707) (apply!862 lt!423726 lt!423707))))

(declare-fun d!113651 () Bool)

(declare-fun e!527261 () Bool)

(assert (=> d!113651 e!527261))

(declare-fun res!631485 () Bool)

(assert (=> d!113651 (=> (not res!631485) (not e!527261))))

(assert (=> d!113651 (= res!631485 (or (bvsge from!1844 (size!27647 _keys!1487)) (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27647 _keys!1487)))))))

(declare-fun lt!423715 () ListLongMap!12059)

(declare-fun lt!423719 () ListLongMap!12059)

(assert (=> d!113651 (= lt!423715 lt!423719)))

(declare-fun lt!423705 () Unit!31648)

(assert (=> d!113651 (= lt!423705 e!527257)))

(declare-fun c!97941 () Bool)

(declare-fun e!527255 () Bool)

(assert (=> d!113651 (= c!97941 e!527255)))

(declare-fun res!631480 () Bool)

(assert (=> d!113651 (=> (not res!631480) (not e!527255))))

(assert (=> d!113651 (= res!631480 (bvslt from!1844 (size!27647 _keys!1487)))))

(assert (=> d!113651 (= lt!423719 e!527256)))

(declare-fun c!97942 () Bool)

(assert (=> d!113651 (= c!97942 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113651 (validMask!0 mask!1881)))

(assert (=> d!113651 (= (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!423715)))

(declare-fun b!938772 () Bool)

(assert (=> b!938772 (= e!527256 (+!2853 call!40821 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!938773 () Bool)

(declare-fun c!97943 () Bool)

(assert (=> b!938773 (= c!97943 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!527259 () ListLongMap!12059)

(assert (=> b!938773 (= e!527250 e!527259)))

(declare-fun b!938774 () Bool)

(declare-fun e!527251 () Bool)

(declare-fun call!40823 () Bool)

(assert (=> b!938774 (= e!527251 (not call!40823))))

(declare-fun bm!40817 () Bool)

(declare-fun call!40819 () ListLongMap!12059)

(assert (=> bm!40817 (= call!40821 (+!2853 (ite c!97942 call!40822 (ite c!97939 call!40820 call!40819)) (ite (or c!97942 c!97939) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!938775 () Bool)

(assert (=> b!938775 (= e!527254 (not call!40818))))

(declare-fun b!938776 () Bool)

(assert (=> b!938776 (= e!527261 e!527251)))

(declare-fun c!97940 () Bool)

(assert (=> b!938776 (= c!97940 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!938777 () Bool)

(declare-fun res!631487 () Bool)

(assert (=> b!938777 (=> (not res!631487) (not e!527261))))

(declare-fun e!527260 () Bool)

(assert (=> b!938777 (= res!631487 e!527260)))

(declare-fun res!631486 () Bool)

(assert (=> b!938777 (=> res!631486 e!527260)))

(declare-fun e!527253 () Bool)

(assert (=> b!938777 (= res!631486 (not e!527253))))

(declare-fun res!631483 () Bool)

(assert (=> b!938777 (=> (not res!631483) (not e!527253))))

(assert (=> b!938777 (= res!631483 (bvslt from!1844 (size!27647 _keys!1487)))))

(declare-fun b!938778 () Bool)

(assert (=> b!938778 (= e!527253 (validKeyInArray!0 (select (arr!27187 _keys!1487) from!1844)))))

(declare-fun bm!40818 () Bool)

(assert (=> bm!40818 (= call!40822 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!938779 () Bool)

(declare-fun e!527252 () Bool)

(assert (=> b!938779 (= e!527251 e!527252)))

(declare-fun res!631481 () Bool)

(assert (=> b!938779 (= res!631481 call!40823)))

(assert (=> b!938779 (=> (not res!631481) (not e!527252))))

(declare-fun b!938780 () Bool)

(assert (=> b!938780 (= e!527255 (validKeyInArray!0 (select (arr!27187 _keys!1487) from!1844)))))

(declare-fun b!938781 () Bool)

(declare-fun e!527258 () Bool)

(assert (=> b!938781 (= e!527260 e!527258)))

(declare-fun res!631484 () Bool)

(assert (=> b!938781 (=> (not res!631484) (not e!527258))))

(assert (=> b!938781 (= res!631484 (contains!5115 lt!423715 (select (arr!27187 _keys!1487) from!1844)))))

(assert (=> b!938781 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27647 _keys!1487)))))

(declare-fun b!938782 () Bool)

(assert (=> b!938782 (= e!527250 call!40824)))

(declare-fun b!938783 () Bool)

(assert (=> b!938783 (= e!527259 call!40824)))

(declare-fun b!938784 () Bool)

(declare-fun Unit!31661 () Unit!31648)

(assert (=> b!938784 (= e!527257 Unit!31661)))

(declare-fun bm!40819 () Bool)

(assert (=> bm!40819 (= call!40818 (contains!5115 lt!423715 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938785 () Bool)

(assert (=> b!938785 (= e!527258 (= (apply!862 lt!423715 (select (arr!27187 _keys!1487) from!1844)) (get!14353 (select (arr!27188 _values!1231) from!1844) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938785 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27648 _values!1231)))))

(assert (=> b!938785 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27647 _keys!1487)))))

(declare-fun bm!40820 () Bool)

(assert (=> bm!40820 (= call!40819 call!40820)))

(declare-fun b!938786 () Bool)

(declare-fun res!631482 () Bool)

(assert (=> b!938786 (=> (not res!631482) (not e!527261))))

(assert (=> b!938786 (= res!631482 e!527254)))

(declare-fun c!97944 () Bool)

(assert (=> b!938786 (= c!97944 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!938787 () Bool)

(assert (=> b!938787 (= e!527262 (= (apply!862 lt!423715 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun bm!40821 () Bool)

(assert (=> bm!40821 (= call!40823 (contains!5115 lt!423715 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938788 () Bool)

(assert (=> b!938788 (= e!527259 call!40819)))

(declare-fun b!938789 () Bool)

(assert (=> b!938789 (= e!527252 (= (apply!862 lt!423715 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(assert (= (and d!113651 c!97942) b!938772))

(assert (= (and d!113651 (not c!97942)) b!938769))

(assert (= (and b!938769 c!97939) b!938782))

(assert (= (and b!938769 (not c!97939)) b!938773))

(assert (= (and b!938773 c!97943) b!938783))

(assert (= (and b!938773 (not c!97943)) b!938788))

(assert (= (or b!938783 b!938788) bm!40820))

(assert (= (or b!938782 bm!40820) bm!40815))

(assert (= (or b!938782 b!938783) bm!40816))

(assert (= (or b!938772 bm!40815) bm!40818))

(assert (= (or b!938772 bm!40816) bm!40817))

(assert (= (and d!113651 res!631480) b!938780))

(assert (= (and d!113651 c!97941) b!938771))

(assert (= (and d!113651 (not c!97941)) b!938784))

(assert (= (and d!113651 res!631485) b!938777))

(assert (= (and b!938777 res!631483) b!938778))

(assert (= (and b!938777 (not res!631486)) b!938781))

(assert (= (and b!938781 res!631484) b!938785))

(assert (= (and b!938777 res!631487) b!938786))

(assert (= (and b!938786 c!97944) b!938770))

(assert (= (and b!938786 (not c!97944)) b!938775))

(assert (= (and b!938770 res!631488) b!938787))

(assert (= (or b!938770 b!938775) bm!40819))

(assert (= (and b!938786 res!631482) b!938776))

(assert (= (and b!938776 c!97940) b!938779))

(assert (= (and b!938776 (not c!97940)) b!938774))

(assert (= (and b!938779 res!631481) b!938789))

(assert (= (or b!938779 b!938774) bm!40821))

(declare-fun b_lambda!14177 () Bool)

(assert (=> (not b_lambda!14177) (not b!938785)))

(assert (=> b!938785 t!27424))

(declare-fun b_and!29111 () Bool)

(assert (= b_and!29101 (and (=> t!27424 result!12111) b_and!29111)))

(declare-fun m!873973 () Bool)

(assert (=> bm!40817 m!873973))

(declare-fun m!873975 () Bool)

(assert (=> b!938787 m!873975))

(declare-fun m!873977 () Bool)

(assert (=> b!938781 m!873977))

(assert (=> b!938781 m!873977))

(declare-fun m!873979 () Bool)

(assert (=> b!938781 m!873979))

(declare-fun m!873981 () Bool)

(assert (=> bm!40819 m!873981))

(declare-fun m!873983 () Bool)

(assert (=> b!938789 m!873983))

(declare-fun m!873985 () Bool)

(assert (=> bm!40818 m!873985))

(declare-fun m!873987 () Bool)

(assert (=> bm!40821 m!873987))

(assert (=> b!938778 m!873977))

(assert (=> b!938778 m!873977))

(declare-fun m!873989 () Bool)

(assert (=> b!938778 m!873989))

(assert (=> b!938780 m!873977))

(assert (=> b!938780 m!873977))

(assert (=> b!938780 m!873989))

(declare-fun m!873991 () Bool)

(assert (=> b!938771 m!873991))

(declare-fun m!873993 () Bool)

(assert (=> b!938771 m!873993))

(declare-fun m!873995 () Bool)

(assert (=> b!938771 m!873995))

(declare-fun m!873997 () Bool)

(assert (=> b!938771 m!873997))

(declare-fun m!873999 () Bool)

(assert (=> b!938771 m!873999))

(declare-fun m!874001 () Bool)

(assert (=> b!938771 m!874001))

(declare-fun m!874003 () Bool)

(assert (=> b!938771 m!874003))

(assert (=> b!938771 m!873985))

(declare-fun m!874005 () Bool)

(assert (=> b!938771 m!874005))

(declare-fun m!874007 () Bool)

(assert (=> b!938771 m!874007))

(declare-fun m!874009 () Bool)

(assert (=> b!938771 m!874009))

(assert (=> b!938771 m!873995))

(assert (=> b!938771 m!874005))

(declare-fun m!874011 () Bool)

(assert (=> b!938771 m!874011))

(declare-fun m!874013 () Bool)

(assert (=> b!938771 m!874013))

(assert (=> b!938771 m!874013))

(declare-fun m!874015 () Bool)

(assert (=> b!938771 m!874015))

(assert (=> b!938771 m!873999))

(declare-fun m!874017 () Bool)

(assert (=> b!938771 m!874017))

(declare-fun m!874019 () Bool)

(assert (=> b!938771 m!874019))

(assert (=> b!938771 m!873977))

(declare-fun m!874021 () Bool)

(assert (=> b!938772 m!874021))

(declare-fun m!874023 () Bool)

(assert (=> b!938785 m!874023))

(assert (=> b!938785 m!873795))

(declare-fun m!874025 () Bool)

(assert (=> b!938785 m!874025))

(assert (=> b!938785 m!873977))

(assert (=> b!938785 m!873795))

(assert (=> b!938785 m!874023))

(assert (=> b!938785 m!873977))

(declare-fun m!874027 () Bool)

(assert (=> b!938785 m!874027))

(assert (=> d!113651 m!873827))

(assert (=> b!938594 d!113651))

(declare-fun d!113653 () Bool)

(assert (=> d!113653 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!79868 d!113653))

(declare-fun d!113655 () Bool)

(assert (=> d!113655 (= (array_inv!21232 _values!1231) (bvsge (size!27648 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!79868 d!113655))

(declare-fun d!113657 () Bool)

(assert (=> d!113657 (= (array_inv!21233 _keys!1487) (bvsge (size!27647 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!79868 d!113657))

(declare-fun b!938800 () Bool)

(declare-fun e!527274 () Bool)

(declare-fun call!40827 () Bool)

(assert (=> b!938800 (= e!527274 call!40827)))

(declare-fun b!938801 () Bool)

(declare-fun e!527271 () Bool)

(declare-fun contains!5118 (List!19141 (_ BitVec 64)) Bool)

(assert (=> b!938801 (= e!527271 (contains!5118 Nil!19138 (select (arr!27187 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun bm!40824 () Bool)

(declare-fun c!97947 () Bool)

(assert (=> bm!40824 (= call!40827 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97947 (Cons!19137 (select (arr!27187 _keys!1487) #b00000000000000000000000000000000) Nil!19138) Nil!19138)))))

(declare-fun b!938802 () Bool)

(declare-fun e!527273 () Bool)

(assert (=> b!938802 (= e!527273 e!527274)))

(assert (=> b!938802 (= c!97947 (validKeyInArray!0 (select (arr!27187 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!938803 () Bool)

(assert (=> b!938803 (= e!527274 call!40827)))

(declare-fun d!113659 () Bool)

(declare-fun res!631496 () Bool)

(declare-fun e!527272 () Bool)

(assert (=> d!113659 (=> res!631496 e!527272)))

(assert (=> d!113659 (= res!631496 (bvsge #b00000000000000000000000000000000 (size!27647 _keys!1487)))))

(assert (=> d!113659 (= (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19138) e!527272)))

(declare-fun b!938804 () Bool)

(assert (=> b!938804 (= e!527272 e!527273)))

(declare-fun res!631495 () Bool)

(assert (=> b!938804 (=> (not res!631495) (not e!527273))))

(assert (=> b!938804 (= res!631495 (not e!527271))))

(declare-fun res!631497 () Bool)

(assert (=> b!938804 (=> (not res!631497) (not e!527271))))

(assert (=> b!938804 (= res!631497 (validKeyInArray!0 (select (arr!27187 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!113659 (not res!631496)) b!938804))

(assert (= (and b!938804 res!631497) b!938801))

(assert (= (and b!938804 res!631495) b!938802))

(assert (= (and b!938802 c!97947) b!938800))

(assert (= (and b!938802 (not c!97947)) b!938803))

(assert (= (or b!938800 b!938803) bm!40824))

(declare-fun m!874029 () Bool)

(assert (=> b!938801 m!874029))

(assert (=> b!938801 m!874029))

(declare-fun m!874031 () Bool)

(assert (=> b!938801 m!874031))

(assert (=> bm!40824 m!874029))

(declare-fun m!874033 () Bool)

(assert (=> bm!40824 m!874033))

(assert (=> b!938802 m!874029))

(assert (=> b!938802 m!874029))

(declare-fun m!874035 () Bool)

(assert (=> b!938802 m!874035))

(assert (=> b!938804 m!874029))

(assert (=> b!938804 m!874029))

(assert (=> b!938804 m!874035))

(assert (=> b!938599 d!113659))

(declare-fun d!113661 () Bool)

(declare-fun res!631503 () Bool)

(declare-fun e!527283 () Bool)

(assert (=> d!113661 (=> res!631503 e!527283)))

(assert (=> d!113661 (= res!631503 (bvsge #b00000000000000000000000000000000 (size!27647 _keys!1487)))))

(assert (=> d!113661 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!527283)))

(declare-fun b!938813 () Bool)

(declare-fun e!527281 () Bool)

(assert (=> b!938813 (= e!527283 e!527281)))

(declare-fun c!97950 () Bool)

(assert (=> b!938813 (= c!97950 (validKeyInArray!0 (select (arr!27187 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun bm!40827 () Bool)

(declare-fun call!40830 () Bool)

(assert (=> bm!40827 (= call!40830 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!938814 () Bool)

(declare-fun e!527282 () Bool)

(assert (=> b!938814 (= e!527281 e!527282)))

(declare-fun lt!423733 () (_ BitVec 64))

(assert (=> b!938814 (= lt!423733 (select (arr!27187 _keys!1487) #b00000000000000000000000000000000))))

(declare-fun lt!423734 () Unit!31648)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56503 (_ BitVec 64) (_ BitVec 32)) Unit!31648)

(assert (=> b!938814 (= lt!423734 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!423733 #b00000000000000000000000000000000))))

(assert (=> b!938814 (arrayContainsKey!0 _keys!1487 lt!423733 #b00000000000000000000000000000000)))

(declare-fun lt!423735 () Unit!31648)

(assert (=> b!938814 (= lt!423735 lt!423734)))

(declare-fun res!631502 () Bool)

(declare-datatypes ((SeekEntryResult!8935 0))(
  ( (MissingZero!8935 (index!38111 (_ BitVec 32))) (Found!8935 (index!38112 (_ BitVec 32))) (Intermediate!8935 (undefined!9747 Bool) (index!38113 (_ BitVec 32)) (x!80400 (_ BitVec 32))) (Undefined!8935) (MissingVacant!8935 (index!38114 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56503 (_ BitVec 32)) SeekEntryResult!8935)

(assert (=> b!938814 (= res!631502 (= (seekEntryOrOpen!0 (select (arr!27187 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8935 #b00000000000000000000000000000000)))))

(assert (=> b!938814 (=> (not res!631502) (not e!527282))))

(declare-fun b!938815 () Bool)

(assert (=> b!938815 (= e!527282 call!40830)))

(declare-fun b!938816 () Bool)

(assert (=> b!938816 (= e!527281 call!40830)))

(assert (= (and d!113661 (not res!631503)) b!938813))

(assert (= (and b!938813 c!97950) b!938814))

(assert (= (and b!938813 (not c!97950)) b!938816))

(assert (= (and b!938814 res!631502) b!938815))

(assert (= (or b!938815 b!938816) bm!40827))

(assert (=> b!938813 m!874029))

(assert (=> b!938813 m!874029))

(assert (=> b!938813 m!874035))

(declare-fun m!874037 () Bool)

(assert (=> bm!40827 m!874037))

(assert (=> b!938814 m!874029))

(declare-fun m!874039 () Bool)

(assert (=> b!938814 m!874039))

(declare-fun m!874041 () Bool)

(assert (=> b!938814 m!874041))

(assert (=> b!938814 m!874029))

(declare-fun m!874043 () Bool)

(assert (=> b!938814 m!874043))

(assert (=> b!938604 d!113661))

(declare-fun d!113663 () Bool)

(declare-fun get!14356 (Option!487) V!31975)

(assert (=> d!113663 (= (apply!862 lt!423561 k0!1099) (get!14356 (getValueByKey!481 (toList!6045 lt!423561) k0!1099)))))

(declare-fun bs!26315 () Bool)

(assert (= bs!26315 d!113663))

(assert (=> bs!26315 m!873969))

(assert (=> bs!26315 m!873969))

(declare-fun m!874045 () Bool)

(assert (=> bs!26315 m!874045))

(assert (=> b!938598 d!113663))

(declare-fun d!113665 () Bool)

(declare-fun e!527285 () Bool)

(assert (=> d!113665 e!527285))

(declare-fun res!631504 () Bool)

(assert (=> d!113665 (=> res!631504 e!527285)))

(declare-fun lt!423738 () Bool)

(assert (=> d!113665 (= res!631504 (not lt!423738))))

(declare-fun lt!423737 () Bool)

(assert (=> d!113665 (= lt!423738 lt!423737)))

(declare-fun lt!423739 () Unit!31648)

(declare-fun e!527284 () Unit!31648)

(assert (=> d!113665 (= lt!423739 e!527284)))

(declare-fun c!97951 () Bool)

(assert (=> d!113665 (= c!97951 lt!423737)))

(assert (=> d!113665 (= lt!423737 (containsKey!452 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099))))

(assert (=> d!113665 (= (contains!5115 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) k0!1099) lt!423738)))

(declare-fun b!938817 () Bool)

(declare-fun lt!423736 () Unit!31648)

(assert (=> b!938817 (= e!527284 lt!423736)))

(assert (=> b!938817 (= lt!423736 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099))))

(assert (=> b!938817 (isDefined!354 (getValueByKey!481 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099))))

(declare-fun b!938818 () Bool)

(declare-fun Unit!31662 () Unit!31648)

(assert (=> b!938818 (= e!527284 Unit!31662)))

(declare-fun b!938819 () Bool)

(assert (=> b!938819 (= e!527285 (isDefined!354 (getValueByKey!481 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099)))))

(assert (= (and d!113665 c!97951) b!938817))

(assert (= (and d!113665 (not c!97951)) b!938818))

(assert (= (and d!113665 (not res!631504)) b!938819))

(declare-fun m!874047 () Bool)

(assert (=> d!113665 m!874047))

(declare-fun m!874049 () Bool)

(assert (=> b!938817 m!874049))

(declare-fun m!874051 () Bool)

(assert (=> b!938817 m!874051))

(assert (=> b!938817 m!874051))

(declare-fun m!874053 () Bool)

(assert (=> b!938817 m!874053))

(assert (=> b!938819 m!874051))

(assert (=> b!938819 m!874051))

(assert (=> b!938819 m!874053))

(assert (=> b!938603 d!113665))

(declare-fun b!938820 () Bool)

(declare-fun e!527292 () ListLongMap!12059)

(declare-fun e!527286 () ListLongMap!12059)

(assert (=> b!938820 (= e!527292 e!527286)))

(declare-fun c!97952 () Bool)

(assert (=> b!938820 (= c!97952 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40828 () Bool)

(declare-fun call!40833 () ListLongMap!12059)

(declare-fun call!40835 () ListLongMap!12059)

(assert (=> bm!40828 (= call!40833 call!40835)))

(declare-fun bm!40829 () Bool)

(declare-fun call!40837 () ListLongMap!12059)

(declare-fun call!40834 () ListLongMap!12059)

(assert (=> bm!40829 (= call!40837 call!40834)))

(declare-fun b!938821 () Bool)

(declare-fun e!527290 () Bool)

(declare-fun e!527298 () Bool)

(assert (=> b!938821 (= e!527290 e!527298)))

(declare-fun res!631513 () Bool)

(declare-fun call!40831 () Bool)

(assert (=> b!938821 (= res!631513 call!40831)))

(assert (=> b!938821 (=> (not res!631513) (not e!527298))))

(declare-fun b!938822 () Bool)

(declare-fun e!527293 () Unit!31648)

(declare-fun lt!423757 () Unit!31648)

(assert (=> b!938822 (= e!527293 lt!423757)))

(declare-fun lt!423756 () ListLongMap!12059)

(assert (=> b!938822 (= lt!423756 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423745 () (_ BitVec 64))

(assert (=> b!938822 (= lt!423745 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423743 () (_ BitVec 64))

(assert (=> b!938822 (= lt!423743 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!423747 () Unit!31648)

(assert (=> b!938822 (= lt!423747 (addStillContains!556 lt!423756 lt!423745 zeroValue!1173 lt!423743))))

(assert (=> b!938822 (contains!5115 (+!2853 lt!423756 (tuple2!13361 lt!423745 zeroValue!1173)) lt!423743)))

(declare-fun lt!423751 () Unit!31648)

(assert (=> b!938822 (= lt!423751 lt!423747)))

(declare-fun lt!423746 () ListLongMap!12059)

(assert (=> b!938822 (= lt!423746 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423748 () (_ BitVec 64))

(assert (=> b!938822 (= lt!423748 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423741 () (_ BitVec 64))

(assert (=> b!938822 (= lt!423741 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!423752 () Unit!31648)

(assert (=> b!938822 (= lt!423752 (addApplyDifferent!437 lt!423746 lt!423748 minValue!1173 lt!423741))))

(assert (=> b!938822 (= (apply!862 (+!2853 lt!423746 (tuple2!13361 lt!423748 minValue!1173)) lt!423741) (apply!862 lt!423746 lt!423741))))

(declare-fun lt!423759 () Unit!31648)

(assert (=> b!938822 (= lt!423759 lt!423752)))

(declare-fun lt!423755 () ListLongMap!12059)

(assert (=> b!938822 (= lt!423755 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423744 () (_ BitVec 64))

(assert (=> b!938822 (= lt!423744 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423753 () (_ BitVec 64))

(assert (=> b!938822 (= lt!423753 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!423760 () Unit!31648)

(assert (=> b!938822 (= lt!423760 (addApplyDifferent!437 lt!423755 lt!423744 zeroValue!1173 lt!423753))))

(assert (=> b!938822 (= (apply!862 (+!2853 lt!423755 (tuple2!13361 lt!423744 zeroValue!1173)) lt!423753) (apply!862 lt!423755 lt!423753))))

(declare-fun lt!423758 () Unit!31648)

(assert (=> b!938822 (= lt!423758 lt!423760)))

(declare-fun lt!423761 () ListLongMap!12059)

(assert (=> b!938822 (= lt!423761 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423749 () (_ BitVec 64))

(assert (=> b!938822 (= lt!423749 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423742 () (_ BitVec 64))

(assert (=> b!938822 (= lt!423742 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!938822 (= lt!423757 (addApplyDifferent!437 lt!423761 lt!423749 minValue!1173 lt!423742))))

(assert (=> b!938822 (= (apply!862 (+!2853 lt!423761 (tuple2!13361 lt!423749 minValue!1173)) lt!423742) (apply!862 lt!423761 lt!423742))))

(declare-fun d!113667 () Bool)

(declare-fun e!527297 () Bool)

(assert (=> d!113667 e!527297))

(declare-fun res!631510 () Bool)

(assert (=> d!113667 (=> (not res!631510) (not e!527297))))

(assert (=> d!113667 (= res!631510 (or (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27647 _keys!1487)) (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27647 _keys!1487)))))))

(declare-fun lt!423750 () ListLongMap!12059)

(declare-fun lt!423754 () ListLongMap!12059)

(assert (=> d!113667 (= lt!423750 lt!423754)))

(declare-fun lt!423740 () Unit!31648)

(assert (=> d!113667 (= lt!423740 e!527293)))

(declare-fun c!97954 () Bool)

(declare-fun e!527291 () Bool)

(assert (=> d!113667 (= c!97954 e!527291)))

(declare-fun res!631505 () Bool)

(assert (=> d!113667 (=> (not res!631505) (not e!527291))))

(assert (=> d!113667 (= res!631505 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27647 _keys!1487)))))

(assert (=> d!113667 (= lt!423754 e!527292)))

(declare-fun c!97955 () Bool)

(assert (=> d!113667 (= c!97955 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113667 (validMask!0 mask!1881)))

(assert (=> d!113667 (= (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!423750)))

(declare-fun b!938823 () Bool)

(assert (=> b!938823 (= e!527292 (+!2853 call!40834 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!938824 () Bool)

(declare-fun c!97956 () Bool)

(assert (=> b!938824 (= c!97956 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!527295 () ListLongMap!12059)

(assert (=> b!938824 (= e!527286 e!527295)))

(declare-fun b!938825 () Bool)

(declare-fun e!527287 () Bool)

(declare-fun call!40836 () Bool)

(assert (=> b!938825 (= e!527287 (not call!40836))))

(declare-fun call!40832 () ListLongMap!12059)

(declare-fun bm!40830 () Bool)

(assert (=> bm!40830 (= call!40834 (+!2853 (ite c!97955 call!40835 (ite c!97952 call!40833 call!40832)) (ite (or c!97955 c!97952) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!938826 () Bool)

(assert (=> b!938826 (= e!527290 (not call!40831))))

(declare-fun b!938827 () Bool)

(assert (=> b!938827 (= e!527297 e!527287)))

(declare-fun c!97953 () Bool)

(assert (=> b!938827 (= c!97953 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!938828 () Bool)

(declare-fun res!631512 () Bool)

(assert (=> b!938828 (=> (not res!631512) (not e!527297))))

(declare-fun e!527296 () Bool)

(assert (=> b!938828 (= res!631512 e!527296)))

(declare-fun res!631511 () Bool)

(assert (=> b!938828 (=> res!631511 e!527296)))

(declare-fun e!527289 () Bool)

(assert (=> b!938828 (= res!631511 (not e!527289))))

(declare-fun res!631508 () Bool)

(assert (=> b!938828 (=> (not res!631508) (not e!527289))))

(assert (=> b!938828 (= res!631508 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27647 _keys!1487)))))

(declare-fun b!938829 () Bool)

(assert (=> b!938829 (= e!527289 (validKeyInArray!0 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun bm!40831 () Bool)

(assert (=> bm!40831 (= call!40835 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!938830 () Bool)

(declare-fun e!527288 () Bool)

(assert (=> b!938830 (= e!527287 e!527288)))

(declare-fun res!631506 () Bool)

(assert (=> b!938830 (= res!631506 call!40836)))

(assert (=> b!938830 (=> (not res!631506) (not e!527288))))

(declare-fun b!938831 () Bool)

(assert (=> b!938831 (= e!527291 (validKeyInArray!0 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!938832 () Bool)

(declare-fun e!527294 () Bool)

(assert (=> b!938832 (= e!527296 e!527294)))

(declare-fun res!631509 () Bool)

(assert (=> b!938832 (=> (not res!631509) (not e!527294))))

(assert (=> b!938832 (= res!631509 (contains!5115 lt!423750 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938832 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27647 _keys!1487)))))

(declare-fun b!938833 () Bool)

(assert (=> b!938833 (= e!527286 call!40837)))

(declare-fun b!938834 () Bool)

(assert (=> b!938834 (= e!527295 call!40837)))

(declare-fun b!938835 () Bool)

(declare-fun Unit!31663 () Unit!31648)

(assert (=> b!938835 (= e!527293 Unit!31663)))

(declare-fun bm!40832 () Bool)

(assert (=> bm!40832 (= call!40831 (contains!5115 lt!423750 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938836 () Bool)

(assert (=> b!938836 (= e!527294 (= (apply!862 lt!423750 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14353 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938836 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27648 _values!1231)))))

(assert (=> b!938836 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27647 _keys!1487)))))

(declare-fun bm!40833 () Bool)

(assert (=> bm!40833 (= call!40832 call!40833)))

(declare-fun b!938837 () Bool)

(declare-fun res!631507 () Bool)

(assert (=> b!938837 (=> (not res!631507) (not e!527297))))

(assert (=> b!938837 (= res!631507 e!527290)))

(declare-fun c!97957 () Bool)

(assert (=> b!938837 (= c!97957 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!938838 () Bool)

(assert (=> b!938838 (= e!527298 (= (apply!862 lt!423750 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun bm!40834 () Bool)

(assert (=> bm!40834 (= call!40836 (contains!5115 lt!423750 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938839 () Bool)

(assert (=> b!938839 (= e!527295 call!40832)))

(declare-fun b!938840 () Bool)

(assert (=> b!938840 (= e!527288 (= (apply!862 lt!423750 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(assert (= (and d!113667 c!97955) b!938823))

(assert (= (and d!113667 (not c!97955)) b!938820))

(assert (= (and b!938820 c!97952) b!938833))

(assert (= (and b!938820 (not c!97952)) b!938824))

(assert (= (and b!938824 c!97956) b!938834))

(assert (= (and b!938824 (not c!97956)) b!938839))

(assert (= (or b!938834 b!938839) bm!40833))

(assert (= (or b!938833 bm!40833) bm!40828))

(assert (= (or b!938833 b!938834) bm!40829))

(assert (= (or b!938823 bm!40828) bm!40831))

(assert (= (or b!938823 bm!40829) bm!40830))

(assert (= (and d!113667 res!631505) b!938831))

(assert (= (and d!113667 c!97954) b!938822))

(assert (= (and d!113667 (not c!97954)) b!938835))

(assert (= (and d!113667 res!631510) b!938828))

(assert (= (and b!938828 res!631508) b!938829))

(assert (= (and b!938828 (not res!631511)) b!938832))

(assert (= (and b!938832 res!631509) b!938836))

(assert (= (and b!938828 res!631512) b!938837))

(assert (= (and b!938837 c!97957) b!938821))

(assert (= (and b!938837 (not c!97957)) b!938826))

(assert (= (and b!938821 res!631513) b!938838))

(assert (= (or b!938821 b!938826) bm!40832))

(assert (= (and b!938837 res!631507) b!938827))

(assert (= (and b!938827 c!97953) b!938830))

(assert (= (and b!938827 (not c!97953)) b!938825))

(assert (= (and b!938830 res!631506) b!938840))

(assert (= (or b!938830 b!938825) bm!40834))

(declare-fun b_lambda!14179 () Bool)

(assert (=> (not b_lambda!14179) (not b!938836)))

(assert (=> b!938836 t!27424))

(declare-fun b_and!29113 () Bool)

(assert (= b_and!29111 (and (=> t!27424 result!12111) b_and!29113)))

(declare-fun m!874055 () Bool)

(assert (=> bm!40830 m!874055))

(declare-fun m!874057 () Bool)

(assert (=> b!938838 m!874057))

(assert (=> b!938832 m!873841))

(assert (=> b!938832 m!873841))

(declare-fun m!874059 () Bool)

(assert (=> b!938832 m!874059))

(declare-fun m!874061 () Bool)

(assert (=> bm!40832 m!874061))

(declare-fun m!874063 () Bool)

(assert (=> b!938840 m!874063))

(declare-fun m!874065 () Bool)

(assert (=> bm!40831 m!874065))

(declare-fun m!874067 () Bool)

(assert (=> bm!40834 m!874067))

(assert (=> b!938829 m!873841))

(assert (=> b!938829 m!873841))

(declare-fun m!874069 () Bool)

(assert (=> b!938829 m!874069))

(assert (=> b!938831 m!873841))

(assert (=> b!938831 m!873841))

(assert (=> b!938831 m!874069))

(declare-fun m!874071 () Bool)

(assert (=> b!938822 m!874071))

(declare-fun m!874073 () Bool)

(assert (=> b!938822 m!874073))

(declare-fun m!874075 () Bool)

(assert (=> b!938822 m!874075))

(declare-fun m!874077 () Bool)

(assert (=> b!938822 m!874077))

(declare-fun m!874079 () Bool)

(assert (=> b!938822 m!874079))

(declare-fun m!874081 () Bool)

(assert (=> b!938822 m!874081))

(declare-fun m!874083 () Bool)

(assert (=> b!938822 m!874083))

(assert (=> b!938822 m!874065))

(declare-fun m!874085 () Bool)

(assert (=> b!938822 m!874085))

(declare-fun m!874087 () Bool)

(assert (=> b!938822 m!874087))

(declare-fun m!874089 () Bool)

(assert (=> b!938822 m!874089))

(assert (=> b!938822 m!874075))

(assert (=> b!938822 m!874085))

(declare-fun m!874091 () Bool)

(assert (=> b!938822 m!874091))

(declare-fun m!874093 () Bool)

(assert (=> b!938822 m!874093))

(assert (=> b!938822 m!874093))

(declare-fun m!874095 () Bool)

(assert (=> b!938822 m!874095))

(assert (=> b!938822 m!874079))

(declare-fun m!874097 () Bool)

(assert (=> b!938822 m!874097))

(declare-fun m!874099 () Bool)

(assert (=> b!938822 m!874099))

(assert (=> b!938822 m!873841))

(declare-fun m!874101 () Bool)

(assert (=> b!938823 m!874101))

(assert (=> b!938836 m!873793))

(assert (=> b!938836 m!873795))

(assert (=> b!938836 m!873801))

(assert (=> b!938836 m!873841))

(assert (=> b!938836 m!873795))

(assert (=> b!938836 m!873793))

(assert (=> b!938836 m!873841))

(declare-fun m!874103 () Bool)

(assert (=> b!938836 m!874103))

(assert (=> d!113667 m!873827))

(assert (=> b!938603 d!113667))

(declare-fun d!113669 () Bool)

(assert (=> d!113669 (= (validKeyInArray!0 lt!423563) (and (not (= lt!423563 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!423563 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938593 d!113669))

(assert (=> b!938597 d!113667))

(declare-fun b!938841 () Bool)

(declare-fun e!527305 () ListLongMap!12059)

(declare-fun e!527299 () ListLongMap!12059)

(assert (=> b!938841 (= e!527305 e!527299)))

(declare-fun c!97958 () Bool)

(assert (=> b!938841 (= c!97958 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40835 () Bool)

(declare-fun call!40840 () ListLongMap!12059)

(declare-fun call!40842 () ListLongMap!12059)

(assert (=> bm!40835 (= call!40840 call!40842)))

(declare-fun bm!40836 () Bool)

(declare-fun call!40844 () ListLongMap!12059)

(declare-fun call!40841 () ListLongMap!12059)

(assert (=> bm!40836 (= call!40844 call!40841)))

(declare-fun b!938842 () Bool)

(declare-fun e!527303 () Bool)

(declare-fun e!527311 () Bool)

(assert (=> b!938842 (= e!527303 e!527311)))

(declare-fun res!631522 () Bool)

(declare-fun call!40838 () Bool)

(assert (=> b!938842 (= res!631522 call!40838)))

(assert (=> b!938842 (=> (not res!631522) (not e!527311))))

(declare-fun b!938843 () Bool)

(declare-fun e!527306 () Unit!31648)

(declare-fun lt!423779 () Unit!31648)

(assert (=> b!938843 (= e!527306 lt!423779)))

(declare-fun lt!423778 () ListLongMap!12059)

(assert (=> b!938843 (= lt!423778 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!423767 () (_ BitVec 64))

(assert (=> b!938843 (= lt!423767 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423765 () (_ BitVec 64))

(assert (=> b!938843 (= lt!423765 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!423769 () Unit!31648)

(assert (=> b!938843 (= lt!423769 (addStillContains!556 lt!423778 lt!423767 zeroValue!1173 lt!423765))))

(assert (=> b!938843 (contains!5115 (+!2853 lt!423778 (tuple2!13361 lt!423767 zeroValue!1173)) lt!423765)))

(declare-fun lt!423773 () Unit!31648)

(assert (=> b!938843 (= lt!423773 lt!423769)))

(declare-fun lt!423768 () ListLongMap!12059)

(assert (=> b!938843 (= lt!423768 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!423770 () (_ BitVec 64))

(assert (=> b!938843 (= lt!423770 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423763 () (_ BitVec 64))

(assert (=> b!938843 (= lt!423763 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!423774 () Unit!31648)

(assert (=> b!938843 (= lt!423774 (addApplyDifferent!437 lt!423768 lt!423770 minValue!1173 lt!423763))))

(assert (=> b!938843 (= (apply!862 (+!2853 lt!423768 (tuple2!13361 lt!423770 minValue!1173)) lt!423763) (apply!862 lt!423768 lt!423763))))

(declare-fun lt!423781 () Unit!31648)

(assert (=> b!938843 (= lt!423781 lt!423774)))

(declare-fun lt!423777 () ListLongMap!12059)

(assert (=> b!938843 (= lt!423777 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!423766 () (_ BitVec 64))

(assert (=> b!938843 (= lt!423766 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423775 () (_ BitVec 64))

(assert (=> b!938843 (= lt!423775 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!423782 () Unit!31648)

(assert (=> b!938843 (= lt!423782 (addApplyDifferent!437 lt!423777 lt!423766 zeroValue!1173 lt!423775))))

(assert (=> b!938843 (= (apply!862 (+!2853 lt!423777 (tuple2!13361 lt!423766 zeroValue!1173)) lt!423775) (apply!862 lt!423777 lt!423775))))

(declare-fun lt!423780 () Unit!31648)

(assert (=> b!938843 (= lt!423780 lt!423782)))

(declare-fun lt!423783 () ListLongMap!12059)

(assert (=> b!938843 (= lt!423783 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!423771 () (_ BitVec 64))

(assert (=> b!938843 (= lt!423771 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423764 () (_ BitVec 64))

(assert (=> b!938843 (= lt!423764 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938843 (= lt!423779 (addApplyDifferent!437 lt!423783 lt!423771 minValue!1173 lt!423764))))

(assert (=> b!938843 (= (apply!862 (+!2853 lt!423783 (tuple2!13361 lt!423771 minValue!1173)) lt!423764) (apply!862 lt!423783 lt!423764))))

(declare-fun d!113671 () Bool)

(declare-fun e!527310 () Bool)

(assert (=> d!113671 e!527310))

(declare-fun res!631519 () Bool)

(assert (=> d!113671 (=> (not res!631519) (not e!527310))))

(assert (=> d!113671 (= res!631519 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27647 _keys!1487)) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27647 _keys!1487)))))))

(declare-fun lt!423772 () ListLongMap!12059)

(declare-fun lt!423776 () ListLongMap!12059)

(assert (=> d!113671 (= lt!423772 lt!423776)))

(declare-fun lt!423762 () Unit!31648)

(assert (=> d!113671 (= lt!423762 e!527306)))

(declare-fun c!97960 () Bool)

(declare-fun e!527304 () Bool)

(assert (=> d!113671 (= c!97960 e!527304)))

(declare-fun res!631514 () Bool)

(assert (=> d!113671 (=> (not res!631514) (not e!527304))))

(assert (=> d!113671 (= res!631514 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27647 _keys!1487)))))

(assert (=> d!113671 (= lt!423776 e!527305)))

(declare-fun c!97961 () Bool)

(assert (=> d!113671 (= c!97961 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113671 (validMask!0 mask!1881)))

(assert (=> d!113671 (= (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423772)))

(declare-fun b!938844 () Bool)

(assert (=> b!938844 (= e!527305 (+!2853 call!40841 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!938845 () Bool)

(declare-fun c!97962 () Bool)

(assert (=> b!938845 (= c!97962 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!527308 () ListLongMap!12059)

(assert (=> b!938845 (= e!527299 e!527308)))

(declare-fun b!938846 () Bool)

(declare-fun e!527300 () Bool)

(declare-fun call!40843 () Bool)

(assert (=> b!938846 (= e!527300 (not call!40843))))

(declare-fun call!40839 () ListLongMap!12059)

(declare-fun bm!40837 () Bool)

(assert (=> bm!40837 (= call!40841 (+!2853 (ite c!97961 call!40842 (ite c!97958 call!40840 call!40839)) (ite (or c!97961 c!97958) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!938847 () Bool)

(assert (=> b!938847 (= e!527303 (not call!40838))))

(declare-fun b!938848 () Bool)

(assert (=> b!938848 (= e!527310 e!527300)))

(declare-fun c!97959 () Bool)

(assert (=> b!938848 (= c!97959 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!938849 () Bool)

(declare-fun res!631521 () Bool)

(assert (=> b!938849 (=> (not res!631521) (not e!527310))))

(declare-fun e!527309 () Bool)

(assert (=> b!938849 (= res!631521 e!527309)))

(declare-fun res!631520 () Bool)

(assert (=> b!938849 (=> res!631520 e!527309)))

(declare-fun e!527302 () Bool)

(assert (=> b!938849 (= res!631520 (not e!527302))))

(declare-fun res!631517 () Bool)

(assert (=> b!938849 (=> (not res!631517) (not e!527302))))

(assert (=> b!938849 (= res!631517 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27647 _keys!1487)))))

(declare-fun b!938850 () Bool)

(assert (=> b!938850 (= e!527302 (validKeyInArray!0 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun bm!40838 () Bool)

(assert (=> bm!40838 (= call!40842 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun b!938851 () Bool)

(declare-fun e!527301 () Bool)

(assert (=> b!938851 (= e!527300 e!527301)))

(declare-fun res!631515 () Bool)

(assert (=> b!938851 (= res!631515 call!40843)))

(assert (=> b!938851 (=> (not res!631515) (not e!527301))))

(declare-fun b!938852 () Bool)

(assert (=> b!938852 (= e!527304 (validKeyInArray!0 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!938853 () Bool)

(declare-fun e!527307 () Bool)

(assert (=> b!938853 (= e!527309 e!527307)))

(declare-fun res!631518 () Bool)

(assert (=> b!938853 (=> (not res!631518) (not e!527307))))

(assert (=> b!938853 (= res!631518 (contains!5115 lt!423772 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!938853 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27647 _keys!1487)))))

(declare-fun b!938854 () Bool)

(assert (=> b!938854 (= e!527299 call!40844)))

(declare-fun b!938855 () Bool)

(assert (=> b!938855 (= e!527308 call!40844)))

(declare-fun b!938856 () Bool)

(declare-fun Unit!31664 () Unit!31648)

(assert (=> b!938856 (= e!527306 Unit!31664)))

(declare-fun bm!40839 () Bool)

(assert (=> bm!40839 (= call!40838 (contains!5115 lt!423772 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938857 () Bool)

(assert (=> b!938857 (= e!527307 (= (apply!862 lt!423772 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14353 (select (arr!27188 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938857 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27648 _values!1231)))))

(assert (=> b!938857 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27647 _keys!1487)))))

(declare-fun bm!40840 () Bool)

(assert (=> bm!40840 (= call!40839 call!40840)))

(declare-fun b!938858 () Bool)

(declare-fun res!631516 () Bool)

(assert (=> b!938858 (=> (not res!631516) (not e!527310))))

(assert (=> b!938858 (= res!631516 e!527303)))

(declare-fun c!97963 () Bool)

(assert (=> b!938858 (= c!97963 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!938859 () Bool)

(assert (=> b!938859 (= e!527311 (= (apply!862 lt!423772 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun bm!40841 () Bool)

(assert (=> bm!40841 (= call!40843 (contains!5115 lt!423772 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938860 () Bool)

(assert (=> b!938860 (= e!527308 call!40839)))

(declare-fun b!938861 () Bool)

(assert (=> b!938861 (= e!527301 (= (apply!862 lt!423772 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(assert (= (and d!113671 c!97961) b!938844))

(assert (= (and d!113671 (not c!97961)) b!938841))

(assert (= (and b!938841 c!97958) b!938854))

(assert (= (and b!938841 (not c!97958)) b!938845))

(assert (= (and b!938845 c!97962) b!938855))

(assert (= (and b!938845 (not c!97962)) b!938860))

(assert (= (or b!938855 b!938860) bm!40840))

(assert (= (or b!938854 bm!40840) bm!40835))

(assert (= (or b!938854 b!938855) bm!40836))

(assert (= (or b!938844 bm!40835) bm!40838))

(assert (= (or b!938844 bm!40836) bm!40837))

(assert (= (and d!113671 res!631514) b!938852))

(assert (= (and d!113671 c!97960) b!938843))

(assert (= (and d!113671 (not c!97960)) b!938856))

(assert (= (and d!113671 res!631519) b!938849))

(assert (= (and b!938849 res!631517) b!938850))

(assert (= (and b!938849 (not res!631520)) b!938853))

(assert (= (and b!938853 res!631518) b!938857))

(assert (= (and b!938849 res!631521) b!938858))

(assert (= (and b!938858 c!97963) b!938842))

(assert (= (and b!938858 (not c!97963)) b!938847))

(assert (= (and b!938842 res!631522) b!938859))

(assert (= (or b!938842 b!938847) bm!40839))

(assert (= (and b!938858 res!631516) b!938848))

(assert (= (and b!938848 c!97959) b!938851))

(assert (= (and b!938848 (not c!97959)) b!938846))

(assert (= (and b!938851 res!631515) b!938861))

(assert (= (or b!938851 b!938846) bm!40841))

(declare-fun b_lambda!14181 () Bool)

(assert (=> (not b_lambda!14181) (not b!938857)))

(assert (=> b!938857 t!27424))

(declare-fun b_and!29115 () Bool)

(assert (= b_and!29113 (and (=> t!27424 result!12111) b_and!29115)))

(declare-fun m!874105 () Bool)

(assert (=> bm!40837 m!874105))

(declare-fun m!874107 () Bool)

(assert (=> b!938859 m!874107))

(declare-fun m!874109 () Bool)

(assert (=> b!938853 m!874109))

(assert (=> b!938853 m!874109))

(declare-fun m!874111 () Bool)

(assert (=> b!938853 m!874111))

(declare-fun m!874113 () Bool)

(assert (=> bm!40839 m!874113))

(declare-fun m!874115 () Bool)

(assert (=> b!938861 m!874115))

(declare-fun m!874117 () Bool)

(assert (=> bm!40838 m!874117))

(declare-fun m!874119 () Bool)

(assert (=> bm!40841 m!874119))

(assert (=> b!938850 m!874109))

(assert (=> b!938850 m!874109))

(declare-fun m!874121 () Bool)

(assert (=> b!938850 m!874121))

(assert (=> b!938852 m!874109))

(assert (=> b!938852 m!874109))

(assert (=> b!938852 m!874121))

(declare-fun m!874123 () Bool)

(assert (=> b!938843 m!874123))

(declare-fun m!874125 () Bool)

(assert (=> b!938843 m!874125))

(declare-fun m!874127 () Bool)

(assert (=> b!938843 m!874127))

(declare-fun m!874129 () Bool)

(assert (=> b!938843 m!874129))

(declare-fun m!874131 () Bool)

(assert (=> b!938843 m!874131))

(declare-fun m!874133 () Bool)

(assert (=> b!938843 m!874133))

(declare-fun m!874135 () Bool)

(assert (=> b!938843 m!874135))

(assert (=> b!938843 m!874117))

(declare-fun m!874137 () Bool)

(assert (=> b!938843 m!874137))

(declare-fun m!874139 () Bool)

(assert (=> b!938843 m!874139))

(declare-fun m!874141 () Bool)

(assert (=> b!938843 m!874141))

(assert (=> b!938843 m!874127))

(assert (=> b!938843 m!874137))

(declare-fun m!874143 () Bool)

(assert (=> b!938843 m!874143))

(declare-fun m!874145 () Bool)

(assert (=> b!938843 m!874145))

(assert (=> b!938843 m!874145))

(declare-fun m!874147 () Bool)

(assert (=> b!938843 m!874147))

(assert (=> b!938843 m!874131))

(declare-fun m!874149 () Bool)

(assert (=> b!938843 m!874149))

(declare-fun m!874151 () Bool)

(assert (=> b!938843 m!874151))

(assert (=> b!938843 m!874109))

(declare-fun m!874153 () Bool)

(assert (=> b!938844 m!874153))

(declare-fun m!874155 () Bool)

(assert (=> b!938857 m!874155))

(assert (=> b!938857 m!873795))

(declare-fun m!874157 () Bool)

(assert (=> b!938857 m!874157))

(assert (=> b!938857 m!874109))

(assert (=> b!938857 m!873795))

(assert (=> b!938857 m!874155))

(assert (=> b!938857 m!874109))

(declare-fun m!874159 () Bool)

(assert (=> b!938857 m!874159))

(assert (=> d!113671 m!873827))

(assert (=> b!938597 d!113671))

(declare-fun d!113673 () Bool)

(declare-fun e!527313 () Bool)

(assert (=> d!113673 e!527313))

(declare-fun res!631523 () Bool)

(assert (=> d!113673 (=> res!631523 e!527313)))

(declare-fun lt!423786 () Bool)

(assert (=> d!113673 (= res!631523 (not lt!423786))))

(declare-fun lt!423785 () Bool)

(assert (=> d!113673 (= lt!423786 lt!423785)))

(declare-fun lt!423787 () Unit!31648)

(declare-fun e!527312 () Unit!31648)

(assert (=> d!113673 (= lt!423787 e!527312)))

(declare-fun c!97964 () Bool)

(assert (=> d!113673 (= c!97964 lt!423785)))

(assert (=> d!113673 (= lt!423785 (containsKey!452 (toList!6045 lt!423565) k0!1099))))

(assert (=> d!113673 (= (contains!5115 lt!423565 k0!1099) lt!423786)))

(declare-fun b!938862 () Bool)

(declare-fun lt!423784 () Unit!31648)

(assert (=> b!938862 (= e!527312 lt!423784)))

(assert (=> b!938862 (= lt!423784 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6045 lt!423565) k0!1099))))

(assert (=> b!938862 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423565) k0!1099))))

(declare-fun b!938863 () Bool)

(declare-fun Unit!31665 () Unit!31648)

(assert (=> b!938863 (= e!527312 Unit!31665)))

(declare-fun b!938864 () Bool)

(assert (=> b!938864 (= e!527313 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423565) k0!1099)))))

(assert (= (and d!113673 c!97964) b!938862))

(assert (= (and d!113673 (not c!97964)) b!938863))

(assert (= (and d!113673 (not res!631523)) b!938864))

(declare-fun m!874161 () Bool)

(assert (=> d!113673 m!874161))

(declare-fun m!874163 () Bool)

(assert (=> b!938862 m!874163))

(declare-fun m!874165 () Bool)

(assert (=> b!938862 m!874165))

(assert (=> b!938862 m!874165))

(declare-fun m!874167 () Bool)

(assert (=> b!938862 m!874167))

(assert (=> b!938864 m!874165))

(assert (=> b!938864 m!874165))

(assert (=> b!938864 m!874167))

(assert (=> b!938597 d!113673))

(declare-fun d!113675 () Bool)

(assert (=> d!113675 (contains!5115 (+!2853 lt!423561 (tuple2!13361 lt!423563 lt!423562)) k0!1099)))

(declare-fun lt!423790 () Unit!31648)

(declare-fun choose!1559 (ListLongMap!12059 (_ BitVec 64) V!31975 (_ BitVec 64)) Unit!31648)

(assert (=> d!113675 (= lt!423790 (choose!1559 lt!423561 lt!423563 lt!423562 k0!1099))))

(assert (=> d!113675 (contains!5115 lt!423561 k0!1099)))

(assert (=> d!113675 (= (addStillContains!556 lt!423561 lt!423563 lt!423562 k0!1099) lt!423790)))

(declare-fun bs!26316 () Bool)

(assert (= bs!26316 d!113675))

(declare-fun m!874169 () Bool)

(assert (=> bs!26316 m!874169))

(assert (=> bs!26316 m!874169))

(declare-fun m!874171 () Bool)

(assert (=> bs!26316 m!874171))

(declare-fun m!874173 () Bool)

(assert (=> bs!26316 m!874173))

(assert (=> bs!26316 m!873823))

(assert (=> b!938597 d!113675))

(declare-fun d!113677 () Bool)

(declare-fun e!527316 () Bool)

(assert (=> d!113677 e!527316))

(declare-fun res!631526 () Bool)

(assert (=> d!113677 (=> (not res!631526) (not e!527316))))

(assert (=> d!113677 (= res!631526 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27647 _keys!1487)) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27648 _values!1231))))))

(declare-fun lt!423793 () Unit!31648)

(declare-fun choose!1560 (array!56503 array!56505 (_ BitVec 32) (_ BitVec 32) V!31975 V!31975 (_ BitVec 32) Int) Unit!31648)

(assert (=> d!113677 (= lt!423793 (choose!1560 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> d!113677 (validMask!0 mask!1881)))

(assert (=> d!113677 (= (lemmaListMapRecursiveValidKeyArray!233 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!423793)))

(declare-fun b!938868 () Bool)

(assert (=> b!938868 (= e!527316 (= (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2853 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13361 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14353 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!113677 res!631526) b!938868))

(declare-fun b_lambda!14183 () Bool)

(assert (=> (not b_lambda!14183) (not b!938868)))

(assert (=> b!938868 t!27424))

(declare-fun b_and!29117 () Bool)

(assert (= b_and!29115 (and (=> t!27424 result!12111) b_and!29117)))

(declare-fun m!874175 () Bool)

(assert (=> d!113677 m!874175))

(assert (=> d!113677 m!873827))

(declare-fun m!874177 () Bool)

(assert (=> b!938868 m!874177))

(declare-fun m!874179 () Bool)

(assert (=> b!938868 m!874179))

(assert (=> b!938868 m!873803))

(assert (=> b!938868 m!873793))

(assert (=> b!938868 m!873793))

(assert (=> b!938868 m!873795))

(assert (=> b!938868 m!873801))

(assert (=> b!938868 m!873841))

(assert (=> b!938868 m!874177))

(assert (=> b!938868 m!873795))

(assert (=> b!938597 d!113677))

(declare-fun b!938869 () Bool)

(declare-fun e!527320 () Bool)

(declare-fun call!40845 () Bool)

(assert (=> b!938869 (= e!527320 call!40845)))

(declare-fun b!938870 () Bool)

(declare-fun e!527317 () Bool)

(assert (=> b!938870 (= e!527317 (contains!5118 Nil!19138 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun bm!40842 () Bool)

(declare-fun c!97965 () Bool)

(assert (=> bm!40842 (= call!40845 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97965 (Cons!19137 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19138) Nil!19138)))))

(declare-fun b!938871 () Bool)

(declare-fun e!527319 () Bool)

(assert (=> b!938871 (= e!527319 e!527320)))

(assert (=> b!938871 (= c!97965 (validKeyInArray!0 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!938872 () Bool)

(assert (=> b!938872 (= e!527320 call!40845)))

(declare-fun d!113679 () Bool)

(declare-fun res!631528 () Bool)

(declare-fun e!527318 () Bool)

(assert (=> d!113679 (=> res!631528 e!527318)))

(assert (=> d!113679 (= res!631528 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27647 _keys!1487)))))

(assert (=> d!113679 (= (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19138) e!527318)))

(declare-fun b!938873 () Bool)

(assert (=> b!938873 (= e!527318 e!527319)))

(declare-fun res!631527 () Bool)

(assert (=> b!938873 (=> (not res!631527) (not e!527319))))

(assert (=> b!938873 (= res!631527 (not e!527317))))

(declare-fun res!631529 () Bool)

(assert (=> b!938873 (=> (not res!631529) (not e!527317))))

(assert (=> b!938873 (= res!631529 (validKeyInArray!0 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (= (and d!113679 (not res!631528)) b!938873))

(assert (= (and b!938873 res!631529) b!938870))

(assert (= (and b!938873 res!631527) b!938871))

(assert (= (and b!938871 c!97965) b!938869))

(assert (= (and b!938871 (not c!97965)) b!938872))

(assert (= (or b!938869 b!938872) bm!40842))

(assert (=> b!938870 m!873841))

(assert (=> b!938870 m!873841))

(declare-fun m!874181 () Bool)

(assert (=> b!938870 m!874181))

(assert (=> bm!40842 m!873841))

(declare-fun m!874183 () Bool)

(assert (=> bm!40842 m!874183))

(assert (=> b!938871 m!873841))

(assert (=> b!938871 m!873841))

(assert (=> b!938871 m!874069))

(assert (=> b!938873 m!873841))

(assert (=> b!938873 m!873841))

(assert (=> b!938873 m!874069))

(assert (=> b!938597 d!113679))

(declare-fun d!113681 () Bool)

(assert (=> d!113681 (= (apply!862 lt!423565 k0!1099) (get!14356 (getValueByKey!481 (toList!6045 lt!423565) k0!1099)))))

(declare-fun bs!26317 () Bool)

(assert (= bs!26317 d!113681))

(assert (=> bs!26317 m!874165))

(assert (=> bs!26317 m!874165))

(declare-fun m!874185 () Bool)

(assert (=> bs!26317 m!874185))

(assert (=> b!938597 d!113681))

(declare-fun d!113683 () Bool)

(declare-fun e!527323 () Bool)

(assert (=> d!113683 e!527323))

(declare-fun c!97968 () Bool)

(assert (=> d!113683 (= c!97968 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!423796 () Unit!31648)

(declare-fun choose!1561 (array!56503 array!56505 (_ BitVec 32) (_ BitVec 32) V!31975 V!31975 (_ BitVec 64) (_ BitVec 32) Int) Unit!31648)

(assert (=> d!113683 (= lt!423796 (choose!1561 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> d!113683 (validMask!0 mask!1881)))

(assert (=> d!113683 (= (lemmaListMapContainsThenArrayContainsFrom!307 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) lt!423796)))

(declare-fun b!938878 () Bool)

(assert (=> b!938878 (= e!527323 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!938879 () Bool)

(assert (=> b!938879 (= e!527323 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!113683 c!97968) b!938878))

(assert (= (and d!113683 (not c!97968)) b!938879))

(declare-fun m!874187 () Bool)

(assert (=> d!113683 m!874187))

(assert (=> d!113683 m!873827))

(assert (=> b!938878 m!873833))

(assert (=> b!938597 d!113683))

(declare-fun d!113685 () Bool)

(assert (=> d!113685 (= (apply!862 (+!2853 lt!423561 (tuple2!13361 lt!423563 lt!423562)) k0!1099) (apply!862 lt!423561 k0!1099))))

(declare-fun lt!423799 () Unit!31648)

(declare-fun choose!1562 (ListLongMap!12059 (_ BitVec 64) V!31975 (_ BitVec 64)) Unit!31648)

(assert (=> d!113685 (= lt!423799 (choose!1562 lt!423561 lt!423563 lt!423562 k0!1099))))

(declare-fun e!527326 () Bool)

(assert (=> d!113685 e!527326))

(declare-fun res!631532 () Bool)

(assert (=> d!113685 (=> (not res!631532) (not e!527326))))

(assert (=> d!113685 (= res!631532 (contains!5115 lt!423561 k0!1099))))

(assert (=> d!113685 (= (addApplyDifferent!437 lt!423561 lt!423563 lt!423562 k0!1099) lt!423799)))

(declare-fun b!938883 () Bool)

(assert (=> b!938883 (= e!527326 (not (= k0!1099 lt!423563)))))

(assert (= (and d!113685 res!631532) b!938883))

(assert (=> d!113685 m!874169))

(assert (=> d!113685 m!873823))

(assert (=> d!113685 m!873835))

(declare-fun m!874189 () Bool)

(assert (=> d!113685 m!874189))

(assert (=> d!113685 m!874169))

(declare-fun m!874191 () Bool)

(assert (=> d!113685 m!874191))

(assert (=> b!938597 d!113685))

(declare-fun d!113687 () Bool)

(assert (=> d!113687 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27647 _keys!1487)) (not (= (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) k0!1099)))))

(declare-fun lt!423802 () Unit!31648)

(declare-fun choose!21 (array!56503 (_ BitVec 64) (_ BitVec 32) List!19141) Unit!31648)

(assert (=> d!113687 (= lt!423802 (choose!21 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19138))))

(assert (=> d!113687 (bvslt (size!27647 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113687 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19138) lt!423802)))

(declare-fun bs!26318 () Bool)

(assert (= bs!26318 d!113687))

(assert (=> bs!26318 m!873841))

(declare-fun m!874193 () Bool)

(assert (=> bs!26318 m!874193))

(assert (=> b!938597 d!113687))

(declare-fun d!113689 () Bool)

(declare-fun e!527329 () Bool)

(assert (=> d!113689 e!527329))

(declare-fun res!631538 () Bool)

(assert (=> d!113689 (=> (not res!631538) (not e!527329))))

(declare-fun lt!423811 () ListLongMap!12059)

(assert (=> d!113689 (= res!631538 (contains!5115 lt!423811 (_1!6691 lt!423559)))))

(declare-fun lt!423814 () List!19140)

(assert (=> d!113689 (= lt!423811 (ListLongMap!12060 lt!423814))))

(declare-fun lt!423812 () Unit!31648)

(declare-fun lt!423813 () Unit!31648)

(assert (=> d!113689 (= lt!423812 lt!423813)))

(assert (=> d!113689 (= (getValueByKey!481 lt!423814 (_1!6691 lt!423559)) (Some!486 (_2!6691 lt!423559)))))

(declare-fun lemmaContainsTupThenGetReturnValue!260 (List!19140 (_ BitVec 64) V!31975) Unit!31648)

(assert (=> d!113689 (= lt!423813 (lemmaContainsTupThenGetReturnValue!260 lt!423814 (_1!6691 lt!423559) (_2!6691 lt!423559)))))

(declare-fun insertStrictlySorted!317 (List!19140 (_ BitVec 64) V!31975) List!19140)

(assert (=> d!113689 (= lt!423814 (insertStrictlySorted!317 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6691 lt!423559) (_2!6691 lt!423559)))))

(assert (=> d!113689 (= (+!2853 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423559) lt!423811)))

(declare-fun b!938888 () Bool)

(declare-fun res!631537 () Bool)

(assert (=> b!938888 (=> (not res!631537) (not e!527329))))

(assert (=> b!938888 (= res!631537 (= (getValueByKey!481 (toList!6045 lt!423811) (_1!6691 lt!423559)) (Some!486 (_2!6691 lt!423559))))))

(declare-fun b!938889 () Bool)

(declare-fun contains!5119 (List!19140 tuple2!13360) Bool)

(assert (=> b!938889 (= e!527329 (contains!5119 (toList!6045 lt!423811) lt!423559))))

(assert (= (and d!113689 res!631538) b!938888))

(assert (= (and b!938888 res!631537) b!938889))

(declare-fun m!874195 () Bool)

(assert (=> d!113689 m!874195))

(declare-fun m!874197 () Bool)

(assert (=> d!113689 m!874197))

(declare-fun m!874199 () Bool)

(assert (=> d!113689 m!874199))

(declare-fun m!874201 () Bool)

(assert (=> d!113689 m!874201))

(declare-fun m!874203 () Bool)

(assert (=> b!938888 m!874203))

(declare-fun m!874205 () Bool)

(assert (=> b!938889 m!874205))

(assert (=> b!938597 d!113689))

(declare-fun d!113691 () Bool)

(declare-fun e!527330 () Bool)

(assert (=> d!113691 e!527330))

(declare-fun res!631540 () Bool)

(assert (=> d!113691 (=> (not res!631540) (not e!527330))))

(declare-fun lt!423815 () ListLongMap!12059)

(assert (=> d!113691 (= res!631540 (contains!5115 lt!423815 (_1!6691 lt!423559)))))

(declare-fun lt!423818 () List!19140)

(assert (=> d!113691 (= lt!423815 (ListLongMap!12060 lt!423818))))

(declare-fun lt!423816 () Unit!31648)

(declare-fun lt!423817 () Unit!31648)

(assert (=> d!113691 (= lt!423816 lt!423817)))

(assert (=> d!113691 (= (getValueByKey!481 lt!423818 (_1!6691 lt!423559)) (Some!486 (_2!6691 lt!423559)))))

(assert (=> d!113691 (= lt!423817 (lemmaContainsTupThenGetReturnValue!260 lt!423818 (_1!6691 lt!423559) (_2!6691 lt!423559)))))

(assert (=> d!113691 (= lt!423818 (insertStrictlySorted!317 (toList!6045 lt!423561) (_1!6691 lt!423559) (_2!6691 lt!423559)))))

(assert (=> d!113691 (= (+!2853 lt!423561 lt!423559) lt!423815)))

(declare-fun b!938890 () Bool)

(declare-fun res!631539 () Bool)

(assert (=> b!938890 (=> (not res!631539) (not e!527330))))

(assert (=> b!938890 (= res!631539 (= (getValueByKey!481 (toList!6045 lt!423815) (_1!6691 lt!423559)) (Some!486 (_2!6691 lt!423559))))))

(declare-fun b!938891 () Bool)

(assert (=> b!938891 (= e!527330 (contains!5119 (toList!6045 lt!423815) lt!423559))))

(assert (= (and d!113691 res!631540) b!938890))

(assert (= (and b!938890 res!631539) b!938891))

(declare-fun m!874207 () Bool)

(assert (=> d!113691 m!874207))

(declare-fun m!874209 () Bool)

(assert (=> d!113691 m!874209))

(declare-fun m!874211 () Bool)

(assert (=> d!113691 m!874211))

(declare-fun m!874213 () Bool)

(assert (=> d!113691 m!874213))

(declare-fun m!874215 () Bool)

(assert (=> b!938890 m!874215))

(declare-fun m!874217 () Bool)

(assert (=> b!938891 m!874217))

(assert (=> b!938597 d!113691))

(declare-fun d!113693 () Bool)

(declare-fun c!97971 () Bool)

(assert (=> d!113693 (= c!97971 ((_ is ValueCellFull!9647) (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!527333 () V!31975)

(assert (=> d!113693 (= (get!14353 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!527333)))

(declare-fun b!938896 () Bool)

(declare-fun get!14357 (ValueCell!9647 V!31975) V!31975)

(assert (=> b!938896 (= e!527333 (get!14357 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!938897 () Bool)

(declare-fun get!14358 (ValueCell!9647 V!31975) V!31975)

(assert (=> b!938897 (= e!527333 (get!14358 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113693 c!97971) b!938896))

(assert (= (and d!113693 (not c!97971)) b!938897))

(assert (=> b!938896 m!873793))

(assert (=> b!938896 m!873795))

(declare-fun m!874219 () Bool)

(assert (=> b!938896 m!874219))

(assert (=> b!938897 m!873793))

(assert (=> b!938897 m!873795))

(declare-fun m!874221 () Bool)

(assert (=> b!938897 m!874221))

(assert (=> b!938597 d!113693))

(declare-fun d!113695 () Bool)

(assert (=> d!113695 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19138)))

(declare-fun lt!423821 () Unit!31648)

(declare-fun choose!39 (array!56503 (_ BitVec 32) (_ BitVec 32)) Unit!31648)

(assert (=> d!113695 (= lt!423821 (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> d!113695 (bvslt (size!27647 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113695 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) lt!423821)))

(declare-fun bs!26319 () Bool)

(assert (= bs!26319 d!113695))

(assert (=> bs!26319 m!873809))

(declare-fun m!874223 () Bool)

(assert (=> bs!26319 m!874223))

(assert (=> b!938597 d!113695))

(declare-fun d!113697 () Bool)

(assert (=> d!113697 (= (validKeyInArray!0 k0!1099) (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938596 d!113697))

(declare-fun d!113699 () Bool)

(declare-fun res!631545 () Bool)

(declare-fun e!527338 () Bool)

(assert (=> d!113699 (=> res!631545 e!527338)))

(assert (=> d!113699 (= res!631545 (= (select (arr!27187 _keys!1487) from!1844) k0!1099))))

(assert (=> d!113699 (= (arrayContainsKey!0 _keys!1487 k0!1099 from!1844) e!527338)))

(declare-fun b!938902 () Bool)

(declare-fun e!527339 () Bool)

(assert (=> b!938902 (= e!527338 e!527339)))

(declare-fun res!631546 () Bool)

(assert (=> b!938902 (=> (not res!631546) (not e!527339))))

(assert (=> b!938902 (= res!631546 (bvslt (bvadd from!1844 #b00000000000000000000000000000001) (size!27647 _keys!1487)))))

(declare-fun b!938903 () Bool)

(assert (=> b!938903 (= e!527339 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)))))

(assert (= (and d!113699 (not res!631545)) b!938902))

(assert (= (and b!938902 res!631546) b!938903))

(assert (=> d!113699 m!873977))

(declare-fun m!874225 () Bool)

(assert (=> b!938903 m!874225))

(assert (=> b!938600 d!113699))

(declare-fun b!938911 () Bool)

(declare-fun e!527345 () Bool)

(assert (=> b!938911 (= e!527345 tp_is_empty!20257)))

(declare-fun mapIsEmpty!32166 () Bool)

(declare-fun mapRes!32166 () Bool)

(assert (=> mapIsEmpty!32166 mapRes!32166))

(declare-fun condMapEmpty!32166 () Bool)

(declare-fun mapDefault!32166 () ValueCell!9647)

(assert (=> mapNonEmpty!32157 (= condMapEmpty!32166 (= mapRest!32157 ((as const (Array (_ BitVec 32) ValueCell!9647)) mapDefault!32166)))))

(assert (=> mapNonEmpty!32157 (= tp!61704 (and e!527345 mapRes!32166))))

(declare-fun mapNonEmpty!32166 () Bool)

(declare-fun tp!61719 () Bool)

(declare-fun e!527344 () Bool)

(assert (=> mapNonEmpty!32166 (= mapRes!32166 (and tp!61719 e!527344))))

(declare-fun mapKey!32166 () (_ BitVec 32))

(declare-fun mapValue!32166 () ValueCell!9647)

(declare-fun mapRest!32166 () (Array (_ BitVec 32) ValueCell!9647))

(assert (=> mapNonEmpty!32166 (= mapRest!32157 (store mapRest!32166 mapKey!32166 mapValue!32166))))

(declare-fun b!938910 () Bool)

(assert (=> b!938910 (= e!527344 tp_is_empty!20257)))

(assert (= (and mapNonEmpty!32157 condMapEmpty!32166) mapIsEmpty!32166))

(assert (= (and mapNonEmpty!32157 (not condMapEmpty!32166)) mapNonEmpty!32166))

(assert (= (and mapNonEmpty!32166 ((_ is ValueCellFull!9647) mapValue!32166)) b!938910))

(assert (= (and mapNonEmpty!32157 ((_ is ValueCellFull!9647) mapDefault!32166)) b!938911))

(declare-fun m!874227 () Bool)

(assert (=> mapNonEmpty!32166 m!874227))

(declare-fun b_lambda!14185 () Bool)

(assert (= b_lambda!14177 (or (and start!79868 b_free!17749) b_lambda!14185)))

(declare-fun b_lambda!14187 () Bool)

(assert (= b_lambda!14181 (or (and start!79868 b_free!17749) b_lambda!14187)))

(declare-fun b_lambda!14189 () Bool)

(assert (= b_lambda!14179 (or (and start!79868 b_free!17749) b_lambda!14189)))

(declare-fun b_lambda!14191 () Bool)

(assert (= b_lambda!14183 (or (and start!79868 b_free!17749) b_lambda!14191)))

(check-sat (not bm!40827) (not d!113663) (not b_lambda!14185) (not d!113667) (not b!938772) (not d!113665) (not b!938890) (not b!938852) (not b!938844) (not bm!40838) (not d!113651) (not b!938780) (not d!113675) (not b_next!17749) (not bm!40818) (not bm!40817) (not b!938853) (not b!938802) (not bm!40842) (not bm!40841) (not b!938789) (not b!938896) (not b!938862) (not bm!40837) (not d!113649) (not b!938861) (not b_lambda!14175) (not b!938813) (not bm!40824) (not d!113687) (not b!938873) (not d!113691) (not b!938891) (not b!938864) (not d!113683) (not b!938814) (not b!938859) (not b!938889) (not bm!40831) (not b!938771) (not bm!40832) (not b_lambda!14191) (not b!938829) (not b!938903) (not bm!40839) (not b!938726) (not b_lambda!14187) (not d!113673) (not b!938836) (not bm!40821) (not b!938843) (not d!113695) (not d!113681) (not b!938871) b_and!29117 (not b!938832) (not b!938778) tp_is_empty!20257 (not b!938823) (not d!113677) (not b!938840) (not b!938870) (not b!938804) (not bm!40834) (not b!938850) (not bm!40819) (not b!938787) (not b!938897) (not d!113689) (not b!938817) (not b!938822) (not b!938868) (not b!938724) (not b!938838) (not b!938785) (not d!113671) (not b!938857) (not b!938831) (not b!938801) (not b!938781) (not bm!40830) (not b!938888) (not b!938819) (not b!938878) (not mapNonEmpty!32166) (not d!113685) (not b_lambda!14189))
(check-sat b_and!29117 (not b_next!17749))
(get-model)

(declare-fun d!113701 () Bool)

(assert (=> d!113701 (= (get!14356 (getValueByKey!481 (toList!6045 lt!423565) k0!1099)) (v!12704 (getValueByKey!481 (toList!6045 lt!423565) k0!1099)))))

(assert (=> d!113681 d!113701))

(declare-fun d!113703 () Bool)

(declare-fun c!97976 () Bool)

(assert (=> d!113703 (= c!97976 (and ((_ is Cons!19136) (toList!6045 lt!423565)) (= (_1!6691 (h!20288 (toList!6045 lt!423565))) k0!1099)))))

(declare-fun e!527350 () Option!487)

(assert (=> d!113703 (= (getValueByKey!481 (toList!6045 lt!423565) k0!1099) e!527350)))

(declare-fun b!938921 () Bool)

(declare-fun e!527351 () Option!487)

(assert (=> b!938921 (= e!527350 e!527351)))

(declare-fun c!97977 () Bool)

(assert (=> b!938921 (= c!97977 (and ((_ is Cons!19136) (toList!6045 lt!423565)) (not (= (_1!6691 (h!20288 (toList!6045 lt!423565))) k0!1099))))))

(declare-fun b!938922 () Bool)

(assert (=> b!938922 (= e!527351 (getValueByKey!481 (t!27425 (toList!6045 lt!423565)) k0!1099))))

(declare-fun b!938920 () Bool)

(assert (=> b!938920 (= e!527350 (Some!486 (_2!6691 (h!20288 (toList!6045 lt!423565)))))))

(declare-fun b!938923 () Bool)

(assert (=> b!938923 (= e!527351 None!485)))

(assert (= (and d!113703 c!97976) b!938920))

(assert (= (and d!113703 (not c!97976)) b!938921))

(assert (= (and b!938921 c!97977) b!938922))

(assert (= (and b!938921 (not c!97977)) b!938923))

(declare-fun m!874229 () Bool)

(assert (=> b!938922 m!874229))

(assert (=> d!113681 d!113703))

(declare-fun b!938948 () Bool)

(declare-fun lt!423840 () Unit!31648)

(declare-fun lt!423839 () Unit!31648)

(assert (=> b!938948 (= lt!423840 lt!423839)))

(declare-fun lt!423842 () ListLongMap!12059)

(declare-fun lt!423838 () (_ BitVec 64))

(declare-fun lt!423836 () V!31975)

(declare-fun lt!423841 () (_ BitVec 64))

(assert (=> b!938948 (not (contains!5115 (+!2853 lt!423842 (tuple2!13361 lt!423841 lt!423836)) lt!423838))))

(declare-fun addStillNotContains!222 (ListLongMap!12059 (_ BitVec 64) V!31975 (_ BitVec 64)) Unit!31648)

(assert (=> b!938948 (= lt!423839 (addStillNotContains!222 lt!423842 lt!423841 lt!423836 lt!423838))))

(assert (=> b!938948 (= lt!423838 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!938948 (= lt!423836 (get!14353 (select (arr!27188 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!938948 (= lt!423841 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun call!40848 () ListLongMap!12059)

(assert (=> b!938948 (= lt!423842 call!40848)))

(declare-fun e!527371 () ListLongMap!12059)

(assert (=> b!938948 (= e!527371 (+!2853 call!40848 (tuple2!13361 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (get!14353 (select (arr!27188 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!527367 () Bool)

(declare-fun b!938949 () Bool)

(declare-fun lt!423837 () ListLongMap!12059)

(assert (=> b!938949 (= e!527367 (= lt!423837 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235)))))

(declare-fun b!938950 () Bool)

(assert (=> b!938950 (= e!527371 call!40848)))

(declare-fun b!938951 () Bool)

(declare-fun res!631555 () Bool)

(declare-fun e!527366 () Bool)

(assert (=> b!938951 (=> (not res!631555) (not e!527366))))

(assert (=> b!938951 (= res!631555 (not (contains!5115 lt!423837 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!938952 () Bool)

(declare-fun e!527370 () ListLongMap!12059)

(assert (=> b!938952 (= e!527370 e!527371)))

(declare-fun c!97989 () Bool)

(assert (=> b!938952 (= c!97989 (validKeyInArray!0 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!938953 () Bool)

(declare-fun e!527369 () Bool)

(assert (=> b!938953 (= e!527369 (validKeyInArray!0 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!938953 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000)))

(declare-fun bm!40845 () Bool)

(assert (=> bm!40845 (= call!40848 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun d!113705 () Bool)

(assert (=> d!113705 e!527366))

(declare-fun res!631558 () Bool)

(assert (=> d!113705 (=> (not res!631558) (not e!527366))))

(assert (=> d!113705 (= res!631558 (not (contains!5115 lt!423837 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!113705 (= lt!423837 e!527370)))

(declare-fun c!97986 () Bool)

(assert (=> d!113705 (= c!97986 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27647 _keys!1487)))))

(assert (=> d!113705 (validMask!0 mask!1881)))

(assert (=> d!113705 (= (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423837)))

(declare-fun b!938954 () Bool)

(declare-fun e!527372 () Bool)

(declare-fun e!527368 () Bool)

(assert (=> b!938954 (= e!527372 e!527368)))

(assert (=> b!938954 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27647 _keys!1487)))))

(declare-fun res!631556 () Bool)

(assert (=> b!938954 (= res!631556 (contains!5115 lt!423837 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!938954 (=> (not res!631556) (not e!527368))))

(declare-fun b!938955 () Bool)

(assert (=> b!938955 (= e!527370 (ListLongMap!12060 Nil!19137))))

(declare-fun b!938956 () Bool)

(assert (=> b!938956 (= e!527366 e!527372)))

(declare-fun c!97987 () Bool)

(assert (=> b!938956 (= c!97987 e!527369)))

(declare-fun res!631557 () Bool)

(assert (=> b!938956 (=> (not res!631557) (not e!527369))))

(assert (=> b!938956 (= res!631557 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27647 _keys!1487)))))

(declare-fun b!938957 () Bool)

(assert (=> b!938957 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27647 _keys!1487)))))

(assert (=> b!938957 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27648 _values!1231)))))

(assert (=> b!938957 (= e!527368 (= (apply!862 lt!423837 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14353 (select (arr!27188 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!938958 () Bool)

(declare-fun isEmpty!702 (ListLongMap!12059) Bool)

(assert (=> b!938958 (= e!527367 (isEmpty!702 lt!423837))))

(declare-fun b!938959 () Bool)

(assert (=> b!938959 (= e!527372 e!527367)))

(declare-fun c!97988 () Bool)

(assert (=> b!938959 (= c!97988 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27647 _keys!1487)))))

(assert (= (and d!113705 c!97986) b!938955))

(assert (= (and d!113705 (not c!97986)) b!938952))

(assert (= (and b!938952 c!97989) b!938948))

(assert (= (and b!938952 (not c!97989)) b!938950))

(assert (= (or b!938948 b!938950) bm!40845))

(assert (= (and d!113705 res!631558) b!938951))

(assert (= (and b!938951 res!631555) b!938956))

(assert (= (and b!938956 res!631557) b!938953))

(assert (= (and b!938956 c!97987) b!938954))

(assert (= (and b!938956 (not c!97987)) b!938959))

(assert (= (and b!938954 res!631556) b!938957))

(assert (= (and b!938959 c!97988) b!938949))

(assert (= (and b!938959 (not c!97988)) b!938958))

(declare-fun b_lambda!14193 () Bool)

(assert (=> (not b_lambda!14193) (not b!938948)))

(assert (=> b!938948 t!27424))

(declare-fun b_and!29119 () Bool)

(assert (= b_and!29117 (and (=> t!27424 result!12111) b_and!29119)))

(declare-fun b_lambda!14195 () Bool)

(assert (=> (not b_lambda!14195) (not b!938957)))

(assert (=> b!938957 t!27424))

(declare-fun b_and!29121 () Bool)

(assert (= b_and!29119 (and (=> t!27424 result!12111) b_and!29121)))

(declare-fun m!874231 () Bool)

(assert (=> bm!40845 m!874231))

(declare-fun m!874233 () Bool)

(assert (=> b!938958 m!874233))

(assert (=> b!938952 m!874109))

(assert (=> b!938952 m!874109))

(assert (=> b!938952 m!874121))

(declare-fun m!874235 () Bool)

(assert (=> d!113705 m!874235))

(assert (=> d!113705 m!873827))

(assert (=> b!938949 m!874231))

(assert (=> b!938954 m!874109))

(assert (=> b!938954 m!874109))

(declare-fun m!874237 () Bool)

(assert (=> b!938954 m!874237))

(assert (=> b!938953 m!874109))

(assert (=> b!938953 m!874109))

(assert (=> b!938953 m!874121))

(declare-fun m!874239 () Bool)

(assert (=> b!938948 m!874239))

(declare-fun m!874241 () Bool)

(assert (=> b!938948 m!874241))

(assert (=> b!938948 m!874239))

(declare-fun m!874243 () Bool)

(assert (=> b!938948 m!874243))

(assert (=> b!938948 m!874155))

(assert (=> b!938948 m!873795))

(assert (=> b!938948 m!874157))

(declare-fun m!874245 () Bool)

(assert (=> b!938948 m!874245))

(assert (=> b!938948 m!874109))

(assert (=> b!938948 m!873795))

(assert (=> b!938948 m!874155))

(declare-fun m!874247 () Bool)

(assert (=> b!938951 m!874247))

(assert (=> b!938957 m!874155))

(assert (=> b!938957 m!873795))

(assert (=> b!938957 m!874157))

(assert (=> b!938957 m!874109))

(declare-fun m!874249 () Bool)

(assert (=> b!938957 m!874249))

(assert (=> b!938957 m!874109))

(assert (=> b!938957 m!873795))

(assert (=> b!938957 m!874155))

(assert (=> bm!40838 d!113705))

(declare-fun d!113707 () Bool)

(declare-fun e!527373 () Bool)

(assert (=> d!113707 e!527373))

(declare-fun res!631560 () Bool)

(assert (=> d!113707 (=> (not res!631560) (not e!527373))))

(declare-fun lt!423843 () ListLongMap!12059)

(assert (=> d!113707 (= res!631560 (contains!5115 lt!423843 (_1!6691 (ite (or c!97955 c!97952) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun lt!423846 () List!19140)

(assert (=> d!113707 (= lt!423843 (ListLongMap!12060 lt!423846))))

(declare-fun lt!423844 () Unit!31648)

(declare-fun lt!423845 () Unit!31648)

(assert (=> d!113707 (= lt!423844 lt!423845)))

(assert (=> d!113707 (= (getValueByKey!481 lt!423846 (_1!6691 (ite (or c!97955 c!97952) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!486 (_2!6691 (ite (or c!97955 c!97952) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113707 (= lt!423845 (lemmaContainsTupThenGetReturnValue!260 lt!423846 (_1!6691 (ite (or c!97955 c!97952) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6691 (ite (or c!97955 c!97952) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113707 (= lt!423846 (insertStrictlySorted!317 (toList!6045 (ite c!97955 call!40835 (ite c!97952 call!40833 call!40832))) (_1!6691 (ite (or c!97955 c!97952) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6691 (ite (or c!97955 c!97952) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113707 (= (+!2853 (ite c!97955 call!40835 (ite c!97952 call!40833 call!40832)) (ite (or c!97955 c!97952) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) lt!423843)))

(declare-fun b!938960 () Bool)

(declare-fun res!631559 () Bool)

(assert (=> b!938960 (=> (not res!631559) (not e!527373))))

(assert (=> b!938960 (= res!631559 (= (getValueByKey!481 (toList!6045 lt!423843) (_1!6691 (ite (or c!97955 c!97952) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!486 (_2!6691 (ite (or c!97955 c!97952) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))))

(declare-fun b!938961 () Bool)

(assert (=> b!938961 (= e!527373 (contains!5119 (toList!6045 lt!423843) (ite (or c!97955 c!97952) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (= (and d!113707 res!631560) b!938960))

(assert (= (and b!938960 res!631559) b!938961))

(declare-fun m!874251 () Bool)

(assert (=> d!113707 m!874251))

(declare-fun m!874253 () Bool)

(assert (=> d!113707 m!874253))

(declare-fun m!874255 () Bool)

(assert (=> d!113707 m!874255))

(declare-fun m!874257 () Bool)

(assert (=> d!113707 m!874257))

(declare-fun m!874259 () Bool)

(assert (=> b!938960 m!874259))

(declare-fun m!874261 () Bool)

(assert (=> b!938961 m!874261))

(assert (=> bm!40830 d!113707))

(declare-fun d!113709 () Bool)

(declare-fun lt!423849 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!408 (List!19141) (InoxSet (_ BitVec 64)))

(assert (=> d!113709 (= lt!423849 (select (content!408 Nil!19138) (select (arr!27187 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun e!527378 () Bool)

(assert (=> d!113709 (= lt!423849 e!527378)))

(declare-fun res!631565 () Bool)

(assert (=> d!113709 (=> (not res!631565) (not e!527378))))

(assert (=> d!113709 (= res!631565 ((_ is Cons!19137) Nil!19138))))

(assert (=> d!113709 (= (contains!5118 Nil!19138 (select (arr!27187 _keys!1487) #b00000000000000000000000000000000)) lt!423849)))

(declare-fun b!938966 () Bool)

(declare-fun e!527379 () Bool)

(assert (=> b!938966 (= e!527378 e!527379)))

(declare-fun res!631566 () Bool)

(assert (=> b!938966 (=> res!631566 e!527379)))

(assert (=> b!938966 (= res!631566 (= (h!20289 Nil!19138) (select (arr!27187 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!938967 () Bool)

(assert (=> b!938967 (= e!527379 (contains!5118 (t!27426 Nil!19138) (select (arr!27187 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!113709 res!631565) b!938966))

(assert (= (and b!938966 (not res!631566)) b!938967))

(declare-fun m!874263 () Bool)

(assert (=> d!113709 m!874263))

(assert (=> d!113709 m!874029))

(declare-fun m!874265 () Bool)

(assert (=> d!113709 m!874265))

(assert (=> b!938967 m!874029))

(declare-fun m!874267 () Bool)

(assert (=> b!938967 m!874267))

(assert (=> b!938801 d!113709))

(declare-fun d!113711 () Bool)

(declare-fun e!527381 () Bool)

(assert (=> d!113711 e!527381))

(declare-fun res!631567 () Bool)

(assert (=> d!113711 (=> res!631567 e!527381)))

(declare-fun lt!423852 () Bool)

(assert (=> d!113711 (= res!631567 (not lt!423852))))

(declare-fun lt!423851 () Bool)

(assert (=> d!113711 (= lt!423852 lt!423851)))

(declare-fun lt!423853 () Unit!31648)

(declare-fun e!527380 () Unit!31648)

(assert (=> d!113711 (= lt!423853 e!527380)))

(declare-fun c!97990 () Bool)

(assert (=> d!113711 (= c!97990 lt!423851)))

(assert (=> d!113711 (= lt!423851 (containsKey!452 (toList!6045 lt!423715) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113711 (= (contains!5115 lt!423715 #b0000000000000000000000000000000000000000000000000000000000000000) lt!423852)))

(declare-fun b!938968 () Bool)

(declare-fun lt!423850 () Unit!31648)

(assert (=> b!938968 (= e!527380 lt!423850)))

(assert (=> b!938968 (= lt!423850 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6045 lt!423715) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938968 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423715) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938969 () Bool)

(declare-fun Unit!31666 () Unit!31648)

(assert (=> b!938969 (= e!527380 Unit!31666)))

(declare-fun b!938970 () Bool)

(assert (=> b!938970 (= e!527381 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423715) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113711 c!97990) b!938968))

(assert (= (and d!113711 (not c!97990)) b!938969))

(assert (= (and d!113711 (not res!631567)) b!938970))

(declare-fun m!874269 () Bool)

(assert (=> d!113711 m!874269))

(declare-fun m!874271 () Bool)

(assert (=> b!938968 m!874271))

(declare-fun m!874273 () Bool)

(assert (=> b!938968 m!874273))

(assert (=> b!938968 m!874273))

(declare-fun m!874275 () Bool)

(assert (=> b!938968 m!874275))

(assert (=> b!938970 m!874273))

(assert (=> b!938970 m!874273))

(assert (=> b!938970 m!874275))

(assert (=> bm!40819 d!113711))

(declare-fun d!113713 () Bool)

(declare-fun c!97991 () Bool)

(assert (=> d!113713 (= c!97991 (and ((_ is Cons!19136) (toList!6045 lt!423815)) (= (_1!6691 (h!20288 (toList!6045 lt!423815))) (_1!6691 lt!423559))))))

(declare-fun e!527382 () Option!487)

(assert (=> d!113713 (= (getValueByKey!481 (toList!6045 lt!423815) (_1!6691 lt!423559)) e!527382)))

(declare-fun b!938972 () Bool)

(declare-fun e!527383 () Option!487)

(assert (=> b!938972 (= e!527382 e!527383)))

(declare-fun c!97992 () Bool)

(assert (=> b!938972 (= c!97992 (and ((_ is Cons!19136) (toList!6045 lt!423815)) (not (= (_1!6691 (h!20288 (toList!6045 lt!423815))) (_1!6691 lt!423559)))))))

(declare-fun b!938973 () Bool)

(assert (=> b!938973 (= e!527383 (getValueByKey!481 (t!27425 (toList!6045 lt!423815)) (_1!6691 lt!423559)))))

(declare-fun b!938971 () Bool)

(assert (=> b!938971 (= e!527382 (Some!486 (_2!6691 (h!20288 (toList!6045 lt!423815)))))))

(declare-fun b!938974 () Bool)

(assert (=> b!938974 (= e!527383 None!485)))

(assert (= (and d!113713 c!97991) b!938971))

(assert (= (and d!113713 (not c!97991)) b!938972))

(assert (= (and b!938972 c!97992) b!938973))

(assert (= (and b!938972 (not c!97992)) b!938974))

(declare-fun m!874277 () Bool)

(assert (=> b!938973 m!874277))

(assert (=> b!938890 d!113713))

(declare-fun d!113715 () Bool)

(declare-fun c!97993 () Bool)

(assert (=> d!113715 (= c!97993 (and ((_ is Cons!19136) (toList!6045 lt!423811)) (= (_1!6691 (h!20288 (toList!6045 lt!423811))) (_1!6691 lt!423559))))))

(declare-fun e!527384 () Option!487)

(assert (=> d!113715 (= (getValueByKey!481 (toList!6045 lt!423811) (_1!6691 lt!423559)) e!527384)))

(declare-fun b!938976 () Bool)

(declare-fun e!527385 () Option!487)

(assert (=> b!938976 (= e!527384 e!527385)))

(declare-fun c!97994 () Bool)

(assert (=> b!938976 (= c!97994 (and ((_ is Cons!19136) (toList!6045 lt!423811)) (not (= (_1!6691 (h!20288 (toList!6045 lt!423811))) (_1!6691 lt!423559)))))))

(declare-fun b!938977 () Bool)

(assert (=> b!938977 (= e!527385 (getValueByKey!481 (t!27425 (toList!6045 lt!423811)) (_1!6691 lt!423559)))))

(declare-fun b!938975 () Bool)

(assert (=> b!938975 (= e!527384 (Some!486 (_2!6691 (h!20288 (toList!6045 lt!423811)))))))

(declare-fun b!938978 () Bool)

(assert (=> b!938978 (= e!527385 None!485)))

(assert (= (and d!113715 c!97993) b!938975))

(assert (= (and d!113715 (not c!97993)) b!938976))

(assert (= (and b!938976 c!97994) b!938977))

(assert (= (and b!938976 (not c!97994)) b!938978))

(declare-fun m!874279 () Bool)

(assert (=> b!938977 m!874279))

(assert (=> b!938888 d!113715))

(declare-fun d!113717 () Bool)

(assert (=> d!113717 (= (apply!862 lt!423750 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14356 (getValueByKey!481 (toList!6045 lt!423750) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26320 () Bool)

(assert (= bs!26320 d!113717))

(declare-fun m!874281 () Bool)

(assert (=> bs!26320 m!874281))

(assert (=> bs!26320 m!874281))

(declare-fun m!874283 () Bool)

(assert (=> bs!26320 m!874283))

(assert (=> b!938840 d!113717))

(declare-fun d!113719 () Bool)

(declare-fun res!631569 () Bool)

(declare-fun e!527388 () Bool)

(assert (=> d!113719 (=> res!631569 e!527388)))

(assert (=> d!113719 (= res!631569 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27647 _keys!1487)))))

(assert (=> d!113719 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881) e!527388)))

(declare-fun b!938979 () Bool)

(declare-fun e!527386 () Bool)

(assert (=> b!938979 (= e!527388 e!527386)))

(declare-fun c!97995 () Bool)

(assert (=> b!938979 (= c!97995 (validKeyInArray!0 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!40846 () Bool)

(declare-fun call!40849 () Bool)

(assert (=> bm!40846 (= call!40849 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!938980 () Bool)

(declare-fun e!527387 () Bool)

(assert (=> b!938980 (= e!527386 e!527387)))

(declare-fun lt!423854 () (_ BitVec 64))

(assert (=> b!938980 (= lt!423854 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!423855 () Unit!31648)

(assert (=> b!938980 (= lt!423855 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!423854 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!938980 (arrayContainsKey!0 _keys!1487 lt!423854 #b00000000000000000000000000000000)))

(declare-fun lt!423856 () Unit!31648)

(assert (=> b!938980 (= lt!423856 lt!423855)))

(declare-fun res!631568 () Bool)

(assert (=> b!938980 (= res!631568 (= (seekEntryOrOpen!0 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1487 mask!1881) (Found!8935 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!938980 (=> (not res!631568) (not e!527387))))

(declare-fun b!938981 () Bool)

(assert (=> b!938981 (= e!527387 call!40849)))

(declare-fun b!938982 () Bool)

(assert (=> b!938982 (= e!527386 call!40849)))

(assert (= (and d!113719 (not res!631569)) b!938979))

(assert (= (and b!938979 c!97995) b!938980))

(assert (= (and b!938979 (not c!97995)) b!938982))

(assert (= (and b!938980 res!631568) b!938981))

(assert (= (or b!938981 b!938982) bm!40846))

(declare-fun m!874285 () Bool)

(assert (=> b!938979 m!874285))

(assert (=> b!938979 m!874285))

(declare-fun m!874287 () Bool)

(assert (=> b!938979 m!874287))

(declare-fun m!874289 () Bool)

(assert (=> bm!40846 m!874289))

(assert (=> b!938980 m!874285))

(declare-fun m!874291 () Bool)

(assert (=> b!938980 m!874291))

(declare-fun m!874293 () Bool)

(assert (=> b!938980 m!874293))

(assert (=> b!938980 m!874285))

(declare-fun m!874295 () Bool)

(assert (=> b!938980 m!874295))

(assert (=> bm!40827 d!113719))

(declare-fun d!113721 () Bool)

(declare-fun e!527390 () Bool)

(assert (=> d!113721 e!527390))

(declare-fun res!631570 () Bool)

(assert (=> d!113721 (=> res!631570 e!527390)))

(declare-fun lt!423859 () Bool)

(assert (=> d!113721 (= res!631570 (not lt!423859))))

(declare-fun lt!423858 () Bool)

(assert (=> d!113721 (= lt!423859 lt!423858)))

(declare-fun lt!423860 () Unit!31648)

(declare-fun e!527389 () Unit!31648)

(assert (=> d!113721 (= lt!423860 e!527389)))

(declare-fun c!97996 () Bool)

(assert (=> d!113721 (= c!97996 lt!423858)))

(assert (=> d!113721 (= lt!423858 (containsKey!452 (toList!6045 lt!423750) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113721 (= (contains!5115 lt!423750 #b1000000000000000000000000000000000000000000000000000000000000000) lt!423859)))

(declare-fun b!938983 () Bool)

(declare-fun lt!423857 () Unit!31648)

(assert (=> b!938983 (= e!527389 lt!423857)))

(assert (=> b!938983 (= lt!423857 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6045 lt!423750) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938983 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423750) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938984 () Bool)

(declare-fun Unit!31667 () Unit!31648)

(assert (=> b!938984 (= e!527389 Unit!31667)))

(declare-fun b!938985 () Bool)

(assert (=> b!938985 (= e!527390 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423750) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113721 c!97996) b!938983))

(assert (= (and d!113721 (not c!97996)) b!938984))

(assert (= (and d!113721 (not res!631570)) b!938985))

(declare-fun m!874297 () Bool)

(assert (=> d!113721 m!874297))

(declare-fun m!874299 () Bool)

(assert (=> b!938983 m!874299))

(assert (=> b!938983 m!874281))

(assert (=> b!938983 m!874281))

(declare-fun m!874301 () Bool)

(assert (=> b!938983 m!874301))

(assert (=> b!938985 m!874281))

(assert (=> b!938985 m!874281))

(assert (=> b!938985 m!874301))

(assert (=> bm!40834 d!113721))

(declare-fun d!113723 () Bool)

(assert (=> d!113723 (not (= (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) k0!1099))))

(assert (=> d!113723 true))

(declare-fun _$67!49 () Unit!31648)

(assert (=> d!113723 (= (choose!21 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19138) _$67!49)))

(declare-fun bs!26321 () Bool)

(assert (= bs!26321 d!113723))

(assert (=> bs!26321 m!873841))

(assert (=> d!113687 d!113723))

(declare-fun b!938986 () Bool)

(declare-fun lt!423865 () Unit!31648)

(declare-fun lt!423864 () Unit!31648)

(assert (=> b!938986 (= lt!423865 lt!423864)))

(declare-fun lt!423866 () (_ BitVec 64))

(declare-fun lt!423867 () ListLongMap!12059)

(declare-fun lt!423861 () V!31975)

(declare-fun lt!423863 () (_ BitVec 64))

(assert (=> b!938986 (not (contains!5115 (+!2853 lt!423867 (tuple2!13361 lt!423866 lt!423861)) lt!423863))))

(assert (=> b!938986 (= lt!423864 (addStillNotContains!222 lt!423867 lt!423866 lt!423861 lt!423863))))

(assert (=> b!938986 (= lt!423863 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!938986 (= lt!423861 (get!14353 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!938986 (= lt!423866 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun call!40850 () ListLongMap!12059)

(assert (=> b!938986 (= lt!423867 call!40850)))

(declare-fun e!527396 () ListLongMap!12059)

(assert (=> b!938986 (= e!527396 (+!2853 call!40850 (tuple2!13361 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14353 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!527392 () Bool)

(declare-fun lt!423862 () ListLongMap!12059)

(declare-fun b!938987 () Bool)

(assert (=> b!938987 (= e!527392 (= lt!423862 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235)))))

(declare-fun b!938988 () Bool)

(assert (=> b!938988 (= e!527396 call!40850)))

(declare-fun b!938989 () Bool)

(declare-fun res!631571 () Bool)

(declare-fun e!527391 () Bool)

(assert (=> b!938989 (=> (not res!631571) (not e!527391))))

(assert (=> b!938989 (= res!631571 (not (contains!5115 lt!423862 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!938990 () Bool)

(declare-fun e!527395 () ListLongMap!12059)

(assert (=> b!938990 (= e!527395 e!527396)))

(declare-fun c!98000 () Bool)

(assert (=> b!938990 (= c!98000 (validKeyInArray!0 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!938991 () Bool)

(declare-fun e!527394 () Bool)

(assert (=> b!938991 (= e!527394 (validKeyInArray!0 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938991 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun bm!40847 () Bool)

(assert (=> bm!40847 (= call!40850 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun d!113725 () Bool)

(assert (=> d!113725 e!527391))

(declare-fun res!631574 () Bool)

(assert (=> d!113725 (=> (not res!631574) (not e!527391))))

(assert (=> d!113725 (= res!631574 (not (contains!5115 lt!423862 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!113725 (= lt!423862 e!527395)))

(declare-fun c!97997 () Bool)

(assert (=> d!113725 (= c!97997 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27647 _keys!1487)))))

(assert (=> d!113725 (validMask!0 mask!1881)))

(assert (=> d!113725 (= (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!423862)))

(declare-fun b!938992 () Bool)

(declare-fun e!527397 () Bool)

(declare-fun e!527393 () Bool)

(assert (=> b!938992 (= e!527397 e!527393)))

(assert (=> b!938992 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27647 _keys!1487)))))

(declare-fun res!631572 () Bool)

(assert (=> b!938992 (= res!631572 (contains!5115 lt!423862 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938992 (=> (not res!631572) (not e!527393))))

(declare-fun b!938993 () Bool)

(assert (=> b!938993 (= e!527395 (ListLongMap!12060 Nil!19137))))

(declare-fun b!938994 () Bool)

(assert (=> b!938994 (= e!527391 e!527397)))

(declare-fun c!97998 () Bool)

(assert (=> b!938994 (= c!97998 e!527394)))

(declare-fun res!631573 () Bool)

(assert (=> b!938994 (=> (not res!631573) (not e!527394))))

(assert (=> b!938994 (= res!631573 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27647 _keys!1487)))))

(declare-fun b!938995 () Bool)

(assert (=> b!938995 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27647 _keys!1487)))))

(assert (=> b!938995 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27648 _values!1231)))))

(assert (=> b!938995 (= e!527393 (= (apply!862 lt!423862 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14353 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!938996 () Bool)

(assert (=> b!938996 (= e!527392 (isEmpty!702 lt!423862))))

(declare-fun b!938997 () Bool)

(assert (=> b!938997 (= e!527397 e!527392)))

(declare-fun c!97999 () Bool)

(assert (=> b!938997 (= c!97999 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27647 _keys!1487)))))

(assert (= (and d!113725 c!97997) b!938993))

(assert (= (and d!113725 (not c!97997)) b!938990))

(assert (= (and b!938990 c!98000) b!938986))

(assert (= (and b!938990 (not c!98000)) b!938988))

(assert (= (or b!938986 b!938988) bm!40847))

(assert (= (and d!113725 res!631574) b!938989))

(assert (= (and b!938989 res!631571) b!938994))

(assert (= (and b!938994 res!631573) b!938991))

(assert (= (and b!938994 c!97998) b!938992))

(assert (= (and b!938994 (not c!97998)) b!938997))

(assert (= (and b!938992 res!631572) b!938995))

(assert (= (and b!938997 c!97999) b!938987))

(assert (= (and b!938997 (not c!97999)) b!938996))

(declare-fun b_lambda!14197 () Bool)

(assert (=> (not b_lambda!14197) (not b!938986)))

(assert (=> b!938986 t!27424))

(declare-fun b_and!29123 () Bool)

(assert (= b_and!29121 (and (=> t!27424 result!12111) b_and!29123)))

(declare-fun b_lambda!14199 () Bool)

(assert (=> (not b_lambda!14199) (not b!938995)))

(assert (=> b!938995 t!27424))

(declare-fun b_and!29125 () Bool)

(assert (= b_and!29123 (and (=> t!27424 result!12111) b_and!29125)))

(declare-fun m!874303 () Bool)

(assert (=> bm!40847 m!874303))

(declare-fun m!874305 () Bool)

(assert (=> b!938996 m!874305))

(assert (=> b!938990 m!873841))

(assert (=> b!938990 m!873841))

(assert (=> b!938990 m!874069))

(declare-fun m!874307 () Bool)

(assert (=> d!113725 m!874307))

(assert (=> d!113725 m!873827))

(assert (=> b!938987 m!874303))

(assert (=> b!938992 m!873841))

(assert (=> b!938992 m!873841))

(declare-fun m!874309 () Bool)

(assert (=> b!938992 m!874309))

(assert (=> b!938991 m!873841))

(assert (=> b!938991 m!873841))

(assert (=> b!938991 m!874069))

(declare-fun m!874311 () Bool)

(assert (=> b!938986 m!874311))

(declare-fun m!874313 () Bool)

(assert (=> b!938986 m!874313))

(assert (=> b!938986 m!874311))

(declare-fun m!874315 () Bool)

(assert (=> b!938986 m!874315))

(assert (=> b!938986 m!873793))

(assert (=> b!938986 m!873795))

(assert (=> b!938986 m!873801))

(declare-fun m!874317 () Bool)

(assert (=> b!938986 m!874317))

(assert (=> b!938986 m!873841))

(assert (=> b!938986 m!873795))

(assert (=> b!938986 m!873793))

(declare-fun m!874319 () Bool)

(assert (=> b!938989 m!874319))

(assert (=> b!938995 m!873793))

(assert (=> b!938995 m!873795))

(assert (=> b!938995 m!873801))

(assert (=> b!938995 m!873841))

(declare-fun m!874321 () Bool)

(assert (=> b!938995 m!874321))

(assert (=> b!938995 m!873841))

(assert (=> b!938995 m!873795))

(assert (=> b!938995 m!873793))

(assert (=> b!938822 d!113725))

(declare-fun d!113727 () Bool)

(assert (=> d!113727 (= (apply!862 lt!423755 lt!423753) (get!14356 (getValueByKey!481 (toList!6045 lt!423755) lt!423753)))))

(declare-fun bs!26322 () Bool)

(assert (= bs!26322 d!113727))

(declare-fun m!874323 () Bool)

(assert (=> bs!26322 m!874323))

(assert (=> bs!26322 m!874323))

(declare-fun m!874325 () Bool)

(assert (=> bs!26322 m!874325))

(assert (=> b!938822 d!113727))

(declare-fun d!113729 () Bool)

(assert (=> d!113729 (= (apply!862 (+!2853 lt!423746 (tuple2!13361 lt!423748 minValue!1173)) lt!423741) (get!14356 (getValueByKey!481 (toList!6045 (+!2853 lt!423746 (tuple2!13361 lt!423748 minValue!1173))) lt!423741)))))

(declare-fun bs!26323 () Bool)

(assert (= bs!26323 d!113729))

(declare-fun m!874327 () Bool)

(assert (=> bs!26323 m!874327))

(assert (=> bs!26323 m!874327))

(declare-fun m!874329 () Bool)

(assert (=> bs!26323 m!874329))

(assert (=> b!938822 d!113729))

(declare-fun d!113731 () Bool)

(assert (=> d!113731 (= (apply!862 (+!2853 lt!423761 (tuple2!13361 lt!423749 minValue!1173)) lt!423742) (apply!862 lt!423761 lt!423742))))

(declare-fun lt!423868 () Unit!31648)

(assert (=> d!113731 (= lt!423868 (choose!1562 lt!423761 lt!423749 minValue!1173 lt!423742))))

(declare-fun e!527398 () Bool)

(assert (=> d!113731 e!527398))

(declare-fun res!631575 () Bool)

(assert (=> d!113731 (=> (not res!631575) (not e!527398))))

(assert (=> d!113731 (= res!631575 (contains!5115 lt!423761 lt!423742))))

(assert (=> d!113731 (= (addApplyDifferent!437 lt!423761 lt!423749 minValue!1173 lt!423742) lt!423868)))

(declare-fun b!938998 () Bool)

(assert (=> b!938998 (= e!527398 (not (= lt!423742 lt!423749)))))

(assert (= (and d!113731 res!631575) b!938998))

(assert (=> d!113731 m!874085))

(declare-fun m!874331 () Bool)

(assert (=> d!113731 m!874331))

(assert (=> d!113731 m!874097))

(declare-fun m!874333 () Bool)

(assert (=> d!113731 m!874333))

(assert (=> d!113731 m!874085))

(assert (=> d!113731 m!874087))

(assert (=> b!938822 d!113731))

(declare-fun d!113733 () Bool)

(declare-fun e!527399 () Bool)

(assert (=> d!113733 e!527399))

(declare-fun res!631577 () Bool)

(assert (=> d!113733 (=> (not res!631577) (not e!527399))))

(declare-fun lt!423869 () ListLongMap!12059)

(assert (=> d!113733 (= res!631577 (contains!5115 lt!423869 (_1!6691 (tuple2!13361 lt!423748 minValue!1173))))))

(declare-fun lt!423872 () List!19140)

(assert (=> d!113733 (= lt!423869 (ListLongMap!12060 lt!423872))))

(declare-fun lt!423870 () Unit!31648)

(declare-fun lt!423871 () Unit!31648)

(assert (=> d!113733 (= lt!423870 lt!423871)))

(assert (=> d!113733 (= (getValueByKey!481 lt!423872 (_1!6691 (tuple2!13361 lt!423748 minValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423748 minValue!1173))))))

(assert (=> d!113733 (= lt!423871 (lemmaContainsTupThenGetReturnValue!260 lt!423872 (_1!6691 (tuple2!13361 lt!423748 minValue!1173)) (_2!6691 (tuple2!13361 lt!423748 minValue!1173))))))

(assert (=> d!113733 (= lt!423872 (insertStrictlySorted!317 (toList!6045 lt!423746) (_1!6691 (tuple2!13361 lt!423748 minValue!1173)) (_2!6691 (tuple2!13361 lt!423748 minValue!1173))))))

(assert (=> d!113733 (= (+!2853 lt!423746 (tuple2!13361 lt!423748 minValue!1173)) lt!423869)))

(declare-fun b!938999 () Bool)

(declare-fun res!631576 () Bool)

(assert (=> b!938999 (=> (not res!631576) (not e!527399))))

(assert (=> b!938999 (= res!631576 (= (getValueByKey!481 (toList!6045 lt!423869) (_1!6691 (tuple2!13361 lt!423748 minValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423748 minValue!1173)))))))

(declare-fun b!939000 () Bool)

(assert (=> b!939000 (= e!527399 (contains!5119 (toList!6045 lt!423869) (tuple2!13361 lt!423748 minValue!1173)))))

(assert (= (and d!113733 res!631577) b!938999))

(assert (= (and b!938999 res!631576) b!939000))

(declare-fun m!874335 () Bool)

(assert (=> d!113733 m!874335))

(declare-fun m!874337 () Bool)

(assert (=> d!113733 m!874337))

(declare-fun m!874339 () Bool)

(assert (=> d!113733 m!874339))

(declare-fun m!874341 () Bool)

(assert (=> d!113733 m!874341))

(declare-fun m!874343 () Bool)

(assert (=> b!938999 m!874343))

(declare-fun m!874345 () Bool)

(assert (=> b!939000 m!874345))

(assert (=> b!938822 d!113733))

(declare-fun d!113735 () Bool)

(declare-fun e!527401 () Bool)

(assert (=> d!113735 e!527401))

(declare-fun res!631578 () Bool)

(assert (=> d!113735 (=> res!631578 e!527401)))

(declare-fun lt!423875 () Bool)

(assert (=> d!113735 (= res!631578 (not lt!423875))))

(declare-fun lt!423874 () Bool)

(assert (=> d!113735 (= lt!423875 lt!423874)))

(declare-fun lt!423876 () Unit!31648)

(declare-fun e!527400 () Unit!31648)

(assert (=> d!113735 (= lt!423876 e!527400)))

(declare-fun c!98001 () Bool)

(assert (=> d!113735 (= c!98001 lt!423874)))

(assert (=> d!113735 (= lt!423874 (containsKey!452 (toList!6045 (+!2853 lt!423756 (tuple2!13361 lt!423745 zeroValue!1173))) lt!423743))))

(assert (=> d!113735 (= (contains!5115 (+!2853 lt!423756 (tuple2!13361 lt!423745 zeroValue!1173)) lt!423743) lt!423875)))

(declare-fun b!939001 () Bool)

(declare-fun lt!423873 () Unit!31648)

(assert (=> b!939001 (= e!527400 lt!423873)))

(assert (=> b!939001 (= lt!423873 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6045 (+!2853 lt!423756 (tuple2!13361 lt!423745 zeroValue!1173))) lt!423743))))

(assert (=> b!939001 (isDefined!354 (getValueByKey!481 (toList!6045 (+!2853 lt!423756 (tuple2!13361 lt!423745 zeroValue!1173))) lt!423743))))

(declare-fun b!939002 () Bool)

(declare-fun Unit!31668 () Unit!31648)

(assert (=> b!939002 (= e!527400 Unit!31668)))

(declare-fun b!939003 () Bool)

(assert (=> b!939003 (= e!527401 (isDefined!354 (getValueByKey!481 (toList!6045 (+!2853 lt!423756 (tuple2!13361 lt!423745 zeroValue!1173))) lt!423743)))))

(assert (= (and d!113735 c!98001) b!939001))

(assert (= (and d!113735 (not c!98001)) b!939002))

(assert (= (and d!113735 (not res!631578)) b!939003))

(declare-fun m!874347 () Bool)

(assert (=> d!113735 m!874347))

(declare-fun m!874349 () Bool)

(assert (=> b!939001 m!874349))

(declare-fun m!874351 () Bool)

(assert (=> b!939001 m!874351))

(assert (=> b!939001 m!874351))

(declare-fun m!874353 () Bool)

(assert (=> b!939001 m!874353))

(assert (=> b!939003 m!874351))

(assert (=> b!939003 m!874351))

(assert (=> b!939003 m!874353))

(assert (=> b!938822 d!113735))

(declare-fun d!113737 () Bool)

(declare-fun e!527402 () Bool)

(assert (=> d!113737 e!527402))

(declare-fun res!631580 () Bool)

(assert (=> d!113737 (=> (not res!631580) (not e!527402))))

(declare-fun lt!423877 () ListLongMap!12059)

(assert (=> d!113737 (= res!631580 (contains!5115 lt!423877 (_1!6691 (tuple2!13361 lt!423749 minValue!1173))))))

(declare-fun lt!423880 () List!19140)

(assert (=> d!113737 (= lt!423877 (ListLongMap!12060 lt!423880))))

(declare-fun lt!423878 () Unit!31648)

(declare-fun lt!423879 () Unit!31648)

(assert (=> d!113737 (= lt!423878 lt!423879)))

(assert (=> d!113737 (= (getValueByKey!481 lt!423880 (_1!6691 (tuple2!13361 lt!423749 minValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423749 minValue!1173))))))

(assert (=> d!113737 (= lt!423879 (lemmaContainsTupThenGetReturnValue!260 lt!423880 (_1!6691 (tuple2!13361 lt!423749 minValue!1173)) (_2!6691 (tuple2!13361 lt!423749 minValue!1173))))))

(assert (=> d!113737 (= lt!423880 (insertStrictlySorted!317 (toList!6045 lt!423761) (_1!6691 (tuple2!13361 lt!423749 minValue!1173)) (_2!6691 (tuple2!13361 lt!423749 minValue!1173))))))

(assert (=> d!113737 (= (+!2853 lt!423761 (tuple2!13361 lt!423749 minValue!1173)) lt!423877)))

(declare-fun b!939004 () Bool)

(declare-fun res!631579 () Bool)

(assert (=> b!939004 (=> (not res!631579) (not e!527402))))

(assert (=> b!939004 (= res!631579 (= (getValueByKey!481 (toList!6045 lt!423877) (_1!6691 (tuple2!13361 lt!423749 minValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423749 minValue!1173)))))))

(declare-fun b!939005 () Bool)

(assert (=> b!939005 (= e!527402 (contains!5119 (toList!6045 lt!423877) (tuple2!13361 lt!423749 minValue!1173)))))

(assert (= (and d!113737 res!631580) b!939004))

(assert (= (and b!939004 res!631579) b!939005))

(declare-fun m!874355 () Bool)

(assert (=> d!113737 m!874355))

(declare-fun m!874357 () Bool)

(assert (=> d!113737 m!874357))

(declare-fun m!874359 () Bool)

(assert (=> d!113737 m!874359))

(declare-fun m!874361 () Bool)

(assert (=> d!113737 m!874361))

(declare-fun m!874363 () Bool)

(assert (=> b!939004 m!874363))

(declare-fun m!874365 () Bool)

(assert (=> b!939005 m!874365))

(assert (=> b!938822 d!113737))

(declare-fun d!113739 () Bool)

(declare-fun e!527403 () Bool)

(assert (=> d!113739 e!527403))

(declare-fun res!631582 () Bool)

(assert (=> d!113739 (=> (not res!631582) (not e!527403))))

(declare-fun lt!423881 () ListLongMap!12059)

(assert (=> d!113739 (= res!631582 (contains!5115 lt!423881 (_1!6691 (tuple2!13361 lt!423744 zeroValue!1173))))))

(declare-fun lt!423884 () List!19140)

(assert (=> d!113739 (= lt!423881 (ListLongMap!12060 lt!423884))))

(declare-fun lt!423882 () Unit!31648)

(declare-fun lt!423883 () Unit!31648)

(assert (=> d!113739 (= lt!423882 lt!423883)))

(assert (=> d!113739 (= (getValueByKey!481 lt!423884 (_1!6691 (tuple2!13361 lt!423744 zeroValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423744 zeroValue!1173))))))

(assert (=> d!113739 (= lt!423883 (lemmaContainsTupThenGetReturnValue!260 lt!423884 (_1!6691 (tuple2!13361 lt!423744 zeroValue!1173)) (_2!6691 (tuple2!13361 lt!423744 zeroValue!1173))))))

(assert (=> d!113739 (= lt!423884 (insertStrictlySorted!317 (toList!6045 lt!423755) (_1!6691 (tuple2!13361 lt!423744 zeroValue!1173)) (_2!6691 (tuple2!13361 lt!423744 zeroValue!1173))))))

(assert (=> d!113739 (= (+!2853 lt!423755 (tuple2!13361 lt!423744 zeroValue!1173)) lt!423881)))

(declare-fun b!939006 () Bool)

(declare-fun res!631581 () Bool)

(assert (=> b!939006 (=> (not res!631581) (not e!527403))))

(assert (=> b!939006 (= res!631581 (= (getValueByKey!481 (toList!6045 lt!423881) (_1!6691 (tuple2!13361 lt!423744 zeroValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423744 zeroValue!1173)))))))

(declare-fun b!939007 () Bool)

(assert (=> b!939007 (= e!527403 (contains!5119 (toList!6045 lt!423881) (tuple2!13361 lt!423744 zeroValue!1173)))))

(assert (= (and d!113739 res!631582) b!939006))

(assert (= (and b!939006 res!631581) b!939007))

(declare-fun m!874367 () Bool)

(assert (=> d!113739 m!874367))

(declare-fun m!874369 () Bool)

(assert (=> d!113739 m!874369))

(declare-fun m!874371 () Bool)

(assert (=> d!113739 m!874371))

(declare-fun m!874373 () Bool)

(assert (=> d!113739 m!874373))

(declare-fun m!874375 () Bool)

(assert (=> b!939006 m!874375))

(declare-fun m!874377 () Bool)

(assert (=> b!939007 m!874377))

(assert (=> b!938822 d!113739))

(declare-fun d!113741 () Bool)

(declare-fun e!527404 () Bool)

(assert (=> d!113741 e!527404))

(declare-fun res!631584 () Bool)

(assert (=> d!113741 (=> (not res!631584) (not e!527404))))

(declare-fun lt!423885 () ListLongMap!12059)

(assert (=> d!113741 (= res!631584 (contains!5115 lt!423885 (_1!6691 (tuple2!13361 lt!423745 zeroValue!1173))))))

(declare-fun lt!423888 () List!19140)

(assert (=> d!113741 (= lt!423885 (ListLongMap!12060 lt!423888))))

(declare-fun lt!423886 () Unit!31648)

(declare-fun lt!423887 () Unit!31648)

(assert (=> d!113741 (= lt!423886 lt!423887)))

(assert (=> d!113741 (= (getValueByKey!481 lt!423888 (_1!6691 (tuple2!13361 lt!423745 zeroValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423745 zeroValue!1173))))))

(assert (=> d!113741 (= lt!423887 (lemmaContainsTupThenGetReturnValue!260 lt!423888 (_1!6691 (tuple2!13361 lt!423745 zeroValue!1173)) (_2!6691 (tuple2!13361 lt!423745 zeroValue!1173))))))

(assert (=> d!113741 (= lt!423888 (insertStrictlySorted!317 (toList!6045 lt!423756) (_1!6691 (tuple2!13361 lt!423745 zeroValue!1173)) (_2!6691 (tuple2!13361 lt!423745 zeroValue!1173))))))

(assert (=> d!113741 (= (+!2853 lt!423756 (tuple2!13361 lt!423745 zeroValue!1173)) lt!423885)))

(declare-fun b!939008 () Bool)

(declare-fun res!631583 () Bool)

(assert (=> b!939008 (=> (not res!631583) (not e!527404))))

(assert (=> b!939008 (= res!631583 (= (getValueByKey!481 (toList!6045 lt!423885) (_1!6691 (tuple2!13361 lt!423745 zeroValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423745 zeroValue!1173)))))))

(declare-fun b!939009 () Bool)

(assert (=> b!939009 (= e!527404 (contains!5119 (toList!6045 lt!423885) (tuple2!13361 lt!423745 zeroValue!1173)))))

(assert (= (and d!113741 res!631584) b!939008))

(assert (= (and b!939008 res!631583) b!939009))

(declare-fun m!874379 () Bool)

(assert (=> d!113741 m!874379))

(declare-fun m!874381 () Bool)

(assert (=> d!113741 m!874381))

(declare-fun m!874383 () Bool)

(assert (=> d!113741 m!874383))

(declare-fun m!874385 () Bool)

(assert (=> d!113741 m!874385))

(declare-fun m!874387 () Bool)

(assert (=> b!939008 m!874387))

(declare-fun m!874389 () Bool)

(assert (=> b!939009 m!874389))

(assert (=> b!938822 d!113741))

(declare-fun d!113743 () Bool)

(assert (=> d!113743 (= (apply!862 (+!2853 lt!423755 (tuple2!13361 lt!423744 zeroValue!1173)) lt!423753) (apply!862 lt!423755 lt!423753))))

(declare-fun lt!423889 () Unit!31648)

(assert (=> d!113743 (= lt!423889 (choose!1562 lt!423755 lt!423744 zeroValue!1173 lt!423753))))

(declare-fun e!527405 () Bool)

(assert (=> d!113743 e!527405))

(declare-fun res!631585 () Bool)

(assert (=> d!113743 (=> (not res!631585) (not e!527405))))

(assert (=> d!113743 (= res!631585 (contains!5115 lt!423755 lt!423753))))

(assert (=> d!113743 (= (addApplyDifferent!437 lt!423755 lt!423744 zeroValue!1173 lt!423753) lt!423889)))

(declare-fun b!939010 () Bool)

(assert (=> b!939010 (= e!527405 (not (= lt!423753 lt!423744)))))

(assert (= (and d!113743 res!631585) b!939010))

(assert (=> d!113743 m!874075))

(declare-fun m!874391 () Bool)

(assert (=> d!113743 m!874391))

(assert (=> d!113743 m!874091))

(declare-fun m!874393 () Bool)

(assert (=> d!113743 m!874393))

(assert (=> d!113743 m!874075))

(assert (=> d!113743 m!874077))

(assert (=> b!938822 d!113743))

(declare-fun d!113745 () Bool)

(assert (=> d!113745 (contains!5115 (+!2853 lt!423756 (tuple2!13361 lt!423745 zeroValue!1173)) lt!423743)))

(declare-fun lt!423890 () Unit!31648)

(assert (=> d!113745 (= lt!423890 (choose!1559 lt!423756 lt!423745 zeroValue!1173 lt!423743))))

(assert (=> d!113745 (contains!5115 lt!423756 lt!423743)))

(assert (=> d!113745 (= (addStillContains!556 lt!423756 lt!423745 zeroValue!1173 lt!423743) lt!423890)))

(declare-fun bs!26324 () Bool)

(assert (= bs!26324 d!113745))

(assert (=> bs!26324 m!874093))

(assert (=> bs!26324 m!874093))

(assert (=> bs!26324 m!874095))

(declare-fun m!874395 () Bool)

(assert (=> bs!26324 m!874395))

(declare-fun m!874397 () Bool)

(assert (=> bs!26324 m!874397))

(assert (=> b!938822 d!113745))

(declare-fun d!113747 () Bool)

(assert (=> d!113747 (= (apply!862 (+!2853 lt!423761 (tuple2!13361 lt!423749 minValue!1173)) lt!423742) (get!14356 (getValueByKey!481 (toList!6045 (+!2853 lt!423761 (tuple2!13361 lt!423749 minValue!1173))) lt!423742)))))

(declare-fun bs!26325 () Bool)

(assert (= bs!26325 d!113747))

(declare-fun m!874399 () Bool)

(assert (=> bs!26325 m!874399))

(assert (=> bs!26325 m!874399))

(declare-fun m!874401 () Bool)

(assert (=> bs!26325 m!874401))

(assert (=> b!938822 d!113747))

(declare-fun d!113749 () Bool)

(assert (=> d!113749 (= (apply!862 lt!423761 lt!423742) (get!14356 (getValueByKey!481 (toList!6045 lt!423761) lt!423742)))))

(declare-fun bs!26326 () Bool)

(assert (= bs!26326 d!113749))

(declare-fun m!874403 () Bool)

(assert (=> bs!26326 m!874403))

(assert (=> bs!26326 m!874403))

(declare-fun m!874405 () Bool)

(assert (=> bs!26326 m!874405))

(assert (=> b!938822 d!113749))

(declare-fun d!113751 () Bool)

(assert (=> d!113751 (= (apply!862 (+!2853 lt!423746 (tuple2!13361 lt!423748 minValue!1173)) lt!423741) (apply!862 lt!423746 lt!423741))))

(declare-fun lt!423891 () Unit!31648)

(assert (=> d!113751 (= lt!423891 (choose!1562 lt!423746 lt!423748 minValue!1173 lt!423741))))

(declare-fun e!527406 () Bool)

(assert (=> d!113751 e!527406))

(declare-fun res!631586 () Bool)

(assert (=> d!113751 (=> (not res!631586) (not e!527406))))

(assert (=> d!113751 (= res!631586 (contains!5115 lt!423746 lt!423741))))

(assert (=> d!113751 (= (addApplyDifferent!437 lt!423746 lt!423748 minValue!1173 lt!423741) lt!423891)))

(declare-fun b!939011 () Bool)

(assert (=> b!939011 (= e!527406 (not (= lt!423741 lt!423748)))))

(assert (= (and d!113751 res!631586) b!939011))

(assert (=> d!113751 m!874079))

(declare-fun m!874407 () Bool)

(assert (=> d!113751 m!874407))

(assert (=> d!113751 m!874083))

(declare-fun m!874409 () Bool)

(assert (=> d!113751 m!874409))

(assert (=> d!113751 m!874079))

(assert (=> d!113751 m!874081))

(assert (=> b!938822 d!113751))

(declare-fun d!113753 () Bool)

(assert (=> d!113753 (= (apply!862 (+!2853 lt!423755 (tuple2!13361 lt!423744 zeroValue!1173)) lt!423753) (get!14356 (getValueByKey!481 (toList!6045 (+!2853 lt!423755 (tuple2!13361 lt!423744 zeroValue!1173))) lt!423753)))))

(declare-fun bs!26327 () Bool)

(assert (= bs!26327 d!113753))

(declare-fun m!874411 () Bool)

(assert (=> bs!26327 m!874411))

(assert (=> bs!26327 m!874411))

(declare-fun m!874413 () Bool)

(assert (=> bs!26327 m!874413))

(assert (=> b!938822 d!113753))

(declare-fun d!113755 () Bool)

(assert (=> d!113755 (= (apply!862 lt!423746 lt!423741) (get!14356 (getValueByKey!481 (toList!6045 lt!423746) lt!423741)))))

(declare-fun bs!26328 () Bool)

(assert (= bs!26328 d!113755))

(declare-fun m!874415 () Bool)

(assert (=> bs!26328 m!874415))

(assert (=> bs!26328 m!874415))

(declare-fun m!874417 () Bool)

(assert (=> bs!26328 m!874417))

(assert (=> b!938822 d!113755))

(assert (=> d!113651 d!113653))

(assert (=> d!113671 d!113653))

(declare-fun d!113757 () Bool)

(declare-fun e!527408 () Bool)

(assert (=> d!113757 e!527408))

(declare-fun res!631587 () Bool)

(assert (=> d!113757 (=> res!631587 e!527408)))

(declare-fun lt!423894 () Bool)

(assert (=> d!113757 (= res!631587 (not lt!423894))))

(declare-fun lt!423893 () Bool)

(assert (=> d!113757 (= lt!423894 lt!423893)))

(declare-fun lt!423895 () Unit!31648)

(declare-fun e!527407 () Unit!31648)

(assert (=> d!113757 (= lt!423895 e!527407)))

(declare-fun c!98002 () Bool)

(assert (=> d!113757 (= c!98002 lt!423893)))

(assert (=> d!113757 (= lt!423893 (containsKey!452 (toList!6045 lt!423715) (select (arr!27187 _keys!1487) from!1844)))))

(assert (=> d!113757 (= (contains!5115 lt!423715 (select (arr!27187 _keys!1487) from!1844)) lt!423894)))

(declare-fun b!939012 () Bool)

(declare-fun lt!423892 () Unit!31648)

(assert (=> b!939012 (= e!527407 lt!423892)))

(assert (=> b!939012 (= lt!423892 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6045 lt!423715) (select (arr!27187 _keys!1487) from!1844)))))

(assert (=> b!939012 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423715) (select (arr!27187 _keys!1487) from!1844)))))

(declare-fun b!939013 () Bool)

(declare-fun Unit!31669 () Unit!31648)

(assert (=> b!939013 (= e!527407 Unit!31669)))

(declare-fun b!939014 () Bool)

(assert (=> b!939014 (= e!527408 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423715) (select (arr!27187 _keys!1487) from!1844))))))

(assert (= (and d!113757 c!98002) b!939012))

(assert (= (and d!113757 (not c!98002)) b!939013))

(assert (= (and d!113757 (not res!631587)) b!939014))

(assert (=> d!113757 m!873977))

(declare-fun m!874419 () Bool)

(assert (=> d!113757 m!874419))

(assert (=> b!939012 m!873977))

(declare-fun m!874421 () Bool)

(assert (=> b!939012 m!874421))

(assert (=> b!939012 m!873977))

(declare-fun m!874423 () Bool)

(assert (=> b!939012 m!874423))

(assert (=> b!939012 m!874423))

(declare-fun m!874425 () Bool)

(assert (=> b!939012 m!874425))

(assert (=> b!939014 m!873977))

(assert (=> b!939014 m!874423))

(assert (=> b!939014 m!874423))

(assert (=> b!939014 m!874425))

(assert (=> b!938781 d!113757))

(declare-fun d!113759 () Bool)

(assert (=> d!113759 (= (validKeyInArray!0 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (and (not (= (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938873 d!113759))

(assert (=> b!938871 d!113759))

(declare-fun d!113761 () Bool)

(declare-fun e!527409 () Bool)

(assert (=> d!113761 e!527409))

(declare-fun res!631589 () Bool)

(assert (=> d!113761 (=> (not res!631589) (not e!527409))))

(declare-fun lt!423896 () ListLongMap!12059)

(assert (=> d!113761 (= res!631589 (contains!5115 lt!423896 (_1!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun lt!423899 () List!19140)

(assert (=> d!113761 (= lt!423896 (ListLongMap!12060 lt!423899))))

(declare-fun lt!423897 () Unit!31648)

(declare-fun lt!423898 () Unit!31648)

(assert (=> d!113761 (= lt!423897 lt!423898)))

(assert (=> d!113761 (= (getValueByKey!481 lt!423899 (_1!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!486 (_2!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113761 (= lt!423898 (lemmaContainsTupThenGetReturnValue!260 lt!423899 (_1!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113761 (= lt!423899 (insertStrictlySorted!317 (toList!6045 call!40841) (_1!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113761 (= (+!2853 call!40841 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) lt!423896)))

(declare-fun b!939015 () Bool)

(declare-fun res!631588 () Bool)

(assert (=> b!939015 (=> (not res!631588) (not e!527409))))

(assert (=> b!939015 (= res!631588 (= (getValueByKey!481 (toList!6045 lt!423896) (_1!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!486 (_2!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun b!939016 () Bool)

(assert (=> b!939016 (= e!527409 (contains!5119 (toList!6045 lt!423896) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(assert (= (and d!113761 res!631589) b!939015))

(assert (= (and b!939015 res!631588) b!939016))

(declare-fun m!874427 () Bool)

(assert (=> d!113761 m!874427))

(declare-fun m!874429 () Bool)

(assert (=> d!113761 m!874429))

(declare-fun m!874431 () Bool)

(assert (=> d!113761 m!874431))

(declare-fun m!874433 () Bool)

(assert (=> d!113761 m!874433))

(declare-fun m!874435 () Bool)

(assert (=> b!939015 m!874435))

(declare-fun m!874437 () Bool)

(assert (=> b!939016 m!874437))

(assert (=> b!938844 d!113761))

(declare-fun d!113763 () Bool)

(assert (=> d!113763 (= (apply!862 lt!423750 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14356 (getValueByKey!481 (toList!6045 lt!423750) (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun bs!26329 () Bool)

(assert (= bs!26329 d!113763))

(assert (=> bs!26329 m!873841))

(declare-fun m!874439 () Bool)

(assert (=> bs!26329 m!874439))

(assert (=> bs!26329 m!874439))

(declare-fun m!874441 () Bool)

(assert (=> bs!26329 m!874441))

(assert (=> b!938836 d!113763))

(assert (=> b!938836 d!113693))

(declare-fun d!113765 () Bool)

(declare-fun e!527411 () Bool)

(assert (=> d!113765 e!527411))

(declare-fun res!631590 () Bool)

(assert (=> d!113765 (=> res!631590 e!527411)))

(declare-fun lt!423902 () Bool)

(assert (=> d!113765 (= res!631590 (not lt!423902))))

(declare-fun lt!423901 () Bool)

(assert (=> d!113765 (= lt!423902 lt!423901)))

(declare-fun lt!423903 () Unit!31648)

(declare-fun e!527410 () Unit!31648)

(assert (=> d!113765 (= lt!423903 e!527410)))

(declare-fun c!98003 () Bool)

(assert (=> d!113765 (= c!98003 lt!423901)))

(assert (=> d!113765 (= lt!423901 (containsKey!452 (toList!6045 (+!2853 lt!423561 (tuple2!13361 lt!423563 lt!423562))) k0!1099))))

(assert (=> d!113765 (= (contains!5115 (+!2853 lt!423561 (tuple2!13361 lt!423563 lt!423562)) k0!1099) lt!423902)))

(declare-fun b!939017 () Bool)

(declare-fun lt!423900 () Unit!31648)

(assert (=> b!939017 (= e!527410 lt!423900)))

(assert (=> b!939017 (= lt!423900 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6045 (+!2853 lt!423561 (tuple2!13361 lt!423563 lt!423562))) k0!1099))))

(assert (=> b!939017 (isDefined!354 (getValueByKey!481 (toList!6045 (+!2853 lt!423561 (tuple2!13361 lt!423563 lt!423562))) k0!1099))))

(declare-fun b!939018 () Bool)

(declare-fun Unit!31670 () Unit!31648)

(assert (=> b!939018 (= e!527410 Unit!31670)))

(declare-fun b!939019 () Bool)

(assert (=> b!939019 (= e!527411 (isDefined!354 (getValueByKey!481 (toList!6045 (+!2853 lt!423561 (tuple2!13361 lt!423563 lt!423562))) k0!1099)))))

(assert (= (and d!113765 c!98003) b!939017))

(assert (= (and d!113765 (not c!98003)) b!939018))

(assert (= (and d!113765 (not res!631590)) b!939019))

(declare-fun m!874443 () Bool)

(assert (=> d!113765 m!874443))

(declare-fun m!874445 () Bool)

(assert (=> b!939017 m!874445))

(declare-fun m!874447 () Bool)

(assert (=> b!939017 m!874447))

(assert (=> b!939017 m!874447))

(declare-fun m!874449 () Bool)

(assert (=> b!939017 m!874449))

(assert (=> b!939019 m!874447))

(assert (=> b!939019 m!874447))

(assert (=> b!939019 m!874449))

(assert (=> d!113675 d!113765))

(declare-fun d!113767 () Bool)

(declare-fun e!527412 () Bool)

(assert (=> d!113767 e!527412))

(declare-fun res!631592 () Bool)

(assert (=> d!113767 (=> (not res!631592) (not e!527412))))

(declare-fun lt!423904 () ListLongMap!12059)

(assert (=> d!113767 (= res!631592 (contains!5115 lt!423904 (_1!6691 (tuple2!13361 lt!423563 lt!423562))))))

(declare-fun lt!423907 () List!19140)

(assert (=> d!113767 (= lt!423904 (ListLongMap!12060 lt!423907))))

(declare-fun lt!423905 () Unit!31648)

(declare-fun lt!423906 () Unit!31648)

(assert (=> d!113767 (= lt!423905 lt!423906)))

(assert (=> d!113767 (= (getValueByKey!481 lt!423907 (_1!6691 (tuple2!13361 lt!423563 lt!423562))) (Some!486 (_2!6691 (tuple2!13361 lt!423563 lt!423562))))))

(assert (=> d!113767 (= lt!423906 (lemmaContainsTupThenGetReturnValue!260 lt!423907 (_1!6691 (tuple2!13361 lt!423563 lt!423562)) (_2!6691 (tuple2!13361 lt!423563 lt!423562))))))

(assert (=> d!113767 (= lt!423907 (insertStrictlySorted!317 (toList!6045 lt!423561) (_1!6691 (tuple2!13361 lt!423563 lt!423562)) (_2!6691 (tuple2!13361 lt!423563 lt!423562))))))

(assert (=> d!113767 (= (+!2853 lt!423561 (tuple2!13361 lt!423563 lt!423562)) lt!423904)))

(declare-fun b!939020 () Bool)

(declare-fun res!631591 () Bool)

(assert (=> b!939020 (=> (not res!631591) (not e!527412))))

(assert (=> b!939020 (= res!631591 (= (getValueByKey!481 (toList!6045 lt!423904) (_1!6691 (tuple2!13361 lt!423563 lt!423562))) (Some!486 (_2!6691 (tuple2!13361 lt!423563 lt!423562)))))))

(declare-fun b!939021 () Bool)

(assert (=> b!939021 (= e!527412 (contains!5119 (toList!6045 lt!423904) (tuple2!13361 lt!423563 lt!423562)))))

(assert (= (and d!113767 res!631592) b!939020))

(assert (= (and b!939020 res!631591) b!939021))

(declare-fun m!874451 () Bool)

(assert (=> d!113767 m!874451))

(declare-fun m!874453 () Bool)

(assert (=> d!113767 m!874453))

(declare-fun m!874455 () Bool)

(assert (=> d!113767 m!874455))

(declare-fun m!874457 () Bool)

(assert (=> d!113767 m!874457))

(declare-fun m!874459 () Bool)

(assert (=> b!939020 m!874459))

(declare-fun m!874461 () Bool)

(assert (=> b!939021 m!874461))

(assert (=> d!113675 d!113767))

(declare-fun d!113769 () Bool)

(assert (=> d!113769 (contains!5115 (+!2853 lt!423561 (tuple2!13361 lt!423563 lt!423562)) k0!1099)))

(assert (=> d!113769 true))

(declare-fun _$35!432 () Unit!31648)

(assert (=> d!113769 (= (choose!1559 lt!423561 lt!423563 lt!423562 k0!1099) _$35!432)))

(declare-fun bs!26330 () Bool)

(assert (= bs!26330 d!113769))

(assert (=> bs!26330 m!874169))

(assert (=> bs!26330 m!874169))

(assert (=> bs!26330 m!874171))

(assert (=> d!113675 d!113769))

(assert (=> d!113675 d!113649))

(declare-fun d!113771 () Bool)

(declare-fun res!631597 () Bool)

(declare-fun e!527417 () Bool)

(assert (=> d!113771 (=> res!631597 e!527417)))

(assert (=> d!113771 (= res!631597 (and ((_ is Cons!19136) (toList!6045 lt!423565)) (= (_1!6691 (h!20288 (toList!6045 lt!423565))) k0!1099)))))

(assert (=> d!113771 (= (containsKey!452 (toList!6045 lt!423565) k0!1099) e!527417)))

(declare-fun b!939027 () Bool)

(declare-fun e!527418 () Bool)

(assert (=> b!939027 (= e!527417 e!527418)))

(declare-fun res!631598 () Bool)

(assert (=> b!939027 (=> (not res!631598) (not e!527418))))

(assert (=> b!939027 (= res!631598 (and (or (not ((_ is Cons!19136) (toList!6045 lt!423565))) (bvsle (_1!6691 (h!20288 (toList!6045 lt!423565))) k0!1099)) ((_ is Cons!19136) (toList!6045 lt!423565)) (bvslt (_1!6691 (h!20288 (toList!6045 lt!423565))) k0!1099)))))

(declare-fun b!939028 () Bool)

(assert (=> b!939028 (= e!527418 (containsKey!452 (t!27425 (toList!6045 lt!423565)) k0!1099))))

(assert (= (and d!113771 (not res!631597)) b!939027))

(assert (= (and b!939027 res!631598) b!939028))

(declare-fun m!874463 () Bool)

(assert (=> b!939028 m!874463))

(assert (=> d!113673 d!113771))

(declare-fun d!113773 () Bool)

(declare-fun e!527420 () Bool)

(assert (=> d!113773 e!527420))

(declare-fun res!631599 () Bool)

(assert (=> d!113773 (=> res!631599 e!527420)))

(declare-fun lt!423910 () Bool)

(assert (=> d!113773 (= res!631599 (not lt!423910))))

(declare-fun lt!423909 () Bool)

(assert (=> d!113773 (= lt!423910 lt!423909)))

(declare-fun lt!423911 () Unit!31648)

(declare-fun e!527419 () Unit!31648)

(assert (=> d!113773 (= lt!423911 e!527419)))

(declare-fun c!98004 () Bool)

(assert (=> d!113773 (= c!98004 lt!423909)))

(assert (=> d!113773 (= lt!423909 (containsKey!452 (toList!6045 lt!423750) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113773 (= (contains!5115 lt!423750 #b0000000000000000000000000000000000000000000000000000000000000000) lt!423910)))

(declare-fun b!939029 () Bool)

(declare-fun lt!423908 () Unit!31648)

(assert (=> b!939029 (= e!527419 lt!423908)))

(assert (=> b!939029 (= lt!423908 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6045 lt!423750) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!939029 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423750) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939030 () Bool)

(declare-fun Unit!31671 () Unit!31648)

(assert (=> b!939030 (= e!527419 Unit!31671)))

(declare-fun b!939031 () Bool)

(assert (=> b!939031 (= e!527420 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423750) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113773 c!98004) b!939029))

(assert (= (and d!113773 (not c!98004)) b!939030))

(assert (= (and d!113773 (not res!631599)) b!939031))

(declare-fun m!874465 () Bool)

(assert (=> d!113773 m!874465))

(declare-fun m!874467 () Bool)

(assert (=> b!939029 m!874467))

(declare-fun m!874469 () Bool)

(assert (=> b!939029 m!874469))

(assert (=> b!939029 m!874469))

(declare-fun m!874471 () Bool)

(assert (=> b!939029 m!874471))

(assert (=> b!939031 m!874469))

(assert (=> b!939031 m!874469))

(assert (=> b!939031 m!874471))

(assert (=> bm!40832 d!113773))

(declare-fun d!113775 () Bool)

(declare-fun isEmpty!703 (Option!487) Bool)

(assert (=> d!113775 (= (isDefined!354 (getValueByKey!481 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099)) (not (isEmpty!703 (getValueByKey!481 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099))))))

(declare-fun bs!26331 () Bool)

(assert (= bs!26331 d!113775))

(assert (=> bs!26331 m!874051))

(declare-fun m!874473 () Bool)

(assert (=> bs!26331 m!874473))

(assert (=> b!938819 d!113775))

(declare-fun c!98005 () Bool)

(declare-fun d!113777 () Bool)

(assert (=> d!113777 (= c!98005 (and ((_ is Cons!19136) (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))) (= (_1!6691 (h!20288 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))) k0!1099)))))

(declare-fun e!527421 () Option!487)

(assert (=> d!113777 (= (getValueByKey!481 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099) e!527421)))

(declare-fun b!939033 () Bool)

(declare-fun e!527422 () Option!487)

(assert (=> b!939033 (= e!527421 e!527422)))

(declare-fun c!98006 () Bool)

(assert (=> b!939033 (= c!98006 (and ((_ is Cons!19136) (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))) (not (= (_1!6691 (h!20288 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))) k0!1099))))))

(declare-fun b!939034 () Bool)

(assert (=> b!939034 (= e!527422 (getValueByKey!481 (t!27425 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))) k0!1099))))

(declare-fun b!939032 () Bool)

(assert (=> b!939032 (= e!527421 (Some!486 (_2!6691 (h!20288 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))))))

(declare-fun b!939035 () Bool)

(assert (=> b!939035 (= e!527422 None!485)))

(assert (= (and d!113777 c!98005) b!939032))

(assert (= (and d!113777 (not c!98005)) b!939033))

(assert (= (and b!939033 c!98006) b!939034))

(assert (= (and b!939033 (not c!98006)) b!939035))

(declare-fun m!874475 () Bool)

(assert (=> b!939034 m!874475))

(assert (=> b!938819 d!113777))

(declare-fun d!113779 () Bool)

(assert (=> d!113779 (= (apply!862 lt!423772 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14356 (getValueByKey!481 (toList!6045 lt!423772) (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))))

(declare-fun bs!26332 () Bool)

(assert (= bs!26332 d!113779))

(assert (=> bs!26332 m!874109))

(declare-fun m!874477 () Bool)

(assert (=> bs!26332 m!874477))

(assert (=> bs!26332 m!874477))

(declare-fun m!874479 () Bool)

(assert (=> bs!26332 m!874479))

(assert (=> b!938857 d!113779))

(declare-fun d!113781 () Bool)

(declare-fun c!98007 () Bool)

(assert (=> d!113781 (= c!98007 ((_ is ValueCellFull!9647) (select (arr!27188 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun e!527423 () V!31975)

(assert (=> d!113781 (= (get!14353 (select (arr!27188 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!527423)))

(declare-fun b!939036 () Bool)

(assert (=> b!939036 (= e!527423 (get!14357 (select (arr!27188 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!939037 () Bool)

(assert (=> b!939037 (= e!527423 (get!14358 (select (arr!27188 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113781 c!98007) b!939036))

(assert (= (and d!113781 (not c!98007)) b!939037))

(assert (=> b!939036 m!874155))

(assert (=> b!939036 m!873795))

(declare-fun m!874481 () Bool)

(assert (=> b!939036 m!874481))

(assert (=> b!939037 m!874155))

(assert (=> b!939037 m!873795))

(declare-fun m!874483 () Bool)

(assert (=> b!939037 m!874483))

(assert (=> b!938857 d!113781))

(declare-fun d!113783 () Bool)

(declare-fun res!631600 () Bool)

(declare-fun e!527424 () Bool)

(assert (=> d!113783 (=> res!631600 e!527424)))

(assert (=> d!113783 (= res!631600 (= (select (arr!27187 _keys!1487) (bvadd from!1844 #b00000000000000000000000000000001)) k0!1099))))

(assert (=> d!113783 (= (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)) e!527424)))

(declare-fun b!939038 () Bool)

(declare-fun e!527425 () Bool)

(assert (=> b!939038 (= e!527424 e!527425)))

(declare-fun res!631601 () Bool)

(assert (=> b!939038 (=> (not res!631601) (not e!527425))))

(assert (=> b!939038 (= res!631601 (bvslt (bvadd from!1844 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!27647 _keys!1487)))))

(declare-fun b!939039 () Bool)

(assert (=> b!939039 (= e!527425 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!113783 (not res!631600)) b!939038))

(assert (= (and b!939038 res!631601) b!939039))

(declare-fun m!874485 () Bool)

(assert (=> d!113783 m!874485))

(declare-fun m!874487 () Bool)

(assert (=> b!939039 m!874487))

(assert (=> b!938903 d!113783))

(declare-fun d!113785 () Bool)

(declare-fun e!527427 () Bool)

(assert (=> d!113785 e!527427))

(declare-fun res!631602 () Bool)

(assert (=> d!113785 (=> res!631602 e!527427)))

(declare-fun lt!423914 () Bool)

(assert (=> d!113785 (= res!631602 (not lt!423914))))

(declare-fun lt!423913 () Bool)

(assert (=> d!113785 (= lt!423914 lt!423913)))

(declare-fun lt!423915 () Unit!31648)

(declare-fun e!527426 () Unit!31648)

(assert (=> d!113785 (= lt!423915 e!527426)))

(declare-fun c!98008 () Bool)

(assert (=> d!113785 (= c!98008 lt!423913)))

(assert (=> d!113785 (= lt!423913 (containsKey!452 (toList!6045 lt!423811) (_1!6691 lt!423559)))))

(assert (=> d!113785 (= (contains!5115 lt!423811 (_1!6691 lt!423559)) lt!423914)))

(declare-fun b!939040 () Bool)

(declare-fun lt!423912 () Unit!31648)

(assert (=> b!939040 (= e!527426 lt!423912)))

(assert (=> b!939040 (= lt!423912 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6045 lt!423811) (_1!6691 lt!423559)))))

(assert (=> b!939040 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423811) (_1!6691 lt!423559)))))

(declare-fun b!939041 () Bool)

(declare-fun Unit!31672 () Unit!31648)

(assert (=> b!939041 (= e!527426 Unit!31672)))

(declare-fun b!939042 () Bool)

(assert (=> b!939042 (= e!527427 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423811) (_1!6691 lt!423559))))))

(assert (= (and d!113785 c!98008) b!939040))

(assert (= (and d!113785 (not c!98008)) b!939041))

(assert (= (and d!113785 (not res!631602)) b!939042))

(declare-fun m!874489 () Bool)

(assert (=> d!113785 m!874489))

(declare-fun m!874491 () Bool)

(assert (=> b!939040 m!874491))

(assert (=> b!939040 m!874203))

(assert (=> b!939040 m!874203))

(declare-fun m!874493 () Bool)

(assert (=> b!939040 m!874493))

(assert (=> b!939042 m!874203))

(assert (=> b!939042 m!874203))

(assert (=> b!939042 m!874493))

(assert (=> d!113689 d!113785))

(declare-fun d!113787 () Bool)

(declare-fun c!98009 () Bool)

(assert (=> d!113787 (= c!98009 (and ((_ is Cons!19136) lt!423814) (= (_1!6691 (h!20288 lt!423814)) (_1!6691 lt!423559))))))

(declare-fun e!527428 () Option!487)

(assert (=> d!113787 (= (getValueByKey!481 lt!423814 (_1!6691 lt!423559)) e!527428)))

(declare-fun b!939044 () Bool)

(declare-fun e!527429 () Option!487)

(assert (=> b!939044 (= e!527428 e!527429)))

(declare-fun c!98010 () Bool)

(assert (=> b!939044 (= c!98010 (and ((_ is Cons!19136) lt!423814) (not (= (_1!6691 (h!20288 lt!423814)) (_1!6691 lt!423559)))))))

(declare-fun b!939045 () Bool)

(assert (=> b!939045 (= e!527429 (getValueByKey!481 (t!27425 lt!423814) (_1!6691 lt!423559)))))

(declare-fun b!939043 () Bool)

(assert (=> b!939043 (= e!527428 (Some!486 (_2!6691 (h!20288 lt!423814))))))

(declare-fun b!939046 () Bool)

(assert (=> b!939046 (= e!527429 None!485)))

(assert (= (and d!113787 c!98009) b!939043))

(assert (= (and d!113787 (not c!98009)) b!939044))

(assert (= (and b!939044 c!98010) b!939045))

(assert (= (and b!939044 (not c!98010)) b!939046))

(declare-fun m!874495 () Bool)

(assert (=> b!939045 m!874495))

(assert (=> d!113689 d!113787))

(declare-fun d!113789 () Bool)

(assert (=> d!113789 (= (getValueByKey!481 lt!423814 (_1!6691 lt!423559)) (Some!486 (_2!6691 lt!423559)))))

(declare-fun lt!423918 () Unit!31648)

(declare-fun choose!1563 (List!19140 (_ BitVec 64) V!31975) Unit!31648)

(assert (=> d!113789 (= lt!423918 (choose!1563 lt!423814 (_1!6691 lt!423559) (_2!6691 lt!423559)))))

(declare-fun e!527432 () Bool)

(assert (=> d!113789 e!527432))

(declare-fun res!631607 () Bool)

(assert (=> d!113789 (=> (not res!631607) (not e!527432))))

(declare-fun isStrictlySorted!491 (List!19140) Bool)

(assert (=> d!113789 (= res!631607 (isStrictlySorted!491 lt!423814))))

(assert (=> d!113789 (= (lemmaContainsTupThenGetReturnValue!260 lt!423814 (_1!6691 lt!423559) (_2!6691 lt!423559)) lt!423918)))

(declare-fun b!939051 () Bool)

(declare-fun res!631608 () Bool)

(assert (=> b!939051 (=> (not res!631608) (not e!527432))))

(assert (=> b!939051 (= res!631608 (containsKey!452 lt!423814 (_1!6691 lt!423559)))))

(declare-fun b!939052 () Bool)

(assert (=> b!939052 (= e!527432 (contains!5119 lt!423814 (tuple2!13361 (_1!6691 lt!423559) (_2!6691 lt!423559))))))

(assert (= (and d!113789 res!631607) b!939051))

(assert (= (and b!939051 res!631608) b!939052))

(assert (=> d!113789 m!874197))

(declare-fun m!874497 () Bool)

(assert (=> d!113789 m!874497))

(declare-fun m!874499 () Bool)

(assert (=> d!113789 m!874499))

(declare-fun m!874501 () Bool)

(assert (=> b!939051 m!874501))

(declare-fun m!874503 () Bool)

(assert (=> b!939052 m!874503))

(assert (=> d!113689 d!113789))

(declare-fun b!939073 () Bool)

(declare-fun res!631614 () Bool)

(declare-fun e!527447 () Bool)

(assert (=> b!939073 (=> (not res!631614) (not e!527447))))

(declare-fun lt!423921 () List!19140)

(assert (=> b!939073 (= res!631614 (containsKey!452 lt!423921 (_1!6691 lt!423559)))))

(declare-fun bm!40854 () Bool)

(declare-fun call!40858 () List!19140)

(declare-fun call!40857 () List!19140)

(assert (=> bm!40854 (= call!40858 call!40857)))

(declare-fun b!939074 () Bool)

(declare-fun e!527446 () List!19140)

(assert (=> b!939074 (= e!527446 call!40858)))

(declare-fun b!939075 () Bool)

(assert (=> b!939075 (= e!527447 (contains!5119 lt!423921 (tuple2!13361 (_1!6691 lt!423559) (_2!6691 lt!423559))))))

(declare-fun c!98022 () Bool)

(declare-fun bm!40855 () Bool)

(declare-fun e!527444 () List!19140)

(declare-fun $colon$colon!551 (List!19140 tuple2!13360) List!19140)

(assert (=> bm!40855 (= call!40857 ($colon$colon!551 e!527444 (ite c!98022 (h!20288 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (tuple2!13361 (_1!6691 lt!423559) (_2!6691 lt!423559)))))))

(declare-fun c!98020 () Bool)

(assert (=> bm!40855 (= c!98020 c!98022)))

(declare-fun b!939076 () Bool)

(declare-fun e!527443 () List!19140)

(assert (=> b!939076 (= e!527443 e!527446)))

(declare-fun c!98021 () Bool)

(assert (=> b!939076 (= c!98021 (and ((_ is Cons!19136) (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (= (_1!6691 (h!20288 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) (_1!6691 lt!423559))))))

(declare-fun d!113791 () Bool)

(assert (=> d!113791 e!527447))

(declare-fun res!631613 () Bool)

(assert (=> d!113791 (=> (not res!631613) (not e!527447))))

(assert (=> d!113791 (= res!631613 (isStrictlySorted!491 lt!423921))))

(assert (=> d!113791 (= lt!423921 e!527443)))

(assert (=> d!113791 (= c!98022 (and ((_ is Cons!19136) (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (bvslt (_1!6691 (h!20288 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) (_1!6691 lt!423559))))))

(assert (=> d!113791 (isStrictlySorted!491 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))))

(assert (=> d!113791 (= (insertStrictlySorted!317 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6691 lt!423559) (_2!6691 lt!423559)) lt!423921)))

(declare-fun b!939077 () Bool)

(assert (=> b!939077 (= e!527444 (insertStrictlySorted!317 (t!27425 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (_1!6691 lt!423559) (_2!6691 lt!423559)))))

(declare-fun bm!40856 () Bool)

(declare-fun call!40859 () List!19140)

(assert (=> bm!40856 (= call!40859 call!40858)))

(declare-fun c!98019 () Bool)

(declare-fun b!939078 () Bool)

(assert (=> b!939078 (= c!98019 (and ((_ is Cons!19136) (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (bvsgt (_1!6691 (h!20288 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) (_1!6691 lt!423559))))))

(declare-fun e!527445 () List!19140)

(assert (=> b!939078 (= e!527446 e!527445)))

(declare-fun b!939079 () Bool)

(assert (=> b!939079 (= e!527445 call!40859)))

(declare-fun b!939080 () Bool)

(assert (=> b!939080 (= e!527443 call!40857)))

(declare-fun b!939081 () Bool)

(assert (=> b!939081 (= e!527444 (ite c!98021 (t!27425 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (ite c!98019 (Cons!19136 (h!20288 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (t!27425 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) Nil!19137)))))

(declare-fun b!939082 () Bool)

(assert (=> b!939082 (= e!527445 call!40859)))

(assert (= (and d!113791 c!98022) b!939080))

(assert (= (and d!113791 (not c!98022)) b!939076))

(assert (= (and b!939076 c!98021) b!939074))

(assert (= (and b!939076 (not c!98021)) b!939078))

(assert (= (and b!939078 c!98019) b!939082))

(assert (= (and b!939078 (not c!98019)) b!939079))

(assert (= (or b!939082 b!939079) bm!40856))

(assert (= (or b!939074 bm!40856) bm!40854))

(assert (= (or b!939080 bm!40854) bm!40855))

(assert (= (and bm!40855 c!98020) b!939077))

(assert (= (and bm!40855 (not c!98020)) b!939081))

(assert (= (and d!113791 res!631613) b!939073))

(assert (= (and b!939073 res!631614) b!939075))

(declare-fun m!874505 () Bool)

(assert (=> b!939073 m!874505))

(declare-fun m!874507 () Bool)

(assert (=> b!939077 m!874507))

(declare-fun m!874509 () Bool)

(assert (=> d!113791 m!874509))

(declare-fun m!874511 () Bool)

(assert (=> d!113791 m!874511))

(declare-fun m!874513 () Bool)

(assert (=> bm!40855 m!874513))

(declare-fun m!874515 () Bool)

(assert (=> b!939075 m!874515))

(assert (=> d!113689 d!113791))

(declare-fun d!113793 () Bool)

(assert (=> d!113793 (= (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2853 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13361 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14353 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!113793 true))

(declare-fun _$20!31 () Unit!31648)

(assert (=> d!113793 (= (choose!1560 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) _$20!31)))

(declare-fun b_lambda!14201 () Bool)

(assert (=> (not b_lambda!14201) (not d!113793)))

(assert (=> d!113793 t!27424))

(declare-fun b_and!29127 () Bool)

(assert (= b_and!29125 (and (=> t!27424 result!12111) b_and!29127)))

(assert (=> d!113793 m!873793))

(assert (=> d!113793 m!873795))

(assert (=> d!113793 m!873801))

(assert (=> d!113793 m!873793))

(assert (=> d!113793 m!873803))

(assert (=> d!113793 m!874177))

(assert (=> d!113793 m!874179))

(assert (=> d!113793 m!873841))

(assert (=> d!113793 m!874177))

(assert (=> d!113793 m!873795))

(assert (=> d!113677 d!113793))

(assert (=> d!113677 d!113653))

(declare-fun d!113795 () Bool)

(declare-fun e!527449 () Bool)

(assert (=> d!113795 e!527449))

(declare-fun res!631615 () Bool)

(assert (=> d!113795 (=> res!631615 e!527449)))

(declare-fun lt!423924 () Bool)

(assert (=> d!113795 (= res!631615 (not lt!423924))))

(declare-fun lt!423923 () Bool)

(assert (=> d!113795 (= lt!423924 lt!423923)))

(declare-fun lt!423925 () Unit!31648)

(declare-fun e!527448 () Unit!31648)

(assert (=> d!113795 (= lt!423925 e!527448)))

(declare-fun c!98023 () Bool)

(assert (=> d!113795 (= c!98023 lt!423923)))

(assert (=> d!113795 (= lt!423923 (containsKey!452 (toList!6045 lt!423750) (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> d!113795 (= (contains!5115 lt!423750 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) lt!423924)))

(declare-fun b!939083 () Bool)

(declare-fun lt!423922 () Unit!31648)

(assert (=> b!939083 (= e!527448 lt!423922)))

(assert (=> b!939083 (= lt!423922 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6045 lt!423750) (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!939083 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423750) (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!939084 () Bool)

(declare-fun Unit!31673 () Unit!31648)

(assert (=> b!939084 (= e!527448 Unit!31673)))

(declare-fun b!939085 () Bool)

(assert (=> b!939085 (= e!527449 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423750) (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (= (and d!113795 c!98023) b!939083))

(assert (= (and d!113795 (not c!98023)) b!939084))

(assert (= (and d!113795 (not res!631615)) b!939085))

(assert (=> d!113795 m!873841))

(declare-fun m!874517 () Bool)

(assert (=> d!113795 m!874517))

(assert (=> b!939083 m!873841))

(declare-fun m!874519 () Bool)

(assert (=> b!939083 m!874519))

(assert (=> b!939083 m!873841))

(assert (=> b!939083 m!874439))

(assert (=> b!939083 m!874439))

(declare-fun m!874521 () Bool)

(assert (=> b!939083 m!874521))

(assert (=> b!939085 m!873841))

(assert (=> b!939085 m!874439))

(assert (=> b!939085 m!874439))

(assert (=> b!939085 m!874521))

(assert (=> b!938832 d!113795))

(declare-fun d!113797 () Bool)

(assert (=> d!113797 (= (get!14358 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938897 d!113797))

(declare-fun d!113799 () Bool)

(assert (=> d!113799 (isDefined!354 (getValueByKey!481 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099))))

(declare-fun lt!423928 () Unit!31648)

(declare-fun choose!1564 (List!19140 (_ BitVec 64)) Unit!31648)

(assert (=> d!113799 (= lt!423928 (choose!1564 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099))))

(declare-fun e!527452 () Bool)

(assert (=> d!113799 e!527452))

(declare-fun res!631618 () Bool)

(assert (=> d!113799 (=> (not res!631618) (not e!527452))))

(assert (=> d!113799 (= res!631618 (isStrictlySorted!491 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))))

(assert (=> d!113799 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099) lt!423928)))

(declare-fun b!939088 () Bool)

(assert (=> b!939088 (= e!527452 (containsKey!452 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099))))

(assert (= (and d!113799 res!631618) b!939088))

(assert (=> d!113799 m!874051))

(assert (=> d!113799 m!874051))

(assert (=> d!113799 m!874053))

(declare-fun m!874523 () Bool)

(assert (=> d!113799 m!874523))

(declare-fun m!874525 () Bool)

(assert (=> d!113799 m!874525))

(assert (=> b!939088 m!874047))

(assert (=> b!938817 d!113799))

(assert (=> b!938817 d!113775))

(assert (=> b!938817 d!113777))

(declare-fun d!113801 () Bool)

(declare-fun e!527453 () Bool)

(assert (=> d!113801 e!527453))

(declare-fun res!631620 () Bool)

(assert (=> d!113801 (=> (not res!631620) (not e!527453))))

(declare-fun lt!423929 () ListLongMap!12059)

(assert (=> d!113801 (= res!631620 (contains!5115 lt!423929 (_1!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun lt!423932 () List!19140)

(assert (=> d!113801 (= lt!423929 (ListLongMap!12060 lt!423932))))

(declare-fun lt!423930 () Unit!31648)

(declare-fun lt!423931 () Unit!31648)

(assert (=> d!113801 (= lt!423930 lt!423931)))

(assert (=> d!113801 (= (getValueByKey!481 lt!423932 (_1!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!486 (_2!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113801 (= lt!423931 (lemmaContainsTupThenGetReturnValue!260 lt!423932 (_1!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113801 (= lt!423932 (insertStrictlySorted!317 (toList!6045 call!40821) (_1!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113801 (= (+!2853 call!40821 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) lt!423929)))

(declare-fun b!939089 () Bool)

(declare-fun res!631619 () Bool)

(assert (=> b!939089 (=> (not res!631619) (not e!527453))))

(assert (=> b!939089 (= res!631619 (= (getValueByKey!481 (toList!6045 lt!423929) (_1!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!486 (_2!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun b!939090 () Bool)

(assert (=> b!939090 (= e!527453 (contains!5119 (toList!6045 lt!423929) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(assert (= (and d!113801 res!631620) b!939089))

(assert (= (and b!939089 res!631619) b!939090))

(declare-fun m!874527 () Bool)

(assert (=> d!113801 m!874527))

(declare-fun m!874529 () Bool)

(assert (=> d!113801 m!874529))

(declare-fun m!874531 () Bool)

(assert (=> d!113801 m!874531))

(declare-fun m!874533 () Bool)

(assert (=> d!113801 m!874533))

(declare-fun m!874535 () Bool)

(assert (=> b!939089 m!874535))

(declare-fun m!874537 () Bool)

(assert (=> b!939090 m!874537))

(assert (=> b!938772 d!113801))

(declare-fun d!113803 () Bool)

(assert (=> d!113803 (= (validKeyInArray!0 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (and (not (= (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938852 d!113803))

(assert (=> b!938829 d!113759))

(declare-fun d!113805 () Bool)

(assert (=> d!113805 (= (validKeyInArray!0 (select (arr!27187 _keys!1487) #b00000000000000000000000000000000)) (and (not (= (select (arr!27187 _keys!1487) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27187 _keys!1487) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938804 d!113805))

(assert (=> b!938802 d!113805))

(declare-fun d!113807 () Bool)

(assert (=> d!113807 (= (apply!862 lt!423715 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14356 (getValueByKey!481 (toList!6045 lt!423715) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26333 () Bool)

(assert (= bs!26333 d!113807))

(assert (=> bs!26333 m!874273))

(assert (=> bs!26333 m!874273))

(declare-fun m!874539 () Bool)

(assert (=> bs!26333 m!874539))

(assert (=> b!938787 d!113807))

(declare-fun d!113809 () Bool)

(assert (=> d!113809 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423565) k0!1099))))

(declare-fun lt!423933 () Unit!31648)

(assert (=> d!113809 (= lt!423933 (choose!1564 (toList!6045 lt!423565) k0!1099))))

(declare-fun e!527454 () Bool)

(assert (=> d!113809 e!527454))

(declare-fun res!631621 () Bool)

(assert (=> d!113809 (=> (not res!631621) (not e!527454))))

(assert (=> d!113809 (= res!631621 (isStrictlySorted!491 (toList!6045 lt!423565)))))

(assert (=> d!113809 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6045 lt!423565) k0!1099) lt!423933)))

(declare-fun b!939091 () Bool)

(assert (=> b!939091 (= e!527454 (containsKey!452 (toList!6045 lt!423565) k0!1099))))

(assert (= (and d!113809 res!631621) b!939091))

(assert (=> d!113809 m!874165))

(assert (=> d!113809 m!874165))

(assert (=> d!113809 m!874167))

(declare-fun m!874541 () Bool)

(assert (=> d!113809 m!874541))

(declare-fun m!874543 () Bool)

(assert (=> d!113809 m!874543))

(assert (=> b!939091 m!874161))

(assert (=> b!938862 d!113809))

(declare-fun d!113811 () Bool)

(assert (=> d!113811 (= (isDefined!354 (getValueByKey!481 (toList!6045 lt!423565) k0!1099)) (not (isEmpty!703 (getValueByKey!481 (toList!6045 lt!423565) k0!1099))))))

(declare-fun bs!26334 () Bool)

(assert (= bs!26334 d!113811))

(assert (=> bs!26334 m!874165))

(declare-fun m!874545 () Bool)

(assert (=> bs!26334 m!874545))

(assert (=> b!938862 d!113811))

(assert (=> b!938862 d!113703))

(declare-fun b!939092 () Bool)

(declare-fun e!527458 () Bool)

(declare-fun call!40860 () Bool)

(assert (=> b!939092 (= e!527458 call!40860)))

(declare-fun b!939093 () Bool)

(declare-fun e!527455 () Bool)

(assert (=> b!939093 (= e!527455 (contains!5118 (ite c!97947 (Cons!19137 (select (arr!27187 _keys!1487) #b00000000000000000000000000000000) Nil!19138) Nil!19138) (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!40857 () Bool)

(declare-fun c!98024 () Bool)

(assert (=> bm!40857 (= call!40860 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!98024 (Cons!19137 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!97947 (Cons!19137 (select (arr!27187 _keys!1487) #b00000000000000000000000000000000) Nil!19138) Nil!19138)) (ite c!97947 (Cons!19137 (select (arr!27187 _keys!1487) #b00000000000000000000000000000000) Nil!19138) Nil!19138))))))

(declare-fun b!939094 () Bool)

(declare-fun e!527457 () Bool)

(assert (=> b!939094 (= e!527457 e!527458)))

(assert (=> b!939094 (= c!98024 (validKeyInArray!0 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!939095 () Bool)

(assert (=> b!939095 (= e!527458 call!40860)))

(declare-fun d!113813 () Bool)

(declare-fun res!631623 () Bool)

(declare-fun e!527456 () Bool)

(assert (=> d!113813 (=> res!631623 e!527456)))

(assert (=> d!113813 (= res!631623 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27647 _keys!1487)))))

(assert (=> d!113813 (= (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97947 (Cons!19137 (select (arr!27187 _keys!1487) #b00000000000000000000000000000000) Nil!19138) Nil!19138)) e!527456)))

(declare-fun b!939096 () Bool)

(assert (=> b!939096 (= e!527456 e!527457)))

(declare-fun res!631622 () Bool)

(assert (=> b!939096 (=> (not res!631622) (not e!527457))))

(assert (=> b!939096 (= res!631622 (not e!527455))))

(declare-fun res!631624 () Bool)

(assert (=> b!939096 (=> (not res!631624) (not e!527455))))

(assert (=> b!939096 (= res!631624 (validKeyInArray!0 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!113813 (not res!631623)) b!939096))

(assert (= (and b!939096 res!631624) b!939093))

(assert (= (and b!939096 res!631622) b!939094))

(assert (= (and b!939094 c!98024) b!939092))

(assert (= (and b!939094 (not c!98024)) b!939095))

(assert (= (or b!939092 b!939095) bm!40857))

(assert (=> b!939093 m!874285))

(assert (=> b!939093 m!874285))

(declare-fun m!874547 () Bool)

(assert (=> b!939093 m!874547))

(assert (=> bm!40857 m!874285))

(declare-fun m!874549 () Bool)

(assert (=> bm!40857 m!874549))

(assert (=> b!939094 m!874285))

(assert (=> b!939094 m!874285))

(assert (=> b!939094 m!874287))

(assert (=> b!939096 m!874285))

(assert (=> b!939096 m!874285))

(assert (=> b!939096 m!874287))

(assert (=> bm!40824 d!113813))

(declare-fun d!113815 () Bool)

(assert (=> d!113815 (= (apply!862 lt!423715 (select (arr!27187 _keys!1487) from!1844)) (get!14356 (getValueByKey!481 (toList!6045 lt!423715) (select (arr!27187 _keys!1487) from!1844))))))

(declare-fun bs!26335 () Bool)

(assert (= bs!26335 d!113815))

(assert (=> bs!26335 m!873977))

(assert (=> bs!26335 m!874423))

(assert (=> bs!26335 m!874423))

(declare-fun m!874551 () Bool)

(assert (=> bs!26335 m!874551))

(assert (=> b!938785 d!113815))

(declare-fun d!113817 () Bool)

(declare-fun c!98025 () Bool)

(assert (=> d!113817 (= c!98025 ((_ is ValueCellFull!9647) (select (arr!27188 _values!1231) from!1844)))))

(declare-fun e!527459 () V!31975)

(assert (=> d!113817 (= (get!14353 (select (arr!27188 _values!1231) from!1844) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!527459)))

(declare-fun b!939097 () Bool)

(assert (=> b!939097 (= e!527459 (get!14357 (select (arr!27188 _values!1231) from!1844) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!939098 () Bool)

(assert (=> b!939098 (= e!527459 (get!14358 (select (arr!27188 _values!1231) from!1844) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113817 c!98025) b!939097))

(assert (= (and d!113817 (not c!98025)) b!939098))

(assert (=> b!939097 m!874023))

(assert (=> b!939097 m!873795))

(declare-fun m!874553 () Bool)

(assert (=> b!939097 m!874553))

(assert (=> b!939098 m!874023))

(assert (=> b!939098 m!873795))

(declare-fun m!874555 () Bool)

(assert (=> b!939098 m!874555))

(assert (=> b!938785 d!113817))

(declare-fun d!113819 () Bool)

(declare-fun lt!423936 () Bool)

(declare-fun content!409 (List!19140) (InoxSet tuple2!13360))

(assert (=> d!113819 (= lt!423936 (select (content!409 (toList!6045 lt!423815)) lt!423559))))

(declare-fun e!527465 () Bool)

(assert (=> d!113819 (= lt!423936 e!527465)))

(declare-fun res!631630 () Bool)

(assert (=> d!113819 (=> (not res!631630) (not e!527465))))

(assert (=> d!113819 (= res!631630 ((_ is Cons!19136) (toList!6045 lt!423815)))))

(assert (=> d!113819 (= (contains!5119 (toList!6045 lt!423815) lt!423559) lt!423936)))

(declare-fun b!939103 () Bool)

(declare-fun e!527464 () Bool)

(assert (=> b!939103 (= e!527465 e!527464)))

(declare-fun res!631629 () Bool)

(assert (=> b!939103 (=> res!631629 e!527464)))

(assert (=> b!939103 (= res!631629 (= (h!20288 (toList!6045 lt!423815)) lt!423559))))

(declare-fun b!939104 () Bool)

(assert (=> b!939104 (= e!527464 (contains!5119 (t!27425 (toList!6045 lt!423815)) lt!423559))))

(assert (= (and d!113819 res!631630) b!939103))

(assert (= (and b!939103 (not res!631629)) b!939104))

(declare-fun m!874557 () Bool)

(assert (=> d!113819 m!874557))

(declare-fun m!874559 () Bool)

(assert (=> d!113819 m!874559))

(declare-fun m!874561 () Bool)

(assert (=> b!939104 m!874561))

(assert (=> b!938891 d!113819))

(assert (=> b!938850 d!113803))

(declare-fun d!113821 () Bool)

(declare-fun lt!423937 () Bool)

(assert (=> d!113821 (= lt!423937 (select (content!409 (toList!6045 lt!423811)) lt!423559))))

(declare-fun e!527467 () Bool)

(assert (=> d!113821 (= lt!423937 e!527467)))

(declare-fun res!631632 () Bool)

(assert (=> d!113821 (=> (not res!631632) (not e!527467))))

(assert (=> d!113821 (= res!631632 ((_ is Cons!19136) (toList!6045 lt!423811)))))

(assert (=> d!113821 (= (contains!5119 (toList!6045 lt!423811) lt!423559) lt!423937)))

(declare-fun b!939105 () Bool)

(declare-fun e!527466 () Bool)

(assert (=> b!939105 (= e!527467 e!527466)))

(declare-fun res!631631 () Bool)

(assert (=> b!939105 (=> res!631631 e!527466)))

(assert (=> b!939105 (= res!631631 (= (h!20288 (toList!6045 lt!423811)) lt!423559))))

(declare-fun b!939106 () Bool)

(assert (=> b!939106 (= e!527466 (contains!5119 (t!27425 (toList!6045 lt!423811)) lt!423559))))

(assert (= (and d!113821 res!631632) b!939105))

(assert (= (and b!939105 (not res!631631)) b!939106))

(declare-fun m!874563 () Bool)

(assert (=> d!113821 m!874563))

(declare-fun m!874565 () Bool)

(assert (=> d!113821 m!874565))

(declare-fun m!874567 () Bool)

(assert (=> b!939106 m!874567))

(assert (=> b!938889 d!113821))

(declare-fun d!113823 () Bool)

(declare-fun res!631633 () Bool)

(declare-fun e!527468 () Bool)

(assert (=> d!113823 (=> res!631633 e!527468)))

(assert (=> d!113823 (= res!631633 (and ((_ is Cons!19136) (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))) (= (_1!6691 (h!20288 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))) k0!1099)))))

(assert (=> d!113823 (= (containsKey!452 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099) e!527468)))

(declare-fun b!939107 () Bool)

(declare-fun e!527469 () Bool)

(assert (=> b!939107 (= e!527468 e!527469)))

(declare-fun res!631634 () Bool)

(assert (=> b!939107 (=> (not res!631634) (not e!527469))))

(assert (=> b!939107 (= res!631634 (and (or (not ((_ is Cons!19136) (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))) (bvsle (_1!6691 (h!20288 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))) k0!1099)) ((_ is Cons!19136) (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))) (bvslt (_1!6691 (h!20288 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))) k0!1099)))))

(declare-fun b!939108 () Bool)

(assert (=> b!939108 (= e!527469 (containsKey!452 (t!27425 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))) k0!1099))))

(assert (= (and d!113823 (not res!631633)) b!939107))

(assert (= (and b!939107 res!631634) b!939108))

(declare-fun m!874569 () Bool)

(assert (=> b!939108 m!874569))

(assert (=> d!113665 d!113823))

(declare-fun d!113825 () Bool)

(assert (=> d!113825 (arrayContainsKey!0 _keys!1487 lt!423733 #b00000000000000000000000000000000)))

(declare-fun lt!423940 () Unit!31648)

(declare-fun choose!13 (array!56503 (_ BitVec 64) (_ BitVec 32)) Unit!31648)

(assert (=> d!113825 (= lt!423940 (choose!13 _keys!1487 lt!423733 #b00000000000000000000000000000000))))

(assert (=> d!113825 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!113825 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!423733 #b00000000000000000000000000000000) lt!423940)))

(declare-fun bs!26336 () Bool)

(assert (= bs!26336 d!113825))

(assert (=> bs!26336 m!874041))

(declare-fun m!874571 () Bool)

(assert (=> bs!26336 m!874571))

(assert (=> b!938814 d!113825))

(declare-fun d!113827 () Bool)

(declare-fun res!631635 () Bool)

(declare-fun e!527470 () Bool)

(assert (=> d!113827 (=> res!631635 e!527470)))

(assert (=> d!113827 (= res!631635 (= (select (arr!27187 _keys!1487) #b00000000000000000000000000000000) lt!423733))))

(assert (=> d!113827 (= (arrayContainsKey!0 _keys!1487 lt!423733 #b00000000000000000000000000000000) e!527470)))

(declare-fun b!939109 () Bool)

(declare-fun e!527471 () Bool)

(assert (=> b!939109 (= e!527470 e!527471)))

(declare-fun res!631636 () Bool)

(assert (=> b!939109 (=> (not res!631636) (not e!527471))))

(assert (=> b!939109 (= res!631636 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27647 _keys!1487)))))

(declare-fun b!939110 () Bool)

(assert (=> b!939110 (= e!527471 (arrayContainsKey!0 _keys!1487 lt!423733 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!113827 (not res!631635)) b!939109))

(assert (= (and b!939109 res!631636) b!939110))

(assert (=> d!113827 m!874029))

(declare-fun m!874573 () Bool)

(assert (=> b!939110 m!874573))

(assert (=> b!938814 d!113827))

(declare-fun b!939123 () Bool)

(declare-fun e!527479 () SeekEntryResult!8935)

(declare-fun e!527478 () SeekEntryResult!8935)

(assert (=> b!939123 (= e!527479 e!527478)))

(declare-fun lt!423948 () (_ BitVec 64))

(declare-fun lt!423947 () SeekEntryResult!8935)

(assert (=> b!939123 (= lt!423948 (select (arr!27187 _keys!1487) (index!38113 lt!423947)))))

(declare-fun c!98032 () Bool)

(assert (=> b!939123 (= c!98032 (= lt!423948 (select (arr!27187 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!939124 () Bool)

(assert (=> b!939124 (= e!527478 (Found!8935 (index!38113 lt!423947)))))

(declare-fun d!113829 () Bool)

(declare-fun lt!423949 () SeekEntryResult!8935)

(assert (=> d!113829 (and (or ((_ is Undefined!8935) lt!423949) (not ((_ is Found!8935) lt!423949)) (and (bvsge (index!38112 lt!423949) #b00000000000000000000000000000000) (bvslt (index!38112 lt!423949) (size!27647 _keys!1487)))) (or ((_ is Undefined!8935) lt!423949) ((_ is Found!8935) lt!423949) (not ((_ is MissingZero!8935) lt!423949)) (and (bvsge (index!38111 lt!423949) #b00000000000000000000000000000000) (bvslt (index!38111 lt!423949) (size!27647 _keys!1487)))) (or ((_ is Undefined!8935) lt!423949) ((_ is Found!8935) lt!423949) ((_ is MissingZero!8935) lt!423949) (not ((_ is MissingVacant!8935) lt!423949)) (and (bvsge (index!38114 lt!423949) #b00000000000000000000000000000000) (bvslt (index!38114 lt!423949) (size!27647 _keys!1487)))) (or ((_ is Undefined!8935) lt!423949) (ite ((_ is Found!8935) lt!423949) (= (select (arr!27187 _keys!1487) (index!38112 lt!423949)) (select (arr!27187 _keys!1487) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8935) lt!423949) (= (select (arr!27187 _keys!1487) (index!38111 lt!423949)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8935) lt!423949) (= (select (arr!27187 _keys!1487) (index!38114 lt!423949)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!113829 (= lt!423949 e!527479)))

(declare-fun c!98033 () Bool)

(assert (=> d!113829 (= c!98033 (and ((_ is Intermediate!8935) lt!423947) (undefined!9747 lt!423947)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56503 (_ BitVec 32)) SeekEntryResult!8935)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!113829 (= lt!423947 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!27187 _keys!1487) #b00000000000000000000000000000000) mask!1881) (select (arr!27187 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881))))

(assert (=> d!113829 (validMask!0 mask!1881)))

(assert (=> d!113829 (= (seekEntryOrOpen!0 (select (arr!27187 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) lt!423949)))

(declare-fun b!939125 () Bool)

(declare-fun c!98034 () Bool)

(assert (=> b!939125 (= c!98034 (= lt!423948 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!527480 () SeekEntryResult!8935)

(assert (=> b!939125 (= e!527478 e!527480)))

(declare-fun b!939126 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56503 (_ BitVec 32)) SeekEntryResult!8935)

(assert (=> b!939126 (= e!527480 (seekKeyOrZeroReturnVacant!0 (x!80400 lt!423947) (index!38113 lt!423947) (index!38113 lt!423947) (select (arr!27187 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881))))

(declare-fun b!939127 () Bool)

(assert (=> b!939127 (= e!527479 Undefined!8935)))

(declare-fun b!939128 () Bool)

(assert (=> b!939128 (= e!527480 (MissingZero!8935 (index!38113 lt!423947)))))

(assert (= (and d!113829 c!98033) b!939127))

(assert (= (and d!113829 (not c!98033)) b!939123))

(assert (= (and b!939123 c!98032) b!939124))

(assert (= (and b!939123 (not c!98032)) b!939125))

(assert (= (and b!939125 c!98034) b!939128))

(assert (= (and b!939125 (not c!98034)) b!939126))

(declare-fun m!874575 () Bool)

(assert (=> b!939123 m!874575))

(assert (=> d!113829 m!874029))

(declare-fun m!874577 () Bool)

(assert (=> d!113829 m!874577))

(assert (=> d!113829 m!873827))

(declare-fun m!874579 () Bool)

(assert (=> d!113829 m!874579))

(declare-fun m!874581 () Bool)

(assert (=> d!113829 m!874581))

(assert (=> d!113829 m!874577))

(assert (=> d!113829 m!874029))

(declare-fun m!874583 () Bool)

(assert (=> d!113829 m!874583))

(declare-fun m!874585 () Bool)

(assert (=> d!113829 m!874585))

(assert (=> b!939126 m!874029))

(declare-fun m!874587 () Bool)

(assert (=> b!939126 m!874587))

(assert (=> b!938814 d!113829))

(declare-fun d!113831 () Bool)

(declare-fun e!527481 () Bool)

(assert (=> d!113831 e!527481))

(declare-fun res!631638 () Bool)

(assert (=> d!113831 (=> (not res!631638) (not e!527481))))

(declare-fun lt!423950 () ListLongMap!12059)

(assert (=> d!113831 (= res!631638 (contains!5115 lt!423950 (_1!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun lt!423953 () List!19140)

(assert (=> d!113831 (= lt!423950 (ListLongMap!12060 lt!423953))))

(declare-fun lt!423951 () Unit!31648)

(declare-fun lt!423952 () Unit!31648)

(assert (=> d!113831 (= lt!423951 lt!423952)))

(assert (=> d!113831 (= (getValueByKey!481 lt!423953 (_1!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!486 (_2!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113831 (= lt!423952 (lemmaContainsTupThenGetReturnValue!260 lt!423953 (_1!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113831 (= lt!423953 (insertStrictlySorted!317 (toList!6045 call!40834) (_1!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113831 (= (+!2853 call!40834 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) lt!423950)))

(declare-fun b!939129 () Bool)

(declare-fun res!631637 () Bool)

(assert (=> b!939129 (=> (not res!631637) (not e!527481))))

(assert (=> b!939129 (= res!631637 (= (getValueByKey!481 (toList!6045 lt!423950) (_1!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!486 (_2!6691 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun b!939130 () Bool)

(assert (=> b!939130 (= e!527481 (contains!5119 (toList!6045 lt!423950) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(assert (= (and d!113831 res!631638) b!939129))

(assert (= (and b!939129 res!631637) b!939130))

(declare-fun m!874589 () Bool)

(assert (=> d!113831 m!874589))

(declare-fun m!874591 () Bool)

(assert (=> d!113831 m!874591))

(declare-fun m!874593 () Bool)

(assert (=> d!113831 m!874593))

(declare-fun m!874595 () Bool)

(assert (=> d!113831 m!874595))

(declare-fun m!874597 () Bool)

(assert (=> b!939129 m!874597))

(declare-fun m!874599 () Bool)

(assert (=> b!939130 m!874599))

(assert (=> b!938823 d!113831))

(assert (=> d!113667 d!113653))

(declare-fun d!113833 () Bool)

(declare-fun e!527482 () Bool)

(assert (=> d!113833 e!527482))

(declare-fun res!631640 () Bool)

(assert (=> d!113833 (=> (not res!631640) (not e!527482))))

(declare-fun lt!423954 () ListLongMap!12059)

(assert (=> d!113833 (= res!631640 (contains!5115 lt!423954 (_1!6691 (ite (or c!97961 c!97958) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun lt!423957 () List!19140)

(assert (=> d!113833 (= lt!423954 (ListLongMap!12060 lt!423957))))

(declare-fun lt!423955 () Unit!31648)

(declare-fun lt!423956 () Unit!31648)

(assert (=> d!113833 (= lt!423955 lt!423956)))

(assert (=> d!113833 (= (getValueByKey!481 lt!423957 (_1!6691 (ite (or c!97961 c!97958) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!486 (_2!6691 (ite (or c!97961 c!97958) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113833 (= lt!423956 (lemmaContainsTupThenGetReturnValue!260 lt!423957 (_1!6691 (ite (or c!97961 c!97958) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6691 (ite (or c!97961 c!97958) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113833 (= lt!423957 (insertStrictlySorted!317 (toList!6045 (ite c!97961 call!40842 (ite c!97958 call!40840 call!40839))) (_1!6691 (ite (or c!97961 c!97958) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6691 (ite (or c!97961 c!97958) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113833 (= (+!2853 (ite c!97961 call!40842 (ite c!97958 call!40840 call!40839)) (ite (or c!97961 c!97958) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) lt!423954)))

(declare-fun b!939131 () Bool)

(declare-fun res!631639 () Bool)

(assert (=> b!939131 (=> (not res!631639) (not e!527482))))

(assert (=> b!939131 (= res!631639 (= (getValueByKey!481 (toList!6045 lt!423954) (_1!6691 (ite (or c!97961 c!97958) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!486 (_2!6691 (ite (or c!97961 c!97958) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))))

(declare-fun b!939132 () Bool)

(assert (=> b!939132 (= e!527482 (contains!5119 (toList!6045 lt!423954) (ite (or c!97961 c!97958) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (= (and d!113833 res!631640) b!939131))

(assert (= (and b!939131 res!631639) b!939132))

(declare-fun m!874601 () Bool)

(assert (=> d!113833 m!874601))

(declare-fun m!874603 () Bool)

(assert (=> d!113833 m!874603))

(declare-fun m!874605 () Bool)

(assert (=> d!113833 m!874605))

(declare-fun m!874607 () Bool)

(assert (=> d!113833 m!874607))

(declare-fun m!874609 () Bool)

(assert (=> b!939131 m!874609))

(declare-fun m!874611 () Bool)

(assert (=> b!939132 m!874611))

(assert (=> bm!40837 d!113833))

(assert (=> b!938813 d!113805))

(declare-fun d!113835 () Bool)

(assert (=> d!113835 (= (apply!862 lt!423772 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14356 (getValueByKey!481 (toList!6045 lt!423772) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26337 () Bool)

(assert (= bs!26337 d!113835))

(declare-fun m!874613 () Bool)

(assert (=> bs!26337 m!874613))

(assert (=> bs!26337 m!874613))

(declare-fun m!874615 () Bool)

(assert (=> bs!26337 m!874615))

(assert (=> b!938861 d!113835))

(declare-fun d!113837 () Bool)

(assert (=> d!113837 (= (apply!862 lt!423750 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14356 (getValueByKey!481 (toList!6045 lt!423750) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26338 () Bool)

(assert (= bs!26338 d!113837))

(assert (=> bs!26338 m!874469))

(assert (=> bs!26338 m!874469))

(declare-fun m!874617 () Bool)

(assert (=> bs!26338 m!874617))

(assert (=> b!938838 d!113837))

(assert (=> d!113695 d!113679))

(declare-fun d!113839 () Bool)

(assert (=> d!113839 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19138)))

(assert (=> d!113839 true))

(declare-fun _$71!180 () Unit!31648)

(assert (=> d!113839 (= (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) _$71!180)))

(declare-fun bs!26339 () Bool)

(assert (= bs!26339 d!113839))

(assert (=> bs!26339 m!873809))

(assert (=> d!113695 d!113839))

(assert (=> d!113685 d!113649))

(declare-fun d!113841 () Bool)

(assert (=> d!113841 (= (apply!862 (+!2853 lt!423561 (tuple2!13361 lt!423563 lt!423562)) k0!1099) (apply!862 lt!423561 k0!1099))))

(assert (=> d!113841 true))

(declare-fun _$34!1158 () Unit!31648)

(assert (=> d!113841 (= (choose!1562 lt!423561 lt!423563 lt!423562 k0!1099) _$34!1158)))

(declare-fun bs!26340 () Bool)

(assert (= bs!26340 d!113841))

(assert (=> bs!26340 m!874169))

(assert (=> bs!26340 m!874169))

(assert (=> bs!26340 m!874191))

(assert (=> bs!26340 m!873835))

(assert (=> d!113685 d!113841))

(assert (=> d!113685 d!113767))

(assert (=> d!113685 d!113663))

(declare-fun d!113843 () Bool)

(assert (=> d!113843 (= (apply!862 (+!2853 lt!423561 (tuple2!13361 lt!423563 lt!423562)) k0!1099) (get!14356 (getValueByKey!481 (toList!6045 (+!2853 lt!423561 (tuple2!13361 lt!423563 lt!423562))) k0!1099)))))

(declare-fun bs!26341 () Bool)

(assert (= bs!26341 d!113843))

(assert (=> bs!26341 m!874447))

(assert (=> bs!26341 m!874447))

(declare-fun m!874619 () Bool)

(assert (=> bs!26341 m!874619))

(assert (=> d!113685 d!113843))

(declare-fun d!113845 () Bool)

(assert (=> d!113845 (= (validKeyInArray!0 (select (arr!27187 _keys!1487) from!1844)) (and (not (= (select (arr!27187 _keys!1487) from!1844) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27187 _keys!1487) from!1844) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938780 d!113845))

(declare-fun b!939134 () Bool)

(declare-fun lt!423962 () Unit!31648)

(declare-fun lt!423961 () Unit!31648)

(assert (=> b!939134 (= lt!423962 lt!423961)))

(declare-fun lt!423960 () (_ BitVec 64))

(declare-fun lt!423964 () ListLongMap!12059)

(declare-fun lt!423963 () (_ BitVec 64))

(declare-fun lt!423958 () V!31975)

(assert (=> b!939134 (not (contains!5115 (+!2853 lt!423964 (tuple2!13361 lt!423963 lt!423958)) lt!423960))))

(assert (=> b!939134 (= lt!423961 (addStillNotContains!222 lt!423964 lt!423963 lt!423958 lt!423960))))

(assert (=> b!939134 (= lt!423960 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!939134 (= lt!423958 (get!14353 (select (arr!27188 _values!1231) from!1844) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!939134 (= lt!423963 (select (arr!27187 _keys!1487) from!1844))))

(declare-fun call!40861 () ListLongMap!12059)

(assert (=> b!939134 (= lt!423964 call!40861)))

(declare-fun e!527488 () ListLongMap!12059)

(assert (=> b!939134 (= e!527488 (+!2853 call!40861 (tuple2!13361 (select (arr!27187 _keys!1487) from!1844) (get!14353 (select (arr!27188 _values!1231) from!1844) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!939135 () Bool)

(declare-fun lt!423959 () ListLongMap!12059)

(declare-fun e!527484 () Bool)

(assert (=> b!939135 (= e!527484 (= lt!423959 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))))

(declare-fun b!939136 () Bool)

(assert (=> b!939136 (= e!527488 call!40861)))

(declare-fun b!939137 () Bool)

(declare-fun res!631641 () Bool)

(declare-fun e!527483 () Bool)

(assert (=> b!939137 (=> (not res!631641) (not e!527483))))

(assert (=> b!939137 (= res!631641 (not (contains!5115 lt!423959 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!939138 () Bool)

(declare-fun e!527487 () ListLongMap!12059)

(assert (=> b!939138 (= e!527487 e!527488)))

(declare-fun c!98038 () Bool)

(assert (=> b!939138 (= c!98038 (validKeyInArray!0 (select (arr!27187 _keys!1487) from!1844)))))

(declare-fun b!939139 () Bool)

(declare-fun e!527486 () Bool)

(assert (=> b!939139 (= e!527486 (validKeyInArray!0 (select (arr!27187 _keys!1487) from!1844)))))

(assert (=> b!939139 (bvsge from!1844 #b00000000000000000000000000000000)))

(declare-fun bm!40858 () Bool)

(assert (=> bm!40858 (= call!40861 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun d!113847 () Bool)

(assert (=> d!113847 e!527483))

(declare-fun res!631644 () Bool)

(assert (=> d!113847 (=> (not res!631644) (not e!527483))))

(assert (=> d!113847 (= res!631644 (not (contains!5115 lt!423959 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!113847 (= lt!423959 e!527487)))

(declare-fun c!98035 () Bool)

(assert (=> d!113847 (= c!98035 (bvsge from!1844 (size!27647 _keys!1487)))))

(assert (=> d!113847 (validMask!0 mask!1881)))

(assert (=> d!113847 (= (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!423959)))

(declare-fun b!939140 () Bool)

(declare-fun e!527489 () Bool)

(declare-fun e!527485 () Bool)

(assert (=> b!939140 (= e!527489 e!527485)))

(assert (=> b!939140 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27647 _keys!1487)))))

(declare-fun res!631642 () Bool)

(assert (=> b!939140 (= res!631642 (contains!5115 lt!423959 (select (arr!27187 _keys!1487) from!1844)))))

(assert (=> b!939140 (=> (not res!631642) (not e!527485))))

(declare-fun b!939141 () Bool)

(assert (=> b!939141 (= e!527487 (ListLongMap!12060 Nil!19137))))

(declare-fun b!939142 () Bool)

(assert (=> b!939142 (= e!527483 e!527489)))

(declare-fun c!98036 () Bool)

(assert (=> b!939142 (= c!98036 e!527486)))

(declare-fun res!631643 () Bool)

(assert (=> b!939142 (=> (not res!631643) (not e!527486))))

(assert (=> b!939142 (= res!631643 (bvslt from!1844 (size!27647 _keys!1487)))))

(declare-fun b!939143 () Bool)

(assert (=> b!939143 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27647 _keys!1487)))))

(assert (=> b!939143 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27648 _values!1231)))))

(assert (=> b!939143 (= e!527485 (= (apply!862 lt!423959 (select (arr!27187 _keys!1487) from!1844)) (get!14353 (select (arr!27188 _values!1231) from!1844) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!939144 () Bool)

(assert (=> b!939144 (= e!527484 (isEmpty!702 lt!423959))))

(declare-fun b!939145 () Bool)

(assert (=> b!939145 (= e!527489 e!527484)))

(declare-fun c!98037 () Bool)

(assert (=> b!939145 (= c!98037 (bvslt from!1844 (size!27647 _keys!1487)))))

(assert (= (and d!113847 c!98035) b!939141))

(assert (= (and d!113847 (not c!98035)) b!939138))

(assert (= (and b!939138 c!98038) b!939134))

(assert (= (and b!939138 (not c!98038)) b!939136))

(assert (= (or b!939134 b!939136) bm!40858))

(assert (= (and d!113847 res!631644) b!939137))

(assert (= (and b!939137 res!631641) b!939142))

(assert (= (and b!939142 res!631643) b!939139))

(assert (= (and b!939142 c!98036) b!939140))

(assert (= (and b!939142 (not c!98036)) b!939145))

(assert (= (and b!939140 res!631642) b!939143))

(assert (= (and b!939145 c!98037) b!939135))

(assert (= (and b!939145 (not c!98037)) b!939144))

(declare-fun b_lambda!14203 () Bool)

(assert (=> (not b_lambda!14203) (not b!939134)))

(assert (=> b!939134 t!27424))

(declare-fun b_and!29129 () Bool)

(assert (= b_and!29127 (and (=> t!27424 result!12111) b_and!29129)))

(declare-fun b_lambda!14205 () Bool)

(assert (=> (not b_lambda!14205) (not b!939143)))

(assert (=> b!939143 t!27424))

(declare-fun b_and!29131 () Bool)

(assert (= b_and!29129 (and (=> t!27424 result!12111) b_and!29131)))

(declare-fun m!874621 () Bool)

(assert (=> bm!40858 m!874621))

(declare-fun m!874623 () Bool)

(assert (=> b!939144 m!874623))

(assert (=> b!939138 m!873977))

(assert (=> b!939138 m!873977))

(assert (=> b!939138 m!873989))

(declare-fun m!874625 () Bool)

(assert (=> d!113847 m!874625))

(assert (=> d!113847 m!873827))

(assert (=> b!939135 m!874621))

(assert (=> b!939140 m!873977))

(assert (=> b!939140 m!873977))

(declare-fun m!874627 () Bool)

(assert (=> b!939140 m!874627))

(assert (=> b!939139 m!873977))

(assert (=> b!939139 m!873977))

(assert (=> b!939139 m!873989))

(declare-fun m!874629 () Bool)

(assert (=> b!939134 m!874629))

(declare-fun m!874631 () Bool)

(assert (=> b!939134 m!874631))

(assert (=> b!939134 m!874629))

(declare-fun m!874633 () Bool)

(assert (=> b!939134 m!874633))

(assert (=> b!939134 m!874023))

(assert (=> b!939134 m!873795))

(assert (=> b!939134 m!874025))

(declare-fun m!874635 () Bool)

(assert (=> b!939134 m!874635))

(assert (=> b!939134 m!873977))

(assert (=> b!939134 m!873795))

(assert (=> b!939134 m!874023))

(declare-fun m!874637 () Bool)

(assert (=> b!939137 m!874637))

(assert (=> b!939143 m!874023))

(assert (=> b!939143 m!873795))

(assert (=> b!939143 m!874025))

(assert (=> b!939143 m!873977))

(declare-fun m!874639 () Bool)

(assert (=> b!939143 m!874639))

(assert (=> b!939143 m!873977))

(assert (=> b!939143 m!873795))

(assert (=> b!939143 m!874023))

(assert (=> bm!40818 d!113847))

(declare-fun b!939146 () Bool)

(declare-fun e!527493 () Bool)

(declare-fun call!40862 () Bool)

(assert (=> b!939146 (= e!527493 call!40862)))

(declare-fun e!527490 () Bool)

(declare-fun b!939147 () Bool)

(assert (=> b!939147 (= e!527490 (contains!5118 (ite c!97965 (Cons!19137 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19138) Nil!19138) (select (arr!27187 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun c!98039 () Bool)

(declare-fun bm!40859 () Bool)

(assert (=> bm!40859 (= call!40862 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!98039 (Cons!19137 (select (arr!27187 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (ite c!97965 (Cons!19137 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19138) Nil!19138)) (ite c!97965 (Cons!19137 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19138) Nil!19138))))))

(declare-fun b!939148 () Bool)

(declare-fun e!527492 () Bool)

(assert (=> b!939148 (= e!527492 e!527493)))

(assert (=> b!939148 (= c!98039 (validKeyInArray!0 (select (arr!27187 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun b!939149 () Bool)

(assert (=> b!939149 (= e!527493 call!40862)))

(declare-fun d!113849 () Bool)

(declare-fun res!631646 () Bool)

(declare-fun e!527491 () Bool)

(assert (=> d!113849 (=> res!631646 e!527491)))

(assert (=> d!113849 (= res!631646 (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27647 _keys!1487)))))

(assert (=> d!113849 (= (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97965 (Cons!19137 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19138) Nil!19138)) e!527491)))

(declare-fun b!939150 () Bool)

(assert (=> b!939150 (= e!527491 e!527492)))

(declare-fun res!631645 () Bool)

(assert (=> b!939150 (=> (not res!631645) (not e!527492))))

(assert (=> b!939150 (= res!631645 (not e!527490))))

(declare-fun res!631647 () Bool)

(assert (=> b!939150 (=> (not res!631647) (not e!527490))))

(assert (=> b!939150 (= res!631647 (validKeyInArray!0 (select (arr!27187 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(assert (= (and d!113849 (not res!631646)) b!939150))

(assert (= (and b!939150 res!631647) b!939147))

(assert (= (and b!939150 res!631645) b!939148))

(assert (= (and b!939148 c!98039) b!939146))

(assert (= (and b!939148 (not c!98039)) b!939149))

(assert (= (or b!939146 b!939149) bm!40859))

(declare-fun m!874641 () Bool)

(assert (=> b!939147 m!874641))

(assert (=> b!939147 m!874641))

(declare-fun m!874643 () Bool)

(assert (=> b!939147 m!874643))

(assert (=> bm!40859 m!874641))

(declare-fun m!874645 () Bool)

(assert (=> bm!40859 m!874645))

(assert (=> b!939148 m!874641))

(assert (=> b!939148 m!874641))

(declare-fun m!874647 () Bool)

(assert (=> b!939148 m!874647))

(assert (=> b!939150 m!874641))

(assert (=> b!939150 m!874641))

(assert (=> b!939150 m!874647))

(assert (=> bm!40842 d!113849))

(declare-fun d!113851 () Bool)

(declare-fun e!527495 () Bool)

(assert (=> d!113851 e!527495))

(declare-fun res!631648 () Bool)

(assert (=> d!113851 (=> res!631648 e!527495)))

(declare-fun lt!423967 () Bool)

(assert (=> d!113851 (= res!631648 (not lt!423967))))

(declare-fun lt!423966 () Bool)

(assert (=> d!113851 (= lt!423967 lt!423966)))

(declare-fun lt!423968 () Unit!31648)

(declare-fun e!527494 () Unit!31648)

(assert (=> d!113851 (= lt!423968 e!527494)))

(declare-fun c!98040 () Bool)

(assert (=> d!113851 (= c!98040 lt!423966)))

(assert (=> d!113851 (= lt!423966 (containsKey!452 (toList!6045 lt!423772) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113851 (= (contains!5115 lt!423772 #b1000000000000000000000000000000000000000000000000000000000000000) lt!423967)))

(declare-fun b!939151 () Bool)

(declare-fun lt!423965 () Unit!31648)

(assert (=> b!939151 (= e!527494 lt!423965)))

(assert (=> b!939151 (= lt!423965 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6045 lt!423772) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!939151 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423772) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939152 () Bool)

(declare-fun Unit!31674 () Unit!31648)

(assert (=> b!939152 (= e!527494 Unit!31674)))

(declare-fun b!939153 () Bool)

(assert (=> b!939153 (= e!527495 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423772) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113851 c!98040) b!939151))

(assert (= (and d!113851 (not c!98040)) b!939152))

(assert (= (and d!113851 (not res!631648)) b!939153))

(declare-fun m!874649 () Bool)

(assert (=> d!113851 m!874649))

(declare-fun m!874651 () Bool)

(assert (=> b!939151 m!874651))

(assert (=> b!939151 m!874613))

(assert (=> b!939151 m!874613))

(declare-fun m!874653 () Bool)

(assert (=> b!939151 m!874653))

(assert (=> b!939153 m!874613))

(assert (=> b!939153 m!874613))

(assert (=> b!939153 m!874653))

(assert (=> bm!40841 d!113851))

(declare-fun d!113853 () Bool)

(declare-fun res!631649 () Bool)

(declare-fun e!527496 () Bool)

(assert (=> d!113853 (=> res!631649 e!527496)))

(assert (=> d!113853 (= res!631649 (and ((_ is Cons!19136) (toList!6045 lt!423561)) (= (_1!6691 (h!20288 (toList!6045 lt!423561))) k0!1099)))))

(assert (=> d!113853 (= (containsKey!452 (toList!6045 lt!423561) k0!1099) e!527496)))

(declare-fun b!939154 () Bool)

(declare-fun e!527497 () Bool)

(assert (=> b!939154 (= e!527496 e!527497)))

(declare-fun res!631650 () Bool)

(assert (=> b!939154 (=> (not res!631650) (not e!527497))))

(assert (=> b!939154 (= res!631650 (and (or (not ((_ is Cons!19136) (toList!6045 lt!423561))) (bvsle (_1!6691 (h!20288 (toList!6045 lt!423561))) k0!1099)) ((_ is Cons!19136) (toList!6045 lt!423561)) (bvslt (_1!6691 (h!20288 (toList!6045 lt!423561))) k0!1099)))))

(declare-fun b!939155 () Bool)

(assert (=> b!939155 (= e!527497 (containsKey!452 (t!27425 (toList!6045 lt!423561)) k0!1099))))

(assert (= (and d!113853 (not res!631649)) b!939154))

(assert (= (and b!939154 res!631650) b!939155))

(declare-fun m!874655 () Bool)

(assert (=> b!939155 m!874655))

(assert (=> d!113649 d!113853))

(declare-fun d!113855 () Bool)

(declare-fun e!527498 () Bool)

(assert (=> d!113855 e!527498))

(declare-fun res!631652 () Bool)

(assert (=> d!113855 (=> (not res!631652) (not e!527498))))

(declare-fun lt!423969 () ListLongMap!12059)

(assert (=> d!113855 (= res!631652 (contains!5115 lt!423969 (_1!6691 (tuple2!13361 lt!423770 minValue!1173))))))

(declare-fun lt!423972 () List!19140)

(assert (=> d!113855 (= lt!423969 (ListLongMap!12060 lt!423972))))

(declare-fun lt!423970 () Unit!31648)

(declare-fun lt!423971 () Unit!31648)

(assert (=> d!113855 (= lt!423970 lt!423971)))

(assert (=> d!113855 (= (getValueByKey!481 lt!423972 (_1!6691 (tuple2!13361 lt!423770 minValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423770 minValue!1173))))))

(assert (=> d!113855 (= lt!423971 (lemmaContainsTupThenGetReturnValue!260 lt!423972 (_1!6691 (tuple2!13361 lt!423770 minValue!1173)) (_2!6691 (tuple2!13361 lt!423770 minValue!1173))))))

(assert (=> d!113855 (= lt!423972 (insertStrictlySorted!317 (toList!6045 lt!423768) (_1!6691 (tuple2!13361 lt!423770 minValue!1173)) (_2!6691 (tuple2!13361 lt!423770 minValue!1173))))))

(assert (=> d!113855 (= (+!2853 lt!423768 (tuple2!13361 lt!423770 minValue!1173)) lt!423969)))

(declare-fun b!939156 () Bool)

(declare-fun res!631651 () Bool)

(assert (=> b!939156 (=> (not res!631651) (not e!527498))))

(assert (=> b!939156 (= res!631651 (= (getValueByKey!481 (toList!6045 lt!423969) (_1!6691 (tuple2!13361 lt!423770 minValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423770 minValue!1173)))))))

(declare-fun b!939157 () Bool)

(assert (=> b!939157 (= e!527498 (contains!5119 (toList!6045 lt!423969) (tuple2!13361 lt!423770 minValue!1173)))))

(assert (= (and d!113855 res!631652) b!939156))

(assert (= (and b!939156 res!631651) b!939157))

(declare-fun m!874657 () Bool)

(assert (=> d!113855 m!874657))

(declare-fun m!874659 () Bool)

(assert (=> d!113855 m!874659))

(declare-fun m!874661 () Bool)

(assert (=> d!113855 m!874661))

(declare-fun m!874663 () Bool)

(assert (=> d!113855 m!874663))

(declare-fun m!874665 () Bool)

(assert (=> b!939156 m!874665))

(declare-fun m!874667 () Bool)

(assert (=> b!939157 m!874667))

(assert (=> b!938843 d!113855))

(declare-fun d!113857 () Bool)

(assert (=> d!113857 (= (apply!862 (+!2853 lt!423768 (tuple2!13361 lt!423770 minValue!1173)) lt!423763) (apply!862 lt!423768 lt!423763))))

(declare-fun lt!423973 () Unit!31648)

(assert (=> d!113857 (= lt!423973 (choose!1562 lt!423768 lt!423770 minValue!1173 lt!423763))))

(declare-fun e!527499 () Bool)

(assert (=> d!113857 e!527499))

(declare-fun res!631653 () Bool)

(assert (=> d!113857 (=> (not res!631653) (not e!527499))))

(assert (=> d!113857 (= res!631653 (contains!5115 lt!423768 lt!423763))))

(assert (=> d!113857 (= (addApplyDifferent!437 lt!423768 lt!423770 minValue!1173 lt!423763) lt!423973)))

(declare-fun b!939158 () Bool)

(assert (=> b!939158 (= e!527499 (not (= lt!423763 lt!423770)))))

(assert (= (and d!113857 res!631653) b!939158))

(assert (=> d!113857 m!874131))

(declare-fun m!874669 () Bool)

(assert (=> d!113857 m!874669))

(assert (=> d!113857 m!874135))

(declare-fun m!874671 () Bool)

(assert (=> d!113857 m!874671))

(assert (=> d!113857 m!874131))

(assert (=> d!113857 m!874133))

(assert (=> b!938843 d!113857))

(declare-fun d!113859 () Bool)

(declare-fun e!527500 () Bool)

(assert (=> d!113859 e!527500))

(declare-fun res!631655 () Bool)

(assert (=> d!113859 (=> (not res!631655) (not e!527500))))

(declare-fun lt!423974 () ListLongMap!12059)

(assert (=> d!113859 (= res!631655 (contains!5115 lt!423974 (_1!6691 (tuple2!13361 lt!423767 zeroValue!1173))))))

(declare-fun lt!423977 () List!19140)

(assert (=> d!113859 (= lt!423974 (ListLongMap!12060 lt!423977))))

(declare-fun lt!423975 () Unit!31648)

(declare-fun lt!423976 () Unit!31648)

(assert (=> d!113859 (= lt!423975 lt!423976)))

(assert (=> d!113859 (= (getValueByKey!481 lt!423977 (_1!6691 (tuple2!13361 lt!423767 zeroValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423767 zeroValue!1173))))))

(assert (=> d!113859 (= lt!423976 (lemmaContainsTupThenGetReturnValue!260 lt!423977 (_1!6691 (tuple2!13361 lt!423767 zeroValue!1173)) (_2!6691 (tuple2!13361 lt!423767 zeroValue!1173))))))

(assert (=> d!113859 (= lt!423977 (insertStrictlySorted!317 (toList!6045 lt!423778) (_1!6691 (tuple2!13361 lt!423767 zeroValue!1173)) (_2!6691 (tuple2!13361 lt!423767 zeroValue!1173))))))

(assert (=> d!113859 (= (+!2853 lt!423778 (tuple2!13361 lt!423767 zeroValue!1173)) lt!423974)))

(declare-fun b!939159 () Bool)

(declare-fun res!631654 () Bool)

(assert (=> b!939159 (=> (not res!631654) (not e!527500))))

(assert (=> b!939159 (= res!631654 (= (getValueByKey!481 (toList!6045 lt!423974) (_1!6691 (tuple2!13361 lt!423767 zeroValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423767 zeroValue!1173)))))))

(declare-fun b!939160 () Bool)

(assert (=> b!939160 (= e!527500 (contains!5119 (toList!6045 lt!423974) (tuple2!13361 lt!423767 zeroValue!1173)))))

(assert (= (and d!113859 res!631655) b!939159))

(assert (= (and b!939159 res!631654) b!939160))

(declare-fun m!874673 () Bool)

(assert (=> d!113859 m!874673))

(declare-fun m!874675 () Bool)

(assert (=> d!113859 m!874675))

(declare-fun m!874677 () Bool)

(assert (=> d!113859 m!874677))

(declare-fun m!874679 () Bool)

(assert (=> d!113859 m!874679))

(declare-fun m!874681 () Bool)

(assert (=> b!939159 m!874681))

(declare-fun m!874683 () Bool)

(assert (=> b!939160 m!874683))

(assert (=> b!938843 d!113859))

(declare-fun d!113861 () Bool)

(assert (=> d!113861 (= (apply!862 lt!423777 lt!423775) (get!14356 (getValueByKey!481 (toList!6045 lt!423777) lt!423775)))))

(declare-fun bs!26342 () Bool)

(assert (= bs!26342 d!113861))

(declare-fun m!874685 () Bool)

(assert (=> bs!26342 m!874685))

(assert (=> bs!26342 m!874685))

(declare-fun m!874687 () Bool)

(assert (=> bs!26342 m!874687))

(assert (=> b!938843 d!113861))

(declare-fun d!113863 () Bool)

(assert (=> d!113863 (= (apply!862 (+!2853 lt!423768 (tuple2!13361 lt!423770 minValue!1173)) lt!423763) (get!14356 (getValueByKey!481 (toList!6045 (+!2853 lt!423768 (tuple2!13361 lt!423770 minValue!1173))) lt!423763)))))

(declare-fun bs!26343 () Bool)

(assert (= bs!26343 d!113863))

(declare-fun m!874689 () Bool)

(assert (=> bs!26343 m!874689))

(assert (=> bs!26343 m!874689))

(declare-fun m!874691 () Bool)

(assert (=> bs!26343 m!874691))

(assert (=> b!938843 d!113863))

(declare-fun d!113865 () Bool)

(assert (=> d!113865 (= (apply!862 (+!2853 lt!423777 (tuple2!13361 lt!423766 zeroValue!1173)) lt!423775) (apply!862 lt!423777 lt!423775))))

(declare-fun lt!423978 () Unit!31648)

(assert (=> d!113865 (= lt!423978 (choose!1562 lt!423777 lt!423766 zeroValue!1173 lt!423775))))

(declare-fun e!527501 () Bool)

(assert (=> d!113865 e!527501))

(declare-fun res!631656 () Bool)

(assert (=> d!113865 (=> (not res!631656) (not e!527501))))

(assert (=> d!113865 (= res!631656 (contains!5115 lt!423777 lt!423775))))

(assert (=> d!113865 (= (addApplyDifferent!437 lt!423777 lt!423766 zeroValue!1173 lt!423775) lt!423978)))

(declare-fun b!939161 () Bool)

(assert (=> b!939161 (= e!527501 (not (= lt!423775 lt!423766)))))

(assert (= (and d!113865 res!631656) b!939161))

(assert (=> d!113865 m!874127))

(declare-fun m!874693 () Bool)

(assert (=> d!113865 m!874693))

(assert (=> d!113865 m!874143))

(declare-fun m!874695 () Bool)

(assert (=> d!113865 m!874695))

(assert (=> d!113865 m!874127))

(assert (=> d!113865 m!874129))

(assert (=> b!938843 d!113865))

(declare-fun d!113867 () Bool)

(assert (=> d!113867 (= (apply!862 lt!423768 lt!423763) (get!14356 (getValueByKey!481 (toList!6045 lt!423768) lt!423763)))))

(declare-fun bs!26344 () Bool)

(assert (= bs!26344 d!113867))

(declare-fun m!874697 () Bool)

(assert (=> bs!26344 m!874697))

(assert (=> bs!26344 m!874697))

(declare-fun m!874699 () Bool)

(assert (=> bs!26344 m!874699))

(assert (=> b!938843 d!113867))

(declare-fun d!113869 () Bool)

(declare-fun e!527502 () Bool)

(assert (=> d!113869 e!527502))

(declare-fun res!631658 () Bool)

(assert (=> d!113869 (=> (not res!631658) (not e!527502))))

(declare-fun lt!423979 () ListLongMap!12059)

(assert (=> d!113869 (= res!631658 (contains!5115 lt!423979 (_1!6691 (tuple2!13361 lt!423771 minValue!1173))))))

(declare-fun lt!423982 () List!19140)

(assert (=> d!113869 (= lt!423979 (ListLongMap!12060 lt!423982))))

(declare-fun lt!423980 () Unit!31648)

(declare-fun lt!423981 () Unit!31648)

(assert (=> d!113869 (= lt!423980 lt!423981)))

(assert (=> d!113869 (= (getValueByKey!481 lt!423982 (_1!6691 (tuple2!13361 lt!423771 minValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423771 minValue!1173))))))

(assert (=> d!113869 (= lt!423981 (lemmaContainsTupThenGetReturnValue!260 lt!423982 (_1!6691 (tuple2!13361 lt!423771 minValue!1173)) (_2!6691 (tuple2!13361 lt!423771 minValue!1173))))))

(assert (=> d!113869 (= lt!423982 (insertStrictlySorted!317 (toList!6045 lt!423783) (_1!6691 (tuple2!13361 lt!423771 minValue!1173)) (_2!6691 (tuple2!13361 lt!423771 minValue!1173))))))

(assert (=> d!113869 (= (+!2853 lt!423783 (tuple2!13361 lt!423771 minValue!1173)) lt!423979)))

(declare-fun b!939162 () Bool)

(declare-fun res!631657 () Bool)

(assert (=> b!939162 (=> (not res!631657) (not e!527502))))

(assert (=> b!939162 (= res!631657 (= (getValueByKey!481 (toList!6045 lt!423979) (_1!6691 (tuple2!13361 lt!423771 minValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423771 minValue!1173)))))))

(declare-fun b!939163 () Bool)

(assert (=> b!939163 (= e!527502 (contains!5119 (toList!6045 lt!423979) (tuple2!13361 lt!423771 minValue!1173)))))

(assert (= (and d!113869 res!631658) b!939162))

(assert (= (and b!939162 res!631657) b!939163))

(declare-fun m!874701 () Bool)

(assert (=> d!113869 m!874701))

(declare-fun m!874703 () Bool)

(assert (=> d!113869 m!874703))

(declare-fun m!874705 () Bool)

(assert (=> d!113869 m!874705))

(declare-fun m!874707 () Bool)

(assert (=> d!113869 m!874707))

(declare-fun m!874709 () Bool)

(assert (=> b!939162 m!874709))

(declare-fun m!874711 () Bool)

(assert (=> b!939163 m!874711))

(assert (=> b!938843 d!113869))

(declare-fun d!113871 () Bool)

(assert (=> d!113871 (= (apply!862 (+!2853 lt!423783 (tuple2!13361 lt!423771 minValue!1173)) lt!423764) (apply!862 lt!423783 lt!423764))))

(declare-fun lt!423983 () Unit!31648)

(assert (=> d!113871 (= lt!423983 (choose!1562 lt!423783 lt!423771 minValue!1173 lt!423764))))

(declare-fun e!527503 () Bool)

(assert (=> d!113871 e!527503))

(declare-fun res!631659 () Bool)

(assert (=> d!113871 (=> (not res!631659) (not e!527503))))

(assert (=> d!113871 (= res!631659 (contains!5115 lt!423783 lt!423764))))

(assert (=> d!113871 (= (addApplyDifferent!437 lt!423783 lt!423771 minValue!1173 lt!423764) lt!423983)))

(declare-fun b!939164 () Bool)

(assert (=> b!939164 (= e!527503 (not (= lt!423764 lt!423771)))))

(assert (= (and d!113871 res!631659) b!939164))

(assert (=> d!113871 m!874137))

(declare-fun m!874713 () Bool)

(assert (=> d!113871 m!874713))

(assert (=> d!113871 m!874149))

(declare-fun m!874715 () Bool)

(assert (=> d!113871 m!874715))

(assert (=> d!113871 m!874137))

(assert (=> d!113871 m!874139))

(assert (=> b!938843 d!113871))

(declare-fun d!113873 () Bool)

(declare-fun e!527504 () Bool)

(assert (=> d!113873 e!527504))

(declare-fun res!631661 () Bool)

(assert (=> d!113873 (=> (not res!631661) (not e!527504))))

(declare-fun lt!423984 () ListLongMap!12059)

(assert (=> d!113873 (= res!631661 (contains!5115 lt!423984 (_1!6691 (tuple2!13361 lt!423766 zeroValue!1173))))))

(declare-fun lt!423987 () List!19140)

(assert (=> d!113873 (= lt!423984 (ListLongMap!12060 lt!423987))))

(declare-fun lt!423985 () Unit!31648)

(declare-fun lt!423986 () Unit!31648)

(assert (=> d!113873 (= lt!423985 lt!423986)))

(assert (=> d!113873 (= (getValueByKey!481 lt!423987 (_1!6691 (tuple2!13361 lt!423766 zeroValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423766 zeroValue!1173))))))

(assert (=> d!113873 (= lt!423986 (lemmaContainsTupThenGetReturnValue!260 lt!423987 (_1!6691 (tuple2!13361 lt!423766 zeroValue!1173)) (_2!6691 (tuple2!13361 lt!423766 zeroValue!1173))))))

(assert (=> d!113873 (= lt!423987 (insertStrictlySorted!317 (toList!6045 lt!423777) (_1!6691 (tuple2!13361 lt!423766 zeroValue!1173)) (_2!6691 (tuple2!13361 lt!423766 zeroValue!1173))))))

(assert (=> d!113873 (= (+!2853 lt!423777 (tuple2!13361 lt!423766 zeroValue!1173)) lt!423984)))

(declare-fun b!939165 () Bool)

(declare-fun res!631660 () Bool)

(assert (=> b!939165 (=> (not res!631660) (not e!527504))))

(assert (=> b!939165 (= res!631660 (= (getValueByKey!481 (toList!6045 lt!423984) (_1!6691 (tuple2!13361 lt!423766 zeroValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423766 zeroValue!1173)))))))

(declare-fun b!939166 () Bool)

(assert (=> b!939166 (= e!527504 (contains!5119 (toList!6045 lt!423984) (tuple2!13361 lt!423766 zeroValue!1173)))))

(assert (= (and d!113873 res!631661) b!939165))

(assert (= (and b!939165 res!631660) b!939166))

(declare-fun m!874717 () Bool)

(assert (=> d!113873 m!874717))

(declare-fun m!874719 () Bool)

(assert (=> d!113873 m!874719))

(declare-fun m!874721 () Bool)

(assert (=> d!113873 m!874721))

(declare-fun m!874723 () Bool)

(assert (=> d!113873 m!874723))

(declare-fun m!874725 () Bool)

(assert (=> b!939165 m!874725))

(declare-fun m!874727 () Bool)

(assert (=> b!939166 m!874727))

(assert (=> b!938843 d!113873))

(declare-fun d!113875 () Bool)

(assert (=> d!113875 (= (apply!862 (+!2853 lt!423777 (tuple2!13361 lt!423766 zeroValue!1173)) lt!423775) (get!14356 (getValueByKey!481 (toList!6045 (+!2853 lt!423777 (tuple2!13361 lt!423766 zeroValue!1173))) lt!423775)))))

(declare-fun bs!26345 () Bool)

(assert (= bs!26345 d!113875))

(declare-fun m!874729 () Bool)

(assert (=> bs!26345 m!874729))

(assert (=> bs!26345 m!874729))

(declare-fun m!874731 () Bool)

(assert (=> bs!26345 m!874731))

(assert (=> b!938843 d!113875))

(declare-fun d!113877 () Bool)

(assert (=> d!113877 (contains!5115 (+!2853 lt!423778 (tuple2!13361 lt!423767 zeroValue!1173)) lt!423765)))

(declare-fun lt!423988 () Unit!31648)

(assert (=> d!113877 (= lt!423988 (choose!1559 lt!423778 lt!423767 zeroValue!1173 lt!423765))))

(assert (=> d!113877 (contains!5115 lt!423778 lt!423765)))

(assert (=> d!113877 (= (addStillContains!556 lt!423778 lt!423767 zeroValue!1173 lt!423765) lt!423988)))

(declare-fun bs!26346 () Bool)

(assert (= bs!26346 d!113877))

(assert (=> bs!26346 m!874145))

(assert (=> bs!26346 m!874145))

(assert (=> bs!26346 m!874147))

(declare-fun m!874733 () Bool)

(assert (=> bs!26346 m!874733))

(declare-fun m!874735 () Bool)

(assert (=> bs!26346 m!874735))

(assert (=> b!938843 d!113877))

(declare-fun d!113879 () Bool)

(assert (=> d!113879 (= (apply!862 (+!2853 lt!423783 (tuple2!13361 lt!423771 minValue!1173)) lt!423764) (get!14356 (getValueByKey!481 (toList!6045 (+!2853 lt!423783 (tuple2!13361 lt!423771 minValue!1173))) lt!423764)))))

(declare-fun bs!26347 () Bool)

(assert (= bs!26347 d!113879))

(declare-fun m!874737 () Bool)

(assert (=> bs!26347 m!874737))

(assert (=> bs!26347 m!874737))

(declare-fun m!874739 () Bool)

(assert (=> bs!26347 m!874739))

(assert (=> b!938843 d!113879))

(declare-fun d!113881 () Bool)

(declare-fun e!527506 () Bool)

(assert (=> d!113881 e!527506))

(declare-fun res!631662 () Bool)

(assert (=> d!113881 (=> res!631662 e!527506)))

(declare-fun lt!423991 () Bool)

(assert (=> d!113881 (= res!631662 (not lt!423991))))

(declare-fun lt!423990 () Bool)

(assert (=> d!113881 (= lt!423991 lt!423990)))

(declare-fun lt!423992 () Unit!31648)

(declare-fun e!527505 () Unit!31648)

(assert (=> d!113881 (= lt!423992 e!527505)))

(declare-fun c!98041 () Bool)

(assert (=> d!113881 (= c!98041 lt!423990)))

(assert (=> d!113881 (= lt!423990 (containsKey!452 (toList!6045 (+!2853 lt!423778 (tuple2!13361 lt!423767 zeroValue!1173))) lt!423765))))

(assert (=> d!113881 (= (contains!5115 (+!2853 lt!423778 (tuple2!13361 lt!423767 zeroValue!1173)) lt!423765) lt!423991)))

(declare-fun b!939167 () Bool)

(declare-fun lt!423989 () Unit!31648)

(assert (=> b!939167 (= e!527505 lt!423989)))

(assert (=> b!939167 (= lt!423989 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6045 (+!2853 lt!423778 (tuple2!13361 lt!423767 zeroValue!1173))) lt!423765))))

(assert (=> b!939167 (isDefined!354 (getValueByKey!481 (toList!6045 (+!2853 lt!423778 (tuple2!13361 lt!423767 zeroValue!1173))) lt!423765))))

(declare-fun b!939168 () Bool)

(declare-fun Unit!31675 () Unit!31648)

(assert (=> b!939168 (= e!527505 Unit!31675)))

(declare-fun b!939169 () Bool)

(assert (=> b!939169 (= e!527506 (isDefined!354 (getValueByKey!481 (toList!6045 (+!2853 lt!423778 (tuple2!13361 lt!423767 zeroValue!1173))) lt!423765)))))

(assert (= (and d!113881 c!98041) b!939167))

(assert (= (and d!113881 (not c!98041)) b!939168))

(assert (= (and d!113881 (not res!631662)) b!939169))

(declare-fun m!874741 () Bool)

(assert (=> d!113881 m!874741))

(declare-fun m!874743 () Bool)

(assert (=> b!939167 m!874743))

(declare-fun m!874745 () Bool)

(assert (=> b!939167 m!874745))

(assert (=> b!939167 m!874745))

(declare-fun m!874747 () Bool)

(assert (=> b!939167 m!874747))

(assert (=> b!939169 m!874745))

(assert (=> b!939169 m!874745))

(assert (=> b!939169 m!874747))

(assert (=> b!938843 d!113881))

(declare-fun d!113883 () Bool)

(assert (=> d!113883 (= (apply!862 lt!423783 lt!423764) (get!14356 (getValueByKey!481 (toList!6045 lt!423783) lt!423764)))))

(declare-fun bs!26348 () Bool)

(assert (= bs!26348 d!113883))

(declare-fun m!874749 () Bool)

(assert (=> bs!26348 m!874749))

(assert (=> bs!26348 m!874749))

(declare-fun m!874751 () Bool)

(assert (=> bs!26348 m!874751))

(assert (=> b!938843 d!113883))

(assert (=> b!938843 d!113705))

(assert (=> b!938778 d!113845))

(declare-fun d!113885 () Bool)

(declare-fun e!527508 () Bool)

(assert (=> d!113885 e!527508))

(declare-fun res!631663 () Bool)

(assert (=> d!113885 (=> res!631663 e!527508)))

(declare-fun lt!423995 () Bool)

(assert (=> d!113885 (= res!631663 (not lt!423995))))

(declare-fun lt!423994 () Bool)

(assert (=> d!113885 (= lt!423995 lt!423994)))

(declare-fun lt!423996 () Unit!31648)

(declare-fun e!527507 () Unit!31648)

(assert (=> d!113885 (= lt!423996 e!527507)))

(declare-fun c!98042 () Bool)

(assert (=> d!113885 (= c!98042 lt!423994)))

(assert (=> d!113885 (= lt!423994 (containsKey!452 (toList!6045 lt!423815) (_1!6691 lt!423559)))))

(assert (=> d!113885 (= (contains!5115 lt!423815 (_1!6691 lt!423559)) lt!423995)))

(declare-fun b!939170 () Bool)

(declare-fun lt!423993 () Unit!31648)

(assert (=> b!939170 (= e!527507 lt!423993)))

(assert (=> b!939170 (= lt!423993 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6045 lt!423815) (_1!6691 lt!423559)))))

(assert (=> b!939170 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423815) (_1!6691 lt!423559)))))

(declare-fun b!939171 () Bool)

(declare-fun Unit!31676 () Unit!31648)

(assert (=> b!939171 (= e!527507 Unit!31676)))

(declare-fun b!939172 () Bool)

(assert (=> b!939172 (= e!527508 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423815) (_1!6691 lt!423559))))))

(assert (= (and d!113885 c!98042) b!939170))

(assert (= (and d!113885 (not c!98042)) b!939171))

(assert (= (and d!113885 (not res!631663)) b!939172))

(declare-fun m!874753 () Bool)

(assert (=> d!113885 m!874753))

(declare-fun m!874755 () Bool)

(assert (=> b!939170 m!874755))

(assert (=> b!939170 m!874215))

(assert (=> b!939170 m!874215))

(declare-fun m!874757 () Bool)

(assert (=> b!939170 m!874757))

(assert (=> b!939172 m!874215))

(assert (=> b!939172 m!874215))

(assert (=> b!939172 m!874757))

(assert (=> d!113691 d!113885))

(declare-fun d!113887 () Bool)

(declare-fun c!98043 () Bool)

(assert (=> d!113887 (= c!98043 (and ((_ is Cons!19136) lt!423818) (= (_1!6691 (h!20288 lt!423818)) (_1!6691 lt!423559))))))

(declare-fun e!527509 () Option!487)

(assert (=> d!113887 (= (getValueByKey!481 lt!423818 (_1!6691 lt!423559)) e!527509)))

(declare-fun b!939174 () Bool)

(declare-fun e!527510 () Option!487)

(assert (=> b!939174 (= e!527509 e!527510)))

(declare-fun c!98044 () Bool)

(assert (=> b!939174 (= c!98044 (and ((_ is Cons!19136) lt!423818) (not (= (_1!6691 (h!20288 lt!423818)) (_1!6691 lt!423559)))))))

(declare-fun b!939175 () Bool)

(assert (=> b!939175 (= e!527510 (getValueByKey!481 (t!27425 lt!423818) (_1!6691 lt!423559)))))

(declare-fun b!939173 () Bool)

(assert (=> b!939173 (= e!527509 (Some!486 (_2!6691 (h!20288 lt!423818))))))

(declare-fun b!939176 () Bool)

(assert (=> b!939176 (= e!527510 None!485)))

(assert (= (and d!113887 c!98043) b!939173))

(assert (= (and d!113887 (not c!98043)) b!939174))

(assert (= (and b!939174 c!98044) b!939175))

(assert (= (and b!939174 (not c!98044)) b!939176))

(declare-fun m!874759 () Bool)

(assert (=> b!939175 m!874759))

(assert (=> d!113691 d!113887))

(declare-fun d!113889 () Bool)

(assert (=> d!113889 (= (getValueByKey!481 lt!423818 (_1!6691 lt!423559)) (Some!486 (_2!6691 lt!423559)))))

(declare-fun lt!423997 () Unit!31648)

(assert (=> d!113889 (= lt!423997 (choose!1563 lt!423818 (_1!6691 lt!423559) (_2!6691 lt!423559)))))

(declare-fun e!527511 () Bool)

(assert (=> d!113889 e!527511))

(declare-fun res!631664 () Bool)

(assert (=> d!113889 (=> (not res!631664) (not e!527511))))

(assert (=> d!113889 (= res!631664 (isStrictlySorted!491 lt!423818))))

(assert (=> d!113889 (= (lemmaContainsTupThenGetReturnValue!260 lt!423818 (_1!6691 lt!423559) (_2!6691 lt!423559)) lt!423997)))

(declare-fun b!939177 () Bool)

(declare-fun res!631665 () Bool)

(assert (=> b!939177 (=> (not res!631665) (not e!527511))))

(assert (=> b!939177 (= res!631665 (containsKey!452 lt!423818 (_1!6691 lt!423559)))))

(declare-fun b!939178 () Bool)

(assert (=> b!939178 (= e!527511 (contains!5119 lt!423818 (tuple2!13361 (_1!6691 lt!423559) (_2!6691 lt!423559))))))

(assert (= (and d!113889 res!631664) b!939177))

(assert (= (and b!939177 res!631665) b!939178))

(assert (=> d!113889 m!874209))

(declare-fun m!874761 () Bool)

(assert (=> d!113889 m!874761))

(declare-fun m!874763 () Bool)

(assert (=> d!113889 m!874763))

(declare-fun m!874765 () Bool)

(assert (=> b!939177 m!874765))

(declare-fun m!874767 () Bool)

(assert (=> b!939178 m!874767))

(assert (=> d!113691 d!113889))

(declare-fun b!939179 () Bool)

(declare-fun res!631667 () Bool)

(declare-fun e!527516 () Bool)

(assert (=> b!939179 (=> (not res!631667) (not e!527516))))

(declare-fun lt!423998 () List!19140)

(assert (=> b!939179 (= res!631667 (containsKey!452 lt!423998 (_1!6691 lt!423559)))))

(declare-fun bm!40860 () Bool)

(declare-fun call!40864 () List!19140)

(declare-fun call!40863 () List!19140)

(assert (=> bm!40860 (= call!40864 call!40863)))

(declare-fun b!939180 () Bool)

(declare-fun e!527515 () List!19140)

(assert (=> b!939180 (= e!527515 call!40864)))

(declare-fun b!939181 () Bool)

(assert (=> b!939181 (= e!527516 (contains!5119 lt!423998 (tuple2!13361 (_1!6691 lt!423559) (_2!6691 lt!423559))))))

(declare-fun e!527513 () List!19140)

(declare-fun bm!40861 () Bool)

(declare-fun c!98048 () Bool)

(assert (=> bm!40861 (= call!40863 ($colon$colon!551 e!527513 (ite c!98048 (h!20288 (toList!6045 lt!423561)) (tuple2!13361 (_1!6691 lt!423559) (_2!6691 lt!423559)))))))

(declare-fun c!98046 () Bool)

(assert (=> bm!40861 (= c!98046 c!98048)))

(declare-fun b!939182 () Bool)

(declare-fun e!527512 () List!19140)

(assert (=> b!939182 (= e!527512 e!527515)))

(declare-fun c!98047 () Bool)

(assert (=> b!939182 (= c!98047 (and ((_ is Cons!19136) (toList!6045 lt!423561)) (= (_1!6691 (h!20288 (toList!6045 lt!423561))) (_1!6691 lt!423559))))))

(declare-fun d!113891 () Bool)

(assert (=> d!113891 e!527516))

(declare-fun res!631666 () Bool)

(assert (=> d!113891 (=> (not res!631666) (not e!527516))))

(assert (=> d!113891 (= res!631666 (isStrictlySorted!491 lt!423998))))

(assert (=> d!113891 (= lt!423998 e!527512)))

(assert (=> d!113891 (= c!98048 (and ((_ is Cons!19136) (toList!6045 lt!423561)) (bvslt (_1!6691 (h!20288 (toList!6045 lt!423561))) (_1!6691 lt!423559))))))

(assert (=> d!113891 (isStrictlySorted!491 (toList!6045 lt!423561))))

(assert (=> d!113891 (= (insertStrictlySorted!317 (toList!6045 lt!423561) (_1!6691 lt!423559) (_2!6691 lt!423559)) lt!423998)))

(declare-fun b!939183 () Bool)

(assert (=> b!939183 (= e!527513 (insertStrictlySorted!317 (t!27425 (toList!6045 lt!423561)) (_1!6691 lt!423559) (_2!6691 lt!423559)))))

(declare-fun bm!40862 () Bool)

(declare-fun call!40865 () List!19140)

(assert (=> bm!40862 (= call!40865 call!40864)))

(declare-fun b!939184 () Bool)

(declare-fun c!98045 () Bool)

(assert (=> b!939184 (= c!98045 (and ((_ is Cons!19136) (toList!6045 lt!423561)) (bvsgt (_1!6691 (h!20288 (toList!6045 lt!423561))) (_1!6691 lt!423559))))))

(declare-fun e!527514 () List!19140)

(assert (=> b!939184 (= e!527515 e!527514)))

(declare-fun b!939185 () Bool)

(assert (=> b!939185 (= e!527514 call!40865)))

(declare-fun b!939186 () Bool)

(assert (=> b!939186 (= e!527512 call!40863)))

(declare-fun b!939187 () Bool)

(assert (=> b!939187 (= e!527513 (ite c!98047 (t!27425 (toList!6045 lt!423561)) (ite c!98045 (Cons!19136 (h!20288 (toList!6045 lt!423561)) (t!27425 (toList!6045 lt!423561))) Nil!19137)))))

(declare-fun b!939188 () Bool)

(assert (=> b!939188 (= e!527514 call!40865)))

(assert (= (and d!113891 c!98048) b!939186))

(assert (= (and d!113891 (not c!98048)) b!939182))

(assert (= (and b!939182 c!98047) b!939180))

(assert (= (and b!939182 (not c!98047)) b!939184))

(assert (= (and b!939184 c!98045) b!939188))

(assert (= (and b!939184 (not c!98045)) b!939185))

(assert (= (or b!939188 b!939185) bm!40862))

(assert (= (or b!939180 bm!40862) bm!40860))

(assert (= (or b!939186 bm!40860) bm!40861))

(assert (= (and bm!40861 c!98046) b!939183))

(assert (= (and bm!40861 (not c!98046)) b!939187))

(assert (= (and d!113891 res!631666) b!939179))

(assert (= (and b!939179 res!631667) b!939181))

(declare-fun m!874769 () Bool)

(assert (=> b!939179 m!874769))

(declare-fun m!874771 () Bool)

(assert (=> b!939183 m!874771))

(declare-fun m!874773 () Bool)

(assert (=> d!113891 m!874773))

(declare-fun m!874775 () Bool)

(assert (=> d!113891 m!874775))

(declare-fun m!874777 () Bool)

(assert (=> bm!40861 m!874777))

(declare-fun m!874779 () Bool)

(assert (=> b!939181 m!874779))

(assert (=> d!113691 d!113891))

(declare-fun d!113893 () Bool)

(declare-fun lt!423999 () Bool)

(assert (=> d!113893 (= lt!423999 (select (content!408 Nil!19138) (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!527517 () Bool)

(assert (=> d!113893 (= lt!423999 e!527517)))

(declare-fun res!631668 () Bool)

(assert (=> d!113893 (=> (not res!631668) (not e!527517))))

(assert (=> d!113893 (= res!631668 ((_ is Cons!19137) Nil!19138))))

(assert (=> d!113893 (= (contains!5118 Nil!19138 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) lt!423999)))

(declare-fun b!939189 () Bool)

(declare-fun e!527518 () Bool)

(assert (=> b!939189 (= e!527517 e!527518)))

(declare-fun res!631669 () Bool)

(assert (=> b!939189 (=> res!631669 e!527518)))

(assert (=> b!939189 (= res!631669 (= (h!20289 Nil!19138) (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!939190 () Bool)

(assert (=> b!939190 (= e!527518 (contains!5118 (t!27426 Nil!19138) (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (= (and d!113893 res!631668) b!939189))

(assert (= (and b!939189 (not res!631669)) b!939190))

(assert (=> d!113893 m!874263))

(assert (=> d!113893 m!873841))

(declare-fun m!874781 () Bool)

(assert (=> d!113893 m!874781))

(assert (=> b!939190 m!873841))

(declare-fun m!874783 () Bool)

(assert (=> b!939190 m!874783))

(assert (=> b!938870 d!113893))

(declare-fun d!113895 () Bool)

(assert (=> d!113895 (= (apply!862 lt!423772 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14356 (getValueByKey!481 (toList!6045 lt!423772) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26349 () Bool)

(assert (= bs!26349 d!113895))

(declare-fun m!874785 () Bool)

(assert (=> bs!26349 m!874785))

(assert (=> bs!26349 m!874785))

(declare-fun m!874787 () Bool)

(assert (=> bs!26349 m!874787))

(assert (=> b!938859 d!113895))

(assert (=> b!938868 d!113667))

(declare-fun d!113897 () Bool)

(declare-fun e!527519 () Bool)

(assert (=> d!113897 e!527519))

(declare-fun res!631671 () Bool)

(assert (=> d!113897 (=> (not res!631671) (not e!527519))))

(declare-fun lt!424000 () ListLongMap!12059)

(assert (=> d!113897 (= res!631671 (contains!5115 lt!424000 (_1!6691 (tuple2!13361 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14353 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!424003 () List!19140)

(assert (=> d!113897 (= lt!424000 (ListLongMap!12060 lt!424003))))

(declare-fun lt!424001 () Unit!31648)

(declare-fun lt!424002 () Unit!31648)

(assert (=> d!113897 (= lt!424001 lt!424002)))

(assert (=> d!113897 (= (getValueByKey!481 lt!424003 (_1!6691 (tuple2!13361 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14353 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!486 (_2!6691 (tuple2!13361 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14353 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!113897 (= lt!424002 (lemmaContainsTupThenGetReturnValue!260 lt!424003 (_1!6691 (tuple2!13361 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14353 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!6691 (tuple2!13361 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14353 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!113897 (= lt!424003 (insertStrictlySorted!317 (toList!6045 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235)) (_1!6691 (tuple2!13361 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14353 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!6691 (tuple2!13361 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14353 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!113897 (= (+!2853 (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13361 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14353 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!424000)))

(declare-fun b!939191 () Bool)

(declare-fun res!631670 () Bool)

(assert (=> b!939191 (=> (not res!631670) (not e!527519))))

(assert (=> b!939191 (= res!631670 (= (getValueByKey!481 (toList!6045 lt!424000) (_1!6691 (tuple2!13361 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14353 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!486 (_2!6691 (tuple2!13361 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14353 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!939192 () Bool)

(assert (=> b!939192 (= e!527519 (contains!5119 (toList!6045 lt!424000) (tuple2!13361 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14353 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!113897 res!631671) b!939191))

(assert (= (and b!939191 res!631670) b!939192))

(declare-fun m!874789 () Bool)

(assert (=> d!113897 m!874789))

(declare-fun m!874791 () Bool)

(assert (=> d!113897 m!874791))

(declare-fun m!874793 () Bool)

(assert (=> d!113897 m!874793))

(declare-fun m!874795 () Bool)

(assert (=> d!113897 m!874795))

(declare-fun m!874797 () Bool)

(assert (=> b!939191 m!874797))

(declare-fun m!874799 () Bool)

(assert (=> b!939192 m!874799))

(assert (=> b!938868 d!113897))

(declare-fun b!939193 () Bool)

(declare-fun e!527526 () ListLongMap!12059)

(declare-fun e!527520 () ListLongMap!12059)

(assert (=> b!939193 (= e!527526 e!527520)))

(declare-fun c!98049 () Bool)

(assert (=> b!939193 (= c!98049 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40863 () Bool)

(declare-fun call!40868 () ListLongMap!12059)

(declare-fun call!40870 () ListLongMap!12059)

(assert (=> bm!40863 (= call!40868 call!40870)))

(declare-fun bm!40864 () Bool)

(declare-fun call!40872 () ListLongMap!12059)

(declare-fun call!40869 () ListLongMap!12059)

(assert (=> bm!40864 (= call!40872 call!40869)))

(declare-fun b!939194 () Bool)

(declare-fun e!527524 () Bool)

(declare-fun e!527532 () Bool)

(assert (=> b!939194 (= e!527524 e!527532)))

(declare-fun res!631680 () Bool)

(declare-fun call!40866 () Bool)

(assert (=> b!939194 (= res!631680 call!40866)))

(assert (=> b!939194 (=> (not res!631680) (not e!527532))))

(declare-fun b!939195 () Bool)

(declare-fun e!527527 () Unit!31648)

(declare-fun lt!424021 () Unit!31648)

(assert (=> b!939195 (= e!527527 lt!424021)))

(declare-fun lt!424020 () ListLongMap!12059)

(assert (=> b!939195 (= lt!424020 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!424009 () (_ BitVec 64))

(assert (=> b!939195 (= lt!424009 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424007 () (_ BitVec 64))

(assert (=> b!939195 (= lt!424007 (select (arr!27187 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!424011 () Unit!31648)

(assert (=> b!939195 (= lt!424011 (addStillContains!556 lt!424020 lt!424009 zeroValue!1173 lt!424007))))

(assert (=> b!939195 (contains!5115 (+!2853 lt!424020 (tuple2!13361 lt!424009 zeroValue!1173)) lt!424007)))

(declare-fun lt!424015 () Unit!31648)

(assert (=> b!939195 (= lt!424015 lt!424011)))

(declare-fun lt!424010 () ListLongMap!12059)

(assert (=> b!939195 (= lt!424010 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!424012 () (_ BitVec 64))

(assert (=> b!939195 (= lt!424012 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424005 () (_ BitVec 64))

(assert (=> b!939195 (= lt!424005 (select (arr!27187 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!424016 () Unit!31648)

(assert (=> b!939195 (= lt!424016 (addApplyDifferent!437 lt!424010 lt!424012 minValue!1173 lt!424005))))

(assert (=> b!939195 (= (apply!862 (+!2853 lt!424010 (tuple2!13361 lt!424012 minValue!1173)) lt!424005) (apply!862 lt!424010 lt!424005))))

(declare-fun lt!424023 () Unit!31648)

(assert (=> b!939195 (= lt!424023 lt!424016)))

(declare-fun lt!424019 () ListLongMap!12059)

(assert (=> b!939195 (= lt!424019 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!424008 () (_ BitVec 64))

(assert (=> b!939195 (= lt!424008 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424017 () (_ BitVec 64))

(assert (=> b!939195 (= lt!424017 (select (arr!27187 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!424024 () Unit!31648)

(assert (=> b!939195 (= lt!424024 (addApplyDifferent!437 lt!424019 lt!424008 zeroValue!1173 lt!424017))))

(assert (=> b!939195 (= (apply!862 (+!2853 lt!424019 (tuple2!13361 lt!424008 zeroValue!1173)) lt!424017) (apply!862 lt!424019 lt!424017))))

(declare-fun lt!424022 () Unit!31648)

(assert (=> b!939195 (= lt!424022 lt!424024)))

(declare-fun lt!424025 () ListLongMap!12059)

(assert (=> b!939195 (= lt!424025 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!424013 () (_ BitVec 64))

(assert (=> b!939195 (= lt!424013 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424006 () (_ BitVec 64))

(assert (=> b!939195 (= lt!424006 (select (arr!27187 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(assert (=> b!939195 (= lt!424021 (addApplyDifferent!437 lt!424025 lt!424013 minValue!1173 lt!424006))))

(assert (=> b!939195 (= (apply!862 (+!2853 lt!424025 (tuple2!13361 lt!424013 minValue!1173)) lt!424006) (apply!862 lt!424025 lt!424006))))

(declare-fun d!113899 () Bool)

(declare-fun e!527531 () Bool)

(assert (=> d!113899 e!527531))

(declare-fun res!631677 () Bool)

(assert (=> d!113899 (=> (not res!631677) (not e!527531))))

(assert (=> d!113899 (= res!631677 (or (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27647 _keys!1487)) (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27647 _keys!1487)))))))

(declare-fun lt!424014 () ListLongMap!12059)

(declare-fun lt!424018 () ListLongMap!12059)

(assert (=> d!113899 (= lt!424014 lt!424018)))

(declare-fun lt!424004 () Unit!31648)

(assert (=> d!113899 (= lt!424004 e!527527)))

(declare-fun c!98051 () Bool)

(declare-fun e!527525 () Bool)

(assert (=> d!113899 (= c!98051 e!527525)))

(declare-fun res!631672 () Bool)

(assert (=> d!113899 (=> (not res!631672) (not e!527525))))

(assert (=> d!113899 (= res!631672 (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27647 _keys!1487)))))

(assert (=> d!113899 (= lt!424018 e!527526)))

(declare-fun c!98052 () Bool)

(assert (=> d!113899 (= c!98052 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113899 (validMask!0 mask!1881)))

(assert (=> d!113899 (= (getCurrentListMap!3280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) lt!424014)))

(declare-fun b!939196 () Bool)

(assert (=> b!939196 (= e!527526 (+!2853 call!40869 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!939197 () Bool)

(declare-fun c!98053 () Bool)

(assert (=> b!939197 (= c!98053 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!527529 () ListLongMap!12059)

(assert (=> b!939197 (= e!527520 e!527529)))

(declare-fun b!939198 () Bool)

(declare-fun e!527521 () Bool)

(declare-fun call!40871 () Bool)

(assert (=> b!939198 (= e!527521 (not call!40871))))

(declare-fun bm!40865 () Bool)

(declare-fun call!40867 () ListLongMap!12059)

(assert (=> bm!40865 (= call!40869 (+!2853 (ite c!98052 call!40870 (ite c!98049 call!40868 call!40867)) (ite (or c!98052 c!98049) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!939199 () Bool)

(assert (=> b!939199 (= e!527524 (not call!40866))))

(declare-fun b!939200 () Bool)

(assert (=> b!939200 (= e!527531 e!527521)))

(declare-fun c!98050 () Bool)

(assert (=> b!939200 (= c!98050 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!939201 () Bool)

(declare-fun res!631679 () Bool)

(assert (=> b!939201 (=> (not res!631679) (not e!527531))))

(declare-fun e!527530 () Bool)

(assert (=> b!939201 (= res!631679 e!527530)))

(declare-fun res!631678 () Bool)

(assert (=> b!939201 (=> res!631678 e!527530)))

(declare-fun e!527523 () Bool)

(assert (=> b!939201 (= res!631678 (not e!527523))))

(declare-fun res!631675 () Bool)

(assert (=> b!939201 (=> (not res!631675) (not e!527523))))

(assert (=> b!939201 (= res!631675 (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27647 _keys!1487)))))

(declare-fun b!939202 () Bool)

(assert (=> b!939202 (= e!527523 (validKeyInArray!0 (select (arr!27187 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun bm!40866 () Bool)

(assert (=> bm!40866 (= call!40870 (getCurrentListMapNoExtraKeys!3347 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!939203 () Bool)

(declare-fun e!527522 () Bool)

(assert (=> b!939203 (= e!527521 e!527522)))

(declare-fun res!631673 () Bool)

(assert (=> b!939203 (= res!631673 call!40871)))

(assert (=> b!939203 (=> (not res!631673) (not e!527522))))

(declare-fun b!939204 () Bool)

(assert (=> b!939204 (= e!527525 (validKeyInArray!0 (select (arr!27187 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun b!939205 () Bool)

(declare-fun e!527528 () Bool)

(assert (=> b!939205 (= e!527530 e!527528)))

(declare-fun res!631676 () Bool)

(assert (=> b!939205 (=> (not res!631676) (not e!527528))))

(assert (=> b!939205 (= res!631676 (contains!5115 lt!424014 (select (arr!27187 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(assert (=> b!939205 (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27647 _keys!1487)))))

(declare-fun b!939206 () Bool)

(assert (=> b!939206 (= e!527520 call!40872)))

(declare-fun b!939207 () Bool)

(assert (=> b!939207 (= e!527529 call!40872)))

(declare-fun b!939208 () Bool)

(declare-fun Unit!31677 () Unit!31648)

(assert (=> b!939208 (= e!527527 Unit!31677)))

(declare-fun bm!40867 () Bool)

(assert (=> bm!40867 (= call!40866 (contains!5115 lt!424014 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939209 () Bool)

(assert (=> b!939209 (= e!527528 (= (apply!862 lt!424014 (select (arr!27187 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))) (get!14353 (select (arr!27188 _values!1231) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!939209 (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27648 _values!1231)))))

(assert (=> b!939209 (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27647 _keys!1487)))))

(declare-fun bm!40868 () Bool)

(assert (=> bm!40868 (= call!40867 call!40868)))

(declare-fun b!939210 () Bool)

(declare-fun res!631674 () Bool)

(assert (=> b!939210 (=> (not res!631674) (not e!527531))))

(assert (=> b!939210 (= res!631674 e!527524)))

(declare-fun c!98054 () Bool)

(assert (=> b!939210 (= c!98054 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!939211 () Bool)

(assert (=> b!939211 (= e!527532 (= (apply!862 lt!424014 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun bm!40869 () Bool)

(assert (=> bm!40869 (= call!40871 (contains!5115 lt!424014 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939212 () Bool)

(assert (=> b!939212 (= e!527529 call!40867)))

(declare-fun b!939213 () Bool)

(assert (=> b!939213 (= e!527522 (= (apply!862 lt!424014 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(assert (= (and d!113899 c!98052) b!939196))

(assert (= (and d!113899 (not c!98052)) b!939193))

(assert (= (and b!939193 c!98049) b!939206))

(assert (= (and b!939193 (not c!98049)) b!939197))

(assert (= (and b!939197 c!98053) b!939207))

(assert (= (and b!939197 (not c!98053)) b!939212))

(assert (= (or b!939207 b!939212) bm!40868))

(assert (= (or b!939206 bm!40868) bm!40863))

(assert (= (or b!939206 b!939207) bm!40864))

(assert (= (or b!939196 bm!40863) bm!40866))

(assert (= (or b!939196 bm!40864) bm!40865))

(assert (= (and d!113899 res!631672) b!939204))

(assert (= (and d!113899 c!98051) b!939195))

(assert (= (and d!113899 (not c!98051)) b!939208))

(assert (= (and d!113899 res!631677) b!939201))

(assert (= (and b!939201 res!631675) b!939202))

(assert (= (and b!939201 (not res!631678)) b!939205))

(assert (= (and b!939205 res!631676) b!939209))

(assert (= (and b!939201 res!631679) b!939210))

(assert (= (and b!939210 c!98054) b!939194))

(assert (= (and b!939210 (not c!98054)) b!939199))

(assert (= (and b!939194 res!631680) b!939211))

(assert (= (or b!939194 b!939199) bm!40867))

(assert (= (and b!939210 res!631674) b!939200))

(assert (= (and b!939200 c!98050) b!939203))

(assert (= (and b!939200 (not c!98050)) b!939198))

(assert (= (and b!939203 res!631673) b!939213))

(assert (= (or b!939203 b!939198) bm!40869))

(declare-fun b_lambda!14207 () Bool)

(assert (=> (not b_lambda!14207) (not b!939209)))

(assert (=> b!939209 t!27424))

(declare-fun b_and!29133 () Bool)

(assert (= b_and!29131 (and (=> t!27424 result!12111) b_and!29133)))

(declare-fun m!874801 () Bool)

(assert (=> bm!40865 m!874801))

(declare-fun m!874803 () Bool)

(assert (=> b!939211 m!874803))

(assert (=> b!939205 m!874641))

(assert (=> b!939205 m!874641))

(declare-fun m!874805 () Bool)

(assert (=> b!939205 m!874805))

(declare-fun m!874807 () Bool)

(assert (=> bm!40867 m!874807))

(declare-fun m!874809 () Bool)

(assert (=> b!939213 m!874809))

(assert (=> bm!40866 m!874303))

(declare-fun m!874811 () Bool)

(assert (=> bm!40869 m!874811))

(assert (=> b!939202 m!874641))

(assert (=> b!939202 m!874641))

(assert (=> b!939202 m!874647))

(assert (=> b!939204 m!874641))

(assert (=> b!939204 m!874641))

(assert (=> b!939204 m!874647))

(declare-fun m!874813 () Bool)

(assert (=> b!939195 m!874813))

(declare-fun m!874815 () Bool)

(assert (=> b!939195 m!874815))

(declare-fun m!874817 () Bool)

(assert (=> b!939195 m!874817))

(declare-fun m!874819 () Bool)

(assert (=> b!939195 m!874819))

(declare-fun m!874821 () Bool)

(assert (=> b!939195 m!874821))

(declare-fun m!874823 () Bool)

(assert (=> b!939195 m!874823))

(declare-fun m!874825 () Bool)

(assert (=> b!939195 m!874825))

(assert (=> b!939195 m!874303))

(declare-fun m!874827 () Bool)

(assert (=> b!939195 m!874827))

(declare-fun m!874829 () Bool)

(assert (=> b!939195 m!874829))

(declare-fun m!874831 () Bool)

(assert (=> b!939195 m!874831))

(assert (=> b!939195 m!874817))

(assert (=> b!939195 m!874827))

(declare-fun m!874833 () Bool)

(assert (=> b!939195 m!874833))

(declare-fun m!874835 () Bool)

(assert (=> b!939195 m!874835))

(assert (=> b!939195 m!874835))

(declare-fun m!874837 () Bool)

(assert (=> b!939195 m!874837))

(assert (=> b!939195 m!874821))

(declare-fun m!874839 () Bool)

(assert (=> b!939195 m!874839))

(declare-fun m!874841 () Bool)

(assert (=> b!939195 m!874841))

(assert (=> b!939195 m!874641))

(declare-fun m!874843 () Bool)

(assert (=> b!939196 m!874843))

(declare-fun m!874845 () Bool)

(assert (=> b!939209 m!874845))

(assert (=> b!939209 m!873795))

(declare-fun m!874847 () Bool)

(assert (=> b!939209 m!874847))

(assert (=> b!939209 m!874641))

(assert (=> b!939209 m!873795))

(assert (=> b!939209 m!874845))

(assert (=> b!939209 m!874641))

(declare-fun m!874849 () Bool)

(assert (=> b!939209 m!874849))

(assert (=> d!113899 m!873827))

(assert (=> b!938868 d!113899))

(assert (=> b!938868 d!113693))

(declare-fun d!113901 () Bool)

(assert (=> d!113901 (= (get!14356 (getValueByKey!481 (toList!6045 lt!423561) k0!1099)) (v!12704 (getValueByKey!481 (toList!6045 lt!423561) k0!1099)))))

(assert (=> d!113663 d!113901))

(declare-fun d!113903 () Bool)

(declare-fun c!98055 () Bool)

(assert (=> d!113903 (= c!98055 (and ((_ is Cons!19136) (toList!6045 lt!423561)) (= (_1!6691 (h!20288 (toList!6045 lt!423561))) k0!1099)))))

(declare-fun e!527533 () Option!487)

(assert (=> d!113903 (= (getValueByKey!481 (toList!6045 lt!423561) k0!1099) e!527533)))

(declare-fun b!939215 () Bool)

(declare-fun e!527534 () Option!487)

(assert (=> b!939215 (= e!527533 e!527534)))

(declare-fun c!98056 () Bool)

(assert (=> b!939215 (= c!98056 (and ((_ is Cons!19136) (toList!6045 lt!423561)) (not (= (_1!6691 (h!20288 (toList!6045 lt!423561))) k0!1099))))))

(declare-fun b!939216 () Bool)

(assert (=> b!939216 (= e!527534 (getValueByKey!481 (t!27425 (toList!6045 lt!423561)) k0!1099))))

(declare-fun b!939214 () Bool)

(assert (=> b!939214 (= e!527533 (Some!486 (_2!6691 (h!20288 (toList!6045 lt!423561)))))))

(declare-fun b!939217 () Bool)

(assert (=> b!939217 (= e!527534 None!485)))

(assert (= (and d!113903 c!98055) b!939214))

(assert (= (and d!113903 (not c!98055)) b!939215))

(assert (= (and b!939215 c!98056) b!939216))

(assert (= (and b!939215 (not c!98056)) b!939217))

(declare-fun m!874851 () Bool)

(assert (=> b!939216 m!874851))

(assert (=> d!113663 d!113903))

(assert (=> b!938878 d!113699))

(declare-fun d!113905 () Bool)

(assert (=> d!113905 (= (isDefined!354 (getValueByKey!481 (toList!6045 lt!423561) k0!1099)) (not (isEmpty!703 (getValueByKey!481 (toList!6045 lt!423561) k0!1099))))))

(declare-fun bs!26350 () Bool)

(assert (= bs!26350 d!113905))

(assert (=> bs!26350 m!873969))

(declare-fun m!874853 () Bool)

(assert (=> bs!26350 m!874853))

(assert (=> b!938726 d!113905))

(assert (=> b!938726 d!113903))

(declare-fun d!113907 () Bool)

(assert (=> d!113907 (= (get!14357 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1650 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!12701 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938896 d!113907))

(declare-fun d!113909 () Bool)

(declare-fun e!527535 () Bool)

(assert (=> d!113909 e!527535))

(declare-fun res!631682 () Bool)

(assert (=> d!113909 (=> (not res!631682) (not e!527535))))

(declare-fun lt!424026 () ListLongMap!12059)

(assert (=> d!113909 (= res!631682 (contains!5115 lt!424026 (_1!6691 (ite (or c!97942 c!97939) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun lt!424029 () List!19140)

(assert (=> d!113909 (= lt!424026 (ListLongMap!12060 lt!424029))))

(declare-fun lt!424027 () Unit!31648)

(declare-fun lt!424028 () Unit!31648)

(assert (=> d!113909 (= lt!424027 lt!424028)))

(assert (=> d!113909 (= (getValueByKey!481 lt!424029 (_1!6691 (ite (or c!97942 c!97939) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!486 (_2!6691 (ite (or c!97942 c!97939) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113909 (= lt!424028 (lemmaContainsTupThenGetReturnValue!260 lt!424029 (_1!6691 (ite (or c!97942 c!97939) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6691 (ite (or c!97942 c!97939) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113909 (= lt!424029 (insertStrictlySorted!317 (toList!6045 (ite c!97942 call!40822 (ite c!97939 call!40820 call!40819))) (_1!6691 (ite (or c!97942 c!97939) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6691 (ite (or c!97942 c!97939) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113909 (= (+!2853 (ite c!97942 call!40822 (ite c!97939 call!40820 call!40819)) (ite (or c!97942 c!97939) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) lt!424026)))

(declare-fun b!939218 () Bool)

(declare-fun res!631681 () Bool)

(assert (=> b!939218 (=> (not res!631681) (not e!527535))))

(assert (=> b!939218 (= res!631681 (= (getValueByKey!481 (toList!6045 lt!424026) (_1!6691 (ite (or c!97942 c!97939) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!486 (_2!6691 (ite (or c!97942 c!97939) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))))

(declare-fun b!939219 () Bool)

(assert (=> b!939219 (= e!527535 (contains!5119 (toList!6045 lt!424026) (ite (or c!97942 c!97939) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (= (and d!113909 res!631682) b!939218))

(assert (= (and b!939218 res!631681) b!939219))

(declare-fun m!874855 () Bool)

(assert (=> d!113909 m!874855))

(declare-fun m!874857 () Bool)

(assert (=> d!113909 m!874857))

(declare-fun m!874859 () Bool)

(assert (=> d!113909 m!874859))

(declare-fun m!874861 () Bool)

(assert (=> d!113909 m!874861))

(declare-fun m!874863 () Bool)

(assert (=> b!939218 m!874863))

(declare-fun m!874865 () Bool)

(assert (=> b!939219 m!874865))

(assert (=> bm!40817 d!113909))

(declare-fun d!113911 () Bool)

(declare-fun e!527537 () Bool)

(assert (=> d!113911 e!527537))

(declare-fun res!631683 () Bool)

(assert (=> d!113911 (=> res!631683 e!527537)))

(declare-fun lt!424032 () Bool)

(assert (=> d!113911 (= res!631683 (not lt!424032))))

(declare-fun lt!424031 () Bool)

(assert (=> d!113911 (= lt!424032 lt!424031)))

(declare-fun lt!424033 () Unit!31648)

(declare-fun e!527536 () Unit!31648)

(assert (=> d!113911 (= lt!424033 e!527536)))

(declare-fun c!98057 () Bool)

(assert (=> d!113911 (= c!98057 lt!424031)))

(assert (=> d!113911 (= lt!424031 (containsKey!452 (toList!6045 lt!423772) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113911 (= (contains!5115 lt!423772 #b0000000000000000000000000000000000000000000000000000000000000000) lt!424032)))

(declare-fun b!939220 () Bool)

(declare-fun lt!424030 () Unit!31648)

(assert (=> b!939220 (= e!527536 lt!424030)))

(assert (=> b!939220 (= lt!424030 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6045 lt!423772) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!939220 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423772) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939221 () Bool)

(declare-fun Unit!31678 () Unit!31648)

(assert (=> b!939221 (= e!527536 Unit!31678)))

(declare-fun b!939222 () Bool)

(assert (=> b!939222 (= e!527537 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423772) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113911 c!98057) b!939220))

(assert (= (and d!113911 (not c!98057)) b!939221))

(assert (= (and d!113911 (not res!631683)) b!939222))

(declare-fun m!874867 () Bool)

(assert (=> d!113911 m!874867))

(declare-fun m!874869 () Bool)

(assert (=> b!939220 m!874869))

(assert (=> b!939220 m!874785))

(assert (=> b!939220 m!874785))

(declare-fun m!874871 () Bool)

(assert (=> b!939220 m!874871))

(assert (=> b!939222 m!874785))

(assert (=> b!939222 m!874785))

(assert (=> b!939222 m!874871))

(assert (=> bm!40839 d!113911))

(assert (=> b!938831 d!113759))

(assert (=> bm!40831 d!113725))

(declare-fun d!113913 () Bool)

(assert (=> d!113913 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423561) k0!1099))))

(declare-fun lt!424034 () Unit!31648)

(assert (=> d!113913 (= lt!424034 (choose!1564 (toList!6045 lt!423561) k0!1099))))

(declare-fun e!527538 () Bool)

(assert (=> d!113913 e!527538))

(declare-fun res!631684 () Bool)

(assert (=> d!113913 (=> (not res!631684) (not e!527538))))

(assert (=> d!113913 (= res!631684 (isStrictlySorted!491 (toList!6045 lt!423561)))))

(assert (=> d!113913 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6045 lt!423561) k0!1099) lt!424034)))

(declare-fun b!939223 () Bool)

(assert (=> b!939223 (= e!527538 (containsKey!452 (toList!6045 lt!423561) k0!1099))))

(assert (= (and d!113913 res!631684) b!939223))

(assert (=> d!113913 m!873969))

(assert (=> d!113913 m!873969))

(assert (=> d!113913 m!873971))

(declare-fun m!874873 () Bool)

(assert (=> d!113913 m!874873))

(assert (=> d!113913 m!874775))

(assert (=> b!939223 m!873965))

(assert (=> b!938724 d!113913))

(assert (=> b!938724 d!113905))

(assert (=> b!938724 d!113903))

(declare-fun d!113915 () Bool)

(assert (=> d!113915 (= (apply!862 lt!423715 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14356 (getValueByKey!481 (toList!6045 lt!423715) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26351 () Bool)

(assert (= bs!26351 d!113915))

(declare-fun m!874875 () Bool)

(assert (=> bs!26351 m!874875))

(assert (=> bs!26351 m!874875))

(declare-fun m!874877 () Bool)

(assert (=> bs!26351 m!874877))

(assert (=> b!938789 d!113915))

(declare-fun d!113917 () Bool)

(declare-fun e!527541 () Bool)

(assert (=> d!113917 e!527541))

(declare-fun c!98060 () Bool)

(assert (=> d!113917 (= c!98060 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!113917 true))

(declare-fun _$29!180 () Unit!31648)

(assert (=> d!113917 (= (choose!1561 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) _$29!180)))

(declare-fun b!939228 () Bool)

(assert (=> b!939228 (= e!527541 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!939229 () Bool)

(assert (=> b!939229 (= e!527541 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!113917 c!98060) b!939228))

(assert (= (and d!113917 (not c!98060)) b!939229))

(assert (=> b!939228 m!873833))

(assert (=> d!113683 d!113917))

(assert (=> d!113683 d!113653))

(declare-fun d!113919 () Bool)

(declare-fun e!527543 () Bool)

(assert (=> d!113919 e!527543))

(declare-fun res!631685 () Bool)

(assert (=> d!113919 (=> res!631685 e!527543)))

(declare-fun lt!424037 () Bool)

(assert (=> d!113919 (= res!631685 (not lt!424037))))

(declare-fun lt!424036 () Bool)

(assert (=> d!113919 (= lt!424037 lt!424036)))

(declare-fun lt!424038 () Unit!31648)

(declare-fun e!527542 () Unit!31648)

(assert (=> d!113919 (= lt!424038 e!527542)))

(declare-fun c!98061 () Bool)

(assert (=> d!113919 (= c!98061 lt!424036)))

(assert (=> d!113919 (= lt!424036 (containsKey!452 (toList!6045 lt!423715) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113919 (= (contains!5115 lt!423715 #b1000000000000000000000000000000000000000000000000000000000000000) lt!424037)))

(declare-fun b!939230 () Bool)

(declare-fun lt!424035 () Unit!31648)

(assert (=> b!939230 (= e!527542 lt!424035)))

(assert (=> b!939230 (= lt!424035 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6045 lt!423715) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!939230 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423715) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939231 () Bool)

(declare-fun Unit!31679 () Unit!31648)

(assert (=> b!939231 (= e!527542 Unit!31679)))

(declare-fun b!939232 () Bool)

(assert (=> b!939232 (= e!527543 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423715) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113919 c!98061) b!939230))

(assert (= (and d!113919 (not c!98061)) b!939231))

(assert (= (and d!113919 (not res!631685)) b!939232))

(declare-fun m!874879 () Bool)

(assert (=> d!113919 m!874879))

(declare-fun m!874881 () Bool)

(assert (=> b!939230 m!874881))

(assert (=> b!939230 m!874875))

(assert (=> b!939230 m!874875))

(declare-fun m!874883 () Bool)

(assert (=> b!939230 m!874883))

(assert (=> b!939232 m!874875))

(assert (=> b!939232 m!874875))

(assert (=> b!939232 m!874883))

(assert (=> bm!40821 d!113919))

(declare-fun d!113921 () Bool)

(assert (=> d!113921 (= (apply!862 lt!423711 lt!423706) (get!14356 (getValueByKey!481 (toList!6045 lt!423711) lt!423706)))))

(declare-fun bs!26352 () Bool)

(assert (= bs!26352 d!113921))

(declare-fun m!874885 () Bool)

(assert (=> bs!26352 m!874885))

(assert (=> bs!26352 m!874885))

(declare-fun m!874887 () Bool)

(assert (=> bs!26352 m!874887))

(assert (=> b!938771 d!113921))

(declare-fun d!113923 () Bool)

(assert (=> d!113923 (= (apply!862 (+!2853 lt!423720 (tuple2!13361 lt!423709 zeroValue!1173)) lt!423718) (get!14356 (getValueByKey!481 (toList!6045 (+!2853 lt!423720 (tuple2!13361 lt!423709 zeroValue!1173))) lt!423718)))))

(declare-fun bs!26353 () Bool)

(assert (= bs!26353 d!113923))

(declare-fun m!874889 () Bool)

(assert (=> bs!26353 m!874889))

(assert (=> bs!26353 m!874889))

(declare-fun m!874891 () Bool)

(assert (=> bs!26353 m!874891))

(assert (=> b!938771 d!113923))

(declare-fun d!113925 () Bool)

(assert (=> d!113925 (= (apply!862 lt!423726 lt!423707) (get!14356 (getValueByKey!481 (toList!6045 lt!423726) lt!423707)))))

(declare-fun bs!26354 () Bool)

(assert (= bs!26354 d!113925))

(declare-fun m!874893 () Bool)

(assert (=> bs!26354 m!874893))

(assert (=> bs!26354 m!874893))

(declare-fun m!874895 () Bool)

(assert (=> bs!26354 m!874895))

(assert (=> b!938771 d!113925))

(declare-fun d!113927 () Bool)

(assert (=> d!113927 (= (apply!862 (+!2853 lt!423726 (tuple2!13361 lt!423714 minValue!1173)) lt!423707) (get!14356 (getValueByKey!481 (toList!6045 (+!2853 lt!423726 (tuple2!13361 lt!423714 minValue!1173))) lt!423707)))))

(declare-fun bs!26355 () Bool)

(assert (= bs!26355 d!113927))

(declare-fun m!874897 () Bool)

(assert (=> bs!26355 m!874897))

(assert (=> bs!26355 m!874897))

(declare-fun m!874899 () Bool)

(assert (=> bs!26355 m!874899))

(assert (=> b!938771 d!113927))

(declare-fun d!113929 () Bool)

(assert (=> d!113929 (contains!5115 (+!2853 lt!423721 (tuple2!13361 lt!423710 zeroValue!1173)) lt!423708)))

(declare-fun lt!424039 () Unit!31648)

(assert (=> d!113929 (= lt!424039 (choose!1559 lt!423721 lt!423710 zeroValue!1173 lt!423708))))

(assert (=> d!113929 (contains!5115 lt!423721 lt!423708)))

(assert (=> d!113929 (= (addStillContains!556 lt!423721 lt!423710 zeroValue!1173 lt!423708) lt!424039)))

(declare-fun bs!26356 () Bool)

(assert (= bs!26356 d!113929))

(assert (=> bs!26356 m!874013))

(assert (=> bs!26356 m!874013))

(assert (=> bs!26356 m!874015))

(declare-fun m!874901 () Bool)

(assert (=> bs!26356 m!874901))

(declare-fun m!874903 () Bool)

(assert (=> bs!26356 m!874903))

(assert (=> b!938771 d!113929))

(declare-fun d!113931 () Bool)

(assert (=> d!113931 (= (apply!862 lt!423720 lt!423718) (get!14356 (getValueByKey!481 (toList!6045 lt!423720) lt!423718)))))

(declare-fun bs!26357 () Bool)

(assert (= bs!26357 d!113931))

(declare-fun m!874905 () Bool)

(assert (=> bs!26357 m!874905))

(assert (=> bs!26357 m!874905))

(declare-fun m!874907 () Bool)

(assert (=> bs!26357 m!874907))

(assert (=> b!938771 d!113931))

(declare-fun d!113933 () Bool)

(assert (=> d!113933 (= (apply!862 (+!2853 lt!423711 (tuple2!13361 lt!423713 minValue!1173)) lt!423706) (apply!862 lt!423711 lt!423706))))

(declare-fun lt!424040 () Unit!31648)

(assert (=> d!113933 (= lt!424040 (choose!1562 lt!423711 lt!423713 minValue!1173 lt!423706))))

(declare-fun e!527544 () Bool)

(assert (=> d!113933 e!527544))

(declare-fun res!631686 () Bool)

(assert (=> d!113933 (=> (not res!631686) (not e!527544))))

(assert (=> d!113933 (= res!631686 (contains!5115 lt!423711 lt!423706))))

(assert (=> d!113933 (= (addApplyDifferent!437 lt!423711 lt!423713 minValue!1173 lt!423706) lt!424040)))

(declare-fun b!939233 () Bool)

(assert (=> b!939233 (= e!527544 (not (= lt!423706 lt!423713)))))

(assert (= (and d!113933 res!631686) b!939233))

(assert (=> d!113933 m!873999))

(declare-fun m!874909 () Bool)

(assert (=> d!113933 m!874909))

(assert (=> d!113933 m!874003))

(declare-fun m!874911 () Bool)

(assert (=> d!113933 m!874911))

(assert (=> d!113933 m!873999))

(assert (=> d!113933 m!874001))

(assert (=> b!938771 d!113933))

(declare-fun d!113935 () Bool)

(assert (=> d!113935 (= (apply!862 (+!2853 lt!423720 (tuple2!13361 lt!423709 zeroValue!1173)) lt!423718) (apply!862 lt!423720 lt!423718))))

(declare-fun lt!424041 () Unit!31648)

(assert (=> d!113935 (= lt!424041 (choose!1562 lt!423720 lt!423709 zeroValue!1173 lt!423718))))

(declare-fun e!527545 () Bool)

(assert (=> d!113935 e!527545))

(declare-fun res!631687 () Bool)

(assert (=> d!113935 (=> (not res!631687) (not e!527545))))

(assert (=> d!113935 (= res!631687 (contains!5115 lt!423720 lt!423718))))

(assert (=> d!113935 (= (addApplyDifferent!437 lt!423720 lt!423709 zeroValue!1173 lt!423718) lt!424041)))

(declare-fun b!939234 () Bool)

(assert (=> b!939234 (= e!527545 (not (= lt!423718 lt!423709)))))

(assert (= (and d!113935 res!631687) b!939234))

(assert (=> d!113935 m!873995))

(declare-fun m!874913 () Bool)

(assert (=> d!113935 m!874913))

(assert (=> d!113935 m!874011))

(declare-fun m!874915 () Bool)

(assert (=> d!113935 m!874915))

(assert (=> d!113935 m!873995))

(assert (=> d!113935 m!873997))

(assert (=> b!938771 d!113935))

(declare-fun d!113937 () Bool)

(declare-fun e!527546 () Bool)

(assert (=> d!113937 e!527546))

(declare-fun res!631689 () Bool)

(assert (=> d!113937 (=> (not res!631689) (not e!527546))))

(declare-fun lt!424042 () ListLongMap!12059)

(assert (=> d!113937 (= res!631689 (contains!5115 lt!424042 (_1!6691 (tuple2!13361 lt!423710 zeroValue!1173))))))

(declare-fun lt!424045 () List!19140)

(assert (=> d!113937 (= lt!424042 (ListLongMap!12060 lt!424045))))

(declare-fun lt!424043 () Unit!31648)

(declare-fun lt!424044 () Unit!31648)

(assert (=> d!113937 (= lt!424043 lt!424044)))

(assert (=> d!113937 (= (getValueByKey!481 lt!424045 (_1!6691 (tuple2!13361 lt!423710 zeroValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423710 zeroValue!1173))))))

(assert (=> d!113937 (= lt!424044 (lemmaContainsTupThenGetReturnValue!260 lt!424045 (_1!6691 (tuple2!13361 lt!423710 zeroValue!1173)) (_2!6691 (tuple2!13361 lt!423710 zeroValue!1173))))))

(assert (=> d!113937 (= lt!424045 (insertStrictlySorted!317 (toList!6045 lt!423721) (_1!6691 (tuple2!13361 lt!423710 zeroValue!1173)) (_2!6691 (tuple2!13361 lt!423710 zeroValue!1173))))))

(assert (=> d!113937 (= (+!2853 lt!423721 (tuple2!13361 lt!423710 zeroValue!1173)) lt!424042)))

(declare-fun b!939235 () Bool)

(declare-fun res!631688 () Bool)

(assert (=> b!939235 (=> (not res!631688) (not e!527546))))

(assert (=> b!939235 (= res!631688 (= (getValueByKey!481 (toList!6045 lt!424042) (_1!6691 (tuple2!13361 lt!423710 zeroValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423710 zeroValue!1173)))))))

(declare-fun b!939236 () Bool)

(assert (=> b!939236 (= e!527546 (contains!5119 (toList!6045 lt!424042) (tuple2!13361 lt!423710 zeroValue!1173)))))

(assert (= (and d!113937 res!631689) b!939235))

(assert (= (and b!939235 res!631688) b!939236))

(declare-fun m!874917 () Bool)

(assert (=> d!113937 m!874917))

(declare-fun m!874919 () Bool)

(assert (=> d!113937 m!874919))

(declare-fun m!874921 () Bool)

(assert (=> d!113937 m!874921))

(declare-fun m!874923 () Bool)

(assert (=> d!113937 m!874923))

(declare-fun m!874925 () Bool)

(assert (=> b!939235 m!874925))

(declare-fun m!874927 () Bool)

(assert (=> b!939236 m!874927))

(assert (=> b!938771 d!113937))

(declare-fun d!113939 () Bool)

(declare-fun e!527547 () Bool)

(assert (=> d!113939 e!527547))

(declare-fun res!631691 () Bool)

(assert (=> d!113939 (=> (not res!631691) (not e!527547))))

(declare-fun lt!424046 () ListLongMap!12059)

(assert (=> d!113939 (= res!631691 (contains!5115 lt!424046 (_1!6691 (tuple2!13361 lt!423714 minValue!1173))))))

(declare-fun lt!424049 () List!19140)

(assert (=> d!113939 (= lt!424046 (ListLongMap!12060 lt!424049))))

(declare-fun lt!424047 () Unit!31648)

(declare-fun lt!424048 () Unit!31648)

(assert (=> d!113939 (= lt!424047 lt!424048)))

(assert (=> d!113939 (= (getValueByKey!481 lt!424049 (_1!6691 (tuple2!13361 lt!423714 minValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423714 minValue!1173))))))

(assert (=> d!113939 (= lt!424048 (lemmaContainsTupThenGetReturnValue!260 lt!424049 (_1!6691 (tuple2!13361 lt!423714 minValue!1173)) (_2!6691 (tuple2!13361 lt!423714 minValue!1173))))))

(assert (=> d!113939 (= lt!424049 (insertStrictlySorted!317 (toList!6045 lt!423726) (_1!6691 (tuple2!13361 lt!423714 minValue!1173)) (_2!6691 (tuple2!13361 lt!423714 minValue!1173))))))

(assert (=> d!113939 (= (+!2853 lt!423726 (tuple2!13361 lt!423714 minValue!1173)) lt!424046)))

(declare-fun b!939237 () Bool)

(declare-fun res!631690 () Bool)

(assert (=> b!939237 (=> (not res!631690) (not e!527547))))

(assert (=> b!939237 (= res!631690 (= (getValueByKey!481 (toList!6045 lt!424046) (_1!6691 (tuple2!13361 lt!423714 minValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423714 minValue!1173)))))))

(declare-fun b!939238 () Bool)

(assert (=> b!939238 (= e!527547 (contains!5119 (toList!6045 lt!424046) (tuple2!13361 lt!423714 minValue!1173)))))

(assert (= (and d!113939 res!631691) b!939237))

(assert (= (and b!939237 res!631690) b!939238))

(declare-fun m!874929 () Bool)

(assert (=> d!113939 m!874929))

(declare-fun m!874931 () Bool)

(assert (=> d!113939 m!874931))

(declare-fun m!874933 () Bool)

(assert (=> d!113939 m!874933))

(declare-fun m!874935 () Bool)

(assert (=> d!113939 m!874935))

(declare-fun m!874937 () Bool)

(assert (=> b!939237 m!874937))

(declare-fun m!874939 () Bool)

(assert (=> b!939238 m!874939))

(assert (=> b!938771 d!113939))

(declare-fun d!113941 () Bool)

(declare-fun e!527548 () Bool)

(assert (=> d!113941 e!527548))

(declare-fun res!631693 () Bool)

(assert (=> d!113941 (=> (not res!631693) (not e!527548))))

(declare-fun lt!424050 () ListLongMap!12059)

(assert (=> d!113941 (= res!631693 (contains!5115 lt!424050 (_1!6691 (tuple2!13361 lt!423709 zeroValue!1173))))))

(declare-fun lt!424053 () List!19140)

(assert (=> d!113941 (= lt!424050 (ListLongMap!12060 lt!424053))))

(declare-fun lt!424051 () Unit!31648)

(declare-fun lt!424052 () Unit!31648)

(assert (=> d!113941 (= lt!424051 lt!424052)))

(assert (=> d!113941 (= (getValueByKey!481 lt!424053 (_1!6691 (tuple2!13361 lt!423709 zeroValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423709 zeroValue!1173))))))

(assert (=> d!113941 (= lt!424052 (lemmaContainsTupThenGetReturnValue!260 lt!424053 (_1!6691 (tuple2!13361 lt!423709 zeroValue!1173)) (_2!6691 (tuple2!13361 lt!423709 zeroValue!1173))))))

(assert (=> d!113941 (= lt!424053 (insertStrictlySorted!317 (toList!6045 lt!423720) (_1!6691 (tuple2!13361 lt!423709 zeroValue!1173)) (_2!6691 (tuple2!13361 lt!423709 zeroValue!1173))))))

(assert (=> d!113941 (= (+!2853 lt!423720 (tuple2!13361 lt!423709 zeroValue!1173)) lt!424050)))

(declare-fun b!939239 () Bool)

(declare-fun res!631692 () Bool)

(assert (=> b!939239 (=> (not res!631692) (not e!527548))))

(assert (=> b!939239 (= res!631692 (= (getValueByKey!481 (toList!6045 lt!424050) (_1!6691 (tuple2!13361 lt!423709 zeroValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423709 zeroValue!1173)))))))

(declare-fun b!939240 () Bool)

(assert (=> b!939240 (= e!527548 (contains!5119 (toList!6045 lt!424050) (tuple2!13361 lt!423709 zeroValue!1173)))))

(assert (= (and d!113941 res!631693) b!939239))

(assert (= (and b!939239 res!631692) b!939240))

(declare-fun m!874941 () Bool)

(assert (=> d!113941 m!874941))

(declare-fun m!874943 () Bool)

(assert (=> d!113941 m!874943))

(declare-fun m!874945 () Bool)

(assert (=> d!113941 m!874945))

(declare-fun m!874947 () Bool)

(assert (=> d!113941 m!874947))

(declare-fun m!874949 () Bool)

(assert (=> b!939239 m!874949))

(declare-fun m!874951 () Bool)

(assert (=> b!939240 m!874951))

(assert (=> b!938771 d!113941))

(declare-fun d!113943 () Bool)

(declare-fun e!527549 () Bool)

(assert (=> d!113943 e!527549))

(declare-fun res!631695 () Bool)

(assert (=> d!113943 (=> (not res!631695) (not e!527549))))

(declare-fun lt!424054 () ListLongMap!12059)

(assert (=> d!113943 (= res!631695 (contains!5115 lt!424054 (_1!6691 (tuple2!13361 lt!423713 minValue!1173))))))

(declare-fun lt!424057 () List!19140)

(assert (=> d!113943 (= lt!424054 (ListLongMap!12060 lt!424057))))

(declare-fun lt!424055 () Unit!31648)

(declare-fun lt!424056 () Unit!31648)

(assert (=> d!113943 (= lt!424055 lt!424056)))

(assert (=> d!113943 (= (getValueByKey!481 lt!424057 (_1!6691 (tuple2!13361 lt!423713 minValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423713 minValue!1173))))))

(assert (=> d!113943 (= lt!424056 (lemmaContainsTupThenGetReturnValue!260 lt!424057 (_1!6691 (tuple2!13361 lt!423713 minValue!1173)) (_2!6691 (tuple2!13361 lt!423713 minValue!1173))))))

(assert (=> d!113943 (= lt!424057 (insertStrictlySorted!317 (toList!6045 lt!423711) (_1!6691 (tuple2!13361 lt!423713 minValue!1173)) (_2!6691 (tuple2!13361 lt!423713 minValue!1173))))))

(assert (=> d!113943 (= (+!2853 lt!423711 (tuple2!13361 lt!423713 minValue!1173)) lt!424054)))

(declare-fun b!939241 () Bool)

(declare-fun res!631694 () Bool)

(assert (=> b!939241 (=> (not res!631694) (not e!527549))))

(assert (=> b!939241 (= res!631694 (= (getValueByKey!481 (toList!6045 lt!424054) (_1!6691 (tuple2!13361 lt!423713 minValue!1173))) (Some!486 (_2!6691 (tuple2!13361 lt!423713 minValue!1173)))))))

(declare-fun b!939242 () Bool)

(assert (=> b!939242 (= e!527549 (contains!5119 (toList!6045 lt!424054) (tuple2!13361 lt!423713 minValue!1173)))))

(assert (= (and d!113943 res!631695) b!939241))

(assert (= (and b!939241 res!631694) b!939242))

(declare-fun m!874953 () Bool)

(assert (=> d!113943 m!874953))

(declare-fun m!874955 () Bool)

(assert (=> d!113943 m!874955))

(declare-fun m!874957 () Bool)

(assert (=> d!113943 m!874957))

(declare-fun m!874959 () Bool)

(assert (=> d!113943 m!874959))

(declare-fun m!874961 () Bool)

(assert (=> b!939241 m!874961))

(declare-fun m!874963 () Bool)

(assert (=> b!939242 m!874963))

(assert (=> b!938771 d!113943))

(declare-fun d!113945 () Bool)

(assert (=> d!113945 (= (apply!862 (+!2853 lt!423711 (tuple2!13361 lt!423713 minValue!1173)) lt!423706) (get!14356 (getValueByKey!481 (toList!6045 (+!2853 lt!423711 (tuple2!13361 lt!423713 minValue!1173))) lt!423706)))))

(declare-fun bs!26358 () Bool)

(assert (= bs!26358 d!113945))

(declare-fun m!874965 () Bool)

(assert (=> bs!26358 m!874965))

(assert (=> bs!26358 m!874965))

(declare-fun m!874967 () Bool)

(assert (=> bs!26358 m!874967))

(assert (=> b!938771 d!113945))

(declare-fun d!113947 () Bool)

(declare-fun e!527551 () Bool)

(assert (=> d!113947 e!527551))

(declare-fun res!631696 () Bool)

(assert (=> d!113947 (=> res!631696 e!527551)))

(declare-fun lt!424060 () Bool)

(assert (=> d!113947 (= res!631696 (not lt!424060))))

(declare-fun lt!424059 () Bool)

(assert (=> d!113947 (= lt!424060 lt!424059)))

(declare-fun lt!424061 () Unit!31648)

(declare-fun e!527550 () Unit!31648)

(assert (=> d!113947 (= lt!424061 e!527550)))

(declare-fun c!98062 () Bool)

(assert (=> d!113947 (= c!98062 lt!424059)))

(assert (=> d!113947 (= lt!424059 (containsKey!452 (toList!6045 (+!2853 lt!423721 (tuple2!13361 lt!423710 zeroValue!1173))) lt!423708))))

(assert (=> d!113947 (= (contains!5115 (+!2853 lt!423721 (tuple2!13361 lt!423710 zeroValue!1173)) lt!423708) lt!424060)))

(declare-fun b!939243 () Bool)

(declare-fun lt!424058 () Unit!31648)

(assert (=> b!939243 (= e!527550 lt!424058)))

(assert (=> b!939243 (= lt!424058 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6045 (+!2853 lt!423721 (tuple2!13361 lt!423710 zeroValue!1173))) lt!423708))))

(assert (=> b!939243 (isDefined!354 (getValueByKey!481 (toList!6045 (+!2853 lt!423721 (tuple2!13361 lt!423710 zeroValue!1173))) lt!423708))))

(declare-fun b!939244 () Bool)

(declare-fun Unit!31680 () Unit!31648)

(assert (=> b!939244 (= e!527550 Unit!31680)))

(declare-fun b!939245 () Bool)

(assert (=> b!939245 (= e!527551 (isDefined!354 (getValueByKey!481 (toList!6045 (+!2853 lt!423721 (tuple2!13361 lt!423710 zeroValue!1173))) lt!423708)))))

(assert (= (and d!113947 c!98062) b!939243))

(assert (= (and d!113947 (not c!98062)) b!939244))

(assert (= (and d!113947 (not res!631696)) b!939245))

(declare-fun m!874969 () Bool)

(assert (=> d!113947 m!874969))

(declare-fun m!874971 () Bool)

(assert (=> b!939243 m!874971))

(declare-fun m!874973 () Bool)

(assert (=> b!939243 m!874973))

(assert (=> b!939243 m!874973))

(declare-fun m!874975 () Bool)

(assert (=> b!939243 m!874975))

(assert (=> b!939245 m!874973))

(assert (=> b!939245 m!874973))

(assert (=> b!939245 m!874975))

(assert (=> b!938771 d!113947))

(assert (=> b!938771 d!113847))

(declare-fun d!113949 () Bool)

(assert (=> d!113949 (= (apply!862 (+!2853 lt!423726 (tuple2!13361 lt!423714 minValue!1173)) lt!423707) (apply!862 lt!423726 lt!423707))))

(declare-fun lt!424062 () Unit!31648)

(assert (=> d!113949 (= lt!424062 (choose!1562 lt!423726 lt!423714 minValue!1173 lt!423707))))

(declare-fun e!527552 () Bool)

(assert (=> d!113949 e!527552))

(declare-fun res!631697 () Bool)

(assert (=> d!113949 (=> (not res!631697) (not e!527552))))

(assert (=> d!113949 (= res!631697 (contains!5115 lt!423726 lt!423707))))

(assert (=> d!113949 (= (addApplyDifferent!437 lt!423726 lt!423714 minValue!1173 lt!423707) lt!424062)))

(declare-fun b!939246 () Bool)

(assert (=> b!939246 (= e!527552 (not (= lt!423707 lt!423714)))))

(assert (= (and d!113949 res!631697) b!939246))

(assert (=> d!113949 m!874005))

(declare-fun m!874977 () Bool)

(assert (=> d!113949 m!874977))

(assert (=> d!113949 m!874017))

(declare-fun m!874979 () Bool)

(assert (=> d!113949 m!874979))

(assert (=> d!113949 m!874005))

(assert (=> d!113949 m!874007))

(assert (=> b!938771 d!113949))

(declare-fun d!113951 () Bool)

(declare-fun e!527554 () Bool)

(assert (=> d!113951 e!527554))

(declare-fun res!631698 () Bool)

(assert (=> d!113951 (=> res!631698 e!527554)))

(declare-fun lt!424065 () Bool)

(assert (=> d!113951 (= res!631698 (not lt!424065))))

(declare-fun lt!424064 () Bool)

(assert (=> d!113951 (= lt!424065 lt!424064)))

(declare-fun lt!424066 () Unit!31648)

(declare-fun e!527553 () Unit!31648)

(assert (=> d!113951 (= lt!424066 e!527553)))

(declare-fun c!98063 () Bool)

(assert (=> d!113951 (= c!98063 lt!424064)))

(assert (=> d!113951 (= lt!424064 (containsKey!452 (toList!6045 lt!423772) (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> d!113951 (= (contains!5115 lt!423772 (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) lt!424065)))

(declare-fun b!939247 () Bool)

(declare-fun lt!424063 () Unit!31648)

(assert (=> b!939247 (= e!527553 lt!424063)))

(assert (=> b!939247 (= lt!424063 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6045 lt!423772) (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!939247 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423772) (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!939248 () Bool)

(declare-fun Unit!31681 () Unit!31648)

(assert (=> b!939248 (= e!527553 Unit!31681)))

(declare-fun b!939249 () Bool)

(assert (=> b!939249 (= e!527554 (isDefined!354 (getValueByKey!481 (toList!6045 lt!423772) (select (arr!27187 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))))

(assert (= (and d!113951 c!98063) b!939247))

(assert (= (and d!113951 (not c!98063)) b!939248))

(assert (= (and d!113951 (not res!631698)) b!939249))

(assert (=> d!113951 m!874109))

(declare-fun m!874981 () Bool)

(assert (=> d!113951 m!874981))

(assert (=> b!939247 m!874109))

(declare-fun m!874983 () Bool)

(assert (=> b!939247 m!874983))

(assert (=> b!939247 m!874109))

(assert (=> b!939247 m!874477))

(assert (=> b!939247 m!874477))

(declare-fun m!874985 () Bool)

(assert (=> b!939247 m!874985))

(assert (=> b!939249 m!874109))

(assert (=> b!939249 m!874477))

(assert (=> b!939249 m!874477))

(assert (=> b!939249 m!874985))

(assert (=> b!938853 d!113951))

(assert (=> b!938864 d!113811))

(assert (=> b!938864 d!113703))

(declare-fun b!939251 () Bool)

(declare-fun e!527556 () Bool)

(assert (=> b!939251 (= e!527556 tp_is_empty!20257)))

(declare-fun mapIsEmpty!32167 () Bool)

(declare-fun mapRes!32167 () Bool)

(assert (=> mapIsEmpty!32167 mapRes!32167))

(declare-fun condMapEmpty!32167 () Bool)

(declare-fun mapDefault!32167 () ValueCell!9647)

(assert (=> mapNonEmpty!32166 (= condMapEmpty!32167 (= mapRest!32166 ((as const (Array (_ BitVec 32) ValueCell!9647)) mapDefault!32167)))))

(assert (=> mapNonEmpty!32166 (= tp!61719 (and e!527556 mapRes!32167))))

(declare-fun mapNonEmpty!32167 () Bool)

(declare-fun tp!61720 () Bool)

(declare-fun e!527555 () Bool)

(assert (=> mapNonEmpty!32167 (= mapRes!32167 (and tp!61720 e!527555))))

(declare-fun mapKey!32167 () (_ BitVec 32))

(declare-fun mapRest!32167 () (Array (_ BitVec 32) ValueCell!9647))

(declare-fun mapValue!32167 () ValueCell!9647)

(assert (=> mapNonEmpty!32167 (= mapRest!32166 (store mapRest!32167 mapKey!32167 mapValue!32167))))

(declare-fun b!939250 () Bool)

(assert (=> b!939250 (= e!527555 tp_is_empty!20257)))

(assert (= (and mapNonEmpty!32166 condMapEmpty!32167) mapIsEmpty!32167))

(assert (= (and mapNonEmpty!32166 (not condMapEmpty!32167)) mapNonEmpty!32167))

(assert (= (and mapNonEmpty!32167 ((_ is ValueCellFull!9647) mapValue!32167)) b!939250))

(assert (= (and mapNonEmpty!32166 ((_ is ValueCellFull!9647) mapDefault!32167)) b!939251))

(declare-fun m!874987 () Bool)

(assert (=> mapNonEmpty!32167 m!874987))

(declare-fun b_lambda!14209 () Bool)

(assert (= b_lambda!14207 (or (and start!79868 b_free!17749) b_lambda!14209)))

(declare-fun b_lambda!14211 () Bool)

(assert (= b_lambda!14203 (or (and start!79868 b_free!17749) b_lambda!14211)))

(declare-fun b_lambda!14213 () Bool)

(assert (= b_lambda!14193 (or (and start!79868 b_free!17749) b_lambda!14213)))

(declare-fun b_lambda!14215 () Bool)

(assert (= b_lambda!14199 (or (and start!79868 b_free!17749) b_lambda!14215)))

(declare-fun b_lambda!14217 () Bool)

(assert (= b_lambda!14205 (or (and start!79868 b_free!17749) b_lambda!14217)))

(declare-fun b_lambda!14219 () Bool)

(assert (= b_lambda!14197 (or (and start!79868 b_free!17749) b_lambda!14219)))

(declare-fun b_lambda!14221 () Bool)

(assert (= b_lambda!14195 (or (and start!79868 b_free!17749) b_lambda!14221)))

(declare-fun b_lambda!14223 () Bool)

(assert (= b_lambda!14201 (or (and start!79868 b_free!17749) b_lambda!14223)))

(check-sat (not b!939241) (not d!113815) (not d!113807) (not d!113737) (not b!939009) (not b!939249) (not b!939216) (not b!939230) (not b!939089) (not b_lambda!14217) (not b!939131) (not d!113721) (not b_next!17749) (not d!113945) (not d!113833) (not b!939042) (not b!939021) (not b!939156) (not d!113839) (not b!939204) (not b!939219) (not d!113801) (not b!939001) (not b!939036) (not b!938999) (not d!113751) (not bm!40865) (not b!938957) (not d!113789) (not d!113931) (not d!113925) (not b!939003) (not d!113885) (not d!113857) (not b!939155) (not b!938987) (not d!113705) (not d!113947) (not b!939140) (not b!939177) (not b_lambda!14211) (not d!113935) (not bm!40858) (not d!113779) (not bm!40855) (not b!938922) (not d!113911) (not b!938986) (not b!939242) (not b!939008) (not d!113879) (not b!939228) (not d!113897) (not b!939096) (not b!938968) (not b_lambda!14175) (not b!939202) (not b!939014) (not b!939088) (not b!939077) (not b!939132) (not d!113749) (not bm!40859) (not b!939239) (not b!938973) (not d!113909) (not b!939238) (not b!939147) (not d!113819) (not b!939051) (not b!938958) (not b!939211) (not d!113933) (not b!939037) (not d!113873) (not d!113915) (not d!113767) (not b!938990) (not d!113795) (not b!939040) (not b!939000) (not b!939240) (not b!938985) (not d!113763) (not d!113929) (not b!938960) (not b!939183) (not b!938948) (not b!939218) (not b!939019) (not d!113867) (not b!938977) (not d!113739) (not bm!40866) (not d!113757) (not d!113725) (not b!938992) (not b!938991) (not b!939139) (not d!113785) (not d!113765) (not b!939106) (not b!939160) (not d!113755) (not d!113821) (not b_lambda!14191) (not b!939153) (not b!939004) (not b!939028) (not b_lambda!14219) (not b!939163) (not b_lambda!14187) (not d!113893) (not d!113717) (not d!113811) (not d!113895) (not d!113859) (not d!113775) (not d!113741) (not b!939104) (not b!938952) (not b!939245) (not d!113905) (not b!939138) (not d!113735) (not b!939134) (not b!939110) (not d!113847) (not b!939143) (not bm!40869) (not b!938953) (not b!939073) (not b!939179) (not d!113863) (not d!113875) (not d!113791) (not d!113921) (not b!938967) (not b_lambda!14221) (not b!939129) (not d!113943) (not d!113941) (not d!113919) (not b!939247) tp_is_empty!20257 (not d!113745) (not b!939091) (not b!939020) (not d!113727) (not d!113949) (not b!939052) (not d!113841) (not d!113761) (not d!113871) (not d!113891) (not b!939029) (not b!939085) (not b!939178) (not b!939223) (not d!113861) (not b!939190) (not b!939108) (not b!939235) (not b!939031) (not b_lambda!14209) (not b!939170) (not b!938954) (not b!939175) (not b!939157) (not b_lambda!14185) (not b!939045) (not b!938995) (not d!113937) (not d!113913) (not b!938951) (not d!113899) (not d!113729) (not d!113927) (not b!939039) (not b!939192) (not b!939205) (not b!939151) (not b!939017) (not b!939098) (not b!939015) (not bm!40847) (not b_lambda!14223) (not b!939237) (not b_lambda!14215) (not b!938983) (not b!939209) (not d!113939) (not b!939222) (not d!113753) (not d!113837) (not b!938996) (not d!113743) (not d!113825) (not b!939196) (not b!939006) (not bm!40867) (not d!113951) (not mapNonEmpty!32167) (not b!939191) (not bm!40845) (not b!939181) (not b!939159) (not b!939097) (not b!938979) (not b!939144) (not b!939150) (not b!939167) b_and!29133 (not b!939012) (not d!113711) (not d!113855) (not b!939034) (not b!938949) (not d!113883) (not bm!40846) (not d!113707) (not b!939090) (not d!113869) (not b!939130) (not b!939213) (not b!938980) (not b!939094) (not d!113793) (not b!939075) (not b!939016) (not d!113831) (not b!939169) (not d!113733) (not b!939236) (not bm!40857) (not d!113877) (not b!938989) (not b!939148) (not d!113709) (not b!939172) (not b!939007) (not b!939137) (not b!939083) (not b!939005) (not b!939126) (not d!113829) (not d!113799) (not d!113731) (not b!938970) (not d!113835) (not b!939135) (not b!939195) (not d!113773) (not b!939162) (not b_lambda!14213) (not bm!40861) (not b!939243) (not d!113809) (not d!113865) (not d!113923) (not b!939093) (not d!113769) (not b!939165) (not b!939232) (not b!939166) (not d!113747) (not d!113889) (not b!938961) (not b!939220) (not d!113843) (not d!113851) (not b_lambda!14189) (not d!113881))
(check-sat b_and!29133 (not b_next!17749))
