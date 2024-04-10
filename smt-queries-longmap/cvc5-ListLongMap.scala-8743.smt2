; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106060 () Bool)

(assert start!106060)

(declare-fun b_free!27493 () Bool)

(declare-fun b_next!27493 () Bool)

(assert (=> start!106060 (= b_free!27493 (not b_next!27493))))

(declare-fun tp!96029 () Bool)

(declare-fun b_and!45467 () Bool)

(assert (=> start!106060 (= tp!96029 b_and!45467)))

(declare-fun res!841327 () Bool)

(declare-fun e!718991 () Bool)

(assert (=> start!106060 (=> (not res!841327) (not e!718991))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106060 (= res!841327 (validMask!0 mask!1466))))

(assert (=> start!106060 e!718991))

(assert (=> start!106060 true))

(assert (=> start!106060 tp!96029))

(declare-fun tp_is_empty!32395 () Bool)

(assert (=> start!106060 tp_is_empty!32395))

(declare-datatypes ((array!82410 0))(
  ( (array!82411 (arr!39752 (Array (_ BitVec 32) (_ BitVec 64))) (size!40288 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82410)

(declare-fun array_inv!30255 (array!82410) Bool)

(assert (=> start!106060 (array_inv!30255 _keys!1118)))

(declare-datatypes ((V!48559 0))(
  ( (V!48560 (val!16260 Int)) )
))
(declare-datatypes ((ValueCell!15434 0))(
  ( (ValueCellFull!15434 (v!18969 V!48559)) (EmptyCell!15434) )
))
(declare-datatypes ((array!82412 0))(
  ( (array!82413 (arr!39753 (Array (_ BitVec 32) ValueCell!15434)) (size!40289 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82412)

(declare-fun e!718989 () Bool)

(declare-fun array_inv!30256 (array!82412) Bool)

(assert (=> start!106060 (and (array_inv!30256 _values!914) e!718989)))

(declare-fun b!1262970 () Bool)

(declare-fun e!718992 () Bool)

(assert (=> b!1262970 (= e!718992 tp_is_empty!32395)))

(declare-fun b!1262971 () Bool)

(declare-fun e!718988 () Bool)

(assert (=> b!1262971 (= e!718988 tp_is_empty!32395)))

(declare-fun b!1262972 () Bool)

(declare-fun e!718990 () Bool)

(assert (=> b!1262972 (= e!718990 true)))

(declare-datatypes ((tuple2!21046 0))(
  ( (tuple2!21047 (_1!10534 (_ BitVec 64)) (_2!10534 V!48559)) )
))
(declare-datatypes ((List!28240 0))(
  ( (Nil!28237) (Cons!28236 (h!29445 tuple2!21046) (t!41751 List!28240)) )
))
(declare-datatypes ((ListLongMap!18919 0))(
  ( (ListLongMap!18920 (toList!9475 List!28240)) )
))
(declare-fun lt!572655 () ListLongMap!18919)

(declare-fun lt!572658 () ListLongMap!18919)

(declare-fun -!2143 (ListLongMap!18919 (_ BitVec 64)) ListLongMap!18919)

(assert (=> b!1262972 (= lt!572655 (-!2143 lt!572658 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!572660 () ListLongMap!18919)

(declare-fun lt!572656 () ListLongMap!18919)

(assert (=> b!1262972 (= (-!2143 lt!572660 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572656)))

(declare-datatypes ((Unit!42099 0))(
  ( (Unit!42100) )
))
(declare-fun lt!572662 () Unit!42099)

(declare-fun minValueBefore!43 () V!48559)

(declare-fun addThenRemoveForNewKeyIsSame!378 (ListLongMap!18919 (_ BitVec 64) V!48559) Unit!42099)

(assert (=> b!1262972 (= lt!572662 (addThenRemoveForNewKeyIsSame!378 lt!572656 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!572661 () ListLongMap!18919)

(declare-fun lt!572657 () ListLongMap!18919)

(assert (=> b!1262972 (and (= lt!572658 lt!572660) (= lt!572657 lt!572661))))

(declare-fun +!4249 (ListLongMap!18919 tuple2!21046) ListLongMap!18919)

(assert (=> b!1262972 (= lt!572660 (+!4249 lt!572656 (tuple2!21047 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48559)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48559)

(declare-fun getCurrentListMap!4642 (array!82410 array!82412 (_ BitVec 32) (_ BitVec 32) V!48559 V!48559 (_ BitVec 32) Int) ListLongMap!18919)

(assert (=> b!1262972 (= lt!572657 (getCurrentListMap!4642 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1262972 (= lt!572658 (getCurrentListMap!4642 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262973 () Bool)

(declare-fun res!841329 () Bool)

(assert (=> b!1262973 (=> (not res!841329) (not e!718991))))

(assert (=> b!1262973 (= res!841329 (and (= (size!40289 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40288 _keys!1118) (size!40289 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50413 () Bool)

(declare-fun mapRes!50413 () Bool)

(assert (=> mapIsEmpty!50413 mapRes!50413))

(declare-fun mapNonEmpty!50413 () Bool)

(declare-fun tp!96028 () Bool)

(assert (=> mapNonEmpty!50413 (= mapRes!50413 (and tp!96028 e!718988))))

(declare-fun mapKey!50413 () (_ BitVec 32))

(declare-fun mapValue!50413 () ValueCell!15434)

(declare-fun mapRest!50413 () (Array (_ BitVec 32) ValueCell!15434))

(assert (=> mapNonEmpty!50413 (= (arr!39753 _values!914) (store mapRest!50413 mapKey!50413 mapValue!50413))))

(declare-fun b!1262974 () Bool)

(assert (=> b!1262974 (= e!718989 (and e!718992 mapRes!50413))))

(declare-fun condMapEmpty!50413 () Bool)

(declare-fun mapDefault!50413 () ValueCell!15434)

