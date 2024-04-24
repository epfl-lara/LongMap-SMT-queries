; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105174 () Bool)

(assert start!105174)

(declare-fun b_free!26719 () Bool)

(declare-fun b_next!26719 () Bool)

(assert (=> start!105174 (= b_free!26719 (not b_next!26719))))

(declare-fun tp!93653 () Bool)

(declare-fun b_and!44507 () Bool)

(assert (=> start!105174 (= tp!93653 b_and!44507)))

(declare-fun b!1252161 () Bool)

(declare-fun e!711026 () Bool)

(declare-fun e!711030 () Bool)

(assert (=> b!1252161 (= e!711026 (not e!711030))))

(declare-fun res!834824 () Bool)

(assert (=> b!1252161 (=> res!834824 e!711030)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1252161 (= res!834824 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47527 0))(
  ( (V!47528 (val!15873 Int)) )
))
(declare-datatypes ((tuple2!20492 0))(
  ( (tuple2!20493 (_1!10257 (_ BitVec 64)) (_2!10257 V!47527)) )
))
(declare-datatypes ((List!27740 0))(
  ( (Nil!27737) (Cons!27736 (h!28954 tuple2!20492) (t!41207 List!27740)) )
))
(declare-datatypes ((ListLongMap!18373 0))(
  ( (ListLongMap!18374 (toList!9202 List!27740)) )
))
(declare-fun lt!564981 () ListLongMap!18373)

(declare-fun lt!564985 () ListLongMap!18373)

(assert (=> b!1252161 (= lt!564981 lt!564985)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47527)

(declare-datatypes ((Unit!41542 0))(
  ( (Unit!41543) )
))
(declare-fun lt!564982 () Unit!41542)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47527)

