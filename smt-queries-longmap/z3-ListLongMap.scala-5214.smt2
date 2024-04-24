; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70482 () Bool)

(assert start!70482)

(declare-fun b_free!12691 () Bool)

(declare-fun b_next!12691 () Bool)

(assert (=> start!70482 (= b_free!12691 (not b_next!12691))))

(declare-fun tp!44797 () Bool)

(declare-fun b_and!21501 () Bool)

(assert (=> start!70482 (= tp!44797 b_and!21501)))

(declare-fun res!558051 () Bool)

(declare-fun e!453818 () Bool)

(assert (=> start!70482 (=> (not res!558051) (not e!453818))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70482 (= res!558051 (validMask!0 mask!1312))))

(assert (=> start!70482 e!453818))

(declare-fun tp_is_empty!14401 () Bool)

(assert (=> start!70482 tp_is_empty!14401))

(declare-datatypes ((array!45003 0))(
  ( (array!45004 (arr!21554 (Array (_ BitVec 32) (_ BitVec 64))) (size!21974 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45003)

(declare-fun array_inv!17271 (array!45003) Bool)

(assert (=> start!70482 (array_inv!17271 _keys!976)))

(assert (=> start!70482 true))

(declare-datatypes ((V!24203 0))(
  ( (V!24204 (val!7248 Int)) )
))
(declare-datatypes ((ValueCell!6785 0))(
  ( (ValueCellFull!6785 (v!9676 V!24203)) (EmptyCell!6785) )
))
(declare-datatypes ((array!45005 0))(
  ( (array!45006 (arr!21555 (Array (_ BitVec 32) ValueCell!6785)) (size!21975 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45005)

(declare-fun e!453820 () Bool)

(declare-fun array_inv!17272 (array!45005) Bool)

(assert (=> start!70482 (and (array_inv!17272 _values!788) e!453820)))

(assert (=> start!70482 tp!44797))

(declare-fun b!817815 () Bool)

(declare-fun res!558054 () Bool)

(declare-fun e!453819 () Bool)

(assert (=> b!817815 (=> res!558054 e!453819)))

(declare-fun zeroValueBefore!34 () V!24203)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24203)

(declare-fun minValue!754 () V!24203)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9434 0))(
  ( (tuple2!9435 (_1!4728 (_ BitVec 64)) (_2!4728 V!24203)) )
))
(declare-datatypes ((List!15247 0))(
  ( (Nil!15244) (Cons!15243 (h!16378 tuple2!9434) (t!21562 List!15247)) )
))
(declare-datatypes ((ListLongMap!8259 0))(
  ( (ListLongMap!8260 (toList!4145 List!15247)) )
))
(declare-fun +!1821 (ListLongMap!8259 tuple2!9434) ListLongMap!8259)

(declare-fun getCurrentListMap!2361 (array!45003 array!45005 (_ BitVec 32) (_ BitVec 32) V!24203 V!24203 (_ BitVec 32) Int) ListLongMap!8259)

(assert (=> b!817815 (= res!558054 (not (= (+!1821 (getCurrentListMap!2361 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9435 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (getCurrentListMap!2361 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))))

(declare-fun mapNonEmpty!23191 () Bool)

(declare-fun mapRes!23191 () Bool)

(declare-fun tp!44796 () Bool)

(declare-fun e!453817 () Bool)

(assert (=> mapNonEmpty!23191 (= mapRes!23191 (and tp!44796 e!453817))))

(declare-fun mapRest!23191 () (Array (_ BitVec 32) ValueCell!6785))

(declare-fun mapKey!23191 () (_ BitVec 32))

(declare-fun mapValue!23191 () ValueCell!6785)

(assert (=> mapNonEmpty!23191 (= (arr!21555 _values!788) (store mapRest!23191 mapKey!23191 mapValue!23191))))

(declare-fun mapIsEmpty!23191 () Bool)

(assert (=> mapIsEmpty!23191 mapRes!23191))

(declare-fun b!817816 () Bool)

(assert (=> b!817816 (= e!453817 tp_is_empty!14401)))

(declare-fun b!817817 () Bool)

(assert (=> b!817817 (= e!453819 (bvsle #b00000000000000000000000000000000 (size!21974 _keys!976)))))

(declare-fun b!817818 () Bool)

(declare-fun e!453822 () Bool)

(assert (=> b!817818 (= e!453822 tp_is_empty!14401)))

(declare-fun b!817819 () Bool)

(assert (=> b!817819 (= e!453818 (not e!453819))))

(declare-fun res!558050 () Bool)

(assert (=> b!817819 (=> res!558050 e!453819)))

(assert (=> b!817819 (= res!558050 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!366324 () ListLongMap!8259)

(declare-fun lt!366325 () ListLongMap!8259)

(assert (=> b!817819 (= lt!366324 lt!366325)))

(declare-datatypes ((Unit!27843 0))(
  ( (Unit!27844) )
))
(declare-fun lt!366323 () Unit!27843)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!332 (array!45003 array!45005 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24203 V!24203 V!24203 V!24203 (_ BitVec 32) Int) Unit!27843)

(assert (=> b!817819 (= lt!366323 (lemmaNoChangeToArrayThenSameMapNoExtras!332 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2244 (array!45003 array!45005 (_ BitVec 32) (_ BitVec 32) V!24203 V!24203 (_ BitVec 32) Int) ListLongMap!8259)

(assert (=> b!817819 (= lt!366325 (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817819 (= lt!366324 (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817820 () Bool)

(declare-fun res!558052 () Bool)

(assert (=> b!817820 (=> (not res!558052) (not e!453818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45003 (_ BitVec 32)) Bool)

(assert (=> b!817820 (= res!558052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817821 () Bool)

(declare-fun res!558055 () Bool)

(assert (=> b!817821 (=> (not res!558055) (not e!453818))))

(declare-datatypes ((List!15248 0))(
  ( (Nil!15245) (Cons!15244 (h!16379 (_ BitVec 64)) (t!21563 List!15248)) )
))
(declare-fun arrayNoDuplicates!0 (array!45003 (_ BitVec 32) List!15248) Bool)

(assert (=> b!817821 (= res!558055 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15245))))

(declare-fun b!817822 () Bool)

(declare-fun res!558053 () Bool)

(assert (=> b!817822 (=> (not res!558053) (not e!453818))))

(assert (=> b!817822 (= res!558053 (and (= (size!21975 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21974 _keys!976) (size!21975 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817823 () Bool)

(assert (=> b!817823 (= e!453820 (and e!453822 mapRes!23191))))

(declare-fun condMapEmpty!23191 () Bool)

(declare-fun mapDefault!23191 () ValueCell!6785)

(assert (=> b!817823 (= condMapEmpty!23191 (= (arr!21555 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6785)) mapDefault!23191)))))

(assert (= (and start!70482 res!558051) b!817822))

(assert (= (and b!817822 res!558053) b!817820))

(assert (= (and b!817820 res!558052) b!817821))

(assert (= (and b!817821 res!558055) b!817819))

(assert (= (and b!817819 (not res!558050)) b!817815))

(assert (= (and b!817815 (not res!558054)) b!817817))

(assert (= (and b!817823 condMapEmpty!23191) mapIsEmpty!23191))

(assert (= (and b!817823 (not condMapEmpty!23191)) mapNonEmpty!23191))

(get-info :version)

(assert (= (and mapNonEmpty!23191 ((_ is ValueCellFull!6785) mapValue!23191)) b!817816))

(assert (= (and b!817823 ((_ is ValueCellFull!6785) mapDefault!23191)) b!817818))

(assert (= start!70482 b!817823))

(declare-fun m!759833 () Bool)

(assert (=> b!817815 m!759833))

(assert (=> b!817815 m!759833))

(declare-fun m!759835 () Bool)

(assert (=> b!817815 m!759835))

(declare-fun m!759837 () Bool)

(assert (=> b!817815 m!759837))

(declare-fun m!759839 () Bool)

(assert (=> b!817819 m!759839))

(declare-fun m!759841 () Bool)

(assert (=> b!817819 m!759841))

(declare-fun m!759843 () Bool)

(assert (=> b!817819 m!759843))

(declare-fun m!759845 () Bool)

(assert (=> start!70482 m!759845))

(declare-fun m!759847 () Bool)

(assert (=> start!70482 m!759847))

(declare-fun m!759849 () Bool)

(assert (=> start!70482 m!759849))

(declare-fun m!759851 () Bool)

(assert (=> b!817821 m!759851))

(declare-fun m!759853 () Bool)

(assert (=> mapNonEmpty!23191 m!759853))

(declare-fun m!759855 () Bool)

(assert (=> b!817820 m!759855))

(check-sat (not b!817820) (not mapNonEmpty!23191) (not b!817819) b_and!21501 (not b_next!12691) (not b!817821) (not start!70482) tp_is_empty!14401 (not b!817815))
(check-sat b_and!21501 (not b_next!12691))
(get-model)

(declare-fun d!104863 () Bool)

(declare-fun e!453861 () Bool)

(assert (=> d!104863 e!453861))

(declare-fun res!558096 () Bool)

(assert (=> d!104863 (=> (not res!558096) (not e!453861))))

(declare-fun lt!366354 () ListLongMap!8259)

(declare-fun contains!4130 (ListLongMap!8259 (_ BitVec 64)) Bool)

(assert (=> d!104863 (= res!558096 (contains!4130 lt!366354 (_1!4728 (tuple2!9435 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!366355 () List!15247)

(assert (=> d!104863 (= lt!366354 (ListLongMap!8260 lt!366355))))

(declare-fun lt!366352 () Unit!27843)

(declare-fun lt!366353 () Unit!27843)

(assert (=> d!104863 (= lt!366352 lt!366353)))

(declare-datatypes ((Option!408 0))(
  ( (Some!407 (v!9679 V!24203)) (None!406) )
))
(declare-fun getValueByKey!402 (List!15247 (_ BitVec 64)) Option!408)

(assert (=> d!104863 (= (getValueByKey!402 lt!366355 (_1!4728 (tuple2!9435 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!407 (_2!4728 (tuple2!9435 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lemmaContainsTupThenGetReturnValue!216 (List!15247 (_ BitVec 64) V!24203) Unit!27843)

(assert (=> d!104863 (= lt!366353 (lemmaContainsTupThenGetReturnValue!216 lt!366355 (_1!4728 (tuple2!9435 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4728 (tuple2!9435 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun insertStrictlySorted!255 (List!15247 (_ BitVec 64) V!24203) List!15247)

(assert (=> d!104863 (= lt!366355 (insertStrictlySorted!255 (toList!4145 (getCurrentListMap!2361 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796)) (_1!4728 (tuple2!9435 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4728 (tuple2!9435 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104863 (= (+!1821 (getCurrentListMap!2361 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9435 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!366354)))

(declare-fun b!817882 () Bool)

(declare-fun res!558097 () Bool)

(assert (=> b!817882 (=> (not res!558097) (not e!453861))))

(assert (=> b!817882 (= res!558097 (= (getValueByKey!402 (toList!4145 lt!366354) (_1!4728 (tuple2!9435 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!407 (_2!4728 (tuple2!9435 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!817883 () Bool)

(declare-fun contains!4131 (List!15247 tuple2!9434) Bool)

(assert (=> b!817883 (= e!453861 (contains!4131 (toList!4145 lt!366354) (tuple2!9435 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!104863 res!558096) b!817882))

(assert (= (and b!817882 res!558097) b!817883))

(declare-fun m!759905 () Bool)

(assert (=> d!104863 m!759905))

(declare-fun m!759907 () Bool)

(assert (=> d!104863 m!759907))

(declare-fun m!759909 () Bool)

(assert (=> d!104863 m!759909))

(declare-fun m!759911 () Bool)

(assert (=> d!104863 m!759911))

(declare-fun m!759913 () Bool)

(assert (=> b!817882 m!759913))

(declare-fun m!759915 () Bool)

(assert (=> b!817883 m!759915))

(assert (=> b!817815 d!104863))

(declare-fun b!817926 () Bool)

(declare-fun e!453897 () Bool)

(declare-fun e!453894 () Bool)

(assert (=> b!817926 (= e!453897 e!453894)))

(declare-fun res!558122 () Bool)

(declare-fun call!35622 () Bool)

(assert (=> b!817926 (= res!558122 call!35622)))

(assert (=> b!817926 (=> (not res!558122) (not e!453894))))

(declare-fun b!817927 () Bool)

(declare-fun e!453898 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!817927 (= e!453898 (validKeyInArray!0 (select (arr!21554 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35614 () Bool)

(declare-fun call!35617 () ListLongMap!8259)

(declare-fun call!35620 () ListLongMap!8259)

(assert (=> bm!35614 (= call!35617 call!35620)))

(declare-fun d!104865 () Bool)

(declare-fun e!453893 () Bool)

(assert (=> d!104865 e!453893))

(declare-fun res!558116 () Bool)

(assert (=> d!104865 (=> (not res!558116) (not e!453893))))

(assert (=> d!104865 (= res!558116 (or (bvsge #b00000000000000000000000000000000 (size!21974 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21974 _keys!976)))))))

(declare-fun lt!366402 () ListLongMap!8259)

(declare-fun lt!366403 () ListLongMap!8259)

(assert (=> d!104865 (= lt!366402 lt!366403)))

(declare-fun lt!366413 () Unit!27843)

(declare-fun e!453891 () Unit!27843)

(assert (=> d!104865 (= lt!366413 e!453891)))

(declare-fun c!89305 () Bool)

(declare-fun e!453889 () Bool)

(assert (=> d!104865 (= c!89305 e!453889)))

(declare-fun res!558120 () Bool)

(assert (=> d!104865 (=> (not res!558120) (not e!453889))))

(assert (=> d!104865 (= res!558120 (bvslt #b00000000000000000000000000000000 (size!21974 _keys!976)))))

(declare-fun e!453900 () ListLongMap!8259)

(assert (=> d!104865 (= lt!366403 e!453900)))

(declare-fun c!89306 () Bool)

(assert (=> d!104865 (= c!89306 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104865 (validMask!0 mask!1312)))

(assert (=> d!104865 (= (getCurrentListMap!2361 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366402)))

(declare-fun b!817928 () Bool)

(declare-fun e!453895 () ListLongMap!8259)

(declare-fun call!35621 () ListLongMap!8259)

(assert (=> b!817928 (= e!453895 call!35621)))

(declare-fun b!817929 () Bool)

(declare-fun res!558123 () Bool)

(assert (=> b!817929 (=> (not res!558123) (not e!453893))))

(declare-fun e!453896 () Bool)

(assert (=> b!817929 (= res!558123 e!453896)))

(declare-fun c!89308 () Bool)

(assert (=> b!817929 (= c!89308 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun call!35618 () ListLongMap!8259)

(declare-fun call!35619 () ListLongMap!8259)

(declare-fun bm!35615 () Bool)

(declare-fun c!89309 () Bool)

(assert (=> bm!35615 (= call!35619 (+!1821 (ite c!89306 call!35618 (ite c!89309 call!35620 call!35617)) (ite (or c!89306 c!89309) (tuple2!9435 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9435 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!817930 () Bool)

(declare-fun e!453888 () Bool)

(declare-fun apply!351 (ListLongMap!8259 (_ BitVec 64)) V!24203)

(assert (=> b!817930 (= e!453888 (= (apply!351 lt!366402 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun bm!35616 () Bool)

(assert (=> bm!35616 (= call!35618 (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817931 () Bool)

(declare-fun res!558117 () Bool)

(assert (=> b!817931 (=> (not res!558117) (not e!453893))))

(declare-fun e!453890 () Bool)

(assert (=> b!817931 (= res!558117 e!453890)))

(declare-fun res!558121 () Bool)

(assert (=> b!817931 (=> res!558121 e!453890)))

(assert (=> b!817931 (= res!558121 (not e!453898))))

(declare-fun res!558119 () Bool)

(assert (=> b!817931 (=> (not res!558119) (not e!453898))))

(assert (=> b!817931 (= res!558119 (bvslt #b00000000000000000000000000000000 (size!21974 _keys!976)))))

(declare-fun bm!35617 () Bool)

(assert (=> bm!35617 (= call!35622 (contains!4130 lt!366402 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!817932 () Bool)

(assert (=> b!817932 (= e!453893 e!453897)))

(declare-fun c!89307 () Bool)

(assert (=> b!817932 (= c!89307 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!817933 () Bool)

(declare-fun lt!366404 () Unit!27843)

(assert (=> b!817933 (= e!453891 lt!366404)))

(declare-fun lt!366405 () ListLongMap!8259)

(assert (=> b!817933 (= lt!366405 (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366412 () (_ BitVec 64))

(assert (=> b!817933 (= lt!366412 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366401 () (_ BitVec 64))

(assert (=> b!817933 (= lt!366401 (select (arr!21554 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366411 () Unit!27843)

(declare-fun addStillContains!306 (ListLongMap!8259 (_ BitVec 64) V!24203 (_ BitVec 64)) Unit!27843)

(assert (=> b!817933 (= lt!366411 (addStillContains!306 lt!366405 lt!366412 zeroValueBefore!34 lt!366401))))

(assert (=> b!817933 (contains!4130 (+!1821 lt!366405 (tuple2!9435 lt!366412 zeroValueBefore!34)) lt!366401)))

(declare-fun lt!366406 () Unit!27843)

(assert (=> b!817933 (= lt!366406 lt!366411)))

(declare-fun lt!366416 () ListLongMap!8259)

(assert (=> b!817933 (= lt!366416 (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366419 () (_ BitVec 64))

(assert (=> b!817933 (= lt!366419 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366409 () (_ BitVec 64))

(assert (=> b!817933 (= lt!366409 (select (arr!21554 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366417 () Unit!27843)

(declare-fun addApplyDifferent!306 (ListLongMap!8259 (_ BitVec 64) V!24203 (_ BitVec 64)) Unit!27843)

(assert (=> b!817933 (= lt!366417 (addApplyDifferent!306 lt!366416 lt!366419 minValue!754 lt!366409))))

(assert (=> b!817933 (= (apply!351 (+!1821 lt!366416 (tuple2!9435 lt!366419 minValue!754)) lt!366409) (apply!351 lt!366416 lt!366409))))

(declare-fun lt!366415 () Unit!27843)

(assert (=> b!817933 (= lt!366415 lt!366417)))

(declare-fun lt!366400 () ListLongMap!8259)

(assert (=> b!817933 (= lt!366400 (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366418 () (_ BitVec 64))

(assert (=> b!817933 (= lt!366418 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366410 () (_ BitVec 64))

(assert (=> b!817933 (= lt!366410 (select (arr!21554 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366420 () Unit!27843)

(assert (=> b!817933 (= lt!366420 (addApplyDifferent!306 lt!366400 lt!366418 zeroValueBefore!34 lt!366410))))

(assert (=> b!817933 (= (apply!351 (+!1821 lt!366400 (tuple2!9435 lt!366418 zeroValueBefore!34)) lt!366410) (apply!351 lt!366400 lt!366410))))

(declare-fun lt!366408 () Unit!27843)

(assert (=> b!817933 (= lt!366408 lt!366420)))

(declare-fun lt!366421 () ListLongMap!8259)

(assert (=> b!817933 (= lt!366421 (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366407 () (_ BitVec 64))

(assert (=> b!817933 (= lt!366407 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366414 () (_ BitVec 64))

(assert (=> b!817933 (= lt!366414 (select (arr!21554 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!817933 (= lt!366404 (addApplyDifferent!306 lt!366421 lt!366407 minValue!754 lt!366414))))

(assert (=> b!817933 (= (apply!351 (+!1821 lt!366421 (tuple2!9435 lt!366407 minValue!754)) lt!366414) (apply!351 lt!366421 lt!366414))))

(declare-fun bm!35618 () Bool)

(declare-fun call!35623 () Bool)

(assert (=> bm!35618 (= call!35623 (contains!4130 lt!366402 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!817934 () Bool)

(declare-fun e!453899 () ListLongMap!8259)

(assert (=> b!817934 (= e!453899 call!35617)))

(declare-fun b!817935 () Bool)

(assert (=> b!817935 (= e!453894 (= (apply!351 lt!366402 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!817936 () Bool)

(assert (=> b!817936 (= e!453889 (validKeyInArray!0 (select (arr!21554 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817937 () Bool)

(assert (=> b!817937 (= e!453896 e!453888)))

(declare-fun res!558124 () Bool)

(assert (=> b!817937 (= res!558124 call!35623)))

(assert (=> b!817937 (=> (not res!558124) (not e!453888))))

(declare-fun bm!35619 () Bool)

(assert (=> bm!35619 (= call!35620 call!35618)))

(declare-fun b!817938 () Bool)

(assert (=> b!817938 (= e!453900 e!453895)))

(assert (=> b!817938 (= c!89309 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!453892 () Bool)

(declare-fun b!817939 () Bool)

(declare-fun get!11531 (ValueCell!6785 V!24203) V!24203)

(declare-fun dynLambda!959 (Int (_ BitVec 64)) V!24203)

(assert (=> b!817939 (= e!453892 (= (apply!351 lt!366402 (select (arr!21554 _keys!976) #b00000000000000000000000000000000)) (get!11531 (select (arr!21555 _values!788) #b00000000000000000000000000000000) (dynLambda!959 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!817939 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21975 _values!788)))))

(assert (=> b!817939 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21974 _keys!976)))))

(declare-fun b!817940 () Bool)

(declare-fun c!89304 () Bool)

(assert (=> b!817940 (= c!89304 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!817940 (= e!453895 e!453899)))

(declare-fun b!817941 () Bool)

(assert (=> b!817941 (= e!453890 e!453892)))

(declare-fun res!558118 () Bool)

(assert (=> b!817941 (=> (not res!558118) (not e!453892))))

(assert (=> b!817941 (= res!558118 (contains!4130 lt!366402 (select (arr!21554 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817941 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21974 _keys!976)))))

(declare-fun b!817942 () Bool)

(assert (=> b!817942 (= e!453899 call!35621)))

(declare-fun b!817943 () Bool)

(assert (=> b!817943 (= e!453896 (not call!35623))))

(declare-fun bm!35620 () Bool)

(assert (=> bm!35620 (= call!35621 call!35619)))

(declare-fun b!817944 () Bool)

(assert (=> b!817944 (= e!453900 (+!1821 call!35619 (tuple2!9435 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!817945 () Bool)

(assert (=> b!817945 (= e!453897 (not call!35622))))

(declare-fun b!817946 () Bool)

(declare-fun Unit!27847 () Unit!27843)

(assert (=> b!817946 (= e!453891 Unit!27847)))

(assert (= (and d!104865 c!89306) b!817944))

(assert (= (and d!104865 (not c!89306)) b!817938))

(assert (= (and b!817938 c!89309) b!817928))

(assert (= (and b!817938 (not c!89309)) b!817940))

(assert (= (and b!817940 c!89304) b!817942))

(assert (= (and b!817940 (not c!89304)) b!817934))

(assert (= (or b!817942 b!817934) bm!35614))

(assert (= (or b!817928 bm!35614) bm!35619))

(assert (= (or b!817928 b!817942) bm!35620))

(assert (= (or b!817944 bm!35619) bm!35616))

(assert (= (or b!817944 bm!35620) bm!35615))

(assert (= (and d!104865 res!558120) b!817936))

(assert (= (and d!104865 c!89305) b!817933))

(assert (= (and d!104865 (not c!89305)) b!817946))

(assert (= (and d!104865 res!558116) b!817931))

(assert (= (and b!817931 res!558119) b!817927))

(assert (= (and b!817931 (not res!558121)) b!817941))

(assert (= (and b!817941 res!558118) b!817939))

(assert (= (and b!817931 res!558117) b!817929))

(assert (= (and b!817929 c!89308) b!817937))

(assert (= (and b!817929 (not c!89308)) b!817943))

(assert (= (and b!817937 res!558124) b!817930))

(assert (= (or b!817937 b!817943) bm!35618))

(assert (= (and b!817929 res!558123) b!817932))

(assert (= (and b!817932 c!89307) b!817926))

(assert (= (and b!817932 (not c!89307)) b!817945))

(assert (= (and b!817926 res!558122) b!817935))

(assert (= (or b!817926 b!817945) bm!35617))

(declare-fun b_lambda!10901 () Bool)

(assert (=> (not b_lambda!10901) (not b!817939)))

(declare-fun t!21566 () Bool)

(declare-fun tb!4175 () Bool)

(assert (=> (and start!70482 (= defaultEntry!796 defaultEntry!796) t!21566) tb!4175))

(declare-fun result!7881 () Bool)

(assert (=> tb!4175 (= result!7881 tp_is_empty!14401)))

(assert (=> b!817939 t!21566))

(declare-fun b_and!21507 () Bool)

(assert (= b_and!21501 (and (=> t!21566 result!7881) b_and!21507)))

(declare-fun m!759917 () Bool)

(assert (=> bm!35618 m!759917))

(assert (=> d!104865 m!759845))

(declare-fun m!759919 () Bool)

(assert (=> bm!35617 m!759919))

(declare-fun m!759921 () Bool)

(assert (=> b!817930 m!759921))

(declare-fun m!759923 () Bool)

(assert (=> b!817935 m!759923))

(declare-fun m!759925 () Bool)

(assert (=> b!817941 m!759925))

(assert (=> b!817941 m!759925))

(declare-fun m!759927 () Bool)

(assert (=> b!817941 m!759927))

(declare-fun m!759929 () Bool)

(assert (=> b!817944 m!759929))

(assert (=> bm!35616 m!759843))

(assert (=> b!817927 m!759925))

(assert (=> b!817927 m!759925))

(declare-fun m!759931 () Bool)

(assert (=> b!817927 m!759931))

(declare-fun m!759933 () Bool)

(assert (=> b!817939 m!759933))

(declare-fun m!759935 () Bool)

(assert (=> b!817939 m!759935))

(declare-fun m!759937 () Bool)

(assert (=> b!817939 m!759937))

(assert (=> b!817939 m!759933))

(assert (=> b!817939 m!759925))

(assert (=> b!817939 m!759935))

(assert (=> b!817939 m!759925))

(declare-fun m!759939 () Bool)

(assert (=> b!817939 m!759939))

(assert (=> b!817936 m!759925))

(assert (=> b!817936 m!759925))

(assert (=> b!817936 m!759931))

(declare-fun m!759941 () Bool)

(assert (=> b!817933 m!759941))

(declare-fun m!759943 () Bool)

(assert (=> b!817933 m!759943))

(declare-fun m!759945 () Bool)

(assert (=> b!817933 m!759945))

(declare-fun m!759947 () Bool)

(assert (=> b!817933 m!759947))

(declare-fun m!759949 () Bool)

(assert (=> b!817933 m!759949))

(declare-fun m!759951 () Bool)

(assert (=> b!817933 m!759951))

(declare-fun m!759953 () Bool)

(assert (=> b!817933 m!759953))

(declare-fun m!759955 () Bool)

(assert (=> b!817933 m!759955))

(assert (=> b!817933 m!759925))

(declare-fun m!759957 () Bool)

(assert (=> b!817933 m!759957))

(declare-fun m!759959 () Bool)

(assert (=> b!817933 m!759959))

(declare-fun m!759961 () Bool)

(assert (=> b!817933 m!759961))

(declare-fun m!759963 () Bool)

(assert (=> b!817933 m!759963))

(declare-fun m!759965 () Bool)

(assert (=> b!817933 m!759965))

(assert (=> b!817933 m!759951))

(assert (=> b!817933 m!759945))

(assert (=> b!817933 m!759963))

(declare-fun m!759967 () Bool)

(assert (=> b!817933 m!759967))

(assert (=> b!817933 m!759843))

(declare-fun m!759969 () Bool)

(assert (=> b!817933 m!759969))

(assert (=> b!817933 m!759959))

(declare-fun m!759971 () Bool)

(assert (=> bm!35615 m!759971))

(assert (=> b!817815 d!104865))

(declare-fun b!817949 () Bool)

(declare-fun e!453910 () Bool)

(declare-fun e!453907 () Bool)

(assert (=> b!817949 (= e!453910 e!453907)))

(declare-fun res!558131 () Bool)

(declare-fun call!35629 () Bool)

(assert (=> b!817949 (= res!558131 call!35629)))

(assert (=> b!817949 (=> (not res!558131) (not e!453907))))

(declare-fun b!817950 () Bool)

(declare-fun e!453911 () Bool)

(assert (=> b!817950 (= e!453911 (validKeyInArray!0 (select (arr!21554 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35621 () Bool)

(declare-fun call!35624 () ListLongMap!8259)

(declare-fun call!35627 () ListLongMap!8259)

(assert (=> bm!35621 (= call!35624 call!35627)))

(declare-fun d!104867 () Bool)

(declare-fun e!453906 () Bool)

(assert (=> d!104867 e!453906))

(declare-fun res!558125 () Bool)

(assert (=> d!104867 (=> (not res!558125) (not e!453906))))

(assert (=> d!104867 (= res!558125 (or (bvsge #b00000000000000000000000000000000 (size!21974 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21974 _keys!976)))))))

(declare-fun lt!366424 () ListLongMap!8259)

(declare-fun lt!366425 () ListLongMap!8259)

(assert (=> d!104867 (= lt!366424 lt!366425)))

(declare-fun lt!366435 () Unit!27843)

(declare-fun e!453904 () Unit!27843)

(assert (=> d!104867 (= lt!366435 e!453904)))

(declare-fun c!89311 () Bool)

(declare-fun e!453902 () Bool)

(assert (=> d!104867 (= c!89311 e!453902)))

(declare-fun res!558129 () Bool)

(assert (=> d!104867 (=> (not res!558129) (not e!453902))))

(assert (=> d!104867 (= res!558129 (bvslt #b00000000000000000000000000000000 (size!21974 _keys!976)))))

(declare-fun e!453913 () ListLongMap!8259)

(assert (=> d!104867 (= lt!366425 e!453913)))

(declare-fun c!89312 () Bool)

(assert (=> d!104867 (= c!89312 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104867 (validMask!0 mask!1312)))

(assert (=> d!104867 (= (getCurrentListMap!2361 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366424)))

(declare-fun b!817951 () Bool)

(declare-fun e!453908 () ListLongMap!8259)

(declare-fun call!35628 () ListLongMap!8259)

(assert (=> b!817951 (= e!453908 call!35628)))

(declare-fun b!817952 () Bool)

(declare-fun res!558132 () Bool)

(assert (=> b!817952 (=> (not res!558132) (not e!453906))))

(declare-fun e!453909 () Bool)

(assert (=> b!817952 (= res!558132 e!453909)))

(declare-fun c!89314 () Bool)

(assert (=> b!817952 (= c!89314 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun c!89315 () Bool)

(declare-fun call!35625 () ListLongMap!8259)

(declare-fun bm!35622 () Bool)

(declare-fun call!35626 () ListLongMap!8259)

(assert (=> bm!35622 (= call!35626 (+!1821 (ite c!89312 call!35625 (ite c!89315 call!35627 call!35624)) (ite (or c!89312 c!89315) (tuple2!9435 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!9435 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!817953 () Bool)

(declare-fun e!453901 () Bool)

(assert (=> b!817953 (= e!453901 (= (apply!351 lt!366424 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun bm!35623 () Bool)

(assert (=> bm!35623 (= call!35625 (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817954 () Bool)

(declare-fun res!558126 () Bool)

(assert (=> b!817954 (=> (not res!558126) (not e!453906))))

(declare-fun e!453903 () Bool)

(assert (=> b!817954 (= res!558126 e!453903)))

(declare-fun res!558130 () Bool)

(assert (=> b!817954 (=> res!558130 e!453903)))

(assert (=> b!817954 (= res!558130 (not e!453911))))

(declare-fun res!558128 () Bool)

(assert (=> b!817954 (=> (not res!558128) (not e!453911))))

(assert (=> b!817954 (= res!558128 (bvslt #b00000000000000000000000000000000 (size!21974 _keys!976)))))

(declare-fun bm!35624 () Bool)

(assert (=> bm!35624 (= call!35629 (contains!4130 lt!366424 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!817955 () Bool)

(assert (=> b!817955 (= e!453906 e!453910)))

(declare-fun c!89313 () Bool)

(assert (=> b!817955 (= c!89313 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!817956 () Bool)

(declare-fun lt!366426 () Unit!27843)

(assert (=> b!817956 (= e!453904 lt!366426)))

(declare-fun lt!366427 () ListLongMap!8259)

(assert (=> b!817956 (= lt!366427 (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366434 () (_ BitVec 64))

(assert (=> b!817956 (= lt!366434 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366423 () (_ BitVec 64))

(assert (=> b!817956 (= lt!366423 (select (arr!21554 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366433 () Unit!27843)

(assert (=> b!817956 (= lt!366433 (addStillContains!306 lt!366427 lt!366434 zeroValueAfter!34 lt!366423))))

(assert (=> b!817956 (contains!4130 (+!1821 lt!366427 (tuple2!9435 lt!366434 zeroValueAfter!34)) lt!366423)))

(declare-fun lt!366428 () Unit!27843)

(assert (=> b!817956 (= lt!366428 lt!366433)))

(declare-fun lt!366438 () ListLongMap!8259)

(assert (=> b!817956 (= lt!366438 (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366441 () (_ BitVec 64))

(assert (=> b!817956 (= lt!366441 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366431 () (_ BitVec 64))

(assert (=> b!817956 (= lt!366431 (select (arr!21554 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366439 () Unit!27843)

(assert (=> b!817956 (= lt!366439 (addApplyDifferent!306 lt!366438 lt!366441 minValue!754 lt!366431))))

(assert (=> b!817956 (= (apply!351 (+!1821 lt!366438 (tuple2!9435 lt!366441 minValue!754)) lt!366431) (apply!351 lt!366438 lt!366431))))

(declare-fun lt!366437 () Unit!27843)

(assert (=> b!817956 (= lt!366437 lt!366439)))

(declare-fun lt!366422 () ListLongMap!8259)

(assert (=> b!817956 (= lt!366422 (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366440 () (_ BitVec 64))

(assert (=> b!817956 (= lt!366440 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366432 () (_ BitVec 64))

(assert (=> b!817956 (= lt!366432 (select (arr!21554 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366442 () Unit!27843)

(assert (=> b!817956 (= lt!366442 (addApplyDifferent!306 lt!366422 lt!366440 zeroValueAfter!34 lt!366432))))

(assert (=> b!817956 (= (apply!351 (+!1821 lt!366422 (tuple2!9435 lt!366440 zeroValueAfter!34)) lt!366432) (apply!351 lt!366422 lt!366432))))

(declare-fun lt!366430 () Unit!27843)

(assert (=> b!817956 (= lt!366430 lt!366442)))

(declare-fun lt!366443 () ListLongMap!8259)

(assert (=> b!817956 (= lt!366443 (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366429 () (_ BitVec 64))

(assert (=> b!817956 (= lt!366429 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366436 () (_ BitVec 64))

(assert (=> b!817956 (= lt!366436 (select (arr!21554 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!817956 (= lt!366426 (addApplyDifferent!306 lt!366443 lt!366429 minValue!754 lt!366436))))

(assert (=> b!817956 (= (apply!351 (+!1821 lt!366443 (tuple2!9435 lt!366429 minValue!754)) lt!366436) (apply!351 lt!366443 lt!366436))))

(declare-fun bm!35625 () Bool)

(declare-fun call!35630 () Bool)

(assert (=> bm!35625 (= call!35630 (contains!4130 lt!366424 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!817957 () Bool)

(declare-fun e!453912 () ListLongMap!8259)

(assert (=> b!817957 (= e!453912 call!35624)))

(declare-fun b!817958 () Bool)

(assert (=> b!817958 (= e!453907 (= (apply!351 lt!366424 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!817959 () Bool)

(assert (=> b!817959 (= e!453902 (validKeyInArray!0 (select (arr!21554 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817960 () Bool)

(assert (=> b!817960 (= e!453909 e!453901)))

(declare-fun res!558133 () Bool)

(assert (=> b!817960 (= res!558133 call!35630)))

(assert (=> b!817960 (=> (not res!558133) (not e!453901))))

(declare-fun bm!35626 () Bool)

(assert (=> bm!35626 (= call!35627 call!35625)))

(declare-fun b!817961 () Bool)

(assert (=> b!817961 (= e!453913 e!453908)))

(assert (=> b!817961 (= c!89315 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!817962 () Bool)

(declare-fun e!453905 () Bool)

(assert (=> b!817962 (= e!453905 (= (apply!351 lt!366424 (select (arr!21554 _keys!976) #b00000000000000000000000000000000)) (get!11531 (select (arr!21555 _values!788) #b00000000000000000000000000000000) (dynLambda!959 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!817962 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21975 _values!788)))))

(assert (=> b!817962 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21974 _keys!976)))))

(declare-fun b!817963 () Bool)

(declare-fun c!89310 () Bool)

(assert (=> b!817963 (= c!89310 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!817963 (= e!453908 e!453912)))

(declare-fun b!817964 () Bool)

(assert (=> b!817964 (= e!453903 e!453905)))

(declare-fun res!558127 () Bool)

(assert (=> b!817964 (=> (not res!558127) (not e!453905))))

(assert (=> b!817964 (= res!558127 (contains!4130 lt!366424 (select (arr!21554 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817964 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21974 _keys!976)))))

(declare-fun b!817965 () Bool)

(assert (=> b!817965 (= e!453912 call!35628)))

(declare-fun b!817966 () Bool)

(assert (=> b!817966 (= e!453909 (not call!35630))))

(declare-fun bm!35627 () Bool)

(assert (=> bm!35627 (= call!35628 call!35626)))

(declare-fun b!817967 () Bool)

(assert (=> b!817967 (= e!453913 (+!1821 call!35626 (tuple2!9435 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!817968 () Bool)

(assert (=> b!817968 (= e!453910 (not call!35629))))

(declare-fun b!817969 () Bool)

(declare-fun Unit!27848 () Unit!27843)

(assert (=> b!817969 (= e!453904 Unit!27848)))

(assert (= (and d!104867 c!89312) b!817967))

(assert (= (and d!104867 (not c!89312)) b!817961))

(assert (= (and b!817961 c!89315) b!817951))

(assert (= (and b!817961 (not c!89315)) b!817963))

(assert (= (and b!817963 c!89310) b!817965))

(assert (= (and b!817963 (not c!89310)) b!817957))

(assert (= (or b!817965 b!817957) bm!35621))

(assert (= (or b!817951 bm!35621) bm!35626))

(assert (= (or b!817951 b!817965) bm!35627))

(assert (= (or b!817967 bm!35626) bm!35623))

(assert (= (or b!817967 bm!35627) bm!35622))

(assert (= (and d!104867 res!558129) b!817959))

(assert (= (and d!104867 c!89311) b!817956))

(assert (= (and d!104867 (not c!89311)) b!817969))

(assert (= (and d!104867 res!558125) b!817954))

(assert (= (and b!817954 res!558128) b!817950))

(assert (= (and b!817954 (not res!558130)) b!817964))

(assert (= (and b!817964 res!558127) b!817962))

(assert (= (and b!817954 res!558126) b!817952))

(assert (= (and b!817952 c!89314) b!817960))

(assert (= (and b!817952 (not c!89314)) b!817966))

(assert (= (and b!817960 res!558133) b!817953))

(assert (= (or b!817960 b!817966) bm!35625))

(assert (= (and b!817952 res!558132) b!817955))

(assert (= (and b!817955 c!89313) b!817949))

(assert (= (and b!817955 (not c!89313)) b!817968))

(assert (= (and b!817949 res!558131) b!817958))

(assert (= (or b!817949 b!817968) bm!35624))

(declare-fun b_lambda!10903 () Bool)

(assert (=> (not b_lambda!10903) (not b!817962)))

(assert (=> b!817962 t!21566))

(declare-fun b_and!21509 () Bool)

(assert (= b_and!21507 (and (=> t!21566 result!7881) b_and!21509)))

(declare-fun m!759973 () Bool)

(assert (=> bm!35625 m!759973))

(assert (=> d!104867 m!759845))

(declare-fun m!759975 () Bool)

(assert (=> bm!35624 m!759975))

(declare-fun m!759977 () Bool)

(assert (=> b!817953 m!759977))

(declare-fun m!759979 () Bool)

(assert (=> b!817958 m!759979))

(assert (=> b!817964 m!759925))

(assert (=> b!817964 m!759925))

(declare-fun m!759981 () Bool)

(assert (=> b!817964 m!759981))

(declare-fun m!759983 () Bool)

(assert (=> b!817967 m!759983))

(assert (=> bm!35623 m!759841))

(assert (=> b!817950 m!759925))

(assert (=> b!817950 m!759925))

(assert (=> b!817950 m!759931))

(assert (=> b!817962 m!759933))

(assert (=> b!817962 m!759935))

(assert (=> b!817962 m!759937))

(assert (=> b!817962 m!759933))

(assert (=> b!817962 m!759925))

(assert (=> b!817962 m!759935))

(assert (=> b!817962 m!759925))

(declare-fun m!759985 () Bool)

(assert (=> b!817962 m!759985))

(assert (=> b!817959 m!759925))

(assert (=> b!817959 m!759925))

(assert (=> b!817959 m!759931))

(declare-fun m!759987 () Bool)

(assert (=> b!817956 m!759987))

(declare-fun m!759989 () Bool)

(assert (=> b!817956 m!759989))

(declare-fun m!759991 () Bool)

(assert (=> b!817956 m!759991))

(declare-fun m!759993 () Bool)

(assert (=> b!817956 m!759993))

(declare-fun m!759995 () Bool)

(assert (=> b!817956 m!759995))

(declare-fun m!759997 () Bool)

(assert (=> b!817956 m!759997))

(declare-fun m!759999 () Bool)

(assert (=> b!817956 m!759999))

(declare-fun m!760001 () Bool)

(assert (=> b!817956 m!760001))

(assert (=> b!817956 m!759925))

(declare-fun m!760003 () Bool)

(assert (=> b!817956 m!760003))

(declare-fun m!760005 () Bool)

(assert (=> b!817956 m!760005))

(declare-fun m!760007 () Bool)

(assert (=> b!817956 m!760007))

(declare-fun m!760009 () Bool)

(assert (=> b!817956 m!760009))

(declare-fun m!760011 () Bool)

(assert (=> b!817956 m!760011))

(assert (=> b!817956 m!759997))

(assert (=> b!817956 m!759991))

(assert (=> b!817956 m!760009))

(declare-fun m!760013 () Bool)

(assert (=> b!817956 m!760013))

(assert (=> b!817956 m!759841))

(declare-fun m!760015 () Bool)

(assert (=> b!817956 m!760015))

(assert (=> b!817956 m!760005))

(declare-fun m!760017 () Bool)

(assert (=> bm!35622 m!760017))

(assert (=> b!817815 d!104867))

(declare-fun d!104869 () Bool)

(assert (=> d!104869 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70482 d!104869))

(declare-fun d!104871 () Bool)

(assert (=> d!104871 (= (array_inv!17271 _keys!976) (bvsge (size!21974 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70482 d!104871))

(declare-fun d!104873 () Bool)

(assert (=> d!104873 (= (array_inv!17272 _values!788) (bvsge (size!21975 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70482 d!104873))

(declare-fun bm!35630 () Bool)

(declare-fun call!35633 () Bool)

(declare-fun c!89318 () Bool)

(assert (=> bm!35630 (= call!35633 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89318 (Cons!15244 (select (arr!21554 _keys!976) #b00000000000000000000000000000000) Nil!15245) Nil!15245)))))

(declare-fun b!817980 () Bool)

(declare-fun e!453924 () Bool)

(assert (=> b!817980 (= e!453924 call!35633)))

(declare-fun b!817981 () Bool)

(declare-fun e!453923 () Bool)

(assert (=> b!817981 (= e!453923 e!453924)))

(assert (=> b!817981 (= c!89318 (validKeyInArray!0 (select (arr!21554 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104875 () Bool)

(declare-fun res!558141 () Bool)

(declare-fun e!453925 () Bool)

(assert (=> d!104875 (=> res!558141 e!453925)))

(assert (=> d!104875 (= res!558141 (bvsge #b00000000000000000000000000000000 (size!21974 _keys!976)))))

(assert (=> d!104875 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15245) e!453925)))

(declare-fun b!817982 () Bool)

(assert (=> b!817982 (= e!453925 e!453923)))

(declare-fun res!558140 () Bool)

(assert (=> b!817982 (=> (not res!558140) (not e!453923))))

(declare-fun e!453922 () Bool)

(assert (=> b!817982 (= res!558140 (not e!453922))))

(declare-fun res!558142 () Bool)

(assert (=> b!817982 (=> (not res!558142) (not e!453922))))

(assert (=> b!817982 (= res!558142 (validKeyInArray!0 (select (arr!21554 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817983 () Bool)

(assert (=> b!817983 (= e!453924 call!35633)))

(declare-fun b!817984 () Bool)

(declare-fun contains!4132 (List!15248 (_ BitVec 64)) Bool)

(assert (=> b!817984 (= e!453922 (contains!4132 Nil!15245 (select (arr!21554 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104875 (not res!558141)) b!817982))

(assert (= (and b!817982 res!558142) b!817984))

(assert (= (and b!817982 res!558140) b!817981))

(assert (= (and b!817981 c!89318) b!817983))

(assert (= (and b!817981 (not c!89318)) b!817980))

(assert (= (or b!817983 b!817980) bm!35630))

(assert (=> bm!35630 m!759925))

(declare-fun m!760019 () Bool)

(assert (=> bm!35630 m!760019))

(assert (=> b!817981 m!759925))

(assert (=> b!817981 m!759925))

(assert (=> b!817981 m!759931))

(assert (=> b!817982 m!759925))

(assert (=> b!817982 m!759925))

(assert (=> b!817982 m!759931))

(assert (=> b!817984 m!759925))

(assert (=> b!817984 m!759925))

(declare-fun m!760021 () Bool)

(assert (=> b!817984 m!760021))

(assert (=> b!817821 d!104875))

(declare-fun b!817993 () Bool)

(declare-fun e!453933 () Bool)

(declare-fun e!453934 () Bool)

(assert (=> b!817993 (= e!453933 e!453934)))

(declare-fun lt!366452 () (_ BitVec 64))

(assert (=> b!817993 (= lt!366452 (select (arr!21554 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366451 () Unit!27843)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45003 (_ BitVec 64) (_ BitVec 32)) Unit!27843)

(assert (=> b!817993 (= lt!366451 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!366452 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!817993 (arrayContainsKey!0 _keys!976 lt!366452 #b00000000000000000000000000000000)))

(declare-fun lt!366450 () Unit!27843)

(assert (=> b!817993 (= lt!366450 lt!366451)))

(declare-fun res!558148 () Bool)

(declare-datatypes ((SeekEntryResult!8674 0))(
  ( (MissingZero!8674 (index!37067 (_ BitVec 32))) (Found!8674 (index!37068 (_ BitVec 32))) (Intermediate!8674 (undefined!9486 Bool) (index!37069 (_ BitVec 32)) (x!68750 (_ BitVec 32))) (Undefined!8674) (MissingVacant!8674 (index!37070 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45003 (_ BitVec 32)) SeekEntryResult!8674)

(assert (=> b!817993 (= res!558148 (= (seekEntryOrOpen!0 (select (arr!21554 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8674 #b00000000000000000000000000000000)))))

(assert (=> b!817993 (=> (not res!558148) (not e!453934))))

(declare-fun bm!35633 () Bool)

(declare-fun call!35636 () Bool)

(assert (=> bm!35633 (= call!35636 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun d!104877 () Bool)

(declare-fun res!558147 () Bool)

(declare-fun e!453932 () Bool)

(assert (=> d!104877 (=> res!558147 e!453932)))

(assert (=> d!104877 (= res!558147 (bvsge #b00000000000000000000000000000000 (size!21974 _keys!976)))))

(assert (=> d!104877 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!453932)))

(declare-fun b!817994 () Bool)

(assert (=> b!817994 (= e!453932 e!453933)))

(declare-fun c!89321 () Bool)

(assert (=> b!817994 (= c!89321 (validKeyInArray!0 (select (arr!21554 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817995 () Bool)

(assert (=> b!817995 (= e!453934 call!35636)))

(declare-fun b!817996 () Bool)

(assert (=> b!817996 (= e!453933 call!35636)))

(assert (= (and d!104877 (not res!558147)) b!817994))

(assert (= (and b!817994 c!89321) b!817993))

(assert (= (and b!817994 (not c!89321)) b!817996))

(assert (= (and b!817993 res!558148) b!817995))

(assert (= (or b!817995 b!817996) bm!35633))

(assert (=> b!817993 m!759925))

(declare-fun m!760023 () Bool)

(assert (=> b!817993 m!760023))

(declare-fun m!760025 () Bool)

(assert (=> b!817993 m!760025))

(assert (=> b!817993 m!759925))

(declare-fun m!760027 () Bool)

(assert (=> b!817993 m!760027))

(declare-fun m!760029 () Bool)

(assert (=> bm!35633 m!760029))

(assert (=> b!817994 m!759925))

(assert (=> b!817994 m!759925))

(assert (=> b!817994 m!759931))

(assert (=> b!817820 d!104877))

(declare-fun d!104879 () Bool)

(assert (=> d!104879 (= (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366455 () Unit!27843)

(declare-fun choose!1396 (array!45003 array!45005 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24203 V!24203 V!24203 V!24203 (_ BitVec 32) Int) Unit!27843)

(assert (=> d!104879 (= lt!366455 (choose!1396 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104879 (validMask!0 mask!1312)))

(assert (=> d!104879 (= (lemmaNoChangeToArrayThenSameMapNoExtras!332 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366455)))

(declare-fun bs!22770 () Bool)

(assert (= bs!22770 d!104879))

(assert (=> bs!22770 m!759843))

(assert (=> bs!22770 m!759841))

(declare-fun m!760031 () Bool)

(assert (=> bs!22770 m!760031))

(assert (=> bs!22770 m!759845))

(assert (=> b!817819 d!104879))

(declare-fun b!818021 () Bool)

(declare-fun e!453955 () ListLongMap!8259)

(assert (=> b!818021 (= e!453955 (ListLongMap!8260 Nil!15244))))

(declare-fun b!818022 () Bool)

(declare-fun e!453949 () Bool)

(declare-fun e!453954 () Bool)

(assert (=> b!818022 (= e!453949 e!453954)))

(declare-fun c!89331 () Bool)

(declare-fun e!453950 () Bool)

(assert (=> b!818022 (= c!89331 e!453950)))

(declare-fun res!558157 () Bool)

(assert (=> b!818022 (=> (not res!558157) (not e!453950))))

(assert (=> b!818022 (= res!558157 (bvslt #b00000000000000000000000000000000 (size!21974 _keys!976)))))

(declare-fun b!818023 () Bool)

(assert (=> b!818023 (= e!453950 (validKeyInArray!0 (select (arr!21554 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!818023 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!818024 () Bool)

(declare-fun e!453953 () Bool)

(declare-fun lt!366475 () ListLongMap!8259)

(declare-fun isEmpty!639 (ListLongMap!8259) Bool)

(assert (=> b!818024 (= e!453953 (isEmpty!639 lt!366475))))

(declare-fun call!35639 () ListLongMap!8259)

(declare-fun bm!35636 () Bool)

(assert (=> bm!35636 (= call!35639 (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!818025 () Bool)

(declare-fun e!453952 () ListLongMap!8259)

(assert (=> b!818025 (= e!453955 e!453952)))

(declare-fun c!89332 () Bool)

(assert (=> b!818025 (= c!89332 (validKeyInArray!0 (select (arr!21554 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!818026 () Bool)

(assert (=> b!818026 (= e!453952 call!35639)))

(declare-fun d!104881 () Bool)

(assert (=> d!104881 e!453949))

(declare-fun res!558159 () Bool)

(assert (=> d!104881 (=> (not res!558159) (not e!453949))))

(assert (=> d!104881 (= res!558159 (not (contains!4130 lt!366475 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104881 (= lt!366475 e!453955)))

(declare-fun c!89330 () Bool)

(assert (=> d!104881 (= c!89330 (bvsge #b00000000000000000000000000000000 (size!21974 _keys!976)))))

(assert (=> d!104881 (validMask!0 mask!1312)))

(assert (=> d!104881 (= (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366475)))

(declare-fun b!818027 () Bool)

(assert (=> b!818027 (= e!453954 e!453953)))

(declare-fun c!89333 () Bool)

(assert (=> b!818027 (= c!89333 (bvslt #b00000000000000000000000000000000 (size!21974 _keys!976)))))

(declare-fun b!818028 () Bool)

(assert (=> b!818028 (= e!453953 (= lt!366475 (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!818029 () Bool)

(declare-fun e!453951 () Bool)

(assert (=> b!818029 (= e!453954 e!453951)))

(assert (=> b!818029 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21974 _keys!976)))))

(declare-fun res!558160 () Bool)

(assert (=> b!818029 (= res!558160 (contains!4130 lt!366475 (select (arr!21554 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!818029 (=> (not res!558160) (not e!453951))))

(declare-fun b!818030 () Bool)

(declare-fun lt!366470 () Unit!27843)

(declare-fun lt!366476 () Unit!27843)

(assert (=> b!818030 (= lt!366470 lt!366476)))

(declare-fun lt!366471 () (_ BitVec 64))

(declare-fun lt!366472 () ListLongMap!8259)

(declare-fun lt!366474 () V!24203)

(declare-fun lt!366473 () (_ BitVec 64))

(assert (=> b!818030 (not (contains!4130 (+!1821 lt!366472 (tuple2!9435 lt!366473 lt!366474)) lt!366471))))

(declare-fun addStillNotContains!178 (ListLongMap!8259 (_ BitVec 64) V!24203 (_ BitVec 64)) Unit!27843)

(assert (=> b!818030 (= lt!366476 (addStillNotContains!178 lt!366472 lt!366473 lt!366474 lt!366471))))

(assert (=> b!818030 (= lt!366471 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!818030 (= lt!366474 (get!11531 (select (arr!21555 _values!788) #b00000000000000000000000000000000) (dynLambda!959 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!818030 (= lt!366473 (select (arr!21554 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!818030 (= lt!366472 call!35639)))

(assert (=> b!818030 (= e!453952 (+!1821 call!35639 (tuple2!9435 (select (arr!21554 _keys!976) #b00000000000000000000000000000000) (get!11531 (select (arr!21555 _values!788) #b00000000000000000000000000000000) (dynLambda!959 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!818031 () Bool)

(declare-fun res!558158 () Bool)

(assert (=> b!818031 (=> (not res!558158) (not e!453949))))

(assert (=> b!818031 (= res!558158 (not (contains!4130 lt!366475 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!818032 () Bool)

(assert (=> b!818032 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21974 _keys!976)))))

(assert (=> b!818032 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21975 _values!788)))))

(assert (=> b!818032 (= e!453951 (= (apply!351 lt!366475 (select (arr!21554 _keys!976) #b00000000000000000000000000000000)) (get!11531 (select (arr!21555 _values!788) #b00000000000000000000000000000000) (dynLambda!959 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!104881 c!89330) b!818021))

(assert (= (and d!104881 (not c!89330)) b!818025))

(assert (= (and b!818025 c!89332) b!818030))

(assert (= (and b!818025 (not c!89332)) b!818026))

(assert (= (or b!818030 b!818026) bm!35636))

(assert (= (and d!104881 res!558159) b!818031))

(assert (= (and b!818031 res!558158) b!818022))

(assert (= (and b!818022 res!558157) b!818023))

(assert (= (and b!818022 c!89331) b!818029))

(assert (= (and b!818022 (not c!89331)) b!818027))

(assert (= (and b!818029 res!558160) b!818032))

(assert (= (and b!818027 c!89333) b!818028))

(assert (= (and b!818027 (not c!89333)) b!818024))

(declare-fun b_lambda!10905 () Bool)

(assert (=> (not b_lambda!10905) (not b!818030)))

(assert (=> b!818030 t!21566))

(declare-fun b_and!21511 () Bool)

(assert (= b_and!21509 (and (=> t!21566 result!7881) b_and!21511)))

(declare-fun b_lambda!10907 () Bool)

(assert (=> (not b_lambda!10907) (not b!818032)))

(assert (=> b!818032 t!21566))

(declare-fun b_and!21513 () Bool)

(assert (= b_and!21511 (and (=> t!21566 result!7881) b_and!21513)))

(declare-fun m!760033 () Bool)

(assert (=> b!818028 m!760033))

(assert (=> b!818032 m!759925))

(declare-fun m!760035 () Bool)

(assert (=> b!818032 m!760035))

(assert (=> b!818032 m!759925))

(assert (=> b!818032 m!759933))

(assert (=> b!818032 m!759935))

(assert (=> b!818032 m!759937))

(assert (=> b!818032 m!759935))

(assert (=> b!818032 m!759933))

(declare-fun m!760037 () Bool)

(assert (=> b!818030 m!760037))

(assert (=> b!818030 m!759925))

(declare-fun m!760039 () Bool)

(assert (=> b!818030 m!760039))

(declare-fun m!760041 () Bool)

(assert (=> b!818030 m!760041))

(assert (=> b!818030 m!759933))

(declare-fun m!760043 () Bool)

(assert (=> b!818030 m!760043))

(assert (=> b!818030 m!759933))

(assert (=> b!818030 m!759935))

(assert (=> b!818030 m!759937))

(assert (=> b!818030 m!760039))

(assert (=> b!818030 m!759935))

(assert (=> b!818023 m!759925))

(assert (=> b!818023 m!759925))

(assert (=> b!818023 m!759931))

(assert (=> bm!35636 m!760033))

(assert (=> b!818029 m!759925))

(assert (=> b!818029 m!759925))

(declare-fun m!760045 () Bool)

(assert (=> b!818029 m!760045))

(declare-fun m!760047 () Bool)

(assert (=> b!818031 m!760047))

(declare-fun m!760049 () Bool)

(assert (=> b!818024 m!760049))

(assert (=> b!818025 m!759925))

(assert (=> b!818025 m!759925))

(assert (=> b!818025 m!759931))

(declare-fun m!760051 () Bool)

(assert (=> d!104881 m!760051))

(assert (=> d!104881 m!759845))

(assert (=> b!817819 d!104881))

(declare-fun b!818033 () Bool)

(declare-fun e!453962 () ListLongMap!8259)

(assert (=> b!818033 (= e!453962 (ListLongMap!8260 Nil!15244))))

(declare-fun b!818034 () Bool)

(declare-fun e!453956 () Bool)

(declare-fun e!453961 () Bool)

(assert (=> b!818034 (= e!453956 e!453961)))

(declare-fun c!89335 () Bool)

(declare-fun e!453957 () Bool)

(assert (=> b!818034 (= c!89335 e!453957)))

(declare-fun res!558161 () Bool)

(assert (=> b!818034 (=> (not res!558161) (not e!453957))))

(assert (=> b!818034 (= res!558161 (bvslt #b00000000000000000000000000000000 (size!21974 _keys!976)))))

(declare-fun b!818035 () Bool)

(assert (=> b!818035 (= e!453957 (validKeyInArray!0 (select (arr!21554 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!818035 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!818036 () Bool)

(declare-fun e!453960 () Bool)

(declare-fun lt!366482 () ListLongMap!8259)

(assert (=> b!818036 (= e!453960 (isEmpty!639 lt!366482))))

(declare-fun bm!35637 () Bool)

(declare-fun call!35640 () ListLongMap!8259)

(assert (=> bm!35637 (= call!35640 (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!818037 () Bool)

(declare-fun e!453959 () ListLongMap!8259)

(assert (=> b!818037 (= e!453962 e!453959)))

(declare-fun c!89336 () Bool)

(assert (=> b!818037 (= c!89336 (validKeyInArray!0 (select (arr!21554 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!818038 () Bool)

(assert (=> b!818038 (= e!453959 call!35640)))

(declare-fun d!104883 () Bool)

(assert (=> d!104883 e!453956))

(declare-fun res!558163 () Bool)

(assert (=> d!104883 (=> (not res!558163) (not e!453956))))

(assert (=> d!104883 (= res!558163 (not (contains!4130 lt!366482 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104883 (= lt!366482 e!453962)))

(declare-fun c!89334 () Bool)

(assert (=> d!104883 (= c!89334 (bvsge #b00000000000000000000000000000000 (size!21974 _keys!976)))))

(assert (=> d!104883 (validMask!0 mask!1312)))

(assert (=> d!104883 (= (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366482)))

(declare-fun b!818039 () Bool)

(assert (=> b!818039 (= e!453961 e!453960)))

(declare-fun c!89337 () Bool)

(assert (=> b!818039 (= c!89337 (bvslt #b00000000000000000000000000000000 (size!21974 _keys!976)))))

(declare-fun b!818040 () Bool)

(assert (=> b!818040 (= e!453960 (= lt!366482 (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!818041 () Bool)

(declare-fun e!453958 () Bool)

(assert (=> b!818041 (= e!453961 e!453958)))

(assert (=> b!818041 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21974 _keys!976)))))

(declare-fun res!558164 () Bool)

(assert (=> b!818041 (= res!558164 (contains!4130 lt!366482 (select (arr!21554 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!818041 (=> (not res!558164) (not e!453958))))

(declare-fun b!818042 () Bool)

(declare-fun lt!366477 () Unit!27843)

(declare-fun lt!366483 () Unit!27843)

(assert (=> b!818042 (= lt!366477 lt!366483)))

(declare-fun lt!366478 () (_ BitVec 64))

(declare-fun lt!366481 () V!24203)

(declare-fun lt!366479 () ListLongMap!8259)

(declare-fun lt!366480 () (_ BitVec 64))

(assert (=> b!818042 (not (contains!4130 (+!1821 lt!366479 (tuple2!9435 lt!366480 lt!366481)) lt!366478))))

(assert (=> b!818042 (= lt!366483 (addStillNotContains!178 lt!366479 lt!366480 lt!366481 lt!366478))))

(assert (=> b!818042 (= lt!366478 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!818042 (= lt!366481 (get!11531 (select (arr!21555 _values!788) #b00000000000000000000000000000000) (dynLambda!959 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!818042 (= lt!366480 (select (arr!21554 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!818042 (= lt!366479 call!35640)))

(assert (=> b!818042 (= e!453959 (+!1821 call!35640 (tuple2!9435 (select (arr!21554 _keys!976) #b00000000000000000000000000000000) (get!11531 (select (arr!21555 _values!788) #b00000000000000000000000000000000) (dynLambda!959 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!818043 () Bool)

(declare-fun res!558162 () Bool)

(assert (=> b!818043 (=> (not res!558162) (not e!453956))))

(assert (=> b!818043 (= res!558162 (not (contains!4130 lt!366482 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!818044 () Bool)

(assert (=> b!818044 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21974 _keys!976)))))

(assert (=> b!818044 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21975 _values!788)))))

(assert (=> b!818044 (= e!453958 (= (apply!351 lt!366482 (select (arr!21554 _keys!976) #b00000000000000000000000000000000)) (get!11531 (select (arr!21555 _values!788) #b00000000000000000000000000000000) (dynLambda!959 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!104883 c!89334) b!818033))

(assert (= (and d!104883 (not c!89334)) b!818037))

(assert (= (and b!818037 c!89336) b!818042))

(assert (= (and b!818037 (not c!89336)) b!818038))

(assert (= (or b!818042 b!818038) bm!35637))

(assert (= (and d!104883 res!558163) b!818043))

(assert (= (and b!818043 res!558162) b!818034))

(assert (= (and b!818034 res!558161) b!818035))

(assert (= (and b!818034 c!89335) b!818041))

(assert (= (and b!818034 (not c!89335)) b!818039))

(assert (= (and b!818041 res!558164) b!818044))

(assert (= (and b!818039 c!89337) b!818040))

(assert (= (and b!818039 (not c!89337)) b!818036))

(declare-fun b_lambda!10909 () Bool)

(assert (=> (not b_lambda!10909) (not b!818042)))

(assert (=> b!818042 t!21566))

(declare-fun b_and!21515 () Bool)

(assert (= b_and!21513 (and (=> t!21566 result!7881) b_and!21515)))

(declare-fun b_lambda!10911 () Bool)

(assert (=> (not b_lambda!10911) (not b!818044)))

(assert (=> b!818044 t!21566))

(declare-fun b_and!21517 () Bool)

(assert (= b_and!21515 (and (=> t!21566 result!7881) b_and!21517)))

(declare-fun m!760053 () Bool)

(assert (=> b!818040 m!760053))

(assert (=> b!818044 m!759925))

(declare-fun m!760055 () Bool)

(assert (=> b!818044 m!760055))

(assert (=> b!818044 m!759925))

(assert (=> b!818044 m!759933))

(assert (=> b!818044 m!759935))

(assert (=> b!818044 m!759937))

(assert (=> b!818044 m!759935))

(assert (=> b!818044 m!759933))

(declare-fun m!760057 () Bool)

(assert (=> b!818042 m!760057))

(assert (=> b!818042 m!759925))

(declare-fun m!760059 () Bool)

(assert (=> b!818042 m!760059))

(declare-fun m!760061 () Bool)

(assert (=> b!818042 m!760061))

(assert (=> b!818042 m!759933))

(declare-fun m!760063 () Bool)

(assert (=> b!818042 m!760063))

(assert (=> b!818042 m!759933))

(assert (=> b!818042 m!759935))

(assert (=> b!818042 m!759937))

(assert (=> b!818042 m!760059))

(assert (=> b!818042 m!759935))

(assert (=> b!818035 m!759925))

(assert (=> b!818035 m!759925))

(assert (=> b!818035 m!759931))

(assert (=> bm!35637 m!760053))

(assert (=> b!818041 m!759925))

(assert (=> b!818041 m!759925))

(declare-fun m!760065 () Bool)

(assert (=> b!818041 m!760065))

(declare-fun m!760067 () Bool)

(assert (=> b!818043 m!760067))

(declare-fun m!760069 () Bool)

(assert (=> b!818036 m!760069))

(assert (=> b!818037 m!759925))

(assert (=> b!818037 m!759925))

(assert (=> b!818037 m!759931))

(declare-fun m!760071 () Bool)

(assert (=> d!104883 m!760071))

(assert (=> d!104883 m!759845))

(assert (=> b!817819 d!104883))

(declare-fun mapIsEmpty!23200 () Bool)

(declare-fun mapRes!23200 () Bool)

(assert (=> mapIsEmpty!23200 mapRes!23200))

(declare-fun b!818052 () Bool)

(declare-fun e!453967 () Bool)

(assert (=> b!818052 (= e!453967 tp_is_empty!14401)))

(declare-fun b!818051 () Bool)

(declare-fun e!453968 () Bool)

(assert (=> b!818051 (= e!453968 tp_is_empty!14401)))

(declare-fun mapNonEmpty!23200 () Bool)

(declare-fun tp!44812 () Bool)

(assert (=> mapNonEmpty!23200 (= mapRes!23200 (and tp!44812 e!453968))))

(declare-fun mapRest!23200 () (Array (_ BitVec 32) ValueCell!6785))

(declare-fun mapValue!23200 () ValueCell!6785)

(declare-fun mapKey!23200 () (_ BitVec 32))

(assert (=> mapNonEmpty!23200 (= mapRest!23191 (store mapRest!23200 mapKey!23200 mapValue!23200))))

(declare-fun condMapEmpty!23200 () Bool)

(declare-fun mapDefault!23200 () ValueCell!6785)

(assert (=> mapNonEmpty!23191 (= condMapEmpty!23200 (= mapRest!23191 ((as const (Array (_ BitVec 32) ValueCell!6785)) mapDefault!23200)))))

(assert (=> mapNonEmpty!23191 (= tp!44796 (and e!453967 mapRes!23200))))

(assert (= (and mapNonEmpty!23191 condMapEmpty!23200) mapIsEmpty!23200))

(assert (= (and mapNonEmpty!23191 (not condMapEmpty!23200)) mapNonEmpty!23200))

(assert (= (and mapNonEmpty!23200 ((_ is ValueCellFull!6785) mapValue!23200)) b!818051))

(assert (= (and mapNonEmpty!23191 ((_ is ValueCellFull!6785) mapDefault!23200)) b!818052))

(declare-fun m!760073 () Bool)

(assert (=> mapNonEmpty!23200 m!760073))

(declare-fun b_lambda!10913 () Bool)

(assert (= b_lambda!10911 (or (and start!70482 b_free!12691) b_lambda!10913)))

(declare-fun b_lambda!10915 () Bool)

(assert (= b_lambda!10909 (or (and start!70482 b_free!12691) b_lambda!10915)))

(declare-fun b_lambda!10917 () Bool)

(assert (= b_lambda!10905 (or (and start!70482 b_free!12691) b_lambda!10917)))

(declare-fun b_lambda!10919 () Bool)

(assert (= b_lambda!10901 (or (and start!70482 b_free!12691) b_lambda!10919)))

(declare-fun b_lambda!10921 () Bool)

(assert (= b_lambda!10907 (or (and start!70482 b_free!12691) b_lambda!10921)))

(declare-fun b_lambda!10923 () Bool)

(assert (= b_lambda!10903 (or (and start!70482 b_free!12691) b_lambda!10923)))

(check-sat (not b!818036) (not b!818037) (not b!818043) (not b!817959) (not b!817933) (not b!817930) (not b!817935) (not b!818044) (not b!817939) (not bm!35617) (not b!817962) (not b!817958) (not b!818025) (not d!104879) (not d!104863) (not bm!35622) (not b!818031) (not b!818030) b_and!21517 (not b!817950) (not bm!35624) (not b_lambda!10921) (not b!817982) (not b!817993) (not b_lambda!10923) (not bm!35625) (not d!104881) (not bm!35615) (not b_lambda!10919) (not bm!35623) (not d!104883) (not b!817927) (not b_next!12691) (not b!817981) (not bm!35633) (not b_lambda!10917) (not b!817967) (not b!817953) (not b!817882) (not b!817984) (not bm!35637) (not mapNonEmpty!23200) (not d!104867) (not bm!35630) (not b!818041) (not bm!35636) (not b!817941) (not b!818035) (not b!817936) (not b!817956) (not b_lambda!10913) (not b!818042) (not b!817944) (not b_lambda!10915) (not bm!35616) (not b!818029) (not bm!35618) (not b!817964) (not b!817883) (not b!818032) (not b!818024) tp_is_empty!14401 (not d!104865) (not b!818040) (not b!817994) (not b!818023) (not b!818028))
(check-sat b_and!21517 (not b_next!12691))
