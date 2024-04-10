; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104990 () Bool)

(assert start!104990)

(declare-fun b_free!26759 () Bool)

(declare-fun b_next!26759 () Bool)

(assert (=> start!104990 (= b_free!26759 (not b_next!26759))))

(declare-fun tp!93773 () Bool)

(declare-fun b_and!44545 () Bool)

(assert (=> start!104990 (= tp!93773 b_and!44545)))

(declare-fun mapNonEmpty!49258 () Bool)

(declare-fun mapRes!49258 () Bool)

(declare-fun tp!93772 () Bool)

(declare-fun e!710604 () Bool)

(assert (=> mapNonEmpty!49258 (= mapRes!49258 (and tp!93772 e!710604))))

(declare-datatypes ((V!47579 0))(
  ( (V!47580 (val!15893 Int)) )
))
(declare-datatypes ((ValueCell!15067 0))(
  ( (ValueCellFull!15067 (v!18590 V!47579)) (EmptyCell!15067) )
))
(declare-fun mapValue!49258 () ValueCell!15067)

(declare-fun mapRest!49258 () (Array (_ BitVec 32) ValueCell!15067))

(declare-fun mapKey!49258 () (_ BitVec 32))

(declare-datatypes ((array!80986 0))(
  ( (array!80987 (arr!39058 (Array (_ BitVec 32) ValueCell!15067)) (size!39594 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80986)

(assert (=> mapNonEmpty!49258 (= (arr!39058 _values!914) (store mapRest!49258 mapKey!49258 mapValue!49258))))

(declare-fun b!1251397 () Bool)

(declare-fun e!710599 () Bool)

(assert (=> b!1251397 (= e!710599 true)))

(declare-datatypes ((tuple2!20490 0))(
  ( (tuple2!20491 (_1!10256 (_ BitVec 64)) (_2!10256 V!47579)) )
))
(declare-datatypes ((List!27724 0))(
  ( (Nil!27721) (Cons!27720 (h!28929 tuple2!20490) (t!41199 List!27724)) )
))
(declare-datatypes ((ListLongMap!18363 0))(
  ( (ListLongMap!18364 (toList!9197 List!27724)) )
))
(declare-fun lt!564798 () ListLongMap!18363)

(declare-fun -!2017 (ListLongMap!18363 (_ BitVec 64)) ListLongMap!18363)

(assert (=> b!1251397 (= (-!2017 lt!564798 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564798)))

(declare-datatypes ((Unit!41581 0))(
  ( (Unit!41582) )
))
(declare-fun lt!564800 () Unit!41581)

(declare-fun removeNotPresentStillSame!112 (ListLongMap!18363 (_ BitVec 64)) Unit!41581)

(assert (=> b!1251397 (= lt!564800 (removeNotPresentStillSame!112 lt!564798 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251398 () Bool)

(declare-fun res!834663 () Bool)

(declare-fun e!710600 () Bool)

(assert (=> b!1251398 (=> (not res!834663) (not e!710600))))

(declare-datatypes ((array!80988 0))(
  ( (array!80989 (arr!39059 (Array (_ BitVec 32) (_ BitVec 64))) (size!39595 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80988)

(declare-datatypes ((List!27725 0))(
  ( (Nil!27722) (Cons!27721 (h!28930 (_ BitVec 64)) (t!41200 List!27725)) )
))
(declare-fun arrayNoDuplicates!0 (array!80988 (_ BitVec 32) List!27725) Bool)

(assert (=> b!1251398 (= res!834663 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27722))))

(declare-fun b!1251399 () Bool)

(declare-fun e!710598 () Bool)

(declare-fun tp_is_empty!31661 () Bool)

(assert (=> b!1251399 (= e!710598 tp_is_empty!31661)))

(declare-fun b!1251400 () Bool)

(assert (=> b!1251400 (= e!710604 tp_is_empty!31661)))

(declare-fun b!1251401 () Bool)

(declare-fun e!710602 () Bool)

(assert (=> b!1251401 (= e!710602 e!710599)))

(declare-fun res!834664 () Bool)

(assert (=> b!1251401 (=> res!834664 e!710599)))

(declare-fun contains!7508 (ListLongMap!18363 (_ BitVec 64)) Bool)

(assert (=> b!1251401 (= res!834664 (contains!7508 lt!564798 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47579)

(declare-fun minValueBefore!43 () V!47579)

(declare-fun getCurrentListMap!4468 (array!80988 array!80986 (_ BitVec 32) (_ BitVec 32) V!47579 V!47579 (_ BitVec 32) Int) ListLongMap!18363)

(assert (=> b!1251401 (= lt!564798 (getCurrentListMap!4468 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251402 () Bool)

(declare-fun res!834668 () Bool)

(assert (=> b!1251402 (=> (not res!834668) (not e!710600))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1251402 (= res!834668 (and (= (size!39594 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39595 _keys!1118) (size!39594 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251403 () Bool)

(declare-fun e!710603 () Bool)

(assert (=> b!1251403 (= e!710603 (and e!710598 mapRes!49258))))

(declare-fun condMapEmpty!49258 () Bool)

(declare-fun mapDefault!49258 () ValueCell!15067)

