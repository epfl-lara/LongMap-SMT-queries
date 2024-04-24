; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98866 () Bool)

(assert start!98866)

(declare-fun b_free!24235 () Bool)

(declare-fun b_next!24235 () Bool)

(assert (=> start!98866 (= b_free!24235 (not b_next!24235))))

(declare-fun tp!85416 () Bool)

(declare-fun b_and!39321 () Bool)

(assert (=> start!98866 (= tp!85416 b_and!39321)))

(declare-fun e!652624 () Bool)

(declare-datatypes ((V!43481 0))(
  ( (V!43482 (val!14439 Int)) )
))
(declare-datatypes ((tuple2!18306 0))(
  ( (tuple2!18307 (_1!9164 (_ BitVec 64)) (_2!9164 V!43481)) )
))
(declare-datatypes ((List!25061 0))(
  ( (Nil!25058) (Cons!25057 (h!26275 tuple2!18306) (t!36280 List!25061)) )
))
(declare-datatypes ((ListLongMap!16283 0))(
  ( (ListLongMap!16284 (toList!8157 List!25061)) )
))
(declare-fun lt!512096 () ListLongMap!16283)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1147111 () Bool)

(declare-fun lt!512085 () ListLongMap!16283)

(declare-fun -!1283 (ListLongMap!16283 (_ BitVec 64)) ListLongMap!16283)

(assert (=> b!1147111 (= e!652624 (= (-!1283 lt!512096 k0!934) lt!512085))))

(declare-fun zeroValue!944 () V!43481)

(declare-fun lt!512087 () ListLongMap!16283)

(declare-fun call!52429 () ListLongMap!16283)

(declare-fun c!113373 () Bool)

(declare-fun minValue!944 () V!43481)

(declare-fun c!113372 () Bool)

(declare-fun bm!52424 () Bool)

(declare-fun +!3598 (ListLongMap!16283 tuple2!18306) ListLongMap!16283)

