; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100750 () Bool)

(assert start!100750)

(declare-fun b_free!25927 () Bool)

(declare-fun b_next!25927 () Bool)

(assert (=> start!100750 (= b_free!25927 (not b_next!25927))))

(declare-fun tp!90783 () Bool)

(declare-fun b_and!42815 () Bool)

(assert (=> start!100750 (= tp!90783 b_and!42815)))

(declare-fun b!1205311 () Bool)

(declare-fun e!684477 () Bool)

(declare-fun e!684478 () Bool)

(assert (=> b!1205311 (= e!684477 e!684478)))

(declare-fun res!801726 () Bool)

(assert (=> b!1205311 (=> res!801726 e!684478)))

(declare-datatypes ((array!77956 0))(
  ( (array!77957 (arr!37619 (Array (_ BitVec 32) (_ BitVec 64))) (size!38157 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77956)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1205311 (= res!801726 (not (= (select (arr!37619 _keys!1208) from!1455) k0!934)))))

(declare-fun e!684473 () Bool)

(assert (=> b!1205311 e!684473))

(declare-fun c!118257 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1205311 (= c!118257 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!45969 0))(
  ( (V!45970 (val!15372 Int)) )
))
(declare-fun zeroValue!944 () V!45969)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14606 0))(
  ( (ValueCellFull!14606 (v!18015 V!45969)) (EmptyCell!14606) )
))
(declare-datatypes ((array!77958 0))(
  ( (array!77959 (arr!37620 (Array (_ BitVec 32) ValueCell!14606)) (size!38158 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77958)

(declare-fun minValue!944 () V!45969)

(declare-datatypes ((Unit!39806 0))(
  ( (Unit!39807) )
))
(declare-fun lt!546559 () Unit!39806)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1031 (array!77956 array!77958 (_ BitVec 32) (_ BitVec 32) V!45969 V!45969 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39806)

(assert (=> b!1205311 (= lt!546559 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1031 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205312 () Bool)

(declare-fun res!801723 () Bool)

(declare-fun e!684487 () Bool)

(assert (=> b!1205312 (=> (not res!801723) (not e!684487))))

(declare-fun lt!546548 () array!77956)

(declare-datatypes ((List!26571 0))(
  ( (Nil!26568) (Cons!26567 (h!27776 (_ BitVec 64)) (t!39469 List!26571)) )
))
(declare-fun arrayNoDuplicates!0 (array!77956 (_ BitVec 32) List!26571) Bool)

(assert (=> b!1205312 (= res!801723 (arrayNoDuplicates!0 lt!546548 #b00000000000000000000000000000000 Nil!26568))))

(declare-fun b!1205313 () Bool)

(declare-fun e!684484 () Bool)

(assert (=> b!1205313 (= e!684484 (or (bvsge (size!38157 _keys!1208) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!38157 _keys!1208))))))

(declare-fun e!684480 () Bool)

(assert (=> b!1205313 e!684480))

(declare-fun res!801734 () Bool)

(assert (=> b!1205313 (=> (not res!801734) (not e!684480))))

(declare-fun e!684483 () Bool)

(assert (=> b!1205313 (= res!801734 e!684483)))

(declare-fun c!118254 () Bool)

(assert (=> b!1205313 (= c!118254 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!546560 () Unit!39806)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!560 (array!77956 array!77958 (_ BitVec 32) (_ BitVec 32) V!45969 V!45969 (_ BitVec 64) (_ BitVec 32) Int) Unit!39806)

(assert (=> b!1205313 (= lt!546560 (lemmaListMapContainsThenArrayContainsFrom!560 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546557 () Unit!39806)

(declare-fun e!684485 () Unit!39806)

(assert (=> b!1205313 (= lt!546557 e!684485)))

(declare-fun c!118255 () Bool)

(declare-fun lt!546558 () Bool)

(assert (=> b!1205313 (= c!118255 (and (not lt!546558) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1205313 (= lt!546558 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1205314 () Bool)

(declare-fun res!801729 () Bool)

(declare-fun e!684475 () Bool)

(assert (=> b!1205314 (=> (not res!801729) (not e!684475))))

(assert (=> b!1205314 (= res!801729 (and (= (size!38158 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38157 _keys!1208) (size!38158 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47802 () Bool)

(declare-fun mapRes!47802 () Bool)

(declare-fun tp!90784 () Bool)

(declare-fun e!684481 () Bool)

(assert (=> mapNonEmpty!47802 (= mapRes!47802 (and tp!90784 e!684481))))

(declare-fun mapKey!47802 () (_ BitVec 32))

(declare-fun mapRest!47802 () (Array (_ BitVec 32) ValueCell!14606))

(declare-fun mapValue!47802 () ValueCell!14606)

(assert (=> mapNonEmpty!47802 (= (arr!37620 _values!996) (store mapRest!47802 mapKey!47802 mapValue!47802))))

(declare-fun bm!58426 () Bool)

(declare-datatypes ((tuple2!19786 0))(
  ( (tuple2!19787 (_1!9904 (_ BitVec 64)) (_2!9904 V!45969)) )
))
(declare-datatypes ((List!26572 0))(
  ( (Nil!26569) (Cons!26568 (h!27777 tuple2!19786) (t!39470 List!26572)) )
))
(declare-datatypes ((ListLongMap!17755 0))(
  ( (ListLongMap!17756 (toList!8893 List!26572)) )
))
(declare-fun call!58436 () ListLongMap!17755)

(declare-fun call!58431 () ListLongMap!17755)

(assert (=> bm!58426 (= call!58436 call!58431)))

(declare-fun b!1205315 () Bool)

(declare-fun res!801728 () Bool)

(assert (=> b!1205315 (=> (not res!801728) (not e!684475))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1205315 (= res!801728 (validKeyInArray!0 k0!934))))

(declare-fun bm!58427 () Bool)

(declare-fun call!58434 () Bool)

(declare-fun call!58430 () Bool)

(assert (=> bm!58427 (= call!58434 call!58430)))

(declare-fun b!1205316 () Bool)

(declare-fun e!684476 () Bool)

(declare-fun e!684486 () Bool)

(assert (=> b!1205316 (= e!684476 (and e!684486 mapRes!47802))))

(declare-fun condMapEmpty!47802 () Bool)

(declare-fun mapDefault!47802 () ValueCell!14606)

(assert (=> b!1205316 (= condMapEmpty!47802 (= (arr!37620 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14606)) mapDefault!47802)))))

(declare-fun bm!58429 () Bool)

(declare-fun lt!546551 () ListLongMap!17755)

(declare-fun c!118256 () Bool)

(declare-fun +!4024 (ListLongMap!17755 tuple2!19786) ListLongMap!17755)

(assert (=> bm!58429 (= call!58431 (+!4024 lt!546551 (ite (or c!118255 c!118256) (tuple2!19787 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19787 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1205317 () Bool)

(declare-fun arrayContainsKey!0 (array!77956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1205317 (= e!684483 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1205318 () Bool)

(declare-fun res!801727 () Bool)

(assert (=> b!1205318 (=> (not res!801727) (not e!684475))))

(assert (=> b!1205318 (= res!801727 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38157 _keys!1208))))))

(declare-fun b!1205319 () Bool)

(declare-fun e!684482 () Unit!39806)

(assert (=> b!1205319 (= e!684485 e!684482)))

(assert (=> b!1205319 (= c!118256 (and (not lt!546558) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1205320 () Bool)

(declare-fun tp_is_empty!30631 () Bool)

(assert (=> b!1205320 (= e!684486 tp_is_empty!30631)))

(declare-fun bm!58430 () Bool)

(declare-fun call!58433 () ListLongMap!17755)

(declare-fun getCurrentListMapNoExtraKeys!5339 (array!77956 array!77958 (_ BitVec 32) (_ BitVec 32) V!45969 V!45969 (_ BitVec 32) Int) ListLongMap!17755)

(assert (=> bm!58430 (= call!58433 (getCurrentListMapNoExtraKeys!5339 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!801731 () Bool)

(assert (=> start!100750 (=> (not res!801731) (not e!684475))))

(assert (=> start!100750 (= res!801731 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38157 _keys!1208))))))

(assert (=> start!100750 e!684475))

(assert (=> start!100750 tp_is_empty!30631))

(declare-fun array_inv!28770 (array!77956) Bool)

(assert (=> start!100750 (array_inv!28770 _keys!1208)))

(assert (=> start!100750 true))

(assert (=> start!100750 tp!90783))

(declare-fun array_inv!28771 (array!77958) Bool)

(assert (=> start!100750 (and (array_inv!28771 _values!996) e!684476)))

(declare-fun bm!58428 () Bool)

(declare-fun lt!546555 () ListLongMap!17755)

(declare-fun contains!6895 (ListLongMap!17755 (_ BitVec 64)) Bool)

(assert (=> bm!58428 (= call!58430 (contains!6895 (ite c!118255 lt!546555 call!58436) k0!934))))

(declare-fun b!1205321 () Bool)

(assert (=> b!1205321 (= e!684481 tp_is_empty!30631)))

(declare-fun b!1205322 () Bool)

(declare-fun e!684479 () Unit!39806)

(declare-fun Unit!39808 () Unit!39806)

(assert (=> b!1205322 (= e!684479 Unit!39808)))

(declare-fun b!1205323 () Bool)

(declare-fun lt!546550 () Unit!39806)

(assert (=> b!1205323 (= e!684485 lt!546550)))

(declare-fun lt!546562 () Unit!39806)

(declare-fun addStillContains!1007 (ListLongMap!17755 (_ BitVec 64) V!45969 (_ BitVec 64)) Unit!39806)

(assert (=> b!1205323 (= lt!546562 (addStillContains!1007 lt!546551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1205323 (= lt!546555 call!58431)))

(assert (=> b!1205323 call!58430))

(declare-fun call!58432 () Unit!39806)

(assert (=> b!1205323 (= lt!546550 call!58432)))

(assert (=> b!1205323 (contains!6895 (+!4024 lt!546555 (tuple2!19787 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1205324 () Bool)

(declare-fun lt!546561 () Unit!39806)

(assert (=> b!1205324 (= e!684479 lt!546561)))

(declare-fun call!58429 () Unit!39806)

(assert (=> b!1205324 (= lt!546561 call!58429)))

(assert (=> b!1205324 call!58434))

(declare-fun b!1205325 () Bool)

(declare-fun e!684488 () Bool)

(assert (=> b!1205325 (= e!684487 (not e!684488))))

(declare-fun res!801732 () Bool)

(assert (=> b!1205325 (=> res!801732 e!684488)))

(assert (=> b!1205325 (= res!801732 (bvsgt from!1455 i!673))))

(assert (=> b!1205325 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!546553 () Unit!39806)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77956 (_ BitVec 64) (_ BitVec 32)) Unit!39806)

(assert (=> b!1205325 (= lt!546553 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!58431 () Bool)

(assert (=> bm!58431 (= call!58432 (addStillContains!1007 (ite c!118255 lt!546555 lt!546551) (ite c!118255 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118256 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118255 minValue!944 (ite c!118256 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1205326 () Bool)

(assert (=> b!1205326 (= e!684478 e!684484)))

(declare-fun res!801722 () Bool)

(assert (=> b!1205326 (=> res!801722 e!684484)))

(assert (=> b!1205326 (= res!801722 (not (contains!6895 lt!546551 k0!934)))))

(assert (=> b!1205326 (= lt!546551 (getCurrentListMapNoExtraKeys!5339 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205327 () Bool)

(declare-fun c!118258 () Bool)

(assert (=> b!1205327 (= c!118258 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!546558))))

(assert (=> b!1205327 (= e!684482 e!684479)))

(declare-fun bm!58432 () Bool)

(declare-fun call!58435 () ListLongMap!17755)

(declare-fun lt!546552 () array!77958)

(assert (=> bm!58432 (= call!58435 (getCurrentListMapNoExtraKeys!5339 lt!546548 lt!546552 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205328 () Bool)

(assert (=> b!1205328 call!58434))

(declare-fun lt!546556 () Unit!39806)

(assert (=> b!1205328 (= lt!546556 call!58429)))

(assert (=> b!1205328 (= e!684482 lt!546556)))

(declare-fun b!1205329 () Bool)

(assert (=> b!1205329 (= e!684483 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!546558) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!47802 () Bool)

(assert (=> mapIsEmpty!47802 mapRes!47802))

(declare-fun b!1205330 () Bool)

(declare-fun res!801735 () Bool)

(assert (=> b!1205330 (=> (not res!801735) (not e!684475))))

(assert (=> b!1205330 (= res!801735 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26568))))

(declare-fun b!1205331 () Bool)

(declare-fun res!801733 () Bool)

(assert (=> b!1205331 (=> (not res!801733) (not e!684475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77956 (_ BitVec 32)) Bool)

(assert (=> b!1205331 (= res!801733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1205332 () Bool)

(declare-fun res!801736 () Bool)

(assert (=> b!1205332 (=> (not res!801736) (not e!684475))))

(assert (=> b!1205332 (= res!801736 (= (select (arr!37619 _keys!1208) i!673) k0!934))))

(declare-fun b!1205333 () Bool)

(declare-fun -!1784 (ListLongMap!17755 (_ BitVec 64)) ListLongMap!17755)

(assert (=> b!1205333 (= e!684473 (= call!58435 (-!1784 call!58433 k0!934)))))

(declare-fun bm!58433 () Bool)

(assert (=> bm!58433 (= call!58429 call!58432)))

(declare-fun b!1205334 () Bool)

(assert (=> b!1205334 (= e!684488 e!684477)))

(declare-fun res!801730 () Bool)

(assert (=> b!1205334 (=> res!801730 e!684477)))

(assert (=> b!1205334 (= res!801730 (not (= from!1455 i!673)))))

(declare-fun lt!546554 () ListLongMap!17755)

(assert (=> b!1205334 (= lt!546554 (getCurrentListMapNoExtraKeys!5339 lt!546548 lt!546552 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3209 (Int (_ BitVec 64)) V!45969)

(assert (=> b!1205334 (= lt!546552 (array!77959 (store (arr!37620 _values!996) i!673 (ValueCellFull!14606 (dynLambda!3209 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38158 _values!996)))))

(declare-fun lt!546549 () ListLongMap!17755)

(assert (=> b!1205334 (= lt!546549 (getCurrentListMapNoExtraKeys!5339 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1205335 () Bool)

(assert (=> b!1205335 (= e!684475 e!684487)))

(declare-fun res!801724 () Bool)

(assert (=> b!1205335 (=> (not res!801724) (not e!684487))))

(assert (=> b!1205335 (= res!801724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546548 mask!1564))))

(assert (=> b!1205335 (= lt!546548 (array!77957 (store (arr!37619 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38157 _keys!1208)))))

(declare-fun b!1205336 () Bool)

(declare-fun res!801725 () Bool)

(assert (=> b!1205336 (=> (not res!801725) (not e!684475))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1205336 (= res!801725 (validMask!0 mask!1564))))

(declare-fun b!1205337 () Bool)

(assert (=> b!1205337 (= e!684480 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1205338 () Bool)

(assert (=> b!1205338 (= e!684473 (= call!58435 call!58433))))

(assert (= (and start!100750 res!801731) b!1205336))

(assert (= (and b!1205336 res!801725) b!1205314))

(assert (= (and b!1205314 res!801729) b!1205331))

(assert (= (and b!1205331 res!801733) b!1205330))

(assert (= (and b!1205330 res!801735) b!1205318))

(assert (= (and b!1205318 res!801727) b!1205315))

(assert (= (and b!1205315 res!801728) b!1205332))

(assert (= (and b!1205332 res!801736) b!1205335))

(assert (= (and b!1205335 res!801724) b!1205312))

(assert (= (and b!1205312 res!801723) b!1205325))

(assert (= (and b!1205325 (not res!801732)) b!1205334))

(assert (= (and b!1205334 (not res!801730)) b!1205311))

(assert (= (and b!1205311 c!118257) b!1205333))

(assert (= (and b!1205311 (not c!118257)) b!1205338))

(assert (= (or b!1205333 b!1205338) bm!58432))

(assert (= (or b!1205333 b!1205338) bm!58430))

(assert (= (and b!1205311 (not res!801726)) b!1205326))

(assert (= (and b!1205326 (not res!801722)) b!1205313))

(assert (= (and b!1205313 c!118255) b!1205323))

(assert (= (and b!1205313 (not c!118255)) b!1205319))

(assert (= (and b!1205319 c!118256) b!1205328))

(assert (= (and b!1205319 (not c!118256)) b!1205327))

(assert (= (and b!1205327 c!118258) b!1205324))

(assert (= (and b!1205327 (not c!118258)) b!1205322))

(assert (= (or b!1205328 b!1205324) bm!58433))

(assert (= (or b!1205328 b!1205324) bm!58426))

(assert (= (or b!1205328 b!1205324) bm!58427))

(assert (= (or b!1205323 bm!58427) bm!58428))

(assert (= (or b!1205323 bm!58433) bm!58431))

(assert (= (or b!1205323 bm!58426) bm!58429))

(assert (= (and b!1205313 c!118254) b!1205317))

(assert (= (and b!1205313 (not c!118254)) b!1205329))

(assert (= (and b!1205313 res!801734) b!1205337))

(assert (= (and b!1205316 condMapEmpty!47802) mapIsEmpty!47802))

(assert (= (and b!1205316 (not condMapEmpty!47802)) mapNonEmpty!47802))

(get-info :version)

(assert (= (and mapNonEmpty!47802 ((_ is ValueCellFull!14606) mapValue!47802)) b!1205321))

(assert (= (and b!1205316 ((_ is ValueCellFull!14606) mapDefault!47802)) b!1205320))

(assert (= start!100750 b!1205316))

(declare-fun b_lambda!21305 () Bool)

(assert (=> (not b_lambda!21305) (not b!1205334)))

(declare-fun t!39468 () Bool)

(declare-fun tb!10719 () Bool)

(assert (=> (and start!100750 (= defaultEntry!1004 defaultEntry!1004) t!39468) tb!10719))

(declare-fun result!22031 () Bool)

(assert (=> tb!10719 (= result!22031 tp_is_empty!30631)))

(assert (=> b!1205334 t!39468))

(declare-fun b_and!42817 () Bool)

(assert (= b_and!42815 (and (=> t!39468 result!22031) b_and!42817)))

(declare-fun m!1110729 () Bool)

(assert (=> b!1205312 m!1110729))

(declare-fun m!1110731 () Bool)

(assert (=> b!1205330 m!1110731))

(declare-fun m!1110733 () Bool)

(assert (=> b!1205334 m!1110733))

(declare-fun m!1110735 () Bool)

(assert (=> b!1205334 m!1110735))

(declare-fun m!1110737 () Bool)

(assert (=> b!1205334 m!1110737))

(declare-fun m!1110739 () Bool)

(assert (=> b!1205334 m!1110739))

(declare-fun m!1110741 () Bool)

(assert (=> bm!58431 m!1110741))

(declare-fun m!1110743 () Bool)

(assert (=> b!1205311 m!1110743))

(declare-fun m!1110745 () Bool)

(assert (=> b!1205311 m!1110745))

(declare-fun m!1110747 () Bool)

(assert (=> b!1205333 m!1110747))

(declare-fun m!1110749 () Bool)

(assert (=> bm!58430 m!1110749))

(declare-fun m!1110751 () Bool)

(assert (=> bm!58432 m!1110751))

(declare-fun m!1110753 () Bool)

(assert (=> bm!58429 m!1110753))

(declare-fun m!1110755 () Bool)

(assert (=> b!1205331 m!1110755))

(declare-fun m!1110757 () Bool)

(assert (=> b!1205336 m!1110757))

(declare-fun m!1110759 () Bool)

(assert (=> b!1205325 m!1110759))

(declare-fun m!1110761 () Bool)

(assert (=> b!1205325 m!1110761))

(declare-fun m!1110763 () Bool)

(assert (=> b!1205313 m!1110763))

(declare-fun m!1110765 () Bool)

(assert (=> b!1205315 m!1110765))

(declare-fun m!1110767 () Bool)

(assert (=> b!1205317 m!1110767))

(declare-fun m!1110769 () Bool)

(assert (=> start!100750 m!1110769))

(declare-fun m!1110771 () Bool)

(assert (=> start!100750 m!1110771))

(declare-fun m!1110773 () Bool)

(assert (=> bm!58428 m!1110773))

(declare-fun m!1110775 () Bool)

(assert (=> mapNonEmpty!47802 m!1110775))

(declare-fun m!1110777 () Bool)

(assert (=> b!1205332 m!1110777))

(declare-fun m!1110779 () Bool)

(assert (=> b!1205323 m!1110779))

(declare-fun m!1110781 () Bool)

(assert (=> b!1205323 m!1110781))

(assert (=> b!1205323 m!1110781))

(declare-fun m!1110783 () Bool)

(assert (=> b!1205323 m!1110783))

(declare-fun m!1110785 () Bool)

(assert (=> b!1205326 m!1110785))

(assert (=> b!1205326 m!1110749))

(declare-fun m!1110787 () Bool)

(assert (=> b!1205335 m!1110787))

(declare-fun m!1110789 () Bool)

(assert (=> b!1205335 m!1110789))

(assert (=> b!1205337 m!1110767))

(check-sat (not bm!58431) (not start!100750) (not b_next!25927) (not b!1205331) (not bm!58432) (not b_lambda!21305) (not b!1205326) (not b!1205334) (not b!1205315) (not b!1205312) (not bm!58428) (not bm!58429) (not b!1205330) (not mapNonEmpty!47802) (not b!1205335) (not b!1205311) (not b!1205313) (not b!1205336) (not bm!58430) (not b!1205323) tp_is_empty!30631 (not b!1205317) (not b!1205325) (not b!1205333) (not b!1205337) b_and!42817)
(check-sat b_and!42817 (not b_next!25927))
