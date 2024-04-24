; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71508 () Bool)

(assert start!71508)

(declare-fun b_free!13441 () Bool)

(declare-fun b_next!13441 () Bool)

(assert (=> start!71508 (= b_free!13441 (not b_next!13441))))

(declare-fun tp!47095 () Bool)

(declare-fun b_and!22421 () Bool)

(assert (=> start!71508 (= tp!47095 b_and!22421)))

(declare-fun b!829441 () Bool)

(declare-fun res!564901 () Bool)

(declare-fun e!462285 () Bool)

(assert (=> b!829441 (=> (not res!564901) (not e!462285))))

(declare-datatypes ((array!46477 0))(
  ( (array!46478 (arr!22275 (Array (_ BitVec 32) (_ BitVec 64))) (size!22695 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46477)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46477 (_ BitVec 32)) Bool)

(assert (=> b!829441 (= res!564901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!564899 () Bool)

(assert (=> start!71508 (=> (not res!564899) (not e!462285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71508 (= res!564899 (validMask!0 mask!1312))))

(assert (=> start!71508 e!462285))

(declare-fun tp_is_empty!15151 () Bool)

(assert (=> start!71508 tp_is_empty!15151))

(declare-fun array_inv!17791 (array!46477) Bool)

(assert (=> start!71508 (array_inv!17791 _keys!976)))

(assert (=> start!71508 true))

(declare-datatypes ((V!25203 0))(
  ( (V!25204 (val!7623 Int)) )
))
(declare-datatypes ((ValueCell!7160 0))(
  ( (ValueCellFull!7160 (v!10060 V!25203)) (EmptyCell!7160) )
))
(declare-datatypes ((array!46479 0))(
  ( (array!46480 (arr!22276 (Array (_ BitVec 32) ValueCell!7160)) (size!22696 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46479)

(declare-fun e!462281 () Bool)

(declare-fun array_inv!17792 (array!46479) Bool)

(assert (=> start!71508 (and (array_inv!17792 _values!788) e!462281)))

(assert (=> start!71508 tp!47095))

(declare-fun b!829442 () Bool)

(declare-fun e!462288 () Bool)

(assert (=> b!829442 (= e!462288 tp_is_empty!15151)))

(declare-fun mapNonEmpty!24364 () Bool)

(declare-fun mapRes!24364 () Bool)

(declare-fun tp!47094 () Bool)

(assert (=> mapNonEmpty!24364 (= mapRes!24364 (and tp!47094 e!462288))))

(declare-fun mapKey!24364 () (_ BitVec 32))

(declare-fun mapRest!24364 () (Array (_ BitVec 32) ValueCell!7160))

(declare-fun mapValue!24364 () ValueCell!7160)

(assert (=> mapNonEmpty!24364 (= (arr!22276 _values!788) (store mapRest!24364 mapKey!24364 mapValue!24364))))

(declare-fun b!829443 () Bool)

(declare-fun e!462282 () Bool)

(declare-fun e!462284 () Bool)

(assert (=> b!829443 (= e!462282 e!462284)))

(declare-fun res!564903 () Bool)

(assert (=> b!829443 (=> res!564903 e!462284)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!829443 (= res!564903 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!24364 () Bool)

(assert (=> mapIsEmpty!24364 mapRes!24364))

(declare-fun b!829444 () Bool)

(declare-fun res!564898 () Bool)

(assert (=> b!829444 (=> (not res!564898) (not e!462285))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!829444 (= res!564898 (and (= (size!22696 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22695 _keys!976) (size!22696 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!829445 () Bool)

(declare-fun e!462286 () Bool)

(assert (=> b!829445 (= e!462281 (and e!462286 mapRes!24364))))

(declare-fun condMapEmpty!24364 () Bool)

(declare-fun mapDefault!24364 () ValueCell!7160)

(assert (=> b!829445 (= condMapEmpty!24364 (= (arr!22276 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7160)) mapDefault!24364)))))

(declare-fun b!829446 () Bool)

(assert (=> b!829446 (= e!462286 tp_is_empty!15151)))

(declare-fun zeroValueAfter!34 () V!25203)

(declare-fun minValue!754 () V!25203)

(declare-fun e!462283 () Bool)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!10028 0))(
  ( (tuple2!10029 (_1!5025 (_ BitVec 64)) (_2!5025 V!25203)) )
))
(declare-datatypes ((List!15805 0))(
  ( (Nil!15802) (Cons!15801 (h!16936 tuple2!10028) (t!22152 List!15805)) )
))
(declare-datatypes ((ListLongMap!8853 0))(
  ( (ListLongMap!8854 (toList!4442 List!15805)) )
))
(declare-fun lt!375816 () ListLongMap!8853)

(declare-fun b!829447 () Bool)

(declare-fun getCurrentListMap!2538 (array!46477 array!46479 (_ BitVec 32) (_ BitVec 32) V!25203 V!25203 (_ BitVec 32) Int) ListLongMap!8853)

(declare-fun +!1965 (ListLongMap!8853 tuple2!10028) ListLongMap!8853)

(assert (=> b!829447 (= e!462283 (= (getCurrentListMap!2538 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1965 lt!375816 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!829448 () Bool)

(declare-fun res!564897 () Bool)

(assert (=> b!829448 (=> (not res!564897) (not e!462285))))

(declare-datatypes ((List!15806 0))(
  ( (Nil!15803) (Cons!15802 (h!16937 (_ BitVec 64)) (t!22153 List!15806)) )
))
(declare-fun arrayNoDuplicates!0 (array!46477 (_ BitVec 32) List!15806) Bool)

(assert (=> b!829448 (= res!564897 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15803))))

(declare-fun b!829449 () Bool)

(assert (=> b!829449 (= e!462285 (not e!462283))))

(declare-fun res!564900 () Bool)

(assert (=> b!829449 (=> res!564900 e!462283)))

(assert (=> b!829449 (= res!564900 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!829449 e!462282))

(declare-fun res!564902 () Bool)

(assert (=> b!829449 (=> (not res!564902) (not e!462282))))

(declare-fun lt!375817 () ListLongMap!8853)

(assert (=> b!829449 (= res!564902 (= lt!375817 lt!375816))))

(declare-fun zeroValueBefore!34 () V!25203)

(declare-datatypes ((Unit!28400 0))(
  ( (Unit!28401) )
))
(declare-fun lt!375815 () Unit!28400)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!586 (array!46477 array!46479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25203 V!25203 V!25203 V!25203 (_ BitVec 32) Int) Unit!28400)

(assert (=> b!829449 (= lt!375815 (lemmaNoChangeToArrayThenSameMapNoExtras!586 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2519 (array!46477 array!46479 (_ BitVec 32) (_ BitVec 32) V!25203 V!25203 (_ BitVec 32) Int) ListLongMap!8853)

(assert (=> b!829449 (= lt!375816 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829449 (= lt!375817 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829450 () Bool)

(assert (=> b!829450 (= e!462284 (= (getCurrentListMap!2538 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1965 lt!375817 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (= (and start!71508 res!564899) b!829444))

(assert (= (and b!829444 res!564898) b!829441))

(assert (= (and b!829441 res!564901) b!829448))

(assert (= (and b!829448 res!564897) b!829449))

(assert (= (and b!829449 res!564902) b!829443))

(assert (= (and b!829443 (not res!564903)) b!829450))

(assert (= (and b!829449 (not res!564900)) b!829447))

(assert (= (and b!829445 condMapEmpty!24364) mapIsEmpty!24364))

(assert (= (and b!829445 (not condMapEmpty!24364)) mapNonEmpty!24364))

(get-info :version)

(assert (= (and mapNonEmpty!24364 ((_ is ValueCellFull!7160) mapValue!24364)) b!829442))

(assert (= (and b!829445 ((_ is ValueCellFull!7160) mapDefault!24364)) b!829446))

(assert (= start!71508 b!829445))

(declare-fun m!772765 () Bool)

(assert (=> b!829447 m!772765))

(declare-fun m!772767 () Bool)

(assert (=> b!829447 m!772767))

(declare-fun m!772769 () Bool)

(assert (=> mapNonEmpty!24364 m!772769))

(declare-fun m!772771 () Bool)

(assert (=> b!829441 m!772771))

(declare-fun m!772773 () Bool)

(assert (=> b!829448 m!772773))

(declare-fun m!772775 () Bool)

(assert (=> b!829449 m!772775))

(declare-fun m!772777 () Bool)

(assert (=> b!829449 m!772777))

(declare-fun m!772779 () Bool)

(assert (=> b!829449 m!772779))

(declare-fun m!772781 () Bool)

(assert (=> start!71508 m!772781))

(declare-fun m!772783 () Bool)

(assert (=> start!71508 m!772783))

(declare-fun m!772785 () Bool)

(assert (=> start!71508 m!772785))

(declare-fun m!772787 () Bool)

(assert (=> b!829450 m!772787))

(declare-fun m!772789 () Bool)

(assert (=> b!829450 m!772789))

(check-sat (not b!829441) (not b!829447) (not mapNonEmpty!24364) (not start!71508) (not b_next!13441) (not b!829450) b_and!22421 (not b!829449) tp_is_empty!15151 (not b!829448))
(check-sat b_and!22421 (not b_next!13441))
(get-model)

(declare-fun d!105515 () Bool)

(assert (=> d!105515 (= (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375838 () Unit!28400)

(declare-fun choose!1417 (array!46477 array!46479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25203 V!25203 V!25203 V!25203 (_ BitVec 32) Int) Unit!28400)

(assert (=> d!105515 (= lt!375838 (choose!1417 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105515 (validMask!0 mask!1312)))

(assert (=> d!105515 (= (lemmaNoChangeToArrayThenSameMapNoExtras!586 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375838)))

(declare-fun bs!23166 () Bool)

(assert (= bs!23166 d!105515))

(assert (=> bs!23166 m!772779))

(assert (=> bs!23166 m!772777))

(declare-fun m!772843 () Bool)

(assert (=> bs!23166 m!772843))

(assert (=> bs!23166 m!772781))

(assert (=> b!829449 d!105515))

(declare-fun d!105517 () Bool)

(declare-fun e!462355 () Bool)

(assert (=> d!105517 e!462355))

(declare-fun res!564954 () Bool)

(assert (=> d!105517 (=> (not res!564954) (not e!462355))))

(declare-fun lt!375858 () ListLongMap!8853)

(declare-fun contains!4171 (ListLongMap!8853 (_ BitVec 64)) Bool)

(assert (=> d!105517 (= res!564954 (not (contains!4171 lt!375858 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!462353 () ListLongMap!8853)

(assert (=> d!105517 (= lt!375858 e!462353)))

(declare-fun c!89922 () Bool)

(assert (=> d!105517 (= c!89922 (bvsge #b00000000000000000000000000000000 (size!22695 _keys!976)))))

(assert (=> d!105517 (validMask!0 mask!1312)))

(assert (=> d!105517 (= (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375858)))

(declare-fun b!829535 () Bool)

(declare-fun e!462356 () Bool)

(declare-fun e!462351 () Bool)

(assert (=> b!829535 (= e!462356 e!462351)))

(assert (=> b!829535 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22695 _keys!976)))))

(declare-fun res!564956 () Bool)

(assert (=> b!829535 (= res!564956 (contains!4171 lt!375858 (select (arr!22275 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829535 (=> (not res!564956) (not e!462351))))

(declare-fun bm!36077 () Bool)

(declare-fun call!36080 () ListLongMap!8853)

(assert (=> bm!36077 (= call!36080 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!829536 () Bool)

(declare-fun e!462354 () Bool)

(declare-fun isEmpty!655 (ListLongMap!8853) Bool)

(assert (=> b!829536 (= e!462354 (isEmpty!655 lt!375858))))

(declare-fun b!829537 () Bool)

(declare-fun lt!375854 () Unit!28400)

(declare-fun lt!375853 () Unit!28400)

(assert (=> b!829537 (= lt!375854 lt!375853)))

(declare-fun lt!375856 () (_ BitVec 64))

(declare-fun lt!375859 () V!25203)

(declare-fun lt!375857 () ListLongMap!8853)

(declare-fun lt!375855 () (_ BitVec 64))

(assert (=> b!829537 (not (contains!4171 (+!1965 lt!375857 (tuple2!10029 lt!375856 lt!375859)) lt!375855))))

(declare-fun addStillNotContains!194 (ListLongMap!8853 (_ BitVec 64) V!25203 (_ BitVec 64)) Unit!28400)

(assert (=> b!829537 (= lt!375853 (addStillNotContains!194 lt!375857 lt!375856 lt!375859 lt!375855))))

(assert (=> b!829537 (= lt!375855 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11797 (ValueCell!7160 V!25203) V!25203)

(declare-fun dynLambda!975 (Int (_ BitVec 64)) V!25203)

(assert (=> b!829537 (= lt!375859 (get!11797 (select (arr!22276 _values!788) #b00000000000000000000000000000000) (dynLambda!975 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!829537 (= lt!375856 (select (arr!22275 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829537 (= lt!375857 call!36080)))

(declare-fun e!462352 () ListLongMap!8853)

(assert (=> b!829537 (= e!462352 (+!1965 call!36080 (tuple2!10029 (select (arr!22275 _keys!976) #b00000000000000000000000000000000) (get!11797 (select (arr!22276 _values!788) #b00000000000000000000000000000000) (dynLambda!975 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!829538 () Bool)

(assert (=> b!829538 (= e!462352 call!36080)))

(declare-fun b!829539 () Bool)

(declare-fun e!462357 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!829539 (= e!462357 (validKeyInArray!0 (select (arr!22275 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829539 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!829540 () Bool)

(assert (=> b!829540 (= e!462355 e!462356)))

(declare-fun c!89924 () Bool)

(assert (=> b!829540 (= c!89924 e!462357)))

(declare-fun res!564955 () Bool)

(assert (=> b!829540 (=> (not res!564955) (not e!462357))))

(assert (=> b!829540 (= res!564955 (bvslt #b00000000000000000000000000000000 (size!22695 _keys!976)))))

(declare-fun b!829541 () Bool)

(assert (=> b!829541 (= e!462353 e!462352)))

(declare-fun c!89925 () Bool)

(assert (=> b!829541 (= c!89925 (validKeyInArray!0 (select (arr!22275 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829542 () Bool)

(declare-fun res!564957 () Bool)

(assert (=> b!829542 (=> (not res!564957) (not e!462355))))

(assert (=> b!829542 (= res!564957 (not (contains!4171 lt!375858 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!829543 () Bool)

(assert (=> b!829543 (= e!462356 e!462354)))

(declare-fun c!89923 () Bool)

(assert (=> b!829543 (= c!89923 (bvslt #b00000000000000000000000000000000 (size!22695 _keys!976)))))

(declare-fun b!829544 () Bool)

(assert (=> b!829544 (= e!462354 (= lt!375858 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!829545 () Bool)

(assert (=> b!829545 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22695 _keys!976)))))

(assert (=> b!829545 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22696 _values!788)))))

(declare-fun apply!367 (ListLongMap!8853 (_ BitVec 64)) V!25203)

(assert (=> b!829545 (= e!462351 (= (apply!367 lt!375858 (select (arr!22275 _keys!976) #b00000000000000000000000000000000)) (get!11797 (select (arr!22276 _values!788) #b00000000000000000000000000000000) (dynLambda!975 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!829546 () Bool)

(assert (=> b!829546 (= e!462353 (ListLongMap!8854 Nil!15802))))

(assert (= (and d!105517 c!89922) b!829546))

(assert (= (and d!105517 (not c!89922)) b!829541))

(assert (= (and b!829541 c!89925) b!829537))

(assert (= (and b!829541 (not c!89925)) b!829538))

(assert (= (or b!829537 b!829538) bm!36077))

(assert (= (and d!105517 res!564954) b!829542))

(assert (= (and b!829542 res!564957) b!829540))

(assert (= (and b!829540 res!564955) b!829539))

(assert (= (and b!829540 c!89924) b!829535))

(assert (= (and b!829540 (not c!89924)) b!829543))

(assert (= (and b!829535 res!564956) b!829545))

(assert (= (and b!829543 c!89923) b!829544))

(assert (= (and b!829543 (not c!89923)) b!829536))

(declare-fun b_lambda!11241 () Bool)

(assert (=> (not b_lambda!11241) (not b!829537)))

(declare-fun t!22158 () Bool)

(declare-fun tb!4207 () Bool)

(assert (=> (and start!71508 (= defaultEntry!796 defaultEntry!796) t!22158) tb!4207))

(declare-fun result!7977 () Bool)

(assert (=> tb!4207 (= result!7977 tp_is_empty!15151)))

(assert (=> b!829537 t!22158))

(declare-fun b_and!22427 () Bool)

(assert (= b_and!22421 (and (=> t!22158 result!7977) b_and!22427)))

(declare-fun b_lambda!11243 () Bool)

(assert (=> (not b_lambda!11243) (not b!829545)))

(assert (=> b!829545 t!22158))

(declare-fun b_and!22429 () Bool)

(assert (= b_and!22427 (and (=> t!22158 result!7977) b_and!22429)))

(declare-fun m!772845 () Bool)

(assert (=> b!829535 m!772845))

(assert (=> b!829535 m!772845))

(declare-fun m!772847 () Bool)

(assert (=> b!829535 m!772847))

(declare-fun m!772849 () Bool)

(assert (=> b!829542 m!772849))

(declare-fun m!772851 () Bool)

(assert (=> b!829544 m!772851))

(assert (=> b!829541 m!772845))

(assert (=> b!829541 m!772845))

(declare-fun m!772853 () Bool)

(assert (=> b!829541 m!772853))

(assert (=> b!829539 m!772845))

(assert (=> b!829539 m!772845))

(assert (=> b!829539 m!772853))

(assert (=> bm!36077 m!772851))

(declare-fun m!772855 () Bool)

(assert (=> d!105517 m!772855))

(assert (=> d!105517 m!772781))

(assert (=> b!829545 m!772845))

(declare-fun m!772857 () Bool)

(assert (=> b!829545 m!772857))

(declare-fun m!772859 () Bool)

(assert (=> b!829545 m!772859))

(declare-fun m!772861 () Bool)

(assert (=> b!829545 m!772861))

(declare-fun m!772863 () Bool)

(assert (=> b!829545 m!772863))

(assert (=> b!829545 m!772859))

(assert (=> b!829545 m!772845))

(assert (=> b!829545 m!772861))

(declare-fun m!772865 () Bool)

(assert (=> b!829536 m!772865))

(declare-fun m!772867 () Bool)

(assert (=> b!829537 m!772867))

(declare-fun m!772869 () Bool)

(assert (=> b!829537 m!772869))

(assert (=> b!829537 m!772859))

(assert (=> b!829537 m!772861))

(assert (=> b!829537 m!772863))

(assert (=> b!829537 m!772867))

(declare-fun m!772871 () Bool)

(assert (=> b!829537 m!772871))

(assert (=> b!829537 m!772859))

(declare-fun m!772873 () Bool)

(assert (=> b!829537 m!772873))

(assert (=> b!829537 m!772845))

(assert (=> b!829537 m!772861))

(assert (=> b!829449 d!105517))

(declare-fun d!105519 () Bool)

(declare-fun e!462362 () Bool)

(assert (=> d!105519 e!462362))

(declare-fun res!564958 () Bool)

(assert (=> d!105519 (=> (not res!564958) (not e!462362))))

(declare-fun lt!375865 () ListLongMap!8853)

(assert (=> d!105519 (= res!564958 (not (contains!4171 lt!375865 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!462360 () ListLongMap!8853)

(assert (=> d!105519 (= lt!375865 e!462360)))

(declare-fun c!89926 () Bool)

(assert (=> d!105519 (= c!89926 (bvsge #b00000000000000000000000000000000 (size!22695 _keys!976)))))

(assert (=> d!105519 (validMask!0 mask!1312)))

(assert (=> d!105519 (= (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375865)))

(declare-fun b!829549 () Bool)

(declare-fun e!462363 () Bool)

(declare-fun e!462358 () Bool)

(assert (=> b!829549 (= e!462363 e!462358)))

(assert (=> b!829549 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22695 _keys!976)))))

(declare-fun res!564960 () Bool)

(assert (=> b!829549 (= res!564960 (contains!4171 lt!375865 (select (arr!22275 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829549 (=> (not res!564960) (not e!462358))))

(declare-fun call!36081 () ListLongMap!8853)

(declare-fun bm!36078 () Bool)

(assert (=> bm!36078 (= call!36081 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!829550 () Bool)

(declare-fun e!462361 () Bool)

(assert (=> b!829550 (= e!462361 (isEmpty!655 lt!375865))))

(declare-fun b!829551 () Bool)

(declare-fun lt!375861 () Unit!28400)

(declare-fun lt!375860 () Unit!28400)

(assert (=> b!829551 (= lt!375861 lt!375860)))

(declare-fun lt!375863 () (_ BitVec 64))

(declare-fun lt!375862 () (_ BitVec 64))

(declare-fun lt!375866 () V!25203)

(declare-fun lt!375864 () ListLongMap!8853)

(assert (=> b!829551 (not (contains!4171 (+!1965 lt!375864 (tuple2!10029 lt!375863 lt!375866)) lt!375862))))

(assert (=> b!829551 (= lt!375860 (addStillNotContains!194 lt!375864 lt!375863 lt!375866 lt!375862))))

(assert (=> b!829551 (= lt!375862 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!829551 (= lt!375866 (get!11797 (select (arr!22276 _values!788) #b00000000000000000000000000000000) (dynLambda!975 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!829551 (= lt!375863 (select (arr!22275 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829551 (= lt!375864 call!36081)))

(declare-fun e!462359 () ListLongMap!8853)

(assert (=> b!829551 (= e!462359 (+!1965 call!36081 (tuple2!10029 (select (arr!22275 _keys!976) #b00000000000000000000000000000000) (get!11797 (select (arr!22276 _values!788) #b00000000000000000000000000000000) (dynLambda!975 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!829552 () Bool)

(assert (=> b!829552 (= e!462359 call!36081)))

(declare-fun b!829553 () Bool)

(declare-fun e!462364 () Bool)

(assert (=> b!829553 (= e!462364 (validKeyInArray!0 (select (arr!22275 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829553 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!829554 () Bool)

(assert (=> b!829554 (= e!462362 e!462363)))

(declare-fun c!89928 () Bool)

(assert (=> b!829554 (= c!89928 e!462364)))

(declare-fun res!564959 () Bool)

(assert (=> b!829554 (=> (not res!564959) (not e!462364))))

(assert (=> b!829554 (= res!564959 (bvslt #b00000000000000000000000000000000 (size!22695 _keys!976)))))

(declare-fun b!829555 () Bool)

(assert (=> b!829555 (= e!462360 e!462359)))

(declare-fun c!89929 () Bool)

(assert (=> b!829555 (= c!89929 (validKeyInArray!0 (select (arr!22275 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829556 () Bool)

(declare-fun res!564961 () Bool)

(assert (=> b!829556 (=> (not res!564961) (not e!462362))))

(assert (=> b!829556 (= res!564961 (not (contains!4171 lt!375865 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!829557 () Bool)

(assert (=> b!829557 (= e!462363 e!462361)))

(declare-fun c!89927 () Bool)

(assert (=> b!829557 (= c!89927 (bvslt #b00000000000000000000000000000000 (size!22695 _keys!976)))))

(declare-fun b!829558 () Bool)

(assert (=> b!829558 (= e!462361 (= lt!375865 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!829559 () Bool)

(assert (=> b!829559 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22695 _keys!976)))))

(assert (=> b!829559 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22696 _values!788)))))

(assert (=> b!829559 (= e!462358 (= (apply!367 lt!375865 (select (arr!22275 _keys!976) #b00000000000000000000000000000000)) (get!11797 (select (arr!22276 _values!788) #b00000000000000000000000000000000) (dynLambda!975 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!829560 () Bool)

(assert (=> b!829560 (= e!462360 (ListLongMap!8854 Nil!15802))))

(assert (= (and d!105519 c!89926) b!829560))

(assert (= (and d!105519 (not c!89926)) b!829555))

(assert (= (and b!829555 c!89929) b!829551))

(assert (= (and b!829555 (not c!89929)) b!829552))

(assert (= (or b!829551 b!829552) bm!36078))

(assert (= (and d!105519 res!564958) b!829556))

(assert (= (and b!829556 res!564961) b!829554))

(assert (= (and b!829554 res!564959) b!829553))

(assert (= (and b!829554 c!89928) b!829549))

(assert (= (and b!829554 (not c!89928)) b!829557))

(assert (= (and b!829549 res!564960) b!829559))

(assert (= (and b!829557 c!89927) b!829558))

(assert (= (and b!829557 (not c!89927)) b!829550))

(declare-fun b_lambda!11245 () Bool)

(assert (=> (not b_lambda!11245) (not b!829551)))

(assert (=> b!829551 t!22158))

(declare-fun b_and!22431 () Bool)

(assert (= b_and!22429 (and (=> t!22158 result!7977) b_and!22431)))

(declare-fun b_lambda!11247 () Bool)

(assert (=> (not b_lambda!11247) (not b!829559)))

(assert (=> b!829559 t!22158))

(declare-fun b_and!22433 () Bool)

(assert (= b_and!22431 (and (=> t!22158 result!7977) b_and!22433)))

(assert (=> b!829549 m!772845))

(assert (=> b!829549 m!772845))

(declare-fun m!772875 () Bool)

(assert (=> b!829549 m!772875))

(declare-fun m!772877 () Bool)

(assert (=> b!829556 m!772877))

(declare-fun m!772879 () Bool)

(assert (=> b!829558 m!772879))

(assert (=> b!829555 m!772845))

(assert (=> b!829555 m!772845))

(assert (=> b!829555 m!772853))

(assert (=> b!829553 m!772845))

(assert (=> b!829553 m!772845))

(assert (=> b!829553 m!772853))

(assert (=> bm!36078 m!772879))

(declare-fun m!772881 () Bool)

(assert (=> d!105519 m!772881))

(assert (=> d!105519 m!772781))

(assert (=> b!829559 m!772845))

(declare-fun m!772883 () Bool)

(assert (=> b!829559 m!772883))

(assert (=> b!829559 m!772859))

(assert (=> b!829559 m!772861))

(assert (=> b!829559 m!772863))

(assert (=> b!829559 m!772859))

(assert (=> b!829559 m!772845))

(assert (=> b!829559 m!772861))

(declare-fun m!772885 () Bool)

(assert (=> b!829550 m!772885))

(declare-fun m!772887 () Bool)

(assert (=> b!829551 m!772887))

(declare-fun m!772889 () Bool)

(assert (=> b!829551 m!772889))

(assert (=> b!829551 m!772859))

(assert (=> b!829551 m!772861))

(assert (=> b!829551 m!772863))

(assert (=> b!829551 m!772887))

(declare-fun m!772891 () Bool)

(assert (=> b!829551 m!772891))

(assert (=> b!829551 m!772859))

(declare-fun m!772893 () Bool)

(assert (=> b!829551 m!772893))

(assert (=> b!829551 m!772845))

(assert (=> b!829551 m!772861))

(assert (=> b!829449 d!105519))

(declare-fun b!829571 () Bool)

(declare-fun e!462376 () Bool)

(declare-fun call!36084 () Bool)

(assert (=> b!829571 (= e!462376 call!36084)))

(declare-fun b!829572 () Bool)

(declare-fun e!462373 () Bool)

(declare-fun contains!4172 (List!15806 (_ BitVec 64)) Bool)

(assert (=> b!829572 (= e!462373 (contains!4172 Nil!15803 (select (arr!22275 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829573 () Bool)

(declare-fun e!462374 () Bool)

(assert (=> b!829573 (= e!462374 e!462376)))

(declare-fun c!89932 () Bool)

(assert (=> b!829573 (= c!89932 (validKeyInArray!0 (select (arr!22275 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829574 () Bool)

(assert (=> b!829574 (= e!462376 call!36084)))

(declare-fun bm!36081 () Bool)

(assert (=> bm!36081 (= call!36084 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89932 (Cons!15802 (select (arr!22275 _keys!976) #b00000000000000000000000000000000) Nil!15803) Nil!15803)))))

(declare-fun b!829575 () Bool)

(declare-fun e!462375 () Bool)

(assert (=> b!829575 (= e!462375 e!462374)))

(declare-fun res!564970 () Bool)

(assert (=> b!829575 (=> (not res!564970) (not e!462374))))

(assert (=> b!829575 (= res!564970 (not e!462373))))

(declare-fun res!564968 () Bool)

(assert (=> b!829575 (=> (not res!564968) (not e!462373))))

(assert (=> b!829575 (= res!564968 (validKeyInArray!0 (select (arr!22275 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105521 () Bool)

(declare-fun res!564969 () Bool)

(assert (=> d!105521 (=> res!564969 e!462375)))

(assert (=> d!105521 (= res!564969 (bvsge #b00000000000000000000000000000000 (size!22695 _keys!976)))))

(assert (=> d!105521 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15803) e!462375)))

(assert (= (and d!105521 (not res!564969)) b!829575))

(assert (= (and b!829575 res!564968) b!829572))

(assert (= (and b!829575 res!564970) b!829573))

(assert (= (and b!829573 c!89932) b!829571))

(assert (= (and b!829573 (not c!89932)) b!829574))

(assert (= (or b!829571 b!829574) bm!36081))

(assert (=> b!829572 m!772845))

(assert (=> b!829572 m!772845))

(declare-fun m!772895 () Bool)

(assert (=> b!829572 m!772895))

(assert (=> b!829573 m!772845))

(assert (=> b!829573 m!772845))

(assert (=> b!829573 m!772853))

(assert (=> bm!36081 m!772845))

(declare-fun m!772897 () Bool)

(assert (=> bm!36081 m!772897))

(assert (=> b!829575 m!772845))

(assert (=> b!829575 m!772845))

(assert (=> b!829575 m!772853))

(assert (=> b!829448 d!105521))

(declare-fun b!829618 () Bool)

(declare-fun e!462413 () ListLongMap!8853)

(declare-fun e!462404 () ListLongMap!8853)

(assert (=> b!829618 (= e!462413 e!462404)))

(declare-fun c!89949 () Bool)

(assert (=> b!829618 (= c!89949 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!36102 () ListLongMap!8853)

(declare-fun bm!36096 () Bool)

(assert (=> bm!36096 (= call!36102 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829619 () Bool)

(declare-fun res!564989 () Bool)

(declare-fun e!462415 () Bool)

(assert (=> b!829619 (=> (not res!564989) (not e!462415))))

(declare-fun e!462406 () Bool)

(assert (=> b!829619 (= res!564989 e!462406)))

(declare-fun c!89950 () Bool)

(assert (=> b!829619 (= c!89950 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!829620 () Bool)

(declare-fun e!462411 () Bool)

(declare-fun e!462403 () Bool)

(assert (=> b!829620 (= e!462411 e!462403)))

(declare-fun res!564995 () Bool)

(assert (=> b!829620 (=> (not res!564995) (not e!462403))))

(declare-fun lt!375916 () ListLongMap!8853)

(assert (=> b!829620 (= res!564995 (contains!4171 lt!375916 (select (arr!22275 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829620 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22695 _keys!976)))))

(declare-fun b!829621 () Bool)

(declare-fun c!89948 () Bool)

(assert (=> b!829621 (= c!89948 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!462408 () ListLongMap!8853)

(assert (=> b!829621 (= e!462404 e!462408)))

(declare-fun b!829622 () Bool)

(declare-fun e!462407 () Bool)

(assert (=> b!829622 (= e!462407 (= (apply!367 lt!375916 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!829623 () Bool)

(declare-fun e!462414 () Bool)

(assert (=> b!829623 (= e!462414 (= (apply!367 lt!375916 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!829624 () Bool)

(declare-fun res!564991 () Bool)

(assert (=> b!829624 (=> (not res!564991) (not e!462415))))

(assert (=> b!829624 (= res!564991 e!462411)))

(declare-fun res!564996 () Bool)

(assert (=> b!829624 (=> res!564996 e!462411)))

(declare-fun e!462412 () Bool)

(assert (=> b!829624 (= res!564996 (not e!462412))))

(declare-fun res!564990 () Bool)

(assert (=> b!829624 (=> (not res!564990) (not e!462412))))

(assert (=> b!829624 (= res!564990 (bvslt #b00000000000000000000000000000000 (size!22695 _keys!976)))))

(declare-fun call!36103 () ListLongMap!8853)

(declare-fun call!36099 () ListLongMap!8853)

(declare-fun c!89945 () Bool)

(declare-fun call!36101 () ListLongMap!8853)

(declare-fun bm!36097 () Bool)

(assert (=> bm!36097 (= call!36103 (+!1965 (ite c!89945 call!36102 (ite c!89949 call!36099 call!36101)) (ite (or c!89945 c!89949) (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!829625 () Bool)

(declare-fun e!462405 () Unit!28400)

(declare-fun lt!375924 () Unit!28400)

(assert (=> b!829625 (= e!462405 lt!375924)))

(declare-fun lt!375913 () ListLongMap!8853)

(assert (=> b!829625 (= lt!375913 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375931 () (_ BitVec 64))

(assert (=> b!829625 (= lt!375931 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375920 () (_ BitVec 64))

(assert (=> b!829625 (= lt!375920 (select (arr!22275 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375929 () Unit!28400)

(declare-fun addStillContains!318 (ListLongMap!8853 (_ BitVec 64) V!25203 (_ BitVec 64)) Unit!28400)

(assert (=> b!829625 (= lt!375929 (addStillContains!318 lt!375913 lt!375931 zeroValueBefore!34 lt!375920))))

(assert (=> b!829625 (contains!4171 (+!1965 lt!375913 (tuple2!10029 lt!375931 zeroValueBefore!34)) lt!375920)))

(declare-fun lt!375927 () Unit!28400)

(assert (=> b!829625 (= lt!375927 lt!375929)))

(declare-fun lt!375918 () ListLongMap!8853)

(assert (=> b!829625 (= lt!375918 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375914 () (_ BitVec 64))

(assert (=> b!829625 (= lt!375914 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375923 () (_ BitVec 64))

(assert (=> b!829625 (= lt!375923 (select (arr!22275 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375926 () Unit!28400)

(declare-fun addApplyDifferent!318 (ListLongMap!8853 (_ BitVec 64) V!25203 (_ BitVec 64)) Unit!28400)

(assert (=> b!829625 (= lt!375926 (addApplyDifferent!318 lt!375918 lt!375914 minValue!754 lt!375923))))

(assert (=> b!829625 (= (apply!367 (+!1965 lt!375918 (tuple2!10029 lt!375914 minValue!754)) lt!375923) (apply!367 lt!375918 lt!375923))))

(declare-fun lt!375928 () Unit!28400)

(assert (=> b!829625 (= lt!375928 lt!375926)))

(declare-fun lt!375917 () ListLongMap!8853)

(assert (=> b!829625 (= lt!375917 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375911 () (_ BitVec 64))

(assert (=> b!829625 (= lt!375911 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375915 () (_ BitVec 64))

(assert (=> b!829625 (= lt!375915 (select (arr!22275 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375912 () Unit!28400)

(assert (=> b!829625 (= lt!375912 (addApplyDifferent!318 lt!375917 lt!375911 zeroValueBefore!34 lt!375915))))

(assert (=> b!829625 (= (apply!367 (+!1965 lt!375917 (tuple2!10029 lt!375911 zeroValueBefore!34)) lt!375915) (apply!367 lt!375917 lt!375915))))

(declare-fun lt!375925 () Unit!28400)

(assert (=> b!829625 (= lt!375925 lt!375912)))

(declare-fun lt!375919 () ListLongMap!8853)

(assert (=> b!829625 (= lt!375919 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375921 () (_ BitVec 64))

(assert (=> b!829625 (= lt!375921 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375932 () (_ BitVec 64))

(assert (=> b!829625 (= lt!375932 (select (arr!22275 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829625 (= lt!375924 (addApplyDifferent!318 lt!375919 lt!375921 minValue!754 lt!375932))))

(assert (=> b!829625 (= (apply!367 (+!1965 lt!375919 (tuple2!10029 lt!375921 minValue!754)) lt!375932) (apply!367 lt!375919 lt!375932))))

(declare-fun b!829626 () Bool)

(assert (=> b!829626 (= e!462413 (+!1965 call!36103 (tuple2!10029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!36098 () Bool)

(declare-fun call!36100 () Bool)

(assert (=> bm!36098 (= call!36100 (contains!4171 lt!375916 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829628 () Bool)

(declare-fun e!462409 () Bool)

(assert (=> b!829628 (= e!462409 (validKeyInArray!0 (select (arr!22275 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36099 () Bool)

(assert (=> bm!36099 (= call!36101 call!36099)))

(declare-fun b!829629 () Bool)

(assert (=> b!829629 (= e!462412 (validKeyInArray!0 (select (arr!22275 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829630 () Bool)

(declare-fun call!36105 () ListLongMap!8853)

(assert (=> b!829630 (= e!462408 call!36105)))

(declare-fun b!829631 () Bool)

(assert (=> b!829631 (= e!462408 call!36101)))

(declare-fun b!829632 () Bool)

(assert (=> b!829632 (= e!462404 call!36105)))

(declare-fun bm!36100 () Bool)

(declare-fun call!36104 () Bool)

(assert (=> bm!36100 (= call!36104 (contains!4171 lt!375916 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829633 () Bool)

(declare-fun e!462410 () Bool)

(assert (=> b!829633 (= e!462415 e!462410)))

(declare-fun c!89947 () Bool)

(assert (=> b!829633 (= c!89947 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!829634 () Bool)

(assert (=> b!829634 (= e!462410 e!462407)))

(declare-fun res!564997 () Bool)

(assert (=> b!829634 (= res!564997 call!36104)))

(assert (=> b!829634 (=> (not res!564997) (not e!462407))))

(declare-fun bm!36101 () Bool)

(assert (=> bm!36101 (= call!36099 call!36102)))

(declare-fun b!829635 () Bool)

(assert (=> b!829635 (= e!462406 (not call!36100))))

(declare-fun bm!36102 () Bool)

(assert (=> bm!36102 (= call!36105 call!36103)))

(declare-fun b!829636 () Bool)

(assert (=> b!829636 (= e!462406 e!462414)))

(declare-fun res!564994 () Bool)

(assert (=> b!829636 (= res!564994 call!36100)))

(assert (=> b!829636 (=> (not res!564994) (not e!462414))))

(declare-fun b!829637 () Bool)

(assert (=> b!829637 (= e!462403 (= (apply!367 lt!375916 (select (arr!22275 _keys!976) #b00000000000000000000000000000000)) (get!11797 (select (arr!22276 _values!788) #b00000000000000000000000000000000) (dynLambda!975 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!829637 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22696 _values!788)))))

(assert (=> b!829637 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22695 _keys!976)))))

(declare-fun b!829638 () Bool)

(declare-fun Unit!28404 () Unit!28400)

(assert (=> b!829638 (= e!462405 Unit!28404)))

(declare-fun d!105523 () Bool)

(assert (=> d!105523 e!462415))

(declare-fun res!564993 () Bool)

(assert (=> d!105523 (=> (not res!564993) (not e!462415))))

(assert (=> d!105523 (= res!564993 (or (bvsge #b00000000000000000000000000000000 (size!22695 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22695 _keys!976)))))))

(declare-fun lt!375922 () ListLongMap!8853)

(assert (=> d!105523 (= lt!375916 lt!375922)))

(declare-fun lt!375930 () Unit!28400)

(assert (=> d!105523 (= lt!375930 e!462405)))

(declare-fun c!89946 () Bool)

(assert (=> d!105523 (= c!89946 e!462409)))

(declare-fun res!564992 () Bool)

(assert (=> d!105523 (=> (not res!564992) (not e!462409))))

(assert (=> d!105523 (= res!564992 (bvslt #b00000000000000000000000000000000 (size!22695 _keys!976)))))

(assert (=> d!105523 (= lt!375922 e!462413)))

(assert (=> d!105523 (= c!89945 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105523 (validMask!0 mask!1312)))

(assert (=> d!105523 (= (getCurrentListMap!2538 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375916)))

(declare-fun b!829627 () Bool)

(assert (=> b!829627 (= e!462410 (not call!36104))))

(assert (= (and d!105523 c!89945) b!829626))

(assert (= (and d!105523 (not c!89945)) b!829618))

(assert (= (and b!829618 c!89949) b!829632))

(assert (= (and b!829618 (not c!89949)) b!829621))

(assert (= (and b!829621 c!89948) b!829630))

(assert (= (and b!829621 (not c!89948)) b!829631))

(assert (= (or b!829630 b!829631) bm!36099))

(assert (= (or b!829632 bm!36099) bm!36101))

(assert (= (or b!829632 b!829630) bm!36102))

(assert (= (or b!829626 bm!36101) bm!36096))

(assert (= (or b!829626 bm!36102) bm!36097))

(assert (= (and d!105523 res!564992) b!829628))

(assert (= (and d!105523 c!89946) b!829625))

(assert (= (and d!105523 (not c!89946)) b!829638))

(assert (= (and d!105523 res!564993) b!829624))

(assert (= (and b!829624 res!564990) b!829629))

(assert (= (and b!829624 (not res!564996)) b!829620))

(assert (= (and b!829620 res!564995) b!829637))

(assert (= (and b!829624 res!564991) b!829619))

(assert (= (and b!829619 c!89950) b!829636))

(assert (= (and b!829619 (not c!89950)) b!829635))

(assert (= (and b!829636 res!564994) b!829623))

(assert (= (or b!829636 b!829635) bm!36098))

(assert (= (and b!829619 res!564989) b!829633))

(assert (= (and b!829633 c!89947) b!829634))

(assert (= (and b!829633 (not c!89947)) b!829627))

(assert (= (and b!829634 res!564997) b!829622))

(assert (= (or b!829634 b!829627) bm!36100))

(declare-fun b_lambda!11249 () Bool)

(assert (=> (not b_lambda!11249) (not b!829637)))

(assert (=> b!829637 t!22158))

(declare-fun b_and!22435 () Bool)

(assert (= b_and!22433 (and (=> t!22158 result!7977) b_and!22435)))

(assert (=> b!829620 m!772845))

(assert (=> b!829620 m!772845))

(declare-fun m!772899 () Bool)

(assert (=> b!829620 m!772899))

(assert (=> bm!36096 m!772779))

(declare-fun m!772901 () Bool)

(assert (=> b!829625 m!772901))

(declare-fun m!772903 () Bool)

(assert (=> b!829625 m!772903))

(declare-fun m!772905 () Bool)

(assert (=> b!829625 m!772905))

(assert (=> b!829625 m!772845))

(declare-fun m!772907 () Bool)

(assert (=> b!829625 m!772907))

(declare-fun m!772909 () Bool)

(assert (=> b!829625 m!772909))

(declare-fun m!772911 () Bool)

(assert (=> b!829625 m!772911))

(assert (=> b!829625 m!772901))

(assert (=> b!829625 m!772911))

(declare-fun m!772913 () Bool)

(assert (=> b!829625 m!772913))

(declare-fun m!772915 () Bool)

(assert (=> b!829625 m!772915))

(declare-fun m!772917 () Bool)

(assert (=> b!829625 m!772917))

(assert (=> b!829625 m!772915))

(declare-fun m!772919 () Bool)

(assert (=> b!829625 m!772919))

(declare-fun m!772921 () Bool)

(assert (=> b!829625 m!772921))

(declare-fun m!772923 () Bool)

(assert (=> b!829625 m!772923))

(declare-fun m!772925 () Bool)

(assert (=> b!829625 m!772925))

(assert (=> b!829625 m!772779))

(declare-fun m!772927 () Bool)

(assert (=> b!829625 m!772927))

(assert (=> b!829625 m!772923))

(declare-fun m!772929 () Bool)

(assert (=> b!829625 m!772929))

(assert (=> b!829628 m!772845))

(assert (=> b!829628 m!772845))

(assert (=> b!829628 m!772853))

(declare-fun m!772931 () Bool)

(assert (=> bm!36100 m!772931))

(declare-fun m!772933 () Bool)

(assert (=> b!829623 m!772933))

(declare-fun m!772935 () Bool)

(assert (=> b!829622 m!772935))

(declare-fun m!772937 () Bool)

(assert (=> bm!36098 m!772937))

(declare-fun m!772939 () Bool)

(assert (=> b!829626 m!772939))

(declare-fun m!772941 () Bool)

(assert (=> bm!36097 m!772941))

(assert (=> b!829629 m!772845))

(assert (=> b!829629 m!772845))

(assert (=> b!829629 m!772853))

(assert (=> b!829637 m!772859))

(assert (=> b!829637 m!772861))

(assert (=> b!829637 m!772863))

(assert (=> b!829637 m!772861))

(assert (=> b!829637 m!772845))

(assert (=> b!829637 m!772859))

(assert (=> b!829637 m!772845))

(declare-fun m!772943 () Bool)

(assert (=> b!829637 m!772943))

(assert (=> d!105523 m!772781))

(assert (=> b!829450 d!105523))

(declare-fun d!105525 () Bool)

(declare-fun e!462418 () Bool)

(assert (=> d!105525 e!462418))

(declare-fun res!565002 () Bool)

(assert (=> d!105525 (=> (not res!565002) (not e!462418))))

(declare-fun lt!375942 () ListLongMap!8853)

(assert (=> d!105525 (= res!565002 (contains!4171 lt!375942 (_1!5025 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun lt!375941 () List!15805)

(assert (=> d!105525 (= lt!375942 (ListLongMap!8854 lt!375941))))

(declare-fun lt!375943 () Unit!28400)

(declare-fun lt!375944 () Unit!28400)

(assert (=> d!105525 (= lt!375943 lt!375944)))

(declare-datatypes ((Option!417 0))(
  ( (Some!416 (v!10063 V!25203)) (None!415) )
))
(declare-fun getValueByKey!411 (List!15805 (_ BitVec 64)) Option!417)

(assert (=> d!105525 (= (getValueByKey!411 lt!375941 (_1!5025 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!416 (_2!5025 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun lemmaContainsTupThenGetReturnValue!225 (List!15805 (_ BitVec 64) V!25203) Unit!28400)

(assert (=> d!105525 (= lt!375944 (lemmaContainsTupThenGetReturnValue!225 lt!375941 (_1!5025 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5025 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun insertStrictlySorted!264 (List!15805 (_ BitVec 64) V!25203) List!15805)

(assert (=> d!105525 (= lt!375941 (insertStrictlySorted!264 (toList!4442 lt!375817) (_1!5025 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5025 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105525 (= (+!1965 lt!375817 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) lt!375942)))

(declare-fun b!829643 () Bool)

(declare-fun res!565003 () Bool)

(assert (=> b!829643 (=> (not res!565003) (not e!462418))))

(assert (=> b!829643 (= res!565003 (= (getValueByKey!411 (toList!4442 lt!375942) (_1!5025 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!416 (_2!5025 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))))

(declare-fun b!829644 () Bool)

(declare-fun contains!4173 (List!15805 tuple2!10028) Bool)

(assert (=> b!829644 (= e!462418 (contains!4173 (toList!4442 lt!375942) (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))

(assert (= (and d!105525 res!565002) b!829643))

(assert (= (and b!829643 res!565003) b!829644))

(declare-fun m!772945 () Bool)

(assert (=> d!105525 m!772945))

(declare-fun m!772947 () Bool)

(assert (=> d!105525 m!772947))

(declare-fun m!772949 () Bool)

(assert (=> d!105525 m!772949))

(declare-fun m!772951 () Bool)

(assert (=> d!105525 m!772951))

(declare-fun m!772953 () Bool)

(assert (=> b!829643 m!772953))

(declare-fun m!772955 () Bool)

(assert (=> b!829644 m!772955))

(assert (=> b!829450 d!105525))

(declare-fun b!829653 () Bool)

(declare-fun e!462427 () Bool)

(declare-fun call!36108 () Bool)

(assert (=> b!829653 (= e!462427 call!36108)))

(declare-fun b!829654 () Bool)

(declare-fun e!462425 () Bool)

(assert (=> b!829654 (= e!462425 call!36108)))

(declare-fun b!829655 () Bool)

(declare-fun e!462426 () Bool)

(assert (=> b!829655 (= e!462426 e!462425)))

(declare-fun c!89953 () Bool)

(assert (=> b!829655 (= c!89953 (validKeyInArray!0 (select (arr!22275 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36105 () Bool)

(assert (=> bm!36105 (= call!36108 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!829656 () Bool)

(assert (=> b!829656 (= e!462425 e!462427)))

(declare-fun lt!375952 () (_ BitVec 64))

(assert (=> b!829656 (= lt!375952 (select (arr!22275 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375953 () Unit!28400)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46477 (_ BitVec 64) (_ BitVec 32)) Unit!28400)

(assert (=> b!829656 (= lt!375953 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!375952 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!829656 (arrayContainsKey!0 _keys!976 lt!375952 #b00000000000000000000000000000000)))

(declare-fun lt!375951 () Unit!28400)

(assert (=> b!829656 (= lt!375951 lt!375953)))

(declare-fun res!565009 () Bool)

(declare-datatypes ((SeekEntryResult!8690 0))(
  ( (MissingZero!8690 (index!37131 (_ BitVec 32))) (Found!8690 (index!37132 (_ BitVec 32))) (Intermediate!8690 (undefined!9502 Bool) (index!37133 (_ BitVec 32)) (x!69942 (_ BitVec 32))) (Undefined!8690) (MissingVacant!8690 (index!37134 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46477 (_ BitVec 32)) SeekEntryResult!8690)

(assert (=> b!829656 (= res!565009 (= (seekEntryOrOpen!0 (select (arr!22275 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8690 #b00000000000000000000000000000000)))))

(assert (=> b!829656 (=> (not res!565009) (not e!462427))))

(declare-fun d!105527 () Bool)

(declare-fun res!565008 () Bool)

(assert (=> d!105527 (=> res!565008 e!462426)))

(assert (=> d!105527 (= res!565008 (bvsge #b00000000000000000000000000000000 (size!22695 _keys!976)))))

(assert (=> d!105527 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!462426)))

(assert (= (and d!105527 (not res!565008)) b!829655))

(assert (= (and b!829655 c!89953) b!829656))

(assert (= (and b!829655 (not c!89953)) b!829654))

(assert (= (and b!829656 res!565009) b!829653))

(assert (= (or b!829653 b!829654) bm!36105))

(assert (=> b!829655 m!772845))

(assert (=> b!829655 m!772845))

(assert (=> b!829655 m!772853))

(declare-fun m!772957 () Bool)

(assert (=> bm!36105 m!772957))

(assert (=> b!829656 m!772845))

(declare-fun m!772959 () Bool)

(assert (=> b!829656 m!772959))

(declare-fun m!772961 () Bool)

(assert (=> b!829656 m!772961))

(assert (=> b!829656 m!772845))

(declare-fun m!772963 () Bool)

(assert (=> b!829656 m!772963))

(assert (=> b!829441 d!105527))

(declare-fun d!105529 () Bool)

(assert (=> d!105529 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71508 d!105529))

(declare-fun d!105531 () Bool)

(assert (=> d!105531 (= (array_inv!17791 _keys!976) (bvsge (size!22695 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71508 d!105531))

(declare-fun d!105533 () Bool)

(assert (=> d!105533 (= (array_inv!17792 _values!788) (bvsge (size!22696 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71508 d!105533))

(declare-fun b!829657 () Bool)

(declare-fun e!462438 () ListLongMap!8853)

(declare-fun e!462429 () ListLongMap!8853)

(assert (=> b!829657 (= e!462438 e!462429)))

(declare-fun c!89958 () Bool)

(assert (=> b!829657 (= c!89958 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!36106 () Bool)

(declare-fun call!36112 () ListLongMap!8853)

(assert (=> bm!36106 (= call!36112 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829658 () Bool)

(declare-fun res!565010 () Bool)

(declare-fun e!462440 () Bool)

(assert (=> b!829658 (=> (not res!565010) (not e!462440))))

(declare-fun e!462431 () Bool)

(assert (=> b!829658 (= res!565010 e!462431)))

(declare-fun c!89959 () Bool)

(assert (=> b!829658 (= c!89959 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!829659 () Bool)

(declare-fun e!462436 () Bool)

(declare-fun e!462428 () Bool)

(assert (=> b!829659 (= e!462436 e!462428)))

(declare-fun res!565016 () Bool)

(assert (=> b!829659 (=> (not res!565016) (not e!462428))))

(declare-fun lt!375959 () ListLongMap!8853)

(assert (=> b!829659 (= res!565016 (contains!4171 lt!375959 (select (arr!22275 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829659 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22695 _keys!976)))))

(declare-fun b!829660 () Bool)

(declare-fun c!89957 () Bool)

(assert (=> b!829660 (= c!89957 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!462433 () ListLongMap!8853)

(assert (=> b!829660 (= e!462429 e!462433)))

(declare-fun b!829661 () Bool)

(declare-fun e!462432 () Bool)

(assert (=> b!829661 (= e!462432 (= (apply!367 lt!375959 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!829662 () Bool)

(declare-fun e!462439 () Bool)

(assert (=> b!829662 (= e!462439 (= (apply!367 lt!375959 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!829663 () Bool)

(declare-fun res!565012 () Bool)

(assert (=> b!829663 (=> (not res!565012) (not e!462440))))

(assert (=> b!829663 (= res!565012 e!462436)))

(declare-fun res!565017 () Bool)

(assert (=> b!829663 (=> res!565017 e!462436)))

(declare-fun e!462437 () Bool)

(assert (=> b!829663 (= res!565017 (not e!462437))))

(declare-fun res!565011 () Bool)

(assert (=> b!829663 (=> (not res!565011) (not e!462437))))

(assert (=> b!829663 (= res!565011 (bvslt #b00000000000000000000000000000000 (size!22695 _keys!976)))))

(declare-fun call!36111 () ListLongMap!8853)

(declare-fun bm!36107 () Bool)

(declare-fun call!36109 () ListLongMap!8853)

(declare-fun c!89954 () Bool)

(declare-fun call!36113 () ListLongMap!8853)

(assert (=> bm!36107 (= call!36113 (+!1965 (ite c!89954 call!36112 (ite c!89958 call!36109 call!36111)) (ite (or c!89954 c!89958) (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!829664 () Bool)

(declare-fun e!462430 () Unit!28400)

(declare-fun lt!375967 () Unit!28400)

(assert (=> b!829664 (= e!462430 lt!375967)))

(declare-fun lt!375956 () ListLongMap!8853)

(assert (=> b!829664 (= lt!375956 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375974 () (_ BitVec 64))

(assert (=> b!829664 (= lt!375974 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375963 () (_ BitVec 64))

(assert (=> b!829664 (= lt!375963 (select (arr!22275 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375972 () Unit!28400)

(assert (=> b!829664 (= lt!375972 (addStillContains!318 lt!375956 lt!375974 zeroValueAfter!34 lt!375963))))

(assert (=> b!829664 (contains!4171 (+!1965 lt!375956 (tuple2!10029 lt!375974 zeroValueAfter!34)) lt!375963)))

(declare-fun lt!375970 () Unit!28400)

(assert (=> b!829664 (= lt!375970 lt!375972)))

(declare-fun lt!375961 () ListLongMap!8853)

(assert (=> b!829664 (= lt!375961 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375957 () (_ BitVec 64))

(assert (=> b!829664 (= lt!375957 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375966 () (_ BitVec 64))

(assert (=> b!829664 (= lt!375966 (select (arr!22275 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375969 () Unit!28400)

(assert (=> b!829664 (= lt!375969 (addApplyDifferent!318 lt!375961 lt!375957 minValue!754 lt!375966))))

(assert (=> b!829664 (= (apply!367 (+!1965 lt!375961 (tuple2!10029 lt!375957 minValue!754)) lt!375966) (apply!367 lt!375961 lt!375966))))

(declare-fun lt!375971 () Unit!28400)

(assert (=> b!829664 (= lt!375971 lt!375969)))

(declare-fun lt!375960 () ListLongMap!8853)

(assert (=> b!829664 (= lt!375960 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375954 () (_ BitVec 64))

(assert (=> b!829664 (= lt!375954 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375958 () (_ BitVec 64))

(assert (=> b!829664 (= lt!375958 (select (arr!22275 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375955 () Unit!28400)

(assert (=> b!829664 (= lt!375955 (addApplyDifferent!318 lt!375960 lt!375954 zeroValueAfter!34 lt!375958))))

(assert (=> b!829664 (= (apply!367 (+!1965 lt!375960 (tuple2!10029 lt!375954 zeroValueAfter!34)) lt!375958) (apply!367 lt!375960 lt!375958))))

(declare-fun lt!375968 () Unit!28400)

(assert (=> b!829664 (= lt!375968 lt!375955)))

(declare-fun lt!375962 () ListLongMap!8853)

(assert (=> b!829664 (= lt!375962 (getCurrentListMapNoExtraKeys!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375964 () (_ BitVec 64))

(assert (=> b!829664 (= lt!375964 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375975 () (_ BitVec 64))

(assert (=> b!829664 (= lt!375975 (select (arr!22275 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829664 (= lt!375967 (addApplyDifferent!318 lt!375962 lt!375964 minValue!754 lt!375975))))

(assert (=> b!829664 (= (apply!367 (+!1965 lt!375962 (tuple2!10029 lt!375964 minValue!754)) lt!375975) (apply!367 lt!375962 lt!375975))))

(declare-fun b!829665 () Bool)

(assert (=> b!829665 (= e!462438 (+!1965 call!36113 (tuple2!10029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!36108 () Bool)

(declare-fun call!36110 () Bool)

(assert (=> bm!36108 (= call!36110 (contains!4171 lt!375959 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829667 () Bool)

(declare-fun e!462434 () Bool)

(assert (=> b!829667 (= e!462434 (validKeyInArray!0 (select (arr!22275 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36109 () Bool)

(assert (=> bm!36109 (= call!36111 call!36109)))

(declare-fun b!829668 () Bool)

(assert (=> b!829668 (= e!462437 (validKeyInArray!0 (select (arr!22275 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829669 () Bool)

(declare-fun call!36115 () ListLongMap!8853)

(assert (=> b!829669 (= e!462433 call!36115)))

(declare-fun b!829670 () Bool)

(assert (=> b!829670 (= e!462433 call!36111)))

(declare-fun b!829671 () Bool)

(assert (=> b!829671 (= e!462429 call!36115)))

(declare-fun bm!36110 () Bool)

(declare-fun call!36114 () Bool)

(assert (=> bm!36110 (= call!36114 (contains!4171 lt!375959 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829672 () Bool)

(declare-fun e!462435 () Bool)

(assert (=> b!829672 (= e!462440 e!462435)))

(declare-fun c!89956 () Bool)

(assert (=> b!829672 (= c!89956 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!829673 () Bool)

(assert (=> b!829673 (= e!462435 e!462432)))

(declare-fun res!565018 () Bool)

(assert (=> b!829673 (= res!565018 call!36114)))

(assert (=> b!829673 (=> (not res!565018) (not e!462432))))

(declare-fun bm!36111 () Bool)

(assert (=> bm!36111 (= call!36109 call!36112)))

(declare-fun b!829674 () Bool)

(assert (=> b!829674 (= e!462431 (not call!36110))))

(declare-fun bm!36112 () Bool)

(assert (=> bm!36112 (= call!36115 call!36113)))

(declare-fun b!829675 () Bool)

(assert (=> b!829675 (= e!462431 e!462439)))

(declare-fun res!565015 () Bool)

(assert (=> b!829675 (= res!565015 call!36110)))

(assert (=> b!829675 (=> (not res!565015) (not e!462439))))

(declare-fun b!829676 () Bool)

(assert (=> b!829676 (= e!462428 (= (apply!367 lt!375959 (select (arr!22275 _keys!976) #b00000000000000000000000000000000)) (get!11797 (select (arr!22276 _values!788) #b00000000000000000000000000000000) (dynLambda!975 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!829676 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22696 _values!788)))))

(assert (=> b!829676 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22695 _keys!976)))))

(declare-fun b!829677 () Bool)

(declare-fun Unit!28405 () Unit!28400)

(assert (=> b!829677 (= e!462430 Unit!28405)))

(declare-fun d!105535 () Bool)

(assert (=> d!105535 e!462440))

(declare-fun res!565014 () Bool)

(assert (=> d!105535 (=> (not res!565014) (not e!462440))))

(assert (=> d!105535 (= res!565014 (or (bvsge #b00000000000000000000000000000000 (size!22695 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22695 _keys!976)))))))

(declare-fun lt!375965 () ListLongMap!8853)

(assert (=> d!105535 (= lt!375959 lt!375965)))

(declare-fun lt!375973 () Unit!28400)

(assert (=> d!105535 (= lt!375973 e!462430)))

(declare-fun c!89955 () Bool)

(assert (=> d!105535 (= c!89955 e!462434)))

(declare-fun res!565013 () Bool)

(assert (=> d!105535 (=> (not res!565013) (not e!462434))))

(assert (=> d!105535 (= res!565013 (bvslt #b00000000000000000000000000000000 (size!22695 _keys!976)))))

(assert (=> d!105535 (= lt!375965 e!462438)))

(assert (=> d!105535 (= c!89954 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105535 (validMask!0 mask!1312)))

(assert (=> d!105535 (= (getCurrentListMap!2538 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375959)))

(declare-fun b!829666 () Bool)

(assert (=> b!829666 (= e!462435 (not call!36114))))

(assert (= (and d!105535 c!89954) b!829665))

(assert (= (and d!105535 (not c!89954)) b!829657))

(assert (= (and b!829657 c!89958) b!829671))

(assert (= (and b!829657 (not c!89958)) b!829660))

(assert (= (and b!829660 c!89957) b!829669))

(assert (= (and b!829660 (not c!89957)) b!829670))

(assert (= (or b!829669 b!829670) bm!36109))

(assert (= (or b!829671 bm!36109) bm!36111))

(assert (= (or b!829671 b!829669) bm!36112))

(assert (= (or b!829665 bm!36111) bm!36106))

(assert (= (or b!829665 bm!36112) bm!36107))

(assert (= (and d!105535 res!565013) b!829667))

(assert (= (and d!105535 c!89955) b!829664))

(assert (= (and d!105535 (not c!89955)) b!829677))

(assert (= (and d!105535 res!565014) b!829663))

(assert (= (and b!829663 res!565011) b!829668))

(assert (= (and b!829663 (not res!565017)) b!829659))

(assert (= (and b!829659 res!565016) b!829676))

(assert (= (and b!829663 res!565012) b!829658))

(assert (= (and b!829658 c!89959) b!829675))

(assert (= (and b!829658 (not c!89959)) b!829674))

(assert (= (and b!829675 res!565015) b!829662))

(assert (= (or b!829675 b!829674) bm!36108))

(assert (= (and b!829658 res!565010) b!829672))

(assert (= (and b!829672 c!89956) b!829673))

(assert (= (and b!829672 (not c!89956)) b!829666))

(assert (= (and b!829673 res!565018) b!829661))

(assert (= (or b!829673 b!829666) bm!36110))

(declare-fun b_lambda!11251 () Bool)

(assert (=> (not b_lambda!11251) (not b!829676)))

(assert (=> b!829676 t!22158))

(declare-fun b_and!22437 () Bool)

(assert (= b_and!22435 (and (=> t!22158 result!7977) b_and!22437)))

(assert (=> b!829659 m!772845))

(assert (=> b!829659 m!772845))

(declare-fun m!772965 () Bool)

(assert (=> b!829659 m!772965))

(assert (=> bm!36106 m!772777))

(declare-fun m!772967 () Bool)

(assert (=> b!829664 m!772967))

(declare-fun m!772969 () Bool)

(assert (=> b!829664 m!772969))

(declare-fun m!772971 () Bool)

(assert (=> b!829664 m!772971))

(assert (=> b!829664 m!772845))

(declare-fun m!772973 () Bool)

(assert (=> b!829664 m!772973))

(declare-fun m!772975 () Bool)

(assert (=> b!829664 m!772975))

(declare-fun m!772977 () Bool)

(assert (=> b!829664 m!772977))

(assert (=> b!829664 m!772967))

(assert (=> b!829664 m!772977))

(declare-fun m!772979 () Bool)

(assert (=> b!829664 m!772979))

(declare-fun m!772981 () Bool)

(assert (=> b!829664 m!772981))

(declare-fun m!772983 () Bool)

(assert (=> b!829664 m!772983))

(assert (=> b!829664 m!772981))

(declare-fun m!772985 () Bool)

(assert (=> b!829664 m!772985))

(declare-fun m!772987 () Bool)

(assert (=> b!829664 m!772987))

(declare-fun m!772989 () Bool)

(assert (=> b!829664 m!772989))

(declare-fun m!772991 () Bool)

(assert (=> b!829664 m!772991))

(assert (=> b!829664 m!772777))

(declare-fun m!772993 () Bool)

(assert (=> b!829664 m!772993))

(assert (=> b!829664 m!772989))

(declare-fun m!772995 () Bool)

(assert (=> b!829664 m!772995))

(assert (=> b!829667 m!772845))

(assert (=> b!829667 m!772845))

(assert (=> b!829667 m!772853))

(declare-fun m!772997 () Bool)

(assert (=> bm!36110 m!772997))

(declare-fun m!772999 () Bool)

(assert (=> b!829662 m!772999))

(declare-fun m!773001 () Bool)

(assert (=> b!829661 m!773001))

(declare-fun m!773003 () Bool)

(assert (=> bm!36108 m!773003))

(declare-fun m!773005 () Bool)

(assert (=> b!829665 m!773005))

(declare-fun m!773007 () Bool)

(assert (=> bm!36107 m!773007))

(assert (=> b!829668 m!772845))

(assert (=> b!829668 m!772845))

(assert (=> b!829668 m!772853))

(assert (=> b!829676 m!772859))

(assert (=> b!829676 m!772861))

(assert (=> b!829676 m!772863))

(assert (=> b!829676 m!772861))

(assert (=> b!829676 m!772845))

(assert (=> b!829676 m!772859))

(assert (=> b!829676 m!772845))

(declare-fun m!773009 () Bool)

(assert (=> b!829676 m!773009))

(assert (=> d!105535 m!772781))

(assert (=> b!829447 d!105535))

(declare-fun d!105537 () Bool)

(declare-fun e!462441 () Bool)

(assert (=> d!105537 e!462441))

(declare-fun res!565019 () Bool)

(assert (=> d!105537 (=> (not res!565019) (not e!462441))))

(declare-fun lt!375977 () ListLongMap!8853)

(assert (=> d!105537 (= res!565019 (contains!4171 lt!375977 (_1!5025 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!375976 () List!15805)

(assert (=> d!105537 (= lt!375977 (ListLongMap!8854 lt!375976))))

(declare-fun lt!375978 () Unit!28400)

(declare-fun lt!375979 () Unit!28400)

(assert (=> d!105537 (= lt!375978 lt!375979)))

(assert (=> d!105537 (= (getValueByKey!411 lt!375976 (_1!5025 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!416 (_2!5025 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105537 (= lt!375979 (lemmaContainsTupThenGetReturnValue!225 lt!375976 (_1!5025 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5025 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105537 (= lt!375976 (insertStrictlySorted!264 (toList!4442 lt!375816) (_1!5025 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5025 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105537 (= (+!1965 lt!375816 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!375977)))

(declare-fun b!829678 () Bool)

(declare-fun res!565020 () Bool)

(assert (=> b!829678 (=> (not res!565020) (not e!462441))))

(assert (=> b!829678 (= res!565020 (= (getValueByKey!411 (toList!4442 lt!375977) (_1!5025 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!416 (_2!5025 (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!829679 () Bool)

(assert (=> b!829679 (= e!462441 (contains!4173 (toList!4442 lt!375977) (tuple2!10029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105537 res!565019) b!829678))

(assert (= (and b!829678 res!565020) b!829679))

(declare-fun m!773011 () Bool)

(assert (=> d!105537 m!773011))

(declare-fun m!773013 () Bool)

(assert (=> d!105537 m!773013))

(declare-fun m!773015 () Bool)

(assert (=> d!105537 m!773015))

(declare-fun m!773017 () Bool)

(assert (=> d!105537 m!773017))

(declare-fun m!773019 () Bool)

(assert (=> b!829678 m!773019))

(declare-fun m!773021 () Bool)

(assert (=> b!829679 m!773021))

(assert (=> b!829447 d!105537))

(declare-fun mapNonEmpty!24373 () Bool)

(declare-fun mapRes!24373 () Bool)

(declare-fun tp!47110 () Bool)

(declare-fun e!462447 () Bool)

(assert (=> mapNonEmpty!24373 (= mapRes!24373 (and tp!47110 e!462447))))

(declare-fun mapRest!24373 () (Array (_ BitVec 32) ValueCell!7160))

(declare-fun mapKey!24373 () (_ BitVec 32))

(declare-fun mapValue!24373 () ValueCell!7160)

(assert (=> mapNonEmpty!24373 (= mapRest!24364 (store mapRest!24373 mapKey!24373 mapValue!24373))))

(declare-fun mapIsEmpty!24373 () Bool)

(assert (=> mapIsEmpty!24373 mapRes!24373))

(declare-fun condMapEmpty!24373 () Bool)

(declare-fun mapDefault!24373 () ValueCell!7160)

(assert (=> mapNonEmpty!24364 (= condMapEmpty!24373 (= mapRest!24364 ((as const (Array (_ BitVec 32) ValueCell!7160)) mapDefault!24373)))))

(declare-fun e!462446 () Bool)

(assert (=> mapNonEmpty!24364 (= tp!47094 (and e!462446 mapRes!24373))))

(declare-fun b!829686 () Bool)

(assert (=> b!829686 (= e!462447 tp_is_empty!15151)))

(declare-fun b!829687 () Bool)

(assert (=> b!829687 (= e!462446 tp_is_empty!15151)))

(assert (= (and mapNonEmpty!24364 condMapEmpty!24373) mapIsEmpty!24373))

(assert (= (and mapNonEmpty!24364 (not condMapEmpty!24373)) mapNonEmpty!24373))

(assert (= (and mapNonEmpty!24373 ((_ is ValueCellFull!7160) mapValue!24373)) b!829686))

(assert (= (and mapNonEmpty!24364 ((_ is ValueCellFull!7160) mapDefault!24373)) b!829687))

(declare-fun m!773023 () Bool)

(assert (=> mapNonEmpty!24373 m!773023))

(declare-fun b_lambda!11253 () Bool)

(assert (= b_lambda!11241 (or (and start!71508 b_free!13441) b_lambda!11253)))

(declare-fun b_lambda!11255 () Bool)

(assert (= b_lambda!11247 (or (and start!71508 b_free!13441) b_lambda!11255)))

(declare-fun b_lambda!11257 () Bool)

(assert (= b_lambda!11243 (or (and start!71508 b_free!13441) b_lambda!11257)))

(declare-fun b_lambda!11259 () Bool)

(assert (= b_lambda!11245 (or (and start!71508 b_free!13441) b_lambda!11259)))

(declare-fun b_lambda!11261 () Bool)

(assert (= b_lambda!11249 (or (and start!71508 b_free!13441) b_lambda!11261)))

(declare-fun b_lambda!11263 () Bool)

(assert (= b_lambda!11251 (or (and start!71508 b_free!13441) b_lambda!11263)))

(check-sat (not b!829629) (not bm!36108) (not b!829572) (not b!829545) (not b_lambda!11257) (not b!829536) (not bm!36078) (not bm!36106) (not d!105525) (not b!829537) (not b!829559) (not b!829539) (not d!105519) (not b_lambda!11255) (not mapNonEmpty!24373) (not b!829628) tp_is_empty!15151 (not b!829544) (not b!829676) (not b!829620) (not b!829668) (not b!829541) (not d!105535) (not b!829625) (not b_lambda!11263) (not b!829622) (not b_lambda!11259) (not b!829665) (not d!105537) (not b!829542) (not bm!36096) (not b!829626) (not b!829535) (not d!105517) (not b!829644) (not b_lambda!11253) (not d!105523) (not b!829643) (not b!829656) (not bm!36110) (not b!829679) (not b!829662) (not b!829655) (not b!829556) (not b_next!13441) (not b!829667) (not b!829659) (not b!829555) (not bm!36081) (not b!829637) (not b!829551) (not b!829623) (not bm!36098) (not b!829549) (not bm!36105) (not b!829664) (not b_lambda!11261) (not b!829573) (not b!829575) (not b!829558) (not bm!36100) (not d!105515) (not bm!36107) (not b!829550) (not b!829553) b_and!22437 (not bm!36097) (not b!829678) (not bm!36077) (not b!829661))
(check-sat b_and!22437 (not b_next!13441))
