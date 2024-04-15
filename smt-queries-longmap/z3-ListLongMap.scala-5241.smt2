; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70506 () Bool)

(assert start!70506)

(declare-fun b_free!12853 () Bool)

(declare-fun b_next!12853 () Bool)

(assert (=> start!70506 (= b_free!12853 (not b_next!12853))))

(declare-fun tp!45292 () Bool)

(declare-fun b_and!21657 () Bool)

(assert (=> start!70506 (= tp!45292 b_and!21657)))

(declare-fun mapIsEmpty!23443 () Bool)

(declare-fun mapRes!23443 () Bool)

(assert (=> mapIsEmpty!23443 mapRes!23443))

(declare-fun b!819029 () Bool)

(declare-fun e!454805 () Bool)

(declare-fun tp_is_empty!14563 () Bool)

(assert (=> b!819029 (= e!454805 tp_is_empty!14563)))

(declare-datatypes ((V!24419 0))(
  ( (V!24420 (val!7329 Int)) )
))
(declare-datatypes ((tuple2!9662 0))(
  ( (tuple2!9663 (_1!4842 (_ BitVec 64)) (_2!4842 V!24419)) )
))
(declare-datatypes ((List!15482 0))(
  ( (Nil!15479) (Cons!15478 (h!16607 tuple2!9662) (t!21802 List!15482)) )
))
(declare-datatypes ((ListLongMap!8475 0))(
  ( (ListLongMap!8476 (toList!4253 List!15482)) )
))
(declare-fun lt!367346 () ListLongMap!8475)

(declare-fun zeroValueAfter!34 () V!24419)

(declare-fun e!454806 () Bool)

(declare-fun b!819030 () Bool)

(declare-fun lt!367338 () ListLongMap!8475)

(declare-fun +!1874 (ListLongMap!8475 tuple2!9662) ListLongMap!8475)

