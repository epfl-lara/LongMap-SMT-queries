; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95198 () Bool)

(assert start!95198)

(declare-fun b_free!22225 () Bool)

(declare-fun b_next!22225 () Bool)

(assert (=> start!95198 (= b_free!22225 (not b_next!22225))))

(declare-fun tp!78169 () Bool)

(declare-fun b_and!35165 () Bool)

(assert (=> start!95198 (= tp!78169 b_and!35165)))

(declare-datatypes ((V!39849 0))(
  ( (V!39850 (val!13068 Int)) )
))
(declare-datatypes ((tuple2!16716 0))(
  ( (tuple2!16717 (_1!8369 (_ BitVec 64)) (_2!8369 V!39849)) )
))
(declare-datatypes ((List!23234 0))(
  ( (Nil!23231) (Cons!23230 (h!24439 tuple2!16716) (t!32582 List!23234)) )
))
(declare-datatypes ((ListLongMap!14685 0))(
  ( (ListLongMap!14686 (toList!7358 List!23234)) )
))
(declare-fun lt!477664 () ListLongMap!14685)

(declare-fun e!614996 () Bool)

(declare-fun b!1075966 () Bool)

(declare-fun lt!477663 () tuple2!16716)

(declare-fun lt!477667 () ListLongMap!14685)

(declare-fun +!3257 (ListLongMap!14685 tuple2!16716) ListLongMap!14685)

(assert (=> b!1075966 (= e!614996 (= lt!477667 (+!3257 lt!477664 lt!477663)))))

(declare-fun mapIsEmpty!40795 () Bool)

(declare-fun mapRes!40795 () Bool)

(assert (=> mapIsEmpty!40795 mapRes!40795))

(declare-fun mapNonEmpty!40795 () Bool)

(declare-fun tp!78170 () Bool)

(declare-fun e!614994 () Bool)

(assert (=> mapNonEmpty!40795 (= mapRes!40795 (and tp!78170 e!614994))))

(declare-datatypes ((ValueCell!12314 0))(
  ( (ValueCellFull!12314 (v!15694 V!39849)) (EmptyCell!12314) )
))
(declare-fun mapRest!40795 () (Array (_ BitVec 32) ValueCell!12314))

