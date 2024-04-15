; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104952 () Bool)

(assert start!104952)

(declare-fun b_free!26725 () Bool)

(declare-fun b_next!26725 () Bool)

(assert (=> start!104952 (= b_free!26725 (not b_next!26725))))

(declare-fun tp!93671 () Bool)

(declare-fun b_and!44493 () Bool)

(assert (=> start!104952 (= tp!93671 b_and!44493)))

(declare-fun b!1250855 () Bool)

(declare-fun e!710198 () Bool)

(declare-fun e!710199 () Bool)

(assert (=> b!1250855 (= e!710198 e!710199)))

(declare-fun res!834317 () Bool)

(assert (=> b!1250855 (=> res!834317 e!710199)))

(declare-datatypes ((V!47535 0))(
  ( (V!47536 (val!15876 Int)) )
))
(declare-datatypes ((tuple2!20548 0))(
  ( (tuple2!20549 (_1!10285 (_ BitVec 64)) (_2!10285 V!47535)) )
))
(declare-datatypes ((List!27769 0))(
  ( (Nil!27766) (Cons!27765 (h!28974 tuple2!20548) (t!41235 List!27769)) )
))
(declare-datatypes ((ListLongMap!18421 0))(
  ( (ListLongMap!18422 (toList!9226 List!27769)) )
))
(declare-fun lt!564364 () ListLongMap!18421)

(declare-fun contains!7471 (ListLongMap!18421 (_ BitVec 64)) Bool)

