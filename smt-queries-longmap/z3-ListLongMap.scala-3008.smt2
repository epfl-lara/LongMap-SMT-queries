; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42352 () Bool)

(assert start!42352)

(declare-fun b_free!11857 () Bool)

(declare-fun b_next!11857 () Bool)

(assert (=> start!42352 (= b_free!11857 (not b_next!11857))))

(declare-fun tp!41601 () Bool)

(declare-fun b_and!20313 () Bool)

(assert (=> start!42352 (= tp!41601 b_and!20313)))

(declare-fun b!472647 () Bool)

(declare-fun e!277182 () Bool)

(declare-fun tp_is_empty!13285 () Bool)

(assert (=> b!472647 (= e!277182 tp_is_empty!13285)))

(declare-fun b!472648 () Bool)

(declare-fun e!277186 () Bool)

(declare-datatypes ((array!30314 0))(
  ( (array!30315 (arr!14577 (Array (_ BitVec 32) (_ BitVec 64))) (size!14929 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30314)

(assert (=> b!472648 (= e!277186 (bvsle #b00000000000000000000000000000000 (size!14929 _keys!1025)))))

(declare-datatypes ((V!18819 0))(
  ( (V!18820 (val!6687 Int)) )
))
(declare-fun minValueBefore!38 () V!18819)

(declare-fun zeroValue!794 () V!18819)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((tuple2!8734 0))(
  ( (tuple2!8735 (_1!4378 (_ BitVec 64)) (_2!4378 V!18819)) )
))
(declare-datatypes ((List!8798 0))(
  ( (Nil!8795) (Cons!8794 (h!9650 tuple2!8734) (t!14758 List!8798)) )
))
(declare-datatypes ((ListLongMap!7649 0))(
  ( (ListLongMap!7650 (toList!3840 List!8798)) )
))
(declare-fun lt!214492 () ListLongMap!7649)

(declare-datatypes ((ValueCell!6299 0))(
  ( (ValueCellFull!6299 (v!8979 V!18819)) (EmptyCell!6299) )
))
(declare-datatypes ((array!30316 0))(
  ( (array!30317 (arr!14578 (Array (_ BitVec 32) ValueCell!6299)) (size!14930 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30316)

(declare-fun getCurrentListMap!2206 (array!30314 array!30316 (_ BitVec 32) (_ BitVec 32) V!18819 V!18819 (_ BitVec 32) Int) ListLongMap!7649)

(assert (=> b!472648 (= lt!214492 (getCurrentListMap!2206 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472649 () Bool)

(declare-fun e!277181 () Bool)

(assert (=> b!472649 (= e!277181 tp_is_empty!13285)))

(declare-fun mapIsEmpty!21637 () Bool)

(declare-fun mapRes!21637 () Bool)

(assert (=> mapIsEmpty!21637 mapRes!21637))

(declare-fun mapNonEmpty!21637 () Bool)

(declare-fun tp!41602 () Bool)

(assert (=> mapNonEmpty!21637 (= mapRes!21637 (and tp!41602 e!277182))))

(declare-fun mapKey!21637 () (_ BitVec 32))

(declare-fun mapValue!21637 () ValueCell!6299)

(declare-fun mapRest!21637 () (Array (_ BitVec 32) ValueCell!6299))

(assert (=> mapNonEmpty!21637 (= (arr!14578 _values!833) (store mapRest!21637 mapKey!21637 mapValue!21637))))

(declare-fun res!282368 () Bool)

(declare-fun e!277184 () Bool)

(assert (=> start!42352 (=> (not res!282368) (not e!277184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42352 (= res!282368 (validMask!0 mask!1365))))

(assert (=> start!42352 e!277184))

(assert (=> start!42352 tp_is_empty!13285))

(assert (=> start!42352 tp!41601))

(assert (=> start!42352 true))

(declare-fun array_inv!10600 (array!30314) Bool)

(assert (=> start!42352 (array_inv!10600 _keys!1025)))

(declare-fun e!277185 () Bool)

(declare-fun array_inv!10601 (array!30316) Bool)

(assert (=> start!42352 (and (array_inv!10601 _values!833) e!277185)))

(declare-fun b!472650 () Bool)

(assert (=> b!472650 (= e!277185 (and e!277181 mapRes!21637))))

(declare-fun condMapEmpty!21637 () Bool)

(declare-fun mapDefault!21637 () ValueCell!6299)

(assert (=> b!472650 (= condMapEmpty!21637 (= (arr!14578 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6299)) mapDefault!21637)))))

(declare-fun b!472651 () Bool)

(assert (=> b!472651 (= e!277184 (not e!277186))))

(declare-fun res!282367 () Bool)

(assert (=> b!472651 (=> res!282367 e!277186)))

(assert (=> b!472651 (= res!282367 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214491 () ListLongMap!7649)

(declare-fun lt!214494 () ListLongMap!7649)

(assert (=> b!472651 (= lt!214491 lt!214494)))

(declare-datatypes ((Unit!13887 0))(
  ( (Unit!13888) )
))
(declare-fun lt!214493 () Unit!13887)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18819)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!212 (array!30314 array!30316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18819 V!18819 V!18819 V!18819 (_ BitVec 32) Int) Unit!13887)

(assert (=> b!472651 (= lt!214493 (lemmaNoChangeToArrayThenSameMapNoExtras!212 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2052 (array!30314 array!30316 (_ BitVec 32) (_ BitVec 32) V!18819 V!18819 (_ BitVec 32) Int) ListLongMap!7649)

(assert (=> b!472651 (= lt!214494 (getCurrentListMapNoExtraKeys!2052 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472651 (= lt!214491 (getCurrentListMapNoExtraKeys!2052 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472652 () Bool)

(declare-fun res!282371 () Bool)

(assert (=> b!472652 (=> (not res!282371) (not e!277184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30314 (_ BitVec 32)) Bool)

(assert (=> b!472652 (= res!282371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472653 () Bool)

(declare-fun res!282369 () Bool)

(assert (=> b!472653 (=> (not res!282369) (not e!277184))))

(declare-datatypes ((List!8799 0))(
  ( (Nil!8796) (Cons!8795 (h!9651 (_ BitVec 64)) (t!14759 List!8799)) )
))
(declare-fun arrayNoDuplicates!0 (array!30314 (_ BitVec 32) List!8799) Bool)

(assert (=> b!472653 (= res!282369 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8796))))

(declare-fun b!472654 () Bool)

(declare-fun res!282370 () Bool)

(assert (=> b!472654 (=> (not res!282370) (not e!277184))))

(assert (=> b!472654 (= res!282370 (and (= (size!14930 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14929 _keys!1025) (size!14930 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42352 res!282368) b!472654))

(assert (= (and b!472654 res!282370) b!472652))

(assert (= (and b!472652 res!282371) b!472653))

(assert (= (and b!472653 res!282369) b!472651))

(assert (= (and b!472651 (not res!282367)) b!472648))

(assert (= (and b!472650 condMapEmpty!21637) mapIsEmpty!21637))

(assert (= (and b!472650 (not condMapEmpty!21637)) mapNonEmpty!21637))

(get-info :version)

(assert (= (and mapNonEmpty!21637 ((_ is ValueCellFull!6299) mapValue!21637)) b!472647))

(assert (= (and b!472650 ((_ is ValueCellFull!6299) mapDefault!21637)) b!472649))

(assert (= start!42352 b!472650))

(declare-fun m!454819 () Bool)

(assert (=> b!472651 m!454819))

(declare-fun m!454821 () Bool)

(assert (=> b!472651 m!454821))

(declare-fun m!454823 () Bool)

(assert (=> b!472651 m!454823))

(declare-fun m!454825 () Bool)

(assert (=> b!472652 m!454825))

(declare-fun m!454827 () Bool)

(assert (=> start!42352 m!454827))

(declare-fun m!454829 () Bool)

(assert (=> start!42352 m!454829))

(declare-fun m!454831 () Bool)

(assert (=> start!42352 m!454831))

(declare-fun m!454833 () Bool)

(assert (=> b!472653 m!454833))

(declare-fun m!454835 () Bool)

(assert (=> b!472648 m!454835))

(declare-fun m!454837 () Bool)

(assert (=> mapNonEmpty!21637 m!454837))

(check-sat b_and!20313 (not b!472653) (not mapNonEmpty!21637) tp_is_empty!13285 (not b!472652) (not b_next!11857) (not b!472648) (not start!42352) (not b!472651))
(check-sat b_and!20313 (not b_next!11857))
(get-model)

(declare-fun d!75495 () Bool)

(assert (=> d!75495 (= (getCurrentListMapNoExtraKeys!2052 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2052 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214521 () Unit!13887)

(declare-fun choose!1357 (array!30314 array!30316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18819 V!18819 V!18819 V!18819 (_ BitVec 32) Int) Unit!13887)

(assert (=> d!75495 (= lt!214521 (choose!1357 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75495 (validMask!0 mask!1365)))

(assert (=> d!75495 (= (lemmaNoChangeToArrayThenSameMapNoExtras!212 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!214521)))

(declare-fun bs!15020 () Bool)

(assert (= bs!15020 d!75495))

(assert (=> bs!15020 m!454823))

(assert (=> bs!15020 m!454821))

(declare-fun m!454879 () Bool)

(assert (=> bs!15020 m!454879))

(assert (=> bs!15020 m!454827))

(assert (=> b!472651 d!75495))

(declare-fun b!472727 () Bool)

(declare-fun e!277241 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!472727 (= e!277241 (validKeyInArray!0 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472727 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!75497 () Bool)

(declare-fun e!277238 () Bool)

(assert (=> d!75497 e!277238))

(declare-fun res!282411 () Bool)

(assert (=> d!75497 (=> (not res!282411) (not e!277238))))

(declare-fun lt!214542 () ListLongMap!7649)

(declare-fun contains!2527 (ListLongMap!7649 (_ BitVec 64)) Bool)

(assert (=> d!75497 (= res!282411 (not (contains!2527 lt!214542 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!277243 () ListLongMap!7649)

(assert (=> d!75497 (= lt!214542 e!277243)))

(declare-fun c!56993 () Bool)

(assert (=> d!75497 (= c!56993 (bvsge #b00000000000000000000000000000000 (size!14929 _keys!1025)))))

(assert (=> d!75497 (validMask!0 mask!1365)))

(assert (=> d!75497 (= (getCurrentListMapNoExtraKeys!2052 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!214542)))

(declare-fun b!472728 () Bool)

(declare-fun e!277242 () ListLongMap!7649)

(declare-fun call!30450 () ListLongMap!7649)

(assert (=> b!472728 (= e!277242 call!30450)))

(declare-fun b!472729 () Bool)

(declare-fun e!277240 () Bool)

(declare-fun e!277239 () Bool)

(assert (=> b!472729 (= e!277240 e!277239)))

(declare-fun c!56990 () Bool)

(assert (=> b!472729 (= c!56990 (bvslt #b00000000000000000000000000000000 (size!14929 _keys!1025)))))

(declare-fun b!472730 () Bool)

(assert (=> b!472730 (= e!277238 e!277240)))

(declare-fun c!56991 () Bool)

(assert (=> b!472730 (= c!56991 e!277241)))

(declare-fun res!282410 () Bool)

(assert (=> b!472730 (=> (not res!282410) (not e!277241))))

(assert (=> b!472730 (= res!282410 (bvslt #b00000000000000000000000000000000 (size!14929 _keys!1025)))))

(declare-fun b!472731 () Bool)

(assert (=> b!472731 (= e!277243 (ListLongMap!7650 Nil!8795))))

(declare-fun b!472732 () Bool)

(declare-fun isEmpty!584 (ListLongMap!7649) Bool)

(assert (=> b!472732 (= e!277239 (isEmpty!584 lt!214542))))

(declare-fun b!472733 () Bool)

(assert (=> b!472733 (= e!277243 e!277242)))

(declare-fun c!56992 () Bool)

(assert (=> b!472733 (= c!56992 (validKeyInArray!0 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472734 () Bool)

(declare-fun e!277237 () Bool)

(assert (=> b!472734 (= e!277240 e!277237)))

(assert (=> b!472734 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14929 _keys!1025)))))

(declare-fun res!282413 () Bool)

(assert (=> b!472734 (= res!282413 (contains!2527 lt!214542 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472734 (=> (not res!282413) (not e!277237))))

(declare-fun b!472735 () Bool)

(assert (=> b!472735 (= e!277239 (= lt!214542 (getCurrentListMapNoExtraKeys!2052 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!472736 () Bool)

(assert (=> b!472736 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14929 _keys!1025)))))

(assert (=> b!472736 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14930 _values!833)))))

(declare-fun apply!331 (ListLongMap!7649 (_ BitVec 64)) V!18819)

(declare-fun get!7099 (ValueCell!6299 V!18819) V!18819)

(declare-fun dynLambda!921 (Int (_ BitVec 64)) V!18819)

(assert (=> b!472736 (= e!277237 (= (apply!331 lt!214542 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)) (get!7099 (select (arr!14578 _values!833) #b00000000000000000000000000000000) (dynLambda!921 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!472737 () Bool)

(declare-fun res!282412 () Bool)

(assert (=> b!472737 (=> (not res!282412) (not e!277238))))

(assert (=> b!472737 (= res!282412 (not (contains!2527 lt!214542 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!472738 () Bool)

(declare-fun lt!214540 () Unit!13887)

(declare-fun lt!214538 () Unit!13887)

(assert (=> b!472738 (= lt!214540 lt!214538)))

(declare-fun lt!214539 () ListLongMap!7649)

(declare-fun lt!214536 () (_ BitVec 64))

(declare-fun lt!214537 () (_ BitVec 64))

(declare-fun lt!214541 () V!18819)

(declare-fun +!1728 (ListLongMap!7649 tuple2!8734) ListLongMap!7649)

(assert (=> b!472738 (not (contains!2527 (+!1728 lt!214539 (tuple2!8735 lt!214536 lt!214541)) lt!214537))))

(declare-fun addStillNotContains!166 (ListLongMap!7649 (_ BitVec 64) V!18819 (_ BitVec 64)) Unit!13887)

(assert (=> b!472738 (= lt!214538 (addStillNotContains!166 lt!214539 lt!214536 lt!214541 lt!214537))))

(assert (=> b!472738 (= lt!214537 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!472738 (= lt!214541 (get!7099 (select (arr!14578 _values!833) #b00000000000000000000000000000000) (dynLambda!921 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!472738 (= lt!214536 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!472738 (= lt!214539 call!30450)))

(assert (=> b!472738 (= e!277242 (+!1728 call!30450 (tuple2!8735 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000) (get!7099 (select (arr!14578 _values!833) #b00000000000000000000000000000000) (dynLambda!921 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!30447 () Bool)

(assert (=> bm!30447 (= call!30450 (getCurrentListMapNoExtraKeys!2052 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(assert (= (and d!75497 c!56993) b!472731))

(assert (= (and d!75497 (not c!56993)) b!472733))

(assert (= (and b!472733 c!56992) b!472738))

(assert (= (and b!472733 (not c!56992)) b!472728))

(assert (= (or b!472738 b!472728) bm!30447))

(assert (= (and d!75497 res!282411) b!472737))

(assert (= (and b!472737 res!282412) b!472730))

(assert (= (and b!472730 res!282410) b!472727))

(assert (= (and b!472730 c!56991) b!472734))

(assert (= (and b!472730 (not c!56991)) b!472729))

(assert (= (and b!472734 res!282413) b!472736))

(assert (= (and b!472729 c!56990) b!472735))

(assert (= (and b!472729 (not c!56990)) b!472732))

(declare-fun b_lambda!10199 () Bool)

(assert (=> (not b_lambda!10199) (not b!472736)))

(declare-fun t!14764 () Bool)

(declare-fun tb!3919 () Bool)

(assert (=> (and start!42352 (= defaultEntry!841 defaultEntry!841) t!14764) tb!3919))

(declare-fun result!7431 () Bool)

(assert (=> tb!3919 (= result!7431 tp_is_empty!13285)))

(assert (=> b!472736 t!14764))

(declare-fun b_and!20319 () Bool)

(assert (= b_and!20313 (and (=> t!14764 result!7431) b_and!20319)))

(declare-fun b_lambda!10201 () Bool)

(assert (=> (not b_lambda!10201) (not b!472738)))

(assert (=> b!472738 t!14764))

(declare-fun b_and!20321 () Bool)

(assert (= b_and!20319 (and (=> t!14764 result!7431) b_and!20321)))

(declare-fun m!454881 () Bool)

(assert (=> b!472737 m!454881))

(declare-fun m!454883 () Bool)

(assert (=> b!472732 m!454883))

(declare-fun m!454885 () Bool)

(assert (=> b!472727 m!454885))

(assert (=> b!472727 m!454885))

(declare-fun m!454887 () Bool)

(assert (=> b!472727 m!454887))

(assert (=> b!472733 m!454885))

(assert (=> b!472733 m!454885))

(assert (=> b!472733 m!454887))

(declare-fun m!454889 () Bool)

(assert (=> d!75497 m!454889))

(assert (=> d!75497 m!454827))

(declare-fun m!454891 () Bool)

(assert (=> bm!30447 m!454891))

(assert (=> b!472735 m!454891))

(assert (=> b!472734 m!454885))

(assert (=> b!472734 m!454885))

(declare-fun m!454893 () Bool)

(assert (=> b!472734 m!454893))

(declare-fun m!454895 () Bool)

(assert (=> b!472738 m!454895))

(declare-fun m!454897 () Bool)

(assert (=> b!472738 m!454897))

(declare-fun m!454899 () Bool)

(assert (=> b!472738 m!454899))

(declare-fun m!454901 () Bool)

(assert (=> b!472738 m!454901))

(assert (=> b!472738 m!454899))

(assert (=> b!472738 m!454895))

(declare-fun m!454903 () Bool)

(assert (=> b!472738 m!454903))

(assert (=> b!472738 m!454885))

(declare-fun m!454905 () Bool)

(assert (=> b!472738 m!454905))

(declare-fun m!454907 () Bool)

(assert (=> b!472738 m!454907))

(assert (=> b!472738 m!454897))

(assert (=> b!472736 m!454897))

(assert (=> b!472736 m!454899))

(assert (=> b!472736 m!454901))

(assert (=> b!472736 m!454899))

(assert (=> b!472736 m!454885))

(assert (=> b!472736 m!454897))

(assert (=> b!472736 m!454885))

(declare-fun m!454909 () Bool)

(assert (=> b!472736 m!454909))

(assert (=> b!472651 d!75497))

(declare-fun b!472741 () Bool)

(declare-fun e!277248 () Bool)

(assert (=> b!472741 (= e!277248 (validKeyInArray!0 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472741 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!75499 () Bool)

(declare-fun e!277245 () Bool)

(assert (=> d!75499 e!277245))

(declare-fun res!282415 () Bool)

(assert (=> d!75499 (=> (not res!282415) (not e!277245))))

(declare-fun lt!214549 () ListLongMap!7649)

(assert (=> d!75499 (= res!282415 (not (contains!2527 lt!214549 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!277250 () ListLongMap!7649)

(assert (=> d!75499 (= lt!214549 e!277250)))

(declare-fun c!56997 () Bool)

(assert (=> d!75499 (= c!56997 (bvsge #b00000000000000000000000000000000 (size!14929 _keys!1025)))))

(assert (=> d!75499 (validMask!0 mask!1365)))

(assert (=> d!75499 (= (getCurrentListMapNoExtraKeys!2052 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!214549)))

(declare-fun b!472742 () Bool)

(declare-fun e!277249 () ListLongMap!7649)

(declare-fun call!30451 () ListLongMap!7649)

(assert (=> b!472742 (= e!277249 call!30451)))

(declare-fun b!472743 () Bool)

(declare-fun e!277247 () Bool)

(declare-fun e!277246 () Bool)

(assert (=> b!472743 (= e!277247 e!277246)))

(declare-fun c!56994 () Bool)

(assert (=> b!472743 (= c!56994 (bvslt #b00000000000000000000000000000000 (size!14929 _keys!1025)))))

(declare-fun b!472744 () Bool)

(assert (=> b!472744 (= e!277245 e!277247)))

(declare-fun c!56995 () Bool)

(assert (=> b!472744 (= c!56995 e!277248)))

(declare-fun res!282414 () Bool)

(assert (=> b!472744 (=> (not res!282414) (not e!277248))))

(assert (=> b!472744 (= res!282414 (bvslt #b00000000000000000000000000000000 (size!14929 _keys!1025)))))

(declare-fun b!472745 () Bool)

(assert (=> b!472745 (= e!277250 (ListLongMap!7650 Nil!8795))))

(declare-fun b!472746 () Bool)

(assert (=> b!472746 (= e!277246 (isEmpty!584 lt!214549))))

(declare-fun b!472747 () Bool)

(assert (=> b!472747 (= e!277250 e!277249)))

(declare-fun c!56996 () Bool)

(assert (=> b!472747 (= c!56996 (validKeyInArray!0 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472748 () Bool)

(declare-fun e!277244 () Bool)

(assert (=> b!472748 (= e!277247 e!277244)))

(assert (=> b!472748 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14929 _keys!1025)))))

(declare-fun res!282417 () Bool)

(assert (=> b!472748 (= res!282417 (contains!2527 lt!214549 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472748 (=> (not res!282417) (not e!277244))))

(declare-fun b!472749 () Bool)

(assert (=> b!472749 (= e!277246 (= lt!214549 (getCurrentListMapNoExtraKeys!2052 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!472750 () Bool)

(assert (=> b!472750 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14929 _keys!1025)))))

(assert (=> b!472750 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14930 _values!833)))))

(assert (=> b!472750 (= e!277244 (= (apply!331 lt!214549 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)) (get!7099 (select (arr!14578 _values!833) #b00000000000000000000000000000000) (dynLambda!921 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!472751 () Bool)

(declare-fun res!282416 () Bool)

(assert (=> b!472751 (=> (not res!282416) (not e!277245))))

(assert (=> b!472751 (= res!282416 (not (contains!2527 lt!214549 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!472752 () Bool)

(declare-fun lt!214547 () Unit!13887)

(declare-fun lt!214545 () Unit!13887)

(assert (=> b!472752 (= lt!214547 lt!214545)))

(declare-fun lt!214548 () V!18819)

(declare-fun lt!214546 () ListLongMap!7649)

(declare-fun lt!214543 () (_ BitVec 64))

(declare-fun lt!214544 () (_ BitVec 64))

(assert (=> b!472752 (not (contains!2527 (+!1728 lt!214546 (tuple2!8735 lt!214543 lt!214548)) lt!214544))))

(assert (=> b!472752 (= lt!214545 (addStillNotContains!166 lt!214546 lt!214543 lt!214548 lt!214544))))

(assert (=> b!472752 (= lt!214544 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!472752 (= lt!214548 (get!7099 (select (arr!14578 _values!833) #b00000000000000000000000000000000) (dynLambda!921 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!472752 (= lt!214543 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!472752 (= lt!214546 call!30451)))

(assert (=> b!472752 (= e!277249 (+!1728 call!30451 (tuple2!8735 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000) (get!7099 (select (arr!14578 _values!833) #b00000000000000000000000000000000) (dynLambda!921 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!30448 () Bool)

(assert (=> bm!30448 (= call!30451 (getCurrentListMapNoExtraKeys!2052 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(assert (= (and d!75499 c!56997) b!472745))

(assert (= (and d!75499 (not c!56997)) b!472747))

(assert (= (and b!472747 c!56996) b!472752))

(assert (= (and b!472747 (not c!56996)) b!472742))

(assert (= (or b!472752 b!472742) bm!30448))

(assert (= (and d!75499 res!282415) b!472751))

(assert (= (and b!472751 res!282416) b!472744))

(assert (= (and b!472744 res!282414) b!472741))

(assert (= (and b!472744 c!56995) b!472748))

(assert (= (and b!472744 (not c!56995)) b!472743))

(assert (= (and b!472748 res!282417) b!472750))

(assert (= (and b!472743 c!56994) b!472749))

(assert (= (and b!472743 (not c!56994)) b!472746))

(declare-fun b_lambda!10203 () Bool)

(assert (=> (not b_lambda!10203) (not b!472750)))

(assert (=> b!472750 t!14764))

(declare-fun b_and!20323 () Bool)

(assert (= b_and!20321 (and (=> t!14764 result!7431) b_and!20323)))

(declare-fun b_lambda!10205 () Bool)

(assert (=> (not b_lambda!10205) (not b!472752)))

(assert (=> b!472752 t!14764))

(declare-fun b_and!20325 () Bool)

(assert (= b_and!20323 (and (=> t!14764 result!7431) b_and!20325)))

(declare-fun m!454911 () Bool)

(assert (=> b!472751 m!454911))

(declare-fun m!454913 () Bool)

(assert (=> b!472746 m!454913))

(assert (=> b!472741 m!454885))

(assert (=> b!472741 m!454885))

(assert (=> b!472741 m!454887))

(assert (=> b!472747 m!454885))

(assert (=> b!472747 m!454885))

(assert (=> b!472747 m!454887))

(declare-fun m!454915 () Bool)

(assert (=> d!75499 m!454915))

(assert (=> d!75499 m!454827))

(declare-fun m!454917 () Bool)

(assert (=> bm!30448 m!454917))

(assert (=> b!472749 m!454917))

(assert (=> b!472748 m!454885))

(assert (=> b!472748 m!454885))

(declare-fun m!454919 () Bool)

(assert (=> b!472748 m!454919))

(declare-fun m!454921 () Bool)

(assert (=> b!472752 m!454921))

(assert (=> b!472752 m!454897))

(assert (=> b!472752 m!454899))

(assert (=> b!472752 m!454901))

(assert (=> b!472752 m!454899))

(assert (=> b!472752 m!454921))

(declare-fun m!454923 () Bool)

(assert (=> b!472752 m!454923))

(assert (=> b!472752 m!454885))

(declare-fun m!454925 () Bool)

(assert (=> b!472752 m!454925))

(declare-fun m!454927 () Bool)

(assert (=> b!472752 m!454927))

(assert (=> b!472752 m!454897))

(assert (=> b!472750 m!454897))

(assert (=> b!472750 m!454899))

(assert (=> b!472750 m!454901))

(assert (=> b!472750 m!454899))

(assert (=> b!472750 m!454885))

(assert (=> b!472750 m!454897))

(assert (=> b!472750 m!454885))

(declare-fun m!454929 () Bool)

(assert (=> b!472750 m!454929))

(assert (=> b!472651 d!75499))

(declare-fun d!75501 () Bool)

(assert (=> d!75501 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42352 d!75501))

(declare-fun d!75503 () Bool)

(assert (=> d!75503 (= (array_inv!10600 _keys!1025) (bvsge (size!14929 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42352 d!75503))

(declare-fun d!75505 () Bool)

(assert (=> d!75505 (= (array_inv!10601 _values!833) (bvsge (size!14930 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42352 d!75505))

(declare-fun b!472763 () Bool)

(declare-fun e!277261 () Bool)

(declare-fun call!30454 () Bool)

(assert (=> b!472763 (= e!277261 call!30454)))

(declare-fun d!75507 () Bool)

(declare-fun res!282424 () Bool)

(declare-fun e!277262 () Bool)

(assert (=> d!75507 (=> res!282424 e!277262)))

(assert (=> d!75507 (= res!282424 (bvsge #b00000000000000000000000000000000 (size!14929 _keys!1025)))))

(assert (=> d!75507 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8796) e!277262)))

(declare-fun b!472764 () Bool)

(declare-fun e!277260 () Bool)

(assert (=> b!472764 (= e!277262 e!277260)))

(declare-fun res!282425 () Bool)

(assert (=> b!472764 (=> (not res!282425) (not e!277260))))

(declare-fun e!277259 () Bool)

(assert (=> b!472764 (= res!282425 (not e!277259))))

(declare-fun res!282426 () Bool)

(assert (=> b!472764 (=> (not res!282426) (not e!277259))))

(assert (=> b!472764 (= res!282426 (validKeyInArray!0 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472765 () Bool)

(assert (=> b!472765 (= e!277260 e!277261)))

(declare-fun c!57000 () Bool)

(assert (=> b!472765 (= c!57000 (validKeyInArray!0 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30451 () Bool)

(assert (=> bm!30451 (= call!30454 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57000 (Cons!8795 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000) Nil!8796) Nil!8796)))))

(declare-fun b!472766 () Bool)

(assert (=> b!472766 (= e!277261 call!30454)))

(declare-fun b!472767 () Bool)

(declare-fun contains!2528 (List!8799 (_ BitVec 64)) Bool)

(assert (=> b!472767 (= e!277259 (contains!2528 Nil!8796 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75507 (not res!282424)) b!472764))

(assert (= (and b!472764 res!282426) b!472767))

(assert (= (and b!472764 res!282425) b!472765))

(assert (= (and b!472765 c!57000) b!472763))

(assert (= (and b!472765 (not c!57000)) b!472766))

(assert (= (or b!472763 b!472766) bm!30451))

(assert (=> b!472764 m!454885))

(assert (=> b!472764 m!454885))

(assert (=> b!472764 m!454887))

(assert (=> b!472765 m!454885))

(assert (=> b!472765 m!454885))

(assert (=> b!472765 m!454887))

(assert (=> bm!30451 m!454885))

(declare-fun m!454931 () Bool)

(assert (=> bm!30451 m!454931))

(assert (=> b!472767 m!454885))

(assert (=> b!472767 m!454885))

(declare-fun m!454933 () Bool)

(assert (=> b!472767 m!454933))

(assert (=> b!472653 d!75507))

(declare-fun b!472810 () Bool)

(declare-fun res!282453 () Bool)

(declare-fun e!277290 () Bool)

(assert (=> b!472810 (=> (not res!282453) (not e!277290))))

(declare-fun e!277301 () Bool)

(assert (=> b!472810 (= res!282453 e!277301)))

(declare-fun c!57016 () Bool)

(assert (=> b!472810 (= c!57016 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!472811 () Bool)

(declare-fun e!277291 () ListLongMap!7649)

(declare-fun call!30475 () ListLongMap!7649)

(assert (=> b!472811 (= e!277291 call!30475)))

(declare-fun bm!30466 () Bool)

(declare-fun call!30474 () Bool)

(declare-fun lt!214613 () ListLongMap!7649)

(assert (=> bm!30466 (= call!30474 (contains!2527 lt!214613 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!472812 () Bool)

(declare-fun e!277289 () Bool)

(assert (=> b!472812 (= e!277289 (= (apply!331 lt!214613 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!472814 () Bool)

(declare-fun call!30470 () Bool)

(assert (=> b!472814 (= e!277301 (not call!30470))))

(declare-fun b!472815 () Bool)

(declare-fun e!277298 () Unit!13887)

(declare-fun Unit!13889 () Unit!13887)

(assert (=> b!472815 (= e!277298 Unit!13889)))

(declare-fun b!472816 () Bool)

(declare-fun e!277297 () ListLongMap!7649)

(assert (=> b!472816 (= e!277297 call!30475)))

(declare-fun b!472817 () Bool)

(declare-fun e!277292 () Bool)

(assert (=> b!472817 (= e!277292 (validKeyInArray!0 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472818 () Bool)

(declare-fun call!30469 () ListLongMap!7649)

(assert (=> b!472818 (= e!277291 call!30469)))

(declare-fun bm!30467 () Bool)

(assert (=> bm!30467 (= call!30470 (contains!2527 lt!214613 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!30473 () ListLongMap!7649)

(declare-fun bm!30468 () Bool)

(assert (=> bm!30468 (= call!30473 (getCurrentListMapNoExtraKeys!2052 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472819 () Bool)

(declare-fun e!277294 () Bool)

(assert (=> b!472819 (= e!277294 e!277289)))

(declare-fun res!282448 () Bool)

(assert (=> b!472819 (= res!282448 call!30474)))

(assert (=> b!472819 (=> (not res!282448) (not e!277289))))

(declare-fun b!472820 () Bool)

(declare-fun e!277295 () Bool)

(assert (=> b!472820 (= e!277295 (validKeyInArray!0 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472821 () Bool)

(assert (=> b!472821 (= e!277294 (not call!30474))))

(declare-fun b!472822 () Bool)

(declare-fun e!277300 () Bool)

(assert (=> b!472822 (= e!277300 (= (apply!331 lt!214613 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!472823 () Bool)

(declare-fun res!282452 () Bool)

(assert (=> b!472823 (=> (not res!282452) (not e!277290))))

(declare-fun e!277293 () Bool)

(assert (=> b!472823 (= res!282452 e!277293)))

(declare-fun res!282451 () Bool)

(assert (=> b!472823 (=> res!282451 e!277293)))

(assert (=> b!472823 (= res!282451 (not e!277295))))

(declare-fun res!282450 () Bool)

(assert (=> b!472823 (=> (not res!282450) (not e!277295))))

(assert (=> b!472823 (= res!282450 (bvslt #b00000000000000000000000000000000 (size!14929 _keys!1025)))))

(declare-fun b!472813 () Bool)

(declare-fun c!57015 () Bool)

(assert (=> b!472813 (= c!57015 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!472813 (= e!277297 e!277291)))

(declare-fun d!75509 () Bool)

(assert (=> d!75509 e!277290))

(declare-fun res!282446 () Bool)

(assert (=> d!75509 (=> (not res!282446) (not e!277290))))

(assert (=> d!75509 (= res!282446 (or (bvsge #b00000000000000000000000000000000 (size!14929 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14929 _keys!1025)))))))

(declare-fun lt!214596 () ListLongMap!7649)

(assert (=> d!75509 (= lt!214613 lt!214596)))

(declare-fun lt!214607 () Unit!13887)

(assert (=> d!75509 (= lt!214607 e!277298)))

(declare-fun c!57018 () Bool)

(assert (=> d!75509 (= c!57018 e!277292)))

(declare-fun res!282449 () Bool)

(assert (=> d!75509 (=> (not res!282449) (not e!277292))))

(assert (=> d!75509 (= res!282449 (bvslt #b00000000000000000000000000000000 (size!14929 _keys!1025)))))

(declare-fun e!277299 () ListLongMap!7649)

(assert (=> d!75509 (= lt!214596 e!277299)))

(declare-fun c!57014 () Bool)

(assert (=> d!75509 (= c!57014 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75509 (validMask!0 mask!1365)))

(assert (=> d!75509 (= (getCurrentListMap!2206 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!214613)))

(declare-fun bm!30469 () Bool)

(declare-fun call!30471 () ListLongMap!7649)

(assert (=> bm!30469 (= call!30471 call!30473)))

(declare-fun bm!30470 () Bool)

(assert (=> bm!30470 (= call!30469 call!30471)))

(declare-fun b!472824 () Bool)

(declare-fun lt!214598 () Unit!13887)

(assert (=> b!472824 (= e!277298 lt!214598)))

(declare-fun lt!214600 () ListLongMap!7649)

(assert (=> b!472824 (= lt!214600 (getCurrentListMapNoExtraKeys!2052 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214594 () (_ BitVec 64))

(assert (=> b!472824 (= lt!214594 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!214597 () (_ BitVec 64))

(assert (=> b!472824 (= lt!214597 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!214615 () Unit!13887)

(declare-fun addStillContains!290 (ListLongMap!7649 (_ BitVec 64) V!18819 (_ BitVec 64)) Unit!13887)

(assert (=> b!472824 (= lt!214615 (addStillContains!290 lt!214600 lt!214594 zeroValue!794 lt!214597))))

(assert (=> b!472824 (contains!2527 (+!1728 lt!214600 (tuple2!8735 lt!214594 zeroValue!794)) lt!214597)))

(declare-fun lt!214605 () Unit!13887)

(assert (=> b!472824 (= lt!214605 lt!214615)))

(declare-fun lt!214601 () ListLongMap!7649)

(assert (=> b!472824 (= lt!214601 (getCurrentListMapNoExtraKeys!2052 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214595 () (_ BitVec 64))

(assert (=> b!472824 (= lt!214595 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!214599 () (_ BitVec 64))

(assert (=> b!472824 (= lt!214599 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!214602 () Unit!13887)

(declare-fun addApplyDifferent!290 (ListLongMap!7649 (_ BitVec 64) V!18819 (_ BitVec 64)) Unit!13887)

(assert (=> b!472824 (= lt!214602 (addApplyDifferent!290 lt!214601 lt!214595 minValueBefore!38 lt!214599))))

(assert (=> b!472824 (= (apply!331 (+!1728 lt!214601 (tuple2!8735 lt!214595 minValueBefore!38)) lt!214599) (apply!331 lt!214601 lt!214599))))

(declare-fun lt!214610 () Unit!13887)

(assert (=> b!472824 (= lt!214610 lt!214602)))

(declare-fun lt!214606 () ListLongMap!7649)

(assert (=> b!472824 (= lt!214606 (getCurrentListMapNoExtraKeys!2052 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214612 () (_ BitVec 64))

(assert (=> b!472824 (= lt!214612 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!214609 () (_ BitVec 64))

(assert (=> b!472824 (= lt!214609 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!214614 () Unit!13887)

(assert (=> b!472824 (= lt!214614 (addApplyDifferent!290 lt!214606 lt!214612 zeroValue!794 lt!214609))))

(assert (=> b!472824 (= (apply!331 (+!1728 lt!214606 (tuple2!8735 lt!214612 zeroValue!794)) lt!214609) (apply!331 lt!214606 lt!214609))))

(declare-fun lt!214603 () Unit!13887)

(assert (=> b!472824 (= lt!214603 lt!214614)))

(declare-fun lt!214608 () ListLongMap!7649)

(assert (=> b!472824 (= lt!214608 (getCurrentListMapNoExtraKeys!2052 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214611 () (_ BitVec 64))

(assert (=> b!472824 (= lt!214611 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!214604 () (_ BitVec 64))

(assert (=> b!472824 (= lt!214604 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!472824 (= lt!214598 (addApplyDifferent!290 lt!214608 lt!214611 minValueBefore!38 lt!214604))))

(assert (=> b!472824 (= (apply!331 (+!1728 lt!214608 (tuple2!8735 lt!214611 minValueBefore!38)) lt!214604) (apply!331 lt!214608 lt!214604))))

(declare-fun b!472825 () Bool)

(assert (=> b!472825 (= e!277301 e!277300)))

(declare-fun res!282445 () Bool)

(assert (=> b!472825 (= res!282445 call!30470)))

(assert (=> b!472825 (=> (not res!282445) (not e!277300))))

(declare-fun b!472826 () Bool)

(assert (=> b!472826 (= e!277299 e!277297)))

(declare-fun c!57017 () Bool)

(assert (=> b!472826 (= c!57017 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!472827 () Bool)

(declare-fun call!30472 () ListLongMap!7649)

(assert (=> b!472827 (= e!277299 (+!1728 call!30472 (tuple2!8735 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun b!472828 () Bool)

(assert (=> b!472828 (= e!277290 e!277294)))

(declare-fun c!57013 () Bool)

(assert (=> b!472828 (= c!57013 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30471 () Bool)

(assert (=> bm!30471 (= call!30475 call!30472)))

(declare-fun b!472829 () Bool)

(declare-fun e!277296 () Bool)

(assert (=> b!472829 (= e!277296 (= (apply!331 lt!214613 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)) (get!7099 (select (arr!14578 _values!833) #b00000000000000000000000000000000) (dynLambda!921 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!472829 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14930 _values!833)))))

(assert (=> b!472829 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14929 _keys!1025)))))

(declare-fun b!472830 () Bool)

(assert (=> b!472830 (= e!277293 e!277296)))

(declare-fun res!282447 () Bool)

(assert (=> b!472830 (=> (not res!282447) (not e!277296))))

(assert (=> b!472830 (= res!282447 (contains!2527 lt!214613 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472830 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14929 _keys!1025)))))

(declare-fun bm!30472 () Bool)

(assert (=> bm!30472 (= call!30472 (+!1728 (ite c!57014 call!30473 (ite c!57017 call!30471 call!30469)) (ite (or c!57014 c!57017) (tuple2!8735 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8735 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (= (and d!75509 c!57014) b!472827))

(assert (= (and d!75509 (not c!57014)) b!472826))

(assert (= (and b!472826 c!57017) b!472816))

(assert (= (and b!472826 (not c!57017)) b!472813))

(assert (= (and b!472813 c!57015) b!472811))

(assert (= (and b!472813 (not c!57015)) b!472818))

(assert (= (or b!472811 b!472818) bm!30470))

(assert (= (or b!472816 bm!30470) bm!30469))

(assert (= (or b!472816 b!472811) bm!30471))

(assert (= (or b!472827 bm!30469) bm!30468))

(assert (= (or b!472827 bm!30471) bm!30472))

(assert (= (and d!75509 res!282449) b!472817))

(assert (= (and d!75509 c!57018) b!472824))

(assert (= (and d!75509 (not c!57018)) b!472815))

(assert (= (and d!75509 res!282446) b!472823))

(assert (= (and b!472823 res!282450) b!472820))

(assert (= (and b!472823 (not res!282451)) b!472830))

(assert (= (and b!472830 res!282447) b!472829))

(assert (= (and b!472823 res!282452) b!472810))

(assert (= (and b!472810 c!57016) b!472825))

(assert (= (and b!472810 (not c!57016)) b!472814))

(assert (= (and b!472825 res!282445) b!472822))

(assert (= (or b!472825 b!472814) bm!30467))

(assert (= (and b!472810 res!282453) b!472828))

(assert (= (and b!472828 c!57013) b!472819))

(assert (= (and b!472828 (not c!57013)) b!472821))

(assert (= (and b!472819 res!282448) b!472812))

(assert (= (or b!472819 b!472821) bm!30466))

(declare-fun b_lambda!10207 () Bool)

(assert (=> (not b_lambda!10207) (not b!472829)))

(assert (=> b!472829 t!14764))

(declare-fun b_and!20327 () Bool)

(assert (= b_and!20325 (and (=> t!14764 result!7431) b_and!20327)))

(assert (=> b!472829 m!454885))

(assert (=> b!472829 m!454899))

(assert (=> b!472829 m!454897))

(assert (=> b!472829 m!454899))

(assert (=> b!472829 m!454901))

(assert (=> b!472829 m!454885))

(declare-fun m!454935 () Bool)

(assert (=> b!472829 m!454935))

(assert (=> b!472829 m!454897))

(assert (=> b!472817 m!454885))

(assert (=> b!472817 m!454885))

(assert (=> b!472817 m!454887))

(declare-fun m!454937 () Bool)

(assert (=> b!472822 m!454937))

(assert (=> bm!30468 m!454823))

(declare-fun m!454939 () Bool)

(assert (=> b!472824 m!454939))

(assert (=> b!472824 m!454885))

(declare-fun m!454941 () Bool)

(assert (=> b!472824 m!454941))

(declare-fun m!454943 () Bool)

(assert (=> b!472824 m!454943))

(declare-fun m!454945 () Bool)

(assert (=> b!472824 m!454945))

(declare-fun m!454947 () Bool)

(assert (=> b!472824 m!454947))

(assert (=> b!472824 m!454939))

(declare-fun m!454949 () Bool)

(assert (=> b!472824 m!454949))

(declare-fun m!454951 () Bool)

(assert (=> b!472824 m!454951))

(declare-fun m!454953 () Bool)

(assert (=> b!472824 m!454953))

(declare-fun m!454955 () Bool)

(assert (=> b!472824 m!454955))

(assert (=> b!472824 m!454823))

(declare-fun m!454957 () Bool)

(assert (=> b!472824 m!454957))

(declare-fun m!454959 () Bool)

(assert (=> b!472824 m!454959))

(declare-fun m!454961 () Bool)

(assert (=> b!472824 m!454961))

(declare-fun m!454963 () Bool)

(assert (=> b!472824 m!454963))

(assert (=> b!472824 m!454957))

(declare-fun m!454965 () Bool)

(assert (=> b!472824 m!454965))

(assert (=> b!472824 m!454951))

(declare-fun m!454967 () Bool)

(assert (=> b!472824 m!454967))

(assert (=> b!472824 m!454961))

(declare-fun m!454969 () Bool)

(assert (=> b!472812 m!454969))

(declare-fun m!454971 () Bool)

(assert (=> b!472827 m!454971))

(declare-fun m!454973 () Bool)

(assert (=> bm!30467 m!454973))

(assert (=> b!472830 m!454885))

(assert (=> b!472830 m!454885))

(declare-fun m!454975 () Bool)

(assert (=> b!472830 m!454975))

(declare-fun m!454977 () Bool)

(assert (=> bm!30466 m!454977))

(assert (=> d!75509 m!454827))

(assert (=> b!472820 m!454885))

(assert (=> b!472820 m!454885))

(assert (=> b!472820 m!454887))

(declare-fun m!454979 () Bool)

(assert (=> bm!30472 m!454979))

(assert (=> b!472648 d!75509))

(declare-fun bm!30475 () Bool)

(declare-fun call!30478 () Bool)

(assert (=> bm!30475 (= call!30478 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!472840 () Bool)

(declare-fun e!277310 () Bool)

(assert (=> b!472840 (= e!277310 call!30478)))

(declare-fun d!75511 () Bool)

(declare-fun res!282459 () Bool)

(declare-fun e!277308 () Bool)

(assert (=> d!75511 (=> res!282459 e!277308)))

(assert (=> d!75511 (= res!282459 (bvsge #b00000000000000000000000000000000 (size!14929 _keys!1025)))))

(assert (=> d!75511 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!277308)))

(declare-fun b!472839 () Bool)

(declare-fun e!277309 () Bool)

(assert (=> b!472839 (= e!277309 call!30478)))

(declare-fun b!472841 () Bool)

(assert (=> b!472841 (= e!277308 e!277310)))

(declare-fun c!57021 () Bool)

(assert (=> b!472841 (= c!57021 (validKeyInArray!0 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472842 () Bool)

(assert (=> b!472842 (= e!277310 e!277309)))

(declare-fun lt!214622 () (_ BitVec 64))

(assert (=> b!472842 (= lt!214622 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!214624 () Unit!13887)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30314 (_ BitVec 64) (_ BitVec 32)) Unit!13887)

(assert (=> b!472842 (= lt!214624 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!214622 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!472842 (arrayContainsKey!0 _keys!1025 lt!214622 #b00000000000000000000000000000000)))

(declare-fun lt!214623 () Unit!13887)

(assert (=> b!472842 (= lt!214623 lt!214624)))

(declare-fun res!282458 () Bool)

(declare-datatypes ((SeekEntryResult!3504 0))(
  ( (MissingZero!3504 (index!16195 (_ BitVec 32))) (Found!3504 (index!16196 (_ BitVec 32))) (Intermediate!3504 (undefined!4316 Bool) (index!16197 (_ BitVec 32)) (x!44286 (_ BitVec 32))) (Undefined!3504) (MissingVacant!3504 (index!16198 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30314 (_ BitVec 32)) SeekEntryResult!3504)

(assert (=> b!472842 (= res!282458 (= (seekEntryOrOpen!0 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3504 #b00000000000000000000000000000000)))))

(assert (=> b!472842 (=> (not res!282458) (not e!277309))))

(assert (= (and d!75511 (not res!282459)) b!472841))

(assert (= (and b!472841 c!57021) b!472842))

(assert (= (and b!472841 (not c!57021)) b!472840))

(assert (= (and b!472842 res!282458) b!472839))

(assert (= (or b!472839 b!472840) bm!30475))

(declare-fun m!454981 () Bool)

(assert (=> bm!30475 m!454981))

(assert (=> b!472841 m!454885))

(assert (=> b!472841 m!454885))

(assert (=> b!472841 m!454887))

(assert (=> b!472842 m!454885))

(declare-fun m!454983 () Bool)

(assert (=> b!472842 m!454983))

(declare-fun m!454985 () Bool)

(assert (=> b!472842 m!454985))

(assert (=> b!472842 m!454885))

(declare-fun m!454987 () Bool)

(assert (=> b!472842 m!454987))

(assert (=> b!472652 d!75511))

(declare-fun b!472850 () Bool)

(declare-fun e!277316 () Bool)

(assert (=> b!472850 (= e!277316 tp_is_empty!13285)))

(declare-fun b!472849 () Bool)

(declare-fun e!277315 () Bool)

(assert (=> b!472849 (= e!277315 tp_is_empty!13285)))

(declare-fun condMapEmpty!21646 () Bool)

(declare-fun mapDefault!21646 () ValueCell!6299)

(assert (=> mapNonEmpty!21637 (= condMapEmpty!21646 (= mapRest!21637 ((as const (Array (_ BitVec 32) ValueCell!6299)) mapDefault!21646)))))

(declare-fun mapRes!21646 () Bool)

(assert (=> mapNonEmpty!21637 (= tp!41602 (and e!277316 mapRes!21646))))

(declare-fun mapIsEmpty!21646 () Bool)

(assert (=> mapIsEmpty!21646 mapRes!21646))

(declare-fun mapNonEmpty!21646 () Bool)

(declare-fun tp!41617 () Bool)

(assert (=> mapNonEmpty!21646 (= mapRes!21646 (and tp!41617 e!277315))))

(declare-fun mapRest!21646 () (Array (_ BitVec 32) ValueCell!6299))

(declare-fun mapKey!21646 () (_ BitVec 32))

(declare-fun mapValue!21646 () ValueCell!6299)

(assert (=> mapNonEmpty!21646 (= mapRest!21637 (store mapRest!21646 mapKey!21646 mapValue!21646))))

(assert (= (and mapNonEmpty!21637 condMapEmpty!21646) mapIsEmpty!21646))

(assert (= (and mapNonEmpty!21637 (not condMapEmpty!21646)) mapNonEmpty!21646))

(assert (= (and mapNonEmpty!21646 ((_ is ValueCellFull!6299) mapValue!21646)) b!472849))

(assert (= (and mapNonEmpty!21637 ((_ is ValueCellFull!6299) mapDefault!21646)) b!472850))

(declare-fun m!454989 () Bool)

(assert (=> mapNonEmpty!21646 m!454989))

(declare-fun b_lambda!10209 () Bool)

(assert (= b_lambda!10205 (or (and start!42352 b_free!11857) b_lambda!10209)))

(declare-fun b_lambda!10211 () Bool)

(assert (= b_lambda!10203 (or (and start!42352 b_free!11857) b_lambda!10211)))

(declare-fun b_lambda!10213 () Bool)

(assert (= b_lambda!10199 (or (and start!42352 b_free!11857) b_lambda!10213)))

(declare-fun b_lambda!10215 () Bool)

(assert (= b_lambda!10201 (or (and start!42352 b_free!11857) b_lambda!10215)))

(declare-fun b_lambda!10217 () Bool)

(assert (= b_lambda!10207 (or (and start!42352 b_free!11857) b_lambda!10217)))

(check-sat (not b_next!11857) (not b!472747) (not d!75499) (not b!472752) (not b!472841) (not b_lambda!10217) (not b_lambda!10213) (not b_lambda!10215) (not b!472830) (not b!472741) (not b!472736) tp_is_empty!13285 (not b!472738) (not bm!30472) (not d!75497) (not d!75495) (not b!472734) (not bm!30447) (not bm!30467) (not d!75509) (not b!472727) (not b!472749) (not bm!30468) (not b!472842) b_and!20327 (not b!472748) (not b!472820) (not bm!30451) (not b!472750) (not b!472827) (not b!472764) (not b!472733) (not b!472737) (not b!472732) (not b!472746) (not b!472822) (not b!472751) (not b!472824) (not bm!30466) (not b!472812) (not b_lambda!10211) (not b!472817) (not b!472829) (not mapNonEmpty!21646) (not b!472767) (not b_lambda!10209) (not b!472735) (not b!472765) (not bm!30475) (not bm!30448))
(check-sat b_and!20327 (not b_next!11857))
