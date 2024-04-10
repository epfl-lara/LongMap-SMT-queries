; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105798 () Bool)

(assert start!105798)

(declare-fun b_free!27361 () Bool)

(declare-fun b_next!27361 () Bool)

(assert (=> start!105798 (= b_free!27361 (not b_next!27361))))

(declare-fun tp!95611 () Bool)

(declare-fun b_and!45257 () Bool)

(assert (=> start!105798 (= tp!95611 b_and!45257)))

(declare-fun b!1260282 () Bool)

(declare-fun res!839905 () Bool)

(declare-fun e!717118 () Bool)

(assert (=> b!1260282 (=> (not res!839905) (not e!717118))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82144 0))(
  ( (array!82145 (arr!39626 (Array (_ BitVec 32) (_ BitVec 64))) (size!40162 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82144)

(declare-datatypes ((V!48383 0))(
  ( (V!48384 (val!16194 Int)) )
))
(declare-datatypes ((ValueCell!15368 0))(
  ( (ValueCellFull!15368 (v!18897 V!48383)) (EmptyCell!15368) )
))
(declare-datatypes ((array!82146 0))(
  ( (array!82147 (arr!39627 (Array (_ BitVec 32) ValueCell!15368)) (size!40163 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82146)

(assert (=> b!1260282 (= res!839905 (and (= (size!40163 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40162 _keys!1118) (size!40163 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260283 () Bool)

(declare-fun e!717114 () Bool)

(assert (=> b!1260283 (= e!717118 (not e!717114))))

(declare-fun res!839906 () Bool)

(assert (=> b!1260283 (=> res!839906 e!717114)))

(assert (=> b!1260283 (= res!839906 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20948 0))(
  ( (tuple2!20949 (_1!10485 (_ BitVec 64)) (_2!10485 V!48383)) )
))
(declare-datatypes ((List!28148 0))(
  ( (Nil!28145) (Cons!28144 (h!29353 tuple2!20948) (t!41645 List!28148)) )
))
(declare-datatypes ((ListLongMap!18821 0))(
  ( (ListLongMap!18822 (toList!9426 List!28148)) )
))
(declare-fun lt!570952 () ListLongMap!18821)

(declare-fun lt!570948 () ListLongMap!18821)

(assert (=> b!1260283 (= lt!570952 lt!570948)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48383)

(declare-fun minValueBefore!43 () V!48383)

(declare-fun zeroValue!871 () V!48383)

(declare-datatypes ((Unit!42037 0))(
  ( (Unit!42038) )
))
(declare-fun lt!570947 () Unit!42037)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1163 (array!82144 array!82146 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48383 V!48383 V!48383 V!48383 (_ BitVec 32) Int) Unit!42037)

(assert (=> b!1260283 (= lt!570947 (lemmaNoChangeToArrayThenSameMapNoExtras!1163 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5799 (array!82144 array!82146 (_ BitVec 32) (_ BitVec 32) V!48383 V!48383 (_ BitVec 32) Int) ListLongMap!18821)

(assert (=> b!1260283 (= lt!570948 (getCurrentListMapNoExtraKeys!5799 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260283 (= lt!570952 (getCurrentListMapNoExtraKeys!5799 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50194 () Bool)

(declare-fun mapRes!50194 () Bool)

(assert (=> mapIsEmpty!50194 mapRes!50194))

(declare-fun b!1260284 () Bool)

(assert (=> b!1260284 (= e!717114 true)))

(declare-fun lt!570944 () ListLongMap!18821)

(declare-fun lt!570950 () ListLongMap!18821)

(declare-fun -!2131 (ListLongMap!18821 (_ BitVec 64)) ListLongMap!18821)

(assert (=> b!1260284 (= lt!570944 (-!2131 lt!570950 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570945 () ListLongMap!18821)

(declare-fun lt!570951 () ListLongMap!18821)

(assert (=> b!1260284 (= (-!2131 lt!570945 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570951)))

(declare-fun lt!570943 () Unit!42037)

(declare-fun addThenRemoveForNewKeyIsSame!368 (ListLongMap!18821 (_ BitVec 64) V!48383) Unit!42037)

(assert (=> b!1260284 (= lt!570943 (addThenRemoveForNewKeyIsSame!368 lt!570951 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717112 () Bool)

(assert (=> b!1260284 e!717112))

(declare-fun res!839907 () Bool)

(assert (=> b!1260284 (=> (not res!839907) (not e!717112))))

(assert (=> b!1260284 (= res!839907 (= lt!570950 lt!570945))))

(declare-fun +!4229 (ListLongMap!18821 tuple2!20948) ListLongMap!18821)

(assert (=> b!1260284 (= lt!570945 (+!4229 lt!570951 (tuple2!20949 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570949 () tuple2!20948)

(assert (=> b!1260284 (= lt!570951 (+!4229 lt!570952 lt!570949))))

(assert (=> b!1260284 (= lt!570949 (tuple2!20949 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun lt!570946 () ListLongMap!18821)

(declare-fun getCurrentListMap!4622 (array!82144 array!82146 (_ BitVec 32) (_ BitVec 32) V!48383 V!48383 (_ BitVec 32) Int) ListLongMap!18821)

(assert (=> b!1260284 (= lt!570946 (getCurrentListMap!4622 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260284 (= lt!570950 (getCurrentListMap!4622 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260285 () Bool)

(declare-fun e!717113 () Bool)

(declare-fun tp_is_empty!32263 () Bool)

(assert (=> b!1260285 (= e!717113 tp_is_empty!32263)))

(declare-fun mapNonEmpty!50194 () Bool)

(declare-fun tp!95612 () Bool)

(assert (=> mapNonEmpty!50194 (= mapRes!50194 (and tp!95612 e!717113))))

(declare-fun mapKey!50194 () (_ BitVec 32))

(declare-fun mapValue!50194 () ValueCell!15368)

(declare-fun mapRest!50194 () (Array (_ BitVec 32) ValueCell!15368))

(assert (=> mapNonEmpty!50194 (= (arr!39627 _values!914) (store mapRest!50194 mapKey!50194 mapValue!50194))))

(declare-fun b!1260286 () Bool)

(declare-fun e!717117 () Bool)

(declare-fun e!717115 () Bool)

(assert (=> b!1260286 (= e!717117 (and e!717115 mapRes!50194))))

(declare-fun condMapEmpty!50194 () Bool)

(declare-fun mapDefault!50194 () ValueCell!15368)

