; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105440 () Bool)

(assert start!105440)

(declare-fun b_free!27103 () Bool)

(declare-fun b_next!27103 () Bool)

(assert (=> start!105440 (= b_free!27103 (not b_next!27103))))

(declare-fun tp!94822 () Bool)

(declare-fun b_and!44931 () Bool)

(assert (=> start!105440 (= tp!94822 b_and!44931)))

(declare-fun b!1256225 () Bool)

(declare-fun res!837492 () Bool)

(declare-fun e!714135 () Bool)

(assert (=> b!1256225 (=> (not res!837492) (not e!714135))))

(declare-datatypes ((array!81577 0))(
  ( (array!81578 (arr!39348 (Array (_ BitVec 32) (_ BitVec 64))) (size!39886 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81577)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81577 (_ BitVec 32)) Bool)

(assert (=> b!1256225 (= res!837492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256226 () Bool)

(declare-fun e!714133 () Bool)

(declare-fun tp_is_empty!32005 () Bool)

(assert (=> b!1256226 (= e!714133 tp_is_empty!32005)))

(declare-fun b!1256227 () Bool)

(declare-fun e!714132 () Bool)

(declare-fun e!714137 () Bool)

(assert (=> b!1256227 (= e!714132 e!714137)))

(declare-fun res!837491 () Bool)

(assert (=> b!1256227 (=> res!837491 e!714137)))

(declare-datatypes ((V!48039 0))(
  ( (V!48040 (val!16065 Int)) )
))
(declare-datatypes ((tuple2!20834 0))(
  ( (tuple2!20835 (_1!10428 (_ BitVec 64)) (_2!10428 V!48039)) )
))
(declare-datatypes ((List!28043 0))(
  ( (Nil!28040) (Cons!28039 (h!29248 tuple2!20834) (t!41521 List!28043)) )
))
(declare-datatypes ((ListLongMap!18707 0))(
  ( (ListLongMap!18708 (toList!9369 List!28043)) )
))
(declare-fun lt!567869 () ListLongMap!18707)

(declare-fun contains!7520 (ListLongMap!18707 (_ BitVec 64)) Bool)

(assert (=> b!1256227 (= res!837491 (contains!7520 lt!567869 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48039)

(declare-datatypes ((ValueCell!15239 0))(
  ( (ValueCellFull!15239 (v!18764 V!48039)) (EmptyCell!15239) )
))
(declare-datatypes ((array!81579 0))(
  ( (array!81580 (arr!39349 (Array (_ BitVec 32) ValueCell!15239)) (size!39887 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81579)

(declare-fun minValueBefore!43 () V!48039)

(declare-fun getCurrentListMap!4480 (array!81577 array!81579 (_ BitVec 32) (_ BitVec 32) V!48039 V!48039 (_ BitVec 32) Int) ListLongMap!18707)

(assert (=> b!1256227 (= lt!567869 (getCurrentListMap!4480 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!837490 () Bool)

(assert (=> start!105440 (=> (not res!837490) (not e!714135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105440 (= res!837490 (validMask!0 mask!1466))))

(assert (=> start!105440 e!714135))

(assert (=> start!105440 true))

(assert (=> start!105440 tp!94822))

(assert (=> start!105440 tp_is_empty!32005))

(declare-fun array_inv!30111 (array!81577) Bool)

(assert (=> start!105440 (array_inv!30111 _keys!1118)))

(declare-fun e!714131 () Bool)

(declare-fun array_inv!30112 (array!81579) Bool)

(assert (=> start!105440 (and (array_inv!30112 _values!914) e!714131)))

(declare-fun b!1256228 () Bool)

(declare-fun res!837489 () Bool)

(assert (=> b!1256228 (=> (not res!837489) (not e!714135))))

(declare-datatypes ((List!28044 0))(
  ( (Nil!28041) (Cons!28040 (h!29249 (_ BitVec 64)) (t!41522 List!28044)) )
))
(declare-fun arrayNoDuplicates!0 (array!81577 (_ BitVec 32) List!28044) Bool)

(assert (=> b!1256228 (= res!837489 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28041))))

(declare-fun b!1256229 () Bool)

(declare-fun e!714134 () Bool)

(declare-fun mapRes!49792 () Bool)

(assert (=> b!1256229 (= e!714131 (and e!714134 mapRes!49792))))

(declare-fun condMapEmpty!49792 () Bool)

(declare-fun mapDefault!49792 () ValueCell!15239)

(assert (=> b!1256229 (= condMapEmpty!49792 (= (arr!39349 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15239)) mapDefault!49792)))))

(declare-fun b!1256230 () Bool)

(assert (=> b!1256230 (= e!714135 (not e!714132))))

(declare-fun res!837488 () Bool)

(assert (=> b!1256230 (=> res!837488 e!714132)))

(assert (=> b!1256230 (= res!837488 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!567867 () ListLongMap!18707)

(declare-fun lt!567868 () ListLongMap!18707)

(assert (=> b!1256230 (= lt!567867 lt!567868)))

(declare-datatypes ((Unit!41695 0))(
  ( (Unit!41696) )
))
(declare-fun lt!567866 () Unit!41695)

(declare-fun minValueAfter!43 () V!48039)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1078 (array!81577 array!81579 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48039 V!48039 V!48039 V!48039 (_ BitVec 32) Int) Unit!41695)

(assert (=> b!1256230 (= lt!567866 (lemmaNoChangeToArrayThenSameMapNoExtras!1078 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5756 (array!81577 array!81579 (_ BitVec 32) (_ BitVec 32) V!48039 V!48039 (_ BitVec 32) Int) ListLongMap!18707)

(assert (=> b!1256230 (= lt!567868 (getCurrentListMapNoExtraKeys!5756 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256230 (= lt!567867 (getCurrentListMapNoExtraKeys!5756 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49792 () Bool)

(declare-fun tp!94823 () Bool)

(assert (=> mapNonEmpty!49792 (= mapRes!49792 (and tp!94823 e!714133))))

(declare-fun mapRest!49792 () (Array (_ BitVec 32) ValueCell!15239))

(declare-fun mapValue!49792 () ValueCell!15239)

(declare-fun mapKey!49792 () (_ BitVec 32))

(assert (=> mapNonEmpty!49792 (= (arr!39349 _values!914) (store mapRest!49792 mapKey!49792 mapValue!49792))))

(declare-fun mapIsEmpty!49792 () Bool)

(assert (=> mapIsEmpty!49792 mapRes!49792))

(declare-fun b!1256231 () Bool)

(assert (=> b!1256231 (= e!714134 tp_is_empty!32005)))

(declare-fun b!1256232 () Bool)

(assert (=> b!1256232 (= e!714137 (bvsle #b00000000000000000000000000000000 (size!39886 _keys!1118)))))

(declare-fun -!2036 (ListLongMap!18707 (_ BitVec 64)) ListLongMap!18707)

(assert (=> b!1256232 (= (-!2036 lt!567869 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567869)))

(declare-fun lt!567865 () Unit!41695)

(declare-fun removeNotPresentStillSame!131 (ListLongMap!18707 (_ BitVec 64)) Unit!41695)

(assert (=> b!1256232 (= lt!567865 (removeNotPresentStillSame!131 lt!567869 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256233 () Bool)

(declare-fun res!837493 () Bool)

(assert (=> b!1256233 (=> (not res!837493) (not e!714135))))

(assert (=> b!1256233 (= res!837493 (and (= (size!39887 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39886 _keys!1118) (size!39887 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105440 res!837490) b!1256233))

(assert (= (and b!1256233 res!837493) b!1256225))

(assert (= (and b!1256225 res!837492) b!1256228))

(assert (= (and b!1256228 res!837489) b!1256230))

(assert (= (and b!1256230 (not res!837488)) b!1256227))

(assert (= (and b!1256227 (not res!837491)) b!1256232))

(assert (= (and b!1256229 condMapEmpty!49792) mapIsEmpty!49792))

(assert (= (and b!1256229 (not condMapEmpty!49792)) mapNonEmpty!49792))

(get-info :version)

(assert (= (and mapNonEmpty!49792 ((_ is ValueCellFull!15239) mapValue!49792)) b!1256226))

(assert (= (and b!1256229 ((_ is ValueCellFull!15239) mapDefault!49792)) b!1256231))

(assert (= start!105440 b!1256229))

(declare-fun m!1156465 () Bool)

(assert (=> mapNonEmpty!49792 m!1156465))

(declare-fun m!1156467 () Bool)

(assert (=> b!1256227 m!1156467))

(declare-fun m!1156469 () Bool)

(assert (=> b!1256227 m!1156469))

(declare-fun m!1156471 () Bool)

(assert (=> b!1256230 m!1156471))

(declare-fun m!1156473 () Bool)

(assert (=> b!1256230 m!1156473))

(declare-fun m!1156475 () Bool)

(assert (=> b!1256230 m!1156475))

(declare-fun m!1156477 () Bool)

(assert (=> start!105440 m!1156477))

(declare-fun m!1156479 () Bool)

(assert (=> start!105440 m!1156479))

(declare-fun m!1156481 () Bool)

(assert (=> start!105440 m!1156481))

(declare-fun m!1156483 () Bool)

(assert (=> b!1256225 m!1156483))

(declare-fun m!1156485 () Bool)

(assert (=> b!1256228 m!1156485))

(declare-fun m!1156487 () Bool)

(assert (=> b!1256232 m!1156487))

(declare-fun m!1156489 () Bool)

(assert (=> b!1256232 m!1156489))

(check-sat (not b!1256230) (not start!105440) b_and!44931 tp_is_empty!32005 (not b!1256227) (not mapNonEmpty!49792) (not b!1256228) (not b!1256225) (not b!1256232) (not b_next!27103))
(check-sat b_and!44931 (not b_next!27103))
(get-model)

(declare-fun b!1256296 () Bool)

(declare-fun e!714188 () Bool)

(declare-fun e!714186 () Bool)

(assert (=> b!1256296 (= e!714188 e!714186)))

(declare-fun lt!567907 () (_ BitVec 64))

(assert (=> b!1256296 (= lt!567907 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567906 () Unit!41695)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81577 (_ BitVec 64) (_ BitVec 32)) Unit!41695)

(assert (=> b!1256296 (= lt!567906 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!567907 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1256296 (arrayContainsKey!0 _keys!1118 lt!567907 #b00000000000000000000000000000000)))

(declare-fun lt!567908 () Unit!41695)

(assert (=> b!1256296 (= lt!567908 lt!567906)))

(declare-fun res!837535 () Bool)

(declare-datatypes ((SeekEntryResult!9965 0))(
  ( (MissingZero!9965 (index!42231 (_ BitVec 32))) (Found!9965 (index!42232 (_ BitVec 32))) (Intermediate!9965 (undefined!10777 Bool) (index!42233 (_ BitVec 32)) (x!110629 (_ BitVec 32))) (Undefined!9965) (MissingVacant!9965 (index!42234 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81577 (_ BitVec 32)) SeekEntryResult!9965)

(assert (=> b!1256296 (= res!837535 (= (seekEntryOrOpen!0 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9965 #b00000000000000000000000000000000)))))

(assert (=> b!1256296 (=> (not res!837535) (not e!714186))))

(declare-fun b!1256297 () Bool)

(declare-fun e!714187 () Bool)

(assert (=> b!1256297 (= e!714187 e!714188)))

(declare-fun c!122393 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1256297 (= c!122393 (validKeyInArray!0 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1256298 () Bool)

(declare-fun call!61761 () Bool)

(assert (=> b!1256298 (= e!714188 call!61761)))

(declare-fun bm!61758 () Bool)

(assert (=> bm!61758 (= call!61761 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun d!138053 () Bool)

(declare-fun res!837534 () Bool)

(assert (=> d!138053 (=> res!837534 e!714187)))

(assert (=> d!138053 (= res!837534 (bvsge #b00000000000000000000000000000000 (size!39886 _keys!1118)))))

(assert (=> d!138053 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!714187)))

(declare-fun b!1256299 () Bool)

(assert (=> b!1256299 (= e!714186 call!61761)))

(assert (= (and d!138053 (not res!837534)) b!1256297))

(assert (= (and b!1256297 c!122393) b!1256296))

(assert (= (and b!1256297 (not c!122393)) b!1256298))

(assert (= (and b!1256296 res!837535) b!1256299))

(assert (= (or b!1256299 b!1256298) bm!61758))

(declare-fun m!1156543 () Bool)

(assert (=> b!1256296 m!1156543))

(declare-fun m!1156545 () Bool)

(assert (=> b!1256296 m!1156545))

(declare-fun m!1156547 () Bool)

(assert (=> b!1256296 m!1156547))

(assert (=> b!1256296 m!1156543))

(declare-fun m!1156549 () Bool)

(assert (=> b!1256296 m!1156549))

(assert (=> b!1256297 m!1156543))

(assert (=> b!1256297 m!1156543))

(declare-fun m!1156551 () Bool)

(assert (=> b!1256297 m!1156551))

(declare-fun m!1156553 () Bool)

(assert (=> bm!61758 m!1156553))

(assert (=> b!1256225 d!138053))

(declare-fun d!138055 () Bool)

(assert (=> d!138055 (= (getCurrentListMapNoExtraKeys!5756 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5756 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567911 () Unit!41695)

(declare-fun choose!1867 (array!81577 array!81579 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48039 V!48039 V!48039 V!48039 (_ BitVec 32) Int) Unit!41695)

(assert (=> d!138055 (= lt!567911 (choose!1867 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138055 (validMask!0 mask!1466)))

(assert (=> d!138055 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1078 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567911)))

(declare-fun bs!35491 () Bool)

(assert (= bs!35491 d!138055))

(assert (=> bs!35491 m!1156475))

(assert (=> bs!35491 m!1156473))

(declare-fun m!1156555 () Bool)

(assert (=> bs!35491 m!1156555))

(assert (=> bs!35491 m!1156477))

(assert (=> b!1256230 d!138055))

(declare-fun b!1256324 () Bool)

(declare-fun e!714205 () ListLongMap!18707)

(assert (=> b!1256324 (= e!714205 (ListLongMap!18708 Nil!28040))))

(declare-fun b!1256325 () Bool)

(declare-fun lt!567926 () ListLongMap!18707)

(declare-fun e!714208 () Bool)

(assert (=> b!1256325 (= e!714208 (= lt!567926 (getCurrentListMapNoExtraKeys!5756 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1256326 () Bool)

(declare-fun e!714204 () Bool)

(assert (=> b!1256326 (= e!714204 (validKeyInArray!0 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1256326 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!138057 () Bool)

(declare-fun e!714209 () Bool)

(assert (=> d!138057 e!714209))

(declare-fun res!837544 () Bool)

(assert (=> d!138057 (=> (not res!837544) (not e!714209))))

(assert (=> d!138057 (= res!837544 (not (contains!7520 lt!567926 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138057 (= lt!567926 e!714205)))

(declare-fun c!122402 () Bool)

(assert (=> d!138057 (= c!122402 (bvsge #b00000000000000000000000000000000 (size!39886 _keys!1118)))))

(assert (=> d!138057 (validMask!0 mask!1466)))

(assert (=> d!138057 (= (getCurrentListMapNoExtraKeys!5756 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567926)))

(declare-fun b!1256327 () Bool)

(declare-fun e!714206 () ListLongMap!18707)

(declare-fun call!61764 () ListLongMap!18707)

(assert (=> b!1256327 (= e!714206 call!61764)))

(declare-fun b!1256328 () Bool)

(declare-fun isEmpty!1036 (ListLongMap!18707) Bool)

(assert (=> b!1256328 (= e!714208 (isEmpty!1036 lt!567926))))

(declare-fun b!1256329 () Bool)

(declare-fun res!837545 () Bool)

(assert (=> b!1256329 (=> (not res!837545) (not e!714209))))

(assert (=> b!1256329 (= res!837545 (not (contains!7520 lt!567926 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1256330 () Bool)

(declare-fun e!714203 () Bool)

(declare-fun e!714207 () Bool)

(assert (=> b!1256330 (= e!714203 e!714207)))

(assert (=> b!1256330 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39886 _keys!1118)))))

(declare-fun res!837546 () Bool)

(assert (=> b!1256330 (= res!837546 (contains!7520 lt!567926 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1256330 (=> (not res!837546) (not e!714207))))

(declare-fun b!1256331 () Bool)

(assert (=> b!1256331 (= e!714203 e!714208)))

(declare-fun c!122403 () Bool)

(assert (=> b!1256331 (= c!122403 (bvslt #b00000000000000000000000000000000 (size!39886 _keys!1118)))))

(declare-fun b!1256332 () Bool)

(assert (=> b!1256332 (= e!714205 e!714206)))

(declare-fun c!122404 () Bool)

(assert (=> b!1256332 (= c!122404 (validKeyInArray!0 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61761 () Bool)

(assert (=> bm!61761 (= call!61764 (getCurrentListMapNoExtraKeys!5756 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1256333 () Bool)

(assert (=> b!1256333 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39886 _keys!1118)))))

(assert (=> b!1256333 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39887 _values!914)))))

(declare-fun apply!981 (ListLongMap!18707 (_ BitVec 64)) V!48039)

(declare-fun get!20142 (ValueCell!15239 V!48039) V!48039)

(declare-fun dynLambda!3411 (Int (_ BitVec 64)) V!48039)

(assert (=> b!1256333 (= e!714207 (= (apply!981 lt!567926 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000)) (get!20142 (select (arr!39349 _values!914) #b00000000000000000000000000000000) (dynLambda!3411 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1256334 () Bool)

(assert (=> b!1256334 (= e!714209 e!714203)))

(declare-fun c!122405 () Bool)

(assert (=> b!1256334 (= c!122405 e!714204)))

(declare-fun res!837547 () Bool)

(assert (=> b!1256334 (=> (not res!837547) (not e!714204))))

(assert (=> b!1256334 (= res!837547 (bvslt #b00000000000000000000000000000000 (size!39886 _keys!1118)))))

(declare-fun b!1256335 () Bool)

(declare-fun lt!567929 () Unit!41695)

(declare-fun lt!567932 () Unit!41695)

(assert (=> b!1256335 (= lt!567929 lt!567932)))

(declare-fun lt!567928 () (_ BitVec 64))

(declare-fun lt!567927 () ListLongMap!18707)

(declare-fun lt!567930 () (_ BitVec 64))

(declare-fun lt!567931 () V!48039)

(declare-fun +!4226 (ListLongMap!18707 tuple2!20834) ListLongMap!18707)

(assert (=> b!1256335 (not (contains!7520 (+!4226 lt!567927 (tuple2!20835 lt!567928 lt!567931)) lt!567930))))

(declare-fun addStillNotContains!317 (ListLongMap!18707 (_ BitVec 64) V!48039 (_ BitVec 64)) Unit!41695)

(assert (=> b!1256335 (= lt!567932 (addStillNotContains!317 lt!567927 lt!567928 lt!567931 lt!567930))))

(assert (=> b!1256335 (= lt!567930 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1256335 (= lt!567931 (get!20142 (select (arr!39349 _values!914) #b00000000000000000000000000000000) (dynLambda!3411 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1256335 (= lt!567928 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1256335 (= lt!567927 call!61764)))

(assert (=> b!1256335 (= e!714206 (+!4226 call!61764 (tuple2!20835 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000) (get!20142 (select (arr!39349 _values!914) #b00000000000000000000000000000000) (dynLambda!3411 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!138057 c!122402) b!1256324))

(assert (= (and d!138057 (not c!122402)) b!1256332))

(assert (= (and b!1256332 c!122404) b!1256335))

(assert (= (and b!1256332 (not c!122404)) b!1256327))

(assert (= (or b!1256335 b!1256327) bm!61761))

(assert (= (and d!138057 res!837544) b!1256329))

(assert (= (and b!1256329 res!837545) b!1256334))

(assert (= (and b!1256334 res!837547) b!1256326))

(assert (= (and b!1256334 c!122405) b!1256330))

(assert (= (and b!1256334 (not c!122405)) b!1256331))

(assert (= (and b!1256330 res!837546) b!1256333))

(assert (= (and b!1256331 c!122403) b!1256325))

(assert (= (and b!1256331 (not c!122403)) b!1256328))

(declare-fun b_lambda!22657 () Bool)

(assert (=> (not b_lambda!22657) (not b!1256333)))

(declare-fun t!41526 () Bool)

(declare-fun tb!11295 () Bool)

(assert (=> (and start!105440 (= defaultEntry!922 defaultEntry!922) t!41526) tb!11295))

(declare-fun result!23309 () Bool)

(assert (=> tb!11295 (= result!23309 tp_is_empty!32005)))

(assert (=> b!1256333 t!41526))

(declare-fun b_and!44937 () Bool)

(assert (= b_and!44931 (and (=> t!41526 result!23309) b_and!44937)))

(declare-fun b_lambda!22659 () Bool)

(assert (=> (not b_lambda!22659) (not b!1256335)))

(assert (=> b!1256335 t!41526))

(declare-fun b_and!44939 () Bool)

(assert (= b_and!44937 (and (=> t!41526 result!23309) b_and!44939)))

(assert (=> b!1256335 m!1156543))

(declare-fun m!1156557 () Bool)

(assert (=> b!1256335 m!1156557))

(declare-fun m!1156559 () Bool)

(assert (=> b!1256335 m!1156559))

(declare-fun m!1156561 () Bool)

(assert (=> b!1256335 m!1156561))

(declare-fun m!1156563 () Bool)

(assert (=> b!1256335 m!1156563))

(declare-fun m!1156565 () Bool)

(assert (=> b!1256335 m!1156565))

(declare-fun m!1156567 () Bool)

(assert (=> b!1256335 m!1156567))

(assert (=> b!1256335 m!1156557))

(assert (=> b!1256335 m!1156565))

(assert (=> b!1256335 m!1156559))

(declare-fun m!1156569 () Bool)

(assert (=> b!1256335 m!1156569))

(assert (=> b!1256333 m!1156543))

(assert (=> b!1256333 m!1156557))

(assert (=> b!1256333 m!1156559))

(assert (=> b!1256333 m!1156561))

(assert (=> b!1256333 m!1156543))

(declare-fun m!1156571 () Bool)

(assert (=> b!1256333 m!1156571))

(assert (=> b!1256333 m!1156557))

(assert (=> b!1256333 m!1156559))

(declare-fun m!1156573 () Bool)

(assert (=> b!1256325 m!1156573))

(assert (=> b!1256326 m!1156543))

(assert (=> b!1256326 m!1156543))

(assert (=> b!1256326 m!1156551))

(declare-fun m!1156575 () Bool)

(assert (=> b!1256329 m!1156575))

(declare-fun m!1156577 () Bool)

(assert (=> b!1256328 m!1156577))

(assert (=> b!1256332 m!1156543))

(assert (=> b!1256332 m!1156543))

(assert (=> b!1256332 m!1156551))

(declare-fun m!1156579 () Bool)

(assert (=> d!138057 m!1156579))

(assert (=> d!138057 m!1156477))

(assert (=> bm!61761 m!1156573))

(assert (=> b!1256330 m!1156543))

(assert (=> b!1256330 m!1156543))

(declare-fun m!1156581 () Bool)

(assert (=> b!1256330 m!1156581))

(assert (=> b!1256230 d!138057))

(declare-fun b!1256338 () Bool)

(declare-fun e!714212 () ListLongMap!18707)

(assert (=> b!1256338 (= e!714212 (ListLongMap!18708 Nil!28040))))

(declare-fun lt!567933 () ListLongMap!18707)

(declare-fun e!714215 () Bool)

(declare-fun b!1256339 () Bool)

(assert (=> b!1256339 (= e!714215 (= lt!567933 (getCurrentListMapNoExtraKeys!5756 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1256340 () Bool)

(declare-fun e!714211 () Bool)

(assert (=> b!1256340 (= e!714211 (validKeyInArray!0 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1256340 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!138059 () Bool)

(declare-fun e!714216 () Bool)

(assert (=> d!138059 e!714216))

(declare-fun res!837548 () Bool)

(assert (=> d!138059 (=> (not res!837548) (not e!714216))))

(assert (=> d!138059 (= res!837548 (not (contains!7520 lt!567933 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138059 (= lt!567933 e!714212)))

(declare-fun c!122406 () Bool)

(assert (=> d!138059 (= c!122406 (bvsge #b00000000000000000000000000000000 (size!39886 _keys!1118)))))

(assert (=> d!138059 (validMask!0 mask!1466)))

(assert (=> d!138059 (= (getCurrentListMapNoExtraKeys!5756 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567933)))

(declare-fun b!1256341 () Bool)

(declare-fun e!714213 () ListLongMap!18707)

(declare-fun call!61765 () ListLongMap!18707)

(assert (=> b!1256341 (= e!714213 call!61765)))

(declare-fun b!1256342 () Bool)

(assert (=> b!1256342 (= e!714215 (isEmpty!1036 lt!567933))))

(declare-fun b!1256343 () Bool)

(declare-fun res!837549 () Bool)

(assert (=> b!1256343 (=> (not res!837549) (not e!714216))))

(assert (=> b!1256343 (= res!837549 (not (contains!7520 lt!567933 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1256344 () Bool)

(declare-fun e!714210 () Bool)

(declare-fun e!714214 () Bool)

(assert (=> b!1256344 (= e!714210 e!714214)))

(assert (=> b!1256344 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39886 _keys!1118)))))

(declare-fun res!837550 () Bool)

(assert (=> b!1256344 (= res!837550 (contains!7520 lt!567933 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1256344 (=> (not res!837550) (not e!714214))))

(declare-fun b!1256345 () Bool)

(assert (=> b!1256345 (= e!714210 e!714215)))

(declare-fun c!122407 () Bool)

(assert (=> b!1256345 (= c!122407 (bvslt #b00000000000000000000000000000000 (size!39886 _keys!1118)))))

(declare-fun b!1256346 () Bool)

(assert (=> b!1256346 (= e!714212 e!714213)))

(declare-fun c!122408 () Bool)

(assert (=> b!1256346 (= c!122408 (validKeyInArray!0 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61762 () Bool)

(assert (=> bm!61762 (= call!61765 (getCurrentListMapNoExtraKeys!5756 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1256347 () Bool)

(assert (=> b!1256347 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39886 _keys!1118)))))

(assert (=> b!1256347 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39887 _values!914)))))

(assert (=> b!1256347 (= e!714214 (= (apply!981 lt!567933 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000)) (get!20142 (select (arr!39349 _values!914) #b00000000000000000000000000000000) (dynLambda!3411 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1256348 () Bool)

(assert (=> b!1256348 (= e!714216 e!714210)))

(declare-fun c!122409 () Bool)

(assert (=> b!1256348 (= c!122409 e!714211)))

(declare-fun res!837551 () Bool)

(assert (=> b!1256348 (=> (not res!837551) (not e!714211))))

(assert (=> b!1256348 (= res!837551 (bvslt #b00000000000000000000000000000000 (size!39886 _keys!1118)))))

(declare-fun b!1256349 () Bool)

(declare-fun lt!567936 () Unit!41695)

(declare-fun lt!567939 () Unit!41695)

(assert (=> b!1256349 (= lt!567936 lt!567939)))

(declare-fun lt!567934 () ListLongMap!18707)

(declare-fun lt!567937 () (_ BitVec 64))

(declare-fun lt!567938 () V!48039)

(declare-fun lt!567935 () (_ BitVec 64))

(assert (=> b!1256349 (not (contains!7520 (+!4226 lt!567934 (tuple2!20835 lt!567935 lt!567938)) lt!567937))))

(assert (=> b!1256349 (= lt!567939 (addStillNotContains!317 lt!567934 lt!567935 lt!567938 lt!567937))))

(assert (=> b!1256349 (= lt!567937 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1256349 (= lt!567938 (get!20142 (select (arr!39349 _values!914) #b00000000000000000000000000000000) (dynLambda!3411 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1256349 (= lt!567935 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1256349 (= lt!567934 call!61765)))

(assert (=> b!1256349 (= e!714213 (+!4226 call!61765 (tuple2!20835 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000) (get!20142 (select (arr!39349 _values!914) #b00000000000000000000000000000000) (dynLambda!3411 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!138059 c!122406) b!1256338))

(assert (= (and d!138059 (not c!122406)) b!1256346))

(assert (= (and b!1256346 c!122408) b!1256349))

(assert (= (and b!1256346 (not c!122408)) b!1256341))

(assert (= (or b!1256349 b!1256341) bm!61762))

(assert (= (and d!138059 res!837548) b!1256343))

(assert (= (and b!1256343 res!837549) b!1256348))

(assert (= (and b!1256348 res!837551) b!1256340))

(assert (= (and b!1256348 c!122409) b!1256344))

(assert (= (and b!1256348 (not c!122409)) b!1256345))

(assert (= (and b!1256344 res!837550) b!1256347))

(assert (= (and b!1256345 c!122407) b!1256339))

(assert (= (and b!1256345 (not c!122407)) b!1256342))

(declare-fun b_lambda!22661 () Bool)

(assert (=> (not b_lambda!22661) (not b!1256347)))

(assert (=> b!1256347 t!41526))

(declare-fun b_and!44941 () Bool)

(assert (= b_and!44939 (and (=> t!41526 result!23309) b_and!44941)))

(declare-fun b_lambda!22663 () Bool)

(assert (=> (not b_lambda!22663) (not b!1256349)))

(assert (=> b!1256349 t!41526))

(declare-fun b_and!44943 () Bool)

(assert (= b_and!44941 (and (=> t!41526 result!23309) b_and!44943)))

(assert (=> b!1256349 m!1156543))

(assert (=> b!1256349 m!1156557))

(assert (=> b!1256349 m!1156559))

(assert (=> b!1256349 m!1156561))

(declare-fun m!1156583 () Bool)

(assert (=> b!1256349 m!1156583))

(declare-fun m!1156585 () Bool)

(assert (=> b!1256349 m!1156585))

(declare-fun m!1156587 () Bool)

(assert (=> b!1256349 m!1156587))

(assert (=> b!1256349 m!1156557))

(assert (=> b!1256349 m!1156585))

(assert (=> b!1256349 m!1156559))

(declare-fun m!1156589 () Bool)

(assert (=> b!1256349 m!1156589))

(assert (=> b!1256347 m!1156543))

(assert (=> b!1256347 m!1156557))

(assert (=> b!1256347 m!1156559))

(assert (=> b!1256347 m!1156561))

(assert (=> b!1256347 m!1156543))

(declare-fun m!1156591 () Bool)

(assert (=> b!1256347 m!1156591))

(assert (=> b!1256347 m!1156557))

(assert (=> b!1256347 m!1156559))

(declare-fun m!1156593 () Bool)

(assert (=> b!1256339 m!1156593))

(assert (=> b!1256340 m!1156543))

(assert (=> b!1256340 m!1156543))

(assert (=> b!1256340 m!1156551))

(declare-fun m!1156595 () Bool)

(assert (=> b!1256343 m!1156595))

(declare-fun m!1156597 () Bool)

(assert (=> b!1256342 m!1156597))

(assert (=> b!1256346 m!1156543))

(assert (=> b!1256346 m!1156543))

(assert (=> b!1256346 m!1156551))

(declare-fun m!1156599 () Bool)

(assert (=> d!138059 m!1156599))

(assert (=> d!138059 m!1156477))

(assert (=> bm!61762 m!1156593))

(assert (=> b!1256344 m!1156543))

(assert (=> b!1256344 m!1156543))

(declare-fun m!1156601 () Bool)

(assert (=> b!1256344 m!1156601))

(assert (=> b!1256230 d!138059))

(declare-fun bm!61765 () Bool)

(declare-fun call!61768 () Bool)

(declare-fun c!122412 () Bool)

(assert (=> bm!61765 (= call!61768 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122412 (Cons!28040 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000) Nil!28041) Nil!28041)))))

(declare-fun d!138061 () Bool)

(declare-fun res!837559 () Bool)

(declare-fun e!714227 () Bool)

(assert (=> d!138061 (=> res!837559 e!714227)))

(assert (=> d!138061 (= res!837559 (bvsge #b00000000000000000000000000000000 (size!39886 _keys!1118)))))

(assert (=> d!138061 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28041) e!714227)))

(declare-fun b!1256360 () Bool)

(declare-fun e!714226 () Bool)

(assert (=> b!1256360 (= e!714227 e!714226)))

(declare-fun res!837560 () Bool)

(assert (=> b!1256360 (=> (not res!837560) (not e!714226))))

(declare-fun e!714228 () Bool)

(assert (=> b!1256360 (= res!837560 (not e!714228))))

(declare-fun res!837558 () Bool)

(assert (=> b!1256360 (=> (not res!837558) (not e!714228))))

(assert (=> b!1256360 (= res!837558 (validKeyInArray!0 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1256361 () Bool)

(declare-fun e!714225 () Bool)

(assert (=> b!1256361 (= e!714225 call!61768)))

(declare-fun b!1256362 () Bool)

(declare-fun contains!7521 (List!28044 (_ BitVec 64)) Bool)

(assert (=> b!1256362 (= e!714228 (contains!7521 Nil!28041 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1256363 () Bool)

(assert (=> b!1256363 (= e!714226 e!714225)))

(assert (=> b!1256363 (= c!122412 (validKeyInArray!0 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1256364 () Bool)

(assert (=> b!1256364 (= e!714225 call!61768)))

(assert (= (and d!138061 (not res!837559)) b!1256360))

(assert (= (and b!1256360 res!837558) b!1256362))

(assert (= (and b!1256360 res!837560) b!1256363))

(assert (= (and b!1256363 c!122412) b!1256361))

(assert (= (and b!1256363 (not c!122412)) b!1256364))

(assert (= (or b!1256361 b!1256364) bm!61765))

(assert (=> bm!61765 m!1156543))

(declare-fun m!1156603 () Bool)

(assert (=> bm!61765 m!1156603))

(assert (=> b!1256360 m!1156543))

(assert (=> b!1256360 m!1156543))

(assert (=> b!1256360 m!1156551))

(assert (=> b!1256362 m!1156543))

(assert (=> b!1256362 m!1156543))

(declare-fun m!1156605 () Bool)

(assert (=> b!1256362 m!1156605))

(assert (=> b!1256363 m!1156543))

(assert (=> b!1256363 m!1156543))

(assert (=> b!1256363 m!1156551))

(assert (=> b!1256228 d!138061))

(declare-fun d!138063 () Bool)

(assert (=> d!138063 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105440 d!138063))

(declare-fun d!138065 () Bool)

(assert (=> d!138065 (= (array_inv!30111 _keys!1118) (bvsge (size!39886 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105440 d!138065))

(declare-fun d!138067 () Bool)

(assert (=> d!138067 (= (array_inv!30112 _values!914) (bvsge (size!39887 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105440 d!138067))

(declare-fun d!138069 () Bool)

(declare-fun lt!567942 () ListLongMap!18707)

(assert (=> d!138069 (not (contains!7520 lt!567942 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!140 (List!28043 (_ BitVec 64)) List!28043)

(assert (=> d!138069 (= lt!567942 (ListLongMap!18708 (removeStrictlySorted!140 (toList!9369 lt!567869) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138069 (= (-!2036 lt!567869 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567942)))

(declare-fun bs!35492 () Bool)

(assert (= bs!35492 d!138069))

(declare-fun m!1156607 () Bool)

(assert (=> bs!35492 m!1156607))

(declare-fun m!1156609 () Bool)

(assert (=> bs!35492 m!1156609))

(assert (=> b!1256232 d!138069))

(declare-fun d!138071 () Bool)

(assert (=> d!138071 (= (-!2036 lt!567869 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567869)))

(declare-fun lt!567945 () Unit!41695)

(declare-fun choose!1868 (ListLongMap!18707 (_ BitVec 64)) Unit!41695)

(assert (=> d!138071 (= lt!567945 (choose!1868 lt!567869 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138071 (not (contains!7520 lt!567869 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138071 (= (removeNotPresentStillSame!131 lt!567869 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567945)))

(declare-fun bs!35493 () Bool)

(assert (= bs!35493 d!138071))

(assert (=> bs!35493 m!1156487))

(declare-fun m!1156611 () Bool)

(assert (=> bs!35493 m!1156611))

(assert (=> bs!35493 m!1156467))

(assert (=> b!1256232 d!138071))

(declare-fun d!138073 () Bool)

(declare-fun e!714234 () Bool)

(assert (=> d!138073 e!714234))

(declare-fun res!837563 () Bool)

(assert (=> d!138073 (=> res!837563 e!714234)))

(declare-fun lt!567956 () Bool)

(assert (=> d!138073 (= res!837563 (not lt!567956))))

(declare-fun lt!567955 () Bool)

(assert (=> d!138073 (= lt!567956 lt!567955)))

(declare-fun lt!567954 () Unit!41695)

(declare-fun e!714233 () Unit!41695)

(assert (=> d!138073 (= lt!567954 e!714233)))

(declare-fun c!122415 () Bool)

(assert (=> d!138073 (= c!122415 lt!567955)))

(declare-fun containsKey!618 (List!28043 (_ BitVec 64)) Bool)

(assert (=> d!138073 (= lt!567955 (containsKey!618 (toList!9369 lt!567869) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138073 (= (contains!7520 lt!567869 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567956)))

(declare-fun b!1256371 () Bool)

(declare-fun lt!567957 () Unit!41695)

(assert (=> b!1256371 (= e!714233 lt!567957)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!428 (List!28043 (_ BitVec 64)) Unit!41695)

(assert (=> b!1256371 (= lt!567957 (lemmaContainsKeyImpliesGetValueByKeyDefined!428 (toList!9369 lt!567869) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!709 0))(
  ( (Some!708 (v!18767 V!48039)) (None!707) )
))
(declare-fun isDefined!471 (Option!709) Bool)

(declare-fun getValueByKey!658 (List!28043 (_ BitVec 64)) Option!709)

(assert (=> b!1256371 (isDefined!471 (getValueByKey!658 (toList!9369 lt!567869) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256372 () Bool)

(declare-fun Unit!41699 () Unit!41695)

(assert (=> b!1256372 (= e!714233 Unit!41699)))

(declare-fun b!1256373 () Bool)

(assert (=> b!1256373 (= e!714234 (isDefined!471 (getValueByKey!658 (toList!9369 lt!567869) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138073 c!122415) b!1256371))

(assert (= (and d!138073 (not c!122415)) b!1256372))

(assert (= (and d!138073 (not res!837563)) b!1256373))

(declare-fun m!1156613 () Bool)

(assert (=> d!138073 m!1156613))

(declare-fun m!1156615 () Bool)

(assert (=> b!1256371 m!1156615))

(declare-fun m!1156617 () Bool)

(assert (=> b!1256371 m!1156617))

(assert (=> b!1256371 m!1156617))

(declare-fun m!1156619 () Bool)

(assert (=> b!1256371 m!1156619))

(assert (=> b!1256373 m!1156617))

(assert (=> b!1256373 m!1156617))

(assert (=> b!1256373 m!1156619))

(assert (=> b!1256227 d!138073))

(declare-fun b!1256416 () Bool)

(declare-fun e!714266 () ListLongMap!18707)

(declare-fun call!61785 () ListLongMap!18707)

(assert (=> b!1256416 (= e!714266 call!61785)))

(declare-fun b!1256417 () Bool)

(declare-fun e!714263 () Bool)

(declare-fun e!714271 () Bool)

(assert (=> b!1256417 (= e!714263 e!714271)))

(declare-fun c!122431 () Bool)

(assert (=> b!1256417 (= c!122431 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!61780 () Bool)

(declare-fun call!61783 () ListLongMap!18707)

(assert (=> bm!61780 (= call!61785 call!61783)))

(declare-fun b!1256418 () Bool)

(declare-fun e!714264 () Bool)

(assert (=> b!1256418 (= e!714271 e!714264)))

(declare-fun res!837589 () Bool)

(declare-fun call!61788 () Bool)

(assert (=> b!1256418 (= res!837589 call!61788)))

(assert (=> b!1256418 (=> (not res!837589) (not e!714264))))

(declare-fun b!1256420 () Bool)

(declare-fun e!714267 () Bool)

(declare-fun call!61784 () Bool)

(assert (=> b!1256420 (= e!714267 (not call!61784))))

(declare-fun b!1256421 () Bool)

(declare-fun e!714272 () Unit!41695)

(declare-fun lt!568012 () Unit!41695)

(assert (=> b!1256421 (= e!714272 lt!568012)))

(declare-fun lt!568018 () ListLongMap!18707)

(assert (=> b!1256421 (= lt!568018 (getCurrentListMapNoExtraKeys!5756 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568013 () (_ BitVec 64))

(assert (=> b!1256421 (= lt!568013 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!568008 () (_ BitVec 64))

(assert (=> b!1256421 (= lt!568008 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!568017 () Unit!41695)

(declare-fun addStillContains!1080 (ListLongMap!18707 (_ BitVec 64) V!48039 (_ BitVec 64)) Unit!41695)

(assert (=> b!1256421 (= lt!568017 (addStillContains!1080 lt!568018 lt!568013 zeroValue!871 lt!568008))))

(assert (=> b!1256421 (contains!7520 (+!4226 lt!568018 (tuple2!20835 lt!568013 zeroValue!871)) lt!568008)))

(declare-fun lt!568010 () Unit!41695)

(assert (=> b!1256421 (= lt!568010 lt!568017)))

(declare-fun lt!568014 () ListLongMap!18707)

(assert (=> b!1256421 (= lt!568014 (getCurrentListMapNoExtraKeys!5756 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568002 () (_ BitVec 64))

(assert (=> b!1256421 (= lt!568002 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!568006 () (_ BitVec 64))

(assert (=> b!1256421 (= lt!568006 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!568009 () Unit!41695)

(declare-fun addApplyDifferent!523 (ListLongMap!18707 (_ BitVec 64) V!48039 (_ BitVec 64)) Unit!41695)

(assert (=> b!1256421 (= lt!568009 (addApplyDifferent!523 lt!568014 lt!568002 minValueBefore!43 lt!568006))))

(assert (=> b!1256421 (= (apply!981 (+!4226 lt!568014 (tuple2!20835 lt!568002 minValueBefore!43)) lt!568006) (apply!981 lt!568014 lt!568006))))

(declare-fun lt!568005 () Unit!41695)

(assert (=> b!1256421 (= lt!568005 lt!568009)))

(declare-fun lt!568019 () ListLongMap!18707)

(assert (=> b!1256421 (= lt!568019 (getCurrentListMapNoExtraKeys!5756 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568022 () (_ BitVec 64))

(assert (=> b!1256421 (= lt!568022 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!568020 () (_ BitVec 64))

(assert (=> b!1256421 (= lt!568020 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!568004 () Unit!41695)

(assert (=> b!1256421 (= lt!568004 (addApplyDifferent!523 lt!568019 lt!568022 zeroValue!871 lt!568020))))

(assert (=> b!1256421 (= (apply!981 (+!4226 lt!568019 (tuple2!20835 lt!568022 zeroValue!871)) lt!568020) (apply!981 lt!568019 lt!568020))))

(declare-fun lt!568016 () Unit!41695)

(assert (=> b!1256421 (= lt!568016 lt!568004)))

(declare-fun lt!568015 () ListLongMap!18707)

(assert (=> b!1256421 (= lt!568015 (getCurrentListMapNoExtraKeys!5756 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568003 () (_ BitVec 64))

(assert (=> b!1256421 (= lt!568003 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!568007 () (_ BitVec 64))

(assert (=> b!1256421 (= lt!568007 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1256421 (= lt!568012 (addApplyDifferent!523 lt!568015 lt!568003 minValueBefore!43 lt!568007))))

(assert (=> b!1256421 (= (apply!981 (+!4226 lt!568015 (tuple2!20835 lt!568003 minValueBefore!43)) lt!568007) (apply!981 lt!568015 lt!568007))))

(declare-fun b!1256422 () Bool)

(declare-fun e!714261 () Bool)

(assert (=> b!1256422 (= e!714261 (validKeyInArray!0 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1256423 () Bool)

(declare-fun e!714270 () Bool)

(declare-fun lt!568023 () ListLongMap!18707)

(assert (=> b!1256423 (= e!714270 (= (apply!981 lt!568023 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1256424 () Bool)

(assert (=> b!1256424 (= e!714267 e!714270)))

(declare-fun res!837583 () Bool)

(assert (=> b!1256424 (= res!837583 call!61784)))

(assert (=> b!1256424 (=> (not res!837583) (not e!714270))))

(declare-fun bm!61781 () Bool)

(declare-fun call!61787 () ListLongMap!18707)

(declare-fun call!61786 () ListLongMap!18707)

(assert (=> bm!61781 (= call!61787 call!61786)))

(declare-fun bm!61782 () Bool)

(assert (=> bm!61782 (= call!61788 (contains!7520 lt!568023 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!122429 () Bool)

(declare-fun call!61789 () ListLongMap!18707)

(declare-fun c!122428 () Bool)

(declare-fun bm!61783 () Bool)

(assert (=> bm!61783 (= call!61783 (+!4226 (ite c!122428 call!61789 (ite c!122429 call!61786 call!61787)) (ite (or c!122428 c!122429) (tuple2!20835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20835 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun bm!61784 () Bool)

(assert (=> bm!61784 (= call!61786 call!61789)))

(declare-fun b!1256425 () Bool)

(declare-fun e!714265 () ListLongMap!18707)

(declare-fun e!714273 () ListLongMap!18707)

(assert (=> b!1256425 (= e!714265 e!714273)))

(assert (=> b!1256425 (= c!122429 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!61785 () Bool)

(assert (=> bm!61785 (= call!61789 (getCurrentListMapNoExtraKeys!5756 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun d!138075 () Bool)

(assert (=> d!138075 e!714263))

(declare-fun res!837587 () Bool)

(assert (=> d!138075 (=> (not res!837587) (not e!714263))))

(assert (=> d!138075 (= res!837587 (or (bvsge #b00000000000000000000000000000000 (size!39886 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39886 _keys!1118)))))))

(declare-fun lt!568021 () ListLongMap!18707)

(assert (=> d!138075 (= lt!568023 lt!568021)))

(declare-fun lt!568011 () Unit!41695)

(assert (=> d!138075 (= lt!568011 e!714272)))

(declare-fun c!122433 () Bool)

(declare-fun e!714269 () Bool)

(assert (=> d!138075 (= c!122433 e!714269)))

(declare-fun res!837590 () Bool)

(assert (=> d!138075 (=> (not res!837590) (not e!714269))))

(assert (=> d!138075 (= res!837590 (bvslt #b00000000000000000000000000000000 (size!39886 _keys!1118)))))

(assert (=> d!138075 (= lt!568021 e!714265)))

(assert (=> d!138075 (= c!122428 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138075 (validMask!0 mask!1466)))

(assert (=> d!138075 (= (getCurrentListMap!4480 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568023)))

(declare-fun e!714268 () Bool)

(declare-fun b!1256419 () Bool)

(assert (=> b!1256419 (= e!714268 (= (apply!981 lt!568023 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000)) (get!20142 (select (arr!39349 _values!914) #b00000000000000000000000000000000) (dynLambda!3411 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1256419 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39887 _values!914)))))

(assert (=> b!1256419 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39886 _keys!1118)))))

(declare-fun b!1256426 () Bool)

(assert (=> b!1256426 (= e!714265 (+!4226 call!61783 (tuple2!20835 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1256427 () Bool)

(declare-fun c!122432 () Bool)

(assert (=> b!1256427 (= c!122432 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1256427 (= e!714273 e!714266)))

(declare-fun b!1256428 () Bool)

(declare-fun res!837586 () Bool)

(assert (=> b!1256428 (=> (not res!837586) (not e!714263))))

(declare-fun e!714262 () Bool)

(assert (=> b!1256428 (= res!837586 e!714262)))

(declare-fun res!837588 () Bool)

(assert (=> b!1256428 (=> res!837588 e!714262)))

(assert (=> b!1256428 (= res!837588 (not e!714261))))

(declare-fun res!837585 () Bool)

(assert (=> b!1256428 (=> (not res!837585) (not e!714261))))

(assert (=> b!1256428 (= res!837585 (bvslt #b00000000000000000000000000000000 (size!39886 _keys!1118)))))

(declare-fun b!1256429 () Bool)

(assert (=> b!1256429 (= e!714269 (validKeyInArray!0 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61786 () Bool)

(assert (=> bm!61786 (= call!61784 (contains!7520 lt!568023 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256430 () Bool)

(assert (=> b!1256430 (= e!714273 call!61785)))

(declare-fun b!1256431 () Bool)

(assert (=> b!1256431 (= e!714262 e!714268)))

(declare-fun res!837582 () Bool)

(assert (=> b!1256431 (=> (not res!837582) (not e!714268))))

(assert (=> b!1256431 (= res!837582 (contains!7520 lt!568023 (select (arr!39348 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1256431 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39886 _keys!1118)))))

(declare-fun b!1256432 () Bool)

(assert (=> b!1256432 (= e!714264 (= (apply!981 lt!568023 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1256433 () Bool)

(assert (=> b!1256433 (= e!714266 call!61787)))

(declare-fun b!1256434 () Bool)

(declare-fun Unit!41700 () Unit!41695)

(assert (=> b!1256434 (= e!714272 Unit!41700)))

(declare-fun b!1256435 () Bool)

(assert (=> b!1256435 (= e!714271 (not call!61788))))

(declare-fun b!1256436 () Bool)

(declare-fun res!837584 () Bool)

(assert (=> b!1256436 (=> (not res!837584) (not e!714263))))

(assert (=> b!1256436 (= res!837584 e!714267)))

(declare-fun c!122430 () Bool)

(assert (=> b!1256436 (= c!122430 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!138075 c!122428) b!1256426))

(assert (= (and d!138075 (not c!122428)) b!1256425))

(assert (= (and b!1256425 c!122429) b!1256430))

(assert (= (and b!1256425 (not c!122429)) b!1256427))

(assert (= (and b!1256427 c!122432) b!1256416))

(assert (= (and b!1256427 (not c!122432)) b!1256433))

(assert (= (or b!1256416 b!1256433) bm!61781))

(assert (= (or b!1256430 bm!61781) bm!61784))

(assert (= (or b!1256430 b!1256416) bm!61780))

(assert (= (or b!1256426 bm!61784) bm!61785))

(assert (= (or b!1256426 bm!61780) bm!61783))

(assert (= (and d!138075 res!837590) b!1256429))

(assert (= (and d!138075 c!122433) b!1256421))

(assert (= (and d!138075 (not c!122433)) b!1256434))

(assert (= (and d!138075 res!837587) b!1256428))

(assert (= (and b!1256428 res!837585) b!1256422))

(assert (= (and b!1256428 (not res!837588)) b!1256431))

(assert (= (and b!1256431 res!837582) b!1256419))

(assert (= (and b!1256428 res!837586) b!1256436))

(assert (= (and b!1256436 c!122430) b!1256424))

(assert (= (and b!1256436 (not c!122430)) b!1256420))

(assert (= (and b!1256424 res!837583) b!1256423))

(assert (= (or b!1256424 b!1256420) bm!61786))

(assert (= (and b!1256436 res!837584) b!1256417))

(assert (= (and b!1256417 c!122431) b!1256418))

(assert (= (and b!1256417 (not c!122431)) b!1256435))

(assert (= (and b!1256418 res!837589) b!1256432))

(assert (= (or b!1256418 b!1256435) bm!61782))

(declare-fun b_lambda!22665 () Bool)

(assert (=> (not b_lambda!22665) (not b!1256419)))

(assert (=> b!1256419 t!41526))

(declare-fun b_and!44945 () Bool)

(assert (= b_and!44943 (and (=> t!41526 result!23309) b_and!44945)))

(assert (=> b!1256422 m!1156543))

(assert (=> b!1256422 m!1156543))

(assert (=> b!1256422 m!1156551))

(assert (=> b!1256431 m!1156543))

(assert (=> b!1256431 m!1156543))

(declare-fun m!1156621 () Bool)

(assert (=> b!1256431 m!1156621))

(declare-fun m!1156623 () Bool)

(assert (=> bm!61786 m!1156623))

(declare-fun m!1156625 () Bool)

(assert (=> b!1256426 m!1156625))

(declare-fun m!1156627 () Bool)

(assert (=> b!1256423 m!1156627))

(assert (=> bm!61785 m!1156475))

(declare-fun m!1156629 () Bool)

(assert (=> b!1256421 m!1156629))

(declare-fun m!1156631 () Bool)

(assert (=> b!1256421 m!1156631))

(assert (=> b!1256421 m!1156629))

(declare-fun m!1156633 () Bool)

(assert (=> b!1256421 m!1156633))

(assert (=> b!1256421 m!1156543))

(declare-fun m!1156635 () Bool)

(assert (=> b!1256421 m!1156635))

(declare-fun m!1156637 () Bool)

(assert (=> b!1256421 m!1156637))

(declare-fun m!1156639 () Bool)

(assert (=> b!1256421 m!1156639))

(declare-fun m!1156641 () Bool)

(assert (=> b!1256421 m!1156641))

(declare-fun m!1156643 () Bool)

(assert (=> b!1256421 m!1156643))

(declare-fun m!1156645 () Bool)

(assert (=> b!1256421 m!1156645))

(declare-fun m!1156647 () Bool)

(assert (=> b!1256421 m!1156647))

(declare-fun m!1156649 () Bool)

(assert (=> b!1256421 m!1156649))

(assert (=> b!1256421 m!1156475))

(assert (=> b!1256421 m!1156645))

(declare-fun m!1156651 () Bool)

(assert (=> b!1256421 m!1156651))

(assert (=> b!1256421 m!1156647))

(declare-fun m!1156653 () Bool)

(assert (=> b!1256421 m!1156653))

(declare-fun m!1156655 () Bool)

(assert (=> b!1256421 m!1156655))

(declare-fun m!1156657 () Bool)

(assert (=> b!1256421 m!1156657))

(assert (=> b!1256421 m!1156655))

(assert (=> b!1256429 m!1156543))

(assert (=> b!1256429 m!1156543))

(assert (=> b!1256429 m!1156551))

(declare-fun m!1156659 () Bool)

(assert (=> bm!61783 m!1156659))

(declare-fun m!1156661 () Bool)

(assert (=> b!1256432 m!1156661))

(assert (=> d!138075 m!1156477))

(declare-fun m!1156663 () Bool)

(assert (=> bm!61782 m!1156663))

(assert (=> b!1256419 m!1156557))

(assert (=> b!1256419 m!1156559))

(assert (=> b!1256419 m!1156561))

(assert (=> b!1256419 m!1156543))

(assert (=> b!1256419 m!1156543))

(declare-fun m!1156665 () Bool)

(assert (=> b!1256419 m!1156665))

(assert (=> b!1256419 m!1156557))

(assert (=> b!1256419 m!1156559))

(assert (=> b!1256227 d!138075))

(declare-fun b!1256443 () Bool)

(declare-fun e!714278 () Bool)

(assert (=> b!1256443 (= e!714278 tp_is_empty!32005)))

(declare-fun mapIsEmpty!49801 () Bool)

(declare-fun mapRes!49801 () Bool)

(assert (=> mapIsEmpty!49801 mapRes!49801))

(declare-fun mapNonEmpty!49801 () Bool)

(declare-fun tp!94838 () Bool)

(assert (=> mapNonEmpty!49801 (= mapRes!49801 (and tp!94838 e!714278))))

(declare-fun mapRest!49801 () (Array (_ BitVec 32) ValueCell!15239))

(declare-fun mapValue!49801 () ValueCell!15239)

(declare-fun mapKey!49801 () (_ BitVec 32))

(assert (=> mapNonEmpty!49801 (= mapRest!49792 (store mapRest!49801 mapKey!49801 mapValue!49801))))

(declare-fun b!1256444 () Bool)

(declare-fun e!714279 () Bool)

(assert (=> b!1256444 (= e!714279 tp_is_empty!32005)))

(declare-fun condMapEmpty!49801 () Bool)

(declare-fun mapDefault!49801 () ValueCell!15239)

(assert (=> mapNonEmpty!49792 (= condMapEmpty!49801 (= mapRest!49792 ((as const (Array (_ BitVec 32) ValueCell!15239)) mapDefault!49801)))))

(assert (=> mapNonEmpty!49792 (= tp!94823 (and e!714279 mapRes!49801))))

(assert (= (and mapNonEmpty!49792 condMapEmpty!49801) mapIsEmpty!49801))

(assert (= (and mapNonEmpty!49792 (not condMapEmpty!49801)) mapNonEmpty!49801))

(assert (= (and mapNonEmpty!49801 ((_ is ValueCellFull!15239) mapValue!49801)) b!1256443))

(assert (= (and mapNonEmpty!49792 ((_ is ValueCellFull!15239) mapDefault!49801)) b!1256444))

(declare-fun m!1156667 () Bool)

(assert (=> mapNonEmpty!49801 m!1156667))

(declare-fun b_lambda!22667 () Bool)

(assert (= b_lambda!22659 (or (and start!105440 b_free!27103) b_lambda!22667)))

(declare-fun b_lambda!22669 () Bool)

(assert (= b_lambda!22663 (or (and start!105440 b_free!27103) b_lambda!22669)))

(declare-fun b_lambda!22671 () Bool)

(assert (= b_lambda!22657 (or (and start!105440 b_free!27103) b_lambda!22671)))

(declare-fun b_lambda!22673 () Bool)

(assert (= b_lambda!22661 (or (and start!105440 b_free!27103) b_lambda!22673)))

(declare-fun b_lambda!22675 () Bool)

(assert (= b_lambda!22665 (or (and start!105440 b_free!27103) b_lambda!22675)))

(check-sat (not d!138059) (not b_lambda!22671) (not d!138069) (not b!1256330) (not b!1256329) (not b!1256328) (not b!1256343) (not b!1256421) (not b!1256432) (not b!1256332) (not b!1256297) (not b!1256429) (not b!1256360) (not b!1256344) (not d!138071) (not b!1256325) (not bm!61782) (not mapNonEmpty!49801) (not b!1256431) (not bm!61758) (not b!1256326) (not bm!61785) (not b!1256342) (not b!1256346) (not b!1256333) (not b!1256423) (not b!1256371) (not b_lambda!22667) (not b_lambda!22675) (not b!1256419) (not d!138073) (not b!1256339) (not b!1256373) (not bm!61762) (not d!138075) (not b!1256362) (not d!138057) (not b!1256363) (not b!1256335) (not bm!61783) (not bm!61786) (not b_lambda!22669) (not b_lambda!22673) (not b!1256340) (not b!1256347) tp_is_empty!32005 (not bm!61765) (not b!1256296) (not b_next!27103) (not b!1256422) (not b!1256426) (not d!138055) (not bm!61761) b_and!44945 (not b!1256349))
(check-sat b_and!44945 (not b_next!27103))
