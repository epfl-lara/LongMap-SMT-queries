; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105336 () Bool)

(assert start!105336)

(declare-fun b_free!27013 () Bool)

(declare-fun b_next!27013 () Bool)

(assert (=> start!105336 (= b_free!27013 (not b_next!27013))))

(declare-fun tp!94549 () Bool)

(declare-fun b_and!44833 () Bool)

(assert (=> start!105336 (= tp!94549 b_and!44833)))

(declare-fun mapNonEmpty!49654 () Bool)

(declare-fun mapRes!49654 () Bool)

(declare-fun tp!94550 () Bool)

(declare-fun e!713247 () Bool)

(assert (=> mapNonEmpty!49654 (= mapRes!49654 (and tp!94550 e!713247))))

(declare-datatypes ((V!47919 0))(
  ( (V!47920 (val!16020 Int)) )
))
(declare-datatypes ((ValueCell!15194 0))(
  ( (ValueCellFull!15194 (v!18719 V!47919)) (EmptyCell!15194) )
))
(declare-fun mapValue!49654 () ValueCell!15194)

(declare-datatypes ((array!81407 0))(
  ( (array!81408 (arr!39264 (Array (_ BitVec 32) ValueCell!15194)) (size!39802 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81407)

(declare-fun mapRest!49654 () (Array (_ BitVec 32) ValueCell!15194))

(declare-fun mapKey!49654 () (_ BitVec 32))

(assert (=> mapNonEmpty!49654 (= (arr!39264 _values!914) (store mapRest!49654 mapKey!49654 mapValue!49654))))

(declare-fun b!1255038 () Bool)

(declare-fun res!836763 () Bool)

(declare-fun e!713246 () Bool)

(assert (=> b!1255038 (=> (not res!836763) (not e!713246))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81409 0))(
  ( (array!81410 (arr!39265 (Array (_ BitVec 32) (_ BitVec 64))) (size!39803 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81409)

(assert (=> b!1255038 (= res!836763 (and (= (size!39802 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39803 _keys!1118) (size!39802 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255039 () Bool)

(declare-fun tp_is_empty!31915 () Bool)

(assert (=> b!1255039 (= e!713247 tp_is_empty!31915)))

(declare-fun b!1255040 () Bool)

(assert (=> b!1255040 (= e!713246 (not true))))

(declare-datatypes ((tuple2!20766 0))(
  ( (tuple2!20767 (_1!10394 (_ BitVec 64)) (_2!10394 V!47919)) )
))
(declare-datatypes ((List!27976 0))(
  ( (Nil!27973) (Cons!27972 (h!29181 tuple2!20766) (t!41452 List!27976)) )
))
(declare-datatypes ((ListLongMap!18639 0))(
  ( (ListLongMap!18640 (toList!9335 List!27976)) )
))
(declare-fun lt!567263 () ListLongMap!18639)

(declare-fun lt!567265 () ListLongMap!18639)

(assert (=> b!1255040 (= lt!567263 lt!567265)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47919)

(declare-fun minValueBefore!43 () V!47919)

(declare-fun zeroValue!871 () V!47919)

(declare-datatypes ((Unit!41637 0))(
  ( (Unit!41638) )
))
(declare-fun lt!567264 () Unit!41637)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1052 (array!81409 array!81407 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47919 V!47919 V!47919 V!47919 (_ BitVec 32) Int) Unit!41637)

(assert (=> b!1255040 (= lt!567264 (lemmaNoChangeToArrayThenSameMapNoExtras!1052 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5730 (array!81409 array!81407 (_ BitVec 32) (_ BitVec 32) V!47919 V!47919 (_ BitVec 32) Int) ListLongMap!18639)

(assert (=> b!1255040 (= lt!567265 (getCurrentListMapNoExtraKeys!5730 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255040 (= lt!567263 (getCurrentListMapNoExtraKeys!5730 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!836761 () Bool)

(assert (=> start!105336 (=> (not res!836761) (not e!713246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105336 (= res!836761 (validMask!0 mask!1466))))

(assert (=> start!105336 e!713246))

(assert (=> start!105336 true))

(assert (=> start!105336 tp!94549))

(assert (=> start!105336 tp_is_empty!31915))

(declare-fun array_inv!30057 (array!81409) Bool)

(assert (=> start!105336 (array_inv!30057 _keys!1118)))

(declare-fun e!713245 () Bool)

(declare-fun array_inv!30058 (array!81407) Bool)

(assert (=> start!105336 (and (array_inv!30058 _values!914) e!713245)))

(declare-fun b!1255041 () Bool)

(declare-fun res!836760 () Bool)

(assert (=> b!1255041 (=> (not res!836760) (not e!713246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81409 (_ BitVec 32)) Bool)

(assert (=> b!1255041 (= res!836760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49654 () Bool)

(assert (=> mapIsEmpty!49654 mapRes!49654))

(declare-fun b!1255042 () Bool)

(declare-fun e!713248 () Bool)

(assert (=> b!1255042 (= e!713245 (and e!713248 mapRes!49654))))

(declare-fun condMapEmpty!49654 () Bool)

(declare-fun mapDefault!49654 () ValueCell!15194)

(assert (=> b!1255042 (= condMapEmpty!49654 (= (arr!39264 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15194)) mapDefault!49654)))))

(declare-fun b!1255043 () Bool)

(declare-fun res!836762 () Bool)

(assert (=> b!1255043 (=> (not res!836762) (not e!713246))))

(declare-datatypes ((List!27977 0))(
  ( (Nil!27974) (Cons!27973 (h!29182 (_ BitVec 64)) (t!41453 List!27977)) )
))
(declare-fun arrayNoDuplicates!0 (array!81409 (_ BitVec 32) List!27977) Bool)

(assert (=> b!1255043 (= res!836762 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27974))))

(declare-fun b!1255044 () Bool)

(assert (=> b!1255044 (= e!713248 tp_is_empty!31915)))

(assert (= (and start!105336 res!836761) b!1255038))

(assert (= (and b!1255038 res!836763) b!1255041))

(assert (= (and b!1255041 res!836760) b!1255043))

(assert (= (and b!1255043 res!836762) b!1255040))

(assert (= (and b!1255042 condMapEmpty!49654) mapIsEmpty!49654))

(assert (= (and b!1255042 (not condMapEmpty!49654)) mapNonEmpty!49654))

(get-info :version)

(assert (= (and mapNonEmpty!49654 ((_ is ValueCellFull!15194) mapValue!49654)) b!1255039))

(assert (= (and b!1255042 ((_ is ValueCellFull!15194) mapDefault!49654)) b!1255044))

(assert (= start!105336 b!1255042))

(declare-fun m!1155385 () Bool)

(assert (=> b!1255040 m!1155385))

(declare-fun m!1155387 () Bool)

(assert (=> b!1255040 m!1155387))

(declare-fun m!1155389 () Bool)

(assert (=> b!1255040 m!1155389))

(declare-fun m!1155391 () Bool)

(assert (=> b!1255043 m!1155391))

(declare-fun m!1155393 () Bool)

(assert (=> b!1255041 m!1155393))

(declare-fun m!1155395 () Bool)

(assert (=> mapNonEmpty!49654 m!1155395))

(declare-fun m!1155397 () Bool)

(assert (=> start!105336 m!1155397))

(declare-fun m!1155399 () Bool)

(assert (=> start!105336 m!1155399))

(declare-fun m!1155401 () Bool)

(assert (=> start!105336 m!1155401))

(check-sat (not b!1255041) (not mapNonEmpty!49654) (not start!105336) b_and!44833 (not b!1255043) tp_is_empty!31915 (not b_next!27013) (not b!1255040))
(check-sat b_and!44833 (not b_next!27013))
