; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78116 () Bool)

(assert start!78116)

(declare-fun b_free!16645 () Bool)

(declare-fun b_next!16645 () Bool)

(assert (=> start!78116 (= b_free!16645 (not b_next!16645))))

(declare-fun tp!58210 () Bool)

(declare-fun b_and!27193 () Bool)

(assert (=> start!78116 (= tp!58210 b_and!27193)))

(declare-fun b!911675 () Bool)

(declare-fun res!615086 () Bool)

(declare-fun e!511346 () Bool)

(assert (=> b!911675 (=> (not res!615086) (not e!511346))))

(declare-datatypes ((array!54121 0))(
  ( (array!54122 (arr!26016 (Array (_ BitVec 32) (_ BitVec 64))) (size!26477 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54121)

(declare-datatypes ((List!18306 0))(
  ( (Nil!18303) (Cons!18302 (h!19448 (_ BitVec 64)) (t!25884 List!18306)) )
))
(declare-fun arrayNoDuplicates!0 (array!54121 (_ BitVec 32) List!18306) Bool)

(assert (=> b!911675 (= res!615086 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18303))))

(declare-fun res!615087 () Bool)

(assert (=> start!78116 (=> (not res!615087) (not e!511346))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78116 (= res!615087 (validMask!0 mask!1756))))

(assert (=> start!78116 e!511346))

(declare-datatypes ((V!30383 0))(
  ( (V!30384 (val!9582 Int)) )
))
(declare-datatypes ((ValueCell!9050 0))(
  ( (ValueCellFull!9050 (v!12091 V!30383)) (EmptyCell!9050) )
))
(declare-datatypes ((array!54123 0))(
  ( (array!54124 (arr!26017 (Array (_ BitVec 32) ValueCell!9050)) (size!26478 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54123)

(declare-fun e!511349 () Bool)

(declare-fun array_inv!20400 (array!54123) Bool)

(assert (=> start!78116 (and (array_inv!20400 _values!1152) e!511349)))

(assert (=> start!78116 tp!58210))

(assert (=> start!78116 true))

(declare-fun tp_is_empty!19063 () Bool)

(assert (=> start!78116 tp_is_empty!19063))

(declare-fun array_inv!20401 (array!54121) Bool)

(assert (=> start!78116 (array_inv!20401 _keys!1386)))

(declare-fun mapNonEmpty!30319 () Bool)

(declare-fun mapRes!30319 () Bool)

(declare-fun tp!58209 () Bool)

(declare-fun e!511345 () Bool)

(assert (=> mapNonEmpty!30319 (= mapRes!30319 (and tp!58209 e!511345))))

(declare-fun mapRest!30319 () (Array (_ BitVec 32) ValueCell!9050))

(declare-fun mapValue!30319 () ValueCell!9050)

(declare-fun mapKey!30319 () (_ BitVec 32))

(assert (=> mapNonEmpty!30319 (= (arr!26017 _values!1152) (store mapRest!30319 mapKey!30319 mapValue!30319))))

(declare-fun b!911676 () Bool)

(declare-fun e!511348 () Bool)

(assert (=> b!911676 (= e!511349 (and e!511348 mapRes!30319))))

(declare-fun condMapEmpty!30319 () Bool)

(declare-fun mapDefault!30319 () ValueCell!9050)

(assert (=> b!911676 (= condMapEmpty!30319 (= (arr!26017 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9050)) mapDefault!30319)))))

(declare-fun b!911677 () Bool)

(assert (=> b!911677 (= e!511346 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30383)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!410292 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30383)

(declare-datatypes ((tuple2!12524 0))(
  ( (tuple2!12525 (_1!6273 (_ BitVec 64)) (_2!6273 V!30383)) )
))
(declare-datatypes ((List!18307 0))(
  ( (Nil!18304) (Cons!18303 (h!19449 tuple2!12524) (t!25885 List!18307)) )
))
(declare-datatypes ((ListLongMap!11211 0))(
  ( (ListLongMap!11212 (toList!5621 List!18307)) )
))
(declare-fun contains!4623 (ListLongMap!11211 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2823 (array!54121 array!54123 (_ BitVec 32) (_ BitVec 32) V!30383 V!30383 (_ BitVec 32) Int) ListLongMap!11211)

(assert (=> b!911677 (= lt!410292 (contains!4623 (getCurrentListMap!2823 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911678 () Bool)

(assert (=> b!911678 (= e!511348 tp_is_empty!19063)))

(declare-fun b!911679 () Bool)

(declare-fun res!615088 () Bool)

(assert (=> b!911679 (=> (not res!615088) (not e!511346))))

(assert (=> b!911679 (= res!615088 (and (= (size!26478 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26477 _keys!1386) (size!26478 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911680 () Bool)

(declare-fun res!615085 () Bool)

(assert (=> b!911680 (=> (not res!615085) (not e!511346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54121 (_ BitVec 32)) Bool)

(assert (=> b!911680 (= res!615085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!30319 () Bool)

(assert (=> mapIsEmpty!30319 mapRes!30319))

(declare-fun b!911681 () Bool)

(assert (=> b!911681 (= e!511345 tp_is_empty!19063)))

(assert (= (and start!78116 res!615087) b!911679))

(assert (= (and b!911679 res!615088) b!911680))

(assert (= (and b!911680 res!615085) b!911675))

(assert (= (and b!911675 res!615086) b!911677))

(assert (= (and b!911676 condMapEmpty!30319) mapIsEmpty!30319))

(assert (= (and b!911676 (not condMapEmpty!30319)) mapNonEmpty!30319))

(get-info :version)

(assert (= (and mapNonEmpty!30319 ((_ is ValueCellFull!9050) mapValue!30319)) b!911681))

(assert (= (and b!911676 ((_ is ValueCellFull!9050) mapDefault!30319)) b!911678))

(assert (= start!78116 b!911676))

(declare-fun m!845793 () Bool)

(assert (=> b!911680 m!845793))

(declare-fun m!845795 () Bool)

(assert (=> start!78116 m!845795))

(declare-fun m!845797 () Bool)

(assert (=> start!78116 m!845797))

(declare-fun m!845799 () Bool)

(assert (=> start!78116 m!845799))

(declare-fun m!845801 () Bool)

(assert (=> mapNonEmpty!30319 m!845801))

(declare-fun m!845803 () Bool)

(assert (=> b!911677 m!845803))

(assert (=> b!911677 m!845803))

(declare-fun m!845805 () Bool)

(assert (=> b!911677 m!845805))

(declare-fun m!845807 () Bool)

(assert (=> b!911675 m!845807))

(check-sat tp_is_empty!19063 (not b!911680) (not start!78116) (not mapNonEmpty!30319) (not b_next!16645) (not b!911675) b_and!27193 (not b!911677))
(check-sat b_and!27193 (not b_next!16645))
