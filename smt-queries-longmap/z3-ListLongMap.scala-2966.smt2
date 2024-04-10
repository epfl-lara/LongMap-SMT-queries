; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42054 () Bool)

(assert start!42054)

(declare-fun b_free!11607 () Bool)

(declare-fun b_next!11607 () Bool)

(assert (=> start!42054 (= b_free!11607 (not b_next!11607))))

(declare-fun tp!40839 () Bool)

(declare-fun b_and!20017 () Bool)

(assert (=> start!42054 (= tp!40839 b_and!20017)))

(declare-fun mapNonEmpty!21250 () Bool)

(declare-fun mapRes!21250 () Bool)

(declare-fun tp!40840 () Bool)

(declare-fun e!274936 () Bool)

(assert (=> mapNonEmpty!21250 (= mapRes!21250 (and tp!40840 e!274936))))

(declare-datatypes ((V!18485 0))(
  ( (V!18486 (val!6562 Int)) )
))
(declare-datatypes ((ValueCell!6174 0))(
  ( (ValueCellFull!6174 (v!8852 V!18485)) (EmptyCell!6174) )
))
(declare-datatypes ((array!29843 0))(
  ( (array!29844 (arr!14346 (Array (_ BitVec 32) ValueCell!6174)) (size!14698 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29843)

(declare-fun mapRest!21250 () (Array (_ BitVec 32) ValueCell!6174))

(declare-fun mapKey!21250 () (_ BitVec 32))

(declare-fun mapValue!21250 () ValueCell!6174)

(assert (=> mapNonEmpty!21250 (= (arr!14346 _values!833) (store mapRest!21250 mapKey!21250 mapValue!21250))))

(declare-fun b!469517 () Bool)

(declare-fun e!274937 () Bool)

(declare-fun e!274939 () Bool)

(assert (=> b!469517 (= e!274937 (and e!274939 mapRes!21250))))

(declare-fun condMapEmpty!21250 () Bool)

(declare-fun mapDefault!21250 () ValueCell!6174)

(assert (=> b!469517 (= condMapEmpty!21250 (= (arr!14346 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6174)) mapDefault!21250)))))

(declare-fun b!469518 () Bool)

(declare-fun res!280572 () Bool)

(declare-fun e!274940 () Bool)

(assert (=> b!469518 (=> (not res!280572) (not e!274940))))

(declare-datatypes ((array!29845 0))(
  ( (array!29846 (arr!14347 (Array (_ BitVec 32) (_ BitVec 64))) (size!14699 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29845)

(declare-datatypes ((List!8717 0))(
  ( (Nil!8714) (Cons!8713 (h!9569 (_ BitVec 64)) (t!14677 List!8717)) )
))
(declare-fun arrayNoDuplicates!0 (array!29845 (_ BitVec 32) List!8717) Bool)

(assert (=> b!469518 (= res!280572 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8714))))

(declare-fun b!469519 () Bool)

(declare-fun tp_is_empty!13035 () Bool)

(assert (=> b!469519 (= e!274936 tp_is_empty!13035)))

(declare-fun b!469520 () Bool)

(declare-fun e!274938 () Bool)

(assert (=> b!469520 (= e!274938 true)))

(declare-datatypes ((tuple2!8638 0))(
  ( (tuple2!8639 (_1!4330 (_ BitVec 64)) (_2!4330 V!18485)) )
))
(declare-datatypes ((List!8718 0))(
  ( (Nil!8715) (Cons!8714 (h!9570 tuple2!8638) (t!14678 List!8718)) )
))
(declare-datatypes ((ListLongMap!7551 0))(
  ( (ListLongMap!7552 (toList!3791 List!8718)) )
))
(declare-fun lt!212778 () ListLongMap!7551)

(declare-fun lt!212779 () tuple2!8638)

(declare-fun minValueBefore!38 () V!18485)

(declare-fun +!1699 (ListLongMap!7551 tuple2!8638) ListLongMap!7551)

(assert (=> b!469520 (= (+!1699 lt!212778 lt!212779) (+!1699 (+!1699 lt!212778 (tuple2!8639 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212779))))

(declare-fun minValueAfter!38 () V!18485)

(assert (=> b!469520 (= lt!212779 (tuple2!8639 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13739 0))(
  ( (Unit!13740) )
))
(declare-fun lt!212783 () Unit!13739)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!112 (ListLongMap!7551 (_ BitVec 64) V!18485 V!18485) Unit!13739)

(assert (=> b!469520 (= lt!212783 (addSameAsAddTwiceSameKeyDiffValues!112 lt!212778 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18485)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun lt!212777 () ListLongMap!7551)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2213 (array!29845 array!29843 (_ BitVec 32) (_ BitVec 32) V!18485 V!18485 (_ BitVec 32) Int) ListLongMap!7551)

(assert (=> b!469520 (= lt!212777 (getCurrentListMap!2213 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!212781 () ListLongMap!7551)

(assert (=> b!469520 (= lt!212781 (getCurrentListMap!2213 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469521 () Bool)

(declare-fun res!280575 () Bool)

(assert (=> b!469521 (=> (not res!280575) (not e!274940))))

(assert (=> b!469521 (= res!280575 (and (= (size!14698 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14699 _keys!1025) (size!14698 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!280574 () Bool)

(assert (=> start!42054 (=> (not res!280574) (not e!274940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42054 (= res!280574 (validMask!0 mask!1365))))

(assert (=> start!42054 e!274940))

(assert (=> start!42054 tp_is_empty!13035))

(assert (=> start!42054 tp!40839))

(assert (=> start!42054 true))

(declare-fun array_inv!10354 (array!29845) Bool)

(assert (=> start!42054 (array_inv!10354 _keys!1025)))

(declare-fun array_inv!10355 (array!29843) Bool)

(assert (=> start!42054 (and (array_inv!10355 _values!833) e!274937)))

(declare-fun b!469522 () Bool)

(assert (=> b!469522 (= e!274940 (not e!274938))))

(declare-fun res!280573 () Bool)

(assert (=> b!469522 (=> res!280573 e!274938)))

(assert (=> b!469522 (= res!280573 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212782 () ListLongMap!7551)

(assert (=> b!469522 (= lt!212778 lt!212782)))

(declare-fun lt!212780 () Unit!13739)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!139 (array!29845 array!29843 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18485 V!18485 V!18485 V!18485 (_ BitVec 32) Int) Unit!13739)

(assert (=> b!469522 (= lt!212780 (lemmaNoChangeToArrayThenSameMapNoExtras!139 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1959 (array!29845 array!29843 (_ BitVec 32) (_ BitVec 32) V!18485 V!18485 (_ BitVec 32) Int) ListLongMap!7551)

(assert (=> b!469522 (= lt!212782 (getCurrentListMapNoExtraKeys!1959 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469522 (= lt!212778 (getCurrentListMapNoExtraKeys!1959 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469523 () Bool)

(declare-fun res!280576 () Bool)

(assert (=> b!469523 (=> (not res!280576) (not e!274940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29845 (_ BitVec 32)) Bool)

(assert (=> b!469523 (= res!280576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469524 () Bool)

(assert (=> b!469524 (= e!274939 tp_is_empty!13035)))

(declare-fun mapIsEmpty!21250 () Bool)

(assert (=> mapIsEmpty!21250 mapRes!21250))

(assert (= (and start!42054 res!280574) b!469521))

(assert (= (and b!469521 res!280575) b!469523))

(assert (= (and b!469523 res!280576) b!469518))

(assert (= (and b!469518 res!280572) b!469522))

(assert (= (and b!469522 (not res!280573)) b!469520))

(assert (= (and b!469517 condMapEmpty!21250) mapIsEmpty!21250))

(assert (= (and b!469517 (not condMapEmpty!21250)) mapNonEmpty!21250))

(get-info :version)

(assert (= (and mapNonEmpty!21250 ((_ is ValueCellFull!6174) mapValue!21250)) b!469519))

(assert (= (and b!469517 ((_ is ValueCellFull!6174) mapDefault!21250)) b!469524))

(assert (= start!42054 b!469517))

(declare-fun m!451701 () Bool)

(assert (=> b!469518 m!451701))

(declare-fun m!451703 () Bool)

(assert (=> b!469523 m!451703))

(declare-fun m!451705 () Bool)

(assert (=> b!469522 m!451705))

(declare-fun m!451707 () Bool)

(assert (=> b!469522 m!451707))

(declare-fun m!451709 () Bool)

(assert (=> b!469522 m!451709))

(declare-fun m!451711 () Bool)

(assert (=> b!469520 m!451711))

(declare-fun m!451713 () Bool)

(assert (=> b!469520 m!451713))

(assert (=> b!469520 m!451711))

(declare-fun m!451715 () Bool)

(assert (=> b!469520 m!451715))

(declare-fun m!451717 () Bool)

(assert (=> b!469520 m!451717))

(declare-fun m!451719 () Bool)

(assert (=> b!469520 m!451719))

(declare-fun m!451721 () Bool)

(assert (=> b!469520 m!451721))

(declare-fun m!451723 () Bool)

(assert (=> mapNonEmpty!21250 m!451723))

(declare-fun m!451725 () Bool)

(assert (=> start!42054 m!451725))

(declare-fun m!451727 () Bool)

(assert (=> start!42054 m!451727))

(declare-fun m!451729 () Bool)

(assert (=> start!42054 m!451729))

(check-sat tp_is_empty!13035 (not b!469522) b_and!20017 (not b!469520) (not b!469523) (not mapNonEmpty!21250) (not b_next!11607) (not b!469518) (not start!42054))
(check-sat b_and!20017 (not b_next!11607))
