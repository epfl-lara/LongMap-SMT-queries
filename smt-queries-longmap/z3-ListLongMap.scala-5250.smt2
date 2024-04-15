; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70580 () Bool)

(assert start!70580)

(declare-fun b_free!12907 () Bool)

(declare-fun b_next!12907 () Bool)

(assert (=> start!70580 (= b_free!12907 (not b_next!12907))))

(declare-fun tp!45457 () Bool)

(declare-fun b_and!21723 () Bool)

(assert (=> start!70580 (= tp!45457 b_and!21723)))

(declare-fun b!819952 () Bool)

(declare-fun e!455494 () Bool)

(declare-fun e!455495 () Bool)

(assert (=> b!819952 (= e!455494 e!455495)))

(declare-fun res!559555 () Bool)

(assert (=> b!819952 (=> res!559555 e!455495)))

(declare-datatypes ((V!24491 0))(
  ( (V!24492 (val!7356 Int)) )
))
(declare-datatypes ((tuple2!9710 0))(
  ( (tuple2!9711 (_1!4866 (_ BitVec 64)) (_2!4866 V!24491)) )
))
(declare-datatypes ((List!15526 0))(
  ( (Nil!15523) (Cons!15522 (h!16651 tuple2!9710) (t!21848 List!15526)) )
))
(declare-datatypes ((ListLongMap!8523 0))(
  ( (ListLongMap!8524 (toList!4277 List!15526)) )
))
(declare-fun lt!368303 () ListLongMap!8523)

(declare-fun lt!368310 () tuple2!9710)

(declare-fun lt!368307 () tuple2!9710)

(declare-fun lt!368305 () ListLongMap!8523)

(declare-fun +!1898 (ListLongMap!8523 tuple2!9710) ListLongMap!8523)

(assert (=> b!819952 (= res!559555 (not (= lt!368303 (+!1898 (+!1898 lt!368305 lt!368307) lt!368310))))))

(declare-fun lt!368304 () ListLongMap!8523)

(declare-fun lt!368306 () ListLongMap!8523)

(assert (=> b!819952 (= (+!1898 lt!368304 lt!368310) (+!1898 lt!368306 lt!368310))))

(declare-fun zeroValueBefore!34 () V!24491)

(declare-datatypes ((Unit!27981 0))(
  ( (Unit!27982) )
))
(declare-fun lt!368302 () Unit!27981)

(declare-fun zeroValueAfter!34 () V!24491)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!212 (ListLongMap!8523 (_ BitVec 64) V!24491 V!24491) Unit!27981)

