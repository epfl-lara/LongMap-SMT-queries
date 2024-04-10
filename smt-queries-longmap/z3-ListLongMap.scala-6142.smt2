; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78962 () Bool)

(assert start!78962)

(declare-fun b_free!17175 () Bool)

(declare-fun b_next!17175 () Bool)

(assert (=> start!78962 (= b_free!17175 (not b_next!17175))))

(declare-fun tp!59966 () Bool)

(declare-fun b_and!28087 () Bool)

(assert (=> start!78962 (= tp!59966 b_and!28087)))

(declare-fun b!923957 () Bool)

(declare-datatypes ((Unit!31181 0))(
  ( (Unit!31182) )
))
(declare-fun e!518455 () Unit!31181)

(declare-fun e!518460 () Unit!31181)

(assert (=> b!923957 (= e!518455 e!518460)))

(declare-fun lt!415287 () (_ BitVec 64))

(declare-datatypes ((array!55338 0))(
  ( (array!55339 (arr!26614 (Array (_ BitVec 32) (_ BitVec 64))) (size!27073 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55338)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!923957 (= lt!415287 (select (arr!26614 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96348 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923957 (= c!96348 (validKeyInArray!0 lt!415287))))

(declare-fun mapNonEmpty!31281 () Bool)

(declare-fun mapRes!31281 () Bool)

(declare-fun tp!59965 () Bool)

(declare-fun e!518462 () Bool)

(assert (=> mapNonEmpty!31281 (= mapRes!31281 (and tp!59965 e!518462))))

(declare-fun mapKey!31281 () (_ BitVec 32))

(declare-datatypes ((V!31209 0))(
  ( (V!31210 (val!9892 Int)) )
))
(declare-datatypes ((ValueCell!9360 0))(
  ( (ValueCellFull!9360 (v!12410 V!31209)) (EmptyCell!9360) )
))
(declare-fun mapValue!31281 () ValueCell!9360)

(declare-fun mapRest!31281 () (Array (_ BitVec 32) ValueCell!9360))

(declare-datatypes ((array!55340 0))(
  ( (array!55341 (arr!26615 (Array (_ BitVec 32) ValueCell!9360)) (size!27074 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55340)

(assert (=> mapNonEmpty!31281 (= (arr!26615 _values!1231) (store mapRest!31281 mapKey!31281 mapValue!31281))))

(declare-fun b!923958 () Bool)

(declare-fun tp_is_empty!19683 () Bool)

(assert (=> b!923958 (= e!518462 tp_is_empty!19683)))

(declare-fun res!622897 () Bool)

(declare-fun e!518454 () Bool)

(assert (=> start!78962 (=> (not res!622897) (not e!518454))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78962 (= res!622897 (validMask!0 mask!1881))))

(assert (=> start!78962 e!518454))

(assert (=> start!78962 true))

(assert (=> start!78962 tp_is_empty!19683))

(declare-fun e!518457 () Bool)

(declare-fun array_inv!20728 (array!55340) Bool)

(assert (=> start!78962 (and (array_inv!20728 _values!1231) e!518457)))

(assert (=> start!78962 tp!59966))

(declare-fun array_inv!20729 (array!55338) Bool)

(assert (=> start!78962 (array_inv!20729 _keys!1487)))

(declare-fun b!923959 () Bool)

(declare-fun e!518453 () Bool)

(declare-fun e!518464 () Bool)

(assert (=> b!923959 (= e!518453 e!518464)))

(declare-fun res!622900 () Bool)

(assert (=> b!923959 (=> (not res!622900) (not e!518464))))

(declare-datatypes ((tuple2!12882 0))(
  ( (tuple2!12883 (_1!6452 (_ BitVec 64)) (_2!6452 V!31209)) )
))
(declare-datatypes ((List!18685 0))(
  ( (Nil!18682) (Cons!18681 (h!19827 tuple2!12882) (t!26590 List!18685)) )
))
(declare-datatypes ((ListLongMap!11579 0))(
  ( (ListLongMap!11580 (toList!5805 List!18685)) )
))
(declare-fun lt!415288 () ListLongMap!11579)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4867 (ListLongMap!11579 (_ BitVec 64)) Bool)

(assert (=> b!923959 (= res!622900 (contains!4867 lt!415288 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31209)

(declare-fun minValue!1173 () V!31209)

(declare-fun getCurrentListMap!3058 (array!55338 array!55340 (_ BitVec 32) (_ BitVec 32) V!31209 V!31209 (_ BitVec 32) Int) ListLongMap!11579)

(assert (=> b!923959 (= lt!415288 (getCurrentListMap!3058 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923960 () Bool)

(declare-fun e!518459 () Bool)

(assert (=> b!923960 (= e!518459 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923961 () Bool)

(declare-fun arrayContainsKey!0 (array!55338 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923961 (= e!518459 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!923962 () Bool)

(declare-fun lt!415295 () ListLongMap!11579)

(declare-fun lt!415292 () V!31209)

(declare-fun apply!635 (ListLongMap!11579 (_ BitVec 64)) V!31209)

(assert (=> b!923962 (= (apply!635 lt!415295 k0!1099) lt!415292)))

(declare-fun lt!415286 () V!31209)

(declare-fun lt!415293 () Unit!31181)

(declare-fun lt!415289 () ListLongMap!11579)

(declare-fun addApplyDifferent!360 (ListLongMap!11579 (_ BitVec 64) V!31209 (_ BitVec 64)) Unit!31181)

(assert (=> b!923962 (= lt!415293 (addApplyDifferent!360 lt!415289 lt!415287 lt!415286 k0!1099))))

(assert (=> b!923962 (not (= lt!415287 k0!1099))))

(declare-fun lt!415283 () Unit!31181)

(declare-datatypes ((List!18686 0))(
  ( (Nil!18683) (Cons!18682 (h!19828 (_ BitVec 64)) (t!26591 List!18686)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55338 (_ BitVec 64) (_ BitVec 32) List!18686) Unit!31181)

(assert (=> b!923962 (= lt!415283 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18683))))

(assert (=> b!923962 e!518459))

(declare-fun c!96346 () Bool)

(assert (=> b!923962 (= c!96346 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415285 () Unit!31181)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!211 (array!55338 array!55340 (_ BitVec 32) (_ BitVec 32) V!31209 V!31209 (_ BitVec 64) (_ BitVec 32) Int) Unit!31181)

(assert (=> b!923962 (= lt!415285 (lemmaListMapContainsThenArrayContainsFrom!211 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55338 (_ BitVec 32) List!18686) Bool)

(assert (=> b!923962 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18683)))

(declare-fun lt!415284 () Unit!31181)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55338 (_ BitVec 32) (_ BitVec 32)) Unit!31181)

(assert (=> b!923962 (= lt!415284 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!923962 (contains!4867 lt!415295 k0!1099)))

(declare-fun lt!415294 () tuple2!12882)

(declare-fun +!2704 (ListLongMap!11579 tuple2!12882) ListLongMap!11579)

(assert (=> b!923962 (= lt!415295 (+!2704 lt!415289 lt!415294))))

(declare-fun lt!415291 () Unit!31181)

(declare-fun addStillContains!428 (ListLongMap!11579 (_ BitVec 64) V!31209 (_ BitVec 64)) Unit!31181)

(assert (=> b!923962 (= lt!415291 (addStillContains!428 lt!415289 lt!415287 lt!415286 k0!1099))))

(assert (=> b!923962 (= (getCurrentListMap!3058 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2704 (getCurrentListMap!3058 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415294))))

(assert (=> b!923962 (= lt!415294 (tuple2!12883 lt!415287 lt!415286))))

(declare-fun get!13985 (ValueCell!9360 V!31209) V!31209)

(declare-fun dynLambda!1493 (Int (_ BitVec 64)) V!31209)

(assert (=> b!923962 (= lt!415286 (get!13985 (select (arr!26615 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1493 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415290 () Unit!31181)

(declare-fun lemmaListMapRecursiveValidKeyArray!94 (array!55338 array!55340 (_ BitVec 32) (_ BitVec 32) V!31209 V!31209 (_ BitVec 32) Int) Unit!31181)

(assert (=> b!923962 (= lt!415290 (lemmaListMapRecursiveValidKeyArray!94 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!923962 (= e!518460 lt!415293)))

(declare-fun b!923963 () Bool)

(declare-fun Unit!31183 () Unit!31181)

(assert (=> b!923963 (= e!518455 Unit!31183)))

(declare-fun b!923964 () Bool)

(declare-fun e!518461 () Bool)

(assert (=> b!923964 (= e!518461 tp_is_empty!19683)))

(declare-fun b!923965 () Bool)

(declare-fun e!518456 () Bool)

(assert (=> b!923965 (= e!518456 e!518453)))

(declare-fun res!622898 () Bool)

(assert (=> b!923965 (=> (not res!622898) (not e!518453))))

(assert (=> b!923965 (= res!622898 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27073 _keys!1487)))))

(declare-fun lt!415296 () Unit!31181)

(assert (=> b!923965 (= lt!415296 e!518455)))

(declare-fun c!96347 () Bool)

(assert (=> b!923965 (= c!96347 (validKeyInArray!0 k0!1099))))

(declare-fun b!923966 () Bool)

(declare-fun res!622896 () Bool)

(assert (=> b!923966 (=> (not res!622896) (not e!518454))))

(assert (=> b!923966 (= res!622896 (and (= (size!27074 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27073 _keys!1487) (size!27074 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!923967 () Bool)

(declare-fun res!622892 () Bool)

(assert (=> b!923967 (=> (not res!622892) (not e!518454))))

(assert (=> b!923967 (= res!622892 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27073 _keys!1487))))))

(declare-fun b!923968 () Bool)

(assert (=> b!923968 (= e!518457 (and e!518461 mapRes!31281))))

(declare-fun condMapEmpty!31281 () Bool)

(declare-fun mapDefault!31281 () ValueCell!9360)

(assert (=> b!923968 (= condMapEmpty!31281 (= (arr!26615 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9360)) mapDefault!31281)))))

(declare-fun b!923969 () Bool)

(assert (=> b!923969 (= e!518464 false)))

(declare-fun lt!415297 () V!31209)

(assert (=> b!923969 (= lt!415297 (apply!635 lt!415288 k0!1099))))

(declare-fun b!923970 () Bool)

(declare-fun Unit!31184 () Unit!31181)

(assert (=> b!923970 (= e!518460 Unit!31184)))

(declare-fun b!923971 () Bool)

(declare-fun res!622895 () Bool)

(assert (=> b!923971 (=> (not res!622895) (not e!518454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55338 (_ BitVec 32)) Bool)

(assert (=> b!923971 (= res!622895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!923972 () Bool)

(declare-fun e!518463 () Bool)

(assert (=> b!923972 (= e!518454 e!518463)))

(declare-fun res!622893 () Bool)

(assert (=> b!923972 (=> (not res!622893) (not e!518463))))

(assert (=> b!923972 (= res!622893 (contains!4867 lt!415289 k0!1099))))

(assert (=> b!923972 (= lt!415289 (getCurrentListMap!3058 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!923973 () Bool)

(declare-fun res!622894 () Bool)

(assert (=> b!923973 (=> (not res!622894) (not e!518454))))

(assert (=> b!923973 (= res!622894 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18683))))

(declare-fun b!923974 () Bool)

(assert (=> b!923974 (= e!518463 e!518456)))

(declare-fun res!622899 () Bool)

(assert (=> b!923974 (=> (not res!622899) (not e!518456))))

(declare-fun v!791 () V!31209)

(assert (=> b!923974 (= res!622899 (and (= lt!415292 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!923974 (= lt!415292 (apply!635 lt!415289 k0!1099))))

(declare-fun mapIsEmpty!31281 () Bool)

(assert (=> mapIsEmpty!31281 mapRes!31281))

(assert (= (and start!78962 res!622897) b!923966))

(assert (= (and b!923966 res!622896) b!923971))

(assert (= (and b!923971 res!622895) b!923973))

(assert (= (and b!923973 res!622894) b!923967))

(assert (= (and b!923967 res!622892) b!923972))

(assert (= (and b!923972 res!622893) b!923974))

(assert (= (and b!923974 res!622899) b!923965))

(assert (= (and b!923965 c!96347) b!923957))

(assert (= (and b!923965 (not c!96347)) b!923963))

(assert (= (and b!923957 c!96348) b!923962))

(assert (= (and b!923957 (not c!96348)) b!923970))

(assert (= (and b!923962 c!96346) b!923961))

(assert (= (and b!923962 (not c!96346)) b!923960))

(assert (= (and b!923965 res!622898) b!923959))

(assert (= (and b!923959 res!622900) b!923969))

(assert (= (and b!923968 condMapEmpty!31281) mapIsEmpty!31281))

(assert (= (and b!923968 (not condMapEmpty!31281)) mapNonEmpty!31281))

(get-info :version)

(assert (= (and mapNonEmpty!31281 ((_ is ValueCellFull!9360) mapValue!31281)) b!923958))

(assert (= (and b!923968 ((_ is ValueCellFull!9360) mapDefault!31281)) b!923964))

(assert (= start!78962 b!923968))

(declare-fun b_lambda!13677 () Bool)

(assert (=> (not b_lambda!13677) (not b!923962)))

(declare-fun t!26589 () Bool)

(declare-fun tb!5755 () Bool)

(assert (=> (and start!78962 (= defaultEntry!1235 defaultEntry!1235) t!26589) tb!5755))

(declare-fun result!11333 () Bool)

(assert (=> tb!5755 (= result!11333 tp_is_empty!19683)))

(assert (=> b!923962 t!26589))

(declare-fun b_and!28089 () Bool)

(assert (= b_and!28087 (and (=> t!26589 result!11333) b_and!28089)))

(declare-fun m!858215 () Bool)

(assert (=> b!923965 m!858215))

(declare-fun m!858217 () Bool)

(assert (=> b!923961 m!858217))

(declare-fun m!858219 () Bool)

(assert (=> b!923974 m!858219))

(declare-fun m!858221 () Bool)

(assert (=> b!923973 m!858221))

(declare-fun m!858223 () Bool)

(assert (=> start!78962 m!858223))

(declare-fun m!858225 () Bool)

(assert (=> start!78962 m!858225))

(declare-fun m!858227 () Bool)

(assert (=> start!78962 m!858227))

(declare-fun m!858229 () Bool)

(assert (=> b!923972 m!858229))

(declare-fun m!858231 () Bool)

(assert (=> b!923972 m!858231))

(declare-fun m!858233 () Bool)

(assert (=> b!923957 m!858233))

(declare-fun m!858235 () Bool)

(assert (=> b!923957 m!858235))

(declare-fun m!858237 () Bool)

(assert (=> b!923962 m!858237))

(declare-fun m!858239 () Bool)

(assert (=> b!923962 m!858239))

(declare-fun m!858241 () Bool)

(assert (=> b!923962 m!858241))

(declare-fun m!858243 () Bool)

(assert (=> b!923962 m!858243))

(declare-fun m!858245 () Bool)

(assert (=> b!923962 m!858245))

(declare-fun m!858247 () Bool)

(assert (=> b!923962 m!858247))

(declare-fun m!858249 () Bool)

(assert (=> b!923962 m!858249))

(assert (=> b!923962 m!858247))

(declare-fun m!858251 () Bool)

(assert (=> b!923962 m!858251))

(declare-fun m!858253 () Bool)

(assert (=> b!923962 m!858253))

(declare-fun m!858255 () Bool)

(assert (=> b!923962 m!858255))

(declare-fun m!858257 () Bool)

(assert (=> b!923962 m!858257))

(declare-fun m!858259 () Bool)

(assert (=> b!923962 m!858259))

(assert (=> b!923962 m!858251))

(declare-fun m!858261 () Bool)

(assert (=> b!923962 m!858261))

(declare-fun m!858263 () Bool)

(assert (=> b!923962 m!858263))

(declare-fun m!858265 () Bool)

(assert (=> b!923962 m!858265))

(assert (=> b!923962 m!858241))

(declare-fun m!858267 () Bool)

(assert (=> b!923962 m!858267))

(declare-fun m!858269 () Bool)

(assert (=> mapNonEmpty!31281 m!858269))

(declare-fun m!858271 () Bool)

(assert (=> b!923969 m!858271))

(declare-fun m!858273 () Bool)

(assert (=> b!923959 m!858273))

(assert (=> b!923959 m!858265))

(declare-fun m!858275 () Bool)

(assert (=> b!923971 m!858275))

(check-sat (not b_next!17175) (not b!923971) tp_is_empty!19683 b_and!28089 (not mapNonEmpty!31281) (not b!923973) (not b!923965) (not b!923957) (not b!923961) (not start!78962) (not b!923969) (not b!923972) (not b!923962) (not b_lambda!13677) (not b!923974) (not b!923959))
(check-sat b_and!28089 (not b_next!17175))
