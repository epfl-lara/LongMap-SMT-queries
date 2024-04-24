; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79020 () Bool)

(assert start!79020)

(declare-fun b_free!17065 () Bool)

(declare-fun b_next!17065 () Bool)

(assert (=> start!79020 (= b_free!17065 (not b_next!17065))))

(declare-fun tp!59636 () Bool)

(declare-fun b_and!27877 () Bool)

(assert (=> start!79020 (= tp!59636 b_and!27877)))

(declare-fun b!922050 () Bool)

(declare-fun e!517522 () Bool)

(declare-fun e!517525 () Bool)

(assert (=> b!922050 (= e!517522 e!517525)))

(declare-fun res!621526 () Bool)

(assert (=> b!922050 (=> (not res!621526) (not e!517525))))

(declare-fun lt!413913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922050 (= res!621526 (validKeyInArray!0 lt!413913))))

(declare-datatypes ((array!55171 0))(
  ( (array!55172 (arr!26526 (Array (_ BitVec 32) (_ BitVec 64))) (size!26986 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55171)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!922050 (= lt!413913 (select (arr!26526 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922051 () Bool)

(declare-fun res!621537 () Bool)

(declare-fun e!517520 () Bool)

(assert (=> b!922051 (=> (not res!621537) (not e!517520))))

(assert (=> b!922051 (= res!621537 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26986 _keys!1487))))))

(declare-fun b!922052 () Bool)

(declare-fun res!621532 () Bool)

(assert (=> b!922052 (=> (not res!621532) (not e!517522))))

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!922052 (= res!621532 (validKeyInArray!0 k0!1099))))

(declare-fun mapIsEmpty!31116 () Bool)

(declare-fun mapRes!31116 () Bool)

(assert (=> mapIsEmpty!31116 mapRes!31116))

(declare-fun b!922053 () Bool)

(declare-fun res!621533 () Bool)

(assert (=> b!922053 (=> (not res!621533) (not e!517520))))

(declare-datatypes ((List!18593 0))(
  ( (Nil!18590) (Cons!18589 (h!19741 (_ BitVec 64)) (t!26380 List!18593)) )
))
(declare-fun arrayNoDuplicates!0 (array!55171 (_ BitVec 32) List!18593) Bool)

(assert (=> b!922053 (= res!621533 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18590))))

(declare-fun b!922054 () Bool)

(declare-fun res!621534 () Bool)

