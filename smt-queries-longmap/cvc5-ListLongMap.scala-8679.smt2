; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105472 () Bool)

(assert start!105472)

(declare-fun b_free!27109 () Bool)

(declare-fun b_next!27109 () Bool)

(assert (=> start!105472 (= b_free!27109 (not b_next!27109))))

(declare-fun tp!94843 () Bool)

(declare-fun b_and!44965 () Bool)

(assert (=> start!105472 (= tp!94843 b_and!44965)))

(declare-fun b!1256545 () Bool)

(declare-fun res!837643 () Bool)

(declare-fun e!714345 () Bool)

(assert (=> b!1256545 (=> (not res!837643) (not e!714345))))

(declare-datatypes ((array!81662 0))(
  ( (array!81663 (arr!39389 (Array (_ BitVec 32) (_ BitVec 64))) (size!39925 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81662)

(declare-datatypes ((List!27975 0))(
  ( (Nil!27972) (Cons!27971 (h!29180 (_ BitVec 64)) (t!41464 List!27975)) )
))
(declare-fun arrayNoDuplicates!0 (array!81662 (_ BitVec 32) List!27975) Bool)

(assert (=> b!1256545 (= res!837643 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27972))))

(declare-fun mapIsEmpty!49804 () Bool)

(declare-fun mapRes!49804 () Bool)

(assert (=> mapIsEmpty!49804 mapRes!49804))

(declare-fun b!1256546 () Bool)

(declare-fun res!837646 () Bool)

(assert (=> b!1256546 (=> (not res!837646) (not e!714345))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81662 (_ BitVec 32)) Bool)

(assert (=> b!1256546 (= res!837646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!837647 () Bool)

(assert (=> start!105472 (=> (not res!837647) (not e!714345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105472 (= res!837647 (validMask!0 mask!1466))))

(assert (=> start!105472 e!714345))

(assert (=> start!105472 true))

(assert (=> start!105472 tp!94843))

(declare-fun tp_is_empty!32011 () Bool)

(assert (=> start!105472 tp_is_empty!32011))

(declare-fun array_inv!30007 (array!81662) Bool)

(assert (=> start!105472 (array_inv!30007 _keys!1118)))

(declare-datatypes ((V!48047 0))(
  ( (V!48048 (val!16068 Int)) )
))
(declare-datatypes ((ValueCell!15242 0))(
  ( (ValueCellFull!15242 (v!18769 V!48047)) (EmptyCell!15242) )
))
(declare-datatypes ((array!81664 0))(
  ( (array!81665 (arr!39390 (Array (_ BitVec 32) ValueCell!15242)) (size!39926 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81664)

(declare-fun e!714344 () Bool)

(declare-fun array_inv!30008 (array!81664) Bool)

(assert (=> start!105472 (and (array_inv!30008 _values!914) e!714344)))

(declare-fun b!1256547 () Bool)

(declare-fun e!714340 () Bool)

(assert (=> b!1256547 (= e!714340 tp_is_empty!32011)))

(declare-fun b!1256548 () Bool)

(declare-fun e!714339 () Bool)

(assert (=> b!1256548 (= e!714339 tp_is_empty!32011)))

(declare-fun b!1256549 () Bool)

(declare-fun e!714343 () Bool)

(declare-fun e!714341 () Bool)

(assert (=> b!1256549 (= e!714343 e!714341)))

(declare-fun res!837648 () Bool)

(assert (=> b!1256549 (=> res!837648 e!714341)))

(declare-datatypes ((tuple2!20758 0))(
  ( (tuple2!20759 (_1!10390 (_ BitVec 64)) (_2!10390 V!48047)) )
))
(declare-datatypes ((List!27976 0))(
  ( (Nil!27973) (Cons!27972 (h!29181 tuple2!20758) (t!41465 List!27976)) )
))
(declare-datatypes ((ListLongMap!18631 0))(
  ( (ListLongMap!18632 (toList!9331 List!27976)) )
))
(declare-fun lt!568217 () ListLongMap!18631)

(declare-fun contains!7549 (ListLongMap!18631 (_ BitVec 64)) Bool)

(assert (=> b!1256549 (= res!837648 (contains!7549 lt!568217 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48047)

(declare-fun minValueBefore!43 () V!48047)

(declare-fun getCurrentListMap!4554 (array!81662 array!81664 (_ BitVec 32) (_ BitVec 32) V!48047 V!48047 (_ BitVec 32) Int) ListLongMap!18631)

(assert (=> b!1256549 (= lt!568217 (getCurrentListMap!4554 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49804 () Bool)

(declare-fun tp!94844 () Bool)

(assert (=> mapNonEmpty!49804 (= mapRes!49804 (and tp!94844 e!714339))))

(declare-fun mapKey!49804 () (_ BitVec 32))

(declare-fun mapRest!49804 () (Array (_ BitVec 32) ValueCell!15242))

(declare-fun mapValue!49804 () ValueCell!15242)

(assert (=> mapNonEmpty!49804 (= (arr!39390 _values!914) (store mapRest!49804 mapKey!49804 mapValue!49804))))

(declare-fun b!1256550 () Bool)

(assert (=> b!1256550 (= e!714341 true)))

(declare-fun -!2081 (ListLongMap!18631 (_ BitVec 64)) ListLongMap!18631)

(assert (=> b!1256550 (= (-!2081 lt!568217 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568217)))

(declare-datatypes ((Unit!41846 0))(
  ( (Unit!41847) )
))
(declare-fun lt!568215 () Unit!41846)

(declare-fun removeNotPresentStillSame!134 (ListLongMap!18631 (_ BitVec 64)) Unit!41846)

(assert (=> b!1256550 (= lt!568215 (removeNotPresentStillSame!134 lt!568217 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256551 () Bool)

(declare-fun res!837644 () Bool)

(assert (=> b!1256551 (=> (not res!837644) (not e!714345))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1256551 (= res!837644 (and (= (size!39926 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39925 _keys!1118) (size!39926 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256552 () Bool)

(assert (=> b!1256552 (= e!714345 (not e!714343))))

(declare-fun res!837645 () Bool)

(assert (=> b!1256552 (=> res!837645 e!714343)))

(assert (=> b!1256552 (= res!837645 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568216 () ListLongMap!18631)

(declare-fun lt!568213 () ListLongMap!18631)

(assert (=> b!1256552 (= lt!568216 lt!568213)))

(declare-fun minValueAfter!43 () V!48047)

(declare-fun lt!568214 () Unit!41846)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1077 (array!81662 array!81664 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48047 V!48047 V!48047 V!48047 (_ BitVec 32) Int) Unit!41846)

(assert (=> b!1256552 (= lt!568214 (lemmaNoChangeToArrayThenSameMapNoExtras!1077 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5713 (array!81662 array!81664 (_ BitVec 32) (_ BitVec 32) V!48047 V!48047 (_ BitVec 32) Int) ListLongMap!18631)

(assert (=> b!1256552 (= lt!568213 (getCurrentListMapNoExtraKeys!5713 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256552 (= lt!568216 (getCurrentListMapNoExtraKeys!5713 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256553 () Bool)

(assert (=> b!1256553 (= e!714344 (and e!714340 mapRes!49804))))

(declare-fun condMapEmpty!49804 () Bool)

(declare-fun mapDefault!49804 () ValueCell!15242)

