; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79866 () Bool)

(assert start!79866)

(declare-fun b_free!17763 () Bool)

(declare-fun b_next!17763 () Bool)

(assert (=> start!79866 (= b_free!17763 (not b_next!17763))))

(declare-fun tp!61753 () Bool)

(declare-fun b_and!29165 () Bool)

(assert (=> start!79866 (= tp!61753 b_and!29165)))

(declare-fun b!939148 () Bool)

(declare-datatypes ((V!31993 0))(
  ( (V!31994 (val!10186 Int)) )
))
(declare-datatypes ((tuple2!13388 0))(
  ( (tuple2!13389 (_1!6705 (_ BitVec 64)) (_2!6705 V!31993)) )
))
(declare-datatypes ((List!19165 0))(
  ( (Nil!19162) (Cons!19161 (h!20307 tuple2!13388) (t!27472 List!19165)) )
))
(declare-datatypes ((ListLongMap!12085 0))(
  ( (ListLongMap!12086 (toList!6058 List!19165)) )
))
(declare-fun lt!424332 () ListLongMap!12085)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!424328 () V!31993)

(declare-fun apply!859 (ListLongMap!12085 (_ BitVec 64)) V!31993)

(assert (=> b!939148 (= (apply!859 lt!424332 k0!1099) lt!424328)))

(declare-fun lt!424325 () V!31993)

(declare-datatypes ((Unit!31734 0))(
  ( (Unit!31735) )
))
(declare-fun lt!424321 () Unit!31734)

(declare-fun lt!424333 () (_ BitVec 64))

(declare-fun lt!424323 () ListLongMap!12085)

(declare-fun addApplyDifferent!444 (ListLongMap!12085 (_ BitVec 64) V!31993 (_ BitVec 64)) Unit!31734)

(assert (=> b!939148 (= lt!424321 (addApplyDifferent!444 lt!424323 lt!424333 lt!424325 k0!1099))))

