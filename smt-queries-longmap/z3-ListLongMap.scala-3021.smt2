; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42466 () Bool)

(assert start!42466)

(declare-fun b_free!11935 () Bool)

(declare-fun b_next!11935 () Bool)

(assert (=> start!42466 (= b_free!11935 (not b_next!11935))))

(declare-fun tp!41842 () Bool)

(declare-fun b_and!20377 () Bool)

(assert (=> start!42466 (= tp!41842 b_and!20377)))

(declare-fun b!473702 () Bool)

(declare-fun e!277955 () Bool)

(declare-fun tp_is_empty!13363 () Bool)

(assert (=> b!473702 (= e!277955 tp_is_empty!13363)))

(declare-fun b!473703 () Bool)

(declare-fun e!277957 () Bool)

(assert (=> b!473703 (= e!277957 tp_is_empty!13363)))

(declare-fun b!473704 () Bool)

(declare-fun e!277959 () Bool)

(assert (=> b!473704 (= e!277959 true)))

(declare-datatypes ((V!18923 0))(
  ( (V!18924 (val!6726 Int)) )
))
(declare-datatypes ((tuple2!8920 0))(
  ( (tuple2!8921 (_1!4471 (_ BitVec 64)) (_2!4471 V!18923)) )
))
(declare-datatypes ((List!8985 0))(
  ( (Nil!8982) (Cons!8981 (h!9837 tuple2!8920) (t!14948 List!8985)) )
))
(declare-datatypes ((ListLongMap!7823 0))(
  ( (ListLongMap!7824 (toList!3927 List!8985)) )
))
(declare-fun lt!215415 () ListLongMap!7823)

(declare-fun lt!215417 () tuple2!8920)

(declare-fun minValueBefore!38 () V!18923)

(declare-fun +!1776 (ListLongMap!7823 tuple2!8920) ListLongMap!7823)

