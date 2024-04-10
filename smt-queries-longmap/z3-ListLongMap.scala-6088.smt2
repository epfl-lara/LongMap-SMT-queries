; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78638 () Bool)

(assert start!78638)

(declare-fun b_free!16851 () Bool)

(declare-fun b_next!16851 () Bool)

(assert (=> start!78638 (= b_free!16851 (not b_next!16851))))

(declare-fun tp!58993 () Bool)

(declare-fun b_and!27473 () Bool)

(assert (=> start!78638 (= tp!58993 b_and!27473)))

(declare-fun b!916755 () Bool)

(declare-fun e!514646 () Bool)

(declare-fun tp_is_empty!19359 () Bool)

(assert (=> b!916755 (= e!514646 tp_is_empty!19359)))

(declare-fun mapIsEmpty!30795 () Bool)

(declare-fun mapRes!30795 () Bool)

(assert (=> mapIsEmpty!30795 mapRes!30795))

(declare-fun b!916756 () Bool)

(declare-fun res!618028 () Bool)

(declare-fun e!514643 () Bool)

(assert (=> b!916756 (=> (not res!618028) (not e!514643))))

(declare-datatypes ((array!54704 0))(
  ( (array!54705 (arr!26297 (Array (_ BitVec 32) (_ BitVec 64))) (size!26756 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54704)

(declare-datatypes ((List!18438 0))(
  ( (Nil!18435) (Cons!18434 (h!19580 (_ BitVec 64)) (t!26051 List!18438)) )
))
(declare-fun arrayNoDuplicates!0 (array!54704 (_ BitVec 32) List!18438) Bool)

(assert (=> b!916756 (= res!618028 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18435))))

(declare-fun b!916757 () Bool)

(declare-fun e!514647 () Bool)

(assert (=> b!916757 (= e!514647 false)))

(declare-datatypes ((V!30777 0))(
  ( (V!30778 (val!9730 Int)) )
))
(declare-fun lt!411862 () V!30777)

(declare-datatypes ((tuple2!12626 0))(
  ( (tuple2!12627 (_1!6324 (_ BitVec 64)) (_2!6324 V!30777)) )
))
(declare-datatypes ((List!18439 0))(
  ( (Nil!18436) (Cons!18435 (h!19581 tuple2!12626) (t!26052 List!18439)) )
))
(declare-datatypes ((ListLongMap!11323 0))(
  ( (ListLongMap!11324 (toList!5677 List!18439)) )
))
(declare-fun lt!411861 () ListLongMap!11323)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!534 (ListLongMap!11323 (_ BitVec 64)) V!30777)

(assert (=> b!916757 (= lt!411862 (apply!534 lt!411861 k0!1099))))

(declare-fun b!916758 () Bool)

(assert (=> b!916758 (= e!514643 e!514647)))

(declare-fun res!618029 () Bool)

(assert (=> b!916758 (=> (not res!618029) (not e!514647))))

(declare-fun contains!4730 (ListLongMap!11323 (_ BitVec 64)) Bool)

(assert (=> b!916758 (= res!618029 (contains!4730 lt!411861 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9198 0))(
  ( (ValueCellFull!9198 (v!12248 V!30777)) (EmptyCell!9198) )
))
(declare-datatypes ((array!54706 0))(
  ( (array!54707 (arr!26298 (Array (_ BitVec 32) ValueCell!9198)) (size!26757 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54706)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30777)

(declare-fun minValue!1173 () V!30777)

(declare-fun getCurrentListMap!2937 (array!54704 array!54706 (_ BitVec 32) (_ BitVec 32) V!30777 V!30777 (_ BitVec 32) Int) ListLongMap!11323)

(assert (=> b!916758 (= lt!411861 (getCurrentListMap!2937 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!916759 () Bool)

(declare-fun res!618026 () Bool)

(assert (=> b!916759 (=> (not res!618026) (not e!514643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54704 (_ BitVec 32)) Bool)

(assert (=> b!916759 (= res!618026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916760 () Bool)

(declare-fun res!618031 () Bool)

(assert (=> b!916760 (=> (not res!618031) (not e!514643))))

(assert (=> b!916760 (= res!618031 (and (= (size!26757 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26756 _keys!1487) (size!26757 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916761 () Bool)

(declare-fun e!514644 () Bool)

(assert (=> b!916761 (= e!514644 tp_is_empty!19359)))

(declare-fun b!916762 () Bool)

(declare-fun e!514648 () Bool)

(assert (=> b!916762 (= e!514648 (and e!514644 mapRes!30795))))

(declare-fun condMapEmpty!30795 () Bool)

(declare-fun mapDefault!30795 () ValueCell!9198)

(assert (=> b!916762 (= condMapEmpty!30795 (= (arr!26298 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9198)) mapDefault!30795)))))

(declare-fun b!916763 () Bool)

(declare-fun res!618030 () Bool)

(assert (=> b!916763 (=> (not res!618030) (not e!514643))))

(assert (=> b!916763 (= res!618030 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26756 _keys!1487))))))

(declare-fun mapNonEmpty!30795 () Bool)

(declare-fun tp!58994 () Bool)

(assert (=> mapNonEmpty!30795 (= mapRes!30795 (and tp!58994 e!514646))))

(declare-fun mapKey!30795 () (_ BitVec 32))

(declare-fun mapRest!30795 () (Array (_ BitVec 32) ValueCell!9198))

(declare-fun mapValue!30795 () ValueCell!9198)

(assert (=> mapNonEmpty!30795 (= (arr!26298 _values!1231) (store mapRest!30795 mapKey!30795 mapValue!30795))))

(declare-fun res!618027 () Bool)

(assert (=> start!78638 (=> (not res!618027) (not e!514643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78638 (= res!618027 (validMask!0 mask!1881))))

(assert (=> start!78638 e!514643))

(assert (=> start!78638 true))

(declare-fun array_inv!20510 (array!54706) Bool)

(assert (=> start!78638 (and (array_inv!20510 _values!1231) e!514648)))

(assert (=> start!78638 tp!58993))

(declare-fun array_inv!20511 (array!54704) Bool)

(assert (=> start!78638 (array_inv!20511 _keys!1487)))

(assert (=> start!78638 tp_is_empty!19359))

(assert (= (and start!78638 res!618027) b!916760))

(assert (= (and b!916760 res!618031) b!916759))

(assert (= (and b!916759 res!618026) b!916756))

(assert (= (and b!916756 res!618028) b!916763))

(assert (= (and b!916763 res!618030) b!916758))

(assert (= (and b!916758 res!618029) b!916757))

(assert (= (and b!916762 condMapEmpty!30795) mapIsEmpty!30795))

(assert (= (and b!916762 (not condMapEmpty!30795)) mapNonEmpty!30795))

(get-info :version)

(assert (= (and mapNonEmpty!30795 ((_ is ValueCellFull!9198) mapValue!30795)) b!916755))

(assert (= (and b!916762 ((_ is ValueCellFull!9198) mapDefault!30795)) b!916761))

(assert (= start!78638 b!916762))

(declare-fun m!850677 () Bool)

(assert (=> b!916759 m!850677))

(declare-fun m!850679 () Bool)

(assert (=> mapNonEmpty!30795 m!850679))

(declare-fun m!850681 () Bool)

(assert (=> b!916756 m!850681))

(declare-fun m!850683 () Bool)

(assert (=> start!78638 m!850683))

(declare-fun m!850685 () Bool)

(assert (=> start!78638 m!850685))

(declare-fun m!850687 () Bool)

(assert (=> start!78638 m!850687))

(declare-fun m!850689 () Bool)

(assert (=> b!916757 m!850689))

(declare-fun m!850691 () Bool)

(assert (=> b!916758 m!850691))

(declare-fun m!850693 () Bool)

(assert (=> b!916758 m!850693))

(check-sat (not b_next!16851) (not mapNonEmpty!30795) (not b!916758) (not start!78638) (not b!916757) (not b!916759) (not b!916756) b_and!27473 tp_is_empty!19359)
(check-sat b_and!27473 (not b_next!16851))
