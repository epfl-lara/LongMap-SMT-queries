; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105264 () Bool)

(assert start!105264)

(declare-fun b_free!26959 () Bool)

(declare-fun b_next!26959 () Bool)

(assert (=> start!105264 (= b_free!26959 (not b_next!26959))))

(declare-fun tp!94385 () Bool)

(declare-fun b_and!44785 () Bool)

(assert (=> start!105264 (= tp!94385 b_and!44785)))

(declare-fun b!1254317 () Bool)

(declare-fun res!836344 () Bool)

(declare-fun e!712715 () Bool)

(assert (=> b!1254317 (=> (not res!836344) (not e!712715))))

(declare-datatypes ((array!81378 0))(
  ( (array!81379 (arr!39250 (Array (_ BitVec 32) (_ BitVec 64))) (size!39786 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81378)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81378 (_ BitVec 32)) Bool)

(assert (=> b!1254317 (= res!836344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254319 () Bool)

(declare-fun e!712714 () Bool)

(declare-fun tp_is_empty!31861 () Bool)

(assert (=> b!1254319 (= e!712714 tp_is_empty!31861)))

(declare-fun mapIsEmpty!49570 () Bool)

(declare-fun mapRes!49570 () Bool)

(assert (=> mapIsEmpty!49570 mapRes!49570))

(declare-fun b!1254320 () Bool)

(declare-fun e!712718 () Bool)

(assert (=> b!1254320 (= e!712718 true)))

(declare-datatypes ((V!47847 0))(
  ( (V!47848 (val!15993 Int)) )
))
(declare-datatypes ((tuple2!20648 0))(
  ( (tuple2!20649 (_1!10335 (_ BitVec 64)) (_2!10335 V!47847)) )
))
(declare-datatypes ((List!27874 0))(
  ( (Nil!27871) (Cons!27870 (h!29079 tuple2!20648) (t!41357 List!27874)) )
))
(declare-datatypes ((ListLongMap!18521 0))(
  ( (ListLongMap!18522 (toList!9276 List!27874)) )
))
(declare-fun lt!566805 () ListLongMap!18521)

(declare-fun lt!566802 () ListLongMap!18521)

(declare-fun -!2048 (ListLongMap!18521 (_ BitVec 64)) ListLongMap!18521)

(assert (=> b!1254320 (= lt!566805 (-!2048 lt!566802 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566808 () ListLongMap!18521)

(declare-fun lt!566807 () ListLongMap!18521)

(assert (=> b!1254320 (= (-!2048 lt!566808 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566807)))

(declare-datatypes ((Unit!41736 0))(
  ( (Unit!41737) )
))
(declare-fun lt!566806 () Unit!41736)

(declare-fun minValueBefore!43 () V!47847)

(declare-fun addThenRemoveForNewKeyIsSame!318 (ListLongMap!18521 (_ BitVec 64) V!47847) Unit!41736)

(assert (=> b!1254320 (= lt!566806 (addThenRemoveForNewKeyIsSame!318 lt!566807 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566801 () ListLongMap!18521)

(declare-fun lt!566803 () ListLongMap!18521)

(assert (=> b!1254320 (and (= lt!566802 lt!566808) (= lt!566803 lt!566801))))

(declare-fun +!4171 (ListLongMap!18521 tuple2!20648) ListLongMap!18521)

(assert (=> b!1254320 (= lt!566808 (+!4171 lt!566807 (tuple2!20649 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47847)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47847)

(declare-datatypes ((ValueCell!15167 0))(
  ( (ValueCellFull!15167 (v!18692 V!47847)) (EmptyCell!15167) )
))
(declare-datatypes ((array!81380 0))(
  ( (array!81381 (arr!39251 (Array (_ BitVec 32) ValueCell!15167)) (size!39787 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81380)

(declare-fun getCurrentListMap!4519 (array!81378 array!81380 (_ BitVec 32) (_ BitVec 32) V!47847 V!47847 (_ BitVec 32) Int) ListLongMap!18521)

(assert (=> b!1254320 (= lt!566803 (getCurrentListMap!4519 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254320 (= lt!566802 (getCurrentListMap!4519 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254321 () Bool)

(assert (=> b!1254321 (= e!712715 (not e!712718))))

(declare-fun res!836345 () Bool)

(assert (=> b!1254321 (=> res!836345 e!712718)))

(assert (=> b!1254321 (= res!836345 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254321 (= lt!566807 lt!566801)))

(declare-fun lt!566804 () Unit!41736)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1027 (array!81378 array!81380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47847 V!47847 V!47847 V!47847 (_ BitVec 32) Int) Unit!41736)

(assert (=> b!1254321 (= lt!566804 (lemmaNoChangeToArrayThenSameMapNoExtras!1027 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5663 (array!81378 array!81380 (_ BitVec 32) (_ BitVec 32) V!47847 V!47847 (_ BitVec 32) Int) ListLongMap!18521)

(assert (=> b!1254321 (= lt!566801 (getCurrentListMapNoExtraKeys!5663 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254321 (= lt!566807 (getCurrentListMapNoExtraKeys!5663 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254322 () Bool)

(declare-fun e!712717 () Bool)

(assert (=> b!1254322 (= e!712717 tp_is_empty!31861)))

(declare-fun b!1254323 () Bool)

(declare-fun e!712716 () Bool)

(assert (=> b!1254323 (= e!712716 (and e!712714 mapRes!49570))))

(declare-fun condMapEmpty!49570 () Bool)

(declare-fun mapDefault!49570 () ValueCell!15167)

