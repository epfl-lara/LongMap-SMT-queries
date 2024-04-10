; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105218 () Bool)

(assert start!105218)

(declare-fun b_free!26935 () Bool)

(declare-fun b_next!26935 () Bool)

(assert (=> start!105218 (= b_free!26935 (not b_next!26935))))

(declare-fun tp!94309 () Bool)

(declare-fun b_and!44749 () Bool)

(assert (=> start!105218 (= tp!94309 b_and!44749)))

(declare-fun mapNonEmpty!49531 () Bool)

(declare-fun mapRes!49531 () Bool)

(declare-fun tp!94310 () Bool)

(declare-fun e!712385 () Bool)

(assert (=> mapNonEmpty!49531 (= mapRes!49531 (and tp!94310 e!712385))))

(declare-datatypes ((V!47815 0))(
  ( (V!47816 (val!15981 Int)) )
))
(declare-datatypes ((ValueCell!15155 0))(
  ( (ValueCellFull!15155 (v!18679 V!47815)) (EmptyCell!15155) )
))
(declare-fun mapValue!49531 () ValueCell!15155)

(declare-fun mapKey!49531 () (_ BitVec 32))

(declare-datatypes ((array!81330 0))(
  ( (array!81331 (arr!39227 (Array (_ BitVec 32) ValueCell!15155)) (size!39763 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81330)

(declare-fun mapRest!49531 () (Array (_ BitVec 32) ValueCell!15155))

(assert (=> mapNonEmpty!49531 (= (arr!39227 _values!914) (store mapRest!49531 mapKey!49531 mapValue!49531))))

(declare-fun b!1253847 () Bool)

(declare-fun e!712381 () Bool)

(declare-fun tp_is_empty!31837 () Bool)

(assert (=> b!1253847 (= e!712381 tp_is_empty!31837)))

(declare-fun b!1253848 () Bool)

(declare-fun e!712384 () Bool)

(declare-fun e!712382 () Bool)

(assert (=> b!1253848 (= e!712384 e!712382)))

(declare-fun res!836083 () Bool)

(assert (=> b!1253848 (=> res!836083 e!712382)))

(declare-datatypes ((tuple2!20628 0))(
  ( (tuple2!20629 (_1!10325 (_ BitVec 64)) (_2!10325 V!47815)) )
))
(declare-datatypes ((List!27855 0))(
  ( (Nil!27852) (Cons!27851 (h!29060 tuple2!20628) (t!41336 List!27855)) )
))
(declare-datatypes ((ListLongMap!18501 0))(
  ( (ListLongMap!18502 (toList!9266 List!27855)) )
))
(declare-fun lt!566375 () ListLongMap!18501)

(declare-fun lt!566377 () ListLongMap!18501)

(declare-fun -!2039 (ListLongMap!18501 (_ BitVec 64)) ListLongMap!18501)

(assert (=> b!1253848 (= res!836083 (not (= (-!2039 lt!566375 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566377)))))

(declare-fun lt!566379 () ListLongMap!18501)

(declare-fun lt!566378 () ListLongMap!18501)

(assert (=> b!1253848 (= (-!2039 lt!566379 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566378)))

(declare-datatypes ((Unit!41714 0))(
  ( (Unit!41715) )
))
(declare-fun lt!566373 () Unit!41714)

(declare-fun minValueBefore!43 () V!47815)

(declare-fun addThenRemoveForNewKeyIsSame!309 (ListLongMap!18501 (_ BitVec 64) V!47815) Unit!41714)

(assert (=> b!1253848 (= lt!566373 (addThenRemoveForNewKeyIsSame!309 lt!566378 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566376 () ListLongMap!18501)

(assert (=> b!1253848 (and (= lt!566375 lt!566379) (= lt!566377 lt!566376))))

(declare-fun +!4162 (ListLongMap!18501 tuple2!20628) ListLongMap!18501)

(assert (=> b!1253848 (= lt!566379 (+!4162 lt!566378 (tuple2!20629 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47815)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47815)

(declare-datatypes ((array!81332 0))(
  ( (array!81333 (arr!39228 (Array (_ BitVec 32) (_ BitVec 64))) (size!39764 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81332)

(declare-fun getCurrentListMap!4510 (array!81332 array!81330 (_ BitVec 32) (_ BitVec 32) V!47815 V!47815 (_ BitVec 32) Int) ListLongMap!18501)

(assert (=> b!1253848 (= lt!566377 (getCurrentListMap!4510 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253848 (= lt!566375 (getCurrentListMap!4510 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253849 () Bool)

(declare-fun res!836087 () Bool)

(declare-fun e!712383 () Bool)

(assert (=> b!1253849 (=> (not res!836087) (not e!712383))))

(declare-datatypes ((List!27856 0))(
  ( (Nil!27853) (Cons!27852 (h!29061 (_ BitVec 64)) (t!41337 List!27856)) )
))
(declare-fun arrayNoDuplicates!0 (array!81332 (_ BitVec 32) List!27856) Bool)

(assert (=> b!1253849 (= res!836087 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27853))))

(declare-fun b!1253850 () Bool)

(declare-fun res!836084 () Bool)

(assert (=> b!1253850 (=> (not res!836084) (not e!712383))))

(assert (=> b!1253850 (= res!836084 (and (= (size!39763 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39764 _keys!1118) (size!39763 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253851 () Bool)

(assert (=> b!1253851 (= e!712383 (not e!712384))))

(declare-fun res!836086 () Bool)

(assert (=> b!1253851 (=> res!836086 e!712384)))

(assert (=> b!1253851 (= res!836086 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1253851 (= lt!566378 lt!566376)))

(declare-fun lt!566374 () Unit!41714)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1018 (array!81332 array!81330 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47815 V!47815 V!47815 V!47815 (_ BitVec 32) Int) Unit!41714)

(assert (=> b!1253851 (= lt!566374 (lemmaNoChangeToArrayThenSameMapNoExtras!1018 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5654 (array!81332 array!81330 (_ BitVec 32) (_ BitVec 32) V!47815 V!47815 (_ BitVec 32) Int) ListLongMap!18501)

(assert (=> b!1253851 (= lt!566376 (getCurrentListMapNoExtraKeys!5654 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253851 (= lt!566378 (getCurrentListMapNoExtraKeys!5654 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!836085 () Bool)

(assert (=> start!105218 (=> (not res!836085) (not e!712383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105218 (= res!836085 (validMask!0 mask!1466))))

(assert (=> start!105218 e!712383))

(assert (=> start!105218 true))

(assert (=> start!105218 tp!94309))

(assert (=> start!105218 tp_is_empty!31837))

(declare-fun array_inv!29905 (array!81332) Bool)

(assert (=> start!105218 (array_inv!29905 _keys!1118)))

(declare-fun e!712386 () Bool)

(declare-fun array_inv!29906 (array!81330) Bool)

(assert (=> start!105218 (and (array_inv!29906 _values!914) e!712386)))

(declare-fun b!1253852 () Bool)

(assert (=> b!1253852 (= e!712385 tp_is_empty!31837)))

(declare-fun b!1253853 () Bool)

(assert (=> b!1253853 (= e!712382 (bvsle #b00000000000000000000000000000000 (size!39764 _keys!1118)))))

(declare-fun b!1253854 () Bool)

(assert (=> b!1253854 (= e!712386 (and e!712381 mapRes!49531))))

(declare-fun condMapEmpty!49531 () Bool)

(declare-fun mapDefault!49531 () ValueCell!15155)

