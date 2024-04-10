; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79004 () Bool)

(assert start!79004)

(declare-fun b_free!17217 () Bool)

(declare-fun b_next!17217 () Bool)

(assert (=> start!79004 (= b_free!17217 (not b_next!17217))))

(declare-fun tp!60091 () Bool)

(declare-fun b_and!28171 () Bool)

(assert (=> start!79004 (= tp!60091 b_and!28171)))

(declare-fun b!925143 () Bool)

(declare-fun e!519220 () Bool)

(declare-fun tp_is_empty!19725 () Bool)

(assert (=> b!925143 (= e!519220 tp_is_empty!19725)))

(declare-fun b!925144 () Bool)

(declare-fun e!519226 () Bool)

(declare-fun e!519219 () Bool)

(assert (=> b!925144 (= e!519226 e!519219)))

(declare-fun res!623473 () Bool)

(assert (=> b!925144 (=> (not res!623473) (not e!519219))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((V!31265 0))(
  ( (V!31266 (val!9913 Int)) )
))
(declare-fun v!791 () V!31265)

(declare-fun lt!416238 () V!31265)

(assert (=> b!925144 (= res!623473 (and (= lt!416238 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!12922 0))(
  ( (tuple2!12923 (_1!6472 (_ BitVec 64)) (_2!6472 V!31265)) )
))
(declare-datatypes ((List!18724 0))(
  ( (Nil!18721) (Cons!18720 (h!19866 tuple2!12922) (t!26671 List!18724)) )
))
(declare-datatypes ((ListLongMap!11619 0))(
  ( (ListLongMap!11620 (toList!5825 List!18724)) )
))
(declare-fun lt!416248 () ListLongMap!11619)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!655 (ListLongMap!11619 (_ BitVec 64)) V!31265)

(assert (=> b!925144 (= lt!416238 (apply!655 lt!416248 k0!1099))))

(declare-fun b!925145 () Bool)

(declare-fun res!623470 () Bool)

(declare-fun e!519222 () Bool)

(assert (=> b!925145 (=> (not res!623470) (not e!519222))))

(declare-datatypes ((array!55418 0))(
  ( (array!55419 (arr!26654 (Array (_ BitVec 32) (_ BitVec 64))) (size!27113 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55418)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55418 (_ BitVec 32)) Bool)

(assert (=> b!925145 (= res!623470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!925146 () Bool)

(declare-fun e!519216 () Bool)

(declare-fun e!519218 () Bool)

(assert (=> b!925146 (= e!519216 e!519218)))

(declare-fun res!623479 () Bool)

(assert (=> b!925146 (=> (not res!623479) (not e!519218))))

(declare-fun lt!416240 () ListLongMap!11619)

(declare-fun contains!4885 (ListLongMap!11619 (_ BitVec 64)) Bool)

(assert (=> b!925146 (= res!623479 (contains!4885 lt!416240 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9381 0))(
  ( (ValueCellFull!9381 (v!12431 V!31265)) (EmptyCell!9381) )
))
(declare-datatypes ((array!55420 0))(
  ( (array!55421 (arr!26655 (Array (_ BitVec 32) ValueCell!9381)) (size!27114 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55420)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31265)

(declare-fun minValue!1173 () V!31265)

(declare-fun getCurrentListMap!3076 (array!55418 array!55420 (_ BitVec 32) (_ BitVec 32) V!31265 V!31265 (_ BitVec 32) Int) ListLongMap!11619)

(assert (=> b!925146 (= lt!416240 (getCurrentListMap!3076 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925147 () Bool)

(declare-fun res!623477 () Bool)

(assert (=> b!925147 (=> (not res!623477) (not e!519218))))

(assert (=> b!925147 (= res!623477 (= (apply!655 lt!416240 k0!1099) v!791))))

(declare-fun b!925148 () Bool)

(declare-datatypes ((Unit!31249 0))(
  ( (Unit!31250) )
))
(declare-fun e!519214 () Unit!31249)

(declare-fun Unit!31251 () Unit!31249)

(assert (=> b!925148 (= e!519214 Unit!31251)))

(declare-fun b!925149 () Bool)

(declare-fun e!519223 () Bool)

(assert (=> b!925149 (= e!519223 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925150 () Bool)

(declare-fun res!623476 () Bool)

(assert (=> b!925150 (=> (not res!623476) (not e!519222))))

(assert (=> b!925150 (= res!623476 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27113 _keys!1487))))))

(declare-fun res!623474 () Bool)

(assert (=> start!79004 (=> (not res!623474) (not e!519222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79004 (= res!623474 (validMask!0 mask!1881))))

(assert (=> start!79004 e!519222))

(assert (=> start!79004 true))

(assert (=> start!79004 tp_is_empty!19725))

(declare-fun e!519221 () Bool)

(declare-fun array_inv!20758 (array!55420) Bool)

(assert (=> start!79004 (and (array_inv!20758 _values!1231) e!519221)))

(assert (=> start!79004 tp!60091))

(declare-fun array_inv!20759 (array!55418) Bool)

(assert (=> start!79004 (array_inv!20759 _keys!1487)))

(declare-fun e!519217 () Bool)

(declare-fun b!925151 () Bool)

(declare-fun lt!416241 () ListLongMap!11619)

(assert (=> b!925151 (= e!519217 (= (apply!655 lt!416241 k0!1099) v!791))))

(declare-fun b!925152 () Bool)

(declare-fun e!519215 () Bool)

(assert (=> b!925152 (= e!519215 tp_is_empty!19725)))

(declare-fun b!925153 () Bool)

(declare-fun e!519225 () Unit!31249)

(declare-fun Unit!31252 () Unit!31249)

(assert (=> b!925153 (= e!519225 Unit!31252)))

(declare-fun b!925154 () Bool)

(assert (=> b!925154 (= e!519219 e!519216)))

(declare-fun res!623471 () Bool)

(assert (=> b!925154 (=> (not res!623471) (not e!519216))))

(assert (=> b!925154 (= res!623471 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27113 _keys!1487)))))

(declare-fun lt!416239 () Unit!31249)

(assert (=> b!925154 (= lt!416239 e!519225)))

(declare-fun c!96535 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925154 (= c!96535 (validKeyInArray!0 k0!1099))))

(declare-fun b!925155 () Bool)

(declare-fun lt!416233 () ListLongMap!11619)

(assert (=> b!925155 (= (apply!655 lt!416233 k0!1099) lt!416238)))

(declare-fun lt!416247 () (_ BitVec 64))

(declare-fun lt!416235 () Unit!31249)

(declare-fun lt!416245 () V!31265)

(declare-fun addApplyDifferent!376 (ListLongMap!11619 (_ BitVec 64) V!31265 (_ BitVec 64)) Unit!31249)

(assert (=> b!925155 (= lt!416235 (addApplyDifferent!376 lt!416248 lt!416247 lt!416245 k0!1099))))

(assert (=> b!925155 (not (= lt!416247 k0!1099))))

(declare-fun lt!416244 () Unit!31249)

(declare-datatypes ((List!18725 0))(
  ( (Nil!18722) (Cons!18721 (h!19867 (_ BitVec 64)) (t!26672 List!18725)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55418 (_ BitVec 64) (_ BitVec 32) List!18725) Unit!31249)

(assert (=> b!925155 (= lt!416244 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18722))))

(assert (=> b!925155 e!519223))

(declare-fun c!96536 () Bool)

(assert (=> b!925155 (= c!96536 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416236 () Unit!31249)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!227 (array!55418 array!55420 (_ BitVec 32) (_ BitVec 32) V!31265 V!31265 (_ BitVec 64) (_ BitVec 32) Int) Unit!31249)

(assert (=> b!925155 (= lt!416236 (lemmaListMapContainsThenArrayContainsFrom!227 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55418 (_ BitVec 32) List!18725) Bool)

(assert (=> b!925155 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18722)))

(declare-fun lt!416246 () Unit!31249)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55418 (_ BitVec 32) (_ BitVec 32)) Unit!31249)

(assert (=> b!925155 (= lt!416246 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!925155 (contains!4885 lt!416233 k0!1099)))

(declare-fun lt!416234 () tuple2!12922)

(declare-fun +!2720 (ListLongMap!11619 tuple2!12922) ListLongMap!11619)

(assert (=> b!925155 (= lt!416233 (+!2720 lt!416248 lt!416234))))

(declare-fun lt!416237 () Unit!31249)

(declare-fun addStillContains!444 (ListLongMap!11619 (_ BitVec 64) V!31265 (_ BitVec 64)) Unit!31249)

(assert (=> b!925155 (= lt!416237 (addStillContains!444 lt!416248 lt!416247 lt!416245 k0!1099))))

(assert (=> b!925155 (= (getCurrentListMap!3076 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2720 (getCurrentListMap!3076 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416234))))

(assert (=> b!925155 (= lt!416234 (tuple2!12923 lt!416247 lt!416245))))

(declare-fun get!14015 (ValueCell!9381 V!31265) V!31265)

(declare-fun dynLambda!1509 (Int (_ BitVec 64)) V!31265)

(assert (=> b!925155 (= lt!416245 (get!14015 (select (arr!26655 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1509 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416243 () Unit!31249)

(declare-fun lemmaListMapRecursiveValidKeyArray!110 (array!55418 array!55420 (_ BitVec 32) (_ BitVec 32) V!31265 V!31265 (_ BitVec 32) Int) Unit!31249)

(assert (=> b!925155 (= lt!416243 (lemmaListMapRecursiveValidKeyArray!110 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!925155 (= e!519214 lt!416235)))

(declare-fun b!925156 () Bool)

(assert (=> b!925156 (= e!519225 e!519214)))

(assert (=> b!925156 (= lt!416247 (select (arr!26654 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96537 () Bool)

(assert (=> b!925156 (= c!96537 (validKeyInArray!0 lt!416247))))

(declare-fun mapIsEmpty!31344 () Bool)

(declare-fun mapRes!31344 () Bool)

(assert (=> mapIsEmpty!31344 mapRes!31344))

(declare-fun b!925157 () Bool)

(declare-fun res!623469 () Bool)

(assert (=> b!925157 (=> (not res!623469) (not e!519222))))

(assert (=> b!925157 (= res!623469 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18722))))

(declare-fun b!925158 () Bool)

(declare-fun res!623478 () Bool)

(assert (=> b!925158 (=> (not res!623478) (not e!519222))))

(assert (=> b!925158 (= res!623478 (and (= (size!27114 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27113 _keys!1487) (size!27114 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!925159 () Bool)

(assert (=> b!925159 (= e!519218 (not true))))

(assert (=> b!925159 e!519217))

(declare-fun res!623472 () Bool)

(assert (=> b!925159 (=> (not res!623472) (not e!519217))))

(assert (=> b!925159 (= res!623472 (contains!4885 lt!416241 k0!1099))))

(assert (=> b!925159 (= lt!416241 (getCurrentListMap!3076 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!416242 () Unit!31249)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!67 (array!55418 array!55420 (_ BitVec 32) (_ BitVec 32) V!31265 V!31265 (_ BitVec 64) V!31265 (_ BitVec 32) Int) Unit!31249)

(assert (=> b!925159 (= lt!416242 (lemmaListMapApplyFromThenApplyFromZero!67 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!31344 () Bool)

(declare-fun tp!60092 () Bool)

(assert (=> mapNonEmpty!31344 (= mapRes!31344 (and tp!60092 e!519215))))

(declare-fun mapKey!31344 () (_ BitVec 32))

(declare-fun mapValue!31344 () ValueCell!9381)

(declare-fun mapRest!31344 () (Array (_ BitVec 32) ValueCell!9381))

(assert (=> mapNonEmpty!31344 (= (arr!26655 _values!1231) (store mapRest!31344 mapKey!31344 mapValue!31344))))

(declare-fun b!925160 () Bool)

(assert (=> b!925160 (= e!519221 (and e!519220 mapRes!31344))))

(declare-fun condMapEmpty!31344 () Bool)

(declare-fun mapDefault!31344 () ValueCell!9381)

(assert (=> b!925160 (= condMapEmpty!31344 (= (arr!26655 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9381)) mapDefault!31344)))))

(declare-fun b!925161 () Bool)

(assert (=> b!925161 (= e!519222 e!519226)))

(declare-fun res!623475 () Bool)

(assert (=> b!925161 (=> (not res!623475) (not e!519226))))

(assert (=> b!925161 (= res!623475 (contains!4885 lt!416248 k0!1099))))

(assert (=> b!925161 (= lt!416248 (getCurrentListMap!3076 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!925162 () Bool)

(declare-fun arrayContainsKey!0 (array!55418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925162 (= e!519223 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(assert (= (and start!79004 res!623474) b!925158))

(assert (= (and b!925158 res!623478) b!925145))

(assert (= (and b!925145 res!623470) b!925157))

(assert (= (and b!925157 res!623469) b!925150))

(assert (= (and b!925150 res!623476) b!925161))

(assert (= (and b!925161 res!623475) b!925144))

(assert (= (and b!925144 res!623473) b!925154))

(assert (= (and b!925154 c!96535) b!925156))

(assert (= (and b!925154 (not c!96535)) b!925153))

(assert (= (and b!925156 c!96537) b!925155))

(assert (= (and b!925156 (not c!96537)) b!925148))

(assert (= (and b!925155 c!96536) b!925162))

(assert (= (and b!925155 (not c!96536)) b!925149))

(assert (= (and b!925154 res!623471) b!925146))

(assert (= (and b!925146 res!623479) b!925147))

(assert (= (and b!925147 res!623477) b!925159))

(assert (= (and b!925159 res!623472) b!925151))

(assert (= (and b!925160 condMapEmpty!31344) mapIsEmpty!31344))

(assert (= (and b!925160 (not condMapEmpty!31344)) mapNonEmpty!31344))

(get-info :version)

(assert (= (and mapNonEmpty!31344 ((_ is ValueCellFull!9381) mapValue!31344)) b!925152))

(assert (= (and b!925160 ((_ is ValueCellFull!9381) mapDefault!31344)) b!925143))

(assert (= start!79004 b!925160))

(declare-fun b_lambda!13719 () Bool)

(assert (=> (not b_lambda!13719) (not b!925155)))

(declare-fun t!26670 () Bool)

(declare-fun tb!5797 () Bool)

(assert (=> (and start!79004 (= defaultEntry!1235 defaultEntry!1235) t!26670) tb!5797))

(declare-fun result!11417 () Bool)

(assert (=> tb!5797 (= result!11417 tp_is_empty!19725)))

(assert (=> b!925155 t!26670))

(declare-fun b_and!28173 () Bool)

(assert (= b_and!28171 (and (=> t!26670 result!11417) b_and!28173)))

(declare-fun m!859525 () Bool)

(assert (=> b!925146 m!859525))

(declare-fun m!859527 () Bool)

(assert (=> b!925146 m!859527))

(declare-fun m!859529 () Bool)

(assert (=> b!925147 m!859529))

(declare-fun m!859531 () Bool)

(assert (=> b!925151 m!859531))

(declare-fun m!859533 () Bool)

(assert (=> start!79004 m!859533))

(declare-fun m!859535 () Bool)

(assert (=> start!79004 m!859535))

(declare-fun m!859537 () Bool)

(assert (=> start!79004 m!859537))

(declare-fun m!859539 () Bool)

(assert (=> b!925144 m!859539))

(declare-fun m!859541 () Bool)

(assert (=> b!925154 m!859541))

(declare-fun m!859543 () Bool)

(assert (=> b!925145 m!859543))

(declare-fun m!859545 () Bool)

(assert (=> b!925161 m!859545))

(declare-fun m!859547 () Bool)

(assert (=> b!925161 m!859547))

(declare-fun m!859549 () Bool)

(assert (=> b!925157 m!859549))

(declare-fun m!859551 () Bool)

(assert (=> b!925162 m!859551))

(declare-fun m!859553 () Bool)

(assert (=> mapNonEmpty!31344 m!859553))

(declare-fun m!859555 () Bool)

(assert (=> b!925159 m!859555))

(declare-fun m!859557 () Bool)

(assert (=> b!925159 m!859557))

(declare-fun m!859559 () Bool)

(assert (=> b!925159 m!859559))

(declare-fun m!859561 () Bool)

(assert (=> b!925156 m!859561))

(declare-fun m!859563 () Bool)

(assert (=> b!925156 m!859563))

(declare-fun m!859565 () Bool)

(assert (=> b!925155 m!859565))

(declare-fun m!859567 () Bool)

(assert (=> b!925155 m!859567))

(declare-fun m!859569 () Bool)

(assert (=> b!925155 m!859569))

(declare-fun m!859571 () Bool)

(assert (=> b!925155 m!859571))

(declare-fun m!859573 () Bool)

(assert (=> b!925155 m!859573))

(declare-fun m!859575 () Bool)

(assert (=> b!925155 m!859575))

(declare-fun m!859577 () Bool)

(assert (=> b!925155 m!859577))

(declare-fun m!859579 () Bool)

(assert (=> b!925155 m!859579))

(assert (=> b!925155 m!859575))

(assert (=> b!925155 m!859577))

(declare-fun m!859581 () Bool)

(assert (=> b!925155 m!859581))

(assert (=> b!925155 m!859527))

(declare-fun m!859583 () Bool)

(assert (=> b!925155 m!859583))

(declare-fun m!859585 () Bool)

(assert (=> b!925155 m!859585))

(declare-fun m!859587 () Bool)

(assert (=> b!925155 m!859587))

(declare-fun m!859589 () Bool)

(assert (=> b!925155 m!859589))

(declare-fun m!859591 () Bool)

(assert (=> b!925155 m!859591))

(assert (=> b!925155 m!859565))

(declare-fun m!859593 () Bool)

(assert (=> b!925155 m!859593))

(check-sat (not start!79004) (not b!925146) (not b!925155) (not b!925147) (not b!925154) (not b_lambda!13719) (not b!925157) b_and!28173 (not b!925145) (not mapNonEmpty!31344) (not b_next!17217) (not b!925159) tp_is_empty!19725 (not b!925161) (not b!925156) (not b!925144) (not b!925162) (not b!925151))
(check-sat b_and!28173 (not b_next!17217))