(assert (=> b!819030 (= e!454806 (= lt!367338 (+!1874 lt!367346 (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819031 () Bool)

(declare-fun e!454807 () Bool)

(assert (=> b!819031 (= e!454807 (and e!454805 mapRes!23443))))

(declare-fun condMapEmpty!23443 () Bool)

(declare-datatypes ((ValueCell!6866 0))(
  ( (ValueCellFull!6866 (v!9752 V!24419)) (EmptyCell!6866) )
))
(declare-datatypes ((array!45297 0))(
  ( (array!45298 (arr!21703 (Array (_ BitVec 32) ValueCell!6866)) (size!22124 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45297)

(declare-fun mapDefault!23443 () ValueCell!6866)

(assert (=> b!819031 (= condMapEmpty!23443 (= (arr!21703 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6866)) mapDefault!23443)))))

(declare-fun b!819032 () Bool)

(declare-fun e!454808 () Bool)

(declare-fun e!454802 () Bool)

(assert (=> b!819032 (= e!454808 e!454802)))

(declare-fun res!558983 () Bool)

(assert (=> b!819032 (=> res!558983 e!454802)))

(declare-fun lt!367340 () tuple2!9662)

(declare-fun lt!367345 () tuple2!9662)

(assert (=> b!819032 (= res!558983 (not (= lt!367338 (+!1874 (+!1874 lt!367346 lt!367345) lt!367340))))))

(declare-fun lt!367342 () ListLongMap!8475)

(declare-fun lt!367339 () ListLongMap!8475)

(assert (=> b!819032 (= (+!1874 lt!367342 lt!367340) (+!1874 lt!367339 lt!367340))))

(declare-fun zeroValueBefore!34 () V!24419)

(declare-datatypes ((Unit!27931 0))(
  ( (Unit!27932) )
))
(declare-fun lt!367341 () Unit!27931)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!189 (ListLongMap!8475 (_ BitVec 64) V!24419 V!24419) Unit!27931)

(assert (=> b!819032 (= lt!367341 (addSameAsAddTwiceSameKeyDiffValues!189 lt!367342 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819032 (= lt!367340 (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!819032 e!454806))

(declare-fun res!558980 () Bool)

(assert (=> b!819032 (=> (not res!558980) (not e!454806))))

(declare-fun lt!367343 () ListLongMap!8475)

(assert (=> b!819032 (= res!558980 (= lt!367343 lt!367339))))

(assert (=> b!819032 (= lt!367339 (+!1874 lt!367342 lt!367345))))

(assert (=> b!819032 (= lt!367345 (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!45299 0))(
  ( (array!45300 (arr!21704 (Array (_ BitVec 32) (_ BitVec 64))) (size!22125 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45299)

(declare-fun minValue!754 () V!24419)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2402 (array!45299 array!45297 (_ BitVec 32) (_ BitVec 32) V!24419 V!24419 (_ BitVec 32) Int) ListLongMap!8475)

(assert (=> b!819032 (= lt!367338 (getCurrentListMap!2402 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819032 (= lt!367343 (getCurrentListMap!2402 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819033 () Bool)

(declare-fun res!558982 () Bool)

(declare-fun e!454801 () Bool)

(assert (=> b!819033 (=> (not res!558982) (not e!454801))))

(declare-datatypes ((List!15483 0))(
  ( (Nil!15480) (Cons!15479 (h!16608 (_ BitVec 64)) (t!21803 List!15483)) )
))
(declare-fun arrayNoDuplicates!0 (array!45299 (_ BitVec 32) List!15483) Bool)

(assert (=> b!819033 (= res!558982 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15480))))

(declare-fun b!819034 () Bool)

(assert (=> b!819034 (= e!454801 (not e!454808))))

(declare-fun res!558977 () Bool)

(assert (=> b!819034 (=> res!558977 e!454808)))

(assert (=> b!819034 (= res!558977 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!819034 (= lt!367342 lt!367346)))

(declare-fun lt!367344 () Unit!27931)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!401 (array!45299 array!45297 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24419 V!24419 V!24419 V!24419 (_ BitVec 32) Int) Unit!27931)

(assert (=> b!819034 (= lt!367344 (lemmaNoChangeToArrayThenSameMapNoExtras!401 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2308 (array!45299 array!45297 (_ BitVec 32) (_ BitVec 32) V!24419 V!24419 (_ BitVec 32) Int) ListLongMap!8475)

(assert (=> b!819034 (= lt!367346 (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819034 (= lt!367342 (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23443 () Bool)

(declare-fun tp!45291 () Bool)

(declare-fun e!454804 () Bool)

(assert (=> mapNonEmpty!23443 (= mapRes!23443 (and tp!45291 e!454804))))

(declare-fun mapKey!23443 () (_ BitVec 32))

(declare-fun mapValue!23443 () ValueCell!6866)

(declare-fun mapRest!23443 () (Array (_ BitVec 32) ValueCell!6866))

(assert (=> mapNonEmpty!23443 (= (arr!21703 _values!788) (store mapRest!23443 mapKey!23443 mapValue!23443))))

(declare-fun b!819035 () Bool)

(assert (=> b!819035 (= e!454804 tp_is_empty!14563)))

(declare-fun b!819036 () Bool)

(declare-fun res!558978 () Bool)

(assert (=> b!819036 (=> (not res!558978) (not e!454801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45299 (_ BitVec 32)) Bool)

(assert (=> b!819036 (= res!558978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!558981 () Bool)

(assert (=> start!70506 (=> (not res!558981) (not e!454801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70506 (= res!558981 (validMask!0 mask!1312))))

(assert (=> start!70506 e!454801))

(assert (=> start!70506 tp_is_empty!14563))

(declare-fun array_inv!17413 (array!45299) Bool)

(assert (=> start!70506 (array_inv!17413 _keys!976)))

(assert (=> start!70506 true))

(declare-fun array_inv!17414 (array!45297) Bool)

(assert (=> start!70506 (and (array_inv!17414 _values!788) e!454807)))

(assert (=> start!70506 tp!45292))

(declare-fun b!819037 () Bool)

(assert (=> b!819037 (= e!454802 (bvsle #b00000000000000000000000000000000 (size!22125 _keys!976)))))

(declare-fun b!819038 () Bool)

(declare-fun res!558979 () Bool)

(assert (=> b!819038 (=> (not res!558979) (not e!454801))))

(assert (=> b!819038 (= res!558979 (and (= (size!22124 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22125 _keys!976) (size!22124 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70506 res!558981) b!819038))

(assert (= (and b!819038 res!558979) b!819036))

(assert (= (and b!819036 res!558978) b!819033))

(assert (= (and b!819033 res!558982) b!819034))

(assert (= (and b!819034 (not res!558977)) b!819032))

(assert (= (and b!819032 res!558980) b!819030))

(assert (= (and b!819032 (not res!558983)) b!819037))

(assert (= (and b!819031 condMapEmpty!23443) mapIsEmpty!23443))

(assert (= (and b!819031 (not condMapEmpty!23443)) mapNonEmpty!23443))

(get-info :version)

(assert (= (and mapNonEmpty!23443 ((_ is ValueCellFull!6866) mapValue!23443)) b!819035))

(assert (= (and b!819031 ((_ is ValueCellFull!6866) mapDefault!23443)) b!819029))

(assert (= start!70506 b!819031))

(declare-fun m!760109 () Bool)

(assert (=> b!819033 m!760109))

(declare-fun m!760111 () Bool)

(assert (=> b!819032 m!760111))

(declare-fun m!760113 () Bool)

(assert (=> b!819032 m!760113))

(declare-fun m!760115 () Bool)

(assert (=> b!819032 m!760115))

(declare-fun m!760117 () Bool)

(assert (=> b!819032 m!760117))

(assert (=> b!819032 m!760111))

(declare-fun m!760119 () Bool)

(assert (=> b!819032 m!760119))

(declare-fun m!760121 () Bool)

(assert (=> b!819032 m!760121))

(declare-fun m!760123 () Bool)

(assert (=> b!819032 m!760123))

(declare-fun m!760125 () Bool)

(assert (=> b!819032 m!760125))

(declare-fun m!760127 () Bool)

(assert (=> b!819030 m!760127))

(declare-fun m!760129 () Bool)

(assert (=> mapNonEmpty!23443 m!760129))

(declare-fun m!760131 () Bool)

(assert (=> b!819034 m!760131))

(declare-fun m!760133 () Bool)

(assert (=> b!819034 m!760133))

(declare-fun m!760135 () Bool)

(assert (=> b!819034 m!760135))

(declare-fun m!760137 () Bool)

(assert (=> start!70506 m!760137))

(declare-fun m!760139 () Bool)

(assert (=> start!70506 m!760139))

(declare-fun m!760141 () Bool)

(assert (=> start!70506 m!760141))

(declare-fun m!760143 () Bool)

(assert (=> b!819036 m!760143))

(check-sat (not b!819030) (not b_next!12853) (not b!819032) (not b!819036) tp_is_empty!14563 b_and!21657 (not start!70506) (not b!819033) (not b!819034) (not mapNonEmpty!23443))
(check-sat b_and!21657 (not b_next!12853))
(get-model)

(declare-fun d!104457 () Bool)

(assert (=> d!104457 (= (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367403 () Unit!27931)

(declare-fun choose!1402 (array!45299 array!45297 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24419 V!24419 V!24419 V!24419 (_ BitVec 32) Int) Unit!27931)

(assert (=> d!104457 (= lt!367403 (choose!1402 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104457 (validMask!0 mask!1312)))

(assert (=> d!104457 (= (lemmaNoChangeToArrayThenSameMapNoExtras!401 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!367403)))

(declare-fun bs!22808 () Bool)

(assert (= bs!22808 d!104457))

(assert (=> bs!22808 m!760135))

(assert (=> bs!22808 m!760133))

(declare-fun m!760217 () Bool)

(assert (=> bs!22808 m!760217))

(assert (=> bs!22808 m!760137))

(assert (=> b!819034 d!104457))

(declare-fun b!819123 () Bool)

(declare-fun e!454876 () Bool)

(declare-fun e!454874 () Bool)

(assert (=> b!819123 (= e!454876 e!454874)))

(declare-fun c!89063 () Bool)

(declare-fun e!454875 () Bool)

(assert (=> b!819123 (= c!89063 e!454875)))

(declare-fun res!559037 () Bool)

(assert (=> b!819123 (=> (not res!559037) (not e!454875))))

(assert (=> b!819123 (= res!559037 (bvslt #b00000000000000000000000000000000 (size!22125 _keys!976)))))

(declare-fun b!819124 () Bool)

(declare-fun res!559035 () Bool)

(assert (=> b!819124 (=> (not res!559035) (not e!454876))))

(declare-fun lt!367421 () ListLongMap!8475)

(declare-fun contains!4138 (ListLongMap!8475 (_ BitVec 64)) Bool)

(assert (=> b!819124 (= res!559035 (not (contains!4138 lt!367421 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!819125 () Bool)

(declare-fun lt!367419 () Unit!27931)

(declare-fun lt!367418 () Unit!27931)

(assert (=> b!819125 (= lt!367419 lt!367418)))

(declare-fun lt!367422 () ListLongMap!8475)

(declare-fun lt!367420 () V!24419)

(declare-fun lt!367423 () (_ BitVec 64))

(declare-fun lt!367424 () (_ BitVec 64))

(assert (=> b!819125 (not (contains!4138 (+!1874 lt!367422 (tuple2!9663 lt!367423 lt!367420)) lt!367424))))

(declare-fun addStillNotContains!180 (ListLongMap!8475 (_ BitVec 64) V!24419 (_ BitVec 64)) Unit!27931)

(assert (=> b!819125 (= lt!367418 (addStillNotContains!180 lt!367422 lt!367423 lt!367420 lt!367424))))

(assert (=> b!819125 (= lt!367424 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11591 (ValueCell!6866 V!24419) V!24419)

(declare-fun dynLambda!968 (Int (_ BitVec 64)) V!24419)

(assert (=> b!819125 (= lt!367420 (get!11591 (select (arr!21703 _values!788) #b00000000000000000000000000000000) (dynLambda!968 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!819125 (= lt!367423 (select (arr!21704 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35613 () ListLongMap!8475)

(assert (=> b!819125 (= lt!367422 call!35613)))

(declare-fun e!454871 () ListLongMap!8475)

(assert (=> b!819125 (= e!454871 (+!1874 call!35613 (tuple2!9663 (select (arr!21704 _keys!976) #b00000000000000000000000000000000) (get!11591 (select (arr!21703 _values!788) #b00000000000000000000000000000000) (dynLambda!968 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!104459 () Bool)

(assert (=> d!104459 e!454876))

(declare-fun res!559034 () Bool)

(assert (=> d!104459 (=> (not res!559034) (not e!454876))))

(assert (=> d!104459 (= res!559034 (not (contains!4138 lt!367421 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!454872 () ListLongMap!8475)

(assert (=> d!104459 (= lt!367421 e!454872)))

(declare-fun c!89064 () Bool)

(assert (=> d!104459 (= c!89064 (bvsge #b00000000000000000000000000000000 (size!22125 _keys!976)))))

(assert (=> d!104459 (validMask!0 mask!1312)))

(assert (=> d!104459 (= (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!367421)))

(declare-fun b!819126 () Bool)

(declare-fun e!454877 () Bool)

(assert (=> b!819126 (= e!454874 e!454877)))

(assert (=> b!819126 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22125 _keys!976)))))

(declare-fun res!559036 () Bool)

(assert (=> b!819126 (= res!559036 (contains!4138 lt!367421 (select (arr!21704 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!819126 (=> (not res!559036) (not e!454877))))

(declare-fun bm!35610 () Bool)

(assert (=> bm!35610 (= call!35613 (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!819127 () Bool)

(declare-fun e!454873 () Bool)

(declare-fun isEmpty!641 (ListLongMap!8475) Bool)

(assert (=> b!819127 (= e!454873 (isEmpty!641 lt!367421))))

(declare-fun b!819128 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!819128 (= e!454875 (validKeyInArray!0 (select (arr!21704 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!819128 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!819129 () Bool)

(assert (=> b!819129 (= e!454874 e!454873)))

(declare-fun c!89061 () Bool)

(assert (=> b!819129 (= c!89061 (bvslt #b00000000000000000000000000000000 (size!22125 _keys!976)))))

(declare-fun b!819130 () Bool)

(assert (=> b!819130 (= e!454873 (= lt!367421 (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!819131 () Bool)

(assert (=> b!819131 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22125 _keys!976)))))

(assert (=> b!819131 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22124 _values!788)))))

(declare-fun apply!354 (ListLongMap!8475 (_ BitVec 64)) V!24419)

(assert (=> b!819131 (= e!454877 (= (apply!354 lt!367421 (select (arr!21704 _keys!976) #b00000000000000000000000000000000)) (get!11591 (select (arr!21703 _values!788) #b00000000000000000000000000000000) (dynLambda!968 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!819132 () Bool)

(assert (=> b!819132 (= e!454872 (ListLongMap!8476 Nil!15479))))

(declare-fun b!819133 () Bool)

(assert (=> b!819133 (= e!454871 call!35613)))

(declare-fun b!819134 () Bool)

(assert (=> b!819134 (= e!454872 e!454871)))

(declare-fun c!89062 () Bool)

(assert (=> b!819134 (= c!89062 (validKeyInArray!0 (select (arr!21704 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104459 c!89064) b!819132))

(assert (= (and d!104459 (not c!89064)) b!819134))

(assert (= (and b!819134 c!89062) b!819125))

(assert (= (and b!819134 (not c!89062)) b!819133))

(assert (= (or b!819125 b!819133) bm!35610))

(assert (= (and d!104459 res!559034) b!819124))

(assert (= (and b!819124 res!559035) b!819123))

(assert (= (and b!819123 res!559037) b!819128))

(assert (= (and b!819123 c!89063) b!819126))

(assert (= (and b!819123 (not c!89063)) b!819129))

(assert (= (and b!819126 res!559036) b!819131))

(assert (= (and b!819129 c!89061) b!819130))

(assert (= (and b!819129 (not c!89061)) b!819127))

(declare-fun b_lambda!10929 () Bool)

(assert (=> (not b_lambda!10929) (not b!819125)))

(declare-fun t!21807 () Bool)

(declare-fun tb!4181 () Bool)

(assert (=> (and start!70506 (= defaultEntry!796 defaultEntry!796) t!21807) tb!4181))

(declare-fun result!7899 () Bool)

(assert (=> tb!4181 (= result!7899 tp_is_empty!14563)))

(assert (=> b!819125 t!21807))

(declare-fun b_and!21663 () Bool)

(assert (= b_and!21657 (and (=> t!21807 result!7899) b_and!21663)))

(declare-fun b_lambda!10931 () Bool)

(assert (=> (not b_lambda!10931) (not b!819131)))

(assert (=> b!819131 t!21807))

(declare-fun b_and!21665 () Bool)

(assert (= b_and!21663 (and (=> t!21807 result!7899) b_and!21665)))

(declare-fun m!760219 () Bool)

(assert (=> b!819130 m!760219))

(declare-fun m!760221 () Bool)

(assert (=> b!819127 m!760221))

(declare-fun m!760223 () Bool)

(assert (=> b!819131 m!760223))

(declare-fun m!760225 () Bool)

(assert (=> b!819131 m!760225))

(declare-fun m!760227 () Bool)

(assert (=> b!819131 m!760227))

(declare-fun m!760229 () Bool)

(assert (=> b!819131 m!760229))

(assert (=> b!819131 m!760223))

(assert (=> b!819131 m!760229))

(assert (=> b!819131 m!760227))

(declare-fun m!760231 () Bool)

(assert (=> b!819131 m!760231))

(assert (=> b!819125 m!760227))

(declare-fun m!760233 () Bool)

(assert (=> b!819125 m!760233))

(declare-fun m!760235 () Bool)

(assert (=> b!819125 m!760235))

(declare-fun m!760237 () Bool)

(assert (=> b!819125 m!760237))

(assert (=> b!819125 m!760229))

(declare-fun m!760239 () Bool)

(assert (=> b!819125 m!760239))

(assert (=> b!819125 m!760223))

(assert (=> b!819125 m!760229))

(assert (=> b!819125 m!760227))

(assert (=> b!819125 m!760231))

(assert (=> b!819125 m!760233))

(assert (=> b!819134 m!760223))

(assert (=> b!819134 m!760223))

(declare-fun m!760241 () Bool)

(assert (=> b!819134 m!760241))

(assert (=> b!819126 m!760223))

(assert (=> b!819126 m!760223))

(declare-fun m!760243 () Bool)

(assert (=> b!819126 m!760243))

(declare-fun m!760245 () Bool)

(assert (=> d!104459 m!760245))

(assert (=> d!104459 m!760137))

(assert (=> bm!35610 m!760219))

(assert (=> b!819128 m!760223))

(assert (=> b!819128 m!760223))

(assert (=> b!819128 m!760241))

(declare-fun m!760247 () Bool)

(assert (=> b!819124 m!760247))

(assert (=> b!819034 d!104459))

(declare-fun b!819137 () Bool)

(declare-fun e!454883 () Bool)

(declare-fun e!454881 () Bool)

(assert (=> b!819137 (= e!454883 e!454881)))

(declare-fun c!89067 () Bool)

(declare-fun e!454882 () Bool)

(assert (=> b!819137 (= c!89067 e!454882)))

(declare-fun res!559041 () Bool)

(assert (=> b!819137 (=> (not res!559041) (not e!454882))))

(assert (=> b!819137 (= res!559041 (bvslt #b00000000000000000000000000000000 (size!22125 _keys!976)))))

(declare-fun b!819138 () Bool)

(declare-fun res!559039 () Bool)

(assert (=> b!819138 (=> (not res!559039) (not e!454883))))

(declare-fun lt!367428 () ListLongMap!8475)

(assert (=> b!819138 (= res!559039 (not (contains!4138 lt!367428 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!819139 () Bool)

(declare-fun lt!367426 () Unit!27931)

(declare-fun lt!367425 () Unit!27931)

(assert (=> b!819139 (= lt!367426 lt!367425)))

(declare-fun lt!367431 () (_ BitVec 64))

(declare-fun lt!367430 () (_ BitVec 64))

(declare-fun lt!367429 () ListLongMap!8475)

(declare-fun lt!367427 () V!24419)

(assert (=> b!819139 (not (contains!4138 (+!1874 lt!367429 (tuple2!9663 lt!367430 lt!367427)) lt!367431))))

(assert (=> b!819139 (= lt!367425 (addStillNotContains!180 lt!367429 lt!367430 lt!367427 lt!367431))))

(assert (=> b!819139 (= lt!367431 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!819139 (= lt!367427 (get!11591 (select (arr!21703 _values!788) #b00000000000000000000000000000000) (dynLambda!968 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!819139 (= lt!367430 (select (arr!21704 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35614 () ListLongMap!8475)

(assert (=> b!819139 (= lt!367429 call!35614)))

(declare-fun e!454878 () ListLongMap!8475)

(assert (=> b!819139 (= e!454878 (+!1874 call!35614 (tuple2!9663 (select (arr!21704 _keys!976) #b00000000000000000000000000000000) (get!11591 (select (arr!21703 _values!788) #b00000000000000000000000000000000) (dynLambda!968 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!104461 () Bool)

(assert (=> d!104461 e!454883))

(declare-fun res!559038 () Bool)

(assert (=> d!104461 (=> (not res!559038) (not e!454883))))

(assert (=> d!104461 (= res!559038 (not (contains!4138 lt!367428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!454879 () ListLongMap!8475)

(assert (=> d!104461 (= lt!367428 e!454879)))

(declare-fun c!89068 () Bool)

(assert (=> d!104461 (= c!89068 (bvsge #b00000000000000000000000000000000 (size!22125 _keys!976)))))

(assert (=> d!104461 (validMask!0 mask!1312)))

(assert (=> d!104461 (= (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!367428)))

(declare-fun b!819140 () Bool)

(declare-fun e!454884 () Bool)

(assert (=> b!819140 (= e!454881 e!454884)))

(assert (=> b!819140 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22125 _keys!976)))))

(declare-fun res!559040 () Bool)

(assert (=> b!819140 (= res!559040 (contains!4138 lt!367428 (select (arr!21704 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!819140 (=> (not res!559040) (not e!454884))))

(declare-fun bm!35611 () Bool)

(assert (=> bm!35611 (= call!35614 (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!819141 () Bool)

(declare-fun e!454880 () Bool)

(assert (=> b!819141 (= e!454880 (isEmpty!641 lt!367428))))

(declare-fun b!819142 () Bool)

(assert (=> b!819142 (= e!454882 (validKeyInArray!0 (select (arr!21704 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!819142 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!819143 () Bool)

(assert (=> b!819143 (= e!454881 e!454880)))

(declare-fun c!89065 () Bool)

(assert (=> b!819143 (= c!89065 (bvslt #b00000000000000000000000000000000 (size!22125 _keys!976)))))

(declare-fun b!819144 () Bool)

(assert (=> b!819144 (= e!454880 (= lt!367428 (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!819145 () Bool)

(assert (=> b!819145 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22125 _keys!976)))))

(assert (=> b!819145 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22124 _values!788)))))

(assert (=> b!819145 (= e!454884 (= (apply!354 lt!367428 (select (arr!21704 _keys!976) #b00000000000000000000000000000000)) (get!11591 (select (arr!21703 _values!788) #b00000000000000000000000000000000) (dynLambda!968 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!819146 () Bool)

(assert (=> b!819146 (= e!454879 (ListLongMap!8476 Nil!15479))))

(declare-fun b!819147 () Bool)

(assert (=> b!819147 (= e!454878 call!35614)))

(declare-fun b!819148 () Bool)

(assert (=> b!819148 (= e!454879 e!454878)))

(declare-fun c!89066 () Bool)

(assert (=> b!819148 (= c!89066 (validKeyInArray!0 (select (arr!21704 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104461 c!89068) b!819146))

(assert (= (and d!104461 (not c!89068)) b!819148))

(assert (= (and b!819148 c!89066) b!819139))

(assert (= (and b!819148 (not c!89066)) b!819147))

(assert (= (or b!819139 b!819147) bm!35611))

(assert (= (and d!104461 res!559038) b!819138))

(assert (= (and b!819138 res!559039) b!819137))

(assert (= (and b!819137 res!559041) b!819142))

(assert (= (and b!819137 c!89067) b!819140))

(assert (= (and b!819137 (not c!89067)) b!819143))

(assert (= (and b!819140 res!559040) b!819145))

(assert (= (and b!819143 c!89065) b!819144))

(assert (= (and b!819143 (not c!89065)) b!819141))

(declare-fun b_lambda!10933 () Bool)

(assert (=> (not b_lambda!10933) (not b!819139)))

(assert (=> b!819139 t!21807))

(declare-fun b_and!21667 () Bool)

(assert (= b_and!21665 (and (=> t!21807 result!7899) b_and!21667)))

(declare-fun b_lambda!10935 () Bool)

(assert (=> (not b_lambda!10935) (not b!819145)))

(assert (=> b!819145 t!21807))

(declare-fun b_and!21669 () Bool)

(assert (= b_and!21667 (and (=> t!21807 result!7899) b_and!21669)))

(declare-fun m!760249 () Bool)

(assert (=> b!819144 m!760249))

(declare-fun m!760251 () Bool)

(assert (=> b!819141 m!760251))

(assert (=> b!819145 m!760223))

(declare-fun m!760253 () Bool)

(assert (=> b!819145 m!760253))

(assert (=> b!819145 m!760227))

(assert (=> b!819145 m!760229))

(assert (=> b!819145 m!760223))

(assert (=> b!819145 m!760229))

(assert (=> b!819145 m!760227))

(assert (=> b!819145 m!760231))

(assert (=> b!819139 m!760227))

(declare-fun m!760255 () Bool)

(assert (=> b!819139 m!760255))

(declare-fun m!760257 () Bool)

(assert (=> b!819139 m!760257))

(declare-fun m!760259 () Bool)

(assert (=> b!819139 m!760259))

(assert (=> b!819139 m!760229))

(declare-fun m!760261 () Bool)

(assert (=> b!819139 m!760261))

(assert (=> b!819139 m!760223))

(assert (=> b!819139 m!760229))

(assert (=> b!819139 m!760227))

(assert (=> b!819139 m!760231))

(assert (=> b!819139 m!760255))

(assert (=> b!819148 m!760223))

(assert (=> b!819148 m!760223))

(assert (=> b!819148 m!760241))

(assert (=> b!819140 m!760223))

(assert (=> b!819140 m!760223))

(declare-fun m!760263 () Bool)

(assert (=> b!819140 m!760263))

(declare-fun m!760265 () Bool)

(assert (=> d!104461 m!760265))

(assert (=> d!104461 m!760137))

(assert (=> bm!35611 m!760249))

(assert (=> b!819142 m!760223))

(assert (=> b!819142 m!760223))

(assert (=> b!819142 m!760241))

(declare-fun m!760267 () Bool)

(assert (=> b!819138 m!760267))

(assert (=> b!819034 d!104461))

(declare-fun d!104463 () Bool)

(declare-fun e!454887 () Bool)

(assert (=> d!104463 e!454887))

(declare-fun res!559047 () Bool)

(assert (=> d!104463 (=> (not res!559047) (not e!454887))))

(declare-fun lt!367441 () ListLongMap!8475)

(assert (=> d!104463 (= res!559047 (contains!4138 lt!367441 (_1!4842 (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!367442 () List!15482)

(assert (=> d!104463 (= lt!367441 (ListLongMap!8476 lt!367442))))

(declare-fun lt!367440 () Unit!27931)

(declare-fun lt!367443 () Unit!27931)

(assert (=> d!104463 (= lt!367440 lt!367443)))

(declare-datatypes ((Option!406 0))(
  ( (Some!405 (v!9755 V!24419)) (None!404) )
))
(declare-fun getValueByKey!400 (List!15482 (_ BitVec 64)) Option!406)

(assert (=> d!104463 (= (getValueByKey!400 lt!367442 (_1!4842 (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!405 (_2!4842 (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lemmaContainsTupThenGetReturnValue!217 (List!15482 (_ BitVec 64) V!24419) Unit!27931)

(assert (=> d!104463 (= lt!367443 (lemmaContainsTupThenGetReturnValue!217 lt!367442 (_1!4842 (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4842 (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun insertStrictlySorted!256 (List!15482 (_ BitVec 64) V!24419) List!15482)

(assert (=> d!104463 (= lt!367442 (insertStrictlySorted!256 (toList!4253 lt!367346) (_1!4842 (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4842 (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104463 (= (+!1874 lt!367346 (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!367441)))

(declare-fun b!819153 () Bool)

(declare-fun res!559046 () Bool)

(assert (=> b!819153 (=> (not res!559046) (not e!454887))))

(assert (=> b!819153 (= res!559046 (= (getValueByKey!400 (toList!4253 lt!367441) (_1!4842 (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!405 (_2!4842 (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!819154 () Bool)

(declare-fun contains!4139 (List!15482 tuple2!9662) Bool)

(assert (=> b!819154 (= e!454887 (contains!4139 (toList!4253 lt!367441) (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!104463 res!559047) b!819153))

(assert (= (and b!819153 res!559046) b!819154))

(declare-fun m!760269 () Bool)

(assert (=> d!104463 m!760269))

(declare-fun m!760271 () Bool)

(assert (=> d!104463 m!760271))

(declare-fun m!760273 () Bool)

(assert (=> d!104463 m!760273))

(declare-fun m!760275 () Bool)

(assert (=> d!104463 m!760275))

(declare-fun m!760277 () Bool)

(assert (=> b!819153 m!760277))

(declare-fun m!760279 () Bool)

(assert (=> b!819154 m!760279))

(assert (=> b!819030 d!104463))

(declare-fun d!104465 () Bool)

(assert (=> d!104465 (= (+!1874 lt!367342 (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (+!1874 (+!1874 lt!367342 (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun lt!367446 () Unit!27931)

(declare-fun choose!1403 (ListLongMap!8475 (_ BitVec 64) V!24419 V!24419) Unit!27931)

(assert (=> d!104465 (= lt!367446 (choose!1403 lt!367342 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> d!104465 (= (addSameAsAddTwiceSameKeyDiffValues!189 lt!367342 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34) lt!367446)))

(declare-fun bs!22809 () Bool)

(assert (= bs!22809 d!104465))

(declare-fun m!760281 () Bool)

(assert (=> bs!22809 m!760281))

(declare-fun m!760283 () Bool)

(assert (=> bs!22809 m!760283))

(assert (=> bs!22809 m!760283))

(declare-fun m!760285 () Bool)

(assert (=> bs!22809 m!760285))

(declare-fun m!760287 () Bool)

(assert (=> bs!22809 m!760287))

(assert (=> b!819032 d!104465))

(declare-fun b!819197 () Bool)

(declare-fun e!454925 () Unit!27931)

(declare-fun Unit!27935 () Unit!27931)

(assert (=> b!819197 (= e!454925 Unit!27935)))

(declare-fun e!454915 () Bool)

(declare-fun lt!367494 () ListLongMap!8475)

(declare-fun b!819198 () Bool)

(assert (=> b!819198 (= e!454915 (= (apply!354 lt!367494 (select (arr!21704 _keys!976) #b00000000000000000000000000000000)) (get!11591 (select (arr!21703 _values!788) #b00000000000000000000000000000000) (dynLambda!968 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!819198 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22124 _values!788)))))

(assert (=> b!819198 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22125 _keys!976)))))

(declare-fun bm!35626 () Bool)

(declare-fun call!35631 () Bool)

(assert (=> bm!35626 (= call!35631 (contains!4138 lt!367494 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!819199 () Bool)

(declare-fun e!454916 () Bool)

(assert (=> b!819199 (= e!454916 (= (apply!354 lt!367494 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!819200 () Bool)

(declare-fun e!454918 () Bool)

(assert (=> b!819200 (= e!454918 e!454915)))

(declare-fun res!559069 () Bool)

(assert (=> b!819200 (=> (not res!559069) (not e!454915))))

(assert (=> b!819200 (= res!559069 (contains!4138 lt!367494 (select (arr!21704 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!819200 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22125 _keys!976)))))

(declare-fun b!819201 () Bool)

(declare-fun e!454924 () Bool)

(assert (=> b!819201 (= e!454924 (validKeyInArray!0 (select (arr!21704 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104467 () Bool)

(declare-fun e!454920 () Bool)

(assert (=> d!104467 e!454920))

(declare-fun res!559071 () Bool)

(assert (=> d!104467 (=> (not res!559071) (not e!454920))))

(assert (=> d!104467 (= res!559071 (or (bvsge #b00000000000000000000000000000000 (size!22125 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22125 _keys!976)))))))

(declare-fun lt!367496 () ListLongMap!8475)

(assert (=> d!104467 (= lt!367494 lt!367496)))

(declare-fun lt!367503 () Unit!27931)

(assert (=> d!104467 (= lt!367503 e!454925)))

(declare-fun c!89086 () Bool)

(declare-fun e!454922 () Bool)

(assert (=> d!104467 (= c!89086 e!454922)))

(declare-fun res!559067 () Bool)

(assert (=> d!104467 (=> (not res!559067) (not e!454922))))

(assert (=> d!104467 (= res!559067 (bvslt #b00000000000000000000000000000000 (size!22125 _keys!976)))))

(declare-fun e!454921 () ListLongMap!8475)

(assert (=> d!104467 (= lt!367496 e!454921)))

(declare-fun c!89081 () Bool)

(assert (=> d!104467 (= c!89081 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104467 (validMask!0 mask!1312)))

(assert (=> d!104467 (= (getCurrentListMap!2402 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!367494)))

(declare-fun bm!35627 () Bool)

(declare-fun call!35635 () ListLongMap!8475)

(declare-fun call!35633 () ListLongMap!8475)

(assert (=> bm!35627 (= call!35635 call!35633)))

(declare-fun b!819202 () Bool)

(declare-fun c!89085 () Bool)

(assert (=> b!819202 (= c!89085 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!454919 () ListLongMap!8475)

(declare-fun e!454923 () ListLongMap!8475)

(assert (=> b!819202 (= e!454919 e!454923)))

(declare-fun b!819203 () Bool)

(assert (=> b!819203 (= e!454922 (validKeyInArray!0 (select (arr!21704 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!819204 () Bool)

(declare-fun e!454926 () Bool)

(declare-fun call!35632 () Bool)

(assert (=> b!819204 (= e!454926 (not call!35632))))

(declare-fun bm!35628 () Bool)

(declare-fun call!35630 () ListLongMap!8475)

(assert (=> bm!35628 (= call!35630 (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819205 () Bool)

(declare-fun call!35634 () ListLongMap!8475)

(assert (=> b!819205 (= e!454923 call!35634)))

(declare-fun bm!35629 () Bool)

(assert (=> bm!35629 (= call!35633 call!35630)))

(declare-fun bm!35630 () Bool)

(declare-fun call!35629 () ListLongMap!8475)

(declare-fun c!89083 () Bool)

(assert (=> bm!35630 (= call!35629 (+!1874 (ite c!89081 call!35630 (ite c!89083 call!35633 call!35635)) (ite (or c!89081 c!89083) (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!819206 () Bool)

(assert (=> b!819206 (= e!454920 e!454926)))

(declare-fun c!89084 () Bool)

(assert (=> b!819206 (= c!89084 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!819207 () Bool)

(declare-fun res!559074 () Bool)

(assert (=> b!819207 (=> (not res!559074) (not e!454920))))

(declare-fun e!454917 () Bool)

(assert (=> b!819207 (= res!559074 e!454917)))

(declare-fun c!89082 () Bool)

(assert (=> b!819207 (= c!89082 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!819208 () Bool)

(assert (=> b!819208 (= e!454921 (+!1874 call!35629 (tuple2!9663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!819209 () Bool)

(declare-fun e!454914 () Bool)

(assert (=> b!819209 (= e!454914 (= (apply!354 lt!367494 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!819210 () Bool)

(assert (=> b!819210 (= e!454921 e!454919)))

(assert (=> b!819210 (= c!89083 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!819211 () Bool)

(declare-fun res!559068 () Bool)

(assert (=> b!819211 (=> (not res!559068) (not e!454920))))

(assert (=> b!819211 (= res!559068 e!454918)))

(declare-fun res!559072 () Bool)

(assert (=> b!819211 (=> res!559072 e!454918)))

(assert (=> b!819211 (= res!559072 (not e!454924))))

(declare-fun res!559073 () Bool)

(assert (=> b!819211 (=> (not res!559073) (not e!454924))))

(assert (=> b!819211 (= res!559073 (bvslt #b00000000000000000000000000000000 (size!22125 _keys!976)))))

(declare-fun b!819212 () Bool)

(declare-fun lt!367497 () Unit!27931)

(assert (=> b!819212 (= e!454925 lt!367497)))

(declare-fun lt!367505 () ListLongMap!8475)

(assert (=> b!819212 (= lt!367505 (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367510 () (_ BitVec 64))

(assert (=> b!819212 (= lt!367510 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!367506 () (_ BitVec 64))

(assert (=> b!819212 (= lt!367506 (select (arr!21704 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!367498 () Unit!27931)

(declare-fun addStillContains!308 (ListLongMap!8475 (_ BitVec 64) V!24419 (_ BitVec 64)) Unit!27931)

(assert (=> b!819212 (= lt!367498 (addStillContains!308 lt!367505 lt!367510 zeroValueBefore!34 lt!367506))))

(assert (=> b!819212 (contains!4138 (+!1874 lt!367505 (tuple2!9663 lt!367510 zeroValueBefore!34)) lt!367506)))

(declare-fun lt!367492 () Unit!27931)

(assert (=> b!819212 (= lt!367492 lt!367498)))

(declare-fun lt!367511 () ListLongMap!8475)

(assert (=> b!819212 (= lt!367511 (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367499 () (_ BitVec 64))

(assert (=> b!819212 (= lt!367499 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!367491 () (_ BitVec 64))

(assert (=> b!819212 (= lt!367491 (select (arr!21704 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!367502 () Unit!27931)

(declare-fun addApplyDifferent!308 (ListLongMap!8475 (_ BitVec 64) V!24419 (_ BitVec 64)) Unit!27931)

(assert (=> b!819212 (= lt!367502 (addApplyDifferent!308 lt!367511 lt!367499 minValue!754 lt!367491))))

(assert (=> b!819212 (= (apply!354 (+!1874 lt!367511 (tuple2!9663 lt!367499 minValue!754)) lt!367491) (apply!354 lt!367511 lt!367491))))

(declare-fun lt!367500 () Unit!27931)

(assert (=> b!819212 (= lt!367500 lt!367502)))

(declare-fun lt!367508 () ListLongMap!8475)

(assert (=> b!819212 (= lt!367508 (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367512 () (_ BitVec 64))

(assert (=> b!819212 (= lt!367512 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!367509 () (_ BitVec 64))

(assert (=> b!819212 (= lt!367509 (select (arr!21704 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!367501 () Unit!27931)

(assert (=> b!819212 (= lt!367501 (addApplyDifferent!308 lt!367508 lt!367512 zeroValueBefore!34 lt!367509))))

(assert (=> b!819212 (= (apply!354 (+!1874 lt!367508 (tuple2!9663 lt!367512 zeroValueBefore!34)) lt!367509) (apply!354 lt!367508 lt!367509))))

(declare-fun lt!367507 () Unit!27931)

(assert (=> b!819212 (= lt!367507 lt!367501)))

(declare-fun lt!367504 () ListLongMap!8475)

(assert (=> b!819212 (= lt!367504 (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367493 () (_ BitVec 64))

(assert (=> b!819212 (= lt!367493 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!367495 () (_ BitVec 64))

(assert (=> b!819212 (= lt!367495 (select (arr!21704 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!819212 (= lt!367497 (addApplyDifferent!308 lt!367504 lt!367493 minValue!754 lt!367495))))

(assert (=> b!819212 (= (apply!354 (+!1874 lt!367504 (tuple2!9663 lt!367493 minValue!754)) lt!367495) (apply!354 lt!367504 lt!367495))))

(declare-fun b!819213 () Bool)

(assert (=> b!819213 (= e!454917 e!454916)))

(declare-fun res!559070 () Bool)

(assert (=> b!819213 (= res!559070 call!35631)))

(assert (=> b!819213 (=> (not res!559070) (not e!454916))))

(declare-fun b!819214 () Bool)

(assert (=> b!819214 (= e!454919 call!35634)))

(declare-fun b!819215 () Bool)

(assert (=> b!819215 (= e!454923 call!35635)))

(declare-fun b!819216 () Bool)

(assert (=> b!819216 (= e!454926 e!454914)))

(declare-fun res!559066 () Bool)

(assert (=> b!819216 (= res!559066 call!35632)))

(assert (=> b!819216 (=> (not res!559066) (not e!454914))))

(declare-fun bm!35631 () Bool)

(assert (=> bm!35631 (= call!35632 (contains!4138 lt!367494 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35632 () Bool)

(assert (=> bm!35632 (= call!35634 call!35629)))

(declare-fun b!819217 () Bool)

(assert (=> b!819217 (= e!454917 (not call!35631))))

(assert (= (and d!104467 c!89081) b!819208))

(assert (= (and d!104467 (not c!89081)) b!819210))

(assert (= (and b!819210 c!89083) b!819214))

(assert (= (and b!819210 (not c!89083)) b!819202))

(assert (= (and b!819202 c!89085) b!819205))

(assert (= (and b!819202 (not c!89085)) b!819215))

(assert (= (or b!819205 b!819215) bm!35627))

(assert (= (or b!819214 bm!35627) bm!35629))

(assert (= (or b!819214 b!819205) bm!35632))

(assert (= (or b!819208 bm!35629) bm!35628))

(assert (= (or b!819208 bm!35632) bm!35630))

(assert (= (and d!104467 res!559067) b!819203))

(assert (= (and d!104467 c!89086) b!819212))

(assert (= (and d!104467 (not c!89086)) b!819197))

(assert (= (and d!104467 res!559071) b!819211))

(assert (= (and b!819211 res!559073) b!819201))

(assert (= (and b!819211 (not res!559072)) b!819200))

(assert (= (and b!819200 res!559069) b!819198))

(assert (= (and b!819211 res!559068) b!819207))

(assert (= (and b!819207 c!89082) b!819213))

(assert (= (and b!819207 (not c!89082)) b!819217))

(assert (= (and b!819213 res!559070) b!819199))

(assert (= (or b!819213 b!819217) bm!35626))

(assert (= (and b!819207 res!559074) b!819206))

(assert (= (and b!819206 c!89084) b!819216))

(assert (= (and b!819206 (not c!89084)) b!819204))

(assert (= (and b!819216 res!559066) b!819209))

(assert (= (or b!819216 b!819204) bm!35631))

(declare-fun b_lambda!10937 () Bool)

(assert (=> (not b_lambda!10937) (not b!819198)))

(assert (=> b!819198 t!21807))

(declare-fun b_and!21671 () Bool)

(assert (= b_and!21669 (and (=> t!21807 result!7899) b_and!21671)))

(assert (=> d!104467 m!760137))

(assert (=> bm!35628 m!760135))

(declare-fun m!760289 () Bool)

(assert (=> bm!35631 m!760289))

(declare-fun m!760291 () Bool)

(assert (=> bm!35626 m!760291))

(declare-fun m!760293 () Bool)

(assert (=> b!819199 m!760293))

(assert (=> b!819201 m!760223))

(assert (=> b!819201 m!760223))

(assert (=> b!819201 m!760241))

(declare-fun m!760295 () Bool)

(assert (=> bm!35630 m!760295))

(declare-fun m!760297 () Bool)

(assert (=> b!819208 m!760297))

(assert (=> b!819200 m!760223))

(assert (=> b!819200 m!760223))

(declare-fun m!760299 () Bool)

(assert (=> b!819200 m!760299))

(assert (=> b!819198 m!760229))

(assert (=> b!819198 m!760223))

(declare-fun m!760301 () Bool)

(assert (=> b!819198 m!760301))

(assert (=> b!819198 m!760227))

(assert (=> b!819198 m!760229))

(assert (=> b!819198 m!760227))

(assert (=> b!819198 m!760231))

(assert (=> b!819198 m!760223))

(declare-fun m!760303 () Bool)

(assert (=> b!819212 m!760303))

(declare-fun m!760305 () Bool)

(assert (=> b!819212 m!760305))

(declare-fun m!760307 () Bool)

(assert (=> b!819212 m!760307))

(assert (=> b!819212 m!760307))

(declare-fun m!760309 () Bool)

(assert (=> b!819212 m!760309))

(declare-fun m!760311 () Bool)

(assert (=> b!819212 m!760311))

(declare-fun m!760313 () Bool)

(assert (=> b!819212 m!760313))

(declare-fun m!760315 () Bool)

(assert (=> b!819212 m!760315))

(declare-fun m!760317 () Bool)

(assert (=> b!819212 m!760317))

(assert (=> b!819212 m!760223))

(assert (=> b!819212 m!760311))

(declare-fun m!760319 () Bool)

(assert (=> b!819212 m!760319))

(declare-fun m!760321 () Bool)

(assert (=> b!819212 m!760321))

(declare-fun m!760323 () Bool)

(assert (=> b!819212 m!760323))

(assert (=> b!819212 m!760135))

(declare-fun m!760325 () Bool)

(assert (=> b!819212 m!760325))

(declare-fun m!760327 () Bool)

(assert (=> b!819212 m!760327))

(assert (=> b!819212 m!760315))

(declare-fun m!760329 () Bool)

(assert (=> b!819212 m!760329))

(declare-fun m!760331 () Bool)

(assert (=> b!819212 m!760331))

(assert (=> b!819212 m!760319))

(assert (=> b!819203 m!760223))

(assert (=> b!819203 m!760223))

(assert (=> b!819203 m!760241))

(declare-fun m!760333 () Bool)

(assert (=> b!819209 m!760333))

(assert (=> b!819032 d!104467))

(declare-fun b!819218 () Bool)

(declare-fun e!454938 () Unit!27931)

(declare-fun Unit!27936 () Unit!27931)

(assert (=> b!819218 (= e!454938 Unit!27936)))

(declare-fun b!819219 () Bool)

(declare-fun e!454928 () Bool)

(declare-fun lt!367516 () ListLongMap!8475)

(assert (=> b!819219 (= e!454928 (= (apply!354 lt!367516 (select (arr!21704 _keys!976) #b00000000000000000000000000000000)) (get!11591 (select (arr!21703 _values!788) #b00000000000000000000000000000000) (dynLambda!968 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!819219 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22124 _values!788)))))

(assert (=> b!819219 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22125 _keys!976)))))

(declare-fun bm!35633 () Bool)

(declare-fun call!35638 () Bool)

(assert (=> bm!35633 (= call!35638 (contains!4138 lt!367516 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!819220 () Bool)

(declare-fun e!454929 () Bool)

(assert (=> b!819220 (= e!454929 (= (apply!354 lt!367516 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!819221 () Bool)

(declare-fun e!454931 () Bool)

(assert (=> b!819221 (= e!454931 e!454928)))

(declare-fun res!559078 () Bool)

(assert (=> b!819221 (=> (not res!559078) (not e!454928))))

(assert (=> b!819221 (= res!559078 (contains!4138 lt!367516 (select (arr!21704 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!819221 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22125 _keys!976)))))

(declare-fun b!819222 () Bool)

(declare-fun e!454937 () Bool)

(assert (=> b!819222 (= e!454937 (validKeyInArray!0 (select (arr!21704 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104469 () Bool)

(declare-fun e!454933 () Bool)

(assert (=> d!104469 e!454933))

(declare-fun res!559080 () Bool)

(assert (=> d!104469 (=> (not res!559080) (not e!454933))))

(assert (=> d!104469 (= res!559080 (or (bvsge #b00000000000000000000000000000000 (size!22125 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22125 _keys!976)))))))

(declare-fun lt!367518 () ListLongMap!8475)

(assert (=> d!104469 (= lt!367516 lt!367518)))

(declare-fun lt!367525 () Unit!27931)

(assert (=> d!104469 (= lt!367525 e!454938)))

(declare-fun c!89092 () Bool)

(declare-fun e!454935 () Bool)

(assert (=> d!104469 (= c!89092 e!454935)))

(declare-fun res!559076 () Bool)

(assert (=> d!104469 (=> (not res!559076) (not e!454935))))

(assert (=> d!104469 (= res!559076 (bvslt #b00000000000000000000000000000000 (size!22125 _keys!976)))))

(declare-fun e!454934 () ListLongMap!8475)

(assert (=> d!104469 (= lt!367518 e!454934)))

(declare-fun c!89087 () Bool)

(assert (=> d!104469 (= c!89087 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104469 (validMask!0 mask!1312)))

(assert (=> d!104469 (= (getCurrentListMap!2402 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!367516)))

(declare-fun bm!35634 () Bool)

(declare-fun call!35642 () ListLongMap!8475)

(declare-fun call!35640 () ListLongMap!8475)

(assert (=> bm!35634 (= call!35642 call!35640)))

(declare-fun b!819223 () Bool)

(declare-fun c!89091 () Bool)

(assert (=> b!819223 (= c!89091 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!454932 () ListLongMap!8475)

(declare-fun e!454936 () ListLongMap!8475)

(assert (=> b!819223 (= e!454932 e!454936)))

(declare-fun b!819224 () Bool)

(assert (=> b!819224 (= e!454935 (validKeyInArray!0 (select (arr!21704 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!819225 () Bool)

(declare-fun e!454939 () Bool)

(declare-fun call!35639 () Bool)

(assert (=> b!819225 (= e!454939 (not call!35639))))

(declare-fun call!35637 () ListLongMap!8475)

(declare-fun bm!35635 () Bool)

(assert (=> bm!35635 (= call!35637 (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819226 () Bool)

(declare-fun call!35641 () ListLongMap!8475)

(assert (=> b!819226 (= e!454936 call!35641)))

(declare-fun bm!35636 () Bool)

(assert (=> bm!35636 (= call!35640 call!35637)))

(declare-fun c!89089 () Bool)

(declare-fun bm!35637 () Bool)

(declare-fun call!35636 () ListLongMap!8475)

(assert (=> bm!35637 (= call!35636 (+!1874 (ite c!89087 call!35637 (ite c!89089 call!35640 call!35642)) (ite (or c!89087 c!89089) (tuple2!9663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!9663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!819227 () Bool)

(assert (=> b!819227 (= e!454933 e!454939)))

(declare-fun c!89090 () Bool)

(assert (=> b!819227 (= c!89090 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!819228 () Bool)

(declare-fun res!559083 () Bool)

(assert (=> b!819228 (=> (not res!559083) (not e!454933))))

(declare-fun e!454930 () Bool)

(assert (=> b!819228 (= res!559083 e!454930)))

(declare-fun c!89088 () Bool)

(assert (=> b!819228 (= c!89088 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!819229 () Bool)

(assert (=> b!819229 (= e!454934 (+!1874 call!35636 (tuple2!9663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!819230 () Bool)

(declare-fun e!454927 () Bool)

(assert (=> b!819230 (= e!454927 (= (apply!354 lt!367516 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!819231 () Bool)

(assert (=> b!819231 (= e!454934 e!454932)))

(assert (=> b!819231 (= c!89089 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!819232 () Bool)

(declare-fun res!559077 () Bool)

(assert (=> b!819232 (=> (not res!559077) (not e!454933))))

(assert (=> b!819232 (= res!559077 e!454931)))

(declare-fun res!559081 () Bool)

(assert (=> b!819232 (=> res!559081 e!454931)))

(assert (=> b!819232 (= res!559081 (not e!454937))))

(declare-fun res!559082 () Bool)

(assert (=> b!819232 (=> (not res!559082) (not e!454937))))

(assert (=> b!819232 (= res!559082 (bvslt #b00000000000000000000000000000000 (size!22125 _keys!976)))))

(declare-fun b!819233 () Bool)

(declare-fun lt!367519 () Unit!27931)

(assert (=> b!819233 (= e!454938 lt!367519)))

(declare-fun lt!367527 () ListLongMap!8475)

(assert (=> b!819233 (= lt!367527 (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367532 () (_ BitVec 64))

(assert (=> b!819233 (= lt!367532 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!367528 () (_ BitVec 64))

(assert (=> b!819233 (= lt!367528 (select (arr!21704 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!367520 () Unit!27931)

(assert (=> b!819233 (= lt!367520 (addStillContains!308 lt!367527 lt!367532 zeroValueAfter!34 lt!367528))))

(assert (=> b!819233 (contains!4138 (+!1874 lt!367527 (tuple2!9663 lt!367532 zeroValueAfter!34)) lt!367528)))

(declare-fun lt!367514 () Unit!27931)

(assert (=> b!819233 (= lt!367514 lt!367520)))

(declare-fun lt!367533 () ListLongMap!8475)

(assert (=> b!819233 (= lt!367533 (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367521 () (_ BitVec 64))

(assert (=> b!819233 (= lt!367521 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!367513 () (_ BitVec 64))

(assert (=> b!819233 (= lt!367513 (select (arr!21704 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!367524 () Unit!27931)

(assert (=> b!819233 (= lt!367524 (addApplyDifferent!308 lt!367533 lt!367521 minValue!754 lt!367513))))

(assert (=> b!819233 (= (apply!354 (+!1874 lt!367533 (tuple2!9663 lt!367521 minValue!754)) lt!367513) (apply!354 lt!367533 lt!367513))))

(declare-fun lt!367522 () Unit!27931)

(assert (=> b!819233 (= lt!367522 lt!367524)))

(declare-fun lt!367530 () ListLongMap!8475)

(assert (=> b!819233 (= lt!367530 (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367534 () (_ BitVec 64))

(assert (=> b!819233 (= lt!367534 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!367531 () (_ BitVec 64))

(assert (=> b!819233 (= lt!367531 (select (arr!21704 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!367523 () Unit!27931)

(assert (=> b!819233 (= lt!367523 (addApplyDifferent!308 lt!367530 lt!367534 zeroValueAfter!34 lt!367531))))

(assert (=> b!819233 (= (apply!354 (+!1874 lt!367530 (tuple2!9663 lt!367534 zeroValueAfter!34)) lt!367531) (apply!354 lt!367530 lt!367531))))

(declare-fun lt!367529 () Unit!27931)

(assert (=> b!819233 (= lt!367529 lt!367523)))

(declare-fun lt!367526 () ListLongMap!8475)

(assert (=> b!819233 (= lt!367526 (getCurrentListMapNoExtraKeys!2308 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367515 () (_ BitVec 64))

(assert (=> b!819233 (= lt!367515 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!367517 () (_ BitVec 64))

(assert (=> b!819233 (= lt!367517 (select (arr!21704 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!819233 (= lt!367519 (addApplyDifferent!308 lt!367526 lt!367515 minValue!754 lt!367517))))

(assert (=> b!819233 (= (apply!354 (+!1874 lt!367526 (tuple2!9663 lt!367515 minValue!754)) lt!367517) (apply!354 lt!367526 lt!367517))))

(declare-fun b!819234 () Bool)

(assert (=> b!819234 (= e!454930 e!454929)))

(declare-fun res!559079 () Bool)

(assert (=> b!819234 (= res!559079 call!35638)))

(assert (=> b!819234 (=> (not res!559079) (not e!454929))))

(declare-fun b!819235 () Bool)

(assert (=> b!819235 (= e!454932 call!35641)))

(declare-fun b!819236 () Bool)

(assert (=> b!819236 (= e!454936 call!35642)))

(declare-fun b!819237 () Bool)

(assert (=> b!819237 (= e!454939 e!454927)))

(declare-fun res!559075 () Bool)

(assert (=> b!819237 (= res!559075 call!35639)))

(assert (=> b!819237 (=> (not res!559075) (not e!454927))))

(declare-fun bm!35638 () Bool)

(assert (=> bm!35638 (= call!35639 (contains!4138 lt!367516 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35639 () Bool)

(assert (=> bm!35639 (= call!35641 call!35636)))

(declare-fun b!819238 () Bool)

(assert (=> b!819238 (= e!454930 (not call!35638))))

(assert (= (and d!104469 c!89087) b!819229))

(assert (= (and d!104469 (not c!89087)) b!819231))

(assert (= (and b!819231 c!89089) b!819235))

(assert (= (and b!819231 (not c!89089)) b!819223))

(assert (= (and b!819223 c!89091) b!819226))

(assert (= (and b!819223 (not c!89091)) b!819236))

(assert (= (or b!819226 b!819236) bm!35634))

(assert (= (or b!819235 bm!35634) bm!35636))

(assert (= (or b!819235 b!819226) bm!35639))

(assert (= (or b!819229 bm!35636) bm!35635))

(assert (= (or b!819229 bm!35639) bm!35637))

(assert (= (and d!104469 res!559076) b!819224))

(assert (= (and d!104469 c!89092) b!819233))

(assert (= (and d!104469 (not c!89092)) b!819218))

(assert (= (and d!104469 res!559080) b!819232))

(assert (= (and b!819232 res!559082) b!819222))

(assert (= (and b!819232 (not res!559081)) b!819221))

(assert (= (and b!819221 res!559078) b!819219))

(assert (= (and b!819232 res!559077) b!819228))

(assert (= (and b!819228 c!89088) b!819234))

(assert (= (and b!819228 (not c!89088)) b!819238))

(assert (= (and b!819234 res!559079) b!819220))

(assert (= (or b!819234 b!819238) bm!35633))

(assert (= (and b!819228 res!559083) b!819227))

(assert (= (and b!819227 c!89090) b!819237))

(assert (= (and b!819227 (not c!89090)) b!819225))

(assert (= (and b!819237 res!559075) b!819230))

(assert (= (or b!819237 b!819225) bm!35638))

(declare-fun b_lambda!10939 () Bool)

(assert (=> (not b_lambda!10939) (not b!819219)))

(assert (=> b!819219 t!21807))

(declare-fun b_and!21673 () Bool)

(assert (= b_and!21671 (and (=> t!21807 result!7899) b_and!21673)))

(assert (=> d!104469 m!760137))

(assert (=> bm!35635 m!760133))

(declare-fun m!760335 () Bool)

(assert (=> bm!35638 m!760335))

(declare-fun m!760337 () Bool)

(assert (=> bm!35633 m!760337))

(declare-fun m!760339 () Bool)

(assert (=> b!819220 m!760339))

(assert (=> b!819222 m!760223))

(assert (=> b!819222 m!760223))

(assert (=> b!819222 m!760241))

(declare-fun m!760341 () Bool)

(assert (=> bm!35637 m!760341))

(declare-fun m!760343 () Bool)

(assert (=> b!819229 m!760343))

(assert (=> b!819221 m!760223))

(assert (=> b!819221 m!760223))

(declare-fun m!760345 () Bool)

(assert (=> b!819221 m!760345))

(assert (=> b!819219 m!760229))

(assert (=> b!819219 m!760223))

(declare-fun m!760347 () Bool)

(assert (=> b!819219 m!760347))

(assert (=> b!819219 m!760227))

(assert (=> b!819219 m!760229))

(assert (=> b!819219 m!760227))

(assert (=> b!819219 m!760231))

(assert (=> b!819219 m!760223))

(declare-fun m!760349 () Bool)

(assert (=> b!819233 m!760349))

(declare-fun m!760351 () Bool)

(assert (=> b!819233 m!760351))

(declare-fun m!760353 () Bool)

(assert (=> b!819233 m!760353))

(assert (=> b!819233 m!760353))

(declare-fun m!760355 () Bool)

(assert (=> b!819233 m!760355))

(declare-fun m!760357 () Bool)

(assert (=> b!819233 m!760357))

(declare-fun m!760359 () Bool)

(assert (=> b!819233 m!760359))

(declare-fun m!760361 () Bool)

(assert (=> b!819233 m!760361))

(declare-fun m!760363 () Bool)

(assert (=> b!819233 m!760363))

(assert (=> b!819233 m!760223))

(assert (=> b!819233 m!760357))

(declare-fun m!760365 () Bool)

(assert (=> b!819233 m!760365))

(declare-fun m!760367 () Bool)

(assert (=> b!819233 m!760367))

(declare-fun m!760369 () Bool)

(assert (=> b!819233 m!760369))

(assert (=> b!819233 m!760133))

(declare-fun m!760371 () Bool)

(assert (=> b!819233 m!760371))

(declare-fun m!760373 () Bool)

(assert (=> b!819233 m!760373))

(assert (=> b!819233 m!760361))

(declare-fun m!760375 () Bool)

(assert (=> b!819233 m!760375))

(declare-fun m!760377 () Bool)

(assert (=> b!819233 m!760377))

(assert (=> b!819233 m!760365))

(assert (=> b!819224 m!760223))

(assert (=> b!819224 m!760223))

(assert (=> b!819224 m!760241))

(declare-fun m!760379 () Bool)

(assert (=> b!819230 m!760379))

(assert (=> b!819032 d!104469))

(declare-fun d!104471 () Bool)

(declare-fun e!454940 () Bool)

(assert (=> d!104471 e!454940))

(declare-fun res!559085 () Bool)

(assert (=> d!104471 (=> (not res!559085) (not e!454940))))

(declare-fun lt!367536 () ListLongMap!8475)

(assert (=> d!104471 (= res!559085 (contains!4138 lt!367536 (_1!4842 lt!367340)))))

(declare-fun lt!367537 () List!15482)

(assert (=> d!104471 (= lt!367536 (ListLongMap!8476 lt!367537))))

(declare-fun lt!367535 () Unit!27931)

(declare-fun lt!367538 () Unit!27931)

(assert (=> d!104471 (= lt!367535 lt!367538)))

(assert (=> d!104471 (= (getValueByKey!400 lt!367537 (_1!4842 lt!367340)) (Some!405 (_2!4842 lt!367340)))))

(assert (=> d!104471 (= lt!367538 (lemmaContainsTupThenGetReturnValue!217 lt!367537 (_1!4842 lt!367340) (_2!4842 lt!367340)))))

(assert (=> d!104471 (= lt!367537 (insertStrictlySorted!256 (toList!4253 (+!1874 lt!367346 lt!367345)) (_1!4842 lt!367340) (_2!4842 lt!367340)))))

(assert (=> d!104471 (= (+!1874 (+!1874 lt!367346 lt!367345) lt!367340) lt!367536)))

(declare-fun b!819239 () Bool)

(declare-fun res!559084 () Bool)

(assert (=> b!819239 (=> (not res!559084) (not e!454940))))

(assert (=> b!819239 (= res!559084 (= (getValueByKey!400 (toList!4253 lt!367536) (_1!4842 lt!367340)) (Some!405 (_2!4842 lt!367340))))))

(declare-fun b!819240 () Bool)

(assert (=> b!819240 (= e!454940 (contains!4139 (toList!4253 lt!367536) lt!367340))))

(assert (= (and d!104471 res!559085) b!819239))

(assert (= (and b!819239 res!559084) b!819240))

(declare-fun m!760381 () Bool)

(assert (=> d!104471 m!760381))

(declare-fun m!760383 () Bool)

(assert (=> d!104471 m!760383))

(declare-fun m!760385 () Bool)

(assert (=> d!104471 m!760385))

(declare-fun m!760387 () Bool)

(assert (=> d!104471 m!760387))

(declare-fun m!760389 () Bool)

(assert (=> b!819239 m!760389))

(declare-fun m!760391 () Bool)

(assert (=> b!819240 m!760391))

(assert (=> b!819032 d!104471))

(declare-fun d!104473 () Bool)

(declare-fun e!454941 () Bool)

(assert (=> d!104473 e!454941))

(declare-fun res!559087 () Bool)

(assert (=> d!104473 (=> (not res!559087) (not e!454941))))

(declare-fun lt!367540 () ListLongMap!8475)

(assert (=> d!104473 (= res!559087 (contains!4138 lt!367540 (_1!4842 lt!367340)))))

(declare-fun lt!367541 () List!15482)

(assert (=> d!104473 (= lt!367540 (ListLongMap!8476 lt!367541))))

(declare-fun lt!367539 () Unit!27931)

(declare-fun lt!367542 () Unit!27931)

(assert (=> d!104473 (= lt!367539 lt!367542)))

(assert (=> d!104473 (= (getValueByKey!400 lt!367541 (_1!4842 lt!367340)) (Some!405 (_2!4842 lt!367340)))))

(assert (=> d!104473 (= lt!367542 (lemmaContainsTupThenGetReturnValue!217 lt!367541 (_1!4842 lt!367340) (_2!4842 lt!367340)))))

(assert (=> d!104473 (= lt!367541 (insertStrictlySorted!256 (toList!4253 lt!367342) (_1!4842 lt!367340) (_2!4842 lt!367340)))))

(assert (=> d!104473 (= (+!1874 lt!367342 lt!367340) lt!367540)))

(declare-fun b!819241 () Bool)

(declare-fun res!559086 () Bool)

(assert (=> b!819241 (=> (not res!559086) (not e!454941))))

(assert (=> b!819241 (= res!559086 (= (getValueByKey!400 (toList!4253 lt!367540) (_1!4842 lt!367340)) (Some!405 (_2!4842 lt!367340))))))

(declare-fun b!819242 () Bool)

(assert (=> b!819242 (= e!454941 (contains!4139 (toList!4253 lt!367540) lt!367340))))

(assert (= (and d!104473 res!559087) b!819241))

(assert (= (and b!819241 res!559086) b!819242))

(declare-fun m!760393 () Bool)

(assert (=> d!104473 m!760393))

(declare-fun m!760395 () Bool)

(assert (=> d!104473 m!760395))

(declare-fun m!760397 () Bool)

(assert (=> d!104473 m!760397))

(declare-fun m!760399 () Bool)

(assert (=> d!104473 m!760399))

(declare-fun m!760401 () Bool)

(assert (=> b!819241 m!760401))

(declare-fun m!760403 () Bool)

(assert (=> b!819242 m!760403))

(assert (=> b!819032 d!104473))

(declare-fun d!104475 () Bool)

(declare-fun e!454942 () Bool)

(assert (=> d!104475 e!454942))

(declare-fun res!559089 () Bool)

(assert (=> d!104475 (=> (not res!559089) (not e!454942))))

(declare-fun lt!367544 () ListLongMap!8475)

(assert (=> d!104475 (= res!559089 (contains!4138 lt!367544 (_1!4842 lt!367345)))))

(declare-fun lt!367545 () List!15482)

(assert (=> d!104475 (= lt!367544 (ListLongMap!8476 lt!367545))))

(declare-fun lt!367543 () Unit!27931)

(declare-fun lt!367546 () Unit!27931)

(assert (=> d!104475 (= lt!367543 lt!367546)))

(assert (=> d!104475 (= (getValueByKey!400 lt!367545 (_1!4842 lt!367345)) (Some!405 (_2!4842 lt!367345)))))

(assert (=> d!104475 (= lt!367546 (lemmaContainsTupThenGetReturnValue!217 lt!367545 (_1!4842 lt!367345) (_2!4842 lt!367345)))))

(assert (=> d!104475 (= lt!367545 (insertStrictlySorted!256 (toList!4253 lt!367346) (_1!4842 lt!367345) (_2!4842 lt!367345)))))

(assert (=> d!104475 (= (+!1874 lt!367346 lt!367345) lt!367544)))

(declare-fun b!819243 () Bool)

(declare-fun res!559088 () Bool)

(assert (=> b!819243 (=> (not res!559088) (not e!454942))))

(assert (=> b!819243 (= res!559088 (= (getValueByKey!400 (toList!4253 lt!367544) (_1!4842 lt!367345)) (Some!405 (_2!4842 lt!367345))))))

(declare-fun b!819244 () Bool)

(assert (=> b!819244 (= e!454942 (contains!4139 (toList!4253 lt!367544) lt!367345))))

(assert (= (and d!104475 res!559089) b!819243))

(assert (= (and b!819243 res!559088) b!819244))

(declare-fun m!760405 () Bool)

(assert (=> d!104475 m!760405))

(declare-fun m!760407 () Bool)

(assert (=> d!104475 m!760407))

(declare-fun m!760409 () Bool)

(assert (=> d!104475 m!760409))

(declare-fun m!760411 () Bool)

(assert (=> d!104475 m!760411))

(declare-fun m!760413 () Bool)

(assert (=> b!819243 m!760413))

(declare-fun m!760415 () Bool)

(assert (=> b!819244 m!760415))

(assert (=> b!819032 d!104475))

(declare-fun d!104477 () Bool)

(declare-fun e!454943 () Bool)

(assert (=> d!104477 e!454943))

(declare-fun res!559091 () Bool)

(assert (=> d!104477 (=> (not res!559091) (not e!454943))))

(declare-fun lt!367548 () ListLongMap!8475)

(assert (=> d!104477 (= res!559091 (contains!4138 lt!367548 (_1!4842 lt!367340)))))

(declare-fun lt!367549 () List!15482)

(assert (=> d!104477 (= lt!367548 (ListLongMap!8476 lt!367549))))

(declare-fun lt!367547 () Unit!27931)

(declare-fun lt!367550 () Unit!27931)

(assert (=> d!104477 (= lt!367547 lt!367550)))

(assert (=> d!104477 (= (getValueByKey!400 lt!367549 (_1!4842 lt!367340)) (Some!405 (_2!4842 lt!367340)))))

(assert (=> d!104477 (= lt!367550 (lemmaContainsTupThenGetReturnValue!217 lt!367549 (_1!4842 lt!367340) (_2!4842 lt!367340)))))

(assert (=> d!104477 (= lt!367549 (insertStrictlySorted!256 (toList!4253 lt!367339) (_1!4842 lt!367340) (_2!4842 lt!367340)))))

(assert (=> d!104477 (= (+!1874 lt!367339 lt!367340) lt!367548)))

(declare-fun b!819245 () Bool)

(declare-fun res!559090 () Bool)

(assert (=> b!819245 (=> (not res!559090) (not e!454943))))

(assert (=> b!819245 (= res!559090 (= (getValueByKey!400 (toList!4253 lt!367548) (_1!4842 lt!367340)) (Some!405 (_2!4842 lt!367340))))))

(declare-fun b!819246 () Bool)

(assert (=> b!819246 (= e!454943 (contains!4139 (toList!4253 lt!367548) lt!367340))))

(assert (= (and d!104477 res!559091) b!819245))

(assert (= (and b!819245 res!559090) b!819246))

(declare-fun m!760417 () Bool)

(assert (=> d!104477 m!760417))

(declare-fun m!760419 () Bool)

(assert (=> d!104477 m!760419))

(declare-fun m!760421 () Bool)

(assert (=> d!104477 m!760421))

(declare-fun m!760423 () Bool)

(assert (=> d!104477 m!760423))

(declare-fun m!760425 () Bool)

(assert (=> b!819245 m!760425))

(declare-fun m!760427 () Bool)

(assert (=> b!819246 m!760427))

(assert (=> b!819032 d!104477))

(declare-fun d!104479 () Bool)

(declare-fun e!454944 () Bool)

(assert (=> d!104479 e!454944))

(declare-fun res!559093 () Bool)

(assert (=> d!104479 (=> (not res!559093) (not e!454944))))

(declare-fun lt!367552 () ListLongMap!8475)

(assert (=> d!104479 (= res!559093 (contains!4138 lt!367552 (_1!4842 lt!367345)))))

(declare-fun lt!367553 () List!15482)

(assert (=> d!104479 (= lt!367552 (ListLongMap!8476 lt!367553))))

(declare-fun lt!367551 () Unit!27931)

(declare-fun lt!367554 () Unit!27931)

(assert (=> d!104479 (= lt!367551 lt!367554)))

(assert (=> d!104479 (= (getValueByKey!400 lt!367553 (_1!4842 lt!367345)) (Some!405 (_2!4842 lt!367345)))))

(assert (=> d!104479 (= lt!367554 (lemmaContainsTupThenGetReturnValue!217 lt!367553 (_1!4842 lt!367345) (_2!4842 lt!367345)))))

(assert (=> d!104479 (= lt!367553 (insertStrictlySorted!256 (toList!4253 lt!367342) (_1!4842 lt!367345) (_2!4842 lt!367345)))))

(assert (=> d!104479 (= (+!1874 lt!367342 lt!367345) lt!367552)))

(declare-fun b!819247 () Bool)

(declare-fun res!559092 () Bool)

(assert (=> b!819247 (=> (not res!559092) (not e!454944))))

(assert (=> b!819247 (= res!559092 (= (getValueByKey!400 (toList!4253 lt!367552) (_1!4842 lt!367345)) (Some!405 (_2!4842 lt!367345))))))

(declare-fun b!819248 () Bool)

(assert (=> b!819248 (= e!454944 (contains!4139 (toList!4253 lt!367552) lt!367345))))

(assert (= (and d!104479 res!559093) b!819247))

(assert (= (and b!819247 res!559092) b!819248))

(declare-fun m!760429 () Bool)

(assert (=> d!104479 m!760429))

(declare-fun m!760431 () Bool)

(assert (=> d!104479 m!760431))

(declare-fun m!760433 () Bool)

(assert (=> d!104479 m!760433))

(declare-fun m!760435 () Bool)

(assert (=> d!104479 m!760435))

(declare-fun m!760437 () Bool)

(assert (=> b!819247 m!760437))

(declare-fun m!760439 () Bool)

(assert (=> b!819248 m!760439))

(assert (=> b!819032 d!104479))

(declare-fun d!104481 () Bool)

(assert (=> d!104481 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70506 d!104481))

(declare-fun d!104483 () Bool)

(assert (=> d!104483 (= (array_inv!17413 _keys!976) (bvsge (size!22125 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70506 d!104483))

(declare-fun d!104485 () Bool)

(assert (=> d!104485 (= (array_inv!17414 _values!788) (bvsge (size!22124 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70506 d!104485))

(declare-fun b!819257 () Bool)

(declare-fun e!454953 () Bool)

(declare-fun call!35645 () Bool)

(assert (=> b!819257 (= e!454953 call!35645)))

(declare-fun b!819258 () Bool)

(declare-fun e!454951 () Bool)

(assert (=> b!819258 (= e!454951 call!35645)))

(declare-fun b!819259 () Bool)

(declare-fun e!454952 () Bool)

(assert (=> b!819259 (= e!454952 e!454951)))

(declare-fun c!89095 () Bool)

(assert (=> b!819259 (= c!89095 (validKeyInArray!0 (select (arr!21704 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35642 () Bool)

(assert (=> bm!35642 (= call!35645 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun d!104487 () Bool)

(declare-fun res!559099 () Bool)

(assert (=> d!104487 (=> res!559099 e!454952)))

(assert (=> d!104487 (= res!559099 (bvsge #b00000000000000000000000000000000 (size!22125 _keys!976)))))

(assert (=> d!104487 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!454952)))

(declare-fun b!819260 () Bool)

(assert (=> b!819260 (= e!454951 e!454953)))

(declare-fun lt!367561 () (_ BitVec 64))

(assert (=> b!819260 (= lt!367561 (select (arr!21704 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!367563 () Unit!27931)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45299 (_ BitVec 64) (_ BitVec 32)) Unit!27931)

(assert (=> b!819260 (= lt!367563 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!367561 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!819260 (arrayContainsKey!0 _keys!976 lt!367561 #b00000000000000000000000000000000)))

(declare-fun lt!367562 () Unit!27931)

(assert (=> b!819260 (= lt!367562 lt!367563)))

(declare-fun res!559098 () Bool)

(declare-datatypes ((SeekEntryResult!8722 0))(
  ( (MissingZero!8722 (index!37259 (_ BitVec 32))) (Found!8722 (index!37260 (_ BitVec 32))) (Intermediate!8722 (undefined!9534 Bool) (index!37261 (_ BitVec 32)) (x!69028 (_ BitVec 32))) (Undefined!8722) (MissingVacant!8722 (index!37262 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45299 (_ BitVec 32)) SeekEntryResult!8722)

(assert (=> b!819260 (= res!559098 (= (seekEntryOrOpen!0 (select (arr!21704 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8722 #b00000000000000000000000000000000)))))

(assert (=> b!819260 (=> (not res!559098) (not e!454953))))

(assert (= (and d!104487 (not res!559099)) b!819259))

(assert (= (and b!819259 c!89095) b!819260))

(assert (= (and b!819259 (not c!89095)) b!819258))

(assert (= (and b!819260 res!559098) b!819257))

(assert (= (or b!819257 b!819258) bm!35642))

(assert (=> b!819259 m!760223))

(assert (=> b!819259 m!760223))

(assert (=> b!819259 m!760241))

(declare-fun m!760441 () Bool)

(assert (=> bm!35642 m!760441))

(assert (=> b!819260 m!760223))

(declare-fun m!760443 () Bool)

(assert (=> b!819260 m!760443))

(declare-fun m!760445 () Bool)

(assert (=> b!819260 m!760445))

(assert (=> b!819260 m!760223))

(declare-fun m!760447 () Bool)

(assert (=> b!819260 m!760447))

(assert (=> b!819036 d!104487))

(declare-fun b!819271 () Bool)

(declare-fun e!454962 () Bool)

(declare-fun contains!4140 (List!15483 (_ BitVec 64)) Bool)

(assert (=> b!819271 (= e!454962 (contains!4140 Nil!15480 (select (arr!21704 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!819272 () Bool)

(declare-fun e!454965 () Bool)

(declare-fun call!35648 () Bool)

(assert (=> b!819272 (= e!454965 call!35648)))

(declare-fun b!819273 () Bool)

(declare-fun e!454963 () Bool)

(declare-fun e!454964 () Bool)

(assert (=> b!819273 (= e!454963 e!454964)))

(declare-fun res!559106 () Bool)

(assert (=> b!819273 (=> (not res!559106) (not e!454964))))

(assert (=> b!819273 (= res!559106 (not e!454962))))

(declare-fun res!559108 () Bool)

(assert (=> b!819273 (=> (not res!559108) (not e!454962))))

(assert (=> b!819273 (= res!559108 (validKeyInArray!0 (select (arr!21704 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35645 () Bool)

(declare-fun c!89098 () Bool)

(assert (=> bm!35645 (= call!35648 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89098 (Cons!15479 (select (arr!21704 _keys!976) #b00000000000000000000000000000000) Nil!15480) Nil!15480)))))

(declare-fun d!104489 () Bool)

(declare-fun res!559107 () Bool)

(assert (=> d!104489 (=> res!559107 e!454963)))

(assert (=> d!104489 (= res!559107 (bvsge #b00000000000000000000000000000000 (size!22125 _keys!976)))))

(assert (=> d!104489 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15480) e!454963)))

(declare-fun b!819274 () Bool)

(assert (=> b!819274 (= e!454964 e!454965)))

(assert (=> b!819274 (= c!89098 (validKeyInArray!0 (select (arr!21704 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!819275 () Bool)

(assert (=> b!819275 (= e!454965 call!35648)))

(assert (= (and d!104489 (not res!559107)) b!819273))

(assert (= (and b!819273 res!559108) b!819271))

(assert (= (and b!819273 res!559106) b!819274))

(assert (= (and b!819274 c!89098) b!819275))

(assert (= (and b!819274 (not c!89098)) b!819272))

(assert (= (or b!819275 b!819272) bm!35645))

(assert (=> b!819271 m!760223))

(assert (=> b!819271 m!760223))

(declare-fun m!760449 () Bool)

(assert (=> b!819271 m!760449))

(assert (=> b!819273 m!760223))

(assert (=> b!819273 m!760223))

(assert (=> b!819273 m!760241))

(assert (=> bm!35645 m!760223))

(declare-fun m!760451 () Bool)

(assert (=> bm!35645 m!760451))

(assert (=> b!819274 m!760223))

(assert (=> b!819274 m!760223))

(assert (=> b!819274 m!760241))

(assert (=> b!819033 d!104489))

(declare-fun mapIsEmpty!23452 () Bool)

(declare-fun mapRes!23452 () Bool)

(assert (=> mapIsEmpty!23452 mapRes!23452))

(declare-fun mapNonEmpty!23452 () Bool)

(declare-fun tp!45307 () Bool)

(declare-fun e!454970 () Bool)

(assert (=> mapNonEmpty!23452 (= mapRes!23452 (and tp!45307 e!454970))))

(declare-fun mapKey!23452 () (_ BitVec 32))

(declare-fun mapRest!23452 () (Array (_ BitVec 32) ValueCell!6866))

(declare-fun mapValue!23452 () ValueCell!6866)

(assert (=> mapNonEmpty!23452 (= mapRest!23443 (store mapRest!23452 mapKey!23452 mapValue!23452))))

(declare-fun b!819282 () Bool)

(assert (=> b!819282 (= e!454970 tp_is_empty!14563)))

(declare-fun condMapEmpty!23452 () Bool)

(declare-fun mapDefault!23452 () ValueCell!6866)

(assert (=> mapNonEmpty!23443 (= condMapEmpty!23452 (= mapRest!23443 ((as const (Array (_ BitVec 32) ValueCell!6866)) mapDefault!23452)))))

(declare-fun e!454971 () Bool)

(assert (=> mapNonEmpty!23443 (= tp!45291 (and e!454971 mapRes!23452))))

(declare-fun b!819283 () Bool)

(assert (=> b!819283 (= e!454971 tp_is_empty!14563)))

(assert (= (and mapNonEmpty!23443 condMapEmpty!23452) mapIsEmpty!23452))

(assert (= (and mapNonEmpty!23443 (not condMapEmpty!23452)) mapNonEmpty!23452))

(assert (= (and mapNonEmpty!23452 ((_ is ValueCellFull!6866) mapValue!23452)) b!819282))

(assert (= (and mapNonEmpty!23443 ((_ is ValueCellFull!6866) mapDefault!23452)) b!819283))

(declare-fun m!760453 () Bool)

(assert (=> mapNonEmpty!23452 m!760453))

(declare-fun b_lambda!10941 () Bool)

(assert (= b_lambda!10929 (or (and start!70506 b_free!12853) b_lambda!10941)))

(declare-fun b_lambda!10943 () Bool)

(assert (= b_lambda!10935 (or (and start!70506 b_free!12853) b_lambda!10943)))

(declare-fun b_lambda!10945 () Bool)

(assert (= b_lambda!10937 (or (and start!70506 b_free!12853) b_lambda!10945)))

(declare-fun b_lambda!10947 () Bool)

(assert (= b_lambda!10931 (or (and start!70506 b_free!12853) b_lambda!10947)))

(declare-fun b_lambda!10949 () Bool)

(assert (= b_lambda!10933 (or (and start!70506 b_free!12853) b_lambda!10949)))

(declare-fun b_lambda!10951 () Bool)

(assert (= b_lambda!10939 (or (and start!70506 b_free!12853) b_lambda!10951)))

(check-sat (not b!819233) (not b!819229) (not b!819245) (not b_next!12853) (not b!819244) (not b!819243) (not b!819125) (not b!819130) (not b!819212) (not bm!35631) (not b!819201) (not b!819153) b_and!21673 (not b!819220) (not mapNonEmpty!23452) (not b!819222) (not b!819219) (not b!819260) (not b_lambda!10951) (not b!819126) (not d!104471) (not bm!35633) (not b_lambda!10943) (not d!104465) (not d!104475) (not bm!35635) (not bm!35626) (not bm!35637) (not b!819242) (not d!104467) (not b!819221) (not d!104477) (not b!819274) (not b!819241) (not b!819200) (not d!104469) (not bm!35628) (not d!104461) (not b!819131) (not b!819139) (not b!819240) (not bm!35645) (not b!819128) (not b!819273) (not b!819271) (not b_lambda!10947) (not b!819134) (not b!819142) (not b!819148) tp_is_empty!14563 (not b_lambda!10941) (not b!819127) (not bm!35638) (not bm!35611) (not b!819124) (not b_lambda!10945) (not b!819138) (not d!104473) (not b!819208) (not bm!35610) (not b!819145) (not b!819209) (not b_lambda!10949) (not b!819230) (not b!819203) (not d!104457) (not bm!35642) (not b!819154) (not b!819246) (not d!104459) (not b!819259) (not b!819141) (not b!819248) (not b!819239) (not b!819224) (not bm!35630) (not d!104463) (not b!819144) (not b!819140) (not d!104479) (not b!819199) (not b!819198) (not b!819247))
(check-sat b_and!21673 (not b_next!12853))
