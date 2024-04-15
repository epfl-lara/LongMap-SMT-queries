; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79086 () Bool)

(assert start!79086)

(declare-fun b_free!17317 () Bool)

(declare-fun b_next!17317 () Bool)

(assert (=> start!79086 (= b_free!17317 (not b_next!17317))))

(declare-fun tp!60392 () Bool)

(declare-fun b_and!28345 () Bool)

(assert (=> start!79086 (= tp!60392 b_and!28345)))

(declare-fun b!928004 () Bool)

(declare-datatypes ((V!31399 0))(
  ( (V!31400 (val!9963 Int)) )
))
(declare-datatypes ((tuple2!13070 0))(
  ( (tuple2!13071 (_1!6546 (_ BitVec 64)) (_2!6546 V!31399)) )
))
(declare-datatypes ((List!18839 0))(
  ( (Nil!18836) (Cons!18835 (h!19981 tuple2!13070) (t!26877 List!18839)) )
))
(declare-datatypes ((ListLongMap!11757 0))(
  ( (ListLongMap!11758 (toList!5894 List!18839)) )
))
(declare-fun lt!418411 () ListLongMap!11757)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!418405 () V!31399)

(declare-fun apply!703 (ListLongMap!11757 (_ BitVec 64)) V!31399)

(assert (=> b!928004 (= (apply!703 lt!418411 k0!1099) lt!418405)))

(declare-fun lt!418410 () V!31399)

(declare-fun lt!418397 () (_ BitVec 64))

(declare-fun lt!418409 () ListLongMap!11757)

(declare-datatypes ((Unit!31316 0))(
  ( (Unit!31317) )
))
(declare-fun lt!418412 () Unit!31316)

(declare-fun addApplyDifferent!408 (ListLongMap!11757 (_ BitVec 64) V!31399 (_ BitVec 64)) Unit!31316)

(assert (=> b!928004 (= lt!418412 (addApplyDifferent!408 lt!418409 lt!418397 lt!418410 k0!1099))))

(assert (=> b!928004 (not (= lt!418397 k0!1099))))

