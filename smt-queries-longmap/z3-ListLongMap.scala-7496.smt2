; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95184 () Bool)

(assert start!95184)

(declare-fun b_free!22153 () Bool)

(declare-fun b_next!22153 () Bool)

(assert (=> start!95184 (= b_free!22153 (not b_next!22153))))

(declare-fun tp!77924 () Bool)

(declare-fun b_and!35017 () Bool)

(assert (=> start!95184 (= tp!77924 b_and!35017)))

(declare-fun b!1074879 () Bool)

(declare-fun res!716528 () Bool)

(declare-fun e!614198 () Bool)

(assert (=> b!1074879 (=> (not res!716528) (not e!614198))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39753 0))(
  ( (V!39754 (val!13032 Int)) )
))
(declare-datatypes ((ValueCell!12278 0))(
  ( (ValueCellFull!12278 (v!15646 V!39753)) (EmptyCell!12278) )
))
(declare-datatypes ((array!68931 0))(
  ( (array!68932 (arr!33153 (Array (_ BitVec 32) ValueCell!12278)) (size!33690 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68931)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68933 0))(
  ( (array!68934 (arr!33154 (Array (_ BitVec 32) (_ BitVec 64))) (size!33691 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68933)

(assert (=> b!1074879 (= res!716528 (and (= (size!33690 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33691 _keys!1163) (size!33690 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074880 () Bool)

(declare-fun res!716530 () Bool)

(assert (=> b!1074880 (=> (not res!716530) (not e!614198))))

(declare-datatypes ((List!23138 0))(
  ( (Nil!23135) (Cons!23134 (h!24352 (_ BitVec 64)) (t!32467 List!23138)) )
))
(declare-fun arrayNoDuplicates!0 (array!68933 (_ BitVec 32) List!23138) Bool)

(assert (=> b!1074880 (= res!716530 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23135))))

(declare-fun mapIsEmpty!40657 () Bool)

(declare-fun mapRes!40657 () Bool)

(assert (=> mapIsEmpty!40657 mapRes!40657))

(declare-fun b!1074881 () Bool)

(declare-fun res!716529 () Bool)

(assert (=> b!1074881 (=> (not res!716529) (not e!614198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68933 (_ BitVec 32)) Bool)

(assert (=> b!1074881 (= res!716529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1074882 () Bool)

(declare-fun e!614197 () Bool)

(declare-fun tp_is_empty!25963 () Bool)

(assert (=> b!1074882 (= e!614197 tp_is_empty!25963)))

(declare-fun mapNonEmpty!40657 () Bool)

(declare-fun tp!77923 () Bool)

(declare-fun e!614196 () Bool)

(assert (=> mapNonEmpty!40657 (= mapRes!40657 (and tp!77923 e!614196))))

(declare-fun mapValue!40657 () ValueCell!12278)

(declare-fun mapRest!40657 () (Array (_ BitVec 32) ValueCell!12278))

(declare-fun mapKey!40657 () (_ BitVec 32))

(assert (=> mapNonEmpty!40657 (= (arr!33153 _values!955) (store mapRest!40657 mapKey!40657 mapValue!40657))))

(declare-fun res!716527 () Bool)

(assert (=> start!95184 (=> (not res!716527) (not e!614198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95184 (= res!716527 (validMask!0 mask!1515))))

(assert (=> start!95184 e!614198))

(assert (=> start!95184 true))

(assert (=> start!95184 tp_is_empty!25963))

(declare-fun e!614195 () Bool)

(declare-fun array_inv!25664 (array!68931) Bool)

(assert (=> start!95184 (and (array_inv!25664 _values!955) e!614195)))

(assert (=> start!95184 tp!77924))

(declare-fun array_inv!25665 (array!68933) Bool)

(assert (=> start!95184 (array_inv!25665 _keys!1163)))

(declare-fun b!1074883 () Bool)

(assert (=> b!1074883 (= e!614198 (bvsgt #b00000000000000000000000000000000 (size!33691 _keys!1163)))))

(declare-fun minValue!907 () V!39753)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39753)

(declare-datatypes ((tuple2!16580 0))(
  ( (tuple2!16581 (_1!8301 (_ BitVec 64)) (_2!8301 V!39753)) )
))
(declare-datatypes ((List!23139 0))(
  ( (Nil!23136) (Cons!23135 (h!24353 tuple2!16580) (t!32468 List!23139)) )
))
(declare-datatypes ((ListLongMap!14557 0))(
  ( (ListLongMap!14558 (toList!7294 List!23139)) )
))
(declare-fun lt!476594 () ListLongMap!14557)

(declare-fun getCurrentListMapNoExtraKeys!3892 (array!68933 array!68931 (_ BitVec 32) (_ BitVec 32) V!39753 V!39753 (_ BitVec 32) Int) ListLongMap!14557)

(assert (=> b!1074883 (= lt!476594 (getCurrentListMapNoExtraKeys!3892 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39753)

(declare-fun lt!476595 () ListLongMap!14557)

(assert (=> b!1074883 (= lt!476595 (getCurrentListMapNoExtraKeys!3892 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074884 () Bool)

(assert (=> b!1074884 (= e!614195 (and e!614197 mapRes!40657))))

(declare-fun condMapEmpty!40657 () Bool)

(declare-fun mapDefault!40657 () ValueCell!12278)

(assert (=> b!1074884 (= condMapEmpty!40657 (= (arr!33153 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12278)) mapDefault!40657)))))

(declare-fun b!1074885 () Bool)

(assert (=> b!1074885 (= e!614196 tp_is_empty!25963)))

(assert (= (and start!95184 res!716527) b!1074879))

(assert (= (and b!1074879 res!716528) b!1074881))

(assert (= (and b!1074881 res!716529) b!1074880))

(assert (= (and b!1074880 res!716530) b!1074883))

(assert (= (and b!1074884 condMapEmpty!40657) mapIsEmpty!40657))

(assert (= (and b!1074884 (not condMapEmpty!40657)) mapNonEmpty!40657))

(get-info :version)

(assert (= (and mapNonEmpty!40657 ((_ is ValueCellFull!12278) mapValue!40657)) b!1074885))

(assert (= (and b!1074884 ((_ is ValueCellFull!12278) mapDefault!40657)) b!1074882))

(assert (= start!95184 b!1074884))

(declare-fun m!994183 () Bool)

(assert (=> start!95184 m!994183))

(declare-fun m!994185 () Bool)

(assert (=> start!95184 m!994185))

(declare-fun m!994187 () Bool)

(assert (=> start!95184 m!994187))

(declare-fun m!994189 () Bool)

(assert (=> b!1074880 m!994189))

(declare-fun m!994191 () Bool)

(assert (=> b!1074881 m!994191))

(declare-fun m!994193 () Bool)

(assert (=> mapNonEmpty!40657 m!994193))

(declare-fun m!994195 () Bool)

(assert (=> b!1074883 m!994195))

(declare-fun m!994197 () Bool)

(assert (=> b!1074883 m!994197))

(check-sat b_and!35017 (not start!95184) (not mapNonEmpty!40657) (not b_next!22153) (not b!1074883) tp_is_empty!25963 (not b!1074881) (not b!1074880))
(check-sat b_and!35017 (not b_next!22153))
(get-model)

(declare-fun b!1074952 () Bool)

(declare-fun e!614249 () ListLongMap!14557)

(declare-fun call!45347 () ListLongMap!14557)

(assert (=> b!1074952 (= e!614249 call!45347)))

(declare-fun b!1074953 () Bool)

(declare-fun e!614248 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1074953 (= e!614248 (validKeyInArray!0 (select (arr!33154 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074953 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun lt!476625 () ListLongMap!14557)

(declare-fun b!1074954 () Bool)

(declare-fun e!614246 () Bool)

(assert (=> b!1074954 (= e!614246 (= lt!476625 (getCurrentListMapNoExtraKeys!3892 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1074955 () Bool)

(declare-fun isEmpty!954 (ListLongMap!14557) Bool)

(assert (=> b!1074955 (= e!614246 (isEmpty!954 lt!476625))))

(declare-fun b!1074956 () Bool)

(declare-fun res!716563 () Bool)

(declare-fun e!614247 () Bool)

(assert (=> b!1074956 (=> (not res!716563) (not e!614247))))

(declare-fun contains!6352 (ListLongMap!14557 (_ BitVec 64)) Bool)

(assert (=> b!1074956 (= res!716563 (not (contains!6352 lt!476625 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!45344 () Bool)

(assert (=> bm!45344 (= call!45347 (getCurrentListMapNoExtraKeys!3892 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1074957 () Bool)

(declare-fun e!614243 () ListLongMap!14557)

(assert (=> b!1074957 (= e!614243 (ListLongMap!14558 Nil!23136))))

(declare-fun b!1074958 () Bool)

(assert (=> b!1074958 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33691 _keys!1163)))))

(assert (=> b!1074958 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33690 _values!955)))))

(declare-fun e!614245 () Bool)

(declare-fun apply!941 (ListLongMap!14557 (_ BitVec 64)) V!39753)

(declare-fun get!17241 (ValueCell!12278 V!39753) V!39753)

(declare-fun dynLambda!2056 (Int (_ BitVec 64)) V!39753)

(assert (=> b!1074958 (= e!614245 (= (apply!941 lt!476625 (select (arr!33154 _keys!1163) #b00000000000000000000000000000000)) (get!17241 (select (arr!33153 _values!955) #b00000000000000000000000000000000) (dynLambda!2056 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1074959 () Bool)

(assert (=> b!1074959 (= e!614243 e!614249)))

(declare-fun c!108162 () Bool)

(assert (=> b!1074959 (= c!108162 (validKeyInArray!0 (select (arr!33154 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129887 () Bool)

(assert (=> d!129887 e!614247))

(declare-fun res!716565 () Bool)

(assert (=> d!129887 (=> (not res!716565) (not e!614247))))

(assert (=> d!129887 (= res!716565 (not (contains!6352 lt!476625 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129887 (= lt!476625 e!614243)))

(declare-fun c!108161 () Bool)

(assert (=> d!129887 (= c!108161 (bvsge #b00000000000000000000000000000000 (size!33691 _keys!1163)))))

(assert (=> d!129887 (validMask!0 mask!1515)))

(assert (=> d!129887 (= (getCurrentListMapNoExtraKeys!3892 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476625)))

(declare-fun b!1074960 () Bool)

(declare-fun e!614244 () Bool)

(assert (=> b!1074960 (= e!614244 e!614245)))

(assert (=> b!1074960 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33691 _keys!1163)))))

(declare-fun res!716564 () Bool)

(assert (=> b!1074960 (= res!716564 (contains!6352 lt!476625 (select (arr!33154 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074960 (=> (not res!716564) (not e!614245))))

(declare-fun b!1074961 () Bool)

(assert (=> b!1074961 (= e!614244 e!614246)))

(declare-fun c!108163 () Bool)

(assert (=> b!1074961 (= c!108163 (bvslt #b00000000000000000000000000000000 (size!33691 _keys!1163)))))

(declare-fun b!1074962 () Bool)

(declare-datatypes ((Unit!35329 0))(
  ( (Unit!35330) )
))
(declare-fun lt!476624 () Unit!35329)

(declare-fun lt!476626 () Unit!35329)

(assert (=> b!1074962 (= lt!476624 lt!476626)))

(declare-fun lt!476628 () (_ BitVec 64))

(declare-fun lt!476623 () V!39753)

(declare-fun lt!476622 () ListLongMap!14557)

(declare-fun lt!476627 () (_ BitVec 64))

(declare-fun +!3234 (ListLongMap!14557 tuple2!16580) ListLongMap!14557)

(assert (=> b!1074962 (not (contains!6352 (+!3234 lt!476622 (tuple2!16581 lt!476628 lt!476623)) lt!476627))))

(declare-fun addStillNotContains!262 (ListLongMap!14557 (_ BitVec 64) V!39753 (_ BitVec 64)) Unit!35329)

(assert (=> b!1074962 (= lt!476626 (addStillNotContains!262 lt!476622 lt!476628 lt!476623 lt!476627))))

(assert (=> b!1074962 (= lt!476627 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1074962 (= lt!476623 (get!17241 (select (arr!33153 _values!955) #b00000000000000000000000000000000) (dynLambda!2056 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1074962 (= lt!476628 (select (arr!33154 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074962 (= lt!476622 call!45347)))

(assert (=> b!1074962 (= e!614249 (+!3234 call!45347 (tuple2!16581 (select (arr!33154 _keys!1163) #b00000000000000000000000000000000) (get!17241 (select (arr!33153 _values!955) #b00000000000000000000000000000000) (dynLambda!2056 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1074963 () Bool)

(assert (=> b!1074963 (= e!614247 e!614244)))

(declare-fun c!108160 () Bool)

(assert (=> b!1074963 (= c!108160 e!614248)))

(declare-fun res!716566 () Bool)

(assert (=> b!1074963 (=> (not res!716566) (not e!614248))))

(assert (=> b!1074963 (= res!716566 (bvslt #b00000000000000000000000000000000 (size!33691 _keys!1163)))))

(assert (= (and d!129887 c!108161) b!1074957))

(assert (= (and d!129887 (not c!108161)) b!1074959))

(assert (= (and b!1074959 c!108162) b!1074962))

(assert (= (and b!1074959 (not c!108162)) b!1074952))

(assert (= (or b!1074962 b!1074952) bm!45344))

(assert (= (and d!129887 res!716565) b!1074956))

(assert (= (and b!1074956 res!716563) b!1074963))

(assert (= (and b!1074963 res!716566) b!1074953))

(assert (= (and b!1074963 c!108160) b!1074960))

(assert (= (and b!1074963 (not c!108160)) b!1074961))

(assert (= (and b!1074960 res!716564) b!1074958))

(assert (= (and b!1074961 c!108163) b!1074954))

(assert (= (and b!1074961 (not c!108163)) b!1074955))

(declare-fun b_lambda!16735 () Bool)

(assert (=> (not b_lambda!16735) (not b!1074958)))

(declare-fun t!32473 () Bool)

(declare-fun tb!7151 () Bool)

(assert (=> (and start!95184 (= defaultEntry!963 defaultEntry!963) t!32473) tb!7151))

(declare-fun result!14777 () Bool)

(assert (=> tb!7151 (= result!14777 tp_is_empty!25963)))

(assert (=> b!1074958 t!32473))

(declare-fun b_and!35023 () Bool)

(assert (= b_and!35017 (and (=> t!32473 result!14777) b_and!35023)))

(declare-fun b_lambda!16737 () Bool)

(assert (=> (not b_lambda!16737) (not b!1074962)))

(assert (=> b!1074962 t!32473))

(declare-fun b_and!35025 () Bool)

(assert (= b_and!35023 (and (=> t!32473 result!14777) b_and!35025)))

(declare-fun m!994231 () Bool)

(assert (=> b!1074956 m!994231))

(declare-fun m!994233 () Bool)

(assert (=> d!129887 m!994233))

(assert (=> d!129887 m!994183))

(declare-fun m!994235 () Bool)

(assert (=> b!1074958 m!994235))

(declare-fun m!994237 () Bool)

(assert (=> b!1074958 m!994237))

(declare-fun m!994239 () Bool)

(assert (=> b!1074958 m!994239))

(declare-fun m!994241 () Bool)

(assert (=> b!1074958 m!994241))

(assert (=> b!1074958 m!994241))

(assert (=> b!1074958 m!994235))

(declare-fun m!994243 () Bool)

(assert (=> b!1074958 m!994243))

(assert (=> b!1074958 m!994237))

(declare-fun m!994245 () Bool)

(assert (=> b!1074954 m!994245))

(assert (=> b!1074962 m!994235))

(declare-fun m!994247 () Bool)

(assert (=> b!1074962 m!994247))

(declare-fun m!994249 () Bool)

(assert (=> b!1074962 m!994249))

(assert (=> b!1074962 m!994241))

(declare-fun m!994251 () Bool)

(assert (=> b!1074962 m!994251))

(assert (=> b!1074962 m!994241))

(assert (=> b!1074962 m!994235))

(assert (=> b!1074962 m!994243))

(assert (=> b!1074962 m!994237))

(assert (=> b!1074962 m!994247))

(declare-fun m!994253 () Bool)

(assert (=> b!1074962 m!994253))

(declare-fun m!994255 () Bool)

(assert (=> b!1074955 m!994255))

(assert (=> b!1074960 m!994237))

(assert (=> b!1074960 m!994237))

(declare-fun m!994257 () Bool)

(assert (=> b!1074960 m!994257))

(assert (=> bm!45344 m!994245))

(assert (=> b!1074959 m!994237))

(assert (=> b!1074959 m!994237))

(declare-fun m!994259 () Bool)

(assert (=> b!1074959 m!994259))

(assert (=> b!1074953 m!994237))

(assert (=> b!1074953 m!994237))

(assert (=> b!1074953 m!994259))

(assert (=> b!1074883 d!129887))

(declare-fun b!1074966 () Bool)

(declare-fun e!614256 () ListLongMap!14557)

(declare-fun call!45348 () ListLongMap!14557)

(assert (=> b!1074966 (= e!614256 call!45348)))

(declare-fun b!1074967 () Bool)

(declare-fun e!614255 () Bool)

(assert (=> b!1074967 (= e!614255 (validKeyInArray!0 (select (arr!33154 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074967 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun e!614253 () Bool)

(declare-fun lt!476632 () ListLongMap!14557)

(declare-fun b!1074968 () Bool)

(assert (=> b!1074968 (= e!614253 (= lt!476632 (getCurrentListMapNoExtraKeys!3892 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1074969 () Bool)

(assert (=> b!1074969 (= e!614253 (isEmpty!954 lt!476632))))

(declare-fun b!1074970 () Bool)

(declare-fun res!716567 () Bool)

(declare-fun e!614254 () Bool)

(assert (=> b!1074970 (=> (not res!716567) (not e!614254))))

(assert (=> b!1074970 (= res!716567 (not (contains!6352 lt!476632 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!45345 () Bool)

(assert (=> bm!45345 (= call!45348 (getCurrentListMapNoExtraKeys!3892 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1074971 () Bool)

(declare-fun e!614250 () ListLongMap!14557)

(assert (=> b!1074971 (= e!614250 (ListLongMap!14558 Nil!23136))))

(declare-fun b!1074972 () Bool)

(assert (=> b!1074972 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33691 _keys!1163)))))

(assert (=> b!1074972 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33690 _values!955)))))

(declare-fun e!614252 () Bool)

(assert (=> b!1074972 (= e!614252 (= (apply!941 lt!476632 (select (arr!33154 _keys!1163) #b00000000000000000000000000000000)) (get!17241 (select (arr!33153 _values!955) #b00000000000000000000000000000000) (dynLambda!2056 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1074973 () Bool)

(assert (=> b!1074973 (= e!614250 e!614256)))

(declare-fun c!108166 () Bool)

(assert (=> b!1074973 (= c!108166 (validKeyInArray!0 (select (arr!33154 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129889 () Bool)

(assert (=> d!129889 e!614254))

(declare-fun res!716569 () Bool)

(assert (=> d!129889 (=> (not res!716569) (not e!614254))))

(assert (=> d!129889 (= res!716569 (not (contains!6352 lt!476632 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129889 (= lt!476632 e!614250)))

(declare-fun c!108165 () Bool)

(assert (=> d!129889 (= c!108165 (bvsge #b00000000000000000000000000000000 (size!33691 _keys!1163)))))

(assert (=> d!129889 (validMask!0 mask!1515)))

(assert (=> d!129889 (= (getCurrentListMapNoExtraKeys!3892 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476632)))

(declare-fun b!1074974 () Bool)

(declare-fun e!614251 () Bool)

(assert (=> b!1074974 (= e!614251 e!614252)))

(assert (=> b!1074974 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33691 _keys!1163)))))

(declare-fun res!716568 () Bool)

(assert (=> b!1074974 (= res!716568 (contains!6352 lt!476632 (select (arr!33154 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074974 (=> (not res!716568) (not e!614252))))

(declare-fun b!1074975 () Bool)

(assert (=> b!1074975 (= e!614251 e!614253)))

(declare-fun c!108167 () Bool)

(assert (=> b!1074975 (= c!108167 (bvslt #b00000000000000000000000000000000 (size!33691 _keys!1163)))))

(declare-fun b!1074976 () Bool)

(declare-fun lt!476631 () Unit!35329)

(declare-fun lt!476633 () Unit!35329)

(assert (=> b!1074976 (= lt!476631 lt!476633)))

(declare-fun lt!476630 () V!39753)

(declare-fun lt!476635 () (_ BitVec 64))

(declare-fun lt!476634 () (_ BitVec 64))

(declare-fun lt!476629 () ListLongMap!14557)

(assert (=> b!1074976 (not (contains!6352 (+!3234 lt!476629 (tuple2!16581 lt!476635 lt!476630)) lt!476634))))

(assert (=> b!1074976 (= lt!476633 (addStillNotContains!262 lt!476629 lt!476635 lt!476630 lt!476634))))

(assert (=> b!1074976 (= lt!476634 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1074976 (= lt!476630 (get!17241 (select (arr!33153 _values!955) #b00000000000000000000000000000000) (dynLambda!2056 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1074976 (= lt!476635 (select (arr!33154 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074976 (= lt!476629 call!45348)))

(assert (=> b!1074976 (= e!614256 (+!3234 call!45348 (tuple2!16581 (select (arr!33154 _keys!1163) #b00000000000000000000000000000000) (get!17241 (select (arr!33153 _values!955) #b00000000000000000000000000000000) (dynLambda!2056 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1074977 () Bool)

(assert (=> b!1074977 (= e!614254 e!614251)))

(declare-fun c!108164 () Bool)

(assert (=> b!1074977 (= c!108164 e!614255)))

(declare-fun res!716570 () Bool)

(assert (=> b!1074977 (=> (not res!716570) (not e!614255))))

(assert (=> b!1074977 (= res!716570 (bvslt #b00000000000000000000000000000000 (size!33691 _keys!1163)))))

(assert (= (and d!129889 c!108165) b!1074971))

(assert (= (and d!129889 (not c!108165)) b!1074973))

(assert (= (and b!1074973 c!108166) b!1074976))

(assert (= (and b!1074973 (not c!108166)) b!1074966))

(assert (= (or b!1074976 b!1074966) bm!45345))

(assert (= (and d!129889 res!716569) b!1074970))

(assert (= (and b!1074970 res!716567) b!1074977))

(assert (= (and b!1074977 res!716570) b!1074967))

(assert (= (and b!1074977 c!108164) b!1074974))

(assert (= (and b!1074977 (not c!108164)) b!1074975))

(assert (= (and b!1074974 res!716568) b!1074972))

(assert (= (and b!1074975 c!108167) b!1074968))

(assert (= (and b!1074975 (not c!108167)) b!1074969))

(declare-fun b_lambda!16739 () Bool)

(assert (=> (not b_lambda!16739) (not b!1074972)))

(assert (=> b!1074972 t!32473))

(declare-fun b_and!35027 () Bool)

(assert (= b_and!35025 (and (=> t!32473 result!14777) b_and!35027)))

(declare-fun b_lambda!16741 () Bool)

(assert (=> (not b_lambda!16741) (not b!1074976)))

(assert (=> b!1074976 t!32473))

(declare-fun b_and!35029 () Bool)

(assert (= b_and!35027 (and (=> t!32473 result!14777) b_and!35029)))

(declare-fun m!994261 () Bool)

(assert (=> b!1074970 m!994261))

(declare-fun m!994263 () Bool)

(assert (=> d!129889 m!994263))

(assert (=> d!129889 m!994183))

(assert (=> b!1074972 m!994235))

(assert (=> b!1074972 m!994237))

(declare-fun m!994265 () Bool)

(assert (=> b!1074972 m!994265))

(assert (=> b!1074972 m!994241))

(assert (=> b!1074972 m!994241))

(assert (=> b!1074972 m!994235))

(assert (=> b!1074972 m!994243))

(assert (=> b!1074972 m!994237))

(declare-fun m!994267 () Bool)

(assert (=> b!1074968 m!994267))

(assert (=> b!1074976 m!994235))

(declare-fun m!994269 () Bool)

(assert (=> b!1074976 m!994269))

(declare-fun m!994271 () Bool)

(assert (=> b!1074976 m!994271))

(assert (=> b!1074976 m!994241))

(declare-fun m!994273 () Bool)

(assert (=> b!1074976 m!994273))

(assert (=> b!1074976 m!994241))

(assert (=> b!1074976 m!994235))

(assert (=> b!1074976 m!994243))

(assert (=> b!1074976 m!994237))

(assert (=> b!1074976 m!994269))

(declare-fun m!994275 () Bool)

(assert (=> b!1074976 m!994275))

(declare-fun m!994277 () Bool)

(assert (=> b!1074969 m!994277))

(assert (=> b!1074974 m!994237))

(assert (=> b!1074974 m!994237))

(declare-fun m!994279 () Bool)

(assert (=> b!1074974 m!994279))

(assert (=> bm!45345 m!994267))

(assert (=> b!1074973 m!994237))

(assert (=> b!1074973 m!994237))

(assert (=> b!1074973 m!994259))

(assert (=> b!1074967 m!994237))

(assert (=> b!1074967 m!994237))

(assert (=> b!1074967 m!994259))

(assert (=> b!1074883 d!129889))

(declare-fun d!129891 () Bool)

(assert (=> d!129891 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95184 d!129891))

(declare-fun d!129893 () Bool)

(assert (=> d!129893 (= (array_inv!25664 _values!955) (bvsge (size!33690 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95184 d!129893))

(declare-fun d!129895 () Bool)

(assert (=> d!129895 (= (array_inv!25665 _keys!1163) (bvsge (size!33691 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95184 d!129895))

(declare-fun b!1074988 () Bool)

(declare-fun e!614267 () Bool)

(declare-fun call!45351 () Bool)

(assert (=> b!1074988 (= e!614267 call!45351)))

(declare-fun b!1074989 () Bool)

(assert (=> b!1074989 (= e!614267 call!45351)))

(declare-fun b!1074990 () Bool)

(declare-fun e!614266 () Bool)

(declare-fun contains!6353 (List!23138 (_ BitVec 64)) Bool)

(assert (=> b!1074990 (= e!614266 (contains!6353 Nil!23135 (select (arr!33154 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074991 () Bool)

(declare-fun e!614265 () Bool)

(declare-fun e!614268 () Bool)

(assert (=> b!1074991 (= e!614265 e!614268)))

(declare-fun res!716579 () Bool)

(assert (=> b!1074991 (=> (not res!716579) (not e!614268))))

(assert (=> b!1074991 (= res!716579 (not e!614266))))

(declare-fun res!716578 () Bool)

(assert (=> b!1074991 (=> (not res!716578) (not e!614266))))

(assert (=> b!1074991 (= res!716578 (validKeyInArray!0 (select (arr!33154 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129897 () Bool)

(declare-fun res!716577 () Bool)

(assert (=> d!129897 (=> res!716577 e!614265)))

(assert (=> d!129897 (= res!716577 (bvsge #b00000000000000000000000000000000 (size!33691 _keys!1163)))))

(assert (=> d!129897 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23135) e!614265)))

(declare-fun b!1074992 () Bool)

(assert (=> b!1074992 (= e!614268 e!614267)))

(declare-fun c!108170 () Bool)

(assert (=> b!1074992 (= c!108170 (validKeyInArray!0 (select (arr!33154 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45348 () Bool)

(assert (=> bm!45348 (= call!45351 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108170 (Cons!23134 (select (arr!33154 _keys!1163) #b00000000000000000000000000000000) Nil!23135) Nil!23135)))))

(assert (= (and d!129897 (not res!716577)) b!1074991))

(assert (= (and b!1074991 res!716578) b!1074990))

(assert (= (and b!1074991 res!716579) b!1074992))

(assert (= (and b!1074992 c!108170) b!1074989))

(assert (= (and b!1074992 (not c!108170)) b!1074988))

(assert (= (or b!1074989 b!1074988) bm!45348))

(assert (=> b!1074990 m!994237))

(assert (=> b!1074990 m!994237))

(declare-fun m!994281 () Bool)

(assert (=> b!1074990 m!994281))

(assert (=> b!1074991 m!994237))

(assert (=> b!1074991 m!994237))

(assert (=> b!1074991 m!994259))

(assert (=> b!1074992 m!994237))

(assert (=> b!1074992 m!994237))

(assert (=> b!1074992 m!994259))

(assert (=> bm!45348 m!994237))

(declare-fun m!994283 () Bool)

(assert (=> bm!45348 m!994283))

(assert (=> b!1074880 d!129897))

(declare-fun b!1075001 () Bool)

(declare-fun e!614275 () Bool)

(declare-fun call!45354 () Bool)

(assert (=> b!1075001 (= e!614275 call!45354)))

(declare-fun bm!45351 () Bool)

(assert (=> bm!45351 (= call!45354 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1075003 () Bool)

(declare-fun e!614276 () Bool)

(declare-fun e!614277 () Bool)

(assert (=> b!1075003 (= e!614276 e!614277)))

(declare-fun c!108173 () Bool)

(assert (=> b!1075003 (= c!108173 (validKeyInArray!0 (select (arr!33154 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075004 () Bool)

(assert (=> b!1075004 (= e!614277 e!614275)))

(declare-fun lt!476644 () (_ BitVec 64))

(assert (=> b!1075004 (= lt!476644 (select (arr!33154 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476643 () Unit!35329)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68933 (_ BitVec 64) (_ BitVec 32)) Unit!35329)

(assert (=> b!1075004 (= lt!476643 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!476644 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1075004 (arrayContainsKey!0 _keys!1163 lt!476644 #b00000000000000000000000000000000)))

(declare-fun lt!476642 () Unit!35329)

(assert (=> b!1075004 (= lt!476642 lt!476643)))

(declare-fun res!716584 () Bool)

(declare-datatypes ((SeekEntryResult!9841 0))(
  ( (MissingZero!9841 (index!41735 (_ BitVec 32))) (Found!9841 (index!41736 (_ BitVec 32))) (Intermediate!9841 (undefined!10653 Bool) (index!41737 (_ BitVec 32)) (x!96204 (_ BitVec 32))) (Undefined!9841) (MissingVacant!9841 (index!41738 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68933 (_ BitVec 32)) SeekEntryResult!9841)

(assert (=> b!1075004 (= res!716584 (= (seekEntryOrOpen!0 (select (arr!33154 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9841 #b00000000000000000000000000000000)))))

(assert (=> b!1075004 (=> (not res!716584) (not e!614275))))

(declare-fun b!1075002 () Bool)

(assert (=> b!1075002 (= e!614277 call!45354)))

(declare-fun d!129899 () Bool)

(declare-fun res!716585 () Bool)

(assert (=> d!129899 (=> res!716585 e!614276)))

(assert (=> d!129899 (= res!716585 (bvsge #b00000000000000000000000000000000 (size!33691 _keys!1163)))))

(assert (=> d!129899 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!614276)))

(assert (= (and d!129899 (not res!716585)) b!1075003))

(assert (= (and b!1075003 c!108173) b!1075004))

(assert (= (and b!1075003 (not c!108173)) b!1075002))

(assert (= (and b!1075004 res!716584) b!1075001))

(assert (= (or b!1075001 b!1075002) bm!45351))

(declare-fun m!994285 () Bool)

(assert (=> bm!45351 m!994285))

(assert (=> b!1075003 m!994237))

(assert (=> b!1075003 m!994237))

(assert (=> b!1075003 m!994259))

(assert (=> b!1075004 m!994237))

(declare-fun m!994287 () Bool)

(assert (=> b!1075004 m!994287))

(declare-fun m!994289 () Bool)

(assert (=> b!1075004 m!994289))

(assert (=> b!1075004 m!994237))

(declare-fun m!994291 () Bool)

(assert (=> b!1075004 m!994291))

(assert (=> b!1074881 d!129899))

(declare-fun mapNonEmpty!40666 () Bool)

(declare-fun mapRes!40666 () Bool)

(declare-fun tp!77939 () Bool)

(declare-fun e!614282 () Bool)

(assert (=> mapNonEmpty!40666 (= mapRes!40666 (and tp!77939 e!614282))))

(declare-fun mapKey!40666 () (_ BitVec 32))

(declare-fun mapValue!40666 () ValueCell!12278)

(declare-fun mapRest!40666 () (Array (_ BitVec 32) ValueCell!12278))

(assert (=> mapNonEmpty!40666 (= mapRest!40657 (store mapRest!40666 mapKey!40666 mapValue!40666))))

(declare-fun b!1075012 () Bool)

(declare-fun e!614283 () Bool)

(assert (=> b!1075012 (= e!614283 tp_is_empty!25963)))

(declare-fun b!1075011 () Bool)

(assert (=> b!1075011 (= e!614282 tp_is_empty!25963)))

(declare-fun condMapEmpty!40666 () Bool)

(declare-fun mapDefault!40666 () ValueCell!12278)

(assert (=> mapNonEmpty!40657 (= condMapEmpty!40666 (= mapRest!40657 ((as const (Array (_ BitVec 32) ValueCell!12278)) mapDefault!40666)))))

(assert (=> mapNonEmpty!40657 (= tp!77923 (and e!614283 mapRes!40666))))

(declare-fun mapIsEmpty!40666 () Bool)

(assert (=> mapIsEmpty!40666 mapRes!40666))

(assert (= (and mapNonEmpty!40657 condMapEmpty!40666) mapIsEmpty!40666))

(assert (= (and mapNonEmpty!40657 (not condMapEmpty!40666)) mapNonEmpty!40666))

(assert (= (and mapNonEmpty!40666 ((_ is ValueCellFull!12278) mapValue!40666)) b!1075011))

(assert (= (and mapNonEmpty!40657 ((_ is ValueCellFull!12278) mapDefault!40666)) b!1075012))

(declare-fun m!994293 () Bool)

(assert (=> mapNonEmpty!40666 m!994293))

(declare-fun b_lambda!16743 () Bool)

(assert (= b_lambda!16741 (or (and start!95184 b_free!22153) b_lambda!16743)))

(declare-fun b_lambda!16745 () Bool)

(assert (= b_lambda!16739 (or (and start!95184 b_free!22153) b_lambda!16745)))

(declare-fun b_lambda!16747 () Bool)

(assert (= b_lambda!16737 (or (and start!95184 b_free!22153) b_lambda!16747)))

(declare-fun b_lambda!16749 () Bool)

(assert (= b_lambda!16735 (or (and start!95184 b_free!22153) b_lambda!16749)))

(check-sat (not b!1075004) (not b!1074958) (not b!1074972) (not bm!45345) (not b!1074969) (not b_lambda!16745) (not b_lambda!16747) (not b!1074959) (not b!1074967) (not mapNonEmpty!40666) (not b!1074953) (not b_lambda!16743) (not d!129887) (not b!1074990) (not d!129889) (not b!1074968) (not b!1074992) (not b!1074974) (not b_next!22153) (not b!1074991) (not bm!45351) (not b!1074970) (not b_lambda!16749) (not bm!45348) (not b!1075003) (not b!1074962) (not b!1074960) (not b!1074973) (not b!1074956) (not bm!45344) (not b!1074976) (not b!1074955) tp_is_empty!25963 (not b!1074954) b_and!35029)
(check-sat b_and!35029 (not b_next!22153))
