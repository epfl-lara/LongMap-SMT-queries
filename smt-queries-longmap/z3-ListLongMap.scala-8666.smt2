; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105354 () Bool)

(assert start!105354)

(declare-fun b_free!27031 () Bool)

(declare-fun b_next!27031 () Bool)

(assert (=> start!105354 (= b_free!27031 (not b_next!27031))))

(declare-fun tp!94603 () Bool)

(declare-fun b_and!44851 () Bool)

(assert (=> start!105354 (= tp!94603 b_and!44851)))

(declare-fun b!1255227 () Bool)

(declare-fun res!836871 () Bool)

(declare-fun e!713383 () Bool)

(assert (=> b!1255227 (=> (not res!836871) (not e!713383))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81441 0))(
  ( (array!81442 (arr!39281 (Array (_ BitVec 32) (_ BitVec 64))) (size!39819 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81441)

(declare-datatypes ((V!47943 0))(
  ( (V!47944 (val!16029 Int)) )
))
(declare-datatypes ((ValueCell!15203 0))(
  ( (ValueCellFull!15203 (v!18728 V!47943)) (EmptyCell!15203) )
))
(declare-datatypes ((array!81443 0))(
  ( (array!81444 (arr!39282 (Array (_ BitVec 32) ValueCell!15203)) (size!39820 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81443)

(assert (=> b!1255227 (= res!836871 (and (= (size!39820 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39819 _keys!1118) (size!39820 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255228 () Bool)

(declare-fun e!713381 () Bool)

(declare-fun tp_is_empty!31933 () Bool)

(assert (=> b!1255228 (= e!713381 tp_is_empty!31933)))

(declare-fun mapIsEmpty!49681 () Bool)

(declare-fun mapRes!49681 () Bool)

(assert (=> mapIsEmpty!49681 mapRes!49681))

(declare-fun b!1255229 () Bool)

(assert (=> b!1255229 (= e!713383 (not true))))

(declare-datatypes ((tuple2!20778 0))(
  ( (tuple2!20779 (_1!10400 (_ BitVec 64)) (_2!10400 V!47943)) )
))
(declare-datatypes ((List!27989 0))(
  ( (Nil!27986) (Cons!27985 (h!29194 tuple2!20778) (t!41465 List!27989)) )
))
(declare-datatypes ((ListLongMap!18651 0))(
  ( (ListLongMap!18652 (toList!9341 List!27989)) )
))
(declare-fun lt!567345 () ListLongMap!18651)

(declare-fun lt!567346 () ListLongMap!18651)

(assert (=> b!1255229 (= lt!567345 lt!567346)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47943)

(declare-datatypes ((Unit!41649 0))(
  ( (Unit!41650) )
))
(declare-fun lt!567344 () Unit!41649)

(declare-fun zeroValue!871 () V!47943)

(declare-fun minValueBefore!43 () V!47943)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1058 (array!81441 array!81443 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47943 V!47943 V!47943 V!47943 (_ BitVec 32) Int) Unit!41649)

(assert (=> b!1255229 (= lt!567344 (lemmaNoChangeToArrayThenSameMapNoExtras!1058 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5736 (array!81441 array!81443 (_ BitVec 32) (_ BitVec 32) V!47943 V!47943 (_ BitVec 32) Int) ListLongMap!18651)

(assert (=> b!1255229 (= lt!567346 (getCurrentListMapNoExtraKeys!5736 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255229 (= lt!567345 (getCurrentListMapNoExtraKeys!5736 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!836868 () Bool)

(assert (=> start!105354 (=> (not res!836868) (not e!713383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105354 (= res!836868 (validMask!0 mask!1466))))

(assert (=> start!105354 e!713383))

(assert (=> start!105354 true))

(assert (=> start!105354 tp!94603))

(assert (=> start!105354 tp_is_empty!31933))

(declare-fun array_inv!30071 (array!81441) Bool)

(assert (=> start!105354 (array_inv!30071 _keys!1118)))

(declare-fun e!713379 () Bool)

(declare-fun array_inv!30072 (array!81443) Bool)

(assert (=> start!105354 (and (array_inv!30072 _values!914) e!713379)))

(declare-fun b!1255230 () Bool)

(declare-fun res!836870 () Bool)

(assert (=> b!1255230 (=> (not res!836870) (not e!713383))))

(declare-datatypes ((List!27990 0))(
  ( (Nil!27987) (Cons!27986 (h!29195 (_ BitVec 64)) (t!41466 List!27990)) )
))
(declare-fun arrayNoDuplicates!0 (array!81441 (_ BitVec 32) List!27990) Bool)

(assert (=> b!1255230 (= res!836870 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27987))))

(declare-fun mapNonEmpty!49681 () Bool)

(declare-fun tp!94604 () Bool)

(assert (=> mapNonEmpty!49681 (= mapRes!49681 (and tp!94604 e!713381))))

(declare-fun mapValue!49681 () ValueCell!15203)

(declare-fun mapKey!49681 () (_ BitVec 32))

(declare-fun mapRest!49681 () (Array (_ BitVec 32) ValueCell!15203))

(assert (=> mapNonEmpty!49681 (= (arr!39282 _values!914) (store mapRest!49681 mapKey!49681 mapValue!49681))))

(declare-fun b!1255231 () Bool)

(declare-fun res!836869 () Bool)

(assert (=> b!1255231 (=> (not res!836869) (not e!713383))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81441 (_ BitVec 32)) Bool)

(assert (=> b!1255231 (= res!836869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255232 () Bool)

(declare-fun e!713380 () Bool)

(assert (=> b!1255232 (= e!713380 tp_is_empty!31933)))

(declare-fun b!1255233 () Bool)

(assert (=> b!1255233 (= e!713379 (and e!713380 mapRes!49681))))

(declare-fun condMapEmpty!49681 () Bool)

(declare-fun mapDefault!49681 () ValueCell!15203)

(assert (=> b!1255233 (= condMapEmpty!49681 (= (arr!39282 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15203)) mapDefault!49681)))))

(assert (= (and start!105354 res!836868) b!1255227))

(assert (= (and b!1255227 res!836871) b!1255231))

(assert (= (and b!1255231 res!836869) b!1255230))

(assert (= (and b!1255230 res!836870) b!1255229))

(assert (= (and b!1255233 condMapEmpty!49681) mapIsEmpty!49681))

(assert (= (and b!1255233 (not condMapEmpty!49681)) mapNonEmpty!49681))

(get-info :version)

(assert (= (and mapNonEmpty!49681 ((_ is ValueCellFull!15203) mapValue!49681)) b!1255228))

(assert (= (and b!1255233 ((_ is ValueCellFull!15203) mapDefault!49681)) b!1255232))

(assert (= start!105354 b!1255233))

(declare-fun m!1155547 () Bool)

(assert (=> mapNonEmpty!49681 m!1155547))

(declare-fun m!1155549 () Bool)

(assert (=> b!1255231 m!1155549))

(declare-fun m!1155551 () Bool)

(assert (=> b!1255229 m!1155551))

(declare-fun m!1155553 () Bool)

(assert (=> b!1255229 m!1155553))

(declare-fun m!1155555 () Bool)

(assert (=> b!1255229 m!1155555))

(declare-fun m!1155557 () Bool)

(assert (=> start!105354 m!1155557))

(declare-fun m!1155559 () Bool)

(assert (=> start!105354 m!1155559))

(declare-fun m!1155561 () Bool)

(assert (=> start!105354 m!1155561))

(declare-fun m!1155563 () Bool)

(assert (=> b!1255230 m!1155563))

(check-sat b_and!44851 (not b!1255229) (not mapNonEmpty!49681) tp_is_empty!31933 (not b!1255230) (not start!105354) (not b_next!27031) (not b!1255231))
(check-sat b_and!44851 (not b_next!27031))
