; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78834 () Bool)

(assert start!78834)

(declare-fun b_free!16879 () Bool)

(declare-fun b_next!16879 () Bool)

(assert (=> start!78834 (= b_free!16879 (not b_next!16879))))

(declare-fun tp!59079 () Bool)

(declare-fun b_and!27511 () Bool)

(assert (=> start!78834 (= tp!59079 b_and!27511)))

(declare-fun b!918036 () Bool)

(declare-fun e!515482 () Bool)

(assert (=> b!918036 (= e!515482 false)))

(declare-datatypes ((V!30815 0))(
  ( (V!30816 (val!9744 Int)) )
))
(declare-fun lt!412306 () V!30815)

(declare-datatypes ((tuple2!12616 0))(
  ( (tuple2!12617 (_1!6319 (_ BitVec 64)) (_2!6319 V!30815)) )
))
(declare-datatypes ((List!18440 0))(
  ( (Nil!18437) (Cons!18436 (h!19588 tuple2!12616) (t!26045 List!18440)) )
))
(declare-datatypes ((ListLongMap!11315 0))(
  ( (ListLongMap!11316 (toList!5673 List!18440)) )
))
(declare-fun lt!412307 () ListLongMap!11315)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!554 (ListLongMap!11315 (_ BitVec 64)) V!30815)

(assert (=> b!918036 (= lt!412306 (apply!554 lt!412307 k0!1099))))

(declare-fun b!918037 () Bool)

(declare-fun res!618622 () Bool)

(declare-fun e!515478 () Bool)

(assert (=> b!918037 (=> (not res!618622) (not e!515478))))

