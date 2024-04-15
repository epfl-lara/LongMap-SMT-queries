; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78996 () Bool)

(assert start!78996)

(declare-fun b_free!17227 () Bool)

(declare-fun b_next!17227 () Bool)

(assert (=> start!78996 (= b_free!17227 (not b_next!17227))))

(declare-fun tp!60122 () Bool)

(declare-fun b_and!28165 () Bool)

(assert (=> start!78996 (= tp!60122 b_and!28165)))

(declare-fun b!925214 () Bool)

(declare-fun res!623528 () Bool)

(declare-fun e!519265 () Bool)

(assert (=> b!925214 (=> (not res!623528) (not e!519265))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31279 0))(
  ( (V!31280 (val!9918 Int)) )
))
(declare-datatypes ((tuple2!12992 0))(
  ( (tuple2!12993 (_1!6507 (_ BitVec 64)) (_2!6507 V!31279)) )
))
(declare-datatypes ((List!18767 0))(
  ( (Nil!18764) (Cons!18763 (h!19909 tuple2!12992) (t!26715 List!18767)) )
))
(declare-datatypes ((ListLongMap!11679 0))(
  ( (ListLongMap!11680 (toList!5855 List!18767)) )
))
(declare-fun lt!416237 () ListLongMap!11679)

(declare-fun v!791 () V!31279)

(declare-fun apply!666 (ListLongMap!11679 (_ BitVec 64)) V!31279)

(assert (=> b!925214 (= res!623528 (= (apply!666 lt!416237 k0!1099) v!791))))

(declare-fun res!623529 () Bool)

(declare-fun e!519261 () Bool)

(assert (=> start!78996 (=> (not res!623529) (not e!519261))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78996 (= res!623529 (validMask!0 mask!1881))))

(assert (=> start!78996 e!519261))

(assert (=> start!78996 true))

(declare-fun tp_is_empty!19735 () Bool)

(assert (=> start!78996 tp_is_empty!19735))

