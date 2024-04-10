; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42562 () Bool)

(assert start!42562)

(declare-fun b_free!11997 () Bool)

(declare-fun b_next!11997 () Bool)

(assert (=> start!42562 (= b_free!11997 (not b_next!11997))))

(declare-fun tp!42030 () Bool)

(declare-fun b_and!20477 () Bool)

(assert (=> start!42562 (= tp!42030 b_and!20477)))

(declare-fun mapNonEmpty!21856 () Bool)

(declare-fun mapRes!21856 () Bool)

(declare-fun tp!42031 () Bool)

(declare-fun e!278760 () Bool)

(assert (=> mapNonEmpty!21856 (= mapRes!21856 (and tp!42031 e!278760))))

(declare-datatypes ((V!19005 0))(
  ( (V!19006 (val!6757 Int)) )
))
(declare-datatypes ((ValueCell!6369 0))(
  ( (ValueCellFull!6369 (v!9050 V!19005)) (EmptyCell!6369) )
))
(declare-fun mapRest!21856 () (Array (_ BitVec 32) ValueCell!6369))

(declare-datatypes ((array!30595 0))(
  ( (array!30596 (arr!14715 (Array (_ BitVec 32) ValueCell!6369)) (size!15067 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30595)

(declare-fun mapKey!21856 () (_ BitVec 32))

(declare-fun mapValue!21856 () ValueCell!6369)

(assert (=> mapNonEmpty!21856 (= (arr!14715 _values!833) (store mapRest!21856 mapKey!21856 mapValue!21856))))

(declare-fun b!474857 () Bool)

(declare-fun res!283601 () Bool)

(declare-fun e!278761 () Bool)

(assert (=> b!474857 (=> (not res!283601) (not e!278761))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30597 0))(
  ( (array!30598 (arr!14716 (Array (_ BitVec 32) (_ BitVec 64))) (size!15068 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30597)

(assert (=> b!474857 (= res!283601 (and (= (size!15067 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15068 _keys!1025) (size!15067 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21856 () Bool)

(assert (=> mapIsEmpty!21856 mapRes!21856))

(declare-fun b!474858 () Bool)

(assert (=> b!474858 (= e!278761 false)))

(declare-fun zeroValue!794 () V!19005)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!19005)

(declare-datatypes ((tuple2!8914 0))(
  ( (tuple2!8915 (_1!4468 (_ BitVec 64)) (_2!4468 V!19005)) )
))
(declare-datatypes ((List!8989 0))(
  ( (Nil!8986) (Cons!8985 (h!9841 tuple2!8914) (t!14963 List!8989)) )
))
(declare-datatypes ((ListLongMap!7827 0))(
  ( (ListLongMap!7828 (toList!3929 List!8989)) )
))
(declare-fun lt!216311 () ListLongMap!7827)

(declare-fun getCurrentListMapNoExtraKeys!2086 (array!30597 array!30595 (_ BitVec 32) (_ BitVec 32) V!19005 V!19005 (_ BitVec 32) Int) ListLongMap!7827)

(assert (=> b!474858 (= lt!216311 (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19005)

(declare-fun lt!216310 () ListLongMap!7827)

(assert (=> b!474858 (= lt!216310 (getCurrentListMapNoExtraKeys!2086 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474859 () Bool)

(declare-fun res!283600 () Bool)

(assert (=> b!474859 (=> (not res!283600) (not e!278761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30597 (_ BitVec 32)) Bool)

(assert (=> b!474859 (= res!283600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474860 () Bool)

(declare-fun e!278763 () Bool)

(declare-fun e!278762 () Bool)

(assert (=> b!474860 (= e!278763 (and e!278762 mapRes!21856))))

(declare-fun condMapEmpty!21856 () Bool)

(declare-fun mapDefault!21856 () ValueCell!6369)

(assert (=> b!474860 (= condMapEmpty!21856 (= (arr!14715 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6369)) mapDefault!21856)))))

(declare-fun b!474862 () Bool)

(declare-fun res!283599 () Bool)

(assert (=> b!474862 (=> (not res!283599) (not e!278761))))

(declare-datatypes ((List!8990 0))(
  ( (Nil!8987) (Cons!8986 (h!9842 (_ BitVec 64)) (t!14964 List!8990)) )
))
(declare-fun arrayNoDuplicates!0 (array!30597 (_ BitVec 32) List!8990) Bool)

(assert (=> b!474862 (= res!283599 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8987))))

(declare-fun b!474863 () Bool)

(declare-fun tp_is_empty!13425 () Bool)

(assert (=> b!474863 (= e!278760 tp_is_empty!13425)))

(declare-fun res!283602 () Bool)

(assert (=> start!42562 (=> (not res!283602) (not e!278761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42562 (= res!283602 (validMask!0 mask!1365))))

(assert (=> start!42562 e!278761))

(assert (=> start!42562 tp_is_empty!13425))

(assert (=> start!42562 tp!42030))

(assert (=> start!42562 true))

(declare-fun array_inv!10618 (array!30597) Bool)

(assert (=> start!42562 (array_inv!10618 _keys!1025)))

(declare-fun array_inv!10619 (array!30595) Bool)

(assert (=> start!42562 (and (array_inv!10619 _values!833) e!278763)))

(declare-fun b!474861 () Bool)

(assert (=> b!474861 (= e!278762 tp_is_empty!13425)))

(assert (= (and start!42562 res!283602) b!474857))

(assert (= (and b!474857 res!283601) b!474859))

(assert (= (and b!474859 res!283600) b!474862))

(assert (= (and b!474862 res!283599) b!474858))

(assert (= (and b!474860 condMapEmpty!21856) mapIsEmpty!21856))

(assert (= (and b!474860 (not condMapEmpty!21856)) mapNonEmpty!21856))

(get-info :version)

(assert (= (and mapNonEmpty!21856 ((_ is ValueCellFull!6369) mapValue!21856)) b!474863))

(assert (= (and b!474860 ((_ is ValueCellFull!6369) mapDefault!21856)) b!474861))

(assert (= start!42562 b!474860))

(declare-fun m!457175 () Bool)

(assert (=> mapNonEmpty!21856 m!457175))

(declare-fun m!457177 () Bool)

(assert (=> start!42562 m!457177))

(declare-fun m!457179 () Bool)

(assert (=> start!42562 m!457179))

(declare-fun m!457181 () Bool)

(assert (=> start!42562 m!457181))

(declare-fun m!457183 () Bool)

(assert (=> b!474859 m!457183))

(declare-fun m!457185 () Bool)

(assert (=> b!474862 m!457185))

(declare-fun m!457187 () Bool)

(assert (=> b!474858 m!457187))

(declare-fun m!457189 () Bool)

(assert (=> b!474858 m!457189))

(check-sat b_and!20477 (not b_next!11997) (not b!474859) (not mapNonEmpty!21856) (not start!42562) tp_is_empty!13425 (not b!474862) (not b!474858))
(check-sat b_and!20477 (not b_next!11997))
