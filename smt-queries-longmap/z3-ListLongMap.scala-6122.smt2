; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78822 () Bool)

(assert start!78822)

(declare-fun b_free!17053 () Bool)

(declare-fun b_next!17053 () Bool)

(assert (=> start!78822 (= b_free!17053 (not b_next!17053))))

(declare-fun tp!59600 () Bool)

(declare-fun b_and!27817 () Bool)

(assert (=> start!78822 (= tp!59600 b_and!27817)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!920572 () Bool)

(declare-fun e!516633 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!55075 0))(
  ( (array!55076 (arr!26483 (Array (_ BitVec 32) (_ BitVec 64))) (size!26944 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55075)

(declare-fun arrayContainsKey!0 (array!55075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!920572 (= e!516633 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!920573 () Bool)

(declare-fun e!516625 () Bool)

(declare-fun tp_is_empty!19561 () Bool)

(assert (=> b!920573 (= e!516625 tp_is_empty!19561)))

(declare-fun b!920574 () Bool)

(declare-fun e!516631 () Bool)

(assert (=> b!920574 (= e!516631 true)))

(declare-fun lt!413159 () Bool)

(declare-datatypes ((List!18621 0))(
  ( (Nil!18618) (Cons!18617 (h!19763 (_ BitVec 64)) (t!26395 List!18621)) )
))
(declare-fun contains!4783 (List!18621 (_ BitVec 64)) Bool)

(assert (=> b!920574 (= lt!413159 (contains!4783 Nil!18618 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920575 () Bool)

(declare-fun res!620842 () Bool)

(assert (=> b!920575 (=> res!620842 e!516631)))

(assert (=> b!920575 (= res!620842 (contains!4783 Nil!18618 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920576 () Bool)

(declare-fun res!620839 () Bool)

(declare-fun e!516632 () Bool)

(assert (=> b!920576 (=> (not res!620839) (not e!516632))))

(assert (=> b!920576 (= res!620839 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!920577 () Bool)

(declare-fun e!516628 () Bool)

(assert (=> b!920577 (= e!516628 tp_is_empty!19561)))

(declare-fun b!920578 () Bool)

(declare-fun e!516627 () Bool)

(assert (=> b!920578 (= e!516632 e!516627)))

(declare-fun res!620848 () Bool)

(assert (=> b!920578 (=> (not res!620848) (not e!516627))))

(declare-fun lt!413156 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920578 (= res!620848 (validKeyInArray!0 lt!413156))))

(assert (=> b!920578 (= lt!413156 (select (arr!26483 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920579 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!920579 (= e!516633 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!920580 () Bool)

(declare-fun res!620849 () Bool)

(assert (=> b!920580 (=> res!620849 e!516631)))

(declare-fun noDuplicate!1343 (List!18621) Bool)

(assert (=> b!920580 (= res!620849 (not (noDuplicate!1343 Nil!18618)))))

(declare-fun b!920581 () Bool)

(declare-fun res!620845 () Bool)

(assert (=> b!920581 (=> (not res!620845) (not e!516632))))

(declare-datatypes ((V!31047 0))(
  ( (V!31048 (val!9831 Int)) )
))
(declare-fun v!791 () V!31047)

(declare-datatypes ((tuple2!12838 0))(
  ( (tuple2!12839 (_1!6430 (_ BitVec 64)) (_2!6430 V!31047)) )
))
(declare-datatypes ((List!18622 0))(
  ( (Nil!18619) (Cons!18618 (h!19764 tuple2!12838) (t!26396 List!18622)) )
))
(declare-datatypes ((ListLongMap!11525 0))(
  ( (ListLongMap!11526 (toList!5778 List!18622)) )
))
(declare-fun lt!413154 () ListLongMap!11525)

(declare-fun apply!600 (ListLongMap!11525 (_ BitVec 64)) V!31047)

(assert (=> b!920581 (= res!620845 (= (apply!600 lt!413154 k0!1099) v!791))))

(declare-fun b!920582 () Bool)

(declare-fun e!516629 () Bool)

(declare-fun mapRes!31098 () Bool)

(assert (=> b!920582 (= e!516629 (and e!516625 mapRes!31098))))

(declare-fun condMapEmpty!31098 () Bool)

(declare-datatypes ((ValueCell!9299 0))(
  ( (ValueCellFull!9299 (v!12348 V!31047)) (EmptyCell!9299) )
))
(declare-datatypes ((array!55077 0))(
  ( (array!55078 (arr!26484 (Array (_ BitVec 32) ValueCell!9299)) (size!26945 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55077)

(declare-fun mapDefault!31098 () ValueCell!9299)

(assert (=> b!920582 (= condMapEmpty!31098 (= (arr!26484 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9299)) mapDefault!31098)))))

(declare-fun mapNonEmpty!31098 () Bool)

(declare-fun tp!59601 () Bool)

(assert (=> mapNonEmpty!31098 (= mapRes!31098 (and tp!59601 e!516628))))

(declare-fun mapValue!31098 () ValueCell!9299)

(declare-fun mapRest!31098 () (Array (_ BitVec 32) ValueCell!9299))

(declare-fun mapKey!31098 () (_ BitVec 32))

(assert (=> mapNonEmpty!31098 (= (arr!26484 _values!1231) (store mapRest!31098 mapKey!31098 mapValue!31098))))

(declare-fun b!920583 () Bool)

(declare-fun res!620837 () Bool)

(declare-fun e!516626 () Bool)

(assert (=> b!920583 (=> (not res!620837) (not e!516626))))

(declare-fun mask!1881 () (_ BitVec 32))

(assert (=> b!920583 (= res!620837 (and (= (size!26945 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26944 _keys!1487) (size!26945 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!620847 () Bool)

(assert (=> start!78822 (=> (not res!620847) (not e!516626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78822 (= res!620847 (validMask!0 mask!1881))))

(assert (=> start!78822 e!516626))

(assert (=> start!78822 true))

(assert (=> start!78822 tp_is_empty!19561))

(declare-fun array_inv!20718 (array!55077) Bool)

(assert (=> start!78822 (and (array_inv!20718 _values!1231) e!516629)))

(assert (=> start!78822 tp!59600))

(declare-fun array_inv!20719 (array!55075) Bool)

(assert (=> start!78822 (array_inv!20719 _keys!1487)))

(declare-fun mapIsEmpty!31098 () Bool)

(assert (=> mapIsEmpty!31098 mapRes!31098))

(declare-fun b!920584 () Bool)

(assert (=> b!920584 (= e!516627 (not e!516631))))

(declare-fun res!620843 () Bool)

(assert (=> b!920584 (=> res!620843 e!516631)))

(assert (=> b!920584 (= res!620843 (or (bvsge (size!26944 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26944 _keys!1487))))))

(assert (=> b!920584 e!516633))

(declare-fun c!96016 () Bool)

(assert (=> b!920584 (= c!96016 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!30992 0))(
  ( (Unit!30993) )
))
(declare-fun lt!413161 () Unit!30992)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31047)

(declare-fun minValue!1173 () V!31047)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!178 (array!55075 array!55077 (_ BitVec 32) (_ BitVec 32) V!31047 V!31047 (_ BitVec 64) (_ BitVec 32) Int) Unit!30992)

(assert (=> b!920584 (= lt!413161 (lemmaListMapContainsThenArrayContainsFrom!178 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55075 (_ BitVec 32) List!18621) Bool)

(assert (=> b!920584 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18618)))

(declare-fun lt!413160 () Unit!30992)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55075 (_ BitVec 32) (_ BitVec 32)) Unit!30992)

(assert (=> b!920584 (= lt!413160 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413158 () tuple2!12838)

(declare-fun contains!4784 (ListLongMap!11525 (_ BitVec 64)) Bool)

(declare-fun +!2690 (ListLongMap!11525 tuple2!12838) ListLongMap!11525)

(assert (=> b!920584 (contains!4784 (+!2690 lt!413154 lt!413158) k0!1099)))

(declare-fun lt!413155 () V!31047)

(declare-fun lt!413162 () Unit!30992)

(declare-fun addStillContains!387 (ListLongMap!11525 (_ BitVec 64) V!31047 (_ BitVec 64)) Unit!30992)

(assert (=> b!920584 (= lt!413162 (addStillContains!387 lt!413154 lt!413156 lt!413155 k0!1099))))

(declare-fun getCurrentListMap!2969 (array!55075 array!55077 (_ BitVec 32) (_ BitVec 32) V!31047 V!31047 (_ BitVec 32) Int) ListLongMap!11525)

(assert (=> b!920584 (= (getCurrentListMap!2969 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2690 (getCurrentListMap!2969 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413158))))

(assert (=> b!920584 (= lt!413158 (tuple2!12839 lt!413156 lt!413155))))

(declare-fun get!13903 (ValueCell!9299 V!31047) V!31047)

(declare-fun dynLambda!1446 (Int (_ BitVec 64)) V!31047)

(assert (=> b!920584 (= lt!413155 (get!13903 (select (arr!26484 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1446 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413157 () Unit!30992)

(declare-fun lemmaListMapRecursiveValidKeyArray!54 (array!55075 array!55077 (_ BitVec 32) (_ BitVec 32) V!31047 V!31047 (_ BitVec 32) Int) Unit!30992)

(assert (=> b!920584 (= lt!413157 (lemmaListMapRecursiveValidKeyArray!54 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920585 () Bool)

(declare-fun res!620838 () Bool)

(assert (=> b!920585 (=> (not res!620838) (not e!516626))))

(assert (=> b!920585 (= res!620838 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26944 _keys!1487))))))

(declare-fun b!920586 () Bool)

(declare-fun res!620841 () Bool)

(assert (=> b!920586 (=> (not res!620841) (not e!516632))))

(assert (=> b!920586 (= res!620841 (validKeyInArray!0 k0!1099))))

(declare-fun b!920587 () Bool)

(declare-fun res!620840 () Bool)

(assert (=> b!920587 (=> (not res!620840) (not e!516626))))

(assert (=> b!920587 (= res!620840 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18618))))

(declare-fun b!920588 () Bool)

(declare-fun res!620844 () Bool)

(assert (=> b!920588 (=> (not res!620844) (not e!516626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55075 (_ BitVec 32)) Bool)

(assert (=> b!920588 (= res!620844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!920589 () Bool)

(assert (=> b!920589 (= e!516626 e!516632)))

(declare-fun res!620846 () Bool)

(assert (=> b!920589 (=> (not res!620846) (not e!516632))))

(assert (=> b!920589 (= res!620846 (contains!4784 lt!413154 k0!1099))))

(assert (=> b!920589 (= lt!413154 (getCurrentListMap!2969 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!78822 res!620847) b!920583))

(assert (= (and b!920583 res!620837) b!920588))

(assert (= (and b!920588 res!620844) b!920587))

(assert (= (and b!920587 res!620840) b!920585))

(assert (= (and b!920585 res!620838) b!920589))

(assert (= (and b!920589 res!620846) b!920581))

(assert (= (and b!920581 res!620845) b!920576))

(assert (= (and b!920576 res!620839) b!920586))

(assert (= (and b!920586 res!620841) b!920578))

(assert (= (and b!920578 res!620848) b!920584))

(assert (= (and b!920584 c!96016) b!920572))

(assert (= (and b!920584 (not c!96016)) b!920579))

(assert (= (and b!920584 (not res!620843)) b!920580))

(assert (= (and b!920580 (not res!620849)) b!920575))

(assert (= (and b!920575 (not res!620842)) b!920574))

(assert (= (and b!920582 condMapEmpty!31098) mapIsEmpty!31098))

(assert (= (and b!920582 (not condMapEmpty!31098)) mapNonEmpty!31098))

(get-info :version)

(assert (= (and mapNonEmpty!31098 ((_ is ValueCellFull!9299) mapValue!31098)) b!920577))

(assert (= (and b!920582 ((_ is ValueCellFull!9299) mapDefault!31098)) b!920573))

(assert (= start!78822 b!920582))

(declare-fun b_lambda!13537 () Bool)

(assert (=> (not b_lambda!13537) (not b!920584)))

(declare-fun t!26394 () Bool)

(declare-fun tb!5625 () Bool)

(assert (=> (and start!78822 (= defaultEntry!1235 defaultEntry!1235) t!26394) tb!5625))

(declare-fun result!11081 () Bool)

(assert (=> tb!5625 (= result!11081 tp_is_empty!19561)))

(assert (=> b!920584 t!26394))

(declare-fun b_and!27819 () Bool)

(assert (= b_and!27817 (and (=> t!26394 result!11081) b_and!27819)))

(declare-fun m!853987 () Bool)

(assert (=> b!920587 m!853987))

(declare-fun m!853989 () Bool)

(assert (=> b!920578 m!853989))

(declare-fun m!853991 () Bool)

(assert (=> b!920578 m!853991))

(declare-fun m!853993 () Bool)

(assert (=> start!78822 m!853993))

(declare-fun m!853995 () Bool)

(assert (=> start!78822 m!853995))

(declare-fun m!853997 () Bool)

(assert (=> start!78822 m!853997))

(declare-fun m!853999 () Bool)

(assert (=> b!920584 m!853999))

(declare-fun m!854001 () Bool)

(assert (=> b!920584 m!854001))

(declare-fun m!854003 () Bool)

(assert (=> b!920584 m!854003))

(assert (=> b!920584 m!853999))

(declare-fun m!854005 () Bool)

(assert (=> b!920584 m!854005))

(declare-fun m!854007 () Bool)

(assert (=> b!920584 m!854007))

(declare-fun m!854009 () Bool)

(assert (=> b!920584 m!854009))

(declare-fun m!854011 () Bool)

(assert (=> b!920584 m!854011))

(declare-fun m!854013 () Bool)

(assert (=> b!920584 m!854013))

(assert (=> b!920584 m!854007))

(assert (=> b!920584 m!854013))

(declare-fun m!854015 () Bool)

(assert (=> b!920584 m!854015))

(declare-fun m!854017 () Bool)

(assert (=> b!920584 m!854017))

(declare-fun m!854019 () Bool)

(assert (=> b!920584 m!854019))

(declare-fun m!854021 () Bool)

(assert (=> b!920584 m!854021))

(assert (=> b!920584 m!854009))

(declare-fun m!854023 () Bool)

(assert (=> b!920584 m!854023))

(declare-fun m!854025 () Bool)

(assert (=> b!920580 m!854025))

(declare-fun m!854027 () Bool)

(assert (=> b!920575 m!854027))

(declare-fun m!854029 () Bool)

(assert (=> mapNonEmpty!31098 m!854029))

(declare-fun m!854031 () Bool)

(assert (=> b!920586 m!854031))

(declare-fun m!854033 () Bool)

(assert (=> b!920572 m!854033))

(declare-fun m!854035 () Bool)

(assert (=> b!920589 m!854035))

(declare-fun m!854037 () Bool)

(assert (=> b!920589 m!854037))

(declare-fun m!854039 () Bool)

(assert (=> b!920588 m!854039))

(declare-fun m!854041 () Bool)

(assert (=> b!920574 m!854041))

(declare-fun m!854043 () Bool)

(assert (=> b!920581 m!854043))

(check-sat (not b_lambda!13537) (not b!920586) (not b!920584) (not start!78822) (not b!920581) (not b!920574) (not b!920572) (not b_next!17053) (not b!920587) (not b!920580) b_and!27819 (not b!920575) (not b!920578) (not b!920589) (not b!920588) tp_is_empty!19561 (not mapNonEmpty!31098))
(check-sat b_and!27819 (not b_next!17053))
