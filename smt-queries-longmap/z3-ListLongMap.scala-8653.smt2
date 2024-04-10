; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105260 () Bool)

(assert start!105260)

(declare-fun b_free!26955 () Bool)

(declare-fun b_next!26955 () Bool)

(assert (=> start!105260 (= b_free!26955 (not b_next!26955))))

(declare-fun tp!94373 () Bool)

(declare-fun b_and!44781 () Bool)

(assert (=> start!105260 (= tp!94373 b_and!44781)))

(declare-fun b!1254269 () Bool)

(declare-fun e!712677 () Bool)

(declare-fun tp_is_empty!31857 () Bool)

(assert (=> b!1254269 (= e!712677 tp_is_empty!31857)))

(declare-fun b!1254270 () Bool)

(declare-fun e!712681 () Bool)

(declare-fun e!712682 () Bool)

(declare-fun mapRes!49564 () Bool)

(assert (=> b!1254270 (= e!712681 (and e!712682 mapRes!49564))))

(declare-fun condMapEmpty!49564 () Bool)

(declare-datatypes ((V!47841 0))(
  ( (V!47842 (val!15991 Int)) )
))
(declare-datatypes ((ValueCell!15165 0))(
  ( (ValueCellFull!15165 (v!18690 V!47841)) (EmptyCell!15165) )
))
(declare-datatypes ((array!81370 0))(
  ( (array!81371 (arr!39246 (Array (_ BitVec 32) ValueCell!15165)) (size!39782 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81370)

(declare-fun mapDefault!49564 () ValueCell!15165)

(assert (=> b!1254270 (= condMapEmpty!49564 (= (arr!39246 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15165)) mapDefault!49564)))))

(declare-fun b!1254271 () Bool)

(declare-fun res!836314 () Bool)

(declare-fun e!712678 () Bool)

(assert (=> b!1254271 (=> (not res!836314) (not e!712678))))

(declare-datatypes ((array!81372 0))(
  ( (array!81373 (arr!39247 (Array (_ BitVec 32) (_ BitVec 64))) (size!39783 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81372)

(declare-datatypes ((List!27870 0))(
  ( (Nil!27867) (Cons!27866 (h!29075 (_ BitVec 64)) (t!41353 List!27870)) )
))
(declare-fun arrayNoDuplicates!0 (array!81372 (_ BitVec 32) List!27870) Bool)

(assert (=> b!1254271 (= res!836314 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27867))))

(declare-fun b!1254272 () Bool)

(declare-fun e!712680 () Bool)

(assert (=> b!1254272 (= e!712680 true)))

(declare-datatypes ((tuple2!20644 0))(
  ( (tuple2!20645 (_1!10333 (_ BitVec 64)) (_2!10333 V!47841)) )
))
(declare-datatypes ((List!27871 0))(
  ( (Nil!27868) (Cons!27867 (h!29076 tuple2!20644) (t!41354 List!27871)) )
))
(declare-datatypes ((ListLongMap!18517 0))(
  ( (ListLongMap!18518 (toList!9274 List!27871)) )
))
(declare-fun lt!566759 () ListLongMap!18517)

(declare-fun lt!566753 () ListLongMap!18517)

(declare-fun -!2047 (ListLongMap!18517 (_ BitVec 64)) ListLongMap!18517)

(assert (=> b!1254272 (= lt!566759 (-!2047 lt!566753 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566757 () ListLongMap!18517)

(declare-fun lt!566755 () ListLongMap!18517)

(assert (=> b!1254272 (= (-!2047 lt!566757 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566755)))

(declare-datatypes ((Unit!41732 0))(
  ( (Unit!41733) )
))
(declare-fun lt!566760 () Unit!41732)

(declare-fun minValueBefore!43 () V!47841)

(declare-fun addThenRemoveForNewKeyIsSame!317 (ListLongMap!18517 (_ BitVec 64) V!47841) Unit!41732)

(assert (=> b!1254272 (= lt!566760 (addThenRemoveForNewKeyIsSame!317 lt!566755 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566758 () ListLongMap!18517)

(declare-fun lt!566756 () ListLongMap!18517)

(assert (=> b!1254272 (and (= lt!566753 lt!566757) (= lt!566756 lt!566758))))

(declare-fun +!4170 (ListLongMap!18517 tuple2!20644) ListLongMap!18517)

(assert (=> b!1254272 (= lt!566757 (+!4170 lt!566755 (tuple2!20645 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47841)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47841)

(declare-fun getCurrentListMap!4518 (array!81372 array!81370 (_ BitVec 32) (_ BitVec 32) V!47841 V!47841 (_ BitVec 32) Int) ListLongMap!18517)

(assert (=> b!1254272 (= lt!566756 (getCurrentListMap!4518 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254272 (= lt!566753 (getCurrentListMap!4518 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254274 () Bool)

(assert (=> b!1254274 (= e!712678 (not e!712680))))

(declare-fun res!836312 () Bool)

(assert (=> b!1254274 (=> res!836312 e!712680)))

(assert (=> b!1254274 (= res!836312 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254274 (= lt!566755 lt!566758)))

(declare-fun lt!566754 () Unit!41732)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1025 (array!81372 array!81370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47841 V!47841 V!47841 V!47841 (_ BitVec 32) Int) Unit!41732)

(assert (=> b!1254274 (= lt!566754 (lemmaNoChangeToArrayThenSameMapNoExtras!1025 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5661 (array!81372 array!81370 (_ BitVec 32) (_ BitVec 32) V!47841 V!47841 (_ BitVec 32) Int) ListLongMap!18517)

(assert (=> b!1254274 (= lt!566758 (getCurrentListMapNoExtraKeys!5661 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254274 (= lt!566755 (getCurrentListMapNoExtraKeys!5661 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254275 () Bool)

(declare-fun res!836313 () Bool)

(assert (=> b!1254275 (=> (not res!836313) (not e!712678))))

(assert (=> b!1254275 (= res!836313 (and (= (size!39782 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39783 _keys!1118) (size!39782 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49564 () Bool)

(assert (=> mapIsEmpty!49564 mapRes!49564))

(declare-fun mapNonEmpty!49564 () Bool)

(declare-fun tp!94372 () Bool)

(assert (=> mapNonEmpty!49564 (= mapRes!49564 (and tp!94372 e!712677))))

(declare-fun mapRest!49564 () (Array (_ BitVec 32) ValueCell!15165))

(declare-fun mapValue!49564 () ValueCell!15165)

(declare-fun mapKey!49564 () (_ BitVec 32))

(assert (=> mapNonEmpty!49564 (= (arr!39246 _values!914) (store mapRest!49564 mapKey!49564 mapValue!49564))))

(declare-fun b!1254276 () Bool)

(declare-fun res!836316 () Bool)

(assert (=> b!1254276 (=> (not res!836316) (not e!712678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81372 (_ BitVec 32)) Bool)

(assert (=> b!1254276 (= res!836316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254273 () Bool)

(assert (=> b!1254273 (= e!712682 tp_is_empty!31857)))

(declare-fun res!836315 () Bool)

(assert (=> start!105260 (=> (not res!836315) (not e!712678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105260 (= res!836315 (validMask!0 mask!1466))))

(assert (=> start!105260 e!712678))

(assert (=> start!105260 true))

(assert (=> start!105260 tp!94373))

(assert (=> start!105260 tp_is_empty!31857))

(declare-fun array_inv!29921 (array!81372) Bool)

(assert (=> start!105260 (array_inv!29921 _keys!1118)))

(declare-fun array_inv!29922 (array!81370) Bool)

(assert (=> start!105260 (and (array_inv!29922 _values!914) e!712681)))

(assert (= (and start!105260 res!836315) b!1254275))

(assert (= (and b!1254275 res!836313) b!1254276))

(assert (= (and b!1254276 res!836316) b!1254271))

(assert (= (and b!1254271 res!836314) b!1254274))

(assert (= (and b!1254274 (not res!836312)) b!1254272))

(assert (= (and b!1254270 condMapEmpty!49564) mapIsEmpty!49564))

(assert (= (and b!1254270 (not condMapEmpty!49564)) mapNonEmpty!49564))

(get-info :version)

(assert (= (and mapNonEmpty!49564 ((_ is ValueCellFull!15165) mapValue!49564)) b!1254269))

(assert (= (and b!1254270 ((_ is ValueCellFull!15165) mapDefault!49564)) b!1254273))

(assert (= start!105260 b!1254270))

(declare-fun m!1154959 () Bool)

(assert (=> b!1254271 m!1154959))

(declare-fun m!1154961 () Bool)

(assert (=> start!105260 m!1154961))

(declare-fun m!1154963 () Bool)

(assert (=> start!105260 m!1154963))

(declare-fun m!1154965 () Bool)

(assert (=> start!105260 m!1154965))

(declare-fun m!1154967 () Bool)

(assert (=> b!1254274 m!1154967))

(declare-fun m!1154969 () Bool)

(assert (=> b!1254274 m!1154969))

(declare-fun m!1154971 () Bool)

(assert (=> b!1254274 m!1154971))

(declare-fun m!1154973 () Bool)

(assert (=> b!1254276 m!1154973))

(declare-fun m!1154975 () Bool)

(assert (=> b!1254272 m!1154975))

(declare-fun m!1154977 () Bool)

(assert (=> b!1254272 m!1154977))

(declare-fun m!1154979 () Bool)

(assert (=> b!1254272 m!1154979))

(declare-fun m!1154981 () Bool)

(assert (=> b!1254272 m!1154981))

(declare-fun m!1154983 () Bool)

(assert (=> b!1254272 m!1154983))

(declare-fun m!1154985 () Bool)

(assert (=> b!1254272 m!1154985))

(declare-fun m!1154987 () Bool)

(assert (=> mapNonEmpty!49564 m!1154987))

(check-sat (not b!1254274) (not mapNonEmpty!49564) (not b!1254271) (not b!1254272) b_and!44781 (not start!105260) (not b_next!26955) tp_is_empty!31857 (not b!1254276))
(check-sat b_and!44781 (not b_next!26955))