(declare-datatypes ((array!80959 0))(
  ( (array!80960 (arr!39040 (Array (_ BitVec 32) (_ BitVec 64))) (size!39577 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80959)

(declare-fun minValueBefore!43 () V!47527)

(declare-datatypes ((ValueCell!15047 0))(
  ( (ValueCellFull!15047 (v!18566 V!47527)) (EmptyCell!15047) )
))
(declare-datatypes ((array!80961 0))(
  ( (array!80962 (arr!39041 (Array (_ BitVec 32) ValueCell!15047)) (size!39578 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80961)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!946 (array!80959 array!80961 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47527 V!47527 V!47527 V!47527 (_ BitVec 32) Int) Unit!41542)

(assert (=> b!1252161 (= lt!564982 (lemmaNoChangeToArrayThenSameMapNoExtras!946 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5632 (array!80959 array!80961 (_ BitVec 32) (_ BitVec 32) V!47527 V!47527 (_ BitVec 32) Int) ListLongMap!18373)

(assert (=> b!1252161 (= lt!564985 (getCurrentListMapNoExtraKeys!5632 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252161 (= lt!564981 (getCurrentListMapNoExtraKeys!5632 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252162 () Bool)

(declare-fun res!834823 () Bool)

(assert (=> b!1252162 (=> (not res!834823) (not e!711026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80959 (_ BitVec 32)) Bool)

(assert (=> b!1252162 (= res!834823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252163 () Bool)

(declare-fun e!711025 () Bool)

(declare-fun tp_is_empty!31621 () Bool)

(assert (=> b!1252163 (= e!711025 tp_is_empty!31621)))

(declare-fun mapNonEmpty!49198 () Bool)

(declare-fun mapRes!49198 () Bool)

(declare-fun tp!93652 () Bool)

(declare-fun e!711031 () Bool)

(assert (=> mapNonEmpty!49198 (= mapRes!49198 (and tp!93652 e!711031))))

(declare-fun mapValue!49198 () ValueCell!15047)

(declare-fun mapRest!49198 () (Array (_ BitVec 32) ValueCell!15047))

(declare-fun mapKey!49198 () (_ BitVec 32))

(assert (=> mapNonEmpty!49198 (= (arr!39041 _values!914) (store mapRest!49198 mapKey!49198 mapValue!49198))))

(declare-fun res!834826 () Bool)

(assert (=> start!105174 (=> (not res!834826) (not e!711026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105174 (= res!834826 (validMask!0 mask!1466))))

(assert (=> start!105174 e!711026))

(assert (=> start!105174 true))

(assert (=> start!105174 tp!93653))

(assert (=> start!105174 tp_is_empty!31621))

(declare-fun array_inv!29897 (array!80959) Bool)

(assert (=> start!105174 (array_inv!29897 _keys!1118)))

(declare-fun e!711028 () Bool)

(declare-fun array_inv!29898 (array!80961) Bool)

(assert (=> start!105174 (and (array_inv!29898 _values!914) e!711028)))

(declare-fun b!1252164 () Bool)

(declare-fun res!834828 () Bool)

(assert (=> b!1252164 (=> (not res!834828) (not e!711026))))

(declare-datatypes ((List!27741 0))(
  ( (Nil!27738) (Cons!27737 (h!28955 (_ BitVec 64)) (t!41208 List!27741)) )
))
(declare-fun arrayNoDuplicates!0 (array!80959 (_ BitVec 32) List!27741) Bool)

(assert (=> b!1252164 (= res!834828 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27738))))

(declare-fun b!1252165 () Bool)

(assert (=> b!1252165 (= e!711031 tp_is_empty!31621)))

(declare-fun mapIsEmpty!49198 () Bool)

(assert (=> mapIsEmpty!49198 mapRes!49198))

(declare-fun b!1252166 () Bool)

(declare-fun e!711029 () Bool)

(assert (=> b!1252166 (= e!711030 e!711029)))

(declare-fun res!834825 () Bool)

(assert (=> b!1252166 (=> res!834825 e!711029)))

(declare-fun lt!564984 () ListLongMap!18373)

(declare-fun contains!7527 (ListLongMap!18373 (_ BitVec 64)) Bool)

(assert (=> b!1252166 (= res!834825 (contains!7527 lt!564984 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4463 (array!80959 array!80961 (_ BitVec 32) (_ BitVec 32) V!47527 V!47527 (_ BitVec 32) Int) ListLongMap!18373)

(assert (=> b!1252166 (= lt!564984 (getCurrentListMap!4463 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252167 () Bool)

(assert (=> b!1252167 (= e!711028 (and e!711025 mapRes!49198))))

(declare-fun condMapEmpty!49198 () Bool)

(declare-fun mapDefault!49198 () ValueCell!15047)

(assert (=> b!1252167 (= condMapEmpty!49198 (= (arr!39041 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15047)) mapDefault!49198)))))

(declare-fun b!1252168 () Bool)

(declare-fun res!834827 () Bool)

(assert (=> b!1252168 (=> (not res!834827) (not e!711026))))

(assert (=> b!1252168 (= res!834827 (and (= (size!39578 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39577 _keys!1118) (size!39578 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252169 () Bool)

(assert (=> b!1252169 (= e!711029 true)))

(declare-fun -!1988 (ListLongMap!18373 (_ BitVec 64)) ListLongMap!18373)

(assert (=> b!1252169 (= (-!1988 lt!564984 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564984)))

(declare-fun lt!564983 () Unit!41542)

(declare-fun removeNotPresentStillSame!98 (ListLongMap!18373 (_ BitVec 64)) Unit!41542)

(assert (=> b!1252169 (= lt!564983 (removeNotPresentStillSame!98 lt!564984 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!105174 res!834826) b!1252168))

(assert (= (and b!1252168 res!834827) b!1252162))

(assert (= (and b!1252162 res!834823) b!1252164))

(assert (= (and b!1252164 res!834828) b!1252161))

(assert (= (and b!1252161 (not res!834824)) b!1252166))

(assert (= (and b!1252166 (not res!834825)) b!1252169))

(assert (= (and b!1252167 condMapEmpty!49198) mapIsEmpty!49198))

(assert (= (and b!1252167 (not condMapEmpty!49198)) mapNonEmpty!49198))

(get-info :version)

(assert (= (and mapNonEmpty!49198 ((_ is ValueCellFull!15047) mapValue!49198)) b!1252165))

(assert (= (and b!1252167 ((_ is ValueCellFull!15047) mapDefault!49198)) b!1252163))

(assert (= start!105174 b!1252167))

(declare-fun m!1153257 () Bool)

(assert (=> mapNonEmpty!49198 m!1153257))

(declare-fun m!1153259 () Bool)

(assert (=> b!1252164 m!1153259))

(declare-fun m!1153261 () Bool)

(assert (=> start!105174 m!1153261))

(declare-fun m!1153263 () Bool)

(assert (=> start!105174 m!1153263))

(declare-fun m!1153265 () Bool)

(assert (=> start!105174 m!1153265))

(declare-fun m!1153267 () Bool)

(assert (=> b!1252169 m!1153267))

(declare-fun m!1153269 () Bool)

(assert (=> b!1252169 m!1153269))

(declare-fun m!1153271 () Bool)

(assert (=> b!1252161 m!1153271))

(declare-fun m!1153273 () Bool)

(assert (=> b!1252161 m!1153273))

(declare-fun m!1153275 () Bool)

(assert (=> b!1252161 m!1153275))

(declare-fun m!1153277 () Bool)

(assert (=> b!1252162 m!1153277))

(declare-fun m!1153279 () Bool)

(assert (=> b!1252166 m!1153279))

(declare-fun m!1153281 () Bool)

(assert (=> b!1252166 m!1153281))

(check-sat (not b!1252166) (not b!1252169) (not start!105174) (not b!1252161) tp_is_empty!31621 (not b!1252164) (not b!1252162) b_and!44507 (not mapNonEmpty!49198) (not b_next!26719))
(check-sat b_and!44507 (not b_next!26719))
