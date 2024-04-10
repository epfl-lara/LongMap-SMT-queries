; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105274 () Bool)

(assert start!105274)

(declare-fun b_free!26969 () Bool)

(declare-fun b_next!26969 () Bool)

(assert (=> start!105274 (= b_free!26969 (not b_next!26969))))

(declare-fun tp!94414 () Bool)

(declare-fun b_and!44795 () Bool)

(assert (=> start!105274 (= tp!94414 b_and!44795)))

(declare-fun b!1254437 () Bool)

(declare-fun res!836421 () Bool)

(declare-fun e!712807 () Bool)

(assert (=> b!1254437 (=> (not res!836421) (not e!712807))))

(declare-datatypes ((array!81396 0))(
  ( (array!81397 (arr!39259 (Array (_ BitVec 32) (_ BitVec 64))) (size!39795 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81396)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81396 (_ BitVec 32)) Bool)

(assert (=> b!1254437 (= res!836421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254438 () Bool)

(declare-fun res!836419 () Bool)

(assert (=> b!1254438 (=> (not res!836419) (not e!712807))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47859 0))(
  ( (V!47860 (val!15998 Int)) )
))
(declare-datatypes ((ValueCell!15172 0))(
  ( (ValueCellFull!15172 (v!18697 V!47859)) (EmptyCell!15172) )
))
(declare-datatypes ((array!81398 0))(
  ( (array!81399 (arr!39260 (Array (_ BitVec 32) ValueCell!15172)) (size!39796 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81398)

(assert (=> b!1254438 (= res!836419 (and (= (size!39796 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39795 _keys!1118) (size!39796 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254439 () Bool)

(declare-fun e!712805 () Bool)

(declare-fun tp_is_empty!31871 () Bool)

(assert (=> b!1254439 (= e!712805 tp_is_empty!31871)))

(declare-fun b!1254440 () Bool)

(declare-fun res!836420 () Bool)

(assert (=> b!1254440 (=> (not res!836420) (not e!712807))))

(declare-datatypes ((List!27881 0))(
  ( (Nil!27878) (Cons!27877 (h!29086 (_ BitVec 64)) (t!41364 List!27881)) )
))
(declare-fun arrayNoDuplicates!0 (array!81396 (_ BitVec 32) List!27881) Bool)

(assert (=> b!1254440 (= res!836420 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27878))))

(declare-fun b!1254442 () Bool)

(declare-fun e!712804 () Bool)

(assert (=> b!1254442 (= e!712804 true)))

(declare-datatypes ((tuple2!20656 0))(
  ( (tuple2!20657 (_1!10339 (_ BitVec 64)) (_2!10339 V!47859)) )
))
(declare-datatypes ((List!27882 0))(
  ( (Nil!27879) (Cons!27878 (h!29087 tuple2!20656) (t!41365 List!27882)) )
))
(declare-datatypes ((ListLongMap!18529 0))(
  ( (ListLongMap!18530 (toList!9280 List!27882)) )
))
(declare-fun lt!566925 () ListLongMap!18529)

(declare-fun lt!566926 () ListLongMap!18529)

(declare-fun -!2052 (ListLongMap!18529 (_ BitVec 64)) ListLongMap!18529)

(assert (=> b!1254442 (= lt!566925 (-!2052 lt!566926 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566922 () ListLongMap!18529)

(declare-fun lt!566928 () ListLongMap!18529)

(assert (=> b!1254442 (= (-!2052 lt!566922 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566928)))

(declare-datatypes ((Unit!41744 0))(
  ( (Unit!41745) )
))
(declare-fun lt!566927 () Unit!41744)

(declare-fun minValueBefore!43 () V!47859)

(declare-fun addThenRemoveForNewKeyIsSame!322 (ListLongMap!18529 (_ BitVec 64) V!47859) Unit!41744)

(assert (=> b!1254442 (= lt!566927 (addThenRemoveForNewKeyIsSame!322 lt!566928 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566921 () ListLongMap!18529)

(declare-fun lt!566923 () ListLongMap!18529)

(assert (=> b!1254442 (and (= lt!566926 lt!566922) (= lt!566923 lt!566921))))

(declare-fun +!4175 (ListLongMap!18529 tuple2!20656) ListLongMap!18529)

(assert (=> b!1254442 (= lt!566922 (+!4175 lt!566928 (tuple2!20657 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47859)

(declare-fun zeroValue!871 () V!47859)

(declare-fun getCurrentListMap!4523 (array!81396 array!81398 (_ BitVec 32) (_ BitVec 32) V!47859 V!47859 (_ BitVec 32) Int) ListLongMap!18529)

(assert (=> b!1254442 (= lt!566923 (getCurrentListMap!4523 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254442 (= lt!566926 (getCurrentListMap!4523 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254443 () Bool)

(assert (=> b!1254443 (= e!712807 (not e!712804))))

(declare-fun res!836417 () Bool)

(assert (=> b!1254443 (=> res!836417 e!712804)))

(assert (=> b!1254443 (= res!836417 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254443 (= lt!566928 lt!566921)))

(declare-fun lt!566924 () Unit!41744)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1031 (array!81396 array!81398 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47859 V!47859 V!47859 V!47859 (_ BitVec 32) Int) Unit!41744)

(assert (=> b!1254443 (= lt!566924 (lemmaNoChangeToArrayThenSameMapNoExtras!1031 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5667 (array!81396 array!81398 (_ BitVec 32) (_ BitVec 32) V!47859 V!47859 (_ BitVec 32) Int) ListLongMap!18529)

(assert (=> b!1254443 (= lt!566921 (getCurrentListMapNoExtraKeys!5667 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254443 (= lt!566928 (getCurrentListMapNoExtraKeys!5667 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254444 () Bool)

(declare-fun e!712808 () Bool)

(declare-fun mapRes!49585 () Bool)

(assert (=> b!1254444 (= e!712808 (and e!712805 mapRes!49585))))

(declare-fun condMapEmpty!49585 () Bool)

(declare-fun mapDefault!49585 () ValueCell!15172)

