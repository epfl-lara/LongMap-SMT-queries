; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70528 () Bool)

(assert start!70528)

(declare-fun b_free!12855 () Bool)

(declare-fun b_next!12855 () Bool)

(assert (=> start!70528 (= b_free!12855 (not b_next!12855))))

(declare-fun tp!45298 () Bool)

(declare-fun b_and!21685 () Bool)

(assert (=> start!70528 (= tp!45298 b_and!21685)))

(declare-fun mapNonEmpty!23446 () Bool)

(declare-fun mapRes!23446 () Bool)

(declare-fun tp!45297 () Bool)

(declare-fun e!454976 () Bool)

(assert (=> mapNonEmpty!23446 (= mapRes!23446 (and tp!45297 e!454976))))

(declare-datatypes ((V!24421 0))(
  ( (V!24422 (val!7330 Int)) )
))
(declare-datatypes ((ValueCell!6867 0))(
  ( (ValueCellFull!6867 (v!9759 V!24421)) (EmptyCell!6867) )
))
(declare-fun mapRest!23446 () (Array (_ BitVec 32) ValueCell!6867))

(declare-datatypes ((array!45326 0))(
  ( (array!45327 (arr!21717 (Array (_ BitVec 32) ValueCell!6867)) (size!22138 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45326)

(declare-fun mapValue!23446 () ValueCell!6867)

(declare-fun mapKey!23446 () (_ BitVec 32))

(assert (=> mapNonEmpty!23446 (= (arr!21717 _values!788) (store mapRest!23446 mapKey!23446 mapValue!23446))))

(declare-fun b!819305 () Bool)

(declare-fun res!559108 () Bool)

(declare-fun e!454979 () Bool)

(assert (=> b!819305 (=> (not res!559108) (not e!454979))))

(declare-datatypes ((array!45328 0))(
  ( (array!45329 (arr!21718 (Array (_ BitVec 32) (_ BitVec 64))) (size!22139 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45328)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45328 (_ BitVec 32)) Bool)

(assert (=> b!819305 (= res!559108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819306 () Bool)

(declare-fun e!454982 () Bool)

(assert (=> b!819306 (= e!454982 (bvsle #b00000000000000000000000000000000 (size!22139 _keys!976)))))

(declare-fun b!819307 () Bool)

(declare-fun e!454981 () Bool)

(declare-fun tp_is_empty!14565 () Bool)

(assert (=> b!819307 (= e!454981 tp_is_empty!14565)))

(declare-fun b!819308 () Bool)

(declare-fun res!559105 () Bool)

(assert (=> b!819308 (=> (not res!559105) (not e!454979))))

(declare-datatypes ((List!15472 0))(
  ( (Nil!15469) (Cons!15468 (h!16597 (_ BitVec 64)) (t!21801 List!15472)) )
))
(declare-fun arrayNoDuplicates!0 (array!45328 (_ BitVec 32) List!15472) Bool)

(assert (=> b!819308 (= res!559105 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15469))))

(declare-fun mapIsEmpty!23446 () Bool)

(assert (=> mapIsEmpty!23446 mapRes!23446))

(declare-fun b!819309 () Bool)

(assert (=> b!819309 (= e!454976 tp_is_empty!14565)))

(declare-fun b!819311 () Bool)

(declare-fun e!454977 () Bool)

(assert (=> b!819311 (= e!454977 (and e!454981 mapRes!23446))))

(declare-fun condMapEmpty!23446 () Bool)

(declare-fun mapDefault!23446 () ValueCell!6867)

(assert (=> b!819311 (= condMapEmpty!23446 (= (arr!21717 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6867)) mapDefault!23446)))))

(declare-fun b!819312 () Bool)

(declare-fun res!559104 () Bool)

(assert (=> b!819312 (=> (not res!559104) (not e!454979))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!819312 (= res!559104 (and (= (size!22138 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22139 _keys!976) (size!22138 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819313 () Bool)

(declare-fun e!454980 () Bool)

(assert (=> b!819313 (= e!454979 (not e!454980))))

(declare-fun res!559110 () Bool)

(assert (=> b!819313 (=> res!559110 e!454980)))

(assert (=> b!819313 (= res!559110 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9644 0))(
  ( (tuple2!9645 (_1!4833 (_ BitVec 64)) (_2!4833 V!24421)) )
))
(declare-datatypes ((List!15473 0))(
  ( (Nil!15470) (Cons!15469 (h!16598 tuple2!9644) (t!21802 List!15473)) )
))
(declare-datatypes ((ListLongMap!8467 0))(
  ( (ListLongMap!8468 (toList!4249 List!15473)) )
))
(declare-fun lt!367614 () ListLongMap!8467)

(declare-fun lt!367609 () ListLongMap!8467)

(assert (=> b!819313 (= lt!367614 lt!367609)))

(declare-fun zeroValueBefore!34 () V!24421)

(declare-fun zeroValueAfter!34 () V!24421)

(declare-fun minValue!754 () V!24421)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27975 0))(
  ( (Unit!27976) )
))
(declare-fun lt!367616 () Unit!27975)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!392 (array!45328 array!45326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24421 V!24421 V!24421 V!24421 (_ BitVec 32) Int) Unit!27975)

(assert (=> b!819313 (= lt!367616 (lemmaNoChangeToArrayThenSameMapNoExtras!392 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2282 (array!45328 array!45326 (_ BitVec 32) (_ BitVec 32) V!24421 V!24421 (_ BitVec 32) Int) ListLongMap!8467)

(assert (=> b!819313 (= lt!367609 (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819313 (= lt!367614 (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819314 () Bool)

(assert (=> b!819314 (= e!454980 e!454982)))

(declare-fun res!559107 () Bool)

(assert (=> b!819314 (=> res!559107 e!454982)))

(declare-fun lt!367613 () ListLongMap!8467)

(declare-fun lt!367611 () tuple2!9644)

(declare-fun lt!367612 () tuple2!9644)

(declare-fun +!1845 (ListLongMap!8467 tuple2!9644) ListLongMap!8467)

(assert (=> b!819314 (= res!559107 (not (= lt!367613 (+!1845 (+!1845 lt!367609 lt!367611) lt!367612))))))

(declare-fun lt!367608 () ListLongMap!8467)

(assert (=> b!819314 (= (+!1845 lt!367614 lt!367612) (+!1845 lt!367608 lt!367612))))

(declare-fun lt!367615 () Unit!27975)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!184 (ListLongMap!8467 (_ BitVec 64) V!24421 V!24421) Unit!27975)

(assert (=> b!819314 (= lt!367615 (addSameAsAddTwiceSameKeyDiffValues!184 lt!367614 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819314 (= lt!367612 (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!454978 () Bool)

(assert (=> b!819314 e!454978))

(declare-fun res!559106 () Bool)

(assert (=> b!819314 (=> (not res!559106) (not e!454978))))

(declare-fun lt!367610 () ListLongMap!8467)

(assert (=> b!819314 (= res!559106 (= lt!367610 lt!367608))))

(assert (=> b!819314 (= lt!367608 (+!1845 lt!367614 lt!367611))))

(assert (=> b!819314 (= lt!367611 (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2450 (array!45328 array!45326 (_ BitVec 32) (_ BitVec 32) V!24421 V!24421 (_ BitVec 32) Int) ListLongMap!8467)

(assert (=> b!819314 (= lt!367613 (getCurrentListMap!2450 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819314 (= lt!367610 (getCurrentListMap!2450 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819310 () Bool)

(assert (=> b!819310 (= e!454978 (= lt!367613 (+!1845 lt!367609 (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun res!559109 () Bool)

(assert (=> start!70528 (=> (not res!559109) (not e!454979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70528 (= res!559109 (validMask!0 mask!1312))))

(assert (=> start!70528 e!454979))

(assert (=> start!70528 tp_is_empty!14565))

(declare-fun array_inv!17359 (array!45328) Bool)

(assert (=> start!70528 (array_inv!17359 _keys!976)))

(assert (=> start!70528 true))

(declare-fun array_inv!17360 (array!45326) Bool)

(assert (=> start!70528 (and (array_inv!17360 _values!788) e!454977)))

(assert (=> start!70528 tp!45298))

(assert (= (and start!70528 res!559109) b!819312))

(assert (= (and b!819312 res!559104) b!819305))

(assert (= (and b!819305 res!559108) b!819308))

(assert (= (and b!819308 res!559105) b!819313))

(assert (= (and b!819313 (not res!559110)) b!819314))

(assert (= (and b!819314 res!559106) b!819310))

(assert (= (and b!819314 (not res!559107)) b!819306))

(assert (= (and b!819311 condMapEmpty!23446) mapIsEmpty!23446))

(assert (= (and b!819311 (not condMapEmpty!23446)) mapNonEmpty!23446))

(get-info :version)

(assert (= (and mapNonEmpty!23446 ((_ is ValueCellFull!6867) mapValue!23446)) b!819309))

(assert (= (and b!819311 ((_ is ValueCellFull!6867) mapDefault!23446)) b!819307))

(assert (= start!70528 b!819311))

(declare-fun m!760897 () Bool)

(assert (=> b!819314 m!760897))

(declare-fun m!760899 () Bool)

(assert (=> b!819314 m!760899))

(declare-fun m!760901 () Bool)

(assert (=> b!819314 m!760901))

(declare-fun m!760903 () Bool)

(assert (=> b!819314 m!760903))

(declare-fun m!760905 () Bool)

(assert (=> b!819314 m!760905))

(declare-fun m!760907 () Bool)

(assert (=> b!819314 m!760907))

(assert (=> b!819314 m!760905))

(declare-fun m!760909 () Bool)

(assert (=> b!819314 m!760909))

(declare-fun m!760911 () Bool)

(assert (=> b!819314 m!760911))

(declare-fun m!760913 () Bool)

(assert (=> start!70528 m!760913))

(declare-fun m!760915 () Bool)

(assert (=> start!70528 m!760915))

(declare-fun m!760917 () Bool)

(assert (=> start!70528 m!760917))

(declare-fun m!760919 () Bool)

(assert (=> b!819305 m!760919))

(declare-fun m!760921 () Bool)

(assert (=> b!819310 m!760921))

(declare-fun m!760923 () Bool)

(assert (=> b!819308 m!760923))

(declare-fun m!760925 () Bool)

(assert (=> mapNonEmpty!23446 m!760925))

(declare-fun m!760927 () Bool)

(assert (=> b!819313 m!760927))

(declare-fun m!760929 () Bool)

(assert (=> b!819313 m!760929))

(declare-fun m!760931 () Bool)

(assert (=> b!819313 m!760931))

(check-sat (not b!819308) (not start!70528) (not b!819310) (not b!819305) (not b_next!12855) (not b!819314) b_and!21685 tp_is_empty!14565 (not b!819313) (not mapNonEmpty!23446))
(check-sat b_and!21685 (not b_next!12855))
(get-model)

(declare-fun b!819353 () Bool)

(declare-fun e!455014 () Bool)

(declare-fun e!455015 () Bool)

(assert (=> b!819353 (= e!455014 e!455015)))

(declare-fun c!89125 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!819353 (= c!89125 (validKeyInArray!0 (select (arr!21718 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35636 () Bool)

(declare-fun call!35639 () Bool)

(assert (=> bm!35636 (= call!35639 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun d!104653 () Bool)

(declare-fun res!559137 () Bool)

(assert (=> d!104653 (=> res!559137 e!455014)))

(assert (=> d!104653 (= res!559137 (bvsge #b00000000000000000000000000000000 (size!22139 _keys!976)))))

(assert (=> d!104653 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!455014)))

(declare-fun b!819354 () Bool)

(assert (=> b!819354 (= e!455015 call!35639)))

(declare-fun b!819355 () Bool)

(declare-fun e!455013 () Bool)

(assert (=> b!819355 (= e!455015 e!455013)))

(declare-fun lt!367652 () (_ BitVec 64))

(assert (=> b!819355 (= lt!367652 (select (arr!21718 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!367650 () Unit!27975)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45328 (_ BitVec 64) (_ BitVec 32)) Unit!27975)

(assert (=> b!819355 (= lt!367650 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!367652 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!819355 (arrayContainsKey!0 _keys!976 lt!367652 #b00000000000000000000000000000000)))

(declare-fun lt!367651 () Unit!27975)

(assert (=> b!819355 (= lt!367651 lt!367650)))

(declare-fun res!559136 () Bool)

(declare-datatypes ((SeekEntryResult!8726 0))(
  ( (MissingZero!8726 (index!37275 (_ BitVec 32))) (Found!8726 (index!37276 (_ BitVec 32))) (Intermediate!8726 (undefined!9538 Bool) (index!37277 (_ BitVec 32)) (x!69037 (_ BitVec 32))) (Undefined!8726) (MissingVacant!8726 (index!37278 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45328 (_ BitVec 32)) SeekEntryResult!8726)

(assert (=> b!819355 (= res!559136 (= (seekEntryOrOpen!0 (select (arr!21718 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8726 #b00000000000000000000000000000000)))))

(assert (=> b!819355 (=> (not res!559136) (not e!455013))))

(declare-fun b!819356 () Bool)

(assert (=> b!819356 (= e!455013 call!35639)))

(assert (= (and d!104653 (not res!559137)) b!819353))

(assert (= (and b!819353 c!89125) b!819355))

(assert (= (and b!819353 (not c!89125)) b!819354))

(assert (= (and b!819355 res!559136) b!819356))

(assert (= (or b!819356 b!819354) bm!35636))

(declare-fun m!760969 () Bool)

(assert (=> b!819353 m!760969))

(assert (=> b!819353 m!760969))

(declare-fun m!760971 () Bool)

(assert (=> b!819353 m!760971))

(declare-fun m!760973 () Bool)

(assert (=> bm!35636 m!760973))

(assert (=> b!819355 m!760969))

(declare-fun m!760975 () Bool)

(assert (=> b!819355 m!760975))

(declare-fun m!760977 () Bool)

(assert (=> b!819355 m!760977))

(assert (=> b!819355 m!760969))

(declare-fun m!760979 () Bool)

(assert (=> b!819355 m!760979))

(assert (=> b!819305 d!104653))

(declare-fun d!104655 () Bool)

(declare-fun e!455018 () Bool)

(assert (=> d!104655 e!455018))

(declare-fun res!559143 () Bool)

(assert (=> d!104655 (=> (not res!559143) (not e!455018))))

(declare-fun lt!367661 () ListLongMap!8467)

(declare-fun contains!4159 (ListLongMap!8467 (_ BitVec 64)) Bool)

(assert (=> d!104655 (= res!559143 (contains!4159 lt!367661 (_1!4833 (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!367662 () List!15473)

(assert (=> d!104655 (= lt!367661 (ListLongMap!8468 lt!367662))))

(declare-fun lt!367664 () Unit!27975)

(declare-fun lt!367663 () Unit!27975)

(assert (=> d!104655 (= lt!367664 lt!367663)))

(declare-datatypes ((Option!408 0))(
  ( (Some!407 (v!9761 V!24421)) (None!406) )
))
(declare-fun getValueByKey!402 (List!15473 (_ BitVec 64)) Option!408)

(assert (=> d!104655 (= (getValueByKey!402 lt!367662 (_1!4833 (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!407 (_2!4833 (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lemmaContainsTupThenGetReturnValue!216 (List!15473 (_ BitVec 64) V!24421) Unit!27975)

(assert (=> d!104655 (= lt!367663 (lemmaContainsTupThenGetReturnValue!216 lt!367662 (_1!4833 (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4833 (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun insertStrictlySorted!255 (List!15473 (_ BitVec 64) V!24421) List!15473)

(assert (=> d!104655 (= lt!367662 (insertStrictlySorted!255 (toList!4249 lt!367609) (_1!4833 (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4833 (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104655 (= (+!1845 lt!367609 (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!367661)))

(declare-fun b!819361 () Bool)

(declare-fun res!559142 () Bool)

(assert (=> b!819361 (=> (not res!559142) (not e!455018))))

(assert (=> b!819361 (= res!559142 (= (getValueByKey!402 (toList!4249 lt!367661) (_1!4833 (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!407 (_2!4833 (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!819362 () Bool)

(declare-fun contains!4160 (List!15473 tuple2!9644) Bool)

(assert (=> b!819362 (= e!455018 (contains!4160 (toList!4249 lt!367661) (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!104655 res!559143) b!819361))

(assert (= (and b!819361 res!559142) b!819362))

(declare-fun m!760981 () Bool)

(assert (=> d!104655 m!760981))

(declare-fun m!760983 () Bool)

(assert (=> d!104655 m!760983))

(declare-fun m!760985 () Bool)

(assert (=> d!104655 m!760985))

(declare-fun m!760987 () Bool)

(assert (=> d!104655 m!760987))

(declare-fun m!760989 () Bool)

(assert (=> b!819361 m!760989))

(declare-fun m!760991 () Bool)

(assert (=> b!819362 m!760991))

(assert (=> b!819310 d!104655))

(declare-fun b!819373 () Bool)

(declare-fun e!455029 () Bool)

(declare-fun contains!4161 (List!15472 (_ BitVec 64)) Bool)

(assert (=> b!819373 (= e!455029 (contains!4161 Nil!15469 (select (arr!21718 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!819374 () Bool)

(declare-fun e!455030 () Bool)

(declare-fun e!455028 () Bool)

(assert (=> b!819374 (= e!455030 e!455028)))

(declare-fun res!559152 () Bool)

(assert (=> b!819374 (=> (not res!559152) (not e!455028))))

(assert (=> b!819374 (= res!559152 (not e!455029))))

(declare-fun res!559151 () Bool)

(assert (=> b!819374 (=> (not res!559151) (not e!455029))))

(assert (=> b!819374 (= res!559151 (validKeyInArray!0 (select (arr!21718 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104657 () Bool)

(declare-fun res!559150 () Bool)

(assert (=> d!104657 (=> res!559150 e!455030)))

(assert (=> d!104657 (= res!559150 (bvsge #b00000000000000000000000000000000 (size!22139 _keys!976)))))

(assert (=> d!104657 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15469) e!455030)))

(declare-fun b!819375 () Bool)

(declare-fun e!455027 () Bool)

(declare-fun call!35642 () Bool)

(assert (=> b!819375 (= e!455027 call!35642)))

(declare-fun b!819376 () Bool)

(assert (=> b!819376 (= e!455027 call!35642)))

(declare-fun bm!35639 () Bool)

(declare-fun c!89128 () Bool)

(assert (=> bm!35639 (= call!35642 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89128 (Cons!15468 (select (arr!21718 _keys!976) #b00000000000000000000000000000000) Nil!15469) Nil!15469)))))

(declare-fun b!819377 () Bool)

(assert (=> b!819377 (= e!455028 e!455027)))

(assert (=> b!819377 (= c!89128 (validKeyInArray!0 (select (arr!21718 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104657 (not res!559150)) b!819374))

(assert (= (and b!819374 res!559151) b!819373))

(assert (= (and b!819374 res!559152) b!819377))

(assert (= (and b!819377 c!89128) b!819375))

(assert (= (and b!819377 (not c!89128)) b!819376))

(assert (= (or b!819375 b!819376) bm!35639))

(assert (=> b!819373 m!760969))

(assert (=> b!819373 m!760969))

(declare-fun m!760993 () Bool)

(assert (=> b!819373 m!760993))

(assert (=> b!819374 m!760969))

(assert (=> b!819374 m!760969))

(assert (=> b!819374 m!760971))

(assert (=> bm!35639 m!760969))

(declare-fun m!760995 () Bool)

(assert (=> bm!35639 m!760995))

(assert (=> b!819377 m!760969))

(assert (=> b!819377 m!760969))

(assert (=> b!819377 m!760971))

(assert (=> b!819308 d!104657))

(declare-fun d!104659 () Bool)

(assert (=> d!104659 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70528 d!104659))

(declare-fun d!104661 () Bool)

(assert (=> d!104661 (= (array_inv!17359 _keys!976) (bvsge (size!22139 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70528 d!104661))

(declare-fun d!104663 () Bool)

(assert (=> d!104663 (= (array_inv!17360 _values!788) (bvsge (size!22138 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70528 d!104663))

(declare-fun d!104665 () Bool)

(assert (=> d!104665 (= (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367667 () Unit!27975)

(declare-fun choose!1393 (array!45328 array!45326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24421 V!24421 V!24421 V!24421 (_ BitVec 32) Int) Unit!27975)

(assert (=> d!104665 (= lt!367667 (choose!1393 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104665 (validMask!0 mask!1312)))

(assert (=> d!104665 (= (lemmaNoChangeToArrayThenSameMapNoExtras!392 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!367667)))

(declare-fun bs!22840 () Bool)

(assert (= bs!22840 d!104665))

(assert (=> bs!22840 m!760931))

(assert (=> bs!22840 m!760929))

(declare-fun m!760997 () Bool)

(assert (=> bs!22840 m!760997))

(assert (=> bs!22840 m!760913))

(assert (=> b!819313 d!104665))

(declare-fun b!819402 () Bool)

(declare-fun res!559164 () Bool)

(declare-fun e!455046 () Bool)

(assert (=> b!819402 (=> (not res!559164) (not e!455046))))

(declare-fun lt!367688 () ListLongMap!8467)

(assert (=> b!819402 (= res!559164 (not (contains!4159 lt!367688 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!819403 () Bool)

(assert (=> b!819403 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22139 _keys!976)))))

(assert (=> b!819403 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22138 _values!788)))))

(declare-fun e!455050 () Bool)

(declare-fun apply!354 (ListLongMap!8467 (_ BitVec 64)) V!24421)

(declare-fun get!11585 (ValueCell!6867 V!24421) V!24421)

(declare-fun dynLambda!965 (Int (_ BitVec 64)) V!24421)

(assert (=> b!819403 (= e!455050 (= (apply!354 lt!367688 (select (arr!21718 _keys!976) #b00000000000000000000000000000000)) (get!11585 (select (arr!21717 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!104667 () Bool)

(assert (=> d!104667 e!455046))

(declare-fun res!559163 () Bool)

(assert (=> d!104667 (=> (not res!559163) (not e!455046))))

(assert (=> d!104667 (= res!559163 (not (contains!4159 lt!367688 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!455051 () ListLongMap!8467)

(assert (=> d!104667 (= lt!367688 e!455051)))

(declare-fun c!89137 () Bool)

(assert (=> d!104667 (= c!89137 (bvsge #b00000000000000000000000000000000 (size!22139 _keys!976)))))

(assert (=> d!104667 (validMask!0 mask!1312)))

(assert (=> d!104667 (= (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!367688)))

(declare-fun e!455048 () Bool)

(declare-fun b!819404 () Bool)

(assert (=> b!819404 (= e!455048 (= lt!367688 (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!819405 () Bool)

(declare-fun e!455047 () ListLongMap!8467)

(assert (=> b!819405 (= e!455051 e!455047)))

(declare-fun c!89140 () Bool)

(assert (=> b!819405 (= c!89140 (validKeyInArray!0 (select (arr!21718 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!819406 () Bool)

(declare-fun e!455049 () Bool)

(assert (=> b!819406 (= e!455049 (validKeyInArray!0 (select (arr!21718 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!819406 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun call!35645 () ListLongMap!8467)

(declare-fun bm!35642 () Bool)

(assert (=> bm!35642 (= call!35645 (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!819407 () Bool)

(declare-fun isEmpty!636 (ListLongMap!8467) Bool)

(assert (=> b!819407 (= e!455048 (isEmpty!636 lt!367688))))

(declare-fun b!819408 () Bool)

(declare-fun e!455045 () Bool)

(assert (=> b!819408 (= e!455045 e!455050)))

(assert (=> b!819408 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22139 _keys!976)))))

(declare-fun res!559162 () Bool)

(assert (=> b!819408 (= res!559162 (contains!4159 lt!367688 (select (arr!21718 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!819408 (=> (not res!559162) (not e!455050))))

(declare-fun b!819409 () Bool)

(assert (=> b!819409 (= e!455047 call!35645)))

(declare-fun b!819410 () Bool)

(assert (=> b!819410 (= e!455045 e!455048)))

(declare-fun c!89138 () Bool)

(assert (=> b!819410 (= c!89138 (bvslt #b00000000000000000000000000000000 (size!22139 _keys!976)))))

(declare-fun b!819411 () Bool)

(assert (=> b!819411 (= e!455046 e!455045)))

(declare-fun c!89139 () Bool)

(assert (=> b!819411 (= c!89139 e!455049)))

(declare-fun res!559161 () Bool)

(assert (=> b!819411 (=> (not res!559161) (not e!455049))))

(assert (=> b!819411 (= res!559161 (bvslt #b00000000000000000000000000000000 (size!22139 _keys!976)))))

(declare-fun b!819412 () Bool)

(assert (=> b!819412 (= e!455051 (ListLongMap!8468 Nil!15470))))

(declare-fun b!819413 () Bool)

(declare-fun lt!367683 () Unit!27975)

(declare-fun lt!367685 () Unit!27975)

(assert (=> b!819413 (= lt!367683 lt!367685)))

(declare-fun lt!367684 () V!24421)

(declare-fun lt!367682 () (_ BitVec 64))

(declare-fun lt!367687 () (_ BitVec 64))

(declare-fun lt!367686 () ListLongMap!8467)

(assert (=> b!819413 (not (contains!4159 (+!1845 lt!367686 (tuple2!9645 lt!367682 lt!367684)) lt!367687))))

(declare-fun addStillNotContains!179 (ListLongMap!8467 (_ BitVec 64) V!24421 (_ BitVec 64)) Unit!27975)

(assert (=> b!819413 (= lt!367685 (addStillNotContains!179 lt!367686 lt!367682 lt!367684 lt!367687))))

(assert (=> b!819413 (= lt!367687 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!819413 (= lt!367684 (get!11585 (select (arr!21717 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!819413 (= lt!367682 (select (arr!21718 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!819413 (= lt!367686 call!35645)))

(assert (=> b!819413 (= e!455047 (+!1845 call!35645 (tuple2!9645 (select (arr!21718 _keys!976) #b00000000000000000000000000000000) (get!11585 (select (arr!21717 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!104667 c!89137) b!819412))

(assert (= (and d!104667 (not c!89137)) b!819405))

(assert (= (and b!819405 c!89140) b!819413))

(assert (= (and b!819405 (not c!89140)) b!819409))

(assert (= (or b!819413 b!819409) bm!35642))

(assert (= (and d!104667 res!559163) b!819402))

(assert (= (and b!819402 res!559164) b!819411))

(assert (= (and b!819411 res!559161) b!819406))

(assert (= (and b!819411 c!89139) b!819408))

(assert (= (and b!819411 (not c!89139)) b!819410))

(assert (= (and b!819408 res!559162) b!819403))

(assert (= (and b!819410 c!89138) b!819404))

(assert (= (and b!819410 (not c!89138)) b!819407))

(declare-fun b_lambda!10947 () Bool)

(assert (=> (not b_lambda!10947) (not b!819403)))

(declare-fun t!21806 () Bool)

(declare-fun tb!4189 () Bool)

(assert (=> (and start!70528 (= defaultEntry!796 defaultEntry!796) t!21806) tb!4189))

(declare-fun result!7907 () Bool)

(assert (=> tb!4189 (= result!7907 tp_is_empty!14565)))

(assert (=> b!819403 t!21806))

(declare-fun b_and!21689 () Bool)

(assert (= b_and!21685 (and (=> t!21806 result!7907) b_and!21689)))

(declare-fun b_lambda!10949 () Bool)

(assert (=> (not b_lambda!10949) (not b!819413)))

(assert (=> b!819413 t!21806))

(declare-fun b_and!21691 () Bool)

(assert (= b_and!21689 (and (=> t!21806 result!7907) b_and!21691)))

(assert (=> b!819405 m!760969))

(assert (=> b!819405 m!760969))

(assert (=> b!819405 m!760971))

(declare-fun m!760999 () Bool)

(assert (=> d!104667 m!760999))

(assert (=> d!104667 m!760913))

(declare-fun m!761001 () Bool)

(assert (=> b!819404 m!761001))

(assert (=> b!819408 m!760969))

(assert (=> b!819408 m!760969))

(declare-fun m!761003 () Bool)

(assert (=> b!819408 m!761003))

(assert (=> b!819406 m!760969))

(assert (=> b!819406 m!760969))

(assert (=> b!819406 m!760971))

(assert (=> bm!35642 m!761001))

(declare-fun m!761005 () Bool)

(assert (=> b!819413 m!761005))

(declare-fun m!761007 () Bool)

(assert (=> b!819413 m!761007))

(declare-fun m!761009 () Bool)

(assert (=> b!819413 m!761009))

(declare-fun m!761011 () Bool)

(assert (=> b!819413 m!761011))

(assert (=> b!819413 m!761009))

(declare-fun m!761013 () Bool)

(assert (=> b!819413 m!761013))

(declare-fun m!761015 () Bool)

(assert (=> b!819413 m!761015))

(declare-fun m!761017 () Bool)

(assert (=> b!819413 m!761017))

(assert (=> b!819413 m!761007))

(assert (=> b!819413 m!760969))

(assert (=> b!819413 m!761013))

(assert (=> b!819403 m!761007))

(assert (=> b!819403 m!761009))

(assert (=> b!819403 m!761011))

(assert (=> b!819403 m!761009))

(assert (=> b!819403 m!760969))

(declare-fun m!761019 () Bool)

(assert (=> b!819403 m!761019))

(assert (=> b!819403 m!761007))

(assert (=> b!819403 m!760969))

(declare-fun m!761021 () Bool)

(assert (=> b!819402 m!761021))

(declare-fun m!761023 () Bool)

(assert (=> b!819407 m!761023))

(assert (=> b!819313 d!104667))

(declare-fun b!819416 () Bool)

(declare-fun res!559168 () Bool)

(declare-fun e!455053 () Bool)

(assert (=> b!819416 (=> (not res!559168) (not e!455053))))

(declare-fun lt!367695 () ListLongMap!8467)

(assert (=> b!819416 (= res!559168 (not (contains!4159 lt!367695 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!819417 () Bool)

(assert (=> b!819417 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22139 _keys!976)))))

(assert (=> b!819417 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22138 _values!788)))))

(declare-fun e!455057 () Bool)

(assert (=> b!819417 (= e!455057 (= (apply!354 lt!367695 (select (arr!21718 _keys!976) #b00000000000000000000000000000000)) (get!11585 (select (arr!21717 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!104669 () Bool)

(assert (=> d!104669 e!455053))

(declare-fun res!559167 () Bool)

(assert (=> d!104669 (=> (not res!559167) (not e!455053))))

(assert (=> d!104669 (= res!559167 (not (contains!4159 lt!367695 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!455058 () ListLongMap!8467)

(assert (=> d!104669 (= lt!367695 e!455058)))

(declare-fun c!89141 () Bool)

(assert (=> d!104669 (= c!89141 (bvsge #b00000000000000000000000000000000 (size!22139 _keys!976)))))

(assert (=> d!104669 (validMask!0 mask!1312)))

(assert (=> d!104669 (= (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!367695)))

(declare-fun e!455055 () Bool)

(declare-fun b!819418 () Bool)

(assert (=> b!819418 (= e!455055 (= lt!367695 (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!819419 () Bool)

(declare-fun e!455054 () ListLongMap!8467)

(assert (=> b!819419 (= e!455058 e!455054)))

(declare-fun c!89144 () Bool)

(assert (=> b!819419 (= c!89144 (validKeyInArray!0 (select (arr!21718 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!819420 () Bool)

(declare-fun e!455056 () Bool)

(assert (=> b!819420 (= e!455056 (validKeyInArray!0 (select (arr!21718 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!819420 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!35643 () Bool)

(declare-fun call!35646 () ListLongMap!8467)

(assert (=> bm!35643 (= call!35646 (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!819421 () Bool)

(assert (=> b!819421 (= e!455055 (isEmpty!636 lt!367695))))

(declare-fun b!819422 () Bool)

(declare-fun e!455052 () Bool)

(assert (=> b!819422 (= e!455052 e!455057)))

(assert (=> b!819422 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22139 _keys!976)))))

(declare-fun res!559166 () Bool)

(assert (=> b!819422 (= res!559166 (contains!4159 lt!367695 (select (arr!21718 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!819422 (=> (not res!559166) (not e!455057))))

(declare-fun b!819423 () Bool)

(assert (=> b!819423 (= e!455054 call!35646)))

(declare-fun b!819424 () Bool)

(assert (=> b!819424 (= e!455052 e!455055)))

(declare-fun c!89142 () Bool)

(assert (=> b!819424 (= c!89142 (bvslt #b00000000000000000000000000000000 (size!22139 _keys!976)))))

(declare-fun b!819425 () Bool)

(assert (=> b!819425 (= e!455053 e!455052)))

(declare-fun c!89143 () Bool)

(assert (=> b!819425 (= c!89143 e!455056)))

(declare-fun res!559165 () Bool)

(assert (=> b!819425 (=> (not res!559165) (not e!455056))))

(assert (=> b!819425 (= res!559165 (bvslt #b00000000000000000000000000000000 (size!22139 _keys!976)))))

(declare-fun b!819426 () Bool)

(assert (=> b!819426 (= e!455058 (ListLongMap!8468 Nil!15470))))

(declare-fun b!819427 () Bool)

(declare-fun lt!367690 () Unit!27975)

(declare-fun lt!367692 () Unit!27975)

(assert (=> b!819427 (= lt!367690 lt!367692)))

(declare-fun lt!367693 () ListLongMap!8467)

(declare-fun lt!367689 () (_ BitVec 64))

(declare-fun lt!367691 () V!24421)

(declare-fun lt!367694 () (_ BitVec 64))

(assert (=> b!819427 (not (contains!4159 (+!1845 lt!367693 (tuple2!9645 lt!367689 lt!367691)) lt!367694))))

(assert (=> b!819427 (= lt!367692 (addStillNotContains!179 lt!367693 lt!367689 lt!367691 lt!367694))))

(assert (=> b!819427 (= lt!367694 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!819427 (= lt!367691 (get!11585 (select (arr!21717 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!819427 (= lt!367689 (select (arr!21718 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!819427 (= lt!367693 call!35646)))

(assert (=> b!819427 (= e!455054 (+!1845 call!35646 (tuple2!9645 (select (arr!21718 _keys!976) #b00000000000000000000000000000000) (get!11585 (select (arr!21717 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!104669 c!89141) b!819426))

(assert (= (and d!104669 (not c!89141)) b!819419))

(assert (= (and b!819419 c!89144) b!819427))

(assert (= (and b!819419 (not c!89144)) b!819423))

(assert (= (or b!819427 b!819423) bm!35643))

(assert (= (and d!104669 res!559167) b!819416))

(assert (= (and b!819416 res!559168) b!819425))

(assert (= (and b!819425 res!559165) b!819420))

(assert (= (and b!819425 c!89143) b!819422))

(assert (= (and b!819425 (not c!89143)) b!819424))

(assert (= (and b!819422 res!559166) b!819417))

(assert (= (and b!819424 c!89142) b!819418))

(assert (= (and b!819424 (not c!89142)) b!819421))

(declare-fun b_lambda!10951 () Bool)

(assert (=> (not b_lambda!10951) (not b!819417)))

(assert (=> b!819417 t!21806))

(declare-fun b_and!21693 () Bool)

(assert (= b_and!21691 (and (=> t!21806 result!7907) b_and!21693)))

(declare-fun b_lambda!10953 () Bool)

(assert (=> (not b_lambda!10953) (not b!819427)))

(assert (=> b!819427 t!21806))

(declare-fun b_and!21695 () Bool)

(assert (= b_and!21693 (and (=> t!21806 result!7907) b_and!21695)))

(assert (=> b!819419 m!760969))

(assert (=> b!819419 m!760969))

(assert (=> b!819419 m!760971))

(declare-fun m!761025 () Bool)

(assert (=> d!104669 m!761025))

(assert (=> d!104669 m!760913))

(declare-fun m!761027 () Bool)

(assert (=> b!819418 m!761027))

(assert (=> b!819422 m!760969))

(assert (=> b!819422 m!760969))

(declare-fun m!761029 () Bool)

(assert (=> b!819422 m!761029))

(assert (=> b!819420 m!760969))

(assert (=> b!819420 m!760969))

(assert (=> b!819420 m!760971))

(assert (=> bm!35643 m!761027))

(declare-fun m!761031 () Bool)

(assert (=> b!819427 m!761031))

(assert (=> b!819427 m!761007))

(assert (=> b!819427 m!761009))

(assert (=> b!819427 m!761011))

(assert (=> b!819427 m!761009))

(declare-fun m!761033 () Bool)

(assert (=> b!819427 m!761033))

(declare-fun m!761035 () Bool)

(assert (=> b!819427 m!761035))

(declare-fun m!761037 () Bool)

(assert (=> b!819427 m!761037))

(assert (=> b!819427 m!761007))

(assert (=> b!819427 m!760969))

(assert (=> b!819427 m!761033))

(assert (=> b!819417 m!761007))

(assert (=> b!819417 m!761009))

(assert (=> b!819417 m!761011))

(assert (=> b!819417 m!761009))

(assert (=> b!819417 m!760969))

(declare-fun m!761039 () Bool)

(assert (=> b!819417 m!761039))

(assert (=> b!819417 m!761007))

(assert (=> b!819417 m!760969))

(declare-fun m!761041 () Bool)

(assert (=> b!819416 m!761041))

(declare-fun m!761043 () Bool)

(assert (=> b!819421 m!761043))

(assert (=> b!819313 d!104669))

(declare-fun d!104671 () Bool)

(assert (=> d!104671 (= (+!1845 lt!367614 (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (+!1845 (+!1845 lt!367614 (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun lt!367698 () Unit!27975)

(declare-fun choose!1394 (ListLongMap!8467 (_ BitVec 64) V!24421 V!24421) Unit!27975)

(assert (=> d!104671 (= lt!367698 (choose!1394 lt!367614 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> d!104671 (= (addSameAsAddTwiceSameKeyDiffValues!184 lt!367614 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34) lt!367698)))

(declare-fun bs!22841 () Bool)

(assert (= bs!22841 d!104671))

(declare-fun m!761045 () Bool)

(assert (=> bs!22841 m!761045))

(declare-fun m!761047 () Bool)

(assert (=> bs!22841 m!761047))

(assert (=> bs!22841 m!761047))

(declare-fun m!761049 () Bool)

(assert (=> bs!22841 m!761049))

(declare-fun m!761051 () Bool)

(assert (=> bs!22841 m!761051))

(assert (=> b!819314 d!104671))

(declare-fun d!104673 () Bool)

(declare-fun e!455059 () Bool)

(assert (=> d!104673 e!455059))

(declare-fun res!559170 () Bool)

(assert (=> d!104673 (=> (not res!559170) (not e!455059))))

(declare-fun lt!367699 () ListLongMap!8467)

(assert (=> d!104673 (= res!559170 (contains!4159 lt!367699 (_1!4833 lt!367612)))))

(declare-fun lt!367700 () List!15473)

(assert (=> d!104673 (= lt!367699 (ListLongMap!8468 lt!367700))))

(declare-fun lt!367702 () Unit!27975)

(declare-fun lt!367701 () Unit!27975)

(assert (=> d!104673 (= lt!367702 lt!367701)))

(assert (=> d!104673 (= (getValueByKey!402 lt!367700 (_1!4833 lt!367612)) (Some!407 (_2!4833 lt!367612)))))

(assert (=> d!104673 (= lt!367701 (lemmaContainsTupThenGetReturnValue!216 lt!367700 (_1!4833 lt!367612) (_2!4833 lt!367612)))))

(assert (=> d!104673 (= lt!367700 (insertStrictlySorted!255 (toList!4249 lt!367614) (_1!4833 lt!367612) (_2!4833 lt!367612)))))

(assert (=> d!104673 (= (+!1845 lt!367614 lt!367612) lt!367699)))

(declare-fun b!819428 () Bool)

(declare-fun res!559169 () Bool)

(assert (=> b!819428 (=> (not res!559169) (not e!455059))))

(assert (=> b!819428 (= res!559169 (= (getValueByKey!402 (toList!4249 lt!367699) (_1!4833 lt!367612)) (Some!407 (_2!4833 lt!367612))))))

(declare-fun b!819429 () Bool)

(assert (=> b!819429 (= e!455059 (contains!4160 (toList!4249 lt!367699) lt!367612))))

(assert (= (and d!104673 res!559170) b!819428))

(assert (= (and b!819428 res!559169) b!819429))

(declare-fun m!761053 () Bool)

(assert (=> d!104673 m!761053))

(declare-fun m!761055 () Bool)

(assert (=> d!104673 m!761055))

(declare-fun m!761057 () Bool)

(assert (=> d!104673 m!761057))

(declare-fun m!761059 () Bool)

(assert (=> d!104673 m!761059))

(declare-fun m!761061 () Bool)

(assert (=> b!819428 m!761061))

(declare-fun m!761063 () Bool)

(assert (=> b!819429 m!761063))

(assert (=> b!819314 d!104673))

(declare-fun bm!35658 () Bool)

(declare-fun call!35661 () ListLongMap!8467)

(declare-fun call!35663 () ListLongMap!8467)

(assert (=> bm!35658 (= call!35661 call!35663)))

(declare-fun b!819472 () Bool)

(declare-fun e!455095 () ListLongMap!8467)

(assert (=> b!819472 (= e!455095 call!35661)))

(declare-fun bm!35659 () Bool)

(declare-fun call!35665 () Bool)

(declare-fun lt!367748 () ListLongMap!8467)

(assert (=> bm!35659 (= call!35665 (contains!4159 lt!367748 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!819473 () Bool)

(declare-fun e!455086 () Bool)

(assert (=> b!819473 (= e!455086 (= (apply!354 lt!367748 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!819474 () Bool)

(declare-fun e!455089 () Bool)

(assert (=> b!819474 (= e!455089 (not call!35665))))

(declare-fun b!819475 () Bool)

(declare-fun e!455092 () ListLongMap!8467)

(assert (=> b!819475 (= e!455092 call!35661)))

(declare-fun call!35662 () ListLongMap!8467)

(declare-fun bm!35660 () Bool)

(assert (=> bm!35660 (= call!35662 (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!35661 () Bool)

(declare-fun call!35666 () ListLongMap!8467)

(declare-fun call!35667 () ListLongMap!8467)

(assert (=> bm!35661 (= call!35666 call!35667)))

(declare-fun e!455091 () Bool)

(declare-fun b!819476 () Bool)

(assert (=> b!819476 (= e!455091 (= (apply!354 lt!367748 (select (arr!21718 _keys!976) #b00000000000000000000000000000000)) (get!11585 (select (arr!21717 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!819476 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22138 _values!788)))))

(assert (=> b!819476 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22139 _keys!976)))))

(declare-fun c!89159 () Bool)

(declare-fun c!89160 () Bool)

(declare-fun bm!35662 () Bool)

(assert (=> bm!35662 (= call!35663 (+!1845 (ite c!89160 call!35662 (ite c!89159 call!35667 call!35666)) (ite (or c!89160 c!89159) (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!9645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!819477 () Bool)

(declare-fun e!455098 () Bool)

(declare-fun call!35664 () Bool)

(assert (=> b!819477 (= e!455098 (not call!35664))))

(declare-fun bm!35663 () Bool)

(assert (=> bm!35663 (= call!35664 (contains!4159 lt!367748 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!819478 () Bool)

(assert (=> b!819478 (= e!455098 e!455086)))

(declare-fun res!559189 () Bool)

(assert (=> b!819478 (= res!559189 call!35664)))

(assert (=> b!819478 (=> (not res!559189) (not e!455086))))

(declare-fun b!819479 () Bool)

(declare-fun e!455093 () Bool)

(assert (=> b!819479 (= e!455093 e!455091)))

(declare-fun res!559196 () Bool)

(assert (=> b!819479 (=> (not res!559196) (not e!455091))))

(assert (=> b!819479 (= res!559196 (contains!4159 lt!367748 (select (arr!21718 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!819479 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22139 _keys!976)))))

(declare-fun b!819480 () Bool)

(declare-fun e!455096 () ListLongMap!8467)

(assert (=> b!819480 (= e!455096 (+!1845 call!35663 (tuple2!9645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!819481 () Bool)

(assert (=> b!819481 (= e!455092 call!35666)))

(declare-fun b!819482 () Bool)

(declare-fun e!455097 () Bool)

(assert (=> b!819482 (= e!455097 (validKeyInArray!0 (select (arr!21718 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!819483 () Bool)

(declare-fun res!559190 () Bool)

(declare-fun e!455090 () Bool)

(assert (=> b!819483 (=> (not res!559190) (not e!455090))))

(assert (=> b!819483 (= res!559190 e!455089)))

(declare-fun c!89157 () Bool)

(assert (=> b!819483 (= c!89157 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!819484 () Bool)

(declare-fun e!455087 () Bool)

(assert (=> b!819484 (= e!455089 e!455087)))

(declare-fun res!559194 () Bool)

(assert (=> b!819484 (= res!559194 call!35665)))

(assert (=> b!819484 (=> (not res!559194) (not e!455087))))

(declare-fun b!819485 () Bool)

(declare-fun e!455088 () Bool)

(assert (=> b!819485 (= e!455088 (validKeyInArray!0 (select (arr!21718 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!819486 () Bool)

(assert (=> b!819486 (= e!455090 e!455098)))

(declare-fun c!89162 () Bool)

(assert (=> b!819486 (= c!89162 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!819487 () Bool)

(declare-fun c!89158 () Bool)

(assert (=> b!819487 (= c!89158 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!819487 (= e!455095 e!455092)))

(declare-fun b!819488 () Bool)

(assert (=> b!819488 (= e!455096 e!455095)))

(assert (=> b!819488 (= c!89159 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!104675 () Bool)

(assert (=> d!104675 e!455090))

(declare-fun res!559192 () Bool)

(assert (=> d!104675 (=> (not res!559192) (not e!455090))))

(assert (=> d!104675 (= res!559192 (or (bvsge #b00000000000000000000000000000000 (size!22139 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22139 _keys!976)))))))

(declare-fun lt!367767 () ListLongMap!8467)

(assert (=> d!104675 (= lt!367748 lt!367767)))

(declare-fun lt!367762 () Unit!27975)

(declare-fun e!455094 () Unit!27975)

(assert (=> d!104675 (= lt!367762 e!455094)))

(declare-fun c!89161 () Bool)

(assert (=> d!104675 (= c!89161 e!455097)))

(declare-fun res!559197 () Bool)

(assert (=> d!104675 (=> (not res!559197) (not e!455097))))

(assert (=> d!104675 (= res!559197 (bvslt #b00000000000000000000000000000000 (size!22139 _keys!976)))))

(assert (=> d!104675 (= lt!367767 e!455096)))

(assert (=> d!104675 (= c!89160 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104675 (validMask!0 mask!1312)))

(assert (=> d!104675 (= (getCurrentListMap!2450 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!367748)))

(declare-fun bm!35664 () Bool)

(assert (=> bm!35664 (= call!35667 call!35662)))

(declare-fun b!819489 () Bool)

(declare-fun Unit!27979 () Unit!27975)

(assert (=> b!819489 (= e!455094 Unit!27979)))

(declare-fun b!819490 () Bool)

(declare-fun lt!367757 () Unit!27975)

(assert (=> b!819490 (= e!455094 lt!367757)))

(declare-fun lt!367755 () ListLongMap!8467)

(assert (=> b!819490 (= lt!367755 (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367756 () (_ BitVec 64))

(assert (=> b!819490 (= lt!367756 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!367751 () (_ BitVec 64))

(assert (=> b!819490 (= lt!367751 (select (arr!21718 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!367752 () Unit!27975)

(declare-fun addStillContains!308 (ListLongMap!8467 (_ BitVec 64) V!24421 (_ BitVec 64)) Unit!27975)

(assert (=> b!819490 (= lt!367752 (addStillContains!308 lt!367755 lt!367756 zeroValueAfter!34 lt!367751))))

(assert (=> b!819490 (contains!4159 (+!1845 lt!367755 (tuple2!9645 lt!367756 zeroValueAfter!34)) lt!367751)))

(declare-fun lt!367759 () Unit!27975)

(assert (=> b!819490 (= lt!367759 lt!367752)))

(declare-fun lt!367758 () ListLongMap!8467)

(assert (=> b!819490 (= lt!367758 (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367765 () (_ BitVec 64))

(assert (=> b!819490 (= lt!367765 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!367753 () (_ BitVec 64))

(assert (=> b!819490 (= lt!367753 (select (arr!21718 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!367750 () Unit!27975)

(declare-fun addApplyDifferent!308 (ListLongMap!8467 (_ BitVec 64) V!24421 (_ BitVec 64)) Unit!27975)

(assert (=> b!819490 (= lt!367750 (addApplyDifferent!308 lt!367758 lt!367765 minValue!754 lt!367753))))

(assert (=> b!819490 (= (apply!354 (+!1845 lt!367758 (tuple2!9645 lt!367765 minValue!754)) lt!367753) (apply!354 lt!367758 lt!367753))))

(declare-fun lt!367761 () Unit!27975)

(assert (=> b!819490 (= lt!367761 lt!367750)))

(declare-fun lt!367764 () ListLongMap!8467)

(assert (=> b!819490 (= lt!367764 (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367747 () (_ BitVec 64))

(assert (=> b!819490 (= lt!367747 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!367766 () (_ BitVec 64))

(assert (=> b!819490 (= lt!367766 (select (arr!21718 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!367754 () Unit!27975)

(assert (=> b!819490 (= lt!367754 (addApplyDifferent!308 lt!367764 lt!367747 zeroValueAfter!34 lt!367766))))

(assert (=> b!819490 (= (apply!354 (+!1845 lt!367764 (tuple2!9645 lt!367747 zeroValueAfter!34)) lt!367766) (apply!354 lt!367764 lt!367766))))

(declare-fun lt!367760 () Unit!27975)

(assert (=> b!819490 (= lt!367760 lt!367754)))

(declare-fun lt!367749 () ListLongMap!8467)

(assert (=> b!819490 (= lt!367749 (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367768 () (_ BitVec 64))

(assert (=> b!819490 (= lt!367768 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!367763 () (_ BitVec 64))

(assert (=> b!819490 (= lt!367763 (select (arr!21718 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!819490 (= lt!367757 (addApplyDifferent!308 lt!367749 lt!367768 minValue!754 lt!367763))))

(assert (=> b!819490 (= (apply!354 (+!1845 lt!367749 (tuple2!9645 lt!367768 minValue!754)) lt!367763) (apply!354 lt!367749 lt!367763))))

(declare-fun b!819491 () Bool)

(assert (=> b!819491 (= e!455087 (= (apply!354 lt!367748 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!819492 () Bool)

(declare-fun res!559191 () Bool)

(assert (=> b!819492 (=> (not res!559191) (not e!455090))))

(assert (=> b!819492 (= res!559191 e!455093)))

(declare-fun res!559195 () Bool)

(assert (=> b!819492 (=> res!559195 e!455093)))

(assert (=> b!819492 (= res!559195 (not e!455088))))

(declare-fun res!559193 () Bool)

(assert (=> b!819492 (=> (not res!559193) (not e!455088))))

(assert (=> b!819492 (= res!559193 (bvslt #b00000000000000000000000000000000 (size!22139 _keys!976)))))

(assert (= (and d!104675 c!89160) b!819480))

(assert (= (and d!104675 (not c!89160)) b!819488))

(assert (= (and b!819488 c!89159) b!819472))

(assert (= (and b!819488 (not c!89159)) b!819487))

(assert (= (and b!819487 c!89158) b!819475))

(assert (= (and b!819487 (not c!89158)) b!819481))

(assert (= (or b!819475 b!819481) bm!35661))

(assert (= (or b!819472 bm!35661) bm!35664))

(assert (= (or b!819472 b!819475) bm!35658))

(assert (= (or b!819480 bm!35664) bm!35660))

(assert (= (or b!819480 bm!35658) bm!35662))

(assert (= (and d!104675 res!559197) b!819482))

(assert (= (and d!104675 c!89161) b!819490))

(assert (= (and d!104675 (not c!89161)) b!819489))

(assert (= (and d!104675 res!559192) b!819492))

(assert (= (and b!819492 res!559193) b!819485))

(assert (= (and b!819492 (not res!559195)) b!819479))

(assert (= (and b!819479 res!559196) b!819476))

(assert (= (and b!819492 res!559191) b!819483))

(assert (= (and b!819483 c!89157) b!819484))

(assert (= (and b!819483 (not c!89157)) b!819474))

(assert (= (and b!819484 res!559194) b!819491))

(assert (= (or b!819484 b!819474) bm!35659))

(assert (= (and b!819483 res!559190) b!819486))

(assert (= (and b!819486 c!89162) b!819478))

(assert (= (and b!819486 (not c!89162)) b!819477))

(assert (= (and b!819478 res!559189) b!819473))

(assert (= (or b!819478 b!819477) bm!35663))

(declare-fun b_lambda!10955 () Bool)

(assert (=> (not b_lambda!10955) (not b!819476)))

(assert (=> b!819476 t!21806))

(declare-fun b_and!21697 () Bool)

(assert (= b_and!21695 (and (=> t!21806 result!7907) b_and!21697)))

(assert (=> d!104675 m!760913))

(declare-fun m!761065 () Bool)

(assert (=> bm!35662 m!761065))

(declare-fun m!761067 () Bool)

(assert (=> b!819490 m!761067))

(declare-fun m!761069 () Bool)

(assert (=> b!819490 m!761069))

(declare-fun m!761071 () Bool)

(assert (=> b!819490 m!761071))

(declare-fun m!761073 () Bool)

(assert (=> b!819490 m!761073))

(declare-fun m!761075 () Bool)

(assert (=> b!819490 m!761075))

(assert (=> b!819490 m!760969))

(declare-fun m!761077 () Bool)

(assert (=> b!819490 m!761077))

(declare-fun m!761079 () Bool)

(assert (=> b!819490 m!761079))

(assert (=> b!819490 m!761069))

(assert (=> b!819490 m!760929))

(declare-fun m!761081 () Bool)

(assert (=> b!819490 m!761081))

(declare-fun m!761083 () Bool)

(assert (=> b!819490 m!761083))

(declare-fun m!761085 () Bool)

(assert (=> b!819490 m!761085))

(assert (=> b!819490 m!761081))

(declare-fun m!761087 () Bool)

(assert (=> b!819490 m!761087))

(declare-fun m!761089 () Bool)

(assert (=> b!819490 m!761089))

(declare-fun m!761091 () Bool)

(assert (=> b!819490 m!761091))

(declare-fun m!761093 () Bool)

(assert (=> b!819490 m!761093))

(assert (=> b!819490 m!761089))

(assert (=> b!819490 m!761085))

(declare-fun m!761095 () Bool)

(assert (=> b!819490 m!761095))

(assert (=> b!819479 m!760969))

(assert (=> b!819479 m!760969))

(declare-fun m!761097 () Bool)

(assert (=> b!819479 m!761097))

(assert (=> b!819482 m!760969))

(assert (=> b!819482 m!760969))

(assert (=> b!819482 m!760971))

(assert (=> b!819485 m!760969))

(assert (=> b!819485 m!760969))

(assert (=> b!819485 m!760971))

(declare-fun m!761099 () Bool)

(assert (=> b!819473 m!761099))

(declare-fun m!761101 () Bool)

(assert (=> bm!35663 m!761101))

(assert (=> bm!35660 m!760929))

(declare-fun m!761103 () Bool)

(assert (=> b!819491 m!761103))

(declare-fun m!761105 () Bool)

(assert (=> bm!35659 m!761105))

(declare-fun m!761107 () Bool)

(assert (=> b!819480 m!761107))

(assert (=> b!819476 m!760969))

(assert (=> b!819476 m!761007))

(assert (=> b!819476 m!760969))

(declare-fun m!761109 () Bool)

(assert (=> b!819476 m!761109))

(assert (=> b!819476 m!761007))

(assert (=> b!819476 m!761009))

(assert (=> b!819476 m!761011))

(assert (=> b!819476 m!761009))

(assert (=> b!819314 d!104675))

(declare-fun d!104677 () Bool)

(declare-fun e!455099 () Bool)

(assert (=> d!104677 e!455099))

(declare-fun res!559199 () Bool)

(assert (=> d!104677 (=> (not res!559199) (not e!455099))))

(declare-fun lt!367769 () ListLongMap!8467)

(assert (=> d!104677 (= res!559199 (contains!4159 lt!367769 (_1!4833 lt!367611)))))

(declare-fun lt!367770 () List!15473)

(assert (=> d!104677 (= lt!367769 (ListLongMap!8468 lt!367770))))

(declare-fun lt!367772 () Unit!27975)

(declare-fun lt!367771 () Unit!27975)

(assert (=> d!104677 (= lt!367772 lt!367771)))

(assert (=> d!104677 (= (getValueByKey!402 lt!367770 (_1!4833 lt!367611)) (Some!407 (_2!4833 lt!367611)))))

(assert (=> d!104677 (= lt!367771 (lemmaContainsTupThenGetReturnValue!216 lt!367770 (_1!4833 lt!367611) (_2!4833 lt!367611)))))

(assert (=> d!104677 (= lt!367770 (insertStrictlySorted!255 (toList!4249 lt!367609) (_1!4833 lt!367611) (_2!4833 lt!367611)))))

(assert (=> d!104677 (= (+!1845 lt!367609 lt!367611) lt!367769)))

(declare-fun b!819493 () Bool)

(declare-fun res!559198 () Bool)

(assert (=> b!819493 (=> (not res!559198) (not e!455099))))

(assert (=> b!819493 (= res!559198 (= (getValueByKey!402 (toList!4249 lt!367769) (_1!4833 lt!367611)) (Some!407 (_2!4833 lt!367611))))))

(declare-fun b!819494 () Bool)

(assert (=> b!819494 (= e!455099 (contains!4160 (toList!4249 lt!367769) lt!367611))))

(assert (= (and d!104677 res!559199) b!819493))

(assert (= (and b!819493 res!559198) b!819494))

(declare-fun m!761111 () Bool)

(assert (=> d!104677 m!761111))

(declare-fun m!761113 () Bool)

(assert (=> d!104677 m!761113))

(declare-fun m!761115 () Bool)

(assert (=> d!104677 m!761115))

(declare-fun m!761117 () Bool)

(assert (=> d!104677 m!761117))

(declare-fun m!761119 () Bool)

(assert (=> b!819493 m!761119))

(declare-fun m!761121 () Bool)

(assert (=> b!819494 m!761121))

(assert (=> b!819314 d!104677))

(declare-fun d!104679 () Bool)

(declare-fun e!455100 () Bool)

(assert (=> d!104679 e!455100))

(declare-fun res!559201 () Bool)

(assert (=> d!104679 (=> (not res!559201) (not e!455100))))

(declare-fun lt!367773 () ListLongMap!8467)

(assert (=> d!104679 (= res!559201 (contains!4159 lt!367773 (_1!4833 lt!367612)))))

(declare-fun lt!367774 () List!15473)

(assert (=> d!104679 (= lt!367773 (ListLongMap!8468 lt!367774))))

(declare-fun lt!367776 () Unit!27975)

(declare-fun lt!367775 () Unit!27975)

(assert (=> d!104679 (= lt!367776 lt!367775)))

(assert (=> d!104679 (= (getValueByKey!402 lt!367774 (_1!4833 lt!367612)) (Some!407 (_2!4833 lt!367612)))))

(assert (=> d!104679 (= lt!367775 (lemmaContainsTupThenGetReturnValue!216 lt!367774 (_1!4833 lt!367612) (_2!4833 lt!367612)))))

(assert (=> d!104679 (= lt!367774 (insertStrictlySorted!255 (toList!4249 lt!367608) (_1!4833 lt!367612) (_2!4833 lt!367612)))))

(assert (=> d!104679 (= (+!1845 lt!367608 lt!367612) lt!367773)))

(declare-fun b!819495 () Bool)

(declare-fun res!559200 () Bool)

(assert (=> b!819495 (=> (not res!559200) (not e!455100))))

(assert (=> b!819495 (= res!559200 (= (getValueByKey!402 (toList!4249 lt!367773) (_1!4833 lt!367612)) (Some!407 (_2!4833 lt!367612))))))

(declare-fun b!819496 () Bool)

(assert (=> b!819496 (= e!455100 (contains!4160 (toList!4249 lt!367773) lt!367612))))

(assert (= (and d!104679 res!559201) b!819495))

(assert (= (and b!819495 res!559200) b!819496))

(declare-fun m!761123 () Bool)

(assert (=> d!104679 m!761123))

(declare-fun m!761125 () Bool)

(assert (=> d!104679 m!761125))

(declare-fun m!761127 () Bool)

(assert (=> d!104679 m!761127))

(declare-fun m!761129 () Bool)

(assert (=> d!104679 m!761129))

(declare-fun m!761131 () Bool)

(assert (=> b!819495 m!761131))

(declare-fun m!761133 () Bool)

(assert (=> b!819496 m!761133))

(assert (=> b!819314 d!104679))

(declare-fun d!104681 () Bool)

(declare-fun e!455101 () Bool)

(assert (=> d!104681 e!455101))

(declare-fun res!559203 () Bool)

(assert (=> d!104681 (=> (not res!559203) (not e!455101))))

(declare-fun lt!367777 () ListLongMap!8467)

(assert (=> d!104681 (= res!559203 (contains!4159 lt!367777 (_1!4833 lt!367612)))))

(declare-fun lt!367778 () List!15473)

(assert (=> d!104681 (= lt!367777 (ListLongMap!8468 lt!367778))))

(declare-fun lt!367780 () Unit!27975)

(declare-fun lt!367779 () Unit!27975)

(assert (=> d!104681 (= lt!367780 lt!367779)))

(assert (=> d!104681 (= (getValueByKey!402 lt!367778 (_1!4833 lt!367612)) (Some!407 (_2!4833 lt!367612)))))

(assert (=> d!104681 (= lt!367779 (lemmaContainsTupThenGetReturnValue!216 lt!367778 (_1!4833 lt!367612) (_2!4833 lt!367612)))))

(assert (=> d!104681 (= lt!367778 (insertStrictlySorted!255 (toList!4249 (+!1845 lt!367609 lt!367611)) (_1!4833 lt!367612) (_2!4833 lt!367612)))))

(assert (=> d!104681 (= (+!1845 (+!1845 lt!367609 lt!367611) lt!367612) lt!367777)))

(declare-fun b!819497 () Bool)

(declare-fun res!559202 () Bool)

(assert (=> b!819497 (=> (not res!559202) (not e!455101))))

(assert (=> b!819497 (= res!559202 (= (getValueByKey!402 (toList!4249 lt!367777) (_1!4833 lt!367612)) (Some!407 (_2!4833 lt!367612))))))

(declare-fun b!819498 () Bool)

(assert (=> b!819498 (= e!455101 (contains!4160 (toList!4249 lt!367777) lt!367612))))

(assert (= (and d!104681 res!559203) b!819497))

(assert (= (and b!819497 res!559202) b!819498))

(declare-fun m!761135 () Bool)

(assert (=> d!104681 m!761135))

(declare-fun m!761137 () Bool)

(assert (=> d!104681 m!761137))

(declare-fun m!761139 () Bool)

(assert (=> d!104681 m!761139))

(declare-fun m!761141 () Bool)

(assert (=> d!104681 m!761141))

(declare-fun m!761143 () Bool)

(assert (=> b!819497 m!761143))

(declare-fun m!761145 () Bool)

(assert (=> b!819498 m!761145))

(assert (=> b!819314 d!104681))

(declare-fun d!104683 () Bool)

(declare-fun e!455102 () Bool)

(assert (=> d!104683 e!455102))

(declare-fun res!559205 () Bool)

(assert (=> d!104683 (=> (not res!559205) (not e!455102))))

(declare-fun lt!367781 () ListLongMap!8467)

(assert (=> d!104683 (= res!559205 (contains!4159 lt!367781 (_1!4833 lt!367611)))))

(declare-fun lt!367782 () List!15473)

(assert (=> d!104683 (= lt!367781 (ListLongMap!8468 lt!367782))))

(declare-fun lt!367784 () Unit!27975)

(declare-fun lt!367783 () Unit!27975)

(assert (=> d!104683 (= lt!367784 lt!367783)))

(assert (=> d!104683 (= (getValueByKey!402 lt!367782 (_1!4833 lt!367611)) (Some!407 (_2!4833 lt!367611)))))

(assert (=> d!104683 (= lt!367783 (lemmaContainsTupThenGetReturnValue!216 lt!367782 (_1!4833 lt!367611) (_2!4833 lt!367611)))))

(assert (=> d!104683 (= lt!367782 (insertStrictlySorted!255 (toList!4249 lt!367614) (_1!4833 lt!367611) (_2!4833 lt!367611)))))

(assert (=> d!104683 (= (+!1845 lt!367614 lt!367611) lt!367781)))

(declare-fun b!819499 () Bool)

(declare-fun res!559204 () Bool)

(assert (=> b!819499 (=> (not res!559204) (not e!455102))))

(assert (=> b!819499 (= res!559204 (= (getValueByKey!402 (toList!4249 lt!367781) (_1!4833 lt!367611)) (Some!407 (_2!4833 lt!367611))))))

(declare-fun b!819500 () Bool)

(assert (=> b!819500 (= e!455102 (contains!4160 (toList!4249 lt!367781) lt!367611))))

(assert (= (and d!104683 res!559205) b!819499))

(assert (= (and b!819499 res!559204) b!819500))

(declare-fun m!761147 () Bool)

(assert (=> d!104683 m!761147))

(declare-fun m!761149 () Bool)

(assert (=> d!104683 m!761149))

(declare-fun m!761151 () Bool)

(assert (=> d!104683 m!761151))

(declare-fun m!761153 () Bool)

(assert (=> d!104683 m!761153))

(declare-fun m!761155 () Bool)

(assert (=> b!819499 m!761155))

(declare-fun m!761157 () Bool)

(assert (=> b!819500 m!761157))

(assert (=> b!819314 d!104683))

(declare-fun bm!35665 () Bool)

(declare-fun call!35668 () ListLongMap!8467)

(declare-fun call!35670 () ListLongMap!8467)

(assert (=> bm!35665 (= call!35668 call!35670)))

(declare-fun b!819501 () Bool)

(declare-fun e!455112 () ListLongMap!8467)

(assert (=> b!819501 (= e!455112 call!35668)))

(declare-fun bm!35666 () Bool)

(declare-fun call!35672 () Bool)

(declare-fun lt!367786 () ListLongMap!8467)

(assert (=> bm!35666 (= call!35672 (contains!4159 lt!367786 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!819502 () Bool)

(declare-fun e!455103 () Bool)

(assert (=> b!819502 (= e!455103 (= (apply!354 lt!367786 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!819503 () Bool)

(declare-fun e!455106 () Bool)

(assert (=> b!819503 (= e!455106 (not call!35672))))

(declare-fun b!819504 () Bool)

(declare-fun e!455109 () ListLongMap!8467)

(assert (=> b!819504 (= e!455109 call!35668)))

(declare-fun call!35669 () ListLongMap!8467)

(declare-fun bm!35667 () Bool)

(assert (=> bm!35667 (= call!35669 (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!35668 () Bool)

(declare-fun call!35673 () ListLongMap!8467)

(declare-fun call!35674 () ListLongMap!8467)

(assert (=> bm!35668 (= call!35673 call!35674)))

(declare-fun b!819505 () Bool)

(declare-fun e!455108 () Bool)

(assert (=> b!819505 (= e!455108 (= (apply!354 lt!367786 (select (arr!21718 _keys!976) #b00000000000000000000000000000000)) (get!11585 (select (arr!21717 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!819505 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22138 _values!788)))))

(assert (=> b!819505 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22139 _keys!976)))))

(declare-fun c!89166 () Bool)

(declare-fun c!89165 () Bool)

(declare-fun bm!35669 () Bool)

(assert (=> bm!35669 (= call!35670 (+!1845 (ite c!89166 call!35669 (ite c!89165 call!35674 call!35673)) (ite (or c!89166 c!89165) (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!819506 () Bool)

(declare-fun e!455115 () Bool)

(declare-fun call!35671 () Bool)

(assert (=> b!819506 (= e!455115 (not call!35671))))

(declare-fun bm!35670 () Bool)

(assert (=> bm!35670 (= call!35671 (contains!4159 lt!367786 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!819507 () Bool)

(assert (=> b!819507 (= e!455115 e!455103)))

(declare-fun res!559206 () Bool)

(assert (=> b!819507 (= res!559206 call!35671)))

(assert (=> b!819507 (=> (not res!559206) (not e!455103))))

(declare-fun b!819508 () Bool)

(declare-fun e!455110 () Bool)

(assert (=> b!819508 (= e!455110 e!455108)))

(declare-fun res!559213 () Bool)

(assert (=> b!819508 (=> (not res!559213) (not e!455108))))

(assert (=> b!819508 (= res!559213 (contains!4159 lt!367786 (select (arr!21718 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!819508 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22139 _keys!976)))))

(declare-fun b!819509 () Bool)

(declare-fun e!455113 () ListLongMap!8467)

(assert (=> b!819509 (= e!455113 (+!1845 call!35670 (tuple2!9645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!819510 () Bool)

(assert (=> b!819510 (= e!455109 call!35673)))

(declare-fun b!819511 () Bool)

(declare-fun e!455114 () Bool)

(assert (=> b!819511 (= e!455114 (validKeyInArray!0 (select (arr!21718 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!819512 () Bool)

(declare-fun res!559207 () Bool)

(declare-fun e!455107 () Bool)

(assert (=> b!819512 (=> (not res!559207) (not e!455107))))

(assert (=> b!819512 (= res!559207 e!455106)))

(declare-fun c!89163 () Bool)

(assert (=> b!819512 (= c!89163 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!819513 () Bool)

(declare-fun e!455104 () Bool)

(assert (=> b!819513 (= e!455106 e!455104)))

(declare-fun res!559211 () Bool)

(assert (=> b!819513 (= res!559211 call!35672)))

(assert (=> b!819513 (=> (not res!559211) (not e!455104))))

(declare-fun b!819514 () Bool)

(declare-fun e!455105 () Bool)

(assert (=> b!819514 (= e!455105 (validKeyInArray!0 (select (arr!21718 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!819515 () Bool)

(assert (=> b!819515 (= e!455107 e!455115)))

(declare-fun c!89168 () Bool)

(assert (=> b!819515 (= c!89168 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!819516 () Bool)

(declare-fun c!89164 () Bool)

(assert (=> b!819516 (= c!89164 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!819516 (= e!455112 e!455109)))

(declare-fun b!819517 () Bool)

(assert (=> b!819517 (= e!455113 e!455112)))

(assert (=> b!819517 (= c!89165 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!104685 () Bool)

(assert (=> d!104685 e!455107))

(declare-fun res!559209 () Bool)

(assert (=> d!104685 (=> (not res!559209) (not e!455107))))

(assert (=> d!104685 (= res!559209 (or (bvsge #b00000000000000000000000000000000 (size!22139 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22139 _keys!976)))))))

(declare-fun lt!367805 () ListLongMap!8467)

(assert (=> d!104685 (= lt!367786 lt!367805)))

(declare-fun lt!367800 () Unit!27975)

(declare-fun e!455111 () Unit!27975)

(assert (=> d!104685 (= lt!367800 e!455111)))

(declare-fun c!89167 () Bool)

(assert (=> d!104685 (= c!89167 e!455114)))

(declare-fun res!559214 () Bool)

(assert (=> d!104685 (=> (not res!559214) (not e!455114))))

(assert (=> d!104685 (= res!559214 (bvslt #b00000000000000000000000000000000 (size!22139 _keys!976)))))

(assert (=> d!104685 (= lt!367805 e!455113)))

(assert (=> d!104685 (= c!89166 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104685 (validMask!0 mask!1312)))

(assert (=> d!104685 (= (getCurrentListMap!2450 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!367786)))

(declare-fun bm!35671 () Bool)

(assert (=> bm!35671 (= call!35674 call!35669)))

(declare-fun b!819518 () Bool)

(declare-fun Unit!27980 () Unit!27975)

(assert (=> b!819518 (= e!455111 Unit!27980)))

(declare-fun b!819519 () Bool)

(declare-fun lt!367795 () Unit!27975)

(assert (=> b!819519 (= e!455111 lt!367795)))

(declare-fun lt!367793 () ListLongMap!8467)

(assert (=> b!819519 (= lt!367793 (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367794 () (_ BitVec 64))

(assert (=> b!819519 (= lt!367794 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!367789 () (_ BitVec 64))

(assert (=> b!819519 (= lt!367789 (select (arr!21718 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!367790 () Unit!27975)

(assert (=> b!819519 (= lt!367790 (addStillContains!308 lt!367793 lt!367794 zeroValueBefore!34 lt!367789))))

(assert (=> b!819519 (contains!4159 (+!1845 lt!367793 (tuple2!9645 lt!367794 zeroValueBefore!34)) lt!367789)))

(declare-fun lt!367797 () Unit!27975)

(assert (=> b!819519 (= lt!367797 lt!367790)))

(declare-fun lt!367796 () ListLongMap!8467)

(assert (=> b!819519 (= lt!367796 (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367803 () (_ BitVec 64))

(assert (=> b!819519 (= lt!367803 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!367791 () (_ BitVec 64))

(assert (=> b!819519 (= lt!367791 (select (arr!21718 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!367788 () Unit!27975)

(assert (=> b!819519 (= lt!367788 (addApplyDifferent!308 lt!367796 lt!367803 minValue!754 lt!367791))))

(assert (=> b!819519 (= (apply!354 (+!1845 lt!367796 (tuple2!9645 lt!367803 minValue!754)) lt!367791) (apply!354 lt!367796 lt!367791))))

(declare-fun lt!367799 () Unit!27975)

(assert (=> b!819519 (= lt!367799 lt!367788)))

(declare-fun lt!367802 () ListLongMap!8467)

(assert (=> b!819519 (= lt!367802 (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367785 () (_ BitVec 64))

(assert (=> b!819519 (= lt!367785 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!367804 () (_ BitVec 64))

(assert (=> b!819519 (= lt!367804 (select (arr!21718 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!367792 () Unit!27975)

(assert (=> b!819519 (= lt!367792 (addApplyDifferent!308 lt!367802 lt!367785 zeroValueBefore!34 lt!367804))))

(assert (=> b!819519 (= (apply!354 (+!1845 lt!367802 (tuple2!9645 lt!367785 zeroValueBefore!34)) lt!367804) (apply!354 lt!367802 lt!367804))))

(declare-fun lt!367798 () Unit!27975)

(assert (=> b!819519 (= lt!367798 lt!367792)))

(declare-fun lt!367787 () ListLongMap!8467)

(assert (=> b!819519 (= lt!367787 (getCurrentListMapNoExtraKeys!2282 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367806 () (_ BitVec 64))

(assert (=> b!819519 (= lt!367806 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!367801 () (_ BitVec 64))

(assert (=> b!819519 (= lt!367801 (select (arr!21718 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!819519 (= lt!367795 (addApplyDifferent!308 lt!367787 lt!367806 minValue!754 lt!367801))))

(assert (=> b!819519 (= (apply!354 (+!1845 lt!367787 (tuple2!9645 lt!367806 minValue!754)) lt!367801) (apply!354 lt!367787 lt!367801))))

(declare-fun b!819520 () Bool)

(assert (=> b!819520 (= e!455104 (= (apply!354 lt!367786 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!819521 () Bool)

(declare-fun res!559208 () Bool)

(assert (=> b!819521 (=> (not res!559208) (not e!455107))))

(assert (=> b!819521 (= res!559208 e!455110)))

(declare-fun res!559212 () Bool)

(assert (=> b!819521 (=> res!559212 e!455110)))

(assert (=> b!819521 (= res!559212 (not e!455105))))

(declare-fun res!559210 () Bool)

(assert (=> b!819521 (=> (not res!559210) (not e!455105))))

(assert (=> b!819521 (= res!559210 (bvslt #b00000000000000000000000000000000 (size!22139 _keys!976)))))

(assert (= (and d!104685 c!89166) b!819509))

(assert (= (and d!104685 (not c!89166)) b!819517))

(assert (= (and b!819517 c!89165) b!819501))

(assert (= (and b!819517 (not c!89165)) b!819516))

(assert (= (and b!819516 c!89164) b!819504))

(assert (= (and b!819516 (not c!89164)) b!819510))

(assert (= (or b!819504 b!819510) bm!35668))

(assert (= (or b!819501 bm!35668) bm!35671))

(assert (= (or b!819501 b!819504) bm!35665))

(assert (= (or b!819509 bm!35671) bm!35667))

(assert (= (or b!819509 bm!35665) bm!35669))

(assert (= (and d!104685 res!559214) b!819511))

(assert (= (and d!104685 c!89167) b!819519))

(assert (= (and d!104685 (not c!89167)) b!819518))

(assert (= (and d!104685 res!559209) b!819521))

(assert (= (and b!819521 res!559210) b!819514))

(assert (= (and b!819521 (not res!559212)) b!819508))

(assert (= (and b!819508 res!559213) b!819505))

(assert (= (and b!819521 res!559208) b!819512))

(assert (= (and b!819512 c!89163) b!819513))

(assert (= (and b!819512 (not c!89163)) b!819503))

(assert (= (and b!819513 res!559211) b!819520))

(assert (= (or b!819513 b!819503) bm!35666))

(assert (= (and b!819512 res!559207) b!819515))

(assert (= (and b!819515 c!89168) b!819507))

(assert (= (and b!819515 (not c!89168)) b!819506))

(assert (= (and b!819507 res!559206) b!819502))

(assert (= (or b!819507 b!819506) bm!35670))

(declare-fun b_lambda!10957 () Bool)

(assert (=> (not b_lambda!10957) (not b!819505)))

(assert (=> b!819505 t!21806))

(declare-fun b_and!21699 () Bool)

(assert (= b_and!21697 (and (=> t!21806 result!7907) b_and!21699)))

(assert (=> d!104685 m!760913))

(declare-fun m!761159 () Bool)

(assert (=> bm!35669 m!761159))

(declare-fun m!761161 () Bool)

(assert (=> b!819519 m!761161))

(declare-fun m!761163 () Bool)

(assert (=> b!819519 m!761163))

(declare-fun m!761165 () Bool)

(assert (=> b!819519 m!761165))

(declare-fun m!761167 () Bool)

(assert (=> b!819519 m!761167))

(declare-fun m!761169 () Bool)

(assert (=> b!819519 m!761169))

(assert (=> b!819519 m!760969))

(declare-fun m!761171 () Bool)

(assert (=> b!819519 m!761171))

(declare-fun m!761173 () Bool)

(assert (=> b!819519 m!761173))

(assert (=> b!819519 m!761163))

(assert (=> b!819519 m!760931))

(declare-fun m!761175 () Bool)

(assert (=> b!819519 m!761175))

(declare-fun m!761177 () Bool)

(assert (=> b!819519 m!761177))

(declare-fun m!761179 () Bool)

(assert (=> b!819519 m!761179))

(assert (=> b!819519 m!761175))

(declare-fun m!761181 () Bool)

(assert (=> b!819519 m!761181))

(declare-fun m!761183 () Bool)

(assert (=> b!819519 m!761183))

(declare-fun m!761185 () Bool)

(assert (=> b!819519 m!761185))

(declare-fun m!761187 () Bool)

(assert (=> b!819519 m!761187))

(assert (=> b!819519 m!761183))

(assert (=> b!819519 m!761179))

(declare-fun m!761189 () Bool)

(assert (=> b!819519 m!761189))

(assert (=> b!819508 m!760969))

(assert (=> b!819508 m!760969))

(declare-fun m!761191 () Bool)

(assert (=> b!819508 m!761191))

(assert (=> b!819511 m!760969))

(assert (=> b!819511 m!760969))

(assert (=> b!819511 m!760971))

(assert (=> b!819514 m!760969))

(assert (=> b!819514 m!760969))

(assert (=> b!819514 m!760971))

(declare-fun m!761193 () Bool)

(assert (=> b!819502 m!761193))

(declare-fun m!761195 () Bool)

(assert (=> bm!35670 m!761195))

(assert (=> bm!35667 m!760931))

(declare-fun m!761197 () Bool)

(assert (=> b!819520 m!761197))

(declare-fun m!761199 () Bool)

(assert (=> bm!35666 m!761199))

(declare-fun m!761201 () Bool)

(assert (=> b!819509 m!761201))

(assert (=> b!819505 m!760969))

(assert (=> b!819505 m!761007))

(assert (=> b!819505 m!760969))

(declare-fun m!761203 () Bool)

(assert (=> b!819505 m!761203))

(assert (=> b!819505 m!761007))

(assert (=> b!819505 m!761009))

(assert (=> b!819505 m!761011))

(assert (=> b!819505 m!761009))

(assert (=> b!819314 d!104685))

(declare-fun b!819528 () Bool)

(declare-fun e!455120 () Bool)

(assert (=> b!819528 (= e!455120 tp_is_empty!14565)))

(declare-fun mapIsEmpty!23452 () Bool)

(declare-fun mapRes!23452 () Bool)

(assert (=> mapIsEmpty!23452 mapRes!23452))

(declare-fun mapNonEmpty!23452 () Bool)

(declare-fun tp!45307 () Bool)

(assert (=> mapNonEmpty!23452 (= mapRes!23452 (and tp!45307 e!455120))))

(declare-fun mapKey!23452 () (_ BitVec 32))

(declare-fun mapValue!23452 () ValueCell!6867)

(declare-fun mapRest!23452 () (Array (_ BitVec 32) ValueCell!6867))

(assert (=> mapNonEmpty!23452 (= mapRest!23446 (store mapRest!23452 mapKey!23452 mapValue!23452))))

(declare-fun condMapEmpty!23452 () Bool)

(declare-fun mapDefault!23452 () ValueCell!6867)

(assert (=> mapNonEmpty!23446 (= condMapEmpty!23452 (= mapRest!23446 ((as const (Array (_ BitVec 32) ValueCell!6867)) mapDefault!23452)))))

(declare-fun e!455121 () Bool)

(assert (=> mapNonEmpty!23446 (= tp!45297 (and e!455121 mapRes!23452))))

(declare-fun b!819529 () Bool)

(assert (=> b!819529 (= e!455121 tp_is_empty!14565)))

(assert (= (and mapNonEmpty!23446 condMapEmpty!23452) mapIsEmpty!23452))

(assert (= (and mapNonEmpty!23446 (not condMapEmpty!23452)) mapNonEmpty!23452))

(assert (= (and mapNonEmpty!23452 ((_ is ValueCellFull!6867) mapValue!23452)) b!819528))

(assert (= (and mapNonEmpty!23446 ((_ is ValueCellFull!6867) mapDefault!23452)) b!819529))

(declare-fun m!761205 () Bool)

(assert (=> mapNonEmpty!23452 m!761205))

(declare-fun b_lambda!10959 () Bool)

(assert (= b_lambda!10947 (or (and start!70528 b_free!12855) b_lambda!10959)))

(declare-fun b_lambda!10961 () Bool)

(assert (= b_lambda!10949 (or (and start!70528 b_free!12855) b_lambda!10961)))

(declare-fun b_lambda!10963 () Bool)

(assert (= b_lambda!10953 (or (and start!70528 b_free!12855) b_lambda!10963)))

(declare-fun b_lambda!10965 () Bool)

(assert (= b_lambda!10957 (or (and start!70528 b_free!12855) b_lambda!10965)))

(declare-fun b_lambda!10967 () Bool)

(assert (= b_lambda!10951 (or (and start!70528 b_free!12855) b_lambda!10967)))

(declare-fun b_lambda!10969 () Bool)

(assert (= b_lambda!10955 (or (and start!70528 b_free!12855) b_lambda!10969)))

(check-sat (not b!819494) (not b!819374) (not b!819495) (not d!104671) (not b!819373) (not b!819509) (not b!819403) (not b_lambda!10965) (not b!819520) (not b_lambda!10959) (not b_lambda!10963) (not bm!35642) (not b!819493) (not bm!35662) (not b!819496) b_and!21699 (not bm!35643) (not b!819418) (not d!104675) (not b!819353) (not bm!35666) (not b!819406) (not b!819405) (not b!819499) (not d!104681) (not b!819519) (not b!819419) (not b!819355) (not b!819490) (not b!819502) (not bm!35636) (not b!819514) (not bm!35659) (not bm!35669) (not b!819479) (not b!819420) (not b!819476) (not b!819485) (not b!819505) (not d!104685) (not b_next!12855) (not bm!35663) (not bm!35670) (not d!104669) (not mapNonEmpty!23452) (not b!819408) (not b!819402) (not b!819416) (not b!819407) (not b!819421) (not b!819429) (not d!104673) (not b!819480) (not b!819422) (not b_lambda!10969) (not bm!35660) (not b!819413) (not d!104679) (not b!819361) (not b!819428) (not b!819498) (not d!104683) (not b!819404) (not d!104667) (not b!819497) (not b!819508) (not b_lambda!10967) (not b!819377) (not b!819473) (not d!104677) (not b!819511) (not d!104665) (not b!819417) (not bm!35667) tp_is_empty!14565 (not bm!35639) (not b!819491) (not b!819482) (not b!819427) (not b!819500) (not b!819362) (not b_lambda!10961) (not d!104655))
(check-sat b_and!21699 (not b_next!12855))
