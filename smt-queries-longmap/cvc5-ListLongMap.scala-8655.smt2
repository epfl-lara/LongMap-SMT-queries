; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105270 () Bool)

(assert start!105270)

(declare-fun b_free!26965 () Bool)

(declare-fun b_next!26965 () Bool)

(assert (=> start!105270 (= b_free!26965 (not b_next!26965))))

(declare-fun tp!94402 () Bool)

(declare-fun b_and!44791 () Bool)

(assert (=> start!105270 (= tp!94402 b_and!44791)))

(declare-fun b!1254389 () Bool)

(declare-fun e!712767 () Bool)

(declare-fun e!712769 () Bool)

(assert (=> b!1254389 (= e!712767 (not e!712769))))

(declare-fun res!836387 () Bool)

(assert (=> b!1254389 (=> res!836387 e!712769)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254389 (= res!836387 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!47855 0))(
  ( (V!47856 (val!15996 Int)) )
))
(declare-datatypes ((tuple2!20652 0))(
  ( (tuple2!20653 (_1!10337 (_ BitVec 64)) (_2!10337 V!47855)) )
))
(declare-datatypes ((List!27877 0))(
  ( (Nil!27874) (Cons!27873 (h!29082 tuple2!20652) (t!41360 List!27877)) )
))
(declare-datatypes ((ListLongMap!18525 0))(
  ( (ListLongMap!18526 (toList!9278 List!27877)) )
))
(declare-fun lt!566878 () ListLongMap!18525)

(declare-fun lt!566877 () ListLongMap!18525)

(assert (=> b!1254389 (= lt!566878 lt!566877)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41740 0))(
  ( (Unit!41741) )
))
(declare-fun lt!566875 () Unit!41740)

(declare-fun minValueAfter!43 () V!47855)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47855)

(declare-datatypes ((array!81388 0))(
  ( (array!81389 (arr!39255 (Array (_ BitVec 32) (_ BitVec 64))) (size!39791 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81388)

(declare-datatypes ((ValueCell!15170 0))(
  ( (ValueCellFull!15170 (v!18695 V!47855)) (EmptyCell!15170) )
))
(declare-datatypes ((array!81390 0))(
  ( (array!81391 (arr!39256 (Array (_ BitVec 32) ValueCell!15170)) (size!39792 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81390)

(declare-fun minValueBefore!43 () V!47855)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1029 (array!81388 array!81390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47855 V!47855 V!47855 V!47855 (_ BitVec 32) Int) Unit!41740)

(assert (=> b!1254389 (= lt!566875 (lemmaNoChangeToArrayThenSameMapNoExtras!1029 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5665 (array!81388 array!81390 (_ BitVec 32) (_ BitVec 32) V!47855 V!47855 (_ BitVec 32) Int) ListLongMap!18525)

(assert (=> b!1254389 (= lt!566877 (getCurrentListMapNoExtraKeys!5665 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254389 (= lt!566878 (getCurrentListMapNoExtraKeys!5665 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254390 () Bool)

(declare-fun res!836391 () Bool)

(assert (=> b!1254390 (=> (not res!836391) (not e!712767))))

(assert (=> b!1254390 (= res!836391 (and (= (size!39792 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39791 _keys!1118) (size!39792 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254391 () Bool)

(declare-fun e!712771 () Bool)

(declare-fun tp_is_empty!31867 () Bool)

(assert (=> b!1254391 (= e!712771 tp_is_empty!31867)))

(declare-fun b!1254392 () Bool)

(declare-fun res!836389 () Bool)

(assert (=> b!1254392 (=> (not res!836389) (not e!712767))))

(declare-datatypes ((List!27878 0))(
  ( (Nil!27875) (Cons!27874 (h!29083 (_ BitVec 64)) (t!41361 List!27878)) )
))
(declare-fun arrayNoDuplicates!0 (array!81388 (_ BitVec 32) List!27878) Bool)

(assert (=> b!1254392 (= res!836389 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27875))))

(declare-fun mapNonEmpty!49579 () Bool)

(declare-fun mapRes!49579 () Bool)

(declare-fun tp!94403 () Bool)

(declare-fun e!712768 () Bool)

(assert (=> mapNonEmpty!49579 (= mapRes!49579 (and tp!94403 e!712768))))

(declare-fun mapKey!49579 () (_ BitVec 32))

(declare-fun mapRest!49579 () (Array (_ BitVec 32) ValueCell!15170))

(declare-fun mapValue!49579 () ValueCell!15170)

(assert (=> mapNonEmpty!49579 (= (arr!39256 _values!914) (store mapRest!49579 mapKey!49579 mapValue!49579))))

(declare-fun b!1254393 () Bool)

(assert (=> b!1254393 (= e!712768 tp_is_empty!31867)))

(declare-fun b!1254394 () Bool)

(assert (=> b!1254394 (= e!712769 true)))

(declare-fun lt!566876 () ListLongMap!18525)

(declare-fun lt!566874 () ListLongMap!18525)

(declare-fun -!2050 (ListLongMap!18525 (_ BitVec 64)) ListLongMap!18525)

(assert (=> b!1254394 (= lt!566876 (-!2050 lt!566874 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566879 () ListLongMap!18525)

(assert (=> b!1254394 (= (-!2050 lt!566879 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566878)))

(declare-fun lt!566880 () Unit!41740)

(declare-fun addThenRemoveForNewKeyIsSame!320 (ListLongMap!18525 (_ BitVec 64) V!47855) Unit!41740)

(assert (=> b!1254394 (= lt!566880 (addThenRemoveForNewKeyIsSame!320 lt!566878 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566873 () ListLongMap!18525)

(assert (=> b!1254394 (and (= lt!566874 lt!566879) (= lt!566873 lt!566877))))

(declare-fun +!4173 (ListLongMap!18525 tuple2!20652) ListLongMap!18525)

(assert (=> b!1254394 (= lt!566879 (+!4173 lt!566878 (tuple2!20653 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4521 (array!81388 array!81390 (_ BitVec 32) (_ BitVec 32) V!47855 V!47855 (_ BitVec 32) Int) ListLongMap!18525)

(assert (=> b!1254394 (= lt!566873 (getCurrentListMap!4521 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254394 (= lt!566874 (getCurrentListMap!4521 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49579 () Bool)

(assert (=> mapIsEmpty!49579 mapRes!49579))

(declare-fun res!836388 () Bool)

(assert (=> start!105270 (=> (not res!836388) (not e!712767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105270 (= res!836388 (validMask!0 mask!1466))))

(assert (=> start!105270 e!712767))

(assert (=> start!105270 true))

(assert (=> start!105270 tp!94402))

(assert (=> start!105270 tp_is_empty!31867))

(declare-fun array_inv!29925 (array!81388) Bool)

(assert (=> start!105270 (array_inv!29925 _keys!1118)))

(declare-fun e!712772 () Bool)

(declare-fun array_inv!29926 (array!81390) Bool)

(assert (=> start!105270 (and (array_inv!29926 _values!914) e!712772)))

(declare-fun b!1254395 () Bool)

(assert (=> b!1254395 (= e!712772 (and e!712771 mapRes!49579))))

(declare-fun condMapEmpty!49579 () Bool)

(declare-fun mapDefault!49579 () ValueCell!15170)

