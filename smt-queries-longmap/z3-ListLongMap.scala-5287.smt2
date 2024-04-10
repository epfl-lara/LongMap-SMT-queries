; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70894 () Bool)

(assert start!70894)

(declare-fun b_free!13131 () Bool)

(declare-fun b_next!13131 () Bool)

(assert (=> start!70894 (= b_free!13131 (not b_next!13131))))

(declare-fun tp!46140 () Bool)

(declare-fun b_and!22015 () Bool)

(assert (=> start!70894 (= tp!46140 b_and!22015)))

(declare-fun b!823427 () Bool)

(declare-fun e!457980 () Bool)

(declare-fun e!457978 () Bool)

(declare-fun mapRes!23875 () Bool)

(assert (=> b!823427 (= e!457980 (and e!457978 mapRes!23875))))

(declare-fun condMapEmpty!23875 () Bool)

(declare-datatypes ((V!24789 0))(
  ( (V!24790 (val!7468 Int)) )
))
(declare-datatypes ((ValueCell!7005 0))(
  ( (ValueCellFull!7005 (v!9900 V!24789)) (EmptyCell!7005) )
))
(declare-datatypes ((array!45872 0))(
  ( (array!45873 (arr!21985 (Array (_ BitVec 32) ValueCell!7005)) (size!22406 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45872)

(declare-fun mapDefault!23875 () ValueCell!7005)

(assert (=> b!823427 (= condMapEmpty!23875 (= (arr!21985 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7005)) mapDefault!23875)))))

(declare-fun b!823428 () Bool)

(declare-fun e!457981 () Bool)

(declare-datatypes ((array!45874 0))(
  ( (array!45875 (arr!21986 (Array (_ BitVec 32) (_ BitVec 64))) (size!22407 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45874)

(assert (=> b!823428 (= e!457981 (bvsle #b00000000000000000000000000000000 (size!22407 _keys!976)))))

(declare-datatypes ((tuple2!9876 0))(
  ( (tuple2!9877 (_1!4949 (_ BitVec 64)) (_2!4949 V!24789)) )
))
(declare-datatypes ((List!15688 0))(
  ( (Nil!15685) (Cons!15684 (h!16813 tuple2!9876) (t!22027 List!15688)) )
))
(declare-datatypes ((ListLongMap!8699 0))(
  ( (ListLongMap!8700 (toList!4365 List!15688)) )
))
(declare-fun lt!371274 () ListLongMap!8699)

(declare-fun lt!371282 () ListLongMap!8699)

(declare-fun lt!371278 () tuple2!9876)

(declare-fun +!1913 (ListLongMap!8699 tuple2!9876) ListLongMap!8699)

(assert (=> b!823428 (= lt!371274 (+!1913 lt!371282 lt!371278))))

(declare-fun lt!371281 () ListLongMap!8699)

(declare-fun zeroValueAfter!34 () V!24789)

(declare-fun minValue!754 () V!24789)

(declare-datatypes ((Unit!28196 0))(
  ( (Unit!28197) )
))
(declare-fun lt!371280 () Unit!28196)

(declare-fun addCommutativeForDiffKeys!476 (ListLongMap!8699 (_ BitVec 64) V!24789 (_ BitVec 64) V!24789) Unit!28196)

(assert (=> b!823428 (= lt!371280 (addCommutativeForDiffKeys!476 lt!371281 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!371275 () ListLongMap!8699)

(assert (=> b!823428 (= lt!371275 lt!371274)))

(declare-fun lt!371273 () tuple2!9876)

(assert (=> b!823428 (= lt!371274 (+!1913 (+!1913 lt!371281 lt!371278) lt!371273))))

(assert (=> b!823428 (= lt!371278 (tuple2!9877 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!371276 () ListLongMap!8699)

(assert (=> b!823428 (= lt!371276 lt!371282)))

(assert (=> b!823428 (= lt!371282 (+!1913 lt!371281 lt!371273))))

(assert (=> b!823428 (= lt!371273 (tuple2!9877 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2527 (array!45874 array!45872 (_ BitVec 32) (_ BitVec 32) V!24789 V!24789 (_ BitVec 32) Int) ListLongMap!8699)

(assert (=> b!823428 (= lt!371275 (getCurrentListMap!2527 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24789)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823428 (= lt!371276 (getCurrentListMap!2527 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823429 () Bool)

(declare-fun res!561538 () Bool)

(declare-fun e!457982 () Bool)

(assert (=> b!823429 (=> (not res!561538) (not e!457982))))

(declare-datatypes ((List!15689 0))(
  ( (Nil!15686) (Cons!15685 (h!16814 (_ BitVec 64)) (t!22028 List!15689)) )
))
(declare-fun arrayNoDuplicates!0 (array!45874 (_ BitVec 32) List!15689) Bool)

(assert (=> b!823429 (= res!561538 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15686))))

(declare-fun b!823430 () Bool)

(declare-fun res!561535 () Bool)

(assert (=> b!823430 (=> (not res!561535) (not e!457982))))

(assert (=> b!823430 (= res!561535 (and (= (size!22406 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22407 _keys!976) (size!22406 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823431 () Bool)

(declare-fun res!561534 () Bool)

(assert (=> b!823431 (=> (not res!561534) (not e!457982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45874 (_ BitVec 32)) Bool)

(assert (=> b!823431 (= res!561534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823432 () Bool)

(declare-fun tp_is_empty!14841 () Bool)

(assert (=> b!823432 (= e!457978 tp_is_empty!14841)))

(declare-fun res!561536 () Bool)

(assert (=> start!70894 (=> (not res!561536) (not e!457982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70894 (= res!561536 (validMask!0 mask!1312))))

(assert (=> start!70894 e!457982))

(assert (=> start!70894 tp_is_empty!14841))

(declare-fun array_inv!17551 (array!45874) Bool)

(assert (=> start!70894 (array_inv!17551 _keys!976)))

(assert (=> start!70894 true))

(declare-fun array_inv!17552 (array!45872) Bool)

(assert (=> start!70894 (and (array_inv!17552 _values!788) e!457980)))

(assert (=> start!70894 tp!46140))

(declare-fun b!823433 () Bool)

(declare-fun e!457979 () Bool)

(assert (=> b!823433 (= e!457979 tp_is_empty!14841)))

(declare-fun mapNonEmpty!23875 () Bool)

(declare-fun tp!46141 () Bool)

(assert (=> mapNonEmpty!23875 (= mapRes!23875 (and tp!46141 e!457979))))

(declare-fun mapKey!23875 () (_ BitVec 32))

(declare-fun mapValue!23875 () ValueCell!7005)

(declare-fun mapRest!23875 () (Array (_ BitVec 32) ValueCell!7005))

(assert (=> mapNonEmpty!23875 (= (arr!21985 _values!788) (store mapRest!23875 mapKey!23875 mapValue!23875))))

(declare-fun mapIsEmpty!23875 () Bool)

(assert (=> mapIsEmpty!23875 mapRes!23875))

(declare-fun b!823434 () Bool)

(assert (=> b!823434 (= e!457982 (not e!457981))))

(declare-fun res!561537 () Bool)

(assert (=> b!823434 (=> res!561537 e!457981)))

(assert (=> b!823434 (= res!561537 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!371277 () ListLongMap!8699)

(assert (=> b!823434 (= lt!371281 lt!371277)))

(declare-fun lt!371279 () Unit!28196)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!490 (array!45874 array!45872 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24789 V!24789 V!24789 V!24789 (_ BitVec 32) Int) Unit!28196)

(assert (=> b!823434 (= lt!371279 (lemmaNoChangeToArrayThenSameMapNoExtras!490 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2380 (array!45874 array!45872 (_ BitVec 32) (_ BitVec 32) V!24789 V!24789 (_ BitVec 32) Int) ListLongMap!8699)

(assert (=> b!823434 (= lt!371277 (getCurrentListMapNoExtraKeys!2380 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823434 (= lt!371281 (getCurrentListMapNoExtraKeys!2380 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70894 res!561536) b!823430))

(assert (= (and b!823430 res!561535) b!823431))

(assert (= (and b!823431 res!561534) b!823429))

(assert (= (and b!823429 res!561538) b!823434))

(assert (= (and b!823434 (not res!561537)) b!823428))

(assert (= (and b!823427 condMapEmpty!23875) mapIsEmpty!23875))

(assert (= (and b!823427 (not condMapEmpty!23875)) mapNonEmpty!23875))

(get-info :version)

(assert (= (and mapNonEmpty!23875 ((_ is ValueCellFull!7005) mapValue!23875)) b!823433))

(assert (= (and b!823427 ((_ is ValueCellFull!7005) mapDefault!23875)) b!823432))

(assert (= start!70894 b!823427))

(declare-fun m!765585 () Bool)

(assert (=> mapNonEmpty!23875 m!765585))

(declare-fun m!765587 () Bool)

(assert (=> start!70894 m!765587))

(declare-fun m!765589 () Bool)

(assert (=> start!70894 m!765589))

(declare-fun m!765591 () Bool)

(assert (=> start!70894 m!765591))

(declare-fun m!765593 () Bool)

(assert (=> b!823428 m!765593))

(declare-fun m!765595 () Bool)

(assert (=> b!823428 m!765595))

(declare-fun m!765597 () Bool)

(assert (=> b!823428 m!765597))

(declare-fun m!765599 () Bool)

(assert (=> b!823428 m!765599))

(declare-fun m!765601 () Bool)

(assert (=> b!823428 m!765601))

(declare-fun m!765603 () Bool)

(assert (=> b!823428 m!765603))

(assert (=> b!823428 m!765595))

(declare-fun m!765605 () Bool)

(assert (=> b!823428 m!765605))

(declare-fun m!765607 () Bool)

(assert (=> b!823431 m!765607))

(declare-fun m!765609 () Bool)

(assert (=> b!823429 m!765609))

(declare-fun m!765611 () Bool)

(assert (=> b!823434 m!765611))

(declare-fun m!765613 () Bool)

(assert (=> b!823434 m!765613))

(declare-fun m!765615 () Bool)

(assert (=> b!823434 m!765615))

(check-sat (not b!823428) (not mapNonEmpty!23875) b_and!22015 (not b!823429) (not start!70894) (not b_next!13131) tp_is_empty!14841 (not b!823434) (not b!823431))
(check-sat b_and!22015 (not b_next!13131))
(get-model)

(declare-fun d!104877 () Bool)

(assert (=> d!104877 (= (getCurrentListMapNoExtraKeys!2380 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2380 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371315 () Unit!28196)

(declare-fun choose!1401 (array!45874 array!45872 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24789 V!24789 V!24789 V!24789 (_ BitVec 32) Int) Unit!28196)

(assert (=> d!104877 (= lt!371315 (choose!1401 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104877 (validMask!0 mask!1312)))

(assert (=> d!104877 (= (lemmaNoChangeToArrayThenSameMapNoExtras!490 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371315)))

(declare-fun bs!22986 () Bool)

(assert (= bs!22986 d!104877))

(assert (=> bs!22986 m!765615))

(assert (=> bs!22986 m!765613))

(declare-fun m!765649 () Bool)

(assert (=> bs!22986 m!765649))

(assert (=> bs!22986 m!765587))

(assert (=> b!823434 d!104877))

(declare-fun bm!35791 () Bool)

(declare-fun call!35794 () ListLongMap!8699)

(assert (=> bm!35791 (= call!35794 (getCurrentListMapNoExtraKeys!2380 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!823483 () Bool)

(declare-fun res!561562 () Bool)

(declare-fun e!458018 () Bool)

(assert (=> b!823483 (=> (not res!561562) (not e!458018))))

(declare-fun lt!371332 () ListLongMap!8699)

(declare-fun contains!4172 (ListLongMap!8699 (_ BitVec 64)) Bool)

(assert (=> b!823483 (= res!561562 (not (contains!4172 lt!371332 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!823485 () Bool)

(declare-fun e!458020 () ListLongMap!8699)

(assert (=> b!823485 (= e!458020 call!35794)))

(declare-fun b!823486 () Bool)

(declare-fun e!458017 () ListLongMap!8699)

(assert (=> b!823486 (= e!458017 (ListLongMap!8700 Nil!15685))))

(declare-fun b!823487 () Bool)

(declare-fun e!458016 () Bool)

(declare-fun isEmpty!641 (ListLongMap!8699) Bool)

(assert (=> b!823487 (= e!458016 (isEmpty!641 lt!371332))))

(declare-fun b!823488 () Bool)

(assert (=> b!823488 (= e!458017 e!458020)))

(declare-fun c!89334 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!823488 (= c!89334 (validKeyInArray!0 (select (arr!21986 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823489 () Bool)

(declare-fun e!458021 () Bool)

(declare-fun e!458015 () Bool)

(assert (=> b!823489 (= e!458021 e!458015)))

(assert (=> b!823489 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22407 _keys!976)))))

(declare-fun res!561564 () Bool)

(assert (=> b!823489 (= res!561564 (contains!4172 lt!371332 (select (arr!21986 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!823489 (=> (not res!561564) (not e!458015))))

(declare-fun b!823490 () Bool)

(declare-fun lt!371330 () Unit!28196)

(declare-fun lt!371336 () Unit!28196)

(assert (=> b!823490 (= lt!371330 lt!371336)))

(declare-fun lt!371331 () ListLongMap!8699)

(declare-fun lt!371335 () (_ BitVec 64))

(declare-fun lt!371333 () (_ BitVec 64))

(declare-fun lt!371334 () V!24789)

(assert (=> b!823490 (not (contains!4172 (+!1913 lt!371331 (tuple2!9877 lt!371333 lt!371334)) lt!371335))))

(declare-fun addStillNotContains!184 (ListLongMap!8699 (_ BitVec 64) V!24789 (_ BitVec 64)) Unit!28196)

(assert (=> b!823490 (= lt!371336 (addStillNotContains!184 lt!371331 lt!371333 lt!371334 lt!371335))))

(assert (=> b!823490 (= lt!371335 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11682 (ValueCell!7005 V!24789) V!24789)

(declare-fun dynLambda!970 (Int (_ BitVec 64)) V!24789)

(assert (=> b!823490 (= lt!371334 (get!11682 (select (arr!21985 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!823490 (= lt!371333 (select (arr!21986 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!823490 (= lt!371331 call!35794)))

(assert (=> b!823490 (= e!458020 (+!1913 call!35794 (tuple2!9877 (select (arr!21986 _keys!976) #b00000000000000000000000000000000) (get!11682 (select (arr!21985 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!823491 () Bool)

(assert (=> b!823491 (= e!458016 (= lt!371332 (getCurrentListMapNoExtraKeys!2380 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!823492 () Bool)

(assert (=> b!823492 (= e!458018 e!458021)))

(declare-fun c!89332 () Bool)

(declare-fun e!458019 () Bool)

(assert (=> b!823492 (= c!89332 e!458019)))

(declare-fun res!561565 () Bool)

(assert (=> b!823492 (=> (not res!561565) (not e!458019))))

(assert (=> b!823492 (= res!561565 (bvslt #b00000000000000000000000000000000 (size!22407 _keys!976)))))

(declare-fun b!823493 () Bool)

(assert (=> b!823493 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22407 _keys!976)))))

(assert (=> b!823493 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22406 _values!788)))))

(declare-fun apply!359 (ListLongMap!8699 (_ BitVec 64)) V!24789)

(assert (=> b!823493 (= e!458015 (= (apply!359 lt!371332 (select (arr!21986 _keys!976) #b00000000000000000000000000000000)) (get!11682 (select (arr!21985 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!823494 () Bool)

(assert (=> b!823494 (= e!458021 e!458016)))

(declare-fun c!89333 () Bool)

(assert (=> b!823494 (= c!89333 (bvslt #b00000000000000000000000000000000 (size!22407 _keys!976)))))

(declare-fun d!104879 () Bool)

(assert (=> d!104879 e!458018))

(declare-fun res!561563 () Bool)

(assert (=> d!104879 (=> (not res!561563) (not e!458018))))

(assert (=> d!104879 (= res!561563 (not (contains!4172 lt!371332 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104879 (= lt!371332 e!458017)))

(declare-fun c!89331 () Bool)

(assert (=> d!104879 (= c!89331 (bvsge #b00000000000000000000000000000000 (size!22407 _keys!976)))))

(assert (=> d!104879 (validMask!0 mask!1312)))

(assert (=> d!104879 (= (getCurrentListMapNoExtraKeys!2380 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371332)))

(declare-fun b!823484 () Bool)

(assert (=> b!823484 (= e!458019 (validKeyInArray!0 (select (arr!21986 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!823484 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!104879 c!89331) b!823486))

(assert (= (and d!104879 (not c!89331)) b!823488))

(assert (= (and b!823488 c!89334) b!823490))

(assert (= (and b!823488 (not c!89334)) b!823485))

(assert (= (or b!823490 b!823485) bm!35791))

(assert (= (and d!104879 res!561563) b!823483))

(assert (= (and b!823483 res!561562) b!823492))

(assert (= (and b!823492 res!561565) b!823484))

(assert (= (and b!823492 c!89332) b!823489))

(assert (= (and b!823492 (not c!89332)) b!823494))

(assert (= (and b!823489 res!561564) b!823493))

(assert (= (and b!823494 c!89333) b!823491))

(assert (= (and b!823494 (not c!89333)) b!823487))

(declare-fun b_lambda!11055 () Bool)

(assert (=> (not b_lambda!11055) (not b!823490)))

(declare-fun t!22032 () Bool)

(declare-fun tb!4199 () Bool)

(assert (=> (and start!70894 (= defaultEntry!796 defaultEntry!796) t!22032) tb!4199))

(declare-fun result!7937 () Bool)

(assert (=> tb!4199 (= result!7937 tp_is_empty!14841)))

(assert (=> b!823490 t!22032))

(declare-fun b_and!22019 () Bool)

(assert (= b_and!22015 (and (=> t!22032 result!7937) b_and!22019)))

(declare-fun b_lambda!11057 () Bool)

(assert (=> (not b_lambda!11057) (not b!823493)))

(assert (=> b!823493 t!22032))

(declare-fun b_and!22021 () Bool)

(assert (= b_and!22019 (and (=> t!22032 result!7937) b_and!22021)))

(declare-fun m!765651 () Bool)

(assert (=> b!823488 m!765651))

(assert (=> b!823488 m!765651))

(declare-fun m!765653 () Bool)

(assert (=> b!823488 m!765653))

(declare-fun m!765655 () Bool)

(assert (=> b!823493 m!765655))

(declare-fun m!765657 () Bool)

(assert (=> b!823493 m!765657))

(declare-fun m!765659 () Bool)

(assert (=> b!823493 m!765659))

(assert (=> b!823493 m!765651))

(declare-fun m!765661 () Bool)

(assert (=> b!823493 m!765661))

(assert (=> b!823493 m!765657))

(assert (=> b!823493 m!765651))

(assert (=> b!823493 m!765655))

(declare-fun m!765663 () Bool)

(assert (=> b!823483 m!765663))

(assert (=> b!823489 m!765651))

(assert (=> b!823489 m!765651))

(declare-fun m!765665 () Bool)

(assert (=> b!823489 m!765665))

(assert (=> b!823484 m!765651))

(assert (=> b!823484 m!765651))

(assert (=> b!823484 m!765653))

(declare-fun m!765667 () Bool)

(assert (=> b!823487 m!765667))

(declare-fun m!765669 () Bool)

(assert (=> b!823490 m!765669))

(declare-fun m!765671 () Bool)

(assert (=> b!823490 m!765671))

(assert (=> b!823490 m!765655))

(assert (=> b!823490 m!765657))

(assert (=> b!823490 m!765659))

(assert (=> b!823490 m!765669))

(declare-fun m!765673 () Bool)

(assert (=> b!823490 m!765673))

(assert (=> b!823490 m!765657))

(declare-fun m!765675 () Bool)

(assert (=> b!823490 m!765675))

(assert (=> b!823490 m!765651))

(assert (=> b!823490 m!765655))

(declare-fun m!765677 () Bool)

(assert (=> d!104879 m!765677))

(assert (=> d!104879 m!765587))

(declare-fun m!765679 () Bool)

(assert (=> bm!35791 m!765679))

(assert (=> b!823491 m!765679))

(assert (=> b!823434 d!104879))

(declare-fun bm!35792 () Bool)

(declare-fun call!35795 () ListLongMap!8699)

(assert (=> bm!35792 (= call!35795 (getCurrentListMapNoExtraKeys!2380 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!823497 () Bool)

(declare-fun res!561566 () Bool)

(declare-fun e!458025 () Bool)

(assert (=> b!823497 (=> (not res!561566) (not e!458025))))

(declare-fun lt!371339 () ListLongMap!8699)

(assert (=> b!823497 (= res!561566 (not (contains!4172 lt!371339 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!823499 () Bool)

(declare-fun e!458027 () ListLongMap!8699)

(assert (=> b!823499 (= e!458027 call!35795)))

(declare-fun b!823500 () Bool)

(declare-fun e!458024 () ListLongMap!8699)

(assert (=> b!823500 (= e!458024 (ListLongMap!8700 Nil!15685))))

(declare-fun b!823501 () Bool)

(declare-fun e!458023 () Bool)

(assert (=> b!823501 (= e!458023 (isEmpty!641 lt!371339))))

(declare-fun b!823502 () Bool)

(assert (=> b!823502 (= e!458024 e!458027)))

(declare-fun c!89338 () Bool)

(assert (=> b!823502 (= c!89338 (validKeyInArray!0 (select (arr!21986 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823503 () Bool)

(declare-fun e!458028 () Bool)

(declare-fun e!458022 () Bool)

(assert (=> b!823503 (= e!458028 e!458022)))

(assert (=> b!823503 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22407 _keys!976)))))

(declare-fun res!561568 () Bool)

(assert (=> b!823503 (= res!561568 (contains!4172 lt!371339 (select (arr!21986 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!823503 (=> (not res!561568) (not e!458022))))

(declare-fun b!823504 () Bool)

(declare-fun lt!371337 () Unit!28196)

(declare-fun lt!371343 () Unit!28196)

(assert (=> b!823504 (= lt!371337 lt!371343)))

(declare-fun lt!371341 () V!24789)

(declare-fun lt!371338 () ListLongMap!8699)

(declare-fun lt!371340 () (_ BitVec 64))

(declare-fun lt!371342 () (_ BitVec 64))

(assert (=> b!823504 (not (contains!4172 (+!1913 lt!371338 (tuple2!9877 lt!371340 lt!371341)) lt!371342))))

(assert (=> b!823504 (= lt!371343 (addStillNotContains!184 lt!371338 lt!371340 lt!371341 lt!371342))))

(assert (=> b!823504 (= lt!371342 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!823504 (= lt!371341 (get!11682 (select (arr!21985 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!823504 (= lt!371340 (select (arr!21986 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!823504 (= lt!371338 call!35795)))

(assert (=> b!823504 (= e!458027 (+!1913 call!35795 (tuple2!9877 (select (arr!21986 _keys!976) #b00000000000000000000000000000000) (get!11682 (select (arr!21985 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!823505 () Bool)

(assert (=> b!823505 (= e!458023 (= lt!371339 (getCurrentListMapNoExtraKeys!2380 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!823506 () Bool)

(assert (=> b!823506 (= e!458025 e!458028)))

(declare-fun c!89336 () Bool)

(declare-fun e!458026 () Bool)

(assert (=> b!823506 (= c!89336 e!458026)))

(declare-fun res!561569 () Bool)

(assert (=> b!823506 (=> (not res!561569) (not e!458026))))

(assert (=> b!823506 (= res!561569 (bvslt #b00000000000000000000000000000000 (size!22407 _keys!976)))))

(declare-fun b!823507 () Bool)

(assert (=> b!823507 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22407 _keys!976)))))

(assert (=> b!823507 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22406 _values!788)))))

(assert (=> b!823507 (= e!458022 (= (apply!359 lt!371339 (select (arr!21986 _keys!976) #b00000000000000000000000000000000)) (get!11682 (select (arr!21985 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!823508 () Bool)

(assert (=> b!823508 (= e!458028 e!458023)))

(declare-fun c!89337 () Bool)

(assert (=> b!823508 (= c!89337 (bvslt #b00000000000000000000000000000000 (size!22407 _keys!976)))))

(declare-fun d!104881 () Bool)

(assert (=> d!104881 e!458025))

(declare-fun res!561567 () Bool)

(assert (=> d!104881 (=> (not res!561567) (not e!458025))))

(assert (=> d!104881 (= res!561567 (not (contains!4172 lt!371339 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104881 (= lt!371339 e!458024)))

(declare-fun c!89335 () Bool)

(assert (=> d!104881 (= c!89335 (bvsge #b00000000000000000000000000000000 (size!22407 _keys!976)))))

(assert (=> d!104881 (validMask!0 mask!1312)))

(assert (=> d!104881 (= (getCurrentListMapNoExtraKeys!2380 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371339)))

(declare-fun b!823498 () Bool)

(assert (=> b!823498 (= e!458026 (validKeyInArray!0 (select (arr!21986 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!823498 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!104881 c!89335) b!823500))

(assert (= (and d!104881 (not c!89335)) b!823502))

(assert (= (and b!823502 c!89338) b!823504))

(assert (= (and b!823502 (not c!89338)) b!823499))

(assert (= (or b!823504 b!823499) bm!35792))

(assert (= (and d!104881 res!561567) b!823497))

(assert (= (and b!823497 res!561566) b!823506))

(assert (= (and b!823506 res!561569) b!823498))

(assert (= (and b!823506 c!89336) b!823503))

(assert (= (and b!823506 (not c!89336)) b!823508))

(assert (= (and b!823503 res!561568) b!823507))

(assert (= (and b!823508 c!89337) b!823505))

(assert (= (and b!823508 (not c!89337)) b!823501))

(declare-fun b_lambda!11059 () Bool)

(assert (=> (not b_lambda!11059) (not b!823504)))

(assert (=> b!823504 t!22032))

(declare-fun b_and!22023 () Bool)

(assert (= b_and!22021 (and (=> t!22032 result!7937) b_and!22023)))

(declare-fun b_lambda!11061 () Bool)

(assert (=> (not b_lambda!11061) (not b!823507)))

(assert (=> b!823507 t!22032))

(declare-fun b_and!22025 () Bool)

(assert (= b_and!22023 (and (=> t!22032 result!7937) b_and!22025)))

(assert (=> b!823502 m!765651))

(assert (=> b!823502 m!765651))

(assert (=> b!823502 m!765653))

(assert (=> b!823507 m!765655))

(assert (=> b!823507 m!765657))

(assert (=> b!823507 m!765659))

(assert (=> b!823507 m!765651))

(declare-fun m!765681 () Bool)

(assert (=> b!823507 m!765681))

(assert (=> b!823507 m!765657))

(assert (=> b!823507 m!765651))

(assert (=> b!823507 m!765655))

(declare-fun m!765683 () Bool)

(assert (=> b!823497 m!765683))

(assert (=> b!823503 m!765651))

(assert (=> b!823503 m!765651))

(declare-fun m!765685 () Bool)

(assert (=> b!823503 m!765685))

(assert (=> b!823498 m!765651))

(assert (=> b!823498 m!765651))

(assert (=> b!823498 m!765653))

(declare-fun m!765687 () Bool)

(assert (=> b!823501 m!765687))

(declare-fun m!765689 () Bool)

(assert (=> b!823504 m!765689))

(declare-fun m!765691 () Bool)

(assert (=> b!823504 m!765691))

(assert (=> b!823504 m!765655))

(assert (=> b!823504 m!765657))

(assert (=> b!823504 m!765659))

(assert (=> b!823504 m!765689))

(declare-fun m!765693 () Bool)

(assert (=> b!823504 m!765693))

(assert (=> b!823504 m!765657))

(declare-fun m!765695 () Bool)

(assert (=> b!823504 m!765695))

(assert (=> b!823504 m!765651))

(assert (=> b!823504 m!765655))

(declare-fun m!765697 () Bool)

(assert (=> d!104881 m!765697))

(assert (=> d!104881 m!765587))

(declare-fun m!765699 () Bool)

(assert (=> bm!35792 m!765699))

(assert (=> b!823505 m!765699))

(assert (=> b!823434 d!104881))

(declare-fun b!823517 () Bool)

(declare-fun e!458036 () Bool)

(declare-fun e!458037 () Bool)

(assert (=> b!823517 (= e!458036 e!458037)))

(declare-fun c!89341 () Bool)

(assert (=> b!823517 (= c!89341 (validKeyInArray!0 (select (arr!21986 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823518 () Bool)

(declare-fun e!458035 () Bool)

(assert (=> b!823518 (= e!458037 e!458035)))

(declare-fun lt!371352 () (_ BitVec 64))

(assert (=> b!823518 (= lt!371352 (select (arr!21986 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371350 () Unit!28196)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45874 (_ BitVec 64) (_ BitVec 32)) Unit!28196)

(assert (=> b!823518 (= lt!371350 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!371352 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!823518 (arrayContainsKey!0 _keys!976 lt!371352 #b00000000000000000000000000000000)))

(declare-fun lt!371351 () Unit!28196)

(assert (=> b!823518 (= lt!371351 lt!371350)))

(declare-fun res!561575 () Bool)

(declare-datatypes ((SeekEntryResult!8731 0))(
  ( (MissingZero!8731 (index!37295 (_ BitVec 32))) (Found!8731 (index!37296 (_ BitVec 32))) (Intermediate!8731 (undefined!9543 Bool) (index!37297 (_ BitVec 32)) (x!69465 (_ BitVec 32))) (Undefined!8731) (MissingVacant!8731 (index!37298 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45874 (_ BitVec 32)) SeekEntryResult!8731)

(assert (=> b!823518 (= res!561575 (= (seekEntryOrOpen!0 (select (arr!21986 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8731 #b00000000000000000000000000000000)))))

(assert (=> b!823518 (=> (not res!561575) (not e!458035))))

(declare-fun b!823519 () Bool)

(declare-fun call!35798 () Bool)

(assert (=> b!823519 (= e!458035 call!35798)))

(declare-fun bm!35795 () Bool)

(assert (=> bm!35795 (= call!35798 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun d!104883 () Bool)

(declare-fun res!561574 () Bool)

(assert (=> d!104883 (=> res!561574 e!458036)))

(assert (=> d!104883 (= res!561574 (bvsge #b00000000000000000000000000000000 (size!22407 _keys!976)))))

(assert (=> d!104883 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!458036)))

(declare-fun b!823520 () Bool)

(assert (=> b!823520 (= e!458037 call!35798)))

(assert (= (and d!104883 (not res!561574)) b!823517))

(assert (= (and b!823517 c!89341) b!823518))

(assert (= (and b!823517 (not c!89341)) b!823520))

(assert (= (and b!823518 res!561575) b!823519))

(assert (= (or b!823519 b!823520) bm!35795))

(assert (=> b!823517 m!765651))

(assert (=> b!823517 m!765651))

(assert (=> b!823517 m!765653))

(assert (=> b!823518 m!765651))

(declare-fun m!765701 () Bool)

(assert (=> b!823518 m!765701))

(declare-fun m!765703 () Bool)

(assert (=> b!823518 m!765703))

(assert (=> b!823518 m!765651))

(declare-fun m!765705 () Bool)

(assert (=> b!823518 m!765705))

(declare-fun m!765707 () Bool)

(assert (=> bm!35795 m!765707))

(assert (=> b!823431 d!104883))

(declare-fun b!823531 () Bool)

(declare-fun e!458046 () Bool)

(declare-fun e!458049 () Bool)

(assert (=> b!823531 (= e!458046 e!458049)))

(declare-fun res!561583 () Bool)

(assert (=> b!823531 (=> (not res!561583) (not e!458049))))

(declare-fun e!458048 () Bool)

(assert (=> b!823531 (= res!561583 (not e!458048))))

(declare-fun res!561584 () Bool)

(assert (=> b!823531 (=> (not res!561584) (not e!458048))))

(assert (=> b!823531 (= res!561584 (validKeyInArray!0 (select (arr!21986 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823532 () Bool)

(declare-fun contains!4173 (List!15689 (_ BitVec 64)) Bool)

(assert (=> b!823532 (= e!458048 (contains!4173 Nil!15686 (select (arr!21986 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823533 () Bool)

(declare-fun e!458047 () Bool)

(declare-fun call!35801 () Bool)

(assert (=> b!823533 (= e!458047 call!35801)))

(declare-fun bm!35798 () Bool)

(declare-fun c!89344 () Bool)

(assert (=> bm!35798 (= call!35801 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89344 (Cons!15685 (select (arr!21986 _keys!976) #b00000000000000000000000000000000) Nil!15686) Nil!15686)))))

(declare-fun b!823534 () Bool)

(assert (=> b!823534 (= e!458047 call!35801)))

(declare-fun d!104885 () Bool)

(declare-fun res!561582 () Bool)

(assert (=> d!104885 (=> res!561582 e!458046)))

(assert (=> d!104885 (= res!561582 (bvsge #b00000000000000000000000000000000 (size!22407 _keys!976)))))

(assert (=> d!104885 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15686) e!458046)))

(declare-fun b!823535 () Bool)

(assert (=> b!823535 (= e!458049 e!458047)))

(assert (=> b!823535 (= c!89344 (validKeyInArray!0 (select (arr!21986 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104885 (not res!561582)) b!823531))

(assert (= (and b!823531 res!561584) b!823532))

(assert (= (and b!823531 res!561583) b!823535))

(assert (= (and b!823535 c!89344) b!823533))

(assert (= (and b!823535 (not c!89344)) b!823534))

(assert (= (or b!823533 b!823534) bm!35798))

(assert (=> b!823531 m!765651))

(assert (=> b!823531 m!765651))

(assert (=> b!823531 m!765653))

(assert (=> b!823532 m!765651))

(assert (=> b!823532 m!765651))

(declare-fun m!765709 () Bool)

(assert (=> b!823532 m!765709))

(assert (=> bm!35798 m!765651))

(declare-fun m!765711 () Bool)

(assert (=> bm!35798 m!765711))

(assert (=> b!823535 m!765651))

(assert (=> b!823535 m!765651))

(assert (=> b!823535 m!765653))

(assert (=> b!823429 d!104885))

(declare-fun d!104887 () Bool)

(assert (=> d!104887 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70894 d!104887))

(declare-fun d!104889 () Bool)

(assert (=> d!104889 (= (array_inv!17551 _keys!976) (bvsge (size!22407 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70894 d!104889))

(declare-fun d!104891 () Bool)

(assert (=> d!104891 (= (array_inv!17552 _values!788) (bvsge (size!22406 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70894 d!104891))

(declare-fun b!823578 () Bool)

(declare-fun lt!371404 () ListLongMap!8699)

(declare-fun e!458085 () Bool)

(assert (=> b!823578 (= e!458085 (= (apply!359 lt!371404 (select (arr!21986 _keys!976) #b00000000000000000000000000000000)) (get!11682 (select (arr!21985 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!823578 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22406 _values!788)))))

(assert (=> b!823578 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22407 _keys!976)))))

(declare-fun b!823579 () Bool)

(declare-fun e!458076 () Bool)

(assert (=> b!823579 (= e!458076 (validKeyInArray!0 (select (arr!21986 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823580 () Bool)

(declare-fun e!458083 () Bool)

(assert (=> b!823580 (= e!458083 (= (apply!359 lt!371404 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!823581 () Bool)

(declare-fun e!458088 () Unit!28196)

(declare-fun Unit!28200 () Unit!28196)

(assert (=> b!823581 (= e!458088 Unit!28200)))

(declare-fun b!823582 () Bool)

(declare-fun e!458086 () Bool)

(declare-fun e!458081 () Bool)

(assert (=> b!823582 (= e!458086 e!458081)))

(declare-fun res!561610 () Bool)

(declare-fun call!35820 () Bool)

(assert (=> b!823582 (= res!561610 call!35820)))

(assert (=> b!823582 (=> (not res!561610) (not e!458081))))

(declare-fun bm!35813 () Bool)

(declare-fun call!35821 () ListLongMap!8699)

(declare-fun call!35822 () ListLongMap!8699)

(assert (=> bm!35813 (= call!35821 call!35822)))

(declare-fun b!823583 () Bool)

(declare-fun e!458078 () Bool)

(assert (=> b!823583 (= e!458078 e!458083)))

(declare-fun res!561605 () Bool)

(declare-fun call!35817 () Bool)

(assert (=> b!823583 (= res!561605 call!35817)))

(assert (=> b!823583 (=> (not res!561605) (not e!458083))))

(declare-fun d!104893 () Bool)

(declare-fun e!458077 () Bool)

(assert (=> d!104893 e!458077))

(declare-fun res!561604 () Bool)

(assert (=> d!104893 (=> (not res!561604) (not e!458077))))

(assert (=> d!104893 (= res!561604 (or (bvsge #b00000000000000000000000000000000 (size!22407 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22407 _keys!976)))))))

(declare-fun lt!371412 () ListLongMap!8699)

(assert (=> d!104893 (= lt!371404 lt!371412)))

(declare-fun lt!371416 () Unit!28196)

(assert (=> d!104893 (= lt!371416 e!458088)))

(declare-fun c!89362 () Bool)

(declare-fun e!458079 () Bool)

(assert (=> d!104893 (= c!89362 e!458079)))

(declare-fun res!561609 () Bool)

(assert (=> d!104893 (=> (not res!561609) (not e!458079))))

(assert (=> d!104893 (= res!561609 (bvslt #b00000000000000000000000000000000 (size!22407 _keys!976)))))

(declare-fun e!458084 () ListLongMap!8699)

(assert (=> d!104893 (= lt!371412 e!458084)))

(declare-fun c!89358 () Bool)

(assert (=> d!104893 (= c!89358 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104893 (validMask!0 mask!1312)))

(assert (=> d!104893 (= (getCurrentListMap!2527 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371404)))

(declare-fun bm!35814 () Bool)

(assert (=> bm!35814 (= call!35820 (contains!4172 lt!371404 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!823584 () Bool)

(declare-fun lt!371413 () Unit!28196)

(assert (=> b!823584 (= e!458088 lt!371413)))

(declare-fun lt!371408 () ListLongMap!8699)

(assert (=> b!823584 (= lt!371408 (getCurrentListMapNoExtraKeys!2380 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371397 () (_ BitVec 64))

(assert (=> b!823584 (= lt!371397 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371406 () (_ BitVec 64))

(assert (=> b!823584 (= lt!371406 (select (arr!21986 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371411 () Unit!28196)

(declare-fun addStillContains!312 (ListLongMap!8699 (_ BitVec 64) V!24789 (_ BitVec 64)) Unit!28196)

(assert (=> b!823584 (= lt!371411 (addStillContains!312 lt!371408 lt!371397 zeroValueBefore!34 lt!371406))))

(assert (=> b!823584 (contains!4172 (+!1913 lt!371408 (tuple2!9877 lt!371397 zeroValueBefore!34)) lt!371406)))

(declare-fun lt!371417 () Unit!28196)

(assert (=> b!823584 (= lt!371417 lt!371411)))

(declare-fun lt!371398 () ListLongMap!8699)

(assert (=> b!823584 (= lt!371398 (getCurrentListMapNoExtraKeys!2380 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371414 () (_ BitVec 64))

(assert (=> b!823584 (= lt!371414 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371401 () (_ BitVec 64))

(assert (=> b!823584 (= lt!371401 (select (arr!21986 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371415 () Unit!28196)

(declare-fun addApplyDifferent!312 (ListLongMap!8699 (_ BitVec 64) V!24789 (_ BitVec 64)) Unit!28196)

(assert (=> b!823584 (= lt!371415 (addApplyDifferent!312 lt!371398 lt!371414 minValue!754 lt!371401))))

(assert (=> b!823584 (= (apply!359 (+!1913 lt!371398 (tuple2!9877 lt!371414 minValue!754)) lt!371401) (apply!359 lt!371398 lt!371401))))

(declare-fun lt!371410 () Unit!28196)

(assert (=> b!823584 (= lt!371410 lt!371415)))

(declare-fun lt!371409 () ListLongMap!8699)

(assert (=> b!823584 (= lt!371409 (getCurrentListMapNoExtraKeys!2380 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371418 () (_ BitVec 64))

(assert (=> b!823584 (= lt!371418 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371407 () (_ BitVec 64))

(assert (=> b!823584 (= lt!371407 (select (arr!21986 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371403 () Unit!28196)

(assert (=> b!823584 (= lt!371403 (addApplyDifferent!312 lt!371409 lt!371418 zeroValueBefore!34 lt!371407))))

(assert (=> b!823584 (= (apply!359 (+!1913 lt!371409 (tuple2!9877 lt!371418 zeroValueBefore!34)) lt!371407) (apply!359 lt!371409 lt!371407))))

(declare-fun lt!371399 () Unit!28196)

(assert (=> b!823584 (= lt!371399 lt!371403)))

(declare-fun lt!371402 () ListLongMap!8699)

(assert (=> b!823584 (= lt!371402 (getCurrentListMapNoExtraKeys!2380 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371400 () (_ BitVec 64))

(assert (=> b!823584 (= lt!371400 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371405 () (_ BitVec 64))

(assert (=> b!823584 (= lt!371405 (select (arr!21986 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!823584 (= lt!371413 (addApplyDifferent!312 lt!371402 lt!371400 minValue!754 lt!371405))))

(assert (=> b!823584 (= (apply!359 (+!1913 lt!371402 (tuple2!9877 lt!371400 minValue!754)) lt!371405) (apply!359 lt!371402 lt!371405))))

(declare-fun b!823585 () Bool)

(assert (=> b!823585 (= e!458079 (validKeyInArray!0 (select (arr!21986 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823586 () Bool)

(declare-fun res!561603 () Bool)

(assert (=> b!823586 (=> (not res!561603) (not e!458077))))

(declare-fun e!458087 () Bool)

(assert (=> b!823586 (= res!561603 e!458087)))

(declare-fun res!561606 () Bool)

(assert (=> b!823586 (=> res!561606 e!458087)))

(assert (=> b!823586 (= res!561606 (not e!458076))))

(declare-fun res!561611 () Bool)

(assert (=> b!823586 (=> (not res!561611) (not e!458076))))

(assert (=> b!823586 (= res!561611 (bvslt #b00000000000000000000000000000000 (size!22407 _keys!976)))))

(declare-fun call!35816 () ListLongMap!8699)

(declare-fun bm!35815 () Bool)

(assert (=> bm!35815 (= call!35816 (getCurrentListMapNoExtraKeys!2380 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823587 () Bool)

(declare-fun res!561608 () Bool)

(assert (=> b!823587 (=> (not res!561608) (not e!458077))))

(assert (=> b!823587 (= res!561608 e!458078)))

(declare-fun c!89361 () Bool)

(assert (=> b!823587 (= c!89361 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!35816 () Bool)

(declare-fun call!35819 () ListLongMap!8699)

(assert (=> bm!35816 (= call!35819 call!35816)))

(declare-fun b!823588 () Bool)

(assert (=> b!823588 (= e!458081 (= (apply!359 lt!371404 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!823589 () Bool)

(assert (=> b!823589 (= e!458087 e!458085)))

(declare-fun res!561607 () Bool)

(assert (=> b!823589 (=> (not res!561607) (not e!458085))))

(assert (=> b!823589 (= res!561607 (contains!4172 lt!371404 (select (arr!21986 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!823589 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22407 _keys!976)))))

(declare-fun b!823590 () Bool)

(assert (=> b!823590 (= e!458084 (+!1913 call!35822 (tuple2!9877 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!35817 () Bool)

(assert (=> bm!35817 (= call!35817 (contains!4172 lt!371404 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!89360 () Bool)

(declare-fun call!35818 () ListLongMap!8699)

(declare-fun bm!35818 () Bool)

(assert (=> bm!35818 (= call!35822 (+!1913 (ite c!89358 call!35816 (ite c!89360 call!35819 call!35818)) (ite (or c!89358 c!89360) (tuple2!9877 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9877 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!823591 () Bool)

(declare-fun e!458080 () ListLongMap!8699)

(assert (=> b!823591 (= e!458080 call!35818)))

(declare-fun b!823592 () Bool)

(declare-fun e!458082 () ListLongMap!8699)

(assert (=> b!823592 (= e!458084 e!458082)))

(assert (=> b!823592 (= c!89360 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35819 () Bool)

(assert (=> bm!35819 (= call!35818 call!35819)))

(declare-fun b!823593 () Bool)

(assert (=> b!823593 (= e!458086 (not call!35820))))

(declare-fun b!823594 () Bool)

(assert (=> b!823594 (= e!458078 (not call!35817))))

(declare-fun b!823595 () Bool)

(declare-fun c!89357 () Bool)

(assert (=> b!823595 (= c!89357 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!823595 (= e!458082 e!458080)))

(declare-fun b!823596 () Bool)

(assert (=> b!823596 (= e!458080 call!35821)))

(declare-fun b!823597 () Bool)

(assert (=> b!823597 (= e!458082 call!35821)))

(declare-fun b!823598 () Bool)

(assert (=> b!823598 (= e!458077 e!458086)))

(declare-fun c!89359 () Bool)

(assert (=> b!823598 (= c!89359 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!104893 c!89358) b!823590))

(assert (= (and d!104893 (not c!89358)) b!823592))

(assert (= (and b!823592 c!89360) b!823597))

(assert (= (and b!823592 (not c!89360)) b!823595))

(assert (= (and b!823595 c!89357) b!823596))

(assert (= (and b!823595 (not c!89357)) b!823591))

(assert (= (or b!823596 b!823591) bm!35819))

(assert (= (or b!823597 bm!35819) bm!35816))

(assert (= (or b!823597 b!823596) bm!35813))

(assert (= (or b!823590 bm!35816) bm!35815))

(assert (= (or b!823590 bm!35813) bm!35818))

(assert (= (and d!104893 res!561609) b!823585))

(assert (= (and d!104893 c!89362) b!823584))

(assert (= (and d!104893 (not c!89362)) b!823581))

(assert (= (and d!104893 res!561604) b!823586))

(assert (= (and b!823586 res!561611) b!823579))

(assert (= (and b!823586 (not res!561606)) b!823589))

(assert (= (and b!823589 res!561607) b!823578))

(assert (= (and b!823586 res!561603) b!823587))

(assert (= (and b!823587 c!89361) b!823583))

(assert (= (and b!823587 (not c!89361)) b!823594))

(assert (= (and b!823583 res!561605) b!823580))

(assert (= (or b!823583 b!823594) bm!35817))

(assert (= (and b!823587 res!561608) b!823598))

(assert (= (and b!823598 c!89359) b!823582))

(assert (= (and b!823598 (not c!89359)) b!823593))

(assert (= (and b!823582 res!561610) b!823588))

(assert (= (or b!823582 b!823593) bm!35814))

(declare-fun b_lambda!11063 () Bool)

(assert (=> (not b_lambda!11063) (not b!823578)))

(assert (=> b!823578 t!22032))

(declare-fun b_and!22027 () Bool)

(assert (= b_and!22025 (and (=> t!22032 result!7937) b_and!22027)))

(assert (=> b!823589 m!765651))

(assert (=> b!823589 m!765651))

(declare-fun m!765713 () Bool)

(assert (=> b!823589 m!765713))

(declare-fun m!765715 () Bool)

(assert (=> b!823590 m!765715))

(declare-fun m!765717 () Bool)

(assert (=> b!823580 m!765717))

(declare-fun m!765719 () Bool)

(assert (=> bm!35818 m!765719))

(declare-fun m!765721 () Bool)

(assert (=> b!823588 m!765721))

(assert (=> b!823578 m!765651))

(assert (=> b!823578 m!765651))

(declare-fun m!765723 () Bool)

(assert (=> b!823578 m!765723))

(assert (=> b!823578 m!765657))

(assert (=> b!823578 m!765655))

(assert (=> b!823578 m!765657))

(assert (=> b!823578 m!765659))

(assert (=> b!823578 m!765655))

(declare-fun m!765725 () Bool)

(assert (=> bm!35817 m!765725))

(assert (=> b!823579 m!765651))

(assert (=> b!823579 m!765651))

(assert (=> b!823579 m!765653))

(assert (=> bm!35815 m!765615))

(assert (=> d!104893 m!765587))

(declare-fun m!765727 () Bool)

(assert (=> bm!35814 m!765727))

(declare-fun m!765729 () Bool)

(assert (=> b!823584 m!765729))

(declare-fun m!765731 () Bool)

(assert (=> b!823584 m!765731))

(declare-fun m!765733 () Bool)

(assert (=> b!823584 m!765733))

(declare-fun m!765735 () Bool)

(assert (=> b!823584 m!765735))

(declare-fun m!765737 () Bool)

(assert (=> b!823584 m!765737))

(declare-fun m!765739 () Bool)

(assert (=> b!823584 m!765739))

(declare-fun m!765741 () Bool)

(assert (=> b!823584 m!765741))

(declare-fun m!765743 () Bool)

(assert (=> b!823584 m!765743))

(declare-fun m!765745 () Bool)

(assert (=> b!823584 m!765745))

(declare-fun m!765747 () Bool)

(assert (=> b!823584 m!765747))

(declare-fun m!765749 () Bool)

(assert (=> b!823584 m!765749))

(declare-fun m!765751 () Bool)

(assert (=> b!823584 m!765751))

(declare-fun m!765753 () Bool)

(assert (=> b!823584 m!765753))

(declare-fun m!765755 () Bool)

(assert (=> b!823584 m!765755))

(assert (=> b!823584 m!765651))

(assert (=> b!823584 m!765615))

(assert (=> b!823584 m!765739))

(assert (=> b!823584 m!765753))

(assert (=> b!823584 m!765737))

(declare-fun m!765757 () Bool)

(assert (=> b!823584 m!765757))

(assert (=> b!823584 m!765743))

(assert (=> b!823585 m!765651))

(assert (=> b!823585 m!765651))

(assert (=> b!823585 m!765653))

(assert (=> b!823428 d!104893))

(declare-fun d!104895 () Bool)

(assert (=> d!104895 (= (+!1913 (+!1913 lt!371281 (tuple2!9877 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (tuple2!9877 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (+!1913 (+!1913 lt!371281 (tuple2!9877 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (tuple2!9877 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun lt!371421 () Unit!28196)

(declare-fun choose!1402 (ListLongMap!8699 (_ BitVec 64) V!24789 (_ BitVec 64) V!24789) Unit!28196)

(assert (=> d!104895 (= lt!371421 (choose!1402 lt!371281 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> d!104895 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!104895 (= (addCommutativeForDiffKeys!476 lt!371281 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754) lt!371421)))

(declare-fun bs!22987 () Bool)

(assert (= bs!22987 d!104895))

(declare-fun m!765759 () Bool)

(assert (=> bs!22987 m!765759))

(declare-fun m!765761 () Bool)

(assert (=> bs!22987 m!765761))

(declare-fun m!765763 () Bool)

(assert (=> bs!22987 m!765763))

(assert (=> bs!22987 m!765759))

(declare-fun m!765765 () Bool)

(assert (=> bs!22987 m!765765))

(assert (=> bs!22987 m!765761))

(declare-fun m!765767 () Bool)

(assert (=> bs!22987 m!765767))

(assert (=> b!823428 d!104895))

(declare-fun b!823599 () Bool)

(declare-fun e!458098 () Bool)

(declare-fun lt!371429 () ListLongMap!8699)

(assert (=> b!823599 (= e!458098 (= (apply!359 lt!371429 (select (arr!21986 _keys!976) #b00000000000000000000000000000000)) (get!11682 (select (arr!21985 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!823599 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22406 _values!788)))))

(assert (=> b!823599 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22407 _keys!976)))))

(declare-fun b!823600 () Bool)

(declare-fun e!458089 () Bool)

(assert (=> b!823600 (= e!458089 (validKeyInArray!0 (select (arr!21986 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823601 () Bool)

(declare-fun e!458096 () Bool)

(assert (=> b!823601 (= e!458096 (= (apply!359 lt!371429 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!823602 () Bool)

(declare-fun e!458101 () Unit!28196)

(declare-fun Unit!28201 () Unit!28196)

(assert (=> b!823602 (= e!458101 Unit!28201)))

(declare-fun b!823603 () Bool)

(declare-fun e!458099 () Bool)

(declare-fun e!458094 () Bool)

(assert (=> b!823603 (= e!458099 e!458094)))

(declare-fun res!561619 () Bool)

(declare-fun call!35827 () Bool)

(assert (=> b!823603 (= res!561619 call!35827)))

(assert (=> b!823603 (=> (not res!561619) (not e!458094))))

(declare-fun bm!35820 () Bool)

(declare-fun call!35828 () ListLongMap!8699)

(declare-fun call!35829 () ListLongMap!8699)

(assert (=> bm!35820 (= call!35828 call!35829)))

(declare-fun b!823604 () Bool)

(declare-fun e!458091 () Bool)

(assert (=> b!823604 (= e!458091 e!458096)))

(declare-fun res!561614 () Bool)

(declare-fun call!35824 () Bool)

(assert (=> b!823604 (= res!561614 call!35824)))

(assert (=> b!823604 (=> (not res!561614) (not e!458096))))

(declare-fun d!104897 () Bool)

(declare-fun e!458090 () Bool)

(assert (=> d!104897 e!458090))

(declare-fun res!561613 () Bool)

(assert (=> d!104897 (=> (not res!561613) (not e!458090))))

(assert (=> d!104897 (= res!561613 (or (bvsge #b00000000000000000000000000000000 (size!22407 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22407 _keys!976)))))))

(declare-fun lt!371437 () ListLongMap!8699)

(assert (=> d!104897 (= lt!371429 lt!371437)))

(declare-fun lt!371441 () Unit!28196)

(assert (=> d!104897 (= lt!371441 e!458101)))

(declare-fun c!89368 () Bool)

(declare-fun e!458092 () Bool)

(assert (=> d!104897 (= c!89368 e!458092)))

(declare-fun res!561618 () Bool)

(assert (=> d!104897 (=> (not res!561618) (not e!458092))))

(assert (=> d!104897 (= res!561618 (bvslt #b00000000000000000000000000000000 (size!22407 _keys!976)))))

(declare-fun e!458097 () ListLongMap!8699)

(assert (=> d!104897 (= lt!371437 e!458097)))

(declare-fun c!89364 () Bool)

(assert (=> d!104897 (= c!89364 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104897 (validMask!0 mask!1312)))

(assert (=> d!104897 (= (getCurrentListMap!2527 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371429)))

(declare-fun bm!35821 () Bool)

(assert (=> bm!35821 (= call!35827 (contains!4172 lt!371429 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!823605 () Bool)

(declare-fun lt!371438 () Unit!28196)

(assert (=> b!823605 (= e!458101 lt!371438)))

(declare-fun lt!371433 () ListLongMap!8699)

(assert (=> b!823605 (= lt!371433 (getCurrentListMapNoExtraKeys!2380 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371422 () (_ BitVec 64))

(assert (=> b!823605 (= lt!371422 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371431 () (_ BitVec 64))

(assert (=> b!823605 (= lt!371431 (select (arr!21986 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371436 () Unit!28196)

(assert (=> b!823605 (= lt!371436 (addStillContains!312 lt!371433 lt!371422 zeroValueAfter!34 lt!371431))))

(assert (=> b!823605 (contains!4172 (+!1913 lt!371433 (tuple2!9877 lt!371422 zeroValueAfter!34)) lt!371431)))

(declare-fun lt!371442 () Unit!28196)

(assert (=> b!823605 (= lt!371442 lt!371436)))

(declare-fun lt!371423 () ListLongMap!8699)

(assert (=> b!823605 (= lt!371423 (getCurrentListMapNoExtraKeys!2380 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371439 () (_ BitVec 64))

(assert (=> b!823605 (= lt!371439 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371426 () (_ BitVec 64))

(assert (=> b!823605 (= lt!371426 (select (arr!21986 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371440 () Unit!28196)

(assert (=> b!823605 (= lt!371440 (addApplyDifferent!312 lt!371423 lt!371439 minValue!754 lt!371426))))

(assert (=> b!823605 (= (apply!359 (+!1913 lt!371423 (tuple2!9877 lt!371439 minValue!754)) lt!371426) (apply!359 lt!371423 lt!371426))))

(declare-fun lt!371435 () Unit!28196)

(assert (=> b!823605 (= lt!371435 lt!371440)))

(declare-fun lt!371434 () ListLongMap!8699)

(assert (=> b!823605 (= lt!371434 (getCurrentListMapNoExtraKeys!2380 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371443 () (_ BitVec 64))

(assert (=> b!823605 (= lt!371443 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371432 () (_ BitVec 64))

(assert (=> b!823605 (= lt!371432 (select (arr!21986 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371428 () Unit!28196)

(assert (=> b!823605 (= lt!371428 (addApplyDifferent!312 lt!371434 lt!371443 zeroValueAfter!34 lt!371432))))

(assert (=> b!823605 (= (apply!359 (+!1913 lt!371434 (tuple2!9877 lt!371443 zeroValueAfter!34)) lt!371432) (apply!359 lt!371434 lt!371432))))

(declare-fun lt!371424 () Unit!28196)

(assert (=> b!823605 (= lt!371424 lt!371428)))

(declare-fun lt!371427 () ListLongMap!8699)

(assert (=> b!823605 (= lt!371427 (getCurrentListMapNoExtraKeys!2380 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371425 () (_ BitVec 64))

(assert (=> b!823605 (= lt!371425 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371430 () (_ BitVec 64))

(assert (=> b!823605 (= lt!371430 (select (arr!21986 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!823605 (= lt!371438 (addApplyDifferent!312 lt!371427 lt!371425 minValue!754 lt!371430))))

(assert (=> b!823605 (= (apply!359 (+!1913 lt!371427 (tuple2!9877 lt!371425 minValue!754)) lt!371430) (apply!359 lt!371427 lt!371430))))

(declare-fun b!823606 () Bool)

(assert (=> b!823606 (= e!458092 (validKeyInArray!0 (select (arr!21986 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823607 () Bool)

(declare-fun res!561612 () Bool)

(assert (=> b!823607 (=> (not res!561612) (not e!458090))))

(declare-fun e!458100 () Bool)

(assert (=> b!823607 (= res!561612 e!458100)))

(declare-fun res!561615 () Bool)

(assert (=> b!823607 (=> res!561615 e!458100)))

(assert (=> b!823607 (= res!561615 (not e!458089))))

(declare-fun res!561620 () Bool)

(assert (=> b!823607 (=> (not res!561620) (not e!458089))))

(assert (=> b!823607 (= res!561620 (bvslt #b00000000000000000000000000000000 (size!22407 _keys!976)))))

(declare-fun bm!35822 () Bool)

(declare-fun call!35823 () ListLongMap!8699)

(assert (=> bm!35822 (= call!35823 (getCurrentListMapNoExtraKeys!2380 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823608 () Bool)

(declare-fun res!561617 () Bool)

(assert (=> b!823608 (=> (not res!561617) (not e!458090))))

(assert (=> b!823608 (= res!561617 e!458091)))

(declare-fun c!89367 () Bool)

(assert (=> b!823608 (= c!89367 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!35823 () Bool)

(declare-fun call!35826 () ListLongMap!8699)

(assert (=> bm!35823 (= call!35826 call!35823)))

(declare-fun b!823609 () Bool)

(assert (=> b!823609 (= e!458094 (= (apply!359 lt!371429 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!823610 () Bool)

(assert (=> b!823610 (= e!458100 e!458098)))

(declare-fun res!561616 () Bool)

(assert (=> b!823610 (=> (not res!561616) (not e!458098))))

(assert (=> b!823610 (= res!561616 (contains!4172 lt!371429 (select (arr!21986 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!823610 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22407 _keys!976)))))

(declare-fun b!823611 () Bool)

(assert (=> b!823611 (= e!458097 (+!1913 call!35829 (tuple2!9877 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!35824 () Bool)

(assert (=> bm!35824 (= call!35824 (contains!4172 lt!371429 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35825 () Bool)

(declare-fun call!35825 () ListLongMap!8699)

(declare-fun c!89366 () Bool)

(assert (=> bm!35825 (= call!35829 (+!1913 (ite c!89364 call!35823 (ite c!89366 call!35826 call!35825)) (ite (or c!89364 c!89366) (tuple2!9877 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!9877 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!823612 () Bool)

(declare-fun e!458093 () ListLongMap!8699)

(assert (=> b!823612 (= e!458093 call!35825)))

(declare-fun b!823613 () Bool)

(declare-fun e!458095 () ListLongMap!8699)

(assert (=> b!823613 (= e!458097 e!458095)))

(assert (=> b!823613 (= c!89366 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35826 () Bool)

(assert (=> bm!35826 (= call!35825 call!35826)))

(declare-fun b!823614 () Bool)

(assert (=> b!823614 (= e!458099 (not call!35827))))

(declare-fun b!823615 () Bool)

(assert (=> b!823615 (= e!458091 (not call!35824))))

(declare-fun b!823616 () Bool)

(declare-fun c!89363 () Bool)

(assert (=> b!823616 (= c!89363 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!823616 (= e!458095 e!458093)))

(declare-fun b!823617 () Bool)

(assert (=> b!823617 (= e!458093 call!35828)))

(declare-fun b!823618 () Bool)

(assert (=> b!823618 (= e!458095 call!35828)))

(declare-fun b!823619 () Bool)

(assert (=> b!823619 (= e!458090 e!458099)))

(declare-fun c!89365 () Bool)

(assert (=> b!823619 (= c!89365 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!104897 c!89364) b!823611))

(assert (= (and d!104897 (not c!89364)) b!823613))

(assert (= (and b!823613 c!89366) b!823618))

(assert (= (and b!823613 (not c!89366)) b!823616))

(assert (= (and b!823616 c!89363) b!823617))

(assert (= (and b!823616 (not c!89363)) b!823612))

(assert (= (or b!823617 b!823612) bm!35826))

(assert (= (or b!823618 bm!35826) bm!35823))

(assert (= (or b!823618 b!823617) bm!35820))

(assert (= (or b!823611 bm!35823) bm!35822))

(assert (= (or b!823611 bm!35820) bm!35825))

(assert (= (and d!104897 res!561618) b!823606))

(assert (= (and d!104897 c!89368) b!823605))

(assert (= (and d!104897 (not c!89368)) b!823602))

(assert (= (and d!104897 res!561613) b!823607))

(assert (= (and b!823607 res!561620) b!823600))

(assert (= (and b!823607 (not res!561615)) b!823610))

(assert (= (and b!823610 res!561616) b!823599))

(assert (= (and b!823607 res!561612) b!823608))

(assert (= (and b!823608 c!89367) b!823604))

(assert (= (and b!823608 (not c!89367)) b!823615))

(assert (= (and b!823604 res!561614) b!823601))

(assert (= (or b!823604 b!823615) bm!35824))

(assert (= (and b!823608 res!561617) b!823619))

(assert (= (and b!823619 c!89365) b!823603))

(assert (= (and b!823619 (not c!89365)) b!823614))

(assert (= (and b!823603 res!561619) b!823609))

(assert (= (or b!823603 b!823614) bm!35821))

(declare-fun b_lambda!11065 () Bool)

(assert (=> (not b_lambda!11065) (not b!823599)))

(assert (=> b!823599 t!22032))

(declare-fun b_and!22029 () Bool)

(assert (= b_and!22027 (and (=> t!22032 result!7937) b_and!22029)))

(assert (=> b!823610 m!765651))

(assert (=> b!823610 m!765651))

(declare-fun m!765769 () Bool)

(assert (=> b!823610 m!765769))

(declare-fun m!765771 () Bool)

(assert (=> b!823611 m!765771))

(declare-fun m!765773 () Bool)

(assert (=> b!823601 m!765773))

(declare-fun m!765775 () Bool)

(assert (=> bm!35825 m!765775))

(declare-fun m!765777 () Bool)

(assert (=> b!823609 m!765777))

(assert (=> b!823599 m!765651))

(assert (=> b!823599 m!765651))

(declare-fun m!765779 () Bool)

(assert (=> b!823599 m!765779))

(assert (=> b!823599 m!765657))

(assert (=> b!823599 m!765655))

(assert (=> b!823599 m!765657))

(assert (=> b!823599 m!765659))

(assert (=> b!823599 m!765655))

(declare-fun m!765781 () Bool)

(assert (=> bm!35824 m!765781))

(assert (=> b!823600 m!765651))

(assert (=> b!823600 m!765651))

(assert (=> b!823600 m!765653))

(assert (=> bm!35822 m!765613))

(assert (=> d!104897 m!765587))

(declare-fun m!765783 () Bool)

(assert (=> bm!35821 m!765783))

(declare-fun m!765785 () Bool)

(assert (=> b!823605 m!765785))

(declare-fun m!765787 () Bool)

(assert (=> b!823605 m!765787))

(declare-fun m!765789 () Bool)

(assert (=> b!823605 m!765789))

(declare-fun m!765791 () Bool)

(assert (=> b!823605 m!765791))

(declare-fun m!765793 () Bool)

(assert (=> b!823605 m!765793))

(declare-fun m!765795 () Bool)

(assert (=> b!823605 m!765795))

(declare-fun m!765797 () Bool)

(assert (=> b!823605 m!765797))

(declare-fun m!765799 () Bool)

(assert (=> b!823605 m!765799))

(declare-fun m!765801 () Bool)

(assert (=> b!823605 m!765801))

(declare-fun m!765803 () Bool)

(assert (=> b!823605 m!765803))

(declare-fun m!765805 () Bool)

(assert (=> b!823605 m!765805))

(declare-fun m!765807 () Bool)

(assert (=> b!823605 m!765807))

(declare-fun m!765809 () Bool)

(assert (=> b!823605 m!765809))

(declare-fun m!765811 () Bool)

(assert (=> b!823605 m!765811))

(assert (=> b!823605 m!765651))

(assert (=> b!823605 m!765613))

(assert (=> b!823605 m!765795))

(assert (=> b!823605 m!765809))

(assert (=> b!823605 m!765793))

(declare-fun m!765813 () Bool)

(assert (=> b!823605 m!765813))

(assert (=> b!823605 m!765799))

(assert (=> b!823606 m!765651))

(assert (=> b!823606 m!765651))

(assert (=> b!823606 m!765653))

(assert (=> b!823428 d!104897))

(declare-fun d!104899 () Bool)

(declare-fun e!458104 () Bool)

(assert (=> d!104899 e!458104))

(declare-fun res!561625 () Bool)

(assert (=> d!104899 (=> (not res!561625) (not e!458104))))

(declare-fun lt!371455 () ListLongMap!8699)

(assert (=> d!104899 (= res!561625 (contains!4172 lt!371455 (_1!4949 lt!371278)))))

(declare-fun lt!371454 () List!15688)

(assert (=> d!104899 (= lt!371455 (ListLongMap!8700 lt!371454))))

(declare-fun lt!371452 () Unit!28196)

(declare-fun lt!371453 () Unit!28196)

(assert (=> d!104899 (= lt!371452 lt!371453)))

(declare-datatypes ((Option!411 0))(
  ( (Some!410 (v!9902 V!24789)) (None!409) )
))
(declare-fun getValueByKey!405 (List!15688 (_ BitVec 64)) Option!411)

(assert (=> d!104899 (= (getValueByKey!405 lt!371454 (_1!4949 lt!371278)) (Some!410 (_2!4949 lt!371278)))))

(declare-fun lemmaContainsTupThenGetReturnValue!219 (List!15688 (_ BitVec 64) V!24789) Unit!28196)

(assert (=> d!104899 (= lt!371453 (lemmaContainsTupThenGetReturnValue!219 lt!371454 (_1!4949 lt!371278) (_2!4949 lt!371278)))))

(declare-fun insertStrictlySorted!258 (List!15688 (_ BitVec 64) V!24789) List!15688)

(assert (=> d!104899 (= lt!371454 (insertStrictlySorted!258 (toList!4365 lt!371282) (_1!4949 lt!371278) (_2!4949 lt!371278)))))

(assert (=> d!104899 (= (+!1913 lt!371282 lt!371278) lt!371455)))

(declare-fun b!823624 () Bool)

(declare-fun res!561626 () Bool)

(assert (=> b!823624 (=> (not res!561626) (not e!458104))))

(assert (=> b!823624 (= res!561626 (= (getValueByKey!405 (toList!4365 lt!371455) (_1!4949 lt!371278)) (Some!410 (_2!4949 lt!371278))))))

(declare-fun b!823625 () Bool)

(declare-fun contains!4174 (List!15688 tuple2!9876) Bool)

(assert (=> b!823625 (= e!458104 (contains!4174 (toList!4365 lt!371455) lt!371278))))

(assert (= (and d!104899 res!561625) b!823624))

(assert (= (and b!823624 res!561626) b!823625))

(declare-fun m!765815 () Bool)

(assert (=> d!104899 m!765815))

(declare-fun m!765817 () Bool)

(assert (=> d!104899 m!765817))

(declare-fun m!765819 () Bool)

(assert (=> d!104899 m!765819))

(declare-fun m!765821 () Bool)

(assert (=> d!104899 m!765821))

(declare-fun m!765823 () Bool)

(assert (=> b!823624 m!765823))

(declare-fun m!765825 () Bool)

(assert (=> b!823625 m!765825))

(assert (=> b!823428 d!104899))

(declare-fun d!104901 () Bool)

(declare-fun e!458105 () Bool)

(assert (=> d!104901 e!458105))

(declare-fun res!561627 () Bool)

(assert (=> d!104901 (=> (not res!561627) (not e!458105))))

(declare-fun lt!371459 () ListLongMap!8699)

(assert (=> d!104901 (= res!561627 (contains!4172 lt!371459 (_1!4949 lt!371278)))))

(declare-fun lt!371458 () List!15688)

(assert (=> d!104901 (= lt!371459 (ListLongMap!8700 lt!371458))))

(declare-fun lt!371456 () Unit!28196)

(declare-fun lt!371457 () Unit!28196)

(assert (=> d!104901 (= lt!371456 lt!371457)))

(assert (=> d!104901 (= (getValueByKey!405 lt!371458 (_1!4949 lt!371278)) (Some!410 (_2!4949 lt!371278)))))

(assert (=> d!104901 (= lt!371457 (lemmaContainsTupThenGetReturnValue!219 lt!371458 (_1!4949 lt!371278) (_2!4949 lt!371278)))))

(assert (=> d!104901 (= lt!371458 (insertStrictlySorted!258 (toList!4365 lt!371281) (_1!4949 lt!371278) (_2!4949 lt!371278)))))

(assert (=> d!104901 (= (+!1913 lt!371281 lt!371278) lt!371459)))

(declare-fun b!823626 () Bool)

(declare-fun res!561628 () Bool)

(assert (=> b!823626 (=> (not res!561628) (not e!458105))))

(assert (=> b!823626 (= res!561628 (= (getValueByKey!405 (toList!4365 lt!371459) (_1!4949 lt!371278)) (Some!410 (_2!4949 lt!371278))))))

(declare-fun b!823627 () Bool)

(assert (=> b!823627 (= e!458105 (contains!4174 (toList!4365 lt!371459) lt!371278))))

(assert (= (and d!104901 res!561627) b!823626))

(assert (= (and b!823626 res!561628) b!823627))

(declare-fun m!765827 () Bool)

(assert (=> d!104901 m!765827))

(declare-fun m!765829 () Bool)

(assert (=> d!104901 m!765829))

(declare-fun m!765831 () Bool)

(assert (=> d!104901 m!765831))

(declare-fun m!765833 () Bool)

(assert (=> d!104901 m!765833))

(declare-fun m!765835 () Bool)

(assert (=> b!823626 m!765835))

(declare-fun m!765837 () Bool)

(assert (=> b!823627 m!765837))

(assert (=> b!823428 d!104901))

(declare-fun d!104903 () Bool)

(declare-fun e!458106 () Bool)

(assert (=> d!104903 e!458106))

(declare-fun res!561629 () Bool)

(assert (=> d!104903 (=> (not res!561629) (not e!458106))))

(declare-fun lt!371463 () ListLongMap!8699)

(assert (=> d!104903 (= res!561629 (contains!4172 lt!371463 (_1!4949 lt!371273)))))

(declare-fun lt!371462 () List!15688)

(assert (=> d!104903 (= lt!371463 (ListLongMap!8700 lt!371462))))

(declare-fun lt!371460 () Unit!28196)

(declare-fun lt!371461 () Unit!28196)

(assert (=> d!104903 (= lt!371460 lt!371461)))

(assert (=> d!104903 (= (getValueByKey!405 lt!371462 (_1!4949 lt!371273)) (Some!410 (_2!4949 lt!371273)))))

(assert (=> d!104903 (= lt!371461 (lemmaContainsTupThenGetReturnValue!219 lt!371462 (_1!4949 lt!371273) (_2!4949 lt!371273)))))

(assert (=> d!104903 (= lt!371462 (insertStrictlySorted!258 (toList!4365 (+!1913 lt!371281 lt!371278)) (_1!4949 lt!371273) (_2!4949 lt!371273)))))

(assert (=> d!104903 (= (+!1913 (+!1913 lt!371281 lt!371278) lt!371273) lt!371463)))

(declare-fun b!823628 () Bool)

(declare-fun res!561630 () Bool)

(assert (=> b!823628 (=> (not res!561630) (not e!458106))))

(assert (=> b!823628 (= res!561630 (= (getValueByKey!405 (toList!4365 lt!371463) (_1!4949 lt!371273)) (Some!410 (_2!4949 lt!371273))))))

(declare-fun b!823629 () Bool)

(assert (=> b!823629 (= e!458106 (contains!4174 (toList!4365 lt!371463) lt!371273))))

(assert (= (and d!104903 res!561629) b!823628))

(assert (= (and b!823628 res!561630) b!823629))

(declare-fun m!765839 () Bool)

(assert (=> d!104903 m!765839))

(declare-fun m!765841 () Bool)

(assert (=> d!104903 m!765841))

(declare-fun m!765843 () Bool)

(assert (=> d!104903 m!765843))

(declare-fun m!765845 () Bool)

(assert (=> d!104903 m!765845))

(declare-fun m!765847 () Bool)

(assert (=> b!823628 m!765847))

(declare-fun m!765849 () Bool)

(assert (=> b!823629 m!765849))

(assert (=> b!823428 d!104903))

(declare-fun d!104905 () Bool)

(declare-fun e!458107 () Bool)

(assert (=> d!104905 e!458107))

(declare-fun res!561631 () Bool)

(assert (=> d!104905 (=> (not res!561631) (not e!458107))))

(declare-fun lt!371467 () ListLongMap!8699)

(assert (=> d!104905 (= res!561631 (contains!4172 lt!371467 (_1!4949 lt!371273)))))

(declare-fun lt!371466 () List!15688)

(assert (=> d!104905 (= lt!371467 (ListLongMap!8700 lt!371466))))

(declare-fun lt!371464 () Unit!28196)

(declare-fun lt!371465 () Unit!28196)

(assert (=> d!104905 (= lt!371464 lt!371465)))

(assert (=> d!104905 (= (getValueByKey!405 lt!371466 (_1!4949 lt!371273)) (Some!410 (_2!4949 lt!371273)))))

(assert (=> d!104905 (= lt!371465 (lemmaContainsTupThenGetReturnValue!219 lt!371466 (_1!4949 lt!371273) (_2!4949 lt!371273)))))

(assert (=> d!104905 (= lt!371466 (insertStrictlySorted!258 (toList!4365 lt!371281) (_1!4949 lt!371273) (_2!4949 lt!371273)))))

(assert (=> d!104905 (= (+!1913 lt!371281 lt!371273) lt!371467)))

(declare-fun b!823630 () Bool)

(declare-fun res!561632 () Bool)

(assert (=> b!823630 (=> (not res!561632) (not e!458107))))

(assert (=> b!823630 (= res!561632 (= (getValueByKey!405 (toList!4365 lt!371467) (_1!4949 lt!371273)) (Some!410 (_2!4949 lt!371273))))))

(declare-fun b!823631 () Bool)

(assert (=> b!823631 (= e!458107 (contains!4174 (toList!4365 lt!371467) lt!371273))))

(assert (= (and d!104905 res!561631) b!823630))

(assert (= (and b!823630 res!561632) b!823631))

(declare-fun m!765851 () Bool)

(assert (=> d!104905 m!765851))

(declare-fun m!765853 () Bool)

(assert (=> d!104905 m!765853))

(declare-fun m!765855 () Bool)

(assert (=> d!104905 m!765855))

(declare-fun m!765857 () Bool)

(assert (=> d!104905 m!765857))

(declare-fun m!765859 () Bool)

(assert (=> b!823630 m!765859))

(declare-fun m!765861 () Bool)

(assert (=> b!823631 m!765861))

(assert (=> b!823428 d!104905))

(declare-fun mapIsEmpty!23881 () Bool)

(declare-fun mapRes!23881 () Bool)

(assert (=> mapIsEmpty!23881 mapRes!23881))

(declare-fun mapNonEmpty!23881 () Bool)

(declare-fun tp!46150 () Bool)

(declare-fun e!458113 () Bool)

(assert (=> mapNonEmpty!23881 (= mapRes!23881 (and tp!46150 e!458113))))

(declare-fun mapKey!23881 () (_ BitVec 32))

(declare-fun mapValue!23881 () ValueCell!7005)

(declare-fun mapRest!23881 () (Array (_ BitVec 32) ValueCell!7005))

(assert (=> mapNonEmpty!23881 (= mapRest!23875 (store mapRest!23881 mapKey!23881 mapValue!23881))))

(declare-fun condMapEmpty!23881 () Bool)

(declare-fun mapDefault!23881 () ValueCell!7005)

(assert (=> mapNonEmpty!23875 (= condMapEmpty!23881 (= mapRest!23875 ((as const (Array (_ BitVec 32) ValueCell!7005)) mapDefault!23881)))))

(declare-fun e!458112 () Bool)

(assert (=> mapNonEmpty!23875 (= tp!46141 (and e!458112 mapRes!23881))))

(declare-fun b!823639 () Bool)

(assert (=> b!823639 (= e!458112 tp_is_empty!14841)))

(declare-fun b!823638 () Bool)

(assert (=> b!823638 (= e!458113 tp_is_empty!14841)))

(assert (= (and mapNonEmpty!23875 condMapEmpty!23881) mapIsEmpty!23881))

(assert (= (and mapNonEmpty!23875 (not condMapEmpty!23881)) mapNonEmpty!23881))

(assert (= (and mapNonEmpty!23881 ((_ is ValueCellFull!7005) mapValue!23881)) b!823638))

(assert (= (and mapNonEmpty!23875 ((_ is ValueCellFull!7005) mapDefault!23881)) b!823639))

(declare-fun m!765863 () Bool)

(assert (=> mapNonEmpty!23881 m!765863))

(declare-fun b_lambda!11067 () Bool)

(assert (= b_lambda!11057 (or (and start!70894 b_free!13131) b_lambda!11067)))

(declare-fun b_lambda!11069 () Bool)

(assert (= b_lambda!11059 (or (and start!70894 b_free!13131) b_lambda!11069)))

(declare-fun b_lambda!11071 () Bool)

(assert (= b_lambda!11065 (or (and start!70894 b_free!13131) b_lambda!11071)))

(declare-fun b_lambda!11073 () Bool)

(assert (= b_lambda!11055 (or (and start!70894 b_free!13131) b_lambda!11073)))

(declare-fun b_lambda!11075 () Bool)

(assert (= b_lambda!11061 (or (and start!70894 b_free!13131) b_lambda!11075)))

(declare-fun b_lambda!11077 () Bool)

(assert (= b_lambda!11063 (or (and start!70894 b_free!13131) b_lambda!11077)))

(check-sat (not b!823488) (not b!823504) (not b!823490) (not b!823627) (not b!823611) (not b!823502) (not b!823483) (not b!823580) (not b_lambda!11075) (not b!823589) (not b_lambda!11073) (not b!823629) (not b_lambda!11067) (not b!823625) (not d!104893) (not bm!35824) (not b_lambda!11071) (not bm!35815) (not d!104903) (not b!823518) (not b!823610) (not b!823588) (not b!823503) (not d!104895) (not b!823507) (not b!823497) (not b!823578) (not b!823606) (not b!823624) (not d!104877) b_and!22029 (not b!823491) (not b_lambda!11077) (not d!104879) (not b!823487) (not b!823605) (not d!104899) (not b!823517) (not d!104905) (not b!823498) (not b_lambda!11069) (not bm!35821) (not b_next!13131) (not b!823601) tp_is_empty!14841 (not bm!35792) (not bm!35822) (not b!823484) (not b!823489) (not bm!35798) (not b!823584) (not b!823630) (not d!104897) (not d!104881) (not b!823628) (not b!823626) (not b!823493) (not bm!35818) (not b!823531) (not b!823505) (not mapNonEmpty!23881) (not bm!35791) (not bm!35825) (not bm!35817) (not b!823609) (not d!104901) (not b!823501) (not b!823600) (not b!823532) (not b!823590) (not b!823535) (not bm!35795) (not bm!35814) (not b!823579) (not b!823585) (not b!823599) (not b!823631))
(check-sat b_and!22029 (not b_next!13131))
