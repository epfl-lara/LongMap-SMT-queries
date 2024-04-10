; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105254 () Bool)

(assert start!105254)

(declare-fun b_free!26949 () Bool)

(declare-fun b_next!26949 () Bool)

(assert (=> start!105254 (= b_free!26949 (not b_next!26949))))

(declare-fun tp!94355 () Bool)

(declare-fun b_and!44775 () Bool)

(assert (=> start!105254 (= tp!94355 b_and!44775)))

(declare-fun b!1254197 () Bool)

(declare-fun res!836269 () Bool)

(declare-fun e!712623 () Bool)

(assert (=> b!1254197 (=> (not res!836269) (not e!712623))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81360 0))(
  ( (array!81361 (arr!39241 (Array (_ BitVec 32) (_ BitVec 64))) (size!39777 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81360)

(declare-datatypes ((V!47833 0))(
  ( (V!47834 (val!15988 Int)) )
))
(declare-datatypes ((ValueCell!15162 0))(
  ( (ValueCellFull!15162 (v!18687 V!47833)) (EmptyCell!15162) )
))
(declare-datatypes ((array!81362 0))(
  ( (array!81363 (arr!39242 (Array (_ BitVec 32) ValueCell!15162)) (size!39778 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81362)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254197 (= res!836269 (and (= (size!39778 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39777 _keys!1118) (size!39778 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254198 () Bool)

(declare-fun e!712627 () Bool)

(declare-fun tp_is_empty!31851 () Bool)

(assert (=> b!1254198 (= e!712627 tp_is_empty!31851)))

(declare-fun b!1254199 () Bool)

(declare-fun e!712625 () Bool)

(assert (=> b!1254199 (= e!712625 true)))

(declare-datatypes ((tuple2!20640 0))(
  ( (tuple2!20641 (_1!10331 (_ BitVec 64)) (_2!10331 V!47833)) )
))
(declare-datatypes ((List!27867 0))(
  ( (Nil!27864) (Cons!27863 (h!29072 tuple2!20640) (t!41350 List!27867)) )
))
(declare-datatypes ((ListLongMap!18513 0))(
  ( (ListLongMap!18514 (toList!9272 List!27867)) )
))
(declare-fun lt!566688 () ListLongMap!18513)

(declare-fun lt!566681 () ListLongMap!18513)

(declare-fun -!2045 (ListLongMap!18513 (_ BitVec 64)) ListLongMap!18513)

(assert (=> b!1254199 (= lt!566688 (-!2045 lt!566681 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566682 () ListLongMap!18513)

(declare-fun lt!566683 () ListLongMap!18513)

(assert (=> b!1254199 (= (-!2045 lt!566682 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566683)))

(declare-datatypes ((Unit!41728 0))(
  ( (Unit!41729) )
))
(declare-fun lt!566687 () Unit!41728)

(declare-fun minValueBefore!43 () V!47833)

(declare-fun addThenRemoveForNewKeyIsSame!315 (ListLongMap!18513 (_ BitVec 64) V!47833) Unit!41728)

(assert (=> b!1254199 (= lt!566687 (addThenRemoveForNewKeyIsSame!315 lt!566683 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566686 () ListLongMap!18513)

(declare-fun lt!566684 () ListLongMap!18513)

(assert (=> b!1254199 (and (= lt!566681 lt!566682) (= lt!566686 lt!566684))))

(declare-fun +!4168 (ListLongMap!18513 tuple2!20640) ListLongMap!18513)

(assert (=> b!1254199 (= lt!566682 (+!4168 lt!566683 (tuple2!20641 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47833)

(declare-fun zeroValue!871 () V!47833)

(declare-fun getCurrentListMap!4516 (array!81360 array!81362 (_ BitVec 32) (_ BitVec 32) V!47833 V!47833 (_ BitVec 32) Int) ListLongMap!18513)

(assert (=> b!1254199 (= lt!566686 (getCurrentListMap!4516 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254199 (= lt!566681 (getCurrentListMap!4516 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49555 () Bool)

(declare-fun mapRes!49555 () Bool)

(assert (=> mapIsEmpty!49555 mapRes!49555))

(declare-fun mapNonEmpty!49555 () Bool)

(declare-fun tp!94354 () Bool)

(assert (=> mapNonEmpty!49555 (= mapRes!49555 (and tp!94354 e!712627))))

(declare-fun mapValue!49555 () ValueCell!15162)

(declare-fun mapKey!49555 () (_ BitVec 32))

(declare-fun mapRest!49555 () (Array (_ BitVec 32) ValueCell!15162))

(assert (=> mapNonEmpty!49555 (= (arr!39242 _values!914) (store mapRest!49555 mapKey!49555 mapValue!49555))))

(declare-fun b!1254200 () Bool)

(declare-fun e!712624 () Bool)

(assert (=> b!1254200 (= e!712624 tp_is_empty!31851)))

(declare-fun res!836268 () Bool)

(assert (=> start!105254 (=> (not res!836268) (not e!712623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105254 (= res!836268 (validMask!0 mask!1466))))

(assert (=> start!105254 e!712623))

(assert (=> start!105254 true))

(assert (=> start!105254 tp!94355))

(assert (=> start!105254 tp_is_empty!31851))

(declare-fun array_inv!29917 (array!81360) Bool)

(assert (=> start!105254 (array_inv!29917 _keys!1118)))

(declare-fun e!712626 () Bool)

(declare-fun array_inv!29918 (array!81362) Bool)

(assert (=> start!105254 (and (array_inv!29918 _values!914) e!712626)))

(declare-fun b!1254201 () Bool)

(assert (=> b!1254201 (= e!712626 (and e!712624 mapRes!49555))))

(declare-fun condMapEmpty!49555 () Bool)

(declare-fun mapDefault!49555 () ValueCell!15162)

(assert (=> b!1254201 (= condMapEmpty!49555 (= (arr!39242 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15162)) mapDefault!49555)))))

(declare-fun b!1254202 () Bool)

(declare-fun res!836270 () Bool)

(assert (=> b!1254202 (=> (not res!836270) (not e!712623))))

(declare-datatypes ((List!27868 0))(
  ( (Nil!27865) (Cons!27864 (h!29073 (_ BitVec 64)) (t!41351 List!27868)) )
))
(declare-fun arrayNoDuplicates!0 (array!81360 (_ BitVec 32) List!27868) Bool)

(assert (=> b!1254202 (= res!836270 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27865))))

(declare-fun b!1254203 () Bool)

(declare-fun res!836267 () Bool)

(assert (=> b!1254203 (=> (not res!836267) (not e!712623))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81360 (_ BitVec 32)) Bool)

(assert (=> b!1254203 (= res!836267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254204 () Bool)

(assert (=> b!1254204 (= e!712623 (not e!712625))))

(declare-fun res!836271 () Bool)

(assert (=> b!1254204 (=> res!836271 e!712625)))

(assert (=> b!1254204 (= res!836271 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254204 (= lt!566683 lt!566684)))

(declare-fun lt!566685 () Unit!41728)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1024 (array!81360 array!81362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47833 V!47833 V!47833 V!47833 (_ BitVec 32) Int) Unit!41728)

(assert (=> b!1254204 (= lt!566685 (lemmaNoChangeToArrayThenSameMapNoExtras!1024 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5660 (array!81360 array!81362 (_ BitVec 32) (_ BitVec 32) V!47833 V!47833 (_ BitVec 32) Int) ListLongMap!18513)

(assert (=> b!1254204 (= lt!566684 (getCurrentListMapNoExtraKeys!5660 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254204 (= lt!566683 (getCurrentListMapNoExtraKeys!5660 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105254 res!836268) b!1254197))

(assert (= (and b!1254197 res!836269) b!1254203))

(assert (= (and b!1254203 res!836267) b!1254202))

(assert (= (and b!1254202 res!836270) b!1254204))

(assert (= (and b!1254204 (not res!836271)) b!1254199))

(assert (= (and b!1254201 condMapEmpty!49555) mapIsEmpty!49555))

(assert (= (and b!1254201 (not condMapEmpty!49555)) mapNonEmpty!49555))

(get-info :version)

(assert (= (and mapNonEmpty!49555 ((_ is ValueCellFull!15162) mapValue!49555)) b!1254198))

(assert (= (and b!1254201 ((_ is ValueCellFull!15162) mapDefault!49555)) b!1254200))

(assert (= start!105254 b!1254201))

(declare-fun m!1154869 () Bool)

(assert (=> b!1254203 m!1154869))

(declare-fun m!1154871 () Bool)

(assert (=> start!105254 m!1154871))

(declare-fun m!1154873 () Bool)

(assert (=> start!105254 m!1154873))

(declare-fun m!1154875 () Bool)

(assert (=> start!105254 m!1154875))

(declare-fun m!1154877 () Bool)

(assert (=> mapNonEmpty!49555 m!1154877))

(declare-fun m!1154879 () Bool)

(assert (=> b!1254204 m!1154879))

(declare-fun m!1154881 () Bool)

(assert (=> b!1254204 m!1154881))

(declare-fun m!1154883 () Bool)

(assert (=> b!1254204 m!1154883))

(declare-fun m!1154885 () Bool)

(assert (=> b!1254202 m!1154885))

(declare-fun m!1154887 () Bool)

(assert (=> b!1254199 m!1154887))

(declare-fun m!1154889 () Bool)

(assert (=> b!1254199 m!1154889))

(declare-fun m!1154891 () Bool)

(assert (=> b!1254199 m!1154891))

(declare-fun m!1154893 () Bool)

(assert (=> b!1254199 m!1154893))

(declare-fun m!1154895 () Bool)

(assert (=> b!1254199 m!1154895))

(declare-fun m!1154897 () Bool)

(assert (=> b!1254199 m!1154897))

(check-sat b_and!44775 (not start!105254) (not b!1254204) (not b!1254199) tp_is_empty!31851 (not b_next!26949) (not mapNonEmpty!49555) (not b!1254202) (not b!1254203))
(check-sat b_and!44775 (not b_next!26949))
