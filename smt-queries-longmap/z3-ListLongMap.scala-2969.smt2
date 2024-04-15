; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42056 () Bool)

(assert start!42056)

(declare-fun b_free!11623 () Bool)

(declare-fun b_next!11623 () Bool)

(assert (=> start!42056 (= b_free!11623 (not b_next!11623))))

(declare-fun tp!40887 () Bool)

(declare-fun b_and!20007 () Bool)

(assert (=> start!42056 (= tp!40887 b_and!20007)))

(declare-fun mapIsEmpty!21274 () Bool)

(declare-fun mapRes!21274 () Bool)

(assert (=> mapIsEmpty!21274 mapRes!21274))

(declare-fun b!469438 () Bool)

(declare-fun res!280564 () Bool)

(declare-fun e!274909 () Bool)

(assert (=> b!469438 (=> (not res!280564) (not e!274909))))

(declare-datatypes ((array!29857 0))(
  ( (array!29858 (arr!14353 (Array (_ BitVec 32) (_ BitVec 64))) (size!14706 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29857)

(declare-datatypes ((List!8758 0))(
  ( (Nil!8755) (Cons!8754 (h!9610 (_ BitVec 64)) (t!14709 List!8758)) )
))
(declare-fun arrayNoDuplicates!0 (array!29857 (_ BitVec 32) List!8758) Bool)

(assert (=> b!469438 (= res!280564 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8755))))

(declare-fun mapNonEmpty!21274 () Bool)

(declare-fun tp!40888 () Bool)

(declare-fun e!274907 () Bool)

(assert (=> mapNonEmpty!21274 (= mapRes!21274 (and tp!40888 e!274907))))

(declare-datatypes ((V!18507 0))(
  ( (V!18508 (val!6570 Int)) )
))
(declare-datatypes ((ValueCell!6182 0))(
  ( (ValueCellFull!6182 (v!8854 V!18507)) (EmptyCell!6182) )
))
(declare-fun mapValue!21274 () ValueCell!6182)

(declare-datatypes ((array!29859 0))(
  ( (array!29860 (arr!14354 (Array (_ BitVec 32) ValueCell!6182)) (size!14707 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29859)

(declare-fun mapRest!21274 () (Array (_ BitVec 32) ValueCell!6182))

(declare-fun mapKey!21274 () (_ BitVec 32))

(assert (=> mapNonEmpty!21274 (= (arr!14354 _values!833) (store mapRest!21274 mapKey!21274 mapValue!21274))))

(declare-fun res!280567 () Bool)

(assert (=> start!42056 (=> (not res!280567) (not e!274909))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42056 (= res!280567 (validMask!0 mask!1365))))

(assert (=> start!42056 e!274909))

(declare-fun tp_is_empty!13051 () Bool)

(assert (=> start!42056 tp_is_empty!13051))

(assert (=> start!42056 tp!40887))

(assert (=> start!42056 true))

(declare-fun array_inv!10442 (array!29857) Bool)

(assert (=> start!42056 (array_inv!10442 _keys!1025)))

(declare-fun e!274908 () Bool)

(declare-fun array_inv!10443 (array!29859) Bool)

(assert (=> start!42056 (and (array_inv!10443 _values!833) e!274908)))

(declare-fun b!469439 () Bool)

(assert (=> b!469439 (= e!274907 tp_is_empty!13051)))

(declare-fun b!469440 () Bool)

(declare-fun res!280566 () Bool)

(assert (=> b!469440 (=> (not res!280566) (not e!274909))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!469440 (= res!280566 (and (= (size!14707 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14706 _keys!1025) (size!14707 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469441 () Bool)

(declare-fun res!280565 () Bool)

(assert (=> b!469441 (=> (not res!280565) (not e!274909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29857 (_ BitVec 32)) Bool)

(assert (=> b!469441 (= res!280565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469442 () Bool)

(declare-fun e!274911 () Bool)

(assert (=> b!469442 (= e!274911 true)))

(declare-datatypes ((tuple2!8686 0))(
  ( (tuple2!8687 (_1!4354 (_ BitVec 64)) (_2!4354 V!18507)) )
))
(declare-datatypes ((List!8759 0))(
  ( (Nil!8756) (Cons!8755 (h!9611 tuple2!8686) (t!14710 List!8759)) )
))
(declare-datatypes ((ListLongMap!7589 0))(
  ( (ListLongMap!7590 (toList!3810 List!8759)) )
))
(declare-fun lt!212714 () ListLongMap!7589)

(declare-fun lt!212716 () tuple2!8686)

(declare-fun minValueBefore!38 () V!18507)

(declare-fun +!1736 (ListLongMap!7589 tuple2!8686) ListLongMap!7589)

(assert (=> b!469442 (= (+!1736 lt!212714 lt!212716) (+!1736 (+!1736 lt!212714 (tuple2!8687 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212716))))

(declare-fun minValueAfter!38 () V!18507)

(assert (=> b!469442 (= lt!212716 (tuple2!8687 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13719 0))(
  ( (Unit!13720) )
))
(declare-fun lt!212711 () Unit!13719)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!119 (ListLongMap!7589 (_ BitVec 64) V!18507 V!18507) Unit!13719)

(assert (=> b!469442 (= lt!212711 (addSameAsAddTwiceSameKeyDiffValues!119 lt!212714 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18507)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!212717 () ListLongMap!7589)

(declare-fun getCurrentListMap!2172 (array!29857 array!29859 (_ BitVec 32) (_ BitVec 32) V!18507 V!18507 (_ BitVec 32) Int) ListLongMap!7589)

(assert (=> b!469442 (= lt!212717 (getCurrentListMap!2172 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212713 () ListLongMap!7589)

(assert (=> b!469442 (= lt!212713 (getCurrentListMap!2172 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469443 () Bool)

(assert (=> b!469443 (= e!274909 (not e!274911))))

(declare-fun res!280563 () Bool)

(assert (=> b!469443 (=> res!280563 e!274911)))

(assert (=> b!469443 (= res!280563 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212712 () ListLongMap!7589)

(assert (=> b!469443 (= lt!212714 lt!212712)))

(declare-fun lt!212715 () Unit!13719)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!143 (array!29857 array!29859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18507 V!18507 V!18507 V!18507 (_ BitVec 32) Int) Unit!13719)

(assert (=> b!469443 (= lt!212715 (lemmaNoChangeToArrayThenSameMapNoExtras!143 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1986 (array!29857 array!29859 (_ BitVec 32) (_ BitVec 32) V!18507 V!18507 (_ BitVec 32) Int) ListLongMap!7589)

(assert (=> b!469443 (= lt!212712 (getCurrentListMapNoExtraKeys!1986 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469443 (= lt!212714 (getCurrentListMapNoExtraKeys!1986 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469444 () Bool)

(declare-fun e!274910 () Bool)

(assert (=> b!469444 (= e!274908 (and e!274910 mapRes!21274))))

(declare-fun condMapEmpty!21274 () Bool)

(declare-fun mapDefault!21274 () ValueCell!6182)

(assert (=> b!469444 (= condMapEmpty!21274 (= (arr!14354 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6182)) mapDefault!21274)))))

(declare-fun b!469445 () Bool)

(assert (=> b!469445 (= e!274910 tp_is_empty!13051)))

(assert (= (and start!42056 res!280567) b!469440))

(assert (= (and b!469440 res!280566) b!469441))

(assert (= (and b!469441 res!280565) b!469438))

(assert (= (and b!469438 res!280564) b!469443))

(assert (= (and b!469443 (not res!280563)) b!469442))

(assert (= (and b!469444 condMapEmpty!21274) mapIsEmpty!21274))

(assert (= (and b!469444 (not condMapEmpty!21274)) mapNonEmpty!21274))

(get-info :version)

(assert (= (and mapNonEmpty!21274 ((_ is ValueCellFull!6182) mapValue!21274)) b!469439))

(assert (= (and b!469444 ((_ is ValueCellFull!6182) mapDefault!21274)) b!469445))

(assert (= start!42056 b!469444))

(declare-fun m!451207 () Bool)

(assert (=> mapNonEmpty!21274 m!451207))

(declare-fun m!451209 () Bool)

(assert (=> b!469443 m!451209))

(declare-fun m!451211 () Bool)

(assert (=> b!469443 m!451211))

(declare-fun m!451213 () Bool)

(assert (=> b!469443 m!451213))

(declare-fun m!451215 () Bool)

(assert (=> b!469441 m!451215))

(declare-fun m!451217 () Bool)

(assert (=> b!469438 m!451217))

(declare-fun m!451219 () Bool)

(assert (=> b!469442 m!451219))

(declare-fun m!451221 () Bool)

(assert (=> b!469442 m!451221))

(declare-fun m!451223 () Bool)

(assert (=> b!469442 m!451223))

(declare-fun m!451225 () Bool)

(assert (=> b!469442 m!451225))

(declare-fun m!451227 () Bool)

(assert (=> b!469442 m!451227))

(assert (=> b!469442 m!451221))

(declare-fun m!451229 () Bool)

(assert (=> b!469442 m!451229))

(declare-fun m!451231 () Bool)

(assert (=> start!42056 m!451231))

(declare-fun m!451233 () Bool)

(assert (=> start!42056 m!451233))

(declare-fun m!451235 () Bool)

(assert (=> start!42056 m!451235))

(check-sat tp_is_empty!13051 (not b!469443) (not b!469441) (not b_next!11623) b_and!20007 (not start!42056) (not b!469442) (not b!469438) (not mapNonEmpty!21274))
(check-sat b_and!20007 (not b_next!11623))
