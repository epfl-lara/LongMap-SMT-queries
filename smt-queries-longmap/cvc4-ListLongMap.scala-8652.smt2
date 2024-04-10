; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105256 () Bool)

(assert start!105256)

(declare-fun b_free!26951 () Bool)

(declare-fun b_next!26951 () Bool)

(assert (=> start!105256 (= b_free!26951 (not b_next!26951))))

(declare-fun tp!94360 () Bool)

(declare-fun b_and!44777 () Bool)

(assert (=> start!105256 (= tp!94360 b_and!44777)))

(declare-fun b!1254221 () Bool)

(declare-fun e!712643 () Bool)

(declare-fun tp_is_empty!31853 () Bool)

(assert (=> b!1254221 (= e!712643 tp_is_empty!31853)))

(declare-fun mapIsEmpty!49558 () Bool)

(declare-fun mapRes!49558 () Bool)

(assert (=> mapIsEmpty!49558 mapRes!49558))

(declare-fun res!836286 () Bool)

(declare-fun e!712645 () Bool)

(assert (=> start!105256 (=> (not res!836286) (not e!712645))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105256 (= res!836286 (validMask!0 mask!1466))))

(assert (=> start!105256 e!712645))

(assert (=> start!105256 true))

(assert (=> start!105256 tp!94360))

(assert (=> start!105256 tp_is_empty!31853))

(declare-datatypes ((array!81364 0))(
  ( (array!81365 (arr!39243 (Array (_ BitVec 32) (_ BitVec 64))) (size!39779 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81364)

(declare-fun array_inv!29919 (array!81364) Bool)

(assert (=> start!105256 (array_inv!29919 _keys!1118)))

(declare-datatypes ((V!47835 0))(
  ( (V!47836 (val!15989 Int)) )
))
(declare-datatypes ((ValueCell!15163 0))(
  ( (ValueCellFull!15163 (v!18688 V!47835)) (EmptyCell!15163) )
))
(declare-datatypes ((array!81366 0))(
  ( (array!81367 (arr!39244 (Array (_ BitVec 32) ValueCell!15163)) (size!39780 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81366)

(declare-fun e!712644 () Bool)

(declare-fun array_inv!29920 (array!81366) Bool)

(assert (=> start!105256 (and (array_inv!29920 _values!914) e!712644)))

(declare-fun b!1254222 () Bool)

(declare-fun e!712642 () Bool)

(assert (=> b!1254222 (= e!712642 true)))

(declare-datatypes ((tuple2!20642 0))(
  ( (tuple2!20643 (_1!10332 (_ BitVec 64)) (_2!10332 V!47835)) )
))
(declare-datatypes ((List!27869 0))(
  ( (Nil!27866) (Cons!27865 (h!29074 tuple2!20642) (t!41352 List!27869)) )
))
(declare-datatypes ((ListLongMap!18515 0))(
  ( (ListLongMap!18516 (toList!9273 List!27869)) )
))
(declare-fun lt!566712 () ListLongMap!18515)

(declare-fun lt!566710 () ListLongMap!18515)

(declare-fun -!2046 (ListLongMap!18515 (_ BitVec 64)) ListLongMap!18515)

(assert (=> b!1254222 (= lt!566712 (-!2046 lt!566710 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566705 () ListLongMap!18515)

(declare-fun lt!566707 () ListLongMap!18515)

(assert (=> b!1254222 (= (-!2046 lt!566705 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566707)))

(declare-datatypes ((Unit!41730 0))(
  ( (Unit!41731) )
))
(declare-fun lt!566709 () Unit!41730)

(declare-fun minValueBefore!43 () V!47835)

(declare-fun addThenRemoveForNewKeyIsSame!316 (ListLongMap!18515 (_ BitVec 64) V!47835) Unit!41730)

(assert (=> b!1254222 (= lt!566709 (addThenRemoveForNewKeyIsSame!316 lt!566707 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566711 () ListLongMap!18515)

(declare-fun lt!566706 () ListLongMap!18515)

(assert (=> b!1254222 (and (= lt!566710 lt!566705) (= lt!566706 lt!566711))))

(declare-fun +!4169 (ListLongMap!18515 tuple2!20642) ListLongMap!18515)

(assert (=> b!1254222 (= lt!566705 (+!4169 lt!566707 (tuple2!20643 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47835)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47835)

(declare-fun getCurrentListMap!4517 (array!81364 array!81366 (_ BitVec 32) (_ BitVec 32) V!47835 V!47835 (_ BitVec 32) Int) ListLongMap!18515)

(assert (=> b!1254222 (= lt!566706 (getCurrentListMap!4517 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254222 (= lt!566710 (getCurrentListMap!4517 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254223 () Bool)

(declare-fun res!836284 () Bool)

(assert (=> b!1254223 (=> (not res!836284) (not e!712645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81364 (_ BitVec 32)) Bool)

(assert (=> b!1254223 (= res!836284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254224 () Bool)

(declare-fun e!712641 () Bool)

(assert (=> b!1254224 (= e!712641 tp_is_empty!31853)))

(declare-fun b!1254225 () Bool)

(assert (=> b!1254225 (= e!712644 (and e!712643 mapRes!49558))))

(declare-fun condMapEmpty!49558 () Bool)

(declare-fun mapDefault!49558 () ValueCell!15163)

