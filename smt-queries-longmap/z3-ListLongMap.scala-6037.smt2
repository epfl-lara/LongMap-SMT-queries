; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78290 () Bool)

(assert start!78290)

(declare-fun b_free!16633 () Bool)

(declare-fun b_next!16633 () Bool)

(assert (=> start!78290 (= b_free!16633 (not b_next!16633))))

(declare-fun tp!58173 () Bool)

(declare-fun b_and!27217 () Bool)

(assert (=> start!78290 (= tp!58173 b_and!27217)))

(declare-fun b!912691 () Bool)

(declare-fun res!615470 () Bool)

(declare-fun e!511989 () Bool)

(assert (=> b!912691 (=> (not res!615470) (not e!511989))))

(declare-datatypes ((V!30367 0))(
  ( (V!30368 (val!9576 Int)) )
))
(declare-datatypes ((ValueCell!9044 0))(
  ( (ValueCellFull!9044 (v!12083 V!30367)) (EmptyCell!9044) )
))
(declare-datatypes ((array!54163 0))(
  ( (array!54164 (arr!26032 (Array (_ BitVec 32) ValueCell!9044)) (size!26492 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54163)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54165 0))(
  ( (array!54166 (arr!26033 (Array (_ BitVec 32) (_ BitVec 64))) (size!26493 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54165)

(assert (=> b!912691 (= res!615470 (and (= (size!26492 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26493 _keys!1386) (size!26492 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912692 () Bool)

(declare-fun e!511987 () Bool)

(declare-fun tp_is_empty!19051 () Bool)

(assert (=> b!912692 (= e!511987 tp_is_empty!19051)))

(declare-fun b!912693 () Bool)

(declare-fun e!511985 () Bool)

(declare-fun mapRes!30301 () Bool)

(assert (=> b!912693 (= e!511985 (and e!511987 mapRes!30301))))

(declare-fun condMapEmpty!30301 () Bool)

(declare-fun mapDefault!30301 () ValueCell!9044)

(assert (=> b!912693 (= condMapEmpty!30301 (= (arr!26032 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9044)) mapDefault!30301)))))

(declare-fun res!615468 () Bool)

(assert (=> start!78290 (=> (not res!615468) (not e!511989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78290 (= res!615468 (validMask!0 mask!1756))))

(assert (=> start!78290 e!511989))

(declare-fun array_inv!20426 (array!54163) Bool)

(assert (=> start!78290 (and (array_inv!20426 _values!1152) e!511985)))

(assert (=> start!78290 tp!58173))

(assert (=> start!78290 true))

(assert (=> start!78290 tp_is_empty!19051))

(declare-fun array_inv!20427 (array!54165) Bool)

(assert (=> start!78290 (array_inv!20427 _keys!1386)))

(declare-fun mapIsEmpty!30301 () Bool)

(assert (=> mapIsEmpty!30301 mapRes!30301))

(declare-fun b!912694 () Bool)

(declare-fun e!511986 () Bool)

(assert (=> b!912694 (= e!511986 tp_is_empty!19051)))

(declare-fun b!912695 () Bool)

(declare-fun res!615467 () Bool)

(assert (=> b!912695 (=> (not res!615467) (not e!511989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54165 (_ BitVec 32)) Bool)

(assert (=> b!912695 (= res!615467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912696 () Bool)

(assert (=> b!912696 (= e!511989 false)))

(declare-fun zeroValue!1094 () V!30367)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30367)

(declare-fun lt!410871 () Bool)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((tuple2!12438 0))(
  ( (tuple2!12439 (_1!6230 (_ BitVec 64)) (_2!6230 V!30367)) )
))
(declare-datatypes ((List!18259 0))(
  ( (Nil!18256) (Cons!18255 (h!19407 tuple2!12438) (t!25838 List!18259)) )
))
(declare-datatypes ((ListLongMap!11137 0))(
  ( (ListLongMap!11138 (toList!5584 List!18259)) )
))
(declare-fun contains!4638 (ListLongMap!11137 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2845 (array!54165 array!54163 (_ BitVec 32) (_ BitVec 32) V!30367 V!30367 (_ BitVec 32) Int) ListLongMap!11137)

(assert (=> b!912696 (= lt!410871 (contains!4638 (getCurrentListMap!2845 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912697 () Bool)

(declare-fun res!615469 () Bool)

(assert (=> b!912697 (=> (not res!615469) (not e!511989))))

(declare-datatypes ((List!18260 0))(
  ( (Nil!18257) (Cons!18256 (h!19408 (_ BitVec 64)) (t!25839 List!18260)) )
))
(declare-fun arrayNoDuplicates!0 (array!54165 (_ BitVec 32) List!18260) Bool)

(assert (=> b!912697 (= res!615469 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18257))))

(declare-fun mapNonEmpty!30301 () Bool)

(declare-fun tp!58174 () Bool)

(assert (=> mapNonEmpty!30301 (= mapRes!30301 (and tp!58174 e!511986))))

(declare-fun mapValue!30301 () ValueCell!9044)

(declare-fun mapRest!30301 () (Array (_ BitVec 32) ValueCell!9044))

(declare-fun mapKey!30301 () (_ BitVec 32))

(assert (=> mapNonEmpty!30301 (= (arr!26032 _values!1152) (store mapRest!30301 mapKey!30301 mapValue!30301))))

(assert (= (and start!78290 res!615468) b!912691))

(assert (= (and b!912691 res!615470) b!912695))

(assert (= (and b!912695 res!615467) b!912697))

(assert (= (and b!912697 res!615469) b!912696))

(assert (= (and b!912693 condMapEmpty!30301) mapIsEmpty!30301))

(assert (= (and b!912693 (not condMapEmpty!30301)) mapNonEmpty!30301))

(get-info :version)

(assert (= (and mapNonEmpty!30301 ((_ is ValueCellFull!9044) mapValue!30301)) b!912694))

(assert (= (and b!912693 ((_ is ValueCellFull!9044) mapDefault!30301)) b!912692))

(assert (= start!78290 b!912693))

(declare-fun m!847749 () Bool)

(assert (=> start!78290 m!847749))

(declare-fun m!847751 () Bool)

(assert (=> start!78290 m!847751))

(declare-fun m!847753 () Bool)

(assert (=> start!78290 m!847753))

(declare-fun m!847755 () Bool)

(assert (=> b!912697 m!847755))

(declare-fun m!847757 () Bool)

(assert (=> mapNonEmpty!30301 m!847757))

(declare-fun m!847759 () Bool)

(assert (=> b!912695 m!847759))

(declare-fun m!847761 () Bool)

(assert (=> b!912696 m!847761))

(assert (=> b!912696 m!847761))

(declare-fun m!847763 () Bool)

(assert (=> b!912696 m!847763))

(check-sat tp_is_empty!19051 (not start!78290) (not b_next!16633) b_and!27217 (not b!912697) (not b!912696) (not mapNonEmpty!30301) (not b!912695))
(check-sat b_and!27217 (not b_next!16633))