(assert (=> bm!52424 (= call!52429 (+!3598 (ite c!113373 lt!512087 lt!512085) (ite c!113373 (tuple2!18307 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113372 (tuple2!18307 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18307 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun call!52430 () ListLongMap!16283)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13673 0))(
  ( (ValueCellFull!13673 (v!17072 V!43481)) (EmptyCell!13673) )
))
(declare-datatypes ((array!74425 0))(
  ( (array!74426 (arr!35857 (Array (_ BitVec 32) ValueCell!13673)) (size!36394 (_ BitVec 32))) )
))
(declare-fun lt!512093 () array!74425)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!52425 () Bool)

(declare-datatypes ((array!74427 0))(
  ( (array!74428 (arr!35858 (Array (_ BitVec 32) (_ BitVec 64))) (size!36395 (_ BitVec 32))) )
))
(declare-fun lt!512095 () array!74427)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4661 (array!74427 array!74425 (_ BitVec 32) (_ BitVec 32) V!43481 V!43481 (_ BitVec 32) Int) ListLongMap!16283)

(assert (=> bm!52425 (= call!52430 (getCurrentListMapNoExtraKeys!4661 lt!512095 lt!512093 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147112 () Bool)

(declare-fun res!763470 () Bool)

(declare-fun e!652622 () Bool)

(assert (=> b!1147112 (=> (not res!763470) (not e!652622))))

(declare-fun _keys!1208 () array!74427)

(declare-fun _values!996 () array!74425)

(assert (=> b!1147112 (= res!763470 (and (= (size!36394 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36395 _keys!1208) (size!36394 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1147113 () Bool)

(declare-fun e!652613 () Bool)

(declare-fun tp_is_empty!28765 () Bool)

(assert (=> b!1147113 (= e!652613 tp_is_empty!28765)))

(declare-fun b!1147114 () Bool)

(declare-fun e!652621 () Bool)

(assert (=> b!1147114 (= e!652621 tp_is_empty!28765)))

(declare-fun b!1147115 () Bool)

(declare-fun res!763465 () Bool)

(assert (=> b!1147115 (=> (not res!763465) (not e!652622))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1147115 (= res!763465 (validKeyInArray!0 k0!934))))

(declare-fun b!1147117 () Bool)

(declare-fun e!652612 () Bool)

(assert (=> b!1147117 (= e!652612 true)))

(assert (=> b!1147117 e!652624))

(declare-fun res!763462 () Bool)

(assert (=> b!1147117 (=> (not res!763462) (not e!652624))))

(declare-fun lt!512091 () V!43481)

(assert (=> b!1147117 (= res!763462 (= (-!1283 (+!3598 lt!512085 (tuple2!18307 (select (arr!35858 _keys!1208) from!1455) lt!512091)) (select (arr!35858 _keys!1208) from!1455)) lt!512085))))

(declare-datatypes ((Unit!37601 0))(
  ( (Unit!37602) )
))
(declare-fun lt!512089 () Unit!37601)

(declare-fun addThenRemoveForNewKeyIsSame!137 (ListLongMap!16283 (_ BitVec 64) V!43481) Unit!37601)

(assert (=> b!1147117 (= lt!512089 (addThenRemoveForNewKeyIsSame!137 lt!512085 (select (arr!35858 _keys!1208) from!1455) lt!512091))))

(declare-fun lt!512094 () V!43481)

(declare-fun get!18260 (ValueCell!13673 V!43481) V!43481)

(assert (=> b!1147117 (= lt!512091 (get!18260 (select (arr!35857 _values!996) from!1455) lt!512094))))

(declare-fun lt!512080 () Unit!37601)

(declare-fun e!652620 () Unit!37601)

(assert (=> b!1147117 (= lt!512080 e!652620)))

(declare-fun c!113375 () Bool)

(declare-fun contains!6697 (ListLongMap!16283 (_ BitVec 64)) Bool)

(assert (=> b!1147117 (= c!113375 (contains!6697 lt!512085 k0!934))))

(assert (=> b!1147117 (= lt!512085 (getCurrentListMapNoExtraKeys!4661 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!52433 () Unit!37601)

(declare-fun bm!52426 () Bool)

(declare-fun addStillContains!825 (ListLongMap!16283 (_ BitVec 64) V!43481 (_ BitVec 64)) Unit!37601)

(assert (=> bm!52426 (= call!52433 (addStillContains!825 (ite c!113373 lt!512087 lt!512085) (ite c!113373 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113372 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113373 minValue!944 (ite c!113372 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1147118 () Bool)

(declare-fun res!763463 () Bool)

(assert (=> b!1147118 (=> (not res!763463) (not e!652622))))

(declare-datatypes ((List!25062 0))(
  ( (Nil!25059) (Cons!25058 (h!26276 (_ BitVec 64)) (t!36281 List!25062)) )
))
(declare-fun arrayNoDuplicates!0 (array!74427 (_ BitVec 32) List!25062) Bool)

(assert (=> b!1147118 (= res!763463 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25059))))

(declare-fun b!1147119 () Bool)

(declare-fun e!652610 () Bool)

(declare-fun e!652615 () Bool)

(assert (=> b!1147119 (= e!652610 (not e!652615))))

(declare-fun res!763473 () Bool)

(assert (=> b!1147119 (=> res!763473 e!652615)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1147119 (= res!763473 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1147119 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!512082 () Unit!37601)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74427 (_ BitVec 64) (_ BitVec 32)) Unit!37601)

(assert (=> b!1147119 (= lt!512082 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1147120 () Bool)

(declare-fun e!652608 () Unit!37601)

(declare-fun lt!512084 () Unit!37601)

(assert (=> b!1147120 (= e!652608 lt!512084)))

(declare-fun call!52428 () Unit!37601)

(assert (=> b!1147120 (= lt!512084 call!52428)))

(declare-fun call!52431 () Bool)

(assert (=> b!1147120 call!52431))

(declare-fun b!1147121 () Bool)

(declare-fun e!652617 () Unit!37601)

(assert (=> b!1147121 (= e!652608 e!652617)))

(declare-fun c!113374 () Bool)

(declare-fun lt!512092 () Bool)

(assert (=> b!1147121 (= c!113374 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512092))))

(declare-fun b!1147122 () Bool)

(declare-fun res!763469 () Bool)

(assert (=> b!1147122 (=> (not res!763469) (not e!652622))))

(assert (=> b!1147122 (= res!763469 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36395 _keys!1208))))))

(declare-fun b!1147123 () Bool)

(assert (=> b!1147123 (contains!6697 call!52429 k0!934)))

(declare-fun lt!512078 () Unit!37601)

(assert (=> b!1147123 (= lt!512078 call!52433)))

(declare-fun call!52434 () Bool)

(assert (=> b!1147123 call!52434))

(assert (=> b!1147123 (= lt!512087 (+!3598 lt!512085 (tuple2!18307 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!512097 () Unit!37601)

(assert (=> b!1147123 (= lt!512097 (addStillContains!825 lt!512085 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!652614 () Unit!37601)

(assert (=> b!1147123 (= e!652614 lt!512078)))

(declare-fun b!1147124 () Bool)

(declare-fun e!652611 () Bool)

(assert (=> b!1147124 (= e!652615 e!652611)))

(declare-fun res!763467 () Bool)

(assert (=> b!1147124 (=> res!763467 e!652611)))

(assert (=> b!1147124 (= res!763467 (not (= from!1455 i!673)))))

(declare-fun lt!512086 () ListLongMap!16283)

(assert (=> b!1147124 (= lt!512086 (getCurrentListMapNoExtraKeys!4661 lt!512095 lt!512093 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1147124 (= lt!512093 (array!74426 (store (arr!35857 _values!996) i!673 (ValueCellFull!13673 lt!512094)) (size!36394 _values!996)))))

(declare-fun dynLambda!2690 (Int (_ BitVec 64)) V!43481)

(assert (=> b!1147124 (= lt!512094 (dynLambda!2690 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1147124 (= lt!512096 (getCurrentListMapNoExtraKeys!4661 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1147116 () Bool)

(assert (=> b!1147116 (= e!652622 e!652610)))

(declare-fun res!763472 () Bool)

(assert (=> b!1147116 (=> (not res!763472) (not e!652610))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74427 (_ BitVec 32)) Bool)

(assert (=> b!1147116 (= res!763472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512095 mask!1564))))

(assert (=> b!1147116 (= lt!512095 (array!74428 (store (arr!35858 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36395 _keys!1208)))))

(declare-fun res!763464 () Bool)

(assert (=> start!98866 (=> (not res!763464) (not e!652622))))

(assert (=> start!98866 (= res!763464 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36395 _keys!1208))))))

(assert (=> start!98866 e!652622))

(assert (=> start!98866 tp_is_empty!28765))

(declare-fun array_inv!27520 (array!74427) Bool)

(assert (=> start!98866 (array_inv!27520 _keys!1208)))

(assert (=> start!98866 true))

(assert (=> start!98866 tp!85416))

(declare-fun e!652623 () Bool)

(declare-fun array_inv!27521 (array!74425) Bool)

(assert (=> start!98866 (and (array_inv!27521 _values!996) e!652623)))

(declare-fun b!1147125 () Bool)

(declare-fun Unit!37603 () Unit!37601)

(assert (=> b!1147125 (= e!652617 Unit!37603)))

(declare-fun b!1147126 () Bool)

(declare-fun Unit!37604 () Unit!37601)

(assert (=> b!1147126 (= e!652620 Unit!37604)))

(assert (=> b!1147126 (= lt!512092 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1147126 (= c!113373 (and (not lt!512092) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512088 () Unit!37601)

(assert (=> b!1147126 (= lt!512088 e!652614)))

(declare-fun lt!512081 () Unit!37601)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!422 (array!74427 array!74425 (_ BitVec 32) (_ BitVec 32) V!43481 V!43481 (_ BitVec 64) (_ BitVec 32) Int) Unit!37601)

(assert (=> b!1147126 (= lt!512081 (lemmaListMapContainsThenArrayContainsFrom!422 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113371 () Bool)

(assert (=> b!1147126 (= c!113371 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763468 () Bool)

(declare-fun e!652619 () Bool)

(assert (=> b!1147126 (= res!763468 e!652619)))

(declare-fun e!652616 () Bool)

(assert (=> b!1147126 (=> (not res!763468) (not e!652616))))

(assert (=> b!1147126 e!652616))

(declare-fun lt!512098 () Unit!37601)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74427 (_ BitVec 32) (_ BitVec 32)) Unit!37601)

(assert (=> b!1147126 (= lt!512098 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1147126 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25059)))

(declare-fun lt!512090 () Unit!37601)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74427 (_ BitVec 64) (_ BitVec 32) List!25062) Unit!37601)

(assert (=> b!1147126 (= lt!512090 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25059))))

(assert (=> b!1147126 false))

(declare-fun b!1147127 () Bool)

(declare-fun mapRes!44972 () Bool)

(assert (=> b!1147127 (= e!652623 (and e!652613 mapRes!44972))))

(declare-fun condMapEmpty!44972 () Bool)

(declare-fun mapDefault!44972 () ValueCell!13673)

(assert (=> b!1147127 (= condMapEmpty!44972 (= (arr!35857 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13673)) mapDefault!44972)))))

(declare-fun b!1147128 () Bool)

(assert (=> b!1147128 (= e!652611 e!652612)))

(declare-fun res!763475 () Bool)

(assert (=> b!1147128 (=> res!763475 e!652612)))

(assert (=> b!1147128 (= res!763475 (not (= (select (arr!35858 _keys!1208) from!1455) k0!934)))))

(declare-fun e!652618 () Bool)

(assert (=> b!1147128 e!652618))

(declare-fun c!113376 () Bool)

(assert (=> b!1147128 (= c!113376 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!512083 () Unit!37601)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!531 (array!74427 array!74425 (_ BitVec 32) (_ BitVec 32) V!43481 V!43481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37601)

(assert (=> b!1147128 (= lt!512083 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!531 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147129 () Bool)

(declare-fun res!763466 () Bool)

(assert (=> b!1147129 (=> (not res!763466) (not e!652610))))

(assert (=> b!1147129 (= res!763466 (arrayNoDuplicates!0 lt!512095 #b00000000000000000000000000000000 Nil!25059))))

(declare-fun call!52427 () ListLongMap!16283)

(declare-fun bm!52427 () Bool)

(assert (=> bm!52427 (= call!52434 (contains!6697 (ite c!113373 lt!512087 call!52427) k0!934))))

(declare-fun mapNonEmpty!44972 () Bool)

(declare-fun tp!85415 () Bool)

(assert (=> mapNonEmpty!44972 (= mapRes!44972 (and tp!85415 e!652621))))

(declare-fun mapRest!44972 () (Array (_ BitVec 32) ValueCell!13673))

(declare-fun mapKey!44972 () (_ BitVec 32))

(declare-fun mapValue!44972 () ValueCell!13673)

(assert (=> mapNonEmpty!44972 (= (arr!35857 _values!996) (store mapRest!44972 mapKey!44972 mapValue!44972))))

(declare-fun bm!52428 () Bool)

(assert (=> bm!52428 (= call!52428 call!52433)))

(declare-fun b!1147130 () Bool)

(declare-fun res!763474 () Bool)

(assert (=> b!1147130 (=> (not res!763474) (not e!652622))))

(assert (=> b!1147130 (= res!763474 (= (select (arr!35858 _keys!1208) i!673) k0!934))))

(declare-fun b!1147131 () Bool)

(assert (=> b!1147131 (= e!652616 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147132 () Bool)

(assert (=> b!1147132 (= e!652619 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147133 () Bool)

(declare-fun res!763476 () Bool)

(assert (=> b!1147133 (=> (not res!763476) (not e!652622))))

(assert (=> b!1147133 (= res!763476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1147134 () Bool)

(assert (=> b!1147134 call!52431))

(declare-fun lt!512079 () Unit!37601)

(assert (=> b!1147134 (= lt!512079 call!52428)))

(assert (=> b!1147134 (= e!652617 lt!512079)))

(declare-fun bm!52429 () Bool)

(assert (=> bm!52429 (= call!52427 call!52429)))

(declare-fun b!1147135 () Bool)

(declare-fun res!763471 () Bool)

(assert (=> b!1147135 (=> (not res!763471) (not e!652622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1147135 (= res!763471 (validMask!0 mask!1564))))

(declare-fun bm!52430 () Bool)

(assert (=> bm!52430 (= call!52431 call!52434)))

(declare-fun mapIsEmpty!44972 () Bool)

(assert (=> mapIsEmpty!44972 mapRes!44972))

(declare-fun call!52432 () ListLongMap!16283)

(declare-fun bm!52431 () Bool)

(assert (=> bm!52431 (= call!52432 (getCurrentListMapNoExtraKeys!4661 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147136 () Bool)

(declare-fun Unit!37605 () Unit!37601)

(assert (=> b!1147136 (= e!652620 Unit!37605)))

(declare-fun b!1147137 () Bool)

(assert (=> b!1147137 (= e!652618 (= call!52430 (-!1283 call!52432 k0!934)))))

(declare-fun b!1147138 () Bool)

(assert (=> b!1147138 (= c!113372 (and (not lt!512092) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1147138 (= e!652614 e!652608)))

(declare-fun b!1147139 () Bool)

(assert (=> b!1147139 (= e!652619 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512092) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1147140 () Bool)

(assert (=> b!1147140 (= e!652618 (= call!52430 call!52432))))

(assert (= (and start!98866 res!763464) b!1147135))

(assert (= (and b!1147135 res!763471) b!1147112))

(assert (= (and b!1147112 res!763470) b!1147133))

(assert (= (and b!1147133 res!763476) b!1147118))

(assert (= (and b!1147118 res!763463) b!1147122))

(assert (= (and b!1147122 res!763469) b!1147115))

(assert (= (and b!1147115 res!763465) b!1147130))

(assert (= (and b!1147130 res!763474) b!1147116))

(assert (= (and b!1147116 res!763472) b!1147129))

(assert (= (and b!1147129 res!763466) b!1147119))

(assert (= (and b!1147119 (not res!763473)) b!1147124))

(assert (= (and b!1147124 (not res!763467)) b!1147128))

(assert (= (and b!1147128 c!113376) b!1147137))

(assert (= (and b!1147128 (not c!113376)) b!1147140))

(assert (= (or b!1147137 b!1147140) bm!52425))

(assert (= (or b!1147137 b!1147140) bm!52431))

(assert (= (and b!1147128 (not res!763475)) b!1147117))

(assert (= (and b!1147117 c!113375) b!1147126))

(assert (= (and b!1147117 (not c!113375)) b!1147136))

(assert (= (and b!1147126 c!113373) b!1147123))

(assert (= (and b!1147126 (not c!113373)) b!1147138))

(assert (= (and b!1147138 c!113372) b!1147120))

(assert (= (and b!1147138 (not c!113372)) b!1147121))

(assert (= (and b!1147121 c!113374) b!1147134))

(assert (= (and b!1147121 (not c!113374)) b!1147125))

(assert (= (or b!1147120 b!1147134) bm!52428))

(assert (= (or b!1147120 b!1147134) bm!52429))

(assert (= (or b!1147120 b!1147134) bm!52430))

(assert (= (or b!1147123 bm!52430) bm!52427))

(assert (= (or b!1147123 bm!52428) bm!52426))

(assert (= (or b!1147123 bm!52429) bm!52424))

(assert (= (and b!1147126 c!113371) b!1147132))

(assert (= (and b!1147126 (not c!113371)) b!1147139))

(assert (= (and b!1147126 res!763468) b!1147131))

(assert (= (and b!1147117 res!763462) b!1147111))

(assert (= (and b!1147127 condMapEmpty!44972) mapIsEmpty!44972))

(assert (= (and b!1147127 (not condMapEmpty!44972)) mapNonEmpty!44972))

(get-info :version)

(assert (= (and mapNonEmpty!44972 ((_ is ValueCellFull!13673) mapValue!44972)) b!1147114))

(assert (= (and b!1147127 ((_ is ValueCellFull!13673) mapDefault!44972)) b!1147113))

(assert (= start!98866 b!1147127))

(declare-fun b_lambda!19335 () Bool)

(assert (=> (not b_lambda!19335) (not b!1147124)))

(declare-fun t!36279 () Bool)

(declare-fun tb!9039 () Bool)

(assert (=> (and start!98866 (= defaultEntry!1004 defaultEntry!1004) t!36279) tb!9039))

(declare-fun result!18651 () Bool)

(assert (=> tb!9039 (= result!18651 tp_is_empty!28765)))

(assert (=> b!1147124 t!36279))

(declare-fun b_and!39323 () Bool)

(assert (= b_and!39321 (and (=> t!36279 result!18651) b_and!39323)))

(declare-fun m!1058233 () Bool)

(assert (=> b!1147128 m!1058233))

(declare-fun m!1058235 () Bool)

(assert (=> b!1147128 m!1058235))

(declare-fun m!1058237 () Bool)

(assert (=> b!1147126 m!1058237))

(declare-fun m!1058239 () Bool)

(assert (=> b!1147126 m!1058239))

(declare-fun m!1058241 () Bool)

(assert (=> b!1147126 m!1058241))

(declare-fun m!1058243 () Bool)

(assert (=> b!1147126 m!1058243))

(declare-fun m!1058245 () Bool)

(assert (=> b!1147131 m!1058245))

(declare-fun m!1058247 () Bool)

(assert (=> b!1147119 m!1058247))

(declare-fun m!1058249 () Bool)

(assert (=> b!1147119 m!1058249))

(declare-fun m!1058251 () Bool)

(assert (=> b!1147117 m!1058251))

(assert (=> b!1147117 m!1058233))

(declare-fun m!1058253 () Bool)

(assert (=> b!1147117 m!1058253))

(declare-fun m!1058255 () Bool)

(assert (=> b!1147117 m!1058255))

(assert (=> b!1147117 m!1058233))

(declare-fun m!1058257 () Bool)

(assert (=> b!1147117 m!1058257))

(declare-fun m!1058259 () Bool)

(assert (=> b!1147117 m!1058259))

(declare-fun m!1058261 () Bool)

(assert (=> b!1147117 m!1058261))

(assert (=> b!1147117 m!1058255))

(assert (=> b!1147117 m!1058233))

(assert (=> b!1147117 m!1058259))

(declare-fun m!1058263 () Bool)

(assert (=> b!1147117 m!1058263))

(declare-fun m!1058265 () Bool)

(assert (=> b!1147116 m!1058265))

(declare-fun m!1058267 () Bool)

(assert (=> b!1147116 m!1058267))

(declare-fun m!1058269 () Bool)

(assert (=> b!1147133 m!1058269))

(assert (=> b!1147132 m!1058245))

(declare-fun m!1058271 () Bool)

(assert (=> start!98866 m!1058271))

(declare-fun m!1058273 () Bool)

(assert (=> start!98866 m!1058273))

(declare-fun m!1058275 () Bool)

(assert (=> b!1147129 m!1058275))

(declare-fun m!1058277 () Bool)

(assert (=> b!1147137 m!1058277))

(declare-fun m!1058279 () Bool)

(assert (=> b!1147115 m!1058279))

(declare-fun m!1058281 () Bool)

(assert (=> b!1147123 m!1058281))

(declare-fun m!1058283 () Bool)

(assert (=> b!1147123 m!1058283))

(declare-fun m!1058285 () Bool)

(assert (=> b!1147123 m!1058285))

(declare-fun m!1058287 () Bool)

(assert (=> mapNonEmpty!44972 m!1058287))

(declare-fun m!1058289 () Bool)

(assert (=> b!1147135 m!1058289))

(declare-fun m!1058291 () Bool)

(assert (=> bm!52427 m!1058291))

(declare-fun m!1058293 () Bool)

(assert (=> bm!52424 m!1058293))

(declare-fun m!1058295 () Bool)

(assert (=> b!1147111 m!1058295))

(assert (=> bm!52431 m!1058251))

(declare-fun m!1058297 () Bool)

(assert (=> bm!52425 m!1058297))

(declare-fun m!1058299 () Bool)

(assert (=> bm!52426 m!1058299))

(declare-fun m!1058301 () Bool)

(assert (=> b!1147124 m!1058301))

(declare-fun m!1058303 () Bool)

(assert (=> b!1147124 m!1058303))

(declare-fun m!1058305 () Bool)

(assert (=> b!1147124 m!1058305))

(declare-fun m!1058307 () Bool)

(assert (=> b!1147124 m!1058307))

(declare-fun m!1058309 () Bool)

(assert (=> b!1147130 m!1058309))

(declare-fun m!1058311 () Bool)

(assert (=> b!1147118 m!1058311))

(check-sat (not b!1147123) (not b!1147132) (not b!1147129) (not b!1147117) (not b_lambda!19335) (not b_next!24235) (not b!1147115) (not b!1147118) (not b!1147126) (not b!1147111) (not b!1147135) tp_is_empty!28765 (not b!1147131) (not b!1147116) (not bm!52427) (not bm!52425) (not b!1147133) (not b!1147119) (not b!1147137) (not mapNonEmpty!44972) (not bm!52431) (not b!1147128) (not bm!52424) (not start!98866) (not bm!52426) b_and!39323 (not b!1147124))
(check-sat b_and!39323 (not b_next!24235))
