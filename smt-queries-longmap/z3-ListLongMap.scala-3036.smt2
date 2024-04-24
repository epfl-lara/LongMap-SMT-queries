; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42576 () Bool)

(assert start!42576)

(declare-fun b_free!12025 () Bool)

(declare-fun b_next!12025 () Bool)

(assert (=> start!42576 (= b_free!12025 (not b_next!12025))))

(declare-fun tp!42115 () Bool)

(declare-fun b_and!20515 () Bool)

(assert (=> start!42576 (= tp!42115 b_and!20515)))

(declare-fun b!475090 () Bool)

(declare-fun e!278930 () Bool)

(assert (=> b!475090 (= e!278930 false)))

(declare-datatypes ((V!19043 0))(
  ( (V!19044 (val!6771 Int)) )
))
(declare-fun zeroValue!794 () V!19043)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8856 0))(
  ( (tuple2!8857 (_1!4439 (_ BitVec 64)) (_2!4439 V!19043)) )
))
(declare-datatypes ((List!8914 0))(
  ( (Nil!8911) (Cons!8910 (h!9766 tuple2!8856) (t!14880 List!8914)) )
))
(declare-datatypes ((ListLongMap!7771 0))(
  ( (ListLongMap!7772 (toList!3901 List!8914)) )
))
(declare-fun lt!216406 () ListLongMap!7771)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30630 0))(
  ( (array!30631 (arr!14732 (Array (_ BitVec 32) (_ BitVec 64))) (size!15084 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30630)

(declare-datatypes ((ValueCell!6383 0))(
  ( (ValueCellFull!6383 (v!9065 V!19043)) (EmptyCell!6383) )
))
(declare-datatypes ((array!30632 0))(
  ( (array!30633 (arr!14733 (Array (_ BitVec 32) ValueCell!6383)) (size!15085 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30632)

(declare-fun minValueAfter!38 () V!19043)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2108 (array!30630 array!30632 (_ BitVec 32) (_ BitVec 32) V!19043 V!19043 (_ BitVec 32) Int) ListLongMap!7771)

(assert (=> b!475090 (= lt!216406 (getCurrentListMapNoExtraKeys!2108 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19043)

(declare-fun lt!216407 () ListLongMap!7771)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!475090 (= lt!216407 (getCurrentListMapNoExtraKeys!2108 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21898 () Bool)

(declare-fun mapRes!21898 () Bool)

(assert (=> mapIsEmpty!21898 mapRes!21898))

(declare-fun b!475091 () Bool)

(declare-fun res!283760 () Bool)

(assert (=> b!475091 (=> (not res!283760) (not e!278930))))

(assert (=> b!475091 (= res!283760 (and (= (size!15085 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15084 _keys!1025) (size!15085 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475092 () Bool)

(declare-fun e!278932 () Bool)

(declare-fun e!278933 () Bool)

(assert (=> b!475092 (= e!278932 (and e!278933 mapRes!21898))))

(declare-fun condMapEmpty!21898 () Bool)

(declare-fun mapDefault!21898 () ValueCell!6383)

(assert (=> b!475092 (= condMapEmpty!21898 (= (arr!14733 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6383)) mapDefault!21898)))))

(declare-fun b!475093 () Bool)

(declare-fun tp_is_empty!13453 () Bool)

(assert (=> b!475093 (= e!278933 tp_is_empty!13453)))

(declare-fun b!475094 () Bool)

(declare-fun res!283763 () Bool)

(assert (=> b!475094 (=> (not res!283763) (not e!278930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30630 (_ BitVec 32)) Bool)

(assert (=> b!475094 (= res!283763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!475095 () Bool)

(declare-fun e!278931 () Bool)

(assert (=> b!475095 (= e!278931 tp_is_empty!13453)))

(declare-fun b!475096 () Bool)

(declare-fun res!283761 () Bool)

(assert (=> b!475096 (=> (not res!283761) (not e!278930))))

(declare-datatypes ((List!8915 0))(
  ( (Nil!8912) (Cons!8911 (h!9767 (_ BitVec 64)) (t!14881 List!8915)) )
))
(declare-fun arrayNoDuplicates!0 (array!30630 (_ BitVec 32) List!8915) Bool)

(assert (=> b!475096 (= res!283761 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8912))))

(declare-fun mapNonEmpty!21898 () Bool)

(declare-fun tp!42114 () Bool)

(assert (=> mapNonEmpty!21898 (= mapRes!21898 (and tp!42114 e!278931))))

(declare-fun mapKey!21898 () (_ BitVec 32))

(declare-fun mapRest!21898 () (Array (_ BitVec 32) ValueCell!6383))

(declare-fun mapValue!21898 () ValueCell!6383)

(assert (=> mapNonEmpty!21898 (= (arr!14733 _values!833) (store mapRest!21898 mapKey!21898 mapValue!21898))))

(declare-fun res!283762 () Bool)

(assert (=> start!42576 (=> (not res!283762) (not e!278930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42576 (= res!283762 (validMask!0 mask!1365))))

(assert (=> start!42576 e!278930))

(assert (=> start!42576 tp_is_empty!13453))

(assert (=> start!42576 tp!42115))

(assert (=> start!42576 true))

(declare-fun array_inv!10704 (array!30630) Bool)

(assert (=> start!42576 (array_inv!10704 _keys!1025)))

(declare-fun array_inv!10705 (array!30632) Bool)

(assert (=> start!42576 (and (array_inv!10705 _values!833) e!278932)))

(assert (= (and start!42576 res!283762) b!475091))

(assert (= (and b!475091 res!283760) b!475094))

(assert (= (and b!475094 res!283763) b!475096))

(assert (= (and b!475096 res!283761) b!475090))

(assert (= (and b!475092 condMapEmpty!21898) mapIsEmpty!21898))

(assert (= (and b!475092 (not condMapEmpty!21898)) mapNonEmpty!21898))

(get-info :version)

(assert (= (and mapNonEmpty!21898 ((_ is ValueCellFull!6383) mapValue!21898)) b!475095))

(assert (= (and b!475092 ((_ is ValueCellFull!6383) mapDefault!21898)) b!475093))

(assert (= start!42576 b!475092))

(declare-fun m!457581 () Bool)

(assert (=> b!475090 m!457581))

(declare-fun m!457583 () Bool)

(assert (=> b!475090 m!457583))

(declare-fun m!457585 () Bool)

(assert (=> b!475096 m!457585))

(declare-fun m!457587 () Bool)

(assert (=> mapNonEmpty!21898 m!457587))

(declare-fun m!457589 () Bool)

(assert (=> start!42576 m!457589))

(declare-fun m!457591 () Bool)

(assert (=> start!42576 m!457591))

(declare-fun m!457593 () Bool)

(assert (=> start!42576 m!457593))

(declare-fun m!457595 () Bool)

(assert (=> b!475094 m!457595))

(check-sat (not b_next!12025) (not b!475090) b_and!20515 (not start!42576) tp_is_empty!13453 (not b!475094) (not mapNonEmpty!21898) (not b!475096))
(check-sat b_and!20515 (not b_next!12025))
