; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79664 () Bool)

(assert start!79664)

(declare-fun b_free!17731 () Bool)

(declare-fun b_next!17731 () Bool)

(assert (=> start!79664 (= b_free!17731 (not b_next!17731))))

(declare-fun tp!61650 () Bool)

(declare-fun b_and!29027 () Bool)

(assert (=> start!79664 (= tp!61650 b_and!29027)))

(declare-fun b!936999 () Bool)

(declare-datatypes ((Unit!31537 0))(
  ( (Unit!31538) )
))
(declare-fun e!526144 () Unit!31537)

(declare-fun Unit!31539 () Unit!31537)

(assert (=> b!936999 (= e!526144 Unit!31539)))

(declare-fun b!937000 () Bool)

(declare-fun e!526146 () Bool)

(declare-fun e!526139 () Bool)

(assert (=> b!937000 (= e!526146 e!526139)))

(declare-fun res!630760 () Bool)

(assert (=> b!937000 (=> (not res!630760) (not e!526139))))

(declare-datatypes ((V!31951 0))(
  ( (V!31952 (val!10170 Int)) )
))
(declare-datatypes ((tuple2!13414 0))(
  ( (tuple2!13415 (_1!6718 (_ BitVec 64)) (_2!6718 V!31951)) )
))
(declare-datatypes ((List!19159 0))(
  ( (Nil!19156) (Cons!19155 (h!20301 tuple2!13414) (t!27425 List!19159)) )
))
(declare-datatypes ((ListLongMap!12101 0))(
  ( (ListLongMap!12102 (toList!6066 List!19159)) )
))
(declare-fun lt!422616 () ListLongMap!12101)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5068 (ListLongMap!12101 (_ BitVec 64)) Bool)

(assert (=> b!937000 (= res!630760 (contains!5068 lt!422616 k0!1099))))

