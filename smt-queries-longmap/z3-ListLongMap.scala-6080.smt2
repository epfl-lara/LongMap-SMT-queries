; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78756 () Bool)

(assert start!78756)

(declare-fun b_free!16801 () Bool)

(declare-fun b_next!16801 () Bool)

(assert (=> start!78756 (= b_free!16801 (not b_next!16801))))

(declare-fun tp!58845 () Bool)

(declare-fun b_and!27433 () Bool)

(assert (=> start!78756 (= tp!58845 b_and!27433)))

(declare-fun res!617947 () Bool)

(declare-fun e!514809 () Bool)

(assert (=> start!78756 (=> (not res!617947) (not e!514809))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78756 (= res!617947 (validMask!0 mask!1881))))

(assert (=> start!78756 e!514809))

(assert (=> start!78756 true))

(declare-datatypes ((V!30711 0))(
  ( (V!30712 (val!9705 Int)) )
))
(declare-datatypes ((ValueCell!9173 0))(
  ( (ValueCellFull!9173 (v!12220 V!30711)) (EmptyCell!9173) )
))
(declare-datatypes ((array!54659 0))(
  ( (array!54660 (arr!26270 (Array (_ BitVec 32) ValueCell!9173)) (size!26730 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54659)

(declare-fun e!514811 () Bool)

(declare-fun array_inv!20600 (array!54659) Bool)

(assert (=> start!78756 (and (array_inv!20600 _values!1231) e!514811)))

(assert (=> start!78756 tp!58845))

(declare-datatypes ((array!54661 0))(
  ( (array!54662 (arr!26271 (Array (_ BitVec 32) (_ BitVec 64))) (size!26731 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54661)

(declare-fun array_inv!20601 (array!54661) Bool)

(assert (=> start!78756 (array_inv!20601 _keys!1487)))

(declare-fun tp_is_empty!19309 () Bool)

(assert (=> start!78756 tp_is_empty!19309))

(declare-fun mapNonEmpty!30720 () Bool)

(declare-fun mapRes!30720 () Bool)

(declare-fun tp!58844 () Bool)

(declare-fun e!514812 () Bool)

(assert (=> mapNonEmpty!30720 (= mapRes!30720 (and tp!58844 e!514812))))

(declare-fun mapKey!30720 () (_ BitVec 32))

(declare-fun mapValue!30720 () ValueCell!9173)

(declare-fun mapRest!30720 () (Array (_ BitVec 32) ValueCell!9173))

(assert (=> mapNonEmpty!30720 (= (arr!26270 _values!1231) (store mapRest!30720 mapKey!30720 mapValue!30720))))

(declare-fun b!917008 () Bool)

(assert (=> b!917008 (= e!514809 false)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun lt!412115 () Bool)

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30711)

(declare-fun minValue!1173 () V!30711)

(declare-datatypes ((tuple2!12554 0))(
  ( (tuple2!12555 (_1!6288 (_ BitVec 64)) (_2!6288 V!30711)) )
))
(declare-datatypes ((List!18387 0))(
  ( (Nil!18384) (Cons!18383 (h!19535 tuple2!12554) (t!25992 List!18387)) )
))
(declare-datatypes ((ListLongMap!11253 0))(
  ( (ListLongMap!11254 (toList!5642 List!18387)) )
))
(declare-fun contains!4704 (ListLongMap!11253 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2901 (array!54661 array!54659 (_ BitVec 32) (_ BitVec 32) V!30711 V!30711 (_ BitVec 32) Int) ListLongMap!11253)

(assert (=> b!917008 (= lt!412115 (contains!4704 (getCurrentListMap!2901 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun b!917009 () Bool)

(declare-fun res!617945 () Bool)

(assert (=> b!917009 (=> (not res!617945) (not e!514809))))

(assert (=> b!917009 (= res!617945 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26731 _keys!1487))))))

(declare-fun b!917010 () Bool)

(declare-fun e!514810 () Bool)

(assert (=> b!917010 (= e!514811 (and e!514810 mapRes!30720))))

(declare-fun condMapEmpty!30720 () Bool)

(declare-fun mapDefault!30720 () ValueCell!9173)

(assert (=> b!917010 (= condMapEmpty!30720 (= (arr!26270 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9173)) mapDefault!30720)))))

(declare-fun b!917011 () Bool)

(assert (=> b!917011 (= e!514810 tp_is_empty!19309)))

(declare-fun b!917012 () Bool)

(declare-fun res!617946 () Bool)

(assert (=> b!917012 (=> (not res!617946) (not e!514809))))

(declare-datatypes ((List!18388 0))(
  ( (Nil!18385) (Cons!18384 (h!19536 (_ BitVec 64)) (t!25993 List!18388)) )
))
(declare-fun arrayNoDuplicates!0 (array!54661 (_ BitVec 32) List!18388) Bool)

(assert (=> b!917012 (= res!617946 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18385))))

(declare-fun b!917013 () Bool)

(declare-fun res!617948 () Bool)

(assert (=> b!917013 (=> (not res!617948) (not e!514809))))

(assert (=> b!917013 (= res!617948 (and (= (size!26730 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26731 _keys!1487) (size!26730 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917014 () Bool)

(declare-fun res!617949 () Bool)

(assert (=> b!917014 (=> (not res!617949) (not e!514809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54661 (_ BitVec 32)) Bool)

(assert (=> b!917014 (= res!617949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917015 () Bool)

(assert (=> b!917015 (= e!514812 tp_is_empty!19309)))

(declare-fun mapIsEmpty!30720 () Bool)

(assert (=> mapIsEmpty!30720 mapRes!30720))

(assert (= (and start!78756 res!617947) b!917013))

(assert (= (and b!917013 res!617948) b!917014))

(assert (= (and b!917014 res!617949) b!917012))

(assert (= (and b!917012 res!617946) b!917009))

(assert (= (and b!917009 res!617945) b!917008))

(assert (= (and b!917010 condMapEmpty!30720) mapIsEmpty!30720))

(assert (= (and b!917010 (not condMapEmpty!30720)) mapNonEmpty!30720))

(get-info :version)

(assert (= (and mapNonEmpty!30720 ((_ is ValueCellFull!9173) mapValue!30720)) b!917015))

(assert (= (and b!917010 ((_ is ValueCellFull!9173) mapDefault!30720)) b!917011))

(assert (= start!78756 b!917010))

(declare-fun m!851545 () Bool)

(assert (=> b!917012 m!851545))

(declare-fun m!851547 () Bool)

(assert (=> mapNonEmpty!30720 m!851547))

(declare-fun m!851549 () Bool)

(assert (=> b!917014 m!851549))

(declare-fun m!851551 () Bool)

(assert (=> start!78756 m!851551))

(declare-fun m!851553 () Bool)

(assert (=> start!78756 m!851553))

(declare-fun m!851555 () Bool)

(assert (=> start!78756 m!851555))

(declare-fun m!851557 () Bool)

(assert (=> b!917008 m!851557))

(assert (=> b!917008 m!851557))

(declare-fun m!851559 () Bool)

(assert (=> b!917008 m!851559))

(check-sat (not b!917008) (not b!917012) (not start!78756) b_and!27433 (not b!917014) (not b_next!16801) tp_is_empty!19309 (not mapNonEmpty!30720))
(check-sat b_and!27433 (not b_next!16801))
