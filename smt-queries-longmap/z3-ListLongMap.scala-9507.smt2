; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112736 () Bool)

(assert start!112736)

(declare-fun b_free!31047 () Bool)

(declare-fun b_next!31047 () Bool)

(assert (=> start!112736 (= b_free!31047 (not b_next!31047))))

(declare-fun tp!108784 () Bool)

(declare-fun b_and!50027 () Bool)

(assert (=> start!112736 (= tp!108784 b_and!50027)))

(declare-fun b!1337337 () Bool)

(declare-fun res!887487 () Bool)

(declare-fun e!761497 () Bool)

(assert (=> b!1337337 (=> (not res!887487) (not e!761497))))

(declare-datatypes ((array!90770 0))(
  ( (array!90771 (arr!43849 (Array (_ BitVec 32) (_ BitVec 64))) (size!44399 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90770)

(declare-datatypes ((List!31074 0))(
  ( (Nil!31071) (Cons!31070 (h!32279 (_ BitVec 64)) (t!45390 List!31074)) )
))
(declare-fun arrayNoDuplicates!0 (array!90770 (_ BitVec 32) List!31074) Bool)

(assert (=> b!1337337 (= res!887487 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31071))))

(declare-fun b!1337338 () Bool)

(declare-fun res!887485 () Bool)

(assert (=> b!1337338 (=> (not res!887485) (not e!761497))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1337338 (= res!887485 (validKeyInArray!0 (select (arr!43849 _keys!1590) from!1980)))))

(declare-fun res!887486 () Bool)

(assert (=> start!112736 (=> (not res!887486) (not e!761497))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112736 (= res!887486 (validMask!0 mask!1998))))

(assert (=> start!112736 e!761497))

(declare-datatypes ((V!54379 0))(
  ( (V!54380 (val!18553 Int)) )
))
(declare-datatypes ((ValueCell!17580 0))(
  ( (ValueCellFull!17580 (v!21194 V!54379)) (EmptyCell!17580) )
))
(declare-datatypes ((array!90772 0))(
  ( (array!90773 (arr!43850 (Array (_ BitVec 32) ValueCell!17580)) (size!44400 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90772)

(declare-fun e!761499 () Bool)

(declare-fun array_inv!33069 (array!90772) Bool)

(assert (=> start!112736 (and (array_inv!33069 _values!1320) e!761499)))

(assert (=> start!112736 true))

(declare-fun array_inv!33070 (array!90770) Bool)

(assert (=> start!112736 (array_inv!33070 _keys!1590)))

(assert (=> start!112736 tp!108784))

(declare-fun tp_is_empty!36957 () Bool)

(assert (=> start!112736 tp_is_empty!36957))

(declare-fun mapIsEmpty!57116 () Bool)

(declare-fun mapRes!57116 () Bool)

(assert (=> mapIsEmpty!57116 mapRes!57116))

(declare-fun b!1337339 () Bool)

(declare-fun e!761498 () Bool)

(assert (=> b!1337339 (= e!761499 (and e!761498 mapRes!57116))))

(declare-fun condMapEmpty!57116 () Bool)

(declare-fun mapDefault!57116 () ValueCell!17580)

(assert (=> b!1337339 (= condMapEmpty!57116 (= (arr!43850 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17580)) mapDefault!57116)))))

(declare-fun b!1337340 () Bool)

(declare-fun res!887489 () Bool)

(assert (=> b!1337340 (=> (not res!887489) (not e!761497))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54379)

(declare-fun zeroValue!1262 () V!54379)

(declare-datatypes ((tuple2!23932 0))(
  ( (tuple2!23933 (_1!11977 (_ BitVec 64)) (_2!11977 V!54379)) )
))
(declare-datatypes ((List!31075 0))(
  ( (Nil!31072) (Cons!31071 (h!32280 tuple2!23932) (t!45391 List!31075)) )
))
(declare-datatypes ((ListLongMap!21589 0))(
  ( (ListLongMap!21590 (toList!10810 List!31075)) )
))
(declare-fun contains!8977 (ListLongMap!21589 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5781 (array!90770 array!90772 (_ BitVec 32) (_ BitVec 32) V!54379 V!54379 (_ BitVec 32) Int) ListLongMap!21589)

(assert (=> b!1337340 (= res!887489 (contains!8977 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1337341 () Bool)

(declare-fun res!887488 () Bool)

(assert (=> b!1337341 (=> (not res!887488) (not e!761497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90770 (_ BitVec 32)) Bool)

(assert (=> b!1337341 (= res!887488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1337342 () Bool)

(declare-fun res!887481 () Bool)

(assert (=> b!1337342 (=> (not res!887481) (not e!761497))))

(assert (=> b!1337342 (= res!887481 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!57116 () Bool)

(declare-fun tp!108785 () Bool)

(declare-fun e!761501 () Bool)

(assert (=> mapNonEmpty!57116 (= mapRes!57116 (and tp!108785 e!761501))))

(declare-fun mapKey!57116 () (_ BitVec 32))

(declare-fun mapValue!57116 () ValueCell!17580)

(declare-fun mapRest!57116 () (Array (_ BitVec 32) ValueCell!17580))

(assert (=> mapNonEmpty!57116 (= (arr!43850 _values!1320) (store mapRest!57116 mapKey!57116 mapValue!57116))))

(declare-fun b!1337343 () Bool)

(declare-fun res!887484 () Bool)

(assert (=> b!1337343 (=> (not res!887484) (not e!761497))))

(assert (=> b!1337343 (= res!887484 (and (= (size!44400 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44399 _keys!1590) (size!44400 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1337344 () Bool)

(declare-fun res!887482 () Bool)

(assert (=> b!1337344 (=> (not res!887482) (not e!761497))))

(assert (=> b!1337344 (= res!887482 (not (= (select (arr!43849 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1337345 () Bool)

(declare-fun +!4746 (ListLongMap!21589 tuple2!23932) ListLongMap!21589)

(declare-fun getCurrentListMapNoExtraKeys!6388 (array!90770 array!90772 (_ BitVec 32) (_ BitVec 32) V!54379 V!54379 (_ BitVec 32) Int) ListLongMap!21589)

(declare-fun get!22129 (ValueCell!17580 V!54379) V!54379)

(declare-fun dynLambda!3685 (Int (_ BitVec 64)) V!54379)

(assert (=> b!1337345 (= e!761497 (not (contains!8977 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1153)))))

(declare-fun b!1337346 () Bool)

(assert (=> b!1337346 (= e!761498 tp_is_empty!36957)))

(declare-fun b!1337347 () Bool)

(declare-fun res!887483 () Bool)

(assert (=> b!1337347 (=> (not res!887483) (not e!761497))))

(assert (=> b!1337347 (= res!887483 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44399 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1337348 () Bool)

(assert (=> b!1337348 (= e!761501 tp_is_empty!36957)))

(assert (= (and start!112736 res!887486) b!1337343))

(assert (= (and b!1337343 res!887484) b!1337341))

(assert (= (and b!1337341 res!887488) b!1337337))

(assert (= (and b!1337337 res!887487) b!1337347))

(assert (= (and b!1337347 res!887483) b!1337340))

(assert (= (and b!1337340 res!887489) b!1337344))

(assert (= (and b!1337344 res!887482) b!1337338))

(assert (= (and b!1337338 res!887485) b!1337342))

(assert (= (and b!1337342 res!887481) b!1337345))

(assert (= (and b!1337339 condMapEmpty!57116) mapIsEmpty!57116))

(assert (= (and b!1337339 (not condMapEmpty!57116)) mapNonEmpty!57116))

(get-info :version)

(assert (= (and mapNonEmpty!57116 ((_ is ValueCellFull!17580) mapValue!57116)) b!1337348))

(assert (= (and b!1337339 ((_ is ValueCellFull!17580) mapDefault!57116)) b!1337346))

(assert (= start!112736 b!1337339))

(declare-fun b_lambda!24211 () Bool)

(assert (=> (not b_lambda!24211) (not b!1337345)))

(declare-fun t!45389 () Bool)

(declare-fun tb!12119 () Bool)

(assert (=> (and start!112736 (= defaultEntry!1323 defaultEntry!1323) t!45389) tb!12119))

(declare-fun result!25313 () Bool)

(assert (=> tb!12119 (= result!25313 tp_is_empty!36957)))

(assert (=> b!1337345 t!45389))

(declare-fun b_and!50029 () Bool)

(assert (= b_and!50027 (and (=> t!45389 result!25313) b_and!50029)))

(declare-fun m!1225387 () Bool)

(assert (=> start!112736 m!1225387))

(declare-fun m!1225389 () Bool)

(assert (=> start!112736 m!1225389))

(declare-fun m!1225391 () Bool)

(assert (=> start!112736 m!1225391))

(declare-fun m!1225393 () Bool)

(assert (=> b!1337344 m!1225393))

(assert (=> b!1337338 m!1225393))

(assert (=> b!1337338 m!1225393))

(declare-fun m!1225395 () Bool)

(assert (=> b!1337338 m!1225395))

(declare-fun m!1225397 () Bool)

(assert (=> mapNonEmpty!57116 m!1225397))

(declare-fun m!1225399 () Bool)

(assert (=> b!1337337 m!1225399))

(declare-fun m!1225401 () Bool)

(assert (=> b!1337345 m!1225401))

(declare-fun m!1225403 () Bool)

(assert (=> b!1337345 m!1225403))

(declare-fun m!1225405 () Bool)

(assert (=> b!1337345 m!1225405))

(declare-fun m!1225407 () Bool)

(assert (=> b!1337345 m!1225407))

(assert (=> b!1337345 m!1225401))

(declare-fun m!1225409 () Bool)

(assert (=> b!1337345 m!1225409))

(assert (=> b!1337345 m!1225405))

(declare-fun m!1225411 () Bool)

(assert (=> b!1337345 m!1225411))

(assert (=> b!1337345 m!1225403))

(assert (=> b!1337345 m!1225407))

(assert (=> b!1337345 m!1225393))

(declare-fun m!1225413 () Bool)

(assert (=> b!1337340 m!1225413))

(assert (=> b!1337340 m!1225413))

(declare-fun m!1225415 () Bool)

(assert (=> b!1337340 m!1225415))

(declare-fun m!1225417 () Bool)

(assert (=> b!1337341 m!1225417))

(check-sat b_and!50029 (not mapNonEmpty!57116) (not b_lambda!24211) (not b!1337345) (not b!1337340) tp_is_empty!36957 (not start!112736) (not b!1337338) (not b!1337341) (not b_next!31047) (not b!1337337))
(check-sat b_and!50029 (not b_next!31047))
(get-model)

(declare-fun b_lambda!24215 () Bool)

(assert (= b_lambda!24211 (or (and start!112736 b_free!31047) b_lambda!24215)))

(check-sat b_and!50029 (not mapNonEmpty!57116) (not b!1337345) (not b!1337340) tp_is_empty!36957 (not start!112736) (not b!1337341) (not b_next!31047) (not b!1337337) (not b!1337338) (not b_lambda!24215))
(check-sat b_and!50029 (not b_next!31047))
(get-model)

(declare-fun d!143737 () Bool)

(declare-fun e!761522 () Bool)

(assert (=> d!143737 e!761522))

(declare-fun res!887519 () Bool)

(assert (=> d!143737 (=> res!887519 e!761522)))

(declare-fun lt!593099 () Bool)

(assert (=> d!143737 (= res!887519 (not lt!593099))))

(declare-fun lt!593100 () Bool)

(assert (=> d!143737 (= lt!593099 lt!593100)))

(declare-datatypes ((Unit!43947 0))(
  ( (Unit!43948) )
))
(declare-fun lt!593098 () Unit!43947)

(declare-fun e!761521 () Unit!43947)

(assert (=> d!143737 (= lt!593098 e!761521)))

(declare-fun c!126061 () Bool)

(assert (=> d!143737 (= c!126061 lt!593100)))

(declare-fun containsKey!739 (List!31075 (_ BitVec 64)) Bool)

(assert (=> d!143737 (= lt!593100 (containsKey!739 (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> d!143737 (= (contains!8977 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153) lt!593099)))

(declare-fun b!1337395 () Bool)

(declare-fun lt!593097 () Unit!43947)

(assert (=> b!1337395 (= e!761521 lt!593097)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!485 (List!31075 (_ BitVec 64)) Unit!43947)

(assert (=> b!1337395 (= lt!593097 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-datatypes ((Option!769 0))(
  ( (Some!768 (v!21196 V!54379)) (None!767) )
))
(declare-fun isDefined!524 (Option!769) Bool)

(declare-fun getValueByKey!717 (List!31075 (_ BitVec 64)) Option!769)

(assert (=> b!1337395 (isDefined!524 (getValueByKey!717 (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun b!1337396 () Bool)

(declare-fun Unit!43949 () Unit!43947)

(assert (=> b!1337396 (= e!761521 Unit!43949)))

(declare-fun b!1337397 () Bool)

(assert (=> b!1337397 (= e!761522 (isDefined!524 (getValueByKey!717 (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)))))

(assert (= (and d!143737 c!126061) b!1337395))

(assert (= (and d!143737 (not c!126061)) b!1337396))

(assert (= (and d!143737 (not res!887519)) b!1337397))

(declare-fun m!1225451 () Bool)

(assert (=> d!143737 m!1225451))

(declare-fun m!1225453 () Bool)

(assert (=> b!1337395 m!1225453))

(declare-fun m!1225455 () Bool)

(assert (=> b!1337395 m!1225455))

(assert (=> b!1337395 m!1225455))

(declare-fun m!1225457 () Bool)

(assert (=> b!1337395 m!1225457))

(assert (=> b!1337397 m!1225455))

(assert (=> b!1337397 m!1225455))

(assert (=> b!1337397 m!1225457))

(assert (=> b!1337340 d!143737))

(declare-fun b!1337440 () Bool)

(declare-fun e!761551 () ListLongMap!21589)

(declare-fun call!64920 () ListLongMap!21589)

(assert (=> b!1337440 (= e!761551 (+!4746 call!64920 (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun bm!64917 () Bool)

(declare-fun call!64924 () ListLongMap!21589)

(declare-fun call!64921 () ListLongMap!21589)

(assert (=> bm!64917 (= call!64924 call!64921)))

(declare-fun bm!64918 () Bool)

(declare-fun call!64925 () ListLongMap!21589)

(assert (=> bm!64918 (= call!64925 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun bm!64919 () Bool)

(declare-fun call!64926 () Bool)

(declare-fun lt!593146 () ListLongMap!21589)

(assert (=> bm!64919 (= call!64926 (contains!8977 lt!593146 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337441 () Bool)

(declare-fun e!761559 () Bool)

(declare-fun apply!1034 (ListLongMap!21589 (_ BitVec 64)) V!54379)

(assert (=> b!1337441 (= e!761559 (= (apply!1034 lt!593146 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun b!1337442 () Bool)

(declare-fun e!761558 () Bool)

(declare-fun call!64922 () Bool)

(assert (=> b!1337442 (= e!761558 (not call!64922))))

(declare-fun b!1337443 () Bool)

(declare-fun e!761557 () Bool)

(assert (=> b!1337443 (= e!761557 (= (apply!1034 lt!593146 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun d!143739 () Bool)

(declare-fun e!761560 () Bool)

(assert (=> d!143739 e!761560))

(declare-fun res!887543 () Bool)

(assert (=> d!143739 (=> (not res!887543) (not e!761560))))

(assert (=> d!143739 (= res!887543 (or (bvsge from!1980 (size!44399 _keys!1590)) (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44399 _keys!1590)))))))

(declare-fun lt!593151 () ListLongMap!21589)

(assert (=> d!143739 (= lt!593146 lt!593151)))

(declare-fun lt!593152 () Unit!43947)

(declare-fun e!761553 () Unit!43947)

(assert (=> d!143739 (= lt!593152 e!761553)))

(declare-fun c!126074 () Bool)

(declare-fun e!761552 () Bool)

(assert (=> d!143739 (= c!126074 e!761552)))

(declare-fun res!887542 () Bool)

(assert (=> d!143739 (=> (not res!887542) (not e!761552))))

(assert (=> d!143739 (= res!887542 (bvslt from!1980 (size!44399 _keys!1590)))))

(assert (=> d!143739 (= lt!593151 e!761551)))

(declare-fun c!126076 () Bool)

(assert (=> d!143739 (= c!126076 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143739 (validMask!0 mask!1998)))

(assert (=> d!143739 (= (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!593146)))

(declare-fun b!1337444 () Bool)

(declare-fun c!126075 () Bool)

(assert (=> b!1337444 (= c!126075 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!761549 () ListLongMap!21589)

(declare-fun e!761561 () ListLongMap!21589)

(assert (=> b!1337444 (= e!761549 e!761561)))

(declare-fun b!1337445 () Bool)

(declare-fun call!64923 () ListLongMap!21589)

(assert (=> b!1337445 (= e!761561 call!64923)))

(declare-fun bm!64920 () Bool)

(assert (=> bm!64920 (= call!64922 (contains!8977 lt!593146 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337446 () Bool)

(declare-fun e!761556 () Bool)

(assert (=> b!1337446 (= e!761556 (not call!64926))))

(declare-fun b!1337447 () Bool)

(assert (=> b!1337447 (= e!761552 (validKeyInArray!0 (select (arr!43849 _keys!1590) from!1980)))))

(declare-fun b!1337448 () Bool)

(assert (=> b!1337448 (= e!761560 e!761556)))

(declare-fun c!126078 () Bool)

(assert (=> b!1337448 (= c!126078 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1337449 () Bool)

(declare-fun lt!593145 () Unit!43947)

(assert (=> b!1337449 (= e!761553 lt!593145)))

(declare-fun lt!593156 () ListLongMap!21589)

(assert (=> b!1337449 (= lt!593156 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593149 () (_ BitVec 64))

(assert (=> b!1337449 (= lt!593149 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593147 () (_ BitVec 64))

(assert (=> b!1337449 (= lt!593147 (select (arr!43849 _keys!1590) from!1980))))

(declare-fun lt!593165 () Unit!43947)

(declare-fun addStillContains!1190 (ListLongMap!21589 (_ BitVec 64) V!54379 (_ BitVec 64)) Unit!43947)

(assert (=> b!1337449 (= lt!593165 (addStillContains!1190 lt!593156 lt!593149 zeroValue!1262 lt!593147))))

(assert (=> b!1337449 (contains!8977 (+!4746 lt!593156 (tuple2!23933 lt!593149 zeroValue!1262)) lt!593147)))

(declare-fun lt!593163 () Unit!43947)

(assert (=> b!1337449 (= lt!593163 lt!593165)))

(declare-fun lt!593154 () ListLongMap!21589)

(assert (=> b!1337449 (= lt!593154 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593159 () (_ BitVec 64))

(assert (=> b!1337449 (= lt!593159 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593161 () (_ BitVec 64))

(assert (=> b!1337449 (= lt!593161 (select (arr!43849 _keys!1590) from!1980))))

(declare-fun lt!593158 () Unit!43947)

(declare-fun addApplyDifferent!576 (ListLongMap!21589 (_ BitVec 64) V!54379 (_ BitVec 64)) Unit!43947)

(assert (=> b!1337449 (= lt!593158 (addApplyDifferent!576 lt!593154 lt!593159 minValue!1262 lt!593161))))

(assert (=> b!1337449 (= (apply!1034 (+!4746 lt!593154 (tuple2!23933 lt!593159 minValue!1262)) lt!593161) (apply!1034 lt!593154 lt!593161))))

(declare-fun lt!593162 () Unit!43947)

(assert (=> b!1337449 (= lt!593162 lt!593158)))

(declare-fun lt!593155 () ListLongMap!21589)

(assert (=> b!1337449 (= lt!593155 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593153 () (_ BitVec 64))

(assert (=> b!1337449 (= lt!593153 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593160 () (_ BitVec 64))

(assert (=> b!1337449 (= lt!593160 (select (arr!43849 _keys!1590) from!1980))))

(declare-fun lt!593164 () Unit!43947)

(assert (=> b!1337449 (= lt!593164 (addApplyDifferent!576 lt!593155 lt!593153 zeroValue!1262 lt!593160))))

(assert (=> b!1337449 (= (apply!1034 (+!4746 lt!593155 (tuple2!23933 lt!593153 zeroValue!1262)) lt!593160) (apply!1034 lt!593155 lt!593160))))

(declare-fun lt!593157 () Unit!43947)

(assert (=> b!1337449 (= lt!593157 lt!593164)))

(declare-fun lt!593150 () ListLongMap!21589)

(assert (=> b!1337449 (= lt!593150 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593148 () (_ BitVec 64))

(assert (=> b!1337449 (= lt!593148 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593166 () (_ BitVec 64))

(assert (=> b!1337449 (= lt!593166 (select (arr!43849 _keys!1590) from!1980))))

(assert (=> b!1337449 (= lt!593145 (addApplyDifferent!576 lt!593150 lt!593148 minValue!1262 lt!593166))))

(assert (=> b!1337449 (= (apply!1034 (+!4746 lt!593150 (tuple2!23933 lt!593148 minValue!1262)) lt!593166) (apply!1034 lt!593150 lt!593166))))

(declare-fun b!1337450 () Bool)

(declare-fun Unit!43950 () Unit!43947)

(assert (=> b!1337450 (= e!761553 Unit!43950)))

(declare-fun b!1337451 () Bool)

(declare-fun e!761550 () Bool)

(assert (=> b!1337451 (= e!761550 (= (apply!1034 lt!593146 (select (arr!43849 _keys!1590) from!1980)) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1337451 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44400 _values!1320)))))

(assert (=> b!1337451 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44399 _keys!1590)))))

(declare-fun b!1337452 () Bool)

(assert (=> b!1337452 (= e!761556 e!761559)))

(declare-fun res!887545 () Bool)

(assert (=> b!1337452 (= res!887545 call!64926)))

(assert (=> b!1337452 (=> (not res!887545) (not e!761559))))

(declare-fun b!1337453 () Bool)

(assert (=> b!1337453 (= e!761558 e!761557)))

(declare-fun res!887541 () Bool)

(assert (=> b!1337453 (= res!887541 call!64922)))

(assert (=> b!1337453 (=> (not res!887541) (not e!761557))))

(declare-fun b!1337454 () Bool)

(declare-fun e!761554 () Bool)

(assert (=> b!1337454 (= e!761554 (validKeyInArray!0 (select (arr!43849 _keys!1590) from!1980)))))

(declare-fun b!1337455 () Bool)

(assert (=> b!1337455 (= e!761551 e!761549)))

(declare-fun c!126077 () Bool)

(assert (=> b!1337455 (= c!126077 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64921 () Bool)

(assert (=> bm!64921 (= call!64923 call!64920)))

(declare-fun b!1337456 () Bool)

(declare-fun e!761555 () Bool)

(assert (=> b!1337456 (= e!761555 e!761550)))

(declare-fun res!887538 () Bool)

(assert (=> b!1337456 (=> (not res!887538) (not e!761550))))

(assert (=> b!1337456 (= res!887538 (contains!8977 lt!593146 (select (arr!43849 _keys!1590) from!1980)))))

(assert (=> b!1337456 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44399 _keys!1590)))))

(declare-fun b!1337457 () Bool)

(assert (=> b!1337457 (= e!761549 call!64923)))

(declare-fun b!1337458 () Bool)

(declare-fun res!887544 () Bool)

(assert (=> b!1337458 (=> (not res!887544) (not e!761560))))

(assert (=> b!1337458 (= res!887544 e!761558)))

(declare-fun c!126079 () Bool)

(assert (=> b!1337458 (= c!126079 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1337459 () Bool)

(declare-fun res!887539 () Bool)

(assert (=> b!1337459 (=> (not res!887539) (not e!761560))))

(assert (=> b!1337459 (= res!887539 e!761555)))

(declare-fun res!887540 () Bool)

(assert (=> b!1337459 (=> res!887540 e!761555)))

(assert (=> b!1337459 (= res!887540 (not e!761554))))

(declare-fun res!887546 () Bool)

(assert (=> b!1337459 (=> (not res!887546) (not e!761554))))

(assert (=> b!1337459 (= res!887546 (bvslt from!1980 (size!44399 _keys!1590)))))

(declare-fun bm!64922 () Bool)

(assert (=> bm!64922 (= call!64921 call!64925)))

(declare-fun bm!64923 () Bool)

(assert (=> bm!64923 (= call!64920 (+!4746 (ite c!126076 call!64925 (ite c!126077 call!64921 call!64924)) (ite (or c!126076 c!126077) (tuple2!23933 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1337460 () Bool)

(assert (=> b!1337460 (= e!761561 call!64924)))

(assert (= (and d!143739 c!126076) b!1337440))

(assert (= (and d!143739 (not c!126076)) b!1337455))

(assert (= (and b!1337455 c!126077) b!1337457))

(assert (= (and b!1337455 (not c!126077)) b!1337444))

(assert (= (and b!1337444 c!126075) b!1337445))

(assert (= (and b!1337444 (not c!126075)) b!1337460))

(assert (= (or b!1337445 b!1337460) bm!64917))

(assert (= (or b!1337457 bm!64917) bm!64922))

(assert (= (or b!1337457 b!1337445) bm!64921))

(assert (= (or b!1337440 bm!64922) bm!64918))

(assert (= (or b!1337440 bm!64921) bm!64923))

(assert (= (and d!143739 res!887542) b!1337447))

(assert (= (and d!143739 c!126074) b!1337449))

(assert (= (and d!143739 (not c!126074)) b!1337450))

(assert (= (and d!143739 res!887543) b!1337459))

(assert (= (and b!1337459 res!887546) b!1337454))

(assert (= (and b!1337459 (not res!887540)) b!1337456))

(assert (= (and b!1337456 res!887538) b!1337451))

(assert (= (and b!1337459 res!887539) b!1337458))

(assert (= (and b!1337458 c!126079) b!1337453))

(assert (= (and b!1337458 (not c!126079)) b!1337442))

(assert (= (and b!1337453 res!887541) b!1337443))

(assert (= (or b!1337453 b!1337442) bm!64920))

(assert (= (and b!1337458 res!887544) b!1337448))

(assert (= (and b!1337448 c!126078) b!1337452))

(assert (= (and b!1337448 (not c!126078)) b!1337446))

(assert (= (and b!1337452 res!887545) b!1337441))

(assert (= (or b!1337452 b!1337446) bm!64919))

(declare-fun b_lambda!24217 () Bool)

(assert (=> (not b_lambda!24217) (not b!1337451)))

(assert (=> b!1337451 t!45389))

(declare-fun b_and!50035 () Bool)

(assert (= b_and!50029 (and (=> t!45389 result!25313) b_and!50035)))

(declare-fun m!1225459 () Bool)

(assert (=> b!1337440 m!1225459))

(declare-fun m!1225461 () Bool)

(assert (=> b!1337441 m!1225461))

(assert (=> b!1337451 m!1225393))

(declare-fun m!1225463 () Bool)

(assert (=> b!1337451 m!1225463))

(assert (=> b!1337451 m!1225407))

(assert (=> b!1337451 m!1225401))

(assert (=> b!1337451 m!1225407))

(assert (=> b!1337451 m!1225401))

(assert (=> b!1337451 m!1225409))

(assert (=> b!1337451 m!1225393))

(assert (=> b!1337456 m!1225393))

(assert (=> b!1337456 m!1225393))

(declare-fun m!1225465 () Bool)

(assert (=> b!1337456 m!1225465))

(declare-fun m!1225467 () Bool)

(assert (=> bm!64923 m!1225467))

(declare-fun m!1225469 () Bool)

(assert (=> bm!64918 m!1225469))

(assert (=> b!1337454 m!1225393))

(assert (=> b!1337454 m!1225393))

(assert (=> b!1337454 m!1225395))

(assert (=> b!1337447 m!1225393))

(assert (=> b!1337447 m!1225393))

(assert (=> b!1337447 m!1225395))

(declare-fun m!1225471 () Bool)

(assert (=> b!1337443 m!1225471))

(declare-fun m!1225473 () Bool)

(assert (=> bm!64919 m!1225473))

(declare-fun m!1225475 () Bool)

(assert (=> b!1337449 m!1225475))

(declare-fun m!1225477 () Bool)

(assert (=> b!1337449 m!1225477))

(declare-fun m!1225479 () Bool)

(assert (=> b!1337449 m!1225479))

(declare-fun m!1225481 () Bool)

(assert (=> b!1337449 m!1225481))

(assert (=> b!1337449 m!1225477))

(declare-fun m!1225483 () Bool)

(assert (=> b!1337449 m!1225483))

(declare-fun m!1225485 () Bool)

(assert (=> b!1337449 m!1225485))

(declare-fun m!1225487 () Bool)

(assert (=> b!1337449 m!1225487))

(declare-fun m!1225489 () Bool)

(assert (=> b!1337449 m!1225489))

(declare-fun m!1225491 () Bool)

(assert (=> b!1337449 m!1225491))

(declare-fun m!1225493 () Bool)

(assert (=> b!1337449 m!1225493))

(declare-fun m!1225495 () Bool)

(assert (=> b!1337449 m!1225495))

(declare-fun m!1225497 () Bool)

(assert (=> b!1337449 m!1225497))

(declare-fun m!1225499 () Bool)

(assert (=> b!1337449 m!1225499))

(declare-fun m!1225501 () Bool)

(assert (=> b!1337449 m!1225501))

(assert (=> b!1337449 m!1225493))

(declare-fun m!1225503 () Bool)

(assert (=> b!1337449 m!1225503))

(assert (=> b!1337449 m!1225393))

(assert (=> b!1337449 m!1225497))

(assert (=> b!1337449 m!1225469))

(assert (=> b!1337449 m!1225487))

(assert (=> d!143739 m!1225387))

(declare-fun m!1225505 () Bool)

(assert (=> bm!64920 m!1225505))

(assert (=> b!1337340 d!143739))

(declare-fun b!1337471 () Bool)

(declare-fun e!761570 () Bool)

(declare-fun e!761572 () Bool)

(assert (=> b!1337471 (= e!761570 e!761572)))

(declare-fun c!126082 () Bool)

(assert (=> b!1337471 (= c!126082 (validKeyInArray!0 (select (arr!43849 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1337472 () Bool)

(declare-fun call!64929 () Bool)

(assert (=> b!1337472 (= e!761572 call!64929)))

(declare-fun d!143741 () Bool)

(declare-fun res!887553 () Bool)

(declare-fun e!761571 () Bool)

(assert (=> d!143741 (=> res!887553 e!761571)))

(assert (=> d!143741 (= res!887553 (bvsge #b00000000000000000000000000000000 (size!44399 _keys!1590)))))

(assert (=> d!143741 (= (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31071) e!761571)))

(declare-fun b!1337473 () Bool)

(assert (=> b!1337473 (= e!761571 e!761570)))

(declare-fun res!887554 () Bool)

(assert (=> b!1337473 (=> (not res!887554) (not e!761570))))

(declare-fun e!761573 () Bool)

(assert (=> b!1337473 (= res!887554 (not e!761573))))

(declare-fun res!887555 () Bool)

(assert (=> b!1337473 (=> (not res!887555) (not e!761573))))

(assert (=> b!1337473 (= res!887555 (validKeyInArray!0 (select (arr!43849 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun bm!64926 () Bool)

(assert (=> bm!64926 (= call!64929 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126082 (Cons!31070 (select (arr!43849 _keys!1590) #b00000000000000000000000000000000) Nil!31071) Nil!31071)))))

(declare-fun b!1337474 () Bool)

(declare-fun contains!8979 (List!31074 (_ BitVec 64)) Bool)

(assert (=> b!1337474 (= e!761573 (contains!8979 Nil!31071 (select (arr!43849 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1337475 () Bool)

(assert (=> b!1337475 (= e!761572 call!64929)))

(assert (= (and d!143741 (not res!887553)) b!1337473))

(assert (= (and b!1337473 res!887555) b!1337474))

(assert (= (and b!1337473 res!887554) b!1337471))

(assert (= (and b!1337471 c!126082) b!1337472))

(assert (= (and b!1337471 (not c!126082)) b!1337475))

(assert (= (or b!1337472 b!1337475) bm!64926))

(declare-fun m!1225507 () Bool)

(assert (=> b!1337471 m!1225507))

(assert (=> b!1337471 m!1225507))

(declare-fun m!1225509 () Bool)

(assert (=> b!1337471 m!1225509))

(assert (=> b!1337473 m!1225507))

(assert (=> b!1337473 m!1225507))

(assert (=> b!1337473 m!1225509))

(assert (=> bm!64926 m!1225507))

(declare-fun m!1225511 () Bool)

(assert (=> bm!64926 m!1225511))

(assert (=> b!1337474 m!1225507))

(assert (=> b!1337474 m!1225507))

(declare-fun m!1225513 () Bool)

(assert (=> b!1337474 m!1225513))

(assert (=> b!1337337 d!143741))

(declare-fun d!143743 () Bool)

(declare-fun res!887561 () Bool)

(declare-fun e!761582 () Bool)

(assert (=> d!143743 (=> res!887561 e!761582)))

(assert (=> d!143743 (= res!887561 (bvsge #b00000000000000000000000000000000 (size!44399 _keys!1590)))))

(assert (=> d!143743 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!761582)))

(declare-fun b!1337484 () Bool)

(declare-fun e!761581 () Bool)

(declare-fun call!64932 () Bool)

(assert (=> b!1337484 (= e!761581 call!64932)))

(declare-fun b!1337485 () Bool)

(assert (=> b!1337485 (= e!761582 e!761581)))

(declare-fun c!126085 () Bool)

(assert (=> b!1337485 (= c!126085 (validKeyInArray!0 (select (arr!43849 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun bm!64929 () Bool)

(assert (=> bm!64929 (= call!64932 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1337486 () Bool)

(declare-fun e!761580 () Bool)

(assert (=> b!1337486 (= e!761581 e!761580)))

(declare-fun lt!593175 () (_ BitVec 64))

(assert (=> b!1337486 (= lt!593175 (select (arr!43849 _keys!1590) #b00000000000000000000000000000000))))

(declare-fun lt!593173 () Unit!43947)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90770 (_ BitVec 64) (_ BitVec 32)) Unit!43947)

(assert (=> b!1337486 (= lt!593173 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!593175 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90770 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1337486 (arrayContainsKey!0 _keys!1590 lt!593175 #b00000000000000000000000000000000)))

(declare-fun lt!593174 () Unit!43947)

(assert (=> b!1337486 (= lt!593174 lt!593173)))

(declare-fun res!887560 () Bool)

(declare-datatypes ((SeekEntryResult!10049 0))(
  ( (MissingZero!10049 (index!42567 (_ BitVec 32))) (Found!10049 (index!42568 (_ BitVec 32))) (Intermediate!10049 (undefined!10861 Bool) (index!42569 (_ BitVec 32)) (x!119482 (_ BitVec 32))) (Undefined!10049) (MissingVacant!10049 (index!42570 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90770 (_ BitVec 32)) SeekEntryResult!10049)

(assert (=> b!1337486 (= res!887560 (= (seekEntryOrOpen!0 (select (arr!43849 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10049 #b00000000000000000000000000000000)))))

(assert (=> b!1337486 (=> (not res!887560) (not e!761580))))

(declare-fun b!1337487 () Bool)

(assert (=> b!1337487 (= e!761580 call!64932)))

(assert (= (and d!143743 (not res!887561)) b!1337485))

(assert (= (and b!1337485 c!126085) b!1337486))

(assert (= (and b!1337485 (not c!126085)) b!1337484))

(assert (= (and b!1337486 res!887560) b!1337487))

(assert (= (or b!1337487 b!1337484) bm!64929))

(assert (=> b!1337485 m!1225507))

(assert (=> b!1337485 m!1225507))

(assert (=> b!1337485 m!1225509))

(declare-fun m!1225515 () Bool)

(assert (=> bm!64929 m!1225515))

(assert (=> b!1337486 m!1225507))

(declare-fun m!1225517 () Bool)

(assert (=> b!1337486 m!1225517))

(declare-fun m!1225519 () Bool)

(assert (=> b!1337486 m!1225519))

(assert (=> b!1337486 m!1225507))

(declare-fun m!1225521 () Bool)

(assert (=> b!1337486 m!1225521))

(assert (=> b!1337341 d!143743))

(declare-fun d!143745 () Bool)

(declare-fun e!761584 () Bool)

(assert (=> d!143745 e!761584))

(declare-fun res!887562 () Bool)

(assert (=> d!143745 (=> res!887562 e!761584)))

(declare-fun lt!593178 () Bool)

(assert (=> d!143745 (= res!887562 (not lt!593178))))

(declare-fun lt!593179 () Bool)

(assert (=> d!143745 (= lt!593178 lt!593179)))

(declare-fun lt!593177 () Unit!43947)

(declare-fun e!761583 () Unit!43947)

(assert (=> d!143745 (= lt!593177 e!761583)))

(declare-fun c!126086 () Bool)

(assert (=> d!143745 (= c!126086 lt!593179)))

(assert (=> d!143745 (= lt!593179 (containsKey!739 (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153))))

(assert (=> d!143745 (= (contains!8977 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1153) lt!593178)))

(declare-fun b!1337488 () Bool)

(declare-fun lt!593176 () Unit!43947)

(assert (=> b!1337488 (= e!761583 lt!593176)))

(assert (=> b!1337488 (= lt!593176 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153))))

(assert (=> b!1337488 (isDefined!524 (getValueByKey!717 (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153))))

(declare-fun b!1337489 () Bool)

(declare-fun Unit!43951 () Unit!43947)

(assert (=> b!1337489 (= e!761583 Unit!43951)))

(declare-fun b!1337490 () Bool)

(assert (=> b!1337490 (= e!761584 (isDefined!524 (getValueByKey!717 (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153)))))

(assert (= (and d!143745 c!126086) b!1337488))

(assert (= (and d!143745 (not c!126086)) b!1337489))

(assert (= (and d!143745 (not res!887562)) b!1337490))

(declare-fun m!1225523 () Bool)

(assert (=> d!143745 m!1225523))

(declare-fun m!1225525 () Bool)

(assert (=> b!1337488 m!1225525))

(declare-fun m!1225527 () Bool)

(assert (=> b!1337488 m!1225527))

(assert (=> b!1337488 m!1225527))

(declare-fun m!1225529 () Bool)

(assert (=> b!1337488 m!1225529))

(assert (=> b!1337490 m!1225527))

(assert (=> b!1337490 m!1225527))

(assert (=> b!1337490 m!1225529))

(assert (=> b!1337345 d!143745))

(declare-fun d!143747 () Bool)

(declare-fun e!761587 () Bool)

(assert (=> d!143747 e!761587))

(declare-fun res!887567 () Bool)

(assert (=> d!143747 (=> (not res!887567) (not e!761587))))

(declare-fun lt!593191 () ListLongMap!21589)

(assert (=> d!143747 (= res!887567 (contains!8977 lt!593191 (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!593189 () List!31075)

(assert (=> d!143747 (= lt!593191 (ListLongMap!21590 lt!593189))))

(declare-fun lt!593190 () Unit!43947)

(declare-fun lt!593188 () Unit!43947)

(assert (=> d!143747 (= lt!593190 lt!593188)))

(assert (=> d!143747 (= (getValueByKey!717 lt!593189 (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!768 (_2!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!362 (List!31075 (_ BitVec 64) V!54379) Unit!43947)

(assert (=> d!143747 (= lt!593188 (lemmaContainsTupThenGetReturnValue!362 lt!593189 (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!491 (List!31075 (_ BitVec 64) V!54379) List!31075)

(assert (=> d!143747 (= lt!593189 (insertStrictlySorted!491 (toList!10810 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143747 (= (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!593191)))

(declare-fun b!1337495 () Bool)

(declare-fun res!887568 () Bool)

(assert (=> b!1337495 (=> (not res!887568) (not e!761587))))

(assert (=> b!1337495 (= res!887568 (= (getValueByKey!717 (toList!10810 lt!593191) (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!768 (_2!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1337496 () Bool)

(declare-fun contains!8980 (List!31075 tuple2!23932) Bool)

(assert (=> b!1337496 (= e!761587 (contains!8980 (toList!10810 lt!593191) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!143747 res!887567) b!1337495))

(assert (= (and b!1337495 res!887568) b!1337496))

(declare-fun m!1225531 () Bool)

(assert (=> d!143747 m!1225531))

(declare-fun m!1225533 () Bool)

(assert (=> d!143747 m!1225533))

(declare-fun m!1225535 () Bool)

(assert (=> d!143747 m!1225535))

(declare-fun m!1225537 () Bool)

(assert (=> d!143747 m!1225537))

(declare-fun m!1225539 () Bool)

(assert (=> b!1337495 m!1225539))

(declare-fun m!1225541 () Bool)

(assert (=> b!1337496 m!1225541))

(assert (=> b!1337345 d!143747))

(declare-fun b!1337521 () Bool)

(declare-fun e!761606 () ListLongMap!21589)

(assert (=> b!1337521 (= e!761606 (ListLongMap!21590 Nil!31072))))

(declare-fun d!143749 () Bool)

(declare-fun e!761608 () Bool)

(assert (=> d!143749 e!761608))

(declare-fun res!887580 () Bool)

(assert (=> d!143749 (=> (not res!887580) (not e!761608))))

(declare-fun lt!593208 () ListLongMap!21589)

(assert (=> d!143749 (= res!887580 (not (contains!8977 lt!593208 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!143749 (= lt!593208 e!761606)))

(declare-fun c!126096 () Bool)

(assert (=> d!143749 (= c!126096 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44399 _keys!1590)))))

(assert (=> d!143749 (validMask!0 mask!1998)))

(assert (=> d!143749 (= (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!593208)))

(declare-fun b!1337522 () Bool)

(declare-fun e!761603 () ListLongMap!21589)

(assert (=> b!1337522 (= e!761606 e!761603)))

(declare-fun c!126097 () Bool)

(assert (=> b!1337522 (= c!126097 (validKeyInArray!0 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1337523 () Bool)

(declare-fun e!761604 () Bool)

(declare-fun e!761602 () Bool)

(assert (=> b!1337523 (= e!761604 e!761602)))

(assert (=> b!1337523 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44399 _keys!1590)))))

(declare-fun res!887577 () Bool)

(assert (=> b!1337523 (= res!887577 (contains!8977 lt!593208 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1337523 (=> (not res!887577) (not e!761602))))

(declare-fun b!1337524 () Bool)

(declare-fun e!761605 () Bool)

(assert (=> b!1337524 (= e!761604 e!761605)))

(declare-fun c!126098 () Bool)

(assert (=> b!1337524 (= c!126098 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44399 _keys!1590)))))

(declare-fun call!64935 () ListLongMap!21589)

(declare-fun bm!64932 () Bool)

(assert (=> bm!64932 (= call!64935 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1337525 () Bool)

(declare-fun lt!593212 () Unit!43947)

(declare-fun lt!593209 () Unit!43947)

(assert (=> b!1337525 (= lt!593212 lt!593209)))

(declare-fun lt!593210 () ListLongMap!21589)

(declare-fun lt!593206 () V!54379)

(declare-fun lt!593211 () (_ BitVec 64))

(declare-fun lt!593207 () (_ BitVec 64))

(assert (=> b!1337525 (not (contains!8977 (+!4746 lt!593210 (tuple2!23933 lt!593207 lt!593206)) lt!593211))))

(declare-fun addStillNotContains!498 (ListLongMap!21589 (_ BitVec 64) V!54379 (_ BitVec 64)) Unit!43947)

(assert (=> b!1337525 (= lt!593209 (addStillNotContains!498 lt!593210 lt!593207 lt!593206 lt!593211))))

(assert (=> b!1337525 (= lt!593211 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1337525 (= lt!593206 (get!22129 (select (arr!43850 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1337525 (= lt!593207 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(assert (=> b!1337525 (= lt!593210 call!64935)))

(assert (=> b!1337525 (= e!761603 (+!4746 call!64935 (tuple2!23933 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22129 (select (arr!43850 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1337526 () Bool)

(declare-fun isEmpty!1085 (ListLongMap!21589) Bool)

(assert (=> b!1337526 (= e!761605 (isEmpty!1085 lt!593208))))

(declare-fun b!1337527 () Bool)

(declare-fun res!887579 () Bool)

(assert (=> b!1337527 (=> (not res!887579) (not e!761608))))

(assert (=> b!1337527 (= res!887579 (not (contains!8977 lt!593208 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1337528 () Bool)

(assert (=> b!1337528 (= e!761608 e!761604)))

(declare-fun c!126095 () Bool)

(declare-fun e!761607 () Bool)

(assert (=> b!1337528 (= c!126095 e!761607)))

(declare-fun res!887578 () Bool)

(assert (=> b!1337528 (=> (not res!887578) (not e!761607))))

(assert (=> b!1337528 (= res!887578 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44399 _keys!1590)))))

(declare-fun b!1337529 () Bool)

(assert (=> b!1337529 (= e!761605 (= lt!593208 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1337530 () Bool)

(assert (=> b!1337530 (= e!761603 call!64935)))

(declare-fun b!1337531 () Bool)

(assert (=> b!1337531 (= e!761607 (validKeyInArray!0 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1337531 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))

(declare-fun b!1337532 () Bool)

(assert (=> b!1337532 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44399 _keys!1590)))))

(assert (=> b!1337532 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44400 _values!1320)))))

(assert (=> b!1337532 (= e!761602 (= (apply!1034 lt!593208 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22129 (select (arr!43850 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!143749 c!126096) b!1337521))

(assert (= (and d!143749 (not c!126096)) b!1337522))

(assert (= (and b!1337522 c!126097) b!1337525))

(assert (= (and b!1337522 (not c!126097)) b!1337530))

(assert (= (or b!1337525 b!1337530) bm!64932))

(assert (= (and d!143749 res!887580) b!1337527))

(assert (= (and b!1337527 res!887579) b!1337528))

(assert (= (and b!1337528 res!887578) b!1337531))

(assert (= (and b!1337528 c!126095) b!1337523))

(assert (= (and b!1337528 (not c!126095)) b!1337524))

(assert (= (and b!1337523 res!887577) b!1337532))

(assert (= (and b!1337524 c!126098) b!1337529))

(assert (= (and b!1337524 (not c!126098)) b!1337526))

(declare-fun b_lambda!24219 () Bool)

(assert (=> (not b_lambda!24219) (not b!1337525)))

(assert (=> b!1337525 t!45389))

(declare-fun b_and!50037 () Bool)

(assert (= b_and!50035 (and (=> t!45389 result!25313) b_and!50037)))

(declare-fun b_lambda!24221 () Bool)

(assert (=> (not b_lambda!24221) (not b!1337532)))

(assert (=> b!1337532 t!45389))

(declare-fun b_and!50039 () Bool)

(assert (= b_and!50037 (and (=> t!45389 result!25313) b_and!50039)))

(declare-fun m!1225543 () Bool)

(assert (=> d!143749 m!1225543))

(assert (=> d!143749 m!1225387))

(declare-fun m!1225545 () Bool)

(assert (=> b!1337529 m!1225545))

(declare-fun m!1225547 () Bool)

(assert (=> b!1337525 m!1225547))

(declare-fun m!1225549 () Bool)

(assert (=> b!1337525 m!1225549))

(declare-fun m!1225551 () Bool)

(assert (=> b!1337525 m!1225551))

(declare-fun m!1225553 () Bool)

(assert (=> b!1337525 m!1225553))

(declare-fun m!1225555 () Bool)

(assert (=> b!1337525 m!1225555))

(assert (=> b!1337525 m!1225401))

(declare-fun m!1225557 () Bool)

(assert (=> b!1337525 m!1225557))

(assert (=> b!1337525 m!1225401))

(assert (=> b!1337525 m!1225555))

(declare-fun m!1225559 () Bool)

(assert (=> b!1337525 m!1225559))

(assert (=> b!1337525 m!1225547))

(assert (=> b!1337523 m!1225553))

(assert (=> b!1337523 m!1225553))

(declare-fun m!1225561 () Bool)

(assert (=> b!1337523 m!1225561))

(assert (=> b!1337532 m!1225555))

(assert (=> b!1337532 m!1225401))

(assert (=> b!1337532 m!1225557))

(assert (=> b!1337532 m!1225401))

(assert (=> b!1337532 m!1225555))

(assert (=> b!1337532 m!1225553))

(declare-fun m!1225563 () Bool)

(assert (=> b!1337532 m!1225563))

(assert (=> b!1337532 m!1225553))

(declare-fun m!1225565 () Bool)

(assert (=> b!1337526 m!1225565))

(assert (=> b!1337531 m!1225553))

(assert (=> b!1337531 m!1225553))

(declare-fun m!1225567 () Bool)

(assert (=> b!1337531 m!1225567))

(declare-fun m!1225569 () Bool)

(assert (=> b!1337527 m!1225569))

(assert (=> b!1337522 m!1225553))

(assert (=> b!1337522 m!1225553))

(assert (=> b!1337522 m!1225567))

(assert (=> bm!64932 m!1225545))

(assert (=> b!1337345 d!143749))

(declare-fun d!143751 () Bool)

(declare-fun c!126101 () Bool)

(assert (=> d!143751 (= c!126101 ((_ is ValueCellFull!17580) (select (arr!43850 _values!1320) from!1980)))))

(declare-fun e!761611 () V!54379)

(assert (=> d!143751 (= (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!761611)))

(declare-fun b!1337537 () Bool)

(declare-fun get!22131 (ValueCell!17580 V!54379) V!54379)

(assert (=> b!1337537 (= e!761611 (get!22131 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1337538 () Bool)

(declare-fun get!22132 (ValueCell!17580 V!54379) V!54379)

(assert (=> b!1337538 (= e!761611 (get!22132 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143751 c!126101) b!1337537))

(assert (= (and d!143751 (not c!126101)) b!1337538))

(assert (=> b!1337537 m!1225407))

(assert (=> b!1337537 m!1225401))

(declare-fun m!1225571 () Bool)

(assert (=> b!1337537 m!1225571))

(assert (=> b!1337538 m!1225407))

(assert (=> b!1337538 m!1225401))

(declare-fun m!1225573 () Bool)

(assert (=> b!1337538 m!1225573))

(assert (=> b!1337345 d!143751))

(declare-fun d!143753 () Bool)

(assert (=> d!143753 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112736 d!143753))

(declare-fun d!143755 () Bool)

(assert (=> d!143755 (= (array_inv!33069 _values!1320) (bvsge (size!44400 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112736 d!143755))

(declare-fun d!143757 () Bool)

(assert (=> d!143757 (= (array_inv!33070 _keys!1590) (bvsge (size!44399 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112736 d!143757))

(declare-fun d!143759 () Bool)

(assert (=> d!143759 (= (validKeyInArray!0 (select (arr!43849 _keys!1590) from!1980)) (and (not (= (select (arr!43849 _keys!1590) from!1980) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43849 _keys!1590) from!1980) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1337338 d!143759))

(declare-fun mapIsEmpty!57122 () Bool)

(declare-fun mapRes!57122 () Bool)

(assert (=> mapIsEmpty!57122 mapRes!57122))

(declare-fun b!1337545 () Bool)

(declare-fun e!761616 () Bool)

(assert (=> b!1337545 (= e!761616 tp_is_empty!36957)))

(declare-fun mapNonEmpty!57122 () Bool)

(declare-fun tp!108794 () Bool)

(assert (=> mapNonEmpty!57122 (= mapRes!57122 (and tp!108794 e!761616))))

(declare-fun mapRest!57122 () (Array (_ BitVec 32) ValueCell!17580))

(declare-fun mapKey!57122 () (_ BitVec 32))

(declare-fun mapValue!57122 () ValueCell!17580)

(assert (=> mapNonEmpty!57122 (= mapRest!57116 (store mapRest!57122 mapKey!57122 mapValue!57122))))

(declare-fun condMapEmpty!57122 () Bool)

(declare-fun mapDefault!57122 () ValueCell!17580)

(assert (=> mapNonEmpty!57116 (= condMapEmpty!57122 (= mapRest!57116 ((as const (Array (_ BitVec 32) ValueCell!17580)) mapDefault!57122)))))

(declare-fun e!761617 () Bool)

(assert (=> mapNonEmpty!57116 (= tp!108785 (and e!761617 mapRes!57122))))

(declare-fun b!1337546 () Bool)

(assert (=> b!1337546 (= e!761617 tp_is_empty!36957)))

(assert (= (and mapNonEmpty!57116 condMapEmpty!57122) mapIsEmpty!57122))

(assert (= (and mapNonEmpty!57116 (not condMapEmpty!57122)) mapNonEmpty!57122))

(assert (= (and mapNonEmpty!57122 ((_ is ValueCellFull!17580) mapValue!57122)) b!1337545))

(assert (= (and mapNonEmpty!57116 ((_ is ValueCellFull!17580) mapDefault!57122)) b!1337546))

(declare-fun m!1225575 () Bool)

(assert (=> mapNonEmpty!57122 m!1225575))

(declare-fun b_lambda!24223 () Bool)

(assert (= b_lambda!24219 (or (and start!112736 b_free!31047) b_lambda!24223)))

(declare-fun b_lambda!24225 () Bool)

(assert (= b_lambda!24217 (or (and start!112736 b_free!31047) b_lambda!24225)))

(declare-fun b_lambda!24227 () Bool)

(assert (= b_lambda!24221 (or (and start!112736 b_free!31047) b_lambda!24227)))

(check-sat (not b!1337443) (not b_lambda!24225) (not bm!64926) (not d!143737) (not bm!64932) (not b!1337447) (not b!1337451) (not b!1337440) (not b!1337527) (not bm!64923) (not d!143745) (not b!1337441) (not b_next!31047) (not bm!64920) (not b!1337490) (not b!1337454) (not b!1337522) (not b!1337474) (not mapNonEmpty!57122) (not bm!64929) (not b!1337473) (not b!1337525) (not b_lambda!24223) (not b!1337531) (not b_lambda!24227) (not d!143739) (not b!1337485) (not b!1337486) (not b!1337471) (not b!1337397) (not b!1337395) (not b!1337495) (not b!1337488) (not b!1337529) b_and!50039 (not d!143747) tp_is_empty!36957 (not b!1337449) (not bm!64918) (not b!1337537) (not b!1337523) (not b!1337456) (not b_lambda!24215) (not b!1337532) (not b!1337526) (not b!1337538) (not bm!64919) (not d!143749) (not b!1337496))
(check-sat b_and!50039 (not b_next!31047))
(get-model)

(declare-fun d!143761 () Bool)

(declare-fun e!761619 () Bool)

(assert (=> d!143761 e!761619))

(declare-fun res!887581 () Bool)

(assert (=> d!143761 (=> res!887581 e!761619)))

(declare-fun lt!593215 () Bool)

(assert (=> d!143761 (= res!887581 (not lt!593215))))

(declare-fun lt!593216 () Bool)

(assert (=> d!143761 (= lt!593215 lt!593216)))

(declare-fun lt!593214 () Unit!43947)

(declare-fun e!761618 () Unit!43947)

(assert (=> d!143761 (= lt!593214 e!761618)))

(declare-fun c!126102 () Bool)

(assert (=> d!143761 (= c!126102 lt!593216)))

(assert (=> d!143761 (= lt!593216 (containsKey!739 (toList!10810 lt!593146) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143761 (= (contains!8977 lt!593146 #b0000000000000000000000000000000000000000000000000000000000000000) lt!593215)))

(declare-fun b!1337547 () Bool)

(declare-fun lt!593213 () Unit!43947)

(assert (=> b!1337547 (= e!761618 lt!593213)))

(assert (=> b!1337547 (= lt!593213 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10810 lt!593146) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1337547 (isDefined!524 (getValueByKey!717 (toList!10810 lt!593146) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337548 () Bool)

(declare-fun Unit!43952 () Unit!43947)

(assert (=> b!1337548 (= e!761618 Unit!43952)))

(declare-fun b!1337549 () Bool)

(assert (=> b!1337549 (= e!761619 (isDefined!524 (getValueByKey!717 (toList!10810 lt!593146) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143761 c!126102) b!1337547))

(assert (= (and d!143761 (not c!126102)) b!1337548))

(assert (= (and d!143761 (not res!887581)) b!1337549))

(declare-fun m!1225577 () Bool)

(assert (=> d!143761 m!1225577))

(declare-fun m!1225579 () Bool)

(assert (=> b!1337547 m!1225579))

(declare-fun m!1225581 () Bool)

(assert (=> b!1337547 m!1225581))

(assert (=> b!1337547 m!1225581))

(declare-fun m!1225583 () Bool)

(assert (=> b!1337547 m!1225583))

(assert (=> b!1337549 m!1225581))

(assert (=> b!1337549 m!1225581))

(assert (=> b!1337549 m!1225583))

(assert (=> bm!64920 d!143761))

(declare-fun d!143763 () Bool)

(declare-fun e!761621 () Bool)

(assert (=> d!143763 e!761621))

(declare-fun res!887582 () Bool)

(assert (=> d!143763 (=> res!887582 e!761621)))

(declare-fun lt!593219 () Bool)

(assert (=> d!143763 (= res!887582 (not lt!593219))))

(declare-fun lt!593220 () Bool)

(assert (=> d!143763 (= lt!593219 lt!593220)))

(declare-fun lt!593218 () Unit!43947)

(declare-fun e!761620 () Unit!43947)

(assert (=> d!143763 (= lt!593218 e!761620)))

(declare-fun c!126103 () Bool)

(assert (=> d!143763 (= c!126103 lt!593220)))

(assert (=> d!143763 (= lt!593220 (containsKey!739 (toList!10810 lt!593191) (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143763 (= (contains!8977 lt!593191 (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!593219)))

(declare-fun b!1337550 () Bool)

(declare-fun lt!593217 () Unit!43947)

(assert (=> b!1337550 (= e!761620 lt!593217)))

(assert (=> b!1337550 (= lt!593217 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10810 lt!593191) (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!1337550 (isDefined!524 (getValueByKey!717 (toList!10810 lt!593191) (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1337551 () Bool)

(declare-fun Unit!43953 () Unit!43947)

(assert (=> b!1337551 (= e!761620 Unit!43953)))

(declare-fun b!1337552 () Bool)

(assert (=> b!1337552 (= e!761621 (isDefined!524 (getValueByKey!717 (toList!10810 lt!593191) (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!143763 c!126103) b!1337550))

(assert (= (and d!143763 (not c!126103)) b!1337551))

(assert (= (and d!143763 (not res!887582)) b!1337552))

(declare-fun m!1225585 () Bool)

(assert (=> d!143763 m!1225585))

(declare-fun m!1225587 () Bool)

(assert (=> b!1337550 m!1225587))

(assert (=> b!1337550 m!1225539))

(assert (=> b!1337550 m!1225539))

(declare-fun m!1225589 () Bool)

(assert (=> b!1337550 m!1225589))

(assert (=> b!1337552 m!1225539))

(assert (=> b!1337552 m!1225539))

(assert (=> b!1337552 m!1225589))

(assert (=> d!143747 d!143763))

(declare-fun b!1337561 () Bool)

(declare-fun e!761626 () Option!769)

(assert (=> b!1337561 (= e!761626 (Some!768 (_2!11977 (h!32280 lt!593189))))))

(declare-fun b!1337564 () Bool)

(declare-fun e!761627 () Option!769)

(assert (=> b!1337564 (= e!761627 None!767)))

(declare-fun b!1337562 () Bool)

(assert (=> b!1337562 (= e!761626 e!761627)))

(declare-fun c!126109 () Bool)

(assert (=> b!1337562 (= c!126109 (and ((_ is Cons!31071) lt!593189) (not (= (_1!11977 (h!32280 lt!593189)) (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1337563 () Bool)

(assert (=> b!1337563 (= e!761627 (getValueByKey!717 (t!45391 lt!593189) (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!126108 () Bool)

(declare-fun d!143765 () Bool)

(assert (=> d!143765 (= c!126108 (and ((_ is Cons!31071) lt!593189) (= (_1!11977 (h!32280 lt!593189)) (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!143765 (= (getValueByKey!717 lt!593189 (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!761626)))

(assert (= (and d!143765 c!126108) b!1337561))

(assert (= (and d!143765 (not c!126108)) b!1337562))

(assert (= (and b!1337562 c!126109) b!1337563))

(assert (= (and b!1337562 (not c!126109)) b!1337564))

(declare-fun m!1225591 () Bool)

(assert (=> b!1337563 m!1225591))

(assert (=> d!143747 d!143765))

(declare-fun d!143767 () Bool)

(assert (=> d!143767 (= (getValueByKey!717 lt!593189 (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!768 (_2!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!593223 () Unit!43947)

(declare-fun choose!1962 (List!31075 (_ BitVec 64) V!54379) Unit!43947)

(assert (=> d!143767 (= lt!593223 (choose!1962 lt!593189 (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!761630 () Bool)

(assert (=> d!143767 e!761630))

(declare-fun res!887587 () Bool)

(assert (=> d!143767 (=> (not res!887587) (not e!761630))))

(declare-fun isStrictlySorted!879 (List!31075) Bool)

(assert (=> d!143767 (= res!887587 (isStrictlySorted!879 lt!593189))))

(assert (=> d!143767 (= (lemmaContainsTupThenGetReturnValue!362 lt!593189 (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!593223)))

(declare-fun b!1337569 () Bool)

(declare-fun res!887588 () Bool)

(assert (=> b!1337569 (=> (not res!887588) (not e!761630))))

(assert (=> b!1337569 (= res!887588 (containsKey!739 lt!593189 (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1337570 () Bool)

(assert (=> b!1337570 (= e!761630 (contains!8980 lt!593189 (tuple2!23933 (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!143767 res!887587) b!1337569))

(assert (= (and b!1337569 res!887588) b!1337570))

(assert (=> d!143767 m!1225533))

(declare-fun m!1225593 () Bool)

(assert (=> d!143767 m!1225593))

(declare-fun m!1225595 () Bool)

(assert (=> d!143767 m!1225595))

(declare-fun m!1225597 () Bool)

(assert (=> b!1337569 m!1225597))

(declare-fun m!1225599 () Bool)

(assert (=> b!1337570 m!1225599))

(assert (=> d!143747 d!143767))

(declare-fun bm!64939 () Bool)

(declare-fun call!64943 () List!31075)

(declare-fun call!64944 () List!31075)

(assert (=> bm!64939 (= call!64943 call!64944)))

(declare-fun b!1337591 () Bool)

(declare-fun e!761641 () List!31075)

(assert (=> b!1337591 (= e!761641 call!64943)))

(declare-fun b!1337592 () Bool)

(declare-fun e!761643 () Bool)

(declare-fun lt!593226 () List!31075)

(assert (=> b!1337592 (= e!761643 (contains!8980 lt!593226 (tuple2!23933 (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun c!126121 () Bool)

(declare-fun e!761642 () List!31075)

(declare-fun b!1337593 () Bool)

(declare-fun c!126118 () Bool)

(assert (=> b!1337593 (= e!761642 (ite c!126118 (t!45391 (toList!10810 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (ite c!126121 (Cons!31071 (h!32280 (toList!10810 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (t!45391 (toList!10810 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) Nil!31072)))))

(declare-fun b!1337594 () Bool)

(assert (=> b!1337594 (= e!761642 (insertStrictlySorted!491 (t!45391 (toList!10810 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!64940 () Bool)

(declare-fun call!64942 () List!31075)

(assert (=> bm!64940 (= call!64942 call!64943)))

(declare-fun b!1337595 () Bool)

(declare-fun e!761645 () List!31075)

(assert (=> b!1337595 (= e!761645 call!64942)))

(declare-fun b!1337596 () Bool)

(assert (=> b!1337596 (= c!126121 (and ((_ is Cons!31071) (toList!10810 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (bvsgt (_1!11977 (h!32280 (toList!10810 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!1337596 (= e!761641 e!761645)))

(declare-fun b!1337597 () Bool)

(declare-fun res!887593 () Bool)

(assert (=> b!1337597 (=> (not res!887593) (not e!761643))))

(assert (=> b!1337597 (= res!887593 (containsKey!739 lt!593226 (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1337598 () Bool)

(declare-fun e!761644 () List!31075)

(assert (=> b!1337598 (= e!761644 call!64944)))

(declare-fun b!1337599 () Bool)

(assert (=> b!1337599 (= e!761645 call!64942)))

(declare-fun bm!64941 () Bool)

(declare-fun c!126119 () Bool)

(declare-fun $colon$colon!671 (List!31075 tuple2!23932) List!31075)

(assert (=> bm!64941 (= call!64944 ($colon$colon!671 e!761642 (ite c!126119 (h!32280 (toList!10810 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (tuple2!23933 (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!126120 () Bool)

(assert (=> bm!64941 (= c!126120 c!126119)))

(declare-fun b!1337600 () Bool)

(assert (=> b!1337600 (= e!761644 e!761641)))

(assert (=> b!1337600 (= c!126118 (and ((_ is Cons!31071) (toList!10810 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (= (_1!11977 (h!32280 (toList!10810 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun d!143769 () Bool)

(assert (=> d!143769 e!761643))

(declare-fun res!887594 () Bool)

(assert (=> d!143769 (=> (not res!887594) (not e!761643))))

(assert (=> d!143769 (= res!887594 (isStrictlySorted!879 lt!593226))))

(assert (=> d!143769 (= lt!593226 e!761644)))

(assert (=> d!143769 (= c!126119 (and ((_ is Cons!31071) (toList!10810 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (bvslt (_1!11977 (h!32280 (toList!10810 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!143769 (isStrictlySorted!879 (toList!10810 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))))

(assert (=> d!143769 (= (insertStrictlySorted!491 (toList!10810 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!593226)))

(assert (= (and d!143769 c!126119) b!1337598))

(assert (= (and d!143769 (not c!126119)) b!1337600))

(assert (= (and b!1337600 c!126118) b!1337591))

(assert (= (and b!1337600 (not c!126118)) b!1337596))

(assert (= (and b!1337596 c!126121) b!1337599))

(assert (= (and b!1337596 (not c!126121)) b!1337595))

(assert (= (or b!1337599 b!1337595) bm!64940))

(assert (= (or b!1337591 bm!64940) bm!64939))

(assert (= (or b!1337598 bm!64939) bm!64941))

(assert (= (and bm!64941 c!126120) b!1337594))

(assert (= (and bm!64941 (not c!126120)) b!1337593))

(assert (= (and d!143769 res!887594) b!1337597))

(assert (= (and b!1337597 res!887593) b!1337592))

(declare-fun m!1225601 () Bool)

(assert (=> d!143769 m!1225601))

(declare-fun m!1225603 () Bool)

(assert (=> d!143769 m!1225603))

(declare-fun m!1225605 () Bool)

(assert (=> b!1337597 m!1225605))

(declare-fun m!1225607 () Bool)

(assert (=> b!1337592 m!1225607))

(declare-fun m!1225609 () Bool)

(assert (=> b!1337594 m!1225609))

(declare-fun m!1225611 () Bool)

(assert (=> bm!64941 m!1225611))

(assert (=> d!143747 d!143769))

(declare-fun d!143771 () Bool)

(declare-fun res!887599 () Bool)

(declare-fun e!761650 () Bool)

(assert (=> d!143771 (=> res!887599 e!761650)))

(assert (=> d!143771 (= res!887599 (and ((_ is Cons!31071) (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (= (_1!11977 (h!32280 (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1153)))))

(assert (=> d!143771 (= (containsKey!739 (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153) e!761650)))

(declare-fun b!1337605 () Bool)

(declare-fun e!761651 () Bool)

(assert (=> b!1337605 (= e!761650 e!761651)))

(declare-fun res!887600 () Bool)

(assert (=> b!1337605 (=> (not res!887600) (not e!761651))))

(assert (=> b!1337605 (= res!887600 (and (or (not ((_ is Cons!31071) (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (bvsle (_1!11977 (h!32280 (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1153)) ((_ is Cons!31071) (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvslt (_1!11977 (h!32280 (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1153)))))

(declare-fun b!1337606 () Bool)

(assert (=> b!1337606 (= e!761651 (containsKey!739 (t!45391 (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) k0!1153))))

(assert (= (and d!143771 (not res!887599)) b!1337605))

(assert (= (and b!1337605 res!887600) b!1337606))

(declare-fun m!1225613 () Bool)

(assert (=> b!1337606 m!1225613))

(assert (=> d!143745 d!143771))

(assert (=> b!1337447 d!143759))

(declare-fun d!143773 () Bool)

(declare-fun e!761653 () Bool)

(assert (=> d!143773 e!761653))

(declare-fun res!887601 () Bool)

(assert (=> d!143773 (=> res!887601 e!761653)))

(declare-fun lt!593229 () Bool)

(assert (=> d!143773 (= res!887601 (not lt!593229))))

(declare-fun lt!593230 () Bool)

(assert (=> d!143773 (= lt!593229 lt!593230)))

(declare-fun lt!593228 () Unit!43947)

(declare-fun e!761652 () Unit!43947)

(assert (=> d!143773 (= lt!593228 e!761652)))

(declare-fun c!126122 () Bool)

(assert (=> d!143773 (= c!126122 lt!593230)))

(assert (=> d!143773 (= lt!593230 (containsKey!739 (toList!10810 lt!593208) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143773 (= (contains!8977 lt!593208 #b0000000000000000000000000000000000000000000000000000000000000000) lt!593229)))

(declare-fun b!1337607 () Bool)

(declare-fun lt!593227 () Unit!43947)

(assert (=> b!1337607 (= e!761652 lt!593227)))

(assert (=> b!1337607 (= lt!593227 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10810 lt!593208) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1337607 (isDefined!524 (getValueByKey!717 (toList!10810 lt!593208) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337608 () Bool)

(declare-fun Unit!43954 () Unit!43947)

(assert (=> b!1337608 (= e!761652 Unit!43954)))

(declare-fun b!1337609 () Bool)

(assert (=> b!1337609 (= e!761653 (isDefined!524 (getValueByKey!717 (toList!10810 lt!593208) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143773 c!126122) b!1337607))

(assert (= (and d!143773 (not c!126122)) b!1337608))

(assert (= (and d!143773 (not res!887601)) b!1337609))

(declare-fun m!1225615 () Bool)

(assert (=> d!143773 m!1225615))

(declare-fun m!1225617 () Bool)

(assert (=> b!1337607 m!1225617))

(declare-fun m!1225619 () Bool)

(assert (=> b!1337607 m!1225619))

(assert (=> b!1337607 m!1225619))

(declare-fun m!1225621 () Bool)

(assert (=> b!1337607 m!1225621))

(assert (=> b!1337609 m!1225619))

(assert (=> b!1337609 m!1225619))

(assert (=> b!1337609 m!1225621))

(assert (=> d!143749 d!143773))

(assert (=> d!143749 d!143753))

(declare-fun d!143775 () Bool)

(assert (=> d!143775 (isDefined!524 (getValueByKey!717 (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun lt!593233 () Unit!43947)

(declare-fun choose!1963 (List!31075 (_ BitVec 64)) Unit!43947)

(assert (=> d!143775 (= lt!593233 (choose!1963 (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun e!761656 () Bool)

(assert (=> d!143775 e!761656))

(declare-fun res!887604 () Bool)

(assert (=> d!143775 (=> (not res!887604) (not e!761656))))

(assert (=> d!143775 (= res!887604 (isStrictlySorted!879 (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))))

(assert (=> d!143775 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) lt!593233)))

(declare-fun b!1337612 () Bool)

(assert (=> b!1337612 (= e!761656 (containsKey!739 (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (= (and d!143775 res!887604) b!1337612))

(assert (=> d!143775 m!1225455))

(assert (=> d!143775 m!1225455))

(assert (=> d!143775 m!1225457))

(declare-fun m!1225623 () Bool)

(assert (=> d!143775 m!1225623))

(declare-fun m!1225625 () Bool)

(assert (=> d!143775 m!1225625))

(assert (=> b!1337612 m!1225451))

(assert (=> b!1337395 d!143775))

(declare-fun d!143777 () Bool)

(declare-fun isEmpty!1086 (Option!769) Bool)

(assert (=> d!143777 (= (isDefined!524 (getValueByKey!717 (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)) (not (isEmpty!1086 (getValueByKey!717 (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))))

(declare-fun bs!38295 () Bool)

(assert (= bs!38295 d!143777))

(assert (=> bs!38295 m!1225455))

(declare-fun m!1225627 () Bool)

(assert (=> bs!38295 m!1225627))

(assert (=> b!1337395 d!143777))

(declare-fun e!761657 () Option!769)

(declare-fun b!1337613 () Bool)

(assert (=> b!1337613 (= e!761657 (Some!768 (_2!11977 (h!32280 (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))))))

(declare-fun b!1337616 () Bool)

(declare-fun e!761658 () Option!769)

(assert (=> b!1337616 (= e!761658 None!767)))

(declare-fun b!1337614 () Bool)

(assert (=> b!1337614 (= e!761657 e!761658)))

(declare-fun c!126124 () Bool)

(assert (=> b!1337614 (= c!126124 (and ((_ is Cons!31071) (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (not (= (_1!11977 (h!32280 (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153))))))

(declare-fun b!1337615 () Bool)

(assert (=> b!1337615 (= e!761658 (getValueByKey!717 (t!45391 (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) k0!1153))))

(declare-fun d!143779 () Bool)

(declare-fun c!126123 () Bool)

(assert (=> d!143779 (= c!126123 (and ((_ is Cons!31071) (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (= (_1!11977 (h!32280 (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(assert (=> d!143779 (= (getValueByKey!717 (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) e!761657)))

(assert (= (and d!143779 c!126123) b!1337613))

(assert (= (and d!143779 (not c!126123)) b!1337614))

(assert (= (and b!1337614 c!126124) b!1337615))

(assert (= (and b!1337614 (not c!126124)) b!1337616))

(declare-fun m!1225629 () Bool)

(assert (=> b!1337615 m!1225629))

(assert (=> b!1337395 d!143779))

(declare-fun d!143781 () Bool)

(declare-fun get!22133 (Option!769) V!54379)

(assert (=> d!143781 (= (apply!1034 lt!593146 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22133 (getValueByKey!717 (toList!10810 lt!593146) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38296 () Bool)

(assert (= bs!38296 d!143781))

(assert (=> bs!38296 m!1225581))

(assert (=> bs!38296 m!1225581))

(declare-fun m!1225631 () Bool)

(assert (=> bs!38296 m!1225631))

(assert (=> b!1337443 d!143781))

(assert (=> b!1337397 d!143777))

(assert (=> b!1337397 d!143779))

(declare-fun d!143783 () Bool)

(assert (=> d!143783 (= (apply!1034 lt!593146 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22133 (getValueByKey!717 (toList!10810 lt!593146) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38297 () Bool)

(assert (= bs!38297 d!143783))

(declare-fun m!1225633 () Bool)

(assert (=> bs!38297 m!1225633))

(assert (=> bs!38297 m!1225633))

(declare-fun m!1225635 () Bool)

(assert (=> bs!38297 m!1225635))

(assert (=> b!1337441 d!143783))

(declare-fun d!143785 () Bool)

(declare-fun e!761659 () Bool)

(assert (=> d!143785 e!761659))

(declare-fun res!887605 () Bool)

(assert (=> d!143785 (=> (not res!887605) (not e!761659))))

(declare-fun lt!593237 () ListLongMap!21589)

(assert (=> d!143785 (= res!887605 (contains!8977 lt!593237 (_1!11977 (ite (or c!126076 c!126077) (tuple2!23933 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun lt!593235 () List!31075)

(assert (=> d!143785 (= lt!593237 (ListLongMap!21590 lt!593235))))

(declare-fun lt!593236 () Unit!43947)

(declare-fun lt!593234 () Unit!43947)

(assert (=> d!143785 (= lt!593236 lt!593234)))

(assert (=> d!143785 (= (getValueByKey!717 lt!593235 (_1!11977 (ite (or c!126076 c!126077) (tuple2!23933 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!768 (_2!11977 (ite (or c!126076 c!126077) (tuple2!23933 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143785 (= lt!593234 (lemmaContainsTupThenGetReturnValue!362 lt!593235 (_1!11977 (ite (or c!126076 c!126077) (tuple2!23933 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!11977 (ite (or c!126076 c!126077) (tuple2!23933 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143785 (= lt!593235 (insertStrictlySorted!491 (toList!10810 (ite c!126076 call!64925 (ite c!126077 call!64921 call!64924))) (_1!11977 (ite (or c!126076 c!126077) (tuple2!23933 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!11977 (ite (or c!126076 c!126077) (tuple2!23933 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143785 (= (+!4746 (ite c!126076 call!64925 (ite c!126077 call!64921 call!64924)) (ite (or c!126076 c!126077) (tuple2!23933 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) lt!593237)))

(declare-fun b!1337617 () Bool)

(declare-fun res!887606 () Bool)

(assert (=> b!1337617 (=> (not res!887606) (not e!761659))))

(assert (=> b!1337617 (= res!887606 (= (getValueByKey!717 (toList!10810 lt!593237) (_1!11977 (ite (or c!126076 c!126077) (tuple2!23933 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!768 (_2!11977 (ite (or c!126076 c!126077) (tuple2!23933 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))))

(declare-fun b!1337618 () Bool)

(assert (=> b!1337618 (= e!761659 (contains!8980 (toList!10810 lt!593237) (ite (or c!126076 c!126077) (tuple2!23933 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (= (and d!143785 res!887605) b!1337617))

(assert (= (and b!1337617 res!887606) b!1337618))

(declare-fun m!1225637 () Bool)

(assert (=> d!143785 m!1225637))

(declare-fun m!1225639 () Bool)

(assert (=> d!143785 m!1225639))

(declare-fun m!1225641 () Bool)

(assert (=> d!143785 m!1225641))

(declare-fun m!1225643 () Bool)

(assert (=> d!143785 m!1225643))

(declare-fun m!1225645 () Bool)

(assert (=> b!1337617 m!1225645))

(declare-fun m!1225647 () Bool)

(assert (=> b!1337618 m!1225647))

(assert (=> bm!64923 d!143785))

(declare-fun b!1337619 () Bool)

(declare-fun e!761660 () Bool)

(declare-fun e!761662 () Bool)

(assert (=> b!1337619 (= e!761660 e!761662)))

(declare-fun c!126125 () Bool)

(assert (=> b!1337619 (= c!126125 (validKeyInArray!0 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1337620 () Bool)

(declare-fun call!64945 () Bool)

(assert (=> b!1337620 (= e!761662 call!64945)))

(declare-fun d!143787 () Bool)

(declare-fun res!887607 () Bool)

(declare-fun e!761661 () Bool)

(assert (=> d!143787 (=> res!887607 e!761661)))

(assert (=> d!143787 (= res!887607 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44399 _keys!1590)))))

(assert (=> d!143787 (= (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126082 (Cons!31070 (select (arr!43849 _keys!1590) #b00000000000000000000000000000000) Nil!31071) Nil!31071)) e!761661)))

(declare-fun b!1337621 () Bool)

(assert (=> b!1337621 (= e!761661 e!761660)))

(declare-fun res!887608 () Bool)

(assert (=> b!1337621 (=> (not res!887608) (not e!761660))))

(declare-fun e!761663 () Bool)

(assert (=> b!1337621 (= res!887608 (not e!761663))))

(declare-fun res!887609 () Bool)

(assert (=> b!1337621 (=> (not res!887609) (not e!761663))))

(assert (=> b!1337621 (= res!887609 (validKeyInArray!0 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!64942 () Bool)

(assert (=> bm!64942 (= call!64945 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!126125 (Cons!31070 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!126082 (Cons!31070 (select (arr!43849 _keys!1590) #b00000000000000000000000000000000) Nil!31071) Nil!31071)) (ite c!126082 (Cons!31070 (select (arr!43849 _keys!1590) #b00000000000000000000000000000000) Nil!31071) Nil!31071))))))

(declare-fun b!1337622 () Bool)

(assert (=> b!1337622 (= e!761663 (contains!8979 (ite c!126082 (Cons!31070 (select (arr!43849 _keys!1590) #b00000000000000000000000000000000) Nil!31071) Nil!31071) (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1337623 () Bool)

(assert (=> b!1337623 (= e!761662 call!64945)))

(assert (= (and d!143787 (not res!887607)) b!1337621))

(assert (= (and b!1337621 res!887609) b!1337622))

(assert (= (and b!1337621 res!887608) b!1337619))

(assert (= (and b!1337619 c!126125) b!1337620))

(assert (= (and b!1337619 (not c!126125)) b!1337623))

(assert (= (or b!1337620 b!1337623) bm!64942))

(declare-fun m!1225649 () Bool)

(assert (=> b!1337619 m!1225649))

(assert (=> b!1337619 m!1225649))

(declare-fun m!1225651 () Bool)

(assert (=> b!1337619 m!1225651))

(assert (=> b!1337621 m!1225649))

(assert (=> b!1337621 m!1225649))

(assert (=> b!1337621 m!1225651))

(assert (=> bm!64942 m!1225649))

(declare-fun m!1225653 () Bool)

(assert (=> bm!64942 m!1225653))

(assert (=> b!1337622 m!1225649))

(assert (=> b!1337622 m!1225649))

(declare-fun m!1225655 () Bool)

(assert (=> b!1337622 m!1225655))

(assert (=> bm!64926 d!143787))

(declare-fun d!143789 () Bool)

(assert (=> d!143789 (= (validKeyInArray!0 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (and (not (= (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1337531 d!143789))

(declare-fun d!143791 () Bool)

(declare-fun e!761665 () Bool)

(assert (=> d!143791 e!761665))

(declare-fun res!887610 () Bool)

(assert (=> d!143791 (=> res!887610 e!761665)))

(declare-fun lt!593240 () Bool)

(assert (=> d!143791 (= res!887610 (not lt!593240))))

(declare-fun lt!593241 () Bool)

(assert (=> d!143791 (= lt!593240 lt!593241)))

(declare-fun lt!593239 () Unit!43947)

(declare-fun e!761664 () Unit!43947)

(assert (=> d!143791 (= lt!593239 e!761664)))

(declare-fun c!126126 () Bool)

(assert (=> d!143791 (= c!126126 lt!593241)))

(assert (=> d!143791 (= lt!593241 (containsKey!739 (toList!10810 lt!593146) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143791 (= (contains!8977 lt!593146 #b1000000000000000000000000000000000000000000000000000000000000000) lt!593240)))

(declare-fun b!1337624 () Bool)

(declare-fun lt!593238 () Unit!43947)

(assert (=> b!1337624 (= e!761664 lt!593238)))

(assert (=> b!1337624 (= lt!593238 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10810 lt!593146) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1337624 (isDefined!524 (getValueByKey!717 (toList!10810 lt!593146) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337625 () Bool)

(declare-fun Unit!43955 () Unit!43947)

(assert (=> b!1337625 (= e!761664 Unit!43955)))

(declare-fun b!1337626 () Bool)

(assert (=> b!1337626 (= e!761665 (isDefined!524 (getValueByKey!717 (toList!10810 lt!593146) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143791 c!126126) b!1337624))

(assert (= (and d!143791 (not c!126126)) b!1337625))

(assert (= (and d!143791 (not res!887610)) b!1337626))

(declare-fun m!1225657 () Bool)

(assert (=> d!143791 m!1225657))

(declare-fun m!1225659 () Bool)

(assert (=> b!1337624 m!1225659))

(assert (=> b!1337624 m!1225633))

(assert (=> b!1337624 m!1225633))

(declare-fun m!1225661 () Bool)

(assert (=> b!1337624 m!1225661))

(assert (=> b!1337626 m!1225633))

(assert (=> b!1337626 m!1225633))

(assert (=> b!1337626 m!1225661))

(assert (=> bm!64919 d!143791))

(declare-fun d!143793 () Bool)

(assert (=> d!143793 (= (apply!1034 lt!593208 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22133 (getValueByKey!717 (toList!10810 lt!593208) (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))))

(declare-fun bs!38298 () Bool)

(assert (= bs!38298 d!143793))

(assert (=> bs!38298 m!1225553))

(declare-fun m!1225663 () Bool)

(assert (=> bs!38298 m!1225663))

(assert (=> bs!38298 m!1225663))

(declare-fun m!1225665 () Bool)

(assert (=> bs!38298 m!1225665))

(assert (=> b!1337532 d!143793))

(declare-fun d!143795 () Bool)

(declare-fun c!126127 () Bool)

(assert (=> d!143795 (= c!126127 ((_ is ValueCellFull!17580) (select (arr!43850 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun e!761666 () V!54379)

(assert (=> d!143795 (= (get!22129 (select (arr!43850 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!761666)))

(declare-fun b!1337627 () Bool)

(assert (=> b!1337627 (= e!761666 (get!22131 (select (arr!43850 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1337628 () Bool)

(assert (=> b!1337628 (= e!761666 (get!22132 (select (arr!43850 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143795 c!126127) b!1337627))

(assert (= (and d!143795 (not c!126127)) b!1337628))

(assert (=> b!1337627 m!1225555))

(assert (=> b!1337627 m!1225401))

(declare-fun m!1225667 () Bool)

(assert (=> b!1337627 m!1225667))

(assert (=> b!1337628 m!1225555))

(assert (=> b!1337628 m!1225401))

(declare-fun m!1225669 () Bool)

(assert (=> b!1337628 m!1225669))

(assert (=> b!1337532 d!143795))

(declare-fun b!1337629 () Bool)

(declare-fun e!761671 () ListLongMap!21589)

(assert (=> b!1337629 (= e!761671 (ListLongMap!21590 Nil!31072))))

(declare-fun d!143797 () Bool)

(declare-fun e!761673 () Bool)

(assert (=> d!143797 e!761673))

(declare-fun res!887614 () Bool)

(assert (=> d!143797 (=> (not res!887614) (not e!761673))))

(declare-fun lt!593244 () ListLongMap!21589)

(assert (=> d!143797 (= res!887614 (not (contains!8977 lt!593244 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!143797 (= lt!593244 e!761671)))

(declare-fun c!126129 () Bool)

(assert (=> d!143797 (= c!126129 (bvsge from!1980 (size!44399 _keys!1590)))))

(assert (=> d!143797 (validMask!0 mask!1998)))

(assert (=> d!143797 (= (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!593244)))

(declare-fun b!1337630 () Bool)

(declare-fun e!761668 () ListLongMap!21589)

(assert (=> b!1337630 (= e!761671 e!761668)))

(declare-fun c!126130 () Bool)

(assert (=> b!1337630 (= c!126130 (validKeyInArray!0 (select (arr!43849 _keys!1590) from!1980)))))

(declare-fun b!1337631 () Bool)

(declare-fun e!761669 () Bool)

(declare-fun e!761667 () Bool)

(assert (=> b!1337631 (= e!761669 e!761667)))

(assert (=> b!1337631 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44399 _keys!1590)))))

(declare-fun res!887611 () Bool)

(assert (=> b!1337631 (= res!887611 (contains!8977 lt!593244 (select (arr!43849 _keys!1590) from!1980)))))

(assert (=> b!1337631 (=> (not res!887611) (not e!761667))))

(declare-fun b!1337632 () Bool)

(declare-fun e!761670 () Bool)

(assert (=> b!1337632 (= e!761669 e!761670)))

(declare-fun c!126131 () Bool)

(assert (=> b!1337632 (= c!126131 (bvslt from!1980 (size!44399 _keys!1590)))))

(declare-fun bm!64943 () Bool)

(declare-fun call!64946 () ListLongMap!21589)

(assert (=> bm!64943 (= call!64946 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1337633 () Bool)

(declare-fun lt!593248 () Unit!43947)

(declare-fun lt!593245 () Unit!43947)

(assert (=> b!1337633 (= lt!593248 lt!593245)))

(declare-fun lt!593247 () (_ BitVec 64))

(declare-fun lt!593243 () (_ BitVec 64))

(declare-fun lt!593246 () ListLongMap!21589)

(declare-fun lt!593242 () V!54379)

(assert (=> b!1337633 (not (contains!8977 (+!4746 lt!593246 (tuple2!23933 lt!593243 lt!593242)) lt!593247))))

(assert (=> b!1337633 (= lt!593245 (addStillNotContains!498 lt!593246 lt!593243 lt!593242 lt!593247))))

(assert (=> b!1337633 (= lt!593247 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1337633 (= lt!593242 (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1337633 (= lt!593243 (select (arr!43849 _keys!1590) from!1980))))

(assert (=> b!1337633 (= lt!593246 call!64946)))

(assert (=> b!1337633 (= e!761668 (+!4746 call!64946 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1337634 () Bool)

(assert (=> b!1337634 (= e!761670 (isEmpty!1085 lt!593244))))

(declare-fun b!1337635 () Bool)

(declare-fun res!887613 () Bool)

(assert (=> b!1337635 (=> (not res!887613) (not e!761673))))

(assert (=> b!1337635 (= res!887613 (not (contains!8977 lt!593244 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1337636 () Bool)

(assert (=> b!1337636 (= e!761673 e!761669)))

(declare-fun c!126128 () Bool)

(declare-fun e!761672 () Bool)

(assert (=> b!1337636 (= c!126128 e!761672)))

(declare-fun res!887612 () Bool)

(assert (=> b!1337636 (=> (not res!887612) (not e!761672))))

(assert (=> b!1337636 (= res!887612 (bvslt from!1980 (size!44399 _keys!1590)))))

(declare-fun b!1337637 () Bool)

(assert (=> b!1337637 (= e!761670 (= lt!593244 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1337638 () Bool)

(assert (=> b!1337638 (= e!761668 call!64946)))

(declare-fun b!1337639 () Bool)

(assert (=> b!1337639 (= e!761672 (validKeyInArray!0 (select (arr!43849 _keys!1590) from!1980)))))

(assert (=> b!1337639 (bvsge from!1980 #b00000000000000000000000000000000)))

(declare-fun b!1337640 () Bool)

(assert (=> b!1337640 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44399 _keys!1590)))))

(assert (=> b!1337640 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44400 _values!1320)))))

(assert (=> b!1337640 (= e!761667 (= (apply!1034 lt!593244 (select (arr!43849 _keys!1590) from!1980)) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!143797 c!126129) b!1337629))

(assert (= (and d!143797 (not c!126129)) b!1337630))

(assert (= (and b!1337630 c!126130) b!1337633))

(assert (= (and b!1337630 (not c!126130)) b!1337638))

(assert (= (or b!1337633 b!1337638) bm!64943))

(assert (= (and d!143797 res!887614) b!1337635))

(assert (= (and b!1337635 res!887613) b!1337636))

(assert (= (and b!1337636 res!887612) b!1337639))

(assert (= (and b!1337636 c!126128) b!1337631))

(assert (= (and b!1337636 (not c!126128)) b!1337632))

(assert (= (and b!1337631 res!887611) b!1337640))

(assert (= (and b!1337632 c!126131) b!1337637))

(assert (= (and b!1337632 (not c!126131)) b!1337634))

(declare-fun b_lambda!24229 () Bool)

(assert (=> (not b_lambda!24229) (not b!1337633)))

(assert (=> b!1337633 t!45389))

(declare-fun b_and!50041 () Bool)

(assert (= b_and!50039 (and (=> t!45389 result!25313) b_and!50041)))

(declare-fun b_lambda!24231 () Bool)

(assert (=> (not b_lambda!24231) (not b!1337640)))

(assert (=> b!1337640 t!45389))

(declare-fun b_and!50043 () Bool)

(assert (= b_and!50041 (and (=> t!45389 result!25313) b_and!50043)))

(declare-fun m!1225671 () Bool)

(assert (=> d!143797 m!1225671))

(assert (=> d!143797 m!1225387))

(declare-fun m!1225673 () Bool)

(assert (=> b!1337637 m!1225673))

(declare-fun m!1225675 () Bool)

(assert (=> b!1337633 m!1225675))

(declare-fun m!1225677 () Bool)

(assert (=> b!1337633 m!1225677))

(declare-fun m!1225679 () Bool)

(assert (=> b!1337633 m!1225679))

(assert (=> b!1337633 m!1225393))

(assert (=> b!1337633 m!1225407))

(assert (=> b!1337633 m!1225401))

(assert (=> b!1337633 m!1225409))

(assert (=> b!1337633 m!1225401))

(assert (=> b!1337633 m!1225407))

(declare-fun m!1225681 () Bool)

(assert (=> b!1337633 m!1225681))

(assert (=> b!1337633 m!1225675))

(assert (=> b!1337631 m!1225393))

(assert (=> b!1337631 m!1225393))

(declare-fun m!1225683 () Bool)

(assert (=> b!1337631 m!1225683))

(assert (=> b!1337640 m!1225407))

(assert (=> b!1337640 m!1225401))

(assert (=> b!1337640 m!1225409))

(assert (=> b!1337640 m!1225401))

(assert (=> b!1337640 m!1225407))

(assert (=> b!1337640 m!1225393))

(declare-fun m!1225685 () Bool)

(assert (=> b!1337640 m!1225685))

(assert (=> b!1337640 m!1225393))

(declare-fun m!1225687 () Bool)

(assert (=> b!1337634 m!1225687))

(assert (=> b!1337639 m!1225393))

(assert (=> b!1337639 m!1225393))

(assert (=> b!1337639 m!1225395))

(declare-fun m!1225689 () Bool)

(assert (=> b!1337635 m!1225689))

(assert (=> b!1337630 m!1225393))

(assert (=> b!1337630 m!1225393))

(assert (=> b!1337630 m!1225395))

(assert (=> bm!64943 m!1225673))

(assert (=> bm!64918 d!143797))

(declare-fun d!143799 () Bool)

(declare-fun lt!593251 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!659 (List!31074) (InoxSet (_ BitVec 64)))

(assert (=> d!143799 (= lt!593251 (select (content!659 Nil!31071) (select (arr!43849 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun e!761679 () Bool)

(assert (=> d!143799 (= lt!593251 e!761679)))

(declare-fun res!887619 () Bool)

(assert (=> d!143799 (=> (not res!887619) (not e!761679))))

(assert (=> d!143799 (= res!887619 ((_ is Cons!31070) Nil!31071))))

(assert (=> d!143799 (= (contains!8979 Nil!31071 (select (arr!43849 _keys!1590) #b00000000000000000000000000000000)) lt!593251)))

(declare-fun b!1337645 () Bool)

(declare-fun e!761678 () Bool)

(assert (=> b!1337645 (= e!761679 e!761678)))

(declare-fun res!887620 () Bool)

(assert (=> b!1337645 (=> res!887620 e!761678)))

(assert (=> b!1337645 (= res!887620 (= (h!32279 Nil!31071) (select (arr!43849 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1337646 () Bool)

(assert (=> b!1337646 (= e!761678 (contains!8979 (t!45390 Nil!31071) (select (arr!43849 _keys!1590) #b00000000000000000000000000000000)))))

(assert (= (and d!143799 res!887619) b!1337645))

(assert (= (and b!1337645 (not res!887620)) b!1337646))

(declare-fun m!1225691 () Bool)

(assert (=> d!143799 m!1225691))

(assert (=> d!143799 m!1225507))

(declare-fun m!1225693 () Bool)

(assert (=> d!143799 m!1225693))

(assert (=> b!1337646 m!1225507))

(declare-fun m!1225695 () Bool)

(assert (=> b!1337646 m!1225695))

(assert (=> b!1337474 d!143799))

(declare-fun d!143801 () Bool)

(assert (=> d!143801 (= (isDefined!524 (getValueByKey!717 (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153)) (not (isEmpty!1086 (getValueByKey!717 (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153))))))

(declare-fun bs!38299 () Bool)

(assert (= bs!38299 d!143801))

(assert (=> bs!38299 m!1225527))

(declare-fun m!1225697 () Bool)

(assert (=> bs!38299 m!1225697))

(assert (=> b!1337490 d!143801))

(declare-fun b!1337647 () Bool)

(declare-fun e!761680 () Option!769)

(assert (=> b!1337647 (= e!761680 (Some!768 (_2!11977 (h!32280 (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun b!1337650 () Bool)

(declare-fun e!761681 () Option!769)

(assert (=> b!1337650 (= e!761681 None!767)))

(declare-fun b!1337648 () Bool)

(assert (=> b!1337648 (= e!761680 e!761681)))

(declare-fun c!126133 () Bool)

(assert (=> b!1337648 (= c!126133 (and ((_ is Cons!31071) (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (not (= (_1!11977 (h!32280 (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1153))))))

(declare-fun b!1337649 () Bool)

(assert (=> b!1337649 (= e!761681 (getValueByKey!717 (t!45391 (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) k0!1153))))

(declare-fun c!126132 () Bool)

(declare-fun d!143803 () Bool)

(assert (=> d!143803 (= c!126132 (and ((_ is Cons!31071) (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (= (_1!11977 (h!32280 (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1153)))))

(assert (=> d!143803 (= (getValueByKey!717 (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153) e!761680)))

(assert (= (and d!143803 c!126132) b!1337647))

(assert (= (and d!143803 (not c!126132)) b!1337648))

(assert (= (and b!1337648 c!126133) b!1337649))

(assert (= (and b!1337648 (not c!126133)) b!1337650))

(declare-fun m!1225699 () Bool)

(assert (=> b!1337649 m!1225699))

(assert (=> b!1337490 d!143803))

(declare-fun b!1337651 () Bool)

(declare-fun e!761686 () ListLongMap!21589)

(assert (=> b!1337651 (= e!761686 (ListLongMap!21590 Nil!31072))))

(declare-fun d!143805 () Bool)

(declare-fun e!761688 () Bool)

(assert (=> d!143805 e!761688))

(declare-fun res!887624 () Bool)

(assert (=> d!143805 (=> (not res!887624) (not e!761688))))

(declare-fun lt!593254 () ListLongMap!21589)

(assert (=> d!143805 (= res!887624 (not (contains!8977 lt!593254 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!143805 (= lt!593254 e!761686)))

(declare-fun c!126135 () Bool)

(assert (=> d!143805 (= c!126135 (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44399 _keys!1590)))))

(assert (=> d!143805 (validMask!0 mask!1998)))

(assert (=> d!143805 (= (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323) lt!593254)))

(declare-fun b!1337652 () Bool)

(declare-fun e!761683 () ListLongMap!21589)

(assert (=> b!1337652 (= e!761686 e!761683)))

(declare-fun c!126136 () Bool)

(assert (=> b!1337652 (= c!126136 (validKeyInArray!0 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))))))

(declare-fun b!1337653 () Bool)

(declare-fun e!761684 () Bool)

(declare-fun e!761682 () Bool)

(assert (=> b!1337653 (= e!761684 e!761682)))

(assert (=> b!1337653 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44399 _keys!1590)))))

(declare-fun res!887621 () Bool)

(assert (=> b!1337653 (= res!887621 (contains!8977 lt!593254 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))))))

(assert (=> b!1337653 (=> (not res!887621) (not e!761682))))

(declare-fun b!1337654 () Bool)

(declare-fun e!761685 () Bool)

(assert (=> b!1337654 (= e!761684 e!761685)))

(declare-fun c!126137 () Bool)

(assert (=> b!1337654 (= c!126137 (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44399 _keys!1590)))))

(declare-fun call!64947 () ListLongMap!21589)

(declare-fun bm!64944 () Bool)

(assert (=> bm!64944 (= call!64947 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1337655 () Bool)

(declare-fun lt!593258 () Unit!43947)

(declare-fun lt!593255 () Unit!43947)

(assert (=> b!1337655 (= lt!593258 lt!593255)))

(declare-fun lt!593257 () (_ BitVec 64))

(declare-fun lt!593252 () V!54379)

(declare-fun lt!593256 () ListLongMap!21589)

(declare-fun lt!593253 () (_ BitVec 64))

(assert (=> b!1337655 (not (contains!8977 (+!4746 lt!593256 (tuple2!23933 lt!593253 lt!593252)) lt!593257))))

(assert (=> b!1337655 (= lt!593255 (addStillNotContains!498 lt!593256 lt!593253 lt!593252 lt!593257))))

(assert (=> b!1337655 (= lt!593257 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1337655 (= lt!593252 (get!22129 (select (arr!43850 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1337655 (= lt!593253 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)))))

(assert (=> b!1337655 (= lt!593256 call!64947)))

(assert (=> b!1337655 (= e!761683 (+!4746 call!64947 (tuple2!23933 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (get!22129 (select (arr!43850 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1337656 () Bool)

(assert (=> b!1337656 (= e!761685 (isEmpty!1085 lt!593254))))

(declare-fun b!1337657 () Bool)

(declare-fun res!887623 () Bool)

(assert (=> b!1337657 (=> (not res!887623) (not e!761688))))

(assert (=> b!1337657 (= res!887623 (not (contains!8977 lt!593254 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1337658 () Bool)

(assert (=> b!1337658 (= e!761688 e!761684)))

(declare-fun c!126134 () Bool)

(declare-fun e!761687 () Bool)

(assert (=> b!1337658 (= c!126134 e!761687)))

(declare-fun res!887622 () Bool)

(assert (=> b!1337658 (=> (not res!887622) (not e!761687))))

(assert (=> b!1337658 (= res!887622 (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44399 _keys!1590)))))

(declare-fun b!1337659 () Bool)

(assert (=> b!1337659 (= e!761685 (= lt!593254 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1337660 () Bool)

(assert (=> b!1337660 (= e!761683 call!64947)))

(declare-fun b!1337661 () Bool)

(assert (=> b!1337661 (= e!761687 (validKeyInArray!0 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))))))

(assert (=> b!1337661 (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1337662 () Bool)

(assert (=> b!1337662 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44399 _keys!1590)))))

(assert (=> b!1337662 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44400 _values!1320)))))

(assert (=> b!1337662 (= e!761682 (= (apply!1034 lt!593254 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))) (get!22129 (select (arr!43850 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!143805 c!126135) b!1337651))

(assert (= (and d!143805 (not c!126135)) b!1337652))

(assert (= (and b!1337652 c!126136) b!1337655))

(assert (= (and b!1337652 (not c!126136)) b!1337660))

(assert (= (or b!1337655 b!1337660) bm!64944))

(assert (= (and d!143805 res!887624) b!1337657))

(assert (= (and b!1337657 res!887623) b!1337658))

(assert (= (and b!1337658 res!887622) b!1337661))

(assert (= (and b!1337658 c!126134) b!1337653))

(assert (= (and b!1337658 (not c!126134)) b!1337654))

(assert (= (and b!1337653 res!887621) b!1337662))

(assert (= (and b!1337654 c!126137) b!1337659))

(assert (= (and b!1337654 (not c!126137)) b!1337656))

(declare-fun b_lambda!24233 () Bool)

(assert (=> (not b_lambda!24233) (not b!1337655)))

(assert (=> b!1337655 t!45389))

(declare-fun b_and!50045 () Bool)

(assert (= b_and!50043 (and (=> t!45389 result!25313) b_and!50045)))

(declare-fun b_lambda!24235 () Bool)

(assert (=> (not b_lambda!24235) (not b!1337662)))

(assert (=> b!1337662 t!45389))

(declare-fun b_and!50047 () Bool)

(assert (= b_and!50045 (and (=> t!45389 result!25313) b_and!50047)))

(declare-fun m!1225701 () Bool)

(assert (=> d!143805 m!1225701))

(assert (=> d!143805 m!1225387))

(declare-fun m!1225703 () Bool)

(assert (=> b!1337659 m!1225703))

(declare-fun m!1225705 () Bool)

(assert (=> b!1337655 m!1225705))

(declare-fun m!1225707 () Bool)

(assert (=> b!1337655 m!1225707))

(declare-fun m!1225709 () Bool)

(assert (=> b!1337655 m!1225709))

(declare-fun m!1225711 () Bool)

(assert (=> b!1337655 m!1225711))

(declare-fun m!1225713 () Bool)

(assert (=> b!1337655 m!1225713))

(assert (=> b!1337655 m!1225401))

(declare-fun m!1225715 () Bool)

(assert (=> b!1337655 m!1225715))

(assert (=> b!1337655 m!1225401))

(assert (=> b!1337655 m!1225713))

(declare-fun m!1225717 () Bool)

(assert (=> b!1337655 m!1225717))

(assert (=> b!1337655 m!1225705))

(assert (=> b!1337653 m!1225711))

(assert (=> b!1337653 m!1225711))

(declare-fun m!1225719 () Bool)

(assert (=> b!1337653 m!1225719))

(assert (=> b!1337662 m!1225713))

(assert (=> b!1337662 m!1225401))

(assert (=> b!1337662 m!1225715))

(assert (=> b!1337662 m!1225401))

(assert (=> b!1337662 m!1225713))

(assert (=> b!1337662 m!1225711))

(declare-fun m!1225721 () Bool)

(assert (=> b!1337662 m!1225721))

(assert (=> b!1337662 m!1225711))

(declare-fun m!1225723 () Bool)

(assert (=> b!1337656 m!1225723))

(assert (=> b!1337661 m!1225711))

(assert (=> b!1337661 m!1225711))

(declare-fun m!1225725 () Bool)

(assert (=> b!1337661 m!1225725))

(declare-fun m!1225727 () Bool)

(assert (=> b!1337657 m!1225727))

(assert (=> b!1337652 m!1225711))

(assert (=> b!1337652 m!1225711))

(assert (=> b!1337652 m!1225725))

(assert (=> bm!64944 m!1225703))

(assert (=> b!1337529 d!143805))

(declare-fun d!143807 () Bool)

(assert (=> d!143807 (arrayContainsKey!0 _keys!1590 lt!593175 #b00000000000000000000000000000000)))

(declare-fun lt!593261 () Unit!43947)

(declare-fun choose!13 (array!90770 (_ BitVec 64) (_ BitVec 32)) Unit!43947)

(assert (=> d!143807 (= lt!593261 (choose!13 _keys!1590 lt!593175 #b00000000000000000000000000000000))))

(assert (=> d!143807 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!143807 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!593175 #b00000000000000000000000000000000) lt!593261)))

(declare-fun bs!38300 () Bool)

(assert (= bs!38300 d!143807))

(assert (=> bs!38300 m!1225519))

(declare-fun m!1225729 () Bool)

(assert (=> bs!38300 m!1225729))

(assert (=> b!1337486 d!143807))

(declare-fun d!143809 () Bool)

(declare-fun res!887629 () Bool)

(declare-fun e!761693 () Bool)

(assert (=> d!143809 (=> res!887629 e!761693)))

(assert (=> d!143809 (= res!887629 (= (select (arr!43849 _keys!1590) #b00000000000000000000000000000000) lt!593175))))

(assert (=> d!143809 (= (arrayContainsKey!0 _keys!1590 lt!593175 #b00000000000000000000000000000000) e!761693)))

(declare-fun b!1337667 () Bool)

(declare-fun e!761694 () Bool)

(assert (=> b!1337667 (= e!761693 e!761694)))

(declare-fun res!887630 () Bool)

(assert (=> b!1337667 (=> (not res!887630) (not e!761694))))

(assert (=> b!1337667 (= res!887630 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44399 _keys!1590)))))

(declare-fun b!1337668 () Bool)

(assert (=> b!1337668 (= e!761694 (arrayContainsKey!0 _keys!1590 lt!593175 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!143809 (not res!887629)) b!1337667))

(assert (= (and b!1337667 res!887630) b!1337668))

(assert (=> d!143809 m!1225507))

(declare-fun m!1225731 () Bool)

(assert (=> b!1337668 m!1225731))

(assert (=> b!1337486 d!143809))

(declare-fun b!1337681 () Bool)

(declare-fun e!761703 () SeekEntryResult!10049)

(declare-fun lt!593270 () SeekEntryResult!10049)

(assert (=> b!1337681 (= e!761703 (MissingZero!10049 (index!42569 lt!593270)))))

(declare-fun b!1337682 () Bool)

(declare-fun c!126146 () Bool)

(declare-fun lt!593269 () (_ BitVec 64))

(assert (=> b!1337682 (= c!126146 (= lt!593269 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!761702 () SeekEntryResult!10049)

(assert (=> b!1337682 (= e!761702 e!761703)))

(declare-fun b!1337683 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!90770 (_ BitVec 32)) SeekEntryResult!10049)

(assert (=> b!1337683 (= e!761703 (seekKeyOrZeroReturnVacant!0 (x!119482 lt!593270) (index!42569 lt!593270) (index!42569 lt!593270) (select (arr!43849 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998))))

(declare-fun b!1337684 () Bool)

(declare-fun e!761701 () SeekEntryResult!10049)

(assert (=> b!1337684 (= e!761701 e!761702)))

(assert (=> b!1337684 (= lt!593269 (select (arr!43849 _keys!1590) (index!42569 lt!593270)))))

(declare-fun c!126145 () Bool)

(assert (=> b!1337684 (= c!126145 (= lt!593269 (select (arr!43849 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1337685 () Bool)

(assert (=> b!1337685 (= e!761702 (Found!10049 (index!42569 lt!593270)))))

(declare-fun b!1337686 () Bool)

(assert (=> b!1337686 (= e!761701 Undefined!10049)))

(declare-fun d!143811 () Bool)

(declare-fun lt!593268 () SeekEntryResult!10049)

(assert (=> d!143811 (and (or ((_ is Undefined!10049) lt!593268) (not ((_ is Found!10049) lt!593268)) (and (bvsge (index!42568 lt!593268) #b00000000000000000000000000000000) (bvslt (index!42568 lt!593268) (size!44399 _keys!1590)))) (or ((_ is Undefined!10049) lt!593268) ((_ is Found!10049) lt!593268) (not ((_ is MissingZero!10049) lt!593268)) (and (bvsge (index!42567 lt!593268) #b00000000000000000000000000000000) (bvslt (index!42567 lt!593268) (size!44399 _keys!1590)))) (or ((_ is Undefined!10049) lt!593268) ((_ is Found!10049) lt!593268) ((_ is MissingZero!10049) lt!593268) (not ((_ is MissingVacant!10049) lt!593268)) (and (bvsge (index!42570 lt!593268) #b00000000000000000000000000000000) (bvslt (index!42570 lt!593268) (size!44399 _keys!1590)))) (or ((_ is Undefined!10049) lt!593268) (ite ((_ is Found!10049) lt!593268) (= (select (arr!43849 _keys!1590) (index!42568 lt!593268)) (select (arr!43849 _keys!1590) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10049) lt!593268) (= (select (arr!43849 _keys!1590) (index!42567 lt!593268)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10049) lt!593268) (= (select (arr!43849 _keys!1590) (index!42570 lt!593268)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143811 (= lt!593268 e!761701)))

(declare-fun c!126144 () Bool)

(assert (=> d!143811 (= c!126144 (and ((_ is Intermediate!10049) lt!593270) (undefined!10861 lt!593270)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!90770 (_ BitVec 32)) SeekEntryResult!10049)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!143811 (= lt!593270 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!43849 _keys!1590) #b00000000000000000000000000000000) mask!1998) (select (arr!43849 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998))))

(assert (=> d!143811 (validMask!0 mask!1998)))

(assert (=> d!143811 (= (seekEntryOrOpen!0 (select (arr!43849 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) lt!593268)))

(assert (= (and d!143811 c!126144) b!1337686))

(assert (= (and d!143811 (not c!126144)) b!1337684))

(assert (= (and b!1337684 c!126145) b!1337685))

(assert (= (and b!1337684 (not c!126145)) b!1337682))

(assert (= (and b!1337682 c!126146) b!1337681))

(assert (= (and b!1337682 (not c!126146)) b!1337683))

(assert (=> b!1337683 m!1225507))

(declare-fun m!1225733 () Bool)

(assert (=> b!1337683 m!1225733))

(declare-fun m!1225735 () Bool)

(assert (=> b!1337684 m!1225735))

(assert (=> d!143811 m!1225507))

(declare-fun m!1225737 () Bool)

(assert (=> d!143811 m!1225737))

(declare-fun m!1225739 () Bool)

(assert (=> d!143811 m!1225739))

(declare-fun m!1225741 () Bool)

(assert (=> d!143811 m!1225741))

(assert (=> d!143811 m!1225387))

(assert (=> d!143811 m!1225737))

(assert (=> d!143811 m!1225507))

(declare-fun m!1225743 () Bool)

(assert (=> d!143811 m!1225743))

(declare-fun m!1225745 () Bool)

(assert (=> d!143811 m!1225745))

(assert (=> b!1337486 d!143811))

(declare-fun d!143813 () Bool)

(assert (=> d!143813 (= (validKeyInArray!0 (select (arr!43849 _keys!1590) #b00000000000000000000000000000000)) (and (not (= (select (arr!43849 _keys!1590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43849 _keys!1590) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1337471 d!143813))

(declare-fun d!143815 () Bool)

(declare-fun e!761704 () Bool)

(assert (=> d!143815 e!761704))

(declare-fun res!887631 () Bool)

(assert (=> d!143815 (=> (not res!887631) (not e!761704))))

(declare-fun lt!593274 () ListLongMap!21589)

(assert (=> d!143815 (= res!887631 (contains!8977 lt!593274 (_1!11977 (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lt!593272 () List!31075)

(assert (=> d!143815 (= lt!593274 (ListLongMap!21590 lt!593272))))

(declare-fun lt!593273 () Unit!43947)

(declare-fun lt!593271 () Unit!43947)

(assert (=> d!143815 (= lt!593273 lt!593271)))

(assert (=> d!143815 (= (getValueByKey!717 lt!593272 (_1!11977 (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!768 (_2!11977 (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143815 (= lt!593271 (lemmaContainsTupThenGetReturnValue!362 lt!593272 (_1!11977 (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11977 (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143815 (= lt!593272 (insertStrictlySorted!491 (toList!10810 call!64920) (_1!11977 (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11977 (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143815 (= (+!4746 call!64920 (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) lt!593274)))

(declare-fun b!1337687 () Bool)

(declare-fun res!887632 () Bool)

(assert (=> b!1337687 (=> (not res!887632) (not e!761704))))

(assert (=> b!1337687 (= res!887632 (= (getValueByKey!717 (toList!10810 lt!593274) (_1!11977 (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!768 (_2!11977 (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1337688 () Bool)

(assert (=> b!1337688 (= e!761704 (contains!8980 (toList!10810 lt!593274) (tuple2!23933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(assert (= (and d!143815 res!887631) b!1337687))

(assert (= (and b!1337687 res!887632) b!1337688))

(declare-fun m!1225747 () Bool)

(assert (=> d!143815 m!1225747))

(declare-fun m!1225749 () Bool)

(assert (=> d!143815 m!1225749))

(declare-fun m!1225751 () Bool)

(assert (=> d!143815 m!1225751))

(declare-fun m!1225753 () Bool)

(assert (=> d!143815 m!1225753))

(declare-fun m!1225755 () Bool)

(assert (=> b!1337687 m!1225755))

(declare-fun m!1225757 () Bool)

(assert (=> b!1337688 m!1225757))

(assert (=> b!1337440 d!143815))

(assert (=> b!1337473 d!143813))

(declare-fun d!143817 () Bool)

(declare-fun e!761706 () Bool)

(assert (=> d!143817 e!761706))

(declare-fun res!887633 () Bool)

(assert (=> d!143817 (=> res!887633 e!761706)))

(declare-fun lt!593277 () Bool)

(assert (=> d!143817 (= res!887633 (not lt!593277))))

(declare-fun lt!593278 () Bool)

(assert (=> d!143817 (= lt!593277 lt!593278)))

(declare-fun lt!593276 () Unit!43947)

(declare-fun e!761705 () Unit!43947)

(assert (=> d!143817 (= lt!593276 e!761705)))

(declare-fun c!126147 () Bool)

(assert (=> d!143817 (= c!126147 lt!593278)))

(assert (=> d!143817 (= lt!593278 (containsKey!739 (toList!10810 lt!593146) (select (arr!43849 _keys!1590) from!1980)))))

(assert (=> d!143817 (= (contains!8977 lt!593146 (select (arr!43849 _keys!1590) from!1980)) lt!593277)))

(declare-fun b!1337689 () Bool)

(declare-fun lt!593275 () Unit!43947)

(assert (=> b!1337689 (= e!761705 lt!593275)))

(assert (=> b!1337689 (= lt!593275 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10810 lt!593146) (select (arr!43849 _keys!1590) from!1980)))))

(assert (=> b!1337689 (isDefined!524 (getValueByKey!717 (toList!10810 lt!593146) (select (arr!43849 _keys!1590) from!1980)))))

(declare-fun b!1337690 () Bool)

(declare-fun Unit!43956 () Unit!43947)

(assert (=> b!1337690 (= e!761705 Unit!43956)))

(declare-fun b!1337691 () Bool)

(assert (=> b!1337691 (= e!761706 (isDefined!524 (getValueByKey!717 (toList!10810 lt!593146) (select (arr!43849 _keys!1590) from!1980))))))

(assert (= (and d!143817 c!126147) b!1337689))

(assert (= (and d!143817 (not c!126147)) b!1337690))

(assert (= (and d!143817 (not res!887633)) b!1337691))

(assert (=> d!143817 m!1225393))

(declare-fun m!1225759 () Bool)

(assert (=> d!143817 m!1225759))

(assert (=> b!1337689 m!1225393))

(declare-fun m!1225761 () Bool)

(assert (=> b!1337689 m!1225761))

(assert (=> b!1337689 m!1225393))

(declare-fun m!1225763 () Bool)

(assert (=> b!1337689 m!1225763))

(assert (=> b!1337689 m!1225763))

(declare-fun m!1225765 () Bool)

(assert (=> b!1337689 m!1225765))

(assert (=> b!1337691 m!1225393))

(assert (=> b!1337691 m!1225763))

(assert (=> b!1337691 m!1225763))

(assert (=> b!1337691 m!1225765))

(assert (=> b!1337456 d!143817))

(assert (=> b!1337485 d!143813))

(declare-fun b!1337692 () Bool)

(declare-fun e!761707 () Option!769)

(assert (=> b!1337692 (= e!761707 (Some!768 (_2!11977 (h!32280 (toList!10810 lt!593191)))))))

(declare-fun b!1337695 () Bool)

(declare-fun e!761708 () Option!769)

(assert (=> b!1337695 (= e!761708 None!767)))

(declare-fun b!1337693 () Bool)

(assert (=> b!1337693 (= e!761707 e!761708)))

(declare-fun c!126149 () Bool)

(assert (=> b!1337693 (= c!126149 (and ((_ is Cons!31071) (toList!10810 lt!593191)) (not (= (_1!11977 (h!32280 (toList!10810 lt!593191))) (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1337694 () Bool)

(assert (=> b!1337694 (= e!761708 (getValueByKey!717 (t!45391 (toList!10810 lt!593191)) (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!126148 () Bool)

(declare-fun d!143819 () Bool)

(assert (=> d!143819 (= c!126148 (and ((_ is Cons!31071) (toList!10810 lt!593191)) (= (_1!11977 (h!32280 (toList!10810 lt!593191))) (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!143819 (= (getValueByKey!717 (toList!10810 lt!593191) (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!761707)))

(assert (= (and d!143819 c!126148) b!1337692))

(assert (= (and d!143819 (not c!126148)) b!1337693))

(assert (= (and b!1337693 c!126149) b!1337694))

(assert (= (and b!1337693 (not c!126149)) b!1337695))

(declare-fun m!1225767 () Bool)

(assert (=> b!1337694 m!1225767))

(assert (=> b!1337495 d!143819))

(declare-fun d!143821 () Bool)

(declare-fun isEmpty!1087 (List!31075) Bool)

(assert (=> d!143821 (= (isEmpty!1085 lt!593208) (isEmpty!1087 (toList!10810 lt!593208)))))

(declare-fun bs!38301 () Bool)

(assert (= bs!38301 d!143821))

(declare-fun m!1225769 () Bool)

(assert (=> bs!38301 m!1225769))

(assert (=> b!1337526 d!143821))

(declare-fun d!143823 () Bool)

(assert (=> d!143823 (isDefined!524 (getValueByKey!717 (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153))))

(declare-fun lt!593279 () Unit!43947)

(assert (=> d!143823 (= lt!593279 (choose!1963 (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153))))

(declare-fun e!761709 () Bool)

(assert (=> d!143823 e!761709))

(declare-fun res!887634 () Bool)

(assert (=> d!143823 (=> (not res!887634) (not e!761709))))

(assert (=> d!143823 (= res!887634 (isStrictlySorted!879 (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!143823 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153) lt!593279)))

(declare-fun b!1337696 () Bool)

(assert (=> b!1337696 (= e!761709 (containsKey!739 (toList!10810 (+!4746 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1153))))

(assert (= (and d!143823 res!887634) b!1337696))

(assert (=> d!143823 m!1225527))

(assert (=> d!143823 m!1225527))

(assert (=> d!143823 m!1225529))

(declare-fun m!1225771 () Bool)

(assert (=> d!143823 m!1225771))

(declare-fun m!1225773 () Bool)

(assert (=> d!143823 m!1225773))

(assert (=> b!1337696 m!1225523))

(assert (=> b!1337488 d!143823))

(assert (=> b!1337488 d!143801))

(assert (=> b!1337488 d!143803))

(assert (=> d!143739 d!143753))

(assert (=> b!1337454 d!143759))

(declare-fun d!143825 () Bool)

(declare-fun res!887636 () Bool)

(declare-fun e!761712 () Bool)

(assert (=> d!143825 (=> res!887636 e!761712)))

(assert (=> d!143825 (= res!887636 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44399 _keys!1590)))))

(assert (=> d!143825 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998) e!761712)))

(declare-fun b!1337697 () Bool)

(declare-fun e!761711 () Bool)

(declare-fun call!64948 () Bool)

(assert (=> b!1337697 (= e!761711 call!64948)))

(declare-fun b!1337698 () Bool)

(assert (=> b!1337698 (= e!761712 e!761711)))

(declare-fun c!126150 () Bool)

(assert (=> b!1337698 (= c!126150 (validKeyInArray!0 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!64945 () Bool)

(assert (=> bm!64945 (= call!64948 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1337699 () Bool)

(declare-fun e!761710 () Bool)

(assert (=> b!1337699 (= e!761711 e!761710)))

(declare-fun lt!593282 () (_ BitVec 64))

(assert (=> b!1337699 (= lt!593282 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!593280 () Unit!43947)

(assert (=> b!1337699 (= lt!593280 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!593282 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1337699 (arrayContainsKey!0 _keys!1590 lt!593282 #b00000000000000000000000000000000)))

(declare-fun lt!593281 () Unit!43947)

(assert (=> b!1337699 (= lt!593281 lt!593280)))

(declare-fun res!887635 () Bool)

(assert (=> b!1337699 (= res!887635 (= (seekEntryOrOpen!0 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1590 mask!1998) (Found!10049 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1337699 (=> (not res!887635) (not e!761710))))

(declare-fun b!1337700 () Bool)

(assert (=> b!1337700 (= e!761710 call!64948)))

(assert (= (and d!143825 (not res!887636)) b!1337698))

(assert (= (and b!1337698 c!126150) b!1337699))

(assert (= (and b!1337698 (not c!126150)) b!1337697))

(assert (= (and b!1337699 res!887635) b!1337700))

(assert (= (or b!1337700 b!1337697) bm!64945))

(assert (=> b!1337698 m!1225649))

(assert (=> b!1337698 m!1225649))

(assert (=> b!1337698 m!1225651))

(declare-fun m!1225775 () Bool)

(assert (=> bm!64945 m!1225775))

(assert (=> b!1337699 m!1225649))

(declare-fun m!1225777 () Bool)

(assert (=> b!1337699 m!1225777))

(declare-fun m!1225779 () Bool)

(assert (=> b!1337699 m!1225779))

(assert (=> b!1337699 m!1225649))

(declare-fun m!1225781 () Bool)

(assert (=> b!1337699 m!1225781))

(assert (=> bm!64929 d!143825))

(declare-fun lt!593285 () Bool)

(declare-fun d!143827 () Bool)

(declare-fun content!660 (List!31075) (InoxSet tuple2!23932))

(assert (=> d!143827 (= lt!593285 (select (content!660 (toList!10810 lt!593191)) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!761717 () Bool)

(assert (=> d!143827 (= lt!593285 e!761717)))

(declare-fun res!887641 () Bool)

(assert (=> d!143827 (=> (not res!887641) (not e!761717))))

(assert (=> d!143827 (= res!887641 ((_ is Cons!31071) (toList!10810 lt!593191)))))

(assert (=> d!143827 (= (contains!8980 (toList!10810 lt!593191) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!593285)))

(declare-fun b!1337705 () Bool)

(declare-fun e!761718 () Bool)

(assert (=> b!1337705 (= e!761717 e!761718)))

(declare-fun res!887642 () Bool)

(assert (=> b!1337705 (=> res!887642 e!761718)))

(assert (=> b!1337705 (= res!887642 (= (h!32280 (toList!10810 lt!593191)) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1337706 () Bool)

(assert (=> b!1337706 (= e!761718 (contains!8980 (t!45391 (toList!10810 lt!593191)) (tuple2!23933 (select (arr!43849 _keys!1590) from!1980) (get!22129 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!143827 res!887641) b!1337705))

(assert (= (and b!1337705 (not res!887642)) b!1337706))

(declare-fun m!1225783 () Bool)

(assert (=> d!143827 m!1225783))

(declare-fun m!1225785 () Bool)

(assert (=> d!143827 m!1225785))

(declare-fun m!1225787 () Bool)

(assert (=> b!1337706 m!1225787))

(assert (=> b!1337496 d!143827))

(declare-fun d!143829 () Bool)

(declare-fun e!761720 () Bool)

(assert (=> d!143829 e!761720))

(declare-fun res!887643 () Bool)

(assert (=> d!143829 (=> res!887643 e!761720)))

(declare-fun lt!593288 () Bool)

(assert (=> d!143829 (= res!887643 (not lt!593288))))

(declare-fun lt!593289 () Bool)

(assert (=> d!143829 (= lt!593288 lt!593289)))

(declare-fun lt!593287 () Unit!43947)

(declare-fun e!761719 () Unit!43947)

(assert (=> d!143829 (= lt!593287 e!761719)))

(declare-fun c!126151 () Bool)

(assert (=> d!143829 (= c!126151 lt!593289)))

(assert (=> d!143829 (= lt!593289 (containsKey!739 (toList!10810 lt!593208) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143829 (= (contains!8977 lt!593208 #b1000000000000000000000000000000000000000000000000000000000000000) lt!593288)))

(declare-fun b!1337707 () Bool)

(declare-fun lt!593286 () Unit!43947)

(assert (=> b!1337707 (= e!761719 lt!593286)))

(assert (=> b!1337707 (= lt!593286 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10810 lt!593208) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1337707 (isDefined!524 (getValueByKey!717 (toList!10810 lt!593208) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337708 () Bool)

(declare-fun Unit!43957 () Unit!43947)

(assert (=> b!1337708 (= e!761719 Unit!43957)))

(declare-fun b!1337709 () Bool)

(assert (=> b!1337709 (= e!761720 (isDefined!524 (getValueByKey!717 (toList!10810 lt!593208) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143829 c!126151) b!1337707))

(assert (= (and d!143829 (not c!126151)) b!1337708))

(assert (= (and d!143829 (not res!887643)) b!1337709))

(declare-fun m!1225789 () Bool)

(assert (=> d!143829 m!1225789))

(declare-fun m!1225791 () Bool)

(assert (=> b!1337707 m!1225791))

(declare-fun m!1225793 () Bool)

(assert (=> b!1337707 m!1225793))

(assert (=> b!1337707 m!1225793))

(declare-fun m!1225795 () Bool)

(assert (=> b!1337707 m!1225795))

(assert (=> b!1337709 m!1225793))

(assert (=> b!1337709 m!1225793))

(assert (=> b!1337709 m!1225795))

(assert (=> b!1337527 d!143829))

(declare-fun d!143831 () Bool)

(assert (=> d!143831 (= (apply!1034 lt!593146 (select (arr!43849 _keys!1590) from!1980)) (get!22133 (getValueByKey!717 (toList!10810 lt!593146) (select (arr!43849 _keys!1590) from!1980))))))

(declare-fun bs!38302 () Bool)

(assert (= bs!38302 d!143831))

(assert (=> bs!38302 m!1225393))

(assert (=> bs!38302 m!1225763))

(assert (=> bs!38302 m!1225763))

(declare-fun m!1225797 () Bool)

(assert (=> bs!38302 m!1225797))

(assert (=> b!1337451 d!143831))

(assert (=> b!1337451 d!143751))

(declare-fun d!143833 () Bool)

(assert (=> d!143833 (not (contains!8977 (+!4746 lt!593210 (tuple2!23933 lt!593207 lt!593206)) lt!593211))))

(declare-fun lt!593292 () Unit!43947)

(declare-fun choose!1964 (ListLongMap!21589 (_ BitVec 64) V!54379 (_ BitVec 64)) Unit!43947)

(assert (=> d!143833 (= lt!593292 (choose!1964 lt!593210 lt!593207 lt!593206 lt!593211))))

(declare-fun e!761723 () Bool)

(assert (=> d!143833 e!761723))

(declare-fun res!887646 () Bool)

(assert (=> d!143833 (=> (not res!887646) (not e!761723))))

(assert (=> d!143833 (= res!887646 (not (contains!8977 lt!593210 lt!593211)))))

(assert (=> d!143833 (= (addStillNotContains!498 lt!593210 lt!593207 lt!593206 lt!593211) lt!593292)))

(declare-fun b!1337713 () Bool)

(assert (=> b!1337713 (= e!761723 (not (= lt!593207 lt!593211)))))

(assert (= (and d!143833 res!887646) b!1337713))

(assert (=> d!143833 m!1225547))

(assert (=> d!143833 m!1225547))

(assert (=> d!143833 m!1225549))

(declare-fun m!1225799 () Bool)

(assert (=> d!143833 m!1225799))

(declare-fun m!1225801 () Bool)

(assert (=> d!143833 m!1225801))

(assert (=> b!1337525 d!143833))

(declare-fun d!143835 () Bool)

(declare-fun e!761725 () Bool)

(assert (=> d!143835 e!761725))

(declare-fun res!887647 () Bool)

(assert (=> d!143835 (=> res!887647 e!761725)))

(declare-fun lt!593295 () Bool)

(assert (=> d!143835 (= res!887647 (not lt!593295))))

(declare-fun lt!593296 () Bool)

(assert (=> d!143835 (= lt!593295 lt!593296)))

(declare-fun lt!593294 () Unit!43947)

(declare-fun e!761724 () Unit!43947)

(assert (=> d!143835 (= lt!593294 e!761724)))

(declare-fun c!126152 () Bool)

(assert (=> d!143835 (= c!126152 lt!593296)))

(assert (=> d!143835 (= lt!593296 (containsKey!739 (toList!10810 (+!4746 lt!593210 (tuple2!23933 lt!593207 lt!593206))) lt!593211))))

(assert (=> d!143835 (= (contains!8977 (+!4746 lt!593210 (tuple2!23933 lt!593207 lt!593206)) lt!593211) lt!593295)))

(declare-fun b!1337714 () Bool)

(declare-fun lt!593293 () Unit!43947)

(assert (=> b!1337714 (= e!761724 lt!593293)))

(assert (=> b!1337714 (= lt!593293 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10810 (+!4746 lt!593210 (tuple2!23933 lt!593207 lt!593206))) lt!593211))))

(assert (=> b!1337714 (isDefined!524 (getValueByKey!717 (toList!10810 (+!4746 lt!593210 (tuple2!23933 lt!593207 lt!593206))) lt!593211))))

(declare-fun b!1337715 () Bool)

(declare-fun Unit!43958 () Unit!43947)

(assert (=> b!1337715 (= e!761724 Unit!43958)))

(declare-fun b!1337716 () Bool)

(assert (=> b!1337716 (= e!761725 (isDefined!524 (getValueByKey!717 (toList!10810 (+!4746 lt!593210 (tuple2!23933 lt!593207 lt!593206))) lt!593211)))))

(assert (= (and d!143835 c!126152) b!1337714))

(assert (= (and d!143835 (not c!126152)) b!1337715))

(assert (= (and d!143835 (not res!887647)) b!1337716))

(declare-fun m!1225803 () Bool)

(assert (=> d!143835 m!1225803))

(declare-fun m!1225805 () Bool)

(assert (=> b!1337714 m!1225805))

(declare-fun m!1225807 () Bool)

(assert (=> b!1337714 m!1225807))

(assert (=> b!1337714 m!1225807))

(declare-fun m!1225809 () Bool)

(assert (=> b!1337714 m!1225809))

(assert (=> b!1337716 m!1225807))

(assert (=> b!1337716 m!1225807))

(assert (=> b!1337716 m!1225809))

(assert (=> b!1337525 d!143835))

(declare-fun d!143837 () Bool)

(declare-fun e!761726 () Bool)

(assert (=> d!143837 e!761726))

(declare-fun res!887648 () Bool)

(assert (=> d!143837 (=> (not res!887648) (not e!761726))))

(declare-fun lt!593300 () ListLongMap!21589)

(assert (=> d!143837 (= res!887648 (contains!8977 lt!593300 (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22129 (select (arr!43850 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!593298 () List!31075)

(assert (=> d!143837 (= lt!593300 (ListLongMap!21590 lt!593298))))

(declare-fun lt!593299 () Unit!43947)

(declare-fun lt!593297 () Unit!43947)

(assert (=> d!143837 (= lt!593299 lt!593297)))

(assert (=> d!143837 (= (getValueByKey!717 lt!593298 (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22129 (select (arr!43850 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!768 (_2!11977 (tuple2!23933 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22129 (select (arr!43850 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143837 (= lt!593297 (lemmaContainsTupThenGetReturnValue!362 lt!593298 (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22129 (select (arr!43850 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11977 (tuple2!23933 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22129 (select (arr!43850 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143837 (= lt!593298 (insertStrictlySorted!491 (toList!10810 call!64935) (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22129 (select (arr!43850 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11977 (tuple2!23933 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22129 (select (arr!43850 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143837 (= (+!4746 call!64935 (tuple2!23933 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22129 (select (arr!43850 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!593300)))

(declare-fun b!1337717 () Bool)

(declare-fun res!887649 () Bool)

(assert (=> b!1337717 (=> (not res!887649) (not e!761726))))

(assert (=> b!1337717 (= res!887649 (= (getValueByKey!717 (toList!10810 lt!593300) (_1!11977 (tuple2!23933 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22129 (select (arr!43850 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!768 (_2!11977 (tuple2!23933 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22129 (select (arr!43850 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1337718 () Bool)

(assert (=> b!1337718 (= e!761726 (contains!8980 (toList!10810 lt!593300) (tuple2!23933 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22129 (select (arr!43850 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!143837 res!887648) b!1337717))

(assert (= (and b!1337717 res!887649) b!1337718))

(declare-fun m!1225811 () Bool)

(assert (=> d!143837 m!1225811))

(declare-fun m!1225813 () Bool)

(assert (=> d!143837 m!1225813))

(declare-fun m!1225815 () Bool)

(assert (=> d!143837 m!1225815))

(declare-fun m!1225817 () Bool)

(assert (=> d!143837 m!1225817))

(declare-fun m!1225819 () Bool)

(assert (=> b!1337717 m!1225819))

(declare-fun m!1225821 () Bool)

(assert (=> b!1337718 m!1225821))

(assert (=> b!1337525 d!143837))

(assert (=> b!1337525 d!143795))

(declare-fun d!143839 () Bool)

(declare-fun e!761727 () Bool)

(assert (=> d!143839 e!761727))

(declare-fun res!887650 () Bool)

(assert (=> d!143839 (=> (not res!887650) (not e!761727))))

(declare-fun lt!593304 () ListLongMap!21589)

(assert (=> d!143839 (= res!887650 (contains!8977 lt!593304 (_1!11977 (tuple2!23933 lt!593207 lt!593206))))))

(declare-fun lt!593302 () List!31075)

(assert (=> d!143839 (= lt!593304 (ListLongMap!21590 lt!593302))))

(declare-fun lt!593303 () Unit!43947)

(declare-fun lt!593301 () Unit!43947)

(assert (=> d!143839 (= lt!593303 lt!593301)))

(assert (=> d!143839 (= (getValueByKey!717 lt!593302 (_1!11977 (tuple2!23933 lt!593207 lt!593206))) (Some!768 (_2!11977 (tuple2!23933 lt!593207 lt!593206))))))

(assert (=> d!143839 (= lt!593301 (lemmaContainsTupThenGetReturnValue!362 lt!593302 (_1!11977 (tuple2!23933 lt!593207 lt!593206)) (_2!11977 (tuple2!23933 lt!593207 lt!593206))))))

(assert (=> d!143839 (= lt!593302 (insertStrictlySorted!491 (toList!10810 lt!593210) (_1!11977 (tuple2!23933 lt!593207 lt!593206)) (_2!11977 (tuple2!23933 lt!593207 lt!593206))))))

(assert (=> d!143839 (= (+!4746 lt!593210 (tuple2!23933 lt!593207 lt!593206)) lt!593304)))

(declare-fun b!1337719 () Bool)

(declare-fun res!887651 () Bool)

(assert (=> b!1337719 (=> (not res!887651) (not e!761727))))

(assert (=> b!1337719 (= res!887651 (= (getValueByKey!717 (toList!10810 lt!593304) (_1!11977 (tuple2!23933 lt!593207 lt!593206))) (Some!768 (_2!11977 (tuple2!23933 lt!593207 lt!593206)))))))

(declare-fun b!1337720 () Bool)

(assert (=> b!1337720 (= e!761727 (contains!8980 (toList!10810 lt!593304) (tuple2!23933 lt!593207 lt!593206)))))

(assert (= (and d!143839 res!887650) b!1337719))

(assert (= (and b!1337719 res!887651) b!1337720))

(declare-fun m!1225823 () Bool)

(assert (=> d!143839 m!1225823))

(declare-fun m!1225825 () Bool)

(assert (=> d!143839 m!1225825))

(declare-fun m!1225827 () Bool)

(assert (=> d!143839 m!1225827))

(declare-fun m!1225829 () Bool)

(assert (=> d!143839 m!1225829))

(declare-fun m!1225831 () Bool)

(assert (=> b!1337719 m!1225831))

(declare-fun m!1225833 () Bool)

(assert (=> b!1337720 m!1225833))

(assert (=> b!1337525 d!143839))

(assert (=> bm!64932 d!143805))

(assert (=> b!1337522 d!143789))

(declare-fun d!143841 () Bool)

(assert (=> d!143841 (= (get!22131 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!21194 (select (arr!43850 _values!1320) from!1980)))))

(assert (=> b!1337537 d!143841))

(declare-fun d!143843 () Bool)

(declare-fun res!887652 () Bool)

(declare-fun e!761728 () Bool)

(assert (=> d!143843 (=> res!887652 e!761728)))

(assert (=> d!143843 (= res!887652 (and ((_ is Cons!31071) (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (= (_1!11977 (h!32280 (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(assert (=> d!143843 (= (containsKey!739 (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) e!761728)))

(declare-fun b!1337721 () Bool)

(declare-fun e!761729 () Bool)

(assert (=> b!1337721 (= e!761728 e!761729)))

(declare-fun res!887653 () Bool)

(assert (=> b!1337721 (=> (not res!887653) (not e!761729))))

(assert (=> b!1337721 (= res!887653 (and (or (not ((_ is Cons!31071) (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) (bvsle (_1!11977 (h!32280 (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)) ((_ is Cons!31071) (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (bvslt (_1!11977 (h!32280 (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(declare-fun b!1337722 () Bool)

(assert (=> b!1337722 (= e!761729 (containsKey!739 (t!45391 (toList!10810 (getCurrentListMap!5781 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) k0!1153))))

(assert (= (and d!143843 (not res!887652)) b!1337721))

(assert (= (and b!1337721 res!887653) b!1337722))

(declare-fun m!1225835 () Bool)

(assert (=> b!1337722 m!1225835))

(assert (=> d!143737 d!143843))

(declare-fun d!143845 () Bool)

(declare-fun e!761731 () Bool)

(assert (=> d!143845 e!761731))

(declare-fun res!887654 () Bool)

(assert (=> d!143845 (=> res!887654 e!761731)))

(declare-fun lt!593307 () Bool)

(assert (=> d!143845 (= res!887654 (not lt!593307))))

(declare-fun lt!593308 () Bool)

(assert (=> d!143845 (= lt!593307 lt!593308)))

(declare-fun lt!593306 () Unit!43947)

(declare-fun e!761730 () Unit!43947)

(assert (=> d!143845 (= lt!593306 e!761730)))

(declare-fun c!126153 () Bool)

(assert (=> d!143845 (= c!126153 lt!593308)))

(assert (=> d!143845 (= lt!593308 (containsKey!739 (toList!10810 lt!593208) (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> d!143845 (= (contains!8977 lt!593208 (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) lt!593307)))

(declare-fun b!1337723 () Bool)

(declare-fun lt!593305 () Unit!43947)

(assert (=> b!1337723 (= e!761730 lt!593305)))

(assert (=> b!1337723 (= lt!593305 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10810 lt!593208) (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1337723 (isDefined!524 (getValueByKey!717 (toList!10810 lt!593208) (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1337724 () Bool)

(declare-fun Unit!43959 () Unit!43947)

(assert (=> b!1337724 (= e!761730 Unit!43959)))

(declare-fun b!1337725 () Bool)

(assert (=> b!1337725 (= e!761731 (isDefined!524 (getValueByKey!717 (toList!10810 lt!593208) (select (arr!43849 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))))

(assert (= (and d!143845 c!126153) b!1337723))

(assert (= (and d!143845 (not c!126153)) b!1337724))

(assert (= (and d!143845 (not res!887654)) b!1337725))

(assert (=> d!143845 m!1225553))

(declare-fun m!1225837 () Bool)

(assert (=> d!143845 m!1225837))

(assert (=> b!1337723 m!1225553))

(declare-fun m!1225839 () Bool)

(assert (=> b!1337723 m!1225839))

(assert (=> b!1337723 m!1225553))

(assert (=> b!1337723 m!1225663))

(assert (=> b!1337723 m!1225663))

(declare-fun m!1225841 () Bool)

(assert (=> b!1337723 m!1225841))

(assert (=> b!1337725 m!1225553))

(assert (=> b!1337725 m!1225663))

(assert (=> b!1337725 m!1225663))

(assert (=> b!1337725 m!1225841))

(assert (=> b!1337523 d!143845))

(declare-fun d!143847 () Bool)

(assert (=> d!143847 (= (get!22132 (select (arr!43850 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1337538 d!143847))

(declare-fun d!143849 () Bool)

(assert (=> d!143849 (= (apply!1034 lt!593155 lt!593160) (get!22133 (getValueByKey!717 (toList!10810 lt!593155) lt!593160)))))

(declare-fun bs!38303 () Bool)

(assert (= bs!38303 d!143849))

(declare-fun m!1225843 () Bool)

(assert (=> bs!38303 m!1225843))

(assert (=> bs!38303 m!1225843))

(declare-fun m!1225845 () Bool)

(assert (=> bs!38303 m!1225845))

(assert (=> b!1337449 d!143849))

(declare-fun d!143851 () Bool)

(assert (=> d!143851 (= (apply!1034 (+!4746 lt!593154 (tuple2!23933 lt!593159 minValue!1262)) lt!593161) (apply!1034 lt!593154 lt!593161))))

(declare-fun lt!593311 () Unit!43947)

(declare-fun choose!1965 (ListLongMap!21589 (_ BitVec 64) V!54379 (_ BitVec 64)) Unit!43947)

(assert (=> d!143851 (= lt!593311 (choose!1965 lt!593154 lt!593159 minValue!1262 lt!593161))))

(declare-fun e!761734 () Bool)

(assert (=> d!143851 e!761734))

(declare-fun res!887657 () Bool)

(assert (=> d!143851 (=> (not res!887657) (not e!761734))))

(assert (=> d!143851 (= res!887657 (contains!8977 lt!593154 lt!593161))))

(assert (=> d!143851 (= (addApplyDifferent!576 lt!593154 lt!593159 minValue!1262 lt!593161) lt!593311)))

(declare-fun b!1337729 () Bool)

(assert (=> b!1337729 (= e!761734 (not (= lt!593161 lt!593159)))))

(assert (= (and d!143851 res!887657) b!1337729))

(declare-fun m!1225847 () Bool)

(assert (=> d!143851 m!1225847))

(declare-fun m!1225849 () Bool)

(assert (=> d!143851 m!1225849))

(assert (=> d!143851 m!1225477))

(assert (=> d!143851 m!1225479))

(assert (=> d!143851 m!1225477))

(assert (=> d!143851 m!1225483))

(assert (=> b!1337449 d!143851))

(declare-fun d!143853 () Bool)

(declare-fun e!761736 () Bool)

(assert (=> d!143853 e!761736))

(declare-fun res!887658 () Bool)

(assert (=> d!143853 (=> res!887658 e!761736)))

(declare-fun lt!593314 () Bool)

(assert (=> d!143853 (= res!887658 (not lt!593314))))

(declare-fun lt!593315 () Bool)

(assert (=> d!143853 (= lt!593314 lt!593315)))

(declare-fun lt!593313 () Unit!43947)

(declare-fun e!761735 () Unit!43947)

(assert (=> d!143853 (= lt!593313 e!761735)))

(declare-fun c!126154 () Bool)

(assert (=> d!143853 (= c!126154 lt!593315)))

(assert (=> d!143853 (= lt!593315 (containsKey!739 (toList!10810 (+!4746 lt!593156 (tuple2!23933 lt!593149 zeroValue!1262))) lt!593147))))

(assert (=> d!143853 (= (contains!8977 (+!4746 lt!593156 (tuple2!23933 lt!593149 zeroValue!1262)) lt!593147) lt!593314)))

(declare-fun b!1337730 () Bool)

(declare-fun lt!593312 () Unit!43947)

(assert (=> b!1337730 (= e!761735 lt!593312)))

(assert (=> b!1337730 (= lt!593312 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10810 (+!4746 lt!593156 (tuple2!23933 lt!593149 zeroValue!1262))) lt!593147))))

(assert (=> b!1337730 (isDefined!524 (getValueByKey!717 (toList!10810 (+!4746 lt!593156 (tuple2!23933 lt!593149 zeroValue!1262))) lt!593147))))

(declare-fun b!1337731 () Bool)

(declare-fun Unit!43960 () Unit!43947)

(assert (=> b!1337731 (= e!761735 Unit!43960)))

(declare-fun b!1337732 () Bool)

(assert (=> b!1337732 (= e!761736 (isDefined!524 (getValueByKey!717 (toList!10810 (+!4746 lt!593156 (tuple2!23933 lt!593149 zeroValue!1262))) lt!593147)))))

(assert (= (and d!143853 c!126154) b!1337730))

(assert (= (and d!143853 (not c!126154)) b!1337731))

(assert (= (and d!143853 (not res!887658)) b!1337732))

(declare-fun m!1225851 () Bool)

(assert (=> d!143853 m!1225851))

(declare-fun m!1225853 () Bool)

(assert (=> b!1337730 m!1225853))

(declare-fun m!1225855 () Bool)

(assert (=> b!1337730 m!1225855))

(assert (=> b!1337730 m!1225855))

(declare-fun m!1225857 () Bool)

(assert (=> b!1337730 m!1225857))

(assert (=> b!1337732 m!1225855))

(assert (=> b!1337732 m!1225855))

(assert (=> b!1337732 m!1225857))

(assert (=> b!1337449 d!143853))

(declare-fun d!143855 () Bool)

(assert (=> d!143855 (= (apply!1034 (+!4746 lt!593150 (tuple2!23933 lt!593148 minValue!1262)) lt!593166) (get!22133 (getValueByKey!717 (toList!10810 (+!4746 lt!593150 (tuple2!23933 lt!593148 minValue!1262))) lt!593166)))))

(declare-fun bs!38304 () Bool)

(assert (= bs!38304 d!143855))

(declare-fun m!1225859 () Bool)

(assert (=> bs!38304 m!1225859))

(assert (=> bs!38304 m!1225859))

(declare-fun m!1225861 () Bool)

(assert (=> bs!38304 m!1225861))

(assert (=> b!1337449 d!143855))

(declare-fun d!143857 () Bool)

(declare-fun e!761737 () Bool)

(assert (=> d!143857 e!761737))

(declare-fun res!887659 () Bool)

(assert (=> d!143857 (=> (not res!887659) (not e!761737))))

(declare-fun lt!593319 () ListLongMap!21589)

(assert (=> d!143857 (= res!887659 (contains!8977 lt!593319 (_1!11977 (tuple2!23933 lt!593159 minValue!1262))))))

(declare-fun lt!593317 () List!31075)

(assert (=> d!143857 (= lt!593319 (ListLongMap!21590 lt!593317))))

(declare-fun lt!593318 () Unit!43947)

(declare-fun lt!593316 () Unit!43947)

(assert (=> d!143857 (= lt!593318 lt!593316)))

(assert (=> d!143857 (= (getValueByKey!717 lt!593317 (_1!11977 (tuple2!23933 lt!593159 minValue!1262))) (Some!768 (_2!11977 (tuple2!23933 lt!593159 minValue!1262))))))

(assert (=> d!143857 (= lt!593316 (lemmaContainsTupThenGetReturnValue!362 lt!593317 (_1!11977 (tuple2!23933 lt!593159 minValue!1262)) (_2!11977 (tuple2!23933 lt!593159 minValue!1262))))))

(assert (=> d!143857 (= lt!593317 (insertStrictlySorted!491 (toList!10810 lt!593154) (_1!11977 (tuple2!23933 lt!593159 minValue!1262)) (_2!11977 (tuple2!23933 lt!593159 minValue!1262))))))

(assert (=> d!143857 (= (+!4746 lt!593154 (tuple2!23933 lt!593159 minValue!1262)) lt!593319)))

(declare-fun b!1337733 () Bool)

(declare-fun res!887660 () Bool)

(assert (=> b!1337733 (=> (not res!887660) (not e!761737))))

(assert (=> b!1337733 (= res!887660 (= (getValueByKey!717 (toList!10810 lt!593319) (_1!11977 (tuple2!23933 lt!593159 minValue!1262))) (Some!768 (_2!11977 (tuple2!23933 lt!593159 minValue!1262)))))))

(declare-fun b!1337734 () Bool)

(assert (=> b!1337734 (= e!761737 (contains!8980 (toList!10810 lt!593319) (tuple2!23933 lt!593159 minValue!1262)))))

(assert (= (and d!143857 res!887659) b!1337733))

(assert (= (and b!1337733 res!887660) b!1337734))

(declare-fun m!1225863 () Bool)

(assert (=> d!143857 m!1225863))

(declare-fun m!1225865 () Bool)

(assert (=> d!143857 m!1225865))

(declare-fun m!1225867 () Bool)

(assert (=> d!143857 m!1225867))

(declare-fun m!1225869 () Bool)

(assert (=> d!143857 m!1225869))

(declare-fun m!1225871 () Bool)

(assert (=> b!1337733 m!1225871))

(declare-fun m!1225873 () Bool)

(assert (=> b!1337734 m!1225873))

(assert (=> b!1337449 d!143857))

(declare-fun d!143859 () Bool)

(assert (=> d!143859 (= (apply!1034 lt!593150 lt!593166) (get!22133 (getValueByKey!717 (toList!10810 lt!593150) lt!593166)))))

(declare-fun bs!38305 () Bool)

(assert (= bs!38305 d!143859))

(declare-fun m!1225875 () Bool)

(assert (=> bs!38305 m!1225875))

(assert (=> bs!38305 m!1225875))

(declare-fun m!1225877 () Bool)

(assert (=> bs!38305 m!1225877))

(assert (=> b!1337449 d!143859))

(declare-fun d!143861 () Bool)

(assert (=> d!143861 (contains!8977 (+!4746 lt!593156 (tuple2!23933 lt!593149 zeroValue!1262)) lt!593147)))

(declare-fun lt!593322 () Unit!43947)

(declare-fun choose!1966 (ListLongMap!21589 (_ BitVec 64) V!54379 (_ BitVec 64)) Unit!43947)

(assert (=> d!143861 (= lt!593322 (choose!1966 lt!593156 lt!593149 zeroValue!1262 lt!593147))))

(assert (=> d!143861 (contains!8977 lt!593156 lt!593147)))

(assert (=> d!143861 (= (addStillContains!1190 lt!593156 lt!593149 zeroValue!1262 lt!593147) lt!593322)))

(declare-fun bs!38306 () Bool)

(assert (= bs!38306 d!143861))

(assert (=> bs!38306 m!1225487))

(assert (=> bs!38306 m!1225487))

(assert (=> bs!38306 m!1225489))

(declare-fun m!1225879 () Bool)

(assert (=> bs!38306 m!1225879))

(declare-fun m!1225881 () Bool)

(assert (=> bs!38306 m!1225881))

(assert (=> b!1337449 d!143861))

(declare-fun d!143863 () Bool)

(assert (=> d!143863 (= (apply!1034 (+!4746 lt!593155 (tuple2!23933 lt!593153 zeroValue!1262)) lt!593160) (apply!1034 lt!593155 lt!593160))))

(declare-fun lt!593323 () Unit!43947)

(assert (=> d!143863 (= lt!593323 (choose!1965 lt!593155 lt!593153 zeroValue!1262 lt!593160))))

(declare-fun e!761738 () Bool)

(assert (=> d!143863 e!761738))

(declare-fun res!887661 () Bool)

(assert (=> d!143863 (=> (not res!887661) (not e!761738))))

(assert (=> d!143863 (= res!887661 (contains!8977 lt!593155 lt!593160))))

(assert (=> d!143863 (= (addApplyDifferent!576 lt!593155 lt!593153 zeroValue!1262 lt!593160) lt!593323)))

(declare-fun b!1337736 () Bool)

(assert (=> b!1337736 (= e!761738 (not (= lt!593160 lt!593153)))))

(assert (= (and d!143863 res!887661) b!1337736))

(declare-fun m!1225883 () Bool)

(assert (=> d!143863 m!1225883))

(declare-fun m!1225885 () Bool)

(assert (=> d!143863 m!1225885))

(assert (=> d!143863 m!1225497))

(assert (=> d!143863 m!1225499))

(assert (=> d!143863 m!1225497))

(assert (=> d!143863 m!1225485))

(assert (=> b!1337449 d!143863))

(declare-fun d!143865 () Bool)

(declare-fun e!761739 () Bool)

(assert (=> d!143865 e!761739))

(declare-fun res!887662 () Bool)

(assert (=> d!143865 (=> (not res!887662) (not e!761739))))

(declare-fun lt!593327 () ListLongMap!21589)

(assert (=> d!143865 (= res!887662 (contains!8977 lt!593327 (_1!11977 (tuple2!23933 lt!593153 zeroValue!1262))))))

(declare-fun lt!593325 () List!31075)

(assert (=> d!143865 (= lt!593327 (ListLongMap!21590 lt!593325))))

(declare-fun lt!593326 () Unit!43947)

(declare-fun lt!593324 () Unit!43947)

(assert (=> d!143865 (= lt!593326 lt!593324)))

(assert (=> d!143865 (= (getValueByKey!717 lt!593325 (_1!11977 (tuple2!23933 lt!593153 zeroValue!1262))) (Some!768 (_2!11977 (tuple2!23933 lt!593153 zeroValue!1262))))))

(assert (=> d!143865 (= lt!593324 (lemmaContainsTupThenGetReturnValue!362 lt!593325 (_1!11977 (tuple2!23933 lt!593153 zeroValue!1262)) (_2!11977 (tuple2!23933 lt!593153 zeroValue!1262))))))

(assert (=> d!143865 (= lt!593325 (insertStrictlySorted!491 (toList!10810 lt!593155) (_1!11977 (tuple2!23933 lt!593153 zeroValue!1262)) (_2!11977 (tuple2!23933 lt!593153 zeroValue!1262))))))

(assert (=> d!143865 (= (+!4746 lt!593155 (tuple2!23933 lt!593153 zeroValue!1262)) lt!593327)))

(declare-fun b!1337737 () Bool)

(declare-fun res!887663 () Bool)

(assert (=> b!1337737 (=> (not res!887663) (not e!761739))))

(assert (=> b!1337737 (= res!887663 (= (getValueByKey!717 (toList!10810 lt!593327) (_1!11977 (tuple2!23933 lt!593153 zeroValue!1262))) (Some!768 (_2!11977 (tuple2!23933 lt!593153 zeroValue!1262)))))))

(declare-fun b!1337738 () Bool)

(assert (=> b!1337738 (= e!761739 (contains!8980 (toList!10810 lt!593327) (tuple2!23933 lt!593153 zeroValue!1262)))))

(assert (= (and d!143865 res!887662) b!1337737))

(assert (= (and b!1337737 res!887663) b!1337738))

(declare-fun m!1225887 () Bool)

(assert (=> d!143865 m!1225887))

(declare-fun m!1225889 () Bool)

(assert (=> d!143865 m!1225889))

(declare-fun m!1225891 () Bool)

(assert (=> d!143865 m!1225891))

(declare-fun m!1225893 () Bool)

(assert (=> d!143865 m!1225893))

(declare-fun m!1225895 () Bool)

(assert (=> b!1337737 m!1225895))

(declare-fun m!1225897 () Bool)

(assert (=> b!1337738 m!1225897))

(assert (=> b!1337449 d!143865))

(declare-fun d!143867 () Bool)

(assert (=> d!143867 (= (apply!1034 (+!4746 lt!593155 (tuple2!23933 lt!593153 zeroValue!1262)) lt!593160) (get!22133 (getValueByKey!717 (toList!10810 (+!4746 lt!593155 (tuple2!23933 lt!593153 zeroValue!1262))) lt!593160)))))

(declare-fun bs!38307 () Bool)

(assert (= bs!38307 d!143867))

(declare-fun m!1225899 () Bool)

(assert (=> bs!38307 m!1225899))

(assert (=> bs!38307 m!1225899))

(declare-fun m!1225901 () Bool)

(assert (=> bs!38307 m!1225901))

(assert (=> b!1337449 d!143867))

(declare-fun d!143869 () Bool)

(assert (=> d!143869 (= (apply!1034 (+!4746 lt!593150 (tuple2!23933 lt!593148 minValue!1262)) lt!593166) (apply!1034 lt!593150 lt!593166))))

(declare-fun lt!593328 () Unit!43947)

(assert (=> d!143869 (= lt!593328 (choose!1965 lt!593150 lt!593148 minValue!1262 lt!593166))))

(declare-fun e!761740 () Bool)

(assert (=> d!143869 e!761740))

(declare-fun res!887664 () Bool)

(assert (=> d!143869 (=> (not res!887664) (not e!761740))))

(assert (=> d!143869 (= res!887664 (contains!8977 lt!593150 lt!593166))))

(assert (=> d!143869 (= (addApplyDifferent!576 lt!593150 lt!593148 minValue!1262 lt!593166) lt!593328)))

(declare-fun b!1337739 () Bool)

(assert (=> b!1337739 (= e!761740 (not (= lt!593166 lt!593148)))))

(assert (= (and d!143869 res!887664) b!1337739))

(declare-fun m!1225903 () Bool)

(assert (=> d!143869 m!1225903))

(declare-fun m!1225905 () Bool)

(assert (=> d!143869 m!1225905))

(assert (=> d!143869 m!1225493))

(assert (=> d!143869 m!1225503))

(assert (=> d!143869 m!1225493))

(assert (=> d!143869 m!1225495))

(assert (=> b!1337449 d!143869))

(declare-fun d!143871 () Bool)

(assert (=> d!143871 (= (apply!1034 (+!4746 lt!593154 (tuple2!23933 lt!593159 minValue!1262)) lt!593161) (get!22133 (getValueByKey!717 (toList!10810 (+!4746 lt!593154 (tuple2!23933 lt!593159 minValue!1262))) lt!593161)))))

(declare-fun bs!38308 () Bool)

(assert (= bs!38308 d!143871))

(declare-fun m!1225907 () Bool)

(assert (=> bs!38308 m!1225907))

(assert (=> bs!38308 m!1225907))

(declare-fun m!1225909 () Bool)

(assert (=> bs!38308 m!1225909))

(assert (=> b!1337449 d!143871))

(declare-fun d!143873 () Bool)

(assert (=> d!143873 (= (apply!1034 lt!593154 lt!593161) (get!22133 (getValueByKey!717 (toList!10810 lt!593154) lt!593161)))))

(declare-fun bs!38309 () Bool)

(assert (= bs!38309 d!143873))

(declare-fun m!1225911 () Bool)

(assert (=> bs!38309 m!1225911))

(assert (=> bs!38309 m!1225911))

(declare-fun m!1225913 () Bool)

(assert (=> bs!38309 m!1225913))

(assert (=> b!1337449 d!143873))

(declare-fun d!143875 () Bool)

(declare-fun e!761741 () Bool)

(assert (=> d!143875 e!761741))

(declare-fun res!887665 () Bool)

(assert (=> d!143875 (=> (not res!887665) (not e!761741))))

(declare-fun lt!593332 () ListLongMap!21589)

(assert (=> d!143875 (= res!887665 (contains!8977 lt!593332 (_1!11977 (tuple2!23933 lt!593148 minValue!1262))))))

(declare-fun lt!593330 () List!31075)

(assert (=> d!143875 (= lt!593332 (ListLongMap!21590 lt!593330))))

(declare-fun lt!593331 () Unit!43947)

(declare-fun lt!593329 () Unit!43947)

(assert (=> d!143875 (= lt!593331 lt!593329)))

(assert (=> d!143875 (= (getValueByKey!717 lt!593330 (_1!11977 (tuple2!23933 lt!593148 minValue!1262))) (Some!768 (_2!11977 (tuple2!23933 lt!593148 minValue!1262))))))

(assert (=> d!143875 (= lt!593329 (lemmaContainsTupThenGetReturnValue!362 lt!593330 (_1!11977 (tuple2!23933 lt!593148 minValue!1262)) (_2!11977 (tuple2!23933 lt!593148 minValue!1262))))))

(assert (=> d!143875 (= lt!593330 (insertStrictlySorted!491 (toList!10810 lt!593150) (_1!11977 (tuple2!23933 lt!593148 minValue!1262)) (_2!11977 (tuple2!23933 lt!593148 minValue!1262))))))

(assert (=> d!143875 (= (+!4746 lt!593150 (tuple2!23933 lt!593148 minValue!1262)) lt!593332)))

(declare-fun b!1337740 () Bool)

(declare-fun res!887666 () Bool)

(assert (=> b!1337740 (=> (not res!887666) (not e!761741))))

(assert (=> b!1337740 (= res!887666 (= (getValueByKey!717 (toList!10810 lt!593332) (_1!11977 (tuple2!23933 lt!593148 minValue!1262))) (Some!768 (_2!11977 (tuple2!23933 lt!593148 minValue!1262)))))))

(declare-fun b!1337741 () Bool)

(assert (=> b!1337741 (= e!761741 (contains!8980 (toList!10810 lt!593332) (tuple2!23933 lt!593148 minValue!1262)))))

(assert (= (and d!143875 res!887665) b!1337740))

(assert (= (and b!1337740 res!887666) b!1337741))

(declare-fun m!1225915 () Bool)

(assert (=> d!143875 m!1225915))

(declare-fun m!1225917 () Bool)

(assert (=> d!143875 m!1225917))

(declare-fun m!1225919 () Bool)

(assert (=> d!143875 m!1225919))

(declare-fun m!1225921 () Bool)

(assert (=> d!143875 m!1225921))

(declare-fun m!1225923 () Bool)

(assert (=> b!1337740 m!1225923))

(declare-fun m!1225925 () Bool)

(assert (=> b!1337741 m!1225925))

(assert (=> b!1337449 d!143875))

(assert (=> b!1337449 d!143797))

(declare-fun d!143877 () Bool)

(declare-fun e!761742 () Bool)

(assert (=> d!143877 e!761742))

(declare-fun res!887667 () Bool)

(assert (=> d!143877 (=> (not res!887667) (not e!761742))))

(declare-fun lt!593336 () ListLongMap!21589)

(assert (=> d!143877 (= res!887667 (contains!8977 lt!593336 (_1!11977 (tuple2!23933 lt!593149 zeroValue!1262))))))

(declare-fun lt!593334 () List!31075)

(assert (=> d!143877 (= lt!593336 (ListLongMap!21590 lt!593334))))

(declare-fun lt!593335 () Unit!43947)

(declare-fun lt!593333 () Unit!43947)

(assert (=> d!143877 (= lt!593335 lt!593333)))

(assert (=> d!143877 (= (getValueByKey!717 lt!593334 (_1!11977 (tuple2!23933 lt!593149 zeroValue!1262))) (Some!768 (_2!11977 (tuple2!23933 lt!593149 zeroValue!1262))))))

(assert (=> d!143877 (= lt!593333 (lemmaContainsTupThenGetReturnValue!362 lt!593334 (_1!11977 (tuple2!23933 lt!593149 zeroValue!1262)) (_2!11977 (tuple2!23933 lt!593149 zeroValue!1262))))))

(assert (=> d!143877 (= lt!593334 (insertStrictlySorted!491 (toList!10810 lt!593156) (_1!11977 (tuple2!23933 lt!593149 zeroValue!1262)) (_2!11977 (tuple2!23933 lt!593149 zeroValue!1262))))))

(assert (=> d!143877 (= (+!4746 lt!593156 (tuple2!23933 lt!593149 zeroValue!1262)) lt!593336)))

(declare-fun b!1337742 () Bool)

(declare-fun res!887668 () Bool)

(assert (=> b!1337742 (=> (not res!887668) (not e!761742))))

(assert (=> b!1337742 (= res!887668 (= (getValueByKey!717 (toList!10810 lt!593336) (_1!11977 (tuple2!23933 lt!593149 zeroValue!1262))) (Some!768 (_2!11977 (tuple2!23933 lt!593149 zeroValue!1262)))))))

(declare-fun b!1337743 () Bool)

(assert (=> b!1337743 (= e!761742 (contains!8980 (toList!10810 lt!593336) (tuple2!23933 lt!593149 zeroValue!1262)))))

(assert (= (and d!143877 res!887667) b!1337742))

(assert (= (and b!1337742 res!887668) b!1337743))

(declare-fun m!1225927 () Bool)

(assert (=> d!143877 m!1225927))

(declare-fun m!1225929 () Bool)

(assert (=> d!143877 m!1225929))

(declare-fun m!1225931 () Bool)

(assert (=> d!143877 m!1225931))

(declare-fun m!1225933 () Bool)

(assert (=> d!143877 m!1225933))

(declare-fun m!1225935 () Bool)

(assert (=> b!1337742 m!1225935))

(declare-fun m!1225937 () Bool)

(assert (=> b!1337743 m!1225937))

(assert (=> b!1337449 d!143877))

(declare-fun mapIsEmpty!57123 () Bool)

(declare-fun mapRes!57123 () Bool)

(assert (=> mapIsEmpty!57123 mapRes!57123))

(declare-fun b!1337744 () Bool)

(declare-fun e!761743 () Bool)

(assert (=> b!1337744 (= e!761743 tp_is_empty!36957)))

(declare-fun mapNonEmpty!57123 () Bool)

(declare-fun tp!108795 () Bool)

(assert (=> mapNonEmpty!57123 (= mapRes!57123 (and tp!108795 e!761743))))

(declare-fun mapKey!57123 () (_ BitVec 32))

(declare-fun mapValue!57123 () ValueCell!17580)

(declare-fun mapRest!57123 () (Array (_ BitVec 32) ValueCell!17580))

(assert (=> mapNonEmpty!57123 (= mapRest!57122 (store mapRest!57123 mapKey!57123 mapValue!57123))))

(declare-fun condMapEmpty!57123 () Bool)

(declare-fun mapDefault!57123 () ValueCell!17580)

(assert (=> mapNonEmpty!57122 (= condMapEmpty!57123 (= mapRest!57122 ((as const (Array (_ BitVec 32) ValueCell!17580)) mapDefault!57123)))))

(declare-fun e!761744 () Bool)

(assert (=> mapNonEmpty!57122 (= tp!108794 (and e!761744 mapRes!57123))))

(declare-fun b!1337745 () Bool)

(assert (=> b!1337745 (= e!761744 tp_is_empty!36957)))

(assert (= (and mapNonEmpty!57122 condMapEmpty!57123) mapIsEmpty!57123))

(assert (= (and mapNonEmpty!57122 (not condMapEmpty!57123)) mapNonEmpty!57123))

(assert (= (and mapNonEmpty!57123 ((_ is ValueCellFull!17580) mapValue!57123)) b!1337744))

(assert (= (and mapNonEmpty!57122 ((_ is ValueCellFull!17580) mapDefault!57123)) b!1337745))

(declare-fun m!1225939 () Bool)

(assert (=> mapNonEmpty!57123 m!1225939))

(declare-fun b_lambda!24237 () Bool)

(assert (= b_lambda!24235 (or (and start!112736 b_free!31047) b_lambda!24237)))

(declare-fun b_lambda!24239 () Bool)

(assert (= b_lambda!24229 (or (and start!112736 b_free!31047) b_lambda!24239)))

(declare-fun b_lambda!24241 () Bool)

(assert (= b_lambda!24231 (or (and start!112736 b_free!31047) b_lambda!24241)))

(declare-fun b_lambda!24243 () Bool)

(assert (= b_lambda!24233 (or (and start!112736 b_free!31047) b_lambda!24243)))

(check-sat (not b!1337709) (not b!1337627) (not d!143869) (not d!143833) (not b!1337624) (not b!1337621) (not b!1337725) (not b!1337657) (not b!1337653) (not b!1337742) (not b!1337549) (not d!143801) (not b!1337569) (not b!1337699) (not b!1337640) b_and!50047 (not b!1337714) (not bm!64942) (not d!143781) (not d!143835) (not bm!64943) (not b!1337637) (not d!143861) (not b_lambda!24241) (not b!1337639) (not b!1337617) (not b!1337597) (not b_lambda!24225) (not b!1337607) (not b_lambda!24223) (not d!143823) (not b!1337631) (not b!1337683) (not bm!64944) (not d!143777) (not b!1337696) (not b!1337622) (not b!1337716) (not d!143831) (not mapNonEmpty!57123) (not d!143805) (not d!143827) (not b!1337606) (not d!143811) (not b!1337694) (not b!1337570) (not b!1337618) (not b!1337733) (not b_lambda!24227) (not d!143849) (not d!143767) (not b!1337633) (not b_lambda!24239) (not d!143853) (not b!1337635) (not b!1337743) (not b!1337691) (not b!1337719) (not d!143791) (not b!1337717) (not b!1337563) (not b!1337687) (not b!1337740) (not d!143863) (not b!1337720) (not d!143875) (not b!1337734) (not d!143871) (not b!1337722) (not d!143865) (not d!143769) (not bm!64941) (not b_lambda!24243) (not b!1337737) (not b!1337707) (not b!1337630) (not b!1337723) (not b!1337698) (not b!1337609) (not d!143797) (not d!143867) (not d!143763) (not b!1337655) (not b!1337615) (not d!143845) (not b!1337626) (not d!143783) (not b!1337547) (not b!1337689) tp_is_empty!36957 (not d!143815) (not b!1337612) (not d!143829) (not b!1337652) (not d!143839) (not d!143817) (not d!143793) (not d!143785) (not d!143837) (not d!143807) (not d!143851) (not b_lambda!24215) (not b!1337732) (not b!1337662) (not bm!64945) (not d!143859) (not b!1337718) (not b!1337619) (not b!1337649) (not d!143799) (not b!1337634) (not b!1337730) (not b!1337741) (not b!1337706) (not d!143855) (not b!1337661) (not d!143773) (not b!1337550) (not d!143761) (not d!143775) (not b!1337552) (not b!1337738) (not b!1337646) (not b!1337594) (not d!143873) (not d!143821) (not d!143857) (not b_lambda!24237) (not b!1337668) (not b_next!31047) (not d!143877) (not b!1337688) (not b!1337656) (not b!1337628) (not b!1337659) (not b!1337592))
(check-sat b_and!50047 (not b_next!31047))
