; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105506 () Bool)

(assert start!105506)

(declare-fun b_free!26977 () Bool)

(declare-fun b_next!26977 () Bool)

(assert (=> start!105506 (= b_free!26977 (not b_next!26977))))

(declare-fun tp!94439 () Bool)

(declare-fun b_and!44805 () Bool)

(assert (=> start!105506 (= tp!94439 b_and!44805)))

(declare-fun mapIsEmpty!49597 () Bool)

(declare-fun mapRes!49597 () Bool)

(assert (=> mapIsEmpty!49597 mapRes!49597))

(declare-fun mapNonEmpty!49597 () Bool)

(declare-fun tp!94438 () Bool)

(declare-fun e!713723 () Bool)

(assert (=> mapNonEmpty!49597 (= mapRes!49597 (and tp!94438 e!713723))))

(declare-fun mapKey!49597 () (_ BitVec 32))

(declare-datatypes ((V!47871 0))(
  ( (V!47872 (val!16002 Int)) )
))
(declare-datatypes ((ValueCell!15176 0))(
  ( (ValueCellFull!15176 (v!18697 V!47871)) (EmptyCell!15176) )
))
(declare-fun mapValue!49597 () ValueCell!15176)

(declare-fun mapRest!49597 () (Array (_ BitVec 32) ValueCell!15176))

