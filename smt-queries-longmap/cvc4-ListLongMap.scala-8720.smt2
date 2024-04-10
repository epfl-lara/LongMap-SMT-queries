; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105796 () Bool)

(assert start!105796)

(declare-fun b_free!27359 () Bool)

(declare-fun b_next!27359 () Bool)

(assert (=> start!105796 (= b_free!27359 (not b_next!27359))))

(declare-fun tp!95606 () Bool)

(declare-fun b_and!45255 () Bool)

(assert (=> start!105796 (= tp!95606 b_and!45255)))

(declare-fun b!1260255 () Bool)

(declare-fun res!839890 () Bool)

(declare-fun e!717094 () Bool)

(assert (=> b!1260255 (=> (not res!839890) (not e!717094))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82140 0))(
  ( (array!82141 (arr!39624 (Array (_ BitVec 32) (_ BitVec 64))) (size!40160 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82140)

(declare-datatypes ((V!48379 0))(
  ( (V!48380 (val!16193 Int)) )
))
(declare-datatypes ((ValueCell!15367 0))(
  ( (ValueCellFull!15367 (v!18896 V!48379)) (EmptyCell!15367) )
))
(declare-datatypes ((array!82142 0))(
  ( (array!82143 (arr!39625 (Array (_ BitVec 32) ValueCell!15367)) (size!40161 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82142)

(declare-fun mask!1466 () (_ BitVec 32))

(assert (=> b!1260255 (= res!839890 (and (= (size!40161 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40160 _keys!1118) (size!40161 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260256 () Bool)

(declare-fun res!839886 () Bool)

(assert (=> b!1260256 (=> (not res!839886) (not e!717094))))

(declare-datatypes ((List!28146 0))(
  ( (Nil!28143) (Cons!28142 (h!29351 (_ BitVec 64)) (t!41643 List!28146)) )
))
(declare-fun arrayNoDuplicates!0 (array!82140 (_ BitVec 32) List!28146) Bool)

(assert (=> b!1260256 (= res!839886 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28143))))

(declare-fun b!1260257 () Bool)

(declare-fun res!839888 () Bool)

(assert (=> b!1260257 (=> (not res!839888) (not e!717094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82140 (_ BitVec 32)) Bool)

(assert (=> b!1260257 (= res!839888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!50191 () Bool)

(declare-fun mapRes!50191 () Bool)

(assert (=> mapIsEmpty!50191 mapRes!50191))

(declare-fun res!839889 () Bool)

(assert (=> start!105796 (=> (not res!839889) (not e!717094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105796 (= res!839889 (validMask!0 mask!1466))))

(assert (=> start!105796 e!717094))

(assert (=> start!105796 true))

(assert (=> start!105796 tp!95606))

(declare-fun tp_is_empty!32261 () Bool)

(assert (=> start!105796 tp_is_empty!32261))

(declare-fun array_inv!30167 (array!82140) Bool)

(assert (=> start!105796 (array_inv!30167 _keys!1118)))

(declare-fun e!717096 () Bool)

(declare-fun array_inv!30168 (array!82142) Bool)

(assert (=> start!105796 (and (array_inv!30168 _values!914) e!717096)))

(declare-fun b!1260258 () Bool)

(declare-fun e!717095 () Bool)

(assert (=> b!1260258 (= e!717095 tp_is_empty!32261)))

(declare-datatypes ((tuple2!20946 0))(
  ( (tuple2!20947 (_1!10484 (_ BitVec 64)) (_2!10484 V!48379)) )
))
(declare-datatypes ((List!28147 0))(
  ( (Nil!28144) (Cons!28143 (h!29352 tuple2!20946) (t!41644 List!28147)) )
))
(declare-datatypes ((ListLongMap!18819 0))(
  ( (ListLongMap!18820 (toList!9425 List!28147)) )
))
(declare-fun lt!570920 () ListLongMap!18819)

(declare-fun b!1260259 () Bool)

(declare-fun lt!570913 () tuple2!20946)

(declare-fun e!717093 () Bool)

(declare-fun lt!570914 () ListLongMap!18819)

(declare-fun +!4228 (ListLongMap!18819 tuple2!20946) ListLongMap!18819)

(assert (=> b!1260259 (= e!717093 (= lt!570920 (+!4228 lt!570914 lt!570913)))))

(declare-fun mapNonEmpty!50191 () Bool)

(declare-fun tp!95605 () Bool)

(declare-fun e!717092 () Bool)

(assert (=> mapNonEmpty!50191 (= mapRes!50191 (and tp!95605 e!717092))))

(declare-fun mapKey!50191 () (_ BitVec 32))

(declare-fun mapValue!50191 () ValueCell!15367)

(declare-fun mapRest!50191 () (Array (_ BitVec 32) ValueCell!15367))

(assert (=> mapNonEmpty!50191 (= (arr!39625 _values!914) (store mapRest!50191 mapKey!50191 mapValue!50191))))

(declare-fun b!1260260 () Bool)

(declare-fun e!717091 () Bool)

(assert (=> b!1260260 (= e!717091 true)))

(declare-fun lt!570922 () ListLongMap!18819)

(declare-fun lt!570918 () ListLongMap!18819)

(declare-fun -!2130 (ListLongMap!18819 (_ BitVec 64)) ListLongMap!18819)

(assert (=> b!1260260 (= lt!570922 (-!2130 lt!570918 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570919 () ListLongMap!18819)

(declare-fun lt!570921 () ListLongMap!18819)

(assert (=> b!1260260 (= (-!2130 lt!570919 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570921)))

(declare-datatypes ((Unit!42035 0))(
  ( (Unit!42036) )
))
(declare-fun lt!570916 () Unit!42035)

(declare-fun minValueBefore!43 () V!48379)

(declare-fun addThenRemoveForNewKeyIsSame!367 (ListLongMap!18819 (_ BitVec 64) V!48379) Unit!42035)

(assert (=> b!1260260 (= lt!570916 (addThenRemoveForNewKeyIsSame!367 lt!570921 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1260260 e!717093))

(declare-fun res!839887 () Bool)

(assert (=> b!1260260 (=> (not res!839887) (not e!717093))))

(assert (=> b!1260260 (= res!839887 (= lt!570918 lt!570919))))

(assert (=> b!1260260 (= lt!570919 (+!4228 lt!570921 (tuple2!20947 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570917 () ListLongMap!18819)

(assert (=> b!1260260 (= lt!570921 (+!4228 lt!570917 lt!570913))))

(declare-fun zeroValue!871 () V!48379)

(assert (=> b!1260260 (= lt!570913 (tuple2!20947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48379)

(declare-fun getCurrentListMap!4621 (array!82140 array!82142 (_ BitVec 32) (_ BitVec 32) V!48379 V!48379 (_ BitVec 32) Int) ListLongMap!18819)

(assert (=> b!1260260 (= lt!570920 (getCurrentListMap!4621 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260260 (= lt!570918 (getCurrentListMap!4621 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260261 () Bool)

(assert (=> b!1260261 (= e!717094 (not e!717091))))

(declare-fun res!839891 () Bool)

(assert (=> b!1260261 (=> res!839891 e!717091)))

(assert (=> b!1260261 (= res!839891 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1260261 (= lt!570917 lt!570914)))

(declare-fun lt!570915 () Unit!42035)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1162 (array!82140 array!82142 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48379 V!48379 V!48379 V!48379 (_ BitVec 32) Int) Unit!42035)

(assert (=> b!1260261 (= lt!570915 (lemmaNoChangeToArrayThenSameMapNoExtras!1162 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5798 (array!82140 array!82142 (_ BitVec 32) (_ BitVec 32) V!48379 V!48379 (_ BitVec 32) Int) ListLongMap!18819)

(assert (=> b!1260261 (= lt!570914 (getCurrentListMapNoExtraKeys!5798 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260261 (= lt!570917 (getCurrentListMapNoExtraKeys!5798 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260262 () Bool)

(assert (=> b!1260262 (= e!717092 tp_is_empty!32261)))

(declare-fun b!1260263 () Bool)

(assert (=> b!1260263 (= e!717096 (and e!717095 mapRes!50191))))

(declare-fun condMapEmpty!50191 () Bool)

(declare-fun mapDefault!50191 () ValueCell!15367)

