; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78996 () Bool)

(assert start!78996)

(declare-fun b_free!17041 () Bool)

(declare-fun b_next!17041 () Bool)

(assert (=> start!78996 (= b_free!17041 (not b_next!17041))))

(declare-fun tp!59565 () Bool)

(declare-fun b_and!27829 () Bool)

(assert (=> start!78996 (= tp!59565 b_and!27829)))

(declare-fun b!921378 () Bool)

(declare-fun res!621057 () Bool)

(declare-fun e!517193 () Bool)

(assert (=> b!921378 (=> (not res!621057) (not e!517193))))

(declare-datatypes ((array!55123 0))(
  ( (array!55124 (arr!26502 (Array (_ BitVec 32) (_ BitVec 64))) (size!26962 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55123)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31031 0))(
  ( (V!31032 (val!9825 Int)) )
))
(declare-datatypes ((ValueCell!9293 0))(
  ( (ValueCellFull!9293 (v!12340 V!31031)) (EmptyCell!9293) )
))
(declare-datatypes ((array!55125 0))(
  ( (array!55126 (arr!26503 (Array (_ BitVec 32) ValueCell!9293)) (size!26963 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55125)

(assert (=> b!921378 (= res!621057 (and (= (size!26963 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26962 _keys!1487) (size!26963 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!921379 () Bool)

(declare-fun res!621067 () Bool)

(assert (=> b!921379 (=> (not res!621067) (not e!517193))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!921379 (= res!621067 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26962 _keys!1487))))))

(declare-fun b!921380 () Bool)

(declare-fun res!621064 () Bool)

(declare-fun e!517200 () Bool)

(assert (=> b!921380 (=> (not res!621064) (not e!517200))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31031)

(declare-datatypes ((tuple2!12756 0))(
  ( (tuple2!12757 (_1!6389 (_ BitVec 64)) (_2!6389 V!31031)) )
))
(declare-datatypes ((List!18570 0))(
  ( (Nil!18567) (Cons!18566 (h!19718 tuple2!12756) (t!26333 List!18570)) )
))
(declare-datatypes ((ListLongMap!11455 0))(
  ( (ListLongMap!11456 (toList!5743 List!18570)) )
))
(declare-fun lt!413594 () ListLongMap!11455)

(declare-fun apply!608 (ListLongMap!11455 (_ BitVec 64)) V!31031)

(assert (=> b!921380 (= res!621064 (= (apply!608 lt!413594 k0!1099) v!791))))

(declare-fun res!621062 () Bool)

(assert (=> start!78996 (=> (not res!621062) (not e!517193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78996 (= res!621062 (validMask!0 mask!1881))))

(assert (=> start!78996 e!517193))

(assert (=> start!78996 true))

(declare-fun tp_is_empty!19549 () Bool)

(assert (=> start!78996 tp_is_empty!19549))

(declare-fun e!517195 () Bool)

(declare-fun array_inv!20746 (array!55125) Bool)

(assert (=> start!78996 (and (array_inv!20746 _values!1231) e!517195)))

(assert (=> start!78996 tp!59565))

(declare-fun array_inv!20747 (array!55123) Bool)

(assert (=> start!78996 (array_inv!20747 _keys!1487)))

(declare-fun b!921381 () Bool)

(declare-fun res!621069 () Bool)

(declare-fun e!517201 () Bool)

(assert (=> b!921381 (=> res!621069 e!517201)))

(declare-datatypes ((List!18571 0))(
  ( (Nil!18568) (Cons!18567 (h!19719 (_ BitVec 64)) (t!26334 List!18571)) )
))
(declare-fun contains!4798 (List!18571 (_ BitVec 64)) Bool)

(assert (=> b!921381 (= res!621069 (contains!4798 Nil!18568 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!31080 () Bool)

(declare-fun mapRes!31080 () Bool)

(declare-fun tp!59564 () Bool)

(declare-fun e!517196 () Bool)

(assert (=> mapNonEmpty!31080 (= mapRes!31080 (and tp!59564 e!517196))))

(declare-fun mapValue!31080 () ValueCell!9293)

(declare-fun mapKey!31080 () (_ BitVec 32))

(declare-fun mapRest!31080 () (Array (_ BitVec 32) ValueCell!9293))

(assert (=> mapNonEmpty!31080 (= (arr!26503 _values!1231) (store mapRest!31080 mapKey!31080 mapValue!31080))))

(declare-fun b!921382 () Bool)

(declare-fun e!517199 () Bool)

(assert (=> b!921382 (= e!517200 e!517199)))

(declare-fun res!621061 () Bool)

(assert (=> b!921382 (=> (not res!621061) (not e!517199))))

(declare-fun lt!413589 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921382 (= res!621061 (validKeyInArray!0 lt!413589))))

(assert (=> b!921382 (= lt!413589 (select (arr!26502 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!921383 () Bool)

(declare-fun e!517198 () Bool)

(assert (=> b!921383 (= e!517198 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!31080 () Bool)

(assert (=> mapIsEmpty!31080 mapRes!31080))

(declare-fun b!921384 () Bool)

(declare-fun e!517197 () Bool)

(assert (=> b!921384 (= e!517195 (and e!517197 mapRes!31080))))

(declare-fun condMapEmpty!31080 () Bool)

(declare-fun mapDefault!31080 () ValueCell!9293)

(assert (=> b!921384 (= condMapEmpty!31080 (= (arr!26503 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9293)) mapDefault!31080)))))

(declare-fun b!921385 () Bool)

(assert (=> b!921385 (= e!517193 e!517200)))

(declare-fun res!621065 () Bool)

(assert (=> b!921385 (=> (not res!621065) (not e!517200))))

(declare-fun contains!4799 (ListLongMap!11455 (_ BitVec 64)) Bool)

(assert (=> b!921385 (= res!621065 (contains!4799 lt!413594 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31031)

(declare-fun minValue!1173 () V!31031)

(declare-fun getCurrentListMap!2996 (array!55123 array!55125 (_ BitVec 32) (_ BitVec 32) V!31031 V!31031 (_ BitVec 32) Int) ListLongMap!11455)

(assert (=> b!921385 (= lt!413594 (getCurrentListMap!2996 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!921386 () Bool)

(assert (=> b!921386 (= e!517196 tp_is_empty!19549)))

(declare-fun b!921387 () Bool)

(assert (=> b!921387 (= e!517199 (not e!517201))))

(declare-fun res!621060 () Bool)

(assert (=> b!921387 (=> res!621060 e!517201)))

(assert (=> b!921387 (= res!621060 (or (bvsge (size!26962 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26962 _keys!1487))))))

(assert (=> b!921387 e!517198))

(declare-fun c!96345 () Bool)

(assert (=> b!921387 (= c!96345 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31064 0))(
  ( (Unit!31065) )
))
(declare-fun lt!413591 () Unit!31064)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!167 (array!55123 array!55125 (_ BitVec 32) (_ BitVec 32) V!31031 V!31031 (_ BitVec 64) (_ BitVec 32) Int) Unit!31064)

(assert (=> b!921387 (= lt!413591 (lemmaListMapContainsThenArrayContainsFrom!167 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55123 (_ BitVec 32) List!18571) Bool)

(assert (=> b!921387 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18568)))

(declare-fun lt!413592 () Unit!31064)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55123 (_ BitVec 32) (_ BitVec 32)) Unit!31064)

(assert (=> b!921387 (= lt!413592 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413597 () tuple2!12756)

(declare-fun +!2676 (ListLongMap!11455 tuple2!12756) ListLongMap!11455)

(assert (=> b!921387 (contains!4799 (+!2676 lt!413594 lt!413597) k0!1099)))

(declare-fun lt!413596 () Unit!31064)

(declare-fun lt!413595 () V!31031)

(declare-fun addStillContains!385 (ListLongMap!11455 (_ BitVec 64) V!31031 (_ BitVec 64)) Unit!31064)

(assert (=> b!921387 (= lt!413596 (addStillContains!385 lt!413594 lt!413589 lt!413595 k0!1099))))

(assert (=> b!921387 (= (getCurrentListMap!2996 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2676 (getCurrentListMap!2996 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413597))))

(assert (=> b!921387 (= lt!413597 (tuple2!12757 lt!413589 lt!413595))))

(declare-fun get!13925 (ValueCell!9293 V!31031) V!31031)

(declare-fun dynLambda!1473 (Int (_ BitVec 64)) V!31031)

(assert (=> b!921387 (= lt!413595 (get!13925 (select (arr!26503 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1473 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413593 () Unit!31064)

(declare-fun lemmaListMapRecursiveValidKeyArray!56 (array!55123 array!55125 (_ BitVec 32) (_ BitVec 32) V!31031 V!31031 (_ BitVec 32) Int) Unit!31064)

(assert (=> b!921387 (= lt!413593 (lemmaListMapRecursiveValidKeyArray!56 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921388 () Bool)

(declare-fun res!621066 () Bool)

(assert (=> b!921388 (=> (not res!621066) (not e!517200))))

(assert (=> b!921388 (= res!621066 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!921389 () Bool)

(declare-fun res!621063 () Bool)

(assert (=> b!921389 (=> (not res!621063) (not e!517193))))

(assert (=> b!921389 (= res!621063 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18568))))

(declare-fun b!921390 () Bool)

(declare-fun res!621059 () Bool)

(assert (=> b!921390 (=> (not res!621059) (not e!517200))))

(assert (=> b!921390 (= res!621059 (validKeyInArray!0 k0!1099))))

(declare-fun b!921391 () Bool)

(assert (=> b!921391 (= e!517197 tp_is_empty!19549)))

(declare-fun b!921392 () Bool)

(declare-fun arrayContainsKey!0 (array!55123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921392 (= e!517198 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!921393 () Bool)

(declare-fun res!621068 () Bool)

(assert (=> b!921393 (=> res!621068 e!517201)))

(declare-fun noDuplicate!1340 (List!18571) Bool)

(assert (=> b!921393 (= res!621068 (not (noDuplicate!1340 Nil!18568)))))

(declare-fun b!921394 () Bool)

(declare-fun res!621058 () Bool)

(assert (=> b!921394 (=> (not res!621058) (not e!517193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55123 (_ BitVec 32)) Bool)

(assert (=> b!921394 (= res!621058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!921395 () Bool)

(assert (=> b!921395 (= e!517201 true)))

(declare-fun lt!413590 () Bool)

(assert (=> b!921395 (= lt!413590 (contains!4798 Nil!18568 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!78996 res!621062) b!921378))

(assert (= (and b!921378 res!621057) b!921394))

(assert (= (and b!921394 res!621058) b!921389))

(assert (= (and b!921389 res!621063) b!921379))

(assert (= (and b!921379 res!621067) b!921385))

(assert (= (and b!921385 res!621065) b!921380))

(assert (= (and b!921380 res!621064) b!921388))

(assert (= (and b!921388 res!621066) b!921390))

(assert (= (and b!921390 res!621059) b!921382))

(assert (= (and b!921382 res!621061) b!921387))

(assert (= (and b!921387 c!96345) b!921392))

(assert (= (and b!921387 (not c!96345)) b!921383))

(assert (= (and b!921387 (not res!621060)) b!921393))

(assert (= (and b!921393 (not res!621068)) b!921381))

(assert (= (and b!921381 (not res!621069)) b!921395))

(assert (= (and b!921384 condMapEmpty!31080) mapIsEmpty!31080))

(assert (= (and b!921384 (not condMapEmpty!31080)) mapNonEmpty!31080))

(get-info :version)

(assert (= (and mapNonEmpty!31080 ((_ is ValueCellFull!9293) mapValue!31080)) b!921386))

(assert (= (and b!921384 ((_ is ValueCellFull!9293) mapDefault!31080)) b!921391))

(assert (= start!78996 b!921384))

(declare-fun b_lambda!13557 () Bool)

(assert (=> (not b_lambda!13557) (not b!921387)))

(declare-fun t!26332 () Bool)

(declare-fun tb!5613 () Bool)

(assert (=> (and start!78996 (= defaultEntry!1235 defaultEntry!1235) t!26332) tb!5613))

(declare-fun result!11057 () Bool)

(assert (=> tb!5613 (= result!11057 tp_is_empty!19549)))

(assert (=> b!921387 t!26332))

(declare-fun b_and!27831 () Bool)

(assert (= b_and!27829 (and (=> t!26332 result!11057) b_and!27831)))

(declare-fun m!855691 () Bool)

(assert (=> b!921381 m!855691))

(declare-fun m!855693 () Bool)

(assert (=> b!921394 m!855693))

(declare-fun m!855695 () Bool)

(assert (=> b!921385 m!855695))

(declare-fun m!855697 () Bool)

(assert (=> b!921385 m!855697))

(declare-fun m!855699 () Bool)

(assert (=> b!921387 m!855699))

(declare-fun m!855701 () Bool)

(assert (=> b!921387 m!855701))

(declare-fun m!855703 () Bool)

(assert (=> b!921387 m!855703))

(declare-fun m!855705 () Bool)

(assert (=> b!921387 m!855705))

(declare-fun m!855707 () Bool)

(assert (=> b!921387 m!855707))

(declare-fun m!855709 () Bool)

(assert (=> b!921387 m!855709))

(assert (=> b!921387 m!855701))

(assert (=> b!921387 m!855703))

(declare-fun m!855711 () Bool)

(assert (=> b!921387 m!855711))

(declare-fun m!855713 () Bool)

(assert (=> b!921387 m!855713))

(assert (=> b!921387 m!855705))

(declare-fun m!855715 () Bool)

(assert (=> b!921387 m!855715))

(declare-fun m!855717 () Bool)

(assert (=> b!921387 m!855717))

(declare-fun m!855719 () Bool)

(assert (=> b!921387 m!855719))

(declare-fun m!855721 () Bool)

(assert (=> b!921387 m!855721))

(assert (=> b!921387 m!855717))

(declare-fun m!855723 () Bool)

(assert (=> b!921387 m!855723))

(declare-fun m!855725 () Bool)

(assert (=> b!921395 m!855725))

(declare-fun m!855727 () Bool)

(assert (=> mapNonEmpty!31080 m!855727))

(declare-fun m!855729 () Bool)

(assert (=> b!921389 m!855729))

(declare-fun m!855731 () Bool)

(assert (=> start!78996 m!855731))

(declare-fun m!855733 () Bool)

(assert (=> start!78996 m!855733))

(declare-fun m!855735 () Bool)

(assert (=> start!78996 m!855735))

(declare-fun m!855737 () Bool)

(assert (=> b!921392 m!855737))

(declare-fun m!855739 () Bool)

(assert (=> b!921390 m!855739))

(declare-fun m!855741 () Bool)

(assert (=> b!921380 m!855741))

(declare-fun m!855743 () Bool)

(assert (=> b!921382 m!855743))

(declare-fun m!855745 () Bool)

(assert (=> b!921382 m!855745))

(declare-fun m!855747 () Bool)

(assert (=> b!921393 m!855747))

(check-sat (not b_lambda!13557) (not b!921385) (not b!921380) (not b!921389) (not b!921390) (not mapNonEmpty!31080) (not b_next!17041) b_and!27831 (not b!921393) (not b!921382) (not b!921387) (not b!921381) (not b!921395) (not b!921394) tp_is_empty!19549 (not b!921392) (not start!78996))
(check-sat b_and!27831 (not b_next!17041))
