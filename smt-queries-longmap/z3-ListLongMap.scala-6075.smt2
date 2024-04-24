; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78726 () Bool)

(assert start!78726)

(declare-fun b_free!16771 () Bool)

(declare-fun b_next!16771 () Bool)

(assert (=> start!78726 (= b_free!16771 (not b_next!16771))))

(declare-fun tp!58755 () Bool)

(declare-fun b_and!27403 () Bool)

(assert (=> start!78726 (= tp!58755 b_and!27403)))

(declare-fun mapIsEmpty!30675 () Bool)

(declare-fun mapRes!30675 () Bool)

(assert (=> mapIsEmpty!30675 mapRes!30675))

(declare-fun b!916648 () Bool)

(declare-fun res!617723 () Bool)

(declare-fun e!514586 () Bool)

(assert (=> b!916648 (=> (not res!617723) (not e!514586))))

(declare-datatypes ((array!54603 0))(
  ( (array!54604 (arr!26242 (Array (_ BitVec 32) (_ BitVec 64))) (size!26702 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54603)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30671 0))(
  ( (V!30672 (val!9690 Int)) )
))
(declare-datatypes ((ValueCell!9158 0))(
  ( (ValueCellFull!9158 (v!12205 V!30671)) (EmptyCell!9158) )
))
(declare-datatypes ((array!54605 0))(
  ( (array!54606 (arr!26243 (Array (_ BitVec 32) ValueCell!9158)) (size!26703 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54605)

(assert (=> b!916648 (= res!617723 (and (= (size!26703 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26702 _keys!1487) (size!26703 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916649 () Bool)

(declare-fun res!617720 () Bool)

(assert (=> b!916649 (=> (not res!617720) (not e!514586))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!916649 (= res!617720 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26702 _keys!1487))))))

(declare-fun res!617721 () Bool)

(assert (=> start!78726 (=> (not res!617721) (not e!514586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78726 (= res!617721 (validMask!0 mask!1881))))

(assert (=> start!78726 e!514586))

(assert (=> start!78726 true))

(declare-fun e!514588 () Bool)

(declare-fun array_inv!20578 (array!54605) Bool)

(assert (=> start!78726 (and (array_inv!20578 _values!1231) e!514588)))

(assert (=> start!78726 tp!58755))

(declare-fun array_inv!20579 (array!54603) Bool)

(assert (=> start!78726 (array_inv!20579 _keys!1487)))

(declare-fun tp_is_empty!19279 () Bool)

(assert (=> start!78726 tp_is_empty!19279))

(declare-fun b!916650 () Bool)

(assert (=> b!916650 (= e!514586 false)))

(declare-fun lt!412070 () Bool)

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30671)

(declare-fun minValue!1173 () V!30671)

(declare-datatypes ((tuple2!12538 0))(
  ( (tuple2!12539 (_1!6280 (_ BitVec 64)) (_2!6280 V!30671)) )
))
(declare-datatypes ((List!18370 0))(
  ( (Nil!18367) (Cons!18366 (h!19518 tuple2!12538) (t!25975 List!18370)) )
))
(declare-datatypes ((ListLongMap!11237 0))(
  ( (ListLongMap!11238 (toList!5634 List!18370)) )
))
(declare-fun contains!4696 (ListLongMap!11237 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2893 (array!54603 array!54605 (_ BitVec 32) (_ BitVec 32) V!30671 V!30671 (_ BitVec 32) Int) ListLongMap!11237)

(assert (=> b!916650 (= lt!412070 (contains!4696 (getCurrentListMap!2893 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun mapNonEmpty!30675 () Bool)

(declare-fun tp!58754 () Bool)

(declare-fun e!514587 () Bool)

(assert (=> mapNonEmpty!30675 (= mapRes!30675 (and tp!58754 e!514587))))

(declare-fun mapValue!30675 () ValueCell!9158)

(declare-fun mapRest!30675 () (Array (_ BitVec 32) ValueCell!9158))

(declare-fun mapKey!30675 () (_ BitVec 32))

(assert (=> mapNonEmpty!30675 (= (arr!26243 _values!1231) (store mapRest!30675 mapKey!30675 mapValue!30675))))

(declare-fun b!916651 () Bool)

(declare-fun e!514584 () Bool)

(assert (=> b!916651 (= e!514588 (and e!514584 mapRes!30675))))

(declare-fun condMapEmpty!30675 () Bool)

(declare-fun mapDefault!30675 () ValueCell!9158)

(assert (=> b!916651 (= condMapEmpty!30675 (= (arr!26243 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9158)) mapDefault!30675)))))

(declare-fun b!916652 () Bool)

(assert (=> b!916652 (= e!514584 tp_is_empty!19279)))

(declare-fun b!916653 () Bool)

(declare-fun res!617724 () Bool)

(assert (=> b!916653 (=> (not res!617724) (not e!514586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54603 (_ BitVec 32)) Bool)

(assert (=> b!916653 (= res!617724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916654 () Bool)

(assert (=> b!916654 (= e!514587 tp_is_empty!19279)))

(declare-fun b!916655 () Bool)

(declare-fun res!617722 () Bool)

(assert (=> b!916655 (=> (not res!617722) (not e!514586))))

(declare-datatypes ((List!18371 0))(
  ( (Nil!18368) (Cons!18367 (h!19519 (_ BitVec 64)) (t!25976 List!18371)) )
))
(declare-fun arrayNoDuplicates!0 (array!54603 (_ BitVec 32) List!18371) Bool)

(assert (=> b!916655 (= res!617722 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18368))))

(assert (= (and start!78726 res!617721) b!916648))

(assert (= (and b!916648 res!617723) b!916653))

(assert (= (and b!916653 res!617724) b!916655))

(assert (= (and b!916655 res!617722) b!916649))

(assert (= (and b!916649 res!617720) b!916650))

(assert (= (and b!916651 condMapEmpty!30675) mapIsEmpty!30675))

(assert (= (and b!916651 (not condMapEmpty!30675)) mapNonEmpty!30675))

(get-info :version)

(assert (= (and mapNonEmpty!30675 ((_ is ValueCellFull!9158) mapValue!30675)) b!916654))

(assert (= (and b!916651 ((_ is ValueCellFull!9158) mapDefault!30675)) b!916652))

(assert (= start!78726 b!916651))

(declare-fun m!851305 () Bool)

(assert (=> b!916655 m!851305))

(declare-fun m!851307 () Bool)

(assert (=> b!916653 m!851307))

(declare-fun m!851309 () Bool)

(assert (=> mapNonEmpty!30675 m!851309))

(declare-fun m!851311 () Bool)

(assert (=> start!78726 m!851311))

(declare-fun m!851313 () Bool)

(assert (=> start!78726 m!851313))

(declare-fun m!851315 () Bool)

(assert (=> start!78726 m!851315))

(declare-fun m!851317 () Bool)

(assert (=> b!916650 m!851317))

(assert (=> b!916650 m!851317))

(declare-fun m!851319 () Bool)

(assert (=> b!916650 m!851319))

(check-sat (not b!916655) (not start!78726) tp_is_empty!19279 (not b!916650) (not b!916653) b_and!27403 (not mapNonEmpty!30675) (not b_next!16771))
(check-sat b_and!27403 (not b_next!16771))
