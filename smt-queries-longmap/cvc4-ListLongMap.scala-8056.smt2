; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99180 () Bool)

(assert start!99180)

(declare-fun b_free!24785 () Bool)

(declare-fun b_next!24785 () Bool)

(assert (=> start!99180 (= b_free!24785 (not b_next!24785))))

(declare-fun tp!87066 () Bool)

(declare-fun b_and!40419 () Bool)

(assert (=> start!99180 (= tp!87066 b_and!40419)))

(declare-fun b!1167501 () Bool)

(declare-fun e!663582 () Bool)

(declare-fun e!663578 () Bool)

(assert (=> b!1167501 (= e!663582 e!663578)))

(declare-fun res!774513 () Bool)

(assert (=> b!1167501 (=> res!774513 e!663578)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167501 (= res!774513 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44213 0))(
  ( (V!44214 (val!14714 Int)) )
))
(declare-fun zeroValue!944 () V!44213)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18772 0))(
  ( (tuple2!18773 (_1!9397 (_ BitVec 64)) (_2!9397 V!44213)) )
))
(declare-datatypes ((List!25512 0))(
  ( (Nil!25509) (Cons!25508 (h!26717 tuple2!18772) (t!37289 List!25512)) )
))
(declare-datatypes ((ListLongMap!16741 0))(
  ( (ListLongMap!16742 (toList!8386 List!25512)) )
))
(declare-fun lt!525658 () ListLongMap!16741)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44213)

(declare-datatypes ((ValueCell!13948 0))(
  ( (ValueCellFull!13948 (v!17351 V!44213)) (EmptyCell!13948) )
))
(declare-datatypes ((array!75457 0))(
  ( (array!75458 (arr!36379 (Array (_ BitVec 32) ValueCell!13948)) (size!36915 (_ BitVec 32))) )
))
(declare-fun lt!525659 () array!75457)

(declare-datatypes ((array!75459 0))(
  ( (array!75460 (arr!36380 (Array (_ BitVec 32) (_ BitVec 64))) (size!36916 (_ BitVec 32))) )
))
(declare-fun lt!525662 () array!75459)

(declare-fun getCurrentListMapNoExtraKeys!4850 (array!75459 array!75457 (_ BitVec 32) (_ BitVec 32) V!44213 V!44213 (_ BitVec 32) Int) ListLongMap!16741)

