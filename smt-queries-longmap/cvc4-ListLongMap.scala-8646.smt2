; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105198 () Bool)

(assert start!105198)

(declare-fun b_free!26915 () Bool)

(declare-fun b_next!26915 () Bool)

(assert (=> start!105198 (= b_free!26915 (not b_next!26915))))

(declare-fun tp!94250 () Bool)

(declare-fun b_and!44729 () Bool)

(assert (=> start!105198 (= tp!94250 b_and!44729)))

(declare-fun res!835934 () Bool)

(declare-fun e!712203 () Bool)

(assert (=> start!105198 (=> (not res!835934) (not e!712203))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105198 (= res!835934 (validMask!0 mask!1466))))

(assert (=> start!105198 e!712203))

(assert (=> start!105198 true))

(assert (=> start!105198 tp!94250))

(declare-fun tp_is_empty!31817 () Bool)

(assert (=> start!105198 tp_is_empty!31817))

(declare-datatypes ((array!81292 0))(
  ( (array!81293 (arr!39208 (Array (_ BitVec 32) (_ BitVec 64))) (size!39744 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81292)

(declare-fun array_inv!29889 (array!81292) Bool)

(assert (=> start!105198 (array_inv!29889 _keys!1118)))

(declare-datatypes ((V!47787 0))(
  ( (V!47788 (val!15971 Int)) )
))
(declare-datatypes ((ValueCell!15145 0))(
  ( (ValueCellFull!15145 (v!18669 V!47787)) (EmptyCell!15145) )
))
(declare-datatypes ((array!81294 0))(
  ( (array!81295 (arr!39209 (Array (_ BitVec 32) ValueCell!15145)) (size!39745 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81294)

(declare-fun e!712202 () Bool)

(declare-fun array_inv!29890 (array!81294) Bool)

(assert (=> start!105198 (and (array_inv!29890 _values!914) e!712202)))

(declare-fun b!1253605 () Bool)

(declare-fun e!712201 () Bool)

(assert (=> b!1253605 (= e!712203 (not e!712201))))

(declare-fun res!835932 () Bool)

(assert (=> b!1253605 (=> res!835932 e!712201)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253605 (= res!835932 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20610 0))(
  ( (tuple2!20611 (_1!10316 (_ BitVec 64)) (_2!10316 V!47787)) )
))
(declare-datatypes ((List!27840 0))(
  ( (Nil!27837) (Cons!27836 (h!29045 tuple2!20610) (t!41321 List!27840)) )
))
(declare-datatypes ((ListLongMap!18483 0))(
  ( (ListLongMap!18484 (toList!9257 List!27840)) )
))
(declare-fun lt!566137 () ListLongMap!18483)

(declare-fun lt!566135 () ListLongMap!18483)

(assert (=> b!1253605 (= lt!566137 lt!566135)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47787)

(declare-datatypes ((Unit!41696 0))(
  ( (Unit!41697) )
))
(declare-fun lt!566138 () Unit!41696)

(declare-fun minValueBefore!43 () V!47787)

(declare-fun minValueAfter!43 () V!47787)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1012 (array!81292 array!81294 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47787 V!47787 V!47787 V!47787 (_ BitVec 32) Int) Unit!41696)

(assert (=> b!1253605 (= lt!566138 (lemmaNoChangeToArrayThenSameMapNoExtras!1012 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5648 (array!81292 array!81294 (_ BitVec 32) (_ BitVec 32) V!47787 V!47787 (_ BitVec 32) Int) ListLongMap!18483)

(assert (=> b!1253605 (= lt!566135 (getCurrentListMapNoExtraKeys!5648 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253605 (= lt!566137 (getCurrentListMapNoExtraKeys!5648 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253606 () Bool)

(declare-fun res!835930 () Bool)

(assert (=> b!1253606 (=> (not res!835930) (not e!712203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81292 (_ BitVec 32)) Bool)

(assert (=> b!1253606 (= res!835930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253607 () Bool)

(assert (=> b!1253607 (= e!712201 true)))

(declare-fun lt!566136 () ListLongMap!18483)

(declare-fun lt!566141 () ListLongMap!18483)

(declare-fun -!2030 (ListLongMap!18483 (_ BitVec 64)) ListLongMap!18483)

(assert (=> b!1253607 (= lt!566136 (-!2030 lt!566141 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566140 () ListLongMap!18483)

(assert (=> b!1253607 (= (-!2030 lt!566140 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566137)))

(declare-fun lt!566139 () Unit!41696)

(declare-fun addThenRemoveForNewKeyIsSame!300 (ListLongMap!18483 (_ BitVec 64) V!47787) Unit!41696)

(assert (=> b!1253607 (= lt!566139 (addThenRemoveForNewKeyIsSame!300 lt!566137 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566142 () ListLongMap!18483)

(assert (=> b!1253607 (and (= lt!566141 lt!566140) (= lt!566142 lt!566135))))

(declare-fun +!4153 (ListLongMap!18483 tuple2!20610) ListLongMap!18483)

(assert (=> b!1253607 (= lt!566140 (+!4153 lt!566137 (tuple2!20611 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4501 (array!81292 array!81294 (_ BitVec 32) (_ BitVec 32) V!47787 V!47787 (_ BitVec 32) Int) ListLongMap!18483)

(assert (=> b!1253607 (= lt!566142 (getCurrentListMap!4501 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253607 (= lt!566141 (getCurrentListMap!4501 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253608 () Bool)

(declare-fun res!835933 () Bool)

(assert (=> b!1253608 (=> (not res!835933) (not e!712203))))

(declare-datatypes ((List!27841 0))(
  ( (Nil!27838) (Cons!27837 (h!29046 (_ BitVec 64)) (t!41322 List!27841)) )
))
(declare-fun arrayNoDuplicates!0 (array!81292 (_ BitVec 32) List!27841) Bool)

(assert (=> b!1253608 (= res!835933 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27838))))

(declare-fun mapIsEmpty!49501 () Bool)

(declare-fun mapRes!49501 () Bool)

(assert (=> mapIsEmpty!49501 mapRes!49501))

(declare-fun b!1253609 () Bool)

(declare-fun e!712200 () Bool)

(assert (=> b!1253609 (= e!712202 (and e!712200 mapRes!49501))))

(declare-fun condMapEmpty!49501 () Bool)

(declare-fun mapDefault!49501 () ValueCell!15145)