(assert (=> b!939148 (not (= lt!424333 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!424327 () Unit!31734)

(declare-datatypes ((array!56486 0))(
  ( (array!56487 (arr!27181 (Array (_ BitVec 32) (_ BitVec 64))) (size!27640 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56486)

(declare-datatypes ((List!19166 0))(
  ( (Nil!19163) (Cons!19162 (h!20308 (_ BitVec 64)) (t!27473 List!19166)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56486 (_ BitVec 64) (_ BitVec 32) List!19166) Unit!31734)

(assert (=> b!939148 (= lt!424327 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19163))))

(declare-fun e!527493 () Bool)

(assert (=> b!939148 e!527493))

(declare-fun c!97964 () Bool)

(assert (=> b!939148 (= c!97964 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!424324 () Unit!31734)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9654 0))(
  ( (ValueCellFull!9654 (v!12717 V!31993)) (EmptyCell!9654) )
))
(declare-datatypes ((array!56488 0))(
  ( (array!56489 (arr!27182 (Array (_ BitVec 32) ValueCell!9654)) (size!27641 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56488)

(declare-fun zeroValue!1173 () V!31993)

(declare-fun minValue!1173 () V!31993)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!317 (array!56486 array!56488 (_ BitVec 32) (_ BitVec 32) V!31993 V!31993 (_ BitVec 64) (_ BitVec 32) Int) Unit!31734)

(assert (=> b!939148 (= lt!424324 (lemmaListMapContainsThenArrayContainsFrom!317 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56486 (_ BitVec 32) List!19166) Bool)

(assert (=> b!939148 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19163)))

(declare-fun lt!424331 () Unit!31734)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56486 (_ BitVec 32) (_ BitVec 32)) Unit!31734)

(assert (=> b!939148 (= lt!424331 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5120 (ListLongMap!12085 (_ BitVec 64)) Bool)

(assert (=> b!939148 (contains!5120 lt!424332 k0!1099)))

(declare-fun lt!424330 () tuple2!13388)

(declare-fun +!2845 (ListLongMap!12085 tuple2!13388) ListLongMap!12085)

(assert (=> b!939148 (= lt!424332 (+!2845 lt!424323 lt!424330))))

(declare-fun lt!424329 () Unit!31734)

(declare-fun addStillContains!564 (ListLongMap!12085 (_ BitVec 64) V!31993 (_ BitVec 64)) Unit!31734)

(assert (=> b!939148 (= lt!424329 (addStillContains!564 lt!424323 lt!424333 lt!424325 k0!1099))))

(declare-fun getCurrentListMap!3292 (array!56486 array!56488 (_ BitVec 32) (_ BitVec 32) V!31993 V!31993 (_ BitVec 32) Int) ListLongMap!12085)

(assert (=> b!939148 (= (getCurrentListMap!3292 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2845 (getCurrentListMap!3292 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!424330))))

(assert (=> b!939148 (= lt!424330 (tuple2!13389 lt!424333 lt!424325))))

(declare-fun get!14343 (ValueCell!9654 V!31993) V!31993)

(declare-fun dynLambda!1634 (Int (_ BitVec 64)) V!31993)

(assert (=> b!939148 (= lt!424325 (get!14343 (select (arr!27182 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1634 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!424326 () Unit!31734)

(declare-fun lemmaListMapRecursiveValidKeyArray!235 (array!56486 array!56488 (_ BitVec 32) (_ BitVec 32) V!31993 V!31993 (_ BitVec 32) Int) Unit!31734)

(assert (=> b!939148 (= lt!424326 (lemmaListMapRecursiveValidKeyArray!235 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!527483 () Unit!31734)

(assert (=> b!939148 (= e!527483 lt!424321)))

(declare-fun b!939149 () Bool)

(declare-fun e!527486 () Unit!31734)

(declare-fun Unit!31736 () Unit!31734)

(assert (=> b!939149 (= e!527486 Unit!31736)))

(declare-fun b!939150 () Bool)

(declare-fun res!631728 () Bool)

(declare-fun e!527488 () Bool)

(assert (=> b!939150 (=> (not res!631728) (not e!527488))))

(declare-fun v!791 () V!31993)

(declare-fun lt!424320 () ListLongMap!12085)

(assert (=> b!939150 (= res!631728 (= (apply!859 lt!424320 k0!1099) v!791))))

(declare-fun b!939151 () Bool)

(declare-fun e!527490 () Bool)

(declare-fun tp_is_empty!20271 () Bool)

(assert (=> b!939151 (= e!527490 tp_is_empty!20271)))

(declare-fun b!939152 () Bool)

(assert (=> b!939152 (= e!527493 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!32186 () Bool)

(declare-fun mapRes!32186 () Bool)

(assert (=> mapIsEmpty!32186 mapRes!32186))

(declare-fun b!939153 () Bool)

(declare-fun Unit!31737 () Unit!31734)

(assert (=> b!939153 (= e!527483 Unit!31737)))

(declare-fun b!939154 () Bool)

(declare-fun arrayContainsKey!0 (array!56486 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!939154 (= e!527493 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!939155 () Bool)

(declare-fun e!527485 () Bool)

(assert (=> b!939155 (= e!527485 e!527488)))

(declare-fun res!631734 () Bool)

(assert (=> b!939155 (=> (not res!631734) (not e!527488))))

(assert (=> b!939155 (= res!631734 (contains!5120 lt!424320 k0!1099))))

(assert (=> b!939155 (= lt!424320 (getCurrentListMap!3292 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!939156 () Bool)

(declare-fun e!527482 () Bool)

(assert (=> b!939156 (= e!527482 e!527485)))

(declare-fun res!631727 () Bool)

(assert (=> b!939156 (=> (not res!631727) (not e!527485))))

(assert (=> b!939156 (= res!631727 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27640 _keys!1487)))))

(declare-fun lt!424322 () Unit!31734)

(assert (=> b!939156 (= lt!424322 e!527486)))

(declare-fun c!97966 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!939156 (= c!97966 (validKeyInArray!0 k0!1099))))

(declare-fun b!939157 () Bool)

(declare-fun res!631735 () Bool)

(declare-fun e!527487 () Bool)

(assert (=> b!939157 (=> (not res!631735) (not e!527487))))

(assert (=> b!939157 (= res!631735 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19163))))

(declare-fun b!939158 () Bool)

(declare-fun e!527489 () Bool)

(assert (=> b!939158 (= e!527487 e!527489)))

(declare-fun res!631729 () Bool)

(assert (=> b!939158 (=> (not res!631729) (not e!527489))))

(assert (=> b!939158 (= res!631729 (contains!5120 lt!424323 k0!1099))))

(assert (=> b!939158 (= lt!424323 (getCurrentListMap!3292 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!939160 () Bool)

(declare-fun res!631731 () Bool)

(assert (=> b!939160 (=> (not res!631731) (not e!527487))))

(assert (=> b!939160 (= res!631731 (and (= (size!27641 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27640 _keys!1487) (size!27641 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!939161 () Bool)

(assert (=> b!939161 (= e!527486 e!527483)))

(assert (=> b!939161 (= lt!424333 (select (arr!27181 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97965 () Bool)

(assert (=> b!939161 (= c!97965 (validKeyInArray!0 lt!424333))))

(declare-fun b!939162 () Bool)

(declare-fun e!527492 () Bool)

(assert (=> b!939162 (= e!527492 tp_is_empty!20271)))

(declare-fun b!939163 () Bool)

(declare-fun e!527484 () Bool)

(assert (=> b!939163 (= e!527484 (and e!527492 mapRes!32186))))

(declare-fun condMapEmpty!32186 () Bool)

(declare-fun mapDefault!32186 () ValueCell!9654)

(assert (=> b!939163 (= condMapEmpty!32186 (= (arr!27182 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9654)) mapDefault!32186)))))

(declare-fun mapNonEmpty!32186 () Bool)

(declare-fun tp!61752 () Bool)

(assert (=> mapNonEmpty!32186 (= mapRes!32186 (and tp!61752 e!527490))))

(declare-fun mapValue!32186 () ValueCell!9654)

(declare-fun mapRest!32186 () (Array (_ BitVec 32) ValueCell!9654))

(declare-fun mapKey!32186 () (_ BitVec 32))

(assert (=> mapNonEmpty!32186 (= (arr!27182 _values!1231) (store mapRest!32186 mapKey!32186 mapValue!32186))))

(declare-fun b!939164 () Bool)

(assert (=> b!939164 (= e!527489 e!527482)))

(declare-fun res!631732 () Bool)

(assert (=> b!939164 (=> (not res!631732) (not e!527482))))

(assert (=> b!939164 (= res!631732 (and (= lt!424328 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!939164 (= lt!424328 (apply!859 lt!424323 k0!1099))))

(declare-fun b!939165 () Bool)

(declare-fun res!631726 () Bool)

(assert (=> b!939165 (=> (not res!631726) (not e!527487))))

(assert (=> b!939165 (= res!631726 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27640 _keys!1487))))))

(declare-fun b!939166 () Bool)

(assert (=> b!939166 (= e!527488 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) from!1844))))

(declare-fun b!939159 () Bool)

(declare-fun res!631733 () Bool)

(assert (=> b!939159 (=> (not res!631733) (not e!527487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56486 (_ BitVec 32)) Bool)

(assert (=> b!939159 (= res!631733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!631730 () Bool)

(assert (=> start!79866 (=> (not res!631730) (not e!527487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79866 (= res!631730 (validMask!0 mask!1881))))

(assert (=> start!79866 e!527487))

(assert (=> start!79866 true))

(assert (=> start!79866 tp_is_empty!20271))

(declare-fun array_inv!21142 (array!56488) Bool)

(assert (=> start!79866 (and (array_inv!21142 _values!1231) e!527484)))

(assert (=> start!79866 tp!61753))

(declare-fun array_inv!21143 (array!56486) Bool)

(assert (=> start!79866 (array_inv!21143 _keys!1487)))

(assert (= (and start!79866 res!631730) b!939160))

(assert (= (and b!939160 res!631731) b!939159))

(assert (= (and b!939159 res!631733) b!939157))

(assert (= (and b!939157 res!631735) b!939165))

(assert (= (and b!939165 res!631726) b!939158))

(assert (= (and b!939158 res!631729) b!939164))

(assert (= (and b!939164 res!631732) b!939156))

(assert (= (and b!939156 c!97966) b!939161))

(assert (= (and b!939156 (not c!97966)) b!939149))

(assert (= (and b!939161 c!97965) b!939148))

(assert (= (and b!939161 (not c!97965)) b!939153))

(assert (= (and b!939148 c!97964) b!939154))

(assert (= (and b!939148 (not c!97964)) b!939152))

(assert (= (and b!939156 res!631727) b!939155))

(assert (= (and b!939155 res!631734) b!939150))

(assert (= (and b!939150 res!631728) b!939166))

(assert (= (and b!939163 condMapEmpty!32186) mapIsEmpty!32186))

(assert (= (and b!939163 (not condMapEmpty!32186)) mapNonEmpty!32186))

(get-info :version)

(assert (= (and mapNonEmpty!32186 ((_ is ValueCellFull!9654) mapValue!32186)) b!939151))

(assert (= (and b!939163 ((_ is ValueCellFull!9654) mapDefault!32186)) b!939162))

(assert (= start!79866 b!939163))

(declare-fun b_lambda!14269 () Bool)

(assert (=> (not b_lambda!14269) (not b!939148)))

(declare-fun t!27471 () Bool)

(declare-fun tb!6157 () Bool)

(assert (=> (and start!79866 (= defaultEntry!1235 defaultEntry!1235) t!27471) tb!6157))

(declare-fun result!12151 () Bool)

(assert (=> tb!6157 (= result!12151 tp_is_empty!20271)))

(assert (=> b!939148 t!27471))

(declare-fun b_and!29167 () Bool)

(assert (= b_and!29165 (and (=> t!27471 result!12151) b_and!29167)))

(declare-fun m!874969 () Bool)

(assert (=> b!939156 m!874969))

(declare-fun m!874971 () Bool)

(assert (=> b!939164 m!874971))

(declare-fun m!874973 () Bool)

(assert (=> b!939155 m!874973))

(declare-fun m!874975 () Bool)

(assert (=> b!939155 m!874975))

(declare-fun m!874977 () Bool)

(assert (=> b!939150 m!874977))

(declare-fun m!874979 () Bool)

(assert (=> start!79866 m!874979))

(declare-fun m!874981 () Bool)

(assert (=> start!79866 m!874981))

(declare-fun m!874983 () Bool)

(assert (=> start!79866 m!874983))

(declare-fun m!874985 () Bool)

(assert (=> b!939157 m!874985))

(declare-fun m!874987 () Bool)

(assert (=> b!939148 m!874987))

(declare-fun m!874989 () Bool)

(assert (=> b!939148 m!874989))

(declare-fun m!874991 () Bool)

(assert (=> b!939148 m!874991))

(declare-fun m!874993 () Bool)

(assert (=> b!939148 m!874993))

(declare-fun m!874995 () Bool)

(assert (=> b!939148 m!874995))

(declare-fun m!874997 () Bool)

(assert (=> b!939148 m!874997))

(assert (=> b!939148 m!874991))

(assert (=> b!939148 m!874995))

(declare-fun m!874999 () Bool)

(assert (=> b!939148 m!874999))

(assert (=> b!939148 m!874975))

(declare-fun m!875001 () Bool)

(assert (=> b!939148 m!875001))

(declare-fun m!875003 () Bool)

(assert (=> b!939148 m!875003))

(declare-fun m!875005 () Bool)

(assert (=> b!939148 m!875005))

(declare-fun m!875007 () Bool)

(assert (=> b!939148 m!875007))

(declare-fun m!875009 () Bool)

(assert (=> b!939148 m!875009))

(assert (=> b!939148 m!875005))

(declare-fun m!875011 () Bool)

(assert (=> b!939148 m!875011))

(declare-fun m!875013 () Bool)

(assert (=> b!939148 m!875013))

(declare-fun m!875015 () Bool)

(assert (=> b!939148 m!875015))

(declare-fun m!875017 () Bool)

(assert (=> mapNonEmpty!32186 m!875017))

(declare-fun m!875019 () Bool)

(assert (=> b!939154 m!875019))

(declare-fun m!875021 () Bool)

(assert (=> b!939161 m!875021))

(declare-fun m!875023 () Bool)

(assert (=> b!939161 m!875023))

(declare-fun m!875025 () Bool)

(assert (=> b!939158 m!875025))

(declare-fun m!875027 () Bool)

(assert (=> b!939158 m!875027))

(declare-fun m!875029 () Bool)

(assert (=> b!939159 m!875029))

(check-sat (not b!939150) (not b!939157) (not b!939148) (not b_lambda!14269) (not b!939158) (not b!939159) (not start!79866) (not b!939156) (not b!939155) (not mapNonEmpty!32186) (not b!939154) (not b!939164) tp_is_empty!20271 (not b!939161) b_and!29167 (not b_next!17763))
(check-sat b_and!29167 (not b_next!17763))
