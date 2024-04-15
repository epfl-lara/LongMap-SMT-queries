; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78636 () Bool)

(assert start!78636)

(declare-fun b_free!16867 () Bool)

(declare-fun b_next!16867 () Bool)

(assert (=> start!78636 (= b_free!16867 (not b_next!16867))))

(declare-fun tp!59043 () Bool)

(declare-fun b_and!27463 () Bool)

(assert (=> start!78636 (= tp!59043 b_and!27463)))

(declare-fun b!916732 () Bool)

(declare-fun res!618065 () Bool)

(declare-fun e!514642 () Bool)

(assert (=> b!916732 (=> (not res!618065) (not e!514642))))

(declare-datatypes ((array!54725 0))(
  ( (array!54726 (arr!26308 (Array (_ BitVec 32) (_ BitVec 64))) (size!26769 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54725)

(declare-datatypes ((List!18477 0))(
  ( (Nil!18474) (Cons!18473 (h!19619 (_ BitVec 64)) (t!26081 List!18477)) )
))
(declare-fun arrayNoDuplicates!0 (array!54725 (_ BitVec 32) List!18477) Bool)

(assert (=> b!916732 (= res!618065 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18474))))

(declare-fun b!916733 () Bool)

(declare-fun e!514639 () Bool)

(declare-fun e!514644 () Bool)

(declare-fun mapRes!30819 () Bool)

(assert (=> b!916733 (= e!514639 (and e!514644 mapRes!30819))))

(declare-fun condMapEmpty!30819 () Bool)

(declare-datatypes ((V!30799 0))(
  ( (V!30800 (val!9738 Int)) )
))
(declare-datatypes ((ValueCell!9206 0))(
  ( (ValueCellFull!9206 (v!12255 V!30799)) (EmptyCell!9206) )
))
(declare-datatypes ((array!54727 0))(
  ( (array!54728 (arr!26309 (Array (_ BitVec 32) ValueCell!9206)) (size!26770 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54727)

(declare-fun mapDefault!30819 () ValueCell!9206)

(assert (=> b!916733 (= condMapEmpty!30819 (= (arr!26309 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9206)) mapDefault!30819)))))

(declare-fun mapIsEmpty!30819 () Bool)

(assert (=> mapIsEmpty!30819 mapRes!30819))

(declare-fun b!916734 () Bool)

(declare-fun res!618060 () Bool)

(assert (=> b!916734 (=> (not res!618060) (not e!514642))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!916734 (= res!618060 (and (= (size!26770 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26769 _keys!1487) (size!26770 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916735 () Bool)

(declare-fun e!514641 () Bool)

(declare-fun tp_is_empty!19375 () Bool)

(assert (=> b!916735 (= e!514641 tp_is_empty!19375)))

(declare-fun b!916736 () Bool)

(assert (=> b!916736 (= e!514644 tp_is_empty!19375)))

(declare-fun mapNonEmpty!30819 () Bool)

(declare-fun tp!59042 () Bool)

(assert (=> mapNonEmpty!30819 (= mapRes!30819 (and tp!59042 e!514641))))

(declare-fun mapRest!30819 () (Array (_ BitVec 32) ValueCell!9206))

(declare-fun mapValue!30819 () ValueCell!9206)

(declare-fun mapKey!30819 () (_ BitVec 32))

(assert (=> mapNonEmpty!30819 (= (arr!26309 _values!1231) (store mapRest!30819 mapKey!30819 mapValue!30819))))

(declare-fun b!916738 () Bool)

(declare-fun res!618064 () Bool)

(assert (=> b!916738 (=> (not res!618064) (not e!514642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54725 (_ BitVec 32)) Bool)

(assert (=> b!916738 (= res!618064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916739 () Bool)

(declare-fun e!514643 () Bool)

(assert (=> b!916739 (= e!514643 false)))

(declare-fun lt!411673 () V!30799)

(declare-datatypes ((tuple2!12686 0))(
  ( (tuple2!12687 (_1!6354 (_ BitVec 64)) (_2!6354 V!30799)) )
))
(declare-datatypes ((List!18478 0))(
  ( (Nil!18475) (Cons!18474 (h!19620 tuple2!12686) (t!26082 List!18478)) )
))
(declare-datatypes ((ListLongMap!11373 0))(
  ( (ListLongMap!11374 (toList!5702 List!18478)) )
))
(declare-fun lt!411674 () ListLongMap!11373)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!544 (ListLongMap!11373 (_ BitVec 64)) V!30799)

(assert (=> b!916739 (= lt!411673 (apply!544 lt!411674 k0!1099))))

(declare-fun b!916740 () Bool)

(assert (=> b!916740 (= e!514642 e!514643)))

(declare-fun res!618062 () Bool)

(assert (=> b!916740 (=> (not res!618062) (not e!514643))))

(declare-fun contains!4709 (ListLongMap!11373 (_ BitVec 64)) Bool)

(assert (=> b!916740 (= res!618062 (contains!4709 lt!411674 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30799)

(declare-fun minValue!1173 () V!30799)

(declare-fun getCurrentListMap!2898 (array!54725 array!54727 (_ BitVec 32) (_ BitVec 32) V!30799 V!30799 (_ BitVec 32) Int) ListLongMap!11373)

(assert (=> b!916740 (= lt!411674 (getCurrentListMap!2898 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!618063 () Bool)

(assert (=> start!78636 (=> (not res!618063) (not e!514642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78636 (= res!618063 (validMask!0 mask!1881))))

(assert (=> start!78636 e!514642))

(assert (=> start!78636 true))

(declare-fun array_inv!20596 (array!54727) Bool)

(assert (=> start!78636 (and (array_inv!20596 _values!1231) e!514639)))

(assert (=> start!78636 tp!59043))

(declare-fun array_inv!20597 (array!54725) Bool)

(assert (=> start!78636 (array_inv!20597 _keys!1487)))

(assert (=> start!78636 tp_is_empty!19375))

(declare-fun b!916737 () Bool)

(declare-fun res!618061 () Bool)

(assert (=> b!916737 (=> (not res!618061) (not e!514642))))

(assert (=> b!916737 (= res!618061 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26769 _keys!1487))))))

(assert (= (and start!78636 res!618063) b!916734))

(assert (= (and b!916734 res!618060) b!916738))

(assert (= (and b!916738 res!618064) b!916732))

(assert (= (and b!916732 res!618065) b!916737))

(assert (= (and b!916737 res!618061) b!916740))

(assert (= (and b!916740 res!618062) b!916739))

(assert (= (and b!916733 condMapEmpty!30819) mapIsEmpty!30819))

(assert (= (and b!916733 (not condMapEmpty!30819)) mapNonEmpty!30819))

(get-info :version)

(assert (= (and mapNonEmpty!30819 ((_ is ValueCellFull!9206) mapValue!30819)) b!916735))

(assert (= (and b!916733 ((_ is ValueCellFull!9206) mapDefault!30819)) b!916736))

(assert (= start!78636 b!916733))

(declare-fun m!850063 () Bool)

(assert (=> b!916739 m!850063))

(declare-fun m!850065 () Bool)

(assert (=> b!916740 m!850065))

(declare-fun m!850067 () Bool)

(assert (=> b!916740 m!850067))

(declare-fun m!850069 () Bool)

(assert (=> b!916738 m!850069))

(declare-fun m!850071 () Bool)

(assert (=> b!916732 m!850071))

(declare-fun m!850073 () Bool)

(assert (=> mapNonEmpty!30819 m!850073))

(declare-fun m!850075 () Bool)

(assert (=> start!78636 m!850075))

(declare-fun m!850077 () Bool)

(assert (=> start!78636 m!850077))

(declare-fun m!850079 () Bool)

(assert (=> start!78636 m!850079))

(check-sat (not start!78636) tp_is_empty!19375 (not b!916739) (not b!916740) (not b!916732) b_and!27463 (not b_next!16867) (not mapNonEmpty!30819) (not b!916738))
(check-sat b_and!27463 (not b_next!16867))
