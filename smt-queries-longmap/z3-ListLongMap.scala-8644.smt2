; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105406 () Bool)

(assert start!105406)

(declare-fun b_free!26899 () Bool)

(declare-fun b_next!26899 () Bool)

(assert (=> start!105406 (= b_free!26899 (not b_next!26899))))

(declare-fun tp!94201 () Bool)

(declare-fun b_and!44715 () Bool)

(assert (=> start!105406 (= tp!94201 b_and!44715)))

(declare-fun mapNonEmpty!49477 () Bool)

(declare-fun mapRes!49477 () Bool)

(declare-fun tp!94202 () Bool)

(declare-fun e!712901 () Bool)

(assert (=> mapNonEmpty!49477 (= mapRes!49477 (and tp!94202 e!712901))))

(declare-datatypes ((V!47767 0))(
  ( (V!47768 (val!15963 Int)) )
))
(declare-datatypes ((ValueCell!15137 0))(
  ( (ValueCellFull!15137 (v!18657 V!47767)) (EmptyCell!15137) )
))
(declare-fun mapValue!49477 () ValueCell!15137)

(declare-datatypes ((array!81303 0))(
  ( (array!81304 (arr!39209 (Array (_ BitVec 32) ValueCell!15137)) (size!39746 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81303)

(declare-fun mapKey!49477 () (_ BitVec 32))

(declare-fun mapRest!49477 () (Array (_ BitVec 32) ValueCell!15137))

(assert (=> mapNonEmpty!49477 (= (arr!39209 _values!914) (store mapRest!49477 mapKey!49477 mapValue!49477))))

(declare-fun b!1254718 () Bool)

(declare-fun e!712904 () Bool)

(declare-fun e!712902 () Bool)

(assert (=> b!1254718 (= e!712904 (and e!712902 mapRes!49477))))

(declare-fun condMapEmpty!49477 () Bool)

(declare-fun mapDefault!49477 () ValueCell!15137)

(assert (=> b!1254718 (= condMapEmpty!49477 (= (arr!39209 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15137)) mapDefault!49477)))))

(declare-fun b!1254719 () Bool)

(declare-fun e!712906 () Bool)

(assert (=> b!1254719 (= e!712906 true)))

(declare-datatypes ((tuple2!20616 0))(
  ( (tuple2!20617 (_1!10319 (_ BitVec 64)) (_2!10319 V!47767)) )
))
(declare-datatypes ((List!27854 0))(
  ( (Nil!27851) (Cons!27850 (h!29068 tuple2!20616) (t!41327 List!27854)) )
))
(declare-datatypes ((ListLongMap!18497 0))(
  ( (ListLongMap!18498 (toList!9264 List!27854)) )
))
(declare-fun lt!566429 () ListLongMap!18497)

(declare-fun lt!566428 () ListLongMap!18497)

(declare-fun -!2006 (ListLongMap!18497 (_ BitVec 64)) ListLongMap!18497)

(assert (=> b!1254719 (= lt!566429 (-!2006 lt!566428 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566432 () ListLongMap!18497)

(declare-fun lt!566433 () ListLongMap!18497)

(assert (=> b!1254719 (= (-!2006 lt!566432 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566433)))

(declare-datatypes ((Unit!41665 0))(
  ( (Unit!41666) )
))
(declare-fun lt!566427 () Unit!41665)

(declare-fun minValueBefore!43 () V!47767)

(declare-fun addThenRemoveForNewKeyIsSame!296 (ListLongMap!18497 (_ BitVec 64) V!47767) Unit!41665)

(assert (=> b!1254719 (= lt!566427 (addThenRemoveForNewKeyIsSame!296 lt!566433 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566431 () ListLongMap!18497)

(declare-fun lt!566434 () ListLongMap!18497)

(assert (=> b!1254719 (and (= lt!566428 lt!566432) (= lt!566431 lt!566434))))

(declare-fun +!4202 (ListLongMap!18497 tuple2!20616) ListLongMap!18497)

(assert (=> b!1254719 (= lt!566432 (+!4202 lt!566433 (tuple2!20617 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47767)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47767)

(declare-datatypes ((array!81305 0))(
  ( (array!81306 (arr!39210 (Array (_ BitVec 32) (_ BitVec 64))) (size!39747 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81305)

(declare-fun getCurrentListMap!4499 (array!81305 array!81303 (_ BitVec 32) (_ BitVec 32) V!47767 V!47767 (_ BitVec 32) Int) ListLongMap!18497)

(assert (=> b!1254719 (= lt!566431 (getCurrentListMap!4499 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254719 (= lt!566428 (getCurrentListMap!4499 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254720 () Bool)

(declare-fun res!836330 () Bool)

(declare-fun e!712903 () Bool)

(assert (=> b!1254720 (=> (not res!836330) (not e!712903))))

(assert (=> b!1254720 (= res!836330 (and (= (size!39746 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39747 _keys!1118) (size!39746 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!836333 () Bool)

(assert (=> start!105406 (=> (not res!836333) (not e!712903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105406 (= res!836333 (validMask!0 mask!1466))))

(assert (=> start!105406 e!712903))

(assert (=> start!105406 true))

(assert (=> start!105406 tp!94201))

(declare-fun tp_is_empty!31801 () Bool)

(assert (=> start!105406 tp_is_empty!31801))

(declare-fun array_inv!30009 (array!81305) Bool)

(assert (=> start!105406 (array_inv!30009 _keys!1118)))

(declare-fun array_inv!30010 (array!81303) Bool)

(assert (=> start!105406 (and (array_inv!30010 _values!914) e!712904)))

(declare-fun b!1254721 () Bool)

(assert (=> b!1254721 (= e!712903 (not e!712906))))

(declare-fun res!836332 () Bool)

(assert (=> b!1254721 (=> res!836332 e!712906)))

(assert (=> b!1254721 (= res!836332 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254721 (= lt!566433 lt!566434)))

(declare-fun lt!566430 () Unit!41665)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1003 (array!81305 array!81303 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47767 V!47767 V!47767 V!47767 (_ BitVec 32) Int) Unit!41665)

(assert (=> b!1254721 (= lt!566430 (lemmaNoChangeToArrayThenSameMapNoExtras!1003 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5689 (array!81305 array!81303 (_ BitVec 32) (_ BitVec 32) V!47767 V!47767 (_ BitVec 32) Int) ListLongMap!18497)

(assert (=> b!1254721 (= lt!566434 (getCurrentListMapNoExtraKeys!5689 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254721 (= lt!566433 (getCurrentListMapNoExtraKeys!5689 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254722 () Bool)

(declare-fun res!836331 () Bool)

(assert (=> b!1254722 (=> (not res!836331) (not e!712903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81305 (_ BitVec 32)) Bool)

(assert (=> b!1254722 (= res!836331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254723 () Bool)

(declare-fun res!836334 () Bool)

(assert (=> b!1254723 (=> (not res!836334) (not e!712903))))

(declare-datatypes ((List!27855 0))(
  ( (Nil!27852) (Cons!27851 (h!29069 (_ BitVec 64)) (t!41328 List!27855)) )
))
(declare-fun arrayNoDuplicates!0 (array!81305 (_ BitVec 32) List!27855) Bool)

(assert (=> b!1254723 (= res!836334 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27852))))

(declare-fun b!1254724 () Bool)

(assert (=> b!1254724 (= e!712902 tp_is_empty!31801)))

(declare-fun mapIsEmpty!49477 () Bool)

(assert (=> mapIsEmpty!49477 mapRes!49477))

(declare-fun b!1254725 () Bool)

(assert (=> b!1254725 (= e!712901 tp_is_empty!31801)))

(assert (= (and start!105406 res!836333) b!1254720))

(assert (= (and b!1254720 res!836330) b!1254722))

(assert (= (and b!1254722 res!836331) b!1254723))

(assert (= (and b!1254723 res!836334) b!1254721))

(assert (= (and b!1254721 (not res!836332)) b!1254719))

(assert (= (and b!1254718 condMapEmpty!49477) mapIsEmpty!49477))

(assert (= (and b!1254718 (not condMapEmpty!49477)) mapNonEmpty!49477))

(get-info :version)

(assert (= (and mapNonEmpty!49477 ((_ is ValueCellFull!15137) mapValue!49477)) b!1254725))

(assert (= (and b!1254718 ((_ is ValueCellFull!15137) mapDefault!49477)) b!1254724))

(assert (= start!105406 b!1254718))

(declare-fun m!1155547 () Bool)

(assert (=> b!1254722 m!1155547))

(declare-fun m!1155549 () Bool)

(assert (=> mapNonEmpty!49477 m!1155549))

(declare-fun m!1155551 () Bool)

(assert (=> b!1254721 m!1155551))

(declare-fun m!1155553 () Bool)

(assert (=> b!1254721 m!1155553))

(declare-fun m!1155555 () Bool)

(assert (=> b!1254721 m!1155555))

(declare-fun m!1155557 () Bool)

(assert (=> start!105406 m!1155557))

(declare-fun m!1155559 () Bool)

(assert (=> start!105406 m!1155559))

(declare-fun m!1155561 () Bool)

(assert (=> start!105406 m!1155561))

(declare-fun m!1155563 () Bool)

(assert (=> b!1254723 m!1155563))

(declare-fun m!1155565 () Bool)

(assert (=> b!1254719 m!1155565))

(declare-fun m!1155567 () Bool)

(assert (=> b!1254719 m!1155567))

(declare-fun m!1155569 () Bool)

(assert (=> b!1254719 m!1155569))

(declare-fun m!1155571 () Bool)

(assert (=> b!1254719 m!1155571))

(declare-fun m!1155573 () Bool)

(assert (=> b!1254719 m!1155573))

(declare-fun m!1155575 () Bool)

(assert (=> b!1254719 m!1155575))

(check-sat tp_is_empty!31801 (not start!105406) (not b_next!26899) (not b!1254721) b_and!44715 (not b!1254722) (not b!1254719) (not mapNonEmpty!49477) (not b!1254723))
(check-sat b_and!44715 (not b_next!26899))
