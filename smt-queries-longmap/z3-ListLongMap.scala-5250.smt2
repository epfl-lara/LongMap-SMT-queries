; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70766 () Bool)

(assert start!70766)

(declare-fun b_free!12907 () Bool)

(declare-fun b_next!12907 () Bool)

(assert (=> start!70766 (= b_free!12907 (not b_next!12907))))

(declare-fun tp!45457 () Bool)

(declare-fun b_and!21759 () Bool)

(assert (=> start!70766 (= tp!45457 b_and!21759)))

(declare-fun b!821092 () Bool)

(declare-fun res!560013 () Bool)

(declare-fun e!456227 () Bool)

(assert (=> b!821092 (=> (not res!560013) (not e!456227))))

(declare-datatypes ((array!45433 0))(
  ( (array!45434 (arr!21765 (Array (_ BitVec 32) (_ BitVec 64))) (size!22185 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45433)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24491 0))(
  ( (V!24492 (val!7356 Int)) )
))
(declare-datatypes ((ValueCell!6893 0))(
  ( (ValueCellFull!6893 (v!9786 V!24491)) (EmptyCell!6893) )
))
(declare-datatypes ((array!45435 0))(
  ( (array!45436 (arr!21766 (Array (_ BitVec 32) ValueCell!6893)) (size!22186 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45435)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!821092 (= res!560013 (and (= (size!22186 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22185 _keys!976) (size!22186 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821093 () Bool)

(declare-fun e!456225 () Bool)

(assert (=> b!821093 (= e!456225 (bvsle #b00000000000000000000000000000000 (size!22185 _keys!976)))))

(declare-fun mapNonEmpty!23527 () Bool)

(declare-fun mapRes!23527 () Bool)

(declare-fun tp!45456 () Bool)

(declare-fun e!456224 () Bool)

(assert (=> mapNonEmpty!23527 (= mapRes!23527 (and tp!45456 e!456224))))

(declare-fun mapKey!23527 () (_ BitVec 32))

(declare-fun mapValue!23527 () ValueCell!6893)

(declare-fun mapRest!23527 () (Array (_ BitVec 32) ValueCell!6893))

(assert (=> mapNonEmpty!23527 (= (arr!21766 _values!788) (store mapRest!23527 mapKey!23527 mapValue!23527))))

(declare-fun b!821094 () Bool)

(declare-fun e!456221 () Bool)

(declare-fun tp_is_empty!14617 () Bool)

(assert (=> b!821094 (= e!456221 tp_is_empty!14617)))

(declare-datatypes ((tuple2!9604 0))(
  ( (tuple2!9605 (_1!4813 (_ BitVec 64)) (_2!4813 V!24491)) )
))
(declare-datatypes ((List!15401 0))(
  ( (Nil!15398) (Cons!15397 (h!16532 tuple2!9604) (t!21724 List!15401)) )
))
(declare-datatypes ((ListLongMap!8429 0))(
  ( (ListLongMap!8430 (toList!4230 List!15401)) )
))
(declare-fun lt!368905 () ListLongMap!8429)

(declare-fun lt!368903 () ListLongMap!8429)

(declare-fun zeroValueAfter!34 () V!24491)

(declare-fun b!821095 () Bool)

(declare-fun e!456222 () Bool)

(declare-fun +!1865 (ListLongMap!8429 tuple2!9604) ListLongMap!8429)

(assert (=> b!821095 (= e!456222 (= lt!368903 (+!1865 lt!368905 (tuple2!9605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun mapIsEmpty!23527 () Bool)

(assert (=> mapIsEmpty!23527 mapRes!23527))

(declare-fun b!821096 () Bool)

(declare-fun res!560012 () Bool)

(assert (=> b!821096 (=> (not res!560012) (not e!456227))))

(declare-datatypes ((List!15402 0))(
  ( (Nil!15399) (Cons!15398 (h!16533 (_ BitVec 64)) (t!21725 List!15402)) )
))
(declare-fun arrayNoDuplicates!0 (array!45433 (_ BitVec 32) List!15402) Bool)

(assert (=> b!821096 (= res!560012 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15399))))

(declare-fun b!821097 () Bool)

(declare-fun e!456220 () Bool)

(assert (=> b!821097 (= e!456220 e!456225)))

(declare-fun res!560011 () Bool)

(assert (=> b!821097 (=> res!560011 e!456225)))

(declare-fun lt!368904 () tuple2!9604)

(declare-fun lt!368906 () tuple2!9604)

(assert (=> b!821097 (= res!560011 (not (= lt!368903 (+!1865 (+!1865 lt!368905 lt!368906) lt!368904))))))

(declare-fun lt!368901 () ListLongMap!8429)

(declare-fun lt!368902 () ListLongMap!8429)

(assert (=> b!821097 (= (+!1865 lt!368901 lt!368904) (+!1865 lt!368902 lt!368904))))

(declare-fun zeroValueBefore!34 () V!24491)

(declare-datatypes ((Unit!28010 0))(
  ( (Unit!28011) )
))
(declare-fun lt!368899 () Unit!28010)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!201 (ListLongMap!8429 (_ BitVec 64) V!24491 V!24491) Unit!28010)

(assert (=> b!821097 (= lt!368899 (addSameAsAddTwiceSameKeyDiffValues!201 lt!368901 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!821097 (= lt!368904 (tuple2!9605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!821097 e!456222))

(declare-fun res!560008 () Bool)

(assert (=> b!821097 (=> (not res!560008) (not e!456222))))

(declare-fun lt!368907 () ListLongMap!8429)

(assert (=> b!821097 (= res!560008 (= lt!368907 lt!368902))))

(assert (=> b!821097 (= lt!368902 (+!1865 lt!368901 lt!368906))))

(assert (=> b!821097 (= lt!368906 (tuple2!9605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun minValue!754 () V!24491)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2414 (array!45433 array!45435 (_ BitVec 32) (_ BitVec 32) V!24491 V!24491 (_ BitVec 32) Int) ListLongMap!8429)

(assert (=> b!821097 (= lt!368903 (getCurrentListMap!2414 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821097 (= lt!368907 (getCurrentListMap!2414 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821098 () Bool)

(declare-fun e!456226 () Bool)

(assert (=> b!821098 (= e!456226 (and e!456221 mapRes!23527))))

(declare-fun condMapEmpty!23527 () Bool)

(declare-fun mapDefault!23527 () ValueCell!6893)

(assert (=> b!821098 (= condMapEmpty!23527 (= (arr!21766 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6893)) mapDefault!23527)))))

(declare-fun res!560007 () Bool)

(assert (=> start!70766 (=> (not res!560007) (not e!456227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70766 (= res!560007 (validMask!0 mask!1312))))

(assert (=> start!70766 e!456227))

(assert (=> start!70766 tp_is_empty!14617))

(declare-fun array_inv!17423 (array!45433) Bool)

(assert (=> start!70766 (array_inv!17423 _keys!976)))

(assert (=> start!70766 true))

(declare-fun array_inv!17424 (array!45435) Bool)

(assert (=> start!70766 (and (array_inv!17424 _values!788) e!456226)))

(assert (=> start!70766 tp!45457))

(declare-fun b!821099 () Bool)

(assert (=> b!821099 (= e!456224 tp_is_empty!14617)))

(declare-fun b!821100 () Bool)

(declare-fun res!560010 () Bool)

(assert (=> b!821100 (=> (not res!560010) (not e!456227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45433 (_ BitVec 32)) Bool)

(assert (=> b!821100 (= res!560010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821101 () Bool)

(assert (=> b!821101 (= e!456227 (not e!456220))))

(declare-fun res!560009 () Bool)

(assert (=> b!821101 (=> res!560009 e!456220)))

(assert (=> b!821101 (= res!560009 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!821101 (= lt!368901 lt!368905)))

(declare-fun lt!368900 () Unit!28010)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!409 (array!45433 array!45435 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24491 V!24491 V!24491 V!24491 (_ BitVec 32) Int) Unit!28010)

(assert (=> b!821101 (= lt!368900 (lemmaNoChangeToArrayThenSameMapNoExtras!409 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2321 (array!45433 array!45435 (_ BitVec 32) (_ BitVec 32) V!24491 V!24491 (_ BitVec 32) Int) ListLongMap!8429)

(assert (=> b!821101 (= lt!368905 (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821101 (= lt!368901 (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70766 res!560007) b!821092))

(assert (= (and b!821092 res!560013) b!821100))

(assert (= (and b!821100 res!560010) b!821096))

(assert (= (and b!821096 res!560012) b!821101))

(assert (= (and b!821101 (not res!560009)) b!821097))

(assert (= (and b!821097 res!560008) b!821095))

(assert (= (and b!821097 (not res!560011)) b!821093))

(assert (= (and b!821098 condMapEmpty!23527) mapIsEmpty!23527))

(assert (= (and b!821098 (not condMapEmpty!23527)) mapNonEmpty!23527))

(get-info :version)

(assert (= (and mapNonEmpty!23527 ((_ is ValueCellFull!6893) mapValue!23527)) b!821099))

(assert (= (and b!821098 ((_ is ValueCellFull!6893) mapDefault!23527)) b!821094))

(assert (= start!70766 b!821098))

(declare-fun m!763353 () Bool)

(assert (=> b!821101 m!763353))

(declare-fun m!763355 () Bool)

(assert (=> b!821101 m!763355))

(declare-fun m!763357 () Bool)

(assert (=> b!821101 m!763357))

(declare-fun m!763359 () Bool)

(assert (=> b!821095 m!763359))

(declare-fun m!763361 () Bool)

(assert (=> start!70766 m!763361))

(declare-fun m!763363 () Bool)

(assert (=> start!70766 m!763363))

(declare-fun m!763365 () Bool)

(assert (=> start!70766 m!763365))

(declare-fun m!763367 () Bool)

(assert (=> b!821097 m!763367))

(assert (=> b!821097 m!763367))

(declare-fun m!763369 () Bool)

(assert (=> b!821097 m!763369))

(declare-fun m!763371 () Bool)

(assert (=> b!821097 m!763371))

(declare-fun m!763373 () Bool)

(assert (=> b!821097 m!763373))

(declare-fun m!763375 () Bool)

(assert (=> b!821097 m!763375))

(declare-fun m!763377 () Bool)

(assert (=> b!821097 m!763377))

(declare-fun m!763379 () Bool)

(assert (=> b!821097 m!763379))

(declare-fun m!763381 () Bool)

(assert (=> b!821097 m!763381))

(declare-fun m!763383 () Bool)

(assert (=> b!821096 m!763383))

(declare-fun m!763385 () Bool)

(assert (=> b!821100 m!763385))

(declare-fun m!763387 () Bool)

(assert (=> mapNonEmpty!23527 m!763387))

(check-sat (not start!70766) (not b!821097) (not b!821095) (not b!821100) tp_is_empty!14617 (not mapNonEmpty!23527) (not b!821101) (not b!821096) b_and!21759 (not b_next!12907))
(check-sat b_and!21759 (not b_next!12907))
(get-model)

(declare-fun b!821172 () Bool)

(declare-fun e!456286 () Bool)

(declare-fun contains!4140 (List!15402 (_ BitVec 64)) Bool)

(assert (=> b!821172 (= e!456286 (contains!4140 Nil!15399 (select (arr!21765 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105025 () Bool)

(declare-fun res!560064 () Bool)

(declare-fun e!456285 () Bool)

(assert (=> d!105025 (=> res!560064 e!456285)))

(assert (=> d!105025 (= res!560064 (bvsge #b00000000000000000000000000000000 (size!22185 _keys!976)))))

(assert (=> d!105025 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15399) e!456285)))

(declare-fun b!821173 () Bool)

(declare-fun e!456284 () Bool)

(declare-fun e!456287 () Bool)

(assert (=> b!821173 (= e!456284 e!456287)))

(declare-fun c!89448 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!821173 (= c!89448 (validKeyInArray!0 (select (arr!21765 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821174 () Bool)

(assert (=> b!821174 (= e!456285 e!456284)))

(declare-fun res!560062 () Bool)

(assert (=> b!821174 (=> (not res!560062) (not e!456284))))

(assert (=> b!821174 (= res!560062 (not e!456286))))

(declare-fun res!560063 () Bool)

(assert (=> b!821174 (=> (not res!560063) (not e!456286))))

(assert (=> b!821174 (= res!560063 (validKeyInArray!0 (select (arr!21765 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821175 () Bool)

(declare-fun call!35722 () Bool)

(assert (=> b!821175 (= e!456287 call!35722)))

(declare-fun b!821176 () Bool)

(assert (=> b!821176 (= e!456287 call!35722)))

(declare-fun bm!35719 () Bool)

(assert (=> bm!35719 (= call!35722 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89448 (Cons!15398 (select (arr!21765 _keys!976) #b00000000000000000000000000000000) Nil!15399) Nil!15399)))))

(assert (= (and d!105025 (not res!560064)) b!821174))

(assert (= (and b!821174 res!560063) b!821172))

(assert (= (and b!821174 res!560062) b!821173))

(assert (= (and b!821173 c!89448) b!821175))

(assert (= (and b!821173 (not c!89448)) b!821176))

(assert (= (or b!821175 b!821176) bm!35719))

(declare-fun m!763461 () Bool)

(assert (=> b!821172 m!763461))

(assert (=> b!821172 m!763461))

(declare-fun m!763463 () Bool)

(assert (=> b!821172 m!763463))

(assert (=> b!821173 m!763461))

(assert (=> b!821173 m!763461))

(declare-fun m!763465 () Bool)

(assert (=> b!821173 m!763465))

(assert (=> b!821174 m!763461))

(assert (=> b!821174 m!763461))

(assert (=> b!821174 m!763465))

(assert (=> bm!35719 m!763461))

(declare-fun m!763467 () Bool)

(assert (=> bm!35719 m!763467))

(assert (=> b!821096 d!105025))

(declare-fun d!105027 () Bool)

(declare-fun e!456290 () Bool)

(assert (=> d!105027 e!456290))

(declare-fun res!560069 () Bool)

(assert (=> d!105027 (=> (not res!560069) (not e!456290))))

(declare-fun lt!368971 () ListLongMap!8429)

(declare-fun contains!4141 (ListLongMap!8429 (_ BitVec 64)) Bool)

(assert (=> d!105027 (= res!560069 (contains!4141 lt!368971 (_1!4813 lt!368904)))))

(declare-fun lt!368972 () List!15401)

(assert (=> d!105027 (= lt!368971 (ListLongMap!8430 lt!368972))))

(declare-fun lt!368970 () Unit!28010)

(declare-fun lt!368973 () Unit!28010)

(assert (=> d!105027 (= lt!368970 lt!368973)))

(declare-datatypes ((Option!410 0))(
  ( (Some!409 (v!9789 V!24491)) (None!408) )
))
(declare-fun getValueByKey!404 (List!15401 (_ BitVec 64)) Option!410)

(assert (=> d!105027 (= (getValueByKey!404 lt!368972 (_1!4813 lt!368904)) (Some!409 (_2!4813 lt!368904)))))

(declare-fun lemmaContainsTupThenGetReturnValue!218 (List!15401 (_ BitVec 64) V!24491) Unit!28010)

(assert (=> d!105027 (= lt!368973 (lemmaContainsTupThenGetReturnValue!218 lt!368972 (_1!4813 lt!368904) (_2!4813 lt!368904)))))

(declare-fun insertStrictlySorted!257 (List!15401 (_ BitVec 64) V!24491) List!15401)

(assert (=> d!105027 (= lt!368972 (insertStrictlySorted!257 (toList!4230 lt!368901) (_1!4813 lt!368904) (_2!4813 lt!368904)))))

(assert (=> d!105027 (= (+!1865 lt!368901 lt!368904) lt!368971)))

(declare-fun b!821181 () Bool)

(declare-fun res!560070 () Bool)

(assert (=> b!821181 (=> (not res!560070) (not e!456290))))

(assert (=> b!821181 (= res!560070 (= (getValueByKey!404 (toList!4230 lt!368971) (_1!4813 lt!368904)) (Some!409 (_2!4813 lt!368904))))))

(declare-fun b!821182 () Bool)

(declare-fun contains!4142 (List!15401 tuple2!9604) Bool)

(assert (=> b!821182 (= e!456290 (contains!4142 (toList!4230 lt!368971) lt!368904))))

(assert (= (and d!105027 res!560069) b!821181))

(assert (= (and b!821181 res!560070) b!821182))

(declare-fun m!763469 () Bool)

(assert (=> d!105027 m!763469))

(declare-fun m!763471 () Bool)

(assert (=> d!105027 m!763471))

(declare-fun m!763473 () Bool)

(assert (=> d!105027 m!763473))

(declare-fun m!763475 () Bool)

(assert (=> d!105027 m!763475))

(declare-fun m!763477 () Bool)

(assert (=> b!821181 m!763477))

(declare-fun m!763479 () Bool)

(assert (=> b!821182 m!763479))

(assert (=> b!821097 d!105027))

(declare-fun d!105029 () Bool)

(declare-fun e!456291 () Bool)

(assert (=> d!105029 e!456291))

(declare-fun res!560071 () Bool)

(assert (=> d!105029 (=> (not res!560071) (not e!456291))))

(declare-fun lt!368975 () ListLongMap!8429)

(assert (=> d!105029 (= res!560071 (contains!4141 lt!368975 (_1!4813 lt!368906)))))

(declare-fun lt!368976 () List!15401)

(assert (=> d!105029 (= lt!368975 (ListLongMap!8430 lt!368976))))

(declare-fun lt!368974 () Unit!28010)

(declare-fun lt!368977 () Unit!28010)

(assert (=> d!105029 (= lt!368974 lt!368977)))

(assert (=> d!105029 (= (getValueByKey!404 lt!368976 (_1!4813 lt!368906)) (Some!409 (_2!4813 lt!368906)))))

(assert (=> d!105029 (= lt!368977 (lemmaContainsTupThenGetReturnValue!218 lt!368976 (_1!4813 lt!368906) (_2!4813 lt!368906)))))

(assert (=> d!105029 (= lt!368976 (insertStrictlySorted!257 (toList!4230 lt!368901) (_1!4813 lt!368906) (_2!4813 lt!368906)))))

(assert (=> d!105029 (= (+!1865 lt!368901 lt!368906) lt!368975)))

(declare-fun b!821183 () Bool)

(declare-fun res!560072 () Bool)

(assert (=> b!821183 (=> (not res!560072) (not e!456291))))

(assert (=> b!821183 (= res!560072 (= (getValueByKey!404 (toList!4230 lt!368975) (_1!4813 lt!368906)) (Some!409 (_2!4813 lt!368906))))))

(declare-fun b!821184 () Bool)

(assert (=> b!821184 (= e!456291 (contains!4142 (toList!4230 lt!368975) lt!368906))))

(assert (= (and d!105029 res!560071) b!821183))

(assert (= (and b!821183 res!560072) b!821184))

(declare-fun m!763481 () Bool)

(assert (=> d!105029 m!763481))

(declare-fun m!763483 () Bool)

(assert (=> d!105029 m!763483))

(declare-fun m!763485 () Bool)

(assert (=> d!105029 m!763485))

(declare-fun m!763487 () Bool)

(assert (=> d!105029 m!763487))

(declare-fun m!763489 () Bool)

(assert (=> b!821183 m!763489))

(declare-fun m!763491 () Bool)

(assert (=> b!821184 m!763491))

(assert (=> b!821097 d!105029))

(declare-fun d!105031 () Bool)

(declare-fun e!456292 () Bool)

(assert (=> d!105031 e!456292))

(declare-fun res!560073 () Bool)

(assert (=> d!105031 (=> (not res!560073) (not e!456292))))

(declare-fun lt!368979 () ListLongMap!8429)

(assert (=> d!105031 (= res!560073 (contains!4141 lt!368979 (_1!4813 lt!368904)))))

(declare-fun lt!368980 () List!15401)

(assert (=> d!105031 (= lt!368979 (ListLongMap!8430 lt!368980))))

(declare-fun lt!368978 () Unit!28010)

(declare-fun lt!368981 () Unit!28010)

(assert (=> d!105031 (= lt!368978 lt!368981)))

(assert (=> d!105031 (= (getValueByKey!404 lt!368980 (_1!4813 lt!368904)) (Some!409 (_2!4813 lt!368904)))))

(assert (=> d!105031 (= lt!368981 (lemmaContainsTupThenGetReturnValue!218 lt!368980 (_1!4813 lt!368904) (_2!4813 lt!368904)))))

(assert (=> d!105031 (= lt!368980 (insertStrictlySorted!257 (toList!4230 (+!1865 lt!368905 lt!368906)) (_1!4813 lt!368904) (_2!4813 lt!368904)))))

(assert (=> d!105031 (= (+!1865 (+!1865 lt!368905 lt!368906) lt!368904) lt!368979)))

(declare-fun b!821185 () Bool)

(declare-fun res!560074 () Bool)

(assert (=> b!821185 (=> (not res!560074) (not e!456292))))

(assert (=> b!821185 (= res!560074 (= (getValueByKey!404 (toList!4230 lt!368979) (_1!4813 lt!368904)) (Some!409 (_2!4813 lt!368904))))))

(declare-fun b!821186 () Bool)

(assert (=> b!821186 (= e!456292 (contains!4142 (toList!4230 lt!368979) lt!368904))))

(assert (= (and d!105031 res!560073) b!821185))

(assert (= (and b!821185 res!560074) b!821186))

(declare-fun m!763493 () Bool)

(assert (=> d!105031 m!763493))

(declare-fun m!763495 () Bool)

(assert (=> d!105031 m!763495))

(declare-fun m!763497 () Bool)

(assert (=> d!105031 m!763497))

(declare-fun m!763499 () Bool)

(assert (=> d!105031 m!763499))

(declare-fun m!763501 () Bool)

(assert (=> b!821185 m!763501))

(declare-fun m!763503 () Bool)

(assert (=> b!821186 m!763503))

(assert (=> b!821097 d!105031))

(declare-fun d!105033 () Bool)

(declare-fun e!456293 () Bool)

(assert (=> d!105033 e!456293))

(declare-fun res!560075 () Bool)

(assert (=> d!105033 (=> (not res!560075) (not e!456293))))

(declare-fun lt!368983 () ListLongMap!8429)

(assert (=> d!105033 (= res!560075 (contains!4141 lt!368983 (_1!4813 lt!368906)))))

(declare-fun lt!368984 () List!15401)

(assert (=> d!105033 (= lt!368983 (ListLongMap!8430 lt!368984))))

(declare-fun lt!368982 () Unit!28010)

(declare-fun lt!368985 () Unit!28010)

(assert (=> d!105033 (= lt!368982 lt!368985)))

(assert (=> d!105033 (= (getValueByKey!404 lt!368984 (_1!4813 lt!368906)) (Some!409 (_2!4813 lt!368906)))))

(assert (=> d!105033 (= lt!368985 (lemmaContainsTupThenGetReturnValue!218 lt!368984 (_1!4813 lt!368906) (_2!4813 lt!368906)))))

(assert (=> d!105033 (= lt!368984 (insertStrictlySorted!257 (toList!4230 lt!368905) (_1!4813 lt!368906) (_2!4813 lt!368906)))))

(assert (=> d!105033 (= (+!1865 lt!368905 lt!368906) lt!368983)))

(declare-fun b!821187 () Bool)

(declare-fun res!560076 () Bool)

(assert (=> b!821187 (=> (not res!560076) (not e!456293))))

(assert (=> b!821187 (= res!560076 (= (getValueByKey!404 (toList!4230 lt!368983) (_1!4813 lt!368906)) (Some!409 (_2!4813 lt!368906))))))

(declare-fun b!821188 () Bool)

(assert (=> b!821188 (= e!456293 (contains!4142 (toList!4230 lt!368983) lt!368906))))

(assert (= (and d!105033 res!560075) b!821187))

(assert (= (and b!821187 res!560076) b!821188))

(declare-fun m!763505 () Bool)

(assert (=> d!105033 m!763505))

(declare-fun m!763507 () Bool)

(assert (=> d!105033 m!763507))

(declare-fun m!763509 () Bool)

(assert (=> d!105033 m!763509))

(declare-fun m!763511 () Bool)

(assert (=> d!105033 m!763511))

(declare-fun m!763513 () Bool)

(assert (=> b!821187 m!763513))

(declare-fun m!763515 () Bool)

(assert (=> b!821188 m!763515))

(assert (=> b!821097 d!105033))

(declare-fun b!821231 () Bool)

(declare-fun e!456321 () Bool)

(declare-fun e!456328 () Bool)

(assert (=> b!821231 (= e!456321 e!456328)))

(declare-fun res!560100 () Bool)

(declare-fun call!35737 () Bool)

(assert (=> b!821231 (= res!560100 call!35737)))

(assert (=> b!821231 (=> (not res!560100) (not e!456328))))

(declare-fun call!35738 () ListLongMap!8429)

(declare-fun c!89463 () Bool)

(declare-fun c!89465 () Bool)

(declare-fun call!35739 () ListLongMap!8429)

(declare-fun bm!35734 () Bool)

(declare-fun call!35740 () ListLongMap!8429)

(declare-fun call!35742 () ListLongMap!8429)

(assert (=> bm!35734 (= call!35739 (+!1865 (ite c!89463 call!35742 (ite c!89465 call!35740 call!35738)) (ite (or c!89463 c!89465) (tuple2!9605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!821232 () Bool)

(declare-fun e!456331 () Bool)

(declare-fun e!456325 () Bool)

(assert (=> b!821232 (= e!456331 e!456325)))

(declare-fun res!560102 () Bool)

(declare-fun call!35743 () Bool)

(assert (=> b!821232 (= res!560102 call!35743)))

(assert (=> b!821232 (=> (not res!560102) (not e!456325))))

(declare-fun bm!35735 () Bool)

(declare-fun call!35741 () ListLongMap!8429)

(assert (=> bm!35735 (= call!35741 call!35739)))

(declare-fun bm!35736 () Bool)

(assert (=> bm!35736 (= call!35740 call!35742)))

(declare-fun bm!35737 () Bool)

(declare-fun lt!369045 () ListLongMap!8429)

(assert (=> bm!35737 (= call!35737 (contains!4141 lt!369045 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!821233 () Bool)

(declare-fun e!456322 () Unit!28010)

(declare-fun lt!369034 () Unit!28010)

(assert (=> b!821233 (= e!456322 lt!369034)))

(declare-fun lt!369040 () ListLongMap!8429)

(assert (=> b!821233 (= lt!369040 (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369050 () (_ BitVec 64))

(assert (=> b!821233 (= lt!369050 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!369042 () (_ BitVec 64))

(assert (=> b!821233 (= lt!369042 (select (arr!21765 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!369047 () Unit!28010)

(declare-fun addStillContains!309 (ListLongMap!8429 (_ BitVec 64) V!24491 (_ BitVec 64)) Unit!28010)

(assert (=> b!821233 (= lt!369047 (addStillContains!309 lt!369040 lt!369050 zeroValueBefore!34 lt!369042))))

(assert (=> b!821233 (contains!4141 (+!1865 lt!369040 (tuple2!9605 lt!369050 zeroValueBefore!34)) lt!369042)))

(declare-fun lt!369030 () Unit!28010)

(assert (=> b!821233 (= lt!369030 lt!369047)))

(declare-fun lt!369032 () ListLongMap!8429)

(assert (=> b!821233 (= lt!369032 (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369039 () (_ BitVec 64))

(assert (=> b!821233 (= lt!369039 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!369044 () (_ BitVec 64))

(assert (=> b!821233 (= lt!369044 (select (arr!21765 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!369036 () Unit!28010)

(declare-fun addApplyDifferent!309 (ListLongMap!8429 (_ BitVec 64) V!24491 (_ BitVec 64)) Unit!28010)

(assert (=> b!821233 (= lt!369036 (addApplyDifferent!309 lt!369032 lt!369039 minValue!754 lt!369044))))

(declare-fun apply!355 (ListLongMap!8429 (_ BitVec 64)) V!24491)

(assert (=> b!821233 (= (apply!355 (+!1865 lt!369032 (tuple2!9605 lt!369039 minValue!754)) lt!369044) (apply!355 lt!369032 lt!369044))))

(declare-fun lt!369037 () Unit!28010)

(assert (=> b!821233 (= lt!369037 lt!369036)))

(declare-fun lt!369035 () ListLongMap!8429)

(assert (=> b!821233 (= lt!369035 (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369049 () (_ BitVec 64))

(assert (=> b!821233 (= lt!369049 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!369038 () (_ BitVec 64))

(assert (=> b!821233 (= lt!369038 (select (arr!21765 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!369048 () Unit!28010)

(assert (=> b!821233 (= lt!369048 (addApplyDifferent!309 lt!369035 lt!369049 zeroValueBefore!34 lt!369038))))

(assert (=> b!821233 (= (apply!355 (+!1865 lt!369035 (tuple2!9605 lt!369049 zeroValueBefore!34)) lt!369038) (apply!355 lt!369035 lt!369038))))

(declare-fun lt!369033 () Unit!28010)

(assert (=> b!821233 (= lt!369033 lt!369048)))

(declare-fun lt!369031 () ListLongMap!8429)

(assert (=> b!821233 (= lt!369031 (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369046 () (_ BitVec 64))

(assert (=> b!821233 (= lt!369046 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!369041 () (_ BitVec 64))

(assert (=> b!821233 (= lt!369041 (select (arr!21765 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!821233 (= lt!369034 (addApplyDifferent!309 lt!369031 lt!369046 minValue!754 lt!369041))))

(assert (=> b!821233 (= (apply!355 (+!1865 lt!369031 (tuple2!9605 lt!369046 minValue!754)) lt!369041) (apply!355 lt!369031 lt!369041))))

(declare-fun b!821234 () Bool)

(declare-fun e!456329 () Bool)

(declare-fun e!456323 () Bool)

(assert (=> b!821234 (= e!456329 e!456323)))

(declare-fun res!560096 () Bool)

(assert (=> b!821234 (=> (not res!560096) (not e!456323))))

(assert (=> b!821234 (= res!560096 (contains!4141 lt!369045 (select (arr!21765 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821234 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22185 _keys!976)))))

(declare-fun b!821235 () Bool)

(declare-fun Unit!28016 () Unit!28010)

(assert (=> b!821235 (= e!456322 Unit!28016)))

(declare-fun b!821237 () Bool)

(assert (=> b!821237 (= e!456325 (= (apply!355 lt!369045 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!821238 () Bool)

(declare-fun e!456320 () ListLongMap!8429)

(assert (=> b!821238 (= e!456320 call!35738)))

(declare-fun bm!35738 () Bool)

(assert (=> bm!35738 (= call!35738 call!35740)))

(declare-fun b!821239 () Bool)

(declare-fun get!11607 (ValueCell!6893 V!24491) V!24491)

(declare-fun dynLambda!963 (Int (_ BitVec 64)) V!24491)

(assert (=> b!821239 (= e!456323 (= (apply!355 lt!369045 (select (arr!21765 _keys!976) #b00000000000000000000000000000000)) (get!11607 (select (arr!21766 _values!788) #b00000000000000000000000000000000) (dynLambda!963 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!821239 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22186 _values!788)))))

(assert (=> b!821239 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22185 _keys!976)))))

(declare-fun b!821240 () Bool)

(declare-fun e!456324 () ListLongMap!8429)

(assert (=> b!821240 (= e!456324 (+!1865 call!35739 (tuple2!9605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!821241 () Bool)

(assert (=> b!821241 (= e!456320 call!35741)))

(declare-fun b!821242 () Bool)

(assert (=> b!821242 (= e!456321 (not call!35737))))

(declare-fun b!821243 () Bool)

(declare-fun e!456327 () Bool)

(assert (=> b!821243 (= e!456327 (validKeyInArray!0 (select (arr!21765 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35739 () Bool)

(assert (=> bm!35739 (= call!35743 (contains!4141 lt!369045 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!821244 () Bool)

(declare-fun e!456326 () ListLongMap!8429)

(assert (=> b!821244 (= e!456324 e!456326)))

(assert (=> b!821244 (= c!89465 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!821245 () Bool)

(declare-fun res!560098 () Bool)

(declare-fun e!456332 () Bool)

(assert (=> b!821245 (=> (not res!560098) (not e!456332))))

(assert (=> b!821245 (= res!560098 e!456329)))

(declare-fun res!560095 () Bool)

(assert (=> b!821245 (=> res!560095 e!456329)))

(assert (=> b!821245 (= res!560095 (not e!456327))))

(declare-fun res!560097 () Bool)

(assert (=> b!821245 (=> (not res!560097) (not e!456327))))

(assert (=> b!821245 (= res!560097 (bvslt #b00000000000000000000000000000000 (size!22185 _keys!976)))))

(declare-fun b!821246 () Bool)

(assert (=> b!821246 (= e!456328 (= (apply!355 lt!369045 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!821247 () Bool)

(declare-fun c!89461 () Bool)

(assert (=> b!821247 (= c!89461 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!821247 (= e!456326 e!456320)))

(declare-fun b!821236 () Bool)

(declare-fun res!560103 () Bool)

(assert (=> b!821236 (=> (not res!560103) (not e!456332))))

(assert (=> b!821236 (= res!560103 e!456331)))

(declare-fun c!89462 () Bool)

(assert (=> b!821236 (= c!89462 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!105035 () Bool)

(assert (=> d!105035 e!456332))

(declare-fun res!560101 () Bool)

(assert (=> d!105035 (=> (not res!560101) (not e!456332))))

(assert (=> d!105035 (= res!560101 (or (bvsge #b00000000000000000000000000000000 (size!22185 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22185 _keys!976)))))))

(declare-fun lt!369043 () ListLongMap!8429)

(assert (=> d!105035 (= lt!369045 lt!369043)))

(declare-fun lt!369051 () Unit!28010)

(assert (=> d!105035 (= lt!369051 e!456322)))

(declare-fun c!89466 () Bool)

(declare-fun e!456330 () Bool)

(assert (=> d!105035 (= c!89466 e!456330)))

(declare-fun res!560099 () Bool)

(assert (=> d!105035 (=> (not res!560099) (not e!456330))))

(assert (=> d!105035 (= res!560099 (bvslt #b00000000000000000000000000000000 (size!22185 _keys!976)))))

(assert (=> d!105035 (= lt!369043 e!456324)))

(assert (=> d!105035 (= c!89463 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105035 (validMask!0 mask!1312)))

(assert (=> d!105035 (= (getCurrentListMap!2414 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369045)))

(declare-fun b!821248 () Bool)

(assert (=> b!821248 (= e!456331 (not call!35743))))

(declare-fun bm!35740 () Bool)

(assert (=> bm!35740 (= call!35742 (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821249 () Bool)

(assert (=> b!821249 (= e!456332 e!456321)))

(declare-fun c!89464 () Bool)

(assert (=> b!821249 (= c!89464 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!821250 () Bool)

(assert (=> b!821250 (= e!456326 call!35741)))

(declare-fun b!821251 () Bool)

(assert (=> b!821251 (= e!456330 (validKeyInArray!0 (select (arr!21765 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105035 c!89463) b!821240))

(assert (= (and d!105035 (not c!89463)) b!821244))

(assert (= (and b!821244 c!89465) b!821250))

(assert (= (and b!821244 (not c!89465)) b!821247))

(assert (= (and b!821247 c!89461) b!821241))

(assert (= (and b!821247 (not c!89461)) b!821238))

(assert (= (or b!821241 b!821238) bm!35738))

(assert (= (or b!821250 bm!35738) bm!35736))

(assert (= (or b!821250 b!821241) bm!35735))

(assert (= (or b!821240 bm!35736) bm!35740))

(assert (= (or b!821240 bm!35735) bm!35734))

(assert (= (and d!105035 res!560099) b!821251))

(assert (= (and d!105035 c!89466) b!821233))

(assert (= (and d!105035 (not c!89466)) b!821235))

(assert (= (and d!105035 res!560101) b!821245))

(assert (= (and b!821245 res!560097) b!821243))

(assert (= (and b!821245 (not res!560095)) b!821234))

(assert (= (and b!821234 res!560096) b!821239))

(assert (= (and b!821245 res!560098) b!821236))

(assert (= (and b!821236 c!89462) b!821232))

(assert (= (and b!821236 (not c!89462)) b!821248))

(assert (= (and b!821232 res!560102) b!821237))

(assert (= (or b!821232 b!821248) bm!35739))

(assert (= (and b!821236 res!560103) b!821249))

(assert (= (and b!821249 c!89464) b!821231))

(assert (= (and b!821249 (not c!89464)) b!821242))

(assert (= (and b!821231 res!560100) b!821246))

(assert (= (or b!821231 b!821242) bm!35737))

(declare-fun b_lambda!10985 () Bool)

(assert (=> (not b_lambda!10985) (not b!821239)))

(declare-fun t!21731 () Bool)

(declare-fun tb!4183 () Bool)

(assert (=> (and start!70766 (= defaultEntry!796 defaultEntry!796) t!21731) tb!4183))

(declare-fun result!7905 () Bool)

(assert (=> tb!4183 (= result!7905 tp_is_empty!14617)))

(assert (=> b!821239 t!21731))

(declare-fun b_and!21765 () Bool)

(assert (= b_and!21759 (and (=> t!21731 result!7905) b_and!21765)))

(assert (=> b!821251 m!763461))

(assert (=> b!821251 m!763461))

(assert (=> b!821251 m!763465))

(assert (=> b!821233 m!763461))

(declare-fun m!763517 () Bool)

(assert (=> b!821233 m!763517))

(declare-fun m!763519 () Bool)

(assert (=> b!821233 m!763519))

(declare-fun m!763521 () Bool)

(assert (=> b!821233 m!763521))

(declare-fun m!763523 () Bool)

(assert (=> b!821233 m!763523))

(declare-fun m!763525 () Bool)

(assert (=> b!821233 m!763525))

(declare-fun m!763527 () Bool)

(assert (=> b!821233 m!763527))

(assert (=> b!821233 m!763521))

(declare-fun m!763529 () Bool)

(assert (=> b!821233 m!763529))

(declare-fun m!763531 () Bool)

(assert (=> b!821233 m!763531))

(declare-fun m!763533 () Bool)

(assert (=> b!821233 m!763533))

(assert (=> b!821233 m!763357))

(declare-fun m!763535 () Bool)

(assert (=> b!821233 m!763535))

(assert (=> b!821233 m!763525))

(declare-fun m!763537 () Bool)

(assert (=> b!821233 m!763537))

(assert (=> b!821233 m!763535))

(declare-fun m!763539 () Bool)

(assert (=> b!821233 m!763539))

(assert (=> b!821233 m!763529))

(declare-fun m!763541 () Bool)

(assert (=> b!821233 m!763541))

(declare-fun m!763543 () Bool)

(assert (=> b!821233 m!763543))

(declare-fun m!763545 () Bool)

(assert (=> b!821233 m!763545))

(declare-fun m!763547 () Bool)

(assert (=> b!821237 m!763547))

(assert (=> b!821243 m!763461))

(assert (=> b!821243 m!763461))

(assert (=> b!821243 m!763465))

(declare-fun m!763549 () Bool)

(assert (=> bm!35734 m!763549))

(declare-fun m!763551 () Bool)

(assert (=> b!821240 m!763551))

(declare-fun m!763553 () Bool)

(assert (=> bm!35739 m!763553))

(declare-fun m!763555 () Bool)

(assert (=> bm!35737 m!763555))

(declare-fun m!763557 () Bool)

(assert (=> b!821246 m!763557))

(assert (=> d!105035 m!763361))

(assert (=> b!821239 m!763461))

(assert (=> b!821239 m!763461))

(declare-fun m!763559 () Bool)

(assert (=> b!821239 m!763559))

(declare-fun m!763561 () Bool)

(assert (=> b!821239 m!763561))

(declare-fun m!763563 () Bool)

(assert (=> b!821239 m!763563))

(declare-fun m!763565 () Bool)

(assert (=> b!821239 m!763565))

(assert (=> b!821239 m!763561))

(assert (=> b!821239 m!763563))

(assert (=> bm!35740 m!763357))

(assert (=> b!821234 m!763461))

(assert (=> b!821234 m!763461))

(declare-fun m!763567 () Bool)

(assert (=> b!821234 m!763567))

(assert (=> b!821097 d!105035))

(declare-fun b!821254 () Bool)

(declare-fun e!456334 () Bool)

(declare-fun e!456341 () Bool)

(assert (=> b!821254 (= e!456334 e!456341)))

(declare-fun res!560109 () Bool)

(declare-fun call!35744 () Bool)

(assert (=> b!821254 (= res!560109 call!35744)))

(assert (=> b!821254 (=> (not res!560109) (not e!456341))))

(declare-fun call!35745 () ListLongMap!8429)

(declare-fun c!89469 () Bool)

(declare-fun call!35749 () ListLongMap!8429)

(declare-fun call!35746 () ListLongMap!8429)

(declare-fun c!89471 () Bool)

(declare-fun bm!35741 () Bool)

(declare-fun call!35747 () ListLongMap!8429)

(assert (=> bm!35741 (= call!35746 (+!1865 (ite c!89469 call!35749 (ite c!89471 call!35747 call!35745)) (ite (or c!89469 c!89471) (tuple2!9605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!9605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!821255 () Bool)

(declare-fun e!456344 () Bool)

(declare-fun e!456338 () Bool)

(assert (=> b!821255 (= e!456344 e!456338)))

(declare-fun res!560111 () Bool)

(declare-fun call!35750 () Bool)

(assert (=> b!821255 (= res!560111 call!35750)))

(assert (=> b!821255 (=> (not res!560111) (not e!456338))))

(declare-fun bm!35742 () Bool)

(declare-fun call!35748 () ListLongMap!8429)

(assert (=> bm!35742 (= call!35748 call!35746)))

(declare-fun bm!35743 () Bool)

(assert (=> bm!35743 (= call!35747 call!35749)))

(declare-fun bm!35744 () Bool)

(declare-fun lt!369067 () ListLongMap!8429)

(assert (=> bm!35744 (= call!35744 (contains!4141 lt!369067 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!821256 () Bool)

(declare-fun e!456335 () Unit!28010)

(declare-fun lt!369056 () Unit!28010)

(assert (=> b!821256 (= e!456335 lt!369056)))

(declare-fun lt!369062 () ListLongMap!8429)

(assert (=> b!821256 (= lt!369062 (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369072 () (_ BitVec 64))

(assert (=> b!821256 (= lt!369072 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!369064 () (_ BitVec 64))

(assert (=> b!821256 (= lt!369064 (select (arr!21765 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!369069 () Unit!28010)

(assert (=> b!821256 (= lt!369069 (addStillContains!309 lt!369062 lt!369072 zeroValueAfter!34 lt!369064))))

(assert (=> b!821256 (contains!4141 (+!1865 lt!369062 (tuple2!9605 lt!369072 zeroValueAfter!34)) lt!369064)))

(declare-fun lt!369052 () Unit!28010)

(assert (=> b!821256 (= lt!369052 lt!369069)))

(declare-fun lt!369054 () ListLongMap!8429)

(assert (=> b!821256 (= lt!369054 (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369061 () (_ BitVec 64))

(assert (=> b!821256 (= lt!369061 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!369066 () (_ BitVec 64))

(assert (=> b!821256 (= lt!369066 (select (arr!21765 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!369058 () Unit!28010)

(assert (=> b!821256 (= lt!369058 (addApplyDifferent!309 lt!369054 lt!369061 minValue!754 lt!369066))))

(assert (=> b!821256 (= (apply!355 (+!1865 lt!369054 (tuple2!9605 lt!369061 minValue!754)) lt!369066) (apply!355 lt!369054 lt!369066))))

(declare-fun lt!369059 () Unit!28010)

(assert (=> b!821256 (= lt!369059 lt!369058)))

(declare-fun lt!369057 () ListLongMap!8429)

(assert (=> b!821256 (= lt!369057 (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369071 () (_ BitVec 64))

(assert (=> b!821256 (= lt!369071 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!369060 () (_ BitVec 64))

(assert (=> b!821256 (= lt!369060 (select (arr!21765 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!369070 () Unit!28010)

(assert (=> b!821256 (= lt!369070 (addApplyDifferent!309 lt!369057 lt!369071 zeroValueAfter!34 lt!369060))))

(assert (=> b!821256 (= (apply!355 (+!1865 lt!369057 (tuple2!9605 lt!369071 zeroValueAfter!34)) lt!369060) (apply!355 lt!369057 lt!369060))))

(declare-fun lt!369055 () Unit!28010)

(assert (=> b!821256 (= lt!369055 lt!369070)))

(declare-fun lt!369053 () ListLongMap!8429)

(assert (=> b!821256 (= lt!369053 (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369068 () (_ BitVec 64))

(assert (=> b!821256 (= lt!369068 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!369063 () (_ BitVec 64))

(assert (=> b!821256 (= lt!369063 (select (arr!21765 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!821256 (= lt!369056 (addApplyDifferent!309 lt!369053 lt!369068 minValue!754 lt!369063))))

(assert (=> b!821256 (= (apply!355 (+!1865 lt!369053 (tuple2!9605 lt!369068 minValue!754)) lt!369063) (apply!355 lt!369053 lt!369063))))

(declare-fun b!821257 () Bool)

(declare-fun e!456342 () Bool)

(declare-fun e!456336 () Bool)

(assert (=> b!821257 (= e!456342 e!456336)))

(declare-fun res!560105 () Bool)

(assert (=> b!821257 (=> (not res!560105) (not e!456336))))

(assert (=> b!821257 (= res!560105 (contains!4141 lt!369067 (select (arr!21765 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821257 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22185 _keys!976)))))

(declare-fun b!821258 () Bool)

(declare-fun Unit!28017 () Unit!28010)

(assert (=> b!821258 (= e!456335 Unit!28017)))

(declare-fun b!821260 () Bool)

(assert (=> b!821260 (= e!456338 (= (apply!355 lt!369067 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!821261 () Bool)

(declare-fun e!456333 () ListLongMap!8429)

(assert (=> b!821261 (= e!456333 call!35745)))

(declare-fun bm!35745 () Bool)

(assert (=> bm!35745 (= call!35745 call!35747)))

(declare-fun b!821262 () Bool)

(assert (=> b!821262 (= e!456336 (= (apply!355 lt!369067 (select (arr!21765 _keys!976) #b00000000000000000000000000000000)) (get!11607 (select (arr!21766 _values!788) #b00000000000000000000000000000000) (dynLambda!963 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!821262 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22186 _values!788)))))

(assert (=> b!821262 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22185 _keys!976)))))

(declare-fun b!821263 () Bool)

(declare-fun e!456337 () ListLongMap!8429)

(assert (=> b!821263 (= e!456337 (+!1865 call!35746 (tuple2!9605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!821264 () Bool)

(assert (=> b!821264 (= e!456333 call!35748)))

(declare-fun b!821265 () Bool)

(assert (=> b!821265 (= e!456334 (not call!35744))))

(declare-fun b!821266 () Bool)

(declare-fun e!456340 () Bool)

(assert (=> b!821266 (= e!456340 (validKeyInArray!0 (select (arr!21765 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35746 () Bool)

(assert (=> bm!35746 (= call!35750 (contains!4141 lt!369067 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!821267 () Bool)

(declare-fun e!456339 () ListLongMap!8429)

(assert (=> b!821267 (= e!456337 e!456339)))

(assert (=> b!821267 (= c!89471 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!821268 () Bool)

(declare-fun res!560107 () Bool)

(declare-fun e!456345 () Bool)

(assert (=> b!821268 (=> (not res!560107) (not e!456345))))

(assert (=> b!821268 (= res!560107 e!456342)))

(declare-fun res!560104 () Bool)

(assert (=> b!821268 (=> res!560104 e!456342)))

(assert (=> b!821268 (= res!560104 (not e!456340))))

(declare-fun res!560106 () Bool)

(assert (=> b!821268 (=> (not res!560106) (not e!456340))))

(assert (=> b!821268 (= res!560106 (bvslt #b00000000000000000000000000000000 (size!22185 _keys!976)))))

(declare-fun b!821269 () Bool)

(assert (=> b!821269 (= e!456341 (= (apply!355 lt!369067 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!821270 () Bool)

(declare-fun c!89467 () Bool)

(assert (=> b!821270 (= c!89467 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!821270 (= e!456339 e!456333)))

(declare-fun b!821259 () Bool)

(declare-fun res!560112 () Bool)

(assert (=> b!821259 (=> (not res!560112) (not e!456345))))

(assert (=> b!821259 (= res!560112 e!456344)))

(declare-fun c!89468 () Bool)

(assert (=> b!821259 (= c!89468 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!105037 () Bool)

(assert (=> d!105037 e!456345))

(declare-fun res!560110 () Bool)

(assert (=> d!105037 (=> (not res!560110) (not e!456345))))

(assert (=> d!105037 (= res!560110 (or (bvsge #b00000000000000000000000000000000 (size!22185 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22185 _keys!976)))))))

(declare-fun lt!369065 () ListLongMap!8429)

(assert (=> d!105037 (= lt!369067 lt!369065)))

(declare-fun lt!369073 () Unit!28010)

(assert (=> d!105037 (= lt!369073 e!456335)))

(declare-fun c!89472 () Bool)

(declare-fun e!456343 () Bool)

(assert (=> d!105037 (= c!89472 e!456343)))

(declare-fun res!560108 () Bool)

(assert (=> d!105037 (=> (not res!560108) (not e!456343))))

(assert (=> d!105037 (= res!560108 (bvslt #b00000000000000000000000000000000 (size!22185 _keys!976)))))

(assert (=> d!105037 (= lt!369065 e!456337)))

(assert (=> d!105037 (= c!89469 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105037 (validMask!0 mask!1312)))

(assert (=> d!105037 (= (getCurrentListMap!2414 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369067)))

(declare-fun b!821271 () Bool)

(assert (=> b!821271 (= e!456344 (not call!35750))))

(declare-fun bm!35747 () Bool)

(assert (=> bm!35747 (= call!35749 (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821272 () Bool)

(assert (=> b!821272 (= e!456345 e!456334)))

(declare-fun c!89470 () Bool)

(assert (=> b!821272 (= c!89470 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!821273 () Bool)

(assert (=> b!821273 (= e!456339 call!35748)))

(declare-fun b!821274 () Bool)

(assert (=> b!821274 (= e!456343 (validKeyInArray!0 (select (arr!21765 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105037 c!89469) b!821263))

(assert (= (and d!105037 (not c!89469)) b!821267))

(assert (= (and b!821267 c!89471) b!821273))

(assert (= (and b!821267 (not c!89471)) b!821270))

(assert (= (and b!821270 c!89467) b!821264))

(assert (= (and b!821270 (not c!89467)) b!821261))

(assert (= (or b!821264 b!821261) bm!35745))

(assert (= (or b!821273 bm!35745) bm!35743))

(assert (= (or b!821273 b!821264) bm!35742))

(assert (= (or b!821263 bm!35743) bm!35747))

(assert (= (or b!821263 bm!35742) bm!35741))

(assert (= (and d!105037 res!560108) b!821274))

(assert (= (and d!105037 c!89472) b!821256))

(assert (= (and d!105037 (not c!89472)) b!821258))

(assert (= (and d!105037 res!560110) b!821268))

(assert (= (and b!821268 res!560106) b!821266))

(assert (= (and b!821268 (not res!560104)) b!821257))

(assert (= (and b!821257 res!560105) b!821262))

(assert (= (and b!821268 res!560107) b!821259))

(assert (= (and b!821259 c!89468) b!821255))

(assert (= (and b!821259 (not c!89468)) b!821271))

(assert (= (and b!821255 res!560111) b!821260))

(assert (= (or b!821255 b!821271) bm!35746))

(assert (= (and b!821259 res!560112) b!821272))

(assert (= (and b!821272 c!89470) b!821254))

(assert (= (and b!821272 (not c!89470)) b!821265))

(assert (= (and b!821254 res!560109) b!821269))

(assert (= (or b!821254 b!821265) bm!35744))

(declare-fun b_lambda!10987 () Bool)

(assert (=> (not b_lambda!10987) (not b!821262)))

(assert (=> b!821262 t!21731))

(declare-fun b_and!21767 () Bool)

(assert (= b_and!21765 (and (=> t!21731 result!7905) b_and!21767)))

(assert (=> b!821274 m!763461))

(assert (=> b!821274 m!763461))

(assert (=> b!821274 m!763465))

(assert (=> b!821256 m!763461))

(declare-fun m!763569 () Bool)

(assert (=> b!821256 m!763569))

(declare-fun m!763571 () Bool)

(assert (=> b!821256 m!763571))

(declare-fun m!763573 () Bool)

(assert (=> b!821256 m!763573))

(declare-fun m!763575 () Bool)

(assert (=> b!821256 m!763575))

(declare-fun m!763577 () Bool)

(assert (=> b!821256 m!763577))

(declare-fun m!763579 () Bool)

(assert (=> b!821256 m!763579))

(assert (=> b!821256 m!763573))

(declare-fun m!763581 () Bool)

(assert (=> b!821256 m!763581))

(declare-fun m!763583 () Bool)

(assert (=> b!821256 m!763583))

(declare-fun m!763585 () Bool)

(assert (=> b!821256 m!763585))

(assert (=> b!821256 m!763355))

(declare-fun m!763587 () Bool)

(assert (=> b!821256 m!763587))

(assert (=> b!821256 m!763577))

(declare-fun m!763589 () Bool)

(assert (=> b!821256 m!763589))

(assert (=> b!821256 m!763587))

(declare-fun m!763591 () Bool)

(assert (=> b!821256 m!763591))

(assert (=> b!821256 m!763581))

(declare-fun m!763593 () Bool)

(assert (=> b!821256 m!763593))

(declare-fun m!763595 () Bool)

(assert (=> b!821256 m!763595))

(declare-fun m!763597 () Bool)

(assert (=> b!821256 m!763597))

(declare-fun m!763599 () Bool)

(assert (=> b!821260 m!763599))

(assert (=> b!821266 m!763461))

(assert (=> b!821266 m!763461))

(assert (=> b!821266 m!763465))

(declare-fun m!763601 () Bool)

(assert (=> bm!35741 m!763601))

(declare-fun m!763603 () Bool)

(assert (=> b!821263 m!763603))

(declare-fun m!763605 () Bool)

(assert (=> bm!35746 m!763605))

(declare-fun m!763607 () Bool)

(assert (=> bm!35744 m!763607))

(declare-fun m!763609 () Bool)

(assert (=> b!821269 m!763609))

(assert (=> d!105037 m!763361))

(assert (=> b!821262 m!763461))

(assert (=> b!821262 m!763461))

(declare-fun m!763611 () Bool)

(assert (=> b!821262 m!763611))

(assert (=> b!821262 m!763561))

(assert (=> b!821262 m!763563))

(assert (=> b!821262 m!763565))

(assert (=> b!821262 m!763561))

(assert (=> b!821262 m!763563))

(assert (=> bm!35747 m!763355))

(assert (=> b!821257 m!763461))

(assert (=> b!821257 m!763461))

(declare-fun m!763613 () Bool)

(assert (=> b!821257 m!763613))

(assert (=> b!821097 d!105037))

(declare-fun d!105039 () Bool)

(assert (=> d!105039 (= (+!1865 lt!368901 (tuple2!9605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (+!1865 (+!1865 lt!368901 (tuple2!9605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!9605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun lt!369076 () Unit!28010)

(declare-fun choose!1401 (ListLongMap!8429 (_ BitVec 64) V!24491 V!24491) Unit!28010)

(assert (=> d!105039 (= lt!369076 (choose!1401 lt!368901 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> d!105039 (= (addSameAsAddTwiceSameKeyDiffValues!201 lt!368901 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34) lt!369076)))

(declare-fun bs!22883 () Bool)

(assert (= bs!22883 d!105039))

(declare-fun m!763615 () Bool)

(assert (=> bs!22883 m!763615))

(declare-fun m!763617 () Bool)

(assert (=> bs!22883 m!763617))

(assert (=> bs!22883 m!763617))

(declare-fun m!763619 () Bool)

(assert (=> bs!22883 m!763619))

(declare-fun m!763621 () Bool)

(assert (=> bs!22883 m!763621))

(assert (=> b!821097 d!105039))

(declare-fun d!105041 () Bool)

(declare-fun e!456346 () Bool)

(assert (=> d!105041 e!456346))

(declare-fun res!560113 () Bool)

(assert (=> d!105041 (=> (not res!560113) (not e!456346))))

(declare-fun lt!369078 () ListLongMap!8429)

(assert (=> d!105041 (= res!560113 (contains!4141 lt!369078 (_1!4813 lt!368904)))))

(declare-fun lt!369079 () List!15401)

(assert (=> d!105041 (= lt!369078 (ListLongMap!8430 lt!369079))))

(declare-fun lt!369077 () Unit!28010)

(declare-fun lt!369080 () Unit!28010)

(assert (=> d!105041 (= lt!369077 lt!369080)))

(assert (=> d!105041 (= (getValueByKey!404 lt!369079 (_1!4813 lt!368904)) (Some!409 (_2!4813 lt!368904)))))

(assert (=> d!105041 (= lt!369080 (lemmaContainsTupThenGetReturnValue!218 lt!369079 (_1!4813 lt!368904) (_2!4813 lt!368904)))))

(assert (=> d!105041 (= lt!369079 (insertStrictlySorted!257 (toList!4230 lt!368902) (_1!4813 lt!368904) (_2!4813 lt!368904)))))

(assert (=> d!105041 (= (+!1865 lt!368902 lt!368904) lt!369078)))

(declare-fun b!821275 () Bool)

(declare-fun res!560114 () Bool)

(assert (=> b!821275 (=> (not res!560114) (not e!456346))))

(assert (=> b!821275 (= res!560114 (= (getValueByKey!404 (toList!4230 lt!369078) (_1!4813 lt!368904)) (Some!409 (_2!4813 lt!368904))))))

(declare-fun b!821276 () Bool)

(assert (=> b!821276 (= e!456346 (contains!4142 (toList!4230 lt!369078) lt!368904))))

(assert (= (and d!105041 res!560113) b!821275))

(assert (= (and b!821275 res!560114) b!821276))

(declare-fun m!763623 () Bool)

(assert (=> d!105041 m!763623))

(declare-fun m!763625 () Bool)

(assert (=> d!105041 m!763625))

(declare-fun m!763627 () Bool)

(assert (=> d!105041 m!763627))

(declare-fun m!763629 () Bool)

(assert (=> d!105041 m!763629))

(declare-fun m!763631 () Bool)

(assert (=> b!821275 m!763631))

(declare-fun m!763633 () Bool)

(assert (=> b!821276 m!763633))

(assert (=> b!821097 d!105041))

(declare-fun b!821285 () Bool)

(declare-fun e!456353 () Bool)

(declare-fun call!35753 () Bool)

(assert (=> b!821285 (= e!456353 call!35753)))

(declare-fun b!821286 () Bool)

(declare-fun e!456354 () Bool)

(assert (=> b!821286 (= e!456354 call!35753)))

(declare-fun b!821287 () Bool)

(declare-fun e!456355 () Bool)

(assert (=> b!821287 (= e!456355 e!456354)))

(declare-fun c!89475 () Bool)

(assert (=> b!821287 (= c!89475 (validKeyInArray!0 (select (arr!21765 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105043 () Bool)

(declare-fun res!560119 () Bool)

(assert (=> d!105043 (=> res!560119 e!456355)))

(assert (=> d!105043 (= res!560119 (bvsge #b00000000000000000000000000000000 (size!22185 _keys!976)))))

(assert (=> d!105043 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!456355)))

(declare-fun bm!35750 () Bool)

(assert (=> bm!35750 (= call!35753 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!821288 () Bool)

(assert (=> b!821288 (= e!456354 e!456353)))

(declare-fun lt!369089 () (_ BitVec 64))

(assert (=> b!821288 (= lt!369089 (select (arr!21765 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!369088 () Unit!28010)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45433 (_ BitVec 64) (_ BitVec 32)) Unit!28010)

(assert (=> b!821288 (= lt!369088 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!369089 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!821288 (arrayContainsKey!0 _keys!976 lt!369089 #b00000000000000000000000000000000)))

(declare-fun lt!369087 () Unit!28010)

(assert (=> b!821288 (= lt!369087 lt!369088)))

(declare-fun res!560120 () Bool)

(declare-datatypes ((SeekEntryResult!8678 0))(
  ( (MissingZero!8678 (index!37083 (_ BitVec 32))) (Found!8678 (index!37084 (_ BitVec 32))) (Intermediate!8678 (undefined!9490 Bool) (index!37085 (_ BitVec 32)) (x!69086 (_ BitVec 32))) (Undefined!8678) (MissingVacant!8678 (index!37086 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45433 (_ BitVec 32)) SeekEntryResult!8678)

(assert (=> b!821288 (= res!560120 (= (seekEntryOrOpen!0 (select (arr!21765 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8678 #b00000000000000000000000000000000)))))

(assert (=> b!821288 (=> (not res!560120) (not e!456353))))

(assert (= (and d!105043 (not res!560119)) b!821287))

(assert (= (and b!821287 c!89475) b!821288))

(assert (= (and b!821287 (not c!89475)) b!821286))

(assert (= (and b!821288 res!560120) b!821285))

(assert (= (or b!821285 b!821286) bm!35750))

(assert (=> b!821287 m!763461))

(assert (=> b!821287 m!763461))

(assert (=> b!821287 m!763465))

(declare-fun m!763635 () Bool)

(assert (=> bm!35750 m!763635))

(assert (=> b!821288 m!763461))

(declare-fun m!763637 () Bool)

(assert (=> b!821288 m!763637))

(declare-fun m!763639 () Bool)

(assert (=> b!821288 m!763639))

(assert (=> b!821288 m!763461))

(declare-fun m!763641 () Bool)

(assert (=> b!821288 m!763641))

(assert (=> b!821100 d!105043))

(declare-fun d!105045 () Bool)

(assert (=> d!105045 (= (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369092 () Unit!28010)

(declare-fun choose!1402 (array!45433 array!45435 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24491 V!24491 V!24491 V!24491 (_ BitVec 32) Int) Unit!28010)

(assert (=> d!105045 (= lt!369092 (choose!1402 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105045 (validMask!0 mask!1312)))

(assert (=> d!105045 (= (lemmaNoChangeToArrayThenSameMapNoExtras!409 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369092)))

(declare-fun bs!22884 () Bool)

(assert (= bs!22884 d!105045))

(assert (=> bs!22884 m!763357))

(assert (=> bs!22884 m!763355))

(declare-fun m!763643 () Bool)

(assert (=> bs!22884 m!763643))

(assert (=> bs!22884 m!763361))

(assert (=> b!821101 d!105045))

(declare-fun b!821313 () Bool)

(declare-fun e!456374 () ListLongMap!8429)

(declare-fun call!35756 () ListLongMap!8429)

(assert (=> b!821313 (= e!456374 call!35756)))

(declare-fun b!821314 () Bool)

(declare-fun e!456371 () Bool)

(assert (=> b!821314 (= e!456371 (validKeyInArray!0 (select (arr!21765 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821314 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!821315 () Bool)

(declare-fun e!456375 () Bool)

(declare-fun e!456373 () Bool)

(assert (=> b!821315 (= e!456375 e!456373)))

(assert (=> b!821315 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22185 _keys!976)))))

(declare-fun res!560131 () Bool)

(declare-fun lt!369110 () ListLongMap!8429)

(assert (=> b!821315 (= res!560131 (contains!4141 lt!369110 (select (arr!21765 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821315 (=> (not res!560131) (not e!456373))))

(declare-fun b!821316 () Bool)

(declare-fun lt!369108 () Unit!28010)

(declare-fun lt!369107 () Unit!28010)

(assert (=> b!821316 (= lt!369108 lt!369107)))

(declare-fun lt!369113 () (_ BitVec 64))

(declare-fun lt!369109 () ListLongMap!8429)

(declare-fun lt!369111 () V!24491)

(declare-fun lt!369112 () (_ BitVec 64))

(assert (=> b!821316 (not (contains!4141 (+!1865 lt!369109 (tuple2!9605 lt!369113 lt!369111)) lt!369112))))

(declare-fun addStillNotContains!182 (ListLongMap!8429 (_ BitVec 64) V!24491 (_ BitVec 64)) Unit!28010)

(assert (=> b!821316 (= lt!369107 (addStillNotContains!182 lt!369109 lt!369113 lt!369111 lt!369112))))

(assert (=> b!821316 (= lt!369112 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!821316 (= lt!369111 (get!11607 (select (arr!21766 _values!788) #b00000000000000000000000000000000) (dynLambda!963 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!821316 (= lt!369113 (select (arr!21765 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!821316 (= lt!369109 call!35756)))

(assert (=> b!821316 (= e!456374 (+!1865 call!35756 (tuple2!9605 (select (arr!21765 _keys!976) #b00000000000000000000000000000000) (get!11607 (select (arr!21766 _values!788) #b00000000000000000000000000000000) (dynLambda!963 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!821317 () Bool)

(declare-fun e!456372 () Bool)

(assert (=> b!821317 (= e!456372 (= lt!369110 (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!821318 () Bool)

(declare-fun e!456370 () ListLongMap!8429)

(assert (=> b!821318 (= e!456370 (ListLongMap!8430 Nil!15398))))

(declare-fun b!821319 () Bool)

(assert (=> b!821319 (= e!456370 e!456374)))

(declare-fun c!89485 () Bool)

(assert (=> b!821319 (= c!89485 (validKeyInArray!0 (select (arr!21765 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821320 () Bool)

(declare-fun isEmpty!643 (ListLongMap!8429) Bool)

(assert (=> b!821320 (= e!456372 (isEmpty!643 lt!369110))))

(declare-fun b!821321 () Bool)

(assert (=> b!821321 (= e!456375 e!456372)))

(declare-fun c!89486 () Bool)

(assert (=> b!821321 (= c!89486 (bvslt #b00000000000000000000000000000000 (size!22185 _keys!976)))))

(declare-fun b!821322 () Bool)

(declare-fun res!560130 () Bool)

(declare-fun e!456376 () Bool)

(assert (=> b!821322 (=> (not res!560130) (not e!456376))))

(assert (=> b!821322 (= res!560130 (not (contains!4141 lt!369110 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!821323 () Bool)

(assert (=> b!821323 (= e!456376 e!456375)))

(declare-fun c!89487 () Bool)

(assert (=> b!821323 (= c!89487 e!456371)))

(declare-fun res!560129 () Bool)

(assert (=> b!821323 (=> (not res!560129) (not e!456371))))

(assert (=> b!821323 (= res!560129 (bvslt #b00000000000000000000000000000000 (size!22185 _keys!976)))))

(declare-fun b!821324 () Bool)

(assert (=> b!821324 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22185 _keys!976)))))

(assert (=> b!821324 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22186 _values!788)))))

(assert (=> b!821324 (= e!456373 (= (apply!355 lt!369110 (select (arr!21765 _keys!976) #b00000000000000000000000000000000)) (get!11607 (select (arr!21766 _values!788) #b00000000000000000000000000000000) (dynLambda!963 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!105047 () Bool)

(assert (=> d!105047 e!456376))

(declare-fun res!560132 () Bool)

(assert (=> d!105047 (=> (not res!560132) (not e!456376))))

(assert (=> d!105047 (= res!560132 (not (contains!4141 lt!369110 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105047 (= lt!369110 e!456370)))

(declare-fun c!89484 () Bool)

(assert (=> d!105047 (= c!89484 (bvsge #b00000000000000000000000000000000 (size!22185 _keys!976)))))

(assert (=> d!105047 (validMask!0 mask!1312)))

(assert (=> d!105047 (= (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369110)))

(declare-fun bm!35753 () Bool)

(assert (=> bm!35753 (= call!35756 (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(assert (= (and d!105047 c!89484) b!821318))

(assert (= (and d!105047 (not c!89484)) b!821319))

(assert (= (and b!821319 c!89485) b!821316))

(assert (= (and b!821319 (not c!89485)) b!821313))

(assert (= (or b!821316 b!821313) bm!35753))

(assert (= (and d!105047 res!560132) b!821322))

(assert (= (and b!821322 res!560130) b!821323))

(assert (= (and b!821323 res!560129) b!821314))

(assert (= (and b!821323 c!89487) b!821315))

(assert (= (and b!821323 (not c!89487)) b!821321))

(assert (= (and b!821315 res!560131) b!821324))

(assert (= (and b!821321 c!89486) b!821317))

(assert (= (and b!821321 (not c!89486)) b!821320))

(declare-fun b_lambda!10989 () Bool)

(assert (=> (not b_lambda!10989) (not b!821316)))

(assert (=> b!821316 t!21731))

(declare-fun b_and!21769 () Bool)

(assert (= b_and!21767 (and (=> t!21731 result!7905) b_and!21769)))

(declare-fun b_lambda!10991 () Bool)

(assert (=> (not b_lambda!10991) (not b!821324)))

(assert (=> b!821324 t!21731))

(declare-fun b_and!21771 () Bool)

(assert (= b_and!21769 (and (=> t!21731 result!7905) b_and!21771)))

(assert (=> b!821319 m!763461))

(assert (=> b!821319 m!763461))

(assert (=> b!821319 m!763465))

(declare-fun m!763645 () Bool)

(assert (=> d!105047 m!763645))

(assert (=> d!105047 m!763361))

(declare-fun m!763647 () Bool)

(assert (=> b!821317 m!763647))

(assert (=> b!821314 m!763461))

(assert (=> b!821314 m!763461))

(assert (=> b!821314 m!763465))

(declare-fun m!763649 () Bool)

(assert (=> b!821316 m!763649))

(declare-fun m!763651 () Bool)

(assert (=> b!821316 m!763651))

(assert (=> b!821316 m!763561))

(assert (=> b!821316 m!763563))

(assert (=> b!821316 m!763565))

(assert (=> b!821316 m!763651))

(declare-fun m!763653 () Bool)

(assert (=> b!821316 m!763653))

(declare-fun m!763655 () Bool)

(assert (=> b!821316 m!763655))

(assert (=> b!821316 m!763461))

(assert (=> b!821316 m!763561))

(assert (=> b!821316 m!763563))

(declare-fun m!763657 () Bool)

(assert (=> b!821322 m!763657))

(assert (=> b!821315 m!763461))

(assert (=> b!821315 m!763461))

(declare-fun m!763659 () Bool)

(assert (=> b!821315 m!763659))

(assert (=> b!821324 m!763461))

(declare-fun m!763661 () Bool)

(assert (=> b!821324 m!763661))

(assert (=> b!821324 m!763561))

(assert (=> b!821324 m!763563))

(assert (=> b!821324 m!763565))

(assert (=> b!821324 m!763461))

(assert (=> b!821324 m!763561))

(assert (=> b!821324 m!763563))

(declare-fun m!763663 () Bool)

(assert (=> b!821320 m!763663))

(assert (=> bm!35753 m!763647))

(assert (=> b!821101 d!105047))

(declare-fun b!821325 () Bool)

(declare-fun e!456381 () ListLongMap!8429)

(declare-fun call!35757 () ListLongMap!8429)

(assert (=> b!821325 (= e!456381 call!35757)))

(declare-fun b!821326 () Bool)

(declare-fun e!456378 () Bool)

(assert (=> b!821326 (= e!456378 (validKeyInArray!0 (select (arr!21765 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821326 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!821327 () Bool)

(declare-fun e!456382 () Bool)

(declare-fun e!456380 () Bool)

(assert (=> b!821327 (= e!456382 e!456380)))

(assert (=> b!821327 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22185 _keys!976)))))

(declare-fun res!560135 () Bool)

(declare-fun lt!369117 () ListLongMap!8429)

(assert (=> b!821327 (= res!560135 (contains!4141 lt!369117 (select (arr!21765 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821327 (=> (not res!560135) (not e!456380))))

(declare-fun b!821328 () Bool)

(declare-fun lt!369115 () Unit!28010)

(declare-fun lt!369114 () Unit!28010)

(assert (=> b!821328 (= lt!369115 lt!369114)))

(declare-fun lt!369119 () (_ BitVec 64))

(declare-fun lt!369120 () (_ BitVec 64))

(declare-fun lt!369118 () V!24491)

(declare-fun lt!369116 () ListLongMap!8429)

(assert (=> b!821328 (not (contains!4141 (+!1865 lt!369116 (tuple2!9605 lt!369120 lt!369118)) lt!369119))))

(assert (=> b!821328 (= lt!369114 (addStillNotContains!182 lt!369116 lt!369120 lt!369118 lt!369119))))

(assert (=> b!821328 (= lt!369119 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!821328 (= lt!369118 (get!11607 (select (arr!21766 _values!788) #b00000000000000000000000000000000) (dynLambda!963 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!821328 (= lt!369120 (select (arr!21765 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!821328 (= lt!369116 call!35757)))

(assert (=> b!821328 (= e!456381 (+!1865 call!35757 (tuple2!9605 (select (arr!21765 _keys!976) #b00000000000000000000000000000000) (get!11607 (select (arr!21766 _values!788) #b00000000000000000000000000000000) (dynLambda!963 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!456379 () Bool)

(declare-fun b!821329 () Bool)

(assert (=> b!821329 (= e!456379 (= lt!369117 (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!821330 () Bool)

(declare-fun e!456377 () ListLongMap!8429)

(assert (=> b!821330 (= e!456377 (ListLongMap!8430 Nil!15398))))

(declare-fun b!821331 () Bool)

(assert (=> b!821331 (= e!456377 e!456381)))

(declare-fun c!89489 () Bool)

(assert (=> b!821331 (= c!89489 (validKeyInArray!0 (select (arr!21765 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821332 () Bool)

(assert (=> b!821332 (= e!456379 (isEmpty!643 lt!369117))))

(declare-fun b!821333 () Bool)

(assert (=> b!821333 (= e!456382 e!456379)))

(declare-fun c!89490 () Bool)

(assert (=> b!821333 (= c!89490 (bvslt #b00000000000000000000000000000000 (size!22185 _keys!976)))))

(declare-fun b!821334 () Bool)

(declare-fun res!560134 () Bool)

(declare-fun e!456383 () Bool)

(assert (=> b!821334 (=> (not res!560134) (not e!456383))))

(assert (=> b!821334 (= res!560134 (not (contains!4141 lt!369117 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!821335 () Bool)

(assert (=> b!821335 (= e!456383 e!456382)))

(declare-fun c!89491 () Bool)

(assert (=> b!821335 (= c!89491 e!456378)))

(declare-fun res!560133 () Bool)

(assert (=> b!821335 (=> (not res!560133) (not e!456378))))

(assert (=> b!821335 (= res!560133 (bvslt #b00000000000000000000000000000000 (size!22185 _keys!976)))))

(declare-fun b!821336 () Bool)

(assert (=> b!821336 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22185 _keys!976)))))

(assert (=> b!821336 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22186 _values!788)))))

(assert (=> b!821336 (= e!456380 (= (apply!355 lt!369117 (select (arr!21765 _keys!976) #b00000000000000000000000000000000)) (get!11607 (select (arr!21766 _values!788) #b00000000000000000000000000000000) (dynLambda!963 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!105049 () Bool)

(assert (=> d!105049 e!456383))

(declare-fun res!560136 () Bool)

(assert (=> d!105049 (=> (not res!560136) (not e!456383))))

(assert (=> d!105049 (= res!560136 (not (contains!4141 lt!369117 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105049 (= lt!369117 e!456377)))

(declare-fun c!89488 () Bool)

(assert (=> d!105049 (= c!89488 (bvsge #b00000000000000000000000000000000 (size!22185 _keys!976)))))

(assert (=> d!105049 (validMask!0 mask!1312)))

(assert (=> d!105049 (= (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369117)))

(declare-fun bm!35754 () Bool)

(assert (=> bm!35754 (= call!35757 (getCurrentListMapNoExtraKeys!2321 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(assert (= (and d!105049 c!89488) b!821330))

(assert (= (and d!105049 (not c!89488)) b!821331))

(assert (= (and b!821331 c!89489) b!821328))

(assert (= (and b!821331 (not c!89489)) b!821325))

(assert (= (or b!821328 b!821325) bm!35754))

(assert (= (and d!105049 res!560136) b!821334))

(assert (= (and b!821334 res!560134) b!821335))

(assert (= (and b!821335 res!560133) b!821326))

(assert (= (and b!821335 c!89491) b!821327))

(assert (= (and b!821335 (not c!89491)) b!821333))

(assert (= (and b!821327 res!560135) b!821336))

(assert (= (and b!821333 c!89490) b!821329))

(assert (= (and b!821333 (not c!89490)) b!821332))

(declare-fun b_lambda!10993 () Bool)

(assert (=> (not b_lambda!10993) (not b!821328)))

(assert (=> b!821328 t!21731))

(declare-fun b_and!21773 () Bool)

(assert (= b_and!21771 (and (=> t!21731 result!7905) b_and!21773)))

(declare-fun b_lambda!10995 () Bool)

(assert (=> (not b_lambda!10995) (not b!821336)))

(assert (=> b!821336 t!21731))

(declare-fun b_and!21775 () Bool)

(assert (= b_and!21773 (and (=> t!21731 result!7905) b_and!21775)))

(assert (=> b!821331 m!763461))

(assert (=> b!821331 m!763461))

(assert (=> b!821331 m!763465))

(declare-fun m!763665 () Bool)

(assert (=> d!105049 m!763665))

(assert (=> d!105049 m!763361))

(declare-fun m!763667 () Bool)

(assert (=> b!821329 m!763667))

(assert (=> b!821326 m!763461))

(assert (=> b!821326 m!763461))

(assert (=> b!821326 m!763465))

(declare-fun m!763669 () Bool)

(assert (=> b!821328 m!763669))

(declare-fun m!763671 () Bool)

(assert (=> b!821328 m!763671))

(assert (=> b!821328 m!763561))

(assert (=> b!821328 m!763563))

(assert (=> b!821328 m!763565))

(assert (=> b!821328 m!763671))

(declare-fun m!763673 () Bool)

(assert (=> b!821328 m!763673))

(declare-fun m!763675 () Bool)

(assert (=> b!821328 m!763675))

(assert (=> b!821328 m!763461))

(assert (=> b!821328 m!763561))

(assert (=> b!821328 m!763563))

(declare-fun m!763677 () Bool)

(assert (=> b!821334 m!763677))

(assert (=> b!821327 m!763461))

(assert (=> b!821327 m!763461))

(declare-fun m!763679 () Bool)

(assert (=> b!821327 m!763679))

(assert (=> b!821336 m!763461))

(declare-fun m!763681 () Bool)

(assert (=> b!821336 m!763681))

(assert (=> b!821336 m!763561))

(assert (=> b!821336 m!763563))

(assert (=> b!821336 m!763565))

(assert (=> b!821336 m!763461))

(assert (=> b!821336 m!763561))

(assert (=> b!821336 m!763563))

(declare-fun m!763683 () Bool)

(assert (=> b!821332 m!763683))

(assert (=> bm!35754 m!763667))

(assert (=> b!821101 d!105049))

(declare-fun d!105051 () Bool)

(declare-fun e!456384 () Bool)

(assert (=> d!105051 e!456384))

(declare-fun res!560137 () Bool)

(assert (=> d!105051 (=> (not res!560137) (not e!456384))))

(declare-fun lt!369122 () ListLongMap!8429)

(assert (=> d!105051 (= res!560137 (contains!4141 lt!369122 (_1!4813 (tuple2!9605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!369123 () List!15401)

(assert (=> d!105051 (= lt!369122 (ListLongMap!8430 lt!369123))))

(declare-fun lt!369121 () Unit!28010)

(declare-fun lt!369124 () Unit!28010)

(assert (=> d!105051 (= lt!369121 lt!369124)))

(assert (=> d!105051 (= (getValueByKey!404 lt!369123 (_1!4813 (tuple2!9605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!409 (_2!4813 (tuple2!9605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105051 (= lt!369124 (lemmaContainsTupThenGetReturnValue!218 lt!369123 (_1!4813 (tuple2!9605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4813 (tuple2!9605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105051 (= lt!369123 (insertStrictlySorted!257 (toList!4230 lt!368905) (_1!4813 (tuple2!9605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4813 (tuple2!9605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105051 (= (+!1865 lt!368905 (tuple2!9605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!369122)))

(declare-fun b!821337 () Bool)

(declare-fun res!560138 () Bool)

(assert (=> b!821337 (=> (not res!560138) (not e!456384))))

(assert (=> b!821337 (= res!560138 (= (getValueByKey!404 (toList!4230 lt!369122) (_1!4813 (tuple2!9605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!409 (_2!4813 (tuple2!9605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!821338 () Bool)

(assert (=> b!821338 (= e!456384 (contains!4142 (toList!4230 lt!369122) (tuple2!9605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105051 res!560137) b!821337))

(assert (= (and b!821337 res!560138) b!821338))

(declare-fun m!763685 () Bool)

(assert (=> d!105051 m!763685))

(declare-fun m!763687 () Bool)

(assert (=> d!105051 m!763687))

(declare-fun m!763689 () Bool)

(assert (=> d!105051 m!763689))

(declare-fun m!763691 () Bool)

(assert (=> d!105051 m!763691))

(declare-fun m!763693 () Bool)

(assert (=> b!821337 m!763693))

(declare-fun m!763695 () Bool)

(assert (=> b!821338 m!763695))

(assert (=> b!821095 d!105051))

(declare-fun d!105053 () Bool)

(assert (=> d!105053 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70766 d!105053))

(declare-fun d!105055 () Bool)

(assert (=> d!105055 (= (array_inv!17423 _keys!976) (bvsge (size!22185 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70766 d!105055))

(declare-fun d!105057 () Bool)

(assert (=> d!105057 (= (array_inv!17424 _values!788) (bvsge (size!22186 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70766 d!105057))

(declare-fun condMapEmpty!23536 () Bool)

(declare-fun mapDefault!23536 () ValueCell!6893)

(assert (=> mapNonEmpty!23527 (= condMapEmpty!23536 (= mapRest!23527 ((as const (Array (_ BitVec 32) ValueCell!6893)) mapDefault!23536)))))

(declare-fun e!456389 () Bool)

(declare-fun mapRes!23536 () Bool)

(assert (=> mapNonEmpty!23527 (= tp!45456 (and e!456389 mapRes!23536))))

(declare-fun mapNonEmpty!23536 () Bool)

(declare-fun tp!45472 () Bool)

(declare-fun e!456390 () Bool)

(assert (=> mapNonEmpty!23536 (= mapRes!23536 (and tp!45472 e!456390))))

(declare-fun mapRest!23536 () (Array (_ BitVec 32) ValueCell!6893))

(declare-fun mapKey!23536 () (_ BitVec 32))

(declare-fun mapValue!23536 () ValueCell!6893)

(assert (=> mapNonEmpty!23536 (= mapRest!23527 (store mapRest!23536 mapKey!23536 mapValue!23536))))

(declare-fun b!821345 () Bool)

(assert (=> b!821345 (= e!456390 tp_is_empty!14617)))

(declare-fun b!821346 () Bool)

(assert (=> b!821346 (= e!456389 tp_is_empty!14617)))

(declare-fun mapIsEmpty!23536 () Bool)

(assert (=> mapIsEmpty!23536 mapRes!23536))

(assert (= (and mapNonEmpty!23527 condMapEmpty!23536) mapIsEmpty!23536))

(assert (= (and mapNonEmpty!23527 (not condMapEmpty!23536)) mapNonEmpty!23536))

(assert (= (and mapNonEmpty!23536 ((_ is ValueCellFull!6893) mapValue!23536)) b!821345))

(assert (= (and mapNonEmpty!23527 ((_ is ValueCellFull!6893) mapDefault!23536)) b!821346))

(declare-fun m!763697 () Bool)

(assert (=> mapNonEmpty!23536 m!763697))

(declare-fun b_lambda!10997 () Bool)

(assert (= b_lambda!10989 (or (and start!70766 b_free!12907) b_lambda!10997)))

(declare-fun b_lambda!10999 () Bool)

(assert (= b_lambda!10987 (or (and start!70766 b_free!12907) b_lambda!10999)))

(declare-fun b_lambda!11001 () Bool)

(assert (= b_lambda!10993 (or (and start!70766 b_free!12907) b_lambda!11001)))

(declare-fun b_lambda!11003 () Bool)

(assert (= b_lambda!10995 (or (and start!70766 b_free!12907) b_lambda!11003)))

(declare-fun b_lambda!11005 () Bool)

(assert (= b_lambda!10985 (or (and start!70766 b_free!12907) b_lambda!11005)))

(declare-fun b_lambda!11007 () Bool)

(assert (= b_lambda!10991 (or (and start!70766 b_free!12907) b_lambda!11007)))

(check-sat (not b!821338) (not d!105039) (not b_lambda!11001) (not b!821260) b_and!21775 (not b_lambda!10999) (not b!821188) (not b!821187) (not d!105035) (not d!105041) (not b!821269) (not b!821182) (not bm!35719) (not b!821263) (not b!821287) (not b!821234) (not bm!35753) (not b!821183) (not b_lambda!10997) (not b!821262) (not d!105027) (not d!105037) (not b!821186) (not b_lambda!11007) (not b!821334) (not b!821243) (not b!821172) (not b!821256) (not b!821251) (not bm!35750) (not b!821237) (not b!821328) (not bm!35754) (not b!821257) (not b!821337) (not b!821317) (not b!821275) (not b!821184) (not b_lambda!11003) (not b!821332) (not b_next!12907) (not b!821315) (not b!821331) (not d!105049) (not d!105051) (not b!821246) (not b!821322) (not d!105047) (not b!821336) (not b!821326) (not b!821329) (not bm!35734) (not b!821288) (not b!821276) (not b!821239) (not bm!35740) (not b!821324) (not bm!35741) (not b!821181) (not bm!35744) (not b!821233) (not d!105033) (not b!821174) (not d!105031) (not b!821185) (not bm!35746) (not b!821173) (not d!105045) (not b!821274) (not b!821240) (not b!821316) (not b!821320) (not b!821266) (not b!821327) tp_is_empty!14617 (not bm!35747) (not b!821319) (not b!821314) (not bm!35739) (not bm!35737) (not b_lambda!11005) (not mapNonEmpty!23536) (not d!105029))
(check-sat b_and!21775 (not b_next!12907))
