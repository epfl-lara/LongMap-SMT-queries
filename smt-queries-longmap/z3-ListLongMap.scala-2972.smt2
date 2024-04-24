; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42074 () Bool)

(assert start!42074)

(declare-fun b_free!11641 () Bool)

(declare-fun b_next!11641 () Bool)

(assert (=> start!42074 (= b_free!11641 (not b_next!11641))))

(declare-fun tp!40942 () Bool)

(declare-fun b_and!20061 () Bool)

(assert (=> start!42074 (= tp!40942 b_and!20061)))

(declare-fun b!469864 () Bool)

(declare-fun e!275208 () Bool)

(declare-fun tp_is_empty!13069 () Bool)

(assert (=> b!469864 (= e!275208 tp_is_empty!13069)))

(declare-fun b!469865 () Bool)

(declare-fun res!280822 () Bool)

(declare-fun e!275204 () Bool)

(assert (=> b!469865 (=> (not res!280822) (not e!275204))))

(declare-datatypes ((array!29898 0))(
  ( (array!29899 (arr!14373 (Array (_ BitVec 32) (_ BitVec 64))) (size!14725 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29898)

(declare-datatypes ((List!8659 0))(
  ( (Nil!8656) (Cons!8655 (h!9511 (_ BitVec 64)) (t!14611 List!8659)) )
))
(declare-fun arrayNoDuplicates!0 (array!29898 (_ BitVec 32) List!8659) Bool)

(assert (=> b!469865 (= res!280822 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8656))))

(declare-fun b!469866 () Bool)

(declare-fun e!275207 () Bool)

(assert (=> b!469866 (= e!275207 (bvsle #b00000000000000000000000000000000 (size!14725 _keys!1025)))))

(declare-datatypes ((V!18531 0))(
  ( (V!18532 (val!6579 Int)) )
))
(declare-datatypes ((tuple2!8586 0))(
  ( (tuple2!8587 (_1!4304 (_ BitVec 64)) (_2!4304 V!18531)) )
))
(declare-datatypes ((List!8660 0))(
  ( (Nil!8657) (Cons!8656 (h!9512 tuple2!8586) (t!14612 List!8660)) )
))
(declare-datatypes ((ListLongMap!7501 0))(
  ( (ListLongMap!7502 (toList!3766 List!8660)) )
))
(declare-fun lt!213150 () ListLongMap!7501)

(declare-fun lt!213152 () tuple2!8586)

(declare-fun minValueBefore!38 () V!18531)

(declare-fun +!1723 (ListLongMap!7501 tuple2!8586) ListLongMap!7501)

(assert (=> b!469866 (= (+!1723 lt!213150 lt!213152) (+!1723 (+!1723 lt!213150 (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!213152))))

(declare-fun minValueAfter!38 () V!18531)

(assert (=> b!469866 (= lt!213152 (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13743 0))(
  ( (Unit!13744) )
))
(declare-fun lt!213149 () Unit!13743)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!129 (ListLongMap!7501 (_ BitVec 64) V!18531 V!18531) Unit!13743)

(assert (=> b!469866 (= lt!213149 (addSameAsAddTwiceSameKeyDiffValues!129 lt!213150 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18531)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!213148 () ListLongMap!7501)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6191 0))(
  ( (ValueCellFull!6191 (v!8870 V!18531)) (EmptyCell!6191) )
))
(declare-datatypes ((array!29900 0))(
  ( (array!29901 (arr!14374 (Array (_ BitVec 32) ValueCell!6191)) (size!14726 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29900)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2189 (array!29898 array!29900 (_ BitVec 32) (_ BitVec 32) V!18531 V!18531 (_ BitVec 32) Int) ListLongMap!7501)

(assert (=> b!469866 (= lt!213148 (getCurrentListMap!2189 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213151 () ListLongMap!7501)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469866 (= lt!213151 (getCurrentListMap!2189 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21301 () Bool)

(declare-fun mapRes!21301 () Bool)

(assert (=> mapIsEmpty!21301 mapRes!21301))

(declare-fun mapNonEmpty!21301 () Bool)

(declare-fun tp!40941 () Bool)

(assert (=> mapNonEmpty!21301 (= mapRes!21301 (and tp!40941 e!275208))))

(declare-fun mapValue!21301 () ValueCell!6191)

(declare-fun mapKey!21301 () (_ BitVec 32))

(declare-fun mapRest!21301 () (Array (_ BitVec 32) ValueCell!6191))

(assert (=> mapNonEmpty!21301 (= (arr!14374 _values!833) (store mapRest!21301 mapKey!21301 mapValue!21301))))

(declare-fun b!469868 () Bool)

(declare-fun res!280824 () Bool)

(assert (=> b!469868 (=> (not res!280824) (not e!275204))))

(assert (=> b!469868 (= res!280824 (and (= (size!14726 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14725 _keys!1025) (size!14726 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469869 () Bool)

(declare-fun e!275203 () Bool)

(declare-fun e!275206 () Bool)

(assert (=> b!469869 (= e!275203 (and e!275206 mapRes!21301))))

(declare-fun condMapEmpty!21301 () Bool)

(declare-fun mapDefault!21301 () ValueCell!6191)

(assert (=> b!469869 (= condMapEmpty!21301 (= (arr!14374 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6191)) mapDefault!21301)))))

(declare-fun b!469870 () Bool)

(assert (=> b!469870 (= e!275206 tp_is_empty!13069)))

(declare-fun b!469871 () Bool)

(declare-fun res!280820 () Bool)

(assert (=> b!469871 (=> (not res!280820) (not e!275204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29898 (_ BitVec 32)) Bool)

(assert (=> b!469871 (= res!280820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!280823 () Bool)

(assert (=> start!42074 (=> (not res!280823) (not e!275204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42074 (= res!280823 (validMask!0 mask!1365))))

(assert (=> start!42074 e!275204))

(assert (=> start!42074 tp_is_empty!13069))

(assert (=> start!42074 tp!40942))

(assert (=> start!42074 true))

(declare-fun array_inv!10462 (array!29898) Bool)

(assert (=> start!42074 (array_inv!10462 _keys!1025)))

(declare-fun array_inv!10463 (array!29900) Bool)

(assert (=> start!42074 (and (array_inv!10463 _values!833) e!275203)))

(declare-fun b!469867 () Bool)

(assert (=> b!469867 (= e!275204 (not e!275207))))

(declare-fun res!280821 () Bool)

(assert (=> b!469867 (=> res!280821 e!275207)))

(assert (=> b!469867 (= res!280821 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!213146 () ListLongMap!7501)

(assert (=> b!469867 (= lt!213150 lt!213146)))

(declare-fun lt!213147 () Unit!13743)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!141 (array!29898 array!29900 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18531 V!18531 V!18531 V!18531 (_ BitVec 32) Int) Unit!13743)

(assert (=> b!469867 (= lt!213147 (lemmaNoChangeToArrayThenSameMapNoExtras!141 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1981 (array!29898 array!29900 (_ BitVec 32) (_ BitVec 32) V!18531 V!18531 (_ BitVec 32) Int) ListLongMap!7501)

(assert (=> b!469867 (= lt!213146 (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469867 (= lt!213150 (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42074 res!280823) b!469868))

(assert (= (and b!469868 res!280824) b!469871))

(assert (= (and b!469871 res!280820) b!469865))

(assert (= (and b!469865 res!280822) b!469867))

(assert (= (and b!469867 (not res!280821)) b!469866))

(assert (= (and b!469869 condMapEmpty!21301) mapIsEmpty!21301))

(assert (= (and b!469869 (not condMapEmpty!21301)) mapNonEmpty!21301))

(get-info :version)

(assert (= (and mapNonEmpty!21301 ((_ is ValueCellFull!6191) mapValue!21301)) b!469864))

(assert (= (and b!469869 ((_ is ValueCellFull!6191) mapDefault!21301)) b!469870))

(assert (= start!42074 b!469869))

(declare-fun m!452393 () Bool)

(assert (=> start!42074 m!452393))

(declare-fun m!452395 () Bool)

(assert (=> start!42074 m!452395))

(declare-fun m!452397 () Bool)

(assert (=> start!42074 m!452397))

(declare-fun m!452399 () Bool)

(assert (=> b!469867 m!452399))

(declare-fun m!452401 () Bool)

(assert (=> b!469867 m!452401))

(declare-fun m!452403 () Bool)

(assert (=> b!469867 m!452403))

(declare-fun m!452405 () Bool)

(assert (=> b!469866 m!452405))

(declare-fun m!452407 () Bool)

(assert (=> b!469866 m!452407))

(assert (=> b!469866 m!452405))

(declare-fun m!452409 () Bool)

(assert (=> b!469866 m!452409))

(declare-fun m!452411 () Bool)

(assert (=> b!469866 m!452411))

(declare-fun m!452413 () Bool)

(assert (=> b!469866 m!452413))

(declare-fun m!452415 () Bool)

(assert (=> b!469866 m!452415))

(declare-fun m!452417 () Bool)

(assert (=> b!469865 m!452417))

(declare-fun m!452419 () Bool)

(assert (=> mapNonEmpty!21301 m!452419))

(declare-fun m!452421 () Bool)

(assert (=> b!469871 m!452421))

(check-sat (not b!469867) (not b_next!11641) (not b!469866) (not start!42074) (not b!469871) tp_is_empty!13069 (not b!469865) b_and!20061 (not mapNonEmpty!21301))
(check-sat b_and!20061 (not b_next!11641))
(get-model)

(declare-fun d!75347 () Bool)

(assert (=> d!75347 (= (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213197 () Unit!13743)

(declare-fun choose!1352 (array!29898 array!29900 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18531 V!18531 V!18531 V!18531 (_ BitVec 32) Int) Unit!13743)

(assert (=> d!75347 (= lt!213197 (choose!1352 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75347 (validMask!0 mask!1365)))

(assert (=> d!75347 (= (lemmaNoChangeToArrayThenSameMapNoExtras!141 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213197)))

(declare-fun bs!14907 () Bool)

(assert (= bs!14907 d!75347))

(assert (=> bs!14907 m!452403))

(assert (=> bs!14907 m!452401))

(declare-fun m!452483 () Bool)

(assert (=> bs!14907 m!452483))

(assert (=> bs!14907 m!452393))

(assert (=> b!469867 d!75347))

(declare-fun b!469944 () Bool)

(declare-fun e!275263 () Bool)

(declare-fun e!275264 () Bool)

(assert (=> b!469944 (= e!275263 e!275264)))

(assert (=> b!469944 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14725 _keys!1025)))))

(declare-fun res!280864 () Bool)

(declare-fun lt!213213 () ListLongMap!7501)

(declare-fun contains!2518 (ListLongMap!7501 (_ BitVec 64)) Bool)

(assert (=> b!469944 (= res!280864 (contains!2518 lt!213213 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469944 (=> (not res!280864) (not e!275264))))

(declare-fun b!469945 () Bool)

(declare-fun e!275259 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!469945 (= e!275259 (validKeyInArray!0 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469945 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!75349 () Bool)

(declare-fun e!275260 () Bool)

(assert (=> d!75349 e!275260))

(declare-fun res!280865 () Bool)

(assert (=> d!75349 (=> (not res!280865) (not e!275260))))

(assert (=> d!75349 (= res!280865 (not (contains!2518 lt!213213 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!275262 () ListLongMap!7501)

(assert (=> d!75349 (= lt!213213 e!275262)))

(declare-fun c!56881 () Bool)

(assert (=> d!75349 (= c!56881 (bvsge #b00000000000000000000000000000000 (size!14725 _keys!1025)))))

(assert (=> d!75349 (validMask!0 mask!1365)))

(assert (=> d!75349 (= (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213213)))

(declare-fun b!469946 () Bool)

(assert (=> b!469946 (= e!275260 e!275263)))

(declare-fun c!56880 () Bool)

(assert (=> b!469946 (= c!56880 e!275259)))

(declare-fun res!280863 () Bool)

(assert (=> b!469946 (=> (not res!280863) (not e!275259))))

(assert (=> b!469946 (= res!280863 (bvslt #b00000000000000000000000000000000 (size!14725 _keys!1025)))))

(declare-fun b!469947 () Bool)

(assert (=> b!469947 (= e!275262 (ListLongMap!7502 Nil!8657))))

(declare-fun b!469948 () Bool)

(declare-fun lt!213214 () Unit!13743)

(declare-fun lt!213212 () Unit!13743)

(assert (=> b!469948 (= lt!213214 lt!213212)))

(declare-fun lt!213215 () (_ BitVec 64))

(declare-fun lt!213218 () (_ BitVec 64))

(declare-fun lt!213217 () ListLongMap!7501)

(declare-fun lt!213216 () V!18531)

(assert (=> b!469948 (not (contains!2518 (+!1723 lt!213217 (tuple2!8587 lt!213218 lt!213216)) lt!213215))))

(declare-fun addStillNotContains!162 (ListLongMap!7501 (_ BitVec 64) V!18531 (_ BitVec 64)) Unit!13743)

(assert (=> b!469948 (= lt!213212 (addStillNotContains!162 lt!213217 lt!213218 lt!213216 lt!213215))))

(assert (=> b!469948 (= lt!213215 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!7023 (ValueCell!6191 V!18531) V!18531)

(declare-fun dynLambda!917 (Int (_ BitVec 64)) V!18531)

(assert (=> b!469948 (= lt!213216 (get!7023 (select (arr!14374 _values!833) #b00000000000000000000000000000000) (dynLambda!917 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!469948 (= lt!213218 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30382 () ListLongMap!7501)

(assert (=> b!469948 (= lt!213217 call!30382)))

(declare-fun e!275261 () ListLongMap!7501)

(assert (=> b!469948 (= e!275261 (+!1723 call!30382 (tuple2!8587 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000) (get!7023 (select (arr!14374 _values!833) #b00000000000000000000000000000000) (dynLambda!917 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!30379 () Bool)

(assert (=> bm!30379 (= call!30382 (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!469949 () Bool)

(assert (=> b!469949 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14725 _keys!1025)))))

(assert (=> b!469949 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14726 _values!833)))))

(declare-fun apply!327 (ListLongMap!7501 (_ BitVec 64)) V!18531)

(assert (=> b!469949 (= e!275264 (= (apply!327 lt!213213 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000)) (get!7023 (select (arr!14374 _values!833) #b00000000000000000000000000000000) (dynLambda!917 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!469950 () Bool)

(declare-fun res!280866 () Bool)

(assert (=> b!469950 (=> (not res!280866) (not e!275260))))

(assert (=> b!469950 (= res!280866 (not (contains!2518 lt!213213 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!469951 () Bool)

(declare-fun e!275265 () Bool)

(assert (=> b!469951 (= e!275263 e!275265)))

(declare-fun c!56879 () Bool)

(assert (=> b!469951 (= c!56879 (bvslt #b00000000000000000000000000000000 (size!14725 _keys!1025)))))

(declare-fun b!469952 () Bool)

(assert (=> b!469952 (= e!275262 e!275261)))

(declare-fun c!56878 () Bool)

(assert (=> b!469952 (= c!56878 (validKeyInArray!0 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469953 () Bool)

(declare-fun isEmpty!580 (ListLongMap!7501) Bool)

(assert (=> b!469953 (= e!275265 (isEmpty!580 lt!213213))))

(declare-fun b!469954 () Bool)

(assert (=> b!469954 (= e!275265 (= lt!213213 (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!469955 () Bool)

(assert (=> b!469955 (= e!275261 call!30382)))

(assert (= (and d!75349 c!56881) b!469947))

(assert (= (and d!75349 (not c!56881)) b!469952))

(assert (= (and b!469952 c!56878) b!469948))

(assert (= (and b!469952 (not c!56878)) b!469955))

(assert (= (or b!469948 b!469955) bm!30379))

(assert (= (and d!75349 res!280865) b!469950))

(assert (= (and b!469950 res!280866) b!469946))

(assert (= (and b!469946 res!280863) b!469945))

(assert (= (and b!469946 c!56880) b!469944))

(assert (= (and b!469946 (not c!56880)) b!469951))

(assert (= (and b!469944 res!280864) b!469949))

(assert (= (and b!469951 c!56879) b!469954))

(assert (= (and b!469951 (not c!56879)) b!469953))

(declare-fun b_lambda!10127 () Bool)

(assert (=> (not b_lambda!10127) (not b!469948)))

(declare-fun t!14616 () Bool)

(declare-fun tb!3911 () Bool)

(assert (=> (and start!42074 (= defaultEntry!841 defaultEntry!841) t!14616) tb!3911))

(declare-fun result!7407 () Bool)

(assert (=> tb!3911 (= result!7407 tp_is_empty!13069)))

(assert (=> b!469948 t!14616))

(declare-fun b_and!20067 () Bool)

(assert (= b_and!20061 (and (=> t!14616 result!7407) b_and!20067)))

(declare-fun b_lambda!10129 () Bool)

(assert (=> (not b_lambda!10129) (not b!469949)))

(assert (=> b!469949 t!14616))

(declare-fun b_and!20069 () Bool)

(assert (= b_and!20067 (and (=> t!14616 result!7407) b_and!20069)))

(declare-fun m!452485 () Bool)

(assert (=> b!469944 m!452485))

(assert (=> b!469944 m!452485))

(declare-fun m!452487 () Bool)

(assert (=> b!469944 m!452487))

(declare-fun m!452489 () Bool)

(assert (=> b!469949 m!452489))

(declare-fun m!452491 () Bool)

(assert (=> b!469949 m!452491))

(declare-fun m!452493 () Bool)

(assert (=> b!469949 m!452493))

(assert (=> b!469949 m!452485))

(assert (=> b!469949 m!452491))

(assert (=> b!469949 m!452489))

(assert (=> b!469949 m!452485))

(declare-fun m!452495 () Bool)

(assert (=> b!469949 m!452495))

(declare-fun m!452497 () Bool)

(assert (=> b!469954 m!452497))

(assert (=> b!469952 m!452485))

(assert (=> b!469952 m!452485))

(declare-fun m!452499 () Bool)

(assert (=> b!469952 m!452499))

(declare-fun m!452501 () Bool)

(assert (=> b!469950 m!452501))

(assert (=> b!469945 m!452485))

(assert (=> b!469945 m!452485))

(assert (=> b!469945 m!452499))

(declare-fun m!452503 () Bool)

(assert (=> d!75349 m!452503))

(assert (=> d!75349 m!452393))

(assert (=> b!469948 m!452489))

(assert (=> b!469948 m!452491))

(assert (=> b!469948 m!452493))

(assert (=> b!469948 m!452485))

(declare-fun m!452505 () Bool)

(assert (=> b!469948 m!452505))

(assert (=> b!469948 m!452491))

(declare-fun m!452507 () Bool)

(assert (=> b!469948 m!452507))

(declare-fun m!452509 () Bool)

(assert (=> b!469948 m!452509))

(assert (=> b!469948 m!452489))

(assert (=> b!469948 m!452507))

(declare-fun m!452511 () Bool)

(assert (=> b!469948 m!452511))

(declare-fun m!452513 () Bool)

(assert (=> b!469953 m!452513))

(assert (=> bm!30379 m!452497))

(assert (=> b!469867 d!75349))

(declare-fun b!469958 () Bool)

(declare-fun e!275270 () Bool)

(declare-fun e!275271 () Bool)

(assert (=> b!469958 (= e!275270 e!275271)))

(assert (=> b!469958 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14725 _keys!1025)))))

(declare-fun res!280868 () Bool)

(declare-fun lt!213220 () ListLongMap!7501)

(assert (=> b!469958 (= res!280868 (contains!2518 lt!213220 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469958 (=> (not res!280868) (not e!275271))))

(declare-fun b!469959 () Bool)

(declare-fun e!275266 () Bool)

(assert (=> b!469959 (= e!275266 (validKeyInArray!0 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469959 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!75351 () Bool)

(declare-fun e!275267 () Bool)

(assert (=> d!75351 e!275267))

(declare-fun res!280869 () Bool)

(assert (=> d!75351 (=> (not res!280869) (not e!275267))))

(assert (=> d!75351 (= res!280869 (not (contains!2518 lt!213220 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!275269 () ListLongMap!7501)

(assert (=> d!75351 (= lt!213220 e!275269)))

(declare-fun c!56885 () Bool)

(assert (=> d!75351 (= c!56885 (bvsge #b00000000000000000000000000000000 (size!14725 _keys!1025)))))

(assert (=> d!75351 (validMask!0 mask!1365)))

(assert (=> d!75351 (= (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213220)))

(declare-fun b!469960 () Bool)

(assert (=> b!469960 (= e!275267 e!275270)))

(declare-fun c!56884 () Bool)

(assert (=> b!469960 (= c!56884 e!275266)))

(declare-fun res!280867 () Bool)

(assert (=> b!469960 (=> (not res!280867) (not e!275266))))

(assert (=> b!469960 (= res!280867 (bvslt #b00000000000000000000000000000000 (size!14725 _keys!1025)))))

(declare-fun b!469961 () Bool)

(assert (=> b!469961 (= e!275269 (ListLongMap!7502 Nil!8657))))

(declare-fun b!469962 () Bool)

(declare-fun lt!213221 () Unit!13743)

(declare-fun lt!213219 () Unit!13743)

(assert (=> b!469962 (= lt!213221 lt!213219)))

(declare-fun lt!213223 () V!18531)

(declare-fun lt!213224 () ListLongMap!7501)

(declare-fun lt!213222 () (_ BitVec 64))

(declare-fun lt!213225 () (_ BitVec 64))

(assert (=> b!469962 (not (contains!2518 (+!1723 lt!213224 (tuple2!8587 lt!213225 lt!213223)) lt!213222))))

(assert (=> b!469962 (= lt!213219 (addStillNotContains!162 lt!213224 lt!213225 lt!213223 lt!213222))))

(assert (=> b!469962 (= lt!213222 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!469962 (= lt!213223 (get!7023 (select (arr!14374 _values!833) #b00000000000000000000000000000000) (dynLambda!917 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!469962 (= lt!213225 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30383 () ListLongMap!7501)

(assert (=> b!469962 (= lt!213224 call!30383)))

(declare-fun e!275268 () ListLongMap!7501)

(assert (=> b!469962 (= e!275268 (+!1723 call!30383 (tuple2!8587 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000) (get!7023 (select (arr!14374 _values!833) #b00000000000000000000000000000000) (dynLambda!917 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!30380 () Bool)

(assert (=> bm!30380 (= call!30383 (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!469963 () Bool)

(assert (=> b!469963 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14725 _keys!1025)))))

(assert (=> b!469963 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14726 _values!833)))))

(assert (=> b!469963 (= e!275271 (= (apply!327 lt!213220 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000)) (get!7023 (select (arr!14374 _values!833) #b00000000000000000000000000000000) (dynLambda!917 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!469964 () Bool)

(declare-fun res!280870 () Bool)

(assert (=> b!469964 (=> (not res!280870) (not e!275267))))

(assert (=> b!469964 (= res!280870 (not (contains!2518 lt!213220 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!469965 () Bool)

(declare-fun e!275272 () Bool)

(assert (=> b!469965 (= e!275270 e!275272)))

(declare-fun c!56883 () Bool)

(assert (=> b!469965 (= c!56883 (bvslt #b00000000000000000000000000000000 (size!14725 _keys!1025)))))

(declare-fun b!469966 () Bool)

(assert (=> b!469966 (= e!275269 e!275268)))

(declare-fun c!56882 () Bool)

(assert (=> b!469966 (= c!56882 (validKeyInArray!0 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469967 () Bool)

(assert (=> b!469967 (= e!275272 (isEmpty!580 lt!213220))))

(declare-fun b!469968 () Bool)

(assert (=> b!469968 (= e!275272 (= lt!213220 (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!469969 () Bool)

(assert (=> b!469969 (= e!275268 call!30383)))

(assert (= (and d!75351 c!56885) b!469961))

(assert (= (and d!75351 (not c!56885)) b!469966))

(assert (= (and b!469966 c!56882) b!469962))

(assert (= (and b!469966 (not c!56882)) b!469969))

(assert (= (or b!469962 b!469969) bm!30380))

(assert (= (and d!75351 res!280869) b!469964))

(assert (= (and b!469964 res!280870) b!469960))

(assert (= (and b!469960 res!280867) b!469959))

(assert (= (and b!469960 c!56884) b!469958))

(assert (= (and b!469960 (not c!56884)) b!469965))

(assert (= (and b!469958 res!280868) b!469963))

(assert (= (and b!469965 c!56883) b!469968))

(assert (= (and b!469965 (not c!56883)) b!469967))

(declare-fun b_lambda!10131 () Bool)

(assert (=> (not b_lambda!10131) (not b!469962)))

(assert (=> b!469962 t!14616))

(declare-fun b_and!20071 () Bool)

(assert (= b_and!20069 (and (=> t!14616 result!7407) b_and!20071)))

(declare-fun b_lambda!10133 () Bool)

(assert (=> (not b_lambda!10133) (not b!469963)))

(assert (=> b!469963 t!14616))

(declare-fun b_and!20073 () Bool)

(assert (= b_and!20071 (and (=> t!14616 result!7407) b_and!20073)))

(assert (=> b!469958 m!452485))

(assert (=> b!469958 m!452485))

(declare-fun m!452515 () Bool)

(assert (=> b!469958 m!452515))

(assert (=> b!469963 m!452489))

(assert (=> b!469963 m!452491))

(assert (=> b!469963 m!452493))

(assert (=> b!469963 m!452485))

(assert (=> b!469963 m!452491))

(assert (=> b!469963 m!452489))

(assert (=> b!469963 m!452485))

(declare-fun m!452517 () Bool)

(assert (=> b!469963 m!452517))

(declare-fun m!452519 () Bool)

(assert (=> b!469968 m!452519))

(assert (=> b!469966 m!452485))

(assert (=> b!469966 m!452485))

(assert (=> b!469966 m!452499))

(declare-fun m!452521 () Bool)

(assert (=> b!469964 m!452521))

(assert (=> b!469959 m!452485))

(assert (=> b!469959 m!452485))

(assert (=> b!469959 m!452499))

(declare-fun m!452523 () Bool)

(assert (=> d!75351 m!452523))

(assert (=> d!75351 m!452393))

(assert (=> b!469962 m!452489))

(assert (=> b!469962 m!452491))

(assert (=> b!469962 m!452493))

(assert (=> b!469962 m!452485))

(declare-fun m!452525 () Bool)

(assert (=> b!469962 m!452525))

(assert (=> b!469962 m!452491))

(declare-fun m!452527 () Bool)

(assert (=> b!469962 m!452527))

(declare-fun m!452529 () Bool)

(assert (=> b!469962 m!452529))

(assert (=> b!469962 m!452489))

(assert (=> b!469962 m!452527))

(declare-fun m!452531 () Bool)

(assert (=> b!469962 m!452531))

(declare-fun m!452533 () Bool)

(assert (=> b!469967 m!452533))

(assert (=> bm!30380 m!452519))

(assert (=> b!469867 d!75351))

(declare-fun b!469980 () Bool)

(declare-fun e!275284 () Bool)

(declare-fun e!275281 () Bool)

(assert (=> b!469980 (= e!275284 e!275281)))

(declare-fun res!280878 () Bool)

(assert (=> b!469980 (=> (not res!280878) (not e!275281))))

(declare-fun e!275282 () Bool)

(assert (=> b!469980 (= res!280878 (not e!275282))))

(declare-fun res!280879 () Bool)

(assert (=> b!469980 (=> (not res!280879) (not e!275282))))

(assert (=> b!469980 (= res!280879 (validKeyInArray!0 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469981 () Bool)

(declare-fun e!275283 () Bool)

(declare-fun call!30386 () Bool)

(assert (=> b!469981 (= e!275283 call!30386)))

(declare-fun bm!30383 () Bool)

(declare-fun c!56888 () Bool)

(assert (=> bm!30383 (= call!30386 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56888 (Cons!8655 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000) Nil!8656) Nil!8656)))))

(declare-fun b!469982 () Bool)

(assert (=> b!469982 (= e!275283 call!30386)))

(declare-fun d!75353 () Bool)

(declare-fun res!280877 () Bool)

(assert (=> d!75353 (=> res!280877 e!275284)))

(assert (=> d!75353 (= res!280877 (bvsge #b00000000000000000000000000000000 (size!14725 _keys!1025)))))

(assert (=> d!75353 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8656) e!275284)))

(declare-fun b!469983 () Bool)

(declare-fun contains!2519 (List!8659 (_ BitVec 64)) Bool)

(assert (=> b!469983 (= e!275282 (contains!2519 Nil!8656 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469984 () Bool)

(assert (=> b!469984 (= e!275281 e!275283)))

(assert (=> b!469984 (= c!56888 (validKeyInArray!0 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75353 (not res!280877)) b!469980))

(assert (= (and b!469980 res!280879) b!469983))

(assert (= (and b!469980 res!280878) b!469984))

(assert (= (and b!469984 c!56888) b!469982))

(assert (= (and b!469984 (not c!56888)) b!469981))

(assert (= (or b!469982 b!469981) bm!30383))

(assert (=> b!469980 m!452485))

(assert (=> b!469980 m!452485))

(assert (=> b!469980 m!452499))

(assert (=> bm!30383 m!452485))

(declare-fun m!452535 () Bool)

(assert (=> bm!30383 m!452535))

(assert (=> b!469983 m!452485))

(assert (=> b!469983 m!452485))

(declare-fun m!452537 () Bool)

(assert (=> b!469983 m!452537))

(assert (=> b!469984 m!452485))

(assert (=> b!469984 m!452485))

(assert (=> b!469984 m!452499))

(assert (=> b!469865 d!75353))

(declare-fun d!75355 () Bool)

(assert (=> d!75355 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42074 d!75355))

(declare-fun d!75357 () Bool)

(assert (=> d!75357 (= (array_inv!10462 _keys!1025) (bvsge (size!14725 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42074 d!75357))

(declare-fun d!75359 () Bool)

(assert (=> d!75359 (= (array_inv!10463 _values!833) (bvsge (size!14726 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42074 d!75359))

(declare-fun b!470027 () Bool)

(declare-fun e!275318 () Unit!13743)

(declare-fun lt!213287 () Unit!13743)

(assert (=> b!470027 (= e!275318 lt!213287)))

(declare-fun lt!213285 () ListLongMap!7501)

(assert (=> b!470027 (= lt!213285 (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213284 () (_ BitVec 64))

(assert (=> b!470027 (= lt!213284 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213277 () (_ BitVec 64))

(assert (=> b!470027 (= lt!213277 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213282 () Unit!13743)

(declare-fun addStillContains!289 (ListLongMap!7501 (_ BitVec 64) V!18531 (_ BitVec 64)) Unit!13743)

(assert (=> b!470027 (= lt!213282 (addStillContains!289 lt!213285 lt!213284 zeroValue!794 lt!213277))))

(assert (=> b!470027 (contains!2518 (+!1723 lt!213285 (tuple2!8587 lt!213284 zeroValue!794)) lt!213277)))

(declare-fun lt!213279 () Unit!13743)

(assert (=> b!470027 (= lt!213279 lt!213282)))

(declare-fun lt!213270 () ListLongMap!7501)

(assert (=> b!470027 (= lt!213270 (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213288 () (_ BitVec 64))

(assert (=> b!470027 (= lt!213288 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213272 () (_ BitVec 64))

(assert (=> b!470027 (= lt!213272 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213273 () Unit!13743)

(declare-fun addApplyDifferent!289 (ListLongMap!7501 (_ BitVec 64) V!18531 (_ BitVec 64)) Unit!13743)

(assert (=> b!470027 (= lt!213273 (addApplyDifferent!289 lt!213270 lt!213288 minValueAfter!38 lt!213272))))

(assert (=> b!470027 (= (apply!327 (+!1723 lt!213270 (tuple2!8587 lt!213288 minValueAfter!38)) lt!213272) (apply!327 lt!213270 lt!213272))))

(declare-fun lt!213291 () Unit!13743)

(assert (=> b!470027 (= lt!213291 lt!213273)))

(declare-fun lt!213289 () ListLongMap!7501)

(assert (=> b!470027 (= lt!213289 (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213286 () (_ BitVec 64))

(assert (=> b!470027 (= lt!213286 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213290 () (_ BitVec 64))

(assert (=> b!470027 (= lt!213290 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213276 () Unit!13743)

(assert (=> b!470027 (= lt!213276 (addApplyDifferent!289 lt!213289 lt!213286 zeroValue!794 lt!213290))))

(assert (=> b!470027 (= (apply!327 (+!1723 lt!213289 (tuple2!8587 lt!213286 zeroValue!794)) lt!213290) (apply!327 lt!213289 lt!213290))))

(declare-fun lt!213275 () Unit!13743)

(assert (=> b!470027 (= lt!213275 lt!213276)))

(declare-fun lt!213274 () ListLongMap!7501)

(assert (=> b!470027 (= lt!213274 (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213280 () (_ BitVec 64))

(assert (=> b!470027 (= lt!213280 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213283 () (_ BitVec 64))

(assert (=> b!470027 (= lt!213283 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!470027 (= lt!213287 (addApplyDifferent!289 lt!213274 lt!213280 minValueAfter!38 lt!213283))))

(assert (=> b!470027 (= (apply!327 (+!1723 lt!213274 (tuple2!8587 lt!213280 minValueAfter!38)) lt!213283) (apply!327 lt!213274 lt!213283))))

(declare-fun b!470028 () Bool)

(declare-fun e!275323 () Bool)

(assert (=> b!470028 (= e!275323 (validKeyInArray!0 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470029 () Bool)

(declare-fun e!275311 () Bool)

(declare-fun e!275316 () Bool)

(assert (=> b!470029 (= e!275311 e!275316)))

(declare-fun c!56901 () Bool)

(assert (=> b!470029 (= c!56901 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!470030 () Bool)

(declare-fun e!275320 () Bool)

(assert (=> b!470030 (= e!275320 (validKeyInArray!0 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470031 () Bool)

(declare-fun res!280899 () Bool)

(assert (=> b!470031 (=> (not res!280899) (not e!275311))))

(declare-fun e!275317 () Bool)

(assert (=> b!470031 (= res!280899 e!275317)))

(declare-fun c!56905 () Bool)

(assert (=> b!470031 (= c!56905 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!470032 () Bool)

(declare-fun e!275313 () ListLongMap!7501)

(declare-fun call!30404 () ListLongMap!7501)

(assert (=> b!470032 (= e!275313 call!30404)))

(declare-fun b!470033 () Bool)

(declare-fun e!275322 () Bool)

(assert (=> b!470033 (= e!275317 e!275322)))

(declare-fun res!280901 () Bool)

(declare-fun call!30407 () Bool)

(assert (=> b!470033 (= res!280901 call!30407)))

(assert (=> b!470033 (=> (not res!280901) (not e!275322))))

(declare-fun b!470034 () Bool)

(declare-fun e!275321 () Bool)

(declare-fun lt!213281 () ListLongMap!7501)

(assert (=> b!470034 (= e!275321 (= (apply!327 lt!213281 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!470035 () Bool)

(declare-fun e!275312 () Bool)

(declare-fun e!275319 () Bool)

(assert (=> b!470035 (= e!275312 e!275319)))

(declare-fun res!280906 () Bool)

(assert (=> b!470035 (=> (not res!280906) (not e!275319))))

(assert (=> b!470035 (= res!280906 (contains!2518 lt!213281 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!470035 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14725 _keys!1025)))))

(declare-fun b!470036 () Bool)

(declare-fun e!275315 () ListLongMap!7501)

(assert (=> b!470036 (= e!275315 e!275313)))

(declare-fun c!56904 () Bool)

(assert (=> b!470036 (= c!56904 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30398 () Bool)

(assert (=> bm!30398 (= call!30407 (contains!2518 lt!213281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30399 () Bool)

(declare-fun call!30403 () Bool)

(assert (=> bm!30399 (= call!30403 (contains!2518 lt!213281 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!470037 () Bool)

(assert (=> b!470037 (= e!275322 (= (apply!327 lt!213281 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!470038 () Bool)

(assert (=> b!470038 (= e!275317 (not call!30407))))

(declare-fun d!75361 () Bool)

(assert (=> d!75361 e!275311))

(declare-fun res!280904 () Bool)

(assert (=> d!75361 (=> (not res!280904) (not e!275311))))

(assert (=> d!75361 (= res!280904 (or (bvsge #b00000000000000000000000000000000 (size!14725 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14725 _keys!1025)))))))

(declare-fun lt!213278 () ListLongMap!7501)

(assert (=> d!75361 (= lt!213281 lt!213278)))

(declare-fun lt!213271 () Unit!13743)

(assert (=> d!75361 (= lt!213271 e!275318)))

(declare-fun c!56902 () Bool)

(assert (=> d!75361 (= c!56902 e!275320)))

(declare-fun res!280902 () Bool)

(assert (=> d!75361 (=> (not res!280902) (not e!275320))))

(assert (=> d!75361 (= res!280902 (bvslt #b00000000000000000000000000000000 (size!14725 _keys!1025)))))

(assert (=> d!75361 (= lt!213278 e!275315)))

(declare-fun c!56903 () Bool)

(assert (=> d!75361 (= c!56903 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75361 (validMask!0 mask!1365)))

(assert (=> d!75361 (= (getCurrentListMap!2189 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213281)))

(declare-fun b!470039 () Bool)

(assert (=> b!470039 (= e!275316 e!275321)))

(declare-fun res!280900 () Bool)

(assert (=> b!470039 (= res!280900 call!30403)))

(assert (=> b!470039 (=> (not res!280900) (not e!275321))))

(declare-fun bm!30400 () Bool)

(declare-fun call!30401 () ListLongMap!7501)

(declare-fun call!30402 () ListLongMap!7501)

(assert (=> bm!30400 (= call!30401 call!30402)))

(declare-fun b!470040 () Bool)

(declare-fun e!275314 () ListLongMap!7501)

(assert (=> b!470040 (= e!275314 call!30404)))

(declare-fun b!470041 () Bool)

(declare-fun res!280903 () Bool)

(assert (=> b!470041 (=> (not res!280903) (not e!275311))))

(assert (=> b!470041 (= res!280903 e!275312)))

(declare-fun res!280898 () Bool)

(assert (=> b!470041 (=> res!280898 e!275312)))

(assert (=> b!470041 (= res!280898 (not e!275323))))

(declare-fun res!280905 () Bool)

(assert (=> b!470041 (=> (not res!280905) (not e!275323))))

(assert (=> b!470041 (= res!280905 (bvslt #b00000000000000000000000000000000 (size!14725 _keys!1025)))))

(declare-fun bm!30401 () Bool)

(declare-fun call!30406 () ListLongMap!7501)

(assert (=> bm!30401 (= call!30406 call!30401)))

(declare-fun bm!30402 () Bool)

(assert (=> bm!30402 (= call!30402 (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470042 () Bool)

(assert (=> b!470042 (= e!275314 call!30406)))

(declare-fun b!470043 () Bool)

(assert (=> b!470043 (= e!275316 (not call!30403))))

(declare-fun b!470044 () Bool)

(assert (=> b!470044 (= e!275319 (= (apply!327 lt!213281 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000)) (get!7023 (select (arr!14374 _values!833) #b00000000000000000000000000000000) (dynLambda!917 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!470044 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14726 _values!833)))))

(assert (=> b!470044 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14725 _keys!1025)))))

(declare-fun b!470045 () Bool)

(declare-fun call!30405 () ListLongMap!7501)

(assert (=> b!470045 (= e!275315 (+!1723 call!30405 (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun bm!30403 () Bool)

(assert (=> bm!30403 (= call!30404 call!30405)))

(declare-fun bm!30404 () Bool)

(assert (=> bm!30404 (= call!30405 (+!1723 (ite c!56903 call!30402 (ite c!56904 call!30401 call!30406)) (ite (or c!56903 c!56904) (tuple2!8587 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!470046 () Bool)

(declare-fun Unit!13747 () Unit!13743)

(assert (=> b!470046 (= e!275318 Unit!13747)))

(declare-fun b!470047 () Bool)

(declare-fun c!56906 () Bool)

(assert (=> b!470047 (= c!56906 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!470047 (= e!275313 e!275314)))

(assert (= (and d!75361 c!56903) b!470045))

(assert (= (and d!75361 (not c!56903)) b!470036))

(assert (= (and b!470036 c!56904) b!470032))

(assert (= (and b!470036 (not c!56904)) b!470047))

(assert (= (and b!470047 c!56906) b!470040))

(assert (= (and b!470047 (not c!56906)) b!470042))

(assert (= (or b!470040 b!470042) bm!30401))

(assert (= (or b!470032 bm!30401) bm!30400))

(assert (= (or b!470032 b!470040) bm!30403))

(assert (= (or b!470045 bm!30400) bm!30402))

(assert (= (or b!470045 bm!30403) bm!30404))

(assert (= (and d!75361 res!280902) b!470030))

(assert (= (and d!75361 c!56902) b!470027))

(assert (= (and d!75361 (not c!56902)) b!470046))

(assert (= (and d!75361 res!280904) b!470041))

(assert (= (and b!470041 res!280905) b!470028))

(assert (= (and b!470041 (not res!280898)) b!470035))

(assert (= (and b!470035 res!280906) b!470044))

(assert (= (and b!470041 res!280903) b!470031))

(assert (= (and b!470031 c!56905) b!470033))

(assert (= (and b!470031 (not c!56905)) b!470038))

(assert (= (and b!470033 res!280901) b!470037))

(assert (= (or b!470033 b!470038) bm!30398))

(assert (= (and b!470031 res!280899) b!470029))

(assert (= (and b!470029 c!56901) b!470039))

(assert (= (and b!470029 (not c!56901)) b!470043))

(assert (= (and b!470039 res!280900) b!470034))

(assert (= (or b!470039 b!470043) bm!30399))

(declare-fun b_lambda!10135 () Bool)

(assert (=> (not b_lambda!10135) (not b!470044)))

(assert (=> b!470044 t!14616))

(declare-fun b_and!20075 () Bool)

(assert (= b_and!20073 (and (=> t!14616 result!7407) b_and!20075)))

(assert (=> b!470044 m!452485))

(assert (=> b!470044 m!452489))

(assert (=> b!470044 m!452485))

(declare-fun m!452539 () Bool)

(assert (=> b!470044 m!452539))

(assert (=> b!470044 m!452489))

(assert (=> b!470044 m!452491))

(assert (=> b!470044 m!452493))

(assert (=> b!470044 m!452491))

(assert (=> b!470035 m!452485))

(assert (=> b!470035 m!452485))

(declare-fun m!452541 () Bool)

(assert (=> b!470035 m!452541))

(assert (=> b!470028 m!452485))

(assert (=> b!470028 m!452485))

(assert (=> b!470028 m!452499))

(declare-fun m!452543 () Bool)

(assert (=> bm!30404 m!452543))

(declare-fun m!452545 () Bool)

(assert (=> b!470034 m!452545))

(assert (=> b!470030 m!452485))

(assert (=> b!470030 m!452485))

(assert (=> b!470030 m!452499))

(assert (=> bm!30402 m!452401))

(declare-fun m!452547 () Bool)

(assert (=> b!470027 m!452547))

(assert (=> b!470027 m!452547))

(declare-fun m!452549 () Bool)

(assert (=> b!470027 m!452549))

(declare-fun m!452551 () Bool)

(assert (=> b!470027 m!452551))

(declare-fun m!452553 () Bool)

(assert (=> b!470027 m!452553))

(assert (=> b!470027 m!452401))

(declare-fun m!452555 () Bool)

(assert (=> b!470027 m!452555))

(declare-fun m!452557 () Bool)

(assert (=> b!470027 m!452557))

(declare-fun m!452559 () Bool)

(assert (=> b!470027 m!452559))

(declare-fun m!452561 () Bool)

(assert (=> b!470027 m!452561))

(declare-fun m!452563 () Bool)

(assert (=> b!470027 m!452563))

(declare-fun m!452565 () Bool)

(assert (=> b!470027 m!452565))

(declare-fun m!452567 () Bool)

(assert (=> b!470027 m!452567))

(declare-fun m!452569 () Bool)

(assert (=> b!470027 m!452569))

(assert (=> b!470027 m!452485))

(assert (=> b!470027 m!452551))

(assert (=> b!470027 m!452555))

(declare-fun m!452571 () Bool)

(assert (=> b!470027 m!452571))

(declare-fun m!452573 () Bool)

(assert (=> b!470027 m!452573))

(declare-fun m!452575 () Bool)

(assert (=> b!470027 m!452575))

(assert (=> b!470027 m!452559))

(declare-fun m!452577 () Bool)

(assert (=> b!470037 m!452577))

(declare-fun m!452579 () Bool)

(assert (=> b!470045 m!452579))

(declare-fun m!452581 () Bool)

(assert (=> bm!30399 m!452581))

(declare-fun m!452583 () Bool)

(assert (=> bm!30398 m!452583))

(assert (=> d!75361 m!452393))

(assert (=> b!469866 d!75361))

(declare-fun d!75363 () Bool)

(declare-fun e!275326 () Bool)

(assert (=> d!75363 e!275326))

(declare-fun res!280911 () Bool)

(assert (=> d!75363 (=> (not res!280911) (not e!275326))))

(declare-fun lt!213302 () ListLongMap!7501)

(assert (=> d!75363 (= res!280911 (contains!2518 lt!213302 (_1!4304 (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lt!213301 () List!8660)

(assert (=> d!75363 (= lt!213302 (ListLongMap!7502 lt!213301))))

(declare-fun lt!213303 () Unit!13743)

(declare-fun lt!213300 () Unit!13743)

(assert (=> d!75363 (= lt!213303 lt!213300)))

(declare-datatypes ((Option!386 0))(
  ( (Some!385 (v!8873 V!18531)) (None!384) )
))
(declare-fun getValueByKey!380 (List!8660 (_ BitVec 64)) Option!386)

(assert (=> d!75363 (= (getValueByKey!380 lt!213301 (_1!4304 (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!385 (_2!4304 (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lemmaContainsTupThenGetReturnValue!202 (List!8660 (_ BitVec 64) V!18531) Unit!13743)

(assert (=> d!75363 (= lt!213300 (lemmaContainsTupThenGetReturnValue!202 lt!213301 (_1!4304 (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4304 (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun insertStrictlySorted!205 (List!8660 (_ BitVec 64) V!18531) List!8660)

(assert (=> d!75363 (= lt!213301 (insertStrictlySorted!205 (toList!3766 lt!213150) (_1!4304 (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4304 (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75363 (= (+!1723 lt!213150 (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!213302)))

(declare-fun b!470052 () Bool)

(declare-fun res!280912 () Bool)

(assert (=> b!470052 (=> (not res!280912) (not e!275326))))

(assert (=> b!470052 (= res!280912 (= (getValueByKey!380 (toList!3766 lt!213302) (_1!4304 (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!385 (_2!4304 (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))))

(declare-fun b!470053 () Bool)

(declare-fun contains!2520 (List!8660 tuple2!8586) Bool)

(assert (=> b!470053 (= e!275326 (contains!2520 (toList!3766 lt!213302) (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!75363 res!280911) b!470052))

(assert (= (and b!470052 res!280912) b!470053))

(declare-fun m!452585 () Bool)

(assert (=> d!75363 m!452585))

(declare-fun m!452587 () Bool)

(assert (=> d!75363 m!452587))

(declare-fun m!452589 () Bool)

(assert (=> d!75363 m!452589))

(declare-fun m!452591 () Bool)

(assert (=> d!75363 m!452591))

(declare-fun m!452593 () Bool)

(assert (=> b!470052 m!452593))

(declare-fun m!452595 () Bool)

(assert (=> b!470053 m!452595))

(assert (=> b!469866 d!75363))

(declare-fun d!75365 () Bool)

(assert (=> d!75365 (= (+!1723 lt!213150 (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (+!1723 (+!1723 lt!213150 (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun lt!213306 () Unit!13743)

(declare-fun choose!1353 (ListLongMap!7501 (_ BitVec 64) V!18531 V!18531) Unit!13743)

(assert (=> d!75365 (= lt!213306 (choose!1353 lt!213150 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> d!75365 (= (addSameAsAddTwiceSameKeyDiffValues!129 lt!213150 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38) lt!213306)))

(declare-fun bs!14908 () Bool)

(assert (= bs!14908 d!75365))

(declare-fun m!452597 () Bool)

(assert (=> bs!14908 m!452597))

(assert (=> bs!14908 m!452405))

(assert (=> bs!14908 m!452405))

(declare-fun m!452599 () Bool)

(assert (=> bs!14908 m!452599))

(declare-fun m!452601 () Bool)

(assert (=> bs!14908 m!452601))

(assert (=> b!469866 d!75365))

(declare-fun d!75367 () Bool)

(declare-fun e!275327 () Bool)

(assert (=> d!75367 e!275327))

(declare-fun res!280913 () Bool)

(assert (=> d!75367 (=> (not res!280913) (not e!275327))))

(declare-fun lt!213309 () ListLongMap!7501)

(assert (=> d!75367 (= res!280913 (contains!2518 lt!213309 (_1!4304 lt!213152)))))

(declare-fun lt!213308 () List!8660)

(assert (=> d!75367 (= lt!213309 (ListLongMap!7502 lt!213308))))

(declare-fun lt!213310 () Unit!13743)

(declare-fun lt!213307 () Unit!13743)

(assert (=> d!75367 (= lt!213310 lt!213307)))

(assert (=> d!75367 (= (getValueByKey!380 lt!213308 (_1!4304 lt!213152)) (Some!385 (_2!4304 lt!213152)))))

(assert (=> d!75367 (= lt!213307 (lemmaContainsTupThenGetReturnValue!202 lt!213308 (_1!4304 lt!213152) (_2!4304 lt!213152)))))

(assert (=> d!75367 (= lt!213308 (insertStrictlySorted!205 (toList!3766 (+!1723 lt!213150 (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (_1!4304 lt!213152) (_2!4304 lt!213152)))))

(assert (=> d!75367 (= (+!1723 (+!1723 lt!213150 (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!213152) lt!213309)))

(declare-fun b!470054 () Bool)

(declare-fun res!280914 () Bool)

(assert (=> b!470054 (=> (not res!280914) (not e!275327))))

(assert (=> b!470054 (= res!280914 (= (getValueByKey!380 (toList!3766 lt!213309) (_1!4304 lt!213152)) (Some!385 (_2!4304 lt!213152))))))

(declare-fun b!470055 () Bool)

(assert (=> b!470055 (= e!275327 (contains!2520 (toList!3766 lt!213309) lt!213152))))

(assert (= (and d!75367 res!280913) b!470054))

(assert (= (and b!470054 res!280914) b!470055))

(declare-fun m!452603 () Bool)

(assert (=> d!75367 m!452603))

(declare-fun m!452605 () Bool)

(assert (=> d!75367 m!452605))

(declare-fun m!452607 () Bool)

(assert (=> d!75367 m!452607))

(declare-fun m!452609 () Bool)

(assert (=> d!75367 m!452609))

(declare-fun m!452611 () Bool)

(assert (=> b!470054 m!452611))

(declare-fun m!452613 () Bool)

(assert (=> b!470055 m!452613))

(assert (=> b!469866 d!75367))

(declare-fun d!75369 () Bool)

(declare-fun e!275328 () Bool)

(assert (=> d!75369 e!275328))

(declare-fun res!280915 () Bool)

(assert (=> d!75369 (=> (not res!280915) (not e!275328))))

(declare-fun lt!213313 () ListLongMap!7501)

(assert (=> d!75369 (= res!280915 (contains!2518 lt!213313 (_1!4304 lt!213152)))))

(declare-fun lt!213312 () List!8660)

(assert (=> d!75369 (= lt!213313 (ListLongMap!7502 lt!213312))))

(declare-fun lt!213314 () Unit!13743)

(declare-fun lt!213311 () Unit!13743)

(assert (=> d!75369 (= lt!213314 lt!213311)))

(assert (=> d!75369 (= (getValueByKey!380 lt!213312 (_1!4304 lt!213152)) (Some!385 (_2!4304 lt!213152)))))

(assert (=> d!75369 (= lt!213311 (lemmaContainsTupThenGetReturnValue!202 lt!213312 (_1!4304 lt!213152) (_2!4304 lt!213152)))))

(assert (=> d!75369 (= lt!213312 (insertStrictlySorted!205 (toList!3766 lt!213150) (_1!4304 lt!213152) (_2!4304 lt!213152)))))

(assert (=> d!75369 (= (+!1723 lt!213150 lt!213152) lt!213313)))

(declare-fun b!470056 () Bool)

(declare-fun res!280916 () Bool)

(assert (=> b!470056 (=> (not res!280916) (not e!275328))))

(assert (=> b!470056 (= res!280916 (= (getValueByKey!380 (toList!3766 lt!213313) (_1!4304 lt!213152)) (Some!385 (_2!4304 lt!213152))))))

(declare-fun b!470057 () Bool)

(assert (=> b!470057 (= e!275328 (contains!2520 (toList!3766 lt!213313) lt!213152))))

(assert (= (and d!75369 res!280915) b!470056))

(assert (= (and b!470056 res!280916) b!470057))

(declare-fun m!452615 () Bool)

(assert (=> d!75369 m!452615))

(declare-fun m!452617 () Bool)

(assert (=> d!75369 m!452617))

(declare-fun m!452619 () Bool)

(assert (=> d!75369 m!452619))

(declare-fun m!452621 () Bool)

(assert (=> d!75369 m!452621))

(declare-fun m!452623 () Bool)

(assert (=> b!470056 m!452623))

(declare-fun m!452625 () Bool)

(assert (=> b!470057 m!452625))

(assert (=> b!469866 d!75369))

(declare-fun b!470058 () Bool)

(declare-fun e!275336 () Unit!13743)

(declare-fun lt!213332 () Unit!13743)

(assert (=> b!470058 (= e!275336 lt!213332)))

(declare-fun lt!213330 () ListLongMap!7501)

(assert (=> b!470058 (= lt!213330 (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213329 () (_ BitVec 64))

(assert (=> b!470058 (= lt!213329 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213322 () (_ BitVec 64))

(assert (=> b!470058 (= lt!213322 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213327 () Unit!13743)

(assert (=> b!470058 (= lt!213327 (addStillContains!289 lt!213330 lt!213329 zeroValue!794 lt!213322))))

(assert (=> b!470058 (contains!2518 (+!1723 lt!213330 (tuple2!8587 lt!213329 zeroValue!794)) lt!213322)))

(declare-fun lt!213324 () Unit!13743)

(assert (=> b!470058 (= lt!213324 lt!213327)))

(declare-fun lt!213315 () ListLongMap!7501)

(assert (=> b!470058 (= lt!213315 (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213333 () (_ BitVec 64))

(assert (=> b!470058 (= lt!213333 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213317 () (_ BitVec 64))

(assert (=> b!470058 (= lt!213317 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213318 () Unit!13743)

(assert (=> b!470058 (= lt!213318 (addApplyDifferent!289 lt!213315 lt!213333 minValueBefore!38 lt!213317))))

(assert (=> b!470058 (= (apply!327 (+!1723 lt!213315 (tuple2!8587 lt!213333 minValueBefore!38)) lt!213317) (apply!327 lt!213315 lt!213317))))

(declare-fun lt!213336 () Unit!13743)

(assert (=> b!470058 (= lt!213336 lt!213318)))

(declare-fun lt!213334 () ListLongMap!7501)

(assert (=> b!470058 (= lt!213334 (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213331 () (_ BitVec 64))

(assert (=> b!470058 (= lt!213331 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213335 () (_ BitVec 64))

(assert (=> b!470058 (= lt!213335 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213321 () Unit!13743)

(assert (=> b!470058 (= lt!213321 (addApplyDifferent!289 lt!213334 lt!213331 zeroValue!794 lt!213335))))

(assert (=> b!470058 (= (apply!327 (+!1723 lt!213334 (tuple2!8587 lt!213331 zeroValue!794)) lt!213335) (apply!327 lt!213334 lt!213335))))

(declare-fun lt!213320 () Unit!13743)

(assert (=> b!470058 (= lt!213320 lt!213321)))

(declare-fun lt!213319 () ListLongMap!7501)

(assert (=> b!470058 (= lt!213319 (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213325 () (_ BitVec 64))

(assert (=> b!470058 (= lt!213325 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213328 () (_ BitVec 64))

(assert (=> b!470058 (= lt!213328 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!470058 (= lt!213332 (addApplyDifferent!289 lt!213319 lt!213325 minValueBefore!38 lt!213328))))

(assert (=> b!470058 (= (apply!327 (+!1723 lt!213319 (tuple2!8587 lt!213325 minValueBefore!38)) lt!213328) (apply!327 lt!213319 lt!213328))))

(declare-fun b!470059 () Bool)

(declare-fun e!275341 () Bool)

(assert (=> b!470059 (= e!275341 (validKeyInArray!0 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470060 () Bool)

(declare-fun e!275329 () Bool)

(declare-fun e!275334 () Bool)

(assert (=> b!470060 (= e!275329 e!275334)))

(declare-fun c!56907 () Bool)

(assert (=> b!470060 (= c!56907 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!470061 () Bool)

(declare-fun e!275338 () Bool)

(assert (=> b!470061 (= e!275338 (validKeyInArray!0 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470062 () Bool)

(declare-fun res!280918 () Bool)

(assert (=> b!470062 (=> (not res!280918) (not e!275329))))

(declare-fun e!275335 () Bool)

(assert (=> b!470062 (= res!280918 e!275335)))

(declare-fun c!56911 () Bool)

(assert (=> b!470062 (= c!56911 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!470063 () Bool)

(declare-fun e!275331 () ListLongMap!7501)

(declare-fun call!30411 () ListLongMap!7501)

(assert (=> b!470063 (= e!275331 call!30411)))

(declare-fun b!470064 () Bool)

(declare-fun e!275340 () Bool)

(assert (=> b!470064 (= e!275335 e!275340)))

(declare-fun res!280920 () Bool)

(declare-fun call!30414 () Bool)

(assert (=> b!470064 (= res!280920 call!30414)))

(assert (=> b!470064 (=> (not res!280920) (not e!275340))))

(declare-fun b!470065 () Bool)

(declare-fun e!275339 () Bool)

(declare-fun lt!213326 () ListLongMap!7501)

(assert (=> b!470065 (= e!275339 (= (apply!327 lt!213326 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!470066 () Bool)

(declare-fun e!275330 () Bool)

(declare-fun e!275337 () Bool)

(assert (=> b!470066 (= e!275330 e!275337)))

(declare-fun res!280925 () Bool)

(assert (=> b!470066 (=> (not res!280925) (not e!275337))))

(assert (=> b!470066 (= res!280925 (contains!2518 lt!213326 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!470066 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14725 _keys!1025)))))

(declare-fun b!470067 () Bool)

(declare-fun e!275333 () ListLongMap!7501)

(assert (=> b!470067 (= e!275333 e!275331)))

(declare-fun c!56910 () Bool)

(assert (=> b!470067 (= c!56910 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30405 () Bool)

(assert (=> bm!30405 (= call!30414 (contains!2518 lt!213326 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30406 () Bool)

(declare-fun call!30410 () Bool)

(assert (=> bm!30406 (= call!30410 (contains!2518 lt!213326 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!470068 () Bool)

(assert (=> b!470068 (= e!275340 (= (apply!327 lt!213326 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!470069 () Bool)

(assert (=> b!470069 (= e!275335 (not call!30414))))

(declare-fun d!75371 () Bool)

(assert (=> d!75371 e!275329))

(declare-fun res!280923 () Bool)

(assert (=> d!75371 (=> (not res!280923) (not e!275329))))

(assert (=> d!75371 (= res!280923 (or (bvsge #b00000000000000000000000000000000 (size!14725 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14725 _keys!1025)))))))

(declare-fun lt!213323 () ListLongMap!7501)

(assert (=> d!75371 (= lt!213326 lt!213323)))

(declare-fun lt!213316 () Unit!13743)

(assert (=> d!75371 (= lt!213316 e!275336)))

(declare-fun c!56908 () Bool)

(assert (=> d!75371 (= c!56908 e!275338)))

(declare-fun res!280921 () Bool)

(assert (=> d!75371 (=> (not res!280921) (not e!275338))))

(assert (=> d!75371 (= res!280921 (bvslt #b00000000000000000000000000000000 (size!14725 _keys!1025)))))

(assert (=> d!75371 (= lt!213323 e!275333)))

(declare-fun c!56909 () Bool)

(assert (=> d!75371 (= c!56909 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75371 (validMask!0 mask!1365)))

(assert (=> d!75371 (= (getCurrentListMap!2189 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213326)))

(declare-fun b!470070 () Bool)

(assert (=> b!470070 (= e!275334 e!275339)))

(declare-fun res!280919 () Bool)

(assert (=> b!470070 (= res!280919 call!30410)))

(assert (=> b!470070 (=> (not res!280919) (not e!275339))))

(declare-fun bm!30407 () Bool)

(declare-fun call!30408 () ListLongMap!7501)

(declare-fun call!30409 () ListLongMap!7501)

(assert (=> bm!30407 (= call!30408 call!30409)))

(declare-fun b!470071 () Bool)

(declare-fun e!275332 () ListLongMap!7501)

(assert (=> b!470071 (= e!275332 call!30411)))

(declare-fun b!470072 () Bool)

(declare-fun res!280922 () Bool)

(assert (=> b!470072 (=> (not res!280922) (not e!275329))))

(assert (=> b!470072 (= res!280922 e!275330)))

(declare-fun res!280917 () Bool)

(assert (=> b!470072 (=> res!280917 e!275330)))

(assert (=> b!470072 (= res!280917 (not e!275341))))

(declare-fun res!280924 () Bool)

(assert (=> b!470072 (=> (not res!280924) (not e!275341))))

(assert (=> b!470072 (= res!280924 (bvslt #b00000000000000000000000000000000 (size!14725 _keys!1025)))))

(declare-fun bm!30408 () Bool)

(declare-fun call!30413 () ListLongMap!7501)

(assert (=> bm!30408 (= call!30413 call!30408)))

(declare-fun bm!30409 () Bool)

(assert (=> bm!30409 (= call!30409 (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470073 () Bool)

(assert (=> b!470073 (= e!275332 call!30413)))

(declare-fun b!470074 () Bool)

(assert (=> b!470074 (= e!275334 (not call!30410))))

(declare-fun b!470075 () Bool)

(assert (=> b!470075 (= e!275337 (= (apply!327 lt!213326 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000)) (get!7023 (select (arr!14374 _values!833) #b00000000000000000000000000000000) (dynLambda!917 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!470075 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14726 _values!833)))))

(assert (=> b!470075 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14725 _keys!1025)))))

(declare-fun b!470076 () Bool)

(declare-fun call!30412 () ListLongMap!7501)

(assert (=> b!470076 (= e!275333 (+!1723 call!30412 (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun bm!30410 () Bool)

(assert (=> bm!30410 (= call!30411 call!30412)))

(declare-fun bm!30411 () Bool)

(assert (=> bm!30411 (= call!30412 (+!1723 (ite c!56909 call!30409 (ite c!56910 call!30408 call!30413)) (ite (or c!56909 c!56910) (tuple2!8587 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!470077 () Bool)

(declare-fun Unit!13748 () Unit!13743)

(assert (=> b!470077 (= e!275336 Unit!13748)))

(declare-fun b!470078 () Bool)

(declare-fun c!56912 () Bool)

(assert (=> b!470078 (= c!56912 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!470078 (= e!275331 e!275332)))

(assert (= (and d!75371 c!56909) b!470076))

(assert (= (and d!75371 (not c!56909)) b!470067))

(assert (= (and b!470067 c!56910) b!470063))

(assert (= (and b!470067 (not c!56910)) b!470078))

(assert (= (and b!470078 c!56912) b!470071))

(assert (= (and b!470078 (not c!56912)) b!470073))

(assert (= (or b!470071 b!470073) bm!30408))

(assert (= (or b!470063 bm!30408) bm!30407))

(assert (= (or b!470063 b!470071) bm!30410))

(assert (= (or b!470076 bm!30407) bm!30409))

(assert (= (or b!470076 bm!30410) bm!30411))

(assert (= (and d!75371 res!280921) b!470061))

(assert (= (and d!75371 c!56908) b!470058))

(assert (= (and d!75371 (not c!56908)) b!470077))

(assert (= (and d!75371 res!280923) b!470072))

(assert (= (and b!470072 res!280924) b!470059))

(assert (= (and b!470072 (not res!280917)) b!470066))

(assert (= (and b!470066 res!280925) b!470075))

(assert (= (and b!470072 res!280922) b!470062))

(assert (= (and b!470062 c!56911) b!470064))

(assert (= (and b!470062 (not c!56911)) b!470069))

(assert (= (and b!470064 res!280920) b!470068))

(assert (= (or b!470064 b!470069) bm!30405))

(assert (= (and b!470062 res!280918) b!470060))

(assert (= (and b!470060 c!56907) b!470070))

(assert (= (and b!470060 (not c!56907)) b!470074))

(assert (= (and b!470070 res!280919) b!470065))

(assert (= (or b!470070 b!470074) bm!30406))

(declare-fun b_lambda!10137 () Bool)

(assert (=> (not b_lambda!10137) (not b!470075)))

(assert (=> b!470075 t!14616))

(declare-fun b_and!20077 () Bool)

(assert (= b_and!20075 (and (=> t!14616 result!7407) b_and!20077)))

(assert (=> b!470075 m!452485))

(assert (=> b!470075 m!452489))

(assert (=> b!470075 m!452485))

(declare-fun m!452627 () Bool)

(assert (=> b!470075 m!452627))

(assert (=> b!470075 m!452489))

(assert (=> b!470075 m!452491))

(assert (=> b!470075 m!452493))

(assert (=> b!470075 m!452491))

(assert (=> b!470066 m!452485))

(assert (=> b!470066 m!452485))

(declare-fun m!452629 () Bool)

(assert (=> b!470066 m!452629))

(assert (=> b!470059 m!452485))

(assert (=> b!470059 m!452485))

(assert (=> b!470059 m!452499))

(declare-fun m!452631 () Bool)

(assert (=> bm!30411 m!452631))

(declare-fun m!452633 () Bool)

(assert (=> b!470065 m!452633))

(assert (=> b!470061 m!452485))

(assert (=> b!470061 m!452485))

(assert (=> b!470061 m!452499))

(assert (=> bm!30409 m!452403))

(declare-fun m!452635 () Bool)

(assert (=> b!470058 m!452635))

(assert (=> b!470058 m!452635))

(declare-fun m!452637 () Bool)

(assert (=> b!470058 m!452637))

(declare-fun m!452639 () Bool)

(assert (=> b!470058 m!452639))

(declare-fun m!452641 () Bool)

(assert (=> b!470058 m!452641))

(assert (=> b!470058 m!452403))

(declare-fun m!452643 () Bool)

(assert (=> b!470058 m!452643))

(declare-fun m!452645 () Bool)

(assert (=> b!470058 m!452645))

(declare-fun m!452647 () Bool)

(assert (=> b!470058 m!452647))

(declare-fun m!452649 () Bool)

(assert (=> b!470058 m!452649))

(declare-fun m!452651 () Bool)

(assert (=> b!470058 m!452651))

(declare-fun m!452653 () Bool)

(assert (=> b!470058 m!452653))

(declare-fun m!452655 () Bool)

(assert (=> b!470058 m!452655))

(declare-fun m!452657 () Bool)

(assert (=> b!470058 m!452657))

(assert (=> b!470058 m!452485))

(assert (=> b!470058 m!452639))

(assert (=> b!470058 m!452643))

(declare-fun m!452659 () Bool)

(assert (=> b!470058 m!452659))

(declare-fun m!452661 () Bool)

(assert (=> b!470058 m!452661))

(declare-fun m!452663 () Bool)

(assert (=> b!470058 m!452663))

(assert (=> b!470058 m!452647))

(declare-fun m!452665 () Bool)

(assert (=> b!470068 m!452665))

(declare-fun m!452667 () Bool)

(assert (=> b!470076 m!452667))

(declare-fun m!452669 () Bool)

(assert (=> bm!30406 m!452669))

(declare-fun m!452671 () Bool)

(assert (=> bm!30405 m!452671))

(assert (=> d!75371 m!452393))

(assert (=> b!469866 d!75371))

(declare-fun b!470087 () Bool)

(declare-fun e!275348 () Bool)

(declare-fun e!275350 () Bool)

(assert (=> b!470087 (= e!275348 e!275350)))

(declare-fun lt!213343 () (_ BitVec 64))

(assert (=> b!470087 (= lt!213343 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213345 () Unit!13743)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29898 (_ BitVec 64) (_ BitVec 32)) Unit!13743)

(assert (=> b!470087 (= lt!213345 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!213343 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!470087 (arrayContainsKey!0 _keys!1025 lt!213343 #b00000000000000000000000000000000)))

(declare-fun lt!213344 () Unit!13743)

(assert (=> b!470087 (= lt!213344 lt!213345)))

(declare-fun res!280930 () Bool)

(declare-datatypes ((SeekEntryResult!3500 0))(
  ( (MissingZero!3500 (index!16179 (_ BitVec 32))) (Found!3500 (index!16180 (_ BitVec 32))) (Intermediate!3500 (undefined!4312 Bool) (index!16181 (_ BitVec 32)) (x!43950 (_ BitVec 32))) (Undefined!3500) (MissingVacant!3500 (index!16182 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29898 (_ BitVec 32)) SeekEntryResult!3500)

(assert (=> b!470087 (= res!280930 (= (seekEntryOrOpen!0 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3500 #b00000000000000000000000000000000)))))

(assert (=> b!470087 (=> (not res!280930) (not e!275350))))

(declare-fun b!470088 () Bool)

(declare-fun e!275349 () Bool)

(assert (=> b!470088 (= e!275349 e!275348)))

(declare-fun c!56915 () Bool)

(assert (=> b!470088 (= c!56915 (validKeyInArray!0 (select (arr!14373 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470089 () Bool)

(declare-fun call!30417 () Bool)

(assert (=> b!470089 (= e!275350 call!30417)))

(declare-fun b!470090 () Bool)

(assert (=> b!470090 (= e!275348 call!30417)))

(declare-fun d!75373 () Bool)

(declare-fun res!280931 () Bool)

(assert (=> d!75373 (=> res!280931 e!275349)))

(assert (=> d!75373 (= res!280931 (bvsge #b00000000000000000000000000000000 (size!14725 _keys!1025)))))

(assert (=> d!75373 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!275349)))

(declare-fun bm!30414 () Bool)

(assert (=> bm!30414 (= call!30417 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(assert (= (and d!75373 (not res!280931)) b!470088))

(assert (= (and b!470088 c!56915) b!470087))

(assert (= (and b!470088 (not c!56915)) b!470090))

(assert (= (and b!470087 res!280930) b!470089))

(assert (= (or b!470089 b!470090) bm!30414))

(assert (=> b!470087 m!452485))

(declare-fun m!452673 () Bool)

(assert (=> b!470087 m!452673))

(declare-fun m!452675 () Bool)

(assert (=> b!470087 m!452675))

(assert (=> b!470087 m!452485))

(declare-fun m!452677 () Bool)

(assert (=> b!470087 m!452677))

(assert (=> b!470088 m!452485))

(assert (=> b!470088 m!452485))

(assert (=> b!470088 m!452499))

(declare-fun m!452679 () Bool)

(assert (=> bm!30414 m!452679))

(assert (=> b!469871 d!75373))

(declare-fun b!470098 () Bool)

(declare-fun e!275355 () Bool)

(assert (=> b!470098 (= e!275355 tp_is_empty!13069)))

(declare-fun b!470097 () Bool)

(declare-fun e!275356 () Bool)

(assert (=> b!470097 (= e!275356 tp_is_empty!13069)))

(declare-fun mapIsEmpty!21310 () Bool)

(declare-fun mapRes!21310 () Bool)

(assert (=> mapIsEmpty!21310 mapRes!21310))

(declare-fun condMapEmpty!21310 () Bool)

(declare-fun mapDefault!21310 () ValueCell!6191)

(assert (=> mapNonEmpty!21301 (= condMapEmpty!21310 (= mapRest!21301 ((as const (Array (_ BitVec 32) ValueCell!6191)) mapDefault!21310)))))

(assert (=> mapNonEmpty!21301 (= tp!40941 (and e!275355 mapRes!21310))))

(declare-fun mapNonEmpty!21310 () Bool)

(declare-fun tp!40957 () Bool)

(assert (=> mapNonEmpty!21310 (= mapRes!21310 (and tp!40957 e!275356))))

(declare-fun mapValue!21310 () ValueCell!6191)

(declare-fun mapKey!21310 () (_ BitVec 32))

(declare-fun mapRest!21310 () (Array (_ BitVec 32) ValueCell!6191))

(assert (=> mapNonEmpty!21310 (= mapRest!21301 (store mapRest!21310 mapKey!21310 mapValue!21310))))

(assert (= (and mapNonEmpty!21301 condMapEmpty!21310) mapIsEmpty!21310))

(assert (= (and mapNonEmpty!21301 (not condMapEmpty!21310)) mapNonEmpty!21310))

(assert (= (and mapNonEmpty!21310 ((_ is ValueCellFull!6191) mapValue!21310)) b!470097))

(assert (= (and mapNonEmpty!21301 ((_ is ValueCellFull!6191) mapDefault!21310)) b!470098))

(declare-fun m!452681 () Bool)

(assert (=> mapNonEmpty!21310 m!452681))

(declare-fun b_lambda!10139 () Bool)

(assert (= b_lambda!10133 (or (and start!42074 b_free!11641) b_lambda!10139)))

(declare-fun b_lambda!10141 () Bool)

(assert (= b_lambda!10129 (or (and start!42074 b_free!11641) b_lambda!10141)))

(declare-fun b_lambda!10143 () Bool)

(assert (= b_lambda!10137 (or (and start!42074 b_free!11641) b_lambda!10143)))

(declare-fun b_lambda!10145 () Bool)

(assert (= b_lambda!10127 (or (and start!42074 b_free!11641) b_lambda!10145)))

(declare-fun b_lambda!10147 () Bool)

(assert (= b_lambda!10135 (or (and start!42074 b_free!11641) b_lambda!10147)))

(declare-fun b_lambda!10149 () Bool)

(assert (= b_lambda!10131 (or (and start!42074 b_free!11641) b_lambda!10149)))

(check-sat (not bm!30402) (not b!470035) (not b!470027) (not b!470056) (not b!470076) (not bm!30414) (not b!470087) (not bm!30379) (not b!469967) b_and!20077 (not b!470055) (not bm!30399) (not bm!30405) (not b!469958) (not b!470034) (not bm!30383) (not b!470054) (not b_next!11641) (not b!469966) (not b!469968) (not d!75371) (not b!470030) (not b_lambda!10145) (not b!470028) (not b!469959) (not bm!30398) (not b!470044) (not bm!30404) (not d!75361) (not d!75367) (not b!470075) (not d!75363) (not b!469950) (not b!469962) (not b!469983) (not d!75365) (not b!469953) (not b!469954) (not b!470088) (not b!470068) (not b_lambda!10139) (not b!470058) (not b!469984) (not b!469952) (not bm!30409) (not b_lambda!10141) (not b!469964) (not b!470066) (not bm!30380) (not mapNonEmpty!21310) (not b!470057) tp_is_empty!13069 (not b!470061) (not b!470053) (not b!469948) (not d!75369) (not b_lambda!10143) (not bm!30406) (not b!469945) (not b!470059) (not bm!30411) (not b!469980) (not b!469963) (not b!470065) (not d!75349) (not b!470052) (not b!470045) (not b!470037) (not b_lambda!10149) (not d!75351) (not b_lambda!10147) (not b!469949) (not d!75347) (not b!469944))
(check-sat b_and!20077 (not b_next!11641))
