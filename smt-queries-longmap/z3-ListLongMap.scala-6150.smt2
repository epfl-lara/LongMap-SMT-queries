; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78990 () Bool)

(assert start!78990)

(declare-fun b_free!17221 () Bool)

(declare-fun b_next!17221 () Bool)

(assert (=> start!78990 (= b_free!17221 (not b_next!17221))))

(declare-fun tp!60104 () Bool)

(declare-fun b_and!28153 () Bool)

(assert (=> start!78990 (= tp!60104 b_and!28153)))

(declare-fun b!925028 () Bool)

(declare-datatypes ((Unit!31166 0))(
  ( (Unit!31167) )
))
(declare-fun e!519145 () Unit!31166)

(declare-fun e!519155 () Unit!31166)

(assert (=> b!925028 (= e!519145 e!519155)))

(declare-fun lt!416094 () (_ BitVec 64))

(declare-datatypes ((array!55403 0))(
  ( (array!55404 (arr!26647 (Array (_ BitVec 32) (_ BitVec 64))) (size!27108 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55403)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!925028 (= lt!416094 (select (arr!26647 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96490 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925028 (= c!96490 (validKeyInArray!0 lt!416094))))

(declare-fun b!925029 () Bool)

(declare-fun e!519156 () Bool)

(assert (=> b!925029 (= e!519156 (not true))))

(declare-fun e!519149 () Bool)

(assert (=> b!925029 e!519149))

(declare-fun res!623432 () Bool)

(assert (=> b!925029 (=> (not res!623432) (not e!519149))))

(declare-datatypes ((V!31271 0))(
  ( (V!31272 (val!9915 Int)) )
))
(declare-datatypes ((tuple2!12988 0))(
  ( (tuple2!12989 (_1!6505 (_ BitVec 64)) (_2!6505 V!31271)) )
))
(declare-datatypes ((List!18763 0))(
  ( (Nil!18760) (Cons!18759 (h!19905 tuple2!12988) (t!26705 List!18763)) )
))
(declare-datatypes ((ListLongMap!11675 0))(
  ( (ListLongMap!11676 (toList!5853 List!18763)) )
))
(declare-fun lt!416093 () ListLongMap!11675)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4865 (ListLongMap!11675 (_ BitVec 64)) Bool)

(assert (=> b!925029 (= res!623432 (contains!4865 lt!416093 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9383 0))(
  ( (ValueCellFull!9383 (v!12432 V!31271)) (EmptyCell!9383) )
))
(declare-datatypes ((array!55405 0))(
  ( (array!55406 (arr!26648 (Array (_ BitVec 32) ValueCell!9383)) (size!27109 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55405)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31271)

(declare-fun minValue!1173 () V!31271)

(declare-fun getCurrentListMap!3039 (array!55403 array!55405 (_ BitVec 32) (_ BitVec 32) V!31271 V!31271 (_ BitVec 32) Int) ListLongMap!11675)

(assert (=> b!925029 (= lt!416093 (getCurrentListMap!3039 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun v!791 () V!31271)

(declare-fun lt!416097 () Unit!31166)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!74 (array!55403 array!55405 (_ BitVec 32) (_ BitVec 32) V!31271 V!31271 (_ BitVec 64) V!31271 (_ BitVec 32) Int) Unit!31166)

(assert (=> b!925029 (= lt!416097 (lemmaListMapApplyFromThenApplyFromZero!74 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925030 () Bool)

(declare-fun res!623429 () Bool)

(declare-fun e!519148 () Bool)

(assert (=> b!925030 (=> (not res!623429) (not e!519148))))

(assert (=> b!925030 (= res!623429 (and (= (size!27109 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27108 _keys!1487) (size!27109 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!925031 () Bool)

(declare-fun e!519146 () Bool)

(assert (=> b!925031 (= e!519146 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925032 () Bool)

(declare-fun e!519144 () Bool)

(assert (=> b!925032 (= e!519148 e!519144)))

(declare-fun res!623428 () Bool)

(assert (=> b!925032 (=> (not res!623428) (not e!519144))))

(declare-fun lt!416105 () ListLongMap!11675)

(assert (=> b!925032 (= res!623428 (contains!4865 lt!416105 k0!1099))))

(assert (=> b!925032 (= lt!416105 (getCurrentListMap!3039 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!925033 () Bool)

(declare-fun res!623426 () Bool)

(assert (=> b!925033 (=> (not res!623426) (not e!519148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55403 (_ BitVec 32)) Bool)

(assert (=> b!925033 (= res!623426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!925034 () Bool)

(declare-fun lt!416102 () ListLongMap!11675)

(declare-fun lt!416095 () V!31271)

(declare-fun apply!664 (ListLongMap!11675 (_ BitVec 64)) V!31271)

(assert (=> b!925034 (= (apply!664 lt!416102 k0!1099) lt!416095)))

(declare-fun lt!416098 () V!31271)

(declare-fun lt!416096 () Unit!31166)

(declare-fun addApplyDifferent!377 (ListLongMap!11675 (_ BitVec 64) V!31271 (_ BitVec 64)) Unit!31166)

(assert (=> b!925034 (= lt!416096 (addApplyDifferent!377 lt!416105 lt!416094 lt!416098 k0!1099))))

(assert (=> b!925034 (not (= lt!416094 k0!1099))))

(declare-fun lt!416106 () Unit!31166)

(declare-datatypes ((List!18764 0))(
  ( (Nil!18761) (Cons!18760 (h!19906 (_ BitVec 64)) (t!26706 List!18764)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55403 (_ BitVec 64) (_ BitVec 32) List!18764) Unit!31166)

(assert (=> b!925034 (= lt!416106 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18761))))

(assert (=> b!925034 e!519146))

(declare-fun c!96489 () Bool)

(assert (=> b!925034 (= c!96489 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416108 () Unit!31166)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!237 (array!55403 array!55405 (_ BitVec 32) (_ BitVec 32) V!31271 V!31271 (_ BitVec 64) (_ BitVec 32) Int) Unit!31166)

(assert (=> b!925034 (= lt!416108 (lemmaListMapContainsThenArrayContainsFrom!237 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55403 (_ BitVec 32) List!18764) Bool)

(assert (=> b!925034 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18761)))

(declare-fun lt!416104 () Unit!31166)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55403 (_ BitVec 32) (_ BitVec 32)) Unit!31166)

(assert (=> b!925034 (= lt!416104 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!925034 (contains!4865 lt!416102 k0!1099)))

(declare-fun lt!416099 () tuple2!12988)

(declare-fun +!2749 (ListLongMap!11675 tuple2!12988) ListLongMap!11675)

(assert (=> b!925034 (= lt!416102 (+!2749 lt!416105 lt!416099))))

(declare-fun lt!416100 () Unit!31166)

(declare-fun addStillContains!446 (ListLongMap!11675 (_ BitVec 64) V!31271 (_ BitVec 64)) Unit!31166)

(assert (=> b!925034 (= lt!416100 (addStillContains!446 lt!416105 lt!416094 lt!416098 k0!1099))))

(assert (=> b!925034 (= (getCurrentListMap!3039 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2749 (getCurrentListMap!3039 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416099))))

(assert (=> b!925034 (= lt!416099 (tuple2!12989 lt!416094 lt!416098))))

(declare-fun get!14018 (ValueCell!9383 V!31271) V!31271)

(declare-fun dynLambda!1505 (Int (_ BitVec 64)) V!31271)

(assert (=> b!925034 (= lt!416098 (get!14018 (select (arr!26648 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1505 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416101 () Unit!31166)

(declare-fun lemmaListMapRecursiveValidKeyArray!113 (array!55403 array!55405 (_ BitVec 32) (_ BitVec 32) V!31271 V!31271 (_ BitVec 32) Int) Unit!31166)

(assert (=> b!925034 (= lt!416101 (lemmaListMapRecursiveValidKeyArray!113 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!925034 (= e!519155 lt!416096)))

(declare-fun b!925035 () Bool)

(declare-fun Unit!31168 () Unit!31166)

(assert (=> b!925035 (= e!519155 Unit!31168)))

(declare-fun b!925036 () Bool)

(declare-fun e!519154 () Bool)

(declare-fun e!519147 () Bool)

(declare-fun mapRes!31350 () Bool)

(assert (=> b!925036 (= e!519154 (and e!519147 mapRes!31350))))

(declare-fun condMapEmpty!31350 () Bool)

(declare-fun mapDefault!31350 () ValueCell!9383)

(assert (=> b!925036 (= condMapEmpty!31350 (= (arr!26648 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9383)) mapDefault!31350)))))

(declare-fun b!925037 () Bool)

(declare-fun arrayContainsKey!0 (array!55403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925037 (= e!519146 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!925038 () Bool)

(declare-fun e!519152 () Bool)

(assert (=> b!925038 (= e!519144 e!519152)))

(declare-fun res!623427 () Bool)

(assert (=> b!925038 (=> (not res!623427) (not e!519152))))

(assert (=> b!925038 (= res!623427 (and (= lt!416095 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!925038 (= lt!416095 (apply!664 lt!416105 k0!1099))))

(declare-fun res!623433 () Bool)

(assert (=> start!78990 (=> (not res!623433) (not e!519148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78990 (= res!623433 (validMask!0 mask!1881))))

(assert (=> start!78990 e!519148))

(assert (=> start!78990 true))

(declare-fun tp_is_empty!19729 () Bool)

(assert (=> start!78990 tp_is_empty!19729))

(declare-fun array_inv!20838 (array!55405) Bool)

(assert (=> start!78990 (and (array_inv!20838 _values!1231) e!519154)))

(assert (=> start!78990 tp!60104))

(declare-fun array_inv!20839 (array!55403) Bool)

(assert (=> start!78990 (array_inv!20839 _keys!1487)))

(declare-fun b!925039 () Bool)

(declare-fun e!519151 () Bool)

(assert (=> b!925039 (= e!519151 e!519156)))

(declare-fun res!623430 () Bool)

(assert (=> b!925039 (=> (not res!623430) (not e!519156))))

(declare-fun lt!416107 () ListLongMap!11675)

(assert (=> b!925039 (= res!623430 (contains!4865 lt!416107 k0!1099))))

(assert (=> b!925039 (= lt!416107 (getCurrentListMap!3039 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925040 () Bool)

(declare-fun e!519150 () Bool)

(assert (=> b!925040 (= e!519150 tp_is_empty!19729)))

(declare-fun b!925041 () Bool)

(declare-fun res!623434 () Bool)

(assert (=> b!925041 (=> (not res!623434) (not e!519156))))

(assert (=> b!925041 (= res!623434 (= (apply!664 lt!416107 k0!1099) v!791))))

(declare-fun b!925042 () Bool)

(assert (=> b!925042 (= e!519149 (= (apply!664 lt!416093 k0!1099) v!791))))

(declare-fun b!925043 () Bool)

(assert (=> b!925043 (= e!519147 tp_is_empty!19729)))

(declare-fun mapIsEmpty!31350 () Bool)

(assert (=> mapIsEmpty!31350 mapRes!31350))

(declare-fun mapNonEmpty!31350 () Bool)

(declare-fun tp!60105 () Bool)

(assert (=> mapNonEmpty!31350 (= mapRes!31350 (and tp!60105 e!519150))))

(declare-fun mapValue!31350 () ValueCell!9383)

(declare-fun mapRest!31350 () (Array (_ BitVec 32) ValueCell!9383))

(declare-fun mapKey!31350 () (_ BitVec 32))

(assert (=> mapNonEmpty!31350 (= (arr!26648 _values!1231) (store mapRest!31350 mapKey!31350 mapValue!31350))))

(declare-fun b!925044 () Bool)

(assert (=> b!925044 (= e!519152 e!519151)))

(declare-fun res!623435 () Bool)

(assert (=> b!925044 (=> (not res!623435) (not e!519151))))

(assert (=> b!925044 (= res!623435 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27108 _keys!1487)))))

(declare-fun lt!416103 () Unit!31166)

(assert (=> b!925044 (= lt!416103 e!519145)))

(declare-fun c!96488 () Bool)

(assert (=> b!925044 (= c!96488 (validKeyInArray!0 k0!1099))))

(declare-fun b!925045 () Bool)

(declare-fun Unit!31169 () Unit!31166)

(assert (=> b!925045 (= e!519145 Unit!31169)))

(declare-fun b!925046 () Bool)

(declare-fun res!623431 () Bool)

(assert (=> b!925046 (=> (not res!623431) (not e!519148))))

(assert (=> b!925046 (= res!623431 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18761))))

(declare-fun b!925047 () Bool)

(declare-fun res!623425 () Bool)

(assert (=> b!925047 (=> (not res!623425) (not e!519148))))

(assert (=> b!925047 (= res!623425 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27108 _keys!1487))))))

(assert (= (and start!78990 res!623433) b!925030))

(assert (= (and b!925030 res!623429) b!925033))

(assert (= (and b!925033 res!623426) b!925046))

(assert (= (and b!925046 res!623431) b!925047))

(assert (= (and b!925047 res!623425) b!925032))

(assert (= (and b!925032 res!623428) b!925038))

(assert (= (and b!925038 res!623427) b!925044))

(assert (= (and b!925044 c!96488) b!925028))

(assert (= (and b!925044 (not c!96488)) b!925045))

(assert (= (and b!925028 c!96490) b!925034))

(assert (= (and b!925028 (not c!96490)) b!925035))

(assert (= (and b!925034 c!96489) b!925037))

(assert (= (and b!925034 (not c!96489)) b!925031))

(assert (= (and b!925044 res!623435) b!925039))

(assert (= (and b!925039 res!623430) b!925041))

(assert (= (and b!925041 res!623434) b!925029))

(assert (= (and b!925029 res!623432) b!925042))

(assert (= (and b!925036 condMapEmpty!31350) mapIsEmpty!31350))

(assert (= (and b!925036 (not condMapEmpty!31350)) mapNonEmpty!31350))

(get-info :version)

(assert (= (and mapNonEmpty!31350 ((_ is ValueCellFull!9383) mapValue!31350)) b!925040))

(assert (= (and b!925036 ((_ is ValueCellFull!9383) mapDefault!31350)) b!925043))

(assert (= start!78990 b!925036))

(declare-fun b_lambda!13705 () Bool)

(assert (=> (not b_lambda!13705) (not b!925034)))

(declare-fun t!26704 () Bool)

(declare-fun tb!5793 () Bool)

(assert (=> (and start!78990 (= defaultEntry!1235 defaultEntry!1235) t!26704) tb!5793))

(declare-fun result!11417 () Bool)

(assert (=> tb!5793 (= result!11417 tp_is_empty!19729)))

(assert (=> b!925034 t!26704))

(declare-fun b_and!28155 () Bool)

(assert (= b_and!28153 (and (=> t!26704 result!11417) b_and!28155)))

(declare-fun m!858907 () Bool)

(assert (=> b!925033 m!858907))

(declare-fun m!858909 () Bool)

(assert (=> b!925028 m!858909))

(declare-fun m!858911 () Bool)

(assert (=> b!925028 m!858911))

(declare-fun m!858913 () Bool)

(assert (=> b!925039 m!858913))

(declare-fun m!858915 () Bool)

(assert (=> b!925039 m!858915))

(declare-fun m!858917 () Bool)

(assert (=> b!925032 m!858917))

(declare-fun m!858919 () Bool)

(assert (=> b!925032 m!858919))

(declare-fun m!858921 () Bool)

(assert (=> b!925042 m!858921))

(declare-fun m!858923 () Bool)

(assert (=> mapNonEmpty!31350 m!858923))

(declare-fun m!858925 () Bool)

(assert (=> start!78990 m!858925))

(declare-fun m!858927 () Bool)

(assert (=> start!78990 m!858927))

(declare-fun m!858929 () Bool)

(assert (=> start!78990 m!858929))

(declare-fun m!858931 () Bool)

(assert (=> b!925029 m!858931))

(declare-fun m!858933 () Bool)

(assert (=> b!925029 m!858933))

(declare-fun m!858935 () Bool)

(assert (=> b!925029 m!858935))

(declare-fun m!858937 () Bool)

(assert (=> b!925037 m!858937))

(declare-fun m!858939 () Bool)

(assert (=> b!925044 m!858939))

(declare-fun m!858941 () Bool)

(assert (=> b!925034 m!858941))

(declare-fun m!858943 () Bool)

(assert (=> b!925034 m!858943))

(declare-fun m!858945 () Bool)

(assert (=> b!925034 m!858945))

(declare-fun m!858947 () Bool)

(assert (=> b!925034 m!858947))

(declare-fun m!858949 () Bool)

(assert (=> b!925034 m!858949))

(declare-fun m!858951 () Bool)

(assert (=> b!925034 m!858951))

(declare-fun m!858953 () Bool)

(assert (=> b!925034 m!858953))

(assert (=> b!925034 m!858949))

(declare-fun m!858955 () Bool)

(assert (=> b!925034 m!858955))

(declare-fun m!858957 () Bool)

(assert (=> b!925034 m!858957))

(declare-fun m!858959 () Bool)

(assert (=> b!925034 m!858959))

(declare-fun m!858961 () Bool)

(assert (=> b!925034 m!858961))

(declare-fun m!858963 () Bool)

(assert (=> b!925034 m!858963))

(assert (=> b!925034 m!858953))

(declare-fun m!858965 () Bool)

(assert (=> b!925034 m!858965))

(declare-fun m!858967 () Bool)

(assert (=> b!925034 m!858967))

(assert (=> b!925034 m!858915))

(assert (=> b!925034 m!858943))

(declare-fun m!858969 () Bool)

(assert (=> b!925034 m!858969))

(declare-fun m!858971 () Bool)

(assert (=> b!925038 m!858971))

(declare-fun m!858973 () Bool)

(assert (=> b!925041 m!858973))

(declare-fun m!858975 () Bool)

(assert (=> b!925046 m!858975))

(check-sat (not b!925033) (not b!925039) (not b!925044) (not b!925028) (not b!925029) (not b!925042) b_and!28155 (not b!925032) tp_is_empty!19729 (not b_next!17221) (not mapNonEmpty!31350) (not b!925038) (not b!925037) (not start!78990) (not b!925041) (not b!925034) (not b_lambda!13705) (not b!925046))
(check-sat b_and!28155 (not b_next!17221))
