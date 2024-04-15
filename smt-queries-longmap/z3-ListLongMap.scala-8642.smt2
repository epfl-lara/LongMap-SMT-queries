; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105166 () Bool)

(assert start!105166)

(declare-fun b_free!26887 () Bool)

(declare-fun b_next!26887 () Bool)

(assert (=> start!105166 (= b_free!26887 (not b_next!26887))))

(declare-fun tp!94166 () Bool)

(declare-fun b_and!44683 () Bool)

(assert (=> start!105166 (= tp!94166 b_and!44683)))

(declare-fun b!1253187 () Bool)

(declare-fun e!711903 () Bool)

(declare-fun e!711906 () Bool)

(declare-fun mapRes!49459 () Bool)

(assert (=> b!1253187 (= e!711903 (and e!711906 mapRes!49459))))

(declare-fun condMapEmpty!49459 () Bool)

(declare-datatypes ((V!47751 0))(
  ( (V!47752 (val!15957 Int)) )
))
(declare-datatypes ((ValueCell!15131 0))(
  ( (ValueCellFull!15131 (v!18654 V!47751)) (EmptyCell!15131) )
))
(declare-datatypes ((array!81165 0))(
  ( (array!81166 (arr!39145 (Array (_ BitVec 32) ValueCell!15131)) (size!39683 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81165)

(declare-fun mapDefault!49459 () ValueCell!15131)

(assert (=> b!1253187 (= condMapEmpty!49459 (= (arr!39145 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15131)) mapDefault!49459)))))

(declare-fun mapNonEmpty!49459 () Bool)

(declare-fun tp!94165 () Bool)

(declare-fun e!711905 () Bool)

(assert (=> mapNonEmpty!49459 (= mapRes!49459 (and tp!94165 e!711905))))

(declare-fun mapRest!49459 () (Array (_ BitVec 32) ValueCell!15131))

(declare-fun mapValue!49459 () ValueCell!15131)

(declare-fun mapKey!49459 () (_ BitVec 32))

(assert (=> mapNonEmpty!49459 (= (arr!39145 _values!914) (store mapRest!49459 mapKey!49459 mapValue!49459))))

(declare-fun b!1253188 () Bool)

(declare-fun tp_is_empty!31789 () Bool)

(assert (=> b!1253188 (= e!711905 tp_is_empty!31789)))

(declare-fun res!835681 () Bool)

(declare-fun e!711904 () Bool)

(assert (=> start!105166 (=> (not res!835681) (not e!711904))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105166 (= res!835681 (validMask!0 mask!1466))))

(assert (=> start!105166 e!711904))

(assert (=> start!105166 true))

(assert (=> start!105166 tp!94166))

(assert (=> start!105166 tp_is_empty!31789))

(declare-datatypes ((array!81167 0))(
  ( (array!81168 (arr!39146 (Array (_ BitVec 32) (_ BitVec 64))) (size!39684 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81167)

(declare-fun array_inv!29975 (array!81167) Bool)

(assert (=> start!105166 (array_inv!29975 _keys!1118)))

(declare-fun array_inv!29976 (array!81165) Bool)

(assert (=> start!105166 (and (array_inv!29976 _values!914) e!711903)))

(declare-fun b!1253189 () Bool)

(declare-fun res!835684 () Bool)

(assert (=> b!1253189 (=> (not res!835684) (not e!711904))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1253189 (= res!835684 (and (= (size!39683 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39684 _keys!1118) (size!39683 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253190 () Bool)

(declare-fun e!711901 () Bool)

(assert (=> b!1253190 (= e!711901 true)))

(declare-datatypes ((tuple2!20678 0))(
  ( (tuple2!20679 (_1!10350 (_ BitVec 64)) (_2!10350 V!47751)) )
))
(declare-datatypes ((List!27894 0))(
  ( (Nil!27891) (Cons!27890 (h!29099 tuple2!20678) (t!41366 List!27894)) )
))
(declare-datatypes ((ListLongMap!18551 0))(
  ( (ListLongMap!18552 (toList!9291 List!27894)) )
))
(declare-fun lt!565621 () ListLongMap!18551)

(declare-fun lt!565623 () ListLongMap!18551)

(declare-fun -!1989 (ListLongMap!18551 (_ BitVec 64)) ListLongMap!18551)

(assert (=> b!1253190 (= lt!565621 (-!1989 lt!565623 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!565622 () ListLongMap!18551)

(declare-fun lt!565626 () ListLongMap!18551)

(assert (=> b!1253190 (= (-!1989 lt!565622 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565626)))

(declare-datatypes ((Unit!41545 0))(
  ( (Unit!41546) )
))
(declare-fun lt!565627 () Unit!41545)

(declare-fun minValueBefore!43 () V!47751)

(declare-fun addThenRemoveForNewKeyIsSame!278 (ListLongMap!18551 (_ BitVec 64) V!47751) Unit!41545)

(assert (=> b!1253190 (= lt!565627 (addThenRemoveForNewKeyIsSame!278 lt!565626 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!565624 () ListLongMap!18551)

(declare-fun lt!565620 () ListLongMap!18551)

(assert (=> b!1253190 (and (= lt!565623 lt!565622) (= lt!565624 lt!565620))))

(declare-fun +!4192 (ListLongMap!18551 tuple2!20678) ListLongMap!18551)

(assert (=> b!1253190 (= lt!565622 (+!4192 lt!565626 (tuple2!20679 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47751)

(declare-fun zeroValue!871 () V!47751)

(declare-fun getCurrentListMap!4428 (array!81167 array!81165 (_ BitVec 32) (_ BitVec 32) V!47751 V!47751 (_ BitVec 32) Int) ListLongMap!18551)

(assert (=> b!1253190 (= lt!565624 (getCurrentListMap!4428 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253190 (= lt!565623 (getCurrentListMap!4428 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253191 () Bool)

(assert (=> b!1253191 (= e!711906 tp_is_empty!31789)))

(declare-fun b!1253192 () Bool)

(assert (=> b!1253192 (= e!711904 (not e!711901))))

(declare-fun res!835683 () Bool)

(assert (=> b!1253192 (=> res!835683 e!711901)))

(assert (=> b!1253192 (= res!835683 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1253192 (= lt!565626 lt!565620)))

(declare-fun lt!565625 () Unit!41545)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1015 (array!81167 array!81165 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47751 V!47751 V!47751 V!47751 (_ BitVec 32) Int) Unit!41545)

(assert (=> b!1253192 (= lt!565625 (lemmaNoChangeToArrayThenSameMapNoExtras!1015 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5693 (array!81167 array!81165 (_ BitVec 32) (_ BitVec 32) V!47751 V!47751 (_ BitVec 32) Int) ListLongMap!18551)

(assert (=> b!1253192 (= lt!565620 (getCurrentListMapNoExtraKeys!5693 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253192 (= lt!565626 (getCurrentListMapNoExtraKeys!5693 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253193 () Bool)

(declare-fun res!835682 () Bool)

(assert (=> b!1253193 (=> (not res!835682) (not e!711904))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81167 (_ BitVec 32)) Bool)

(assert (=> b!1253193 (= res!835682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49459 () Bool)

(assert (=> mapIsEmpty!49459 mapRes!49459))

(declare-fun b!1253194 () Bool)

(declare-fun res!835680 () Bool)

(assert (=> b!1253194 (=> (not res!835680) (not e!711904))))

(declare-datatypes ((List!27895 0))(
  ( (Nil!27892) (Cons!27891 (h!29100 (_ BitVec 64)) (t!41367 List!27895)) )
))
(declare-fun arrayNoDuplicates!0 (array!81167 (_ BitVec 32) List!27895) Bool)

(assert (=> b!1253194 (= res!835680 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27892))))

(assert (= (and start!105166 res!835681) b!1253189))

(assert (= (and b!1253189 res!835684) b!1253193))

(assert (= (and b!1253193 res!835682) b!1253194))

(assert (= (and b!1253194 res!835680) b!1253192))

(assert (= (and b!1253192 (not res!835683)) b!1253190))

(assert (= (and b!1253187 condMapEmpty!49459) mapIsEmpty!49459))

(assert (= (and b!1253187 (not condMapEmpty!49459)) mapNonEmpty!49459))

(get-info :version)

(assert (= (and mapNonEmpty!49459 ((_ is ValueCellFull!15131) mapValue!49459)) b!1253188))

(assert (= (and b!1253187 ((_ is ValueCellFull!15131) mapDefault!49459)) b!1253191))

(assert (= start!105166 b!1253187))

(declare-fun m!1153235 () Bool)

(assert (=> b!1253190 m!1153235))

(declare-fun m!1153237 () Bool)

(assert (=> b!1253190 m!1153237))

(declare-fun m!1153239 () Bool)

(assert (=> b!1253190 m!1153239))

(declare-fun m!1153241 () Bool)

(assert (=> b!1253190 m!1153241))

(declare-fun m!1153243 () Bool)

(assert (=> b!1253190 m!1153243))

(declare-fun m!1153245 () Bool)

(assert (=> b!1253190 m!1153245))

(declare-fun m!1153247 () Bool)

(assert (=> b!1253193 m!1153247))

(declare-fun m!1153249 () Bool)

(assert (=> mapNonEmpty!49459 m!1153249))

(declare-fun m!1153251 () Bool)

(assert (=> start!105166 m!1153251))

(declare-fun m!1153253 () Bool)

(assert (=> start!105166 m!1153253))

(declare-fun m!1153255 () Bool)

(assert (=> start!105166 m!1153255))

(declare-fun m!1153257 () Bool)

(assert (=> b!1253194 m!1153257))

(declare-fun m!1153259 () Bool)

(assert (=> b!1253192 m!1153259))

(declare-fun m!1153261 () Bool)

(assert (=> b!1253192 m!1153261))

(declare-fun m!1153263 () Bool)

(assert (=> b!1253192 m!1153263))

(check-sat tp_is_empty!31789 (not mapNonEmpty!49459) (not start!105166) (not b!1253192) (not b_next!26887) (not b!1253190) (not b!1253193) b_and!44683 (not b!1253194))
(check-sat b_and!44683 (not b_next!26887))
