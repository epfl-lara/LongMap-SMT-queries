; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78732 () Bool)

(assert start!78732)

(declare-fun b_free!16777 () Bool)

(declare-fun b_next!16777 () Bool)

(assert (=> start!78732 (= b_free!16777 (not b_next!16777))))

(declare-fun tp!58773 () Bool)

(declare-fun b_and!27409 () Bool)

(assert (=> start!78732 (= tp!58773 b_and!27409)))

(declare-fun mapIsEmpty!30684 () Bool)

(declare-fun mapRes!30684 () Bool)

(assert (=> mapIsEmpty!30684 mapRes!30684))

(declare-fun b!916720 () Bool)

(declare-fun e!514632 () Bool)

(declare-fun e!514629 () Bool)

(assert (=> b!916720 (= e!514632 (and e!514629 mapRes!30684))))

(declare-fun condMapEmpty!30684 () Bool)

(declare-datatypes ((V!30679 0))(
  ( (V!30680 (val!9693 Int)) )
))
(declare-datatypes ((ValueCell!9161 0))(
  ( (ValueCellFull!9161 (v!12208 V!30679)) (EmptyCell!9161) )
))
(declare-datatypes ((array!54615 0))(
  ( (array!54616 (arr!26248 (Array (_ BitVec 32) ValueCell!9161)) (size!26708 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54615)

(declare-fun mapDefault!30684 () ValueCell!9161)

(assert (=> b!916720 (= condMapEmpty!30684 (= (arr!26248 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9161)) mapDefault!30684)))))

(declare-fun b!916721 () Bool)

(declare-fun res!617765 () Bool)

(declare-fun e!514631 () Bool)

(assert (=> b!916721 (=> (not res!617765) (not e!514631))))

(declare-datatypes ((array!54617 0))(
  ( (array!54618 (arr!26249 (Array (_ BitVec 32) (_ BitVec 64))) (size!26709 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54617)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54617 (_ BitVec 32)) Bool)

(assert (=> b!916721 (= res!617765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!617768 () Bool)

(assert (=> start!78732 (=> (not res!617768) (not e!514631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78732 (= res!617768 (validMask!0 mask!1881))))

(assert (=> start!78732 e!514631))

(assert (=> start!78732 true))

(declare-fun array_inv!20582 (array!54615) Bool)

(assert (=> start!78732 (and (array_inv!20582 _values!1231) e!514632)))

(assert (=> start!78732 tp!58773))

(declare-fun array_inv!20583 (array!54617) Bool)

(assert (=> start!78732 (array_inv!20583 _keys!1487)))

(declare-fun tp_is_empty!19285 () Bool)

(assert (=> start!78732 tp_is_empty!19285))

(declare-fun b!916722 () Bool)

(declare-fun res!617767 () Bool)

(assert (=> b!916722 (=> (not res!617767) (not e!514631))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!916722 (= res!617767 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26709 _keys!1487))))))

(declare-fun b!916723 () Bool)

(assert (=> b!916723 (= e!514629 tp_is_empty!19285)))

(declare-fun b!916724 () Bool)

(declare-fun res!617766 () Bool)

(assert (=> b!916724 (=> (not res!617766) (not e!514631))))

(declare-datatypes ((List!18372 0))(
  ( (Nil!18369) (Cons!18368 (h!19520 (_ BitVec 64)) (t!25977 List!18372)) )
))
(declare-fun arrayNoDuplicates!0 (array!54617 (_ BitVec 32) List!18372) Bool)

(assert (=> b!916724 (= res!617766 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18369))))

(declare-fun mapNonEmpty!30684 () Bool)

(declare-fun tp!58772 () Bool)

(declare-fun e!514630 () Bool)

(assert (=> mapNonEmpty!30684 (= mapRes!30684 (and tp!58772 e!514630))))

(declare-fun mapRest!30684 () (Array (_ BitVec 32) ValueCell!9161))

(declare-fun mapKey!30684 () (_ BitVec 32))

(declare-fun mapValue!30684 () ValueCell!9161)

(assert (=> mapNonEmpty!30684 (= (arr!26248 _values!1231) (store mapRest!30684 mapKey!30684 mapValue!30684))))

(declare-fun b!916725 () Bool)

(assert (=> b!916725 (= e!514630 tp_is_empty!19285)))

(declare-fun b!916726 () Bool)

(assert (=> b!916726 (= e!514631 false)))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!412079 () Bool)

(declare-fun zeroValue!1173 () V!30679)

(declare-fun minValue!1173 () V!30679)

(declare-datatypes ((tuple2!12540 0))(
  ( (tuple2!12541 (_1!6281 (_ BitVec 64)) (_2!6281 V!30679)) )
))
(declare-datatypes ((List!18373 0))(
  ( (Nil!18370) (Cons!18369 (h!19521 tuple2!12540) (t!25978 List!18373)) )
))
(declare-datatypes ((ListLongMap!11239 0))(
  ( (ListLongMap!11240 (toList!5635 List!18373)) )
))
(declare-fun contains!4697 (ListLongMap!11239 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2894 (array!54617 array!54615 (_ BitVec 32) (_ BitVec 32) V!30679 V!30679 (_ BitVec 32) Int) ListLongMap!11239)

(assert (=> b!916726 (= lt!412079 (contains!4697 (getCurrentListMap!2894 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun b!916727 () Bool)

(declare-fun res!617769 () Bool)

(assert (=> b!916727 (=> (not res!617769) (not e!514631))))

(assert (=> b!916727 (= res!617769 (and (= (size!26708 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26709 _keys!1487) (size!26708 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78732 res!617768) b!916727))

(assert (= (and b!916727 res!617769) b!916721))

(assert (= (and b!916721 res!617765) b!916724))

(assert (= (and b!916724 res!617766) b!916722))

(assert (= (and b!916722 res!617767) b!916726))

(assert (= (and b!916720 condMapEmpty!30684) mapIsEmpty!30684))

(assert (= (and b!916720 (not condMapEmpty!30684)) mapNonEmpty!30684))

(get-info :version)

(assert (= (and mapNonEmpty!30684 ((_ is ValueCellFull!9161) mapValue!30684)) b!916725))

(assert (= (and b!916720 ((_ is ValueCellFull!9161) mapDefault!30684)) b!916723))

(assert (= start!78732 b!916720))

(declare-fun m!851353 () Bool)

(assert (=> mapNonEmpty!30684 m!851353))

(declare-fun m!851355 () Bool)

(assert (=> b!916726 m!851355))

(assert (=> b!916726 m!851355))

(declare-fun m!851357 () Bool)

(assert (=> b!916726 m!851357))

(declare-fun m!851359 () Bool)

(assert (=> start!78732 m!851359))

(declare-fun m!851361 () Bool)

(assert (=> start!78732 m!851361))

(declare-fun m!851363 () Bool)

(assert (=> start!78732 m!851363))

(declare-fun m!851365 () Bool)

(assert (=> b!916724 m!851365))

(declare-fun m!851367 () Bool)

(assert (=> b!916721 m!851367))

(check-sat (not b!916724) tp_is_empty!19285 (not mapNonEmpty!30684) (not b!916721) b_and!27409 (not start!78732) (not b!916726) (not b_next!16777))
(check-sat b_and!27409 (not b_next!16777))
