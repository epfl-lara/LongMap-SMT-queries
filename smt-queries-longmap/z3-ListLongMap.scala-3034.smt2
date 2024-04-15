; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42564 () Bool)

(assert start!42564)

(declare-fun b_free!12013 () Bool)

(declare-fun b_next!12013 () Bool)

(assert (=> start!42564 (= b_free!12013 (not b_next!12013))))

(declare-fun tp!42078 () Bool)

(declare-fun b_and!20467 () Bool)

(assert (=> start!42564 (= tp!42078 b_and!20467)))

(declare-fun res!283567 () Bool)

(declare-fun e!278708 () Bool)

(assert (=> start!42564 (=> (not res!283567) (not e!278708))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42564 (= res!283567 (validMask!0 mask!1365))))

(assert (=> start!42564 e!278708))

(declare-fun tp_is_empty!13441 () Bool)

(assert (=> start!42564 tp_is_empty!13441))

(assert (=> start!42564 tp!42078))

(assert (=> start!42564 true))

(declare-datatypes ((array!30611 0))(
  ( (array!30612 (arr!14723 (Array (_ BitVec 32) (_ BitVec 64))) (size!15076 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30611)

(declare-fun array_inv!10706 (array!30611) Bool)

(assert (=> start!42564 (array_inv!10706 _keys!1025)))

(declare-datatypes ((V!19027 0))(
  ( (V!19028 (val!6765 Int)) )
))
(declare-datatypes ((ValueCell!6377 0))(
  ( (ValueCellFull!6377 (v!9052 V!19027)) (EmptyCell!6377) )
))
(declare-datatypes ((array!30613 0))(
  ( (array!30614 (arr!14724 (Array (_ BitVec 32) ValueCell!6377)) (size!15077 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30613)

(declare-fun e!278707 () Bool)

(declare-fun array_inv!10707 (array!30613) Bool)

(assert (=> start!42564 (and (array_inv!10707 _values!833) e!278707)))

(declare-fun mapIsEmpty!21880 () Bool)

(declare-fun mapRes!21880 () Bool)

(assert (=> mapIsEmpty!21880 mapRes!21880))

(declare-fun b!474754 () Bool)

(assert (=> b!474754 (= e!278708 false)))

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8974 0))(
  ( (tuple2!8975 (_1!4498 (_ BitVec 64)) (_2!4498 V!19027)) )
))
(declare-datatypes ((List!9036 0))(
  ( (Nil!9033) (Cons!9032 (h!9888 tuple2!8974) (t!15001 List!9036)) )
))
(declare-datatypes ((ListLongMap!7877 0))(
  ( (ListLongMap!7878 (toList!3954 List!9036)) )
))
(declare-fun lt!216125 () ListLongMap!7877)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun zeroValue!794 () V!19027)

(declare-fun minValueAfter!38 () V!19027)

(declare-fun getCurrentListMapNoExtraKeys!2121 (array!30611 array!30613 (_ BitVec 32) (_ BitVec 32) V!19027 V!19027 (_ BitVec 32) Int) ListLongMap!7877)

(assert (=> b!474754 (= lt!216125 (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19027)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!216124 () ListLongMap!7877)

(assert (=> b!474754 (= lt!216124 (getCurrentListMapNoExtraKeys!2121 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474755 () Bool)

(declare-fun e!278709 () Bool)

(assert (=> b!474755 (= e!278709 tp_is_empty!13441)))

(declare-fun mapNonEmpty!21880 () Bool)

(declare-fun tp!42079 () Bool)

(assert (=> mapNonEmpty!21880 (= mapRes!21880 (and tp!42079 e!278709))))

(declare-fun mapKey!21880 () (_ BitVec 32))

(declare-fun mapValue!21880 () ValueCell!6377)

(declare-fun mapRest!21880 () (Array (_ BitVec 32) ValueCell!6377))

(assert (=> mapNonEmpty!21880 (= (arr!14724 _values!833) (store mapRest!21880 mapKey!21880 mapValue!21880))))

(declare-fun b!474756 () Bool)

(declare-fun e!278706 () Bool)

(assert (=> b!474756 (= e!278706 tp_is_empty!13441)))

(declare-fun b!474757 () Bool)

(declare-fun res!283568 () Bool)

(assert (=> b!474757 (=> (not res!283568) (not e!278708))))

(assert (=> b!474757 (= res!283568 (and (= (size!15077 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15076 _keys!1025) (size!15077 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474758 () Bool)

(assert (=> b!474758 (= e!278707 (and e!278706 mapRes!21880))))

(declare-fun condMapEmpty!21880 () Bool)

(declare-fun mapDefault!21880 () ValueCell!6377)

(assert (=> b!474758 (= condMapEmpty!21880 (= (arr!14724 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6377)) mapDefault!21880)))))

(declare-fun b!474759 () Bool)

(declare-fun res!283566 () Bool)

(assert (=> b!474759 (=> (not res!283566) (not e!278708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30611 (_ BitVec 32)) Bool)

(assert (=> b!474759 (= res!283566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474760 () Bool)

(declare-fun res!283569 () Bool)

(assert (=> b!474760 (=> (not res!283569) (not e!278708))))

(declare-datatypes ((List!9037 0))(
  ( (Nil!9034) (Cons!9033 (h!9889 (_ BitVec 64)) (t!15002 List!9037)) )
))
(declare-fun arrayNoDuplicates!0 (array!30611 (_ BitVec 32) List!9037) Bool)

(assert (=> b!474760 (= res!283569 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9034))))

(assert (= (and start!42564 res!283567) b!474757))

(assert (= (and b!474757 res!283568) b!474759))

(assert (= (and b!474759 res!283566) b!474760))

(assert (= (and b!474760 res!283569) b!474754))

(assert (= (and b!474758 condMapEmpty!21880) mapIsEmpty!21880))

(assert (= (and b!474758 (not condMapEmpty!21880)) mapNonEmpty!21880))

(get-info :version)

(assert (= (and mapNonEmpty!21880 ((_ is ValueCellFull!6377) mapValue!21880)) b!474755))

(assert (= (and b!474758 ((_ is ValueCellFull!6377) mapDefault!21880)) b!474756))

(assert (= start!42564 b!474758))

(declare-fun m!456569 () Bool)

(assert (=> b!474754 m!456569))

(declare-fun m!456571 () Bool)

(assert (=> b!474754 m!456571))

(declare-fun m!456573 () Bool)

(assert (=> b!474759 m!456573))

(declare-fun m!456575 () Bool)

(assert (=> mapNonEmpty!21880 m!456575))

(declare-fun m!456577 () Bool)

(assert (=> b!474760 m!456577))

(declare-fun m!456579 () Bool)

(assert (=> start!42564 m!456579))

(declare-fun m!456581 () Bool)

(assert (=> start!42564 m!456581))

(declare-fun m!456583 () Bool)

(assert (=> start!42564 m!456583))

(check-sat (not b!474754) (not b_next!12013) (not b!474760) tp_is_empty!13441 b_and!20467 (not b!474759) (not mapNonEmpty!21880) (not start!42564))
(check-sat b_and!20467 (not b_next!12013))
