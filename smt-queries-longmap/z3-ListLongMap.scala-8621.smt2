; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104994 () Bool)

(assert start!104994)

(declare-fun b_free!26763 () Bool)

(declare-fun b_next!26763 () Bool)

(assert (=> start!104994 (= b_free!26763 (not b_next!26763))))

(declare-fun tp!93785 () Bool)

(declare-fun b_and!44549 () Bool)

(assert (=> start!104994 (= tp!93785 b_and!44549)))

(declare-fun b!1251450 () Bool)

(declare-fun res!834703 () Bool)

(declare-fun e!710642 () Bool)

(assert (=> b!1251450 (=> (not res!834703) (not e!710642))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80994 0))(
  ( (array!80995 (arr!39062 (Array (_ BitVec 32) (_ BitVec 64))) (size!39598 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80994)

(declare-datatypes ((V!47585 0))(
  ( (V!47586 (val!15895 Int)) )
))
(declare-datatypes ((ValueCell!15069 0))(
  ( (ValueCellFull!15069 (v!18592 V!47585)) (EmptyCell!15069) )
))
(declare-datatypes ((array!80996 0))(
  ( (array!80997 (arr!39063 (Array (_ BitVec 32) ValueCell!15069)) (size!39599 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80996)

(assert (=> b!1251450 (= res!834703 (and (= (size!39599 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39598 _keys!1118) (size!39599 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251451 () Bool)

(declare-fun res!834699 () Bool)

(assert (=> b!1251451 (=> (not res!834699) (not e!710642))))

(declare-datatypes ((List!27727 0))(
  ( (Nil!27724) (Cons!27723 (h!28932 (_ BitVec 64)) (t!41202 List!27727)) )
))
(declare-fun arrayNoDuplicates!0 (array!80994 (_ BitVec 32) List!27727) Bool)

(assert (=> b!1251451 (= res!834699 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27724))))

(declare-fun b!1251452 () Bool)

(declare-fun res!834701 () Bool)

(assert (=> b!1251452 (=> (not res!834701) (not e!710642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80994 (_ BitVec 32)) Bool)

(assert (=> b!1251452 (= res!834701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251453 () Bool)

(declare-fun e!710644 () Bool)

(declare-fun e!710641 () Bool)

(assert (=> b!1251453 (= e!710644 e!710641)))

(declare-fun res!834700 () Bool)

(assert (=> b!1251453 (=> res!834700 e!710641)))

(declare-datatypes ((tuple2!20494 0))(
  ( (tuple2!20495 (_1!10258 (_ BitVec 64)) (_2!10258 V!47585)) )
))
(declare-datatypes ((List!27728 0))(
  ( (Nil!27725) (Cons!27724 (h!28933 tuple2!20494) (t!41203 List!27728)) )
))
(declare-datatypes ((ListLongMap!18367 0))(
  ( (ListLongMap!18368 (toList!9199 List!27728)) )
))
(declare-fun lt!564831 () ListLongMap!18367)

(declare-fun contains!7509 (ListLongMap!18367 (_ BitVec 64)) Bool)

(assert (=> b!1251453 (= res!834700 (contains!7509 lt!564831 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47585)

(declare-fun minValueBefore!43 () V!47585)

(declare-fun getCurrentListMap!4469 (array!80994 array!80996 (_ BitVec 32) (_ BitVec 32) V!47585 V!47585 (_ BitVec 32) Int) ListLongMap!18367)

(assert (=> b!1251453 (= lt!564831 (getCurrentListMap!4469 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251454 () Bool)

(assert (=> b!1251454 (= e!710642 (not e!710644))))

(declare-fun res!834704 () Bool)

(assert (=> b!1251454 (=> res!834704 e!710644)))

(assert (=> b!1251454 (= res!834704 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564827 () ListLongMap!18367)

(declare-fun lt!564830 () ListLongMap!18367)

(assert (=> b!1251454 (= lt!564827 lt!564830)))

(declare-datatypes ((Unit!41585 0))(
  ( (Unit!41586) )
))
(declare-fun lt!564828 () Unit!41585)

(declare-fun minValueAfter!43 () V!47585)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!960 (array!80994 array!80996 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47585 V!47585 V!47585 V!47585 (_ BitVec 32) Int) Unit!41585)

(assert (=> b!1251454 (= lt!564828 (lemmaNoChangeToArrayThenSameMapNoExtras!960 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5596 (array!80994 array!80996 (_ BitVec 32) (_ BitVec 32) V!47585 V!47585 (_ BitVec 32) Int) ListLongMap!18367)

(assert (=> b!1251454 (= lt!564830 (getCurrentListMapNoExtraKeys!5596 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251454 (= lt!564827 (getCurrentListMapNoExtraKeys!5596 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251455 () Bool)

(assert (=> b!1251455 (= e!710641 true)))

(declare-fun -!2018 (ListLongMap!18367 (_ BitVec 64)) ListLongMap!18367)

(assert (=> b!1251455 (= (-!2018 lt!564831 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564831)))

(declare-fun lt!564829 () Unit!41585)

(declare-fun removeNotPresentStillSame!113 (ListLongMap!18367 (_ BitVec 64)) Unit!41585)

(assert (=> b!1251455 (= lt!564829 (removeNotPresentStillSame!113 lt!564831 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!49264 () Bool)

(declare-fun mapRes!49264 () Bool)

(assert (=> mapIsEmpty!49264 mapRes!49264))

(declare-fun b!1251456 () Bool)

(declare-fun e!710640 () Bool)

(declare-fun tp_is_empty!31665 () Bool)

(assert (=> b!1251456 (= e!710640 tp_is_empty!31665)))

(declare-fun b!1251457 () Bool)

(declare-fun e!710645 () Bool)

(assert (=> b!1251457 (= e!710645 tp_is_empty!31665)))

(declare-fun b!1251458 () Bool)

(declare-fun e!710643 () Bool)

(assert (=> b!1251458 (= e!710643 (and e!710640 mapRes!49264))))

(declare-fun condMapEmpty!49264 () Bool)

(declare-fun mapDefault!49264 () ValueCell!15069)

(assert (=> b!1251458 (= condMapEmpty!49264 (= (arr!39063 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15069)) mapDefault!49264)))))

(declare-fun res!834702 () Bool)

(assert (=> start!104994 (=> (not res!834702) (not e!710642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104994 (= res!834702 (validMask!0 mask!1466))))

(assert (=> start!104994 e!710642))

(assert (=> start!104994 true))

(assert (=> start!104994 tp!93785))

(assert (=> start!104994 tp_is_empty!31665))

(declare-fun array_inv!29795 (array!80994) Bool)

(assert (=> start!104994 (array_inv!29795 _keys!1118)))

(declare-fun array_inv!29796 (array!80996) Bool)

(assert (=> start!104994 (and (array_inv!29796 _values!914) e!710643)))

(declare-fun mapNonEmpty!49264 () Bool)

(declare-fun tp!93784 () Bool)

(assert (=> mapNonEmpty!49264 (= mapRes!49264 (and tp!93784 e!710645))))

(declare-fun mapRest!49264 () (Array (_ BitVec 32) ValueCell!15069))

(declare-fun mapValue!49264 () ValueCell!15069)

(declare-fun mapKey!49264 () (_ BitVec 32))

(assert (=> mapNonEmpty!49264 (= (arr!39063 _values!914) (store mapRest!49264 mapKey!49264 mapValue!49264))))

(assert (= (and start!104994 res!834702) b!1251450))

(assert (= (and b!1251450 res!834703) b!1251452))

(assert (= (and b!1251452 res!834701) b!1251451))

(assert (= (and b!1251451 res!834699) b!1251454))

(assert (= (and b!1251454 (not res!834704)) b!1251453))

(assert (= (and b!1251453 (not res!834700)) b!1251455))

(assert (= (and b!1251458 condMapEmpty!49264) mapIsEmpty!49264))

(assert (= (and b!1251458 (not condMapEmpty!49264)) mapNonEmpty!49264))

(get-info :version)

(assert (= (and mapNonEmpty!49264 ((_ is ValueCellFull!15069) mapValue!49264)) b!1251457))

(assert (= (and b!1251458 ((_ is ValueCellFull!15069) mapDefault!49264)) b!1251456))

(assert (= start!104994 b!1251458))

(declare-fun m!1152217 () Bool)

(assert (=> b!1251454 m!1152217))

(declare-fun m!1152219 () Bool)

(assert (=> b!1251454 m!1152219))

(declare-fun m!1152221 () Bool)

(assert (=> b!1251454 m!1152221))

(declare-fun m!1152223 () Bool)

(assert (=> mapNonEmpty!49264 m!1152223))

(declare-fun m!1152225 () Bool)

(assert (=> start!104994 m!1152225))

(declare-fun m!1152227 () Bool)

(assert (=> start!104994 m!1152227))

(declare-fun m!1152229 () Bool)

(assert (=> start!104994 m!1152229))

(declare-fun m!1152231 () Bool)

(assert (=> b!1251451 m!1152231))

(declare-fun m!1152233 () Bool)

(assert (=> b!1251452 m!1152233))

(declare-fun m!1152235 () Bool)

(assert (=> b!1251453 m!1152235))

(declare-fun m!1152237 () Bool)

(assert (=> b!1251453 m!1152237))

(declare-fun m!1152239 () Bool)

(assert (=> b!1251455 m!1152239))

(declare-fun m!1152241 () Bool)

(assert (=> b!1251455 m!1152241))

(check-sat (not mapNonEmpty!49264) b_and!44549 (not b!1251452) (not start!104994) (not b_next!26763) (not b!1251455) tp_is_empty!31665 (not b!1251454) (not b!1251451) (not b!1251453))
(check-sat b_and!44549 (not b_next!26763))
