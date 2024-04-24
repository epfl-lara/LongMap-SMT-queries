; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79200 () Bool)

(assert start!79200)

(declare-fun b_free!17245 () Bool)

(declare-fun b_next!17245 () Bool)

(assert (=> start!79200 (= b_free!17245 (not b_next!17245))))

(declare-fun tp!60177 () Bool)

(declare-fun b_and!28237 () Bool)

(assert (=> start!79200 (= tp!60177 b_and!28237)))

(declare-fun b!926914 () Bool)

(declare-datatypes ((Unit!31291 0))(
  ( (Unit!31292) )
))
(declare-fun e!520353 () Unit!31291)

(declare-fun Unit!31293 () Unit!31291)

(assert (=> b!926914 (= e!520353 Unit!31293)))

(declare-fun b!926915 () Bool)

(declare-fun e!520347 () Unit!31291)

(declare-fun Unit!31294 () Unit!31291)

(assert (=> b!926915 (= e!520347 Unit!31294)))

(declare-fun b!926916 () Bool)

(declare-fun e!520354 () Bool)

(declare-fun e!520345 () Bool)

(declare-fun mapRes!31386 () Bool)

(assert (=> b!926916 (= e!520354 (and e!520345 mapRes!31386))))

(declare-fun condMapEmpty!31386 () Bool)

