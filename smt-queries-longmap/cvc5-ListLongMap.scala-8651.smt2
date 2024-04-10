; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105246 () Bool)

(assert start!105246)

(declare-fun b_free!26941 () Bool)

(declare-fun b_next!26941 () Bool)

(assert (=> start!105246 (= b_free!26941 (not b_next!26941))))

(declare-fun tp!94331 () Bool)

(declare-fun b_and!44767 () Bool)

(assert (=> start!105246 (= tp!94331 b_and!44767)))

(declare-fun b!1254101 () Bool)

(declare-fun res!836209 () Bool)

(declare-fun e!712553 () Bool)

(assert (=> b!1254101 (=> (not res!836209) (not e!712553))))

(declare-datatypes ((array!81344 0))(
  ( (array!81345 (arr!39233 (Array (_ BitVec 32) (_ BitVec 64))) (size!39769 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81344)

(declare-datatypes ((List!27861 0))(
  ( (Nil!27858) (Cons!27857 (h!29066 (_ BitVec 64)) (t!41344 List!27861)) )
))
(declare-fun arrayNoDuplicates!0 (array!81344 (_ BitVec 32) List!27861) Bool)

(assert (=> b!1254101 (= res!836209 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27858))))

(declare-fun mapIsEmpty!49543 () Bool)

(declare-fun mapRes!49543 () Bool)

(assert (=> mapIsEmpty!49543 mapRes!49543))

(declare-fun b!1254102 () Bool)

(declare-fun e!712554 () Bool)

(assert (=> b!1254102 (= e!712554 true)))

(declare-datatypes ((V!47823 0))(
  ( (V!47824 (val!15984 Int)) )
))
(declare-datatypes ((tuple2!20634 0))(
  ( (tuple2!20635 (_1!10328 (_ BitVec 64)) (_2!10328 V!47823)) )
))
(declare-datatypes ((List!27862 0))(
  ( (Nil!27859) (Cons!27858 (h!29067 tuple2!20634) (t!41345 List!27862)) )
))
(declare-datatypes ((ListLongMap!18507 0))(
  ( (ListLongMap!18508 (toList!9269 List!27862)) )
))
(declare-fun lt!566586 () ListLongMap!18507)

(declare-fun lt!566587 () ListLongMap!18507)

(declare-fun -!2042 (ListLongMap!18507 (_ BitVec 64)) ListLongMap!18507)

(assert (=> b!1254102 (= lt!566586 (-!2042 lt!566587 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566589 () ListLongMap!18507)

(declare-fun lt!566585 () ListLongMap!18507)

(assert (=> b!1254102 (= (-!2042 lt!566589 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566585)))

(declare-datatypes ((Unit!41722 0))(
  ( (Unit!41723) )
))
(declare-fun lt!566591 () Unit!41722)

(declare-fun minValueBefore!43 () V!47823)

(declare-fun addThenRemoveForNewKeyIsSame!312 (ListLongMap!18507 (_ BitVec 64) V!47823) Unit!41722)

(assert (=> b!1254102 (= lt!566591 (addThenRemoveForNewKeyIsSame!312 lt!566585 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566588 () ListLongMap!18507)

(declare-fun lt!566592 () ListLongMap!18507)

(assert (=> b!1254102 (and (= lt!566587 lt!566589) (= lt!566588 lt!566592))))

(declare-fun +!4165 (ListLongMap!18507 tuple2!20634) ListLongMap!18507)

(assert (=> b!1254102 (= lt!566589 (+!4165 lt!566585 (tuple2!20635 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47823)

(declare-datatypes ((ValueCell!15158 0))(
  ( (ValueCellFull!15158 (v!18683 V!47823)) (EmptyCell!15158) )
))
(declare-datatypes ((array!81346 0))(
  ( (array!81347 (arr!39234 (Array (_ BitVec 32) ValueCell!15158)) (size!39770 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81346)

(declare-fun minValueAfter!43 () V!47823)

(declare-fun getCurrentListMap!4513 (array!81344 array!81346 (_ BitVec 32) (_ BitVec 32) V!47823 V!47823 (_ BitVec 32) Int) ListLongMap!18507)

(assert (=> b!1254102 (= lt!566588 (getCurrentListMap!4513 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254102 (= lt!566587 (getCurrentListMap!4513 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254103 () Bool)

(declare-fun e!712551 () Bool)

(declare-fun tp_is_empty!31843 () Bool)

(assert (=> b!1254103 (= e!712551 tp_is_empty!31843)))

(declare-fun b!1254104 () Bool)

(assert (=> b!1254104 (= e!712553 (not e!712554))))

(declare-fun res!836208 () Bool)

(assert (=> b!1254104 (=> res!836208 e!712554)))

(assert (=> b!1254104 (= res!836208 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254104 (= lt!566585 lt!566592)))

(declare-fun lt!566590 () Unit!41722)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1021 (array!81344 array!81346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47823 V!47823 V!47823 V!47823 (_ BitVec 32) Int) Unit!41722)

(assert (=> b!1254104 (= lt!566590 (lemmaNoChangeToArrayThenSameMapNoExtras!1021 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5657 (array!81344 array!81346 (_ BitVec 32) (_ BitVec 32) V!47823 V!47823 (_ BitVec 32) Int) ListLongMap!18507)

(assert (=> b!1254104 (= lt!566592 (getCurrentListMapNoExtraKeys!5657 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254104 (= lt!566585 (getCurrentListMapNoExtraKeys!5657 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254105 () Bool)

(declare-fun e!712552 () Bool)

(assert (=> b!1254105 (= e!712552 tp_is_empty!31843)))

(declare-fun b!1254107 () Bool)

(declare-fun res!836210 () Bool)

(assert (=> b!1254107 (=> (not res!836210) (not e!712553))))

(assert (=> b!1254107 (= res!836210 (and (= (size!39770 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39769 _keys!1118) (size!39770 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254108 () Bool)

(declare-fun res!836211 () Bool)

(assert (=> b!1254108 (=> (not res!836211) (not e!712553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81344 (_ BitVec 32)) Bool)

(assert (=> b!1254108 (= res!836211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49543 () Bool)

(declare-fun tp!94330 () Bool)

(assert (=> mapNonEmpty!49543 (= mapRes!49543 (and tp!94330 e!712552))))

(declare-fun mapKey!49543 () (_ BitVec 32))

(declare-fun mapValue!49543 () ValueCell!15158)

(declare-fun mapRest!49543 () (Array (_ BitVec 32) ValueCell!15158))

(assert (=> mapNonEmpty!49543 (= (arr!39234 _values!914) (store mapRest!49543 mapKey!49543 mapValue!49543))))

(declare-fun b!1254106 () Bool)

(declare-fun e!712555 () Bool)

(assert (=> b!1254106 (= e!712555 (and e!712551 mapRes!49543))))

(declare-fun condMapEmpty!49543 () Bool)

(declare-fun mapDefault!49543 () ValueCell!15158)

