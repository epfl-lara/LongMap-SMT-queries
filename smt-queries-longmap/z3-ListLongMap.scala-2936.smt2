; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41806 () Bool)

(assert start!41806)

(declare-fun b_free!11427 () Bool)

(declare-fun b_next!11427 () Bool)

(assert (=> start!41806 (= b_free!11427 (not b_next!11427))))

(declare-fun tp!40287 () Bool)

(declare-fun b_and!19795 () Bool)

(assert (=> start!41806 (= tp!40287 b_and!19795)))

(declare-fun b!466847 () Bool)

(declare-fun res!279063 () Bool)

(declare-fun e!273028 () Bool)

(assert (=> b!466847 (=> (not res!279063) (not e!273028))))

(declare-datatypes ((array!29491 0))(
  ( (array!29492 (arr!14174 (Array (_ BitVec 32) (_ BitVec 64))) (size!14526 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29491)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29491 (_ BitVec 32)) Bool)

(assert (=> b!466847 (= res!279063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466848 () Bool)

(declare-fun e!273031 () Bool)

(declare-fun tp_is_empty!12855 () Bool)

(assert (=> b!466848 (= e!273031 tp_is_empty!12855)))

(declare-fun b!466849 () Bool)

(declare-fun res!279060 () Bool)

(declare-fun e!273027 () Bool)

(assert (=> b!466849 (=> res!279060 e!273027)))

(declare-datatypes ((V!18245 0))(
  ( (V!18246 (val!6472 Int)) )
))
(declare-fun minValueBefore!38 () V!18245)

(declare-fun zeroValue!794 () V!18245)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6084 0))(
  ( (ValueCellFull!6084 (v!8760 V!18245)) (EmptyCell!6084) )
))
(declare-datatypes ((array!29493 0))(
  ( (array!29494 (arr!14175 (Array (_ BitVec 32) ValueCell!6084)) (size!14527 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29493)

(declare-fun minValueAfter!38 () V!18245)

(declare-datatypes ((tuple2!8490 0))(
  ( (tuple2!8491 (_1!4256 (_ BitVec 64)) (_2!4256 V!18245)) )
))
(declare-datatypes ((List!8580 0))(
  ( (Nil!8577) (Cons!8576 (h!9432 tuple2!8490) (t!14532 List!8580)) )
))
(declare-datatypes ((ListLongMap!7403 0))(
  ( (ListLongMap!7404 (toList!3717 List!8580)) )
))
(declare-fun +!1671 (ListLongMap!7403 tuple2!8490) ListLongMap!7403)

(declare-fun getCurrentListMap!2165 (array!29491 array!29493 (_ BitVec 32) (_ BitVec 32) V!18245 V!18245 (_ BitVec 32) Int) ListLongMap!7403)

(assert (=> b!466849 (= res!279060 (not (= (+!1671 (getCurrentListMap!2165 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8491 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (getCurrentListMap!2165 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))))

(declare-fun b!466850 () Bool)

(declare-fun res!279065 () Bool)

(assert (=> b!466850 (=> (not res!279065) (not e!273028))))

(assert (=> b!466850 (= res!279065 (and (= (size!14527 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14526 _keys!1025) (size!14527 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466851 () Bool)

(declare-fun res!279062 () Bool)

(assert (=> b!466851 (=> (not res!279062) (not e!273028))))

(declare-datatypes ((List!8581 0))(
  ( (Nil!8578) (Cons!8577 (h!9433 (_ BitVec 64)) (t!14533 List!8581)) )
))
(declare-fun arrayNoDuplicates!0 (array!29491 (_ BitVec 32) List!8581) Bool)

(assert (=> b!466851 (= res!279062 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8578))))

(declare-fun mapNonEmpty!20968 () Bool)

(declare-fun mapRes!20968 () Bool)

(declare-fun tp!40288 () Bool)

(assert (=> mapNonEmpty!20968 (= mapRes!20968 (and tp!40288 e!273031))))

(declare-fun mapRest!20968 () (Array (_ BitVec 32) ValueCell!6084))

(declare-fun mapKey!20968 () (_ BitVec 32))

(declare-fun mapValue!20968 () ValueCell!6084)

(assert (=> mapNonEmpty!20968 (= (arr!14175 _values!833) (store mapRest!20968 mapKey!20968 mapValue!20968))))

(declare-fun b!466852 () Bool)

(assert (=> b!466852 (= e!273028 (not e!273027))))

(declare-fun res!279061 () Bool)

(assert (=> b!466852 (=> res!279061 e!273027)))

(assert (=> b!466852 (= res!279061 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!211034 () ListLongMap!7403)

(declare-fun lt!211033 () ListLongMap!7403)

(assert (=> b!466852 (= lt!211034 lt!211033)))

(declare-datatypes ((Unit!13594 0))(
  ( (Unit!13595) )
))
(declare-fun lt!211035 () Unit!13594)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!72 (array!29491 array!29493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18245 V!18245 V!18245 V!18245 (_ BitVec 32) Int) Unit!13594)

(assert (=> b!466852 (= lt!211035 (lemmaNoChangeToArrayThenSameMapNoExtras!72 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1892 (array!29491 array!29493 (_ BitVec 32) (_ BitVec 32) V!18245 V!18245 (_ BitVec 32) Int) ListLongMap!7403)

(assert (=> b!466852 (= lt!211033 (getCurrentListMapNoExtraKeys!1892 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466852 (= lt!211034 (getCurrentListMapNoExtraKeys!1892 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466853 () Bool)

(declare-fun e!273026 () Bool)

(declare-fun e!273029 () Bool)

(assert (=> b!466853 (= e!273026 (and e!273029 mapRes!20968))))

(declare-fun condMapEmpty!20968 () Bool)

(declare-fun mapDefault!20968 () ValueCell!6084)

(assert (=> b!466853 (= condMapEmpty!20968 (= (arr!14175 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6084)) mapDefault!20968)))))

(declare-fun res!279064 () Bool)

(assert (=> start!41806 (=> (not res!279064) (not e!273028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41806 (= res!279064 (validMask!0 mask!1365))))

(assert (=> start!41806 e!273028))

(assert (=> start!41806 tp_is_empty!12855))

(assert (=> start!41806 tp!40287))

(assert (=> start!41806 true))

(declare-fun array_inv!10234 (array!29491) Bool)

(assert (=> start!41806 (array_inv!10234 _keys!1025)))

(declare-fun array_inv!10235 (array!29493) Bool)

(assert (=> start!41806 (and (array_inv!10235 _values!833) e!273026)))

(declare-fun b!466854 () Bool)

(assert (=> b!466854 (= e!273029 tp_is_empty!12855)))

(declare-fun b!466855 () Bool)

(assert (=> b!466855 (= e!273027 (bvsle #b00000000000000000000000000000000 (size!14526 _keys!1025)))))

(declare-fun mapIsEmpty!20968 () Bool)

(assert (=> mapIsEmpty!20968 mapRes!20968))

(assert (= (and start!41806 res!279064) b!466850))

(assert (= (and b!466850 res!279065) b!466847))

(assert (= (and b!466847 res!279063) b!466851))

(assert (= (and b!466851 res!279062) b!466852))

(assert (= (and b!466852 (not res!279061)) b!466849))

(assert (= (and b!466849 (not res!279060)) b!466855))

(assert (= (and b!466853 condMapEmpty!20968) mapIsEmpty!20968))

(assert (= (and b!466853 (not condMapEmpty!20968)) mapNonEmpty!20968))

(get-info :version)

(assert (= (and mapNonEmpty!20968 ((_ is ValueCellFull!6084) mapValue!20968)) b!466848))

(assert (= (and b!466853 ((_ is ValueCellFull!6084) mapDefault!20968)) b!466854))

(assert (= start!41806 b!466853))

(declare-fun m!449059 () Bool)

(assert (=> b!466851 m!449059))

(declare-fun m!449061 () Bool)

(assert (=> b!466849 m!449061))

(assert (=> b!466849 m!449061))

(declare-fun m!449063 () Bool)

(assert (=> b!466849 m!449063))

(declare-fun m!449065 () Bool)

(assert (=> b!466849 m!449065))

(declare-fun m!449067 () Bool)

(assert (=> mapNonEmpty!20968 m!449067))

(declare-fun m!449069 () Bool)

(assert (=> b!466847 m!449069))

(declare-fun m!449071 () Bool)

(assert (=> start!41806 m!449071))

(declare-fun m!449073 () Bool)

(assert (=> start!41806 m!449073))

(declare-fun m!449075 () Bool)

(assert (=> start!41806 m!449075))

(declare-fun m!449077 () Bool)

(assert (=> b!466852 m!449077))

(declare-fun m!449079 () Bool)

(assert (=> b!466852 m!449079))

(declare-fun m!449081 () Bool)

(assert (=> b!466852 m!449081))

(check-sat (not b!466851) (not start!41806) (not b_next!11427) (not mapNonEmpty!20968) tp_is_empty!12855 (not b!466847) (not b!466852) b_and!19795 (not b!466849))
(check-sat b_and!19795 (not b_next!11427))
(get-model)

(declare-fun b!466893 () Bool)

(declare-fun e!273058 () Bool)

(declare-fun contains!2527 (List!8581 (_ BitVec 64)) Bool)

(assert (=> b!466893 (= e!273058 (contains!2527 Nil!8578 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466894 () Bool)

(declare-fun e!273060 () Bool)

(declare-fun e!273061 () Bool)

(assert (=> b!466894 (= e!273060 e!273061)))

(declare-fun c!56745 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!466894 (= c!56745 (validKeyInArray!0 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30276 () Bool)

(declare-fun call!30279 () Bool)

(assert (=> bm!30276 (= call!30279 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56745 (Cons!8577 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000) Nil!8578) Nil!8578)))))

(declare-fun b!466895 () Bool)

(assert (=> b!466895 (= e!273061 call!30279)))

(declare-fun b!466896 () Bool)

(declare-fun e!273059 () Bool)

(assert (=> b!466896 (= e!273059 e!273060)))

(declare-fun res!279090 () Bool)

(assert (=> b!466896 (=> (not res!279090) (not e!273060))))

(assert (=> b!466896 (= res!279090 (not e!273058))))

(declare-fun res!279092 () Bool)

(assert (=> b!466896 (=> (not res!279092) (not e!273058))))

(assert (=> b!466896 (= res!279092 (validKeyInArray!0 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75163 () Bool)

(declare-fun res!279091 () Bool)

(assert (=> d!75163 (=> res!279091 e!273059)))

(assert (=> d!75163 (= res!279091 (bvsge #b00000000000000000000000000000000 (size!14526 _keys!1025)))))

(assert (=> d!75163 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8578) e!273059)))

(declare-fun b!466897 () Bool)

(assert (=> b!466897 (= e!273061 call!30279)))

(assert (= (and d!75163 (not res!279091)) b!466896))

(assert (= (and b!466896 res!279092) b!466893))

(assert (= (and b!466896 res!279090) b!466894))

(assert (= (and b!466894 c!56745) b!466895))

(assert (= (and b!466894 (not c!56745)) b!466897))

(assert (= (or b!466895 b!466897) bm!30276))

(declare-fun m!449107 () Bool)

(assert (=> b!466893 m!449107))

(assert (=> b!466893 m!449107))

(declare-fun m!449109 () Bool)

(assert (=> b!466893 m!449109))

(assert (=> b!466894 m!449107))

(assert (=> b!466894 m!449107))

(declare-fun m!449111 () Bool)

(assert (=> b!466894 m!449111))

(assert (=> bm!30276 m!449107))

(declare-fun m!449113 () Bool)

(assert (=> bm!30276 m!449113))

(assert (=> b!466896 m!449107))

(assert (=> b!466896 m!449107))

(assert (=> b!466896 m!449111))

(assert (=> b!466851 d!75163))

(declare-fun d!75165 () Bool)

(declare-fun res!279097 () Bool)

(declare-fun e!273068 () Bool)

(assert (=> d!75165 (=> res!279097 e!273068)))

(assert (=> d!75165 (= res!279097 (bvsge #b00000000000000000000000000000000 (size!14526 _keys!1025)))))

(assert (=> d!75165 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!273068)))

(declare-fun b!466906 () Bool)

(declare-fun e!273070 () Bool)

(assert (=> b!466906 (= e!273068 e!273070)))

(declare-fun c!56748 () Bool)

(assert (=> b!466906 (= c!56748 (validKeyInArray!0 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466907 () Bool)

(declare-fun e!273069 () Bool)

(declare-fun call!30282 () Bool)

(assert (=> b!466907 (= e!273069 call!30282)))

(declare-fun b!466908 () Bool)

(assert (=> b!466908 (= e!273070 e!273069)))

(declare-fun lt!211053 () (_ BitVec 64))

(assert (=> b!466908 (= lt!211053 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211051 () Unit!13594)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29491 (_ BitVec 64) (_ BitVec 32)) Unit!13594)

(assert (=> b!466908 (= lt!211051 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!211053 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!466908 (arrayContainsKey!0 _keys!1025 lt!211053 #b00000000000000000000000000000000)))

(declare-fun lt!211052 () Unit!13594)

(assert (=> b!466908 (= lt!211052 lt!211051)))

(declare-fun res!279098 () Bool)

(declare-datatypes ((SeekEntryResult!3547 0))(
  ( (MissingZero!3547 (index!16367 (_ BitVec 32))) (Found!3547 (index!16368 (_ BitVec 32))) (Intermediate!3547 (undefined!4359 Bool) (index!16369 (_ BitVec 32)) (x!43668 (_ BitVec 32))) (Undefined!3547) (MissingVacant!3547 (index!16370 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29491 (_ BitVec 32)) SeekEntryResult!3547)

(assert (=> b!466908 (= res!279098 (= (seekEntryOrOpen!0 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3547 #b00000000000000000000000000000000)))))

(assert (=> b!466908 (=> (not res!279098) (not e!273069))))

(declare-fun b!466909 () Bool)

(assert (=> b!466909 (= e!273070 call!30282)))

(declare-fun bm!30279 () Bool)

(assert (=> bm!30279 (= call!30282 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(assert (= (and d!75165 (not res!279097)) b!466906))

(assert (= (and b!466906 c!56748) b!466908))

(assert (= (and b!466906 (not c!56748)) b!466909))

(assert (= (and b!466908 res!279098) b!466907))

(assert (= (or b!466907 b!466909) bm!30279))

(assert (=> b!466906 m!449107))

(assert (=> b!466906 m!449107))

(assert (=> b!466906 m!449111))

(assert (=> b!466908 m!449107))

(declare-fun m!449115 () Bool)

(assert (=> b!466908 m!449115))

(declare-fun m!449117 () Bool)

(assert (=> b!466908 m!449117))

(assert (=> b!466908 m!449107))

(declare-fun m!449119 () Bool)

(assert (=> b!466908 m!449119))

(declare-fun m!449121 () Bool)

(assert (=> bm!30279 m!449121))

(assert (=> b!466847 d!75165))

(declare-fun d!75167 () Bool)

(assert (=> d!75167 (= (getCurrentListMapNoExtraKeys!1892 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1892 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211056 () Unit!13594)

(declare-fun choose!1340 (array!29491 array!29493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18245 V!18245 V!18245 V!18245 (_ BitVec 32) Int) Unit!13594)

(assert (=> d!75167 (= lt!211056 (choose!1340 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75167 (validMask!0 mask!1365)))

(assert (=> d!75167 (= (lemmaNoChangeToArrayThenSameMapNoExtras!72 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211056)))

(declare-fun bs!14778 () Bool)

(assert (= bs!14778 d!75167))

(assert (=> bs!14778 m!449081))

(assert (=> bs!14778 m!449079))

(declare-fun m!449123 () Bool)

(assert (=> bs!14778 m!449123))

(assert (=> bs!14778 m!449071))

(assert (=> b!466852 d!75167))

(declare-fun b!466934 () Bool)

(assert (=> b!466934 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14526 _keys!1025)))))

(assert (=> b!466934 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14527 _values!833)))))

(declare-fun e!273085 () Bool)

(declare-fun lt!211075 () ListLongMap!7403)

(declare-fun apply!323 (ListLongMap!7403 (_ BitVec 64)) V!18245)

(declare-fun get!6944 (ValueCell!6084 V!18245) V!18245)

(declare-fun dynLambda!916 (Int (_ BitVec 64)) V!18245)

(assert (=> b!466934 (= e!273085 (= (apply!323 lt!211075 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000)) (get!6944 (select (arr!14175 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!466935 () Bool)

(declare-fun e!273090 () Bool)

(declare-fun e!273086 () Bool)

(assert (=> b!466935 (= e!273090 e!273086)))

(declare-fun c!56759 () Bool)

(declare-fun e!273087 () Bool)

(assert (=> b!466935 (= c!56759 e!273087)))

(declare-fun res!279110 () Bool)

(assert (=> b!466935 (=> (not res!279110) (not e!273087))))

(assert (=> b!466935 (= res!279110 (bvslt #b00000000000000000000000000000000 (size!14526 _keys!1025)))))

(declare-fun b!466936 () Bool)

(declare-fun e!273091 () ListLongMap!7403)

(assert (=> b!466936 (= e!273091 (ListLongMap!7404 Nil!8577))))

(declare-fun b!466937 () Bool)

(declare-fun lt!211071 () Unit!13594)

(declare-fun lt!211072 () Unit!13594)

(assert (=> b!466937 (= lt!211071 lt!211072)))

(declare-fun lt!211076 () (_ BitVec 64))

(declare-fun lt!211073 () (_ BitVec 64))

(declare-fun lt!211074 () V!18245)

(declare-fun lt!211077 () ListLongMap!7403)

(declare-fun contains!2528 (ListLongMap!7403 (_ BitVec 64)) Bool)

(assert (=> b!466937 (not (contains!2528 (+!1671 lt!211077 (tuple2!8491 lt!211073 lt!211074)) lt!211076))))

(declare-fun addStillNotContains!156 (ListLongMap!7403 (_ BitVec 64) V!18245 (_ BitVec 64)) Unit!13594)

(assert (=> b!466937 (= lt!211072 (addStillNotContains!156 lt!211077 lt!211073 lt!211074 lt!211076))))

(assert (=> b!466937 (= lt!211076 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!466937 (= lt!211074 (get!6944 (select (arr!14175 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!466937 (= lt!211073 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30285 () ListLongMap!7403)

(assert (=> b!466937 (= lt!211077 call!30285)))

(declare-fun e!273088 () ListLongMap!7403)

(assert (=> b!466937 (= e!273088 (+!1671 call!30285 (tuple2!8491 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000) (get!6944 (select (arr!14175 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!273089 () Bool)

(declare-fun b!466938 () Bool)

(assert (=> b!466938 (= e!273089 (= lt!211075 (getCurrentListMapNoExtraKeys!1892 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!466939 () Bool)

(assert (=> b!466939 (= e!273087 (validKeyInArray!0 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466939 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!466940 () Bool)

(declare-fun res!279108 () Bool)

(assert (=> b!466940 (=> (not res!279108) (not e!273090))))

(assert (=> b!466940 (= res!279108 (not (contains!2528 lt!211075 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!466941 () Bool)

(declare-fun isEmpty!570 (ListLongMap!7403) Bool)

(assert (=> b!466941 (= e!273089 (isEmpty!570 lt!211075))))

(declare-fun b!466942 () Bool)

(assert (=> b!466942 (= e!273086 e!273089)))

(declare-fun c!56757 () Bool)

(assert (=> b!466942 (= c!56757 (bvslt #b00000000000000000000000000000000 (size!14526 _keys!1025)))))

(declare-fun b!466943 () Bool)

(assert (=> b!466943 (= e!273088 call!30285)))

(declare-fun d!75169 () Bool)

(assert (=> d!75169 e!273090))

(declare-fun res!279109 () Bool)

(assert (=> d!75169 (=> (not res!279109) (not e!273090))))

(assert (=> d!75169 (= res!279109 (not (contains!2528 lt!211075 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75169 (= lt!211075 e!273091)))

(declare-fun c!56760 () Bool)

(assert (=> d!75169 (= c!56760 (bvsge #b00000000000000000000000000000000 (size!14526 _keys!1025)))))

(assert (=> d!75169 (validMask!0 mask!1365)))

(assert (=> d!75169 (= (getCurrentListMapNoExtraKeys!1892 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211075)))

(declare-fun bm!30282 () Bool)

(assert (=> bm!30282 (= call!30285 (getCurrentListMapNoExtraKeys!1892 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!466944 () Bool)

(assert (=> b!466944 (= e!273091 e!273088)))

(declare-fun c!56758 () Bool)

(assert (=> b!466944 (= c!56758 (validKeyInArray!0 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466945 () Bool)

(assert (=> b!466945 (= e!273086 e!273085)))

(assert (=> b!466945 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14526 _keys!1025)))))

(declare-fun res!279107 () Bool)

(assert (=> b!466945 (= res!279107 (contains!2528 lt!211075 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466945 (=> (not res!279107) (not e!273085))))

(assert (= (and d!75169 c!56760) b!466936))

(assert (= (and d!75169 (not c!56760)) b!466944))

(assert (= (and b!466944 c!56758) b!466937))

(assert (= (and b!466944 (not c!56758)) b!466943))

(assert (= (or b!466937 b!466943) bm!30282))

(assert (= (and d!75169 res!279109) b!466940))

(assert (= (and b!466940 res!279108) b!466935))

(assert (= (and b!466935 res!279110) b!466939))

(assert (= (and b!466935 c!56759) b!466945))

(assert (= (and b!466935 (not c!56759)) b!466942))

(assert (= (and b!466945 res!279107) b!466934))

(assert (= (and b!466942 c!56757) b!466938))

(assert (= (and b!466942 (not c!56757)) b!466941))

(declare-fun b_lambda!10029 () Bool)

(assert (=> (not b_lambda!10029) (not b!466934)))

(declare-fun t!14536 () Bool)

(declare-fun tb!3911 () Bool)

(assert (=> (and start!41806 (= defaultEntry!841 defaultEntry!841) t!14536) tb!3911))

(declare-fun result!7391 () Bool)

(assert (=> tb!3911 (= result!7391 tp_is_empty!12855)))

(assert (=> b!466934 t!14536))

(declare-fun b_and!19799 () Bool)

(assert (= b_and!19795 (and (=> t!14536 result!7391) b_and!19799)))

(declare-fun b_lambda!10031 () Bool)

(assert (=> (not b_lambda!10031) (not b!466937)))

(assert (=> b!466937 t!14536))

(declare-fun b_and!19801 () Bool)

(assert (= b_and!19799 (and (=> t!14536 result!7391) b_and!19801)))

(declare-fun m!449125 () Bool)

(assert (=> b!466937 m!449125))

(declare-fun m!449127 () Bool)

(assert (=> b!466937 m!449127))

(declare-fun m!449129 () Bool)

(assert (=> b!466937 m!449129))

(declare-fun m!449131 () Bool)

(assert (=> b!466937 m!449131))

(assert (=> b!466937 m!449129))

(declare-fun m!449133 () Bool)

(assert (=> b!466937 m!449133))

(declare-fun m!449135 () Bool)

(assert (=> b!466937 m!449135))

(assert (=> b!466937 m!449131))

(declare-fun m!449137 () Bool)

(assert (=> b!466937 m!449137))

(assert (=> b!466937 m!449135))

(assert (=> b!466937 m!449107))

(declare-fun m!449139 () Bool)

(assert (=> b!466938 m!449139))

(assert (=> b!466934 m!449131))

(assert (=> b!466934 m!449135))

(assert (=> b!466934 m!449131))

(assert (=> b!466934 m!449137))

(assert (=> b!466934 m!449107))

(assert (=> b!466934 m!449135))

(assert (=> b!466934 m!449107))

(declare-fun m!449141 () Bool)

(assert (=> b!466934 m!449141))

(assert (=> bm!30282 m!449139))

(assert (=> b!466945 m!449107))

(assert (=> b!466945 m!449107))

(declare-fun m!449143 () Bool)

(assert (=> b!466945 m!449143))

(declare-fun m!449145 () Bool)

(assert (=> b!466940 m!449145))

(declare-fun m!449147 () Bool)

(assert (=> d!75169 m!449147))

(assert (=> d!75169 m!449071))

(declare-fun m!449149 () Bool)

(assert (=> b!466941 m!449149))

(assert (=> b!466939 m!449107))

(assert (=> b!466939 m!449107))

(assert (=> b!466939 m!449111))

(assert (=> b!466944 m!449107))

(assert (=> b!466944 m!449107))

(assert (=> b!466944 m!449111))

(assert (=> b!466852 d!75169))

(declare-fun b!466948 () Bool)

(assert (=> b!466948 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14526 _keys!1025)))))

(assert (=> b!466948 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14527 _values!833)))))

(declare-fun lt!211082 () ListLongMap!7403)

(declare-fun e!273092 () Bool)

(assert (=> b!466948 (= e!273092 (= (apply!323 lt!211082 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000)) (get!6944 (select (arr!14175 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!466949 () Bool)

(declare-fun e!273097 () Bool)

(declare-fun e!273093 () Bool)

(assert (=> b!466949 (= e!273097 e!273093)))

(declare-fun c!56763 () Bool)

(declare-fun e!273094 () Bool)

(assert (=> b!466949 (= c!56763 e!273094)))

(declare-fun res!279114 () Bool)

(assert (=> b!466949 (=> (not res!279114) (not e!273094))))

(assert (=> b!466949 (= res!279114 (bvslt #b00000000000000000000000000000000 (size!14526 _keys!1025)))))

(declare-fun b!466950 () Bool)

(declare-fun e!273098 () ListLongMap!7403)

(assert (=> b!466950 (= e!273098 (ListLongMap!7404 Nil!8577))))

(declare-fun b!466951 () Bool)

(declare-fun lt!211078 () Unit!13594)

(declare-fun lt!211079 () Unit!13594)

(assert (=> b!466951 (= lt!211078 lt!211079)))

(declare-fun lt!211081 () V!18245)

(declare-fun lt!211080 () (_ BitVec 64))

(declare-fun lt!211083 () (_ BitVec 64))

(declare-fun lt!211084 () ListLongMap!7403)

(assert (=> b!466951 (not (contains!2528 (+!1671 lt!211084 (tuple2!8491 lt!211080 lt!211081)) lt!211083))))

(assert (=> b!466951 (= lt!211079 (addStillNotContains!156 lt!211084 lt!211080 lt!211081 lt!211083))))

(assert (=> b!466951 (= lt!211083 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!466951 (= lt!211081 (get!6944 (select (arr!14175 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!466951 (= lt!211080 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30286 () ListLongMap!7403)

(assert (=> b!466951 (= lt!211084 call!30286)))

(declare-fun e!273095 () ListLongMap!7403)

(assert (=> b!466951 (= e!273095 (+!1671 call!30286 (tuple2!8491 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000) (get!6944 (select (arr!14175 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!466952 () Bool)

(declare-fun e!273096 () Bool)

(assert (=> b!466952 (= e!273096 (= lt!211082 (getCurrentListMapNoExtraKeys!1892 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!466953 () Bool)

(assert (=> b!466953 (= e!273094 (validKeyInArray!0 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466953 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!466954 () Bool)

(declare-fun res!279112 () Bool)

(assert (=> b!466954 (=> (not res!279112) (not e!273097))))

(assert (=> b!466954 (= res!279112 (not (contains!2528 lt!211082 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!466955 () Bool)

(assert (=> b!466955 (= e!273096 (isEmpty!570 lt!211082))))

(declare-fun b!466956 () Bool)

(assert (=> b!466956 (= e!273093 e!273096)))

(declare-fun c!56761 () Bool)

(assert (=> b!466956 (= c!56761 (bvslt #b00000000000000000000000000000000 (size!14526 _keys!1025)))))

(declare-fun b!466957 () Bool)

(assert (=> b!466957 (= e!273095 call!30286)))

(declare-fun d!75171 () Bool)

(assert (=> d!75171 e!273097))

(declare-fun res!279113 () Bool)

(assert (=> d!75171 (=> (not res!279113) (not e!273097))))

(assert (=> d!75171 (= res!279113 (not (contains!2528 lt!211082 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75171 (= lt!211082 e!273098)))

(declare-fun c!56764 () Bool)

(assert (=> d!75171 (= c!56764 (bvsge #b00000000000000000000000000000000 (size!14526 _keys!1025)))))

(assert (=> d!75171 (validMask!0 mask!1365)))

(assert (=> d!75171 (= (getCurrentListMapNoExtraKeys!1892 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211082)))

(declare-fun bm!30283 () Bool)

(assert (=> bm!30283 (= call!30286 (getCurrentListMapNoExtraKeys!1892 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!466958 () Bool)

(assert (=> b!466958 (= e!273098 e!273095)))

(declare-fun c!56762 () Bool)

(assert (=> b!466958 (= c!56762 (validKeyInArray!0 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466959 () Bool)

(assert (=> b!466959 (= e!273093 e!273092)))

(assert (=> b!466959 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14526 _keys!1025)))))

(declare-fun res!279111 () Bool)

(assert (=> b!466959 (= res!279111 (contains!2528 lt!211082 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466959 (=> (not res!279111) (not e!273092))))

(assert (= (and d!75171 c!56764) b!466950))

(assert (= (and d!75171 (not c!56764)) b!466958))

(assert (= (and b!466958 c!56762) b!466951))

(assert (= (and b!466958 (not c!56762)) b!466957))

(assert (= (or b!466951 b!466957) bm!30283))

(assert (= (and d!75171 res!279113) b!466954))

(assert (= (and b!466954 res!279112) b!466949))

(assert (= (and b!466949 res!279114) b!466953))

(assert (= (and b!466949 c!56763) b!466959))

(assert (= (and b!466949 (not c!56763)) b!466956))

(assert (= (and b!466959 res!279111) b!466948))

(assert (= (and b!466956 c!56761) b!466952))

(assert (= (and b!466956 (not c!56761)) b!466955))

(declare-fun b_lambda!10033 () Bool)

(assert (=> (not b_lambda!10033) (not b!466948)))

(assert (=> b!466948 t!14536))

(declare-fun b_and!19803 () Bool)

(assert (= b_and!19801 (and (=> t!14536 result!7391) b_and!19803)))

(declare-fun b_lambda!10035 () Bool)

(assert (=> (not b_lambda!10035) (not b!466951)))

(assert (=> b!466951 t!14536))

(declare-fun b_and!19805 () Bool)

(assert (= b_and!19803 (and (=> t!14536 result!7391) b_and!19805)))

(declare-fun m!449151 () Bool)

(assert (=> b!466951 m!449151))

(declare-fun m!449153 () Bool)

(assert (=> b!466951 m!449153))

(declare-fun m!449155 () Bool)

(assert (=> b!466951 m!449155))

(assert (=> b!466951 m!449131))

(assert (=> b!466951 m!449155))

(declare-fun m!449157 () Bool)

(assert (=> b!466951 m!449157))

(assert (=> b!466951 m!449135))

(assert (=> b!466951 m!449131))

(assert (=> b!466951 m!449137))

(assert (=> b!466951 m!449135))

(assert (=> b!466951 m!449107))

(declare-fun m!449159 () Bool)

(assert (=> b!466952 m!449159))

(assert (=> b!466948 m!449131))

(assert (=> b!466948 m!449135))

(assert (=> b!466948 m!449131))

(assert (=> b!466948 m!449137))

(assert (=> b!466948 m!449107))

(assert (=> b!466948 m!449135))

(assert (=> b!466948 m!449107))

(declare-fun m!449161 () Bool)

(assert (=> b!466948 m!449161))

(assert (=> bm!30283 m!449159))

(assert (=> b!466959 m!449107))

(assert (=> b!466959 m!449107))

(declare-fun m!449163 () Bool)

(assert (=> b!466959 m!449163))

(declare-fun m!449165 () Bool)

(assert (=> b!466954 m!449165))

(declare-fun m!449167 () Bool)

(assert (=> d!75171 m!449167))

(assert (=> d!75171 m!449071))

(declare-fun m!449169 () Bool)

(assert (=> b!466955 m!449169))

(assert (=> b!466953 m!449107))

(assert (=> b!466953 m!449107))

(assert (=> b!466953 m!449111))

(assert (=> b!466958 m!449107))

(assert (=> b!466958 m!449107))

(assert (=> b!466958 m!449111))

(assert (=> b!466852 d!75171))

(declare-fun d!75173 () Bool)

(declare-fun e!273101 () Bool)

(assert (=> d!75173 e!273101))

(declare-fun res!279120 () Bool)

(assert (=> d!75173 (=> (not res!279120) (not e!273101))))

(declare-fun lt!211095 () ListLongMap!7403)

(assert (=> d!75173 (= res!279120 (contains!2528 lt!211095 (_1!4256 (tuple2!8491 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lt!211094 () List!8580)

(assert (=> d!75173 (= lt!211095 (ListLongMap!7404 lt!211094))))

(declare-fun lt!211096 () Unit!13594)

(declare-fun lt!211093 () Unit!13594)

(assert (=> d!75173 (= lt!211096 lt!211093)))

(declare-datatypes ((Option!383 0))(
  ( (Some!382 (v!8762 V!18245)) (None!381) )
))
(declare-fun getValueByKey!377 (List!8580 (_ BitVec 64)) Option!383)

(assert (=> d!75173 (= (getValueByKey!377 lt!211094 (_1!4256 (tuple2!8491 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!382 (_2!4256 (tuple2!8491 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lemmaContainsTupThenGetReturnValue!199 (List!8580 (_ BitVec 64) V!18245) Unit!13594)

(assert (=> d!75173 (= lt!211093 (lemmaContainsTupThenGetReturnValue!199 lt!211094 (_1!4256 (tuple2!8491 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4256 (tuple2!8491 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun insertStrictlySorted!202 (List!8580 (_ BitVec 64) V!18245) List!8580)

(assert (=> d!75173 (= lt!211094 (insertStrictlySorted!202 (toList!3717 (getCurrentListMap!2165 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841)) (_1!4256 (tuple2!8491 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4256 (tuple2!8491 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(assert (=> d!75173 (= (+!1671 (getCurrentListMap!2165 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8491 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) lt!211095)))

(declare-fun b!466964 () Bool)

(declare-fun res!279119 () Bool)

(assert (=> b!466964 (=> (not res!279119) (not e!273101))))

(assert (=> b!466964 (= res!279119 (= (getValueByKey!377 (toList!3717 lt!211095) (_1!4256 (tuple2!8491 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!382 (_2!4256 (tuple2!8491 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))))

(declare-fun b!466965 () Bool)

(declare-fun contains!2529 (List!8580 tuple2!8490) Bool)

(assert (=> b!466965 (= e!273101 (contains!2529 (toList!3717 lt!211095) (tuple2!8491 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(assert (= (and d!75173 res!279120) b!466964))

(assert (= (and b!466964 res!279119) b!466965))

(declare-fun m!449171 () Bool)

(assert (=> d!75173 m!449171))

(declare-fun m!449173 () Bool)

(assert (=> d!75173 m!449173))

(declare-fun m!449175 () Bool)

(assert (=> d!75173 m!449175))

(declare-fun m!449177 () Bool)

(assert (=> d!75173 m!449177))

(declare-fun m!449179 () Bool)

(assert (=> b!466964 m!449179))

(declare-fun m!449181 () Bool)

(assert (=> b!466965 m!449181))

(assert (=> b!466849 d!75173))

(declare-fun call!30303 () ListLongMap!7403)

(declare-fun call!30306 () ListLongMap!7403)

(declare-fun call!30301 () ListLongMap!7403)

(declare-fun bm!30298 () Bool)

(declare-fun c!56778 () Bool)

(declare-fun c!56777 () Bool)

(declare-fun call!30305 () ListLongMap!7403)

(assert (=> bm!30298 (= call!30303 (+!1671 (ite c!56777 call!30305 (ite c!56778 call!30306 call!30301)) (ite (or c!56777 c!56778) (tuple2!8491 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8491 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun bm!30299 () Bool)

(declare-fun call!30304 () Bool)

(declare-fun lt!211145 () ListLongMap!7403)

(assert (=> bm!30299 (= call!30304 (contains!2528 lt!211145 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!467008 () Bool)

(declare-fun e!273130 () Unit!13594)

(declare-fun Unit!13596 () Unit!13594)

(assert (=> b!467008 (= e!273130 Unit!13596)))

(declare-fun b!467010 () Bool)

(declare-fun e!273131 () Bool)

(declare-fun e!273133 () Bool)

(assert (=> b!467010 (= e!273131 e!273133)))

(declare-fun c!56780 () Bool)

(assert (=> b!467010 (= c!56780 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!467011 () Bool)

(declare-fun res!279140 () Bool)

(assert (=> b!467011 (=> (not res!279140) (not e!273131))))

(declare-fun e!273135 () Bool)

(assert (=> b!467011 (= res!279140 e!273135)))

(declare-fun res!279145 () Bool)

(assert (=> b!467011 (=> res!279145 e!273135)))

(declare-fun e!273139 () Bool)

(assert (=> b!467011 (= res!279145 (not e!273139))))

(declare-fun res!279144 () Bool)

(assert (=> b!467011 (=> (not res!279144) (not e!273139))))

(assert (=> b!467011 (= res!279144 (bvslt #b00000000000000000000000000000000 (size!14526 _keys!1025)))))

(declare-fun b!467012 () Bool)

(declare-fun e!273136 () Bool)

(assert (=> b!467012 (= e!273136 (= (apply!323 lt!211145 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!467013 () Bool)

(declare-fun e!273137 () ListLongMap!7403)

(assert (=> b!467013 (= e!273137 call!30301)))

(declare-fun b!467014 () Bool)

(declare-fun e!273132 () Bool)

(assert (=> b!467014 (= e!273132 (= (apply!323 lt!211145 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!467015 () Bool)

(assert (=> b!467015 (= e!273133 e!273132)))

(declare-fun res!279143 () Bool)

(declare-fun call!30307 () Bool)

(assert (=> b!467015 (= res!279143 call!30307)))

(assert (=> b!467015 (=> (not res!279143) (not e!273132))))

(declare-fun b!467016 () Bool)

(declare-fun lt!211146 () Unit!13594)

(assert (=> b!467016 (= e!273130 lt!211146)))

(declare-fun lt!211142 () ListLongMap!7403)

(assert (=> b!467016 (= lt!211142 (getCurrentListMapNoExtraKeys!1892 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211141 () (_ BitVec 64))

(assert (=> b!467016 (= lt!211141 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211143 () (_ BitVec 64))

(assert (=> b!467016 (= lt!211143 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211157 () Unit!13594)

(declare-fun addStillContains!286 (ListLongMap!7403 (_ BitVec 64) V!18245 (_ BitVec 64)) Unit!13594)

(assert (=> b!467016 (= lt!211157 (addStillContains!286 lt!211142 lt!211141 zeroValue!794 lt!211143))))

(assert (=> b!467016 (contains!2528 (+!1671 lt!211142 (tuple2!8491 lt!211141 zeroValue!794)) lt!211143)))

(declare-fun lt!211149 () Unit!13594)

(assert (=> b!467016 (= lt!211149 lt!211157)))

(declare-fun lt!211156 () ListLongMap!7403)

(assert (=> b!467016 (= lt!211156 (getCurrentListMapNoExtraKeys!1892 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211152 () (_ BitVec 64))

(assert (=> b!467016 (= lt!211152 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211150 () (_ BitVec 64))

(assert (=> b!467016 (= lt!211150 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211147 () Unit!13594)

(declare-fun addApplyDifferent!286 (ListLongMap!7403 (_ BitVec 64) V!18245 (_ BitVec 64)) Unit!13594)

(assert (=> b!467016 (= lt!211147 (addApplyDifferent!286 lt!211156 lt!211152 minValueBefore!38 lt!211150))))

(assert (=> b!467016 (= (apply!323 (+!1671 lt!211156 (tuple2!8491 lt!211152 minValueBefore!38)) lt!211150) (apply!323 lt!211156 lt!211150))))

(declare-fun lt!211153 () Unit!13594)

(assert (=> b!467016 (= lt!211153 lt!211147)))

(declare-fun lt!211148 () ListLongMap!7403)

(assert (=> b!467016 (= lt!211148 (getCurrentListMapNoExtraKeys!1892 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211158 () (_ BitVec 64))

(assert (=> b!467016 (= lt!211158 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211155 () (_ BitVec 64))

(assert (=> b!467016 (= lt!211155 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211144 () Unit!13594)

(assert (=> b!467016 (= lt!211144 (addApplyDifferent!286 lt!211148 lt!211158 zeroValue!794 lt!211155))))

(assert (=> b!467016 (= (apply!323 (+!1671 lt!211148 (tuple2!8491 lt!211158 zeroValue!794)) lt!211155) (apply!323 lt!211148 lt!211155))))

(declare-fun lt!211162 () Unit!13594)

(assert (=> b!467016 (= lt!211162 lt!211144)))

(declare-fun lt!211151 () ListLongMap!7403)

(assert (=> b!467016 (= lt!211151 (getCurrentListMapNoExtraKeys!1892 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211161 () (_ BitVec 64))

(assert (=> b!467016 (= lt!211161 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211154 () (_ BitVec 64))

(assert (=> b!467016 (= lt!211154 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!467016 (= lt!211146 (addApplyDifferent!286 lt!211151 lt!211161 minValueBefore!38 lt!211154))))

(assert (=> b!467016 (= (apply!323 (+!1671 lt!211151 (tuple2!8491 lt!211161 minValueBefore!38)) lt!211154) (apply!323 lt!211151 lt!211154))))

(declare-fun b!467017 () Bool)

(declare-fun c!56779 () Bool)

(assert (=> b!467017 (= c!56779 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!273134 () ListLongMap!7403)

(assert (=> b!467017 (= e!273134 e!273137)))

(declare-fun b!467018 () Bool)

(declare-fun e!273138 () Bool)

(assert (=> b!467018 (= e!273138 (not call!30304))))

(declare-fun b!467009 () Bool)

(declare-fun e!273140 () ListLongMap!7403)

(assert (=> b!467009 (= e!273140 e!273134)))

(assert (=> b!467009 (= c!56778 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!75175 () Bool)

(assert (=> d!75175 e!273131))

(declare-fun res!279141 () Bool)

(assert (=> d!75175 (=> (not res!279141) (not e!273131))))

(assert (=> d!75175 (= res!279141 (or (bvsge #b00000000000000000000000000000000 (size!14526 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14526 _keys!1025)))))))

(declare-fun lt!211159 () ListLongMap!7403)

(assert (=> d!75175 (= lt!211145 lt!211159)))

(declare-fun lt!211160 () Unit!13594)

(assert (=> d!75175 (= lt!211160 e!273130)))

(declare-fun c!56782 () Bool)

(declare-fun e!273129 () Bool)

(assert (=> d!75175 (= c!56782 e!273129)))

(declare-fun res!279139 () Bool)

(assert (=> d!75175 (=> (not res!279139) (not e!273129))))

(assert (=> d!75175 (= res!279139 (bvslt #b00000000000000000000000000000000 (size!14526 _keys!1025)))))

(assert (=> d!75175 (= lt!211159 e!273140)))

(assert (=> d!75175 (= c!56777 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75175 (validMask!0 mask!1365)))

(assert (=> d!75175 (= (getCurrentListMap!2165 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211145)))

(declare-fun b!467019 () Bool)

(assert (=> b!467019 (= e!273129 (validKeyInArray!0 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!467020 () Bool)

(assert (=> b!467020 (= e!273138 e!273136)))

(declare-fun res!279146 () Bool)

(assert (=> b!467020 (= res!279146 call!30304)))

(assert (=> b!467020 (=> (not res!279146) (not e!273136))))

(declare-fun b!467021 () Bool)

(declare-fun res!279142 () Bool)

(assert (=> b!467021 (=> (not res!279142) (not e!273131))))

(assert (=> b!467021 (= res!279142 e!273138)))

(declare-fun c!56781 () Bool)

(assert (=> b!467021 (= c!56781 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30300 () Bool)

(assert (=> bm!30300 (= call!30307 (contains!2528 lt!211145 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30301 () Bool)

(assert (=> bm!30301 (= call!30305 (getCurrentListMapNoExtraKeys!1892 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun bm!30302 () Bool)

(assert (=> bm!30302 (= call!30306 call!30305)))

(declare-fun b!467022 () Bool)

(assert (=> b!467022 (= e!273140 (+!1671 call!30303 (tuple2!8491 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun bm!30303 () Bool)

(assert (=> bm!30303 (= call!30301 call!30306)))

(declare-fun b!467023 () Bool)

(declare-fun call!30302 () ListLongMap!7403)

(assert (=> b!467023 (= e!273134 call!30302)))

(declare-fun b!467024 () Bool)

(assert (=> b!467024 (= e!273139 (validKeyInArray!0 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!467025 () Bool)

(assert (=> b!467025 (= e!273137 call!30302)))

(declare-fun b!467026 () Bool)

(assert (=> b!467026 (= e!273133 (not call!30307))))

(declare-fun b!467027 () Bool)

(declare-fun e!273128 () Bool)

(assert (=> b!467027 (= e!273128 (= (apply!323 lt!211145 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000)) (get!6944 (select (arr!14175 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!467027 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14527 _values!833)))))

(assert (=> b!467027 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14526 _keys!1025)))))

(declare-fun b!467028 () Bool)

(assert (=> b!467028 (= e!273135 e!273128)))

(declare-fun res!279147 () Bool)

(assert (=> b!467028 (=> (not res!279147) (not e!273128))))

(assert (=> b!467028 (= res!279147 (contains!2528 lt!211145 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!467028 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14526 _keys!1025)))))

(declare-fun bm!30304 () Bool)

(assert (=> bm!30304 (= call!30302 call!30303)))

(assert (= (and d!75175 c!56777) b!467022))

(assert (= (and d!75175 (not c!56777)) b!467009))

(assert (= (and b!467009 c!56778) b!467023))

(assert (= (and b!467009 (not c!56778)) b!467017))

(assert (= (and b!467017 c!56779) b!467025))

(assert (= (and b!467017 (not c!56779)) b!467013))

(assert (= (or b!467025 b!467013) bm!30303))

(assert (= (or b!467023 bm!30303) bm!30302))

(assert (= (or b!467023 b!467025) bm!30304))

(assert (= (or b!467022 bm!30302) bm!30301))

(assert (= (or b!467022 bm!30304) bm!30298))

(assert (= (and d!75175 res!279139) b!467019))

(assert (= (and d!75175 c!56782) b!467016))

(assert (= (and d!75175 (not c!56782)) b!467008))

(assert (= (and d!75175 res!279141) b!467011))

(assert (= (and b!467011 res!279144) b!467024))

(assert (= (and b!467011 (not res!279145)) b!467028))

(assert (= (and b!467028 res!279147) b!467027))

(assert (= (and b!467011 res!279140) b!467021))

(assert (= (and b!467021 c!56781) b!467020))

(assert (= (and b!467021 (not c!56781)) b!467018))

(assert (= (and b!467020 res!279146) b!467012))

(assert (= (or b!467020 b!467018) bm!30299))

(assert (= (and b!467021 res!279142) b!467010))

(assert (= (and b!467010 c!56780) b!467015))

(assert (= (and b!467010 (not c!56780)) b!467026))

(assert (= (and b!467015 res!279143) b!467014))

(assert (= (or b!467015 b!467026) bm!30300))

(declare-fun b_lambda!10037 () Bool)

(assert (=> (not b_lambda!10037) (not b!467027)))

(assert (=> b!467027 t!14536))

(declare-fun b_and!19807 () Bool)

(assert (= b_and!19805 (and (=> t!14536 result!7391) b_and!19807)))

(declare-fun m!449183 () Bool)

(assert (=> b!467014 m!449183))

(declare-fun m!449185 () Bool)

(assert (=> b!467022 m!449185))

(assert (=> bm!30301 m!449081))

(declare-fun m!449187 () Bool)

(assert (=> bm!30300 m!449187))

(assert (=> b!467028 m!449107))

(assert (=> b!467028 m!449107))

(declare-fun m!449189 () Bool)

(assert (=> b!467028 m!449189))

(declare-fun m!449191 () Bool)

(assert (=> bm!30299 m!449191))

(declare-fun m!449193 () Bool)

(assert (=> b!467012 m!449193))

(declare-fun m!449195 () Bool)

(assert (=> b!467016 m!449195))

(declare-fun m!449197 () Bool)

(assert (=> b!467016 m!449197))

(declare-fun m!449199 () Bool)

(assert (=> b!467016 m!449199))

(declare-fun m!449201 () Bool)

(assert (=> b!467016 m!449201))

(declare-fun m!449203 () Bool)

(assert (=> b!467016 m!449203))

(assert (=> b!467016 m!449081))

(declare-fun m!449205 () Bool)

(assert (=> b!467016 m!449205))

(declare-fun m!449207 () Bool)

(assert (=> b!467016 m!449207))

(assert (=> b!467016 m!449107))

(assert (=> b!467016 m!449201))

(declare-fun m!449209 () Bool)

(assert (=> b!467016 m!449209))

(assert (=> b!467016 m!449199))

(declare-fun m!449211 () Bool)

(assert (=> b!467016 m!449211))

(assert (=> b!467016 m!449197))

(declare-fun m!449213 () Bool)

(assert (=> b!467016 m!449213))

(declare-fun m!449215 () Bool)

(assert (=> b!467016 m!449215))

(declare-fun m!449217 () Bool)

(assert (=> b!467016 m!449217))

(declare-fun m!449219 () Bool)

(assert (=> b!467016 m!449219))

(assert (=> b!467016 m!449205))

(declare-fun m!449221 () Bool)

(assert (=> b!467016 m!449221))

(declare-fun m!449223 () Bool)

(assert (=> b!467016 m!449223))

(assert (=> b!467024 m!449107))

(assert (=> b!467024 m!449107))

(assert (=> b!467024 m!449111))

(assert (=> b!467027 m!449135))

(assert (=> b!467027 m!449131))

(assert (=> b!467027 m!449137))

(assert (=> b!467027 m!449135))

(assert (=> b!467027 m!449107))

(declare-fun m!449225 () Bool)

(assert (=> b!467027 m!449225))

(assert (=> b!467027 m!449131))

(assert (=> b!467027 m!449107))

(assert (=> b!467019 m!449107))

(assert (=> b!467019 m!449107))

(assert (=> b!467019 m!449111))

(declare-fun m!449227 () Bool)

(assert (=> bm!30298 m!449227))

(assert (=> d!75175 m!449071))

(assert (=> b!466849 d!75175))

(declare-fun bm!30305 () Bool)

(declare-fun call!30308 () ListLongMap!7403)

(declare-fun c!56784 () Bool)

(declare-fun call!30313 () ListLongMap!7403)

(declare-fun c!56783 () Bool)

(declare-fun call!30310 () ListLongMap!7403)

(declare-fun call!30312 () ListLongMap!7403)

(assert (=> bm!30305 (= call!30310 (+!1671 (ite c!56783 call!30312 (ite c!56784 call!30313 call!30308)) (ite (or c!56783 c!56784) (tuple2!8491 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8491 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun bm!30306 () Bool)

(declare-fun call!30311 () Bool)

(declare-fun lt!211167 () ListLongMap!7403)

(assert (=> bm!30306 (= call!30311 (contains!2528 lt!211167 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!467029 () Bool)

(declare-fun e!273143 () Unit!13594)

(declare-fun Unit!13597 () Unit!13594)

(assert (=> b!467029 (= e!273143 Unit!13597)))

(declare-fun b!467031 () Bool)

(declare-fun e!273144 () Bool)

(declare-fun e!273146 () Bool)

(assert (=> b!467031 (= e!273144 e!273146)))

(declare-fun c!56786 () Bool)

(assert (=> b!467031 (= c!56786 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!467032 () Bool)

(declare-fun res!279149 () Bool)

(assert (=> b!467032 (=> (not res!279149) (not e!273144))))

(declare-fun e!273148 () Bool)

(assert (=> b!467032 (= res!279149 e!273148)))

(declare-fun res!279154 () Bool)

(assert (=> b!467032 (=> res!279154 e!273148)))

(declare-fun e!273152 () Bool)

(assert (=> b!467032 (= res!279154 (not e!273152))))

(declare-fun res!279153 () Bool)

(assert (=> b!467032 (=> (not res!279153) (not e!273152))))

(assert (=> b!467032 (= res!279153 (bvslt #b00000000000000000000000000000000 (size!14526 _keys!1025)))))

(declare-fun b!467033 () Bool)

(declare-fun e!273149 () Bool)

(assert (=> b!467033 (= e!273149 (= (apply!323 lt!211167 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!467034 () Bool)

(declare-fun e!273150 () ListLongMap!7403)

(assert (=> b!467034 (= e!273150 call!30308)))

(declare-fun b!467035 () Bool)

(declare-fun e!273145 () Bool)

(assert (=> b!467035 (= e!273145 (= (apply!323 lt!211167 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!467036 () Bool)

(assert (=> b!467036 (= e!273146 e!273145)))

(declare-fun res!279152 () Bool)

(declare-fun call!30314 () Bool)

(assert (=> b!467036 (= res!279152 call!30314)))

(assert (=> b!467036 (=> (not res!279152) (not e!273145))))

(declare-fun b!467037 () Bool)

(declare-fun lt!211168 () Unit!13594)

(assert (=> b!467037 (= e!273143 lt!211168)))

(declare-fun lt!211164 () ListLongMap!7403)

(assert (=> b!467037 (= lt!211164 (getCurrentListMapNoExtraKeys!1892 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211163 () (_ BitVec 64))

(assert (=> b!467037 (= lt!211163 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211165 () (_ BitVec 64))

(assert (=> b!467037 (= lt!211165 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211179 () Unit!13594)

(assert (=> b!467037 (= lt!211179 (addStillContains!286 lt!211164 lt!211163 zeroValue!794 lt!211165))))

(assert (=> b!467037 (contains!2528 (+!1671 lt!211164 (tuple2!8491 lt!211163 zeroValue!794)) lt!211165)))

(declare-fun lt!211171 () Unit!13594)

(assert (=> b!467037 (= lt!211171 lt!211179)))

(declare-fun lt!211178 () ListLongMap!7403)

(assert (=> b!467037 (= lt!211178 (getCurrentListMapNoExtraKeys!1892 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211174 () (_ BitVec 64))

(assert (=> b!467037 (= lt!211174 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211172 () (_ BitVec 64))

(assert (=> b!467037 (= lt!211172 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211169 () Unit!13594)

(assert (=> b!467037 (= lt!211169 (addApplyDifferent!286 lt!211178 lt!211174 minValueAfter!38 lt!211172))))

(assert (=> b!467037 (= (apply!323 (+!1671 lt!211178 (tuple2!8491 lt!211174 minValueAfter!38)) lt!211172) (apply!323 lt!211178 lt!211172))))

(declare-fun lt!211175 () Unit!13594)

(assert (=> b!467037 (= lt!211175 lt!211169)))

(declare-fun lt!211170 () ListLongMap!7403)

(assert (=> b!467037 (= lt!211170 (getCurrentListMapNoExtraKeys!1892 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211180 () (_ BitVec 64))

(assert (=> b!467037 (= lt!211180 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211177 () (_ BitVec 64))

(assert (=> b!467037 (= lt!211177 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211166 () Unit!13594)

(assert (=> b!467037 (= lt!211166 (addApplyDifferent!286 lt!211170 lt!211180 zeroValue!794 lt!211177))))

(assert (=> b!467037 (= (apply!323 (+!1671 lt!211170 (tuple2!8491 lt!211180 zeroValue!794)) lt!211177) (apply!323 lt!211170 lt!211177))))

(declare-fun lt!211184 () Unit!13594)

(assert (=> b!467037 (= lt!211184 lt!211166)))

(declare-fun lt!211173 () ListLongMap!7403)

(assert (=> b!467037 (= lt!211173 (getCurrentListMapNoExtraKeys!1892 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211183 () (_ BitVec 64))

(assert (=> b!467037 (= lt!211183 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211176 () (_ BitVec 64))

(assert (=> b!467037 (= lt!211176 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!467037 (= lt!211168 (addApplyDifferent!286 lt!211173 lt!211183 minValueAfter!38 lt!211176))))

(assert (=> b!467037 (= (apply!323 (+!1671 lt!211173 (tuple2!8491 lt!211183 minValueAfter!38)) lt!211176) (apply!323 lt!211173 lt!211176))))

(declare-fun b!467038 () Bool)

(declare-fun c!56785 () Bool)

(assert (=> b!467038 (= c!56785 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!273147 () ListLongMap!7403)

(assert (=> b!467038 (= e!273147 e!273150)))

(declare-fun b!467039 () Bool)

(declare-fun e!273151 () Bool)

(assert (=> b!467039 (= e!273151 (not call!30311))))

(declare-fun b!467030 () Bool)

(declare-fun e!273153 () ListLongMap!7403)

(assert (=> b!467030 (= e!273153 e!273147)))

(assert (=> b!467030 (= c!56784 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!75177 () Bool)

(assert (=> d!75177 e!273144))

(declare-fun res!279150 () Bool)

(assert (=> d!75177 (=> (not res!279150) (not e!273144))))

(assert (=> d!75177 (= res!279150 (or (bvsge #b00000000000000000000000000000000 (size!14526 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14526 _keys!1025)))))))

(declare-fun lt!211181 () ListLongMap!7403)

(assert (=> d!75177 (= lt!211167 lt!211181)))

(declare-fun lt!211182 () Unit!13594)

(assert (=> d!75177 (= lt!211182 e!273143)))

(declare-fun c!56788 () Bool)

(declare-fun e!273142 () Bool)

(assert (=> d!75177 (= c!56788 e!273142)))

(declare-fun res!279148 () Bool)

(assert (=> d!75177 (=> (not res!279148) (not e!273142))))

(assert (=> d!75177 (= res!279148 (bvslt #b00000000000000000000000000000000 (size!14526 _keys!1025)))))

(assert (=> d!75177 (= lt!211181 e!273153)))

(assert (=> d!75177 (= c!56783 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75177 (validMask!0 mask!1365)))

(assert (=> d!75177 (= (getCurrentListMap!2165 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211167)))

(declare-fun b!467040 () Bool)

(assert (=> b!467040 (= e!273142 (validKeyInArray!0 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!467041 () Bool)

(assert (=> b!467041 (= e!273151 e!273149)))

(declare-fun res!279155 () Bool)

(assert (=> b!467041 (= res!279155 call!30311)))

(assert (=> b!467041 (=> (not res!279155) (not e!273149))))

(declare-fun b!467042 () Bool)

(declare-fun res!279151 () Bool)

(assert (=> b!467042 (=> (not res!279151) (not e!273144))))

(assert (=> b!467042 (= res!279151 e!273151)))

(declare-fun c!56787 () Bool)

(assert (=> b!467042 (= c!56787 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30307 () Bool)

(assert (=> bm!30307 (= call!30314 (contains!2528 lt!211167 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30308 () Bool)

(assert (=> bm!30308 (= call!30312 (getCurrentListMapNoExtraKeys!1892 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun bm!30309 () Bool)

(assert (=> bm!30309 (= call!30313 call!30312)))

(declare-fun b!467043 () Bool)

(assert (=> b!467043 (= e!273153 (+!1671 call!30310 (tuple2!8491 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun bm!30310 () Bool)

(assert (=> bm!30310 (= call!30308 call!30313)))

(declare-fun b!467044 () Bool)

(declare-fun call!30309 () ListLongMap!7403)

(assert (=> b!467044 (= e!273147 call!30309)))

(declare-fun b!467045 () Bool)

(assert (=> b!467045 (= e!273152 (validKeyInArray!0 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!467046 () Bool)

(assert (=> b!467046 (= e!273150 call!30309)))

(declare-fun b!467047 () Bool)

(assert (=> b!467047 (= e!273146 (not call!30314))))

(declare-fun e!273141 () Bool)

(declare-fun b!467048 () Bool)

(assert (=> b!467048 (= e!273141 (= (apply!323 lt!211167 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000)) (get!6944 (select (arr!14175 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!467048 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14527 _values!833)))))

(assert (=> b!467048 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14526 _keys!1025)))))

(declare-fun b!467049 () Bool)

(assert (=> b!467049 (= e!273148 e!273141)))

(declare-fun res!279156 () Bool)

(assert (=> b!467049 (=> (not res!279156) (not e!273141))))

(assert (=> b!467049 (= res!279156 (contains!2528 lt!211167 (select (arr!14174 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!467049 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14526 _keys!1025)))))

(declare-fun bm!30311 () Bool)

(assert (=> bm!30311 (= call!30309 call!30310)))

(assert (= (and d!75177 c!56783) b!467043))

(assert (= (and d!75177 (not c!56783)) b!467030))

(assert (= (and b!467030 c!56784) b!467044))

(assert (= (and b!467030 (not c!56784)) b!467038))

(assert (= (and b!467038 c!56785) b!467046))

(assert (= (and b!467038 (not c!56785)) b!467034))

(assert (= (or b!467046 b!467034) bm!30310))

(assert (= (or b!467044 bm!30310) bm!30309))

(assert (= (or b!467044 b!467046) bm!30311))

(assert (= (or b!467043 bm!30309) bm!30308))

(assert (= (or b!467043 bm!30311) bm!30305))

(assert (= (and d!75177 res!279148) b!467040))

(assert (= (and d!75177 c!56788) b!467037))

(assert (= (and d!75177 (not c!56788)) b!467029))

(assert (= (and d!75177 res!279150) b!467032))

(assert (= (and b!467032 res!279153) b!467045))

(assert (= (and b!467032 (not res!279154)) b!467049))

(assert (= (and b!467049 res!279156) b!467048))

(assert (= (and b!467032 res!279149) b!467042))

(assert (= (and b!467042 c!56787) b!467041))

(assert (= (and b!467042 (not c!56787)) b!467039))

(assert (= (and b!467041 res!279155) b!467033))

(assert (= (or b!467041 b!467039) bm!30306))

(assert (= (and b!467042 res!279151) b!467031))

(assert (= (and b!467031 c!56786) b!467036))

(assert (= (and b!467031 (not c!56786)) b!467047))

(assert (= (and b!467036 res!279152) b!467035))

(assert (= (or b!467036 b!467047) bm!30307))

(declare-fun b_lambda!10039 () Bool)

(assert (=> (not b_lambda!10039) (not b!467048)))

(assert (=> b!467048 t!14536))

(declare-fun b_and!19809 () Bool)

(assert (= b_and!19807 (and (=> t!14536 result!7391) b_and!19809)))

(declare-fun m!449229 () Bool)

(assert (=> b!467035 m!449229))

(declare-fun m!449231 () Bool)

(assert (=> b!467043 m!449231))

(assert (=> bm!30308 m!449079))

(declare-fun m!449233 () Bool)

(assert (=> bm!30307 m!449233))

(assert (=> b!467049 m!449107))

(assert (=> b!467049 m!449107))

(declare-fun m!449235 () Bool)

(assert (=> b!467049 m!449235))

(declare-fun m!449237 () Bool)

(assert (=> bm!30306 m!449237))

(declare-fun m!449239 () Bool)

(assert (=> b!467033 m!449239))

(declare-fun m!449241 () Bool)

(assert (=> b!467037 m!449241))

(declare-fun m!449243 () Bool)

(assert (=> b!467037 m!449243))

(declare-fun m!449245 () Bool)

(assert (=> b!467037 m!449245))

(declare-fun m!449247 () Bool)

(assert (=> b!467037 m!449247))

(declare-fun m!449249 () Bool)

(assert (=> b!467037 m!449249))

(assert (=> b!467037 m!449079))

(declare-fun m!449251 () Bool)

(assert (=> b!467037 m!449251))

(declare-fun m!449253 () Bool)

(assert (=> b!467037 m!449253))

(assert (=> b!467037 m!449107))

(assert (=> b!467037 m!449247))

(declare-fun m!449255 () Bool)

(assert (=> b!467037 m!449255))

(assert (=> b!467037 m!449245))

(declare-fun m!449257 () Bool)

(assert (=> b!467037 m!449257))

(assert (=> b!467037 m!449243))

(declare-fun m!449259 () Bool)

(assert (=> b!467037 m!449259))

(declare-fun m!449261 () Bool)

(assert (=> b!467037 m!449261))

(declare-fun m!449263 () Bool)

(assert (=> b!467037 m!449263))

(declare-fun m!449265 () Bool)

(assert (=> b!467037 m!449265))

(assert (=> b!467037 m!449251))

(declare-fun m!449267 () Bool)

(assert (=> b!467037 m!449267))

(declare-fun m!449269 () Bool)

(assert (=> b!467037 m!449269))

(assert (=> b!467045 m!449107))

(assert (=> b!467045 m!449107))

(assert (=> b!467045 m!449111))

(assert (=> b!467048 m!449135))

(assert (=> b!467048 m!449131))

(assert (=> b!467048 m!449137))

(assert (=> b!467048 m!449135))

(assert (=> b!467048 m!449107))

(declare-fun m!449271 () Bool)

(assert (=> b!467048 m!449271))

(assert (=> b!467048 m!449131))

(assert (=> b!467048 m!449107))

(assert (=> b!467040 m!449107))

(assert (=> b!467040 m!449107))

(assert (=> b!467040 m!449111))

(declare-fun m!449273 () Bool)

(assert (=> bm!30305 m!449273))

(assert (=> d!75177 m!449071))

(assert (=> b!466849 d!75177))

(declare-fun d!75179 () Bool)

(assert (=> d!75179 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41806 d!75179))

(declare-fun d!75181 () Bool)

(assert (=> d!75181 (= (array_inv!10234 _keys!1025) (bvsge (size!14526 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41806 d!75181))

(declare-fun d!75183 () Bool)

(assert (=> d!75183 (= (array_inv!10235 _values!833) (bvsge (size!14527 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41806 d!75183))

(declare-fun mapIsEmpty!20974 () Bool)

(declare-fun mapRes!20974 () Bool)

(assert (=> mapIsEmpty!20974 mapRes!20974))

(declare-fun b!467057 () Bool)

(declare-fun e!273158 () Bool)

(assert (=> b!467057 (= e!273158 tp_is_empty!12855)))

(declare-fun mapNonEmpty!20974 () Bool)

(declare-fun tp!40297 () Bool)

(declare-fun e!273159 () Bool)

(assert (=> mapNonEmpty!20974 (= mapRes!20974 (and tp!40297 e!273159))))

(declare-fun mapValue!20974 () ValueCell!6084)

(declare-fun mapRest!20974 () (Array (_ BitVec 32) ValueCell!6084))

(declare-fun mapKey!20974 () (_ BitVec 32))

(assert (=> mapNonEmpty!20974 (= mapRest!20968 (store mapRest!20974 mapKey!20974 mapValue!20974))))

(declare-fun b!467056 () Bool)

(assert (=> b!467056 (= e!273159 tp_is_empty!12855)))

(declare-fun condMapEmpty!20974 () Bool)

(declare-fun mapDefault!20974 () ValueCell!6084)

(assert (=> mapNonEmpty!20968 (= condMapEmpty!20974 (= mapRest!20968 ((as const (Array (_ BitVec 32) ValueCell!6084)) mapDefault!20974)))))

(assert (=> mapNonEmpty!20968 (= tp!40288 (and e!273158 mapRes!20974))))

(assert (= (and mapNonEmpty!20968 condMapEmpty!20974) mapIsEmpty!20974))

(assert (= (and mapNonEmpty!20968 (not condMapEmpty!20974)) mapNonEmpty!20974))

(assert (= (and mapNonEmpty!20974 ((_ is ValueCellFull!6084) mapValue!20974)) b!467056))

(assert (= (and mapNonEmpty!20968 ((_ is ValueCellFull!6084) mapDefault!20974)) b!467057))

(declare-fun m!449275 () Bool)

(assert (=> mapNonEmpty!20974 m!449275))

(declare-fun b_lambda!10041 () Bool)

(assert (= b_lambda!10029 (or (and start!41806 b_free!11427) b_lambda!10041)))

(declare-fun b_lambda!10043 () Bool)

(assert (= b_lambda!10039 (or (and start!41806 b_free!11427) b_lambda!10043)))

(declare-fun b_lambda!10045 () Bool)

(assert (= b_lambda!10037 (or (and start!41806 b_free!11427) b_lambda!10045)))

(declare-fun b_lambda!10047 () Bool)

(assert (= b_lambda!10031 (or (and start!41806 b_free!11427) b_lambda!10047)))

(declare-fun b_lambda!10049 () Bool)

(assert (= b_lambda!10035 (or (and start!41806 b_free!11427) b_lambda!10049)))

(declare-fun b_lambda!10051 () Bool)

(assert (= b_lambda!10033 (or (and start!41806 b_free!11427) b_lambda!10051)))

(check-sat (not b_next!11427) (not b!466955) (not b!467033) (not b!467024) (not d!75173) (not bm!30283) (not bm!30276) (not bm!30300) (not b!466894) (not b!467045) (not bm!30301) (not b!466951) (not bm!30279) (not b!467049) b_and!19809 (not bm!30307) (not b!466965) (not b!466944) (not bm!30306) (not b!466952) (not b!466938) (not b!466939) (not b!466941) (not b!466953) (not b!467035) (not b!466893) (not b_lambda!10041) (not b!467040) (not b!466958) (not b_lambda!10051) (not b!466937) (not b_lambda!10047) (not d!75167) (not b!466896) (not b_lambda!10043) (not b!467037) (not bm!30282) (not b!466945) (not d!75177) (not b!466959) (not b!466906) (not b!467028) (not b!467043) (not b!466948) (not d!75171) (not b!466934) (not bm!30298) (not bm!30305) tp_is_empty!12855 (not bm!30308) (not b!466964) (not b!466908) (not mapNonEmpty!20974) (not bm!30299) (not b_lambda!10045) (not b!467012) (not b!467022) (not b!467048) (not b!466940) (not b_lambda!10049) (not b!466954) (not d!75175) (not d!75169) (not b!467014) (not b!467019) (not b!467027) (not b!467016))
(check-sat b_and!19809 (not b_next!11427))
