; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42630 () Bool)

(assert start!42630)

(declare-fun b_free!12049 () Bool)

(declare-fun b_next!12049 () Bool)

(assert (=> start!42630 (= b_free!12049 (not b_next!12049))))

(declare-fun tp!42192 () Bool)

(declare-fun b_and!20559 () Bool)

(assert (=> start!42630 (= tp!42192 b_and!20559)))

(declare-fun b!475613 () Bool)

(declare-fun e!279291 () Bool)

(declare-fun tp_is_empty!13477 () Bool)

(assert (=> b!475613 (= e!279291 tp_is_empty!13477)))

(declare-fun mapNonEmpty!21940 () Bool)

(declare-fun mapRes!21940 () Bool)

(declare-fun tp!42193 () Bool)

(assert (=> mapNonEmpty!21940 (= mapRes!21940 (and tp!42193 e!279291))))

(declare-datatypes ((V!19075 0))(
  ( (V!19076 (val!6783 Int)) )
))
(declare-datatypes ((ValueCell!6395 0))(
  ( (ValueCellFull!6395 (v!9078 V!19075)) (EmptyCell!6395) )
))
(declare-datatypes ((array!30682 0))(
  ( (array!30683 (arr!14756 (Array (_ BitVec 32) ValueCell!6395)) (size!15108 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30682)

(declare-fun mapValue!21940 () ValueCell!6395)

(declare-fun mapKey!21940 () (_ BitVec 32))

(declare-fun mapRest!21940 () (Array (_ BitVec 32) ValueCell!6395))

(assert (=> mapNonEmpty!21940 (= (arr!14756 _values!833) (store mapRest!21940 mapKey!21940 mapValue!21940))))

(declare-fun b!475614 () Bool)

(declare-fun e!279290 () Bool)

(declare-fun e!279288 () Bool)

(assert (=> b!475614 (= e!279290 (not e!279288))))

(declare-fun res!284022 () Bool)

(assert (=> b!475614 (=> res!284022 e!279288)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!475614 (= res!284022 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8868 0))(
  ( (tuple2!8869 (_1!4445 (_ BitVec 64)) (_2!4445 V!19075)) )
))
(declare-datatypes ((List!8928 0))(
  ( (Nil!8925) (Cons!8924 (h!9780 tuple2!8868) (t!14898 List!8928)) )
))
(declare-datatypes ((ListLongMap!7783 0))(
  ( (ListLongMap!7784 (toList!3907 List!8928)) )
))
(declare-fun lt!216673 () ListLongMap!7783)

(declare-fun lt!216674 () ListLongMap!7783)

(assert (=> b!475614 (= lt!216673 lt!216674)))

(declare-datatypes ((Unit!13982 0))(
  ( (Unit!13983) )
))
(declare-fun lt!216671 () Unit!13982)

(declare-fun minValueBefore!38 () V!19075)

(declare-fun zeroValue!794 () V!19075)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30684 0))(
  ( (array!30685 (arr!14757 (Array (_ BitVec 32) (_ BitVec 64))) (size!15109 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30684)

(declare-fun minValueAfter!38 () V!19075)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!252 (array!30684 array!30682 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19075 V!19075 V!19075 V!19075 (_ BitVec 32) Int) Unit!13982)

(assert (=> b!475614 (= lt!216671 (lemmaNoChangeToArrayThenSameMapNoExtras!252 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2114 (array!30684 array!30682 (_ BitVec 32) (_ BitVec 32) V!19075 V!19075 (_ BitVec 32) Int) ListLongMap!7783)

(assert (=> b!475614 (= lt!216674 (getCurrentListMapNoExtraKeys!2114 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!475614 (= lt!216673 (getCurrentListMapNoExtraKeys!2114 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!284023 () Bool)

(assert (=> start!42630 (=> (not res!284023) (not e!279290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42630 (= res!284023 (validMask!0 mask!1365))))

(assert (=> start!42630 e!279290))

(assert (=> start!42630 tp_is_empty!13477))

(assert (=> start!42630 tp!42192))

(assert (=> start!42630 true))

(declare-fun array_inv!10726 (array!30684) Bool)

(assert (=> start!42630 (array_inv!10726 _keys!1025)))

(declare-fun e!279289 () Bool)

(declare-fun array_inv!10727 (array!30682) Bool)

(assert (=> start!42630 (and (array_inv!10727 _values!833) e!279289)))

(declare-fun b!475615 () Bool)

(declare-fun e!279286 () Bool)

(assert (=> b!475615 (= e!279289 (and e!279286 mapRes!21940))))

(declare-fun condMapEmpty!21940 () Bool)

(declare-fun mapDefault!21940 () ValueCell!6395)

(assert (=> b!475615 (= condMapEmpty!21940 (= (arr!14756 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6395)) mapDefault!21940)))))

(declare-fun b!475616 () Bool)

(assert (=> b!475616 (= e!279286 tp_is_empty!13477)))

(declare-fun b!475617 () Bool)

(declare-fun res!284020 () Bool)

(assert (=> b!475617 (=> (not res!284020) (not e!279290))))

(declare-datatypes ((List!8929 0))(
  ( (Nil!8926) (Cons!8925 (h!9781 (_ BitVec 64)) (t!14899 List!8929)) )
))
(declare-fun arrayNoDuplicates!0 (array!30684 (_ BitVec 32) List!8929) Bool)

(assert (=> b!475617 (= res!284020 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8926))))

(declare-fun mapIsEmpty!21940 () Bool)

(assert (=> mapIsEmpty!21940 mapRes!21940))

(declare-fun b!475618 () Bool)

(declare-fun res!284019 () Bool)

(assert (=> b!475618 (=> (not res!284019) (not e!279290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30684 (_ BitVec 32)) Bool)

(assert (=> b!475618 (= res!284019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!475619 () Bool)

(assert (=> b!475619 (= e!279288 true)))

(declare-fun lt!216670 () ListLongMap!7783)

(declare-fun getCurrentListMap!2244 (array!30684 array!30682 (_ BitVec 32) (_ BitVec 32) V!19075 V!19075 (_ BitVec 32) Int) ListLongMap!7783)

(assert (=> b!475619 (= lt!216670 (getCurrentListMap!2244 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216672 () ListLongMap!7783)

(declare-fun +!1765 (ListLongMap!7783 tuple2!8868) ListLongMap!7783)

(assert (=> b!475619 (= lt!216672 (+!1765 (getCurrentListMap!2244 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8869 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!475620 () Bool)

(declare-fun res!284021 () Bool)

(assert (=> b!475620 (=> (not res!284021) (not e!279290))))

(assert (=> b!475620 (= res!284021 (and (= (size!15108 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15109 _keys!1025) (size!15108 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42630 res!284023) b!475620))

(assert (= (and b!475620 res!284021) b!475618))

(assert (= (and b!475618 res!284019) b!475617))

(assert (= (and b!475617 res!284020) b!475614))

(assert (= (and b!475614 (not res!284022)) b!475619))

(assert (= (and b!475615 condMapEmpty!21940) mapIsEmpty!21940))

(assert (= (and b!475615 (not condMapEmpty!21940)) mapNonEmpty!21940))

(get-info :version)

(assert (= (and mapNonEmpty!21940 ((_ is ValueCellFull!6395) mapValue!21940)) b!475613))

(assert (= (and b!475615 ((_ is ValueCellFull!6395) mapDefault!21940)) b!475616))

(assert (= start!42630 b!475615))

(declare-fun m!458031 () Bool)

(assert (=> b!475619 m!458031))

(declare-fun m!458033 () Bool)

(assert (=> b!475619 m!458033))

(assert (=> b!475619 m!458033))

(declare-fun m!458035 () Bool)

(assert (=> b!475619 m!458035))

(declare-fun m!458037 () Bool)

(assert (=> b!475617 m!458037))

(declare-fun m!458039 () Bool)

(assert (=> start!42630 m!458039))

(declare-fun m!458041 () Bool)

(assert (=> start!42630 m!458041))

(declare-fun m!458043 () Bool)

(assert (=> start!42630 m!458043))

(declare-fun m!458045 () Bool)

(assert (=> b!475618 m!458045))

(declare-fun m!458047 () Bool)

(assert (=> mapNonEmpty!21940 m!458047))

(declare-fun m!458049 () Bool)

(assert (=> b!475614 m!458049))

(declare-fun m!458051 () Bool)

(assert (=> b!475614 m!458051))

(declare-fun m!458053 () Bool)

(assert (=> b!475614 m!458053))

(check-sat (not b!475618) (not start!42630) tp_is_empty!13477 (not b!475614) b_and!20559 (not b!475617) (not b_next!12049) (not mapNonEmpty!21940) (not b!475619))
(check-sat b_and!20559 (not b_next!12049))
