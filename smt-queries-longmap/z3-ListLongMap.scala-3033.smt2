; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42558 () Bool)

(assert start!42558)

(declare-fun b_free!12007 () Bool)

(declare-fun b_next!12007 () Bool)

(assert (=> start!42558 (= b_free!12007 (not b_next!12007))))

(declare-fun tp!42060 () Bool)

(declare-fun b_and!20497 () Bool)

(assert (=> start!42558 (= tp!42060 b_and!20497)))

(declare-fun b!474901 () Bool)

(declare-fun e!278797 () Bool)

(declare-fun e!278796 () Bool)

(declare-fun mapRes!21871 () Bool)

(assert (=> b!474901 (= e!278797 (and e!278796 mapRes!21871))))

(declare-fun condMapEmpty!21871 () Bool)

(declare-datatypes ((V!19019 0))(
  ( (V!19020 (val!6762 Int)) )
))
(declare-datatypes ((ValueCell!6374 0))(
  ( (ValueCellFull!6374 (v!9056 V!19019)) (EmptyCell!6374) )
))
(declare-datatypes ((array!30594 0))(
  ( (array!30595 (arr!14714 (Array (_ BitVec 32) ValueCell!6374)) (size!15066 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30594)

(declare-fun mapDefault!21871 () ValueCell!6374)

(assert (=> b!474901 (= condMapEmpty!21871 (= (arr!14714 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6374)) mapDefault!21871)))))

(declare-fun res!283654 () Bool)

(declare-fun e!278798 () Bool)

(assert (=> start!42558 (=> (not res!283654) (not e!278798))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42558 (= res!283654 (validMask!0 mask!1365))))

(assert (=> start!42558 e!278798))

(declare-fun tp_is_empty!13435 () Bool)

(assert (=> start!42558 tp_is_empty!13435))

(assert (=> start!42558 tp!42060))

(assert (=> start!42558 true))

(declare-datatypes ((array!30596 0))(
  ( (array!30597 (arr!14715 (Array (_ BitVec 32) (_ BitVec 64))) (size!15067 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30596)

(declare-fun array_inv!10692 (array!30596) Bool)

(assert (=> start!42558 (array_inv!10692 _keys!1025)))

(declare-fun array_inv!10693 (array!30594) Bool)

(assert (=> start!42558 (and (array_inv!10693 _values!833) e!278797)))

(declare-fun b!474902 () Bool)

(declare-fun res!283652 () Bool)

(assert (=> b!474902 (=> (not res!283652) (not e!278798))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!474902 (= res!283652 (and (= (size!15066 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15067 _keys!1025) (size!15066 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474903 () Bool)

(assert (=> b!474903 (= e!278798 false)))

(declare-datatypes ((tuple2!8842 0))(
  ( (tuple2!8843 (_1!4432 (_ BitVec 64)) (_2!4432 V!19019)) )
))
(declare-datatypes ((List!8901 0))(
  ( (Nil!8898) (Cons!8897 (h!9753 tuple2!8842) (t!14867 List!8901)) )
))
(declare-datatypes ((ListLongMap!7757 0))(
  ( (ListLongMap!7758 (toList!3894 List!8901)) )
))
(declare-fun lt!216353 () ListLongMap!7757)

(declare-fun zeroValue!794 () V!19019)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!19019)

(declare-fun getCurrentListMapNoExtraKeys!2101 (array!30596 array!30594 (_ BitVec 32) (_ BitVec 32) V!19019 V!19019 (_ BitVec 32) Int) ListLongMap!7757)

(assert (=> b!474903 (= lt!216353 (getCurrentListMapNoExtraKeys!2101 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19019)

(declare-fun lt!216352 () ListLongMap!7757)

(assert (=> b!474903 (= lt!216352 (getCurrentListMapNoExtraKeys!2101 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21871 () Bool)

(declare-fun tp!42061 () Bool)

(declare-fun e!278799 () Bool)

(assert (=> mapNonEmpty!21871 (= mapRes!21871 (and tp!42061 e!278799))))

(declare-fun mapRest!21871 () (Array (_ BitVec 32) ValueCell!6374))

(declare-fun mapValue!21871 () ValueCell!6374)

(declare-fun mapKey!21871 () (_ BitVec 32))

(assert (=> mapNonEmpty!21871 (= (arr!14714 _values!833) (store mapRest!21871 mapKey!21871 mapValue!21871))))

(declare-fun b!474904 () Bool)

(declare-fun res!283653 () Bool)

(assert (=> b!474904 (=> (not res!283653) (not e!278798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30596 (_ BitVec 32)) Bool)

(assert (=> b!474904 (= res!283653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474905 () Bool)

(assert (=> b!474905 (= e!278796 tp_is_empty!13435)))

(declare-fun b!474906 () Bool)

(declare-fun res!283655 () Bool)

(assert (=> b!474906 (=> (not res!283655) (not e!278798))))

(declare-datatypes ((List!8902 0))(
  ( (Nil!8899) (Cons!8898 (h!9754 (_ BitVec 64)) (t!14868 List!8902)) )
))
(declare-fun arrayNoDuplicates!0 (array!30596 (_ BitVec 32) List!8902) Bool)

(assert (=> b!474906 (= res!283655 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8899))))

(declare-fun mapIsEmpty!21871 () Bool)

(assert (=> mapIsEmpty!21871 mapRes!21871))

(declare-fun b!474907 () Bool)

(assert (=> b!474907 (= e!278799 tp_is_empty!13435)))

(assert (= (and start!42558 res!283654) b!474902))

(assert (= (and b!474902 res!283652) b!474904))

(assert (= (and b!474904 res!283653) b!474906))

(assert (= (and b!474906 res!283655) b!474903))

(assert (= (and b!474901 condMapEmpty!21871) mapIsEmpty!21871))

(assert (= (and b!474901 (not condMapEmpty!21871)) mapNonEmpty!21871))

(get-info :version)

(assert (= (and mapNonEmpty!21871 ((_ is ValueCellFull!6374) mapValue!21871)) b!474907))

(assert (= (and b!474901 ((_ is ValueCellFull!6374) mapDefault!21871)) b!474905))

(assert (= start!42558 b!474901))

(declare-fun m!457437 () Bool)

(assert (=> start!42558 m!457437))

(declare-fun m!457439 () Bool)

(assert (=> start!42558 m!457439))

(declare-fun m!457441 () Bool)

(assert (=> start!42558 m!457441))

(declare-fun m!457443 () Bool)

(assert (=> b!474903 m!457443))

(declare-fun m!457445 () Bool)

(assert (=> b!474903 m!457445))

(declare-fun m!457447 () Bool)

(assert (=> b!474906 m!457447))

(declare-fun m!457449 () Bool)

(assert (=> mapNonEmpty!21871 m!457449))

(declare-fun m!457451 () Bool)

(assert (=> b!474904 m!457451))

(check-sat (not b!474906) (not mapNonEmpty!21871) (not b!474903) (not start!42558) tp_is_empty!13435 b_and!20497 (not b!474904) (not b_next!12007))
(check-sat b_and!20497 (not b_next!12007))
