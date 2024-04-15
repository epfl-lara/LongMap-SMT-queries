; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78202 () Bool)

(assert start!78202)

(declare-fun b_free!16711 () Bool)

(declare-fun b_next!16711 () Bool)

(assert (=> start!78202 (= b_free!16711 (not b_next!16711))))

(declare-fun tp!58410 () Bool)

(declare-fun b_and!27261 () Bool)

(assert (=> start!78202 (= tp!58410 b_and!27261)))

(declare-fun b!912684 () Bool)

(declare-fun res!615727 () Bool)

(declare-fun e!511921 () Bool)

(assert (=> b!912684 (=> (not res!615727) (not e!511921))))

(declare-datatypes ((array!54251 0))(
  ( (array!54252 (arr!26080 (Array (_ BitVec 32) (_ BitVec 64))) (size!26541 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54251)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54251 (_ BitVec 32)) Bool)

(assert (=> b!912684 (= res!615727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30421 () Bool)

(declare-fun mapRes!30421 () Bool)

(declare-fun tp!58411 () Bool)

(declare-fun e!511922 () Bool)

(assert (=> mapNonEmpty!30421 (= mapRes!30421 (and tp!58411 e!511922))))

(declare-datatypes ((V!30471 0))(
  ( (V!30472 (val!9615 Int)) )
))
(declare-datatypes ((ValueCell!9083 0))(
  ( (ValueCellFull!9083 (v!12125 V!30471)) (EmptyCell!9083) )
))
(declare-datatypes ((array!54253 0))(
  ( (array!54254 (arr!26081 (Array (_ BitVec 32) ValueCell!9083)) (size!26542 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54253)

(declare-fun mapRest!30421 () (Array (_ BitVec 32) ValueCell!9083))

(declare-fun mapKey!30421 () (_ BitVec 32))

(declare-fun mapValue!30421 () ValueCell!9083)

(assert (=> mapNonEmpty!30421 (= (arr!26081 _values!1152) (store mapRest!30421 mapKey!30421 mapValue!30421))))

(declare-fun b!912685 () Bool)

(assert (=> b!912685 (= e!511921 (not true))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!54251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912685 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30471)

(declare-datatypes ((Unit!30822 0))(
  ( (Unit!30823) )
))
(declare-fun lt!410481 () Unit!30822)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30471)

(declare-fun lemmaKeyInListMapIsInArray!268 (array!54251 array!54253 (_ BitVec 32) (_ BitVec 32) V!30471 V!30471 (_ BitVec 64) Int) Unit!30822)

(assert (=> b!912685 (= lt!410481 (lemmaKeyInListMapIsInArray!268 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!912686 () Bool)

(declare-fun res!615733 () Bool)

(assert (=> b!912686 (=> (not res!615733) (not e!511921))))

(declare-datatypes ((tuple2!12572 0))(
  ( (tuple2!12573 (_1!6297 (_ BitVec 64)) (_2!6297 V!30471)) )
))
(declare-datatypes ((List!18352 0))(
  ( (Nil!18349) (Cons!18348 (h!19494 tuple2!12572) (t!25932 List!18352)) )
))
(declare-datatypes ((ListLongMap!11259 0))(
  ( (ListLongMap!11260 (toList!5645 List!18352)) )
))
(declare-fun contains!4648 (ListLongMap!11259 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2847 (array!54251 array!54253 (_ BitVec 32) (_ BitVec 32) V!30471 V!30471 (_ BitVec 32) Int) ListLongMap!11259)

(assert (=> b!912686 (= res!615733 (contains!4648 (getCurrentListMap!2847 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912687 () Bool)

(declare-fun e!511924 () Bool)

(declare-fun e!511923 () Bool)

(assert (=> b!912687 (= e!511924 (and e!511923 mapRes!30421))))

(declare-fun condMapEmpty!30421 () Bool)

(declare-fun mapDefault!30421 () ValueCell!9083)

(assert (=> b!912687 (= condMapEmpty!30421 (= (arr!26081 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9083)) mapDefault!30421)))))

(declare-fun b!912688 () Bool)

(declare-fun res!615728 () Bool)

(assert (=> b!912688 (=> (not res!615728) (not e!511921))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!912688 (= res!615728 (and (= (select (arr!26080 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!912689 () Bool)

(declare-fun tp_is_empty!19129 () Bool)

(assert (=> b!912689 (= e!511923 tp_is_empty!19129)))

(declare-fun res!615730 () Bool)

(assert (=> start!78202 (=> (not res!615730) (not e!511921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78202 (= res!615730 (validMask!0 mask!1756))))

(assert (=> start!78202 e!511921))

(declare-fun array_inv!20448 (array!54253) Bool)

(assert (=> start!78202 (and (array_inv!20448 _values!1152) e!511924)))

(assert (=> start!78202 tp!58410))

(assert (=> start!78202 true))

(assert (=> start!78202 tp_is_empty!19129))

(declare-fun array_inv!20449 (array!54251) Bool)

(assert (=> start!78202 (array_inv!20449 _keys!1386)))

(declare-fun mapIsEmpty!30421 () Bool)

(assert (=> mapIsEmpty!30421 mapRes!30421))

(declare-fun b!912690 () Bool)

(declare-fun res!615732 () Bool)

(assert (=> b!912690 (=> (not res!615732) (not e!511921))))

(assert (=> b!912690 (= res!615732 (and (= (size!26542 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26541 _keys!1386) (size!26542 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912691 () Bool)

(declare-fun res!615731 () Bool)

(assert (=> b!912691 (=> (not res!615731) (not e!511921))))

(declare-datatypes ((List!18353 0))(
  ( (Nil!18350) (Cons!18349 (h!19495 (_ BitVec 64)) (t!25933 List!18353)) )
))
(declare-fun arrayNoDuplicates!0 (array!54251 (_ BitVec 32) List!18353) Bool)

(assert (=> b!912691 (= res!615731 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18350))))

(declare-fun b!912692 () Bool)

(declare-fun res!615729 () Bool)

(assert (=> b!912692 (=> (not res!615729) (not e!511921))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912692 (= res!615729 (inRange!0 i!717 mask!1756))))

(declare-fun b!912693 () Bool)

(assert (=> b!912693 (= e!511922 tp_is_empty!19129)))

(assert (= (and start!78202 res!615730) b!912690))

(assert (= (and b!912690 res!615732) b!912684))

(assert (= (and b!912684 res!615727) b!912691))

(assert (= (and b!912691 res!615731) b!912686))

(assert (= (and b!912686 res!615733) b!912692))

(assert (= (and b!912692 res!615729) b!912688))

(assert (= (and b!912688 res!615728) b!912685))

(assert (= (and b!912687 condMapEmpty!30421) mapIsEmpty!30421))

(assert (= (and b!912687 (not condMapEmpty!30421)) mapNonEmpty!30421))

(get-info :version)

(assert (= (and mapNonEmpty!30421 ((_ is ValueCellFull!9083) mapValue!30421)) b!912693))

(assert (= (and b!912687 ((_ is ValueCellFull!9083) mapDefault!30421)) b!912689))

(assert (= start!78202 b!912687))

(declare-fun m!846573 () Bool)

(assert (=> start!78202 m!846573))

(declare-fun m!846575 () Bool)

(assert (=> start!78202 m!846575))

(declare-fun m!846577 () Bool)

(assert (=> start!78202 m!846577))

(declare-fun m!846579 () Bool)

(assert (=> b!912685 m!846579))

(declare-fun m!846581 () Bool)

(assert (=> b!912685 m!846581))

(declare-fun m!846583 () Bool)

(assert (=> b!912691 m!846583))

(declare-fun m!846585 () Bool)

(assert (=> b!912684 m!846585))

(declare-fun m!846587 () Bool)

(assert (=> b!912686 m!846587))

(assert (=> b!912686 m!846587))

(declare-fun m!846589 () Bool)

(assert (=> b!912686 m!846589))

(declare-fun m!846591 () Bool)

(assert (=> b!912688 m!846591))

(declare-fun m!846593 () Bool)

(assert (=> mapNonEmpty!30421 m!846593))

(declare-fun m!846595 () Bool)

(assert (=> b!912692 m!846595))

(check-sat (not b!912685) b_and!27261 (not b!912686) (not b_next!16711) (not b!912691) (not b!912684) (not mapNonEmpty!30421) (not b!912692) (not start!78202) tp_is_empty!19129)
(check-sat b_and!27261 (not b_next!16711))
