; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41904 () Bool)

(assert start!41904)

(declare-fun b_free!11493 () Bool)

(declare-fun b_next!11493 () Bool)

(assert (=> start!41904 (= b_free!11493 (not b_next!11493))))

(declare-fun tp!40491 () Bool)

(declare-fun b_and!19881 () Bool)

(assert (=> start!41904 (= tp!40491 b_and!19881)))

(declare-fun b!467822 () Bool)

(declare-fun e!273707 () Bool)

(declare-fun tp_is_empty!12921 () Bool)

(assert (=> b!467822 (= e!273707 tp_is_empty!12921)))

(declare-fun b!467823 () Bool)

(declare-fun e!273706 () Bool)

(assert (=> b!467823 (= e!273706 tp_is_empty!12921)))

(declare-fun b!467824 () Bool)

(declare-fun e!273709 () Bool)

(declare-fun mapRes!21073 () Bool)

(assert (=> b!467824 (= e!273709 (and e!273706 mapRes!21073))))

(declare-fun condMapEmpty!21073 () Bool)

(declare-datatypes ((V!18333 0))(
  ( (V!18334 (val!6505 Int)) )
))
(declare-datatypes ((ValueCell!6117 0))(
  ( (ValueCellFull!6117 (v!8794 V!18333)) (EmptyCell!6117) )
))
(declare-datatypes ((array!29619 0))(
  ( (array!29620 (arr!14236 (Array (_ BitVec 32) ValueCell!6117)) (size!14588 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29619)

(declare-fun mapDefault!21073 () ValueCell!6117)

(assert (=> b!467824 (= condMapEmpty!21073 (= (arr!14236 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6117)) mapDefault!21073)))))

(declare-fun b!467825 () Bool)

(declare-fun e!273704 () Bool)

(declare-fun e!273705 () Bool)

(assert (=> b!467825 (= e!273704 (not e!273705))))

(declare-fun res!279585 () Bool)

(assert (=> b!467825 (=> res!279585 e!273705)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!467825 (= res!279585 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8540 0))(
  ( (tuple2!8541 (_1!4281 (_ BitVec 64)) (_2!4281 V!18333)) )
))
(declare-datatypes ((List!8627 0))(
  ( (Nil!8624) (Cons!8623 (h!9479 tuple2!8540) (t!14583 List!8627)) )
))
(declare-datatypes ((ListLongMap!7453 0))(
  ( (ListLongMap!7454 (toList!3742 List!8627)) )
))
(declare-fun lt!211524 () ListLongMap!7453)

(declare-fun lt!211527 () ListLongMap!7453)

(assert (=> b!467825 (= lt!211524 lt!211527)))

(declare-fun zeroValue!794 () V!18333)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13644 0))(
  ( (Unit!13645) )
))
(declare-fun lt!211526 () Unit!13644)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueBefore!38 () V!18333)

