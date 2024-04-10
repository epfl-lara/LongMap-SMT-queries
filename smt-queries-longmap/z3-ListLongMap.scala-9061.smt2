; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109152 () Bool)

(assert start!109152)

(declare-fun b_free!28641 () Bool)

(declare-fun b_next!28641 () Bool)

(assert (=> start!109152 (= b_free!28641 (not b_next!28641))))

(declare-fun tp!101041 () Bool)

(declare-fun b_and!46731 () Bool)

(assert (=> start!109152 (= tp!101041 b_and!46731)))

(declare-fun b!1290821 () Bool)

(declare-fun res!857558 () Bool)

(declare-fun e!736909 () Bool)

(assert (=> b!1290821 (=> (not res!857558) (not e!736909))))

(declare-datatypes ((array!85600 0))(
  ( (array!85601 (arr!41301 (Array (_ BitVec 32) (_ BitVec 64))) (size!41851 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85600)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85600 (_ BitVec 32)) Bool)

(assert (=> b!1290821 (= res!857558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290822 () Bool)

(declare-fun res!857556 () Bool)

(assert (=> b!1290822 (=> (not res!857556) (not e!736909))))

(declare-datatypes ((V!50811 0))(
  ( (V!50812 (val!17215 Int)) )
))
(declare-fun minValue!1387 () V!50811)

(declare-fun zeroValue!1387 () V!50811)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16242 0))(
  ( (ValueCellFull!16242 (v!19818 V!50811)) (EmptyCell!16242) )
))
(declare-datatypes ((array!85602 0))(
  ( (array!85603 (arr!41302 (Array (_ BitVec 32) ValueCell!16242)) (size!41852 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85602)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22126 0))(
  ( (tuple2!22127 (_1!11074 (_ BitVec 64)) (_2!11074 V!50811)) )
))
(declare-datatypes ((List!29288 0))(
  ( (Nil!29285) (Cons!29284 (h!30493 tuple2!22126) (t!42852 List!29288)) )
))
(declare-datatypes ((ListLongMap!19783 0))(
  ( (ListLongMap!19784 (toList!9907 List!29288)) )
))
(declare-fun contains!8025 (ListLongMap!19783 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4961 (array!85600 array!85602 (_ BitVec 32) (_ BitVec 32) V!50811 V!50811 (_ BitVec 32) Int) ListLongMap!19783)

(assert (=> b!1290822 (= res!857556 (contains!8025 (getCurrentListMap!4961 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290823 () Bool)

(declare-fun e!736905 () Bool)

(assert (=> b!1290823 (= e!736905 true)))

(assert (=> b!1290823 false))

(declare-fun lt!578818 () ListLongMap!19783)

(declare-datatypes ((Unit!42728 0))(
  ( (Unit!42729) )
))
(declare-fun lt!578822 () Unit!42728)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!47 ((_ BitVec 64) (_ BitVec 64) V!50811 ListLongMap!19783) Unit!42728)

(assert (=> b!1290823 (= lt!578822 (lemmaInListMapAfterAddingDiffThenInBefore!47 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578818))))

(declare-fun lt!578820 () ListLongMap!19783)

(declare-fun +!4373 (ListLongMap!19783 tuple2!22126) ListLongMap!19783)

(assert (=> b!1290823 (not (contains!8025 (+!4373 lt!578820 (tuple2!22127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578819 () Unit!42728)

(declare-fun addStillNotContains!391 (ListLongMap!19783 (_ BitVec 64) V!50811 (_ BitVec 64)) Unit!42728)

(assert (=> b!1290823 (= lt!578819 (addStillNotContains!391 lt!578820 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1290823 (not (contains!8025 lt!578818 k0!1205))))

(assert (=> b!1290823 (= lt!578818 (+!4373 lt!578820 (tuple2!22127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578821 () Unit!42728)

(assert (=> b!1290823 (= lt!578821 (addStillNotContains!391 lt!578820 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6004 (array!85600 array!85602 (_ BitVec 32) (_ BitVec 32) V!50811 V!50811 (_ BitVec 32) Int) ListLongMap!19783)

(assert (=> b!1290823 (= lt!578820 (getCurrentListMapNoExtraKeys!6004 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290824 () Bool)

(declare-fun res!857557 () Bool)

(assert (=> b!1290824 (=> (not res!857557) (not e!736909))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290824 (= res!857557 (not (validKeyInArray!0 (select (arr!41301 _keys!1741) from!2144))))))

(declare-fun b!1290825 () Bool)

(declare-fun res!857560 () Bool)

(assert (=> b!1290825 (=> (not res!857560) (not e!736909))))

(assert (=> b!1290825 (= res!857560 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41851 _keys!1741))))))

(declare-fun b!1290826 () Bool)

(declare-fun e!736906 () Bool)

(declare-fun e!736908 () Bool)

(declare-fun mapRes!52982 () Bool)

(assert (=> b!1290826 (= e!736906 (and e!736908 mapRes!52982))))

(declare-fun condMapEmpty!52982 () Bool)

(declare-fun mapDefault!52982 () ValueCell!16242)

(assert (=> b!1290826 (= condMapEmpty!52982 (= (arr!41302 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16242)) mapDefault!52982)))))

(declare-fun res!857559 () Bool)

(assert (=> start!109152 (=> (not res!857559) (not e!736909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109152 (= res!857559 (validMask!0 mask!2175))))

(assert (=> start!109152 e!736909))

(declare-fun tp_is_empty!34281 () Bool)

(assert (=> start!109152 tp_is_empty!34281))

(assert (=> start!109152 true))

(declare-fun array_inv!31299 (array!85602) Bool)

(assert (=> start!109152 (and (array_inv!31299 _values!1445) e!736906)))

(declare-fun array_inv!31300 (array!85600) Bool)

(assert (=> start!109152 (array_inv!31300 _keys!1741)))

(assert (=> start!109152 tp!101041))

(declare-fun b!1290827 () Bool)

(declare-fun res!857554 () Bool)

(assert (=> b!1290827 (=> (not res!857554) (not e!736909))))

(declare-datatypes ((List!29289 0))(
  ( (Nil!29286) (Cons!29285 (h!30494 (_ BitVec 64)) (t!42853 List!29289)) )
))
(declare-fun arrayNoDuplicates!0 (array!85600 (_ BitVec 32) List!29289) Bool)

(assert (=> b!1290827 (= res!857554 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29286))))

(declare-fun mapNonEmpty!52982 () Bool)

(declare-fun tp!101042 () Bool)

(declare-fun e!736907 () Bool)

(assert (=> mapNonEmpty!52982 (= mapRes!52982 (and tp!101042 e!736907))))

(declare-fun mapRest!52982 () (Array (_ BitVec 32) ValueCell!16242))

(declare-fun mapKey!52982 () (_ BitVec 32))

(declare-fun mapValue!52982 () ValueCell!16242)

(assert (=> mapNonEmpty!52982 (= (arr!41302 _values!1445) (store mapRest!52982 mapKey!52982 mapValue!52982))))

(declare-fun b!1290828 () Bool)

(assert (=> b!1290828 (= e!736908 tp_is_empty!34281)))

(declare-fun mapIsEmpty!52982 () Bool)

(assert (=> mapIsEmpty!52982 mapRes!52982))

(declare-fun b!1290829 () Bool)

(declare-fun res!857562 () Bool)

(assert (=> b!1290829 (=> (not res!857562) (not e!736909))))

(assert (=> b!1290829 (= res!857562 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41851 _keys!1741))))))

(declare-fun b!1290830 () Bool)

(assert (=> b!1290830 (= e!736907 tp_is_empty!34281)))

(declare-fun b!1290831 () Bool)

(declare-fun res!857561 () Bool)

(assert (=> b!1290831 (=> (not res!857561) (not e!736909))))

(assert (=> b!1290831 (= res!857561 (and (= (size!41852 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41851 _keys!1741) (size!41852 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290832 () Bool)

(assert (=> b!1290832 (= e!736909 (not e!736905))))

(declare-fun res!857555 () Bool)

(assert (=> b!1290832 (=> res!857555 e!736905)))

(assert (=> b!1290832 (= res!857555 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290832 (not (contains!8025 (ListLongMap!19784 Nil!29285) k0!1205))))

(declare-fun lt!578817 () Unit!42728)

(declare-fun emptyContainsNothing!89 ((_ BitVec 64)) Unit!42728)

(assert (=> b!1290832 (= lt!578817 (emptyContainsNothing!89 k0!1205))))

(assert (= (and start!109152 res!857559) b!1290831))

(assert (= (and b!1290831 res!857561) b!1290821))

(assert (= (and b!1290821 res!857558) b!1290827))

(assert (= (and b!1290827 res!857554) b!1290825))

(assert (= (and b!1290825 res!857560) b!1290822))

(assert (= (and b!1290822 res!857556) b!1290829))

(assert (= (and b!1290829 res!857562) b!1290824))

(assert (= (and b!1290824 res!857557) b!1290832))

(assert (= (and b!1290832 (not res!857555)) b!1290823))

(assert (= (and b!1290826 condMapEmpty!52982) mapIsEmpty!52982))

(assert (= (and b!1290826 (not condMapEmpty!52982)) mapNonEmpty!52982))

(get-info :version)

(assert (= (and mapNonEmpty!52982 ((_ is ValueCellFull!16242) mapValue!52982)) b!1290830))

(assert (= (and b!1290826 ((_ is ValueCellFull!16242) mapDefault!52982)) b!1290828))

(assert (= start!109152 b!1290826))

(declare-fun m!1183455 () Bool)

(assert (=> b!1290823 m!1183455))

(declare-fun m!1183457 () Bool)

(assert (=> b!1290823 m!1183457))

(declare-fun m!1183459 () Bool)

(assert (=> b!1290823 m!1183459))

(declare-fun m!1183461 () Bool)

(assert (=> b!1290823 m!1183461))

(declare-fun m!1183463 () Bool)

(assert (=> b!1290823 m!1183463))

(declare-fun m!1183465 () Bool)

(assert (=> b!1290823 m!1183465))

(assert (=> b!1290823 m!1183457))

(declare-fun m!1183467 () Bool)

(assert (=> b!1290823 m!1183467))

(declare-fun m!1183469 () Bool)

(assert (=> b!1290823 m!1183469))

(declare-fun m!1183471 () Bool)

(assert (=> b!1290832 m!1183471))

(declare-fun m!1183473 () Bool)

(assert (=> b!1290832 m!1183473))

(declare-fun m!1183475 () Bool)

(assert (=> mapNonEmpty!52982 m!1183475))

(declare-fun m!1183477 () Bool)

(assert (=> b!1290821 m!1183477))

(declare-fun m!1183479 () Bool)

(assert (=> start!109152 m!1183479))

(declare-fun m!1183481 () Bool)

(assert (=> start!109152 m!1183481))

(declare-fun m!1183483 () Bool)

(assert (=> start!109152 m!1183483))

(declare-fun m!1183485 () Bool)

(assert (=> b!1290827 m!1183485))

(declare-fun m!1183487 () Bool)

(assert (=> b!1290822 m!1183487))

(assert (=> b!1290822 m!1183487))

(declare-fun m!1183489 () Bool)

(assert (=> b!1290822 m!1183489))

(declare-fun m!1183491 () Bool)

(assert (=> b!1290824 m!1183491))

(assert (=> b!1290824 m!1183491))

(declare-fun m!1183493 () Bool)

(assert (=> b!1290824 m!1183493))

(check-sat (not start!109152) b_and!46731 (not b!1290821) (not b!1290824) (not b!1290827) tp_is_empty!34281 (not mapNonEmpty!52982) (not b!1290823) (not b!1290822) (not b!1290832) (not b_next!28641))
(check-sat b_and!46731 (not b_next!28641))