(assert (=> b!1250855 (= res!834317 (contains!7471 lt!564364 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47535)

(declare-datatypes ((array!80843 0))(
  ( (array!80844 (arr!38987 (Array (_ BitVec 32) (_ BitVec 64))) (size!39525 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80843)

(declare-datatypes ((ValueCell!15050 0))(
  ( (ValueCellFull!15050 (v!18572 V!47535)) (EmptyCell!15050) )
))
(declare-datatypes ((array!80845 0))(
  ( (array!80846 (arr!38988 (Array (_ BitVec 32) ValueCell!15050)) (size!39526 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80845)

(declare-fun minValueBefore!43 () V!47535)

(declare-fun getCurrentListMap!4397 (array!80843 array!80845 (_ BitVec 32) (_ BitVec 32) V!47535 V!47535 (_ BitVec 32) Int) ListLongMap!18421)

(assert (=> b!1250855 (= lt!564364 (getCurrentListMap!4397 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250856 () Bool)

(declare-fun e!710197 () Bool)

(declare-fun tp_is_empty!31627 () Bool)

(assert (=> b!1250856 (= e!710197 tp_is_empty!31627)))

(declare-fun mapIsEmpty!49207 () Bool)

(declare-fun mapRes!49207 () Bool)

(assert (=> mapIsEmpty!49207 mapRes!49207))

(declare-fun res!834318 () Bool)

(declare-fun e!710201 () Bool)

(assert (=> start!104952 (=> (not res!834318) (not e!710201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104952 (= res!834318 (validMask!0 mask!1466))))

(assert (=> start!104952 e!710201))

(assert (=> start!104952 true))

(assert (=> start!104952 tp!93671))

(assert (=> start!104952 tp_is_empty!31627))

(declare-fun array_inv!29871 (array!80843) Bool)

(assert (=> start!104952 (array_inv!29871 _keys!1118)))

(declare-fun e!710202 () Bool)

(declare-fun array_inv!29872 (array!80845) Bool)

(assert (=> start!104952 (and (array_inv!29872 _values!914) e!710202)))

(declare-fun b!1250857 () Bool)

(declare-fun res!834321 () Bool)

(assert (=> b!1250857 (=> (not res!834321) (not e!710201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80843 (_ BitVec 32)) Bool)

(assert (=> b!1250857 (= res!834321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250858 () Bool)

(declare-fun res!834320 () Bool)

(assert (=> b!1250858 (=> (not res!834320) (not e!710201))))

(declare-datatypes ((List!27770 0))(
  ( (Nil!27767) (Cons!27766 (h!28975 (_ BitVec 64)) (t!41236 List!27770)) )
))
(declare-fun arrayNoDuplicates!0 (array!80843 (_ BitVec 32) List!27770) Bool)

(assert (=> b!1250858 (= res!834320 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27767))))

(declare-fun b!1250859 () Bool)

(declare-fun res!834319 () Bool)

(assert (=> b!1250859 (=> (not res!834319) (not e!710201))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1250859 (= res!834319 (and (= (size!39526 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39525 _keys!1118) (size!39526 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250860 () Bool)

(assert (=> b!1250860 (= e!710199 true)))

(declare-fun -!1972 (ListLongMap!18421 (_ BitVec 64)) ListLongMap!18421)

(assert (=> b!1250860 (= (-!1972 lt!564364 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564364)))

(declare-datatypes ((Unit!41418 0))(
  ( (Unit!41419) )
))
(declare-fun lt!564366 () Unit!41418)

(declare-fun removeNotPresentStillSame!100 (ListLongMap!18421 (_ BitVec 64)) Unit!41418)

(assert (=> b!1250860 (= lt!564366 (removeNotPresentStillSame!100 lt!564364 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!49207 () Bool)

(declare-fun tp!93670 () Bool)

(declare-fun e!710200 () Bool)

(assert (=> mapNonEmpty!49207 (= mapRes!49207 (and tp!93670 e!710200))))

(declare-fun mapKey!49207 () (_ BitVec 32))

(declare-fun mapRest!49207 () (Array (_ BitVec 32) ValueCell!15050))

(declare-fun mapValue!49207 () ValueCell!15050)

(assert (=> mapNonEmpty!49207 (= (arr!38988 _values!914) (store mapRest!49207 mapKey!49207 mapValue!49207))))

(declare-fun b!1250861 () Bool)

(assert (=> b!1250861 (= e!710200 tp_is_empty!31627)))

(declare-fun b!1250862 () Bool)

(assert (=> b!1250862 (= e!710202 (and e!710197 mapRes!49207))))

(declare-fun condMapEmpty!49207 () Bool)

(declare-fun mapDefault!49207 () ValueCell!15050)

(assert (=> b!1250862 (= condMapEmpty!49207 (= (arr!38988 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15050)) mapDefault!49207)))))

(declare-fun b!1250863 () Bool)

(assert (=> b!1250863 (= e!710201 (not e!710198))))

(declare-fun res!834322 () Bool)

(assert (=> b!1250863 (=> res!834322 e!710198)))

(assert (=> b!1250863 (= res!834322 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564363 () ListLongMap!18421)

(declare-fun lt!564365 () ListLongMap!18421)

(assert (=> b!1250863 (= lt!564363 lt!564365)))

(declare-fun minValueAfter!43 () V!47535)

(declare-fun lt!564367 () Unit!41418)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!957 (array!80843 array!80845 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47535 V!47535 V!47535 V!47535 (_ BitVec 32) Int) Unit!41418)

(assert (=> b!1250863 (= lt!564367 (lemmaNoChangeToArrayThenSameMapNoExtras!957 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5635 (array!80843 array!80845 (_ BitVec 32) (_ BitVec 32) V!47535 V!47535 (_ BitVec 32) Int) ListLongMap!18421)

(assert (=> b!1250863 (= lt!564365 (getCurrentListMapNoExtraKeys!5635 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250863 (= lt!564363 (getCurrentListMapNoExtraKeys!5635 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!104952 res!834318) b!1250859))

(assert (= (and b!1250859 res!834319) b!1250857))

(assert (= (and b!1250857 res!834321) b!1250858))

(assert (= (and b!1250858 res!834320) b!1250863))

(assert (= (and b!1250863 (not res!834322)) b!1250855))

(assert (= (and b!1250855 (not res!834317)) b!1250860))

(assert (= (and b!1250862 condMapEmpty!49207) mapIsEmpty!49207))

(assert (= (and b!1250862 (not condMapEmpty!49207)) mapNonEmpty!49207))

(get-info :version)

(assert (= (and mapNonEmpty!49207 ((_ is ValueCellFull!15050) mapValue!49207)) b!1250861))

(assert (= (and b!1250862 ((_ is ValueCellFull!15050) mapDefault!49207)) b!1250856))

(assert (= start!104952 b!1250862))

(declare-fun m!1151203 () Bool)

(assert (=> b!1250858 m!1151203))

(declare-fun m!1151205 () Bool)

(assert (=> b!1250857 m!1151205))

(declare-fun m!1151207 () Bool)

(assert (=> mapNonEmpty!49207 m!1151207))

(declare-fun m!1151209 () Bool)

(assert (=> b!1250863 m!1151209))

(declare-fun m!1151211 () Bool)

(assert (=> b!1250863 m!1151211))

(declare-fun m!1151213 () Bool)

(assert (=> b!1250863 m!1151213))

(declare-fun m!1151215 () Bool)

(assert (=> start!104952 m!1151215))

(declare-fun m!1151217 () Bool)

(assert (=> start!104952 m!1151217))

(declare-fun m!1151219 () Bool)

(assert (=> start!104952 m!1151219))

(declare-fun m!1151221 () Bool)

(assert (=> b!1250860 m!1151221))

(declare-fun m!1151223 () Bool)

(assert (=> b!1250860 m!1151223))

(declare-fun m!1151225 () Bool)

(assert (=> b!1250855 m!1151225))

(declare-fun m!1151227 () Bool)

(assert (=> b!1250855 m!1151227))

(check-sat (not b!1250857) (not mapNonEmpty!49207) (not b_next!26725) (not b!1250858) (not b!1250863) (not b!1250860) (not start!104952) b_and!44493 (not b!1250855) tp_is_empty!31627)
(check-sat b_and!44493 (not b_next!26725))
