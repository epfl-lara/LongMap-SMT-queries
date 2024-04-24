; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79814 () Bool)

(assert start!79814)

(declare-fun b_free!17695 () Bool)

(declare-fun b_next!17695 () Bool)

(assert (=> start!79814 (= b_free!17695 (not b_next!17695))))

(declare-fun tp!61541 () Bool)

(declare-fun b_and!28991 () Bool)

(assert (=> start!79814 (= tp!61541 b_and!28991)))

(declare-fun res!630839 () Bool)

(declare-fun e!526331 () Bool)

(assert (=> start!79814 (=> (not res!630839) (not e!526331))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79814 (= res!630839 (validMask!0 mask!1881))))

(assert (=> start!79814 e!526331))

(assert (=> start!79814 true))

(declare-fun tp_is_empty!20203 () Bool)

(assert (=> start!79814 tp_is_empty!20203))

(declare-datatypes ((V!31903 0))(
  ( (V!31904 (val!10152 Int)) )
))
(declare-datatypes ((ValueCell!9620 0))(
  ( (ValueCellFull!9620 (v!12674 V!31903)) (EmptyCell!9620) )
))
(declare-datatypes ((array!56399 0))(
  ( (array!56400 (arr!27135 (Array (_ BitVec 32) ValueCell!9620)) (size!27595 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56399)

(declare-fun e!526336 () Bool)

(declare-fun array_inv!21190 (array!56399) Bool)

(assert (=> start!79814 (and (array_inv!21190 _values!1231) e!526336)))

(assert (=> start!79814 tp!61541))

(declare-datatypes ((array!56401 0))(
  ( (array!56402 (arr!27136 (Array (_ BitVec 32) (_ BitVec 64))) (size!27596 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56401)

(declare-fun array_inv!21191 (array!56401) Bool)

(assert (=> start!79814 (array_inv!21191 _keys!1487)))

(declare-fun b!937241 () Bool)

(declare-fun res!630835 () Bool)

(assert (=> b!937241 (=> (not res!630835) (not e!526331))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!937241 (= res!630835 (and (= (size!27595 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27596 _keys!1487) (size!27595 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!937242 () Bool)

(declare-datatypes ((Unit!31564 0))(
  ( (Unit!31565) )
))
(declare-fun e!526338 () Unit!31564)

(declare-fun e!526335 () Unit!31564)

(assert (=> b!937242 (= e!526338 e!526335)))

(declare-fun lt!422513 () (_ BitVec 64))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!937242 (= lt!422513 (select (arr!27136 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97661 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937242 (= c!97661 (validKeyInArray!0 lt!422513))))

(declare-fun e!526332 () Bool)

(declare-fun b!937243 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937243 (= e!526332 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapNonEmpty!32076 () Bool)

(declare-fun mapRes!32076 () Bool)

(declare-fun tp!61542 () Bool)

(declare-fun e!526334 () Bool)

(assert (=> mapNonEmpty!32076 (= mapRes!32076 (and tp!61542 e!526334))))

(declare-fun mapValue!32076 () ValueCell!9620)

(declare-fun mapKey!32076 () (_ BitVec 32))

(declare-fun mapRest!32076 () (Array (_ BitVec 32) ValueCell!9620))

(assert (=> mapNonEmpty!32076 (= (arr!27135 _values!1231) (store mapRest!32076 mapKey!32076 mapValue!32076))))

(declare-fun b!937244 () Bool)

(assert (=> b!937244 (= e!526334 tp_is_empty!20203)))

(declare-fun b!937245 () Bool)

(declare-fun res!630840 () Bool)

(assert (=> b!937245 (=> (not res!630840) (not e!526331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56401 (_ BitVec 32)) Bool)

(assert (=> b!937245 (= res!630840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!937246 () Bool)

(declare-fun e!526329 () Bool)

(assert (=> b!937246 (= e!526336 (and e!526329 mapRes!32076))))

(declare-fun condMapEmpty!32076 () Bool)

(declare-fun mapDefault!32076 () ValueCell!9620)

(assert (=> b!937246 (= condMapEmpty!32076 (= (arr!27135 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9620)) mapDefault!32076)))))

(declare-fun b!937247 () Bool)

(declare-fun res!630837 () Bool)

(assert (=> b!937247 (=> (not res!630837) (not e!526331))))

(declare-datatypes ((List!19095 0))(
  ( (Nil!19092) (Cons!19091 (h!20243 (_ BitVec 64)) (t!27326 List!19095)) )
))
(declare-fun arrayNoDuplicates!0 (array!56401 (_ BitVec 32) List!19095) Bool)

(assert (=> b!937247 (= res!630837 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19092))))

(declare-fun b!937248 () Bool)

(declare-fun e!526333 () Bool)

(assert (=> b!937248 (= e!526331 e!526333)))

(declare-fun res!630836 () Bool)

(assert (=> b!937248 (=> (not res!630836) (not e!526333))))

(declare-datatypes ((tuple2!13314 0))(
  ( (tuple2!13315 (_1!6668 (_ BitVec 64)) (_2!6668 V!31903)) )
))
(declare-datatypes ((List!19096 0))(
  ( (Nil!19093) (Cons!19092 (h!20244 tuple2!13314) (t!27327 List!19096)) )
))
(declare-datatypes ((ListLongMap!12013 0))(
  ( (ListLongMap!12014 (toList!6022 List!19096)) )
))
(declare-fun lt!422507 () ListLongMap!12013)

(declare-fun contains!5094 (ListLongMap!12013 (_ BitVec 64)) Bool)

(assert (=> b!937248 (= res!630836 (contains!5094 lt!422507 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31903)

(declare-fun minValue!1173 () V!31903)

(declare-fun getCurrentListMap!3259 (array!56401 array!56399 (_ BitVec 32) (_ BitVec 32) V!31903 V!31903 (_ BitVec 32) Int) ListLongMap!12013)

(assert (=> b!937248 (= lt!422507 (getCurrentListMap!3259 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!937249 () Bool)

(declare-fun lt!422508 () ListLongMap!12013)

(declare-fun lt!422509 () V!31903)

(declare-fun apply!841 (ListLongMap!12013 (_ BitVec 64)) V!31903)

(assert (=> b!937249 (= (apply!841 lt!422508 k0!1099) lt!422509)))

(declare-fun lt!422512 () V!31903)

(declare-fun lt!422506 () Unit!31564)

(declare-fun addApplyDifferent!421 (ListLongMap!12013 (_ BitVec 64) V!31903 (_ BitVec 64)) Unit!31564)

(assert (=> b!937249 (= lt!422506 (addApplyDifferent!421 lt!422507 lt!422513 lt!422512 k0!1099))))

(assert (=> b!937249 (not (= lt!422513 k0!1099))))

(declare-fun lt!422511 () Unit!31564)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56401 (_ BitVec 64) (_ BitVec 32) List!19095) Unit!31564)

(assert (=> b!937249 (= lt!422511 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19092))))

(assert (=> b!937249 e!526332))

(declare-fun c!97660 () Bool)

(assert (=> b!937249 (= c!97660 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422515 () Unit!31564)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!291 (array!56401 array!56399 (_ BitVec 32) (_ BitVec 32) V!31903 V!31903 (_ BitVec 64) (_ BitVec 32) Int) Unit!31564)

(assert (=> b!937249 (= lt!422515 (lemmaListMapContainsThenArrayContainsFrom!291 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!937249 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19092)))

(declare-fun lt!422505 () Unit!31564)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56401 (_ BitVec 32) (_ BitVec 32)) Unit!31564)

(assert (=> b!937249 (= lt!422505 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!937249 (contains!5094 lt!422508 k0!1099)))

(declare-fun lt!422516 () tuple2!13314)

(declare-fun +!2837 (ListLongMap!12013 tuple2!13314) ListLongMap!12013)

(assert (=> b!937249 (= lt!422508 (+!2837 lt!422507 lt!422516))))

(declare-fun lt!422510 () Unit!31564)

(declare-fun addStillContains!540 (ListLongMap!12013 (_ BitVec 64) V!31903 (_ BitVec 64)) Unit!31564)

(assert (=> b!937249 (= lt!422510 (addStillContains!540 lt!422507 lt!422513 lt!422512 k0!1099))))

(assert (=> b!937249 (= (getCurrentListMap!3259 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2837 (getCurrentListMap!3259 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422516))))

(assert (=> b!937249 (= lt!422516 (tuple2!13315 lt!422513 lt!422512))))

(declare-fun get!14319 (ValueCell!9620 V!31903) V!31903)

(declare-fun dynLambda!1634 (Int (_ BitVec 64)) V!31903)

(assert (=> b!937249 (= lt!422512 (get!14319 (select (arr!27135 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1634 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422517 () Unit!31564)

(declare-fun lemmaListMapRecursiveValidKeyArray!217 (array!56401 array!56399 (_ BitVec 32) (_ BitVec 32) V!31903 V!31903 (_ BitVec 32) Int) Unit!31564)

(assert (=> b!937249 (= lt!422517 (lemmaListMapRecursiveValidKeyArray!217 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!937249 (= e!526335 lt!422506)))

(declare-fun mapIsEmpty!32076 () Bool)

(assert (=> mapIsEmpty!32076 mapRes!32076))

(declare-fun b!937250 () Bool)

(assert (=> b!937250 (= e!526332 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!937251 () Bool)

(declare-fun Unit!31566 () Unit!31564)

(assert (=> b!937251 (= e!526338 Unit!31566)))

(declare-fun b!937252 () Bool)

(declare-fun res!630834 () Bool)

(assert (=> b!937252 (=> (not res!630834) (not e!526331))))

(assert (=> b!937252 (= res!630834 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27596 _keys!1487))))))

(declare-fun b!937253 () Bool)

(declare-fun e!526337 () Bool)

(assert (=> b!937253 (= e!526333 e!526337)))

(declare-fun res!630838 () Bool)

(assert (=> b!937253 (=> (not res!630838) (not e!526337))))

(declare-fun v!791 () V!31903)

(assert (=> b!937253 (= res!630838 (and (= lt!422509 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!937253 (= lt!422509 (apply!841 lt!422507 k0!1099))))

(declare-fun b!937254 () Bool)

(assert (=> b!937254 (= e!526329 tp_is_empty!20203)))

(declare-fun b!937255 () Bool)

(assert (=> b!937255 (= e!526337 false)))

(declare-fun lt!422514 () Unit!31564)

(assert (=> b!937255 (= lt!422514 e!526338)))

(declare-fun c!97662 () Bool)

(assert (=> b!937255 (= c!97662 (validKeyInArray!0 k0!1099))))

(declare-fun b!937256 () Bool)

(declare-fun Unit!31567 () Unit!31564)

(assert (=> b!937256 (= e!526335 Unit!31567)))

(assert (= (and start!79814 res!630839) b!937241))

(assert (= (and b!937241 res!630835) b!937245))

(assert (= (and b!937245 res!630840) b!937247))

(assert (= (and b!937247 res!630837) b!937252))

(assert (= (and b!937252 res!630834) b!937248))

(assert (= (and b!937248 res!630836) b!937253))

(assert (= (and b!937253 res!630838) b!937255))

(assert (= (and b!937255 c!97662) b!937242))

(assert (= (and b!937255 (not c!97662)) b!937251))

(assert (= (and b!937242 c!97661) b!937249))

(assert (= (and b!937242 (not c!97661)) b!937256))

(assert (= (and b!937249 c!97660) b!937243))

(assert (= (and b!937249 (not c!97660)) b!937250))

(assert (= (and b!937246 condMapEmpty!32076) mapIsEmpty!32076))

(assert (= (and b!937246 (not condMapEmpty!32076)) mapNonEmpty!32076))

(get-info :version)

(assert (= (and mapNonEmpty!32076 ((_ is ValueCellFull!9620) mapValue!32076)) b!937244))

(assert (= (and b!937246 ((_ is ValueCellFull!9620) mapDefault!32076)) b!937254))

(assert (= start!79814 b!937246))

(declare-fun b_lambda!14115 () Bool)

(assert (=> (not b_lambda!14115) (not b!937249)))

(declare-fun t!27325 () Bool)

(declare-fun tb!6081 () Bool)

(assert (=> (and start!79814 (= defaultEntry!1235 defaultEntry!1235) t!27325) tb!6081))

(declare-fun result!12003 () Bool)

(assert (=> tb!6081 (= result!12003 tp_is_empty!20203)))

(assert (=> b!937249 t!27325))

(declare-fun b_and!28993 () Bool)

(assert (= b_and!28991 (and (=> t!27325 result!12003) b_and!28993)))

(declare-fun m!872219 () Bool)

(assert (=> b!937243 m!872219))

(declare-fun m!872221 () Bool)

(assert (=> b!937255 m!872221))

(declare-fun m!872223 () Bool)

(assert (=> b!937253 m!872223))

(declare-fun m!872225 () Bool)

(assert (=> b!937249 m!872225))

(declare-fun m!872227 () Bool)

(assert (=> b!937249 m!872227))

(declare-fun m!872229 () Bool)

(assert (=> b!937249 m!872229))

(declare-fun m!872231 () Bool)

(assert (=> b!937249 m!872231))

(declare-fun m!872233 () Bool)

(assert (=> b!937249 m!872233))

(declare-fun m!872235 () Bool)

(assert (=> b!937249 m!872235))

(assert (=> b!937249 m!872233))

(declare-fun m!872237 () Bool)

(assert (=> b!937249 m!872237))

(declare-fun m!872239 () Bool)

(assert (=> b!937249 m!872239))

(declare-fun m!872241 () Bool)

(assert (=> b!937249 m!872241))

(declare-fun m!872243 () Bool)

(assert (=> b!937249 m!872243))

(declare-fun m!872245 () Bool)

(assert (=> b!937249 m!872245))

(declare-fun m!872247 () Bool)

(assert (=> b!937249 m!872247))

(assert (=> b!937249 m!872235))

(declare-fun m!872249 () Bool)

(assert (=> b!937249 m!872249))

(declare-fun m!872251 () Bool)

(assert (=> b!937249 m!872251))

(declare-fun m!872253 () Bool)

(assert (=> b!937249 m!872253))

(assert (=> b!937249 m!872225))

(declare-fun m!872255 () Bool)

(assert (=> b!937249 m!872255))

(declare-fun m!872257 () Bool)

(assert (=> b!937247 m!872257))

(declare-fun m!872259 () Bool)

(assert (=> b!937248 m!872259))

(declare-fun m!872261 () Bool)

(assert (=> b!937248 m!872261))

(declare-fun m!872263 () Bool)

(assert (=> b!937242 m!872263))

(declare-fun m!872265 () Bool)

(assert (=> b!937242 m!872265))

(declare-fun m!872267 () Bool)

(assert (=> start!79814 m!872267))

(declare-fun m!872269 () Bool)

(assert (=> start!79814 m!872269))

(declare-fun m!872271 () Bool)

(assert (=> start!79814 m!872271))

(declare-fun m!872273 () Bool)

(assert (=> b!937245 m!872273))

(declare-fun m!872275 () Bool)

(assert (=> mapNonEmpty!32076 m!872275))

(check-sat tp_is_empty!20203 (not b_next!17695) (not b!937247) (not mapNonEmpty!32076) (not b!937255) b_and!28993 (not b!937243) (not b!937245) (not b!937249) (not b!937253) (not start!79814) (not b_lambda!14115) (not b!937248) (not b!937242))
(check-sat b_and!28993 (not b_next!17695))
