; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105280 () Bool)

(assert start!105280)

(declare-fun b_free!26975 () Bool)

(declare-fun b_next!26975 () Bool)

(assert (=> start!105280 (= b_free!26975 (not b_next!26975))))

(declare-fun tp!94433 () Bool)

(declare-fun b_and!44801 () Bool)

(assert (=> start!105280 (= tp!94433 b_and!44801)))

(declare-fun b!1254509 () Bool)

(declare-fun e!712857 () Bool)

(declare-fun tp_is_empty!31877 () Bool)

(assert (=> b!1254509 (= e!712857 tp_is_empty!31877)))

(declare-fun b!1254510 () Bool)

(declare-fun res!836462 () Bool)

(declare-fun e!712860 () Bool)

(assert (=> b!1254510 (=> (not res!836462) (not e!712860))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((array!81408 0))(
  ( (array!81409 (arr!39265 (Array (_ BitVec 32) (_ BitVec 64))) (size!39801 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81408)

(declare-datatypes ((V!47867 0))(
  ( (V!47868 (val!16001 Int)) )
))
(declare-datatypes ((ValueCell!15175 0))(
  ( (ValueCellFull!15175 (v!18700 V!47867)) (EmptyCell!15175) )
))
(declare-datatypes ((array!81410 0))(
  ( (array!81411 (arr!39266 (Array (_ BitVec 32) ValueCell!15175)) (size!39802 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81410)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1254510 (= res!836462 (and (= (size!39802 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39801 _keys!1118) (size!39802 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254511 () Bool)

(declare-fun e!712861 () Bool)

(assert (=> b!1254511 (= e!712860 (not e!712861))))

(declare-fun res!836466 () Bool)

(assert (=> b!1254511 (=> res!836466 e!712861)))

(assert (=> b!1254511 (= res!836466 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20662 0))(
  ( (tuple2!20663 (_1!10342 (_ BitVec 64)) (_2!10342 V!47867)) )
))
(declare-datatypes ((List!27887 0))(
  ( (Nil!27884) (Cons!27883 (h!29092 tuple2!20662) (t!41370 List!27887)) )
))
(declare-datatypes ((ListLongMap!18535 0))(
  ( (ListLongMap!18536 (toList!9283 List!27887)) )
))
(declare-fun lt!566993 () ListLongMap!18535)

(declare-fun lt!566996 () ListLongMap!18535)

(assert (=> b!1254511 (= lt!566993 lt!566996)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47867)

(declare-fun zeroValue!871 () V!47867)

(declare-fun minValueBefore!43 () V!47867)

(declare-datatypes ((Unit!41750 0))(
  ( (Unit!41751) )
))
(declare-fun lt!566998 () Unit!41750)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1034 (array!81408 array!81410 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47867 V!47867 V!47867 V!47867 (_ BitVec 32) Int) Unit!41750)

(assert (=> b!1254511 (= lt!566998 (lemmaNoChangeToArrayThenSameMapNoExtras!1034 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5670 (array!81408 array!81410 (_ BitVec 32) (_ BitVec 32) V!47867 V!47867 (_ BitVec 32) Int) ListLongMap!18535)

(assert (=> b!1254511 (= lt!566996 (getCurrentListMapNoExtraKeys!5670 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254511 (= lt!566993 (getCurrentListMapNoExtraKeys!5670 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49594 () Bool)

(declare-fun mapRes!49594 () Bool)

(declare-fun tp!94432 () Bool)

(assert (=> mapNonEmpty!49594 (= mapRes!49594 (and tp!94432 e!712857))))

(declare-fun mapKey!49594 () (_ BitVec 32))

(declare-fun mapRest!49594 () (Array (_ BitVec 32) ValueCell!15175))

(declare-fun mapValue!49594 () ValueCell!15175)

(assert (=> mapNonEmpty!49594 (= (arr!39266 _values!914) (store mapRest!49594 mapKey!49594 mapValue!49594))))

(declare-fun b!1254512 () Bool)

(declare-fun res!836465 () Bool)

(assert (=> b!1254512 (=> (not res!836465) (not e!712860))))

(declare-datatypes ((List!27888 0))(
  ( (Nil!27885) (Cons!27884 (h!29093 (_ BitVec 64)) (t!41371 List!27888)) )
))
(declare-fun arrayNoDuplicates!0 (array!81408 (_ BitVec 32) List!27888) Bool)

(assert (=> b!1254512 (= res!836465 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27885))))

(declare-fun b!1254513 () Bool)

(declare-fun e!712858 () Bool)

(assert (=> b!1254513 (= e!712858 tp_is_empty!31877)))

(declare-fun b!1254514 () Bool)

(assert (=> b!1254514 (= e!712861 true)))

(declare-fun lt!566997 () ListLongMap!18535)

(declare-fun lt!567000 () ListLongMap!18535)

(declare-fun -!2054 (ListLongMap!18535 (_ BitVec 64)) ListLongMap!18535)

(assert (=> b!1254514 (= lt!566997 (-!2054 lt!567000 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566999 () ListLongMap!18535)

(assert (=> b!1254514 (= (-!2054 lt!566999 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566993)))

(declare-fun lt!566994 () Unit!41750)

(declare-fun addThenRemoveForNewKeyIsSame!324 (ListLongMap!18535 (_ BitVec 64) V!47867) Unit!41750)

(assert (=> b!1254514 (= lt!566994 (addThenRemoveForNewKeyIsSame!324 lt!566993 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566995 () ListLongMap!18535)

(assert (=> b!1254514 (and (= lt!567000 lt!566999) (= lt!566995 lt!566996))))

(declare-fun +!4177 (ListLongMap!18535 tuple2!20662) ListLongMap!18535)

(assert (=> b!1254514 (= lt!566999 (+!4177 lt!566993 (tuple2!20663 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4525 (array!81408 array!81410 (_ BitVec 32) (_ BitVec 32) V!47867 V!47867 (_ BitVec 32) Int) ListLongMap!18535)

(assert (=> b!1254514 (= lt!566995 (getCurrentListMap!4525 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254514 (= lt!567000 (getCurrentListMap!4525 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!836464 () Bool)

(assert (=> start!105280 (=> (not res!836464) (not e!712860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105280 (= res!836464 (validMask!0 mask!1466))))

(assert (=> start!105280 e!712860))

(assert (=> start!105280 true))

(assert (=> start!105280 tp!94433))

(assert (=> start!105280 tp_is_empty!31877))

(declare-fun array_inv!29933 (array!81408) Bool)

(assert (=> start!105280 (array_inv!29933 _keys!1118)))

(declare-fun e!712862 () Bool)

(declare-fun array_inv!29934 (array!81410) Bool)

(assert (=> start!105280 (and (array_inv!29934 _values!914) e!712862)))

(declare-fun b!1254515 () Bool)

(assert (=> b!1254515 (= e!712862 (and e!712858 mapRes!49594))))

(declare-fun condMapEmpty!49594 () Bool)

(declare-fun mapDefault!49594 () ValueCell!15175)

