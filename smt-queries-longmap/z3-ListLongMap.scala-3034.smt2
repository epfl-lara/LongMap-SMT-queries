; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42564 () Bool)

(assert start!42564)

(declare-fun b_free!12013 () Bool)

(declare-fun b_next!12013 () Bool)

(assert (=> start!42564 (= b_free!12013 (not b_next!12013))))

(declare-fun tp!42079 () Bool)

(declare-fun b_and!20503 () Bool)

(assert (=> start!42564 (= tp!42079 b_and!20503)))

(declare-fun res!283688 () Bool)

(declare-fun e!278844 () Bool)

(assert (=> start!42564 (=> (not res!283688) (not e!278844))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42564 (= res!283688 (validMask!0 mask!1365))))

(assert (=> start!42564 e!278844))

(declare-fun tp_is_empty!13441 () Bool)

(assert (=> start!42564 tp_is_empty!13441))

(assert (=> start!42564 tp!42079))

(assert (=> start!42564 true))

(declare-datatypes ((array!30606 0))(
  ( (array!30607 (arr!14720 (Array (_ BitVec 32) (_ BitVec 64))) (size!15072 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30606)

(declare-fun array_inv!10698 (array!30606) Bool)

(assert (=> start!42564 (array_inv!10698 _keys!1025)))

(declare-datatypes ((V!19027 0))(
  ( (V!19028 (val!6765 Int)) )
))
(declare-datatypes ((ValueCell!6377 0))(
  ( (ValueCellFull!6377 (v!9059 V!19027)) (EmptyCell!6377) )
))
(declare-datatypes ((array!30608 0))(
  ( (array!30609 (arr!14721 (Array (_ BitVec 32) ValueCell!6377)) (size!15073 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30608)

(declare-fun e!278842 () Bool)

(declare-fun array_inv!10699 (array!30608) Bool)

(assert (=> start!42564 (and (array_inv!10699 _values!833) e!278842)))

(declare-fun b!474964 () Bool)

(declare-fun res!283690 () Bool)

(assert (=> b!474964 (=> (not res!283690) (not e!278844))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!474964 (= res!283690 (and (= (size!15073 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15072 _keys!1025) (size!15073 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474965 () Bool)

(declare-fun e!278843 () Bool)

(assert (=> b!474965 (= e!278843 tp_is_empty!13441)))

(declare-fun b!474966 () Bool)

(declare-fun e!278841 () Bool)

(declare-fun mapRes!21880 () Bool)

(assert (=> b!474966 (= e!278842 (and e!278841 mapRes!21880))))

(declare-fun condMapEmpty!21880 () Bool)

(declare-fun mapDefault!21880 () ValueCell!6377)

(assert (=> b!474966 (= condMapEmpty!21880 (= (arr!14721 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6377)) mapDefault!21880)))))

(declare-fun b!474967 () Bool)

(declare-fun res!283691 () Bool)

(assert (=> b!474967 (=> (not res!283691) (not e!278844))))

(declare-datatypes ((List!8907 0))(
  ( (Nil!8904) (Cons!8903 (h!9759 (_ BitVec 64)) (t!14873 List!8907)) )
))
(declare-fun arrayNoDuplicates!0 (array!30606 (_ BitVec 32) List!8907) Bool)

(assert (=> b!474967 (= res!283691 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8904))))

(declare-fun b!474968 () Bool)

(declare-fun res!283689 () Bool)

(assert (=> b!474968 (=> (not res!283689) (not e!278844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30606 (_ BitVec 32)) Bool)

(assert (=> b!474968 (= res!283689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21880 () Bool)

(assert (=> mapIsEmpty!21880 mapRes!21880))

(declare-fun b!474969 () Bool)

(assert (=> b!474969 (= e!278841 tp_is_empty!13441)))

(declare-fun b!474970 () Bool)

(assert (=> b!474970 (= e!278844 false)))

(declare-datatypes ((tuple2!8848 0))(
  ( (tuple2!8849 (_1!4435 (_ BitVec 64)) (_2!4435 V!19027)) )
))
(declare-datatypes ((List!8908 0))(
  ( (Nil!8905) (Cons!8904 (h!9760 tuple2!8848) (t!14874 List!8908)) )
))
(declare-datatypes ((ListLongMap!7763 0))(
  ( (ListLongMap!7764 (toList!3897 List!8908)) )
))
(declare-fun lt!216371 () ListLongMap!7763)

(declare-fun zeroValue!794 () V!19027)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!19027)

(declare-fun getCurrentListMapNoExtraKeys!2104 (array!30606 array!30608 (_ BitVec 32) (_ BitVec 32) V!19027 V!19027 (_ BitVec 32) Int) ListLongMap!7763)

(assert (=> b!474970 (= lt!216371 (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216370 () ListLongMap!7763)

(declare-fun minValueBefore!38 () V!19027)

(assert (=> b!474970 (= lt!216370 (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21880 () Bool)

(declare-fun tp!42078 () Bool)

(assert (=> mapNonEmpty!21880 (= mapRes!21880 (and tp!42078 e!278843))))

(declare-fun mapKey!21880 () (_ BitVec 32))

(declare-fun mapRest!21880 () (Array (_ BitVec 32) ValueCell!6377))

(declare-fun mapValue!21880 () ValueCell!6377)

(assert (=> mapNonEmpty!21880 (= (arr!14721 _values!833) (store mapRest!21880 mapKey!21880 mapValue!21880))))

(assert (= (and start!42564 res!283688) b!474964))

(assert (= (and b!474964 res!283690) b!474968))

(assert (= (and b!474968 res!283689) b!474967))

(assert (= (and b!474967 res!283691) b!474970))

(assert (= (and b!474966 condMapEmpty!21880) mapIsEmpty!21880))

(assert (= (and b!474966 (not condMapEmpty!21880)) mapNonEmpty!21880))

(get-info :version)

(assert (= (and mapNonEmpty!21880 ((_ is ValueCellFull!6377) mapValue!21880)) b!474965))

(assert (= (and b!474966 ((_ is ValueCellFull!6377) mapDefault!21880)) b!474969))

(assert (= start!42564 b!474966))

(declare-fun m!457485 () Bool)

(assert (=> mapNonEmpty!21880 m!457485))

(declare-fun m!457487 () Bool)

(assert (=> start!42564 m!457487))

(declare-fun m!457489 () Bool)

(assert (=> start!42564 m!457489))

(declare-fun m!457491 () Bool)

(assert (=> start!42564 m!457491))

(declare-fun m!457493 () Bool)

(assert (=> b!474967 m!457493))

(declare-fun m!457495 () Bool)

(assert (=> b!474970 m!457495))

(declare-fun m!457497 () Bool)

(assert (=> b!474970 m!457497))

(declare-fun m!457499 () Bool)

(assert (=> b!474968 m!457499))

(check-sat tp_is_empty!13441 (not b!474968) (not mapNonEmpty!21880) (not b!474967) (not start!42564) b_and!20503 (not b_next!12013) (not b!474970))
(check-sat b_and!20503 (not b_next!12013))
