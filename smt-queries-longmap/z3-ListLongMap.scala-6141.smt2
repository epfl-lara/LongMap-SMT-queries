; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79122 () Bool)

(assert start!79122)

(declare-fun b_free!17167 () Bool)

(declare-fun b_next!17167 () Bool)

(assert (=> start!79122 (= b_free!17167 (not b_next!17167))))

(declare-fun tp!59943 () Bool)

(declare-fun b_and!28081 () Bool)

(assert (=> start!79122 (= tp!59943 b_and!28081)))

(declare-fun b!924636 () Bool)

(declare-datatypes ((Unit!31173 0))(
  ( (Unit!31174) )
))
(declare-fun e!518891 () Unit!31173)

(declare-fun Unit!31175 () Unit!31173)

(assert (=> b!924636 (= e!518891 Unit!31175)))

(declare-fun b!924637 () Bool)

(declare-fun res!623136 () Bool)

(declare-fun e!518894 () Bool)

(assert (=> b!924637 (=> (not res!623136) (not e!518894))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55373 0))(
  ( (array!55374 (arr!26627 (Array (_ BitVec 32) (_ BitVec 64))) (size!27087 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55373)

(assert (=> b!924637 (= res!623136 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27087 _keys!1487))))))

(declare-fun b!924638 () Bool)

(declare-fun e!518898 () Bool)

(declare-fun tp_is_empty!19675 () Bool)

(assert (=> b!924638 (= e!518898 tp_is_empty!19675)))

(declare-fun b!924639 () Bool)

(declare-fun res!623133 () Bool)

(assert (=> b!924639 (=> (not res!623133) (not e!518894))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55373 (_ BitVec 32)) Bool)

