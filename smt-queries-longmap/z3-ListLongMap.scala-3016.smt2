; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42416 () Bool)

(assert start!42416)

(declare-fun b_free!11905 () Bool)

(declare-fun b_next!11905 () Bool)

(assert (=> start!42416 (= b_free!11905 (not b_next!11905))))

(declare-fun tp!41749 () Bool)

(declare-fun b_and!20371 () Bool)

(assert (=> start!42416 (= tp!41749 b_and!20371)))

(declare-fun b!473371 () Bool)

(declare-fun res!282789 () Bool)

(declare-fun e!277710 () Bool)

(assert (=> b!473371 (=> (not res!282789) (not e!277710))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30398 0))(
  ( (array!30399 (arr!14618 (Array (_ BitVec 32) (_ BitVec 64))) (size!14970 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30398)

(declare-datatypes ((V!18883 0))(
  ( (V!18884 (val!6711 Int)) )
))
(declare-datatypes ((ValueCell!6323 0))(
  ( (ValueCellFull!6323 (v!9003 V!18883)) (EmptyCell!6323) )
))
(declare-datatypes ((array!30400 0))(
  ( (array!30401 (arr!14619 (Array (_ BitVec 32) ValueCell!6323)) (size!14971 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30400)

(assert (=> b!473371 (= res!282789 (and (= (size!14971 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14970 _keys!1025) (size!14971 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473372 () Bool)

(declare-fun e!277707 () Bool)

(declare-fun e!277708 () Bool)

(declare-fun mapRes!21712 () Bool)

(assert (=> b!473372 (= e!277707 (and e!277708 mapRes!21712))))

(declare-fun condMapEmpty!21712 () Bool)

(declare-fun mapDefault!21712 () ValueCell!6323)

(assert (=> b!473372 (= condMapEmpty!21712 (= (arr!14619 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6323)) mapDefault!21712)))))

(declare-fun b!473373 () Bool)

(declare-fun res!282785 () Bool)

(assert (=> b!473373 (=> (not res!282785) (not e!277710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30398 (_ BitVec 32)) Bool)

(assert (=> b!473373 (= res!282785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21712 () Bool)

(assert (=> mapIsEmpty!21712 mapRes!21712))

(declare-fun b!473374 () Bool)

(declare-fun tp_is_empty!13333 () Bool)

(assert (=> b!473374 (= e!277708 tp_is_empty!13333)))

(declare-fun b!473375 () Bool)

(declare-fun e!277709 () Bool)

(assert (=> b!473375 (= e!277709 true)))

(declare-datatypes ((tuple2!8768 0))(
  ( (tuple2!8769 (_1!4395 (_ BitVec 64)) (_2!4395 V!18883)) )
))
(declare-datatypes ((List!8831 0))(
  ( (Nil!8828) (Cons!8827 (h!9683 tuple2!8768) (t!14793 List!8831)) )
))
(declare-datatypes ((ListLongMap!7683 0))(
  ( (ListLongMap!7684 (toList!3857 List!8831)) )
))
(declare-fun lt!215152 () ListLongMap!7683)

(declare-fun lt!215146 () tuple2!8768)

(declare-fun minValueBefore!38 () V!18883)

(declare-fun +!1741 (ListLongMap!7683 tuple2!8768) ListLongMap!7683)

(assert (=> b!473375 (= (+!1741 lt!215152 lt!215146) (+!1741 (+!1741 lt!215152 (tuple2!8769 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215146))))

(declare-fun minValueAfter!38 () V!18883)

(assert (=> b!473375 (= lt!215146 (tuple2!8769 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13918 0))(
  ( (Unit!13919) )
))
(declare-fun lt!215149 () Unit!13918)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!143 (ListLongMap!7683 (_ BitVec 64) V!18883 V!18883) Unit!13918)

(assert (=> b!473375 (= lt!215149 (addSameAsAddTwiceSameKeyDiffValues!143 lt!215152 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215151 () ListLongMap!7683)

(declare-fun zeroValue!794 () V!18883)

(assert (=> b!473375 (= lt!215152 (+!1741 lt!215151 (tuple2!8769 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!215148 () ListLongMap!7683)

(declare-fun getCurrentListMap!2221 (array!30398 array!30400 (_ BitVec 32) (_ BitVec 32) V!18883 V!18883 (_ BitVec 32) Int) ListLongMap!7683)

(assert (=> b!473375 (= lt!215148 (getCurrentListMap!2221 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215150 () ListLongMap!7683)

(assert (=> b!473375 (= lt!215150 (getCurrentListMap!2221 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473376 () Bool)

(declare-fun res!282786 () Bool)

(assert (=> b!473376 (=> (not res!282786) (not e!277710))))

(declare-datatypes ((List!8832 0))(
  ( (Nil!8829) (Cons!8828 (h!9684 (_ BitVec 64)) (t!14794 List!8832)) )
))
(declare-fun arrayNoDuplicates!0 (array!30398 (_ BitVec 32) List!8832) Bool)

(assert (=> b!473376 (= res!282786 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8829))))

(declare-fun b!473377 () Bool)

(declare-fun e!277711 () Bool)

(assert (=> b!473377 (= e!277711 tp_is_empty!13333)))

(declare-fun res!282788 () Bool)

(assert (=> start!42416 (=> (not res!282788) (not e!277710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42416 (= res!282788 (validMask!0 mask!1365))))

(assert (=> start!42416 e!277710))

(assert (=> start!42416 tp_is_empty!13333))

(assert (=> start!42416 tp!41749))

(assert (=> start!42416 true))

(declare-fun array_inv!10626 (array!30398) Bool)

(assert (=> start!42416 (array_inv!10626 _keys!1025)))

(declare-fun array_inv!10627 (array!30400) Bool)

(assert (=> start!42416 (and (array_inv!10627 _values!833) e!277707)))

(declare-fun b!473378 () Bool)

(assert (=> b!473378 (= e!277710 (not e!277709))))

(declare-fun res!282787 () Bool)

(assert (=> b!473378 (=> res!282787 e!277709)))

(assert (=> b!473378 (= res!282787 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215147 () ListLongMap!7683)

(assert (=> b!473378 (= lt!215151 lt!215147)))

(declare-fun lt!215145 () Unit!13918)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!226 (array!30398 array!30400 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18883 V!18883 V!18883 V!18883 (_ BitVec 32) Int) Unit!13918)

(assert (=> b!473378 (= lt!215145 (lemmaNoChangeToArrayThenSameMapNoExtras!226 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2066 (array!30398 array!30400 (_ BitVec 32) (_ BitVec 32) V!18883 V!18883 (_ BitVec 32) Int) ListLongMap!7683)

(assert (=> b!473378 (= lt!215147 (getCurrentListMapNoExtraKeys!2066 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473378 (= lt!215151 (getCurrentListMapNoExtraKeys!2066 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21712 () Bool)

(declare-fun tp!41748 () Bool)

(assert (=> mapNonEmpty!21712 (= mapRes!21712 (and tp!41748 e!277711))))

(declare-fun mapValue!21712 () ValueCell!6323)

(declare-fun mapKey!21712 () (_ BitVec 32))

(declare-fun mapRest!21712 () (Array (_ BitVec 32) ValueCell!6323))

(assert (=> mapNonEmpty!21712 (= (arr!14619 _values!833) (store mapRest!21712 mapKey!21712 mapValue!21712))))

(assert (= (and start!42416 res!282788) b!473371))

(assert (= (and b!473371 res!282789) b!473373))

(assert (= (and b!473373 res!282785) b!473376))

(assert (= (and b!473376 res!282786) b!473378))

(assert (= (and b!473378 (not res!282787)) b!473375))

(assert (= (and b!473372 condMapEmpty!21712) mapIsEmpty!21712))

(assert (= (and b!473372 (not condMapEmpty!21712)) mapNonEmpty!21712))

(get-info :version)

(assert (= (and mapNonEmpty!21712 ((_ is ValueCellFull!6323) mapValue!21712)) b!473377))

(assert (= (and b!473372 ((_ is ValueCellFull!6323) mapDefault!21712)) b!473374))

(assert (= start!42416 b!473372))

(declare-fun m!455663 () Bool)

(assert (=> start!42416 m!455663))

(declare-fun m!455665 () Bool)

(assert (=> start!42416 m!455665))

(declare-fun m!455667 () Bool)

(assert (=> start!42416 m!455667))

(declare-fun m!455669 () Bool)

(assert (=> mapNonEmpty!21712 m!455669))

(declare-fun m!455671 () Bool)

(assert (=> b!473375 m!455671))

(declare-fun m!455673 () Bool)

(assert (=> b!473375 m!455673))

(declare-fun m!455675 () Bool)

(assert (=> b!473375 m!455675))

(declare-fun m!455677 () Bool)

(assert (=> b!473375 m!455677))

(assert (=> b!473375 m!455671))

(declare-fun m!455679 () Bool)

(assert (=> b!473375 m!455679))

(declare-fun m!455681 () Bool)

(assert (=> b!473375 m!455681))

(declare-fun m!455683 () Bool)

(assert (=> b!473375 m!455683))

(declare-fun m!455685 () Bool)

(assert (=> b!473376 m!455685))

(declare-fun m!455687 () Bool)

(assert (=> b!473373 m!455687))

(declare-fun m!455689 () Bool)

(assert (=> b!473378 m!455689))

(declare-fun m!455691 () Bool)

(assert (=> b!473378 m!455691))

(declare-fun m!455693 () Bool)

(assert (=> b!473378 m!455693))

(check-sat (not mapNonEmpty!21712) (not b!473375) (not b!473376) (not b!473373) (not b_next!11905) (not start!42416) (not b!473378) tp_is_empty!13333 b_and!20371)
(check-sat b_and!20371 (not b_next!11905))
