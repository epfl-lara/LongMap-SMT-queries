; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42576 () Bool)

(assert start!42576)

(declare-fun b_free!12025 () Bool)

(declare-fun b_next!12025 () Bool)

(assert (=> start!42576 (= b_free!12025 (not b_next!12025))))

(declare-fun tp!42115 () Bool)

(declare-fun b_and!20479 () Bool)

(assert (=> start!42576 (= tp!42115 b_and!20479)))

(declare-fun b!474880 () Bool)

(declare-fun e!278797 () Bool)

(assert (=> b!474880 (= e!278797 false)))

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((V!19043 0))(
  ( (V!19044 (val!6771 Int)) )
))
(declare-datatypes ((tuple2!8986 0))(
  ( (tuple2!8987 (_1!4504 (_ BitVec 64)) (_2!4504 V!19043)) )
))
(declare-datatypes ((List!9047 0))(
  ( (Nil!9044) (Cons!9043 (h!9899 tuple2!8986) (t!15012 List!9047)) )
))
(declare-datatypes ((ListLongMap!7889 0))(
  ( (ListLongMap!7890 (toList!3960 List!9047)) )
))
(declare-fun lt!216161 () ListLongMap!7889)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30635 0))(
  ( (array!30636 (arr!14735 (Array (_ BitVec 32) (_ BitVec 64))) (size!15088 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30635)

(declare-datatypes ((ValueCell!6383 0))(
  ( (ValueCellFull!6383 (v!9058 V!19043)) (EmptyCell!6383) )
))
(declare-datatypes ((array!30637 0))(
  ( (array!30638 (arr!14736 (Array (_ BitVec 32) ValueCell!6383)) (size!15089 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30637)

(declare-fun zeroValue!794 () V!19043)

(declare-fun minValueAfter!38 () V!19043)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2127 (array!30635 array!30637 (_ BitVec 32) (_ BitVec 32) V!19043 V!19043 (_ BitVec 32) Int) ListLongMap!7889)

(assert (=> b!474880 (= lt!216161 (getCurrentListMapNoExtraKeys!2127 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19043)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!216160 () ListLongMap!7889)

(assert (=> b!474880 (= lt!216160 (getCurrentListMapNoExtraKeys!2127 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21898 () Bool)

(declare-fun mapRes!21898 () Bool)

(declare-fun tp!42114 () Bool)

(declare-fun e!278798 () Bool)

(assert (=> mapNonEmpty!21898 (= mapRes!21898 (and tp!42114 e!278798))))

(declare-fun mapRest!21898 () (Array (_ BitVec 32) ValueCell!6383))

(declare-fun mapValue!21898 () ValueCell!6383)

(declare-fun mapKey!21898 () (_ BitVec 32))

(assert (=> mapNonEmpty!21898 (= (arr!14736 _values!833) (store mapRest!21898 mapKey!21898 mapValue!21898))))

(declare-fun b!474881 () Bool)

(declare-fun res!283639 () Bool)

(assert (=> b!474881 (=> (not res!283639) (not e!278797))))

(declare-datatypes ((List!9048 0))(
  ( (Nil!9045) (Cons!9044 (h!9900 (_ BitVec 64)) (t!15013 List!9048)) )
))
(declare-fun arrayNoDuplicates!0 (array!30635 (_ BitVec 32) List!9048) Bool)

(assert (=> b!474881 (= res!283639 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9045))))

(declare-fun b!474882 () Bool)

(declare-fun e!278796 () Bool)

(declare-fun tp_is_empty!13453 () Bool)

(assert (=> b!474882 (= e!278796 tp_is_empty!13453)))

(declare-fun res!283640 () Bool)

(assert (=> start!42576 (=> (not res!283640) (not e!278797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42576 (= res!283640 (validMask!0 mask!1365))))

(assert (=> start!42576 e!278797))

(assert (=> start!42576 tp_is_empty!13453))

(assert (=> start!42576 tp!42115))

(assert (=> start!42576 true))

(declare-fun array_inv!10714 (array!30635) Bool)

(assert (=> start!42576 (array_inv!10714 _keys!1025)))

(declare-fun e!278799 () Bool)

(declare-fun array_inv!10715 (array!30637) Bool)

(assert (=> start!42576 (and (array_inv!10715 _values!833) e!278799)))

(declare-fun b!474883 () Bool)

(assert (=> b!474883 (= e!278799 (and e!278796 mapRes!21898))))

(declare-fun condMapEmpty!21898 () Bool)

(declare-fun mapDefault!21898 () ValueCell!6383)

(assert (=> b!474883 (= condMapEmpty!21898 (= (arr!14736 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6383)) mapDefault!21898)))))

(declare-fun b!474884 () Bool)

(declare-fun res!283641 () Bool)

(assert (=> b!474884 (=> (not res!283641) (not e!278797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30635 (_ BitVec 32)) Bool)

(assert (=> b!474884 (= res!283641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474885 () Bool)

(assert (=> b!474885 (= e!278798 tp_is_empty!13453)))

(declare-fun mapIsEmpty!21898 () Bool)

(assert (=> mapIsEmpty!21898 mapRes!21898))

(declare-fun b!474886 () Bool)

(declare-fun res!283638 () Bool)

(assert (=> b!474886 (=> (not res!283638) (not e!278797))))

(assert (=> b!474886 (= res!283638 (and (= (size!15089 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15088 _keys!1025) (size!15089 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42576 res!283640) b!474886))

(assert (= (and b!474886 res!283638) b!474884))

(assert (= (and b!474884 res!283641) b!474881))

(assert (= (and b!474881 res!283639) b!474880))

(assert (= (and b!474883 condMapEmpty!21898) mapIsEmpty!21898))

(assert (= (and b!474883 (not condMapEmpty!21898)) mapNonEmpty!21898))

(get-info :version)

(assert (= (and mapNonEmpty!21898 ((_ is ValueCellFull!6383) mapValue!21898)) b!474885))

(assert (= (and b!474883 ((_ is ValueCellFull!6383) mapDefault!21898)) b!474882))

(assert (= start!42576 b!474883))

(declare-fun m!456665 () Bool)

(assert (=> start!42576 m!456665))

(declare-fun m!456667 () Bool)

(assert (=> start!42576 m!456667))

(declare-fun m!456669 () Bool)

(assert (=> start!42576 m!456669))

(declare-fun m!456671 () Bool)

(assert (=> b!474880 m!456671))

(declare-fun m!456673 () Bool)

(assert (=> b!474880 m!456673))

(declare-fun m!456675 () Bool)

(assert (=> mapNonEmpty!21898 m!456675))

(declare-fun m!456677 () Bool)

(assert (=> b!474881 m!456677))

(declare-fun m!456679 () Bool)

(assert (=> b!474884 m!456679))

(check-sat (not start!42576) (not b_next!12025) (not b!474881) (not mapNonEmpty!21898) (not b!474884) tp_is_empty!13453 (not b!474880) b_and!20479)
(check-sat b_and!20479 (not b_next!12025))
