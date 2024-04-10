; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95206 () Bool)

(assert start!95206)

(declare-fun b_free!22227 () Bool)

(declare-fun b_next!22227 () Bool)

(assert (=> start!95206 (= b_free!22227 (not b_next!22227))))

(declare-fun tp!78175 () Bool)

(declare-fun b_and!35193 () Bool)

(assert (=> start!95206 (= tp!78175 b_and!35193)))

(declare-fun b!1076146 () Bool)

(declare-fun e!615108 () Bool)

(declare-datatypes ((V!39851 0))(
  ( (V!39852 (val!13069 Int)) )
))
(declare-datatypes ((tuple2!16648 0))(
  ( (tuple2!16649 (_1!8335 (_ BitVec 64)) (_2!8335 V!39851)) )
))
(declare-datatypes ((List!23183 0))(
  ( (Nil!23180) (Cons!23179 (h!24388 tuple2!16648) (t!32540 List!23183)) )
))
(declare-datatypes ((ListLongMap!14617 0))(
  ( (ListLongMap!14618 (toList!7324 List!23183)) )
))
(declare-fun lt!477881 () ListLongMap!14617)

(declare-fun lt!477883 () tuple2!16648)

(declare-fun contains!6356 (ListLongMap!14617 (_ BitVec 64)) Bool)

(declare-fun +!3230 (ListLongMap!14617 tuple2!16648) ListLongMap!14617)

