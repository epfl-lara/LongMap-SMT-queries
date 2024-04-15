; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78122 () Bool)

(assert start!78122)

(declare-fun b_free!16651 () Bool)

(declare-fun b_next!16651 () Bool)

(assert (=> start!78122 (= b_free!16651 (not b_next!16651))))

(declare-fun tp!58227 () Bool)

(declare-fun b_and!27199 () Bool)

(assert (=> start!78122 (= tp!58227 b_and!27199)))

(declare-fun mapIsEmpty!30328 () Bool)

(declare-fun mapRes!30328 () Bool)

(assert (=> mapIsEmpty!30328 mapRes!30328))

(declare-fun res!615124 () Bool)

(declare-fun e!511391 () Bool)

(assert (=> start!78122 (=> (not res!615124) (not e!511391))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78122 (= res!615124 (validMask!0 mask!1756))))

(assert (=> start!78122 e!511391))

(declare-datatypes ((V!30391 0))(
  ( (V!30392 (val!9585 Int)) )
))
(declare-datatypes ((ValueCell!9053 0))(
  ( (ValueCellFull!9053 (v!12094 V!30391)) (EmptyCell!9053) )
))
(declare-datatypes ((array!54133 0))(
  ( (array!54134 (arr!26022 (Array (_ BitVec 32) ValueCell!9053)) (size!26483 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54133)

(declare-fun e!511393 () Bool)

(declare-fun array_inv!20404 (array!54133) Bool)

(assert (=> start!78122 (and (array_inv!20404 _values!1152) e!511393)))

(assert (=> start!78122 tp!58227))

(assert (=> start!78122 true))

(declare-fun tp_is_empty!19069 () Bool)

(assert (=> start!78122 tp_is_empty!19069))

(declare-datatypes ((array!54135 0))(
  ( (array!54136 (arr!26023 (Array (_ BitVec 32) (_ BitVec 64))) (size!26484 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54135)

(declare-fun array_inv!20405 (array!54135) Bool)

(assert (=> start!78122 (array_inv!20405 _keys!1386)))

(declare-fun b!911738 () Bool)

(declare-fun e!511394 () Bool)

(assert (=> b!911738 (= e!511394 tp_is_empty!19069)))

(declare-fun b!911739 () Bool)

(declare-fun e!511390 () Bool)

(assert (=> b!911739 (= e!511390 tp_is_empty!19069)))

(declare-fun b!911740 () Bool)

(declare-fun res!615121 () Bool)

(assert (=> b!911740 (=> (not res!615121) (not e!511391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54135 (_ BitVec 32)) Bool)

(assert (=> b!911740 (= res!615121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911741 () Bool)

(declare-fun res!615123 () Bool)

(assert (=> b!911741 (=> (not res!615123) (not e!511391))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!911741 (= res!615123 (and (= (size!26483 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26484 _keys!1386) (size!26483 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911742 () Bool)

(assert (=> b!911742 (= e!511393 (and e!511390 mapRes!30328))))

(declare-fun condMapEmpty!30328 () Bool)

(declare-fun mapDefault!30328 () ValueCell!9053)

(assert (=> b!911742 (= condMapEmpty!30328 (= (arr!26022 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9053)) mapDefault!30328)))))

(declare-fun b!911743 () Bool)

(declare-fun res!615122 () Bool)

(assert (=> b!911743 (=> (not res!615122) (not e!511391))))

(declare-datatypes ((List!18311 0))(
  ( (Nil!18308) (Cons!18307 (h!19453 (_ BitVec 64)) (t!25889 List!18311)) )
))
(declare-fun arrayNoDuplicates!0 (array!54135 (_ BitVec 32) List!18311) Bool)

(assert (=> b!911743 (= res!615122 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18308))))

(declare-fun b!911744 () Bool)

(assert (=> b!911744 (= e!511391 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30391)

(declare-fun lt!410301 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30391)

(declare-datatypes ((tuple2!12530 0))(
  ( (tuple2!12531 (_1!6276 (_ BitVec 64)) (_2!6276 V!30391)) )
))
(declare-datatypes ((List!18312 0))(
  ( (Nil!18309) (Cons!18308 (h!19454 tuple2!12530) (t!25890 List!18312)) )
))
(declare-datatypes ((ListLongMap!11217 0))(
  ( (ListLongMap!11218 (toList!5624 List!18312)) )
))
(declare-fun contains!4626 (ListLongMap!11217 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2826 (array!54135 array!54133 (_ BitVec 32) (_ BitVec 32) V!30391 V!30391 (_ BitVec 32) Int) ListLongMap!11217)

(assert (=> b!911744 (= lt!410301 (contains!4626 (getCurrentListMap!2826 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!30328 () Bool)

(declare-fun tp!58228 () Bool)

(assert (=> mapNonEmpty!30328 (= mapRes!30328 (and tp!58228 e!511394))))

(declare-fun mapRest!30328 () (Array (_ BitVec 32) ValueCell!9053))

(declare-fun mapValue!30328 () ValueCell!9053)

(declare-fun mapKey!30328 () (_ BitVec 32))

(assert (=> mapNonEmpty!30328 (= (arr!26022 _values!1152) (store mapRest!30328 mapKey!30328 mapValue!30328))))

(assert (= (and start!78122 res!615124) b!911741))

(assert (= (and b!911741 res!615123) b!911740))

(assert (= (and b!911740 res!615121) b!911743))

(assert (= (and b!911743 res!615122) b!911744))

(assert (= (and b!911742 condMapEmpty!30328) mapIsEmpty!30328))

(assert (= (and b!911742 (not condMapEmpty!30328)) mapNonEmpty!30328))

(get-info :version)

(assert (= (and mapNonEmpty!30328 ((_ is ValueCellFull!9053) mapValue!30328)) b!911738))

(assert (= (and b!911742 ((_ is ValueCellFull!9053) mapDefault!30328)) b!911739))

(assert (= start!78122 b!911742))

(declare-fun m!845841 () Bool)

(assert (=> b!911744 m!845841))

(assert (=> b!911744 m!845841))

(declare-fun m!845843 () Bool)

(assert (=> b!911744 m!845843))

(declare-fun m!845845 () Bool)

(assert (=> mapNonEmpty!30328 m!845845))

(declare-fun m!845847 () Bool)

(assert (=> b!911743 m!845847))

(declare-fun m!845849 () Bool)

(assert (=> b!911740 m!845849))

(declare-fun m!845851 () Bool)

(assert (=> start!78122 m!845851))

(declare-fun m!845853 () Bool)

(assert (=> start!78122 m!845853))

(declare-fun m!845855 () Bool)

(assert (=> start!78122 m!845855))

(check-sat (not b!911740) (not b!911743) tp_is_empty!19069 (not start!78122) (not b_next!16651) (not mapNonEmpty!30328) (not b!911744) b_and!27199)
(check-sat b_and!27199 (not b_next!16651))