(declare-datatypes ((array!54807 0))(
  ( (array!54808 (arr!26344 (Array (_ BitVec 32) (_ BitVec 64))) (size!26804 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54807)

(declare-datatypes ((List!18441 0))(
  ( (Nil!18438) (Cons!18437 (h!19589 (_ BitVec 64)) (t!26046 List!18441)) )
))
(declare-fun arrayNoDuplicates!0 (array!54807 (_ BitVec 32) List!18441) Bool)

(assert (=> b!918037 (= res!618622 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18438))))

(declare-fun b!918038 () Bool)

(assert (=> b!918038 (= e!515478 e!515482)))

(declare-fun res!618627 () Bool)

(assert (=> b!918038 (=> (not res!618627) (not e!515482))))

(declare-fun contains!4731 (ListLongMap!11315 (_ BitVec 64)) Bool)

(assert (=> b!918038 (= res!618627 (contains!4731 lt!412307 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9212 0))(
  ( (ValueCellFull!9212 (v!12259 V!30815)) (EmptyCell!9212) )
))
(declare-datatypes ((array!54809 0))(
  ( (array!54810 (arr!26345 (Array (_ BitVec 32) ValueCell!9212)) (size!26805 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54809)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30815)

(declare-fun minValue!1173 () V!30815)

(declare-fun getCurrentListMap!2928 (array!54807 array!54809 (_ BitVec 32) (_ BitVec 32) V!30815 V!30815 (_ BitVec 32) Int) ListLongMap!11315)

(assert (=> b!918038 (= lt!412307 (getCurrentListMap!2928 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!918039 () Bool)

(declare-fun res!618624 () Bool)

(assert (=> b!918039 (=> (not res!618624) (not e!515478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54807 (_ BitVec 32)) Bool)

(assert (=> b!918039 (= res!618624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918040 () Bool)

(declare-fun e!515479 () Bool)

(declare-fun tp_is_empty!19387 () Bool)

(assert (=> b!918040 (= e!515479 tp_is_empty!19387)))

(declare-fun mapIsEmpty!30837 () Bool)

(declare-fun mapRes!30837 () Bool)

(assert (=> mapIsEmpty!30837 mapRes!30837))

(declare-fun res!618625 () Bool)

(assert (=> start!78834 (=> (not res!618625) (not e!515478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78834 (= res!618625 (validMask!0 mask!1881))))

(assert (=> start!78834 e!515478))

(assert (=> start!78834 true))

(declare-fun e!515480 () Bool)

(declare-fun array_inv!20644 (array!54809) Bool)

(assert (=> start!78834 (and (array_inv!20644 _values!1231) e!515480)))

(assert (=> start!78834 tp!59079))

(declare-fun array_inv!20645 (array!54807) Bool)

(assert (=> start!78834 (array_inv!20645 _keys!1487)))

(assert (=> start!78834 tp_is_empty!19387))

(declare-fun b!918041 () Bool)

(declare-fun e!515477 () Bool)

(assert (=> b!918041 (= e!515477 tp_is_empty!19387)))

(declare-fun b!918042 () Bool)

(assert (=> b!918042 (= e!515480 (and e!515477 mapRes!30837))))

(declare-fun condMapEmpty!30837 () Bool)

(declare-fun mapDefault!30837 () ValueCell!9212)

(assert (=> b!918042 (= condMapEmpty!30837 (= (arr!26345 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9212)) mapDefault!30837)))))

(declare-fun b!918043 () Bool)

(declare-fun res!618623 () Bool)

(assert (=> b!918043 (=> (not res!618623) (not e!515478))))

(assert (=> b!918043 (= res!618623 (and (= (size!26805 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26804 _keys!1487) (size!26805 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30837 () Bool)

(declare-fun tp!59078 () Bool)

(assert (=> mapNonEmpty!30837 (= mapRes!30837 (and tp!59078 e!515479))))

(declare-fun mapValue!30837 () ValueCell!9212)

(declare-fun mapRest!30837 () (Array (_ BitVec 32) ValueCell!9212))

(declare-fun mapKey!30837 () (_ BitVec 32))

(assert (=> mapNonEmpty!30837 (= (arr!26345 _values!1231) (store mapRest!30837 mapKey!30837 mapValue!30837))))

(declare-fun b!918044 () Bool)

(declare-fun res!618626 () Bool)

(assert (=> b!918044 (=> (not res!618626) (not e!515478))))

(assert (=> b!918044 (= res!618626 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26804 _keys!1487))))))

(assert (= (and start!78834 res!618625) b!918043))

(assert (= (and b!918043 res!618623) b!918039))

(assert (= (and b!918039 res!618624) b!918037))

(assert (= (and b!918037 res!618622) b!918044))

(assert (= (and b!918044 res!618626) b!918038))

(assert (= (and b!918038 res!618627) b!918036))

(assert (= (and b!918042 condMapEmpty!30837) mapIsEmpty!30837))

(assert (= (and b!918042 (not condMapEmpty!30837)) mapNonEmpty!30837))

(get-info :version)

(assert (= (and mapNonEmpty!30837 ((_ is ValueCellFull!9212) mapValue!30837)) b!918040))

(assert (= (and b!918042 ((_ is ValueCellFull!9212) mapDefault!30837)) b!918041))

(assert (= start!78834 b!918042))

(declare-fun m!852223 () Bool)

(assert (=> start!78834 m!852223))

(declare-fun m!852225 () Bool)

(assert (=> start!78834 m!852225))

(declare-fun m!852227 () Bool)

(assert (=> start!78834 m!852227))

(declare-fun m!852229 () Bool)

(assert (=> b!918038 m!852229))

(declare-fun m!852231 () Bool)

(assert (=> b!918038 m!852231))

(declare-fun m!852233 () Bool)

(assert (=> b!918039 m!852233))

(declare-fun m!852235 () Bool)

(assert (=> b!918036 m!852235))

(declare-fun m!852237 () Bool)

(assert (=> b!918037 m!852237))

(declare-fun m!852239 () Bool)

(assert (=> mapNonEmpty!30837 m!852239))

(check-sat (not b_next!16879) tp_is_empty!19387 (not b!918036) b_and!27511 (not mapNonEmpty!30837) (not b!918039) (not start!78834) (not b!918038) (not b!918037))
(check-sat b_and!27511 (not b_next!16879))
