; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101574 () Bool)

(assert start!101574)

(declare-fun b_free!26335 () Bool)

(declare-fun b_next!26335 () Bool)

(assert (=> start!101574 (= b_free!26335 (not b_next!26335))))

(declare-fun tp!92045 () Bool)

(declare-fun b_and!43877 () Bool)

(assert (=> start!101574 (= tp!92045 b_and!43877)))

(declare-fun mapIsEmpty!48451 () Bool)

(declare-fun mapRes!48451 () Bool)

(assert (=> mapIsEmpty!48451 mapRes!48451))

(declare-fun b!1221296 () Bool)

(declare-fun e!693550 () Bool)

(declare-fun e!693556 () Bool)

(assert (=> b!1221296 (= e!693550 e!693556)))

(declare-fun res!811359 () Bool)

(assert (=> b!1221296 (=> res!811359 e!693556)))

(declare-datatypes ((array!78780 0))(
  ( (array!78781 (arr!38019 (Array (_ BitVec 32) (_ BitVec 64))) (size!38557 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78780)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1221296 (= res!811359 (not (= (select (arr!38019 _keys!1208) from!1455) k0!934)))))

(declare-fun e!693547 () Bool)

(assert (=> b!1221296 e!693547))

(declare-fun res!811367 () Bool)

(assert (=> b!1221296 (=> (not res!811367) (not e!693547))))

(declare-datatypes ((V!46513 0))(
  ( (V!46514 (val!15576 Int)) )
))
(declare-fun lt!555387 () V!46513)

(declare-datatypes ((ValueCell!14810 0))(
  ( (ValueCellFull!14810 (v!18234 V!46513)) (EmptyCell!14810) )
))
(declare-datatypes ((array!78782 0))(
  ( (array!78783 (arr!38020 (Array (_ BitVec 32) ValueCell!14810)) (size!38558 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78782)

(declare-datatypes ((tuple2!20138 0))(
  ( (tuple2!20139 (_1!10080 (_ BitVec 64)) (_2!10080 V!46513)) )
))
(declare-datatypes ((List!26917 0))(
  ( (Nil!26914) (Cons!26913 (h!28122 tuple2!20138) (t!40223 List!26917)) )
))
(declare-datatypes ((ListLongMap!18107 0))(
  ( (ListLongMap!18108 (toList!9069 List!26917)) )
))
(declare-fun lt!555389 () ListLongMap!18107)

(declare-fun lt!555390 () ListLongMap!18107)

(declare-fun +!4132 (ListLongMap!18107 tuple2!20138) ListLongMap!18107)

(declare-fun get!19415 (ValueCell!14810 V!46513) V!46513)

(assert (=> b!1221296 (= res!811367 (= lt!555390 (+!4132 lt!555389 (tuple2!20139 (select (arr!38019 _keys!1208) from!1455) (get!19415 (select (arr!38020 _values!996) from!1455) lt!555387)))))))

(declare-fun mapNonEmpty!48451 () Bool)

(declare-fun tp!92044 () Bool)

(declare-fun e!693545 () Bool)

(assert (=> mapNonEmpty!48451 (= mapRes!48451 (and tp!92044 e!693545))))

(declare-fun mapRest!48451 () (Array (_ BitVec 32) ValueCell!14810))

(declare-fun mapValue!48451 () ValueCell!14810)

(declare-fun mapKey!48451 () (_ BitVec 32))

(assert (=> mapNonEmpty!48451 (= (arr!38020 _values!996) (store mapRest!48451 mapKey!48451 mapValue!48451))))

(declare-fun b!1221297 () Bool)

(declare-fun e!693549 () Bool)

(assert (=> b!1221297 (= e!693556 e!693549)))

(declare-fun res!811364 () Bool)

(assert (=> b!1221297 (=> res!811364 e!693549)))

(assert (=> b!1221297 (= res!811364 (or (bvsge (size!38557 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38557 _keys!1208)) (bvsge from!1455 (size!38557 _keys!1208))))))

(declare-datatypes ((List!26918 0))(
  ( (Nil!26915) (Cons!26914 (h!28123 (_ BitVec 64)) (t!40224 List!26918)) )
))
(declare-fun arrayNoDuplicates!0 (array!78780 (_ BitVec 32) List!26918) Bool)

(assert (=> b!1221297 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26915)))

(declare-datatypes ((Unit!40309 0))(
  ( (Unit!40310) )
))
(declare-fun lt!555392 () Unit!40309)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78780 (_ BitVec 32) (_ BitVec 32)) Unit!40309)

(assert (=> b!1221297 (= lt!555392 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun arrayContainsKey!0 (array!78780 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1221297 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555395 () Unit!40309)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78780 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40309)

(assert (=> b!1221297 (= lt!555395 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1221298 () Bool)

(declare-fun e!693543 () Bool)

(assert (=> b!1221298 (= e!693549 e!693543)))

(declare-fun res!811352 () Bool)

(assert (=> b!1221298 (=> (not res!811352) (not e!693543))))

(declare-fun contains!6998 (List!26918 (_ BitVec 64)) Bool)

(assert (=> b!1221298 (= res!811352 (not (contains!6998 Nil!26915 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221299 () Bool)

(declare-fun tp_is_empty!31039 () Bool)

(assert (=> b!1221299 (= e!693545 tp_is_empty!31039)))

(declare-fun b!1221300 () Bool)

(declare-fun res!811366 () Bool)

(declare-fun e!693552 () Bool)

(assert (=> b!1221300 (=> (not res!811366) (not e!693552))))

(assert (=> b!1221300 (= res!811366 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26915))))

(declare-fun b!1221301 () Bool)

(assert (=> b!1221301 (= e!693543 (not (contains!6998 Nil!26915 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221302 () Bool)

(declare-fun e!693554 () Bool)

(assert (=> b!1221302 (= e!693552 e!693554)))

(declare-fun res!811365 () Bool)

(assert (=> b!1221302 (=> (not res!811365) (not e!693554))))

(declare-fun lt!555394 () array!78780)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78780 (_ BitVec 32)) Bool)

(assert (=> b!1221302 (= res!811365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555394 mask!1564))))

(assert (=> b!1221302 (= lt!555394 (array!78781 (store (arr!38019 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38557 _keys!1208)))))

(declare-fun res!811353 () Bool)

(assert (=> start!101574 (=> (not res!811353) (not e!693552))))

(assert (=> start!101574 (= res!811353 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38557 _keys!1208))))))

(assert (=> start!101574 e!693552))

(assert (=> start!101574 tp_is_empty!31039))

(declare-fun array_inv!29054 (array!78780) Bool)

(assert (=> start!101574 (array_inv!29054 _keys!1208)))

(assert (=> start!101574 true))

(assert (=> start!101574 tp!92045))

(declare-fun e!693555 () Bool)

(declare-fun array_inv!29055 (array!78782) Bool)

(assert (=> start!101574 (and (array_inv!29055 _values!996) e!693555)))

(declare-fun b!1221303 () Bool)

(declare-fun e!693548 () Bool)

(assert (=> b!1221303 (= e!693547 e!693548)))

(declare-fun res!811361 () Bool)

(assert (=> b!1221303 (=> res!811361 e!693548)))

(assert (=> b!1221303 (= res!811361 (not (= (select (arr!38019 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1221304 () Bool)

(declare-fun res!811360 () Bool)

(assert (=> b!1221304 (=> (not res!811360) (not e!693552))))

(assert (=> b!1221304 (= res!811360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1221305 () Bool)

(declare-fun e!693551 () Bool)

(assert (=> b!1221305 (= e!693554 (not e!693551))))

(declare-fun res!811357 () Bool)

(assert (=> b!1221305 (=> res!811357 e!693551)))

(assert (=> b!1221305 (= res!811357 (bvsgt from!1455 i!673))))

(assert (=> b!1221305 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555384 () Unit!40309)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78780 (_ BitVec 64) (_ BitVec 32)) Unit!40309)

(assert (=> b!1221305 (= lt!555384 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1221306 () Bool)

(declare-fun e!693546 () Bool)

(assert (=> b!1221306 (= e!693546 tp_is_empty!31039)))

(declare-fun b!1221307 () Bool)

(declare-fun res!811363 () Bool)

(assert (=> b!1221307 (=> res!811363 e!693549)))

(declare-fun noDuplicate!1647 (List!26918) Bool)

(assert (=> b!1221307 (= res!811363 (not (noDuplicate!1647 Nil!26915)))))

(declare-fun b!1221308 () Bool)

(declare-fun res!811362 () Bool)

(assert (=> b!1221308 (=> (not res!811362) (not e!693552))))

(assert (=> b!1221308 (= res!811362 (= (select (arr!38019 _keys!1208) i!673) k0!934))))

(declare-fun b!1221309 () Bool)

(declare-fun res!811354 () Bool)

(assert (=> b!1221309 (=> (not res!811354) (not e!693552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1221309 (= res!811354 (validMask!0 mask!1564))))

(declare-fun b!1221310 () Bool)

(declare-fun e!693544 () Bool)

(assert (=> b!1221310 (= e!693544 e!693550)))

(declare-fun res!811351 () Bool)

(assert (=> b!1221310 (=> res!811351 e!693550)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1221310 (= res!811351 (not (validKeyInArray!0 (select (arr!38019 _keys!1208) from!1455))))))

(declare-fun lt!555386 () ListLongMap!18107)

(assert (=> b!1221310 (= lt!555386 lt!555389)))

(declare-fun lt!555385 () ListLongMap!18107)

(declare-fun -!1896 (ListLongMap!18107 (_ BitVec 64)) ListLongMap!18107)

(assert (=> b!1221310 (= lt!555389 (-!1896 lt!555385 k0!934))))

(declare-fun zeroValue!944 () V!46513)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!555393 () array!78782)

(declare-fun minValue!944 () V!46513)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5504 (array!78780 array!78782 (_ BitVec 32) (_ BitVec 32) V!46513 V!46513 (_ BitVec 32) Int) ListLongMap!18107)

(assert (=> b!1221310 (= lt!555386 (getCurrentListMapNoExtraKeys!5504 lt!555394 lt!555393 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1221310 (= lt!555385 (getCurrentListMapNoExtraKeys!5504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!555391 () Unit!40309)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1131 (array!78780 array!78782 (_ BitVec 32) (_ BitVec 32) V!46513 V!46513 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40309)

(assert (=> b!1221310 (= lt!555391 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1131 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1221311 () Bool)

(declare-fun res!811356 () Bool)

(assert (=> b!1221311 (=> (not res!811356) (not e!693554))))

(assert (=> b!1221311 (= res!811356 (arrayNoDuplicates!0 lt!555394 #b00000000000000000000000000000000 Nil!26915))))

(declare-fun b!1221312 () Bool)

(assert (=> b!1221312 (= e!693551 e!693544)))

(declare-fun res!811350 () Bool)

(assert (=> b!1221312 (=> res!811350 e!693544)))

(assert (=> b!1221312 (= res!811350 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1221312 (= lt!555390 (getCurrentListMapNoExtraKeys!5504 lt!555394 lt!555393 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1221312 (= lt!555393 (array!78783 (store (arr!38020 _values!996) i!673 (ValueCellFull!14810 lt!555387)) (size!38558 _values!996)))))

(declare-fun dynLambda!3352 (Int (_ BitVec 64)) V!46513)

(assert (=> b!1221312 (= lt!555387 (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555388 () ListLongMap!18107)

(assert (=> b!1221312 (= lt!555388 (getCurrentListMapNoExtraKeys!5504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1221313 () Bool)

(declare-fun res!811358 () Bool)

(assert (=> b!1221313 (=> (not res!811358) (not e!693552))))

(assert (=> b!1221313 (= res!811358 (validKeyInArray!0 k0!934))))

(declare-fun b!1221314 () Bool)

(declare-fun res!811349 () Bool)

(assert (=> b!1221314 (=> (not res!811349) (not e!693552))))

(assert (=> b!1221314 (= res!811349 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38557 _keys!1208))))))

(declare-fun b!1221315 () Bool)

(assert (=> b!1221315 (= e!693548 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1221316 () Bool)

(declare-fun res!811355 () Bool)

(assert (=> b!1221316 (=> (not res!811355) (not e!693552))))

(assert (=> b!1221316 (= res!811355 (and (= (size!38558 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38557 _keys!1208) (size!38558 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1221317 () Bool)

(assert (=> b!1221317 (= e!693555 (and e!693546 mapRes!48451))))

(declare-fun condMapEmpty!48451 () Bool)

(declare-fun mapDefault!48451 () ValueCell!14810)

(assert (=> b!1221317 (= condMapEmpty!48451 (= (arr!38020 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14810)) mapDefault!48451)))))

(assert (= (and start!101574 res!811353) b!1221309))

(assert (= (and b!1221309 res!811354) b!1221316))

(assert (= (and b!1221316 res!811355) b!1221304))

(assert (= (and b!1221304 res!811360) b!1221300))

(assert (= (and b!1221300 res!811366) b!1221314))

(assert (= (and b!1221314 res!811349) b!1221313))

(assert (= (and b!1221313 res!811358) b!1221308))

(assert (= (and b!1221308 res!811362) b!1221302))

(assert (= (and b!1221302 res!811365) b!1221311))

(assert (= (and b!1221311 res!811356) b!1221305))

(assert (= (and b!1221305 (not res!811357)) b!1221312))

(assert (= (and b!1221312 (not res!811350)) b!1221310))

(assert (= (and b!1221310 (not res!811351)) b!1221296))

(assert (= (and b!1221296 res!811367) b!1221303))

(assert (= (and b!1221303 (not res!811361)) b!1221315))

(assert (= (and b!1221296 (not res!811359)) b!1221297))

(assert (= (and b!1221297 (not res!811364)) b!1221307))

(assert (= (and b!1221307 (not res!811363)) b!1221298))

(assert (= (and b!1221298 res!811352) b!1221301))

(assert (= (and b!1221317 condMapEmpty!48451) mapIsEmpty!48451))

(assert (= (and b!1221317 (not condMapEmpty!48451)) mapNonEmpty!48451))

(get-info :version)

(assert (= (and mapNonEmpty!48451 ((_ is ValueCellFull!14810) mapValue!48451)) b!1221299))

(assert (= (and b!1221317 ((_ is ValueCellFull!14810) mapDefault!48451)) b!1221306))

(assert (= start!101574 b!1221317))

(declare-fun b_lambda!22229 () Bool)

(assert (=> (not b_lambda!22229) (not b!1221312)))

(declare-fun t!40222 () Bool)

(declare-fun tb!11127 () Bool)

(assert (=> (and start!101574 (= defaultEntry!1004 defaultEntry!1004) t!40222) tb!11127))

(declare-fun result!22871 () Bool)

(assert (=> tb!11127 (= result!22871 tp_is_empty!31039)))

(assert (=> b!1221312 t!40222))

(declare-fun b_and!43879 () Bool)

(assert (= b_and!43877 (and (=> t!40222 result!22871) b_and!43879)))

(declare-fun m!1125719 () Bool)

(assert (=> b!1221307 m!1125719))

(declare-fun m!1125721 () Bool)

(assert (=> b!1221310 m!1125721))

(declare-fun m!1125723 () Bool)

(assert (=> b!1221310 m!1125723))

(declare-fun m!1125725 () Bool)

(assert (=> b!1221310 m!1125725))

(declare-fun m!1125727 () Bool)

(assert (=> b!1221310 m!1125727))

(declare-fun m!1125729 () Bool)

(assert (=> b!1221310 m!1125729))

(declare-fun m!1125731 () Bool)

(assert (=> b!1221310 m!1125731))

(assert (=> b!1221310 m!1125727))

(declare-fun m!1125733 () Bool)

(assert (=> start!101574 m!1125733))

(declare-fun m!1125735 () Bool)

(assert (=> start!101574 m!1125735))

(declare-fun m!1125737 () Bool)

(assert (=> b!1221298 m!1125737))

(declare-fun m!1125739 () Bool)

(assert (=> b!1221309 m!1125739))

(declare-fun m!1125741 () Bool)

(assert (=> b!1221297 m!1125741))

(declare-fun m!1125743 () Bool)

(assert (=> b!1221297 m!1125743))

(declare-fun m!1125745 () Bool)

(assert (=> b!1221297 m!1125745))

(declare-fun m!1125747 () Bool)

(assert (=> b!1221297 m!1125747))

(assert (=> b!1221303 m!1125727))

(declare-fun m!1125749 () Bool)

(assert (=> b!1221304 m!1125749))

(declare-fun m!1125751 () Bool)

(assert (=> b!1221305 m!1125751))

(declare-fun m!1125753 () Bool)

(assert (=> b!1221305 m!1125753))

(declare-fun m!1125755 () Bool)

(assert (=> b!1221302 m!1125755))

(declare-fun m!1125757 () Bool)

(assert (=> b!1221302 m!1125757))

(declare-fun m!1125759 () Bool)

(assert (=> b!1221315 m!1125759))

(declare-fun m!1125761 () Bool)

(assert (=> b!1221311 m!1125761))

(assert (=> b!1221296 m!1125727))

(declare-fun m!1125763 () Bool)

(assert (=> b!1221296 m!1125763))

(assert (=> b!1221296 m!1125763))

(declare-fun m!1125765 () Bool)

(assert (=> b!1221296 m!1125765))

(declare-fun m!1125767 () Bool)

(assert (=> b!1221296 m!1125767))

(declare-fun m!1125769 () Bool)

(assert (=> b!1221301 m!1125769))

(declare-fun m!1125771 () Bool)

(assert (=> b!1221308 m!1125771))

(declare-fun m!1125773 () Bool)

(assert (=> b!1221300 m!1125773))

(declare-fun m!1125775 () Bool)

(assert (=> mapNonEmpty!48451 m!1125775))

(declare-fun m!1125777 () Bool)

(assert (=> b!1221312 m!1125777))

(declare-fun m!1125779 () Bool)

(assert (=> b!1221312 m!1125779))

(declare-fun m!1125781 () Bool)

(assert (=> b!1221312 m!1125781))

(declare-fun m!1125783 () Bool)

(assert (=> b!1221312 m!1125783))

(declare-fun m!1125785 () Bool)

(assert (=> b!1221313 m!1125785))

(check-sat (not b!1221305) (not start!101574) (not b!1221310) (not b!1221313) (not b!1221309) (not b!1221307) (not b!1221315) (not b_lambda!22229) (not b!1221298) (not b!1221311) (not b!1221296) (not b!1221304) (not b!1221301) (not mapNonEmpty!48451) tp_is_empty!31039 (not b!1221297) (not b!1221300) (not b_next!26335) (not b!1221312) b_and!43879 (not b!1221302))
(check-sat b_and!43879 (not b_next!26335))
(get-model)

(declare-fun b_lambda!22235 () Bool)

(assert (= b_lambda!22229 (or (and start!101574 b_free!26335) b_lambda!22235)))

(check-sat (not b!1221305) (not start!101574) (not b!1221310) (not b!1221313) (not b!1221309) (not b!1221307) (not b!1221315) (not b!1221298) (not b!1221311) (not b!1221296) (not b!1221304) (not b!1221301) (not mapNonEmpty!48451) tp_is_empty!31039 (not b_lambda!22235) (not b!1221297) (not b!1221300) (not b_next!26335) (not b!1221312) b_and!43879 (not b!1221302))
(check-sat b_and!43879 (not b_next!26335))
(get-model)

(declare-fun d!133701 () Bool)

(declare-fun lt!555470 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!545 (List!26918) (InoxSet (_ BitVec 64)))

(assert (=> d!133701 (= lt!555470 (select (content!545 Nil!26915) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!693645 () Bool)

(assert (=> d!133701 (= lt!555470 e!693645)))

(declare-fun res!811486 () Bool)

(assert (=> d!133701 (=> (not res!811486) (not e!693645))))

(assert (=> d!133701 (= res!811486 ((_ is Cons!26914) Nil!26915))))

(assert (=> d!133701 (= (contains!6998 Nil!26915 #b0000000000000000000000000000000000000000000000000000000000000000) lt!555470)))

(declare-fun b!1221460 () Bool)

(declare-fun e!693646 () Bool)

(assert (=> b!1221460 (= e!693645 e!693646)))

(declare-fun res!811487 () Bool)

(assert (=> b!1221460 (=> res!811487 e!693646)))

(assert (=> b!1221460 (= res!811487 (= (h!28123 Nil!26915) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1221461 () Bool)

(assert (=> b!1221461 (= e!693646 (contains!6998 (t!40224 Nil!26915) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!133701 res!811486) b!1221460))

(assert (= (and b!1221460 (not res!811487)) b!1221461))

(declare-fun m!1125923 () Bool)

(assert (=> d!133701 m!1125923))

(declare-fun m!1125925 () Bool)

(assert (=> d!133701 m!1125925))

(declare-fun m!1125927 () Bool)

(assert (=> b!1221461 m!1125927))

(assert (=> b!1221298 d!133701))

(declare-fun d!133703 () Bool)

(assert (=> d!133703 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1221309 d!133703))

(declare-fun d!133705 () Bool)

(assert (=> d!133705 (= (validKeyInArray!0 (select (arr!38019 _keys!1208) from!1455)) (and (not (= (select (arr!38019 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38019 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1221310 d!133705))

(declare-fun b!1221468 () Bool)

(declare-fun e!693651 () Bool)

(declare-fun call!60711 () ListLongMap!18107)

(declare-fun call!60712 () ListLongMap!18107)

(assert (=> b!1221468 (= e!693651 (= call!60711 call!60712))))

(assert (=> b!1221468 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38558 _values!996)))))

(declare-fun b!1221469 () Bool)

(declare-fun e!693652 () Bool)

(assert (=> b!1221469 (= e!693652 e!693651)))

(declare-fun c!120260 () Bool)

(assert (=> b!1221469 (= c!120260 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun bm!60708 () Bool)

(assert (=> bm!60708 (= call!60712 (getCurrentListMapNoExtraKeys!5504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!60709 () Bool)

(assert (=> bm!60709 (= call!60711 (getCurrentListMapNoExtraKeys!5504 (array!78781 (store (arr!38019 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38557 _keys!1208)) (array!78783 (store (arr!38020 _values!996) i!673 (ValueCellFull!14810 (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38558 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!133707 () Bool)

(assert (=> d!133707 e!693652))

(declare-fun res!811490 () Bool)

(assert (=> d!133707 (=> (not res!811490) (not e!693652))))

(assert (=> d!133707 (= res!811490 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38557 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38557 _keys!1208))))))))

(declare-fun lt!555473 () Unit!40309)

(declare-fun choose!1835 (array!78780 array!78782 (_ BitVec 32) (_ BitVec 32) V!46513 V!46513 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40309)

(assert (=> d!133707 (= lt!555473 (choose!1835 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133707 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38557 _keys!1208)))))

(assert (=> d!133707 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1131 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!555473)))

(declare-fun b!1221470 () Bool)

(assert (=> b!1221470 (= e!693651 (= call!60711 (-!1896 call!60712 k0!934)))))

(assert (=> b!1221470 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38558 _values!996)))))

(assert (= (and d!133707 res!811490) b!1221469))

(assert (= (and b!1221469 c!120260) b!1221470))

(assert (= (and b!1221469 (not c!120260)) b!1221468))

(assert (= (or b!1221470 b!1221468) bm!60708))

(assert (= (or b!1221470 b!1221468) bm!60709))

(declare-fun b_lambda!22237 () Bool)

(assert (=> (not b_lambda!22237) (not bm!60709)))

(assert (=> bm!60709 t!40222))

(declare-fun b_and!43889 () Bool)

(assert (= b_and!43879 (and (=> t!40222 result!22871) b_and!43889)))

(assert (=> bm!60708 m!1125721))

(assert (=> bm!60709 m!1125757))

(assert (=> bm!60709 m!1125781))

(declare-fun m!1125929 () Bool)

(assert (=> bm!60709 m!1125929))

(declare-fun m!1125931 () Bool)

(assert (=> bm!60709 m!1125931))

(declare-fun m!1125933 () Bool)

(assert (=> d!133707 m!1125933))

(declare-fun m!1125935 () Bool)

(assert (=> b!1221470 m!1125935))

(assert (=> b!1221310 d!133707))

(declare-fun d!133709 () Bool)

(declare-fun lt!555476 () ListLongMap!18107)

(declare-fun contains!7000 (ListLongMap!18107 (_ BitVec 64)) Bool)

(assert (=> d!133709 (not (contains!7000 lt!555476 k0!934))))

(declare-fun removeStrictlySorted!109 (List!26917 (_ BitVec 64)) List!26917)

(assert (=> d!133709 (= lt!555476 (ListLongMap!18108 (removeStrictlySorted!109 (toList!9069 lt!555385) k0!934)))))

(assert (=> d!133709 (= (-!1896 lt!555385 k0!934) lt!555476)))

(declare-fun bs!34354 () Bool)

(assert (= bs!34354 d!133709))

(declare-fun m!1125937 () Bool)

(assert (=> bs!34354 m!1125937))

(declare-fun m!1125939 () Bool)

(assert (=> bs!34354 m!1125939))

(assert (=> b!1221310 d!133709))

(declare-fun b!1221495 () Bool)

(declare-fun e!693667 () ListLongMap!18107)

(declare-fun call!60715 () ListLongMap!18107)

(assert (=> b!1221495 (= e!693667 call!60715)))

(declare-fun b!1221496 () Bool)

(declare-fun e!693668 () Bool)

(declare-fun e!693671 () Bool)

(assert (=> b!1221496 (= e!693668 e!693671)))

(declare-fun c!120270 () Bool)

(assert (=> b!1221496 (= c!120270 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38557 _keys!1208)))))

(declare-fun b!1221497 () Bool)

(declare-fun e!693672 () Bool)

(assert (=> b!1221497 (= e!693668 e!693672)))

(assert (=> b!1221497 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38557 _keys!1208)))))

(declare-fun res!811501 () Bool)

(declare-fun lt!555492 () ListLongMap!18107)

(assert (=> b!1221497 (= res!811501 (contains!7000 lt!555492 (select (arr!38019 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1221497 (=> (not res!811501) (not e!693672))))

(declare-fun bm!60712 () Bool)

(assert (=> bm!60712 (= call!60715 (getCurrentListMapNoExtraKeys!5504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1221498 () Bool)

(declare-fun lt!555495 () Unit!40309)

(declare-fun lt!555493 () Unit!40309)

(assert (=> b!1221498 (= lt!555495 lt!555493)))

(declare-fun lt!555497 () (_ BitVec 64))

(declare-fun lt!555494 () V!46513)

(declare-fun lt!555496 () ListLongMap!18107)

(declare-fun lt!555491 () (_ BitVec 64))

(assert (=> b!1221498 (not (contains!7000 (+!4132 lt!555496 (tuple2!20139 lt!555491 lt!555494)) lt!555497))))

(declare-fun addStillNotContains!305 (ListLongMap!18107 (_ BitVec 64) V!46513 (_ BitVec 64)) Unit!40309)

(assert (=> b!1221498 (= lt!555493 (addStillNotContains!305 lt!555496 lt!555491 lt!555494 lt!555497))))

(assert (=> b!1221498 (= lt!555497 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1221498 (= lt!555494 (get!19415 (select (arr!38020 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1221498 (= lt!555491 (select (arr!38019 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1221498 (= lt!555496 call!60715)))

(assert (=> b!1221498 (= e!693667 (+!4132 call!60715 (tuple2!20139 (select (arr!38019 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19415 (select (arr!38020 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1221499 () Bool)

(assert (=> b!1221499 (= e!693671 (= lt!555492 (getCurrentListMapNoExtraKeys!5504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1221500 () Bool)

(declare-fun e!693670 () ListLongMap!18107)

(assert (=> b!1221500 (= e!693670 (ListLongMap!18108 Nil!26914))))

(declare-fun b!1221501 () Bool)

(declare-fun e!693673 () Bool)

(assert (=> b!1221501 (= e!693673 e!693668)))

(declare-fun c!120269 () Bool)

(declare-fun e!693669 () Bool)

(assert (=> b!1221501 (= c!120269 e!693669)))

(declare-fun res!811500 () Bool)

(assert (=> b!1221501 (=> (not res!811500) (not e!693669))))

(assert (=> b!1221501 (= res!811500 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38557 _keys!1208)))))

(declare-fun b!1221502 () Bool)

(declare-fun isEmpty!1005 (ListLongMap!18107) Bool)

(assert (=> b!1221502 (= e!693671 (isEmpty!1005 lt!555492))))

(declare-fun b!1221503 () Bool)

(assert (=> b!1221503 (= e!693669 (validKeyInArray!0 (select (arr!38019 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1221503 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1221505 () Bool)

(declare-fun res!811502 () Bool)

(assert (=> b!1221505 (=> (not res!811502) (not e!693673))))

(assert (=> b!1221505 (= res!811502 (not (contains!7000 lt!555492 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221506 () Bool)

(assert (=> b!1221506 (= e!693670 e!693667)))

(declare-fun c!120271 () Bool)

(assert (=> b!1221506 (= c!120271 (validKeyInArray!0 (select (arr!38019 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1221504 () Bool)

(assert (=> b!1221504 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38557 _keys!1208)))))

(assert (=> b!1221504 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38558 _values!996)))))

(declare-fun apply!969 (ListLongMap!18107 (_ BitVec 64)) V!46513)

(assert (=> b!1221504 (= e!693672 (= (apply!969 lt!555492 (select (arr!38019 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19415 (select (arr!38020 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!133711 () Bool)

(assert (=> d!133711 e!693673))

(declare-fun res!811499 () Bool)

(assert (=> d!133711 (=> (not res!811499) (not e!693673))))

(assert (=> d!133711 (= res!811499 (not (contains!7000 lt!555492 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133711 (= lt!555492 e!693670)))

(declare-fun c!120272 () Bool)

(assert (=> d!133711 (= c!120272 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38557 _keys!1208)))))

(assert (=> d!133711 (validMask!0 mask!1564)))

(assert (=> d!133711 (= (getCurrentListMapNoExtraKeys!5504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!555492)))

(assert (= (and d!133711 c!120272) b!1221500))

(assert (= (and d!133711 (not c!120272)) b!1221506))

(assert (= (and b!1221506 c!120271) b!1221498))

(assert (= (and b!1221506 (not c!120271)) b!1221495))

(assert (= (or b!1221498 b!1221495) bm!60712))

(assert (= (and d!133711 res!811499) b!1221505))

(assert (= (and b!1221505 res!811502) b!1221501))

(assert (= (and b!1221501 res!811500) b!1221503))

(assert (= (and b!1221501 c!120269) b!1221497))

(assert (= (and b!1221501 (not c!120269)) b!1221496))

(assert (= (and b!1221497 res!811501) b!1221504))

(assert (= (and b!1221496 c!120270) b!1221499))

(assert (= (and b!1221496 (not c!120270)) b!1221502))

(declare-fun b_lambda!22239 () Bool)

(assert (=> (not b_lambda!22239) (not b!1221498)))

(assert (=> b!1221498 t!40222))

(declare-fun b_and!43891 () Bool)

(assert (= b_and!43889 (and (=> t!40222 result!22871) b_and!43891)))

(declare-fun b_lambda!22241 () Bool)

(assert (=> (not b_lambda!22241) (not b!1221504)))

(assert (=> b!1221504 t!40222))

(declare-fun b_and!43893 () Bool)

(assert (= b_and!43891 (and (=> t!40222 result!22871) b_and!43893)))

(declare-fun m!1125941 () Bool)

(assert (=> b!1221503 m!1125941))

(assert (=> b!1221503 m!1125941))

(declare-fun m!1125943 () Bool)

(assert (=> b!1221503 m!1125943))

(declare-fun m!1125945 () Bool)

(assert (=> b!1221502 m!1125945))

(declare-fun m!1125947 () Bool)

(assert (=> b!1221505 m!1125947))

(declare-fun m!1125949 () Bool)

(assert (=> d!133711 m!1125949))

(assert (=> d!133711 m!1125739))

(declare-fun m!1125951 () Bool)

(assert (=> b!1221498 m!1125951))

(declare-fun m!1125953 () Bool)

(assert (=> b!1221498 m!1125953))

(assert (=> b!1221498 m!1125781))

(declare-fun m!1125955 () Bool)

(assert (=> b!1221498 m!1125955))

(assert (=> b!1221498 m!1125955))

(assert (=> b!1221498 m!1125781))

(declare-fun m!1125957 () Bool)

(assert (=> b!1221498 m!1125957))

(declare-fun m!1125959 () Bool)

(assert (=> b!1221498 m!1125959))

(assert (=> b!1221498 m!1125951))

(declare-fun m!1125961 () Bool)

(assert (=> b!1221498 m!1125961))

(assert (=> b!1221498 m!1125941))

(declare-fun m!1125963 () Bool)

(assert (=> bm!60712 m!1125963))

(assert (=> b!1221504 m!1125781))

(assert (=> b!1221504 m!1125941))

(declare-fun m!1125965 () Bool)

(assert (=> b!1221504 m!1125965))

(assert (=> b!1221504 m!1125941))

(assert (=> b!1221504 m!1125955))

(assert (=> b!1221504 m!1125955))

(assert (=> b!1221504 m!1125781))

(assert (=> b!1221504 m!1125957))

(assert (=> b!1221497 m!1125941))

(assert (=> b!1221497 m!1125941))

(declare-fun m!1125967 () Bool)

(assert (=> b!1221497 m!1125967))

(assert (=> b!1221499 m!1125963))

(assert (=> b!1221506 m!1125941))

(assert (=> b!1221506 m!1125941))

(assert (=> b!1221506 m!1125943))

(assert (=> b!1221310 d!133711))

(declare-fun b!1221507 () Bool)

(declare-fun e!693674 () ListLongMap!18107)

(declare-fun call!60716 () ListLongMap!18107)

(assert (=> b!1221507 (= e!693674 call!60716)))

(declare-fun b!1221508 () Bool)

(declare-fun e!693675 () Bool)

(declare-fun e!693678 () Bool)

(assert (=> b!1221508 (= e!693675 e!693678)))

(declare-fun c!120274 () Bool)

(assert (=> b!1221508 (= c!120274 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38557 lt!555394)))))

(declare-fun b!1221509 () Bool)

(declare-fun e!693679 () Bool)

(assert (=> b!1221509 (= e!693675 e!693679)))

(assert (=> b!1221509 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38557 lt!555394)))))

(declare-fun res!811505 () Bool)

(declare-fun lt!555499 () ListLongMap!18107)

(assert (=> b!1221509 (= res!811505 (contains!7000 lt!555499 (select (arr!38019 lt!555394) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1221509 (=> (not res!811505) (not e!693679))))

(declare-fun bm!60713 () Bool)

(assert (=> bm!60713 (= call!60716 (getCurrentListMapNoExtraKeys!5504 lt!555394 lt!555393 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1221510 () Bool)

(declare-fun lt!555502 () Unit!40309)

(declare-fun lt!555500 () Unit!40309)

(assert (=> b!1221510 (= lt!555502 lt!555500)))

(declare-fun lt!555503 () ListLongMap!18107)

(declare-fun lt!555498 () (_ BitVec 64))

(declare-fun lt!555504 () (_ BitVec 64))

(declare-fun lt!555501 () V!46513)

(assert (=> b!1221510 (not (contains!7000 (+!4132 lt!555503 (tuple2!20139 lt!555498 lt!555501)) lt!555504))))

(assert (=> b!1221510 (= lt!555500 (addStillNotContains!305 lt!555503 lt!555498 lt!555501 lt!555504))))

(assert (=> b!1221510 (= lt!555504 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1221510 (= lt!555501 (get!19415 (select (arr!38020 lt!555393) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1221510 (= lt!555498 (select (arr!38019 lt!555394) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1221510 (= lt!555503 call!60716)))

(assert (=> b!1221510 (= e!693674 (+!4132 call!60716 (tuple2!20139 (select (arr!38019 lt!555394) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19415 (select (arr!38020 lt!555393) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1221511 () Bool)

(assert (=> b!1221511 (= e!693678 (= lt!555499 (getCurrentListMapNoExtraKeys!5504 lt!555394 lt!555393 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1221512 () Bool)

(declare-fun e!693677 () ListLongMap!18107)

(assert (=> b!1221512 (= e!693677 (ListLongMap!18108 Nil!26914))))

(declare-fun b!1221513 () Bool)

(declare-fun e!693680 () Bool)

(assert (=> b!1221513 (= e!693680 e!693675)))

(declare-fun c!120273 () Bool)

(declare-fun e!693676 () Bool)

(assert (=> b!1221513 (= c!120273 e!693676)))

(declare-fun res!811504 () Bool)

(assert (=> b!1221513 (=> (not res!811504) (not e!693676))))

(assert (=> b!1221513 (= res!811504 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38557 lt!555394)))))

(declare-fun b!1221514 () Bool)

(assert (=> b!1221514 (= e!693678 (isEmpty!1005 lt!555499))))

(declare-fun b!1221515 () Bool)

(assert (=> b!1221515 (= e!693676 (validKeyInArray!0 (select (arr!38019 lt!555394) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1221515 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1221517 () Bool)

(declare-fun res!811506 () Bool)

(assert (=> b!1221517 (=> (not res!811506) (not e!693680))))

(assert (=> b!1221517 (= res!811506 (not (contains!7000 lt!555499 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221518 () Bool)

(assert (=> b!1221518 (= e!693677 e!693674)))

(declare-fun c!120275 () Bool)

(assert (=> b!1221518 (= c!120275 (validKeyInArray!0 (select (arr!38019 lt!555394) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1221516 () Bool)

(assert (=> b!1221516 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38557 lt!555394)))))

(assert (=> b!1221516 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38558 lt!555393)))))

(assert (=> b!1221516 (= e!693679 (= (apply!969 lt!555499 (select (arr!38019 lt!555394) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19415 (select (arr!38020 lt!555393) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!133713 () Bool)

(assert (=> d!133713 e!693680))

(declare-fun res!811503 () Bool)

(assert (=> d!133713 (=> (not res!811503) (not e!693680))))

(assert (=> d!133713 (= res!811503 (not (contains!7000 lt!555499 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133713 (= lt!555499 e!693677)))

(declare-fun c!120276 () Bool)

(assert (=> d!133713 (= c!120276 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38557 lt!555394)))))

(assert (=> d!133713 (validMask!0 mask!1564)))

(assert (=> d!133713 (= (getCurrentListMapNoExtraKeys!5504 lt!555394 lt!555393 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!555499)))

(assert (= (and d!133713 c!120276) b!1221512))

(assert (= (and d!133713 (not c!120276)) b!1221518))

(assert (= (and b!1221518 c!120275) b!1221510))

(assert (= (and b!1221518 (not c!120275)) b!1221507))

(assert (= (or b!1221510 b!1221507) bm!60713))

(assert (= (and d!133713 res!811503) b!1221517))

(assert (= (and b!1221517 res!811506) b!1221513))

(assert (= (and b!1221513 res!811504) b!1221515))

(assert (= (and b!1221513 c!120273) b!1221509))

(assert (= (and b!1221513 (not c!120273)) b!1221508))

(assert (= (and b!1221509 res!811505) b!1221516))

(assert (= (and b!1221508 c!120274) b!1221511))

(assert (= (and b!1221508 (not c!120274)) b!1221514))

(declare-fun b_lambda!22243 () Bool)

(assert (=> (not b_lambda!22243) (not b!1221510)))

(assert (=> b!1221510 t!40222))

(declare-fun b_and!43895 () Bool)

(assert (= b_and!43893 (and (=> t!40222 result!22871) b_and!43895)))

(declare-fun b_lambda!22245 () Bool)

(assert (=> (not b_lambda!22245) (not b!1221516)))

(assert (=> b!1221516 t!40222))

(declare-fun b_and!43897 () Bool)

(assert (= b_and!43895 (and (=> t!40222 result!22871) b_and!43897)))

(declare-fun m!1125969 () Bool)

(assert (=> b!1221515 m!1125969))

(assert (=> b!1221515 m!1125969))

(declare-fun m!1125971 () Bool)

(assert (=> b!1221515 m!1125971))

(declare-fun m!1125973 () Bool)

(assert (=> b!1221514 m!1125973))

(declare-fun m!1125975 () Bool)

(assert (=> b!1221517 m!1125975))

(declare-fun m!1125977 () Bool)

(assert (=> d!133713 m!1125977))

(assert (=> d!133713 m!1125739))

(declare-fun m!1125979 () Bool)

(assert (=> b!1221510 m!1125979))

(declare-fun m!1125981 () Bool)

(assert (=> b!1221510 m!1125981))

(assert (=> b!1221510 m!1125781))

(declare-fun m!1125983 () Bool)

(assert (=> b!1221510 m!1125983))

(assert (=> b!1221510 m!1125983))

(assert (=> b!1221510 m!1125781))

(declare-fun m!1125985 () Bool)

(assert (=> b!1221510 m!1125985))

(declare-fun m!1125987 () Bool)

(assert (=> b!1221510 m!1125987))

(assert (=> b!1221510 m!1125979))

(declare-fun m!1125989 () Bool)

(assert (=> b!1221510 m!1125989))

(assert (=> b!1221510 m!1125969))

(declare-fun m!1125991 () Bool)

(assert (=> bm!60713 m!1125991))

(assert (=> b!1221516 m!1125781))

(assert (=> b!1221516 m!1125969))

(declare-fun m!1125993 () Bool)

(assert (=> b!1221516 m!1125993))

(assert (=> b!1221516 m!1125969))

(assert (=> b!1221516 m!1125983))

(assert (=> b!1221516 m!1125983))

(assert (=> b!1221516 m!1125781))

(assert (=> b!1221516 m!1125985))

(assert (=> b!1221509 m!1125969))

(assert (=> b!1221509 m!1125969))

(declare-fun m!1125995 () Bool)

(assert (=> b!1221509 m!1125995))

(assert (=> b!1221511 m!1125991))

(assert (=> b!1221518 m!1125969))

(assert (=> b!1221518 m!1125969))

(assert (=> b!1221518 m!1125971))

(assert (=> b!1221310 d!133713))

(declare-fun b!1221529 () Bool)

(declare-fun e!693690 () Bool)

(declare-fun e!693692 () Bool)

(assert (=> b!1221529 (= e!693690 e!693692)))

(declare-fun res!811515 () Bool)

(assert (=> b!1221529 (=> (not res!811515) (not e!693692))))

(declare-fun e!693691 () Bool)

(assert (=> b!1221529 (= res!811515 (not e!693691))))

(declare-fun res!811514 () Bool)

(assert (=> b!1221529 (=> (not res!811514) (not e!693691))))

(assert (=> b!1221529 (= res!811514 (validKeyInArray!0 (select (arr!38019 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1221530 () Bool)

(assert (=> b!1221530 (= e!693691 (contains!6998 Nil!26915 (select (arr!38019 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1221531 () Bool)

(declare-fun e!693689 () Bool)

(assert (=> b!1221531 (= e!693692 e!693689)))

(declare-fun c!120279 () Bool)

(assert (=> b!1221531 (= c!120279 (validKeyInArray!0 (select (arr!38019 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1221532 () Bool)

(declare-fun call!60719 () Bool)

(assert (=> b!1221532 (= e!693689 call!60719)))

(declare-fun b!1221533 () Bool)

(assert (=> b!1221533 (= e!693689 call!60719)))

(declare-fun bm!60716 () Bool)

(assert (=> bm!60716 (= call!60719 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120279 (Cons!26914 (select (arr!38019 _keys!1208) #b00000000000000000000000000000000) Nil!26915) Nil!26915)))))

(declare-fun d!133715 () Bool)

(declare-fun res!811513 () Bool)

(assert (=> d!133715 (=> res!811513 e!693690)))

(assert (=> d!133715 (= res!811513 (bvsge #b00000000000000000000000000000000 (size!38557 _keys!1208)))))

(assert (=> d!133715 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26915) e!693690)))

(assert (= (and d!133715 (not res!811513)) b!1221529))

(assert (= (and b!1221529 res!811514) b!1221530))

(assert (= (and b!1221529 res!811515) b!1221531))

(assert (= (and b!1221531 c!120279) b!1221532))

(assert (= (and b!1221531 (not c!120279)) b!1221533))

(assert (= (or b!1221532 b!1221533) bm!60716))

(declare-fun m!1125997 () Bool)

(assert (=> b!1221529 m!1125997))

(assert (=> b!1221529 m!1125997))

(declare-fun m!1125999 () Bool)

(assert (=> b!1221529 m!1125999))

(assert (=> b!1221530 m!1125997))

(assert (=> b!1221530 m!1125997))

(declare-fun m!1126001 () Bool)

(assert (=> b!1221530 m!1126001))

(assert (=> b!1221531 m!1125997))

(assert (=> b!1221531 m!1125997))

(assert (=> b!1221531 m!1125999))

(assert (=> bm!60716 m!1125997))

(declare-fun m!1126003 () Bool)

(assert (=> bm!60716 m!1126003))

(assert (=> b!1221300 d!133715))

(declare-fun b!1221534 () Bool)

(declare-fun e!693694 () Bool)

(declare-fun e!693696 () Bool)

(assert (=> b!1221534 (= e!693694 e!693696)))

(declare-fun res!811518 () Bool)

(assert (=> b!1221534 (=> (not res!811518) (not e!693696))))

(declare-fun e!693695 () Bool)

(assert (=> b!1221534 (= res!811518 (not e!693695))))

(declare-fun res!811517 () Bool)

(assert (=> b!1221534 (=> (not res!811517) (not e!693695))))

(assert (=> b!1221534 (= res!811517 (validKeyInArray!0 (select (arr!38019 lt!555394) #b00000000000000000000000000000000)))))

(declare-fun b!1221535 () Bool)

(assert (=> b!1221535 (= e!693695 (contains!6998 Nil!26915 (select (arr!38019 lt!555394) #b00000000000000000000000000000000)))))

(declare-fun b!1221536 () Bool)

(declare-fun e!693693 () Bool)

(assert (=> b!1221536 (= e!693696 e!693693)))

(declare-fun c!120280 () Bool)

(assert (=> b!1221536 (= c!120280 (validKeyInArray!0 (select (arr!38019 lt!555394) #b00000000000000000000000000000000)))))

(declare-fun b!1221537 () Bool)

(declare-fun call!60720 () Bool)

(assert (=> b!1221537 (= e!693693 call!60720)))

(declare-fun b!1221538 () Bool)

(assert (=> b!1221538 (= e!693693 call!60720)))

(declare-fun bm!60717 () Bool)

(assert (=> bm!60717 (= call!60720 (arrayNoDuplicates!0 lt!555394 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120280 (Cons!26914 (select (arr!38019 lt!555394) #b00000000000000000000000000000000) Nil!26915) Nil!26915)))))

(declare-fun d!133717 () Bool)

(declare-fun res!811516 () Bool)

(assert (=> d!133717 (=> res!811516 e!693694)))

(assert (=> d!133717 (= res!811516 (bvsge #b00000000000000000000000000000000 (size!38557 lt!555394)))))

(assert (=> d!133717 (= (arrayNoDuplicates!0 lt!555394 #b00000000000000000000000000000000 Nil!26915) e!693694)))

(assert (= (and d!133717 (not res!811516)) b!1221534))

(assert (= (and b!1221534 res!811517) b!1221535))

(assert (= (and b!1221534 res!811518) b!1221536))

(assert (= (and b!1221536 c!120280) b!1221537))

(assert (= (and b!1221536 (not c!120280)) b!1221538))

(assert (= (or b!1221537 b!1221538) bm!60717))

(declare-fun m!1126005 () Bool)

(assert (=> b!1221534 m!1126005))

(assert (=> b!1221534 m!1126005))

(declare-fun m!1126007 () Bool)

(assert (=> b!1221534 m!1126007))

(assert (=> b!1221535 m!1126005))

(assert (=> b!1221535 m!1126005))

(declare-fun m!1126009 () Bool)

(assert (=> b!1221535 m!1126009))

(assert (=> b!1221536 m!1126005))

(assert (=> b!1221536 m!1126005))

(assert (=> b!1221536 m!1126007))

(assert (=> bm!60717 m!1126005))

(declare-fun m!1126011 () Bool)

(assert (=> bm!60717 m!1126011))

(assert (=> b!1221311 d!133717))

(declare-fun d!133719 () Bool)

(declare-fun lt!555505 () Bool)

(assert (=> d!133719 (= lt!555505 (select (content!545 Nil!26915) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!693697 () Bool)

(assert (=> d!133719 (= lt!555505 e!693697)))

(declare-fun res!811519 () Bool)

(assert (=> d!133719 (=> (not res!811519) (not e!693697))))

(assert (=> d!133719 (= res!811519 ((_ is Cons!26914) Nil!26915))))

(assert (=> d!133719 (= (contains!6998 Nil!26915 #b1000000000000000000000000000000000000000000000000000000000000000) lt!555505)))

(declare-fun b!1221539 () Bool)

(declare-fun e!693698 () Bool)

(assert (=> b!1221539 (= e!693697 e!693698)))

(declare-fun res!811520 () Bool)

(assert (=> b!1221539 (=> res!811520 e!693698)))

(assert (=> b!1221539 (= res!811520 (= (h!28123 Nil!26915) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1221540 () Bool)

(assert (=> b!1221540 (= e!693698 (contains!6998 (t!40224 Nil!26915) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!133719 res!811519) b!1221539))

(assert (= (and b!1221539 (not res!811520)) b!1221540))

(assert (=> d!133719 m!1125923))

(declare-fun m!1126013 () Bool)

(assert (=> d!133719 m!1126013))

(declare-fun m!1126015 () Bool)

(assert (=> b!1221540 m!1126015))

(assert (=> b!1221301 d!133719))

(declare-fun b!1221541 () Bool)

(declare-fun e!693699 () ListLongMap!18107)

(declare-fun call!60721 () ListLongMap!18107)

(assert (=> b!1221541 (= e!693699 call!60721)))

(declare-fun b!1221542 () Bool)

(declare-fun e!693700 () Bool)

(declare-fun e!693703 () Bool)

(assert (=> b!1221542 (= e!693700 e!693703)))

(declare-fun c!120282 () Bool)

(assert (=> b!1221542 (= c!120282 (bvslt from!1455 (size!38557 lt!555394)))))

(declare-fun b!1221543 () Bool)

(declare-fun e!693704 () Bool)

(assert (=> b!1221543 (= e!693700 e!693704)))

(assert (=> b!1221543 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38557 lt!555394)))))

(declare-fun res!811523 () Bool)

(declare-fun lt!555507 () ListLongMap!18107)

(assert (=> b!1221543 (= res!811523 (contains!7000 lt!555507 (select (arr!38019 lt!555394) from!1455)))))

(assert (=> b!1221543 (=> (not res!811523) (not e!693704))))

(declare-fun bm!60718 () Bool)

(assert (=> bm!60718 (= call!60721 (getCurrentListMapNoExtraKeys!5504 lt!555394 lt!555393 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1221544 () Bool)

(declare-fun lt!555510 () Unit!40309)

(declare-fun lt!555508 () Unit!40309)

(assert (=> b!1221544 (= lt!555510 lt!555508)))

(declare-fun lt!555509 () V!46513)

(declare-fun lt!555511 () ListLongMap!18107)

(declare-fun lt!555506 () (_ BitVec 64))

(declare-fun lt!555512 () (_ BitVec 64))

(assert (=> b!1221544 (not (contains!7000 (+!4132 lt!555511 (tuple2!20139 lt!555506 lt!555509)) lt!555512))))

(assert (=> b!1221544 (= lt!555508 (addStillNotContains!305 lt!555511 lt!555506 lt!555509 lt!555512))))

(assert (=> b!1221544 (= lt!555512 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1221544 (= lt!555509 (get!19415 (select (arr!38020 lt!555393) from!1455) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1221544 (= lt!555506 (select (arr!38019 lt!555394) from!1455))))

(assert (=> b!1221544 (= lt!555511 call!60721)))

(assert (=> b!1221544 (= e!693699 (+!4132 call!60721 (tuple2!20139 (select (arr!38019 lt!555394) from!1455) (get!19415 (select (arr!38020 lt!555393) from!1455) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1221545 () Bool)

(assert (=> b!1221545 (= e!693703 (= lt!555507 (getCurrentListMapNoExtraKeys!5504 lt!555394 lt!555393 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1221546 () Bool)

(declare-fun e!693702 () ListLongMap!18107)

(assert (=> b!1221546 (= e!693702 (ListLongMap!18108 Nil!26914))))

(declare-fun b!1221547 () Bool)

(declare-fun e!693705 () Bool)

(assert (=> b!1221547 (= e!693705 e!693700)))

(declare-fun c!120281 () Bool)

(declare-fun e!693701 () Bool)

(assert (=> b!1221547 (= c!120281 e!693701)))

(declare-fun res!811522 () Bool)

(assert (=> b!1221547 (=> (not res!811522) (not e!693701))))

(assert (=> b!1221547 (= res!811522 (bvslt from!1455 (size!38557 lt!555394)))))

(declare-fun b!1221548 () Bool)

(assert (=> b!1221548 (= e!693703 (isEmpty!1005 lt!555507))))

(declare-fun b!1221549 () Bool)

(assert (=> b!1221549 (= e!693701 (validKeyInArray!0 (select (arr!38019 lt!555394) from!1455)))))

(assert (=> b!1221549 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1221551 () Bool)

(declare-fun res!811524 () Bool)

(assert (=> b!1221551 (=> (not res!811524) (not e!693705))))

(assert (=> b!1221551 (= res!811524 (not (contains!7000 lt!555507 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221552 () Bool)

(assert (=> b!1221552 (= e!693702 e!693699)))

(declare-fun c!120283 () Bool)

(assert (=> b!1221552 (= c!120283 (validKeyInArray!0 (select (arr!38019 lt!555394) from!1455)))))

(declare-fun b!1221550 () Bool)

(assert (=> b!1221550 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38557 lt!555394)))))

(assert (=> b!1221550 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38558 lt!555393)))))

(assert (=> b!1221550 (= e!693704 (= (apply!969 lt!555507 (select (arr!38019 lt!555394) from!1455)) (get!19415 (select (arr!38020 lt!555393) from!1455) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!133721 () Bool)

(assert (=> d!133721 e!693705))

(declare-fun res!811521 () Bool)

(assert (=> d!133721 (=> (not res!811521) (not e!693705))))

(assert (=> d!133721 (= res!811521 (not (contains!7000 lt!555507 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133721 (= lt!555507 e!693702)))

(declare-fun c!120284 () Bool)

(assert (=> d!133721 (= c!120284 (bvsge from!1455 (size!38557 lt!555394)))))

(assert (=> d!133721 (validMask!0 mask!1564)))

(assert (=> d!133721 (= (getCurrentListMapNoExtraKeys!5504 lt!555394 lt!555393 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!555507)))

(assert (= (and d!133721 c!120284) b!1221546))

(assert (= (and d!133721 (not c!120284)) b!1221552))

(assert (= (and b!1221552 c!120283) b!1221544))

(assert (= (and b!1221552 (not c!120283)) b!1221541))

(assert (= (or b!1221544 b!1221541) bm!60718))

(assert (= (and d!133721 res!811521) b!1221551))

(assert (= (and b!1221551 res!811524) b!1221547))

(assert (= (and b!1221547 res!811522) b!1221549))

(assert (= (and b!1221547 c!120281) b!1221543))

(assert (= (and b!1221547 (not c!120281)) b!1221542))

(assert (= (and b!1221543 res!811523) b!1221550))

(assert (= (and b!1221542 c!120282) b!1221545))

(assert (= (and b!1221542 (not c!120282)) b!1221548))

(declare-fun b_lambda!22247 () Bool)

(assert (=> (not b_lambda!22247) (not b!1221544)))

(assert (=> b!1221544 t!40222))

(declare-fun b_and!43899 () Bool)

(assert (= b_and!43897 (and (=> t!40222 result!22871) b_and!43899)))

(declare-fun b_lambda!22249 () Bool)

(assert (=> (not b_lambda!22249) (not b!1221550)))

(assert (=> b!1221550 t!40222))

(declare-fun b_and!43901 () Bool)

(assert (= b_and!43899 (and (=> t!40222 result!22871) b_and!43901)))

(declare-fun m!1126017 () Bool)

(assert (=> b!1221549 m!1126017))

(assert (=> b!1221549 m!1126017))

(declare-fun m!1126019 () Bool)

(assert (=> b!1221549 m!1126019))

(declare-fun m!1126021 () Bool)

(assert (=> b!1221548 m!1126021))

(declare-fun m!1126023 () Bool)

(assert (=> b!1221551 m!1126023))

(declare-fun m!1126025 () Bool)

(assert (=> d!133721 m!1126025))

(assert (=> d!133721 m!1125739))

(declare-fun m!1126027 () Bool)

(assert (=> b!1221544 m!1126027))

(declare-fun m!1126029 () Bool)

(assert (=> b!1221544 m!1126029))

(assert (=> b!1221544 m!1125781))

(declare-fun m!1126031 () Bool)

(assert (=> b!1221544 m!1126031))

(assert (=> b!1221544 m!1126031))

(assert (=> b!1221544 m!1125781))

(declare-fun m!1126033 () Bool)

(assert (=> b!1221544 m!1126033))

(declare-fun m!1126035 () Bool)

(assert (=> b!1221544 m!1126035))

(assert (=> b!1221544 m!1126027))

(declare-fun m!1126037 () Bool)

(assert (=> b!1221544 m!1126037))

(assert (=> b!1221544 m!1126017))

(declare-fun m!1126039 () Bool)

(assert (=> bm!60718 m!1126039))

(assert (=> b!1221550 m!1125781))

(assert (=> b!1221550 m!1126017))

(declare-fun m!1126041 () Bool)

(assert (=> b!1221550 m!1126041))

(assert (=> b!1221550 m!1126017))

(assert (=> b!1221550 m!1126031))

(assert (=> b!1221550 m!1126031))

(assert (=> b!1221550 m!1125781))

(assert (=> b!1221550 m!1126033))

(assert (=> b!1221543 m!1126017))

(assert (=> b!1221543 m!1126017))

(declare-fun m!1126043 () Bool)

(assert (=> b!1221543 m!1126043))

(assert (=> b!1221545 m!1126039))

(assert (=> b!1221552 m!1126017))

(assert (=> b!1221552 m!1126017))

(assert (=> b!1221552 m!1126019))

(assert (=> b!1221312 d!133721))

(declare-fun b!1221553 () Bool)

(declare-fun e!693706 () ListLongMap!18107)

(declare-fun call!60722 () ListLongMap!18107)

(assert (=> b!1221553 (= e!693706 call!60722)))

(declare-fun b!1221554 () Bool)

(declare-fun e!693707 () Bool)

(declare-fun e!693710 () Bool)

(assert (=> b!1221554 (= e!693707 e!693710)))

(declare-fun c!120286 () Bool)

(assert (=> b!1221554 (= c!120286 (bvslt from!1455 (size!38557 _keys!1208)))))

(declare-fun b!1221555 () Bool)

(declare-fun e!693711 () Bool)

(assert (=> b!1221555 (= e!693707 e!693711)))

(assert (=> b!1221555 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38557 _keys!1208)))))

(declare-fun res!811527 () Bool)

(declare-fun lt!555514 () ListLongMap!18107)

(assert (=> b!1221555 (= res!811527 (contains!7000 lt!555514 (select (arr!38019 _keys!1208) from!1455)))))

(assert (=> b!1221555 (=> (not res!811527) (not e!693711))))

(declare-fun bm!60719 () Bool)

(assert (=> bm!60719 (= call!60722 (getCurrentListMapNoExtraKeys!5504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1221556 () Bool)

(declare-fun lt!555517 () Unit!40309)

(declare-fun lt!555515 () Unit!40309)

(assert (=> b!1221556 (= lt!555517 lt!555515)))

(declare-fun lt!555518 () ListLongMap!18107)

(declare-fun lt!555513 () (_ BitVec 64))

(declare-fun lt!555516 () V!46513)

(declare-fun lt!555519 () (_ BitVec 64))

(assert (=> b!1221556 (not (contains!7000 (+!4132 lt!555518 (tuple2!20139 lt!555513 lt!555516)) lt!555519))))

(assert (=> b!1221556 (= lt!555515 (addStillNotContains!305 lt!555518 lt!555513 lt!555516 lt!555519))))

(assert (=> b!1221556 (= lt!555519 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1221556 (= lt!555516 (get!19415 (select (arr!38020 _values!996) from!1455) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1221556 (= lt!555513 (select (arr!38019 _keys!1208) from!1455))))

(assert (=> b!1221556 (= lt!555518 call!60722)))

(assert (=> b!1221556 (= e!693706 (+!4132 call!60722 (tuple2!20139 (select (arr!38019 _keys!1208) from!1455) (get!19415 (select (arr!38020 _values!996) from!1455) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1221557 () Bool)

(assert (=> b!1221557 (= e!693710 (= lt!555514 (getCurrentListMapNoExtraKeys!5504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1221558 () Bool)

(declare-fun e!693709 () ListLongMap!18107)

(assert (=> b!1221558 (= e!693709 (ListLongMap!18108 Nil!26914))))

(declare-fun b!1221559 () Bool)

(declare-fun e!693712 () Bool)

(assert (=> b!1221559 (= e!693712 e!693707)))

(declare-fun c!120285 () Bool)

(declare-fun e!693708 () Bool)

(assert (=> b!1221559 (= c!120285 e!693708)))

(declare-fun res!811526 () Bool)

(assert (=> b!1221559 (=> (not res!811526) (not e!693708))))

(assert (=> b!1221559 (= res!811526 (bvslt from!1455 (size!38557 _keys!1208)))))

(declare-fun b!1221560 () Bool)

(assert (=> b!1221560 (= e!693710 (isEmpty!1005 lt!555514))))

(declare-fun b!1221561 () Bool)

(assert (=> b!1221561 (= e!693708 (validKeyInArray!0 (select (arr!38019 _keys!1208) from!1455)))))

(assert (=> b!1221561 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1221563 () Bool)

(declare-fun res!811528 () Bool)

(assert (=> b!1221563 (=> (not res!811528) (not e!693712))))

(assert (=> b!1221563 (= res!811528 (not (contains!7000 lt!555514 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221564 () Bool)

(assert (=> b!1221564 (= e!693709 e!693706)))

(declare-fun c!120287 () Bool)

(assert (=> b!1221564 (= c!120287 (validKeyInArray!0 (select (arr!38019 _keys!1208) from!1455)))))

(declare-fun b!1221562 () Bool)

(assert (=> b!1221562 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38557 _keys!1208)))))

(assert (=> b!1221562 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38558 _values!996)))))

(assert (=> b!1221562 (= e!693711 (= (apply!969 lt!555514 (select (arr!38019 _keys!1208) from!1455)) (get!19415 (select (arr!38020 _values!996) from!1455) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!133723 () Bool)

(assert (=> d!133723 e!693712))

(declare-fun res!811525 () Bool)

(assert (=> d!133723 (=> (not res!811525) (not e!693712))))

(assert (=> d!133723 (= res!811525 (not (contains!7000 lt!555514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133723 (= lt!555514 e!693709)))

(declare-fun c!120288 () Bool)

(assert (=> d!133723 (= c!120288 (bvsge from!1455 (size!38557 _keys!1208)))))

(assert (=> d!133723 (validMask!0 mask!1564)))

(assert (=> d!133723 (= (getCurrentListMapNoExtraKeys!5504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!555514)))

(assert (= (and d!133723 c!120288) b!1221558))

(assert (= (and d!133723 (not c!120288)) b!1221564))

(assert (= (and b!1221564 c!120287) b!1221556))

(assert (= (and b!1221564 (not c!120287)) b!1221553))

(assert (= (or b!1221556 b!1221553) bm!60719))

(assert (= (and d!133723 res!811525) b!1221563))

(assert (= (and b!1221563 res!811528) b!1221559))

(assert (= (and b!1221559 res!811526) b!1221561))

(assert (= (and b!1221559 c!120285) b!1221555))

(assert (= (and b!1221559 (not c!120285)) b!1221554))

(assert (= (and b!1221555 res!811527) b!1221562))

(assert (= (and b!1221554 c!120286) b!1221557))

(assert (= (and b!1221554 (not c!120286)) b!1221560))

(declare-fun b_lambda!22251 () Bool)

(assert (=> (not b_lambda!22251) (not b!1221556)))

(assert (=> b!1221556 t!40222))

(declare-fun b_and!43903 () Bool)

(assert (= b_and!43901 (and (=> t!40222 result!22871) b_and!43903)))

(declare-fun b_lambda!22253 () Bool)

(assert (=> (not b_lambda!22253) (not b!1221562)))

(assert (=> b!1221562 t!40222))

(declare-fun b_and!43905 () Bool)

(assert (= b_and!43903 (and (=> t!40222 result!22871) b_and!43905)))

(assert (=> b!1221561 m!1125727))

(assert (=> b!1221561 m!1125727))

(assert (=> b!1221561 m!1125729))

(declare-fun m!1126045 () Bool)

(assert (=> b!1221560 m!1126045))

(declare-fun m!1126047 () Bool)

(assert (=> b!1221563 m!1126047))

(declare-fun m!1126049 () Bool)

(assert (=> d!133723 m!1126049))

(assert (=> d!133723 m!1125739))

(declare-fun m!1126051 () Bool)

(assert (=> b!1221556 m!1126051))

(declare-fun m!1126053 () Bool)

(assert (=> b!1221556 m!1126053))

(assert (=> b!1221556 m!1125781))

(assert (=> b!1221556 m!1125763))

(assert (=> b!1221556 m!1125763))

(assert (=> b!1221556 m!1125781))

(declare-fun m!1126055 () Bool)

(assert (=> b!1221556 m!1126055))

(declare-fun m!1126057 () Bool)

(assert (=> b!1221556 m!1126057))

(assert (=> b!1221556 m!1126051))

(declare-fun m!1126059 () Bool)

(assert (=> b!1221556 m!1126059))

(assert (=> b!1221556 m!1125727))

(declare-fun m!1126061 () Bool)

(assert (=> bm!60719 m!1126061))

(assert (=> b!1221562 m!1125781))

(assert (=> b!1221562 m!1125727))

(declare-fun m!1126063 () Bool)

(assert (=> b!1221562 m!1126063))

(assert (=> b!1221562 m!1125727))

(assert (=> b!1221562 m!1125763))

(assert (=> b!1221562 m!1125763))

(assert (=> b!1221562 m!1125781))

(assert (=> b!1221562 m!1126055))

(assert (=> b!1221555 m!1125727))

(assert (=> b!1221555 m!1125727))

(declare-fun m!1126065 () Bool)

(assert (=> b!1221555 m!1126065))

(assert (=> b!1221557 m!1126061))

(assert (=> b!1221564 m!1125727))

(assert (=> b!1221564 m!1125727))

(assert (=> b!1221564 m!1125729))

(assert (=> b!1221312 d!133723))

(declare-fun b!1221573 () Bool)

(declare-fun e!693721 () Bool)

(declare-fun call!60725 () Bool)

(assert (=> b!1221573 (= e!693721 call!60725)))

(declare-fun b!1221574 () Bool)

(declare-fun e!693719 () Bool)

(assert (=> b!1221574 (= e!693719 call!60725)))

(declare-fun bm!60722 () Bool)

(assert (=> bm!60722 (= call!60725 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!555394 mask!1564))))

(declare-fun b!1221576 () Bool)

(assert (=> b!1221576 (= e!693719 e!693721)))

(declare-fun lt!555526 () (_ BitVec 64))

(assert (=> b!1221576 (= lt!555526 (select (arr!38019 lt!555394) #b00000000000000000000000000000000))))

(declare-fun lt!555528 () Unit!40309)

(assert (=> b!1221576 (= lt!555528 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!555394 lt!555526 #b00000000000000000000000000000000))))

(assert (=> b!1221576 (arrayContainsKey!0 lt!555394 lt!555526 #b00000000000000000000000000000000)))

(declare-fun lt!555527 () Unit!40309)

(assert (=> b!1221576 (= lt!555527 lt!555528)))

(declare-fun res!811534 () Bool)

(declare-datatypes ((SeekEntryResult!9948 0))(
  ( (MissingZero!9948 (index!42163 (_ BitVec 32))) (Found!9948 (index!42164 (_ BitVec 32))) (Intermediate!9948 (undefined!10760 Bool) (index!42165 (_ BitVec 32)) (x!107580 (_ BitVec 32))) (Undefined!9948) (MissingVacant!9948 (index!42166 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78780 (_ BitVec 32)) SeekEntryResult!9948)

(assert (=> b!1221576 (= res!811534 (= (seekEntryOrOpen!0 (select (arr!38019 lt!555394) #b00000000000000000000000000000000) lt!555394 mask!1564) (Found!9948 #b00000000000000000000000000000000)))))

(assert (=> b!1221576 (=> (not res!811534) (not e!693721))))

(declare-fun b!1221575 () Bool)

(declare-fun e!693720 () Bool)

(assert (=> b!1221575 (= e!693720 e!693719)))

(declare-fun c!120291 () Bool)

(assert (=> b!1221575 (= c!120291 (validKeyInArray!0 (select (arr!38019 lt!555394) #b00000000000000000000000000000000)))))

(declare-fun d!133725 () Bool)

(declare-fun res!811533 () Bool)

(assert (=> d!133725 (=> res!811533 e!693720)))

(assert (=> d!133725 (= res!811533 (bvsge #b00000000000000000000000000000000 (size!38557 lt!555394)))))

(assert (=> d!133725 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555394 mask!1564) e!693720)))

(assert (= (and d!133725 (not res!811533)) b!1221575))

(assert (= (and b!1221575 c!120291) b!1221576))

(assert (= (and b!1221575 (not c!120291)) b!1221574))

(assert (= (and b!1221576 res!811534) b!1221573))

(assert (= (or b!1221573 b!1221574) bm!60722))

(declare-fun m!1126067 () Bool)

(assert (=> bm!60722 m!1126067))

(assert (=> b!1221576 m!1126005))

(declare-fun m!1126069 () Bool)

(assert (=> b!1221576 m!1126069))

(declare-fun m!1126071 () Bool)

(assert (=> b!1221576 m!1126071))

(assert (=> b!1221576 m!1126005))

(declare-fun m!1126073 () Bool)

(assert (=> b!1221576 m!1126073))

(assert (=> b!1221575 m!1126005))

(assert (=> b!1221575 m!1126005))

(assert (=> b!1221575 m!1126007))

(assert (=> b!1221302 d!133725))

(declare-fun d!133727 () Bool)

(assert (=> d!133727 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1221313 d!133727))

(declare-fun b!1221577 () Bool)

(declare-fun e!693724 () Bool)

(declare-fun call!60726 () Bool)

(assert (=> b!1221577 (= e!693724 call!60726)))

(declare-fun b!1221578 () Bool)

(declare-fun e!693722 () Bool)

(assert (=> b!1221578 (= e!693722 call!60726)))

(declare-fun bm!60723 () Bool)

(assert (=> bm!60723 (= call!60726 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1221580 () Bool)

(assert (=> b!1221580 (= e!693722 e!693724)))

(declare-fun lt!555529 () (_ BitVec 64))

(assert (=> b!1221580 (= lt!555529 (select (arr!38019 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!555531 () Unit!40309)

(assert (=> b!1221580 (= lt!555531 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!555529 #b00000000000000000000000000000000))))

(assert (=> b!1221580 (arrayContainsKey!0 _keys!1208 lt!555529 #b00000000000000000000000000000000)))

(declare-fun lt!555530 () Unit!40309)

(assert (=> b!1221580 (= lt!555530 lt!555531)))

(declare-fun res!811536 () Bool)

(assert (=> b!1221580 (= res!811536 (= (seekEntryOrOpen!0 (select (arr!38019 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9948 #b00000000000000000000000000000000)))))

(assert (=> b!1221580 (=> (not res!811536) (not e!693724))))

(declare-fun b!1221579 () Bool)

(declare-fun e!693723 () Bool)

(assert (=> b!1221579 (= e!693723 e!693722)))

(declare-fun c!120292 () Bool)

(assert (=> b!1221579 (= c!120292 (validKeyInArray!0 (select (arr!38019 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133729 () Bool)

(declare-fun res!811535 () Bool)

(assert (=> d!133729 (=> res!811535 e!693723)))

(assert (=> d!133729 (= res!811535 (bvsge #b00000000000000000000000000000000 (size!38557 _keys!1208)))))

(assert (=> d!133729 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!693723)))

(assert (= (and d!133729 (not res!811535)) b!1221579))

(assert (= (and b!1221579 c!120292) b!1221580))

(assert (= (and b!1221579 (not c!120292)) b!1221578))

(assert (= (and b!1221580 res!811536) b!1221577))

(assert (= (or b!1221577 b!1221578) bm!60723))

(declare-fun m!1126075 () Bool)

(assert (=> bm!60723 m!1126075))

(assert (=> b!1221580 m!1125997))

(declare-fun m!1126077 () Bool)

(assert (=> b!1221580 m!1126077))

(declare-fun m!1126079 () Bool)

(assert (=> b!1221580 m!1126079))

(assert (=> b!1221580 m!1125997))

(declare-fun m!1126081 () Bool)

(assert (=> b!1221580 m!1126081))

(assert (=> b!1221579 m!1125997))

(assert (=> b!1221579 m!1125997))

(assert (=> b!1221579 m!1125999))

(assert (=> b!1221304 d!133729))

(declare-fun d!133731 () Bool)

(declare-fun res!811541 () Bool)

(declare-fun e!693729 () Bool)

(assert (=> d!133731 (=> res!811541 e!693729)))

(assert (=> d!133731 (= res!811541 (= (select (arr!38019 _keys!1208) i!673) k0!934))))

(assert (=> d!133731 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!693729)))

(declare-fun b!1221585 () Bool)

(declare-fun e!693730 () Bool)

(assert (=> b!1221585 (= e!693729 e!693730)))

(declare-fun res!811542 () Bool)

(assert (=> b!1221585 (=> (not res!811542) (not e!693730))))

(assert (=> b!1221585 (= res!811542 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!38557 _keys!1208)))))

(declare-fun b!1221586 () Bool)

(assert (=> b!1221586 (= e!693730 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!133731 (not res!811541)) b!1221585))

(assert (= (and b!1221585 res!811542) b!1221586))

(assert (=> d!133731 m!1125771))

(declare-fun m!1126083 () Bool)

(assert (=> b!1221586 m!1126083))

(assert (=> b!1221315 d!133731))

(declare-fun d!133733 () Bool)

(declare-fun res!811543 () Bool)

(declare-fun e!693731 () Bool)

(assert (=> d!133733 (=> res!811543 e!693731)))

(assert (=> d!133733 (= res!811543 (= (select (arr!38019 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133733 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!693731)))

(declare-fun b!1221587 () Bool)

(declare-fun e!693732 () Bool)

(assert (=> b!1221587 (= e!693731 e!693732)))

(declare-fun res!811544 () Bool)

(assert (=> b!1221587 (=> (not res!811544) (not e!693732))))

(assert (=> b!1221587 (= res!811544 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38557 _keys!1208)))))

(declare-fun b!1221588 () Bool)

(assert (=> b!1221588 (= e!693732 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133733 (not res!811543)) b!1221587))

(assert (= (and b!1221587 res!811544) b!1221588))

(assert (=> d!133733 m!1125997))

(declare-fun m!1126085 () Bool)

(assert (=> b!1221588 m!1126085))

(assert (=> b!1221305 d!133733))

(declare-fun d!133735 () Bool)

(assert (=> d!133735 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555534 () Unit!40309)

(declare-fun choose!13 (array!78780 (_ BitVec 64) (_ BitVec 32)) Unit!40309)

(assert (=> d!133735 (= lt!555534 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133735 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133735 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!555534)))

(declare-fun bs!34355 () Bool)

(assert (= bs!34355 d!133735))

(assert (=> bs!34355 m!1125751))

(declare-fun m!1126087 () Bool)

(assert (=> bs!34355 m!1126087))

(assert (=> b!1221305 d!133735))

(declare-fun d!133737 () Bool)

(declare-fun e!693735 () Bool)

(assert (=> d!133737 e!693735))

(declare-fun res!811549 () Bool)

(assert (=> d!133737 (=> (not res!811549) (not e!693735))))

(declare-fun lt!555546 () ListLongMap!18107)

(assert (=> d!133737 (= res!811549 (contains!7000 lt!555546 (_1!10080 (tuple2!20139 (select (arr!38019 _keys!1208) from!1455) (get!19415 (select (arr!38020 _values!996) from!1455) lt!555387)))))))

(declare-fun lt!555544 () List!26917)

(assert (=> d!133737 (= lt!555546 (ListLongMap!18108 lt!555544))))

(declare-fun lt!555543 () Unit!40309)

(declare-fun lt!555545 () Unit!40309)

(assert (=> d!133737 (= lt!555543 lt!555545)))

(declare-datatypes ((Option!700 0))(
  ( (Some!699 (v!18238 V!46513)) (None!698) )
))
(declare-fun getValueByKey!649 (List!26917 (_ BitVec 64)) Option!700)

(assert (=> d!133737 (= (getValueByKey!649 lt!555544 (_1!10080 (tuple2!20139 (select (arr!38019 _keys!1208) from!1455) (get!19415 (select (arr!38020 _values!996) from!1455) lt!555387)))) (Some!699 (_2!10080 (tuple2!20139 (select (arr!38019 _keys!1208) from!1455) (get!19415 (select (arr!38020 _values!996) from!1455) lt!555387)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!325 (List!26917 (_ BitVec 64) V!46513) Unit!40309)

(assert (=> d!133737 (= lt!555545 (lemmaContainsTupThenGetReturnValue!325 lt!555544 (_1!10080 (tuple2!20139 (select (arr!38019 _keys!1208) from!1455) (get!19415 (select (arr!38020 _values!996) from!1455) lt!555387))) (_2!10080 (tuple2!20139 (select (arr!38019 _keys!1208) from!1455) (get!19415 (select (arr!38020 _values!996) from!1455) lt!555387)))))))

(declare-fun insertStrictlySorted!418 (List!26917 (_ BitVec 64) V!46513) List!26917)

(assert (=> d!133737 (= lt!555544 (insertStrictlySorted!418 (toList!9069 lt!555389) (_1!10080 (tuple2!20139 (select (arr!38019 _keys!1208) from!1455) (get!19415 (select (arr!38020 _values!996) from!1455) lt!555387))) (_2!10080 (tuple2!20139 (select (arr!38019 _keys!1208) from!1455) (get!19415 (select (arr!38020 _values!996) from!1455) lt!555387)))))))

(assert (=> d!133737 (= (+!4132 lt!555389 (tuple2!20139 (select (arr!38019 _keys!1208) from!1455) (get!19415 (select (arr!38020 _values!996) from!1455) lt!555387))) lt!555546)))

(declare-fun b!1221593 () Bool)

(declare-fun res!811550 () Bool)

(assert (=> b!1221593 (=> (not res!811550) (not e!693735))))

(assert (=> b!1221593 (= res!811550 (= (getValueByKey!649 (toList!9069 lt!555546) (_1!10080 (tuple2!20139 (select (arr!38019 _keys!1208) from!1455) (get!19415 (select (arr!38020 _values!996) from!1455) lt!555387)))) (Some!699 (_2!10080 (tuple2!20139 (select (arr!38019 _keys!1208) from!1455) (get!19415 (select (arr!38020 _values!996) from!1455) lt!555387))))))))

(declare-fun b!1221594 () Bool)

(declare-fun contains!7001 (List!26917 tuple2!20138) Bool)

(assert (=> b!1221594 (= e!693735 (contains!7001 (toList!9069 lt!555546) (tuple2!20139 (select (arr!38019 _keys!1208) from!1455) (get!19415 (select (arr!38020 _values!996) from!1455) lt!555387))))))

(assert (= (and d!133737 res!811549) b!1221593))

(assert (= (and b!1221593 res!811550) b!1221594))

(declare-fun m!1126089 () Bool)

(assert (=> d!133737 m!1126089))

(declare-fun m!1126091 () Bool)

(assert (=> d!133737 m!1126091))

(declare-fun m!1126093 () Bool)

(assert (=> d!133737 m!1126093))

(declare-fun m!1126095 () Bool)

(assert (=> d!133737 m!1126095))

(declare-fun m!1126097 () Bool)

(assert (=> b!1221593 m!1126097))

(declare-fun m!1126099 () Bool)

(assert (=> b!1221594 m!1126099))

(assert (=> b!1221296 d!133737))

(declare-fun d!133739 () Bool)

(declare-fun c!120295 () Bool)

(assert (=> d!133739 (= c!120295 ((_ is ValueCellFull!14810) (select (arr!38020 _values!996) from!1455)))))

(declare-fun e!693738 () V!46513)

(assert (=> d!133739 (= (get!19415 (select (arr!38020 _values!996) from!1455) lt!555387) e!693738)))

(declare-fun b!1221599 () Bool)

(declare-fun get!19417 (ValueCell!14810 V!46513) V!46513)

(assert (=> b!1221599 (= e!693738 (get!19417 (select (arr!38020 _values!996) from!1455) lt!555387))))

(declare-fun b!1221600 () Bool)

(declare-fun get!19418 (ValueCell!14810 V!46513) V!46513)

(assert (=> b!1221600 (= e!693738 (get!19418 (select (arr!38020 _values!996) from!1455) lt!555387))))

(assert (= (and d!133739 c!120295) b!1221599))

(assert (= (and d!133739 (not c!120295)) b!1221600))

(assert (=> b!1221599 m!1125763))

(declare-fun m!1126101 () Bool)

(assert (=> b!1221599 m!1126101))

(assert (=> b!1221600 m!1125763))

(declare-fun m!1126103 () Bool)

(assert (=> b!1221600 m!1126103))

(assert (=> b!1221296 d!133739))

(declare-fun d!133741 () Bool)

(declare-fun res!811555 () Bool)

(declare-fun e!693743 () Bool)

(assert (=> d!133741 (=> res!811555 e!693743)))

(assert (=> d!133741 (= res!811555 ((_ is Nil!26915) Nil!26915))))

(assert (=> d!133741 (= (noDuplicate!1647 Nil!26915) e!693743)))

(declare-fun b!1221605 () Bool)

(declare-fun e!693744 () Bool)

(assert (=> b!1221605 (= e!693743 e!693744)))

(declare-fun res!811556 () Bool)

(assert (=> b!1221605 (=> (not res!811556) (not e!693744))))

(assert (=> b!1221605 (= res!811556 (not (contains!6998 (t!40224 Nil!26915) (h!28123 Nil!26915))))))

(declare-fun b!1221606 () Bool)

(assert (=> b!1221606 (= e!693744 (noDuplicate!1647 (t!40224 Nil!26915)))))

(assert (= (and d!133741 (not res!811555)) b!1221605))

(assert (= (and b!1221605 res!811556) b!1221606))

(declare-fun m!1126105 () Bool)

(assert (=> b!1221605 m!1126105))

(declare-fun m!1126107 () Bool)

(assert (=> b!1221606 m!1126107))

(assert (=> b!1221307 d!133741))

(declare-fun b!1221607 () Bool)

(declare-fun e!693746 () Bool)

(declare-fun e!693748 () Bool)

(assert (=> b!1221607 (= e!693746 e!693748)))

(declare-fun res!811559 () Bool)

(assert (=> b!1221607 (=> (not res!811559) (not e!693748))))

(declare-fun e!693747 () Bool)

(assert (=> b!1221607 (= res!811559 (not e!693747))))

(declare-fun res!811558 () Bool)

(assert (=> b!1221607 (=> (not res!811558) (not e!693747))))

(assert (=> b!1221607 (= res!811558 (validKeyInArray!0 (select (arr!38019 _keys!1208) from!1455)))))

(declare-fun b!1221608 () Bool)

(assert (=> b!1221608 (= e!693747 (contains!6998 Nil!26915 (select (arr!38019 _keys!1208) from!1455)))))

(declare-fun b!1221609 () Bool)

(declare-fun e!693745 () Bool)

(assert (=> b!1221609 (= e!693748 e!693745)))

(declare-fun c!120296 () Bool)

(assert (=> b!1221609 (= c!120296 (validKeyInArray!0 (select (arr!38019 _keys!1208) from!1455)))))

(declare-fun b!1221610 () Bool)

(declare-fun call!60727 () Bool)

(assert (=> b!1221610 (= e!693745 call!60727)))

(declare-fun b!1221611 () Bool)

(assert (=> b!1221611 (= e!693745 call!60727)))

(declare-fun bm!60724 () Bool)

(assert (=> bm!60724 (= call!60727 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!120296 (Cons!26914 (select (arr!38019 _keys!1208) from!1455) Nil!26915) Nil!26915)))))

(declare-fun d!133743 () Bool)

(declare-fun res!811557 () Bool)

(assert (=> d!133743 (=> res!811557 e!693746)))

(assert (=> d!133743 (= res!811557 (bvsge from!1455 (size!38557 _keys!1208)))))

(assert (=> d!133743 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26915) e!693746)))

(assert (= (and d!133743 (not res!811557)) b!1221607))

(assert (= (and b!1221607 res!811558) b!1221608))

(assert (= (and b!1221607 res!811559) b!1221609))

(assert (= (and b!1221609 c!120296) b!1221610))

(assert (= (and b!1221609 (not c!120296)) b!1221611))

(assert (= (or b!1221610 b!1221611) bm!60724))

(assert (=> b!1221607 m!1125727))

(assert (=> b!1221607 m!1125727))

(assert (=> b!1221607 m!1125729))

(assert (=> b!1221608 m!1125727))

(assert (=> b!1221608 m!1125727))

(declare-fun m!1126109 () Bool)

(assert (=> b!1221608 m!1126109))

(assert (=> b!1221609 m!1125727))

(assert (=> b!1221609 m!1125727))

(assert (=> b!1221609 m!1125729))

(assert (=> bm!60724 m!1125727))

(declare-fun m!1126111 () Bool)

(assert (=> bm!60724 m!1126111))

(assert (=> b!1221297 d!133743))

(declare-fun d!133745 () Bool)

(assert (=> d!133745 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26915)))

(declare-fun lt!555549 () Unit!40309)

(declare-fun choose!39 (array!78780 (_ BitVec 32) (_ BitVec 32)) Unit!40309)

(assert (=> d!133745 (= lt!555549 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133745 (bvslt (size!38557 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133745 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!555549)))

(declare-fun bs!34356 () Bool)

(assert (= bs!34356 d!133745))

(assert (=> bs!34356 m!1125741))

(declare-fun m!1126113 () Bool)

(assert (=> bs!34356 m!1126113))

(assert (=> b!1221297 d!133745))

(declare-fun d!133747 () Bool)

(declare-fun res!811560 () Bool)

(declare-fun e!693749 () Bool)

(assert (=> d!133747 (=> res!811560 e!693749)))

(assert (=> d!133747 (= res!811560 (= (select (arr!38019 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133747 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!693749)))

(declare-fun b!1221612 () Bool)

(declare-fun e!693750 () Bool)

(assert (=> b!1221612 (= e!693749 e!693750)))

(declare-fun res!811561 () Bool)

(assert (=> b!1221612 (=> (not res!811561) (not e!693750))))

(assert (=> b!1221612 (= res!811561 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38557 _keys!1208)))))

(declare-fun b!1221613 () Bool)

(assert (=> b!1221613 (= e!693750 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133747 (not res!811560)) b!1221612))

(assert (= (and b!1221612 res!811561) b!1221613))

(assert (=> d!133747 m!1125941))

(declare-fun m!1126115 () Bool)

(assert (=> b!1221613 m!1126115))

(assert (=> b!1221297 d!133747))

(declare-fun d!133749 () Bool)

(assert (=> d!133749 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555552 () Unit!40309)

(declare-fun choose!114 (array!78780 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40309)

(assert (=> d!133749 (= lt!555552 (choose!114 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> d!133749 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133749 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)) lt!555552)))

(declare-fun bs!34357 () Bool)

(assert (= bs!34357 d!133749))

(assert (=> bs!34357 m!1125745))

(declare-fun m!1126117 () Bool)

(assert (=> bs!34357 m!1126117))

(assert (=> b!1221297 d!133749))

(declare-fun d!133751 () Bool)

(assert (=> d!133751 (= (array_inv!29054 _keys!1208) (bvsge (size!38557 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101574 d!133751))

(declare-fun d!133753 () Bool)

(assert (=> d!133753 (= (array_inv!29055 _values!996) (bvsge (size!38558 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101574 d!133753))

(declare-fun mapIsEmpty!48460 () Bool)

(declare-fun mapRes!48460 () Bool)

(assert (=> mapIsEmpty!48460 mapRes!48460))

(declare-fun mapNonEmpty!48460 () Bool)

(declare-fun tp!92060 () Bool)

(declare-fun e!693755 () Bool)

(assert (=> mapNonEmpty!48460 (= mapRes!48460 (and tp!92060 e!693755))))

(declare-fun mapValue!48460 () ValueCell!14810)

(declare-fun mapRest!48460 () (Array (_ BitVec 32) ValueCell!14810))

(declare-fun mapKey!48460 () (_ BitVec 32))

(assert (=> mapNonEmpty!48460 (= mapRest!48451 (store mapRest!48460 mapKey!48460 mapValue!48460))))

(declare-fun b!1221621 () Bool)

(declare-fun e!693756 () Bool)

(assert (=> b!1221621 (= e!693756 tp_is_empty!31039)))

(declare-fun b!1221620 () Bool)

(assert (=> b!1221620 (= e!693755 tp_is_empty!31039)))

(declare-fun condMapEmpty!48460 () Bool)

(declare-fun mapDefault!48460 () ValueCell!14810)

(assert (=> mapNonEmpty!48451 (= condMapEmpty!48460 (= mapRest!48451 ((as const (Array (_ BitVec 32) ValueCell!14810)) mapDefault!48460)))))

(assert (=> mapNonEmpty!48451 (= tp!92044 (and e!693756 mapRes!48460))))

(assert (= (and mapNonEmpty!48451 condMapEmpty!48460) mapIsEmpty!48460))

(assert (= (and mapNonEmpty!48451 (not condMapEmpty!48460)) mapNonEmpty!48460))

(assert (= (and mapNonEmpty!48460 ((_ is ValueCellFull!14810) mapValue!48460)) b!1221620))

(assert (= (and mapNonEmpty!48451 ((_ is ValueCellFull!14810) mapDefault!48460)) b!1221621))

(declare-fun m!1126119 () Bool)

(assert (=> mapNonEmpty!48460 m!1126119))

(declare-fun b_lambda!22255 () Bool)

(assert (= b_lambda!22247 (or (and start!101574 b_free!26335) b_lambda!22255)))

(declare-fun b_lambda!22257 () Bool)

(assert (= b_lambda!22249 (or (and start!101574 b_free!26335) b_lambda!22257)))

(declare-fun b_lambda!22259 () Bool)

(assert (= b_lambda!22239 (or (and start!101574 b_free!26335) b_lambda!22259)))

(declare-fun b_lambda!22261 () Bool)

(assert (= b_lambda!22243 (or (and start!101574 b_free!26335) b_lambda!22261)))

(declare-fun b_lambda!22263 () Bool)

(assert (= b_lambda!22241 (or (and start!101574 b_free!26335) b_lambda!22263)))

(declare-fun b_lambda!22265 () Bool)

(assert (= b_lambda!22253 (or (and start!101574 b_free!26335) b_lambda!22265)))

(declare-fun b_lambda!22267 () Bool)

(assert (= b_lambda!22237 (or (and start!101574 b_free!26335) b_lambda!22267)))

(declare-fun b_lambda!22269 () Bool)

(assert (= b_lambda!22251 (or (and start!101574 b_free!26335) b_lambda!22269)))

(declare-fun b_lambda!22271 () Bool)

(assert (= b_lambda!22245 (or (and start!101574 b_free!26335) b_lambda!22271)))

(check-sat (not b!1221536) (not b!1221599) (not b!1221461) (not b!1221543) (not d!133713) (not d!133723) (not b!1221531) (not b_lambda!22255) (not d!133737) (not b!1221534) (not d!133735) (not d!133707) (not b!1221576) (not bm!60718) (not bm!60719) (not b!1221580) (not d!133701) (not b!1221509) (not bm!60716) tp_is_empty!31039 (not b_lambda!22235) (not b_lambda!22269) (not b_lambda!22257) (not b!1221535) (not bm!60713) (not bm!60708) (not b!1221560) (not b!1221600) b_and!43905 (not b!1221606) (not b_next!26335) (not b!1221506) (not b!1221549) (not bm!60712) (not b!1221516) (not b!1221552) (not b!1221550) (not bm!60724) (not b!1221545) (not b!1221503) (not bm!60709) (not b!1221518) (not d!133721) (not b!1221499) (not b!1221530) (not b!1221579) (not b!1221510) (not b!1221556) (not b_lambda!22259) (not b!1221607) (not d!133749) (not d!133711) (not b_lambda!22265) (not b!1221497) (not d!133709) (not b!1221505) (not b!1221594) (not b!1221593) (not b_lambda!22263) (not b!1221605) (not b!1221511) (not b!1221613) (not bm!60723) (not b!1221470) (not b!1221555) (not b!1221586) (not b!1221557) (not b!1221548) (not b!1221588) (not b_lambda!22267) (not b!1221609) (not bm!60717) (not b!1221515) (not b!1221529) (not b!1221502) (not bm!60722) (not b!1221514) (not b!1221551) (not b_lambda!22261) (not b!1221563) (not b!1221517) (not b!1221561) (not d!133745) (not b!1221504) (not b!1221562) (not b!1221608) (not b!1221575) (not b!1221540) (not b!1221564) (not b!1221498) (not b!1221544) (not mapNonEmpty!48460) (not d!133719) (not b_lambda!22271))
(check-sat b_and!43905 (not b_next!26335))
