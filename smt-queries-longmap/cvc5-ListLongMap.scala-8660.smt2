; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105322 () Bool)

(assert start!105322)

(declare-fun b_free!26995 () Bool)

(declare-fun b_next!26995 () Bool)

(assert (=> start!105322 (= b_free!26995 (not b_next!26995))))

(declare-fun tp!94496 () Bool)

(declare-fun b_and!44833 () Bool)

(assert (=> start!105322 (= tp!94496 b_and!44833)))

(declare-fun b!1254931 () Bool)

(declare-fun e!713154 () Bool)

(declare-fun tp_is_empty!31897 () Bool)

(assert (=> b!1254931 (= e!713154 tp_is_empty!31897)))

(declare-fun b!1254932 () Bool)

(declare-fun e!713158 () Bool)

(assert (=> b!1254932 (= e!713158 (not true))))

(declare-datatypes ((V!47895 0))(
  ( (V!47896 (val!16011 Int)) )
))
(declare-datatypes ((tuple2!20680 0))(
  ( (tuple2!20681 (_1!10351 (_ BitVec 64)) (_2!10351 V!47895)) )
))
(declare-datatypes ((List!27904 0))(
  ( (Nil!27901) (Cons!27900 (h!29109 tuple2!20680) (t!41389 List!27904)) )
))
(declare-datatypes ((ListLongMap!18553 0))(
  ( (ListLongMap!18554 (toList!9292 List!27904)) )
))
(declare-fun lt!567361 () ListLongMap!18553)

(declare-fun lt!567363 () ListLongMap!18553)

(assert (=> b!1254932 (= lt!567361 lt!567363)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47895)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47895)

(declare-datatypes ((array!81450 0))(
  ( (array!81451 (arr!39285 (Array (_ BitVec 32) (_ BitVec 64))) (size!39821 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81450)

(declare-datatypes ((ValueCell!15185 0))(
  ( (ValueCellFull!15185 (v!18711 V!47895)) (EmptyCell!15185) )
))
(declare-datatypes ((array!81452 0))(
  ( (array!81453 (arr!39286 (Array (_ BitVec 32) ValueCell!15185)) (size!39822 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81452)

(declare-fun minValueBefore!43 () V!47895)

(declare-datatypes ((Unit!41770 0))(
  ( (Unit!41771) )
))
(declare-fun lt!567362 () Unit!41770)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1041 (array!81450 array!81452 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47895 V!47895 V!47895 V!47895 (_ BitVec 32) Int) Unit!41770)

(assert (=> b!1254932 (= lt!567362 (lemmaNoChangeToArrayThenSameMapNoExtras!1041 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5677 (array!81450 array!81452 (_ BitVec 32) (_ BitVec 32) V!47895 V!47895 (_ BitVec 32) Int) ListLongMap!18553)

(assert (=> b!1254932 (= lt!567363 (getCurrentListMapNoExtraKeys!5677 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254932 (= lt!567361 (getCurrentListMapNoExtraKeys!5677 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49627 () Bool)

(declare-fun mapRes!49627 () Bool)

(assert (=> mapIsEmpty!49627 mapRes!49627))

(declare-fun b!1254933 () Bool)

(declare-fun e!713156 () Bool)

(assert (=> b!1254933 (= e!713156 (and e!713154 mapRes!49627))))

(declare-fun condMapEmpty!49627 () Bool)

(declare-fun mapDefault!49627 () ValueCell!15185)

