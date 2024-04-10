; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105298 () Bool)

(assert start!105298)

(declare-fun b_free!26993 () Bool)

(declare-fun b_next!26993 () Bool)

(assert (=> start!105298 (= b_free!26993 (not b_next!26993))))

(declare-fun tp!94486 () Bool)

(declare-fun b_and!44819 () Bool)

(assert (=> start!105298 (= tp!94486 b_and!44819)))

(declare-fun b!1254733 () Bool)

(declare-fun e!713027 () Bool)

(declare-datatypes ((array!81444 0))(
  ( (array!81445 (arr!39283 (Array (_ BitVec 32) (_ BitVec 64))) (size!39819 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81444)

(assert (=> b!1254733 (= e!713027 (bvsle #b00000000000000000000000000000000 (size!39819 _keys!1118)))))

(declare-fun b!1254734 () Bool)

(declare-fun e!713032 () Bool)

(declare-fun tp_is_empty!31895 () Bool)

(assert (=> b!1254734 (= e!713032 tp_is_empty!31895)))

(declare-fun b!1254735 () Bool)

(declare-fun e!713030 () Bool)

(assert (=> b!1254735 (= e!713030 e!713027)))

(declare-fun res!836606 () Bool)

(assert (=> b!1254735 (=> res!836606 e!713027)))

(declare-datatypes ((V!47891 0))(
  ( (V!47892 (val!16010 Int)) )
))
(declare-datatypes ((tuple2!20678 0))(
  ( (tuple2!20679 (_1!10350 (_ BitVec 64)) (_2!10350 V!47891)) )
))
(declare-datatypes ((List!27903 0))(
  ( (Nil!27900) (Cons!27899 (h!29108 tuple2!20678) (t!41386 List!27903)) )
))
(declare-datatypes ((ListLongMap!18551 0))(
  ( (ListLongMap!18552 (toList!9291 List!27903)) )
))
(declare-fun lt!567203 () ListLongMap!18551)

(declare-fun lt!567201 () ListLongMap!18551)

(declare-fun -!2062 (ListLongMap!18551 (_ BitVec 64)) ListLongMap!18551)

(assert (=> b!1254735 (= res!836606 (not (= (-!2062 lt!567203 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567201)))))

(declare-fun lt!567207 () ListLongMap!18551)

(declare-fun lt!567206 () ListLongMap!18551)

(assert (=> b!1254735 (= (-!2062 lt!567207 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567206)))

(declare-datatypes ((Unit!41766 0))(
  ( (Unit!41767) )
))
(declare-fun lt!567205 () Unit!41766)

(declare-fun minValueBefore!43 () V!47891)

(declare-fun addThenRemoveForNewKeyIsSame!332 (ListLongMap!18551 (_ BitVec 64) V!47891) Unit!41766)

(assert (=> b!1254735 (= lt!567205 (addThenRemoveForNewKeyIsSame!332 lt!567206 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!567202 () ListLongMap!18551)

(assert (=> b!1254735 (and (= lt!567203 lt!567207) (= lt!567201 lt!567202))))

(declare-fun +!4185 (ListLongMap!18551 tuple2!20678) ListLongMap!18551)

(assert (=> b!1254735 (= lt!567207 (+!4185 lt!567206 (tuple2!20679 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47891)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47891)

(declare-datatypes ((ValueCell!15184 0))(
  ( (ValueCellFull!15184 (v!18709 V!47891)) (EmptyCell!15184) )
))
(declare-datatypes ((array!81446 0))(
  ( (array!81447 (arr!39284 (Array (_ BitVec 32) ValueCell!15184)) (size!39820 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81446)

(declare-fun getCurrentListMap!4533 (array!81444 array!81446 (_ BitVec 32) (_ BitVec 32) V!47891 V!47891 (_ BitVec 32) Int) ListLongMap!18551)

(assert (=> b!1254735 (= lt!567201 (getCurrentListMap!4533 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254735 (= lt!567203 (getCurrentListMap!4533 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49621 () Bool)

(declare-fun mapRes!49621 () Bool)

(assert (=> mapIsEmpty!49621 mapRes!49621))

(declare-fun b!1254736 () Bool)

(declare-fun res!836609 () Bool)

(declare-fun e!713028 () Bool)

(assert (=> b!1254736 (=> (not res!836609) (not e!713028))))

(assert (=> b!1254736 (= res!836609 (and (= (size!39820 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39819 _keys!1118) (size!39820 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254737 () Bool)

(declare-fun e!713029 () Bool)

(assert (=> b!1254737 (= e!713029 (and e!713032 mapRes!49621))))

(declare-fun condMapEmpty!49621 () Bool)

(declare-fun mapDefault!49621 () ValueCell!15184)

