; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42284 () Bool)

(assert start!42284)

(declare-fun b_free!11803 () Bool)

(declare-fun b_next!11803 () Bool)

(assert (=> start!42284 (= b_free!11803 (not b_next!11803))))

(declare-fun tp!41437 () Bool)

(declare-fun b_and!20251 () Bool)

(assert (=> start!42284 (= tp!41437 b_and!20251)))

(declare-fun b!471921 () Bool)

(declare-fun e!276650 () Bool)

(declare-fun tp_is_empty!13231 () Bool)

(assert (=> b!471921 (= e!276650 tp_is_empty!13231)))

(declare-fun mapIsEmpty!21553 () Bool)

(declare-fun mapRes!21553 () Bool)

(assert (=> mapIsEmpty!21553 mapRes!21553))

(declare-fun b!471922 () Bool)

(declare-fun e!276649 () Bool)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!30208 0))(
  ( (array!30209 (arr!14525 (Array (_ BitVec 32) (_ BitVec 64))) (size!14877 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30208)

(assert (=> b!471922 (= e!276649 (not (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!14877 _keys!1025)))))))

(declare-datatypes ((V!18747 0))(
  ( (V!18748 (val!6660 Int)) )
))
(declare-datatypes ((tuple2!8692 0))(
  ( (tuple2!8693 (_1!4357 (_ BitVec 64)) (_2!4357 V!18747)) )
))
(declare-datatypes ((List!8759 0))(
  ( (Nil!8756) (Cons!8755 (h!9611 tuple2!8692) (t!14717 List!8759)) )
))
(declare-datatypes ((ListLongMap!7607 0))(
  ( (ListLongMap!7608 (toList!3819 List!8759)) )
))
(declare-fun lt!214134 () ListLongMap!7607)

(declare-fun lt!214136 () ListLongMap!7607)

(assert (=> b!471922 (= lt!214134 lt!214136)))

(declare-fun minValueBefore!38 () V!18747)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13851 0))(
  ( (Unit!13852) )
))
(declare-fun lt!214135 () Unit!13851)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6272 0))(
  ( (ValueCellFull!6272 (v!8952 V!18747)) (EmptyCell!6272) )
))
(declare-datatypes ((array!30210 0))(
  ( (array!30211 (arr!14526 (Array (_ BitVec 32) ValueCell!6272)) (size!14878 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30210)

(declare-fun zeroValue!794 () V!18747)

(declare-fun minValueAfter!38 () V!18747)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!194 (array!30208 array!30210 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18747 V!18747 V!18747 V!18747 (_ BitVec 32) Int) Unit!13851)

(assert (=> b!471922 (= lt!214135 (lemmaNoChangeToArrayThenSameMapNoExtras!194 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2034 (array!30208 array!30210 (_ BitVec 32) (_ BitVec 32) V!18747 V!18747 (_ BitVec 32) Int) ListLongMap!7607)

(assert (=> b!471922 (= lt!214136 (getCurrentListMapNoExtraKeys!2034 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471922 (= lt!214134 (getCurrentListMapNoExtraKeys!2034 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471923 () Bool)

(declare-fun res!281940 () Bool)

(assert (=> b!471923 (=> (not res!281940) (not e!276649))))

(declare-datatypes ((List!8760 0))(
  ( (Nil!8757) (Cons!8756 (h!9612 (_ BitVec 64)) (t!14718 List!8760)) )
))
(declare-fun arrayNoDuplicates!0 (array!30208 (_ BitVec 32) List!8760) Bool)

(assert (=> b!471923 (= res!281940 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8757))))

(declare-fun b!471924 () Bool)

(declare-fun e!276651 () Bool)

(assert (=> b!471924 (= e!276651 tp_is_empty!13231)))

(declare-fun mapNonEmpty!21553 () Bool)

(declare-fun tp!41436 () Bool)

(assert (=> mapNonEmpty!21553 (= mapRes!21553 (and tp!41436 e!276651))))

(declare-fun mapValue!21553 () ValueCell!6272)

(declare-fun mapRest!21553 () (Array (_ BitVec 32) ValueCell!6272))

(declare-fun mapKey!21553 () (_ BitVec 32))

(assert (=> mapNonEmpty!21553 (= (arr!14526 _values!833) (store mapRest!21553 mapKey!21553 mapValue!21553))))

(declare-fun b!471926 () Bool)

(declare-fun res!281941 () Bool)

(assert (=> b!471926 (=> (not res!281941) (not e!276649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30208 (_ BitVec 32)) Bool)

(assert (=> b!471926 (= res!281941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471927 () Bool)

(declare-fun res!281938 () Bool)

(assert (=> b!471927 (=> (not res!281938) (not e!276649))))

(assert (=> b!471927 (= res!281938 (and (= (size!14878 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14877 _keys!1025) (size!14878 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471925 () Bool)

(declare-fun e!276647 () Bool)

(assert (=> b!471925 (= e!276647 (and e!276650 mapRes!21553))))

(declare-fun condMapEmpty!21553 () Bool)

(declare-fun mapDefault!21553 () ValueCell!6272)

(assert (=> b!471925 (= condMapEmpty!21553 (= (arr!14526 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6272)) mapDefault!21553)))))

(declare-fun res!281939 () Bool)

(assert (=> start!42284 (=> (not res!281939) (not e!276649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42284 (= res!281939 (validMask!0 mask!1365))))

(assert (=> start!42284 e!276649))

(assert (=> start!42284 tp_is_empty!13231))

(assert (=> start!42284 tp!41437))

(assert (=> start!42284 true))

(declare-fun array_inv!10566 (array!30208) Bool)

(assert (=> start!42284 (array_inv!10566 _keys!1025)))

(declare-fun array_inv!10567 (array!30210) Bool)

(assert (=> start!42284 (and (array_inv!10567 _values!833) e!276647)))

(assert (= (and start!42284 res!281939) b!471927))

(assert (= (and b!471927 res!281938) b!471926))

(assert (= (and b!471926 res!281941) b!471923))

(assert (= (and b!471923 res!281940) b!471922))

(assert (= (and b!471925 condMapEmpty!21553) mapIsEmpty!21553))

(assert (= (and b!471925 (not condMapEmpty!21553)) mapNonEmpty!21553))

(get-info :version)

(assert (= (and mapNonEmpty!21553 ((_ is ValueCellFull!6272) mapValue!21553)) b!471924))

(assert (= (and b!471925 ((_ is ValueCellFull!6272) mapDefault!21553)) b!471921))

(assert (= start!42284 b!471925))

(declare-fun m!454219 () Bool)

(assert (=> b!471922 m!454219))

(declare-fun m!454221 () Bool)

(assert (=> b!471922 m!454221))

(declare-fun m!454223 () Bool)

(assert (=> b!471922 m!454223))

(declare-fun m!454225 () Bool)

(assert (=> b!471926 m!454225))

(declare-fun m!454227 () Bool)

(assert (=> b!471923 m!454227))

(declare-fun m!454229 () Bool)

(assert (=> start!42284 m!454229))

(declare-fun m!454231 () Bool)

(assert (=> start!42284 m!454231))

(declare-fun m!454233 () Bool)

(assert (=> start!42284 m!454233))

(declare-fun m!454235 () Bool)

(assert (=> mapNonEmpty!21553 m!454235))

(check-sat (not b!471926) tp_is_empty!13231 (not b!471922) b_and!20251 (not start!42284) (not b_next!11803) (not b!471923) (not mapNonEmpty!21553))
(check-sat b_and!20251 (not b_next!11803))
(get-model)

(declare-fun d!75461 () Bool)

(assert (=> d!75461 (= (getCurrentListMapNoExtraKeys!2034 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2034 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214157 () Unit!13851)

(declare-fun choose!1356 (array!30208 array!30210 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18747 V!18747 V!18747 V!18747 (_ BitVec 32) Int) Unit!13851)

(assert (=> d!75461 (= lt!214157 (choose!1356 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75461 (validMask!0 mask!1365)))

(assert (=> d!75461 (= (lemmaNoChangeToArrayThenSameMapNoExtras!194 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!214157)))

(declare-fun bs!14992 () Bool)

(assert (= bs!14992 d!75461))

(assert (=> bs!14992 m!454223))

(assert (=> bs!14992 m!454221))

(declare-fun m!454273 () Bool)

(assert (=> bs!14992 m!454273))

(assert (=> bs!14992 m!454229))

(assert (=> b!471922 d!75461))

(declare-fun b!471994 () Bool)

(declare-fun e!276700 () Bool)

(declare-fun e!276697 () Bool)

(assert (=> b!471994 (= e!276700 e!276697)))

(assert (=> b!471994 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14877 _keys!1025)))))

(declare-fun res!281976 () Bool)

(declare-fun lt!214174 () ListLongMap!7607)

(declare-fun contains!2525 (ListLongMap!7607 (_ BitVec 64)) Bool)

(assert (=> b!471994 (= res!281976 (contains!2525 lt!214174 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!471994 (=> (not res!281976) (not e!276697))))

(declare-fun b!471995 () Bool)

(declare-fun e!276698 () Bool)

(assert (=> b!471995 (= e!276698 (= lt!214174 (getCurrentListMapNoExtraKeys!2034 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!471996 () Bool)

(declare-fun e!276702 () ListLongMap!7607)

(declare-fun e!276701 () ListLongMap!7607)

(assert (=> b!471996 (= e!276702 e!276701)))

(declare-fun c!56968 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!471996 (= c!56968 (validKeyInArray!0 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!471997 () Bool)

(assert (=> b!471997 (= e!276702 (ListLongMap!7608 Nil!8756))))

(declare-fun b!471998 () Bool)

(declare-fun res!281975 () Bool)

(declare-fun e!276696 () Bool)

(assert (=> b!471998 (=> (not res!281975) (not e!276696))))

(assert (=> b!471998 (= res!281975 (not (contains!2525 lt!214174 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!471999 () Bool)

(declare-fun call!30440 () ListLongMap!7607)

(assert (=> b!471999 (= e!276701 call!30440)))

(declare-fun b!472000 () Bool)

(assert (=> b!472000 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14877 _keys!1025)))))

(assert (=> b!472000 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14878 _values!833)))))

(declare-fun apply!330 (ListLongMap!7607 (_ BitVec 64)) V!18747)

(declare-fun get!7080 (ValueCell!6272 V!18747) V!18747)

(declare-fun dynLambda!920 (Int (_ BitVec 64)) V!18747)

(assert (=> b!472000 (= e!276697 (= (apply!330 lt!214174 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)) (get!7080 (select (arr!14526 _values!833) #b00000000000000000000000000000000) (dynLambda!920 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!472001 () Bool)

(assert (=> b!472001 (= e!276696 e!276700)))

(declare-fun c!56969 () Bool)

(declare-fun e!276699 () Bool)

(assert (=> b!472001 (= c!56969 e!276699)))

(declare-fun res!281977 () Bool)

(assert (=> b!472001 (=> (not res!281977) (not e!276699))))

(assert (=> b!472001 (= res!281977 (bvslt #b00000000000000000000000000000000 (size!14877 _keys!1025)))))

(declare-fun bm!30437 () Bool)

(assert (=> bm!30437 (= call!30440 (getCurrentListMapNoExtraKeys!2034 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!472002 () Bool)

(assert (=> b!472002 (= e!276699 (validKeyInArray!0 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472002 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!472003 () Bool)

(declare-fun isEmpty!583 (ListLongMap!7607) Bool)

(assert (=> b!472003 (= e!276698 (isEmpty!583 lt!214174))))

(declare-fun d!75463 () Bool)

(assert (=> d!75463 e!276696))

(declare-fun res!281974 () Bool)

(assert (=> d!75463 (=> (not res!281974) (not e!276696))))

(assert (=> d!75463 (= res!281974 (not (contains!2525 lt!214174 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75463 (= lt!214174 e!276702)))

(declare-fun c!56971 () Bool)

(assert (=> d!75463 (= c!56971 (bvsge #b00000000000000000000000000000000 (size!14877 _keys!1025)))))

(assert (=> d!75463 (validMask!0 mask!1365)))

(assert (=> d!75463 (= (getCurrentListMapNoExtraKeys!2034 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!214174)))

(declare-fun b!472004 () Bool)

(assert (=> b!472004 (= e!276700 e!276698)))

(declare-fun c!56970 () Bool)

(assert (=> b!472004 (= c!56970 (bvslt #b00000000000000000000000000000000 (size!14877 _keys!1025)))))

(declare-fun b!472005 () Bool)

(declare-fun lt!214176 () Unit!13851)

(declare-fun lt!214178 () Unit!13851)

(assert (=> b!472005 (= lt!214176 lt!214178)))

(declare-fun lt!214175 () (_ BitVec 64))

(declare-fun lt!214172 () ListLongMap!7607)

(declare-fun lt!214177 () V!18747)

(declare-fun lt!214173 () (_ BitVec 64))

(declare-fun +!1727 (ListLongMap!7607 tuple2!8692) ListLongMap!7607)

(assert (=> b!472005 (not (contains!2525 (+!1727 lt!214172 (tuple2!8693 lt!214175 lt!214177)) lt!214173))))

(declare-fun addStillNotContains!165 (ListLongMap!7607 (_ BitVec 64) V!18747 (_ BitVec 64)) Unit!13851)

(assert (=> b!472005 (= lt!214178 (addStillNotContains!165 lt!214172 lt!214175 lt!214177 lt!214173))))

(assert (=> b!472005 (= lt!214173 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!472005 (= lt!214177 (get!7080 (select (arr!14526 _values!833) #b00000000000000000000000000000000) (dynLambda!920 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!472005 (= lt!214175 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!472005 (= lt!214172 call!30440)))

(assert (=> b!472005 (= e!276701 (+!1727 call!30440 (tuple2!8693 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000) (get!7080 (select (arr!14526 _values!833) #b00000000000000000000000000000000) (dynLambda!920 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!75463 c!56971) b!471997))

(assert (= (and d!75463 (not c!56971)) b!471996))

(assert (= (and b!471996 c!56968) b!472005))

(assert (= (and b!471996 (not c!56968)) b!471999))

(assert (= (or b!472005 b!471999) bm!30437))

(assert (= (and d!75463 res!281974) b!471998))

(assert (= (and b!471998 res!281975) b!472001))

(assert (= (and b!472001 res!281977) b!472002))

(assert (= (and b!472001 c!56969) b!471994))

(assert (= (and b!472001 (not c!56969)) b!472004))

(assert (= (and b!471994 res!281976) b!472000))

(assert (= (and b!472004 c!56970) b!471995))

(assert (= (and b!472004 (not c!56970)) b!472003))

(declare-fun b_lambda!10183 () Bool)

(assert (=> (not b_lambda!10183) (not b!472000)))

(declare-fun t!14722 () Bool)

(declare-fun tb!3917 () Bool)

(assert (=> (and start!42284 (= defaultEntry!841 defaultEntry!841) t!14722) tb!3917))

(declare-fun result!7425 () Bool)

(assert (=> tb!3917 (= result!7425 tp_is_empty!13231)))

(assert (=> b!472000 t!14722))

(declare-fun b_and!20257 () Bool)

(assert (= b_and!20251 (and (=> t!14722 result!7425) b_and!20257)))

(declare-fun b_lambda!10185 () Bool)

(assert (=> (not b_lambda!10185) (not b!472005)))

(assert (=> b!472005 t!14722))

(declare-fun b_and!20259 () Bool)

(assert (= b_and!20257 (and (=> t!14722 result!7425) b_and!20259)))

(declare-fun m!454275 () Bool)

(assert (=> b!472000 m!454275))

(declare-fun m!454277 () Bool)

(assert (=> b!472000 m!454277))

(declare-fun m!454279 () Bool)

(assert (=> b!472000 m!454279))

(declare-fun m!454281 () Bool)

(assert (=> b!472000 m!454281))

(assert (=> b!472000 m!454275))

(assert (=> b!472000 m!454279))

(assert (=> b!472000 m!454281))

(declare-fun m!454283 () Bool)

(assert (=> b!472000 m!454283))

(declare-fun m!454285 () Bool)

(assert (=> b!471995 m!454285))

(assert (=> bm!30437 m!454285))

(declare-fun m!454287 () Bool)

(assert (=> b!472005 m!454287))

(declare-fun m!454289 () Bool)

(assert (=> b!472005 m!454289))

(declare-fun m!454291 () Bool)

(assert (=> b!472005 m!454291))

(assert (=> b!472005 m!454279))

(assert (=> b!472005 m!454287))

(assert (=> b!472005 m!454281))

(assert (=> b!472005 m!454275))

(assert (=> b!472005 m!454279))

(assert (=> b!472005 m!454281))

(assert (=> b!472005 m!454283))

(declare-fun m!454293 () Bool)

(assert (=> b!472005 m!454293))

(declare-fun m!454295 () Bool)

(assert (=> b!472003 m!454295))

(declare-fun m!454297 () Bool)

(assert (=> b!471998 m!454297))

(assert (=> b!471994 m!454275))

(assert (=> b!471994 m!454275))

(declare-fun m!454299 () Bool)

(assert (=> b!471994 m!454299))

(declare-fun m!454301 () Bool)

(assert (=> d!75463 m!454301))

(assert (=> d!75463 m!454229))

(assert (=> b!472002 m!454275))

(assert (=> b!472002 m!454275))

(declare-fun m!454303 () Bool)

(assert (=> b!472002 m!454303))

(assert (=> b!471996 m!454275))

(assert (=> b!471996 m!454275))

(assert (=> b!471996 m!454303))

(assert (=> b!471922 d!75463))

(declare-fun b!472008 () Bool)

(declare-fun e!276707 () Bool)

(declare-fun e!276704 () Bool)

(assert (=> b!472008 (= e!276707 e!276704)))

(assert (=> b!472008 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14877 _keys!1025)))))

(declare-fun res!281980 () Bool)

(declare-fun lt!214181 () ListLongMap!7607)

(assert (=> b!472008 (= res!281980 (contains!2525 lt!214181 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472008 (=> (not res!281980) (not e!276704))))

(declare-fun b!472009 () Bool)

(declare-fun e!276705 () Bool)

(assert (=> b!472009 (= e!276705 (= lt!214181 (getCurrentListMapNoExtraKeys!2034 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!472010 () Bool)

(declare-fun e!276709 () ListLongMap!7607)

(declare-fun e!276708 () ListLongMap!7607)

(assert (=> b!472010 (= e!276709 e!276708)))

(declare-fun c!56972 () Bool)

(assert (=> b!472010 (= c!56972 (validKeyInArray!0 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472011 () Bool)

(assert (=> b!472011 (= e!276709 (ListLongMap!7608 Nil!8756))))

(declare-fun b!472012 () Bool)

(declare-fun res!281979 () Bool)

(declare-fun e!276703 () Bool)

(assert (=> b!472012 (=> (not res!281979) (not e!276703))))

(assert (=> b!472012 (= res!281979 (not (contains!2525 lt!214181 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!472013 () Bool)

(declare-fun call!30441 () ListLongMap!7607)

(assert (=> b!472013 (= e!276708 call!30441)))

(declare-fun b!472014 () Bool)

(assert (=> b!472014 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14877 _keys!1025)))))

(assert (=> b!472014 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14878 _values!833)))))

(assert (=> b!472014 (= e!276704 (= (apply!330 lt!214181 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)) (get!7080 (select (arr!14526 _values!833) #b00000000000000000000000000000000) (dynLambda!920 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!472015 () Bool)

(assert (=> b!472015 (= e!276703 e!276707)))

(declare-fun c!56973 () Bool)

(declare-fun e!276706 () Bool)

(assert (=> b!472015 (= c!56973 e!276706)))

(declare-fun res!281981 () Bool)

(assert (=> b!472015 (=> (not res!281981) (not e!276706))))

(assert (=> b!472015 (= res!281981 (bvslt #b00000000000000000000000000000000 (size!14877 _keys!1025)))))

(declare-fun bm!30438 () Bool)

(assert (=> bm!30438 (= call!30441 (getCurrentListMapNoExtraKeys!2034 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!472016 () Bool)

(assert (=> b!472016 (= e!276706 (validKeyInArray!0 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472016 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!472017 () Bool)

(assert (=> b!472017 (= e!276705 (isEmpty!583 lt!214181))))

(declare-fun d!75465 () Bool)

(assert (=> d!75465 e!276703))

(declare-fun res!281978 () Bool)

(assert (=> d!75465 (=> (not res!281978) (not e!276703))))

(assert (=> d!75465 (= res!281978 (not (contains!2525 lt!214181 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75465 (= lt!214181 e!276709)))

(declare-fun c!56975 () Bool)

(assert (=> d!75465 (= c!56975 (bvsge #b00000000000000000000000000000000 (size!14877 _keys!1025)))))

(assert (=> d!75465 (validMask!0 mask!1365)))

(assert (=> d!75465 (= (getCurrentListMapNoExtraKeys!2034 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!214181)))

(declare-fun b!472018 () Bool)

(assert (=> b!472018 (= e!276707 e!276705)))

(declare-fun c!56974 () Bool)

(assert (=> b!472018 (= c!56974 (bvslt #b00000000000000000000000000000000 (size!14877 _keys!1025)))))

(declare-fun b!472019 () Bool)

(declare-fun lt!214183 () Unit!13851)

(declare-fun lt!214185 () Unit!13851)

(assert (=> b!472019 (= lt!214183 lt!214185)))

(declare-fun lt!214182 () (_ BitVec 64))

(declare-fun lt!214179 () ListLongMap!7607)

(declare-fun lt!214180 () (_ BitVec 64))

(declare-fun lt!214184 () V!18747)

(assert (=> b!472019 (not (contains!2525 (+!1727 lt!214179 (tuple2!8693 lt!214182 lt!214184)) lt!214180))))

(assert (=> b!472019 (= lt!214185 (addStillNotContains!165 lt!214179 lt!214182 lt!214184 lt!214180))))

(assert (=> b!472019 (= lt!214180 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!472019 (= lt!214184 (get!7080 (select (arr!14526 _values!833) #b00000000000000000000000000000000) (dynLambda!920 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!472019 (= lt!214182 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!472019 (= lt!214179 call!30441)))

(assert (=> b!472019 (= e!276708 (+!1727 call!30441 (tuple2!8693 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000) (get!7080 (select (arr!14526 _values!833) #b00000000000000000000000000000000) (dynLambda!920 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!75465 c!56975) b!472011))

(assert (= (and d!75465 (not c!56975)) b!472010))

(assert (= (and b!472010 c!56972) b!472019))

(assert (= (and b!472010 (not c!56972)) b!472013))

(assert (= (or b!472019 b!472013) bm!30438))

(assert (= (and d!75465 res!281978) b!472012))

(assert (= (and b!472012 res!281979) b!472015))

(assert (= (and b!472015 res!281981) b!472016))

(assert (= (and b!472015 c!56973) b!472008))

(assert (= (and b!472015 (not c!56973)) b!472018))

(assert (= (and b!472008 res!281980) b!472014))

(assert (= (and b!472018 c!56974) b!472009))

(assert (= (and b!472018 (not c!56974)) b!472017))

(declare-fun b_lambda!10187 () Bool)

(assert (=> (not b_lambda!10187) (not b!472014)))

(assert (=> b!472014 t!14722))

(declare-fun b_and!20261 () Bool)

(assert (= b_and!20259 (and (=> t!14722 result!7425) b_and!20261)))

(declare-fun b_lambda!10189 () Bool)

(assert (=> (not b_lambda!10189) (not b!472019)))

(assert (=> b!472019 t!14722))

(declare-fun b_and!20263 () Bool)

(assert (= b_and!20261 (and (=> t!14722 result!7425) b_and!20263)))

(assert (=> b!472014 m!454275))

(declare-fun m!454305 () Bool)

(assert (=> b!472014 m!454305))

(assert (=> b!472014 m!454279))

(assert (=> b!472014 m!454281))

(assert (=> b!472014 m!454275))

(assert (=> b!472014 m!454279))

(assert (=> b!472014 m!454281))

(assert (=> b!472014 m!454283))

(declare-fun m!454307 () Bool)

(assert (=> b!472009 m!454307))

(assert (=> bm!30438 m!454307))

(declare-fun m!454309 () Bool)

(assert (=> b!472019 m!454309))

(declare-fun m!454311 () Bool)

(assert (=> b!472019 m!454311))

(declare-fun m!454313 () Bool)

(assert (=> b!472019 m!454313))

(assert (=> b!472019 m!454279))

(assert (=> b!472019 m!454309))

(assert (=> b!472019 m!454281))

(assert (=> b!472019 m!454275))

(assert (=> b!472019 m!454279))

(assert (=> b!472019 m!454281))

(assert (=> b!472019 m!454283))

(declare-fun m!454315 () Bool)

(assert (=> b!472019 m!454315))

(declare-fun m!454317 () Bool)

(assert (=> b!472017 m!454317))

(declare-fun m!454319 () Bool)

(assert (=> b!472012 m!454319))

(assert (=> b!472008 m!454275))

(assert (=> b!472008 m!454275))

(declare-fun m!454321 () Bool)

(assert (=> b!472008 m!454321))

(declare-fun m!454323 () Bool)

(assert (=> d!75465 m!454323))

(assert (=> d!75465 m!454229))

(assert (=> b!472016 m!454275))

(assert (=> b!472016 m!454275))

(assert (=> b!472016 m!454303))

(assert (=> b!472010 m!454275))

(assert (=> b!472010 m!454275))

(assert (=> b!472010 m!454303))

(assert (=> b!471922 d!75465))

(declare-fun bm!30441 () Bool)

(declare-fun call!30444 () Bool)

(assert (=> bm!30441 (= call!30444 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!472028 () Bool)

(declare-fun e!276716 () Bool)

(declare-fun e!276717 () Bool)

(assert (=> b!472028 (= e!276716 e!276717)))

(declare-fun c!56978 () Bool)

(assert (=> b!472028 (= c!56978 (validKeyInArray!0 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472029 () Bool)

(assert (=> b!472029 (= e!276717 call!30444)))

(declare-fun d!75467 () Bool)

(declare-fun res!281987 () Bool)

(assert (=> d!75467 (=> res!281987 e!276716)))

(assert (=> d!75467 (= res!281987 (bvsge #b00000000000000000000000000000000 (size!14877 _keys!1025)))))

(assert (=> d!75467 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!276716)))

(declare-fun b!472030 () Bool)

(declare-fun e!276718 () Bool)

(assert (=> b!472030 (= e!276718 call!30444)))

(declare-fun b!472031 () Bool)

(assert (=> b!472031 (= e!276717 e!276718)))

(declare-fun lt!214194 () (_ BitVec 64))

(assert (=> b!472031 (= lt!214194 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!214192 () Unit!13851)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30208 (_ BitVec 64) (_ BitVec 32)) Unit!13851)

(assert (=> b!472031 (= lt!214192 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!214194 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30208 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!472031 (arrayContainsKey!0 _keys!1025 lt!214194 #b00000000000000000000000000000000)))

(declare-fun lt!214193 () Unit!13851)

(assert (=> b!472031 (= lt!214193 lt!214192)))

(declare-fun res!281986 () Bool)

(declare-datatypes ((SeekEntryResult!3503 0))(
  ( (MissingZero!3503 (index!16191 (_ BitVec 32))) (Found!3503 (index!16192 (_ BitVec 32))) (Intermediate!3503 (undefined!4315 Bool) (index!16193 (_ BitVec 32)) (x!44202 (_ BitVec 32))) (Undefined!3503) (MissingVacant!3503 (index!16194 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30208 (_ BitVec 32)) SeekEntryResult!3503)

(assert (=> b!472031 (= res!281986 (= (seekEntryOrOpen!0 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3503 #b00000000000000000000000000000000)))))

(assert (=> b!472031 (=> (not res!281986) (not e!276718))))

(assert (= (and d!75467 (not res!281987)) b!472028))

(assert (= (and b!472028 c!56978) b!472031))

(assert (= (and b!472028 (not c!56978)) b!472029))

(assert (= (and b!472031 res!281986) b!472030))

(assert (= (or b!472030 b!472029) bm!30441))

(declare-fun m!454325 () Bool)

(assert (=> bm!30441 m!454325))

(assert (=> b!472028 m!454275))

(assert (=> b!472028 m!454275))

(assert (=> b!472028 m!454303))

(assert (=> b!472031 m!454275))

(declare-fun m!454327 () Bool)

(assert (=> b!472031 m!454327))

(declare-fun m!454329 () Bool)

(assert (=> b!472031 m!454329))

(assert (=> b!472031 m!454275))

(declare-fun m!454331 () Bool)

(assert (=> b!472031 m!454331))

(assert (=> b!471926 d!75467))

(declare-fun b!472042 () Bool)

(declare-fun e!276729 () Bool)

(declare-fun e!276728 () Bool)

(assert (=> b!472042 (= e!276729 e!276728)))

(declare-fun c!56981 () Bool)

(assert (=> b!472042 (= c!56981 (validKeyInArray!0 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472043 () Bool)

(declare-fun e!276727 () Bool)

(assert (=> b!472043 (= e!276727 e!276729)))

(declare-fun res!281995 () Bool)

(assert (=> b!472043 (=> (not res!281995) (not e!276729))))

(declare-fun e!276730 () Bool)

(assert (=> b!472043 (= res!281995 (not e!276730))))

(declare-fun res!281996 () Bool)

(assert (=> b!472043 (=> (not res!281996) (not e!276730))))

(assert (=> b!472043 (= res!281996 (validKeyInArray!0 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472044 () Bool)

(declare-fun contains!2526 (List!8760 (_ BitVec 64)) Bool)

(assert (=> b!472044 (= e!276730 (contains!2526 Nil!8757 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75469 () Bool)

(declare-fun res!281994 () Bool)

(assert (=> d!75469 (=> res!281994 e!276727)))

(assert (=> d!75469 (= res!281994 (bvsge #b00000000000000000000000000000000 (size!14877 _keys!1025)))))

(assert (=> d!75469 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8757) e!276727)))

(declare-fun b!472045 () Bool)

(declare-fun call!30447 () Bool)

(assert (=> b!472045 (= e!276728 call!30447)))

(declare-fun bm!30444 () Bool)

(assert (=> bm!30444 (= call!30447 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56981 (Cons!8756 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000) Nil!8757) Nil!8757)))))

(declare-fun b!472046 () Bool)

(assert (=> b!472046 (= e!276728 call!30447)))

(assert (= (and d!75469 (not res!281994)) b!472043))

(assert (= (and b!472043 res!281996) b!472044))

(assert (= (and b!472043 res!281995) b!472042))

(assert (= (and b!472042 c!56981) b!472045))

(assert (= (and b!472042 (not c!56981)) b!472046))

(assert (= (or b!472045 b!472046) bm!30444))

(assert (=> b!472042 m!454275))

(assert (=> b!472042 m!454275))

(assert (=> b!472042 m!454303))

(assert (=> b!472043 m!454275))

(assert (=> b!472043 m!454275))

(assert (=> b!472043 m!454303))

(assert (=> b!472044 m!454275))

(assert (=> b!472044 m!454275))

(declare-fun m!454333 () Bool)

(assert (=> b!472044 m!454333))

(assert (=> bm!30444 m!454275))

(declare-fun m!454335 () Bool)

(assert (=> bm!30444 m!454335))

(assert (=> b!471923 d!75469))

(declare-fun d!75471 () Bool)

(assert (=> d!75471 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42284 d!75471))

(declare-fun d!75473 () Bool)

(assert (=> d!75473 (= (array_inv!10566 _keys!1025) (bvsge (size!14877 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42284 d!75473))

(declare-fun d!75475 () Bool)

(assert (=> d!75475 (= (array_inv!10567 _values!833) (bvsge (size!14878 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42284 d!75475))

(declare-fun b!472053 () Bool)

(declare-fun e!276736 () Bool)

(assert (=> b!472053 (= e!276736 tp_is_empty!13231)))

(declare-fun b!472054 () Bool)

(declare-fun e!276735 () Bool)

(assert (=> b!472054 (= e!276735 tp_is_empty!13231)))

(declare-fun mapNonEmpty!21562 () Bool)

(declare-fun mapRes!21562 () Bool)

(declare-fun tp!41452 () Bool)

(assert (=> mapNonEmpty!21562 (= mapRes!21562 (and tp!41452 e!276736))))

(declare-fun mapKey!21562 () (_ BitVec 32))

(declare-fun mapRest!21562 () (Array (_ BitVec 32) ValueCell!6272))

(declare-fun mapValue!21562 () ValueCell!6272)

(assert (=> mapNonEmpty!21562 (= mapRest!21553 (store mapRest!21562 mapKey!21562 mapValue!21562))))

(declare-fun condMapEmpty!21562 () Bool)

(declare-fun mapDefault!21562 () ValueCell!6272)

(assert (=> mapNonEmpty!21553 (= condMapEmpty!21562 (= mapRest!21553 ((as const (Array (_ BitVec 32) ValueCell!6272)) mapDefault!21562)))))

(assert (=> mapNonEmpty!21553 (= tp!41436 (and e!276735 mapRes!21562))))

(declare-fun mapIsEmpty!21562 () Bool)

(assert (=> mapIsEmpty!21562 mapRes!21562))

(assert (= (and mapNonEmpty!21553 condMapEmpty!21562) mapIsEmpty!21562))

(assert (= (and mapNonEmpty!21553 (not condMapEmpty!21562)) mapNonEmpty!21562))

(assert (= (and mapNonEmpty!21562 ((_ is ValueCellFull!6272) mapValue!21562)) b!472053))

(assert (= (and mapNonEmpty!21553 ((_ is ValueCellFull!6272) mapDefault!21562)) b!472054))

(declare-fun m!454337 () Bool)

(assert (=> mapNonEmpty!21562 m!454337))

(declare-fun b_lambda!10191 () Bool)

(assert (= b_lambda!10183 (or (and start!42284 b_free!11803) b_lambda!10191)))

(declare-fun b_lambda!10193 () Bool)

(assert (= b_lambda!10187 (or (and start!42284 b_free!11803) b_lambda!10193)))

(declare-fun b_lambda!10195 () Bool)

(assert (= b_lambda!10189 (or (and start!42284 b_free!11803) b_lambda!10195)))

(declare-fun b_lambda!10197 () Bool)

(assert (= b_lambda!10185 (or (and start!42284 b_free!11803) b_lambda!10197)))

(check-sat (not d!75463) (not b!472028) (not b!472005) (not b!472016) tp_is_empty!13231 (not b!472044) (not b!472002) (not bm!30437) (not b!471998) (not b_lambda!10197) (not mapNonEmpty!21562) (not b!471996) (not b!472003) (not bm!30441) b_and!20263 (not b!472012) (not b!472008) (not b!472000) (not b!471994) (not d!75465) (not b!472031) (not b!472010) (not b!471995) (not bm!30438) (not b_lambda!10195) (not b_next!11803) (not b!472017) (not b!472043) (not d!75461) (not b!472019) (not b!472042) (not b!472009) (not b_lambda!10193) (not b_lambda!10191) (not b!472014) (not bm!30444))
(check-sat b_and!20263 (not b_next!11803))
