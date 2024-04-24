; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41888 () Bool)

(assert start!41888)

(declare-fun b_free!11491 () Bool)

(declare-fun b_next!11491 () Bool)

(assert (=> start!41888 (= b_free!11491 (not b_next!11491))))

(declare-fun tp!40485 () Bool)

(declare-fun b_and!19889 () Bool)

(assert (=> start!41888 (= tp!40485 b_and!19889)))

(declare-fun res!279562 () Bool)

(declare-fun e!273647 () Bool)

(assert (=> start!41888 (=> (not res!279562) (not e!273647))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41888 (= res!279562 (validMask!0 mask!1365))))

(assert (=> start!41888 e!273647))

(declare-fun tp_is_empty!12919 () Bool)

(assert (=> start!41888 tp_is_empty!12919))

(assert (=> start!41888 tp!40485))

(assert (=> start!41888 true))

(declare-datatypes ((array!29606 0))(
  ( (array!29607 (arr!14229 (Array (_ BitVec 32) (_ BitVec 64))) (size!14581 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29606)

(declare-fun array_inv!10362 (array!29606) Bool)

(assert (=> start!41888 (array_inv!10362 _keys!1025)))

(declare-datatypes ((V!18331 0))(
  ( (V!18332 (val!6504 Int)) )
))
(declare-datatypes ((ValueCell!6116 0))(
  ( (ValueCellFull!6116 (v!8794 V!18331)) (EmptyCell!6116) )
))
(declare-datatypes ((array!29608 0))(
  ( (array!29609 (arr!14230 (Array (_ BitVec 32) ValueCell!6116)) (size!14582 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29608)

(declare-fun e!273649 () Bool)

(declare-fun array_inv!10363 (array!29608) Bool)

(assert (=> start!41888 (and (array_inv!10363 _values!833) e!273649)))

(declare-fun b!467737 () Bool)

(declare-fun e!273651 () Bool)

(assert (=> b!467737 (= e!273651 tp_is_empty!12919)))

(declare-fun mapNonEmpty!21070 () Bool)

(declare-fun mapRes!21070 () Bool)

(declare-fun tp!40486 () Bool)

(assert (=> mapNonEmpty!21070 (= mapRes!21070 (and tp!40486 e!273651))))

(declare-fun mapKey!21070 () (_ BitVec 32))

(declare-fun mapValue!21070 () ValueCell!6116)

(declare-fun mapRest!21070 () (Array (_ BitVec 32) ValueCell!6116))

(assert (=> mapNonEmpty!21070 (= (arr!14230 _values!833) (store mapRest!21070 mapKey!21070 mapValue!21070))))

(declare-fun mapIsEmpty!21070 () Bool)

(assert (=> mapIsEmpty!21070 mapRes!21070))

(declare-fun b!467738 () Bool)

(declare-fun res!279561 () Bool)

(assert (=> b!467738 (=> (not res!279561) (not e!273647))))

(declare-datatypes ((List!8550 0))(
  ( (Nil!8547) (Cons!8546 (h!9402 (_ BitVec 64)) (t!14498 List!8550)) )
))
(declare-fun arrayNoDuplicates!0 (array!29606 (_ BitVec 32) List!8550) Bool)

(assert (=> b!467738 (= res!279561 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8547))))

(declare-fun b!467739 () Bool)

(declare-fun e!273648 () Bool)

(assert (=> b!467739 (= e!273648 true)))

(declare-fun minValueBefore!38 () V!18331)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8470 0))(
  ( (tuple2!8471 (_1!4246 (_ BitVec 64)) (_2!4246 V!18331)) )
))
(declare-datatypes ((List!8551 0))(
  ( (Nil!8548) (Cons!8547 (h!9403 tuple2!8470) (t!14499 List!8551)) )
))
(declare-datatypes ((ListLongMap!7385 0))(
  ( (ListLongMap!7386 (toList!3708 List!8551)) )
))
(declare-fun lt!211525 () ListLongMap!7385)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun zeroValue!794 () V!18331)

(declare-fun getCurrentListMap!2138 (array!29606 array!29608 (_ BitVec 32) (_ BitVec 32) V!18331 V!18331 (_ BitVec 32) Int) ListLongMap!7385)

(assert (=> b!467739 (= lt!211525 (getCurrentListMap!2138 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467740 () Bool)

(declare-fun res!279563 () Bool)

(assert (=> b!467740 (=> (not res!279563) (not e!273647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29606 (_ BitVec 32)) Bool)

(assert (=> b!467740 (= res!279563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467741 () Bool)

(declare-fun e!273650 () Bool)

(assert (=> b!467741 (= e!273649 (and e!273650 mapRes!21070))))

(declare-fun condMapEmpty!21070 () Bool)

(declare-fun mapDefault!21070 () ValueCell!6116)

(assert (=> b!467741 (= condMapEmpty!21070 (= (arr!14230 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6116)) mapDefault!21070)))))

(declare-fun b!467742 () Bool)

(assert (=> b!467742 (= e!273647 (not e!273648))))

(declare-fun res!279564 () Bool)

(assert (=> b!467742 (=> res!279564 e!273648)))

(assert (=> b!467742 (= res!279564 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211524 () ListLongMap!7385)

(declare-fun lt!211527 () ListLongMap!7385)

(assert (=> b!467742 (= lt!211524 lt!211527)))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18331)

(declare-datatypes ((Unit!13628 0))(
  ( (Unit!13629) )
))
(declare-fun lt!211526 () Unit!13628)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!90 (array!29606 array!29608 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18331 V!18331 V!18331 V!18331 (_ BitVec 32) Int) Unit!13628)

(assert (=> b!467742 (= lt!211526 (lemmaNoChangeToArrayThenSameMapNoExtras!90 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1930 (array!29606 array!29608 (_ BitVec 32) (_ BitVec 32) V!18331 V!18331 (_ BitVec 32) Int) ListLongMap!7385)

(assert (=> b!467742 (= lt!211527 (getCurrentListMapNoExtraKeys!1930 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467742 (= lt!211524 (getCurrentListMapNoExtraKeys!1930 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467743 () Bool)

(assert (=> b!467743 (= e!273650 tp_is_empty!12919)))

(declare-fun b!467744 () Bool)

(declare-fun res!279560 () Bool)

(assert (=> b!467744 (=> (not res!279560) (not e!273647))))

(assert (=> b!467744 (= res!279560 (and (= (size!14582 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14581 _keys!1025) (size!14582 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41888 res!279562) b!467744))

(assert (= (and b!467744 res!279560) b!467740))

(assert (= (and b!467740 res!279563) b!467738))

(assert (= (and b!467738 res!279561) b!467742))

(assert (= (and b!467742 (not res!279564)) b!467739))

(assert (= (and b!467741 condMapEmpty!21070) mapIsEmpty!21070))

(assert (= (and b!467741 (not condMapEmpty!21070)) mapNonEmpty!21070))

(get-info :version)

(assert (= (and mapNonEmpty!21070 ((_ is ValueCellFull!6116) mapValue!21070)) b!467737))

(assert (= (and b!467741 ((_ is ValueCellFull!6116) mapDefault!21070)) b!467743))

(assert (= start!41888 b!467741))

(declare-fun m!450071 () Bool)

(assert (=> b!467739 m!450071))

(declare-fun m!450073 () Bool)

(assert (=> b!467740 m!450073))

(declare-fun m!450075 () Bool)

(assert (=> mapNonEmpty!21070 m!450075))

(declare-fun m!450077 () Bool)

(assert (=> b!467738 m!450077))

(declare-fun m!450079 () Bool)

(assert (=> start!41888 m!450079))

(declare-fun m!450081 () Bool)

(assert (=> start!41888 m!450081))

(declare-fun m!450083 () Bool)

(assert (=> start!41888 m!450083))

(declare-fun m!450085 () Bool)

(assert (=> b!467742 m!450085))

(declare-fun m!450087 () Bool)

(assert (=> b!467742 m!450087))

(declare-fun m!450089 () Bool)

(assert (=> b!467742 m!450089))

(check-sat b_and!19889 (not b!467739) (not mapNonEmpty!21070) (not b!467738) tp_is_empty!12919 (not b!467740) (not b!467742) (not b_next!11491) (not start!41888))
(check-sat b_and!19889 (not b_next!11491))
