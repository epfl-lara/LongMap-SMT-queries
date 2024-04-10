; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105412 () Bool)

(assert start!105412)

(declare-fun b_free!27071 () Bool)

(declare-fun b_next!27071 () Bool)

(assert (=> start!105412 (= b_free!27071 (not b_next!27071))))

(declare-fun tp!94727 () Bool)

(declare-fun b_and!44917 () Bool)

(assert (=> start!105412 (= tp!94727 b_and!44917)))

(declare-fun b!1255875 () Bool)

(declare-fun e!713842 () Bool)

(declare-fun e!713846 () Bool)

(assert (=> b!1255875 (= e!713842 (not e!713846))))

(declare-fun res!837243 () Bool)

(assert (=> b!1255875 (=> res!837243 e!713846)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1255875 (= res!837243 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47995 0))(
  ( (V!47996 (val!16049 Int)) )
))
(declare-datatypes ((tuple2!20726 0))(
  ( (tuple2!20727 (_1!10374 (_ BitVec 64)) (_2!10374 V!47995)) )
))
(declare-datatypes ((List!27947 0))(
  ( (Nil!27944) (Cons!27943 (h!29152 tuple2!20726) (t!41434 List!27947)) )
))
(declare-datatypes ((ListLongMap!18599 0))(
  ( (ListLongMap!18600 (toList!9315 List!27947)) )
))
(declare-fun lt!567807 () ListLongMap!18599)

(declare-fun lt!567804 () ListLongMap!18599)

(assert (=> b!1255875 (= lt!567807 lt!567804)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41816 0))(
  ( (Unit!41817) )
))
(declare-fun lt!567806 () Unit!41816)

(declare-fun minValueAfter!43 () V!47995)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47995)

(declare-datatypes ((array!81588 0))(
  ( (array!81589 (arr!39353 (Array (_ BitVec 32) (_ BitVec 64))) (size!39889 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81588)

(declare-datatypes ((ValueCell!15223 0))(
  ( (ValueCellFull!15223 (v!18749 V!47995)) (EmptyCell!15223) )
))
(declare-datatypes ((array!81590 0))(
  ( (array!81591 (arr!39354 (Array (_ BitVec 32) ValueCell!15223)) (size!39890 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81590)

(declare-fun minValueBefore!43 () V!47995)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1064 (array!81588 array!81590 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47995 V!47995 V!47995 V!47995 (_ BitVec 32) Int) Unit!41816)

(assert (=> b!1255875 (= lt!567806 (lemmaNoChangeToArrayThenSameMapNoExtras!1064 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5700 (array!81588 array!81590 (_ BitVec 32) (_ BitVec 32) V!47995 V!47995 (_ BitVec 32) Int) ListLongMap!18599)

(assert (=> b!1255875 (= lt!567804 (getCurrentListMapNoExtraKeys!5700 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255875 (= lt!567807 (getCurrentListMapNoExtraKeys!5700 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49744 () Bool)

(declare-fun mapRes!49744 () Bool)

(assert (=> mapIsEmpty!49744 mapRes!49744))

(declare-fun b!1255876 () Bool)

(declare-fun e!713843 () Bool)

(declare-fun tp_is_empty!31973 () Bool)

(assert (=> b!1255876 (= e!713843 tp_is_empty!31973)))

(declare-fun b!1255877 () Bool)

(declare-fun e!713840 () Bool)

(assert (=> b!1255877 (= e!713840 tp_is_empty!31973)))

(declare-fun b!1255878 () Bool)

(declare-fun e!713841 () Bool)

(assert (=> b!1255878 (= e!713841 true)))

(declare-fun lt!567805 () ListLongMap!18599)

(declare-fun -!2068 (ListLongMap!18599 (_ BitVec 64)) ListLongMap!18599)

(assert (=> b!1255878 (= (-!2068 lt!567805 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567805)))

(declare-fun lt!567808 () Unit!41816)

(declare-fun removeNotPresentStillSame!121 (ListLongMap!18599 (_ BitVec 64)) Unit!41816)

(assert (=> b!1255878 (= lt!567808 (removeNotPresentStillSame!121 lt!567805 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1255879 () Bool)

(declare-fun e!713845 () Bool)

(assert (=> b!1255879 (= e!713845 (and e!713840 mapRes!49744))))

(declare-fun condMapEmpty!49744 () Bool)

(declare-fun mapDefault!49744 () ValueCell!15223)