(declare-datatypes ((V!31303 0))(
  ( (V!31304 (val!9927 Int)) )
))
(declare-datatypes ((ValueCell!9395 0))(
  ( (ValueCellFull!9395 (v!12442 V!31303)) (EmptyCell!9395) )
))
(declare-datatypes ((array!55523 0))(
  ( (array!55524 (arr!26702 (Array (_ BitVec 32) ValueCell!9395)) (size!27162 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55523)

(declare-fun mapDefault!31386 () ValueCell!9395)

(assert (=> b!926916 (= condMapEmpty!31386 (= (arr!26702 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9395)) mapDefault!31386)))))

(declare-fun b!926917 () Bool)

(declare-fun e!520346 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!926917 (= e!520346 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!926918 () Bool)

(declare-fun e!520349 () Bool)

(declare-fun e!520352 () Bool)

(assert (=> b!926918 (= e!520349 e!520352)))

(declare-fun res!624280 () Bool)

(assert (=> b!926918 (=> (not res!624280) (not e!520352))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun v!791 () V!31303)

(declare-fun lt!417267 () V!31303)

(assert (=> b!926918 (= res!624280 (and (= lt!417267 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!12936 0))(
  ( (tuple2!12937 (_1!6479 (_ BitVec 64)) (_2!6479 V!31303)) )
))
(declare-datatypes ((List!18747 0))(
  ( (Nil!18744) (Cons!18743 (h!19895 tuple2!12936) (t!26714 List!18747)) )
))
(declare-datatypes ((ListLongMap!11635 0))(
  ( (ListLongMap!11636 (toList!5833 List!18747)) )
))
(declare-fun lt!417276 () ListLongMap!11635)

(declare-fun apply!684 (ListLongMap!11635 (_ BitVec 64)) V!31303)

(assert (=> b!926918 (= lt!417267 (apply!684 lt!417276 k0!1099))))

(declare-fun b!926919 () Bool)

(declare-fun e!520344 () Bool)

(assert (=> b!926919 (= e!520352 e!520344)))

(declare-fun res!624277 () Bool)

(assert (=> b!926919 (=> (not res!624277) (not e!520344))))

(declare-datatypes ((array!55525 0))(
  ( (array!55526 (arr!26703 (Array (_ BitVec 32) (_ BitVec 64))) (size!27163 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55525)

(assert (=> b!926919 (= res!624277 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27163 _keys!1487)))))

(declare-fun lt!417281 () Unit!31291)

(assert (=> b!926919 (= lt!417281 e!520353)))

(declare-fun c!96943 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926919 (= c!96943 (validKeyInArray!0 k0!1099))))

(declare-fun b!926920 () Bool)

(declare-fun e!520348 () Bool)

(assert (=> b!926920 (= e!520348 e!520349)))

(declare-fun res!624283 () Bool)

(assert (=> b!926920 (=> (not res!624283) (not e!520349))))

(declare-fun contains!4905 (ListLongMap!11635 (_ BitVec 64)) Bool)

(assert (=> b!926920 (= res!624283 (contains!4905 lt!417276 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31303)

(declare-fun minValue!1173 () V!31303)

(declare-fun getCurrentListMap!3083 (array!55525 array!55523 (_ BitVec 32) (_ BitVec 32) V!31303 V!31303 (_ BitVec 32) Int) ListLongMap!11635)

(assert (=> b!926920 (= lt!417276 (getCurrentListMap!3083 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!926921 () Bool)

(declare-fun res!624282 () Bool)

(assert (=> b!926921 (=> (not res!624282) (not e!520348))))

(assert (=> b!926921 (= res!624282 (and (= (size!27162 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27163 _keys!1487) (size!27162 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!624275 () Bool)

(assert (=> start!79200 (=> (not res!624275) (not e!520348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79200 (= res!624275 (validMask!0 mask!1881))))

(assert (=> start!79200 e!520348))

(assert (=> start!79200 true))

(declare-fun tp_is_empty!19753 () Bool)

(assert (=> start!79200 tp_is_empty!19753))

(declare-fun array_inv!20896 (array!55523) Bool)

(assert (=> start!79200 (and (array_inv!20896 _values!1231) e!520354)))

(assert (=> start!79200 tp!60177))

(declare-fun array_inv!20897 (array!55525) Bool)

(assert (=> start!79200 (array_inv!20897 _keys!1487)))

(declare-fun b!926922 () Bool)

(declare-fun e!520342 () Bool)

(assert (=> b!926922 (= e!520342 (not true))))

(declare-fun e!520350 () Bool)

(assert (=> b!926922 e!520350))

(declare-fun res!624279 () Bool)

(assert (=> b!926922 (=> (not res!624279) (not e!520350))))

(declare-fun lt!417272 () ListLongMap!11635)

(assert (=> b!926922 (= res!624279 (contains!4905 lt!417272 k0!1099))))

(assert (=> b!926922 (= lt!417272 (getCurrentListMap!3083 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!417278 () Unit!31291)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!77 (array!55525 array!55523 (_ BitVec 32) (_ BitVec 32) V!31303 V!31303 (_ BitVec 64) V!31303 (_ BitVec 32) Int) Unit!31291)

(assert (=> b!926922 (= lt!417278 (lemmaListMapApplyFromThenApplyFromZero!77 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926923 () Bool)

(declare-fun res!624278 () Bool)

(assert (=> b!926923 (=> (not res!624278) (not e!520348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55525 (_ BitVec 32)) Bool)

(assert (=> b!926923 (= res!624278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!926924 () Bool)

(assert (=> b!926924 (= e!520344 e!520342)))

(declare-fun res!624276 () Bool)

(assert (=> b!926924 (=> (not res!624276) (not e!520342))))

(declare-fun lt!417266 () ListLongMap!11635)

(assert (=> b!926924 (= res!624276 (contains!4905 lt!417266 k0!1099))))

(assert (=> b!926924 (= lt!417266 (getCurrentListMap!3083 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926925 () Bool)

(declare-fun e!520343 () Bool)

(assert (=> b!926925 (= e!520343 tp_is_empty!19753)))

(declare-fun b!926926 () Bool)

(declare-fun res!624285 () Bool)

(assert (=> b!926926 (=> (not res!624285) (not e!520348))))

(declare-datatypes ((List!18748 0))(
  ( (Nil!18745) (Cons!18744 (h!19896 (_ BitVec 64)) (t!26715 List!18748)) )
))
(declare-fun arrayNoDuplicates!0 (array!55525 (_ BitVec 32) List!18748) Bool)

(assert (=> b!926926 (= res!624285 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18745))))

(declare-fun b!926927 () Bool)

(declare-fun res!624284 () Bool)

(assert (=> b!926927 (=> (not res!624284) (not e!520342))))

(assert (=> b!926927 (= res!624284 (= (apply!684 lt!417266 k0!1099) v!791))))

(declare-fun b!926928 () Bool)

(declare-fun res!624281 () Bool)

(assert (=> b!926928 (=> (not res!624281) (not e!520348))))

(assert (=> b!926928 (= res!624281 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27163 _keys!1487))))))

(declare-fun b!926929 () Bool)

(assert (=> b!926929 (= e!520350 (= (apply!684 lt!417272 k0!1099) v!791))))

(declare-fun b!926930 () Bool)

(declare-fun arrayContainsKey!0 (array!55525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926930 (= e!520346 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapNonEmpty!31386 () Bool)

(declare-fun tp!60176 () Bool)

(assert (=> mapNonEmpty!31386 (= mapRes!31386 (and tp!60176 e!520343))))

(declare-fun mapKey!31386 () (_ BitVec 32))

(declare-fun mapValue!31386 () ValueCell!9395)

(declare-fun mapRest!31386 () (Array (_ BitVec 32) ValueCell!9395))

(assert (=> mapNonEmpty!31386 (= (arr!26702 _values!1231) (store mapRest!31386 mapKey!31386 mapValue!31386))))

(declare-fun mapIsEmpty!31386 () Bool)

(assert (=> mapIsEmpty!31386 mapRes!31386))

(declare-fun b!926931 () Bool)

(declare-fun lt!417271 () ListLongMap!11635)

(assert (=> b!926931 (= (apply!684 lt!417271 k0!1099) lt!417267)))

(declare-fun lt!417269 () (_ BitVec 64))

(declare-fun lt!417274 () Unit!31291)

(declare-fun lt!417270 () V!31303)

(declare-fun addApplyDifferent!383 (ListLongMap!11635 (_ BitVec 64) V!31303 (_ BitVec 64)) Unit!31291)

(assert (=> b!926931 (= lt!417274 (addApplyDifferent!383 lt!417276 lt!417269 lt!417270 k0!1099))))

(assert (=> b!926931 (not (= lt!417269 k0!1099))))

(declare-fun lt!417273 () Unit!31291)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55525 (_ BitVec 64) (_ BitVec 32) List!18748) Unit!31291)

(assert (=> b!926931 (= lt!417273 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18745))))

(assert (=> b!926931 e!520346))

(declare-fun c!96944 () Bool)

(assert (=> b!926931 (= c!96944 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!417275 () Unit!31291)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!238 (array!55525 array!55523 (_ BitVec 32) (_ BitVec 32) V!31303 V!31303 (_ BitVec 64) (_ BitVec 32) Int) Unit!31291)

(assert (=> b!926931 (= lt!417275 (lemmaListMapContainsThenArrayContainsFrom!238 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!926931 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18745)))

(declare-fun lt!417279 () Unit!31291)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55525 (_ BitVec 32) (_ BitVec 32)) Unit!31291)

(assert (=> b!926931 (= lt!417279 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!926931 (contains!4905 lt!417271 k0!1099)))

(declare-fun lt!417280 () tuple2!12936)

(declare-fun +!2747 (ListLongMap!11635 tuple2!12936) ListLongMap!11635)

(assert (=> b!926931 (= lt!417271 (+!2747 lt!417276 lt!417280))))

(declare-fun lt!417277 () Unit!31291)

(declare-fun addStillContains!456 (ListLongMap!11635 (_ BitVec 64) V!31303 (_ BitVec 64)) Unit!31291)

(assert (=> b!926931 (= lt!417277 (addStillContains!456 lt!417276 lt!417269 lt!417270 k0!1099))))

(assert (=> b!926931 (= (getCurrentListMap!3083 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2747 (getCurrentListMap!3083 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417280))))

(assert (=> b!926931 (= lt!417280 (tuple2!12937 lt!417269 lt!417270))))

(declare-fun get!14064 (ValueCell!9395 V!31303) V!31303)

(declare-fun dynLambda!1544 (Int (_ BitVec 64)) V!31303)

(assert (=> b!926931 (= lt!417270 (get!14064 (select (arr!26702 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1544 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417268 () Unit!31291)

(declare-fun lemmaListMapRecursiveValidKeyArray!127 (array!55525 array!55523 (_ BitVec 32) (_ BitVec 32) V!31303 V!31303 (_ BitVec 32) Int) Unit!31291)

(assert (=> b!926931 (= lt!417268 (lemmaListMapRecursiveValidKeyArray!127 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!926931 (= e!520347 lt!417274)))

(declare-fun b!926932 () Bool)

(assert (=> b!926932 (= e!520345 tp_is_empty!19753)))

(declare-fun b!926933 () Bool)

(assert (=> b!926933 (= e!520353 e!520347)))

(assert (=> b!926933 (= lt!417269 (select (arr!26703 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96945 () Bool)

(assert (=> b!926933 (= c!96945 (validKeyInArray!0 lt!417269))))

(assert (= (and start!79200 res!624275) b!926921))

(assert (= (and b!926921 res!624282) b!926923))

(assert (= (and b!926923 res!624278) b!926926))

(assert (= (and b!926926 res!624285) b!926928))

(assert (= (and b!926928 res!624281) b!926920))

(assert (= (and b!926920 res!624283) b!926918))

(assert (= (and b!926918 res!624280) b!926919))

(assert (= (and b!926919 c!96943) b!926933))

(assert (= (and b!926919 (not c!96943)) b!926914))

(assert (= (and b!926933 c!96945) b!926931))

(assert (= (and b!926933 (not c!96945)) b!926915))

(assert (= (and b!926931 c!96944) b!926930))

(assert (= (and b!926931 (not c!96944)) b!926917))

(assert (= (and b!926919 res!624277) b!926924))

(assert (= (and b!926924 res!624276) b!926927))

(assert (= (and b!926927 res!624284) b!926922))

(assert (= (and b!926922 res!624279) b!926929))

(assert (= (and b!926916 condMapEmpty!31386) mapIsEmpty!31386))

(assert (= (and b!926916 (not condMapEmpty!31386)) mapNonEmpty!31386))

(get-info :version)

(assert (= (and mapNonEmpty!31386 ((_ is ValueCellFull!9395) mapValue!31386)) b!926925))

(assert (= (and b!926916 ((_ is ValueCellFull!9395) mapDefault!31386)) b!926932))

(assert (= start!79200 b!926916))

(declare-fun b_lambda!13761 () Bool)

(assert (=> (not b_lambda!13761) (not b!926931)))

(declare-fun t!26713 () Bool)

(declare-fun tb!5817 () Bool)

(assert (=> (and start!79200 (= defaultEntry!1235 defaultEntry!1235) t!26713) tb!5817))

(declare-fun result!11465 () Bool)

(assert (=> tb!5817 (= result!11465 tp_is_empty!19753)))

(assert (=> b!926931 t!26713))

(declare-fun b_and!28239 () Bool)

(assert (= b_and!28237 (and (=> t!26713 result!11465) b_and!28239)))

(declare-fun m!861799 () Bool)

(assert (=> b!926918 m!861799))

(declare-fun m!861801 () Bool)

(assert (=> b!926926 m!861801))

(declare-fun m!861803 () Bool)

(assert (=> b!926919 m!861803))

(declare-fun m!861805 () Bool)

(assert (=> mapNonEmpty!31386 m!861805))

(declare-fun m!861807 () Bool)

(assert (=> b!926923 m!861807))

(declare-fun m!861809 () Bool)

(assert (=> b!926931 m!861809))

(declare-fun m!861811 () Bool)

(assert (=> b!926931 m!861811))

(declare-fun m!861813 () Bool)

(assert (=> b!926931 m!861813))

(declare-fun m!861815 () Bool)

(assert (=> b!926931 m!861815))

(declare-fun m!861817 () Bool)

(assert (=> b!926931 m!861817))

(declare-fun m!861819 () Bool)

(assert (=> b!926931 m!861819))

(assert (=> b!926931 m!861815))

(declare-fun m!861821 () Bool)

(assert (=> b!926931 m!861821))

(declare-fun m!861823 () Bool)

(assert (=> b!926931 m!861823))

(declare-fun m!861825 () Bool)

(assert (=> b!926931 m!861825))

(declare-fun m!861827 () Bool)

(assert (=> b!926931 m!861827))

(declare-fun m!861829 () Bool)

(assert (=> b!926931 m!861829))

(declare-fun m!861831 () Bool)

(assert (=> b!926931 m!861831))

(declare-fun m!861833 () Bool)

(assert (=> b!926931 m!861833))

(assert (=> b!926931 m!861819))

(assert (=> b!926931 m!861831))

(declare-fun m!861835 () Bool)

(assert (=> b!926931 m!861835))

(declare-fun m!861837 () Bool)

(assert (=> b!926931 m!861837))

(declare-fun m!861839 () Bool)

(assert (=> b!926931 m!861839))

(declare-fun m!861841 () Bool)

(assert (=> b!926930 m!861841))

(declare-fun m!861843 () Bool)

(assert (=> b!926933 m!861843))

(declare-fun m!861845 () Bool)

(assert (=> b!926933 m!861845))

(declare-fun m!861847 () Bool)

(assert (=> b!926922 m!861847))

(declare-fun m!861849 () Bool)

(assert (=> b!926922 m!861849))

(declare-fun m!861851 () Bool)

(assert (=> b!926922 m!861851))

(declare-fun m!861853 () Bool)

(assert (=> b!926927 m!861853))

(declare-fun m!861855 () Bool)

(assert (=> b!926920 m!861855))

(declare-fun m!861857 () Bool)

(assert (=> b!926920 m!861857))

(declare-fun m!861859 () Bool)

(assert (=> b!926924 m!861859))

(assert (=> b!926924 m!861823))

(declare-fun m!861861 () Bool)

(assert (=> b!926929 m!861861))

(declare-fun m!861863 () Bool)

(assert (=> start!79200 m!861863))

(declare-fun m!861865 () Bool)

(assert (=> start!79200 m!861865))

(declare-fun m!861867 () Bool)

(assert (=> start!79200 m!861867))

(check-sat tp_is_empty!19753 (not b!926918) (not b!926922) (not b_lambda!13761) (not b!926926) (not b!926931) (not start!79200) (not b!926933) (not b!926927) (not b!926920) (not b!926924) (not b!926929) (not b!926919) (not mapNonEmpty!31386) b_and!28239 (not b!926930) (not b!926923) (not b_next!17245))
(check-sat b_and!28239 (not b_next!17245))
