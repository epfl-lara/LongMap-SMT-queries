; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105070 () Bool)

(assert start!105070)

(declare-fun b_free!26817 () Bool)

(declare-fun b_next!26817 () Bool)

(assert (=> start!105070 (= b_free!26817 (not b_next!26817))))

(declare-fun tp!93949 () Bool)

(declare-fun b_and!44613 () Bool)

(assert (=> start!105070 (= tp!93949 b_and!44613)))

(declare-fun b!1252200 () Bool)

(declare-fun res!835113 () Bool)

(declare-fun e!711172 () Bool)

(assert (=> b!1252200 (=> (not res!835113) (not e!711172))))

(declare-datatypes ((array!81098 0))(
  ( (array!81099 (arr!39113 (Array (_ BitVec 32) (_ BitVec 64))) (size!39649 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81098)

(declare-datatypes ((List!27768 0))(
  ( (Nil!27765) (Cons!27764 (h!28973 (_ BitVec 64)) (t!41245 List!27768)) )
))
(declare-fun arrayNoDuplicates!0 (array!81098 (_ BitVec 32) List!27768) Bool)

(assert (=> b!1252200 (= res!835113 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27765))))

(declare-fun b!1252201 () Bool)

(declare-fun e!711175 () Bool)

(declare-fun tp_is_empty!31719 () Bool)

(assert (=> b!1252201 (= e!711175 tp_is_empty!31719)))

(declare-fun res!835112 () Bool)

(assert (=> start!105070 (=> (not res!835112) (not e!711172))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105070 (= res!835112 (validMask!0 mask!1466))))

(assert (=> start!105070 e!711172))

(assert (=> start!105070 true))

(assert (=> start!105070 tp!93949))

(assert (=> start!105070 tp_is_empty!31719))

(declare-fun array_inv!29833 (array!81098) Bool)

(assert (=> start!105070 (array_inv!29833 _keys!1118)))

(declare-datatypes ((V!47657 0))(
  ( (V!47658 (val!15922 Int)) )
))
(declare-datatypes ((ValueCell!15096 0))(
  ( (ValueCellFull!15096 (v!18620 V!47657)) (EmptyCell!15096) )
))
(declare-datatypes ((array!81100 0))(
  ( (array!81101 (arr!39114 (Array (_ BitVec 32) ValueCell!15096)) (size!39650 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81100)

(declare-fun e!711173 () Bool)

(declare-fun array_inv!29834 (array!81100) Bool)

(assert (=> start!105070 (and (array_inv!29834 _values!914) e!711173)))

(declare-fun b!1252202 () Bool)

(declare-fun res!835110 () Bool)

(assert (=> b!1252202 (=> (not res!835110) (not e!711172))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1252202 (= res!835110 (and (= (size!39650 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39649 _keys!1118) (size!39650 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252203 () Bool)

(declare-fun res!835111 () Bool)

(assert (=> b!1252203 (=> (not res!835111) (not e!711172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81098 (_ BitVec 32)) Bool)

(assert (=> b!1252203 (= res!835111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252204 () Bool)

(declare-fun e!711174 () Bool)

(assert (=> b!1252204 (= e!711174 tp_is_empty!31719)))

(declare-fun mapIsEmpty!49348 () Bool)

(declare-fun mapRes!49348 () Bool)

(assert (=> mapIsEmpty!49348 mapRes!49348))

(declare-fun b!1252205 () Bool)

(assert (=> b!1252205 (= e!711173 (and e!711175 mapRes!49348))))

(declare-fun condMapEmpty!49348 () Bool)

(declare-fun mapDefault!49348 () ValueCell!15096)

(assert (=> b!1252205 (= condMapEmpty!49348 (= (arr!39114 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15096)) mapDefault!49348)))))

(declare-fun b!1252206 () Bool)

(assert (=> b!1252206 (= e!711172 (not true))))

(declare-datatypes ((tuple2!20536 0))(
  ( (tuple2!20537 (_1!10279 (_ BitVec 64)) (_2!10279 V!47657)) )
))
(declare-datatypes ((List!27769 0))(
  ( (Nil!27766) (Cons!27765 (h!28974 tuple2!20536) (t!41246 List!27769)) )
))
(declare-datatypes ((ListLongMap!18409 0))(
  ( (ListLongMap!18410 (toList!9220 List!27769)) )
))
(declare-fun lt!565221 () ListLongMap!18409)

(declare-fun lt!565222 () ListLongMap!18409)

(assert (=> b!1252206 (= lt!565221 lt!565222)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41629 0))(
  ( (Unit!41630) )
))
(declare-fun lt!565220 () Unit!41629)

(declare-fun minValueAfter!43 () V!47657)

(declare-fun zeroValue!871 () V!47657)

(declare-fun minValueBefore!43 () V!47657)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!980 (array!81098 array!81100 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47657 V!47657 V!47657 V!47657 (_ BitVec 32) Int) Unit!41629)

(assert (=> b!1252206 (= lt!565220 (lemmaNoChangeToArrayThenSameMapNoExtras!980 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5616 (array!81098 array!81100 (_ BitVec 32) (_ BitVec 32) V!47657 V!47657 (_ BitVec 32) Int) ListLongMap!18409)

(assert (=> b!1252206 (= lt!565222 (getCurrentListMapNoExtraKeys!5616 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252206 (= lt!565221 (getCurrentListMapNoExtraKeys!5616 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49348 () Bool)

(declare-fun tp!93950 () Bool)

(assert (=> mapNonEmpty!49348 (= mapRes!49348 (and tp!93950 e!711174))))

(declare-fun mapKey!49348 () (_ BitVec 32))

(declare-fun mapValue!49348 () ValueCell!15096)

(declare-fun mapRest!49348 () (Array (_ BitVec 32) ValueCell!15096))

(assert (=> mapNonEmpty!49348 (= (arr!39114 _values!914) (store mapRest!49348 mapKey!49348 mapValue!49348))))

(assert (= (and start!105070 res!835112) b!1252202))

(assert (= (and b!1252202 res!835110) b!1252203))

(assert (= (and b!1252203 res!835111) b!1252200))

(assert (= (and b!1252200 res!835113) b!1252206))

(assert (= (and b!1252205 condMapEmpty!49348) mapIsEmpty!49348))

(assert (= (and b!1252205 (not condMapEmpty!49348)) mapNonEmpty!49348))

(get-info :version)

(assert (= (and mapNonEmpty!49348 ((_ is ValueCellFull!15096) mapValue!49348)) b!1252204))

(assert (= (and b!1252205 ((_ is ValueCellFull!15096) mapDefault!49348)) b!1252201))

(assert (= start!105070 b!1252205))

(declare-fun m!1152869 () Bool)

(assert (=> start!105070 m!1152869))

(declare-fun m!1152871 () Bool)

(assert (=> start!105070 m!1152871))

(declare-fun m!1152873 () Bool)

(assert (=> start!105070 m!1152873))

(declare-fun m!1152875 () Bool)

(assert (=> b!1252206 m!1152875))

(declare-fun m!1152877 () Bool)

(assert (=> b!1252206 m!1152877))

(declare-fun m!1152879 () Bool)

(assert (=> b!1252206 m!1152879))

(declare-fun m!1152881 () Bool)

(assert (=> b!1252200 m!1152881))

(declare-fun m!1152883 () Bool)

(assert (=> b!1252203 m!1152883))

(declare-fun m!1152885 () Bool)

(assert (=> mapNonEmpty!49348 m!1152885))

(check-sat (not start!105070) tp_is_empty!31719 (not b!1252203) b_and!44613 (not b!1252206) (not b_next!26817) (not mapNonEmpty!49348) (not b!1252200))
(check-sat b_and!44613 (not b_next!26817))
