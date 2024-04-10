; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99222 () Bool)

(assert start!99222)

(declare-fun b_free!24827 () Bool)

(declare-fun b_next!24827 () Bool)

(assert (=> start!99222 (= b_free!24827 (not b_next!24827))))

(declare-fun tp!87191 () Bool)

(declare-fun b_and!40503 () Bool)

(assert (=> start!99222 (= tp!87191 b_and!40503)))

(declare-fun b!1168505 () Bool)

(declare-fun e!664099 () Bool)

(declare-fun e!664107 () Bool)

(assert (=> b!1168505 (= e!664099 (not e!664107))))

(declare-fun res!775277 () Bool)

(assert (=> b!1168505 (=> res!775277 e!664107)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1168505 (= res!775277 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75535 0))(
  ( (array!75536 (arr!36418 (Array (_ BitVec 32) (_ BitVec 64))) (size!36954 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75535)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168505 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38558 0))(
  ( (Unit!38559) )
))
(declare-fun lt!526075 () Unit!38558)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75535 (_ BitVec 64) (_ BitVec 32)) Unit!38558)

(assert (=> b!1168505 (= lt!526075 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1168506 () Bool)

(declare-fun res!775280 () Bool)

(declare-fun e!664106 () Bool)

(assert (=> b!1168506 (=> (not res!775280) (not e!664106))))

(declare-datatypes ((List!25546 0))(
  ( (Nil!25543) (Cons!25542 (h!26751 (_ BitVec 64)) (t!37365 List!25546)) )
))
(declare-fun arrayNoDuplicates!0 (array!75535 (_ BitVec 32) List!25546) Bool)

(assert (=> b!1168506 (= res!775280 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25543))))

(declare-fun b!1168507 () Bool)

(assert (=> b!1168507 (= e!664106 e!664099)))

(declare-fun res!775279 () Bool)

(assert (=> b!1168507 (=> (not res!775279) (not e!664099))))

(declare-fun lt!526069 () array!75535)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75535 (_ BitVec 32)) Bool)

(assert (=> b!1168507 (= res!775279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526069 mask!1564))))

(assert (=> b!1168507 (= lt!526069 (array!75536 (store (arr!36418 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36954 _keys!1208)))))

(declare-fun b!1168508 () Bool)

(declare-fun e!664101 () Bool)

(declare-fun e!664102 () Bool)

(assert (=> b!1168508 (= e!664101 e!664102)))

(declare-fun res!775289 () Bool)

(assert (=> b!1168508 (=> res!775289 e!664102)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168508 (= res!775289 (not (validKeyInArray!0 (select (arr!36418 _keys!1208) from!1455))))))

(declare-datatypes ((V!44269 0))(
  ( (V!44270 (val!14735 Int)) )
))
(declare-datatypes ((tuple2!18806 0))(
  ( (tuple2!18807 (_1!9414 (_ BitVec 64)) (_2!9414 V!44269)) )
))
(declare-datatypes ((List!25547 0))(
  ( (Nil!25544) (Cons!25543 (h!26752 tuple2!18806) (t!37366 List!25547)) )
))
(declare-datatypes ((ListLongMap!16775 0))(
  ( (ListLongMap!16776 (toList!8403 List!25547)) )
))
(declare-fun lt!526068 () ListLongMap!16775)

(declare-fun lt!526076 () ListLongMap!16775)

(assert (=> b!1168508 (= lt!526068 lt!526076)))

(declare-fun lt!526070 () ListLongMap!16775)

(declare-fun -!1475 (ListLongMap!16775 (_ BitVec 64)) ListLongMap!16775)

(assert (=> b!1168508 (= lt!526076 (-!1475 lt!526070 k!934))))

(declare-fun zeroValue!944 () V!44269)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13969 0))(
  ( (ValueCellFull!13969 (v!17372 V!44269)) (EmptyCell!13969) )
))
(declare-datatypes ((array!75537 0))(
  ( (array!75538 (arr!36419 (Array (_ BitVec 32) ValueCell!13969)) (size!36955 (_ BitVec 32))) )
))
(declare-fun lt!526077 () array!75537)

(declare-fun minValue!944 () V!44269)

(declare-fun getCurrentListMapNoExtraKeys!4867 (array!75535 array!75537 (_ BitVec 32) (_ BitVec 32) V!44269 V!44269 (_ BitVec 32) Int) ListLongMap!16775)

(assert (=> b!1168508 (= lt!526068 (getCurrentListMapNoExtraKeys!4867 lt!526069 lt!526077 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75537)

(assert (=> b!1168508 (= lt!526070 (getCurrentListMapNoExtraKeys!4867 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!526071 () Unit!38558)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!702 (array!75535 array!75537 (_ BitVec 32) (_ BitVec 32) V!44269 V!44269 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38558)

(assert (=> b!1168508 (= lt!526071 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!702 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168509 () Bool)

(declare-fun res!775282 () Bool)

(assert (=> b!1168509 (=> (not res!775282) (not e!664099))))

(assert (=> b!1168509 (= res!775282 (arrayNoDuplicates!0 lt!526069 #b00000000000000000000000000000000 Nil!25543))))

(declare-fun b!1168510 () Bool)

(declare-fun res!775278 () Bool)

(assert (=> b!1168510 (=> (not res!775278) (not e!664106))))

(assert (=> b!1168510 (= res!775278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1168511 () Bool)

(declare-fun res!775284 () Bool)

(assert (=> b!1168511 (=> (not res!775284) (not e!664106))))

(assert (=> b!1168511 (= res!775284 (validKeyInArray!0 k!934))))

(declare-fun b!1168512 () Bool)

(declare-fun e!664104 () Bool)

(declare-fun tp_is_empty!29357 () Bool)

(assert (=> b!1168512 (= e!664104 tp_is_empty!29357)))

(declare-fun b!1168513 () Bool)

(declare-fun e!664105 () Bool)

(declare-fun mapRes!45860 () Bool)

(assert (=> b!1168513 (= e!664105 (and e!664104 mapRes!45860))))

(declare-fun condMapEmpty!45860 () Bool)

(declare-fun mapDefault!45860 () ValueCell!13969)

