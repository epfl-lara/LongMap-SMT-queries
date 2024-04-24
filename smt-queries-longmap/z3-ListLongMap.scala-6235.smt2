; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79850 () Bool)

(assert start!79850)

(declare-fun b_free!17731 () Bool)

(declare-fun b_next!17731 () Bool)

(assert (=> start!79850 (= b_free!17731 (not b_next!17731))))

(declare-fun tp!61650 () Bool)

(declare-fun b_and!29063 () Bool)

(assert (=> start!79850 (= tp!61650 b_and!29063)))

(declare-fun b!938141 () Bool)

(declare-fun e!526873 () Bool)

(declare-fun tp_is_empty!20239 () Bool)

(assert (=> b!938141 (= e!526873 tp_is_empty!20239)))

(declare-fun b!938142 () Bool)

(declare-fun res!631217 () Bool)

(declare-fun e!526872 () Bool)

(assert (=> b!938142 (=> (not res!631217) (not e!526872))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56467 0))(
  ( (array!56468 (arr!27169 (Array (_ BitVec 32) (_ BitVec 64))) (size!27629 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56467)

(assert (=> b!938142 (= res!631217 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27629 _keys!1487))))))

(declare-fun b!938143 () Bool)

(declare-fun e!526877 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!938143 (= e!526877 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!938144 () Bool)

(declare-fun e!526875 () Bool)

(assert (=> b!938144 (= e!526875 tp_is_empty!20239)))

(declare-fun b!938145 () Bool)

(declare-fun e!526878 () Bool)

(assert (=> b!938145 (= e!526878 false)))

(declare-datatypes ((Unit!31618 0))(
  ( (Unit!31619) )
))
(declare-fun lt!423212 () Unit!31618)

(declare-fun e!526874 () Unit!31618)

(assert (=> b!938145 (= lt!423212 e!526874)))

(declare-fun c!97822 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!938145 (= c!97822 (validKeyInArray!0 k0!1099))))

(declare-fun mapNonEmpty!32130 () Bool)

(declare-fun mapRes!32130 () Bool)

(declare-fun tp!61649 () Bool)

(assert (=> mapNonEmpty!32130 (= mapRes!32130 (and tp!61649 e!526875))))

(declare-datatypes ((V!31951 0))(
  ( (V!31952 (val!10170 Int)) )
))
(declare-datatypes ((ValueCell!9638 0))(
  ( (ValueCellFull!9638 (v!12692 V!31951)) (EmptyCell!9638) )
))
(declare-fun mapValue!32130 () ValueCell!9638)

(declare-fun mapRest!32130 () (Array (_ BitVec 32) ValueCell!9638))

