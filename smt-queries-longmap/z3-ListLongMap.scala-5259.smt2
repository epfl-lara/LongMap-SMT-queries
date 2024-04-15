; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70654 () Bool)

(assert start!70654)

(declare-fun b_free!12961 () Bool)

(declare-fun b_next!12961 () Bool)

(assert (=> start!70654 (= b_free!12961 (not b_next!12961))))

(declare-fun tp!45621 () Bool)

(declare-fun b_and!21789 () Bool)

(assert (=> start!70654 (= tp!45621 b_and!21789)))

(declare-fun b!820725 () Bool)

(declare-fun e!456036 () Bool)

(declare-fun tp_is_empty!14671 () Bool)

(assert (=> b!820725 (= e!456036 tp_is_empty!14671)))

(declare-fun b!820726 () Bool)

(declare-fun res!559986 () Bool)

(declare-fun e!456037 () Bool)

(assert (=> b!820726 (=> (not res!559986) (not e!456037))))

(declare-datatypes ((array!45509 0))(
  ( (array!45510 (arr!21807 (Array (_ BitVec 32) (_ BitVec 64))) (size!22228 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45509)

(declare-datatypes ((List!15558 0))(
  ( (Nil!15555) (Cons!15554 (h!16683 (_ BitVec 64)) (t!21882 List!15558)) )
))
(declare-fun arrayNoDuplicates!0 (array!45509 (_ BitVec 32) List!15558) Bool)

(assert (=> b!820726 (= res!559986 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15555))))

(declare-fun b!820727 () Bool)

(declare-fun e!456034 () Bool)

(assert (=> b!820727 (= e!456034 tp_is_empty!14671)))

(declare-fun b!820728 () Bool)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!820728 (= e!456037 (not (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!22228 _keys!976)))))))

(declare-datatypes ((V!24563 0))(
  ( (V!24564 (val!7383 Int)) )
))
(declare-datatypes ((tuple2!9746 0))(
  ( (tuple2!9747 (_1!4884 (_ BitVec 64)) (_2!4884 V!24563)) )
))
(declare-datatypes ((List!15559 0))(
  ( (Nil!15556) (Cons!15555 (h!16684 tuple2!9746) (t!21883 List!15559)) )
))
(declare-datatypes ((ListLongMap!8559 0))(
  ( (ListLongMap!8560 (toList!4295 List!15559)) )
))
(declare-fun lt!368752 () ListLongMap!8559)

(declare-fun lt!368751 () ListLongMap!8559)

(assert (=> b!820728 (= lt!368752 lt!368751)))

(declare-fun zeroValueBefore!34 () V!24563)

(declare-fun zeroValueAfter!34 () V!24563)

(declare-fun minValue!754 () V!24563)

(declare-datatypes ((ValueCell!6920 0))(
  ( (ValueCellFull!6920 (v!9808 V!24563)) (EmptyCell!6920) )
))
(declare-datatypes ((array!45511 0))(
  ( (array!45512 (arr!21808 (Array (_ BitVec 32) ValueCell!6920)) (size!22229 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45511)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28019 0))(
  ( (Unit!28020) )
))
(declare-fun lt!368750 () Unit!28019)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!440 (array!45509 array!45511 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24563 V!24563 V!24563 V!24563 (_ BitVec 32) Int) Unit!28019)

