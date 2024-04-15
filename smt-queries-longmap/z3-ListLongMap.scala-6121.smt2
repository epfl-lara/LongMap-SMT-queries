; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78816 () Bool)

(assert start!78816)

(declare-fun b_free!17047 () Bool)

(declare-fun b_next!17047 () Bool)

(assert (=> start!78816 (= b_free!17047 (not b_next!17047))))

(declare-fun tp!59582 () Bool)

(declare-fun b_and!27805 () Bool)

(assert (=> start!78816 (= tp!59582 b_and!27805)))

(declare-fun b!920404 () Bool)

(declare-fun res!620727 () Bool)

(declare-fun e!516551 () Bool)

(assert (=> b!920404 (=> (not res!620727) (not e!516551))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920404 (= res!620727 (validKeyInArray!0 k0!1099))))

(declare-fun b!920405 () Bool)

(declare-fun res!620731 () Bool)

(declare-fun e!516552 () Bool)

(assert (=> b!920405 (=> (not res!620731) (not e!516552))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55065 0))(
  ( (array!55066 (arr!26478 (Array (_ BitVec 32) (_ BitVec 64))) (size!26939 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55065)

(assert (=> b!920405 (= res!620731 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26939 _keys!1487))))))

(declare-fun mapIsEmpty!31089 () Bool)

(declare-fun mapRes!31089 () Bool)

(assert (=> mapIsEmpty!31089 mapRes!31089))

(declare-fun b!920406 () Bool)

(declare-fun e!516549 () Bool)

(declare-fun e!516544 () Bool)

(assert (=> b!920406 (= e!516549 (not e!516544))))

(declare-fun res!620720 () Bool)

(assert (=> b!920406 (=> res!620720 e!516544)))

(assert (=> b!920406 (= res!620720 (or (bvsge (size!26939 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26939 _keys!1487))))))

(declare-fun e!516545 () Bool)

(assert (=> b!920406 e!516545))

(declare-fun c!96007 () Bool)

