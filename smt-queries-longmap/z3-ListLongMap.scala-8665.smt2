; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105354 () Bool)

(assert start!105354)

(declare-fun b_free!27027 () Bool)

(declare-fun b_next!27027 () Bool)

(assert (=> start!105354 (= b_free!27027 (not b_next!27027))))

(declare-fun tp!94591 () Bool)

(declare-fun b_and!44865 () Bool)

(assert (=> start!105354 (= tp!94591 b_and!44865)))

(declare-fun b!1255267 () Bool)

(declare-fun res!836885 () Bool)

(declare-fun e!713397 () Bool)

(assert (=> b!1255267 (=> (not res!836885) (not e!713397))))

(declare-datatypes ((array!81504 0))(
  ( (array!81505 (arr!39312 (Array (_ BitVec 32) (_ BitVec 64))) (size!39848 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81504)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81504 (_ BitVec 32)) Bool)

(assert (=> b!1255267 (= res!836885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49675 () Bool)

(declare-fun mapRes!49675 () Bool)

(assert (=> mapIsEmpty!49675 mapRes!49675))

(declare-fun b!1255268 () Bool)

(declare-fun e!713394 () Bool)

(declare-fun tp_is_empty!31929 () Bool)

(assert (=> b!1255268 (= e!713394 tp_is_empty!31929)))

(declare-fun b!1255269 () Bool)

(declare-fun e!713396 () Bool)

(declare-fun e!713398 () Bool)

(assert (=> b!1255269 (= e!713396 (and e!713398 mapRes!49675))))

(declare-fun condMapEmpty!49675 () Bool)

(declare-datatypes ((V!47937 0))(
  ( (V!47938 (val!16027 Int)) )
))
(declare-datatypes ((ValueCell!15201 0))(
  ( (ValueCellFull!15201 (v!18727 V!47937)) (EmptyCell!15201) )
))
(declare-datatypes ((array!81506 0))(
  ( (array!81507 (arr!39313 (Array (_ BitVec 32) ValueCell!15201)) (size!39849 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81506)

(declare-fun mapDefault!49675 () ValueCell!15201)

(assert (=> b!1255269 (= condMapEmpty!49675 (= (arr!39313 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15201)) mapDefault!49675)))))

(declare-fun b!1255270 () Bool)

(declare-fun res!836887 () Bool)

(assert (=> b!1255270 (=> (not res!836887) (not e!713397))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1255270 (= res!836887 (and (= (size!39849 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39848 _keys!1118) (size!39849 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255272 () Bool)

(declare-fun res!836886 () Bool)

(assert (=> b!1255272 (=> (not res!836886) (not e!713397))))

(declare-datatypes ((List!27918 0))(
  ( (Nil!27915) (Cons!27914 (h!29123 (_ BitVec 64)) (t!41403 List!27918)) )
))
(declare-fun arrayNoDuplicates!0 (array!81504 (_ BitVec 32) List!27918) Bool)

(assert (=> b!1255272 (= res!836886 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27915))))

(declare-fun res!836884 () Bool)

(assert (=> start!105354 (=> (not res!836884) (not e!713397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105354 (= res!836884 (validMask!0 mask!1466))))

(assert (=> start!105354 e!713397))

(assert (=> start!105354 true))

(assert (=> start!105354 tp!94591))

(assert (=> start!105354 tp_is_empty!31929))

(declare-fun array_inv!29957 (array!81504) Bool)

(assert (=> start!105354 (array_inv!29957 _keys!1118)))

(declare-fun array_inv!29958 (array!81506) Bool)

(assert (=> start!105354 (and (array_inv!29958 _values!914) e!713396)))

(declare-fun b!1255271 () Bool)

(assert (=> b!1255271 (= e!713397 (not true))))

(declare-datatypes ((tuple2!20696 0))(
  ( (tuple2!20697 (_1!10359 (_ BitVec 64)) (_2!10359 V!47937)) )
))
(declare-datatypes ((List!27919 0))(
  ( (Nil!27916) (Cons!27915 (h!29124 tuple2!20696) (t!41404 List!27919)) )
))
(declare-datatypes ((ListLongMap!18569 0))(
  ( (ListLongMap!18570 (toList!9300 List!27919)) )
))
(declare-fun lt!567507 () ListLongMap!18569)

(declare-fun lt!567505 () ListLongMap!18569)

(assert (=> b!1255271 (= lt!567507 lt!567505)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47937)

(declare-fun zeroValue!871 () V!47937)

(declare-datatypes ((Unit!41786 0))(
  ( (Unit!41787) )
))
(declare-fun lt!567506 () Unit!41786)

(declare-fun minValueBefore!43 () V!47937)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1049 (array!81504 array!81506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47937 V!47937 V!47937 V!47937 (_ BitVec 32) Int) Unit!41786)

(assert (=> b!1255271 (= lt!567506 (lemmaNoChangeToArrayThenSameMapNoExtras!1049 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5685 (array!81504 array!81506 (_ BitVec 32) (_ BitVec 32) V!47937 V!47937 (_ BitVec 32) Int) ListLongMap!18569)

(assert (=> b!1255271 (= lt!567505 (getCurrentListMapNoExtraKeys!5685 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255271 (= lt!567507 (getCurrentListMapNoExtraKeys!5685 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49675 () Bool)

(declare-fun tp!94592 () Bool)

(assert (=> mapNonEmpty!49675 (= mapRes!49675 (and tp!94592 e!713394))))

(declare-fun mapValue!49675 () ValueCell!15201)

(declare-fun mapKey!49675 () (_ BitVec 32))

(declare-fun mapRest!49675 () (Array (_ BitVec 32) ValueCell!15201))

(assert (=> mapNonEmpty!49675 (= (arr!39313 _values!914) (store mapRest!49675 mapKey!49675 mapValue!49675))))

(declare-fun b!1255273 () Bool)

(assert (=> b!1255273 (= e!713398 tp_is_empty!31929)))

(assert (= (and start!105354 res!836884) b!1255270))

(assert (= (and b!1255270 res!836887) b!1255267))

(assert (= (and b!1255267 res!836885) b!1255272))

(assert (= (and b!1255272 res!836886) b!1255271))

(assert (= (and b!1255269 condMapEmpty!49675) mapIsEmpty!49675))

(assert (= (and b!1255269 (not condMapEmpty!49675)) mapNonEmpty!49675))

(get-info :version)

(assert (= (and mapNonEmpty!49675 ((_ is ValueCellFull!15201) mapValue!49675)) b!1255268))

(assert (= (and b!1255269 ((_ is ValueCellFull!15201) mapDefault!49675)) b!1255273))

(assert (= start!105354 b!1255269))

(declare-fun m!1156031 () Bool)

(assert (=> b!1255271 m!1156031))

(declare-fun m!1156033 () Bool)

(assert (=> b!1255271 m!1156033))

(declare-fun m!1156035 () Bool)

(assert (=> b!1255271 m!1156035))

(declare-fun m!1156037 () Bool)

(assert (=> b!1255272 m!1156037))

(declare-fun m!1156039 () Bool)

(assert (=> mapNonEmpty!49675 m!1156039))

(declare-fun m!1156041 () Bool)

(assert (=> b!1255267 m!1156041))

(declare-fun m!1156043 () Bool)

(assert (=> start!105354 m!1156043))

(declare-fun m!1156045 () Bool)

(assert (=> start!105354 m!1156045))

(declare-fun m!1156047 () Bool)

(assert (=> start!105354 m!1156047))

(check-sat (not mapNonEmpty!49675) tp_is_empty!31929 b_and!44865 (not b!1255267) (not b!1255272) (not b_next!27027) (not b!1255271) (not start!105354))
(check-sat b_and!44865 (not b_next!27027))
