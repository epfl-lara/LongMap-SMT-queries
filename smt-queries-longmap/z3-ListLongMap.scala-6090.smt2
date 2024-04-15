; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78630 () Bool)

(assert start!78630)

(declare-fun b_free!16861 () Bool)

(declare-fun b_next!16861 () Bool)

(assert (=> start!78630 (= b_free!16861 (not b_next!16861))))

(declare-fun tp!59025 () Bool)

(declare-fun b_and!27457 () Bool)

(assert (=> start!78630 (= tp!59025 b_and!27457)))

(declare-fun b!916651 () Bool)

(declare-fun e!514589 () Bool)

(declare-fun tp_is_empty!19369 () Bool)

(assert (=> b!916651 (= e!514589 tp_is_empty!19369)))

(declare-fun res!618009 () Bool)

(declare-fun e!514587 () Bool)

(assert (=> start!78630 (=> (not res!618009) (not e!514587))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78630 (= res!618009 (validMask!0 mask!1881))))

(assert (=> start!78630 e!514587))

(assert (=> start!78630 true))

(declare-datatypes ((V!30791 0))(
  ( (V!30792 (val!9735 Int)) )
))
(declare-datatypes ((ValueCell!9203 0))(
  ( (ValueCellFull!9203 (v!12252 V!30791)) (EmptyCell!9203) )
))
(declare-datatypes ((array!54713 0))(
  ( (array!54714 (arr!26302 (Array (_ BitVec 32) ValueCell!9203)) (size!26763 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54713)

(declare-fun e!514590 () Bool)

(declare-fun array_inv!20594 (array!54713) Bool)

(assert (=> start!78630 (and (array_inv!20594 _values!1231) e!514590)))

(assert (=> start!78630 tp!59025))

(declare-datatypes ((array!54715 0))(
  ( (array!54716 (arr!26303 (Array (_ BitVec 32) (_ BitVec 64))) (size!26764 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54715)

(declare-fun array_inv!20595 (array!54715) Bool)

(assert (=> start!78630 (array_inv!20595 _keys!1487)))

(assert (=> start!78630 tp_is_empty!19369))

(declare-fun b!916652 () Bool)

(declare-fun res!618008 () Bool)

(assert (=> b!916652 (=> (not res!618008) (not e!514587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54715 (_ BitVec 32)) Bool)

(assert (=> b!916652 (= res!618008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916653 () Bool)

(declare-fun res!618006 () Bool)

(assert (=> b!916653 (=> (not res!618006) (not e!514587))))

(declare-datatypes ((List!18473 0))(
  ( (Nil!18470) (Cons!18469 (h!19615 (_ BitVec 64)) (t!26077 List!18473)) )
))
(declare-fun arrayNoDuplicates!0 (array!54715 (_ BitVec 32) List!18473) Bool)

(assert (=> b!916653 (= res!618006 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18470))))

(declare-fun b!916654 () Bool)

(declare-fun res!618011 () Bool)

(assert (=> b!916654 (=> (not res!618011) (not e!514587))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!916654 (= res!618011 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26764 _keys!1487))))))

(declare-fun b!916655 () Bool)

(declare-fun e!514588 () Bool)

(assert (=> b!916655 (= e!514588 false)))

(declare-fun lt!411655 () V!30791)

(declare-datatypes ((tuple2!12682 0))(
  ( (tuple2!12683 (_1!6352 (_ BitVec 64)) (_2!6352 V!30791)) )
))
(declare-datatypes ((List!18474 0))(
  ( (Nil!18471) (Cons!18470 (h!19616 tuple2!12682) (t!26078 List!18474)) )
))
(declare-datatypes ((ListLongMap!11369 0))(
  ( (ListLongMap!11370 (toList!5700 List!18474)) )
))
(declare-fun lt!411656 () ListLongMap!11369)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!542 (ListLongMap!11369 (_ BitVec 64)) V!30791)

(assert (=> b!916655 (= lt!411655 (apply!542 lt!411656 k0!1099))))

(declare-fun mapIsEmpty!30810 () Bool)

(declare-fun mapRes!30810 () Bool)

(assert (=> mapIsEmpty!30810 mapRes!30810))

(declare-fun mapNonEmpty!30810 () Bool)

(declare-fun tp!59024 () Bool)

(assert (=> mapNonEmpty!30810 (= mapRes!30810 (and tp!59024 e!514589))))

(declare-fun mapRest!30810 () (Array (_ BitVec 32) ValueCell!9203))

(declare-fun mapKey!30810 () (_ BitVec 32))

(declare-fun mapValue!30810 () ValueCell!9203)

(assert (=> mapNonEmpty!30810 (= (arr!26302 _values!1231) (store mapRest!30810 mapKey!30810 mapValue!30810))))

(declare-fun b!916656 () Bool)

(declare-fun e!514586 () Bool)

(assert (=> b!916656 (= e!514590 (and e!514586 mapRes!30810))))

(declare-fun condMapEmpty!30810 () Bool)

(declare-fun mapDefault!30810 () ValueCell!9203)

(assert (=> b!916656 (= condMapEmpty!30810 (= (arr!26302 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9203)) mapDefault!30810)))))

(declare-fun b!916657 () Bool)

(declare-fun res!618007 () Bool)

(assert (=> b!916657 (=> (not res!618007) (not e!514587))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!916657 (= res!618007 (and (= (size!26763 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26764 _keys!1487) (size!26763 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916658 () Bool)

(assert (=> b!916658 (= e!514586 tp_is_empty!19369)))

(declare-fun b!916659 () Bool)

(assert (=> b!916659 (= e!514587 e!514588)))

(declare-fun res!618010 () Bool)

(assert (=> b!916659 (=> (not res!618010) (not e!514588))))

(declare-fun contains!4708 (ListLongMap!11369 (_ BitVec 64)) Bool)

(assert (=> b!916659 (= res!618010 (contains!4708 lt!411656 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30791)

(declare-fun minValue!1173 () V!30791)

(declare-fun getCurrentListMap!2897 (array!54715 array!54713 (_ BitVec 32) (_ BitVec 32) V!30791 V!30791 (_ BitVec 32) Int) ListLongMap!11369)

(assert (=> b!916659 (= lt!411656 (getCurrentListMap!2897 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!78630 res!618009) b!916657))

(assert (= (and b!916657 res!618007) b!916652))

(assert (= (and b!916652 res!618008) b!916653))

(assert (= (and b!916653 res!618006) b!916654))

(assert (= (and b!916654 res!618011) b!916659))

(assert (= (and b!916659 res!618010) b!916655))

(assert (= (and b!916656 condMapEmpty!30810) mapIsEmpty!30810))

(assert (= (and b!916656 (not condMapEmpty!30810)) mapNonEmpty!30810))

(get-info :version)

(assert (= (and mapNonEmpty!30810 ((_ is ValueCellFull!9203) mapValue!30810)) b!916651))

(assert (= (and b!916656 ((_ is ValueCellFull!9203) mapDefault!30810)) b!916658))

(assert (= start!78630 b!916656))

(declare-fun m!850009 () Bool)

(assert (=> mapNonEmpty!30810 m!850009))

(declare-fun m!850011 () Bool)

(assert (=> start!78630 m!850011))

(declare-fun m!850013 () Bool)

(assert (=> start!78630 m!850013))

(declare-fun m!850015 () Bool)

(assert (=> start!78630 m!850015))

(declare-fun m!850017 () Bool)

(assert (=> b!916659 m!850017))

(declare-fun m!850019 () Bool)

(assert (=> b!916659 m!850019))

(declare-fun m!850021 () Bool)

(assert (=> b!916652 m!850021))

(declare-fun m!850023 () Bool)

(assert (=> b!916653 m!850023))

(declare-fun m!850025 () Bool)

(assert (=> b!916655 m!850025))

(check-sat tp_is_empty!19369 (not b_next!16861) (not b!916652) (not start!78630) (not b!916659) b_and!27457 (not b!916653) (not b!916655) (not mapNonEmpty!30810))
(check-sat b_and!27457 (not b_next!16861))