(assert (=> b!920406 (= c!96007 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31039 0))(
  ( (V!31040 (val!9828 Int)) )
))
(declare-datatypes ((ValueCell!9296 0))(
  ( (ValueCellFull!9296 (v!12345 V!31039)) (EmptyCell!9296) )
))
(declare-datatypes ((array!55067 0))(
  ( (array!55068 (arr!26479 (Array (_ BitVec 32) ValueCell!9296)) (size!26940 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55067)

(declare-fun zeroValue!1173 () V!31039)

(declare-fun minValue!1173 () V!31039)

(declare-datatypes ((Unit!30988 0))(
  ( (Unit!30989) )
))
(declare-fun lt!413073 () Unit!30988)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!176 (array!55065 array!55067 (_ BitVec 32) (_ BitVec 32) V!31039 V!31039 (_ BitVec 64) (_ BitVec 32) Int) Unit!30988)

(assert (=> b!920406 (= lt!413073 (lemmaListMapContainsThenArrayContainsFrom!176 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!18617 0))(
  ( (Nil!18614) (Cons!18613 (h!19759 (_ BitVec 64)) (t!26385 List!18617)) )
))
(declare-fun arrayNoDuplicates!0 (array!55065 (_ BitVec 32) List!18617) Bool)

(assert (=> b!920406 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18614)))

(declare-fun lt!413081 () Unit!30988)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55065 (_ BitVec 32) (_ BitVec 32)) Unit!30988)

(assert (=> b!920406 (= lt!413081 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12834 0))(
  ( (tuple2!12835 (_1!6428 (_ BitVec 64)) (_2!6428 V!31039)) )
))
(declare-datatypes ((List!18618 0))(
  ( (Nil!18615) (Cons!18614 (h!19760 tuple2!12834) (t!26386 List!18618)) )
))
(declare-datatypes ((ListLongMap!11521 0))(
  ( (ListLongMap!11522 (toList!5776 List!18618)) )
))
(declare-fun lt!413076 () ListLongMap!11521)

(declare-fun lt!413080 () tuple2!12834)

(declare-fun contains!4780 (ListLongMap!11521 (_ BitVec 64)) Bool)

(declare-fun +!2688 (ListLongMap!11521 tuple2!12834) ListLongMap!11521)

(assert (=> b!920406 (contains!4780 (+!2688 lt!413076 lt!413080) k0!1099)))

(declare-fun lt!413077 () (_ BitVec 64))

(declare-fun lt!413079 () V!31039)

(declare-fun lt!413074 () Unit!30988)

(declare-fun addStillContains!385 (ListLongMap!11521 (_ BitVec 64) V!31039 (_ BitVec 64)) Unit!30988)

(assert (=> b!920406 (= lt!413074 (addStillContains!385 lt!413076 lt!413077 lt!413079 k0!1099))))

(declare-fun getCurrentListMap!2967 (array!55065 array!55067 (_ BitVec 32) (_ BitVec 32) V!31039 V!31039 (_ BitVec 32) Int) ListLongMap!11521)

(assert (=> b!920406 (= (getCurrentListMap!2967 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2688 (getCurrentListMap!2967 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413080))))

(assert (=> b!920406 (= lt!413080 (tuple2!12835 lt!413077 lt!413079))))

(declare-fun get!13899 (ValueCell!9296 V!31039) V!31039)

(declare-fun dynLambda!1444 (Int (_ BitVec 64)) V!31039)

(assert (=> b!920406 (= lt!413079 (get!13899 (select (arr!26479 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1444 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413075 () Unit!30988)

(declare-fun lemmaListMapRecursiveValidKeyArray!52 (array!55065 array!55067 (_ BitVec 32) (_ BitVec 32) V!31039 V!31039 (_ BitVec 32) Int) Unit!30988)

(assert (=> b!920406 (= lt!413075 (lemmaListMapRecursiveValidKeyArray!52 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920407 () Bool)

(declare-fun res!620723 () Bool)

(assert (=> b!920407 (=> (not res!620723) (not e!516552))))

(assert (=> b!920407 (= res!620723 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18614))))

(declare-fun b!920408 () Bool)

(declare-fun e!516548 () Bool)

(declare-fun tp_is_empty!19555 () Bool)

(assert (=> b!920408 (= e!516548 tp_is_empty!19555)))

(declare-fun b!920409 () Bool)

(declare-fun res!620730 () Bool)

(assert (=> b!920409 (=> (not res!620730) (not e!516552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55065 (_ BitVec 32)) Bool)

(assert (=> b!920409 (= res!620730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!31089 () Bool)

(declare-fun tp!59583 () Bool)

(assert (=> mapNonEmpty!31089 (= mapRes!31089 (and tp!59583 e!516548))))

(declare-fun mapRest!31089 () (Array (_ BitVec 32) ValueCell!9296))

(declare-fun mapValue!31089 () ValueCell!9296)

(declare-fun mapKey!31089 () (_ BitVec 32))

(assert (=> mapNonEmpty!31089 (= (arr!26479 _values!1231) (store mapRest!31089 mapKey!31089 mapValue!31089))))

(declare-fun b!920410 () Bool)

(assert (=> b!920410 (= e!516545 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!920411 () Bool)

(declare-fun res!620725 () Bool)

(assert (=> b!920411 (=> (not res!620725) (not e!516551))))

(assert (=> b!920411 (= res!620725 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!920412 () Bool)

(declare-fun res!620721 () Bool)

(assert (=> b!920412 (=> res!620721 e!516544)))

(declare-fun noDuplicate!1341 (List!18617) Bool)

(assert (=> b!920412 (= res!620721 (not (noDuplicate!1341 Nil!18614)))))

(declare-fun b!920413 () Bool)

(declare-fun arrayContainsKey!0 (array!55065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!920413 (= e!516545 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!920414 () Bool)

(declare-fun res!620729 () Bool)

(assert (=> b!920414 (=> (not res!620729) (not e!516552))))

(assert (=> b!920414 (= res!620729 (and (= (size!26940 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26939 _keys!1487) (size!26940 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!920415 () Bool)

(assert (=> b!920415 (= e!516544 true)))

(declare-fun lt!413078 () Bool)

(declare-fun contains!4781 (List!18617 (_ BitVec 64)) Bool)

(assert (=> b!920415 (= lt!413078 (contains!4781 Nil!18614 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920416 () Bool)

(assert (=> b!920416 (= e!516552 e!516551)))

(declare-fun res!620728 () Bool)

(assert (=> b!920416 (=> (not res!620728) (not e!516551))))

(assert (=> b!920416 (= res!620728 (contains!4780 lt!413076 k0!1099))))

(assert (=> b!920416 (= lt!413076 (getCurrentListMap!2967 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!620732 () Bool)

(assert (=> start!78816 (=> (not res!620732) (not e!516552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78816 (= res!620732 (validMask!0 mask!1881))))

(assert (=> start!78816 e!516552))

(assert (=> start!78816 true))

(assert (=> start!78816 tp_is_empty!19555))

(declare-fun e!516546 () Bool)

(declare-fun array_inv!20716 (array!55067) Bool)

(assert (=> start!78816 (and (array_inv!20716 _values!1231) e!516546)))

(assert (=> start!78816 tp!59582))

(declare-fun array_inv!20717 (array!55065) Bool)

(assert (=> start!78816 (array_inv!20717 _keys!1487)))

(declare-fun b!920417 () Bool)

(declare-fun res!620722 () Bool)

(assert (=> b!920417 (=> res!620722 e!516544)))

(assert (=> b!920417 (= res!620722 (contains!4781 Nil!18614 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920418 () Bool)

(assert (=> b!920418 (= e!516551 e!516549)))

(declare-fun res!620726 () Bool)

(assert (=> b!920418 (=> (not res!620726) (not e!516549))))

(assert (=> b!920418 (= res!620726 (validKeyInArray!0 lt!413077))))

(assert (=> b!920418 (= lt!413077 (select (arr!26478 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920419 () Bool)

(declare-fun e!516547 () Bool)

(assert (=> b!920419 (= e!516547 tp_is_empty!19555)))

(declare-fun b!920420 () Bool)

(assert (=> b!920420 (= e!516546 (and e!516547 mapRes!31089))))

(declare-fun condMapEmpty!31089 () Bool)

(declare-fun mapDefault!31089 () ValueCell!9296)

(assert (=> b!920420 (= condMapEmpty!31089 (= (arr!26479 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9296)) mapDefault!31089)))))

(declare-fun b!920421 () Bool)

(declare-fun res!620724 () Bool)

(assert (=> b!920421 (=> (not res!620724) (not e!516551))))

(declare-fun v!791 () V!31039)

(declare-fun apply!599 (ListLongMap!11521 (_ BitVec 64)) V!31039)

(assert (=> b!920421 (= res!620724 (= (apply!599 lt!413076 k0!1099) v!791))))

(assert (= (and start!78816 res!620732) b!920414))

(assert (= (and b!920414 res!620729) b!920409))

(assert (= (and b!920409 res!620730) b!920407))

(assert (= (and b!920407 res!620723) b!920405))

(assert (= (and b!920405 res!620731) b!920416))

(assert (= (and b!920416 res!620728) b!920421))

(assert (= (and b!920421 res!620724) b!920411))

(assert (= (and b!920411 res!620725) b!920404))

(assert (= (and b!920404 res!620727) b!920418))

(assert (= (and b!920418 res!620726) b!920406))

(assert (= (and b!920406 c!96007) b!920413))

(assert (= (and b!920406 (not c!96007)) b!920410))

(assert (= (and b!920406 (not res!620720)) b!920412))

(assert (= (and b!920412 (not res!620721)) b!920417))

(assert (= (and b!920417 (not res!620722)) b!920415))

(assert (= (and b!920420 condMapEmpty!31089) mapIsEmpty!31089))

(assert (= (and b!920420 (not condMapEmpty!31089)) mapNonEmpty!31089))

(get-info :version)

(assert (= (and mapNonEmpty!31089 ((_ is ValueCellFull!9296) mapValue!31089)) b!920408))

(assert (= (and b!920420 ((_ is ValueCellFull!9296) mapDefault!31089)) b!920419))

(assert (= start!78816 b!920420))

(declare-fun b_lambda!13531 () Bool)

(assert (=> (not b_lambda!13531) (not b!920406)))

(declare-fun t!26384 () Bool)

(declare-fun tb!5619 () Bool)

(assert (=> (and start!78816 (= defaultEntry!1235 defaultEntry!1235) t!26384) tb!5619))

(declare-fun result!11069 () Bool)

(assert (=> tb!5619 (= result!11069 tp_is_empty!19555)))

(assert (=> b!920406 t!26384))

(declare-fun b_and!27807 () Bool)

(assert (= b_and!27805 (and (=> t!26384 result!11069) b_and!27807)))

(declare-fun m!853813 () Bool)

(assert (=> b!920413 m!853813))

(declare-fun m!853815 () Bool)

(assert (=> b!920421 m!853815))

(declare-fun m!853817 () Bool)

(assert (=> b!920404 m!853817))

(declare-fun m!853819 () Bool)

(assert (=> b!920412 m!853819))

(declare-fun m!853821 () Bool)

(assert (=> b!920418 m!853821))

(declare-fun m!853823 () Bool)

(assert (=> b!920418 m!853823))

(declare-fun m!853825 () Bool)

(assert (=> b!920406 m!853825))

(declare-fun m!853827 () Bool)

(assert (=> b!920406 m!853827))

(declare-fun m!853829 () Bool)

(assert (=> b!920406 m!853829))

(declare-fun m!853831 () Bool)

(assert (=> b!920406 m!853831))

(declare-fun m!853833 () Bool)

(assert (=> b!920406 m!853833))

(declare-fun m!853835 () Bool)

(assert (=> b!920406 m!853835))

(declare-fun m!853837 () Bool)

(assert (=> b!920406 m!853837))

(declare-fun m!853839 () Bool)

(assert (=> b!920406 m!853839))

(declare-fun m!853841 () Bool)

(assert (=> b!920406 m!853841))

(assert (=> b!920406 m!853825))

(assert (=> b!920406 m!853833))

(assert (=> b!920406 m!853835))

(declare-fun m!853843 () Bool)

(assert (=> b!920406 m!853843))

(declare-fun m!853845 () Bool)

(assert (=> b!920406 m!853845))

(assert (=> b!920406 m!853845))

(declare-fun m!853847 () Bool)

(assert (=> b!920406 m!853847))

(declare-fun m!853849 () Bool)

(assert (=> b!920406 m!853849))

(declare-fun m!853851 () Bool)

(assert (=> b!920417 m!853851))

(declare-fun m!853853 () Bool)

(assert (=> b!920407 m!853853))

(declare-fun m!853855 () Bool)

(assert (=> b!920416 m!853855))

(declare-fun m!853857 () Bool)

(assert (=> b!920416 m!853857))

(declare-fun m!853859 () Bool)

(assert (=> mapNonEmpty!31089 m!853859))

(declare-fun m!853861 () Bool)

(assert (=> b!920415 m!853861))

(declare-fun m!853863 () Bool)

(assert (=> start!78816 m!853863))

(declare-fun m!853865 () Bool)

(assert (=> start!78816 m!853865))

(declare-fun m!853867 () Bool)

(assert (=> start!78816 m!853867))

(declare-fun m!853869 () Bool)

(assert (=> b!920409 m!853869))

(check-sat (not b!920412) tp_is_empty!19555 (not b!920407) (not b_lambda!13531) (not b!920406) (not mapNonEmpty!31089) (not b!920421) (not b!920415) (not b!920418) (not b!920416) (not b!920404) (not start!78816) (not b!920413) b_and!27807 (not b_next!17047) (not b!920417) (not b!920409))
(check-sat b_and!27807 (not b_next!17047))
