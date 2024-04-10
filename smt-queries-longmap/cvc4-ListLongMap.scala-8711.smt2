; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105720 () Bool)

(assert start!105720)

(declare-fun b_free!27305 () Bool)

(declare-fun b_next!27305 () Bool)

(assert (=> start!105720 (= b_free!27305 (not b_next!27305))))

(declare-fun tp!95441 () Bool)

(declare-fun b_and!45189 () Bool)

(assert (=> start!105720 (= tp!95441 b_and!45189)))

(declare-fun b!1259338 () Bool)

(declare-fun res!839315 () Bool)

(declare-fun e!716408 () Bool)

(assert (=> b!1259338 (=> (not res!839315) (not e!716408))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82032 0))(
  ( (array!82033 (arr!39571 (Array (_ BitVec 32) (_ BitVec 64))) (size!40107 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82032)

(declare-datatypes ((V!48307 0))(
  ( (V!48308 (val!16166 Int)) )
))
(declare-datatypes ((ValueCell!15340 0))(
  ( (ValueCellFull!15340 (v!18868 V!48307)) (EmptyCell!15340) )
))
(declare-datatypes ((array!82034 0))(
  ( (array!82035 (arr!39572 (Array (_ BitVec 32) ValueCell!15340)) (size!40108 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82034)

(assert (=> b!1259338 (= res!839315 (and (= (size!40108 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40107 _keys!1118) (size!40108 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20894 0))(
  ( (tuple2!20895 (_1!10458 (_ BitVec 64)) (_2!10458 V!48307)) )
))
(declare-datatypes ((List!28103 0))(
  ( (Nil!28100) (Cons!28099 (h!29308 tuple2!20894) (t!41598 List!28103)) )
))
(declare-datatypes ((ListLongMap!18767 0))(
  ( (ListLongMap!18768 (toList!9399 List!28103)) )
))
(declare-fun lt!569962 () ListLongMap!18767)

(declare-fun lt!569959 () tuple2!20894)

(declare-fun b!1259339 () Bool)

(declare-fun lt!569961 () ListLongMap!18767)

(declare-fun e!716405 () Bool)

(declare-fun +!4204 (ListLongMap!18767 tuple2!20894) ListLongMap!18767)

(assert (=> b!1259339 (= e!716405 (= lt!569961 (+!4204 lt!569962 lt!569959)))))

(declare-fun b!1259340 () Bool)

(declare-fun e!716409 () Bool)

(assert (=> b!1259340 (= e!716408 (not e!716409))))

(declare-fun res!839316 () Bool)

(assert (=> b!1259340 (=> res!839316 e!716409)))

(assert (=> b!1259340 (= res!839316 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569964 () ListLongMap!18767)

(assert (=> b!1259340 (= lt!569964 lt!569962)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48307)

(declare-fun zeroValue!871 () V!48307)

(declare-fun minValueBefore!43 () V!48307)

(declare-datatypes ((Unit!41981 0))(
  ( (Unit!41982) )
))
(declare-fun lt!569960 () Unit!41981)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1139 (array!82032 array!82034 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48307 V!48307 V!48307 V!48307 (_ BitVec 32) Int) Unit!41981)

(assert (=> b!1259340 (= lt!569960 (lemmaNoChangeToArrayThenSameMapNoExtras!1139 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5775 (array!82032 array!82034 (_ BitVec 32) (_ BitVec 32) V!48307 V!48307 (_ BitVec 32) Int) ListLongMap!18767)

(assert (=> b!1259340 (= lt!569962 (getCurrentListMapNoExtraKeys!5775 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259340 (= lt!569964 (getCurrentListMapNoExtraKeys!5775 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259341 () Bool)

(assert (=> b!1259341 (= e!716409 true)))

(declare-fun lt!569963 () ListLongMap!18767)

(declare-fun lt!569958 () ListLongMap!18767)

(declare-fun -!2106 (ListLongMap!18767 (_ BitVec 64)) ListLongMap!18767)

(assert (=> b!1259341 (= lt!569963 (-!2106 lt!569958 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!569965 () ListLongMap!18767)

(declare-fun lt!569966 () ListLongMap!18767)

(assert (=> b!1259341 (= (-!2106 lt!569965 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569966)))

(declare-fun lt!569957 () Unit!41981)

(declare-fun addThenRemoveForNewKeyIsSame!343 (ListLongMap!18767 (_ BitVec 64) V!48307) Unit!41981)

(assert (=> b!1259341 (= lt!569957 (addThenRemoveForNewKeyIsSame!343 lt!569966 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1259341 e!716405))

(declare-fun res!839318 () Bool)

(assert (=> b!1259341 (=> (not res!839318) (not e!716405))))

(assert (=> b!1259341 (= res!839318 (= lt!569958 lt!569965))))

(assert (=> b!1259341 (= lt!569965 (+!4204 lt!569966 (tuple2!20895 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (=> b!1259341 (= lt!569966 (+!4204 lt!569964 lt!569959))))

(assert (=> b!1259341 (= lt!569959 (tuple2!20895 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun getCurrentListMap!4597 (array!82032 array!82034 (_ BitVec 32) (_ BitVec 32) V!48307 V!48307 (_ BitVec 32) Int) ListLongMap!18767)

(assert (=> b!1259341 (= lt!569961 (getCurrentListMap!4597 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259341 (= lt!569958 (getCurrentListMap!4597 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259342 () Bool)

(declare-fun e!716406 () Bool)

(declare-fun e!716404 () Bool)

(declare-fun mapRes!50107 () Bool)

(assert (=> b!1259342 (= e!716406 (and e!716404 mapRes!50107))))

(declare-fun condMapEmpty!50107 () Bool)

(declare-fun mapDefault!50107 () ValueCell!15340)