(assert (=> b!820728 (= lt!368750 (lemmaNoChangeToArrayThenSameMapNoExtras!440 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2347 (array!45509 array!45511 (_ BitVec 32) (_ BitVec 32) V!24563 V!24563 (_ BitVec 32) Int) ListLongMap!8559)

(assert (=> b!820728 (= lt!368751 (getCurrentListMapNoExtraKeys!2347 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820728 (= lt!368752 (getCurrentListMapNoExtraKeys!2347 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23611 () Bool)

(declare-fun mapRes!23611 () Bool)

(declare-fun tp!45622 () Bool)

(assert (=> mapNonEmpty!23611 (= mapRes!23611 (and tp!45622 e!456034))))

(declare-fun mapRest!23611 () (Array (_ BitVec 32) ValueCell!6920))

(declare-fun mapKey!23611 () (_ BitVec 32))

(declare-fun mapValue!23611 () ValueCell!6920)

(assert (=> mapNonEmpty!23611 (= (arr!21808 _values!788) (store mapRest!23611 mapKey!23611 mapValue!23611))))

(declare-fun mapIsEmpty!23611 () Bool)

(assert (=> mapIsEmpty!23611 mapRes!23611))

(declare-fun b!820730 () Bool)

(declare-fun res!559985 () Bool)

(assert (=> b!820730 (=> (not res!559985) (not e!456037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45509 (_ BitVec 32)) Bool)

(assert (=> b!820730 (= res!559985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820731 () Bool)

(declare-fun e!456033 () Bool)

(assert (=> b!820731 (= e!456033 (and e!456036 mapRes!23611))))

(declare-fun condMapEmpty!23611 () Bool)

(declare-fun mapDefault!23611 () ValueCell!6920)

(assert (=> b!820731 (= condMapEmpty!23611 (= (arr!21808 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6920)) mapDefault!23611)))))

(declare-fun res!559983 () Bool)

(assert (=> start!70654 (=> (not res!559983) (not e!456037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70654 (= res!559983 (validMask!0 mask!1312))))

(assert (=> start!70654 e!456037))

(assert (=> start!70654 tp_is_empty!14671))

(declare-fun array_inv!17495 (array!45509) Bool)

(assert (=> start!70654 (array_inv!17495 _keys!976)))

(assert (=> start!70654 true))

(declare-fun array_inv!17496 (array!45511) Bool)

(assert (=> start!70654 (and (array_inv!17496 _values!788) e!456033)))

(assert (=> start!70654 tp!45621))

(declare-fun b!820729 () Bool)

(declare-fun res!559984 () Bool)

(assert (=> b!820729 (=> (not res!559984) (not e!456037))))

(assert (=> b!820729 (= res!559984 (and (= (size!22229 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22228 _keys!976) (size!22229 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70654 res!559983) b!820729))

(assert (= (and b!820729 res!559984) b!820730))

(assert (= (and b!820730 res!559985) b!820726))

(assert (= (and b!820726 res!559986) b!820728))

(assert (= (and b!820731 condMapEmpty!23611) mapIsEmpty!23611))

(assert (= (and b!820731 (not condMapEmpty!23611)) mapNonEmpty!23611))

(get-info :version)

(assert (= (and mapNonEmpty!23611 ((_ is ValueCellFull!6920) mapValue!23611)) b!820727))

(assert (= (and b!820731 ((_ is ValueCellFull!6920) mapDefault!23611)) b!820725))

(assert (= start!70654 b!820731))

(declare-fun m!762097 () Bool)

(assert (=> b!820728 m!762097))

(declare-fun m!762099 () Bool)

(assert (=> b!820728 m!762099))

(declare-fun m!762101 () Bool)

(assert (=> b!820728 m!762101))

(declare-fun m!762103 () Bool)

(assert (=> b!820726 m!762103))

(declare-fun m!762105 () Bool)

(assert (=> start!70654 m!762105))

(declare-fun m!762107 () Bool)

(assert (=> start!70654 m!762107))

(declare-fun m!762109 () Bool)

(assert (=> start!70654 m!762109))

(declare-fun m!762111 () Bool)

(assert (=> mapNonEmpty!23611 m!762111))

(declare-fun m!762113 () Bool)

(assert (=> b!820730 m!762113))

(check-sat (not b_next!12961) (not b!820730) (not mapNonEmpty!23611) tp_is_empty!14671 (not start!70654) (not b!820728) (not b!820726) b_and!21789)
(check-sat b_and!21789 (not b_next!12961))
(get-model)

(declare-fun d!104561 () Bool)

(assert (=> d!104561 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70654 d!104561))

(declare-fun d!104563 () Bool)

(assert (=> d!104563 (= (array_inv!17495 _keys!976) (bvsge (size!22228 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70654 d!104563))

(declare-fun d!104565 () Bool)

(assert (=> d!104565 (= (array_inv!17496 _values!788) (bvsge (size!22229 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70654 d!104565))

(declare-fun d!104567 () Bool)

(assert (=> d!104567 (= (getCurrentListMapNoExtraKeys!2347 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2347 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368773 () Unit!28019)

(declare-fun choose!1406 (array!45509 array!45511 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24563 V!24563 V!24563 V!24563 (_ BitVec 32) Int) Unit!28019)

(assert (=> d!104567 (= lt!368773 (choose!1406 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104567 (validMask!0 mask!1312)))

(assert (=> d!104567 (= (lemmaNoChangeToArrayThenSameMapNoExtras!440 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!368773)))

(declare-fun bs!22866 () Bool)

(assert (= bs!22866 d!104567))

(assert (=> bs!22866 m!762101))

(assert (=> bs!22866 m!762099))

(declare-fun m!762151 () Bool)

(assert (=> bs!22866 m!762151))

(assert (=> bs!22866 m!762105))

(assert (=> b!820728 d!104567))

(declare-fun b!820798 () Bool)

(declare-fun e!456085 () Bool)

(declare-fun e!456083 () Bool)

(assert (=> b!820798 (= e!456085 e!456083)))

(assert (=> b!820798 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22228 _keys!976)))))

(declare-fun res!560019 () Bool)

(declare-fun lt!368793 () ListLongMap!8559)

(declare-fun contains!4144 (ListLongMap!8559 (_ BitVec 64)) Bool)

(assert (=> b!820798 (= res!560019 (contains!4144 lt!368793 (select (arr!21807 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820798 (=> (not res!560019) (not e!456083))))

(declare-fun b!820799 () Bool)

(declare-fun e!456088 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!820799 (= e!456088 (validKeyInArray!0 (select (arr!21807 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820799 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!35686 () Bool)

(declare-fun call!35689 () ListLongMap!8559)

(assert (=> bm!35686 (= call!35689 (getCurrentListMapNoExtraKeys!2347 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!820800 () Bool)

(declare-fun e!456086 () ListLongMap!8559)

(declare-fun e!456084 () ListLongMap!8559)

(assert (=> b!820800 (= e!456086 e!456084)))

(declare-fun c!89156 () Bool)

(assert (=> b!820800 (= c!89156 (validKeyInArray!0 (select (arr!21807 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104569 () Bool)

(declare-fun e!456087 () Bool)

(assert (=> d!104569 e!456087))

(declare-fun res!560020 () Bool)

(assert (=> d!104569 (=> (not res!560020) (not e!456087))))

(assert (=> d!104569 (= res!560020 (not (contains!4144 lt!368793 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104569 (= lt!368793 e!456086)))

(declare-fun c!89153 () Bool)

(assert (=> d!104569 (= c!89153 (bvsge #b00000000000000000000000000000000 (size!22228 _keys!976)))))

(assert (=> d!104569 (validMask!0 mask!1312)))

(assert (=> d!104569 (= (getCurrentListMapNoExtraKeys!2347 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!368793)))

(declare-fun b!820801 () Bool)

(declare-fun e!456082 () Bool)

(assert (=> b!820801 (= e!456085 e!456082)))

(declare-fun c!89155 () Bool)

(assert (=> b!820801 (= c!89155 (bvslt #b00000000000000000000000000000000 (size!22228 _keys!976)))))

(declare-fun b!820802 () Bool)

(assert (=> b!820802 (= e!456086 (ListLongMap!8560 Nil!15556))))

(declare-fun b!820803 () Bool)

(assert (=> b!820803 (= e!456087 e!456085)))

(declare-fun c!89154 () Bool)

(assert (=> b!820803 (= c!89154 e!456088)))

(declare-fun res!560021 () Bool)

(assert (=> b!820803 (=> (not res!560021) (not e!456088))))

(assert (=> b!820803 (= res!560021 (bvslt #b00000000000000000000000000000000 (size!22228 _keys!976)))))

(declare-fun b!820804 () Bool)

(declare-fun lt!368789 () Unit!28019)

(declare-fun lt!368794 () Unit!28019)

(assert (=> b!820804 (= lt!368789 lt!368794)))

(declare-fun lt!368792 () V!24563)

(declare-fun lt!368790 () ListLongMap!8559)

(declare-fun lt!368788 () (_ BitVec 64))

(declare-fun lt!368791 () (_ BitVec 64))

(declare-fun +!1899 (ListLongMap!8559 tuple2!9746) ListLongMap!8559)

(assert (=> b!820804 (not (contains!4144 (+!1899 lt!368790 (tuple2!9747 lt!368788 lt!368792)) lt!368791))))

(declare-fun addStillNotContains!182 (ListLongMap!8559 (_ BitVec 64) V!24563 (_ BitVec 64)) Unit!28019)

(assert (=> b!820804 (= lt!368794 (addStillNotContains!182 lt!368790 lt!368788 lt!368792 lt!368791))))

(assert (=> b!820804 (= lt!368791 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11629 (ValueCell!6920 V!24563) V!24563)

(declare-fun dynLambda!970 (Int (_ BitVec 64)) V!24563)

(assert (=> b!820804 (= lt!368792 (get!11629 (select (arr!21808 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!820804 (= lt!368788 (select (arr!21807 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!820804 (= lt!368790 call!35689)))

(assert (=> b!820804 (= e!456084 (+!1899 call!35689 (tuple2!9747 (select (arr!21807 _keys!976) #b00000000000000000000000000000000) (get!11629 (select (arr!21808 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!820805 () Bool)

(assert (=> b!820805 (= e!456084 call!35689)))

(declare-fun b!820806 () Bool)

(declare-fun isEmpty!643 (ListLongMap!8559) Bool)

(assert (=> b!820806 (= e!456082 (isEmpty!643 lt!368793))))

(declare-fun b!820807 () Bool)

(assert (=> b!820807 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22228 _keys!976)))))

(assert (=> b!820807 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22229 _values!788)))))

(declare-fun apply!356 (ListLongMap!8559 (_ BitVec 64)) V!24563)

(assert (=> b!820807 (= e!456083 (= (apply!356 lt!368793 (select (arr!21807 _keys!976) #b00000000000000000000000000000000)) (get!11629 (select (arr!21808 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!820808 () Bool)

(assert (=> b!820808 (= e!456082 (= lt!368793 (getCurrentListMapNoExtraKeys!2347 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!820809 () Bool)

(declare-fun res!560022 () Bool)

(assert (=> b!820809 (=> (not res!560022) (not e!456087))))

(assert (=> b!820809 (= res!560022 (not (contains!4144 lt!368793 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!104569 c!89153) b!820802))

(assert (= (and d!104569 (not c!89153)) b!820800))

(assert (= (and b!820800 c!89156) b!820804))

(assert (= (and b!820800 (not c!89156)) b!820805))

(assert (= (or b!820804 b!820805) bm!35686))

(assert (= (and d!104569 res!560020) b!820809))

(assert (= (and b!820809 res!560022) b!820803))

(assert (= (and b!820803 res!560021) b!820799))

(assert (= (and b!820803 c!89154) b!820798))

(assert (= (and b!820803 (not c!89154)) b!820801))

(assert (= (and b!820798 res!560019) b!820807))

(assert (= (and b!820801 c!89155) b!820808))

(assert (= (and b!820801 (not c!89155)) b!820806))

(declare-fun b_lambda!10977 () Bool)

(assert (=> (not b_lambda!10977) (not b!820804)))

(declare-fun t!21888 () Bool)

(declare-fun tb!4185 () Bool)

(assert (=> (and start!70654 (= defaultEntry!796 defaultEntry!796) t!21888) tb!4185))

(declare-fun result!7911 () Bool)

(assert (=> tb!4185 (= result!7911 tp_is_empty!14671)))

(assert (=> b!820804 t!21888))

(declare-fun b_and!21795 () Bool)

(assert (= b_and!21789 (and (=> t!21888 result!7911) b_and!21795)))

(declare-fun b_lambda!10979 () Bool)

(assert (=> (not b_lambda!10979) (not b!820807)))

(assert (=> b!820807 t!21888))

(declare-fun b_and!21797 () Bool)

(assert (= b_and!21795 (and (=> t!21888 result!7911) b_and!21797)))

(declare-fun m!762153 () Bool)

(assert (=> b!820809 m!762153))

(declare-fun m!762155 () Bool)

(assert (=> b!820806 m!762155))

(declare-fun m!762157 () Bool)

(assert (=> b!820804 m!762157))

(declare-fun m!762159 () Bool)

(assert (=> b!820804 m!762159))

(declare-fun m!762161 () Bool)

(assert (=> b!820804 m!762161))

(declare-fun m!762163 () Bool)

(assert (=> b!820804 m!762163))

(declare-fun m!762165 () Bool)

(assert (=> b!820804 m!762165))

(declare-fun m!762167 () Bool)

(assert (=> b!820804 m!762167))

(declare-fun m!762169 () Bool)

(assert (=> b!820804 m!762169))

(assert (=> b!820804 m!762167))

(assert (=> b!820804 m!762165))

(assert (=> b!820804 m!762163))

(declare-fun m!762171 () Bool)

(assert (=> b!820804 m!762171))

(assert (=> b!820799 m!762159))

(assert (=> b!820799 m!762159))

(declare-fun m!762173 () Bool)

(assert (=> b!820799 m!762173))

(declare-fun m!762175 () Bool)

(assert (=> d!104569 m!762175))

(assert (=> d!104569 m!762105))

(assert (=> b!820798 m!762159))

(assert (=> b!820798 m!762159))

(declare-fun m!762177 () Bool)

(assert (=> b!820798 m!762177))

(declare-fun m!762179 () Bool)

(assert (=> bm!35686 m!762179))

(assert (=> b!820800 m!762159))

(assert (=> b!820800 m!762159))

(assert (=> b!820800 m!762173))

(assert (=> b!820807 m!762159))

(assert (=> b!820807 m!762159))

(declare-fun m!762181 () Bool)

(assert (=> b!820807 m!762181))

(assert (=> b!820807 m!762163))

(assert (=> b!820807 m!762165))

(assert (=> b!820807 m!762165))

(assert (=> b!820807 m!762163))

(assert (=> b!820807 m!762171))

(assert (=> b!820808 m!762179))

(assert (=> b!820728 d!104569))

(declare-fun b!820812 () Bool)

(declare-fun e!456092 () Bool)

(declare-fun e!456090 () Bool)

(assert (=> b!820812 (= e!456092 e!456090)))

(assert (=> b!820812 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22228 _keys!976)))))

(declare-fun res!560023 () Bool)

(declare-fun lt!368800 () ListLongMap!8559)

(assert (=> b!820812 (= res!560023 (contains!4144 lt!368800 (select (arr!21807 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820812 (=> (not res!560023) (not e!456090))))

(declare-fun b!820813 () Bool)

(declare-fun e!456095 () Bool)

(assert (=> b!820813 (= e!456095 (validKeyInArray!0 (select (arr!21807 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820813 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun call!35690 () ListLongMap!8559)

(declare-fun bm!35687 () Bool)

(assert (=> bm!35687 (= call!35690 (getCurrentListMapNoExtraKeys!2347 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!820814 () Bool)

(declare-fun e!456093 () ListLongMap!8559)

(declare-fun e!456091 () ListLongMap!8559)

(assert (=> b!820814 (= e!456093 e!456091)))

(declare-fun c!89160 () Bool)

(assert (=> b!820814 (= c!89160 (validKeyInArray!0 (select (arr!21807 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104571 () Bool)

(declare-fun e!456094 () Bool)

(assert (=> d!104571 e!456094))

(declare-fun res!560024 () Bool)

(assert (=> d!104571 (=> (not res!560024) (not e!456094))))

(assert (=> d!104571 (= res!560024 (not (contains!4144 lt!368800 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104571 (= lt!368800 e!456093)))

(declare-fun c!89157 () Bool)

(assert (=> d!104571 (= c!89157 (bvsge #b00000000000000000000000000000000 (size!22228 _keys!976)))))

(assert (=> d!104571 (validMask!0 mask!1312)))

(assert (=> d!104571 (= (getCurrentListMapNoExtraKeys!2347 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!368800)))

(declare-fun b!820815 () Bool)

(declare-fun e!456089 () Bool)

(assert (=> b!820815 (= e!456092 e!456089)))

(declare-fun c!89159 () Bool)

(assert (=> b!820815 (= c!89159 (bvslt #b00000000000000000000000000000000 (size!22228 _keys!976)))))

(declare-fun b!820816 () Bool)

(assert (=> b!820816 (= e!456093 (ListLongMap!8560 Nil!15556))))

(declare-fun b!820817 () Bool)

(assert (=> b!820817 (= e!456094 e!456092)))

(declare-fun c!89158 () Bool)

(assert (=> b!820817 (= c!89158 e!456095)))

(declare-fun res!560025 () Bool)

(assert (=> b!820817 (=> (not res!560025) (not e!456095))))

(assert (=> b!820817 (= res!560025 (bvslt #b00000000000000000000000000000000 (size!22228 _keys!976)))))

(declare-fun b!820818 () Bool)

(declare-fun lt!368796 () Unit!28019)

(declare-fun lt!368801 () Unit!28019)

(assert (=> b!820818 (= lt!368796 lt!368801)))

(declare-fun lt!368795 () (_ BitVec 64))

(declare-fun lt!368798 () (_ BitVec 64))

(declare-fun lt!368799 () V!24563)

(declare-fun lt!368797 () ListLongMap!8559)

(assert (=> b!820818 (not (contains!4144 (+!1899 lt!368797 (tuple2!9747 lt!368795 lt!368799)) lt!368798))))

(assert (=> b!820818 (= lt!368801 (addStillNotContains!182 lt!368797 lt!368795 lt!368799 lt!368798))))

(assert (=> b!820818 (= lt!368798 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!820818 (= lt!368799 (get!11629 (select (arr!21808 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!820818 (= lt!368795 (select (arr!21807 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!820818 (= lt!368797 call!35690)))

(assert (=> b!820818 (= e!456091 (+!1899 call!35690 (tuple2!9747 (select (arr!21807 _keys!976) #b00000000000000000000000000000000) (get!11629 (select (arr!21808 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!820819 () Bool)

(assert (=> b!820819 (= e!456091 call!35690)))

(declare-fun b!820820 () Bool)

(assert (=> b!820820 (= e!456089 (isEmpty!643 lt!368800))))

(declare-fun b!820821 () Bool)

(assert (=> b!820821 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22228 _keys!976)))))

(assert (=> b!820821 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22229 _values!788)))))

(assert (=> b!820821 (= e!456090 (= (apply!356 lt!368800 (select (arr!21807 _keys!976) #b00000000000000000000000000000000)) (get!11629 (select (arr!21808 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!820822 () Bool)

(assert (=> b!820822 (= e!456089 (= lt!368800 (getCurrentListMapNoExtraKeys!2347 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!820823 () Bool)

(declare-fun res!560026 () Bool)

(assert (=> b!820823 (=> (not res!560026) (not e!456094))))

(assert (=> b!820823 (= res!560026 (not (contains!4144 lt!368800 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!104571 c!89157) b!820816))

(assert (= (and d!104571 (not c!89157)) b!820814))

(assert (= (and b!820814 c!89160) b!820818))

(assert (= (and b!820814 (not c!89160)) b!820819))

(assert (= (or b!820818 b!820819) bm!35687))

(assert (= (and d!104571 res!560024) b!820823))

(assert (= (and b!820823 res!560026) b!820817))

(assert (= (and b!820817 res!560025) b!820813))

(assert (= (and b!820817 c!89158) b!820812))

(assert (= (and b!820817 (not c!89158)) b!820815))

(assert (= (and b!820812 res!560023) b!820821))

(assert (= (and b!820815 c!89159) b!820822))

(assert (= (and b!820815 (not c!89159)) b!820820))

(declare-fun b_lambda!10981 () Bool)

(assert (=> (not b_lambda!10981) (not b!820818)))

(assert (=> b!820818 t!21888))

(declare-fun b_and!21799 () Bool)

(assert (= b_and!21797 (and (=> t!21888 result!7911) b_and!21799)))

(declare-fun b_lambda!10983 () Bool)

(assert (=> (not b_lambda!10983) (not b!820821)))

(assert (=> b!820821 t!21888))

(declare-fun b_and!21801 () Bool)

(assert (= b_and!21799 (and (=> t!21888 result!7911) b_and!21801)))

(declare-fun m!762183 () Bool)

(assert (=> b!820823 m!762183))

(declare-fun m!762185 () Bool)

(assert (=> b!820820 m!762185))

(declare-fun m!762187 () Bool)

(assert (=> b!820818 m!762187))

(assert (=> b!820818 m!762159))

(declare-fun m!762189 () Bool)

(assert (=> b!820818 m!762189))

(assert (=> b!820818 m!762163))

(assert (=> b!820818 m!762165))

(declare-fun m!762191 () Bool)

(assert (=> b!820818 m!762191))

(declare-fun m!762193 () Bool)

(assert (=> b!820818 m!762193))

(assert (=> b!820818 m!762191))

(assert (=> b!820818 m!762165))

(assert (=> b!820818 m!762163))

(assert (=> b!820818 m!762171))

(assert (=> b!820813 m!762159))

(assert (=> b!820813 m!762159))

(assert (=> b!820813 m!762173))

(declare-fun m!762195 () Bool)

(assert (=> d!104571 m!762195))

(assert (=> d!104571 m!762105))

(assert (=> b!820812 m!762159))

(assert (=> b!820812 m!762159))

(declare-fun m!762197 () Bool)

(assert (=> b!820812 m!762197))

(declare-fun m!762199 () Bool)

(assert (=> bm!35687 m!762199))

(assert (=> b!820814 m!762159))

(assert (=> b!820814 m!762159))

(assert (=> b!820814 m!762173))

(assert (=> b!820821 m!762159))

(assert (=> b!820821 m!762159))

(declare-fun m!762201 () Bool)

(assert (=> b!820821 m!762201))

(assert (=> b!820821 m!762163))

(assert (=> b!820821 m!762165))

(assert (=> b!820821 m!762165))

(assert (=> b!820821 m!762163))

(assert (=> b!820821 m!762171))

(assert (=> b!820822 m!762199))

(assert (=> b!820728 d!104571))

(declare-fun b!820832 () Bool)

(declare-fun e!456104 () Bool)

(declare-fun call!35693 () Bool)

(assert (=> b!820832 (= e!456104 call!35693)))

(declare-fun d!104573 () Bool)

(declare-fun res!560032 () Bool)

(declare-fun e!456102 () Bool)

(assert (=> d!104573 (=> res!560032 e!456102)))

(assert (=> d!104573 (= res!560032 (bvsge #b00000000000000000000000000000000 (size!22228 _keys!976)))))

(assert (=> d!104573 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!456102)))

(declare-fun b!820833 () Bool)

(declare-fun e!456103 () Bool)

(assert (=> b!820833 (= e!456102 e!456103)))

(declare-fun c!89163 () Bool)

(assert (=> b!820833 (= c!89163 (validKeyInArray!0 (select (arr!21807 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820834 () Bool)

(assert (=> b!820834 (= e!456103 e!456104)))

(declare-fun lt!368809 () (_ BitVec 64))

(assert (=> b!820834 (= lt!368809 (select (arr!21807 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368808 () Unit!28019)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45509 (_ BitVec 64) (_ BitVec 32)) Unit!28019)

(assert (=> b!820834 (= lt!368808 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!368809 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!820834 (arrayContainsKey!0 _keys!976 lt!368809 #b00000000000000000000000000000000)))

(declare-fun lt!368810 () Unit!28019)

(assert (=> b!820834 (= lt!368810 lt!368808)))

(declare-fun res!560031 () Bool)

(declare-datatypes ((SeekEntryResult!8724 0))(
  ( (MissingZero!8724 (index!37267 (_ BitVec 32))) (Found!8724 (index!37268 (_ BitVec 32))) (Intermediate!8724 (undefined!9536 Bool) (index!37269 (_ BitVec 32)) (x!69196 (_ BitVec 32))) (Undefined!8724) (MissingVacant!8724 (index!37270 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45509 (_ BitVec 32)) SeekEntryResult!8724)

(assert (=> b!820834 (= res!560031 (= (seekEntryOrOpen!0 (select (arr!21807 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8724 #b00000000000000000000000000000000)))))

(assert (=> b!820834 (=> (not res!560031) (not e!456104))))

(declare-fun bm!35690 () Bool)

(assert (=> bm!35690 (= call!35693 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!820835 () Bool)

(assert (=> b!820835 (= e!456103 call!35693)))

(assert (= (and d!104573 (not res!560032)) b!820833))

(assert (= (and b!820833 c!89163) b!820834))

(assert (= (and b!820833 (not c!89163)) b!820835))

(assert (= (and b!820834 res!560031) b!820832))

(assert (= (or b!820832 b!820835) bm!35690))

(assert (=> b!820833 m!762159))

(assert (=> b!820833 m!762159))

(assert (=> b!820833 m!762173))

(assert (=> b!820834 m!762159))

(declare-fun m!762203 () Bool)

(assert (=> b!820834 m!762203))

(declare-fun m!762205 () Bool)

(assert (=> b!820834 m!762205))

(assert (=> b!820834 m!762159))

(declare-fun m!762207 () Bool)

(assert (=> b!820834 m!762207))

(declare-fun m!762209 () Bool)

(assert (=> bm!35690 m!762209))

(assert (=> b!820730 d!104573))

(declare-fun b!820846 () Bool)

(declare-fun e!456115 () Bool)

(declare-fun e!456113 () Bool)

(assert (=> b!820846 (= e!456115 e!456113)))

(declare-fun res!560041 () Bool)

(assert (=> b!820846 (=> (not res!560041) (not e!456113))))

(declare-fun e!456116 () Bool)

(assert (=> b!820846 (= res!560041 (not e!456116))))

(declare-fun res!560039 () Bool)

(assert (=> b!820846 (=> (not res!560039) (not e!456116))))

(assert (=> b!820846 (= res!560039 (validKeyInArray!0 (select (arr!21807 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35693 () Bool)

(declare-fun call!35696 () Bool)

(declare-fun c!89166 () Bool)

(assert (=> bm!35693 (= call!35696 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89166 (Cons!15554 (select (arr!21807 _keys!976) #b00000000000000000000000000000000) Nil!15555) Nil!15555)))))

(declare-fun b!820847 () Bool)

(declare-fun e!456114 () Bool)

(assert (=> b!820847 (= e!456114 call!35696)))

(declare-fun d!104575 () Bool)

(declare-fun res!560040 () Bool)

(assert (=> d!104575 (=> res!560040 e!456115)))

(assert (=> d!104575 (= res!560040 (bvsge #b00000000000000000000000000000000 (size!22228 _keys!976)))))

(assert (=> d!104575 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15555) e!456115)))

(declare-fun b!820848 () Bool)

(declare-fun contains!4145 (List!15558 (_ BitVec 64)) Bool)

(assert (=> b!820848 (= e!456116 (contains!4145 Nil!15555 (select (arr!21807 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820849 () Bool)

(assert (=> b!820849 (= e!456113 e!456114)))

(assert (=> b!820849 (= c!89166 (validKeyInArray!0 (select (arr!21807 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820850 () Bool)

(assert (=> b!820850 (= e!456114 call!35696)))

(assert (= (and d!104575 (not res!560040)) b!820846))

(assert (= (and b!820846 res!560039) b!820848))

(assert (= (and b!820846 res!560041) b!820849))

(assert (= (and b!820849 c!89166) b!820847))

(assert (= (and b!820849 (not c!89166)) b!820850))

(assert (= (or b!820847 b!820850) bm!35693))

(assert (=> b!820846 m!762159))

(assert (=> b!820846 m!762159))

(assert (=> b!820846 m!762173))

(assert (=> bm!35693 m!762159))

(declare-fun m!762211 () Bool)

(assert (=> bm!35693 m!762211))

(assert (=> b!820848 m!762159))

(assert (=> b!820848 m!762159))

(declare-fun m!762213 () Bool)

(assert (=> b!820848 m!762213))

(assert (=> b!820849 m!762159))

(assert (=> b!820849 m!762159))

(assert (=> b!820849 m!762173))

(assert (=> b!820726 d!104575))

(declare-fun b!820857 () Bool)

(declare-fun e!456122 () Bool)

(assert (=> b!820857 (= e!456122 tp_is_empty!14671)))

(declare-fun mapIsEmpty!23620 () Bool)

(declare-fun mapRes!23620 () Bool)

(assert (=> mapIsEmpty!23620 mapRes!23620))

(declare-fun b!820858 () Bool)

(declare-fun e!456121 () Bool)

(assert (=> b!820858 (= e!456121 tp_is_empty!14671)))

(declare-fun mapNonEmpty!23620 () Bool)

(declare-fun tp!45637 () Bool)

(assert (=> mapNonEmpty!23620 (= mapRes!23620 (and tp!45637 e!456122))))

(declare-fun mapKey!23620 () (_ BitVec 32))

(declare-fun mapRest!23620 () (Array (_ BitVec 32) ValueCell!6920))

(declare-fun mapValue!23620 () ValueCell!6920)

(assert (=> mapNonEmpty!23620 (= mapRest!23611 (store mapRest!23620 mapKey!23620 mapValue!23620))))

(declare-fun condMapEmpty!23620 () Bool)

(declare-fun mapDefault!23620 () ValueCell!6920)

(assert (=> mapNonEmpty!23611 (= condMapEmpty!23620 (= mapRest!23611 ((as const (Array (_ BitVec 32) ValueCell!6920)) mapDefault!23620)))))

(assert (=> mapNonEmpty!23611 (= tp!45622 (and e!456121 mapRes!23620))))

(assert (= (and mapNonEmpty!23611 condMapEmpty!23620) mapIsEmpty!23620))

(assert (= (and mapNonEmpty!23611 (not condMapEmpty!23620)) mapNonEmpty!23620))

(assert (= (and mapNonEmpty!23620 ((_ is ValueCellFull!6920) mapValue!23620)) b!820857))

(assert (= (and mapNonEmpty!23611 ((_ is ValueCellFull!6920) mapDefault!23620)) b!820858))

(declare-fun m!762215 () Bool)

(assert (=> mapNonEmpty!23620 m!762215))

(declare-fun b_lambda!10985 () Bool)

(assert (= b_lambda!10983 (or (and start!70654 b_free!12961) b_lambda!10985)))

(declare-fun b_lambda!10987 () Bool)

(assert (= b_lambda!10979 (or (and start!70654 b_free!12961) b_lambda!10987)))

(declare-fun b_lambda!10989 () Bool)

(assert (= b_lambda!10981 (or (and start!70654 b_free!12961) b_lambda!10989)))

(declare-fun b_lambda!10991 () Bool)

(assert (= b_lambda!10977 (or (and start!70654 b_free!12961) b_lambda!10991)))

(check-sat (not b!820808) (not b_next!12961) (not b_lambda!10985) (not b!820849) (not b!820812) (not b!820814) (not b!820820) (not d!104571) (not mapNonEmpty!23620) b_and!21801 (not b!820823) (not b!820833) (not b!820800) (not b!820848) (not b!820804) (not d!104567) (not b_lambda!10987) (not b!820798) (not b!820821) (not b_lambda!10991) (not b!820822) (not b!820806) (not d!104569) tp_is_empty!14671 (not b!820799) (not b!820809) (not b!820813) (not bm!35687) (not bm!35693) (not bm!35690) (not b!820834) (not b_lambda!10989) (not b!820818) (not b!820807) (not bm!35686) (not b!820846))
(check-sat b_and!21801 (not b_next!12961))