(declare-datatypes ((array!29621 0))(
  ( (array!29622 (arr!14237 (Array (_ BitVec 32) (_ BitVec 64))) (size!14589 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29621)

(declare-fun minValueAfter!38 () V!18333)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!96 (array!29621 array!29619 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18333 V!18333 V!18333 V!18333 (_ BitVec 32) Int) Unit!13644)

(assert (=> b!467825 (= lt!211526 (lemmaNoChangeToArrayThenSameMapNoExtras!96 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1916 (array!29621 array!29619 (_ BitVec 32) (_ BitVec 32) V!18333 V!18333 (_ BitVec 32) Int) ListLongMap!7453)

(assert (=> b!467825 (= lt!211527 (getCurrentListMapNoExtraKeys!1916 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467825 (= lt!211524 (getCurrentListMapNoExtraKeys!1916 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21073 () Bool)

(assert (=> mapIsEmpty!21073 mapRes!21073))

(declare-fun mapNonEmpty!21073 () Bool)

(declare-fun tp!40492 () Bool)

(assert (=> mapNonEmpty!21073 (= mapRes!21073 (and tp!40492 e!273707))))

(declare-fun mapValue!21073 () ValueCell!6117)

(declare-fun mapKey!21073 () (_ BitVec 32))

(declare-fun mapRest!21073 () (Array (_ BitVec 32) ValueCell!6117))

(assert (=> mapNonEmpty!21073 (= (arr!14236 _values!833) (store mapRest!21073 mapKey!21073 mapValue!21073))))

(declare-fun b!467826 () Bool)

(assert (=> b!467826 (= e!273705 true)))

(declare-fun lt!211525 () ListLongMap!7453)

(declare-fun getCurrentListMap!2171 (array!29621 array!29619 (_ BitVec 32) (_ BitVec 32) V!18333 V!18333 (_ BitVec 32) Int) ListLongMap!7453)

(assert (=> b!467826 (= lt!211525 (getCurrentListMap!2171 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467827 () Bool)

(declare-fun res!279586 () Bool)

(assert (=> b!467827 (=> (not res!279586) (not e!273704))))

(declare-datatypes ((List!8628 0))(
  ( (Nil!8625) (Cons!8624 (h!9480 (_ BitVec 64)) (t!14584 List!8628)) )
))
(declare-fun arrayNoDuplicates!0 (array!29621 (_ BitVec 32) List!8628) Bool)

(assert (=> b!467827 (= res!279586 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8625))))

(declare-fun b!467828 () Bool)

(declare-fun res!279584 () Bool)

(assert (=> b!467828 (=> (not res!279584) (not e!273704))))

(assert (=> b!467828 (= res!279584 (and (= (size!14588 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14589 _keys!1025) (size!14588 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!279582 () Bool)

(assert (=> start!41904 (=> (not res!279582) (not e!273704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41904 (= res!279582 (validMask!0 mask!1365))))

(assert (=> start!41904 e!273704))

(assert (=> start!41904 tp_is_empty!12921))

(assert (=> start!41904 tp!40491))

(assert (=> start!41904 true))

(declare-fun array_inv!10276 (array!29621) Bool)

(assert (=> start!41904 (array_inv!10276 _keys!1025)))

(declare-fun array_inv!10277 (array!29619) Bool)

(assert (=> start!41904 (and (array_inv!10277 _values!833) e!273709)))

(declare-fun b!467829 () Bool)

(declare-fun res!279583 () Bool)

(assert (=> b!467829 (=> (not res!279583) (not e!273704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29621 (_ BitVec 32)) Bool)

(assert (=> b!467829 (= res!279583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!41904 res!279582) b!467828))

(assert (= (and b!467828 res!279584) b!467829))

(assert (= (and b!467829 res!279583) b!467827))

(assert (= (and b!467827 res!279586) b!467825))

(assert (= (and b!467825 (not res!279585)) b!467826))

(assert (= (and b!467824 condMapEmpty!21073) mapIsEmpty!21073))

(assert (= (and b!467824 (not condMapEmpty!21073)) mapNonEmpty!21073))

(get-info :version)

(assert (= (and mapNonEmpty!21073 ((_ is ValueCellFull!6117) mapValue!21073)) b!467822))

(assert (= (and b!467824 ((_ is ValueCellFull!6117) mapDefault!21073)) b!467823))

(assert (= start!41904 b!467824))

(declare-fun m!449909 () Bool)

(assert (=> b!467829 m!449909))

(declare-fun m!449911 () Bool)

(assert (=> start!41904 m!449911))

(declare-fun m!449913 () Bool)

(assert (=> start!41904 m!449913))

(declare-fun m!449915 () Bool)

(assert (=> start!41904 m!449915))

(declare-fun m!449917 () Bool)

(assert (=> b!467825 m!449917))

(declare-fun m!449919 () Bool)

(assert (=> b!467825 m!449919))

(declare-fun m!449921 () Bool)

(assert (=> b!467825 m!449921))

(declare-fun m!449923 () Bool)

(assert (=> b!467826 m!449923))

(declare-fun m!449925 () Bool)

(assert (=> mapNonEmpty!21073 m!449925))

(declare-fun m!449927 () Bool)

(assert (=> b!467827 m!449927))

(check-sat tp_is_empty!12921 (not b_next!11493) (not b!467829) (not start!41904) (not b!467825) b_and!19881 (not b!467827) (not mapNonEmpty!21073) (not b!467826))
(check-sat b_and!19881 (not b_next!11493))
