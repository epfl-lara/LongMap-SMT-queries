; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105216 () Bool)

(assert start!105216)

(declare-fun b_free!26933 () Bool)

(declare-fun b_next!26933 () Bool)

(assert (=> start!105216 (= b_free!26933 (not b_next!26933))))

(declare-fun tp!94303 () Bool)

(declare-fun b_and!44747 () Bool)

(assert (=> start!105216 (= tp!94303 b_and!44747)))

(declare-fun b!1253821 () Bool)

(declare-fun e!712360 () Bool)

(assert (=> b!1253821 (= e!712360 true)))

(declare-datatypes ((V!47811 0))(
  ( (V!47812 (val!15980 Int)) )
))
(declare-datatypes ((tuple2!20626 0))(
  ( (tuple2!20627 (_1!10324 (_ BitVec 64)) (_2!10324 V!47811)) )
))
(declare-datatypes ((List!27854 0))(
  ( (Nil!27851) (Cons!27850 (h!29059 tuple2!20626) (t!41335 List!27854)) )
))
(declare-datatypes ((ListLongMap!18499 0))(
  ( (ListLongMap!18500 (toList!9265 List!27854)) )
))
(declare-fun lt!566358 () ListLongMap!18499)

(declare-fun lt!566356 () ListLongMap!18499)

(declare-fun -!2038 (ListLongMap!18499 (_ BitVec 64)) ListLongMap!18499)

(assert (=> b!1253821 (= lt!566358 (-!2038 lt!566356 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566357 () ListLongMap!18499)

(declare-fun lt!566353 () ListLongMap!18499)

(assert (=> b!1253821 (= (-!2038 lt!566357 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566353)))

(declare-datatypes ((Unit!41712 0))(
  ( (Unit!41713) )
))
(declare-fun lt!566352 () Unit!41712)

(declare-fun minValueBefore!43 () V!47811)

(declare-fun addThenRemoveForNewKeyIsSame!308 (ListLongMap!18499 (_ BitVec 64) V!47811) Unit!41712)

(assert (=> b!1253821 (= lt!566352 (addThenRemoveForNewKeyIsSame!308 lt!566353 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566351 () ListLongMap!18499)

(declare-fun lt!566354 () ListLongMap!18499)

(assert (=> b!1253821 (and (= lt!566356 lt!566357) (= lt!566354 lt!566351))))

(declare-fun +!4161 (ListLongMap!18499 tuple2!20626) ListLongMap!18499)

(assert (=> b!1253821 (= lt!566357 (+!4161 lt!566353 (tuple2!20627 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47811)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47811)

(declare-datatypes ((ValueCell!15154 0))(
  ( (ValueCellFull!15154 (v!18678 V!47811)) (EmptyCell!15154) )
))
(declare-datatypes ((array!81326 0))(
  ( (array!81327 (arr!39225 (Array (_ BitVec 32) ValueCell!15154)) (size!39761 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81326)

(declare-datatypes ((array!81328 0))(
  ( (array!81329 (arr!39226 (Array (_ BitVec 32) (_ BitVec 64))) (size!39762 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81328)

(declare-fun getCurrentListMap!4509 (array!81328 array!81326 (_ BitVec 32) (_ BitVec 32) V!47811 V!47811 (_ BitVec 32) Int) ListLongMap!18499)

(assert (=> b!1253821 (= lt!566354 (getCurrentListMap!4509 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253821 (= lt!566356 (getCurrentListMap!4509 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253822 () Bool)

(declare-fun res!836065 () Bool)

(declare-fun e!712363 () Bool)

(assert (=> b!1253822 (=> (not res!836065) (not e!712363))))

(assert (=> b!1253822 (= res!836065 (and (= (size!39761 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39762 _keys!1118) (size!39761 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49528 () Bool)

(declare-fun mapRes!49528 () Bool)

(assert (=> mapIsEmpty!49528 mapRes!49528))

(declare-fun res!836069 () Bool)

(assert (=> start!105216 (=> (not res!836069) (not e!712363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105216 (= res!836069 (validMask!0 mask!1466))))

(assert (=> start!105216 e!712363))

(assert (=> start!105216 true))

(assert (=> start!105216 tp!94303))

(declare-fun tp_is_empty!31835 () Bool)

(assert (=> start!105216 tp_is_empty!31835))

(declare-fun array_inv!29903 (array!81328) Bool)

(assert (=> start!105216 (array_inv!29903 _keys!1118)))

(declare-fun e!712361 () Bool)

(declare-fun array_inv!29904 (array!81326) Bool)

(assert (=> start!105216 (and (array_inv!29904 _values!914) e!712361)))

(declare-fun b!1253823 () Bool)

(declare-fun e!712364 () Bool)

(assert (=> b!1253823 (= e!712361 (and e!712364 mapRes!49528))))

(declare-fun condMapEmpty!49528 () Bool)

(declare-fun mapDefault!49528 () ValueCell!15154)

