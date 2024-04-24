; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79666 () Bool)

(assert start!79666)

(declare-fun b_free!17653 () Bool)

(declare-fun b_next!17653 () Bool)

(assert (=> start!79666 (= b_free!17653 (not b_next!17653))))

(declare-fun tp!61407 () Bool)

(declare-fun b_and!28883 () Bool)

(assert (=> start!79666 (= tp!61407 b_and!28883)))

(declare-fun b!935558 () Bool)

(declare-fun res!629827 () Bool)

(declare-fun e!525379 () Bool)

(assert (=> b!935558 (=> (not res!629827) (not e!525379))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!935558 (= res!629827 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!32004 () Bool)

(declare-fun mapRes!32004 () Bool)

(declare-fun tp!61406 () Bool)

(declare-fun e!525373 () Bool)

(assert (=> mapNonEmpty!32004 (= mapRes!32004 (and tp!61406 e!525373))))

(declare-datatypes ((V!31847 0))(
  ( (V!31848 (val!10131 Int)) )
))
(declare-datatypes ((ValueCell!9599 0))(
  ( (ValueCellFull!9599 (v!12648 V!31847)) (EmptyCell!9599) )
))
(declare-fun mapRest!32004 () (Array (_ BitVec 32) ValueCell!9599))

(declare-fun mapValue!32004 () ValueCell!9599)

(declare-fun mapKey!32004 () (_ BitVec 32))

(declare-datatypes ((array!56311 0))(
  ( (array!56312 (arr!27094 (Array (_ BitVec 32) ValueCell!9599)) (size!27554 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56311)

(assert (=> mapNonEmpty!32004 (= (arr!27094 _values!1231) (store mapRest!32004 mapKey!32004 mapValue!32004))))

(declare-fun b!935559 () Bool)

(declare-fun res!629832 () Bool)

(assert (=> b!935559 (=> (not res!629832) (not e!525379))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31847)

(declare-datatypes ((tuple2!13276 0))(
  ( (tuple2!13277 (_1!6649 (_ BitVec 64)) (_2!6649 V!31847)) )
))
(declare-datatypes ((List!19059 0))(
  ( (Nil!19056) (Cons!19055 (h!20207 tuple2!13276) (t!27248 List!19059)) )
))
(declare-datatypes ((ListLongMap!11975 0))(
  ( (ListLongMap!11976 (toList!6003 List!19059)) )
))
(declare-fun lt!421455 () ListLongMap!11975)

(declare-fun apply!827 (ListLongMap!11975 (_ BitVec 64)) V!31847)

(assert (=> b!935559 (= res!629832 (= (apply!827 lt!421455 k0!1099) v!791))))

(declare-fun res!629829 () Bool)

(declare-fun e!525381 () Bool)

(assert (=> start!79666 (=> (not res!629829) (not e!525381))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79666 (= res!629829 (validMask!0 mask!1881))))

(assert (=> start!79666 e!525381))

(assert (=> start!79666 true))

(declare-fun tp_is_empty!20161 () Bool)

(assert (=> start!79666 tp_is_empty!20161))

(declare-fun e!525376 () Bool)

(declare-fun array_inv!21166 (array!56311) Bool)

(assert (=> start!79666 (and (array_inv!21166 _values!1231) e!525376)))

(assert (=> start!79666 tp!61407))

(declare-datatypes ((array!56313 0))(
  ( (array!56314 (arr!27095 (Array (_ BitVec 32) (_ BitVec 64))) (size!27555 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56313)

(declare-fun array_inv!21167 (array!56313) Bool)

(assert (=> start!79666 (array_inv!21167 _keys!1487)))

(declare-fun e!525374 () Bool)

(declare-fun b!935560 () Bool)

(declare-fun arrayContainsKey!0 (array!56313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!935560 (= e!525374 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!935561 () Bool)

(declare-fun res!629835 () Bool)

(assert (=> b!935561 (=> (not res!629835) (not e!525381))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!935561 (= res!629835 (and (= (size!27554 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27555 _keys!1487) (size!27554 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!935562 () Bool)

(assert (=> b!935562 (= e!525373 tp_is_empty!20161)))

(declare-fun b!935563 () Bool)

(declare-fun e!525380 () Bool)

(declare-datatypes ((List!19060 0))(
  ( (Nil!19057) (Cons!19056 (h!20208 (_ BitVec 64)) (t!27249 List!19060)) )
))
(declare-fun noDuplicate!1359 (List!19060) Bool)

(assert (=> b!935563 (= e!525380 (noDuplicate!1359 Nil!19057))))

(declare-fun mapIsEmpty!32004 () Bool)

(assert (=> mapIsEmpty!32004 mapRes!32004))

(declare-fun b!935564 () Bool)

(declare-fun e!525375 () Bool)

(assert (=> b!935564 (= e!525376 (and e!525375 mapRes!32004))))

(declare-fun condMapEmpty!32004 () Bool)

(declare-fun mapDefault!32004 () ValueCell!9599)

(assert (=> b!935564 (= condMapEmpty!32004 (= (arr!27094 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9599)) mapDefault!32004)))))

(declare-fun b!935565 () Bool)

(assert (=> b!935565 (= e!525381 e!525379)))

(declare-fun res!629834 () Bool)

(assert (=> b!935565 (=> (not res!629834) (not e!525379))))

(declare-fun contains!5067 (ListLongMap!11975 (_ BitVec 64)) Bool)

(assert (=> b!935565 (= res!629834 (contains!5067 lt!421455 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31847)

(declare-fun minValue!1173 () V!31847)

(declare-fun getCurrentListMap!3242 (array!56313 array!56311 (_ BitVec 32) (_ BitVec 32) V!31847 V!31847 (_ BitVec 32) Int) ListLongMap!11975)

(assert (=> b!935565 (= lt!421455 (getCurrentListMap!3242 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935566 () Bool)

(declare-fun res!629833 () Bool)

(assert (=> b!935566 (=> (not res!629833) (not e!525381))))

(assert (=> b!935566 (= res!629833 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27555 _keys!1487))))))

(declare-fun b!935567 () Bool)

(declare-fun e!525378 () Bool)

(assert (=> b!935567 (= e!525379 e!525378)))

(declare-fun res!629825 () Bool)

(assert (=> b!935567 (=> (not res!629825) (not e!525378))))

(declare-fun lt!421451 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!935567 (= res!629825 (validKeyInArray!0 lt!421451))))

(assert (=> b!935567 (= lt!421451 (select (arr!27095 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!935568 () Bool)

(assert (=> b!935568 (= e!525374 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!935569 () Bool)

(declare-fun res!629830 () Bool)

(assert (=> b!935569 (=> (not res!629830) (not e!525381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56313 (_ BitVec 32)) Bool)

(assert (=> b!935569 (= res!629830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!935570 () Bool)

(assert (=> b!935570 (= e!525378 (not e!525380))))

(declare-fun res!629828 () Bool)

(assert (=> b!935570 (=> res!629828 e!525380)))

(assert (=> b!935570 (= res!629828 (or (bvsge (size!27555 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27555 _keys!1487))))))

(assert (=> b!935570 e!525374))

(declare-fun c!97452 () Bool)

(assert (=> b!935570 (= c!97452 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31527 0))(
  ( (Unit!31528) )
))
(declare-fun lt!421454 () Unit!31527)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!280 (array!56313 array!56311 (_ BitVec 32) (_ BitVec 32) V!31847 V!31847 (_ BitVec 64) (_ BitVec 32) Int) Unit!31527)

(assert (=> b!935570 (= lt!421454 (lemmaListMapContainsThenArrayContainsFrom!280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56313 (_ BitVec 32) List!19060) Bool)

(assert (=> b!935570 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19057)))

(declare-fun lt!421450 () Unit!31527)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56313 (_ BitVec 32) (_ BitVec 32)) Unit!31527)

(assert (=> b!935570 (= lt!421450 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421452 () tuple2!13276)

(declare-fun +!2826 (ListLongMap!11975 tuple2!13276) ListLongMap!11975)

(assert (=> b!935570 (contains!5067 (+!2826 lt!421455 lt!421452) k0!1099)))

(declare-fun lt!421453 () V!31847)

(declare-fun lt!421456 () Unit!31527)

(declare-fun addStillContains!529 (ListLongMap!11975 (_ BitVec 64) V!31847 (_ BitVec 64)) Unit!31527)

(assert (=> b!935570 (= lt!421456 (addStillContains!529 lt!421455 lt!421451 lt!421453 k0!1099))))

(assert (=> b!935570 (= (getCurrentListMap!3242 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2826 (getCurrentListMap!3242 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421452))))

(assert (=> b!935570 (= lt!421452 (tuple2!13277 lt!421451 lt!421453))))

(declare-fun get!14285 (ValueCell!9599 V!31847) V!31847)

(declare-fun dynLambda!1623 (Int (_ BitVec 64)) V!31847)

(assert (=> b!935570 (= lt!421453 (get!14285 (select (arr!27094 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1623 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421449 () Unit!31527)

(declare-fun lemmaListMapRecursiveValidKeyArray!206 (array!56313 array!56311 (_ BitVec 32) (_ BitVec 32) V!31847 V!31847 (_ BitVec 32) Int) Unit!31527)

(assert (=> b!935570 (= lt!421449 (lemmaListMapRecursiveValidKeyArray!206 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!935571 () Bool)

(declare-fun res!629831 () Bool)

(assert (=> b!935571 (=> (not res!629831) (not e!525381))))

(assert (=> b!935571 (= res!629831 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19057))))

(declare-fun b!935572 () Bool)

(declare-fun res!629826 () Bool)

(assert (=> b!935572 (=> (not res!629826) (not e!525379))))

(assert (=> b!935572 (= res!629826 (validKeyInArray!0 k0!1099))))

(declare-fun b!935573 () Bool)

(assert (=> b!935573 (= e!525375 tp_is_empty!20161)))

(assert (= (and start!79666 res!629829) b!935561))

(assert (= (and b!935561 res!629835) b!935569))

(assert (= (and b!935569 res!629830) b!935571))

(assert (= (and b!935571 res!629831) b!935566))

(assert (= (and b!935566 res!629833) b!935565))

(assert (= (and b!935565 res!629834) b!935559))

(assert (= (and b!935559 res!629832) b!935558))

(assert (= (and b!935558 res!629827) b!935572))

(assert (= (and b!935572 res!629826) b!935567))

(assert (= (and b!935567 res!629825) b!935570))

(assert (= (and b!935570 c!97452) b!935560))

(assert (= (and b!935570 (not c!97452)) b!935568))

(assert (= (and b!935570 (not res!629828)) b!935563))

(assert (= (and b!935564 condMapEmpty!32004) mapIsEmpty!32004))

(assert (= (and b!935564 (not condMapEmpty!32004)) mapNonEmpty!32004))

(get-info :version)

(assert (= (and mapNonEmpty!32004 ((_ is ValueCellFull!9599) mapValue!32004)) b!935562))

(assert (= (and b!935564 ((_ is ValueCellFull!9599) mapDefault!32004)) b!935573))

(assert (= start!79666 b!935564))

(declare-fun b_lambda!14019 () Bool)

(assert (=> (not b_lambda!14019) (not b!935570)))

(declare-fun t!27247 () Bool)

(declare-fun tb!6039 () Bool)

(assert (=> (and start!79666 (= defaultEntry!1235 defaultEntry!1235) t!27247) tb!6039))

(declare-fun result!11913 () Bool)

(assert (=> tb!6039 (= result!11913 tp_is_empty!20161)))

(assert (=> b!935570 t!27247))

(declare-fun b_and!28885 () Bool)

(assert (= b_and!28883 (and (=> t!27247 result!11913) b_and!28885)))

(declare-fun m!870265 () Bool)

(assert (=> b!935569 m!870265))

(declare-fun m!870267 () Bool)

(assert (=> b!935565 m!870267))

(declare-fun m!870269 () Bool)

(assert (=> b!935565 m!870269))

(declare-fun m!870271 () Bool)

(assert (=> b!935563 m!870271))

(declare-fun m!870273 () Bool)

(assert (=> b!935571 m!870273))

(declare-fun m!870275 () Bool)

(assert (=> b!935570 m!870275))

(declare-fun m!870277 () Bool)

(assert (=> b!935570 m!870277))

(declare-fun m!870279 () Bool)

(assert (=> b!935570 m!870279))

(declare-fun m!870281 () Bool)

(assert (=> b!935570 m!870281))

(declare-fun m!870283 () Bool)

(assert (=> b!935570 m!870283))

(declare-fun m!870285 () Bool)

(assert (=> b!935570 m!870285))

(declare-fun m!870287 () Bool)

(assert (=> b!935570 m!870287))

(assert (=> b!935570 m!870275))

(assert (=> b!935570 m!870285))

(assert (=> b!935570 m!870287))

(declare-fun m!870289 () Bool)

(assert (=> b!935570 m!870289))

(declare-fun m!870291 () Bool)

(assert (=> b!935570 m!870291))

(declare-fun m!870293 () Bool)

(assert (=> b!935570 m!870293))

(declare-fun m!870295 () Bool)

(assert (=> b!935570 m!870295))

(declare-fun m!870297 () Bool)

(assert (=> b!935570 m!870297))

(assert (=> b!935570 m!870281))

(declare-fun m!870299 () Bool)

(assert (=> b!935570 m!870299))

(declare-fun m!870301 () Bool)

(assert (=> b!935559 m!870301))

(declare-fun m!870303 () Bool)

(assert (=> start!79666 m!870303))

(declare-fun m!870305 () Bool)

(assert (=> start!79666 m!870305))

(declare-fun m!870307 () Bool)

(assert (=> start!79666 m!870307))

(declare-fun m!870309 () Bool)

(assert (=> mapNonEmpty!32004 m!870309))

(declare-fun m!870311 () Bool)

(assert (=> b!935560 m!870311))

(declare-fun m!870313 () Bool)

(assert (=> b!935567 m!870313))

(declare-fun m!870315 () Bool)

(assert (=> b!935567 m!870315))

(declare-fun m!870317 () Bool)

(assert (=> b!935572 m!870317))

(check-sat (not b!935560) (not b!935565) (not b!935571) (not b!935570) (not mapNonEmpty!32004) tp_is_empty!20161 (not b!935559) (not b!935569) (not b_lambda!14019) b_and!28885 (not b_next!17653) (not start!79666) (not b!935572) (not b!935567) (not b!935563))
(check-sat b_and!28885 (not b_next!17653))
(get-model)

(declare-fun b_lambda!14025 () Bool)

(assert (= b_lambda!14019 (or (and start!79666 b_free!17653) b_lambda!14025)))

(check-sat (not b!935560) (not b!935565) (not b!935571) (not b!935570) (not mapNonEmpty!32004) tp_is_empty!20161 (not b!935559) (not b!935569) (not b_lambda!14025) b_and!28885 (not b_next!17653) (not start!79666) (not b!935572) (not b!935567) (not b!935563))
(check-sat b_and!28885 (not b_next!17653))
(get-model)

(declare-fun d!113469 () Bool)

(declare-datatypes ((Option!484 0))(
  ( (Some!483 (v!12651 V!31847)) (None!482) )
))
(declare-fun get!14286 (Option!484) V!31847)

(declare-fun getValueByKey!478 (List!19059 (_ BitVec 64)) Option!484)

(assert (=> d!113469 (= (apply!827 lt!421455 k0!1099) (get!14286 (getValueByKey!478 (toList!6003 lt!421455) k0!1099)))))

(declare-fun bs!26258 () Bool)

(assert (= bs!26258 d!113469))

(declare-fun m!870427 () Bool)

(assert (=> bs!26258 m!870427))

(assert (=> bs!26258 m!870427))

(declare-fun m!870429 () Bool)

(assert (=> bs!26258 m!870429))

(assert (=> b!935559 d!113469))

(declare-fun bm!40677 () Bool)

(declare-fun call!40680 () Bool)

(assert (=> bm!40677 (= call!40680 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!935684 () Bool)

(declare-fun e!525442 () Bool)

(declare-fun e!525444 () Bool)

(assert (=> b!935684 (= e!525442 e!525444)))

(declare-fun lt!421511 () (_ BitVec 64))

(assert (=> b!935684 (= lt!421511 (select (arr!27095 _keys!1487) #b00000000000000000000000000000000))))

(declare-fun lt!421513 () Unit!31527)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56313 (_ BitVec 64) (_ BitVec 32)) Unit!31527)

(assert (=> b!935684 (= lt!421513 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!421511 #b00000000000000000000000000000000))))

(assert (=> b!935684 (arrayContainsKey!0 _keys!1487 lt!421511 #b00000000000000000000000000000000)))

(declare-fun lt!421512 () Unit!31527)

(assert (=> b!935684 (= lt!421512 lt!421513)))

(declare-fun res!629906 () Bool)

(declare-datatypes ((SeekEntryResult!8932 0))(
  ( (MissingZero!8932 (index!38099 (_ BitVec 32))) (Found!8932 (index!38100 (_ BitVec 32))) (Intermediate!8932 (undefined!9744 Bool) (index!38101 (_ BitVec 32)) (x!80143 (_ BitVec 32))) (Undefined!8932) (MissingVacant!8932 (index!38102 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56313 (_ BitVec 32)) SeekEntryResult!8932)

(assert (=> b!935684 (= res!629906 (= (seekEntryOrOpen!0 (select (arr!27095 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8932 #b00000000000000000000000000000000)))))

(assert (=> b!935684 (=> (not res!629906) (not e!525444))))

(declare-fun b!935685 () Bool)

(assert (=> b!935685 (= e!525442 call!40680)))

(declare-fun d!113471 () Bool)

(declare-fun res!629907 () Bool)

(declare-fun e!525443 () Bool)

(assert (=> d!113471 (=> res!629907 e!525443)))

(assert (=> d!113471 (= res!629907 (bvsge #b00000000000000000000000000000000 (size!27555 _keys!1487)))))

(assert (=> d!113471 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!525443)))

(declare-fun b!935686 () Bool)

(assert (=> b!935686 (= e!525444 call!40680)))

(declare-fun b!935687 () Bool)

(assert (=> b!935687 (= e!525443 e!525442)))

(declare-fun c!97461 () Bool)

(assert (=> b!935687 (= c!97461 (validKeyInArray!0 (select (arr!27095 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!113471 (not res!629907)) b!935687))

(assert (= (and b!935687 c!97461) b!935684))

(assert (= (and b!935687 (not c!97461)) b!935685))

(assert (= (and b!935684 res!629906) b!935686))

(assert (= (or b!935686 b!935685) bm!40677))

(declare-fun m!870431 () Bool)

(assert (=> bm!40677 m!870431))

(declare-fun m!870433 () Bool)

(assert (=> b!935684 m!870433))

(declare-fun m!870435 () Bool)

(assert (=> b!935684 m!870435))

(declare-fun m!870437 () Bool)

(assert (=> b!935684 m!870437))

(assert (=> b!935684 m!870433))

(declare-fun m!870439 () Bool)

(assert (=> b!935684 m!870439))

(assert (=> b!935687 m!870433))

(assert (=> b!935687 m!870433))

(declare-fun m!870441 () Bool)

(assert (=> b!935687 m!870441))

(assert (=> b!935569 d!113471))

(declare-fun d!113473 () Bool)

(declare-fun res!629912 () Bool)

(declare-fun e!525449 () Bool)

(assert (=> d!113473 (=> res!629912 e!525449)))

(assert (=> d!113473 (= res!629912 (= (select (arr!27095 _keys!1487) from!1844) k0!1099))))

(assert (=> d!113473 (= (arrayContainsKey!0 _keys!1487 k0!1099 from!1844) e!525449)))

(declare-fun b!935692 () Bool)

(declare-fun e!525450 () Bool)

(assert (=> b!935692 (= e!525449 e!525450)))

(declare-fun res!629913 () Bool)

(assert (=> b!935692 (=> (not res!629913) (not e!525450))))

(assert (=> b!935692 (= res!629913 (bvslt (bvadd from!1844 #b00000000000000000000000000000001) (size!27555 _keys!1487)))))

(declare-fun b!935693 () Bool)

(assert (=> b!935693 (= e!525450 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)))))

(assert (= (and d!113473 (not res!629912)) b!935692))

(assert (= (and b!935692 res!629913) b!935693))

(declare-fun m!870443 () Bool)

(assert (=> d!113473 m!870443))

(declare-fun m!870445 () Bool)

(assert (=> b!935693 m!870445))

(assert (=> b!935560 d!113473))

(declare-fun call!40700 () ListLongMap!11975)

(declare-fun call!40697 () ListLongMap!11975)

(declare-fun call!40695 () ListLongMap!11975)

(declare-fun c!97479 () Bool)

(declare-fun bm!40692 () Bool)

(declare-fun c!97475 () Bool)

(declare-fun call!40696 () ListLongMap!11975)

(assert (=> bm!40692 (= call!40697 (+!2826 (ite c!97475 call!40700 (ite c!97479 call!40696 call!40695)) (ite (or c!97475 c!97479) (tuple2!13277 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13277 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun e!525478 () Bool)

(declare-fun lt!421572 () ListLongMap!11975)

(declare-fun b!935736 () Bool)

(assert (=> b!935736 (= e!525478 (= (apply!827 lt!421572 (select (arr!27095 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14285 (select (arr!27094 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1623 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935736 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27554 _values!1231)))))

(assert (=> b!935736 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27555 _keys!1487)))))

(declare-fun b!935737 () Bool)

(declare-fun e!525477 () Bool)

(declare-fun e!525481 () Bool)

(assert (=> b!935737 (= e!525477 e!525481)))

(declare-fun c!97478 () Bool)

(assert (=> b!935737 (= c!97478 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!935738 () Bool)

(declare-fun e!525482 () ListLongMap!11975)

(declare-fun call!40699 () ListLongMap!11975)

(assert (=> b!935738 (= e!525482 call!40699)))

(declare-fun b!935739 () Bool)

(declare-fun res!629939 () Bool)

(assert (=> b!935739 (=> (not res!629939) (not e!525477))))

(declare-fun e!525480 () Bool)

(assert (=> b!935739 (= res!629939 e!525480)))

(declare-fun c!97474 () Bool)

(assert (=> b!935739 (= c!97474 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40693 () Bool)

(declare-fun call!40698 () Bool)

(assert (=> bm!40693 (= call!40698 (contains!5067 lt!421572 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!113475 () Bool)

(assert (=> d!113475 e!525477))

(declare-fun res!629935 () Bool)

(assert (=> d!113475 (=> (not res!629935) (not e!525477))))

(assert (=> d!113475 (= res!629935 (or (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27555 _keys!1487)) (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27555 _keys!1487)))))))

(declare-fun lt!421568 () ListLongMap!11975)

(assert (=> d!113475 (= lt!421572 lt!421568)))

(declare-fun lt!421571 () Unit!31527)

(declare-fun e!525487 () Unit!31527)

(assert (=> d!113475 (= lt!421571 e!525487)))

(declare-fun c!97476 () Bool)

(declare-fun e!525485 () Bool)

(assert (=> d!113475 (= c!97476 e!525485)))

(declare-fun res!629932 () Bool)

(assert (=> d!113475 (=> (not res!629932) (not e!525485))))

(assert (=> d!113475 (= res!629932 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27555 _keys!1487)))))

(declare-fun e!525488 () ListLongMap!11975)

(assert (=> d!113475 (= lt!421568 e!525488)))

(assert (=> d!113475 (= c!97475 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113475 (validMask!0 mask!1881)))

(assert (=> d!113475 (= (getCurrentListMap!3242 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!421572)))

(declare-fun b!935740 () Bool)

(declare-fun e!525483 () Bool)

(assert (=> b!935740 (= e!525480 e!525483)))

(declare-fun res!629934 () Bool)

(assert (=> b!935740 (= res!629934 call!40698)))

(assert (=> b!935740 (=> (not res!629934) (not e!525483))))

(declare-fun b!935741 () Bool)

(assert (=> b!935741 (= e!525483 (= (apply!827 lt!421572 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!935742 () Bool)

(assert (=> b!935742 (= e!525480 (not call!40698))))

(declare-fun b!935743 () Bool)

(declare-fun Unit!31529 () Unit!31527)

(assert (=> b!935743 (= e!525487 Unit!31529)))

(declare-fun bm!40694 () Bool)

(declare-fun call!40701 () Bool)

(assert (=> bm!40694 (= call!40701 (contains!5067 lt!421572 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935744 () Bool)

(assert (=> b!935744 (= e!525482 call!40695)))

(declare-fun b!935745 () Bool)

(assert (=> b!935745 (= e!525485 (validKeyInArray!0 (select (arr!27095 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!935746 () Bool)

(declare-fun res!629936 () Bool)

(assert (=> b!935746 (=> (not res!629936) (not e!525477))))

(declare-fun e!525489 () Bool)

(assert (=> b!935746 (= res!629936 e!525489)))

(declare-fun res!629937 () Bool)

(assert (=> b!935746 (=> res!629937 e!525489)))

(declare-fun e!525484 () Bool)

(assert (=> b!935746 (= res!629937 (not e!525484))))

(declare-fun res!629940 () Bool)

(assert (=> b!935746 (=> (not res!629940) (not e!525484))))

(assert (=> b!935746 (= res!629940 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27555 _keys!1487)))))

(declare-fun b!935747 () Bool)

(declare-fun e!525486 () Bool)

(assert (=> b!935747 (= e!525481 e!525486)))

(declare-fun res!629938 () Bool)

(assert (=> b!935747 (= res!629938 call!40701)))

(assert (=> b!935747 (=> (not res!629938) (not e!525486))))

(declare-fun b!935748 () Bool)

(assert (=> b!935748 (= e!525484 (validKeyInArray!0 (select (arr!27095 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!935749 () Bool)

(assert (=> b!935749 (= e!525488 (+!2826 call!40697 (tuple2!13277 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!935750 () Bool)

(declare-fun e!525479 () ListLongMap!11975)

(assert (=> b!935750 (= e!525479 call!40699)))

(declare-fun bm!40695 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3344 (array!56313 array!56311 (_ BitVec 32) (_ BitVec 32) V!31847 V!31847 (_ BitVec 32) Int) ListLongMap!11975)

(assert (=> bm!40695 (= call!40700 (getCurrentListMapNoExtraKeys!3344 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!935751 () Bool)

(assert (=> b!935751 (= e!525489 e!525478)))

(declare-fun res!629933 () Bool)

(assert (=> b!935751 (=> (not res!629933) (not e!525478))))

(assert (=> b!935751 (= res!629933 (contains!5067 lt!421572 (select (arr!27095 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!935751 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27555 _keys!1487)))))

(declare-fun bm!40696 () Bool)

(assert (=> bm!40696 (= call!40699 call!40697)))

(declare-fun b!935752 () Bool)

(assert (=> b!935752 (= e!525488 e!525479)))

(assert (=> b!935752 (= c!97479 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!935753 () Bool)

(assert (=> b!935753 (= e!525481 (not call!40701))))

(declare-fun bm!40697 () Bool)

(assert (=> bm!40697 (= call!40696 call!40700)))

(declare-fun bm!40698 () Bool)

(assert (=> bm!40698 (= call!40695 call!40696)))

(declare-fun b!935754 () Bool)

(declare-fun lt!421577 () Unit!31527)

(assert (=> b!935754 (= e!525487 lt!421577)))

(declare-fun lt!421576 () ListLongMap!11975)

(assert (=> b!935754 (= lt!421576 (getCurrentListMapNoExtraKeys!3344 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421575 () (_ BitVec 64))

(assert (=> b!935754 (= lt!421575 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421569 () (_ BitVec 64))

(assert (=> b!935754 (= lt!421569 (select (arr!27095 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421574 () Unit!31527)

(assert (=> b!935754 (= lt!421574 (addStillContains!529 lt!421576 lt!421575 zeroValue!1173 lt!421569))))

(assert (=> b!935754 (contains!5067 (+!2826 lt!421576 (tuple2!13277 lt!421575 zeroValue!1173)) lt!421569)))

(declare-fun lt!421562 () Unit!31527)

(assert (=> b!935754 (= lt!421562 lt!421574)))

(declare-fun lt!421578 () ListLongMap!11975)

(assert (=> b!935754 (= lt!421578 (getCurrentListMapNoExtraKeys!3344 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421573 () (_ BitVec 64))

(assert (=> b!935754 (= lt!421573 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421564 () (_ BitVec 64))

(assert (=> b!935754 (= lt!421564 (select (arr!27095 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421560 () Unit!31527)

(declare-fun addApplyDifferent!418 (ListLongMap!11975 (_ BitVec 64) V!31847 (_ BitVec 64)) Unit!31527)

(assert (=> b!935754 (= lt!421560 (addApplyDifferent!418 lt!421578 lt!421573 minValue!1173 lt!421564))))

(assert (=> b!935754 (= (apply!827 (+!2826 lt!421578 (tuple2!13277 lt!421573 minValue!1173)) lt!421564) (apply!827 lt!421578 lt!421564))))

(declare-fun lt!421565 () Unit!31527)

(assert (=> b!935754 (= lt!421565 lt!421560)))

(declare-fun lt!421566 () ListLongMap!11975)

(assert (=> b!935754 (= lt!421566 (getCurrentListMapNoExtraKeys!3344 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421570 () (_ BitVec 64))

(assert (=> b!935754 (= lt!421570 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421561 () (_ BitVec 64))

(assert (=> b!935754 (= lt!421561 (select (arr!27095 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421558 () Unit!31527)

(assert (=> b!935754 (= lt!421558 (addApplyDifferent!418 lt!421566 lt!421570 zeroValue!1173 lt!421561))))

(assert (=> b!935754 (= (apply!827 (+!2826 lt!421566 (tuple2!13277 lt!421570 zeroValue!1173)) lt!421561) (apply!827 lt!421566 lt!421561))))

(declare-fun lt!421559 () Unit!31527)

(assert (=> b!935754 (= lt!421559 lt!421558)))

(declare-fun lt!421563 () ListLongMap!11975)

(assert (=> b!935754 (= lt!421563 (getCurrentListMapNoExtraKeys!3344 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421567 () (_ BitVec 64))

(assert (=> b!935754 (= lt!421567 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421579 () (_ BitVec 64))

(assert (=> b!935754 (= lt!421579 (select (arr!27095 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!935754 (= lt!421577 (addApplyDifferent!418 lt!421563 lt!421567 minValue!1173 lt!421579))))

(assert (=> b!935754 (= (apply!827 (+!2826 lt!421563 (tuple2!13277 lt!421567 minValue!1173)) lt!421579) (apply!827 lt!421563 lt!421579))))

(declare-fun b!935755 () Bool)

(assert (=> b!935755 (= e!525486 (= (apply!827 lt!421572 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!935756 () Bool)

(declare-fun c!97477 () Bool)

(assert (=> b!935756 (= c!97477 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!935756 (= e!525479 e!525482)))

(assert (= (and d!113475 c!97475) b!935749))

(assert (= (and d!113475 (not c!97475)) b!935752))

(assert (= (and b!935752 c!97479) b!935750))

(assert (= (and b!935752 (not c!97479)) b!935756))

(assert (= (and b!935756 c!97477) b!935738))

(assert (= (and b!935756 (not c!97477)) b!935744))

(assert (= (or b!935738 b!935744) bm!40698))

(assert (= (or b!935750 bm!40698) bm!40697))

(assert (= (or b!935750 b!935738) bm!40696))

(assert (= (or b!935749 bm!40697) bm!40695))

(assert (= (or b!935749 bm!40696) bm!40692))

(assert (= (and d!113475 res!629932) b!935745))

(assert (= (and d!113475 c!97476) b!935754))

(assert (= (and d!113475 (not c!97476)) b!935743))

(assert (= (and d!113475 res!629935) b!935746))

(assert (= (and b!935746 res!629940) b!935748))

(assert (= (and b!935746 (not res!629937)) b!935751))

(assert (= (and b!935751 res!629933) b!935736))

(assert (= (and b!935746 res!629936) b!935739))

(assert (= (and b!935739 c!97474) b!935740))

(assert (= (and b!935739 (not c!97474)) b!935742))

(assert (= (and b!935740 res!629934) b!935741))

(assert (= (or b!935740 b!935742) bm!40693))

(assert (= (and b!935739 res!629939) b!935737))

(assert (= (and b!935737 c!97478) b!935747))

(assert (= (and b!935737 (not c!97478)) b!935753))

(assert (= (and b!935747 res!629938) b!935755))

(assert (= (or b!935747 b!935753) bm!40694))

(declare-fun b_lambda!14027 () Bool)

(assert (=> (not b_lambda!14027) (not b!935736)))

(assert (=> b!935736 t!27247))

(declare-fun b_and!28895 () Bool)

(assert (= b_and!28885 (and (=> t!27247 result!11913) b_and!28895)))

(assert (=> b!935751 m!870315))

(assert (=> b!935751 m!870315))

(declare-fun m!870447 () Bool)

(assert (=> b!935751 m!870447))

(declare-fun m!870449 () Bool)

(assert (=> b!935749 m!870449))

(declare-fun m!870451 () Bool)

(assert (=> bm!40694 m!870451))

(declare-fun m!870453 () Bool)

(assert (=> b!935741 m!870453))

(declare-fun m!870455 () Bool)

(assert (=> b!935755 m!870455))

(assert (=> b!935736 m!870285))

(assert (=> b!935736 m!870287))

(assert (=> b!935736 m!870289))

(assert (=> b!935736 m!870315))

(assert (=> b!935736 m!870285))

(assert (=> b!935736 m!870287))

(assert (=> b!935736 m!870315))

(declare-fun m!870457 () Bool)

(assert (=> b!935736 m!870457))

(assert (=> d!113475 m!870303))

(declare-fun m!870459 () Bool)

(assert (=> bm!40695 m!870459))

(declare-fun m!870461 () Bool)

(assert (=> bm!40693 m!870461))

(assert (=> b!935748 m!870315))

(assert (=> b!935748 m!870315))

(declare-fun m!870463 () Bool)

(assert (=> b!935748 m!870463))

(declare-fun m!870465 () Bool)

(assert (=> bm!40692 m!870465))

(declare-fun m!870467 () Bool)

(assert (=> b!935754 m!870467))

(declare-fun m!870469 () Bool)

(assert (=> b!935754 m!870469))

(declare-fun m!870471 () Bool)

(assert (=> b!935754 m!870471))

(declare-fun m!870473 () Bool)

(assert (=> b!935754 m!870473))

(declare-fun m!870475 () Bool)

(assert (=> b!935754 m!870475))

(declare-fun m!870477 () Bool)

(assert (=> b!935754 m!870477))

(declare-fun m!870479 () Bool)

(assert (=> b!935754 m!870479))

(declare-fun m!870481 () Bool)

(assert (=> b!935754 m!870481))

(assert (=> b!935754 m!870477))

(declare-fun m!870483 () Bool)

(assert (=> b!935754 m!870483))

(declare-fun m!870485 () Bool)

(assert (=> b!935754 m!870485))

(assert (=> b!935754 m!870467))

(assert (=> b!935754 m!870459))

(declare-fun m!870487 () Bool)

(assert (=> b!935754 m!870487))

(assert (=> b!935754 m!870315))

(declare-fun m!870489 () Bool)

(assert (=> b!935754 m!870489))

(declare-fun m!870491 () Bool)

(assert (=> b!935754 m!870491))

(declare-fun m!870493 () Bool)

(assert (=> b!935754 m!870493))

(declare-fun m!870495 () Bool)

(assert (=> b!935754 m!870495))

(assert (=> b!935754 m!870483))

(assert (=> b!935754 m!870491))

(assert (=> b!935745 m!870315))

(assert (=> b!935745 m!870315))

(assert (=> b!935745 m!870463))

(assert (=> b!935570 d!113475))

(declare-fun d!113477 () Bool)

(declare-fun e!525492 () Bool)

(assert (=> d!113477 e!525492))

(declare-fun res!629945 () Bool)

(assert (=> d!113477 (=> (not res!629945) (not e!525492))))

(declare-fun lt!421589 () ListLongMap!11975)

(assert (=> d!113477 (= res!629945 (contains!5067 lt!421589 (_1!6649 lt!421452)))))

(declare-fun lt!421591 () List!19059)

(assert (=> d!113477 (= lt!421589 (ListLongMap!11976 lt!421591))))

(declare-fun lt!421590 () Unit!31527)

(declare-fun lt!421588 () Unit!31527)

(assert (=> d!113477 (= lt!421590 lt!421588)))

(assert (=> d!113477 (= (getValueByKey!478 lt!421591 (_1!6649 lt!421452)) (Some!483 (_2!6649 lt!421452)))))

(declare-fun lemmaContainsTupThenGetReturnValue!257 (List!19059 (_ BitVec 64) V!31847) Unit!31527)

(assert (=> d!113477 (= lt!421588 (lemmaContainsTupThenGetReturnValue!257 lt!421591 (_1!6649 lt!421452) (_2!6649 lt!421452)))))

(declare-fun insertStrictlySorted!314 (List!19059 (_ BitVec 64) V!31847) List!19059)

(assert (=> d!113477 (= lt!421591 (insertStrictlySorted!314 (toList!6003 (getCurrentListMap!3242 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6649 lt!421452) (_2!6649 lt!421452)))))

(assert (=> d!113477 (= (+!2826 (getCurrentListMap!3242 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421452) lt!421589)))

(declare-fun b!935761 () Bool)

(declare-fun res!629946 () Bool)

(assert (=> b!935761 (=> (not res!629946) (not e!525492))))

(assert (=> b!935761 (= res!629946 (= (getValueByKey!478 (toList!6003 lt!421589) (_1!6649 lt!421452)) (Some!483 (_2!6649 lt!421452))))))

(declare-fun b!935762 () Bool)

(declare-fun contains!5070 (List!19059 tuple2!13276) Bool)

(assert (=> b!935762 (= e!525492 (contains!5070 (toList!6003 lt!421589) lt!421452))))

(assert (= (and d!113477 res!629945) b!935761))

(assert (= (and b!935761 res!629946) b!935762))

(declare-fun m!870497 () Bool)

(assert (=> d!113477 m!870497))

(declare-fun m!870499 () Bool)

(assert (=> d!113477 m!870499))

(declare-fun m!870501 () Bool)

(assert (=> d!113477 m!870501))

(declare-fun m!870503 () Bool)

(assert (=> d!113477 m!870503))

(declare-fun m!870505 () Bool)

(assert (=> b!935761 m!870505))

(declare-fun m!870507 () Bool)

(assert (=> b!935762 m!870507))

(assert (=> b!935570 d!113477))

(declare-fun c!97485 () Bool)

(declare-fun call!40704 () ListLongMap!11975)

(declare-fun c!97481 () Bool)

(declare-fun call!40703 () ListLongMap!11975)

(declare-fun call!40702 () ListLongMap!11975)

(declare-fun bm!40699 () Bool)

(declare-fun call!40707 () ListLongMap!11975)

(assert (=> bm!40699 (= call!40704 (+!2826 (ite c!97481 call!40707 (ite c!97485 call!40703 call!40702)) (ite (or c!97481 c!97485) (tuple2!13277 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13277 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun lt!421606 () ListLongMap!11975)

(declare-fun e!525494 () Bool)

(declare-fun b!935763 () Bool)

(assert (=> b!935763 (= e!525494 (= (apply!827 lt!421606 (select (arr!27095 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14285 (select (arr!27094 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1623 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935763 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27554 _values!1231)))))

(assert (=> b!935763 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27555 _keys!1487)))))

(declare-fun b!935764 () Bool)

(declare-fun e!525493 () Bool)

(declare-fun e!525497 () Bool)

(assert (=> b!935764 (= e!525493 e!525497)))

(declare-fun c!97484 () Bool)

(assert (=> b!935764 (= c!97484 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!935765 () Bool)

(declare-fun e!525498 () ListLongMap!11975)

(declare-fun call!40706 () ListLongMap!11975)

(assert (=> b!935765 (= e!525498 call!40706)))

(declare-fun b!935766 () Bool)

(declare-fun res!629954 () Bool)

(assert (=> b!935766 (=> (not res!629954) (not e!525493))))

(declare-fun e!525496 () Bool)

(assert (=> b!935766 (= res!629954 e!525496)))

(declare-fun c!97480 () Bool)

(assert (=> b!935766 (= c!97480 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40700 () Bool)

(declare-fun call!40705 () Bool)

(assert (=> bm!40700 (= call!40705 (contains!5067 lt!421606 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!113479 () Bool)

(assert (=> d!113479 e!525493))

(declare-fun res!629950 () Bool)

(assert (=> d!113479 (=> (not res!629950) (not e!525493))))

(assert (=> d!113479 (= res!629950 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27555 _keys!1487)) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27555 _keys!1487)))))))

(declare-fun lt!421602 () ListLongMap!11975)

(assert (=> d!113479 (= lt!421606 lt!421602)))

(declare-fun lt!421605 () Unit!31527)

(declare-fun e!525503 () Unit!31527)

(assert (=> d!113479 (= lt!421605 e!525503)))

(declare-fun c!97482 () Bool)

(declare-fun e!525501 () Bool)

(assert (=> d!113479 (= c!97482 e!525501)))

(declare-fun res!629947 () Bool)

(assert (=> d!113479 (=> (not res!629947) (not e!525501))))

(assert (=> d!113479 (= res!629947 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27555 _keys!1487)))))

(declare-fun e!525504 () ListLongMap!11975)

(assert (=> d!113479 (= lt!421602 e!525504)))

(assert (=> d!113479 (= c!97481 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113479 (validMask!0 mask!1881)))

(assert (=> d!113479 (= (getCurrentListMap!3242 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421606)))

(declare-fun b!935767 () Bool)

(declare-fun e!525499 () Bool)

(assert (=> b!935767 (= e!525496 e!525499)))

(declare-fun res!629949 () Bool)

(assert (=> b!935767 (= res!629949 call!40705)))

(assert (=> b!935767 (=> (not res!629949) (not e!525499))))

(declare-fun b!935768 () Bool)

(assert (=> b!935768 (= e!525499 (= (apply!827 lt!421606 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!935769 () Bool)

(assert (=> b!935769 (= e!525496 (not call!40705))))

(declare-fun b!935770 () Bool)

(declare-fun Unit!31530 () Unit!31527)

(assert (=> b!935770 (= e!525503 Unit!31530)))

(declare-fun bm!40701 () Bool)

(declare-fun call!40708 () Bool)

(assert (=> bm!40701 (= call!40708 (contains!5067 lt!421606 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935771 () Bool)

(assert (=> b!935771 (= e!525498 call!40702)))

(declare-fun b!935772 () Bool)

(assert (=> b!935772 (= e!525501 (validKeyInArray!0 (select (arr!27095 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!935773 () Bool)

(declare-fun res!629951 () Bool)

(assert (=> b!935773 (=> (not res!629951) (not e!525493))))

(declare-fun e!525505 () Bool)

(assert (=> b!935773 (= res!629951 e!525505)))

(declare-fun res!629952 () Bool)

(assert (=> b!935773 (=> res!629952 e!525505)))

(declare-fun e!525500 () Bool)

(assert (=> b!935773 (= res!629952 (not e!525500))))

(declare-fun res!629955 () Bool)

(assert (=> b!935773 (=> (not res!629955) (not e!525500))))

(assert (=> b!935773 (= res!629955 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27555 _keys!1487)))))

(declare-fun b!935774 () Bool)

(declare-fun e!525502 () Bool)

(assert (=> b!935774 (= e!525497 e!525502)))

(declare-fun res!629953 () Bool)

(assert (=> b!935774 (= res!629953 call!40708)))

(assert (=> b!935774 (=> (not res!629953) (not e!525502))))

(declare-fun b!935775 () Bool)

(assert (=> b!935775 (= e!525500 (validKeyInArray!0 (select (arr!27095 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!935776 () Bool)

(assert (=> b!935776 (= e!525504 (+!2826 call!40704 (tuple2!13277 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!935777 () Bool)

(declare-fun e!525495 () ListLongMap!11975)

(assert (=> b!935777 (= e!525495 call!40706)))

(declare-fun bm!40702 () Bool)

(assert (=> bm!40702 (= call!40707 (getCurrentListMapNoExtraKeys!3344 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun b!935778 () Bool)

(assert (=> b!935778 (= e!525505 e!525494)))

(declare-fun res!629948 () Bool)

(assert (=> b!935778 (=> (not res!629948) (not e!525494))))

(assert (=> b!935778 (= res!629948 (contains!5067 lt!421606 (select (arr!27095 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!935778 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27555 _keys!1487)))))

(declare-fun bm!40703 () Bool)

(assert (=> bm!40703 (= call!40706 call!40704)))

(declare-fun b!935779 () Bool)

(assert (=> b!935779 (= e!525504 e!525495)))

(assert (=> b!935779 (= c!97485 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!935780 () Bool)

(assert (=> b!935780 (= e!525497 (not call!40708))))

(declare-fun bm!40704 () Bool)

(assert (=> bm!40704 (= call!40703 call!40707)))

(declare-fun bm!40705 () Bool)

(assert (=> bm!40705 (= call!40702 call!40703)))

(declare-fun b!935781 () Bool)

(declare-fun lt!421611 () Unit!31527)

(assert (=> b!935781 (= e!525503 lt!421611)))

(declare-fun lt!421610 () ListLongMap!11975)

(assert (=> b!935781 (= lt!421610 (getCurrentListMapNoExtraKeys!3344 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421609 () (_ BitVec 64))

(assert (=> b!935781 (= lt!421609 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421603 () (_ BitVec 64))

(assert (=> b!935781 (= lt!421603 (select (arr!27095 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!421608 () Unit!31527)

(assert (=> b!935781 (= lt!421608 (addStillContains!529 lt!421610 lt!421609 zeroValue!1173 lt!421603))))

(assert (=> b!935781 (contains!5067 (+!2826 lt!421610 (tuple2!13277 lt!421609 zeroValue!1173)) lt!421603)))

(declare-fun lt!421596 () Unit!31527)

(assert (=> b!935781 (= lt!421596 lt!421608)))

(declare-fun lt!421612 () ListLongMap!11975)

(assert (=> b!935781 (= lt!421612 (getCurrentListMapNoExtraKeys!3344 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421607 () (_ BitVec 64))

(assert (=> b!935781 (= lt!421607 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421598 () (_ BitVec 64))

(assert (=> b!935781 (= lt!421598 (select (arr!27095 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!421594 () Unit!31527)

(assert (=> b!935781 (= lt!421594 (addApplyDifferent!418 lt!421612 lt!421607 minValue!1173 lt!421598))))

(assert (=> b!935781 (= (apply!827 (+!2826 lt!421612 (tuple2!13277 lt!421607 minValue!1173)) lt!421598) (apply!827 lt!421612 lt!421598))))

(declare-fun lt!421599 () Unit!31527)

(assert (=> b!935781 (= lt!421599 lt!421594)))

(declare-fun lt!421600 () ListLongMap!11975)

(assert (=> b!935781 (= lt!421600 (getCurrentListMapNoExtraKeys!3344 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421604 () (_ BitVec 64))

(assert (=> b!935781 (= lt!421604 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421595 () (_ BitVec 64))

(assert (=> b!935781 (= lt!421595 (select (arr!27095 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!421592 () Unit!31527)

(assert (=> b!935781 (= lt!421592 (addApplyDifferent!418 lt!421600 lt!421604 zeroValue!1173 lt!421595))))

(assert (=> b!935781 (= (apply!827 (+!2826 lt!421600 (tuple2!13277 lt!421604 zeroValue!1173)) lt!421595) (apply!827 lt!421600 lt!421595))))

(declare-fun lt!421593 () Unit!31527)

(assert (=> b!935781 (= lt!421593 lt!421592)))

(declare-fun lt!421597 () ListLongMap!11975)

(assert (=> b!935781 (= lt!421597 (getCurrentListMapNoExtraKeys!3344 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421601 () (_ BitVec 64))

(assert (=> b!935781 (= lt!421601 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421613 () (_ BitVec 64))

(assert (=> b!935781 (= lt!421613 (select (arr!27095 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!935781 (= lt!421611 (addApplyDifferent!418 lt!421597 lt!421601 minValue!1173 lt!421613))))

(assert (=> b!935781 (= (apply!827 (+!2826 lt!421597 (tuple2!13277 lt!421601 minValue!1173)) lt!421613) (apply!827 lt!421597 lt!421613))))

(declare-fun b!935782 () Bool)

(assert (=> b!935782 (= e!525502 (= (apply!827 lt!421606 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!935783 () Bool)

(declare-fun c!97483 () Bool)

(assert (=> b!935783 (= c!97483 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!935783 (= e!525495 e!525498)))

(assert (= (and d!113479 c!97481) b!935776))

(assert (= (and d!113479 (not c!97481)) b!935779))

(assert (= (and b!935779 c!97485) b!935777))

(assert (= (and b!935779 (not c!97485)) b!935783))

(assert (= (and b!935783 c!97483) b!935765))

(assert (= (and b!935783 (not c!97483)) b!935771))

(assert (= (or b!935765 b!935771) bm!40705))

(assert (= (or b!935777 bm!40705) bm!40704))

(assert (= (or b!935777 b!935765) bm!40703))

(assert (= (or b!935776 bm!40704) bm!40702))

(assert (= (or b!935776 bm!40703) bm!40699))

(assert (= (and d!113479 res!629947) b!935772))

(assert (= (and d!113479 c!97482) b!935781))

(assert (= (and d!113479 (not c!97482)) b!935770))

(assert (= (and d!113479 res!629950) b!935773))

(assert (= (and b!935773 res!629955) b!935775))

(assert (= (and b!935773 (not res!629952)) b!935778))

(assert (= (and b!935778 res!629948) b!935763))

(assert (= (and b!935773 res!629951) b!935766))

(assert (= (and b!935766 c!97480) b!935767))

(assert (= (and b!935766 (not c!97480)) b!935769))

(assert (= (and b!935767 res!629949) b!935768))

(assert (= (or b!935767 b!935769) bm!40700))

(assert (= (and b!935766 res!629954) b!935764))

(assert (= (and b!935764 c!97484) b!935774))

(assert (= (and b!935764 (not c!97484)) b!935780))

(assert (= (and b!935774 res!629953) b!935782))

(assert (= (or b!935774 b!935780) bm!40701))

(declare-fun b_lambda!14029 () Bool)

(assert (=> (not b_lambda!14029) (not b!935763)))

(assert (=> b!935763 t!27247))

(declare-fun b_and!28897 () Bool)

(assert (= b_and!28895 (and (=> t!27247 result!11913) b_and!28897)))

(declare-fun m!870509 () Bool)

(assert (=> b!935778 m!870509))

(assert (=> b!935778 m!870509))

(declare-fun m!870511 () Bool)

(assert (=> b!935778 m!870511))

(declare-fun m!870513 () Bool)

(assert (=> b!935776 m!870513))

(declare-fun m!870515 () Bool)

(assert (=> bm!40701 m!870515))

(declare-fun m!870517 () Bool)

(assert (=> b!935768 m!870517))

(declare-fun m!870519 () Bool)

(assert (=> b!935782 m!870519))

(declare-fun m!870521 () Bool)

(assert (=> b!935763 m!870521))

(assert (=> b!935763 m!870287))

(declare-fun m!870523 () Bool)

(assert (=> b!935763 m!870523))

(assert (=> b!935763 m!870509))

(assert (=> b!935763 m!870521))

(assert (=> b!935763 m!870287))

(assert (=> b!935763 m!870509))

(declare-fun m!870525 () Bool)

(assert (=> b!935763 m!870525))

(assert (=> d!113479 m!870303))

(declare-fun m!870527 () Bool)

(assert (=> bm!40702 m!870527))

(declare-fun m!870529 () Bool)

(assert (=> bm!40700 m!870529))

(assert (=> b!935775 m!870509))

(assert (=> b!935775 m!870509))

(declare-fun m!870531 () Bool)

(assert (=> b!935775 m!870531))

(declare-fun m!870533 () Bool)

(assert (=> bm!40699 m!870533))

(declare-fun m!870535 () Bool)

(assert (=> b!935781 m!870535))

(declare-fun m!870537 () Bool)

(assert (=> b!935781 m!870537))

(declare-fun m!870539 () Bool)

(assert (=> b!935781 m!870539))

(declare-fun m!870541 () Bool)

(assert (=> b!935781 m!870541))

(declare-fun m!870543 () Bool)

(assert (=> b!935781 m!870543))

(declare-fun m!870545 () Bool)

(assert (=> b!935781 m!870545))

(declare-fun m!870547 () Bool)

(assert (=> b!935781 m!870547))

(declare-fun m!870549 () Bool)

(assert (=> b!935781 m!870549))

(assert (=> b!935781 m!870545))

(declare-fun m!870551 () Bool)

(assert (=> b!935781 m!870551))

(declare-fun m!870553 () Bool)

(assert (=> b!935781 m!870553))

(assert (=> b!935781 m!870535))

(assert (=> b!935781 m!870527))

(declare-fun m!870555 () Bool)

(assert (=> b!935781 m!870555))

(assert (=> b!935781 m!870509))

(declare-fun m!870557 () Bool)

(assert (=> b!935781 m!870557))

(declare-fun m!870559 () Bool)

(assert (=> b!935781 m!870559))

(declare-fun m!870561 () Bool)

(assert (=> b!935781 m!870561))

(declare-fun m!870563 () Bool)

(assert (=> b!935781 m!870563))

(assert (=> b!935781 m!870551))

(assert (=> b!935781 m!870559))

(assert (=> b!935772 m!870509))

(assert (=> b!935772 m!870509))

(assert (=> b!935772 m!870531))

(assert (=> b!935570 d!113479))

(declare-fun d!113481 () Bool)

(declare-fun e!525511 () Bool)

(assert (=> d!113481 e!525511))

(declare-fun res!629958 () Bool)

(assert (=> d!113481 (=> res!629958 e!525511)))

(declare-fun lt!421625 () Bool)

(assert (=> d!113481 (= res!629958 (not lt!421625))))

(declare-fun lt!421623 () Bool)

(assert (=> d!113481 (= lt!421625 lt!421623)))

(declare-fun lt!421622 () Unit!31527)

(declare-fun e!525510 () Unit!31527)

(assert (=> d!113481 (= lt!421622 e!525510)))

(declare-fun c!97488 () Bool)

(assert (=> d!113481 (= c!97488 lt!421623)))

(declare-fun containsKey!449 (List!19059 (_ BitVec 64)) Bool)

(assert (=> d!113481 (= lt!421623 (containsKey!449 (toList!6003 (+!2826 lt!421455 lt!421452)) k0!1099))))

(assert (=> d!113481 (= (contains!5067 (+!2826 lt!421455 lt!421452) k0!1099) lt!421625)))

(declare-fun b!935790 () Bool)

(declare-fun lt!421624 () Unit!31527)

(assert (=> b!935790 (= e!525510 lt!421624)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!343 (List!19059 (_ BitVec 64)) Unit!31527)

(assert (=> b!935790 (= lt!421624 (lemmaContainsKeyImpliesGetValueByKeyDefined!343 (toList!6003 (+!2826 lt!421455 lt!421452)) k0!1099))))

(declare-fun isDefined!351 (Option!484) Bool)

(assert (=> b!935790 (isDefined!351 (getValueByKey!478 (toList!6003 (+!2826 lt!421455 lt!421452)) k0!1099))))

(declare-fun b!935791 () Bool)

(declare-fun Unit!31531 () Unit!31527)

(assert (=> b!935791 (= e!525510 Unit!31531)))

(declare-fun b!935792 () Bool)

(assert (=> b!935792 (= e!525511 (isDefined!351 (getValueByKey!478 (toList!6003 (+!2826 lt!421455 lt!421452)) k0!1099)))))

(assert (= (and d!113481 c!97488) b!935790))

(assert (= (and d!113481 (not c!97488)) b!935791))

(assert (= (and d!113481 (not res!629958)) b!935792))

(declare-fun m!870565 () Bool)

(assert (=> d!113481 m!870565))

(declare-fun m!870567 () Bool)

(assert (=> b!935790 m!870567))

(declare-fun m!870569 () Bool)

(assert (=> b!935790 m!870569))

(assert (=> b!935790 m!870569))

(declare-fun m!870571 () Bool)

(assert (=> b!935790 m!870571))

(assert (=> b!935792 m!870569))

(assert (=> b!935792 m!870569))

(assert (=> b!935792 m!870571))

(assert (=> b!935570 d!113481))

(declare-fun d!113483 () Bool)

(declare-fun e!525514 () Bool)

(assert (=> d!113483 e!525514))

(declare-fun res!629961 () Bool)

(assert (=> d!113483 (=> (not res!629961) (not e!525514))))

(assert (=> d!113483 (= res!629961 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27555 _keys!1487)) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27554 _values!1231))))))

(declare-fun lt!421628 () Unit!31527)

(declare-fun choose!1550 (array!56313 array!56311 (_ BitVec 32) (_ BitVec 32) V!31847 V!31847 (_ BitVec 32) Int) Unit!31527)

(assert (=> d!113483 (= lt!421628 (choose!1550 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> d!113483 (validMask!0 mask!1881)))

(assert (=> d!113483 (= (lemmaListMapRecursiveValidKeyArray!206 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!421628)))

(declare-fun b!935795 () Bool)

(assert (=> b!935795 (= e!525514 (= (getCurrentListMap!3242 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2826 (getCurrentListMap!3242 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13277 (select (arr!27095 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14285 (select (arr!27094 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1623 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!113483 res!629961) b!935795))

(declare-fun b_lambda!14031 () Bool)

(assert (=> (not b_lambda!14031) (not b!935795)))

(assert (=> b!935795 t!27247))

(declare-fun b_and!28899 () Bool)

(assert (= b_and!28897 (and (=> t!27247 result!11913) b_and!28899)))

(declare-fun m!870573 () Bool)

(assert (=> d!113483 m!870573))

(assert (=> d!113483 m!870303))

(assert (=> b!935795 m!870287))

(assert (=> b!935795 m!870285))

(assert (=> b!935795 m!870315))

(assert (=> b!935795 m!870285))

(assert (=> b!935795 m!870287))

(assert (=> b!935795 m!870289))

(declare-fun m!870575 () Bool)

(assert (=> b!935795 m!870575))

(assert (=> b!935795 m!870291))

(assert (=> b!935795 m!870575))

(declare-fun m!870577 () Bool)

(assert (=> b!935795 m!870577))

(assert (=> b!935570 d!113483))

(declare-fun b!935806 () Bool)

(declare-fun e!525523 () Bool)

(declare-fun e!525525 () Bool)

(assert (=> b!935806 (= e!525523 e!525525)))

(declare-fun c!97491 () Bool)

(assert (=> b!935806 (= c!97491 (validKeyInArray!0 (select (arr!27095 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!935807 () Bool)

(declare-fun call!40711 () Bool)

(assert (=> b!935807 (= e!525525 call!40711)))

(declare-fun bm!40708 () Bool)

(assert (=> bm!40708 (= call!40711 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97491 (Cons!19056 (select (arr!27095 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19057) Nil!19057)))))

(declare-fun b!935808 () Bool)

(declare-fun e!525524 () Bool)

(assert (=> b!935808 (= e!525524 e!525523)))

(declare-fun res!629969 () Bool)

(assert (=> b!935808 (=> (not res!629969) (not e!525523))))

(declare-fun e!525526 () Bool)

(assert (=> b!935808 (= res!629969 (not e!525526))))

(declare-fun res!629968 () Bool)

(assert (=> b!935808 (=> (not res!629968) (not e!525526))))

(assert (=> b!935808 (= res!629968 (validKeyInArray!0 (select (arr!27095 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!935809 () Bool)

(assert (=> b!935809 (= e!525525 call!40711)))

(declare-fun d!113485 () Bool)

(declare-fun res!629970 () Bool)

(assert (=> d!113485 (=> res!629970 e!525524)))

(assert (=> d!113485 (= res!629970 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27555 _keys!1487)))))

(assert (=> d!113485 (= (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19057) e!525524)))

(declare-fun b!935810 () Bool)

(declare-fun contains!5071 (List!19060 (_ BitVec 64)) Bool)

(assert (=> b!935810 (= e!525526 (contains!5071 Nil!19057 (select (arr!27095 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (= (and d!113485 (not res!629970)) b!935808))

(assert (= (and b!935808 res!629968) b!935810))

(assert (= (and b!935808 res!629969) b!935806))

(assert (= (and b!935806 c!97491) b!935809))

(assert (= (and b!935806 (not c!97491)) b!935807))

(assert (= (or b!935809 b!935807) bm!40708))

(assert (=> b!935806 m!870315))

(assert (=> b!935806 m!870315))

(assert (=> b!935806 m!870463))

(assert (=> bm!40708 m!870315))

(declare-fun m!870579 () Bool)

(assert (=> bm!40708 m!870579))

(assert (=> b!935808 m!870315))

(assert (=> b!935808 m!870315))

(assert (=> b!935808 m!870463))

(assert (=> b!935810 m!870315))

(assert (=> b!935810 m!870315))

(declare-fun m!870581 () Bool)

(assert (=> b!935810 m!870581))

(assert (=> b!935570 d!113485))

(declare-fun d!113487 () Bool)

(declare-fun e!525529 () Bool)

(assert (=> d!113487 e!525529))

(declare-fun c!97494 () Bool)

(assert (=> d!113487 (= c!97494 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!421631 () Unit!31527)

(declare-fun choose!1551 (array!56313 array!56311 (_ BitVec 32) (_ BitVec 32) V!31847 V!31847 (_ BitVec 64) (_ BitVec 32) Int) Unit!31527)

(assert (=> d!113487 (= lt!421631 (choose!1551 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> d!113487 (validMask!0 mask!1881)))

(assert (=> d!113487 (= (lemmaListMapContainsThenArrayContainsFrom!280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) lt!421631)))

(declare-fun b!935815 () Bool)

(assert (=> b!935815 (= e!525529 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!935816 () Bool)

(assert (=> b!935816 (= e!525529 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!113487 c!97494) b!935815))

(assert (= (and d!113487 (not c!97494)) b!935816))

(declare-fun m!870583 () Bool)

(assert (=> d!113487 m!870583))

(assert (=> d!113487 m!870303))

(assert (=> b!935815 m!870311))

(assert (=> b!935570 d!113487))

(declare-fun d!113489 () Bool)

(declare-fun e!525530 () Bool)

(assert (=> d!113489 e!525530))

(declare-fun res!629971 () Bool)

(assert (=> d!113489 (=> (not res!629971) (not e!525530))))

(declare-fun lt!421633 () ListLongMap!11975)

(assert (=> d!113489 (= res!629971 (contains!5067 lt!421633 (_1!6649 lt!421452)))))

(declare-fun lt!421635 () List!19059)

(assert (=> d!113489 (= lt!421633 (ListLongMap!11976 lt!421635))))

(declare-fun lt!421634 () Unit!31527)

(declare-fun lt!421632 () Unit!31527)

(assert (=> d!113489 (= lt!421634 lt!421632)))

(assert (=> d!113489 (= (getValueByKey!478 lt!421635 (_1!6649 lt!421452)) (Some!483 (_2!6649 lt!421452)))))

(assert (=> d!113489 (= lt!421632 (lemmaContainsTupThenGetReturnValue!257 lt!421635 (_1!6649 lt!421452) (_2!6649 lt!421452)))))

(assert (=> d!113489 (= lt!421635 (insertStrictlySorted!314 (toList!6003 lt!421455) (_1!6649 lt!421452) (_2!6649 lt!421452)))))

(assert (=> d!113489 (= (+!2826 lt!421455 lt!421452) lt!421633)))

(declare-fun b!935817 () Bool)

(declare-fun res!629972 () Bool)

(assert (=> b!935817 (=> (not res!629972) (not e!525530))))

(assert (=> b!935817 (= res!629972 (= (getValueByKey!478 (toList!6003 lt!421633) (_1!6649 lt!421452)) (Some!483 (_2!6649 lt!421452))))))

(declare-fun b!935818 () Bool)

(assert (=> b!935818 (= e!525530 (contains!5070 (toList!6003 lt!421633) lt!421452))))

(assert (= (and d!113489 res!629971) b!935817))

(assert (= (and b!935817 res!629972) b!935818))

(declare-fun m!870585 () Bool)

(assert (=> d!113489 m!870585))

(declare-fun m!870587 () Bool)

(assert (=> d!113489 m!870587))

(declare-fun m!870589 () Bool)

(assert (=> d!113489 m!870589))

(declare-fun m!870591 () Bool)

(assert (=> d!113489 m!870591))

(declare-fun m!870593 () Bool)

(assert (=> b!935817 m!870593))

(declare-fun m!870595 () Bool)

(assert (=> b!935818 m!870595))

(assert (=> b!935570 d!113489))

(declare-fun d!113491 () Bool)

(declare-fun c!97497 () Bool)

(assert (=> d!113491 (= c!97497 ((_ is ValueCellFull!9599) (select (arr!27094 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!525533 () V!31847)

(assert (=> d!113491 (= (get!14285 (select (arr!27094 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1623 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!525533)))

(declare-fun b!935823 () Bool)

(declare-fun get!14287 (ValueCell!9599 V!31847) V!31847)

(assert (=> b!935823 (= e!525533 (get!14287 (select (arr!27094 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1623 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!935824 () Bool)

(declare-fun get!14288 (ValueCell!9599 V!31847) V!31847)

(assert (=> b!935824 (= e!525533 (get!14288 (select (arr!27094 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1623 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113491 c!97497) b!935823))

(assert (= (and d!113491 (not c!97497)) b!935824))

(assert (=> b!935823 m!870285))

(assert (=> b!935823 m!870287))

(declare-fun m!870597 () Bool)

(assert (=> b!935823 m!870597))

(assert (=> b!935824 m!870285))

(assert (=> b!935824 m!870287))

(declare-fun m!870599 () Bool)

(assert (=> b!935824 m!870599))

(assert (=> b!935570 d!113491))

(declare-fun d!113493 () Bool)

(assert (=> d!113493 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19057)))

(declare-fun lt!421638 () Unit!31527)

(declare-fun choose!39 (array!56313 (_ BitVec 32) (_ BitVec 32)) Unit!31527)

(assert (=> d!113493 (= lt!421638 (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> d!113493 (bvslt (size!27555 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113493 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) lt!421638)))

(declare-fun bs!26259 () Bool)

(assert (= bs!26259 d!113493))

(assert (=> bs!26259 m!870295))

(declare-fun m!870601 () Bool)

(assert (=> bs!26259 m!870601))

(assert (=> b!935570 d!113493))

(declare-fun d!113495 () Bool)

(assert (=> d!113495 (contains!5067 (+!2826 lt!421455 (tuple2!13277 lt!421451 lt!421453)) k0!1099)))

(declare-fun lt!421641 () Unit!31527)

(declare-fun choose!1552 (ListLongMap!11975 (_ BitVec 64) V!31847 (_ BitVec 64)) Unit!31527)

(assert (=> d!113495 (= lt!421641 (choose!1552 lt!421455 lt!421451 lt!421453 k0!1099))))

(assert (=> d!113495 (contains!5067 lt!421455 k0!1099)))

(assert (=> d!113495 (= (addStillContains!529 lt!421455 lt!421451 lt!421453 k0!1099) lt!421641)))

(declare-fun bs!26260 () Bool)

(assert (= bs!26260 d!113495))

(declare-fun m!870603 () Bool)

(assert (=> bs!26260 m!870603))

(assert (=> bs!26260 m!870603))

(declare-fun m!870605 () Bool)

(assert (=> bs!26260 m!870605))

(declare-fun m!870607 () Bool)

(assert (=> bs!26260 m!870607))

(assert (=> bs!26260 m!870267))

(assert (=> b!935570 d!113495))

(declare-fun d!113497 () Bool)

(declare-fun e!525535 () Bool)

(assert (=> d!113497 e!525535))

(declare-fun res!629973 () Bool)

(assert (=> d!113497 (=> res!629973 e!525535)))

(declare-fun lt!421645 () Bool)

(assert (=> d!113497 (= res!629973 (not lt!421645))))

(declare-fun lt!421643 () Bool)

(assert (=> d!113497 (= lt!421645 lt!421643)))

(declare-fun lt!421642 () Unit!31527)

(declare-fun e!525534 () Unit!31527)

(assert (=> d!113497 (= lt!421642 e!525534)))

(declare-fun c!97498 () Bool)

(assert (=> d!113497 (= c!97498 lt!421643)))

(assert (=> d!113497 (= lt!421643 (containsKey!449 (toList!6003 lt!421455) k0!1099))))

(assert (=> d!113497 (= (contains!5067 lt!421455 k0!1099) lt!421645)))

(declare-fun b!935826 () Bool)

(declare-fun lt!421644 () Unit!31527)

(assert (=> b!935826 (= e!525534 lt!421644)))

(assert (=> b!935826 (= lt!421644 (lemmaContainsKeyImpliesGetValueByKeyDefined!343 (toList!6003 lt!421455) k0!1099))))

(assert (=> b!935826 (isDefined!351 (getValueByKey!478 (toList!6003 lt!421455) k0!1099))))

(declare-fun b!935827 () Bool)

(declare-fun Unit!31532 () Unit!31527)

(assert (=> b!935827 (= e!525534 Unit!31532)))

(declare-fun b!935828 () Bool)

(assert (=> b!935828 (= e!525535 (isDefined!351 (getValueByKey!478 (toList!6003 lt!421455) k0!1099)))))

(assert (= (and d!113497 c!97498) b!935826))

(assert (= (and d!113497 (not c!97498)) b!935827))

(assert (= (and d!113497 (not res!629973)) b!935828))

(declare-fun m!870609 () Bool)

(assert (=> d!113497 m!870609))

(declare-fun m!870611 () Bool)

(assert (=> b!935826 m!870611))

(assert (=> b!935826 m!870427))

(assert (=> b!935826 m!870427))

(declare-fun m!870613 () Bool)

(assert (=> b!935826 m!870613))

(assert (=> b!935828 m!870427))

(assert (=> b!935828 m!870427))

(assert (=> b!935828 m!870613))

(assert (=> b!935565 d!113497))

(declare-fun bm!40709 () Bool)

(declare-fun c!97504 () Bool)

(declare-fun call!40713 () ListLongMap!11975)

(declare-fun call!40712 () ListLongMap!11975)

(declare-fun call!40714 () ListLongMap!11975)

(declare-fun call!40717 () ListLongMap!11975)

(declare-fun c!97500 () Bool)

(assert (=> bm!40709 (= call!40714 (+!2826 (ite c!97500 call!40717 (ite c!97504 call!40713 call!40712)) (ite (or c!97500 c!97504) (tuple2!13277 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13277 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun lt!421660 () ListLongMap!11975)

(declare-fun b!935829 () Bool)

(declare-fun e!525537 () Bool)

(assert (=> b!935829 (= e!525537 (= (apply!827 lt!421660 (select (arr!27095 _keys!1487) from!1844)) (get!14285 (select (arr!27094 _values!1231) from!1844) (dynLambda!1623 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935829 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27554 _values!1231)))))

(assert (=> b!935829 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27555 _keys!1487)))))

(declare-fun b!935830 () Bool)

(declare-fun e!525536 () Bool)

(declare-fun e!525540 () Bool)

(assert (=> b!935830 (= e!525536 e!525540)))

(declare-fun c!97503 () Bool)

(assert (=> b!935830 (= c!97503 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!935831 () Bool)

(declare-fun e!525541 () ListLongMap!11975)

(declare-fun call!40716 () ListLongMap!11975)

(assert (=> b!935831 (= e!525541 call!40716)))

(declare-fun b!935832 () Bool)

(declare-fun res!629981 () Bool)

(assert (=> b!935832 (=> (not res!629981) (not e!525536))))

(declare-fun e!525539 () Bool)

(assert (=> b!935832 (= res!629981 e!525539)))

(declare-fun c!97499 () Bool)

(assert (=> b!935832 (= c!97499 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40710 () Bool)

(declare-fun call!40715 () Bool)

(assert (=> bm!40710 (= call!40715 (contains!5067 lt!421660 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!113499 () Bool)

(assert (=> d!113499 e!525536))

(declare-fun res!629977 () Bool)

(assert (=> d!113499 (=> (not res!629977) (not e!525536))))

(assert (=> d!113499 (= res!629977 (or (bvsge from!1844 (size!27555 _keys!1487)) (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27555 _keys!1487)))))))

(declare-fun lt!421656 () ListLongMap!11975)

(assert (=> d!113499 (= lt!421660 lt!421656)))

(declare-fun lt!421659 () Unit!31527)

(declare-fun e!525546 () Unit!31527)

(assert (=> d!113499 (= lt!421659 e!525546)))

(declare-fun c!97501 () Bool)

(declare-fun e!525544 () Bool)

(assert (=> d!113499 (= c!97501 e!525544)))

(declare-fun res!629974 () Bool)

(assert (=> d!113499 (=> (not res!629974) (not e!525544))))

(assert (=> d!113499 (= res!629974 (bvslt from!1844 (size!27555 _keys!1487)))))

(declare-fun e!525547 () ListLongMap!11975)

(assert (=> d!113499 (= lt!421656 e!525547)))

(assert (=> d!113499 (= c!97500 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113499 (validMask!0 mask!1881)))

(assert (=> d!113499 (= (getCurrentListMap!3242 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!421660)))

(declare-fun b!935833 () Bool)

(declare-fun e!525542 () Bool)

(assert (=> b!935833 (= e!525539 e!525542)))

(declare-fun res!629976 () Bool)

(assert (=> b!935833 (= res!629976 call!40715)))

(assert (=> b!935833 (=> (not res!629976) (not e!525542))))

(declare-fun b!935834 () Bool)

(assert (=> b!935834 (= e!525542 (= (apply!827 lt!421660 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!935835 () Bool)

(assert (=> b!935835 (= e!525539 (not call!40715))))

(declare-fun b!935836 () Bool)

(declare-fun Unit!31533 () Unit!31527)

(assert (=> b!935836 (= e!525546 Unit!31533)))

(declare-fun bm!40711 () Bool)

(declare-fun call!40718 () Bool)

(assert (=> bm!40711 (= call!40718 (contains!5067 lt!421660 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935837 () Bool)

(assert (=> b!935837 (= e!525541 call!40712)))

(declare-fun b!935838 () Bool)

(assert (=> b!935838 (= e!525544 (validKeyInArray!0 (select (arr!27095 _keys!1487) from!1844)))))

(declare-fun b!935839 () Bool)

(declare-fun res!629978 () Bool)

(assert (=> b!935839 (=> (not res!629978) (not e!525536))))

(declare-fun e!525548 () Bool)

(assert (=> b!935839 (= res!629978 e!525548)))

(declare-fun res!629979 () Bool)

(assert (=> b!935839 (=> res!629979 e!525548)))

(declare-fun e!525543 () Bool)

(assert (=> b!935839 (= res!629979 (not e!525543))))

(declare-fun res!629982 () Bool)

(assert (=> b!935839 (=> (not res!629982) (not e!525543))))

(assert (=> b!935839 (= res!629982 (bvslt from!1844 (size!27555 _keys!1487)))))

(declare-fun b!935840 () Bool)

(declare-fun e!525545 () Bool)

(assert (=> b!935840 (= e!525540 e!525545)))

(declare-fun res!629980 () Bool)

(assert (=> b!935840 (= res!629980 call!40718)))

(assert (=> b!935840 (=> (not res!629980) (not e!525545))))

(declare-fun b!935841 () Bool)

(assert (=> b!935841 (= e!525543 (validKeyInArray!0 (select (arr!27095 _keys!1487) from!1844)))))

(declare-fun b!935842 () Bool)

(assert (=> b!935842 (= e!525547 (+!2826 call!40714 (tuple2!13277 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!935843 () Bool)

(declare-fun e!525538 () ListLongMap!11975)

(assert (=> b!935843 (= e!525538 call!40716)))

(declare-fun bm!40712 () Bool)

(assert (=> bm!40712 (= call!40717 (getCurrentListMapNoExtraKeys!3344 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935844 () Bool)

(assert (=> b!935844 (= e!525548 e!525537)))

(declare-fun res!629975 () Bool)

(assert (=> b!935844 (=> (not res!629975) (not e!525537))))

(assert (=> b!935844 (= res!629975 (contains!5067 lt!421660 (select (arr!27095 _keys!1487) from!1844)))))

(assert (=> b!935844 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27555 _keys!1487)))))

(declare-fun bm!40713 () Bool)

(assert (=> bm!40713 (= call!40716 call!40714)))

(declare-fun b!935845 () Bool)

(assert (=> b!935845 (= e!525547 e!525538)))

(assert (=> b!935845 (= c!97504 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!935846 () Bool)

(assert (=> b!935846 (= e!525540 (not call!40718))))

(declare-fun bm!40714 () Bool)

(assert (=> bm!40714 (= call!40713 call!40717)))

(declare-fun bm!40715 () Bool)

(assert (=> bm!40715 (= call!40712 call!40713)))

(declare-fun b!935847 () Bool)

(declare-fun lt!421665 () Unit!31527)

(assert (=> b!935847 (= e!525546 lt!421665)))

(declare-fun lt!421664 () ListLongMap!11975)

(assert (=> b!935847 (= lt!421664 (getCurrentListMapNoExtraKeys!3344 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421663 () (_ BitVec 64))

(assert (=> b!935847 (= lt!421663 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421657 () (_ BitVec 64))

(assert (=> b!935847 (= lt!421657 (select (arr!27095 _keys!1487) from!1844))))

(declare-fun lt!421662 () Unit!31527)

(assert (=> b!935847 (= lt!421662 (addStillContains!529 lt!421664 lt!421663 zeroValue!1173 lt!421657))))

(assert (=> b!935847 (contains!5067 (+!2826 lt!421664 (tuple2!13277 lt!421663 zeroValue!1173)) lt!421657)))

(declare-fun lt!421650 () Unit!31527)

(assert (=> b!935847 (= lt!421650 lt!421662)))

(declare-fun lt!421666 () ListLongMap!11975)

(assert (=> b!935847 (= lt!421666 (getCurrentListMapNoExtraKeys!3344 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421661 () (_ BitVec 64))

(assert (=> b!935847 (= lt!421661 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421652 () (_ BitVec 64))

(assert (=> b!935847 (= lt!421652 (select (arr!27095 _keys!1487) from!1844))))

(declare-fun lt!421648 () Unit!31527)

(assert (=> b!935847 (= lt!421648 (addApplyDifferent!418 lt!421666 lt!421661 minValue!1173 lt!421652))))

(assert (=> b!935847 (= (apply!827 (+!2826 lt!421666 (tuple2!13277 lt!421661 minValue!1173)) lt!421652) (apply!827 lt!421666 lt!421652))))

(declare-fun lt!421653 () Unit!31527)

(assert (=> b!935847 (= lt!421653 lt!421648)))

(declare-fun lt!421654 () ListLongMap!11975)

(assert (=> b!935847 (= lt!421654 (getCurrentListMapNoExtraKeys!3344 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421658 () (_ BitVec 64))

(assert (=> b!935847 (= lt!421658 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421649 () (_ BitVec 64))

(assert (=> b!935847 (= lt!421649 (select (arr!27095 _keys!1487) from!1844))))

(declare-fun lt!421646 () Unit!31527)

(assert (=> b!935847 (= lt!421646 (addApplyDifferent!418 lt!421654 lt!421658 zeroValue!1173 lt!421649))))

(assert (=> b!935847 (= (apply!827 (+!2826 lt!421654 (tuple2!13277 lt!421658 zeroValue!1173)) lt!421649) (apply!827 lt!421654 lt!421649))))

(declare-fun lt!421647 () Unit!31527)

(assert (=> b!935847 (= lt!421647 lt!421646)))

(declare-fun lt!421651 () ListLongMap!11975)

(assert (=> b!935847 (= lt!421651 (getCurrentListMapNoExtraKeys!3344 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421655 () (_ BitVec 64))

(assert (=> b!935847 (= lt!421655 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421667 () (_ BitVec 64))

(assert (=> b!935847 (= lt!421667 (select (arr!27095 _keys!1487) from!1844))))

(assert (=> b!935847 (= lt!421665 (addApplyDifferent!418 lt!421651 lt!421655 minValue!1173 lt!421667))))

(assert (=> b!935847 (= (apply!827 (+!2826 lt!421651 (tuple2!13277 lt!421655 minValue!1173)) lt!421667) (apply!827 lt!421651 lt!421667))))

(declare-fun b!935848 () Bool)

(assert (=> b!935848 (= e!525545 (= (apply!827 lt!421660 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!935849 () Bool)

(declare-fun c!97502 () Bool)

(assert (=> b!935849 (= c!97502 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!935849 (= e!525538 e!525541)))

(assert (= (and d!113499 c!97500) b!935842))

(assert (= (and d!113499 (not c!97500)) b!935845))

(assert (= (and b!935845 c!97504) b!935843))

(assert (= (and b!935845 (not c!97504)) b!935849))

(assert (= (and b!935849 c!97502) b!935831))

(assert (= (and b!935849 (not c!97502)) b!935837))

(assert (= (or b!935831 b!935837) bm!40715))

(assert (= (or b!935843 bm!40715) bm!40714))

(assert (= (or b!935843 b!935831) bm!40713))

(assert (= (or b!935842 bm!40714) bm!40712))

(assert (= (or b!935842 bm!40713) bm!40709))

(assert (= (and d!113499 res!629974) b!935838))

(assert (= (and d!113499 c!97501) b!935847))

(assert (= (and d!113499 (not c!97501)) b!935836))

(assert (= (and d!113499 res!629977) b!935839))

(assert (= (and b!935839 res!629982) b!935841))

(assert (= (and b!935839 (not res!629979)) b!935844))

(assert (= (and b!935844 res!629975) b!935829))

(assert (= (and b!935839 res!629978) b!935832))

(assert (= (and b!935832 c!97499) b!935833))

(assert (= (and b!935832 (not c!97499)) b!935835))

(assert (= (and b!935833 res!629976) b!935834))

(assert (= (or b!935833 b!935835) bm!40710))

(assert (= (and b!935832 res!629981) b!935830))

(assert (= (and b!935830 c!97503) b!935840))

(assert (= (and b!935830 (not c!97503)) b!935846))

(assert (= (and b!935840 res!629980) b!935848))

(assert (= (or b!935840 b!935846) bm!40711))

(declare-fun b_lambda!14033 () Bool)

(assert (=> (not b_lambda!14033) (not b!935829)))

(assert (=> b!935829 t!27247))

(declare-fun b_and!28901 () Bool)

(assert (= b_and!28899 (and (=> t!27247 result!11913) b_and!28901)))

(assert (=> b!935844 m!870443))

(assert (=> b!935844 m!870443))

(declare-fun m!870615 () Bool)

(assert (=> b!935844 m!870615))

(declare-fun m!870617 () Bool)

(assert (=> b!935842 m!870617))

(declare-fun m!870619 () Bool)

(assert (=> bm!40711 m!870619))

(declare-fun m!870621 () Bool)

(assert (=> b!935834 m!870621))

(declare-fun m!870623 () Bool)

(assert (=> b!935848 m!870623))

(declare-fun m!870625 () Bool)

(assert (=> b!935829 m!870625))

(assert (=> b!935829 m!870287))

(declare-fun m!870627 () Bool)

(assert (=> b!935829 m!870627))

(assert (=> b!935829 m!870443))

(assert (=> b!935829 m!870625))

(assert (=> b!935829 m!870287))

(assert (=> b!935829 m!870443))

(declare-fun m!870629 () Bool)

(assert (=> b!935829 m!870629))

(assert (=> d!113499 m!870303))

(declare-fun m!870631 () Bool)

(assert (=> bm!40712 m!870631))

(declare-fun m!870633 () Bool)

(assert (=> bm!40710 m!870633))

(assert (=> b!935841 m!870443))

(assert (=> b!935841 m!870443))

(declare-fun m!870635 () Bool)

(assert (=> b!935841 m!870635))

(declare-fun m!870637 () Bool)

(assert (=> bm!40709 m!870637))

(declare-fun m!870639 () Bool)

(assert (=> b!935847 m!870639))

(declare-fun m!870641 () Bool)

(assert (=> b!935847 m!870641))

(declare-fun m!870643 () Bool)

(assert (=> b!935847 m!870643))

(declare-fun m!870645 () Bool)

(assert (=> b!935847 m!870645))

(declare-fun m!870647 () Bool)

(assert (=> b!935847 m!870647))

(declare-fun m!870649 () Bool)

(assert (=> b!935847 m!870649))

(declare-fun m!870651 () Bool)

(assert (=> b!935847 m!870651))

(declare-fun m!870653 () Bool)

(assert (=> b!935847 m!870653))

(assert (=> b!935847 m!870649))

(declare-fun m!870655 () Bool)

(assert (=> b!935847 m!870655))

(declare-fun m!870657 () Bool)

(assert (=> b!935847 m!870657))

(assert (=> b!935847 m!870639))

(assert (=> b!935847 m!870631))

(declare-fun m!870659 () Bool)

(assert (=> b!935847 m!870659))

(assert (=> b!935847 m!870443))

(declare-fun m!870661 () Bool)

(assert (=> b!935847 m!870661))

(declare-fun m!870663 () Bool)

(assert (=> b!935847 m!870663))

(declare-fun m!870665 () Bool)

(assert (=> b!935847 m!870665))

(declare-fun m!870667 () Bool)

(assert (=> b!935847 m!870667))

(assert (=> b!935847 m!870655))

(assert (=> b!935847 m!870663))

(assert (=> b!935838 m!870443))

(assert (=> b!935838 m!870443))

(assert (=> b!935838 m!870635))

(assert (=> b!935565 d!113499))

(declare-fun b!935850 () Bool)

(declare-fun e!525549 () Bool)

(declare-fun e!525551 () Bool)

(assert (=> b!935850 (= e!525549 e!525551)))

(declare-fun c!97505 () Bool)

(assert (=> b!935850 (= c!97505 (validKeyInArray!0 (select (arr!27095 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!935851 () Bool)

(declare-fun call!40719 () Bool)

(assert (=> b!935851 (= e!525551 call!40719)))

(declare-fun bm!40716 () Bool)

(assert (=> bm!40716 (= call!40719 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97505 (Cons!19056 (select (arr!27095 _keys!1487) #b00000000000000000000000000000000) Nil!19057) Nil!19057)))))

(declare-fun b!935852 () Bool)

(declare-fun e!525550 () Bool)

(assert (=> b!935852 (= e!525550 e!525549)))

(declare-fun res!629984 () Bool)

(assert (=> b!935852 (=> (not res!629984) (not e!525549))))

(declare-fun e!525552 () Bool)

(assert (=> b!935852 (= res!629984 (not e!525552))))

(declare-fun res!629983 () Bool)

(assert (=> b!935852 (=> (not res!629983) (not e!525552))))

(assert (=> b!935852 (= res!629983 (validKeyInArray!0 (select (arr!27095 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!935853 () Bool)

(assert (=> b!935853 (= e!525551 call!40719)))

(declare-fun d!113501 () Bool)

(declare-fun res!629985 () Bool)

(assert (=> d!113501 (=> res!629985 e!525550)))

(assert (=> d!113501 (= res!629985 (bvsge #b00000000000000000000000000000000 (size!27555 _keys!1487)))))

(assert (=> d!113501 (= (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19057) e!525550)))

(declare-fun b!935854 () Bool)

(assert (=> b!935854 (= e!525552 (contains!5071 Nil!19057 (select (arr!27095 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!113501 (not res!629985)) b!935852))

(assert (= (and b!935852 res!629983) b!935854))

(assert (= (and b!935852 res!629984) b!935850))

(assert (= (and b!935850 c!97505) b!935853))

(assert (= (and b!935850 (not c!97505)) b!935851))

(assert (= (or b!935853 b!935851) bm!40716))

(assert (=> b!935850 m!870433))

(assert (=> b!935850 m!870433))

(assert (=> b!935850 m!870441))

(assert (=> bm!40716 m!870433))

(declare-fun m!870669 () Bool)

(assert (=> bm!40716 m!870669))

(assert (=> b!935852 m!870433))

(assert (=> b!935852 m!870433))

(assert (=> b!935852 m!870441))

(assert (=> b!935854 m!870433))

(assert (=> b!935854 m!870433))

(declare-fun m!870671 () Bool)

(assert (=> b!935854 m!870671))

(assert (=> b!935571 d!113501))

(declare-fun d!113503 () Bool)

(assert (=> d!113503 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!79666 d!113503))

(declare-fun d!113505 () Bool)

(assert (=> d!113505 (= (array_inv!21166 _values!1231) (bvsge (size!27554 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!79666 d!113505))

(declare-fun d!113507 () Bool)

(assert (=> d!113507 (= (array_inv!21167 _keys!1487) (bvsge (size!27555 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!79666 d!113507))

(declare-fun d!113509 () Bool)

(assert (=> d!113509 (= (validKeyInArray!0 k0!1099) (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935572 d!113509))

(declare-fun d!113511 () Bool)

(assert (=> d!113511 (= (validKeyInArray!0 lt!421451) (and (not (= lt!421451 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!421451 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935567 d!113511))

(declare-fun d!113513 () Bool)

(declare-fun res!629990 () Bool)

(declare-fun e!525557 () Bool)

(assert (=> d!113513 (=> res!629990 e!525557)))

(assert (=> d!113513 (= res!629990 ((_ is Nil!19057) Nil!19057))))

(assert (=> d!113513 (= (noDuplicate!1359 Nil!19057) e!525557)))

(declare-fun b!935859 () Bool)

(declare-fun e!525558 () Bool)

(assert (=> b!935859 (= e!525557 e!525558)))

(declare-fun res!629991 () Bool)

(assert (=> b!935859 (=> (not res!629991) (not e!525558))))

(assert (=> b!935859 (= res!629991 (not (contains!5071 (t!27249 Nil!19057) (h!20208 Nil!19057))))))

(declare-fun b!935860 () Bool)

(assert (=> b!935860 (= e!525558 (noDuplicate!1359 (t!27249 Nil!19057)))))

(assert (= (and d!113513 (not res!629990)) b!935859))

(assert (= (and b!935859 res!629991) b!935860))

(declare-fun m!870673 () Bool)

(assert (=> b!935859 m!870673))

(declare-fun m!870675 () Bool)

(assert (=> b!935860 m!870675))

(assert (=> b!935563 d!113513))

(declare-fun mapIsEmpty!32013 () Bool)

(declare-fun mapRes!32013 () Bool)

(assert (=> mapIsEmpty!32013 mapRes!32013))

(declare-fun condMapEmpty!32013 () Bool)

(declare-fun mapDefault!32013 () ValueCell!9599)

(assert (=> mapNonEmpty!32004 (= condMapEmpty!32013 (= mapRest!32004 ((as const (Array (_ BitVec 32) ValueCell!9599)) mapDefault!32013)))))

(declare-fun e!525564 () Bool)

(assert (=> mapNonEmpty!32004 (= tp!61406 (and e!525564 mapRes!32013))))

(declare-fun b!935868 () Bool)

(assert (=> b!935868 (= e!525564 tp_is_empty!20161)))

(declare-fun mapNonEmpty!32013 () Bool)

(declare-fun tp!61422 () Bool)

(declare-fun e!525563 () Bool)

(assert (=> mapNonEmpty!32013 (= mapRes!32013 (and tp!61422 e!525563))))

(declare-fun mapKey!32013 () (_ BitVec 32))

(declare-fun mapRest!32013 () (Array (_ BitVec 32) ValueCell!9599))

(declare-fun mapValue!32013 () ValueCell!9599)

(assert (=> mapNonEmpty!32013 (= mapRest!32004 (store mapRest!32013 mapKey!32013 mapValue!32013))))

(declare-fun b!935867 () Bool)

(assert (=> b!935867 (= e!525563 tp_is_empty!20161)))

(assert (= (and mapNonEmpty!32004 condMapEmpty!32013) mapIsEmpty!32013))

(assert (= (and mapNonEmpty!32004 (not condMapEmpty!32013)) mapNonEmpty!32013))

(assert (= (and mapNonEmpty!32013 ((_ is ValueCellFull!9599) mapValue!32013)) b!935867))

(assert (= (and mapNonEmpty!32004 ((_ is ValueCellFull!9599) mapDefault!32013)) b!935868))

(declare-fun m!870677 () Bool)

(assert (=> mapNonEmpty!32013 m!870677))

(declare-fun b_lambda!14035 () Bool)

(assert (= b_lambda!14033 (or (and start!79666 b_free!17653) b_lambda!14035)))

(declare-fun b_lambda!14037 () Bool)

(assert (= b_lambda!14027 (or (and start!79666 b_free!17653) b_lambda!14037)))

(declare-fun b_lambda!14039 () Bool)

(assert (= b_lambda!14031 (or (and start!79666 b_free!17653) b_lambda!14039)))

(declare-fun b_lambda!14041 () Bool)

(assert (= b_lambda!14029 (or (and start!79666 b_free!17653) b_lambda!14041)))

(check-sat (not b!935745) b_and!28901 (not d!113487) (not b!935847) (not bm!40702) (not b!935834) (not bm!40693) (not b_lambda!14041) (not b!935848) (not b!935761) (not mapNonEmpty!32013) (not b!935778) (not b!935824) (not b!935736) (not b!935763) (not b!935859) (not b!935775) (not bm!40711) (not bm!40716) (not b!935795) (not b!935748) (not d!113483) (not d!113489) (not bm!40701) (not b_lambda!14039) (not b_next!17653) (not b!935776) (not bm!40692) (not bm!40677) (not d!113469) (not bm!40699) (not b!935818) (not b!935749) (not b!935850) (not b!935842) (not b!935823) (not b!935826) (not d!113499) (not d!113481) (not b!935852) (not b!935768) (not bm!40712) (not bm!40695) (not b!935808) (not d!113495) (not b!935751) (not bm!40709) (not bm!40700) (not b!935817) (not b!935815) (not b!935828) (not bm!40710) tp_is_empty!20161 (not d!113493) (not b!935790) (not b!935684) (not b!935792) (not b!935781) (not b!935693) (not b!935838) (not b!935810) (not b_lambda!14035) (not b!935841) (not b!935741) (not b!935854) (not b!935844) (not b!935687) (not d!113479) (not b!935782) (not b!935806) (not b!935829) (not b!935772) (not d!113477) (not d!113475) (not b!935762) (not b_lambda!14025) (not b!935754) (not b_lambda!14037) (not b!935860) (not bm!40708) (not b!935755) (not bm!40694) (not d!113497))
(check-sat b_and!28901 (not b_next!17653))