(declare-datatypes ((array!56385 0))(
  ( (array!56386 (arr!27133 (Array (_ BitVec 32) (_ BitVec 64))) (size!27594 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56385)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9638 0))(
  ( (ValueCellFull!9638 (v!12694 V!31951)) (EmptyCell!9638) )
))
(declare-datatypes ((array!56387 0))(
  ( (array!56388 (arr!27134 (Array (_ BitVec 32) ValueCell!9638)) (size!27595 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56387)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31951)

(declare-fun minValue!1173 () V!31951)

(declare-fun getCurrentListMap!3230 (array!56385 array!56387 (_ BitVec 32) (_ BitVec 32) V!31951 V!31951 (_ BitVec 32) Int) ListLongMap!12101)

(assert (=> b!937000 (= lt!422616 (getCurrentListMap!3230 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!937001 () Bool)

(declare-fun e!526141 () Bool)

(assert (=> b!937001 (= e!526141 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!937002 () Bool)

(declare-fun e!526147 () Unit!31537)

(declare-fun Unit!31540 () Unit!31537)

(assert (=> b!937002 (= e!526147 Unit!31540)))

(declare-fun b!937003 () Bool)

(declare-fun e!526140 () Bool)

(declare-fun e!526142 () Bool)

(declare-fun mapRes!32130 () Bool)

(assert (=> b!937003 (= e!526140 (and e!526142 mapRes!32130))))

(declare-fun condMapEmpty!32130 () Bool)

(declare-fun mapDefault!32130 () ValueCell!9638)

(assert (=> b!937003 (= condMapEmpty!32130 (= (arr!27134 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9638)) mapDefault!32130)))))

(declare-fun b!937004 () Bool)

(declare-fun res!630761 () Bool)

(assert (=> b!937004 (=> (not res!630761) (not e!526146))))

(assert (=> b!937004 (= res!630761 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27594 _keys!1487))))))

(declare-fun b!937005 () Bool)

(declare-fun e!526143 () Bool)

(assert (=> b!937005 (= e!526143 false)))

(declare-fun lt!422621 () Unit!31537)

(assert (=> b!937005 (= lt!422621 e!526147)))

(declare-fun c!97475 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937005 (= c!97475 (validKeyInArray!0 k0!1099))))

(declare-fun b!937006 () Bool)

(assert (=> b!937006 (= e!526139 e!526143)))

(declare-fun res!630763 () Bool)

(assert (=> b!937006 (=> (not res!630763) (not e!526143))))

(declare-fun v!791 () V!31951)

(declare-fun lt!422615 () V!31951)

(assert (=> b!937006 (= res!630763 (and (= lt!422615 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun apply!841 (ListLongMap!12101 (_ BitVec 64)) V!31951)

(assert (=> b!937006 (= lt!422615 (apply!841 lt!422616 k0!1099))))

(declare-fun b!937007 () Bool)

(declare-fun arrayContainsKey!0 (array!56385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937007 (= e!526141 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!937008 () Bool)

(declare-fun res!630762 () Bool)

(assert (=> b!937008 (=> (not res!630762) (not e!526146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56385 (_ BitVec 32)) Bool)

(assert (=> b!937008 (= res!630762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!630764 () Bool)

(assert (=> start!79664 (=> (not res!630764) (not e!526146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79664 (= res!630764 (validMask!0 mask!1881))))

(assert (=> start!79664 e!526146))

(assert (=> start!79664 true))

(declare-fun tp_is_empty!20239 () Bool)

(assert (=> start!79664 tp_is_empty!20239))

(declare-fun array_inv!21168 (array!56387) Bool)

(assert (=> start!79664 (and (array_inv!21168 _values!1231) e!526140)))

(assert (=> start!79664 tp!61650))

(declare-fun array_inv!21169 (array!56385) Bool)

(assert (=> start!79664 (array_inv!21169 _keys!1487)))

(declare-fun mapNonEmpty!32130 () Bool)

(declare-fun tp!61649 () Bool)

(declare-fun e!526145 () Bool)

(assert (=> mapNonEmpty!32130 (= mapRes!32130 (and tp!61649 e!526145))))

(declare-fun mapRest!32130 () (Array (_ BitVec 32) ValueCell!9638))

(declare-fun mapKey!32130 () (_ BitVec 32))

(declare-fun mapValue!32130 () ValueCell!9638)

(assert (=> mapNonEmpty!32130 (= (arr!27134 _values!1231) (store mapRest!32130 mapKey!32130 mapValue!32130))))

(declare-fun b!937009 () Bool)

(declare-fun lt!422613 () ListLongMap!12101)

(assert (=> b!937009 (= (apply!841 lt!422613 k0!1099) lt!422615)))

(declare-fun lt!422622 () V!31951)

(declare-fun lt!422612 () Unit!31537)

(declare-fun lt!422610 () (_ BitVec 64))

(declare-fun addApplyDifferent!426 (ListLongMap!12101 (_ BitVec 64) V!31951 (_ BitVec 64)) Unit!31537)

(assert (=> b!937009 (= lt!422612 (addApplyDifferent!426 lt!422616 lt!422610 lt!422622 k0!1099))))

(assert (=> b!937009 (not (= lt!422610 k0!1099))))

(declare-fun lt!422619 () Unit!31537)

(declare-datatypes ((List!19160 0))(
  ( (Nil!19157) (Cons!19156 (h!20302 (_ BitVec 64)) (t!27426 List!19160)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56385 (_ BitVec 64) (_ BitVec 32) List!19160) Unit!31537)

(assert (=> b!937009 (= lt!422619 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19157))))

(assert (=> b!937009 e!526141))

(declare-fun c!97476 () Bool)

(assert (=> b!937009 (= c!97476 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422614 () Unit!31537)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!304 (array!56385 array!56387 (_ BitVec 32) (_ BitVec 32) V!31951 V!31951 (_ BitVec 64) (_ BitVec 32) Int) Unit!31537)

(assert (=> b!937009 (= lt!422614 (lemmaListMapContainsThenArrayContainsFrom!304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56385 (_ BitVec 32) List!19160) Bool)

(assert (=> b!937009 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19157)))

(declare-fun lt!422620 () Unit!31537)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56385 (_ BitVec 32) (_ BitVec 32)) Unit!31537)

(assert (=> b!937009 (= lt!422620 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!937009 (contains!5068 lt!422613 k0!1099)))

(declare-fun lt!422611 () tuple2!13414)

(declare-fun +!2857 (ListLongMap!12101 tuple2!13414) ListLongMap!12101)

(assert (=> b!937009 (= lt!422613 (+!2857 lt!422616 lt!422611))))

(declare-fun lt!422618 () Unit!31537)

(declare-fun addStillContains!546 (ListLongMap!12101 (_ BitVec 64) V!31951 (_ BitVec 64)) Unit!31537)

(assert (=> b!937009 (= lt!422618 (addStillContains!546 lt!422616 lt!422610 lt!422622 k0!1099))))

(assert (=> b!937009 (= (getCurrentListMap!3230 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2857 (getCurrentListMap!3230 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422611))))

(assert (=> b!937009 (= lt!422611 (tuple2!13415 lt!422610 lt!422622))))

(declare-fun get!14311 (ValueCell!9638 V!31951) V!31951)

(declare-fun dynLambda!1613 (Int (_ BitVec 64)) V!31951)

(assert (=> b!937009 (= lt!422622 (get!14311 (select (arr!27134 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1613 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422617 () Unit!31537)

(declare-fun lemmaListMapRecursiveValidKeyArray!221 (array!56385 array!56387 (_ BitVec 32) (_ BitVec 32) V!31951 V!31951 (_ BitVec 32) Int) Unit!31537)

(assert (=> b!937009 (= lt!422617 (lemmaListMapRecursiveValidKeyArray!221 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!937009 (= e!526144 lt!422612)))

(declare-fun b!937010 () Bool)

(declare-fun res!630758 () Bool)

(assert (=> b!937010 (=> (not res!630758) (not e!526146))))

(assert (=> b!937010 (= res!630758 (and (= (size!27595 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27594 _keys!1487) (size!27595 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!937011 () Bool)

(assert (=> b!937011 (= e!526147 e!526144)))

(assert (=> b!937011 (= lt!422610 (select (arr!27133 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97477 () Bool)

(assert (=> b!937011 (= c!97477 (validKeyInArray!0 lt!422610))))

(declare-fun b!937012 () Bool)

(declare-fun res!630759 () Bool)

(assert (=> b!937012 (=> (not res!630759) (not e!526146))))

(assert (=> b!937012 (= res!630759 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19157))))

(declare-fun b!937013 () Bool)

(assert (=> b!937013 (= e!526142 tp_is_empty!20239)))

(declare-fun b!937014 () Bool)

(assert (=> b!937014 (= e!526145 tp_is_empty!20239)))

(declare-fun mapIsEmpty!32130 () Bool)

(assert (=> mapIsEmpty!32130 mapRes!32130))

(assert (= (and start!79664 res!630764) b!937010))

(assert (= (and b!937010 res!630758) b!937008))

(assert (= (and b!937008 res!630762) b!937012))

(assert (= (and b!937012 res!630759) b!937004))

(assert (= (and b!937004 res!630761) b!937000))

(assert (= (and b!937000 res!630760) b!937006))

(assert (= (and b!937006 res!630763) b!937005))

(assert (= (and b!937005 c!97475) b!937011))

(assert (= (and b!937005 (not c!97475)) b!937002))

(assert (= (and b!937011 c!97477) b!937009))

(assert (= (and b!937011 (not c!97477)) b!936999))

(assert (= (and b!937009 c!97476) b!937007))

(assert (= (and b!937009 (not c!97476)) b!937001))

(assert (= (and b!937003 condMapEmpty!32130) mapIsEmpty!32130))

(assert (= (and b!937003 (not condMapEmpty!32130)) mapNonEmpty!32130))

(get-info :version)

(assert (= (and mapNonEmpty!32130 ((_ is ValueCellFull!9638) mapValue!32130)) b!937014))

(assert (= (and b!937003 ((_ is ValueCellFull!9638) mapDefault!32130)) b!937013))

(assert (= start!79664 b!937003))

(declare-fun b_lambda!14119 () Bool)

(assert (=> (not b_lambda!14119) (not b!937009)))

(declare-fun t!27424 () Bool)

(declare-fun tb!6117 () Bool)

(assert (=> (and start!79664 (= defaultEntry!1235 defaultEntry!1235) t!27424) tb!6117))

(declare-fun result!12075 () Bool)

(assert (=> tb!6117 (= result!12075 tp_is_empty!20239)))

(assert (=> b!937009 t!27424))

(declare-fun b_and!29029 () Bool)

(assert (= b_and!29027 (and (=> t!27424 result!12075) b_and!29029)))

(declare-fun m!871211 () Bool)

(assert (=> b!937012 m!871211))

(declare-fun m!871213 () Bool)

(assert (=> b!937000 m!871213))

(declare-fun m!871215 () Bool)

(assert (=> b!937000 m!871215))

(declare-fun m!871217 () Bool)

(assert (=> start!79664 m!871217))

(declare-fun m!871219 () Bool)

(assert (=> start!79664 m!871219))

(declare-fun m!871221 () Bool)

(assert (=> start!79664 m!871221))

(declare-fun m!871223 () Bool)

(assert (=> b!937011 m!871223))

(declare-fun m!871225 () Bool)

(assert (=> b!937011 m!871225))

(declare-fun m!871227 () Bool)

(assert (=> b!937008 m!871227))

(declare-fun m!871229 () Bool)

(assert (=> mapNonEmpty!32130 m!871229))

(declare-fun m!871231 () Bool)

(assert (=> b!937009 m!871231))

(declare-fun m!871233 () Bool)

(assert (=> b!937009 m!871233))

(declare-fun m!871235 () Bool)

(assert (=> b!937009 m!871235))

(declare-fun m!871237 () Bool)

(assert (=> b!937009 m!871237))

(declare-fun m!871239 () Bool)

(assert (=> b!937009 m!871239))

(declare-fun m!871241 () Bool)

(assert (=> b!937009 m!871241))

(assert (=> b!937009 m!871233))

(assert (=> b!937009 m!871235))

(declare-fun m!871243 () Bool)

(assert (=> b!937009 m!871243))

(declare-fun m!871245 () Bool)

(assert (=> b!937009 m!871245))

(declare-fun m!871247 () Bool)

(assert (=> b!937009 m!871247))

(declare-fun m!871249 () Bool)

(assert (=> b!937009 m!871249))

(declare-fun m!871251 () Bool)

(assert (=> b!937009 m!871251))

(declare-fun m!871253 () Bool)

(assert (=> b!937009 m!871253))

(declare-fun m!871255 () Bool)

(assert (=> b!937009 m!871255))

(assert (=> b!937009 m!871237))

(declare-fun m!871257 () Bool)

(assert (=> b!937009 m!871257))

(declare-fun m!871259 () Bool)

(assert (=> b!937009 m!871259))

(declare-fun m!871261 () Bool)

(assert (=> b!937009 m!871261))

(declare-fun m!871263 () Bool)

(assert (=> b!937005 m!871263))

(declare-fun m!871265 () Bool)

(assert (=> b!937006 m!871265))

(declare-fun m!871267 () Bool)

(assert (=> b!937007 m!871267))

(check-sat (not b!937005) b_and!29029 (not b!937008) (not mapNonEmpty!32130) (not b!937012) (not b_next!17731) (not b!937000) (not b!937007) (not b!937011) (not start!79664) (not b_lambda!14119) (not b!937009) tp_is_empty!20239 (not b!937006))
(check-sat b_and!29029 (not b_next!17731))
