; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42056 () Bool)

(assert start!42056)

(declare-fun b_free!11623 () Bool)

(declare-fun b_next!11623 () Bool)

(assert (=> start!42056 (= b_free!11623 (not b_next!11623))))

(declare-fun tp!40888 () Bool)

(declare-fun b_and!20043 () Bool)

(assert (=> start!42056 (= tp!40888 b_and!20043)))

(declare-fun b!469648 () Bool)

(declare-fun res!280687 () Bool)

(declare-fun e!275041 () Bool)

(assert (=> b!469648 (=> (not res!280687) (not e!275041))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29862 0))(
  ( (array!29863 (arr!14355 (Array (_ BitVec 32) (_ BitVec 64))) (size!14707 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29862)

(declare-datatypes ((V!18507 0))(
  ( (V!18508 (val!6570 Int)) )
))
(declare-datatypes ((ValueCell!6182 0))(
  ( (ValueCellFull!6182 (v!8861 V!18507)) (EmptyCell!6182) )
))
(declare-datatypes ((array!29864 0))(
  ( (array!29865 (arr!14356 (Array (_ BitVec 32) ValueCell!6182)) (size!14708 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29864)

(assert (=> b!469648 (= res!280687 (and (= (size!14708 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14707 _keys!1025) (size!14708 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21274 () Bool)

(declare-fun mapRes!21274 () Bool)

(declare-fun tp!40887 () Bool)

(declare-fun e!275044 () Bool)

(assert (=> mapNonEmpty!21274 (= mapRes!21274 (and tp!40887 e!275044))))

(declare-fun mapRest!21274 () (Array (_ BitVec 32) ValueCell!6182))

(declare-fun mapKey!21274 () (_ BitVec 32))

(declare-fun mapValue!21274 () ValueCell!6182)

(assert (=> mapNonEmpty!21274 (= (arr!14356 _values!833) (store mapRest!21274 mapKey!21274 mapValue!21274))))

(declare-fun mapIsEmpty!21274 () Bool)

(assert (=> mapIsEmpty!21274 mapRes!21274))

(declare-fun res!280688 () Bool)

(assert (=> start!42056 (=> (not res!280688) (not e!275041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42056 (= res!280688 (validMask!0 mask!1365))))

(assert (=> start!42056 e!275041))

(declare-fun tp_is_empty!13051 () Bool)

(assert (=> start!42056 tp_is_empty!13051))

(assert (=> start!42056 tp!40888))

(assert (=> start!42056 true))

(declare-fun array_inv!10452 (array!29862) Bool)

(assert (=> start!42056 (array_inv!10452 _keys!1025)))

(declare-fun e!275043 () Bool)

(declare-fun array_inv!10453 (array!29864) Bool)

(assert (=> start!42056 (and (array_inv!10453 _values!833) e!275043)))

(declare-fun b!469649 () Bool)

(declare-fun res!280685 () Bool)

(assert (=> b!469649 (=> (not res!280685) (not e!275041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29862 (_ BitVec 32)) Bool)

(assert (=> b!469649 (= res!280685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469650 () Bool)

(assert (=> b!469650 (= e!275044 tp_is_empty!13051)))

(declare-fun b!469651 () Bool)

(declare-fun res!280686 () Bool)

(assert (=> b!469651 (=> (not res!280686) (not e!275041))))

(declare-datatypes ((List!8644 0))(
  ( (Nil!8641) (Cons!8640 (h!9496 (_ BitVec 64)) (t!14596 List!8644)) )
))
(declare-fun arrayNoDuplicates!0 (array!29862 (_ BitVec 32) List!8644) Bool)

(assert (=> b!469651 (= res!280686 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8641))))

(declare-fun b!469652 () Bool)

(declare-fun e!275045 () Bool)

(assert (=> b!469652 (= e!275045 true)))

(declare-datatypes ((tuple2!8570 0))(
  ( (tuple2!8571 (_1!4296 (_ BitVec 64)) (_2!4296 V!18507)) )
))
(declare-datatypes ((List!8645 0))(
  ( (Nil!8642) (Cons!8641 (h!9497 tuple2!8570) (t!14597 List!8645)) )
))
(declare-datatypes ((ListLongMap!7485 0))(
  ( (ListLongMap!7486 (toList!3758 List!8645)) )
))
(declare-fun lt!212962 () ListLongMap!7485)

(declare-fun lt!212963 () tuple2!8570)

(declare-fun minValueBefore!38 () V!18507)

(declare-fun +!1716 (ListLongMap!7485 tuple2!8570) ListLongMap!7485)

(assert (=> b!469652 (= (+!1716 lt!212962 lt!212963) (+!1716 (+!1716 lt!212962 (tuple2!8571 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212963))))

(declare-fun minValueAfter!38 () V!18507)

(assert (=> b!469652 (= lt!212963 (tuple2!8571 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13727 0))(
  ( (Unit!13728) )
))
(declare-fun lt!212960 () Unit!13727)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!122 (ListLongMap!7485 (_ BitVec 64) V!18507 V!18507) Unit!13727)

(assert (=> b!469652 (= lt!212960 (addSameAsAddTwiceSameKeyDiffValues!122 lt!212962 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18507)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!212957 () ListLongMap!7485)

(declare-fun getCurrentListMap!2182 (array!29862 array!29864 (_ BitVec 32) (_ BitVec 32) V!18507 V!18507 (_ BitVec 32) Int) ListLongMap!7485)

(assert (=> b!469652 (= lt!212957 (getCurrentListMap!2182 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212959 () ListLongMap!7485)

(assert (=> b!469652 (= lt!212959 (getCurrentListMap!2182 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469653 () Bool)

(declare-fun e!275046 () Bool)

(assert (=> b!469653 (= e!275043 (and e!275046 mapRes!21274))))

(declare-fun condMapEmpty!21274 () Bool)

(declare-fun mapDefault!21274 () ValueCell!6182)

(assert (=> b!469653 (= condMapEmpty!21274 (= (arr!14356 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6182)) mapDefault!21274)))))

(declare-fun b!469654 () Bool)

(assert (=> b!469654 (= e!275041 (not e!275045))))

(declare-fun res!280689 () Bool)

(assert (=> b!469654 (=> res!280689 e!275045)))

(assert (=> b!469654 (= res!280689 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212958 () ListLongMap!7485)

(assert (=> b!469654 (= lt!212962 lt!212958)))

(declare-fun lt!212961 () Unit!13727)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!135 (array!29862 array!29864 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18507 V!18507 V!18507 V!18507 (_ BitVec 32) Int) Unit!13727)

(assert (=> b!469654 (= lt!212961 (lemmaNoChangeToArrayThenSameMapNoExtras!135 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1975 (array!29862 array!29864 (_ BitVec 32) (_ BitVec 32) V!18507 V!18507 (_ BitVec 32) Int) ListLongMap!7485)

(assert (=> b!469654 (= lt!212958 (getCurrentListMapNoExtraKeys!1975 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469654 (= lt!212962 (getCurrentListMapNoExtraKeys!1975 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469655 () Bool)

(assert (=> b!469655 (= e!275046 tp_is_empty!13051)))

(assert (= (and start!42056 res!280688) b!469648))

(assert (= (and b!469648 res!280687) b!469649))

(assert (= (and b!469649 res!280685) b!469651))

(assert (= (and b!469651 res!280686) b!469654))

(assert (= (and b!469654 (not res!280689)) b!469652))

(assert (= (and b!469653 condMapEmpty!21274) mapIsEmpty!21274))

(assert (= (and b!469653 (not condMapEmpty!21274)) mapNonEmpty!21274))

(get-info :version)

(assert (= (and mapNonEmpty!21274 ((_ is ValueCellFull!6182) mapValue!21274)) b!469650))

(assert (= (and b!469653 ((_ is ValueCellFull!6182) mapDefault!21274)) b!469655))

(assert (= start!42056 b!469653))

(declare-fun m!452123 () Bool)

(assert (=> b!469654 m!452123))

(declare-fun m!452125 () Bool)

(assert (=> b!469654 m!452125))

(declare-fun m!452127 () Bool)

(assert (=> b!469654 m!452127))

(declare-fun m!452129 () Bool)

(assert (=> start!42056 m!452129))

(declare-fun m!452131 () Bool)

(assert (=> start!42056 m!452131))

(declare-fun m!452133 () Bool)

(assert (=> start!42056 m!452133))

(declare-fun m!452135 () Bool)

(assert (=> b!469649 m!452135))

(declare-fun m!452137 () Bool)

(assert (=> mapNonEmpty!21274 m!452137))

(declare-fun m!452139 () Bool)

(assert (=> b!469651 m!452139))

(declare-fun m!452141 () Bool)

(assert (=> b!469652 m!452141))

(assert (=> b!469652 m!452141))

(declare-fun m!452143 () Bool)

(assert (=> b!469652 m!452143))

(declare-fun m!452145 () Bool)

(assert (=> b!469652 m!452145))

(declare-fun m!452147 () Bool)

(assert (=> b!469652 m!452147))

(declare-fun m!452149 () Bool)

(assert (=> b!469652 m!452149))

(declare-fun m!452151 () Bool)

(assert (=> b!469652 m!452151))

(check-sat (not b_next!11623) (not b!469654) (not mapNonEmpty!21274) (not start!42056) (not b!469652) (not b!469651) (not b!469649) tp_is_empty!13051 b_and!20043)
(check-sat b_and!20043 (not b_next!11623))
