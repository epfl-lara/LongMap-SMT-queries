; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70676 () Bool)

(assert start!70676)

(declare-fun b_free!12963 () Bool)

(declare-fun b_next!12963 () Bool)

(assert (=> start!70676 (= b_free!12963 (not b_next!12963))))

(declare-fun tp!45627 () Bool)

(declare-fun b_and!21817 () Bool)

(assert (=> start!70676 (= tp!45627 b_and!21817)))

(declare-fun b!820992 () Bool)

(declare-fun res!560104 () Bool)

(declare-fun e!456201 () Bool)

(assert (=> b!820992 (=> (not res!560104) (not e!456201))))

(declare-datatypes ((array!45540 0))(
  ( (array!45541 (arr!21822 (Array (_ BitVec 32) (_ BitVec 64))) (size!22243 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45540)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24565 0))(
  ( (V!24566 (val!7384 Int)) )
))
(declare-datatypes ((ValueCell!6921 0))(
  ( (ValueCellFull!6921 (v!9815 V!24565)) (EmptyCell!6921) )
))
(declare-datatypes ((array!45542 0))(
  ( (array!45543 (arr!21823 (Array (_ BitVec 32) ValueCell!6921)) (size!22244 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45542)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!820992 (= res!560104 (and (= (size!22244 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22243 _keys!976) (size!22244 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820993 () Bool)

(declare-fun res!560102 () Bool)

(assert (=> b!820993 (=> (not res!560102) (not e!456201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45540 (_ BitVec 32)) Bool)

(assert (=> b!820993 (= res!560102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23614 () Bool)

(declare-fun mapRes!23614 () Bool)

(declare-fun tp!45628 () Bool)

(declare-fun e!456200 () Bool)

(assert (=> mapNonEmpty!23614 (= mapRes!23614 (and tp!45628 e!456200))))

(declare-fun mapRest!23614 () (Array (_ BitVec 32) ValueCell!6921))

(declare-fun mapValue!23614 () ValueCell!6921)

(declare-fun mapKey!23614 () (_ BitVec 32))

(assert (=> mapNonEmpty!23614 (= (arr!21823 _values!788) (store mapRest!23614 mapKey!23614 mapValue!23614))))

(declare-fun b!820994 () Bool)

(declare-fun tp_is_empty!14673 () Bool)

(assert (=> b!820994 (= e!456200 tp_is_empty!14673)))

(declare-fun res!560103 () Bool)

(assert (=> start!70676 (=> (not res!560103) (not e!456201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70676 (= res!560103 (validMask!0 mask!1312))))

(assert (=> start!70676 e!456201))

(assert (=> start!70676 tp_is_empty!14673))

(declare-fun array_inv!17443 (array!45540) Bool)

(assert (=> start!70676 (array_inv!17443 _keys!976)))

(assert (=> start!70676 true))

(declare-fun e!456198 () Bool)

(declare-fun array_inv!17444 (array!45542) Bool)

(assert (=> start!70676 (and (array_inv!17444 _values!788) e!456198)))

(assert (=> start!70676 tp!45627))

(declare-fun b!820995 () Bool)

(declare-fun res!560101 () Bool)

(assert (=> b!820995 (=> (not res!560101) (not e!456201))))

(declare-datatypes ((List!15557 0))(
  ( (Nil!15554) (Cons!15553 (h!16682 (_ BitVec 64)) (t!21890 List!15557)) )
))
(declare-fun arrayNoDuplicates!0 (array!45540 (_ BitVec 32) List!15557) Bool)

(assert (=> b!820995 (= res!560101 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15554))))

(declare-fun b!820996 () Bool)

(assert (=> b!820996 (= e!456201 (not (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!22243 _keys!976)))))))

(declare-datatypes ((tuple2!9738 0))(
  ( (tuple2!9739 (_1!4880 (_ BitVec 64)) (_2!4880 V!24565)) )
))
(declare-datatypes ((List!15558 0))(
  ( (Nil!15555) (Cons!15554 (h!16683 tuple2!9738) (t!21891 List!15558)) )
))
(declare-datatypes ((ListLongMap!8561 0))(
  ( (ListLongMap!8562 (toList!4296 List!15558)) )
))
(declare-fun lt!369002 () ListLongMap!8561)

(declare-fun lt!369004 () ListLongMap!8561)

(assert (=> b!820996 (= lt!369002 lt!369004)))

(declare-fun zeroValueBefore!34 () V!24565)

(declare-fun zeroValueAfter!34 () V!24565)

(declare-fun minValue!754 () V!24565)

(declare-datatypes ((Unit!28069 0))(
  ( (Unit!28070) )
))
(declare-fun lt!369003 () Unit!28069)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!432 (array!45540 array!45542 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24565 V!24565 V!24565 V!24565 (_ BitVec 32) Int) Unit!28069)

(assert (=> b!820996 (= lt!369003 (lemmaNoChangeToArrayThenSameMapNoExtras!432 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2322 (array!45540 array!45542 (_ BitVec 32) (_ BitVec 32) V!24565 V!24565 (_ BitVec 32) Int) ListLongMap!8561)

(assert (=> b!820996 (= lt!369004 (getCurrentListMapNoExtraKeys!2322 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820996 (= lt!369002 (getCurrentListMapNoExtraKeys!2322 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23614 () Bool)

(assert (=> mapIsEmpty!23614 mapRes!23614))

(declare-fun b!820997 () Bool)

(declare-fun e!456199 () Bool)

(assert (=> b!820997 (= e!456199 tp_is_empty!14673)))

(declare-fun b!820998 () Bool)

(assert (=> b!820998 (= e!456198 (and e!456199 mapRes!23614))))

(declare-fun condMapEmpty!23614 () Bool)

(declare-fun mapDefault!23614 () ValueCell!6921)

(assert (=> b!820998 (= condMapEmpty!23614 (= (arr!21823 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6921)) mapDefault!23614)))))

(assert (= (and start!70676 res!560103) b!820992))

(assert (= (and b!820992 res!560104) b!820993))

(assert (= (and b!820993 res!560102) b!820995))

(assert (= (and b!820995 res!560101) b!820996))

(assert (= (and b!820998 condMapEmpty!23614) mapIsEmpty!23614))

(assert (= (and b!820998 (not condMapEmpty!23614)) mapNonEmpty!23614))

(get-info :version)

(assert (= (and mapNonEmpty!23614 ((_ is ValueCellFull!6921) mapValue!23614)) b!820994))

(assert (= (and b!820998 ((_ is ValueCellFull!6921) mapDefault!23614)) b!820997))

(assert (= start!70676 b!820998))

(declare-fun m!762867 () Bool)

(assert (=> b!820995 m!762867))

(declare-fun m!762869 () Bool)

(assert (=> b!820993 m!762869))

(declare-fun m!762871 () Bool)

(assert (=> b!820996 m!762871))

(declare-fun m!762873 () Bool)

(assert (=> b!820996 m!762873))

(declare-fun m!762875 () Bool)

(assert (=> b!820996 m!762875))

(declare-fun m!762877 () Bool)

(assert (=> start!70676 m!762877))

(declare-fun m!762879 () Bool)

(assert (=> start!70676 m!762879))

(declare-fun m!762881 () Bool)

(assert (=> start!70676 m!762881))

(declare-fun m!762883 () Bool)

(assert (=> mapNonEmpty!23614 m!762883))

(check-sat b_and!21817 (not b!820995) (not b!820996) (not b_next!12963) (not b!820993) (not start!70676) (not mapNonEmpty!23614) tp_is_empty!14673)
(check-sat b_and!21817 (not b_next!12963))
(get-model)

(declare-fun d!104757 () Bool)

(declare-fun res!560124 () Bool)

(declare-fun e!456227 () Bool)

(assert (=> d!104757 (=> res!560124 e!456227)))

(assert (=> d!104757 (= res!560124 (bvsge #b00000000000000000000000000000000 (size!22243 _keys!976)))))

(assert (=> d!104757 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15554) e!456227)))

(declare-fun b!821030 () Bool)

(declare-fun e!456229 () Bool)

(assert (=> b!821030 (= e!456227 e!456229)))

(declare-fun res!560123 () Bool)

(assert (=> b!821030 (=> (not res!560123) (not e!456229))))

(declare-fun e!456228 () Bool)

(assert (=> b!821030 (= res!560123 (not e!456228))))

(declare-fun res!560125 () Bool)

(assert (=> b!821030 (=> (not res!560125) (not e!456228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!821030 (= res!560125 (validKeyInArray!0 (select (arr!21822 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821031 () Bool)

(declare-fun e!456226 () Bool)

(assert (=> b!821031 (= e!456229 e!456226)))

(declare-fun c!89217 () Bool)

(assert (=> b!821031 (= c!89217 (validKeyInArray!0 (select (arr!21822 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821032 () Bool)

(declare-fun contains!4165 (List!15557 (_ BitVec 64)) Bool)

(assert (=> b!821032 (= e!456228 (contains!4165 Nil!15554 (select (arr!21822 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821033 () Bool)

(declare-fun call!35715 () Bool)

(assert (=> b!821033 (= e!456226 call!35715)))

(declare-fun bm!35712 () Bool)

(assert (=> bm!35712 (= call!35715 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89217 (Cons!15553 (select (arr!21822 _keys!976) #b00000000000000000000000000000000) Nil!15554) Nil!15554)))))

(declare-fun b!821034 () Bool)

(assert (=> b!821034 (= e!456226 call!35715)))

(assert (= (and d!104757 (not res!560124)) b!821030))

(assert (= (and b!821030 res!560125) b!821032))

(assert (= (and b!821030 res!560123) b!821031))

(assert (= (and b!821031 c!89217) b!821033))

(assert (= (and b!821031 (not c!89217)) b!821034))

(assert (= (or b!821033 b!821034) bm!35712))

(declare-fun m!762903 () Bool)

(assert (=> b!821030 m!762903))

(assert (=> b!821030 m!762903))

(declare-fun m!762905 () Bool)

(assert (=> b!821030 m!762905))

(assert (=> b!821031 m!762903))

(assert (=> b!821031 m!762903))

(assert (=> b!821031 m!762905))

(assert (=> b!821032 m!762903))

(assert (=> b!821032 m!762903))

(declare-fun m!762907 () Bool)

(assert (=> b!821032 m!762907))

(assert (=> bm!35712 m!762903))

(declare-fun m!762909 () Bool)

(assert (=> bm!35712 m!762909))

(assert (=> b!820995 d!104757))

(declare-fun d!104759 () Bool)

(assert (=> d!104759 (= (getCurrentListMapNoExtraKeys!2322 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2322 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369016 () Unit!28069)

(declare-fun choose!1397 (array!45540 array!45542 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24565 V!24565 V!24565 V!24565 (_ BitVec 32) Int) Unit!28069)

(assert (=> d!104759 (= lt!369016 (choose!1397 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104759 (validMask!0 mask!1312)))

(assert (=> d!104759 (= (lemmaNoChangeToArrayThenSameMapNoExtras!432 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369016)))

(declare-fun bs!22898 () Bool)

(assert (= bs!22898 d!104759))

(assert (=> bs!22898 m!762875))

(assert (=> bs!22898 m!762873))

(declare-fun m!762911 () Bool)

(assert (=> bs!22898 m!762911))

(assert (=> bs!22898 m!762877))

(assert (=> b!820996 d!104759))

(declare-fun b!821059 () Bool)

(assert (=> b!821059 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22243 _keys!976)))))

(assert (=> b!821059 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22244 _values!788)))))

(declare-fun lt!369033 () ListLongMap!8561)

(declare-fun e!456248 () Bool)

(declare-fun apply!356 (ListLongMap!8561 (_ BitVec 64)) V!24565)

(declare-fun get!11623 (ValueCell!6921 V!24565) V!24565)

(declare-fun dynLambda!967 (Int (_ BitVec 64)) V!24565)

(assert (=> b!821059 (= e!456248 (= (apply!356 lt!369033 (select (arr!21822 _keys!976) #b00000000000000000000000000000000)) (get!11623 (select (arr!21823 _values!788) #b00000000000000000000000000000000) (dynLambda!967 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!821060 () Bool)

(declare-fun e!456244 () Bool)

(declare-fun e!456250 () Bool)

(assert (=> b!821060 (= e!456244 e!456250)))

(declare-fun c!89229 () Bool)

(assert (=> b!821060 (= c!89229 (bvslt #b00000000000000000000000000000000 (size!22243 _keys!976)))))

(declare-fun b!821061 () Bool)

(declare-fun isEmpty!638 (ListLongMap!8561) Bool)

(assert (=> b!821061 (= e!456250 (isEmpty!638 lt!369033))))

(declare-fun b!821062 () Bool)

(declare-fun e!456246 () ListLongMap!8561)

(declare-fun e!456247 () ListLongMap!8561)

(assert (=> b!821062 (= e!456246 e!456247)))

(declare-fun c!89226 () Bool)

(assert (=> b!821062 (= c!89226 (validKeyInArray!0 (select (arr!21822 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun call!35718 () ListLongMap!8561)

(declare-fun bm!35715 () Bool)

(assert (=> bm!35715 (= call!35718 (getCurrentListMapNoExtraKeys!2322 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!821063 () Bool)

(declare-fun lt!369037 () Unit!28069)

(declare-fun lt!369032 () Unit!28069)

(assert (=> b!821063 (= lt!369037 lt!369032)))

(declare-fun lt!369036 () (_ BitVec 64))

(declare-fun lt!369034 () ListLongMap!8561)

(declare-fun lt!369031 () V!24565)

(declare-fun lt!369035 () (_ BitVec 64))

(declare-fun contains!4166 (ListLongMap!8561 (_ BitVec 64)) Bool)

(declare-fun +!1869 (ListLongMap!8561 tuple2!9738) ListLongMap!8561)

(assert (=> b!821063 (not (contains!4166 (+!1869 lt!369034 (tuple2!9739 lt!369035 lt!369031)) lt!369036))))

(declare-fun addStillNotContains!181 (ListLongMap!8561 (_ BitVec 64) V!24565 (_ BitVec 64)) Unit!28069)

(assert (=> b!821063 (= lt!369032 (addStillNotContains!181 lt!369034 lt!369035 lt!369031 lt!369036))))

(assert (=> b!821063 (= lt!369036 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!821063 (= lt!369031 (get!11623 (select (arr!21823 _values!788) #b00000000000000000000000000000000) (dynLambda!967 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!821063 (= lt!369035 (select (arr!21822 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!821063 (= lt!369034 call!35718)))

(assert (=> b!821063 (= e!456247 (+!1869 call!35718 (tuple2!9739 (select (arr!21822 _keys!976) #b00000000000000000000000000000000) (get!11623 (select (arr!21823 _values!788) #b00000000000000000000000000000000) (dynLambda!967 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!104761 () Bool)

(declare-fun e!456245 () Bool)

(assert (=> d!104761 e!456245))

(declare-fun res!560134 () Bool)

(assert (=> d!104761 (=> (not res!560134) (not e!456245))))

(assert (=> d!104761 (= res!560134 (not (contains!4166 lt!369033 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104761 (= lt!369033 e!456246)))

(declare-fun c!89228 () Bool)

(assert (=> d!104761 (= c!89228 (bvsge #b00000000000000000000000000000000 (size!22243 _keys!976)))))

(assert (=> d!104761 (validMask!0 mask!1312)))

(assert (=> d!104761 (= (getCurrentListMapNoExtraKeys!2322 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369033)))

(declare-fun b!821064 () Bool)

(assert (=> b!821064 (= e!456244 e!456248)))

(assert (=> b!821064 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22243 _keys!976)))))

(declare-fun res!560137 () Bool)

(assert (=> b!821064 (= res!560137 (contains!4166 lt!369033 (select (arr!21822 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821064 (=> (not res!560137) (not e!456248))))

(declare-fun b!821065 () Bool)

(assert (=> b!821065 (= e!456250 (= lt!369033 (getCurrentListMapNoExtraKeys!2322 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!821066 () Bool)

(assert (=> b!821066 (= e!456245 e!456244)))

(declare-fun c!89227 () Bool)

(declare-fun e!456249 () Bool)

(assert (=> b!821066 (= c!89227 e!456249)))

(declare-fun res!560135 () Bool)

(assert (=> b!821066 (=> (not res!560135) (not e!456249))))

(assert (=> b!821066 (= res!560135 (bvslt #b00000000000000000000000000000000 (size!22243 _keys!976)))))

(declare-fun b!821067 () Bool)

(assert (=> b!821067 (= e!456249 (validKeyInArray!0 (select (arr!21822 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821067 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!821068 () Bool)

(declare-fun res!560136 () Bool)

(assert (=> b!821068 (=> (not res!560136) (not e!456245))))

(assert (=> b!821068 (= res!560136 (not (contains!4166 lt!369033 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!821069 () Bool)

(assert (=> b!821069 (= e!456247 call!35718)))

(declare-fun b!821070 () Bool)

(assert (=> b!821070 (= e!456246 (ListLongMap!8562 Nil!15555))))

(assert (= (and d!104761 c!89228) b!821070))

(assert (= (and d!104761 (not c!89228)) b!821062))

(assert (= (and b!821062 c!89226) b!821063))

(assert (= (and b!821062 (not c!89226)) b!821069))

(assert (= (or b!821063 b!821069) bm!35715))

(assert (= (and d!104761 res!560134) b!821068))

(assert (= (and b!821068 res!560136) b!821066))

(assert (= (and b!821066 res!560135) b!821067))

(assert (= (and b!821066 c!89227) b!821064))

(assert (= (and b!821066 (not c!89227)) b!821060))

(assert (= (and b!821064 res!560137) b!821059))

(assert (= (and b!821060 c!89229) b!821065))

(assert (= (and b!821060 (not c!89229)) b!821061))

(declare-fun b_lambda!10995 () Bool)

(assert (=> (not b_lambda!10995) (not b!821059)))

(declare-fun t!21894 () Bool)

(declare-fun tb!4193 () Bool)

(assert (=> (and start!70676 (= defaultEntry!796 defaultEntry!796) t!21894) tb!4193))

(declare-fun result!7919 () Bool)

(assert (=> tb!4193 (= result!7919 tp_is_empty!14673)))

(assert (=> b!821059 t!21894))

(declare-fun b_and!21821 () Bool)

(assert (= b_and!21817 (and (=> t!21894 result!7919) b_and!21821)))

(declare-fun b_lambda!10997 () Bool)

(assert (=> (not b_lambda!10997) (not b!821063)))

(assert (=> b!821063 t!21894))

(declare-fun b_and!21823 () Bool)

(assert (= b_and!21821 (and (=> t!21894 result!7919) b_and!21823)))

(declare-fun m!762913 () Bool)

(assert (=> b!821068 m!762913))

(declare-fun m!762915 () Bool)

(assert (=> b!821063 m!762915))

(declare-fun m!762917 () Bool)

(assert (=> b!821063 m!762917))

(declare-fun m!762919 () Bool)

(assert (=> b!821063 m!762919))

(declare-fun m!762921 () Bool)

(assert (=> b!821063 m!762921))

(assert (=> b!821063 m!762915))

(assert (=> b!821063 m!762903))

(declare-fun m!762923 () Bool)

(assert (=> b!821063 m!762923))

(declare-fun m!762925 () Bool)

(assert (=> b!821063 m!762925))

(declare-fun m!762927 () Bool)

(assert (=> b!821063 m!762927))

(assert (=> b!821063 m!762925))

(assert (=> b!821063 m!762917))

(declare-fun m!762929 () Bool)

(assert (=> bm!35715 m!762929))

(assert (=> b!821065 m!762929))

(assert (=> b!821062 m!762903))

(assert (=> b!821062 m!762903))

(assert (=> b!821062 m!762905))

(declare-fun m!762931 () Bool)

(assert (=> d!104761 m!762931))

(assert (=> d!104761 m!762877))

(assert (=> b!821064 m!762903))

(assert (=> b!821064 m!762903))

(declare-fun m!762933 () Bool)

(assert (=> b!821064 m!762933))

(assert (=> b!821059 m!762915))

(assert (=> b!821059 m!762917))

(assert (=> b!821059 m!762919))

(assert (=> b!821059 m!762915))

(assert (=> b!821059 m!762903))

(assert (=> b!821059 m!762903))

(declare-fun m!762935 () Bool)

(assert (=> b!821059 m!762935))

(assert (=> b!821059 m!762917))

(declare-fun m!762937 () Bool)

(assert (=> b!821061 m!762937))

(assert (=> b!821067 m!762903))

(assert (=> b!821067 m!762903))

(assert (=> b!821067 m!762905))

(assert (=> b!820996 d!104761))

(declare-fun b!821073 () Bool)

(assert (=> b!821073 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22243 _keys!976)))))

(assert (=> b!821073 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22244 _values!788)))))

(declare-fun e!456255 () Bool)

(declare-fun lt!369040 () ListLongMap!8561)

(assert (=> b!821073 (= e!456255 (= (apply!356 lt!369040 (select (arr!21822 _keys!976) #b00000000000000000000000000000000)) (get!11623 (select (arr!21823 _values!788) #b00000000000000000000000000000000) (dynLambda!967 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!821074 () Bool)

(declare-fun e!456251 () Bool)

(declare-fun e!456257 () Bool)

(assert (=> b!821074 (= e!456251 e!456257)))

(declare-fun c!89233 () Bool)

(assert (=> b!821074 (= c!89233 (bvslt #b00000000000000000000000000000000 (size!22243 _keys!976)))))

(declare-fun b!821075 () Bool)

(assert (=> b!821075 (= e!456257 (isEmpty!638 lt!369040))))

(declare-fun b!821076 () Bool)

(declare-fun e!456253 () ListLongMap!8561)

(declare-fun e!456254 () ListLongMap!8561)

(assert (=> b!821076 (= e!456253 e!456254)))

(declare-fun c!89230 () Bool)

(assert (=> b!821076 (= c!89230 (validKeyInArray!0 (select (arr!21822 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35716 () Bool)

(declare-fun call!35719 () ListLongMap!8561)

(assert (=> bm!35716 (= call!35719 (getCurrentListMapNoExtraKeys!2322 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!821077 () Bool)

(declare-fun lt!369044 () Unit!28069)

(declare-fun lt!369039 () Unit!28069)

(assert (=> b!821077 (= lt!369044 lt!369039)))

(declare-fun lt!369041 () ListLongMap!8561)

(declare-fun lt!369038 () V!24565)

(declare-fun lt!369043 () (_ BitVec 64))

(declare-fun lt!369042 () (_ BitVec 64))

(assert (=> b!821077 (not (contains!4166 (+!1869 lt!369041 (tuple2!9739 lt!369042 lt!369038)) lt!369043))))

(assert (=> b!821077 (= lt!369039 (addStillNotContains!181 lt!369041 lt!369042 lt!369038 lt!369043))))

(assert (=> b!821077 (= lt!369043 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!821077 (= lt!369038 (get!11623 (select (arr!21823 _values!788) #b00000000000000000000000000000000) (dynLambda!967 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!821077 (= lt!369042 (select (arr!21822 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!821077 (= lt!369041 call!35719)))

(assert (=> b!821077 (= e!456254 (+!1869 call!35719 (tuple2!9739 (select (arr!21822 _keys!976) #b00000000000000000000000000000000) (get!11623 (select (arr!21823 _values!788) #b00000000000000000000000000000000) (dynLambda!967 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!104763 () Bool)

(declare-fun e!456252 () Bool)

(assert (=> d!104763 e!456252))

(declare-fun res!560138 () Bool)

(assert (=> d!104763 (=> (not res!560138) (not e!456252))))

(assert (=> d!104763 (= res!560138 (not (contains!4166 lt!369040 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104763 (= lt!369040 e!456253)))

(declare-fun c!89232 () Bool)

(assert (=> d!104763 (= c!89232 (bvsge #b00000000000000000000000000000000 (size!22243 _keys!976)))))

(assert (=> d!104763 (validMask!0 mask!1312)))

(assert (=> d!104763 (= (getCurrentListMapNoExtraKeys!2322 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369040)))

(declare-fun b!821078 () Bool)

(assert (=> b!821078 (= e!456251 e!456255)))

(assert (=> b!821078 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22243 _keys!976)))))

(declare-fun res!560141 () Bool)

(assert (=> b!821078 (= res!560141 (contains!4166 lt!369040 (select (arr!21822 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821078 (=> (not res!560141) (not e!456255))))

(declare-fun b!821079 () Bool)

(assert (=> b!821079 (= e!456257 (= lt!369040 (getCurrentListMapNoExtraKeys!2322 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!821080 () Bool)

(assert (=> b!821080 (= e!456252 e!456251)))

(declare-fun c!89231 () Bool)

(declare-fun e!456256 () Bool)

(assert (=> b!821080 (= c!89231 e!456256)))

(declare-fun res!560139 () Bool)

(assert (=> b!821080 (=> (not res!560139) (not e!456256))))

(assert (=> b!821080 (= res!560139 (bvslt #b00000000000000000000000000000000 (size!22243 _keys!976)))))

(declare-fun b!821081 () Bool)

(assert (=> b!821081 (= e!456256 (validKeyInArray!0 (select (arr!21822 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821081 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!821082 () Bool)

(declare-fun res!560140 () Bool)

(assert (=> b!821082 (=> (not res!560140) (not e!456252))))

(assert (=> b!821082 (= res!560140 (not (contains!4166 lt!369040 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!821083 () Bool)

(assert (=> b!821083 (= e!456254 call!35719)))

(declare-fun b!821084 () Bool)

(assert (=> b!821084 (= e!456253 (ListLongMap!8562 Nil!15555))))

(assert (= (and d!104763 c!89232) b!821084))

(assert (= (and d!104763 (not c!89232)) b!821076))

(assert (= (and b!821076 c!89230) b!821077))

(assert (= (and b!821076 (not c!89230)) b!821083))

(assert (= (or b!821077 b!821083) bm!35716))

(assert (= (and d!104763 res!560138) b!821082))

(assert (= (and b!821082 res!560140) b!821080))

(assert (= (and b!821080 res!560139) b!821081))

(assert (= (and b!821080 c!89231) b!821078))

(assert (= (and b!821080 (not c!89231)) b!821074))

(assert (= (and b!821078 res!560141) b!821073))

(assert (= (and b!821074 c!89233) b!821079))

(assert (= (and b!821074 (not c!89233)) b!821075))

(declare-fun b_lambda!10999 () Bool)

(assert (=> (not b_lambda!10999) (not b!821073)))

(assert (=> b!821073 t!21894))

(declare-fun b_and!21825 () Bool)

(assert (= b_and!21823 (and (=> t!21894 result!7919) b_and!21825)))

(declare-fun b_lambda!11001 () Bool)

(assert (=> (not b_lambda!11001) (not b!821077)))

(assert (=> b!821077 t!21894))

(declare-fun b_and!21827 () Bool)

(assert (= b_and!21825 (and (=> t!21894 result!7919) b_and!21827)))

(declare-fun m!762939 () Bool)

(assert (=> b!821082 m!762939))

(assert (=> b!821077 m!762915))

(assert (=> b!821077 m!762917))

(assert (=> b!821077 m!762919))

(declare-fun m!762941 () Bool)

(assert (=> b!821077 m!762941))

(assert (=> b!821077 m!762915))

(assert (=> b!821077 m!762903))

(declare-fun m!762943 () Bool)

(assert (=> b!821077 m!762943))

(declare-fun m!762945 () Bool)

(assert (=> b!821077 m!762945))

(declare-fun m!762947 () Bool)

(assert (=> b!821077 m!762947))

(assert (=> b!821077 m!762945))

(assert (=> b!821077 m!762917))

(declare-fun m!762949 () Bool)

(assert (=> bm!35716 m!762949))

(assert (=> b!821079 m!762949))

(assert (=> b!821076 m!762903))

(assert (=> b!821076 m!762903))

(assert (=> b!821076 m!762905))

(declare-fun m!762951 () Bool)

(assert (=> d!104763 m!762951))

(assert (=> d!104763 m!762877))

(assert (=> b!821078 m!762903))

(assert (=> b!821078 m!762903))

(declare-fun m!762953 () Bool)

(assert (=> b!821078 m!762953))

(assert (=> b!821073 m!762915))

(assert (=> b!821073 m!762917))

(assert (=> b!821073 m!762919))

(assert (=> b!821073 m!762915))

(assert (=> b!821073 m!762903))

(assert (=> b!821073 m!762903))

(declare-fun m!762955 () Bool)

(assert (=> b!821073 m!762955))

(assert (=> b!821073 m!762917))

(declare-fun m!762957 () Bool)

(assert (=> b!821075 m!762957))

(assert (=> b!821081 m!762903))

(assert (=> b!821081 m!762903))

(assert (=> b!821081 m!762905))

(assert (=> b!820996 d!104763))

(declare-fun d!104765 () Bool)

(assert (=> d!104765 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70676 d!104765))

(declare-fun d!104767 () Bool)

(assert (=> d!104767 (= (array_inv!17443 _keys!976) (bvsge (size!22243 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70676 d!104767))

(declare-fun d!104769 () Bool)

(assert (=> d!104769 (= (array_inv!17444 _values!788) (bvsge (size!22244 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70676 d!104769))

(declare-fun b!821093 () Bool)

(declare-fun e!456265 () Bool)

(declare-fun e!456266 () Bool)

(assert (=> b!821093 (= e!456265 e!456266)))

(declare-fun lt!369052 () (_ BitVec 64))

(assert (=> b!821093 (= lt!369052 (select (arr!21822 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!369051 () Unit!28069)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45540 (_ BitVec 64) (_ BitVec 32)) Unit!28069)

(assert (=> b!821093 (= lt!369051 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!369052 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!821093 (arrayContainsKey!0 _keys!976 lt!369052 #b00000000000000000000000000000000)))

(declare-fun lt!369053 () Unit!28069)

(assert (=> b!821093 (= lt!369053 lt!369051)))

(declare-fun res!560147 () Bool)

(declare-datatypes ((SeekEntryResult!8728 0))(
  ( (MissingZero!8728 (index!37283 (_ BitVec 32))) (Found!8728 (index!37284 (_ BitVec 32))) (Intermediate!8728 (undefined!9540 Bool) (index!37285 (_ BitVec 32)) (x!69205 (_ BitVec 32))) (Undefined!8728) (MissingVacant!8728 (index!37286 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45540 (_ BitVec 32)) SeekEntryResult!8728)

(assert (=> b!821093 (= res!560147 (= (seekEntryOrOpen!0 (select (arr!21822 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8728 #b00000000000000000000000000000000)))))

(assert (=> b!821093 (=> (not res!560147) (not e!456266))))

(declare-fun b!821094 () Bool)

(declare-fun call!35722 () Bool)

(assert (=> b!821094 (= e!456266 call!35722)))

(declare-fun b!821095 () Bool)

(assert (=> b!821095 (= e!456265 call!35722)))

(declare-fun b!821096 () Bool)

(declare-fun e!456264 () Bool)

(assert (=> b!821096 (= e!456264 e!456265)))

(declare-fun c!89236 () Bool)

(assert (=> b!821096 (= c!89236 (validKeyInArray!0 (select (arr!21822 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104771 () Bool)

(declare-fun res!560146 () Bool)

(assert (=> d!104771 (=> res!560146 e!456264)))

(assert (=> d!104771 (= res!560146 (bvsge #b00000000000000000000000000000000 (size!22243 _keys!976)))))

(assert (=> d!104771 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!456264)))

(declare-fun bm!35719 () Bool)

(assert (=> bm!35719 (= call!35722 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(assert (= (and d!104771 (not res!560146)) b!821096))

(assert (= (and b!821096 c!89236) b!821093))

(assert (= (and b!821096 (not c!89236)) b!821095))

(assert (= (and b!821093 res!560147) b!821094))

(assert (= (or b!821094 b!821095) bm!35719))

(assert (=> b!821093 m!762903))

(declare-fun m!762959 () Bool)

(assert (=> b!821093 m!762959))

(declare-fun m!762961 () Bool)

(assert (=> b!821093 m!762961))

(assert (=> b!821093 m!762903))

(declare-fun m!762963 () Bool)

(assert (=> b!821093 m!762963))

(assert (=> b!821096 m!762903))

(assert (=> b!821096 m!762903))

(assert (=> b!821096 m!762905))

(declare-fun m!762965 () Bool)

(assert (=> bm!35719 m!762965))

(assert (=> b!820993 d!104771))

(declare-fun condMapEmpty!23620 () Bool)

(declare-fun mapDefault!23620 () ValueCell!6921)

(assert (=> mapNonEmpty!23614 (= condMapEmpty!23620 (= mapRest!23614 ((as const (Array (_ BitVec 32) ValueCell!6921)) mapDefault!23620)))))

(declare-fun e!456272 () Bool)

(declare-fun mapRes!23620 () Bool)

(assert (=> mapNonEmpty!23614 (= tp!45628 (and e!456272 mapRes!23620))))

(declare-fun b!821103 () Bool)

(declare-fun e!456271 () Bool)

(assert (=> b!821103 (= e!456271 tp_is_empty!14673)))

(declare-fun mapIsEmpty!23620 () Bool)

(assert (=> mapIsEmpty!23620 mapRes!23620))

(declare-fun b!821104 () Bool)

(assert (=> b!821104 (= e!456272 tp_is_empty!14673)))

(declare-fun mapNonEmpty!23620 () Bool)

(declare-fun tp!45637 () Bool)

(assert (=> mapNonEmpty!23620 (= mapRes!23620 (and tp!45637 e!456271))))

(declare-fun mapKey!23620 () (_ BitVec 32))

(declare-fun mapValue!23620 () ValueCell!6921)

(declare-fun mapRest!23620 () (Array (_ BitVec 32) ValueCell!6921))

(assert (=> mapNonEmpty!23620 (= mapRest!23614 (store mapRest!23620 mapKey!23620 mapValue!23620))))

(assert (= (and mapNonEmpty!23614 condMapEmpty!23620) mapIsEmpty!23620))

(assert (= (and mapNonEmpty!23614 (not condMapEmpty!23620)) mapNonEmpty!23620))

(assert (= (and mapNonEmpty!23620 ((_ is ValueCellFull!6921) mapValue!23620)) b!821103))

(assert (= (and mapNonEmpty!23614 ((_ is ValueCellFull!6921) mapDefault!23620)) b!821104))

(declare-fun m!762967 () Bool)

(assert (=> mapNonEmpty!23620 m!762967))

(declare-fun b_lambda!11003 () Bool)

(assert (= b_lambda!10999 (or (and start!70676 b_free!12963) b_lambda!11003)))

(declare-fun b_lambda!11005 () Bool)

(assert (= b_lambda!11001 (or (and start!70676 b_free!12963) b_lambda!11005)))

(declare-fun b_lambda!11007 () Bool)

(assert (= b_lambda!10995 (or (and start!70676 b_free!12963) b_lambda!11007)))

(declare-fun b_lambda!11009 () Bool)

(assert (= b_lambda!10997 (or (and start!70676 b_free!12963) b_lambda!11009)))

(check-sat (not b!821076) (not b!821082) (not b!821064) (not bm!35715) (not b_lambda!11009) (not d!104761) (not b_next!12963) (not mapNonEmpty!23620) (not b!821063) (not b!821061) (not b!821079) (not bm!35716) (not b!821032) (not d!104759) (not bm!35719) (not b!821031) (not b!821093) (not b!821062) (not b_lambda!11005) (not b!821096) (not b!821081) (not d!104763) (not b!821068) (not b!821059) (not b!821073) (not b!821078) tp_is_empty!14673 (not b!821067) b_and!21827 (not b_lambda!11003) (not bm!35712) (not b!821030) (not b_lambda!11007) (not b!821075) (not b!821077) (not b!821065))
(check-sat b_and!21827 (not b_next!12963))
