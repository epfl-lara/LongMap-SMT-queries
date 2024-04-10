; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106058 () Bool)

(assert start!106058)

(declare-fun b_free!27491 () Bool)

(declare-fun b_next!27491 () Bool)

(assert (=> start!106058 (= b_free!27491 (not b_next!27491))))

(declare-fun tp!96023 () Bool)

(declare-fun b_and!45465 () Bool)

(assert (=> start!106058 (= tp!96023 b_and!45465)))

(declare-fun b!1262946 () Bool)

(declare-fun res!841315 () Bool)

(declare-fun e!718974 () Bool)

(assert (=> b!1262946 (=> (not res!841315) (not e!718974))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82406 0))(
  ( (array!82407 (arr!39750 (Array (_ BitVec 32) (_ BitVec 64))) (size!40286 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82406)

(declare-datatypes ((V!48555 0))(
  ( (V!48556 (val!16259 Int)) )
))
(declare-datatypes ((ValueCell!15433 0))(
  ( (ValueCellFull!15433 (v!18968 V!48555)) (EmptyCell!15433) )
))
(declare-datatypes ((array!82408 0))(
  ( (array!82409 (arr!39751 (Array (_ BitVec 32) ValueCell!15433)) (size!40287 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82408)

(assert (=> b!1262946 (= res!841315 (and (= (size!40287 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40286 _keys!1118) (size!40287 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50410 () Bool)

(declare-fun mapRes!50410 () Bool)

(declare-fun tp!96022 () Bool)

(declare-fun e!718969 () Bool)

(assert (=> mapNonEmpty!50410 (= mapRes!50410 (and tp!96022 e!718969))))

(declare-fun mapKey!50410 () (_ BitVec 32))

(declare-fun mapRest!50410 () (Array (_ BitVec 32) ValueCell!15433))

(declare-fun mapValue!50410 () ValueCell!15433)

(assert (=> mapNonEmpty!50410 (= (arr!39751 _values!914) (store mapRest!50410 mapKey!50410 mapValue!50410))))

(declare-fun res!841314 () Bool)

(assert (=> start!106058 (=> (not res!841314) (not e!718974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106058 (= res!841314 (validMask!0 mask!1466))))

(assert (=> start!106058 e!718974))

(assert (=> start!106058 true))

(assert (=> start!106058 tp!96023))

(declare-fun tp_is_empty!32393 () Bool)

(assert (=> start!106058 tp_is_empty!32393))

(declare-fun array_inv!30253 (array!82406) Bool)

(assert (=> start!106058 (array_inv!30253 _keys!1118)))

(declare-fun e!718972 () Bool)

(declare-fun array_inv!30254 (array!82408) Bool)

(assert (=> start!106058 (and (array_inv!30254 _values!914) e!718972)))

(declare-fun mapIsEmpty!50410 () Bool)

(assert (=> mapIsEmpty!50410 mapRes!50410))

(declare-fun b!1262947 () Bool)

(declare-fun res!841313 () Bool)

(assert (=> b!1262947 (=> (not res!841313) (not e!718974))))

(declare-datatypes ((List!28239 0))(
  ( (Nil!28236) (Cons!28235 (h!29444 (_ BitVec 64)) (t!41750 List!28239)) )
))
(declare-fun arrayNoDuplicates!0 (array!82406 (_ BitVec 32) List!28239) Bool)

(assert (=> b!1262947 (= res!841313 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28236))))

(declare-fun b!1262948 () Bool)

(declare-fun e!718971 () Bool)

(assert (=> b!1262948 (= e!718972 (and e!718971 mapRes!50410))))

(declare-fun condMapEmpty!50410 () Bool)

(declare-fun mapDefault!50410 () ValueCell!15433)