(declare-datatypes ((array!55583 0))(
  ( (array!55584 (arr!26737 (Array (_ BitVec 32) (_ BitVec 64))) (size!27198 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55583)

(declare-fun lt!418398 () Unit!31316)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((List!18840 0))(
  ( (Nil!18837) (Cons!18836 (h!19982 (_ BitVec 64)) (t!26878 List!18840)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55583 (_ BitVec 64) (_ BitVec 32) List!18840) Unit!31316)

(assert (=> b!928004 (= lt!418398 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18837))))

(declare-fun e!521023 () Bool)

(assert (=> b!928004 e!521023))

(declare-fun c!96921 () Bool)

(assert (=> b!928004 (= c!96921 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9431 0))(
  ( (ValueCellFull!9431 (v!12480 V!31399)) (EmptyCell!9431) )
))
(declare-datatypes ((array!55585 0))(
  ( (array!55586 (arr!26738 (Array (_ BitVec 32) ValueCell!9431)) (size!27199 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55585)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!418402 () Unit!31316)

(declare-fun zeroValue!1173 () V!31399)

(declare-fun minValue!1173 () V!31399)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!268 (array!55583 array!55585 (_ BitVec 32) (_ BitVec 32) V!31399 V!31399 (_ BitVec 64) (_ BitVec 32) Int) Unit!31316)

(assert (=> b!928004 (= lt!418402 (lemmaListMapContainsThenArrayContainsFrom!268 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55583 (_ BitVec 32) List!18840) Bool)

(assert (=> b!928004 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18837)))

(declare-fun lt!418401 () Unit!31316)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55583 (_ BitVec 32) (_ BitVec 32)) Unit!31316)

(assert (=> b!928004 (= lt!418401 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4905 (ListLongMap!11757 (_ BitVec 64)) Bool)

(assert (=> b!928004 (contains!4905 lt!418411 k0!1099)))

(declare-fun lt!418407 () tuple2!13070)

(declare-fun +!2780 (ListLongMap!11757 tuple2!13070) ListLongMap!11757)

(assert (=> b!928004 (= lt!418411 (+!2780 lt!418409 lt!418407))))

(declare-fun lt!418408 () Unit!31316)

(declare-fun addStillContains!477 (ListLongMap!11757 (_ BitVec 64) V!31399 (_ BitVec 64)) Unit!31316)

(assert (=> b!928004 (= lt!418408 (addStillContains!477 lt!418409 lt!418397 lt!418410 k0!1099))))

(declare-fun getCurrentListMap!3079 (array!55583 array!55585 (_ BitVec 32) (_ BitVec 32) V!31399 V!31399 (_ BitVec 32) Int) ListLongMap!11757)

(assert (=> b!928004 (= (getCurrentListMap!3079 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2780 (getCurrentListMap!3079 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418407))))

(assert (=> b!928004 (= lt!418407 (tuple2!13071 lt!418397 lt!418410))))

(declare-fun get!14081 (ValueCell!9431 V!31399) V!31399)

(declare-fun dynLambda!1536 (Int (_ BitVec 64)) V!31399)

(assert (=> b!928004 (= lt!418410 (get!14081 (select (arr!26738 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1536 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418406 () Unit!31316)

(declare-fun lemmaListMapRecursiveValidKeyArray!144 (array!55583 array!55585 (_ BitVec 32) (_ BitVec 32) V!31399 V!31399 (_ BitVec 32) Int) Unit!31316)

(assert (=> b!928004 (= lt!418406 (lemmaListMapRecursiveValidKeyArray!144 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!521022 () Unit!31316)

(assert (=> b!928004 (= e!521022 lt!418412)))

(declare-fun b!928005 () Bool)

(assert (=> b!928005 (= e!521023 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!31494 () Bool)

(declare-fun mapRes!31494 () Bool)

(assert (=> mapIsEmpty!31494 mapRes!31494))

(declare-fun v!791 () V!31399)

(declare-fun b!928006 () Bool)

(declare-fun lt!418400 () ListLongMap!11757)

(declare-fun e!521028 () Bool)

(assert (=> b!928006 (= e!521028 (= (apply!703 lt!418400 k0!1099) v!791))))

(declare-fun b!928007 () Bool)

(declare-fun e!521027 () Bool)

(declare-fun e!521025 () Bool)

(assert (=> b!928007 (= e!521027 (and e!521025 mapRes!31494))))

(declare-fun condMapEmpty!31494 () Bool)

(declare-fun mapDefault!31494 () ValueCell!9431)

(assert (=> b!928007 (= condMapEmpty!31494 (= (arr!26738 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9431)) mapDefault!31494)))))

(declare-fun b!928008 () Bool)

(declare-fun res!625017 () Bool)

(declare-fun e!521021 () Bool)

(assert (=> b!928008 (=> (not res!625017) (not e!521021))))

(assert (=> b!928008 (= res!625017 (and (= (size!27199 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27198 _keys!1487) (size!27199 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928009 () Bool)

(declare-fun res!625015 () Bool)

(assert (=> b!928009 (=> (not res!625015) (not e!521021))))

(assert (=> b!928009 (= res!625015 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18837))))

(declare-fun b!928010 () Bool)

(declare-fun e!521018 () Unit!31316)

(declare-fun Unit!31318 () Unit!31316)

(assert (=> b!928010 (= e!521018 Unit!31318)))

(declare-fun b!928011 () Bool)

(declare-fun e!521016 () Bool)

(declare-fun tp_is_empty!19825 () Bool)

(assert (=> b!928011 (= e!521016 tp_is_empty!19825)))

(declare-fun b!928012 () Bool)

(declare-fun res!625013 () Bool)

(declare-fun e!521024 () Bool)

(assert (=> b!928012 (=> (not res!625013) (not e!521024))))

(declare-fun lt!418403 () ListLongMap!11757)

(assert (=> b!928012 (= res!625013 (= (apply!703 lt!418403 k0!1099) v!791))))

(declare-fun b!928013 () Bool)

(declare-fun res!625011 () Bool)

(assert (=> b!928013 (=> (not res!625011) (not e!521021))))

(assert (=> b!928013 (= res!625011 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27198 _keys!1487))))))

(declare-fun b!928014 () Bool)

(declare-fun e!521020 () Bool)

(assert (=> b!928014 (= e!521021 e!521020)))

(declare-fun res!625014 () Bool)

(assert (=> b!928014 (=> (not res!625014) (not e!521020))))

(assert (=> b!928014 (= res!625014 (contains!4905 lt!418409 k0!1099))))

(assert (=> b!928014 (= lt!418409 (getCurrentListMap!3079 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928015 () Bool)

(declare-fun Unit!31319 () Unit!31316)

(assert (=> b!928015 (= e!521022 Unit!31319)))

(declare-fun b!928016 () Bool)

(declare-fun e!521019 () Bool)

(assert (=> b!928016 (= e!521020 e!521019)))

(declare-fun res!625016 () Bool)

(assert (=> b!928016 (=> (not res!625016) (not e!521019))))

(assert (=> b!928016 (= res!625016 (and (= lt!418405 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!928016 (= lt!418405 (apply!703 lt!418409 k0!1099))))

(declare-fun b!928017 () Bool)

(declare-fun arrayContainsKey!0 (array!55583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!928017 (= e!521023 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!928018 () Bool)

(declare-fun res!625018 () Bool)

(assert (=> b!928018 (=> (not res!625018) (not e!521021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55583 (_ BitVec 32)) Bool)

(assert (=> b!928018 (= res!625018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928019 () Bool)

(assert (=> b!928019 (= e!521024 (not (bvsle #b00000000000000000000000000000000 (size!27198 _keys!1487))))))

(assert (=> b!928019 e!521028))

(declare-fun res!625012 () Bool)

(assert (=> b!928019 (=> (not res!625012) (not e!521028))))

(assert (=> b!928019 (= res!625012 (contains!4905 lt!418400 k0!1099))))

(assert (=> b!928019 (= lt!418400 (getCurrentListMap!3079 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!418404 () Unit!31316)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!105 (array!55583 array!55585 (_ BitVec 32) (_ BitVec 32) V!31399 V!31399 (_ BitVec 64) V!31399 (_ BitVec 32) Int) Unit!31316)

(assert (=> b!928019 (= lt!418404 (lemmaListMapApplyFromThenApplyFromZero!105 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928020 () Bool)

(declare-fun e!521026 () Bool)

(assert (=> b!928020 (= e!521026 e!521024)))

(declare-fun res!625010 () Bool)

(assert (=> b!928020 (=> (not res!625010) (not e!521024))))

(assert (=> b!928020 (= res!625010 (contains!4905 lt!418403 k0!1099))))

(assert (=> b!928020 (= lt!418403 (getCurrentListMap!3079 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!31494 () Bool)

(declare-fun tp!60393 () Bool)

(assert (=> mapNonEmpty!31494 (= mapRes!31494 (and tp!60393 e!521016))))

(declare-fun mapKey!31494 () (_ BitVec 32))

(declare-fun mapValue!31494 () ValueCell!9431)

(declare-fun mapRest!31494 () (Array (_ BitVec 32) ValueCell!9431))

(assert (=> mapNonEmpty!31494 (= (arr!26738 _values!1231) (store mapRest!31494 mapKey!31494 mapValue!31494))))

(declare-fun b!928021 () Bool)

(assert (=> b!928021 (= e!521018 e!521022)))

(assert (=> b!928021 (= lt!418397 (select (arr!26737 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96920 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!928021 (= c!96920 (validKeyInArray!0 lt!418397))))

(declare-fun res!625009 () Bool)

(assert (=> start!79086 (=> (not res!625009) (not e!521021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79086 (= res!625009 (validMask!0 mask!1881))))

(assert (=> start!79086 e!521021))

(assert (=> start!79086 true))

(assert (=> start!79086 tp_is_empty!19825))

(declare-fun array_inv!20906 (array!55585) Bool)

(assert (=> start!79086 (and (array_inv!20906 _values!1231) e!521027)))

(assert (=> start!79086 tp!60392))

(declare-fun array_inv!20907 (array!55583) Bool)

(assert (=> start!79086 (array_inv!20907 _keys!1487)))

(declare-fun b!928022 () Bool)

(assert (=> b!928022 (= e!521019 e!521026)))

(declare-fun res!625019 () Bool)

(assert (=> b!928022 (=> (not res!625019) (not e!521026))))

(assert (=> b!928022 (= res!625019 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27198 _keys!1487)))))

(declare-fun lt!418399 () Unit!31316)

(assert (=> b!928022 (= lt!418399 e!521018)))

(declare-fun c!96922 () Bool)

(assert (=> b!928022 (= c!96922 (validKeyInArray!0 k0!1099))))

(declare-fun b!928023 () Bool)

(assert (=> b!928023 (= e!521025 tp_is_empty!19825)))

(assert (= (and start!79086 res!625009) b!928008))

(assert (= (and b!928008 res!625017) b!928018))

(assert (= (and b!928018 res!625018) b!928009))

(assert (= (and b!928009 res!625015) b!928013))

(assert (= (and b!928013 res!625011) b!928014))

(assert (= (and b!928014 res!625014) b!928016))

(assert (= (and b!928016 res!625016) b!928022))

(assert (= (and b!928022 c!96922) b!928021))

(assert (= (and b!928022 (not c!96922)) b!928010))

(assert (= (and b!928021 c!96920) b!928004))

(assert (= (and b!928021 (not c!96920)) b!928015))

(assert (= (and b!928004 c!96921) b!928017))

(assert (= (and b!928004 (not c!96921)) b!928005))

(assert (= (and b!928022 res!625019) b!928020))

(assert (= (and b!928020 res!625010) b!928012))

(assert (= (and b!928012 res!625013) b!928019))

(assert (= (and b!928019 res!625012) b!928006))

(assert (= (and b!928007 condMapEmpty!31494) mapIsEmpty!31494))

(assert (= (and b!928007 (not condMapEmpty!31494)) mapNonEmpty!31494))

(get-info :version)

(assert (= (and mapNonEmpty!31494 ((_ is ValueCellFull!9431) mapValue!31494)) b!928011))

(assert (= (and b!928007 ((_ is ValueCellFull!9431) mapDefault!31494)) b!928023))

(assert (= start!79086 b!928007))

(declare-fun b_lambda!13801 () Bool)

(assert (=> (not b_lambda!13801) (not b!928004)))

(declare-fun t!26876 () Bool)

(declare-fun tb!5889 () Bool)

(assert (=> (and start!79086 (= defaultEntry!1235 defaultEntry!1235) t!26876) tb!5889))

(declare-fun result!11609 () Bool)

(assert (=> tb!5889 (= result!11609 tp_is_empty!19825)))

(assert (=> b!928004 t!26876))

(declare-fun b_and!28347 () Bool)

(assert (= b_and!28345 (and (=> t!26876 result!11609) b_and!28347)))

(declare-fun m!862267 () Bool)

(assert (=> b!928021 m!862267))

(declare-fun m!862269 () Bool)

(assert (=> b!928021 m!862269))

(declare-fun m!862271 () Bool)

(assert (=> b!928019 m!862271))

(declare-fun m!862273 () Bool)

(assert (=> b!928019 m!862273))

(declare-fun m!862275 () Bool)

(assert (=> b!928019 m!862275))

(declare-fun m!862277 () Bool)

(assert (=> b!928006 m!862277))

(declare-fun m!862279 () Bool)

(assert (=> b!928004 m!862279))

(declare-fun m!862281 () Bool)

(assert (=> b!928004 m!862281))

(declare-fun m!862283 () Bool)

(assert (=> b!928004 m!862283))

(declare-fun m!862285 () Bool)

(assert (=> b!928004 m!862285))

(declare-fun m!862287 () Bool)

(assert (=> b!928004 m!862287))

(declare-fun m!862289 () Bool)

(assert (=> b!928004 m!862289))

(declare-fun m!862291 () Bool)

(assert (=> b!928004 m!862291))

(declare-fun m!862293 () Bool)

(assert (=> b!928004 m!862293))

(declare-fun m!862295 () Bool)

(assert (=> b!928004 m!862295))

(assert (=> b!928004 m!862291))

(assert (=> b!928004 m!862293))

(declare-fun m!862297 () Bool)

(assert (=> b!928004 m!862297))

(declare-fun m!862299 () Bool)

(assert (=> b!928004 m!862299))

(declare-fun m!862301 () Bool)

(assert (=> b!928004 m!862301))

(declare-fun m!862303 () Bool)

(assert (=> b!928004 m!862303))

(declare-fun m!862305 () Bool)

(assert (=> b!928004 m!862305))

(assert (=> b!928004 m!862287))

(declare-fun m!862307 () Bool)

(assert (=> b!928004 m!862307))

(declare-fun m!862309 () Bool)

(assert (=> b!928004 m!862309))

(declare-fun m!862311 () Bool)

(assert (=> b!928022 m!862311))

(declare-fun m!862313 () Bool)

(assert (=> b!928016 m!862313))

(declare-fun m!862315 () Bool)

(assert (=> b!928018 m!862315))

(declare-fun m!862317 () Bool)

(assert (=> b!928014 m!862317))

(declare-fun m!862319 () Bool)

(assert (=> b!928014 m!862319))

(declare-fun m!862321 () Bool)

(assert (=> mapNonEmpty!31494 m!862321))

(declare-fun m!862323 () Bool)

(assert (=> b!928009 m!862323))

(declare-fun m!862325 () Bool)

(assert (=> start!79086 m!862325))

(declare-fun m!862327 () Bool)

(assert (=> start!79086 m!862327))

(declare-fun m!862329 () Bool)

(assert (=> start!79086 m!862329))

(declare-fun m!862331 () Bool)

(assert (=> b!928020 m!862331))

(assert (=> b!928020 m!862299))

(declare-fun m!862333 () Bool)

(assert (=> b!928017 m!862333))

(declare-fun m!862335 () Bool)

(assert (=> b!928012 m!862335))

(check-sat (not b!928017) (not b!928018) (not b!928021) (not b!928019) (not b_lambda!13801) (not b!928016) (not b!928014) (not b!928012) (not b!928004) (not mapNonEmpty!31494) tp_is_empty!19825 b_and!28347 (not b!928022) (not b!928020) (not b!928009) (not start!79086) (not b!928006) (not b_next!17317))
(check-sat b_and!28347 (not b_next!17317))