(declare-datatypes ((array!56469 0))(
  ( (array!56470 (arr!27170 (Array (_ BitVec 32) ValueCell!9638)) (size!27630 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56469)

(declare-fun mapKey!32130 () (_ BitVec 32))

(assert (=> mapNonEmpty!32130 (= (arr!27170 _values!1231) (store mapRest!32130 mapKey!32130 mapValue!32130))))

(declare-fun b!938147 () Bool)

(declare-fun e!526876 () Unit!31618)

(declare-fun Unit!31620 () Unit!31618)

(assert (=> b!938147 (= e!526876 Unit!31620)))

(declare-fun b!938148 () Bool)

(declare-fun res!631213 () Bool)

(assert (=> b!938148 (=> (not res!631213) (not e!526872))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56467 (_ BitVec 32)) Bool)

(assert (=> b!938148 (= res!631213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!938149 () Bool)

(declare-fun Unit!31621 () Unit!31618)

(assert (=> b!938149 (= e!526874 Unit!31621)))

(declare-fun b!938150 () Bool)

(assert (=> b!938150 (= e!526874 e!526876)))

(declare-fun lt!423213 () (_ BitVec 64))

(assert (=> b!938150 (= lt!423213 (select (arr!27169 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97824 () Bool)

(assert (=> b!938150 (= c!97824 (validKeyInArray!0 lt!423213))))

(declare-fun b!938151 () Bool)

(declare-fun res!631212 () Bool)

(assert (=> b!938151 (=> (not res!631212) (not e!526872))))

(declare-datatypes ((List!19124 0))(
  ( (Nil!19121) (Cons!19120 (h!20272 (_ BitVec 64)) (t!27391 List!19124)) )
))
(declare-fun arrayNoDuplicates!0 (array!56467 (_ BitVec 32) List!19124) Bool)

(assert (=> b!938151 (= res!631212 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19121))))

(declare-fun b!938152 () Bool)

(declare-fun e!526869 () Bool)

(assert (=> b!938152 (= e!526869 (and e!526873 mapRes!32130))))

(declare-fun condMapEmpty!32130 () Bool)

(declare-fun mapDefault!32130 () ValueCell!9638)

(assert (=> b!938152 (= condMapEmpty!32130 (= (arr!27170 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9638)) mapDefault!32130)))))

(declare-fun b!938153 () Bool)

(declare-datatypes ((tuple2!13344 0))(
  ( (tuple2!13345 (_1!6683 (_ BitVec 64)) (_2!6683 V!31951)) )
))
(declare-datatypes ((List!19125 0))(
  ( (Nil!19122) (Cons!19121 (h!20273 tuple2!13344) (t!27392 List!19125)) )
))
(declare-datatypes ((ListLongMap!12043 0))(
  ( (ListLongMap!12044 (toList!6037 List!19125)) )
))
(declare-fun lt!423215 () ListLongMap!12043)

(declare-fun lt!423214 () V!31951)

(declare-fun apply!854 (ListLongMap!12043 (_ BitVec 64)) V!31951)

(assert (=> b!938153 (= (apply!854 lt!423215 k0!1099) lt!423214)))

(declare-fun lt!423209 () V!31951)

(declare-fun lt!423216 () Unit!31618)

(declare-fun lt!423217 () ListLongMap!12043)

(declare-fun addApplyDifferent!430 (ListLongMap!12043 (_ BitVec 64) V!31951 (_ BitVec 64)) Unit!31618)

(assert (=> b!938153 (= lt!423216 (addApplyDifferent!430 lt!423217 lt!423213 lt!423209 k0!1099))))

(assert (=> b!938153 (not (= lt!423213 k0!1099))))

(declare-fun lt!423208 () Unit!31618)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56467 (_ BitVec 64) (_ BitVec 32) List!19124) Unit!31618)

(assert (=> b!938153 (= lt!423208 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19121))))

(assert (=> b!938153 e!526877))

(declare-fun c!97823 () Bool)

(assert (=> b!938153 (= c!97823 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!423218 () Unit!31618)

(declare-fun zeroValue!1173 () V!31951)

(declare-fun minValue!1173 () V!31951)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!300 (array!56467 array!56469 (_ BitVec 32) (_ BitVec 32) V!31951 V!31951 (_ BitVec 64) (_ BitVec 32) Int) Unit!31618)

(assert (=> b!938153 (= lt!423218 (lemmaListMapContainsThenArrayContainsFrom!300 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!938153 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19121)))

(declare-fun lt!423211 () Unit!31618)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56467 (_ BitVec 32) (_ BitVec 32)) Unit!31618)

(assert (=> b!938153 (= lt!423211 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5108 (ListLongMap!12043 (_ BitVec 64)) Bool)

(assert (=> b!938153 (contains!5108 lt!423215 k0!1099)))

(declare-fun lt!423210 () tuple2!13344)

(declare-fun +!2846 (ListLongMap!12043 tuple2!13344) ListLongMap!12043)

(assert (=> b!938153 (= lt!423215 (+!2846 lt!423217 lt!423210))))

(declare-fun lt!423219 () Unit!31618)

(declare-fun addStillContains!549 (ListLongMap!12043 (_ BitVec 64) V!31951 (_ BitVec 64)) Unit!31618)

(assert (=> b!938153 (= lt!423219 (addStillContains!549 lt!423217 lt!423213 lt!423209 k0!1099))))

(declare-fun getCurrentListMap!3273 (array!56467 array!56469 (_ BitVec 32) (_ BitVec 32) V!31951 V!31951 (_ BitVec 32) Int) ListLongMap!12043)

(assert (=> b!938153 (= (getCurrentListMap!3273 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2846 (getCurrentListMap!3273 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423210))))

(assert (=> b!938153 (= lt!423210 (tuple2!13345 lt!423213 lt!423209))))

(declare-fun get!14340 (ValueCell!9638 V!31951) V!31951)

(declare-fun dynLambda!1643 (Int (_ BitVec 64)) V!31951)

(assert (=> b!938153 (= lt!423209 (get!14340 (select (arr!27170 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1643 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!423207 () Unit!31618)

(declare-fun lemmaListMapRecursiveValidKeyArray!226 (array!56467 array!56469 (_ BitVec 32) (_ BitVec 32) V!31951 V!31951 (_ BitVec 32) Int) Unit!31618)

(assert (=> b!938153 (= lt!423207 (lemmaListMapRecursiveValidKeyArray!226 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!938153 (= e!526876 lt!423216)))

(declare-fun b!938154 () Bool)

(declare-fun e!526871 () Bool)

(assert (=> b!938154 (= e!526871 e!526878)))

(declare-fun res!631215 () Bool)

(assert (=> b!938154 (=> (not res!631215) (not e!526878))))

(declare-fun v!791 () V!31951)

(assert (=> b!938154 (= res!631215 (and (= lt!423214 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!938154 (= lt!423214 (apply!854 lt!423217 k0!1099))))

(declare-fun mapIsEmpty!32130 () Bool)

(assert (=> mapIsEmpty!32130 mapRes!32130))

(declare-fun b!938155 () Bool)

(assert (=> b!938155 (= e!526877 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!938156 () Bool)

(declare-fun res!631216 () Bool)

(assert (=> b!938156 (=> (not res!631216) (not e!526872))))

(assert (=> b!938156 (= res!631216 (and (= (size!27630 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27629 _keys!1487) (size!27630 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!938146 () Bool)

(assert (=> b!938146 (= e!526872 e!526871)))

(declare-fun res!631214 () Bool)

(assert (=> b!938146 (=> (not res!631214) (not e!526871))))

(assert (=> b!938146 (= res!631214 (contains!5108 lt!423217 k0!1099))))

(assert (=> b!938146 (= lt!423217 (getCurrentListMap!3273 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!631218 () Bool)

(assert (=> start!79850 (=> (not res!631218) (not e!526872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79850 (= res!631218 (validMask!0 mask!1881))))

(assert (=> start!79850 e!526872))

(assert (=> start!79850 true))

(assert (=> start!79850 tp_is_empty!20239))

(declare-fun array_inv!21216 (array!56469) Bool)

(assert (=> start!79850 (and (array_inv!21216 _values!1231) e!526869)))

(assert (=> start!79850 tp!61650))

(declare-fun array_inv!21217 (array!56467) Bool)

(assert (=> start!79850 (array_inv!21217 _keys!1487)))

(assert (= (and start!79850 res!631218) b!938156))

(assert (= (and b!938156 res!631216) b!938148))

(assert (= (and b!938148 res!631213) b!938151))

(assert (= (and b!938151 res!631212) b!938142))

(assert (= (and b!938142 res!631217) b!938146))

(assert (= (and b!938146 res!631214) b!938154))

(assert (= (and b!938154 res!631215) b!938145))

(assert (= (and b!938145 c!97822) b!938150))

(assert (= (and b!938145 (not c!97822)) b!938149))

(assert (= (and b!938150 c!97824) b!938153))

(assert (= (and b!938150 (not c!97824)) b!938147))

(assert (= (and b!938153 c!97823) b!938143))

(assert (= (and b!938153 (not c!97823)) b!938155))

(assert (= (and b!938152 condMapEmpty!32130) mapIsEmpty!32130))

(assert (= (and b!938152 (not condMapEmpty!32130)) mapNonEmpty!32130))

(get-info :version)

(assert (= (and mapNonEmpty!32130 ((_ is ValueCellFull!9638) mapValue!32130)) b!938144))

(assert (= (and b!938152 ((_ is ValueCellFull!9638) mapDefault!32130)) b!938141))

(assert (= start!79850 b!938152))

(declare-fun b_lambda!14151 () Bool)

(assert (=> (not b_lambda!14151) (not b!938153)))

(declare-fun t!27390 () Bool)

(declare-fun tb!6117 () Bool)

(assert (=> (and start!79850 (= defaultEntry!1235 defaultEntry!1235) t!27390) tb!6117))

(declare-fun result!12075 () Bool)

(assert (=> tb!6117 (= result!12075 tp_is_empty!20239)))

(assert (=> b!938153 t!27390))

(declare-fun b_and!29065 () Bool)

(assert (= b_and!29063 (and (=> t!27390 result!12075) b_and!29065)))

(declare-fun m!873263 () Bool)

(assert (=> b!938151 m!873263))

(declare-fun m!873265 () Bool)

(assert (=> start!79850 m!873265))

(declare-fun m!873267 () Bool)

(assert (=> start!79850 m!873267))

(declare-fun m!873269 () Bool)

(assert (=> start!79850 m!873269))

(declare-fun m!873271 () Bool)

(assert (=> b!938145 m!873271))

(declare-fun m!873273 () Bool)

(assert (=> b!938148 m!873273))

(declare-fun m!873275 () Bool)

(assert (=> b!938146 m!873275))

(declare-fun m!873277 () Bool)

(assert (=> b!938146 m!873277))

(declare-fun m!873279 () Bool)

(assert (=> mapNonEmpty!32130 m!873279))

(declare-fun m!873281 () Bool)

(assert (=> b!938153 m!873281))

(declare-fun m!873283 () Bool)

(assert (=> b!938153 m!873283))

(declare-fun m!873285 () Bool)

(assert (=> b!938153 m!873285))

(declare-fun m!873287 () Bool)

(assert (=> b!938153 m!873287))

(declare-fun m!873289 () Bool)

(assert (=> b!938153 m!873289))

(assert (=> b!938153 m!873283))

(declare-fun m!873291 () Bool)

(assert (=> b!938153 m!873291))

(declare-fun m!873293 () Bool)

(assert (=> b!938153 m!873293))

(declare-fun m!873295 () Bool)

(assert (=> b!938153 m!873295))

(declare-fun m!873297 () Bool)

(assert (=> b!938153 m!873297))

(declare-fun m!873299 () Bool)

(assert (=> b!938153 m!873299))

(declare-fun m!873301 () Bool)

(assert (=> b!938153 m!873301))

(declare-fun m!873303 () Bool)

(assert (=> b!938153 m!873303))

(assert (=> b!938153 m!873291))

(declare-fun m!873305 () Bool)

(assert (=> b!938153 m!873305))

(assert (=> b!938153 m!873285))

(declare-fun m!873307 () Bool)

(assert (=> b!938153 m!873307))

(declare-fun m!873309 () Bool)

(assert (=> b!938153 m!873309))

(declare-fun m!873311 () Bool)

(assert (=> b!938153 m!873311))

(declare-fun m!873313 () Bool)

(assert (=> b!938143 m!873313))

(declare-fun m!873315 () Bool)

(assert (=> b!938154 m!873315))

(declare-fun m!873317 () Bool)

(assert (=> b!938150 m!873317))

(declare-fun m!873319 () Bool)

(assert (=> b!938150 m!873319))

(check-sat tp_is_empty!20239 (not b!938145) (not b!938150) (not b!938143) (not start!79850) (not b_lambda!14151) (not mapNonEmpty!32130) (not b!938148) (not b!938154) (not b!938153) (not b_next!17731) (not b!938151) (not b!938146) b_and!29065)
(check-sat b_and!29065 (not b_next!17731))