(assert (=> b!819952 (= lt!368302 (addSameAsAddTwiceSameKeyDiffValues!212 lt!368304 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819952 (= lt!368310 (tuple2!9711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455498 () Bool)

(assert (=> b!819952 e!455498))

(declare-fun res!559559 () Bool)

(assert (=> b!819952 (=> (not res!559559) (not e!455498))))

(declare-fun lt!368308 () ListLongMap!8523)

(assert (=> b!819952 (= res!559559 (= lt!368308 lt!368306))))

(assert (=> b!819952 (= lt!368306 (+!1898 lt!368304 lt!368307))))

(assert (=> b!819952 (= lt!368307 (tuple2!9711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!45405 0))(
  ( (array!45406 (arr!21756 (Array (_ BitVec 32) (_ BitVec 64))) (size!22177 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45405)

(declare-fun minValue!754 () V!24491)

(declare-datatypes ((ValueCell!6893 0))(
  ( (ValueCellFull!6893 (v!9780 V!24491)) (EmptyCell!6893) )
))
(declare-datatypes ((array!45407 0))(
  ( (array!45408 (arr!21757 (Array (_ BitVec 32) ValueCell!6893)) (size!22178 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45407)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2425 (array!45405 array!45407 (_ BitVec 32) (_ BitVec 32) V!24491 V!24491 (_ BitVec 32) Int) ListLongMap!8523)

(assert (=> b!819952 (= lt!368303 (getCurrentListMap!2425 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819952 (= lt!368308 (getCurrentListMap!2425 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819953 () Bool)

(declare-fun e!455499 () Bool)

(declare-fun e!455497 () Bool)

(declare-fun mapRes!23527 () Bool)

(assert (=> b!819953 (= e!455499 (and e!455497 mapRes!23527))))

(declare-fun condMapEmpty!23527 () Bool)

(declare-fun mapDefault!23527 () ValueCell!6893)

(assert (=> b!819953 (= condMapEmpty!23527 (= (arr!21757 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6893)) mapDefault!23527)))))

(declare-fun b!819955 () Bool)

(declare-fun tp_is_empty!14617 () Bool)

(assert (=> b!819955 (= e!455497 tp_is_empty!14617)))

(declare-fun mapNonEmpty!23527 () Bool)

(declare-fun tp!45456 () Bool)

(declare-fun e!455496 () Bool)

(assert (=> mapNonEmpty!23527 (= mapRes!23527 (and tp!45456 e!455496))))

(declare-fun mapKey!23527 () (_ BitVec 32))

(declare-fun mapValue!23527 () ValueCell!6893)

(declare-fun mapRest!23527 () (Array (_ BitVec 32) ValueCell!6893))

(assert (=> mapNonEmpty!23527 (= (arr!21757 _values!788) (store mapRest!23527 mapKey!23527 mapValue!23527))))

(declare-fun b!819956 () Bool)

(assert (=> b!819956 (= e!455496 tp_is_empty!14617)))

(declare-fun b!819957 () Bool)

(declare-fun res!559560 () Bool)

(declare-fun e!455493 () Bool)

(assert (=> b!819957 (=> (not res!559560) (not e!455493))))

(assert (=> b!819957 (= res!559560 (and (= (size!22178 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22177 _keys!976) (size!22178 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819958 () Bool)

(assert (=> b!819958 (= e!455493 (not e!455494))))

(declare-fun res!559558 () Bool)

(assert (=> b!819958 (=> res!559558 e!455494)))

(assert (=> b!819958 (= res!559558 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!819958 (= lt!368304 lt!368305)))

(declare-fun lt!368309 () Unit!27981)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!422 (array!45405 array!45407 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24491 V!24491 V!24491 V!24491 (_ BitVec 32) Int) Unit!27981)

(assert (=> b!819958 (= lt!368309 (lemmaNoChangeToArrayThenSameMapNoExtras!422 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2329 (array!45405 array!45407 (_ BitVec 32) (_ BitVec 32) V!24491 V!24491 (_ BitVec 32) Int) ListLongMap!8523)

(assert (=> b!819958 (= lt!368305 (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819958 (= lt!368304 (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!559557 () Bool)

(assert (=> start!70580 (=> (not res!559557) (not e!455493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70580 (= res!559557 (validMask!0 mask!1312))))

(assert (=> start!70580 e!455493))

(assert (=> start!70580 tp_is_empty!14617))

(declare-fun array_inv!17455 (array!45405) Bool)

(assert (=> start!70580 (array_inv!17455 _keys!976)))

(assert (=> start!70580 true))

(declare-fun array_inv!17456 (array!45407) Bool)

(assert (=> start!70580 (and (array_inv!17456 _values!788) e!455499)))

(assert (=> start!70580 tp!45457))

(declare-fun b!819954 () Bool)

(declare-fun res!559556 () Bool)

(assert (=> b!819954 (=> (not res!559556) (not e!455493))))

(declare-datatypes ((List!15527 0))(
  ( (Nil!15524) (Cons!15523 (h!16652 (_ BitVec 64)) (t!21849 List!15527)) )
))
(declare-fun arrayNoDuplicates!0 (array!45405 (_ BitVec 32) List!15527) Bool)

(assert (=> b!819954 (= res!559556 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15524))))

(declare-fun mapIsEmpty!23527 () Bool)

(assert (=> mapIsEmpty!23527 mapRes!23527))

(declare-fun b!819959 () Bool)

(declare-fun res!559561 () Bool)

(assert (=> b!819959 (=> (not res!559561) (not e!455493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45405 (_ BitVec 32)) Bool)

(assert (=> b!819959 (= res!559561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819960 () Bool)

(assert (=> b!819960 (= e!455495 (bvsle #b00000000000000000000000000000000 (size!22177 _keys!976)))))

(declare-fun b!819961 () Bool)

(assert (=> b!819961 (= e!455498 (= lt!368303 (+!1898 lt!368305 (tuple2!9711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and start!70580 res!559557) b!819957))

(assert (= (and b!819957 res!559560) b!819959))

(assert (= (and b!819959 res!559561) b!819954))

(assert (= (and b!819954 res!559556) b!819958))

(assert (= (and b!819958 (not res!559558)) b!819952))

(assert (= (and b!819952 res!559559) b!819961))

(assert (= (and b!819952 (not res!559555)) b!819960))

(assert (= (and b!819953 condMapEmpty!23527) mapIsEmpty!23527))

(assert (= (and b!819953 (not condMapEmpty!23527)) mapNonEmpty!23527))

(get-info :version)

(assert (= (and mapNonEmpty!23527 ((_ is ValueCellFull!6893) mapValue!23527)) b!819956))

(assert (= (and b!819953 ((_ is ValueCellFull!6893) mapDefault!23527)) b!819955))

(assert (= start!70580 b!819953))

(declare-fun m!761319 () Bool)

(assert (=> b!819952 m!761319))

(declare-fun m!761321 () Bool)

(assert (=> b!819952 m!761321))

(declare-fun m!761323 () Bool)

(assert (=> b!819952 m!761323))

(declare-fun m!761325 () Bool)

(assert (=> b!819952 m!761325))

(declare-fun m!761327 () Bool)

(assert (=> b!819952 m!761327))

(declare-fun m!761329 () Bool)

(assert (=> b!819952 m!761329))

(assert (=> b!819952 m!761319))

(declare-fun m!761331 () Bool)

(assert (=> b!819952 m!761331))

(declare-fun m!761333 () Bool)

(assert (=> b!819952 m!761333))

(declare-fun m!761335 () Bool)

(assert (=> mapNonEmpty!23527 m!761335))

(declare-fun m!761337 () Bool)

(assert (=> start!70580 m!761337))

(declare-fun m!761339 () Bool)

(assert (=> start!70580 m!761339))

(declare-fun m!761341 () Bool)

(assert (=> start!70580 m!761341))

(declare-fun m!761343 () Bool)

(assert (=> b!819961 m!761343))

(declare-fun m!761345 () Bool)

(assert (=> b!819954 m!761345))

(declare-fun m!761347 () Bool)

(assert (=> b!819958 m!761347))

(declare-fun m!761349 () Bool)

(assert (=> b!819958 m!761349))

(declare-fun m!761351 () Bool)

(assert (=> b!819958 m!761351))

(declare-fun m!761353 () Bool)

(assert (=> b!819959 m!761353))

(check-sat (not start!70580) (not b!819961) b_and!21723 (not b_next!12907) tp_is_empty!14617 (not b!819959) (not b!819958) (not b!819952) (not b!819954) (not mapNonEmpty!23527))
(check-sat b_and!21723 (not b_next!12907))
(get-model)

(declare-fun b!820030 () Bool)

(declare-fun e!455554 () Bool)

(declare-fun e!455556 () Bool)

(assert (=> b!820030 (= e!455554 e!455556)))

(declare-fun c!89101 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!820030 (= c!89101 (validKeyInArray!0 (select (arr!21756 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820032 () Bool)

(declare-fun e!455555 () Bool)

(declare-fun call!35651 () Bool)

(assert (=> b!820032 (= e!455555 call!35651)))

(declare-fun bm!35648 () Bool)

(assert (=> bm!35648 (= call!35651 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!820033 () Bool)

(assert (=> b!820033 (= e!455556 e!455555)))

(declare-fun lt!368373 () (_ BitVec 64))

(assert (=> b!820033 (= lt!368373 (select (arr!21756 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368371 () Unit!27981)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45405 (_ BitVec 64) (_ BitVec 32)) Unit!27981)

(assert (=> b!820033 (= lt!368371 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!368373 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!820033 (arrayContainsKey!0 _keys!976 lt!368373 #b00000000000000000000000000000000)))

(declare-fun lt!368372 () Unit!27981)

(assert (=> b!820033 (= lt!368372 lt!368371)))

(declare-fun res!559609 () Bool)

(declare-datatypes ((SeekEntryResult!8723 0))(
  ( (MissingZero!8723 (index!37263 (_ BitVec 32))) (Found!8723 (index!37264 (_ BitVec 32))) (Intermediate!8723 (undefined!9535 Bool) (index!37265 (_ BitVec 32)) (x!69112 (_ BitVec 32))) (Undefined!8723) (MissingVacant!8723 (index!37266 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45405 (_ BitVec 32)) SeekEntryResult!8723)

(assert (=> b!820033 (= res!559609 (= (seekEntryOrOpen!0 (select (arr!21756 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8723 #b00000000000000000000000000000000)))))

(assert (=> b!820033 (=> (not res!559609) (not e!455555))))

(declare-fun b!820031 () Bool)

(assert (=> b!820031 (= e!455556 call!35651)))

(declare-fun d!104509 () Bool)

(declare-fun res!559608 () Bool)

(assert (=> d!104509 (=> res!559608 e!455554)))

(assert (=> d!104509 (= res!559608 (bvsge #b00000000000000000000000000000000 (size!22177 _keys!976)))))

(assert (=> d!104509 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!455554)))

(assert (= (and d!104509 (not res!559608)) b!820030))

(assert (= (and b!820030 c!89101) b!820033))

(assert (= (and b!820030 (not c!89101)) b!820031))

(assert (= (and b!820033 res!559609) b!820032))

(assert (= (or b!820032 b!820031) bm!35648))

(declare-fun m!761427 () Bool)

(assert (=> b!820030 m!761427))

(assert (=> b!820030 m!761427))

(declare-fun m!761429 () Bool)

(assert (=> b!820030 m!761429))

(declare-fun m!761431 () Bool)

(assert (=> bm!35648 m!761431))

(assert (=> b!820033 m!761427))

(declare-fun m!761433 () Bool)

(assert (=> b!820033 m!761433))

(declare-fun m!761435 () Bool)

(assert (=> b!820033 m!761435))

(assert (=> b!820033 m!761427))

(declare-fun m!761437 () Bool)

(assert (=> b!820033 m!761437))

(assert (=> b!819959 d!104509))

(declare-fun d!104511 () Bool)

(assert (=> d!104511 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70580 d!104511))

(declare-fun d!104513 () Bool)

(assert (=> d!104513 (= (array_inv!17455 _keys!976) (bvsge (size!22177 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70580 d!104513))

(declare-fun d!104515 () Bool)

(assert (=> d!104515 (= (array_inv!17456 _values!788) (bvsge (size!22178 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70580 d!104515))

(declare-fun d!104517 () Bool)

(declare-fun e!455559 () Bool)

(assert (=> d!104517 e!455559))

(declare-fun res!559615 () Bool)

(assert (=> d!104517 (=> (not res!559615) (not e!455559))))

(declare-fun lt!368385 () ListLongMap!8523)

(declare-fun contains!4141 (ListLongMap!8523 (_ BitVec 64)) Bool)

(assert (=> d!104517 (= res!559615 (contains!4141 lt!368385 (_1!4866 lt!368310)))))

(declare-fun lt!368384 () List!15526)

(assert (=> d!104517 (= lt!368385 (ListLongMap!8524 lt!368384))))

(declare-fun lt!368382 () Unit!27981)

(declare-fun lt!368383 () Unit!27981)

(assert (=> d!104517 (= lt!368382 lt!368383)))

(declare-datatypes ((Option!407 0))(
  ( (Some!406 (v!9783 V!24491)) (None!405) )
))
(declare-fun getValueByKey!401 (List!15526 (_ BitVec 64)) Option!407)

(assert (=> d!104517 (= (getValueByKey!401 lt!368384 (_1!4866 lt!368310)) (Some!406 (_2!4866 lt!368310)))))

(declare-fun lemmaContainsTupThenGetReturnValue!218 (List!15526 (_ BitVec 64) V!24491) Unit!27981)

(assert (=> d!104517 (= lt!368383 (lemmaContainsTupThenGetReturnValue!218 lt!368384 (_1!4866 lt!368310) (_2!4866 lt!368310)))))

(declare-fun insertStrictlySorted!257 (List!15526 (_ BitVec 64) V!24491) List!15526)

(assert (=> d!104517 (= lt!368384 (insertStrictlySorted!257 (toList!4277 lt!368306) (_1!4866 lt!368310) (_2!4866 lt!368310)))))

(assert (=> d!104517 (= (+!1898 lt!368306 lt!368310) lt!368385)))

(declare-fun b!820038 () Bool)

(declare-fun res!559614 () Bool)

(assert (=> b!820038 (=> (not res!559614) (not e!455559))))

(assert (=> b!820038 (= res!559614 (= (getValueByKey!401 (toList!4277 lt!368385) (_1!4866 lt!368310)) (Some!406 (_2!4866 lt!368310))))))

(declare-fun b!820039 () Bool)

(declare-fun contains!4142 (List!15526 tuple2!9710) Bool)

(assert (=> b!820039 (= e!455559 (contains!4142 (toList!4277 lt!368385) lt!368310))))

(assert (= (and d!104517 res!559615) b!820038))

(assert (= (and b!820038 res!559614) b!820039))

(declare-fun m!761439 () Bool)

(assert (=> d!104517 m!761439))

(declare-fun m!761441 () Bool)

(assert (=> d!104517 m!761441))

(declare-fun m!761443 () Bool)

(assert (=> d!104517 m!761443))

(declare-fun m!761445 () Bool)

(assert (=> d!104517 m!761445))

(declare-fun m!761447 () Bool)

(assert (=> b!820038 m!761447))

(declare-fun m!761449 () Bool)

(assert (=> b!820039 m!761449))

(assert (=> b!819952 d!104517))

(declare-fun d!104519 () Bool)

(assert (=> d!104519 (= (+!1898 lt!368304 (tuple2!9711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (+!1898 (+!1898 lt!368304 (tuple2!9711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!9711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun lt!368388 () Unit!27981)

(declare-fun choose!1404 (ListLongMap!8523 (_ BitVec 64) V!24491 V!24491) Unit!27981)

(assert (=> d!104519 (= lt!368388 (choose!1404 lt!368304 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> d!104519 (= (addSameAsAddTwiceSameKeyDiffValues!212 lt!368304 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34) lt!368388)))

(declare-fun bs!22837 () Bool)

(assert (= bs!22837 d!104519))

(declare-fun m!761451 () Bool)

(assert (=> bs!22837 m!761451))

(declare-fun m!761453 () Bool)

(assert (=> bs!22837 m!761453))

(assert (=> bs!22837 m!761453))

(declare-fun m!761455 () Bool)

(assert (=> bs!22837 m!761455))

(declare-fun m!761457 () Bool)

(assert (=> bs!22837 m!761457))

(assert (=> b!819952 d!104519))

(declare-fun d!104521 () Bool)

(declare-fun e!455560 () Bool)

(assert (=> d!104521 e!455560))

(declare-fun res!559617 () Bool)

(assert (=> d!104521 (=> (not res!559617) (not e!455560))))

(declare-fun lt!368392 () ListLongMap!8523)

(assert (=> d!104521 (= res!559617 (contains!4141 lt!368392 (_1!4866 lt!368307)))))

(declare-fun lt!368391 () List!15526)

(assert (=> d!104521 (= lt!368392 (ListLongMap!8524 lt!368391))))

(declare-fun lt!368389 () Unit!27981)

(declare-fun lt!368390 () Unit!27981)

(assert (=> d!104521 (= lt!368389 lt!368390)))

(assert (=> d!104521 (= (getValueByKey!401 lt!368391 (_1!4866 lt!368307)) (Some!406 (_2!4866 lt!368307)))))

(assert (=> d!104521 (= lt!368390 (lemmaContainsTupThenGetReturnValue!218 lt!368391 (_1!4866 lt!368307) (_2!4866 lt!368307)))))

(assert (=> d!104521 (= lt!368391 (insertStrictlySorted!257 (toList!4277 lt!368304) (_1!4866 lt!368307) (_2!4866 lt!368307)))))

(assert (=> d!104521 (= (+!1898 lt!368304 lt!368307) lt!368392)))

(declare-fun b!820040 () Bool)

(declare-fun res!559616 () Bool)

(assert (=> b!820040 (=> (not res!559616) (not e!455560))))

(assert (=> b!820040 (= res!559616 (= (getValueByKey!401 (toList!4277 lt!368392) (_1!4866 lt!368307)) (Some!406 (_2!4866 lt!368307))))))

(declare-fun b!820041 () Bool)

(assert (=> b!820041 (= e!455560 (contains!4142 (toList!4277 lt!368392) lt!368307))))

(assert (= (and d!104521 res!559617) b!820040))

(assert (= (and b!820040 res!559616) b!820041))

(declare-fun m!761459 () Bool)

(assert (=> d!104521 m!761459))

(declare-fun m!761461 () Bool)

(assert (=> d!104521 m!761461))

(declare-fun m!761463 () Bool)

(assert (=> d!104521 m!761463))

(declare-fun m!761465 () Bool)

(assert (=> d!104521 m!761465))

(declare-fun m!761467 () Bool)

(assert (=> b!820040 m!761467))

(declare-fun m!761469 () Bool)

(assert (=> b!820041 m!761469))

(assert (=> b!819952 d!104521))

(declare-fun b!820084 () Bool)

(declare-fun e!455591 () Bool)

(assert (=> b!820084 (= e!455591 (validKeyInArray!0 (select (arr!21756 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820086 () Bool)

(declare-fun e!455587 () Bool)

(declare-fun lt!368440 () ListLongMap!8523)

(declare-fun apply!355 (ListLongMap!8523 (_ BitVec 64)) V!24491)

(assert (=> b!820086 (= e!455587 (= (apply!355 lt!368440 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!820087 () Bool)

(declare-fun e!455594 () Unit!27981)

(declare-fun Unit!27983 () Unit!27981)

(assert (=> b!820087 (= e!455594 Unit!27983)))

(declare-fun b!820088 () Bool)

(declare-fun e!455599 () Bool)

(declare-fun call!35672 () Bool)

(assert (=> b!820088 (= e!455599 (not call!35672))))

(declare-fun b!820089 () Bool)

(declare-fun res!559639 () Bool)

(declare-fun e!455597 () Bool)

(assert (=> b!820089 (=> (not res!559639) (not e!455597))))

(declare-fun e!455593 () Bool)

(assert (=> b!820089 (= res!559639 e!455593)))

(declare-fun res!559636 () Bool)

(assert (=> b!820089 (=> res!559636 e!455593)))

(declare-fun e!455598 () Bool)

(assert (=> b!820089 (= res!559636 (not e!455598))))

(declare-fun res!559644 () Bool)

(assert (=> b!820089 (=> (not res!559644) (not e!455598))))

(assert (=> b!820089 (= res!559644 (bvslt #b00000000000000000000000000000000 (size!22177 _keys!976)))))

(declare-fun bm!35663 () Bool)

(assert (=> bm!35663 (= call!35672 (contains!4141 lt!368440 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!820090 () Bool)

(assert (=> b!820090 (= e!455599 e!455587)))

(declare-fun res!559640 () Bool)

(assert (=> b!820090 (= res!559640 call!35672)))

(assert (=> b!820090 (=> (not res!559640) (not e!455587))))

(declare-fun b!820091 () Bool)

(declare-fun e!455596 () ListLongMap!8523)

(declare-fun call!35667 () ListLongMap!8523)

(assert (=> b!820091 (= e!455596 call!35667)))

(declare-fun bm!35664 () Bool)

(declare-fun call!35666 () ListLongMap!8523)

(assert (=> bm!35664 (= call!35667 call!35666)))

(declare-fun bm!35665 () Bool)

(declare-fun call!35669 () ListLongMap!8523)

(assert (=> bm!35665 (= call!35669 (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!35666 () Bool)

(declare-fun call!35670 () ListLongMap!8523)

(declare-fun call!35668 () ListLongMap!8523)

(assert (=> bm!35666 (= call!35670 call!35668)))

(declare-fun b!820092 () Bool)

(assert (=> b!820092 (= e!455597 e!455599)))

(declare-fun c!89119 () Bool)

(assert (=> b!820092 (= c!89119 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!820093 () Bool)

(assert (=> b!820093 (= e!455598 (validKeyInArray!0 (select (arr!21756 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820094 () Bool)

(declare-fun e!455589 () Bool)

(declare-fun e!455595 () Bool)

(assert (=> b!820094 (= e!455589 e!455595)))

(declare-fun res!559641 () Bool)

(declare-fun call!35671 () Bool)

(assert (=> b!820094 (= res!559641 call!35671)))

(assert (=> b!820094 (=> (not res!559641) (not e!455595))))

(declare-fun b!820095 () Bool)

(declare-fun e!455588 () ListLongMap!8523)

(assert (=> b!820095 (= e!455588 call!35667)))

(declare-fun d!104523 () Bool)

(assert (=> d!104523 e!455597))

(declare-fun res!559637 () Bool)

(assert (=> d!104523 (=> (not res!559637) (not e!455597))))

(assert (=> d!104523 (= res!559637 (or (bvsge #b00000000000000000000000000000000 (size!22177 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22177 _keys!976)))))))

(declare-fun lt!368448 () ListLongMap!8523)

(assert (=> d!104523 (= lt!368440 lt!368448)))

(declare-fun lt!368443 () Unit!27981)

(assert (=> d!104523 (= lt!368443 e!455594)))

(declare-fun c!89114 () Bool)

(assert (=> d!104523 (= c!89114 e!455591)))

(declare-fun res!559643 () Bool)

(assert (=> d!104523 (=> (not res!559643) (not e!455591))))

(assert (=> d!104523 (= res!559643 (bvslt #b00000000000000000000000000000000 (size!22177 _keys!976)))))

(declare-fun e!455592 () ListLongMap!8523)

(assert (=> d!104523 (= lt!368448 e!455592)))

(declare-fun c!89117 () Bool)

(assert (=> d!104523 (= c!89117 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104523 (validMask!0 mask!1312)))

(assert (=> d!104523 (= (getCurrentListMap!2425 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!368440)))

(declare-fun b!820085 () Bool)

(assert (=> b!820085 (= e!455592 (+!1898 call!35666 (tuple2!9711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!35667 () Bool)

(assert (=> bm!35667 (= call!35668 call!35669)))

(declare-fun bm!35668 () Bool)

(assert (=> bm!35668 (= call!35671 (contains!4141 lt!368440 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!820096 () Bool)

(assert (=> b!820096 (= e!455595 (= (apply!355 lt!368440 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!820097 () Bool)

(assert (=> b!820097 (= e!455592 e!455588)))

(declare-fun c!89118 () Bool)

(assert (=> b!820097 (= c!89118 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!820098 () Bool)

(declare-fun lt!368438 () Unit!27981)

(assert (=> b!820098 (= e!455594 lt!368438)))

(declare-fun lt!368446 () ListLongMap!8523)

(assert (=> b!820098 (= lt!368446 (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368444 () (_ BitVec 64))

(assert (=> b!820098 (= lt!368444 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368458 () (_ BitVec 64))

(assert (=> b!820098 (= lt!368458 (select (arr!21756 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368439 () Unit!27981)

(declare-fun addStillContains!309 (ListLongMap!8523 (_ BitVec 64) V!24491 (_ BitVec 64)) Unit!27981)

(assert (=> b!820098 (= lt!368439 (addStillContains!309 lt!368446 lt!368444 zeroValueBefore!34 lt!368458))))

(assert (=> b!820098 (contains!4141 (+!1898 lt!368446 (tuple2!9711 lt!368444 zeroValueBefore!34)) lt!368458)))

(declare-fun lt!368456 () Unit!27981)

(assert (=> b!820098 (= lt!368456 lt!368439)))

(declare-fun lt!368447 () ListLongMap!8523)

(assert (=> b!820098 (= lt!368447 (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368437 () (_ BitVec 64))

(assert (=> b!820098 (= lt!368437 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368455 () (_ BitVec 64))

(assert (=> b!820098 (= lt!368455 (select (arr!21756 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368445 () Unit!27981)

(declare-fun addApplyDifferent!309 (ListLongMap!8523 (_ BitVec 64) V!24491 (_ BitVec 64)) Unit!27981)

(assert (=> b!820098 (= lt!368445 (addApplyDifferent!309 lt!368447 lt!368437 minValue!754 lt!368455))))

(assert (=> b!820098 (= (apply!355 (+!1898 lt!368447 (tuple2!9711 lt!368437 minValue!754)) lt!368455) (apply!355 lt!368447 lt!368455))))

(declare-fun lt!368457 () Unit!27981)

(assert (=> b!820098 (= lt!368457 lt!368445)))

(declare-fun lt!368453 () ListLongMap!8523)

(assert (=> b!820098 (= lt!368453 (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368449 () (_ BitVec 64))

(assert (=> b!820098 (= lt!368449 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368442 () (_ BitVec 64))

(assert (=> b!820098 (= lt!368442 (select (arr!21756 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368452 () Unit!27981)

(assert (=> b!820098 (= lt!368452 (addApplyDifferent!309 lt!368453 lt!368449 zeroValueBefore!34 lt!368442))))

(assert (=> b!820098 (= (apply!355 (+!1898 lt!368453 (tuple2!9711 lt!368449 zeroValueBefore!34)) lt!368442) (apply!355 lt!368453 lt!368442))))

(declare-fun lt!368450 () Unit!27981)

(assert (=> b!820098 (= lt!368450 lt!368452)))

(declare-fun lt!368454 () ListLongMap!8523)

(assert (=> b!820098 (= lt!368454 (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368451 () (_ BitVec 64))

(assert (=> b!820098 (= lt!368451 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368441 () (_ BitVec 64))

(assert (=> b!820098 (= lt!368441 (select (arr!21756 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!820098 (= lt!368438 (addApplyDifferent!309 lt!368454 lt!368451 minValue!754 lt!368441))))

(assert (=> b!820098 (= (apply!355 (+!1898 lt!368454 (tuple2!9711 lt!368451 minValue!754)) lt!368441) (apply!355 lt!368454 lt!368441))))

(declare-fun b!820099 () Bool)

(assert (=> b!820099 (= e!455596 call!35670)))

(declare-fun b!820100 () Bool)

(declare-fun c!89116 () Bool)

(assert (=> b!820100 (= c!89116 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!820100 (= e!455588 e!455596)))

(declare-fun bm!35669 () Bool)

(assert (=> bm!35669 (= call!35666 (+!1898 (ite c!89117 call!35669 (ite c!89118 call!35668 call!35670)) (ite (or c!89117 c!89118) (tuple2!9711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!820101 () Bool)

(assert (=> b!820101 (= e!455589 (not call!35671))))

(declare-fun b!820102 () Bool)

(declare-fun e!455590 () Bool)

(declare-fun get!11610 (ValueCell!6893 V!24491) V!24491)

(declare-fun dynLambda!969 (Int (_ BitVec 64)) V!24491)

(assert (=> b!820102 (= e!455590 (= (apply!355 lt!368440 (select (arr!21756 _keys!976) #b00000000000000000000000000000000)) (get!11610 (select (arr!21757 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!820102 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22178 _values!788)))))

(assert (=> b!820102 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22177 _keys!976)))))

(declare-fun b!820103 () Bool)

(assert (=> b!820103 (= e!455593 e!455590)))

(declare-fun res!559638 () Bool)

(assert (=> b!820103 (=> (not res!559638) (not e!455590))))

(assert (=> b!820103 (= res!559638 (contains!4141 lt!368440 (select (arr!21756 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820103 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22177 _keys!976)))))

(declare-fun b!820104 () Bool)

(declare-fun res!559642 () Bool)

(assert (=> b!820104 (=> (not res!559642) (not e!455597))))

(assert (=> b!820104 (= res!559642 e!455589)))

(declare-fun c!89115 () Bool)

(assert (=> b!820104 (= c!89115 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!104523 c!89117) b!820085))

(assert (= (and d!104523 (not c!89117)) b!820097))

(assert (= (and b!820097 c!89118) b!820095))

(assert (= (and b!820097 (not c!89118)) b!820100))

(assert (= (and b!820100 c!89116) b!820091))

(assert (= (and b!820100 (not c!89116)) b!820099))

(assert (= (or b!820091 b!820099) bm!35666))

(assert (= (or b!820095 bm!35666) bm!35667))

(assert (= (or b!820095 b!820091) bm!35664))

(assert (= (or b!820085 bm!35667) bm!35665))

(assert (= (or b!820085 bm!35664) bm!35669))

(assert (= (and d!104523 res!559643) b!820084))

(assert (= (and d!104523 c!89114) b!820098))

(assert (= (and d!104523 (not c!89114)) b!820087))

(assert (= (and d!104523 res!559637) b!820089))

(assert (= (and b!820089 res!559644) b!820093))

(assert (= (and b!820089 (not res!559636)) b!820103))

(assert (= (and b!820103 res!559638) b!820102))

(assert (= (and b!820089 res!559639) b!820104))

(assert (= (and b!820104 c!89115) b!820094))

(assert (= (and b!820104 (not c!89115)) b!820101))

(assert (= (and b!820094 res!559641) b!820096))

(assert (= (or b!820094 b!820101) bm!35668))

(assert (= (and b!820104 res!559642) b!820092))

(assert (= (and b!820092 c!89119) b!820090))

(assert (= (and b!820092 (not c!89119)) b!820088))

(assert (= (and b!820090 res!559640) b!820086))

(assert (= (or b!820090 b!820088) bm!35663))

(declare-fun b_lambda!10953 () Bool)

(assert (=> (not b_lambda!10953) (not b!820102)))

(declare-fun t!21851 () Bool)

(declare-fun tb!4183 () Bool)

(assert (=> (and start!70580 (= defaultEntry!796 defaultEntry!796) t!21851) tb!4183))

(declare-fun result!7905 () Bool)

(assert (=> tb!4183 (= result!7905 tp_is_empty!14617)))

(assert (=> b!820102 t!21851))

(declare-fun b_and!21729 () Bool)

(assert (= b_and!21723 (and (=> t!21851 result!7905) b_and!21729)))

(assert (=> bm!35665 m!761351))

(declare-fun m!761471 () Bool)

(assert (=> b!820098 m!761471))

(declare-fun m!761473 () Bool)

(assert (=> b!820098 m!761473))

(declare-fun m!761475 () Bool)

(assert (=> b!820098 m!761475))

(declare-fun m!761477 () Bool)

(assert (=> b!820098 m!761477))

(declare-fun m!761479 () Bool)

(assert (=> b!820098 m!761479))

(assert (=> b!820098 m!761351))

(assert (=> b!820098 m!761427))

(declare-fun m!761481 () Bool)

(assert (=> b!820098 m!761481))

(declare-fun m!761483 () Bool)

(assert (=> b!820098 m!761483))

(declare-fun m!761485 () Bool)

(assert (=> b!820098 m!761485))

(declare-fun m!761487 () Bool)

(assert (=> b!820098 m!761487))

(declare-fun m!761489 () Bool)

(assert (=> b!820098 m!761489))

(declare-fun m!761491 () Bool)

(assert (=> b!820098 m!761491))

(assert (=> b!820098 m!761485))

(declare-fun m!761493 () Bool)

(assert (=> b!820098 m!761493))

(declare-fun m!761495 () Bool)

(assert (=> b!820098 m!761495))

(declare-fun m!761497 () Bool)

(assert (=> b!820098 m!761497))

(declare-fun m!761499 () Bool)

(assert (=> b!820098 m!761499))

(assert (=> b!820098 m!761477))

(assert (=> b!820098 m!761471))

(assert (=> b!820098 m!761497))

(declare-fun m!761501 () Bool)

(assert (=> bm!35669 m!761501))

(declare-fun m!761503 () Bool)

(assert (=> b!820085 m!761503))

(assert (=> b!820093 m!761427))

(assert (=> b!820093 m!761427))

(assert (=> b!820093 m!761429))

(declare-fun m!761505 () Bool)

(assert (=> b!820096 m!761505))

(declare-fun m!761507 () Bool)

(assert (=> bm!35668 m!761507))

(declare-fun m!761509 () Bool)

(assert (=> b!820102 m!761509))

(assert (=> b!820102 m!761427))

(assert (=> b!820102 m!761427))

(declare-fun m!761511 () Bool)

(assert (=> b!820102 m!761511))

(assert (=> b!820102 m!761509))

(declare-fun m!761513 () Bool)

(assert (=> b!820102 m!761513))

(declare-fun m!761515 () Bool)

(assert (=> b!820102 m!761515))

(assert (=> b!820102 m!761513))

(assert (=> b!820084 m!761427))

(assert (=> b!820084 m!761427))

(assert (=> b!820084 m!761429))

(declare-fun m!761517 () Bool)

(assert (=> bm!35663 m!761517))

(declare-fun m!761519 () Bool)

(assert (=> b!820086 m!761519))

(assert (=> b!820103 m!761427))

(assert (=> b!820103 m!761427))

(declare-fun m!761521 () Bool)

(assert (=> b!820103 m!761521))

(assert (=> d!104523 m!761337))

(assert (=> b!819952 d!104523))

(declare-fun b!820107 () Bool)

(declare-fun e!455604 () Bool)

(assert (=> b!820107 (= e!455604 (validKeyInArray!0 (select (arr!21756 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820109 () Bool)

(declare-fun e!455600 () Bool)

(declare-fun lt!368462 () ListLongMap!8523)

(assert (=> b!820109 (= e!455600 (= (apply!355 lt!368462 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!820110 () Bool)

(declare-fun e!455607 () Unit!27981)

(declare-fun Unit!27984 () Unit!27981)

(assert (=> b!820110 (= e!455607 Unit!27984)))

(declare-fun b!820111 () Bool)

(declare-fun e!455612 () Bool)

(declare-fun call!35679 () Bool)

(assert (=> b!820111 (= e!455612 (not call!35679))))

(declare-fun b!820112 () Bool)

(declare-fun res!559648 () Bool)

(declare-fun e!455610 () Bool)

(assert (=> b!820112 (=> (not res!559648) (not e!455610))))

(declare-fun e!455606 () Bool)

(assert (=> b!820112 (= res!559648 e!455606)))

(declare-fun res!559645 () Bool)

(assert (=> b!820112 (=> res!559645 e!455606)))

(declare-fun e!455611 () Bool)

(assert (=> b!820112 (= res!559645 (not e!455611))))

(declare-fun res!559653 () Bool)

(assert (=> b!820112 (=> (not res!559653) (not e!455611))))

(assert (=> b!820112 (= res!559653 (bvslt #b00000000000000000000000000000000 (size!22177 _keys!976)))))

(declare-fun bm!35670 () Bool)

(assert (=> bm!35670 (= call!35679 (contains!4141 lt!368462 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!820113 () Bool)

(assert (=> b!820113 (= e!455612 e!455600)))

(declare-fun res!559649 () Bool)

(assert (=> b!820113 (= res!559649 call!35679)))

(assert (=> b!820113 (=> (not res!559649) (not e!455600))))

(declare-fun b!820114 () Bool)

(declare-fun e!455609 () ListLongMap!8523)

(declare-fun call!35674 () ListLongMap!8523)

(assert (=> b!820114 (= e!455609 call!35674)))

(declare-fun bm!35671 () Bool)

(declare-fun call!35673 () ListLongMap!8523)

(assert (=> bm!35671 (= call!35674 call!35673)))

(declare-fun bm!35672 () Bool)

(declare-fun call!35676 () ListLongMap!8523)

(assert (=> bm!35672 (= call!35676 (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!35673 () Bool)

(declare-fun call!35677 () ListLongMap!8523)

(declare-fun call!35675 () ListLongMap!8523)

(assert (=> bm!35673 (= call!35677 call!35675)))

(declare-fun b!820115 () Bool)

(assert (=> b!820115 (= e!455610 e!455612)))

(declare-fun c!89125 () Bool)

(assert (=> b!820115 (= c!89125 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!820116 () Bool)

(assert (=> b!820116 (= e!455611 (validKeyInArray!0 (select (arr!21756 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820117 () Bool)

(declare-fun e!455602 () Bool)

(declare-fun e!455608 () Bool)

(assert (=> b!820117 (= e!455602 e!455608)))

(declare-fun res!559650 () Bool)

(declare-fun call!35678 () Bool)

(assert (=> b!820117 (= res!559650 call!35678)))

(assert (=> b!820117 (=> (not res!559650) (not e!455608))))

(declare-fun b!820118 () Bool)

(declare-fun e!455601 () ListLongMap!8523)

(assert (=> b!820118 (= e!455601 call!35674)))

(declare-fun d!104525 () Bool)

(assert (=> d!104525 e!455610))

(declare-fun res!559646 () Bool)

(assert (=> d!104525 (=> (not res!559646) (not e!455610))))

(assert (=> d!104525 (= res!559646 (or (bvsge #b00000000000000000000000000000000 (size!22177 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22177 _keys!976)))))))

(declare-fun lt!368470 () ListLongMap!8523)

(assert (=> d!104525 (= lt!368462 lt!368470)))

(declare-fun lt!368465 () Unit!27981)

(assert (=> d!104525 (= lt!368465 e!455607)))

(declare-fun c!89120 () Bool)

(assert (=> d!104525 (= c!89120 e!455604)))

(declare-fun res!559652 () Bool)

(assert (=> d!104525 (=> (not res!559652) (not e!455604))))

(assert (=> d!104525 (= res!559652 (bvslt #b00000000000000000000000000000000 (size!22177 _keys!976)))))

(declare-fun e!455605 () ListLongMap!8523)

(assert (=> d!104525 (= lt!368470 e!455605)))

(declare-fun c!89123 () Bool)

(assert (=> d!104525 (= c!89123 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104525 (validMask!0 mask!1312)))

(assert (=> d!104525 (= (getCurrentListMap!2425 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!368462)))

(declare-fun b!820108 () Bool)

(assert (=> b!820108 (= e!455605 (+!1898 call!35673 (tuple2!9711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!35674 () Bool)

(assert (=> bm!35674 (= call!35675 call!35676)))

(declare-fun bm!35675 () Bool)

(assert (=> bm!35675 (= call!35678 (contains!4141 lt!368462 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!820119 () Bool)

(assert (=> b!820119 (= e!455608 (= (apply!355 lt!368462 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!820120 () Bool)

(assert (=> b!820120 (= e!455605 e!455601)))

(declare-fun c!89124 () Bool)

(assert (=> b!820120 (= c!89124 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!820121 () Bool)

(declare-fun lt!368460 () Unit!27981)

(assert (=> b!820121 (= e!455607 lt!368460)))

(declare-fun lt!368468 () ListLongMap!8523)

(assert (=> b!820121 (= lt!368468 (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368466 () (_ BitVec 64))

(assert (=> b!820121 (= lt!368466 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368480 () (_ BitVec 64))

(assert (=> b!820121 (= lt!368480 (select (arr!21756 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368461 () Unit!27981)

(assert (=> b!820121 (= lt!368461 (addStillContains!309 lt!368468 lt!368466 zeroValueAfter!34 lt!368480))))

(assert (=> b!820121 (contains!4141 (+!1898 lt!368468 (tuple2!9711 lt!368466 zeroValueAfter!34)) lt!368480)))

(declare-fun lt!368478 () Unit!27981)

(assert (=> b!820121 (= lt!368478 lt!368461)))

(declare-fun lt!368469 () ListLongMap!8523)

(assert (=> b!820121 (= lt!368469 (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368459 () (_ BitVec 64))

(assert (=> b!820121 (= lt!368459 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368477 () (_ BitVec 64))

(assert (=> b!820121 (= lt!368477 (select (arr!21756 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368467 () Unit!27981)

(assert (=> b!820121 (= lt!368467 (addApplyDifferent!309 lt!368469 lt!368459 minValue!754 lt!368477))))

(assert (=> b!820121 (= (apply!355 (+!1898 lt!368469 (tuple2!9711 lt!368459 minValue!754)) lt!368477) (apply!355 lt!368469 lt!368477))))

(declare-fun lt!368479 () Unit!27981)

(assert (=> b!820121 (= lt!368479 lt!368467)))

(declare-fun lt!368475 () ListLongMap!8523)

(assert (=> b!820121 (= lt!368475 (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368471 () (_ BitVec 64))

(assert (=> b!820121 (= lt!368471 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368464 () (_ BitVec 64))

(assert (=> b!820121 (= lt!368464 (select (arr!21756 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368474 () Unit!27981)

(assert (=> b!820121 (= lt!368474 (addApplyDifferent!309 lt!368475 lt!368471 zeroValueAfter!34 lt!368464))))

(assert (=> b!820121 (= (apply!355 (+!1898 lt!368475 (tuple2!9711 lt!368471 zeroValueAfter!34)) lt!368464) (apply!355 lt!368475 lt!368464))))

(declare-fun lt!368472 () Unit!27981)

(assert (=> b!820121 (= lt!368472 lt!368474)))

(declare-fun lt!368476 () ListLongMap!8523)

(assert (=> b!820121 (= lt!368476 (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368473 () (_ BitVec 64))

(assert (=> b!820121 (= lt!368473 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368463 () (_ BitVec 64))

(assert (=> b!820121 (= lt!368463 (select (arr!21756 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!820121 (= lt!368460 (addApplyDifferent!309 lt!368476 lt!368473 minValue!754 lt!368463))))

(assert (=> b!820121 (= (apply!355 (+!1898 lt!368476 (tuple2!9711 lt!368473 minValue!754)) lt!368463) (apply!355 lt!368476 lt!368463))))

(declare-fun b!820122 () Bool)

(assert (=> b!820122 (= e!455609 call!35677)))

(declare-fun b!820123 () Bool)

(declare-fun c!89122 () Bool)

(assert (=> b!820123 (= c!89122 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!820123 (= e!455601 e!455609)))

(declare-fun bm!35676 () Bool)

(assert (=> bm!35676 (= call!35673 (+!1898 (ite c!89123 call!35676 (ite c!89124 call!35675 call!35677)) (ite (or c!89123 c!89124) (tuple2!9711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!9711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!820124 () Bool)

(assert (=> b!820124 (= e!455602 (not call!35678))))

(declare-fun b!820125 () Bool)

(declare-fun e!455603 () Bool)

(assert (=> b!820125 (= e!455603 (= (apply!355 lt!368462 (select (arr!21756 _keys!976) #b00000000000000000000000000000000)) (get!11610 (select (arr!21757 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!820125 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22178 _values!788)))))

(assert (=> b!820125 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22177 _keys!976)))))

(declare-fun b!820126 () Bool)

(assert (=> b!820126 (= e!455606 e!455603)))

(declare-fun res!559647 () Bool)

(assert (=> b!820126 (=> (not res!559647) (not e!455603))))

(assert (=> b!820126 (= res!559647 (contains!4141 lt!368462 (select (arr!21756 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820126 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22177 _keys!976)))))

(declare-fun b!820127 () Bool)

(declare-fun res!559651 () Bool)

(assert (=> b!820127 (=> (not res!559651) (not e!455610))))

(assert (=> b!820127 (= res!559651 e!455602)))

(declare-fun c!89121 () Bool)

(assert (=> b!820127 (= c!89121 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!104525 c!89123) b!820108))

(assert (= (and d!104525 (not c!89123)) b!820120))

(assert (= (and b!820120 c!89124) b!820118))

(assert (= (and b!820120 (not c!89124)) b!820123))

(assert (= (and b!820123 c!89122) b!820114))

(assert (= (and b!820123 (not c!89122)) b!820122))

(assert (= (or b!820114 b!820122) bm!35673))

(assert (= (or b!820118 bm!35673) bm!35674))

(assert (= (or b!820118 b!820114) bm!35671))

(assert (= (or b!820108 bm!35674) bm!35672))

(assert (= (or b!820108 bm!35671) bm!35676))

(assert (= (and d!104525 res!559652) b!820107))

(assert (= (and d!104525 c!89120) b!820121))

(assert (= (and d!104525 (not c!89120)) b!820110))

(assert (= (and d!104525 res!559646) b!820112))

(assert (= (and b!820112 res!559653) b!820116))

(assert (= (and b!820112 (not res!559645)) b!820126))

(assert (= (and b!820126 res!559647) b!820125))

(assert (= (and b!820112 res!559648) b!820127))

(assert (= (and b!820127 c!89121) b!820117))

(assert (= (and b!820127 (not c!89121)) b!820124))

(assert (= (and b!820117 res!559650) b!820119))

(assert (= (or b!820117 b!820124) bm!35675))

(assert (= (and b!820127 res!559651) b!820115))

(assert (= (and b!820115 c!89125) b!820113))

(assert (= (and b!820115 (not c!89125)) b!820111))

(assert (= (and b!820113 res!559649) b!820109))

(assert (= (or b!820113 b!820111) bm!35670))

(declare-fun b_lambda!10955 () Bool)

(assert (=> (not b_lambda!10955) (not b!820125)))

(assert (=> b!820125 t!21851))

(declare-fun b_and!21731 () Bool)

(assert (= b_and!21729 (and (=> t!21851 result!7905) b_and!21731)))

(assert (=> bm!35672 m!761349))

(declare-fun m!761523 () Bool)

(assert (=> b!820121 m!761523))

(declare-fun m!761525 () Bool)

(assert (=> b!820121 m!761525))

(declare-fun m!761527 () Bool)

(assert (=> b!820121 m!761527))

(declare-fun m!761529 () Bool)

(assert (=> b!820121 m!761529))

(declare-fun m!761531 () Bool)

(assert (=> b!820121 m!761531))

(assert (=> b!820121 m!761349))

(assert (=> b!820121 m!761427))

(declare-fun m!761533 () Bool)

(assert (=> b!820121 m!761533))

(declare-fun m!761535 () Bool)

(assert (=> b!820121 m!761535))

(declare-fun m!761537 () Bool)

(assert (=> b!820121 m!761537))

(declare-fun m!761539 () Bool)

(assert (=> b!820121 m!761539))

(declare-fun m!761541 () Bool)

(assert (=> b!820121 m!761541))

(declare-fun m!761543 () Bool)

(assert (=> b!820121 m!761543))

(assert (=> b!820121 m!761537))

(declare-fun m!761545 () Bool)

(assert (=> b!820121 m!761545))

(declare-fun m!761547 () Bool)

(assert (=> b!820121 m!761547))

(declare-fun m!761549 () Bool)

(assert (=> b!820121 m!761549))

(declare-fun m!761551 () Bool)

(assert (=> b!820121 m!761551))

(assert (=> b!820121 m!761529))

(assert (=> b!820121 m!761523))

(assert (=> b!820121 m!761549))

(declare-fun m!761553 () Bool)

(assert (=> bm!35676 m!761553))

(declare-fun m!761555 () Bool)

(assert (=> b!820108 m!761555))

(assert (=> b!820116 m!761427))

(assert (=> b!820116 m!761427))

(assert (=> b!820116 m!761429))

(declare-fun m!761557 () Bool)

(assert (=> b!820119 m!761557))

(declare-fun m!761559 () Bool)

(assert (=> bm!35675 m!761559))

(assert (=> b!820125 m!761509))

(assert (=> b!820125 m!761427))

(assert (=> b!820125 m!761427))

(declare-fun m!761561 () Bool)

(assert (=> b!820125 m!761561))

(assert (=> b!820125 m!761509))

(assert (=> b!820125 m!761513))

(assert (=> b!820125 m!761515))

(assert (=> b!820125 m!761513))

(assert (=> b!820107 m!761427))

(assert (=> b!820107 m!761427))

(assert (=> b!820107 m!761429))

(declare-fun m!761563 () Bool)

(assert (=> bm!35670 m!761563))

(declare-fun m!761565 () Bool)

(assert (=> b!820109 m!761565))

(assert (=> b!820126 m!761427))

(assert (=> b!820126 m!761427))

(declare-fun m!761567 () Bool)

(assert (=> b!820126 m!761567))

(assert (=> d!104525 m!761337))

(assert (=> b!819952 d!104525))

(declare-fun d!104527 () Bool)

(declare-fun e!455613 () Bool)

(assert (=> d!104527 e!455613))

(declare-fun res!559655 () Bool)

(assert (=> d!104527 (=> (not res!559655) (not e!455613))))

(declare-fun lt!368484 () ListLongMap!8523)

(assert (=> d!104527 (= res!559655 (contains!4141 lt!368484 (_1!4866 lt!368310)))))

(declare-fun lt!368483 () List!15526)

(assert (=> d!104527 (= lt!368484 (ListLongMap!8524 lt!368483))))

(declare-fun lt!368481 () Unit!27981)

(declare-fun lt!368482 () Unit!27981)

(assert (=> d!104527 (= lt!368481 lt!368482)))

(assert (=> d!104527 (= (getValueByKey!401 lt!368483 (_1!4866 lt!368310)) (Some!406 (_2!4866 lt!368310)))))

(assert (=> d!104527 (= lt!368482 (lemmaContainsTupThenGetReturnValue!218 lt!368483 (_1!4866 lt!368310) (_2!4866 lt!368310)))))

(assert (=> d!104527 (= lt!368483 (insertStrictlySorted!257 (toList!4277 lt!368304) (_1!4866 lt!368310) (_2!4866 lt!368310)))))

(assert (=> d!104527 (= (+!1898 lt!368304 lt!368310) lt!368484)))

(declare-fun b!820128 () Bool)

(declare-fun res!559654 () Bool)

(assert (=> b!820128 (=> (not res!559654) (not e!455613))))

(assert (=> b!820128 (= res!559654 (= (getValueByKey!401 (toList!4277 lt!368484) (_1!4866 lt!368310)) (Some!406 (_2!4866 lt!368310))))))

(declare-fun b!820129 () Bool)

(assert (=> b!820129 (= e!455613 (contains!4142 (toList!4277 lt!368484) lt!368310))))

(assert (= (and d!104527 res!559655) b!820128))

(assert (= (and b!820128 res!559654) b!820129))

(declare-fun m!761569 () Bool)

(assert (=> d!104527 m!761569))

(declare-fun m!761571 () Bool)

(assert (=> d!104527 m!761571))

(declare-fun m!761573 () Bool)

(assert (=> d!104527 m!761573))

(declare-fun m!761575 () Bool)

(assert (=> d!104527 m!761575))

(declare-fun m!761577 () Bool)

(assert (=> b!820128 m!761577))

(declare-fun m!761579 () Bool)

(assert (=> b!820129 m!761579))

(assert (=> b!819952 d!104527))

(declare-fun d!104529 () Bool)

(declare-fun e!455614 () Bool)

(assert (=> d!104529 e!455614))

(declare-fun res!559657 () Bool)

(assert (=> d!104529 (=> (not res!559657) (not e!455614))))

(declare-fun lt!368488 () ListLongMap!8523)

(assert (=> d!104529 (= res!559657 (contains!4141 lt!368488 (_1!4866 lt!368310)))))

(declare-fun lt!368487 () List!15526)

(assert (=> d!104529 (= lt!368488 (ListLongMap!8524 lt!368487))))

(declare-fun lt!368485 () Unit!27981)

(declare-fun lt!368486 () Unit!27981)

(assert (=> d!104529 (= lt!368485 lt!368486)))

(assert (=> d!104529 (= (getValueByKey!401 lt!368487 (_1!4866 lt!368310)) (Some!406 (_2!4866 lt!368310)))))

(assert (=> d!104529 (= lt!368486 (lemmaContainsTupThenGetReturnValue!218 lt!368487 (_1!4866 lt!368310) (_2!4866 lt!368310)))))

(assert (=> d!104529 (= lt!368487 (insertStrictlySorted!257 (toList!4277 (+!1898 lt!368305 lt!368307)) (_1!4866 lt!368310) (_2!4866 lt!368310)))))

(assert (=> d!104529 (= (+!1898 (+!1898 lt!368305 lt!368307) lt!368310) lt!368488)))

(declare-fun b!820130 () Bool)

(declare-fun res!559656 () Bool)

(assert (=> b!820130 (=> (not res!559656) (not e!455614))))

(assert (=> b!820130 (= res!559656 (= (getValueByKey!401 (toList!4277 lt!368488) (_1!4866 lt!368310)) (Some!406 (_2!4866 lt!368310))))))

(declare-fun b!820131 () Bool)

(assert (=> b!820131 (= e!455614 (contains!4142 (toList!4277 lt!368488) lt!368310))))

(assert (= (and d!104529 res!559657) b!820130))

(assert (= (and b!820130 res!559656) b!820131))

(declare-fun m!761581 () Bool)

(assert (=> d!104529 m!761581))

(declare-fun m!761583 () Bool)

(assert (=> d!104529 m!761583))

(declare-fun m!761585 () Bool)

(assert (=> d!104529 m!761585))

(declare-fun m!761587 () Bool)

(assert (=> d!104529 m!761587))

(declare-fun m!761589 () Bool)

(assert (=> b!820130 m!761589))

(declare-fun m!761591 () Bool)

(assert (=> b!820131 m!761591))

(assert (=> b!819952 d!104529))

(declare-fun d!104531 () Bool)

(declare-fun e!455615 () Bool)

(assert (=> d!104531 e!455615))

(declare-fun res!559659 () Bool)

(assert (=> d!104531 (=> (not res!559659) (not e!455615))))

(declare-fun lt!368492 () ListLongMap!8523)

(assert (=> d!104531 (= res!559659 (contains!4141 lt!368492 (_1!4866 lt!368307)))))

(declare-fun lt!368491 () List!15526)

(assert (=> d!104531 (= lt!368492 (ListLongMap!8524 lt!368491))))

(declare-fun lt!368489 () Unit!27981)

(declare-fun lt!368490 () Unit!27981)

(assert (=> d!104531 (= lt!368489 lt!368490)))

(assert (=> d!104531 (= (getValueByKey!401 lt!368491 (_1!4866 lt!368307)) (Some!406 (_2!4866 lt!368307)))))

(assert (=> d!104531 (= lt!368490 (lemmaContainsTupThenGetReturnValue!218 lt!368491 (_1!4866 lt!368307) (_2!4866 lt!368307)))))

(assert (=> d!104531 (= lt!368491 (insertStrictlySorted!257 (toList!4277 lt!368305) (_1!4866 lt!368307) (_2!4866 lt!368307)))))

(assert (=> d!104531 (= (+!1898 lt!368305 lt!368307) lt!368492)))

(declare-fun b!820132 () Bool)

(declare-fun res!559658 () Bool)

(assert (=> b!820132 (=> (not res!559658) (not e!455615))))

(assert (=> b!820132 (= res!559658 (= (getValueByKey!401 (toList!4277 lt!368492) (_1!4866 lt!368307)) (Some!406 (_2!4866 lt!368307))))))

(declare-fun b!820133 () Bool)

(assert (=> b!820133 (= e!455615 (contains!4142 (toList!4277 lt!368492) lt!368307))))

(assert (= (and d!104531 res!559659) b!820132))

(assert (= (and b!820132 res!559658) b!820133))

(declare-fun m!761593 () Bool)

(assert (=> d!104531 m!761593))

(declare-fun m!761595 () Bool)

(assert (=> d!104531 m!761595))

(declare-fun m!761597 () Bool)

(assert (=> d!104531 m!761597))

(declare-fun m!761599 () Bool)

(assert (=> d!104531 m!761599))

(declare-fun m!761601 () Bool)

(assert (=> b!820132 m!761601))

(declare-fun m!761603 () Bool)

(assert (=> b!820133 m!761603))

(assert (=> b!819952 d!104531))

(declare-fun d!104533 () Bool)

(declare-fun e!455616 () Bool)

(assert (=> d!104533 e!455616))

(declare-fun res!559661 () Bool)

(assert (=> d!104533 (=> (not res!559661) (not e!455616))))

(declare-fun lt!368496 () ListLongMap!8523)

(assert (=> d!104533 (= res!559661 (contains!4141 lt!368496 (_1!4866 (tuple2!9711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!368495 () List!15526)

(assert (=> d!104533 (= lt!368496 (ListLongMap!8524 lt!368495))))

(declare-fun lt!368493 () Unit!27981)

(declare-fun lt!368494 () Unit!27981)

(assert (=> d!104533 (= lt!368493 lt!368494)))

(assert (=> d!104533 (= (getValueByKey!401 lt!368495 (_1!4866 (tuple2!9711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!406 (_2!4866 (tuple2!9711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104533 (= lt!368494 (lemmaContainsTupThenGetReturnValue!218 lt!368495 (_1!4866 (tuple2!9711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4866 (tuple2!9711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104533 (= lt!368495 (insertStrictlySorted!257 (toList!4277 lt!368305) (_1!4866 (tuple2!9711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4866 (tuple2!9711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104533 (= (+!1898 lt!368305 (tuple2!9711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!368496)))

(declare-fun b!820134 () Bool)

(declare-fun res!559660 () Bool)

(assert (=> b!820134 (=> (not res!559660) (not e!455616))))

(assert (=> b!820134 (= res!559660 (= (getValueByKey!401 (toList!4277 lt!368496) (_1!4866 (tuple2!9711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!406 (_2!4866 (tuple2!9711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!820135 () Bool)

(assert (=> b!820135 (= e!455616 (contains!4142 (toList!4277 lt!368496) (tuple2!9711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!104533 res!559661) b!820134))

(assert (= (and b!820134 res!559660) b!820135))

(declare-fun m!761605 () Bool)

(assert (=> d!104533 m!761605))

(declare-fun m!761607 () Bool)

(assert (=> d!104533 m!761607))

(declare-fun m!761609 () Bool)

(assert (=> d!104533 m!761609))

(declare-fun m!761611 () Bool)

(assert (=> d!104533 m!761611))

(declare-fun m!761613 () Bool)

(assert (=> b!820134 m!761613))

(declare-fun m!761615 () Bool)

(assert (=> b!820135 m!761615))

(assert (=> b!819961 d!104533))

(declare-fun b!820146 () Bool)

(declare-fun e!455628 () Bool)

(declare-fun contains!4143 (List!15527 (_ BitVec 64)) Bool)

(assert (=> b!820146 (= e!455628 (contains!4143 Nil!15524 (select (arr!21756 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820148 () Bool)

(declare-fun e!455625 () Bool)

(declare-fun call!35682 () Bool)

(assert (=> b!820148 (= e!455625 call!35682)))

(declare-fun bm!35679 () Bool)

(declare-fun c!89128 () Bool)

(assert (=> bm!35679 (= call!35682 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89128 (Cons!15523 (select (arr!21756 _keys!976) #b00000000000000000000000000000000) Nil!15524) Nil!15524)))))

(declare-fun b!820149 () Bool)

(declare-fun e!455627 () Bool)

(assert (=> b!820149 (= e!455627 e!455625)))

(assert (=> b!820149 (= c!89128 (validKeyInArray!0 (select (arr!21756 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820150 () Bool)

(declare-fun e!455626 () Bool)

(assert (=> b!820150 (= e!455626 e!455627)))

(declare-fun res!559669 () Bool)

(assert (=> b!820150 (=> (not res!559669) (not e!455627))))

(assert (=> b!820150 (= res!559669 (not e!455628))))

(declare-fun res!559668 () Bool)

(assert (=> b!820150 (=> (not res!559668) (not e!455628))))

(assert (=> b!820150 (= res!559668 (validKeyInArray!0 (select (arr!21756 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104535 () Bool)

(declare-fun res!559670 () Bool)

(assert (=> d!104535 (=> res!559670 e!455626)))

(assert (=> d!104535 (= res!559670 (bvsge #b00000000000000000000000000000000 (size!22177 _keys!976)))))

(assert (=> d!104535 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15524) e!455626)))

(declare-fun b!820147 () Bool)

(assert (=> b!820147 (= e!455625 call!35682)))

(assert (= (and d!104535 (not res!559670)) b!820150))

(assert (= (and b!820150 res!559668) b!820146))

(assert (= (and b!820150 res!559669) b!820149))

(assert (= (and b!820149 c!89128) b!820148))

(assert (= (and b!820149 (not c!89128)) b!820147))

(assert (= (or b!820148 b!820147) bm!35679))

(assert (=> b!820146 m!761427))

(assert (=> b!820146 m!761427))

(declare-fun m!761617 () Bool)

(assert (=> b!820146 m!761617))

(assert (=> bm!35679 m!761427))

(declare-fun m!761619 () Bool)

(assert (=> bm!35679 m!761619))

(assert (=> b!820149 m!761427))

(assert (=> b!820149 m!761427))

(assert (=> b!820149 m!761429))

(assert (=> b!820150 m!761427))

(assert (=> b!820150 m!761427))

(assert (=> b!820150 m!761429))

(assert (=> b!819954 d!104535))

(declare-fun d!104537 () Bool)

(assert (=> d!104537 (= (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368499 () Unit!27981)

(declare-fun choose!1405 (array!45405 array!45407 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24491 V!24491 V!24491 V!24491 (_ BitVec 32) Int) Unit!27981)

(assert (=> d!104537 (= lt!368499 (choose!1405 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104537 (validMask!0 mask!1312)))

(assert (=> d!104537 (= (lemmaNoChangeToArrayThenSameMapNoExtras!422 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!368499)))

(declare-fun bs!22838 () Bool)

(assert (= bs!22838 d!104537))

(assert (=> bs!22838 m!761351))

(assert (=> bs!22838 m!761349))

(declare-fun m!761621 () Bool)

(assert (=> bs!22838 m!761621))

(assert (=> bs!22838 m!761337))

(assert (=> b!819958 d!104537))

(declare-fun b!820175 () Bool)

(declare-fun e!455649 () ListLongMap!8523)

(assert (=> b!820175 (= e!455649 (ListLongMap!8524 Nil!15523))))

(declare-fun b!820176 () Bool)

(declare-fun e!455648 () ListLongMap!8523)

(assert (=> b!820176 (= e!455649 e!455648)))

(declare-fun c!89140 () Bool)

(assert (=> b!820176 (= c!89140 (validKeyInArray!0 (select (arr!21756 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820177 () Bool)

(declare-fun e!455644 () Bool)

(declare-fun e!455645 () Bool)

(assert (=> b!820177 (= e!455644 e!455645)))

(declare-fun c!89139 () Bool)

(declare-fun e!455646 () Bool)

(assert (=> b!820177 (= c!89139 e!455646)))

(declare-fun res!559679 () Bool)

(assert (=> b!820177 (=> (not res!559679) (not e!455646))))

(assert (=> b!820177 (= res!559679 (bvslt #b00000000000000000000000000000000 (size!22177 _keys!976)))))

(declare-fun b!820178 () Bool)

(declare-fun res!559680 () Bool)

(assert (=> b!820178 (=> (not res!559680) (not e!455644))))

(declare-fun lt!368517 () ListLongMap!8523)

(assert (=> b!820178 (= res!559680 (not (contains!4141 lt!368517 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!104539 () Bool)

(assert (=> d!104539 e!455644))

(declare-fun res!559682 () Bool)

(assert (=> d!104539 (=> (not res!559682) (not e!455644))))

(assert (=> d!104539 (= res!559682 (not (contains!4141 lt!368517 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104539 (= lt!368517 e!455649)))

(declare-fun c!89138 () Bool)

(assert (=> d!104539 (= c!89138 (bvsge #b00000000000000000000000000000000 (size!22177 _keys!976)))))

(assert (=> d!104539 (validMask!0 mask!1312)))

(assert (=> d!104539 (= (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!368517)))

(declare-fun b!820179 () Bool)

(declare-fun e!455647 () Bool)

(declare-fun isEmpty!642 (ListLongMap!8523) Bool)

(assert (=> b!820179 (= e!455647 (isEmpty!642 lt!368517))))

(declare-fun b!820180 () Bool)

(assert (=> b!820180 (= e!455646 (validKeyInArray!0 (select (arr!21756 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820180 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!820181 () Bool)

(assert (=> b!820181 (= e!455647 (= lt!368517 (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!820182 () Bool)

(assert (=> b!820182 (= e!455645 e!455647)))

(declare-fun c!89137 () Bool)

(assert (=> b!820182 (= c!89137 (bvslt #b00000000000000000000000000000000 (size!22177 _keys!976)))))

(declare-fun b!820183 () Bool)

(declare-fun e!455643 () Bool)

(assert (=> b!820183 (= e!455645 e!455643)))

(assert (=> b!820183 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22177 _keys!976)))))

(declare-fun res!559681 () Bool)

(assert (=> b!820183 (= res!559681 (contains!4141 lt!368517 (select (arr!21756 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820183 (=> (not res!559681) (not e!455643))))

(declare-fun b!820184 () Bool)

(assert (=> b!820184 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22177 _keys!976)))))

(assert (=> b!820184 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22178 _values!788)))))

(assert (=> b!820184 (= e!455643 (= (apply!355 lt!368517 (select (arr!21756 _keys!976) #b00000000000000000000000000000000)) (get!11610 (select (arr!21757 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!820185 () Bool)

(declare-fun lt!368518 () Unit!27981)

(declare-fun lt!368515 () Unit!27981)

(assert (=> b!820185 (= lt!368518 lt!368515)))

(declare-fun lt!368514 () (_ BitVec 64))

(declare-fun lt!368519 () (_ BitVec 64))

(declare-fun lt!368520 () V!24491)

(declare-fun lt!368516 () ListLongMap!8523)

(assert (=> b!820185 (not (contains!4141 (+!1898 lt!368516 (tuple2!9711 lt!368514 lt!368520)) lt!368519))))

(declare-fun addStillNotContains!181 (ListLongMap!8523 (_ BitVec 64) V!24491 (_ BitVec 64)) Unit!27981)

(assert (=> b!820185 (= lt!368515 (addStillNotContains!181 lt!368516 lt!368514 lt!368520 lt!368519))))

(assert (=> b!820185 (= lt!368519 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!820185 (= lt!368520 (get!11610 (select (arr!21757 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!820185 (= lt!368514 (select (arr!21756 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35685 () ListLongMap!8523)

(assert (=> b!820185 (= lt!368516 call!35685)))

(assert (=> b!820185 (= e!455648 (+!1898 call!35685 (tuple2!9711 (select (arr!21756 _keys!976) #b00000000000000000000000000000000) (get!11610 (select (arr!21757 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!35682 () Bool)

(assert (=> bm!35682 (= call!35685 (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!820186 () Bool)

(assert (=> b!820186 (= e!455648 call!35685)))

(assert (= (and d!104539 c!89138) b!820175))

(assert (= (and d!104539 (not c!89138)) b!820176))

(assert (= (and b!820176 c!89140) b!820185))

(assert (= (and b!820176 (not c!89140)) b!820186))

(assert (= (or b!820185 b!820186) bm!35682))

(assert (= (and d!104539 res!559682) b!820178))

(assert (= (and b!820178 res!559680) b!820177))

(assert (= (and b!820177 res!559679) b!820180))

(assert (= (and b!820177 c!89139) b!820183))

(assert (= (and b!820177 (not c!89139)) b!820182))

(assert (= (and b!820183 res!559681) b!820184))

(assert (= (and b!820182 c!89137) b!820181))

(assert (= (and b!820182 (not c!89137)) b!820179))

(declare-fun b_lambda!10957 () Bool)

(assert (=> (not b_lambda!10957) (not b!820184)))

(assert (=> b!820184 t!21851))

(declare-fun b_and!21733 () Bool)

(assert (= b_and!21731 (and (=> t!21851 result!7905) b_and!21733)))

(declare-fun b_lambda!10959 () Bool)

(assert (=> (not b_lambda!10959) (not b!820185)))

(assert (=> b!820185 t!21851))

(declare-fun b_and!21735 () Bool)

(assert (= b_and!21733 (and (=> t!21851 result!7905) b_and!21735)))

(assert (=> b!820185 m!761427))

(assert (=> b!820185 m!761509))

(assert (=> b!820185 m!761513))

(assert (=> b!820185 m!761515))

(declare-fun m!761623 () Bool)

(assert (=> b!820185 m!761623))

(declare-fun m!761625 () Bool)

(assert (=> b!820185 m!761625))

(declare-fun m!761627 () Bool)

(assert (=> b!820185 m!761627))

(assert (=> b!820185 m!761509))

(assert (=> b!820185 m!761513))

(assert (=> b!820185 m!761627))

(declare-fun m!761629 () Bool)

(assert (=> b!820185 m!761629))

(declare-fun m!761631 () Bool)

(assert (=> b!820181 m!761631))

(declare-fun m!761633 () Bool)

(assert (=> b!820178 m!761633))

(declare-fun m!761635 () Bool)

(assert (=> d!104539 m!761635))

(assert (=> d!104539 m!761337))

(assert (=> b!820180 m!761427))

(assert (=> b!820180 m!761427))

(assert (=> b!820180 m!761429))

(assert (=> b!820184 m!761427))

(assert (=> b!820184 m!761513))

(assert (=> b!820184 m!761509))

(assert (=> b!820184 m!761513))

(assert (=> b!820184 m!761515))

(assert (=> b!820184 m!761427))

(declare-fun m!761637 () Bool)

(assert (=> b!820184 m!761637))

(assert (=> b!820184 m!761509))

(assert (=> b!820176 m!761427))

(assert (=> b!820176 m!761427))

(assert (=> b!820176 m!761429))

(assert (=> bm!35682 m!761631))

(declare-fun m!761639 () Bool)

(assert (=> b!820179 m!761639))

(assert (=> b!820183 m!761427))

(assert (=> b!820183 m!761427))

(declare-fun m!761641 () Bool)

(assert (=> b!820183 m!761641))

(assert (=> b!819958 d!104539))

(declare-fun b!820187 () Bool)

(declare-fun e!455656 () ListLongMap!8523)

(assert (=> b!820187 (= e!455656 (ListLongMap!8524 Nil!15523))))

(declare-fun b!820188 () Bool)

(declare-fun e!455655 () ListLongMap!8523)

(assert (=> b!820188 (= e!455656 e!455655)))

(declare-fun c!89144 () Bool)

(assert (=> b!820188 (= c!89144 (validKeyInArray!0 (select (arr!21756 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820189 () Bool)

(declare-fun e!455651 () Bool)

(declare-fun e!455652 () Bool)

(assert (=> b!820189 (= e!455651 e!455652)))

(declare-fun c!89143 () Bool)

(declare-fun e!455653 () Bool)

(assert (=> b!820189 (= c!89143 e!455653)))

(declare-fun res!559683 () Bool)

(assert (=> b!820189 (=> (not res!559683) (not e!455653))))

(assert (=> b!820189 (= res!559683 (bvslt #b00000000000000000000000000000000 (size!22177 _keys!976)))))

(declare-fun b!820190 () Bool)

(declare-fun res!559684 () Bool)

(assert (=> b!820190 (=> (not res!559684) (not e!455651))))

(declare-fun lt!368524 () ListLongMap!8523)

(assert (=> b!820190 (= res!559684 (not (contains!4141 lt!368524 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!104541 () Bool)

(assert (=> d!104541 e!455651))

(declare-fun res!559686 () Bool)

(assert (=> d!104541 (=> (not res!559686) (not e!455651))))

(assert (=> d!104541 (= res!559686 (not (contains!4141 lt!368524 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104541 (= lt!368524 e!455656)))

(declare-fun c!89142 () Bool)

(assert (=> d!104541 (= c!89142 (bvsge #b00000000000000000000000000000000 (size!22177 _keys!976)))))

(assert (=> d!104541 (validMask!0 mask!1312)))

(assert (=> d!104541 (= (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!368524)))

(declare-fun b!820191 () Bool)

(declare-fun e!455654 () Bool)

(assert (=> b!820191 (= e!455654 (isEmpty!642 lt!368524))))

(declare-fun b!820192 () Bool)

(assert (=> b!820192 (= e!455653 (validKeyInArray!0 (select (arr!21756 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820192 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!820193 () Bool)

(assert (=> b!820193 (= e!455654 (= lt!368524 (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!820194 () Bool)

(assert (=> b!820194 (= e!455652 e!455654)))

(declare-fun c!89141 () Bool)

(assert (=> b!820194 (= c!89141 (bvslt #b00000000000000000000000000000000 (size!22177 _keys!976)))))

(declare-fun b!820195 () Bool)

(declare-fun e!455650 () Bool)

(assert (=> b!820195 (= e!455652 e!455650)))

(assert (=> b!820195 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22177 _keys!976)))))

(declare-fun res!559685 () Bool)

(assert (=> b!820195 (= res!559685 (contains!4141 lt!368524 (select (arr!21756 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820195 (=> (not res!559685) (not e!455650))))

(declare-fun b!820196 () Bool)

(assert (=> b!820196 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22177 _keys!976)))))

(assert (=> b!820196 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22178 _values!788)))))

(assert (=> b!820196 (= e!455650 (= (apply!355 lt!368524 (select (arr!21756 _keys!976) #b00000000000000000000000000000000)) (get!11610 (select (arr!21757 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!820197 () Bool)

(declare-fun lt!368525 () Unit!27981)

(declare-fun lt!368522 () Unit!27981)

(assert (=> b!820197 (= lt!368525 lt!368522)))

(declare-fun lt!368521 () (_ BitVec 64))

(declare-fun lt!368526 () (_ BitVec 64))

(declare-fun lt!368527 () V!24491)

(declare-fun lt!368523 () ListLongMap!8523)

(assert (=> b!820197 (not (contains!4141 (+!1898 lt!368523 (tuple2!9711 lt!368521 lt!368527)) lt!368526))))

(assert (=> b!820197 (= lt!368522 (addStillNotContains!181 lt!368523 lt!368521 lt!368527 lt!368526))))

(assert (=> b!820197 (= lt!368526 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!820197 (= lt!368527 (get!11610 (select (arr!21757 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!820197 (= lt!368521 (select (arr!21756 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35686 () ListLongMap!8523)

(assert (=> b!820197 (= lt!368523 call!35686)))

(assert (=> b!820197 (= e!455655 (+!1898 call!35686 (tuple2!9711 (select (arr!21756 _keys!976) #b00000000000000000000000000000000) (get!11610 (select (arr!21757 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!35683 () Bool)

(assert (=> bm!35683 (= call!35686 (getCurrentListMapNoExtraKeys!2329 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!820198 () Bool)

(assert (=> b!820198 (= e!455655 call!35686)))

(assert (= (and d!104541 c!89142) b!820187))

(assert (= (and d!104541 (not c!89142)) b!820188))

(assert (= (and b!820188 c!89144) b!820197))

(assert (= (and b!820188 (not c!89144)) b!820198))

(assert (= (or b!820197 b!820198) bm!35683))

(assert (= (and d!104541 res!559686) b!820190))

(assert (= (and b!820190 res!559684) b!820189))

(assert (= (and b!820189 res!559683) b!820192))

(assert (= (and b!820189 c!89143) b!820195))

(assert (= (and b!820189 (not c!89143)) b!820194))

(assert (= (and b!820195 res!559685) b!820196))

(assert (= (and b!820194 c!89141) b!820193))

(assert (= (and b!820194 (not c!89141)) b!820191))

(declare-fun b_lambda!10961 () Bool)

(assert (=> (not b_lambda!10961) (not b!820196)))

(assert (=> b!820196 t!21851))

(declare-fun b_and!21737 () Bool)

(assert (= b_and!21735 (and (=> t!21851 result!7905) b_and!21737)))

(declare-fun b_lambda!10963 () Bool)

(assert (=> (not b_lambda!10963) (not b!820197)))

(assert (=> b!820197 t!21851))

(declare-fun b_and!21739 () Bool)

(assert (= b_and!21737 (and (=> t!21851 result!7905) b_and!21739)))

(assert (=> b!820197 m!761427))

(assert (=> b!820197 m!761509))

(assert (=> b!820197 m!761513))

(assert (=> b!820197 m!761515))

(declare-fun m!761643 () Bool)

(assert (=> b!820197 m!761643))

(declare-fun m!761645 () Bool)

(assert (=> b!820197 m!761645))

(declare-fun m!761647 () Bool)

(assert (=> b!820197 m!761647))

(assert (=> b!820197 m!761509))

(assert (=> b!820197 m!761513))

(assert (=> b!820197 m!761647))

(declare-fun m!761649 () Bool)

(assert (=> b!820197 m!761649))

(declare-fun m!761651 () Bool)

(assert (=> b!820193 m!761651))

(declare-fun m!761653 () Bool)

(assert (=> b!820190 m!761653))

(declare-fun m!761655 () Bool)

(assert (=> d!104541 m!761655))

(assert (=> d!104541 m!761337))

(assert (=> b!820192 m!761427))

(assert (=> b!820192 m!761427))

(assert (=> b!820192 m!761429))

(assert (=> b!820196 m!761427))

(assert (=> b!820196 m!761513))

(assert (=> b!820196 m!761509))

(assert (=> b!820196 m!761513))

(assert (=> b!820196 m!761515))

(assert (=> b!820196 m!761427))

(declare-fun m!761657 () Bool)

(assert (=> b!820196 m!761657))

(assert (=> b!820196 m!761509))

(assert (=> b!820188 m!761427))

(assert (=> b!820188 m!761427))

(assert (=> b!820188 m!761429))

(assert (=> bm!35683 m!761651))

(declare-fun m!761659 () Bool)

(assert (=> b!820191 m!761659))

(assert (=> b!820195 m!761427))

(assert (=> b!820195 m!761427))

(declare-fun m!761661 () Bool)

(assert (=> b!820195 m!761661))

(assert (=> b!819958 d!104541))

(declare-fun b!820205 () Bool)

(declare-fun e!455661 () Bool)

(assert (=> b!820205 (= e!455661 tp_is_empty!14617)))

(declare-fun mapIsEmpty!23536 () Bool)

(declare-fun mapRes!23536 () Bool)

(assert (=> mapIsEmpty!23536 mapRes!23536))

(declare-fun mapNonEmpty!23536 () Bool)

(declare-fun tp!45472 () Bool)

(assert (=> mapNonEmpty!23536 (= mapRes!23536 (and tp!45472 e!455661))))

(declare-fun mapValue!23536 () ValueCell!6893)

(declare-fun mapKey!23536 () (_ BitVec 32))

(declare-fun mapRest!23536 () (Array (_ BitVec 32) ValueCell!6893))

(assert (=> mapNonEmpty!23536 (= mapRest!23527 (store mapRest!23536 mapKey!23536 mapValue!23536))))

(declare-fun condMapEmpty!23536 () Bool)

(declare-fun mapDefault!23536 () ValueCell!6893)

(assert (=> mapNonEmpty!23527 (= condMapEmpty!23536 (= mapRest!23527 ((as const (Array (_ BitVec 32) ValueCell!6893)) mapDefault!23536)))))

(declare-fun e!455662 () Bool)

(assert (=> mapNonEmpty!23527 (= tp!45456 (and e!455662 mapRes!23536))))

(declare-fun b!820206 () Bool)

(assert (=> b!820206 (= e!455662 tp_is_empty!14617)))

(assert (= (and mapNonEmpty!23527 condMapEmpty!23536) mapIsEmpty!23536))

(assert (= (and mapNonEmpty!23527 (not condMapEmpty!23536)) mapNonEmpty!23536))

(assert (= (and mapNonEmpty!23536 ((_ is ValueCellFull!6893) mapValue!23536)) b!820205))

(assert (= (and mapNonEmpty!23527 ((_ is ValueCellFull!6893) mapDefault!23536)) b!820206))

(declare-fun m!761663 () Bool)

(assert (=> mapNonEmpty!23536 m!761663))

(declare-fun b_lambda!10965 () Bool)

(assert (= b_lambda!10959 (or (and start!70580 b_free!12907) b_lambda!10965)))

(declare-fun b_lambda!10967 () Bool)

(assert (= b_lambda!10963 (or (and start!70580 b_free!12907) b_lambda!10967)))

(declare-fun b_lambda!10969 () Bool)

(assert (= b_lambda!10957 (or (and start!70580 b_free!12907) b_lambda!10969)))

(declare-fun b_lambda!10971 () Bool)

(assert (= b_lambda!10955 (or (and start!70580 b_free!12907) b_lambda!10971)))

(declare-fun b_lambda!10973 () Bool)

(assert (= b_lambda!10953 (or (and start!70580 b_free!12907) b_lambda!10973)))

(declare-fun b_lambda!10975 () Bool)

(assert (= b_lambda!10961 (or (and start!70580 b_free!12907) b_lambda!10975)))

(check-sat (not b!820192) (not bm!35676) (not b!820126) (not b!820109) (not b_lambda!10975) (not b!820191) (not bm!35682) (not bm!35679) (not b!820102) (not b!820146) (not b!820033) (not b!820179) (not d!104529) (not b!820129) (not b_lambda!10973) (not b!820093) (not b!820086) (not b!820116) (not b!820038) (not d!104537) (not bm!35675) (not bm!35683) (not b_lambda!10969) (not d!104525) (not b_lambda!10965) (not b!820180) (not d!104527) (not b!820096) (not d!104539) (not b!820134) (not b_next!12907) (not b!820085) (not b!820131) (not b!820108) (not bm!35669) (not b!820132) (not b!820195) (not bm!35663) b_and!21739 (not b!820030) (not b!820197) tp_is_empty!14617 (not b!820176) (not d!104517) (not b!820084) (not b!820185) (not d!104519) (not bm!35665) (not b!820121) (not b!820135) (not b!820039) (not bm!35670) (not b!820183) (not b!820098) (not b!820041) (not b!820103) (not mapNonEmpty!23536) (not d!104523) (not bm!35648) (not b!820119) (not b!820150) (not b!820188) (not b!820196) (not b!820130) (not b!820125) (not d!104521) (not b!820181) (not b_lambda!10971) (not b!820040) (not b!820184) (not b!820178) (not d!104531) (not b!820133) (not bm!35668) (not b_lambda!10967) (not b!820128) (not b!820190) (not b!820193) (not b!820107) (not d!104541) (not d!104533) (not b!820149) (not bm!35672))
(check-sat b_and!21739 (not b_next!12907))
