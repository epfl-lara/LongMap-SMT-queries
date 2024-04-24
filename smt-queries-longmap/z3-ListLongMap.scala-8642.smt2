; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105394 () Bool)

(assert start!105394)

(declare-fun b_free!26887 () Bool)

(declare-fun b_next!26887 () Bool)

(assert (=> start!105394 (= b_free!26887 (not b_next!26887))))

(declare-fun tp!94165 () Bool)

(declare-fun b_and!44703 () Bool)

(assert (=> start!105394 (= tp!94165 b_and!44703)))

(declare-fun b!1254574 () Bool)

(declare-fun e!712793 () Bool)

(declare-fun e!712796 () Bool)

(assert (=> b!1254574 (= e!712793 (not e!712796))))

(declare-fun res!836242 () Bool)

(assert (=> b!1254574 (=> res!836242 e!712796)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254574 (= res!836242 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!47751 0))(
  ( (V!47752 (val!15957 Int)) )
))
(declare-datatypes ((tuple2!20608 0))(
  ( (tuple2!20609 (_1!10315 (_ BitVec 64)) (_2!10315 V!47751)) )
))
(declare-datatypes ((List!27845 0))(
  ( (Nil!27842) (Cons!27841 (h!29059 tuple2!20608) (t!41318 List!27845)) )
))
(declare-datatypes ((ListLongMap!18489 0))(
  ( (ListLongMap!18490 (toList!9260 List!27845)) )
))
(declare-fun lt!566287 () ListLongMap!18489)

(declare-fun lt!566288 () ListLongMap!18489)

