; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71454 () Bool)

(assert start!71454)

(declare-fun b_free!13423 () Bool)

(declare-fun b_next!13423 () Bool)

(assert (=> start!71454 (= b_free!13423 (not b_next!13423))))

(declare-fun tp!47035 () Bool)

(declare-fun b_and!22379 () Bool)

(assert (=> start!71454 (= tp!47035 b_and!22379)))

(declare-fun res!564616 () Bool)

(declare-fun e!461896 () Bool)

(assert (=> start!71454 (=> (not res!564616) (not e!461896))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71454 (= res!564616 (validMask!0 mask!1312))))

(assert (=> start!71454 e!461896))

(declare-fun tp_is_empty!15133 () Bool)

(assert (=> start!71454 tp_is_empty!15133))

(declare-datatypes ((array!46441 0))(
  ( (array!46442 (arr!22259 (Array (_ BitVec 32) (_ BitVec 64))) (size!22679 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46441)

(declare-fun array_inv!17779 (array!46441) Bool)

(assert (=> start!71454 (array_inv!17779 _keys!976)))

(assert (=> start!71454 true))

(declare-datatypes ((V!25179 0))(
  ( (V!25180 (val!7614 Int)) )
))
(declare-datatypes ((ValueCell!7151 0))(
  ( (ValueCellFull!7151 (v!10049 V!25179)) (EmptyCell!7151) )
))
(declare-datatypes ((array!46443 0))(
  ( (array!46444 (arr!22260 (Array (_ BitVec 32) ValueCell!7151)) (size!22680 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46443)

(declare-fun e!461899 () Bool)

(declare-fun array_inv!17780 (array!46443) Bool)

(assert (=> start!71454 (and (array_inv!17780 _values!788) e!461899)))

(assert (=> start!71454 tp!47035))

(declare-fun mapIsEmpty!24331 () Bool)

(declare-fun mapRes!24331 () Bool)

(assert (=> mapIsEmpty!24331 mapRes!24331))

(declare-fun zeroValueBefore!34 () V!25179)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!25179)

(declare-fun minValue!754 () V!25179)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun b!828871 () Bool)

(declare-fun e!461900 () Bool)

(declare-datatypes ((tuple2!10018 0))(
  ( (tuple2!10019 (_1!5020 (_ BitVec 64)) (_2!5020 V!25179)) )
))
(declare-datatypes ((List!15795 0))(
  ( (Nil!15792) (Cons!15791 (h!16926 tuple2!10018) (t!22138 List!15795)) )
))
(declare-datatypes ((ListLongMap!8843 0))(
  ( (ListLongMap!8844 (toList!4437 List!15795)) )
))
(declare-fun +!1960 (ListLongMap!8843 tuple2!10018) ListLongMap!8843)

(declare-fun getCurrentListMap!2533 (array!46441 array!46443 (_ BitVec 32) (_ BitVec 32) V!25179 V!25179 (_ BitVec 32) Int) ListLongMap!8843)

(assert (=> b!828871 (= e!461900 (= (+!1960 (getCurrentListMap!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!10019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (getCurrentListMap!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796)))))

(declare-fun b!828872 () Bool)

(declare-fun e!461895 () Bool)

(assert (=> b!828872 (= e!461895 tp_is_empty!15133)))

(declare-fun b!828873 () Bool)

(declare-fun res!564615 () Bool)

(assert (=> b!828873 (=> (not res!564615) (not e!461896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46441 (_ BitVec 32)) Bool)

(assert (=> b!828873 (= res!564615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!828874 () Bool)

(assert (=> b!828874 (= e!461899 (and e!461895 mapRes!24331))))

(declare-fun condMapEmpty!24331 () Bool)

(declare-fun mapDefault!24331 () ValueCell!7151)

(assert (=> b!828874 (= condMapEmpty!24331 (= (arr!22260 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7151)) mapDefault!24331)))))

(declare-fun b!828875 () Bool)

(declare-fun res!564614 () Bool)

(assert (=> b!828875 (=> (not res!564614) (not e!461896))))

(assert (=> b!828875 (= res!564614 (and (= (size!22680 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22679 _keys!976) (size!22680 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828876 () Bool)

(declare-fun e!461898 () Bool)

(assert (=> b!828876 (= e!461898 tp_is_empty!15133)))

(declare-fun b!828877 () Bool)

(assert (=> b!828877 (= e!461896 (not e!461900))))

(declare-fun res!564612 () Bool)

(assert (=> b!828877 (=> res!564612 e!461900)))

(assert (=> b!828877 (= res!564612 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!375428 () ListLongMap!8843)

(declare-fun lt!375427 () ListLongMap!8843)

(assert (=> b!828877 (= lt!375428 lt!375427)))

(declare-datatypes ((Unit!28386 0))(
  ( (Unit!28387) )
))
(declare-fun lt!375429 () Unit!28386)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!581 (array!46441 array!46443 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25179 V!25179 V!25179 V!25179 (_ BitVec 32) Int) Unit!28386)

(assert (=> b!828877 (= lt!375429 (lemmaNoChangeToArrayThenSameMapNoExtras!581 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2514 (array!46441 array!46443 (_ BitVec 32) (_ BitVec 32) V!25179 V!25179 (_ BitVec 32) Int) ListLongMap!8843)

(assert (=> b!828877 (= lt!375427 (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!828877 (= lt!375428 (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24331 () Bool)

(declare-fun tp!47034 () Bool)

(assert (=> mapNonEmpty!24331 (= mapRes!24331 (and tp!47034 e!461898))))

(declare-fun mapRest!24331 () (Array (_ BitVec 32) ValueCell!7151))

(declare-fun mapValue!24331 () ValueCell!7151)

(declare-fun mapKey!24331 () (_ BitVec 32))

(assert (=> mapNonEmpty!24331 (= (arr!22260 _values!788) (store mapRest!24331 mapKey!24331 mapValue!24331))))

(declare-fun b!828878 () Bool)

(declare-fun res!564613 () Bool)

(assert (=> b!828878 (=> (not res!564613) (not e!461896))))

(declare-datatypes ((List!15796 0))(
  ( (Nil!15793) (Cons!15792 (h!16927 (_ BitVec 64)) (t!22139 List!15796)) )
))
(declare-fun arrayNoDuplicates!0 (array!46441 (_ BitVec 32) List!15796) Bool)

(assert (=> b!828878 (= res!564613 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15793))))

(assert (= (and start!71454 res!564616) b!828875))

(assert (= (and b!828875 res!564614) b!828873))

(assert (= (and b!828873 res!564615) b!828878))

(assert (= (and b!828878 res!564613) b!828877))

(assert (= (and b!828877 (not res!564612)) b!828871))

(assert (= (and b!828874 condMapEmpty!24331) mapIsEmpty!24331))

(assert (= (and b!828874 (not condMapEmpty!24331)) mapNonEmpty!24331))

(get-info :version)

(assert (= (and mapNonEmpty!24331 ((_ is ValueCellFull!7151) mapValue!24331)) b!828876))

(assert (= (and b!828874 ((_ is ValueCellFull!7151) mapDefault!24331)) b!828872))

(assert (= start!71454 b!828874))

(declare-fun m!772209 () Bool)

(assert (=> b!828878 m!772209))

(declare-fun m!772211 () Bool)

(assert (=> b!828873 m!772211))

(declare-fun m!772213 () Bool)

(assert (=> b!828871 m!772213))

(assert (=> b!828871 m!772213))

(declare-fun m!772215 () Bool)

(assert (=> b!828871 m!772215))

(declare-fun m!772217 () Bool)

(assert (=> b!828871 m!772217))

(declare-fun m!772219 () Bool)

(assert (=> b!828877 m!772219))

(declare-fun m!772221 () Bool)

(assert (=> b!828877 m!772221))

(declare-fun m!772223 () Bool)

(assert (=> b!828877 m!772223))

(declare-fun m!772225 () Bool)

(assert (=> mapNonEmpty!24331 m!772225))

(declare-fun m!772227 () Bool)

(assert (=> start!71454 m!772227))

(declare-fun m!772229 () Bool)

(assert (=> start!71454 m!772229))

(declare-fun m!772231 () Bool)

(assert (=> start!71454 m!772231))

(check-sat (not b!828877) (not mapNonEmpty!24331) b_and!22379 (not b_next!13423) (not start!71454) (not b!828871) tp_is_empty!15133 (not b!828878) (not b!828873))
(check-sat b_and!22379 (not b_next!13423))
(get-model)

(declare-fun d!105465 () Bool)

(declare-fun e!461939 () Bool)

(assert (=> d!105465 e!461939))

(declare-fun res!564651 () Bool)

(assert (=> d!105465 (=> (not res!564651) (not e!461939))))

(declare-fun lt!375457 () ListLongMap!8843)

(declare-fun contains!4165 (ListLongMap!8843 (_ BitVec 64)) Bool)

(assert (=> d!105465 (= res!564651 (contains!4165 lt!375457 (_1!5020 (tuple2!10019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!375458 () List!15795)

(assert (=> d!105465 (= lt!375457 (ListLongMap!8844 lt!375458))))

(declare-fun lt!375456 () Unit!28386)

(declare-fun lt!375459 () Unit!28386)

(assert (=> d!105465 (= lt!375456 lt!375459)))

(declare-datatypes ((Option!415 0))(
  ( (Some!414 (v!10052 V!25179)) (None!413) )
))
(declare-fun getValueByKey!409 (List!15795 (_ BitVec 64)) Option!415)

(assert (=> d!105465 (= (getValueByKey!409 lt!375458 (_1!5020 (tuple2!10019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!414 (_2!5020 (tuple2!10019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lemmaContainsTupThenGetReturnValue!223 (List!15795 (_ BitVec 64) V!25179) Unit!28386)

(assert (=> d!105465 (= lt!375459 (lemmaContainsTupThenGetReturnValue!223 lt!375458 (_1!5020 (tuple2!10019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5020 (tuple2!10019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun insertStrictlySorted!262 (List!15795 (_ BitVec 64) V!25179) List!15795)

(assert (=> d!105465 (= lt!375458 (insertStrictlySorted!262 (toList!4437 (getCurrentListMap!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796)) (_1!5020 (tuple2!10019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5020 (tuple2!10019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105465 (= (+!1960 (getCurrentListMap!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!10019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!375457)))

(declare-fun b!828931 () Bool)

(declare-fun res!564652 () Bool)

(assert (=> b!828931 (=> (not res!564652) (not e!461939))))

(assert (=> b!828931 (= res!564652 (= (getValueByKey!409 (toList!4437 lt!375457) (_1!5020 (tuple2!10019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!414 (_2!5020 (tuple2!10019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!828932 () Bool)

(declare-fun contains!4166 (List!15795 tuple2!10018) Bool)

(assert (=> b!828932 (= e!461939 (contains!4166 (toList!4437 lt!375457) (tuple2!10019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105465 res!564651) b!828931))

(assert (= (and b!828931 res!564652) b!828932))

(declare-fun m!772281 () Bool)

(assert (=> d!105465 m!772281))

(declare-fun m!772283 () Bool)

(assert (=> d!105465 m!772283))

(declare-fun m!772285 () Bool)

(assert (=> d!105465 m!772285))

(declare-fun m!772287 () Bool)

(assert (=> d!105465 m!772287))

(declare-fun m!772289 () Bool)

(assert (=> b!828931 m!772289))

(declare-fun m!772291 () Bool)

(assert (=> b!828932 m!772291))

(assert (=> b!828871 d!105465))

(declare-fun b!828975 () Bool)

(declare-fun e!461975 () Bool)

(declare-fun lt!375520 () ListLongMap!8843)

(declare-fun apply!365 (ListLongMap!8843 (_ BitVec 64)) V!25179)

(assert (=> b!828975 (= e!461975 (= (apply!365 lt!375520 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!828976 () Bool)

(declare-fun e!461967 () Bool)

(declare-fun e!461972 () Bool)

(assert (=> b!828976 (= e!461967 e!461972)))

(declare-fun c!89834 () Bool)

(assert (=> b!828976 (= c!89834 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828977 () Bool)

(declare-fun e!461968 () Unit!28386)

(declare-fun Unit!28388 () Unit!28386)

(assert (=> b!828977 (= e!461968 Unit!28388)))

(declare-fun b!828978 () Bool)

(declare-fun e!461977 () ListLongMap!8843)

(declare-fun call!36020 () ListLongMap!8843)

(assert (=> b!828978 (= e!461977 call!36020)))

(declare-fun c!89838 () Bool)

(declare-fun bm!36013 () Bool)

(declare-fun c!89835 () Bool)

(declare-fun call!36016 () ListLongMap!8843)

(declare-fun call!36021 () ListLongMap!8843)

(declare-fun call!36019 () ListLongMap!8843)

(assert (=> bm!36013 (= call!36016 (+!1960 (ite c!89838 call!36021 (ite c!89835 call!36019 call!36020)) (ite (or c!89838 c!89835) (tuple2!10019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10019 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!36014 () Bool)

(declare-fun call!36022 () Bool)

(assert (=> bm!36014 (= call!36022 (contains!4165 lt!375520 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!36015 () Bool)

(assert (=> bm!36015 (= call!36019 call!36021)))

(declare-fun bm!36016 () Bool)

(declare-fun call!36018 () ListLongMap!8843)

(assert (=> bm!36016 (= call!36018 call!36016)))

(declare-fun b!828979 () Bool)

(declare-fun e!461966 () Bool)

(declare-fun e!461974 () Bool)

(assert (=> b!828979 (= e!461966 e!461974)))

(declare-fun res!564676 () Bool)

(assert (=> b!828979 (= res!564676 call!36022)))

(assert (=> b!828979 (=> (not res!564676) (not e!461974))))

(declare-fun b!828980 () Bool)

(declare-fun e!461971 () ListLongMap!8843)

(assert (=> b!828980 (= e!461971 (+!1960 call!36016 (tuple2!10019 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!36017 () Bool)

(declare-fun call!36017 () Bool)

(assert (=> bm!36017 (= call!36017 (contains!4165 lt!375520 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!828981 () Bool)

(assert (=> b!828981 (= e!461977 call!36018)))

(declare-fun b!828982 () Bool)

(assert (=> b!828982 (= e!461972 e!461975)))

(declare-fun res!564678 () Bool)

(assert (=> b!828982 (= res!564678 call!36017)))

(assert (=> b!828982 (=> (not res!564678) (not e!461975))))

(declare-fun b!828983 () Bool)

(declare-fun lt!375508 () Unit!28386)

(assert (=> b!828983 (= e!461968 lt!375508)))

(declare-fun lt!375515 () ListLongMap!8843)

(assert (=> b!828983 (= lt!375515 (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375522 () (_ BitVec 64))

(assert (=> b!828983 (= lt!375522 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375512 () (_ BitVec 64))

(assert (=> b!828983 (= lt!375512 (select (arr!22259 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375525 () Unit!28386)

(declare-fun addStillContains!316 (ListLongMap!8843 (_ BitVec 64) V!25179 (_ BitVec 64)) Unit!28386)

(assert (=> b!828983 (= lt!375525 (addStillContains!316 lt!375515 lt!375522 zeroValueBefore!34 lt!375512))))

(assert (=> b!828983 (contains!4165 (+!1960 lt!375515 (tuple2!10019 lt!375522 zeroValueBefore!34)) lt!375512)))

(declare-fun lt!375519 () Unit!28386)

(assert (=> b!828983 (= lt!375519 lt!375525)))

(declare-fun lt!375514 () ListLongMap!8843)

(assert (=> b!828983 (= lt!375514 (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375517 () (_ BitVec 64))

(assert (=> b!828983 (= lt!375517 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375523 () (_ BitVec 64))

(assert (=> b!828983 (= lt!375523 (select (arr!22259 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375518 () Unit!28386)

(declare-fun addApplyDifferent!316 (ListLongMap!8843 (_ BitVec 64) V!25179 (_ BitVec 64)) Unit!28386)

(assert (=> b!828983 (= lt!375518 (addApplyDifferent!316 lt!375514 lt!375517 minValue!754 lt!375523))))

(assert (=> b!828983 (= (apply!365 (+!1960 lt!375514 (tuple2!10019 lt!375517 minValue!754)) lt!375523) (apply!365 lt!375514 lt!375523))))

(declare-fun lt!375513 () Unit!28386)

(assert (=> b!828983 (= lt!375513 lt!375518)))

(declare-fun lt!375521 () ListLongMap!8843)

(assert (=> b!828983 (= lt!375521 (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375509 () (_ BitVec 64))

(assert (=> b!828983 (= lt!375509 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375504 () (_ BitVec 64))

(assert (=> b!828983 (= lt!375504 (select (arr!22259 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375507 () Unit!28386)

(assert (=> b!828983 (= lt!375507 (addApplyDifferent!316 lt!375521 lt!375509 zeroValueBefore!34 lt!375504))))

(assert (=> b!828983 (= (apply!365 (+!1960 lt!375521 (tuple2!10019 lt!375509 zeroValueBefore!34)) lt!375504) (apply!365 lt!375521 lt!375504))))

(declare-fun lt!375511 () Unit!28386)

(assert (=> b!828983 (= lt!375511 lt!375507)))

(declare-fun lt!375510 () ListLongMap!8843)

(assert (=> b!828983 (= lt!375510 (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375516 () (_ BitVec 64))

(assert (=> b!828983 (= lt!375516 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375506 () (_ BitVec 64))

(assert (=> b!828983 (= lt!375506 (select (arr!22259 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828983 (= lt!375508 (addApplyDifferent!316 lt!375510 lt!375516 minValue!754 lt!375506))))

(assert (=> b!828983 (= (apply!365 (+!1960 lt!375510 (tuple2!10019 lt!375516 minValue!754)) lt!375506) (apply!365 lt!375510 lt!375506))))

(declare-fun b!828984 () Bool)

(declare-fun e!461973 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!828984 (= e!461973 (validKeyInArray!0 (select (arr!22259 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828985 () Bool)

(declare-fun e!461978 () ListLongMap!8843)

(assert (=> b!828985 (= e!461978 call!36018)))

(declare-fun b!828986 () Bool)

(assert (=> b!828986 (= e!461971 e!461978)))

(assert (=> b!828986 (= c!89835 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!36018 () Bool)

(assert (=> bm!36018 (= call!36021 (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828987 () Bool)

(declare-fun res!564672 () Bool)

(assert (=> b!828987 (=> (not res!564672) (not e!461967))))

(declare-fun e!461969 () Bool)

(assert (=> b!828987 (= res!564672 e!461969)))

(declare-fun res!564677 () Bool)

(assert (=> b!828987 (=> res!564677 e!461969)))

(declare-fun e!461976 () Bool)

(assert (=> b!828987 (= res!564677 (not e!461976))))

(declare-fun res!564671 () Bool)

(assert (=> b!828987 (=> (not res!564671) (not e!461976))))

(assert (=> b!828987 (= res!564671 (bvslt #b00000000000000000000000000000000 (size!22679 _keys!976)))))

(declare-fun b!828988 () Bool)

(assert (=> b!828988 (= e!461974 (= (apply!365 lt!375520 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun bm!36019 () Bool)

(assert (=> bm!36019 (= call!36020 call!36019)))

(declare-fun d!105467 () Bool)

(assert (=> d!105467 e!461967))

(declare-fun res!564675 () Bool)

(assert (=> d!105467 (=> (not res!564675) (not e!461967))))

(assert (=> d!105467 (= res!564675 (or (bvsge #b00000000000000000000000000000000 (size!22679 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22679 _keys!976)))))))

(declare-fun lt!375524 () ListLongMap!8843)

(assert (=> d!105467 (= lt!375520 lt!375524)))

(declare-fun lt!375505 () Unit!28386)

(assert (=> d!105467 (= lt!375505 e!461968)))

(declare-fun c!89836 () Bool)

(assert (=> d!105467 (= c!89836 e!461973)))

(declare-fun res!564679 () Bool)

(assert (=> d!105467 (=> (not res!564679) (not e!461973))))

(assert (=> d!105467 (= res!564679 (bvslt #b00000000000000000000000000000000 (size!22679 _keys!976)))))

(assert (=> d!105467 (= lt!375524 e!461971)))

(assert (=> d!105467 (= c!89838 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105467 (validMask!0 mask!1312)))

(assert (=> d!105467 (= (getCurrentListMap!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375520)))

(declare-fun b!828989 () Bool)

(declare-fun res!564673 () Bool)

(assert (=> b!828989 (=> (not res!564673) (not e!461967))))

(assert (=> b!828989 (= res!564673 e!461966)))

(declare-fun c!89837 () Bool)

(assert (=> b!828989 (= c!89837 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!828990 () Bool)

(assert (=> b!828990 (= e!461972 (not call!36017))))

(declare-fun b!828991 () Bool)

(assert (=> b!828991 (= e!461976 (validKeyInArray!0 (select (arr!22259 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828992 () Bool)

(declare-fun c!89839 () Bool)

(assert (=> b!828992 (= c!89839 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!828992 (= e!461978 e!461977)))

(declare-fun e!461970 () Bool)

(declare-fun b!828993 () Bool)

(declare-fun get!11789 (ValueCell!7151 V!25179) V!25179)

(declare-fun dynLambda!973 (Int (_ BitVec 64)) V!25179)

(assert (=> b!828993 (= e!461970 (= (apply!365 lt!375520 (select (arr!22259 _keys!976) #b00000000000000000000000000000000)) (get!11789 (select (arr!22260 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!828993 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22680 _values!788)))))

(assert (=> b!828993 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22679 _keys!976)))))

(declare-fun b!828994 () Bool)

(assert (=> b!828994 (= e!461969 e!461970)))

(declare-fun res!564674 () Bool)

(assert (=> b!828994 (=> (not res!564674) (not e!461970))))

(assert (=> b!828994 (= res!564674 (contains!4165 lt!375520 (select (arr!22259 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828994 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22679 _keys!976)))))

(declare-fun b!828995 () Bool)

(assert (=> b!828995 (= e!461966 (not call!36022))))

(assert (= (and d!105467 c!89838) b!828980))

(assert (= (and d!105467 (not c!89838)) b!828986))

(assert (= (and b!828986 c!89835) b!828985))

(assert (= (and b!828986 (not c!89835)) b!828992))

(assert (= (and b!828992 c!89839) b!828981))

(assert (= (and b!828992 (not c!89839)) b!828978))

(assert (= (or b!828981 b!828978) bm!36019))

(assert (= (or b!828985 bm!36019) bm!36015))

(assert (= (or b!828985 b!828981) bm!36016))

(assert (= (or b!828980 bm!36015) bm!36018))

(assert (= (or b!828980 bm!36016) bm!36013))

(assert (= (and d!105467 res!564679) b!828984))

(assert (= (and d!105467 c!89836) b!828983))

(assert (= (and d!105467 (not c!89836)) b!828977))

(assert (= (and d!105467 res!564675) b!828987))

(assert (= (and b!828987 res!564671) b!828991))

(assert (= (and b!828987 (not res!564677)) b!828994))

(assert (= (and b!828994 res!564674) b!828993))

(assert (= (and b!828987 res!564672) b!828989))

(assert (= (and b!828989 c!89837) b!828979))

(assert (= (and b!828989 (not c!89837)) b!828995))

(assert (= (and b!828979 res!564676) b!828988))

(assert (= (or b!828979 b!828995) bm!36014))

(assert (= (and b!828989 res!564673) b!828976))

(assert (= (and b!828976 c!89834) b!828982))

(assert (= (and b!828976 (not c!89834)) b!828990))

(assert (= (and b!828982 res!564678) b!828975))

(assert (= (or b!828982 b!828990) bm!36017))

(declare-fun b_lambda!11193 () Bool)

(assert (=> (not b_lambda!11193) (not b!828993)))

(declare-fun t!22141 () Bool)

(declare-fun tb!4203 () Bool)

(assert (=> (and start!71454 (= defaultEntry!796 defaultEntry!796) t!22141) tb!4203))

(declare-fun result!7965 () Bool)

(assert (=> tb!4203 (= result!7965 tp_is_empty!15133)))

(assert (=> b!828993 t!22141))

(declare-fun b_and!22385 () Bool)

(assert (= b_and!22379 (and (=> t!22141 result!7965) b_and!22385)))

(declare-fun m!772293 () Bool)

(assert (=> b!828984 m!772293))

(assert (=> b!828984 m!772293))

(declare-fun m!772295 () Bool)

(assert (=> b!828984 m!772295))

(declare-fun m!772297 () Bool)

(assert (=> b!828983 m!772297))

(declare-fun m!772299 () Bool)

(assert (=> b!828983 m!772299))

(declare-fun m!772301 () Bool)

(assert (=> b!828983 m!772301))

(assert (=> b!828983 m!772293))

(declare-fun m!772303 () Bool)

(assert (=> b!828983 m!772303))

(declare-fun m!772305 () Bool)

(assert (=> b!828983 m!772305))

(declare-fun m!772307 () Bool)

(assert (=> b!828983 m!772307))

(declare-fun m!772309 () Bool)

(assert (=> b!828983 m!772309))

(declare-fun m!772311 () Bool)

(assert (=> b!828983 m!772311))

(declare-fun m!772313 () Bool)

(assert (=> b!828983 m!772313))

(assert (=> b!828983 m!772309))

(declare-fun m!772315 () Bool)

(assert (=> b!828983 m!772315))

(declare-fun m!772317 () Bool)

(assert (=> b!828983 m!772317))

(assert (=> b!828983 m!772317))

(declare-fun m!772319 () Bool)

(assert (=> b!828983 m!772319))

(assert (=> b!828983 m!772313))

(declare-fun m!772321 () Bool)

(assert (=> b!828983 m!772321))

(assert (=> b!828983 m!772223))

(declare-fun m!772323 () Bool)

(assert (=> b!828983 m!772323))

(assert (=> b!828983 m!772305))

(declare-fun m!772325 () Bool)

(assert (=> b!828983 m!772325))

(declare-fun m!772327 () Bool)

(assert (=> bm!36013 m!772327))

(declare-fun m!772329 () Bool)

(assert (=> bm!36017 m!772329))

(declare-fun m!772331 () Bool)

(assert (=> bm!36014 m!772331))

(declare-fun m!772333 () Bool)

(assert (=> b!828975 m!772333))

(assert (=> d!105467 m!772227))

(declare-fun m!772335 () Bool)

(assert (=> b!828980 m!772335))

(assert (=> b!828991 m!772293))

(assert (=> b!828991 m!772293))

(assert (=> b!828991 m!772295))

(declare-fun m!772337 () Bool)

(assert (=> b!828988 m!772337))

(assert (=> bm!36018 m!772223))

(assert (=> b!828994 m!772293))

(assert (=> b!828994 m!772293))

(declare-fun m!772339 () Bool)

(assert (=> b!828994 m!772339))

(declare-fun m!772341 () Bool)

(assert (=> b!828993 m!772341))

(declare-fun m!772343 () Bool)

(assert (=> b!828993 m!772343))

(declare-fun m!772345 () Bool)

(assert (=> b!828993 m!772345))

(assert (=> b!828993 m!772293))

(declare-fun m!772347 () Bool)

(assert (=> b!828993 m!772347))

(assert (=> b!828993 m!772293))

(assert (=> b!828993 m!772343))

(assert (=> b!828993 m!772341))

(assert (=> b!828871 d!105467))

(declare-fun b!828998 () Bool)

(declare-fun e!461988 () Bool)

(declare-fun lt!375542 () ListLongMap!8843)

(assert (=> b!828998 (= e!461988 (= (apply!365 lt!375542 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!828999 () Bool)

(declare-fun e!461980 () Bool)

(declare-fun e!461985 () Bool)

(assert (=> b!828999 (= e!461980 e!461985)))

(declare-fun c!89840 () Bool)

(assert (=> b!828999 (= c!89840 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!829000 () Bool)

(declare-fun e!461981 () Unit!28386)

(declare-fun Unit!28389 () Unit!28386)

(assert (=> b!829000 (= e!461981 Unit!28389)))

(declare-fun b!829001 () Bool)

(declare-fun e!461990 () ListLongMap!8843)

(declare-fun call!36027 () ListLongMap!8843)

(assert (=> b!829001 (= e!461990 call!36027)))

(declare-fun bm!36020 () Bool)

(declare-fun c!89841 () Bool)

(declare-fun call!36023 () ListLongMap!8843)

(declare-fun call!36028 () ListLongMap!8843)

(declare-fun c!89844 () Bool)

(declare-fun call!36026 () ListLongMap!8843)

(assert (=> bm!36020 (= call!36023 (+!1960 (ite c!89844 call!36028 (ite c!89841 call!36026 call!36027)) (ite (or c!89844 c!89841) (tuple2!10019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10019 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!36021 () Bool)

(declare-fun call!36029 () Bool)

(assert (=> bm!36021 (= call!36029 (contains!4165 lt!375542 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!36022 () Bool)

(assert (=> bm!36022 (= call!36026 call!36028)))

(declare-fun bm!36023 () Bool)

(declare-fun call!36025 () ListLongMap!8843)

(assert (=> bm!36023 (= call!36025 call!36023)))

(declare-fun b!829002 () Bool)

(declare-fun e!461979 () Bool)

(declare-fun e!461987 () Bool)

(assert (=> b!829002 (= e!461979 e!461987)))

(declare-fun res!564685 () Bool)

(assert (=> b!829002 (= res!564685 call!36029)))

(assert (=> b!829002 (=> (not res!564685) (not e!461987))))

(declare-fun b!829003 () Bool)

(declare-fun e!461984 () ListLongMap!8843)

(assert (=> b!829003 (= e!461984 (+!1960 call!36023 (tuple2!10019 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!36024 () Bool)

(declare-fun call!36024 () Bool)

(assert (=> bm!36024 (= call!36024 (contains!4165 lt!375542 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829004 () Bool)

(assert (=> b!829004 (= e!461990 call!36025)))

(declare-fun b!829005 () Bool)

(assert (=> b!829005 (= e!461985 e!461988)))

(declare-fun res!564687 () Bool)

(assert (=> b!829005 (= res!564687 call!36024)))

(assert (=> b!829005 (=> (not res!564687) (not e!461988))))

(declare-fun b!829006 () Bool)

(declare-fun lt!375530 () Unit!28386)

(assert (=> b!829006 (= e!461981 lt!375530)))

(declare-fun lt!375537 () ListLongMap!8843)

(assert (=> b!829006 (= lt!375537 (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375544 () (_ BitVec 64))

(assert (=> b!829006 (= lt!375544 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375534 () (_ BitVec 64))

(assert (=> b!829006 (= lt!375534 (select (arr!22259 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375547 () Unit!28386)

(assert (=> b!829006 (= lt!375547 (addStillContains!316 lt!375537 lt!375544 zeroValueAfter!34 lt!375534))))

(assert (=> b!829006 (contains!4165 (+!1960 lt!375537 (tuple2!10019 lt!375544 zeroValueAfter!34)) lt!375534)))

(declare-fun lt!375541 () Unit!28386)

(assert (=> b!829006 (= lt!375541 lt!375547)))

(declare-fun lt!375536 () ListLongMap!8843)

(assert (=> b!829006 (= lt!375536 (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375539 () (_ BitVec 64))

(assert (=> b!829006 (= lt!375539 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375545 () (_ BitVec 64))

(assert (=> b!829006 (= lt!375545 (select (arr!22259 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375540 () Unit!28386)

(assert (=> b!829006 (= lt!375540 (addApplyDifferent!316 lt!375536 lt!375539 minValue!754 lt!375545))))

(assert (=> b!829006 (= (apply!365 (+!1960 lt!375536 (tuple2!10019 lt!375539 minValue!754)) lt!375545) (apply!365 lt!375536 lt!375545))))

(declare-fun lt!375535 () Unit!28386)

(assert (=> b!829006 (= lt!375535 lt!375540)))

(declare-fun lt!375543 () ListLongMap!8843)

(assert (=> b!829006 (= lt!375543 (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375531 () (_ BitVec 64))

(assert (=> b!829006 (= lt!375531 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375526 () (_ BitVec 64))

(assert (=> b!829006 (= lt!375526 (select (arr!22259 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375529 () Unit!28386)

(assert (=> b!829006 (= lt!375529 (addApplyDifferent!316 lt!375543 lt!375531 zeroValueAfter!34 lt!375526))))

(assert (=> b!829006 (= (apply!365 (+!1960 lt!375543 (tuple2!10019 lt!375531 zeroValueAfter!34)) lt!375526) (apply!365 lt!375543 lt!375526))))

(declare-fun lt!375533 () Unit!28386)

(assert (=> b!829006 (= lt!375533 lt!375529)))

(declare-fun lt!375532 () ListLongMap!8843)

(assert (=> b!829006 (= lt!375532 (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375538 () (_ BitVec 64))

(assert (=> b!829006 (= lt!375538 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375528 () (_ BitVec 64))

(assert (=> b!829006 (= lt!375528 (select (arr!22259 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829006 (= lt!375530 (addApplyDifferent!316 lt!375532 lt!375538 minValue!754 lt!375528))))

(assert (=> b!829006 (= (apply!365 (+!1960 lt!375532 (tuple2!10019 lt!375538 minValue!754)) lt!375528) (apply!365 lt!375532 lt!375528))))

(declare-fun b!829007 () Bool)

(declare-fun e!461986 () Bool)

(assert (=> b!829007 (= e!461986 (validKeyInArray!0 (select (arr!22259 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829008 () Bool)

(declare-fun e!461991 () ListLongMap!8843)

(assert (=> b!829008 (= e!461991 call!36025)))

(declare-fun b!829009 () Bool)

(assert (=> b!829009 (= e!461984 e!461991)))

(assert (=> b!829009 (= c!89841 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!36025 () Bool)

(assert (=> bm!36025 (= call!36028 (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829010 () Bool)

(declare-fun res!564681 () Bool)

(assert (=> b!829010 (=> (not res!564681) (not e!461980))))

(declare-fun e!461982 () Bool)

(assert (=> b!829010 (= res!564681 e!461982)))

(declare-fun res!564686 () Bool)

(assert (=> b!829010 (=> res!564686 e!461982)))

(declare-fun e!461989 () Bool)

(assert (=> b!829010 (= res!564686 (not e!461989))))

(declare-fun res!564680 () Bool)

(assert (=> b!829010 (=> (not res!564680) (not e!461989))))

(assert (=> b!829010 (= res!564680 (bvslt #b00000000000000000000000000000000 (size!22679 _keys!976)))))

(declare-fun b!829011 () Bool)

(assert (=> b!829011 (= e!461987 (= (apply!365 lt!375542 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun bm!36026 () Bool)

(assert (=> bm!36026 (= call!36027 call!36026)))

(declare-fun d!105469 () Bool)

(assert (=> d!105469 e!461980))

(declare-fun res!564684 () Bool)

(assert (=> d!105469 (=> (not res!564684) (not e!461980))))

(assert (=> d!105469 (= res!564684 (or (bvsge #b00000000000000000000000000000000 (size!22679 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22679 _keys!976)))))))

(declare-fun lt!375546 () ListLongMap!8843)

(assert (=> d!105469 (= lt!375542 lt!375546)))

(declare-fun lt!375527 () Unit!28386)

(assert (=> d!105469 (= lt!375527 e!461981)))

(declare-fun c!89842 () Bool)

(assert (=> d!105469 (= c!89842 e!461986)))

(declare-fun res!564688 () Bool)

(assert (=> d!105469 (=> (not res!564688) (not e!461986))))

(assert (=> d!105469 (= res!564688 (bvslt #b00000000000000000000000000000000 (size!22679 _keys!976)))))

(assert (=> d!105469 (= lt!375546 e!461984)))

(assert (=> d!105469 (= c!89844 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105469 (validMask!0 mask!1312)))

(assert (=> d!105469 (= (getCurrentListMap!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375542)))

(declare-fun b!829012 () Bool)

(declare-fun res!564682 () Bool)

(assert (=> b!829012 (=> (not res!564682) (not e!461980))))

(assert (=> b!829012 (= res!564682 e!461979)))

(declare-fun c!89843 () Bool)

(assert (=> b!829012 (= c!89843 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!829013 () Bool)

(assert (=> b!829013 (= e!461985 (not call!36024))))

(declare-fun b!829014 () Bool)

(assert (=> b!829014 (= e!461989 (validKeyInArray!0 (select (arr!22259 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829015 () Bool)

(declare-fun c!89845 () Bool)

(assert (=> b!829015 (= c!89845 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!829015 (= e!461991 e!461990)))

(declare-fun e!461983 () Bool)

(declare-fun b!829016 () Bool)

(assert (=> b!829016 (= e!461983 (= (apply!365 lt!375542 (select (arr!22259 _keys!976) #b00000000000000000000000000000000)) (get!11789 (select (arr!22260 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!829016 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22680 _values!788)))))

(assert (=> b!829016 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22679 _keys!976)))))

(declare-fun b!829017 () Bool)

(assert (=> b!829017 (= e!461982 e!461983)))

(declare-fun res!564683 () Bool)

(assert (=> b!829017 (=> (not res!564683) (not e!461983))))

(assert (=> b!829017 (= res!564683 (contains!4165 lt!375542 (select (arr!22259 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829017 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22679 _keys!976)))))

(declare-fun b!829018 () Bool)

(assert (=> b!829018 (= e!461979 (not call!36029))))

(assert (= (and d!105469 c!89844) b!829003))

(assert (= (and d!105469 (not c!89844)) b!829009))

(assert (= (and b!829009 c!89841) b!829008))

(assert (= (and b!829009 (not c!89841)) b!829015))

(assert (= (and b!829015 c!89845) b!829004))

(assert (= (and b!829015 (not c!89845)) b!829001))

(assert (= (or b!829004 b!829001) bm!36026))

(assert (= (or b!829008 bm!36026) bm!36022))

(assert (= (or b!829008 b!829004) bm!36023))

(assert (= (or b!829003 bm!36022) bm!36025))

(assert (= (or b!829003 bm!36023) bm!36020))

(assert (= (and d!105469 res!564688) b!829007))

(assert (= (and d!105469 c!89842) b!829006))

(assert (= (and d!105469 (not c!89842)) b!829000))

(assert (= (and d!105469 res!564684) b!829010))

(assert (= (and b!829010 res!564680) b!829014))

(assert (= (and b!829010 (not res!564686)) b!829017))

(assert (= (and b!829017 res!564683) b!829016))

(assert (= (and b!829010 res!564681) b!829012))

(assert (= (and b!829012 c!89843) b!829002))

(assert (= (and b!829012 (not c!89843)) b!829018))

(assert (= (and b!829002 res!564685) b!829011))

(assert (= (or b!829002 b!829018) bm!36021))

(assert (= (and b!829012 res!564682) b!828999))

(assert (= (and b!828999 c!89840) b!829005))

(assert (= (and b!828999 (not c!89840)) b!829013))

(assert (= (and b!829005 res!564687) b!828998))

(assert (= (or b!829005 b!829013) bm!36024))

(declare-fun b_lambda!11195 () Bool)

(assert (=> (not b_lambda!11195) (not b!829016)))

(assert (=> b!829016 t!22141))

(declare-fun b_and!22387 () Bool)

(assert (= b_and!22385 (and (=> t!22141 result!7965) b_and!22387)))

(assert (=> b!829007 m!772293))

(assert (=> b!829007 m!772293))

(assert (=> b!829007 m!772295))

(declare-fun m!772349 () Bool)

(assert (=> b!829006 m!772349))

(declare-fun m!772351 () Bool)

(assert (=> b!829006 m!772351))

(declare-fun m!772353 () Bool)

(assert (=> b!829006 m!772353))

(assert (=> b!829006 m!772293))

(declare-fun m!772355 () Bool)

(assert (=> b!829006 m!772355))

(declare-fun m!772357 () Bool)

(assert (=> b!829006 m!772357))

(declare-fun m!772359 () Bool)

(assert (=> b!829006 m!772359))

(declare-fun m!772361 () Bool)

(assert (=> b!829006 m!772361))

(declare-fun m!772363 () Bool)

(assert (=> b!829006 m!772363))

(declare-fun m!772365 () Bool)

(assert (=> b!829006 m!772365))

(assert (=> b!829006 m!772361))

(declare-fun m!772367 () Bool)

(assert (=> b!829006 m!772367))

(declare-fun m!772369 () Bool)

(assert (=> b!829006 m!772369))

(assert (=> b!829006 m!772369))

(declare-fun m!772371 () Bool)

(assert (=> b!829006 m!772371))

(assert (=> b!829006 m!772365))

(declare-fun m!772373 () Bool)

(assert (=> b!829006 m!772373))

(assert (=> b!829006 m!772221))

(declare-fun m!772375 () Bool)

(assert (=> b!829006 m!772375))

(assert (=> b!829006 m!772357))

(declare-fun m!772377 () Bool)

(assert (=> b!829006 m!772377))

(declare-fun m!772379 () Bool)

(assert (=> bm!36020 m!772379))

(declare-fun m!772381 () Bool)

(assert (=> bm!36024 m!772381))

(declare-fun m!772383 () Bool)

(assert (=> bm!36021 m!772383))

(declare-fun m!772385 () Bool)

(assert (=> b!828998 m!772385))

(assert (=> d!105469 m!772227))

(declare-fun m!772387 () Bool)

(assert (=> b!829003 m!772387))

(assert (=> b!829014 m!772293))

(assert (=> b!829014 m!772293))

(assert (=> b!829014 m!772295))

(declare-fun m!772389 () Bool)

(assert (=> b!829011 m!772389))

(assert (=> bm!36025 m!772221))

(assert (=> b!829017 m!772293))

(assert (=> b!829017 m!772293))

(declare-fun m!772391 () Bool)

(assert (=> b!829017 m!772391))

(assert (=> b!829016 m!772341))

(assert (=> b!829016 m!772343))

(assert (=> b!829016 m!772345))

(assert (=> b!829016 m!772293))

(declare-fun m!772393 () Bool)

(assert (=> b!829016 m!772393))

(assert (=> b!829016 m!772293))

(assert (=> b!829016 m!772343))

(assert (=> b!829016 m!772341))

(assert (=> b!828871 d!105469))

(declare-fun bm!36029 () Bool)

(declare-fun call!36032 () Bool)

(declare-fun c!89848 () Bool)

(assert (=> bm!36029 (= call!36032 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89848 (Cons!15792 (select (arr!22259 _keys!976) #b00000000000000000000000000000000) Nil!15793) Nil!15793)))))

(declare-fun b!829029 () Bool)

(declare-fun e!462002 () Bool)

(declare-fun e!462003 () Bool)

(assert (=> b!829029 (= e!462002 e!462003)))

(declare-fun res!564697 () Bool)

(assert (=> b!829029 (=> (not res!564697) (not e!462003))))

(declare-fun e!462001 () Bool)

(assert (=> b!829029 (= res!564697 (not e!462001))))

(declare-fun res!564696 () Bool)

(assert (=> b!829029 (=> (not res!564696) (not e!462001))))

(assert (=> b!829029 (= res!564696 (validKeyInArray!0 (select (arr!22259 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829030 () Bool)

(declare-fun e!462000 () Bool)

(assert (=> b!829030 (= e!462003 e!462000)))

(assert (=> b!829030 (= c!89848 (validKeyInArray!0 (select (arr!22259 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105471 () Bool)

(declare-fun res!564695 () Bool)

(assert (=> d!105471 (=> res!564695 e!462002)))

(assert (=> d!105471 (= res!564695 (bvsge #b00000000000000000000000000000000 (size!22679 _keys!976)))))

(assert (=> d!105471 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15793) e!462002)))

(declare-fun b!829031 () Bool)

(assert (=> b!829031 (= e!462000 call!36032)))

(declare-fun b!829032 () Bool)

(declare-fun contains!4167 (List!15796 (_ BitVec 64)) Bool)

(assert (=> b!829032 (= e!462001 (contains!4167 Nil!15793 (select (arr!22259 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829033 () Bool)

(assert (=> b!829033 (= e!462000 call!36032)))

(assert (= (and d!105471 (not res!564695)) b!829029))

(assert (= (and b!829029 res!564696) b!829032))

(assert (= (and b!829029 res!564697) b!829030))

(assert (= (and b!829030 c!89848) b!829031))

(assert (= (and b!829030 (not c!89848)) b!829033))

(assert (= (or b!829031 b!829033) bm!36029))

(assert (=> bm!36029 m!772293))

(declare-fun m!772395 () Bool)

(assert (=> bm!36029 m!772395))

(assert (=> b!829029 m!772293))

(assert (=> b!829029 m!772293))

(assert (=> b!829029 m!772295))

(assert (=> b!829030 m!772293))

(assert (=> b!829030 m!772293))

(assert (=> b!829030 m!772295))

(assert (=> b!829032 m!772293))

(assert (=> b!829032 m!772293))

(declare-fun m!772397 () Bool)

(assert (=> b!829032 m!772397))

(assert (=> b!828878 d!105471))

(declare-fun b!829042 () Bool)

(declare-fun e!462012 () Bool)

(declare-fun call!36035 () Bool)

(assert (=> b!829042 (= e!462012 call!36035)))

(declare-fun bm!36032 () Bool)

(assert (=> bm!36032 (= call!36035 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!829043 () Bool)

(declare-fun e!462010 () Bool)

(assert (=> b!829043 (= e!462010 e!462012)))

(declare-fun lt!375555 () (_ BitVec 64))

(assert (=> b!829043 (= lt!375555 (select (arr!22259 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375554 () Unit!28386)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46441 (_ BitVec 64) (_ BitVec 32)) Unit!28386)

(assert (=> b!829043 (= lt!375554 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!375555 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!829043 (arrayContainsKey!0 _keys!976 lt!375555 #b00000000000000000000000000000000)))

(declare-fun lt!375556 () Unit!28386)

(assert (=> b!829043 (= lt!375556 lt!375554)))

(declare-fun res!564702 () Bool)

(declare-datatypes ((SeekEntryResult!8688 0))(
  ( (MissingZero!8688 (index!37123 (_ BitVec 32))) (Found!8688 (index!37124 (_ BitVec 32))) (Intermediate!8688 (undefined!9500 Bool) (index!37125 (_ BitVec 32)) (x!69894 (_ BitVec 32))) (Undefined!8688) (MissingVacant!8688 (index!37126 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46441 (_ BitVec 32)) SeekEntryResult!8688)

(assert (=> b!829043 (= res!564702 (= (seekEntryOrOpen!0 (select (arr!22259 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8688 #b00000000000000000000000000000000)))))

(assert (=> b!829043 (=> (not res!564702) (not e!462012))))

(declare-fun d!105473 () Bool)

(declare-fun res!564703 () Bool)

(declare-fun e!462011 () Bool)

(assert (=> d!105473 (=> res!564703 e!462011)))

(assert (=> d!105473 (= res!564703 (bvsge #b00000000000000000000000000000000 (size!22679 _keys!976)))))

(assert (=> d!105473 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!462011)))

(declare-fun b!829044 () Bool)

(assert (=> b!829044 (= e!462010 call!36035)))

(declare-fun b!829045 () Bool)

(assert (=> b!829045 (= e!462011 e!462010)))

(declare-fun c!89851 () Bool)

(assert (=> b!829045 (= c!89851 (validKeyInArray!0 (select (arr!22259 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105473 (not res!564703)) b!829045))

(assert (= (and b!829045 c!89851) b!829043))

(assert (= (and b!829045 (not c!89851)) b!829044))

(assert (= (and b!829043 res!564702) b!829042))

(assert (= (or b!829042 b!829044) bm!36032))

(declare-fun m!772399 () Bool)

(assert (=> bm!36032 m!772399))

(assert (=> b!829043 m!772293))

(declare-fun m!772401 () Bool)

(assert (=> b!829043 m!772401))

(declare-fun m!772403 () Bool)

(assert (=> b!829043 m!772403))

(assert (=> b!829043 m!772293))

(declare-fun m!772405 () Bool)

(assert (=> b!829043 m!772405))

(assert (=> b!829045 m!772293))

(assert (=> b!829045 m!772293))

(assert (=> b!829045 m!772295))

(assert (=> b!828873 d!105473))

(declare-fun d!105475 () Bool)

(assert (=> d!105475 (= (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375559 () Unit!28386)

(declare-fun choose!1415 (array!46441 array!46443 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25179 V!25179 V!25179 V!25179 (_ BitVec 32) Int) Unit!28386)

(assert (=> d!105475 (= lt!375559 (choose!1415 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105475 (validMask!0 mask!1312)))

(assert (=> d!105475 (= (lemmaNoChangeToArrayThenSameMapNoExtras!581 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375559)))

(declare-fun bs!23155 () Bool)

(assert (= bs!23155 d!105475))

(assert (=> bs!23155 m!772223))

(assert (=> bs!23155 m!772221))

(declare-fun m!772407 () Bool)

(assert (=> bs!23155 m!772407))

(assert (=> bs!23155 m!772227))

(assert (=> b!828877 d!105475))

(declare-fun b!829071 () Bool)

(declare-fun e!462030 () Bool)

(declare-fun e!462029 () Bool)

(assert (=> b!829071 (= e!462030 e!462029)))

(assert (=> b!829071 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22679 _keys!976)))))

(declare-fun res!564715 () Bool)

(declare-fun lt!375580 () ListLongMap!8843)

(assert (=> b!829071 (= res!564715 (contains!4165 lt!375580 (select (arr!22259 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829071 (=> (not res!564715) (not e!462029))))

(declare-fun b!829072 () Bool)

(declare-fun e!462028 () Bool)

(assert (=> b!829072 (= e!462030 e!462028)))

(declare-fun c!89861 () Bool)

(assert (=> b!829072 (= c!89861 (bvslt #b00000000000000000000000000000000 (size!22679 _keys!976)))))

(declare-fun b!829073 () Bool)

(declare-fun isEmpty!653 (ListLongMap!8843) Bool)

(assert (=> b!829073 (= e!462028 (isEmpty!653 lt!375580))))

(declare-fun b!829074 () Bool)

(assert (=> b!829074 (= e!462028 (= lt!375580 (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!829075 () Bool)

(declare-fun e!462027 () Bool)

(assert (=> b!829075 (= e!462027 e!462030)))

(declare-fun c!89863 () Bool)

(declare-fun e!462031 () Bool)

(assert (=> b!829075 (= c!89863 e!462031)))

(declare-fun res!564714 () Bool)

(assert (=> b!829075 (=> (not res!564714) (not e!462031))))

(assert (=> b!829075 (= res!564714 (bvslt #b00000000000000000000000000000000 (size!22679 _keys!976)))))

(declare-fun b!829076 () Bool)

(assert (=> b!829076 (= e!462031 (validKeyInArray!0 (select (arr!22259 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829076 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!829077 () Bool)

(assert (=> b!829077 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22679 _keys!976)))))

(assert (=> b!829077 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22680 _values!788)))))

(assert (=> b!829077 (= e!462029 (= (apply!365 lt!375580 (select (arr!22259 _keys!976) #b00000000000000000000000000000000)) (get!11789 (select (arr!22260 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!829078 () Bool)

(declare-fun e!462032 () ListLongMap!8843)

(assert (=> b!829078 (= e!462032 (ListLongMap!8844 Nil!15792))))

(declare-fun b!829079 () Bool)

(declare-fun e!462033 () ListLongMap!8843)

(declare-fun call!36038 () ListLongMap!8843)

(assert (=> b!829079 (= e!462033 call!36038)))

(declare-fun b!829080 () Bool)

(assert (=> b!829080 (= e!462032 e!462033)))

(declare-fun c!89862 () Bool)

(assert (=> b!829080 (= c!89862 (validKeyInArray!0 (select (arr!22259 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829070 () Bool)

(declare-fun lt!375576 () Unit!28386)

(declare-fun lt!375574 () Unit!28386)

(assert (=> b!829070 (= lt!375576 lt!375574)))

(declare-fun lt!375575 () V!25179)

(declare-fun lt!375577 () (_ BitVec 64))

(declare-fun lt!375578 () (_ BitVec 64))

(declare-fun lt!375579 () ListLongMap!8843)

(assert (=> b!829070 (not (contains!4165 (+!1960 lt!375579 (tuple2!10019 lt!375577 lt!375575)) lt!375578))))

(declare-fun addStillNotContains!192 (ListLongMap!8843 (_ BitVec 64) V!25179 (_ BitVec 64)) Unit!28386)

(assert (=> b!829070 (= lt!375574 (addStillNotContains!192 lt!375579 lt!375577 lt!375575 lt!375578))))

(assert (=> b!829070 (= lt!375578 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!829070 (= lt!375575 (get!11789 (select (arr!22260 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!829070 (= lt!375577 (select (arr!22259 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829070 (= lt!375579 call!36038)))

(assert (=> b!829070 (= e!462033 (+!1960 call!36038 (tuple2!10019 (select (arr!22259 _keys!976) #b00000000000000000000000000000000) (get!11789 (select (arr!22260 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!105477 () Bool)

(assert (=> d!105477 e!462027))

(declare-fun res!564713 () Bool)

(assert (=> d!105477 (=> (not res!564713) (not e!462027))))

(assert (=> d!105477 (= res!564713 (not (contains!4165 lt!375580 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105477 (= lt!375580 e!462032)))

(declare-fun c!89860 () Bool)

(assert (=> d!105477 (= c!89860 (bvsge #b00000000000000000000000000000000 (size!22679 _keys!976)))))

(assert (=> d!105477 (validMask!0 mask!1312)))

(assert (=> d!105477 (= (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375580)))

(declare-fun b!829081 () Bool)

(declare-fun res!564712 () Bool)

(assert (=> b!829081 (=> (not res!564712) (not e!462027))))

(assert (=> b!829081 (= res!564712 (not (contains!4165 lt!375580 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!36035 () Bool)

(assert (=> bm!36035 (= call!36038 (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(assert (= (and d!105477 c!89860) b!829078))

(assert (= (and d!105477 (not c!89860)) b!829080))

(assert (= (and b!829080 c!89862) b!829070))

(assert (= (and b!829080 (not c!89862)) b!829079))

(assert (= (or b!829070 b!829079) bm!36035))

(assert (= (and d!105477 res!564713) b!829081))

(assert (= (and b!829081 res!564712) b!829075))

(assert (= (and b!829075 res!564714) b!829076))

(assert (= (and b!829075 c!89863) b!829071))

(assert (= (and b!829075 (not c!89863)) b!829072))

(assert (= (and b!829071 res!564715) b!829077))

(assert (= (and b!829072 c!89861) b!829074))

(assert (= (and b!829072 (not c!89861)) b!829073))

(declare-fun b_lambda!11197 () Bool)

(assert (=> (not b_lambda!11197) (not b!829077)))

(assert (=> b!829077 t!22141))

(declare-fun b_and!22389 () Bool)

(assert (= b_and!22387 (and (=> t!22141 result!7965) b_and!22389)))

(declare-fun b_lambda!11199 () Bool)

(assert (=> (not b_lambda!11199) (not b!829070)))

(assert (=> b!829070 t!22141))

(declare-fun b_and!22391 () Bool)

(assert (= b_and!22389 (and (=> t!22141 result!7965) b_and!22391)))

(declare-fun m!772409 () Bool)

(assert (=> b!829074 m!772409))

(assert (=> b!829080 m!772293))

(assert (=> b!829080 m!772293))

(assert (=> b!829080 m!772295))

(assert (=> b!829071 m!772293))

(assert (=> b!829071 m!772293))

(declare-fun m!772411 () Bool)

(assert (=> b!829071 m!772411))

(declare-fun m!772413 () Bool)

(assert (=> b!829073 m!772413))

(declare-fun m!772415 () Bool)

(assert (=> d!105477 m!772415))

(assert (=> d!105477 m!772227))

(assert (=> b!829076 m!772293))

(assert (=> b!829076 m!772293))

(assert (=> b!829076 m!772295))

(assert (=> b!829077 m!772293))

(assert (=> b!829077 m!772293))

(declare-fun m!772417 () Bool)

(assert (=> b!829077 m!772417))

(assert (=> b!829077 m!772341))

(assert (=> b!829077 m!772343))

(assert (=> b!829077 m!772345))

(assert (=> b!829077 m!772341))

(assert (=> b!829077 m!772343))

(assert (=> b!829070 m!772341))

(assert (=> b!829070 m!772343))

(assert (=> b!829070 m!772345))

(declare-fun m!772419 () Bool)

(assert (=> b!829070 m!772419))

(declare-fun m!772421 () Bool)

(assert (=> b!829070 m!772421))

(assert (=> b!829070 m!772419))

(declare-fun m!772423 () Bool)

(assert (=> b!829070 m!772423))

(assert (=> b!829070 m!772293))

(declare-fun m!772425 () Bool)

(assert (=> b!829070 m!772425))

(assert (=> b!829070 m!772341))

(assert (=> b!829070 m!772343))

(declare-fun m!772427 () Bool)

(assert (=> b!829081 m!772427))

(assert (=> bm!36035 m!772409))

(assert (=> b!828877 d!105477))

(declare-fun b!829083 () Bool)

(declare-fun e!462037 () Bool)

(declare-fun e!462036 () Bool)

(assert (=> b!829083 (= e!462037 e!462036)))

(assert (=> b!829083 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22679 _keys!976)))))

(declare-fun res!564719 () Bool)

(declare-fun lt!375587 () ListLongMap!8843)

(assert (=> b!829083 (= res!564719 (contains!4165 lt!375587 (select (arr!22259 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829083 (=> (not res!564719) (not e!462036))))

(declare-fun b!829084 () Bool)

(declare-fun e!462035 () Bool)

(assert (=> b!829084 (= e!462037 e!462035)))

(declare-fun c!89865 () Bool)

(assert (=> b!829084 (= c!89865 (bvslt #b00000000000000000000000000000000 (size!22679 _keys!976)))))

(declare-fun b!829085 () Bool)

(assert (=> b!829085 (= e!462035 (isEmpty!653 lt!375587))))

(declare-fun b!829086 () Bool)

(assert (=> b!829086 (= e!462035 (= lt!375587 (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!829087 () Bool)

(declare-fun e!462034 () Bool)

(assert (=> b!829087 (= e!462034 e!462037)))

(declare-fun c!89867 () Bool)

(declare-fun e!462038 () Bool)

(assert (=> b!829087 (= c!89867 e!462038)))

(declare-fun res!564718 () Bool)

(assert (=> b!829087 (=> (not res!564718) (not e!462038))))

(assert (=> b!829087 (= res!564718 (bvslt #b00000000000000000000000000000000 (size!22679 _keys!976)))))

(declare-fun b!829088 () Bool)

(assert (=> b!829088 (= e!462038 (validKeyInArray!0 (select (arr!22259 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829088 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!829089 () Bool)

(assert (=> b!829089 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22679 _keys!976)))))

(assert (=> b!829089 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22680 _values!788)))))

(assert (=> b!829089 (= e!462036 (= (apply!365 lt!375587 (select (arr!22259 _keys!976) #b00000000000000000000000000000000)) (get!11789 (select (arr!22260 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!829090 () Bool)

(declare-fun e!462039 () ListLongMap!8843)

(assert (=> b!829090 (= e!462039 (ListLongMap!8844 Nil!15792))))

(declare-fun b!829091 () Bool)

(declare-fun e!462040 () ListLongMap!8843)

(declare-fun call!36039 () ListLongMap!8843)

(assert (=> b!829091 (= e!462040 call!36039)))

(declare-fun b!829092 () Bool)

(assert (=> b!829092 (= e!462039 e!462040)))

(declare-fun c!89866 () Bool)

(assert (=> b!829092 (= c!89866 (validKeyInArray!0 (select (arr!22259 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829082 () Bool)

(declare-fun lt!375583 () Unit!28386)

(declare-fun lt!375581 () Unit!28386)

(assert (=> b!829082 (= lt!375583 lt!375581)))

(declare-fun lt!375585 () (_ BitVec 64))

(declare-fun lt!375584 () (_ BitVec 64))

(declare-fun lt!375582 () V!25179)

(declare-fun lt!375586 () ListLongMap!8843)

(assert (=> b!829082 (not (contains!4165 (+!1960 lt!375586 (tuple2!10019 lt!375584 lt!375582)) lt!375585))))

(assert (=> b!829082 (= lt!375581 (addStillNotContains!192 lt!375586 lt!375584 lt!375582 lt!375585))))

(assert (=> b!829082 (= lt!375585 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!829082 (= lt!375582 (get!11789 (select (arr!22260 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!829082 (= lt!375584 (select (arr!22259 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829082 (= lt!375586 call!36039)))

(assert (=> b!829082 (= e!462040 (+!1960 call!36039 (tuple2!10019 (select (arr!22259 _keys!976) #b00000000000000000000000000000000) (get!11789 (select (arr!22260 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!105479 () Bool)

(assert (=> d!105479 e!462034))

(declare-fun res!564717 () Bool)

(assert (=> d!105479 (=> (not res!564717) (not e!462034))))

(assert (=> d!105479 (= res!564717 (not (contains!4165 lt!375587 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105479 (= lt!375587 e!462039)))

(declare-fun c!89864 () Bool)

(assert (=> d!105479 (= c!89864 (bvsge #b00000000000000000000000000000000 (size!22679 _keys!976)))))

(assert (=> d!105479 (validMask!0 mask!1312)))

(assert (=> d!105479 (= (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375587)))

(declare-fun b!829093 () Bool)

(declare-fun res!564716 () Bool)

(assert (=> b!829093 (=> (not res!564716) (not e!462034))))

(assert (=> b!829093 (= res!564716 (not (contains!4165 lt!375587 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!36036 () Bool)

(assert (=> bm!36036 (= call!36039 (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(assert (= (and d!105479 c!89864) b!829090))

(assert (= (and d!105479 (not c!89864)) b!829092))

(assert (= (and b!829092 c!89866) b!829082))

(assert (= (and b!829092 (not c!89866)) b!829091))

(assert (= (or b!829082 b!829091) bm!36036))

(assert (= (and d!105479 res!564717) b!829093))

(assert (= (and b!829093 res!564716) b!829087))

(assert (= (and b!829087 res!564718) b!829088))

(assert (= (and b!829087 c!89867) b!829083))

(assert (= (and b!829087 (not c!89867)) b!829084))

(assert (= (and b!829083 res!564719) b!829089))

(assert (= (and b!829084 c!89865) b!829086))

(assert (= (and b!829084 (not c!89865)) b!829085))

(declare-fun b_lambda!11201 () Bool)

(assert (=> (not b_lambda!11201) (not b!829089)))

(assert (=> b!829089 t!22141))

(declare-fun b_and!22393 () Bool)

(assert (= b_and!22391 (and (=> t!22141 result!7965) b_and!22393)))

(declare-fun b_lambda!11203 () Bool)

(assert (=> (not b_lambda!11203) (not b!829082)))

(assert (=> b!829082 t!22141))

(declare-fun b_and!22395 () Bool)

(assert (= b_and!22393 (and (=> t!22141 result!7965) b_and!22395)))

(declare-fun m!772429 () Bool)

(assert (=> b!829086 m!772429))

(assert (=> b!829092 m!772293))

(assert (=> b!829092 m!772293))

(assert (=> b!829092 m!772295))

(assert (=> b!829083 m!772293))

(assert (=> b!829083 m!772293))

(declare-fun m!772431 () Bool)

(assert (=> b!829083 m!772431))

(declare-fun m!772433 () Bool)

(assert (=> b!829085 m!772433))

(declare-fun m!772435 () Bool)

(assert (=> d!105479 m!772435))

(assert (=> d!105479 m!772227))

(assert (=> b!829088 m!772293))

(assert (=> b!829088 m!772293))

(assert (=> b!829088 m!772295))

(assert (=> b!829089 m!772293))

(assert (=> b!829089 m!772293))

(declare-fun m!772437 () Bool)

(assert (=> b!829089 m!772437))

(assert (=> b!829089 m!772341))

(assert (=> b!829089 m!772343))

(assert (=> b!829089 m!772345))

(assert (=> b!829089 m!772341))

(assert (=> b!829089 m!772343))

(assert (=> b!829082 m!772341))

(assert (=> b!829082 m!772343))

(assert (=> b!829082 m!772345))

(declare-fun m!772439 () Bool)

(assert (=> b!829082 m!772439))

(declare-fun m!772441 () Bool)

(assert (=> b!829082 m!772441))

(assert (=> b!829082 m!772439))

(declare-fun m!772443 () Bool)

(assert (=> b!829082 m!772443))

(assert (=> b!829082 m!772293))

(declare-fun m!772445 () Bool)

(assert (=> b!829082 m!772445))

(assert (=> b!829082 m!772341))

(assert (=> b!829082 m!772343))

(declare-fun m!772447 () Bool)

(assert (=> b!829093 m!772447))

(assert (=> bm!36036 m!772429))

(assert (=> b!828877 d!105479))

(declare-fun d!105481 () Bool)

(assert (=> d!105481 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71454 d!105481))

(declare-fun d!105483 () Bool)

(assert (=> d!105483 (= (array_inv!17779 _keys!976) (bvsge (size!22679 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71454 d!105483))

(declare-fun d!105485 () Bool)

(assert (=> d!105485 (= (array_inv!17780 _values!788) (bvsge (size!22680 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71454 d!105485))

(declare-fun mapNonEmpty!24340 () Bool)

(declare-fun mapRes!24340 () Bool)

(declare-fun tp!47050 () Bool)

(declare-fun e!462045 () Bool)

(assert (=> mapNonEmpty!24340 (= mapRes!24340 (and tp!47050 e!462045))))

(declare-fun mapKey!24340 () (_ BitVec 32))

(declare-fun mapRest!24340 () (Array (_ BitVec 32) ValueCell!7151))

(declare-fun mapValue!24340 () ValueCell!7151)

(assert (=> mapNonEmpty!24340 (= mapRest!24331 (store mapRest!24340 mapKey!24340 mapValue!24340))))

(declare-fun condMapEmpty!24340 () Bool)

(declare-fun mapDefault!24340 () ValueCell!7151)

(assert (=> mapNonEmpty!24331 (= condMapEmpty!24340 (= mapRest!24331 ((as const (Array (_ BitVec 32) ValueCell!7151)) mapDefault!24340)))))

(declare-fun e!462046 () Bool)

(assert (=> mapNonEmpty!24331 (= tp!47034 (and e!462046 mapRes!24340))))

(declare-fun b!829100 () Bool)

(assert (=> b!829100 (= e!462045 tp_is_empty!15133)))

(declare-fun b!829101 () Bool)

(assert (=> b!829101 (= e!462046 tp_is_empty!15133)))

(declare-fun mapIsEmpty!24340 () Bool)

(assert (=> mapIsEmpty!24340 mapRes!24340))

(assert (= (and mapNonEmpty!24331 condMapEmpty!24340) mapIsEmpty!24340))

(assert (= (and mapNonEmpty!24331 (not condMapEmpty!24340)) mapNonEmpty!24340))

(assert (= (and mapNonEmpty!24340 ((_ is ValueCellFull!7151) mapValue!24340)) b!829100))

(assert (= (and mapNonEmpty!24331 ((_ is ValueCellFull!7151) mapDefault!24340)) b!829101))

(declare-fun m!772449 () Bool)

(assert (=> mapNonEmpty!24340 m!772449))

(declare-fun b_lambda!11205 () Bool)

(assert (= b_lambda!11195 (or (and start!71454 b_free!13423) b_lambda!11205)))

(declare-fun b_lambda!11207 () Bool)

(assert (= b_lambda!11193 (or (and start!71454 b_free!13423) b_lambda!11207)))

(declare-fun b_lambda!11209 () Bool)

(assert (= b_lambda!11203 (or (and start!71454 b_free!13423) b_lambda!11209)))

(declare-fun b_lambda!11211 () Bool)

(assert (= b_lambda!11201 (or (and start!71454 b_free!13423) b_lambda!11211)))

(declare-fun b_lambda!11213 () Bool)

(assert (= b_lambda!11197 (or (and start!71454 b_free!13423) b_lambda!11213)))

(declare-fun b_lambda!11215 () Bool)

(assert (= b_lambda!11199 (or (and start!71454 b_free!13423) b_lambda!11215)))

(check-sat (not b!828988) (not b!829081) (not d!105479) (not bm!36032) (not bm!36035) (not b!829089) (not b_next!13423) (not b!829043) (not b!829074) (not b!829030) (not mapNonEmpty!24340) b_and!22395 (not b!828931) (not b!829011) (not bm!36014) (not bm!36025) (not d!105469) (not b!828994) (not b!828975) (not b!828983) (not bm!36036) (not b_lambda!11207) (not b!828932) (not b!829045) (not b!829073) (not b!828991) (not b!829088) (not d!105477) (not b!829029) (not bm!36020) (not b!829093) (not b!829082) (not bm!36017) (not b!828980) (not b!829017) (not bm!36013) (not b!829083) (not b!829014) (not b!828993) (not bm!36018) (not bm!36021) (not d!105475) (not b_lambda!11211) (not d!105465) (not b_lambda!11215) (not b!829086) tp_is_empty!15133 (not b!829077) (not b!828998) (not b_lambda!11209) (not b!829032) (not b!829080) (not d!105467) (not b_lambda!11213) (not b!829085) (not b!829070) (not b!829003) (not b!828984) (not b_lambda!11205) (not b!829076) (not bm!36024) (not b!829007) (not b!829016) (not b!829006) (not b!829071) (not bm!36029) (not b!829092))
(check-sat b_and!22395 (not b_next!13423))
