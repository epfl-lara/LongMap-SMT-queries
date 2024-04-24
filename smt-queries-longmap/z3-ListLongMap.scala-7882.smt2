; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98272 () Bool)

(assert start!98272)

(declare-fun b_free!23737 () Bool)

(declare-fun b_next!23737 () Bool)

(assert (=> start!98272 (= b_free!23737 (not b_next!23737))))

(declare-fun tp!83915 () Bool)

(declare-fun b_and!38267 () Bool)

(assert (=> start!98272 (= tp!83915 b_and!38267)))

(declare-fun b!1126521 () Bool)

(declare-fun e!641363 () Bool)

(declare-fun e!641361 () Bool)

(declare-fun mapRes!44218 () Bool)

(assert (=> b!1126521 (= e!641363 (and e!641361 mapRes!44218))))

(declare-fun condMapEmpty!44218 () Bool)

(declare-datatypes ((V!42817 0))(
  ( (V!42818 (val!14190 Int)) )
))
(declare-datatypes ((ValueCell!13424 0))(
  ( (ValueCellFull!13424 (v!16819 V!42817)) (EmptyCell!13424) )
))
(declare-datatypes ((array!73447 0))(
  ( (array!73448 (arr!35370 (Array (_ BitVec 32) ValueCell!13424)) (size!35907 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73447)

(declare-fun mapDefault!44218 () ValueCell!13424)

(assert (=> b!1126521 (= condMapEmpty!44218 (= (arr!35370 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13424)) mapDefault!44218)))))

(declare-fun b!1126522 () Bool)

(declare-fun e!641364 () Bool)

(declare-fun e!641365 () Bool)

(assert (=> b!1126522 (= e!641364 (not e!641365))))

(declare-fun res!752372 () Bool)

(assert (=> b!1126522 (=> res!752372 e!641365)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126522 (= res!752372 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!73449 0))(
  ( (array!73450 (arr!35371 (Array (_ BitVec 32) (_ BitVec 64))) (size!35908 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73449)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1126522 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36875 0))(
  ( (Unit!36876) )
))
(declare-fun lt!500272 () Unit!36875)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73449 (_ BitVec 64) (_ BitVec 32)) Unit!36875)

(assert (=> b!1126522 (= lt!500272 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1126523 () Bool)

(declare-fun res!752375 () Bool)

(declare-fun e!641367 () Bool)

(assert (=> b!1126523 (=> (not res!752375) (not e!641367))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126523 (= res!752375 (validKeyInArray!0 k0!934))))

(declare-fun zeroValue!944 () V!42817)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!47557 () Bool)

(declare-fun minValue!944 () V!42817)

(declare-datatypes ((tuple2!17846 0))(
  ( (tuple2!17847 (_1!8934 (_ BitVec 64)) (_2!8934 V!42817)) )
))
(declare-datatypes ((List!24635 0))(
  ( (Nil!24632) (Cons!24631 (h!25849 tuple2!17846) (t!35356 List!24635)) )
))
(declare-datatypes ((ListLongMap!15823 0))(
  ( (ListLongMap!15824 (toList!7927 List!24635)) )
))
(declare-fun call!47560 () ListLongMap!15823)

(declare-fun getCurrentListMapNoExtraKeys!4452 (array!73449 array!73447 (_ BitVec 32) (_ BitVec 32) V!42817 V!42817 (_ BitVec 32) Int) ListLongMap!15823)

(assert (=> bm!47557 (= call!47560 (getCurrentListMapNoExtraKeys!4452 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126524 () Bool)

(declare-fun res!752368 () Bool)

(assert (=> b!1126524 (=> (not res!752368) (not e!641367))))

(declare-datatypes ((List!24636 0))(
  ( (Nil!24633) (Cons!24632 (h!25850 (_ BitVec 64)) (t!35357 List!24636)) )
))
(declare-fun arrayNoDuplicates!0 (array!73449 (_ BitVec 32) List!24636) Bool)

(assert (=> b!1126524 (= res!752368 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24633))))

(declare-fun b!1126526 () Bool)

(declare-fun res!752366 () Bool)

(assert (=> b!1126526 (=> (not res!752366) (not e!641364))))

(declare-fun lt!500269 () array!73449)

(assert (=> b!1126526 (= res!752366 (arrayNoDuplicates!0 lt!500269 #b00000000000000000000000000000000 Nil!24633))))

(declare-fun b!1126527 () Bool)

(declare-fun res!752365 () Bool)

(assert (=> b!1126527 (=> (not res!752365) (not e!641367))))

(assert (=> b!1126527 (= res!752365 (= (select (arr!35371 _keys!1208) i!673) k0!934))))

(declare-fun b!1126528 () Bool)

(declare-fun e!641360 () Bool)

(assert (=> b!1126528 (= e!641365 e!641360)))

(declare-fun res!752369 () Bool)

(assert (=> b!1126528 (=> res!752369 e!641360)))

(assert (=> b!1126528 (= res!752369 (not (= from!1455 i!673)))))

(declare-fun lt!500273 () ListLongMap!15823)

(declare-fun lt!500275 () array!73447)

(assert (=> b!1126528 (= lt!500273 (getCurrentListMapNoExtraKeys!4452 lt!500269 lt!500275 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2528 (Int (_ BitVec 64)) V!42817)

(assert (=> b!1126528 (= lt!500275 (array!73448 (store (arr!35370 _values!996) i!673 (ValueCellFull!13424 (dynLambda!2528 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35907 _values!996)))))

(declare-fun lt!500271 () ListLongMap!15823)

(assert (=> b!1126528 (= lt!500271 (getCurrentListMapNoExtraKeys!4452 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1126529 () Bool)

(declare-fun e!641362 () Bool)

(declare-fun call!47561 () ListLongMap!15823)

(assert (=> b!1126529 (= e!641362 (= call!47561 call!47560))))

(declare-fun b!1126530 () Bool)

(declare-fun -!1112 (ListLongMap!15823 (_ BitVec 64)) ListLongMap!15823)

(assert (=> b!1126530 (= e!641362 (= call!47561 (-!1112 call!47560 k0!934)))))

(declare-fun b!1126531 () Bool)

(declare-fun res!752367 () Bool)

(assert (=> b!1126531 (=> (not res!752367) (not e!641367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1126531 (= res!752367 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!44218 () Bool)

(declare-fun tp!83914 () Bool)

(declare-fun e!641358 () Bool)

(assert (=> mapNonEmpty!44218 (= mapRes!44218 (and tp!83914 e!641358))))

(declare-fun mapRest!44218 () (Array (_ BitVec 32) ValueCell!13424))

(declare-fun mapValue!44218 () ValueCell!13424)

(declare-fun mapKey!44218 () (_ BitVec 32))

(assert (=> mapNonEmpty!44218 (= (arr!35370 _values!996) (store mapRest!44218 mapKey!44218 mapValue!44218))))

(declare-fun b!1126532 () Bool)

(declare-fun tp_is_empty!28267 () Bool)

(assert (=> b!1126532 (= e!641358 tp_is_empty!28267)))

(declare-fun b!1126533 () Bool)

(declare-fun e!641366 () Bool)

(assert (=> b!1126533 (= e!641360 e!641366)))

(declare-fun res!752373 () Bool)

(assert (=> b!1126533 (=> res!752373 e!641366)))

(assert (=> b!1126533 (= res!752373 (not (= (select (arr!35371 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1126533 e!641362))

(declare-fun c!110006 () Bool)

(assert (=> b!1126533 (= c!110006 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500268 () Unit!36875)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!373 (array!73449 array!73447 (_ BitVec 32) (_ BitVec 32) V!42817 V!42817 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36875)

(assert (=> b!1126533 (= lt!500268 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126534 () Bool)

(declare-fun res!752376 () Bool)

(assert (=> b!1126534 (=> (not res!752376) (not e!641367))))

(assert (=> b!1126534 (= res!752376 (and (= (size!35907 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35908 _keys!1208) (size!35907 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1126535 () Bool)

(declare-fun e!641359 () Bool)

(assert (=> b!1126535 (= e!641366 e!641359)))

(declare-fun res!752371 () Bool)

(assert (=> b!1126535 (=> res!752371 e!641359)))

(declare-fun lt!500274 () ListLongMap!15823)

(declare-fun contains!6477 (ListLongMap!15823 (_ BitVec 64)) Bool)

(assert (=> b!1126535 (= res!752371 (not (contains!6477 lt!500274 k0!934)))))

(assert (=> b!1126535 (= lt!500274 (getCurrentListMapNoExtraKeys!4452 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126536 () Bool)

(assert (=> b!1126536 (= e!641361 tp_is_empty!28267)))

(declare-fun res!752374 () Bool)

(assert (=> start!98272 (=> (not res!752374) (not e!641367))))

(assert (=> start!98272 (= res!752374 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35908 _keys!1208))))))

(assert (=> start!98272 e!641367))

(assert (=> start!98272 tp_is_empty!28267))

(declare-fun array_inv!27206 (array!73449) Bool)

(assert (=> start!98272 (array_inv!27206 _keys!1208)))

(assert (=> start!98272 true))

(assert (=> start!98272 tp!83915))

(declare-fun array_inv!27207 (array!73447) Bool)

(assert (=> start!98272 (and (array_inv!27207 _values!996) e!641363)))

(declare-fun b!1126525 () Bool)

(declare-fun res!752363 () Bool)

(assert (=> b!1126525 (=> (not res!752363) (not e!641367))))

(assert (=> b!1126525 (= res!752363 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35908 _keys!1208))))))

(declare-fun b!1126537 () Bool)

(declare-fun res!752370 () Bool)

(assert (=> b!1126537 (=> res!752370 e!641359)))

(assert (=> b!1126537 (= res!752370 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1126538 () Bool)

(assert (=> b!1126538 (= e!641367 e!641364)))

(declare-fun res!752364 () Bool)

(assert (=> b!1126538 (=> (not res!752364) (not e!641364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73449 (_ BitVec 32)) Bool)

(assert (=> b!1126538 (= res!752364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500269 mask!1564))))

(assert (=> b!1126538 (= lt!500269 (array!73450 (store (arr!35371 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35908 _keys!1208)))))

(declare-fun bm!47558 () Bool)

(assert (=> bm!47558 (= call!47561 (getCurrentListMapNoExtraKeys!4452 lt!500269 lt!500275 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126539 () Bool)

(declare-fun res!752377 () Bool)

(assert (=> b!1126539 (=> (not res!752377) (not e!641367))))

(assert (=> b!1126539 (= res!752377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!44218 () Bool)

(assert (=> mapIsEmpty!44218 mapRes!44218))

(declare-fun b!1126540 () Bool)

(assert (=> b!1126540 (= e!641359 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!35908 _keys!1208))))))

(declare-fun +!3453 (ListLongMap!15823 tuple2!17846) ListLongMap!15823)

(assert (=> b!1126540 (contains!6477 (+!3453 lt!500274 (tuple2!17847 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!500270 () Unit!36875)

(declare-fun addStillContains!679 (ListLongMap!15823 (_ BitVec 64) V!42817 (_ BitVec 64)) Unit!36875)

(assert (=> b!1126540 (= lt!500270 (addStillContains!679 lt!500274 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (= (and start!98272 res!752374) b!1126531))

(assert (= (and b!1126531 res!752367) b!1126534))

(assert (= (and b!1126534 res!752376) b!1126539))

(assert (= (and b!1126539 res!752377) b!1126524))

(assert (= (and b!1126524 res!752368) b!1126525))

(assert (= (and b!1126525 res!752363) b!1126523))

(assert (= (and b!1126523 res!752375) b!1126527))

(assert (= (and b!1126527 res!752365) b!1126538))

(assert (= (and b!1126538 res!752364) b!1126526))

(assert (= (and b!1126526 res!752366) b!1126522))

(assert (= (and b!1126522 (not res!752372)) b!1126528))

(assert (= (and b!1126528 (not res!752369)) b!1126533))

(assert (= (and b!1126533 c!110006) b!1126530))

(assert (= (and b!1126533 (not c!110006)) b!1126529))

(assert (= (or b!1126530 b!1126529) bm!47558))

(assert (= (or b!1126530 b!1126529) bm!47557))

(assert (= (and b!1126533 (not res!752373)) b!1126535))

(assert (= (and b!1126535 (not res!752371)) b!1126537))

(assert (= (and b!1126537 (not res!752370)) b!1126540))

(assert (= (and b!1126521 condMapEmpty!44218) mapIsEmpty!44218))

(assert (= (and b!1126521 (not condMapEmpty!44218)) mapNonEmpty!44218))

(get-info :version)

(assert (= (and mapNonEmpty!44218 ((_ is ValueCellFull!13424) mapValue!44218)) b!1126532))

(assert (= (and b!1126521 ((_ is ValueCellFull!13424) mapDefault!44218)) b!1126536))

(assert (= start!98272 b!1126521))

(declare-fun b_lambda!18717 () Bool)

(assert (=> (not b_lambda!18717) (not b!1126528)))

(declare-fun t!35355 () Bool)

(declare-fun tb!8541 () Bool)

(assert (=> (and start!98272 (= defaultEntry!1004 defaultEntry!1004) t!35355) tb!8541))

(declare-fun result!17651 () Bool)

(assert (=> tb!8541 (= result!17651 tp_is_empty!28267)))

(assert (=> b!1126528 t!35355))

(declare-fun b_and!38269 () Bool)

(assert (= b_and!38267 (and (=> t!35355 result!17651) b_and!38269)))

(declare-fun m!1041041 () Bool)

(assert (=> bm!47557 m!1041041))

(declare-fun m!1041043 () Bool)

(assert (=> mapNonEmpty!44218 m!1041043))

(declare-fun m!1041045 () Bool)

(assert (=> b!1126531 m!1041045))

(declare-fun m!1041047 () Bool)

(assert (=> b!1126538 m!1041047))

(declare-fun m!1041049 () Bool)

(assert (=> b!1126538 m!1041049))

(declare-fun m!1041051 () Bool)

(assert (=> b!1126539 m!1041051))

(declare-fun m!1041053 () Bool)

(assert (=> bm!47558 m!1041053))

(declare-fun m!1041055 () Bool)

(assert (=> b!1126522 m!1041055))

(declare-fun m!1041057 () Bool)

(assert (=> b!1126522 m!1041057))

(declare-fun m!1041059 () Bool)

(assert (=> b!1126528 m!1041059))

(declare-fun m!1041061 () Bool)

(assert (=> b!1126528 m!1041061))

(declare-fun m!1041063 () Bool)

(assert (=> b!1126528 m!1041063))

(declare-fun m!1041065 () Bool)

(assert (=> b!1126528 m!1041065))

(declare-fun m!1041067 () Bool)

(assert (=> b!1126540 m!1041067))

(assert (=> b!1126540 m!1041067))

(declare-fun m!1041069 () Bool)

(assert (=> b!1126540 m!1041069))

(declare-fun m!1041071 () Bool)

(assert (=> b!1126540 m!1041071))

(declare-fun m!1041073 () Bool)

(assert (=> b!1126533 m!1041073))

(declare-fun m!1041075 () Bool)

(assert (=> b!1126533 m!1041075))

(declare-fun m!1041077 () Bool)

(assert (=> b!1126523 m!1041077))

(declare-fun m!1041079 () Bool)

(assert (=> start!98272 m!1041079))

(declare-fun m!1041081 () Bool)

(assert (=> start!98272 m!1041081))

(declare-fun m!1041083 () Bool)

(assert (=> b!1126530 m!1041083))

(declare-fun m!1041085 () Bool)

(assert (=> b!1126535 m!1041085))

(assert (=> b!1126535 m!1041041))

(declare-fun m!1041087 () Bool)

(assert (=> b!1126524 m!1041087))

(declare-fun m!1041089 () Bool)

(assert (=> b!1126527 m!1041089))

(declare-fun m!1041091 () Bool)

(assert (=> b!1126526 m!1041091))

(check-sat (not b!1126538) (not start!98272) (not b!1126526) tp_is_empty!28267 (not b!1126522) (not b!1126528) (not b!1126540) (not b!1126524) (not b_lambda!18717) (not b!1126531) (not mapNonEmpty!44218) (not b_next!23737) (not b!1126539) (not bm!47558) (not b!1126535) (not b!1126533) b_and!38269 (not b!1126530) (not bm!47557) (not b!1126523))
(check-sat b_and!38269 (not b_next!23737))