(declare-datatypes ((array!81457 0))(
  ( (array!81458 (arr!39285 (Array (_ BitVec 32) ValueCell!15176)) (size!39822 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81457)

(assert (=> mapNonEmpty!49597 (= (arr!39285 _values!914) (store mapRest!49597 mapKey!49597 mapValue!49597))))

(declare-fun b!1255838 () Bool)

(declare-fun e!713726 () Bool)

(declare-fun e!713727 () Bool)

(assert (=> b!1255838 (= e!713726 (and e!713727 mapRes!49597))))

(declare-fun condMapEmpty!49597 () Bool)

(declare-fun mapDefault!49597 () ValueCell!15176)

(assert (=> b!1255838 (= condMapEmpty!49597 (= (arr!39285 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15176)) mapDefault!49597)))))

(declare-fun b!1255839 () Bool)

(declare-fun tp_is_empty!31879 () Bool)

(assert (=> b!1255839 (= e!713723 tp_is_empty!31879)))

(declare-fun b!1255840 () Bool)

(declare-fun e!713722 () Bool)

(declare-fun e!713724 () Bool)

(assert (=> b!1255840 (= e!713722 (not e!713724))))

(declare-fun res!836999 () Bool)

(assert (=> b!1255840 (=> res!836999 e!713724)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1255840 (= res!836999 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20680 0))(
  ( (tuple2!20681 (_1!10351 (_ BitVec 64)) (_2!10351 V!47871)) )
))
(declare-datatypes ((List!27917 0))(
  ( (Nil!27914) (Cons!27913 (h!29131 tuple2!20680) (t!41392 List!27917)) )
))
(declare-datatypes ((ListLongMap!18561 0))(
  ( (ListLongMap!18562 (toList!9296 List!27917)) )
))
(declare-fun lt!567502 () ListLongMap!18561)

(declare-fun lt!567508 () ListLongMap!18561)

(assert (=> b!1255840 (= lt!567502 lt!567508)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47871)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47871)

(declare-datatypes ((array!81459 0))(
  ( (array!81460 (arr!39286 (Array (_ BitVec 32) (_ BitVec 64))) (size!39823 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81459)

(declare-fun minValueBefore!43 () V!47871)

(declare-datatypes ((Unit!41731 0))(
  ( (Unit!41732) )
))
(declare-fun lt!567506 () Unit!41731)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1034 (array!81459 array!81457 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47871 V!47871 V!47871 V!47871 (_ BitVec 32) Int) Unit!41731)

(assert (=> b!1255840 (= lt!567506 (lemmaNoChangeToArrayThenSameMapNoExtras!1034 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5720 (array!81459 array!81457 (_ BitVec 32) (_ BitVec 32) V!47871 V!47871 (_ BitVec 32) Int) ListLongMap!18561)

(assert (=> b!1255840 (= lt!567508 (getCurrentListMapNoExtraKeys!5720 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255840 (= lt!567502 (getCurrentListMapNoExtraKeys!5720 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!836997 () Bool)

(assert (=> start!105506 (=> (not res!836997) (not e!713722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105506 (= res!836997 (validMask!0 mask!1466))))

(assert (=> start!105506 e!713722))

(assert (=> start!105506 true))

(assert (=> start!105506 tp!94439))

(assert (=> start!105506 tp_is_empty!31879))

(declare-fun array_inv!30065 (array!81459) Bool)

(assert (=> start!105506 (array_inv!30065 _keys!1118)))

(declare-fun array_inv!30066 (array!81457) Bool)

(assert (=> start!105506 (and (array_inv!30066 _values!914) e!713726)))

(declare-fun b!1255841 () Bool)

(assert (=> b!1255841 (= e!713724 true)))

(declare-fun lt!567501 () ListLongMap!18561)

(declare-fun lt!567504 () ListLongMap!18561)

(declare-fun -!2034 (ListLongMap!18561 (_ BitVec 64)) ListLongMap!18561)

(assert (=> b!1255841 (= lt!567501 (-!2034 lt!567504 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!567507 () ListLongMap!18561)

(assert (=> b!1255841 (= (-!2034 lt!567507 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567502)))

(declare-fun lt!567505 () Unit!41731)

(declare-fun addThenRemoveForNewKeyIsSame!324 (ListLongMap!18561 (_ BitVec 64) V!47871) Unit!41731)

(assert (=> b!1255841 (= lt!567505 (addThenRemoveForNewKeyIsSame!324 lt!567502 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!567503 () ListLongMap!18561)

(assert (=> b!1255841 (and (= lt!567504 lt!567507) (= lt!567503 lt!567508))))

(declare-fun +!4230 (ListLongMap!18561 tuple2!20680) ListLongMap!18561)

(assert (=> b!1255841 (= lt!567507 (+!4230 lt!567502 (tuple2!20681 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4527 (array!81459 array!81457 (_ BitVec 32) (_ BitVec 32) V!47871 V!47871 (_ BitVec 32) Int) ListLongMap!18561)

(assert (=> b!1255841 (= lt!567503 (getCurrentListMap!4527 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255841 (= lt!567504 (getCurrentListMap!4527 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255842 () Bool)

(declare-fun res!837001 () Bool)

(assert (=> b!1255842 (=> (not res!837001) (not e!713722))))

(assert (=> b!1255842 (= res!837001 (and (= (size!39822 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39823 _keys!1118) (size!39822 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255843 () Bool)

(assert (=> b!1255843 (= e!713727 tp_is_empty!31879)))

(declare-fun b!1255844 () Bool)

(declare-fun res!836998 () Bool)

(assert (=> b!1255844 (=> (not res!836998) (not e!713722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81459 (_ BitVec 32)) Bool)

(assert (=> b!1255844 (= res!836998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255845 () Bool)

(declare-fun res!837000 () Bool)

(assert (=> b!1255845 (=> (not res!837000) (not e!713722))))

(declare-datatypes ((List!27918 0))(
  ( (Nil!27915) (Cons!27914 (h!29132 (_ BitVec 64)) (t!41393 List!27918)) )
))
(declare-fun arrayNoDuplicates!0 (array!81459 (_ BitVec 32) List!27918) Bool)

(assert (=> b!1255845 (= res!837000 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27915))))

(assert (= (and start!105506 res!836997) b!1255842))

(assert (= (and b!1255842 res!837001) b!1255844))

(assert (= (and b!1255844 res!836998) b!1255845))

(assert (= (and b!1255845 res!837000) b!1255840))

(assert (= (and b!1255840 (not res!836999)) b!1255841))

(assert (= (and b!1255838 condMapEmpty!49597) mapIsEmpty!49597))

(assert (= (and b!1255838 (not condMapEmpty!49597)) mapNonEmpty!49597))

(get-info :version)

(assert (= (and mapNonEmpty!49597 ((_ is ValueCellFull!15176) mapValue!49597)) b!1255839))

(assert (= (and b!1255838 ((_ is ValueCellFull!15176) mapDefault!49597)) b!1255843))

(assert (= start!105506 b!1255838))

(declare-fun m!1156901 () Bool)

(assert (=> start!105506 m!1156901))

(declare-fun m!1156903 () Bool)

(assert (=> start!105506 m!1156903))

(declare-fun m!1156905 () Bool)

(assert (=> start!105506 m!1156905))

(declare-fun m!1156907 () Bool)

(assert (=> b!1255841 m!1156907))

(declare-fun m!1156909 () Bool)

(assert (=> b!1255841 m!1156909))

(declare-fun m!1156911 () Bool)

(assert (=> b!1255841 m!1156911))

(declare-fun m!1156913 () Bool)

(assert (=> b!1255841 m!1156913))

(declare-fun m!1156915 () Bool)

(assert (=> b!1255841 m!1156915))

(declare-fun m!1156917 () Bool)

(assert (=> b!1255841 m!1156917))

(declare-fun m!1156919 () Bool)

(assert (=> mapNonEmpty!49597 m!1156919))

(declare-fun m!1156921 () Bool)

(assert (=> b!1255844 m!1156921))

(declare-fun m!1156923 () Bool)

(assert (=> b!1255845 m!1156923))

(declare-fun m!1156925 () Bool)

(assert (=> b!1255840 m!1156925))

(declare-fun m!1156927 () Bool)

(assert (=> b!1255840 m!1156927))

(declare-fun m!1156929 () Bool)

(assert (=> b!1255840 m!1156929))

(check-sat (not b!1255841) (not b!1255844) b_and!44805 (not mapNonEmpty!49597) (not b!1255845) (not b!1255840) tp_is_empty!31879 (not b_next!26977) (not start!105506))
(check-sat b_and!44805 (not b_next!26977))