(assert (=> b!922054 (=> (not res!621534) (not e!517520))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31063 0))(
  ( (V!31064 (val!9837 Int)) )
))
(declare-datatypes ((ValueCell!9305 0))(
  ( (ValueCellFull!9305 (v!12352 V!31063)) (EmptyCell!9305) )
))
(declare-datatypes ((array!55173 0))(
  ( (array!55174 (arr!26527 (Array (_ BitVec 32) ValueCell!9305)) (size!26987 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55173)

(assert (=> b!922054 (= res!621534 (and (= (size!26987 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26986 _keys!1487) (size!26987 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922055 () Bool)

(declare-fun res!621528 () Bool)

(declare-fun e!517521 () Bool)

(assert (=> b!922055 (=> res!621528 e!517521)))

(declare-fun noDuplicate!1350 (List!18593) Bool)

(assert (=> b!922055 (= res!621528 (not (noDuplicate!1350 Nil!18590)))))

(declare-fun b!922056 () Bool)

(assert (=> b!922056 (= e!517520 e!517522)))

(declare-fun res!621535 () Bool)

(assert (=> b!922056 (=> (not res!621535) (not e!517522))))

(declare-datatypes ((tuple2!12778 0))(
  ( (tuple2!12779 (_1!6400 (_ BitVec 64)) (_2!6400 V!31063)) )
))
(declare-datatypes ((List!18594 0))(
  ( (Nil!18591) (Cons!18590 (h!19742 tuple2!12778) (t!26381 List!18594)) )
))
(declare-datatypes ((ListLongMap!11477 0))(
  ( (ListLongMap!11478 (toList!5754 List!18594)) )
))
(declare-fun lt!413918 () ListLongMap!11477)

(declare-fun contains!4818 (ListLongMap!11477 (_ BitVec 64)) Bool)

(assert (=> b!922056 (= res!621535 (contains!4818 lt!413918 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31063)

(declare-fun minValue!1173 () V!31063)

(declare-fun getCurrentListMap!3007 (array!55171 array!55173 (_ BitVec 32) (_ BitVec 32) V!31063 V!31063 (_ BitVec 32) Int) ListLongMap!11477)

(assert (=> b!922056 (= lt!413918 (getCurrentListMap!3007 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!922057 () Bool)

(declare-fun res!621531 () Bool)

(assert (=> b!922057 (=> res!621531 e!517521)))

(declare-fun contains!4819 (List!18593 (_ BitVec 64)) Bool)

(assert (=> b!922057 (= res!621531 (contains!4819 Nil!18590 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!922059 () Bool)

(declare-fun res!621529 () Bool)

(assert (=> b!922059 (=> (not res!621529) (not e!517522))))

(assert (=> b!922059 (= res!621529 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!922060 () Bool)

(declare-fun e!517518 () Bool)

(declare-fun arrayContainsKey!0 (array!55171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922060 (= e!517518 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!922061 () Bool)

(declare-fun res!621525 () Bool)

(assert (=> b!922061 (=> (not res!621525) (not e!517522))))

(declare-fun v!791 () V!31063)

(declare-fun apply!616 (ListLongMap!11477 (_ BitVec 64)) V!31063)

(assert (=> b!922061 (= res!621525 (= (apply!616 lt!413918 k0!1099) v!791))))

(declare-fun b!922062 () Bool)

(assert (=> b!922062 (= e!517521 true)))

(declare-fun lt!413921 () Bool)

(assert (=> b!922062 (= lt!413921 (contains!4819 Nil!18590 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!922063 () Bool)

(declare-fun e!517524 () Bool)

(declare-fun tp_is_empty!19573 () Bool)

(assert (=> b!922063 (= e!517524 tp_is_empty!19573)))

(declare-fun mapNonEmpty!31116 () Bool)

(declare-fun tp!59637 () Bool)

(assert (=> mapNonEmpty!31116 (= mapRes!31116 (and tp!59637 e!517524))))

(declare-fun mapValue!31116 () ValueCell!9305)

(declare-fun mapKey!31116 () (_ BitVec 32))

(declare-fun mapRest!31116 () (Array (_ BitVec 32) ValueCell!9305))

(assert (=> mapNonEmpty!31116 (= (arr!26527 _values!1231) (store mapRest!31116 mapKey!31116 mapValue!31116))))

(declare-fun b!922064 () Bool)

(declare-fun e!517517 () Bool)

(declare-fun e!517519 () Bool)

(assert (=> b!922064 (= e!517517 (and e!517519 mapRes!31116))))

(declare-fun condMapEmpty!31116 () Bool)

(declare-fun mapDefault!31116 () ValueCell!9305)

(assert (=> b!922064 (= condMapEmpty!31116 (= (arr!26527 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9305)) mapDefault!31116)))))

(declare-fun b!922065 () Bool)

(declare-fun res!621530 () Bool)

(assert (=> b!922065 (=> (not res!621530) (not e!517520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55171 (_ BitVec 32)) Bool)

(assert (=> b!922065 (= res!621530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!922066 () Bool)

(assert (=> b!922066 (= e!517519 tp_is_empty!19573)))

(declare-fun b!922067 () Bool)

(assert (=> b!922067 (= e!517525 (not e!517521))))

(declare-fun res!621536 () Bool)

(assert (=> b!922067 (=> res!621536 e!517521)))

(assert (=> b!922067 (= res!621536 (or (bvsge (size!26986 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26986 _keys!1487))))))

(assert (=> b!922067 e!517518))

(declare-fun c!96381 () Bool)

(assert (=> b!922067 (= c!96381 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31082 0))(
  ( (Unit!31083) )
))
(declare-fun lt!413919 () Unit!31082)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!176 (array!55171 array!55173 (_ BitVec 32) (_ BitVec 32) V!31063 V!31063 (_ BitVec 64) (_ BitVec 32) Int) Unit!31082)

(assert (=> b!922067 (= lt!413919 (lemmaListMapContainsThenArrayContainsFrom!176 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!922067 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18590)))

(declare-fun lt!413917 () Unit!31082)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55171 (_ BitVec 32) (_ BitVec 32)) Unit!31082)

(assert (=> b!922067 (= lt!413917 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413916 () tuple2!12778)

(declare-fun +!2685 (ListLongMap!11477 tuple2!12778) ListLongMap!11477)

(assert (=> b!922067 (contains!4818 (+!2685 lt!413918 lt!413916) k0!1099)))

(declare-fun lt!413920 () Unit!31082)

(declare-fun lt!413915 () V!31063)

(declare-fun addStillContains!394 (ListLongMap!11477 (_ BitVec 64) V!31063 (_ BitVec 64)) Unit!31082)

(assert (=> b!922067 (= lt!413920 (addStillContains!394 lt!413918 lt!413913 lt!413915 k0!1099))))

(assert (=> b!922067 (= (getCurrentListMap!3007 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2685 (getCurrentListMap!3007 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413916))))

(assert (=> b!922067 (= lt!413916 (tuple2!12779 lt!413913 lt!413915))))

(declare-fun get!13942 (ValueCell!9305 V!31063) V!31063)

(declare-fun dynLambda!1482 (Int (_ BitVec 64)) V!31063)

(assert (=> b!922067 (= lt!413915 (get!13942 (select (arr!26527 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1482 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413914 () Unit!31082)

(declare-fun lemmaListMapRecursiveValidKeyArray!65 (array!55171 array!55173 (_ BitVec 32) (_ BitVec 32) V!31063 V!31063 (_ BitVec 32) Int) Unit!31082)

(assert (=> b!922067 (= lt!413914 (lemmaListMapRecursiveValidKeyArray!65 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922058 () Bool)

(assert (=> b!922058 (= e!517518 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!621527 () Bool)

(assert (=> start!79020 (=> (not res!621527) (not e!517520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79020 (= res!621527 (validMask!0 mask!1881))))

(assert (=> start!79020 e!517520))

(assert (=> start!79020 true))

(assert (=> start!79020 tp_is_empty!19573))

(declare-fun array_inv!20770 (array!55173) Bool)

(assert (=> start!79020 (and (array_inv!20770 _values!1231) e!517517)))

(assert (=> start!79020 tp!59636))

(declare-fun array_inv!20771 (array!55171) Bool)

(assert (=> start!79020 (array_inv!20771 _keys!1487)))

(assert (= (and start!79020 res!621527) b!922054))

(assert (= (and b!922054 res!621534) b!922065))

(assert (= (and b!922065 res!621530) b!922053))

(assert (= (and b!922053 res!621533) b!922051))

(assert (= (and b!922051 res!621537) b!922056))

(assert (= (and b!922056 res!621535) b!922061))

(assert (= (and b!922061 res!621525) b!922059))

(assert (= (and b!922059 res!621529) b!922052))

(assert (= (and b!922052 res!621532) b!922050))

(assert (= (and b!922050 res!621526) b!922067))

(assert (= (and b!922067 c!96381) b!922060))

(assert (= (and b!922067 (not c!96381)) b!922058))

(assert (= (and b!922067 (not res!621536)) b!922055))

(assert (= (and b!922055 (not res!621528)) b!922057))

(assert (= (and b!922057 (not res!621531)) b!922062))

(assert (= (and b!922064 condMapEmpty!31116) mapIsEmpty!31116))

(assert (= (and b!922064 (not condMapEmpty!31116)) mapNonEmpty!31116))

(get-info :version)

(assert (= (and mapNonEmpty!31116 ((_ is ValueCellFull!9305) mapValue!31116)) b!922063))

(assert (= (and b!922064 ((_ is ValueCellFull!9305) mapDefault!31116)) b!922066))

(assert (= start!79020 b!922064))

(declare-fun b_lambda!13581 () Bool)

(assert (=> (not b_lambda!13581) (not b!922067)))

(declare-fun t!26379 () Bool)

(declare-fun tb!5637 () Bool)

(assert (=> (and start!79020 (= defaultEntry!1235 defaultEntry!1235) t!26379) tb!5637))

(declare-fun result!11105 () Bool)

(assert (=> tb!5637 (= result!11105 tp_is_empty!19573)))

(assert (=> b!922067 t!26379))

(declare-fun b_and!27879 () Bool)

(assert (= b_and!27877 (and (=> t!26379 result!11105) b_and!27879)))

(declare-fun m!856387 () Bool)

(assert (=> start!79020 m!856387))

(declare-fun m!856389 () Bool)

(assert (=> start!79020 m!856389))

(declare-fun m!856391 () Bool)

(assert (=> start!79020 m!856391))

(declare-fun m!856393 () Bool)

(assert (=> b!922055 m!856393))

(declare-fun m!856395 () Bool)

(assert (=> b!922060 m!856395))

(declare-fun m!856397 () Bool)

(assert (=> b!922053 m!856397))

(declare-fun m!856399 () Bool)

(assert (=> b!922061 m!856399))

(declare-fun m!856401 () Bool)

(assert (=> mapNonEmpty!31116 m!856401))

(declare-fun m!856403 () Bool)

(assert (=> b!922056 m!856403))

(declare-fun m!856405 () Bool)

(assert (=> b!922056 m!856405))

(declare-fun m!856407 () Bool)

(assert (=> b!922057 m!856407))

(declare-fun m!856409 () Bool)

(assert (=> b!922050 m!856409))

(declare-fun m!856411 () Bool)

(assert (=> b!922050 m!856411))

(declare-fun m!856413 () Bool)

(assert (=> b!922065 m!856413))

(declare-fun m!856415 () Bool)

(assert (=> b!922067 m!856415))

(declare-fun m!856417 () Bool)

(assert (=> b!922067 m!856417))

(assert (=> b!922067 m!856417))

(declare-fun m!856419 () Bool)

(assert (=> b!922067 m!856419))

(declare-fun m!856421 () Bool)

(assert (=> b!922067 m!856421))

(declare-fun m!856423 () Bool)

(assert (=> b!922067 m!856423))

(assert (=> b!922067 m!856423))

(declare-fun m!856425 () Bool)

(assert (=> b!922067 m!856425))

(declare-fun m!856427 () Bool)

(assert (=> b!922067 m!856427))

(declare-fun m!856429 () Bool)

(assert (=> b!922067 m!856429))

(assert (=> b!922067 m!856419))

(declare-fun m!856431 () Bool)

(assert (=> b!922067 m!856431))

(declare-fun m!856433 () Bool)

(assert (=> b!922067 m!856433))

(declare-fun m!856435 () Bool)

(assert (=> b!922067 m!856435))

(declare-fun m!856437 () Bool)

(assert (=> b!922067 m!856437))

(assert (=> b!922067 m!856431))

(declare-fun m!856439 () Bool)

(assert (=> b!922067 m!856439))

(declare-fun m!856441 () Bool)

(assert (=> b!922052 m!856441))

(declare-fun m!856443 () Bool)

(assert (=> b!922062 m!856443))

(check-sat (not b!922050) tp_is_empty!19573 (not b_lambda!13581) (not b!922057) (not mapNonEmpty!31116) (not b!922062) (not b!922056) (not start!79020) (not b!922067) (not b!922061) b_and!27879 (not b!922055) (not b_next!17065) (not b!922060) (not b!922052) (not b!922065) (not b!922053))
(check-sat b_and!27879 (not b_next!17065))
