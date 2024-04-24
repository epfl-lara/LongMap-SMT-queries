; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79056 () Bool)

(assert start!79056)

(declare-fun b_free!17101 () Bool)

(declare-fun b_next!17101 () Bool)

(assert (=> start!79056 (= b_free!17101 (not b_next!17101))))

(declare-fun tp!59744 () Bool)

(declare-fun b_and!27949 () Bool)

(assert (=> start!79056 (= tp!59744 b_and!27949)))

(declare-fun mapIsEmpty!31170 () Bool)

(declare-fun mapRes!31170 () Bool)

(assert (=> mapIsEmpty!31170 mapRes!31170))

(declare-fun mapNonEmpty!31170 () Bool)

(declare-fun tp!59745 () Bool)

(declare-fun e!517987 () Bool)

(assert (=> mapNonEmpty!31170 (= mapRes!31170 (and tp!59745 e!517987))))

(declare-datatypes ((V!31111 0))(
  ( (V!31112 (val!9855 Int)) )
))
(declare-datatypes ((ValueCell!9323 0))(
  ( (ValueCellFull!9323 (v!12370 V!31111)) (EmptyCell!9323) )
))
(declare-fun mapRest!31170 () (Array (_ BitVec 32) ValueCell!9323))

(declare-fun mapValue!31170 () ValueCell!9323)

(declare-fun mapKey!31170 () (_ BitVec 32))