(assert (=> b!924639 (= res!623133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!924640 () Bool)

(declare-fun e!518902 () Bool)

(declare-fun mapRes!31269 () Bool)

(assert (=> b!924640 (= e!518902 (and e!518898 mapRes!31269))))

(declare-fun condMapEmpty!31269 () Bool)

(declare-datatypes ((V!31199 0))(
  ( (V!31200 (val!9888 Int)) )
))
(declare-datatypes ((ValueCell!9356 0))(
  ( (ValueCellFull!9356 (v!12403 V!31199)) (EmptyCell!9356) )
))
(declare-datatypes ((array!55375 0))(
  ( (array!55376 (arr!26628 (Array (_ BitVec 32) ValueCell!9356)) (size!27088 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55375)

(declare-fun mapDefault!31269 () ValueCell!9356)

(assert (=> b!924640 (= condMapEmpty!31269 (= (arr!26628 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9356)) mapDefault!31269)))))

(declare-fun b!924641 () Bool)

(declare-fun e!518892 () Bool)

(declare-fun e!518897 () Bool)

(assert (=> b!924641 (= e!518892 e!518897)))

(declare-fun res!623134 () Bool)

(assert (=> b!924641 (=> (not res!623134) (not e!518897))))

(assert (=> b!924641 (= res!623134 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27087 _keys!1487)))))

(declare-fun lt!415466 () Unit!31173)

(declare-fun e!518900 () Unit!31173)

(assert (=> b!924641 (= lt!415466 e!518900)))

(declare-fun c!96594 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924641 (= c!96594 (validKeyInArray!0 k0!1099))))

(declare-fun mapNonEmpty!31269 () Bool)

(declare-fun tp!59942 () Bool)

(declare-fun e!518893 () Bool)

(assert (=> mapNonEmpty!31269 (= mapRes!31269 (and tp!59942 e!518893))))

(declare-fun mapKey!31269 () (_ BitVec 32))

(declare-fun mapValue!31269 () ValueCell!9356)

(declare-fun mapRest!31269 () (Array (_ BitVec 32) ValueCell!9356))

(assert (=> mapNonEmpty!31269 (= (arr!26628 _values!1231) (store mapRest!31269 mapKey!31269 mapValue!31269))))

(declare-fun b!924642 () Bool)

(declare-fun e!518896 () Bool)

(assert (=> b!924642 (= e!518897 e!518896)))

(declare-fun res!623128 () Bool)

(assert (=> b!924642 (=> (not res!623128) (not e!518896))))

(declare-datatypes ((tuple2!12872 0))(
  ( (tuple2!12873 (_1!6447 (_ BitVec 64)) (_2!6447 V!31199)) )
))
(declare-datatypes ((List!18686 0))(
  ( (Nil!18683) (Cons!18682 (h!19834 tuple2!12872) (t!26575 List!18686)) )
))
(declare-datatypes ((ListLongMap!11571 0))(
  ( (ListLongMap!11572 (toList!5801 List!18686)) )
))
(declare-fun lt!415470 () ListLongMap!11571)

(declare-fun contains!4873 (ListLongMap!11571 (_ BitVec 64)) Bool)

(assert (=> b!924642 (= res!623128 (contains!4873 lt!415470 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31199)

(declare-fun minValue!1173 () V!31199)

(declare-fun getCurrentListMap!3051 (array!55373 array!55375 (_ BitVec 32) (_ BitVec 32) V!31199 V!31199 (_ BitVec 32) Int) ListLongMap!11571)

(assert (=> b!924642 (= lt!415470 (getCurrentListMap!3051 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!924643 () Bool)

(assert (=> b!924643 (= e!518893 tp_is_empty!19675)))

(declare-fun b!924644 () Bool)

(declare-fun lt!415469 () ListLongMap!11571)

(declare-fun lt!415472 () V!31199)

(declare-fun apply!654 (ListLongMap!11571 (_ BitVec 64)) V!31199)

(assert (=> b!924644 (= (apply!654 lt!415469 k0!1099) lt!415472)))

(declare-fun lt!415465 () V!31199)

(declare-fun lt!415475 () ListLongMap!11571)

(declare-fun lt!415468 () (_ BitVec 64))

(declare-fun lt!415471 () Unit!31173)

(declare-fun addApplyDifferent!359 (ListLongMap!11571 (_ BitVec 64) V!31199 (_ BitVec 64)) Unit!31173)

(assert (=> b!924644 (= lt!415471 (addApplyDifferent!359 lt!415475 lt!415468 lt!415465 k0!1099))))

(assert (=> b!924644 (not (= lt!415468 k0!1099))))

(declare-fun lt!415478 () Unit!31173)

(declare-datatypes ((List!18687 0))(
  ( (Nil!18684) (Cons!18683 (h!19835 (_ BitVec 64)) (t!26576 List!18687)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55373 (_ BitVec 64) (_ BitVec 32) List!18687) Unit!31173)

(assert (=> b!924644 (= lt!415478 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18684))))

(declare-fun e!518901 () Bool)

(assert (=> b!924644 e!518901))

(declare-fun c!96592 () Bool)

(assert (=> b!924644 (= c!96592 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415467 () Unit!31173)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!214 (array!55373 array!55375 (_ BitVec 32) (_ BitVec 32) V!31199 V!31199 (_ BitVec 64) (_ BitVec 32) Int) Unit!31173)

(assert (=> b!924644 (= lt!415467 (lemmaListMapContainsThenArrayContainsFrom!214 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55373 (_ BitVec 32) List!18687) Bool)

(assert (=> b!924644 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18684)))

(declare-fun lt!415477 () Unit!31173)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55373 (_ BitVec 32) (_ BitVec 32)) Unit!31173)

(assert (=> b!924644 (= lt!415477 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!924644 (contains!4873 lt!415469 k0!1099)))

(declare-fun lt!415473 () tuple2!12872)

(declare-fun +!2723 (ListLongMap!11571 tuple2!12872) ListLongMap!11571)

(assert (=> b!924644 (= lt!415469 (+!2723 lt!415475 lt!415473))))

(declare-fun lt!415474 () Unit!31173)

(declare-fun addStillContains!432 (ListLongMap!11571 (_ BitVec 64) V!31199 (_ BitVec 64)) Unit!31173)

(assert (=> b!924644 (= lt!415474 (addStillContains!432 lt!415475 lt!415468 lt!415465 k0!1099))))

(assert (=> b!924644 (= (getCurrentListMap!3051 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2723 (getCurrentListMap!3051 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415473))))

(assert (=> b!924644 (= lt!415473 (tuple2!12873 lt!415468 lt!415465))))

(declare-fun get!14014 (ValueCell!9356 V!31199) V!31199)

(declare-fun dynLambda!1520 (Int (_ BitVec 64)) V!31199)

(assert (=> b!924644 (= lt!415465 (get!14014 (select (arr!26628 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1520 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415464 () Unit!31173)

(declare-fun lemmaListMapRecursiveValidKeyArray!103 (array!55373 array!55375 (_ BitVec 32) (_ BitVec 32) V!31199 V!31199 (_ BitVec 32) Int) Unit!31173)

(assert (=> b!924644 (= lt!415464 (lemmaListMapRecursiveValidKeyArray!103 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!924644 (= e!518891 lt!415471)))

(declare-fun b!924645 () Bool)

(declare-fun e!518899 () Bool)

(assert (=> b!924645 (= e!518894 e!518899)))

(declare-fun res!623132 () Bool)

(assert (=> b!924645 (=> (not res!623132) (not e!518899))))

(assert (=> b!924645 (= res!623132 (contains!4873 lt!415475 k0!1099))))

(assert (=> b!924645 (= lt!415475 (getCurrentListMap!3051 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!924647 () Bool)

(assert (=> b!924647 (= e!518896 false)))

(declare-fun lt!415476 () V!31199)

(assert (=> b!924647 (= lt!415476 (apply!654 lt!415470 k0!1099))))

(declare-fun b!924648 () Bool)

(assert (=> b!924648 (= e!518901 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!31269 () Bool)

(assert (=> mapIsEmpty!31269 mapRes!31269))

(declare-fun b!924649 () Bool)

(declare-fun Unit!31176 () Unit!31173)

(assert (=> b!924649 (= e!518900 Unit!31176)))

(declare-fun b!924650 () Bool)

(assert (=> b!924650 (= e!518899 e!518892)))

(declare-fun res!623129 () Bool)

(assert (=> b!924650 (=> (not res!623129) (not e!518892))))

(declare-fun v!791 () V!31199)

(assert (=> b!924650 (= res!623129 (and (= lt!415472 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!924650 (= lt!415472 (apply!654 lt!415475 k0!1099))))

(declare-fun b!924651 () Bool)

(declare-fun res!623130 () Bool)

(assert (=> b!924651 (=> (not res!623130) (not e!518894))))

(assert (=> b!924651 (= res!623130 (and (= (size!27088 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27087 _keys!1487) (size!27088 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!924652 () Bool)

(assert (=> b!924652 (= e!518900 e!518891)))

(assert (=> b!924652 (= lt!415468 (select (arr!26627 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96593 () Bool)

(assert (=> b!924652 (= c!96593 (validKeyInArray!0 lt!415468))))

(declare-fun b!924653 () Bool)

(declare-fun arrayContainsKey!0 (array!55373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924653 (= e!518901 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!924646 () Bool)

(declare-fun res!623135 () Bool)

(assert (=> b!924646 (=> (not res!623135) (not e!518894))))

(assert (=> b!924646 (= res!623135 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18684))))

(declare-fun res!623131 () Bool)

(assert (=> start!79122 (=> (not res!623131) (not e!518894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79122 (= res!623131 (validMask!0 mask!1881))))

(assert (=> start!79122 e!518894))

(assert (=> start!79122 true))

(assert (=> start!79122 tp_is_empty!19675))

(declare-fun array_inv!20840 (array!55375) Bool)

(assert (=> start!79122 (and (array_inv!20840 _values!1231) e!518902)))

(assert (=> start!79122 tp!59943))

(declare-fun array_inv!20841 (array!55373) Bool)

(assert (=> start!79122 (array_inv!20841 _keys!1487)))

(assert (= (and start!79122 res!623131) b!924651))

(assert (= (and b!924651 res!623130) b!924639))

(assert (= (and b!924639 res!623133) b!924646))

(assert (= (and b!924646 res!623135) b!924637))

(assert (= (and b!924637 res!623136) b!924645))

(assert (= (and b!924645 res!623132) b!924650))

(assert (= (and b!924650 res!623129) b!924641))

(assert (= (and b!924641 c!96594) b!924652))

(assert (= (and b!924641 (not c!96594)) b!924649))

(assert (= (and b!924652 c!96593) b!924644))

(assert (= (and b!924652 (not c!96593)) b!924636))

(assert (= (and b!924644 c!96592) b!924653))

(assert (= (and b!924644 (not c!96592)) b!924648))

(assert (= (and b!924641 res!623134) b!924642))

(assert (= (and b!924642 res!623128) b!924647))

(assert (= (and b!924640 condMapEmpty!31269) mapIsEmpty!31269))

(assert (= (and b!924640 (not condMapEmpty!31269)) mapNonEmpty!31269))

(get-info :version)

(assert (= (and mapNonEmpty!31269 ((_ is ValueCellFull!9356) mapValue!31269)) b!924643))

(assert (= (and b!924640 ((_ is ValueCellFull!9356) mapDefault!31269)) b!924638))

(assert (= start!79122 b!924640))

(declare-fun b_lambda!13683 () Bool)

(assert (=> (not b_lambda!13683) (not b!924644)))

(declare-fun t!26574 () Bool)

(declare-fun tb!5739 () Bool)

(assert (=> (and start!79122 (= defaultEntry!1235 defaultEntry!1235) t!26574) tb!5739))

(declare-fun result!11309 () Bool)

(assert (=> tb!5739 (= result!11309 tp_is_empty!19675)))

(assert (=> b!924644 t!26574))

(declare-fun b_and!28083 () Bool)

(assert (= b_and!28081 (and (=> t!26574 result!11309) b_and!28083)))

(declare-fun m!859261 () Bool)

(assert (=> b!924650 m!859261))

(declare-fun m!859263 () Bool)

(assert (=> b!924644 m!859263))

(declare-fun m!859265 () Bool)

(assert (=> b!924644 m!859265))

(declare-fun m!859267 () Bool)

(assert (=> b!924644 m!859267))

(declare-fun m!859269 () Bool)

(assert (=> b!924644 m!859269))

(declare-fun m!859271 () Bool)

(assert (=> b!924644 m!859271))

(declare-fun m!859273 () Bool)

(assert (=> b!924644 m!859273))

(declare-fun m!859275 () Bool)

(assert (=> b!924644 m!859275))

(declare-fun m!859277 () Bool)

(assert (=> b!924644 m!859277))

(assert (=> b!924644 m!859271))

(assert (=> b!924644 m!859273))

(declare-fun m!859279 () Bool)

(assert (=> b!924644 m!859279))

(declare-fun m!859281 () Bool)

(assert (=> b!924644 m!859281))

(declare-fun m!859283 () Bool)

(assert (=> b!924644 m!859283))

(declare-fun m!859285 () Bool)

(assert (=> b!924644 m!859285))

(declare-fun m!859287 () Bool)

(assert (=> b!924644 m!859287))

(declare-fun m!859289 () Bool)

(assert (=> b!924644 m!859289))

(assert (=> b!924644 m!859263))

(declare-fun m!859291 () Bool)

(assert (=> b!924644 m!859291))

(declare-fun m!859293 () Bool)

(assert (=> b!924644 m!859293))

(declare-fun m!859295 () Bool)

(assert (=> b!924652 m!859295))

(declare-fun m!859297 () Bool)

(assert (=> b!924652 m!859297))

(declare-fun m!859299 () Bool)

(assert (=> b!924642 m!859299))

(assert (=> b!924642 m!859289))

(declare-fun m!859301 () Bool)

(assert (=> b!924645 m!859301))

(declare-fun m!859303 () Bool)

(assert (=> b!924645 m!859303))

(declare-fun m!859305 () Bool)

(assert (=> start!79122 m!859305))

(declare-fun m!859307 () Bool)

(assert (=> start!79122 m!859307))

(declare-fun m!859309 () Bool)

(assert (=> start!79122 m!859309))

(declare-fun m!859311 () Bool)

(assert (=> b!924646 m!859311))

(declare-fun m!859313 () Bool)

(assert (=> b!924653 m!859313))

(declare-fun m!859315 () Bool)

(assert (=> b!924641 m!859315))

(declare-fun m!859317 () Bool)

(assert (=> b!924639 m!859317))

(declare-fun m!859319 () Bool)

(assert (=> b!924647 m!859319))

(declare-fun m!859321 () Bool)

(assert (=> mapNonEmpty!31269 m!859321))

(check-sat (not b!924644) (not b!924641) (not b_lambda!13683) (not b!924646) (not mapNonEmpty!31269) (not b!924642) (not b!924645) (not b!924653) tp_is_empty!19675 (not b!924647) (not b!924652) b_and!28083 (not start!79122) (not b!924650) (not b!924639) (not b_next!17167))
(check-sat b_and!28083 (not b_next!17167))