(declare-datatypes ((ValueCell!9386 0))(
  ( (ValueCellFull!9386 (v!12435 V!31279)) (EmptyCell!9386) )
))
(declare-datatypes ((array!55413 0))(
  ( (array!55414 (arr!26652 (Array (_ BitVec 32) ValueCell!9386)) (size!27113 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55413)

(declare-fun e!519272 () Bool)

(declare-fun array_inv!20842 (array!55413) Bool)

(assert (=> start!78996 (and (array_inv!20842 _values!1231) e!519272)))

(assert (=> start!78996 tp!60122))

(declare-datatypes ((array!55415 0))(
  ( (array!55416 (arr!26653 (Array (_ BitVec 32) (_ BitVec 64))) (size!27114 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55415)

(declare-fun array_inv!20843 (array!55415) Bool)

(assert (=> start!78996 (array_inv!20843 _keys!1487)))

(declare-fun b!925215 () Bool)

(declare-datatypes ((Unit!31174 0))(
  ( (Unit!31175) )
))
(declare-fun e!519273 () Unit!31174)

(declare-fun Unit!31176 () Unit!31174)

(assert (=> b!925215 (= e!519273 Unit!31176)))

(declare-fun b!925216 () Bool)

(assert (=> b!925216 (= e!519265 (not true))))

(declare-fun e!519267 () Bool)

(assert (=> b!925216 e!519267))

(declare-fun res!623527 () Bool)

(assert (=> b!925216 (=> (not res!623527) (not e!519267))))

(declare-fun lt!416238 () ListLongMap!11679)

(declare-fun contains!4867 (ListLongMap!11679 (_ BitVec 64)) Bool)

(assert (=> b!925216 (= res!623527 (contains!4867 lt!416238 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31279)

(declare-fun minValue!1173 () V!31279)

(declare-fun getCurrentListMap!3041 (array!55415 array!55413 (_ BitVec 32) (_ BitVec 32) V!31279 V!31279 (_ BitVec 32) Int) ListLongMap!11679)

(assert (=> b!925216 (= lt!416238 (getCurrentListMap!3041 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!416252 () Unit!31174)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!76 (array!55415 array!55413 (_ BitVec 32) (_ BitVec 32) V!31279 V!31279 (_ BitVec 64) V!31279 (_ BitVec 32) Int) Unit!31174)

(assert (=> b!925216 (= lt!416252 (lemmaListMapApplyFromThenApplyFromZero!76 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925217 () Bool)

(declare-fun res!623533 () Bool)

(assert (=> b!925217 (=> (not res!623533) (not e!519261))))

(assert (=> b!925217 (= res!623533 (and (= (size!27113 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27114 _keys!1487) (size!27113 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!925218 () Bool)

(declare-fun e!519271 () Bool)

(declare-fun mapRes!31359 () Bool)

(assert (=> b!925218 (= e!519272 (and e!519271 mapRes!31359))))

(declare-fun condMapEmpty!31359 () Bool)

(declare-fun mapDefault!31359 () ValueCell!9386)

(assert (=> b!925218 (= condMapEmpty!31359 (= (arr!26652 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9386)) mapDefault!31359)))))

(declare-fun b!925219 () Bool)

(declare-fun res!623532 () Bool)

(assert (=> b!925219 (=> (not res!623532) (not e!519261))))

(declare-datatypes ((List!18768 0))(
  ( (Nil!18765) (Cons!18764 (h!19910 (_ BitVec 64)) (t!26716 List!18768)) )
))
(declare-fun arrayNoDuplicates!0 (array!55415 (_ BitVec 32) List!18768) Bool)

(assert (=> b!925219 (= res!623532 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18765))))

(declare-fun b!925220 () Bool)

(declare-fun res!623524 () Bool)

(assert (=> b!925220 (=> (not res!623524) (not e!519261))))

(assert (=> b!925220 (= res!623524 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27114 _keys!1487))))))

(declare-fun b!925221 () Bool)

(declare-fun e!519270 () Bool)

(assert (=> b!925221 (= e!519270 e!519265)))

(declare-fun res!623531 () Bool)

(assert (=> b!925221 (=> (not res!623531) (not e!519265))))

(assert (=> b!925221 (= res!623531 (contains!4867 lt!416237 k0!1099))))

(assert (=> b!925221 (= lt!416237 (getCurrentListMap!3041 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925222 () Bool)

(declare-fun e!519269 () Bool)

(assert (=> b!925222 (= e!519269 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!31359 () Bool)

(declare-fun tp!60123 () Bool)

(declare-fun e!519266 () Bool)

(assert (=> mapNonEmpty!31359 (= mapRes!31359 (and tp!60123 e!519266))))

(declare-fun mapRest!31359 () (Array (_ BitVec 32) ValueCell!9386))

(declare-fun mapKey!31359 () (_ BitVec 32))

(declare-fun mapValue!31359 () ValueCell!9386)

(assert (=> mapNonEmpty!31359 (= (arr!26652 _values!1231) (store mapRest!31359 mapKey!31359 mapValue!31359))))

(declare-fun b!925223 () Bool)

(assert (=> b!925223 (= e!519271 tp_is_empty!19735)))

(declare-fun b!925224 () Bool)

(declare-fun e!519264 () Bool)

(assert (=> b!925224 (= e!519264 e!519270)))

(declare-fun res!623525 () Bool)

(assert (=> b!925224 (=> (not res!623525) (not e!519270))))

(assert (=> b!925224 (= res!623525 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27114 _keys!1487)))))

(declare-fun lt!416250 () Unit!31174)

(declare-fun e!519268 () Unit!31174)

(assert (=> b!925224 (= lt!416250 e!519268)))

(declare-fun c!96517 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925224 (= c!96517 (validKeyInArray!0 k0!1099))))

(declare-fun b!925225 () Bool)

(assert (=> b!925225 (= e!519266 tp_is_empty!19735)))

(declare-fun mapIsEmpty!31359 () Bool)

(assert (=> mapIsEmpty!31359 mapRes!31359))

(declare-fun b!925226 () Bool)

(declare-fun lt!416245 () ListLongMap!11679)

(declare-fun lt!416249 () V!31279)

(assert (=> b!925226 (= (apply!666 lt!416245 k0!1099) lt!416249)))

(declare-fun lt!416243 () (_ BitVec 64))

(declare-fun lt!416248 () ListLongMap!11679)

(declare-fun lt!416239 () Unit!31174)

(declare-fun lt!416244 () V!31279)

(declare-fun addApplyDifferent!379 (ListLongMap!11679 (_ BitVec 64) V!31279 (_ BitVec 64)) Unit!31174)

(assert (=> b!925226 (= lt!416239 (addApplyDifferent!379 lt!416248 lt!416243 lt!416244 k0!1099))))

(assert (=> b!925226 (not (= lt!416243 k0!1099))))

(declare-fun lt!416246 () Unit!31174)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55415 (_ BitVec 64) (_ BitVec 32) List!18768) Unit!31174)

(assert (=> b!925226 (= lt!416246 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18765))))

(assert (=> b!925226 e!519269))

(declare-fun c!96516 () Bool)

(assert (=> b!925226 (= c!96516 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416247 () Unit!31174)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!239 (array!55415 array!55413 (_ BitVec 32) (_ BitVec 32) V!31279 V!31279 (_ BitVec 64) (_ BitVec 32) Int) Unit!31174)

(assert (=> b!925226 (= lt!416247 (lemmaListMapContainsThenArrayContainsFrom!239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!925226 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18765)))

(declare-fun lt!416240 () Unit!31174)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55415 (_ BitVec 32) (_ BitVec 32)) Unit!31174)

(assert (=> b!925226 (= lt!416240 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!925226 (contains!4867 lt!416245 k0!1099)))

(declare-fun lt!416251 () tuple2!12992)

(declare-fun +!2751 (ListLongMap!11679 tuple2!12992) ListLongMap!11679)

(assert (=> b!925226 (= lt!416245 (+!2751 lt!416248 lt!416251))))

(declare-fun lt!416241 () Unit!31174)

(declare-fun addStillContains!448 (ListLongMap!11679 (_ BitVec 64) V!31279 (_ BitVec 64)) Unit!31174)

(assert (=> b!925226 (= lt!416241 (addStillContains!448 lt!416248 lt!416243 lt!416244 k0!1099))))

(assert (=> b!925226 (= (getCurrentListMap!3041 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2751 (getCurrentListMap!3041 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416251))))

(assert (=> b!925226 (= lt!416251 (tuple2!12993 lt!416243 lt!416244))))

(declare-fun get!14022 (ValueCell!9386 V!31279) V!31279)

(declare-fun dynLambda!1507 (Int (_ BitVec 64)) V!31279)

(assert (=> b!925226 (= lt!416244 (get!14022 (select (arr!26652 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1507 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416242 () Unit!31174)

(declare-fun lemmaListMapRecursiveValidKeyArray!115 (array!55415 array!55413 (_ BitVec 32) (_ BitVec 32) V!31279 V!31279 (_ BitVec 32) Int) Unit!31174)

(assert (=> b!925226 (= lt!416242 (lemmaListMapRecursiveValidKeyArray!115 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!925226 (= e!519273 lt!416239)))

(declare-fun b!925227 () Bool)

(declare-fun res!623526 () Bool)

(assert (=> b!925227 (=> (not res!623526) (not e!519261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55415 (_ BitVec 32)) Bool)

(assert (=> b!925227 (= res!623526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!925228 () Bool)

(assert (=> b!925228 (= e!519268 e!519273)))

(assert (=> b!925228 (= lt!416243 (select (arr!26653 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96515 () Bool)

(assert (=> b!925228 (= c!96515 (validKeyInArray!0 lt!416243))))

(declare-fun b!925229 () Bool)

(declare-fun e!519262 () Bool)

(assert (=> b!925229 (= e!519261 e!519262)))

(declare-fun res!623534 () Bool)

(assert (=> b!925229 (=> (not res!623534) (not e!519262))))

(assert (=> b!925229 (= res!623534 (contains!4867 lt!416248 k0!1099))))

(assert (=> b!925229 (= lt!416248 (getCurrentListMap!3041 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!925230 () Bool)

(assert (=> b!925230 (= e!519267 (= (apply!666 lt!416238 k0!1099) v!791))))

(declare-fun b!925231 () Bool)

(declare-fun arrayContainsKey!0 (array!55415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925231 (= e!519269 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!925232 () Bool)

(assert (=> b!925232 (= e!519262 e!519264)))

(declare-fun res!623530 () Bool)

(assert (=> b!925232 (=> (not res!623530) (not e!519264))))

(assert (=> b!925232 (= res!623530 (and (= lt!416249 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!925232 (= lt!416249 (apply!666 lt!416248 k0!1099))))

(declare-fun b!925233 () Bool)

(declare-fun Unit!31177 () Unit!31174)

(assert (=> b!925233 (= e!519268 Unit!31177)))

(assert (= (and start!78996 res!623529) b!925217))

(assert (= (and b!925217 res!623533) b!925227))

(assert (= (and b!925227 res!623526) b!925219))

(assert (= (and b!925219 res!623532) b!925220))

(assert (= (and b!925220 res!623524) b!925229))

(assert (= (and b!925229 res!623534) b!925232))

(assert (= (and b!925232 res!623530) b!925224))

(assert (= (and b!925224 c!96517) b!925228))

(assert (= (and b!925224 (not c!96517)) b!925233))

(assert (= (and b!925228 c!96515) b!925226))

(assert (= (and b!925228 (not c!96515)) b!925215))

(assert (= (and b!925226 c!96516) b!925231))

(assert (= (and b!925226 (not c!96516)) b!925222))

(assert (= (and b!925224 res!623525) b!925221))

(assert (= (and b!925221 res!623531) b!925214))

(assert (= (and b!925214 res!623528) b!925216))

(assert (= (and b!925216 res!623527) b!925230))

(assert (= (and b!925218 condMapEmpty!31359) mapIsEmpty!31359))

(assert (= (and b!925218 (not condMapEmpty!31359)) mapNonEmpty!31359))

(get-info :version)

(assert (= (and mapNonEmpty!31359 ((_ is ValueCellFull!9386) mapValue!31359)) b!925225))

(assert (= (and b!925218 ((_ is ValueCellFull!9386) mapDefault!31359)) b!925223))

(assert (= start!78996 b!925218))

(declare-fun b_lambda!13711 () Bool)

(assert (=> (not b_lambda!13711) (not b!925226)))

(declare-fun t!26714 () Bool)

(declare-fun tb!5799 () Bool)

(assert (=> (and start!78996 (= defaultEntry!1235 defaultEntry!1235) t!26714) tb!5799))

(declare-fun result!11429 () Bool)

(assert (=> tb!5799 (= result!11429 tp_is_empty!19735)))

(assert (=> b!925226 t!26714))

(declare-fun b_and!28167 () Bool)

(assert (= b_and!28165 (and (=> t!26714 result!11429) b_and!28167)))

(declare-fun m!859117 () Bool)

(assert (=> b!925226 m!859117))

(declare-fun m!859119 () Bool)

(assert (=> b!925226 m!859119))

(declare-fun m!859121 () Bool)

(assert (=> b!925226 m!859121))

(declare-fun m!859123 () Bool)

(assert (=> b!925226 m!859123))

(declare-fun m!859125 () Bool)

(assert (=> b!925226 m!859125))

(declare-fun m!859127 () Bool)

(assert (=> b!925226 m!859127))

(assert (=> b!925226 m!859125))

(declare-fun m!859129 () Bool)

(assert (=> b!925226 m!859129))

(declare-fun m!859131 () Bool)

(assert (=> b!925226 m!859131))

(declare-fun m!859133 () Bool)

(assert (=> b!925226 m!859133))

(declare-fun m!859135 () Bool)

(assert (=> b!925226 m!859135))

(declare-fun m!859137 () Bool)

(assert (=> b!925226 m!859137))

(assert (=> b!925226 m!859127))

(declare-fun m!859139 () Bool)

(assert (=> b!925226 m!859139))

(declare-fun m!859141 () Bool)

(assert (=> b!925226 m!859141))

(assert (=> b!925226 m!859119))

(declare-fun m!859143 () Bool)

(assert (=> b!925226 m!859143))

(declare-fun m!859145 () Bool)

(assert (=> b!925226 m!859145))

(declare-fun m!859147 () Bool)

(assert (=> b!925226 m!859147))

(declare-fun m!859149 () Bool)

(assert (=> mapNonEmpty!31359 m!859149))

(declare-fun m!859151 () Bool)

(assert (=> b!925232 m!859151))

(declare-fun m!859153 () Bool)

(assert (=> b!925216 m!859153))

(declare-fun m!859155 () Bool)

(assert (=> b!925216 m!859155))

(declare-fun m!859157 () Bool)

(assert (=> b!925216 m!859157))

(declare-fun m!859159 () Bool)

(assert (=> b!925214 m!859159))

(declare-fun m!859161 () Bool)

(assert (=> b!925219 m!859161))

(declare-fun m!859163 () Bool)

(assert (=> b!925221 m!859163))

(assert (=> b!925221 m!859131))

(declare-fun m!859165 () Bool)

(assert (=> b!925229 m!859165))

(declare-fun m!859167 () Bool)

(assert (=> b!925229 m!859167))

(declare-fun m!859169 () Bool)

(assert (=> start!78996 m!859169))

(declare-fun m!859171 () Bool)

(assert (=> start!78996 m!859171))

(declare-fun m!859173 () Bool)

(assert (=> start!78996 m!859173))

(declare-fun m!859175 () Bool)

(assert (=> b!925230 m!859175))

(declare-fun m!859177 () Bool)

(assert (=> b!925224 m!859177))

(declare-fun m!859179 () Bool)

(assert (=> b!925228 m!859179))

(declare-fun m!859181 () Bool)

(assert (=> b!925228 m!859181))

(declare-fun m!859183 () Bool)

(assert (=> b!925227 m!859183))

(declare-fun m!859185 () Bool)

(assert (=> b!925231 m!859185))

(check-sat (not b!925227) (not b!925214) (not b!925224) (not start!78996) (not b!925232) (not b!925231) b_and!28167 tp_is_empty!19735 (not b!925221) (not b!925219) (not b!925228) (not b_next!17227) (not b!925226) (not b!925230) (not b!925229) (not b!925216) (not b_lambda!13711) (not mapNonEmpty!31359))
(check-sat b_and!28167 (not b_next!17227))