(assert (=> b!1076146 (= e!615108 (not (contains!6356 (+!3230 lt!477881 lt!477883) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!615112 () Bool)

(assert (=> b!1076146 e!615112))

(declare-fun res!717293 () Bool)

(assert (=> b!1076146 (=> (not res!717293) (not e!615112))))

(declare-fun zeroValueBefore!47 () V!39851)

(declare-fun lt!477885 () ListLongMap!14617)

(assert (=> b!1076146 (= res!717293 (= lt!477885 (+!3230 (+!3230 lt!477881 (tuple2!16649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!477883)))))

(declare-fun minValue!907 () V!39851)

(assert (=> b!1076146 (= lt!477883 (tuple2!16649 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12315 0))(
  ( (ValueCellFull!12315 (v!15696 V!39851)) (EmptyCell!12315) )
))
(declare-datatypes ((array!69043 0))(
  ( (array!69044 (arr!33205 (Array (_ BitVec 32) ValueCell!12315)) (size!33741 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69043)

(declare-datatypes ((array!69045 0))(
  ( (array!69046 (arr!33206 (Array (_ BitVec 32) (_ BitVec 64))) (size!33742 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69045)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39851)

(declare-fun lt!477882 () ListLongMap!14617)

(declare-fun getCurrentListMap!4193 (array!69045 array!69043 (_ BitVec 32) (_ BitVec 32) V!39851 V!39851 (_ BitVec 32) Int) ListLongMap!14617)

(assert (=> b!1076146 (= lt!477882 (getCurrentListMap!4193 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1076146 (= lt!477885 (getCurrentListMap!4193 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076147 () Bool)

(declare-fun res!717289 () Bool)

(declare-fun e!615111 () Bool)

(assert (=> b!1076147 (=> (not res!717289) (not e!615111))))

(declare-datatypes ((List!23184 0))(
  ( (Nil!23181) (Cons!23180 (h!24389 (_ BitVec 64)) (t!32541 List!23184)) )
))
(declare-fun arrayNoDuplicates!0 (array!69045 (_ BitVec 32) List!23184) Bool)

(assert (=> b!1076147 (= res!717289 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23181))))

(declare-fun b!1076148 () Bool)

(declare-fun e!615106 () Bool)

(declare-fun tp_is_empty!26037 () Bool)

(assert (=> b!1076148 (= e!615106 tp_is_empty!26037)))

(declare-fun mapIsEmpty!40798 () Bool)

(declare-fun mapRes!40798 () Bool)

(assert (=> mapIsEmpty!40798 mapRes!40798))

(declare-fun b!1076149 () Bool)

(assert (=> b!1076149 (= e!615111 (not e!615108))))

(declare-fun res!717291 () Bool)

(assert (=> b!1076149 (=> res!717291 e!615108)))

(assert (=> b!1076149 (= res!717291 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!477884 () ListLongMap!14617)

(assert (=> b!1076149 (= lt!477881 lt!477884)))

(declare-datatypes ((Unit!35423 0))(
  ( (Unit!35424) )
))
(declare-fun lt!477880 () Unit!35423)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!902 (array!69045 array!69043 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39851 V!39851 V!39851 V!39851 (_ BitVec 32) Int) Unit!35423)

(assert (=> b!1076149 (= lt!477880 (lemmaNoChangeToArrayThenSameMapNoExtras!902 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3886 (array!69045 array!69043 (_ BitVec 32) (_ BitVec 32) V!39851 V!39851 (_ BitVec 32) Int) ListLongMap!14617)

(assert (=> b!1076149 (= lt!477884 (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076149 (= lt!477881 (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076150 () Bool)

(assert (=> b!1076150 (= e!615112 (= lt!477882 (+!3230 lt!477884 lt!477883)))))

(declare-fun b!1076151 () Bool)

(declare-fun e!615107 () Bool)

(assert (=> b!1076151 (= e!615107 tp_is_empty!26037)))

(declare-fun mapNonEmpty!40798 () Bool)

(declare-fun tp!78176 () Bool)

(assert (=> mapNonEmpty!40798 (= mapRes!40798 (and tp!78176 e!615107))))

(declare-fun mapRest!40798 () (Array (_ BitVec 32) ValueCell!12315))

(declare-fun mapKey!40798 () (_ BitVec 32))

(declare-fun mapValue!40798 () ValueCell!12315)

(assert (=> mapNonEmpty!40798 (= (arr!33205 _values!955) (store mapRest!40798 mapKey!40798 mapValue!40798))))

(declare-fun b!1076152 () Bool)

(declare-fun e!615110 () Bool)

(assert (=> b!1076152 (= e!615110 (and e!615106 mapRes!40798))))

(declare-fun condMapEmpty!40798 () Bool)

(declare-fun mapDefault!40798 () ValueCell!12315)

(assert (=> b!1076152 (= condMapEmpty!40798 (= (arr!33205 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12315)) mapDefault!40798)))))

(declare-fun res!717292 () Bool)

(assert (=> start!95206 (=> (not res!717292) (not e!615111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95206 (= res!717292 (validMask!0 mask!1515))))

(assert (=> start!95206 e!615111))

(assert (=> start!95206 true))

(assert (=> start!95206 tp_is_empty!26037))

(declare-fun array_inv!25656 (array!69043) Bool)

(assert (=> start!95206 (and (array_inv!25656 _values!955) e!615110)))

(assert (=> start!95206 tp!78175))

(declare-fun array_inv!25657 (array!69045) Bool)

(assert (=> start!95206 (array_inv!25657 _keys!1163)))

(declare-fun b!1076153 () Bool)

(declare-fun res!717290 () Bool)

(assert (=> b!1076153 (=> (not res!717290) (not e!615111))))

(assert (=> b!1076153 (= res!717290 (and (= (size!33741 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33742 _keys!1163) (size!33741 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1076154 () Bool)

(declare-fun res!717288 () Bool)

(assert (=> b!1076154 (=> (not res!717288) (not e!615111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69045 (_ BitVec 32)) Bool)

(assert (=> b!1076154 (= res!717288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!95206 res!717292) b!1076153))

(assert (= (and b!1076153 res!717290) b!1076154))

(assert (= (and b!1076154 res!717288) b!1076147))

(assert (= (and b!1076147 res!717289) b!1076149))

(assert (= (and b!1076149 (not res!717291)) b!1076146))

(assert (= (and b!1076146 res!717293) b!1076150))

(assert (= (and b!1076152 condMapEmpty!40798) mapIsEmpty!40798))

(assert (= (and b!1076152 (not condMapEmpty!40798)) mapNonEmpty!40798))

(get-info :version)

(assert (= (and mapNonEmpty!40798 ((_ is ValueCellFull!12315) mapValue!40798)) b!1076151))

(assert (= (and b!1076152 ((_ is ValueCellFull!12315) mapDefault!40798)) b!1076148))

(assert (= start!95206 b!1076152))

(declare-fun m!994997 () Bool)

(assert (=> b!1076149 m!994997))

(declare-fun m!994999 () Bool)

(assert (=> b!1076149 m!994999))

(declare-fun m!995001 () Bool)

(assert (=> b!1076149 m!995001))

(declare-fun m!995003 () Bool)

(assert (=> b!1076146 m!995003))

(declare-fun m!995005 () Bool)

(assert (=> b!1076146 m!995005))

(assert (=> b!1076146 m!995003))

(declare-fun m!995007 () Bool)

(assert (=> b!1076146 m!995007))

(declare-fun m!995009 () Bool)

(assert (=> b!1076146 m!995009))

(declare-fun m!995011 () Bool)

(assert (=> b!1076146 m!995011))

(assert (=> b!1076146 m!995009))

(declare-fun m!995013 () Bool)

(assert (=> b!1076146 m!995013))

(declare-fun m!995015 () Bool)

(assert (=> mapNonEmpty!40798 m!995015))

(declare-fun m!995017 () Bool)

(assert (=> start!95206 m!995017))

(declare-fun m!995019 () Bool)

(assert (=> start!95206 m!995019))

(declare-fun m!995021 () Bool)

(assert (=> start!95206 m!995021))

(declare-fun m!995023 () Bool)

(assert (=> b!1076147 m!995023))

(declare-fun m!995025 () Bool)

(assert (=> b!1076150 m!995025))

(declare-fun m!995027 () Bool)

(assert (=> b!1076154 m!995027))

(check-sat (not b!1076147) (not b!1076150) (not b!1076154) (not mapNonEmpty!40798) (not b_next!22227) tp_is_empty!26037 (not b!1076146) b_and!35193 (not b!1076149) (not start!95206))
(check-sat b_and!35193 (not b_next!22227))
(get-model)

(declare-fun d!129671 () Bool)

(assert (=> d!129671 (= (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477906 () Unit!35423)

(declare-fun choose!1758 (array!69045 array!69043 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39851 V!39851 V!39851 V!39851 (_ BitVec 32) Int) Unit!35423)

(assert (=> d!129671 (= lt!477906 (choose!1758 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129671 (validMask!0 mask!1515)))

(assert (=> d!129671 (= (lemmaNoChangeToArrayThenSameMapNoExtras!902 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477906)))

(declare-fun bs!31697 () Bool)

(assert (= bs!31697 d!129671))

(assert (=> bs!31697 m!995001))

(assert (=> bs!31697 m!994999))

(declare-fun m!995061 () Bool)

(assert (=> bs!31697 m!995061))

(assert (=> bs!31697 m!995017))

(assert (=> b!1076149 d!129671))

(declare-fun b!1076206 () Bool)

(declare-fun e!615148 () ListLongMap!14617)

(declare-fun call!45618 () ListLongMap!14617)

(assert (=> b!1076206 (= e!615148 call!45618)))

(declare-fun b!1076207 () Bool)

(declare-fun e!615152 () Bool)

(declare-fun e!615151 () Bool)

(assert (=> b!1076207 (= e!615152 e!615151)))

(declare-fun c!108191 () Bool)

(declare-fun e!615153 () Bool)

(assert (=> b!1076207 (= c!108191 e!615153)))

(declare-fun res!717320 () Bool)

(assert (=> b!1076207 (=> (not res!717320) (not e!615153))))

(assert (=> b!1076207 (= res!717320 (bvslt #b00000000000000000000000000000000 (size!33742 _keys!1163)))))

(declare-fun lt!477926 () ListLongMap!14617)

(declare-fun e!615149 () Bool)

(declare-fun b!1076208 () Bool)

(assert (=> b!1076208 (= e!615149 (= lt!477926 (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun bm!45615 () Bool)

(assert (=> bm!45615 (= call!45618 (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1076209 () Bool)

(declare-fun lt!477924 () Unit!35423)

(declare-fun lt!477922 () Unit!35423)

(assert (=> b!1076209 (= lt!477924 lt!477922)))

(declare-fun lt!477923 () V!39851)

(declare-fun lt!477925 () (_ BitVec 64))

(declare-fun lt!477927 () (_ BitVec 64))

(declare-fun lt!477921 () ListLongMap!14617)

(assert (=> b!1076209 (not (contains!6356 (+!3230 lt!477921 (tuple2!16649 lt!477927 lt!477923)) lt!477925))))

(declare-fun addStillNotContains!270 (ListLongMap!14617 (_ BitVec 64) V!39851 (_ BitVec 64)) Unit!35423)

(assert (=> b!1076209 (= lt!477922 (addStillNotContains!270 lt!477921 lt!477927 lt!477923 lt!477925))))

(assert (=> b!1076209 (= lt!477925 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!17246 (ValueCell!12315 V!39851) V!39851)

(declare-fun dynLambda!2049 (Int (_ BitVec 64)) V!39851)

(assert (=> b!1076209 (= lt!477923 (get!17246 (select (arr!33205 _values!955) #b00000000000000000000000000000000) (dynLambda!2049 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1076209 (= lt!477927 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1076209 (= lt!477921 call!45618)))

(assert (=> b!1076209 (= e!615148 (+!3230 call!45618 (tuple2!16649 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000) (get!17246 (select (arr!33205 _values!955) #b00000000000000000000000000000000) (dynLambda!2049 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1076210 () Bool)

(declare-fun e!615150 () ListLongMap!14617)

(assert (=> b!1076210 (= e!615150 e!615148)))

(declare-fun c!108192 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1076210 (= c!108192 (validKeyInArray!0 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076211 () Bool)

(declare-fun isEmpty!960 (ListLongMap!14617) Bool)

(assert (=> b!1076211 (= e!615149 (isEmpty!960 lt!477926))))

(declare-fun b!1076212 () Bool)

(declare-fun e!615154 () Bool)

(assert (=> b!1076212 (= e!615151 e!615154)))

(assert (=> b!1076212 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33742 _keys!1163)))))

(declare-fun res!717323 () Bool)

(assert (=> b!1076212 (= res!717323 (contains!6356 lt!477926 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076212 (=> (not res!717323) (not e!615154))))

(declare-fun b!1076213 () Bool)

(assert (=> b!1076213 (= e!615153 (validKeyInArray!0 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076213 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!129673 () Bool)

(assert (=> d!129673 e!615152))

(declare-fun res!717322 () Bool)

(assert (=> d!129673 (=> (not res!717322) (not e!615152))))

(assert (=> d!129673 (= res!717322 (not (contains!6356 lt!477926 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129673 (= lt!477926 e!615150)))

(declare-fun c!108189 () Bool)

(assert (=> d!129673 (= c!108189 (bvsge #b00000000000000000000000000000000 (size!33742 _keys!1163)))))

(assert (=> d!129673 (validMask!0 mask!1515)))

(assert (=> d!129673 (= (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477926)))

(declare-fun b!1076214 () Bool)

(assert (=> b!1076214 (= e!615150 (ListLongMap!14618 Nil!23180))))

(declare-fun b!1076215 () Bool)

(assert (=> b!1076215 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33742 _keys!1163)))))

(assert (=> b!1076215 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33741 _values!955)))))

(declare-fun apply!942 (ListLongMap!14617 (_ BitVec 64)) V!39851)

(assert (=> b!1076215 (= e!615154 (= (apply!942 lt!477926 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000)) (get!17246 (select (arr!33205 _values!955) #b00000000000000000000000000000000) (dynLambda!2049 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1076216 () Bool)

(declare-fun res!717321 () Bool)

(assert (=> b!1076216 (=> (not res!717321) (not e!615152))))

(assert (=> b!1076216 (= res!717321 (not (contains!6356 lt!477926 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1076217 () Bool)

(assert (=> b!1076217 (= e!615151 e!615149)))

(declare-fun c!108190 () Bool)

(assert (=> b!1076217 (= c!108190 (bvslt #b00000000000000000000000000000000 (size!33742 _keys!1163)))))

(assert (= (and d!129673 c!108189) b!1076214))

(assert (= (and d!129673 (not c!108189)) b!1076210))

(assert (= (and b!1076210 c!108192) b!1076209))

(assert (= (and b!1076210 (not c!108192)) b!1076206))

(assert (= (or b!1076209 b!1076206) bm!45615))

(assert (= (and d!129673 res!717322) b!1076216))

(assert (= (and b!1076216 res!717321) b!1076207))

(assert (= (and b!1076207 res!717320) b!1076213))

(assert (= (and b!1076207 c!108191) b!1076212))

(assert (= (and b!1076207 (not c!108191)) b!1076217))

(assert (= (and b!1076212 res!717323) b!1076215))

(assert (= (and b!1076217 c!108190) b!1076208))

(assert (= (and b!1076217 (not c!108190)) b!1076211))

(declare-fun b_lambda!16949 () Bool)

(assert (=> (not b_lambda!16949) (not b!1076209)))

(declare-fun t!32545 () Bool)

(declare-fun tb!7179 () Bool)

(assert (=> (and start!95206 (= defaultEntry!963 defaultEntry!963) t!32545) tb!7179))

(declare-fun result!14845 () Bool)

(assert (=> tb!7179 (= result!14845 tp_is_empty!26037)))

(assert (=> b!1076209 t!32545))

(declare-fun b_and!35197 () Bool)

(assert (= b_and!35193 (and (=> t!32545 result!14845) b_and!35197)))

(declare-fun b_lambda!16951 () Bool)

(assert (=> (not b_lambda!16951) (not b!1076215)))

(assert (=> b!1076215 t!32545))

(declare-fun b_and!35199 () Bool)

(assert (= b_and!35197 (and (=> t!32545 result!14845) b_and!35199)))

(declare-fun m!995063 () Bool)

(assert (=> b!1076211 m!995063))

(declare-fun m!995065 () Bool)

(assert (=> b!1076209 m!995065))

(declare-fun m!995067 () Bool)

(assert (=> b!1076209 m!995067))

(declare-fun m!995069 () Bool)

(assert (=> b!1076209 m!995069))

(declare-fun m!995071 () Bool)

(assert (=> b!1076209 m!995071))

(declare-fun m!995073 () Bool)

(assert (=> b!1076209 m!995073))

(declare-fun m!995075 () Bool)

(assert (=> b!1076209 m!995075))

(declare-fun m!995077 () Bool)

(assert (=> b!1076209 m!995077))

(assert (=> b!1076209 m!995069))

(assert (=> b!1076209 m!995065))

(declare-fun m!995079 () Bool)

(assert (=> b!1076209 m!995079))

(assert (=> b!1076209 m!995067))

(declare-fun m!995081 () Bool)

(assert (=> d!129673 m!995081))

(assert (=> d!129673 m!995017))

(assert (=> b!1076215 m!995067))

(assert (=> b!1076215 m!995069))

(assert (=> b!1076215 m!995071))

(assert (=> b!1076215 m!995075))

(assert (=> b!1076215 m!995075))

(declare-fun m!995083 () Bool)

(assert (=> b!1076215 m!995083))

(assert (=> b!1076215 m!995069))

(assert (=> b!1076215 m!995067))

(declare-fun m!995085 () Bool)

(assert (=> b!1076208 m!995085))

(assert (=> bm!45615 m!995085))

(assert (=> b!1076212 m!995075))

(assert (=> b!1076212 m!995075))

(declare-fun m!995087 () Bool)

(assert (=> b!1076212 m!995087))

(declare-fun m!995089 () Bool)

(assert (=> b!1076216 m!995089))

(assert (=> b!1076210 m!995075))

(assert (=> b!1076210 m!995075))

(declare-fun m!995091 () Bool)

(assert (=> b!1076210 m!995091))

(assert (=> b!1076213 m!995075))

(assert (=> b!1076213 m!995075))

(assert (=> b!1076213 m!995091))

(assert (=> b!1076149 d!129673))

(declare-fun b!1076220 () Bool)

(declare-fun e!615155 () ListLongMap!14617)

(declare-fun call!45619 () ListLongMap!14617)

(assert (=> b!1076220 (= e!615155 call!45619)))

(declare-fun b!1076221 () Bool)

(declare-fun e!615159 () Bool)

(declare-fun e!615158 () Bool)

(assert (=> b!1076221 (= e!615159 e!615158)))

(declare-fun c!108195 () Bool)

(declare-fun e!615160 () Bool)

(assert (=> b!1076221 (= c!108195 e!615160)))

(declare-fun res!717324 () Bool)

(assert (=> b!1076221 (=> (not res!717324) (not e!615160))))

(assert (=> b!1076221 (= res!717324 (bvslt #b00000000000000000000000000000000 (size!33742 _keys!1163)))))

(declare-fun e!615156 () Bool)

(declare-fun b!1076222 () Bool)

(declare-fun lt!477933 () ListLongMap!14617)

(assert (=> b!1076222 (= e!615156 (= lt!477933 (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun bm!45616 () Bool)

(assert (=> bm!45616 (= call!45619 (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1076223 () Bool)

(declare-fun lt!477931 () Unit!35423)

(declare-fun lt!477929 () Unit!35423)

(assert (=> b!1076223 (= lt!477931 lt!477929)))

(declare-fun lt!477928 () ListLongMap!14617)

(declare-fun lt!477932 () (_ BitVec 64))

(declare-fun lt!477930 () V!39851)

(declare-fun lt!477934 () (_ BitVec 64))

(assert (=> b!1076223 (not (contains!6356 (+!3230 lt!477928 (tuple2!16649 lt!477934 lt!477930)) lt!477932))))

(assert (=> b!1076223 (= lt!477929 (addStillNotContains!270 lt!477928 lt!477934 lt!477930 lt!477932))))

(assert (=> b!1076223 (= lt!477932 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1076223 (= lt!477930 (get!17246 (select (arr!33205 _values!955) #b00000000000000000000000000000000) (dynLambda!2049 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1076223 (= lt!477934 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1076223 (= lt!477928 call!45619)))

(assert (=> b!1076223 (= e!615155 (+!3230 call!45619 (tuple2!16649 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000) (get!17246 (select (arr!33205 _values!955) #b00000000000000000000000000000000) (dynLambda!2049 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1076224 () Bool)

(declare-fun e!615157 () ListLongMap!14617)

(assert (=> b!1076224 (= e!615157 e!615155)))

(declare-fun c!108196 () Bool)

(assert (=> b!1076224 (= c!108196 (validKeyInArray!0 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076225 () Bool)

(assert (=> b!1076225 (= e!615156 (isEmpty!960 lt!477933))))

(declare-fun b!1076226 () Bool)

(declare-fun e!615161 () Bool)

(assert (=> b!1076226 (= e!615158 e!615161)))

(assert (=> b!1076226 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33742 _keys!1163)))))

(declare-fun res!717327 () Bool)

(assert (=> b!1076226 (= res!717327 (contains!6356 lt!477933 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076226 (=> (not res!717327) (not e!615161))))

(declare-fun b!1076227 () Bool)

(assert (=> b!1076227 (= e!615160 (validKeyInArray!0 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076227 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!129675 () Bool)

(assert (=> d!129675 e!615159))

(declare-fun res!717326 () Bool)

(assert (=> d!129675 (=> (not res!717326) (not e!615159))))

(assert (=> d!129675 (= res!717326 (not (contains!6356 lt!477933 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129675 (= lt!477933 e!615157)))

(declare-fun c!108193 () Bool)

(assert (=> d!129675 (= c!108193 (bvsge #b00000000000000000000000000000000 (size!33742 _keys!1163)))))

(assert (=> d!129675 (validMask!0 mask!1515)))

(assert (=> d!129675 (= (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477933)))

(declare-fun b!1076228 () Bool)

(assert (=> b!1076228 (= e!615157 (ListLongMap!14618 Nil!23180))))

(declare-fun b!1076229 () Bool)

(assert (=> b!1076229 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33742 _keys!1163)))))

(assert (=> b!1076229 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33741 _values!955)))))

(assert (=> b!1076229 (= e!615161 (= (apply!942 lt!477933 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000)) (get!17246 (select (arr!33205 _values!955) #b00000000000000000000000000000000) (dynLambda!2049 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1076230 () Bool)

(declare-fun res!717325 () Bool)

(assert (=> b!1076230 (=> (not res!717325) (not e!615159))))

(assert (=> b!1076230 (= res!717325 (not (contains!6356 lt!477933 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1076231 () Bool)

(assert (=> b!1076231 (= e!615158 e!615156)))

(declare-fun c!108194 () Bool)

(assert (=> b!1076231 (= c!108194 (bvslt #b00000000000000000000000000000000 (size!33742 _keys!1163)))))

(assert (= (and d!129675 c!108193) b!1076228))

(assert (= (and d!129675 (not c!108193)) b!1076224))

(assert (= (and b!1076224 c!108196) b!1076223))

(assert (= (and b!1076224 (not c!108196)) b!1076220))

(assert (= (or b!1076223 b!1076220) bm!45616))

(assert (= (and d!129675 res!717326) b!1076230))

(assert (= (and b!1076230 res!717325) b!1076221))

(assert (= (and b!1076221 res!717324) b!1076227))

(assert (= (and b!1076221 c!108195) b!1076226))

(assert (= (and b!1076221 (not c!108195)) b!1076231))

(assert (= (and b!1076226 res!717327) b!1076229))

(assert (= (and b!1076231 c!108194) b!1076222))

(assert (= (and b!1076231 (not c!108194)) b!1076225))

(declare-fun b_lambda!16953 () Bool)

(assert (=> (not b_lambda!16953) (not b!1076223)))

(assert (=> b!1076223 t!32545))

(declare-fun b_and!35201 () Bool)

(assert (= b_and!35199 (and (=> t!32545 result!14845) b_and!35201)))

(declare-fun b_lambda!16955 () Bool)

(assert (=> (not b_lambda!16955) (not b!1076229)))

(assert (=> b!1076229 t!32545))

(declare-fun b_and!35203 () Bool)

(assert (= b_and!35201 (and (=> t!32545 result!14845) b_and!35203)))

(declare-fun m!995093 () Bool)

(assert (=> b!1076225 m!995093))

(declare-fun m!995095 () Bool)

(assert (=> b!1076223 m!995095))

(assert (=> b!1076223 m!995067))

(assert (=> b!1076223 m!995069))

(assert (=> b!1076223 m!995071))

(declare-fun m!995097 () Bool)

(assert (=> b!1076223 m!995097))

(assert (=> b!1076223 m!995075))

(declare-fun m!995099 () Bool)

(assert (=> b!1076223 m!995099))

(assert (=> b!1076223 m!995069))

(assert (=> b!1076223 m!995095))

(declare-fun m!995101 () Bool)

(assert (=> b!1076223 m!995101))

(assert (=> b!1076223 m!995067))

(declare-fun m!995103 () Bool)

(assert (=> d!129675 m!995103))

(assert (=> d!129675 m!995017))

(assert (=> b!1076229 m!995067))

(assert (=> b!1076229 m!995069))

(assert (=> b!1076229 m!995071))

(assert (=> b!1076229 m!995075))

(assert (=> b!1076229 m!995075))

(declare-fun m!995105 () Bool)

(assert (=> b!1076229 m!995105))

(assert (=> b!1076229 m!995069))

(assert (=> b!1076229 m!995067))

(declare-fun m!995107 () Bool)

(assert (=> b!1076222 m!995107))

(assert (=> bm!45616 m!995107))

(assert (=> b!1076226 m!995075))

(assert (=> b!1076226 m!995075))

(declare-fun m!995109 () Bool)

(assert (=> b!1076226 m!995109))

(declare-fun m!995111 () Bool)

(assert (=> b!1076230 m!995111))

(assert (=> b!1076224 m!995075))

(assert (=> b!1076224 m!995075))

(assert (=> b!1076224 m!995091))

(assert (=> b!1076227 m!995075))

(assert (=> b!1076227 m!995075))

(assert (=> b!1076227 m!995091))

(assert (=> b!1076149 d!129675))

(declare-fun bm!45619 () Bool)

(declare-fun call!45622 () Bool)

(assert (=> bm!45619 (= call!45622 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1076240 () Bool)

(declare-fun e!615170 () Bool)

(declare-fun e!615169 () Bool)

(assert (=> b!1076240 (= e!615170 e!615169)))

(declare-fun lt!477941 () (_ BitVec 64))

(assert (=> b!1076240 (= lt!477941 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477942 () Unit!35423)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69045 (_ BitVec 64) (_ BitVec 32)) Unit!35423)

(assert (=> b!1076240 (= lt!477942 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!477941 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1076240 (arrayContainsKey!0 _keys!1163 lt!477941 #b00000000000000000000000000000000)))

(declare-fun lt!477943 () Unit!35423)

(assert (=> b!1076240 (= lt!477943 lt!477942)))

(declare-fun res!717333 () Bool)

(declare-datatypes ((SeekEntryResult!9895 0))(
  ( (MissingZero!9895 (index!41951 (_ BitVec 32))) (Found!9895 (index!41952 (_ BitVec 32))) (Intermediate!9895 (undefined!10707 Bool) (index!41953 (_ BitVec 32)) (x!96442 (_ BitVec 32))) (Undefined!9895) (MissingVacant!9895 (index!41954 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69045 (_ BitVec 32)) SeekEntryResult!9895)

(assert (=> b!1076240 (= res!717333 (= (seekEntryOrOpen!0 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9895 #b00000000000000000000000000000000)))))

(assert (=> b!1076240 (=> (not res!717333) (not e!615169))))

(declare-fun b!1076241 () Bool)

(declare-fun e!615168 () Bool)

(assert (=> b!1076241 (= e!615168 e!615170)))

(declare-fun c!108199 () Bool)

(assert (=> b!1076241 (= c!108199 (validKeyInArray!0 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076242 () Bool)

(assert (=> b!1076242 (= e!615169 call!45622)))

(declare-fun d!129677 () Bool)

(declare-fun res!717332 () Bool)

(assert (=> d!129677 (=> res!717332 e!615168)))

(assert (=> d!129677 (= res!717332 (bvsge #b00000000000000000000000000000000 (size!33742 _keys!1163)))))

(assert (=> d!129677 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!615168)))

(declare-fun b!1076243 () Bool)

(assert (=> b!1076243 (= e!615170 call!45622)))

(assert (= (and d!129677 (not res!717332)) b!1076241))

(assert (= (and b!1076241 c!108199) b!1076240))

(assert (= (and b!1076241 (not c!108199)) b!1076243))

(assert (= (and b!1076240 res!717333) b!1076242))

(assert (= (or b!1076242 b!1076243) bm!45619))

(declare-fun m!995113 () Bool)

(assert (=> bm!45619 m!995113))

(assert (=> b!1076240 m!995075))

(declare-fun m!995115 () Bool)

(assert (=> b!1076240 m!995115))

(declare-fun m!995117 () Bool)

(assert (=> b!1076240 m!995117))

(assert (=> b!1076240 m!995075))

(declare-fun m!995119 () Bool)

(assert (=> b!1076240 m!995119))

(assert (=> b!1076241 m!995075))

(assert (=> b!1076241 m!995075))

(assert (=> b!1076241 m!995091))

(assert (=> b!1076154 d!129677))

(declare-fun d!129679 () Bool)

(declare-fun e!615173 () Bool)

(assert (=> d!129679 e!615173))

(declare-fun res!717339 () Bool)

(assert (=> d!129679 (=> (not res!717339) (not e!615173))))

(declare-fun lt!477952 () ListLongMap!14617)

(assert (=> d!129679 (= res!717339 (contains!6356 lt!477952 (_1!8335 lt!477883)))))

(declare-fun lt!477953 () List!23183)

(assert (=> d!129679 (= lt!477952 (ListLongMap!14618 lt!477953))))

(declare-fun lt!477954 () Unit!35423)

(declare-fun lt!477955 () Unit!35423)

(assert (=> d!129679 (= lt!477954 lt!477955)))

(declare-datatypes ((Option!665 0))(
  ( (Some!664 (v!15698 V!39851)) (None!663) )
))
(declare-fun getValueByKey!614 (List!23183 (_ BitVec 64)) Option!665)

(assert (=> d!129679 (= (getValueByKey!614 lt!477953 (_1!8335 lt!477883)) (Some!664 (_2!8335 lt!477883)))))

(declare-fun lemmaContainsTupThenGetReturnValue!291 (List!23183 (_ BitVec 64) V!39851) Unit!35423)

(assert (=> d!129679 (= lt!477955 (lemmaContainsTupThenGetReturnValue!291 lt!477953 (_1!8335 lt!477883) (_2!8335 lt!477883)))))

(declare-fun insertStrictlySorted!384 (List!23183 (_ BitVec 64) V!39851) List!23183)

(assert (=> d!129679 (= lt!477953 (insertStrictlySorted!384 (toList!7324 lt!477884) (_1!8335 lt!477883) (_2!8335 lt!477883)))))

(assert (=> d!129679 (= (+!3230 lt!477884 lt!477883) lt!477952)))

(declare-fun b!1076248 () Bool)

(declare-fun res!717338 () Bool)

(assert (=> b!1076248 (=> (not res!717338) (not e!615173))))

(assert (=> b!1076248 (= res!717338 (= (getValueByKey!614 (toList!7324 lt!477952) (_1!8335 lt!477883)) (Some!664 (_2!8335 lt!477883))))))

(declare-fun b!1076249 () Bool)

(declare-fun contains!6358 (List!23183 tuple2!16648) Bool)

(assert (=> b!1076249 (= e!615173 (contains!6358 (toList!7324 lt!477952) lt!477883))))

(assert (= (and d!129679 res!717339) b!1076248))

(assert (= (and b!1076248 res!717338) b!1076249))

(declare-fun m!995121 () Bool)

(assert (=> d!129679 m!995121))

(declare-fun m!995123 () Bool)

(assert (=> d!129679 m!995123))

(declare-fun m!995125 () Bool)

(assert (=> d!129679 m!995125))

(declare-fun m!995127 () Bool)

(assert (=> d!129679 m!995127))

(declare-fun m!995129 () Bool)

(assert (=> b!1076248 m!995129))

(declare-fun m!995131 () Bool)

(assert (=> b!1076249 m!995131))

(assert (=> b!1076150 d!129679))

(declare-fun d!129681 () Bool)

(declare-fun e!615174 () Bool)

(assert (=> d!129681 e!615174))

(declare-fun res!717341 () Bool)

(assert (=> d!129681 (=> (not res!717341) (not e!615174))))

(declare-fun lt!477956 () ListLongMap!14617)

(assert (=> d!129681 (= res!717341 (contains!6356 lt!477956 (_1!8335 (tuple2!16649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!477957 () List!23183)

(assert (=> d!129681 (= lt!477956 (ListLongMap!14618 lt!477957))))

(declare-fun lt!477958 () Unit!35423)

(declare-fun lt!477959 () Unit!35423)

(assert (=> d!129681 (= lt!477958 lt!477959)))

(assert (=> d!129681 (= (getValueByKey!614 lt!477957 (_1!8335 (tuple2!16649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!664 (_2!8335 (tuple2!16649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129681 (= lt!477959 (lemmaContainsTupThenGetReturnValue!291 lt!477957 (_1!8335 (tuple2!16649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8335 (tuple2!16649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129681 (= lt!477957 (insertStrictlySorted!384 (toList!7324 lt!477881) (_1!8335 (tuple2!16649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8335 (tuple2!16649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129681 (= (+!3230 lt!477881 (tuple2!16649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!477956)))

(declare-fun b!1076250 () Bool)

(declare-fun res!717340 () Bool)

(assert (=> b!1076250 (=> (not res!717340) (not e!615174))))

(assert (=> b!1076250 (= res!717340 (= (getValueByKey!614 (toList!7324 lt!477956) (_1!8335 (tuple2!16649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!664 (_2!8335 (tuple2!16649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1076251 () Bool)

(assert (=> b!1076251 (= e!615174 (contains!6358 (toList!7324 lt!477956) (tuple2!16649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!129681 res!717341) b!1076250))

(assert (= (and b!1076250 res!717340) b!1076251))

(declare-fun m!995133 () Bool)

(assert (=> d!129681 m!995133))

(declare-fun m!995135 () Bool)

(assert (=> d!129681 m!995135))

(declare-fun m!995137 () Bool)

(assert (=> d!129681 m!995137))

(declare-fun m!995139 () Bool)

(assert (=> d!129681 m!995139))

(declare-fun m!995141 () Bool)

(assert (=> b!1076250 m!995141))

(declare-fun m!995143 () Bool)

(assert (=> b!1076251 m!995143))

(assert (=> b!1076146 d!129681))

(declare-fun b!1076294 () Bool)

(declare-fun e!615211 () ListLongMap!14617)

(declare-fun call!45637 () ListLongMap!14617)

(assert (=> b!1076294 (= e!615211 (+!3230 call!45637 (tuple2!16649 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45634 () Bool)

(declare-fun call!45639 () Bool)

(declare-fun lt!478018 () ListLongMap!14617)

(assert (=> bm!45634 (= call!45639 (contains!6356 lt!478018 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076295 () Bool)

(declare-fun res!717364 () Bool)

(declare-fun e!615212 () Bool)

(assert (=> b!1076295 (=> (not res!717364) (not e!615212))))

(declare-fun e!615213 () Bool)

(assert (=> b!1076295 (= res!717364 e!615213)))

(declare-fun res!717362 () Bool)

(assert (=> b!1076295 (=> res!717362 e!615213)))

(declare-fun e!615206 () Bool)

(assert (=> b!1076295 (= res!717362 (not e!615206))))

(declare-fun res!717367 () Bool)

(assert (=> b!1076295 (=> (not res!717367) (not e!615206))))

(assert (=> b!1076295 (= res!717367 (bvslt #b00000000000000000000000000000000 (size!33742 _keys!1163)))))

(declare-fun b!1076296 () Bool)

(declare-fun e!615210 () ListLongMap!14617)

(assert (=> b!1076296 (= e!615211 e!615210)))

(declare-fun c!108215 () Bool)

(assert (=> b!1076296 (= c!108215 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1076297 () Bool)

(declare-fun e!615205 () Bool)

(declare-fun e!615201 () Bool)

(assert (=> b!1076297 (= e!615205 e!615201)))

(declare-fun res!717360 () Bool)

(assert (=> b!1076297 (= res!717360 call!45639)))

(assert (=> b!1076297 (=> (not res!717360) (not e!615201))))

(declare-fun b!1076298 () Bool)

(declare-fun e!615207 () Unit!35423)

(declare-fun Unit!35427 () Unit!35423)

(assert (=> b!1076298 (= e!615207 Unit!35427)))

(declare-fun b!1076299 () Bool)

(declare-fun lt!478007 () Unit!35423)

(assert (=> b!1076299 (= e!615207 lt!478007)))

(declare-fun lt!478021 () ListLongMap!14617)

(assert (=> b!1076299 (= lt!478021 (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478008 () (_ BitVec 64))

(assert (=> b!1076299 (= lt!478008 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478010 () (_ BitVec 64))

(assert (=> b!1076299 (= lt!478010 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478015 () Unit!35423)

(declare-fun addStillContains!655 (ListLongMap!14617 (_ BitVec 64) V!39851 (_ BitVec 64)) Unit!35423)

(assert (=> b!1076299 (= lt!478015 (addStillContains!655 lt!478021 lt!478008 zeroValueBefore!47 lt!478010))))

(assert (=> b!1076299 (contains!6356 (+!3230 lt!478021 (tuple2!16649 lt!478008 zeroValueBefore!47)) lt!478010)))

(declare-fun lt!478025 () Unit!35423)

(assert (=> b!1076299 (= lt!478025 lt!478015)))

(declare-fun lt!478016 () ListLongMap!14617)

(assert (=> b!1076299 (= lt!478016 (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478013 () (_ BitVec 64))

(assert (=> b!1076299 (= lt!478013 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478017 () (_ BitVec 64))

(assert (=> b!1076299 (= lt!478017 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478022 () Unit!35423)

(declare-fun addApplyDifferent!515 (ListLongMap!14617 (_ BitVec 64) V!39851 (_ BitVec 64)) Unit!35423)

(assert (=> b!1076299 (= lt!478022 (addApplyDifferent!515 lt!478016 lt!478013 minValue!907 lt!478017))))

(assert (=> b!1076299 (= (apply!942 (+!3230 lt!478016 (tuple2!16649 lt!478013 minValue!907)) lt!478017) (apply!942 lt!478016 lt!478017))))

(declare-fun lt!478024 () Unit!35423)

(assert (=> b!1076299 (= lt!478024 lt!478022)))

(declare-fun lt!478011 () ListLongMap!14617)

(assert (=> b!1076299 (= lt!478011 (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478014 () (_ BitVec 64))

(assert (=> b!1076299 (= lt!478014 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478020 () (_ BitVec 64))

(assert (=> b!1076299 (= lt!478020 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478004 () Unit!35423)

(assert (=> b!1076299 (= lt!478004 (addApplyDifferent!515 lt!478011 lt!478014 zeroValueBefore!47 lt!478020))))

(assert (=> b!1076299 (= (apply!942 (+!3230 lt!478011 (tuple2!16649 lt!478014 zeroValueBefore!47)) lt!478020) (apply!942 lt!478011 lt!478020))))

(declare-fun lt!478009 () Unit!35423)

(assert (=> b!1076299 (= lt!478009 lt!478004)))

(declare-fun lt!478023 () ListLongMap!14617)

(assert (=> b!1076299 (= lt!478023 (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478006 () (_ BitVec 64))

(assert (=> b!1076299 (= lt!478006 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478019 () (_ BitVec 64))

(assert (=> b!1076299 (= lt!478019 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1076299 (= lt!478007 (addApplyDifferent!515 lt!478023 lt!478006 minValue!907 lt!478019))))

(assert (=> b!1076299 (= (apply!942 (+!3230 lt!478023 (tuple2!16649 lt!478006 minValue!907)) lt!478019) (apply!942 lt!478023 lt!478019))))

(declare-fun call!45640 () ListLongMap!14617)

(declare-fun bm!45635 () Bool)

(assert (=> bm!45635 (= call!45640 (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076300 () Bool)

(assert (=> b!1076300 (= e!615205 (not call!45639))))

(declare-fun b!1076301 () Bool)

(declare-fun e!615204 () Bool)

(assert (=> b!1076301 (= e!615213 e!615204)))

(declare-fun res!717361 () Bool)

(assert (=> b!1076301 (=> (not res!717361) (not e!615204))))

(assert (=> b!1076301 (= res!717361 (contains!6356 lt!478018 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076301 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33742 _keys!1163)))))

(declare-fun bm!45636 () Bool)

(declare-fun call!45638 () ListLongMap!14617)

(declare-fun call!45641 () ListLongMap!14617)

(assert (=> bm!45636 (= call!45638 call!45641)))

(declare-fun b!1076303 () Bool)

(assert (=> b!1076303 (= e!615206 (validKeyInArray!0 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076304 () Bool)

(declare-fun res!717368 () Bool)

(assert (=> b!1076304 (=> (not res!717368) (not e!615212))))

(assert (=> b!1076304 (= res!717368 e!615205)))

(declare-fun c!108214 () Bool)

(assert (=> b!1076304 (= c!108214 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1076305 () Bool)

(assert (=> b!1076305 (= e!615204 (= (apply!942 lt!478018 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000)) (get!17246 (select (arr!33205 _values!955) #b00000000000000000000000000000000) (dynLambda!2049 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1076305 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33741 _values!955)))))

(assert (=> b!1076305 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33742 _keys!1163)))))

(declare-fun b!1076306 () Bool)

(declare-fun e!615202 () ListLongMap!14617)

(assert (=> b!1076306 (= e!615202 call!45638)))

(declare-fun b!1076307 () Bool)

(assert (=> b!1076307 (= e!615201 (= (apply!942 lt!478018 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1076308 () Bool)

(declare-fun call!45643 () ListLongMap!14617)

(assert (=> b!1076308 (= e!615210 call!45643)))

(declare-fun b!1076309 () Bool)

(declare-fun e!615209 () Bool)

(assert (=> b!1076309 (= e!615212 e!615209)))

(declare-fun c!108217 () Bool)

(assert (=> b!1076309 (= c!108217 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1076310 () Bool)

(assert (=> b!1076310 (= e!615202 call!45643)))

(declare-fun b!1076311 () Bool)

(declare-fun e!615208 () Bool)

(assert (=> b!1076311 (= e!615209 e!615208)))

(declare-fun res!717365 () Bool)

(declare-fun call!45642 () Bool)

(assert (=> b!1076311 (= res!717365 call!45642)))

(assert (=> b!1076311 (=> (not res!717365) (not e!615208))))

(declare-fun bm!45637 () Bool)

(declare-fun c!108213 () Bool)

(assert (=> bm!45637 (= call!45637 (+!3230 (ite c!108213 call!45640 (ite c!108215 call!45641 call!45638)) (ite (or c!108213 c!108215) (tuple2!16649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16649 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun bm!45638 () Bool)

(assert (=> bm!45638 (= call!45641 call!45640)))

(declare-fun bm!45639 () Bool)

(assert (=> bm!45639 (= call!45643 call!45637)))

(declare-fun b!1076312 () Bool)

(declare-fun c!108212 () Bool)

(assert (=> b!1076312 (= c!108212 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1076312 (= e!615210 e!615202)))

(declare-fun bm!45640 () Bool)

(assert (=> bm!45640 (= call!45642 (contains!6356 lt!478018 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076313 () Bool)

(assert (=> b!1076313 (= e!615209 (not call!45642))))

(declare-fun b!1076314 () Bool)

(assert (=> b!1076314 (= e!615208 (= (apply!942 lt!478018 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun d!129683 () Bool)

(assert (=> d!129683 e!615212))

(declare-fun res!717366 () Bool)

(assert (=> d!129683 (=> (not res!717366) (not e!615212))))

(assert (=> d!129683 (= res!717366 (or (bvsge #b00000000000000000000000000000000 (size!33742 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33742 _keys!1163)))))))

(declare-fun lt!478012 () ListLongMap!14617)

(assert (=> d!129683 (= lt!478018 lt!478012)))

(declare-fun lt!478005 () Unit!35423)

(assert (=> d!129683 (= lt!478005 e!615207)))

(declare-fun c!108216 () Bool)

(declare-fun e!615203 () Bool)

(assert (=> d!129683 (= c!108216 e!615203)))

(declare-fun res!717363 () Bool)

(assert (=> d!129683 (=> (not res!717363) (not e!615203))))

(assert (=> d!129683 (= res!717363 (bvslt #b00000000000000000000000000000000 (size!33742 _keys!1163)))))

(assert (=> d!129683 (= lt!478012 e!615211)))

(assert (=> d!129683 (= c!108213 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129683 (validMask!0 mask!1515)))

(assert (=> d!129683 (= (getCurrentListMap!4193 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!478018)))

(declare-fun b!1076302 () Bool)

(assert (=> b!1076302 (= e!615203 (validKeyInArray!0 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129683 c!108213) b!1076294))

(assert (= (and d!129683 (not c!108213)) b!1076296))

(assert (= (and b!1076296 c!108215) b!1076308))

(assert (= (and b!1076296 (not c!108215)) b!1076312))

(assert (= (and b!1076312 c!108212) b!1076310))

(assert (= (and b!1076312 (not c!108212)) b!1076306))

(assert (= (or b!1076310 b!1076306) bm!45636))

(assert (= (or b!1076308 bm!45636) bm!45638))

(assert (= (or b!1076308 b!1076310) bm!45639))

(assert (= (or b!1076294 bm!45638) bm!45635))

(assert (= (or b!1076294 bm!45639) bm!45637))

(assert (= (and d!129683 res!717363) b!1076302))

(assert (= (and d!129683 c!108216) b!1076299))

(assert (= (and d!129683 (not c!108216)) b!1076298))

(assert (= (and d!129683 res!717366) b!1076295))

(assert (= (and b!1076295 res!717367) b!1076303))

(assert (= (and b!1076295 (not res!717362)) b!1076301))

(assert (= (and b!1076301 res!717361) b!1076305))

(assert (= (and b!1076295 res!717364) b!1076304))

(assert (= (and b!1076304 c!108214) b!1076297))

(assert (= (and b!1076304 (not c!108214)) b!1076300))

(assert (= (and b!1076297 res!717360) b!1076307))

(assert (= (or b!1076297 b!1076300) bm!45634))

(assert (= (and b!1076304 res!717368) b!1076309))

(assert (= (and b!1076309 c!108217) b!1076311))

(assert (= (and b!1076309 (not c!108217)) b!1076313))

(assert (= (and b!1076311 res!717365) b!1076314))

(assert (= (or b!1076311 b!1076313) bm!45640))

(declare-fun b_lambda!16957 () Bool)

(assert (=> (not b_lambda!16957) (not b!1076305)))

(assert (=> b!1076305 t!32545))

(declare-fun b_and!35205 () Bool)

(assert (= b_and!35203 (and (=> t!32545 result!14845) b_and!35205)))

(assert (=> b!1076303 m!995075))

(assert (=> b!1076303 m!995075))

(assert (=> b!1076303 m!995091))

(declare-fun m!995145 () Bool)

(assert (=> b!1076299 m!995145))

(declare-fun m!995147 () Bool)

(assert (=> b!1076299 m!995147))

(declare-fun m!995149 () Bool)

(assert (=> b!1076299 m!995149))

(declare-fun m!995151 () Bool)

(assert (=> b!1076299 m!995151))

(declare-fun m!995153 () Bool)

(assert (=> b!1076299 m!995153))

(declare-fun m!995155 () Bool)

(assert (=> b!1076299 m!995155))

(declare-fun m!995157 () Bool)

(assert (=> b!1076299 m!995157))

(assert (=> b!1076299 m!995145))

(declare-fun m!995159 () Bool)

(assert (=> b!1076299 m!995159))

(assert (=> b!1076299 m!995075))

(assert (=> b!1076299 m!995149))

(declare-fun m!995161 () Bool)

(assert (=> b!1076299 m!995161))

(declare-fun m!995163 () Bool)

(assert (=> b!1076299 m!995163))

(assert (=> b!1076299 m!995157))

(declare-fun m!995165 () Bool)

(assert (=> b!1076299 m!995165))

(declare-fun m!995167 () Bool)

(assert (=> b!1076299 m!995167))

(declare-fun m!995169 () Bool)

(assert (=> b!1076299 m!995169))

(assert (=> b!1076299 m!995153))

(declare-fun m!995171 () Bool)

(assert (=> b!1076299 m!995171))

(assert (=> b!1076299 m!995001))

(declare-fun m!995173 () Bool)

(assert (=> b!1076299 m!995173))

(declare-fun m!995175 () Bool)

(assert (=> b!1076307 m!995175))

(assert (=> b!1076301 m!995075))

(assert (=> b!1076301 m!995075))

(declare-fun m!995177 () Bool)

(assert (=> b!1076301 m!995177))

(declare-fun m!995179 () Bool)

(assert (=> bm!45640 m!995179))

(assert (=> b!1076302 m!995075))

(assert (=> b!1076302 m!995075))

(assert (=> b!1076302 m!995091))

(declare-fun m!995181 () Bool)

(assert (=> bm!45637 m!995181))

(declare-fun m!995183 () Bool)

(assert (=> b!1076314 m!995183))

(assert (=> d!129683 m!995017))

(assert (=> b!1076305 m!995067))

(assert (=> b!1076305 m!995075))

(declare-fun m!995185 () Bool)

(assert (=> b!1076305 m!995185))

(assert (=> b!1076305 m!995069))

(assert (=> b!1076305 m!995067))

(assert (=> b!1076305 m!995069))

(assert (=> b!1076305 m!995071))

(assert (=> b!1076305 m!995075))

(declare-fun m!995187 () Bool)

(assert (=> b!1076294 m!995187))

(declare-fun m!995189 () Bool)

(assert (=> bm!45634 m!995189))

(assert (=> bm!45635 m!995001))

(assert (=> b!1076146 d!129683))

(declare-fun d!129685 () Bool)

(declare-fun e!615214 () Bool)

(assert (=> d!129685 e!615214))

(declare-fun res!717370 () Bool)

(assert (=> d!129685 (=> (not res!717370) (not e!615214))))

(declare-fun lt!478026 () ListLongMap!14617)

(assert (=> d!129685 (= res!717370 (contains!6356 lt!478026 (_1!8335 lt!477883)))))

(declare-fun lt!478027 () List!23183)

(assert (=> d!129685 (= lt!478026 (ListLongMap!14618 lt!478027))))

(declare-fun lt!478028 () Unit!35423)

(declare-fun lt!478029 () Unit!35423)

(assert (=> d!129685 (= lt!478028 lt!478029)))

(assert (=> d!129685 (= (getValueByKey!614 lt!478027 (_1!8335 lt!477883)) (Some!664 (_2!8335 lt!477883)))))

(assert (=> d!129685 (= lt!478029 (lemmaContainsTupThenGetReturnValue!291 lt!478027 (_1!8335 lt!477883) (_2!8335 lt!477883)))))

(assert (=> d!129685 (= lt!478027 (insertStrictlySorted!384 (toList!7324 (+!3230 lt!477881 (tuple2!16649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (_1!8335 lt!477883) (_2!8335 lt!477883)))))

(assert (=> d!129685 (= (+!3230 (+!3230 lt!477881 (tuple2!16649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!477883) lt!478026)))

(declare-fun b!1076315 () Bool)

(declare-fun res!717369 () Bool)

(assert (=> b!1076315 (=> (not res!717369) (not e!615214))))

(assert (=> b!1076315 (= res!717369 (= (getValueByKey!614 (toList!7324 lt!478026) (_1!8335 lt!477883)) (Some!664 (_2!8335 lt!477883))))))

(declare-fun b!1076316 () Bool)

(assert (=> b!1076316 (= e!615214 (contains!6358 (toList!7324 lt!478026) lt!477883))))

(assert (= (and d!129685 res!717370) b!1076315))

(assert (= (and b!1076315 res!717369) b!1076316))

(declare-fun m!995191 () Bool)

(assert (=> d!129685 m!995191))

(declare-fun m!995193 () Bool)

(assert (=> d!129685 m!995193))

(declare-fun m!995195 () Bool)

(assert (=> d!129685 m!995195))

(declare-fun m!995197 () Bool)

(assert (=> d!129685 m!995197))

(declare-fun m!995199 () Bool)

(assert (=> b!1076315 m!995199))

(declare-fun m!995201 () Bool)

(assert (=> b!1076316 m!995201))

(assert (=> b!1076146 d!129685))

(declare-fun d!129687 () Bool)

(declare-fun e!615215 () Bool)

(assert (=> d!129687 e!615215))

(declare-fun res!717372 () Bool)

(assert (=> d!129687 (=> (not res!717372) (not e!615215))))

(declare-fun lt!478030 () ListLongMap!14617)

(assert (=> d!129687 (= res!717372 (contains!6356 lt!478030 (_1!8335 lt!477883)))))

(declare-fun lt!478031 () List!23183)

(assert (=> d!129687 (= lt!478030 (ListLongMap!14618 lt!478031))))

(declare-fun lt!478032 () Unit!35423)

(declare-fun lt!478033 () Unit!35423)

(assert (=> d!129687 (= lt!478032 lt!478033)))

(assert (=> d!129687 (= (getValueByKey!614 lt!478031 (_1!8335 lt!477883)) (Some!664 (_2!8335 lt!477883)))))

(assert (=> d!129687 (= lt!478033 (lemmaContainsTupThenGetReturnValue!291 lt!478031 (_1!8335 lt!477883) (_2!8335 lt!477883)))))

(assert (=> d!129687 (= lt!478031 (insertStrictlySorted!384 (toList!7324 lt!477881) (_1!8335 lt!477883) (_2!8335 lt!477883)))))

(assert (=> d!129687 (= (+!3230 lt!477881 lt!477883) lt!478030)))

(declare-fun b!1076317 () Bool)

(declare-fun res!717371 () Bool)

(assert (=> b!1076317 (=> (not res!717371) (not e!615215))))

(assert (=> b!1076317 (= res!717371 (= (getValueByKey!614 (toList!7324 lt!478030) (_1!8335 lt!477883)) (Some!664 (_2!8335 lt!477883))))))

(declare-fun b!1076318 () Bool)

(assert (=> b!1076318 (= e!615215 (contains!6358 (toList!7324 lt!478030) lt!477883))))

(assert (= (and d!129687 res!717372) b!1076317))

(assert (= (and b!1076317 res!717371) b!1076318))

(declare-fun m!995203 () Bool)

(assert (=> d!129687 m!995203))

(declare-fun m!995205 () Bool)

(assert (=> d!129687 m!995205))

(declare-fun m!995207 () Bool)

(assert (=> d!129687 m!995207))

(declare-fun m!995209 () Bool)

(assert (=> d!129687 m!995209))

(declare-fun m!995211 () Bool)

(assert (=> b!1076317 m!995211))

(declare-fun m!995213 () Bool)

(assert (=> b!1076318 m!995213))

(assert (=> b!1076146 d!129687))

(declare-fun d!129689 () Bool)

(declare-fun e!615220 () Bool)

(assert (=> d!129689 e!615220))

(declare-fun res!717375 () Bool)

(assert (=> d!129689 (=> res!717375 e!615220)))

(declare-fun lt!478043 () Bool)

(assert (=> d!129689 (= res!717375 (not lt!478043))))

(declare-fun lt!478045 () Bool)

(assert (=> d!129689 (= lt!478043 lt!478045)))

(declare-fun lt!478044 () Unit!35423)

(declare-fun e!615221 () Unit!35423)

(assert (=> d!129689 (= lt!478044 e!615221)))

(declare-fun c!108220 () Bool)

(assert (=> d!129689 (= c!108220 lt!478045)))

(declare-fun containsKey!581 (List!23183 (_ BitVec 64)) Bool)

(assert (=> d!129689 (= lt!478045 (containsKey!581 (toList!7324 (+!3230 lt!477881 lt!477883)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129689 (= (contains!6356 (+!3230 lt!477881 lt!477883) #b0000000000000000000000000000000000000000000000000000000000000000) lt!478043)))

(declare-fun b!1076325 () Bool)

(declare-fun lt!478042 () Unit!35423)

(assert (=> b!1076325 (= e!615221 lt!478042)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!414 (List!23183 (_ BitVec 64)) Unit!35423)

(assert (=> b!1076325 (= lt!478042 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!7324 (+!3230 lt!477881 lt!477883)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!453 (Option!665) Bool)

(assert (=> b!1076325 (isDefined!453 (getValueByKey!614 (toList!7324 (+!3230 lt!477881 lt!477883)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076326 () Bool)

(declare-fun Unit!35428 () Unit!35423)

(assert (=> b!1076326 (= e!615221 Unit!35428)))

(declare-fun b!1076327 () Bool)

(assert (=> b!1076327 (= e!615220 (isDefined!453 (getValueByKey!614 (toList!7324 (+!3230 lt!477881 lt!477883)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129689 c!108220) b!1076325))

(assert (= (and d!129689 (not c!108220)) b!1076326))

(assert (= (and d!129689 (not res!717375)) b!1076327))

(declare-fun m!995215 () Bool)

(assert (=> d!129689 m!995215))

(declare-fun m!995217 () Bool)

(assert (=> b!1076325 m!995217))

(declare-fun m!995219 () Bool)

(assert (=> b!1076325 m!995219))

(assert (=> b!1076325 m!995219))

(declare-fun m!995221 () Bool)

(assert (=> b!1076325 m!995221))

(assert (=> b!1076327 m!995219))

(assert (=> b!1076327 m!995219))

(assert (=> b!1076327 m!995221))

(assert (=> b!1076146 d!129689))

(declare-fun b!1076328 () Bool)

(declare-fun e!615232 () ListLongMap!14617)

(declare-fun call!45644 () ListLongMap!14617)

(assert (=> b!1076328 (= e!615232 (+!3230 call!45644 (tuple2!16649 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45641 () Bool)

(declare-fun call!45646 () Bool)

(declare-fun lt!478060 () ListLongMap!14617)

(assert (=> bm!45641 (= call!45646 (contains!6356 lt!478060 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076329 () Bool)

(declare-fun res!717380 () Bool)

(declare-fun e!615233 () Bool)

(assert (=> b!1076329 (=> (not res!717380) (not e!615233))))

(declare-fun e!615234 () Bool)

(assert (=> b!1076329 (= res!717380 e!615234)))

(declare-fun res!717378 () Bool)

(assert (=> b!1076329 (=> res!717378 e!615234)))

(declare-fun e!615227 () Bool)

(assert (=> b!1076329 (= res!717378 (not e!615227))))

(declare-fun res!717383 () Bool)

(assert (=> b!1076329 (=> (not res!717383) (not e!615227))))

(assert (=> b!1076329 (= res!717383 (bvslt #b00000000000000000000000000000000 (size!33742 _keys!1163)))))

(declare-fun b!1076330 () Bool)

(declare-fun e!615231 () ListLongMap!14617)

(assert (=> b!1076330 (= e!615232 e!615231)))

(declare-fun c!108224 () Bool)

(assert (=> b!1076330 (= c!108224 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1076331 () Bool)

(declare-fun e!615226 () Bool)

(declare-fun e!615222 () Bool)

(assert (=> b!1076331 (= e!615226 e!615222)))

(declare-fun res!717376 () Bool)

(assert (=> b!1076331 (= res!717376 call!45646)))

(assert (=> b!1076331 (=> (not res!717376) (not e!615222))))

(declare-fun b!1076332 () Bool)

(declare-fun e!615228 () Unit!35423)

(declare-fun Unit!35429 () Unit!35423)

(assert (=> b!1076332 (= e!615228 Unit!35429)))

(declare-fun b!1076333 () Bool)

(declare-fun lt!478049 () Unit!35423)

(assert (=> b!1076333 (= e!615228 lt!478049)))

(declare-fun lt!478063 () ListLongMap!14617)

(assert (=> b!1076333 (= lt!478063 (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478050 () (_ BitVec 64))

(assert (=> b!1076333 (= lt!478050 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478052 () (_ BitVec 64))

(assert (=> b!1076333 (= lt!478052 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478057 () Unit!35423)

(assert (=> b!1076333 (= lt!478057 (addStillContains!655 lt!478063 lt!478050 zeroValueAfter!47 lt!478052))))

(assert (=> b!1076333 (contains!6356 (+!3230 lt!478063 (tuple2!16649 lt!478050 zeroValueAfter!47)) lt!478052)))

(declare-fun lt!478067 () Unit!35423)

(assert (=> b!1076333 (= lt!478067 lt!478057)))

(declare-fun lt!478058 () ListLongMap!14617)

(assert (=> b!1076333 (= lt!478058 (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478055 () (_ BitVec 64))

(assert (=> b!1076333 (= lt!478055 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478059 () (_ BitVec 64))

(assert (=> b!1076333 (= lt!478059 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478064 () Unit!35423)

(assert (=> b!1076333 (= lt!478064 (addApplyDifferent!515 lt!478058 lt!478055 minValue!907 lt!478059))))

(assert (=> b!1076333 (= (apply!942 (+!3230 lt!478058 (tuple2!16649 lt!478055 minValue!907)) lt!478059) (apply!942 lt!478058 lt!478059))))

(declare-fun lt!478066 () Unit!35423)

(assert (=> b!1076333 (= lt!478066 lt!478064)))

(declare-fun lt!478053 () ListLongMap!14617)

(assert (=> b!1076333 (= lt!478053 (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478056 () (_ BitVec 64))

(assert (=> b!1076333 (= lt!478056 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478062 () (_ BitVec 64))

(assert (=> b!1076333 (= lt!478062 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478046 () Unit!35423)

(assert (=> b!1076333 (= lt!478046 (addApplyDifferent!515 lt!478053 lt!478056 zeroValueAfter!47 lt!478062))))

(assert (=> b!1076333 (= (apply!942 (+!3230 lt!478053 (tuple2!16649 lt!478056 zeroValueAfter!47)) lt!478062) (apply!942 lt!478053 lt!478062))))

(declare-fun lt!478051 () Unit!35423)

(assert (=> b!1076333 (= lt!478051 lt!478046)))

(declare-fun lt!478065 () ListLongMap!14617)

(assert (=> b!1076333 (= lt!478065 (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478048 () (_ BitVec 64))

(assert (=> b!1076333 (= lt!478048 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478061 () (_ BitVec 64))

(assert (=> b!1076333 (= lt!478061 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1076333 (= lt!478049 (addApplyDifferent!515 lt!478065 lt!478048 minValue!907 lt!478061))))

(assert (=> b!1076333 (= (apply!942 (+!3230 lt!478065 (tuple2!16649 lt!478048 minValue!907)) lt!478061) (apply!942 lt!478065 lt!478061))))

(declare-fun bm!45642 () Bool)

(declare-fun call!45647 () ListLongMap!14617)

(assert (=> bm!45642 (= call!45647 (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076334 () Bool)

(assert (=> b!1076334 (= e!615226 (not call!45646))))

(declare-fun b!1076335 () Bool)

(declare-fun e!615225 () Bool)

(assert (=> b!1076335 (= e!615234 e!615225)))

(declare-fun res!717377 () Bool)

(assert (=> b!1076335 (=> (not res!717377) (not e!615225))))

(assert (=> b!1076335 (= res!717377 (contains!6356 lt!478060 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076335 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33742 _keys!1163)))))

(declare-fun bm!45643 () Bool)

(declare-fun call!45645 () ListLongMap!14617)

(declare-fun call!45648 () ListLongMap!14617)

(assert (=> bm!45643 (= call!45645 call!45648)))

(declare-fun b!1076337 () Bool)

(assert (=> b!1076337 (= e!615227 (validKeyInArray!0 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076338 () Bool)

(declare-fun res!717384 () Bool)

(assert (=> b!1076338 (=> (not res!717384) (not e!615233))))

(assert (=> b!1076338 (= res!717384 e!615226)))

(declare-fun c!108223 () Bool)

(assert (=> b!1076338 (= c!108223 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1076339 () Bool)

(assert (=> b!1076339 (= e!615225 (= (apply!942 lt!478060 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000)) (get!17246 (select (arr!33205 _values!955) #b00000000000000000000000000000000) (dynLambda!2049 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1076339 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33741 _values!955)))))

(assert (=> b!1076339 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33742 _keys!1163)))))

(declare-fun b!1076340 () Bool)

(declare-fun e!615223 () ListLongMap!14617)

(assert (=> b!1076340 (= e!615223 call!45645)))

(declare-fun b!1076341 () Bool)

(assert (=> b!1076341 (= e!615222 (= (apply!942 lt!478060 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1076342 () Bool)

(declare-fun call!45650 () ListLongMap!14617)

(assert (=> b!1076342 (= e!615231 call!45650)))

(declare-fun b!1076343 () Bool)

(declare-fun e!615230 () Bool)

(assert (=> b!1076343 (= e!615233 e!615230)))

(declare-fun c!108226 () Bool)

(assert (=> b!1076343 (= c!108226 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1076344 () Bool)

(assert (=> b!1076344 (= e!615223 call!45650)))

(declare-fun b!1076345 () Bool)

(declare-fun e!615229 () Bool)

(assert (=> b!1076345 (= e!615230 e!615229)))

(declare-fun res!717381 () Bool)

(declare-fun call!45649 () Bool)

(assert (=> b!1076345 (= res!717381 call!45649)))

(assert (=> b!1076345 (=> (not res!717381) (not e!615229))))

(declare-fun bm!45644 () Bool)

(declare-fun c!108222 () Bool)

(assert (=> bm!45644 (= call!45644 (+!3230 (ite c!108222 call!45647 (ite c!108224 call!45648 call!45645)) (ite (or c!108222 c!108224) (tuple2!16649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16649 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun bm!45645 () Bool)

(assert (=> bm!45645 (= call!45648 call!45647)))

(declare-fun bm!45646 () Bool)

(assert (=> bm!45646 (= call!45650 call!45644)))

(declare-fun b!1076346 () Bool)

(declare-fun c!108221 () Bool)

(assert (=> b!1076346 (= c!108221 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1076346 (= e!615231 e!615223)))

(declare-fun bm!45647 () Bool)

(assert (=> bm!45647 (= call!45649 (contains!6356 lt!478060 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076347 () Bool)

(assert (=> b!1076347 (= e!615230 (not call!45649))))

(declare-fun b!1076348 () Bool)

(assert (=> b!1076348 (= e!615229 (= (apply!942 lt!478060 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun d!129691 () Bool)

(assert (=> d!129691 e!615233))

(declare-fun res!717382 () Bool)

(assert (=> d!129691 (=> (not res!717382) (not e!615233))))

(assert (=> d!129691 (= res!717382 (or (bvsge #b00000000000000000000000000000000 (size!33742 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33742 _keys!1163)))))))

(declare-fun lt!478054 () ListLongMap!14617)

(assert (=> d!129691 (= lt!478060 lt!478054)))

(declare-fun lt!478047 () Unit!35423)

(assert (=> d!129691 (= lt!478047 e!615228)))

(declare-fun c!108225 () Bool)

(declare-fun e!615224 () Bool)

(assert (=> d!129691 (= c!108225 e!615224)))

(declare-fun res!717379 () Bool)

(assert (=> d!129691 (=> (not res!717379) (not e!615224))))

(assert (=> d!129691 (= res!717379 (bvslt #b00000000000000000000000000000000 (size!33742 _keys!1163)))))

(assert (=> d!129691 (= lt!478054 e!615232)))

(assert (=> d!129691 (= c!108222 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129691 (validMask!0 mask!1515)))

(assert (=> d!129691 (= (getCurrentListMap!4193 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!478060)))

(declare-fun b!1076336 () Bool)

(assert (=> b!1076336 (= e!615224 (validKeyInArray!0 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129691 c!108222) b!1076328))

(assert (= (and d!129691 (not c!108222)) b!1076330))

(assert (= (and b!1076330 c!108224) b!1076342))

(assert (= (and b!1076330 (not c!108224)) b!1076346))

(assert (= (and b!1076346 c!108221) b!1076344))

(assert (= (and b!1076346 (not c!108221)) b!1076340))

(assert (= (or b!1076344 b!1076340) bm!45643))

(assert (= (or b!1076342 bm!45643) bm!45645))

(assert (= (or b!1076342 b!1076344) bm!45646))

(assert (= (or b!1076328 bm!45645) bm!45642))

(assert (= (or b!1076328 bm!45646) bm!45644))

(assert (= (and d!129691 res!717379) b!1076336))

(assert (= (and d!129691 c!108225) b!1076333))

(assert (= (and d!129691 (not c!108225)) b!1076332))

(assert (= (and d!129691 res!717382) b!1076329))

(assert (= (and b!1076329 res!717383) b!1076337))

(assert (= (and b!1076329 (not res!717378)) b!1076335))

(assert (= (and b!1076335 res!717377) b!1076339))

(assert (= (and b!1076329 res!717380) b!1076338))

(assert (= (and b!1076338 c!108223) b!1076331))

(assert (= (and b!1076338 (not c!108223)) b!1076334))

(assert (= (and b!1076331 res!717376) b!1076341))

(assert (= (or b!1076331 b!1076334) bm!45641))

(assert (= (and b!1076338 res!717384) b!1076343))

(assert (= (and b!1076343 c!108226) b!1076345))

(assert (= (and b!1076343 (not c!108226)) b!1076347))

(assert (= (and b!1076345 res!717381) b!1076348))

(assert (= (or b!1076345 b!1076347) bm!45647))

(declare-fun b_lambda!16959 () Bool)

(assert (=> (not b_lambda!16959) (not b!1076339)))

(assert (=> b!1076339 t!32545))

(declare-fun b_and!35207 () Bool)

(assert (= b_and!35205 (and (=> t!32545 result!14845) b_and!35207)))

(assert (=> b!1076337 m!995075))

(assert (=> b!1076337 m!995075))

(assert (=> b!1076337 m!995091))

(declare-fun m!995223 () Bool)

(assert (=> b!1076333 m!995223))

(declare-fun m!995225 () Bool)

(assert (=> b!1076333 m!995225))

(declare-fun m!995227 () Bool)

(assert (=> b!1076333 m!995227))

(declare-fun m!995229 () Bool)

(assert (=> b!1076333 m!995229))

(declare-fun m!995231 () Bool)

(assert (=> b!1076333 m!995231))

(declare-fun m!995233 () Bool)

(assert (=> b!1076333 m!995233))

(declare-fun m!995235 () Bool)

(assert (=> b!1076333 m!995235))

(assert (=> b!1076333 m!995223))

(declare-fun m!995237 () Bool)

(assert (=> b!1076333 m!995237))

(assert (=> b!1076333 m!995075))

(assert (=> b!1076333 m!995227))

(declare-fun m!995239 () Bool)

(assert (=> b!1076333 m!995239))

(declare-fun m!995241 () Bool)

(assert (=> b!1076333 m!995241))

(assert (=> b!1076333 m!995235))

(declare-fun m!995243 () Bool)

(assert (=> b!1076333 m!995243))

(declare-fun m!995245 () Bool)

(assert (=> b!1076333 m!995245))

(declare-fun m!995247 () Bool)

(assert (=> b!1076333 m!995247))

(assert (=> b!1076333 m!995231))

(declare-fun m!995249 () Bool)

(assert (=> b!1076333 m!995249))

(assert (=> b!1076333 m!994999))

(declare-fun m!995251 () Bool)

(assert (=> b!1076333 m!995251))

(declare-fun m!995253 () Bool)

(assert (=> b!1076341 m!995253))

(assert (=> b!1076335 m!995075))

(assert (=> b!1076335 m!995075))

(declare-fun m!995255 () Bool)

(assert (=> b!1076335 m!995255))

(declare-fun m!995257 () Bool)

(assert (=> bm!45647 m!995257))

(assert (=> b!1076336 m!995075))

(assert (=> b!1076336 m!995075))

(assert (=> b!1076336 m!995091))

(declare-fun m!995259 () Bool)

(assert (=> bm!45644 m!995259))

(declare-fun m!995261 () Bool)

(assert (=> b!1076348 m!995261))

(assert (=> d!129691 m!995017))

(assert (=> b!1076339 m!995067))

(assert (=> b!1076339 m!995075))

(declare-fun m!995263 () Bool)

(assert (=> b!1076339 m!995263))

(assert (=> b!1076339 m!995069))

(assert (=> b!1076339 m!995067))

(assert (=> b!1076339 m!995069))

(assert (=> b!1076339 m!995071))

(assert (=> b!1076339 m!995075))

(declare-fun m!995265 () Bool)

(assert (=> b!1076328 m!995265))

(declare-fun m!995267 () Bool)

(assert (=> bm!45641 m!995267))

(assert (=> bm!45642 m!994999))

(assert (=> b!1076146 d!129691))

(declare-fun d!129693 () Bool)

(assert (=> d!129693 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95206 d!129693))

(declare-fun d!129695 () Bool)

(assert (=> d!129695 (= (array_inv!25656 _values!955) (bvsge (size!33741 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95206 d!129695))

(declare-fun d!129697 () Bool)

(assert (=> d!129697 (= (array_inv!25657 _keys!1163) (bvsge (size!33742 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95206 d!129697))

(declare-fun b!1076359 () Bool)

(declare-fun e!615243 () Bool)

(declare-fun call!45653 () Bool)

(assert (=> b!1076359 (= e!615243 call!45653)))

(declare-fun d!129699 () Bool)

(declare-fun res!717392 () Bool)

(declare-fun e!615244 () Bool)

(assert (=> d!129699 (=> res!717392 e!615244)))

(assert (=> d!129699 (= res!717392 (bvsge #b00000000000000000000000000000000 (size!33742 _keys!1163)))))

(assert (=> d!129699 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23181) e!615244)))

(declare-fun b!1076360 () Bool)

(declare-fun e!615245 () Bool)

(assert (=> b!1076360 (= e!615244 e!615245)))

(declare-fun res!717393 () Bool)

(assert (=> b!1076360 (=> (not res!717393) (not e!615245))))

(declare-fun e!615246 () Bool)

(assert (=> b!1076360 (= res!717393 (not e!615246))))

(declare-fun res!717391 () Bool)

(assert (=> b!1076360 (=> (not res!717391) (not e!615246))))

(assert (=> b!1076360 (= res!717391 (validKeyInArray!0 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076361 () Bool)

(declare-fun contains!6359 (List!23184 (_ BitVec 64)) Bool)

(assert (=> b!1076361 (= e!615246 (contains!6359 Nil!23181 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076362 () Bool)

(assert (=> b!1076362 (= e!615245 e!615243)))

(declare-fun c!108229 () Bool)

(assert (=> b!1076362 (= c!108229 (validKeyInArray!0 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45650 () Bool)

(assert (=> bm!45650 (= call!45653 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108229 (Cons!23180 (select (arr!33206 _keys!1163) #b00000000000000000000000000000000) Nil!23181) Nil!23181)))))

(declare-fun b!1076363 () Bool)

(assert (=> b!1076363 (= e!615243 call!45653)))

(assert (= (and d!129699 (not res!717392)) b!1076360))

(assert (= (and b!1076360 res!717391) b!1076361))

(assert (= (and b!1076360 res!717393) b!1076362))

(assert (= (and b!1076362 c!108229) b!1076359))

(assert (= (and b!1076362 (not c!108229)) b!1076363))

(assert (= (or b!1076359 b!1076363) bm!45650))

(assert (=> b!1076360 m!995075))

(assert (=> b!1076360 m!995075))

(assert (=> b!1076360 m!995091))

(assert (=> b!1076361 m!995075))

(assert (=> b!1076361 m!995075))

(declare-fun m!995269 () Bool)

(assert (=> b!1076361 m!995269))

(assert (=> b!1076362 m!995075))

(assert (=> b!1076362 m!995075))

(assert (=> b!1076362 m!995091))

(assert (=> bm!45650 m!995075))

(declare-fun m!995271 () Bool)

(assert (=> bm!45650 m!995271))

(assert (=> b!1076147 d!129699))

(declare-fun mapIsEmpty!40804 () Bool)

(declare-fun mapRes!40804 () Bool)

(assert (=> mapIsEmpty!40804 mapRes!40804))

(declare-fun condMapEmpty!40804 () Bool)

(declare-fun mapDefault!40804 () ValueCell!12315)

(assert (=> mapNonEmpty!40798 (= condMapEmpty!40804 (= mapRest!40798 ((as const (Array (_ BitVec 32) ValueCell!12315)) mapDefault!40804)))))

(declare-fun e!615251 () Bool)

(assert (=> mapNonEmpty!40798 (= tp!78176 (and e!615251 mapRes!40804))))

(declare-fun b!1076370 () Bool)

(declare-fun e!615252 () Bool)

(assert (=> b!1076370 (= e!615252 tp_is_empty!26037)))

(declare-fun b!1076371 () Bool)

(assert (=> b!1076371 (= e!615251 tp_is_empty!26037)))

(declare-fun mapNonEmpty!40804 () Bool)

(declare-fun tp!78185 () Bool)

(assert (=> mapNonEmpty!40804 (= mapRes!40804 (and tp!78185 e!615252))))

(declare-fun mapRest!40804 () (Array (_ BitVec 32) ValueCell!12315))

(declare-fun mapValue!40804 () ValueCell!12315)

(declare-fun mapKey!40804 () (_ BitVec 32))

(assert (=> mapNonEmpty!40804 (= mapRest!40798 (store mapRest!40804 mapKey!40804 mapValue!40804))))

(assert (= (and mapNonEmpty!40798 condMapEmpty!40804) mapIsEmpty!40804))

(assert (= (and mapNonEmpty!40798 (not condMapEmpty!40804)) mapNonEmpty!40804))

(assert (= (and mapNonEmpty!40804 ((_ is ValueCellFull!12315) mapValue!40804)) b!1076370))

(assert (= (and mapNonEmpty!40798 ((_ is ValueCellFull!12315) mapDefault!40804)) b!1076371))

(declare-fun m!995273 () Bool)

(assert (=> mapNonEmpty!40804 m!995273))

(declare-fun b_lambda!16961 () Bool)

(assert (= b_lambda!16949 (or (and start!95206 b_free!22227) b_lambda!16961)))

(declare-fun b_lambda!16963 () Bool)

(assert (= b_lambda!16959 (or (and start!95206 b_free!22227) b_lambda!16963)))

(declare-fun b_lambda!16965 () Bool)

(assert (= b_lambda!16957 (or (and start!95206 b_free!22227) b_lambda!16965)))

(declare-fun b_lambda!16967 () Bool)

(assert (= b_lambda!16953 (or (and start!95206 b_free!22227) b_lambda!16967)))

(declare-fun b_lambda!16969 () Bool)

(assert (= b_lambda!16951 (or (and start!95206 b_free!22227) b_lambda!16969)))

(declare-fun b_lambda!16971 () Bool)

(assert (= b_lambda!16955 (or (and start!95206 b_free!22227) b_lambda!16971)))

(check-sat (not b!1076229) (not b!1076209) (not b!1076249) (not b!1076208) (not b!1076224) b_and!35207 (not bm!45634) (not b!1076241) (not b_lambda!16965) (not bm!45615) (not d!129687) (not b!1076227) (not b!1076325) (not b!1076216) (not d!129691) (not d!129683) (not bm!45644) (not b!1076348) (not b!1076339) (not b!1076240) (not b!1076337) (not bm!45642) (not b!1076251) (not b!1076225) (not b!1076360) (not b!1076318) (not b!1076215) (not b!1076317) (not b_lambda!16961) (not d!129689) (not d!129675) (not b_lambda!16971) (not d!129681) (not d!129685) (not b!1076316) (not b!1076315) (not bm!45616) (not b_lambda!16967) (not b!1076211) (not b!1076336) (not bm!45641) (not b!1076305) (not b!1076212) (not mapNonEmpty!40804) (not b!1076248) (not b!1076230) (not b!1076210) (not b_lambda!16969) (not d!129679) (not b!1076213) (not bm!45650) (not b!1076341) (not b!1076302) (not d!129671) (not b!1076303) (not bm!45619) (not b!1076222) (not b!1076327) (not bm!45640) (not b!1076362) (not bm!45647) (not b!1076328) (not d!129673) (not bm!45637) (not b_next!22227) (not b_lambda!16963) (not b!1076361) (not bm!45635) (not b!1076223) (not b!1076314) (not b!1076335) (not b!1076294) (not b!1076333) tp_is_empty!26037 (not b!1076250) (not b!1076226) (not b!1076301) (not b!1076307) (not b!1076299))
(check-sat b_and!35207 (not b_next!22227))
