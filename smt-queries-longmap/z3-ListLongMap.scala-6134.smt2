; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78894 () Bool)

(assert start!78894)

(declare-fun b_free!17125 () Bool)

(declare-fun b_next!17125 () Bool)

(assert (=> start!78894 (= b_free!17125 (not b_next!17125))))

(declare-fun tp!59817 () Bool)

(declare-fun b_and!27961 () Bool)

(assert (=> start!78894 (= tp!59817 b_and!27961)))

(declare-fun b!922420 () Bool)

(declare-fun e!517542 () Bool)

(declare-fun e!517547 () Bool)

(declare-fun mapRes!31206 () Bool)

(assert (=> b!922420 (= e!517542 (and e!517547 mapRes!31206))))

(declare-fun condMapEmpty!31206 () Bool)

(declare-datatypes ((V!31143 0))(
  ( (V!31144 (val!9867 Int)) )
))
(declare-datatypes ((ValueCell!9335 0))(
  ( (ValueCellFull!9335 (v!12384 V!31143)) (EmptyCell!9335) )
))
(declare-datatypes ((array!55217 0))(
  ( (array!55218 (arr!26554 (Array (_ BitVec 32) ValueCell!9335)) (size!27015 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55217)

(declare-fun mapDefault!31206 () ValueCell!9335)

(assert (=> b!922420 (= condMapEmpty!31206 (= (arr!26554 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9335)) mapDefault!31206)))))

(declare-fun b!922421 () Bool)

(declare-fun res!622077 () Bool)

(declare-fun e!517545 () Bool)

(assert (=> b!922421 (=> (not res!622077) (not e!517545))))

(declare-datatypes ((array!55219 0))(
  ( (array!55220 (arr!26555 (Array (_ BitVec 32) (_ BitVec 64))) (size!27016 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55219)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!922421 (= res!622077 (and (= (size!27015 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27016 _keys!1487) (size!27015 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922422 () Bool)

(declare-fun res!622080 () Bool)

(assert (=> b!922422 (=> (not res!622080) (not e!517545))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!922422 (= res!622080 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27016 _keys!1487))))))

(declare-fun mapIsEmpty!31206 () Bool)

(assert (=> mapIsEmpty!31206 mapRes!31206))

(declare-fun mapNonEmpty!31206 () Bool)

(declare-fun tp!59816 () Bool)

(declare-fun e!517548 () Bool)

(assert (=> mapNonEmpty!31206 (= mapRes!31206 (and tp!59816 e!517548))))

(declare-fun mapValue!31206 () ValueCell!9335)

(declare-fun mapKey!31206 () (_ BitVec 32))

(declare-fun mapRest!31206 () (Array (_ BitVec 32) ValueCell!9335))

(assert (=> mapNonEmpty!31206 (= (arr!26554 _values!1231) (store mapRest!31206 mapKey!31206 mapValue!31206))))

(declare-fun b!922423 () Bool)

(declare-fun e!517544 () Bool)

(assert (=> b!922423 (= e!517545 e!517544)))

(declare-fun res!622082 () Bool)

(assert (=> b!922423 (=> (not res!622082) (not e!517544))))

(declare-datatypes ((tuple2!12902 0))(
  ( (tuple2!12903 (_1!6462 (_ BitVec 64)) (_2!6462 V!31143)) )
))
(declare-datatypes ((List!18685 0))(
  ( (Nil!18682) (Cons!18681 (h!19827 tuple2!12902) (t!26531 List!18685)) )
))
(declare-datatypes ((ListLongMap!11589 0))(
  ( (ListLongMap!11590 (toList!5810 List!18685)) )
))
(declare-fun lt!414130 () ListLongMap!11589)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4825 (ListLongMap!11589 (_ BitVec 64)) Bool)

(assert (=> b!922423 (= res!622082 (contains!4825 lt!414130 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31143)

(declare-fun minValue!1173 () V!31143)

(declare-fun getCurrentListMap!2999 (array!55219 array!55217 (_ BitVec 32) (_ BitVec 32) V!31143 V!31143 (_ BitVec 32) Int) ListLongMap!11589)

(assert (=> b!922423 (= lt!414130 (getCurrentListMap!2999 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!922424 () Bool)

(declare-fun res!622078 () Bool)

(assert (=> b!922424 (=> (not res!622078) (not e!517544))))

(declare-fun v!791 () V!31143)

(declare-fun apply!625 (ListLongMap!11589 (_ BitVec 64)) V!31143)

(assert (=> b!922424 (= res!622078 (= (apply!625 lt!414130 k0!1099) v!791))))

(declare-fun b!922425 () Bool)

(declare-fun res!622074 () Bool)

(assert (=> b!922425 (=> (not res!622074) (not e!517545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55219 (_ BitVec 32)) Bool)

(assert (=> b!922425 (= res!622074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!922426 () Bool)

(declare-fun tp_is_empty!19633 () Bool)

(assert (=> b!922426 (= e!517548 tp_is_empty!19633)))

(declare-fun e!517546 () Bool)

(declare-fun b!922427 () Bool)

(declare-fun arrayContainsKey!0 (array!55219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922427 (= e!517546 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun res!622076 () Bool)

(assert (=> start!78894 (=> (not res!622076) (not e!517545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78894 (= res!622076 (validMask!0 mask!1881))))

(assert (=> start!78894 e!517545))

(assert (=> start!78894 true))

(assert (=> start!78894 tp_is_empty!19633))

(declare-fun array_inv!20770 (array!55217) Bool)

(assert (=> start!78894 (and (array_inv!20770 _values!1231) e!517542)))

(assert (=> start!78894 tp!59817))

(declare-fun array_inv!20771 (array!55219) Bool)

(assert (=> start!78894 (array_inv!20771 _keys!1487)))

(declare-fun b!922428 () Bool)

(declare-fun e!517541 () Bool)

(assert (=> b!922428 (= e!517544 e!517541)))

(declare-fun res!622073 () Bool)

(assert (=> b!922428 (=> (not res!622073) (not e!517541))))

(declare-fun lt!414129 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922428 (= res!622073 (validKeyInArray!0 lt!414129))))

(assert (=> b!922428 (= lt!414129 (select (arr!26555 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922429 () Bool)

(assert (=> b!922429 (= e!517541 (not true))))

(assert (=> b!922429 (not (= lt!414129 k0!1099))))

(declare-datatypes ((Unit!31046 0))(
  ( (Unit!31047) )
))
(declare-fun lt!414132 () Unit!31046)

(declare-datatypes ((List!18686 0))(
  ( (Nil!18683) (Cons!18682 (h!19828 (_ BitVec 64)) (t!26532 List!18686)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55219 (_ BitVec 64) (_ BitVec 32) List!18686) Unit!31046)

(assert (=> b!922429 (= lt!414132 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18683))))

(assert (=> b!922429 e!517546))

(declare-fun c!96124 () Bool)

(assert (=> b!922429 (= c!96124 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414127 () Unit!31046)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!205 (array!55219 array!55217 (_ BitVec 32) (_ BitVec 32) V!31143 V!31143 (_ BitVec 64) (_ BitVec 32) Int) Unit!31046)

(assert (=> b!922429 (= lt!414127 (lemmaListMapContainsThenArrayContainsFrom!205 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55219 (_ BitVec 32) List!18686) Bool)

(assert (=> b!922429 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18683)))

(declare-fun lt!414134 () Unit!31046)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55219 (_ BitVec 32) (_ BitVec 32)) Unit!31046)

(assert (=> b!922429 (= lt!414134 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!414128 () tuple2!12902)

(declare-fun +!2717 (ListLongMap!11589 tuple2!12902) ListLongMap!11589)

(assert (=> b!922429 (contains!4825 (+!2717 lt!414130 lt!414128) k0!1099)))

(declare-fun lt!414131 () Unit!31046)

(declare-fun lt!414133 () V!31143)

(declare-fun addStillContains!414 (ListLongMap!11589 (_ BitVec 64) V!31143 (_ BitVec 64)) Unit!31046)

(assert (=> b!922429 (= lt!414131 (addStillContains!414 lt!414130 lt!414129 lt!414133 k0!1099))))

(assert (=> b!922429 (= (getCurrentListMap!2999 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2717 (getCurrentListMap!2999 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414128))))

(assert (=> b!922429 (= lt!414128 (tuple2!12903 lt!414129 lt!414133))))

(declare-fun get!13954 (ValueCell!9335 V!31143) V!31143)

(declare-fun dynLambda!1473 (Int (_ BitVec 64)) V!31143)

(assert (=> b!922429 (= lt!414133 (get!13954 (select (arr!26554 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1473 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414126 () Unit!31046)

(declare-fun lemmaListMapRecursiveValidKeyArray!81 (array!55219 array!55217 (_ BitVec 32) (_ BitVec 32) V!31143 V!31143 (_ BitVec 32) Int) Unit!31046)

(assert (=> b!922429 (= lt!414126 (lemmaListMapRecursiveValidKeyArray!81 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922430 () Bool)

(declare-fun res!622075 () Bool)

(assert (=> b!922430 (=> (not res!622075) (not e!517544))))

(assert (=> b!922430 (= res!622075 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!922431 () Bool)

(declare-fun res!622081 () Bool)

(assert (=> b!922431 (=> (not res!622081) (not e!517545))))

(assert (=> b!922431 (= res!622081 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18683))))

(declare-fun b!922432 () Bool)

(declare-fun res!622079 () Bool)

(assert (=> b!922432 (=> (not res!622079) (not e!517544))))

(assert (=> b!922432 (= res!622079 (validKeyInArray!0 k0!1099))))

(declare-fun b!922433 () Bool)

(assert (=> b!922433 (= e!517547 tp_is_empty!19633)))

(declare-fun b!922434 () Bool)

(assert (=> b!922434 (= e!517546 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!78894 res!622076) b!922421))

(assert (= (and b!922421 res!622077) b!922425))

(assert (= (and b!922425 res!622074) b!922431))

(assert (= (and b!922431 res!622081) b!922422))

(assert (= (and b!922422 res!622080) b!922423))

(assert (= (and b!922423 res!622082) b!922424))

(assert (= (and b!922424 res!622078) b!922430))

(assert (= (and b!922430 res!622075) b!922432))

(assert (= (and b!922432 res!622079) b!922428))

(assert (= (and b!922428 res!622073) b!922429))

(assert (= (and b!922429 c!96124) b!922427))

(assert (= (and b!922429 (not c!96124)) b!922434))

(assert (= (and b!922420 condMapEmpty!31206) mapIsEmpty!31206))

(assert (= (and b!922420 (not condMapEmpty!31206)) mapNonEmpty!31206))

(get-info :version)

(assert (= (and mapNonEmpty!31206 ((_ is ValueCellFull!9335) mapValue!31206)) b!922426))

(assert (= (and b!922420 ((_ is ValueCellFull!9335) mapDefault!31206)) b!922433))

(assert (= start!78894 b!922420))

(declare-fun b_lambda!13609 () Bool)

(assert (=> (not b_lambda!13609) (not b!922429)))

(declare-fun t!26530 () Bool)

(declare-fun tb!5697 () Bool)

(assert (=> (and start!78894 (= defaultEntry!1235 defaultEntry!1235) t!26530) tb!5697))

(declare-fun result!11225 () Bool)

(assert (=> tb!5697 (= result!11225 tp_is_empty!19633)))

(assert (=> b!922429 t!26530))

(declare-fun b_and!27963 () Bool)

(assert (= b_and!27961 (and (=> t!26530 result!11225) b_and!27963)))

(declare-fun m!856003 () Bool)

(assert (=> start!78894 m!856003))

(declare-fun m!856005 () Bool)

(assert (=> start!78894 m!856005))

(declare-fun m!856007 () Bool)

(assert (=> start!78894 m!856007))

(declare-fun m!856009 () Bool)

(assert (=> b!922432 m!856009))

(declare-fun m!856011 () Bool)

(assert (=> b!922428 m!856011))

(declare-fun m!856013 () Bool)

(assert (=> b!922428 m!856013))

(declare-fun m!856015 () Bool)

(assert (=> b!922427 m!856015))

(declare-fun m!856017 () Bool)

(assert (=> b!922423 m!856017))

(declare-fun m!856019 () Bool)

(assert (=> b!922423 m!856019))

(declare-fun m!856021 () Bool)

(assert (=> b!922424 m!856021))

(declare-fun m!856023 () Bool)

(assert (=> b!922429 m!856023))

(declare-fun m!856025 () Bool)

(assert (=> b!922429 m!856025))

(declare-fun m!856027 () Bool)

(assert (=> b!922429 m!856027))

(declare-fun m!856029 () Bool)

(assert (=> b!922429 m!856029))

(declare-fun m!856031 () Bool)

(assert (=> b!922429 m!856031))

(declare-fun m!856033 () Bool)

(assert (=> b!922429 m!856033))

(assert (=> b!922429 m!856025))

(assert (=> b!922429 m!856033))

(declare-fun m!856035 () Bool)

(assert (=> b!922429 m!856035))

(declare-fun m!856037 () Bool)

(assert (=> b!922429 m!856037))

(declare-fun m!856039 () Bool)

(assert (=> b!922429 m!856039))

(declare-fun m!856041 () Bool)

(assert (=> b!922429 m!856041))

(assert (=> b!922429 m!856027))

(declare-fun m!856043 () Bool)

(assert (=> b!922429 m!856043))

(declare-fun m!856045 () Bool)

(assert (=> b!922429 m!856045))

(declare-fun m!856047 () Bool)

(assert (=> b!922429 m!856047))

(assert (=> b!922429 m!856029))

(declare-fun m!856049 () Bool)

(assert (=> b!922429 m!856049))

(declare-fun m!856051 () Bool)

(assert (=> b!922425 m!856051))

(declare-fun m!856053 () Bool)

(assert (=> mapNonEmpty!31206 m!856053))

(declare-fun m!856055 () Bool)

(assert (=> b!922431 m!856055))

(check-sat (not b!922423) b_and!27963 (not b!922424) (not start!78894) (not b_next!17125) (not b!922431) (not b!922427) (not b!922428) tp_is_empty!19633 (not mapNonEmpty!31206) (not b!922432) (not b!922429) (not b!922425) (not b_lambda!13609))
(check-sat b_and!27963 (not b_next!17125))