(declare-datatypes ((array!68976 0))(
  ( (array!68977 (arr!33172 (Array (_ BitVec 32) ValueCell!12314)) (size!33710 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68976)

(declare-fun mapKey!40795 () (_ BitVec 32))

(declare-fun mapValue!40795 () ValueCell!12314)

(assert (=> mapNonEmpty!40795 (= (arr!33172 _values!955) (store mapRest!40795 mapKey!40795 mapValue!40795))))

(declare-fun res!717201 () Bool)

(declare-fun e!614992 () Bool)

(assert (=> start!95198 (=> (not res!717201) (not e!614992))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95198 (= res!717201 (validMask!0 mask!1515))))

(assert (=> start!95198 e!614992))

(assert (=> start!95198 true))

(declare-fun tp_is_empty!26035 () Bool)

(assert (=> start!95198 tp_is_empty!26035))

(declare-fun e!614997 () Bool)

(declare-fun array_inv!25656 (array!68976) Bool)

(assert (=> start!95198 (and (array_inv!25656 _values!955) e!614997)))

(assert (=> start!95198 tp!78169))

(declare-datatypes ((array!68978 0))(
  ( (array!68979 (arr!33173 (Array (_ BitVec 32) (_ BitVec 64))) (size!33711 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68978)

(declare-fun array_inv!25657 (array!68978) Bool)

(assert (=> start!95198 (array_inv!25657 _keys!1163)))

(declare-fun b!1075967 () Bool)

(declare-fun e!614993 () Bool)

(assert (=> b!1075967 (= e!614993 tp_is_empty!26035)))

(declare-fun b!1075968 () Bool)

(declare-fun res!717205 () Bool)

(assert (=> b!1075968 (=> (not res!717205) (not e!614992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68978 (_ BitVec 32)) Bool)

(assert (=> b!1075968 (= res!717205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1075969 () Bool)

(declare-fun res!717204 () Bool)

(assert (=> b!1075969 (=> (not res!717204) (not e!614992))))

(declare-datatypes ((List!23235 0))(
  ( (Nil!23232) (Cons!23231 (h!24440 (_ BitVec 64)) (t!32583 List!23235)) )
))
(declare-fun arrayNoDuplicates!0 (array!68978 (_ BitVec 32) List!23235) Bool)

(assert (=> b!1075969 (= res!717204 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23232))))

(declare-fun b!1075970 () Bool)

(assert (=> b!1075970 (= e!614997 (and e!614993 mapRes!40795))))

(declare-fun condMapEmpty!40795 () Bool)

(declare-fun mapDefault!40795 () ValueCell!12314)

(assert (=> b!1075970 (= condMapEmpty!40795 (= (arr!33172 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12314)) mapDefault!40795)))))

(declare-fun b!1075971 () Bool)

(declare-fun e!614995 () Bool)

(declare-fun lt!477665 () ListLongMap!14685)

(declare-fun contains!6324 (ListLongMap!14685 (_ BitVec 64)) Bool)

(assert (=> b!1075971 (= e!614995 (not (contains!6324 (+!3257 lt!477665 lt!477663) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075971 e!614996))

(declare-fun res!717206 () Bool)

(assert (=> b!1075971 (=> (not res!717206) (not e!614996))))

(declare-fun zeroValueBefore!47 () V!39849)

(declare-fun lt!477662 () ListLongMap!14685)

(assert (=> b!1075971 (= res!717206 (= lt!477662 (+!3257 (+!3257 lt!477665 (tuple2!16717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!477663)))))

(declare-fun minValue!907 () V!39849)

(assert (=> b!1075971 (= lt!477663 (tuple2!16717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39849)

(declare-fun getCurrentListMap!4126 (array!68978 array!68976 (_ BitVec 32) (_ BitVec 32) V!39849 V!39849 (_ BitVec 32) Int) ListLongMap!14685)

(assert (=> b!1075971 (= lt!477667 (getCurrentListMap!4126 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1075971 (= lt!477662 (getCurrentListMap!4126 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075972 () Bool)

(assert (=> b!1075972 (= e!614992 (not e!614995))))

(declare-fun res!717202 () Bool)

(assert (=> b!1075972 (=> res!717202 e!614995)))

(assert (=> b!1075972 (= res!717202 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1075972 (= lt!477665 lt!477664)))

(declare-datatypes ((Unit!35266 0))(
  ( (Unit!35267) )
))
(declare-fun lt!477666 () Unit!35266)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!906 (array!68978 array!68976 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39849 V!39849 V!39849 V!39849 (_ BitVec 32) Int) Unit!35266)

(assert (=> b!1075972 (= lt!477666 (lemmaNoChangeToArrayThenSameMapNoExtras!906 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3934 (array!68978 array!68976 (_ BitVec 32) (_ BitVec 32) V!39849 V!39849 (_ BitVec 32) Int) ListLongMap!14685)

(assert (=> b!1075972 (= lt!477664 (getCurrentListMapNoExtraKeys!3934 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1075972 (= lt!477665 (getCurrentListMapNoExtraKeys!3934 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075973 () Bool)

(declare-fun res!717203 () Bool)

(assert (=> b!1075973 (=> (not res!717203) (not e!614992))))

(assert (=> b!1075973 (= res!717203 (and (= (size!33710 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33711 _keys!1163) (size!33710 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075974 () Bool)

(assert (=> b!1075974 (= e!614994 tp_is_empty!26035)))

(assert (= (and start!95198 res!717201) b!1075973))

(assert (= (and b!1075973 res!717203) b!1075968))

(assert (= (and b!1075968 res!717205) b!1075969))

(assert (= (and b!1075969 res!717204) b!1075972))

(assert (= (and b!1075972 (not res!717202)) b!1075971))

(assert (= (and b!1075971 res!717206) b!1075966))

(assert (= (and b!1075970 condMapEmpty!40795) mapIsEmpty!40795))

(assert (= (and b!1075970 (not condMapEmpty!40795)) mapNonEmpty!40795))

(get-info :version)

(assert (= (and mapNonEmpty!40795 ((_ is ValueCellFull!12314) mapValue!40795)) b!1075974))

(assert (= (and b!1075970 ((_ is ValueCellFull!12314) mapDefault!40795)) b!1075967))

(assert (= start!95198 b!1075970))

(declare-fun m!994339 () Bool)

(assert (=> start!95198 m!994339))

(declare-fun m!994341 () Bool)

(assert (=> start!95198 m!994341))

(declare-fun m!994343 () Bool)

(assert (=> start!95198 m!994343))

(declare-fun m!994345 () Bool)

(assert (=> b!1075966 m!994345))

(declare-fun m!994347 () Bool)

(assert (=> mapNonEmpty!40795 m!994347))

(declare-fun m!994349 () Bool)

(assert (=> b!1075969 m!994349))

(declare-fun m!994351 () Bool)

(assert (=> b!1075968 m!994351))

(declare-fun m!994353 () Bool)

(assert (=> b!1075971 m!994353))

(declare-fun m!994355 () Bool)

(assert (=> b!1075971 m!994355))

(declare-fun m!994357 () Bool)

(assert (=> b!1075971 m!994357))

(declare-fun m!994359 () Bool)

(assert (=> b!1075971 m!994359))

(assert (=> b!1075971 m!994353))

(declare-fun m!994361 () Bool)

(assert (=> b!1075971 m!994361))

(assert (=> b!1075971 m!994357))

(declare-fun m!994363 () Bool)

(assert (=> b!1075971 m!994363))

(declare-fun m!994365 () Bool)

(assert (=> b!1075972 m!994365))

(declare-fun m!994367 () Bool)

(assert (=> b!1075972 m!994367))

(declare-fun m!994369 () Bool)

(assert (=> b!1075972 m!994369))

(check-sat b_and!35165 (not b_next!22225) (not b!1075968) (not mapNonEmpty!40795) (not b!1075972) tp_is_empty!26035 (not b!1075971) (not start!95198) (not b!1075966) (not b!1075969))
(check-sat b_and!35165 (not b_next!22225))
(get-model)

(declare-fun d!129515 () Bool)

(declare-fun e!615043 () Bool)

(assert (=> d!129515 e!615043))

(declare-fun res!717248 () Bool)

(assert (=> d!129515 (=> (not res!717248) (not e!615043))))

(declare-fun lt!477713 () ListLongMap!14685)

(assert (=> d!129515 (= res!717248 (contains!6324 lt!477713 (_1!8369 (tuple2!16717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!477715 () List!23234)

(assert (=> d!129515 (= lt!477713 (ListLongMap!14686 lt!477715))))

(declare-fun lt!477712 () Unit!35266)

(declare-fun lt!477714 () Unit!35266)

(assert (=> d!129515 (= lt!477712 lt!477714)))

(declare-datatypes ((Option!667 0))(
  ( (Some!666 (v!15697 V!39849)) (None!665) )
))
(declare-fun getValueByKey!616 (List!23234 (_ BitVec 64)) Option!667)

(assert (=> d!129515 (= (getValueByKey!616 lt!477715 (_1!8369 (tuple2!16717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!666 (_2!8369 (tuple2!16717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lemmaContainsTupThenGetReturnValue!292 (List!23234 (_ BitVec 64) V!39849) Unit!35266)

(assert (=> d!129515 (= lt!477714 (lemmaContainsTupThenGetReturnValue!292 lt!477715 (_1!8369 (tuple2!16717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8369 (tuple2!16717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun insertStrictlySorted!385 (List!23234 (_ BitVec 64) V!39849) List!23234)

(assert (=> d!129515 (= lt!477715 (insertStrictlySorted!385 (toList!7358 lt!477665) (_1!8369 (tuple2!16717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8369 (tuple2!16717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129515 (= (+!3257 lt!477665 (tuple2!16717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!477713)))

(declare-fun b!1076033 () Bool)

(declare-fun res!717247 () Bool)

(assert (=> b!1076033 (=> (not res!717247) (not e!615043))))

(assert (=> b!1076033 (= res!717247 (= (getValueByKey!616 (toList!7358 lt!477713) (_1!8369 (tuple2!16717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!666 (_2!8369 (tuple2!16717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1076034 () Bool)

(declare-fun contains!6327 (List!23234 tuple2!16716) Bool)

(assert (=> b!1076034 (= e!615043 (contains!6327 (toList!7358 lt!477713) (tuple2!16717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!129515 res!717248) b!1076033))

(assert (= (and b!1076033 res!717247) b!1076034))

(declare-fun m!994435 () Bool)

(assert (=> d!129515 m!994435))

(declare-fun m!994437 () Bool)

(assert (=> d!129515 m!994437))

(declare-fun m!994439 () Bool)

(assert (=> d!129515 m!994439))

(declare-fun m!994441 () Bool)

(assert (=> d!129515 m!994441))

(declare-fun m!994443 () Bool)

(assert (=> b!1076033 m!994443))

(declare-fun m!994445 () Bool)

(assert (=> b!1076034 m!994445))

(assert (=> b!1075971 d!129515))

(declare-fun call!45612 () ListLongMap!14685)

(declare-fun call!45613 () ListLongMap!14685)

(declare-fun call!45607 () ListLongMap!14685)

(declare-fun c!108158 () Bool)

(declare-fun c!108156 () Bool)

(declare-fun call!45611 () ListLongMap!14685)

(declare-fun bm!45604 () Bool)

(assert (=> bm!45604 (= call!45611 (+!3257 (ite c!108156 call!45612 (ite c!108158 call!45607 call!45613)) (ite (or c!108156 c!108158) (tuple2!16717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1076077 () Bool)

(declare-fun e!615076 () Bool)

(declare-fun lt!477761 () ListLongMap!14685)

(declare-fun apply!935 (ListLongMap!14685 (_ BitVec 64)) V!39849)

(assert (=> b!1076077 (= e!615076 (= (apply!935 lt!477761 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1076078 () Bool)

(declare-fun e!615081 () ListLongMap!14685)

(declare-fun call!45609 () ListLongMap!14685)

(assert (=> b!1076078 (= e!615081 call!45609)))

(declare-fun b!1076079 () Bool)

(declare-fun res!717269 () Bool)

(declare-fun e!615072 () Bool)

(assert (=> b!1076079 (=> (not res!717269) (not e!615072))))

(declare-fun e!615079 () Bool)

(assert (=> b!1076079 (= res!717269 e!615079)))

(declare-fun res!717270 () Bool)

(assert (=> b!1076079 (=> res!717270 e!615079)))

(declare-fun e!615071 () Bool)

(assert (=> b!1076079 (= res!717270 (not e!615071))))

(declare-fun res!717268 () Bool)

(assert (=> b!1076079 (=> (not res!717268) (not e!615071))))

(assert (=> b!1076079 (= res!717268 (bvslt #b00000000000000000000000000000000 (size!33711 _keys!1163)))))

(declare-fun b!1076080 () Bool)

(declare-fun e!615080 () ListLongMap!14685)

(assert (=> b!1076080 (= e!615080 (+!3257 call!45611 (tuple2!16717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45605 () Bool)

(declare-fun call!45610 () Bool)

(assert (=> bm!45605 (= call!45610 (contains!6324 lt!477761 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076082 () Bool)

(assert (=> b!1076082 (= e!615081 call!45613)))

(declare-fun b!1076083 () Bool)

(declare-fun e!615082 () Bool)

(declare-fun get!17241 (ValueCell!12314 V!39849) V!39849)

(declare-fun dynLambda!2034 (Int (_ BitVec 64)) V!39849)

(assert (=> b!1076083 (= e!615082 (= (apply!935 lt!477761 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000)) (get!17241 (select (arr!33172 _values!955) #b00000000000000000000000000000000) (dynLambda!2034 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1076083 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33710 _values!955)))))

(assert (=> b!1076083 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33711 _keys!1163)))))

(declare-fun b!1076084 () Bool)

(declare-fun e!615078 () Bool)

(assert (=> b!1076084 (= e!615078 (= (apply!935 lt!477761 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1076085 () Bool)

(declare-fun e!615073 () Bool)

(assert (=> b!1076085 (= e!615073 e!615076)))

(declare-fun res!717273 () Bool)

(declare-fun call!45608 () Bool)

(assert (=> b!1076085 (= res!717273 call!45608)))

(assert (=> b!1076085 (=> (not res!717273) (not e!615076))))

(declare-fun bm!45606 () Bool)

(assert (=> bm!45606 (= call!45612 (getCurrentListMapNoExtraKeys!3934 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076086 () Bool)

(declare-fun e!615077 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1076086 (= e!615077 (validKeyInArray!0 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45607 () Bool)

(assert (=> bm!45607 (= call!45607 call!45612)))

(declare-fun b!1076087 () Bool)

(declare-fun res!717275 () Bool)

(assert (=> b!1076087 (=> (not res!717275) (not e!615072))))

(declare-fun e!615074 () Bool)

(assert (=> b!1076087 (= res!717275 e!615074)))

(declare-fun c!108155 () Bool)

(assert (=> b!1076087 (= c!108155 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1076088 () Bool)

(declare-fun c!108159 () Bool)

(assert (=> b!1076088 (= c!108159 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!615075 () ListLongMap!14685)

(assert (=> b!1076088 (= e!615075 e!615081)))

(declare-fun b!1076089 () Bool)

(assert (=> b!1076089 (= e!615073 (not call!45608))))

(declare-fun b!1076090 () Bool)

(assert (=> b!1076090 (= e!615071 (validKeyInArray!0 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45608 () Bool)

(assert (=> bm!45608 (= call!45608 (contains!6324 lt!477761 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076091 () Bool)

(assert (=> b!1076091 (= e!615074 e!615078)))

(declare-fun res!717267 () Bool)

(assert (=> b!1076091 (= res!717267 call!45610)))

(assert (=> b!1076091 (=> (not res!717267) (not e!615078))))

(declare-fun b!1076092 () Bool)

(assert (=> b!1076092 (= e!615075 call!45609)))

(declare-fun b!1076093 () Bool)

(assert (=> b!1076093 (= e!615072 e!615073)))

(declare-fun c!108157 () Bool)

(assert (=> b!1076093 (= c!108157 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1076081 () Bool)

(declare-fun e!615070 () Unit!35266)

(declare-fun Unit!35272 () Unit!35266)

(assert (=> b!1076081 (= e!615070 Unit!35272)))

(declare-fun d!129517 () Bool)

(assert (=> d!129517 e!615072))

(declare-fun res!717272 () Bool)

(assert (=> d!129517 (=> (not res!717272) (not e!615072))))

(assert (=> d!129517 (= res!717272 (or (bvsge #b00000000000000000000000000000000 (size!33711 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33711 _keys!1163)))))))

(declare-fun lt!477768 () ListLongMap!14685)

(assert (=> d!129517 (= lt!477761 lt!477768)))

(declare-fun lt!477765 () Unit!35266)

(assert (=> d!129517 (= lt!477765 e!615070)))

(declare-fun c!108154 () Bool)

(assert (=> d!129517 (= c!108154 e!615077)))

(declare-fun res!717271 () Bool)

(assert (=> d!129517 (=> (not res!717271) (not e!615077))))

(assert (=> d!129517 (= res!717271 (bvslt #b00000000000000000000000000000000 (size!33711 _keys!1163)))))

(assert (=> d!129517 (= lt!477768 e!615080)))

(assert (=> d!129517 (= c!108156 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129517 (validMask!0 mask!1515)))

(assert (=> d!129517 (= (getCurrentListMap!4126 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477761)))

(declare-fun b!1076094 () Bool)

(assert (=> b!1076094 (= e!615074 (not call!45610))))

(declare-fun bm!45609 () Bool)

(assert (=> bm!45609 (= call!45609 call!45611)))

(declare-fun bm!45610 () Bool)

(assert (=> bm!45610 (= call!45613 call!45607)))

(declare-fun b!1076095 () Bool)

(assert (=> b!1076095 (= e!615079 e!615082)))

(declare-fun res!717274 () Bool)

(assert (=> b!1076095 (=> (not res!717274) (not e!615082))))

(assert (=> b!1076095 (= res!717274 (contains!6324 lt!477761 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076095 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33711 _keys!1163)))))

(declare-fun b!1076096 () Bool)

(declare-fun lt!477781 () Unit!35266)

(assert (=> b!1076096 (= e!615070 lt!477781)))

(declare-fun lt!477772 () ListLongMap!14685)

(assert (=> b!1076096 (= lt!477772 (getCurrentListMapNoExtraKeys!3934 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477770 () (_ BitVec 64))

(assert (=> b!1076096 (= lt!477770 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477773 () (_ BitVec 64))

(assert (=> b!1076096 (= lt!477773 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477760 () Unit!35266)

(declare-fun addStillContains!648 (ListLongMap!14685 (_ BitVec 64) V!39849 (_ BitVec 64)) Unit!35266)

(assert (=> b!1076096 (= lt!477760 (addStillContains!648 lt!477772 lt!477770 zeroValueAfter!47 lt!477773))))

(assert (=> b!1076096 (contains!6324 (+!3257 lt!477772 (tuple2!16717 lt!477770 zeroValueAfter!47)) lt!477773)))

(declare-fun lt!477779 () Unit!35266)

(assert (=> b!1076096 (= lt!477779 lt!477760)))

(declare-fun lt!477778 () ListLongMap!14685)

(assert (=> b!1076096 (= lt!477778 (getCurrentListMapNoExtraKeys!3934 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477763 () (_ BitVec 64))

(assert (=> b!1076096 (= lt!477763 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477777 () (_ BitVec 64))

(assert (=> b!1076096 (= lt!477777 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477780 () Unit!35266)

(declare-fun addApplyDifferent!504 (ListLongMap!14685 (_ BitVec 64) V!39849 (_ BitVec 64)) Unit!35266)

(assert (=> b!1076096 (= lt!477780 (addApplyDifferent!504 lt!477778 lt!477763 minValue!907 lt!477777))))

(assert (=> b!1076096 (= (apply!935 (+!3257 lt!477778 (tuple2!16717 lt!477763 minValue!907)) lt!477777) (apply!935 lt!477778 lt!477777))))

(declare-fun lt!477764 () Unit!35266)

(assert (=> b!1076096 (= lt!477764 lt!477780)))

(declare-fun lt!477767 () ListLongMap!14685)

(assert (=> b!1076096 (= lt!477767 (getCurrentListMapNoExtraKeys!3934 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477775 () (_ BitVec 64))

(assert (=> b!1076096 (= lt!477775 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477776 () (_ BitVec 64))

(assert (=> b!1076096 (= lt!477776 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477766 () Unit!35266)

(assert (=> b!1076096 (= lt!477766 (addApplyDifferent!504 lt!477767 lt!477775 zeroValueAfter!47 lt!477776))))

(assert (=> b!1076096 (= (apply!935 (+!3257 lt!477767 (tuple2!16717 lt!477775 zeroValueAfter!47)) lt!477776) (apply!935 lt!477767 lt!477776))))

(declare-fun lt!477762 () Unit!35266)

(assert (=> b!1076096 (= lt!477762 lt!477766)))

(declare-fun lt!477769 () ListLongMap!14685)

(assert (=> b!1076096 (= lt!477769 (getCurrentListMapNoExtraKeys!3934 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477771 () (_ BitVec 64))

(assert (=> b!1076096 (= lt!477771 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477774 () (_ BitVec 64))

(assert (=> b!1076096 (= lt!477774 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1076096 (= lt!477781 (addApplyDifferent!504 lt!477769 lt!477771 minValue!907 lt!477774))))

(assert (=> b!1076096 (= (apply!935 (+!3257 lt!477769 (tuple2!16717 lt!477771 minValue!907)) lt!477774) (apply!935 lt!477769 lt!477774))))

(declare-fun b!1076097 () Bool)

(assert (=> b!1076097 (= e!615080 e!615075)))

(assert (=> b!1076097 (= c!108158 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!129517 c!108156) b!1076080))

(assert (= (and d!129517 (not c!108156)) b!1076097))

(assert (= (and b!1076097 c!108158) b!1076092))

(assert (= (and b!1076097 (not c!108158)) b!1076088))

(assert (= (and b!1076088 c!108159) b!1076078))

(assert (= (and b!1076088 (not c!108159)) b!1076082))

(assert (= (or b!1076078 b!1076082) bm!45610))

(assert (= (or b!1076092 bm!45610) bm!45607))

(assert (= (or b!1076092 b!1076078) bm!45609))

(assert (= (or b!1076080 bm!45607) bm!45606))

(assert (= (or b!1076080 bm!45609) bm!45604))

(assert (= (and d!129517 res!717271) b!1076086))

(assert (= (and d!129517 c!108154) b!1076096))

(assert (= (and d!129517 (not c!108154)) b!1076081))

(assert (= (and d!129517 res!717272) b!1076079))

(assert (= (and b!1076079 res!717268) b!1076090))

(assert (= (and b!1076079 (not res!717270)) b!1076095))

(assert (= (and b!1076095 res!717274) b!1076083))

(assert (= (and b!1076079 res!717269) b!1076087))

(assert (= (and b!1076087 c!108155) b!1076091))

(assert (= (and b!1076087 (not c!108155)) b!1076094))

(assert (= (and b!1076091 res!717267) b!1076084))

(assert (= (or b!1076091 b!1076094) bm!45605))

(assert (= (and b!1076087 res!717275) b!1076093))

(assert (= (and b!1076093 c!108157) b!1076085))

(assert (= (and b!1076093 (not c!108157)) b!1076089))

(assert (= (and b!1076085 res!717273) b!1076077))

(assert (= (or b!1076085 b!1076089) bm!45608))

(declare-fun b_lambda!16927 () Bool)

(assert (=> (not b_lambda!16927) (not b!1076083)))

(declare-fun t!32588 () Bool)

(declare-fun tb!7171 () Bool)

(assert (=> (and start!95198 (= defaultEntry!963 defaultEntry!963) t!32588) tb!7171))

(declare-fun result!14837 () Bool)

(assert (=> tb!7171 (= result!14837 tp_is_empty!26035)))

(assert (=> b!1076083 t!32588))

(declare-fun b_and!35171 () Bool)

(assert (= b_and!35165 (and (=> t!32588 result!14837) b_and!35171)))

(declare-fun m!994447 () Bool)

(assert (=> b!1076096 m!994447))

(declare-fun m!994449 () Bool)

(assert (=> b!1076096 m!994449))

(declare-fun m!994451 () Bool)

(assert (=> b!1076096 m!994451))

(declare-fun m!994453 () Bool)

(assert (=> b!1076096 m!994453))

(assert (=> b!1076096 m!994449))

(declare-fun m!994455 () Bool)

(assert (=> b!1076096 m!994455))

(declare-fun m!994457 () Bool)

(assert (=> b!1076096 m!994457))

(declare-fun m!994459 () Bool)

(assert (=> b!1076096 m!994459))

(declare-fun m!994461 () Bool)

(assert (=> b!1076096 m!994461))

(declare-fun m!994463 () Bool)

(assert (=> b!1076096 m!994463))

(assert (=> b!1076096 m!994457))

(declare-fun m!994465 () Bool)

(assert (=> b!1076096 m!994465))

(declare-fun m!994467 () Bool)

(assert (=> b!1076096 m!994467))

(declare-fun m!994469 () Bool)

(assert (=> b!1076096 m!994469))

(assert (=> b!1076096 m!994451))

(declare-fun m!994471 () Bool)

(assert (=> b!1076096 m!994471))

(assert (=> b!1076096 m!994367))

(declare-fun m!994473 () Bool)

(assert (=> b!1076096 m!994473))

(declare-fun m!994475 () Bool)

(assert (=> b!1076096 m!994475))

(declare-fun m!994477 () Bool)

(assert (=> b!1076096 m!994477))

(assert (=> b!1076096 m!994459))

(declare-fun m!994479 () Bool)

(assert (=> bm!45608 m!994479))

(assert (=> b!1076095 m!994477))

(assert (=> b!1076095 m!994477))

(declare-fun m!994481 () Bool)

(assert (=> b!1076095 m!994481))

(declare-fun m!994483 () Bool)

(assert (=> bm!45604 m!994483))

(declare-fun m!994485 () Bool)

(assert (=> bm!45605 m!994485))

(assert (=> b!1076090 m!994477))

(assert (=> b!1076090 m!994477))

(declare-fun m!994487 () Bool)

(assert (=> b!1076090 m!994487))

(assert (=> b!1076086 m!994477))

(assert (=> b!1076086 m!994477))

(assert (=> b!1076086 m!994487))

(declare-fun m!994489 () Bool)

(assert (=> b!1076077 m!994489))

(declare-fun m!994491 () Bool)

(assert (=> b!1076084 m!994491))

(declare-fun m!994493 () Bool)

(assert (=> b!1076080 m!994493))

(assert (=> b!1076083 m!994477))

(declare-fun m!994495 () Bool)

(assert (=> b!1076083 m!994495))

(declare-fun m!994497 () Bool)

(assert (=> b!1076083 m!994497))

(assert (=> b!1076083 m!994495))

(declare-fun m!994499 () Bool)

(assert (=> b!1076083 m!994499))

(assert (=> b!1076083 m!994497))

(assert (=> b!1076083 m!994477))

(declare-fun m!994501 () Bool)

(assert (=> b!1076083 m!994501))

(assert (=> bm!45606 m!994367))

(assert (=> d!129517 m!994339))

(assert (=> b!1075971 d!129517))

(declare-fun bm!45611 () Bool)

(declare-fun call!45614 () ListLongMap!14685)

(declare-fun c!108162 () Bool)

(declare-fun call!45618 () ListLongMap!14685)

(declare-fun c!108164 () Bool)

(declare-fun call!45620 () ListLongMap!14685)

(declare-fun call!45619 () ListLongMap!14685)

(assert (=> bm!45611 (= call!45618 (+!3257 (ite c!108162 call!45619 (ite c!108164 call!45614 call!45620)) (ite (or c!108162 c!108164) (tuple2!16717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1076100 () Bool)

(declare-fun e!615089 () Bool)

(declare-fun lt!477783 () ListLongMap!14685)

(assert (=> b!1076100 (= e!615089 (= (apply!935 lt!477783 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1076101 () Bool)

(declare-fun e!615094 () ListLongMap!14685)

(declare-fun call!45616 () ListLongMap!14685)

(assert (=> b!1076101 (= e!615094 call!45616)))

(declare-fun b!1076102 () Bool)

(declare-fun res!717278 () Bool)

(declare-fun e!615085 () Bool)

(assert (=> b!1076102 (=> (not res!717278) (not e!615085))))

(declare-fun e!615092 () Bool)

(assert (=> b!1076102 (= res!717278 e!615092)))

(declare-fun res!717279 () Bool)

(assert (=> b!1076102 (=> res!717279 e!615092)))

(declare-fun e!615084 () Bool)

(assert (=> b!1076102 (= res!717279 (not e!615084))))

(declare-fun res!717277 () Bool)

(assert (=> b!1076102 (=> (not res!717277) (not e!615084))))

(assert (=> b!1076102 (= res!717277 (bvslt #b00000000000000000000000000000000 (size!33711 _keys!1163)))))

(declare-fun b!1076103 () Bool)

(declare-fun e!615093 () ListLongMap!14685)

(assert (=> b!1076103 (= e!615093 (+!3257 call!45618 (tuple2!16717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45612 () Bool)

(declare-fun call!45617 () Bool)

(assert (=> bm!45612 (= call!45617 (contains!6324 lt!477783 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076105 () Bool)

(assert (=> b!1076105 (= e!615094 call!45620)))

(declare-fun b!1076106 () Bool)

(declare-fun e!615095 () Bool)

(assert (=> b!1076106 (= e!615095 (= (apply!935 lt!477783 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000)) (get!17241 (select (arr!33172 _values!955) #b00000000000000000000000000000000) (dynLambda!2034 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1076106 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33710 _values!955)))))

(assert (=> b!1076106 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33711 _keys!1163)))))

(declare-fun b!1076107 () Bool)

(declare-fun e!615091 () Bool)

(assert (=> b!1076107 (= e!615091 (= (apply!935 lt!477783 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1076108 () Bool)

(declare-fun e!615086 () Bool)

(assert (=> b!1076108 (= e!615086 e!615089)))

(declare-fun res!717282 () Bool)

(declare-fun call!45615 () Bool)

(assert (=> b!1076108 (= res!717282 call!45615)))

(assert (=> b!1076108 (=> (not res!717282) (not e!615089))))

(declare-fun bm!45613 () Bool)

(assert (=> bm!45613 (= call!45619 (getCurrentListMapNoExtraKeys!3934 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076109 () Bool)

(declare-fun e!615090 () Bool)

(assert (=> b!1076109 (= e!615090 (validKeyInArray!0 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45614 () Bool)

(assert (=> bm!45614 (= call!45614 call!45619)))

(declare-fun b!1076110 () Bool)

(declare-fun res!717284 () Bool)

(assert (=> b!1076110 (=> (not res!717284) (not e!615085))))

(declare-fun e!615087 () Bool)

(assert (=> b!1076110 (= res!717284 e!615087)))

(declare-fun c!108161 () Bool)

(assert (=> b!1076110 (= c!108161 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1076111 () Bool)

(declare-fun c!108165 () Bool)

(assert (=> b!1076111 (= c!108165 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!615088 () ListLongMap!14685)

(assert (=> b!1076111 (= e!615088 e!615094)))

(declare-fun b!1076112 () Bool)

(assert (=> b!1076112 (= e!615086 (not call!45615))))

(declare-fun b!1076113 () Bool)

(assert (=> b!1076113 (= e!615084 (validKeyInArray!0 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45615 () Bool)

(assert (=> bm!45615 (= call!45615 (contains!6324 lt!477783 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076114 () Bool)

(assert (=> b!1076114 (= e!615087 e!615091)))

(declare-fun res!717276 () Bool)

(assert (=> b!1076114 (= res!717276 call!45617)))

(assert (=> b!1076114 (=> (not res!717276) (not e!615091))))

(declare-fun b!1076115 () Bool)

(assert (=> b!1076115 (= e!615088 call!45616)))

(declare-fun b!1076116 () Bool)

(assert (=> b!1076116 (= e!615085 e!615086)))

(declare-fun c!108163 () Bool)

(assert (=> b!1076116 (= c!108163 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1076104 () Bool)

(declare-fun e!615083 () Unit!35266)

(declare-fun Unit!35273 () Unit!35266)

(assert (=> b!1076104 (= e!615083 Unit!35273)))

(declare-fun d!129519 () Bool)

(assert (=> d!129519 e!615085))

(declare-fun res!717281 () Bool)

(assert (=> d!129519 (=> (not res!717281) (not e!615085))))

(assert (=> d!129519 (= res!717281 (or (bvsge #b00000000000000000000000000000000 (size!33711 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33711 _keys!1163)))))))

(declare-fun lt!477790 () ListLongMap!14685)

(assert (=> d!129519 (= lt!477783 lt!477790)))

(declare-fun lt!477787 () Unit!35266)

(assert (=> d!129519 (= lt!477787 e!615083)))

(declare-fun c!108160 () Bool)

(assert (=> d!129519 (= c!108160 e!615090)))

(declare-fun res!717280 () Bool)

(assert (=> d!129519 (=> (not res!717280) (not e!615090))))

(assert (=> d!129519 (= res!717280 (bvslt #b00000000000000000000000000000000 (size!33711 _keys!1163)))))

(assert (=> d!129519 (= lt!477790 e!615093)))

(assert (=> d!129519 (= c!108162 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129519 (validMask!0 mask!1515)))

(assert (=> d!129519 (= (getCurrentListMap!4126 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477783)))

(declare-fun b!1076117 () Bool)

(assert (=> b!1076117 (= e!615087 (not call!45617))))

(declare-fun bm!45616 () Bool)

(assert (=> bm!45616 (= call!45616 call!45618)))

(declare-fun bm!45617 () Bool)

(assert (=> bm!45617 (= call!45620 call!45614)))

(declare-fun b!1076118 () Bool)

(assert (=> b!1076118 (= e!615092 e!615095)))

(declare-fun res!717283 () Bool)

(assert (=> b!1076118 (=> (not res!717283) (not e!615095))))

(assert (=> b!1076118 (= res!717283 (contains!6324 lt!477783 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076118 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33711 _keys!1163)))))

(declare-fun b!1076119 () Bool)

(declare-fun lt!477803 () Unit!35266)

(assert (=> b!1076119 (= e!615083 lt!477803)))

(declare-fun lt!477794 () ListLongMap!14685)

(assert (=> b!1076119 (= lt!477794 (getCurrentListMapNoExtraKeys!3934 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477792 () (_ BitVec 64))

(assert (=> b!1076119 (= lt!477792 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477795 () (_ BitVec 64))

(assert (=> b!1076119 (= lt!477795 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477782 () Unit!35266)

(assert (=> b!1076119 (= lt!477782 (addStillContains!648 lt!477794 lt!477792 zeroValueBefore!47 lt!477795))))

(assert (=> b!1076119 (contains!6324 (+!3257 lt!477794 (tuple2!16717 lt!477792 zeroValueBefore!47)) lt!477795)))

(declare-fun lt!477801 () Unit!35266)

(assert (=> b!1076119 (= lt!477801 lt!477782)))

(declare-fun lt!477800 () ListLongMap!14685)

(assert (=> b!1076119 (= lt!477800 (getCurrentListMapNoExtraKeys!3934 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477785 () (_ BitVec 64))

(assert (=> b!1076119 (= lt!477785 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477799 () (_ BitVec 64))

(assert (=> b!1076119 (= lt!477799 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477802 () Unit!35266)

(assert (=> b!1076119 (= lt!477802 (addApplyDifferent!504 lt!477800 lt!477785 minValue!907 lt!477799))))

(assert (=> b!1076119 (= (apply!935 (+!3257 lt!477800 (tuple2!16717 lt!477785 minValue!907)) lt!477799) (apply!935 lt!477800 lt!477799))))

(declare-fun lt!477786 () Unit!35266)

(assert (=> b!1076119 (= lt!477786 lt!477802)))

(declare-fun lt!477789 () ListLongMap!14685)

(assert (=> b!1076119 (= lt!477789 (getCurrentListMapNoExtraKeys!3934 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477797 () (_ BitVec 64))

(assert (=> b!1076119 (= lt!477797 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477798 () (_ BitVec 64))

(assert (=> b!1076119 (= lt!477798 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477788 () Unit!35266)

(assert (=> b!1076119 (= lt!477788 (addApplyDifferent!504 lt!477789 lt!477797 zeroValueBefore!47 lt!477798))))

(assert (=> b!1076119 (= (apply!935 (+!3257 lt!477789 (tuple2!16717 lt!477797 zeroValueBefore!47)) lt!477798) (apply!935 lt!477789 lt!477798))))

(declare-fun lt!477784 () Unit!35266)

(assert (=> b!1076119 (= lt!477784 lt!477788)))

(declare-fun lt!477791 () ListLongMap!14685)

(assert (=> b!1076119 (= lt!477791 (getCurrentListMapNoExtraKeys!3934 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477793 () (_ BitVec 64))

(assert (=> b!1076119 (= lt!477793 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477796 () (_ BitVec 64))

(assert (=> b!1076119 (= lt!477796 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1076119 (= lt!477803 (addApplyDifferent!504 lt!477791 lt!477793 minValue!907 lt!477796))))

(assert (=> b!1076119 (= (apply!935 (+!3257 lt!477791 (tuple2!16717 lt!477793 minValue!907)) lt!477796) (apply!935 lt!477791 lt!477796))))

(declare-fun b!1076120 () Bool)

(assert (=> b!1076120 (= e!615093 e!615088)))

(assert (=> b!1076120 (= c!108164 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!129519 c!108162) b!1076103))

(assert (= (and d!129519 (not c!108162)) b!1076120))

(assert (= (and b!1076120 c!108164) b!1076115))

(assert (= (and b!1076120 (not c!108164)) b!1076111))

(assert (= (and b!1076111 c!108165) b!1076101))

(assert (= (and b!1076111 (not c!108165)) b!1076105))

(assert (= (or b!1076101 b!1076105) bm!45617))

(assert (= (or b!1076115 bm!45617) bm!45614))

(assert (= (or b!1076115 b!1076101) bm!45616))

(assert (= (or b!1076103 bm!45614) bm!45613))

(assert (= (or b!1076103 bm!45616) bm!45611))

(assert (= (and d!129519 res!717280) b!1076109))

(assert (= (and d!129519 c!108160) b!1076119))

(assert (= (and d!129519 (not c!108160)) b!1076104))

(assert (= (and d!129519 res!717281) b!1076102))

(assert (= (and b!1076102 res!717277) b!1076113))

(assert (= (and b!1076102 (not res!717279)) b!1076118))

(assert (= (and b!1076118 res!717283) b!1076106))

(assert (= (and b!1076102 res!717278) b!1076110))

(assert (= (and b!1076110 c!108161) b!1076114))

(assert (= (and b!1076110 (not c!108161)) b!1076117))

(assert (= (and b!1076114 res!717276) b!1076107))

(assert (= (or b!1076114 b!1076117) bm!45612))

(assert (= (and b!1076110 res!717284) b!1076116))

(assert (= (and b!1076116 c!108163) b!1076108))

(assert (= (and b!1076116 (not c!108163)) b!1076112))

(assert (= (and b!1076108 res!717282) b!1076100))

(assert (= (or b!1076108 b!1076112) bm!45615))

(declare-fun b_lambda!16929 () Bool)

(assert (=> (not b_lambda!16929) (not b!1076106)))

(assert (=> b!1076106 t!32588))

(declare-fun b_and!35173 () Bool)

(assert (= b_and!35171 (and (=> t!32588 result!14837) b_and!35173)))

(declare-fun m!994503 () Bool)

(assert (=> b!1076119 m!994503))

(declare-fun m!994505 () Bool)

(assert (=> b!1076119 m!994505))

(declare-fun m!994507 () Bool)

(assert (=> b!1076119 m!994507))

(declare-fun m!994509 () Bool)

(assert (=> b!1076119 m!994509))

(assert (=> b!1076119 m!994505))

(declare-fun m!994511 () Bool)

(assert (=> b!1076119 m!994511))

(declare-fun m!994513 () Bool)

(assert (=> b!1076119 m!994513))

(declare-fun m!994515 () Bool)

(assert (=> b!1076119 m!994515))

(declare-fun m!994517 () Bool)

(assert (=> b!1076119 m!994517))

(declare-fun m!994519 () Bool)

(assert (=> b!1076119 m!994519))

(assert (=> b!1076119 m!994513))

(declare-fun m!994521 () Bool)

(assert (=> b!1076119 m!994521))

(declare-fun m!994523 () Bool)

(assert (=> b!1076119 m!994523))

(declare-fun m!994525 () Bool)

(assert (=> b!1076119 m!994525))

(assert (=> b!1076119 m!994507))

(declare-fun m!994527 () Bool)

(assert (=> b!1076119 m!994527))

(assert (=> b!1076119 m!994369))

(declare-fun m!994529 () Bool)

(assert (=> b!1076119 m!994529))

(declare-fun m!994531 () Bool)

(assert (=> b!1076119 m!994531))

(assert (=> b!1076119 m!994477))

(assert (=> b!1076119 m!994515))

(declare-fun m!994533 () Bool)

(assert (=> bm!45615 m!994533))

(assert (=> b!1076118 m!994477))

(assert (=> b!1076118 m!994477))

(declare-fun m!994535 () Bool)

(assert (=> b!1076118 m!994535))

(declare-fun m!994537 () Bool)

(assert (=> bm!45611 m!994537))

(declare-fun m!994539 () Bool)

(assert (=> bm!45612 m!994539))

(assert (=> b!1076113 m!994477))

(assert (=> b!1076113 m!994477))

(assert (=> b!1076113 m!994487))

(assert (=> b!1076109 m!994477))

(assert (=> b!1076109 m!994477))

(assert (=> b!1076109 m!994487))

(declare-fun m!994541 () Bool)

(assert (=> b!1076100 m!994541))

(declare-fun m!994543 () Bool)

(assert (=> b!1076107 m!994543))

(declare-fun m!994545 () Bool)

(assert (=> b!1076103 m!994545))

(assert (=> b!1076106 m!994477))

(assert (=> b!1076106 m!994495))

(assert (=> b!1076106 m!994497))

(assert (=> b!1076106 m!994495))

(assert (=> b!1076106 m!994499))

(assert (=> b!1076106 m!994497))

(assert (=> b!1076106 m!994477))

(declare-fun m!994547 () Bool)

(assert (=> b!1076106 m!994547))

(assert (=> bm!45613 m!994369))

(assert (=> d!129519 m!994339))

(assert (=> b!1075971 d!129519))

(declare-fun d!129521 () Bool)

(declare-fun e!615096 () Bool)

(assert (=> d!129521 e!615096))

(declare-fun res!717286 () Bool)

(assert (=> d!129521 (=> (not res!717286) (not e!615096))))

(declare-fun lt!477805 () ListLongMap!14685)

(assert (=> d!129521 (= res!717286 (contains!6324 lt!477805 (_1!8369 lt!477663)))))

(declare-fun lt!477807 () List!23234)

(assert (=> d!129521 (= lt!477805 (ListLongMap!14686 lt!477807))))

(declare-fun lt!477804 () Unit!35266)

(declare-fun lt!477806 () Unit!35266)

(assert (=> d!129521 (= lt!477804 lt!477806)))

(assert (=> d!129521 (= (getValueByKey!616 lt!477807 (_1!8369 lt!477663)) (Some!666 (_2!8369 lt!477663)))))

(assert (=> d!129521 (= lt!477806 (lemmaContainsTupThenGetReturnValue!292 lt!477807 (_1!8369 lt!477663) (_2!8369 lt!477663)))))

(assert (=> d!129521 (= lt!477807 (insertStrictlySorted!385 (toList!7358 (+!3257 lt!477665 (tuple2!16717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (_1!8369 lt!477663) (_2!8369 lt!477663)))))

(assert (=> d!129521 (= (+!3257 (+!3257 lt!477665 (tuple2!16717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!477663) lt!477805)))

(declare-fun b!1076121 () Bool)

(declare-fun res!717285 () Bool)

(assert (=> b!1076121 (=> (not res!717285) (not e!615096))))

(assert (=> b!1076121 (= res!717285 (= (getValueByKey!616 (toList!7358 lt!477805) (_1!8369 lt!477663)) (Some!666 (_2!8369 lt!477663))))))

(declare-fun b!1076122 () Bool)

(assert (=> b!1076122 (= e!615096 (contains!6327 (toList!7358 lt!477805) lt!477663))))

(assert (= (and d!129521 res!717286) b!1076121))

(assert (= (and b!1076121 res!717285) b!1076122))

(declare-fun m!994549 () Bool)

(assert (=> d!129521 m!994549))

(declare-fun m!994551 () Bool)

(assert (=> d!129521 m!994551))

(declare-fun m!994553 () Bool)

(assert (=> d!129521 m!994553))

(declare-fun m!994555 () Bool)

(assert (=> d!129521 m!994555))

(declare-fun m!994557 () Bool)

(assert (=> b!1076121 m!994557))

(declare-fun m!994559 () Bool)

(assert (=> b!1076122 m!994559))

(assert (=> b!1075971 d!129521))

(declare-fun d!129523 () Bool)

(declare-fun e!615097 () Bool)

(assert (=> d!129523 e!615097))

(declare-fun res!717288 () Bool)

(assert (=> d!129523 (=> (not res!717288) (not e!615097))))

(declare-fun lt!477809 () ListLongMap!14685)

(assert (=> d!129523 (= res!717288 (contains!6324 lt!477809 (_1!8369 lt!477663)))))

(declare-fun lt!477811 () List!23234)

(assert (=> d!129523 (= lt!477809 (ListLongMap!14686 lt!477811))))

(declare-fun lt!477808 () Unit!35266)

(declare-fun lt!477810 () Unit!35266)

(assert (=> d!129523 (= lt!477808 lt!477810)))

(assert (=> d!129523 (= (getValueByKey!616 lt!477811 (_1!8369 lt!477663)) (Some!666 (_2!8369 lt!477663)))))

(assert (=> d!129523 (= lt!477810 (lemmaContainsTupThenGetReturnValue!292 lt!477811 (_1!8369 lt!477663) (_2!8369 lt!477663)))))

(assert (=> d!129523 (= lt!477811 (insertStrictlySorted!385 (toList!7358 lt!477665) (_1!8369 lt!477663) (_2!8369 lt!477663)))))

(assert (=> d!129523 (= (+!3257 lt!477665 lt!477663) lt!477809)))

(declare-fun b!1076123 () Bool)

(declare-fun res!717287 () Bool)

(assert (=> b!1076123 (=> (not res!717287) (not e!615097))))

(assert (=> b!1076123 (= res!717287 (= (getValueByKey!616 (toList!7358 lt!477809) (_1!8369 lt!477663)) (Some!666 (_2!8369 lt!477663))))))

(declare-fun b!1076124 () Bool)

(assert (=> b!1076124 (= e!615097 (contains!6327 (toList!7358 lt!477809) lt!477663))))

(assert (= (and d!129523 res!717288) b!1076123))

(assert (= (and b!1076123 res!717287) b!1076124))

(declare-fun m!994561 () Bool)

(assert (=> d!129523 m!994561))

(declare-fun m!994563 () Bool)

(assert (=> d!129523 m!994563))

(declare-fun m!994565 () Bool)

(assert (=> d!129523 m!994565))

(declare-fun m!994567 () Bool)

(assert (=> d!129523 m!994567))

(declare-fun m!994569 () Bool)

(assert (=> b!1076123 m!994569))

(declare-fun m!994571 () Bool)

(assert (=> b!1076124 m!994571))

(assert (=> b!1075971 d!129523))

(declare-fun d!129525 () Bool)

(declare-fun e!615103 () Bool)

(assert (=> d!129525 e!615103))

(declare-fun res!717291 () Bool)

(assert (=> d!129525 (=> res!717291 e!615103)))

(declare-fun lt!477820 () Bool)

(assert (=> d!129525 (= res!717291 (not lt!477820))))

(declare-fun lt!477823 () Bool)

(assert (=> d!129525 (= lt!477820 lt!477823)))

(declare-fun lt!477822 () Unit!35266)

(declare-fun e!615102 () Unit!35266)

(assert (=> d!129525 (= lt!477822 e!615102)))

(declare-fun c!108168 () Bool)

(assert (=> d!129525 (= c!108168 lt!477823)))

(declare-fun containsKey!581 (List!23234 (_ BitVec 64)) Bool)

(assert (=> d!129525 (= lt!477823 (containsKey!581 (toList!7358 (+!3257 lt!477665 lt!477663)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129525 (= (contains!6324 (+!3257 lt!477665 lt!477663) #b0000000000000000000000000000000000000000000000000000000000000000) lt!477820)))

(declare-fun b!1076131 () Bool)

(declare-fun lt!477821 () Unit!35266)

(assert (=> b!1076131 (= e!615102 lt!477821)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!413 (List!23234 (_ BitVec 64)) Unit!35266)

(assert (=> b!1076131 (= lt!477821 (lemmaContainsKeyImpliesGetValueByKeyDefined!413 (toList!7358 (+!3257 lt!477665 lt!477663)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!456 (Option!667) Bool)

(assert (=> b!1076131 (isDefined!456 (getValueByKey!616 (toList!7358 (+!3257 lt!477665 lt!477663)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076132 () Bool)

(declare-fun Unit!35274 () Unit!35266)

(assert (=> b!1076132 (= e!615102 Unit!35274)))

(declare-fun b!1076133 () Bool)

(assert (=> b!1076133 (= e!615103 (isDefined!456 (getValueByKey!616 (toList!7358 (+!3257 lt!477665 lt!477663)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129525 c!108168) b!1076131))

(assert (= (and d!129525 (not c!108168)) b!1076132))

(assert (= (and d!129525 (not res!717291)) b!1076133))

(declare-fun m!994573 () Bool)

(assert (=> d!129525 m!994573))

(declare-fun m!994575 () Bool)

(assert (=> b!1076131 m!994575))

(declare-fun m!994577 () Bool)

(assert (=> b!1076131 m!994577))

(assert (=> b!1076131 m!994577))

(declare-fun m!994579 () Bool)

(assert (=> b!1076131 m!994579))

(assert (=> b!1076133 m!994577))

(assert (=> b!1076133 m!994577))

(assert (=> b!1076133 m!994579))

(assert (=> b!1075971 d!129525))

(declare-fun d!129527 () Bool)

(assert (=> d!129527 (= (getCurrentListMapNoExtraKeys!3934 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3934 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477826 () Unit!35266)

(declare-fun choose!1765 (array!68978 array!68976 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39849 V!39849 V!39849 V!39849 (_ BitVec 32) Int) Unit!35266)

(assert (=> d!129527 (= lt!477826 (choose!1765 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129527 (validMask!0 mask!1515)))

(assert (=> d!129527 (= (lemmaNoChangeToArrayThenSameMapNoExtras!906 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477826)))

(declare-fun bs!31668 () Bool)

(assert (= bs!31668 d!129527))

(assert (=> bs!31668 m!994369))

(assert (=> bs!31668 m!994367))

(declare-fun m!994581 () Bool)

(assert (=> bs!31668 m!994581))

(assert (=> bs!31668 m!994339))

(assert (=> b!1075972 d!129527))

(declare-fun b!1076158 () Bool)

(declare-fun e!615124 () ListLongMap!14685)

(declare-fun e!615120 () ListLongMap!14685)

(assert (=> b!1076158 (= e!615124 e!615120)))

(declare-fun c!108177 () Bool)

(assert (=> b!1076158 (= c!108177 (validKeyInArray!0 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076159 () Bool)

(declare-fun res!717303 () Bool)

(declare-fun e!615118 () Bool)

(assert (=> b!1076159 (=> (not res!717303) (not e!615118))))

(declare-fun lt!477843 () ListLongMap!14685)

(assert (=> b!1076159 (= res!717303 (not (contains!6324 lt!477843 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1076160 () Bool)

(declare-fun call!45623 () ListLongMap!14685)

(assert (=> b!1076160 (= e!615120 call!45623)))

(declare-fun b!1076161 () Bool)

(declare-fun e!615121 () Bool)

(assert (=> b!1076161 (= e!615121 (validKeyInArray!0 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076161 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1076163 () Bool)

(declare-fun e!615119 () Bool)

(declare-fun isEmpty!965 (ListLongMap!14685) Bool)

(assert (=> b!1076163 (= e!615119 (isEmpty!965 lt!477843))))

(declare-fun b!1076164 () Bool)

(declare-fun lt!477842 () Unit!35266)

(declare-fun lt!477844 () Unit!35266)

(assert (=> b!1076164 (= lt!477842 lt!477844)))

(declare-fun lt!477847 () (_ BitVec 64))

(declare-fun lt!477841 () ListLongMap!14685)

(declare-fun lt!477845 () (_ BitVec 64))

(declare-fun lt!477846 () V!39849)

(assert (=> b!1076164 (not (contains!6324 (+!3257 lt!477841 (tuple2!16717 lt!477845 lt!477846)) lt!477847))))

(declare-fun addStillNotContains!271 (ListLongMap!14685 (_ BitVec 64) V!39849 (_ BitVec 64)) Unit!35266)

(assert (=> b!1076164 (= lt!477844 (addStillNotContains!271 lt!477841 lt!477845 lt!477846 lt!477847))))

(assert (=> b!1076164 (= lt!477847 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1076164 (= lt!477846 (get!17241 (select (arr!33172 _values!955) #b00000000000000000000000000000000) (dynLambda!2034 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1076164 (= lt!477845 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1076164 (= lt!477841 call!45623)))

(assert (=> b!1076164 (= e!615120 (+!3257 call!45623 (tuple2!16717 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000) (get!17241 (select (arr!33172 _values!955) #b00000000000000000000000000000000) (dynLambda!2034 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!45620 () Bool)

(assert (=> bm!45620 (= call!45623 (getCurrentListMapNoExtraKeys!3934 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1076165 () Bool)

(declare-fun e!615122 () Bool)

(declare-fun e!615123 () Bool)

(assert (=> b!1076165 (= e!615122 e!615123)))

(assert (=> b!1076165 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33711 _keys!1163)))))

(declare-fun res!717301 () Bool)

(assert (=> b!1076165 (= res!717301 (contains!6324 lt!477843 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076165 (=> (not res!717301) (not e!615123))))

(declare-fun d!129529 () Bool)

(assert (=> d!129529 e!615118))

(declare-fun res!717300 () Bool)

(assert (=> d!129529 (=> (not res!717300) (not e!615118))))

(assert (=> d!129529 (= res!717300 (not (contains!6324 lt!477843 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129529 (= lt!477843 e!615124)))

(declare-fun c!108180 () Bool)

(assert (=> d!129529 (= c!108180 (bvsge #b00000000000000000000000000000000 (size!33711 _keys!1163)))))

(assert (=> d!129529 (validMask!0 mask!1515)))

(assert (=> d!129529 (= (getCurrentListMapNoExtraKeys!3934 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477843)))

(declare-fun b!1076162 () Bool)

(assert (=> b!1076162 (= e!615119 (= lt!477843 (getCurrentListMapNoExtraKeys!3934 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1076166 () Bool)

(assert (=> b!1076166 (= e!615122 e!615119)))

(declare-fun c!108178 () Bool)

(assert (=> b!1076166 (= c!108178 (bvslt #b00000000000000000000000000000000 (size!33711 _keys!1163)))))

(declare-fun b!1076167 () Bool)

(assert (=> b!1076167 (= e!615124 (ListLongMap!14686 Nil!23231))))

(declare-fun b!1076168 () Bool)

(assert (=> b!1076168 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33711 _keys!1163)))))

(assert (=> b!1076168 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33710 _values!955)))))

(assert (=> b!1076168 (= e!615123 (= (apply!935 lt!477843 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000)) (get!17241 (select (arr!33172 _values!955) #b00000000000000000000000000000000) (dynLambda!2034 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1076169 () Bool)

(assert (=> b!1076169 (= e!615118 e!615122)))

(declare-fun c!108179 () Bool)

(assert (=> b!1076169 (= c!108179 e!615121)))

(declare-fun res!717302 () Bool)

(assert (=> b!1076169 (=> (not res!717302) (not e!615121))))

(assert (=> b!1076169 (= res!717302 (bvslt #b00000000000000000000000000000000 (size!33711 _keys!1163)))))

(assert (= (and d!129529 c!108180) b!1076167))

(assert (= (and d!129529 (not c!108180)) b!1076158))

(assert (= (and b!1076158 c!108177) b!1076164))

(assert (= (and b!1076158 (not c!108177)) b!1076160))

(assert (= (or b!1076164 b!1076160) bm!45620))

(assert (= (and d!129529 res!717300) b!1076159))

(assert (= (and b!1076159 res!717303) b!1076169))

(assert (= (and b!1076169 res!717302) b!1076161))

(assert (= (and b!1076169 c!108179) b!1076165))

(assert (= (and b!1076169 (not c!108179)) b!1076166))

(assert (= (and b!1076165 res!717301) b!1076168))

(assert (= (and b!1076166 c!108178) b!1076162))

(assert (= (and b!1076166 (not c!108178)) b!1076163))

(declare-fun b_lambda!16931 () Bool)

(assert (=> (not b_lambda!16931) (not b!1076164)))

(assert (=> b!1076164 t!32588))

(declare-fun b_and!35175 () Bool)

(assert (= b_and!35173 (and (=> t!32588 result!14837) b_and!35175)))

(declare-fun b_lambda!16933 () Bool)

(assert (=> (not b_lambda!16933) (not b!1076168)))

(assert (=> b!1076168 t!32588))

(declare-fun b_and!35177 () Bool)

(assert (= b_and!35175 (and (=> t!32588 result!14837) b_and!35177)))

(assert (=> b!1076165 m!994477))

(assert (=> b!1076165 m!994477))

(declare-fun m!994583 () Bool)

(assert (=> b!1076165 m!994583))

(assert (=> b!1076168 m!994495))

(assert (=> b!1076168 m!994497))

(assert (=> b!1076168 m!994495))

(assert (=> b!1076168 m!994499))

(assert (=> b!1076168 m!994477))

(declare-fun m!994585 () Bool)

(assert (=> b!1076168 m!994585))

(assert (=> b!1076168 m!994477))

(assert (=> b!1076168 m!994497))

(declare-fun m!994587 () Bool)

(assert (=> b!1076164 m!994587))

(declare-fun m!994589 () Bool)

(assert (=> b!1076164 m!994589))

(assert (=> b!1076164 m!994495))

(assert (=> b!1076164 m!994497))

(assert (=> b!1076164 m!994495))

(assert (=> b!1076164 m!994499))

(declare-fun m!994591 () Bool)

(assert (=> b!1076164 m!994591))

(declare-fun m!994593 () Bool)

(assert (=> b!1076164 m!994593))

(assert (=> b!1076164 m!994497))

(assert (=> b!1076164 m!994477))

(assert (=> b!1076164 m!994587))

(assert (=> b!1076158 m!994477))

(assert (=> b!1076158 m!994477))

(assert (=> b!1076158 m!994487))

(declare-fun m!994595 () Bool)

(assert (=> bm!45620 m!994595))

(declare-fun m!994597 () Bool)

(assert (=> d!129529 m!994597))

(assert (=> d!129529 m!994339))

(declare-fun m!994599 () Bool)

(assert (=> b!1076163 m!994599))

(assert (=> b!1076162 m!994595))

(assert (=> b!1076161 m!994477))

(assert (=> b!1076161 m!994477))

(assert (=> b!1076161 m!994487))

(declare-fun m!994601 () Bool)

(assert (=> b!1076159 m!994601))

(assert (=> b!1075972 d!129529))

(declare-fun b!1076170 () Bool)

(declare-fun e!615131 () ListLongMap!14685)

(declare-fun e!615127 () ListLongMap!14685)

(assert (=> b!1076170 (= e!615131 e!615127)))

(declare-fun c!108181 () Bool)

(assert (=> b!1076170 (= c!108181 (validKeyInArray!0 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076171 () Bool)

(declare-fun res!717307 () Bool)

(declare-fun e!615125 () Bool)

(assert (=> b!1076171 (=> (not res!717307) (not e!615125))))

(declare-fun lt!477850 () ListLongMap!14685)

(assert (=> b!1076171 (= res!717307 (not (contains!6324 lt!477850 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1076172 () Bool)

(declare-fun call!45624 () ListLongMap!14685)

(assert (=> b!1076172 (= e!615127 call!45624)))

(declare-fun b!1076173 () Bool)

(declare-fun e!615128 () Bool)

(assert (=> b!1076173 (= e!615128 (validKeyInArray!0 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076173 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1076175 () Bool)

(declare-fun e!615126 () Bool)

(assert (=> b!1076175 (= e!615126 (isEmpty!965 lt!477850))))

(declare-fun b!1076176 () Bool)

(declare-fun lt!477849 () Unit!35266)

(declare-fun lt!477851 () Unit!35266)

(assert (=> b!1076176 (= lt!477849 lt!477851)))

(declare-fun lt!477853 () V!39849)

(declare-fun lt!477854 () (_ BitVec 64))

(declare-fun lt!477852 () (_ BitVec 64))

(declare-fun lt!477848 () ListLongMap!14685)

(assert (=> b!1076176 (not (contains!6324 (+!3257 lt!477848 (tuple2!16717 lt!477852 lt!477853)) lt!477854))))

(assert (=> b!1076176 (= lt!477851 (addStillNotContains!271 lt!477848 lt!477852 lt!477853 lt!477854))))

(assert (=> b!1076176 (= lt!477854 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1076176 (= lt!477853 (get!17241 (select (arr!33172 _values!955) #b00000000000000000000000000000000) (dynLambda!2034 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1076176 (= lt!477852 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1076176 (= lt!477848 call!45624)))

(assert (=> b!1076176 (= e!615127 (+!3257 call!45624 (tuple2!16717 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000) (get!17241 (select (arr!33172 _values!955) #b00000000000000000000000000000000) (dynLambda!2034 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!45621 () Bool)

(assert (=> bm!45621 (= call!45624 (getCurrentListMapNoExtraKeys!3934 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1076177 () Bool)

(declare-fun e!615129 () Bool)

(declare-fun e!615130 () Bool)

(assert (=> b!1076177 (= e!615129 e!615130)))

(assert (=> b!1076177 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33711 _keys!1163)))))

(declare-fun res!717305 () Bool)

(assert (=> b!1076177 (= res!717305 (contains!6324 lt!477850 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076177 (=> (not res!717305) (not e!615130))))

(declare-fun d!129531 () Bool)

(assert (=> d!129531 e!615125))

(declare-fun res!717304 () Bool)

(assert (=> d!129531 (=> (not res!717304) (not e!615125))))

(assert (=> d!129531 (= res!717304 (not (contains!6324 lt!477850 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129531 (= lt!477850 e!615131)))

(declare-fun c!108184 () Bool)

(assert (=> d!129531 (= c!108184 (bvsge #b00000000000000000000000000000000 (size!33711 _keys!1163)))))

(assert (=> d!129531 (validMask!0 mask!1515)))

(assert (=> d!129531 (= (getCurrentListMapNoExtraKeys!3934 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477850)))

(declare-fun b!1076174 () Bool)

(assert (=> b!1076174 (= e!615126 (= lt!477850 (getCurrentListMapNoExtraKeys!3934 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1076178 () Bool)

(assert (=> b!1076178 (= e!615129 e!615126)))

(declare-fun c!108182 () Bool)

(assert (=> b!1076178 (= c!108182 (bvslt #b00000000000000000000000000000000 (size!33711 _keys!1163)))))

(declare-fun b!1076179 () Bool)

(assert (=> b!1076179 (= e!615131 (ListLongMap!14686 Nil!23231))))

(declare-fun b!1076180 () Bool)

(assert (=> b!1076180 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33711 _keys!1163)))))

(assert (=> b!1076180 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33710 _values!955)))))

(assert (=> b!1076180 (= e!615130 (= (apply!935 lt!477850 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000)) (get!17241 (select (arr!33172 _values!955) #b00000000000000000000000000000000) (dynLambda!2034 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1076181 () Bool)

(assert (=> b!1076181 (= e!615125 e!615129)))

(declare-fun c!108183 () Bool)

(assert (=> b!1076181 (= c!108183 e!615128)))

(declare-fun res!717306 () Bool)

(assert (=> b!1076181 (=> (not res!717306) (not e!615128))))

(assert (=> b!1076181 (= res!717306 (bvslt #b00000000000000000000000000000000 (size!33711 _keys!1163)))))

(assert (= (and d!129531 c!108184) b!1076179))

(assert (= (and d!129531 (not c!108184)) b!1076170))

(assert (= (and b!1076170 c!108181) b!1076176))

(assert (= (and b!1076170 (not c!108181)) b!1076172))

(assert (= (or b!1076176 b!1076172) bm!45621))

(assert (= (and d!129531 res!717304) b!1076171))

(assert (= (and b!1076171 res!717307) b!1076181))

(assert (= (and b!1076181 res!717306) b!1076173))

(assert (= (and b!1076181 c!108183) b!1076177))

(assert (= (and b!1076181 (not c!108183)) b!1076178))

(assert (= (and b!1076177 res!717305) b!1076180))

(assert (= (and b!1076178 c!108182) b!1076174))

(assert (= (and b!1076178 (not c!108182)) b!1076175))

(declare-fun b_lambda!16935 () Bool)

(assert (=> (not b_lambda!16935) (not b!1076176)))

(assert (=> b!1076176 t!32588))

(declare-fun b_and!35179 () Bool)

(assert (= b_and!35177 (and (=> t!32588 result!14837) b_and!35179)))

(declare-fun b_lambda!16937 () Bool)

(assert (=> (not b_lambda!16937) (not b!1076180)))

(assert (=> b!1076180 t!32588))

(declare-fun b_and!35181 () Bool)

(assert (= b_and!35179 (and (=> t!32588 result!14837) b_and!35181)))

(assert (=> b!1076177 m!994477))

(assert (=> b!1076177 m!994477))

(declare-fun m!994603 () Bool)

(assert (=> b!1076177 m!994603))

(assert (=> b!1076180 m!994495))

(assert (=> b!1076180 m!994497))

(assert (=> b!1076180 m!994495))

(assert (=> b!1076180 m!994499))

(assert (=> b!1076180 m!994477))

(declare-fun m!994605 () Bool)

(assert (=> b!1076180 m!994605))

(assert (=> b!1076180 m!994477))

(assert (=> b!1076180 m!994497))

(declare-fun m!994607 () Bool)

(assert (=> b!1076176 m!994607))

(declare-fun m!994609 () Bool)

(assert (=> b!1076176 m!994609))

(assert (=> b!1076176 m!994495))

(assert (=> b!1076176 m!994497))

(assert (=> b!1076176 m!994495))

(assert (=> b!1076176 m!994499))

(declare-fun m!994611 () Bool)

(assert (=> b!1076176 m!994611))

(declare-fun m!994613 () Bool)

(assert (=> b!1076176 m!994613))

(assert (=> b!1076176 m!994497))

(assert (=> b!1076176 m!994477))

(assert (=> b!1076176 m!994607))

(assert (=> b!1076170 m!994477))

(assert (=> b!1076170 m!994477))

(assert (=> b!1076170 m!994487))

(declare-fun m!994615 () Bool)

(assert (=> bm!45621 m!994615))

(declare-fun m!994617 () Bool)

(assert (=> d!129531 m!994617))

(assert (=> d!129531 m!994339))

(declare-fun m!994619 () Bool)

(assert (=> b!1076175 m!994619))

(assert (=> b!1076174 m!994615))

(assert (=> b!1076173 m!994477))

(assert (=> b!1076173 m!994477))

(assert (=> b!1076173 m!994487))

(declare-fun m!994621 () Bool)

(assert (=> b!1076171 m!994621))

(assert (=> b!1075972 d!129531))

(declare-fun d!129533 () Bool)

(declare-fun res!717312 () Bool)

(declare-fun e!615139 () Bool)

(assert (=> d!129533 (=> res!717312 e!615139)))

(assert (=> d!129533 (= res!717312 (bvsge #b00000000000000000000000000000000 (size!33711 _keys!1163)))))

(assert (=> d!129533 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!615139)))

(declare-fun b!1076190 () Bool)

(declare-fun e!615138 () Bool)

(declare-fun call!45627 () Bool)

(assert (=> b!1076190 (= e!615138 call!45627)))

(declare-fun b!1076191 () Bool)

(assert (=> b!1076191 (= e!615139 e!615138)))

(declare-fun c!108187 () Bool)

(assert (=> b!1076191 (= c!108187 (validKeyInArray!0 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076192 () Bool)

(declare-fun e!615140 () Bool)

(assert (=> b!1076192 (= e!615140 call!45627)))

(declare-fun bm!45624 () Bool)

(assert (=> bm!45624 (= call!45627 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1076193 () Bool)

(assert (=> b!1076193 (= e!615138 e!615140)))

(declare-fun lt!477861 () (_ BitVec 64))

(assert (=> b!1076193 (= lt!477861 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477863 () Unit!35266)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68978 (_ BitVec 64) (_ BitVec 32)) Unit!35266)

(assert (=> b!1076193 (= lt!477863 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!477861 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68978 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1076193 (arrayContainsKey!0 _keys!1163 lt!477861 #b00000000000000000000000000000000)))

(declare-fun lt!477862 () Unit!35266)

(assert (=> b!1076193 (= lt!477862 lt!477863)))

(declare-fun res!717313 () Bool)

(declare-datatypes ((SeekEntryResult!9894 0))(
  ( (MissingZero!9894 (index!41947 (_ BitVec 32))) (Found!9894 (index!41948 (_ BitVec 32))) (Intermediate!9894 (undefined!10706 Bool) (index!41949 (_ BitVec 32)) (x!96438 (_ BitVec 32))) (Undefined!9894) (MissingVacant!9894 (index!41950 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68978 (_ BitVec 32)) SeekEntryResult!9894)

(assert (=> b!1076193 (= res!717313 (= (seekEntryOrOpen!0 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9894 #b00000000000000000000000000000000)))))

(assert (=> b!1076193 (=> (not res!717313) (not e!615140))))

(assert (= (and d!129533 (not res!717312)) b!1076191))

(assert (= (and b!1076191 c!108187) b!1076193))

(assert (= (and b!1076191 (not c!108187)) b!1076190))

(assert (= (and b!1076193 res!717313) b!1076192))

(assert (= (or b!1076192 b!1076190) bm!45624))

(assert (=> b!1076191 m!994477))

(assert (=> b!1076191 m!994477))

(assert (=> b!1076191 m!994487))

(declare-fun m!994623 () Bool)

(assert (=> bm!45624 m!994623))

(assert (=> b!1076193 m!994477))

(declare-fun m!994625 () Bool)

(assert (=> b!1076193 m!994625))

(declare-fun m!994627 () Bool)

(assert (=> b!1076193 m!994627))

(assert (=> b!1076193 m!994477))

(declare-fun m!994629 () Bool)

(assert (=> b!1076193 m!994629))

(assert (=> b!1075968 d!129533))

(declare-fun b!1076204 () Bool)

(declare-fun e!615150 () Bool)

(declare-fun e!615152 () Bool)

(assert (=> b!1076204 (= e!615150 e!615152)))

(declare-fun res!717320 () Bool)

(assert (=> b!1076204 (=> (not res!717320) (not e!615152))))

(declare-fun e!615149 () Bool)

(assert (=> b!1076204 (= res!717320 (not e!615149))))

(declare-fun res!717321 () Bool)

(assert (=> b!1076204 (=> (not res!717321) (not e!615149))))

(assert (=> b!1076204 (= res!717321 (validKeyInArray!0 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076205 () Bool)

(declare-fun e!615151 () Bool)

(assert (=> b!1076205 (= e!615152 e!615151)))

(declare-fun c!108190 () Bool)

(assert (=> b!1076205 (= c!108190 (validKeyInArray!0 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076206 () Bool)

(declare-fun call!45630 () Bool)

(assert (=> b!1076206 (= e!615151 call!45630)))

(declare-fun b!1076207 () Bool)

(assert (=> b!1076207 (= e!615151 call!45630)))

(declare-fun bm!45627 () Bool)

(assert (=> bm!45627 (= call!45630 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108190 (Cons!23231 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000) Nil!23232) Nil!23232)))))

(declare-fun b!1076208 () Bool)

(declare-fun contains!6328 (List!23235 (_ BitVec 64)) Bool)

(assert (=> b!1076208 (= e!615149 (contains!6328 Nil!23232 (select (arr!33173 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129535 () Bool)

(declare-fun res!717322 () Bool)

(assert (=> d!129535 (=> res!717322 e!615150)))

(assert (=> d!129535 (= res!717322 (bvsge #b00000000000000000000000000000000 (size!33711 _keys!1163)))))

(assert (=> d!129535 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23232) e!615150)))

(assert (= (and d!129535 (not res!717322)) b!1076204))

(assert (= (and b!1076204 res!717321) b!1076208))

(assert (= (and b!1076204 res!717320) b!1076205))

(assert (= (and b!1076205 c!108190) b!1076207))

(assert (= (and b!1076205 (not c!108190)) b!1076206))

(assert (= (or b!1076207 b!1076206) bm!45627))

(assert (=> b!1076204 m!994477))

(assert (=> b!1076204 m!994477))

(assert (=> b!1076204 m!994487))

(assert (=> b!1076205 m!994477))

(assert (=> b!1076205 m!994477))

(assert (=> b!1076205 m!994487))

(assert (=> bm!45627 m!994477))

(declare-fun m!994631 () Bool)

(assert (=> bm!45627 m!994631))

(assert (=> b!1076208 m!994477))

(assert (=> b!1076208 m!994477))

(declare-fun m!994633 () Bool)

(assert (=> b!1076208 m!994633))

(assert (=> b!1075969 d!129535))

(declare-fun d!129537 () Bool)

(declare-fun e!615153 () Bool)

(assert (=> d!129537 e!615153))

(declare-fun res!717324 () Bool)

(assert (=> d!129537 (=> (not res!717324) (not e!615153))))

(declare-fun lt!477865 () ListLongMap!14685)

(assert (=> d!129537 (= res!717324 (contains!6324 lt!477865 (_1!8369 lt!477663)))))

(declare-fun lt!477867 () List!23234)

(assert (=> d!129537 (= lt!477865 (ListLongMap!14686 lt!477867))))

(declare-fun lt!477864 () Unit!35266)

(declare-fun lt!477866 () Unit!35266)

(assert (=> d!129537 (= lt!477864 lt!477866)))

(assert (=> d!129537 (= (getValueByKey!616 lt!477867 (_1!8369 lt!477663)) (Some!666 (_2!8369 lt!477663)))))

(assert (=> d!129537 (= lt!477866 (lemmaContainsTupThenGetReturnValue!292 lt!477867 (_1!8369 lt!477663) (_2!8369 lt!477663)))))

(assert (=> d!129537 (= lt!477867 (insertStrictlySorted!385 (toList!7358 lt!477664) (_1!8369 lt!477663) (_2!8369 lt!477663)))))

(assert (=> d!129537 (= (+!3257 lt!477664 lt!477663) lt!477865)))

(declare-fun b!1076209 () Bool)

(declare-fun res!717323 () Bool)

(assert (=> b!1076209 (=> (not res!717323) (not e!615153))))

(assert (=> b!1076209 (= res!717323 (= (getValueByKey!616 (toList!7358 lt!477865) (_1!8369 lt!477663)) (Some!666 (_2!8369 lt!477663))))))

(declare-fun b!1076210 () Bool)

(assert (=> b!1076210 (= e!615153 (contains!6327 (toList!7358 lt!477865) lt!477663))))

(assert (= (and d!129537 res!717324) b!1076209))

(assert (= (and b!1076209 res!717323) b!1076210))

(declare-fun m!994635 () Bool)

(assert (=> d!129537 m!994635))

(declare-fun m!994637 () Bool)

(assert (=> d!129537 m!994637))

(declare-fun m!994639 () Bool)

(assert (=> d!129537 m!994639))

(declare-fun m!994641 () Bool)

(assert (=> d!129537 m!994641))

(declare-fun m!994643 () Bool)

(assert (=> b!1076209 m!994643))

(declare-fun m!994645 () Bool)

(assert (=> b!1076210 m!994645))

(assert (=> b!1075966 d!129537))

(declare-fun d!129539 () Bool)

(assert (=> d!129539 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95198 d!129539))

(declare-fun d!129541 () Bool)

(assert (=> d!129541 (= (array_inv!25656 _values!955) (bvsge (size!33710 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95198 d!129541))

(declare-fun d!129543 () Bool)

(assert (=> d!129543 (= (array_inv!25657 _keys!1163) (bvsge (size!33711 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95198 d!129543))

(declare-fun mapNonEmpty!40804 () Bool)

(declare-fun mapRes!40804 () Bool)

(declare-fun tp!78185 () Bool)

(declare-fun e!615159 () Bool)

(assert (=> mapNonEmpty!40804 (= mapRes!40804 (and tp!78185 e!615159))))

(declare-fun mapValue!40804 () ValueCell!12314)

(declare-fun mapRest!40804 () (Array (_ BitVec 32) ValueCell!12314))

(declare-fun mapKey!40804 () (_ BitVec 32))

(assert (=> mapNonEmpty!40804 (= mapRest!40795 (store mapRest!40804 mapKey!40804 mapValue!40804))))

(declare-fun mapIsEmpty!40804 () Bool)

(assert (=> mapIsEmpty!40804 mapRes!40804))

(declare-fun b!1076218 () Bool)

(declare-fun e!615158 () Bool)

(assert (=> b!1076218 (= e!615158 tp_is_empty!26035)))

(declare-fun condMapEmpty!40804 () Bool)

(declare-fun mapDefault!40804 () ValueCell!12314)

(assert (=> mapNonEmpty!40795 (= condMapEmpty!40804 (= mapRest!40795 ((as const (Array (_ BitVec 32) ValueCell!12314)) mapDefault!40804)))))

(assert (=> mapNonEmpty!40795 (= tp!78170 (and e!615158 mapRes!40804))))

(declare-fun b!1076217 () Bool)

(assert (=> b!1076217 (= e!615159 tp_is_empty!26035)))

(assert (= (and mapNonEmpty!40795 condMapEmpty!40804) mapIsEmpty!40804))

(assert (= (and mapNonEmpty!40795 (not condMapEmpty!40804)) mapNonEmpty!40804))

(assert (= (and mapNonEmpty!40804 ((_ is ValueCellFull!12314) mapValue!40804)) b!1076217))

(assert (= (and mapNonEmpty!40795 ((_ is ValueCellFull!12314) mapDefault!40804)) b!1076218))

(declare-fun m!994647 () Bool)

(assert (=> mapNonEmpty!40804 m!994647))

(declare-fun b_lambda!16939 () Bool)

(assert (= b_lambda!16937 (or (and start!95198 b_free!22225) b_lambda!16939)))

(declare-fun b_lambda!16941 () Bool)

(assert (= b_lambda!16929 (or (and start!95198 b_free!22225) b_lambda!16941)))

(declare-fun b_lambda!16943 () Bool)

(assert (= b_lambda!16933 (or (and start!95198 b_free!22225) b_lambda!16943)))

(declare-fun b_lambda!16945 () Bool)

(assert (= b_lambda!16927 (or (and start!95198 b_free!22225) b_lambda!16945)))

(declare-fun b_lambda!16947 () Bool)

(assert (= b_lambda!16931 (or (and start!95198 b_free!22225) b_lambda!16947)))

(declare-fun b_lambda!16949 () Bool)

(assert (= b_lambda!16935 (or (and start!95198 b_free!22225) b_lambda!16949)))

(check-sat (not d!129529) (not b!1076168) (not b!1076159) (not bm!45620) (not b_lambda!16947) (not b!1076086) (not b!1076171) (not b!1076106) (not d!129519) (not b!1076205) (not b_lambda!16949) (not b_lambda!16939) (not b_lambda!16941) (not b_next!22225) (not b!1076162) (not b!1076095) (not d!129531) (not b!1076163) (not b!1076177) (not bm!45621) (not b!1076107) (not d!129537) (not d!129525) (not d!129521) (not b!1076080) (not b!1076165) (not b!1076118) (not b!1076170) b_and!35181 (not bm!45605) (not b!1076090) (not b!1076096) (not b!1076158) (not bm!45606) (not b!1076161) (not b!1076100) (not b!1076122) (not b_lambda!16945) (not bm!45624) (not b!1076113) (not b!1076180) (not b!1076119) (not d!129523) (not b!1076131) (not b!1076208) (not bm!45612) (not b!1076124) (not d!129527) (not b!1076173) (not d!129515) (not b!1076204) (not bm!45608) (not bm!45627) (not b!1076176) (not d!129517) (not b!1076109) (not bm!45611) (not b!1076033) (not b!1076103) (not b!1076133) (not b!1076121) (not bm!45613) (not b!1076210) tp_is_empty!26035 (not bm!45615) (not b!1076034) (not b!1076193) (not b_lambda!16943) (not b!1076191) (not b!1076084) (not b!1076175) (not b!1076164) (not b!1076077) (not b!1076083) (not b!1076209) (not b!1076123) (not b!1076174) (not mapNonEmpty!40804) (not bm!45604))
(check-sat b_and!35181 (not b_next!22225))
