; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70872 () Bool)

(assert start!70872)

(declare-fun b_free!13129 () Bool)

(declare-fun b_next!13129 () Bool)

(assert (=> start!70872 (= b_free!13129 (not b_next!13129))))

(declare-fun tp!46134 () Bool)

(declare-fun b_and!21987 () Bool)

(assert (=> start!70872 (= tp!46134 b_and!21987)))

(declare-fun b!823157 () Bool)

(declare-fun res!561414 () Bool)

(declare-fun e!457812 () Bool)

(assert (=> b!823157 (=> (not res!561414) (not e!457812))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24787 0))(
  ( (V!24788 (val!7467 Int)) )
))
(declare-datatypes ((ValueCell!7004 0))(
  ( (ValueCellFull!7004 (v!9893 V!24787)) (EmptyCell!7004) )
))
(declare-datatypes ((array!45837 0))(
  ( (array!45838 (arr!21968 (Array (_ BitVec 32) ValueCell!7004)) (size!22389 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45837)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((array!45839 0))(
  ( (array!45840 (arr!21969 (Array (_ BitVec 32) (_ BitVec 64))) (size!22390 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45839)

(assert (=> b!823157 (= res!561414 (and (= (size!22389 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22390 _keys!976) (size!22389 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823158 () Bool)

(declare-fun res!561417 () Bool)

(assert (=> b!823158 (=> (not res!561417) (not e!457812))))

(declare-datatypes ((List!15679 0))(
  ( (Nil!15676) (Cons!15675 (h!16804 (_ BitVec 64)) (t!22009 List!15679)) )
))
(declare-fun arrayNoDuplicates!0 (array!45839 (_ BitVec 32) List!15679) Bool)

(assert (=> b!823158 (= res!561417 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15676))))

(declare-fun b!823159 () Bool)

(declare-fun e!457810 () Bool)

(assert (=> b!823159 (= e!457812 (not e!457810))))

(declare-fun res!561415 () Bool)

(assert (=> b!823159 (=> res!561415 e!457810)))

(assert (=> b!823159 (= res!561415 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9874 0))(
  ( (tuple2!9875 (_1!4948 (_ BitVec 64)) (_2!4948 V!24787)) )
))
(declare-datatypes ((List!15680 0))(
  ( (Nil!15677) (Cons!15676 (h!16805 tuple2!9874) (t!22010 List!15680)) )
))
(declare-datatypes ((ListLongMap!8687 0))(
  ( (ListLongMap!8688 (toList!4359 List!15680)) )
))
(declare-fun lt!371001 () ListLongMap!8687)

(declare-fun lt!371008 () ListLongMap!8687)

(assert (=> b!823159 (= lt!371001 lt!371008)))

(declare-fun zeroValueBefore!34 () V!24787)

(declare-fun zeroValueAfter!34 () V!24787)

(declare-fun minValue!754 () V!24787)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28140 0))(
  ( (Unit!28141) )
))
(declare-fun lt!371006 () Unit!28140)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!496 (array!45839 array!45837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24787 V!24787 V!24787 V!24787 (_ BitVec 32) Int) Unit!28140)

(assert (=> b!823159 (= lt!371006 (lemmaNoChangeToArrayThenSameMapNoExtras!496 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2403 (array!45839 array!45837 (_ BitVec 32) (_ BitVec 32) V!24787 V!24787 (_ BitVec 32) Int) ListLongMap!8687)

(assert (=> b!823159 (= lt!371008 (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823159 (= lt!371001 (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823160 () Bool)

(declare-fun e!457814 () Bool)

(declare-fun e!457811 () Bool)

(declare-fun mapRes!23872 () Bool)

(assert (=> b!823160 (= e!457814 (and e!457811 mapRes!23872))))

(declare-fun condMapEmpty!23872 () Bool)

(declare-fun mapDefault!23872 () ValueCell!7004)

(assert (=> b!823160 (= condMapEmpty!23872 (= (arr!21968 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7004)) mapDefault!23872)))))

(declare-fun res!561413 () Bool)

(assert (=> start!70872 (=> (not res!561413) (not e!457812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70872 (= res!561413 (validMask!0 mask!1312))))

(assert (=> start!70872 e!457812))

(declare-fun tp_is_empty!14839 () Bool)

(assert (=> start!70872 tp_is_empty!14839))

(declare-fun array_inv!17601 (array!45839) Bool)

(assert (=> start!70872 (array_inv!17601 _keys!976)))

(assert (=> start!70872 true))

(declare-fun array_inv!17602 (array!45837) Bool)

(assert (=> start!70872 (and (array_inv!17602 _values!788) e!457814)))

(assert (=> start!70872 tp!46134))

(declare-fun b!823161 () Bool)

(declare-fun res!561416 () Bool)

(assert (=> b!823161 (=> (not res!561416) (not e!457812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45839 (_ BitVec 32)) Bool)

(assert (=> b!823161 (= res!561416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823162 () Bool)

(assert (=> b!823162 (= e!457810 (bvsle #b00000000000000000000000000000000 (size!22390 _keys!976)))))

(declare-fun lt!371004 () ListLongMap!8687)

(declare-fun lt!371009 () ListLongMap!8687)

(declare-fun lt!371007 () tuple2!9874)

(declare-fun +!1934 (ListLongMap!8687 tuple2!9874) ListLongMap!8687)

(assert (=> b!823162 (= lt!371004 (+!1934 lt!371009 lt!371007))))

(declare-fun lt!371003 () Unit!28140)

(declare-fun addCommutativeForDiffKeys!465 (ListLongMap!8687 (_ BitVec 64) V!24787 (_ BitVec 64) V!24787) Unit!28140)

(assert (=> b!823162 (= lt!371003 (addCommutativeForDiffKeys!465 lt!371001 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!371000 () ListLongMap!8687)

(assert (=> b!823162 (= lt!371000 lt!371004)))

(declare-fun lt!371005 () tuple2!9874)

(assert (=> b!823162 (= lt!371004 (+!1934 (+!1934 lt!371001 lt!371007) lt!371005))))

(assert (=> b!823162 (= lt!371007 (tuple2!9875 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!371002 () ListLongMap!8687)

(assert (=> b!823162 (= lt!371002 lt!371009)))

(assert (=> b!823162 (= lt!371009 (+!1934 lt!371001 lt!371005))))

(assert (=> b!823162 (= lt!371005 (tuple2!9875 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2476 (array!45839 array!45837 (_ BitVec 32) (_ BitVec 32) V!24787 V!24787 (_ BitVec 32) Int) ListLongMap!8687)

(assert (=> b!823162 (= lt!371000 (getCurrentListMap!2476 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823162 (= lt!371002 (getCurrentListMap!2476 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23872 () Bool)

(assert (=> mapIsEmpty!23872 mapRes!23872))

(declare-fun mapNonEmpty!23872 () Bool)

(declare-fun tp!46135 () Bool)

(declare-fun e!457809 () Bool)

(assert (=> mapNonEmpty!23872 (= mapRes!23872 (and tp!46135 e!457809))))

(declare-fun mapValue!23872 () ValueCell!7004)

(declare-fun mapRest!23872 () (Array (_ BitVec 32) ValueCell!7004))

(declare-fun mapKey!23872 () (_ BitVec 32))

(assert (=> mapNonEmpty!23872 (= (arr!21968 _values!788) (store mapRest!23872 mapKey!23872 mapValue!23872))))

(declare-fun b!823163 () Bool)

(assert (=> b!823163 (= e!457809 tp_is_empty!14839)))

(declare-fun b!823164 () Bool)

(assert (=> b!823164 (= e!457811 tp_is_empty!14839)))

(assert (= (and start!70872 res!561413) b!823157))

(assert (= (and b!823157 res!561414) b!823161))

(assert (= (and b!823161 res!561416) b!823158))

(assert (= (and b!823158 res!561417) b!823159))

(assert (= (and b!823159 (not res!561415)) b!823162))

(assert (= (and b!823160 condMapEmpty!23872) mapIsEmpty!23872))

(assert (= (and b!823160 (not condMapEmpty!23872)) mapNonEmpty!23872))

(get-info :version)

(assert (= (and mapNonEmpty!23872 ((_ is ValueCellFull!7004) mapValue!23872)) b!823163))

(assert (= (and b!823160 ((_ is ValueCellFull!7004) mapDefault!23872)) b!823164))

(assert (= start!70872 b!823160))

(declare-fun m!764801 () Bool)

(assert (=> b!823162 m!764801))

(declare-fun m!764803 () Bool)

(assert (=> b!823162 m!764803))

(declare-fun m!764805 () Bool)

(assert (=> b!823162 m!764805))

(declare-fun m!764807 () Bool)

(assert (=> b!823162 m!764807))

(declare-fun m!764809 () Bool)

(assert (=> b!823162 m!764809))

(assert (=> b!823162 m!764809))

(declare-fun m!764811 () Bool)

(assert (=> b!823162 m!764811))

(declare-fun m!764813 () Bool)

(assert (=> b!823162 m!764813))

(declare-fun m!764815 () Bool)

(assert (=> start!70872 m!764815))

(declare-fun m!764817 () Bool)

(assert (=> start!70872 m!764817))

(declare-fun m!764819 () Bool)

(assert (=> start!70872 m!764819))

(declare-fun m!764821 () Bool)

(assert (=> mapNonEmpty!23872 m!764821))

(declare-fun m!764823 () Bool)

(assert (=> b!823158 m!764823))

(declare-fun m!764825 () Bool)

(assert (=> b!823159 m!764825))

(declare-fun m!764827 () Bool)

(assert (=> b!823159 m!764827))

(declare-fun m!764829 () Bool)

(assert (=> b!823159 m!764829))

(declare-fun m!764831 () Bool)

(assert (=> b!823161 m!764831))

(check-sat (not b_next!13129) (not b!823158) (not b!823159) b_and!21987 (not mapNonEmpty!23872) (not b!823161) (not start!70872) (not b!823162) tp_is_empty!14839)
(check-sat b_and!21987 (not b_next!13129))
(get-model)

(declare-fun b!823223 () Bool)

(declare-fun e!457861 () Bool)

(declare-fun e!457862 () Bool)

(assert (=> b!823223 (= e!457861 e!457862)))

(declare-fun c!89255 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!823223 (= c!89255 (validKeyInArray!0 (select (arr!21969 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823224 () Bool)

(declare-fun e!457859 () Bool)

(declare-fun contains!4151 (List!15679 (_ BitVec 64)) Bool)

(assert (=> b!823224 (= e!457859 (contains!4151 Nil!15676 (select (arr!21969 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35765 () Bool)

(declare-fun call!35768 () Bool)

(assert (=> bm!35765 (= call!35768 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89255 (Cons!15675 (select (arr!21969 _keys!976) #b00000000000000000000000000000000) Nil!15676) Nil!15676)))))

(declare-fun b!823225 () Bool)

(assert (=> b!823225 (= e!457862 call!35768)))

(declare-fun b!823226 () Bool)

(assert (=> b!823226 (= e!457862 call!35768)))

(declare-fun b!823227 () Bool)

(declare-fun e!457860 () Bool)

(assert (=> b!823227 (= e!457860 e!457861)))

(declare-fun res!561455 () Bool)

(assert (=> b!823227 (=> (not res!561455) (not e!457861))))

(assert (=> b!823227 (= res!561455 (not e!457859))))

(declare-fun res!561456 () Bool)

(assert (=> b!823227 (=> (not res!561456) (not e!457859))))

(assert (=> b!823227 (= res!561456 (validKeyInArray!0 (select (arr!21969 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104681 () Bool)

(declare-fun res!561454 () Bool)

(assert (=> d!104681 (=> res!561454 e!457860)))

(assert (=> d!104681 (= res!561454 (bvsge #b00000000000000000000000000000000 (size!22390 _keys!976)))))

(assert (=> d!104681 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15676) e!457860)))

(assert (= (and d!104681 (not res!561454)) b!823227))

(assert (= (and b!823227 res!561456) b!823224))

(assert (= (and b!823227 res!561455) b!823223))

(assert (= (and b!823223 c!89255) b!823226))

(assert (= (and b!823223 (not c!89255)) b!823225))

(assert (= (or b!823226 b!823225) bm!35765))

(declare-fun m!764897 () Bool)

(assert (=> b!823223 m!764897))

(assert (=> b!823223 m!764897))

(declare-fun m!764899 () Bool)

(assert (=> b!823223 m!764899))

(assert (=> b!823224 m!764897))

(assert (=> b!823224 m!764897))

(declare-fun m!764901 () Bool)

(assert (=> b!823224 m!764901))

(assert (=> bm!35765 m!764897))

(declare-fun m!764903 () Bool)

(assert (=> bm!35765 m!764903))

(assert (=> b!823227 m!764897))

(assert (=> b!823227 m!764897))

(assert (=> b!823227 m!764899))

(assert (=> b!823158 d!104681))

(declare-fun d!104683 () Bool)

(assert (=> d!104683 (= (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371072 () Unit!28140)

(declare-fun choose!1410 (array!45839 array!45837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24787 V!24787 V!24787 V!24787 (_ BitVec 32) Int) Unit!28140)

(assert (=> d!104683 (= lt!371072 (choose!1410 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104683 (validMask!0 mask!1312)))

(assert (=> d!104683 (= (lemmaNoChangeToArrayThenSameMapNoExtras!496 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371072)))

(declare-fun bs!22954 () Bool)

(assert (= bs!22954 d!104683))

(assert (=> bs!22954 m!764829))

(assert (=> bs!22954 m!764827))

(declare-fun m!764905 () Bool)

(assert (=> bs!22954 m!764905))

(assert (=> bs!22954 m!764815))

(assert (=> b!823159 d!104683))

(declare-fun b!823252 () Bool)

(declare-fun e!457879 () Bool)

(assert (=> b!823252 (= e!457879 (validKeyInArray!0 (select (arr!21969 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!823252 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!823253 () Bool)

(declare-fun e!457880 () Bool)

(declare-fun e!457882 () Bool)

(assert (=> b!823253 (= e!457880 e!457882)))

(declare-fun c!89265 () Bool)

(assert (=> b!823253 (= c!89265 (bvslt #b00000000000000000000000000000000 (size!22390 _keys!976)))))

(declare-fun b!823254 () Bool)

(declare-fun res!561466 () Bool)

(declare-fun e!457881 () Bool)

(assert (=> b!823254 (=> (not res!561466) (not e!457881))))

(declare-fun lt!371089 () ListLongMap!8687)

(declare-fun contains!4152 (ListLongMap!8687 (_ BitVec 64)) Bool)

(assert (=> b!823254 (= res!561466 (not (contains!4152 lt!371089 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!104685 () Bool)

(assert (=> d!104685 e!457881))

(declare-fun res!561467 () Bool)

(assert (=> d!104685 (=> (not res!561467) (not e!457881))))

(assert (=> d!104685 (= res!561467 (not (contains!4152 lt!371089 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!457883 () ListLongMap!8687)

(assert (=> d!104685 (= lt!371089 e!457883)))

(declare-fun c!89264 () Bool)

(assert (=> d!104685 (= c!89264 (bvsge #b00000000000000000000000000000000 (size!22390 _keys!976)))))

(assert (=> d!104685 (validMask!0 mask!1312)))

(assert (=> d!104685 (= (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371089)))

(declare-fun b!823255 () Bool)

(assert (=> b!823255 (= e!457883 (ListLongMap!8688 Nil!15677))))

(declare-fun b!823256 () Bool)

(declare-fun e!457878 () ListLongMap!8687)

(assert (=> b!823256 (= e!457883 e!457878)))

(declare-fun c!89266 () Bool)

(assert (=> b!823256 (= c!89266 (validKeyInArray!0 (select (arr!21969 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823257 () Bool)

(declare-fun call!35771 () ListLongMap!8687)

(assert (=> b!823257 (= e!457878 call!35771)))

(declare-fun b!823258 () Bool)

(declare-fun e!457877 () Bool)

(assert (=> b!823258 (= e!457880 e!457877)))

(assert (=> b!823258 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22390 _keys!976)))))

(declare-fun res!561468 () Bool)

(assert (=> b!823258 (= res!561468 (contains!4152 lt!371089 (select (arr!21969 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!823258 (=> (not res!561468) (not e!457877))))

(declare-fun b!823259 () Bool)

(assert (=> b!823259 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22390 _keys!976)))))

(assert (=> b!823259 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22389 _values!788)))))

(declare-fun apply!359 (ListLongMap!8687 (_ BitVec 64)) V!24787)

(declare-fun get!11688 (ValueCell!7004 V!24787) V!24787)

(declare-fun dynLambda!973 (Int (_ BitVec 64)) V!24787)

(assert (=> b!823259 (= e!457877 (= (apply!359 lt!371089 (select (arr!21969 _keys!976) #b00000000000000000000000000000000)) (get!11688 (select (arr!21968 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!823260 () Bool)

(assert (=> b!823260 (= e!457882 (= lt!371089 (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!823261 () Bool)

(declare-fun isEmpty!646 (ListLongMap!8687) Bool)

(assert (=> b!823261 (= e!457882 (isEmpty!646 lt!371089))))

(declare-fun bm!35768 () Bool)

(assert (=> bm!35768 (= call!35771 (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!823262 () Bool)

(assert (=> b!823262 (= e!457881 e!457880)))

(declare-fun c!89267 () Bool)

(assert (=> b!823262 (= c!89267 e!457879)))

(declare-fun res!561465 () Bool)

(assert (=> b!823262 (=> (not res!561465) (not e!457879))))

(assert (=> b!823262 (= res!561465 (bvslt #b00000000000000000000000000000000 (size!22390 _keys!976)))))

(declare-fun b!823263 () Bool)

(declare-fun lt!371091 () Unit!28140)

(declare-fun lt!371087 () Unit!28140)

(assert (=> b!823263 (= lt!371091 lt!371087)))

(declare-fun lt!371090 () ListLongMap!8687)

(declare-fun lt!371088 () (_ BitVec 64))

(declare-fun lt!371093 () (_ BitVec 64))

(declare-fun lt!371092 () V!24787)

(assert (=> b!823263 (not (contains!4152 (+!1934 lt!371090 (tuple2!9875 lt!371088 lt!371092)) lt!371093))))

(declare-fun addStillNotContains!185 (ListLongMap!8687 (_ BitVec 64) V!24787 (_ BitVec 64)) Unit!28140)

(assert (=> b!823263 (= lt!371087 (addStillNotContains!185 lt!371090 lt!371088 lt!371092 lt!371093))))

(assert (=> b!823263 (= lt!371093 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!823263 (= lt!371092 (get!11688 (select (arr!21968 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!823263 (= lt!371088 (select (arr!21969 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!823263 (= lt!371090 call!35771)))

(assert (=> b!823263 (= e!457878 (+!1934 call!35771 (tuple2!9875 (select (arr!21969 _keys!976) #b00000000000000000000000000000000) (get!11688 (select (arr!21968 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!104685 c!89264) b!823255))

(assert (= (and d!104685 (not c!89264)) b!823256))

(assert (= (and b!823256 c!89266) b!823263))

(assert (= (and b!823256 (not c!89266)) b!823257))

(assert (= (or b!823263 b!823257) bm!35768))

(assert (= (and d!104685 res!561467) b!823254))

(assert (= (and b!823254 res!561466) b!823262))

(assert (= (and b!823262 res!561465) b!823252))

(assert (= (and b!823262 c!89267) b!823258))

(assert (= (and b!823262 (not c!89267)) b!823253))

(assert (= (and b!823258 res!561468) b!823259))

(assert (= (and b!823253 c!89265) b!823260))

(assert (= (and b!823253 (not c!89265)) b!823261))

(declare-fun b_lambda!11037 () Bool)

(assert (=> (not b_lambda!11037) (not b!823259)))

(declare-fun t!22014 () Bool)

(declare-fun tb!4191 () Bool)

(assert (=> (and start!70872 (= defaultEntry!796 defaultEntry!796) t!22014) tb!4191))

(declare-fun result!7929 () Bool)

(assert (=> tb!4191 (= result!7929 tp_is_empty!14839)))

(assert (=> b!823259 t!22014))

(declare-fun b_and!21993 () Bool)

(assert (= b_and!21987 (and (=> t!22014 result!7929) b_and!21993)))

(declare-fun b_lambda!11039 () Bool)

(assert (=> (not b_lambda!11039) (not b!823263)))

(assert (=> b!823263 t!22014))

(declare-fun b_and!21995 () Bool)

(assert (= b_and!21993 (and (=> t!22014 result!7929) b_and!21995)))

(declare-fun m!764907 () Bool)

(assert (=> b!823259 m!764907))

(declare-fun m!764909 () Bool)

(assert (=> b!823259 m!764909))

(declare-fun m!764911 () Bool)

(assert (=> b!823259 m!764911))

(assert (=> b!823259 m!764897))

(assert (=> b!823259 m!764907))

(assert (=> b!823259 m!764897))

(declare-fun m!764913 () Bool)

(assert (=> b!823259 m!764913))

(assert (=> b!823259 m!764909))

(assert (=> b!823252 m!764897))

(assert (=> b!823252 m!764897))

(assert (=> b!823252 m!764899))

(declare-fun m!764915 () Bool)

(assert (=> b!823261 m!764915))

(declare-fun m!764917 () Bool)

(assert (=> bm!35768 m!764917))

(assert (=> b!823256 m!764897))

(assert (=> b!823256 m!764897))

(assert (=> b!823256 m!764899))

(declare-fun m!764919 () Bool)

(assert (=> d!104685 m!764919))

(assert (=> d!104685 m!764815))

(declare-fun m!764921 () Bool)

(assert (=> b!823263 m!764921))

(declare-fun m!764923 () Bool)

(assert (=> b!823263 m!764923))

(assert (=> b!823263 m!764907))

(assert (=> b!823263 m!764909))

(assert (=> b!823263 m!764911))

(assert (=> b!823263 m!764921))

(assert (=> b!823263 m!764897))

(assert (=> b!823263 m!764907))

(declare-fun m!764925 () Bool)

(assert (=> b!823263 m!764925))

(assert (=> b!823263 m!764909))

(declare-fun m!764927 () Bool)

(assert (=> b!823263 m!764927))

(declare-fun m!764929 () Bool)

(assert (=> b!823254 m!764929))

(assert (=> b!823258 m!764897))

(assert (=> b!823258 m!764897))

(declare-fun m!764931 () Bool)

(assert (=> b!823258 m!764931))

(assert (=> b!823260 m!764917))

(assert (=> b!823159 d!104685))

(declare-fun b!823266 () Bool)

(declare-fun e!457886 () Bool)

(assert (=> b!823266 (= e!457886 (validKeyInArray!0 (select (arr!21969 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!823266 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!823267 () Bool)

(declare-fun e!457887 () Bool)

(declare-fun e!457889 () Bool)

(assert (=> b!823267 (= e!457887 e!457889)))

(declare-fun c!89269 () Bool)

(assert (=> b!823267 (= c!89269 (bvslt #b00000000000000000000000000000000 (size!22390 _keys!976)))))

(declare-fun b!823268 () Bool)

(declare-fun res!561470 () Bool)

(declare-fun e!457888 () Bool)

(assert (=> b!823268 (=> (not res!561470) (not e!457888))))

(declare-fun lt!371096 () ListLongMap!8687)

(assert (=> b!823268 (= res!561470 (not (contains!4152 lt!371096 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!104687 () Bool)

(assert (=> d!104687 e!457888))

(declare-fun res!561471 () Bool)

(assert (=> d!104687 (=> (not res!561471) (not e!457888))))

(assert (=> d!104687 (= res!561471 (not (contains!4152 lt!371096 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!457890 () ListLongMap!8687)

(assert (=> d!104687 (= lt!371096 e!457890)))

(declare-fun c!89268 () Bool)

(assert (=> d!104687 (= c!89268 (bvsge #b00000000000000000000000000000000 (size!22390 _keys!976)))))

(assert (=> d!104687 (validMask!0 mask!1312)))

(assert (=> d!104687 (= (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371096)))

(declare-fun b!823269 () Bool)

(assert (=> b!823269 (= e!457890 (ListLongMap!8688 Nil!15677))))

(declare-fun b!823270 () Bool)

(declare-fun e!457885 () ListLongMap!8687)

(assert (=> b!823270 (= e!457890 e!457885)))

(declare-fun c!89270 () Bool)

(assert (=> b!823270 (= c!89270 (validKeyInArray!0 (select (arr!21969 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823271 () Bool)

(declare-fun call!35772 () ListLongMap!8687)

(assert (=> b!823271 (= e!457885 call!35772)))

(declare-fun b!823272 () Bool)

(declare-fun e!457884 () Bool)

(assert (=> b!823272 (= e!457887 e!457884)))

(assert (=> b!823272 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22390 _keys!976)))))

(declare-fun res!561472 () Bool)

(assert (=> b!823272 (= res!561472 (contains!4152 lt!371096 (select (arr!21969 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!823272 (=> (not res!561472) (not e!457884))))

(declare-fun b!823273 () Bool)

(assert (=> b!823273 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22390 _keys!976)))))

(assert (=> b!823273 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22389 _values!788)))))

(assert (=> b!823273 (= e!457884 (= (apply!359 lt!371096 (select (arr!21969 _keys!976) #b00000000000000000000000000000000)) (get!11688 (select (arr!21968 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!823274 () Bool)

(assert (=> b!823274 (= e!457889 (= lt!371096 (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!823275 () Bool)

(assert (=> b!823275 (= e!457889 (isEmpty!646 lt!371096))))

(declare-fun bm!35769 () Bool)

(assert (=> bm!35769 (= call!35772 (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!823276 () Bool)

(assert (=> b!823276 (= e!457888 e!457887)))

(declare-fun c!89271 () Bool)

(assert (=> b!823276 (= c!89271 e!457886)))

(declare-fun res!561469 () Bool)

(assert (=> b!823276 (=> (not res!561469) (not e!457886))))

(assert (=> b!823276 (= res!561469 (bvslt #b00000000000000000000000000000000 (size!22390 _keys!976)))))

(declare-fun b!823277 () Bool)

(declare-fun lt!371098 () Unit!28140)

(declare-fun lt!371094 () Unit!28140)

(assert (=> b!823277 (= lt!371098 lt!371094)))

(declare-fun lt!371095 () (_ BitVec 64))

(declare-fun lt!371100 () (_ BitVec 64))

(declare-fun lt!371097 () ListLongMap!8687)

(declare-fun lt!371099 () V!24787)

(assert (=> b!823277 (not (contains!4152 (+!1934 lt!371097 (tuple2!9875 lt!371095 lt!371099)) lt!371100))))

(assert (=> b!823277 (= lt!371094 (addStillNotContains!185 lt!371097 lt!371095 lt!371099 lt!371100))))

(assert (=> b!823277 (= lt!371100 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!823277 (= lt!371099 (get!11688 (select (arr!21968 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!823277 (= lt!371095 (select (arr!21969 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!823277 (= lt!371097 call!35772)))

(assert (=> b!823277 (= e!457885 (+!1934 call!35772 (tuple2!9875 (select (arr!21969 _keys!976) #b00000000000000000000000000000000) (get!11688 (select (arr!21968 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!104687 c!89268) b!823269))

(assert (= (and d!104687 (not c!89268)) b!823270))

(assert (= (and b!823270 c!89270) b!823277))

(assert (= (and b!823270 (not c!89270)) b!823271))

(assert (= (or b!823277 b!823271) bm!35769))

(assert (= (and d!104687 res!561471) b!823268))

(assert (= (and b!823268 res!561470) b!823276))

(assert (= (and b!823276 res!561469) b!823266))

(assert (= (and b!823276 c!89271) b!823272))

(assert (= (and b!823276 (not c!89271)) b!823267))

(assert (= (and b!823272 res!561472) b!823273))

(assert (= (and b!823267 c!89269) b!823274))

(assert (= (and b!823267 (not c!89269)) b!823275))

(declare-fun b_lambda!11041 () Bool)

(assert (=> (not b_lambda!11041) (not b!823273)))

(assert (=> b!823273 t!22014))

(declare-fun b_and!21997 () Bool)

(assert (= b_and!21995 (and (=> t!22014 result!7929) b_and!21997)))

(declare-fun b_lambda!11043 () Bool)

(assert (=> (not b_lambda!11043) (not b!823277)))

(assert (=> b!823277 t!22014))

(declare-fun b_and!21999 () Bool)

(assert (= b_and!21997 (and (=> t!22014 result!7929) b_and!21999)))

(assert (=> b!823273 m!764907))

(assert (=> b!823273 m!764909))

(assert (=> b!823273 m!764911))

(assert (=> b!823273 m!764897))

(assert (=> b!823273 m!764907))

(assert (=> b!823273 m!764897))

(declare-fun m!764933 () Bool)

(assert (=> b!823273 m!764933))

(assert (=> b!823273 m!764909))

(assert (=> b!823266 m!764897))

(assert (=> b!823266 m!764897))

(assert (=> b!823266 m!764899))

(declare-fun m!764935 () Bool)

(assert (=> b!823275 m!764935))

(declare-fun m!764937 () Bool)

(assert (=> bm!35769 m!764937))

(assert (=> b!823270 m!764897))

(assert (=> b!823270 m!764897))

(assert (=> b!823270 m!764899))

(declare-fun m!764939 () Bool)

(assert (=> d!104687 m!764939))

(assert (=> d!104687 m!764815))

(declare-fun m!764941 () Bool)

(assert (=> b!823277 m!764941))

(declare-fun m!764943 () Bool)

(assert (=> b!823277 m!764943))

(assert (=> b!823277 m!764907))

(assert (=> b!823277 m!764909))

(assert (=> b!823277 m!764911))

(assert (=> b!823277 m!764941))

(assert (=> b!823277 m!764897))

(assert (=> b!823277 m!764907))

(declare-fun m!764945 () Bool)

(assert (=> b!823277 m!764945))

(assert (=> b!823277 m!764909))

(declare-fun m!764947 () Bool)

(assert (=> b!823277 m!764947))

(declare-fun m!764949 () Bool)

(assert (=> b!823268 m!764949))

(assert (=> b!823272 m!764897))

(assert (=> b!823272 m!764897))

(declare-fun m!764951 () Bool)

(assert (=> b!823272 m!764951))

(assert (=> b!823274 m!764937))

(assert (=> b!823159 d!104687))

(declare-fun d!104689 () Bool)

(assert (=> d!104689 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70872 d!104689))

(declare-fun d!104691 () Bool)

(assert (=> d!104691 (= (array_inv!17601 _keys!976) (bvsge (size!22390 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70872 d!104691))

(declare-fun d!104693 () Bool)

(assert (=> d!104693 (= (array_inv!17602 _values!788) (bvsge (size!22389 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70872 d!104693))

(declare-fun bm!35772 () Bool)

(declare-fun call!35775 () Bool)

(assert (=> bm!35772 (= call!35775 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!823286 () Bool)

(declare-fun e!457897 () Bool)

(declare-fun e!457898 () Bool)

(assert (=> b!823286 (= e!457897 e!457898)))

(declare-fun lt!371107 () (_ BitVec 64))

(assert (=> b!823286 (= lt!371107 (select (arr!21969 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371109 () Unit!28140)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45839 (_ BitVec 64) (_ BitVec 32)) Unit!28140)

(assert (=> b!823286 (= lt!371109 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!371107 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!823286 (arrayContainsKey!0 _keys!976 lt!371107 #b00000000000000000000000000000000)))

(declare-fun lt!371108 () Unit!28140)

(assert (=> b!823286 (= lt!371108 lt!371109)))

(declare-fun res!561478 () Bool)

(declare-datatypes ((SeekEntryResult!8727 0))(
  ( (MissingZero!8727 (index!37279 (_ BitVec 32))) (Found!8727 (index!37280 (_ BitVec 32))) (Intermediate!8727 (undefined!9539 Bool) (index!37281 (_ BitVec 32)) (x!69456 (_ BitVec 32))) (Undefined!8727) (MissingVacant!8727 (index!37282 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45839 (_ BitVec 32)) SeekEntryResult!8727)

(assert (=> b!823286 (= res!561478 (= (seekEntryOrOpen!0 (select (arr!21969 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8727 #b00000000000000000000000000000000)))))

(assert (=> b!823286 (=> (not res!561478) (not e!457898))))

(declare-fun d!104695 () Bool)

(declare-fun res!561477 () Bool)

(declare-fun e!457899 () Bool)

(assert (=> d!104695 (=> res!561477 e!457899)))

(assert (=> d!104695 (= res!561477 (bvsge #b00000000000000000000000000000000 (size!22390 _keys!976)))))

(assert (=> d!104695 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!457899)))

(declare-fun b!823287 () Bool)

(assert (=> b!823287 (= e!457899 e!457897)))

(declare-fun c!89274 () Bool)

(assert (=> b!823287 (= c!89274 (validKeyInArray!0 (select (arr!21969 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823288 () Bool)

(assert (=> b!823288 (= e!457898 call!35775)))

(declare-fun b!823289 () Bool)

(assert (=> b!823289 (= e!457897 call!35775)))

(assert (= (and d!104695 (not res!561477)) b!823287))

(assert (= (and b!823287 c!89274) b!823286))

(assert (= (and b!823287 (not c!89274)) b!823289))

(assert (= (and b!823286 res!561478) b!823288))

(assert (= (or b!823288 b!823289) bm!35772))

(declare-fun m!764953 () Bool)

(assert (=> bm!35772 m!764953))

(assert (=> b!823286 m!764897))

(declare-fun m!764955 () Bool)

(assert (=> b!823286 m!764955))

(declare-fun m!764957 () Bool)

(assert (=> b!823286 m!764957))

(assert (=> b!823286 m!764897))

(declare-fun m!764959 () Bool)

(assert (=> b!823286 m!764959))

(assert (=> b!823287 m!764897))

(assert (=> b!823287 m!764897))

(assert (=> b!823287 m!764899))

(assert (=> b!823161 d!104695))

(declare-fun d!104697 () Bool)

(declare-fun e!457902 () Bool)

(assert (=> d!104697 e!457902))

(declare-fun res!561484 () Bool)

(assert (=> d!104697 (=> (not res!561484) (not e!457902))))

(declare-fun lt!371119 () ListLongMap!8687)

(assert (=> d!104697 (= res!561484 (contains!4152 lt!371119 (_1!4948 lt!371005)))))

(declare-fun lt!371120 () List!15680)

(assert (=> d!104697 (= lt!371119 (ListLongMap!8688 lt!371120))))

(declare-fun lt!371118 () Unit!28140)

(declare-fun lt!371121 () Unit!28140)

(assert (=> d!104697 (= lt!371118 lt!371121)))

(declare-datatypes ((Option!409 0))(
  ( (Some!408 (v!9896 V!24787)) (None!407) )
))
(declare-fun getValueByKey!403 (List!15680 (_ BitVec 64)) Option!409)

(assert (=> d!104697 (= (getValueByKey!403 lt!371120 (_1!4948 lt!371005)) (Some!408 (_2!4948 lt!371005)))))

(declare-fun lemmaContainsTupThenGetReturnValue!220 (List!15680 (_ BitVec 64) V!24787) Unit!28140)

(assert (=> d!104697 (= lt!371121 (lemmaContainsTupThenGetReturnValue!220 lt!371120 (_1!4948 lt!371005) (_2!4948 lt!371005)))))

(declare-fun insertStrictlySorted!259 (List!15680 (_ BitVec 64) V!24787) List!15680)

(assert (=> d!104697 (= lt!371120 (insertStrictlySorted!259 (toList!4359 lt!371001) (_1!4948 lt!371005) (_2!4948 lt!371005)))))

(assert (=> d!104697 (= (+!1934 lt!371001 lt!371005) lt!371119)))

(declare-fun b!823294 () Bool)

(declare-fun res!561483 () Bool)

(assert (=> b!823294 (=> (not res!561483) (not e!457902))))

(assert (=> b!823294 (= res!561483 (= (getValueByKey!403 (toList!4359 lt!371119) (_1!4948 lt!371005)) (Some!408 (_2!4948 lt!371005))))))

(declare-fun b!823295 () Bool)

(declare-fun contains!4153 (List!15680 tuple2!9874) Bool)

(assert (=> b!823295 (= e!457902 (contains!4153 (toList!4359 lt!371119) lt!371005))))

(assert (= (and d!104697 res!561484) b!823294))

(assert (= (and b!823294 res!561483) b!823295))

(declare-fun m!764961 () Bool)

(assert (=> d!104697 m!764961))

(declare-fun m!764963 () Bool)

(assert (=> d!104697 m!764963))

(declare-fun m!764965 () Bool)

(assert (=> d!104697 m!764965))

(declare-fun m!764967 () Bool)

(assert (=> d!104697 m!764967))

(declare-fun m!764969 () Bool)

(assert (=> b!823294 m!764969))

(declare-fun m!764971 () Bool)

(assert (=> b!823295 m!764971))

(assert (=> b!823162 d!104697))

(declare-fun d!104699 () Bool)

(declare-fun e!457903 () Bool)

(assert (=> d!104699 e!457903))

(declare-fun res!561486 () Bool)

(assert (=> d!104699 (=> (not res!561486) (not e!457903))))

(declare-fun lt!371123 () ListLongMap!8687)

(assert (=> d!104699 (= res!561486 (contains!4152 lt!371123 (_1!4948 lt!371007)))))

(declare-fun lt!371124 () List!15680)

(assert (=> d!104699 (= lt!371123 (ListLongMap!8688 lt!371124))))

(declare-fun lt!371122 () Unit!28140)

(declare-fun lt!371125 () Unit!28140)

(assert (=> d!104699 (= lt!371122 lt!371125)))

(assert (=> d!104699 (= (getValueByKey!403 lt!371124 (_1!4948 lt!371007)) (Some!408 (_2!4948 lt!371007)))))

(assert (=> d!104699 (= lt!371125 (lemmaContainsTupThenGetReturnValue!220 lt!371124 (_1!4948 lt!371007) (_2!4948 lt!371007)))))

(assert (=> d!104699 (= lt!371124 (insertStrictlySorted!259 (toList!4359 lt!371001) (_1!4948 lt!371007) (_2!4948 lt!371007)))))

(assert (=> d!104699 (= (+!1934 lt!371001 lt!371007) lt!371123)))

(declare-fun b!823296 () Bool)

(declare-fun res!561485 () Bool)

(assert (=> b!823296 (=> (not res!561485) (not e!457903))))

(assert (=> b!823296 (= res!561485 (= (getValueByKey!403 (toList!4359 lt!371123) (_1!4948 lt!371007)) (Some!408 (_2!4948 lt!371007))))))

(declare-fun b!823297 () Bool)

(assert (=> b!823297 (= e!457903 (contains!4153 (toList!4359 lt!371123) lt!371007))))

(assert (= (and d!104699 res!561486) b!823296))

(assert (= (and b!823296 res!561485) b!823297))

(declare-fun m!764973 () Bool)

(assert (=> d!104699 m!764973))

(declare-fun m!764975 () Bool)

(assert (=> d!104699 m!764975))

(declare-fun m!764977 () Bool)

(assert (=> d!104699 m!764977))

(declare-fun m!764979 () Bool)

(assert (=> d!104699 m!764979))

(declare-fun m!764981 () Bool)

(assert (=> b!823296 m!764981))

(declare-fun m!764983 () Bool)

(assert (=> b!823297 m!764983))

(assert (=> b!823162 d!104699))

(declare-fun b!823340 () Bool)

(declare-fun e!457937 () Bool)

(assert (=> b!823340 (= e!457937 (validKeyInArray!0 (select (arr!21969 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823341 () Bool)

(declare-fun e!457938 () Bool)

(declare-fun lt!371173 () ListLongMap!8687)

(assert (=> b!823341 (= e!457938 (= (apply!359 lt!371173 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun bm!35787 () Bool)

(declare-fun call!35792 () ListLongMap!8687)

(assert (=> bm!35787 (= call!35792 (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!35788 () Bool)

(declare-fun call!35796 () ListLongMap!8687)

(declare-fun call!35793 () ListLongMap!8687)

(assert (=> bm!35788 (= call!35796 call!35793)))

(declare-fun b!823342 () Bool)

(declare-fun e!457933 () Bool)

(declare-fun call!35795 () Bool)

(assert (=> b!823342 (= e!457933 (not call!35795))))

(declare-fun bm!35789 () Bool)

(declare-fun call!35791 () ListLongMap!8687)

(declare-fun call!35790 () ListLongMap!8687)

(assert (=> bm!35789 (= call!35791 call!35790)))

(declare-fun b!823343 () Bool)

(assert (=> b!823343 (= e!457933 e!457938)))

(declare-fun res!561513 () Bool)

(assert (=> b!823343 (= res!561513 call!35795)))

(assert (=> b!823343 (=> (not res!561513) (not e!457938))))

(declare-fun b!823345 () Bool)

(declare-fun e!457940 () Bool)

(declare-fun e!457939 () Bool)

(assert (=> b!823345 (= e!457940 e!457939)))

(declare-fun res!561508 () Bool)

(assert (=> b!823345 (=> (not res!561508) (not e!457939))))

(assert (=> b!823345 (= res!561508 (contains!4152 lt!371173 (select (arr!21969 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!823345 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22390 _keys!976)))))

(declare-fun b!823346 () Bool)

(declare-fun e!457942 () ListLongMap!8687)

(declare-fun e!457930 () ListLongMap!8687)

(assert (=> b!823346 (= e!457942 e!457930)))

(declare-fun c!89288 () Bool)

(assert (=> b!823346 (= c!89288 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!823347 () Bool)

(declare-fun e!457936 () Bool)

(declare-fun call!35794 () Bool)

(assert (=> b!823347 (= e!457936 (not call!35794))))

(declare-fun bm!35790 () Bool)

(assert (=> bm!35790 (= call!35794 (contains!4152 lt!371173 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!823348 () Bool)

(declare-fun c!89291 () Bool)

(assert (=> b!823348 (= c!89291 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!457935 () ListLongMap!8687)

(assert (=> b!823348 (= e!457930 e!457935)))

(declare-fun b!823349 () Bool)

(declare-fun res!561512 () Bool)

(declare-fun e!457941 () Bool)

(assert (=> b!823349 (=> (not res!561512) (not e!457941))))

(assert (=> b!823349 (= res!561512 e!457936)))

(declare-fun c!89289 () Bool)

(assert (=> b!823349 (= c!89289 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!823350 () Bool)

(declare-fun e!457934 () Bool)

(assert (=> b!823350 (= e!457934 (validKeyInArray!0 (select (arr!21969 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun c!89290 () Bool)

(declare-fun bm!35791 () Bool)

(assert (=> bm!35791 (= call!35790 (+!1934 (ite c!89290 call!35792 (ite c!89288 call!35793 call!35796)) (ite (or c!89290 c!89288) (tuple2!9875 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9875 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!823351 () Bool)

(assert (=> b!823351 (= e!457939 (= (apply!359 lt!371173 (select (arr!21969 _keys!976) #b00000000000000000000000000000000)) (get!11688 (select (arr!21968 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!823351 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22389 _values!788)))))

(assert (=> b!823351 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22390 _keys!976)))))

(declare-fun d!104701 () Bool)

(assert (=> d!104701 e!457941))

(declare-fun res!561511 () Bool)

(assert (=> d!104701 (=> (not res!561511) (not e!457941))))

(assert (=> d!104701 (= res!561511 (or (bvsge #b00000000000000000000000000000000 (size!22390 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22390 _keys!976)))))))

(declare-fun lt!371175 () ListLongMap!8687)

(assert (=> d!104701 (= lt!371173 lt!371175)))

(declare-fun lt!371171 () Unit!28140)

(declare-fun e!457931 () Unit!28140)

(assert (=> d!104701 (= lt!371171 e!457931)))

(declare-fun c!89292 () Bool)

(assert (=> d!104701 (= c!89292 e!457937)))

(declare-fun res!561505 () Bool)

(assert (=> d!104701 (=> (not res!561505) (not e!457937))))

(assert (=> d!104701 (= res!561505 (bvslt #b00000000000000000000000000000000 (size!22390 _keys!976)))))

(assert (=> d!104701 (= lt!371175 e!457942)))

(assert (=> d!104701 (= c!89290 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104701 (validMask!0 mask!1312)))

(assert (=> d!104701 (= (getCurrentListMap!2476 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371173)))

(declare-fun b!823344 () Bool)

(assert (=> b!823344 (= e!457935 call!35796)))

(declare-fun b!823352 () Bool)

(assert (=> b!823352 (= e!457941 e!457933)))

(declare-fun c!89287 () Bool)

(assert (=> b!823352 (= c!89287 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35792 () Bool)

(assert (=> bm!35792 (= call!35795 (contains!4152 lt!371173 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!823353 () Bool)

(assert (=> b!823353 (= e!457930 call!35791)))

(declare-fun b!823354 () Bool)

(declare-fun res!561510 () Bool)

(assert (=> b!823354 (=> (not res!561510) (not e!457941))))

(assert (=> b!823354 (= res!561510 e!457940)))

(declare-fun res!561509 () Bool)

(assert (=> b!823354 (=> res!561509 e!457940)))

(assert (=> b!823354 (= res!561509 (not e!457934))))

(declare-fun res!561506 () Bool)

(assert (=> b!823354 (=> (not res!561506) (not e!457934))))

(assert (=> b!823354 (= res!561506 (bvslt #b00000000000000000000000000000000 (size!22390 _keys!976)))))

(declare-fun b!823355 () Bool)

(declare-fun Unit!28146 () Unit!28140)

(assert (=> b!823355 (= e!457931 Unit!28146)))

(declare-fun b!823356 () Bool)

(assert (=> b!823356 (= e!457935 call!35791)))

(declare-fun b!823357 () Bool)

(declare-fun e!457932 () Bool)

(assert (=> b!823357 (= e!457936 e!457932)))

(declare-fun res!561507 () Bool)

(assert (=> b!823357 (= res!561507 call!35794)))

(assert (=> b!823357 (=> (not res!561507) (not e!457932))))

(declare-fun b!823358 () Bool)

(declare-fun lt!371191 () Unit!28140)

(assert (=> b!823358 (= e!457931 lt!371191)))

(declare-fun lt!371180 () ListLongMap!8687)

(assert (=> b!823358 (= lt!371180 (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371190 () (_ BitVec 64))

(assert (=> b!823358 (= lt!371190 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371185 () (_ BitVec 64))

(assert (=> b!823358 (= lt!371185 (select (arr!21969 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371188 () Unit!28140)

(declare-fun addStillContains!312 (ListLongMap!8687 (_ BitVec 64) V!24787 (_ BitVec 64)) Unit!28140)

(assert (=> b!823358 (= lt!371188 (addStillContains!312 lt!371180 lt!371190 zeroValueBefore!34 lt!371185))))

(assert (=> b!823358 (contains!4152 (+!1934 lt!371180 (tuple2!9875 lt!371190 zeroValueBefore!34)) lt!371185)))

(declare-fun lt!371174 () Unit!28140)

(assert (=> b!823358 (= lt!371174 lt!371188)))

(declare-fun lt!371186 () ListLongMap!8687)

(assert (=> b!823358 (= lt!371186 (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371182 () (_ BitVec 64))

(assert (=> b!823358 (= lt!371182 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371189 () (_ BitVec 64))

(assert (=> b!823358 (= lt!371189 (select (arr!21969 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371179 () Unit!28140)

(declare-fun addApplyDifferent!312 (ListLongMap!8687 (_ BitVec 64) V!24787 (_ BitVec 64)) Unit!28140)

(assert (=> b!823358 (= lt!371179 (addApplyDifferent!312 lt!371186 lt!371182 minValue!754 lt!371189))))

(assert (=> b!823358 (= (apply!359 (+!1934 lt!371186 (tuple2!9875 lt!371182 minValue!754)) lt!371189) (apply!359 lt!371186 lt!371189))))

(declare-fun lt!371172 () Unit!28140)

(assert (=> b!823358 (= lt!371172 lt!371179)))

(declare-fun lt!371181 () ListLongMap!8687)

(assert (=> b!823358 (= lt!371181 (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371170 () (_ BitVec 64))

(assert (=> b!823358 (= lt!371170 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371177 () (_ BitVec 64))

(assert (=> b!823358 (= lt!371177 (select (arr!21969 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371184 () Unit!28140)

(assert (=> b!823358 (= lt!371184 (addApplyDifferent!312 lt!371181 lt!371170 zeroValueBefore!34 lt!371177))))

(assert (=> b!823358 (= (apply!359 (+!1934 lt!371181 (tuple2!9875 lt!371170 zeroValueBefore!34)) lt!371177) (apply!359 lt!371181 lt!371177))))

(declare-fun lt!371178 () Unit!28140)

(assert (=> b!823358 (= lt!371178 lt!371184)))

(declare-fun lt!371183 () ListLongMap!8687)

(assert (=> b!823358 (= lt!371183 (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371187 () (_ BitVec 64))

(assert (=> b!823358 (= lt!371187 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371176 () (_ BitVec 64))

(assert (=> b!823358 (= lt!371176 (select (arr!21969 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!823358 (= lt!371191 (addApplyDifferent!312 lt!371183 lt!371187 minValue!754 lt!371176))))

(assert (=> b!823358 (= (apply!359 (+!1934 lt!371183 (tuple2!9875 lt!371187 minValue!754)) lt!371176) (apply!359 lt!371183 lt!371176))))

(declare-fun b!823359 () Bool)

(assert (=> b!823359 (= e!457932 (= (apply!359 lt!371173 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!823360 () Bool)

(assert (=> b!823360 (= e!457942 (+!1934 call!35790 (tuple2!9875 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!35793 () Bool)

(assert (=> bm!35793 (= call!35793 call!35792)))

(assert (= (and d!104701 c!89290) b!823360))

(assert (= (and d!104701 (not c!89290)) b!823346))

(assert (= (and b!823346 c!89288) b!823353))

(assert (= (and b!823346 (not c!89288)) b!823348))

(assert (= (and b!823348 c!89291) b!823356))

(assert (= (and b!823348 (not c!89291)) b!823344))

(assert (= (or b!823356 b!823344) bm!35788))

(assert (= (or b!823353 bm!35788) bm!35793))

(assert (= (or b!823353 b!823356) bm!35789))

(assert (= (or b!823360 bm!35793) bm!35787))

(assert (= (or b!823360 bm!35789) bm!35791))

(assert (= (and d!104701 res!561505) b!823340))

(assert (= (and d!104701 c!89292) b!823358))

(assert (= (and d!104701 (not c!89292)) b!823355))

(assert (= (and d!104701 res!561511) b!823354))

(assert (= (and b!823354 res!561506) b!823350))

(assert (= (and b!823354 (not res!561509)) b!823345))

(assert (= (and b!823345 res!561508) b!823351))

(assert (= (and b!823354 res!561510) b!823349))

(assert (= (and b!823349 c!89289) b!823357))

(assert (= (and b!823349 (not c!89289)) b!823347))

(assert (= (and b!823357 res!561507) b!823359))

(assert (= (or b!823357 b!823347) bm!35790))

(assert (= (and b!823349 res!561512) b!823352))

(assert (= (and b!823352 c!89287) b!823343))

(assert (= (and b!823352 (not c!89287)) b!823342))

(assert (= (and b!823343 res!561513) b!823341))

(assert (= (or b!823343 b!823342) bm!35792))

(declare-fun b_lambda!11045 () Bool)

(assert (=> (not b_lambda!11045) (not b!823351)))

(assert (=> b!823351 t!22014))

(declare-fun b_and!22001 () Bool)

(assert (= b_and!21999 (and (=> t!22014 result!7929) b_and!22001)))

(declare-fun m!764985 () Bool)

(assert (=> b!823360 m!764985))

(assert (=> b!823345 m!764897))

(assert (=> b!823345 m!764897))

(declare-fun m!764987 () Bool)

(assert (=> b!823345 m!764987))

(declare-fun m!764989 () Bool)

(assert (=> b!823359 m!764989))

(assert (=> bm!35787 m!764829))

(assert (=> b!823351 m!764907))

(assert (=> b!823351 m!764909))

(assert (=> b!823351 m!764911))

(assert (=> b!823351 m!764897))

(declare-fun m!764991 () Bool)

(assert (=> b!823351 m!764991))

(assert (=> b!823351 m!764909))

(assert (=> b!823351 m!764907))

(assert (=> b!823351 m!764897))

(declare-fun m!764993 () Bool)

(assert (=> bm!35790 m!764993))

(declare-fun m!764995 () Bool)

(assert (=> b!823358 m!764995))

(declare-fun m!764997 () Bool)

(assert (=> b!823358 m!764997))

(assert (=> b!823358 m!764829))

(declare-fun m!764999 () Bool)

(assert (=> b!823358 m!764999))

(declare-fun m!765001 () Bool)

(assert (=> b!823358 m!765001))

(declare-fun m!765003 () Bool)

(assert (=> b!823358 m!765003))

(declare-fun m!765005 () Bool)

(assert (=> b!823358 m!765005))

(declare-fun m!765007 () Bool)

(assert (=> b!823358 m!765007))

(declare-fun m!765009 () Bool)

(assert (=> b!823358 m!765009))

(declare-fun m!765011 () Bool)

(assert (=> b!823358 m!765011))

(declare-fun m!765013 () Bool)

(assert (=> b!823358 m!765013))

(assert (=> b!823358 m!765011))

(declare-fun m!765015 () Bool)

(assert (=> b!823358 m!765015))

(assert (=> b!823358 m!765001))

(assert (=> b!823358 m!764897))

(declare-fun m!765017 () Bool)

(assert (=> b!823358 m!765017))

(assert (=> b!823358 m!765009))

(declare-fun m!765019 () Bool)

(assert (=> b!823358 m!765019))

(declare-fun m!765021 () Bool)

(assert (=> b!823358 m!765021))

(assert (=> b!823358 m!764997))

(declare-fun m!765023 () Bool)

(assert (=> b!823358 m!765023))

(declare-fun m!765025 () Bool)

(assert (=> b!823341 m!765025))

(assert (=> b!823340 m!764897))

(assert (=> b!823340 m!764897))

(assert (=> b!823340 m!764899))

(assert (=> b!823350 m!764897))

(assert (=> b!823350 m!764897))

(assert (=> b!823350 m!764899))

(declare-fun m!765027 () Bool)

(assert (=> bm!35791 m!765027))

(declare-fun m!765029 () Bool)

(assert (=> bm!35792 m!765029))

(assert (=> d!104701 m!764815))

(assert (=> b!823162 d!104701))

(declare-fun b!823361 () Bool)

(declare-fun e!457950 () Bool)

(assert (=> b!823361 (= e!457950 (validKeyInArray!0 (select (arr!21969 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823362 () Bool)

(declare-fun e!457951 () Bool)

(declare-fun lt!371195 () ListLongMap!8687)

(assert (=> b!823362 (= e!457951 (= (apply!359 lt!371195 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun call!35799 () ListLongMap!8687)

(declare-fun bm!35794 () Bool)

(assert (=> bm!35794 (= call!35799 (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!35795 () Bool)

(declare-fun call!35803 () ListLongMap!8687)

(declare-fun call!35800 () ListLongMap!8687)

(assert (=> bm!35795 (= call!35803 call!35800)))

(declare-fun b!823363 () Bool)

(declare-fun e!457946 () Bool)

(declare-fun call!35802 () Bool)

(assert (=> b!823363 (= e!457946 (not call!35802))))

(declare-fun bm!35796 () Bool)

(declare-fun call!35798 () ListLongMap!8687)

(declare-fun call!35797 () ListLongMap!8687)

(assert (=> bm!35796 (= call!35798 call!35797)))

(declare-fun b!823364 () Bool)

(assert (=> b!823364 (= e!457946 e!457951)))

(declare-fun res!561522 () Bool)

(assert (=> b!823364 (= res!561522 call!35802)))

(assert (=> b!823364 (=> (not res!561522) (not e!457951))))

(declare-fun b!823366 () Bool)

(declare-fun e!457953 () Bool)

(declare-fun e!457952 () Bool)

(assert (=> b!823366 (= e!457953 e!457952)))

(declare-fun res!561517 () Bool)

(assert (=> b!823366 (=> (not res!561517) (not e!457952))))

(assert (=> b!823366 (= res!561517 (contains!4152 lt!371195 (select (arr!21969 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!823366 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22390 _keys!976)))))

(declare-fun b!823367 () Bool)

(declare-fun e!457955 () ListLongMap!8687)

(declare-fun e!457943 () ListLongMap!8687)

(assert (=> b!823367 (= e!457955 e!457943)))

(declare-fun c!89294 () Bool)

(assert (=> b!823367 (= c!89294 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!823368 () Bool)

(declare-fun e!457949 () Bool)

(declare-fun call!35801 () Bool)

(assert (=> b!823368 (= e!457949 (not call!35801))))

(declare-fun bm!35797 () Bool)

(assert (=> bm!35797 (= call!35801 (contains!4152 lt!371195 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!823369 () Bool)

(declare-fun c!89297 () Bool)

(assert (=> b!823369 (= c!89297 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!457948 () ListLongMap!8687)

(assert (=> b!823369 (= e!457943 e!457948)))

(declare-fun b!823370 () Bool)

(declare-fun res!561521 () Bool)

(declare-fun e!457954 () Bool)

(assert (=> b!823370 (=> (not res!561521) (not e!457954))))

(assert (=> b!823370 (= res!561521 e!457949)))

(declare-fun c!89295 () Bool)

(assert (=> b!823370 (= c!89295 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!823371 () Bool)

(declare-fun e!457947 () Bool)

(assert (=> b!823371 (= e!457947 (validKeyInArray!0 (select (arr!21969 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35798 () Bool)

(declare-fun c!89296 () Bool)

(assert (=> bm!35798 (= call!35797 (+!1934 (ite c!89296 call!35799 (ite c!89294 call!35800 call!35803)) (ite (or c!89296 c!89294) (tuple2!9875 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!9875 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!823372 () Bool)

(assert (=> b!823372 (= e!457952 (= (apply!359 lt!371195 (select (arr!21969 _keys!976) #b00000000000000000000000000000000)) (get!11688 (select (arr!21968 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!823372 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22389 _values!788)))))

(assert (=> b!823372 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22390 _keys!976)))))

(declare-fun d!104703 () Bool)

(assert (=> d!104703 e!457954))

(declare-fun res!561520 () Bool)

(assert (=> d!104703 (=> (not res!561520) (not e!457954))))

(assert (=> d!104703 (= res!561520 (or (bvsge #b00000000000000000000000000000000 (size!22390 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22390 _keys!976)))))))

(declare-fun lt!371197 () ListLongMap!8687)

(assert (=> d!104703 (= lt!371195 lt!371197)))

(declare-fun lt!371193 () Unit!28140)

(declare-fun e!457944 () Unit!28140)

(assert (=> d!104703 (= lt!371193 e!457944)))

(declare-fun c!89298 () Bool)

(assert (=> d!104703 (= c!89298 e!457950)))

(declare-fun res!561514 () Bool)

(assert (=> d!104703 (=> (not res!561514) (not e!457950))))

(assert (=> d!104703 (= res!561514 (bvslt #b00000000000000000000000000000000 (size!22390 _keys!976)))))

(assert (=> d!104703 (= lt!371197 e!457955)))

(assert (=> d!104703 (= c!89296 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104703 (validMask!0 mask!1312)))

(assert (=> d!104703 (= (getCurrentListMap!2476 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371195)))

(declare-fun b!823365 () Bool)

(assert (=> b!823365 (= e!457948 call!35803)))

(declare-fun b!823373 () Bool)

(assert (=> b!823373 (= e!457954 e!457946)))

(declare-fun c!89293 () Bool)

(assert (=> b!823373 (= c!89293 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35799 () Bool)

(assert (=> bm!35799 (= call!35802 (contains!4152 lt!371195 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!823374 () Bool)

(assert (=> b!823374 (= e!457943 call!35798)))

(declare-fun b!823375 () Bool)

(declare-fun res!561519 () Bool)

(assert (=> b!823375 (=> (not res!561519) (not e!457954))))

(assert (=> b!823375 (= res!561519 e!457953)))

(declare-fun res!561518 () Bool)

(assert (=> b!823375 (=> res!561518 e!457953)))

(assert (=> b!823375 (= res!561518 (not e!457947))))

(declare-fun res!561515 () Bool)

(assert (=> b!823375 (=> (not res!561515) (not e!457947))))

(assert (=> b!823375 (= res!561515 (bvslt #b00000000000000000000000000000000 (size!22390 _keys!976)))))

(declare-fun b!823376 () Bool)

(declare-fun Unit!28147 () Unit!28140)

(assert (=> b!823376 (= e!457944 Unit!28147)))

(declare-fun b!823377 () Bool)

(assert (=> b!823377 (= e!457948 call!35798)))

(declare-fun b!823378 () Bool)

(declare-fun e!457945 () Bool)

(assert (=> b!823378 (= e!457949 e!457945)))

(declare-fun res!561516 () Bool)

(assert (=> b!823378 (= res!561516 call!35801)))

(assert (=> b!823378 (=> (not res!561516) (not e!457945))))

(declare-fun b!823379 () Bool)

(declare-fun lt!371213 () Unit!28140)

(assert (=> b!823379 (= e!457944 lt!371213)))

(declare-fun lt!371202 () ListLongMap!8687)

(assert (=> b!823379 (= lt!371202 (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371212 () (_ BitVec 64))

(assert (=> b!823379 (= lt!371212 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371207 () (_ BitVec 64))

(assert (=> b!823379 (= lt!371207 (select (arr!21969 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371210 () Unit!28140)

(assert (=> b!823379 (= lt!371210 (addStillContains!312 lt!371202 lt!371212 zeroValueAfter!34 lt!371207))))

(assert (=> b!823379 (contains!4152 (+!1934 lt!371202 (tuple2!9875 lt!371212 zeroValueAfter!34)) lt!371207)))

(declare-fun lt!371196 () Unit!28140)

(assert (=> b!823379 (= lt!371196 lt!371210)))

(declare-fun lt!371208 () ListLongMap!8687)

(assert (=> b!823379 (= lt!371208 (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371204 () (_ BitVec 64))

(assert (=> b!823379 (= lt!371204 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371211 () (_ BitVec 64))

(assert (=> b!823379 (= lt!371211 (select (arr!21969 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371201 () Unit!28140)

(assert (=> b!823379 (= lt!371201 (addApplyDifferent!312 lt!371208 lt!371204 minValue!754 lt!371211))))

(assert (=> b!823379 (= (apply!359 (+!1934 lt!371208 (tuple2!9875 lt!371204 minValue!754)) lt!371211) (apply!359 lt!371208 lt!371211))))

(declare-fun lt!371194 () Unit!28140)

(assert (=> b!823379 (= lt!371194 lt!371201)))

(declare-fun lt!371203 () ListLongMap!8687)

(assert (=> b!823379 (= lt!371203 (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371192 () (_ BitVec 64))

(assert (=> b!823379 (= lt!371192 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371199 () (_ BitVec 64))

(assert (=> b!823379 (= lt!371199 (select (arr!21969 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371206 () Unit!28140)

(assert (=> b!823379 (= lt!371206 (addApplyDifferent!312 lt!371203 lt!371192 zeroValueAfter!34 lt!371199))))

(assert (=> b!823379 (= (apply!359 (+!1934 lt!371203 (tuple2!9875 lt!371192 zeroValueAfter!34)) lt!371199) (apply!359 lt!371203 lt!371199))))

(declare-fun lt!371200 () Unit!28140)

(assert (=> b!823379 (= lt!371200 lt!371206)))

(declare-fun lt!371205 () ListLongMap!8687)

(assert (=> b!823379 (= lt!371205 (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371209 () (_ BitVec 64))

(assert (=> b!823379 (= lt!371209 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371198 () (_ BitVec 64))

(assert (=> b!823379 (= lt!371198 (select (arr!21969 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!823379 (= lt!371213 (addApplyDifferent!312 lt!371205 lt!371209 minValue!754 lt!371198))))

(assert (=> b!823379 (= (apply!359 (+!1934 lt!371205 (tuple2!9875 lt!371209 minValue!754)) lt!371198) (apply!359 lt!371205 lt!371198))))

(declare-fun b!823380 () Bool)

(assert (=> b!823380 (= e!457945 (= (apply!359 lt!371195 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!823381 () Bool)

(assert (=> b!823381 (= e!457955 (+!1934 call!35797 (tuple2!9875 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!35800 () Bool)

(assert (=> bm!35800 (= call!35800 call!35799)))

(assert (= (and d!104703 c!89296) b!823381))

(assert (= (and d!104703 (not c!89296)) b!823367))

(assert (= (and b!823367 c!89294) b!823374))

(assert (= (and b!823367 (not c!89294)) b!823369))

(assert (= (and b!823369 c!89297) b!823377))

(assert (= (and b!823369 (not c!89297)) b!823365))

(assert (= (or b!823377 b!823365) bm!35795))

(assert (= (or b!823374 bm!35795) bm!35800))

(assert (= (or b!823374 b!823377) bm!35796))

(assert (= (or b!823381 bm!35800) bm!35794))

(assert (= (or b!823381 bm!35796) bm!35798))

(assert (= (and d!104703 res!561514) b!823361))

(assert (= (and d!104703 c!89298) b!823379))

(assert (= (and d!104703 (not c!89298)) b!823376))

(assert (= (and d!104703 res!561520) b!823375))

(assert (= (and b!823375 res!561515) b!823371))

(assert (= (and b!823375 (not res!561518)) b!823366))

(assert (= (and b!823366 res!561517) b!823372))

(assert (= (and b!823375 res!561519) b!823370))

(assert (= (and b!823370 c!89295) b!823378))

(assert (= (and b!823370 (not c!89295)) b!823368))

(assert (= (and b!823378 res!561516) b!823380))

(assert (= (or b!823378 b!823368) bm!35797))

(assert (= (and b!823370 res!561521) b!823373))

(assert (= (and b!823373 c!89293) b!823364))

(assert (= (and b!823373 (not c!89293)) b!823363))

(assert (= (and b!823364 res!561522) b!823362))

(assert (= (or b!823364 b!823363) bm!35799))

(declare-fun b_lambda!11047 () Bool)

(assert (=> (not b_lambda!11047) (not b!823372)))

(assert (=> b!823372 t!22014))

(declare-fun b_and!22003 () Bool)

(assert (= b_and!22001 (and (=> t!22014 result!7929) b_and!22003)))

(declare-fun m!765031 () Bool)

(assert (=> b!823381 m!765031))

(assert (=> b!823366 m!764897))

(assert (=> b!823366 m!764897))

(declare-fun m!765033 () Bool)

(assert (=> b!823366 m!765033))

(declare-fun m!765035 () Bool)

(assert (=> b!823380 m!765035))

(assert (=> bm!35794 m!764827))

(assert (=> b!823372 m!764907))

(assert (=> b!823372 m!764909))

(assert (=> b!823372 m!764911))

(assert (=> b!823372 m!764897))

(declare-fun m!765037 () Bool)

(assert (=> b!823372 m!765037))

(assert (=> b!823372 m!764909))

(assert (=> b!823372 m!764907))

(assert (=> b!823372 m!764897))

(declare-fun m!765039 () Bool)

(assert (=> bm!35797 m!765039))

(declare-fun m!765041 () Bool)

(assert (=> b!823379 m!765041))

(declare-fun m!765043 () Bool)

(assert (=> b!823379 m!765043))

(assert (=> b!823379 m!764827))

(declare-fun m!765045 () Bool)

(assert (=> b!823379 m!765045))

(declare-fun m!765047 () Bool)

(assert (=> b!823379 m!765047))

(declare-fun m!765049 () Bool)

(assert (=> b!823379 m!765049))

(declare-fun m!765051 () Bool)

(assert (=> b!823379 m!765051))

(declare-fun m!765053 () Bool)

(assert (=> b!823379 m!765053))

(declare-fun m!765055 () Bool)

(assert (=> b!823379 m!765055))

(declare-fun m!765057 () Bool)

(assert (=> b!823379 m!765057))

(declare-fun m!765059 () Bool)

(assert (=> b!823379 m!765059))

(assert (=> b!823379 m!765057))

(declare-fun m!765061 () Bool)

(assert (=> b!823379 m!765061))

(assert (=> b!823379 m!765047))

(assert (=> b!823379 m!764897))

(declare-fun m!765063 () Bool)

(assert (=> b!823379 m!765063))

(assert (=> b!823379 m!765055))

(declare-fun m!765065 () Bool)

(assert (=> b!823379 m!765065))

(declare-fun m!765067 () Bool)

(assert (=> b!823379 m!765067))

(assert (=> b!823379 m!765043))

(declare-fun m!765069 () Bool)

(assert (=> b!823379 m!765069))

(declare-fun m!765071 () Bool)

(assert (=> b!823362 m!765071))

(assert (=> b!823361 m!764897))

(assert (=> b!823361 m!764897))

(assert (=> b!823361 m!764899))

(assert (=> b!823371 m!764897))

(assert (=> b!823371 m!764897))

(assert (=> b!823371 m!764899))

(declare-fun m!765073 () Bool)

(assert (=> bm!35798 m!765073))

(declare-fun m!765075 () Bool)

(assert (=> bm!35799 m!765075))

(assert (=> d!104703 m!764815))

(assert (=> b!823162 d!104703))

(declare-fun d!104705 () Bool)

(declare-fun e!457956 () Bool)

(assert (=> d!104705 e!457956))

(declare-fun res!561524 () Bool)

(assert (=> d!104705 (=> (not res!561524) (not e!457956))))

(declare-fun lt!371215 () ListLongMap!8687)

(assert (=> d!104705 (= res!561524 (contains!4152 lt!371215 (_1!4948 lt!371005)))))

(declare-fun lt!371216 () List!15680)

(assert (=> d!104705 (= lt!371215 (ListLongMap!8688 lt!371216))))

(declare-fun lt!371214 () Unit!28140)

(declare-fun lt!371217 () Unit!28140)

(assert (=> d!104705 (= lt!371214 lt!371217)))

(assert (=> d!104705 (= (getValueByKey!403 lt!371216 (_1!4948 lt!371005)) (Some!408 (_2!4948 lt!371005)))))

(assert (=> d!104705 (= lt!371217 (lemmaContainsTupThenGetReturnValue!220 lt!371216 (_1!4948 lt!371005) (_2!4948 lt!371005)))))

(assert (=> d!104705 (= lt!371216 (insertStrictlySorted!259 (toList!4359 (+!1934 lt!371001 lt!371007)) (_1!4948 lt!371005) (_2!4948 lt!371005)))))

(assert (=> d!104705 (= (+!1934 (+!1934 lt!371001 lt!371007) lt!371005) lt!371215)))

(declare-fun b!823382 () Bool)

(declare-fun res!561523 () Bool)

(assert (=> b!823382 (=> (not res!561523) (not e!457956))))

(assert (=> b!823382 (= res!561523 (= (getValueByKey!403 (toList!4359 lt!371215) (_1!4948 lt!371005)) (Some!408 (_2!4948 lt!371005))))))

(declare-fun b!823383 () Bool)

(assert (=> b!823383 (= e!457956 (contains!4153 (toList!4359 lt!371215) lt!371005))))

(assert (= (and d!104705 res!561524) b!823382))

(assert (= (and b!823382 res!561523) b!823383))

(declare-fun m!765077 () Bool)

(assert (=> d!104705 m!765077))

(declare-fun m!765079 () Bool)

(assert (=> d!104705 m!765079))

(declare-fun m!765081 () Bool)

(assert (=> d!104705 m!765081))

(declare-fun m!765083 () Bool)

(assert (=> d!104705 m!765083))

(declare-fun m!765085 () Bool)

(assert (=> b!823382 m!765085))

(declare-fun m!765087 () Bool)

(assert (=> b!823383 m!765087))

(assert (=> b!823162 d!104705))

(declare-fun d!104707 () Bool)

(assert (=> d!104707 (= (+!1934 (+!1934 lt!371001 (tuple2!9875 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (tuple2!9875 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (+!1934 (+!1934 lt!371001 (tuple2!9875 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (tuple2!9875 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun lt!371220 () Unit!28140)

(declare-fun choose!1411 (ListLongMap!8687 (_ BitVec 64) V!24787 (_ BitVec 64) V!24787) Unit!28140)

(assert (=> d!104707 (= lt!371220 (choose!1411 lt!371001 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> d!104707 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!104707 (= (addCommutativeForDiffKeys!465 lt!371001 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754) lt!371220)))

(declare-fun bs!22955 () Bool)

(assert (= bs!22955 d!104707))

(declare-fun m!765089 () Bool)

(assert (=> bs!22955 m!765089))

(declare-fun m!765091 () Bool)

(assert (=> bs!22955 m!765091))

(declare-fun m!765093 () Bool)

(assert (=> bs!22955 m!765093))

(declare-fun m!765095 () Bool)

(assert (=> bs!22955 m!765095))

(assert (=> bs!22955 m!765093))

(assert (=> bs!22955 m!765089))

(declare-fun m!765097 () Bool)

(assert (=> bs!22955 m!765097))

(assert (=> b!823162 d!104707))

(declare-fun d!104709 () Bool)

(declare-fun e!457957 () Bool)

(assert (=> d!104709 e!457957))

(declare-fun res!561526 () Bool)

(assert (=> d!104709 (=> (not res!561526) (not e!457957))))

(declare-fun lt!371222 () ListLongMap!8687)

(assert (=> d!104709 (= res!561526 (contains!4152 lt!371222 (_1!4948 lt!371007)))))

(declare-fun lt!371223 () List!15680)

(assert (=> d!104709 (= lt!371222 (ListLongMap!8688 lt!371223))))

(declare-fun lt!371221 () Unit!28140)

(declare-fun lt!371224 () Unit!28140)

(assert (=> d!104709 (= lt!371221 lt!371224)))

(assert (=> d!104709 (= (getValueByKey!403 lt!371223 (_1!4948 lt!371007)) (Some!408 (_2!4948 lt!371007)))))

(assert (=> d!104709 (= lt!371224 (lemmaContainsTupThenGetReturnValue!220 lt!371223 (_1!4948 lt!371007) (_2!4948 lt!371007)))))

(assert (=> d!104709 (= lt!371223 (insertStrictlySorted!259 (toList!4359 lt!371009) (_1!4948 lt!371007) (_2!4948 lt!371007)))))

(assert (=> d!104709 (= (+!1934 lt!371009 lt!371007) lt!371222)))

(declare-fun b!823384 () Bool)

(declare-fun res!561525 () Bool)

(assert (=> b!823384 (=> (not res!561525) (not e!457957))))

(assert (=> b!823384 (= res!561525 (= (getValueByKey!403 (toList!4359 lt!371222) (_1!4948 lt!371007)) (Some!408 (_2!4948 lt!371007))))))

(declare-fun b!823385 () Bool)

(assert (=> b!823385 (= e!457957 (contains!4153 (toList!4359 lt!371222) lt!371007))))

(assert (= (and d!104709 res!561526) b!823384))

(assert (= (and b!823384 res!561525) b!823385))

(declare-fun m!765099 () Bool)

(assert (=> d!104709 m!765099))

(declare-fun m!765101 () Bool)

(assert (=> d!104709 m!765101))

(declare-fun m!765103 () Bool)

(assert (=> d!104709 m!765103))

(declare-fun m!765105 () Bool)

(assert (=> d!104709 m!765105))

(declare-fun m!765107 () Bool)

(assert (=> b!823384 m!765107))

(declare-fun m!765109 () Bool)

(assert (=> b!823385 m!765109))

(assert (=> b!823162 d!104709))

(declare-fun condMapEmpty!23881 () Bool)

(declare-fun mapDefault!23881 () ValueCell!7004)

(assert (=> mapNonEmpty!23872 (= condMapEmpty!23881 (= mapRest!23872 ((as const (Array (_ BitVec 32) ValueCell!7004)) mapDefault!23881)))))

(declare-fun e!457962 () Bool)

(declare-fun mapRes!23881 () Bool)

(assert (=> mapNonEmpty!23872 (= tp!46135 (and e!457962 mapRes!23881))))

(declare-fun mapIsEmpty!23881 () Bool)

(assert (=> mapIsEmpty!23881 mapRes!23881))

(declare-fun b!823393 () Bool)

(assert (=> b!823393 (= e!457962 tp_is_empty!14839)))

(declare-fun b!823392 () Bool)

(declare-fun e!457963 () Bool)

(assert (=> b!823392 (= e!457963 tp_is_empty!14839)))

(declare-fun mapNonEmpty!23881 () Bool)

(declare-fun tp!46150 () Bool)

(assert (=> mapNonEmpty!23881 (= mapRes!23881 (and tp!46150 e!457963))))

(declare-fun mapValue!23881 () ValueCell!7004)

(declare-fun mapRest!23881 () (Array (_ BitVec 32) ValueCell!7004))

(declare-fun mapKey!23881 () (_ BitVec 32))

(assert (=> mapNonEmpty!23881 (= mapRest!23872 (store mapRest!23881 mapKey!23881 mapValue!23881))))

(assert (= (and mapNonEmpty!23872 condMapEmpty!23881) mapIsEmpty!23881))

(assert (= (and mapNonEmpty!23872 (not condMapEmpty!23881)) mapNonEmpty!23881))

(assert (= (and mapNonEmpty!23881 ((_ is ValueCellFull!7004) mapValue!23881)) b!823392))

(assert (= (and mapNonEmpty!23872 ((_ is ValueCellFull!7004) mapDefault!23881)) b!823393))

(declare-fun m!765111 () Bool)

(assert (=> mapNonEmpty!23881 m!765111))

(declare-fun b_lambda!11049 () Bool)

(assert (= b_lambda!11043 (or (and start!70872 b_free!13129) b_lambda!11049)))

(declare-fun b_lambda!11051 () Bool)

(assert (= b_lambda!11045 (or (and start!70872 b_free!13129) b_lambda!11051)))

(declare-fun b_lambda!11053 () Bool)

(assert (= b_lambda!11041 (or (and start!70872 b_free!13129) b_lambda!11053)))

(declare-fun b_lambda!11055 () Bool)

(assert (= b_lambda!11037 (or (and start!70872 b_free!13129) b_lambda!11055)))

(declare-fun b_lambda!11057 () Bool)

(assert (= b_lambda!11039 (or (and start!70872 b_free!13129) b_lambda!11057)))

(declare-fun b_lambda!11059 () Bool)

(assert (= b_lambda!11047 (or (and start!70872 b_free!13129) b_lambda!11059)))

(check-sat (not bm!35790) (not b!823266) (not d!104699) (not b!823275) (not bm!35772) (not b!823381) (not b_lambda!11049) (not bm!35797) (not bm!35768) (not b_next!13129) (not d!104697) (not b!823263) (not b!823295) (not b_lambda!11055) (not b!823254) (not b!823360) (not b!823359) (not b!823345) (not b_lambda!11057) (not b!823294) (not d!104687) (not b!823260) (not b!823261) (not b!823227) (not b!823272) (not b!823252) (not d!104709) (not b!823341) (not d!104705) (not d!104707) (not b!823362) tp_is_empty!14839 (not b_lambda!11059) (not b!823366) (not b!823379) (not b!823277) (not b!823382) (not d!104703) (not bm!35787) (not b!823385) (not bm!35791) (not bm!35799) (not b!823259) (not b!823358) b_and!22003 (not b!823287) (not b_lambda!11051) (not d!104685) (not bm!35792) (not bm!35765) (not b!823274) (not b!823380) (not b!823223) (not b!823270) (not b!823268) (not b!823297) (not b!823383) (not d!104701) (not b!823361) (not b!823258) (not d!104683) (not b!823340) (not bm!35769) (not b!823286) (not b!823224) (not b!823384) (not b!823351) (not bm!35794) (not mapNonEmpty!23881) (not b!823372) (not b_lambda!11053) (not b!823256) (not b!823273) (not bm!35798) (not b!823296) (not b!823371) (not b!823350))
(check-sat b_and!22003 (not b_next!13129))
