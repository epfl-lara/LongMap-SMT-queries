; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99228 () Bool)

(assert start!99228)

(declare-fun b_free!24833 () Bool)

(declare-fun b_next!24833 () Bool)

(assert (=> start!99228 (= b_free!24833 (not b_next!24833))))

(declare-fun tp!87209 () Bool)

(declare-fun b_and!40515 () Bool)

(assert (=> start!99228 (= tp!87209 b_and!40515)))

(declare-fun b!1168655 () Bool)

(declare-fun e!664188 () Bool)

(declare-fun e!664186 () Bool)

(assert (=> b!1168655 (= e!664188 e!664186)))

(declare-fun res!775402 () Bool)

(assert (=> b!1168655 (=> res!775402 e!664186)))

(declare-datatypes ((array!75547 0))(
  ( (array!75548 (arr!36424 (Array (_ BitVec 32) (_ BitVec 64))) (size!36960 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75547)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168655 (= res!775402 (not (validKeyInArray!0 (select (arr!36424 _keys!1208) from!1455))))))

(declare-datatypes ((V!44277 0))(
  ( (V!44278 (val!14738 Int)) )
))
(declare-datatypes ((tuple2!18812 0))(
  ( (tuple2!18813 (_1!9417 (_ BitVec 64)) (_2!9417 V!44277)) )
))
(declare-datatypes ((List!25552 0))(
  ( (Nil!25549) (Cons!25548 (h!26757 tuple2!18812) (t!37377 List!25552)) )
))
(declare-datatypes ((ListLongMap!16781 0))(
  ( (ListLongMap!16782 (toList!8406 List!25552)) )
))
(declare-fun lt!526160 () ListLongMap!16781)

(declare-fun lt!526166 () ListLongMap!16781)

(assert (=> b!1168655 (= lt!526160 lt!526166)))

(declare-fun lt!526167 () ListLongMap!16781)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1478 (ListLongMap!16781 (_ BitVec 64)) ListLongMap!16781)

(assert (=> b!1168655 (= lt!526166 (-!1478 lt!526167 k!934))))

(declare-fun zeroValue!944 () V!44277)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13972 0))(
  ( (ValueCellFull!13972 (v!17375 V!44277)) (EmptyCell!13972) )
))
(declare-datatypes ((array!75549 0))(
  ( (array!75550 (arr!36425 (Array (_ BitVec 32) ValueCell!13972)) (size!36961 (_ BitVec 32))) )
))
(declare-fun lt!526161 () array!75549)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!526162 () array!75547)

(declare-fun minValue!944 () V!44277)

(declare-fun getCurrentListMapNoExtraKeys!4870 (array!75547 array!75549 (_ BitVec 32) (_ BitVec 32) V!44277 V!44277 (_ BitVec 32) Int) ListLongMap!16781)

(assert (=> b!1168655 (= lt!526160 (getCurrentListMapNoExtraKeys!4870 lt!526162 lt!526161 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75549)

(assert (=> b!1168655 (= lt!526167 (getCurrentListMapNoExtraKeys!4870 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38564 0))(
  ( (Unit!38565) )
))
(declare-fun lt!526164 () Unit!38564)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!705 (array!75547 array!75549 (_ BitVec 32) (_ BitVec 32) V!44277 V!44277 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38564)

(assert (=> b!1168655 (= lt!526164 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!705 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168656 () Bool)

(declare-fun e!664181 () Bool)

(declare-fun e!664182 () Bool)

(declare-fun mapRes!45869 () Bool)

(assert (=> b!1168656 (= e!664181 (and e!664182 mapRes!45869))))

(declare-fun condMapEmpty!45869 () Bool)

(declare-fun mapDefault!45869 () ValueCell!13972)