(assert (=> b!1167501 (= lt!525658 (getCurrentListMapNoExtraKeys!4850 lt!525662 lt!525659 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!75457)

(declare-fun dynLambda!2832 (Int (_ BitVec 64)) V!44213)

(assert (=> b!1167501 (= lt!525659 (array!75458 (store (arr!36379 _values!996) i!673 (ValueCellFull!13948 (dynLambda!2832 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36915 _values!996)))))

(declare-fun lt!525661 () ListLongMap!16741)

(declare-fun _keys!1208 () array!75459)

(assert (=> b!1167501 (= lt!525661 (getCurrentListMapNoExtraKeys!4850 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167502 () Bool)

(declare-fun res!774515 () Bool)

(declare-fun e!663585 () Bool)

(assert (=> b!1167502 (=> (not res!774515) (not e!663585))))

(assert (=> b!1167502 (= res!774515 (and (= (size!36915 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36916 _keys!1208) (size!36915 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!45797 () Bool)

(declare-fun mapRes!45797 () Bool)

(declare-fun tp!87065 () Bool)

(declare-fun e!663581 () Bool)

(assert (=> mapNonEmpty!45797 (= mapRes!45797 (and tp!87065 e!663581))))

(declare-fun mapValue!45797 () ValueCell!13948)

(declare-fun mapRest!45797 () (Array (_ BitVec 32) ValueCell!13948))

(declare-fun mapKey!45797 () (_ BitVec 32))

(assert (=> mapNonEmpty!45797 (= (arr!36379 _values!996) (store mapRest!45797 mapKey!45797 mapValue!45797))))

(declare-fun b!1167503 () Bool)

(declare-fun e!663579 () Bool)

(assert (=> b!1167503 (= e!663579 (not e!663582))))

(declare-fun res!774511 () Bool)

(assert (=> b!1167503 (=> res!774511 e!663582)))

(assert (=> b!1167503 (= res!774511 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167503 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38524 0))(
  ( (Unit!38525) )
))
(declare-fun lt!525663 () Unit!38524)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75459 (_ BitVec 64) (_ BitVec 32)) Unit!38524)

(assert (=> b!1167503 (= lt!525663 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1167504 () Bool)

(declare-fun res!774508 () Bool)

(assert (=> b!1167504 (=> (not res!774508) (not e!663585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75459 (_ BitVec 32)) Bool)

(assert (=> b!1167504 (= res!774508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!774507 () Bool)

(assert (=> start!99180 (=> (not res!774507) (not e!663585))))

(assert (=> start!99180 (= res!774507 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36916 _keys!1208))))))

(assert (=> start!99180 e!663585))

(declare-fun tp_is_empty!29315 () Bool)

(assert (=> start!99180 tp_is_empty!29315))

(declare-fun array_inv!27812 (array!75459) Bool)

(assert (=> start!99180 (array_inv!27812 _keys!1208)))

(assert (=> start!99180 true))

(assert (=> start!99180 tp!87066))

(declare-fun e!663583 () Bool)

(declare-fun array_inv!27813 (array!75457) Bool)

(assert (=> start!99180 (and (array_inv!27813 _values!996) e!663583)))

(declare-fun b!1167505 () Bool)

(declare-fun e!663580 () Bool)

(assert (=> b!1167505 (= e!663580 tp_is_empty!29315)))

(declare-fun b!1167506 () Bool)

(declare-fun res!774514 () Bool)

(assert (=> b!1167506 (=> (not res!774514) (not e!663579))))

(declare-datatypes ((List!25513 0))(
  ( (Nil!25510) (Cons!25509 (h!26718 (_ BitVec 64)) (t!37290 List!25513)) )
))
(declare-fun arrayNoDuplicates!0 (array!75459 (_ BitVec 32) List!25513) Bool)

(assert (=> b!1167506 (= res!774514 (arrayNoDuplicates!0 lt!525662 #b00000000000000000000000000000000 Nil!25510))))

(declare-fun b!1167507 () Bool)

(assert (=> b!1167507 (= e!663578 true)))

(declare-fun -!1461 (ListLongMap!16741 (_ BitVec 64)) ListLongMap!16741)

(assert (=> b!1167507 (= (getCurrentListMapNoExtraKeys!4850 lt!525662 lt!525659 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1461 (getCurrentListMapNoExtraKeys!4850 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun lt!525660 () Unit!38524)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!688 (array!75459 array!75457 (_ BitVec 32) (_ BitVec 32) V!44213 V!44213 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38524)

(assert (=> b!1167507 (= lt!525660 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!688 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167508 () Bool)

(assert (=> b!1167508 (= e!663585 e!663579)))

(declare-fun res!774506 () Bool)

(assert (=> b!1167508 (=> (not res!774506) (not e!663579))))

(assert (=> b!1167508 (= res!774506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525662 mask!1564))))

(assert (=> b!1167508 (= lt!525662 (array!75460 (store (arr!36380 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36916 _keys!1208)))))

(declare-fun b!1167509 () Bool)

(declare-fun res!774509 () Bool)

(assert (=> b!1167509 (=> (not res!774509) (not e!663585))))

(assert (=> b!1167509 (= res!774509 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25510))))

(declare-fun mapIsEmpty!45797 () Bool)

(assert (=> mapIsEmpty!45797 mapRes!45797))

(declare-fun b!1167510 () Bool)

(declare-fun res!774504 () Bool)

(assert (=> b!1167510 (=> (not res!774504) (not e!663585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167510 (= res!774504 (validMask!0 mask!1564))))

(declare-fun b!1167511 () Bool)

(declare-fun res!774510 () Bool)

(assert (=> b!1167511 (=> (not res!774510) (not e!663585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167511 (= res!774510 (validKeyInArray!0 k!934))))

(declare-fun b!1167512 () Bool)

(assert (=> b!1167512 (= e!663583 (and e!663580 mapRes!45797))))

(declare-fun condMapEmpty!45797 () Bool)

(declare-fun mapDefault!45797 () ValueCell!13948)

