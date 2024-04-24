; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70840 () Bool)

(assert start!70840)

(declare-fun b_free!12961 () Bool)

(declare-fun b_next!12961 () Bool)

(assert (=> start!70840 (= b_free!12961 (not b_next!12961))))

(declare-fun tp!45622 () Bool)

(declare-fun b_and!21825 () Bool)

(assert (=> start!70840 (= tp!45622 b_and!21825)))

(declare-fun b!821865 () Bool)

(declare-fun e!456763 () Bool)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((array!45541 0))(
  ( (array!45542 (arr!21818 (Array (_ BitVec 32) (_ BitVec 64))) (size!22238 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45541)

(assert (=> b!821865 (= e!456763 (not (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!22238 _keys!976)))))))

(declare-datatypes ((V!24563 0))(
  ( (V!24564 (val!7383 Int)) )
))
(declare-datatypes ((tuple2!9650 0))(
  ( (tuple2!9651 (_1!4836 (_ BitVec 64)) (_2!4836 V!24563)) )
))
(declare-datatypes ((List!15443 0))(
  ( (Nil!15440) (Cons!15439 (h!16574 tuple2!9650) (t!21768 List!15443)) )
))
(declare-datatypes ((ListLongMap!8475 0))(
  ( (ListLongMap!8476 (toList!4253 List!15443)) )
))
(declare-fun lt!369349 () ListLongMap!8475)

(declare-fun lt!369348 () ListLongMap!8475)

(assert (=> b!821865 (= lt!369349 lt!369348)))

(declare-fun zeroValueAfter!34 () V!24563)

(declare-fun minValue!754 () V!24563)

(declare-datatypes ((ValueCell!6920 0))(
  ( (ValueCellFull!6920 (v!9814 V!24563)) (EmptyCell!6920) )
))
(declare-datatypes ((array!45543 0))(
  ( (array!45544 (arr!21819 (Array (_ BitVec 32) ValueCell!6920)) (size!22239 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45543)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun zeroValueBefore!34 () V!24563)

(declare-datatypes ((Unit!28058 0))(
  ( (Unit!28059) )
))
(declare-fun lt!369347 () Unit!28058)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!432 (array!45541 array!45543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24563 V!24563 V!24563 V!24563 (_ BitVec 32) Int) Unit!28058)

(assert (=> b!821865 (= lt!369347 (lemmaNoChangeToArrayThenSameMapNoExtras!432 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2344 (array!45541 array!45543 (_ BitVec 32) (_ BitVec 32) V!24563 V!24563 (_ BitVec 32) Int) ListLongMap!8475)

(assert (=> b!821865 (= lt!369348 (getCurrentListMapNoExtraKeys!2344 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821865 (= lt!369349 (getCurrentListMapNoExtraKeys!2344 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23611 () Bool)

(declare-fun mapRes!23611 () Bool)

(assert (=> mapIsEmpty!23611 mapRes!23611))

(declare-fun b!821866 () Bool)

(declare-fun e!456761 () Bool)

(declare-fun e!456762 () Bool)

(assert (=> b!821866 (= e!456761 (and e!456762 mapRes!23611))))

(declare-fun condMapEmpty!23611 () Bool)

(declare-fun mapDefault!23611 () ValueCell!6920)

(assert (=> b!821866 (= condMapEmpty!23611 (= (arr!21819 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6920)) mapDefault!23611)))))

(declare-fun b!821867 () Bool)

(declare-fun res!560436 () Bool)

(assert (=> b!821867 (=> (not res!560436) (not e!456763))))

(assert (=> b!821867 (= res!560436 (and (= (size!22239 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22238 _keys!976) (size!22239 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821868 () Bool)

(declare-fun tp_is_empty!14671 () Bool)

(assert (=> b!821868 (= e!456762 tp_is_empty!14671)))

(declare-fun b!821869 () Bool)

(declare-fun res!560435 () Bool)

(assert (=> b!821869 (=> (not res!560435) (not e!456763))))

(declare-datatypes ((List!15444 0))(
  ( (Nil!15441) (Cons!15440 (h!16575 (_ BitVec 64)) (t!21769 List!15444)) )
))
(declare-fun arrayNoDuplicates!0 (array!45541 (_ BitVec 32) List!15444) Bool)

(assert (=> b!821869 (= res!560435 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15441))))

(declare-fun b!821870 () Bool)

(declare-fun e!456764 () Bool)

(assert (=> b!821870 (= e!456764 tp_is_empty!14671)))

(declare-fun b!821871 () Bool)

(declare-fun res!560438 () Bool)

(assert (=> b!821871 (=> (not res!560438) (not e!456763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45541 (_ BitVec 32)) Bool)

(assert (=> b!821871 (= res!560438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!560437 () Bool)

(assert (=> start!70840 (=> (not res!560437) (not e!456763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70840 (= res!560437 (validMask!0 mask!1312))))

(assert (=> start!70840 e!456763))

(assert (=> start!70840 tp_is_empty!14671))

(declare-fun array_inv!17463 (array!45541) Bool)

(assert (=> start!70840 (array_inv!17463 _keys!976)))

(assert (=> start!70840 true))

(declare-fun array_inv!17464 (array!45543) Bool)

(assert (=> start!70840 (and (array_inv!17464 _values!788) e!456761)))

(assert (=> start!70840 tp!45622))

(declare-fun mapNonEmpty!23611 () Bool)

(declare-fun tp!45621 () Bool)

(assert (=> mapNonEmpty!23611 (= mapRes!23611 (and tp!45621 e!456764))))

(declare-fun mapRest!23611 () (Array (_ BitVec 32) ValueCell!6920))

(declare-fun mapValue!23611 () ValueCell!6920)

(declare-fun mapKey!23611 () (_ BitVec 32))

(assert (=> mapNonEmpty!23611 (= (arr!21819 _values!788) (store mapRest!23611 mapKey!23611 mapValue!23611))))

(assert (= (and start!70840 res!560437) b!821867))

(assert (= (and b!821867 res!560436) b!821871))

(assert (= (and b!821871 res!560438) b!821869))

(assert (= (and b!821869 res!560435) b!821865))

(assert (= (and b!821866 condMapEmpty!23611) mapIsEmpty!23611))

(assert (= (and b!821866 (not condMapEmpty!23611)) mapNonEmpty!23611))

(get-info :version)

(assert (= (and mapNonEmpty!23611 ((_ is ValueCellFull!6920) mapValue!23611)) b!821870))

(assert (= (and b!821866 ((_ is ValueCellFull!6920) mapDefault!23611)) b!821868))

(assert (= start!70840 b!821866))

(declare-fun m!764131 () Bool)

(assert (=> start!70840 m!764131))

(declare-fun m!764133 () Bool)

(assert (=> start!70840 m!764133))

(declare-fun m!764135 () Bool)

(assert (=> start!70840 m!764135))

(declare-fun m!764137 () Bool)

(assert (=> b!821871 m!764137))

(declare-fun m!764139 () Bool)

(assert (=> b!821865 m!764139))

(declare-fun m!764141 () Bool)

(assert (=> b!821865 m!764141))

(declare-fun m!764143 () Bool)

(assert (=> b!821865 m!764143))

(declare-fun m!764145 () Bool)

(assert (=> b!821869 m!764145))

(declare-fun m!764147 () Bool)

(assert (=> mapNonEmpty!23611 m!764147))

(check-sat tp_is_empty!14671 (not mapNonEmpty!23611) (not b!821871) (not b_next!12961) (not b!821865) (not start!70840) b_and!21825 (not b!821869))
(check-sat b_and!21825 (not b_next!12961))
(get-model)

(declare-fun b!821922 () Bool)

(declare-fun e!456803 () Bool)

(declare-fun e!456804 () Bool)

(assert (=> b!821922 (= e!456803 e!456804)))

(declare-fun lt!369376 () (_ BitVec 64))

(assert (=> b!821922 (= lt!369376 (select (arr!21818 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!369375 () Unit!28058)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45541 (_ BitVec 64) (_ BitVec 32)) Unit!28058)

(assert (=> b!821922 (= lt!369375 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!369376 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!821922 (arrayContainsKey!0 _keys!976 lt!369376 #b00000000000000000000000000000000)))

(declare-fun lt!369374 () Unit!28058)

(assert (=> b!821922 (= lt!369374 lt!369375)))

(declare-fun res!560468 () Bool)

(declare-datatypes ((SeekEntryResult!8679 0))(
  ( (MissingZero!8679 (index!37087 (_ BitVec 32))) (Found!8679 (index!37088 (_ BitVec 32))) (Intermediate!8679 (undefined!9491 Bool) (index!37089 (_ BitVec 32)) (x!69170 (_ BitVec 32))) (Undefined!8679) (MissingVacant!8679 (index!37090 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45541 (_ BitVec 32)) SeekEntryResult!8679)

(assert (=> b!821922 (= res!560468 (= (seekEntryOrOpen!0 (select (arr!21818 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8679 #b00000000000000000000000000000000)))))

(assert (=> b!821922 (=> (not res!560468) (not e!456804))))

(declare-fun b!821924 () Bool)

(declare-fun call!35760 () Bool)

(assert (=> b!821924 (= e!456804 call!35760)))

(declare-fun bm!35757 () Bool)

(assert (=> bm!35757 (= call!35760 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!821925 () Bool)

(assert (=> b!821925 (= e!456803 call!35760)))

(declare-fun d!105077 () Bool)

(declare-fun res!560467 () Bool)

(declare-fun e!456802 () Bool)

(assert (=> d!105077 (=> res!560467 e!456802)))

(assert (=> d!105077 (= res!560467 (bvsge #b00000000000000000000000000000000 (size!22238 _keys!976)))))

(assert (=> d!105077 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!456802)))

(declare-fun b!821923 () Bool)

(assert (=> b!821923 (= e!456802 e!456803)))

(declare-fun c!89494 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!821923 (= c!89494 (validKeyInArray!0 (select (arr!21818 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105077 (not res!560467)) b!821923))

(assert (= (and b!821923 c!89494) b!821922))

(assert (= (and b!821923 (not c!89494)) b!821925))

(assert (= (and b!821922 res!560468) b!821924))

(assert (= (or b!821924 b!821925) bm!35757))

(declare-fun m!764185 () Bool)

(assert (=> b!821922 m!764185))

(declare-fun m!764187 () Bool)

(assert (=> b!821922 m!764187))

(declare-fun m!764189 () Bool)

(assert (=> b!821922 m!764189))

(assert (=> b!821922 m!764185))

(declare-fun m!764191 () Bool)

(assert (=> b!821922 m!764191))

(declare-fun m!764193 () Bool)

(assert (=> bm!35757 m!764193))

(assert (=> b!821923 m!764185))

(assert (=> b!821923 m!764185))

(declare-fun m!764195 () Bool)

(assert (=> b!821923 m!764195))

(assert (=> b!821871 d!105077))

(declare-fun d!105079 () Bool)

(assert (=> d!105079 (= (getCurrentListMapNoExtraKeys!2344 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2344 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369379 () Unit!28058)

(declare-fun choose!1403 (array!45541 array!45543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24563 V!24563 V!24563 V!24563 (_ BitVec 32) Int) Unit!28058)

(assert (=> d!105079 (= lt!369379 (choose!1403 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105079 (validMask!0 mask!1312)))

(assert (=> d!105079 (= (lemmaNoChangeToArrayThenSameMapNoExtras!432 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369379)))

(declare-fun bs!22912 () Bool)

(assert (= bs!22912 d!105079))

(assert (=> bs!22912 m!764143))

(assert (=> bs!22912 m!764141))

(declare-fun m!764197 () Bool)

(assert (=> bs!22912 m!764197))

(assert (=> bs!22912 m!764131))

(assert (=> b!821865 d!105079))

(declare-fun b!821950 () Bool)

(declare-fun e!456823 () Bool)

(declare-fun e!456825 () Bool)

(assert (=> b!821950 (= e!456823 e!456825)))

(declare-fun c!89503 () Bool)

(declare-fun e!456822 () Bool)

(assert (=> b!821950 (= c!89503 e!456822)))

(declare-fun res!560478 () Bool)

(assert (=> b!821950 (=> (not res!560478) (not e!456822))))

(assert (=> b!821950 (= res!560478 (bvslt #b00000000000000000000000000000000 (size!22238 _keys!976)))))

(declare-fun b!821951 () Bool)

(declare-fun e!456824 () Bool)

(assert (=> b!821951 (= e!456825 e!456824)))

(declare-fun c!89504 () Bool)

(assert (=> b!821951 (= c!89504 (bvslt #b00000000000000000000000000000000 (size!22238 _keys!976)))))

(declare-fun b!821952 () Bool)

(declare-fun e!456821 () Bool)

(assert (=> b!821952 (= e!456825 e!456821)))

(assert (=> b!821952 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22238 _keys!976)))))

(declare-fun res!560477 () Bool)

(declare-fun lt!369400 () ListLongMap!8475)

(declare-fun contains!4143 (ListLongMap!8475 (_ BitVec 64)) Bool)

(assert (=> b!821952 (= res!560477 (contains!4143 lt!369400 (select (arr!21818 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821952 (=> (not res!560477) (not e!456821))))

(declare-fun bm!35760 () Bool)

(declare-fun call!35763 () ListLongMap!8475)

(assert (=> bm!35760 (= call!35763 (getCurrentListMapNoExtraKeys!2344 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!821953 () Bool)

(assert (=> b!821953 (= e!456822 (validKeyInArray!0 (select (arr!21818 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821953 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!821954 () Bool)

(declare-fun isEmpty!644 (ListLongMap!8475) Bool)

(assert (=> b!821954 (= e!456824 (isEmpty!644 lt!369400))))

(declare-fun b!821955 () Bool)

(declare-fun e!456820 () ListLongMap!8475)

(assert (=> b!821955 (= e!456820 (ListLongMap!8476 Nil!15440))))

(declare-fun d!105081 () Bool)

(assert (=> d!105081 e!456823))

(declare-fun res!560480 () Bool)

(assert (=> d!105081 (=> (not res!560480) (not e!456823))))

(assert (=> d!105081 (= res!560480 (not (contains!4143 lt!369400 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105081 (= lt!369400 e!456820)))

(declare-fun c!89505 () Bool)

(assert (=> d!105081 (= c!89505 (bvsge #b00000000000000000000000000000000 (size!22238 _keys!976)))))

(assert (=> d!105081 (validMask!0 mask!1312)))

(assert (=> d!105081 (= (getCurrentListMapNoExtraKeys!2344 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369400)))

(declare-fun b!821956 () Bool)

(declare-fun e!456819 () ListLongMap!8475)

(assert (=> b!821956 (= e!456819 call!35763)))

(declare-fun b!821957 () Bool)

(declare-fun res!560479 () Bool)

(assert (=> b!821957 (=> (not res!560479) (not e!456823))))

(assert (=> b!821957 (= res!560479 (not (contains!4143 lt!369400 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!821958 () Bool)

(assert (=> b!821958 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22238 _keys!976)))))

(assert (=> b!821958 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22239 _values!788)))))

(declare-fun apply!356 (ListLongMap!8475 (_ BitVec 64)) V!24563)

(declare-fun get!11626 (ValueCell!6920 V!24563) V!24563)

(declare-fun dynLambda!964 (Int (_ BitVec 64)) V!24563)

(assert (=> b!821958 (= e!456821 (= (apply!356 lt!369400 (select (arr!21818 _keys!976) #b00000000000000000000000000000000)) (get!11626 (select (arr!21819 _values!788) #b00000000000000000000000000000000) (dynLambda!964 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!821959 () Bool)

(declare-fun lt!369396 () Unit!28058)

(declare-fun lt!369395 () Unit!28058)

(assert (=> b!821959 (= lt!369396 lt!369395)))

(declare-fun lt!369399 () V!24563)

(declare-fun lt!369397 () ListLongMap!8475)

(declare-fun lt!369398 () (_ BitVec 64))

(declare-fun lt!369394 () (_ BitVec 64))

(declare-fun +!1868 (ListLongMap!8475 tuple2!9650) ListLongMap!8475)

(assert (=> b!821959 (not (contains!4143 (+!1868 lt!369397 (tuple2!9651 lt!369398 lt!369399)) lt!369394))))

(declare-fun addStillNotContains!183 (ListLongMap!8475 (_ BitVec 64) V!24563 (_ BitVec 64)) Unit!28058)

(assert (=> b!821959 (= lt!369395 (addStillNotContains!183 lt!369397 lt!369398 lt!369399 lt!369394))))

(assert (=> b!821959 (= lt!369394 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!821959 (= lt!369399 (get!11626 (select (arr!21819 _values!788) #b00000000000000000000000000000000) (dynLambda!964 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!821959 (= lt!369398 (select (arr!21818 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!821959 (= lt!369397 call!35763)))

(assert (=> b!821959 (= e!456819 (+!1868 call!35763 (tuple2!9651 (select (arr!21818 _keys!976) #b00000000000000000000000000000000) (get!11626 (select (arr!21819 _values!788) #b00000000000000000000000000000000) (dynLambda!964 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!821960 () Bool)

(assert (=> b!821960 (= e!456820 e!456819)))

(declare-fun c!89506 () Bool)

(assert (=> b!821960 (= c!89506 (validKeyInArray!0 (select (arr!21818 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821961 () Bool)

(assert (=> b!821961 (= e!456824 (= lt!369400 (getCurrentListMapNoExtraKeys!2344 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(assert (= (and d!105081 c!89505) b!821955))

(assert (= (and d!105081 (not c!89505)) b!821960))

(assert (= (and b!821960 c!89506) b!821959))

(assert (= (and b!821960 (not c!89506)) b!821956))

(assert (= (or b!821959 b!821956) bm!35760))

(assert (= (and d!105081 res!560480) b!821957))

(assert (= (and b!821957 res!560479) b!821950))

(assert (= (and b!821950 res!560478) b!821953))

(assert (= (and b!821950 c!89503) b!821952))

(assert (= (and b!821950 (not c!89503)) b!821951))

(assert (= (and b!821952 res!560477) b!821958))

(assert (= (and b!821951 c!89504) b!821961))

(assert (= (and b!821951 (not c!89504)) b!821954))

(declare-fun b_lambda!11009 () Bool)

(assert (=> (not b_lambda!11009) (not b!821958)))

(declare-fun t!21773 () Bool)

(declare-fun tb!4185 () Bool)

(assert (=> (and start!70840 (= defaultEntry!796 defaultEntry!796) t!21773) tb!4185))

(declare-fun result!7911 () Bool)

(assert (=> tb!4185 (= result!7911 tp_is_empty!14671)))

(assert (=> b!821958 t!21773))

(declare-fun b_and!21831 () Bool)

(assert (= b_and!21825 (and (=> t!21773 result!7911) b_and!21831)))

(declare-fun b_lambda!11011 () Bool)

(assert (=> (not b_lambda!11011) (not b!821959)))

(assert (=> b!821959 t!21773))

(declare-fun b_and!21833 () Bool)

(assert (= b_and!21831 (and (=> t!21773 result!7911) b_and!21833)))

(declare-fun m!764199 () Bool)

(assert (=> b!821959 m!764199))

(declare-fun m!764201 () Bool)

(assert (=> b!821959 m!764201))

(declare-fun m!764203 () Bool)

(assert (=> b!821959 m!764203))

(assert (=> b!821959 m!764199))

(declare-fun m!764205 () Bool)

(assert (=> b!821959 m!764205))

(declare-fun m!764207 () Bool)

(assert (=> b!821959 m!764207))

(assert (=> b!821959 m!764185))

(assert (=> b!821959 m!764205))

(assert (=> b!821959 m!764201))

(declare-fun m!764209 () Bool)

(assert (=> b!821959 m!764209))

(declare-fun m!764211 () Bool)

(assert (=> b!821959 m!764211))

(declare-fun m!764213 () Bool)

(assert (=> b!821957 m!764213))

(assert (=> b!821953 m!764185))

(assert (=> b!821953 m!764185))

(assert (=> b!821953 m!764195))

(declare-fun m!764215 () Bool)

(assert (=> b!821954 m!764215))

(declare-fun m!764217 () Bool)

(assert (=> b!821961 m!764217))

(assert (=> b!821960 m!764185))

(assert (=> b!821960 m!764185))

(assert (=> b!821960 m!764195))

(assert (=> b!821952 m!764185))

(assert (=> b!821952 m!764185))

(declare-fun m!764219 () Bool)

(assert (=> b!821952 m!764219))

(assert (=> bm!35760 m!764217))

(assert (=> b!821958 m!764199))

(assert (=> b!821958 m!764201))

(assert (=> b!821958 m!764203))

(assert (=> b!821958 m!764199))

(assert (=> b!821958 m!764185))

(assert (=> b!821958 m!764185))

(declare-fun m!764221 () Bool)

(assert (=> b!821958 m!764221))

(assert (=> b!821958 m!764201))

(declare-fun m!764223 () Bool)

(assert (=> d!105081 m!764223))

(assert (=> d!105081 m!764131))

(assert (=> b!821865 d!105081))

(declare-fun b!821964 () Bool)

(declare-fun e!456830 () Bool)

(declare-fun e!456832 () Bool)

(assert (=> b!821964 (= e!456830 e!456832)))

(declare-fun c!89507 () Bool)

(declare-fun e!456829 () Bool)

(assert (=> b!821964 (= c!89507 e!456829)))

(declare-fun res!560482 () Bool)

(assert (=> b!821964 (=> (not res!560482) (not e!456829))))

(assert (=> b!821964 (= res!560482 (bvslt #b00000000000000000000000000000000 (size!22238 _keys!976)))))

(declare-fun b!821965 () Bool)

(declare-fun e!456831 () Bool)

(assert (=> b!821965 (= e!456832 e!456831)))

(declare-fun c!89508 () Bool)

(assert (=> b!821965 (= c!89508 (bvslt #b00000000000000000000000000000000 (size!22238 _keys!976)))))

(declare-fun b!821966 () Bool)

(declare-fun e!456828 () Bool)

(assert (=> b!821966 (= e!456832 e!456828)))

(assert (=> b!821966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22238 _keys!976)))))

(declare-fun res!560481 () Bool)

(declare-fun lt!369407 () ListLongMap!8475)

(assert (=> b!821966 (= res!560481 (contains!4143 lt!369407 (select (arr!21818 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821966 (=> (not res!560481) (not e!456828))))

(declare-fun call!35764 () ListLongMap!8475)

(declare-fun bm!35761 () Bool)

(assert (=> bm!35761 (= call!35764 (getCurrentListMapNoExtraKeys!2344 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!821967 () Bool)

(assert (=> b!821967 (= e!456829 (validKeyInArray!0 (select (arr!21818 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821967 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!821968 () Bool)

(assert (=> b!821968 (= e!456831 (isEmpty!644 lt!369407))))

(declare-fun b!821969 () Bool)

(declare-fun e!456827 () ListLongMap!8475)

(assert (=> b!821969 (= e!456827 (ListLongMap!8476 Nil!15440))))

(declare-fun d!105083 () Bool)

(assert (=> d!105083 e!456830))

(declare-fun res!560484 () Bool)

(assert (=> d!105083 (=> (not res!560484) (not e!456830))))

(assert (=> d!105083 (= res!560484 (not (contains!4143 lt!369407 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105083 (= lt!369407 e!456827)))

(declare-fun c!89509 () Bool)

(assert (=> d!105083 (= c!89509 (bvsge #b00000000000000000000000000000000 (size!22238 _keys!976)))))

(assert (=> d!105083 (validMask!0 mask!1312)))

(assert (=> d!105083 (= (getCurrentListMapNoExtraKeys!2344 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369407)))

(declare-fun b!821970 () Bool)

(declare-fun e!456826 () ListLongMap!8475)

(assert (=> b!821970 (= e!456826 call!35764)))

(declare-fun b!821971 () Bool)

(declare-fun res!560483 () Bool)

(assert (=> b!821971 (=> (not res!560483) (not e!456830))))

(assert (=> b!821971 (= res!560483 (not (contains!4143 lt!369407 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!821972 () Bool)

(assert (=> b!821972 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22238 _keys!976)))))

(assert (=> b!821972 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22239 _values!788)))))

(assert (=> b!821972 (= e!456828 (= (apply!356 lt!369407 (select (arr!21818 _keys!976) #b00000000000000000000000000000000)) (get!11626 (select (arr!21819 _values!788) #b00000000000000000000000000000000) (dynLambda!964 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!821973 () Bool)

(declare-fun lt!369403 () Unit!28058)

(declare-fun lt!369402 () Unit!28058)

(assert (=> b!821973 (= lt!369403 lt!369402)))

(declare-fun lt!369401 () (_ BitVec 64))

(declare-fun lt!369405 () (_ BitVec 64))

(declare-fun lt!369406 () V!24563)

(declare-fun lt!369404 () ListLongMap!8475)

(assert (=> b!821973 (not (contains!4143 (+!1868 lt!369404 (tuple2!9651 lt!369405 lt!369406)) lt!369401))))

(assert (=> b!821973 (= lt!369402 (addStillNotContains!183 lt!369404 lt!369405 lt!369406 lt!369401))))

(assert (=> b!821973 (= lt!369401 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!821973 (= lt!369406 (get!11626 (select (arr!21819 _values!788) #b00000000000000000000000000000000) (dynLambda!964 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!821973 (= lt!369405 (select (arr!21818 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!821973 (= lt!369404 call!35764)))

(assert (=> b!821973 (= e!456826 (+!1868 call!35764 (tuple2!9651 (select (arr!21818 _keys!976) #b00000000000000000000000000000000) (get!11626 (select (arr!21819 _values!788) #b00000000000000000000000000000000) (dynLambda!964 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!821974 () Bool)

(assert (=> b!821974 (= e!456827 e!456826)))

(declare-fun c!89510 () Bool)

(assert (=> b!821974 (= c!89510 (validKeyInArray!0 (select (arr!21818 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821975 () Bool)

(assert (=> b!821975 (= e!456831 (= lt!369407 (getCurrentListMapNoExtraKeys!2344 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(assert (= (and d!105083 c!89509) b!821969))

(assert (= (and d!105083 (not c!89509)) b!821974))

(assert (= (and b!821974 c!89510) b!821973))

(assert (= (and b!821974 (not c!89510)) b!821970))

(assert (= (or b!821973 b!821970) bm!35761))

(assert (= (and d!105083 res!560484) b!821971))

(assert (= (and b!821971 res!560483) b!821964))

(assert (= (and b!821964 res!560482) b!821967))

(assert (= (and b!821964 c!89507) b!821966))

(assert (= (and b!821964 (not c!89507)) b!821965))

(assert (= (and b!821966 res!560481) b!821972))

(assert (= (and b!821965 c!89508) b!821975))

(assert (= (and b!821965 (not c!89508)) b!821968))

(declare-fun b_lambda!11013 () Bool)

(assert (=> (not b_lambda!11013) (not b!821972)))

(assert (=> b!821972 t!21773))

(declare-fun b_and!21835 () Bool)

(assert (= b_and!21833 (and (=> t!21773 result!7911) b_and!21835)))

(declare-fun b_lambda!11015 () Bool)

(assert (=> (not b_lambda!11015) (not b!821973)))

(assert (=> b!821973 t!21773))

(declare-fun b_and!21837 () Bool)

(assert (= b_and!21835 (and (=> t!21773 result!7911) b_and!21837)))

(assert (=> b!821973 m!764199))

(assert (=> b!821973 m!764201))

(assert (=> b!821973 m!764203))

(assert (=> b!821973 m!764199))

(declare-fun m!764225 () Bool)

(assert (=> b!821973 m!764225))

(declare-fun m!764227 () Bool)

(assert (=> b!821973 m!764227))

(assert (=> b!821973 m!764185))

(assert (=> b!821973 m!764225))

(assert (=> b!821973 m!764201))

(declare-fun m!764229 () Bool)

(assert (=> b!821973 m!764229))

(declare-fun m!764231 () Bool)

(assert (=> b!821973 m!764231))

(declare-fun m!764233 () Bool)

(assert (=> b!821971 m!764233))

(assert (=> b!821967 m!764185))

(assert (=> b!821967 m!764185))

(assert (=> b!821967 m!764195))

(declare-fun m!764235 () Bool)

(assert (=> b!821968 m!764235))

(declare-fun m!764237 () Bool)

(assert (=> b!821975 m!764237))

(assert (=> b!821974 m!764185))

(assert (=> b!821974 m!764185))

(assert (=> b!821974 m!764195))

(assert (=> b!821966 m!764185))

(assert (=> b!821966 m!764185))

(declare-fun m!764239 () Bool)

(assert (=> b!821966 m!764239))

(assert (=> bm!35761 m!764237))

(assert (=> b!821972 m!764199))

(assert (=> b!821972 m!764201))

(assert (=> b!821972 m!764203))

(assert (=> b!821972 m!764199))

(assert (=> b!821972 m!764185))

(assert (=> b!821972 m!764185))

(declare-fun m!764241 () Bool)

(assert (=> b!821972 m!764241))

(assert (=> b!821972 m!764201))

(declare-fun m!764243 () Bool)

(assert (=> d!105083 m!764243))

(assert (=> d!105083 m!764131))

(assert (=> b!821865 d!105083))

(declare-fun bm!35764 () Bool)

(declare-fun call!35767 () Bool)

(declare-fun c!89513 () Bool)

(assert (=> bm!35764 (= call!35767 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89513 (Cons!15440 (select (arr!21818 _keys!976) #b00000000000000000000000000000000) Nil!15441) Nil!15441)))))

(declare-fun b!821987 () Bool)

(declare-fun e!456843 () Bool)

(assert (=> b!821987 (= e!456843 call!35767)))

(declare-fun b!821988 () Bool)

(declare-fun e!456842 () Bool)

(declare-fun e!456844 () Bool)

(assert (=> b!821988 (= e!456842 e!456844)))

(declare-fun res!560492 () Bool)

(assert (=> b!821988 (=> (not res!560492) (not e!456844))))

(declare-fun e!456841 () Bool)

(assert (=> b!821988 (= res!560492 (not e!456841))))

(declare-fun res!560493 () Bool)

(assert (=> b!821988 (=> (not res!560493) (not e!456841))))

(assert (=> b!821988 (= res!560493 (validKeyInArray!0 (select (arr!21818 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821989 () Bool)

(assert (=> b!821989 (= e!456844 e!456843)))

(assert (=> b!821989 (= c!89513 (validKeyInArray!0 (select (arr!21818 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821990 () Bool)

(assert (=> b!821990 (= e!456843 call!35767)))

(declare-fun d!105085 () Bool)

(declare-fun res!560491 () Bool)

(assert (=> d!105085 (=> res!560491 e!456842)))

(assert (=> d!105085 (= res!560491 (bvsge #b00000000000000000000000000000000 (size!22238 _keys!976)))))

(assert (=> d!105085 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15441) e!456842)))

(declare-fun b!821986 () Bool)

(declare-fun contains!4144 (List!15444 (_ BitVec 64)) Bool)

(assert (=> b!821986 (= e!456841 (contains!4144 Nil!15441 (select (arr!21818 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105085 (not res!560491)) b!821988))

(assert (= (and b!821988 res!560493) b!821986))

(assert (= (and b!821988 res!560492) b!821989))

(assert (= (and b!821989 c!89513) b!821990))

(assert (= (and b!821989 (not c!89513)) b!821987))

(assert (= (or b!821990 b!821987) bm!35764))

(assert (=> bm!35764 m!764185))

(declare-fun m!764245 () Bool)

(assert (=> bm!35764 m!764245))

(assert (=> b!821988 m!764185))

(assert (=> b!821988 m!764185))

(assert (=> b!821988 m!764195))

(assert (=> b!821989 m!764185))

(assert (=> b!821989 m!764185))

(assert (=> b!821989 m!764195))

(assert (=> b!821986 m!764185))

(assert (=> b!821986 m!764185))

(declare-fun m!764247 () Bool)

(assert (=> b!821986 m!764247))

(assert (=> b!821869 d!105085))

(declare-fun d!105087 () Bool)

(assert (=> d!105087 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70840 d!105087))

(declare-fun d!105089 () Bool)

(assert (=> d!105089 (= (array_inv!17463 _keys!976) (bvsge (size!22238 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70840 d!105089))

(declare-fun d!105091 () Bool)

(assert (=> d!105091 (= (array_inv!17464 _values!788) (bvsge (size!22239 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70840 d!105091))

(declare-fun b!821998 () Bool)

(declare-fun e!456849 () Bool)

(assert (=> b!821998 (= e!456849 tp_is_empty!14671)))

(declare-fun condMapEmpty!23620 () Bool)

(declare-fun mapDefault!23620 () ValueCell!6920)

(assert (=> mapNonEmpty!23611 (= condMapEmpty!23620 (= mapRest!23611 ((as const (Array (_ BitVec 32) ValueCell!6920)) mapDefault!23620)))))

(declare-fun mapRes!23620 () Bool)

(assert (=> mapNonEmpty!23611 (= tp!45621 (and e!456849 mapRes!23620))))

(declare-fun b!821997 () Bool)

(declare-fun e!456850 () Bool)

(assert (=> b!821997 (= e!456850 tp_is_empty!14671)))

(declare-fun mapNonEmpty!23620 () Bool)

(declare-fun tp!45637 () Bool)

(assert (=> mapNonEmpty!23620 (= mapRes!23620 (and tp!45637 e!456850))))

(declare-fun mapValue!23620 () ValueCell!6920)

(declare-fun mapRest!23620 () (Array (_ BitVec 32) ValueCell!6920))

(declare-fun mapKey!23620 () (_ BitVec 32))

(assert (=> mapNonEmpty!23620 (= mapRest!23611 (store mapRest!23620 mapKey!23620 mapValue!23620))))

(declare-fun mapIsEmpty!23620 () Bool)

(assert (=> mapIsEmpty!23620 mapRes!23620))

(assert (= (and mapNonEmpty!23611 condMapEmpty!23620) mapIsEmpty!23620))

(assert (= (and mapNonEmpty!23611 (not condMapEmpty!23620)) mapNonEmpty!23620))

(assert (= (and mapNonEmpty!23620 ((_ is ValueCellFull!6920) mapValue!23620)) b!821997))

(assert (= (and mapNonEmpty!23611 ((_ is ValueCellFull!6920) mapDefault!23620)) b!821998))

(declare-fun m!764249 () Bool)

(assert (=> mapNonEmpty!23620 m!764249))

(declare-fun b_lambda!11017 () Bool)

(assert (= b_lambda!11011 (or (and start!70840 b_free!12961) b_lambda!11017)))

(declare-fun b_lambda!11019 () Bool)

(assert (= b_lambda!11015 (or (and start!70840 b_free!12961) b_lambda!11019)))

(declare-fun b_lambda!11021 () Bool)

(assert (= b_lambda!11013 (or (and start!70840 b_free!12961) b_lambda!11021)))

(declare-fun b_lambda!11023 () Bool)

(assert (= b_lambda!11009 (or (and start!70840 b_free!12961) b_lambda!11023)))

(check-sat tp_is_empty!14671 (not b_lambda!11019) (not b!821959) (not b_next!12961) (not b!821986) (not b!821971) (not b!821957) (not b!821989) (not b!821953) (not b!821961) (not mapNonEmpty!23620) (not b!821966) (not b!821958) (not b!821922) (not bm!35764) (not b!821960) b_and!21837 (not b!821968) (not d!105081) (not b_lambda!11023) (not b!821954) (not b_lambda!11021) (not b!821952) (not b!821974) (not d!105083) (not bm!35757) (not b!821975) (not b!821923) (not b!821988) (not d!105079) (not b!821967) (not bm!35761) (not b!821972) (not b!821973) (not b_lambda!11017) (not bm!35760))
(check-sat b_and!21837 (not b_next!12961))