(assert (=> b!473704 (= (+!1776 lt!215415 lt!215417) (+!1776 (+!1776 lt!215415 (tuple2!8921 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215417))))

(declare-fun minValueAfter!38 () V!18923)

(assert (=> b!473704 (= lt!215417 (tuple2!8921 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13950 0))(
  ( (Unit!13951) )
))
(declare-fun lt!215419 () Unit!13950)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!155 (ListLongMap!7823 (_ BitVec 64) V!18923 V!18923) Unit!13950)

(assert (=> b!473704 (= lt!215419 (addSameAsAddTwiceSameKeyDiffValues!155 lt!215415 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215414 () ListLongMap!7823)

(declare-fun zeroValue!794 () V!18923)

(assert (=> b!473704 (= lt!215415 (+!1776 lt!215414 (tuple2!8921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun lt!215420 () ListLongMap!7823)

(declare-datatypes ((array!30465 0))(
  ( (array!30466 (arr!14651 (Array (_ BitVec 32) (_ BitVec 64))) (size!15004 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30465)

(declare-datatypes ((ValueCell!6338 0))(
  ( (ValueCellFull!6338 (v!9012 V!18923)) (EmptyCell!6338) )
))
(declare-datatypes ((array!30467 0))(
  ( (array!30468 (arr!14652 (Array (_ BitVec 32) ValueCell!6338)) (size!15005 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30467)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2228 (array!30465 array!30467 (_ BitVec 32) (_ BitVec 32) V!18923 V!18923 (_ BitVec 32) Int) ListLongMap!7823)

(assert (=> b!473704 (= lt!215420 (getCurrentListMap!2228 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!215416 () ListLongMap!7823)

(assert (=> b!473704 (= lt!215416 (getCurrentListMap!2228 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473705 () Bool)

(declare-fun res!282968 () Bool)

(declare-fun e!277956 () Bool)

(assert (=> b!473705 (=> (not res!282968) (not e!277956))))

(declare-datatypes ((List!8986 0))(
  ( (Nil!8983) (Cons!8982 (h!9838 (_ BitVec 64)) (t!14949 List!8986)) )
))
(declare-fun arrayNoDuplicates!0 (array!30465 (_ BitVec 32) List!8986) Bool)

(assert (=> b!473705 (= res!282968 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8983))))

(declare-fun b!473706 () Bool)

(declare-fun e!277960 () Bool)

(declare-fun mapRes!21760 () Bool)

(assert (=> b!473706 (= e!277960 (and e!277957 mapRes!21760))))

(declare-fun condMapEmpty!21760 () Bool)

(declare-fun mapDefault!21760 () ValueCell!6338)

(assert (=> b!473706 (= condMapEmpty!21760 (= (arr!14652 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6338)) mapDefault!21760)))))

(declare-fun res!282971 () Bool)

(assert (=> start!42466 (=> (not res!282971) (not e!277956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42466 (= res!282971 (validMask!0 mask!1365))))

(assert (=> start!42466 e!277956))

(assert (=> start!42466 tp_is_empty!13363))

(assert (=> start!42466 tp!41842))

(assert (=> start!42466 true))

(declare-fun array_inv!10658 (array!30465) Bool)

(assert (=> start!42466 (array_inv!10658 _keys!1025)))

(declare-fun array_inv!10659 (array!30467) Bool)

(assert (=> start!42466 (and (array_inv!10659 _values!833) e!277960)))

(declare-fun b!473707 () Bool)

(declare-fun res!282969 () Bool)

(assert (=> b!473707 (=> (not res!282969) (not e!277956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30465 (_ BitVec 32)) Bool)

(assert (=> b!473707 (= res!282969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21760 () Bool)

(assert (=> mapIsEmpty!21760 mapRes!21760))

(declare-fun b!473708 () Bool)

(assert (=> b!473708 (= e!277956 (not e!277959))))

(declare-fun res!282967 () Bool)

(assert (=> b!473708 (=> res!282967 e!277959)))

(assert (=> b!473708 (= res!282967 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215418 () ListLongMap!7823)

(assert (=> b!473708 (= lt!215414 lt!215418)))

(declare-fun lt!215421 () Unit!13950)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!252 (array!30465 array!30467 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18923 V!18923 V!18923 V!18923 (_ BitVec 32) Int) Unit!13950)

(assert (=> b!473708 (= lt!215421 (lemmaNoChangeToArrayThenSameMapNoExtras!252 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2095 (array!30465 array!30467 (_ BitVec 32) (_ BitVec 32) V!18923 V!18923 (_ BitVec 32) Int) ListLongMap!7823)

(assert (=> b!473708 (= lt!215418 (getCurrentListMapNoExtraKeys!2095 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473708 (= lt!215414 (getCurrentListMapNoExtraKeys!2095 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21760 () Bool)

(declare-fun tp!41841 () Bool)

(assert (=> mapNonEmpty!21760 (= mapRes!21760 (and tp!41841 e!277955))))

(declare-fun mapRest!21760 () (Array (_ BitVec 32) ValueCell!6338))

(declare-fun mapValue!21760 () ValueCell!6338)

(declare-fun mapKey!21760 () (_ BitVec 32))

(assert (=> mapNonEmpty!21760 (= (arr!14652 _values!833) (store mapRest!21760 mapKey!21760 mapValue!21760))))

(declare-fun b!473709 () Bool)

(declare-fun res!282970 () Bool)

(assert (=> b!473709 (=> (not res!282970) (not e!277956))))

(assert (=> b!473709 (= res!282970 (and (= (size!15005 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15004 _keys!1025) (size!15005 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42466 res!282971) b!473709))

(assert (= (and b!473709 res!282970) b!473707))

(assert (= (and b!473707 res!282969) b!473705))

(assert (= (and b!473705 res!282968) b!473708))

(assert (= (and b!473708 (not res!282967)) b!473704))

(assert (= (and b!473706 condMapEmpty!21760) mapIsEmpty!21760))

(assert (= (and b!473706 (not condMapEmpty!21760)) mapNonEmpty!21760))

(get-info :version)

(assert (= (and mapNonEmpty!21760 ((_ is ValueCellFull!6338) mapValue!21760)) b!473702))

(assert (= (and b!473706 ((_ is ValueCellFull!6338) mapDefault!21760)) b!473703))

(assert (= start!42466 b!473706))

(declare-fun m!455439 () Bool)

(assert (=> b!473708 m!455439))

(declare-fun m!455441 () Bool)

(assert (=> b!473708 m!455441))

(declare-fun m!455443 () Bool)

(assert (=> b!473708 m!455443))

(declare-fun m!455445 () Bool)

(assert (=> b!473707 m!455445))

(declare-fun m!455447 () Bool)

(assert (=> mapNonEmpty!21760 m!455447))

(declare-fun m!455449 () Bool)

(assert (=> start!42466 m!455449))

(declare-fun m!455451 () Bool)

(assert (=> start!42466 m!455451))

(declare-fun m!455453 () Bool)

(assert (=> start!42466 m!455453))

(declare-fun m!455455 () Bool)

(assert (=> b!473704 m!455455))

(declare-fun m!455457 () Bool)

(assert (=> b!473704 m!455457))

(declare-fun m!455459 () Bool)

(assert (=> b!473704 m!455459))

(assert (=> b!473704 m!455455))

(declare-fun m!455461 () Bool)

(assert (=> b!473704 m!455461))

(declare-fun m!455463 () Bool)

(assert (=> b!473704 m!455463))

(declare-fun m!455465 () Bool)

(assert (=> b!473704 m!455465))

(declare-fun m!455467 () Bool)

(assert (=> b!473704 m!455467))

(declare-fun m!455469 () Bool)

(assert (=> b!473705 m!455469))

(check-sat (not b!473704) b_and!20377 (not b!473707) tp_is_empty!13363 (not mapNonEmpty!21760) (not b_next!11935) (not b!473705) (not b!473708) (not start!42466))
(check-sat b_and!20377 (not b_next!11935))
