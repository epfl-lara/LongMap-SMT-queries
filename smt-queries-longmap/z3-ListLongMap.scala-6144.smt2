; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79140 () Bool)

(assert start!79140)

(declare-fun b_free!17185 () Bool)

(declare-fun b_next!17185 () Bool)

(assert (=> start!79140 (= b_free!17185 (not b_next!17185))))

(declare-fun tp!59996 () Bool)

(declare-fun b_and!28117 () Bool)

(assert (=> start!79140 (= tp!59996 b_and!28117)))

(declare-fun mapNonEmpty!31296 () Bool)

(declare-fun mapRes!31296 () Bool)

(declare-fun tp!59997 () Bool)

(declare-fun e!519222 () Bool)

(assert (=> mapNonEmpty!31296 (= mapRes!31296 (and tp!59997 e!519222))))

(declare-datatypes ((V!31223 0))(
  ( (V!31224 (val!9897 Int)) )
))
(declare-datatypes ((ValueCell!9365 0))(
  ( (ValueCellFull!9365 (v!12412 V!31223)) (EmptyCell!9365) )
))
(declare-fun mapValue!31296 () ValueCell!9365)

(declare-fun mapKey!31296 () (_ BitVec 32))

(declare-datatypes ((array!55407 0))(
  ( (array!55408 (arr!26644 (Array (_ BitVec 32) ValueCell!9365)) (size!27104 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55407)

(declare-fun mapRest!31296 () (Array (_ BitVec 32) ValueCell!9365))

(assert (=> mapNonEmpty!31296 (= (arr!26644 _values!1231) (store mapRest!31296 mapKey!31296 mapValue!31296))))

(declare-fun b!925140 () Bool)

(declare-fun e!519218 () Bool)

(declare-fun e!519217 () Bool)

(assert (=> b!925140 (= e!519218 (and e!519217 mapRes!31296))))

(declare-fun condMapEmpty!31296 () Bool)

(declare-fun mapDefault!31296 () ValueCell!9365)

(assert (=> b!925140 (= condMapEmpty!31296 (= (arr!26644 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9365)) mapDefault!31296)))))

(declare-fun b!925141 () Bool)

(declare-fun res!623373 () Bool)

(declare-fun e!519226 () Bool)

(assert (=> b!925141 (=> (not res!623373) (not e!519226))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55409 0))(
  ( (array!55410 (arr!26645 (Array (_ BitVec 32) (_ BitVec 64))) (size!27105 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55409)

(assert (=> b!925141 (= res!623373 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27105 _keys!1487))))))

(declare-fun b!925142 () Bool)

(declare-fun tp_is_empty!19693 () Bool)

(assert (=> b!925142 (= e!519222 tp_is_empty!19693)))

(declare-fun b!925143 () Bool)

(declare-fun res!623375 () Bool)

(assert (=> b!925143 (=> (not res!623375) (not e!519226))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!925143 (= res!623375 (and (= (size!27104 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27105 _keys!1487) (size!27104 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!925144 () Bool)

(declare-datatypes ((tuple2!12886 0))(
  ( (tuple2!12887 (_1!6454 (_ BitVec 64)) (_2!6454 V!31223)) )
))
(declare-datatypes ((List!18699 0))(
  ( (Nil!18696) (Cons!18695 (h!19847 tuple2!12886) (t!26606 List!18699)) )
))
(declare-datatypes ((ListLongMap!11585 0))(
  ( (ListLongMap!11586 (toList!5808 List!18699)) )
))
(declare-fun lt!415882 () ListLongMap!11585)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!415871 () V!31223)

(declare-fun apply!661 (ListLongMap!11585 (_ BitVec 64)) V!31223)

(assert (=> b!925144 (= (apply!661 lt!415882 k0!1099) lt!415871)))

(declare-fun lt!415877 () ListLongMap!11585)

(declare-datatypes ((Unit!31202 0))(
  ( (Unit!31203) )
))
(declare-fun lt!415880 () Unit!31202)

(declare-fun lt!415874 () V!31223)

(declare-fun lt!415870 () (_ BitVec 64))

(declare-fun addApplyDifferent!364 (ListLongMap!11585 (_ BitVec 64) V!31223 (_ BitVec 64)) Unit!31202)

(assert (=> b!925144 (= lt!415880 (addApplyDifferent!364 lt!415877 lt!415870 lt!415874 k0!1099))))

(assert (=> b!925144 (not (= lt!415870 k0!1099))))

(declare-fun lt!415881 () Unit!31202)

(declare-datatypes ((List!18700 0))(
  ( (Nil!18697) (Cons!18696 (h!19848 (_ BitVec 64)) (t!26607 List!18700)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55409 (_ BitVec 64) (_ BitVec 32) List!18700) Unit!31202)

(assert (=> b!925144 (= lt!415881 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18697))))

(declare-fun e!519216 () Bool)

(assert (=> b!925144 e!519216))

(declare-fun c!96675 () Bool)

(assert (=> b!925144 (= c!96675 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415875 () Unit!31202)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31223)

(declare-fun minValue!1173 () V!31223)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!219 (array!55409 array!55407 (_ BitVec 32) (_ BitVec 32) V!31223 V!31223 (_ BitVec 64) (_ BitVec 32) Int) Unit!31202)

(assert (=> b!925144 (= lt!415875 (lemmaListMapContainsThenArrayContainsFrom!219 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55409 (_ BitVec 32) List!18700) Bool)

(assert (=> b!925144 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18697)))

(declare-fun lt!415873 () Unit!31202)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55409 (_ BitVec 32) (_ BitVec 32)) Unit!31202)

(assert (=> b!925144 (= lt!415873 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4880 (ListLongMap!11585 (_ BitVec 64)) Bool)

(assert (=> b!925144 (contains!4880 lt!415882 k0!1099)))

(declare-fun lt!415878 () tuple2!12886)

(declare-fun +!2728 (ListLongMap!11585 tuple2!12886) ListLongMap!11585)

(assert (=> b!925144 (= lt!415882 (+!2728 lt!415877 lt!415878))))

(declare-fun lt!415869 () Unit!31202)

(declare-fun addStillContains!437 (ListLongMap!11585 (_ BitVec 64) V!31223 (_ BitVec 64)) Unit!31202)

(assert (=> b!925144 (= lt!415869 (addStillContains!437 lt!415877 lt!415870 lt!415874 k0!1099))))

(declare-fun getCurrentListMap!3058 (array!55409 array!55407 (_ BitVec 32) (_ BitVec 32) V!31223 V!31223 (_ BitVec 32) Int) ListLongMap!11585)

(assert (=> b!925144 (= (getCurrentListMap!3058 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2728 (getCurrentListMap!3058 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415878))))

(assert (=> b!925144 (= lt!415878 (tuple2!12887 lt!415870 lt!415874))))

(declare-fun get!14025 (ValueCell!9365 V!31223) V!31223)

(declare-fun dynLambda!1525 (Int (_ BitVec 64)) V!31223)

(assert (=> b!925144 (= lt!415874 (get!14025 (select (arr!26644 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1525 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415879 () Unit!31202)

(declare-fun lemmaListMapRecursiveValidKeyArray!108 (array!55409 array!55407 (_ BitVec 32) (_ BitVec 32) V!31223 V!31223 (_ BitVec 32) Int) Unit!31202)

(assert (=> b!925144 (= lt!415879 (lemmaListMapRecursiveValidKeyArray!108 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!519215 () Unit!31202)

(assert (=> b!925144 (= e!519215 lt!415880)))

(declare-fun b!925145 () Bool)

(declare-fun e!519219 () Bool)

(declare-fun e!519221 () Bool)

(assert (=> b!925145 (= e!519219 e!519221)))

(declare-fun res!623378 () Bool)

(assert (=> b!925145 (=> (not res!623378) (not e!519221))))

(assert (=> b!925145 (= res!623378 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27105 _keys!1487)))))

(declare-fun lt!415876 () Unit!31202)

(declare-fun e!519225 () Unit!31202)

(assert (=> b!925145 (= lt!415876 e!519225)))

(declare-fun c!96674 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925145 (= c!96674 (validKeyInArray!0 k0!1099))))

(declare-fun b!925146 () Bool)

(assert (=> b!925146 (= e!519217 tp_is_empty!19693)))

(declare-fun res!623374 () Bool)

(assert (=> start!79140 (=> (not res!623374) (not e!519226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79140 (= res!623374 (validMask!0 mask!1881))))

(assert (=> start!79140 e!519226))

(assert (=> start!79140 true))

(assert (=> start!79140 tp_is_empty!19693))

(declare-fun array_inv!20852 (array!55407) Bool)

(assert (=> start!79140 (and (array_inv!20852 _values!1231) e!519218)))

(assert (=> start!79140 tp!59996))

(declare-fun array_inv!20853 (array!55409) Bool)

(assert (=> start!79140 (array_inv!20853 _keys!1487)))

(declare-fun b!925147 () Bool)

(declare-fun e!519224 () Bool)

(assert (=> b!925147 (= e!519221 e!519224)))

(declare-fun res!623372 () Bool)

(assert (=> b!925147 (=> (not res!623372) (not e!519224))))

(declare-fun lt!415883 () ListLongMap!11585)

(assert (=> b!925147 (= res!623372 (contains!4880 lt!415883 k0!1099))))

(assert (=> b!925147 (= lt!415883 (getCurrentListMap!3058 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925148 () Bool)

(declare-fun Unit!31204 () Unit!31202)

(assert (=> b!925148 (= e!519215 Unit!31204)))

(declare-fun b!925149 () Bool)

(assert (=> b!925149 (= e!519225 e!519215)))

(assert (=> b!925149 (= lt!415870 (select (arr!26645 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96673 () Bool)

(assert (=> b!925149 (= c!96673 (validKeyInArray!0 lt!415870))))

(declare-fun b!925150 () Bool)

(declare-fun res!623377 () Bool)

(assert (=> b!925150 (=> (not res!623377) (not e!519226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55409 (_ BitVec 32)) Bool)

(assert (=> b!925150 (= res!623377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!925151 () Bool)

(declare-fun arrayContainsKey!0 (array!55409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925151 (= e!519216 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!925152 () Bool)

(declare-fun e!519220 () Bool)

(assert (=> b!925152 (= e!519220 e!519219)))

(declare-fun res!623371 () Bool)

(assert (=> b!925152 (=> (not res!623371) (not e!519219))))

(declare-fun v!791 () V!31223)

(assert (=> b!925152 (= res!623371 (and (= lt!415871 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!925152 (= lt!415871 (apply!661 lt!415877 k0!1099))))

(declare-fun b!925153 () Bool)

(declare-fun Unit!31205 () Unit!31202)

(assert (=> b!925153 (= e!519225 Unit!31205)))

(declare-fun b!925154 () Bool)

(assert (=> b!925154 (= e!519226 e!519220)))

(declare-fun res!623379 () Bool)

(assert (=> b!925154 (=> (not res!623379) (not e!519220))))

(assert (=> b!925154 (= res!623379 (contains!4880 lt!415877 k0!1099))))

(assert (=> b!925154 (= lt!415877 (getCurrentListMap!3058 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!925155 () Bool)

(assert (=> b!925155 (= e!519224 false)))

(declare-fun lt!415872 () V!31223)

(assert (=> b!925155 (= lt!415872 (apply!661 lt!415883 k0!1099))))

(declare-fun b!925156 () Bool)

(assert (=> b!925156 (= e!519216 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925157 () Bool)

(declare-fun res!623376 () Bool)

(assert (=> b!925157 (=> (not res!623376) (not e!519226))))

(assert (=> b!925157 (= res!623376 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18697))))

(declare-fun mapIsEmpty!31296 () Bool)

(assert (=> mapIsEmpty!31296 mapRes!31296))

(assert (= (and start!79140 res!623374) b!925143))

(assert (= (and b!925143 res!623375) b!925150))

(assert (= (and b!925150 res!623377) b!925157))

(assert (= (and b!925157 res!623376) b!925141))

(assert (= (and b!925141 res!623373) b!925154))

(assert (= (and b!925154 res!623379) b!925152))

(assert (= (and b!925152 res!623371) b!925145))

(assert (= (and b!925145 c!96674) b!925149))

(assert (= (and b!925145 (not c!96674)) b!925153))

(assert (= (and b!925149 c!96673) b!925144))

(assert (= (and b!925149 (not c!96673)) b!925148))

(assert (= (and b!925144 c!96675) b!925151))

(assert (= (and b!925144 (not c!96675)) b!925156))

(assert (= (and b!925145 res!623378) b!925147))

(assert (= (and b!925147 res!623372) b!925155))

(assert (= (and b!925140 condMapEmpty!31296) mapIsEmpty!31296))

(assert (= (and b!925140 (not condMapEmpty!31296)) mapNonEmpty!31296))

(get-info :version)

(assert (= (and mapNonEmpty!31296 ((_ is ValueCellFull!9365) mapValue!31296)) b!925142))

(assert (= (and b!925140 ((_ is ValueCellFull!9365) mapDefault!31296)) b!925146))

(assert (= start!79140 b!925140))

(declare-fun b_lambda!13701 () Bool)

(assert (=> (not b_lambda!13701) (not b!925144)))

(declare-fun t!26605 () Bool)

(declare-fun tb!5757 () Bool)

(assert (=> (and start!79140 (= defaultEntry!1235 defaultEntry!1235) t!26605) tb!5757))

(declare-fun result!11345 () Bool)

(assert (=> tb!5757 (= result!11345 tp_is_empty!19693)))

(assert (=> b!925144 t!26605))

(declare-fun b_and!28119 () Bool)

(assert (= b_and!28117 (and (=> t!26605 result!11345) b_and!28119)))

(declare-fun m!859819 () Bool)

(assert (=> b!925154 m!859819))

(declare-fun m!859821 () Bool)

(assert (=> b!925154 m!859821))

(declare-fun m!859823 () Bool)

(assert (=> b!925144 m!859823))

(declare-fun m!859825 () Bool)

(assert (=> b!925144 m!859825))

(declare-fun m!859827 () Bool)

(assert (=> b!925144 m!859827))

(declare-fun m!859829 () Bool)

(assert (=> b!925144 m!859829))

(declare-fun m!859831 () Bool)

(assert (=> b!925144 m!859831))

(assert (=> b!925144 m!859825))

(assert (=> b!925144 m!859827))

(declare-fun m!859833 () Bool)

(assert (=> b!925144 m!859833))

(declare-fun m!859835 () Bool)

(assert (=> b!925144 m!859835))

(declare-fun m!859837 () Bool)

(assert (=> b!925144 m!859837))

(declare-fun m!859839 () Bool)

(assert (=> b!925144 m!859839))

(declare-fun m!859841 () Bool)

(assert (=> b!925144 m!859841))

(declare-fun m!859843 () Bool)

(assert (=> b!925144 m!859843))

(declare-fun m!859845 () Bool)

(assert (=> b!925144 m!859845))

(declare-fun m!859847 () Bool)

(assert (=> b!925144 m!859847))

(declare-fun m!859849 () Bool)

(assert (=> b!925144 m!859849))

(declare-fun m!859851 () Bool)

(assert (=> b!925144 m!859851))

(assert (=> b!925144 m!859849))

(declare-fun m!859853 () Bool)

(assert (=> b!925144 m!859853))

(declare-fun m!859855 () Bool)

(assert (=> b!925157 m!859855))

(declare-fun m!859857 () Bool)

(assert (=> b!925145 m!859857))

(declare-fun m!859859 () Bool)

(assert (=> b!925150 m!859859))

(declare-fun m!859861 () Bool)

(assert (=> b!925147 m!859861))

(assert (=> b!925147 m!859835))

(declare-fun m!859863 () Bool)

(assert (=> mapNonEmpty!31296 m!859863))

(declare-fun m!859865 () Bool)

(assert (=> b!925151 m!859865))

(declare-fun m!859867 () Bool)

(assert (=> b!925152 m!859867))

(declare-fun m!859869 () Bool)

(assert (=> start!79140 m!859869))

(declare-fun m!859871 () Bool)

(assert (=> start!79140 m!859871))

(declare-fun m!859873 () Bool)

(assert (=> start!79140 m!859873))

(declare-fun m!859875 () Bool)

(assert (=> b!925149 m!859875))

(declare-fun m!859877 () Bool)

(assert (=> b!925149 m!859877))

(declare-fun m!859879 () Bool)

(assert (=> b!925155 m!859879))

(check-sat (not b!925147) (not b!925150) (not b_lambda!13701) (not b!925144) (not b!925155) (not b!925157) (not b!925154) b_and!28119 (not b!925149) (not start!79140) tp_is_empty!19693 (not b_next!17185) (not b!925145) (not b!925152) (not b!925151) (not mapNonEmpty!31296))
(check-sat b_and!28119 (not b_next!17185))
