; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105222 () Bool)

(assert start!105222)

(declare-fun b_free!26939 () Bool)

(declare-fun b_next!26939 () Bool)

(assert (=> start!105222 (= b_free!26939 (not b_next!26939))))

(declare-fun tp!94321 () Bool)

(declare-fun b_and!44753 () Bool)

(assert (=> start!105222 (= tp!94321 b_and!44753)))

(declare-fun b!1253901 () Bool)

(declare-fun res!836119 () Bool)

(declare-fun e!712423 () Bool)

(assert (=> b!1253901 (=> (not res!836119) (not e!712423))))

(declare-datatypes ((array!81338 0))(
  ( (array!81339 (arr!39231 (Array (_ BitVec 32) (_ BitVec 64))) (size!39767 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81338)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81338 (_ BitVec 32)) Bool)

(assert (=> b!1253901 (= res!836119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253902 () Bool)

(declare-fun res!836118 () Bool)

(assert (=> b!1253902 (=> (not res!836118) (not e!712423))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47819 0))(
  ( (V!47820 (val!15983 Int)) )
))
(declare-datatypes ((ValueCell!15157 0))(
  ( (ValueCellFull!15157 (v!18681 V!47819)) (EmptyCell!15157) )
))
(declare-datatypes ((array!81340 0))(
  ( (array!81341 (arr!39232 (Array (_ BitVec 32) ValueCell!15157)) (size!39768 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81340)

(assert (=> b!1253902 (= res!836118 (and (= (size!39768 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39767 _keys!1118) (size!39768 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253904 () Bool)

(declare-fun res!836121 () Bool)

(assert (=> b!1253904 (=> (not res!836121) (not e!712423))))

(declare-datatypes ((List!27859 0))(
  ( (Nil!27856) (Cons!27855 (h!29064 (_ BitVec 64)) (t!41340 List!27859)) )
))
(declare-fun arrayNoDuplicates!0 (array!81338 (_ BitVec 32) List!27859) Bool)

(assert (=> b!1253904 (= res!836121 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27856))))

(declare-fun b!1253905 () Bool)

(declare-fun e!712422 () Bool)

(assert (=> b!1253905 (= e!712423 (not e!712422))))

(declare-fun res!836123 () Bool)

(assert (=> b!1253905 (=> res!836123 e!712422)))

(assert (=> b!1253905 (= res!836123 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20632 0))(
  ( (tuple2!20633 (_1!10327 (_ BitVec 64)) (_2!10327 V!47819)) )
))
(declare-datatypes ((List!27860 0))(
  ( (Nil!27857) (Cons!27856 (h!29065 tuple2!20632) (t!41341 List!27860)) )
))
(declare-datatypes ((ListLongMap!18505 0))(
  ( (ListLongMap!18506 (toList!9268 List!27860)) )
))
(declare-fun lt!566415 () ListLongMap!18505)

(declare-fun lt!566420 () ListLongMap!18505)

(assert (=> b!1253905 (= lt!566415 lt!566420)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47819)

(declare-fun minValueBefore!43 () V!47819)

(declare-fun zeroValue!871 () V!47819)

(declare-datatypes ((Unit!41718 0))(
  ( (Unit!41719) )
))
(declare-fun lt!566416 () Unit!41718)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1020 (array!81338 array!81340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47819 V!47819 V!47819 V!47819 (_ BitVec 32) Int) Unit!41718)

(assert (=> b!1253905 (= lt!566416 (lemmaNoChangeToArrayThenSameMapNoExtras!1020 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5656 (array!81338 array!81340 (_ BitVec 32) (_ BitVec 32) V!47819 V!47819 (_ BitVec 32) Int) ListLongMap!18505)

(assert (=> b!1253905 (= lt!566420 (getCurrentListMapNoExtraKeys!5656 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253905 (= lt!566415 (getCurrentListMapNoExtraKeys!5656 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49537 () Bool)

(declare-fun mapRes!49537 () Bool)

(assert (=> mapIsEmpty!49537 mapRes!49537))

(declare-fun b!1253906 () Bool)

(declare-fun e!712424 () Bool)

(assert (=> b!1253906 (= e!712424 (bvsle #b00000000000000000000000000000000 (size!39767 _keys!1118)))))

(declare-fun b!1253907 () Bool)

(declare-fun e!712427 () Bool)

(declare-fun tp_is_empty!31841 () Bool)

(assert (=> b!1253907 (= e!712427 tp_is_empty!31841)))

(declare-fun b!1253908 () Bool)

(assert (=> b!1253908 (= e!712422 e!712424)))

(declare-fun res!836120 () Bool)

(assert (=> b!1253908 (=> res!836120 e!712424)))

(declare-fun lt!566419 () ListLongMap!18505)

(declare-fun lt!566421 () ListLongMap!18505)

(declare-fun -!2041 (ListLongMap!18505 (_ BitVec 64)) ListLongMap!18505)

(assert (=> b!1253908 (= res!836120 (not (= (-!2041 lt!566419 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566421)))))

(declare-fun lt!566417 () ListLongMap!18505)

(assert (=> b!1253908 (= (-!2041 lt!566417 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566415)))

(declare-fun lt!566418 () Unit!41718)

(declare-fun addThenRemoveForNewKeyIsSame!311 (ListLongMap!18505 (_ BitVec 64) V!47819) Unit!41718)

(assert (=> b!1253908 (= lt!566418 (addThenRemoveForNewKeyIsSame!311 lt!566415 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1253908 (and (= lt!566419 lt!566417) (= lt!566421 lt!566420))))

(declare-fun +!4164 (ListLongMap!18505 tuple2!20632) ListLongMap!18505)

(assert (=> b!1253908 (= lt!566417 (+!4164 lt!566415 (tuple2!20633 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4512 (array!81338 array!81340 (_ BitVec 32) (_ BitVec 32) V!47819 V!47819 (_ BitVec 32) Int) ListLongMap!18505)

(assert (=> b!1253908 (= lt!566421 (getCurrentListMap!4512 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253908 (= lt!566419 (getCurrentListMap!4512 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!836122 () Bool)

(assert (=> start!105222 (=> (not res!836122) (not e!712423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105222 (= res!836122 (validMask!0 mask!1466))))

(assert (=> start!105222 e!712423))

(assert (=> start!105222 true))

(assert (=> start!105222 tp!94321))

(assert (=> start!105222 tp_is_empty!31841))

(declare-fun array_inv!29909 (array!81338) Bool)

(assert (=> start!105222 (array_inv!29909 _keys!1118)))

(declare-fun e!712426 () Bool)

(declare-fun array_inv!29910 (array!81340) Bool)

(assert (=> start!105222 (and (array_inv!29910 _values!914) e!712426)))

(declare-fun b!1253903 () Bool)

(declare-fun e!712428 () Bool)

(assert (=> b!1253903 (= e!712428 tp_is_empty!31841)))

(declare-fun b!1253909 () Bool)

(assert (=> b!1253909 (= e!712426 (and e!712428 mapRes!49537))))

(declare-fun condMapEmpty!49537 () Bool)

(declare-fun mapDefault!49537 () ValueCell!15157)

