; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71380 () Bool)

(assert start!71380)

(declare-fun b_free!13461 () Bool)

(declare-fun b_next!13461 () Bool)

(assert (=> start!71380 (= b_free!13461 (not b_next!13461))))

(declare-fun tp!47157 () Bool)

(declare-fun b_and!22443 () Bool)

(assert (=> start!71380 (= tp!47157 b_and!22443)))

(declare-fun b!829005 () Bool)

(declare-fun e!462040 () Bool)

(declare-fun tp_is_empty!15171 () Bool)

(assert (=> b!829005 (= e!462040 tp_is_empty!15171)))

(declare-fun b!829006 () Bool)

(declare-fun e!462036 () Bool)

(declare-fun e!462037 () Bool)

(declare-fun mapRes!24397 () Bool)

(assert (=> b!829006 (= e!462036 (and e!462037 mapRes!24397))))

(declare-fun condMapEmpty!24397 () Bool)

(declare-datatypes ((V!25229 0))(
  ( (V!25230 (val!7633 Int)) )
))
(declare-datatypes ((ValueCell!7170 0))(
  ( (ValueCellFull!7170 (v!10071 V!25229)) (EmptyCell!7170) )
))
(declare-datatypes ((array!46504 0))(
  ( (array!46505 (arr!22292 (Array (_ BitVec 32) ValueCell!7170)) (size!22713 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46504)

(declare-fun mapDefault!24397 () ValueCell!7170)

(assert (=> b!829006 (= condMapEmpty!24397 (= (arr!22292 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7170)) mapDefault!24397)))))

(declare-fun b!829007 () Bool)

(declare-fun res!564818 () Bool)

(declare-fun e!462038 () Bool)

(assert (=> b!829007 (=> (not res!564818) (not e!462038))))

(declare-datatypes ((array!46506 0))(
  ( (array!46507 (arr!22293 (Array (_ BitVec 32) (_ BitVec 64))) (size!22714 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46506)

(declare-datatypes ((List!15913 0))(
  ( (Nil!15910) (Cons!15909 (h!17038 (_ BitVec 64)) (t!22270 List!15913)) )
))
(declare-fun arrayNoDuplicates!0 (array!46506 (_ BitVec 32) List!15913) Bool)

(assert (=> b!829007 (= res!564818 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15910))))

(declare-fun res!564820 () Bool)

(assert (=> start!71380 (=> (not res!564820) (not e!462038))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71380 (= res!564820 (validMask!0 mask!1312))))

(assert (=> start!71380 e!462038))

(assert (=> start!71380 tp_is_empty!15171))

(declare-fun array_inv!17757 (array!46506) Bool)

(assert (=> start!71380 (array_inv!17757 _keys!976)))

(assert (=> start!71380 true))

(declare-fun array_inv!17758 (array!46504) Bool)

(assert (=> start!71380 (and (array_inv!17758 _values!788) e!462036)))

(assert (=> start!71380 tp!47157))

(declare-fun mapIsEmpty!24397 () Bool)

(assert (=> mapIsEmpty!24397 mapRes!24397))

(declare-fun b!829008 () Bool)

(declare-fun res!564819 () Bool)

(assert (=> b!829008 (=> (not res!564819) (not e!462038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46506 (_ BitVec 32)) Bool)

(assert (=> b!829008 (= res!564819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!829009 () Bool)

(declare-fun res!564817 () Bool)

(assert (=> b!829009 (=> (not res!564817) (not e!462038))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!829009 (= res!564817 (and (= (size!22713 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22714 _keys!976) (size!22713 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!829010 () Bool)

(declare-fun e!462035 () Bool)

(assert (=> b!829010 (= e!462038 (not e!462035))))

(declare-fun res!564821 () Bool)

(assert (=> b!829010 (=> res!564821 e!462035)))

(assert (=> b!829010 (= res!564821 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!10120 0))(
  ( (tuple2!10121 (_1!5071 (_ BitVec 64)) (_2!5071 V!25229)) )
))
(declare-datatypes ((List!15914 0))(
  ( (Nil!15911) (Cons!15910 (h!17039 tuple2!10120) (t!22271 List!15914)) )
))
(declare-datatypes ((ListLongMap!8943 0))(
  ( (ListLongMap!8944 (toList!4487 List!15914)) )
))
(declare-fun lt!375808 () ListLongMap!8943)

(declare-fun lt!375809 () ListLongMap!8943)

(assert (=> b!829010 (= lt!375808 lt!375809)))

(declare-fun zeroValueBefore!34 () V!25229)

(declare-fun zeroValueAfter!34 () V!25229)

(declare-fun minValue!754 () V!25229)

(declare-datatypes ((Unit!28395 0))(
  ( (Unit!28396) )
))
(declare-fun lt!375810 () Unit!28395)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!576 (array!46506 array!46504 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25229 V!25229 V!25229 V!25229 (_ BitVec 32) Int) Unit!28395)

(assert (=> b!829010 (= lt!375810 (lemmaNoChangeToArrayThenSameMapNoExtras!576 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2488 (array!46506 array!46504 (_ BitVec 32) (_ BitVec 32) V!25229 V!25229 (_ BitVec 32) Int) ListLongMap!8943)

(assert (=> b!829010 (= lt!375809 (getCurrentListMapNoExtraKeys!2488 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829010 (= lt!375808 (getCurrentListMapNoExtraKeys!2488 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24397 () Bool)

(declare-fun tp!47158 () Bool)

(assert (=> mapNonEmpty!24397 (= mapRes!24397 (and tp!47158 e!462040))))

(declare-fun mapKey!24397 () (_ BitVec 32))

(declare-fun mapValue!24397 () ValueCell!7170)

(declare-fun mapRest!24397 () (Array (_ BitVec 32) ValueCell!7170))

(assert (=> mapNonEmpty!24397 (= (arr!22292 _values!788) (store mapRest!24397 mapKey!24397 mapValue!24397))))

(declare-fun b!829011 () Bool)

(declare-fun getCurrentListMap!2587 (array!46506 array!46504 (_ BitVec 32) (_ BitVec 32) V!25229 V!25229 (_ BitVec 32) Int) ListLongMap!8943)

(declare-fun +!1968 (ListLongMap!8943 tuple2!10120) ListLongMap!8943)

(assert (=> b!829011 (= e!462035 (= (getCurrentListMap!2587 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1968 lt!375808 (tuple2!10121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!375811 () ListLongMap!8943)

(assert (=> b!829011 (= lt!375811 (getCurrentListMap!2587 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829012 () Bool)

(assert (=> b!829012 (= e!462037 tp_is_empty!15171)))

(assert (= (and start!71380 res!564820) b!829009))

(assert (= (and b!829009 res!564817) b!829008))

(assert (= (and b!829008 res!564819) b!829007))

(assert (= (and b!829007 res!564818) b!829010))

(assert (= (and b!829010 (not res!564821)) b!829011))

(assert (= (and b!829006 condMapEmpty!24397) mapIsEmpty!24397))

(assert (= (and b!829006 (not condMapEmpty!24397)) mapNonEmpty!24397))

(get-info :version)

(assert (= (and mapNonEmpty!24397 ((_ is ValueCellFull!7170) mapValue!24397)) b!829005))

(assert (= (and b!829006 ((_ is ValueCellFull!7170) mapDefault!24397)) b!829012))

(assert (= start!71380 b!829006))

(declare-fun m!771989 () Bool)

(assert (=> b!829010 m!771989))

(declare-fun m!771991 () Bool)

(assert (=> b!829010 m!771991))

(declare-fun m!771993 () Bool)

(assert (=> b!829010 m!771993))

(declare-fun m!771995 () Bool)

(assert (=> b!829007 m!771995))

(declare-fun m!771997 () Bool)

(assert (=> b!829011 m!771997))

(declare-fun m!771999 () Bool)

(assert (=> b!829011 m!771999))

(declare-fun m!772001 () Bool)

(assert (=> b!829011 m!772001))

(declare-fun m!772003 () Bool)

(assert (=> start!71380 m!772003))

(declare-fun m!772005 () Bool)

(assert (=> start!71380 m!772005))

(declare-fun m!772007 () Bool)

(assert (=> start!71380 m!772007))

(declare-fun m!772009 () Bool)

(assert (=> b!829008 m!772009))

(declare-fun m!772011 () Bool)

(assert (=> mapNonEmpty!24397 m!772011))

(check-sat (not b_next!13461) (not start!71380) (not b!829008) (not mapNonEmpty!24397) (not b!829007) b_and!22443 (not b!829011) (not b!829010) tp_is_empty!15171)
(check-sat b_and!22443 (not b_next!13461))
(get-model)

(declare-fun d!105225 () Bool)

(assert (=> d!105225 (= (getCurrentListMapNoExtraKeys!2488 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2488 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375826 () Unit!28395)

(declare-fun choose!1412 (array!46506 array!46504 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25229 V!25229 V!25229 V!25229 (_ BitVec 32) Int) Unit!28395)

(assert (=> d!105225 (= lt!375826 (choose!1412 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105225 (validMask!0 mask!1312)))

(assert (=> d!105225 (= (lemmaNoChangeToArrayThenSameMapNoExtras!576 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375826)))

(declare-fun bs!23162 () Bool)

(assert (= bs!23162 d!105225))

(assert (=> bs!23162 m!771993))

(assert (=> bs!23162 m!771991))

(declare-fun m!772037 () Bool)

(assert (=> bs!23162 m!772037))

(assert (=> bs!23162 m!772003))

(assert (=> b!829010 d!105225))

(declare-fun b!829061 () Bool)

(declare-fun e!462077 () ListLongMap!8943)

(declare-fun e!462075 () ListLongMap!8943)

(assert (=> b!829061 (= e!462077 e!462075)))

(declare-fun c!89691 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!829061 (= c!89691 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun call!36073 () ListLongMap!8943)

(declare-fun bm!36070 () Bool)

(assert (=> bm!36070 (= call!36073 (getCurrentListMapNoExtraKeys!2488 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!829062 () Bool)

(declare-fun lt!375841 () Unit!28395)

(declare-fun lt!375843 () Unit!28395)

(assert (=> b!829062 (= lt!375841 lt!375843)))

(declare-fun lt!375842 () ListLongMap!8943)

(declare-fun lt!375846 () (_ BitVec 64))

(declare-fun lt!375847 () (_ BitVec 64))

(declare-fun lt!375844 () V!25229)

(declare-fun contains!4196 (ListLongMap!8943 (_ BitVec 64)) Bool)

(assert (=> b!829062 (not (contains!4196 (+!1968 lt!375842 (tuple2!10121 lt!375847 lt!375844)) lt!375846))))

(declare-fun addStillNotContains!193 (ListLongMap!8943 (_ BitVec 64) V!25229 (_ BitVec 64)) Unit!28395)

(assert (=> b!829062 (= lt!375843 (addStillNotContains!193 lt!375842 lt!375847 lt!375844 lt!375846))))

(assert (=> b!829062 (= lt!375846 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11801 (ValueCell!7170 V!25229) V!25229)

(declare-fun dynLambda!979 (Int (_ BitVec 64)) V!25229)

(assert (=> b!829062 (= lt!375844 (get!11801 (select (arr!22292 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!829062 (= lt!375847 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829062 (= lt!375842 call!36073)))

(assert (=> b!829062 (= e!462075 (+!1968 call!36073 (tuple2!10121 (select (arr!22293 _keys!976) #b00000000000000000000000000000000) (get!11801 (select (arr!22292 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!829063 () Bool)

(declare-fun res!564848 () Bool)

(declare-fun e!462073 () Bool)

(assert (=> b!829063 (=> (not res!564848) (not e!462073))))

(declare-fun lt!375845 () ListLongMap!8943)

(assert (=> b!829063 (= res!564848 (not (contains!4196 lt!375845 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!829064 () Bool)

(declare-fun e!462079 () Bool)

(declare-fun e!462076 () Bool)

(assert (=> b!829064 (= e!462079 e!462076)))

(declare-fun c!89693 () Bool)

(assert (=> b!829064 (= c!89693 (bvslt #b00000000000000000000000000000000 (size!22714 _keys!976)))))

(declare-fun b!829065 () Bool)

(declare-fun isEmpty!650 (ListLongMap!8943) Bool)

(assert (=> b!829065 (= e!462076 (isEmpty!650 lt!375845))))

(declare-fun d!105227 () Bool)

(assert (=> d!105227 e!462073))

(declare-fun res!564845 () Bool)

(assert (=> d!105227 (=> (not res!564845) (not e!462073))))

(assert (=> d!105227 (= res!564845 (not (contains!4196 lt!375845 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105227 (= lt!375845 e!462077)))

(declare-fun c!89692 () Bool)

(assert (=> d!105227 (= c!89692 (bvsge #b00000000000000000000000000000000 (size!22714 _keys!976)))))

(assert (=> d!105227 (validMask!0 mask!1312)))

(assert (=> d!105227 (= (getCurrentListMapNoExtraKeys!2488 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375845)))

(declare-fun b!829066 () Bool)

(assert (=> b!829066 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22714 _keys!976)))))

(assert (=> b!829066 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22713 _values!788)))))

(declare-fun e!462074 () Bool)

(declare-fun apply!368 (ListLongMap!8943 (_ BitVec 64)) V!25229)

(assert (=> b!829066 (= e!462074 (= (apply!368 lt!375845 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)) (get!11801 (select (arr!22292 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!829067 () Bool)

(assert (=> b!829067 (= e!462076 (= lt!375845 (getCurrentListMapNoExtraKeys!2488 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!829068 () Bool)

(assert (=> b!829068 (= e!462079 e!462074)))

(assert (=> b!829068 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22714 _keys!976)))))

(declare-fun res!564847 () Bool)

(assert (=> b!829068 (= res!564847 (contains!4196 lt!375845 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829068 (=> (not res!564847) (not e!462074))))

(declare-fun b!829069 () Bool)

(assert (=> b!829069 (= e!462075 call!36073)))

(declare-fun b!829070 () Bool)

(assert (=> b!829070 (= e!462077 (ListLongMap!8944 Nil!15911))))

(declare-fun b!829071 () Bool)

(assert (=> b!829071 (= e!462073 e!462079)))

(declare-fun c!89694 () Bool)

(declare-fun e!462078 () Bool)

(assert (=> b!829071 (= c!89694 e!462078)))

(declare-fun res!564846 () Bool)

(assert (=> b!829071 (=> (not res!564846) (not e!462078))))

(assert (=> b!829071 (= res!564846 (bvslt #b00000000000000000000000000000000 (size!22714 _keys!976)))))

(declare-fun b!829072 () Bool)

(assert (=> b!829072 (= e!462078 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829072 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!105227 c!89692) b!829070))

(assert (= (and d!105227 (not c!89692)) b!829061))

(assert (= (and b!829061 c!89691) b!829062))

(assert (= (and b!829061 (not c!89691)) b!829069))

(assert (= (or b!829062 b!829069) bm!36070))

(assert (= (and d!105227 res!564845) b!829063))

(assert (= (and b!829063 res!564848) b!829071))

(assert (= (and b!829071 res!564846) b!829072))

(assert (= (and b!829071 c!89694) b!829068))

(assert (= (and b!829071 (not c!89694)) b!829064))

(assert (= (and b!829068 res!564847) b!829066))

(assert (= (and b!829064 c!89693) b!829067))

(assert (= (and b!829064 (not c!89693)) b!829065))

(declare-fun b_lambda!11251 () Bool)

(assert (=> (not b_lambda!11251) (not b!829062)))

(declare-fun t!22275 () Bool)

(declare-fun tb!4217 () Bool)

(assert (=> (and start!71380 (= defaultEntry!796 defaultEntry!796) t!22275) tb!4217))

(declare-fun result!7991 () Bool)

(assert (=> tb!4217 (= result!7991 tp_is_empty!15171)))

(assert (=> b!829062 t!22275))

(declare-fun b_and!22447 () Bool)

(assert (= b_and!22443 (and (=> t!22275 result!7991) b_and!22447)))

(declare-fun b_lambda!11253 () Bool)

(assert (=> (not b_lambda!11253) (not b!829066)))

(assert (=> b!829066 t!22275))

(declare-fun b_and!22449 () Bool)

(assert (= b_and!22447 (and (=> t!22275 result!7991) b_and!22449)))

(declare-fun m!772039 () Bool)

(assert (=> b!829066 m!772039))

(declare-fun m!772041 () Bool)

(assert (=> b!829066 m!772041))

(assert (=> b!829066 m!772039))

(declare-fun m!772043 () Bool)

(assert (=> b!829066 m!772043))

(declare-fun m!772045 () Bool)

(assert (=> b!829066 m!772045))

(assert (=> b!829066 m!772041))

(declare-fun m!772047 () Bool)

(assert (=> b!829066 m!772047))

(assert (=> b!829066 m!772045))

(declare-fun m!772049 () Bool)

(assert (=> bm!36070 m!772049))

(assert (=> b!829072 m!772039))

(assert (=> b!829072 m!772039))

(declare-fun m!772051 () Bool)

(assert (=> b!829072 m!772051))

(assert (=> b!829068 m!772039))

(assert (=> b!829068 m!772039))

(declare-fun m!772053 () Bool)

(assert (=> b!829068 m!772053))

(assert (=> b!829061 m!772039))

(assert (=> b!829061 m!772039))

(assert (=> b!829061 m!772051))

(declare-fun m!772055 () Bool)

(assert (=> b!829065 m!772055))

(declare-fun m!772057 () Bool)

(assert (=> d!105227 m!772057))

(assert (=> d!105227 m!772003))

(assert (=> b!829067 m!772049))

(declare-fun m!772059 () Bool)

(assert (=> b!829062 m!772059))

(assert (=> b!829062 m!772039))

(assert (=> b!829062 m!772041))

(declare-fun m!772061 () Bool)

(assert (=> b!829062 m!772061))

(declare-fun m!772063 () Bool)

(assert (=> b!829062 m!772063))

(assert (=> b!829062 m!772045))

(assert (=> b!829062 m!772041))

(assert (=> b!829062 m!772047))

(assert (=> b!829062 m!772045))

(assert (=> b!829062 m!772059))

(declare-fun m!772065 () Bool)

(assert (=> b!829062 m!772065))

(declare-fun m!772067 () Bool)

(assert (=> b!829063 m!772067))

(assert (=> b!829010 d!105227))

(declare-fun b!829075 () Bool)

(declare-fun e!462084 () ListLongMap!8943)

(declare-fun e!462082 () ListLongMap!8943)

(assert (=> b!829075 (= e!462084 e!462082)))

(declare-fun c!89695 () Bool)

(assert (=> b!829075 (= c!89695 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36071 () Bool)

(declare-fun call!36074 () ListLongMap!8943)

(assert (=> bm!36071 (= call!36074 (getCurrentListMapNoExtraKeys!2488 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!829076 () Bool)

(declare-fun lt!375848 () Unit!28395)

(declare-fun lt!375850 () Unit!28395)

(assert (=> b!829076 (= lt!375848 lt!375850)))

(declare-fun lt!375851 () V!25229)

(declare-fun lt!375854 () (_ BitVec 64))

(declare-fun lt!375849 () ListLongMap!8943)

(declare-fun lt!375853 () (_ BitVec 64))

(assert (=> b!829076 (not (contains!4196 (+!1968 lt!375849 (tuple2!10121 lt!375854 lt!375851)) lt!375853))))

(assert (=> b!829076 (= lt!375850 (addStillNotContains!193 lt!375849 lt!375854 lt!375851 lt!375853))))

(assert (=> b!829076 (= lt!375853 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!829076 (= lt!375851 (get!11801 (select (arr!22292 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!829076 (= lt!375854 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829076 (= lt!375849 call!36074)))

(assert (=> b!829076 (= e!462082 (+!1968 call!36074 (tuple2!10121 (select (arr!22293 _keys!976) #b00000000000000000000000000000000) (get!11801 (select (arr!22292 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!829077 () Bool)

(declare-fun res!564852 () Bool)

(declare-fun e!462080 () Bool)

(assert (=> b!829077 (=> (not res!564852) (not e!462080))))

(declare-fun lt!375852 () ListLongMap!8943)

(assert (=> b!829077 (= res!564852 (not (contains!4196 lt!375852 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!829078 () Bool)

(declare-fun e!462086 () Bool)

(declare-fun e!462083 () Bool)

(assert (=> b!829078 (= e!462086 e!462083)))

(declare-fun c!89697 () Bool)

(assert (=> b!829078 (= c!89697 (bvslt #b00000000000000000000000000000000 (size!22714 _keys!976)))))

(declare-fun b!829079 () Bool)

(assert (=> b!829079 (= e!462083 (isEmpty!650 lt!375852))))

(declare-fun d!105229 () Bool)

(assert (=> d!105229 e!462080))

(declare-fun res!564849 () Bool)

(assert (=> d!105229 (=> (not res!564849) (not e!462080))))

(assert (=> d!105229 (= res!564849 (not (contains!4196 lt!375852 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105229 (= lt!375852 e!462084)))

(declare-fun c!89696 () Bool)

(assert (=> d!105229 (= c!89696 (bvsge #b00000000000000000000000000000000 (size!22714 _keys!976)))))

(assert (=> d!105229 (validMask!0 mask!1312)))

(assert (=> d!105229 (= (getCurrentListMapNoExtraKeys!2488 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375852)))

(declare-fun b!829080 () Bool)

(assert (=> b!829080 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22714 _keys!976)))))

(assert (=> b!829080 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22713 _values!788)))))

(declare-fun e!462081 () Bool)

(assert (=> b!829080 (= e!462081 (= (apply!368 lt!375852 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)) (get!11801 (select (arr!22292 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!829081 () Bool)

(assert (=> b!829081 (= e!462083 (= lt!375852 (getCurrentListMapNoExtraKeys!2488 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!829082 () Bool)

(assert (=> b!829082 (= e!462086 e!462081)))

(assert (=> b!829082 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22714 _keys!976)))))

(declare-fun res!564851 () Bool)

(assert (=> b!829082 (= res!564851 (contains!4196 lt!375852 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829082 (=> (not res!564851) (not e!462081))))

(declare-fun b!829083 () Bool)

(assert (=> b!829083 (= e!462082 call!36074)))

(declare-fun b!829084 () Bool)

(assert (=> b!829084 (= e!462084 (ListLongMap!8944 Nil!15911))))

(declare-fun b!829085 () Bool)

(assert (=> b!829085 (= e!462080 e!462086)))

(declare-fun c!89698 () Bool)

(declare-fun e!462085 () Bool)

(assert (=> b!829085 (= c!89698 e!462085)))

(declare-fun res!564850 () Bool)

(assert (=> b!829085 (=> (not res!564850) (not e!462085))))

(assert (=> b!829085 (= res!564850 (bvslt #b00000000000000000000000000000000 (size!22714 _keys!976)))))

(declare-fun b!829086 () Bool)

(assert (=> b!829086 (= e!462085 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829086 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!105229 c!89696) b!829084))

(assert (= (and d!105229 (not c!89696)) b!829075))

(assert (= (and b!829075 c!89695) b!829076))

(assert (= (and b!829075 (not c!89695)) b!829083))

(assert (= (or b!829076 b!829083) bm!36071))

(assert (= (and d!105229 res!564849) b!829077))

(assert (= (and b!829077 res!564852) b!829085))

(assert (= (and b!829085 res!564850) b!829086))

(assert (= (and b!829085 c!89698) b!829082))

(assert (= (and b!829085 (not c!89698)) b!829078))

(assert (= (and b!829082 res!564851) b!829080))

(assert (= (and b!829078 c!89697) b!829081))

(assert (= (and b!829078 (not c!89697)) b!829079))

(declare-fun b_lambda!11255 () Bool)

(assert (=> (not b_lambda!11255) (not b!829076)))

(assert (=> b!829076 t!22275))

(declare-fun b_and!22451 () Bool)

(assert (= b_and!22449 (and (=> t!22275 result!7991) b_and!22451)))

(declare-fun b_lambda!11257 () Bool)

(assert (=> (not b_lambda!11257) (not b!829080)))

(assert (=> b!829080 t!22275))

(declare-fun b_and!22453 () Bool)

(assert (= b_and!22451 (and (=> t!22275 result!7991) b_and!22453)))

(assert (=> b!829080 m!772039))

(assert (=> b!829080 m!772041))

(assert (=> b!829080 m!772039))

(declare-fun m!772069 () Bool)

(assert (=> b!829080 m!772069))

(assert (=> b!829080 m!772045))

(assert (=> b!829080 m!772041))

(assert (=> b!829080 m!772047))

(assert (=> b!829080 m!772045))

(declare-fun m!772071 () Bool)

(assert (=> bm!36071 m!772071))

(assert (=> b!829086 m!772039))

(assert (=> b!829086 m!772039))

(assert (=> b!829086 m!772051))

(assert (=> b!829082 m!772039))

(assert (=> b!829082 m!772039))

(declare-fun m!772073 () Bool)

(assert (=> b!829082 m!772073))

(assert (=> b!829075 m!772039))

(assert (=> b!829075 m!772039))

(assert (=> b!829075 m!772051))

(declare-fun m!772075 () Bool)

(assert (=> b!829079 m!772075))

(declare-fun m!772077 () Bool)

(assert (=> d!105229 m!772077))

(assert (=> d!105229 m!772003))

(assert (=> b!829081 m!772071))

(declare-fun m!772079 () Bool)

(assert (=> b!829076 m!772079))

(assert (=> b!829076 m!772039))

(assert (=> b!829076 m!772041))

(declare-fun m!772081 () Bool)

(assert (=> b!829076 m!772081))

(declare-fun m!772083 () Bool)

(assert (=> b!829076 m!772083))

(assert (=> b!829076 m!772045))

(assert (=> b!829076 m!772041))

(assert (=> b!829076 m!772047))

(assert (=> b!829076 m!772045))

(assert (=> b!829076 m!772079))

(declare-fun m!772085 () Bool)

(assert (=> b!829076 m!772085))

(declare-fun m!772087 () Bool)

(assert (=> b!829077 m!772087))

(assert (=> b!829010 d!105229))

(declare-fun b!829097 () Bool)

(declare-fun e!462098 () Bool)

(declare-fun call!36077 () Bool)

(assert (=> b!829097 (= e!462098 call!36077)))

(declare-fun bm!36074 () Bool)

(declare-fun c!89701 () Bool)

(assert (=> bm!36074 (= call!36077 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89701 (Cons!15909 (select (arr!22293 _keys!976) #b00000000000000000000000000000000) Nil!15910) Nil!15910)))))

(declare-fun d!105231 () Bool)

(declare-fun res!564861 () Bool)

(declare-fun e!462095 () Bool)

(assert (=> d!105231 (=> res!564861 e!462095)))

(assert (=> d!105231 (= res!564861 (bvsge #b00000000000000000000000000000000 (size!22714 _keys!976)))))

(assert (=> d!105231 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15910) e!462095)))

(declare-fun b!829098 () Bool)

(declare-fun e!462096 () Bool)

(assert (=> b!829098 (= e!462095 e!462096)))

(declare-fun res!564860 () Bool)

(assert (=> b!829098 (=> (not res!564860) (not e!462096))))

(declare-fun e!462097 () Bool)

(assert (=> b!829098 (= res!564860 (not e!462097))))

(declare-fun res!564859 () Bool)

(assert (=> b!829098 (=> (not res!564859) (not e!462097))))

(assert (=> b!829098 (= res!564859 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829099 () Bool)

(declare-fun contains!4197 (List!15913 (_ BitVec 64)) Bool)

(assert (=> b!829099 (= e!462097 (contains!4197 Nil!15910 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829100 () Bool)

(assert (=> b!829100 (= e!462096 e!462098)))

(assert (=> b!829100 (= c!89701 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829101 () Bool)

(assert (=> b!829101 (= e!462098 call!36077)))

(assert (= (and d!105231 (not res!564861)) b!829098))

(assert (= (and b!829098 res!564859) b!829099))

(assert (= (and b!829098 res!564860) b!829100))

(assert (= (and b!829100 c!89701) b!829101))

(assert (= (and b!829100 (not c!89701)) b!829097))

(assert (= (or b!829101 b!829097) bm!36074))

(assert (=> bm!36074 m!772039))

(declare-fun m!772089 () Bool)

(assert (=> bm!36074 m!772089))

(assert (=> b!829098 m!772039))

(assert (=> b!829098 m!772039))

(assert (=> b!829098 m!772051))

(assert (=> b!829099 m!772039))

(assert (=> b!829099 m!772039))

(declare-fun m!772091 () Bool)

(assert (=> b!829099 m!772091))

(assert (=> b!829100 m!772039))

(assert (=> b!829100 m!772039))

(assert (=> b!829100 m!772051))

(assert (=> b!829007 d!105231))

(declare-fun b!829144 () Bool)

(declare-fun e!462129 () Bool)

(declare-fun e!462131 () Bool)

(assert (=> b!829144 (= e!462129 e!462131)))

(declare-fun res!564887 () Bool)

(assert (=> b!829144 (=> (not res!564887) (not e!462131))))

(declare-fun lt!375914 () ListLongMap!8943)

(assert (=> b!829144 (= res!564887 (contains!4196 lt!375914 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829144 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22714 _keys!976)))))

(declare-fun bm!36089 () Bool)

(declare-fun call!36094 () Bool)

(assert (=> bm!36089 (= call!36094 (contains!4196 lt!375914 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!105233 () Bool)

(declare-fun e!462128 () Bool)

(assert (=> d!105233 e!462128))

(declare-fun res!564886 () Bool)

(assert (=> d!105233 (=> (not res!564886) (not e!462128))))

(assert (=> d!105233 (= res!564886 (or (bvsge #b00000000000000000000000000000000 (size!22714 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22714 _keys!976)))))))

(declare-fun lt!375901 () ListLongMap!8943)

(assert (=> d!105233 (= lt!375914 lt!375901)))

(declare-fun lt!375918 () Unit!28395)

(declare-fun e!462130 () Unit!28395)

(assert (=> d!105233 (= lt!375918 e!462130)))

(declare-fun c!89715 () Bool)

(declare-fun e!462132 () Bool)

(assert (=> d!105233 (= c!89715 e!462132)))

(declare-fun res!564882 () Bool)

(assert (=> d!105233 (=> (not res!564882) (not e!462132))))

(assert (=> d!105233 (= res!564882 (bvslt #b00000000000000000000000000000000 (size!22714 _keys!976)))))

(declare-fun e!462136 () ListLongMap!8943)

(assert (=> d!105233 (= lt!375901 e!462136)))

(declare-fun c!89716 () Bool)

(assert (=> d!105233 (= c!89716 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105233 (validMask!0 mask!1312)))

(assert (=> d!105233 (= (getCurrentListMap!2587 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375914)))

(declare-fun b!829145 () Bool)

(declare-fun lt!375903 () Unit!28395)

(assert (=> b!829145 (= e!462130 lt!375903)))

(declare-fun lt!375902 () ListLongMap!8943)

(assert (=> b!829145 (= lt!375902 (getCurrentListMapNoExtraKeys!2488 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375911 () (_ BitVec 64))

(assert (=> b!829145 (= lt!375911 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375919 () (_ BitVec 64))

(assert (=> b!829145 (= lt!375919 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375915 () Unit!28395)

(declare-fun addStillContains!319 (ListLongMap!8943 (_ BitVec 64) V!25229 (_ BitVec 64)) Unit!28395)

(assert (=> b!829145 (= lt!375915 (addStillContains!319 lt!375902 lt!375911 zeroValueBefore!34 lt!375919))))

(assert (=> b!829145 (contains!4196 (+!1968 lt!375902 (tuple2!10121 lt!375911 zeroValueBefore!34)) lt!375919)))

(declare-fun lt!375912 () Unit!28395)

(assert (=> b!829145 (= lt!375912 lt!375915)))

(declare-fun lt!375905 () ListLongMap!8943)

(assert (=> b!829145 (= lt!375905 (getCurrentListMapNoExtraKeys!2488 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375900 () (_ BitVec 64))

(assert (=> b!829145 (= lt!375900 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375913 () (_ BitVec 64))

(assert (=> b!829145 (= lt!375913 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375910 () Unit!28395)

(declare-fun addApplyDifferent!319 (ListLongMap!8943 (_ BitVec 64) V!25229 (_ BitVec 64)) Unit!28395)

(assert (=> b!829145 (= lt!375910 (addApplyDifferent!319 lt!375905 lt!375900 minValue!754 lt!375913))))

(assert (=> b!829145 (= (apply!368 (+!1968 lt!375905 (tuple2!10121 lt!375900 minValue!754)) lt!375913) (apply!368 lt!375905 lt!375913))))

(declare-fun lt!375916 () Unit!28395)

(assert (=> b!829145 (= lt!375916 lt!375910)))

(declare-fun lt!375907 () ListLongMap!8943)

(assert (=> b!829145 (= lt!375907 (getCurrentListMapNoExtraKeys!2488 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375899 () (_ BitVec 64))

(assert (=> b!829145 (= lt!375899 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375909 () (_ BitVec 64))

(assert (=> b!829145 (= lt!375909 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375906 () Unit!28395)

(assert (=> b!829145 (= lt!375906 (addApplyDifferent!319 lt!375907 lt!375899 zeroValueBefore!34 lt!375909))))

(assert (=> b!829145 (= (apply!368 (+!1968 lt!375907 (tuple2!10121 lt!375899 zeroValueBefore!34)) lt!375909) (apply!368 lt!375907 lt!375909))))

(declare-fun lt!375904 () Unit!28395)

(assert (=> b!829145 (= lt!375904 lt!375906)))

(declare-fun lt!375920 () ListLongMap!8943)

(assert (=> b!829145 (= lt!375920 (getCurrentListMapNoExtraKeys!2488 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375908 () (_ BitVec 64))

(assert (=> b!829145 (= lt!375908 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375917 () (_ BitVec 64))

(assert (=> b!829145 (= lt!375917 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829145 (= lt!375903 (addApplyDifferent!319 lt!375920 lt!375908 minValue!754 lt!375917))))

(assert (=> b!829145 (= (apply!368 (+!1968 lt!375920 (tuple2!10121 lt!375908 minValue!754)) lt!375917) (apply!368 lt!375920 lt!375917))))

(declare-fun call!36098 () ListLongMap!8943)

(declare-fun call!36095 () ListLongMap!8943)

(declare-fun call!36093 () ListLongMap!8943)

(declare-fun call!36092 () ListLongMap!8943)

(declare-fun c!89718 () Bool)

(declare-fun bm!36090 () Bool)

(assert (=> bm!36090 (= call!36092 (+!1968 (ite c!89716 call!36093 (ite c!89718 call!36095 call!36098)) (ite (or c!89716 c!89718) (tuple2!10121 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!36091 () Bool)

(declare-fun call!36097 () Bool)

(assert (=> bm!36091 (= call!36097 (contains!4196 lt!375914 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829146 () Bool)

(declare-fun e!462125 () Bool)

(assert (=> b!829146 (= e!462125 (= (apply!368 lt!375914 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!829147 () Bool)

(declare-fun res!564884 () Bool)

(assert (=> b!829147 (=> (not res!564884) (not e!462128))))

(assert (=> b!829147 (= res!564884 e!462129)))

(declare-fun res!564883 () Bool)

(assert (=> b!829147 (=> res!564883 e!462129)))

(declare-fun e!462134 () Bool)

(assert (=> b!829147 (= res!564883 (not e!462134))))

(declare-fun res!564880 () Bool)

(assert (=> b!829147 (=> (not res!564880) (not e!462134))))

(assert (=> b!829147 (= res!564880 (bvslt #b00000000000000000000000000000000 (size!22714 _keys!976)))))

(declare-fun b!829148 () Bool)

(declare-fun e!462127 () Bool)

(assert (=> b!829148 (= e!462127 (= (apply!368 lt!375914 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!829149 () Bool)

(assert (=> b!829149 (= e!462132 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829150 () Bool)

(assert (=> b!829150 (= e!462136 (+!1968 call!36092 (tuple2!10121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!829151 () Bool)

(assert (=> b!829151 (= e!462131 (= (apply!368 lt!375914 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)) (get!11801 (select (arr!22292 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!829151 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22713 _values!788)))))

(assert (=> b!829151 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22714 _keys!976)))))

(declare-fun b!829152 () Bool)

(declare-fun e!462135 () Bool)

(assert (=> b!829152 (= e!462128 e!462135)))

(declare-fun c!89714 () Bool)

(assert (=> b!829152 (= c!89714 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!829153 () Bool)

(declare-fun e!462133 () ListLongMap!8943)

(declare-fun call!36096 () ListLongMap!8943)

(assert (=> b!829153 (= e!462133 call!36096)))

(declare-fun b!829154 () Bool)

(assert (=> b!829154 (= e!462133 call!36098)))

(declare-fun b!829155 () Bool)

(assert (=> b!829155 (= e!462135 e!462127)))

(declare-fun res!564888 () Bool)

(assert (=> b!829155 (= res!564888 call!36097)))

(assert (=> b!829155 (=> (not res!564888) (not e!462127))))

(declare-fun b!829156 () Bool)

(declare-fun res!564881 () Bool)

(assert (=> b!829156 (=> (not res!564881) (not e!462128))))

(declare-fun e!462137 () Bool)

(assert (=> b!829156 (= res!564881 e!462137)))

(declare-fun c!89717 () Bool)

(assert (=> b!829156 (= c!89717 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!829157 () Bool)

(assert (=> b!829157 (= e!462135 (not call!36097))))

(declare-fun b!829158 () Bool)

(assert (=> b!829158 (= e!462134 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829159 () Bool)

(assert (=> b!829159 (= e!462137 e!462125)))

(declare-fun res!564885 () Bool)

(assert (=> b!829159 (= res!564885 call!36094)))

(assert (=> b!829159 (=> (not res!564885) (not e!462125))))

(declare-fun bm!36092 () Bool)

(assert (=> bm!36092 (= call!36093 (getCurrentListMapNoExtraKeys!2488 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829160 () Bool)

(assert (=> b!829160 (= e!462137 (not call!36094))))

(declare-fun b!829161 () Bool)

(declare-fun Unit!28399 () Unit!28395)

(assert (=> b!829161 (= e!462130 Unit!28399)))

(declare-fun bm!36093 () Bool)

(assert (=> bm!36093 (= call!36096 call!36092)))

(declare-fun bm!36094 () Bool)

(assert (=> bm!36094 (= call!36095 call!36093)))

(declare-fun b!829162 () Bool)

(declare-fun e!462126 () ListLongMap!8943)

(assert (=> b!829162 (= e!462136 e!462126)))

(assert (=> b!829162 (= c!89718 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!829163 () Bool)

(assert (=> b!829163 (= e!462126 call!36096)))

(declare-fun b!829164 () Bool)

(declare-fun c!89719 () Bool)

(assert (=> b!829164 (= c!89719 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!829164 (= e!462126 e!462133)))

(declare-fun bm!36095 () Bool)

(assert (=> bm!36095 (= call!36098 call!36095)))

(assert (= (and d!105233 c!89716) b!829150))

(assert (= (and d!105233 (not c!89716)) b!829162))

(assert (= (and b!829162 c!89718) b!829163))

(assert (= (and b!829162 (not c!89718)) b!829164))

(assert (= (and b!829164 c!89719) b!829153))

(assert (= (and b!829164 (not c!89719)) b!829154))

(assert (= (or b!829153 b!829154) bm!36095))

(assert (= (or b!829163 bm!36095) bm!36094))

(assert (= (or b!829163 b!829153) bm!36093))

(assert (= (or b!829150 bm!36094) bm!36092))

(assert (= (or b!829150 bm!36093) bm!36090))

(assert (= (and d!105233 res!564882) b!829149))

(assert (= (and d!105233 c!89715) b!829145))

(assert (= (and d!105233 (not c!89715)) b!829161))

(assert (= (and d!105233 res!564886) b!829147))

(assert (= (and b!829147 res!564880) b!829158))

(assert (= (and b!829147 (not res!564883)) b!829144))

(assert (= (and b!829144 res!564887) b!829151))

(assert (= (and b!829147 res!564884) b!829156))

(assert (= (and b!829156 c!89717) b!829159))

(assert (= (and b!829156 (not c!89717)) b!829160))

(assert (= (and b!829159 res!564885) b!829146))

(assert (= (or b!829159 b!829160) bm!36089))

(assert (= (and b!829156 res!564881) b!829152))

(assert (= (and b!829152 c!89714) b!829155))

(assert (= (and b!829152 (not c!89714)) b!829157))

(assert (= (and b!829155 res!564888) b!829148))

(assert (= (or b!829155 b!829157) bm!36091))

(declare-fun b_lambda!11259 () Bool)

(assert (=> (not b_lambda!11259) (not b!829151)))

(assert (=> b!829151 t!22275))

(declare-fun b_and!22455 () Bool)

(assert (= b_and!22453 (and (=> t!22275 result!7991) b_and!22455)))

(declare-fun m!772093 () Bool)

(assert (=> bm!36089 m!772093))

(declare-fun m!772095 () Bool)

(assert (=> bm!36090 m!772095))

(assert (=> b!829151 m!772039))

(assert (=> b!829151 m!772045))

(assert (=> b!829151 m!772039))

(declare-fun m!772097 () Bool)

(assert (=> b!829151 m!772097))

(assert (=> b!829151 m!772041))

(assert (=> b!829151 m!772045))

(assert (=> b!829151 m!772041))

(assert (=> b!829151 m!772047))

(assert (=> d!105233 m!772003))

(assert (=> b!829149 m!772039))

(assert (=> b!829149 m!772039))

(assert (=> b!829149 m!772051))

(assert (=> b!829144 m!772039))

(assert (=> b!829144 m!772039))

(declare-fun m!772099 () Bool)

(assert (=> b!829144 m!772099))

(declare-fun m!772101 () Bool)

(assert (=> b!829146 m!772101))

(assert (=> b!829158 m!772039))

(assert (=> b!829158 m!772039))

(assert (=> b!829158 m!772051))

(assert (=> b!829145 m!771993))

(declare-fun m!772103 () Bool)

(assert (=> b!829145 m!772103))

(declare-fun m!772105 () Bool)

(assert (=> b!829145 m!772105))

(declare-fun m!772107 () Bool)

(assert (=> b!829145 m!772107))

(assert (=> b!829145 m!772107))

(declare-fun m!772109 () Bool)

(assert (=> b!829145 m!772109))

(declare-fun m!772111 () Bool)

(assert (=> b!829145 m!772111))

(declare-fun m!772113 () Bool)

(assert (=> b!829145 m!772113))

(assert (=> b!829145 m!772103))

(declare-fun m!772115 () Bool)

(assert (=> b!829145 m!772115))

(declare-fun m!772117 () Bool)

(assert (=> b!829145 m!772117))

(assert (=> b!829145 m!772111))

(declare-fun m!772119 () Bool)

(assert (=> b!829145 m!772119))

(declare-fun m!772121 () Bool)

(assert (=> b!829145 m!772121))

(declare-fun m!772123 () Bool)

(assert (=> b!829145 m!772123))

(assert (=> b!829145 m!772113))

(declare-fun m!772125 () Bool)

(assert (=> b!829145 m!772125))

(declare-fun m!772127 () Bool)

(assert (=> b!829145 m!772127))

(declare-fun m!772129 () Bool)

(assert (=> b!829145 m!772129))

(assert (=> b!829145 m!772039))

(declare-fun m!772131 () Bool)

(assert (=> b!829145 m!772131))

(assert (=> bm!36092 m!771993))

(declare-fun m!772133 () Bool)

(assert (=> bm!36091 m!772133))

(declare-fun m!772135 () Bool)

(assert (=> b!829148 m!772135))

(declare-fun m!772137 () Bool)

(assert (=> b!829150 m!772137))

(assert (=> b!829011 d!105233))

(declare-fun d!105235 () Bool)

(declare-fun e!462140 () Bool)

(assert (=> d!105235 e!462140))

(declare-fun res!564894 () Bool)

(assert (=> d!105235 (=> (not res!564894) (not e!462140))))

(declare-fun lt!375931 () ListLongMap!8943)

(assert (=> d!105235 (= res!564894 (contains!4196 lt!375931 (_1!5071 (tuple2!10121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!375932 () List!15914)

(assert (=> d!105235 (= lt!375931 (ListLongMap!8944 lt!375932))))

(declare-fun lt!375930 () Unit!28395)

(declare-fun lt!375929 () Unit!28395)

(assert (=> d!105235 (= lt!375930 lt!375929)))

(declare-datatypes ((Option!417 0))(
  ( (Some!416 (v!10073 V!25229)) (None!415) )
))
(declare-fun getValueByKey!411 (List!15914 (_ BitVec 64)) Option!417)

(assert (=> d!105235 (= (getValueByKey!411 lt!375932 (_1!5071 (tuple2!10121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!416 (_2!5071 (tuple2!10121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lemmaContainsTupThenGetReturnValue!225 (List!15914 (_ BitVec 64) V!25229) Unit!28395)

(assert (=> d!105235 (= lt!375929 (lemmaContainsTupThenGetReturnValue!225 lt!375932 (_1!5071 (tuple2!10121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5071 (tuple2!10121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun insertStrictlySorted!264 (List!15914 (_ BitVec 64) V!25229) List!15914)

(assert (=> d!105235 (= lt!375932 (insertStrictlySorted!264 (toList!4487 lt!375808) (_1!5071 (tuple2!10121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5071 (tuple2!10121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105235 (= (+!1968 lt!375808 (tuple2!10121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!375931)))

(declare-fun b!829169 () Bool)

(declare-fun res!564893 () Bool)

(assert (=> b!829169 (=> (not res!564893) (not e!462140))))

(assert (=> b!829169 (= res!564893 (= (getValueByKey!411 (toList!4487 lt!375931) (_1!5071 (tuple2!10121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!416 (_2!5071 (tuple2!10121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!829170 () Bool)

(declare-fun contains!4198 (List!15914 tuple2!10120) Bool)

(assert (=> b!829170 (= e!462140 (contains!4198 (toList!4487 lt!375931) (tuple2!10121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105235 res!564894) b!829169))

(assert (= (and b!829169 res!564893) b!829170))

(declare-fun m!772139 () Bool)

(assert (=> d!105235 m!772139))

(declare-fun m!772141 () Bool)

(assert (=> d!105235 m!772141))

(declare-fun m!772143 () Bool)

(assert (=> d!105235 m!772143))

(declare-fun m!772145 () Bool)

(assert (=> d!105235 m!772145))

(declare-fun m!772147 () Bool)

(assert (=> b!829169 m!772147))

(declare-fun m!772149 () Bool)

(assert (=> b!829170 m!772149))

(assert (=> b!829011 d!105235))

(declare-fun b!829171 () Bool)

(declare-fun e!462145 () Bool)

(declare-fun e!462147 () Bool)

(assert (=> b!829171 (= e!462145 e!462147)))

(declare-fun res!564902 () Bool)

(assert (=> b!829171 (=> (not res!564902) (not e!462147))))

(declare-fun lt!375948 () ListLongMap!8943)

(assert (=> b!829171 (= res!564902 (contains!4196 lt!375948 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829171 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22714 _keys!976)))))

(declare-fun bm!36096 () Bool)

(declare-fun call!36101 () Bool)

(assert (=> bm!36096 (= call!36101 (contains!4196 lt!375948 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!105237 () Bool)

(declare-fun e!462144 () Bool)

(assert (=> d!105237 e!462144))

(declare-fun res!564901 () Bool)

(assert (=> d!105237 (=> (not res!564901) (not e!462144))))

(assert (=> d!105237 (= res!564901 (or (bvsge #b00000000000000000000000000000000 (size!22714 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22714 _keys!976)))))))

(declare-fun lt!375935 () ListLongMap!8943)

(assert (=> d!105237 (= lt!375948 lt!375935)))

(declare-fun lt!375952 () Unit!28395)

(declare-fun e!462146 () Unit!28395)

(assert (=> d!105237 (= lt!375952 e!462146)))

(declare-fun c!89721 () Bool)

(declare-fun e!462148 () Bool)

(assert (=> d!105237 (= c!89721 e!462148)))

(declare-fun res!564897 () Bool)

(assert (=> d!105237 (=> (not res!564897) (not e!462148))))

(assert (=> d!105237 (= res!564897 (bvslt #b00000000000000000000000000000000 (size!22714 _keys!976)))))

(declare-fun e!462152 () ListLongMap!8943)

(assert (=> d!105237 (= lt!375935 e!462152)))

(declare-fun c!89722 () Bool)

(assert (=> d!105237 (= c!89722 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105237 (validMask!0 mask!1312)))

(assert (=> d!105237 (= (getCurrentListMap!2587 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375948)))

(declare-fun b!829172 () Bool)

(declare-fun lt!375937 () Unit!28395)

(assert (=> b!829172 (= e!462146 lt!375937)))

(declare-fun lt!375936 () ListLongMap!8943)

(assert (=> b!829172 (= lt!375936 (getCurrentListMapNoExtraKeys!2488 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375945 () (_ BitVec 64))

(assert (=> b!829172 (= lt!375945 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375953 () (_ BitVec 64))

(assert (=> b!829172 (= lt!375953 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375949 () Unit!28395)

(assert (=> b!829172 (= lt!375949 (addStillContains!319 lt!375936 lt!375945 zeroValueAfter!34 lt!375953))))

(assert (=> b!829172 (contains!4196 (+!1968 lt!375936 (tuple2!10121 lt!375945 zeroValueAfter!34)) lt!375953)))

(declare-fun lt!375946 () Unit!28395)

(assert (=> b!829172 (= lt!375946 lt!375949)))

(declare-fun lt!375939 () ListLongMap!8943)

(assert (=> b!829172 (= lt!375939 (getCurrentListMapNoExtraKeys!2488 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375934 () (_ BitVec 64))

(assert (=> b!829172 (= lt!375934 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375947 () (_ BitVec 64))

(assert (=> b!829172 (= lt!375947 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375944 () Unit!28395)

(assert (=> b!829172 (= lt!375944 (addApplyDifferent!319 lt!375939 lt!375934 minValue!754 lt!375947))))

(assert (=> b!829172 (= (apply!368 (+!1968 lt!375939 (tuple2!10121 lt!375934 minValue!754)) lt!375947) (apply!368 lt!375939 lt!375947))))

(declare-fun lt!375950 () Unit!28395)

(assert (=> b!829172 (= lt!375950 lt!375944)))

(declare-fun lt!375941 () ListLongMap!8943)

(assert (=> b!829172 (= lt!375941 (getCurrentListMapNoExtraKeys!2488 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375933 () (_ BitVec 64))

(assert (=> b!829172 (= lt!375933 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375943 () (_ BitVec 64))

(assert (=> b!829172 (= lt!375943 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375940 () Unit!28395)

(assert (=> b!829172 (= lt!375940 (addApplyDifferent!319 lt!375941 lt!375933 zeroValueAfter!34 lt!375943))))

(assert (=> b!829172 (= (apply!368 (+!1968 lt!375941 (tuple2!10121 lt!375933 zeroValueAfter!34)) lt!375943) (apply!368 lt!375941 lt!375943))))

(declare-fun lt!375938 () Unit!28395)

(assert (=> b!829172 (= lt!375938 lt!375940)))

(declare-fun lt!375954 () ListLongMap!8943)

(assert (=> b!829172 (= lt!375954 (getCurrentListMapNoExtraKeys!2488 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375942 () (_ BitVec 64))

(assert (=> b!829172 (= lt!375942 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375951 () (_ BitVec 64))

(assert (=> b!829172 (= lt!375951 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829172 (= lt!375937 (addApplyDifferent!319 lt!375954 lt!375942 minValue!754 lt!375951))))

(assert (=> b!829172 (= (apply!368 (+!1968 lt!375954 (tuple2!10121 lt!375942 minValue!754)) lt!375951) (apply!368 lt!375954 lt!375951))))

(declare-fun bm!36097 () Bool)

(declare-fun call!36100 () ListLongMap!8943)

(declare-fun c!89724 () Bool)

(declare-fun call!36105 () ListLongMap!8943)

(declare-fun call!36102 () ListLongMap!8943)

(declare-fun call!36099 () ListLongMap!8943)

(assert (=> bm!36097 (= call!36099 (+!1968 (ite c!89722 call!36100 (ite c!89724 call!36102 call!36105)) (ite (or c!89722 c!89724) (tuple2!10121 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!36098 () Bool)

(declare-fun call!36104 () Bool)

(assert (=> bm!36098 (= call!36104 (contains!4196 lt!375948 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829173 () Bool)

(declare-fun e!462141 () Bool)

(assert (=> b!829173 (= e!462141 (= (apply!368 lt!375948 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!829174 () Bool)

(declare-fun res!564899 () Bool)

(assert (=> b!829174 (=> (not res!564899) (not e!462144))))

(assert (=> b!829174 (= res!564899 e!462145)))

(declare-fun res!564898 () Bool)

(assert (=> b!829174 (=> res!564898 e!462145)))

(declare-fun e!462150 () Bool)

(assert (=> b!829174 (= res!564898 (not e!462150))))

(declare-fun res!564895 () Bool)

(assert (=> b!829174 (=> (not res!564895) (not e!462150))))

(assert (=> b!829174 (= res!564895 (bvslt #b00000000000000000000000000000000 (size!22714 _keys!976)))))

(declare-fun b!829175 () Bool)

(declare-fun e!462143 () Bool)

(assert (=> b!829175 (= e!462143 (= (apply!368 lt!375948 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!829176 () Bool)

(assert (=> b!829176 (= e!462148 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829177 () Bool)

(assert (=> b!829177 (= e!462152 (+!1968 call!36099 (tuple2!10121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!829178 () Bool)

(assert (=> b!829178 (= e!462147 (= (apply!368 lt!375948 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)) (get!11801 (select (arr!22292 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!829178 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22713 _values!788)))))

(assert (=> b!829178 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22714 _keys!976)))))

(declare-fun b!829179 () Bool)

(declare-fun e!462151 () Bool)

(assert (=> b!829179 (= e!462144 e!462151)))

(declare-fun c!89720 () Bool)

(assert (=> b!829179 (= c!89720 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!829180 () Bool)

(declare-fun e!462149 () ListLongMap!8943)

(declare-fun call!36103 () ListLongMap!8943)

(assert (=> b!829180 (= e!462149 call!36103)))

(declare-fun b!829181 () Bool)

(assert (=> b!829181 (= e!462149 call!36105)))

(declare-fun b!829182 () Bool)

(assert (=> b!829182 (= e!462151 e!462143)))

(declare-fun res!564903 () Bool)

(assert (=> b!829182 (= res!564903 call!36104)))

(assert (=> b!829182 (=> (not res!564903) (not e!462143))))

(declare-fun b!829183 () Bool)

(declare-fun res!564896 () Bool)

(assert (=> b!829183 (=> (not res!564896) (not e!462144))))

(declare-fun e!462153 () Bool)

(assert (=> b!829183 (= res!564896 e!462153)))

(declare-fun c!89723 () Bool)

(assert (=> b!829183 (= c!89723 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!829184 () Bool)

(assert (=> b!829184 (= e!462151 (not call!36104))))

(declare-fun b!829185 () Bool)

(assert (=> b!829185 (= e!462150 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829186 () Bool)

(assert (=> b!829186 (= e!462153 e!462141)))

(declare-fun res!564900 () Bool)

(assert (=> b!829186 (= res!564900 call!36101)))

(assert (=> b!829186 (=> (not res!564900) (not e!462141))))

(declare-fun bm!36099 () Bool)

(assert (=> bm!36099 (= call!36100 (getCurrentListMapNoExtraKeys!2488 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829187 () Bool)

(assert (=> b!829187 (= e!462153 (not call!36101))))

(declare-fun b!829188 () Bool)

(declare-fun Unit!28400 () Unit!28395)

(assert (=> b!829188 (= e!462146 Unit!28400)))

(declare-fun bm!36100 () Bool)

(assert (=> bm!36100 (= call!36103 call!36099)))

(declare-fun bm!36101 () Bool)

(assert (=> bm!36101 (= call!36102 call!36100)))

(declare-fun b!829189 () Bool)

(declare-fun e!462142 () ListLongMap!8943)

(assert (=> b!829189 (= e!462152 e!462142)))

(assert (=> b!829189 (= c!89724 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!829190 () Bool)

(assert (=> b!829190 (= e!462142 call!36103)))

(declare-fun b!829191 () Bool)

(declare-fun c!89725 () Bool)

(assert (=> b!829191 (= c!89725 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!829191 (= e!462142 e!462149)))

(declare-fun bm!36102 () Bool)

(assert (=> bm!36102 (= call!36105 call!36102)))

(assert (= (and d!105237 c!89722) b!829177))

(assert (= (and d!105237 (not c!89722)) b!829189))

(assert (= (and b!829189 c!89724) b!829190))

(assert (= (and b!829189 (not c!89724)) b!829191))

(assert (= (and b!829191 c!89725) b!829180))

(assert (= (and b!829191 (not c!89725)) b!829181))

(assert (= (or b!829180 b!829181) bm!36102))

(assert (= (or b!829190 bm!36102) bm!36101))

(assert (= (or b!829190 b!829180) bm!36100))

(assert (= (or b!829177 bm!36101) bm!36099))

(assert (= (or b!829177 bm!36100) bm!36097))

(assert (= (and d!105237 res!564897) b!829176))

(assert (= (and d!105237 c!89721) b!829172))

(assert (= (and d!105237 (not c!89721)) b!829188))

(assert (= (and d!105237 res!564901) b!829174))

(assert (= (and b!829174 res!564895) b!829185))

(assert (= (and b!829174 (not res!564898)) b!829171))

(assert (= (and b!829171 res!564902) b!829178))

(assert (= (and b!829174 res!564899) b!829183))

(assert (= (and b!829183 c!89723) b!829186))

(assert (= (and b!829183 (not c!89723)) b!829187))

(assert (= (and b!829186 res!564900) b!829173))

(assert (= (or b!829186 b!829187) bm!36096))

(assert (= (and b!829183 res!564896) b!829179))

(assert (= (and b!829179 c!89720) b!829182))

(assert (= (and b!829179 (not c!89720)) b!829184))

(assert (= (and b!829182 res!564903) b!829175))

(assert (= (or b!829182 b!829184) bm!36098))

(declare-fun b_lambda!11261 () Bool)

(assert (=> (not b_lambda!11261) (not b!829178)))

(assert (=> b!829178 t!22275))

(declare-fun b_and!22457 () Bool)

(assert (= b_and!22455 (and (=> t!22275 result!7991) b_and!22457)))

(declare-fun m!772151 () Bool)

(assert (=> bm!36096 m!772151))

(declare-fun m!772153 () Bool)

(assert (=> bm!36097 m!772153))

(assert (=> b!829178 m!772039))

(assert (=> b!829178 m!772045))

(assert (=> b!829178 m!772039))

(declare-fun m!772155 () Bool)

(assert (=> b!829178 m!772155))

(assert (=> b!829178 m!772041))

(assert (=> b!829178 m!772045))

(assert (=> b!829178 m!772041))

(assert (=> b!829178 m!772047))

(assert (=> d!105237 m!772003))

(assert (=> b!829176 m!772039))

(assert (=> b!829176 m!772039))

(assert (=> b!829176 m!772051))

(assert (=> b!829171 m!772039))

(assert (=> b!829171 m!772039))

(declare-fun m!772157 () Bool)

(assert (=> b!829171 m!772157))

(declare-fun m!772159 () Bool)

(assert (=> b!829173 m!772159))

(assert (=> b!829185 m!772039))

(assert (=> b!829185 m!772039))

(assert (=> b!829185 m!772051))

(assert (=> b!829172 m!771991))

(declare-fun m!772161 () Bool)

(assert (=> b!829172 m!772161))

(declare-fun m!772163 () Bool)

(assert (=> b!829172 m!772163))

(declare-fun m!772165 () Bool)

(assert (=> b!829172 m!772165))

(assert (=> b!829172 m!772165))

(declare-fun m!772167 () Bool)

(assert (=> b!829172 m!772167))

(declare-fun m!772169 () Bool)

(assert (=> b!829172 m!772169))

(declare-fun m!772171 () Bool)

(assert (=> b!829172 m!772171))

(assert (=> b!829172 m!772161))

(declare-fun m!772173 () Bool)

(assert (=> b!829172 m!772173))

(declare-fun m!772175 () Bool)

(assert (=> b!829172 m!772175))

(assert (=> b!829172 m!772169))

(declare-fun m!772177 () Bool)

(assert (=> b!829172 m!772177))

(declare-fun m!772179 () Bool)

(assert (=> b!829172 m!772179))

(declare-fun m!772181 () Bool)

(assert (=> b!829172 m!772181))

(assert (=> b!829172 m!772171))

(declare-fun m!772183 () Bool)

(assert (=> b!829172 m!772183))

(declare-fun m!772185 () Bool)

(assert (=> b!829172 m!772185))

(declare-fun m!772187 () Bool)

(assert (=> b!829172 m!772187))

(assert (=> b!829172 m!772039))

(declare-fun m!772189 () Bool)

(assert (=> b!829172 m!772189))

(assert (=> bm!36099 m!771991))

(declare-fun m!772191 () Bool)

(assert (=> bm!36098 m!772191))

(declare-fun m!772193 () Bool)

(assert (=> b!829175 m!772193))

(declare-fun m!772195 () Bool)

(assert (=> b!829177 m!772195))

(assert (=> b!829011 d!105237))

(declare-fun b!829200 () Bool)

(declare-fun e!462161 () Bool)

(declare-fun e!462160 () Bool)

(assert (=> b!829200 (= e!462161 e!462160)))

(declare-fun c!89728 () Bool)

(assert (=> b!829200 (= c!89728 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829201 () Bool)

(declare-fun e!462162 () Bool)

(declare-fun call!36108 () Bool)

(assert (=> b!829201 (= e!462162 call!36108)))

(declare-fun d!105239 () Bool)

(declare-fun res!564909 () Bool)

(assert (=> d!105239 (=> res!564909 e!462161)))

(assert (=> d!105239 (= res!564909 (bvsge #b00000000000000000000000000000000 (size!22714 _keys!976)))))

(assert (=> d!105239 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!462161)))

(declare-fun bm!36105 () Bool)

(assert (=> bm!36105 (= call!36108 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!829202 () Bool)

(assert (=> b!829202 (= e!462160 e!462162)))

(declare-fun lt!375961 () (_ BitVec 64))

(assert (=> b!829202 (= lt!375961 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375962 () Unit!28395)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46506 (_ BitVec 64) (_ BitVec 32)) Unit!28395)

(assert (=> b!829202 (= lt!375962 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!375961 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46506 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!829202 (arrayContainsKey!0 _keys!976 lt!375961 #b00000000000000000000000000000000)))

(declare-fun lt!375963 () Unit!28395)

(assert (=> b!829202 (= lt!375963 lt!375962)))

(declare-fun res!564908 () Bool)

(declare-datatypes ((SeekEntryResult!8740 0))(
  ( (MissingZero!8740 (index!37331 (_ BitVec 32))) (Found!8740 (index!37332 (_ BitVec 32))) (Intermediate!8740 (undefined!9552 Bool) (index!37333 (_ BitVec 32)) (x!70013 (_ BitVec 32))) (Undefined!8740) (MissingVacant!8740 (index!37334 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46506 (_ BitVec 32)) SeekEntryResult!8740)

(assert (=> b!829202 (= res!564908 (= (seekEntryOrOpen!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8740 #b00000000000000000000000000000000)))))

(assert (=> b!829202 (=> (not res!564908) (not e!462162))))

(declare-fun b!829203 () Bool)

(assert (=> b!829203 (= e!462160 call!36108)))

(assert (= (and d!105239 (not res!564909)) b!829200))

(assert (= (and b!829200 c!89728) b!829202))

(assert (= (and b!829200 (not c!89728)) b!829203))

(assert (= (and b!829202 res!564908) b!829201))

(assert (= (or b!829201 b!829203) bm!36105))

(assert (=> b!829200 m!772039))

(assert (=> b!829200 m!772039))

(assert (=> b!829200 m!772051))

(declare-fun m!772197 () Bool)

(assert (=> bm!36105 m!772197))

(assert (=> b!829202 m!772039))

(declare-fun m!772199 () Bool)

(assert (=> b!829202 m!772199))

(declare-fun m!772201 () Bool)

(assert (=> b!829202 m!772201))

(assert (=> b!829202 m!772039))

(declare-fun m!772203 () Bool)

(assert (=> b!829202 m!772203))

(assert (=> b!829008 d!105239))

(declare-fun d!105241 () Bool)

(assert (=> d!105241 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71380 d!105241))

(declare-fun d!105243 () Bool)

(assert (=> d!105243 (= (array_inv!17757 _keys!976) (bvsge (size!22714 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71380 d!105243))

(declare-fun d!105245 () Bool)

(assert (=> d!105245 (= (array_inv!17758 _values!788) (bvsge (size!22713 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71380 d!105245))

(declare-fun mapIsEmpty!24403 () Bool)

(declare-fun mapRes!24403 () Bool)

(assert (=> mapIsEmpty!24403 mapRes!24403))

(declare-fun condMapEmpty!24403 () Bool)

(declare-fun mapDefault!24403 () ValueCell!7170)

(assert (=> mapNonEmpty!24397 (= condMapEmpty!24403 (= mapRest!24397 ((as const (Array (_ BitVec 32) ValueCell!7170)) mapDefault!24403)))))

(declare-fun e!462168 () Bool)

(assert (=> mapNonEmpty!24397 (= tp!47158 (and e!462168 mapRes!24403))))

(declare-fun b!829211 () Bool)

(assert (=> b!829211 (= e!462168 tp_is_empty!15171)))

(declare-fun b!829210 () Bool)

(declare-fun e!462167 () Bool)

(assert (=> b!829210 (= e!462167 tp_is_empty!15171)))

(declare-fun mapNonEmpty!24403 () Bool)

(declare-fun tp!47167 () Bool)

(assert (=> mapNonEmpty!24403 (= mapRes!24403 (and tp!47167 e!462167))))

(declare-fun mapRest!24403 () (Array (_ BitVec 32) ValueCell!7170))

(declare-fun mapKey!24403 () (_ BitVec 32))

(declare-fun mapValue!24403 () ValueCell!7170)

(assert (=> mapNonEmpty!24403 (= mapRest!24397 (store mapRest!24403 mapKey!24403 mapValue!24403))))

(assert (= (and mapNonEmpty!24397 condMapEmpty!24403) mapIsEmpty!24403))

(assert (= (and mapNonEmpty!24397 (not condMapEmpty!24403)) mapNonEmpty!24403))

(assert (= (and mapNonEmpty!24403 ((_ is ValueCellFull!7170) mapValue!24403)) b!829210))

(assert (= (and mapNonEmpty!24397 ((_ is ValueCellFull!7170) mapDefault!24403)) b!829211))

(declare-fun m!772205 () Bool)

(assert (=> mapNonEmpty!24403 m!772205))

(declare-fun b_lambda!11263 () Bool)

(assert (= b_lambda!11251 (or (and start!71380 b_free!13461) b_lambda!11263)))

(declare-fun b_lambda!11265 () Bool)

(assert (= b_lambda!11257 (or (and start!71380 b_free!13461) b_lambda!11265)))

(declare-fun b_lambda!11267 () Bool)

(assert (= b_lambda!11255 (or (and start!71380 b_free!13461) b_lambda!11267)))

(declare-fun b_lambda!11269 () Bool)

(assert (= b_lambda!11253 (or (and start!71380 b_free!13461) b_lambda!11269)))

(declare-fun b_lambda!11271 () Bool)

(assert (= b_lambda!11261 (or (and start!71380 b_free!13461) b_lambda!11271)))

(declare-fun b_lambda!11273 () Bool)

(assert (= b_lambda!11259 (or (and start!71380 b_free!13461) b_lambda!11273)))

(check-sat (not b!829072) (not b!829086) (not b!829185) (not b_lambda!11265) (not b!829146) (not b!829068) (not b!829200) (not b!829099) (not d!105225) (not b!829098) (not b!829082) (not b_lambda!11263) (not b!829149) (not bm!36089) (not d!105229) (not b_next!13461) (not b!829169) (not b!829061) (not b!829170) (not b!829063) (not d!105237) (not bm!36070) (not b!829178) (not bm!36091) (not b!829175) (not bm!36105) (not b!829075) (not b!829151) (not b!829177) (not b_lambda!11271) (not b!829065) (not b!829144) (not b_lambda!11269) (not b!829067) (not b!829081) (not b!829145) (not b!829079) (not bm!36096) (not b!829173) (not b!829100) (not d!105227) b_and!22457 (not bm!36071) (not b_lambda!11273) tp_is_empty!15171 (not b!829066) (not bm!36090) (not b!829148) (not mapNonEmpty!24403) (not b!829150) (not bm!36099) (not d!105233) (not b!829077) (not d!105235) (not b!829171) (not b!829076) (not bm!36098) (not b!829202) (not b!829080) (not b!829176) (not b!829158) (not b!829172) (not bm!36092) (not b_lambda!11267) (not b!829062) (not bm!36097) (not bm!36074))
(check-sat b_and!22457 (not b_next!13461))
