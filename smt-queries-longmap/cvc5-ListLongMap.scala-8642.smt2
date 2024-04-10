; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105170 () Bool)

(assert start!105170)

(declare-fun b_free!26887 () Bool)

(declare-fun b_next!26887 () Bool)

(assert (=> start!105170 (= b_free!26887 (not b_next!26887))))

(declare-fun tp!94166 () Bool)

(declare-fun b_and!44701 () Bool)

(assert (=> start!105170 (= tp!94166 b_and!44701)))

(declare-fun b!1253269 () Bool)

(declare-fun e!711946 () Bool)

(assert (=> b!1253269 (= e!711946 true)))

(declare-datatypes ((V!47751 0))(
  ( (V!47752 (val!15957 Int)) )
))
(declare-datatypes ((tuple2!20590 0))(
  ( (tuple2!20591 (_1!10306 (_ BitVec 64)) (_2!10306 V!47751)) )
))
(declare-datatypes ((List!27820 0))(
  ( (Nil!27817) (Cons!27816 (h!29025 tuple2!20590) (t!41301 List!27820)) )
))
(declare-datatypes ((ListLongMap!18463 0))(
  ( (ListLongMap!18464 (toList!9247 List!27820)) )
))
(declare-fun lt!565799 () ListLongMap!18463)

(declare-fun lt!565806 () ListLongMap!18463)

(declare-fun -!2021 (ListLongMap!18463 (_ BitVec 64)) ListLongMap!18463)

(assert (=> b!1253269 (= lt!565799 (-!2021 lt!565806 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!565804 () ListLongMap!18463)

(declare-fun lt!565803 () ListLongMap!18463)

(assert (=> b!1253269 (= (-!2021 lt!565804 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565803)))

(declare-datatypes ((Unit!41676 0))(
  ( (Unit!41677) )
))
(declare-fun lt!565802 () Unit!41676)

(declare-fun minValueBefore!43 () V!47751)

(declare-fun addThenRemoveForNewKeyIsSame!291 (ListLongMap!18463 (_ BitVec 64) V!47751) Unit!41676)

(assert (=> b!1253269 (= lt!565802 (addThenRemoveForNewKeyIsSame!291 lt!565803 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!565801 () ListLongMap!18463)

(declare-fun lt!565800 () ListLongMap!18463)

(assert (=> b!1253269 (and (= lt!565806 lt!565804) (= lt!565801 lt!565800))))

(declare-fun +!4144 (ListLongMap!18463 tuple2!20590) ListLongMap!18463)

(assert (=> b!1253269 (= lt!565804 (+!4144 lt!565803 (tuple2!20591 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47751)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47751)

(declare-datatypes ((array!81238 0))(
  ( (array!81239 (arr!39181 (Array (_ BitVec 32) (_ BitVec 64))) (size!39717 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81238)

(declare-datatypes ((ValueCell!15131 0))(
  ( (ValueCellFull!15131 (v!18655 V!47751)) (EmptyCell!15131) )
))
(declare-datatypes ((array!81240 0))(
  ( (array!81241 (arr!39182 (Array (_ BitVec 32) ValueCell!15131)) (size!39718 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81240)

(declare-fun getCurrentListMap!4492 (array!81238 array!81240 (_ BitVec 32) (_ BitVec 32) V!47751 V!47751 (_ BitVec 32) Int) ListLongMap!18463)

(assert (=> b!1253269 (= lt!565801 (getCurrentListMap!4492 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253269 (= lt!565806 (getCurrentListMap!4492 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253270 () Bool)

(declare-fun res!835724 () Bool)

(declare-fun e!711947 () Bool)

(assert (=> b!1253270 (=> (not res!835724) (not e!711947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81238 (_ BitVec 32)) Bool)

(assert (=> b!1253270 (= res!835724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!835723 () Bool)

(assert (=> start!105170 (=> (not res!835723) (not e!711947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105170 (= res!835723 (validMask!0 mask!1466))))

(assert (=> start!105170 e!711947))

(assert (=> start!105170 true))

(assert (=> start!105170 tp!94166))

(declare-fun tp_is_empty!31789 () Bool)

(assert (=> start!105170 tp_is_empty!31789))

(declare-fun array_inv!29875 (array!81238) Bool)

(assert (=> start!105170 (array_inv!29875 _keys!1118)))

(declare-fun e!711948 () Bool)

(declare-fun array_inv!29876 (array!81240) Bool)

(assert (=> start!105170 (and (array_inv!29876 _values!914) e!711948)))

(declare-fun mapNonEmpty!49459 () Bool)

(declare-fun mapRes!49459 () Bool)

(declare-fun tp!94165 () Bool)

(declare-fun e!711950 () Bool)

(assert (=> mapNonEmpty!49459 (= mapRes!49459 (and tp!94165 e!711950))))

(declare-fun mapRest!49459 () (Array (_ BitVec 32) ValueCell!15131))

(declare-fun mapValue!49459 () ValueCell!15131)

(declare-fun mapKey!49459 () (_ BitVec 32))

(assert (=> mapNonEmpty!49459 (= (arr!39182 _values!914) (store mapRest!49459 mapKey!49459 mapValue!49459))))

(declare-fun b!1253271 () Bool)

(assert (=> b!1253271 (= e!711947 (not e!711946))))

(declare-fun res!835720 () Bool)

(assert (=> b!1253271 (=> res!835720 e!711946)))

(assert (=> b!1253271 (= res!835720 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1253271 (= lt!565803 lt!565800)))

(declare-fun lt!565805 () Unit!41676)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1003 (array!81238 array!81240 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47751 V!47751 V!47751 V!47751 (_ BitVec 32) Int) Unit!41676)

(assert (=> b!1253271 (= lt!565805 (lemmaNoChangeToArrayThenSameMapNoExtras!1003 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5639 (array!81238 array!81240 (_ BitVec 32) (_ BitVec 32) V!47751 V!47751 (_ BitVec 32) Int) ListLongMap!18463)

(assert (=> b!1253271 (= lt!565800 (getCurrentListMapNoExtraKeys!5639 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253271 (= lt!565803 (getCurrentListMapNoExtraKeys!5639 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253272 () Bool)

(declare-fun res!835721 () Bool)

(assert (=> b!1253272 (=> (not res!835721) (not e!711947))))

(assert (=> b!1253272 (= res!835721 (and (= (size!39718 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39717 _keys!1118) (size!39718 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49459 () Bool)

(assert (=> mapIsEmpty!49459 mapRes!49459))

(declare-fun b!1253273 () Bool)

(assert (=> b!1253273 (= e!711950 tp_is_empty!31789)))

(declare-fun b!1253274 () Bool)

(declare-fun res!835722 () Bool)

(assert (=> b!1253274 (=> (not res!835722) (not e!711947))))

(declare-datatypes ((List!27821 0))(
  ( (Nil!27818) (Cons!27817 (h!29026 (_ BitVec 64)) (t!41302 List!27821)) )
))
(declare-fun arrayNoDuplicates!0 (array!81238 (_ BitVec 32) List!27821) Bool)

(assert (=> b!1253274 (= res!835722 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27818))))

(declare-fun b!1253275 () Bool)

(declare-fun e!711949 () Bool)

(assert (=> b!1253275 (= e!711948 (and e!711949 mapRes!49459))))

(declare-fun condMapEmpty!49459 () Bool)

(declare-fun mapDefault!49459 () ValueCell!15131)