(declare-datatypes ((array!55243 0))(
  ( (array!55244 (arr!26562 (Array (_ BitVec 32) ValueCell!9323)) (size!27022 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55243)

(assert (=> mapNonEmpty!31170 (= (arr!26562 _values!1231) (store mapRest!31170 mapKey!31170 mapValue!31170))))

(declare-fun b!922998 () Bool)

(declare-fun e!517986 () Bool)

(declare-fun tp_is_empty!19609 () Bool)

(assert (=> b!922998 (= e!517986 tp_is_empty!19609)))

(declare-fun b!922999 () Bool)

(declare-fun e!517988 () Bool)

(assert (=> b!922999 (= e!517988 (and e!517986 mapRes!31170))))

(declare-fun condMapEmpty!31170 () Bool)

(declare-fun mapDefault!31170 () ValueCell!9323)

(assert (=> b!922999 (= condMapEmpty!31170 (= (arr!26562 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9323)) mapDefault!31170)))))

(declare-fun b!923000 () Bool)

(declare-fun res!622172 () Bool)

(declare-fun e!517983 () Bool)

(assert (=> b!923000 (=> (not res!622172) (not e!517983))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923000 (= res!622172 (validKeyInArray!0 k0!1099))))

(declare-fun b!923001 () Bool)

(declare-fun res!622168 () Bool)

(declare-fun e!517985 () Bool)

(assert (=> b!923001 (=> (not res!622168) (not e!517985))))

(declare-datatypes ((array!55245 0))(
  ( (array!55246 (arr!26563 (Array (_ BitVec 32) (_ BitVec 64))) (size!27023 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55245)

(declare-datatypes ((List!18626 0))(
  ( (Nil!18623) (Cons!18622 (h!19774 (_ BitVec 64)) (t!26449 List!18626)) )
))
(declare-fun arrayNoDuplicates!0 (array!55245 (_ BitVec 32) List!18626) Bool)

(assert (=> b!923001 (= res!622168 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18623))))

(declare-fun b!923002 () Bool)

(declare-fun res!622176 () Bool)

(assert (=> b!923002 (=> (not res!622176) (not e!517983))))

(declare-fun v!791 () V!31111)

(declare-datatypes ((tuple2!12808 0))(
  ( (tuple2!12809 (_1!6415 (_ BitVec 64)) (_2!6415 V!31111)) )
))
(declare-datatypes ((List!18627 0))(
  ( (Nil!18624) (Cons!18623 (h!19775 tuple2!12808) (t!26450 List!18627)) )
))
(declare-datatypes ((ListLongMap!11507 0))(
  ( (ListLongMap!11508 (toList!5769 List!18627)) )
))
(declare-fun lt!414401 () ListLongMap!11507)

(declare-fun apply!628 (ListLongMap!11507 (_ BitVec 64)) V!31111)

(assert (=> b!923002 (= res!622176 (= (apply!628 lt!414401 k0!1099) v!791))))

(declare-fun b!923003 () Bool)

(declare-fun res!622171 () Bool)

(assert (=> b!923003 (=> (not res!622171) (not e!517983))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!923003 (= res!622171 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!923004 () Bool)

(declare-fun res!622169 () Bool)

(assert (=> b!923004 (=> (not res!622169) (not e!517985))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!923004 (= res!622169 (and (= (size!27022 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27023 _keys!1487) (size!27022 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!923005 () Bool)

(declare-fun res!622174 () Bool)

(assert (=> b!923005 (=> (not res!622174) (not e!517985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55245 (_ BitVec 32)) Bool)

(assert (=> b!923005 (= res!622174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun e!517984 () Bool)

(declare-fun b!923006 () Bool)

(declare-fun arrayContainsKey!0 (array!55245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923006 (= e!517984 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!923007 () Bool)

(declare-fun e!517990 () Bool)

(assert (=> b!923007 (= e!517983 e!517990)))

(declare-fun res!622170 () Bool)

(assert (=> b!923007 (=> (not res!622170) (not e!517990))))

(declare-fun lt!414402 () (_ BitVec 64))

(assert (=> b!923007 (= res!622170 (validKeyInArray!0 lt!414402))))

(assert (=> b!923007 (= lt!414402 (select (arr!26563 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!923008 () Bool)

(assert (=> b!923008 (= e!517987 tp_is_empty!19609)))

(declare-fun res!622175 () Bool)

(assert (=> start!79056 (=> (not res!622175) (not e!517985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79056 (= res!622175 (validMask!0 mask!1881))))

(assert (=> start!79056 e!517985))

(assert (=> start!79056 true))

(assert (=> start!79056 tp_is_empty!19609))

(declare-fun array_inv!20790 (array!55243) Bool)

(assert (=> start!79056 (and (array_inv!20790 _values!1231) e!517988)))

(assert (=> start!79056 tp!59744))

(declare-fun array_inv!20791 (array!55245) Bool)

(assert (=> start!79056 (array_inv!20791 _keys!1487)))

(declare-fun b!923009 () Bool)

(assert (=> b!923009 (= e!517984 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923010 () Bool)

(declare-fun res!622167 () Bool)

(assert (=> b!923010 (=> (not res!622167) (not e!517985))))

(assert (=> b!923010 (= res!622167 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27023 _keys!1487))))))

(declare-fun b!923011 () Bool)

(assert (=> b!923011 (= e!517990 (not true))))

(assert (=> b!923011 (not (= lt!414402 k0!1099))))

(declare-datatypes ((Unit!31106 0))(
  ( (Unit!31107) )
))
(declare-fun lt!414399 () Unit!31106)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55245 (_ BitVec 64) (_ BitVec 32) List!18626) Unit!31106)

(assert (=> b!923011 (= lt!414399 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18623))))

(assert (=> b!923011 e!517984))

(declare-fun c!96435 () Bool)

(assert (=> b!923011 (= c!96435 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414405 () Unit!31106)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31111)

(declare-fun minValue!1173 () V!31111)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!188 (array!55245 array!55243 (_ BitVec 32) (_ BitVec 32) V!31111 V!31111 (_ BitVec 64) (_ BitVec 32) Int) Unit!31106)

(assert (=> b!923011 (= lt!414405 (lemmaListMapContainsThenArrayContainsFrom!188 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!923011 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18623)))

(declare-fun lt!414403 () Unit!31106)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55245 (_ BitVec 32) (_ BitVec 32)) Unit!31106)

(assert (=> b!923011 (= lt!414403 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!414400 () tuple2!12808)

(declare-fun contains!4843 (ListLongMap!11507 (_ BitVec 64)) Bool)

(declare-fun +!2697 (ListLongMap!11507 tuple2!12808) ListLongMap!11507)

(assert (=> b!923011 (contains!4843 (+!2697 lt!414401 lt!414400) k0!1099)))

(declare-fun lt!414407 () V!31111)

(declare-fun lt!414404 () Unit!31106)

(declare-fun addStillContains!406 (ListLongMap!11507 (_ BitVec 64) V!31111 (_ BitVec 64)) Unit!31106)

(assert (=> b!923011 (= lt!414404 (addStillContains!406 lt!414401 lt!414402 lt!414407 k0!1099))))

(declare-fun getCurrentListMap!3021 (array!55245 array!55243 (_ BitVec 32) (_ BitVec 32) V!31111 V!31111 (_ BitVec 32) Int) ListLongMap!11507)

(assert (=> b!923011 (= (getCurrentListMap!3021 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2697 (getCurrentListMap!3021 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414400))))

(assert (=> b!923011 (= lt!414400 (tuple2!12809 lt!414402 lt!414407))))

(declare-fun get!13966 (ValueCell!9323 V!31111) V!31111)

(declare-fun dynLambda!1494 (Int (_ BitVec 64)) V!31111)

(assert (=> b!923011 (= lt!414407 (get!13966 (select (arr!26562 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1494 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414406 () Unit!31106)

(declare-fun lemmaListMapRecursiveValidKeyArray!77 (array!55245 array!55243 (_ BitVec 32) (_ BitVec 32) V!31111 V!31111 (_ BitVec 32) Int) Unit!31106)

(assert (=> b!923011 (= lt!414406 (lemmaListMapRecursiveValidKeyArray!77 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923012 () Bool)

(assert (=> b!923012 (= e!517985 e!517983)))

(declare-fun res!622173 () Bool)

(assert (=> b!923012 (=> (not res!622173) (not e!517983))))

(assert (=> b!923012 (= res!622173 (contains!4843 lt!414401 k0!1099))))

(assert (=> b!923012 (= lt!414401 (getCurrentListMap!3021 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!79056 res!622175) b!923004))

(assert (= (and b!923004 res!622169) b!923005))

(assert (= (and b!923005 res!622174) b!923001))

(assert (= (and b!923001 res!622168) b!923010))

(assert (= (and b!923010 res!622167) b!923012))

(assert (= (and b!923012 res!622173) b!923002))

(assert (= (and b!923002 res!622176) b!923003))

(assert (= (and b!923003 res!622171) b!923000))

(assert (= (and b!923000 res!622172) b!923007))

(assert (= (and b!923007 res!622170) b!923011))

(assert (= (and b!923011 c!96435) b!923006))

(assert (= (and b!923011 (not c!96435)) b!923009))

(assert (= (and b!922999 condMapEmpty!31170) mapIsEmpty!31170))

(assert (= (and b!922999 (not condMapEmpty!31170)) mapNonEmpty!31170))

(get-info :version)

(assert (= (and mapNonEmpty!31170 ((_ is ValueCellFull!9323) mapValue!31170)) b!923008))

(assert (= (and b!922999 ((_ is ValueCellFull!9323) mapDefault!31170)) b!922998))

(assert (= start!79056 b!922999))

(declare-fun b_lambda!13617 () Bool)

(assert (=> (not b_lambda!13617) (not b!923011)))

(declare-fun t!26448 () Bool)

(declare-fun tb!5673 () Bool)

(assert (=> (and start!79056 (= defaultEntry!1235 defaultEntry!1235) t!26448) tb!5673))

(declare-fun result!11177 () Bool)

(assert (=> tb!5673 (= result!11177 tp_is_empty!19609)))

(assert (=> b!923011 t!26448))

(declare-fun b_and!27951 () Bool)

(assert (= b_and!27949 (and (=> t!26448 result!11177) b_and!27951)))

(declare-fun m!857407 () Bool)

(assert (=> start!79056 m!857407))

(declare-fun m!857409 () Bool)

(assert (=> start!79056 m!857409))

(declare-fun m!857411 () Bool)

(assert (=> start!79056 m!857411))

(declare-fun m!857413 () Bool)

(assert (=> b!923005 m!857413))

(declare-fun m!857415 () Bool)

(assert (=> b!923001 m!857415))

(declare-fun m!857417 () Bool)

(assert (=> b!923012 m!857417))

(declare-fun m!857419 () Bool)

(assert (=> b!923012 m!857419))

(declare-fun m!857421 () Bool)

(assert (=> b!923007 m!857421))

(declare-fun m!857423 () Bool)

(assert (=> b!923007 m!857423))

(declare-fun m!857425 () Bool)

(assert (=> b!923006 m!857425))

(declare-fun m!857427 () Bool)

(assert (=> mapNonEmpty!31170 m!857427))

(declare-fun m!857429 () Bool)

(assert (=> b!923000 m!857429))

(declare-fun m!857431 () Bool)

(assert (=> b!923011 m!857431))

(declare-fun m!857433 () Bool)

(assert (=> b!923011 m!857433))

(declare-fun m!857435 () Bool)

(assert (=> b!923011 m!857435))

(declare-fun m!857437 () Bool)

(assert (=> b!923011 m!857437))

(declare-fun m!857439 () Bool)

(assert (=> b!923011 m!857439))

(declare-fun m!857441 () Bool)

(assert (=> b!923011 m!857441))

(declare-fun m!857443 () Bool)

(assert (=> b!923011 m!857443))

(assert (=> b!923011 m!857437))

(assert (=> b!923011 m!857439))

(declare-fun m!857445 () Bool)

(assert (=> b!923011 m!857445))

(declare-fun m!857447 () Bool)

(assert (=> b!923011 m!857447))

(declare-fun m!857449 () Bool)

(assert (=> b!923011 m!857449))

(declare-fun m!857451 () Bool)

(assert (=> b!923011 m!857451))

(declare-fun m!857453 () Bool)

(assert (=> b!923011 m!857453))

(declare-fun m!857455 () Bool)

(assert (=> b!923011 m!857455))

(assert (=> b!923011 m!857431))

(assert (=> b!923011 m!857441))

(declare-fun m!857457 () Bool)

(assert (=> b!923011 m!857457))

(declare-fun m!857459 () Bool)

(assert (=> b!923002 m!857459))

(check-sat (not start!79056) (not b_lambda!13617) (not b!923012) (not b!923000) (not b!923006) (not mapNonEmpty!31170) (not b!923007) tp_is_empty!19609 (not b!923002) (not b!923001) b_and!27951 (not b!923011) (not b_next!17101) (not b!923005))
(check-sat b_and!27951 (not b_next!17101))
