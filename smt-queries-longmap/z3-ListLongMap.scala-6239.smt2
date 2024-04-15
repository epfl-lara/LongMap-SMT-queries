; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79764 () Bool)

(assert start!79764)

(declare-fun b_free!17755 () Bool)

(declare-fun b_next!17755 () Bool)

(assert (=> start!79764 (= b_free!17755 (not b_next!17755))))

(declare-fun tp!61725 () Bool)

(declare-fun b_and!29099 () Bool)

(assert (=> start!79764 (= tp!61725 b_and!29099)))

(declare-fun b!938146 () Bool)

(declare-fun e!526857 () Bool)

(declare-fun tp_is_empty!20263 () Bool)

(assert (=> b!938146 (= e!526857 tp_is_empty!20263)))

(declare-fun b!938147 () Bool)

(declare-fun e!526862 () Bool)

(declare-fun e!526856 () Bool)

(declare-fun mapRes!32170 () Bool)

(assert (=> b!938147 (= e!526862 (and e!526856 mapRes!32170))))

(declare-fun condMapEmpty!32170 () Bool)

(declare-datatypes ((V!31983 0))(
  ( (V!31984 (val!10182 Int)) )
))
(declare-datatypes ((ValueCell!9650 0))(
  ( (ValueCellFull!9650 (v!12709 V!31983)) (EmptyCell!9650) )
))
(declare-datatypes ((array!56435 0))(
  ( (array!56436 (arr!27157 (Array (_ BitVec 32) ValueCell!9650)) (size!27618 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56435)

(declare-fun mapDefault!32170 () ValueCell!9650)

(assert (=> b!938147 (= condMapEmpty!32170 (= (arr!27157 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9650)) mapDefault!32170)))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun e!526860 () Bool)

(declare-fun b!938148 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!56437 0))(
  ( (array!56438 (arr!27158 (Array (_ BitVec 32) (_ BitVec 64))) (size!27619 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56437)

(declare-fun arrayContainsKey!0 (array!56437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!938148 (= e!526860 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!938150 () Bool)

(declare-datatypes ((Unit!31596 0))(
  ( (Unit!31597) )
))
(declare-fun e!526852 () Unit!31596)

(declare-fun Unit!31598 () Unit!31596)

(assert (=> b!938150 (= e!526852 Unit!31598)))

(declare-fun b!938151 () Bool)

(declare-fun e!526858 () Bool)

(declare-fun e!526853 () Bool)

(assert (=> b!938151 (= e!526858 e!526853)))

(declare-fun res!631265 () Bool)

(assert (=> b!938151 (=> (not res!631265) (not e!526853))))

(declare-datatypes ((tuple2!13436 0))(
  ( (tuple2!13437 (_1!6729 (_ BitVec 64)) (_2!6729 V!31983)) )
))
(declare-datatypes ((List!19179 0))(
  ( (Nil!19176) (Cons!19175 (h!20321 tuple2!13436) (t!27469 List!19179)) )
))
(declare-datatypes ((ListLongMap!12123 0))(
  ( (ListLongMap!12124 (toList!6077 List!19179)) )
))
(declare-fun lt!423503 () ListLongMap!12123)

(declare-fun contains!5081 (ListLongMap!12123 (_ BitVec 64)) Bool)

(assert (=> b!938151 (= res!631265 (contains!5081 lt!423503 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31983)

(declare-fun minValue!1173 () V!31983)

(declare-fun getCurrentListMap!3241 (array!56437 array!56435 (_ BitVec 32) (_ BitVec 32) V!31983 V!31983 (_ BitVec 32) Int) ListLongMap!12123)

(assert (=> b!938151 (= lt!423503 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!938152 () Bool)

(declare-fun lt!423511 () ListLongMap!12123)

(declare-fun lt!423499 () V!31983)

(declare-fun apply!851 (ListLongMap!12123 (_ BitVec 64)) V!31983)

(assert (=> b!938152 (= (apply!851 lt!423511 k0!1099) lt!423499)))

(declare-fun lt!423502 () ListLongMap!12123)

(declare-fun lt!423505 () V!31983)

(declare-fun lt!423506 () Unit!31596)

(declare-fun lt!423500 () (_ BitVec 64))

(declare-fun addApplyDifferent!434 (ListLongMap!12123 (_ BitVec 64) V!31983 (_ BitVec 64)) Unit!31596)

(assert (=> b!938152 (= lt!423506 (addApplyDifferent!434 lt!423502 lt!423500 lt!423505 k0!1099))))

(assert (=> b!938152 (not (= lt!423500 k0!1099))))

(declare-fun lt!423498 () Unit!31596)

(declare-datatypes ((List!19180 0))(
  ( (Nil!19177) (Cons!19176 (h!20322 (_ BitVec 64)) (t!27470 List!19180)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56437 (_ BitVec 64) (_ BitVec 32) List!19180) Unit!31596)

(assert (=> b!938152 (= lt!423498 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19177))))

(assert (=> b!938152 e!526860))

(declare-fun c!97724 () Bool)

(assert (=> b!938152 (= c!97724 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!423509 () Unit!31596)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!312 (array!56437 array!56435 (_ BitVec 32) (_ BitVec 32) V!31983 V!31983 (_ BitVec 64) (_ BitVec 32) Int) Unit!31596)

(assert (=> b!938152 (= lt!423509 (lemmaListMapContainsThenArrayContainsFrom!312 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56437 (_ BitVec 32) List!19180) Bool)

(assert (=> b!938152 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19177)))

(declare-fun lt!423501 () Unit!31596)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56437 (_ BitVec 32) (_ BitVec 32)) Unit!31596)

(assert (=> b!938152 (= lt!423501 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!938152 (contains!5081 lt!423511 k0!1099)))

(declare-fun lt!423508 () tuple2!13436)

(declare-fun +!2865 (ListLongMap!12123 tuple2!13436) ListLongMap!12123)

(assert (=> b!938152 (= lt!423511 (+!2865 lt!423502 lt!423508))))

(declare-fun lt!423504 () Unit!31596)

(declare-fun addStillContains!554 (ListLongMap!12123 (_ BitVec 64) V!31983 (_ BitVec 64)) Unit!31596)

(assert (=> b!938152 (= lt!423504 (addStillContains!554 lt!423502 lt!423500 lt!423505 k0!1099))))

(assert (=> b!938152 (= (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2865 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423508))))

(assert (=> b!938152 (= lt!423508 (tuple2!13437 lt!423500 lt!423505))))

(declare-fun get!14330 (ValueCell!9650 V!31983) V!31983)

(declare-fun dynLambda!1621 (Int (_ BitVec 64)) V!31983)

(assert (=> b!938152 (= lt!423505 (get!14330 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!423507 () Unit!31596)

(declare-fun lemmaListMapRecursiveValidKeyArray!229 (array!56437 array!56435 (_ BitVec 32) (_ BitVec 32) V!31983 V!31983 (_ BitVec 32) Int) Unit!31596)

(assert (=> b!938152 (= lt!423507 (lemmaListMapRecursiveValidKeyArray!229 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!526855 () Unit!31596)

(assert (=> b!938152 (= e!526855 lt!423506)))

(declare-fun b!938153 () Bool)

(assert (=> b!938153 (= e!526852 e!526855)))

(assert (=> b!938153 (= lt!423500 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97725 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!938153 (= c!97725 (validKeyInArray!0 lt!423500))))

(declare-fun mapIsEmpty!32170 () Bool)

(assert (=> mapIsEmpty!32170 mapRes!32170))

(declare-fun b!938154 () Bool)

(declare-fun res!631264 () Bool)

(declare-fun e!526861 () Bool)

(assert (=> b!938154 (=> (not res!631264) (not e!526861))))

(assert (=> b!938154 (= res!631264 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27619 _keys!1487))))))

(declare-fun b!938155 () Bool)

(declare-fun res!631270 () Bool)

(assert (=> b!938155 (=> (not res!631270) (not e!526861))))

(assert (=> b!938155 (= res!631270 (and (= (size!27618 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27619 _keys!1487) (size!27618 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun v!791 () V!31983)

(declare-fun b!938156 () Bool)

(assert (=> b!938156 (= e!526853 (not (= (apply!851 lt!423503 k0!1099) v!791)))))

(declare-fun b!938157 () Bool)

(declare-fun res!631271 () Bool)

(assert (=> b!938157 (=> (not res!631271) (not e!526861))))

(assert (=> b!938157 (= res!631271 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19177))))

(declare-fun b!938158 () Bool)

(declare-fun e!526854 () Bool)

(declare-fun e!526851 () Bool)

(assert (=> b!938158 (= e!526854 e!526851)))

(declare-fun res!631268 () Bool)

(assert (=> b!938158 (=> (not res!631268) (not e!526851))))

(assert (=> b!938158 (= res!631268 (and (= lt!423499 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!938158 (= lt!423499 (apply!851 lt!423502 k0!1099))))

(declare-fun b!938149 () Bool)

(assert (=> b!938149 (= e!526856 tp_is_empty!20263)))

(declare-fun res!631267 () Bool)

(assert (=> start!79764 (=> (not res!631267) (not e!526861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79764 (= res!631267 (validMask!0 mask!1881))))

(assert (=> start!79764 e!526861))

(assert (=> start!79764 true))

(assert (=> start!79764 tp_is_empty!20263))

(declare-fun array_inv!21188 (array!56435) Bool)

(assert (=> start!79764 (and (array_inv!21188 _values!1231) e!526862)))

(assert (=> start!79764 tp!61725))

(declare-fun array_inv!21189 (array!56437) Bool)

(assert (=> start!79764 (array_inv!21189 _keys!1487)))

(declare-fun b!938159 () Bool)

(assert (=> b!938159 (= e!526861 e!526854)))

(declare-fun res!631269 () Bool)

(assert (=> b!938159 (=> (not res!631269) (not e!526854))))

(assert (=> b!938159 (= res!631269 (contains!5081 lt!423502 k0!1099))))

(assert (=> b!938159 (= lt!423502 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!32170 () Bool)

(declare-fun tp!61726 () Bool)

(assert (=> mapNonEmpty!32170 (= mapRes!32170 (and tp!61726 e!526857))))

(declare-fun mapKey!32170 () (_ BitVec 32))

(declare-fun mapValue!32170 () ValueCell!9650)

(declare-fun mapRest!32170 () (Array (_ BitVec 32) ValueCell!9650))

(assert (=> mapNonEmpty!32170 (= (arr!27157 _values!1231) (store mapRest!32170 mapKey!32170 mapValue!32170))))

(declare-fun b!938160 () Bool)

(assert (=> b!938160 (= e!526851 e!526858)))

(declare-fun res!631266 () Bool)

(assert (=> b!938160 (=> (not res!631266) (not e!526858))))

(assert (=> b!938160 (= res!631266 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27619 _keys!1487)))))

(declare-fun lt!423510 () Unit!31596)

(assert (=> b!938160 (= lt!423510 e!526852)))

(declare-fun c!97723 () Bool)

(assert (=> b!938160 (= c!97723 (validKeyInArray!0 k0!1099))))

(declare-fun b!938161 () Bool)

(assert (=> b!938161 (= e!526860 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!938162 () Bool)

(declare-fun Unit!31599 () Unit!31596)

(assert (=> b!938162 (= e!526855 Unit!31599)))

(declare-fun b!938163 () Bool)

(declare-fun res!631263 () Bool)

(assert (=> b!938163 (=> (not res!631263) (not e!526861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56437 (_ BitVec 32)) Bool)

(assert (=> b!938163 (= res!631263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!79764 res!631267) b!938155))

(assert (= (and b!938155 res!631270) b!938163))

(assert (= (and b!938163 res!631263) b!938157))

(assert (= (and b!938157 res!631271) b!938154))

(assert (= (and b!938154 res!631264) b!938159))

(assert (= (and b!938159 res!631269) b!938158))

(assert (= (and b!938158 res!631268) b!938160))

(assert (= (and b!938160 c!97723) b!938153))

(assert (= (and b!938160 (not c!97723)) b!938150))

(assert (= (and b!938153 c!97725) b!938152))

(assert (= (and b!938153 (not c!97725)) b!938162))

(assert (= (and b!938152 c!97724) b!938148))

(assert (= (and b!938152 (not c!97724)) b!938161))

(assert (= (and b!938160 res!631266) b!938151))

(assert (= (and b!938151 res!631265) b!938156))

(assert (= (and b!938147 condMapEmpty!32170) mapIsEmpty!32170))

(assert (= (and b!938147 (not condMapEmpty!32170)) mapNonEmpty!32170))

(get-info :version)

(assert (= (and mapNonEmpty!32170 ((_ is ValueCellFull!9650) mapValue!32170)) b!938146))

(assert (= (and b!938147 ((_ is ValueCellFull!9650) mapDefault!32170)) b!938149))

(assert (= start!79764 b!938147))

(declare-fun b_lambda!14193 () Bool)

(assert (=> (not b_lambda!14193) (not b!938152)))

(declare-fun t!27468 () Bool)

(declare-fun tb!6141 () Bool)

(assert (=> (and start!79764 (= defaultEntry!1235 defaultEntry!1235) t!27468) tb!6141))

(declare-fun result!12125 () Bool)

(assert (=> tb!6141 (= result!12125 tp_is_empty!20263)))

(assert (=> b!938152 t!27468))

(declare-fun b_and!29101 () Bool)

(assert (= b_and!29099 (and (=> t!27468 result!12125) b_and!29101)))

(declare-fun m!872937 () Bool)

(assert (=> b!938159 m!872937))

(declare-fun m!872939 () Bool)

(assert (=> b!938159 m!872939))

(declare-fun m!872941 () Bool)

(assert (=> b!938156 m!872941))

(declare-fun m!872943 () Bool)

(assert (=> start!79764 m!872943))

(declare-fun m!872945 () Bool)

(assert (=> start!79764 m!872945))

(declare-fun m!872947 () Bool)

(assert (=> start!79764 m!872947))

(declare-fun m!872949 () Bool)

(assert (=> mapNonEmpty!32170 m!872949))

(declare-fun m!872951 () Bool)

(assert (=> b!938148 m!872951))

(declare-fun m!872953 () Bool)

(assert (=> b!938160 m!872953))

(declare-fun m!872955 () Bool)

(assert (=> b!938157 m!872955))

(declare-fun m!872957 () Bool)

(assert (=> b!938163 m!872957))

(declare-fun m!872959 () Bool)

(assert (=> b!938151 m!872959))

(declare-fun m!872961 () Bool)

(assert (=> b!938151 m!872961))

(declare-fun m!872963 () Bool)

(assert (=> b!938152 m!872963))

(declare-fun m!872965 () Bool)

(assert (=> b!938152 m!872965))

(declare-fun m!872967 () Bool)

(assert (=> b!938152 m!872967))

(declare-fun m!872969 () Bool)

(assert (=> b!938152 m!872969))

(assert (=> b!938152 m!872967))

(declare-fun m!872971 () Bool)

(assert (=> b!938152 m!872971))

(assert (=> b!938152 m!872961))

(declare-fun m!872973 () Bool)

(assert (=> b!938152 m!872973))

(declare-fun m!872975 () Bool)

(assert (=> b!938152 m!872975))

(declare-fun m!872977 () Bool)

(assert (=> b!938152 m!872977))

(declare-fun m!872979 () Bool)

(assert (=> b!938152 m!872979))

(declare-fun m!872981 () Bool)

(assert (=> b!938152 m!872981))

(declare-fun m!872983 () Bool)

(assert (=> b!938152 m!872983))

(assert (=> b!938152 m!872969))

(declare-fun m!872985 () Bool)

(assert (=> b!938152 m!872985))

(declare-fun m!872987 () Bool)

(assert (=> b!938152 m!872987))

(declare-fun m!872989 () Bool)

(assert (=> b!938152 m!872989))

(assert (=> b!938152 m!872979))

(declare-fun m!872991 () Bool)

(assert (=> b!938152 m!872991))

(declare-fun m!872993 () Bool)

(assert (=> b!938153 m!872993))

(declare-fun m!872995 () Bool)

(assert (=> b!938153 m!872995))

(declare-fun m!872997 () Bool)

(assert (=> b!938158 m!872997))

(check-sat b_and!29101 (not b!938153) (not b!938160) (not b!938157) (not start!79764) (not b!938148) (not b!938163) (not b!938156) (not b!938152) tp_is_empty!20263 (not b_lambda!14193) (not b!938158) (not mapNonEmpty!32170) (not b!938151) (not b_next!17755) (not b!938159))
(check-sat b_and!29101 (not b_next!17755))
(get-model)

(declare-fun b_lambda!14199 () Bool)

(assert (= b_lambda!14193 (or (and start!79764 b_free!17755) b_lambda!14199)))

(check-sat b_and!29101 (not b!938153) (not b!938160) (not b!938157) (not b!938148) (not b!938163) (not b!938158) (not b!938156) (not b_lambda!14199) (not start!79764) (not b!938152) tp_is_empty!20263 (not mapNonEmpty!32170) (not b!938151) (not b_next!17755) (not b!938159))
(check-sat b_and!29101 (not b_next!17755))
(get-model)

(declare-fun d!113435 () Bool)

(declare-fun e!526937 () Bool)

(assert (=> d!113435 e!526937))

(declare-fun res!631331 () Bool)

(assert (=> d!113435 (=> (not res!631331) (not e!526937))))

(declare-fun lt!423607 () ListLongMap!12123)

(assert (=> d!113435 (= res!631331 (contains!5081 lt!423607 (_1!6729 lt!423508)))))

(declare-fun lt!423604 () List!19179)

(assert (=> d!113435 (= lt!423607 (ListLongMap!12124 lt!423604))))

(declare-fun lt!423605 () Unit!31596)

(declare-fun lt!423606 () Unit!31596)

(assert (=> d!113435 (= lt!423605 lt!423606)))

(declare-datatypes ((Option!493 0))(
  ( (Some!492 (v!12712 V!31983)) (None!491) )
))
(declare-fun getValueByKey!487 (List!19179 (_ BitVec 64)) Option!493)

(assert (=> d!113435 (= (getValueByKey!487 lt!423604 (_1!6729 lt!423508)) (Some!492 (_2!6729 lt!423508)))))

(declare-fun lemmaContainsTupThenGetReturnValue!261 (List!19179 (_ BitVec 64) V!31983) Unit!31596)

(assert (=> d!113435 (= lt!423606 (lemmaContainsTupThenGetReturnValue!261 lt!423604 (_1!6729 lt!423508) (_2!6729 lt!423508)))))

(declare-fun insertStrictlySorted!318 (List!19179 (_ BitVec 64) V!31983) List!19179)

(assert (=> d!113435 (= lt!423604 (insertStrictlySorted!318 (toList!6077 lt!423502) (_1!6729 lt!423508) (_2!6729 lt!423508)))))

(assert (=> d!113435 (= (+!2865 lt!423502 lt!423508) lt!423607)))

(declare-fun b!938282 () Bool)

(declare-fun res!631330 () Bool)

(assert (=> b!938282 (=> (not res!631330) (not e!526937))))

(assert (=> b!938282 (= res!631330 (= (getValueByKey!487 (toList!6077 lt!423607) (_1!6729 lt!423508)) (Some!492 (_2!6729 lt!423508))))))

(declare-fun b!938283 () Bool)

(declare-fun contains!5082 (List!19179 tuple2!13436) Bool)

(assert (=> b!938283 (= e!526937 (contains!5082 (toList!6077 lt!423607) lt!423508))))

(assert (= (and d!113435 res!631331) b!938282))

(assert (= (and b!938282 res!631330) b!938283))

(declare-fun m!873123 () Bool)

(assert (=> d!113435 m!873123))

(declare-fun m!873125 () Bool)

(assert (=> d!113435 m!873125))

(declare-fun m!873127 () Bool)

(assert (=> d!113435 m!873127))

(declare-fun m!873129 () Bool)

(assert (=> d!113435 m!873129))

(declare-fun m!873131 () Bool)

(assert (=> b!938282 m!873131))

(declare-fun m!873133 () Bool)

(assert (=> b!938283 m!873133))

(assert (=> b!938152 d!113435))

(declare-fun d!113437 () Bool)

(declare-fun e!526938 () Bool)

(assert (=> d!113437 e!526938))

(declare-fun res!631333 () Bool)

(assert (=> d!113437 (=> (not res!631333) (not e!526938))))

(declare-fun lt!423611 () ListLongMap!12123)

(assert (=> d!113437 (= res!631333 (contains!5081 lt!423611 (_1!6729 lt!423508)))))

(declare-fun lt!423608 () List!19179)

(assert (=> d!113437 (= lt!423611 (ListLongMap!12124 lt!423608))))

(declare-fun lt!423609 () Unit!31596)

(declare-fun lt!423610 () Unit!31596)

(assert (=> d!113437 (= lt!423609 lt!423610)))

(assert (=> d!113437 (= (getValueByKey!487 lt!423608 (_1!6729 lt!423508)) (Some!492 (_2!6729 lt!423508)))))

(assert (=> d!113437 (= lt!423610 (lemmaContainsTupThenGetReturnValue!261 lt!423608 (_1!6729 lt!423508) (_2!6729 lt!423508)))))

(assert (=> d!113437 (= lt!423608 (insertStrictlySorted!318 (toList!6077 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6729 lt!423508) (_2!6729 lt!423508)))))

(assert (=> d!113437 (= (+!2865 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423508) lt!423611)))

(declare-fun b!938284 () Bool)

(declare-fun res!631332 () Bool)

(assert (=> b!938284 (=> (not res!631332) (not e!526938))))

(assert (=> b!938284 (= res!631332 (= (getValueByKey!487 (toList!6077 lt!423611) (_1!6729 lt!423508)) (Some!492 (_2!6729 lt!423508))))))

(declare-fun b!938285 () Bool)

(assert (=> b!938285 (= e!526938 (contains!5082 (toList!6077 lt!423611) lt!423508))))

(assert (= (and d!113437 res!631333) b!938284))

(assert (= (and b!938284 res!631332) b!938285))

(declare-fun m!873135 () Bool)

(assert (=> d!113437 m!873135))

(declare-fun m!873137 () Bool)

(assert (=> d!113437 m!873137))

(declare-fun m!873139 () Bool)

(assert (=> d!113437 m!873139))

(declare-fun m!873141 () Bool)

(assert (=> d!113437 m!873141))

(declare-fun m!873143 () Bool)

(assert (=> b!938284 m!873143))

(declare-fun m!873145 () Bool)

(assert (=> b!938285 m!873145))

(assert (=> b!938152 d!113437))

(declare-fun d!113439 () Bool)

(declare-fun e!526941 () Bool)

(assert (=> d!113439 e!526941))

(declare-fun res!631336 () Bool)

(assert (=> d!113439 (=> (not res!631336) (not e!526941))))

(assert (=> d!113439 (= res!631336 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27619 _keys!1487)) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27618 _values!1231))))))

(declare-fun lt!423614 () Unit!31596)

(declare-fun choose!1568 (array!56437 array!56435 (_ BitVec 32) (_ BitVec 32) V!31983 V!31983 (_ BitVec 32) Int) Unit!31596)

(assert (=> d!113439 (= lt!423614 (choose!1568 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> d!113439 (validMask!0 mask!1881)))

(assert (=> d!113439 (= (lemmaListMapRecursiveValidKeyArray!229 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!423614)))

(declare-fun b!938288 () Bool)

(assert (=> b!938288 (= e!526941 (= (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2865 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13437 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14330 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!113439 res!631336) b!938288))

(declare-fun b_lambda!14201 () Bool)

(assert (=> (not b_lambda!14201) (not b!938288)))

(assert (=> b!938288 t!27468))

(declare-fun b_and!29111 () Bool)

(assert (= b_and!29101 (and (=> t!27468 result!12125) b_and!29111)))

(declare-fun m!873147 () Bool)

(assert (=> d!113439 m!873147))

(assert (=> d!113439 m!872943))

(declare-fun m!873149 () Bool)

(assert (=> b!938288 m!873149))

(declare-fun m!873151 () Bool)

(assert (=> b!938288 m!873151))

(assert (=> b!938288 m!872969))

(assert (=> b!938288 m!872993))

(assert (=> b!938288 m!872969))

(assert (=> b!938288 m!872967))

(assert (=> b!938288 m!872971))

(assert (=> b!938288 m!872967))

(assert (=> b!938288 m!873149))

(assert (=> b!938288 m!872961))

(assert (=> b!938152 d!113439))

(declare-fun b!938299 () Bool)

(declare-fun e!526950 () Bool)

(declare-fun call!40804 () Bool)

(assert (=> b!938299 (= e!526950 call!40804)))

(declare-fun c!97746 () Bool)

(declare-fun bm!40801 () Bool)

(assert (=> bm!40801 (= call!40804 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97746 (Cons!19176 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19177) Nil!19177)))))

(declare-fun b!938300 () Bool)

(assert (=> b!938300 (= e!526950 call!40804)))

(declare-fun b!938301 () Bool)

(declare-fun e!526953 () Bool)

(assert (=> b!938301 (= e!526953 e!526950)))

(assert (=> b!938301 (= c!97746 (validKeyInArray!0 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!938303 () Bool)

(declare-fun e!526952 () Bool)

(declare-fun contains!5083 (List!19180 (_ BitVec 64)) Bool)

(assert (=> b!938303 (= e!526952 (contains!5083 Nil!19177 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun d!113441 () Bool)

(declare-fun res!631345 () Bool)

(declare-fun e!526951 () Bool)

(assert (=> d!113441 (=> res!631345 e!526951)))

(assert (=> d!113441 (= res!631345 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27619 _keys!1487)))))

(assert (=> d!113441 (= (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19177) e!526951)))

(declare-fun b!938302 () Bool)

(assert (=> b!938302 (= e!526951 e!526953)))

(declare-fun res!631344 () Bool)

(assert (=> b!938302 (=> (not res!631344) (not e!526953))))

(assert (=> b!938302 (= res!631344 (not e!526952))))

(declare-fun res!631343 () Bool)

(assert (=> b!938302 (=> (not res!631343) (not e!526952))))

(assert (=> b!938302 (= res!631343 (validKeyInArray!0 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (= (and d!113441 (not res!631345)) b!938302))

(assert (= (and b!938302 res!631343) b!938303))

(assert (= (and b!938302 res!631344) b!938301))

(assert (= (and b!938301 c!97746) b!938299))

(assert (= (and b!938301 (not c!97746)) b!938300))

(assert (= (or b!938299 b!938300) bm!40801))

(assert (=> bm!40801 m!872993))

(declare-fun m!873153 () Bool)

(assert (=> bm!40801 m!873153))

(assert (=> b!938301 m!872993))

(assert (=> b!938301 m!872993))

(declare-fun m!873155 () Bool)

(assert (=> b!938301 m!873155))

(assert (=> b!938303 m!872993))

(assert (=> b!938303 m!872993))

(declare-fun m!873157 () Bool)

(assert (=> b!938303 m!873157))

(assert (=> b!938302 m!872993))

(assert (=> b!938302 m!872993))

(assert (=> b!938302 m!873155))

(assert (=> b!938152 d!113441))

(declare-fun d!113443 () Bool)

(assert (=> d!113443 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27619 _keys!1487)) (not (= (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) k0!1099)))))

(declare-fun lt!423617 () Unit!31596)

(declare-fun choose!21 (array!56437 (_ BitVec 64) (_ BitVec 32) List!19180) Unit!31596)

(assert (=> d!113443 (= lt!423617 (choose!21 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19177))))

(assert (=> d!113443 (bvslt (size!27619 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113443 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19177) lt!423617)))

(declare-fun bs!26316 () Bool)

(assert (= bs!26316 d!113443))

(assert (=> bs!26316 m!872993))

(declare-fun m!873159 () Bool)

(assert (=> bs!26316 m!873159))

(assert (=> b!938152 d!113443))

(declare-fun d!113445 () Bool)

(declare-fun get!14331 (Option!493) V!31983)

(assert (=> d!113445 (= (apply!851 lt!423511 k0!1099) (get!14331 (getValueByKey!487 (toList!6077 lt!423511) k0!1099)))))

(declare-fun bs!26317 () Bool)

(assert (= bs!26317 d!113445))

(declare-fun m!873161 () Bool)

(assert (=> bs!26317 m!873161))

(assert (=> bs!26317 m!873161))

(declare-fun m!873163 () Bool)

(assert (=> bs!26317 m!873163))

(assert (=> b!938152 d!113445))

(declare-fun d!113447 () Bool)

(assert (=> d!113447 (contains!5081 (+!2865 lt!423502 (tuple2!13437 lt!423500 lt!423505)) k0!1099)))

(declare-fun lt!423620 () Unit!31596)

(declare-fun choose!1569 (ListLongMap!12123 (_ BitVec 64) V!31983 (_ BitVec 64)) Unit!31596)

(assert (=> d!113447 (= lt!423620 (choose!1569 lt!423502 lt!423500 lt!423505 k0!1099))))

(assert (=> d!113447 (contains!5081 lt!423502 k0!1099)))

(assert (=> d!113447 (= (addStillContains!554 lt!423502 lt!423500 lt!423505 k0!1099) lt!423620)))

(declare-fun bs!26318 () Bool)

(assert (= bs!26318 d!113447))

(declare-fun m!873165 () Bool)

(assert (=> bs!26318 m!873165))

(assert (=> bs!26318 m!873165))

(declare-fun m!873167 () Bool)

(assert (=> bs!26318 m!873167))

(declare-fun m!873169 () Bool)

(assert (=> bs!26318 m!873169))

(assert (=> bs!26318 m!872937))

(assert (=> b!938152 d!113447))

(declare-fun bm!40816 () Bool)

(declare-fun call!40819 () Bool)

(declare-fun lt!423679 () ListLongMap!12123)

(assert (=> bm!40816 (= call!40819 (contains!5081 lt!423679 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!113449 () Bool)

(declare-fun e!526984 () Bool)

(assert (=> d!113449 e!526984))

(declare-fun res!631365 () Bool)

(assert (=> d!113449 (=> (not res!631365) (not e!526984))))

(assert (=> d!113449 (= res!631365 (or (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27619 _keys!1487)) (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27619 _keys!1487)))))))

(declare-fun lt!423673 () ListLongMap!12123)

(assert (=> d!113449 (= lt!423679 lt!423673)))

(declare-fun lt!423681 () Unit!31596)

(declare-fun e!526986 () Unit!31596)

(assert (=> d!113449 (= lt!423681 e!526986)))

(declare-fun c!97761 () Bool)

(declare-fun e!526992 () Bool)

(assert (=> d!113449 (= c!97761 e!526992)))

(declare-fun res!631368 () Bool)

(assert (=> d!113449 (=> (not res!631368) (not e!526992))))

(assert (=> d!113449 (= res!631368 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27619 _keys!1487)))))

(declare-fun e!526990 () ListLongMap!12123)

(assert (=> d!113449 (= lt!423673 e!526990)))

(declare-fun c!97760 () Bool)

(assert (=> d!113449 (= c!97760 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113449 (validMask!0 mask!1881)))

(assert (=> d!113449 (= (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!423679)))

(declare-fun b!938347 () Bool)

(declare-fun e!526991 () Bool)

(assert (=> b!938347 (= e!526991 (validKeyInArray!0 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!938348 () Bool)

(declare-fun Unit!31600 () Unit!31596)

(assert (=> b!938348 (= e!526986 Unit!31600)))

(declare-fun b!938349 () Bool)

(declare-fun e!526985 () Bool)

(declare-fun call!40821 () Bool)

(assert (=> b!938349 (= e!526985 (not call!40821))))

(declare-fun b!938350 () Bool)

(declare-fun e!526989 () Bool)

(assert (=> b!938350 (= e!526985 e!526989)))

(declare-fun res!631370 () Bool)

(assert (=> b!938350 (= res!631370 call!40821)))

(assert (=> b!938350 (=> (not res!631370) (not e!526989))))

(declare-fun b!938351 () Bool)

(declare-fun e!526980 () ListLongMap!12123)

(declare-fun call!40824 () ListLongMap!12123)

(assert (=> b!938351 (= e!526980 call!40824)))

(declare-fun b!938352 () Bool)

(declare-fun c!97764 () Bool)

(assert (=> b!938352 (= c!97764 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!526988 () ListLongMap!12123)

(assert (=> b!938352 (= e!526988 e!526980)))

(declare-fun call!40823 () ListLongMap!12123)

(declare-fun c!97759 () Bool)

(declare-fun bm!40817 () Bool)

(declare-fun call!40825 () ListLongMap!12123)

(declare-fun call!40822 () ListLongMap!12123)

(assert (=> bm!40817 (= call!40825 (+!2865 (ite c!97760 call!40823 (ite c!97759 call!40822 call!40824)) (ite (or c!97760 c!97759) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!938353 () Bool)

(declare-fun res!631369 () Bool)

(assert (=> b!938353 (=> (not res!631369) (not e!526984))))

(declare-fun e!526982 () Bool)

(assert (=> b!938353 (= res!631369 e!526982)))

(declare-fun res!631367 () Bool)

(assert (=> b!938353 (=> res!631367 e!526982)))

(assert (=> b!938353 (= res!631367 (not e!526991))))

(declare-fun res!631371 () Bool)

(assert (=> b!938353 (=> (not res!631371) (not e!526991))))

(assert (=> b!938353 (= res!631371 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27619 _keys!1487)))))

(declare-fun bm!40818 () Bool)

(declare-fun call!40820 () ListLongMap!12123)

(assert (=> bm!40818 (= call!40820 call!40825)))

(declare-fun bm!40819 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3340 (array!56437 array!56435 (_ BitVec 32) (_ BitVec 32) V!31983 V!31983 (_ BitVec 32) Int) ListLongMap!12123)

(assert (=> bm!40819 (= call!40823 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!938354 () Bool)

(declare-fun e!526987 () Bool)

(declare-fun e!526983 () Bool)

(assert (=> b!938354 (= e!526987 e!526983)))

(declare-fun res!631372 () Bool)

(assert (=> b!938354 (= res!631372 call!40819)))

(assert (=> b!938354 (=> (not res!631372) (not e!526983))))

(declare-fun b!938355 () Bool)

(assert (=> b!938355 (= e!526989 (= (apply!851 lt!423679 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!938356 () Bool)

(declare-fun res!631366 () Bool)

(assert (=> b!938356 (=> (not res!631366) (not e!526984))))

(assert (=> b!938356 (= res!631366 e!526985)))

(declare-fun c!97762 () Bool)

(assert (=> b!938356 (= c!97762 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!938357 () Bool)

(assert (=> b!938357 (= e!526983 (= (apply!851 lt!423679 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40820 () Bool)

(assert (=> bm!40820 (= call!40822 call!40823)))

(declare-fun b!938358 () Bool)

(declare-fun e!526981 () Bool)

(assert (=> b!938358 (= e!526982 e!526981)))

(declare-fun res!631364 () Bool)

(assert (=> b!938358 (=> (not res!631364) (not e!526981))))

(assert (=> b!938358 (= res!631364 (contains!5081 lt!423679 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938358 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27619 _keys!1487)))))

(declare-fun bm!40821 () Bool)

(assert (=> bm!40821 (= call!40821 (contains!5081 lt!423679 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938359 () Bool)

(assert (=> b!938359 (= e!526990 e!526988)))

(assert (=> b!938359 (= c!97759 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!938360 () Bool)

(assert (=> b!938360 (= e!526990 (+!2865 call!40825 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun bm!40822 () Bool)

(assert (=> bm!40822 (= call!40824 call!40822)))

(declare-fun b!938361 () Bool)

(assert (=> b!938361 (= e!526992 (validKeyInArray!0 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!938362 () Bool)

(assert (=> b!938362 (= e!526984 e!526987)))

(declare-fun c!97763 () Bool)

(assert (=> b!938362 (= c!97763 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!938363 () Bool)

(assert (=> b!938363 (= e!526981 (= (apply!851 lt!423679 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14330 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938363 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27618 _values!1231)))))

(assert (=> b!938363 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27619 _keys!1487)))))

(declare-fun b!938364 () Bool)

(assert (=> b!938364 (= e!526988 call!40820)))

(declare-fun b!938365 () Bool)

(assert (=> b!938365 (= e!526980 call!40820)))

(declare-fun b!938366 () Bool)

(assert (=> b!938366 (= e!526987 (not call!40819))))

(declare-fun b!938367 () Bool)

(declare-fun lt!423671 () Unit!31596)

(assert (=> b!938367 (= e!526986 lt!423671)))

(declare-fun lt!423672 () ListLongMap!12123)

(assert (=> b!938367 (= lt!423672 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423683 () (_ BitVec 64))

(assert (=> b!938367 (= lt!423683 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423677 () (_ BitVec 64))

(assert (=> b!938367 (= lt!423677 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!423674 () Unit!31596)

(assert (=> b!938367 (= lt!423674 (addStillContains!554 lt!423672 lt!423683 zeroValue!1173 lt!423677))))

(assert (=> b!938367 (contains!5081 (+!2865 lt!423672 (tuple2!13437 lt!423683 zeroValue!1173)) lt!423677)))

(declare-fun lt!423686 () Unit!31596)

(assert (=> b!938367 (= lt!423686 lt!423674)))

(declare-fun lt!423669 () ListLongMap!12123)

(assert (=> b!938367 (= lt!423669 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423684 () (_ BitVec 64))

(assert (=> b!938367 (= lt!423684 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423668 () (_ BitVec 64))

(assert (=> b!938367 (= lt!423668 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!423678 () Unit!31596)

(assert (=> b!938367 (= lt!423678 (addApplyDifferent!434 lt!423669 lt!423684 minValue!1173 lt!423668))))

(assert (=> b!938367 (= (apply!851 (+!2865 lt!423669 (tuple2!13437 lt!423684 minValue!1173)) lt!423668) (apply!851 lt!423669 lt!423668))))

(declare-fun lt!423676 () Unit!31596)

(assert (=> b!938367 (= lt!423676 lt!423678)))

(declare-fun lt!423682 () ListLongMap!12123)

(assert (=> b!938367 (= lt!423682 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423675 () (_ BitVec 64))

(assert (=> b!938367 (= lt!423675 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423680 () (_ BitVec 64))

(assert (=> b!938367 (= lt!423680 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!423685 () Unit!31596)

(assert (=> b!938367 (= lt!423685 (addApplyDifferent!434 lt!423682 lt!423675 zeroValue!1173 lt!423680))))

(assert (=> b!938367 (= (apply!851 (+!2865 lt!423682 (tuple2!13437 lt!423675 zeroValue!1173)) lt!423680) (apply!851 lt!423682 lt!423680))))

(declare-fun lt!423667 () Unit!31596)

(assert (=> b!938367 (= lt!423667 lt!423685)))

(declare-fun lt!423670 () ListLongMap!12123)

(assert (=> b!938367 (= lt!423670 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423665 () (_ BitVec 64))

(assert (=> b!938367 (= lt!423665 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423666 () (_ BitVec 64))

(assert (=> b!938367 (= lt!423666 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!938367 (= lt!423671 (addApplyDifferent!434 lt!423670 lt!423665 minValue!1173 lt!423666))))

(assert (=> b!938367 (= (apply!851 (+!2865 lt!423670 (tuple2!13437 lt!423665 minValue!1173)) lt!423666) (apply!851 lt!423670 lt!423666))))

(assert (= (and d!113449 c!97760) b!938360))

(assert (= (and d!113449 (not c!97760)) b!938359))

(assert (= (and b!938359 c!97759) b!938364))

(assert (= (and b!938359 (not c!97759)) b!938352))

(assert (= (and b!938352 c!97764) b!938365))

(assert (= (and b!938352 (not c!97764)) b!938351))

(assert (= (or b!938365 b!938351) bm!40822))

(assert (= (or b!938364 bm!40822) bm!40820))

(assert (= (or b!938364 b!938365) bm!40818))

(assert (= (or b!938360 bm!40820) bm!40819))

(assert (= (or b!938360 bm!40818) bm!40817))

(assert (= (and d!113449 res!631368) b!938361))

(assert (= (and d!113449 c!97761) b!938367))

(assert (= (and d!113449 (not c!97761)) b!938348))

(assert (= (and d!113449 res!631365) b!938353))

(assert (= (and b!938353 res!631371) b!938347))

(assert (= (and b!938353 (not res!631367)) b!938358))

(assert (= (and b!938358 res!631364) b!938363))

(assert (= (and b!938353 res!631369) b!938356))

(assert (= (and b!938356 c!97762) b!938350))

(assert (= (and b!938356 (not c!97762)) b!938349))

(assert (= (and b!938350 res!631370) b!938355))

(assert (= (or b!938350 b!938349) bm!40821))

(assert (= (and b!938356 res!631366) b!938362))

(assert (= (and b!938362 c!97763) b!938354))

(assert (= (and b!938362 (not c!97763)) b!938366))

(assert (= (and b!938354 res!631372) b!938357))

(assert (= (or b!938354 b!938366) bm!40816))

(declare-fun b_lambda!14203 () Bool)

(assert (=> (not b_lambda!14203) (not b!938363)))

(assert (=> b!938363 t!27468))

(declare-fun b_and!29113 () Bool)

(assert (= b_and!29111 (and (=> t!27468 result!12125) b_and!29113)))

(declare-fun m!873171 () Bool)

(assert (=> b!938357 m!873171))

(assert (=> b!938363 m!872993))

(declare-fun m!873173 () Bool)

(assert (=> b!938363 m!873173))

(assert (=> b!938363 m!872969))

(assert (=> b!938363 m!872967))

(assert (=> b!938363 m!872969))

(assert (=> b!938363 m!872967))

(assert (=> b!938363 m!872971))

(assert (=> b!938363 m!872993))

(assert (=> d!113449 m!872943))

(declare-fun m!873175 () Bool)

(assert (=> bm!40816 m!873175))

(declare-fun m!873177 () Bool)

(assert (=> b!938367 m!873177))

(declare-fun m!873179 () Bool)

(assert (=> b!938367 m!873179))

(declare-fun m!873181 () Bool)

(assert (=> b!938367 m!873181))

(declare-fun m!873183 () Bool)

(assert (=> b!938367 m!873183))

(declare-fun m!873185 () Bool)

(assert (=> b!938367 m!873185))

(declare-fun m!873187 () Bool)

(assert (=> b!938367 m!873187))

(declare-fun m!873189 () Bool)

(assert (=> b!938367 m!873189))

(declare-fun m!873191 () Bool)

(assert (=> b!938367 m!873191))

(declare-fun m!873193 () Bool)

(assert (=> b!938367 m!873193))

(declare-fun m!873195 () Bool)

(assert (=> b!938367 m!873195))

(declare-fun m!873197 () Bool)

(assert (=> b!938367 m!873197))

(declare-fun m!873199 () Bool)

(assert (=> b!938367 m!873199))

(assert (=> b!938367 m!873177))

(assert (=> b!938367 m!872993))

(declare-fun m!873201 () Bool)

(assert (=> b!938367 m!873201))

(declare-fun m!873203 () Bool)

(assert (=> b!938367 m!873203))

(assert (=> b!938367 m!873191))

(assert (=> b!938367 m!873195))

(declare-fun m!873205 () Bool)

(assert (=> b!938367 m!873205))

(assert (=> b!938367 m!873205))

(declare-fun m!873207 () Bool)

(assert (=> b!938367 m!873207))

(declare-fun m!873209 () Bool)

(assert (=> bm!40817 m!873209))

(declare-fun m!873211 () Bool)

(assert (=> b!938360 m!873211))

(declare-fun m!873213 () Bool)

(assert (=> bm!40821 m!873213))

(assert (=> b!938361 m!872993))

(assert (=> b!938361 m!872993))

(assert (=> b!938361 m!873155))

(assert (=> b!938358 m!872993))

(assert (=> b!938358 m!872993))

(declare-fun m!873215 () Bool)

(assert (=> b!938358 m!873215))

(declare-fun m!873217 () Bool)

(assert (=> b!938355 m!873217))

(assert (=> bm!40819 m!873189))

(assert (=> b!938347 m!872993))

(assert (=> b!938347 m!872993))

(assert (=> b!938347 m!873155))

(assert (=> b!938152 d!113449))

(declare-fun d!113451 () Bool)

(declare-fun e!526997 () Bool)

(assert (=> d!113451 e!526997))

(declare-fun res!631375 () Bool)

(assert (=> d!113451 (=> res!631375 e!526997)))

(declare-fun lt!423695 () Bool)

(assert (=> d!113451 (= res!631375 (not lt!423695))))

(declare-fun lt!423696 () Bool)

(assert (=> d!113451 (= lt!423695 lt!423696)))

(declare-fun lt!423697 () Unit!31596)

(declare-fun e!526998 () Unit!31596)

(assert (=> d!113451 (= lt!423697 e!526998)))

(declare-fun c!97767 () Bool)

(assert (=> d!113451 (= c!97767 lt!423696)))

(declare-fun containsKey!451 (List!19179 (_ BitVec 64)) Bool)

(assert (=> d!113451 (= lt!423696 (containsKey!451 (toList!6077 lt!423511) k0!1099))))

(assert (=> d!113451 (= (contains!5081 lt!423511 k0!1099) lt!423695)))

(declare-fun b!938374 () Bool)

(declare-fun lt!423698 () Unit!31596)

(assert (=> b!938374 (= e!526998 lt!423698)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!346 (List!19179 (_ BitVec 64)) Unit!31596)

(assert (=> b!938374 (= lt!423698 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6077 lt!423511) k0!1099))))

(declare-fun isDefined!359 (Option!493) Bool)

(assert (=> b!938374 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423511) k0!1099))))

(declare-fun b!938375 () Bool)

(declare-fun Unit!31601 () Unit!31596)

(assert (=> b!938375 (= e!526998 Unit!31601)))

(declare-fun b!938376 () Bool)

(assert (=> b!938376 (= e!526997 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423511) k0!1099)))))

(assert (= (and d!113451 c!97767) b!938374))

(assert (= (and d!113451 (not c!97767)) b!938375))

(assert (= (and d!113451 (not res!631375)) b!938376))

(declare-fun m!873219 () Bool)

(assert (=> d!113451 m!873219))

(declare-fun m!873221 () Bool)

(assert (=> b!938374 m!873221))

(assert (=> b!938374 m!873161))

(assert (=> b!938374 m!873161))

(declare-fun m!873223 () Bool)

(assert (=> b!938374 m!873223))

(assert (=> b!938376 m!873161))

(assert (=> b!938376 m!873161))

(assert (=> b!938376 m!873223))

(assert (=> b!938152 d!113451))

(declare-fun bm!40823 () Bool)

(declare-fun call!40826 () Bool)

(declare-fun lt!423713 () ListLongMap!12123)

(assert (=> bm!40823 (= call!40826 (contains!5081 lt!423713 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!113453 () Bool)

(declare-fun e!527003 () Bool)

(assert (=> d!113453 e!527003))

(declare-fun res!631377 () Bool)

(assert (=> d!113453 (=> (not res!631377) (not e!527003))))

(assert (=> d!113453 (= res!631377 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27619 _keys!1487)) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27619 _keys!1487)))))))

(declare-fun lt!423707 () ListLongMap!12123)

(assert (=> d!113453 (= lt!423713 lt!423707)))

(declare-fun lt!423715 () Unit!31596)

(declare-fun e!527005 () Unit!31596)

(assert (=> d!113453 (= lt!423715 e!527005)))

(declare-fun c!97770 () Bool)

(declare-fun e!527011 () Bool)

(assert (=> d!113453 (= c!97770 e!527011)))

(declare-fun res!631380 () Bool)

(assert (=> d!113453 (=> (not res!631380) (not e!527011))))

(assert (=> d!113453 (= res!631380 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27619 _keys!1487)))))

(declare-fun e!527009 () ListLongMap!12123)

(assert (=> d!113453 (= lt!423707 e!527009)))

(declare-fun c!97769 () Bool)

(assert (=> d!113453 (= c!97769 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113453 (validMask!0 mask!1881)))

(assert (=> d!113453 (= (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423713)))

(declare-fun b!938377 () Bool)

(declare-fun e!527010 () Bool)

(assert (=> b!938377 (= e!527010 (validKeyInArray!0 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!938378 () Bool)

(declare-fun Unit!31602 () Unit!31596)

(assert (=> b!938378 (= e!527005 Unit!31602)))

(declare-fun b!938379 () Bool)

(declare-fun e!527004 () Bool)

(declare-fun call!40828 () Bool)

(assert (=> b!938379 (= e!527004 (not call!40828))))

(declare-fun b!938380 () Bool)

(declare-fun e!527008 () Bool)

(assert (=> b!938380 (= e!527004 e!527008)))

(declare-fun res!631382 () Bool)

(assert (=> b!938380 (= res!631382 call!40828)))

(assert (=> b!938380 (=> (not res!631382) (not e!527008))))

(declare-fun b!938381 () Bool)

(declare-fun e!526999 () ListLongMap!12123)

(declare-fun call!40831 () ListLongMap!12123)

(assert (=> b!938381 (= e!526999 call!40831)))

(declare-fun b!938382 () Bool)

(declare-fun c!97773 () Bool)

(assert (=> b!938382 (= c!97773 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!527007 () ListLongMap!12123)

(assert (=> b!938382 (= e!527007 e!526999)))

(declare-fun call!40830 () ListLongMap!12123)

(declare-fun c!97768 () Bool)

(declare-fun call!40832 () ListLongMap!12123)

(declare-fun call!40829 () ListLongMap!12123)

(declare-fun bm!40824 () Bool)

(assert (=> bm!40824 (= call!40832 (+!2865 (ite c!97769 call!40830 (ite c!97768 call!40829 call!40831)) (ite (or c!97769 c!97768) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!938383 () Bool)

(declare-fun res!631381 () Bool)

(assert (=> b!938383 (=> (not res!631381) (not e!527003))))

(declare-fun e!527001 () Bool)

(assert (=> b!938383 (= res!631381 e!527001)))

(declare-fun res!631379 () Bool)

(assert (=> b!938383 (=> res!631379 e!527001)))

(assert (=> b!938383 (= res!631379 (not e!527010))))

(declare-fun res!631383 () Bool)

(assert (=> b!938383 (=> (not res!631383) (not e!527010))))

(assert (=> b!938383 (= res!631383 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27619 _keys!1487)))))

(declare-fun bm!40825 () Bool)

(declare-fun call!40827 () ListLongMap!12123)

(assert (=> bm!40825 (= call!40827 call!40832)))

(declare-fun bm!40826 () Bool)

(assert (=> bm!40826 (= call!40830 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun b!938384 () Bool)

(declare-fun e!527006 () Bool)

(declare-fun e!527002 () Bool)

(assert (=> b!938384 (= e!527006 e!527002)))

(declare-fun res!631384 () Bool)

(assert (=> b!938384 (= res!631384 call!40826)))

(assert (=> b!938384 (=> (not res!631384) (not e!527002))))

(declare-fun b!938385 () Bool)

(assert (=> b!938385 (= e!527008 (= (apply!851 lt!423713 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!938386 () Bool)

(declare-fun res!631378 () Bool)

(assert (=> b!938386 (=> (not res!631378) (not e!527003))))

(assert (=> b!938386 (= res!631378 e!527004)))

(declare-fun c!97771 () Bool)

(assert (=> b!938386 (= c!97771 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!938387 () Bool)

(assert (=> b!938387 (= e!527002 (= (apply!851 lt!423713 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40827 () Bool)

(assert (=> bm!40827 (= call!40829 call!40830)))

(declare-fun b!938388 () Bool)

(declare-fun e!527000 () Bool)

(assert (=> b!938388 (= e!527001 e!527000)))

(declare-fun res!631376 () Bool)

(assert (=> b!938388 (=> (not res!631376) (not e!527000))))

(assert (=> b!938388 (= res!631376 (contains!5081 lt!423713 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!938388 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27619 _keys!1487)))))

(declare-fun bm!40828 () Bool)

(assert (=> bm!40828 (= call!40828 (contains!5081 lt!423713 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938389 () Bool)

(assert (=> b!938389 (= e!527009 e!527007)))

(assert (=> b!938389 (= c!97768 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!938390 () Bool)

(assert (=> b!938390 (= e!527009 (+!2865 call!40832 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun bm!40829 () Bool)

(assert (=> bm!40829 (= call!40831 call!40829)))

(declare-fun b!938391 () Bool)

(assert (=> b!938391 (= e!527011 (validKeyInArray!0 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!938392 () Bool)

(assert (=> b!938392 (= e!527003 e!527006)))

(declare-fun c!97772 () Bool)

(assert (=> b!938392 (= c!97772 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!938393 () Bool)

(assert (=> b!938393 (= e!527000 (= (apply!851 lt!423713 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14330 (select (arr!27157 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938393 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27618 _values!1231)))))

(assert (=> b!938393 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27619 _keys!1487)))))

(declare-fun b!938394 () Bool)

(assert (=> b!938394 (= e!527007 call!40827)))

(declare-fun b!938395 () Bool)

(assert (=> b!938395 (= e!526999 call!40827)))

(declare-fun b!938396 () Bool)

(assert (=> b!938396 (= e!527006 (not call!40826))))

(declare-fun b!938397 () Bool)

(declare-fun lt!423705 () Unit!31596)

(assert (=> b!938397 (= e!527005 lt!423705)))

(declare-fun lt!423706 () ListLongMap!12123)

(assert (=> b!938397 (= lt!423706 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!423717 () (_ BitVec 64))

(assert (=> b!938397 (= lt!423717 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423711 () (_ BitVec 64))

(assert (=> b!938397 (= lt!423711 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!423708 () Unit!31596)

(assert (=> b!938397 (= lt!423708 (addStillContains!554 lt!423706 lt!423717 zeroValue!1173 lt!423711))))

(assert (=> b!938397 (contains!5081 (+!2865 lt!423706 (tuple2!13437 lt!423717 zeroValue!1173)) lt!423711)))

(declare-fun lt!423720 () Unit!31596)

(assert (=> b!938397 (= lt!423720 lt!423708)))

(declare-fun lt!423703 () ListLongMap!12123)

(assert (=> b!938397 (= lt!423703 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!423718 () (_ BitVec 64))

(assert (=> b!938397 (= lt!423718 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423702 () (_ BitVec 64))

(assert (=> b!938397 (= lt!423702 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!423712 () Unit!31596)

(assert (=> b!938397 (= lt!423712 (addApplyDifferent!434 lt!423703 lt!423718 minValue!1173 lt!423702))))

(assert (=> b!938397 (= (apply!851 (+!2865 lt!423703 (tuple2!13437 lt!423718 minValue!1173)) lt!423702) (apply!851 lt!423703 lt!423702))))

(declare-fun lt!423710 () Unit!31596)

(assert (=> b!938397 (= lt!423710 lt!423712)))

(declare-fun lt!423716 () ListLongMap!12123)

(assert (=> b!938397 (= lt!423716 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!423709 () (_ BitVec 64))

(assert (=> b!938397 (= lt!423709 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423714 () (_ BitVec 64))

(assert (=> b!938397 (= lt!423714 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!423719 () Unit!31596)

(assert (=> b!938397 (= lt!423719 (addApplyDifferent!434 lt!423716 lt!423709 zeroValue!1173 lt!423714))))

(assert (=> b!938397 (= (apply!851 (+!2865 lt!423716 (tuple2!13437 lt!423709 zeroValue!1173)) lt!423714) (apply!851 lt!423716 lt!423714))))

(declare-fun lt!423701 () Unit!31596)

(assert (=> b!938397 (= lt!423701 lt!423719)))

(declare-fun lt!423704 () ListLongMap!12123)

(assert (=> b!938397 (= lt!423704 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!423699 () (_ BitVec 64))

(assert (=> b!938397 (= lt!423699 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423700 () (_ BitVec 64))

(assert (=> b!938397 (= lt!423700 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938397 (= lt!423705 (addApplyDifferent!434 lt!423704 lt!423699 minValue!1173 lt!423700))))

(assert (=> b!938397 (= (apply!851 (+!2865 lt!423704 (tuple2!13437 lt!423699 minValue!1173)) lt!423700) (apply!851 lt!423704 lt!423700))))

(assert (= (and d!113453 c!97769) b!938390))

(assert (= (and d!113453 (not c!97769)) b!938389))

(assert (= (and b!938389 c!97768) b!938394))

(assert (= (and b!938389 (not c!97768)) b!938382))

(assert (= (and b!938382 c!97773) b!938395))

(assert (= (and b!938382 (not c!97773)) b!938381))

(assert (= (or b!938395 b!938381) bm!40829))

(assert (= (or b!938394 bm!40829) bm!40827))

(assert (= (or b!938394 b!938395) bm!40825))

(assert (= (or b!938390 bm!40827) bm!40826))

(assert (= (or b!938390 bm!40825) bm!40824))

(assert (= (and d!113453 res!631380) b!938391))

(assert (= (and d!113453 c!97770) b!938397))

(assert (= (and d!113453 (not c!97770)) b!938378))

(assert (= (and d!113453 res!631377) b!938383))

(assert (= (and b!938383 res!631383) b!938377))

(assert (= (and b!938383 (not res!631379)) b!938388))

(assert (= (and b!938388 res!631376) b!938393))

(assert (= (and b!938383 res!631381) b!938386))

(assert (= (and b!938386 c!97771) b!938380))

(assert (= (and b!938386 (not c!97771)) b!938379))

(assert (= (and b!938380 res!631382) b!938385))

(assert (= (or b!938380 b!938379) bm!40828))

(assert (= (and b!938386 res!631378) b!938392))

(assert (= (and b!938392 c!97772) b!938384))

(assert (= (and b!938392 (not c!97772)) b!938396))

(assert (= (and b!938384 res!631384) b!938387))

(assert (= (or b!938384 b!938396) bm!40823))

(declare-fun b_lambda!14205 () Bool)

(assert (=> (not b_lambda!14205) (not b!938393)))

(assert (=> b!938393 t!27468))

(declare-fun b_and!29115 () Bool)

(assert (= b_and!29113 (and (=> t!27468 result!12125) b_and!29115)))

(declare-fun m!873225 () Bool)

(assert (=> b!938387 m!873225))

(declare-fun m!873227 () Bool)

(assert (=> b!938393 m!873227))

(declare-fun m!873229 () Bool)

(assert (=> b!938393 m!873229))

(declare-fun m!873231 () Bool)

(assert (=> b!938393 m!873231))

(assert (=> b!938393 m!872967))

(assert (=> b!938393 m!873231))

(assert (=> b!938393 m!872967))

(declare-fun m!873233 () Bool)

(assert (=> b!938393 m!873233))

(assert (=> b!938393 m!873227))

(assert (=> d!113453 m!872943))

(declare-fun m!873235 () Bool)

(assert (=> bm!40823 m!873235))

(declare-fun m!873237 () Bool)

(assert (=> b!938397 m!873237))

(declare-fun m!873239 () Bool)

(assert (=> b!938397 m!873239))

(declare-fun m!873241 () Bool)

(assert (=> b!938397 m!873241))

(declare-fun m!873243 () Bool)

(assert (=> b!938397 m!873243))

(declare-fun m!873245 () Bool)

(assert (=> b!938397 m!873245))

(declare-fun m!873247 () Bool)

(assert (=> b!938397 m!873247))

(declare-fun m!873249 () Bool)

(assert (=> b!938397 m!873249))

(declare-fun m!873251 () Bool)

(assert (=> b!938397 m!873251))

(declare-fun m!873253 () Bool)

(assert (=> b!938397 m!873253))

(declare-fun m!873255 () Bool)

(assert (=> b!938397 m!873255))

(declare-fun m!873257 () Bool)

(assert (=> b!938397 m!873257))

(declare-fun m!873259 () Bool)

(assert (=> b!938397 m!873259))

(assert (=> b!938397 m!873237))

(assert (=> b!938397 m!873227))

(declare-fun m!873261 () Bool)

(assert (=> b!938397 m!873261))

(declare-fun m!873263 () Bool)

(assert (=> b!938397 m!873263))

(assert (=> b!938397 m!873251))

(assert (=> b!938397 m!873255))

(declare-fun m!873265 () Bool)

(assert (=> b!938397 m!873265))

(assert (=> b!938397 m!873265))

(declare-fun m!873267 () Bool)

(assert (=> b!938397 m!873267))

(declare-fun m!873269 () Bool)

(assert (=> bm!40824 m!873269))

(declare-fun m!873271 () Bool)

(assert (=> b!938390 m!873271))

(declare-fun m!873273 () Bool)

(assert (=> bm!40828 m!873273))

(assert (=> b!938391 m!873227))

(assert (=> b!938391 m!873227))

(declare-fun m!873275 () Bool)

(assert (=> b!938391 m!873275))

(assert (=> b!938388 m!873227))

(assert (=> b!938388 m!873227))

(declare-fun m!873277 () Bool)

(assert (=> b!938388 m!873277))

(declare-fun m!873279 () Bool)

(assert (=> b!938385 m!873279))

(assert (=> bm!40826 m!873249))

(assert (=> b!938377 m!873227))

(assert (=> b!938377 m!873227))

(assert (=> b!938377 m!873275))

(assert (=> b!938152 d!113453))

(declare-fun d!113455 () Bool)

(declare-fun e!527014 () Bool)

(assert (=> d!113455 e!527014))

(declare-fun c!97776 () Bool)

(assert (=> d!113455 (= c!97776 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!423723 () Unit!31596)

(declare-fun choose!1570 (array!56437 array!56435 (_ BitVec 32) (_ BitVec 32) V!31983 V!31983 (_ BitVec 64) (_ BitVec 32) Int) Unit!31596)

(assert (=> d!113455 (= lt!423723 (choose!1570 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> d!113455 (validMask!0 mask!1881)))

(assert (=> d!113455 (= (lemmaListMapContainsThenArrayContainsFrom!312 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) lt!423723)))

(declare-fun b!938402 () Bool)

(assert (=> b!938402 (= e!527014 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!938403 () Bool)

(assert (=> b!938403 (= e!527014 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!113455 c!97776) b!938402))

(assert (= (and d!113455 (not c!97776)) b!938403))

(declare-fun m!873281 () Bool)

(assert (=> d!113455 m!873281))

(assert (=> d!113455 m!872943))

(assert (=> b!938402 m!872951))

(assert (=> b!938152 d!113455))

(declare-fun d!113457 () Bool)

(assert (=> d!113457 (= (apply!851 (+!2865 lt!423502 (tuple2!13437 lt!423500 lt!423505)) k0!1099) (apply!851 lt!423502 k0!1099))))

(declare-fun lt!423726 () Unit!31596)

(declare-fun choose!1571 (ListLongMap!12123 (_ BitVec 64) V!31983 (_ BitVec 64)) Unit!31596)

(assert (=> d!113457 (= lt!423726 (choose!1571 lt!423502 lt!423500 lt!423505 k0!1099))))

(declare-fun e!527017 () Bool)

(assert (=> d!113457 e!527017))

(declare-fun res!631387 () Bool)

(assert (=> d!113457 (=> (not res!631387) (not e!527017))))

(assert (=> d!113457 (= res!631387 (contains!5081 lt!423502 k0!1099))))

(assert (=> d!113457 (= (addApplyDifferent!434 lt!423502 lt!423500 lt!423505 k0!1099) lt!423726)))

(declare-fun b!938407 () Bool)

(assert (=> b!938407 (= e!527017 (not (= k0!1099 lt!423500)))))

(assert (= (and d!113457 res!631387) b!938407))

(assert (=> d!113457 m!872937))

(assert (=> d!113457 m!873165))

(assert (=> d!113457 m!872997))

(assert (=> d!113457 m!873165))

(declare-fun m!873283 () Bool)

(assert (=> d!113457 m!873283))

(declare-fun m!873285 () Bool)

(assert (=> d!113457 m!873285))

(assert (=> b!938152 d!113457))

(declare-fun d!113459 () Bool)

(declare-fun c!97779 () Bool)

(assert (=> d!113459 (= c!97779 ((_ is ValueCellFull!9650) (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!527020 () V!31983)

(assert (=> d!113459 (= (get!14330 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!527020)))

(declare-fun b!938412 () Bool)

(declare-fun get!14332 (ValueCell!9650 V!31983) V!31983)

(assert (=> b!938412 (= e!527020 (get!14332 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!938413 () Bool)

(declare-fun get!14333 (ValueCell!9650 V!31983) V!31983)

(assert (=> b!938413 (= e!527020 (get!14333 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113459 c!97779) b!938412))

(assert (= (and d!113459 (not c!97779)) b!938413))

(assert (=> b!938412 m!872969))

(assert (=> b!938412 m!872967))

(declare-fun m!873287 () Bool)

(assert (=> b!938412 m!873287))

(assert (=> b!938413 m!872969))

(assert (=> b!938413 m!872967))

(declare-fun m!873289 () Bool)

(assert (=> b!938413 m!873289))

(assert (=> b!938152 d!113459))

(declare-fun d!113461 () Bool)

(assert (=> d!113461 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19177)))

(declare-fun lt!423729 () Unit!31596)

(declare-fun choose!39 (array!56437 (_ BitVec 32) (_ BitVec 32)) Unit!31596)

(assert (=> d!113461 (= lt!423729 (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> d!113461 (bvslt (size!27619 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113461 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) lt!423729)))

(declare-fun bs!26319 () Bool)

(assert (= bs!26319 d!113461))

(assert (=> bs!26319 m!872975))

(declare-fun m!873291 () Bool)

(assert (=> bs!26319 m!873291))

(assert (=> b!938152 d!113461))

(declare-fun d!113463 () Bool)

(assert (=> d!113463 (= (validKeyInArray!0 k0!1099) (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938160 d!113463))

(declare-fun d!113465 () Bool)

(declare-fun e!527021 () Bool)

(assert (=> d!113465 e!527021))

(declare-fun res!631388 () Bool)

(assert (=> d!113465 (=> res!631388 e!527021)))

(declare-fun lt!423730 () Bool)

(assert (=> d!113465 (= res!631388 (not lt!423730))))

(declare-fun lt!423731 () Bool)

(assert (=> d!113465 (= lt!423730 lt!423731)))

(declare-fun lt!423732 () Unit!31596)

(declare-fun e!527022 () Unit!31596)

(assert (=> d!113465 (= lt!423732 e!527022)))

(declare-fun c!97780 () Bool)

(assert (=> d!113465 (= c!97780 lt!423731)))

(assert (=> d!113465 (= lt!423731 (containsKey!451 (toList!6077 lt!423503) k0!1099))))

(assert (=> d!113465 (= (contains!5081 lt!423503 k0!1099) lt!423730)))

(declare-fun b!938414 () Bool)

(declare-fun lt!423733 () Unit!31596)

(assert (=> b!938414 (= e!527022 lt!423733)))

(assert (=> b!938414 (= lt!423733 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6077 lt!423503) k0!1099))))

(assert (=> b!938414 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423503) k0!1099))))

(declare-fun b!938415 () Bool)

(declare-fun Unit!31603 () Unit!31596)

(assert (=> b!938415 (= e!527022 Unit!31603)))

(declare-fun b!938416 () Bool)

(assert (=> b!938416 (= e!527021 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423503) k0!1099)))))

(assert (= (and d!113465 c!97780) b!938414))

(assert (= (and d!113465 (not c!97780)) b!938415))

(assert (= (and d!113465 (not res!631388)) b!938416))

(declare-fun m!873293 () Bool)

(assert (=> d!113465 m!873293))

(declare-fun m!873295 () Bool)

(assert (=> b!938414 m!873295))

(declare-fun m!873297 () Bool)

(assert (=> b!938414 m!873297))

(assert (=> b!938414 m!873297))

(declare-fun m!873299 () Bool)

(assert (=> b!938414 m!873299))

(assert (=> b!938416 m!873297))

(assert (=> b!938416 m!873297))

(assert (=> b!938416 m!873299))

(assert (=> b!938151 d!113465))

(assert (=> b!938151 d!113449))

(declare-fun d!113467 () Bool)

(declare-fun e!527023 () Bool)

(assert (=> d!113467 e!527023))

(declare-fun res!631389 () Bool)

(assert (=> d!113467 (=> res!631389 e!527023)))

(declare-fun lt!423734 () Bool)

(assert (=> d!113467 (= res!631389 (not lt!423734))))

(declare-fun lt!423735 () Bool)

(assert (=> d!113467 (= lt!423734 lt!423735)))

(declare-fun lt!423736 () Unit!31596)

(declare-fun e!527024 () Unit!31596)

(assert (=> d!113467 (= lt!423736 e!527024)))

(declare-fun c!97781 () Bool)

(assert (=> d!113467 (= c!97781 lt!423735)))

(assert (=> d!113467 (= lt!423735 (containsKey!451 (toList!6077 lt!423502) k0!1099))))

(assert (=> d!113467 (= (contains!5081 lt!423502 k0!1099) lt!423734)))

(declare-fun b!938417 () Bool)

(declare-fun lt!423737 () Unit!31596)

(assert (=> b!938417 (= e!527024 lt!423737)))

(assert (=> b!938417 (= lt!423737 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6077 lt!423502) k0!1099))))

(assert (=> b!938417 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423502) k0!1099))))

(declare-fun b!938418 () Bool)

(declare-fun Unit!31604 () Unit!31596)

(assert (=> b!938418 (= e!527024 Unit!31604)))

(declare-fun b!938419 () Bool)

(assert (=> b!938419 (= e!527023 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423502) k0!1099)))))

(assert (= (and d!113467 c!97781) b!938417))

(assert (= (and d!113467 (not c!97781)) b!938418))

(assert (= (and d!113467 (not res!631389)) b!938419))

(declare-fun m!873301 () Bool)

(assert (=> d!113467 m!873301))

(declare-fun m!873303 () Bool)

(assert (=> b!938417 m!873303))

(declare-fun m!873305 () Bool)

(assert (=> b!938417 m!873305))

(assert (=> b!938417 m!873305))

(declare-fun m!873307 () Bool)

(assert (=> b!938417 m!873307))

(assert (=> b!938419 m!873305))

(assert (=> b!938419 m!873305))

(assert (=> b!938419 m!873307))

(assert (=> b!938159 d!113467))

(declare-fun bm!40830 () Bool)

(declare-fun call!40833 () Bool)

(declare-fun lt!423752 () ListLongMap!12123)

(assert (=> bm!40830 (= call!40833 (contains!5081 lt!423752 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!113469 () Bool)

(declare-fun e!527029 () Bool)

(assert (=> d!113469 e!527029))

(declare-fun res!631391 () Bool)

(assert (=> d!113469 (=> (not res!631391) (not e!527029))))

(assert (=> d!113469 (= res!631391 (or (bvsge from!1844 (size!27619 _keys!1487)) (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27619 _keys!1487)))))))

(declare-fun lt!423746 () ListLongMap!12123)

(assert (=> d!113469 (= lt!423752 lt!423746)))

(declare-fun lt!423754 () Unit!31596)

(declare-fun e!527031 () Unit!31596)

(assert (=> d!113469 (= lt!423754 e!527031)))

(declare-fun c!97784 () Bool)

(declare-fun e!527037 () Bool)

(assert (=> d!113469 (= c!97784 e!527037)))

(declare-fun res!631394 () Bool)

(assert (=> d!113469 (=> (not res!631394) (not e!527037))))

(assert (=> d!113469 (= res!631394 (bvslt from!1844 (size!27619 _keys!1487)))))

(declare-fun e!527035 () ListLongMap!12123)

(assert (=> d!113469 (= lt!423746 e!527035)))

(declare-fun c!97783 () Bool)

(assert (=> d!113469 (= c!97783 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113469 (validMask!0 mask!1881)))

(assert (=> d!113469 (= (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!423752)))

(declare-fun b!938420 () Bool)

(declare-fun e!527036 () Bool)

(assert (=> b!938420 (= e!527036 (validKeyInArray!0 (select (arr!27158 _keys!1487) from!1844)))))

(declare-fun b!938421 () Bool)

(declare-fun Unit!31605 () Unit!31596)

(assert (=> b!938421 (= e!527031 Unit!31605)))

(declare-fun b!938422 () Bool)

(declare-fun e!527030 () Bool)

(declare-fun call!40835 () Bool)

(assert (=> b!938422 (= e!527030 (not call!40835))))

(declare-fun b!938423 () Bool)

(declare-fun e!527034 () Bool)

(assert (=> b!938423 (= e!527030 e!527034)))

(declare-fun res!631396 () Bool)

(assert (=> b!938423 (= res!631396 call!40835)))

(assert (=> b!938423 (=> (not res!631396) (not e!527034))))

(declare-fun b!938424 () Bool)

(declare-fun e!527025 () ListLongMap!12123)

(declare-fun call!40838 () ListLongMap!12123)

(assert (=> b!938424 (= e!527025 call!40838)))

(declare-fun b!938425 () Bool)

(declare-fun c!97787 () Bool)

(assert (=> b!938425 (= c!97787 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!527033 () ListLongMap!12123)

(assert (=> b!938425 (= e!527033 e!527025)))

(declare-fun call!40837 () ListLongMap!12123)

(declare-fun c!97782 () Bool)

(declare-fun call!40839 () ListLongMap!12123)

(declare-fun bm!40831 () Bool)

(declare-fun call!40836 () ListLongMap!12123)

(assert (=> bm!40831 (= call!40839 (+!2865 (ite c!97783 call!40837 (ite c!97782 call!40836 call!40838)) (ite (or c!97783 c!97782) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!938426 () Bool)

(declare-fun res!631395 () Bool)

(assert (=> b!938426 (=> (not res!631395) (not e!527029))))

(declare-fun e!527027 () Bool)

(assert (=> b!938426 (= res!631395 e!527027)))

(declare-fun res!631393 () Bool)

(assert (=> b!938426 (=> res!631393 e!527027)))

(assert (=> b!938426 (= res!631393 (not e!527036))))

(declare-fun res!631397 () Bool)

(assert (=> b!938426 (=> (not res!631397) (not e!527036))))

(assert (=> b!938426 (= res!631397 (bvslt from!1844 (size!27619 _keys!1487)))))

(declare-fun bm!40832 () Bool)

(declare-fun call!40834 () ListLongMap!12123)

(assert (=> bm!40832 (= call!40834 call!40839)))

(declare-fun bm!40833 () Bool)

(assert (=> bm!40833 (= call!40837 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!938427 () Bool)

(declare-fun e!527032 () Bool)

(declare-fun e!527028 () Bool)

(assert (=> b!938427 (= e!527032 e!527028)))

(declare-fun res!631398 () Bool)

(assert (=> b!938427 (= res!631398 call!40833)))

(assert (=> b!938427 (=> (not res!631398) (not e!527028))))

(declare-fun b!938428 () Bool)

(assert (=> b!938428 (= e!527034 (= (apply!851 lt!423752 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!938429 () Bool)

(declare-fun res!631392 () Bool)

(assert (=> b!938429 (=> (not res!631392) (not e!527029))))

(assert (=> b!938429 (= res!631392 e!527030)))

(declare-fun c!97785 () Bool)

(assert (=> b!938429 (= c!97785 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!938430 () Bool)

(assert (=> b!938430 (= e!527028 (= (apply!851 lt!423752 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40834 () Bool)

(assert (=> bm!40834 (= call!40836 call!40837)))

(declare-fun b!938431 () Bool)

(declare-fun e!527026 () Bool)

(assert (=> b!938431 (= e!527027 e!527026)))

(declare-fun res!631390 () Bool)

(assert (=> b!938431 (=> (not res!631390) (not e!527026))))

(assert (=> b!938431 (= res!631390 (contains!5081 lt!423752 (select (arr!27158 _keys!1487) from!1844)))))

(assert (=> b!938431 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27619 _keys!1487)))))

(declare-fun bm!40835 () Bool)

(assert (=> bm!40835 (= call!40835 (contains!5081 lt!423752 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938432 () Bool)

(assert (=> b!938432 (= e!527035 e!527033)))

(assert (=> b!938432 (= c!97782 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!938433 () Bool)

(assert (=> b!938433 (= e!527035 (+!2865 call!40839 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun bm!40836 () Bool)

(assert (=> bm!40836 (= call!40838 call!40836)))

(declare-fun b!938434 () Bool)

(assert (=> b!938434 (= e!527037 (validKeyInArray!0 (select (arr!27158 _keys!1487) from!1844)))))

(declare-fun b!938435 () Bool)

(assert (=> b!938435 (= e!527029 e!527032)))

(declare-fun c!97786 () Bool)

(assert (=> b!938435 (= c!97786 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!938436 () Bool)

(assert (=> b!938436 (= e!527026 (= (apply!851 lt!423752 (select (arr!27158 _keys!1487) from!1844)) (get!14330 (select (arr!27157 _values!1231) from!1844) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938436 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27618 _values!1231)))))

(assert (=> b!938436 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27619 _keys!1487)))))

(declare-fun b!938437 () Bool)

(assert (=> b!938437 (= e!527033 call!40834)))

(declare-fun b!938438 () Bool)

(assert (=> b!938438 (= e!527025 call!40834)))

(declare-fun b!938439 () Bool)

(assert (=> b!938439 (= e!527032 (not call!40833))))

(declare-fun b!938440 () Bool)

(declare-fun lt!423744 () Unit!31596)

(assert (=> b!938440 (= e!527031 lt!423744)))

(declare-fun lt!423745 () ListLongMap!12123)

(assert (=> b!938440 (= lt!423745 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!423756 () (_ BitVec 64))

(assert (=> b!938440 (= lt!423756 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423750 () (_ BitVec 64))

(assert (=> b!938440 (= lt!423750 (select (arr!27158 _keys!1487) from!1844))))

(declare-fun lt!423747 () Unit!31596)

(assert (=> b!938440 (= lt!423747 (addStillContains!554 lt!423745 lt!423756 zeroValue!1173 lt!423750))))

(assert (=> b!938440 (contains!5081 (+!2865 lt!423745 (tuple2!13437 lt!423756 zeroValue!1173)) lt!423750)))

(declare-fun lt!423759 () Unit!31596)

(assert (=> b!938440 (= lt!423759 lt!423747)))

(declare-fun lt!423742 () ListLongMap!12123)

(assert (=> b!938440 (= lt!423742 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!423757 () (_ BitVec 64))

(assert (=> b!938440 (= lt!423757 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423741 () (_ BitVec 64))

(assert (=> b!938440 (= lt!423741 (select (arr!27158 _keys!1487) from!1844))))

(declare-fun lt!423751 () Unit!31596)

(assert (=> b!938440 (= lt!423751 (addApplyDifferent!434 lt!423742 lt!423757 minValue!1173 lt!423741))))

(assert (=> b!938440 (= (apply!851 (+!2865 lt!423742 (tuple2!13437 lt!423757 minValue!1173)) lt!423741) (apply!851 lt!423742 lt!423741))))

(declare-fun lt!423749 () Unit!31596)

(assert (=> b!938440 (= lt!423749 lt!423751)))

(declare-fun lt!423755 () ListLongMap!12123)

(assert (=> b!938440 (= lt!423755 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!423748 () (_ BitVec 64))

(assert (=> b!938440 (= lt!423748 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423753 () (_ BitVec 64))

(assert (=> b!938440 (= lt!423753 (select (arr!27158 _keys!1487) from!1844))))

(declare-fun lt!423758 () Unit!31596)

(assert (=> b!938440 (= lt!423758 (addApplyDifferent!434 lt!423755 lt!423748 zeroValue!1173 lt!423753))))

(assert (=> b!938440 (= (apply!851 (+!2865 lt!423755 (tuple2!13437 lt!423748 zeroValue!1173)) lt!423753) (apply!851 lt!423755 lt!423753))))

(declare-fun lt!423740 () Unit!31596)

(assert (=> b!938440 (= lt!423740 lt!423758)))

(declare-fun lt!423743 () ListLongMap!12123)

(assert (=> b!938440 (= lt!423743 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!423738 () (_ BitVec 64))

(assert (=> b!938440 (= lt!423738 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423739 () (_ BitVec 64))

(assert (=> b!938440 (= lt!423739 (select (arr!27158 _keys!1487) from!1844))))

(assert (=> b!938440 (= lt!423744 (addApplyDifferent!434 lt!423743 lt!423738 minValue!1173 lt!423739))))

(assert (=> b!938440 (= (apply!851 (+!2865 lt!423743 (tuple2!13437 lt!423738 minValue!1173)) lt!423739) (apply!851 lt!423743 lt!423739))))

(assert (= (and d!113469 c!97783) b!938433))

(assert (= (and d!113469 (not c!97783)) b!938432))

(assert (= (and b!938432 c!97782) b!938437))

(assert (= (and b!938432 (not c!97782)) b!938425))

(assert (= (and b!938425 c!97787) b!938438))

(assert (= (and b!938425 (not c!97787)) b!938424))

(assert (= (or b!938438 b!938424) bm!40836))

(assert (= (or b!938437 bm!40836) bm!40834))

(assert (= (or b!938437 b!938438) bm!40832))

(assert (= (or b!938433 bm!40834) bm!40833))

(assert (= (or b!938433 bm!40832) bm!40831))

(assert (= (and d!113469 res!631394) b!938434))

(assert (= (and d!113469 c!97784) b!938440))

(assert (= (and d!113469 (not c!97784)) b!938421))

(assert (= (and d!113469 res!631391) b!938426))

(assert (= (and b!938426 res!631397) b!938420))

(assert (= (and b!938426 (not res!631393)) b!938431))

(assert (= (and b!938431 res!631390) b!938436))

(assert (= (and b!938426 res!631395) b!938429))

(assert (= (and b!938429 c!97785) b!938423))

(assert (= (and b!938429 (not c!97785)) b!938422))

(assert (= (and b!938423 res!631396) b!938428))

(assert (= (or b!938423 b!938422) bm!40835))

(assert (= (and b!938429 res!631392) b!938435))

(assert (= (and b!938435 c!97786) b!938427))

(assert (= (and b!938435 (not c!97786)) b!938439))

(assert (= (and b!938427 res!631398) b!938430))

(assert (= (or b!938427 b!938439) bm!40830))

(declare-fun b_lambda!14207 () Bool)

(assert (=> (not b_lambda!14207) (not b!938436)))

(assert (=> b!938436 t!27468))

(declare-fun b_and!29117 () Bool)

(assert (= b_and!29115 (and (=> t!27468 result!12125) b_and!29117)))

(declare-fun m!873309 () Bool)

(assert (=> b!938430 m!873309))

(declare-fun m!873311 () Bool)

(assert (=> b!938436 m!873311))

(declare-fun m!873313 () Bool)

(assert (=> b!938436 m!873313))

(declare-fun m!873315 () Bool)

(assert (=> b!938436 m!873315))

(assert (=> b!938436 m!872967))

(assert (=> b!938436 m!873315))

(assert (=> b!938436 m!872967))

(declare-fun m!873317 () Bool)

(assert (=> b!938436 m!873317))

(assert (=> b!938436 m!873311))

(assert (=> d!113469 m!872943))

(declare-fun m!873319 () Bool)

(assert (=> bm!40830 m!873319))

(declare-fun m!873321 () Bool)

(assert (=> b!938440 m!873321))

(declare-fun m!873323 () Bool)

(assert (=> b!938440 m!873323))

(declare-fun m!873325 () Bool)

(assert (=> b!938440 m!873325))

(declare-fun m!873327 () Bool)

(assert (=> b!938440 m!873327))

(declare-fun m!873329 () Bool)

(assert (=> b!938440 m!873329))

(declare-fun m!873331 () Bool)

(assert (=> b!938440 m!873331))

(declare-fun m!873333 () Bool)

(assert (=> b!938440 m!873333))

(declare-fun m!873335 () Bool)

(assert (=> b!938440 m!873335))

(declare-fun m!873337 () Bool)

(assert (=> b!938440 m!873337))

(declare-fun m!873339 () Bool)

(assert (=> b!938440 m!873339))

(declare-fun m!873341 () Bool)

(assert (=> b!938440 m!873341))

(declare-fun m!873343 () Bool)

(assert (=> b!938440 m!873343))

(assert (=> b!938440 m!873321))

(assert (=> b!938440 m!873311))

(declare-fun m!873345 () Bool)

(assert (=> b!938440 m!873345))

(declare-fun m!873347 () Bool)

(assert (=> b!938440 m!873347))

(assert (=> b!938440 m!873335))

(assert (=> b!938440 m!873339))

(declare-fun m!873349 () Bool)

(assert (=> b!938440 m!873349))

(assert (=> b!938440 m!873349))

(declare-fun m!873351 () Bool)

(assert (=> b!938440 m!873351))

(declare-fun m!873353 () Bool)

(assert (=> bm!40831 m!873353))

(declare-fun m!873355 () Bool)

(assert (=> b!938433 m!873355))

(declare-fun m!873357 () Bool)

(assert (=> bm!40835 m!873357))

(assert (=> b!938434 m!873311))

(assert (=> b!938434 m!873311))

(declare-fun m!873359 () Bool)

(assert (=> b!938434 m!873359))

(assert (=> b!938431 m!873311))

(assert (=> b!938431 m!873311))

(declare-fun m!873361 () Bool)

(assert (=> b!938431 m!873361))

(declare-fun m!873363 () Bool)

(assert (=> b!938428 m!873363))

(assert (=> bm!40833 m!873333))

(assert (=> b!938420 m!873311))

(assert (=> b!938420 m!873311))

(assert (=> b!938420 m!873359))

(assert (=> b!938159 d!113469))

(declare-fun d!113471 () Bool)

(assert (=> d!113471 (= (apply!851 lt!423502 k0!1099) (get!14331 (getValueByKey!487 (toList!6077 lt!423502) k0!1099)))))

(declare-fun bs!26320 () Bool)

(assert (= bs!26320 d!113471))

(assert (=> bs!26320 m!873305))

(assert (=> bs!26320 m!873305))

(declare-fun m!873365 () Bool)

(assert (=> bs!26320 m!873365))

(assert (=> b!938158 d!113471))

(declare-fun d!113473 () Bool)

(declare-fun res!631403 () Bool)

(declare-fun e!527042 () Bool)

(assert (=> d!113473 (=> res!631403 e!527042)))

(assert (=> d!113473 (= res!631403 (= (select (arr!27158 _keys!1487) from!1844) k0!1099))))

(assert (=> d!113473 (= (arrayContainsKey!0 _keys!1487 k0!1099 from!1844) e!527042)))

(declare-fun b!938445 () Bool)

(declare-fun e!527043 () Bool)

(assert (=> b!938445 (= e!527042 e!527043)))

(declare-fun res!631404 () Bool)

(assert (=> b!938445 (=> (not res!631404) (not e!527043))))

(assert (=> b!938445 (= res!631404 (bvslt (bvadd from!1844 #b00000000000000000000000000000001) (size!27619 _keys!1487)))))

(declare-fun b!938446 () Bool)

(assert (=> b!938446 (= e!527043 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)))))

(assert (= (and d!113473 (not res!631403)) b!938445))

(assert (= (and b!938445 res!631404) b!938446))

(assert (=> d!113473 m!873311))

(declare-fun m!873367 () Bool)

(assert (=> b!938446 m!873367))

(assert (=> b!938148 d!113473))

(declare-fun b!938447 () Bool)

(declare-fun e!527044 () Bool)

(declare-fun call!40840 () Bool)

(assert (=> b!938447 (= e!527044 call!40840)))

(declare-fun bm!40837 () Bool)

(declare-fun c!97788 () Bool)

(assert (=> bm!40837 (= call!40840 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97788 (Cons!19176 (select (arr!27158 _keys!1487) #b00000000000000000000000000000000) Nil!19177) Nil!19177)))))

(declare-fun b!938448 () Bool)

(assert (=> b!938448 (= e!527044 call!40840)))

(declare-fun b!938449 () Bool)

(declare-fun e!527047 () Bool)

(assert (=> b!938449 (= e!527047 e!527044)))

(assert (=> b!938449 (= c!97788 (validKeyInArray!0 (select (arr!27158 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!938451 () Bool)

(declare-fun e!527046 () Bool)

(assert (=> b!938451 (= e!527046 (contains!5083 Nil!19177 (select (arr!27158 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun d!113475 () Bool)

(declare-fun res!631407 () Bool)

(declare-fun e!527045 () Bool)

(assert (=> d!113475 (=> res!631407 e!527045)))

(assert (=> d!113475 (= res!631407 (bvsge #b00000000000000000000000000000000 (size!27619 _keys!1487)))))

(assert (=> d!113475 (= (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19177) e!527045)))

(declare-fun b!938450 () Bool)

(assert (=> b!938450 (= e!527045 e!527047)))

(declare-fun res!631406 () Bool)

(assert (=> b!938450 (=> (not res!631406) (not e!527047))))

(assert (=> b!938450 (= res!631406 (not e!527046))))

(declare-fun res!631405 () Bool)

(assert (=> b!938450 (=> (not res!631405) (not e!527046))))

(assert (=> b!938450 (= res!631405 (validKeyInArray!0 (select (arr!27158 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!113475 (not res!631407)) b!938450))

(assert (= (and b!938450 res!631405) b!938451))

(assert (= (and b!938450 res!631406) b!938449))

(assert (= (and b!938449 c!97788) b!938447))

(assert (= (and b!938449 (not c!97788)) b!938448))

(assert (= (or b!938447 b!938448) bm!40837))

(declare-fun m!873369 () Bool)

(assert (=> bm!40837 m!873369))

(declare-fun m!873371 () Bool)

(assert (=> bm!40837 m!873371))

(assert (=> b!938449 m!873369))

(assert (=> b!938449 m!873369))

(declare-fun m!873373 () Bool)

(assert (=> b!938449 m!873373))

(assert (=> b!938451 m!873369))

(assert (=> b!938451 m!873369))

(declare-fun m!873375 () Bool)

(assert (=> b!938451 m!873375))

(assert (=> b!938450 m!873369))

(assert (=> b!938450 m!873369))

(assert (=> b!938450 m!873373))

(assert (=> b!938157 d!113475))

(declare-fun d!113477 () Bool)

(assert (=> d!113477 (= (apply!851 lt!423503 k0!1099) (get!14331 (getValueByKey!487 (toList!6077 lt!423503) k0!1099)))))

(declare-fun bs!26321 () Bool)

(assert (= bs!26321 d!113477))

(assert (=> bs!26321 m!873297))

(assert (=> bs!26321 m!873297))

(declare-fun m!873377 () Bool)

(assert (=> bs!26321 m!873377))

(assert (=> b!938156 d!113477))

(declare-fun d!113479 () Bool)

(assert (=> d!113479 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!79764 d!113479))

(declare-fun d!113481 () Bool)

(assert (=> d!113481 (= (array_inv!21188 _values!1231) (bvsge (size!27618 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!79764 d!113481))

(declare-fun d!113483 () Bool)

(assert (=> d!113483 (= (array_inv!21189 _keys!1487) (bvsge (size!27619 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!79764 d!113483))

(declare-fun b!938460 () Bool)

(declare-fun e!527054 () Bool)

(declare-fun e!527055 () Bool)

(assert (=> b!938460 (= e!527054 e!527055)))

(declare-fun lt!423767 () (_ BitVec 64))

(assert (=> b!938460 (= lt!423767 (select (arr!27158 _keys!1487) #b00000000000000000000000000000000))))

(declare-fun lt!423768 () Unit!31596)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56437 (_ BitVec 64) (_ BitVec 32)) Unit!31596)

(assert (=> b!938460 (= lt!423768 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!423767 #b00000000000000000000000000000000))))

(assert (=> b!938460 (arrayContainsKey!0 _keys!1487 lt!423767 #b00000000000000000000000000000000)))

(declare-fun lt!423766 () Unit!31596)

(assert (=> b!938460 (= lt!423766 lt!423768)))

(declare-fun res!631412 () Bool)

(declare-datatypes ((SeekEntryResult!8982 0))(
  ( (MissingZero!8982 (index!38299 (_ BitVec 32))) (Found!8982 (index!38300 (_ BitVec 32))) (Intermediate!8982 (undefined!9794 Bool) (index!38301 (_ BitVec 32)) (x!80457 (_ BitVec 32))) (Undefined!8982) (MissingVacant!8982 (index!38302 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56437 (_ BitVec 32)) SeekEntryResult!8982)

(assert (=> b!938460 (= res!631412 (= (seekEntryOrOpen!0 (select (arr!27158 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8982 #b00000000000000000000000000000000)))))

(assert (=> b!938460 (=> (not res!631412) (not e!527055))))

(declare-fun b!938461 () Bool)

(declare-fun call!40843 () Bool)

(assert (=> b!938461 (= e!527055 call!40843)))

(declare-fun d!113485 () Bool)

(declare-fun res!631413 () Bool)

(declare-fun e!527056 () Bool)

(assert (=> d!113485 (=> res!631413 e!527056)))

(assert (=> d!113485 (= res!631413 (bvsge #b00000000000000000000000000000000 (size!27619 _keys!1487)))))

(assert (=> d!113485 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!527056)))

(declare-fun b!938462 () Bool)

(assert (=> b!938462 (= e!527054 call!40843)))

(declare-fun bm!40840 () Bool)

(assert (=> bm!40840 (= call!40843 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!938463 () Bool)

(assert (=> b!938463 (= e!527056 e!527054)))

(declare-fun c!97791 () Bool)

(assert (=> b!938463 (= c!97791 (validKeyInArray!0 (select (arr!27158 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!113485 (not res!631413)) b!938463))

(assert (= (and b!938463 c!97791) b!938460))

(assert (= (and b!938463 (not c!97791)) b!938462))

(assert (= (and b!938460 res!631412) b!938461))

(assert (= (or b!938461 b!938462) bm!40840))

(assert (=> b!938460 m!873369))

(declare-fun m!873379 () Bool)

(assert (=> b!938460 m!873379))

(declare-fun m!873381 () Bool)

(assert (=> b!938460 m!873381))

(assert (=> b!938460 m!873369))

(declare-fun m!873383 () Bool)

(assert (=> b!938460 m!873383))

(declare-fun m!873385 () Bool)

(assert (=> bm!40840 m!873385))

(assert (=> b!938463 m!873369))

(assert (=> b!938463 m!873369))

(assert (=> b!938463 m!873373))

(assert (=> b!938163 d!113485))

(declare-fun d!113487 () Bool)

(assert (=> d!113487 (= (validKeyInArray!0 lt!423500) (and (not (= lt!423500 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!423500 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938153 d!113487))

(declare-fun b!938471 () Bool)

(declare-fun e!527062 () Bool)

(assert (=> b!938471 (= e!527062 tp_is_empty!20263)))

(declare-fun b!938470 () Bool)

(declare-fun e!527061 () Bool)

(assert (=> b!938470 (= e!527061 tp_is_empty!20263)))

(declare-fun mapIsEmpty!32179 () Bool)

(declare-fun mapRes!32179 () Bool)

(assert (=> mapIsEmpty!32179 mapRes!32179))

(declare-fun condMapEmpty!32179 () Bool)

(declare-fun mapDefault!32179 () ValueCell!9650)

(assert (=> mapNonEmpty!32170 (= condMapEmpty!32179 (= mapRest!32170 ((as const (Array (_ BitVec 32) ValueCell!9650)) mapDefault!32179)))))

(assert (=> mapNonEmpty!32170 (= tp!61726 (and e!527062 mapRes!32179))))

(declare-fun mapNonEmpty!32179 () Bool)

(declare-fun tp!61741 () Bool)

(assert (=> mapNonEmpty!32179 (= mapRes!32179 (and tp!61741 e!527061))))

(declare-fun mapKey!32179 () (_ BitVec 32))

(declare-fun mapRest!32179 () (Array (_ BitVec 32) ValueCell!9650))

(declare-fun mapValue!32179 () ValueCell!9650)

(assert (=> mapNonEmpty!32179 (= mapRest!32170 (store mapRest!32179 mapKey!32179 mapValue!32179))))

(assert (= (and mapNonEmpty!32170 condMapEmpty!32179) mapIsEmpty!32179))

(assert (= (and mapNonEmpty!32170 (not condMapEmpty!32179)) mapNonEmpty!32179))

(assert (= (and mapNonEmpty!32179 ((_ is ValueCellFull!9650) mapValue!32179)) b!938470))

(assert (= (and mapNonEmpty!32170 ((_ is ValueCellFull!9650) mapDefault!32179)) b!938471))

(declare-fun m!873387 () Bool)

(assert (=> mapNonEmpty!32179 m!873387))

(declare-fun b_lambda!14209 () Bool)

(assert (= b_lambda!14201 (or (and start!79764 b_free!17755) b_lambda!14209)))

(declare-fun b_lambda!14211 () Bool)

(assert (= b_lambda!14203 (or (and start!79764 b_free!17755) b_lambda!14211)))

(declare-fun b_lambda!14213 () Bool)

(assert (= b_lambda!14205 (or (and start!79764 b_free!17755) b_lambda!14213)))

(declare-fun b_lambda!14215 () Bool)

(assert (= b_lambda!14207 (or (and start!79764 b_free!17755) b_lambda!14215)))

(check-sat (not b!938417) (not b_lambda!14213) (not b!938430) (not b!938390) (not mapNonEmpty!32179) b_and!29117 (not b!938355) (not b!938388) (not b!938420) (not b!938397) (not b!938363) (not bm!40833) (not b!938451) (not d!113435) (not b_lambda!14211) (not b!938283) (not d!113445) (not d!113453) (not b!938460) (not b!938412) (not bm!40821) (not b!938367) (not d!113455) (not d!113449) (not d!113451) (not d!113467) (not b!938434) (not bm!40817) (not bm!40840) (not b!938358) (not bm!40830) (not b!938450) (not b!938463) (not b!938288) (not bm!40824) (not b!938374) (not d!113439) (not b!938301) (not b!938414) (not bm!40823) (not bm!40819) (not b!938302) (not b!938303) (not b_lambda!14199) (not b!938357) (not b!938440) (not b!938433) (not b!938416) (not b!938377) (not b!938402) tp_is_empty!20263 (not d!113443) (not bm!40801) (not b!938436) (not b!938449) (not b!938391) (not b_lambda!14215) (not bm!40837) (not b!938419) (not b!938347) (not b!938385) (not b!938285) (not d!113465) (not bm!40828) (not bm!40826) (not d!113457) (not b!938360) (not b!938431) (not d!113471) (not d!113447) (not b!938428) (not b!938393) (not b!938361) (not bm!40816) (not bm!40835) (not b!938376) (not b!938413) (not b!938446) (not d!113477) (not d!113469) (not bm!40831) (not b_lambda!14209) (not d!113437) (not b!938284) (not b!938387) (not d!113461) (not b_next!17755) (not b!938282))
(check-sat b_and!29117 (not b_next!17755))
(get-model)

(assert (=> b!938288 d!113449))

(declare-fun d!113489 () Bool)

(declare-fun e!527063 () Bool)

(assert (=> d!113489 e!527063))

(declare-fun res!631415 () Bool)

(assert (=> d!113489 (=> (not res!631415) (not e!527063))))

(declare-fun lt!423772 () ListLongMap!12123)

(assert (=> d!113489 (= res!631415 (contains!5081 lt!423772 (_1!6729 (tuple2!13437 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14330 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!423769 () List!19179)

(assert (=> d!113489 (= lt!423772 (ListLongMap!12124 lt!423769))))

(declare-fun lt!423770 () Unit!31596)

(declare-fun lt!423771 () Unit!31596)

(assert (=> d!113489 (= lt!423770 lt!423771)))

(assert (=> d!113489 (= (getValueByKey!487 lt!423769 (_1!6729 (tuple2!13437 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14330 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!492 (_2!6729 (tuple2!13437 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14330 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!113489 (= lt!423771 (lemmaContainsTupThenGetReturnValue!261 lt!423769 (_1!6729 (tuple2!13437 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14330 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!6729 (tuple2!13437 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14330 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!113489 (= lt!423769 (insertStrictlySorted!318 (toList!6077 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235)) (_1!6729 (tuple2!13437 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14330 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!6729 (tuple2!13437 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14330 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!113489 (= (+!2865 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13437 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14330 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!423772)))

(declare-fun b!938472 () Bool)

(declare-fun res!631414 () Bool)

(assert (=> b!938472 (=> (not res!631414) (not e!527063))))

(assert (=> b!938472 (= res!631414 (= (getValueByKey!487 (toList!6077 lt!423772) (_1!6729 (tuple2!13437 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14330 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!492 (_2!6729 (tuple2!13437 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14330 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!938473 () Bool)

(assert (=> b!938473 (= e!527063 (contains!5082 (toList!6077 lt!423772) (tuple2!13437 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14330 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!113489 res!631415) b!938472))

(assert (= (and b!938472 res!631414) b!938473))

(declare-fun m!873389 () Bool)

(assert (=> d!113489 m!873389))

(declare-fun m!873391 () Bool)

(assert (=> d!113489 m!873391))

(declare-fun m!873393 () Bool)

(assert (=> d!113489 m!873393))

(declare-fun m!873395 () Bool)

(assert (=> d!113489 m!873395))

(declare-fun m!873397 () Bool)

(assert (=> b!938472 m!873397))

(declare-fun m!873399 () Bool)

(assert (=> b!938473 m!873399))

(assert (=> b!938288 d!113489))

(declare-fun bm!40841 () Bool)

(declare-fun call!40844 () Bool)

(declare-fun lt!423787 () ListLongMap!12123)

(assert (=> bm!40841 (= call!40844 (contains!5081 lt!423787 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!113491 () Bool)

(declare-fun e!527068 () Bool)

(assert (=> d!113491 e!527068))

(declare-fun res!631417 () Bool)

(assert (=> d!113491 (=> (not res!631417) (not e!527068))))

(assert (=> d!113491 (= res!631417 (or (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27619 _keys!1487)) (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27619 _keys!1487)))))))

(declare-fun lt!423781 () ListLongMap!12123)

(assert (=> d!113491 (= lt!423787 lt!423781)))

(declare-fun lt!423789 () Unit!31596)

(declare-fun e!527070 () Unit!31596)

(assert (=> d!113491 (= lt!423789 e!527070)))

(declare-fun c!97794 () Bool)

(declare-fun e!527076 () Bool)

(assert (=> d!113491 (= c!97794 e!527076)))

(declare-fun res!631420 () Bool)

(assert (=> d!113491 (=> (not res!631420) (not e!527076))))

(assert (=> d!113491 (= res!631420 (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27619 _keys!1487)))))

(declare-fun e!527074 () ListLongMap!12123)

(assert (=> d!113491 (= lt!423781 e!527074)))

(declare-fun c!97793 () Bool)

(assert (=> d!113491 (= c!97793 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113491 (validMask!0 mask!1881)))

(assert (=> d!113491 (= (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) lt!423787)))

(declare-fun b!938474 () Bool)

(declare-fun e!527075 () Bool)

(assert (=> b!938474 (= e!527075 (validKeyInArray!0 (select (arr!27158 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun b!938475 () Bool)

(declare-fun Unit!31606 () Unit!31596)

(assert (=> b!938475 (= e!527070 Unit!31606)))

(declare-fun b!938476 () Bool)

(declare-fun e!527069 () Bool)

(declare-fun call!40846 () Bool)

(assert (=> b!938476 (= e!527069 (not call!40846))))

(declare-fun b!938477 () Bool)

(declare-fun e!527073 () Bool)

(assert (=> b!938477 (= e!527069 e!527073)))

(declare-fun res!631422 () Bool)

(assert (=> b!938477 (= res!631422 call!40846)))

(assert (=> b!938477 (=> (not res!631422) (not e!527073))))

(declare-fun b!938478 () Bool)

(declare-fun e!527064 () ListLongMap!12123)

(declare-fun call!40849 () ListLongMap!12123)

(assert (=> b!938478 (= e!527064 call!40849)))

(declare-fun b!938479 () Bool)

(declare-fun c!97797 () Bool)

(assert (=> b!938479 (= c!97797 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!527072 () ListLongMap!12123)

(assert (=> b!938479 (= e!527072 e!527064)))

(declare-fun call!40850 () ListLongMap!12123)

(declare-fun call!40847 () ListLongMap!12123)

(declare-fun call!40848 () ListLongMap!12123)

(declare-fun c!97792 () Bool)

(declare-fun bm!40842 () Bool)

(assert (=> bm!40842 (= call!40850 (+!2865 (ite c!97793 call!40848 (ite c!97792 call!40847 call!40849)) (ite (or c!97793 c!97792) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!938480 () Bool)

(declare-fun res!631421 () Bool)

(assert (=> b!938480 (=> (not res!631421) (not e!527068))))

(declare-fun e!527066 () Bool)

(assert (=> b!938480 (= res!631421 e!527066)))

(declare-fun res!631419 () Bool)

(assert (=> b!938480 (=> res!631419 e!527066)))

(assert (=> b!938480 (= res!631419 (not e!527075))))

(declare-fun res!631423 () Bool)

(assert (=> b!938480 (=> (not res!631423) (not e!527075))))

(assert (=> b!938480 (= res!631423 (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27619 _keys!1487)))))

(declare-fun bm!40843 () Bool)

(declare-fun call!40845 () ListLongMap!12123)

(assert (=> bm!40843 (= call!40845 call!40850)))

(declare-fun bm!40844 () Bool)

(assert (=> bm!40844 (= call!40848 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!938481 () Bool)

(declare-fun e!527071 () Bool)

(declare-fun e!527067 () Bool)

(assert (=> b!938481 (= e!527071 e!527067)))

(declare-fun res!631424 () Bool)

(assert (=> b!938481 (= res!631424 call!40844)))

(assert (=> b!938481 (=> (not res!631424) (not e!527067))))

(declare-fun b!938482 () Bool)

(assert (=> b!938482 (= e!527073 (= (apply!851 lt!423787 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!938483 () Bool)

(declare-fun res!631418 () Bool)

(assert (=> b!938483 (=> (not res!631418) (not e!527068))))

(assert (=> b!938483 (= res!631418 e!527069)))

(declare-fun c!97795 () Bool)

(assert (=> b!938483 (= c!97795 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!938484 () Bool)

(assert (=> b!938484 (= e!527067 (= (apply!851 lt!423787 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40845 () Bool)

(assert (=> bm!40845 (= call!40847 call!40848)))

(declare-fun b!938485 () Bool)

(declare-fun e!527065 () Bool)

(assert (=> b!938485 (= e!527066 e!527065)))

(declare-fun res!631416 () Bool)

(assert (=> b!938485 (=> (not res!631416) (not e!527065))))

(assert (=> b!938485 (= res!631416 (contains!5081 lt!423787 (select (arr!27158 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(assert (=> b!938485 (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27619 _keys!1487)))))

(declare-fun bm!40846 () Bool)

(assert (=> bm!40846 (= call!40846 (contains!5081 lt!423787 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938486 () Bool)

(assert (=> b!938486 (= e!527074 e!527072)))

(assert (=> b!938486 (= c!97792 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!938487 () Bool)

(assert (=> b!938487 (= e!527074 (+!2865 call!40850 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun bm!40847 () Bool)

(assert (=> bm!40847 (= call!40849 call!40847)))

(declare-fun b!938488 () Bool)

(assert (=> b!938488 (= e!527076 (validKeyInArray!0 (select (arr!27158 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun b!938489 () Bool)

(assert (=> b!938489 (= e!527068 e!527071)))

(declare-fun c!97796 () Bool)

(assert (=> b!938489 (= c!97796 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!938490 () Bool)

(assert (=> b!938490 (= e!527065 (= (apply!851 lt!423787 (select (arr!27158 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))) (get!14330 (select (arr!27157 _values!1231) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938490 (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27618 _values!1231)))))

(assert (=> b!938490 (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27619 _keys!1487)))))

(declare-fun b!938491 () Bool)

(assert (=> b!938491 (= e!527072 call!40845)))

(declare-fun b!938492 () Bool)

(assert (=> b!938492 (= e!527064 call!40845)))

(declare-fun b!938493 () Bool)

(assert (=> b!938493 (= e!527071 (not call!40844))))

(declare-fun b!938494 () Bool)

(declare-fun lt!423779 () Unit!31596)

(assert (=> b!938494 (= e!527070 lt!423779)))

(declare-fun lt!423780 () ListLongMap!12123)

(assert (=> b!938494 (= lt!423780 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423791 () (_ BitVec 64))

(assert (=> b!938494 (= lt!423791 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423785 () (_ BitVec 64))

(assert (=> b!938494 (= lt!423785 (select (arr!27158 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!423782 () Unit!31596)

(assert (=> b!938494 (= lt!423782 (addStillContains!554 lt!423780 lt!423791 zeroValue!1173 lt!423785))))

(assert (=> b!938494 (contains!5081 (+!2865 lt!423780 (tuple2!13437 lt!423791 zeroValue!1173)) lt!423785)))

(declare-fun lt!423794 () Unit!31596)

(assert (=> b!938494 (= lt!423794 lt!423782)))

(declare-fun lt!423777 () ListLongMap!12123)

(assert (=> b!938494 (= lt!423777 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423792 () (_ BitVec 64))

(assert (=> b!938494 (= lt!423792 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423776 () (_ BitVec 64))

(assert (=> b!938494 (= lt!423776 (select (arr!27158 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!423786 () Unit!31596)

(assert (=> b!938494 (= lt!423786 (addApplyDifferent!434 lt!423777 lt!423792 minValue!1173 lt!423776))))

(assert (=> b!938494 (= (apply!851 (+!2865 lt!423777 (tuple2!13437 lt!423792 minValue!1173)) lt!423776) (apply!851 lt!423777 lt!423776))))

(declare-fun lt!423784 () Unit!31596)

(assert (=> b!938494 (= lt!423784 lt!423786)))

(declare-fun lt!423790 () ListLongMap!12123)

(assert (=> b!938494 (= lt!423790 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423783 () (_ BitVec 64))

(assert (=> b!938494 (= lt!423783 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423788 () (_ BitVec 64))

(assert (=> b!938494 (= lt!423788 (select (arr!27158 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!423793 () Unit!31596)

(assert (=> b!938494 (= lt!423793 (addApplyDifferent!434 lt!423790 lt!423783 zeroValue!1173 lt!423788))))

(assert (=> b!938494 (= (apply!851 (+!2865 lt!423790 (tuple2!13437 lt!423783 zeroValue!1173)) lt!423788) (apply!851 lt!423790 lt!423788))))

(declare-fun lt!423775 () Unit!31596)

(assert (=> b!938494 (= lt!423775 lt!423793)))

(declare-fun lt!423778 () ListLongMap!12123)

(assert (=> b!938494 (= lt!423778 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423773 () (_ BitVec 64))

(assert (=> b!938494 (= lt!423773 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423774 () (_ BitVec 64))

(assert (=> b!938494 (= lt!423774 (select (arr!27158 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(assert (=> b!938494 (= lt!423779 (addApplyDifferent!434 lt!423778 lt!423773 minValue!1173 lt!423774))))

(assert (=> b!938494 (= (apply!851 (+!2865 lt!423778 (tuple2!13437 lt!423773 minValue!1173)) lt!423774) (apply!851 lt!423778 lt!423774))))

(assert (= (and d!113491 c!97793) b!938487))

(assert (= (and d!113491 (not c!97793)) b!938486))

(assert (= (and b!938486 c!97792) b!938491))

(assert (= (and b!938486 (not c!97792)) b!938479))

(assert (= (and b!938479 c!97797) b!938492))

(assert (= (and b!938479 (not c!97797)) b!938478))

(assert (= (or b!938492 b!938478) bm!40847))

(assert (= (or b!938491 bm!40847) bm!40845))

(assert (= (or b!938491 b!938492) bm!40843))

(assert (= (or b!938487 bm!40845) bm!40844))

(assert (= (or b!938487 bm!40843) bm!40842))

(assert (= (and d!113491 res!631420) b!938488))

(assert (= (and d!113491 c!97794) b!938494))

(assert (= (and d!113491 (not c!97794)) b!938475))

(assert (= (and d!113491 res!631417) b!938480))

(assert (= (and b!938480 res!631423) b!938474))

(assert (= (and b!938480 (not res!631419)) b!938485))

(assert (= (and b!938485 res!631416) b!938490))

(assert (= (and b!938480 res!631421) b!938483))

(assert (= (and b!938483 c!97795) b!938477))

(assert (= (and b!938483 (not c!97795)) b!938476))

(assert (= (and b!938477 res!631422) b!938482))

(assert (= (or b!938477 b!938476) bm!40846))

(assert (= (and b!938483 res!631418) b!938489))

(assert (= (and b!938489 c!97796) b!938481))

(assert (= (and b!938489 (not c!97796)) b!938493))

(assert (= (and b!938481 res!631424) b!938484))

(assert (= (or b!938481 b!938493) bm!40841))

(declare-fun b_lambda!14217 () Bool)

(assert (=> (not b_lambda!14217) (not b!938490)))

(assert (=> b!938490 t!27468))

(declare-fun b_and!29119 () Bool)

(assert (= b_and!29117 (and (=> t!27468 result!12125) b_and!29119)))

(declare-fun m!873401 () Bool)

(assert (=> b!938484 m!873401))

(declare-fun m!873403 () Bool)

(assert (=> b!938490 m!873403))

(declare-fun m!873405 () Bool)

(assert (=> b!938490 m!873405))

(declare-fun m!873407 () Bool)

(assert (=> b!938490 m!873407))

(assert (=> b!938490 m!872967))

(assert (=> b!938490 m!873407))

(assert (=> b!938490 m!872967))

(declare-fun m!873409 () Bool)

(assert (=> b!938490 m!873409))

(assert (=> b!938490 m!873403))

(assert (=> d!113491 m!872943))

(declare-fun m!873411 () Bool)

(assert (=> bm!40841 m!873411))

(declare-fun m!873413 () Bool)

(assert (=> b!938494 m!873413))

(declare-fun m!873415 () Bool)

(assert (=> b!938494 m!873415))

(declare-fun m!873417 () Bool)

(assert (=> b!938494 m!873417))

(declare-fun m!873419 () Bool)

(assert (=> b!938494 m!873419))

(declare-fun m!873421 () Bool)

(assert (=> b!938494 m!873421))

(declare-fun m!873423 () Bool)

(assert (=> b!938494 m!873423))

(declare-fun m!873425 () Bool)

(assert (=> b!938494 m!873425))

(declare-fun m!873427 () Bool)

(assert (=> b!938494 m!873427))

(declare-fun m!873429 () Bool)

(assert (=> b!938494 m!873429))

(declare-fun m!873431 () Bool)

(assert (=> b!938494 m!873431))

(declare-fun m!873433 () Bool)

(assert (=> b!938494 m!873433))

(declare-fun m!873435 () Bool)

(assert (=> b!938494 m!873435))

(assert (=> b!938494 m!873413))

(assert (=> b!938494 m!873403))

(declare-fun m!873437 () Bool)

(assert (=> b!938494 m!873437))

(declare-fun m!873439 () Bool)

(assert (=> b!938494 m!873439))

(assert (=> b!938494 m!873427))

(assert (=> b!938494 m!873431))

(declare-fun m!873441 () Bool)

(assert (=> b!938494 m!873441))

(assert (=> b!938494 m!873441))

(declare-fun m!873443 () Bool)

(assert (=> b!938494 m!873443))

(declare-fun m!873445 () Bool)

(assert (=> bm!40842 m!873445))

(declare-fun m!873447 () Bool)

(assert (=> b!938487 m!873447))

(declare-fun m!873449 () Bool)

(assert (=> bm!40846 m!873449))

(assert (=> b!938488 m!873403))

(assert (=> b!938488 m!873403))

(declare-fun m!873451 () Bool)

(assert (=> b!938488 m!873451))

(assert (=> b!938485 m!873403))

(assert (=> b!938485 m!873403))

(declare-fun m!873453 () Bool)

(assert (=> b!938485 m!873453))

(declare-fun m!873455 () Bool)

(assert (=> b!938482 m!873455))

(assert (=> bm!40844 m!873425))

(assert (=> b!938474 m!873403))

(assert (=> b!938474 m!873403))

(assert (=> b!938474 m!873451))

(assert (=> b!938288 d!113491))

(assert (=> b!938288 d!113459))

(declare-fun d!113493 () Bool)

(assert (=> d!113493 (= (apply!851 lt!423679 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14331 (getValueByKey!487 (toList!6077 lt!423679) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26322 () Bool)

(assert (= bs!26322 d!113493))

(declare-fun m!873457 () Bool)

(assert (=> bs!26322 m!873457))

(assert (=> bs!26322 m!873457))

(declare-fun m!873459 () Bool)

(assert (=> bs!26322 m!873459))

(assert (=> b!938355 d!113493))

(declare-fun b!938519 () Bool)

(declare-fun e!527095 () ListLongMap!12123)

(declare-fun e!527092 () ListLongMap!12123)

(assert (=> b!938519 (= e!527095 e!527092)))

(declare-fun c!97809 () Bool)

(assert (=> b!938519 (= c!97809 (validKeyInArray!0 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!938520 () Bool)

(assert (=> b!938520 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27619 _keys!1487)))))

(assert (=> b!938520 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27618 _values!1231)))))

(declare-fun lt!423815 () ListLongMap!12123)

(declare-fun e!527093 () Bool)

(assert (=> b!938520 (= e!527093 (= (apply!851 lt!423815 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14330 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!938521 () Bool)

(declare-fun e!527096 () Bool)

(assert (=> b!938521 (= e!527096 (= lt!423815 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235)))))

(declare-fun b!938522 () Bool)

(declare-fun e!527097 () Bool)

(assert (=> b!938522 (= e!527097 e!527096)))

(declare-fun c!97808 () Bool)

(assert (=> b!938522 (= c!97808 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27619 _keys!1487)))))

(declare-fun b!938523 () Bool)

(declare-fun call!40853 () ListLongMap!12123)

(assert (=> b!938523 (= e!527092 call!40853)))

(declare-fun b!938524 () Bool)

(declare-fun e!527094 () Bool)

(assert (=> b!938524 (= e!527094 e!527097)))

(declare-fun c!97806 () Bool)

(declare-fun e!527091 () Bool)

(assert (=> b!938524 (= c!97806 e!527091)))

(declare-fun res!631435 () Bool)

(assert (=> b!938524 (=> (not res!631435) (not e!527091))))

(assert (=> b!938524 (= res!631435 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27619 _keys!1487)))))

(declare-fun b!938525 () Bool)

(assert (=> b!938525 (= e!527091 (validKeyInArray!0 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938525 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!938526 () Bool)

(declare-fun isEmpty!703 (ListLongMap!12123) Bool)

(assert (=> b!938526 (= e!527096 (isEmpty!703 lt!423815))))

(declare-fun b!938527 () Bool)

(assert (=> b!938527 (= e!527095 (ListLongMap!12124 Nil!19176))))

(declare-fun d!113495 () Bool)

(assert (=> d!113495 e!527094))

(declare-fun res!631433 () Bool)

(assert (=> d!113495 (=> (not res!631433) (not e!527094))))

(assert (=> d!113495 (= res!631433 (not (contains!5081 lt!423815 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!113495 (= lt!423815 e!527095)))

(declare-fun c!97807 () Bool)

(assert (=> d!113495 (= c!97807 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27619 _keys!1487)))))

(assert (=> d!113495 (validMask!0 mask!1881)))

(assert (=> d!113495 (= (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!423815)))

(declare-fun b!938528 () Bool)

(declare-fun res!631436 () Bool)

(assert (=> b!938528 (=> (not res!631436) (not e!527094))))

(assert (=> b!938528 (= res!631436 (not (contains!5081 lt!423815 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!40850 () Bool)

(assert (=> bm!40850 (= call!40853 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!938529 () Bool)

(declare-fun lt!423809 () Unit!31596)

(declare-fun lt!423811 () Unit!31596)

(assert (=> b!938529 (= lt!423809 lt!423811)))

(declare-fun lt!423813 () (_ BitVec 64))

(declare-fun lt!423810 () (_ BitVec 64))

(declare-fun lt!423812 () ListLongMap!12123)

(declare-fun lt!423814 () V!31983)

(assert (=> b!938529 (not (contains!5081 (+!2865 lt!423812 (tuple2!13437 lt!423810 lt!423814)) lt!423813))))

(declare-fun addStillNotContains!222 (ListLongMap!12123 (_ BitVec 64) V!31983 (_ BitVec 64)) Unit!31596)

(assert (=> b!938529 (= lt!423811 (addStillNotContains!222 lt!423812 lt!423810 lt!423814 lt!423813))))

(assert (=> b!938529 (= lt!423813 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!938529 (= lt!423814 (get!14330 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!938529 (= lt!423810 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!938529 (= lt!423812 call!40853)))

(assert (=> b!938529 (= e!527092 (+!2865 call!40853 (tuple2!13437 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14330 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!938530 () Bool)

(assert (=> b!938530 (= e!527097 e!527093)))

(assert (=> b!938530 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27619 _keys!1487)))))

(declare-fun res!631434 () Bool)

(assert (=> b!938530 (= res!631434 (contains!5081 lt!423815 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938530 (=> (not res!631434) (not e!527093))))

(assert (= (and d!113495 c!97807) b!938527))

(assert (= (and d!113495 (not c!97807)) b!938519))

(assert (= (and b!938519 c!97809) b!938529))

(assert (= (and b!938519 (not c!97809)) b!938523))

(assert (= (or b!938529 b!938523) bm!40850))

(assert (= (and d!113495 res!631433) b!938528))

(assert (= (and b!938528 res!631436) b!938524))

(assert (= (and b!938524 res!631435) b!938525))

(assert (= (and b!938524 c!97806) b!938530))

(assert (= (and b!938524 (not c!97806)) b!938522))

(assert (= (and b!938530 res!631434) b!938520))

(assert (= (and b!938522 c!97808) b!938521))

(assert (= (and b!938522 (not c!97808)) b!938526))

(declare-fun b_lambda!14219 () Bool)

(assert (=> (not b_lambda!14219) (not b!938520)))

(assert (=> b!938520 t!27468))

(declare-fun b_and!29121 () Bool)

(assert (= b_and!29119 (and (=> t!27468 result!12125) b_and!29121)))

(declare-fun b_lambda!14221 () Bool)

(assert (=> (not b_lambda!14221) (not b!938529)))

(assert (=> b!938529 t!27468))

(declare-fun b_and!29123 () Bool)

(assert (= b_and!29121 (and (=> t!27468 result!12125) b_and!29123)))

(declare-fun m!873461 () Bool)

(assert (=> d!113495 m!873461))

(assert (=> d!113495 m!872943))

(declare-fun m!873463 () Bool)

(assert (=> b!938526 m!873463))

(declare-fun m!873465 () Bool)

(assert (=> b!938529 m!873465))

(declare-fun m!873467 () Bool)

(assert (=> b!938529 m!873467))

(declare-fun m!873469 () Bool)

(assert (=> b!938529 m!873469))

(assert (=> b!938529 m!872969))

(declare-fun m!873471 () Bool)

(assert (=> b!938529 m!873471))

(assert (=> b!938529 m!872967))

(assert (=> b!938529 m!873467))

(assert (=> b!938529 m!872993))

(assert (=> b!938529 m!872969))

(assert (=> b!938529 m!872967))

(assert (=> b!938529 m!872971))

(assert (=> b!938519 m!872993))

(assert (=> b!938519 m!872993))

(assert (=> b!938519 m!873155))

(assert (=> b!938530 m!872993))

(assert (=> b!938530 m!872993))

(declare-fun m!873473 () Bool)

(assert (=> b!938530 m!873473))

(assert (=> b!938521 m!873425))

(assert (=> b!938525 m!872993))

(assert (=> b!938525 m!872993))

(assert (=> b!938525 m!873155))

(assert (=> bm!40850 m!873425))

(assert (=> b!938520 m!872967))

(assert (=> b!938520 m!872993))

(assert (=> b!938520 m!872969))

(assert (=> b!938520 m!872967))

(assert (=> b!938520 m!872971))

(assert (=> b!938520 m!872993))

(declare-fun m!873475 () Bool)

(assert (=> b!938520 m!873475))

(assert (=> b!938520 m!872969))

(declare-fun m!873477 () Bool)

(assert (=> b!938528 m!873477))

(assert (=> bm!40819 d!113495))

(declare-fun d!113497 () Bool)

(declare-fun e!527098 () Bool)

(assert (=> d!113497 e!527098))

(declare-fun res!631438 () Bool)

(assert (=> d!113497 (=> (not res!631438) (not e!527098))))

(declare-fun lt!423819 () ListLongMap!12123)

(assert (=> d!113497 (= res!631438 (contains!5081 lt!423819 (_1!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun lt!423816 () List!19179)

(assert (=> d!113497 (= lt!423819 (ListLongMap!12124 lt!423816))))

(declare-fun lt!423817 () Unit!31596)

(declare-fun lt!423818 () Unit!31596)

(assert (=> d!113497 (= lt!423817 lt!423818)))

(assert (=> d!113497 (= (getValueByKey!487 lt!423816 (_1!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!492 (_2!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113497 (= lt!423818 (lemmaContainsTupThenGetReturnValue!261 lt!423816 (_1!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113497 (= lt!423816 (insertStrictlySorted!318 (toList!6077 call!40832) (_1!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113497 (= (+!2865 call!40832 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) lt!423819)))

(declare-fun b!938531 () Bool)

(declare-fun res!631437 () Bool)

(assert (=> b!938531 (=> (not res!631437) (not e!527098))))

(assert (=> b!938531 (= res!631437 (= (getValueByKey!487 (toList!6077 lt!423819) (_1!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!492 (_2!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun b!938532 () Bool)

(assert (=> b!938532 (= e!527098 (contains!5082 (toList!6077 lt!423819) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(assert (= (and d!113497 res!631438) b!938531))

(assert (= (and b!938531 res!631437) b!938532))

(declare-fun m!873479 () Bool)

(assert (=> d!113497 m!873479))

(declare-fun m!873481 () Bool)

(assert (=> d!113497 m!873481))

(declare-fun m!873483 () Bool)

(assert (=> d!113497 m!873483))

(declare-fun m!873485 () Bool)

(assert (=> d!113497 m!873485))

(declare-fun m!873487 () Bool)

(assert (=> b!938531 m!873487))

(declare-fun m!873489 () Bool)

(assert (=> b!938532 m!873489))

(assert (=> b!938390 d!113497))

(declare-fun d!113499 () Bool)

(assert (=> d!113499 (= (get!14331 (getValueByKey!487 (toList!6077 lt!423511) k0!1099)) (v!12712 (getValueByKey!487 (toList!6077 lt!423511) k0!1099)))))

(assert (=> d!113445 d!113499))

(declare-fun b!938543 () Bool)

(declare-fun e!527104 () Option!493)

(assert (=> b!938543 (= e!527104 (getValueByKey!487 (t!27469 (toList!6077 lt!423511)) k0!1099))))

(declare-fun b!938542 () Bool)

(declare-fun e!527103 () Option!493)

(assert (=> b!938542 (= e!527103 e!527104)))

(declare-fun c!97815 () Bool)

(assert (=> b!938542 (= c!97815 (and ((_ is Cons!19175) (toList!6077 lt!423511)) (not (= (_1!6729 (h!20321 (toList!6077 lt!423511))) k0!1099))))))

(declare-fun d!113501 () Bool)

(declare-fun c!97814 () Bool)

(assert (=> d!113501 (= c!97814 (and ((_ is Cons!19175) (toList!6077 lt!423511)) (= (_1!6729 (h!20321 (toList!6077 lt!423511))) k0!1099)))))

(assert (=> d!113501 (= (getValueByKey!487 (toList!6077 lt!423511) k0!1099) e!527103)))

(declare-fun b!938541 () Bool)

(assert (=> b!938541 (= e!527103 (Some!492 (_2!6729 (h!20321 (toList!6077 lt!423511)))))))

(declare-fun b!938544 () Bool)

(assert (=> b!938544 (= e!527104 None!491)))

(assert (= (and d!113501 c!97814) b!938541))

(assert (= (and d!113501 (not c!97814)) b!938542))

(assert (= (and b!938542 c!97815) b!938543))

(assert (= (and b!938542 (not c!97815)) b!938544))

(declare-fun m!873491 () Bool)

(assert (=> b!938543 m!873491))

(assert (=> d!113445 d!113501))

(declare-fun d!113503 () Bool)

(declare-fun e!527105 () Bool)

(assert (=> d!113503 e!527105))

(declare-fun res!631439 () Bool)

(assert (=> d!113503 (=> res!631439 e!527105)))

(declare-fun lt!423820 () Bool)

(assert (=> d!113503 (= res!631439 (not lt!423820))))

(declare-fun lt!423821 () Bool)

(assert (=> d!113503 (= lt!423820 lt!423821)))

(declare-fun lt!423822 () Unit!31596)

(declare-fun e!527106 () Unit!31596)

(assert (=> d!113503 (= lt!423822 e!527106)))

(declare-fun c!97816 () Bool)

(assert (=> d!113503 (= c!97816 lt!423821)))

(assert (=> d!113503 (= lt!423821 (containsKey!451 (toList!6077 lt!423713) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113503 (= (contains!5081 lt!423713 #b0000000000000000000000000000000000000000000000000000000000000000) lt!423820)))

(declare-fun b!938545 () Bool)

(declare-fun lt!423823 () Unit!31596)

(assert (=> b!938545 (= e!527106 lt!423823)))

(assert (=> b!938545 (= lt!423823 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6077 lt!423713) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938545 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423713) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938546 () Bool)

(declare-fun Unit!31607 () Unit!31596)

(assert (=> b!938546 (= e!527106 Unit!31607)))

(declare-fun b!938547 () Bool)

(assert (=> b!938547 (= e!527105 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423713) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113503 c!97816) b!938545))

(assert (= (and d!113503 (not c!97816)) b!938546))

(assert (= (and d!113503 (not res!631439)) b!938547))

(declare-fun m!873493 () Bool)

(assert (=> d!113503 m!873493))

(declare-fun m!873495 () Bool)

(assert (=> b!938545 m!873495))

(declare-fun m!873497 () Bool)

(assert (=> b!938545 m!873497))

(assert (=> b!938545 m!873497))

(declare-fun m!873499 () Bool)

(assert (=> b!938545 m!873499))

(assert (=> b!938547 m!873497))

(assert (=> b!938547 m!873497))

(assert (=> b!938547 m!873499))

(assert (=> bm!40828 d!113503))

(declare-fun d!113505 () Bool)

(assert (=> d!113505 (= (validKeyInArray!0 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (and (not (= (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938302 d!113505))

(declare-fun d!113507 () Bool)

(declare-fun e!527107 () Bool)

(assert (=> d!113507 e!527107))

(declare-fun res!631440 () Bool)

(assert (=> d!113507 (=> res!631440 e!527107)))

(declare-fun lt!423824 () Bool)

(assert (=> d!113507 (= res!631440 (not lt!423824))))

(declare-fun lt!423825 () Bool)

(assert (=> d!113507 (= lt!423824 lt!423825)))

(declare-fun lt!423826 () Unit!31596)

(declare-fun e!527108 () Unit!31596)

(assert (=> d!113507 (= lt!423826 e!527108)))

(declare-fun c!97817 () Bool)

(assert (=> d!113507 (= c!97817 lt!423825)))

(assert (=> d!113507 (= lt!423825 (containsKey!451 (toList!6077 lt!423607) (_1!6729 lt!423508)))))

(assert (=> d!113507 (= (contains!5081 lt!423607 (_1!6729 lt!423508)) lt!423824)))

(declare-fun b!938548 () Bool)

(declare-fun lt!423827 () Unit!31596)

(assert (=> b!938548 (= e!527108 lt!423827)))

(assert (=> b!938548 (= lt!423827 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6077 lt!423607) (_1!6729 lt!423508)))))

(assert (=> b!938548 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423607) (_1!6729 lt!423508)))))

(declare-fun b!938549 () Bool)

(declare-fun Unit!31608 () Unit!31596)

(assert (=> b!938549 (= e!527108 Unit!31608)))

(declare-fun b!938550 () Bool)

(assert (=> b!938550 (= e!527107 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423607) (_1!6729 lt!423508))))))

(assert (= (and d!113507 c!97817) b!938548))

(assert (= (and d!113507 (not c!97817)) b!938549))

(assert (= (and d!113507 (not res!631440)) b!938550))

(declare-fun m!873501 () Bool)

(assert (=> d!113507 m!873501))

(declare-fun m!873503 () Bool)

(assert (=> b!938548 m!873503))

(assert (=> b!938548 m!873131))

(assert (=> b!938548 m!873131))

(declare-fun m!873505 () Bool)

(assert (=> b!938548 m!873505))

(assert (=> b!938550 m!873131))

(assert (=> b!938550 m!873131))

(assert (=> b!938550 m!873505))

(assert (=> d!113435 d!113507))

(declare-fun b!938553 () Bool)

(declare-fun e!527110 () Option!493)

(assert (=> b!938553 (= e!527110 (getValueByKey!487 (t!27469 lt!423604) (_1!6729 lt!423508)))))

(declare-fun b!938552 () Bool)

(declare-fun e!527109 () Option!493)

(assert (=> b!938552 (= e!527109 e!527110)))

(declare-fun c!97819 () Bool)

(assert (=> b!938552 (= c!97819 (and ((_ is Cons!19175) lt!423604) (not (= (_1!6729 (h!20321 lt!423604)) (_1!6729 lt!423508)))))))

(declare-fun d!113509 () Bool)

(declare-fun c!97818 () Bool)

(assert (=> d!113509 (= c!97818 (and ((_ is Cons!19175) lt!423604) (= (_1!6729 (h!20321 lt!423604)) (_1!6729 lt!423508))))))

(assert (=> d!113509 (= (getValueByKey!487 lt!423604 (_1!6729 lt!423508)) e!527109)))

(declare-fun b!938551 () Bool)

(assert (=> b!938551 (= e!527109 (Some!492 (_2!6729 (h!20321 lt!423604))))))

(declare-fun b!938554 () Bool)

(assert (=> b!938554 (= e!527110 None!491)))

(assert (= (and d!113509 c!97818) b!938551))

(assert (= (and d!113509 (not c!97818)) b!938552))

(assert (= (and b!938552 c!97819) b!938553))

(assert (= (and b!938552 (not c!97819)) b!938554))

(declare-fun m!873507 () Bool)

(assert (=> b!938553 m!873507))

(assert (=> d!113435 d!113509))

(declare-fun d!113511 () Bool)

(assert (=> d!113511 (= (getValueByKey!487 lt!423604 (_1!6729 lt!423508)) (Some!492 (_2!6729 lt!423508)))))

(declare-fun lt!423830 () Unit!31596)

(declare-fun choose!1572 (List!19179 (_ BitVec 64) V!31983) Unit!31596)

(assert (=> d!113511 (= lt!423830 (choose!1572 lt!423604 (_1!6729 lt!423508) (_2!6729 lt!423508)))))

(declare-fun e!527113 () Bool)

(assert (=> d!113511 e!527113))

(declare-fun res!631445 () Bool)

(assert (=> d!113511 (=> (not res!631445) (not e!527113))))

(declare-fun isStrictlySorted!500 (List!19179) Bool)

(assert (=> d!113511 (= res!631445 (isStrictlySorted!500 lt!423604))))

(assert (=> d!113511 (= (lemmaContainsTupThenGetReturnValue!261 lt!423604 (_1!6729 lt!423508) (_2!6729 lt!423508)) lt!423830)))

(declare-fun b!938559 () Bool)

(declare-fun res!631446 () Bool)

(assert (=> b!938559 (=> (not res!631446) (not e!527113))))

(assert (=> b!938559 (= res!631446 (containsKey!451 lt!423604 (_1!6729 lt!423508)))))

(declare-fun b!938560 () Bool)

(assert (=> b!938560 (= e!527113 (contains!5082 lt!423604 (tuple2!13437 (_1!6729 lt!423508) (_2!6729 lt!423508))))))

(assert (= (and d!113511 res!631445) b!938559))

(assert (= (and b!938559 res!631446) b!938560))

(assert (=> d!113511 m!873125))

(declare-fun m!873509 () Bool)

(assert (=> d!113511 m!873509))

(declare-fun m!873511 () Bool)

(assert (=> d!113511 m!873511))

(declare-fun m!873513 () Bool)

(assert (=> b!938559 m!873513))

(declare-fun m!873515 () Bool)

(assert (=> b!938560 m!873515))

(assert (=> d!113435 d!113511))

(declare-fun b!938581 () Bool)

(declare-fun e!527125 () List!19179)

(assert (=> b!938581 (= e!527125 (insertStrictlySorted!318 (t!27469 (toList!6077 lt!423502)) (_1!6729 lt!423508) (_2!6729 lt!423508)))))

(declare-fun b!938582 () Bool)

(declare-fun e!527127 () List!19179)

(declare-fun call!40862 () List!19179)

(assert (=> b!938582 (= e!527127 call!40862)))

(declare-fun b!938583 () Bool)

(declare-fun e!527128 () List!19179)

(declare-fun e!527124 () List!19179)

(assert (=> b!938583 (= e!527128 e!527124)))

(declare-fun c!97830 () Bool)

(assert (=> b!938583 (= c!97830 (and ((_ is Cons!19175) (toList!6077 lt!423502)) (= (_1!6729 (h!20321 (toList!6077 lt!423502))) (_1!6729 lt!423508))))))

(declare-fun b!938585 () Bool)

(declare-fun c!97828 () Bool)

(assert (=> b!938585 (= e!527125 (ite c!97830 (t!27469 (toList!6077 lt!423502)) (ite c!97828 (Cons!19175 (h!20321 (toList!6077 lt!423502)) (t!27469 (toList!6077 lt!423502))) Nil!19176)))))

(declare-fun call!40860 () List!19179)

(declare-fun c!97829 () Bool)

(declare-fun bm!40857 () Bool)

(declare-fun $colon$colon!554 (List!19179 tuple2!13436) List!19179)

(assert (=> bm!40857 (= call!40860 ($colon$colon!554 e!527125 (ite c!97829 (h!20321 (toList!6077 lt!423502)) (tuple2!13437 (_1!6729 lt!423508) (_2!6729 lt!423508)))))))

(declare-fun c!97831 () Bool)

(assert (=> bm!40857 (= c!97831 c!97829)))

(declare-fun b!938586 () Bool)

(assert (=> b!938586 (= e!527128 call!40860)))

(declare-fun b!938587 () Bool)

(declare-fun res!631451 () Bool)

(declare-fun e!527126 () Bool)

(assert (=> b!938587 (=> (not res!631451) (not e!527126))))

(declare-fun lt!423833 () List!19179)

(assert (=> b!938587 (= res!631451 (containsKey!451 lt!423833 (_1!6729 lt!423508)))))

(declare-fun bm!40858 () Bool)

(declare-fun call!40861 () List!19179)

(assert (=> bm!40858 (= call!40861 call!40860)))

(declare-fun bm!40859 () Bool)

(assert (=> bm!40859 (= call!40862 call!40861)))

(declare-fun b!938588 () Bool)

(assert (=> b!938588 (= c!97828 (and ((_ is Cons!19175) (toList!6077 lt!423502)) (bvsgt (_1!6729 (h!20321 (toList!6077 lt!423502))) (_1!6729 lt!423508))))))

(assert (=> b!938588 (= e!527124 e!527127)))

(declare-fun d!113513 () Bool)

(assert (=> d!113513 e!527126))

(declare-fun res!631452 () Bool)

(assert (=> d!113513 (=> (not res!631452) (not e!527126))))

(assert (=> d!113513 (= res!631452 (isStrictlySorted!500 lt!423833))))

(assert (=> d!113513 (= lt!423833 e!527128)))

(assert (=> d!113513 (= c!97829 (and ((_ is Cons!19175) (toList!6077 lt!423502)) (bvslt (_1!6729 (h!20321 (toList!6077 lt!423502))) (_1!6729 lt!423508))))))

(assert (=> d!113513 (isStrictlySorted!500 (toList!6077 lt!423502))))

(assert (=> d!113513 (= (insertStrictlySorted!318 (toList!6077 lt!423502) (_1!6729 lt!423508) (_2!6729 lt!423508)) lt!423833)))

(declare-fun b!938584 () Bool)

(assert (=> b!938584 (= e!527127 call!40862)))

(declare-fun b!938589 () Bool)

(assert (=> b!938589 (= e!527124 call!40861)))

(declare-fun b!938590 () Bool)

(assert (=> b!938590 (= e!527126 (contains!5082 lt!423833 (tuple2!13437 (_1!6729 lt!423508) (_2!6729 lt!423508))))))

(assert (= (and d!113513 c!97829) b!938586))

(assert (= (and d!113513 (not c!97829)) b!938583))

(assert (= (and b!938583 c!97830) b!938589))

(assert (= (and b!938583 (not c!97830)) b!938588))

(assert (= (and b!938588 c!97828) b!938582))

(assert (= (and b!938588 (not c!97828)) b!938584))

(assert (= (or b!938582 b!938584) bm!40859))

(assert (= (or b!938589 bm!40859) bm!40858))

(assert (= (or b!938586 bm!40858) bm!40857))

(assert (= (and bm!40857 c!97831) b!938581))

(assert (= (and bm!40857 (not c!97831)) b!938585))

(assert (= (and d!113513 res!631452) b!938587))

(assert (= (and b!938587 res!631451) b!938590))

(declare-fun m!873517 () Bool)

(assert (=> bm!40857 m!873517))

(declare-fun m!873519 () Bool)

(assert (=> b!938590 m!873519))

(declare-fun m!873521 () Bool)

(assert (=> d!113513 m!873521))

(declare-fun m!873523 () Bool)

(assert (=> d!113513 m!873523))

(declare-fun m!873525 () Bool)

(assert (=> b!938587 m!873525))

(declare-fun m!873527 () Bool)

(assert (=> b!938581 m!873527))

(assert (=> d!113435 d!113513))

(declare-fun d!113515 () Bool)

(assert (=> d!113515 (= (validKeyInArray!0 (select (arr!27158 _keys!1487) #b00000000000000000000000000000000)) (and (not (= (select (arr!27158 _keys!1487) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27158 _keys!1487) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938450 d!113515))

(declare-fun d!113517 () Bool)

(declare-fun e!527129 () Bool)

(assert (=> d!113517 e!527129))

(declare-fun res!631454 () Bool)

(assert (=> d!113517 (=> (not res!631454) (not e!527129))))

(declare-fun lt!423837 () ListLongMap!12123)

(assert (=> d!113517 (= res!631454 (contains!5081 lt!423837 (_1!6729 (ite (or c!97783 c!97782) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun lt!423834 () List!19179)

(assert (=> d!113517 (= lt!423837 (ListLongMap!12124 lt!423834))))

(declare-fun lt!423835 () Unit!31596)

(declare-fun lt!423836 () Unit!31596)

(assert (=> d!113517 (= lt!423835 lt!423836)))

(assert (=> d!113517 (= (getValueByKey!487 lt!423834 (_1!6729 (ite (or c!97783 c!97782) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!492 (_2!6729 (ite (or c!97783 c!97782) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113517 (= lt!423836 (lemmaContainsTupThenGetReturnValue!261 lt!423834 (_1!6729 (ite (or c!97783 c!97782) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6729 (ite (or c!97783 c!97782) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113517 (= lt!423834 (insertStrictlySorted!318 (toList!6077 (ite c!97783 call!40837 (ite c!97782 call!40836 call!40838))) (_1!6729 (ite (or c!97783 c!97782) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6729 (ite (or c!97783 c!97782) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113517 (= (+!2865 (ite c!97783 call!40837 (ite c!97782 call!40836 call!40838)) (ite (or c!97783 c!97782) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) lt!423837)))

(declare-fun b!938591 () Bool)

(declare-fun res!631453 () Bool)

(assert (=> b!938591 (=> (not res!631453) (not e!527129))))

(assert (=> b!938591 (= res!631453 (= (getValueByKey!487 (toList!6077 lt!423837) (_1!6729 (ite (or c!97783 c!97782) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!492 (_2!6729 (ite (or c!97783 c!97782) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))))

(declare-fun b!938592 () Bool)

(assert (=> b!938592 (= e!527129 (contains!5082 (toList!6077 lt!423837) (ite (or c!97783 c!97782) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (= (and d!113517 res!631454) b!938591))

(assert (= (and b!938591 res!631453) b!938592))

(declare-fun m!873529 () Bool)

(assert (=> d!113517 m!873529))

(declare-fun m!873531 () Bool)

(assert (=> d!113517 m!873531))

(declare-fun m!873533 () Bool)

(assert (=> d!113517 m!873533))

(declare-fun m!873535 () Bool)

(assert (=> d!113517 m!873535))

(declare-fun m!873537 () Bool)

(assert (=> b!938591 m!873537))

(declare-fun m!873539 () Bool)

(assert (=> b!938592 m!873539))

(assert (=> bm!40831 d!113517))

(assert (=> b!938367 d!113495))

(declare-fun d!113519 () Bool)

(assert (=> d!113519 (= (apply!851 (+!2865 lt!423670 (tuple2!13437 lt!423665 minValue!1173)) lt!423666) (get!14331 (getValueByKey!487 (toList!6077 (+!2865 lt!423670 (tuple2!13437 lt!423665 minValue!1173))) lt!423666)))))

(declare-fun bs!26323 () Bool)

(assert (= bs!26323 d!113519))

(declare-fun m!873541 () Bool)

(assert (=> bs!26323 m!873541))

(assert (=> bs!26323 m!873541))

(declare-fun m!873543 () Bool)

(assert (=> bs!26323 m!873543))

(assert (=> b!938367 d!113519))

(declare-fun d!113521 () Bool)

(declare-fun e!527130 () Bool)

(assert (=> d!113521 e!527130))

(declare-fun res!631456 () Bool)

(assert (=> d!113521 (=> (not res!631456) (not e!527130))))

(declare-fun lt!423841 () ListLongMap!12123)

(assert (=> d!113521 (= res!631456 (contains!5081 lt!423841 (_1!6729 (tuple2!13437 lt!423665 minValue!1173))))))

(declare-fun lt!423838 () List!19179)

(assert (=> d!113521 (= lt!423841 (ListLongMap!12124 lt!423838))))

(declare-fun lt!423839 () Unit!31596)

(declare-fun lt!423840 () Unit!31596)

(assert (=> d!113521 (= lt!423839 lt!423840)))

(assert (=> d!113521 (= (getValueByKey!487 lt!423838 (_1!6729 (tuple2!13437 lt!423665 minValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423665 minValue!1173))))))

(assert (=> d!113521 (= lt!423840 (lemmaContainsTupThenGetReturnValue!261 lt!423838 (_1!6729 (tuple2!13437 lt!423665 minValue!1173)) (_2!6729 (tuple2!13437 lt!423665 minValue!1173))))))

(assert (=> d!113521 (= lt!423838 (insertStrictlySorted!318 (toList!6077 lt!423670) (_1!6729 (tuple2!13437 lt!423665 minValue!1173)) (_2!6729 (tuple2!13437 lt!423665 minValue!1173))))))

(assert (=> d!113521 (= (+!2865 lt!423670 (tuple2!13437 lt!423665 minValue!1173)) lt!423841)))

(declare-fun b!938593 () Bool)

(declare-fun res!631455 () Bool)

(assert (=> b!938593 (=> (not res!631455) (not e!527130))))

(assert (=> b!938593 (= res!631455 (= (getValueByKey!487 (toList!6077 lt!423841) (_1!6729 (tuple2!13437 lt!423665 minValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423665 minValue!1173)))))))

(declare-fun b!938594 () Bool)

(assert (=> b!938594 (= e!527130 (contains!5082 (toList!6077 lt!423841) (tuple2!13437 lt!423665 minValue!1173)))))

(assert (= (and d!113521 res!631456) b!938593))

(assert (= (and b!938593 res!631455) b!938594))

(declare-fun m!873545 () Bool)

(assert (=> d!113521 m!873545))

(declare-fun m!873547 () Bool)

(assert (=> d!113521 m!873547))

(declare-fun m!873549 () Bool)

(assert (=> d!113521 m!873549))

(declare-fun m!873551 () Bool)

(assert (=> d!113521 m!873551))

(declare-fun m!873553 () Bool)

(assert (=> b!938593 m!873553))

(declare-fun m!873555 () Bool)

(assert (=> b!938594 m!873555))

(assert (=> b!938367 d!113521))

(declare-fun d!113523 () Bool)

(assert (=> d!113523 (= (apply!851 (+!2865 lt!423669 (tuple2!13437 lt!423684 minValue!1173)) lt!423668) (apply!851 lt!423669 lt!423668))))

(declare-fun lt!423842 () Unit!31596)

(assert (=> d!113523 (= lt!423842 (choose!1571 lt!423669 lt!423684 minValue!1173 lt!423668))))

(declare-fun e!527131 () Bool)

(assert (=> d!113523 e!527131))

(declare-fun res!631457 () Bool)

(assert (=> d!113523 (=> (not res!631457) (not e!527131))))

(assert (=> d!113523 (= res!631457 (contains!5081 lt!423669 lt!423668))))

(assert (=> d!113523 (= (addApplyDifferent!434 lt!423669 lt!423684 minValue!1173 lt!423668) lt!423842)))

(declare-fun b!938595 () Bool)

(assert (=> b!938595 (= e!527131 (not (= lt!423668 lt!423684)))))

(assert (= (and d!113523 res!631457) b!938595))

(declare-fun m!873557 () Bool)

(assert (=> d!113523 m!873557))

(assert (=> d!113523 m!873195))

(assert (=> d!113523 m!873185))

(assert (=> d!113523 m!873195))

(assert (=> d!113523 m!873197))

(declare-fun m!873559 () Bool)

(assert (=> d!113523 m!873559))

(assert (=> b!938367 d!113523))

(declare-fun d!113525 () Bool)

(assert (=> d!113525 (= (apply!851 (+!2865 lt!423669 (tuple2!13437 lt!423684 minValue!1173)) lt!423668) (get!14331 (getValueByKey!487 (toList!6077 (+!2865 lt!423669 (tuple2!13437 lt!423684 minValue!1173))) lt!423668)))))

(declare-fun bs!26324 () Bool)

(assert (= bs!26324 d!113525))

(declare-fun m!873561 () Bool)

(assert (=> bs!26324 m!873561))

(assert (=> bs!26324 m!873561))

(declare-fun m!873563 () Bool)

(assert (=> bs!26324 m!873563))

(assert (=> b!938367 d!113525))

(declare-fun d!113527 () Bool)

(assert (=> d!113527 (= (apply!851 (+!2865 lt!423682 (tuple2!13437 lt!423675 zeroValue!1173)) lt!423680) (get!14331 (getValueByKey!487 (toList!6077 (+!2865 lt!423682 (tuple2!13437 lt!423675 zeroValue!1173))) lt!423680)))))

(declare-fun bs!26325 () Bool)

(assert (= bs!26325 d!113527))

(declare-fun m!873565 () Bool)

(assert (=> bs!26325 m!873565))

(assert (=> bs!26325 m!873565))

(declare-fun m!873567 () Bool)

(assert (=> bs!26325 m!873567))

(assert (=> b!938367 d!113527))

(declare-fun d!113529 () Bool)

(assert (=> d!113529 (= (apply!851 lt!423670 lt!423666) (get!14331 (getValueByKey!487 (toList!6077 lt!423670) lt!423666)))))

(declare-fun bs!26326 () Bool)

(assert (= bs!26326 d!113529))

(declare-fun m!873569 () Bool)

(assert (=> bs!26326 m!873569))

(assert (=> bs!26326 m!873569))

(declare-fun m!873571 () Bool)

(assert (=> bs!26326 m!873571))

(assert (=> b!938367 d!113529))

(declare-fun d!113531 () Bool)

(assert (=> d!113531 (= (apply!851 lt!423682 lt!423680) (get!14331 (getValueByKey!487 (toList!6077 lt!423682) lt!423680)))))

(declare-fun bs!26327 () Bool)

(assert (= bs!26327 d!113531))

(declare-fun m!873573 () Bool)

(assert (=> bs!26327 m!873573))

(assert (=> bs!26327 m!873573))

(declare-fun m!873575 () Bool)

(assert (=> bs!26327 m!873575))

(assert (=> b!938367 d!113531))

(declare-fun d!113533 () Bool)

(declare-fun e!527132 () Bool)

(assert (=> d!113533 e!527132))

(declare-fun res!631459 () Bool)

(assert (=> d!113533 (=> (not res!631459) (not e!527132))))

(declare-fun lt!423846 () ListLongMap!12123)

(assert (=> d!113533 (= res!631459 (contains!5081 lt!423846 (_1!6729 (tuple2!13437 lt!423675 zeroValue!1173))))))

(declare-fun lt!423843 () List!19179)

(assert (=> d!113533 (= lt!423846 (ListLongMap!12124 lt!423843))))

(declare-fun lt!423844 () Unit!31596)

(declare-fun lt!423845 () Unit!31596)

(assert (=> d!113533 (= lt!423844 lt!423845)))

(assert (=> d!113533 (= (getValueByKey!487 lt!423843 (_1!6729 (tuple2!13437 lt!423675 zeroValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423675 zeroValue!1173))))))

(assert (=> d!113533 (= lt!423845 (lemmaContainsTupThenGetReturnValue!261 lt!423843 (_1!6729 (tuple2!13437 lt!423675 zeroValue!1173)) (_2!6729 (tuple2!13437 lt!423675 zeroValue!1173))))))

(assert (=> d!113533 (= lt!423843 (insertStrictlySorted!318 (toList!6077 lt!423682) (_1!6729 (tuple2!13437 lt!423675 zeroValue!1173)) (_2!6729 (tuple2!13437 lt!423675 zeroValue!1173))))))

(assert (=> d!113533 (= (+!2865 lt!423682 (tuple2!13437 lt!423675 zeroValue!1173)) lt!423846)))

(declare-fun b!938596 () Bool)

(declare-fun res!631458 () Bool)

(assert (=> b!938596 (=> (not res!631458) (not e!527132))))

(assert (=> b!938596 (= res!631458 (= (getValueByKey!487 (toList!6077 lt!423846) (_1!6729 (tuple2!13437 lt!423675 zeroValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423675 zeroValue!1173)))))))

(declare-fun b!938597 () Bool)

(assert (=> b!938597 (= e!527132 (contains!5082 (toList!6077 lt!423846) (tuple2!13437 lt!423675 zeroValue!1173)))))

(assert (= (and d!113533 res!631459) b!938596))

(assert (= (and b!938596 res!631458) b!938597))

(declare-fun m!873577 () Bool)

(assert (=> d!113533 m!873577))

(declare-fun m!873579 () Bool)

(assert (=> d!113533 m!873579))

(declare-fun m!873581 () Bool)

(assert (=> d!113533 m!873581))

(declare-fun m!873583 () Bool)

(assert (=> d!113533 m!873583))

(declare-fun m!873585 () Bool)

(assert (=> b!938596 m!873585))

(declare-fun m!873587 () Bool)

(assert (=> b!938597 m!873587))

(assert (=> b!938367 d!113533))

(declare-fun d!113535 () Bool)

(assert (=> d!113535 (= (apply!851 (+!2865 lt!423682 (tuple2!13437 lt!423675 zeroValue!1173)) lt!423680) (apply!851 lt!423682 lt!423680))))

(declare-fun lt!423847 () Unit!31596)

(assert (=> d!113535 (= lt!423847 (choose!1571 lt!423682 lt!423675 zeroValue!1173 lt!423680))))

(declare-fun e!527133 () Bool)

(assert (=> d!113535 e!527133))

(declare-fun res!631460 () Bool)

(assert (=> d!113535 (=> (not res!631460) (not e!527133))))

(assert (=> d!113535 (= res!631460 (contains!5081 lt!423682 lt!423680))))

(assert (=> d!113535 (= (addApplyDifferent!434 lt!423682 lt!423675 zeroValue!1173 lt!423680) lt!423847)))

(declare-fun b!938598 () Bool)

(assert (=> b!938598 (= e!527133 (not (= lt!423680 lt!423675)))))

(assert (= (and d!113535 res!631460) b!938598))

(declare-fun m!873589 () Bool)

(assert (=> d!113535 m!873589))

(assert (=> d!113535 m!873191))

(assert (=> d!113535 m!873183))

(assert (=> d!113535 m!873191))

(assert (=> d!113535 m!873193))

(declare-fun m!873591 () Bool)

(assert (=> d!113535 m!873591))

(assert (=> b!938367 d!113535))

(declare-fun d!113537 () Bool)

(declare-fun e!527134 () Bool)

(assert (=> d!113537 e!527134))

(declare-fun res!631462 () Bool)

(assert (=> d!113537 (=> (not res!631462) (not e!527134))))

(declare-fun lt!423851 () ListLongMap!12123)

(assert (=> d!113537 (= res!631462 (contains!5081 lt!423851 (_1!6729 (tuple2!13437 lt!423684 minValue!1173))))))

(declare-fun lt!423848 () List!19179)

(assert (=> d!113537 (= lt!423851 (ListLongMap!12124 lt!423848))))

(declare-fun lt!423849 () Unit!31596)

(declare-fun lt!423850 () Unit!31596)

(assert (=> d!113537 (= lt!423849 lt!423850)))

(assert (=> d!113537 (= (getValueByKey!487 lt!423848 (_1!6729 (tuple2!13437 lt!423684 minValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423684 minValue!1173))))))

(assert (=> d!113537 (= lt!423850 (lemmaContainsTupThenGetReturnValue!261 lt!423848 (_1!6729 (tuple2!13437 lt!423684 minValue!1173)) (_2!6729 (tuple2!13437 lt!423684 minValue!1173))))))

(assert (=> d!113537 (= lt!423848 (insertStrictlySorted!318 (toList!6077 lt!423669) (_1!6729 (tuple2!13437 lt!423684 minValue!1173)) (_2!6729 (tuple2!13437 lt!423684 minValue!1173))))))

(assert (=> d!113537 (= (+!2865 lt!423669 (tuple2!13437 lt!423684 minValue!1173)) lt!423851)))

(declare-fun b!938599 () Bool)

(declare-fun res!631461 () Bool)

(assert (=> b!938599 (=> (not res!631461) (not e!527134))))

(assert (=> b!938599 (= res!631461 (= (getValueByKey!487 (toList!6077 lt!423851) (_1!6729 (tuple2!13437 lt!423684 minValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423684 minValue!1173)))))))

(declare-fun b!938600 () Bool)

(assert (=> b!938600 (= e!527134 (contains!5082 (toList!6077 lt!423851) (tuple2!13437 lt!423684 minValue!1173)))))

(assert (= (and d!113537 res!631462) b!938599))

(assert (= (and b!938599 res!631461) b!938600))

(declare-fun m!873593 () Bool)

(assert (=> d!113537 m!873593))

(declare-fun m!873595 () Bool)

(assert (=> d!113537 m!873595))

(declare-fun m!873597 () Bool)

(assert (=> d!113537 m!873597))

(declare-fun m!873599 () Bool)

(assert (=> d!113537 m!873599))

(declare-fun m!873601 () Bool)

(assert (=> b!938599 m!873601))

(declare-fun m!873603 () Bool)

(assert (=> b!938600 m!873603))

(assert (=> b!938367 d!113537))

(declare-fun d!113539 () Bool)

(declare-fun e!527135 () Bool)

(assert (=> d!113539 e!527135))

(declare-fun res!631463 () Bool)

(assert (=> d!113539 (=> res!631463 e!527135)))

(declare-fun lt!423852 () Bool)

(assert (=> d!113539 (= res!631463 (not lt!423852))))

(declare-fun lt!423853 () Bool)

(assert (=> d!113539 (= lt!423852 lt!423853)))

(declare-fun lt!423854 () Unit!31596)

(declare-fun e!527136 () Unit!31596)

(assert (=> d!113539 (= lt!423854 e!527136)))

(declare-fun c!97832 () Bool)

(assert (=> d!113539 (= c!97832 lt!423853)))

(assert (=> d!113539 (= lt!423853 (containsKey!451 (toList!6077 (+!2865 lt!423672 (tuple2!13437 lt!423683 zeroValue!1173))) lt!423677))))

(assert (=> d!113539 (= (contains!5081 (+!2865 lt!423672 (tuple2!13437 lt!423683 zeroValue!1173)) lt!423677) lt!423852)))

(declare-fun b!938601 () Bool)

(declare-fun lt!423855 () Unit!31596)

(assert (=> b!938601 (= e!527136 lt!423855)))

(assert (=> b!938601 (= lt!423855 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6077 (+!2865 lt!423672 (tuple2!13437 lt!423683 zeroValue!1173))) lt!423677))))

(assert (=> b!938601 (isDefined!359 (getValueByKey!487 (toList!6077 (+!2865 lt!423672 (tuple2!13437 lt!423683 zeroValue!1173))) lt!423677))))

(declare-fun b!938602 () Bool)

(declare-fun Unit!31609 () Unit!31596)

(assert (=> b!938602 (= e!527136 Unit!31609)))

(declare-fun b!938603 () Bool)

(assert (=> b!938603 (= e!527135 (isDefined!359 (getValueByKey!487 (toList!6077 (+!2865 lt!423672 (tuple2!13437 lt!423683 zeroValue!1173))) lt!423677)))))

(assert (= (and d!113539 c!97832) b!938601))

(assert (= (and d!113539 (not c!97832)) b!938602))

(assert (= (and d!113539 (not res!631463)) b!938603))

(declare-fun m!873605 () Bool)

(assert (=> d!113539 m!873605))

(declare-fun m!873607 () Bool)

(assert (=> b!938601 m!873607))

(declare-fun m!873609 () Bool)

(assert (=> b!938601 m!873609))

(assert (=> b!938601 m!873609))

(declare-fun m!873611 () Bool)

(assert (=> b!938601 m!873611))

(assert (=> b!938603 m!873609))

(assert (=> b!938603 m!873609))

(assert (=> b!938603 m!873611))

(assert (=> b!938367 d!113539))

(declare-fun d!113541 () Bool)

(assert (=> d!113541 (contains!5081 (+!2865 lt!423672 (tuple2!13437 lt!423683 zeroValue!1173)) lt!423677)))

(declare-fun lt!423856 () Unit!31596)

(assert (=> d!113541 (= lt!423856 (choose!1569 lt!423672 lt!423683 zeroValue!1173 lt!423677))))

(assert (=> d!113541 (contains!5081 lt!423672 lt!423677)))

(assert (=> d!113541 (= (addStillContains!554 lt!423672 lt!423683 zeroValue!1173 lt!423677) lt!423856)))

(declare-fun bs!26328 () Bool)

(assert (= bs!26328 d!113541))

(assert (=> bs!26328 m!873205))

(assert (=> bs!26328 m!873205))

(assert (=> bs!26328 m!873207))

(declare-fun m!873613 () Bool)

(assert (=> bs!26328 m!873613))

(declare-fun m!873615 () Bool)

(assert (=> bs!26328 m!873615))

(assert (=> b!938367 d!113541))

(declare-fun d!113543 () Bool)

(declare-fun e!527137 () Bool)

(assert (=> d!113543 e!527137))

(declare-fun res!631465 () Bool)

(assert (=> d!113543 (=> (not res!631465) (not e!527137))))

(declare-fun lt!423860 () ListLongMap!12123)

(assert (=> d!113543 (= res!631465 (contains!5081 lt!423860 (_1!6729 (tuple2!13437 lt!423683 zeroValue!1173))))))

(declare-fun lt!423857 () List!19179)

(assert (=> d!113543 (= lt!423860 (ListLongMap!12124 lt!423857))))

(declare-fun lt!423858 () Unit!31596)

(declare-fun lt!423859 () Unit!31596)

(assert (=> d!113543 (= lt!423858 lt!423859)))

(assert (=> d!113543 (= (getValueByKey!487 lt!423857 (_1!6729 (tuple2!13437 lt!423683 zeroValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423683 zeroValue!1173))))))

(assert (=> d!113543 (= lt!423859 (lemmaContainsTupThenGetReturnValue!261 lt!423857 (_1!6729 (tuple2!13437 lt!423683 zeroValue!1173)) (_2!6729 (tuple2!13437 lt!423683 zeroValue!1173))))))

(assert (=> d!113543 (= lt!423857 (insertStrictlySorted!318 (toList!6077 lt!423672) (_1!6729 (tuple2!13437 lt!423683 zeroValue!1173)) (_2!6729 (tuple2!13437 lt!423683 zeroValue!1173))))))

(assert (=> d!113543 (= (+!2865 lt!423672 (tuple2!13437 lt!423683 zeroValue!1173)) lt!423860)))

(declare-fun b!938604 () Bool)

(declare-fun res!631464 () Bool)

(assert (=> b!938604 (=> (not res!631464) (not e!527137))))

(assert (=> b!938604 (= res!631464 (= (getValueByKey!487 (toList!6077 lt!423860) (_1!6729 (tuple2!13437 lt!423683 zeroValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423683 zeroValue!1173)))))))

(declare-fun b!938605 () Bool)

(assert (=> b!938605 (= e!527137 (contains!5082 (toList!6077 lt!423860) (tuple2!13437 lt!423683 zeroValue!1173)))))

(assert (= (and d!113543 res!631465) b!938604))

(assert (= (and b!938604 res!631464) b!938605))

(declare-fun m!873617 () Bool)

(assert (=> d!113543 m!873617))

(declare-fun m!873619 () Bool)

(assert (=> d!113543 m!873619))

(declare-fun m!873621 () Bool)

(assert (=> d!113543 m!873621))

(declare-fun m!873623 () Bool)

(assert (=> d!113543 m!873623))

(declare-fun m!873625 () Bool)

(assert (=> b!938604 m!873625))

(declare-fun m!873627 () Bool)

(assert (=> b!938605 m!873627))

(assert (=> b!938367 d!113543))

(declare-fun d!113545 () Bool)

(assert (=> d!113545 (= (apply!851 (+!2865 lt!423670 (tuple2!13437 lt!423665 minValue!1173)) lt!423666) (apply!851 lt!423670 lt!423666))))

(declare-fun lt!423861 () Unit!31596)

(assert (=> d!113545 (= lt!423861 (choose!1571 lt!423670 lt!423665 minValue!1173 lt!423666))))

(declare-fun e!527138 () Bool)

(assert (=> d!113545 e!527138))

(declare-fun res!631466 () Bool)

(assert (=> d!113545 (=> (not res!631466) (not e!527138))))

(assert (=> d!113545 (= res!631466 (contains!5081 lt!423670 lt!423666))))

(assert (=> d!113545 (= (addApplyDifferent!434 lt!423670 lt!423665 minValue!1173 lt!423666) lt!423861)))

(declare-fun b!938606 () Bool)

(assert (=> b!938606 (= e!527138 (not (= lt!423666 lt!423665)))))

(assert (= (and d!113545 res!631466) b!938606))

(declare-fun m!873629 () Bool)

(assert (=> d!113545 m!873629))

(assert (=> d!113545 m!873177))

(assert (=> d!113545 m!873199))

(assert (=> d!113545 m!873177))

(assert (=> d!113545 m!873179))

(declare-fun m!873631 () Bool)

(assert (=> d!113545 m!873631))

(assert (=> b!938367 d!113545))

(declare-fun d!113547 () Bool)

(assert (=> d!113547 (= (apply!851 lt!423669 lt!423668) (get!14331 (getValueByKey!487 (toList!6077 lt!423669) lt!423668)))))

(declare-fun bs!26329 () Bool)

(assert (= bs!26329 d!113547))

(declare-fun m!873633 () Bool)

(assert (=> bs!26329 m!873633))

(assert (=> bs!26329 m!873633))

(declare-fun m!873635 () Bool)

(assert (=> bs!26329 m!873635))

(assert (=> b!938367 d!113547))

(assert (=> d!113469 d!113479))

(declare-fun d!113549 () Bool)

(declare-fun res!631471 () Bool)

(declare-fun e!527143 () Bool)

(assert (=> d!113549 (=> res!631471 e!527143)))

(assert (=> d!113549 (= res!631471 (and ((_ is Cons!19175) (toList!6077 lt!423503)) (= (_1!6729 (h!20321 (toList!6077 lt!423503))) k0!1099)))))

(assert (=> d!113549 (= (containsKey!451 (toList!6077 lt!423503) k0!1099) e!527143)))

(declare-fun b!938611 () Bool)

(declare-fun e!527144 () Bool)

(assert (=> b!938611 (= e!527143 e!527144)))

(declare-fun res!631472 () Bool)

(assert (=> b!938611 (=> (not res!631472) (not e!527144))))

(assert (=> b!938611 (= res!631472 (and (or (not ((_ is Cons!19175) (toList!6077 lt!423503))) (bvsle (_1!6729 (h!20321 (toList!6077 lt!423503))) k0!1099)) ((_ is Cons!19175) (toList!6077 lt!423503)) (bvslt (_1!6729 (h!20321 (toList!6077 lt!423503))) k0!1099)))))

(declare-fun b!938612 () Bool)

(assert (=> b!938612 (= e!527144 (containsKey!451 (t!27469 (toList!6077 lt!423503)) k0!1099))))

(assert (= (and d!113549 (not res!631471)) b!938611))

(assert (= (and b!938611 res!631472) b!938612))

(declare-fun m!873637 () Bool)

(assert (=> b!938612 m!873637))

(assert (=> d!113465 d!113549))

(declare-fun d!113551 () Bool)

(declare-fun res!631473 () Bool)

(declare-fun e!527145 () Bool)

(assert (=> d!113551 (=> res!631473 e!527145)))

(assert (=> d!113551 (= res!631473 (and ((_ is Cons!19175) (toList!6077 lt!423502)) (= (_1!6729 (h!20321 (toList!6077 lt!423502))) k0!1099)))))

(assert (=> d!113551 (= (containsKey!451 (toList!6077 lt!423502) k0!1099) e!527145)))

(declare-fun b!938613 () Bool)

(declare-fun e!527146 () Bool)

(assert (=> b!938613 (= e!527145 e!527146)))

(declare-fun res!631474 () Bool)

(assert (=> b!938613 (=> (not res!631474) (not e!527146))))

(assert (=> b!938613 (= res!631474 (and (or (not ((_ is Cons!19175) (toList!6077 lt!423502))) (bvsle (_1!6729 (h!20321 (toList!6077 lt!423502))) k0!1099)) ((_ is Cons!19175) (toList!6077 lt!423502)) (bvslt (_1!6729 (h!20321 (toList!6077 lt!423502))) k0!1099)))))

(declare-fun b!938614 () Bool)

(assert (=> b!938614 (= e!527146 (containsKey!451 (t!27469 (toList!6077 lt!423502)) k0!1099))))

(assert (= (and d!113551 (not res!631473)) b!938613))

(assert (= (and b!938613 res!631474) b!938614))

(declare-fun m!873639 () Bool)

(assert (=> b!938614 m!873639))

(assert (=> d!113467 d!113551))

(assert (=> b!938347 d!113505))

(declare-fun b!938615 () Bool)

(declare-fun e!527147 () Bool)

(declare-fun call!40863 () Bool)

(assert (=> b!938615 (= e!527147 call!40863)))

(declare-fun bm!40860 () Bool)

(declare-fun c!97833 () Bool)

(assert (=> bm!40860 (= call!40863 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!97833 (Cons!19176 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!97788 (Cons!19176 (select (arr!27158 _keys!1487) #b00000000000000000000000000000000) Nil!19177) Nil!19177)) (ite c!97788 (Cons!19176 (select (arr!27158 _keys!1487) #b00000000000000000000000000000000) Nil!19177) Nil!19177))))))

(declare-fun b!938616 () Bool)

(assert (=> b!938616 (= e!527147 call!40863)))

(declare-fun b!938617 () Bool)

(declare-fun e!527150 () Bool)

(assert (=> b!938617 (= e!527150 e!527147)))

(assert (=> b!938617 (= c!97833 (validKeyInArray!0 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!938619 () Bool)

(declare-fun e!527149 () Bool)

(assert (=> b!938619 (= e!527149 (contains!5083 (ite c!97788 (Cons!19176 (select (arr!27158 _keys!1487) #b00000000000000000000000000000000) Nil!19177) Nil!19177) (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!113553 () Bool)

(declare-fun res!631477 () Bool)

(declare-fun e!527148 () Bool)

(assert (=> d!113553 (=> res!631477 e!527148)))

(assert (=> d!113553 (= res!631477 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27619 _keys!1487)))))

(assert (=> d!113553 (= (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97788 (Cons!19176 (select (arr!27158 _keys!1487) #b00000000000000000000000000000000) Nil!19177) Nil!19177)) e!527148)))

(declare-fun b!938618 () Bool)

(assert (=> b!938618 (= e!527148 e!527150)))

(declare-fun res!631476 () Bool)

(assert (=> b!938618 (=> (not res!631476) (not e!527150))))

(assert (=> b!938618 (= res!631476 (not e!527149))))

(declare-fun res!631475 () Bool)

(assert (=> b!938618 (=> (not res!631475) (not e!527149))))

(assert (=> b!938618 (= res!631475 (validKeyInArray!0 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!113553 (not res!631477)) b!938618))

(assert (= (and b!938618 res!631475) b!938619))

(assert (= (and b!938618 res!631476) b!938617))

(assert (= (and b!938617 c!97833) b!938615))

(assert (= (and b!938617 (not c!97833)) b!938616))

(assert (= (or b!938615 b!938616) bm!40860))

(declare-fun m!873641 () Bool)

(assert (=> bm!40860 m!873641))

(declare-fun m!873643 () Bool)

(assert (=> bm!40860 m!873643))

(assert (=> b!938617 m!873641))

(assert (=> b!938617 m!873641))

(declare-fun m!873645 () Bool)

(assert (=> b!938617 m!873645))

(assert (=> b!938619 m!873641))

(assert (=> b!938619 m!873641))

(declare-fun m!873647 () Bool)

(assert (=> b!938619 m!873647))

(assert (=> b!938618 m!873641))

(assert (=> b!938618 m!873641))

(assert (=> b!938618 m!873645))

(assert (=> bm!40837 d!113553))

(declare-fun d!113555 () Bool)

(assert (=> d!113555 (= (get!14333 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938413 d!113555))

(declare-fun d!113557 () Bool)

(assert (=> d!113557 (= (apply!851 lt!423752 (select (arr!27158 _keys!1487) from!1844)) (get!14331 (getValueByKey!487 (toList!6077 lt!423752) (select (arr!27158 _keys!1487) from!1844))))))

(declare-fun bs!26330 () Bool)

(assert (= bs!26330 d!113557))

(assert (=> bs!26330 m!873311))

(declare-fun m!873649 () Bool)

(assert (=> bs!26330 m!873649))

(assert (=> bs!26330 m!873649))

(declare-fun m!873651 () Bool)

(assert (=> bs!26330 m!873651))

(assert (=> b!938436 d!113557))

(declare-fun d!113559 () Bool)

(declare-fun c!97834 () Bool)

(assert (=> d!113559 (= c!97834 ((_ is ValueCellFull!9650) (select (arr!27157 _values!1231) from!1844)))))

(declare-fun e!527151 () V!31983)

(assert (=> d!113559 (= (get!14330 (select (arr!27157 _values!1231) from!1844) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!527151)))

(declare-fun b!938620 () Bool)

(assert (=> b!938620 (= e!527151 (get!14332 (select (arr!27157 _values!1231) from!1844) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!938621 () Bool)

(assert (=> b!938621 (= e!527151 (get!14333 (select (arr!27157 _values!1231) from!1844) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113559 c!97834) b!938620))

(assert (= (and d!113559 (not c!97834)) b!938621))

(assert (=> b!938620 m!873315))

(assert (=> b!938620 m!872967))

(declare-fun m!873653 () Bool)

(assert (=> b!938620 m!873653))

(assert (=> b!938621 m!873315))

(assert (=> b!938621 m!872967))

(declare-fun m!873655 () Bool)

(assert (=> b!938621 m!873655))

(assert (=> b!938436 d!113559))

(assert (=> b!938463 d!113515))

(assert (=> d!113449 d!113479))

(declare-fun d!113561 () Bool)

(declare-fun e!527152 () Bool)

(assert (=> d!113561 e!527152))

(declare-fun res!631478 () Bool)

(assert (=> d!113561 (=> res!631478 e!527152)))

(declare-fun lt!423862 () Bool)

(assert (=> d!113561 (= res!631478 (not lt!423862))))

(declare-fun lt!423863 () Bool)

(assert (=> d!113561 (= lt!423862 lt!423863)))

(declare-fun lt!423864 () Unit!31596)

(declare-fun e!527153 () Unit!31596)

(assert (=> d!113561 (= lt!423864 e!527153)))

(declare-fun c!97835 () Bool)

(assert (=> d!113561 (= c!97835 lt!423863)))

(assert (=> d!113561 (= lt!423863 (containsKey!451 (toList!6077 lt!423752) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113561 (= (contains!5081 lt!423752 #b1000000000000000000000000000000000000000000000000000000000000000) lt!423862)))

(declare-fun b!938622 () Bool)

(declare-fun lt!423865 () Unit!31596)

(assert (=> b!938622 (= e!527153 lt!423865)))

(assert (=> b!938622 (= lt!423865 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6077 lt!423752) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938622 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423752) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938623 () Bool)

(declare-fun Unit!31610 () Unit!31596)

(assert (=> b!938623 (= e!527153 Unit!31610)))

(declare-fun b!938624 () Bool)

(assert (=> b!938624 (= e!527152 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423752) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113561 c!97835) b!938622))

(assert (= (and d!113561 (not c!97835)) b!938623))

(assert (= (and d!113561 (not res!631478)) b!938624))

(declare-fun m!873657 () Bool)

(assert (=> d!113561 m!873657))

(declare-fun m!873659 () Bool)

(assert (=> b!938622 m!873659))

(declare-fun m!873661 () Bool)

(assert (=> b!938622 m!873661))

(assert (=> b!938622 m!873661))

(declare-fun m!873663 () Bool)

(assert (=> b!938622 m!873663))

(assert (=> b!938624 m!873661))

(assert (=> b!938624 m!873661))

(assert (=> b!938624 m!873663))

(assert (=> bm!40830 d!113561))

(declare-fun d!113563 () Bool)

(assert (=> d!113563 (= (apply!851 (+!2865 lt!423704 (tuple2!13437 lt!423699 minValue!1173)) lt!423700) (apply!851 lt!423704 lt!423700))))

(declare-fun lt!423866 () Unit!31596)

(assert (=> d!113563 (= lt!423866 (choose!1571 lt!423704 lt!423699 minValue!1173 lt!423700))))

(declare-fun e!527154 () Bool)

(assert (=> d!113563 e!527154))

(declare-fun res!631479 () Bool)

(assert (=> d!113563 (=> (not res!631479) (not e!527154))))

(assert (=> d!113563 (= res!631479 (contains!5081 lt!423704 lt!423700))))

(assert (=> d!113563 (= (addApplyDifferent!434 lt!423704 lt!423699 minValue!1173 lt!423700) lt!423866)))

(declare-fun b!938625 () Bool)

(assert (=> b!938625 (= e!527154 (not (= lt!423700 lt!423699)))))

(assert (= (and d!113563 res!631479) b!938625))

(declare-fun m!873665 () Bool)

(assert (=> d!113563 m!873665))

(assert (=> d!113563 m!873237))

(assert (=> d!113563 m!873259))

(assert (=> d!113563 m!873237))

(assert (=> d!113563 m!873239))

(declare-fun m!873667 () Bool)

(assert (=> d!113563 m!873667))

(assert (=> b!938397 d!113563))

(declare-fun d!113565 () Bool)

(declare-fun e!527155 () Bool)

(assert (=> d!113565 e!527155))

(declare-fun res!631481 () Bool)

(assert (=> d!113565 (=> (not res!631481) (not e!527155))))

(declare-fun lt!423870 () ListLongMap!12123)

(assert (=> d!113565 (= res!631481 (contains!5081 lt!423870 (_1!6729 (tuple2!13437 lt!423699 minValue!1173))))))

(declare-fun lt!423867 () List!19179)

(assert (=> d!113565 (= lt!423870 (ListLongMap!12124 lt!423867))))

(declare-fun lt!423868 () Unit!31596)

(declare-fun lt!423869 () Unit!31596)

(assert (=> d!113565 (= lt!423868 lt!423869)))

(assert (=> d!113565 (= (getValueByKey!487 lt!423867 (_1!6729 (tuple2!13437 lt!423699 minValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423699 minValue!1173))))))

(assert (=> d!113565 (= lt!423869 (lemmaContainsTupThenGetReturnValue!261 lt!423867 (_1!6729 (tuple2!13437 lt!423699 minValue!1173)) (_2!6729 (tuple2!13437 lt!423699 minValue!1173))))))

(assert (=> d!113565 (= lt!423867 (insertStrictlySorted!318 (toList!6077 lt!423704) (_1!6729 (tuple2!13437 lt!423699 minValue!1173)) (_2!6729 (tuple2!13437 lt!423699 minValue!1173))))))

(assert (=> d!113565 (= (+!2865 lt!423704 (tuple2!13437 lt!423699 minValue!1173)) lt!423870)))

(declare-fun b!938626 () Bool)

(declare-fun res!631480 () Bool)

(assert (=> b!938626 (=> (not res!631480) (not e!527155))))

(assert (=> b!938626 (= res!631480 (= (getValueByKey!487 (toList!6077 lt!423870) (_1!6729 (tuple2!13437 lt!423699 minValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423699 minValue!1173)))))))

(declare-fun b!938627 () Bool)

(assert (=> b!938627 (= e!527155 (contains!5082 (toList!6077 lt!423870) (tuple2!13437 lt!423699 minValue!1173)))))

(assert (= (and d!113565 res!631481) b!938626))

(assert (= (and b!938626 res!631480) b!938627))

(declare-fun m!873669 () Bool)

(assert (=> d!113565 m!873669))

(declare-fun m!873671 () Bool)

(assert (=> d!113565 m!873671))

(declare-fun m!873673 () Bool)

(assert (=> d!113565 m!873673))

(declare-fun m!873675 () Bool)

(assert (=> d!113565 m!873675))

(declare-fun m!873677 () Bool)

(assert (=> b!938626 m!873677))

(declare-fun m!873679 () Bool)

(assert (=> b!938627 m!873679))

(assert (=> b!938397 d!113565))

(declare-fun d!113567 () Bool)

(assert (=> d!113567 (= (apply!851 (+!2865 lt!423703 (tuple2!13437 lt!423718 minValue!1173)) lt!423702) (get!14331 (getValueByKey!487 (toList!6077 (+!2865 lt!423703 (tuple2!13437 lt!423718 minValue!1173))) lt!423702)))))

(declare-fun bs!26331 () Bool)

(assert (= bs!26331 d!113567))

(declare-fun m!873681 () Bool)

(assert (=> bs!26331 m!873681))

(assert (=> bs!26331 m!873681))

(declare-fun m!873683 () Bool)

(assert (=> bs!26331 m!873683))

(assert (=> b!938397 d!113567))

(declare-fun d!113569 () Bool)

(declare-fun e!527156 () Bool)

(assert (=> d!113569 e!527156))

(declare-fun res!631483 () Bool)

(assert (=> d!113569 (=> (not res!631483) (not e!527156))))

(declare-fun lt!423874 () ListLongMap!12123)

(assert (=> d!113569 (= res!631483 (contains!5081 lt!423874 (_1!6729 (tuple2!13437 lt!423709 zeroValue!1173))))))

(declare-fun lt!423871 () List!19179)

(assert (=> d!113569 (= lt!423874 (ListLongMap!12124 lt!423871))))

(declare-fun lt!423872 () Unit!31596)

(declare-fun lt!423873 () Unit!31596)

(assert (=> d!113569 (= lt!423872 lt!423873)))

(assert (=> d!113569 (= (getValueByKey!487 lt!423871 (_1!6729 (tuple2!13437 lt!423709 zeroValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423709 zeroValue!1173))))))

(assert (=> d!113569 (= lt!423873 (lemmaContainsTupThenGetReturnValue!261 lt!423871 (_1!6729 (tuple2!13437 lt!423709 zeroValue!1173)) (_2!6729 (tuple2!13437 lt!423709 zeroValue!1173))))))

(assert (=> d!113569 (= lt!423871 (insertStrictlySorted!318 (toList!6077 lt!423716) (_1!6729 (tuple2!13437 lt!423709 zeroValue!1173)) (_2!6729 (tuple2!13437 lt!423709 zeroValue!1173))))))

(assert (=> d!113569 (= (+!2865 lt!423716 (tuple2!13437 lt!423709 zeroValue!1173)) lt!423874)))

(declare-fun b!938628 () Bool)

(declare-fun res!631482 () Bool)

(assert (=> b!938628 (=> (not res!631482) (not e!527156))))

(assert (=> b!938628 (= res!631482 (= (getValueByKey!487 (toList!6077 lt!423874) (_1!6729 (tuple2!13437 lt!423709 zeroValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423709 zeroValue!1173)))))))

(declare-fun b!938629 () Bool)

(assert (=> b!938629 (= e!527156 (contains!5082 (toList!6077 lt!423874) (tuple2!13437 lt!423709 zeroValue!1173)))))

(assert (= (and d!113569 res!631483) b!938628))

(assert (= (and b!938628 res!631482) b!938629))

(declare-fun m!873685 () Bool)

(assert (=> d!113569 m!873685))

(declare-fun m!873687 () Bool)

(assert (=> d!113569 m!873687))

(declare-fun m!873689 () Bool)

(assert (=> d!113569 m!873689))

(declare-fun m!873691 () Bool)

(assert (=> d!113569 m!873691))

(declare-fun m!873693 () Bool)

(assert (=> b!938628 m!873693))

(declare-fun m!873695 () Bool)

(assert (=> b!938629 m!873695))

(assert (=> b!938397 d!113569))

(declare-fun d!113571 () Bool)

(assert (=> d!113571 (= (apply!851 lt!423716 lt!423714) (get!14331 (getValueByKey!487 (toList!6077 lt!423716) lt!423714)))))

(declare-fun bs!26332 () Bool)

(assert (= bs!26332 d!113571))

(declare-fun m!873697 () Bool)

(assert (=> bs!26332 m!873697))

(assert (=> bs!26332 m!873697))

(declare-fun m!873699 () Bool)

(assert (=> bs!26332 m!873699))

(assert (=> b!938397 d!113571))

(declare-fun d!113573 () Bool)

(declare-fun e!527157 () Bool)

(assert (=> d!113573 e!527157))

(declare-fun res!631485 () Bool)

(assert (=> d!113573 (=> (not res!631485) (not e!527157))))

(declare-fun lt!423878 () ListLongMap!12123)

(assert (=> d!113573 (= res!631485 (contains!5081 lt!423878 (_1!6729 (tuple2!13437 lt!423717 zeroValue!1173))))))

(declare-fun lt!423875 () List!19179)

(assert (=> d!113573 (= lt!423878 (ListLongMap!12124 lt!423875))))

(declare-fun lt!423876 () Unit!31596)

(declare-fun lt!423877 () Unit!31596)

(assert (=> d!113573 (= lt!423876 lt!423877)))

(assert (=> d!113573 (= (getValueByKey!487 lt!423875 (_1!6729 (tuple2!13437 lt!423717 zeroValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423717 zeroValue!1173))))))

(assert (=> d!113573 (= lt!423877 (lemmaContainsTupThenGetReturnValue!261 lt!423875 (_1!6729 (tuple2!13437 lt!423717 zeroValue!1173)) (_2!6729 (tuple2!13437 lt!423717 zeroValue!1173))))))

(assert (=> d!113573 (= lt!423875 (insertStrictlySorted!318 (toList!6077 lt!423706) (_1!6729 (tuple2!13437 lt!423717 zeroValue!1173)) (_2!6729 (tuple2!13437 lt!423717 zeroValue!1173))))))

(assert (=> d!113573 (= (+!2865 lt!423706 (tuple2!13437 lt!423717 zeroValue!1173)) lt!423878)))

(declare-fun b!938630 () Bool)

(declare-fun res!631484 () Bool)

(assert (=> b!938630 (=> (not res!631484) (not e!527157))))

(assert (=> b!938630 (= res!631484 (= (getValueByKey!487 (toList!6077 lt!423878) (_1!6729 (tuple2!13437 lt!423717 zeroValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423717 zeroValue!1173)))))))

(declare-fun b!938631 () Bool)

(assert (=> b!938631 (= e!527157 (contains!5082 (toList!6077 lt!423878) (tuple2!13437 lt!423717 zeroValue!1173)))))

(assert (= (and d!113573 res!631485) b!938630))

(assert (= (and b!938630 res!631484) b!938631))

(declare-fun m!873701 () Bool)

(assert (=> d!113573 m!873701))

(declare-fun m!873703 () Bool)

(assert (=> d!113573 m!873703))

(declare-fun m!873705 () Bool)

(assert (=> d!113573 m!873705))

(declare-fun m!873707 () Bool)

(assert (=> d!113573 m!873707))

(declare-fun m!873709 () Bool)

(assert (=> b!938630 m!873709))

(declare-fun m!873711 () Bool)

(assert (=> b!938631 m!873711))

(assert (=> b!938397 d!113573))

(declare-fun d!113575 () Bool)

(assert (=> d!113575 (= (apply!851 lt!423703 lt!423702) (get!14331 (getValueByKey!487 (toList!6077 lt!423703) lt!423702)))))

(declare-fun bs!26333 () Bool)

(assert (= bs!26333 d!113575))

(declare-fun m!873713 () Bool)

(assert (=> bs!26333 m!873713))

(assert (=> bs!26333 m!873713))

(declare-fun m!873715 () Bool)

(assert (=> bs!26333 m!873715))

(assert (=> b!938397 d!113575))

(declare-fun d!113577 () Bool)

(assert (=> d!113577 (contains!5081 (+!2865 lt!423706 (tuple2!13437 lt!423717 zeroValue!1173)) lt!423711)))

(declare-fun lt!423879 () Unit!31596)

(assert (=> d!113577 (= lt!423879 (choose!1569 lt!423706 lt!423717 zeroValue!1173 lt!423711))))

(assert (=> d!113577 (contains!5081 lt!423706 lt!423711)))

(assert (=> d!113577 (= (addStillContains!554 lt!423706 lt!423717 zeroValue!1173 lt!423711) lt!423879)))

(declare-fun bs!26334 () Bool)

(assert (= bs!26334 d!113577))

(assert (=> bs!26334 m!873265))

(assert (=> bs!26334 m!873265))

(assert (=> bs!26334 m!873267))

(declare-fun m!873717 () Bool)

(assert (=> bs!26334 m!873717))

(declare-fun m!873719 () Bool)

(assert (=> bs!26334 m!873719))

(assert (=> b!938397 d!113577))

(declare-fun d!113579 () Bool)

(assert (=> d!113579 (= (apply!851 (+!2865 lt!423703 (tuple2!13437 lt!423718 minValue!1173)) lt!423702) (apply!851 lt!423703 lt!423702))))

(declare-fun lt!423880 () Unit!31596)

(assert (=> d!113579 (= lt!423880 (choose!1571 lt!423703 lt!423718 minValue!1173 lt!423702))))

(declare-fun e!527158 () Bool)

(assert (=> d!113579 e!527158))

(declare-fun res!631486 () Bool)

(assert (=> d!113579 (=> (not res!631486) (not e!527158))))

(assert (=> d!113579 (= res!631486 (contains!5081 lt!423703 lt!423702))))

(assert (=> d!113579 (= (addApplyDifferent!434 lt!423703 lt!423718 minValue!1173 lt!423702) lt!423880)))

(declare-fun b!938632 () Bool)

(assert (=> b!938632 (= e!527158 (not (= lt!423702 lt!423718)))))

(assert (= (and d!113579 res!631486) b!938632))

(declare-fun m!873721 () Bool)

(assert (=> d!113579 m!873721))

(assert (=> d!113579 m!873255))

(assert (=> d!113579 m!873245))

(assert (=> d!113579 m!873255))

(assert (=> d!113579 m!873257))

(declare-fun m!873723 () Bool)

(assert (=> d!113579 m!873723))

(assert (=> b!938397 d!113579))

(declare-fun d!113581 () Bool)

(assert (=> d!113581 (= (apply!851 lt!423704 lt!423700) (get!14331 (getValueByKey!487 (toList!6077 lt!423704) lt!423700)))))

(declare-fun bs!26335 () Bool)

(assert (= bs!26335 d!113581))

(declare-fun m!873725 () Bool)

(assert (=> bs!26335 m!873725))

(assert (=> bs!26335 m!873725))

(declare-fun m!873727 () Bool)

(assert (=> bs!26335 m!873727))

(assert (=> b!938397 d!113581))

(declare-fun d!113583 () Bool)

(assert (=> d!113583 (= (apply!851 (+!2865 lt!423704 (tuple2!13437 lt!423699 minValue!1173)) lt!423700) (get!14331 (getValueByKey!487 (toList!6077 (+!2865 lt!423704 (tuple2!13437 lt!423699 minValue!1173))) lt!423700)))))

(declare-fun bs!26336 () Bool)

(assert (= bs!26336 d!113583))

(declare-fun m!873729 () Bool)

(assert (=> bs!26336 m!873729))

(assert (=> bs!26336 m!873729))

(declare-fun m!873731 () Bool)

(assert (=> bs!26336 m!873731))

(assert (=> b!938397 d!113583))

(declare-fun d!113585 () Bool)

(assert (=> d!113585 (= (apply!851 (+!2865 lt!423716 (tuple2!13437 lt!423709 zeroValue!1173)) lt!423714) (get!14331 (getValueByKey!487 (toList!6077 (+!2865 lt!423716 (tuple2!13437 lt!423709 zeroValue!1173))) lt!423714)))))

(declare-fun bs!26337 () Bool)

(assert (= bs!26337 d!113585))

(declare-fun m!873733 () Bool)

(assert (=> bs!26337 m!873733))

(assert (=> bs!26337 m!873733))

(declare-fun m!873735 () Bool)

(assert (=> bs!26337 m!873735))

(assert (=> b!938397 d!113585))

(declare-fun d!113587 () Bool)

(assert (=> d!113587 (= (apply!851 (+!2865 lt!423716 (tuple2!13437 lt!423709 zeroValue!1173)) lt!423714) (apply!851 lt!423716 lt!423714))))

(declare-fun lt!423881 () Unit!31596)

(assert (=> d!113587 (= lt!423881 (choose!1571 lt!423716 lt!423709 zeroValue!1173 lt!423714))))

(declare-fun e!527159 () Bool)

(assert (=> d!113587 e!527159))

(declare-fun res!631487 () Bool)

(assert (=> d!113587 (=> (not res!631487) (not e!527159))))

(assert (=> d!113587 (= res!631487 (contains!5081 lt!423716 lt!423714))))

(assert (=> d!113587 (= (addApplyDifferent!434 lt!423716 lt!423709 zeroValue!1173 lt!423714) lt!423881)))

(declare-fun b!938633 () Bool)

(assert (=> b!938633 (= e!527159 (not (= lt!423714 lt!423709)))))

(assert (= (and d!113587 res!631487) b!938633))

(declare-fun m!873737 () Bool)

(assert (=> d!113587 m!873737))

(assert (=> d!113587 m!873251))

(assert (=> d!113587 m!873243))

(assert (=> d!113587 m!873251))

(assert (=> d!113587 m!873253))

(declare-fun m!873739 () Bool)

(assert (=> d!113587 m!873739))

(assert (=> b!938397 d!113587))

(declare-fun b!938634 () Bool)

(declare-fun e!527164 () ListLongMap!12123)

(declare-fun e!527161 () ListLongMap!12123)

(assert (=> b!938634 (= e!527164 e!527161)))

(declare-fun c!97839 () Bool)

(assert (=> b!938634 (= c!97839 (validKeyInArray!0 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!938635 () Bool)

(assert (=> b!938635 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27619 _keys!1487)))))

(assert (=> b!938635 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27618 _values!1231)))))

(declare-fun lt!423888 () ListLongMap!12123)

(declare-fun e!527162 () Bool)

(assert (=> b!938635 (= e!527162 (= (apply!851 lt!423888 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14330 (select (arr!27157 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!938636 () Bool)

(declare-fun e!527165 () Bool)

(assert (=> b!938636 (= e!527165 (= lt!423888 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235)))))

(declare-fun b!938637 () Bool)

(declare-fun e!527166 () Bool)

(assert (=> b!938637 (= e!527166 e!527165)))

(declare-fun c!97838 () Bool)

(assert (=> b!938637 (= c!97838 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27619 _keys!1487)))))

(declare-fun b!938638 () Bool)

(declare-fun call!40864 () ListLongMap!12123)

(assert (=> b!938638 (= e!527161 call!40864)))

(declare-fun b!938639 () Bool)

(declare-fun e!527163 () Bool)

(assert (=> b!938639 (= e!527163 e!527166)))

(declare-fun c!97836 () Bool)

(declare-fun e!527160 () Bool)

(assert (=> b!938639 (= c!97836 e!527160)))

(declare-fun res!631490 () Bool)

(assert (=> b!938639 (=> (not res!631490) (not e!527160))))

(assert (=> b!938639 (= res!631490 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27619 _keys!1487)))))

(declare-fun b!938640 () Bool)

(assert (=> b!938640 (= e!527160 (validKeyInArray!0 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!938640 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000)))

(declare-fun b!938641 () Bool)

(assert (=> b!938641 (= e!527165 (isEmpty!703 lt!423888))))

(declare-fun b!938642 () Bool)

(assert (=> b!938642 (= e!527164 (ListLongMap!12124 Nil!19176))))

(declare-fun d!113589 () Bool)

(assert (=> d!113589 e!527163))

(declare-fun res!631488 () Bool)

(assert (=> d!113589 (=> (not res!631488) (not e!527163))))

(assert (=> d!113589 (= res!631488 (not (contains!5081 lt!423888 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!113589 (= lt!423888 e!527164)))

(declare-fun c!97837 () Bool)

(assert (=> d!113589 (= c!97837 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27619 _keys!1487)))))

(assert (=> d!113589 (validMask!0 mask!1881)))

(assert (=> d!113589 (= (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423888)))

(declare-fun b!938643 () Bool)

(declare-fun res!631491 () Bool)

(assert (=> b!938643 (=> (not res!631491) (not e!527163))))

(assert (=> b!938643 (= res!631491 (not (contains!5081 lt!423888 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!40861 () Bool)

(assert (=> bm!40861 (= call!40864 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!938644 () Bool)

(declare-fun lt!423882 () Unit!31596)

(declare-fun lt!423884 () Unit!31596)

(assert (=> b!938644 (= lt!423882 lt!423884)))

(declare-fun lt!423885 () ListLongMap!12123)

(declare-fun lt!423883 () (_ BitVec 64))

(declare-fun lt!423887 () V!31983)

(declare-fun lt!423886 () (_ BitVec 64))

(assert (=> b!938644 (not (contains!5081 (+!2865 lt!423885 (tuple2!13437 lt!423883 lt!423887)) lt!423886))))

(assert (=> b!938644 (= lt!423884 (addStillNotContains!222 lt!423885 lt!423883 lt!423887 lt!423886))))

(assert (=> b!938644 (= lt!423886 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!938644 (= lt!423887 (get!14330 (select (arr!27157 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!938644 (= lt!423883 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938644 (= lt!423885 call!40864)))

(assert (=> b!938644 (= e!527161 (+!2865 call!40864 (tuple2!13437 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (get!14330 (select (arr!27157 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!938645 () Bool)

(assert (=> b!938645 (= e!527166 e!527162)))

(assert (=> b!938645 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27619 _keys!1487)))))

(declare-fun res!631489 () Bool)

(assert (=> b!938645 (= res!631489 (contains!5081 lt!423888 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!938645 (=> (not res!631489) (not e!527162))))

(assert (= (and d!113589 c!97837) b!938642))

(assert (= (and d!113589 (not c!97837)) b!938634))

(assert (= (and b!938634 c!97839) b!938644))

(assert (= (and b!938634 (not c!97839)) b!938638))

(assert (= (or b!938644 b!938638) bm!40861))

(assert (= (and d!113589 res!631488) b!938643))

(assert (= (and b!938643 res!631491) b!938639))

(assert (= (and b!938639 res!631490) b!938640))

(assert (= (and b!938639 c!97836) b!938645))

(assert (= (and b!938639 (not c!97836)) b!938637))

(assert (= (and b!938645 res!631489) b!938635))

(assert (= (and b!938637 c!97838) b!938636))

(assert (= (and b!938637 (not c!97838)) b!938641))

(declare-fun b_lambda!14223 () Bool)

(assert (=> (not b_lambda!14223) (not b!938635)))

(assert (=> b!938635 t!27468))

(declare-fun b_and!29125 () Bool)

(assert (= b_and!29123 (and (=> t!27468 result!12125) b_and!29125)))

(declare-fun b_lambda!14225 () Bool)

(assert (=> (not b_lambda!14225) (not b!938644)))

(assert (=> b!938644 t!27468))

(declare-fun b_and!29127 () Bool)

(assert (= b_and!29125 (and (=> t!27468 result!12125) b_and!29127)))

(declare-fun m!873741 () Bool)

(assert (=> d!113589 m!873741))

(assert (=> d!113589 m!872943))

(declare-fun m!873743 () Bool)

(assert (=> b!938641 m!873743))

(declare-fun m!873745 () Bool)

(assert (=> b!938644 m!873745))

(declare-fun m!873747 () Bool)

(assert (=> b!938644 m!873747))

(declare-fun m!873749 () Bool)

(assert (=> b!938644 m!873749))

(assert (=> b!938644 m!873231))

(declare-fun m!873751 () Bool)

(assert (=> b!938644 m!873751))

(assert (=> b!938644 m!872967))

(assert (=> b!938644 m!873747))

(assert (=> b!938644 m!873227))

(assert (=> b!938644 m!873231))

(assert (=> b!938644 m!872967))

(assert (=> b!938644 m!873233))

(assert (=> b!938634 m!873227))

(assert (=> b!938634 m!873227))

(assert (=> b!938634 m!873275))

(assert (=> b!938645 m!873227))

(assert (=> b!938645 m!873227))

(declare-fun m!873753 () Bool)

(assert (=> b!938645 m!873753))

(declare-fun m!873755 () Bool)

(assert (=> b!938636 m!873755))

(assert (=> b!938640 m!873227))

(assert (=> b!938640 m!873227))

(assert (=> b!938640 m!873275))

(assert (=> bm!40861 m!873755))

(assert (=> b!938635 m!872967))

(assert (=> b!938635 m!873227))

(assert (=> b!938635 m!873231))

(assert (=> b!938635 m!872967))

(assert (=> b!938635 m!873233))

(assert (=> b!938635 m!873227))

(declare-fun m!873757 () Bool)

(assert (=> b!938635 m!873757))

(assert (=> b!938635 m!873231))

(declare-fun m!873759 () Bool)

(assert (=> b!938643 m!873759))

(assert (=> b!938397 d!113589))

(declare-fun d!113591 () Bool)

(declare-fun e!527167 () Bool)

(assert (=> d!113591 e!527167))

(declare-fun res!631492 () Bool)

(assert (=> d!113591 (=> res!631492 e!527167)))

(declare-fun lt!423889 () Bool)

(assert (=> d!113591 (= res!631492 (not lt!423889))))

(declare-fun lt!423890 () Bool)

(assert (=> d!113591 (= lt!423889 lt!423890)))

(declare-fun lt!423891 () Unit!31596)

(declare-fun e!527168 () Unit!31596)

(assert (=> d!113591 (= lt!423891 e!527168)))

(declare-fun c!97840 () Bool)

(assert (=> d!113591 (= c!97840 lt!423890)))

(assert (=> d!113591 (= lt!423890 (containsKey!451 (toList!6077 (+!2865 lt!423706 (tuple2!13437 lt!423717 zeroValue!1173))) lt!423711))))

(assert (=> d!113591 (= (contains!5081 (+!2865 lt!423706 (tuple2!13437 lt!423717 zeroValue!1173)) lt!423711) lt!423889)))

(declare-fun b!938646 () Bool)

(declare-fun lt!423892 () Unit!31596)

(assert (=> b!938646 (= e!527168 lt!423892)))

(assert (=> b!938646 (= lt!423892 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6077 (+!2865 lt!423706 (tuple2!13437 lt!423717 zeroValue!1173))) lt!423711))))

(assert (=> b!938646 (isDefined!359 (getValueByKey!487 (toList!6077 (+!2865 lt!423706 (tuple2!13437 lt!423717 zeroValue!1173))) lt!423711))))

(declare-fun b!938647 () Bool)

(declare-fun Unit!31611 () Unit!31596)

(assert (=> b!938647 (= e!527168 Unit!31611)))

(declare-fun b!938648 () Bool)

(assert (=> b!938648 (= e!527167 (isDefined!359 (getValueByKey!487 (toList!6077 (+!2865 lt!423706 (tuple2!13437 lt!423717 zeroValue!1173))) lt!423711)))))

(assert (= (and d!113591 c!97840) b!938646))

(assert (= (and d!113591 (not c!97840)) b!938647))

(assert (= (and d!113591 (not res!631492)) b!938648))

(declare-fun m!873761 () Bool)

(assert (=> d!113591 m!873761))

(declare-fun m!873763 () Bool)

(assert (=> b!938646 m!873763))

(declare-fun m!873765 () Bool)

(assert (=> b!938646 m!873765))

(assert (=> b!938646 m!873765))

(declare-fun m!873767 () Bool)

(assert (=> b!938646 m!873767))

(assert (=> b!938648 m!873765))

(assert (=> b!938648 m!873765))

(assert (=> b!938648 m!873767))

(assert (=> b!938397 d!113591))

(declare-fun d!113593 () Bool)

(declare-fun e!527169 () Bool)

(assert (=> d!113593 e!527169))

(declare-fun res!631494 () Bool)

(assert (=> d!113593 (=> (not res!631494) (not e!527169))))

(declare-fun lt!423896 () ListLongMap!12123)

(assert (=> d!113593 (= res!631494 (contains!5081 lt!423896 (_1!6729 (tuple2!13437 lt!423718 minValue!1173))))))

(declare-fun lt!423893 () List!19179)

(assert (=> d!113593 (= lt!423896 (ListLongMap!12124 lt!423893))))

(declare-fun lt!423894 () Unit!31596)

(declare-fun lt!423895 () Unit!31596)

(assert (=> d!113593 (= lt!423894 lt!423895)))

(assert (=> d!113593 (= (getValueByKey!487 lt!423893 (_1!6729 (tuple2!13437 lt!423718 minValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423718 minValue!1173))))))

(assert (=> d!113593 (= lt!423895 (lemmaContainsTupThenGetReturnValue!261 lt!423893 (_1!6729 (tuple2!13437 lt!423718 minValue!1173)) (_2!6729 (tuple2!13437 lt!423718 minValue!1173))))))

(assert (=> d!113593 (= lt!423893 (insertStrictlySorted!318 (toList!6077 lt!423703) (_1!6729 (tuple2!13437 lt!423718 minValue!1173)) (_2!6729 (tuple2!13437 lt!423718 minValue!1173))))))

(assert (=> d!113593 (= (+!2865 lt!423703 (tuple2!13437 lt!423718 minValue!1173)) lt!423896)))

(declare-fun b!938649 () Bool)

(declare-fun res!631493 () Bool)

(assert (=> b!938649 (=> (not res!631493) (not e!527169))))

(assert (=> b!938649 (= res!631493 (= (getValueByKey!487 (toList!6077 lt!423896) (_1!6729 (tuple2!13437 lt!423718 minValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423718 minValue!1173)))))))

(declare-fun b!938650 () Bool)

(assert (=> b!938650 (= e!527169 (contains!5082 (toList!6077 lt!423896) (tuple2!13437 lt!423718 minValue!1173)))))

(assert (= (and d!113593 res!631494) b!938649))

(assert (= (and b!938649 res!631493) b!938650))

(declare-fun m!873769 () Bool)

(assert (=> d!113593 m!873769))

(declare-fun m!873771 () Bool)

(assert (=> d!113593 m!873771))

(declare-fun m!873773 () Bool)

(assert (=> d!113593 m!873773))

(declare-fun m!873775 () Bool)

(assert (=> d!113593 m!873775))

(declare-fun m!873777 () Bool)

(assert (=> b!938649 m!873777))

(declare-fun m!873779 () Bool)

(assert (=> b!938650 m!873779))

(assert (=> b!938397 d!113593))

(declare-fun d!113595 () Bool)

(declare-fun lt!423899 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!408 (List!19179) (InoxSet tuple2!13436))

(assert (=> d!113595 (= lt!423899 (select (content!408 (toList!6077 lt!423611)) lt!423508))))

(declare-fun e!527174 () Bool)

(assert (=> d!113595 (= lt!423899 e!527174)))

(declare-fun res!631500 () Bool)

(assert (=> d!113595 (=> (not res!631500) (not e!527174))))

(assert (=> d!113595 (= res!631500 ((_ is Cons!19175) (toList!6077 lt!423611)))))

(assert (=> d!113595 (= (contains!5082 (toList!6077 lt!423611) lt!423508) lt!423899)))

(declare-fun b!938655 () Bool)

(declare-fun e!527175 () Bool)

(assert (=> b!938655 (= e!527174 e!527175)))

(declare-fun res!631499 () Bool)

(assert (=> b!938655 (=> res!631499 e!527175)))

(assert (=> b!938655 (= res!631499 (= (h!20321 (toList!6077 lt!423611)) lt!423508))))

(declare-fun b!938656 () Bool)

(assert (=> b!938656 (= e!527175 (contains!5082 (t!27469 (toList!6077 lt!423611)) lt!423508))))

(assert (= (and d!113595 res!631500) b!938655))

(assert (= (and b!938655 (not res!631499)) b!938656))

(declare-fun m!873781 () Bool)

(assert (=> d!113595 m!873781))

(declare-fun m!873783 () Bool)

(assert (=> d!113595 m!873783))

(declare-fun m!873785 () Bool)

(assert (=> b!938656 m!873785))

(assert (=> b!938285 d!113595))

(declare-fun d!113597 () Bool)

(assert (=> d!113597 (= (validKeyInArray!0 (select (arr!27158 _keys!1487) from!1844)) (and (not (= (select (arr!27158 _keys!1487) from!1844) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27158 _keys!1487) from!1844) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938434 d!113597))

(declare-fun d!113599 () Bool)

(declare-fun res!631501 () Bool)

(declare-fun e!527176 () Bool)

(assert (=> d!113599 (=> res!631501 e!527176)))

(assert (=> d!113599 (= res!631501 (and ((_ is Cons!19175) (toList!6077 lt!423511)) (= (_1!6729 (h!20321 (toList!6077 lt!423511))) k0!1099)))))

(assert (=> d!113599 (= (containsKey!451 (toList!6077 lt!423511) k0!1099) e!527176)))

(declare-fun b!938657 () Bool)

(declare-fun e!527177 () Bool)

(assert (=> b!938657 (= e!527176 e!527177)))

(declare-fun res!631502 () Bool)

(assert (=> b!938657 (=> (not res!631502) (not e!527177))))

(assert (=> b!938657 (= res!631502 (and (or (not ((_ is Cons!19175) (toList!6077 lt!423511))) (bvsle (_1!6729 (h!20321 (toList!6077 lt!423511))) k0!1099)) ((_ is Cons!19175) (toList!6077 lt!423511)) (bvslt (_1!6729 (h!20321 (toList!6077 lt!423511))) k0!1099)))))

(declare-fun b!938658 () Bool)

(assert (=> b!938658 (= e!527177 (containsKey!451 (t!27469 (toList!6077 lt!423511)) k0!1099))))

(assert (= (and d!113599 (not res!631501)) b!938657))

(assert (= (and b!938657 res!631502) b!938658))

(declare-fun m!873787 () Bool)

(assert (=> b!938658 m!873787))

(assert (=> d!113451 d!113599))

(declare-fun d!113601 () Bool)

(declare-fun e!527178 () Bool)

(assert (=> d!113601 e!527178))

(declare-fun res!631504 () Bool)

(assert (=> d!113601 (=> (not res!631504) (not e!527178))))

(declare-fun lt!423903 () ListLongMap!12123)

(assert (=> d!113601 (= res!631504 (contains!5081 lt!423903 (_1!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun lt!423900 () List!19179)

(assert (=> d!113601 (= lt!423903 (ListLongMap!12124 lt!423900))))

(declare-fun lt!423901 () Unit!31596)

(declare-fun lt!423902 () Unit!31596)

(assert (=> d!113601 (= lt!423901 lt!423902)))

(assert (=> d!113601 (= (getValueByKey!487 lt!423900 (_1!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!492 (_2!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113601 (= lt!423902 (lemmaContainsTupThenGetReturnValue!261 lt!423900 (_1!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113601 (= lt!423900 (insertStrictlySorted!318 (toList!6077 call!40839) (_1!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113601 (= (+!2865 call!40839 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) lt!423903)))

(declare-fun b!938659 () Bool)

(declare-fun res!631503 () Bool)

(assert (=> b!938659 (=> (not res!631503) (not e!527178))))

(assert (=> b!938659 (= res!631503 (= (getValueByKey!487 (toList!6077 lt!423903) (_1!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!492 (_2!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun b!938660 () Bool)

(assert (=> b!938660 (= e!527178 (contains!5082 (toList!6077 lt!423903) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(assert (= (and d!113601 res!631504) b!938659))

(assert (= (and b!938659 res!631503) b!938660))

(declare-fun m!873789 () Bool)

(assert (=> d!113601 m!873789))

(declare-fun m!873791 () Bool)

(assert (=> d!113601 m!873791))

(declare-fun m!873793 () Bool)

(assert (=> d!113601 m!873793))

(declare-fun m!873795 () Bool)

(assert (=> d!113601 m!873795))

(declare-fun m!873797 () Bool)

(assert (=> b!938659 m!873797))

(declare-fun m!873799 () Bool)

(assert (=> b!938660 m!873799))

(assert (=> b!938433 d!113601))

(declare-fun d!113603 () Bool)

(declare-fun lt!423904 () Bool)

(assert (=> d!113603 (= lt!423904 (select (content!408 (toList!6077 lt!423607)) lt!423508))))

(declare-fun e!527179 () Bool)

(assert (=> d!113603 (= lt!423904 e!527179)))

(declare-fun res!631506 () Bool)

(assert (=> d!113603 (=> (not res!631506) (not e!527179))))

(assert (=> d!113603 (= res!631506 ((_ is Cons!19175) (toList!6077 lt!423607)))))

(assert (=> d!113603 (= (contains!5082 (toList!6077 lt!423607) lt!423508) lt!423904)))

(declare-fun b!938661 () Bool)

(declare-fun e!527180 () Bool)

(assert (=> b!938661 (= e!527179 e!527180)))

(declare-fun res!631505 () Bool)

(assert (=> b!938661 (=> res!631505 e!527180)))

(assert (=> b!938661 (= res!631505 (= (h!20321 (toList!6077 lt!423607)) lt!423508))))

(declare-fun b!938662 () Bool)

(assert (=> b!938662 (= e!527180 (contains!5082 (t!27469 (toList!6077 lt!423607)) lt!423508))))

(assert (= (and d!113603 res!631506) b!938661))

(assert (= (and b!938661 (not res!631505)) b!938662))

(declare-fun m!873801 () Bool)

(assert (=> d!113603 m!873801))

(declare-fun m!873803 () Bool)

(assert (=> d!113603 m!873803))

(declare-fun m!873805 () Bool)

(assert (=> b!938662 m!873805))

(assert (=> b!938283 d!113603))

(declare-fun d!113605 () Bool)

(assert (=> d!113605 (arrayContainsKey!0 _keys!1487 lt!423767 #b00000000000000000000000000000000)))

(declare-fun lt!423907 () Unit!31596)

(declare-fun choose!13 (array!56437 (_ BitVec 64) (_ BitVec 32)) Unit!31596)

(assert (=> d!113605 (= lt!423907 (choose!13 _keys!1487 lt!423767 #b00000000000000000000000000000000))))

(assert (=> d!113605 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!113605 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!423767 #b00000000000000000000000000000000) lt!423907)))

(declare-fun bs!26338 () Bool)

(assert (= bs!26338 d!113605))

(assert (=> bs!26338 m!873381))

(declare-fun m!873807 () Bool)

(assert (=> bs!26338 m!873807))

(assert (=> b!938460 d!113605))

(declare-fun d!113607 () Bool)

(declare-fun res!631507 () Bool)

(declare-fun e!527181 () Bool)

(assert (=> d!113607 (=> res!631507 e!527181)))

(assert (=> d!113607 (= res!631507 (= (select (arr!27158 _keys!1487) #b00000000000000000000000000000000) lt!423767))))

(assert (=> d!113607 (= (arrayContainsKey!0 _keys!1487 lt!423767 #b00000000000000000000000000000000) e!527181)))

(declare-fun b!938663 () Bool)

(declare-fun e!527182 () Bool)

(assert (=> b!938663 (= e!527181 e!527182)))

(declare-fun res!631508 () Bool)

(assert (=> b!938663 (=> (not res!631508) (not e!527182))))

(assert (=> b!938663 (= res!631508 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27619 _keys!1487)))))

(declare-fun b!938664 () Bool)

(assert (=> b!938664 (= e!527182 (arrayContainsKey!0 _keys!1487 lt!423767 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!113607 (not res!631507)) b!938663))

(assert (= (and b!938663 res!631508) b!938664))

(assert (=> d!113607 m!873369))

(declare-fun m!873809 () Bool)

(assert (=> b!938664 m!873809))

(assert (=> b!938460 d!113607))

(declare-fun b!938677 () Bool)

(declare-fun e!527190 () SeekEntryResult!8982)

(declare-fun e!527189 () SeekEntryResult!8982)

(assert (=> b!938677 (= e!527190 e!527189)))

(declare-fun lt!423916 () (_ BitVec 64))

(declare-fun lt!423914 () SeekEntryResult!8982)

(assert (=> b!938677 (= lt!423916 (select (arr!27158 _keys!1487) (index!38301 lt!423914)))))

(declare-fun c!97847 () Bool)

(assert (=> b!938677 (= c!97847 (= lt!423916 (select (arr!27158 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!938678 () Bool)

(assert (=> b!938678 (= e!527189 (Found!8982 (index!38301 lt!423914)))))

(declare-fun d!113609 () Bool)

(declare-fun lt!423915 () SeekEntryResult!8982)

(assert (=> d!113609 (and (or ((_ is Undefined!8982) lt!423915) (not ((_ is Found!8982) lt!423915)) (and (bvsge (index!38300 lt!423915) #b00000000000000000000000000000000) (bvslt (index!38300 lt!423915) (size!27619 _keys!1487)))) (or ((_ is Undefined!8982) lt!423915) ((_ is Found!8982) lt!423915) (not ((_ is MissingZero!8982) lt!423915)) (and (bvsge (index!38299 lt!423915) #b00000000000000000000000000000000) (bvslt (index!38299 lt!423915) (size!27619 _keys!1487)))) (or ((_ is Undefined!8982) lt!423915) ((_ is Found!8982) lt!423915) ((_ is MissingZero!8982) lt!423915) (not ((_ is MissingVacant!8982) lt!423915)) (and (bvsge (index!38302 lt!423915) #b00000000000000000000000000000000) (bvslt (index!38302 lt!423915) (size!27619 _keys!1487)))) (or ((_ is Undefined!8982) lt!423915) (ite ((_ is Found!8982) lt!423915) (= (select (arr!27158 _keys!1487) (index!38300 lt!423915)) (select (arr!27158 _keys!1487) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8982) lt!423915) (= (select (arr!27158 _keys!1487) (index!38299 lt!423915)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8982) lt!423915) (= (select (arr!27158 _keys!1487) (index!38302 lt!423915)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!113609 (= lt!423915 e!527190)))

(declare-fun c!97849 () Bool)

(assert (=> d!113609 (= c!97849 (and ((_ is Intermediate!8982) lt!423914) (undefined!9794 lt!423914)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56437 (_ BitVec 32)) SeekEntryResult!8982)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!113609 (= lt!423914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!27158 _keys!1487) #b00000000000000000000000000000000) mask!1881) (select (arr!27158 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881))))

(assert (=> d!113609 (validMask!0 mask!1881)))

(assert (=> d!113609 (= (seekEntryOrOpen!0 (select (arr!27158 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) lt!423915)))

(declare-fun b!938679 () Bool)

(declare-fun e!527191 () SeekEntryResult!8982)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56437 (_ BitVec 32)) SeekEntryResult!8982)

(assert (=> b!938679 (= e!527191 (seekKeyOrZeroReturnVacant!0 (x!80457 lt!423914) (index!38301 lt!423914) (index!38301 lt!423914) (select (arr!27158 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881))))

(declare-fun b!938680 () Bool)

(declare-fun c!97848 () Bool)

(assert (=> b!938680 (= c!97848 (= lt!423916 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938680 (= e!527189 e!527191)))

(declare-fun b!938681 () Bool)

(assert (=> b!938681 (= e!527191 (MissingZero!8982 (index!38301 lt!423914)))))

(declare-fun b!938682 () Bool)

(assert (=> b!938682 (= e!527190 Undefined!8982)))

(assert (= (and d!113609 c!97849) b!938682))

(assert (= (and d!113609 (not c!97849)) b!938677))

(assert (= (and b!938677 c!97847) b!938678))

(assert (= (and b!938677 (not c!97847)) b!938680))

(assert (= (and b!938680 c!97848) b!938681))

(assert (= (and b!938680 (not c!97848)) b!938679))

(declare-fun m!873811 () Bool)

(assert (=> b!938677 m!873811))

(declare-fun m!873813 () Bool)

(assert (=> d!113609 m!873813))

(declare-fun m!873815 () Bool)

(assert (=> d!113609 m!873815))

(assert (=> d!113609 m!872943))

(declare-fun m!873817 () Bool)

(assert (=> d!113609 m!873817))

(assert (=> d!113609 m!873369))

(declare-fun m!873819 () Bool)

(assert (=> d!113609 m!873819))

(assert (=> d!113609 m!873819))

(assert (=> d!113609 m!873369))

(declare-fun m!873821 () Bool)

(assert (=> d!113609 m!873821))

(assert (=> b!938679 m!873369))

(declare-fun m!873823 () Bool)

(assert (=> b!938679 m!873823))

(assert (=> b!938460 d!113609))

(declare-fun d!113611 () Bool)

(declare-fun e!527192 () Bool)

(assert (=> d!113611 e!527192))

(declare-fun res!631509 () Bool)

(assert (=> d!113611 (=> res!631509 e!527192)))

(declare-fun lt!423917 () Bool)

(assert (=> d!113611 (= res!631509 (not lt!423917))))

(declare-fun lt!423918 () Bool)

(assert (=> d!113611 (= lt!423917 lt!423918)))

(declare-fun lt!423919 () Unit!31596)

(declare-fun e!527193 () Unit!31596)

(assert (=> d!113611 (= lt!423919 e!527193)))

(declare-fun c!97850 () Bool)

(assert (=> d!113611 (= c!97850 lt!423918)))

(assert (=> d!113611 (= lt!423918 (containsKey!451 (toList!6077 lt!423679) (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> d!113611 (= (contains!5081 lt!423679 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) lt!423917)))

(declare-fun b!938683 () Bool)

(declare-fun lt!423920 () Unit!31596)

(assert (=> b!938683 (= e!527193 lt!423920)))

(assert (=> b!938683 (= lt!423920 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6077 lt!423679) (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938683 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423679) (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!938684 () Bool)

(declare-fun Unit!31612 () Unit!31596)

(assert (=> b!938684 (= e!527193 Unit!31612)))

(declare-fun b!938685 () Bool)

(assert (=> b!938685 (= e!527192 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423679) (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (= (and d!113611 c!97850) b!938683))

(assert (= (and d!113611 (not c!97850)) b!938684))

(assert (= (and d!113611 (not res!631509)) b!938685))

(assert (=> d!113611 m!872993))

(declare-fun m!873825 () Bool)

(assert (=> d!113611 m!873825))

(assert (=> b!938683 m!872993))

(declare-fun m!873827 () Bool)

(assert (=> b!938683 m!873827))

(assert (=> b!938683 m!872993))

(declare-fun m!873829 () Bool)

(assert (=> b!938683 m!873829))

(assert (=> b!938683 m!873829))

(declare-fun m!873831 () Bool)

(assert (=> b!938683 m!873831))

(assert (=> b!938685 m!872993))

(assert (=> b!938685 m!873829))

(assert (=> b!938685 m!873829))

(assert (=> b!938685 m!873831))

(assert (=> b!938358 d!113611))

(declare-fun d!113613 () Bool)

(assert (=> d!113613 (= (apply!851 lt!423679 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14331 (getValueByKey!487 (toList!6077 lt!423679) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26339 () Bool)

(assert (= bs!26339 d!113613))

(declare-fun m!873833 () Bool)

(assert (=> bs!26339 m!873833))

(assert (=> bs!26339 m!873833))

(declare-fun m!873835 () Bool)

(assert (=> bs!26339 m!873835))

(assert (=> b!938357 d!113613))

(declare-fun d!113615 () Bool)

(assert (=> d!113615 (= (apply!851 lt!423713 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14331 (getValueByKey!487 (toList!6077 lt!423713) (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))))

(declare-fun bs!26340 () Bool)

(assert (= bs!26340 d!113615))

(assert (=> bs!26340 m!873227))

(declare-fun m!873837 () Bool)

(assert (=> bs!26340 m!873837))

(assert (=> bs!26340 m!873837))

(declare-fun m!873839 () Bool)

(assert (=> bs!26340 m!873839))

(assert (=> b!938393 d!113615))

(declare-fun d!113617 () Bool)

(declare-fun c!97851 () Bool)

(assert (=> d!113617 (= c!97851 ((_ is ValueCellFull!9650) (select (arr!27157 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun e!527194 () V!31983)

(assert (=> d!113617 (= (get!14330 (select (arr!27157 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!527194)))

(declare-fun b!938686 () Bool)

(assert (=> b!938686 (= e!527194 (get!14332 (select (arr!27157 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!938687 () Bool)

(assert (=> b!938687 (= e!527194 (get!14333 (select (arr!27157 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113617 c!97851) b!938686))

(assert (= (and d!113617 (not c!97851)) b!938687))

(assert (=> b!938686 m!873231))

(assert (=> b!938686 m!872967))

(declare-fun m!873841 () Bool)

(assert (=> b!938686 m!873841))

(assert (=> b!938687 m!873231))

(assert (=> b!938687 m!872967))

(declare-fun m!873843 () Bool)

(assert (=> b!938687 m!873843))

(assert (=> b!938393 d!113617))

(declare-fun d!113619 () Bool)

(declare-fun e!527195 () Bool)

(assert (=> d!113619 e!527195))

(declare-fun res!631510 () Bool)

(assert (=> d!113619 (=> res!631510 e!527195)))

(declare-fun lt!423921 () Bool)

(assert (=> d!113619 (= res!631510 (not lt!423921))))

(declare-fun lt!423922 () Bool)

(assert (=> d!113619 (= lt!423921 lt!423922)))

(declare-fun lt!423923 () Unit!31596)

(declare-fun e!527196 () Unit!31596)

(assert (=> d!113619 (= lt!423923 e!527196)))

(declare-fun c!97852 () Bool)

(assert (=> d!113619 (= c!97852 lt!423922)))

(assert (=> d!113619 (= lt!423922 (containsKey!451 (toList!6077 lt!423752) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113619 (= (contains!5081 lt!423752 #b0000000000000000000000000000000000000000000000000000000000000000) lt!423921)))

(declare-fun b!938688 () Bool)

(declare-fun lt!423924 () Unit!31596)

(assert (=> b!938688 (= e!527196 lt!423924)))

(assert (=> b!938688 (= lt!423924 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6077 lt!423752) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938688 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423752) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938689 () Bool)

(declare-fun Unit!31613 () Unit!31596)

(assert (=> b!938689 (= e!527196 Unit!31613)))

(declare-fun b!938690 () Bool)

(assert (=> b!938690 (= e!527195 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423752) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113619 c!97852) b!938688))

(assert (= (and d!113619 (not c!97852)) b!938689))

(assert (= (and d!113619 (not res!631510)) b!938690))

(declare-fun m!873845 () Bool)

(assert (=> d!113619 m!873845))

(declare-fun m!873847 () Bool)

(assert (=> b!938688 m!873847))

(declare-fun m!873849 () Bool)

(assert (=> b!938688 m!873849))

(assert (=> b!938688 m!873849))

(declare-fun m!873851 () Bool)

(assert (=> b!938688 m!873851))

(assert (=> b!938690 m!873849))

(assert (=> b!938690 m!873849))

(assert (=> b!938690 m!873851))

(assert (=> bm!40835 d!113619))

(declare-fun d!113621 () Bool)

(assert (=> d!113621 (= (validKeyInArray!0 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (and (not (= (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938391 d!113621))

(declare-fun d!113623 () Bool)

(declare-fun e!527197 () Bool)

(assert (=> d!113623 e!527197))

(declare-fun res!631511 () Bool)

(assert (=> d!113623 (=> res!631511 e!527197)))

(declare-fun lt!423925 () Bool)

(assert (=> d!113623 (= res!631511 (not lt!423925))))

(declare-fun lt!423926 () Bool)

(assert (=> d!113623 (= lt!423925 lt!423926)))

(declare-fun lt!423927 () Unit!31596)

(declare-fun e!527198 () Unit!31596)

(assert (=> d!113623 (= lt!423927 e!527198)))

(declare-fun c!97853 () Bool)

(assert (=> d!113623 (= c!97853 lt!423926)))

(assert (=> d!113623 (= lt!423926 (containsKey!451 (toList!6077 lt!423713) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113623 (= (contains!5081 lt!423713 #b1000000000000000000000000000000000000000000000000000000000000000) lt!423925)))

(declare-fun b!938691 () Bool)

(declare-fun lt!423928 () Unit!31596)

(assert (=> b!938691 (= e!527198 lt!423928)))

(assert (=> b!938691 (= lt!423928 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6077 lt!423713) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938691 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423713) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938692 () Bool)

(declare-fun Unit!31614 () Unit!31596)

(assert (=> b!938692 (= e!527198 Unit!31614)))

(declare-fun b!938693 () Bool)

(assert (=> b!938693 (= e!527197 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423713) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113623 c!97853) b!938691))

(assert (= (and d!113623 (not c!97853)) b!938692))

(assert (= (and d!113623 (not res!631511)) b!938693))

(declare-fun m!873853 () Bool)

(assert (=> d!113623 m!873853))

(declare-fun m!873855 () Bool)

(assert (=> b!938691 m!873855))

(declare-fun m!873857 () Bool)

(assert (=> b!938691 m!873857))

(assert (=> b!938691 m!873857))

(declare-fun m!873859 () Bool)

(assert (=> b!938691 m!873859))

(assert (=> b!938693 m!873857))

(assert (=> b!938693 m!873857))

(assert (=> b!938693 m!873859))

(assert (=> bm!40823 d!113623))

(declare-fun d!113625 () Bool)

(assert (=> d!113625 (= (apply!851 lt!423752 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14331 (getValueByKey!487 (toList!6077 lt!423752) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26341 () Bool)

(assert (= bs!26341 d!113625))

(assert (=> bs!26341 m!873661))

(assert (=> bs!26341 m!873661))

(declare-fun m!873861 () Bool)

(assert (=> bs!26341 m!873861))

(assert (=> b!938430 d!113625))

(declare-fun d!113627 () Bool)

(declare-fun isEmpty!704 (Option!493) Bool)

(assert (=> d!113627 (= (isDefined!359 (getValueByKey!487 (toList!6077 lt!423511) k0!1099)) (not (isEmpty!704 (getValueByKey!487 (toList!6077 lt!423511) k0!1099))))))

(declare-fun bs!26342 () Bool)

(assert (= bs!26342 d!113627))

(assert (=> bs!26342 m!873161))

(declare-fun m!873863 () Bool)

(assert (=> bs!26342 m!873863))

(assert (=> b!938376 d!113627))

(assert (=> b!938376 d!113501))

(declare-fun d!113629 () Bool)

(assert (=> d!113629 (= (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2865 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13437 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14330 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!113629 true))

(declare-fun _$20!34 () Unit!31596)

(assert (=> d!113629 (= (choose!1568 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) _$20!34)))

(declare-fun b_lambda!14227 () Bool)

(assert (=> (not b_lambda!14227) (not d!113629)))

(assert (=> d!113629 t!27468))

(declare-fun b_and!29129 () Bool)

(assert (= b_and!29127 (and (=> t!27468 result!12125) b_and!29129)))

(assert (=> d!113629 m!872969))

(assert (=> d!113629 m!873149))

(assert (=> d!113629 m!873151))

(assert (=> d!113629 m!872961))

(assert (=> d!113629 m!872993))

(assert (=> d!113629 m!872969))

(assert (=> d!113629 m!872967))

(assert (=> d!113629 m!872971))

(assert (=> d!113629 m!872967))

(assert (=> d!113629 m!873149))

(assert (=> d!113439 d!113629))

(assert (=> d!113439 d!113479))

(declare-fun d!113631 () Bool)

(declare-fun e!527199 () Bool)

(assert (=> d!113631 e!527199))

(declare-fun res!631512 () Bool)

(assert (=> d!113631 (=> res!631512 e!527199)))

(declare-fun lt!423929 () Bool)

(assert (=> d!113631 (= res!631512 (not lt!423929))))

(declare-fun lt!423930 () Bool)

(assert (=> d!113631 (= lt!423929 lt!423930)))

(declare-fun lt!423931 () Unit!31596)

(declare-fun e!527200 () Unit!31596)

(assert (=> d!113631 (= lt!423931 e!527200)))

(declare-fun c!97854 () Bool)

(assert (=> d!113631 (= c!97854 lt!423930)))

(assert (=> d!113631 (= lt!423930 (containsKey!451 (toList!6077 lt!423611) (_1!6729 lt!423508)))))

(assert (=> d!113631 (= (contains!5081 lt!423611 (_1!6729 lt!423508)) lt!423929)))

(declare-fun b!938694 () Bool)

(declare-fun lt!423932 () Unit!31596)

(assert (=> b!938694 (= e!527200 lt!423932)))

(assert (=> b!938694 (= lt!423932 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6077 lt!423611) (_1!6729 lt!423508)))))

(assert (=> b!938694 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423611) (_1!6729 lt!423508)))))

(declare-fun b!938695 () Bool)

(declare-fun Unit!31615 () Unit!31596)

(assert (=> b!938695 (= e!527200 Unit!31615)))

(declare-fun b!938696 () Bool)

(assert (=> b!938696 (= e!527199 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423611) (_1!6729 lt!423508))))))

(assert (= (and d!113631 c!97854) b!938694))

(assert (= (and d!113631 (not c!97854)) b!938695))

(assert (= (and d!113631 (not res!631512)) b!938696))

(declare-fun m!873865 () Bool)

(assert (=> d!113631 m!873865))

(declare-fun m!873867 () Bool)

(assert (=> b!938694 m!873867))

(assert (=> b!938694 m!873143))

(assert (=> b!938694 m!873143))

(declare-fun m!873869 () Bool)

(assert (=> b!938694 m!873869))

(assert (=> b!938696 m!873143))

(assert (=> b!938696 m!873143))

(assert (=> b!938696 m!873869))

(assert (=> d!113437 d!113631))

(declare-fun b!938699 () Bool)

(declare-fun e!527202 () Option!493)

(assert (=> b!938699 (= e!527202 (getValueByKey!487 (t!27469 lt!423608) (_1!6729 lt!423508)))))

(declare-fun b!938698 () Bool)

(declare-fun e!527201 () Option!493)

(assert (=> b!938698 (= e!527201 e!527202)))

(declare-fun c!97856 () Bool)

(assert (=> b!938698 (= c!97856 (and ((_ is Cons!19175) lt!423608) (not (= (_1!6729 (h!20321 lt!423608)) (_1!6729 lt!423508)))))))

(declare-fun d!113633 () Bool)

(declare-fun c!97855 () Bool)

(assert (=> d!113633 (= c!97855 (and ((_ is Cons!19175) lt!423608) (= (_1!6729 (h!20321 lt!423608)) (_1!6729 lt!423508))))))

(assert (=> d!113633 (= (getValueByKey!487 lt!423608 (_1!6729 lt!423508)) e!527201)))

(declare-fun b!938697 () Bool)

(assert (=> b!938697 (= e!527201 (Some!492 (_2!6729 (h!20321 lt!423608))))))

(declare-fun b!938700 () Bool)

(assert (=> b!938700 (= e!527202 None!491)))

(assert (= (and d!113633 c!97855) b!938697))

(assert (= (and d!113633 (not c!97855)) b!938698))

(assert (= (and b!938698 c!97856) b!938699))

(assert (= (and b!938698 (not c!97856)) b!938700))

(declare-fun m!873871 () Bool)

(assert (=> b!938699 m!873871))

(assert (=> d!113437 d!113633))

(declare-fun d!113635 () Bool)

(assert (=> d!113635 (= (getValueByKey!487 lt!423608 (_1!6729 lt!423508)) (Some!492 (_2!6729 lt!423508)))))

(declare-fun lt!423933 () Unit!31596)

(assert (=> d!113635 (= lt!423933 (choose!1572 lt!423608 (_1!6729 lt!423508) (_2!6729 lt!423508)))))

(declare-fun e!527203 () Bool)

(assert (=> d!113635 e!527203))

(declare-fun res!631513 () Bool)

(assert (=> d!113635 (=> (not res!631513) (not e!527203))))

(assert (=> d!113635 (= res!631513 (isStrictlySorted!500 lt!423608))))

(assert (=> d!113635 (= (lemmaContainsTupThenGetReturnValue!261 lt!423608 (_1!6729 lt!423508) (_2!6729 lt!423508)) lt!423933)))

(declare-fun b!938701 () Bool)

(declare-fun res!631514 () Bool)

(assert (=> b!938701 (=> (not res!631514) (not e!527203))))

(assert (=> b!938701 (= res!631514 (containsKey!451 lt!423608 (_1!6729 lt!423508)))))

(declare-fun b!938702 () Bool)

(assert (=> b!938702 (= e!527203 (contains!5082 lt!423608 (tuple2!13437 (_1!6729 lt!423508) (_2!6729 lt!423508))))))

(assert (= (and d!113635 res!631513) b!938701))

(assert (= (and b!938701 res!631514) b!938702))

(assert (=> d!113635 m!873137))

(declare-fun m!873873 () Bool)

(assert (=> d!113635 m!873873))

(declare-fun m!873875 () Bool)

(assert (=> d!113635 m!873875))

(declare-fun m!873877 () Bool)

(assert (=> b!938701 m!873877))

(declare-fun m!873879 () Bool)

(assert (=> b!938702 m!873879))

(assert (=> d!113437 d!113635))

(declare-fun b!938703 () Bool)

(declare-fun e!527205 () List!19179)

(assert (=> b!938703 (= e!527205 (insertStrictlySorted!318 (t!27469 (toList!6077 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (_1!6729 lt!423508) (_2!6729 lt!423508)))))

(declare-fun b!938704 () Bool)

(declare-fun e!527207 () List!19179)

(declare-fun call!40867 () List!19179)

(assert (=> b!938704 (= e!527207 call!40867)))

(declare-fun b!938705 () Bool)

(declare-fun e!527208 () List!19179)

(declare-fun e!527204 () List!19179)

(assert (=> b!938705 (= e!527208 e!527204)))

(declare-fun c!97859 () Bool)

(assert (=> b!938705 (= c!97859 (and ((_ is Cons!19175) (toList!6077 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (= (_1!6729 (h!20321 (toList!6077 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) (_1!6729 lt!423508))))))

(declare-fun b!938707 () Bool)

(declare-fun c!97857 () Bool)

(assert (=> b!938707 (= e!527205 (ite c!97859 (t!27469 (toList!6077 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (ite c!97857 (Cons!19175 (h!20321 (toList!6077 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (t!27469 (toList!6077 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) Nil!19176)))))

(declare-fun c!97858 () Bool)

(declare-fun call!40865 () List!19179)

(declare-fun bm!40862 () Bool)

(assert (=> bm!40862 (= call!40865 ($colon$colon!554 e!527205 (ite c!97858 (h!20321 (toList!6077 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (tuple2!13437 (_1!6729 lt!423508) (_2!6729 lt!423508)))))))

(declare-fun c!97860 () Bool)

(assert (=> bm!40862 (= c!97860 c!97858)))

(declare-fun b!938708 () Bool)

(assert (=> b!938708 (= e!527208 call!40865)))

(declare-fun b!938709 () Bool)

(declare-fun res!631515 () Bool)

(declare-fun e!527206 () Bool)

(assert (=> b!938709 (=> (not res!631515) (not e!527206))))

(declare-fun lt!423934 () List!19179)

(assert (=> b!938709 (= res!631515 (containsKey!451 lt!423934 (_1!6729 lt!423508)))))

(declare-fun bm!40863 () Bool)

(declare-fun call!40866 () List!19179)

(assert (=> bm!40863 (= call!40866 call!40865)))

(declare-fun bm!40864 () Bool)

(assert (=> bm!40864 (= call!40867 call!40866)))

(declare-fun b!938710 () Bool)

(assert (=> b!938710 (= c!97857 (and ((_ is Cons!19175) (toList!6077 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (bvsgt (_1!6729 (h!20321 (toList!6077 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) (_1!6729 lt!423508))))))

(assert (=> b!938710 (= e!527204 e!527207)))

(declare-fun d!113637 () Bool)

(assert (=> d!113637 e!527206))

(declare-fun res!631516 () Bool)

(assert (=> d!113637 (=> (not res!631516) (not e!527206))))

(assert (=> d!113637 (= res!631516 (isStrictlySorted!500 lt!423934))))

(assert (=> d!113637 (= lt!423934 e!527208)))

(assert (=> d!113637 (= c!97858 (and ((_ is Cons!19175) (toList!6077 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (bvslt (_1!6729 (h!20321 (toList!6077 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) (_1!6729 lt!423508))))))

(assert (=> d!113637 (isStrictlySorted!500 (toList!6077 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))))

(assert (=> d!113637 (= (insertStrictlySorted!318 (toList!6077 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6729 lt!423508) (_2!6729 lt!423508)) lt!423934)))

(declare-fun b!938706 () Bool)

(assert (=> b!938706 (= e!527207 call!40867)))

(declare-fun b!938711 () Bool)

(assert (=> b!938711 (= e!527204 call!40866)))

(declare-fun b!938712 () Bool)

(assert (=> b!938712 (= e!527206 (contains!5082 lt!423934 (tuple2!13437 (_1!6729 lt!423508) (_2!6729 lt!423508))))))

(assert (= (and d!113637 c!97858) b!938708))

(assert (= (and d!113637 (not c!97858)) b!938705))

(assert (= (and b!938705 c!97859) b!938711))

(assert (= (and b!938705 (not c!97859)) b!938710))

(assert (= (and b!938710 c!97857) b!938704))

(assert (= (and b!938710 (not c!97857)) b!938706))

(assert (= (or b!938704 b!938706) bm!40864))

(assert (= (or b!938711 bm!40864) bm!40863))

(assert (= (or b!938708 bm!40863) bm!40862))

(assert (= (and bm!40862 c!97860) b!938703))

(assert (= (and bm!40862 (not c!97860)) b!938707))

(assert (= (and d!113637 res!631516) b!938709))

(assert (= (and b!938709 res!631515) b!938712))

(declare-fun m!873881 () Bool)

(assert (=> bm!40862 m!873881))

(declare-fun m!873883 () Bool)

(assert (=> b!938712 m!873883))

(declare-fun m!873885 () Bool)

(assert (=> d!113637 m!873885))

(declare-fun m!873887 () Bool)

(assert (=> d!113637 m!873887))

(declare-fun m!873889 () Bool)

(assert (=> b!938709 m!873889))

(declare-fun m!873891 () Bool)

(assert (=> b!938703 m!873891))

(assert (=> d!113437 d!113637))

(declare-fun d!113639 () Bool)

(declare-fun lt!423937 () Bool)

(declare-fun content!409 (List!19180) (InoxSet (_ BitVec 64)))

(assert (=> d!113639 (= lt!423937 (select (content!409 Nil!19177) (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!527213 () Bool)

(assert (=> d!113639 (= lt!423937 e!527213)))

(declare-fun res!631522 () Bool)

(assert (=> d!113639 (=> (not res!631522) (not e!527213))))

(assert (=> d!113639 (= res!631522 ((_ is Cons!19176) Nil!19177))))

(assert (=> d!113639 (= (contains!5083 Nil!19177 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) lt!423937)))

(declare-fun b!938717 () Bool)

(declare-fun e!527214 () Bool)

(assert (=> b!938717 (= e!527213 e!527214)))

(declare-fun res!631521 () Bool)

(assert (=> b!938717 (=> res!631521 e!527214)))

(assert (=> b!938717 (= res!631521 (= (h!20322 Nil!19177) (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!938718 () Bool)

(assert (=> b!938718 (= e!527214 (contains!5083 (t!27470 Nil!19177) (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (= (and d!113639 res!631522) b!938717))

(assert (= (and b!938717 (not res!631521)) b!938718))

(declare-fun m!873893 () Bool)

(assert (=> d!113639 m!873893))

(assert (=> d!113639 m!872993))

(declare-fun m!873895 () Bool)

(assert (=> d!113639 m!873895))

(assert (=> b!938718 m!872993))

(declare-fun m!873897 () Bool)

(assert (=> b!938718 m!873897))

(assert (=> b!938303 d!113639))

(declare-fun d!113641 () Bool)

(assert (=> d!113641 (= (apply!851 lt!423752 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14331 (getValueByKey!487 (toList!6077 lt!423752) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26343 () Bool)

(assert (= bs!26343 d!113641))

(assert (=> bs!26343 m!873849))

(assert (=> bs!26343 m!873849))

(declare-fun m!873899 () Bool)

(assert (=> bs!26343 m!873899))

(assert (=> b!938428 d!113641))

(declare-fun d!113643 () Bool)

(assert (=> d!113643 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423511) k0!1099))))

(declare-fun lt!423940 () Unit!31596)

(declare-fun choose!1573 (List!19179 (_ BitVec 64)) Unit!31596)

(assert (=> d!113643 (= lt!423940 (choose!1573 (toList!6077 lt!423511) k0!1099))))

(declare-fun e!527217 () Bool)

(assert (=> d!113643 e!527217))

(declare-fun res!631525 () Bool)

(assert (=> d!113643 (=> (not res!631525) (not e!527217))))

(assert (=> d!113643 (= res!631525 (isStrictlySorted!500 (toList!6077 lt!423511)))))

(assert (=> d!113643 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6077 lt!423511) k0!1099) lt!423940)))

(declare-fun b!938721 () Bool)

(assert (=> b!938721 (= e!527217 (containsKey!451 (toList!6077 lt!423511) k0!1099))))

(assert (= (and d!113643 res!631525) b!938721))

(assert (=> d!113643 m!873161))

(assert (=> d!113643 m!873161))

(assert (=> d!113643 m!873223))

(declare-fun m!873901 () Bool)

(assert (=> d!113643 m!873901))

(declare-fun m!873903 () Bool)

(assert (=> d!113643 m!873903))

(assert (=> b!938721 m!873219))

(assert (=> b!938374 d!113643))

(assert (=> b!938374 d!113627))

(assert (=> b!938374 d!113501))

(declare-fun b!938722 () Bool)

(declare-fun e!527222 () ListLongMap!12123)

(declare-fun e!527219 () ListLongMap!12123)

(assert (=> b!938722 (= e!527222 e!527219)))

(declare-fun c!97864 () Bool)

(assert (=> b!938722 (= c!97864 (validKeyInArray!0 (select (arr!27158 _keys!1487) from!1844)))))

(declare-fun b!938723 () Bool)

(assert (=> b!938723 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27619 _keys!1487)))))

(assert (=> b!938723 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27618 _values!1231)))))

(declare-fun lt!423947 () ListLongMap!12123)

(declare-fun e!527220 () Bool)

(assert (=> b!938723 (= e!527220 (= (apply!851 lt!423947 (select (arr!27158 _keys!1487) from!1844)) (get!14330 (select (arr!27157 _values!1231) from!1844) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!938724 () Bool)

(declare-fun e!527223 () Bool)

(assert (=> b!938724 (= e!527223 (= lt!423947 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))))

(declare-fun b!938725 () Bool)

(declare-fun e!527224 () Bool)

(assert (=> b!938725 (= e!527224 e!527223)))

(declare-fun c!97863 () Bool)

(assert (=> b!938725 (= c!97863 (bvslt from!1844 (size!27619 _keys!1487)))))

(declare-fun b!938726 () Bool)

(declare-fun call!40868 () ListLongMap!12123)

(assert (=> b!938726 (= e!527219 call!40868)))

(declare-fun b!938727 () Bool)

(declare-fun e!527221 () Bool)

(assert (=> b!938727 (= e!527221 e!527224)))

(declare-fun c!97861 () Bool)

(declare-fun e!527218 () Bool)

(assert (=> b!938727 (= c!97861 e!527218)))

(declare-fun res!631528 () Bool)

(assert (=> b!938727 (=> (not res!631528) (not e!527218))))

(assert (=> b!938727 (= res!631528 (bvslt from!1844 (size!27619 _keys!1487)))))

(declare-fun b!938728 () Bool)

(assert (=> b!938728 (= e!527218 (validKeyInArray!0 (select (arr!27158 _keys!1487) from!1844)))))

(assert (=> b!938728 (bvsge from!1844 #b00000000000000000000000000000000)))

(declare-fun b!938729 () Bool)

(assert (=> b!938729 (= e!527223 (isEmpty!703 lt!423947))))

(declare-fun b!938730 () Bool)

(assert (=> b!938730 (= e!527222 (ListLongMap!12124 Nil!19176))))

(declare-fun d!113645 () Bool)

(assert (=> d!113645 e!527221))

(declare-fun res!631526 () Bool)

(assert (=> d!113645 (=> (not res!631526) (not e!527221))))

(assert (=> d!113645 (= res!631526 (not (contains!5081 lt!423947 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!113645 (= lt!423947 e!527222)))

(declare-fun c!97862 () Bool)

(assert (=> d!113645 (= c!97862 (bvsge from!1844 (size!27619 _keys!1487)))))

(assert (=> d!113645 (validMask!0 mask!1881)))

(assert (=> d!113645 (= (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!423947)))

(declare-fun b!938731 () Bool)

(declare-fun res!631529 () Bool)

(assert (=> b!938731 (=> (not res!631529) (not e!527221))))

(assert (=> b!938731 (= res!631529 (not (contains!5081 lt!423947 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!40865 () Bool)

(assert (=> bm!40865 (= call!40868 (getCurrentListMapNoExtraKeys!3340 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!938732 () Bool)

(declare-fun lt!423941 () Unit!31596)

(declare-fun lt!423943 () Unit!31596)

(assert (=> b!938732 (= lt!423941 lt!423943)))

(declare-fun lt!423946 () V!31983)

(declare-fun lt!423942 () (_ BitVec 64))

(declare-fun lt!423944 () ListLongMap!12123)

(declare-fun lt!423945 () (_ BitVec 64))

(assert (=> b!938732 (not (contains!5081 (+!2865 lt!423944 (tuple2!13437 lt!423942 lt!423946)) lt!423945))))

(assert (=> b!938732 (= lt!423943 (addStillNotContains!222 lt!423944 lt!423942 lt!423946 lt!423945))))

(assert (=> b!938732 (= lt!423945 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!938732 (= lt!423946 (get!14330 (select (arr!27157 _values!1231) from!1844) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!938732 (= lt!423942 (select (arr!27158 _keys!1487) from!1844))))

(assert (=> b!938732 (= lt!423944 call!40868)))

(assert (=> b!938732 (= e!527219 (+!2865 call!40868 (tuple2!13437 (select (arr!27158 _keys!1487) from!1844) (get!14330 (select (arr!27157 _values!1231) from!1844) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!938733 () Bool)

(assert (=> b!938733 (= e!527224 e!527220)))

(assert (=> b!938733 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27619 _keys!1487)))))

(declare-fun res!631527 () Bool)

(assert (=> b!938733 (= res!631527 (contains!5081 lt!423947 (select (arr!27158 _keys!1487) from!1844)))))

(assert (=> b!938733 (=> (not res!631527) (not e!527220))))

(assert (= (and d!113645 c!97862) b!938730))

(assert (= (and d!113645 (not c!97862)) b!938722))

(assert (= (and b!938722 c!97864) b!938732))

(assert (= (and b!938722 (not c!97864)) b!938726))

(assert (= (or b!938732 b!938726) bm!40865))

(assert (= (and d!113645 res!631526) b!938731))

(assert (= (and b!938731 res!631529) b!938727))

(assert (= (and b!938727 res!631528) b!938728))

(assert (= (and b!938727 c!97861) b!938733))

(assert (= (and b!938727 (not c!97861)) b!938725))

(assert (= (and b!938733 res!631527) b!938723))

(assert (= (and b!938725 c!97863) b!938724))

(assert (= (and b!938725 (not c!97863)) b!938729))

(declare-fun b_lambda!14229 () Bool)

(assert (=> (not b_lambda!14229) (not b!938723)))

(assert (=> b!938723 t!27468))

(declare-fun b_and!29131 () Bool)

(assert (= b_and!29129 (and (=> t!27468 result!12125) b_and!29131)))

(declare-fun b_lambda!14231 () Bool)

(assert (=> (not b_lambda!14231) (not b!938732)))

(assert (=> b!938732 t!27468))

(declare-fun b_and!29133 () Bool)

(assert (= b_and!29131 (and (=> t!27468 result!12125) b_and!29133)))

(declare-fun m!873905 () Bool)

(assert (=> d!113645 m!873905))

(assert (=> d!113645 m!872943))

(declare-fun m!873907 () Bool)

(assert (=> b!938729 m!873907))

(declare-fun m!873909 () Bool)

(assert (=> b!938732 m!873909))

(declare-fun m!873911 () Bool)

(assert (=> b!938732 m!873911))

(declare-fun m!873913 () Bool)

(assert (=> b!938732 m!873913))

(assert (=> b!938732 m!873315))

(declare-fun m!873915 () Bool)

(assert (=> b!938732 m!873915))

(assert (=> b!938732 m!872967))

(assert (=> b!938732 m!873911))

(assert (=> b!938732 m!873311))

(assert (=> b!938732 m!873315))

(assert (=> b!938732 m!872967))

(assert (=> b!938732 m!873317))

(assert (=> b!938722 m!873311))

(assert (=> b!938722 m!873311))

(assert (=> b!938722 m!873359))

(assert (=> b!938733 m!873311))

(assert (=> b!938733 m!873311))

(declare-fun m!873917 () Bool)

(assert (=> b!938733 m!873917))

(declare-fun m!873919 () Bool)

(assert (=> b!938724 m!873919))

(assert (=> b!938728 m!873311))

(assert (=> b!938728 m!873311))

(assert (=> b!938728 m!873359))

(assert (=> bm!40865 m!873919))

(assert (=> b!938723 m!872967))

(assert (=> b!938723 m!873311))

(assert (=> b!938723 m!873315))

(assert (=> b!938723 m!872967))

(assert (=> b!938723 m!873317))

(assert (=> b!938723 m!873311))

(declare-fun m!873921 () Bool)

(assert (=> b!938723 m!873921))

(assert (=> b!938723 m!873315))

(declare-fun m!873923 () Bool)

(assert (=> b!938731 m!873923))

(assert (=> bm!40833 d!113645))

(assert (=> d!113461 d!113441))

(declare-fun d!113647 () Bool)

(assert (=> d!113647 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19177)))

(assert (=> d!113647 true))

(declare-fun _$71!183 () Unit!31596)

(assert (=> d!113647 (= (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) _$71!183)))

(declare-fun bs!26344 () Bool)

(assert (= bs!26344 d!113647))

(assert (=> bs!26344 m!872975))

(assert (=> d!113461 d!113647))

(assert (=> b!938301 d!113505))

(declare-fun d!113649 () Bool)

(declare-fun res!631530 () Bool)

(declare-fun e!527225 () Bool)

(assert (=> d!113649 (=> res!631530 e!527225)))

(assert (=> d!113649 (= res!631530 (= (select (arr!27158 _keys!1487) (bvadd from!1844 #b00000000000000000000000000000001)) k0!1099))))

(assert (=> d!113649 (= (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)) e!527225)))

(declare-fun b!938734 () Bool)

(declare-fun e!527226 () Bool)

(assert (=> b!938734 (= e!527225 e!527226)))

(declare-fun res!631531 () Bool)

(assert (=> b!938734 (=> (not res!631531) (not e!527226))))

(assert (=> b!938734 (= res!631531 (bvslt (bvadd from!1844 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!27619 _keys!1487)))))

(declare-fun b!938735 () Bool)

(assert (=> b!938735 (= e!527226 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!113649 (not res!631530)) b!938734))

(assert (= (and b!938734 res!631531) b!938735))

(declare-fun m!873925 () Bool)

(assert (=> d!113649 m!873925))

(declare-fun m!873927 () Bool)

(assert (=> b!938735 m!873927))

(assert (=> b!938446 d!113649))

(declare-fun d!113651 () Bool)

(declare-fun e!527227 () Bool)

(assert (=> d!113651 e!527227))

(declare-fun res!631532 () Bool)

(assert (=> d!113651 (=> res!631532 e!527227)))

(declare-fun lt!423948 () Bool)

(assert (=> d!113651 (= res!631532 (not lt!423948))))

(declare-fun lt!423949 () Bool)

(assert (=> d!113651 (= lt!423948 lt!423949)))

(declare-fun lt!423950 () Unit!31596)

(declare-fun e!527228 () Unit!31596)

(assert (=> d!113651 (= lt!423950 e!527228)))

(declare-fun c!97865 () Bool)

(assert (=> d!113651 (= c!97865 lt!423949)))

(assert (=> d!113651 (= lt!423949 (containsKey!451 (toList!6077 lt!423713) (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> d!113651 (= (contains!5081 lt!423713 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) lt!423948)))

(declare-fun b!938736 () Bool)

(declare-fun lt!423951 () Unit!31596)

(assert (=> b!938736 (= e!527228 lt!423951)))

(assert (=> b!938736 (= lt!423951 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6077 lt!423713) (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!938736 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423713) (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!938737 () Bool)

(declare-fun Unit!31616 () Unit!31596)

(assert (=> b!938737 (= e!527228 Unit!31616)))

(declare-fun b!938738 () Bool)

(assert (=> b!938738 (= e!527227 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423713) (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))))

(assert (= (and d!113651 c!97865) b!938736))

(assert (= (and d!113651 (not c!97865)) b!938737))

(assert (= (and d!113651 (not res!631532)) b!938738))

(assert (=> d!113651 m!873227))

(declare-fun m!873929 () Bool)

(assert (=> d!113651 m!873929))

(assert (=> b!938736 m!873227))

(declare-fun m!873931 () Bool)

(assert (=> b!938736 m!873931))

(assert (=> b!938736 m!873227))

(assert (=> b!938736 m!873837))

(assert (=> b!938736 m!873837))

(declare-fun m!873933 () Bool)

(assert (=> b!938736 m!873933))

(assert (=> b!938738 m!873227))

(assert (=> b!938738 m!873837))

(assert (=> b!938738 m!873837))

(assert (=> b!938738 m!873933))

(assert (=> b!938388 d!113651))

(declare-fun d!113653 () Bool)

(assert (=> d!113653 (= (apply!851 lt!423713 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14331 (getValueByKey!487 (toList!6077 lt!423713) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26345 () Bool)

(assert (= bs!26345 d!113653))

(assert (=> bs!26345 m!873857))

(assert (=> bs!26345 m!873857))

(declare-fun m!873935 () Bool)

(assert (=> bs!26345 m!873935))

(assert (=> b!938387 d!113653))

(declare-fun d!113655 () Bool)

(declare-fun e!527229 () Bool)

(assert (=> d!113655 e!527229))

(declare-fun res!631534 () Bool)

(assert (=> d!113655 (=> (not res!631534) (not e!527229))))

(declare-fun lt!423955 () ListLongMap!12123)

(assert (=> d!113655 (= res!631534 (contains!5081 lt!423955 (_1!6729 (ite (or c!97760 c!97759) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun lt!423952 () List!19179)

(assert (=> d!113655 (= lt!423955 (ListLongMap!12124 lt!423952))))

(declare-fun lt!423953 () Unit!31596)

(declare-fun lt!423954 () Unit!31596)

(assert (=> d!113655 (= lt!423953 lt!423954)))

(assert (=> d!113655 (= (getValueByKey!487 lt!423952 (_1!6729 (ite (or c!97760 c!97759) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!492 (_2!6729 (ite (or c!97760 c!97759) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113655 (= lt!423954 (lemmaContainsTupThenGetReturnValue!261 lt!423952 (_1!6729 (ite (or c!97760 c!97759) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6729 (ite (or c!97760 c!97759) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113655 (= lt!423952 (insertStrictlySorted!318 (toList!6077 (ite c!97760 call!40823 (ite c!97759 call!40822 call!40824))) (_1!6729 (ite (or c!97760 c!97759) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6729 (ite (or c!97760 c!97759) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113655 (= (+!2865 (ite c!97760 call!40823 (ite c!97759 call!40822 call!40824)) (ite (or c!97760 c!97759) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) lt!423955)))

(declare-fun b!938739 () Bool)

(declare-fun res!631533 () Bool)

(assert (=> b!938739 (=> (not res!631533) (not e!527229))))

(assert (=> b!938739 (= res!631533 (= (getValueByKey!487 (toList!6077 lt!423955) (_1!6729 (ite (or c!97760 c!97759) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!492 (_2!6729 (ite (or c!97760 c!97759) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))))

(declare-fun b!938740 () Bool)

(assert (=> b!938740 (= e!527229 (contains!5082 (toList!6077 lt!423955) (ite (or c!97760 c!97759) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (= (and d!113655 res!631534) b!938739))

(assert (= (and b!938739 res!631533) b!938740))

(declare-fun m!873937 () Bool)

(assert (=> d!113655 m!873937))

(declare-fun m!873939 () Bool)

(assert (=> d!113655 m!873939))

(declare-fun m!873941 () Bool)

(assert (=> d!113655 m!873941))

(declare-fun m!873943 () Bool)

(assert (=> d!113655 m!873943))

(declare-fun m!873945 () Bool)

(assert (=> b!938739 m!873945))

(declare-fun m!873947 () Bool)

(assert (=> b!938740 m!873947))

(assert (=> bm!40817 d!113655))

(declare-fun b!938741 () Bool)

(declare-fun e!527230 () Bool)

(declare-fun call!40869 () Bool)

(assert (=> b!938741 (= e!527230 call!40869)))

(declare-fun c!97866 () Bool)

(declare-fun bm!40866 () Bool)

(assert (=> bm!40866 (= call!40869 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!97866 (Cons!19176 (select (arr!27158 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (ite c!97746 (Cons!19176 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19177) Nil!19177)) (ite c!97746 (Cons!19176 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19177) Nil!19177))))))

(declare-fun b!938742 () Bool)

(assert (=> b!938742 (= e!527230 call!40869)))

(declare-fun b!938743 () Bool)

(declare-fun e!527233 () Bool)

(assert (=> b!938743 (= e!527233 e!527230)))

(assert (=> b!938743 (= c!97866 (validKeyInArray!0 (select (arr!27158 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun b!938745 () Bool)

(declare-fun e!527232 () Bool)

(assert (=> b!938745 (= e!527232 (contains!5083 (ite c!97746 (Cons!19176 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19177) Nil!19177) (select (arr!27158 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun d!113657 () Bool)

(declare-fun res!631537 () Bool)

(declare-fun e!527231 () Bool)

(assert (=> d!113657 (=> res!631537 e!527231)))

(assert (=> d!113657 (= res!631537 (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27619 _keys!1487)))))

(assert (=> d!113657 (= (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97746 (Cons!19176 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19177) Nil!19177)) e!527231)))

(declare-fun b!938744 () Bool)

(assert (=> b!938744 (= e!527231 e!527233)))

(declare-fun res!631536 () Bool)

(assert (=> b!938744 (=> (not res!631536) (not e!527233))))

(assert (=> b!938744 (= res!631536 (not e!527232))))

(declare-fun res!631535 () Bool)

(assert (=> b!938744 (=> (not res!631535) (not e!527232))))

(assert (=> b!938744 (= res!631535 (validKeyInArray!0 (select (arr!27158 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(assert (= (and d!113657 (not res!631537)) b!938744))

(assert (= (and b!938744 res!631535) b!938745))

(assert (= (and b!938744 res!631536) b!938743))

(assert (= (and b!938743 c!97866) b!938741))

(assert (= (and b!938743 (not c!97866)) b!938742))

(assert (= (or b!938741 b!938742) bm!40866))

(assert (=> bm!40866 m!873403))

(declare-fun m!873949 () Bool)

(assert (=> bm!40866 m!873949))

(assert (=> b!938743 m!873403))

(assert (=> b!938743 m!873403))

(assert (=> b!938743 m!873451))

(assert (=> b!938745 m!873403))

(assert (=> b!938745 m!873403))

(declare-fun m!873951 () Bool)

(assert (=> b!938745 m!873951))

(assert (=> b!938744 m!873403))

(assert (=> b!938744 m!873403))

(assert (=> b!938744 m!873451))

(assert (=> bm!40801 d!113657))

(declare-fun d!113659 () Bool)

(declare-fun lt!423956 () Bool)

(assert (=> d!113659 (= lt!423956 (select (content!409 Nil!19177) (select (arr!27158 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun e!527234 () Bool)

(assert (=> d!113659 (= lt!423956 e!527234)))

(declare-fun res!631539 () Bool)

(assert (=> d!113659 (=> (not res!631539) (not e!527234))))

(assert (=> d!113659 (= res!631539 ((_ is Cons!19176) Nil!19177))))

(assert (=> d!113659 (= (contains!5083 Nil!19177 (select (arr!27158 _keys!1487) #b00000000000000000000000000000000)) lt!423956)))

(declare-fun b!938746 () Bool)

(declare-fun e!527235 () Bool)

(assert (=> b!938746 (= e!527234 e!527235)))

(declare-fun res!631538 () Bool)

(assert (=> b!938746 (=> res!631538 e!527235)))

(assert (=> b!938746 (= res!631538 (= (h!20322 Nil!19177) (select (arr!27158 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!938747 () Bool)

(assert (=> b!938747 (= e!527235 (contains!5083 (t!27470 Nil!19177) (select (arr!27158 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!113659 res!631539) b!938746))

(assert (= (and b!938746 (not res!631538)) b!938747))

(assert (=> d!113659 m!873893))

(assert (=> d!113659 m!873369))

(declare-fun m!873953 () Bool)

(assert (=> d!113659 m!873953))

(assert (=> b!938747 m!873369))

(declare-fun m!873955 () Bool)

(assert (=> b!938747 m!873955))

(assert (=> b!938451 d!113659))

(assert (=> b!938449 d!113515))

(assert (=> b!938440 d!113645))

(declare-fun d!113661 () Bool)

(declare-fun e!527236 () Bool)

(assert (=> d!113661 e!527236))

(declare-fun res!631541 () Bool)

(assert (=> d!113661 (=> (not res!631541) (not e!527236))))

(declare-fun lt!423960 () ListLongMap!12123)

(assert (=> d!113661 (= res!631541 (contains!5081 lt!423960 (_1!6729 (tuple2!13437 lt!423756 zeroValue!1173))))))

(declare-fun lt!423957 () List!19179)

(assert (=> d!113661 (= lt!423960 (ListLongMap!12124 lt!423957))))

(declare-fun lt!423958 () Unit!31596)

(declare-fun lt!423959 () Unit!31596)

(assert (=> d!113661 (= lt!423958 lt!423959)))

(assert (=> d!113661 (= (getValueByKey!487 lt!423957 (_1!6729 (tuple2!13437 lt!423756 zeroValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423756 zeroValue!1173))))))

(assert (=> d!113661 (= lt!423959 (lemmaContainsTupThenGetReturnValue!261 lt!423957 (_1!6729 (tuple2!13437 lt!423756 zeroValue!1173)) (_2!6729 (tuple2!13437 lt!423756 zeroValue!1173))))))

(assert (=> d!113661 (= lt!423957 (insertStrictlySorted!318 (toList!6077 lt!423745) (_1!6729 (tuple2!13437 lt!423756 zeroValue!1173)) (_2!6729 (tuple2!13437 lt!423756 zeroValue!1173))))))

(assert (=> d!113661 (= (+!2865 lt!423745 (tuple2!13437 lt!423756 zeroValue!1173)) lt!423960)))

(declare-fun b!938748 () Bool)

(declare-fun res!631540 () Bool)

(assert (=> b!938748 (=> (not res!631540) (not e!527236))))

(assert (=> b!938748 (= res!631540 (= (getValueByKey!487 (toList!6077 lt!423960) (_1!6729 (tuple2!13437 lt!423756 zeroValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423756 zeroValue!1173)))))))

(declare-fun b!938749 () Bool)

(assert (=> b!938749 (= e!527236 (contains!5082 (toList!6077 lt!423960) (tuple2!13437 lt!423756 zeroValue!1173)))))

(assert (= (and d!113661 res!631541) b!938748))

(assert (= (and b!938748 res!631540) b!938749))

(declare-fun m!873957 () Bool)

(assert (=> d!113661 m!873957))

(declare-fun m!873959 () Bool)

(assert (=> d!113661 m!873959))

(declare-fun m!873961 () Bool)

(assert (=> d!113661 m!873961))

(declare-fun m!873963 () Bool)

(assert (=> d!113661 m!873963))

(declare-fun m!873965 () Bool)

(assert (=> b!938748 m!873965))

(declare-fun m!873967 () Bool)

(assert (=> b!938749 m!873967))

(assert (=> b!938440 d!113661))

(declare-fun d!113663 () Bool)

(assert (=> d!113663 (= (apply!851 (+!2865 lt!423743 (tuple2!13437 lt!423738 minValue!1173)) lt!423739) (apply!851 lt!423743 lt!423739))))

(declare-fun lt!423961 () Unit!31596)

(assert (=> d!113663 (= lt!423961 (choose!1571 lt!423743 lt!423738 minValue!1173 lt!423739))))

(declare-fun e!527237 () Bool)

(assert (=> d!113663 e!527237))

(declare-fun res!631542 () Bool)

(assert (=> d!113663 (=> (not res!631542) (not e!527237))))

(assert (=> d!113663 (= res!631542 (contains!5081 lt!423743 lt!423739))))

(assert (=> d!113663 (= (addApplyDifferent!434 lt!423743 lt!423738 minValue!1173 lt!423739) lt!423961)))

(declare-fun b!938750 () Bool)

(assert (=> b!938750 (= e!527237 (not (= lt!423739 lt!423738)))))

(assert (= (and d!113663 res!631542) b!938750))

(declare-fun m!873969 () Bool)

(assert (=> d!113663 m!873969))

(assert (=> d!113663 m!873321))

(assert (=> d!113663 m!873343))

(assert (=> d!113663 m!873321))

(assert (=> d!113663 m!873323))

(declare-fun m!873971 () Bool)

(assert (=> d!113663 m!873971))

(assert (=> b!938440 d!113663))

(declare-fun d!113665 () Bool)

(declare-fun e!527238 () Bool)

(assert (=> d!113665 e!527238))

(declare-fun res!631543 () Bool)

(assert (=> d!113665 (=> res!631543 e!527238)))

(declare-fun lt!423962 () Bool)

(assert (=> d!113665 (= res!631543 (not lt!423962))))

(declare-fun lt!423963 () Bool)

(assert (=> d!113665 (= lt!423962 lt!423963)))

(declare-fun lt!423964 () Unit!31596)

(declare-fun e!527239 () Unit!31596)

(assert (=> d!113665 (= lt!423964 e!527239)))

(declare-fun c!97867 () Bool)

(assert (=> d!113665 (= c!97867 lt!423963)))

(assert (=> d!113665 (= lt!423963 (containsKey!451 (toList!6077 (+!2865 lt!423745 (tuple2!13437 lt!423756 zeroValue!1173))) lt!423750))))

(assert (=> d!113665 (= (contains!5081 (+!2865 lt!423745 (tuple2!13437 lt!423756 zeroValue!1173)) lt!423750) lt!423962)))

(declare-fun b!938751 () Bool)

(declare-fun lt!423965 () Unit!31596)

(assert (=> b!938751 (= e!527239 lt!423965)))

(assert (=> b!938751 (= lt!423965 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6077 (+!2865 lt!423745 (tuple2!13437 lt!423756 zeroValue!1173))) lt!423750))))

(assert (=> b!938751 (isDefined!359 (getValueByKey!487 (toList!6077 (+!2865 lt!423745 (tuple2!13437 lt!423756 zeroValue!1173))) lt!423750))))

(declare-fun b!938752 () Bool)

(declare-fun Unit!31617 () Unit!31596)

(assert (=> b!938752 (= e!527239 Unit!31617)))

(declare-fun b!938753 () Bool)

(assert (=> b!938753 (= e!527238 (isDefined!359 (getValueByKey!487 (toList!6077 (+!2865 lt!423745 (tuple2!13437 lt!423756 zeroValue!1173))) lt!423750)))))

(assert (= (and d!113665 c!97867) b!938751))

(assert (= (and d!113665 (not c!97867)) b!938752))

(assert (= (and d!113665 (not res!631543)) b!938753))

(declare-fun m!873973 () Bool)

(assert (=> d!113665 m!873973))

(declare-fun m!873975 () Bool)

(assert (=> b!938751 m!873975))

(declare-fun m!873977 () Bool)

(assert (=> b!938751 m!873977))

(assert (=> b!938751 m!873977))

(declare-fun m!873979 () Bool)

(assert (=> b!938751 m!873979))

(assert (=> b!938753 m!873977))

(assert (=> b!938753 m!873977))

(assert (=> b!938753 m!873979))

(assert (=> b!938440 d!113665))

(declare-fun d!113667 () Bool)

(declare-fun e!527240 () Bool)

(assert (=> d!113667 e!527240))

(declare-fun res!631545 () Bool)

(assert (=> d!113667 (=> (not res!631545) (not e!527240))))

(declare-fun lt!423969 () ListLongMap!12123)

(assert (=> d!113667 (= res!631545 (contains!5081 lt!423969 (_1!6729 (tuple2!13437 lt!423757 minValue!1173))))))

(declare-fun lt!423966 () List!19179)

(assert (=> d!113667 (= lt!423969 (ListLongMap!12124 lt!423966))))

(declare-fun lt!423967 () Unit!31596)

(declare-fun lt!423968 () Unit!31596)

(assert (=> d!113667 (= lt!423967 lt!423968)))

(assert (=> d!113667 (= (getValueByKey!487 lt!423966 (_1!6729 (tuple2!13437 lt!423757 minValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423757 minValue!1173))))))

(assert (=> d!113667 (= lt!423968 (lemmaContainsTupThenGetReturnValue!261 lt!423966 (_1!6729 (tuple2!13437 lt!423757 minValue!1173)) (_2!6729 (tuple2!13437 lt!423757 minValue!1173))))))

(assert (=> d!113667 (= lt!423966 (insertStrictlySorted!318 (toList!6077 lt!423742) (_1!6729 (tuple2!13437 lt!423757 minValue!1173)) (_2!6729 (tuple2!13437 lt!423757 minValue!1173))))))

(assert (=> d!113667 (= (+!2865 lt!423742 (tuple2!13437 lt!423757 minValue!1173)) lt!423969)))

(declare-fun b!938754 () Bool)

(declare-fun res!631544 () Bool)

(assert (=> b!938754 (=> (not res!631544) (not e!527240))))

(assert (=> b!938754 (= res!631544 (= (getValueByKey!487 (toList!6077 lt!423969) (_1!6729 (tuple2!13437 lt!423757 minValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423757 minValue!1173)))))))

(declare-fun b!938755 () Bool)

(assert (=> b!938755 (= e!527240 (contains!5082 (toList!6077 lt!423969) (tuple2!13437 lt!423757 minValue!1173)))))

(assert (= (and d!113667 res!631545) b!938754))

(assert (= (and b!938754 res!631544) b!938755))

(declare-fun m!873981 () Bool)

(assert (=> d!113667 m!873981))

(declare-fun m!873983 () Bool)

(assert (=> d!113667 m!873983))

(declare-fun m!873985 () Bool)

(assert (=> d!113667 m!873985))

(declare-fun m!873987 () Bool)

(assert (=> d!113667 m!873987))

(declare-fun m!873989 () Bool)

(assert (=> b!938754 m!873989))

(declare-fun m!873991 () Bool)

(assert (=> b!938755 m!873991))

(assert (=> b!938440 d!113667))

(declare-fun d!113669 () Bool)

(assert (=> d!113669 (contains!5081 (+!2865 lt!423745 (tuple2!13437 lt!423756 zeroValue!1173)) lt!423750)))

(declare-fun lt!423970 () Unit!31596)

(assert (=> d!113669 (= lt!423970 (choose!1569 lt!423745 lt!423756 zeroValue!1173 lt!423750))))

(assert (=> d!113669 (contains!5081 lt!423745 lt!423750)))

(assert (=> d!113669 (= (addStillContains!554 lt!423745 lt!423756 zeroValue!1173 lt!423750) lt!423970)))

(declare-fun bs!26346 () Bool)

(assert (= bs!26346 d!113669))

(assert (=> bs!26346 m!873349))

(assert (=> bs!26346 m!873349))

(assert (=> bs!26346 m!873351))

(declare-fun m!873993 () Bool)

(assert (=> bs!26346 m!873993))

(declare-fun m!873995 () Bool)

(assert (=> bs!26346 m!873995))

(assert (=> b!938440 d!113669))

(declare-fun d!113671 () Bool)

(assert (=> d!113671 (= (apply!851 lt!423742 lt!423741) (get!14331 (getValueByKey!487 (toList!6077 lt!423742) lt!423741)))))

(declare-fun bs!26347 () Bool)

(assert (= bs!26347 d!113671))

(declare-fun m!873997 () Bool)

(assert (=> bs!26347 m!873997))

(assert (=> bs!26347 m!873997))

(declare-fun m!873999 () Bool)

(assert (=> bs!26347 m!873999))

(assert (=> b!938440 d!113671))

(declare-fun d!113673 () Bool)

(assert (=> d!113673 (= (apply!851 (+!2865 lt!423743 (tuple2!13437 lt!423738 minValue!1173)) lt!423739) (get!14331 (getValueByKey!487 (toList!6077 (+!2865 lt!423743 (tuple2!13437 lt!423738 minValue!1173))) lt!423739)))))

(declare-fun bs!26348 () Bool)

(assert (= bs!26348 d!113673))

(declare-fun m!874001 () Bool)

(assert (=> bs!26348 m!874001))

(assert (=> bs!26348 m!874001))

(declare-fun m!874003 () Bool)

(assert (=> bs!26348 m!874003))

(assert (=> b!938440 d!113673))

(declare-fun d!113675 () Bool)

(assert (=> d!113675 (= (apply!851 lt!423743 lt!423739) (get!14331 (getValueByKey!487 (toList!6077 lt!423743) lt!423739)))))

(declare-fun bs!26349 () Bool)

(assert (= bs!26349 d!113675))

(declare-fun m!874005 () Bool)

(assert (=> bs!26349 m!874005))

(assert (=> bs!26349 m!874005))

(declare-fun m!874007 () Bool)

(assert (=> bs!26349 m!874007))

(assert (=> b!938440 d!113675))

(declare-fun d!113677 () Bool)

(assert (=> d!113677 (= (apply!851 (+!2865 lt!423742 (tuple2!13437 lt!423757 minValue!1173)) lt!423741) (get!14331 (getValueByKey!487 (toList!6077 (+!2865 lt!423742 (tuple2!13437 lt!423757 minValue!1173))) lt!423741)))))

(declare-fun bs!26350 () Bool)

(assert (= bs!26350 d!113677))

(declare-fun m!874009 () Bool)

(assert (=> bs!26350 m!874009))

(assert (=> bs!26350 m!874009))

(declare-fun m!874011 () Bool)

(assert (=> bs!26350 m!874011))

(assert (=> b!938440 d!113677))

(declare-fun d!113679 () Bool)

(assert (=> d!113679 (= (apply!851 (+!2865 lt!423742 (tuple2!13437 lt!423757 minValue!1173)) lt!423741) (apply!851 lt!423742 lt!423741))))

(declare-fun lt!423971 () Unit!31596)

(assert (=> d!113679 (= lt!423971 (choose!1571 lt!423742 lt!423757 minValue!1173 lt!423741))))

(declare-fun e!527241 () Bool)

(assert (=> d!113679 e!527241))

(declare-fun res!631546 () Bool)

(assert (=> d!113679 (=> (not res!631546) (not e!527241))))

(assert (=> d!113679 (= res!631546 (contains!5081 lt!423742 lt!423741))))

(assert (=> d!113679 (= (addApplyDifferent!434 lt!423742 lt!423757 minValue!1173 lt!423741) lt!423971)))

(declare-fun b!938756 () Bool)

(assert (=> b!938756 (= e!527241 (not (= lt!423741 lt!423757)))))

(assert (= (and d!113679 res!631546) b!938756))

(declare-fun m!874013 () Bool)

(assert (=> d!113679 m!874013))

(assert (=> d!113679 m!873339))

(assert (=> d!113679 m!873329))

(assert (=> d!113679 m!873339))

(assert (=> d!113679 m!873341))

(declare-fun m!874015 () Bool)

(assert (=> d!113679 m!874015))

(assert (=> b!938440 d!113679))

(declare-fun d!113681 () Bool)

(declare-fun e!527242 () Bool)

(assert (=> d!113681 e!527242))

(declare-fun res!631548 () Bool)

(assert (=> d!113681 (=> (not res!631548) (not e!527242))))

(declare-fun lt!423975 () ListLongMap!12123)

(assert (=> d!113681 (= res!631548 (contains!5081 lt!423975 (_1!6729 (tuple2!13437 lt!423738 minValue!1173))))))

(declare-fun lt!423972 () List!19179)

(assert (=> d!113681 (= lt!423975 (ListLongMap!12124 lt!423972))))

(declare-fun lt!423973 () Unit!31596)

(declare-fun lt!423974 () Unit!31596)

(assert (=> d!113681 (= lt!423973 lt!423974)))

(assert (=> d!113681 (= (getValueByKey!487 lt!423972 (_1!6729 (tuple2!13437 lt!423738 minValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423738 minValue!1173))))))

(assert (=> d!113681 (= lt!423974 (lemmaContainsTupThenGetReturnValue!261 lt!423972 (_1!6729 (tuple2!13437 lt!423738 minValue!1173)) (_2!6729 (tuple2!13437 lt!423738 minValue!1173))))))

(assert (=> d!113681 (= lt!423972 (insertStrictlySorted!318 (toList!6077 lt!423743) (_1!6729 (tuple2!13437 lt!423738 minValue!1173)) (_2!6729 (tuple2!13437 lt!423738 minValue!1173))))))

(assert (=> d!113681 (= (+!2865 lt!423743 (tuple2!13437 lt!423738 minValue!1173)) lt!423975)))

(declare-fun b!938757 () Bool)

(declare-fun res!631547 () Bool)

(assert (=> b!938757 (=> (not res!631547) (not e!527242))))

(assert (=> b!938757 (= res!631547 (= (getValueByKey!487 (toList!6077 lt!423975) (_1!6729 (tuple2!13437 lt!423738 minValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423738 minValue!1173)))))))

(declare-fun b!938758 () Bool)

(assert (=> b!938758 (= e!527242 (contains!5082 (toList!6077 lt!423975) (tuple2!13437 lt!423738 minValue!1173)))))

(assert (= (and d!113681 res!631548) b!938757))

(assert (= (and b!938757 res!631547) b!938758))

(declare-fun m!874017 () Bool)

(assert (=> d!113681 m!874017))

(declare-fun m!874019 () Bool)

(assert (=> d!113681 m!874019))

(declare-fun m!874021 () Bool)

(assert (=> d!113681 m!874021))

(declare-fun m!874023 () Bool)

(assert (=> d!113681 m!874023))

(declare-fun m!874025 () Bool)

(assert (=> b!938757 m!874025))

(declare-fun m!874027 () Bool)

(assert (=> b!938758 m!874027))

(assert (=> b!938440 d!113681))

(declare-fun d!113683 () Bool)

(assert (=> d!113683 (= (apply!851 (+!2865 lt!423755 (tuple2!13437 lt!423748 zeroValue!1173)) lt!423753) (apply!851 lt!423755 lt!423753))))

(declare-fun lt!423976 () Unit!31596)

(assert (=> d!113683 (= lt!423976 (choose!1571 lt!423755 lt!423748 zeroValue!1173 lt!423753))))

(declare-fun e!527243 () Bool)

(assert (=> d!113683 e!527243))

(declare-fun res!631549 () Bool)

(assert (=> d!113683 (=> (not res!631549) (not e!527243))))

(assert (=> d!113683 (= res!631549 (contains!5081 lt!423755 lt!423753))))

(assert (=> d!113683 (= (addApplyDifferent!434 lt!423755 lt!423748 zeroValue!1173 lt!423753) lt!423976)))

(declare-fun b!938759 () Bool)

(assert (=> b!938759 (= e!527243 (not (= lt!423753 lt!423748)))))

(assert (= (and d!113683 res!631549) b!938759))

(declare-fun m!874029 () Bool)

(assert (=> d!113683 m!874029))

(assert (=> d!113683 m!873335))

(assert (=> d!113683 m!873327))

(assert (=> d!113683 m!873335))

(assert (=> d!113683 m!873337))

(declare-fun m!874031 () Bool)

(assert (=> d!113683 m!874031))

(assert (=> b!938440 d!113683))

(declare-fun d!113685 () Bool)

(assert (=> d!113685 (= (apply!851 (+!2865 lt!423755 (tuple2!13437 lt!423748 zeroValue!1173)) lt!423753) (get!14331 (getValueByKey!487 (toList!6077 (+!2865 lt!423755 (tuple2!13437 lt!423748 zeroValue!1173))) lt!423753)))))

(declare-fun bs!26351 () Bool)

(assert (= bs!26351 d!113685))

(declare-fun m!874033 () Bool)

(assert (=> bs!26351 m!874033))

(assert (=> bs!26351 m!874033))

(declare-fun m!874035 () Bool)

(assert (=> bs!26351 m!874035))

(assert (=> b!938440 d!113685))

(declare-fun d!113687 () Bool)

(declare-fun e!527244 () Bool)

(assert (=> d!113687 e!527244))

(declare-fun res!631551 () Bool)

(assert (=> d!113687 (=> (not res!631551) (not e!527244))))

(declare-fun lt!423980 () ListLongMap!12123)

(assert (=> d!113687 (= res!631551 (contains!5081 lt!423980 (_1!6729 (tuple2!13437 lt!423748 zeroValue!1173))))))

(declare-fun lt!423977 () List!19179)

(assert (=> d!113687 (= lt!423980 (ListLongMap!12124 lt!423977))))

(declare-fun lt!423978 () Unit!31596)

(declare-fun lt!423979 () Unit!31596)

(assert (=> d!113687 (= lt!423978 lt!423979)))

(assert (=> d!113687 (= (getValueByKey!487 lt!423977 (_1!6729 (tuple2!13437 lt!423748 zeroValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423748 zeroValue!1173))))))

(assert (=> d!113687 (= lt!423979 (lemmaContainsTupThenGetReturnValue!261 lt!423977 (_1!6729 (tuple2!13437 lt!423748 zeroValue!1173)) (_2!6729 (tuple2!13437 lt!423748 zeroValue!1173))))))

(assert (=> d!113687 (= lt!423977 (insertStrictlySorted!318 (toList!6077 lt!423755) (_1!6729 (tuple2!13437 lt!423748 zeroValue!1173)) (_2!6729 (tuple2!13437 lt!423748 zeroValue!1173))))))

(assert (=> d!113687 (= (+!2865 lt!423755 (tuple2!13437 lt!423748 zeroValue!1173)) lt!423980)))

(declare-fun b!938760 () Bool)

(declare-fun res!631550 () Bool)

(assert (=> b!938760 (=> (not res!631550) (not e!527244))))

(assert (=> b!938760 (= res!631550 (= (getValueByKey!487 (toList!6077 lt!423980) (_1!6729 (tuple2!13437 lt!423748 zeroValue!1173))) (Some!492 (_2!6729 (tuple2!13437 lt!423748 zeroValue!1173)))))))

(declare-fun b!938761 () Bool)

(assert (=> b!938761 (= e!527244 (contains!5082 (toList!6077 lt!423980) (tuple2!13437 lt!423748 zeroValue!1173)))))

(assert (= (and d!113687 res!631551) b!938760))

(assert (= (and b!938760 res!631550) b!938761))

(declare-fun m!874037 () Bool)

(assert (=> d!113687 m!874037))

(declare-fun m!874039 () Bool)

(assert (=> d!113687 m!874039))

(declare-fun m!874041 () Bool)

(assert (=> d!113687 m!874041))

(declare-fun m!874043 () Bool)

(assert (=> d!113687 m!874043))

(declare-fun m!874045 () Bool)

(assert (=> b!938760 m!874045))

(declare-fun m!874047 () Bool)

(assert (=> b!938761 m!874047))

(assert (=> b!938440 d!113687))

(declare-fun d!113689 () Bool)

(assert (=> d!113689 (= (apply!851 lt!423755 lt!423753) (get!14331 (getValueByKey!487 (toList!6077 lt!423755) lt!423753)))))

(declare-fun bs!26352 () Bool)

(assert (= bs!26352 d!113689))

(declare-fun m!874049 () Bool)

(assert (=> bs!26352 m!874049))

(assert (=> bs!26352 m!874049))

(declare-fun m!874051 () Bool)

(assert (=> bs!26352 m!874051))

(assert (=> b!938440 d!113689))

(assert (=> d!113457 d!113471))

(declare-fun d!113691 () Bool)

(assert (=> d!113691 (= (apply!851 (+!2865 lt!423502 (tuple2!13437 lt!423500 lt!423505)) k0!1099) (get!14331 (getValueByKey!487 (toList!6077 (+!2865 lt!423502 (tuple2!13437 lt!423500 lt!423505))) k0!1099)))))

(declare-fun bs!26353 () Bool)

(assert (= bs!26353 d!113691))

(declare-fun m!874053 () Bool)

(assert (=> bs!26353 m!874053))

(assert (=> bs!26353 m!874053))

(declare-fun m!874055 () Bool)

(assert (=> bs!26353 m!874055))

(assert (=> d!113457 d!113691))

(assert (=> d!113457 d!113467))

(declare-fun d!113693 () Bool)

(assert (=> d!113693 (= (apply!851 (+!2865 lt!423502 (tuple2!13437 lt!423500 lt!423505)) k0!1099) (apply!851 lt!423502 k0!1099))))

(assert (=> d!113693 true))

(declare-fun _$34!1161 () Unit!31596)

(assert (=> d!113693 (= (choose!1571 lt!423502 lt!423500 lt!423505 k0!1099) _$34!1161)))

(declare-fun bs!26354 () Bool)

(assert (= bs!26354 d!113693))

(assert (=> bs!26354 m!873165))

(assert (=> bs!26354 m!873165))

(assert (=> bs!26354 m!873283))

(assert (=> bs!26354 m!872997))

(assert (=> d!113457 d!113693))

(declare-fun d!113695 () Bool)

(declare-fun e!527245 () Bool)

(assert (=> d!113695 e!527245))

(declare-fun res!631553 () Bool)

(assert (=> d!113695 (=> (not res!631553) (not e!527245))))

(declare-fun lt!423984 () ListLongMap!12123)

(assert (=> d!113695 (= res!631553 (contains!5081 lt!423984 (_1!6729 (tuple2!13437 lt!423500 lt!423505))))))

(declare-fun lt!423981 () List!19179)

(assert (=> d!113695 (= lt!423984 (ListLongMap!12124 lt!423981))))

(declare-fun lt!423982 () Unit!31596)

(declare-fun lt!423983 () Unit!31596)

(assert (=> d!113695 (= lt!423982 lt!423983)))

(assert (=> d!113695 (= (getValueByKey!487 lt!423981 (_1!6729 (tuple2!13437 lt!423500 lt!423505))) (Some!492 (_2!6729 (tuple2!13437 lt!423500 lt!423505))))))

(assert (=> d!113695 (= lt!423983 (lemmaContainsTupThenGetReturnValue!261 lt!423981 (_1!6729 (tuple2!13437 lt!423500 lt!423505)) (_2!6729 (tuple2!13437 lt!423500 lt!423505))))))

(assert (=> d!113695 (= lt!423981 (insertStrictlySorted!318 (toList!6077 lt!423502) (_1!6729 (tuple2!13437 lt!423500 lt!423505)) (_2!6729 (tuple2!13437 lt!423500 lt!423505))))))

(assert (=> d!113695 (= (+!2865 lt!423502 (tuple2!13437 lt!423500 lt!423505)) lt!423984)))

(declare-fun b!938763 () Bool)

(declare-fun res!631552 () Bool)

(assert (=> b!938763 (=> (not res!631552) (not e!527245))))

(assert (=> b!938763 (= res!631552 (= (getValueByKey!487 (toList!6077 lt!423984) (_1!6729 (tuple2!13437 lt!423500 lt!423505))) (Some!492 (_2!6729 (tuple2!13437 lt!423500 lt!423505)))))))

(declare-fun b!938764 () Bool)

(assert (=> b!938764 (= e!527245 (contains!5082 (toList!6077 lt!423984) (tuple2!13437 lt!423500 lt!423505)))))

(assert (= (and d!113695 res!631553) b!938763))

(assert (= (and b!938763 res!631552) b!938764))

(declare-fun m!874057 () Bool)

(assert (=> d!113695 m!874057))

(declare-fun m!874059 () Bool)

(assert (=> d!113695 m!874059))

(declare-fun m!874061 () Bool)

(assert (=> d!113695 m!874061))

(declare-fun m!874063 () Bool)

(assert (=> d!113695 m!874063))

(declare-fun m!874065 () Bool)

(assert (=> b!938763 m!874065))

(declare-fun m!874067 () Bool)

(assert (=> b!938764 m!874067))

(assert (=> d!113457 d!113695))

(declare-fun d!113697 () Bool)

(assert (=> d!113697 (= (apply!851 lt!423713 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14331 (getValueByKey!487 (toList!6077 lt!423713) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26355 () Bool)

(assert (= bs!26355 d!113697))

(assert (=> bs!26355 m!873497))

(assert (=> bs!26355 m!873497))

(declare-fun m!874069 () Bool)

(assert (=> bs!26355 m!874069))

(assert (=> b!938385 d!113697))

(assert (=> bm!40826 d!113589))

(declare-fun d!113699 () Bool)

(assert (=> d!113699 (= (get!14332 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!12709 (select (arr!27157 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938412 d!113699))

(declare-fun d!113701 () Bool)

(assert (=> d!113701 (= (apply!851 lt!423679 (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14331 (getValueByKey!487 (toList!6077 lt!423679) (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun bs!26356 () Bool)

(assert (= bs!26356 d!113701))

(assert (=> bs!26356 m!872993))

(assert (=> bs!26356 m!873829))

(assert (=> bs!26356 m!873829))

(declare-fun m!874071 () Bool)

(assert (=> bs!26356 m!874071))

(assert (=> b!938363 d!113701))

(assert (=> b!938363 d!113459))

(declare-fun d!113703 () Bool)

(assert (=> d!113703 (= (get!14331 (getValueByKey!487 (toList!6077 lt!423502) k0!1099)) (v!12712 (getValueByKey!487 (toList!6077 lt!423502) k0!1099)))))

(assert (=> d!113471 d!113703))

(declare-fun b!938767 () Bool)

(declare-fun e!527247 () Option!493)

(assert (=> b!938767 (= e!527247 (getValueByKey!487 (t!27469 (toList!6077 lt!423502)) k0!1099))))

(declare-fun b!938766 () Bool)

(declare-fun e!527246 () Option!493)

(assert (=> b!938766 (= e!527246 e!527247)))

(declare-fun c!97869 () Bool)

(assert (=> b!938766 (= c!97869 (and ((_ is Cons!19175) (toList!6077 lt!423502)) (not (= (_1!6729 (h!20321 (toList!6077 lt!423502))) k0!1099))))))

(declare-fun d!113705 () Bool)

(declare-fun c!97868 () Bool)

(assert (=> d!113705 (= c!97868 (and ((_ is Cons!19175) (toList!6077 lt!423502)) (= (_1!6729 (h!20321 (toList!6077 lt!423502))) k0!1099)))))

(assert (=> d!113705 (= (getValueByKey!487 (toList!6077 lt!423502) k0!1099) e!527246)))

(declare-fun b!938765 () Bool)

(assert (=> b!938765 (= e!527246 (Some!492 (_2!6729 (h!20321 (toList!6077 lt!423502)))))))

(declare-fun b!938768 () Bool)

(assert (=> b!938768 (= e!527247 None!491)))

(assert (= (and d!113705 c!97868) b!938765))

(assert (= (and d!113705 (not c!97868)) b!938766))

(assert (= (and b!938766 c!97869) b!938767))

(assert (= (and b!938766 (not c!97869)) b!938768))

(declare-fun m!874073 () Bool)

(assert (=> b!938767 m!874073))

(assert (=> d!113471 d!113705))

(declare-fun d!113707 () Bool)

(declare-fun e!527248 () Bool)

(assert (=> d!113707 e!527248))

(declare-fun res!631554 () Bool)

(assert (=> d!113707 (=> res!631554 e!527248)))

(declare-fun lt!423985 () Bool)

(assert (=> d!113707 (= res!631554 (not lt!423985))))

(declare-fun lt!423986 () Bool)

(assert (=> d!113707 (= lt!423985 lt!423986)))

(declare-fun lt!423987 () Unit!31596)

(declare-fun e!527249 () Unit!31596)

(assert (=> d!113707 (= lt!423987 e!527249)))

(declare-fun c!97870 () Bool)

(assert (=> d!113707 (= c!97870 lt!423986)))

(assert (=> d!113707 (= lt!423986 (containsKey!451 (toList!6077 (+!2865 lt!423502 (tuple2!13437 lt!423500 lt!423505))) k0!1099))))

(assert (=> d!113707 (= (contains!5081 (+!2865 lt!423502 (tuple2!13437 lt!423500 lt!423505)) k0!1099) lt!423985)))

(declare-fun b!938769 () Bool)

(declare-fun lt!423988 () Unit!31596)

(assert (=> b!938769 (= e!527249 lt!423988)))

(assert (=> b!938769 (= lt!423988 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6077 (+!2865 lt!423502 (tuple2!13437 lt!423500 lt!423505))) k0!1099))))

(assert (=> b!938769 (isDefined!359 (getValueByKey!487 (toList!6077 (+!2865 lt!423502 (tuple2!13437 lt!423500 lt!423505))) k0!1099))))

(declare-fun b!938770 () Bool)

(declare-fun Unit!31618 () Unit!31596)

(assert (=> b!938770 (= e!527249 Unit!31618)))

(declare-fun b!938771 () Bool)

(assert (=> b!938771 (= e!527248 (isDefined!359 (getValueByKey!487 (toList!6077 (+!2865 lt!423502 (tuple2!13437 lt!423500 lt!423505))) k0!1099)))))

(assert (= (and d!113707 c!97870) b!938769))

(assert (= (and d!113707 (not c!97870)) b!938770))

(assert (= (and d!113707 (not res!631554)) b!938771))

(declare-fun m!874075 () Bool)

(assert (=> d!113707 m!874075))

(declare-fun m!874077 () Bool)

(assert (=> b!938769 m!874077))

(assert (=> b!938769 m!874053))

(assert (=> b!938769 m!874053))

(declare-fun m!874079 () Bool)

(assert (=> b!938769 m!874079))

(assert (=> b!938771 m!874053))

(assert (=> b!938771 m!874053))

(assert (=> b!938771 m!874079))

(assert (=> d!113447 d!113707))

(assert (=> d!113447 d!113695))

(declare-fun d!113709 () Bool)

(assert (=> d!113709 (contains!5081 (+!2865 lt!423502 (tuple2!13437 lt!423500 lt!423505)) k0!1099)))

(assert (=> d!113709 true))

(declare-fun _$35!435 () Unit!31596)

(assert (=> d!113709 (= (choose!1569 lt!423502 lt!423500 lt!423505 k0!1099) _$35!435)))

(declare-fun bs!26357 () Bool)

(assert (= bs!26357 d!113709))

(assert (=> bs!26357 m!873165))

(assert (=> bs!26357 m!873165))

(assert (=> bs!26357 m!873167))

(assert (=> d!113447 d!113709))

(assert (=> d!113447 d!113467))

(assert (=> b!938361 d!113505))

(declare-fun b!938773 () Bool)

(declare-fun e!527250 () Bool)

(declare-fun e!527251 () Bool)

(assert (=> b!938773 (= e!527250 e!527251)))

(declare-fun lt!423990 () (_ BitVec 64))

(assert (=> b!938773 (= lt!423990 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!423991 () Unit!31596)

(assert (=> b!938773 (= lt!423991 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!423990 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!938773 (arrayContainsKey!0 _keys!1487 lt!423990 #b00000000000000000000000000000000)))

(declare-fun lt!423989 () Unit!31596)

(assert (=> b!938773 (= lt!423989 lt!423991)))

(declare-fun res!631555 () Bool)

(assert (=> b!938773 (= res!631555 (= (seekEntryOrOpen!0 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1487 mask!1881) (Found!8982 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!938773 (=> (not res!631555) (not e!527251))))

(declare-fun b!938774 () Bool)

(declare-fun call!40870 () Bool)

(assert (=> b!938774 (= e!527251 call!40870)))

(declare-fun d!113711 () Bool)

(declare-fun res!631556 () Bool)

(declare-fun e!527252 () Bool)

(assert (=> d!113711 (=> res!631556 e!527252)))

(assert (=> d!113711 (= res!631556 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27619 _keys!1487)))))

(assert (=> d!113711 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881) e!527252)))

(declare-fun b!938775 () Bool)

(assert (=> b!938775 (= e!527250 call!40870)))

(declare-fun bm!40867 () Bool)

(assert (=> bm!40867 (= call!40870 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!938776 () Bool)

(assert (=> b!938776 (= e!527252 e!527250)))

(declare-fun c!97871 () Bool)

(assert (=> b!938776 (= c!97871 (validKeyInArray!0 (select (arr!27158 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!113711 (not res!631556)) b!938776))

(assert (= (and b!938776 c!97871) b!938773))

(assert (= (and b!938776 (not c!97871)) b!938775))

(assert (= (and b!938773 res!631555) b!938774))

(assert (= (or b!938774 b!938775) bm!40867))

(assert (=> b!938773 m!873641))

(declare-fun m!874081 () Bool)

(assert (=> b!938773 m!874081))

(declare-fun m!874083 () Bool)

(assert (=> b!938773 m!874083))

(assert (=> b!938773 m!873641))

(declare-fun m!874085 () Bool)

(assert (=> b!938773 m!874085))

(declare-fun m!874087 () Bool)

(assert (=> bm!40867 m!874087))

(assert (=> b!938776 m!873641))

(assert (=> b!938776 m!873641))

(assert (=> b!938776 m!873645))

(assert (=> bm!40840 d!113711))

(assert (=> b!938402 d!113473))

(declare-fun d!113713 () Bool)

(declare-fun e!527253 () Bool)

(assert (=> d!113713 e!527253))

(declare-fun res!631557 () Bool)

(assert (=> d!113713 (=> res!631557 e!527253)))

(declare-fun lt!423992 () Bool)

(assert (=> d!113713 (= res!631557 (not lt!423992))))

(declare-fun lt!423993 () Bool)

(assert (=> d!113713 (= lt!423992 lt!423993)))

(declare-fun lt!423994 () Unit!31596)

(declare-fun e!527254 () Unit!31596)

(assert (=> d!113713 (= lt!423994 e!527254)))

(declare-fun c!97872 () Bool)

(assert (=> d!113713 (= c!97872 lt!423993)))

(assert (=> d!113713 (= lt!423993 (containsKey!451 (toList!6077 lt!423679) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113713 (= (contains!5081 lt!423679 #b1000000000000000000000000000000000000000000000000000000000000000) lt!423992)))

(declare-fun b!938777 () Bool)

(declare-fun lt!423995 () Unit!31596)

(assert (=> b!938777 (= e!527254 lt!423995)))

(assert (=> b!938777 (= lt!423995 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6077 lt!423679) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938777 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423679) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938778 () Bool)

(declare-fun Unit!31619 () Unit!31596)

(assert (=> b!938778 (= e!527254 Unit!31619)))

(declare-fun b!938779 () Bool)

(assert (=> b!938779 (= e!527253 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423679) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113713 c!97872) b!938777))

(assert (= (and d!113713 (not c!97872)) b!938778))

(assert (= (and d!113713 (not res!631557)) b!938779))

(declare-fun m!874089 () Bool)

(assert (=> d!113713 m!874089))

(declare-fun m!874091 () Bool)

(assert (=> b!938777 m!874091))

(assert (=> b!938777 m!873833))

(assert (=> b!938777 m!873833))

(declare-fun m!874093 () Bool)

(assert (=> b!938777 m!874093))

(assert (=> b!938779 m!873833))

(assert (=> b!938779 m!873833))

(assert (=> b!938779 m!874093))

(assert (=> bm!40816 d!113713))

(assert (=> d!113453 d!113479))

(declare-fun d!113715 () Bool)

(declare-fun e!527255 () Bool)

(assert (=> d!113715 e!527255))

(declare-fun res!631559 () Bool)

(assert (=> d!113715 (=> (not res!631559) (not e!527255))))

(declare-fun lt!423999 () ListLongMap!12123)

(assert (=> d!113715 (= res!631559 (contains!5081 lt!423999 (_1!6729 (ite (or c!97769 c!97768) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun lt!423996 () List!19179)

(assert (=> d!113715 (= lt!423999 (ListLongMap!12124 lt!423996))))

(declare-fun lt!423997 () Unit!31596)

(declare-fun lt!423998 () Unit!31596)

(assert (=> d!113715 (= lt!423997 lt!423998)))

(assert (=> d!113715 (= (getValueByKey!487 lt!423996 (_1!6729 (ite (or c!97769 c!97768) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!492 (_2!6729 (ite (or c!97769 c!97768) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113715 (= lt!423998 (lemmaContainsTupThenGetReturnValue!261 lt!423996 (_1!6729 (ite (or c!97769 c!97768) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6729 (ite (or c!97769 c!97768) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113715 (= lt!423996 (insertStrictlySorted!318 (toList!6077 (ite c!97769 call!40830 (ite c!97768 call!40829 call!40831))) (_1!6729 (ite (or c!97769 c!97768) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6729 (ite (or c!97769 c!97768) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113715 (= (+!2865 (ite c!97769 call!40830 (ite c!97768 call!40829 call!40831)) (ite (or c!97769 c!97768) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) lt!423999)))

(declare-fun b!938780 () Bool)

(declare-fun res!631558 () Bool)

(assert (=> b!938780 (=> (not res!631558) (not e!527255))))

(assert (=> b!938780 (= res!631558 (= (getValueByKey!487 (toList!6077 lt!423999) (_1!6729 (ite (or c!97769 c!97768) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!492 (_2!6729 (ite (or c!97769 c!97768) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))))

(declare-fun b!938781 () Bool)

(assert (=> b!938781 (= e!527255 (contains!5082 (toList!6077 lt!423999) (ite (or c!97769 c!97768) (tuple2!13437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (= (and d!113715 res!631559) b!938780))

(assert (= (and b!938780 res!631558) b!938781))

(declare-fun m!874095 () Bool)

(assert (=> d!113715 m!874095))

(declare-fun m!874097 () Bool)

(assert (=> d!113715 m!874097))

(declare-fun m!874099 () Bool)

(assert (=> d!113715 m!874099))

(declare-fun m!874101 () Bool)

(assert (=> d!113715 m!874101))

(declare-fun m!874103 () Bool)

(assert (=> b!938780 m!874103))

(declare-fun m!874105 () Bool)

(assert (=> b!938781 m!874105))

(assert (=> bm!40824 d!113715))

(assert (=> b!938420 d!113597))

(declare-fun d!113717 () Bool)

(declare-fun e!527256 () Bool)

(assert (=> d!113717 e!527256))

(declare-fun res!631561 () Bool)

(assert (=> d!113717 (=> (not res!631561) (not e!527256))))

(declare-fun lt!424003 () ListLongMap!12123)

(assert (=> d!113717 (= res!631561 (contains!5081 lt!424003 (_1!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun lt!424000 () List!19179)

(assert (=> d!113717 (= lt!424003 (ListLongMap!12124 lt!424000))))

(declare-fun lt!424001 () Unit!31596)

(declare-fun lt!424002 () Unit!31596)

(assert (=> d!113717 (= lt!424001 lt!424002)))

(assert (=> d!113717 (= (getValueByKey!487 lt!424000 (_1!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!492 (_2!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113717 (= lt!424002 (lemmaContainsTupThenGetReturnValue!261 lt!424000 (_1!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113717 (= lt!424000 (insertStrictlySorted!318 (toList!6077 call!40825) (_1!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113717 (= (+!2865 call!40825 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) lt!424003)))

(declare-fun b!938782 () Bool)

(declare-fun res!631560 () Bool)

(assert (=> b!938782 (=> (not res!631560) (not e!527256))))

(assert (=> b!938782 (= res!631560 (= (getValueByKey!487 (toList!6077 lt!424003) (_1!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!492 (_2!6729 (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun b!938783 () Bool)

(assert (=> b!938783 (= e!527256 (contains!5082 (toList!6077 lt!424003) (tuple2!13437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(assert (= (and d!113717 res!631561) b!938782))

(assert (= (and b!938782 res!631560) b!938783))

(declare-fun m!874107 () Bool)

(assert (=> d!113717 m!874107))

(declare-fun m!874109 () Bool)

(assert (=> d!113717 m!874109))

(declare-fun m!874111 () Bool)

(assert (=> d!113717 m!874111))

(declare-fun m!874113 () Bool)

(assert (=> d!113717 m!874113))

(declare-fun m!874115 () Bool)

(assert (=> b!938782 m!874115))

(declare-fun m!874117 () Bool)

(assert (=> b!938783 m!874117))

(assert (=> b!938360 d!113717))

(declare-fun b!938786 () Bool)

(declare-fun e!527258 () Option!493)

(assert (=> b!938786 (= e!527258 (getValueByKey!487 (t!27469 (toList!6077 lt!423611)) (_1!6729 lt!423508)))))

(declare-fun b!938785 () Bool)

(declare-fun e!527257 () Option!493)

(assert (=> b!938785 (= e!527257 e!527258)))

(declare-fun c!97874 () Bool)

(assert (=> b!938785 (= c!97874 (and ((_ is Cons!19175) (toList!6077 lt!423611)) (not (= (_1!6729 (h!20321 (toList!6077 lt!423611))) (_1!6729 lt!423508)))))))

(declare-fun d!113719 () Bool)

(declare-fun c!97873 () Bool)

(assert (=> d!113719 (= c!97873 (and ((_ is Cons!19175) (toList!6077 lt!423611)) (= (_1!6729 (h!20321 (toList!6077 lt!423611))) (_1!6729 lt!423508))))))

(assert (=> d!113719 (= (getValueByKey!487 (toList!6077 lt!423611) (_1!6729 lt!423508)) e!527257)))

(declare-fun b!938784 () Bool)

(assert (=> b!938784 (= e!527257 (Some!492 (_2!6729 (h!20321 (toList!6077 lt!423611)))))))

(declare-fun b!938787 () Bool)

(assert (=> b!938787 (= e!527258 None!491)))

(assert (= (and d!113719 c!97873) b!938784))

(assert (= (and d!113719 (not c!97873)) b!938785))

(assert (= (and b!938785 c!97874) b!938786))

(assert (= (and b!938785 (not c!97874)) b!938787))

(declare-fun m!874119 () Bool)

(assert (=> b!938786 m!874119))

(assert (=> b!938284 d!113719))

(declare-fun d!113721 () Bool)

(declare-fun e!527261 () Bool)

(assert (=> d!113721 e!527261))

(declare-fun c!97877 () Bool)

(assert (=> d!113721 (= c!97877 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!113721 true))

(declare-fun _$29!183 () Unit!31596)

(assert (=> d!113721 (= (choose!1570 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) _$29!183)))

(declare-fun b!938792 () Bool)

(assert (=> b!938792 (= e!527261 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!938793 () Bool)

(assert (=> b!938793 (= e!527261 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!113721 c!97877) b!938792))

(assert (= (and d!113721 (not c!97877)) b!938793))

(assert (=> b!938792 m!872951))

(assert (=> d!113455 d!113721))

(assert (=> d!113455 d!113479))

(declare-fun d!113723 () Bool)

(declare-fun e!527262 () Bool)

(assert (=> d!113723 e!527262))

(declare-fun res!631562 () Bool)

(assert (=> d!113723 (=> res!631562 e!527262)))

(declare-fun lt!424004 () Bool)

(assert (=> d!113723 (= res!631562 (not lt!424004))))

(declare-fun lt!424005 () Bool)

(assert (=> d!113723 (= lt!424004 lt!424005)))

(declare-fun lt!424006 () Unit!31596)

(declare-fun e!527263 () Unit!31596)

(assert (=> d!113723 (= lt!424006 e!527263)))

(declare-fun c!97878 () Bool)

(assert (=> d!113723 (= c!97878 lt!424005)))

(assert (=> d!113723 (= lt!424005 (containsKey!451 (toList!6077 lt!423679) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113723 (= (contains!5081 lt!423679 #b0000000000000000000000000000000000000000000000000000000000000000) lt!424004)))

(declare-fun b!938794 () Bool)

(declare-fun lt!424007 () Unit!31596)

(assert (=> b!938794 (= e!527263 lt!424007)))

(assert (=> b!938794 (= lt!424007 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6077 lt!423679) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938794 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423679) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938795 () Bool)

(declare-fun Unit!31620 () Unit!31596)

(assert (=> b!938795 (= e!527263 Unit!31620)))

(declare-fun b!938796 () Bool)

(assert (=> b!938796 (= e!527262 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423679) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113723 c!97878) b!938794))

(assert (= (and d!113723 (not c!97878)) b!938795))

(assert (= (and d!113723 (not res!631562)) b!938796))

(declare-fun m!874121 () Bool)

(assert (=> d!113723 m!874121))

(declare-fun m!874123 () Bool)

(assert (=> b!938794 m!874123))

(assert (=> b!938794 m!873457))

(assert (=> b!938794 m!873457))

(declare-fun m!874125 () Bool)

(assert (=> b!938794 m!874125))

(assert (=> b!938796 m!873457))

(assert (=> b!938796 m!873457))

(assert (=> b!938796 m!874125))

(assert (=> bm!40821 d!113723))

(declare-fun d!113725 () Bool)

(assert (=> d!113725 (not (= (select (arr!27158 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) k0!1099))))

(assert (=> d!113725 true))

(declare-fun _$67!52 () Unit!31596)

(assert (=> d!113725 (= (choose!21 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19177) _$67!52)))

(declare-fun bs!26358 () Bool)

(assert (= bs!26358 d!113725))

(assert (=> bs!26358 m!872993))

(assert (=> d!113443 d!113725))

(declare-fun d!113727 () Bool)

(assert (=> d!113727 (= (get!14331 (getValueByKey!487 (toList!6077 lt!423503) k0!1099)) (v!12712 (getValueByKey!487 (toList!6077 lt!423503) k0!1099)))))

(assert (=> d!113477 d!113727))

(declare-fun b!938799 () Bool)

(declare-fun e!527265 () Option!493)

(assert (=> b!938799 (= e!527265 (getValueByKey!487 (t!27469 (toList!6077 lt!423503)) k0!1099))))

(declare-fun b!938798 () Bool)

(declare-fun e!527264 () Option!493)

(assert (=> b!938798 (= e!527264 e!527265)))

(declare-fun c!97880 () Bool)

(assert (=> b!938798 (= c!97880 (and ((_ is Cons!19175) (toList!6077 lt!423503)) (not (= (_1!6729 (h!20321 (toList!6077 lt!423503))) k0!1099))))))

(declare-fun d!113729 () Bool)

(declare-fun c!97879 () Bool)

(assert (=> d!113729 (= c!97879 (and ((_ is Cons!19175) (toList!6077 lt!423503)) (= (_1!6729 (h!20321 (toList!6077 lt!423503))) k0!1099)))))

(assert (=> d!113729 (= (getValueByKey!487 (toList!6077 lt!423503) k0!1099) e!527264)))

(declare-fun b!938797 () Bool)

(assert (=> b!938797 (= e!527264 (Some!492 (_2!6729 (h!20321 (toList!6077 lt!423503)))))))

(declare-fun b!938800 () Bool)

(assert (=> b!938800 (= e!527265 None!491)))

(assert (= (and d!113729 c!97879) b!938797))

(assert (= (and d!113729 (not c!97879)) b!938798))

(assert (= (and b!938798 c!97880) b!938799))

(assert (= (and b!938798 (not c!97880)) b!938800))

(declare-fun m!874127 () Bool)

(assert (=> b!938799 m!874127))

(assert (=> d!113477 d!113729))

(declare-fun d!113731 () Bool)

(assert (=> d!113731 (= (isDefined!359 (getValueByKey!487 (toList!6077 lt!423503) k0!1099)) (not (isEmpty!704 (getValueByKey!487 (toList!6077 lt!423503) k0!1099))))))

(declare-fun bs!26359 () Bool)

(assert (= bs!26359 d!113731))

(assert (=> bs!26359 m!873297))

(declare-fun m!874129 () Bool)

(assert (=> bs!26359 m!874129))

(assert (=> b!938416 d!113731))

(assert (=> b!938416 d!113729))

(declare-fun b!938803 () Bool)

(declare-fun e!527267 () Option!493)

(assert (=> b!938803 (= e!527267 (getValueByKey!487 (t!27469 (toList!6077 lt!423607)) (_1!6729 lt!423508)))))

(declare-fun b!938802 () Bool)

(declare-fun e!527266 () Option!493)

(assert (=> b!938802 (= e!527266 e!527267)))

(declare-fun c!97882 () Bool)

(assert (=> b!938802 (= c!97882 (and ((_ is Cons!19175) (toList!6077 lt!423607)) (not (= (_1!6729 (h!20321 (toList!6077 lt!423607))) (_1!6729 lt!423508)))))))

(declare-fun d!113733 () Bool)

(declare-fun c!97881 () Bool)

(assert (=> d!113733 (= c!97881 (and ((_ is Cons!19175) (toList!6077 lt!423607)) (= (_1!6729 (h!20321 (toList!6077 lt!423607))) (_1!6729 lt!423508))))))

(assert (=> d!113733 (= (getValueByKey!487 (toList!6077 lt!423607) (_1!6729 lt!423508)) e!527266)))

(declare-fun b!938801 () Bool)

(assert (=> b!938801 (= e!527266 (Some!492 (_2!6729 (h!20321 (toList!6077 lt!423607)))))))

(declare-fun b!938804 () Bool)

(assert (=> b!938804 (= e!527267 None!491)))

(assert (= (and d!113733 c!97881) b!938801))

(assert (= (and d!113733 (not c!97881)) b!938802))

(assert (= (and b!938802 c!97882) b!938803))

(assert (= (and b!938802 (not c!97882)) b!938804))

(declare-fun m!874131 () Bool)

(assert (=> b!938803 m!874131))

(assert (=> b!938282 d!113733))

(assert (=> b!938377 d!113621))

(declare-fun d!113735 () Bool)

(assert (=> d!113735 (= (isDefined!359 (getValueByKey!487 (toList!6077 lt!423502) k0!1099)) (not (isEmpty!704 (getValueByKey!487 (toList!6077 lt!423502) k0!1099))))))

(declare-fun bs!26360 () Bool)

(assert (= bs!26360 d!113735))

(assert (=> bs!26360 m!873305))

(declare-fun m!874133 () Bool)

(assert (=> bs!26360 m!874133))

(assert (=> b!938419 d!113735))

(assert (=> b!938419 d!113705))

(declare-fun d!113737 () Bool)

(assert (=> d!113737 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423502) k0!1099))))

(declare-fun lt!424008 () Unit!31596)

(assert (=> d!113737 (= lt!424008 (choose!1573 (toList!6077 lt!423502) k0!1099))))

(declare-fun e!527268 () Bool)

(assert (=> d!113737 e!527268))

(declare-fun res!631563 () Bool)

(assert (=> d!113737 (=> (not res!631563) (not e!527268))))

(assert (=> d!113737 (= res!631563 (isStrictlySorted!500 (toList!6077 lt!423502)))))

(assert (=> d!113737 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6077 lt!423502) k0!1099) lt!424008)))

(declare-fun b!938805 () Bool)

(assert (=> b!938805 (= e!527268 (containsKey!451 (toList!6077 lt!423502) k0!1099))))

(assert (= (and d!113737 res!631563) b!938805))

(assert (=> d!113737 m!873305))

(assert (=> d!113737 m!873305))

(assert (=> d!113737 m!873307))

(declare-fun m!874135 () Bool)

(assert (=> d!113737 m!874135))

(assert (=> d!113737 m!873523))

(assert (=> b!938805 m!873301))

(assert (=> b!938417 d!113737))

(assert (=> b!938417 d!113735))

(assert (=> b!938417 d!113705))

(declare-fun d!113739 () Bool)

(declare-fun e!527269 () Bool)

(assert (=> d!113739 e!527269))

(declare-fun res!631564 () Bool)

(assert (=> d!113739 (=> res!631564 e!527269)))

(declare-fun lt!424009 () Bool)

(assert (=> d!113739 (= res!631564 (not lt!424009))))

(declare-fun lt!424010 () Bool)

(assert (=> d!113739 (= lt!424009 lt!424010)))

(declare-fun lt!424011 () Unit!31596)

(declare-fun e!527270 () Unit!31596)

(assert (=> d!113739 (= lt!424011 e!527270)))

(declare-fun c!97883 () Bool)

(assert (=> d!113739 (= c!97883 lt!424010)))

(assert (=> d!113739 (= lt!424010 (containsKey!451 (toList!6077 lt!423752) (select (arr!27158 _keys!1487) from!1844)))))

(assert (=> d!113739 (= (contains!5081 lt!423752 (select (arr!27158 _keys!1487) from!1844)) lt!424009)))

(declare-fun b!938806 () Bool)

(declare-fun lt!424012 () Unit!31596)

(assert (=> b!938806 (= e!527270 lt!424012)))

(assert (=> b!938806 (= lt!424012 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6077 lt!423752) (select (arr!27158 _keys!1487) from!1844)))))

(assert (=> b!938806 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423752) (select (arr!27158 _keys!1487) from!1844)))))

(declare-fun b!938807 () Bool)

(declare-fun Unit!31621 () Unit!31596)

(assert (=> b!938807 (= e!527270 Unit!31621)))

(declare-fun b!938808 () Bool)

(assert (=> b!938808 (= e!527269 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423752) (select (arr!27158 _keys!1487) from!1844))))))

(assert (= (and d!113739 c!97883) b!938806))

(assert (= (and d!113739 (not c!97883)) b!938807))

(assert (= (and d!113739 (not res!631564)) b!938808))

(assert (=> d!113739 m!873311))

(declare-fun m!874137 () Bool)

(assert (=> d!113739 m!874137))

(assert (=> b!938806 m!873311))

(declare-fun m!874139 () Bool)

(assert (=> b!938806 m!874139))

(assert (=> b!938806 m!873311))

(assert (=> b!938806 m!873649))

(assert (=> b!938806 m!873649))

(declare-fun m!874141 () Bool)

(assert (=> b!938806 m!874141))

(assert (=> b!938808 m!873311))

(assert (=> b!938808 m!873649))

(assert (=> b!938808 m!873649))

(assert (=> b!938808 m!874141))

(assert (=> b!938431 d!113739))

(declare-fun d!113741 () Bool)

(assert (=> d!113741 (isDefined!359 (getValueByKey!487 (toList!6077 lt!423503) k0!1099))))

(declare-fun lt!424013 () Unit!31596)

(assert (=> d!113741 (= lt!424013 (choose!1573 (toList!6077 lt!423503) k0!1099))))

(declare-fun e!527271 () Bool)

(assert (=> d!113741 e!527271))

(declare-fun res!631565 () Bool)

(assert (=> d!113741 (=> (not res!631565) (not e!527271))))

(assert (=> d!113741 (= res!631565 (isStrictlySorted!500 (toList!6077 lt!423503)))))

(assert (=> d!113741 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6077 lt!423503) k0!1099) lt!424013)))

(declare-fun b!938809 () Bool)

(assert (=> b!938809 (= e!527271 (containsKey!451 (toList!6077 lt!423503) k0!1099))))

(assert (= (and d!113741 res!631565) b!938809))

(assert (=> d!113741 m!873297))

(assert (=> d!113741 m!873297))

(assert (=> d!113741 m!873299))

(declare-fun m!874143 () Bool)

(assert (=> d!113741 m!874143))

(declare-fun m!874145 () Bool)

(assert (=> d!113741 m!874145))

(assert (=> b!938809 m!873293))

(assert (=> b!938414 d!113741))

(assert (=> b!938414 d!113731))

(assert (=> b!938414 d!113729))

(declare-fun b!938811 () Bool)

(declare-fun e!527273 () Bool)

(assert (=> b!938811 (= e!527273 tp_is_empty!20263)))

(declare-fun b!938810 () Bool)

(declare-fun e!527272 () Bool)

(assert (=> b!938810 (= e!527272 tp_is_empty!20263)))

(declare-fun mapIsEmpty!32180 () Bool)

(declare-fun mapRes!32180 () Bool)

(assert (=> mapIsEmpty!32180 mapRes!32180))

(declare-fun condMapEmpty!32180 () Bool)

(declare-fun mapDefault!32180 () ValueCell!9650)

(assert (=> mapNonEmpty!32179 (= condMapEmpty!32180 (= mapRest!32179 ((as const (Array (_ BitVec 32) ValueCell!9650)) mapDefault!32180)))))

(assert (=> mapNonEmpty!32179 (= tp!61741 (and e!527273 mapRes!32180))))

(declare-fun mapNonEmpty!32180 () Bool)

(declare-fun tp!61742 () Bool)

(assert (=> mapNonEmpty!32180 (= mapRes!32180 (and tp!61742 e!527272))))

(declare-fun mapValue!32180 () ValueCell!9650)

(declare-fun mapRest!32180 () (Array (_ BitVec 32) ValueCell!9650))

(declare-fun mapKey!32180 () (_ BitVec 32))

(assert (=> mapNonEmpty!32180 (= mapRest!32179 (store mapRest!32180 mapKey!32180 mapValue!32180))))

(assert (= (and mapNonEmpty!32179 condMapEmpty!32180) mapIsEmpty!32180))

(assert (= (and mapNonEmpty!32179 (not condMapEmpty!32180)) mapNonEmpty!32180))

(assert (= (and mapNonEmpty!32180 ((_ is ValueCellFull!9650) mapValue!32180)) b!938810))

(assert (= (and mapNonEmpty!32179 ((_ is ValueCellFull!9650) mapDefault!32180)) b!938811))

(declare-fun m!874147 () Bool)

(assert (=> mapNonEmpty!32180 m!874147))

(declare-fun b_lambda!14233 () Bool)

(assert (= b_lambda!14225 (or (and start!79764 b_free!17755) b_lambda!14233)))

(declare-fun b_lambda!14235 () Bool)

(assert (= b_lambda!14219 (or (and start!79764 b_free!17755) b_lambda!14235)))

(declare-fun b_lambda!14237 () Bool)

(assert (= b_lambda!14227 (or (and start!79764 b_free!17755) b_lambda!14237)))

(declare-fun b_lambda!14239 () Bool)

(assert (= b_lambda!14229 (or (and start!79764 b_free!17755) b_lambda!14239)))

(declare-fun b_lambda!14241 () Bool)

(assert (= b_lambda!14221 (or (and start!79764 b_free!17755) b_lambda!14241)))

(declare-fun b_lambda!14243 () Bool)

(assert (= b_lambda!14223 (or (and start!79764 b_free!17755) b_lambda!14243)))

(declare-fun b_lambda!14245 () Bool)

(assert (= b_lambda!14231 (or (and start!79764 b_free!17755) b_lambda!14245)))

(declare-fun b_lambda!14247 () Bool)

(assert (= b_lambda!14217 (or (and start!79764 b_free!17755) b_lambda!14247)))

(check-sat (not d!113685) (not b!938531) (not b!938648) (not b!938543) (not d!113715) (not bm!40860) (not b!938641) (not bm!40857) (not d!113493) (not b!938740) (not b!938732) (not d!113579) (not d!113641) (not b!938631) (not b!938629) (not b!938656) (not b!938520) (not d!113567) (not d!113611) (not d!113571) (not d!113615) (not b!938548) (not b!938590) (not d!113563) (not b!938686) (not b!938646) (not b!938794) (not b!938712) (not d!113573) (not b_lambda!14213) (not b!938786) (not b_lambda!14243) (not b!938688) (not b!938594) (not b_lambda!14239) (not b!938547) (not b!938484) (not b!938694) (not b!938755) (not b!938728) (not d!113655) (not d!113673) (not b!938519) (not d!113663) (not b_lambda!14211) (not b!938782) (not d!113521) (not d!113585) (not b!938744) (not b!938628) (not b!938703) (not d!113513) (not d!113533) (not b!938630) (not d!113637) (not b!938488) (not d!113647) (not b!938749) (not b!938745) (not d!113539) (not d!113627) (not b!938733) (not d!113683) (not d!113677) (not d!113537) (not b!938614) (not d!113491) (not bm!40850) (not d!113653) (not b!938581) (not b!938758) (not d!113545) (not b!938723) (not d!113691) (not b!938635) (not b!938724) (not d!113583) (not b!938743) (not b!938659) (not b!938687) (not d!113629) (not d!113701) (not d!113605) (not b!938612) (not b!938685) (not d!113735) (not d!113675) (not b!938494) (not d!113731) (not d!113651) (not b!938748) (not b!938709) (not b!938769) (not b!938736) (not d!113643) (not b!938605) (not d!113665) (not d!113697) (not b!938780) (not b!938482) (not b!938696) (not b!938627) (not d!113543) (not d!113495) (not b!938601) (not bm!40861) (not b!938754) (not b!938592) (not b!938525) (not b!938729) (not b!938550) (not d!113489) (not b!938760) (not bm!40865) (not d!113739) (not d!113589) (not d!113535) (not b!938487) (not bm!40841) (not d!113687) (not b!938485) (not d!113575) (not d!113645) (not d!113623) (not d!113511) (not b!938603) (not b!938806) (not d!113593) (not b!938650) (not b!938521) (not b!938738) (not b!938553) (not bm!40867) (not b!938621) (not d!113639) (not d!113547) (not bm!40846) (not b!938809) (not d!113659) (not b!938783) (not b!938599) (not b!938591) (not b!938777) (not b!938596) (not d!113601) (not b_lambda!14247) (not b!938490) (not b!938617) (not b!938620) (not b!938640) (not d!113569) (not b!938721) (not b_lambda!14199) (not bm!40842) (not b!938559) (not b!938658) (not b!938474) (not b!938764) (not b!938636) (not b!938763) tp_is_empty!20263 (not b!938776) (not b!938560) (not b!938701) (not b_lambda!14215) (not b!938618) (not b!938619) (not b!938796) (not b!938771) (not b_lambda!14241) (not d!113625) (not b!938649) (not b!938683) (not d!113609) (not b!938739) (not b!938767) (not b!938808) (not b!938622) (not bm!40866) (not b!938757) (not d!113591) (not b!938691) (not d!113635) (not d!113531) (not b_lambda!14233) (not b!938662) (not b!938626) (not b!938597) (not b!938753) (not d!113679) (not b!938799) (not d!113519) (not d!113527) (not b!938664) (not b!938702) (not bm!40862) (not d!113541) (not b!938530) (not b!938529) (not d!113693) (not d!113669) (not b!938624) (not d!113557) (not d!113565) (not d!113741) (not d!113681) b_and!29133 (not mapNonEmpty!32180) (not d!113587) (not d!113581) (not d!113503) (not d!113523) (not d!113595) (not d!113667) (not d!113619) (not b_lambda!14235) (not b!938634) (not d!113713) (not d!113661) (not d!113671) (not b!938587) (not b!938781) (not b!938532) (not b_lambda!14245) (not b!938693) (not b!938751) (not d!113517) (not d!113613) (not d!113717) (not b!938761) (not b!938528) (not d!113577) (not b!938679) (not b!938747) (not b!938473) (not b!938600) (not b!938803) (not d!113561) (not b!938593) (not b!938731) (not d!113723) (not b!938718) (not b!938472) (not b!938690) (not d!113525) (not b!938644) (not d!113529) (not b!938722) (not d!113709) (not bm!40844) (not b!938545) (not b_lambda!14209) (not d!113631) (not b!938699) (not b_lambda!14237) (not b!938643) (not d!113695) (not d!113507) (not b!938779) (not b!938660) (not d!113689) (not b_next!17755) (not b!938604) (not b!938526) (not b!938792) (not d!113603) (not d!113707) (not b!938645) (not b!938805) (not b!938773) (not b!938735) (not d!113737) (not d!113497))
(check-sat b_and!29133 (not b_next!17755))
