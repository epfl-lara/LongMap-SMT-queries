; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99278 () Bool)

(assert start!99278)

(declare-fun b_free!24857 () Bool)

(declare-fun b_next!24857 () Bool)

(assert (=> start!99278 (= b_free!24857 (not b_next!24857))))

(declare-fun tp!87284 () Bool)

(declare-fun b_and!40581 () Bool)

(assert (=> start!99278 (= tp!87284 b_and!40581)))

(declare-fun b!1169450 () Bool)

(declare-fun res!775985 () Bool)

(declare-fun e!664659 () Bool)

(assert (=> b!1169450 (=> (not res!775985) (not e!664659))))

(declare-datatypes ((array!75597 0))(
  ( (array!75598 (arr!36448 (Array (_ BitVec 32) (_ BitVec 64))) (size!36984 (_ BitVec 32))) )
))
(declare-fun lt!526598 () array!75597)

(declare-datatypes ((List!25569 0))(
  ( (Nil!25566) (Cons!25565 (h!26774 (_ BitVec 64)) (t!37418 List!25569)) )
))
(declare-fun arrayNoDuplicates!0 (array!75597 (_ BitVec 32) List!25569) Bool)

(assert (=> b!1169450 (= res!775985 (arrayNoDuplicates!0 lt!526598 #b00000000000000000000000000000000 Nil!25566))))

(declare-fun b!1169451 () Bool)

(declare-fun e!664660 () Bool)

(declare-fun e!664656 () Bool)

(assert (=> b!1169451 (= e!664660 e!664656)))

(declare-fun res!775984 () Bool)

(assert (=> b!1169451 (=> res!775984 e!664656)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1169451 (= res!775984 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44309 0))(
  ( (V!44310 (val!14750 Int)) )
))
(declare-fun minValue!944 () V!44309)

(declare-fun zeroValue!944 () V!44309)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18832 0))(
  ( (tuple2!18833 (_1!9427 (_ BitVec 64)) (_2!9427 V!44309)) )
))
(declare-datatypes ((List!25570 0))(
  ( (Nil!25567) (Cons!25566 (h!26775 tuple2!18832) (t!37419 List!25570)) )
))
(declare-datatypes ((ListLongMap!16801 0))(
  ( (ListLongMap!16802 (toList!8416 List!25570)) )
))
(declare-fun lt!526601 () ListLongMap!16801)

(declare-datatypes ((ValueCell!13984 0))(
  ( (ValueCellFull!13984 (v!17388 V!44309)) (EmptyCell!13984) )
))
(declare-datatypes ((array!75599 0))(
  ( (array!75600 (arr!36449 (Array (_ BitVec 32) ValueCell!13984)) (size!36985 (_ BitVec 32))) )
))
(declare-fun lt!526597 () array!75599)

(declare-fun getCurrentListMapNoExtraKeys!4880 (array!75597 array!75599 (_ BitVec 32) (_ BitVec 32) V!44309 V!44309 (_ BitVec 32) Int) ListLongMap!16801)

(assert (=> b!1169451 (= lt!526601 (getCurrentListMapNoExtraKeys!4880 lt!526598 lt!526597 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!75599)

(declare-fun lt!526595 () V!44309)

(assert (=> b!1169451 (= lt!526597 (array!75600 (store (arr!36449 _values!996) i!673 (ValueCellFull!13984 lt!526595)) (size!36985 _values!996)))))

(declare-fun dynLambda!2858 (Int (_ BitVec 64)) V!44309)

(assert (=> b!1169451 (= lt!526595 (dynLambda!2858 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!75597)

(declare-fun lt!526593 () ListLongMap!16801)

(assert (=> b!1169451 (= lt!526593 (getCurrentListMapNoExtraKeys!4880 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1169452 () Bool)

(declare-fun e!664650 () Bool)

(declare-fun tp_is_empty!29387 () Bool)

(assert (=> b!1169452 (= e!664650 tp_is_empty!29387)))

(declare-fun b!1169453 () Bool)

(declare-fun res!775983 () Bool)

(declare-fun e!664654 () Bool)

(assert (=> b!1169453 (=> (not res!775983) (not e!664654))))

(assert (=> b!1169453 (= res!775983 (and (= (size!36985 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36984 _keys!1208) (size!36985 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1169454 () Bool)

(assert (=> b!1169454 (= e!664659 (not e!664660))))

(declare-fun res!775987 () Bool)

(assert (=> b!1169454 (=> res!775987 e!664660)))

(assert (=> b!1169454 (= res!775987 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169454 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38584 0))(
  ( (Unit!38585) )
))
(declare-fun lt!526599 () Unit!38584)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75597 (_ BitVec 64) (_ BitVec 32)) Unit!38584)

(assert (=> b!1169454 (= lt!526599 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1169456 () Bool)

(declare-fun res!775982 () Bool)

(assert (=> b!1169456 (=> (not res!775982) (not e!664654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75597 (_ BitVec 32)) Bool)

(assert (=> b!1169456 (= res!775982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1169457 () Bool)

(declare-fun e!664652 () Bool)

(assert (=> b!1169457 (= e!664652 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1169458 () Bool)

(declare-fun e!664657 () Bool)

(declare-fun e!664658 () Bool)

(declare-fun mapRes!45908 () Bool)

(assert (=> b!1169458 (= e!664657 (and e!664658 mapRes!45908))))

(declare-fun condMapEmpty!45908 () Bool)

(declare-fun mapDefault!45908 () ValueCell!13984)

