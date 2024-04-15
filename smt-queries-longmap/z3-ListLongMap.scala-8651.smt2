; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105242 () Bool)

(assert start!105242)

(declare-fun b_free!26941 () Bool)

(declare-fun b_next!26941 () Bool)

(assert (=> start!105242 (= b_free!26941 (not b_next!26941))))

(declare-fun tp!94331 () Bool)

(declare-fun b_and!44749 () Bool)

(assert (=> start!105242 (= tp!94331 b_and!44749)))

(declare-fun b!1254019 () Bool)

(declare-fun e!712506 () Bool)

(declare-fun tp_is_empty!31843 () Bool)

(assert (=> b!1254019 (= e!712506 tp_is_empty!31843)))

(declare-fun mapNonEmpty!49543 () Bool)

(declare-fun mapRes!49543 () Bool)

(declare-fun tp!94330 () Bool)

(declare-fun e!712510 () Bool)

(assert (=> mapNonEmpty!49543 (= mapRes!49543 (and tp!94330 e!712510))))

(declare-fun mapKey!49543 () (_ BitVec 32))

(declare-datatypes ((V!47823 0))(
  ( (V!47824 (val!15984 Int)) )
))
(declare-datatypes ((ValueCell!15158 0))(
  ( (ValueCellFull!15158 (v!18682 V!47823)) (EmptyCell!15158) )
))
(declare-fun mapValue!49543 () ValueCell!15158)

