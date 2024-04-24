; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78822 () Bool)

(assert start!78822)

(declare-fun b_free!16867 () Bool)

(declare-fun b_next!16867 () Bool)

(assert (=> start!78822 (= b_free!16867 (not b_next!16867))))

(declare-fun tp!59043 () Bool)

(declare-fun b_and!27499 () Bool)

(assert (=> start!78822 (= tp!59043 b_and!27499)))

(declare-fun b!917874 () Bool)

(declare-fun e!515371 () Bool)

(declare-fun tp_is_empty!19375 () Bool)

(assert (=> b!917874 (= e!515371 tp_is_empty!19375)))

(declare-fun mapIsEmpty!30819 () Bool)

(declare-fun mapRes!30819 () Bool)

(assert (=> mapIsEmpty!30819 mapRes!30819))

(declare-fun b!917875 () Bool)

(declare-fun e!515372 () Bool)

(assert (=> b!917875 (= e!515372 tp_is_empty!19375)))

(declare-fun mapNonEmpty!30819 () Bool)

(declare-fun tp!59042 () Bool)

(assert (=> mapNonEmpty!30819 (= mapRes!30819 (and tp!59042 e!515372))))

(declare-fun mapKey!30819 () (_ BitVec 32))

(declare-datatypes ((V!30799 0))(
  ( (V!30800 (val!9738 Int)) )
))
(declare-datatypes ((ValueCell!9206 0))(
  ( (ValueCellFull!9206 (v!12253 V!30799)) (EmptyCell!9206) )
))
(declare-datatypes ((array!54783 0))(
  ( (array!54784 (arr!26332 (Array (_ BitVec 32) ValueCell!9206)) (size!26792 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54783)

(declare-fun mapValue!30819 () ValueCell!9206)

(declare-fun mapRest!30819 () (Array (_ BitVec 32) ValueCell!9206))

(assert (=> mapNonEmpty!30819 (= (arr!26332 _values!1231) (store mapRest!30819 mapKey!30819 mapValue!30819))))

(declare-fun b!917876 () Bool)

(declare-fun res!618517 () Bool)

(declare-fun e!515369 () Bool)

(assert (=> b!917876 (=> (not res!618517) (not e!515369))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54785 0))(
  ( (array!54786 (arr!26333 (Array (_ BitVec 32) (_ BitVec 64))) (size!26793 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54785)

(assert (=> b!917876 (= res!618517 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26793 _keys!1487))))))

(declare-fun b!917878 () Bool)

(declare-fun res!618519 () Bool)

(assert (=> b!917878 (=> (not res!618519) (not e!515369))))

(declare-datatypes ((List!18432 0))(
  ( (Nil!18429) (Cons!18428 (h!19580 (_ BitVec 64)) (t!26037 List!18432)) )
))
(declare-fun arrayNoDuplicates!0 (array!54785 (_ BitVec 32) List!18432) Bool)

(assert (=> b!917878 (= res!618519 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18429))))

(declare-fun b!917879 () Bool)

(declare-fun res!618518 () Bool)

(assert (=> b!917879 (=> (not res!618518) (not e!515369))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54785 (_ BitVec 32)) Bool)

(assert (=> b!917879 (= res!618518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!618516 () Bool)

(assert (=> start!78822 (=> (not res!618516) (not e!515369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78822 (= res!618516 (validMask!0 mask!1881))))

(assert (=> start!78822 e!515369))

(assert (=> start!78822 true))

(declare-fun e!515374 () Bool)

(declare-fun array_inv!20638 (array!54783) Bool)

(assert (=> start!78822 (and (array_inv!20638 _values!1231) e!515374)))

(assert (=> start!78822 tp!59043))

(declare-fun array_inv!20639 (array!54785) Bool)

(assert (=> start!78822 (array_inv!20639 _keys!1487)))

(assert (=> start!78822 tp_is_empty!19375))

(declare-fun b!917877 () Bool)

(declare-fun e!515370 () Bool)

(assert (=> b!917877 (= e!515370 false)))

(declare-fun lt!412270 () V!30799)

(declare-datatypes ((tuple2!12608 0))(
  ( (tuple2!12609 (_1!6315 (_ BitVec 64)) (_2!6315 V!30799)) )
))
(declare-datatypes ((List!18433 0))(
  ( (Nil!18430) (Cons!18429 (h!19581 tuple2!12608) (t!26038 List!18433)) )
))
(declare-datatypes ((ListLongMap!11307 0))(
  ( (ListLongMap!11308 (toList!5669 List!18433)) )
))
(declare-fun lt!412271 () ListLongMap!11307)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!551 (ListLongMap!11307 (_ BitVec 64)) V!30799)

(assert (=> b!917877 (= lt!412270 (apply!551 lt!412271 k0!1099))))

(declare-fun b!917880 () Bool)

(declare-fun res!618514 () Bool)

(assert (=> b!917880 (=> (not res!618514) (not e!515369))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!917880 (= res!618514 (and (= (size!26792 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26793 _keys!1487) (size!26792 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917881 () Bool)

(assert (=> b!917881 (= e!515374 (and e!515371 mapRes!30819))))

(declare-fun condMapEmpty!30819 () Bool)

(declare-fun mapDefault!30819 () ValueCell!9206)

(assert (=> b!917881 (= condMapEmpty!30819 (= (arr!26332 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9206)) mapDefault!30819)))))

(declare-fun b!917882 () Bool)

(assert (=> b!917882 (= e!515369 e!515370)))

(declare-fun res!618515 () Bool)

(assert (=> b!917882 (=> (not res!618515) (not e!515370))))

(declare-fun contains!4727 (ListLongMap!11307 (_ BitVec 64)) Bool)

(assert (=> b!917882 (= res!618515 (contains!4727 lt!412271 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30799)

(declare-fun minValue!1173 () V!30799)

(declare-fun getCurrentListMap!2924 (array!54785 array!54783 (_ BitVec 32) (_ BitVec 32) V!30799 V!30799 (_ BitVec 32) Int) ListLongMap!11307)

(assert (=> b!917882 (= lt!412271 (getCurrentListMap!2924 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!78822 res!618516) b!917880))

(assert (= (and b!917880 res!618514) b!917879))

(assert (= (and b!917879 res!618518) b!917878))

(assert (= (and b!917878 res!618519) b!917876))

(assert (= (and b!917876 res!618517) b!917882))

(assert (= (and b!917882 res!618515) b!917877))

(assert (= (and b!917881 condMapEmpty!30819) mapIsEmpty!30819))

(assert (= (and b!917881 (not condMapEmpty!30819)) mapNonEmpty!30819))

(get-info :version)

(assert (= (and mapNonEmpty!30819 ((_ is ValueCellFull!9206) mapValue!30819)) b!917875))

(assert (= (and b!917881 ((_ is ValueCellFull!9206) mapDefault!30819)) b!917874))

(assert (= start!78822 b!917881))

(declare-fun m!852115 () Bool)

(assert (=> b!917877 m!852115))

(declare-fun m!852117 () Bool)

(assert (=> b!917878 m!852117))

(declare-fun m!852119 () Bool)

(assert (=> b!917882 m!852119))

(declare-fun m!852121 () Bool)

(assert (=> b!917882 m!852121))

(declare-fun m!852123 () Bool)

(assert (=> mapNonEmpty!30819 m!852123))

(declare-fun m!852125 () Bool)

(assert (=> start!78822 m!852125))

(declare-fun m!852127 () Bool)

(assert (=> start!78822 m!852127))

(declare-fun m!852129 () Bool)

(assert (=> start!78822 m!852129))

(declare-fun m!852131 () Bool)

(assert (=> b!917879 m!852131))

(check-sat (not b_next!16867) (not b!917882) (not b!917879) (not mapNonEmpty!30819) b_and!27499 (not start!78822) tp_is_empty!19375 (not b!917878) (not b!917877))
(check-sat b_and!27499 (not b_next!16867))