(assert (=> b!1254574 (= lt!566287 lt!566288)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47751)

(declare-fun zeroValue!871 () V!47751)

(declare-datatypes ((array!81281 0))(
  ( (array!81282 (arr!39198 (Array (_ BitVec 32) (_ BitVec 64))) (size!39735 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81281)

(declare-datatypes ((ValueCell!15131 0))(
  ( (ValueCellFull!15131 (v!18651 V!47751)) (EmptyCell!15131) )
))
(declare-datatypes ((array!81283 0))(
  ( (array!81284 (arr!39199 (Array (_ BitVec 32) ValueCell!15131)) (size!39736 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81283)

(declare-fun minValueBefore!43 () V!47751)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((Unit!41657 0))(
  ( (Unit!41658) )
))
(declare-fun lt!566290 () Unit!41657)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1000 (array!81281 array!81283 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47751 V!47751 V!47751 V!47751 (_ BitVec 32) Int) Unit!41657)

(assert (=> b!1254574 (= lt!566290 (lemmaNoChangeToArrayThenSameMapNoExtras!1000 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5686 (array!81281 array!81283 (_ BitVec 32) (_ BitVec 32) V!47751 V!47751 (_ BitVec 32) Int) ListLongMap!18489)

(assert (=> b!1254574 (= lt!566288 (getCurrentListMapNoExtraKeys!5686 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254574 (= lt!566287 (getCurrentListMapNoExtraKeys!5686 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254575 () Bool)

(declare-fun res!836241 () Bool)

(assert (=> b!1254575 (=> (not res!836241) (not e!712793))))

(declare-datatypes ((List!27846 0))(
  ( (Nil!27843) (Cons!27842 (h!29060 (_ BitVec 64)) (t!41319 List!27846)) )
))
(declare-fun arrayNoDuplicates!0 (array!81281 (_ BitVec 32) List!27846) Bool)

(assert (=> b!1254575 (= res!836241 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27843))))

(declare-fun res!836244 () Bool)

(assert (=> start!105394 (=> (not res!836244) (not e!712793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105394 (= res!836244 (validMask!0 mask!1466))))

(assert (=> start!105394 e!712793))

(assert (=> start!105394 true))

(assert (=> start!105394 tp!94165))

(declare-fun tp_is_empty!31789 () Bool)

(assert (=> start!105394 tp_is_empty!31789))

(declare-fun array_inv!29999 (array!81281) Bool)

(assert (=> start!105394 (array_inv!29999 _keys!1118)))

(declare-fun e!712795 () Bool)

(declare-fun array_inv!30000 (array!81283) Bool)

(assert (=> start!105394 (and (array_inv!30000 _values!914) e!712795)))

(declare-fun b!1254576 () Bool)

(declare-fun e!712798 () Bool)

(assert (=> b!1254576 (= e!712798 tp_is_empty!31789)))

(declare-fun b!1254577 () Bool)

(assert (=> b!1254577 (= e!712796 true)))

(declare-fun lt!566289 () ListLongMap!18489)

(declare-fun lt!566284 () ListLongMap!18489)

(declare-fun -!2003 (ListLongMap!18489 (_ BitVec 64)) ListLongMap!18489)

(assert (=> b!1254577 (= lt!566289 (-!2003 lt!566284 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566286 () ListLongMap!18489)

(assert (=> b!1254577 (= (-!2003 lt!566286 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566287)))

(declare-fun lt!566283 () Unit!41657)

(declare-fun addThenRemoveForNewKeyIsSame!293 (ListLongMap!18489 (_ BitVec 64) V!47751) Unit!41657)

(assert (=> b!1254577 (= lt!566283 (addThenRemoveForNewKeyIsSame!293 lt!566287 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566285 () ListLongMap!18489)

(assert (=> b!1254577 (and (= lt!566284 lt!566286) (= lt!566285 lt!566288))))

(declare-fun +!4199 (ListLongMap!18489 tuple2!20608) ListLongMap!18489)

(assert (=> b!1254577 (= lt!566286 (+!4199 lt!566287 (tuple2!20609 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4496 (array!81281 array!81283 (_ BitVec 32) (_ BitVec 32) V!47751 V!47751 (_ BitVec 32) Int) ListLongMap!18489)

(assert (=> b!1254577 (= lt!566285 (getCurrentListMap!4496 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254577 (= lt!566284 (getCurrentListMap!4496 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49459 () Bool)

(declare-fun mapRes!49459 () Bool)

(declare-fun tp!94166 () Bool)

(declare-fun e!712794 () Bool)

(assert (=> mapNonEmpty!49459 (= mapRes!49459 (and tp!94166 e!712794))))

(declare-fun mapValue!49459 () ValueCell!15131)

(declare-fun mapKey!49459 () (_ BitVec 32))

(declare-fun mapRest!49459 () (Array (_ BitVec 32) ValueCell!15131))

(assert (=> mapNonEmpty!49459 (= (arr!39199 _values!914) (store mapRest!49459 mapKey!49459 mapValue!49459))))

(declare-fun mapIsEmpty!49459 () Bool)

(assert (=> mapIsEmpty!49459 mapRes!49459))

(declare-fun b!1254578 () Bool)

(assert (=> b!1254578 (= e!712794 tp_is_empty!31789)))

(declare-fun b!1254579 () Bool)

(assert (=> b!1254579 (= e!712795 (and e!712798 mapRes!49459))))

(declare-fun condMapEmpty!49459 () Bool)

(declare-fun mapDefault!49459 () ValueCell!15131)

(assert (=> b!1254579 (= condMapEmpty!49459 (= (arr!39199 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15131)) mapDefault!49459)))))

(declare-fun b!1254580 () Bool)

(declare-fun res!836243 () Bool)

(assert (=> b!1254580 (=> (not res!836243) (not e!712793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81281 (_ BitVec 32)) Bool)

(assert (=> b!1254580 (= res!836243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254581 () Bool)

(declare-fun res!836240 () Bool)

(assert (=> b!1254581 (=> (not res!836240) (not e!712793))))

(assert (=> b!1254581 (= res!836240 (and (= (size!39736 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39735 _keys!1118) (size!39736 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105394 res!836244) b!1254581))

(assert (= (and b!1254581 res!836240) b!1254580))

(assert (= (and b!1254580 res!836243) b!1254575))

(assert (= (and b!1254575 res!836241) b!1254574))

(assert (= (and b!1254574 (not res!836242)) b!1254577))

(assert (= (and b!1254579 condMapEmpty!49459) mapIsEmpty!49459))

(assert (= (and b!1254579 (not condMapEmpty!49459)) mapNonEmpty!49459))

(get-info :version)

(assert (= (and mapNonEmpty!49459 ((_ is ValueCellFull!15131) mapValue!49459)) b!1254578))

(assert (= (and b!1254579 ((_ is ValueCellFull!15131) mapDefault!49459)) b!1254576))

(assert (= start!105394 b!1254579))

(declare-fun m!1155367 () Bool)

(assert (=> start!105394 m!1155367))

(declare-fun m!1155369 () Bool)

(assert (=> start!105394 m!1155369))

(declare-fun m!1155371 () Bool)

(assert (=> start!105394 m!1155371))

(declare-fun m!1155373 () Bool)

(assert (=> b!1254580 m!1155373))

(declare-fun m!1155375 () Bool)

(assert (=> b!1254577 m!1155375))

(declare-fun m!1155377 () Bool)

(assert (=> b!1254577 m!1155377))

(declare-fun m!1155379 () Bool)

(assert (=> b!1254577 m!1155379))

(declare-fun m!1155381 () Bool)

(assert (=> b!1254577 m!1155381))

(declare-fun m!1155383 () Bool)

(assert (=> b!1254577 m!1155383))

(declare-fun m!1155385 () Bool)

(assert (=> b!1254577 m!1155385))

(declare-fun m!1155387 () Bool)

(assert (=> b!1254574 m!1155387))

(declare-fun m!1155389 () Bool)

(assert (=> b!1254574 m!1155389))

(declare-fun m!1155391 () Bool)

(assert (=> b!1254574 m!1155391))

(declare-fun m!1155393 () Bool)

(assert (=> mapNonEmpty!49459 m!1155393))

(declare-fun m!1155395 () Bool)

(assert (=> b!1254575 m!1155395))

(check-sat b_and!44703 (not b!1254577) (not b!1254575) (not start!105394) tp_is_empty!31789 (not b!1254574) (not b_next!26887) (not mapNonEmpty!49459) (not b!1254580))
(check-sat b_and!44703 (not b_next!26887))