(declare-datatypes ((array!81269 0))(
  ( (array!81270 (arr!39196 (Array (_ BitVec 32) ValueCell!15158)) (size!39734 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81269)

(declare-fun mapRest!49543 () (Array (_ BitVec 32) ValueCell!15158))

(assert (=> mapNonEmpty!49543 (= (arr!39196 _values!914) (store mapRest!49543 mapKey!49543 mapValue!49543))))

(declare-fun b!1254020 () Bool)

(declare-fun e!712511 () Bool)

(assert (=> b!1254020 (= e!712511 true)))

(declare-datatypes ((tuple2!20722 0))(
  ( (tuple2!20723 (_1!10372 (_ BitVec 64)) (_2!10372 V!47823)) )
))
(declare-datatypes ((List!27932 0))(
  ( (Nil!27929) (Cons!27928 (h!29137 tuple2!20722) (t!41406 List!27932)) )
))
(declare-datatypes ((ListLongMap!18595 0))(
  ( (ListLongMap!18596 (toList!9313 List!27932)) )
))
(declare-fun lt!566408 () ListLongMap!18595)

(declare-fun lt!566411 () ListLongMap!18595)

(declare-fun -!2007 (ListLongMap!18595 (_ BitVec 64)) ListLongMap!18595)

(assert (=> b!1254020 (= lt!566408 (-!2007 lt!566411 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566406 () ListLongMap!18595)

(declare-fun lt!566409 () ListLongMap!18595)

(assert (=> b!1254020 (= (-!2007 lt!566406 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566409)))

(declare-datatypes ((Unit!41591 0))(
  ( (Unit!41592) )
))
(declare-fun lt!566412 () Unit!41591)

(declare-fun minValueBefore!43 () V!47823)

(declare-fun addThenRemoveForNewKeyIsSame!296 (ListLongMap!18595 (_ BitVec 64) V!47823) Unit!41591)

(assert (=> b!1254020 (= lt!566412 (addThenRemoveForNewKeyIsSame!296 lt!566409 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566410 () ListLongMap!18595)

(declare-fun lt!566413 () ListLongMap!18595)

(assert (=> b!1254020 (and (= lt!566411 lt!566406) (= lt!566410 lt!566413))))

(declare-fun +!4210 (ListLongMap!18595 tuple2!20722) ListLongMap!18595)

(assert (=> b!1254020 (= lt!566406 (+!4210 lt!566409 (tuple2!20723 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47823)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47823)

(declare-datatypes ((array!81271 0))(
  ( (array!81272 (arr!39197 (Array (_ BitVec 32) (_ BitVec 64))) (size!39735 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81271)

(declare-fun getCurrentListMap!4446 (array!81271 array!81269 (_ BitVec 32) (_ BitVec 32) V!47823 V!47823 (_ BitVec 32) Int) ListLongMap!18595)

(assert (=> b!1254020 (= lt!566410 (getCurrentListMap!4446 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254020 (= lt!566411 (getCurrentListMap!4446 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254021 () Bool)

(declare-fun res!836171 () Bool)

(declare-fun e!712508 () Bool)

(assert (=> b!1254021 (=> (not res!836171) (not e!712508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81271 (_ BitVec 32)) Bool)

(assert (=> b!1254021 (= res!836171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254022 () Bool)

(assert (=> b!1254022 (= e!712510 tp_is_empty!31843)))

(declare-fun b!1254023 () Bool)

(assert (=> b!1254023 (= e!712508 (not e!712511))))

(declare-fun res!836170 () Bool)

(assert (=> b!1254023 (=> res!836170 e!712511)))

(assert (=> b!1254023 (= res!836170 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254023 (= lt!566409 lt!566413)))

(declare-fun lt!566407 () Unit!41591)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1034 (array!81271 array!81269 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47823 V!47823 V!47823 V!47823 (_ BitVec 32) Int) Unit!41591)

(assert (=> b!1254023 (= lt!566407 (lemmaNoChangeToArrayThenSameMapNoExtras!1034 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5712 (array!81271 array!81269 (_ BitVec 32) (_ BitVec 32) V!47823 V!47823 (_ BitVec 32) Int) ListLongMap!18595)

(assert (=> b!1254023 (= lt!566413 (getCurrentListMapNoExtraKeys!5712 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254023 (= lt!566409 (getCurrentListMapNoExtraKeys!5712 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254024 () Bool)

(declare-fun res!836167 () Bool)

(assert (=> b!1254024 (=> (not res!836167) (not e!712508))))

(declare-datatypes ((List!27933 0))(
  ( (Nil!27930) (Cons!27929 (h!29138 (_ BitVec 64)) (t!41407 List!27933)) )
))
(declare-fun arrayNoDuplicates!0 (array!81271 (_ BitVec 32) List!27933) Bool)

(assert (=> b!1254024 (= res!836167 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27930))))

(declare-fun b!1254025 () Bool)

(declare-fun res!836168 () Bool)

(assert (=> b!1254025 (=> (not res!836168) (not e!712508))))

(assert (=> b!1254025 (= res!836168 (and (= (size!39734 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39735 _keys!1118) (size!39734 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!836169 () Bool)

(assert (=> start!105242 (=> (not res!836169) (not e!712508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105242 (= res!836169 (validMask!0 mask!1466))))

(assert (=> start!105242 e!712508))

(assert (=> start!105242 true))

(assert (=> start!105242 tp!94331))

(assert (=> start!105242 tp_is_empty!31843))

(declare-fun array_inv!30011 (array!81271) Bool)

(assert (=> start!105242 (array_inv!30011 _keys!1118)))

(declare-fun e!712507 () Bool)

(declare-fun array_inv!30012 (array!81269) Bool)

(assert (=> start!105242 (and (array_inv!30012 _values!914) e!712507)))

(declare-fun b!1254026 () Bool)

(assert (=> b!1254026 (= e!712507 (and e!712506 mapRes!49543))))

(declare-fun condMapEmpty!49543 () Bool)

(declare-fun mapDefault!49543 () ValueCell!15158)

(assert (=> b!1254026 (= condMapEmpty!49543 (= (arr!39196 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15158)) mapDefault!49543)))))

(declare-fun mapIsEmpty!49543 () Bool)

(assert (=> mapIsEmpty!49543 mapRes!49543))

(assert (= (and start!105242 res!836169) b!1254025))

(assert (= (and b!1254025 res!836168) b!1254021))

(assert (= (and b!1254021 res!836171) b!1254024))

(assert (= (and b!1254024 res!836167) b!1254023))

(assert (= (and b!1254023 (not res!836170)) b!1254020))

(assert (= (and b!1254026 condMapEmpty!49543) mapIsEmpty!49543))

(assert (= (and b!1254026 (not condMapEmpty!49543)) mapNonEmpty!49543))

(get-info :version)

(assert (= (and mapNonEmpty!49543 ((_ is ValueCellFull!15158) mapValue!49543)) b!1254022))

(assert (= (and b!1254026 ((_ is ValueCellFull!15158) mapDefault!49543)) b!1254019))

(assert (= start!105242 b!1254026))

(declare-fun m!1154229 () Bool)

(assert (=> b!1254024 m!1154229))

(declare-fun m!1154231 () Bool)

(assert (=> mapNonEmpty!49543 m!1154231))

(declare-fun m!1154233 () Bool)

(assert (=> b!1254021 m!1154233))

(declare-fun m!1154235 () Bool)

(assert (=> b!1254020 m!1154235))

(declare-fun m!1154237 () Bool)

(assert (=> b!1254020 m!1154237))

(declare-fun m!1154239 () Bool)

(assert (=> b!1254020 m!1154239))

(declare-fun m!1154241 () Bool)

(assert (=> b!1254020 m!1154241))

(declare-fun m!1154243 () Bool)

(assert (=> b!1254020 m!1154243))

(declare-fun m!1154245 () Bool)

(assert (=> b!1254020 m!1154245))

(declare-fun m!1154247 () Bool)

(assert (=> b!1254023 m!1154247))

(declare-fun m!1154249 () Bool)

(assert (=> b!1254023 m!1154249))

(declare-fun m!1154251 () Bool)

(assert (=> b!1254023 m!1154251))

(declare-fun m!1154253 () Bool)

(assert (=> start!105242 m!1154253))

(declare-fun m!1154255 () Bool)

(assert (=> start!105242 m!1154255))

(declare-fun m!1154257 () Bool)

(assert (=> start!105242 m!1154257))

(check-sat (not b!1254023) b_and!44749 tp_is_empty!31843 (not b_next!26941) (not start!105242) (not mapNonEmpty!49543) (not b!1254024) (not b!1254020) (not b!1254021))
(check-sat b_and!44749 (not b_next!26941))
