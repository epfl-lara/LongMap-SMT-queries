; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78834 () Bool)

(assert start!78834)

(declare-fun b_free!17065 () Bool)

(declare-fun b_next!17065 () Bool)

(assert (=> start!78834 (= b_free!17065 (not b_next!17065))))

(declare-fun tp!59636 () Bool)

(declare-fun b_and!27841 () Bool)

(assert (=> start!78834 (= tp!59636 b_and!27841)))

(declare-fun b!920908 () Bool)

(declare-fun e!516792 () Bool)

(assert (=> b!920908 (= e!516792 true)))

(declare-fun lt!413317 () Bool)

(declare-datatypes ((List!18633 0))(
  ( (Nil!18630) (Cons!18629 (h!19775 (_ BitVec 64)) (t!26419 List!18633)) )
))
(declare-fun contains!4793 (List!18633 (_ BitVec 64)) Bool)

(assert (=> b!920908 (= lt!413317 (contains!4793 Nil!18630 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920909 () Bool)

(declare-fun res!621078 () Bool)

(declare-fun e!516793 () Bool)

(assert (=> b!920909 (=> (not res!621078) (not e!516793))))

(declare-datatypes ((array!55099 0))(
  ( (array!55100 (arr!26495 (Array (_ BitVec 32) (_ BitVec 64))) (size!26956 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55099)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31063 0))(
  ( (V!31064 (val!9837 Int)) )
))
(declare-datatypes ((ValueCell!9305 0))(
  ( (ValueCellFull!9305 (v!12354 V!31063)) (EmptyCell!9305) )
))
(declare-datatypes ((array!55101 0))(
  ( (array!55102 (arr!26496 (Array (_ BitVec 32) ValueCell!9305)) (size!26957 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55101)

(assert (=> b!920909 (= res!621078 (and (= (size!26957 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26956 _keys!1487) (size!26957 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31116 () Bool)

(declare-fun mapRes!31116 () Bool)

(declare-fun tp!59637 () Bool)

(declare-fun e!516790 () Bool)

(assert (=> mapNonEmpty!31116 (= mapRes!31116 (and tp!59637 e!516790))))

(declare-fun mapValue!31116 () ValueCell!9305)

(declare-fun mapKey!31116 () (_ BitVec 32))

(declare-fun mapRest!31116 () (Array (_ BitVec 32) ValueCell!9305))

(assert (=> mapNonEmpty!31116 (= (arr!26496 _values!1231) (store mapRest!31116 mapKey!31116 mapValue!31116))))

(declare-fun b!920910 () Bool)

(declare-fun res!621080 () Bool)

(assert (=> b!920910 (=> (not res!621080) (not e!516793))))

(declare-fun arrayNoDuplicates!0 (array!55099 (_ BitVec 32) List!18633) Bool)

(assert (=> b!920910 (= res!621080 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18630))))

(declare-fun b!920911 () Bool)

(declare-fun e!516795 () Bool)

(assert (=> b!920911 (= e!516793 e!516795)))

(declare-fun res!621074 () Bool)

(assert (=> b!920911 (=> (not res!621074) (not e!516795))))

(declare-datatypes ((tuple2!12850 0))(
  ( (tuple2!12851 (_1!6436 (_ BitVec 64)) (_2!6436 V!31063)) )
))
(declare-datatypes ((List!18634 0))(
  ( (Nil!18631) (Cons!18630 (h!19776 tuple2!12850) (t!26420 List!18634)) )
))
(declare-datatypes ((ListLongMap!11537 0))(
  ( (ListLongMap!11538 (toList!5784 List!18634)) )
))
(declare-fun lt!413322 () ListLongMap!11537)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4794 (ListLongMap!11537 (_ BitVec 64)) Bool)

(assert (=> b!920911 (= res!621074 (contains!4794 lt!413322 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31063)

(declare-fun minValue!1173 () V!31063)

(declare-fun getCurrentListMap!2975 (array!55099 array!55101 (_ BitVec 32) (_ BitVec 32) V!31063 V!31063 (_ BitVec 32) Int) ListLongMap!11537)

(assert (=> b!920911 (= lt!413322 (getCurrentListMap!2975 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!920912 () Bool)

(declare-fun e!516787 () Bool)

(assert (=> b!920912 (= e!516787 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!920913 () Bool)

(declare-fun res!621079 () Bool)

(assert (=> b!920913 (=> (not res!621079) (not e!516795))))

(assert (=> b!920913 (= res!621079 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!920914 () Bool)

(declare-fun res!621072 () Bool)

(assert (=> b!920914 (=> (not res!621072) (not e!516795))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920914 (= res!621072 (validKeyInArray!0 k0!1099))))

(declare-fun b!920915 () Bool)

(declare-fun arrayContainsKey!0 (array!55099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!920915 (= e!516787 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun res!621076 () Bool)

(assert (=> start!78834 (=> (not res!621076) (not e!516793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78834 (= res!621076 (validMask!0 mask!1881))))

(assert (=> start!78834 e!516793))

(assert (=> start!78834 true))

(declare-fun tp_is_empty!19573 () Bool)

(assert (=> start!78834 tp_is_empty!19573))

(declare-fun e!516788 () Bool)

(declare-fun array_inv!20728 (array!55101) Bool)

(assert (=> start!78834 (and (array_inv!20728 _values!1231) e!516788)))

(assert (=> start!78834 tp!59636))

(declare-fun array_inv!20729 (array!55099) Bool)

(assert (=> start!78834 (array_inv!20729 _keys!1487)))

(declare-fun b!920916 () Bool)

(declare-fun res!621075 () Bool)

(assert (=> b!920916 (=> (not res!621075) (not e!516793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55099 (_ BitVec 32)) Bool)

(assert (=> b!920916 (= res!621075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31116 () Bool)

(assert (=> mapIsEmpty!31116 mapRes!31116))

(declare-fun b!920917 () Bool)

(assert (=> b!920917 (= e!516790 tp_is_empty!19573)))

(declare-fun b!920918 () Bool)

(declare-fun res!621083 () Bool)

(assert (=> b!920918 (=> (not res!621083) (not e!516793))))

(assert (=> b!920918 (= res!621083 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26956 _keys!1487))))))

(declare-fun b!920919 () Bool)

(declare-fun res!621077 () Bool)

(assert (=> b!920919 (=> res!621077 e!516792)))

(declare-fun noDuplicate!1348 (List!18633) Bool)

(assert (=> b!920919 (= res!621077 (not (noDuplicate!1348 Nil!18630)))))

(declare-fun b!920920 () Bool)

(declare-fun e!516789 () Bool)

(assert (=> b!920920 (= e!516788 (and e!516789 mapRes!31116))))

(declare-fun condMapEmpty!31116 () Bool)

(declare-fun mapDefault!31116 () ValueCell!9305)

(assert (=> b!920920 (= condMapEmpty!31116 (= (arr!26496 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9305)) mapDefault!31116)))))

(declare-fun b!920921 () Bool)

(declare-fun e!516791 () Bool)

(assert (=> b!920921 (= e!516791 (not e!516792))))

(declare-fun res!621081 () Bool)

(assert (=> b!920921 (=> res!621081 e!516792)))

(assert (=> b!920921 (= res!621081 (or (bvsge (size!26956 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26956 _keys!1487))))))

(assert (=> b!920921 e!516787))

(declare-fun c!96034 () Bool)

(assert (=> b!920921 (= c!96034 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31004 0))(
  ( (Unit!31005) )
))
(declare-fun lt!413320 () Unit!31004)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!184 (array!55099 array!55101 (_ BitVec 32) (_ BitVec 32) V!31063 V!31063 (_ BitVec 64) (_ BitVec 32) Int) Unit!31004)

(assert (=> b!920921 (= lt!413320 (lemmaListMapContainsThenArrayContainsFrom!184 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!920921 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18630)))

(declare-fun lt!413324 () Unit!31004)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55099 (_ BitVec 32) (_ BitVec 32)) Unit!31004)

(assert (=> b!920921 (= lt!413324 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413321 () tuple2!12850)

(declare-fun +!2696 (ListLongMap!11537 tuple2!12850) ListLongMap!11537)

(assert (=> b!920921 (contains!4794 (+!2696 lt!413322 lt!413321) k0!1099)))

(declare-fun lt!413323 () Unit!31004)

(declare-fun lt!413318 () V!31063)

(declare-fun lt!413319 () (_ BitVec 64))

(declare-fun addStillContains!393 (ListLongMap!11537 (_ BitVec 64) V!31063 (_ BitVec 64)) Unit!31004)

(assert (=> b!920921 (= lt!413323 (addStillContains!393 lt!413322 lt!413319 lt!413318 k0!1099))))

(assert (=> b!920921 (= (getCurrentListMap!2975 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2696 (getCurrentListMap!2975 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413321))))

(assert (=> b!920921 (= lt!413321 (tuple2!12851 lt!413319 lt!413318))))

(declare-fun get!13913 (ValueCell!9305 V!31063) V!31063)

(declare-fun dynLambda!1452 (Int (_ BitVec 64)) V!31063)

(assert (=> b!920921 (= lt!413318 (get!13913 (select (arr!26496 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1452 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413316 () Unit!31004)

(declare-fun lemmaListMapRecursiveValidKeyArray!60 (array!55099 array!55101 (_ BitVec 32) (_ BitVec 32) V!31063 V!31063 (_ BitVec 32) Int) Unit!31004)

(assert (=> b!920921 (= lt!413316 (lemmaListMapRecursiveValidKeyArray!60 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920922 () Bool)

(declare-fun res!621073 () Bool)

(assert (=> b!920922 (=> (not res!621073) (not e!516795))))

(declare-fun v!791 () V!31063)

(declare-fun apply!604 (ListLongMap!11537 (_ BitVec 64)) V!31063)

(assert (=> b!920922 (= res!621073 (= (apply!604 lt!413322 k0!1099) v!791))))

(declare-fun b!920923 () Bool)

(assert (=> b!920923 (= e!516795 e!516791)))

(declare-fun res!621082 () Bool)

(assert (=> b!920923 (=> (not res!621082) (not e!516791))))

(assert (=> b!920923 (= res!621082 (validKeyInArray!0 lt!413319))))

(assert (=> b!920923 (= lt!413319 (select (arr!26495 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920924 () Bool)

(assert (=> b!920924 (= e!516789 tp_is_empty!19573)))

(declare-fun b!920925 () Bool)

(declare-fun res!621071 () Bool)

(assert (=> b!920925 (=> res!621071 e!516792)))

(assert (=> b!920925 (= res!621071 (contains!4793 Nil!18630 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!78834 res!621076) b!920909))

(assert (= (and b!920909 res!621078) b!920916))

(assert (= (and b!920916 res!621075) b!920910))

(assert (= (and b!920910 res!621080) b!920918))

(assert (= (and b!920918 res!621083) b!920911))

(assert (= (and b!920911 res!621074) b!920922))

(assert (= (and b!920922 res!621073) b!920913))

(assert (= (and b!920913 res!621079) b!920914))

(assert (= (and b!920914 res!621072) b!920923))

(assert (= (and b!920923 res!621082) b!920921))

(assert (= (and b!920921 c!96034) b!920915))

(assert (= (and b!920921 (not c!96034)) b!920912))

(assert (= (and b!920921 (not res!621081)) b!920919))

(assert (= (and b!920919 (not res!621077)) b!920925))

(assert (= (and b!920925 (not res!621071)) b!920908))

(assert (= (and b!920920 condMapEmpty!31116) mapIsEmpty!31116))

(assert (= (and b!920920 (not condMapEmpty!31116)) mapNonEmpty!31116))

(get-info :version)

(assert (= (and mapNonEmpty!31116 ((_ is ValueCellFull!9305) mapValue!31116)) b!920917))

(assert (= (and b!920920 ((_ is ValueCellFull!9305) mapDefault!31116)) b!920924))

(assert (= start!78834 b!920920))

(declare-fun b_lambda!13549 () Bool)

(assert (=> (not b_lambda!13549) (not b!920921)))

(declare-fun t!26418 () Bool)

(declare-fun tb!5637 () Bool)

(assert (=> (and start!78834 (= defaultEntry!1235 defaultEntry!1235) t!26418) tb!5637))

(declare-fun result!11105 () Bool)

(assert (=> tb!5637 (= result!11105 tp_is_empty!19573)))

(assert (=> b!920921 t!26418))

(declare-fun b_and!27843 () Bool)

(assert (= b_and!27841 (and (=> t!26418 result!11105) b_and!27843)))

(declare-fun m!854335 () Bool)

(assert (=> b!920910 m!854335))

(declare-fun m!854337 () Bool)

(assert (=> b!920911 m!854337))

(declare-fun m!854339 () Bool)

(assert (=> b!920911 m!854339))

(declare-fun m!854341 () Bool)

(assert (=> b!920908 m!854341))

(declare-fun m!854343 () Bool)

(assert (=> b!920914 m!854343))

(declare-fun m!854345 () Bool)

(assert (=> b!920921 m!854345))

(declare-fun m!854347 () Bool)

(assert (=> b!920921 m!854347))

(declare-fun m!854349 () Bool)

(assert (=> b!920921 m!854349))

(declare-fun m!854351 () Bool)

(assert (=> b!920921 m!854351))

(declare-fun m!854353 () Bool)

(assert (=> b!920921 m!854353))

(declare-fun m!854355 () Bool)

(assert (=> b!920921 m!854355))

(declare-fun m!854357 () Bool)

(assert (=> b!920921 m!854357))

(assert (=> b!920921 m!854349))

(assert (=> b!920921 m!854353))

(declare-fun m!854359 () Bool)

(assert (=> b!920921 m!854359))

(declare-fun m!854361 () Bool)

(assert (=> b!920921 m!854361))

(assert (=> b!920921 m!854345))

(declare-fun m!854363 () Bool)

(assert (=> b!920921 m!854363))

(declare-fun m!854365 () Bool)

(assert (=> b!920921 m!854365))

(declare-fun m!854367 () Bool)

(assert (=> b!920921 m!854367))

(assert (=> b!920921 m!854355))

(declare-fun m!854369 () Bool)

(assert (=> b!920921 m!854369))

(declare-fun m!854371 () Bool)

(assert (=> start!78834 m!854371))

(declare-fun m!854373 () Bool)

(assert (=> start!78834 m!854373))

(declare-fun m!854375 () Bool)

(assert (=> start!78834 m!854375))

(declare-fun m!854377 () Bool)

(assert (=> b!920923 m!854377))

(declare-fun m!854379 () Bool)

(assert (=> b!920923 m!854379))

(declare-fun m!854381 () Bool)

(assert (=> b!920919 m!854381))

(declare-fun m!854383 () Bool)

(assert (=> b!920922 m!854383))

(declare-fun m!854385 () Bool)

(assert (=> b!920915 m!854385))

(declare-fun m!854387 () Bool)

(assert (=> b!920916 m!854387))

(declare-fun m!854389 () Bool)

(assert (=> b!920925 m!854389))

(declare-fun m!854391 () Bool)

(assert (=> mapNonEmpty!31116 m!854391))

(check-sat (not b!920908) b_and!27843 (not b!920919) (not start!78834) (not b!920911) (not mapNonEmpty!31116) (not b!920923) (not b!920915) tp_is_empty!19573 (not b!920914) (not b!920916) (not b!920925) (not b_lambda!13549) (not b!920922) (not b!920921) (not b_next!17065) (not b!920910))
(check-sat b_and!27843 (not b_next!17065))
